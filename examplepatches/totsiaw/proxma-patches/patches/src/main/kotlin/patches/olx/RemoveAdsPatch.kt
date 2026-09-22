package patches.olx

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.bytecodePatch

/**
 * EXPERIMENTAL / local-only, shape-matched to OLX 18.8.0.
 *
 * (1) Native feed ads (u57): force the ad-slot state getter u57.a() to DISCARDED (be.e) so the
 *     dispatcher (p87/q87) skips the whole slot — no ad, no placeholder box, no ad request.
 * (2) "Buy with Delivery" promo section: the grid builder h5b.c(List) pairs listings into y84 rows
 *     for the delivery section; return an empty list so no y84 items are inserted (removes the promo
 *     cards, the header bar and the View-all). Real search results (built elsewhere) are untouched.
 *     Also force the y84 header flag off as a belt-and-suspenders for any y84 built by another path.
 */
internal val adItemStateGetterFingerprint = Fingerprint(
    returnType = "Lbe;",
    parameters = listOf(),
    custom = { m, c -> c.type == "Lu57;" && m.name == "a" },
)

internal val deliveryGridBuilderFingerprint = Fingerprint(
    returnType = "Lx37;",
    parameters = listOf("Ljava/util/List;"),
    custom = { m, c -> c.type == "Lh5b;" && m.name == "c" },
)

internal val deliveryBarItemConstructorFingerprint = Fingerprint(
    returnType = "V",
    parameters = listOf("Z", "Z", "Ln67;", "Ln67;"),
    custom = { m, c -> c.type == "Ly84;" && m.name == "<init>" },
)

internal val largeAdItemConstructorFingerprint = Fingerprint(
    returnType = "V",
    parameters = listOf("Lif8;"),
    custom = { m, c -> c.type == "Ldf6;" && m.name == "<init>" },
)

@Suppress("unused")
val removeAdsPatch = bytecodePatch(
    name = "Remove ads",
    description = "Removes native feed ads (Google GMA), the full-height ad slot, and the " +
        "\"Buy with Delivery\" promo section (bar, cards and View all) from OLX. " +
        "Pinned to the 18.8.0 build (matches that build's obfuscated feed classes).",
) {
    compatibleWith(COMPATIBILITY_OLX)

    execute {
        // (1) ad slots -> DISCARDED
        val getter = adItemStateGetterFingerprint.method
        val beType = getter.returnType
        getter.addInstructions(0, "sget-object v0, $beType->e:$beType\nreturn-object v0")

        // (2a) delivery promo grid builder -> empty list
        deliveryGridBuilderFingerprint.method.addInstructions(
            0,
            """
                invoke-static {}, Liqe;->y()Lx37;
                move-result-object v0
                invoke-static {v0}, Liqe;->w(Ljava/util/List;)Lx37;
                move-result-object v0
                return-object v0
            """.trimIndent(),
        )

        // (2b) belt-and-suspenders: any y84 that still gets built has its header flag forced off
        deliveryBarItemConstructorFingerprint.method.addInstructions(0, "const/4 p1, 0x0")

        // (3) the large single ad slot (df6, inserted once): rebuild its state field as DISCARDED
        //     (be.e) at the end of its constructor so the dispatcher skips the whole full-height slot.
        val df6Ctor = largeAdItemConstructorFingerprint.method
        df6Ctor.addInstructions(
            df6Ctor.instructions.size - 1,
            """
                sget-object p1, Lbe;->e:Lbe;
                invoke-static {p1}, Ljod;->f(Ljava/lang/Object;)Ldb9;
                move-result-object p1
                iput-object p1, p0, Ldf6;->b:Ldb9;
            """.trimIndent(),
        )
    }
}

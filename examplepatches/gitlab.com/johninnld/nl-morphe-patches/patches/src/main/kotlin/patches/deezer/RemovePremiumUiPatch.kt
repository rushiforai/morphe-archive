package patches.deezer

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference

internal data class PremiumUi2703Target(
    val owner: String, val name: String, val dataType: String,
    val reference: String, val marker: String? = null,
) {
    val parameters get() = listOf(dataType, "Lkotlin/jvm/functions/Function0;",
        "LllIIlIlIlllllII;", "LIIIlIIIIlIIlIII;", "I")
}

/** Dedicated promotional children; keep their surrounding account/settings UI intact. */
internal val premiumUi2703Targets = listOf(
    PremiumUi2703Target("LIlllIIlIlIlII;", "lIIIIIlllIlIll", "LIIlIIllIllI;",
        "LIIllIlllllIlIl;", "get-premium"),
    PremiumUi2703Target("LIlllllIIIIIIIIII;", "IIlIlIlIlIllllll", "LllIIIIIllIlIIIl;",
        "LIlIIlIIIIlIIIIll;-><init>(LllIIIIIllIlIIIl;LllIIlIlIlllllII;Lkotlin/jvm/functions/Function0;)V"),
)

internal fun hidePremiumUi2703(method: MutableMethod) {
    val target = premiumUi2703Targets.singleOrNull {
        method.definingClass == it.owner && method.name == it.name && method.returnType == "V" &&
            method.parameterTypes.map(CharSequence::toString) == it.parameters
    } ?: error("Deezer cosmetic premium renderer changed")
    val code = method.instructions.toList()
    check(code.isNotEmpty() && code.first().opcode != Opcode.RETURN_VOID) {
        "Deezer cosmetic premium renderer already hidden or changed"
    }
    check(code.any { (it as? ReferenceInstruction)?.reference?.toString() == target.reference } &&
        (target.marker == null || code.any {
            ((it as? ReferenceInstruction)?.reference as? StringReference)?.string == target.marker
        })) { "Deezer cosmetic premium renderer evidence changed" }
    // Return before entering the child's Compose group. No account data, plan labels,
    // billing routes, sign-in callbacks, eligibility predicates or parent groups change.
    method.addInstructions(0, "return-void")
}

@Suppress("unused")
val deezerRemovePremiumUi = bytecodePatch(
    name = "Remove premium upsell UI",
    description = "Removes the Premium navigation item, profile promotion, Settings conversion banner " +
        "and Plan management row, the Downloaded music subscription banner and Listen without ads menu entries, " +
        "and displays the free plan as Deezer Premium. " +
        "Account and playback transport are unchanged.",
    default = true,
) {
    compatibleWith(deezer)
    dependsOn(deezerBase, deezerNativeOfferFilters)
    execute {
        hideDownloadedMusicOffer(exact("LlIIlIIllIIIllI;", "invokeSuspend", "Ljava/lang/Object;",
            "Ljava/lang/Object;").method)
        mutableClassDefBy(OFFER_ENTRIES).methods.single { it.name == HIDE_ADS_FREE_OFFER }
            .replaceInstruction(0, "const/4 v0, 0x1")
        val tabs = exact("LlllIIIIllllllIl;", "build", "LIIIIlIIIlIlIIIIl;").method
        val createTabs = tabs.instructions.indexOfFirst {
            it.opcode == Opcode.NEW_INSTANCE &&
                (it as? ReferenceInstruction)?.reference?.toString() == "LIIIIlIIIlIlIIIIl;"
        }
        check(createTabs >= 0) { "Deezer tab model builder changed" }
        // The menu builder's final return can be reached without our appended
        // removeItem. Filter the shared model before any navigation view uses it.
        tabs.addInstructions(createTabs, """
            const-string v0, "PREMIUM"
            invoke-static {v0}, LIIIlIIlllIlll;->valueOf(Ljava/lang/String;)LIIIlIIlllIlll;
            move-result-object v0
            invoke-virtual {v1, v0}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z
        """)
        exact("LIIIlIllIlIIllIlI;", "<init>", "V", "Z", "Z", "LllIlIllIlIIIlll;",
            "LllIIIIIllIlIIIl;", "Z").method.addInstructions(1, "const/4 p1, 0x0")
        exact("LIlIIIIIlllIlIll;", "<init>", "V", "Ljava/lang/CharSequence;").method.addInstructions(0, """
            invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;
            move-result-object v0
            const-string v1, "Deezer Free"
            invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
            move-result v0
            if-eqz v0, :morphe_keep_plan_name
            const-string p1, "Deezer Premium"
            :morphe_keep_plan_name
        """)

        premiumUi2703Targets.forEach { target ->
            hidePremiumUi2703(exact(target.owner, target.name, "V", *target.parameters.toTypedArray()).method)
        }
    }
}

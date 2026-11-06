package app.template.patches.pinterest

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.PINTEREST_COMPATIBILITY
import app.template.patches.shared.clearBody

/**
 * Pinterest blends promoted (sponsored) Pins into every list response; every
 * pin list the app draws passes the deserialization choke
 * PinDeserializer.a(Ltm0/a;)Ljava/util/List;, which per item checks
 * type=="pin", parses via f(), and List.add()s the result.
 *
 * Mechanism history (crucial):
 * - v1.10.0/v1.10.1: instruction-text searches too fragile for dexlib2
 *   rendering; never matched on-device.
 * - v1.10.2-v1.10.4: tail-injected a filter loop before return. Patched fine,
 *   but Morphe's device-side assembler DROPPED the injected label definitions
 *   and re-bound the injected gotos to the original method's preexisting
 *   labels by name (:halo_filter_loop -> :goto_0 at method start...), mangling
 *   control flow -> app crashed when the first feed list was parsed
 *   (forensically proven on the user's exported patched APK).
 *
 * Correct construct therefore: NEVER inject label-bearing text into a method
 * that already contains labels. Instead clearBody() the whole method (labels
 * included) and author the method body in full here, with one fused guard:
 * pins for which Z5() ("is_promoted") resolves to Boolean.TRUE skip the
 * List.add. Every label in the authored body has a virgin pool; nothing can
 * alias. Registry/type discipline mirrors the original build exactly
 * (v0 list, v1 size, v2 false, v3 index, v4 item scratch, v5 flag scratch).
 *
 * The consumer entry is the app-wide contract: all feeds invoke
 * Lqn0/b;->a(Ltm0/a;) (interface impl'd HERE) - see InterestsFeed /
 * BoardFeed / PinFeed etc. Verified against 14.41.0 (vc 14418020).
 */
@Suppress("unused")
val removePromotedPinsPatch = bytecodePatch(
    name = "Ad-free feed (remove promoted Pins)",
    description = "Removes promoted/sponsored Pins from every feed, search result, and board list " +
        "during deserialization, so they never render. Organic pinning, boards and saving are " +
        "unaffected.",
    default = true,
) {
    compatibleWith(PINTEREST_COMPATIBILITY)

    execute {
        val method = Fingerprint(
            definingClass = "Lcom/pinterest/api/model/deserializer/PinDeserializer;",
            name = "a",
            returnType = "Ljava/util/List;",
            parameters = listOf("Ltm0/a;"),
        ).method

        // Full-body rewrite: virgin label pool; promoted pins skip the add.
        method.clearBody()
        method.addInstructionsWithLabels(
            0,
            """
                invoke-virtual { p1 }, Ljava/lang/Object;->getClass()Ljava/lang/Class;
                new-instance v0, Ljava/util/ArrayList;
                invoke-direct { v0 }, Ljava/util/ArrayList;-><init>()V
                invoke-virtual { p1 }, Ltm0/a;->d()I
                move-result v1
                const/4 v2, 0x0
                move v3, v2
                :hf_loop
                if-ge v3, v1, :hf_done
                invoke-virtual { p1, v3 }, Ltm0/a;->j(I)Ltm0/c;
                move-result-object v4
                invoke-virtual { v4 }, Ltm0/c;->e()Z
                move-result v5
                if-eqz v5, :hf_type
                goto :hf_next
                :hf_type
                const-string v5, "type"
                invoke-virtual { v4, v5 }, Ltm0/c;->c(Ljava/lang/String;)Ljava/lang/String;
                move-result-object v4
                const-string v5, "pin"
                invoke-static { v4, v5 }, Lkotlin/jvm/internal/Intrinsics;->e(Ljava/lang/Object;Ljava/lang/Object;)Z
                move-result v4
                if-nez v4, :hf_parse
                goto :hf_next
                :hf_parse
                invoke-virtual { p1, v3 }, Ltm0/a;->j(I)Ltm0/c;
                move-result-object v4
                invoke-virtual { p0, v4, v2, v2 }, Lcom/pinterest/api/model/deserializer/PinDeserializer;->f(Ltm0/c;ZZ)Lcom/pinterest/api/model/pe;
                move-result-object v4
                invoke-virtual { v4 }, Lcom/pinterest/api/model/pe;->Z5()Ljava/lang/Boolean;
                move-result-object v5
                if-eqz v5, :hf_add
                invoke-virtual { v5 }, Ljava/lang/Boolean;->booleanValue()Z
                move-result v5
                if-nez v5, :hf_add
                goto :hf_next
                :hf_add
                invoke-interface { v0, v4 }, Ljava/util/List;->add(Ljava/lang/Object;)Z
                :hf_next
                add-int/lit8 v3, v3, 0x1
                goto :hf_loop
                :hf_done
                iget-object p0, p0, Lcom/pinterest/api/model/deserializer/PinDeserializer;->c:Lj70/f;
                invoke-virtual { p0, v0 }, Lj70/f;->a(Ljava/util/List;)V
                return-object v0
            """.trimIndent(),
        )
    }
}

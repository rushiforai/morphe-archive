package app.ais.patches

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.removeInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction35c
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableMethodReference

/**
 * The site data endpoints (`v9/sites/{sitetag}/data`, `/related`, `/tags`,
 * `/stream`, `/extra`) take an `isTV` query parameter that is computed at
 * every call site from the runtime TV detection (`dp0.a(Context)`).
 * The server PRO-gates requests with `isTV=true`, so TV browsing fails with
 * the server-sent "It seems you are not a PRO User!" error, while the same
 * endpoints work anonymously with `isTV=false` (phone behavior, verified).
 *
 * Force `isTV = false` in the three request lambdas (`fp4` = site data +
 * related videos, `r31` = tags + stream, `wj7` = extrasite). Only the
 * request parameter changes — UI TV detection elsewhere is untouched, so
 * the TV layout is preserved and the responses parse into the same models.
 */
object TvSiteDataLambdaFingerprint : Fingerprint(
    definingClass = "Lfp4;",
    name = "apply",
    returnType = "Ljava/lang/Object;"
)

object TvTagsStreamLambdaFingerprint : Fingerprint(
    definingClass = "Lr31;",
    name = "apply",
    returnType = "Ljava/lang/Object;"
)

object TvExtraLambdaFingerprint : Fingerprint(
    definingClass = "Lwj7;",
    name = "apply",
    returnType = "Ljava/lang/Object;"
)

/**
 * `SiteInfoRequest.pornTabs = true` (only the TV site screen sends it) makes
 * the server PRO-gate `v9/sites/{sitetag}/info`, `/link` and `/categories`
 * with the "not a PRO User" HTTP 403. Force it to false everywhere so the
 * TV site screen uses the same single-site request the mobile UI sends.
 */
object TvSiteInfoRequestCtorFingerprint : Fingerprint(
    definingClass = "Lcom/streamdev/aiostreamer/datatypes/site/SiteInfoRequest;",
    name = "<init>",
    parameters = listOf("Ljava/lang/String;", "Lcom/streamdev/aiostreamer/filters/StandardFilter;", "Z", "Z")
)

object VideoPornstarsGetterFingerprint : Fingerprint(
    definingClass = "Lcom/streamdev/aiostreamer/datatypes/sites/VideoInformation;",
    name = "getPornstars"
)

object SiteInfoToStringFingerprint : Fingerprint(
    definingClass = "Lcom/streamdev/aiostreamer/datatypes/site/SiteInfoRequest;",
    name = "toString"
)

@Suppress("unused")
val tvDataIsTvPatch = bytecodePatch(
    name = "Bypass TV PRO check on site browsing",
    description = "Requests site video data with isTV=false so browsing sites on the TV UI does not require a PRO membership server-side.",
    default = true
) {
    compatibleWith(Constants.COMPATIBILITY_APP)

    execute {
        for ((fp, expected) in mapOf(
            TvSiteDataLambdaFingerprint to 2,
            TvTagsStreamLambdaFingerprint to 2,
            TvExtraLambdaFingerprint to 1
        )) {
            val method = fp.method
            val instrs = method.implementation!!.instructions
            var patched = 0
            for (i in 0 until instrs.size - 1) {
                val ref = (instrs[i] as? ReferenceInstruction)?.reference as? MethodReference
                if (ref?.definingClass == "Ldp0;" && ref.name == "a" &&
                    instrs[i + 1].opcode == Opcode.MOVE_RESULT
                ) {
                    val reg = method.getInstruction<OneRegisterInstruction>(i + 1).registerA
                    method.replaceInstruction(i + 1, "const/4 v$reg, 0x0")
                    patched++
                }
            }
            check(patched == expected) { "${fp.definingClass}.apply: expected $expected isTV call sites, found $patched" }
        }

        // SiteInfoRequest ctor: force pornTabs=false (server 403s pornTabs=true)
        // and default a null filter (the TV site screen passes no filter; the
        // server rejects the resulting body on /link with "not logged in").
        // ponytail: p3=0 (pornTabs) is always-safe (only the TV site screen sends
        // true). The null-filter→StandardFilter default must NOT hit the phone
        // (it broke the phone's search tracker flow), so gate it on the runtime
        // uimode check: p2 is reused as scratch only while it is null; non-TV
        // devices get null restored. uiMode&0xF==4 ⇔ UI_MODE_TYPE_TELEVISION —
        // misses TVs that report normal uimode, acceptable ceiling.
        val sirMethod = TvSiteInfoRequestCtorFingerprint.method
        sirMethod.addInstructionsWithLabels(
            0,
            """
                if-nez p2, :cond_sir_end
                invoke-static {}, Landroid/content/res/Resources;->getSystem()Landroid/content/res/Resources;
                move-result-object p2
                invoke-virtual {p2}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;
                move-result-object p2
                iget p2, p2, Landroid/content/res/Configuration;->uiMode:I
                and-int/lit8 p2, p2, 0xf
                add-int/lit8 p2, p2, -0x4
                if-nez p2, :cond_sir_null
                new-instance p2, Lcom/streamdev/aiostreamer/filters/StandardFilter;
                invoke-direct {p2}, Lcom/streamdev/aiostreamer/filters/StandardFilter;-><init>()V
                goto/16 :cond_sir_end
                :cond_sir_null
                const/4 p2, 0x0
                :cond_sir_end
                const/4 p3, 0x0
            """
        )

        // The pornTabs=false responses omit some VideoInformation lists (e.g.
        // pornstars); the TV grid adapter calls isEmpty() on them unguarded.
        // Make the getter null-safe for every caller.
        VideoPornstarsGetterFingerprint.method.addInstructions(
            0,
            """
                iget-object v0, p0, Lcom/streamdev/aiostreamer/datatypes/sites/VideoInformation;->pornstars:Ljava/util/List;
                if-eqz v0, :cond_vp
                return-object v0
                :cond_vp
                sget-object v0, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;
                return-object v0
            """
        )

        // The TV site screen constructs SiteInfoRequest with a null filter
        // (the mobile UI always passes one); SIR.toString() then NPEs on the
        // unguarded StandardFilter.toString() and kills the okhttp dispatcher
        // thread. Route it through StringBuilder.append(Object) instead, which
        // is null-safe (prints "null").
        val toStringMethod = SiteInfoToStringFingerprint.method
        val tsInstrs = toStringMethod.implementation!!.instructions
        val filterToString = tsInstrs.indexOfFirst { instr ->
            val ref = (instr as? ReferenceInstruction)?.reference as? MethodReference
            ref?.definingClass == "Lcom/streamdev/aiostreamer/filters/StandardFilter;" &&
                ref.name == "toString"
        }
        check(filterToString >= 0) { "SiteInfoRequest.toString: StandardFilter.toString call not found" }
        val appendInstr = toStringMethod.getInstruction<FiveRegisterInstruction>(filterToString + 2)
        toStringMethod.removeInstructions(filterToString, 2)
        toStringMethod.replaceInstruction(
            filterToString,
            BuilderInstruction35c(
                Opcode.INVOKE_VIRTUAL,
                2,
                appendInstr.registerC,
                appendInstr.registerD,
                appendInstr.registerE,
                appendInstr.registerF,
                appendInstr.registerG,
                ImmutableMethodReference(
                    "Ljava/lang/StringBuilder;",
                    "append",
                    listOf("Ljava/lang/Object;"),
                    "Ljava/lang/StringBuilder;"
                )
            )
        )
    }
}

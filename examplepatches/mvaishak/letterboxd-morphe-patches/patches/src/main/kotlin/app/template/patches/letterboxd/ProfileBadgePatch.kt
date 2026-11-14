package app.template.patches.letterboxd

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction

private const val HEADER = "Lcom/letterboxd/letterboxd/ui/fragments/member/MemberHeaderFragment;"
private const val MEMBER = "Lcom/letterboxd/api/model/Member;"
private const val HOOK = "Lapp/template/extension/settings/ProfileBadge;"

private val applyMember = Fingerprint(
    definingClass = HEADER,
    name = "applyMember",
    returnType = "V",
    parameters = listOf(MEMBER),
)

@Suppress("unused")
val profileBadgePatch = bytecodePatch(
    name = "Profile badge",
    description = "Preview a Pro, Patron, or custom badge on your own profile on this device.",
    default = false,
) {
    compatibleWith(
        Compatibility(
            name = "Letterboxd",
            packageName = "com.letterboxd.letterboxd",
            apkFileType = ApkFileType.APK,
            targets = listOf(AppTarget(version = "3.6.7")),
        ),
    )
    dependsOn(modSettingsPatch)

    execute {
        LetterboxdApplicationOnCreateFingerprint.method.addInstruction(0, "invoke-static {}, $HOOK->enable()V")
        val method = applyMember.method
        val statusCall = method.implementation!!.instructions.withIndex().singleOrNull { (_, instruction) ->
            (instruction as? ReferenceInstruction)?.reference?.toString()?.startsWith(
                "$HEADER->configureMemberStatus(",
            ) == true
        } ?: throw PatchException("Could not find the profile badge binding.")
        method.addInstruction(
            statusCall.index + 1,
            "invoke-static/range {p0 .. p1}, $HOOK->apply(Landroidx/fragment/app/Fragment;Ljava/lang/Object;)V",
        )
    }
}

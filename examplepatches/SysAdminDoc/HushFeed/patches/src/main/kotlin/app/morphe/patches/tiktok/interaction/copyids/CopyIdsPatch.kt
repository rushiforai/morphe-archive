/*
 * Copyright 2026 Hushfeed contributors
 * https://github.com/SysAdminDoc/hushfeed
 */
package app.morphe.patches.tiktok.interaction.copyids

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.patches.tiktok.interaction.sharesheet.ShareSnapshotFingerprint
import app.morphe.patches.tiktok.interaction.sharesheet.resolveSharePanel
import app.morphe.patches.tiktok.misc.extension.sharedExtensionPatch
import app.morphe.patches.tiktok.misc.settings.SettingsStatusLoadFingerprint
import app.morphe.patches.tiktok.misc.settings.settingsPatch
import app.morphe.util.addInstruction
import app.morphe.util.addInstructions
import app.morphe.util.findMutableMethodOf
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Field

private const val EXTENSION = "Lapp/morphe/extension/tiktok/interaction/CopyIds;"
internal const val SIGNATURE_COMPONENT =
    "Lcom/ss/android/ugc/profile/platform/business/header/business/bio/business/signature/base/ProfileHeaderBaseSignatureComponent;"
internal const val TUX_TEXT_VIEW = "Lcom/bytedance/tux/input/TuxTextView;"
internal const val BASE_SHARE_PACKAGE = "Lcom/ss/android/ugc/aweme/share/base/model/BaseSharePackage;"
internal const val SHARE_PANEL_MARKER = "share_panel_action"

/**
 * The profile header's bio bind, handed the signature and its extra spans: `Q53` on 47.0.3, `D73`
 * on 47.1.3 and 47.1.4. It's the item's one public (String, List) method returning nothing.
 */
internal object BioBindFingerprint : Fingerprint(
    definingClass = SIGNATURE_COMPONENT,
    accessFlags = listOf(AccessFlags.PUBLIC),
    returnType = "V",
    parameters = listOf("Ljava/lang/String;", "Ljava/util/List;"),
)

/** The text view the bio item draws its signature in: its one TuxTextView field. */
internal fun ClassDef.bioTextField(): Field? = fields.singleOrNull {
    !AccessFlags.STATIC.isSet(it.accessFlags) && it.type == TUX_TEXT_VIEW
}

/** The share model builder's one BaseSharePackage field, the package the sheet is built from. */
internal fun ClassDef.sharePackageField(): Field? = fields.singleOrNull {
    !AccessFlags.STATIC.isSet(it.accessFlags) && it.type == BASE_SHARE_PACKAGE
}

@Suppress("unused")
val copyIdsPatch = bytecodePatch(
    name = "Copy bio and IDs",
    description = "Long-press a profile's bio to copy it. A profile's share sheet, the one its menu opens, gets buttons that copy its username and numeric user ID, and a video's share sheet gets one that copies the video ID. Account facts, off by default, adds a profile button that shows when the account joined, its region and when its names last changed, from what TikTok already sent. Switches: Hushfeed settings > App.",
    default = true,
) {
    category("Interaction")
    dependsOn(settingsPatch, sharedExtensionPatch)
    compatibleWith(*AppCompatibilities.tiktok())

    execute {
        SettingsStatusLoadFingerprint.method.addInstruction(
            0,
            "invoke-static {}, Lapp/morphe/extension/tiktok/settings/SettingsStatus;->enableCopyIds()V",
        )

        val bioText = classDefBy(SIGNATURE_COMPONENT).bioTextField()
            ?: throw PatchException("Copy bio and IDs: $SIGNATURE_COMPONENT has no single text view field.")
        BioBindFingerprint.method.apply {
            // p0 and p1 are copied down first, so a larger frame can't push them past v15.
            if (implementation!!.registerCount - 3 < 2) {
                throw PatchException("Copy bio and IDs: the bio bind has no two free registers.")
            }
            addInstructions(
                0,
                """
                    move-object/from16 v0, p0
                    iget-object v0, v0, $SIGNATURE_COMPONENT->${bioText.name}:$TUX_TEXT_VIEW
                    move-object/from16 v1, p1
                    invoke-static { v0, v1 }, $EXTENSION->onBio(Landroid/view/View;Ljava/lang/String;)V
                """,
            )
        }

        // The share model's constructor, before its super call: only p1, the builder, is read.
        ShareSnapshotFingerprint.method.apply {
            val builder = parameterTypes.single().toString()
            val packageField = classDefBy(builder).sharePackageField()
                ?: throw PatchException("Copy bio and IDs: $builder holds no single BaseSharePackage.")
            if (implementation!!.registerCount - 2 < 1) {
                throw PatchException("Copy bio and IDs: the share model has no free register.")
            }
            addInstructions(
                0,
                """
                    move-object/from16 v0, p1
                    iget-object v0, v0, $builder->${packageField.name}:$BASE_SHARE_PACKAGE
                    invoke-static { v0 }, $EXTENSION->onSharePackage(Ljava/lang/Object;)V
                """,
            )
        }

        val panel = resolveSharePanel(classDefByStrings(SHARE_PANEL_MARKER))
        mutableClassDefBy(panel.definingClass).findMutableMethodOf(panel).addInstruction(
            0,
            "invoke-static/range { p0 .. p0 }, $EXTENSION->onSharePanel(Landroid/view/View;)V",
        )
    }
}

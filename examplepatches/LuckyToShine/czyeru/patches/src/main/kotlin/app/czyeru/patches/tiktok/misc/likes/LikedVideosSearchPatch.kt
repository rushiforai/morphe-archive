package app.czyeru.patches.tiktok.misc.likes

import app.czyeru.patches.shared.compat.AppCompatibilities
import app.czyeru.patches.tiktok.misc.extension.sharedExtensionPatch
import app.czyeru.patches.tiktok.misc.settings.SettingsStatusLoadFingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode

private const val EXTENSION_CLASS_DESCRIPTOR =
    "Lapp/czyeru/extension/tiktok/likes/LikedVideosSearchPatch;"

private const val SETTINGS_STATUS_DESCRIPTOR =
    "Lapp/czyeru/extension/tiktok/settings/SettingsStatus;"

/** Profile video list fragment base class. Holds the list in its only RecyclerView field. */
private const val LIST_FRAGMENT_DESCRIPTOR =
    "Lcom/ss/android/ugc/profile/platform/framework/aweme/profile/tab/profiletab/" +
        "ProfileBaseAwemeListFragment;"

private const val RECYCLER_VIEW_DESCRIPTOR = "Landroidx/recyclerview/widget/RecyclerView;"

@Suppress("unused")
val likedVideosSearchPatch = bytecodePatch(
    name = "Liked videos search",
    description = "Adds an option to show a search bar on the liked videos page " +
        "that filters loaded videos by description or creator.",
    default = true,
) {
    dependsOn(sharedExtensionPatch)

    compatibleWith(*AppCompatibilities.tiktok())

    execute {
        SettingsStatusLoadFingerprint.method.addInstruction(
            0,
            "invoke-static {}, $SETTINGS_STATUS_DESCRIPTOR->enableLikedVideosSearch()V",
        )

        // The list field is renamed between builds (LLLFZ on 47.2.41, LLLFFI on 47.4.3, where
        // LLLFZ is another type). A field that does not resolve throws NoSuchFieldError when
        // the liked tab is created, so find it by type.
        val listFields = classDefBy(LIST_FRAGMENT_DESCRIPTOR).fields.filter { field ->
            field.type == RECYCLER_VIEW_DESCRIPTOR && !AccessFlags.STATIC.isSet(field.accessFlags)
        }
        if (listFields.size != 1) {
            throw PatchException(
                "Liked videos search: expected 1 RecyclerView field, found ${listFields.size}.",
            )
        }
        val listField = "$LIST_FRAGMENT_DESCRIPTOR->${listFields.single().name}:$RECYCLER_VIEW_DESCRIPTOR"

        // End of onViewCreated: pass the fragment root and the list to the extension.
        LikesViewCreatedFingerprint.method.apply {
            val implementation = implementation!!
            // iget-object takes 4-bit registers, and p2 is the last register.
            if (implementation.registerCount > 16) {
                throw PatchException(
                    "Liked videos search: onViewCreated uses ${implementation.registerCount} registers.",
                )
            }

            val returnIndices = implementation.instructions.withIndex()
                .filter { it.value.opcode == Opcode.RETURN_VOID }
                .map { it.index }

            returnIndices.asReversed().forEach { returnIndex ->
                // p2 (the Bundle) is no longer needed once the method is about to return.
                addInstructions(
                    returnIndex,
                    """
                        iget-object p2, p0, $listField
                        invoke-static {p1, p2}, $EXTENSION_CLASS_DESCRIPTOR->onViewCreated(Landroid/view/View;Landroid/view/View;)V
                    """,
                )
            }
        }

        // Give TikTok the unfiltered list before it edits the list by position.
        LikesResumeFingerprint.method.addInstruction(
            0,
            "invoke-static/range {p0 .. p0}, $EXTENSION_CLASS_DESCRIPTOR->onResume(Ljava/lang/Object;)V",
        )

        // Re-filter when TikTok replaces or extends the list.
        ProfileGridBindViewHolderFingerprint.method.addInstruction(
            0,
            "invoke-static/range {p0 .. p0}, $EXTENSION_CLASS_DESCRIPTOR->onBind(Ljava/lang/Object;)V",
        )
    }
}

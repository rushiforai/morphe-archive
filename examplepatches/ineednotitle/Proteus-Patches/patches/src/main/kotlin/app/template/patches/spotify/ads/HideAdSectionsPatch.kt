package app.template.patches.spotify.ads

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.SPOTIFY_COMPATIBILITY
import app.template.patches.shared.getReference
import app.template.patches.spotify.shared.BrowseStructureGetSectionsFingerprint
import app.template.patches.spotify.shared.CasitaHomeStructureGetSectionsFingerprint
import app.template.patches.spotify.shared.HomeStructureGetSectionsFingerprint
import app.template.patches.spotify.shared.inspectReturnedObjects
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.reference.FieldReference

private const val EXTENSION_CLASS =
    "Lapp/template/extension/extension/SpotifyAdSectionFilter;"

/**
 * Filters the `sections_` list returned by the getters of the home and browse
 * protobuf message classes.
 *
 * Newer app versions declare the getter with the obfuscated protobuf list type
 * (which implements [java.util.List]) instead of `java.util.List`, so both
 * return types are accepted.
 *
 * @return If at least one getter was hooked.
 */
context(patchContext: BytecodePatchContext)
private fun Fingerprint.filterReturnedSections(extensionMethod: String): Boolean {
    val getters = matchAllOrNull().orEmpty()
        .map { patchContext.mutableClassDefBy(it.classDef) }
        .distinctBy { it.type }
        .flatMap { it.methods }
        .filter { method ->
            method.parameterTypes.isEmpty() &&
                method.implementation?.instructions?.any { instruction ->
                    if (instruction.opcode != Opcode.IGET_OBJECT) return@any false
                    val field = instruction.getReference<FieldReference>() ?: return@any false

                    field.name == "sections_" &&
                        (method.returnType == "Ljava/util/List;" || method.returnType == field.type)
                } == true
        }
    if (getters.isEmpty()) return false

    getters.forEach { it.inspectReturnedObjects(extensionMethod) }
    return true
}

// Removes the brand ad sections from the home and search (browse) pages.
//
// Both pages render protobuf structures with a repeated `sections_` field.
// The patch hooks the section getters and passes the returned list through the
// extension, which drops brand-ad sections (identified by their protobuf
// oneof cases / ad metadata) before the UI sees them. The app's own lists are
// only filtered in place; ordering of real content is untouched.
//
// Fail-safe: the extension only removes sections it positively identifies as
// ads and never throws into the app; a missing structure simply skips that page.

@Suppress("unused")
val spotifyHideAdSectionsPatch = bytecodePatch(
    name = "Hide ad sections",
    description = "Removes brand ad sections from the home and search page.",
    default = true,
) {
    compatibleWith(SPOTIFY_COMPATIBILITY)

    extendWith("extensions/extension.mpe")

    execute {
        val homeMethod = "$EXTENSION_CLASS->removeHomeSections(Ljava/util/List;)V"
        val homeFound = CasitaHomeStructureGetSectionsFingerprint.filterReturnedSections(homeMethod) or
            HomeStructureGetSectionsFingerprint.filterReturnedSections(homeMethod)
        val browseFound = BrowseStructureGetSectionsFingerprint.filterReturnedSections(
            "$EXTENSION_CLASS->removeBrowseSections(Ljava/util/List;)V",
        )

        if (!homeFound && !browseFound) {
            throw PatchException("Could not find the home and browse page sections")
        }
    }
}

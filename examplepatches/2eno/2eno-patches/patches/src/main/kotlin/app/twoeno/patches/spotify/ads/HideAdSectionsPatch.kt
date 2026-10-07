package app.twoeno.patches.spotify.ads

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.util.getReference
import app.twoeno.patches.shared.Constants.COMPATIBILITY_SPOTIFY
import app.twoeno.patches.shared.EXTENSION
import app.twoeno.patches.shared.EXTENSION_PACKAGE
import app.twoeno.patches.shared.inspectReturnedObjects
import app.twoeno.patches.spotify.BrowseStructureGetSectionsFingerprint
import app.twoeno.patches.spotify.CasitaHomeStructureGetSectionsFingerprint
import app.twoeno.patches.spotify.HomeStructureGetSectionsFingerprint
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.reference.FieldReference

private const val EXTENSION_CLASS = "$EXTENSION_PACKAGE/spotify/HideAdSectionsPatch;"

/**
 * Filters the `sections_` list returned by the getters of the protobuf message class.
 *
 * @return If the message class was found.
 */
context(_: BytecodePatchContext)
private fun Fingerprint.filterReturnedSections(extensionMethod: String): Boolean {
    val getters = classDefOrNull?.methods?.filter { method ->
        method.returnType == "Ljava/util/List;" &&
            method.implementation?.instructions?.any { instruction ->
                instruction.opcode == Opcode.IGET_OBJECT &&
                    instruction.getReference<FieldReference>()?.name == "sections_"
            } == true
    }
    if (getters.isNullOrEmpty()) return false

    getters.forEach { it.inspectReturnedObjects(extensionMethod) }
    return true
}

@Suppress("unused")
val hideAdSectionsPatch = bytecodePatch(
    name = "Hide ad sections",
    description = "Removes brand ad sections from the home and search page.",
) {
    compatibleWith(COMPATIBILITY_SPOTIFY)

    extendWith(EXTENSION)

    execute {
        val homeMethod = "$EXTENSION_CLASS->removeHomeSections(Ljava/util/List;)V"
        val homeFound = CasitaHomeStructureGetSectionsFingerprint.filterReturnedSections(homeMethod) or
            HomeStructureGetSectionsFingerprint.filterReturnedSections(homeMethod)
        val browseFound = BrowseStructureGetSectionsFingerprint.filterReturnedSections(
            "$EXTENSION_CLASS->removeBrowseSections(Ljava/util/List;)V",
        )

        if (!homeFound && !browseFound) throw PatchException("Could not find the home and browse page sections")
    }
}

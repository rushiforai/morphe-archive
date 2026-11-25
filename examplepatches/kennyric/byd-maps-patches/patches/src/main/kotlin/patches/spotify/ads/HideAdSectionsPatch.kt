package patches.spotify.ads

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.getReference
import patches.spotify.COMPATIBILITY_SPOTIFY
import patches.spotify.shared.EXTENSION
import patches.spotify.shared.EXTENSION_PACKAGE
import patches.spotify.shared.inspectReturnedObjects
import patches.spotify.BrowseStructureGetSectionsFingerprint
import patches.spotify.CasitaHomeStructureGetSectionsFingerprint
import patches.spotify.HomeStructureGetSectionsFingerprint
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.reference.FieldReference

private const val EXTENSION_CLASS = "$EXTENSION_PACKAGE/spotify/HideAdSectionsPatch;"

/**
 * Filters the `sections_` list returned by the getters of the protobuf message class.
 *
 * Newer app versions declare the getter with the obfuscated protobuf list type
 * (which implements [java.util.List]) instead of `java.util.List`, so both are accepted.
 *
 * @return If the message class was found.
 */
context(_: BytecodePatchContext)
private fun Fingerprint.filterReturnedSections(extensionMethod: String): Boolean {
    val getters = classDefOrNull?.methods?.filter { method ->
        method.parameterTypes.isEmpty() &&
            method.implementation?.instructions?.any { instruction ->
                if (instruction.opcode != Opcode.IGET_OBJECT) return@any false
                val field = instruction.getReference<FieldReference>() ?: return@any false

                field.name == "sections_" &&
                    (method.returnType == "Ljava/util/List;" || method.returnType == field.type)
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

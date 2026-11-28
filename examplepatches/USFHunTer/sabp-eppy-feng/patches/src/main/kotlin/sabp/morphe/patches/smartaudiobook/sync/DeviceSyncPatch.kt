package sabp.morphe.patches.smartaudiobook.sync

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import com.android.tools.smali.dexlib2.AccessFlags
import sabp.morphe.patches.smartaudiobook.smartAudioBookCompatibility
import sabp.morphe.patches.smartaudiobook.ui.eppyUiPatch

/** Syncthing-Fork and the original app; the same list as SyncPage.SYNCTHING in the extension. */
private val SYNCTHING_PACKAGES = listOf("com.github.catfriend1.syncthingandroid", "com.nutomic.syncthingandroid")

private const val SABP = "Lak/alizandro/smartaudiobookplayer"

/**
 * Tells eppy each time SABP writes a book's position.sabp.dat, so eppy knows which position file this device wrote
 * and which came from the other device. (SABP's BookDataBackup writer: static, (Context, BookData)V.)
 */
private val positionSavedHookPatch = bytecodePatch(
    description = "Tells eppy when SABP saves a book's position file. Applied with Sync between devices.",
) {
    compatibleWith(smartAudioBookCompatibility)

    execute {
        val writer = mutableClassDefBy("$SABP/BookDataBackup;").methods.singleOrNull {
            AccessFlags.STATIC.isSet(it.accessFlags) && it.returnType == "V" &&
                it.parameterTypes.map(CharSequence::toString) == listOf("Landroid/content/Context;", "$SABP/BookData;")
        } ?: throw PatchException("Smart AudioBook Player: the position file writer (BookDataBackup) wasn't found.")
        writer.addInstructions(
            0,
            "invoke-static {p0, p1}, Lapp/morphe/extension/sabp/OtherDevicePosition;->onSaved(Landroid/content/Context;Ljava/lang/Object;)V",
        )
    }
}

/**
 * Turns on eppy's offer of the other device's position (docs/adr/0002): eppy reads SABP's own position.sabp.dat in the
 * book folder, which a folder-sync app brings from the other device. eppy itself sends nothing anywhere.
 */
@Suppress("unused")
val deviceSyncPatch = resourcePatch(
    name = "Sync between devices",
    description = "For a library folder kept the same on two devices by a folder-sync app such as Syncthing. When " +
        "you open a book that the other device played further, eppy offers to jump there. Bookmarks and character " +
        "notes already travel with the book folder. eppy itself sends nothing anywhere; see the README for setup.",
    default = false,
) {
    compatibleWith(smartAudioBookCompatibility)
    dependsOn(eppyUiPatch, positionSavedHookPatch)

    execute {
        document("res/values/strings.xml").use { doc ->
            val el = doc.createElement("string")
            el.setAttribute("name", "eppy_device_sync")
            el.setAttribute("translatable", "false")
            el.textContent = "on"
            doc.documentElement.appendChild(el)
        }

        // Android 11+ hides other apps unless listed: lets eppy's sync screen find and open Syncthing.
        document("AndroidManifest.xml").use { doc ->
            val queries = doc.getElementsByTagName("queries").item(0)
                ?: doc.createElement("queries").also {
                    doc.documentElement.insertBefore(it, doc.getElementsByTagName("application").item(0))
                }
            SYNCTHING_PACKAGES.forEach { id ->
                queries.appendChild(doc.createElement("package").apply { setAttribute("android:name", id) })
            }
        }
    }
}

package mightymich.morphe.patches.com.whatsapp

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import com.android.tools.smali.dexlib2.AccessFlags
import org.w3c.dom.Element

/**
 * Improve local / non-GMS backup friendliness for WhatsApp.
 *
 * What this can do:
 *  - android:allowBackup = true so system / Seedvault style backups are not
 *    blocked by the package flag
 *  - Soft-bypass of client checks that refuse a local backup path when Google
 *    Drive / Play Services look unavailable
 *
 * What this cannot do:
 *  - Replace Google Drive end-to-end (Drive API still needs a working account
 *    stack). Local msgstore.db.crypt* under Android/media/com.whatsapp/WhatsApp
 *    remains the reliable offline path; copy Databases + Media manually.
 *  - Decrypt or merge cloud backups.
 */
@Suppress("unused")
val enableLocalBackupResourcePatch = resourcePatch(
    name = "Enable local backup (manifest)",
    description = "Sets android:allowBackup=true so the package can participate in " +
        "device backup agents (Seedvault / adb). Does not implement Drive.",
    default = true,
) {
    compatibleWith(WhatsAppCompatibility.WHATSAPP)

    execute {
        document("AndroidManifest.xml").use { document ->
            val apps = document.getElementsByTagName("application")
            if (apps.length == 0) return@use
            val app = apps.item(0) as Element
            app.setAttribute("android:allowBackup", "true")
            if (app.hasAttribute("android:fullBackupOnly")) {
                app.setAttribute("android:fullBackupOnly", "false")
            }
        }
    }
}

@Suppress("unused")
val enableLocalBackupBytecodePatch = bytecodePatch(
    name = "Enable local backup (gates)",
    description = "Soft-bypasses client gates that block local chat backup when " +
        "Google Drive / Play Services appear missing. Prefer offline Databases folder.",
    default = true,
) {
    compatibleWith(WhatsAppCompatibility.WHATSAPP)
    dependsOn(enableLocalBackupResourcePatch)

    execute {
        val returnTrue = """
            const/4 v0, 0x1
            return v0
        """
        val returnFalse = """
            const/4 v0, 0x0
            return v0
        """

        var hits = 0
        val anchors = listOf(
            "gdrive",
            "GoogleDrive",
            "google_drive",
            "backup_to_google",
            "ChatBackup",
            "msgstore.db",
            "local backup",
            "BackupAgent",
            "gdrive-notification",
            "gdrive_backup",
        )

        val trueNames = setOf(
            "isBackupEnabled", "canBackup", "isLocalBackupEnabled",
            "hasLocalBackup", "isBackupAvailable", "canCreateBackup",
            "isBackupAllowed", "shouldBackup",
        )
        val falseNames = setOf(
            "isGdriveRequired", "requiresGoogleDrive", "mustUseDrive",
            "isDriveOnly", "blockLocalBackup",
        )

        val seen = mutableSetOf<String>()
        for (anchor in anchors) {
            val defs = try {
                classDefByStrings(anchor)
            } catch (_: Exception) {
                emptyList()
            }
            for (def in defs) {
                if (!seen.add(def.type)) continue
                if (AccessFlags.INTERFACE.isSet(def.accessFlags)) continue
                val t = def.type
                if (t.startsWith("Landroid") || t.startsWith("Landroidx") ||
                    t.startsWith("Ljava") || t.startsWith("Lkotlin") ||
                    t.startsWith("Lcom/google")
                ) {
                    continue
                }
                val clazz = try {
                    mutableClassDefBy(def)
                } catch (_: Exception) {
                    continue
                }
                for (method in clazz.methods) {
                    if (method.returnType != "Z") continue
                    if (method.parameterTypes.isNotEmpty()) continue
                    if (AccessFlags.ABSTRACT.isSet(method.accessFlags)) continue
                    if (AccessFlags.NATIVE.isSet(method.accessFlags)) continue
                    val n = method.name
                    try {
                        when {
                            n in trueNames -> {
                                method.addInstructions(0, returnTrue)
                                hits++
                            }
                            n in falseNames -> {
                                method.addInstructions(0, returnFalse)
                                hits++
                            }
                            (n.startsWith("is") || n.startsWith("can") || n.startsWith("has")) &&
                                n.lowercase().let {
                                    it.contains("backup") || it.contains("gdrive") ||
                                        it.contains("local")
                                } -> {
                                if (n.lowercase().contains("require") ||
                                    n.lowercase().contains("only")
                                ) {
                                    method.addInstructions(0, returnFalse)
                                } else {
                                    method.addInstructions(0, returnTrue)
                                }
                                hits++
                            }
                        }
                    } catch (_: Exception) {
                    }
                }
            }
        }
    }
}

package app.raidjudu.patches

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import com.android.tools.smali.dexlib2.Opcode

// judu is flutter, its map lives in dart, so the reports ride on a native layer above it
object MainActivityInitFingerprint : Fingerprint(
    definingClass = "Lcom/judu/MainActivity;",
    name = "<init>",
)

// dart loads the map style and the stop departures by these urls, send them to the extension's
// local server instead. same length, the snapshot stores the size in front. Raid.java has the same urls
private val swaps = mapOf(
    "https://maps.judu.lt/styles/bright/style.json" to "http://127.0.0.1:47123/styles/bright/style.js",
    "https://www.stops.lt/vilnius/departures2.php" to "http://127.0.0.1:47123/stops/departures2.php",
)

private val styleUrlPatch = resourcePatch {
    execute {
        // the libs come from the abi split, an installed app or a base apk alone has none
        val libs = listApkEntries("lib/").filter { it.endsWith("/libapp.so") }
        if (libs.isEmpty()) throw PatchException("libapp.so not found, patch the full JUDU xapk with its arm64_v8a split, not the installed app or a base apk")
        libs.forEach { path ->
            val lib = get(path)
            val bytes = lib.readBytes()
            swaps.forEach { (from, to) ->
                val at = String(bytes, Charsets.ISO_8859_1).indexOf(from)
                if (at < 0 || from.length != to.length) throw PatchException("$from not found in $path")
                to.toByteArray(Charsets.ISO_8859_1).copyInto(bytes, at)
            }
            lib.writeBytes(bytes)
        }
    }
}

@Suppress("unused")
val raidInspectorsPatch = bytecodePatch(
    name = "raid.lt inspectors",
    description = "Puts raid.lt ticket inspector reports on the JUDU map and its stops, with a counter on top. Tap it for the reports with their votes and comments.",
    default = true,
) {
    dependsOn(styleUrlPatch)

    compatibleWith(
        Compatibility(
            name = "JUDU",
            packageName = "com.judu",
            apkFileType = ApkFileType.XAPK,
            appIconColor = 0xE30613,
            targets = listOf(AppTarget(version = "1.6.0")),
        )
    )

    extendWith("extensions/extension.mpe")

    execute {
        MainActivityInitFingerprint.method.apply {
            // after super.<init>, this is unusable before it
            val end = instructions.indexOfFirst { it.opcode == Opcode.RETURN_VOID }
            addInstruction(end, "invoke-static {p0}, Lapp/raidjudu/extension/Raid;->attach(Landroid/app/Activity;)V")
        }
    }
}

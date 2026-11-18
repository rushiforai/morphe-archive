package ctw.patches

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.removeInstruction
import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.ResourcePatchContext
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.rawResourcePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.BuilderInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import gtade.patches.BOOT_START
import gtade.patches.amlLibraryPatch
import gtade.patches.isBootStart
import gtade.patches.loadLibraryArg
import gtade.patches.refreshExtensionClasses

val GTA_CTW = Compatibility(
    name = "GTA: Chinatown Wars",
    packageName = "com.rockstargames.gtactw",
    apkFileType = ApkFileType.APK,
    appIconColor = 0xC8102E,
    // The mods find the game's code by symbol names and the addresses of globals of this build.
    targets = listOf(AppTarget(version = "4.4.243")),
)

private const val GAME_NATIVE = "Lcom/rockstargames/oswrapper/GameNative;"
private const val MENU_INSTALL = "Lctw/menu/Menu;->install()V"
private const val HD_INSTALL = "Lctw/packs/Packs;->installHd()V"

/** Bytes of a file bundled in this patches file under src/main/resources/ctw/. */
private fun bundled(name: String): ByteArray =
    object {}.javaClass.getResourceAsStream("/ctw/$name")?.use { it.readBytes() }
        ?: throw PatchException("$name is missing from the patches file")

/** Adds an AML mod library; Boot copies it to Android/data/<game>/mods/ at the next start. */
private fun ResourcePatchContext.addMod(library: String) =
    get("assets/gtade/mods/$library", false).apply { parentFile.mkdirs() }.writeBytes(bundled(library))

private fun isInvoke(ins: BuilderInstruction, target: String): Boolean {
    val ref = (ins as? ReferenceInstruction)?.reference as? MethodReference ?: return false
    return ins.opcode == Opcode.INVOKE_STATIC && "${ref.definingClass}->${ref.name}()V" == target
}

/**
 * Not listed on its own: the CTW patches depend on it. GameNative's static init loads libGame.so; right after that
 * gtade.boot.Boot.start() copies the bundled mods to Android/data/<game>/mods/ and loads AML, which loads them before
 * the game initialises, so their hooks are in place before any asset is read.
 */
internal val ctwLoaderPatch = bytecodePatch {
    compatibleWith(GTA_CTW)
    dependsOn(amlLibraryPatch)
    extendWith("extensions/extension.mpe")

    execute {
        refreshExtensionClasses()
        val clinit = mutableClassDefBy(GAME_NATIVE).methods.first { it.name == "<clinit>" }
        val insns = clinit.instructions
        // An already patched APK has the calls these patches add; the menu patch adds its own again when selected.
        for (i in insns.indices.reversed()) {
            if (isBootStart(insns[i]) || isInvoke(insns[i], MENU_INSTALL) || isInvoke(insns[i], HD_INSTALL)) clinit.removeInstruction(i)
        }
        val game = insns.indices.filter { loadLibraryArg(insns, it) == "Game" }
        if (game.size != 1) throw PatchException("expected one loadLibrary(\"Game\") in GameNative.<clinit>, found ${game.size}")
        clinit.addInstruction(game[0] + 1, "invoke-static {}, $BOOT_START")
    }
}

private val cheatMenuLibraryPatch = rawResourcePatch {
    dependsOn(amlLibraryPatch)  // after its delete("assets/gtade/")
    execute { addMod("libctwmenu.so") }
}

@Suppress("unused")
val cheatMenuPatch = bytecodePatch(
    name = "Add cheat menu",
    description = "Adds a MOD button that opens a cheat menu over the running game: god mode, infinite ammo, never " +
        "wanted, one-hit kills, money, weapons, a vehicle spawner sorted by class, indestructible vehicle, nitro, " +
        "time, weather, traffic and pedestrian density, freezing mission timers and teleporting to the map waypoint.",
    default = true,
) {
    compatibleWith(GTA_CTW)
    dependsOn(ctwLoaderPatch, cheatMenuLibraryPatch)

    execute {
        val clinit = mutableClassDefBy(GAME_NATIVE).methods.first { it.name == "<clinit>" }
        val boot = clinit.instructions.indexOfFirst { isBootStart(it) }
        if (boot < 0) throw PatchException("mod loader call not found in GameNative.<clinit>")
        clinit.addInstruction(boot + 1, "invoke-static {}, $MENU_INSTALL")
    }
}

@Suppress("unused")
val packsPatch = rawResourcePatch(
    name = "Load texture and radio packs",
    description = "Loads texture packs (DXT.bin, CTWHD.bin) and radio stations (radio/*.mp3, names.txt, station logos) " +
        "from Android/data/com.rockstargames.gtactw/files/ when the game starts. With the cheat menu, its Packs tab " +
        "imports radio stations from a zip or folder, converting the PSP version's .AT3 files on the phone; the GTA IV " +
        "radio mod for the PSP version also gets its station names and logos. No music is included.",
    default = true,
) {
    compatibleWith(GTA_CTW)
    dependsOn(ctwLoaderPatch)
    execute {
        addMod("libctwpacks.so")
        // Station logos the Packs tab adds when it imports the GTA IV radio mod for the PSP version (logo sheets in the
        // game's ss_radio.png layout).
        for (part in 1..2) get("assets/ctw/radio/gta4-psp-part$part.png", false)
            .apply { parentFile.mkdirs() }.writeBytes(bundled("gta4-psp-part$part.png"))
    }
}

@Suppress("unused")
val hdDownloadPatch = bytecodePatch(
    name = "Download HD texture pack",
    description = "The first time the game opens without the HD textures, offers to download them (965 MB, " +
        "AI-upscaled 3D world and 2D art, from github.com/RAZORRZR0/ctw-packs). Interrupted downloads resume.",
    default = true,
) {
    compatibleWith(GTA_CTW)
    dependsOn(ctwLoaderPatch, packsPatch)

    execute {
        val clinit = mutableClassDefBy(GAME_NATIVE).methods.first { it.name == "<clinit>" }
        val boot = clinit.instructions.indexOfFirst { isBootStart(it) }
        if (boot < 0) throw PatchException("mod loader call not found in GameNative.<clinit>")
        clinit.addInstruction(boot + 1, "invoke-static {}, $HD_INSTALL")
    }
}

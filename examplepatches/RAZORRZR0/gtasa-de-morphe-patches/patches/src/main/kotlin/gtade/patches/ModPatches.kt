package gtade.patches

import app.morphe.patcher.patch.rawResourcePatch

// Names say what a patch does and descriptions are third person, present tense, ending with a period (Morphe patcher
// docs, "Structure and conventions"); the mod each one installs is named in its description.

@Suppress("unused")
val modMenuPatch = rawResourcePatch(
    name = "Add mod menu",
    description = "Adds ModMenu, an in-game menu that changes the settings of the other mods while playing.",
    default = true,
) {
    compatibleWith(GTASA_DE)
    dependsOn(modLoaderPatch)
    execute { addMod("libmodmenu.so", "modmenu.ini") }
}

@Suppress("unused")
val propFixPatch = rawResourcePatch(
    name = "Fix prop physics",
    description = "Adds GTA Prop Fix, which restores the original game's physics for knocked-over props: lamp posts, " +
        "traffic lights, signs, bins and hydrants fall and roll with world and car collision instead of DE's " +
        "physics, and broken pieces land on the ground instead of falling through the map.",
    default = true,
) {
    compatibleWith(GTASA_DE)
    dependsOn(modLoaderPatch)
    execute { addMod("libpropfix.so", "GTA_Prop_Fix.ini") }
}

@Suppress("unused")
val skyGfxPatch = rawResourcePatch(
    name = "Add PS2 graphics",
    description = "Adds SkyGfx: PS2 colours and timecyc, radiosity, distant lamp coronas and post effects, the PC " +
        "graphics settings the phone menu hides (draw distance, shadows, anti-aliasing and more) and AMD FSR 1 upscaling.",
    default = true,
) {
    compatibleWith(GTASA_DE)
    dependsOn(modLoaderPatch)
    execute { addMod("libskygfx.so", "SkyGfx.ini", "SALodLights.dat", "timecyc_ps2.dat") }
}

@Suppress("unused")
val projectPropsPatch = rawResourcePatch(
    name = "Add extra map props",
    description = "Adds about 16,000 map props from Project Props 4 by user-grinch. Downloads the placements from " +
        "github.com/user-grinch/Project-Props while patching, so it needs internet.",
    default = true,
) {
    compatibleWith(GTASA_DE)
    dependsOn(modLoaderPatch)
    execute {
        addMod("libprojectpropsde.so", "ProjectPropsDE.ini")
        val dat = ProjectPropsData.build(String(bundled("ProjectPropsDE.stock"), Charsets.UTF_8))
        get("assets/gtade/configs/ProjectPropsDE.dat", false).writeText(dat)
    }
}

@Suppress("unused")
val cleoPatch = rawResourcePatch(
    name = "Add CLEO script support",
    description = "Adds CLEO Android 2.0.1, which runs CLEO scripts with the swipe-down CLEO menu. Installs 14 GTA SA " +
        "scripts in Android/data/com.rockstargames.gtasa.de/cleo/; the .csa ones, such as invincibility and " +
        "regeneration, always run, so delete the ones you don't want.",
    default = false,
) {
    compatibleWith(GTASA_DE)
    dependsOn(modLoaderPatch)
    execute {
        addMod("libcleo.so")
        for (name in String(bundled("cleo.list"), Charsets.UTF_8).lines().filter { it.isNotBlank() })
            get("assets/gtade/cleo/$name", false).apply { parentFile.mkdirs() }.writeBytes(bundled("cleo/$name"))
    }
}

@Suppress("unused")
val pakLoaderPatch = rawResourcePatch(
    name = "Load pak mods",
    description = "Loads Unreal .pak mod files from Android/data/com.rockstargames.gtasa.de/paks/ when the game " +
        "starts, above the game's own paks, so PC Definitive Edition pak mods work as-is. Copy the .pak files there " +
        "and restart the game.",
    default = true,
) {
    compatibleWith(GTASA_DE)
    dependsOn(modLoaderPatch)
    execute { addMod("libpakloader.so") }
}

@Suppress("unused")
val loadingMusicPatch = rawResourcePatch(
    name = "Play loading screen music",
    description = "Plays one of the game's eight loading-screen themes while a save loads, like the PC " +
        "SALoadingMusic mod.",
    default = true,
) {
    compatibleWith(GTASA_DE)
    dependsOn(modLoaderPatch)
    execute { addMod("libloadingmusic.so", "LoadingMusic.ini") }
}

@Suppress("unused")
val rubbishPatch = rawResourcePatch(
    name = "Add blowing litter",
    description = "Adds Rubbish-DE by H4V3NART: loose litter on the streets that blows around when vehicles pass. " +
        "Builds its model pak from the game's own files at the first start, so no game files are shipped.",
    default = true,
) {
    compatibleWith(GTASA_DE)
    dependsOn(modLoaderPatch, pakLoaderPatch)
    execute {
        addMod("librubbish.so", "Rubbish-DE.ini")
        // Boot builds paks/904-Rubbish-DE_P.pak from these slots (gtade.boot.RubbishPak).
        get("assets/gtade/rubbish/slots.json", false).apply { parentFile.mkdirs() }.writeBytes(bundled("rubbish/slots.json"))
    }
}

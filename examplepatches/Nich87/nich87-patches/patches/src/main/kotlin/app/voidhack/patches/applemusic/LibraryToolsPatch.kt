package app.voidhack.patches.applemusic

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction

private val libraryToolsResources = resourcePatch {
    execute {
        listOf("values", "values-ja").forEach { directory ->
            val source = checkNotNull(LibraryPrepareMenu::class.java.getResourceAsStream(
                "/applemusic/library/$directory/voidhack_library_tools.xml",
            ))
            source.use { input ->
                document(input).use { translations ->
                    // ARSCLib resolves values by file type: strings.xml and plurals.xml.
                    mapOf("string" to "strings", "plurals" to "plurals").forEach { (tag, file) ->
                        document("res/$directory/$file.xml").use { destination ->
                            val entries = translations.getElementsByTagName(tag)
                            for (index in 0 until entries.length) {
                                destination.documentElement.appendChild(destination.importNode(entries.item(index), true))
                            }
                        }
                    }
                }
            }
        }
        val path = "layout/voidhack_library_progress.xml"
        checkNotNull(LibraryPrepareMenu::class.java.getResourceAsStream("/applemusic/library/$path")).use { input ->
            get("res/$path", false).outputStream().use { input.copyTo(it) }
        }
    }
}

private class LibraryPrepareMenu(definingClass: String) : Fingerprint(
    definingClass = definingClass,
    name = "onPrepareOptionsMenu",
    parameters = listOf("Landroid/view/Menu;"),
    returnType = "V",
)

private object LibraryComposeMenu : Fingerprint(
    definingClass = "LAa/U;",
    name = "<init>",
    parameters = listOf("Ljava/util/List;", "Landroid/content/Context;", "Z"),
    returnType = "V",
)

private object LibraryComposeMenuState : Fingerprint(
    definingClass = "LAa/C;",
    name = "p",
    parameters = listOf("Lz0/p0;", "Ljava/util/List;", "Lz0/m;", "I"),
    returnType = "V",
)

private object LibrarySettingsCreated : Fingerprint(
    definingClass = "Lcom/apple/android/music/settings2/fragment/SettingsFragment;",
    name = "onCreate",
    parameters = listOf("Landroid/os/Bundle;"),
    returnType = "V",
)

private object LibrarySettingsItems : Fingerprint(
    definingClass = "Lcom/apple/android/music/settings2/model/SettingsViewModel;",
    name = "getPreferenceItems",
    returnType = "Ljava/util/List;",
)

@Suppress("unused")
val libraryToolsPatch = bytecodePatch(
    name = "Library import, export and downloads",
    description = "Adds JSON library and playlist backups, additive import, and a native download action for the entire library.",
) {
    dependsOn(libraryToolsResources)
    compatibleWith(
        Compatibility(
            name = "Apple Music",
            packageName = "com.apple.android.music",
            apkFileType = ApkFileType.APK,
            appIconColor = 0xFA243C,
            targets = listOf(AppTarget(version = "7.0.0")),
        )
    )
    extendWith("extensions/extension.mpe")

    execute {
        listOf(
            "Lcom/apple/android/music/library3/LibraryComposeContentFragment;",
            "Lcom/apple/android/music/library2/LibraryRecyclerContentFragment;",
            "Lcom/apple/android/music/library/fragments/LibraryRecentlyAddedFragment;",
        ).forEach { definingClass ->
            LibraryPrepareMenu(definingClass).method.addInstruction(
                0,
                "invoke-static/range {p0 .. p1}, Lapp/voidhack/extension/applemusic/library/LibraryMenu;->addMenu(Ljava/lang/Object;Landroid/view/Menu;)V",
            )
        }
        LibraryComposeMenu.method.addInstructions(
            0,
            """
                invoke-static/range {p1 .. p2}, Lapp/voidhack/extension/applemusic/library/LibraryMenu;->withTools(Ljava/util/List;Landroid/content/Context;)Ljava/util/List;
                move-result-object p1
            """,
        )
        LibraryComposeMenuState.method.addInstructions(
            0,
            """
                invoke-static/range {p1 .. p2}, Lapp/voidhack/extension/applemusic/library/LibraryMenu;->withMenuState(Ljava/lang/Object;Ljava/util/List;)Ljava/util/List;
                move-result-object p2
            """,
        )
        LibrarySettingsCreated.method.addInstruction(
            0,
            "invoke-static/range {p0 .. p0}, Lapp/voidhack/extension/applemusic/library/LibrarySettings;->attach(Ljava/lang/Object;)V",
        )
        LibrarySettingsItems.method.apply {
            checkNotNull(implementation).instructions.withIndex()
                .filter { it.value.opcode == Opcode.RETURN_OBJECT }.reversed().forEach { (index, instruction) ->
                    val register = (instruction as OneRegisterInstruction).registerA
                    addInstructions(
                        index,
                        """
                            invoke-static/range {v$register .. v$register}, Lapp/voidhack/extension/applemusic/library/LibrarySettings;->withTools(Ljava/util/List;)Ljava/util/List;
                            move-result-object v$register
                        """,
                    )
                }
        }
    }
}

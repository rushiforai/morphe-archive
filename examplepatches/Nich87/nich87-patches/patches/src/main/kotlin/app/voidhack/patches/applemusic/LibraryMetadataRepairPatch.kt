package app.voidhack.patches.applemusic

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction

private val metadataRepairResources = resourcePatch {
    execute {
        listOf("values", "values-ja").forEach { directory ->
            checkNotNull(LibrarySettingsCreated::class.java.getResourceAsStream(
                "/applemusic/metadata/$directory/voidhack_metadata_repair.xml",
            )).use { input ->
                document(input).use { translations ->
                    document("res/$directory/strings.xml").use { destination ->
                        val entries = translations.getElementsByTagName("string")
                        for (index in 0 until entries.length) {
                            destination.documentElement.appendChild(destination.importNode(entries.item(index), true))
                        }
                    }
                }
            }
        }
    }
}

@Suppress("unused")
val libraryMetadataRepairPatch = bytecodePatch(
    name = "Repair Japanese library metadata",
    description = "Finds romanized library metadata and repairs selected songs using Japanese catalog data, preserving library entries and syncing changes to the account.",
) {
    dependsOn(metadataRepairResources)
    compatibleWith(
        Compatibility(
            name = "Apple Music",
            packageName = "com.apple.android.music",
            apkFileType = ApkFileType.APK,
            appIconColor = 0xFA243C,
            targets = listOf(AppTarget(version = "7.0.0")),
        ),
    )
    extendWith("extensions/extension.mpe")

    execute {
        LibrarySettingsCreated.method.addInstruction(
            0,
            "invoke-static/range {p0 .. p0}, Lapp/voidhack/extension/applemusic/library/MetadataRepairSettings;->attach(Ljava/lang/Object;)V",
        )
        LibrarySettingsItems.method.apply {
            checkNotNull(implementation).instructions.withIndex()
                .filter { it.value.opcode == Opcode.RETURN_OBJECT }.reversed().forEach { (index, instruction) ->
                    val register = (instruction as OneRegisterInstruction).registerA
                    addInstructions(
                        index,
                        """
                            invoke-static/range {v$register .. v$register}, Lapp/voidhack/extension/applemusic/library/MetadataRepairSettings;->withRepair(Ljava/util/List;)Ljava/util/List;
                            move-result-object v$register
                        """,
                    )
                }
        }
    }
}

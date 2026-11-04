package lab.musicolet.patches

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.SupportedAbi
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction

private const val preview = "Lapp/morphe/musicolet/sync/FolderPlaylistEditorPreview;"

@Suppress("unused")
val syncFolderPlaylistsPatch = bytecodePatch(
    name = "Sync folder playlists",
    description = "Create folder-linked playlists and add indexed tracks after scans. Existing-playlist folder selection is preview-only.",
    default = false
) {
    compatibleWith(
        Compatibility(
            name = "Musicolet",
            packageName = "in.krosbits.musicolet",
            targets = listOf(
                AppTarget(
                    version = "6.14.1 build540",
                    versionCodes = mapOf(SupportedAbi.ARM64_V8A to 54000),
                    isExperimental = false,
                    minSdk = 29
                )
            )
        )
    )
    extendWith("extensions/extension.mpe")

    execute {
        check(packageMetadata.versionCode == "54000") { "Expected Musicolet build540" }
        val editor = mutableClassDefBy("Lin/krosbits/musicolet/PlaylistEditActivity;").methods.single {
            it.name == "onCreate" && it.parameterTypes == listOf("Landroid/os/Bundle;")
        }
        val editInstructions = checkNotNull(editor.implementation).instructions.toList()
        val setContent = editInstructions.indices.single {
            editInstructions[it].opcode == Opcode.INVOKE_VIRTUAL &&
                (editInstructions[it] as? ReferenceInstruction)?.reference.toString() ==
                "Lx5;->setContentView(I)V"
        }

        val create = mutableClassDefBy("Ly71;").methods.single {
            it.name == "onClick" && it.parameterTypes == listOf("Landroid/view/View;")
        }
        val createInstructions = checkNotNull(create.implementation).instructions.toList()
        val nameField = createInstructions.indices.single {
            createInstructions[it].opcode == Opcode.IGET_OBJECT &&
                (createInstructions[it] as? ReferenceInstruction)?.reference.toString() ==
                "Lqs0;->n:Landroid/widget/EditText;"
        }
        check(createInstructions[nameField - 1].opcode == Opcode.MOVE_RESULT_OBJECT)
        check((createInstructions[nameField - 2] as? ReferenceInstruction)?.reference.toString() ==
            "Lks0;->o()Lqs0;")
        val nameRegister = (createInstructions[nameField] as OneRegisterInstruction).registerA

        val save = mutableClassDefBy("Lw71;").methods.single {
            it.name == "a" && it.parameterTypes == listOf("Lqs0;", "Landroid/text/Editable;")
        }
        val saveCode = checkNotNull(save.implementation).instructions.toList()
        val saveIndex = saveCode.indices.single {
            saveCode[it].opcode == Opcode.INVOKE_STATIC &&
                (saveCode[it] as? ReferenceInstruction)?.reference.toString() ==
                "Ls71;->k(Landroid/content/Context;Lr71;)V"
        }
        val playlistRegister = (saveCode[saveIndex] as FiveRegisterInstruction).registerD
        save.addInstructionsWithLabels(
            saveIndex,
            """
                invoke-static {v0, v$playlistRegister}, ${preview}->populateNewPlaylist(Landroid/app/Dialog;Ljava/lang/Object;)Z
                move-result v0
                if-nez v0, :save_original
                return-void
            """.trimIndent(),
            ExternalLabel("save_original", saveCode[saveIndex])
        )

        // The original callback overwrites p1 with the name, then the Context.
        // Keep the dialog in v0 until the save hook.
        check(saveCode[7].opcode == Opcode.CONST_4 &&
            (saveCode[7] as OneRegisterInstruction).registerA == 0)
        val errorNotices = saveCode.indices.filter {
            (saveCode[it] as? ReferenceInstruction)?.reference.toString() ==
                "Lwf0;->P0(ILjava/lang/CharSequence;Z)V"
        }
        check(errorNotices.size == 2 && errorNotices.all { it > saveIndex })
        // Restore the original Boolean on both validation paths, which skip the import hook.
        for (index in errorNotices.asReversed()) {
            save.addInstructions(index + 4, "const/4 v0, 0x1")
        }
        save.replaceInstruction(7, "nop")
        save.addInstructions(0, "move-object v0, p1")

        val rename = mutableClassDefBy("Low;").methods.single {
            it.name == "a" && it.parameterTypes == listOf("Lqs0;", "Landroid/text/Editable;")
        }
        val renameCode = checkNotNull(rename.implementation).instructions.toList()
        val writeName = renameCode.indices.single {
            renameCode[it].opcode == Opcode.IPUT_OBJECT &&
                (renameCode[it] as? ReferenceInstruction)?.reference.toString() ==
                "Lr71;->b:Ljava/lang/String;"
        }
        check((renameCode[writeName + 1] as ReferenceInstruction).reference.toString() ==
            "Ls71;->k(Landroid/content/Context;Lr71;)V")
        check((renameCode[writeName + 3] as ReferenceInstruction).reference.toString() ==
            "Ls71;->n(Ljava/lang/String;I)V")
        rename.addInstructions(writeName + 4,
            "invoke-static {v5, v2, v4}, ${preview}->renameBinding(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V")
        rename.addInstructions(writeName, "iget-object v2, v0, Lr71;->b:Ljava/lang/String;")

        val screen = mutableClassDefBy("Lb81;").methods.single {
            it.name == "onClick" && it.parameterTypes == listOf("Landroid/view/View;")
        }
        val screenCode = checkNotNull(screen.implementation).instructions.toList()
        val removeTrack = screenCode.indices.single {
            (screenCode[it] as? ReferenceInstruction)?.reference.toString() == "Lr71;->f(Ldm0;)V"
        }
        val removalStart = removeTrack - 7
        check((screenCode[removalStart] as? ReferenceInstruction)?.reference.toString() ==
            "Lin/krosbits/musicolet/MyApplication;->i:Lin/krosbits/musicolet/MyApplication;")
        screen.addInstructionsWithLabels(removalStart, """
            move-object/from16 v0, p0
            iget-object v0, v0, Lb81;->N0:Ljava/lang/String;
            invoke-static {v0}, ${preview}->blockRemoval(Ljava/lang/String;)Z
            move-result v0
            if-eqz v0, :allow_removal
            return-void
        """.trimIndent(), ExternalLabel("allow_removal", screenCode[removalStart]))

        val removalHosts = listOf(
            "Lc3;" to "Q", "Lgv;" to "run", "Lgy0;" to "onClick",
            "Lli2;" to "a", "Lp71;" to "onClick", "Luf;" to "onClick"
        )
        for ((className, methodName) in removalHosts) {
            val method = mutableClassDefBy(className).methods.single { it.name == methodName }
            val code = checkNotNull(method.implementation).instructions.toList()
            val sites = code.indices.filter {
                val reference = (code[it] as? ReferenceInstruction)?.reference.toString()
                reference == "Lr71;->f(Ldm0;)V" ||
                    reference == "Lr71;->g(Ljava/util/HashSet;)Z"
            }
            check(sites.isNotEmpty())
            for (index in sites.asReversed()) {
                val instruction = code[index] as FiveRegisterInstruction
                val reference = (code[index] as ReferenceInstruction).reference.toString()
                val replacement = if (reference.contains("->f("))
                    "removeTrackFromUi(Ljava/lang/Object;Ljava/lang/Object;)V"
                else "removeTracksFromUi(Ljava/lang/Object;Ljava/util/HashSet;)Z"
                method.replaceInstruction(index,
                    "invoke-static {v${instruction.registerC}, v${instruction.registerD}}, ${preview}->$replacement")
            }
        }

        val deletionHosts = listOf(
            "Lb81;" to "onClick",
            "Lgy0;" to "onClick",
            "Lin/krosbits/musicolet/PlaylistEditActivity;" to "o0",
            "Lx71;" to "Q"
        )
        for ((className, methodName) in deletionHosts) {
            val method = mutableClassDefBy(className).methods.single { it.name == methodName }
            val instructions = checkNotNull(method.implementation).instructions.toList()
            val deletions = instructions.indices.filter {
                (instructions[it] as? ReferenceInstruction)?.reference.toString() ==
                    "Ls71;->h(Landroid/content/Context;Lr71;)V"
            }
            check(deletions.isNotEmpty())
            for (index in deletions.asReversed()) {
                val invoke = instructions[index] as FiveRegisterInstruction
                method.addInstructions(index + 1,
                    "invoke-static {v${invoke.registerC}, v${invoke.registerD}}, ${preview}->removeBinding(Landroid/content/Context;Ljava/lang/Object;)V")
            }
        }

        val scan = mutableClassDefBy("Lbm0;").methods.single {
            it.name == "v" && it.parameterTypes == listOf("Landroid/database/sqlite/SQLiteDatabase;")
        }
        val scanCode = checkNotNull(scan.implementation).instructions.toList()
        val refreshIndex = scanCode.indices.single {
            (scanCode[it] as? ReferenceInstruction)?.reference.toString() == "Lbm0;->r()V"
        }
        scan.addInstructions(refreshIndex + 1, "invoke-static {}, ${preview}->refreshBindings()V")

        editor.addInstructions(
            setContent + 1,
            "invoke-static/range {p0 .. p0}, ${preview}->install(Landroid/app/Activity;)V"
        )
        create.addInstructions(
            nameField + 1,
            "invoke-static/range {v$nameRegister .. v$nameRegister}, ${preview}->installNewPlaylist(Landroid/widget/EditText;)V"
        )
    }
}

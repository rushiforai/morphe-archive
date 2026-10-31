package app.tikkamasalla.stremio.introskip

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction35c
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableMethodReference

private const val SPOILER_HIDE = "Lapp/tikkamasalla/stremio/introskip/SpoilerHide;"
private const val SPOILER_SETTINGS = "Lapp/tikkamasalla/stremio/introskip/SpoilerSettings;"
private const val VIDEO_CLASS = "Lcom/stremio/core/types/resource/Video;"
private const val SPOILER_VERSION = "1.0.0"
private const val SPOILER_REPO = "https://github.com/tikkamasalla/stremio-morphe-patches"

/** Hides thumbnails and synopses for unwatched episodes. Default OFF. */
val hideSpoilersPatch = bytecodePatch(
    name = "Hide spoilers",
    description = "Hides thumbnails and synopses for unwatched episodes in Stremio.\n\nHide spoilers v$SPOILER_VERSION\nRepository: $SPOILER_REPO",
    default = false,
) {
    compatibleWith(Constants.STREMIO_COMPATIBILITY)
    extendWith("extensions/extension.mpe")

    execute {
        // Card row: Video.getThumbnail -> SpoilerHide.thumbnailOf.
        // Same register in, same move-result out, no new registers.
        try {
            val method = CardVideoItemBindFingerprint.method
            val impl = method.implementation ?: return@execute
            val thumbRef = ImmutableMethodReference(
                SPOILER_HIDE,
                "thumbnailOf",
                listOf("Ljava/lang/Object;"),
                "Ljava/lang/String;",
            )
            for (index in impl.instructions.indices) {
                val ins = impl.instructions[index]
                if (ins.opcode != Opcode.INVOKE_VIRTUAL) continue
                val ref = (ins as? BuilderInstruction35c)?.reference as? MethodReference
                    ?: continue
                if (ref.definingClass != VIDEO_CLASS || ref.name != "getThumbnail") continue
                val orig = ins as BuilderInstruction35c
                val replacement = BuilderInstruction35c(
                    Opcode.INVOKE_STATIC,
                    orig.registerCount,
                    orig.registerC,
                    orig.registerD,
                    orig.registerE,
                    orig.registerF,
                    orig.registerG,
                    thumbRef,
                )
                method.replaceInstruction(index, replacement)
            }
        } catch (_: Exception) {
            // Card keeps vanilla thumbnails on this build.
        }

        // Header: Video.getOverview -> SpoilerHide.overviewOf.
        try {
            val method = MetaDetailsBindFingerprint.method
            val impl = method.implementation ?: return@execute
            val overviewRef = ImmutableMethodReference(
                SPOILER_HIDE,
                "overviewOf",
                listOf("Ljava/lang/Object;"),
                "Ljava/lang/String;",
            )
            for (index in impl.instructions.indices) {
                val ins = impl.instructions[index]
                if (ins.opcode != Opcode.INVOKE_VIRTUAL) continue
                val ref = (ins as? BuilderInstruction35c)?.reference as? MethodReference
                    ?: continue
                if (ref.definingClass != VIDEO_CLASS || ref.name != "getOverview") continue
                val orig = ins as BuilderInstruction35c
                val replacement = BuilderInstruction35c(
                    Opcode.INVOKE_STATIC,
                    orig.registerCount,
                    orig.registerC,
                    orig.registerD,
                    orig.registerE,
                    orig.registerF,
                    orig.registerG,
                    overviewRef,
                )
                method.replaceInstruction(index, replacement)
            }
        } catch (_: Exception) {
            // Header keeps vanilla synopsis on this build.
        }

        // Refresh after returning from Settings: re-reads the switch and rebinds.
        // Single invoke with p0 only, so .locals 0 methods need no new registers.
        try {
            VideosListOnResumeFingerprint.method.apply {
                val returns = implementation!!.instructions.withIndex()
                    .filter { it.value.opcode == Opcode.RETURN_VOID }
                    .map { it.index }
                returns.reversed().forEach { index ->
                    addInstructions(
                        index,
                        "invoke-static {p0}, $SPOILER_HIDE->refreshFragment(Ljava/lang/Object;)V",
                    )
                }
            }
        } catch (_: Exception) {
            // List keeps old rows until next load on this build.
        }

        // Refresh right after setItems in the state observer.
        // Passes the controller register straight into refresh, no new registers.
        try {
            val method = VideosListOnCreateObserverFingerprint.method
            val impl = method.implementation ?: return@execute
            val refreshRef = ImmutableMethodReference(
                SPOILER_HIDE,
                "refresh",
                listOf("Ljava/lang/Object;"),
                "V",
            )
            val snapshot = impl.instructions.toList()
            for (index in snapshot.indices) {
                val ins = snapshot[index]
                if (ins.opcode != Opcode.INVOKE_VIRTUAL) continue
                val ref = (ins as? BuilderInstruction35c)?.reference as? MethodReference
                    ?: continue
                if (ref.definingClass !=
                    "Lcom/stremio/tv/views/metadetails/videos/VideosController;"
                ) continue
                if (ref.name != "setItems") continue
                val orig = ins as BuilderInstruction35c
                val controllerReg = orig.registerC
                val call = BuilderInstruction35c(
                    Opcode.INVOKE_STATIC,
                    1,
                    controllerReg,
                    0,
                    0,
                    0,
                    0,
                    refreshRef,
                )
                // Index shifts as we insert, so offset by hooks already added.
                method.addInstructions(index + 1, listOf(call))
                break
            }
        } catch (_: Exception) {
            // First load keeps old rows on this build; onResume still refreshes.
        }

        // Episode titles: Video.getLabel -> "Episode N" when hidden, else original.
        // Same register in (p0), same move-result out, one temp register.
        try {
            VideoLabelFingerprint.method.addInstructionsWithLabels(
                0,
                """
                    invoke-static {p0}, $SPOILER_HIDE->episodeLabel(Ljava/lang/Object;)Ljava/lang/String;
                    move-result-object v0
                    if-eqz v0, :spoiler_label_orig
                    return-object v0
                    :spoiler_label_orig
                    nop
                """.trimIndent(),
            )
        } catch (_: Exception) {
            // Header keeps vanilla titles on this build.
        }
        try {
            VideoLabelWithDateFingerprint.method.addInstructionsWithLabels(
                0,
                """
                    invoke-static {p0}, $SPOILER_HIDE->episodeLabel(Ljava/lang/Object;)Ljava/lang/String;
                    move-result-object v0
                    if-eqz v0, :spoiler_date_orig
                    return-object v0
                    :spoiler_date_orig
                    nop
                """.trimIndent(),
            )
        } catch (_: Exception) {
            // Header keeps vanilla titles on this build.
        }

        // Settings switch in Stremio Settings, Interface screen.
        try {
            PreferencesFragmentOnCreatePreferencesFingerprint.method.apply {
                val returns = implementation!!.instructions.withIndex()
                    .filter { it.value.opcode == Opcode.RETURN_VOID }
                    .map { it.index }
                returns.reversed().forEach { index ->
                    addInstructions(
                        index,
                        "invoke-static {p0}, $SPOILER_SETTINGS->add(Landroidx/preference/PreferenceFragmentCompat;)V",
                    )
                }
            }
        } catch (_: Exception) {
            // Settings screen moved in this build; the switch stays OFF.
        }
    }
}

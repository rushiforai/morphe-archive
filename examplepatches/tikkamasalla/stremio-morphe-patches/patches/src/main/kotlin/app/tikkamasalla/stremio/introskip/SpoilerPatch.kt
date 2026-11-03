package app.tikkamasalla.stremio.introskip

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction35c
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableMethodReference

private const val SPOILER_HIDE = "Lapp/tikkamasalla/stremio/introskip/SpoilerHide;"
private const val SPOILER_SETTINGS = "Lapp/tikkamasalla/stremio/introskip/SpoilerSettings;"
private const val VIDEO_CLASS = "Lcom/stremio/core/types/resource/Video;"
private const val SPOILER_VERSION = "1.0.0"
private const val SPOILER_REPO = "https://github.com/tikkamasalla/stremio-morphe-patches"

/**
 * Hides one String getter of the core Video class for unwatched episodes (data level, used by the
 * Compose UI of 1.10.4+). R8 compiled each getter to `iget-object vX, p0, field; return-object vX` with no
 * free register (1.12.0, 2.5.0), so the body is rebuilt with one extra register and the original read
 * is kept as the fall-through path. The Video object itself is never copied or changed, so equality in
 * the episode and season selection is untouched.
 *
 * [nullWhenHidden] true: SpoilerHide.hidesEpisode(video) decides and the getter returns null (thumbnail,
 * overview). false: SpoilerHide.hiddenTitle(video) returns the replacement text or null for the real one.
 */
private fun hookVideoGetter(method: MutableMethod, fieldName: String, nullWhenHidden: Boolean) {
    val impl = method.implementation ?: error("Video.$fieldName getter has no implementation")
    val original = impl.instructions.toList()
    check(original.size == 2 && method.parameters.isEmpty()) {
        "Unexpected getter shape for $fieldName: ${original.size} instructions"
    }
    check(original[0].opcode == Opcode.IGET_OBJECT && original[1].opcode == Opcode.RETURN_OBJECT) {
        "Unexpected getter opcodes for $fieldName"
    }
    val field = (original[0] as? ReferenceInstruction)?.reference as? FieldReference
        ?: error("Getter for $fieldName does not read a field")
    check(field.definingClass == VIDEO_CLASS && field.name == fieldName && field.type == "Ljava/lang/String;") {
        "Unexpected field ${field.definingClass}->${field.name}"
    }

    // One local register plus p0 are needed. registerCount has no setter, so raise it by reflection
    // (the old body is removed below, so its register numbers do not matter).
    if (impl.registerCount < 2) {
        val count = MutableMethodImplementation::class.java.getDeclaredField("registerCount")
        count.isAccessible = true
        count.setInt(impl, 2)
    }
    check(impl.registerCount >= 2) { "Could not raise the register count for $fieldName" }

    val read = "iget-object v0, p0, $VIDEO_CLASS->$fieldName:Ljava/lang/String;"
    val code = if (nullWhenHidden) {
        """
            invoke-static {p0}, $SPOILER_HIDE->hidesEpisode(Ljava/lang/Object;)Z
            move-result v0
            if-eqz v0, :spoiler_orig
            const/4 v0, 0x0
            return-object v0
            :spoiler_orig
            $read
            return-object v0
        """.trimIndent()
    } else {
        """
            invoke-static {p0}, $SPOILER_HIDE->hiddenTitle(Ljava/lang/Object;)Ljava/lang/String;
            move-result-object v0
            if-eqz v0, :spoiler_orig
            return-object v0
            :spoiler_orig
            $read
            return-object v0
        """.trimIndent()
    }
    method.addInstructionsWithLabels(0, code)
    // The two original instructions are now the last two.
    impl.removeInstruction(impl.instructions.size - 1)
    impl.removeInstruction(impl.instructions.size - 1)
}

/** Hides thumbnails and synopses for unwatched episodes. Default OFF. */
val hideSpoilersPatch = bytecodePatch(
    name = "Hide spoilers",
    description = "Hides thumbnails and synopses for unwatched episodes in Stremio.\n\nHide spoilers v$SPOILER_VERSION\nRepository: $SPOILER_REPO",
    default = false,
) {
    compatibleWith(Constants.STREMIO_COMPATIBILITY)
    extendWith("extensions/extension.mpe")

    execute {
        // Compose builds (1.10.4+ have the MPV engine, 1.6.12 does not): hide at the Video getters so
        // every screen sees it (episode rows, header, player menus, next-episode popup). 1.6.12 keeps
        // only the legacy bind hooks below, unchanged.
        if (SpoilerComposeMarkerFingerprint.originalMethodOrNull != null) {
            try {
                hookVideoGetter(VideoGetThumbnailFingerprint.method, "thumbnail", true)
            } catch (_: Exception) {
                // Thumbnails stay visible on this build.
            }
            try {
                hookVideoGetter(VideoGetOverviewFingerprint.method, "overview", true)
            } catch (_: Exception) {
                // Synopses stay visible on this build.
            }
            try {
                hookVideoGetter(VideoGetTitleFingerprint.method, "title", false)
            } catch (_: Exception) {
                // Episode titles stay visible on this build.
            }
        }

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
            hookReturnVoidWithThis(VideosListOnResumeFingerprint.method, "$SPOILER_HIDE->refreshFragment(Ljava/lang/Object;)V")
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
            hookReturnVoidWithThis(PreferencesFragmentOnCreatePreferencesFingerprint.method, "$SPOILER_SETTINGS->add(Landroidx/preference/PreferenceFragmentCompat;)V")
        } catch (_: Exception) {
            // Settings screen moved in this build; the switch stays OFF.
        }
    }
}

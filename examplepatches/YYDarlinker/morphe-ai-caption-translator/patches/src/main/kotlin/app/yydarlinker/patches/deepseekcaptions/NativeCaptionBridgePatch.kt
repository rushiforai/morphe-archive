package app.yydarlinker.patches.deepseekcaptions

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter

private const val BRIDGE = "${EXTENSION}NativeCaptionBridge;"
private const val SUPPORT = "${EXTENSION}CaptionAddonSupport;"
private const val LIST = "Ljava/util/List;"
private const val CANVAS = "Landroid/graphics/Canvas;"
private const val RENDERER = "Lcom/google/android/libraries/youtube/player/subtitles/ui/SubtitleWindowView;"
private const val SETTINGS_FRAGMENT = "Lapp/morphe/extension/shared/settings/preference/AbstractPreferenceFragment;"

/** The name that the wrapped original of the settings fragment's long-press handler gets. */
private const val ORIGINAL_LONG_CLICK = "aiCaptionOriginalLongClick"

/**
 * Binds the stubs of the extension's `NativeCaptionBridge` to the obfuscated caption classes of YouTube and hooks the
 * native track flow. It runs once, after every selected patch has executed, because the hooks depend on which
 * features were asked for.
 *
 * Every class, field and method is found by its structure, never by its obfuscated name. When a structure is not
 * found exactly once the patching fails, instead of installing a hook that could crash YouTube.
 */
internal fun BytecodePatchContext.installNativeCaptionBridge(translation: Boolean) {
    NativeCaptionBridgeInstaller(this, translation).install()
}

/** The obfuscated class of a caption track with the fields and the builder that the bridge needs. */
private class TrackModel(
    val track: ClassDef,
    val language: FieldReference,
    val vss: FieldReference,
    val url: FieldReference,
    /** The caption model's method that lists the tracks YouTube can translate. */
    val translatedList: Method,
    /** The caption track builder, read only for the videoId property of the caption model. */
    val builder: ClassDef,
)

private class NativeCaptionBridgeInstaller(
    private val context: BytecodePatchContext,
    private val translation: Boolean,
) {
    private val bridge = context.mutableClassDefBy(BRIDGE)

    fun install() {
        // Whatever can fail is resolved before the first change of the app's code.
        val renderer = if (translation) findNativeRenderer() else null
        val pathCopy = if (translation) findPathCopyHandler() else null
        val quickToggle = if (translation) context.prepareCaptionQuickToggle() else null
        val model = findTrackModel()
        val selector = findTrackSelector(model.track)

        bindTrackAccessors(model)
        hookTrackApplied(model, selector)

        val owner = context.classDefBy(selector.definingClass)
        val (_, modelField) = findDefaultTrack(owner, model)
        bindModelAccessors(model, owner, modelField)
        hookOriginalTrackList(model)
        if (translation) {
            quickToggle!!()
            hookNativeDraw(renderer!!)
            hookPathCopy(pathCopy!!.first, pathCopy.second)
        }
        verifyHooks()
        publishFeatures()
    }

    // region Discovery

    private fun findTrackModel(): TrackModel {
        val track = context.classDefByStrings("AUTO_TRANSLATE_CAPTIONS_OPTION")
            .map { context.classDefBy(it.type) }
            .filter { "Landroid/os/Parcelable;" in it.interfaces }
            .unique("caption model")
        val sentinel = track.methods
            .filter { it.returnType == "Z" && it.hasText("AUTO_TRANSLATE_CAPTIONS_OPTION") }
            .unique("auto-translate sentinel")
        // Up to 20.51 the sentinel compares the language through a getter of the track, not through the field.
        fun stringFields(method: Method) = method.code().mapNotNull { it.field() }
            .filter { it.definingClass == track.type && it.type == STRING }
        val language = (stringFields(sentinel).ifEmpty {
            // The sentinel can compare through a getter instead of reading the field directly.
            val getters = sentinel.code().mapNotNull { it.call() }
                .filter { it.definingClass == track.type && it.parameterTypes.isEmpty() && it.returnType == STRING }
                .map { it.id() }
            track.methods.filter { it.id() in getters }.flatMap { stringFields(it) }
        }).distinctBy { it.id() }.unique("language field")
        val vss = track.methods.filter { it.returnType == "Z" && it.hasText("t") }
            .flatMap { it.code().mapNotNull { instruction -> instruction.field() } }
            .filter { it.type == STRING }
            .distinctBy { it.id() }.unique("vss field")
        val translatedList = context.classDefByStrings("&tlang=")
            .flatMap { context.classDefBy(it.type).methods.toList() }
            .filter { it.hasText("&tlang=") && it.parameterTypes.isEmpty() && it.returnType == LIST }
            .unique("translated track list")
        val listCode = translatedList.code()
        val url = listCode.mapIndexedNotNull { index, instruction ->
            if (instruction.text() == "&tlang=") listCode.getOrNull(index - 2)?.field() else null
        }.filter { it.definingClass == track.type && it.type == STRING }.unique("signed source URL")

        val builderFactory = track.methods
            .filter { it.isStatic() && it.parameterTypes.isEmpty() && it.returnType.startsWith("L") && it.returnType != track.type }
            .unique("track builder factory")
        val builder = context.classDefBy(builderFactory.returnType)
        return TrackModel(track, language, vss, url, translatedList, builder)
    }

    /**
     * The manager's method that returns the track to start with, and the field of its caption model. From 21.23 a
     * private helper is split off a public wrapper; the model-ready initializer calls the one that is hooked.
     */
    private fun findDefaultTrack(owner: ClassDef, model: TrackModel): Pair<Method, FieldReference> {
        val modelType = model.translatedList.definingClass
        val candidates = owner.methods.filter { it.parameterTypes.isEmpty() && it.returnType == model.track.type }
        // The official preferred-language patch adds further no-argument track helpers, so the model
        // field is read from the initializer that stores the model and calls the default selector.
        val initializer = owner.methods.filter { method ->
            method.returnType == "V" && method.parameterTypes.size == 2 &&
                method.code().any { instruction ->
                    instruction.opcode == Opcode.IPUT_OBJECT && instruction.field()?.let { field ->
                        field.definingClass == owner.type && field.type == modelType
                    } == true
                } &&
                method.code().any { call -> candidates.any { it.id() == call.call()?.id() } }
        }.unique("caption model ready initializer")
        val called = candidates.filter { candidate -> initializer.code().any { it.call()?.id() == candidate.id() } }
        val fields = initializer.code().filter { it.opcode == Opcode.IPUT_OBJECT }
            .mapNotNull { it.field() }
            .filter { it.definingClass == owner.type && it.type == modelType }
            .distinctBy { it.id() }
        // An initializer can hold more than one model-shaped field (for example a default and the
        // current one). The default selector that the initializer calls reads the one in use.
        val modelField = fields.singleOrNull() ?: fields.filter { field ->
            called.any { candidate -> candidate.code().any { it.field()?.id() == field.id() } }
        }.unique("caption model field")
        return called.unique("native default selector") to modelField
    }

    /** The method of the caption manager that selects a track for the "all captions" menu. */
    private fun findTrackSelector(track: ClassDef): Method {
        val log = "setSubtitleTrack name:%s languageCode:%s languageName:%s format:%d trackName:%s vssid:%s videoid:%s"
        val logged = context.classDefByStrings(log)
            .flatMap { context.classDefBy(it.type).methods.toList() }
            .filter { it.hasText(log) }

        // YouTube 21.20 removed the log string but kept the method: it is the manager's only instance method
        // (track, origin, reason) that builds the caption event (track, origin, reason, id).
        val selector = if (logged.isNotEmpty()) {
            logged.unique("all-menu track selection")
        } else {
            val found = mutableListOf<Method>()
            context.classDefForEach { candidate ->
                if (candidate.methods.none { it.parameterTypes.isEmpty() && it.returnType == track.type }) {
                    return@classDefForEach
                }
                for (method in candidate.methods) {
                    val types = method.parameterNames()
                    if (method.isStatic() || method.returnType != "V" || types.size != 3 ||
                        types[0] != track.type || types[2] != "I" || !types[1].startsWith("L")
                    ) {
                        continue
                    }
                    val buildsEvent = method.code().any { instruction ->
                        instruction.opcode == Opcode.INVOKE_DIRECT && instruction.call()?.let { call ->
                            call.name == "<init>" &&
                                call.parameterTypes.map { it.toString() } == listOf(track.type, types[1], "I", STRING)
                        } == true
                    }
                    if (buildsEvent) found.add(method)
                }
            }
            found.unique("all-menu track selection")
        }
        if (selector.parameterTypes.firstOrNull() != track.type || selector.isStatic() ||
            selector.returnType != "V" || selector.parameterTypes.size !in 2..3 ||
            (selector.parameterTypes.size == 3 && selector.parameterTypes[2] != "I")
        ) {
            throw PatchException("AI captions: unexpected native track selector")
        }
        return selector
    }

    /** The class of the native caption renderer; its `draw` is overridden to hide the native caption. */
    private fun findNativeRenderer(): MutableClass {
        val renderer = context.mutableClassDefBy(RENDERER)
        if (renderer.superclass == null || renderer.methods.any { it.name == "draw" && it.parameterNames() == listOf(CANVAS) }) {
            throw PatchException("AI captions: native draw override unavailable or already exists")
        }
        return renderer
    }

    /** The settings screen's long-press handler that copies the breadcrumb path (see [hookPathCopy]). */
    private fun findPathCopyHandler(): Pair<MutableClass, Method> {
        val fragment = context.mutableClassDefBy(SETTINGS_FRAGMENT)
        val handler = fragment.methods
            .filter {
                it.name == "onPreferenceLongClick" && it.returnType == "Z" &&
                    it.parameterNames() == listOf("Landroid/widget/AdapterView;", "Landroid/view/View;", "I", "J")
            }
            .unique("official breadcrumb long-press handler")
        if (handler.implementation == null || handler.isStatic() || fragment.methods.any { it.name == ORIGINAL_LONG_CLICK }) {
            throw PatchException("AI captions: settings long-press handler unavailable or already wrapped")
        }
        return fragment to handler
    }

    /**
     * The caption model's list of the tracks of the video, without the translations. The official
     * Auto-translate patch also adds a no-argument List helper to this class, so the direct-tracks
     * getter is identified by its AUTO_TRANSLATE sentinel instead of "the other List method".
     */
    private fun findNativeList(model: TrackModel) = context.classDefBy(model.translatedList.definingClass).methods
        .filter {
            it.parameterTypes.isEmpty() && it.returnType == LIST && it.name != model.translatedList.name &&
                it.hasText("AUTO_TRANSLATE_CAPTIONS_OPTION")
        }
        .unique("native original track list")

    // endregion

    // region Bindings of stubs

    private fun mutable(method: Method): MutableMethod = context.mutableClassDefBy(method.definingClass).methods
        .filter { it.id() == method.id() }.unique("mutable method")

    private fun bindTrackAccessors(model: TrackModel) {
        fun read(field: FieldReference) =
            "check-cast p0, ${model.track.type}\niget-object v0, p0, ${field.id()}\nreturn-object v0"
        bridge.bindStub("language", 3, read(model.language))
        bridge.bindStub("vss", 3, read(model.vss))
        bridge.bindStub("url", 3, read(model.url))
    }

    /** The caption model of the manager, and the lists of tracks it holds. */
    private fun bindModelAccessors(model: TrackModel, owner: ClassDef, modelField: FieldReference) {
        val modelClass = context.classDefBy(model.translatedList.definingClass)
        val videoSetter = model.builder.methods
            .filter { it.parameterNames() == listOf(STRING) && it.returnType == "V" && it.hasText("Null videoId") }
            .unique("videoId builder setter")
        // The String of a caption event is a playback identifier, not a video ID: the video comes from the model
        // field that feeds the builder's videoId property.
        val videoField = modelClass.methods.flatMap { method ->
            val code = method.code()
            code.mapIndexedNotNull { index, instruction ->
                if (instruction.call()?.id() != videoSetter.id()) return@mapIndexedNotNull null
                val read = code.getOrNull(index - 1) as? TwoRegisterInstruction ?: return@mapIndexedNotNull null
                val call = instruction as? FiveRegisterInstruction ?: return@mapIndexedNotNull null
                val field = code[index - 1].field()
                if (code[index - 1].opcode == Opcode.IGET_OBJECT && call.registerCount == 2 &&
                    read.registerA == call.registerD && field?.definingClass == modelClass.type && field.type == STRING
                ) field else null
            }
        }.distinctBy { it.id() }.unique("caption model videoId provenance")

        val getterName = "captionAddonVideoId"
        val mutableModel = context.mutableClassDefBy(modelClass.type)
        if (mutableModel.methods.any { it.name == getterName }) throw PatchException("AI captions: caption model getter already exists")
        val getter = ImmutableMethod(
            modelClass.type, getterName, emptyList(), STRING,
            AccessFlags.PUBLIC.value or AccessFlags.FINAL.value, null, null, MutableMethodImplementation(2),
        ).toMutable()
        getter.addInstructions(0, "iget-object v0, p0, ${videoField.id()}\nreturn-object v0")
        mutableModel.methods.add(getter)

        bridge.bindStub(
            "nativeModelVideo",
            3,
            """
                check-cast p0, ${owner.type}
                if-eqz p0, :no_model
                iget-object v0, p0, ${modelField.id()}
                if-eqz v0, :no_model
                invoke-virtual {v0}, ${getter.id()}
                move-result-object v0
                return-object v0
                :no_model
                const-string v0, ""
                return-object v0
            """,
        )

        fun listAccessor(method: Method) = """
            check-cast p0, ${owner.type}
            iget-object v0, p0, ${modelField.id()}
            if-nez v0, :model_ready
            const/4 v0, 0x0
            return-object v0
            :model_ready
            invoke-virtual {v0}, ${method.id()}
            move-result-object v0
            return-object v0
        """
        bridge.bindStub("nativeTracks", 3, listAccessor(findNativeList(model)))
        bridge.bindStub("translatedTracks", 3, listAccessor(model.translatedList))
    }

    // endregion

    // region Hooks into the app

    /** Replaces every `return-object` of [method] by a call of the extension that may replace the returned object. */
    private fun MutableMethod.hookReturns(call: (register: Int) -> Pair<String, String>) {
        val returns = code().mapIndexedNotNull { index, instruction ->
            if (instruction.opcode == Opcode.RETURN_OBJECT) index to (instruction as OneRegisterInstruction).registerA else null
        }
        // Last first, so that the inserted instructions do not move the indexes that are still to be done.
        for ((index, register) in returns.reversed()) {
            val (hook, after) = call(register)
            // Replace the labeled instruction itself: branch targets must execute the hook.
            replaceInstruction(index, hook)
            addInstructions(index + 1, after)
        }
    }

    /**
     * Tells the extension about the signed source tracks as soon as the model builds them. The list is only a
     * candidate for a source prewarm; the extension still checks the foreground owner and the translation intent
     * before it starts an invisible session.
     */
    private fun hookOriginalTrackList(model: TrackModel) {
        mutable(findNativeList(model)).hookReturns { register ->
            "invoke-static/range {v$register .. v$register}, $BRIDGE->onOriginalTrackList($LIST)V" to
                "return-object v$register"
        }
    }

    /**
     * Reports the track that the manager committed. `setSubtitleTrack` is a user entry point, not the automatic
     * new-video path; its final event dispatcher is shared with the model-ready restoration. The committed track is
     * captured there (after Off, auto-caption and forced-track filtering), before the renderer starts.
     */
    private fun hookTrackApplied(model: TrackModel, selector: Method) {
        val track = model.track
        val dispatcherRef = selector.code().mapNotNull { it.call() }.filter {
            it.definingClass == selector.definingClass && it.returnType == "V" && it.parameterTypes.size == 1 &&
                it.parameterTypes[0].toString().startsWith("L")
        }.distinctBy { it.id() }.unique("shared caption event dispatcher")
        val dispatcher = context.classDefBy(dispatcherRef.definingClass).methods
            .filter { it.id() == dispatcherRef.id() }.unique("caption event method")
        val event = context.classDefBy(dispatcher.parameterTypes.single().toString())

        fun eventField(type: String) = event.fields
            .filter { it.type == type && !AccessFlags.STATIC.isSet(it.accessFlags) && AccessFlags.PUBLIC.isSet(it.accessFlags) }
            .unique("caption event field $type")

        val eventRequested = eventField(track.type)
        val eventOrigin = eventField(selector.parameterTypes[1].toString())
        val eventReason = eventField("I")

        val code = dispatcher.code()
        val committed = code.filter { it.opcode == Opcode.IPUT_OBJECT }.mapNotNull { it.field() }
            .filter { it.definingClass == selector.definingClass && it.type == track.type }
            .distinctBy { it.id() }.unique("committed caption track")
        if (!AccessFlags.PUBLIC.isSet(context.classDefBy(selector.definingClass).fields.single { it.name == committed.name }.accessFlags)) {
            throw PatchException("AI captions: committed track is not accessible")
        }
        val rendererIndex = code.indices.filter { index ->
            val call = code[index].call()
            call?.definingClass == selector.definingClass && call.returnType == "V" &&
                call.parameterTypes.map { it.toString() } == listOf(track.type, "Z")
        }.unique("caption renderer update")
        if (code.drop(rendererIndex).any { it.opcode == Opcode.IPUT_OBJECT && it.field()?.id() == committed.id() }) {
            throw PatchException("AI captions: track mutates after renderer update")
        }
        val sharedCallers = context.classDefBy(selector.definingClass).methods
            .filter { method -> method.code().any { it.call()?.id() == dispatcherRef.id() } }
        if (sharedCallers.none { it.id() != selector.id() && it.parameterTypes.size == 2 }) {
            throw PatchException("AI captions: automatic model initializer does not share the dispatcher")
        }

        bridge.bindStub(
            "onNativeTrackApplied",
            6,
            """
                if-eqz p0, :done
                if-eqz p1, :done
                check-cast p0, ${selector.definingClass}
                check-cast p1, ${event.type}
                move-object v0, p0
                iget-object v1, p0, ${committed.id()}
                iget-object v2, p1, ${eventRequested.id()}
                iget-object v3, p1, ${eventOrigin.id()}
                iget v4, p1, ${eventReason.id()}
                invoke-static {p0}, $BRIDGE->nativeModelVideo($OBJECT)$STRING
                move-result-object v5
                invoke-static/range {v0 .. v5}, $BRIDGE->onNativeAppliedEvent($OBJECT$OBJECT$OBJECT${OBJECT}I$STRING)V
                :done
                return-void
            """,
        )

        val renderer = code[rendererIndex]
        val registers = renderer as? FiveRegisterInstruction ?: throw PatchException("AI captions: renderer invoke changed")
        if (renderer.opcode != Opcode.INVOKE_VIRTUAL || registers.registerCount != 3) {
            throw PatchException("AI captions: unexpected renderer update signature")
        }
        mutable(dispatcher).apply {
            // Replace the labeled instruction so every incoming native branch executes the capture.
            replaceInstruction(rendererIndex, "invoke-static/range {p0 .. p1}, $BRIDGE->onNativeTrackApplied($OBJECT$OBJECT)V")
            addInstructions(
                rendererIndex + 1,
                "invoke-virtual {v${registers.registerC}, v${registers.registerD}, v${registers.registerE}}, ${renderer.call()!!.id()}",
            )
        }
    }

    /** The native caption renderer draws nothing while a translated caption is shown. */
    private fun hookNativeDraw(renderer: MutableClass) {
        val draw = ImmutableMethod(
            renderer.type, "draw", listOf(ImmutableMethodParameter(CANVAS, null, null)),
            "V", AccessFlags.PUBLIC.value, null, null, MutableMethodImplementation(3),
        ).toMutable()
        draw.addInstructionsWithLabels(
            0,
            """
                invoke-static {}, $BRIDGE->suppressNativeDraw()Z
                move-result v0
                if-eqz v0, :original
                return-void
                :original
                invoke-super {p0, p1}, ${renderer.superclass}->draw($CANVAS)V
                return-void
            """.trimIndent(),
        )
        renderer.methods.add(draw)
    }

    /**
     * A long press on a settings row copies the path of the row to the clipboard. The extension takes the long
     * press of its own rows first (a key that was typed in must not be replaced by a path); the other rows keep the
     * original behavior.
     */
    private fun hookPathCopy(fragment: MutableClass, handler: Method) {
        val original = ImmutableMethod(
            fragment.type, ORIGINAL_LONG_CLICK, handler.parameters, handler.returnType,
            handler.accessFlags, handler.annotations, null, handler.implementation,
        ).toMutable()
        val wrapper = ImmutableMethod(
            fragment.type, handler.name, handler.parameters, handler.returnType,
            handler.accessFlags, handler.annotations, null, MutableMethodImplementation(7),
        ).toMutable()
        wrapper.addInstructionsWithLabels(
            0,
            """
                invoke-static/range {p1 .. p5}, ${EXTENSION}ApiInputPolicy;->consumePathCopy(Landroid/widget/AdapterView;Landroid/view/View;IJ)Z
                move-result v0
                if-eqz v0, :original_copy
                const/4 v0, 0x1
                return v0
                :original_copy
                invoke-direct/range {p0 .. p5}, ${fragment.type}->$ORIGINAL_LONG_CLICK(Landroid/widget/AdapterView;Landroid/view/View;IJ)Z
                move-result v0
                return v0
            """.trimIndent(),
        )
        fragment.methods.remove(handler)
        fragment.methods.add(original)
        fragment.methods.add(wrapper)
    }

    // endregion

    /** Every entry point that the extension expects from the patched app is called exactly once. */
    private fun verifyHooks() {
        val required = mutableMapOf("onNativeTrackApplied" to 1, "initialize" to 1)
        if (translation) {
            for (name in listOf("onMenu", "observeMenuPath", "suppressNativeDraw", "consumePathCopy", "onVideoTime")) required[name] = 1
        }
        val counts = mutableMapOf<String, Int>()
        context.classDefForEach { app ->
            if (app.type.startsWith("Lapp/yydarlinker/")) return@classDefForEach
            for (method in app.methods) {
                method.code().mapNotNull { it.call() }
                    .filter { it.definingClass.startsWith(EXTENSION) }
                    .forEach { call -> counts[call.name] = (counts[call.name] ?: 0) + 1 }
            }
        }
        for ((name, expected) in required) {
            val actual = counts[name] ?: 0
            if (actual != expected) throw PatchException("AI captions: hook $name expected $expected call(s), found $actual")
        }
    }

    /** Tells the extension which features were selected; published last, after every hook succeeded. */
    private fun publishFeatures() {
        val support = context.mutableClassDefBy(SUPPORT)
        support.bindStub("aiInstalled", 1, "const/4 v0, ${if (translation) "0x1" else "0x0"}\nreturn v0")
    }
}

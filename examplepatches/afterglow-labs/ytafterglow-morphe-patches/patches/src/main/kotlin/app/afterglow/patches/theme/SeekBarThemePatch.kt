/* Color and seek-bar fingerprints adapted from Morphe patches (GPLv3),
 * https://github.com/MorpheApp/morphe-patches. See NOTICE.
 * Portions provided "AS IS" by the Morphe software project without express or implied warranties,
 * including merchantability and fitness for a particular purpose.
 */
package app.afterglow.patches.theme

import app.afterglow.patches.shared.Constants.EXTENSION_PACKAGE
import app.afterglow.patches.shared.afterglowExtensionPatch
import app.afterglow.patches.settings.afterglowSettingsPatch
import app.afterglow.patches.shared.invokeRegisters
import app.afterglow.patches.shared.addMethod
import app.afterglow.patches.shared.addFieldGetter
import app.afterglow.patches.shared.smali
import app.afterglow.patches.tweaks.navigation.invokeStatic
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.resource.ResourceType
import app.morphe.patcher.resourceLiteral
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.addInstructionsAtControlFlowLabel
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import app.morphe.patches.youtube.video.information.videoInformationPatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod

private const val SEEK = "$EXTENSION_PACKAGE/theme/SeekBarTheme;"

internal val seekBarThemePatch = bytecodePatch {
    dependsOn(afterglowExtensionPatch, afterglowSettingsPatch, videoInformationPatch)
    execute {
        // Reuse the original pinned response observer. Its live bit is already keyed to the
        // response id; the Java adapter additionally requires the actual current player id.
        val information = classDefBy("Lapp/morphe/extension/youtube/patches/VideoInformation;")
        val liveInfo = information.methods.single { it.name == "isLiveStream" && it.parameterTypes.isEmpty() && it.returnType == "Z" }
        val liveFields = liveInfo.implementation!!.instructions.mapNotNull {
            ((it as? ReferenceInstruction)?.reference as? FieldReference)?.name
        }.toSet()
        require(liveFields.containsAll(setOf("liveStream", "liveStreamVideoId", "playerResponseVideoId"))) {
            "Pinned VideoInformation no longer guards live state with its player response id"
        }
        val extension = mutableClassDefBy(SEEK)
        for ((bridge, target) in listOf("nativeCurrentVideoId" to "getVideoId",
            "nativeResponseVideoId" to "getPlayerResponseVideoId", "nativeResponseIsLive" to "isLiveStream")) {
            val method = information.methods.single { it.name == target && it.parameterTypes.isEmpty() }
            require(AccessFlags.PUBLIC.isSet(method.accessFlags) && AccessFlags.STATIC.isSet(method.accessFlags))
            val placeholder = extension.methods.single { it.name == bridge && it.parameterTypes.isEmpty() && it.returnType == method.returnType }
            extension.methods.remove(placeholder)
            val objectResult = method.returnType == "Ljava/lang/String;"
            require(objectResult || method.returnType == "Z")
            extension.methods.add(ImmutableMethod(SEEK, bridge, placeholder.parameters, placeholder.returnType,
                placeholder.accessFlags, placeholder.annotations, placeholder.hiddenApiRestrictions,
                MutableMethodImplementation(1)).toMutable().apply {
                addInstructions(0, """
                    invoke-static { }, ${method.smali}
                    ${if (objectResult) "move-result-object" else "move-result"} v0
                    ${if (objectResult) "return-object" else "return"} v0
                """)
            })
        }
        val bar = Fingerprint(returnType = "V", strings = listOf("timed_markers_width"))
        val draw = Fingerprint(classFingerprint = bar, name = "onDraw", parameters = listOf("Landroid/graphics/Canvas;"), returnType = "V").method
        val host = bar.classDef
        // Exact 21.43.523 geometry, confirmed in onDraw/hP: V is full track; w is played x.
        val bounds = host.fields.singleOrNull { it.name == "V" && it.type == "Landroid/graphics/Rect;" }
            ?: throw PatchException("Native seek-bar bounds changed")
        val position = host.fields.singleOrNull { it.name == "w" && it.type == "I" }
            ?: throw PatchException("Native seek-bar played position changed")
        // onDraw computes aa from the current track-height animation and sets c.j
        // alpha from that same animation. V alone remains nonempty when controls hide.
        val visibleBounds = host.fields.singleOrNull { it.name == "aa" && it.type == "Landroid/graphics/Rect;" }
            ?: throw PatchException("Native animated seek-bar bounds changed")
        val style = host.fields.singleOrNull { it.name == "c" && it.type == "Ljsc;" }
            ?: throw PatchException("Native seek-bar style changed")
        val animatedPaint = draw.implementation!!.instructions.mapNotNull {
            (it as? ReferenceInstruction)?.reference as? com.android.tools.smali.dexlib2.iface.reference.FieldReference
        }.distinct().singleOrNull { it.definingClass == style.type && it.name == "j" && it.type == "Landroid/graphics/Paint;" }
            ?: throw PatchException("Native animated seek-bar paint changed")
        host.interfaces.add("$EXTENSION_PACKAGE/theme/SeekBarHost;")
        host.addFieldGetter("afterglow_trackBounds", "Landroid/graphics/Rect;", bounds)
        host.addFieldGetter("afterglow_visibleTrackBounds", "Landroid/graphics/Rect;", visibleBounds)
        host.addMethod("afterglow_trackAlpha", "I", 2, """
            iget-object v0, p0, ${style.smali}
            iget-object v0, v0, ${animatedPaint.smali}
            invoke-virtual { v0 }, Landroid/graphics/Paint;->getAlpha()I
            move-result v0
            return v0
        """)
        host.addMethod("afterglow_playedPosition", "I", 2, "iget v0, p0, ${position.smali}\nreturn v0")
        val restore = draw.implementation!!.instructions.indexOfLast { instruction ->
            val ref = (instruction as? ReferenceInstruction)?.reference as? MethodReference
            ref?.definingClass == "Landroid/graphics/Canvas;" && ref.name == "restore"
        }
        if (restore < 0) throw PatchException("Native seek-bar canvas restore missing")
        draw.addInstructions(restore + 1, "invoke-static/range { p0 .. p1 }, $SEEK->finish(Landroid/view/View;Landroid/graphics/Canvas;)V")
        val circle = draw.implementation!!.instructions.withIndex().lastOrNull { (_, instruction) ->
            val ref = (instruction as? ReferenceInstruction)?.reference as? MethodReference
            ref?.definingClass == "Landroid/graphics/Canvas;" && ref.name == "drawCircle" && ref.parameterTypes == listOf("F", "F", "F", "Landroid/graphics/Paint;")
        } ?: throw PatchException("Native scrubber circle missing")
        // 21.43.523: Ljsb.onDraw final circle, not the two preceding timed-marker circles.
        draw.replaceInstruction(circle.index, invokeStatic(*circle.value.invokeRegisters.toIntArray(),
            method = "$SEEK->drawScrubber(Landroid/graphics/Canvas;FFFLandroid/graphics/Paint;)V"))
        draw.addInstructions(0, "invoke-static/range { p0 .. p0 }, $SEEK->begin(Landroid/view/View;)V")

        val resources = listOf(
            Triple(ResourceType.COLOR, "inline_time_bar_played_not_highlighted_color", "played"),
            Triple(ResourceType.COLOR, "inline_time_bar_colorized_bar_played_color_dark", "played"),
            Triple(ResourceType.COLOR, "reel_time_bar_played_color", "played"),
            Triple(ResourceType.COLOR, "inline_time_bar_live_seekable_range", "live"),
            Triple(ResourceType.COLOR, "inline_time_bar_buffered_color", "buffered"),
            Triple(ResourceType.COLOR, "inline_time_bar_buffered_highlighted_color", "buffered"),
            Triple(ResourceType.COLOR, "inline_time_bar_colorized_bar_buffered_color_dark", "buffered"),
        )
        val bufferedFields = mapOf("inline_time_bar_buffered_color" to "j",
            "inline_time_bar_buffered_highlighted_color" to "l", "inline_time_bar_colorized_bar_buffered_color_dark" to "k")
        resources.forEach { (type, resource, method) ->
            val matches = Fingerprint(accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.CONSTRUCTOR),
                filters = listOf(resourceLiteral(type, resource)),
                custom = { _, cls -> !cls.type.startsWith("$EXTENSION_PACKAGE/") }).matchAll()
            if (method == "buffered") require(matches.size == 1 && matches.single().method.definingClass == "Ljsd;") {
                "Expected one native buffered color owner for $resource"
            }
            matches.forEach { match ->
                val index = match.instructionMatches.first().index
                val instructions = match.method.implementation!!.instructions
                val literal = (instructions[index] as OneRegisterInstruction).registerA
                // Shorts keeps this resource id across a branch: both getColor calls
                // must be wrapped. Follow the live register until it is overwritten.
                val calls = mutableListOf<Int>()
                for (candidate in index+1 until instructions.size) {
                    val ref = (instructions[candidate] as? ReferenceInstruction)?.reference as? MethodReference
                    if (ref?.returnType == "I" && ref.name == "getColor"
                            && literal in instructions[candidate].invokeRegisters
                            && instructions.getOrNull(candidate+1)?.opcode == Opcode.MOVE_RESULT) calls += candidate
                    if (instructions[candidate].opcode.setsRegister()
                            && (instructions[candidate] as? OneRegisterInstruction)?.registerA == literal) break
                }
                if (calls.isEmpty()) throw PatchException("No resolved color for $resource in ${match.method.definingClass}")
                if (method == "buffered") {
                    require(calls.size == 1) { "Expected one buffered resource read for $resource" }
                    val store = instructions.getOrNull(calls.single() + 2)
                    val field = (store as? ReferenceInstruction)?.reference as? FieldReference
                    require(store?.opcode == Opcode.IPUT && field?.definingClass == "Laruc;" &&
                            field.type == "I" && field.name == bufferedFields[resource]) {
                        "Buffered color no longer initializes the verified Laruc field for $resource"
                    }
                }
                calls.asReversed().forEach { call ->
                    val register = (instructions[call+1] as OneRegisterInstruction).registerA
                    match.method.addInstructions(call+2, """
                        invoke-static/range { v$register .. v$register }, $SEEK->$method(I)I
                        move-result v$register
                    """)
                }
                println("Afterglow seek color: $resource, ${calls.size} resolved calls in ${match.method.definingClass}")
            }
        }
        val gradient = Fingerprint(accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
            parameters = listOf("I", "I", "I", "I", "Landroid/content/Context;", "I"),
            returnType = "Landroid/graphics/LinearGradient;",
            filters = listOf(resourceLiteral(ResourceType.COLOR, "yt_youtube_magenta"))).method
        gradient.implementation!!.instructions.withIndex().filter { it.value.opcode == Opcode.RETURN_OBJECT }
            .map { it.index }.asReversed().forEach { index ->
                val register = (gradient.implementation!!.instructions[index] as OneRegisterInstruction).registerA
                gradient.addInstructionsAtControlFlowLabel(index, """
                    invoke-static/range { v$register .. v$register }, $SEEK->gradient(Landroid/graphics/LinearGradient;)Landroid/graphics/LinearGradient;
                    move-result-object v$register
                """)
            }
        println("Afterglow seek bar: ${draw.definingClass}->onDraw, ${gradient.definingClass}->${gradient.name}")
    }
}

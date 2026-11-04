package io.github.pengusto.patches.calendar

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import org.w3c.dom.Element
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation

private val descriptionLayout = resourcePatch {
    execute {
        document("res/layout/activity_event.xml").use { xml ->
            val doc = xml
            check((0 until doc.getElementsByTagName("LinearLayout").length).none {
                (doc.getElementsByTagName("LinearLayout").item(it) as Element)
                    .getAttribute("android:id").endsWith("/penguin_description_holder")
            }) { "Calendar description preview is already installed" }
            val nodes = doc.getElementsByTagName("org.fossify.commons.views.MyEditText")
            val editor = (0 until nodes.length).map { nodes.item(it) as Element }
                .single { it.getAttribute("android:id").endsWith("/event_description") }
            val holder = doc.createElement("LinearLayout")
            for (name in listOf("layout_width", "layout_height", "layout_below", "layout_marginStart", "layout_marginTop", "layout_marginEnd")) {
                holder.setAttribute("android:$name", editor.getAttribute("android:$name"))
                if (name !in listOf("layout_width", "layout_height")) editor.removeAttribute("android:$name")
            }
            holder.setAttribute("android:id", "@+id/penguin_description_holder")
            holder.setAttribute("android:orientation", "vertical")
            editor.parentNode.replaceChild(holder, editor)
            holder.appendChild(editor)
            val images = doc.getElementsByTagName("ImageView")
            (0 until images.length).map { images.item(it) as Element }
                .single { it.getAttribute("android:id").endsWith("/event_description_divider") }
                .setAttribute("android:layout_below", "@id/penguin_description_holder")
        }
    }
}

@Suppress("unused")
val readableDescriptionPatch = bytecodePatch(
    name = "Readable Calendar descriptions",
    description = "Readable event descriptions in the editor, lists, widget and reminders; preserves the original editor text.",
    default = true
) {
    compatibleWith(Compatibility(name = "Fossify Calendar", packageName = "org.fossify.calendar", targets = listOf(AppTarget(version = "1.12.0"), AppTarget(version = "1.12.1"))))
    dependsOn(descriptionLayout)
    extendWith("extensions/extension.mpe")
    execute {
        fun MutableMethod.renderDescription(model: String, surface: String) {
            val code = implementation!!.instructions
            check(code.none { instruction ->
                val ref = (instruction as? ReferenceInstruction)?.reference as? MethodReference
                ref?.definingClass == "Lio/github/pengusto/patches/extension/calendar/DescriptionPreview;" && ref.name == "summary"
            }) { "Calendar $surface is already patched" }
            val matches = code.indices.filter { index ->
                val ref = (code[index] as? ReferenceInstruction)?.reference as? MethodReference
                ref?.definingClass == "Lorg/fossify/calendar/models/$model;" &&
                    ref.name == "getDescription" && ref.returnType == "Ljava/lang/String;" &&
                    ref.parameterTypes.isEmpty()
            }
            check(matches.size == 1) { "Unexpected $surface description binding" }
            val index = matches.single()
            check(index >= 3 && index + 2 < code.size &&
                code[index - 1].opcode == Opcode.GOTO &&
                code[index + 1].opcode == Opcode.MOVE_RESULT_OBJECT) {
                "Unexpected $surface description/location branch"
            }
            val location = (code[index - 3] as? ReferenceInstruction)?.reference as? MethodReference
            check(location?.definingClass == "Lorg/fossify/calendar/models/$model;" &&
                location.name == "getLocation") { "Unexpected $surface location binding" }
            val register = (code[index + 1] as OneRegisterInstruction).registerA
            addInstructions(index + 2, """
                invoke-static/range {v$register .. v$register}, Lio/github/pengusto/patches/extension/calendar/DescriptionPreview;->summary(Ljava/lang/String;)Ljava/lang/String;
                move-result-object v$register
            """.trimIndent())
        }

        // R8 renames these owners between the official 1.12.0 and 1.12.1 APKs.
        // Require exactly one matching owner and a single, guarded description branch.
        fun binding(owners: List<String>, name: String, returnType: String, parameters: List<String>, model: String): MutableMethod {
            val candidates = owners.mapNotNull { owner ->
                Fingerprint(definingClass = owner, name = name, returnType = returnType, parameters = parameters).methodOrNull
            }.filter { method ->
                method.implementation?.instructions?.any { instruction ->
                    val ref = (instruction as? ReferenceInstruction)?.reference as? MethodReference
                    ref?.definingClass == "Lorg/fossify/calendar/models/$model;" && ref.name == "getDescription"
                } == true
            }
            check(candidates.size == 1) { "Unsupported Calendar $name binding" }
            return candidates.single()
        }
        binding(listOf("Lxp0;", "Lwp0;"), "getViewAt", "Landroid/widget/RemoteViews;", listOf("I"), "ListEvent")
            .renderDescription("ListEvent", "widget")
        binding(listOf("Lr50;", "Lq50;"), "C", "V", listOf("Landroid/content/Context;", "Lorg/fossify/calendar/models/Event;"), "Event")
            .renderDescription("Event", "notification")

        // Calendar's shared EditText.value helper trims whitespace. Replace only
        // the description save call, and delegate plain text to that exact helper.
        val saveCandidates = listOf("o0", "q0").mapNotNull { name ->
            Fingerprint(definingClass = "Lorg/fossify/calendar/activities/EventActivity;", name = name,
                returnType = "V", parameters = emptyList()).methodOrNull
        }.filter { candidate -> candidate.implementation!!.instructions.any { instruction ->
            val ref = (instruction as? ReferenceInstruction)?.reference as? MethodReference
            ref?.definingClass == "Lorg/fossify/calendar/models/Event;" && ref.name == "setDescription"
        } }
        check(saveCandidates.size == 1) { "Unexpected Calendar description save method" }
        val save = saveCandidates.single()
        val saveCode = save.implementation!!.instructions
        val setters = saveCode.indices.filter { index ->
            val ref = (saveCode[index] as? ReferenceInstruction)?.reference as? MethodReference
            ref?.definingClass == "Lorg/fossify/calendar/models/Event;" && ref.name == "setDescription" &&
                ref.parameterTypes.map { it.toString() } == listOf("Ljava/lang/String;")
        }
        check(setters.size == 1 && setters.single() >= 2) { "Unexpected Calendar description setter" }
        val valueIndex = setters.single() - 2
        val valueCall = saveCode[valueIndex] as? FiveRegisterInstruction
            ?: error("Unexpected Calendar description value call")
        val nativeValue = (valueCall as? ReferenceInstruction)?.reference as? MethodReference
            ?: error("Missing Calendar description value helper")
        check(valueCall.opcode == Opcode.INVOKE_STATIC && valueCall.registerCount == 1 &&
            nativeValue.parameterTypes.map { it.toString() } == listOf("Landroid/widget/EditText;") &&
            nativeValue.returnType == "Ljava/lang/String;" && saveCode[valueIndex + 1].opcode == Opcode.MOVE_RESULT_OBJECT) {
            "Unexpected Calendar native description value helper"
        }
        save.replaceInstruction(valueIndex, "invoke-static {v${valueCall.registerC}}, Lio/github/pengusto/patches/extension/calendar/DescriptionPreview;->saveValue(Landroid/widget/EditText;)Ljava/lang/String;")
        val bridge = Fingerprint(definingClass = "Lio/github/pengusto/patches/extension/calendar/DescriptionPreview;",
            name = "nativeValue", returnType = "Ljava/lang/String;", parameters = listOf("Landroid/widget/EditText;")).method
        val linked = MutableMethod(ImmutableMethod(bridge.definingClass, bridge.name, bridge.parameters,
            bridge.returnType, bridge.accessFlags, bridge.annotations, bridge.hiddenApiRestrictions,
            ImmutableMethodImplementation(1, emptyList(), emptyList(), emptyList())))
        linked.addInstructions(0, """
            invoke-static/range {p0 .. p0}, ${nativeValue.definingClass}->${nativeValue.name}(Landroid/widget/EditText;)Ljava/lang/String;
            move-result-object p0
            return-object p0
        """.trimIndent())
        mutableClassDefBy(bridge.definingClass).methods.apply {
            check(remove(bridge)) { "Missing Calendar description value bridge" }
            add(linked)
        }
        // Convert only the description getter result, before it reaches the row.
        // Location substitution, visibility and stored model data remain untouched.
        // R8 merges the day/agenda row binders into this shared lambda in 1.12.0.
        // Match its exact signature and require one getter for each model.
        for (model in listOf("Event", "ListEvent")) {
            val row = Fingerprint(
                definingClass = "Lb;",
                name = "g", returnType = "Ljava/lang/Object;",
                parameters = listOf("Ljava/lang/Object;", "Ljava/lang/Object;")
            ).method
            val code = row.implementation!!.instructions
            val getters = code.indices.filter { index ->
                val ref = (code[index] as? ReferenceInstruction)?.reference as? MethodReference
                ref?.definingClass == "Lorg/fossify/calendar/models/$model;" &&
                    ref.name == "getDescription" && ref.returnType == "Ljava/lang/String;" &&
                    ref.parameterTypes.isEmpty()
            }
            check(getters.size == 1) { "Unexpected $model list description binding" }
            val resultIndex = getters.single() + 1
            check(code[resultIndex].opcode == Opcode.MOVE_RESULT_OBJECT) {
                "Unexpected $model list description result"
            }
            val register = (code[resultIndex] as OneRegisterInstruction).registerA
            row.addInstructions(resultIndex + 1, """
                invoke-static/range {v$register .. v$register}, Lio/github/pengusto/patches/extension/calendar/DescriptionPreview;->summary(Ljava/lang/String;)Ljava/lang/String;
                move-result-object v$register
            """.trimIndent())
        }
        val method = Fingerprint(
            definingClass = "Lorg/fossify/calendar/activities/EventActivity;",
            name = "onResume", returnType = "V", parameters = emptyList()
        ).method
        val instructions = method.implementation!!.instructions
        check(instructions.last().opcode == Opcode.RETURN_VOID) { "Unexpected EventActivity.onResume layout" }
        method.addInstruction(instructions.size - 1,
            "invoke-static/range {p0 .. p0}, Lio/github/pengusto/patches/extension/calendar/DescriptionPreview;->attach(Landroid/app/Activity;)V")
    }
}

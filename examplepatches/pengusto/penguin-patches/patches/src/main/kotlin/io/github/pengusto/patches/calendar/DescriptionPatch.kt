package io.github.pengusto.patches.calendar

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import org.w3c.dom.Element
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private val descriptionLayout = resourcePatch {
    execute {
        document("res/layout/activity_event.xml").use { xml ->
            val doc = xml
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
    description = "Readable day/agenda summaries and native Outlook/Exchange HTML preview with explicit source editing; preserves the original editor text.",
    default = true
) {
    compatibleWith(Compatibility(name = "Fossify Calendar", packageName = "org.fossify.calendar", targets = listOf(AppTarget(version = "1.12.0"))))
    dependsOn(descriptionLayout)
    extendWith("extensions/extension.mpe")
    execute {
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

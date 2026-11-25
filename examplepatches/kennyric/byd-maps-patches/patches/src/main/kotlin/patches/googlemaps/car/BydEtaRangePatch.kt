package org.ungoogled.patches.maps.car

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import org.ungoogled.patches.shared.Constants.COMPATIBILITY_MAPS
import org.w3c.dom.Element

private const val ANDROID_NS = "http://schemas.android.com/apk/res/android"
/** Read access to byd-open-remote's read-only vehicle provider; normal level, so install grants it. */
private const val VEHICLE_PERMISSION = "com.bydopenremote.app.permission.READ_VEHICLE"

/** Declares the provider's read permission, which Maps must hold to query the vehicle status. */
private val bydVehiclePermission = resourcePatch {
    execute {
        document("AndroidManifest.xml").use { doc ->
            val root = doc.documentElement
            val declared = (0 until doc.getElementsByTagName("uses-permission").length)
                .map { doc.getElementsByTagName("uses-permission").item(it) as Element }
                .any { it.getAttributeNS(ANDROID_NS, "name") == VEHICLE_PERMISSION }
            if (!declared) {
                root.appendChild(doc.createElement("uses-permission").apply {
                    setAttributeNS(ANDROID_NS, "android:name", VEHICLE_PERMISSION)
                })
            }
        }
    }
}

/**
 * The navigation card's status line -- "12 min  5.2 km" -- is built from `Lbltz;->b`, the string
 * handed to `TurnCardStatusContainerLayout`'s `@id/status_text` by `Lbmkg`. Decorating it here
 * reaches the projected car screen and the phone alike, because both bind that same card.
 */
@Suppress("unused")
val bydEtaRangePatch = bytecodePatch(
    name = "BYD battery and range in the navigation card",
    description = "Appends the vehicle's state of charge and remaining electric range, published by " +
        "byd-open-remote, to the time-and-distance status line of the navigation card.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_MAPS)
    dependsOn(nativeCarNavigationPatch, bydVehiclePermission)
    execute {
        val status = mutableClassDefBy("Lbltz;")

        if (status.fields.none { it.name == "b" && it.type == "Ljava/lang/String;" })
            throw PatchException("Maps' navigation card status text field changed: Lbltz;->b is not a String")

        val ctor = status.methods.singleOrNull {
            it.name == "<init>" && it.parameterTypes.map(CharSequence::toString) ==
                listOf("Lblty;", "Ljava/lang/String;", "Lj$/util/Optional;", "Lbluk;")
        } ?: throw PatchException(
            "Maps' navigation card status value changed: Lbltz;<init>(Lblty;Ljava/lang/String;" +
                "Lj\$/util/Optional;Lbluk;)V is gone"
        )

        val instructions = ctor.implementation!!.instructions
        val superCall = instructions.indexOfFirst {
            val reference = (it as? ReferenceInstruction)?.reference as? MethodReference
            it.opcode == Opcode.INVOKE_DIRECT &&
                reference?.definingClass == "Ljava/lang/Object;" &&
                reference.name == "<init>" &&
                reference.parameterTypes.isEmpty()
        }
        if (superCall < 0) throw PatchException("Maps' navigation card status constructor has no Object super call")

        ctor.addInstructions(superCall + 1, """
            invoke-static {p2}, Lpatches/maps/gearslip/BydVehicle;->decorate(Ljava/lang/String;)Ljava/lang/String;
            move-result-object p2
        """)

        // The phone's navigation strip is repainted by Maps once a second, so it is decorated from
        // the Application start rather than at a call site; the car UI needs only the hook above.
        // GoogleMapsApplication declares no onCreate of its own; Lnsn does (pinned to this build).
        val application = mutableClassDefBy("Lnsn;")
        val onCreate = application.methods.singleOrNull {
            it.name == "onCreate" && it.parameterTypes.isEmpty() && it.returnType == "V"
        } ?: throw PatchException("Maps' Application no longer declares onCreate()")
        val superInit = onCreate.implementation!!.instructions.indexOfFirst {
            it.opcode == Opcode.INVOKE_SUPER || it.opcode == Opcode.INVOKE_SUPER_RANGE
        }
        onCreate.addInstructions(if (superInit < 0) 0 else superInit + 1, """
            invoke-static {p0}, Lpatches/maps/gearslip/BydVehicle;->attach(Landroid/content/Context;)V
        """)
    }
}

/**
 * Anchor verification: names every text of Maps' own car surface so one head-unit screenshot says
 * which view the vehicle figures belong on. Selected with `-e` next to the range patch; deleted as
 * soon as the view is known.
 */
@Suppress("unused")
val bydLabelProbePatch = bytecodePatch(
    name = "BYD label probe in the navigation card",
    description = "Verification only: prefixes every text of the navigation card (status line, step " +
        "distance, road cue, next-step instruction) with a short token and the view's resource id, " +
        "so the vehicle figures can be placed on the view that actually reaches the car screen.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_MAPS)
    dependsOn(nativeCarNavigationPatch)
    execute {
        // Each declared setText on these views, plus the status binder that fills @id/status_text.
        // The receiver and text registers are already live at the call, so the hook needs no scratch
        // register and cannot disturb the surrounding method. Each site paints its own number, so a
        // screenshot says which injection actually reaches the car screen.
        val sites = listOf(
            Triple("Lcom/google/android/libraries/geo/navcore/turncard/views/TurnCardStepDistanceTextView;", "a", "999"),
            Triple("Lcom/google/android/libraries/geo/navcore/turncard/views/TurnCardStepCueTextView;", "b", "998"),
            Triple("Lcom/google/android/libraries/geo/navcore/turncard/views/TurnCardNextStepInstructionView;", "a", "997"),
            Triple("Lbmkg;", "a", "996"),
        )
        var hooked = 0
        for ((owner, name, value) in sites) {
            val methods = mutableClassDefBy(owner).methods.filter { it.name == name }
            if (methods.isEmpty()) throw PatchException("Maps' navigation card changed: $owner->$name is gone")
            for (method in methods) {
                val calls = method.implementation?.instructions?.withIndex()?.filter { (_, instruction) ->
                    val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference
                    instruction.opcode == Opcode.INVOKE_VIRTUAL &&
                        reference?.name == "setText" &&
                        reference.parameterTypes.map(CharSequence::toString) == listOf("Ljava/lang/CharSequence;")
                }?.map { it.index }?.toList() ?: continue
                // Backwards, so an insertion does not shift the indices still to be spliced.
                for (index in calls.asReversed()) {
                    val call = method.implementation!!.instructions[index] as FiveRegisterInstruction
                    val view = call.registerC
                    val text = call.registerD
                    method.addInstructions(index, """
                        invoke-static {v$view, v$text}, Lpatches/maps/gearslip/BydLabelProbe;->number$value(Landroid/widget/TextView;Ljava/lang/CharSequence;)Ljava/lang/String;
                        move-result-object v$text
                    """)
                    hooked++
                }
                // Read back: proves the insert reached this method's instruction list, so a missing
                // hook in the written dex is a writer problem rather than a site-scan problem.
                val after = method.implementation?.instructions?.count() ?: -1
                val marked = method.implementation?.instructions?.count {
                    (it as? ReferenceInstruction)?.reference?.toString()?.contains("BydLabelProbe") == true
                } ?: -1
                println("BYD probe: $owner->$name sites=${calls.size} instructions=$after marked=$marked")
            }
        }
        if (hooked == 0) throw PatchException("Maps' navigation card has no setText call to label")
        println("BYD probe: hooked $hooked setText call(s) in ${sites.size} classes")

        // 995: the status value object itself, upstream of every view, so it survives a repaint.
        val status = mutableClassDefBy("Lbltz;")
        val ctor = status.methods.single {
            it.name == "<init>" && it.parameterTypes.map(CharSequence::toString) ==
                listOf("Lblty;", "Ljava/lang/String;", "Lj$/util/Optional;", "Lbluk;")
        }
        ctor.addInstructions(1, """
            invoke-static {p2}, Lpatches/maps/gearslip/BydLabelProbe;->number995(Ljava/lang/String;)Ljava/lang/String;
            move-result-object p2
        """)
        println("BYD probe: status value object hooked with 995")
    }
}

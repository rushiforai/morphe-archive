package app.fakh.patches.jira

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val PAGE = "app.fakh.extension.jira.FakhPatchesActivity"

/** A puzzle piece, the Material extension icon, in the size and color of the Account screen's own icons. */
private const val ICON = """<?xml version="1.0" encoding="utf-8"?>
<vector xmlns:android="http://schemas.android.com/apk/res/android" android:width="24dp" android:height="24dp"
    android:viewportWidth="24" android:viewportHeight="24">
    <path android:fillColor="#172b4d" android:pathData="M20.5,11H19V7c0,-1.1 -0.9,-2 -2,-2h-4V3.5C13,2.12 11.88,1 10.5,1S8,2.12 8,3.5V5H4c-1.1,0 -1.99,0.9 -1.99,2v3.8H3.5c1.49,0 2.7,1.21 2.7,2.7s-1.21,2.7 -2.7,2.7H2V20c0,1.1 0.9,2 2,2h3.8v-1.5c0,-1.49 1.21,-2.7 2.7,-2.7 1.49,0 2.7,1.21 2.7,2.7V22H17c1.1,0 2,-0.9 2,-2v-4h1.5c1.38,0 2.5,-1.12 2.5,-2.5S21.88,11 20.5,11z" />
</vector>
"""

/** The title and icon of the Fakh Patches row, and the page it opens. */
private val fakhPatchesPagePatch = resourcePatch {
    execute {
        document("res/values/strings.xml").use { strings ->
            val title = strings.createElement("string")
            title.setAttribute("name", "fakh_patches")
            title.textContent = "Fakh Patches"
            strings.getElementsByTagName("resources").item(0).appendChild(title)
        }
        get("res/drawable/fakh_ic_patches.xml").writeText(ICON)
        document("AndroidManifest.xml").use { manifest ->
            val activity = manifest.createElement("activity")
            activity.setAttribute("android:name", PAGE)
            activity.setAttribute("android:exported", "false")
            activity.setAttribute("android:theme", "@style/Theme.Jira.M3.DayNight")
            manifest.getElementsByTagName("application").item(0).appendChild(activity)
        }
    }
}

/**
 * Adds the Fakh Patches card to the Account screen, under the card of Notification settings and Settings, which opens
 * the page of the patches' switches. The screen is one composable in `ProfileScreenKt` that draws its cards with
 * SpacedItemsKt.a calls, that card first; the call to the extension goes after it and only reads the composer's
 * register. Patches that have a switch depend on this one.
 */
val settingsRowsPatch = bytecodePatch {
    extendWith("extensions/extension.mpe")
    dependsOn(fakhPatchesPagePatch)

    execute {
        var added = 0
        classDefForEach { classDef ->
            // The class name first: reading the code of every class in the app takes far longer.
            if (!classDef.type.endsWith("/profile/impl/view/ProfileScreenKt;")) return@classDefForEach
            classDef.methods.forEach { method ->
                val instructions = method.implementation?.instructions?.toList() ?: return@forEach
                val cards = instructions.withIndex().filter { (_, instruction) ->
                    instruction.opcode == Opcode.INVOKE_STATIC_RANGE &&
                        ((instruction as ReferenceInstruction).reference as MethodReference).let {
                            it.definingClass.endsWith("/SpacedItemsKt;") && it.name == "a" && it.parameterTypes.size == 7
                        }
                }
                if (cards.size < 2) return@forEach
                val composer = (cards[0].value as RegisterRangeInstruction).startRegister + 4
                mutableClassDefBy(classDef).methods.first {
                    it.name == method.name && it.parameterTypes.map(CharSequence::toString) == method.parameterTypes.map(CharSequence::toString)
                }.addInstructions(
                    cards[0].index + 1,
                    "invoke-static/range { v$composer .. v$composer }, Lapp/fakh/extension/jira/FakhSettings;->addCard(Ljava/lang/Object;)V",
                )
                added++
            }
        }
        if (added != 1) throw PatchException("Expected one Account screen, found $added")
    }
}

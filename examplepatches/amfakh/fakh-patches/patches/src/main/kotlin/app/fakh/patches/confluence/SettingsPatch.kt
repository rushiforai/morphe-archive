package app.fakh.patches.confluence

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.document
import app.morphe.patcher.patch.mutableClassDefBy
import app.morphe.patcher.patch.patch

private const val PAGE = "app.fakh.extension.confluence.FakhPatchesActivity"

/**
 * React Native's text transform (none, uppercase, lowercase, capitalize), which every piece of text passes before it
 * is measured and drawn. R8 renames it; it is the static (String, enum) to String method that splits words with a
 * BreakIterator.
 */
private val textTransformFingerprint = Fingerprint(
    returnType = "Ljava/lang/String;",
    filters = listOf(methodCall(definingClass = "Ljava/text/BreakIterator;", name = "getWordInstance")),
    custom = { method, _ ->
        method.parameterTypes.size == 2 && method.parameterTypes[0].toString() == "Ljava/lang/String;" &&
            com.android.tools.smali.dexlib2.AccessFlags.STATIC.isSet(method.accessFlags)
    },
)

/** The Fakh Patches page and its manifest entry. */
private val fakhPatchesPagePatch = patch {
    execute {
        document("AndroidManifest.xml").use { manifest ->
            val activity = manifest.createElement("activity")
            activity.setAttribute("android:name", PAGE)
            activity.setAttribute("android:exported", "false")
            activity.setAttribute("android:theme", "@android:style/Theme.DeviceDefault.DayNight")
            manifest.getElementsByTagName("application").item(0).appendChild(activity)
        }
    }
}

/**
 * Turns the "Rate us" row of the Account screen into the Fakh Patches row, which opens the page of the patches'
 * switches. The row is React Native, so it keeps its place and look: its label is renamed where React Native turns
 * text into what it measures and draws, its star icon becomes a puzzle piece where react-native-svg takes its path,
 * and its link, which Linking.openURL opens, starts the page instead. Patches that have a switch depend on this one.
 */
internal val settingsPatch = patch {
    extendWith("extensions/extension.mpe")
    dependsOn(fakhPatchesPagePatch)

    execute {
        textTransformFingerprint.method.addInstructions(
            0,
            """
                invoke-static { p0 }, $EXTENSION->label(Ljava/lang/String;)Ljava/lang/String;
                move-result-object p0
            """,
        )

        val setPath = mutableClassDefBy("Lcom/horcrux/svg/RenderableViewManager\$PathViewManager;").methods.singleOrNull {
            it.name == "setD" && it.parameterTypes.size == 2 && it.parameterTypes[0].toString() != "Landroid/view/View;"
        } ?: throw PatchException("The SVG path setter not found")
        setPath.addInstructions(
            0,
            """
                invoke-static/range { p2 .. p2 }, $EXTENSION->path(Ljava/lang/String;)Ljava/lang/String;
                move-result-object p2
            """,
        )

        val openUrl = mutableClassDefBy("Lcom/facebook/react/modules/intent/IntentModule;").methods.singleOrNull {
            it.name == "openURL" && it.parameterTypes.size == 2
        } ?: throw PatchException("Linking.openURL not found")
        openUrl.addInstructionsWithLabels(
            0,
            """
                invoke-static { p0, p1 }, $EXTENSION->openUrl(Ljava/lang/Object;Ljava/lang/String;)Z
                move-result v0
                if-eqz v0, :keep
                invoke-static { v0 }, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;
                move-result-object v0
                invoke-interface { p2, v0 }, Lcom/facebook/react/bridge/Promise;->resolve(Ljava/lang/Object;)V
                return-void
                :keep
                nop
            """,
        )
    }
}

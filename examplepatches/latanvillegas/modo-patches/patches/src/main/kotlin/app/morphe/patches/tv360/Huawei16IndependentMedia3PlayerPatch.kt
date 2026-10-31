package app.morphe.patches.tv360

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import org.w3c.dom.Element

private const val TV360_MEDIA3_HOME = "Lcom/viettel/tv360/ui/home/HomeBoxActivity;"
private const val TV360_MEDIA3_ENTRY =
    "Lapp/morphe/extension/tv360/PlayerEntry;->install(Landroid/app/Activity;)V"
private const val TV360_MEDIA3_ACTIVITY =
    "app.morphe.extension.tv360.ExternalPlayerActivity"
private const val TV360_YOUTUBE_ACTIVITY =
    "app.morphe.extension.tv360.YouTubeInsideActivity"

/**
 * Registers an unexported, independent Android Activity. No manifest launch
 * filters and no access to TV360's internal media playback, DRM or login.
 */
private val tv360IndependentMedia3ManifestPatch = resourcePatch {
    compatibleWith("com.bitel.tv360"("1.6"))

    execute {
        document("AndroidManifest.xml").use { doc ->
            val application = doc.getElementsByTagName("application").item(0) as? Element
                ?: throw PatchException("TV360 Media3: manifest has no application")

            val activities = application.getElementsByTagName("activity")
            if ((0 until activities.length).any { index ->
                    (activities.item(index) as? Element)
                        ?.getAttribute("android:name") == TV360_MEDIA3_ACTIVITY
                }) {
                throw PatchException("TV360 Media3: activity already declared")
            }

            val activity = doc.createElement("activity")
            activity.setAttribute("android:name", TV360_MEDIA3_ACTIVITY)
            activity.setAttribute("android:exported", "false")
            activity.setAttribute("android:label", "Mi reproductor")
            activity.setAttribute("android:theme", "@android:style/Theme.Material.NoActionBar")
            activity.setAttribute("android:screenOrientation", "unspecified")
            activity.setAttribute("android:supportsPictureInPicture", "true")
            activity.setAttribute("android:resizeableActivity", "true")
            application.appendChild(activity)

            val youtubeActivityAlreadyDeclared = (0 until activities.length).any { index ->
                (activities.item(index) as? Element)
                    ?.getAttribute("android:name") == TV360_YOUTUBE_ACTIVITY
            }
            if (youtubeActivityAlreadyDeclared) {
                throw PatchException("TV360 Media3: YouTube in-app activity already declared")
            }
            val youtubeActivity = doc.createElement("activity")
            youtubeActivity.setAttribute("android:name", TV360_YOUTUBE_ACTIVITY)
            youtubeActivity.setAttribute("android:exported", "false")
            youtubeActivity.setAttribute("android:label", "YouTube · TV360")
            youtubeActivity.setAttribute("android:theme", "@android:style/Theme.Material.NoActionBar")
            youtubeActivity.setAttribute("android:screenOrientation", "unspecified")
            youtubeActivity.setAttribute("android:hardwareAccelerated", "true")
            application.appendChild(youtubeActivity)
        }
    }
}

/**
 * Independent optional player powered by AndroidX Media3 ExoPlayer 1.11.1.
 *
 * Original TV360 playback, media classes and protected services are untouched.
 * The entry point places a visible floating launcher below the top toolbar
 * after HomeBoxActivity resumes. Media3 classes are in an optional DEX.
 */
@Suppress("unused")
val tv360IndependentMedia3PlayerPatch = bytecodePatch(
    name = "TV360 Bitel 1.6 - My Media3 Player",
    description = "Adds a visible top-right Media3 launcher for HTTP(S), local files, IPTV M3U, external subtitles and safe favourites. Does not replace TV360 playback.",
    default = false,
) {
    compatibleWith("com.bitel.tv360"("1.6"))
    dependsOn(tv360IndependentMedia3ManifestPatch)
    extendWith("extensions/tv360-media3.mpe")

    execute {
        if (classDefByOrNull("Lapp/morphe/extension/tv360/PlayerEntry;") == null ||
            classDefByOrNull("Lapp/morphe/extension/tv360/ExternalPlayerActivity;") == null ||
            classDefByOrNull("Lapp/morphe/extension/tv360/YouTubeInsideActivity;") == null) {
            throw PatchException("TV360 Media3: extension DEX missing entry/player/YouTube classes")
        }

        val onResume = Fingerprint(
            definingClass = TV360_MEDIA3_HOME,
            name = "onResume",
            returnType = "V",
            parameters = emptyList(),
        ).method

        val instructions = onResume.implementation?.instructions?.toList()
            ?: throw PatchException("TV360 Media3: HomeBoxActivity.onResume has no code")
        val superIndex = instructions.indexOfFirst { instruction ->
            (instruction.opcode == Opcode.INVOKE_SUPER ||
                instruction.opcode == Opcode.INVOKE_SUPER_RANGE) &&
                (instruction as? ReferenceInstruction)
                    ?.reference?.toString()?.endsWith("->onResume()V") == true
        }
        if (superIndex < 0) {
            throw PatchException("TV360 Media3: super.onResume() call not found")
        }

        // HomeBoxActivity.onResume returns early on Android API >= 24.
        // Install once immediately after super.onResume, before either return path.
        // The entry itself is idempotent; native TV360 playback is untouched.
        onResume.addInstruction(superIndex + 1, "invoke-static {p0}, $TV360_MEDIA3_ENTRY")

        // TV360 1.6 ships an older Guava whose ImmutableMap.Builder has no
        // buildOrThrow(). Media3 1.11.1 invokes it from more than one class
        // (AudioCapabilities and DefaultAnalyticsCollector at minimum).
        // Rewrite EVERY matching call within Media3 only. Preserve the host's
        // Guava and all of TV360's original media/playback instructions.
        fun isIncompatibleGuavaCall(instruction: Instruction): Boolean {
            val target = (instruction as? ReferenceInstruction)?.reference as? MethodReference
                ?: return false
            return target.definingClass == "Lcom/google/common/collect/ImmutableMap\$Builder;" &&
                target.name == "buildOrThrow" &&
                target.parameterTypes.isEmpty() &&
                target.returnType == "Lcom/google/common/collect/ImmutableMap;"
        }

        // Find affected classes without materializing mutable copies of every
        // class in the host APK; mutation is limited to matched Media3 classes.
        val affectedClassTypes = mutableListOf<String>()
        classDefForEach { classDef ->
            if (!classDef.type.startsWith("Landroidx/media3/")) return@classDefForEach
            if (classDef.methods.any { method ->
                    method.implementation?.instructions?.any { instruction ->
                        isIncompatibleGuavaCall(instruction)
                    } == true
                }) {
                affectedClassTypes.add(classDef.type)
            }
        }

        val audioClass = "Landroidx/media3/exoplayer/audio/AudioCapabilities;"
        val analyticsClass =
            "Landroidx/media3/exoplayer/analytics/DefaultAnalyticsCollector\$MediaPeriodQueueTracker;"
        if (audioClass !in affectedClassTypes || analyticsClass !in affectedClassTypes) {
            throw PatchException("TV360 Media3: expected Guava call sites missing in audio/analytics")
        }

        var compatibilityCalls = 0
        for (classType in affectedClassTypes) {
            val media3Class = mutableClassDefBy(classType)
            for (method in media3Class.methods) {
                method.implementation?.instructions?.toList()?.forEachIndexed { index, instruction ->
                    if (!isIncompatibleGuavaCall(instruction)) return@forEachIndexed

                    val register = when (instruction.opcode) {
                        Opcode.INVOKE_VIRTUAL ->
                            (instruction as? FiveRegisterInstruction)?.registerC
                        Opcode.INVOKE_VIRTUAL_RANGE ->
                            (instruction as? RegisterRangeInstruction)?.startRegister
                        else -> null
                    } ?: throw PatchException(
                        "TV360 Media3: unsupported Guava call in $classType->" + method.name
                    )
                    val isRange = instruction.opcode == Opcode.INVOKE_VIRTUAL_RANGE
                    val opcode = if (isRange) "invoke-virtual/range" else "invoke-virtual"
                    val registers = if (isRange) "{v$register .. v$register}" else "{v$register}"
                    method.replaceInstruction(
                        index,
                        "$opcode $registers, Lcom/google/common/collect/ImmutableMap\$Builder;->build()Lcom/google/common/collect/ImmutableMap;"
                    )
                    compatibilityCalls++
                }
            }
        }
        if (compatibilityCalls < 2) {
            throw PatchException("TV360 Media3: insufficient Guava compatibility rewrites")
        }
    }
}

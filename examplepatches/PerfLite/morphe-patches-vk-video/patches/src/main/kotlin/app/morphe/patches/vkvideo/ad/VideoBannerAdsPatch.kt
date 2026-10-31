package app.morphe.patches.vkvideo.ad

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.vkvideo.shared.Constants.COMPATIBILITY_VK_VIDEO
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val REPOSITORY_SOURCE = "VideoAdBannerRepositoryImpl.kt"
private const val EVENT_SUBJECT = "Lio/reactivex/rxjava3/subjects/b;"

@Suppress("unused")
val videoBannerAdsPatch = bytecodePatch(
    name = "Video banner ad-block",
    description = "Removes the ad banner under the player - the «РЕКЛАМА» card between the comments and the recommendations title.",
    default = true
) {
    compatibleWith(COMPATIBILITY_VK_VIDEO)

    execute {
        var patched = 0

        classDefForEach { classDef ->
            // The ad listener is an inner class; the repository itself has no onNext call.
            if (classDef.sourceFile != REPOSITORY_SOURCE || !classDef.type.contains("$")) return@classDefForEach

            for (method in mutableClassDefBy(classDef).methods) {
                if (method.returnType != "V" || method.parameterTypes.size != 2) continue

                val pushesEvent = method.implementation?.instructions?.any { instruction ->
                    val reference = (instruction as? ReferenceInstruction)?.reference
                    reference is MethodReference &&
                        reference.definingClass == EVENT_SUBJECT &&
                        reference.name == "onNext"
                } ?: false
                if (!pushesEvent) continue

                // Dropping the loaded-ad callback keeps the banner event out of the Rx stream the
                // about-video presenter subscribes to, so the ad item is never built into the list.
                method.addInstructions(0, "return-void")
                patched++
            }
        }

        if (patched == 0) {
            println("WARNING: no ad delivery callback found in $REPOSITORY_SOURCE - video banner ads are not blocked")
        } else {
            println("VideoBannerAdsPatch: suppressed $patched ad delivery callback(s) in $REPOSITORY_SOURCE")
        }
    }
}

// recon 2026-11-09
package app.template.patches.ivy.animations

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.patch.stringOption
import app.template.patches.shared.Constants.IVY_COMPATIBILITY
import app.template.patches.shared.doRecursively
import org.w3c.dom.Element
import java.io.File

@Suppress("unused")
val ivyAnimationSpeedPatch = resourcePatch(
 name = "Adjust animation speed",
 description = "Scales or disables all XML-based animations in Ivy (Quick Panel, drawer, widget and handle animations). Set the scale to 0 to remove animations, or use the disable toggle.",
 default = true,
) {
 compatibleWith(IVY_COMPATIBILITY)

 val animationScale by stringOption(
  key = "animationScale",
  default = "1.0",
  title = "Animation scale",
  description = "Multiplier for animation durations. 1.0 = normal, 0.5 = twice as fast, 2.0 = twice as slow, 0 = instant. Applies to all XML animations in res/anim and res/animator."
 )

 val disableAnimations by booleanOption(
  key = "disableAnimations",
  default = false,
  title = "Disable animations",
  description = "Instantly finish every XML animation. Equivalent to an animation scale of 0."
 )

 execute {
  val scale = if (disableAnimations ?: false) {
   0.0
  } else {
   (animationScale ?: "1.0").toDoubleOrNull()
    ?: throw PatchException("Invalid animation scale: $animationScale")
  }

  if (scale < 0.0) {
   throw PatchException("Animation scale cannot be negative: $scale")
  }

  if (scale == 1.0) {
   println("[Adjust animation speed] Skipped: scale is 1.0 and animations are enabled.")
   return@execute
  }

  val resourceRoot = this["res"]
  val animationDirectories = listOf("anim", "animator")
  var changedAttributes = 0

  animationDirectories.forEach { directoryName ->
   val directory = File(resourceRoot, directoryName)
   if (!directory.exists()) {
    return@forEach
   }

   directory.walkTopDown()
    .filter { it.isFile && it.extension == "xml" }
    .forEach { file ->
     val relativePath = file.relativeTo(resourceRoot).path
     val documentPath = "res/$relativePath"

     document(documentPath).use { doc ->
      doc.doRecursively { node ->
       if (node is Element) {
        for (attribute in listOf("android:duration", "android:startOffset")) {
         val rawValue = node.getAttribute(attribute)
         if (rawValue.isEmpty()) {
          continue
         }

         val value = rawValue.toLongOrNull() ?: continue
         val scaledValue = (value * scale).toLong().coerceAtLeast(0)
         node.setAttribute(attribute, scaledValue.toString())
         changedAttributes++
        }
       }
      }
     }
    }
  }

  println("[Adjust animation speed] Scaled $changedAttributes animation attribute(s) by $scale.")
 }
}

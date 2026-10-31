package ch.broillet.veloce.patches.audiobookshelf

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.string
import app.morphe.patcher.util.smali.ExternalLabel
import ch.broillet.veloce.patches.shared.hostPackageName
import ch.broillet.veloce.patches.shared.hostPackageOption
import ch.broillet.veloce.patches.shared.uniqueMethod

val customBrowserPatch = bytecodePatch(
    name = "Allow Veloce media browsing",
    description = "Add Veloce (or a custom host package) to Audiobookshelf's accepted media browsers. Other callers keep their existing access policy.",
) {
    compatibleWith(Compatibility(packageName = "com.audiobookshelf.app", name = "Audiobookshelf",
        targets = listOf(AppTarget(version = null, isExperimental = true,
            description = "Verified patch application on 0.14.2-beta; requires the browser package validator."))))

    val hostPackage by hostPackageOption()

    execute {
        val packageName = hostPackageName(checkNotNull(hostPackage))
        val method = Fingerprint(isStatic = false, returnType = "Z", parameters = listOf("Ljava/lang/String;", "I"),
            filters = listOf(string("onGetRoot: Checking package "))).uniqueMethod(this, "Audiobookshelf browser validator")
        val implementation = checkNotNull(method.implementation)
        if (implementation.registerCount < 5) throw PatchException("Audiobookshelf browser validator has no scratch registers")
        method.addInstructionsWithLabels(0, """
            const-string v0, "$packageName"
            move-object/from16 v1, p1
            invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
            move-result v0
            if-eqz v0, :original
            const/4 v0, 0x1
            return v0
        """, ExternalLabel("original", implementation.instructions.first()))
    }
}

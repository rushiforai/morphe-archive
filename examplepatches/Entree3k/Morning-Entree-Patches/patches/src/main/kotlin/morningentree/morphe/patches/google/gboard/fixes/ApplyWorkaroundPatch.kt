package morningentree.morphe.patches.google.gboard.fixes

import app.morphe.patcher.patch.resourcePatch
import morningentree.morphe.patches.google.gboard.shared.COMPATIBILITY_GBOARD
import morningentree.morphe.util.get

val applyWorkaroundPatch = resourcePatch(
    description = "Applies a workaround for the patcher to fix missing or unsupported resources.",
) {
    compatibleWith(COMPATIBILITY_GBOARD)

    execute {
        document("res/xml/method.xml").use { document ->
            val inputMethod = document["input-method"]

            inputMethod.removeAttribute("android:supportsConnectionlessStylusHandwriting")
        }
    }
}

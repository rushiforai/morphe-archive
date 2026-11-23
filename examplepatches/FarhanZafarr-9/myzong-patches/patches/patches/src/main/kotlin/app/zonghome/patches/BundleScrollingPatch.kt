package app.zonghome.patches

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch

val bundleControlsTogglePatch = bytecodePatch(
    name="Bundle controls toggle",
    description="Add a button beside Search to hide or restore bundle categories, validity chips and filters. Remembers your choice.",
    default=true
) {
    compatibleWith(myZongCompatibility)
    dependsOn(navigationStyleHook)
    execute {
        Fingerprint(definingClass="Lapp/zonghome/extension/NavigationStyle;",
            name="bundleControlsToggle", returnType="Z", parameters=emptyList())
            .method.addInstructions(0,"const/4 v0, 0x1\nreturn v0")
    }
}

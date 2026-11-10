package app.fakh.patches.jira

import app.fakh.patches.jira.shared.Constants.COMPATIBILITY_JIRA
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.patch.bytecodePatch

/**
 * The composables of the floating Rovo Chat button: the entry point `MainActivity` calls over every tab, the fading
 * wrapper, the button itself and the two icons (the issue screen's header shows one). Every one of them is made to draw nothing, since the button is also reached through
 * the wrapper and not only the entry point. They are the class's composable methods: all but the helper that takes a
 * boolean, a long and three objects. R8 renames them, so they are found by the class and the parameter count.
 */
private val rovoFabFingerprint = Fingerprint(
    returnType = "V",
    custom = { method, classDef ->
        classDef.type.endsWith("/rovochat/RovoChatFloatingActionButtonKt;") && method.parameterTypes.size == 7
    },
)

/** The issue screen's own wrapper around the button, which fades it in over the comment box. */
private val issueRovoFabFingerprint = Fingerprint(
    returnType = "V",
    custom = { method, classDef ->
        classDef.type.endsWith("/issue/view/impl/presentation/IssueViewRovoChatFabKt;") && method.parameterTypes.size == 8
    },
)

/** The "Answers" block `HomeFragment` adds to the search screen: the one composable of the Rovo search provider. */
private val rovoSearchFingerprint = Fingerprint(
    returnType = "V",
    custom = { method, classDef ->
        classDef.type.endsWith("/rovosearch/impl/presentation/RovoSearchUiProviderImpl;") && method.parameterTypes.size == 4
    },
)

private const val EXTENSION = "Lapp/fakh/extension/jira/MaterialYou;"

/** Makes a composable draw nothing while the Hide Rovo switch is on. The first register is free at a method's start. */
private fun MutableMethod.hideWhileEnabled() {
    if (implementation!!.registerCount <= parameterTypes.size + (if (accessFlags and 8 != 0) 0 else 1)) {
        throw PatchException("No free register in $definingClass->$name")
    }
    addInstructionsWithLabels(
        0,
        """
            invoke-static { }, $EXTENSION->hideRovo()Z
            move-result v0
            if-eqz v0, :show
            return-void
            :show
            nop
        """,
    )
}

@Suppress("unused")
val hideRovoButtonPatch = bytecodePatch(
    name = "Hide Rovo button",
    description = "Removes the floating Rovo Chat button, the Rovo icon in the issue header and the Rovo \"Answers\" block in search.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_JIRA)
    category("Feature")
    extendWith("extensions/extension.mpe")
    dependsOn(settingsRowsPatch)

    execute {
        val composables = mutableClassDefBy(rovoFabFingerprint.classDef.type).methods.filter {
            it.returnType == "V" && it.parameterTypes.size in setOf(3, 4, 7, 8, 9)
        }
        if (composables.size != 6) throw PatchException("Expected six Rovo button composables, found ${composables.size}")
        composables.forEach { it.hideWhileEnabled() }
        issueRovoFabFingerprint.method.hideWhileEnabled()
        rovoSearchFingerprint.method.hideWhileEnabled()

    }
}

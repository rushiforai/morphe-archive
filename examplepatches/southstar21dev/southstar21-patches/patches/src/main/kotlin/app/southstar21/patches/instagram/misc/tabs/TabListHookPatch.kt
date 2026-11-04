package app.southstar21.patches.instagram.misc.tabs

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.literal
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.bytecodePatch
import app.southstar21.patches.instagram.misc.extension.hookReturnedObjects
import app.southstar21.patches.instagram.misc.extension.sharedExtensionPatch
import com.android.tools.smali.dexlib2.Opcode

private const val TABS_HOOK_CLASS = "Lapp/southstar21/extension/instagram/tabs/TabsHook;"
private const val USER_SESSION = "Lcom/instagram/common/session/UserSession;"

/**
 * Builds the list of IgTab enum constants for the bottom bar (and the pages it swipes
 * between) from the server's tab config: for each of the 5 slots it reads the slot's tab name,
 * maps it to an IgTab and adds it unless it's already there.
 */
internal object TabListFingerprint : Fingerprint(
    returnType = "Ljava/util/List;",
    parameters = listOf(USER_SESSION, "Z"),
    filters = listOf(
        methodCall(parameters = listOf(USER_SESSION, "I"), returnType = "Ljava/lang/String;"),
        methodCall(opcode = Opcode.INVOKE_STATIC, parameters = listOf("Ljava/lang/String;")),
        methodCall(name = "contains"),
        methodCall(name = "add"),
        literal(5),
    ),
)

/** Picks the tab to open at launch, from the saved or server chosen one, out of the tab list. */
internal object StartTabFingerprint : Fingerprint(
    classFingerprint = TabListFingerprint,
    returnType = "L",
    parameters = listOf(USER_SESSION, "Ljava/lang/String;", "Ljava/lang/String;", "Ljava/util/List;"),
)

/**
 * Lets extension code remove tabs from the bottom bar, see TabsHook.
 * Shared by the patches that hide tabs.
 */
internal val tabListHookPatch = bytecodePatch {
    dependsOn(sharedExtensionPatch)

    execute {
        TabListFingerprint.method.hookReturnedObjects(
            "$TABS_HOOK_CLASS->filterTabs(Ljava/util/List;)Ljava/util/List;"
        )

        StartTabFingerprint.method.apply {
            hookReturnedObjects("$TABS_HOOK_CLASS->startTab(Ljava/lang/Object;)Ljava/lang/Object;", returnType)
        }
    }
}

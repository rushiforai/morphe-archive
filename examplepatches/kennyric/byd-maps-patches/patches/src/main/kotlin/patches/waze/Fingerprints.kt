package patches.waze

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.InstructionLocation.MatchAfterImmediately
import app.morphe.patcher.methodCall
import app.morphe.patcher.opcode
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode

private const val SDK_CONFIGURATION_CLASS = "Lcom/waze/sdk/SdkConfiguration;"

/**
 * `private boolean HostValidator.isAllowListed(String packageName, Signature[] signatures)`
 *
 * The Car App Library's certificate allowlist. On a phone this is the only route for a
 * third-party host, because the TEMPLATE_RENDERER permission only counts on Automotive.
 */
internal object HostValidatorAllowListFingerprint : Fingerprint(
    definingClass = "Landroidx/car/app/validation/HostValidator;",
    name = "isAllowListed",
    returnType = "Z",
    parameters = listOf("Ljava/lang/String;", "[Landroid/content/pm/Signature;"),
)

/**
 * `static synchronized void SdkConfiguration.updateAppList()`
 *
 * Loads the audio/transport partner list from native code
 * (`NativeManager.configGetSdkConfigurationNTV()`) and builds the package name keyed
 * partner map that is used for the music app picker and to authorize SDK connections.
 */
internal object UpdateAppListFingerprint : Fingerprint(
    definingClass = SDK_CONFIGURATION_CLASS,
    name = "updateAppList",
    returnType = "V",
    parameters = listOf(),
    filters = listOf(
        methodCall(
            name = "configGetSdkConfigurationNTV",
            returnType = SDK_CONFIGURATION_CLASS
        ),
        opcode(Opcode.MOVE_RESULT_OBJECT, MatchAfterImmediately())
    )
)

/**
 * `static String SdkConfiguration.getCustomizedAppIconUrl(Resources, String packageName)`
 *
 * Builds the server url of a partner app icon from the package name.
 */
internal object GetCustomizedAppIconUrlFingerprint : Fingerprint(
    definingClass = SDK_CONFIGURATION_CLASS,
    name = "getCustomizedAppIconUrl",
    accessFlags = listOf(AccessFlags.STATIC),
    returnType = "Ljava/lang/String;",
    parameters = listOf("Landroid/content/res/Resources;", "Ljava/lang/String;")
)

/**
 * Extension method whose return value is replaced with the patch option value.
 */
internal object ConfiguredPackageNamesFingerprint : Fingerprint(
    definingClass = EXTENSION_CLASS,
    name = "getConfiguredPackageNames",
    returnType = "Ljava/lang/String;",
    parameters = listOf()
)

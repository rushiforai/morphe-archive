package app.masareef.patches.subscription

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall
import com.android.tools.smali.dexlib2.AccessFlags

/**
 * UserDataManager's "is subscribed" check — checks remote AND local UserConfig.getSubscribed()
 * and returns true only if both are subscribed. This gates all Pro features.
 *
 * On 2.5.2 UserDataManager keeps its real class name but the method itself is obfuscated to a
 * single letter (`f`) and is a PUBLIC+FINAL instance method. The name isn't stable across builds,
 * so this fingerprint doesn't anchor on it — the getUserRemoteConfig/getSubscribed/
 * getUserLocalConfig/getSubscribed call sequence is distinctive enough on its own. (On 2.6.1+ the
 * method compiled to PUBLIC+STATIC; retargeting there means flipping STATIC back on.)
 */
object IsSubscribedFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Z",
    parameters = emptyList(),
    filters = listOf(
        methodCall(
            name = "getUserRemoteConfig",
        ),
        methodCall(
            name = "getSubscribed",
            returnType = "Z",
        ),
        methodCall(
            name = "getUserLocalConfig",
        ),
        methodCall(
            name = "getSubscribed",
            returnType = "Z",
        ),
    )
)

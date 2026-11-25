package app.masareef.patches.subscription

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall
import com.android.tools.smali.dexlib2.AccessFlags

/**
 * UserDataManager's "is subscribed" check — checks remote AND local UserConfig.getSubscribed()
 * and returns true only if both are subscribed. This gates all Pro features.
 *
 * The enclosing class name (e.g. UserDataManager) is R8-obfuscated to a single letter as of
 * 2.6.1, and that obfuscated letter isn't stable across builds, so this fingerprint no longer
 * anchors on definingClass — the getUserRemoteConfig/getSubscribed/getUserLocalConfig/getSubscribed
 * call sequence is distinctive enough on its own.
 */
object IsSubscribedFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
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

package io.github.jordanwoodson.patches.kick.settings

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall
import app.morphe.patcher.string

/** React Native's Linking.openURL on Android, which starts a VIEW intent for the link. */
internal object OpenUrlFingerprint : Fingerprint(
    definingClass = "Lcom/facebook/react/modules/intent/IntentModule;",
    name = "openURL",
    returnType = "V",
    parameters = listOf("Ljava/lang/String;", "Lcom/facebook/react/bridge/Promise;"),
)

internal object BundleLoaderFingerprint : Fingerprint(
    name = "loadScriptFromAssets", returnType = "V",
    parameters = listOf("Landroid/content/res/AssetManager;", "Ljava/lang/String;", "Z"),
    filters = listOf(string("assetManager"), string("assetURL"), methodCall(
        definingClass = "Lcom/facebook/react/runtime/ReactInstance;",
        name = "access\$loadJSBundleFromAssets",
    )),
)

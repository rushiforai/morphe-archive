package app.morphe.patches.reddit.customclients.sync.syncforreddit.fix.gfycat

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.AccessFlags

internal val getUserAgentFingerprint = Fingerprint(
    definingClass = EXTENSION_CLASS_DESCRIPTOR,
    name = "getUserAgent",
)

internal val getOriginalUserAgentFingerprint = Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "Ljava/lang/String;",
    parameters = listOf(),
    custom = { _, classDef -> classDef.sourceFile == "AccountSingleton.java" }
)

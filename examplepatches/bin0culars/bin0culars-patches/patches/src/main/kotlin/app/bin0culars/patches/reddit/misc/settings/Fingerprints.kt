// Adapted from Morphe patches (https://github.com/MorpheApp/morphe-patches), Copyright 2026 Morphe, GPLv3. See NOTICE.

package app.bin0culars.patches.reddit.misc.settings

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.methodCall
import app.morphe.patcher.resource.ResourceType
import app.morphe.patcher.resourceLiteral
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.Opcode

internal object StartUrlActivityFingerprint : Fingerprint(
    isStatic = true,
    parameters = listOf(
        "L",
        "Landroid/app/Activity;",
        "Landroid/net/Uri;",
        "Landroid/os/Bundle;",
        "Z",
        "I",
    ),
    filters = listOf(
        methodCall(smali = "Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;"),
        string("android.intent.action.VIEW"),
        methodCall(
            parameters = listOf(
                "Landroid/app/Activity;",
                "Landroid/net/Uri;",
                "I",
                "Ljava/lang/String;",
                "Landroid/os/Bundle;",
                "Z",
            ),
        ),
    ),
)

internal object DrawerPresenterConstructorFingerprint : Fingerprint(
    name = "<init>",
    custom = { method, _ ->
        method.parameterTypes.firstOrNull()?.toString() == "Lcom/reddit/screens/drawer/community/CommunityDrawerScreen;"
    },
    filters = listOf(
        resourceLiteral(ResourceType.STRING, "reddit_rules_title"),
    ),
)

internal object DrawerListBuiltFingerprint : Fingerprint(
    classFingerprint = DrawerPresenterConstructorFingerprint,
    returnType = "V",
    parameters = listOf(),
    filters = listOf(
        methodCall(
            definingClass = "Lkotlin/collections/builders/ListBuilder;",
            name = "build",
            returnType = "Ljava/util/List;",
        ),
        fieldAccess(
            opcode = Opcode.IPUT_OBJECT,
            definingClass = "this",
            type = "Ljava/util/List;",
        ),
    ),
)

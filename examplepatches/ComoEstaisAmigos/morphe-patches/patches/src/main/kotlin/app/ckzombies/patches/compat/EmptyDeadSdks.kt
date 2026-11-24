package app.ckzombies.patches.compat

import app.adebisi.patches.shared.CONSTRUCTOR
import app.adebisi.patches.shared.PUBLIC
import app.adebisi.patches.shared.STATIC
import app.adebisi.patches.shared.addStub
import app.adebisi.patches.shared.emptySdkPrefixes
import app.morphe.patcher.patch.mutableClassDefBy
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import app.morphe.patcher.util.proxy.mutableTypes.MutableField.Companion.toMutable
import app.morphe.patcher.util.returnEarly
import com.android.tools.smali.dexlib2.immutable.ImmutableField

internal const val TAPJOY_CONNECT = "Lcom/tapjoy/TapjoyConnect;"

private const val FLURRY_AGENT = "Lcom/flurry/android/FlurryAgent;"
private const val UAIRSHIP = "Lcom/urbanairship/UAirship;"
private const val PUSH_MANAGER = "Lcom/urbanairship/push/PushManager;"
private const val PUSH_PREFS = "Lcom/urbanairship/push/PushPreferences;"
private const val UA_PREFS = "Lcom/urbanairship/Preferences;"

/**
 * Java ad/push SDKs whose method and field string constants still hold their hosts.
 * OpenFeint is already dead after [openFeintPatch]; the rest still sit in classes.dex until
 * [emptyDeadSdks] runs. `TapjoyConnect` stays: the getter patch reads `tapjoyConnectInstance`.
 */
internal val DEAD_SDK_PREFIXES = listOf(
    OPENFEINT_PACKAGE to OPENFEINT_CLASSES,
    "Lcom/flurry/" to 49,
    "Lcom/tapjoy/" to 57,
    "Lcom/playhaven/" to 92,
    "Lcom/urbanairship/" to 95,
)

internal val DEAD_SDK_KEEP = setOf(TAPJOY_CONNECT)

internal fun emptyDeadSdks() {
    GluApplicationOnCreateFingerprint.method.returnEarly()
    GluApplicationOnTerminateFingerprint.method.returnEarly()
    GluPlayHavenInitFingerprint.method.returnEarly()
    GluPushHandlerOnReceiveFingerprint.method.returnEarly()

    emptySdkPrefixes(DEAD_SDK_PREFIXES, DEAD_SDK_KEEP)
    stubFlurryAgent()
    stubUrbanAirship()
}

/**
 * IAP verify still calls `logEvent`. Native `CFlurry::StartSession` still reaches Java when
 * [jniGuardsPatch] is off. The emptied class has neither method until these go back in.
 */
private fun stubFlurryAgent() {
    val c = mutableClassDefBy(FLURRY_AGENT)
    c.addStub(
        name = "logEvent",
        parameters = listOf("Ljava/lang/String;", "Ljava/util/Map;"),
        access = PUBLIC or STATIC,
        registerCount = 2,
        smali = "return-void",
    )
    c.addStub(
        name = "onStartSession",
        parameters = listOf("Landroid/content/Context;", "Ljava/lang/String;"),
        access = PUBLIC or STATIC,
        registerCount = 2,
        smali = "return-void",
    )
    c.addStub(
        name = "onEndSession",
        parameters = listOf("Landroid/content/Context;"),
        access = PUBLIC or STATIC,
        registerCount = 1,
        smali = "return-void",
    )
}

/**
 * `GluPlatformActivity.onCreate` reads the APID through PushManager for the JNI initialise
 * args, so those three calls have to resolve. `GluNotificationService` still toggles push.
 * `UAirship.shared()` returns null: the Application wrapper already returned, and the
 * push handler's `onReceive` returned before it asked for a context.
 */
private fun stubUrbanAirship() {
    val airship = mutableClassDefBy(UAIRSHIP)
    airship.addStub(
        name = "shared",
        returnType = UAIRSHIP,
        access = PUBLIC or STATIC,
        registerCount = 1,
        smali = """
            const/4 v0, 0x0
            return-object v0
        """,
    )
    airship.addStub(
        name = "takeOff",
        parameters = listOf("Landroid/app/Application;", "Lcom/urbanairship/AirshipConfigOptions;"),
        access = PUBLIC or STATIC,
        registerCount = 2,
        smali = "return-void",
    )
    airship.addStub(
        name = "land",
        access = PUBLIC or STATIC,
        registerCount = 1,
        smali = "return-void",
    )
    airship.addStub(
        name = "isFlying",
        returnType = "Z",
        registerCount = 1,
        smali = """
            const/4 v0, 0x0
            return v0
        """,
    )

    val prefs = mutableClassDefBy(UA_PREFS)
    stubPreferenceGetters(prefs)
    stubPreferenceGetters(mutableClassDefBy(PUSH_PREFS))

    val manager = mutableClassDefBy(PUSH_MANAGER)
    val instance = ImmutableField(
        PUSH_MANAGER,
        "instance",
        PUSH_MANAGER,
        PUBLIC or STATIC,
        null,
        null,
        null,
    ).toMutable()
    manager.fields.add(instance)
    manager.staticFields.add(instance)
    manager.addStub(
        name = "<clinit>",
        access = STATIC or CONSTRUCTOR,
        registerCount = 1,
        smali = """
            new-instance v0, $PUSH_MANAGER
            invoke-direct {v0}, $PUSH_MANAGER-><init>()V
            sput-object v0, $PUSH_MANAGER->instance:$PUSH_MANAGER
            return-void
        """,
    )
    manager.addStub(
        name = "shared",
        returnType = PUSH_MANAGER,
        access = PUBLIC or STATIC,
        registerCount = 1,
        smali = """
            sget-object v0, $PUSH_MANAGER->instance:$PUSH_MANAGER
            return-object v0
        """,
    )
    manager.addStub(
        name = "getPreferences",
        returnType = PUSH_PREFS,
        registerCount = 2,
        smali = """
            new-instance v0, $PUSH_PREFS
            invoke-direct {v0}, $PUSH_PREFS-><init>()V
            return-object v0
        """,
    )
    manager.addStub(
        name = "setIntentReceiver",
        parameters = listOf("Ljava/lang/Class;"),
        registerCount = 2,
        smali = "return-void",
    )
    manager.addStub(
        name = "enablePush",
        access = PUBLIC or STATIC,
        registerCount = 1,
        smali = "return-void",
    )
    manager.addStub(
        name = "disablePush",
        access = PUBLIC or STATIC,
        registerCount = 1,
        smali = "return-void",
    )
}

private fun stubPreferenceGetters(c: MutableClass) {
    c.addStub(
        name = "getString",
        parameters = listOf("Ljava/lang/String;", "Ljava/lang/String;"),
        returnType = "Ljava/lang/String;",
        registerCount = 3,
        smali = """
            move-object v0, p2
            return-object v0
        """,
    )
    c.addStub(
        name = "getBoolean",
        parameters = listOf("Ljava/lang/String;", "Z"),
        returnType = "Z",
        registerCount = 3,
        smali = """
            move v0, p2
            return v0
        """,
    )
}

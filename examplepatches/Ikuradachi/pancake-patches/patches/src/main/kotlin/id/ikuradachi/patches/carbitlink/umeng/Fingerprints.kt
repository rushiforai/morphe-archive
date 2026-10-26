package id.ikuradachi.patches.carbitlink.umeng

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags

object UmengInitFingerprint : Fingerprint(
    definingClass = "Lcom/umeng/commonsdk/UMConfigure;",
    name = "init",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "V",
    parameters = listOf(
        "Landroid/content/Context;",
        "Ljava/lang/String;",
        "Ljava/lang/String;",
        "I",
        "Ljava/lang/String;",
    ),
    filters = listOf(
        methodCall(smali = "Lcom/umeng/commonsdk/framework/UMEnvelopeBuild;->registerNetReceiver(Landroid/content/Context;)V"),
        methodCall(smali = "Lcom/umeng/commonsdk/statistics/AnalyticsConstants;->setDeviceType(I)V"),
    ),
)

object UmengDispatchFingerprint : Fingerprint(
    definingClass = "Lcom/umeng/commonsdk/framework/UMWorkDispatch;",
    name = "sendEventInternal",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "V",
    parameters = listOf(
        "Landroid/content/Context;",
        "I",
        "I",
        "Lcom/umeng/commonsdk/framework/UMLogDataProtocol;",
        "Ljava/lang/Object;",
        "J",
    ),
    filters = listOf(
        methodCall(smali = "Lcom/umeng/commonsdk/framework/UMModuleRegister;->registerAppContext(Landroid/content/Context;)V"),
        methodCall(smali = "Lcom/umeng/commonsdk/framework/UMModuleRegister;->registerCallback(ILcom/umeng/commonsdk/framework/UMLogDataProtocol;)Z"),
        methodCall(smali = "Lcom/umeng/commonsdk/framework/UMFrUtils;->syncLegacyEnvelopeIfNeeded(Landroid/content/Context;)V"),
        methodCall(smali = "Landroid/os/Handler;->sendMessageDelayed(Landroid/os/Message;J)Z"),
    ),
)

object UmengSpyInitializerFingerprint : Fingerprint(
    definingClass = "Lcom/umeng/umzid/Spy;",
    name = "<clinit>",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC, AccessFlags.CONSTRUCTOR),
    returnType = "V",
    parameters = emptyList(),
    filters = listOf(
        string("umeng-spy"),
        methodCall(smali = "Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V"),
    ),
)

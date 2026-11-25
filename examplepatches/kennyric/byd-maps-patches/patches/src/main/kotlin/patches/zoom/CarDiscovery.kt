package patches.zoom

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import org.w3c.dom.Element

internal const val CAR_COMPONENT_MANAGER = "Lcom/zipow/videobox/auto/w;"
internal const val CAR_SERVICE_NAME = "com.zipow.videobox.auto.ZmAutoServiceV3"
private const val ANDROID = "http://schemas.android.com/apk/res/android"
internal const val SET_COMPONENT_ENABLED = "Landroid/content/pm/PackageManager;->" +
    "setComponentEnabledSetting(Landroid/content/ComponentName;II)V"

/** Preserve the original service-specific update, including its guards and exception handler. */
internal fun keepCarServiceDiscoverable(method: MutableMethod) {
    check(method.definingClass == CAR_COMPONENT_MANAGER && method.name == "a" &&
        method.parameterTypes.map(CharSequence::toString) == listOf("Z") &&
        method.returnType == "V" && AccessFlags.STATIC.isSet(method.accessFlags)) {
        "Zoom car component updater signature changed"
    }
    val body = method.implementation ?: error("Zoom car component updater has no code")
    val code = body.instructions.toList()
    check(body.registerCount == 4 && code.map { it.opcode } == listOf(
        Opcode.INVOKE_STATIC, Opcode.MOVE_RESULT, Opcode.IF_EQZ, Opcode.GOTO,
        Opcode.INVOKE_STATIC, Opcode.MOVE_RESULT_OBJECT, Opcode.IF_NEZ, Opcode.GOTO,
        Opcode.NEW_INSTANCE, Opcode.CONST_STRING, Opcode.INVOKE_DIRECT,
        Opcode.INVOKE_VIRTUAL, Opcode.MOVE_RESULT_OBJECT, Opcode.CONST_4,
        Opcode.IF_EQZ, Opcode.MOVE, Opcode.GOTO, Opcode.CONST_4,
        Opcode.INVOKE_VIRTUAL, Opcode.RETURN_VOID,
    ) && code.mapNotNull { (it as? ReferenceInstruction)?.reference?.toString() } == listOf(
        "Lcom/zipow/videobox/utils/x;->c()Z",
        "Lus/zoom/libtools/ZmBaseApplication;->a()Landroid/content/Context;",
        "Landroid/content/ComponentName;", CAR_SERVICE_NAME,
        "Landroid/content/ComponentName;-><init>(Landroid/content/Context;Ljava/lang/String;)V",
        "Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;",
        SET_COMPONENT_ENABLED,
    ) && body.tryBlocks.singleOrNull()?.exceptionHandlers?.map { it.exceptionType } ==
        listOf("Ljava/lang/Exception;")) {
        "Zoom car component updater changed or patch already applied"
    }
    method.addInstructions(0, "const/4 p0, 0x1")
}

internal val carDiscoveryResources = resourcePatch {
    dependsOn(originalInput)
    execute {
        document("AndroidManifest.xml").use { document ->
            val services = document.getElementsByTagName("service")
            val service = (0 until services.length).map { services.item(it) as Element }
                .single { it.getAttributeNS(ANDROID, "name") == CAR_SERVICE_NAME }
            check(service.getAttributeNS(ANDROID, "enabled") == "false" &&
                service.getAttributeNS(ANDROID, "exported") == "true") {
                "Zoom car service manifest contract changed"
            }
            val actions = service.getElementsByTagName("action")
            val categories = service.getElementsByTagName("category")
            check(actions.length == 1 && (actions.item(0) as Element)
                .getAttributeNS(ANDROID, "name") == "androidx.car.app.CarAppService" &&
                categories.length == 1 && (categories.item(0) as Element)
                .getAttributeNS(ANDROID, "name") == "androidx.car.app.category.CALLING") {
                "Zoom car discovery declarations changed"
            }
            service.setAttributeNS(ANDROID, "android:enabled", "true")
        }
    }
}

internal val carDiscoveryCompatibility = bytecodePatch {
    dependsOn(originalInput, carDiscoveryResources)
    execute {
        keepCarServiceDiscoverable(mutableClassDefBy(CAR_COMPONENT_MANAGER).methods.single {
            it.name == "a" && it.parameterTypes.map(CharSequence::toString) == listOf("Z")
        })
    }
}

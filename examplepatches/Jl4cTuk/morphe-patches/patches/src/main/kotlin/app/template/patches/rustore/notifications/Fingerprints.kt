package app.template.patches.rustore.notifications

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.AccessFlags

/** Matches the button ViewModel implementation without relying on any R8 descriptor. */
object NotificationButtonViewModelConstructorFingerprint : Fingerprint(
    name = "<init>",
    returnType = "V",
    parameters = listOf("L", "L", "L"),
    strings = listOf("hasUnreadRuStoreNoticesUseCase"),
    custom = { method, classDef ->
        classDef.sourceFile == "NotificationCenterIconButtonViewModelImpl.kt" &&
            AccessFlags.FINAL.isSet(classDef.accessFlags) &&
            classDef.superclass != "Ljava/lang/Object;" &&
            classDef.interfaces.size == 1 &&
            method.implementation != null
    },
)

/** Matches the generated `MainActivity` injector independently of button R8 types. */
object NotificationButtonRegistryFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf("Lru/vk/store/app/MainActivity;"),
    custom = { method, classDef ->
        classDef.sourceFile == "DaggerApp_HiltComponents_SingletonC.java" &&
            method.implementation != null
    },
)

/** Matches the shared `NotificationCenterIconButtonWidget` composable. */
object NotificationCenterIconButtonWidgetFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf(
        "L",
        "L",
        "Landroidx/compose/runtime/a;",
        "I",
        "I",
    ),
    strings = listOf("notification_center"),
    custom = { method, classDef ->
        classDef.sourceFile == "NotificationCenterIconButtonWidget.kt" &&
            method.implementation != null
    },
)

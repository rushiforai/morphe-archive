package app.transitpatches.patches.go

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.classDefBy
import app.morphe.patcher.patch.patch
import app.morphe.patcher.patch.resourceXml
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import app.transitpatches.patches.shared.Constants.COMPATIBILITY_TRANSIT
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter

internal const val GO_SERVICE_CLASS = "Lcom/thetransitapp/droid/shared/service/GoService;"
internal const val GO_PLATFORM_DATA_CLASS = "Ldjinni/java/src/GOLiveActivityPlatformData;"
internal const val SMART_STRING_CLASS = "Lcom/thetransitapp/droid/shared/model/cpp/SmartString;"
internal const val NOTIFICATION_CLASS = "Landroid/app/Notification;"
internal const val GO_CHANNEL_ID = "go_mode"

private const val EXTENSION_CLASS = "Lapp/transitpatches/extension/go/GoLiveUpdatePatch;"
private const val SMART_STRING_FORMATTER_INTERFACE = "Lapp/transitpatches/extension/go/SmartStringFormatter;"
private const val FORMAT_SMART_STRING_METHOD = "patch_formatSmartString"
private const val BUILD_ORIGINAL_NOTIFICATION_METHOD = "patch_buildOriginalGoNotification"
private const val POST_PROMOTED_NOTIFICATIONS = "android.permission.POST_PROMOTED_NOTIFICATIONS"

private val appMethodsUsedByExtension = listOf(
    Triple(GO_PLATFORM_DATA_CLASS, "getAndroidWidget", "Ldjinni/java/src/GOLiveActivity;"),
    Triple("Ldjinni/java/src/GOLiveActivity;", "getFooter", "Ldjinni/java/src/GOLiveActivityFooter;"),
    Triple("Ldjinni/java/src/GOLiveActivity;", "getTimebar", "Ldjinni/java/src/Timebar;"),
    Triple("Ldjinni/java/src/GOLiveActivityFooter;", "getArrivalTime", SMART_STRING_CLASS),
    Triple("Ldjinni/java/src/GOLiveActivityFooter;", "getRemainingTime", SMART_STRING_CLASS),
    Triple("Ldjinni/java/src/Timebar;", "getGoProgressIndicator", "Ldjinni/java/src/TimebarProgressIndicator;"),
    Triple("Ldjinni/java/src/TimebarProgressIndicator;", "getProgression", "F"),
)

private val promotedNotificationsPermissionPatch = patch {
    execute {
        resourceXml("AndroidManifest.xml").use { manifest ->
            val alreadyDeclared = manifest.elements("uses-permission").any {
                it.attribute("android:name") == POST_PROMOTED_NOTIFICATIONS
            }
            if (!alreadyDeclared) {
                val application = manifest.elements("application").first()
                application.parent!!.insertChild(application.index, "uses-permission") {
                    setAttribute("android:name", POST_PROMOTED_NOTIFICATIONS)
                }
            }
        }
    }
}

@Suppress("unused")
val goLiveUpdatePatch = patch(
    name = "GO Live Update",
    description = "Shows the GO trip notification as a Live Update on Android 16 QPR1 and newer, " +
        "with the remaining time in the status bar chip and the trip progress as a progress bar.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_TRANSIT)

    dependsOn(promotedNotificationsPermissionPatch)

    extendWith("extensions/transit.mpe")

    execute {
        appMethodsUsedByExtension.forEach { (definingClass, name, returnType) ->
            val exists = classDefBy(definingClass).methods.any {
                it.name == name &&
                    it.returnType == returnType &&
                    it.parameterTypes.isEmpty() &&
                    AccessFlags.PUBLIC.isSet(it.accessFlags) &&
                    !AccessFlags.STATIC.isSet(it.accessFlags)
            }
            if (!exists) throw PatchException("Missing $definingClass->$name()$returnType")
        }

        val goService = GoNotificationFingerprint.classDef
        val buildGoNotification = GoNotificationFingerprint.method
        val formatSmartString = GoNotificationFingerprint.instructionMatches[1].methodReference
        val buildGoNotificationName = buildGoNotification.name

        val bridgeAccessFlags = buildGoNotification.accessFlags
        buildGoNotification.setName(BUILD_ORIGINAL_NOTIFICATION_METHOD)
        buildGoNotification.setAccessFlags(
            (bridgeAccessFlags and (AccessFlags.PUBLIC.value or AccessFlags.PROTECTED.value).inv()) or
                AccessFlags.PRIVATE.value,
        )

        goService.interfaces.add(SMART_STRING_FORMATTER_INTERFACE)

        goService.addBridgeMethod(
            name = FORMAT_SMART_STRING_METHOD,
            parameterType = SMART_STRING_CLASS,
            returnType = "Ljava/lang/String;",
            accessFlags = AccessFlags.PUBLIC.value or AccessFlags.FINAL.value,
            registers = 3,
            smali = """
                const/4 v0, 0x0
                invoke-static { p1, v0, v0, p0 }, $formatSmartString
                move-result-object v0
                return-object v0
            """,
        )

        goService.addBridgeMethod(
            name = buildGoNotificationName,
            parameterType = GO_PLATFORM_DATA_CLASS,
            returnType = NOTIFICATION_CLASS,
            accessFlags = bridgeAccessFlags,
            registers = 3,
            smali = """
                invoke-direct { p0, p1 }, $GO_SERVICE_CLASS->$BUILD_ORIGINAL_NOTIFICATION_METHOD($GO_PLATFORM_DATA_CLASS)$NOTIFICATION_CLASS
                move-result-object v0
                invoke-static { p0, p0, p1, v0 }, $EXTENSION_CLASS->toLiveUpdate(Landroid/content/Context;$SMART_STRING_FORMATTER_INTERFACE$GO_PLATFORM_DATA_CLASS$NOTIFICATION_CLASS)$NOTIFICATION_CLASS
                move-result-object v0
                return-object v0
            """,
        )
    }
}

private fun MutableClass.addBridgeMethod(
    name: String,
    parameterType: String,
    returnType: String,
    accessFlags: Int,
    registers: Int,
    smali: String,
) {
    methods.add(
        ImmutableMethod(
            type,
            name,
            listOf(ImmutableMethodParameter(parameterType, null, null)),
            returnType,
            accessFlags,
            null,
            null,
            MutableMethodImplementation(registers),
        ).toMutable().apply { addInstructions(0, smali) },
    )
}

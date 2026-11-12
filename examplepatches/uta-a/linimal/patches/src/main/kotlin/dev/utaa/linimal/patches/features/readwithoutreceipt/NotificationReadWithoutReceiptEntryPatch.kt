package dev.utaa.linimal.patches.features.readwithoutreceipt

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.ApkArchitecture
import app.morphe.patcher.patch.PatchAvailability
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction3rc
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableMethodReference
import dev.utaa.linimal.patches.shared.Constants
import dev.utaa.linimal.patches.status.PatchId
import dev.utaa.linimal.patches.status.recordFeatureStatus
import dev.utaa.linimal.patches.status.recordUnappliedFeatureStatus
import dev.utaa.linimal.patches.status.recordUnsafeFeatureStatus

private const val REQUEST = "Lcom/linecorp/line/chat/request/ChatHistoryRequest;"
private const val INTENT = "Landroid/content/Intent;"

private val notificationDispatchFingerprint = Fingerprint(
    parameters = listOf(INTENT, "Z"),
    returnType = "V",
    strings = listOf("shouldLaunchMainActivity", "shouldLaunchChatHistoryActivityOnly",
        "ShouldRequestCatHistoryActivityLaunch", "CHAT_LIST_MOVE_ALL_TAB"),
)
private val notificationNavigationGetterFingerprint = Fingerprint(
    definingClass = REQUEST, name = "getBackNavigation", parameters = emptyList(),
)
private val notificationSerializerFingerprint = Fingerprint(
    definingClass = REQUEST, name = "writeToParcel",
    parameters = listOf("Landroid/os/Parcel;", "I"), returnType = "V",
    strings = listOf("isFromNotification"),
)
private val notificationNavigationFingerprint = Fingerprint(
    name = "toString", parameters = emptyList(), returnType = "Ljava/lang/String;",
    strings = listOf("BackNavigationArgs(isFromNotification="),
)

/** 通知生成時には予約せず、起動要求の配送時に通知 marker を確認します。 */
val notificationReadWithoutReceiptEntryPatch = bytecodePatch(
    name = "Read without receipt from notifications",
    description = "メッセージ通知からのトーク起動時だけ既読をつけない閲覧セッションを予約します。",
) {
    compatibleWith(Constants.LINE_COMPATIBILITY)
    availability { _, architecture ->
        if (architecture == ApkArchitecture.ARM64_V8A) PatchAvailability.REQUIRED else PatchAvailability.UNAVAILABLE
    }
    dependsOn(readWithoutReceiptManualReadPatch)
    execute {
        val dispatches = notificationDispatchFingerprint.matchAllOrNull().orEmpty()
        val getters = notificationNavigationGetterFingerprint.matchAllOrNull().orEmpty()
        val serializers = notificationSerializerFingerprint.matchAllOrNull().orEmpty()
        val navigations = notificationNavigationFingerprint.matchAllOrNull().orEmpty()
        val ids = listOf(PatchId.NOTIFICATION_READ_WITHOUT_RECEIPT_ENTRY)
        val actual = dispatches.size + getters.size + serializers.size + navigations.size
        if (dispatches.size != 1 || getters.size != 1 || serializers.size != 1 || navigations.size != 1) {
            recordUnappliedFeatureStatus(ids, 4, actual, "NotificationEntryTargetsNotUnique")
            return@execute
        }
        val dispatch = dispatches.single()
        val register = notificationDispatchIntentRegister(dispatch.originalMethod)
        if (register == null || !notificationMarkerSafe(getters.single().originalMethod,
                serializers.single().originalMethod, navigations.single().originalClassDef)) {
            recordUnsafeFeatureStatus(ids, 4, actual, "NotificationEntryShapeMismatch")
            return@execute
        }
        checkNotNull(dispatch.method.implementation).addInstruction(0, BuilderInstruction3rc(
            Opcode.INVOKE_STATIC_RANGE, register, 1,
            ImmutableMethodReference(
                "Ldev/utaa/linimal/extension/features/readwithoutreceipt/NotificationReadWithoutReceiptHooks;",
                "onChatLaunch", listOf(INTENT), "V",
            ),
        ))
        recordFeatureStatus(ids, 4, 4, "NotificationEntryInjected")
    }
}

/** p1 をそのまま渡し、scratch register や元の control flow は変更しません。 */
internal fun notificationDispatchIntentRegister(method: Method): Int? {
    if (AccessFlags.STATIC.isSet(method.accessFlags) || method.parameterTypes != listOf(INTENT, "Z") ||
        method.returnType != "V") return null
    val implementation = method.implementation ?: return null
    val register = implementation.registerCount - 2
    if (register < 1) return null
    val first = implementation.instructions.firstOrNull() ?: return null
    val call = (first as? ReferenceInstruction)?.reference as? MethodReference ?: return null
    val args = first as? FiveRegisterInstruction ?: return null
    return register.takeIf {
        first.opcode == Opcode.INVOKE_VIRTUAL && call.definingClass == "Ljava/lang/Object;" &&
            call.name == "getClass" && call.parameterTypes.isEmpty() &&
            call.returnType == "Ljava/lang/Class;" && args.registerCount == 1 && args.registerC == register
    }
}

/** 難読化 field 名ではなく、serializer の isFromNotification と唯一の公開 boolean の対応を検証します。 */
internal fun notificationMarkerSafe(getter: Method, serializer: Method, navigation: ClassDef): Boolean {
    if (getter.definingClass != REQUEST || getter.name != "getBackNavigation" ||
        getter.returnType != navigation.type || getter.parameterTypes.isNotEmpty() ||
        !AccessFlags.PUBLIC.isSet(getter.accessFlags) || AccessFlags.STATIC.isSet(getter.accessFlags)) return false
    val impl = getter.implementation ?: return false
    val getterInstructions = impl.instructions.toList()
    if (getterInstructions.size != 2 || impl.tryBlocks.isNotEmpty()) return false
    val read = getterInstructions[0] as? TwoRegisterInstruction ?: return false
    val field = (getterInstructions[0] as? ReferenceInstruction)?.reference as? FieldReference ?: return false
    val returned = getterInstructions[1] as? OneRegisterInstruction ?: return false
    if (getterInstructions[0].opcode != Opcode.IGET_OBJECT || field.definingClass != REQUEST ||
        field.name != "backNavigation" || field.type != navigation.type ||
        read.registerB != impl.registerCount - 1 || getterInstructions[1].opcode != Opcode.RETURN_OBJECT ||
        returned.registerA != read.registerA) return false
    val booleans = navigation.fields.filter {
        it.type == "Z" && AccessFlags.PUBLIC.isSet(it.accessFlags) && !AccessFlags.STATIC.isSet(it.accessFlags)
    }
    if (booleans.size != 1 || navigation.superclass != "Ljava/lang/Object;") return false
    val marker = booleans.single()
    val instructions = serializer.implementation?.instructions?.toList() ?: return false
    val positions = instructions.indices.filter { index ->
        val value = (instructions[index] as? ReferenceInstruction)?.reference as? StringReference
        value?.string == "isFromNotification"
    }
    if (positions.size != 1) return false
    val index = positions.single()
    val key = instructions[index] as? OneRegisterInstruction ?: return false
    val markerRead = instructions.getOrNull(index + 1) as? TwoRegisterInstruction ?: return false
    val markerRef = (instructions[index + 1] as? ReferenceInstruction)?.reference as? FieldReference ?: return false
    val put = instructions.getOrNull(index + 2) as? FiveRegisterInstruction ?: return false
    val putRef = (instructions[index + 2] as? ReferenceInstruction)?.reference as? MethodReference ?: return false
    return instructions[index + 1].opcode == Opcode.IGET_BOOLEAN &&
        markerRef.definingClass == marker.definingClass && markerRef.name == marker.name && markerRef.type == "Z" &&
        instructions[index + 2].opcode == Opcode.INVOKE_VIRTUAL &&
        putRef.definingClass == "Landroid/os/BaseBundle;" && putRef.name == "putBoolean" &&
        putRef.parameterTypes == listOf("Ljava/lang/String;", "Z") && putRef.returnType == "V" &&
        put.registerCount == 3 && put.registerD == key.registerA && put.registerE == markerRead.registerA
}

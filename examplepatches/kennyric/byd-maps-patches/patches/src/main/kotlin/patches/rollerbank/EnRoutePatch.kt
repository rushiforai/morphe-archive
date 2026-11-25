package patches.rollerbank

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.proxy.mutableTypes.MutableField
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.patcher.util.proxy.mutableTypes.encodedValue.MutableBooleanEncodedValue
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableField
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import com.android.tools.smali.dexlib2.immutable.value.ImmutableBooleanEncodedValue
import org.w3c.dom.Element
import patches.shared.uniqueMatch

private const val ROUTE = "${APP}ActivityRoute;"
private const val SERVICE = "Lcom/dennisk/rollerbank/model/RouteService;"
private const val INITIALIZER = "morphePrepareEnRoute"
private const val NOTIFICATION_GATE = "morpheCanStartEnRoute"

internal val enRouteResources = resourcePatch {
    dependsOn(originalInput)
    execute {
        document("res/layout/activity_main.xml").use { doc ->
            val nodes = doc.getElementsByTagName("com.google.android.material.floatingactionbutton.FloatingActionButton")
            val button = (0 until nodes.length).map { nodes.item(it) as Element }
                .single { it.getAttribute("android:id").endsWith("/open_route") }
            check(button.getAttribute("android:visibility") == "gone") { "Rollerbank route button changed" }
            button.setAttributeNS("http://schemas.android.com/apk/res/android", "android:visibility", "visible")
        }
        document("res/values/bools.xml").use { doc ->
            val nodes = doc.getElementsByTagName("bool")
            val target = (0 until nodes.length).map { nodes.item(it) as Element }
                .single { it.getAttribute("name") == "route_default_static_push_status" }
            check(target.textContent == "false") { "Rollerbank static warning default changed" }
            target.textContent = "true"
        }
    }
}

@Suppress("unused")
val enableEnRouteAlerts = bytecodePatch(
    name = "Enable En Route alerts",
    description = "Enables local En Route access and nearby static-camera warnings using the app's real data and distance settings. Requests notification permission and preserves later notification choices, location permissions, authentication and purchases.",
) {
    dependsOn(originalInput, googleCompatibility, enRouteResources)
    compatibleWith(rollerbank)
    execute {
        val activity = Fingerprint(definingClass = ROUTE, name = "<init>", returnType = "V", parameters = emptyList())
            .uniqueMatch().classDef
        val access = activity.fields.single { it.name == "j" && it.type == "Z" }
        val originalValue = access.initialValue
        check(access.accessFlags == 9 && (originalValue == null ||
            originalValue is MutableBooleanEncodedValue && !originalValue.value)) { "Rollerbank route access flag changed" }
        // Local access only: leave real Play purchase objects and server authentication intact.
        access.initialValue = MutableBooleanEncodedValue(ImmutableBooleanEncodedValue.forBoolean(true))

        val create = guarded(ROUTE, "onCreate(Landroid/os/Bundle;)V", 17, 11, 115)
        val superCall = create.getInstruction<ReferenceInstruction>(0)
        check(superCall.opcode == Opcode.INVOKE_SUPER &&
            superCall.reference.toString() == "Landroidx/fragment/app/n;->onCreate(Landroid/os/Bundle;)V")
        check(activity.methods.none { it.name == INITIALIZER }) { "Duplicate Rollerbank route initializer" }
        val helper = MutableMethod(ImmutableMethod(ROUTE, INITIALIZER,
            listOf(ImmutableMethodParameter(ROUTE, emptySet(), null)), "V",
            AccessFlags.PUBLIC.value or AccessFlags.STATIC.value, emptySet(), emptySet(),
            ImmutableMethodImplementation(5, emptyList(), emptyList(), emptyList())))
        helper.addInstructions(0, ROUTE_INITIALIZER_CODE.trimIndent())
        check(activity.methods.add(helper)) { "Could not add Rollerbank route initializer" }
        create.addInstructions(1, "invoke-static {p0}, $ROUTE->$INITIALIZER($ROUTE)V")
        guarded(ROUTE, "f(Lcom/android/billingclient/api/Purchase;)V", 17, 3, 8)
            .addInstructions(0, "return-void")

        listOf("morpheNotificationRequested", "morpheNotificationPending").forEach { name ->
            check(activity.fields.none { it.name == name }) { "Duplicate Rollerbank notification state" }
            check(activity.fields.add(MutableField(ImmutableField(ROUTE, name, "Z", AccessFlags.PRIVATE.value,
                null, emptySet(), emptySet()))))
        }
        check(activity.methods.none { it.name == NOTIFICATION_GATE || it.name == "onRequestPermissionsResult" })
        val notificationGate = MutableMethod(ImmutableMethod(ROUTE, NOTIFICATION_GATE,
            listOf(ImmutableMethodParameter(ROUTE, emptySet(), null)), "Z",
            AccessFlags.PUBLIC.value or AccessFlags.STATIC.value, emptySet(), emptySet(),
            ImmutableMethodImplementation(4, emptyList(), emptyList(), emptyList())))
        notificationGate.addInstructions(0, ROUTE_NOTIFICATION_GATE_CODE.trimIndent())
        check(activity.methods.add(notificationGate))
        val callback = MutableMethod(ImmutableMethod(ROUTE, "onRequestPermissionsResult",
            listOf("I", "[Ljava/lang/String;", "[I").map { ImmutableMethodParameter(it, emptySet(), null) }, "V",
            AccessFlags.PUBLIC.value, emptySet(), emptySet(),
            ImmutableMethodImplementation(5, emptyList(), emptyList(), emptyList())))
        callback.addInstructions(0, ROUTE_PERMISSION_CALLBACK_CODE.trimIndent())
        check(activity.methods.add(callback))
        // Native callers reach r() only after the location/background gates. Serialize the
        // notification prompt here so it cannot dismiss the native location rationale.
        val start = guarded(ROUTE, "r()V", 17, 5, 24)
        start.addInstructionsWithLabels(0, """
            invoke-static {p0}, $ROUTE->$NOTIFICATION_GATE($ROUTE)Z
            move-result v0
            if-nez v0, :notificationReady
            return-void
        """.trimIndent(), ExternalLabel("notificationReady", start.getInstruction(0)))

        val queue = guarded(SERVICE, "b()V", 17, 12, 141)
        val readiness = queue.getInstruction<ReferenceInstruction>(0)
        check(readiness.opcode == Opcode.IGET_BOOLEAN && readiness.reference.toString() == "$SERVICE->i:Z")
        val readinessRegisters = queue.getInstruction<TwoRegisterInstruction>(0)
        check(readinessRegisters.registerA == 0 && readinessRegisters.registerB == 11)
        val speech = queue.getInstruction<OneRegisterInstruction>(31)
        check(speech.opcode == Opcode.MOVE_RESULT && speech.registerA == 3)
        val soundBranch = queue.getInstruction<OneRegisterInstruction>(32)
        check(soundBranch.opcode == Opcode.IF_EQZ && soundBranch.registerA == 2)
        // Sound and visual warnings can proceed without a TTS engine. Speech still needs it.
        queue.addInstructions(32, """
            iget-boolean v4, p0, $SERVICE->i:Z
            and-int/2addr v3, v4
        """.trimIndent())
        queue.replaceInstruction(0, "const/4 v0, 0x1")
    }
}

private val ROUTE_INITIALIZER_CODE = """
    invoke-static {p0}, Landroidx/preference/c;->a(Landroid/content/Context;)Landroid/content/SharedPreferences;
    move-result-object v0
    const-string v1, "morphe_en_route_static_defaults_v1"
    const/4 v2, 0x0
    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z
    move-result v2
    if-nez v2, :done
    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences${'$'}Editor;
    move-result-object v0
    const-string v1, "route_static_push_status"
    const/4 v2, 0x1
    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences${'$'}Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences${'$'}Editor;
    const-string v1, "morphe_en_route_static_defaults_v1"
    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences${'$'}Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences${'$'}Editor;
    invoke-interface {v0}, Landroid/content/SharedPreferences${'$'}Editor;->apply()V
    :done
    return-void
"""

private val ROUTE_NOTIFICATION_GATE_CODE = """
    iget-boolean v0, p0, $ROUTE->morpheNotificationPending:Z
    if-nez v0, :not_ready
    iget-boolean v0, p0, $ROUTE->morpheNotificationRequested:Z
    if-nez v0, :ready
    sget v0, Landroid/os/Build${'$'}VERSION;->SDK_INT:I
    const/16 v1, 0x21
    if-lt v0, v1, :ready
    const-string v0, "android.permission.POST_NOTIFICATIONS"
    invoke-virtual {p0, v0}, Landroid/content/Context;->checkSelfPermission(Ljava/lang/String;)I
    move-result v1
    if-eqz v1, :ready
    const/4 v1, 0x1
    iput-boolean v1, p0, $ROUTE->morpheNotificationRequested:Z
    iput-boolean v1, p0, $ROUTE->morpheNotificationPending:Z
    new-array v1, v1, [Ljava/lang/String;
    const/4 v2, 0x0
    aput-object v0, v1, v2
    const/16 v2, 0x6d52
    invoke-virtual {p0, v1, v2}, Landroid/app/Activity;->requestPermissions([Ljava/lang/String;I)V
    :not_ready
    const/4 v0, 0x0
    return v0
    :ready
    const/4 v0, 0x1
    return v0
"""

private val ROUTE_PERMISSION_CALLBACK_CODE = """
    const/16 v0, 0x6d52
    if-ne p1, v0, :native_result
    const/4 v0, 0x1
    iput-boolean v0, p0, $ROUTE->morpheNotificationRequested:Z
    const/4 v0, 0x0
    iput-boolean v0, p0, $ROUTE->morpheNotificationPending:Z
    invoke-virtual {p0}, $ROUTE->r()V
    return-void
    :native_result
    invoke-super {p0, p1, p2, p3}, Lyj;->onRequestPermissionsResult(I[Ljava/lang/String;[I)V
    return-void
"""

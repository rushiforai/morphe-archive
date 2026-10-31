package gcam.videoboost

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.stringOption
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import java.util.logging.Logger

/** Launch intent extra (boolean) that sets Video Boost for that launch. Used by the shortcuts patch. */
internal const val VIDEO_BOOST_EXTRA = "morphe_video_boost"

/** SharedPreferences key that stores Video Boost when "Remember last setting" is used. */
private const val VIDEO_BOOST_PREF_KEY = "morphe_pref_video_boost"

private const val MODE_REMEMBER = "remember"
private const val MODE_ON = "on"
private const val MODE_OFF = "off"

private const val APPLY_HELPER = "morphe_applyStartupVideoBoost"
private const val STATE_HELPER = "morphe_createVideoBoostState"

private val Instruction.methodRef get() = (this as? ReferenceInstruction)?.reference as? MethodReference
private val Instruction.fieldRef get() = (this as? ReferenceInstruction)?.reference as? FieldReference

private fun Instruction.isBooleanValueOf() =
    (opcode == Opcode.INVOKE_STATIC || opcode == Opcode.INVOKE_STATIC_RANGE) &&
            methodRef?.let { it.definingClass == "Ljava/lang/Boolean;" && it.name == "valueOf" && it.parameterTypes == listOf("Z") } == true

private fun MutableClass.addStaticMethod(
    name: String,
    parameters: List<String>,
    returnType: String,
    registers: Int,
    smali: String,
) {
    methods.add(
        ImmutableMethod(
            type,
            name,
            parameters.map { ImmutableMethodParameter(it, null, null) },
            returnType,
            AccessFlags.PRIVATE.value or AccessFlags.STATIC.value,
            null,
            null,
            MutableMethodImplementation(registers),
        ).toMutable().apply { addInstructions(0, smali) }
    )
}

@Suppress("unused")
val videoBoostStartupPatch = bytecodePatch(
    name = "Video Boost startup state",
    description = "Controls Video Boost when the camera opens: remember the last setting (default), always on, " +
            "or always off. Video Boost can still be switched on and off as usual."
) {
    compatibleWith(
        "com.google.android.GoogleCameraEng",
        "com.google.android.GoogleCamera"
    )

    val mode by stringOption(
        key = "mode",
        default = MODE_REMEMBER,
        values = mapOf(
            "Remember last setting" to MODE_REMEMBER,
            "Always on" to MODE_ON,
            "Always off (stock)" to MODE_OFF,
        ),
        title = "Video Boost on launch",
        description = "What Video Boost is set to when the camera opens. " +
                "Launcher shortcuts from \"Video Boost shortcuts\" override this.",
        required = true
    ) { it in setOf(MODE_REMEMBER, MODE_ON, MODE_OFF) }

    val rememberDefaultOn by booleanOption(
        key = "rememberDefaultOn",
        default = true,
        title = "First launch: Video Boost on",
        description = "With \"Remember last setting\", whether Video Boost starts on before it has ever been changed."
    )

    execute {
        val logger = Logger.getLogger("gcam.videoboost")

        // region Startup reset (ife.I() in 11.1.040): "state.a(false)"

        val resetMethod = StartupSettingsResetFingerprint.method
        val controllerClass = StartupSettingsResetFingerprint.classDef
        val insns = resetMethod.instructions

        val index = (0 until insns.size - 4).firstOrNull { i ->
            val eligibilityCall = insns[i].methodRef
            val stateField = insns[i + 1].fieldRef
            val setCall = insns[i + 4].methodRef

            insns[i].opcode == Opcode.INVOKE_STATIC &&
                    eligibilityCall?.returnType == "V" && eligibilityCall.parameterTypes.size == 1 &&
                    insns[i + 1].opcode == Opcode.IGET_OBJECT && stateField != null &&
                    insns[i + 2].isBooleanValueOf() &&
                    insns[i + 3].opcode == Opcode.MOVE_RESULT_OBJECT &&
                    insns[i + 4].opcode == Opcode.INVOKE_INTERFACE &&
                    setCall?.definingClass == stateField.type && setCall.name == "a" &&
                    setCall.parameterTypes == listOf("Ljava/lang/Object;") && setCall.returnType == "V"
        } ?: throw PatchException("Could not find the Video Boost reset in ${resetMethod.definingClass}")

        val eligibilityCall = insns[index].methodRef!!
        val stateType = insns[index + 1].fieldRef!!.type
        val stateRegister = (insns[index + 4] as FiveRegisterInstruction).registerC
        if (stateRegister > 15) throw PatchException("Unexpected register layout in ${resetMethod.name}")

        // The activity is reachable from the same class: p(Intent) does
        //   iget-object v0, p0, Life;->aW:Lpfo;
        //   iget-object v1, v0, Lpfo;->a:Ljava/lang/Object;
        //   check-cast v1, Landroid/app/Activity;
        //   invoke-virtual {v1, p1}, Landroid/app/Activity;->setIntent(Landroid/content/Intent;)V
        val (holderField, activityField) = controllerClass.methods.firstNotNullOfOrNull { method ->
            if (method.implementation == null) return@firstNotNullOfOrNull null
            val code = method.instructions
            val setIntentIndex = code.indexOfFirst {
                it.methodRef?.let { ref ->
                    ref.definingClass == "Landroid/app/Activity;" && ref.name == "setIntent"
                } == true
            }
            if (setIntentIndex < 3) return@firstNotNullOfOrNull null

            val holder = code[setIntentIndex - 3]
            val activity = code[setIntentIndex - 2]
            val cast = code[setIntentIndex - 1]
            if (holder.opcode == Opcode.IGET_OBJECT && activity.opcode == Opcode.IGET_OBJECT &&
                cast.opcode == Opcode.CHECK_CAST &&
                ((cast as ReferenceInstruction).reference as TypeReference).type == "Landroid/app/Activity;"
            ) holder.fieldRef!! to activity.fieldRef!! else null
        } ?: throw PatchException("Could not find the activity reference in ${controllerClass.type}")

        val fallback = when (mode) {
            MODE_ON -> "sget-object v2, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;\n" +
                    "invoke-interface {p1, v2}, $stateType->a(Ljava/lang/Object;)V"
            MODE_OFF -> "sget-object v2, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;\n" +
                    "invoke-interface {p1, v2}, $stateType->a(Ljava/lang/Object;)V"
            else -> "" // Remember: keep the saved value.
        }

        // static void helper(Controller controller, State state)
        controllerClass.addStaticMethod(
            APPLY_HELPER,
            listOf(controllerClass.type, stateType),
            "V",
            6,
            """
                iget-object v0, p0, $holderField
                iget-object v0, v0, $activityField
                check-cast v0, Landroid/app/Activity;
                invoke-virtual {v0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;
                move-result-object v0
                if-eqz v0, :no_extra
                const-string v1, "$VIDEO_BOOST_EXTRA"
                invoke-virtual {v0, v1}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z
                move-result v2
                if-eqz v2, :no_extra
                const/4 v2, 0x0
                invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z
                move-result v2
                # Apply once: a recreated activity keeps its intent.
                invoke-virtual {v0, v1}, Landroid/content/Intent;->removeExtra(Ljava/lang/String;)V
                invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;
                move-result-object v2
                invoke-interface {p1, v2}, $stateType->a(Ljava/lang/Object;)V
                return-void
                :no_extra
                $fallback
                return-void
            """
        )

        // Replace "state.a(false)" with "helper(this, state)". The Boolean register is left as it was,
        // since the next reset in the method reuses it.
        resetMethod.replaceInstruction(
            index + 4,
            "invoke-static {p0, v$stateRegister}, ${controllerClass.type}->$APPLY_HELPER(${controllerClass.type}$stateType)V"
        )

        // endregion

        // region Initial value of the Video Boost state (jic case 4 in 11.1.040)
        //   check-cast p0, Lrdo;                      # settings store, otherwise unused
        //   invoke-static {v0}, Lkrt;->k(Lksf;)V      # same eligibility call as above
        //   new-instance p0, Lurl;
        //   invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)...   # false
        //   move-result-object v0
        //   invoke-direct {p0, v0}, Lurl;-><init>(Ljava/lang/Object;)V
        //   return-object p0

        val match = Fingerprint(filters = listOf(methodCall(eligibilityCall))).matchAllOrNull()
            ?.firstOrNull { it.method.definingClass != resetMethod.definingClass }
            ?: throw PatchException("Could not find where the Video Boost state is created")

        val providerMethod = match.method
        val providerInsns = providerMethod.instructions
        val callIndex = match.instructionMatches.first().index
        val valueOfIndex = callIndex + 2

        if (callIndex < 1 ||
            providerInsns[callIndex - 1].opcode != Opcode.CHECK_CAST ||
            providerInsns[callIndex + 1].opcode != Opcode.NEW_INSTANCE ||
            !providerInsns[valueOfIndex].isBooleanValueOf() ||
            providerInsns[valueOfIndex + 1].opcode != Opcode.MOVE_RESULT_OBJECT
        ) throw PatchException("Unexpected code where the Video Boost state is created: ${providerMethod.definingClass}")

        when (mode) {
            MODE_ON -> {
                val register = (providerInsns[valueOfIndex + 1] as OneRegisterInstruction).registerA
                providerMethod.replaceInstruction(valueOfIndex + 1, "nop")
                providerMethod.replaceInstruction(valueOfIndex, "sget-object v$register, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;")
            }

            MODE_REMEMBER -> {
                // Use the app's own settings store, so the state is saved to SharedPreferences.
                val settingsCast = providerInsns[callIndex - 1]
                val settingsRegister = (settingsCast as OneRegisterInstruction).registerA
                val settingsType = ((settingsCast as ReferenceInstruction).reference as TypeReference).type

                // settings.a(key) -> persisted state.
                val observeMethod = classDefBy(settingsType).methods.singleOrNull {
                    it.parameterTypes.size == 1 && it.returnType == stateType
                } ?: throw PatchException("Could not find the settings observer in $settingsType")
                val keyBaseType = observeMethod.parameterTypes.single().toString()

                // A boolean key type, from a "settings.b(BOOLEAN_KEY)" read in the startup reset.
                val booleanKeyType = insns.indices.firstNotNullOfOrNull { i ->
                    val read = insns[i].methodRef ?: return@firstNotNullOfOrNull null
                    if (i == 0 || read.definingClass != settingsType || read.parameterTypes != listOf(keyBaseType)) {
                        return@firstNotNullOfOrNull null
                    }
                    insns[i - 1].takeIf { it.opcode == Opcode.SGET_OBJECT }?.fieldRef?.type
                }?.takeIf { type ->
                    classDefBy(type).methods.any {
                        it.name == "<init>" && it.parameterTypes == listOf("Ljava/lang/String;", "Ljava/lang/Boolean;")
                    }
                } ?: throw PatchException("Could not find a boolean settings key type")

                // Keys register themselves by name and throw on duplicates, so reuse an existing key
                // (static Key lookup(String name)) if this runs again.
                val keyLookupMethod = classDefBy(keyBaseType).methods.singleOrNull {
                    AccessFlags.STATIC.isSet(it.accessFlags) &&
                            it.parameterTypes == listOf("Ljava/lang/String;") && it.returnType == keyBaseType
                } ?: throw PatchException("Could not find the settings key lookup in $keyBaseType")

                val default = if (rememberDefaultOn != false) "TRUE" else "FALSE"
                val providerClass = mutableClassDefBy(providerMethod.definingClass)

                // static State helper(Settings settings)
                providerClass.addStaticMethod(
                    STATE_HELPER,
                    listOf(settingsType),
                    stateType,
                    4,
                    """
                        const-string v1, "$VIDEO_BOOST_PREF_KEY"
                        invoke-static {v1}, $keyBaseType->${keyLookupMethod.name}(Ljava/lang/String;)$keyBaseType
                        move-result-object v0
                        if-nez v0, :have_key
                        new-instance v0, $booleanKeyType
                        sget-object v2, Ljava/lang/Boolean;->$default:Ljava/lang/Boolean;
                        invoke-direct {v0, v1, v2}, $booleanKeyType-><init>(Ljava/lang/String;Ljava/lang/Boolean;)V
                        :have_key
                        invoke-virtual {p0, v0}, $settingsType->${observeMethod.name}($keyBaseType)$stateType
                        move-result-object v0
                        return-object v0
                    """
                )

                providerMethod.addInstructions(
                    callIndex + 1,
                    """
                        invoke-static {v$settingsRegister}, ${providerClass.type}->$STATE_HELPER($settingsType)$stateType
                        move-result-object v$settingsRegister
                        return-object v$settingsRegister
                    """
                )
            }
        }

        // endregion

        logger.info("Video Boost startup state: mode=$mode")
    }
}

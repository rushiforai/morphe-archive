package dev.supperelias2.sbs.morphe

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import org.w3c.dom.Element

private const val SETTINGS = "Ldev/supperelias2/sbs/morphe/MorpheSettings;"
private const val ACTIVITY = "dev.supperelias2.sbs.morphe.MorpheSettingsActivity"
private const val REGISTER_FEATURES = "morpheRegisterFeatures"
private const val SETTINGS_ROW = "morpheSettingsRow"
private const val ROW_COLOR = "morpheAccountRowColor"
private const val DRAWABLES = "Lcom/sbs/ondemand/ui/R\$drawable;"

private val mobileCompatibility = Compatibility(
    name = "SBS On Demand",
    packageName = "com.sbs.ondemand.android",
    apkFileType = ApkFileType.APKM,
    appIconColor = 0xDCBD1D,
    targets = listOf(AppTarget(version = "6.4.0", isExperimental = true), AppTarget(version = "6.3.0"))
)

private lateinit var featureRegistrationMethod: MutableMethod
private val registeredFeatures = mutableSetOf<String>()

/** Call from a dependent patch execute block after dependsOn(settingsPatch). */
fun registerFeature(key: String) {
    require(key.matches(Regex("[A-Za-z0-9_.-]+"))) { "Invalid Morphe feature key: $key" }
    check(::featureRegistrationMethod.isInitialized) { "Morphe settings must execute before feature registration" }
    if (!registeredFeatures.add(key)) return
    featureRegistrationMethod.addInstructions(
        0,
        """
            const-string v0, "$key"
            invoke-static {v0}, $SETTINGS->register(Ljava/lang/String;)V
        """
    )
}

private fun staticMethod(
    owner: String,
    name: String,
    parameters: List<String>,
    returnType: String,
    registers: Int,
    body: String
) = ImmutableMethod(
    owner,
    name,
    parameters.map { ImmutableMethodParameter(it, null, null) },
    returnType,
    AccessFlags.PUBLIC.value or AccessFlags.STATIC.value,
    null,
    null,
    MutableMethodImplementation(registers)
).toMutable().apply { addInstructionsWithLabels(0, body) }

// Extension manifests are not merged into the target AndroidManifest by extendWith.
private val settingsActivityPatch = resourcePatch {
    execute {
        document("AndroidManifest.xml").use { document ->
            val application = document.getElementsByTagName("application").item(0) as Element
            val activities = application.getElementsByTagName("activity")
            val existing = (0 until activities.length).asSequence()
                .map { activities.item(it) as Element }
                .firstOrNull { it.getAttribute("android:name") == ACTIVITY }
            val activity = existing ?: document.createElement("activity").also(application::appendChild)
            activity.setAttribute("android:name", ACTIVITY)
            activity.setAttribute("android:exported", "false")
            activity.setAttribute("android:label", "Morphe settings")
            activity.setAttribute("android:theme", "@android:style/Theme.Material.NoActionBar")
        }
    }
}

/** Shared preferences and startup registration; safe for either supported mobile version. */
val runtimeSettingsPatch = bytecodePatch {
    compatibleWith(mobileCompatibility)
    dependsOn(settingsActivityPatch)
    extendWith("extensions/extension.mpe")

    execute {
        registeredFeatures.clear()
        val application = SettingsApplicationFingerprint.classDef
        check(application.methods.none { it.name == REGISTER_FEATURES }) { "Morphe settings already installed" }
        featureRegistrationMethod = staticMethod(
            APPLICATION, REGISTER_FEATURES, emptyList(), "V", 1, "return-void"
        )
        application.methods.add(featureRegistrationMethod)

        val startup = SettingsApplicationFingerprint.method
        val startupInstructions = startup.implementation!!.instructions.toList()
        val superIndex = startupInstructions.indexOfFirst {
            it.opcode == Opcode.INVOKE_SUPER &&
                ((it as? ReferenceInstruction)?.reference as? MethodReference)?.let { call ->
                    call.definingClass == "Landroid/app/Application;" && call.name == "onCreate"
                } == true
        }
        check(superIndex == 0) { "Unexpected SBS Application startup layout" }
        startup.addInstructions(
            superIndex + 1,
            """
                invoke-static {p0}, $SETTINGS->initialize(Landroid/content/Context;)V
                invoke-static {}, $APPLICATION->$REGISTER_FEATURES()V
            """
        )
    }
}

/** Adds a genuine sibling row to the existing account Compose column. */
@Suppress("unused")
val settingsPatch = bytecodePatch(
    name = "Morphe settings",
    description = "Adds Morphe settings above App Settings and Language in the account menu.",
    default = true
) {
    compatibleWith(mobileCompatibility)
    dependsOn(runtimeSettingsPatch)

    execute {
        val accountClass = AccountRowsFingerprint.classDef
        val accountRow = AccountRowFingerprint.method
        val oldParameters = listOf(
            "Ljava/lang/Integer;", "Ljava/lang/String;", "Ljava/lang/Integer;", "Z",
            FUNCTION0, COMPOSER, "I", "I"
        )
        val newParameters = oldParameters.toMutableList().apply { add(4, "Ljava/lang/String;") }
        val actualParameters = accountRow.parameterTypes.map(CharSequence::toString)
        val hasContentDescription = when (actualParameters) {
            oldParameters -> false
            newParameters -> true
            else -> error("Unexpected SBS AccountRow signature: $actualParameters")
        }
        check(accountClass.methods.none { it.name == SETTINGS_ROW || it.name == ROW_COLOR }) {
            "Morphe account menu already installed"
        }

        // Compose colors use an sRGB ARGB value in the high 32 bits. Only the added
        // row gets the accent; the original account rows retain their white text.
        accountClass.methods.add(staticMethod(
            ACCOUNT_PAGE, ROW_COLOR, listOf("Ljava/lang/String;"), "J", 4,
            """
                const-string v0, "Morphe settings"
                invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
                move-result v0
                if-eqz v0, :original
                const-wide v1, -0x44790400000000L
                return-wide v1
                :original
                const-wide v1, -0x100000000L
                return-wide v1
            """
        ))
        val whiteCalls = accountRow.implementation!!.instructions.withIndex().filter { (_, instruction) ->
            ((instruction as? ReferenceInstruction)?.reference as? MethodReference)?.let { call ->
                call.definingClass == "Landroidx/compose/ui/graphics/Color\$Companion;" &&
                    call.name == "getWhite-0d7_KjU" && call.returnType == "J"
            } == true
        }
        check(whiteCalls.size == 1) { "Unexpected SBS account row text color layout" }
        accountRow.replaceInstruction(
            whiteCalls.single().index,
            "invoke-static/range {p1 .. p1}, $ACCOUNT_PAGE->$ROW_COLOR(Ljava/lang/String;)J"
        )

        val actionRegister = if (hasContentDescription) 5 else 4
        val composerRegister = actionRegister + 1
        val flagsRegister = composerRegister + 1
        val defaultsRegister = flagsRegister + 1
        val rowParameters = actualParameters.joinToString("")
        val rowBody = """
            sget v0, $DRAWABLES->ic_settings:I
            invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
            move-result-object v0
            const-string v1, "Morphe settings"
            sget v2, $DRAWABLES->ic_arrow_back:I
            invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
            move-result-object v2
            const/4 v3, 0x1
            ${if (hasContentDescription) "const/4 v4, 0x0" else ""}
            invoke-static {}, $SETTINGS->openAction()Ljava/lang/Object;
            move-result-object v$actionRegister
            check-cast v$actionRegister, $FUNCTION0
            move-object v$composerRegister, p0
            const/4 v$flagsRegister, 0x0
            const/4 v$defaultsRegister, 0x0
            invoke-static/range {v0 .. v$defaultsRegister}, $ACCOUNT_PAGE->AccountRow($rowParameters)V
            return-void
        """
        accountClass.methods.add(staticMethod(
            ACCOUNT_PAGE, SETTINGS_ROW, listOf(COMPOSER), "V", defaultsRegister + 2, rowBody
        ))

        val rows = AccountRowsFingerprint.method
        val instructions = rows.implementation!!.instructions.toList()
        val settingsIconIndices = instructions.withIndex().filter { (_, instruction) ->
            ((instruction as? ReferenceInstruction)?.reference as? FieldReference)?.let { field ->
                field.definingClass == DRAWABLES && field.name == "ic_settings" && field.type == "I"
            } == true
        }.map { it.index }
        check(settingsIconIndices.size == 1) { "Unexpected SBS App Settings row layout" }
        val iconIndex = settingsIconIndices.single()
        val groupIndex = (iconIndex - 1 downTo 0).firstOrNull { index ->
            ((instructions[index] as? ReferenceInstruction)?.reference as? MethodReference)?.let { call ->
                call.definingClass == COMPOSER && call.name == "startReplaceGroup"
            } == true
        } ?: error("Missing SBS App Settings row composition group")
        check(iconIndex - groupIndex == 2) { "Unexpected SBS App Settings conditional layout" }
        val composerRegisterAtInsertion = (instructions[groupIndex] as FiveRegisterInstruction).registerC
        rows.addInstructions(
            groupIndex,
            "invoke-static/range {v$composerRegisterAtInsertion .. v$composerRegisterAtInsertion}, $ACCOUNT_PAGE->$SETTINGS_ROW($COMPOSER)V"
        )
    }
}

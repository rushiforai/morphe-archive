package dev.twitchpatches.patches.twitch.promotions

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.resource.ResourceType
import app.morphe.patcher.resource.resourceId
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.*
import com.android.tools.smali.dexlib2.iface.reference.*
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import dev.twitchpatches.patches.twitch.settings.resolveSettingsHooks
import dev.twitchpatches.patches.twitch.settings.settingsPatch
import dev.twitchpatches.patches.twitch.shared.*

private const val POLICY = "Ldev/twitchpatches/extension/promotions/PromotionSettings;"

@Suppress("unused")
val hideTurboPromotionsPatch = bytecodePatch(
    name = "Hide Turbo promotions",
    description = "Hides Turbo entries, upsells and purchase buttons.",
    default = true,
) {
    compatibleWith(TwitchTarget.candidateCompatibility)
    dependsOn(settingsPatch, reactNativeBridgePatch, reactNativeTurboPatch)
    execute {
        hideTurboHomeTab()
        val settings = resolveSettingsHooks()
        val owner = classDefBy(settings.row.definingClass)
        val group = owner.methods.filter { it.returnType == "V" && AccessFlags.STATIC.isSet(it.accessFlags) &&
            it.parameterTypes.map { p -> p.toString() } == listOf("Z") + List(3) { settings.callback } + listOf(settings.composer, "I")
        }.uniqueHook("subscriptions/drops/Turbo settings group")
        val rowCalls = group.code().withIndex().filter { (it.value as? ReferenceInstruction)?.reference?.toString() == settings.row.reference }
        if (rowCalls.size != 3) throw PatchException("Turbo settings: expected three native rows")
        val turboId = resourceId(ResourceType.STRING, "viewer_account_menu_turbo")
        val calls = rowCalls.filter { call -> group.code().take(call.index).takeLast(60).any {
            (it as? WideLiteralInstruction)?.wideLiteral == turboId }
        }
        val call = calls.uniqueHook("Turbo row resource and call")
        val range = call.value as? RegisterRangeInstruction ?: throw PatchException("Turbo row needs a range invocation")
        if (call.value.opcode != Opcode.INVOKE_STATIC_RANGE || range.registerCount != 8)
            throw PatchException("Turbo row invocation contract changed")
        val classes = mutableListOf<com.android.tools.smali.dexlib2.iface.ClassDef>().apply { classDefForEach { add(it) } }
        val models = listOf("FollowingPageHeaderItem(title=", "ProfileCardViewModel(bannerImageUrl=").map { anchor ->
            classes.filter { type -> type.methods.any { method -> method.references().filterIsInstance<StringReference>()
                .any { it.string.startsWith(anchor) } } }.uniqueHook("Turbo UI model $anchor")
        }
        val ingress = models.first().fields.map { it.type }.filter { type -> type.startsWith("L") &&
            classes.any { candidate -> candidate.superclass == type && candidate.methods.any { it.hasStrings("Visible(ingressType=") } }
        }.uniqueHook("Turbo ingress state")
        val absentType = classes.filter { type -> classDefByOrNull(type.superclass ?: "")?.superclass == ingress &&
            type.fields.any { it.type == type.type && AccessFlags.STATIC.isSet(it.accessFlags) } &&
            type.fields.none { !AccessFlags.STATIC.isSet(it.accessFlags) }
        }.uniqueHook("native hidden Turbo ingress")
        val absent = absentType.fields.filter { it.type == absentType.type && AccessFlags.PUBLIC.isSet(it.accessFlags) &&
            AccessFlags.STATIC.isSet(it.accessFlags) }.uniqueHook("hidden Turbo ingress singleton")
        val constructors = models.map { model -> model.methods.filter { it.name == "<init>" &&
            it.parameterTypes.count { p -> p.toString() == ingress } == 1 }.uniqueHook("Turbo UI constructor") }
        val callback = classes.filter { type -> type.methods.any { it.name == "<init>" && it.hasStrings("maybeShowTurboSignupUpsell") } }
            .uniqueHook("Turbo signup callback")
        val startupRef = callback.methods.flatMap { it.references().filterIsInstance<MethodReference>() }.filter {
            it.definingClass == "Ltv/twitch/android/feature/viewer/landing/ViewerLandingActivity;" &&
                it.name != "<init>" && it.parameterTypes.isEmpty() && it.returnType == "V"
        }.distinctBy { it.toString() }.uniqueHook("Turbo signup action")
        val startup = classDefBy(startupRef.definingClass).methods.filter { it.reference == startupRef.toString() }.uniqueHook("Turbo signup definition")
        val rowBridge = bridge(settings.row.definingClass, "twitchPatchesTurboRow", settings.row.parameterTypes.map { it.toString() }, "V", """
            invoke-static {}, $POLICY->blocked()Z
            move-result v0
            if-nez v0, :done
            invoke-static/range {p0 .. p7}, ${settings.row.reference}
            :done
            return-void
        """)
        mutable(group).replaceInstruction(call.index, "invoke-static/range {v${range.startRegister} .. v${range.startRegister + 7}}, $rowBridge")
        val stateBridge = bridge(POLICY, "filterIngress", listOf(ingress), ingress, """
            invoke-static {}, $POLICY->blocked()Z
            move-result v0
            if-eqz v0, :original
            sget-object v0, $absent
            return-object v0
            :original
            return-object p0
        """)
        constructors.forEach { constructor ->
            val word = 1 + constructor.parameterTypes.takeWhile { it.toString() != ingress }.sumOf { if (it.toString() in listOf("J", "D")) 2 else 1 }
            mutable(constructor).addInstructionsWithLabels(0, """
                invoke-static/range {p$word .. p$word}, $stateBridge
                move-result-object p$word
            """)
        }
        val method = mutable(startup)
        val words = 1 + startup.parameterTypes.size
        if ((method.implementation?.registerCount ?: 0) <= words) throw PatchException("Turbo signup action has no entry scratch register")
        method.insertBeforeWithLabels(0, """
            invoke-static {}, $POLICY->blocked()Z
            move-result v0
            if-eqz v0, :original
            return-void
            :original
            nop
        """)
        val application = classDefBy("Ltv/twitch/android/app/consumer/TwitchApplication;").methods.filter { it.name == "onCreate" && it.isInstance(emptyList(), "V") }
            .uniqueHook("promotion settings initialization")
        val app = mutable(application)
        app.code().withIndex().filter { it.value.opcode == Opcode.RETURN_VOID }.map { it.index }.asReversed().forEach {
            app.insertAtReturn(it, "invoke-static/range {p0 .. p0}, $POLICY->initialize(Landroid/app/Application;)V")
        }
    }
}

private fun BytecodePatchContext.mutable(method: Method) = mutableClassDefBy(method.definingClass).methods
    .filter { it.reference == method.reference }.uniqueHook("promotion method")

private fun BytecodePatchContext.bridge(owner: String, name: String, parameters: List<String>, returns: String, body: String): String {
    val type = mutableClassDefBy(owner)
    if (type.methods.any { it.name == name }) throw PatchException("Promotion bridge already exists: $name")
    val method = ImmutableMethod(owner, name, parameters.map { ImmutableMethodParameter(it, null, null) }, returns,
        AccessFlags.PUBLIC.value or AccessFlags.STATIC.value or AccessFlags.SYNTHETIC.value, null, null,
        MutableMethodImplementation(1 + parameters.sumOf { if (it in listOf("J", "D")) 2 else 1 })).toMutable()
    method.addInstructionsWithLabels(0, body)
    type.methods.add(method)
    return method.reference
}

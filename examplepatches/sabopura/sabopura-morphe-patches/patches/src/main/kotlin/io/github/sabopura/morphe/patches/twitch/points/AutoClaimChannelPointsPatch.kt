package io.github.sabopura.morphe.patches.twitch.points

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import io.github.sabopura.morphe.patches.twitch.Constants.TWITCH_SUPPORTED
import io.github.sabopura.morphe.patches.twitch.chat.describedFields
import io.github.sabopura.morphe.patches.twitch.support.uniqueContract
import io.github.sabopura.morphe.patches.twitch.support.classesWithStrings
import io.github.sabopura.morphe.patches.twitch.support.classesMatching
import io.github.sabopura.morphe.patches.twitch.support.enableTwitchFeature
import java.util.logging.Logger

internal fun isPointsRenderer(method: Method, state: String, enabled: ClassDef): Boolean =
    !AccessFlags.STATIC.isSet(method.accessFlags) &&
        method.parameterTypes.map { it.toString() } == listOf(state) && method.returnType == enabled.superclass &&
        method.implementation?.instructions?.any {
            it.opcode == Opcode.NEW_INSTANCE &&
                ((it as? ReferenceInstruction)?.reference as? TypeReference)?.type == enabled.type
        } == true

@Suppress("unused")
val autoClaimChannelPointsPatch = bytecodePatch(
    name = "Auto claim channel points",
    description = "Claim available bonus chests automatically after Twitch's eligibility checks. Coalesces updates and bounds retries for each claim.",
    default = true,
) {
    compatibleWith(TWITCH_SUPPORTED)
    dependsOn(io.github.sabopura.morphe.patches.twitch.ui.nativeTheatrePatch)
    extendWith("extensions/twitch.mpe")
    val bridgeBodies = linkedMapOf<String, Pair<Int, String>>()
    execute {
        fun readable(field: FieldReference): FieldReference {
            val owner = classDefBy(field.definingClass)
            val member = owner.fields.filter { it.name == field.name && it.type == field.type }.uniqueContract("points field")
            if (!AccessFlags.PUBLIC.isSet(owner.accessFlags) || !AccessFlags.PUBLIC.isSet(member.accessFlags))
                throw PatchException("Twitch points: inaccessible field $field")
            return field
        }
        val claimType = classDefByStrings("ActiveClaimModel(id=").uniqueContract("active claim model")
        val id = describedFields(claimType)["ActiveClaimModel(id="]?.takeIf { it.type == "Ljava/lang/String;" }
            ?.let(::readable) ?: throw PatchException("Twitch points: claim ID semantic field missing")
        val enabled = classesWithStrings("Enabled(balance=", ", claimStatus=").uniqueContract("enabled points view state")
        val fields = describedFields(enabled)
        val claim = fields[", claim="]?.takeIf { it.type == claimType.type }?.let(::readable)
            ?: throw PatchException("Twitch points: active claim field missing")
        val status = fields[", claimStatus="]?.let(::readable)
            ?: throw PatchException("Twitch points: claim status field missing")
        if (classDefBy(status.type).superclass != "Ljava/lang/Enum;")
            throw PatchException("Twitch points: claim status is no longer an enum")
        val state = classesWithStrings("State(balance=", ", isChannelPointsEnabled=", ", isBanned=")
            .uniqueContract("points presenter state")
        val (presenter, original) = classesMatching { c -> c.methods.any { isPointsRenderer(it, state.type, enabled) } }.flatMap { c ->
            c.methods.filter { isPointsRenderer(it, state.type, enabled) }.map { c to it }
        }.uniqueContract("points state renderer")
        val providers = presenter.instanceFields.mapNotNull { field ->
            if (!field.type.startsWith("L")) return@mapNotNull null
            val type = classDefByOrNull(field.type) ?: return@mapNotNull null
            if (!AccessFlags.INTERFACE.isSet(type.accessFlags)) return@mapNotNull null
            val methods = type.methods.filter {
                it.returnType == "V" && it.parameterTypes.map { p -> p.toString() } ==
                    listOf("Ljava/lang/String;", "Ltv/twitch/android/shared/one/chat/pub/ChatModeMetadata;")
            }
            methods.singleOrNull()?.let { field to it }
        }
        val (provider, claimMethod) = providers.uniqueContract("points data provider and claim contract")
        readable(provider)
        if (!AccessFlags.PUBLIC.isSet(claimMethod.accessFlags) ||
            !AccessFlags.PUBLIC.isSet(classDefBy(claimMethod.definingClass).accessFlags))
            throw PatchException("Twitch points: claim interface is inaccessible")
        val owner = mutableClassDefBy(presenter)
        val method = owner.methods.filter {
            it.name == original.name && it.parameterTypes == original.parameterTypes && it.returnType == original.returnType
        }.uniqueContract("mutable points renderer")
        if (owner.methods.any { it.name == POINTS_RENDER_HELPER })
            throw PatchException("Twitch points: renderer helper already exists")
        val (wrapper, native) = wrapPointsRenderer(method)
        owner.methods.remove(method)
        owner.methods.add(native)
        owner.methods.add(wrapper)
        bridgeBodies["isEnabled"] = 1 to "instance-of p0, p0, ${enabled.type}\nreturn p0"
        for ((name, field) in mapOf("activeClaim" to claim, "status" to status, "id" to id))
            bridgeBodies[name] = 1 to "check-cast p0, ${field.definingClass}\niget-object p0, p0, $field\nreturn-object p0"
        bridgeBodies["claimBonus"] = 3 to """
            check-cast p0, ${presenter.type}
            iget-object p0, p0, $provider
            const/4 v0, 0x0
            invoke-interface {p0, p1, v0}, $claimMethod
            return-void
        """
        Logger.getLogger("Sabopura.Points").info("Points: 1 wrapper after native eligibility; native=$native; ID=$id; provider=$provider; claim=$claimMethod")
    }
    finalize {
        val bridge = mutableClassDefBy("Lio/github/sabopura/morphe/extension/twitch/points/PointsAccess;")
        if (bridgeBodies.size != 5) throw PatchException("Twitch points: bridge plan incomplete")
        bridgeBodies.forEach { (name, body) ->
            val old = bridge.methods.filter { it.name == name }.uniqueContract("points bridge $name")
            val method = MutableMethod(ImmutableMethod(old.definingClass, old.name, old.parameters,
                old.returnType, old.accessFlags, old.annotations, old.hiddenApiRestrictions,
                MutableMethodImplementation(body.first)))
            method.addInstructions(0, body.second)
            bridge.methods.remove(old)
            bridge.methods.add(method)
        }
        enableTwitchFeature("AUTO_POINTS")
    }
}

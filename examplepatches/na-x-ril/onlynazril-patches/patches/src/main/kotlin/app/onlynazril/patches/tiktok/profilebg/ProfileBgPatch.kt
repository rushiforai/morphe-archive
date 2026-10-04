package app.onlynazril.patches.tiktok.profilebg

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.util.findMutableMethodOf
import app.morphe.util.implementationOrPatchException
import app.morphe.util.numberOfParameterRegisters
import app.onlynazril.patches.shared.Constants.COMPATIBILITY_TIKTOK
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference

private const val BRIDGE = "Lapp/onlynazril/extension/tiktok/ProfileBgBridge;"

/**
 * Answers the AB gate that carries the profile background.
 *
 * The app ships the whole feature (the background component, the
 * image and video pickers, the save endpoint) and decides whether to
 * run it with one AB decision: `profile_bg_in_allow_list` is the
 * allow list the server pushes per account, and an obfuscated class
 * next to it answers every component that asks. The patch answers
 * that class's gate while the switch in Tweaks says so, so the
 * feature runs the path it already ships with.
 *
 * What it cannot do is make the server accept a save from an account
 * that is not in the rollout: the switch opens the feature, but the
 * account still has to be let in for the background to be kept and
 * served to others. That is the same ceiling the feed's media
 * quality has: the client picks and answers, the server decides.
 */
@Suppress("unused")
val tiktokProfileBgPatch = bytecodePatch(
    name = "Profile background",
    description = "Answers the AB gate that carries the profile background, so " +
        "a static image or a video can be set on accounts the rollout has " +
        "not reached. The switch is in Tweaks; the feature is off by default.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_TIKTOK)

    extendWith("extensions/tiktok.mpe")

    execute {
        // The obfuscated class that holds the AB decision, found by shape
        // rather than by name: it reads the gate keys and carries the
        // (boolean) -> boolean gate next to a (boolean) -> void setter.
        // The AB-defaults registry reads the same keys but answers nothing
        // in boolean, and the class that only lists the keys in its static
        // init has no boolean method at all, so the shape is unique.
        val candidates = mutableListOf<ClassDef>()
        classDefForEach { classDef ->
            var readsKeys = false
            var hasGate = false
            var hasSetter = false
            for (method in classDef.methods) {
                if (method.returnType == "Z" && method.parameterTypes == listOf("Z")) {
                    hasGate = true
                }
                if (method.returnType == "V" && method.parameterTypes == listOf("Z")) {
                    hasSetter = true
                }
                val implementation = method.implementation
                if (!readsKeys && implementation != null) {
                    readsKeys = implementation.instructions.any { instruction ->
                        instruction is ReferenceInstruction
                                && instruction.opcode == Opcode.CONST_STRING
                                && (instruction.reference as? StringReference)?.string in GATE_KEYS
                    }
                }
            }
            if (readsKeys && hasGate && hasSetter) candidates += classDef
        }
        val gate = candidates.singleOrNull()
            ?: throw PatchException(
                "Profile background: expected one gate holder reading ${GATE_KEYS}, " +
                    "found ${candidates.size}: ${candidates.joinToString { it.type }}.",
            )
        val mutableGate = mutableClassDefBy(gate.type)

        // The gate every profile component asks. Its name moved between
        // builds (LIZIZ up to 47.0.3, LIZJ from 47.1.4), so it is matched
        // by shape: the class's one (boolean) -> boolean method.
        val gates = gate.methods.filter { method ->
            method.returnType == "Z"
                    && method.parameterTypes == listOf("Z")
                    && method.implementation != null
        }
        if (gates.size != 1) {
            throw PatchException(
                "Profile background: expected one (boolean) -> boolean gate in " +
                    "${gate.type}, found ${gates.size}.",
            )
        }
        mutableGate.findMutableMethodOf(gates.single()).forceEnabledOnEntry()

        // 47.1.4 added a cached decision the fragments read: a no-arg
        // boolean the gate fills in. Hook it too when it is there; earlier
        // builds have none and nothing to hook.
        val cached = gate.methods.filter { method ->
            method.returnType == "Z"
                    && method.parameterTypes.isEmpty()
                    && method.implementation != null
        }
        if (cached.size > 1) {
            throw PatchException(
                "Profile background: expected at most one no-arg boolean " +
                    "decision in ${gate.type}, found ${cached.size}.",
            )
        }
        cached.singleOrNull()?.let {
            mutableGate.findMutableMethodOf(it).forceEnabledOnEntry()
        }
    }
}

/**
 * Answers `true` at the method's entry while the bridge says so, and
 * lets the app's own answer stand otherwise. The register is the first
 * local, so the fall-through path never sees a parameter rewritten.
 */
private fun MutableMethod.forceEnabledOnEntry() {
    val implementation = implementationOrPatchException("Profile background")
    if (implementation.registerCount - numberOfParameterRegisters < 1) {
        throw PatchException(
            "Profile background: ${definingClass}->${name} has no room for a local.",
        )
    }
    addInstructions(
        0,
        """
            invoke-static {}, $BRIDGE->forceEnabled()Z
            move-result v0
            if-eqz v0, :morphe_profilebg_keep
            const/4 v0, 0x1
            return v0
            :morphe_profilebg_keep
        """.trimIndent(),
    )
}

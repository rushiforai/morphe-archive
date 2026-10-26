package app.morphe.patches.maps

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import java.util.logging.Logger

/** Typed call-site bridges preserve every caller register, original key, return value and exception path. */
internal fun BytecodePatchContext.patchMapsIdentityHeaders() {
    val classes = mutableListOf<ClassDef>()
    classDefForEach { if (!it.type.startsWith("Lapp/morphe/extension/")) classes += it }
    val sites = MapsIdentityHeaderScanner(classes).inspect()
    val logger = Logger.getLogger("app.morphe.patches.maps.MapsIdentityHeaders")
    sites.forEachIndexed { ordinal, site ->
        val owner = mutableClassDefBy(site.method.definingClass)
        val name = "\$maps\$identity\$${site.kind.name.lowercase()}$ordinal"
        if (owner.methods.any { it.name == name }) throw PatchException("Identity bridge already exists: ${owner.type}->$name")
        val parameters = listOf(site.target.definingClass) + site.target.parameterTypes.map { it.toString() }
        val bridge = MutableMethod(ImmutableMethod(owner.type, name,
            parameters.map { ImmutableMethodParameter(it, emptySet(), null) }, site.target.returnType,
            AccessFlags.PRIVATE.value or AccessFlags.STATIC.value or AccessFlags.SYNTHETIC.value,
            emptySet(), emptySet(), ImmutableMethodImplementation(4, emptyList(), emptyList(), emptyList())))
        val value = if (site.kind == IdentityHeaderKind.PACKAGE)
            "invoke-static {}, $MAPS_SIGNATURE_EXTENSION->packageHeaderValue()Ljava/lang/String;"
        else "invoke-static { p2 }, $MAPS_SIGNATURE_EXTENSION->certificateHeaderValue(Ljava/lang/Object;)Ljava/lang/String;"
        val opcode = if (site.opcode in listOf(Opcode.INVOKE_INTERFACE, Opcode.INVOKE_INTERFACE_RANGE)) "invoke-interface" else "invoke-virtual"
        val result = if (site.target.returnType == "V") "return-void" else "move-result-object v0\nreturn-object v0"
        bridge.addInstructions(0, "$value\nmove-result-object v0\n$opcode { p0, p1, v0 }, ${site.target}\n$result")
        owner.methods.add(bridge)
        val caller = owner.methods.single { it.name == site.method.name && it.parameterTypes == site.method.parameterTypes && it.returnType == site.method.returnType }
        val target = "${owner.type}->$name(${parameters.joinToString("")})${site.target.returnType}"
        val range = site.opcode in listOf(Opcode.INVOKE_VIRTUAL_RANGE, Opcode.INVOKE_INTERFACE_RANGE)
        val replacement = if (range) "invoke-static/range { v${site.registers.first()} .. v${site.registers.last()} }, $target"
            else "invoke-static { ${site.registers.joinToString(", ") { "v$it" }} }, $target"
        caller.replaceInstruction(site.index, replacement)
        logger.info("Identity header ${site.kind}: ${site.method} @${site.index} -> $name; ${site.registers}")
    }
    logger.info("Identity headers: ${sites.count { it.kind == IdentityHeaderKind.PACKAGE }} package / ${sites.count { it.kind == IdentityHeaderKind.CERT }} cert writes; caller registers unchanged")
}

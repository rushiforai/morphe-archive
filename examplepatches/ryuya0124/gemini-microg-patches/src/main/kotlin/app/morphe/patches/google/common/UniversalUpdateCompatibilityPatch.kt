package app.morphe.patches.google.common

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.MethodParameter
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter

private const val UNIVERSAL_VERSION = "Lapp/morphe/extension/all/versioncode/DisablePlayStoreUpdatesPatch;"

/** Restrict the optional universal patch's restoration to this APK's package. */
val universalUpdateCompatibilityPatch = bytecodePatch(
    name = "Compatible Play Store Update Blocking",
    description = "Keeps Google and Gemini version checks working when Disable Play Store updates is also selected.",
    default = true
) {
    compatibleWith("com.google.android.googlequicksearchbox", "com.google.android.apps.bard")
    var ownPackage: String? = null
    execute {
        VersionHookRegistry.requireProfile(packageMetadata)
        ownPackage = packageMetadata.packageName + ".morphe"
    }
    finalize {
        val existing = classDefByOrNull(UNIVERSAL_VERSION)
        if (existing == null) {
            println("[UpdateBlockingCompatibility] Optional universal patch not selected; no bytecode changes")
        } else {
            val clazz = mutableClassDefBy(existing)
            val helperName = "morpheIsOwnPackage"
            check(clazz.methods.none { it.name == helperName }) { "Use an unpatched original APK" }
            val helper = MutableMethod(ImmutableMethod(
                UNIVERSAL_VERSION, helperName,
                listOf<MethodParameter>(ImmutableMethodParameter("Landroid/content/pm/PackageInfo;", emptySet(), null)),
                "Z", AccessFlags.PRIVATE.value or AccessFlags.STATIC.value or AccessFlags.SYNTHETIC.value,
                emptySet(), emptySet(),
                ImmutableMethodImplementation(3, emptyList<Instruction>(), emptyList(), emptyList())
            ))
            helper.addInstructions("""
                const-string v0, "${checkNotNull(ownPackage)}"
                iget-object v1, v2, Landroid/content/pm/PackageInfo;->packageName:Ljava/lang/String;
                invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
                move-result v0
                return v0
            """)
            clazz.methods.add(helper)
            for ((name, result) in listOf("getVersionCode" to "I", "getVersionCodeLong" to "J")) {
                val method = clazz.methods.single {
                    it.name == name && it.parameterTypes == listOf("Landroid/content/pm/PackageInfo;") && it.returnType == result
                }
                check(AccessFlags.STATIC.isSet(method.accessFlags))
                val registers = checkNotNull(method.implementation).registerCount
                check(registers >= if (result == "J") 3 else 2) { "Unsupported universal helper register layout" }
                val rawReturn = if (result == "I") """
                    iget v0, p0, Landroid/content/pm/PackageInfo;->versionCode:I
                    return v0
                """ else """
                    invoke-virtual/range {p0 .. p0}, Landroid/content/pm/PackageInfo;->getLongVersionCode()J
                    move-result-wide v0
                    return-wide v0
                """
                // Preserve the universal implementation for this APK, including versionCodeMajor.
                // Other packages must keep their actual version; never turn Google's MAX into 345.
                method.addInstructionsWithLabels(0, """
                    invoke-static/range {p0 .. p0}, $UNIVERSAL_VERSION->$helperName(Landroid/content/pm/PackageInfo;)Z
                    move-result v0
                    if-nez v0, :restore_own_version
                    $rawReturn
                """, ExternalLabel("restore_own_version", method.getInstruction(0)))
                check(method.implementation!!.registerCount == registers)
            }
            println("[UpdateBlockingCompatibility] Version restoration scoped to $ownPackage")
        }
    }
}

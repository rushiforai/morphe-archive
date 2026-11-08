package app.morphe.patches.instaprime.premium

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod

private const val GLOBALS = "Lcom/primemods/utils/Globals;"

internal object InstaPrimeNoUpdate {
    @Suppress("unused")
    val patch = bytecodePatch(
        name = "Disable update check",
        description = "Desativa os avisos e a atualização forçada do InstaPrime (Globals.A09 sempre falso).",
    ) {
        compatibleWith("com.instaprime.android"("435.0.0.37.76"))

        execute {
            val globals = mutableClassDefBy(GLOBALS)

            val old = globals.methods.first { m ->
                m.name == "A09" &&
                    m.parameterTypes.map { it.toString() } == listOf("Ljava/lang/String;", "Ljava/lang/String;")
            }

            val rebuilt = MutableMethod(
                ImmutableMethod(
                    old.definingClass,
                    old.name,
                    old.parameters,
                    old.returnType,
                    old.accessFlags and AccessFlags.NATIVE.value.inv(),
                    old.annotations,
                    old.hiddenApiRestrictions,
                    MutableMethodImplementation(3), // v0 + p0 + p1 (método static)
                ),
            ).apply {
                addInstructionsWithLabels(
                    0,
                    """
                        const/4 v0, 0x0
                        return v0
                    """,
                )
            }

            globals.methods.remove(old)
            globals.methods.add(rebuilt)
        }
    }
}

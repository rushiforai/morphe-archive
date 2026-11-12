// © https://saadbinyousaf.dev/ © //
package dev.sby.patches.foodpanda

import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.classDefForEach
import app.morphe.patcher.patch.mutableClassDefBy
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction
import dev.sby.patches.shared.Constants.COMPATIBILITY_FOODPANDA

// © https://saadbinyousaf.dev/ © //
private val DARK_BY_LIGHT = mapOf(
    0xfff7f8f8L to 0xff121417L,
    0xfffaf9f6L to 0xff121417L,
    0xfff5f6f7L to 0xff16181cL,
    0xfffdfdfeL to 0xff181a1eL,
    0xff090c0fL to 0xffe8eaedL,
    0xff0c0f0fL to 0xffe8eaedL,
    0xff2e3138L to 0xfff2f3f5L,
    0xff2a3333L to 0xfff2f3f5L,
    0xff6b7175L to 0xffb4b9bfL,
    0xff626b6bL to 0xffb4b9bfL,
    0xffb7babcL to 0xff767c82L,
    0xffabb2b2L to 0xff767c82L,
    0xffd3d5d7L to 0xff2f3338L,
    0xffd0d6d5L to 0xff2f3338L,
    0xffe8e9eaL to 0xff23262aL,
    0xffe4e8e4L to 0xff23262aL,
    0xffffebebL to 0xff2b1820L,
    0x00ffebebL to 0x002b1820L,
    0xffffddddL to 0xff3b1d2bL,
    0xffffc4ccL to 0xff52253aL,
    0xffffe3dbL to 0xff3a211bL,
    0xfffdefebL to 0xff2e1d19L,
    0xffffb4a0L to 0xff52291fL,
    0xfffff4ddL to 0xff2b2616L,
    0xffffedc6L to 0xff33291aL,
    0xffffe9b8L to 0xff3a2f18L,
    0xfffeefcdL to 0xff2f2818L,
    0xfffee2a6L to 0xff40331aL,
    0xffdfedf7L to 0xff1a2836L,
    0xffedf6fcL to 0xff16212bL,
    0xffc9ddedL to 0xff22384aL,
    0xffe0f5edL to 0xff15291fL,
    0x00e0f5edL to 0x0015291fL,
    0xffcbf1e1L to 0xff1b3528L,
    0xfffcf3feL to 0xff241a2cL,
    0xffefddf5L to 0xff2e1f38L,
    0xffdec0ebL to 0xff3d2a4dL,
    0xffe3e6e8L to 0xff2a2d31L,
    0xfff0f2f2L to 0xff1c1f22L,
    0x00f7f8f8L to 0x00121417L,
    0xff39434dL to 0xffe8eaedL,
    0xff25537cL to 0xff8fbce6L,
    0xff357258L to 0xff7cc8a4L,
    0xffbb2800L to 0xffff7a5cL,
    0xff6b7680L to 0xffb4b9bfL,
    0xffc69adfL to 0xff5a3f5fL,
    0xffb2e2f0L to 0xff1c2b2eL,
    0xff919da6L to 0xffa0a8aeL,
    0xff97d8bcL to 0xff2a3a34L,
    0xffc21760L to 0xffff7aa8L,
    0xff6e3dabL to 0xffc98cf0L,
    0xffffb413L to 0xff3a3018L,
    0xffffffffL to 0xff121417L,
    0x80ffffffL to 0xff121417L,
    0x8fffffffL to 0xff121417L,
    0xccffffffL to 0xff1a1c20L,
    0xffffff80L to 0xff121417L,
    0x00ffffffL to 0x00121417L,
)

// © https://saadbinyousaf.dev/ © //
private val AMBIGUOUS = setOf(
    0xffffffffL, 0x80ffffffL, 0x8fffffffL, 0xccffffffL, 0xffffff80L, 0x00ffffffL,
)

// © https://saadbinyousaf.dev/ © //
val forceDarkModePatch = bytecodePatch(
    name = "Force dark mode",
    description = "Repaints foodpanda's built-in light colour constants with dark equivalents so the app " +
        "runs in a real dark theme. Palette classes are located by their colour constants, so the patch " +
        "survives obfuscation renames. The foodpanda pink brand colour is kept.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_FOODPANDA)

    dependsOn(bypassAntiTamperPatch)

    // © https://saadbinyousaf.dev/ © //
    execute {
        val paletteTypes = mutableListOf<String>()

        classDefForEach { classDef ->
            val distinctive = HashSet<Long>()
            classDef.methods.forEach { method ->
                method.implementation?.instructions?.forEach { instruction ->
                    if (instruction is WideLiteralInstruction) {
                        val value = instruction.wideLiteral
                        if (value in DARK_BY_LIGHT && value !in AMBIGUOUS) distinctive.add(value)
                    }
                }
            }
            if (distinctive.size >= 6) paletteTypes.add(classDef.type)
        }

        // © https://saadbinyousaf.dev/ © //
        paletteTypes.forEach { type ->
            mutableClassDefBy(type).methods.forEach forEachMethod@{ method ->
                val implementation = method.implementation ?: return@forEachMethod
                val size = implementation.instructions.size
                for (index in 0 until size) {
                    val instruction = implementation.instructions.elementAt(index)
                    if (instruction is WideLiteralInstruction) {
                        val dark = DARK_BY_LIGHT[instruction.wideLiteral] ?: continue
                        val register = (instruction as OneRegisterInstruction).registerA
                        method.replaceInstruction(index, "const-wide v$register, 0x${dark.toString(16)}L")
                    }
                }
            }
        }
    }
}
// © https://saadbinyousaf.dev/ © //

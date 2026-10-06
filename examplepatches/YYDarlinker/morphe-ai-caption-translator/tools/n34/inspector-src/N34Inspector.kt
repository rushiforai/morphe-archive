package validation

import com.android.tools.smali.dexlib2.dexbacked.DexBackedDexFile
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.*
import java.io.File
import java.util.zip.ZipFile

/** Read actual original/final DEX; no hook, class rewriting, or test replacements. */
fun main(args:Array<String>) {
    val input=File(args[0]);val output=File(args[1]);check(!output.exists());output.parentFile.mkdirs()
    output.bufferedWriter().use { out -> ZipFile(input).use { zip ->
        zip.entries().asSequence().filter { it.name.matches(Regex("classes\\d*\\.dex")) }.forEach { entry ->
            val dex=zip.getInputStream(entry).use { DexBackedDexFile.fromInputStream(null,it.buffered()) }
            dex.classes.filter { type -> type.type in setOf(
                "Lapp/morphe/extension/shared/ResourceUtils;", "Lapp/morphe/extension/shared/Utils;",
                "Lapp/morphe/extension/shared/settings/BaseSettings;", "Lapp/morphe/extension/shared/settings/Setting;",
                "Lapp/morphe/extension/shared/settings/AppLanguage;",
                "Lapp/morphe/extension/shared/theme/ThemeUtils;",
                "Lapp/morphe/extension/shared/settings/preference/AbstractPreferenceFragment;",
                "Lapp/morphe/extension/youtube/settings/preference/YouTubePreferenceFragment;",
                "Lapp/morphe/extension/shared/settings/preference/ToolbarPreferenceFragment;")
            }.forEach { type ->
                out.appendLine("CLASS ${type.type} super=${type.superclass} FROM ${entry.name}")
                type.fields.forEach { out.appendLine("FIELD ${it.name}:${it.type} flags=${it.accessFlags}") }
                type.methods.filter { it.name in setOf("<init>","<clinit>","getAppForegroundColor","getDialogBackgroundColor","isDarkModeEnabled","getLocale","getIdentifier","getStringIdentifier","setContext","initialize","onCreate","onCreateView","onStart","onPreferenceTreeClick","onSharedPreferenceChanged","lambda\$new\$4") }.forEach { method ->
                    out.appendLine("METHOD ${method.name}(${method.parameterTypes.joinToString("")})${method.returnType} flags=${method.accessFlags}")
                    var address=0
                    method.implementation?.let { impl ->
                        out.appendLine("REGISTERS ${impl.registerCount}")
                        impl.tryBlocks.forEach { block -> out.appendLine("TRY ${block.startCodeAddress} ${block.codeUnitCount} ${block.exceptionHandlers.map { handler -> handler.exceptionType to handler.handlerCodeAddress }}") }
                    }
                    method.implementation?.instructions?.forEach { instruction ->
                        val registers=when(instruction){
                            is FiveRegisterInstruction -> listOf(instruction.registerC,instruction.registerD,instruction.registerE,instruction.registerF,instruction.registerG).take(instruction.registerCount).toString()
                            is RegisterRangeInstruction -> "range=${instruction.startRegister}:${instruction.registerCount}"
                            is ThreeRegisterInstruction -> listOf(instruction.registerA,instruction.registerB,instruction.registerC).toString()
                            is TwoRegisterInstruction -> listOf(instruction.registerA,instruction.registerB).toString()
                            is OneRegisterInstruction -> listOf(instruction.registerA).toString()
                            else -> ""
                        }
                        out.appendLine("${address.toString(16)} ${instruction.opcode} ${(instruction as? ReferenceInstruction)?.reference?:""} ${(instruction as? WideLiteralInstruction)?.wideLiteral?:""} $registers offset=${(instruction as? OffsetInstruction)?.codeOffset?:""}")
                        address+=instruction.codeUnits
                    }
                }
            }
        }
    } }
    println("N33_INSPECTED ${input.absolutePath} -> ${output.absolutePath}")
}

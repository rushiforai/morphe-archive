package app.morphe.patches.googlephotos.misc.flags

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.googlephotos.misc.extension.sharedExtensionPatch
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.util.findMutableMethodOf
import app.morphe.util.indexOfFirstInstruction
import app.morphe.util.indexOfFirstInstructionReversed
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.formats.Instruction35c
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

/**
 * Patches font loading in Google Photos:
 * 1. Skottie animation font resolver (bgwl) to resolve authentic Google Fonts (DM Serif Display, BioRhyme, Sarina, Google Sans Text, etc.).
 * 2. AndroidX FontsContractCompat.requestFont (Lesc;->l) to immediately resolve Compose GoogleFont requests
 *    and AndroidX downloadable font requests with authentic Google Sans Typefaces, preventing GMS Fonts failures.
 * 3. AndroidX ResourcesCompat.loadFont (Leuj;->e) to resolve authentic Google Sans variants directly.
 * 4. Resolves authentic Google Sans variants and styles for Home carousel cards and Stories.
 */
val fixMemoryStyleFontLoadingPatch = bytecodePatch(
    name = "Fix memory style font loading",
    description = "Redirects font loading across Stories and UI to authentic Google Fonts with local caching and CDN downloading, fixing fallback fonts and blank text in Memories.",
    default = true,
) {
    compatibleWith(AppCompatibilities.GOOGLE_PHOTOS)
    dependsOn(sharedExtensionPatch)

    execute {
        classDefForEach { classDef ->
            if (classDef.type.startsWith("Lapp/morphe/")) return@classDefForEach

            // 1. Skottie font resolver in classes6.dex
            val methodA = classDef.methods.find {
                it.parameterTypes == listOf("Ljava/lang/String;", "Landroid/os/CancellationSignal;") &&
                it.returnType == "Landroid/net/Uri;"
            }

            val methodB = classDef.methods.find {
                it.parameterTypes == listOf("Landroid/net/Uri;") &&
                it.returnType == "[B"
            }

            if (methodA != null && methodB != null) {
                val mutableClass = mutableClassDefBy(classDef)

                // Patch font URI resolver: delegate to StoryFontResolver
                val mutableMethodA = mutableClass.findMutableMethodOf(methodA)
                mutableMethodA.addInstructions(0, """
                    invoke-static { p1 }, Lapp/morphe/extension/shared/patches/StoryFontResolver;->resolveFontUri(Ljava/lang/String;)Landroid/net/Uri;
                    move-result-object v0
                    return-object v0
                """.trimIndent())

                // Patch font data reader: delegate to StoryFontResolver
                val mutableMethodB = mutableClass.findMutableMethodOf(methodB)
                mutableMethodB.addInstructions(0, """
                    invoke-static { p1 }, Lapp/morphe/extension/shared/patches/StoryFontResolver;->readFontBytes(Landroid/net/Uri;)[B
                    move-result-object v0
                    return-object v0
                """.trimIndent())
            }

            // 2. Skottie font loader dispatcher (Lbgsx;->q in classes6.dex)
            val methodQ = classDef.methods.find {
                it.parameterTypes.size == 8 &&
                it.parameterTypes[0] == "Landroid/content/Context;" &&
                it.parameterTypes.any { param -> param.contains("ConcurrentHashMap") } &&
                it.returnType != "V"
            }

            if (methodQ != null) {
                val mutableClass = mutableClassDefBy(classDef)
                val mutableMethodQ = mutableClass.findMutableMethodOf(methodQ)

                // Dynamically find immediateFuture call (e.g. Lccet;->l(Ljava/lang/Object;)Lccej;)
                val immediateFutureCall = methodQ.implementation?.instructions?.mapNotNull { inst ->
                    if (inst is Instruction35c && inst.opcode == Opcode.INVOKE_STATIC) {
                        val ref = inst.reference as? MethodReference
                        if (ref != null && ref.parameterTypes.size == 1 && ref.returnType == methodQ.returnType) {
                            "${ref.definingClass}->${ref.name}(${ref.parameterTypes.joinToString("")})${ref.returnType}"
                        } else null
                    } else null
                }?.firstOrNull() ?: "Lccet;->l(Ljava/lang/Object;)Lccej;"

                mutableMethodQ.addInstructions(0, """
                    invoke-static { p0, p4, p6 }, Lapp/morphe/extension/shared/patches/StoryFontResolver;->resolveFontBytesForTarget(Landroid/content/Context;Ljava/lang/Object;Ljava/lang/Object;)[B
                    move-result-object v0
                    if-eqz v0, :cond_skip_custom_font
                    invoke-static { v0 }, $immediateFutureCall
                    move-result-object v0
                    return-object v0
                    :cond_skip_custom_font
                """.trimIndent())
            }
        }
    }
}

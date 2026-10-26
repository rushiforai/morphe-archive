package app.morphe.patches.googlephotos.misc.engine

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.googlephotos.misc.extension.sharedExtensionPatch
import app.morphe.patches.googlephotos.misc.features.ByteSizeFeatureFactoryFingerprint
import app.morphe.patches.googlephotos.misc.flags.SkottieFontLoaderDispatcherFingerprint
import app.morphe.patches.googlephotos.misc.flags.SkottieFontUriResolverFingerprint
import app.morphe.patches.googlephotos.misc.gms.HomeActivityOnCreateFingerprint
import app.morphe.patches.googlephotos.misc.models.ModelDownloadManagerClinitFingerprint
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.util.findMutableMethodOf
import app.morphe.util.returnEarly
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.formats.Instruction35c
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

@Suppress("unused")
val mediaEngineAndAIFixesPatch = bytecodePatch(
    name = "Media engine & AI fixes",
    description = "Bypasses the 0MB Mobile Data Download check for AI models and fixes font loading across Stories and UI to prevent blank text and fallback fonts.",
    default = true,
) {
    compatibleWith(AppCompatibilities.GOOGLE_PHOTOS)
    dependsOn(sharedExtensionPatch)

    execute {
        // =========================================================================
        // 1. Model Readiness Gates
        // =========================================================================
        HomeActivityOnCreateFingerprint.method.addInstructions(
            0,
            """
            invoke-static/range { p0 .. p0 }, Lapp/morphe/extension/shared/patches/PhotosModelSeeder;->enableAndEnsureSeeded(Landroid/content/Context;)V
            """.trimIndent(),
        )

        val clinit = ModelDownloadManagerClinitFingerprint.methodOrNull
        if (clinit != null) {
            val classDef = mutableClassDefBy(clinit.definingClass)

            // Find method that returns the State Enum (taking 1 Model Enum param)
            val methodC = classDef.methods.firstOrNull {
                it.parameterTypes.size == 1 &&
                it.parameterTypes[0].startsWith("L") &&
                it.returnType.startsWith("L") &&
                it.returnType != it.parameterTypes[0] &&
                !it.returnType.startsWith("Ljava/") // not returning String or Object
            }

            if (methodC != null) {
                val returnTypeObj = methodC.returnType
                classDef.findMutableMethodOf(methodC).addInstructions(0, """
                    sget-object v0, $returnTypeObj->e:$returnTypeObj
                    return-object v0
                """.trimIndent())
            }

            // Find method that returns boolean (taking 1 Model Enum param)
            val methodQ = classDef.methods.firstOrNull {
                it.returnType == "Z" &&
                it.parameterTypes.size == 1 &&
                it.parameterTypes[0].startsWith("L")
            }

            if (methodQ != null) {
                classDef.findMutableMethodOf(methodQ).returnEarly(true)
            }
        }

        // =========================================================================
        // 2. Fix Memory Style Font Loading
        // =========================================================================
        val methodA = SkottieFontUriResolverFingerprint.methodOrNull
        if (methodA != null) {
            val mutableClass = mutableClassDefBy(methodA.definingClass)
            val methodB = mutableClass.methods.firstOrNull {
                it.returnType == "[B" && it.parameterTypes.size == 1 && it.parameterTypes[0] == "Landroid/net/Uri;"
            }

            // Patch font URI resolver: delegate to StoryFontResolver
            val mutableMethodA = mutableClass.findMutableMethodOf(methodA)
            mutableMethodA.addInstructions(0, """
                invoke-static { p1 }, Lapp/morphe/extension/shared/patches/StoryFontResolver;->resolveFontUri(Ljava/lang/String;)Landroid/net/Uri;
                move-result-object v0
                return-object v0
            """.trimIndent())

            if (methodB != null) {
                // Patch font data reader: delegate to StoryFontResolver
                val mutableMethodB = mutableClass.findMutableMethodOf(methodB)
                mutableMethodB.addInstructions(0, """
                    invoke-static { p1 }, Lapp/morphe/extension/shared/patches/StoryFontResolver;->readFontBytes(Landroid/net/Uri;)[B
                    move-result-object v0
                    return-object v0
                """.trimIndent())
            }
        }

        val methodLoaderQ = SkottieFontLoaderDispatcherFingerprint.methodOrNull
        if (methodLoaderQ != null) {
            val mutableClassQ = mutableClassDefBy(methodLoaderQ.definingClass)
            val mutableMethodQ = mutableClassQ.findMutableMethodOf(methodLoaderQ)

            val immediateFutureCall = methodLoaderQ.implementation?.instructions?.mapNotNull { inst ->
                if (inst is Instruction35c && inst.opcode == Opcode.INVOKE_STATIC) {
                    val ref = inst.reference as? MethodReference
                    if (ref != null && ref.parameterTypes.size == 1 && ref.returnType == methodLoaderQ.returnType) {
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

        // =========================================================================
        // 3. ByteSizeFeature Resilience Patch (prevents crash on 0-byte / missing size media)
        // =========================================================================
        val byteSizeMethod = ByteSizeFeatureFactoryFingerprint.methodOrNull
        if (byteSizeMethod != null) {
            val classDef = mutableClassDefBy(byteSizeMethod.definingClass)
            val mutableMethod = classDef.findMutableMethodOf(byteSizeMethod)
            val instructions = byteSizeMethod.implementation?.instructions?.toList()

            instructions?.forEachIndexed { index, instruction ->
                if (instruction.opcode.name.startsWith("if-")) {
                    mutableMethod.replaceInstruction(index, "nop")
                }
            }
        }
    }
}

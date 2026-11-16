package app.morphe.patches.googlephotos.misc.engine

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.googlephotos.misc.extension.sharedExtensionPatch
import app.morphe.patches.googlephotos.misc.features.ByteSizeFeatureFactoryFingerprint
import app.morphe.patches.googlephotos.misc.flags.MemoryViewBinderClinitFingerprint
import app.morphe.patches.googlephotos.misc.flags.SkottieFontLoaderDispatcherFingerprint
import app.morphe.patches.googlephotos.misc.flags.SkottieFontUriResolverFingerprint
import app.morphe.patches.googlephotos.misc.gms.HomeActivityOnCreateFingerprint
import app.morphe.patches.googlephotos.misc.models.MddSharedFileManagerCallbackFingerprint
import app.morphe.patches.googlephotos.misc.models.ModelDownloadManagerClinitFingerprint
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.util.findMutableMethodOf
import app.morphe.util.returnEarly
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.formats.Instruction21c
import com.android.tools.smali.dexlib2.iface.instruction.formats.Instruction35c
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
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

        // =========================================================================
        // 4. MDD Resilience Hook (prevent fatal bvrh crash on missing model/file keys)
        // =========================================================================
        val mddCallbackMethod = MddSharedFileManagerCallbackFingerprint.methodOrNull
        if (mddCallbackMethod != null) {
            val classDef = mutableClassDefBy(mddCallbackMethod.definingClass)
            val mutableMethod = classDef.findMutableMethodOf(mddCallbackMethod)
            val instructions = mddCallbackMethod.implementation?.instructions?.toList()

            // Discover the obfuscated empty/null future static field (e.g. Lcgdk;->a:Lcgdo;)
            val cgdkFieldRef = instructions?.mapNotNull { inst ->
                if (inst is Instruction21c && inst.opcode == Opcode.SGET_OBJECT) {
                    val ref = inst.reference as? FieldReference
                    if (ref != null && ref.type == mddCallbackMethod.returnType && ref.name == "a") {
                        "${ref.definingClass}->${ref.name}:${ref.type}"
                    } else null
                } else null
            }?.firstOrNull() ?: "Lcgdk;->a:Lcgdo;"

            instructions?.forEachIndexed { index, instruction ->
                if (instruction is Instruction35c && instruction.opcode == Opcode.INVOKE_STATIC) {
                    val ref = instruction.reference as? MethodReference
                    if (ref != null && ref.returnType == mddCallbackMethod.returnType &&
                        ref.parameterTypes.size == 1 && ref.parameterTypes[0] == "Ljava/lang/Throwable;"
                    ) {
                        // Check if immediately preceded by new-instance / invoke-direct of bvrh
                        val isBvrhCatch = (1..3).any { offset ->
                            val prev = instructions.getOrNull(index - offset)
                            prev is ReferenceInstruction && prev.reference.toString().contains("bvrh")
                        }
                        if (isBvrhCatch) {
                            val next = instructions.getOrNull(index + 1)
                            if (next is OneRegisterInstruction && next.opcode == Opcode.MOVE_RESULT_OBJECT) {
                                val reg = next.registerA
                                mutableMethod.replaceInstruction(index, "nop")
                                mutableMethod.replaceInstruction(index + 1, "sget-object v$reg, $cgdkFieldRef")
                            }
                        }
                    }
                }
            }
        }

        // =========================================================================
        // 5. Memory Carousel Organic Wavy Scrapbook & Google Sans Typography
        // =========================================================================
        val memoryViewBinderClinit = MemoryViewBinderClinitFingerprint.methodOrNull
        if (memoryViewBinderClinit != null) {
            val classDef = mutableClassDefBy(memoryViewBinderClinit.definingClass)
            val bindMethod = classDef.methods.firstOrNull {
                it.returnType == "V" &&
                    it.parameterTypes.size == 1 &&
                    (it.implementation?.instructions?.count() ?: 0) > 100
            }
            if (bindMethod != null) {
                val mutableBind = classDef.findMutableMethodOf(bindMethod)
                val instructions = bindMethod.implementation?.instructions?.toList()

                // Dynamically resolve helper classes
                var laqdzClass: String? = null
                var lapbhClass: String? = null

                instructions?.forEachIndexed { index, instruction ->
                    if (instruction is Instruction35c && instruction.opcode == Opcode.INVOKE_STATIC) {
                        val ref = instruction.reference as? MethodReference
                        if (ref != null && ref.returnType == "Z" && ref.parameterTypes.size == 2 &&
                            ref.parameterTypes[0].endsWith("cmpi;") && ref.parameterTypes[1].endsWith("apct;")
                        ) {
                            laqdzClass = ref.definingClass
                            val next = instructions.getOrNull(index + 1)
                            if (next is OneRegisterInstruction && next.opcode == Opcode.MOVE_RESULT) {
                                val reg = next.registerA
                                if (ref.name == "d") {
                                    // Laqdz.d is the flat fallback gatekeeper: if true, it jumps to Laova.p (flat squircle).
                                    // We must force false (0x0) so it always bypasses the flat fallback!
                                    mutableBind.replaceInstruction(index, "nop")
                                    mutableBind.replaceInstruction(index + 1, "const/4 v$reg, 0x0")
                                } else if (ref.name == "k") {
                                    // Laqdz.k is the graphic gatekeeper: if true, it prepares the graphic view and renders effect.
                                    // We must force true (0x1)!
                                    mutableBind.replaceInstruction(index, "nop")
                                    mutableBind.replaceInstruction(index + 1, "const/4 v$reg, 0x1")
                                }
                            }
                        }
                    }

                    if (instruction is Instruction35c && instruction.opcode == Opcode.INVOKE_VIRTUAL) {
                        val ref = instruction.reference as? MethodReference
                        if (ref != null && ref.name == "a" && ref.parameterTypes.size == 8 &&
                            ref.parameterTypes[0].endsWith("cmpi;") && ref.parameterTypes[1].endsWith("apct;")
                        ) {
                            lapbhClass = ref.definingClass
                        }
                    }
                }

                // Patch gatekeeper methods on Laqdz directly
                if (laqdzClass != null) {
                    try {
                        val gatekeeperClass = mutableClassDefBy(laqdzClass)
                        for (m in gatekeeperClass.methods) {
                            if (m.returnType == "Z") {
                                if (m.name == "d") {
                                    gatekeeperClass.findMutableMethodOf(m).returnEarly(false)
                                } else if (m.name == "k") {
                                    gatekeeperClass.findMutableMethodOf(m).returnEarly(true)
                                }
                            }
                        }
                    } catch (_: Throwable) {}
                }

                // Force enable Gerwig and memory shape flags on Lapou
                val lapouType = classDef.methods.firstOrNull { it.name == "t" && it.parameterTypes.isEmpty() }?.returnType
                if (lapouType != null) {
                    try {
                        val lapouClassDef = mutableClassDefBy(lapouType)
                        for (m in lapouClassDef.methods) {
                            if (m.returnType == "Z" && m.parameterTypes.isEmpty() && m.name in listOf("n", "m", "A", "G", "v")) {
                                lapouClassDef.findMutableMethodOf(m).returnEarly(true)
                            }
                        }
                    } catch (_: Throwable) {}
                }

                // Patch Lapbh.a to never bail out with null on missing dimensions or disabled features
                if (lapbhClass != null) {
                    try {
                        val lapbhClassDef = mutableClassDefBy(lapbhClass)
                        val aMethod = lapbhClassDef.methods.firstOrNull { it.name == "a" && it.parameterTypes.size == 8 }
                        if (aMethod != null) {
                            val mutableAMethod = lapbhClassDef.findMutableMethodOf(aMethod)
                            val aInstructions = aMethod.implementation?.instructions?.toList()
                            if (aInstructions != null) {
                                listOf(5, 6, 11).forEach { idx ->
                                    if (idx < aInstructions.size && aInstructions[idx].opcode.name.startsWith("if-")) {
                                        mutableAMethod.replaceInstruction(idx, "nop")
                                    }
                                }
                            }
                        }
                    } catch (_: Throwable) {}
                }

                // 3. Inject Google Sans typography on memory card view
                val returnIndex = instructions?.indexOfLast { it.opcode == Opcode.RETURN_VOID } ?: -1
                if (returnIndex != -1) {
                    mutableBind.addInstructions(
                        returnIndex,
                        """
                        invoke-static/range { p1 .. p1 }, Lapp/morphe/extension/shared/patches/StoryFontResolver;->applyMemoryCardFonts(Ljava/lang/Object;)V
                        """.trimIndent(),
                    )
                }
            }
        }
    }
}

package app.morphe.patches.shared.patches.dex

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableAnnotation.Companion.toMutable
import app.morphe.patcher.util.proxy.mutableTypes.MutableField.Companion.toMutable
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import app.morphe.patches.shared.extension.com.android.tools.smali.dexlib2.iface.isExtension
import app.morphe.patches.shared.extension.kotlin.collections.replaceAll
import app.morphe.util.matchSingle
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.rewriter.DexRewriter
import com.android.tools.smali.dexlib2.rewriter.Rewriter
import com.android.tools.smali.dexlib2.rewriter.RewriterModule
import com.android.tools.smali.dexlib2.rewriter.Rewriters

fun renameClassPatch(
    classMap: Map<String, String>,
    custom: ((classDef: ClassDef) -> Boolean)? = null,
) = bytecodePatch {
    val rewriter =
        DexRewriter(
            object : RewriterModule() {
                override fun getTypeRewriter(rewriters: Rewriters) =
                    Rewriter<String> {
                        classMap[it] ?: it
                    }
            },
        )

    finalize {
        classDefForEach { classDef ->
            if (custom != null && !custom.invoke(classDef)) return@classDefForEach
            val mutableClass = mutableClassDefBy(classDef)

            mutableClass.type = classMap[mutableClass.type] ?: mutableClass.type
            mutableClass.setSuperClass(classMap[mutableClass.superclass] ?: mutableClass.superclass)
            mutableClass.interfaces.replaceAll { classMap[it] ?: it }

            mutableClass.annotations.replaceAll {
                rewriter.annotationRewriter.rewrite(it).toMutable()
            }
            mutableClass.fields.replaceAll { rewriter.fieldRewriter.rewrite(it).toMutable() }
            mutableClass.methods.replaceAll { rewriter.methodRewriter.rewrite(it).toMutable() }
        }
    }
}

fun obfuscateExtensionClassBlockPatch(classMap: Map<String, BytecodePatchContext.() -> String>) =
    bytecodePatch {
        val lazyClassMap = mutableMapOf<String, String>()

        dependsOn(renameClassPatch(lazyClassMap, ClassDef::isExtension))

        execute {
            classMap.forEach { (classDescriptor, executeBlock) ->
                lazyClassMap[classDescriptor] = executeBlock(this)
            }
        }
    }

fun obfuscateExtensionClassPatch(vararg classes: Pair<String, Fingerprint>) =
    obfuscateExtensionClassBlockPatch(
        classes.associate { (classDescriptor, fingerprint) ->
            classDescriptor to { fingerprint.matchSingle().originalClassDef.type }
        },
    )

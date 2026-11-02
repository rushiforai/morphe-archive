package app.morphe.patches.shared.patches.dex

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableAnnotation.Companion.toMutable
import app.morphe.patcher.util.proxy.mutableTypes.MutableField.Companion.toMutable
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import app.morphe.patches.shared.extension.com.android.tools.smali.dexlib2.iface.isExtension
import app.morphe.patches.shared.extension.kotlin.collections.replaceAll
import app.morphe.util.getReference
import app.morphe.util.matchSingle
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableFieldReference
import com.android.tools.smali.dexlib2.rewriter.DexRewriter
import com.android.tools.smali.dexlib2.rewriter.Rewriter
import com.android.tools.smali.dexlib2.rewriter.RewriterModule
import com.android.tools.smali.dexlib2.rewriter.Rewriters

fun renameFieldReferencePatch(
    fieldReferenceMap: Map<String, Map<String, String>>,
    custom: ((classDef: ClassDef) -> Boolean)? = null,
) = bytecodePatch {
    val rewriter =
        DexRewriter(
            object : RewriterModule() {
                override fun getFieldReferenceRewriter(rewriters: Rewriters): Rewriter<FieldReference?> =
                    Rewriter {
                        ImmutableFieldReference(
                            it.definingClass,
                            fieldReferenceMap[it.definingClass]?.get(it.name) ?: it.name,
                            it.type,
                        )
                    }
            },
        )

    finalize {
        classDefForEach { classDef ->
            if (custom != null && !custom.invoke(classDef)) return@classDefForEach
            val mutableClass = mutableClassDefBy(classDef)

            mutableClass.annotations.replaceAll {
                rewriter.annotationRewriter.rewrite(it).toMutable()
            }
            mutableClass.fields.replaceAll { rewriter.fieldRewriter.rewrite(it).toMutable() }
            mutableClass.methods.replaceAll { rewriter.methodRewriter.rewrite(it).toMutable() }
        }
    }
}

fun obfuscateExtensionFieldReferencePatch(fieldReferenceMap: Map<String, Map<String, BytecodePatchContext.() -> String>>) =
    bytecodePatch {
        val lazyFieldReferenceMap = mutableMapOf<String, Map<String, String>>()

        dependsOn(renameFieldReferencePatch(lazyFieldReferenceMap, ClassDef::isExtension))

        execute {
            fieldReferenceMap.forEach { (classDescriptor, fieldMap) ->
                lazyFieldReferenceMap[classDescriptor] =
                    fieldMap.mapValues { (_, executeBlock) ->
                        executeBlock(this)
                    }
            }
        }
    }

fun obfuscateExtensionFieldReferencePatch(vararg fieldReferences: Pair<Pair<String, String>, Fingerprint>) =
    obfuscateExtensionFieldReferencePatch(
        fieldReferences
            .groupBy({ it.first.first }, {
                it.first.second to it.second
            })
            .mapValues { (_, pairs) ->
                pairs.associate { (inner, fingerprint) ->
                    inner to {
                        fingerprint
                            .matchSingle()
                            .instructionMatches
                            .first()
                            .instruction
                            .getReference<FieldReference>()!!
                            .name
                    }
                }
            },
    )

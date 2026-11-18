package app.afterglow.patches.experiments

import app.afterglow.patches.shared.Constants.COMPATIBILITY_YOUTUBE
import app.afterglow.patches.shared.Constants.EXTENSION_PACKAGE
import app.afterglow.patches.shared.MainActivityOnCreateFingerprint
import app.afterglow.patches.shared.afterglowExtensionPatch
import app.afterglow.patches.shared.smali
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import app.morphe.patcher.util.proxy.mutableTypes.MutableField.Companion.toMutable
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableField

private const val GETTERS = "Laktm;"
private const val RUNTIME = "$EXTENSION_PACKAGE/destinations/ExperimentRuntime;"

/** Observe native server values before applying a local, typed, reversible profile. */
internal val experimentLabHookPatch = bytecodePatch {
    compatibleWith(COMPATIBILITY_YOUTUBE)
    dependsOn(afterglowExtensionPatch)
    execute {
        val constructor = Fingerprint(definingClass = GETTERS, name = "<init>", returnType = "V",
            parameters = listOf("Laktf;", "Lakue;", "Lawae;", "Ljava/lang/String;")).match()
        val constructorCalls = constructor.method.implementation!!.instructions.mapNotNull {
            (it as? ReferenceInstruction)?.reference as? MethodReference
        }
        require(constructor.method.implementation!!.registerCount == 5
                && constructorCalls.first().definingClass == "Ljava/lang/Object;"
                && constructorCalls.first().name == "<init>"
                && constructorCalls.any { it.definingClass == "Laktz;" && it.name == "c"
                    && it.parameterTypes == listOf("Ljava/lang/String;") && it.returnType == "I" }) {
            "Native experiment package/offset constructor changed"
        }
        val packageField = "afterglow_experimentPackage"
        require(constructor.classDef.fields.none { it.name == packageField })
        data class Getter(val name: String, val type: String, val adapter: String, val fallback: Boolean)
        val getters = listOf(
            Getter("m", "Z", "booleanValue", true), Getter("n", "Z", "booleanValue", false),
            Getter("c", "J", "integerValue", true), Getter("d", "J", "integerValue", false),
            Getter("a", "D", "doubleValue", true), Getter("b", "D", "doubleValue", false),
            Getter("j", "Ljava/lang/String;", "stringValue", true), Getter("k", "Ljava/lang/String;", "stringValue", false),
        )
        // Resolve every original before mutation. Never depend on a getter's reused
        // parameter registers at its return: namespace/index and flag are clobbered.
        val methods = getters.map { getter ->
            val parameters = listOf("I", "J") + if (getter.fallback) listOf(getter.type) else emptyList()
            val match = Fingerprint(definingClass = GETTERS, name = getter.name,
                returnType = getter.type, parameters = parameters).match()
            val method = match.method
            require(method.accessFlags == (AccessFlags.PUBLIC.value or AccessFlags.FINAL.value)) {
                "Native experiment getter access changed: ${getter.name}"
            }
            val calls = method.implementation!!.instructions.mapNotNull {
                (it as? ReferenceInstruction)?.reference as? MethodReference
            }
            val storageNames = when (getter.type) {
                "Z" -> "i" to "h"
                "J" -> "e" to "d"
                "D" -> "c" to "b"
                else -> "g" to "f"
            }
            val indexedRead = "Lawae;->${storageNames.first}(I${getter.type})${getter.type}"
            val idRead = "Lawae;->${storageNames.second}(J${getter.type})${getter.type}"
            val nativeCalls = calls.filter { it.definingClass in setOf("Lawae;", "Laktf;", GETTERS) }.map { it.smali }
            val expectedCalls = when {
                getter.name == "m" -> listOf(indexedRead, "$GETTERS->l(JZ)Z")
                getter.fallback -> listOf(indexedRead, idRead, "Laktf;->c()Lbdrs;")
                else -> listOf("$GETTERS->s(J)Lbfjr;", indexedRead, "$GETTERS->s(J)Lbfjr;", idRead, "$GETTERS->i()Lbfjq;")
            }
            require(nativeCalls == expectedCalls) {
                "Native experiment storage boundary changed: ${getter.name}"
            }
            require(calls.none { call -> call.definingClass == GETTERS
                    && getters.any { it.name == call.name } }) {
                "Experiment getter delegation would contaminate the captured server baseline"
            }
            Triple(getter, match.classDef, method)
        }
        methods.forEach { (getter, owner, original) ->
            val alias = "afterglow_nativeExperiment_${getter.name}"
            require(owner.methods.none { it.name == alias }) { "Experiment getter already wrapped" }
            // Keep the exact original body, try regions and debug information.
            // The private alias is called only here, so public native-signature
            // fingerprints (including upstream debugging) still match once.
            val retained = ImmutableMethod(owner.type, alias, original.parameters, original.returnType,
                (original.accessFlags and AccessFlags.PUBLIC.value.inv()) or AccessFlags.PRIVATE.value,
                original.annotations, original.hiddenApiRestrictions,
                original.implementation).toMutable()
            val wide = getter.type == "J" || getter.type == "D"
            val words = 4 + if (getter.fallback) (if (wide) 2 else 1) else 0
            val suffix = if (wide) "-wide" else if (getter.type.startsWith("L")) "-object" else ""
            val parameters = original.parameterTypes.joinToString("")
            val wrapper = ImmutableMethod(owner.type, original.name, original.parameters, original.returnType,
                original.accessFlags, original.annotations, original.hiddenApiRestrictions,
                MutableMethodImplementation(words + 6)).toMutable().apply {
                addInstructions(0, """
                    invoke-direct/range { p0 .. p${words - 1} }, $GETTERS->$alias($parameters)${getter.type}
                    move-result$suffix v4
                    iget-object v0, p0, $GETTERS->$packageField:Ljava/lang/String;
                    move/from16 v1, p1
                    move-wide/from16 v2, p2
                    invoke-static/range { v0 .. v${if (wide) 5 else 4} }, $RUNTIME->${getter.adapter}(Ljava/lang/String;IJ${getter.type})${getter.type}
                    move-result$suffix v0
                    return$suffix v0
                """)
            }
            owner.methods.remove(original)
            owner.methods.add(retained)
            owner.methods.add(wrapper)
        }
        constructor.classDef.fields.add(ImmutableField(GETTERS, packageField, "Ljava/lang/String;",
            AccessFlags.PRIVATE.value or AccessFlags.FINAL.value, null, null, null).toMutable())
        // Immediately after Object.<init>, before native constructor arguments can be reused.
        constructor.method.addInstruction(1,
            "iput-object p4, p0, $GETTERS->$packageField:Ljava/lang/String;")
        Fingerprint(definingClass = RUNTIME, name = "nativeHooksInstalled", parameters = emptyList(), returnType = "Z")
            .method.addInstructions(0, "const/4 v0, 0x1\nreturn v0")
        MainActivityOnCreateFingerprint.method.addInstruction(0,
            "invoke-static/range { p0 .. p0 }, $RUNTIME->onActivityCreate(Landroid/app/Activity;)V")
        println("Afterglow AB Lab: eight typed native flag getters wrapped; native server values preserved")
    }
}

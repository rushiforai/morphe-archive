package app.rimixyz.patches.habitnow

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.patch
import app.morphe.patcher.util.findFreeRegister
import app.morphe.patcher.util.returnEarly
import app.rimixyz.patches.shared.Constants.COMPATIBILITY_HABITNOW

private const val OBJECT = "Lcom/aantik/vmrunnerlogger/Object;"
private const val RESTORE = "Lcom/aantik/vmrunnerlogger/RePairipRestore;"

/** `HabitNowApp.<clinit>` chama `StartupLauncher.launch()` uma unica vez. */
private val HabitNowLaunchFingerprint = Fingerprint(
    definingClass = "Lcom/habit/now/apps/activities/HabitNowApp;",
    name = "<clinit>",
    returnType = "V",
    parameters = emptyList(),
    filters = listOf(
        methodCall(
            definingClass = "Lcom/pairip/StartupLauncher;",
            name = "launch",
            returnType = "V",
        ),
    ),
)

/** 19 chamadores usam este metodo; um retorno nulo e o comportamento do RePairip. */
private val VmInvokeFingerprint = Fingerprint(
    definingClass = "Lcom/pairip/VMRunner;",
    name = "invoke",
    isStatic = true,
)

private fun clinitFingerprint(definingClass: String) = Fingerprint(
    definingClass = definingClass,
    name = "<clinit>",
    returnType = "V",
    parameters = emptyList(),
)

private val finalFieldClinitFingerprints = FINAL_METHOD_FIELDS.keys.map(::clinitFingerprint)

/**
 * Bypass do PairIP do HabitNow 2.5.5 sem re-assinar com o certificado original.
 *
 * O DEX de extensao (`pairip-extension.dex`) contem os 1446 valores que o VM
 * preenche em tempo de execucao (1435 Strings + 11 delegates), o resolvedor
 * `RePairipRestore.get(String)` e as 11 classes `$c20200603NN` extraidas do
 * asset IAP2 `jmqRlEgNs1vXZEKj`. Os valores foram capturados no app original
 * rodando, com root, e sao especificos desta versao.
 *
 * No APK de origem:
 *  1. `HabitNowApp.<clinit>` passa a chamar `Object.launch()` (que faz o
 *     `SPUT_OBJECT` de todos os campos) em vez de `StartupLauncher.launch()`;
 *  2. `VMRunner.invoke` passa a devolver null, neutralizando os 19 call sites
 *     que executariam a VM nativa (`libpairipcore.so`);
 *  3. os 9 campos `public static final` recebem seus `Method` dentro do proprio
 *     `<clinit>` da classe declarante (ART so permite escrita de `final` la);
 *  4. `SignatureCheck.verifyIntegrity` e `LicenseClient.checkLicense` viram
 *     no-op, como no patch antigo.
 *
 * Nao remove `libpairipcore.so` nem `com.pairip.*`: eles ficam inertes. Isso
 * mantem o patch puramente dex/recurso, que e o que o Morphe suporta.
 */
@Suppress("unused")
val bypassPairIpInHabitNowPatch = patch(
    name = "Bypass PairIP protection",
    description = "Restores the obfuscated runtime values and disables the PairIP virtual machine.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_HABITNOW)

    extendWith {
        object {}.javaClass.getResourceAsStream(
            "/app/rimixyz/patches/habitnow/pairip-extension.dex"
        )!!
    }

    execute {
        verifyHabitNowTarget()

        // 1. substui o unico launch do VM pelo restore dos valores baked
        HabitNowLaunchFingerprint.let { match ->
            val index = match.instructionMatches.first().index
            match.method.replaceInstruction(
                index,
                "invoke-static {}, $OBJECT->launch()V",
            )
        }

        // 2. VM nativa inerte: todos os 19 chamadores recebem null
        VmInvokeFingerprint.method.let { method ->
            val register = method.findFreeRegister(0)
            method.addInstructions(
                0,
                "const/4 v$register, 0x0\nreturn-object v$register",
            )
        }

        // 3. campos final: escrita dentro do <clinit> da propria classe
        FINAL_METHOD_FIELDS.keys.zip(finalFieldClinitFingerprints).forEach { (definingClass, fingerprint) ->
            val fields = FINAL_METHOD_FIELDS[definingClass].orEmpty()
            val method = fingerprint.method
            fields.forEach { (field, signature) ->
                val index = method.implementation!!.instructions.size - 1
                val register = method.findFreeRegister(index)
                val escaped = signature.replace("\\", "\\\\").replace("\"", "\\\"")
                method.addInstructions(
                    index,
                    "const-string v$register, \"$escaped\"\n" +
                        "invoke-static {v$register}, $RESTORE->get(Ljava/lang/String;)Ljava/lang/reflect/Method;\n" +
                        "move-result-object v$register\n" +
                        "sput-object v$register, $definingClass->$field:Ljava/lang/reflect/Method;",
                )
            }
        }

        // 4. camada Java
        PairIpSignatureCheckFingerprint.method.returnEarly()
        PairIpLicenseCheckFingerprint.method.returnEarly()
    }
}

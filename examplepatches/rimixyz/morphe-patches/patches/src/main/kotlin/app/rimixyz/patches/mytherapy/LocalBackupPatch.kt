package app.rimixyz.patches.mytherapy

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.patch
import app.morphe.patcher.patch.resourceFile
import app.rimixyz.patches.shared.Constants.COMPATIBILITY_MYTHERAPY
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import java.util.Base64

private const val EXTENSION_CLASS = "Lapp/rimixyz/extension/MyTherapyBackupHelper;"

private const val CVR_ASSET_EN =
    "assets/composeResources/eu.smartpatient.mytherapy.multiplatform.lib.resource/values/strings.commonMain.cvr"
private const val CVR_ASSET_PT =
    "assets/composeResources/eu.smartpatient.mytherapy.multiplatform.lib.resource/values-pt/strings.commonMain.cvr"
private const val CVR_ASSET_PT_BR =
    "assets/composeResources/eu.smartpatient.mytherapy.multiplatform.lib.resource/values-pt-rBR/strings.commonMain.cvr"

private const val CVR_KEY = "rimi_local_backup"
private const val LABEL_EN = "Local Backup & Restore"
private const val LABEL_PT = "Backup e Restauração Local"

/**
 * Adiciona backup local (.zip), restauração a frio com rollback e importação do histórico CSV
 * oficial ("MyTherapy Archive.csv") diretamente na tela de Configurações do MyTherapy.
 *
 * Arquitetura confirmada nos DEX de MyTherapy 4.16.2 / versionCode 4016002:
 *  - Todos os bancos Room3 do app usam BundledSQLiteDriver (SQLite sem SQLCipher); apenas o SDK
 *    SmartPilot/Ypsomed usa SQLCipher (smssdk.db) e fica fora do backup portátil.
 *  - O rótulo localizado é anexado ao final dos arquivos .cvr de Compose Resources (sem deslocar
 *    nenhum offset existente) e exposto via SettingsItemProvider em GetSettingsItemsUseCase.<init>.
 *  - RootActivity.onCreate registra os launchers SAF (ACTION_CREATE_DOCUMENT / ACTION_OPEN_DOCUMENT)
 *    no ActivityResultRegistry.
 *  - MyApplication.onCreate aplica a frio qualquer restauração de ZIP, importação de CSV ou
 *    rollback pendente antes da criação do grafo Metro e da abertura dos bancos Room3.
 *  - RefreshRemindersUseCaseImpl$MetroFactory.<init> e UserSessionInitializer.initialize disparam
 *    o recálculo dos lembretes após a sessão iniciar.
 */
@Suppress("unused")
val localBackupPatch = patch(
    name = "Local backup and restore",
    description = "Adds a Local Backup & Restore item to Settings to export/restore local .zip backups (with automatic rollback) and import official MyTherapy Archive CSV history.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_MYTHERAPY)

    extendWith("extensions/extension.mpe")

    execute {
        verifyMyTherapyTarget()

        // 1. Anexa o rótulo localizado ao final dos .cvr de Compose Resources sem alterar offsets existentes.
        val (enOffset, enSize) = appendCvrString(CVR_ASSET_EN, CVR_KEY, LABEL_EN)
        val (ptOffset, ptSize) = appendCvrString(CVR_ASSET_PT, CVR_KEY, LABEL_PT)
        val (ptBrOffset, ptBrSize) = appendCvrString(CVR_ASSET_PT_BR, CVR_KEY, LABEL_PT)
        val labelSpec = "$enOffset:$enSize,$ptOffset:$ptSize,$ptBrOffset:$ptBrSize"

        // 2. Hook a frio em MyApplication.onCreate() antes do grafo Metro / Room3 abrir os bancos.
        val appOnCreate = MyApplicationOnCreateFingerprint.method
        val appRegs = checkNotNull(appOnCreate.implementation) {
            "Local backup: MyApplication.onCreate sem implementação"
        }.registerCount
        val appThisReg = appRegs - 1
        check(appThisReg >= 1 && appThisReg < 16) {
            "Local backup: layout de registradores inesperado em MyApplication.onCreate (regs=$appRegs)"
        }
        appOnCreate.addInstructions(
            0,
            """
                const-string v0, "$labelSpec"
                invoke-static { v$appThisReg, v0 }, $EXTENSION_CLASS->onApplicationCreate(Landroid/app/Application;Ljava/lang/String;)V
            """.trimIndent(),
        )

        // 3. Injeta o provider do item "Backup e Restauração Local" em GetSettingsItemsUseCase.<init>(Set).
        val settingsInit = GetSettingsItemsInitFingerprint.method
        val settingsRegs = checkNotNull(settingsInit.implementation) {
            "Local backup: GetSettingsItemsUseCase.<init> sem implementação"
        }.registerCount
        val setParamReg = settingsRegs - 1
        check(setParamReg >= 1 && setParamReg < 16) {
            "Local backup: layout de registradores inesperado em GetSettingsItemsUseCase.<init> (regs=$settingsRegs)"
        }
        val iputIndex = settingsInit.instructions.indexOfFirst { ins ->
            ins.opcode == Opcode.IPUT_OBJECT &&
                (ins as? ReferenceInstruction)?.reference
                    .let { it as? FieldReference }
                    ?.let { it.name == "a" && it.type == "Ljava/util/Set;" } == true
        }
        check(iputIndex >= 0) {
            "Local backup: instrução iput-object do campo 'a' não encontrada em GetSettingsItemsUseCase.<init>"
        }
        settingsInit.addInstructions(
            iputIndex,
            """
                invoke-static { v$setParamReg }, $EXTENSION_CLASS->augmentSettingsProviders(Ljava/util/Set;)Ljava/util/Set;
                move-result-object v$setParamReg
            """.trimIndent(),
        )

        // 4. Registra launchers SAF em RootActivity.onCreate(Bundle) logo após BaseActivity.onCreate.
        val rootOnCreate = RootActivityOnCreateFingerprint.method
        val rootRegs = checkNotNull(rootOnCreate.implementation) {
            "Local backup: RootActivity.onCreate sem implementação"
        }.registerCount
        val rootThisReg = rootRegs - 2
        check(rootThisReg >= 0 && rootThisReg < 16) {
            "Local backup: layout de registradores inesperado em RootActivity.onCreate (regs=$rootRegs)"
        }
        val superOnCreateIndex = rootOnCreate.instructions.indexOfFirst { ins ->
            ins.opcode == Opcode.INVOKE_SUPER &&
                (ins as? ReferenceInstruction)?.reference
                    .let { it as? MethodReference }
                    ?.let {
                        it.definingClass == "Leu/smartpatient/mytherapy/multiplatform/feature/presentation/BaseActivity;" &&
                            it.name == "onCreate"
                    } == true
        }
        check(superOnCreateIndex >= 0) {
            "Local backup: chamada super.onCreate não encontrada em RootActivity.onCreate"
        }
        rootOnCreate.addInstructions(
            superOnCreateIndex + 1,
            "invoke-static { v$rootThisReg }, $EXTENSION_CLASS->onRootActivityCreate(Landroid/app/Activity;)V",
        )

        // 5. Captura RefreshRemindersUseCaseImpl$MetroFactory no construtor durante a subida do grafo.
        val factoryInit = RefreshRemindersFactoryInitFingerprint.method
        val factoryRegs = checkNotNull(factoryInit.implementation) {
            "Local backup: RefreshRemindersUseCaseImpl\$MetroFactory.<init> sem implementação"
        }.registerCount
        val factoryThisReg = factoryRegs - 5
        val factoryReturnIndex = factoryInit.instructions.size - 1
        check(
            factoryThisReg >= 0 &&
                factoryThisReg < 16 &&
                factoryReturnIndex >= 0 &&
                factoryInit.instructions.last().opcode == Opcode.RETURN_VOID
        ) {
            "Local backup: layout inesperado em RefreshRemindersUseCaseImpl\$MetroFactory.<init> (regs=$factoryRegs)"
        }
        factoryInit.addInstructions(
            factoryReturnIndex,
            "invoke-static { v$factoryThisReg }, $EXTENSION_CLASS->registerRefreshRemindersFactory(Ljava/lang/Object;)V",
        )

        // 6. Dispara recálculo de lembretes após UserSession.onUserSessionStart concluir.
        val sessionInit = UserSessionInitializerFingerprint.method
        val sessionInstructions = sessionInit.instructions.toList()
        val startCallIndex = sessionInstructions.indexOfFirst { ins ->
            ins.opcode == Opcode.INVOKE_INTERFACE &&
                (ins as? ReferenceInstruction)?.reference
                    .let { it as? MethodReference }
                    ?.let {
                        it.definingClass == "Leu/smartpatient/mytherapy/multiplatform/lib/lifecycle/UserSession;" &&
                            it.name == "onUserSessionStart"
                    } == true
        }
        check(startCallIndex >= 0) {
            "Local backup: chamada onUserSessionStart não encontrada em UserSessionInitializer.initialize"
        }
        val unitSgetIndex = (startCallIndex + 1 until sessionInstructions.size).firstOrNull { idx ->
            val ins = sessionInstructions[idx]
            ins.opcode == Opcode.SGET_OBJECT &&
                (ins as? ReferenceInstruction)?.reference
                    .let { it as? FieldReference }
                    ?.let { it.definingClass == "Lkotlin/Unit;" && it.name == "INSTANCE" } == true
        }
        check(
            unitSgetIndex != null &&
                unitSgetIndex + 1 < sessionInstructions.size &&
                sessionInstructions[unitSgetIndex + 1].opcode == Opcode.RETURN_OBJECT
        ) {
            "Local backup: retorno após onUserSessionStart não encontrado em UserSessionInitializer.initialize"
        }
        // Insere entre `sget-object Unit.INSTANCE` e `return-object`, mantendo intactos os saltos
        // para `sget-object` (tanto no retorno imediato quanto na retomada da coroutine).
        sessionInit.addInstructions(
            unitSgetIndex + 1,
            "invoke-static { }, $EXTENSION_CLASS->onUserSessionStarted()V",
        )
    }
}

private fun appendCvrString(assetPath: String, key: String, value: String): Pair<Long, Long> {
    val file = resourceFile(assetPath)
    check(file.isFile) {
        "Local backup: asset Compose Resources '$assetPath' não encontrado no APK"
    }
    val originalBytes = file.readBytes()
    val marker = "string|$key|".toByteArray(Charsets.UTF_8)
    check(!containsBytes(originalBytes, marker)) {
        "Local backup: '$assetPath' já contém a chave '$key'"
    }

    val encodedValue = Base64.getEncoder().encodeToString(value.toByteArray(Charsets.UTF_8))
    val lineBytes = "string|$key|$encodedValue".toByteArray(Charsets.UTF_8)
    val needsLeadingNewline = originalBytes.isNotEmpty() && originalBytes.last() != '\n'.code.toByte()

    val offset = originalBytes.size.toLong() + if (needsLeadingNewline) 1L else 0L
    val size = lineBytes.size.toLong()

    val combined = ByteArray(
        originalBytes.size + (if (needsLeadingNewline) 1 else 0) + lineBytes.size + 1
    )
    var pos = 0
    System.arraycopy(originalBytes, 0, combined, pos, originalBytes.size)
    pos += originalBytes.size
    if (needsLeadingNewline) {
        combined[pos++] = '\n'.code.toByte()
    }
    System.arraycopy(lineBytes, 0, combined, pos, lineBytes.size)
    pos += lineBytes.size
    combined[pos] = '\n'.code.toByte()

    file.writeBytes(combined)

    val verified = file.readBytes()
    val slice = verified.copyOfRange(offset.toInt(), (offset + size).toInt())
    check(slice.contentEquals(lineBytes)) {
        "Local backup: falha ao validar offset/tamanho em '$assetPath'"
    }

    return offset to size
}

private fun containsBytes(haystack: ByteArray, needle: ByteArray): Boolean {
    if (needle.isEmpty() || haystack.size < needle.size) {
        return false
    }
    outer@ for (i in 0..(haystack.size - needle.size)) {
        for (j in needle.indices) {
            if (haystack[i + j] != needle[j]) {
                continue@outer
            }
        }
        return true
    }
    return false
}

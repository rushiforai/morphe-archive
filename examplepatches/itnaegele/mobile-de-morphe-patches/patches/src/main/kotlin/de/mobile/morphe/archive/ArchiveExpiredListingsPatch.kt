package de.mobile.morphe.archive

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.patch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import de.mobile.morphe.shared.Constants.COMPATIBILITY_MOBILE_DE

private const val EXTENSION_CLASS = "Lde/mobile/archive/ArchiveExtension;"

@Suppress("unused")
val archiveExpiredListingsPatch = patch(
    name = "Abgelaufene Inserate archivieren (Google Drive)",
    description = "Archiviert angesehene und geparkte mobile.de-Inserate inklusive Fotos lokal und in Google Drive, sodass abgelaufene Inserate weiterhin geöffnet und angezeigt werden können.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_MOBILE_DE)

    extendWith("extensions/mobile-archive.mpe")

    execute {
        // 1. Initialize archive extension in SearchApplication.onCreate()
        SearchApplicationOnCreateFingerprint.method.addInstruction(
            0,
            "invoke-static {p0}, $EXTENSION_CLASS->init(Landroid/app/Application;)V",
        )

        // 2. Attach API archive interceptor in NetworkModule.Companion.provideOkHttpClientBuilder()
        ProvideOkHttpClientBuilderFingerprint.method.apply {
            val returnIndex = instructions.indexOfLast { it.opcode == Opcode.RETURN_OBJECT }
            if (returnIndex < 0) {
                throw PatchException("Could not find return-object in provideOkHttpClientBuilder")
            }
            val reg = (instructions[returnIndex] as OneRegisterInstruction).registerA
            addInstructions(
                returnIndex,
                """
                    invoke-static {v$reg}, $EXTENSION_CLASS->attachApiInterceptor(Lokhttp3/OkHttpClient${'$'}Builder;)Lokhttp3/OkHttpClient${'$'}Builder;
                    move-result-object v$reg
                """.trimIndent(),
            )
        }

        // 3. Capture built Retrofit OkHttpClient for background prefetching of parked listings
        NetworkHttpClientBuildFingerprint.let { fp ->
            val moveResultIndex = fp.instructionMatches.last().index
            val reg = (fp.method.instructions[moveResultIndex] as OneRegisterInstruction).registerA
            fp.method.addInstructions(
                moveResultIndex + 1,
                """
                    invoke-static {v$reg}, $EXTENSION_CLASS->captureApiClient(Lokhttp3/OkHttpClient;)Lokhttp3/OkHttpClient;
                    move-result-object v$reg
                """.trimIndent(),
            )
        }

        // 4. Attach Image archive interceptor in ImageNetworkModule.provideImageOkHttpClient()
        ProvideImageOkHttpClientFingerprint.method.apply {
            val returnIndex = instructions.indexOfLast { it.opcode == Opcode.RETURN_OBJECT }
            if (returnIndex < 0) {
                throw PatchException("Could not find return-object in provideImageOkHttpClient")
            }
            val reg = (instructions[returnIndex] as OneRegisterInstruction).registerA
            addInstructions(
                returnIndex,
                """
                    invoke-static {v$reg}, $EXTENSION_CLASS->attachImageInterceptor(Lokhttp3/OkHttpClient;)Lokhttp3/OkHttpClient;
                    move-result-object v$reg
                """.trimIndent(),
            )
        }

        // 5. Inject "Archiv (Google Drive)" menu item in HostActivity toolbar (optional fallback exists in Settings)
        HostActivityCreateMenuFingerprint.methodOrNull?.addInstruction(
            0,
            "invoke-static {p1}, $EXTENSION_CLASS->injectMenu(Landroid/view/Menu;)V",
        )
        HostActivityPrepareMenuFingerprint.methodOrNull?.addInstruction(
            0,
            "invoke-static {p1}, $EXTENSION_CLASS->injectMenu(Landroid/view/Menu;)V",
        )

        // 6. Inject per-listing "Archivierte Version" button on Parkplatz & SRP overview cards
        VehicleParkSetupBottomActionsFingerprint.methodOrNull?.apply {
            val retIdx = instructions.indexOfLast { it.opcode == Opcode.RETURN_VOID }
            if (retIdx >= 0) {
                addInstruction(
                    retIdx,
                    "invoke-static {p0, p1}, $EXTENSION_CLASS->bindParkedListingButton(Ljava/lang/Object;Ljava/lang/Object;)V",
                )
            }
        }
        SrpListingViewHolderBindFingerprint.methodOrNull?.apply {
            val retIdx = instructions.indexOfLast { it.opcode == Opcode.RETURN_VOID }
            if (retIdx >= 0) {
                addInstruction(
                    retIdx,
                    "invoke-static {p0, p1}, $EXTENSION_CLASS->bindSrpListingButton(Ljava/lang/Object;Ljava/lang/Object;)V",
                )
            }
        }
        ListingCardViewHolderBindFingerprint.methodOrNull?.addInstruction(
            0,
            "invoke-static {p0, p1}, $EXTENSION_CLASS->bindListingCardButton(Ljava/lang/Object;Ljava/lang/Object;)V",
        )
    }
}

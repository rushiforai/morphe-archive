package de.mobile.morphe.archive

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.InstructionLocation.MatchAfterImmediately
import app.morphe.patcher.methodCall
import app.morphe.patcher.opcode
import com.android.tools.smali.dexlib2.Opcode

object SearchApplicationOnCreateFingerprint : Fingerprint(
    definingClass = "Lde/mobile/android/app/SearchApplication;",
    name = "onCreate",
    returnType = "V",
    parameters = emptyList(),
)

object ProvideOkHttpClientBuilderFingerprint : Fingerprint(
    definingClass = "Lde/mobile/android/di/NetworkModule\$Companion;",
    name = "provideOkHttpClientBuilder",
    returnType = "Lokhttp3/OkHttpClient\$Builder;",
    parameters = emptyList(),
)

object NetworkHttpClientBuildFingerprint : Fingerprint(
    definingClass = "Lde/mobile/android/di/NetworkModule\$Companion;",
    name = "httpClient",
    returnType = "Lretrofit2/Retrofit\$Builder;",
    filters = listOf(
        methodCall(
            definingClass = "Lokhttp3/OkHttpClient\$Builder;",
            name = "build",
            returnType = "Lokhttp3/OkHttpClient;",
        ),
        opcode(Opcode.MOVE_RESULT_OBJECT, MatchAfterImmediately()),
    ),
)

object ProvideImageOkHttpClientFingerprint : Fingerprint(
    definingClass = "Lde/mobile/android/image/di/ImageNetworkModule;",
    name = "provideImageOkHttpClient",
    returnType = "Lokhttp3/OkHttpClient;",
    parameters = listOf("Lde/mobile/android/network/UserAgent;"),
)

object HostActivityCreateMenuFingerprint : Fingerprint(
    definingClass = "Lde/mobile/android/host/HostActivity\$setupMenuBadgeApplier\$1;",
    name = "onCreateMenu",
    returnType = "V",
    parameters = listOf("Landroid/view/Menu;", "Landroid/view/MenuInflater;"),
)

object HostActivityPrepareMenuFingerprint : Fingerprint(
    definingClass = "Lde/mobile/android/host/HostActivity\$setupMenuBadgeApplier\$1;",
    name = "onPrepareMenu",
    returnType = "V",
    parameters = listOf("Landroid/view/Menu;"),
)

object VehicleParkSetupBottomActionsFingerprint : Fingerprint(
    definingClass = "Lde/mobile/android/parkedlistings/park/viewholder/VehicleParkAdViewHolder;",
    name = "setupBottomActions",
    returnType = "V",
    parameters = listOf("Lde/mobile/android/vehiclepark/ParkedListingItem;"),
)

object SrpListingViewHolderBindFingerprint : Fingerprint(
    definingClass = "Lde/mobile/android/srp/ui/adapter/SRPListingViewHolder;",
    name = "bind",
    returnType = "V",
    parameters = listOf("Lde/mobile/android/srp/ui/model/SRPItem;"),
)

object ListingCardViewHolderBindFingerprint : Fingerprint(
    definingClass = "Lde/mobile/android/srp/ui/adapter/ListingCardViewHolder;",
    name = "bind",
    returnType = "V",
    parameters = listOf("Lde/mobile/android/srp/ui/components/ListingCardUiState;"),
)

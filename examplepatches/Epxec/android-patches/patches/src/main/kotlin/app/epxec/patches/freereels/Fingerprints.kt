package app.epxec.patches.freereels.Fingerprints

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.InstructionLocation.MatchAfterImmediately
import app.morphe.patcher.methodCall
import app.morphe.patcher.opcode
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import app.morphe.patcher.fieldAccess

object FreereelsVipFingerprint : Fingerprint(
    definingClass = "Lcom/dramawave/shared/models/bean/WalletBean;",
    name = "M",
    returnType = "Z",
    parameters = emptyList(),
)

object FreereelsDownloadAdsFingerprint : Fingerprint(
    definingClass = "Lcom/dramawave/feature/home/download/viewmodel/VideoDownloadViewModel;",
    name = "<init>",
    returnType = "V",
    parameters = listOf(
        "Lcom/dramawave/service/api/repository/HomeRepository;",
        "Lcom/dramawave/feature/home/download/reward/DownloadResolutionRewardScheduler;",
        "Landroidx/lifecycle/SavedStateHandle;",
    ),
    filters = listOf(
        fieldAccess(
            opcode = Opcode.IPUT_BOOLEAN,
            definingClass = "this",
            name = "g0",
            type = "Z",
        )
    ),
)
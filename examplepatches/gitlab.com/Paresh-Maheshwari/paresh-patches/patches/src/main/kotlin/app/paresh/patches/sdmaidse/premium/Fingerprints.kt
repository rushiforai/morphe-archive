package app.paresh.patches.sdmaidse.premium

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.fieldAccess
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode

// UpgradeRepoGplay$Info constructor — sets isPro field
object UpgradeInfoConstructorFingerprint : Fingerprint(
    definingClass = "Leu/darken/sdmse/common/upgrade/core/UpgradeRepoGplay\$Info;",
    name = "<init>",
    returnType = "V",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.CONSTRUCTOR),
    filters = listOf(
        fieldAccess(
            opcode = Opcode.IPUT_BOOLEAN,
            definingClass = "Leu/darken/sdmse/common/upgrade/core/UpgradeRepoGplay\$Info;",
            name = "gracePeriod",
            type = "Z"
        ),
    )
)

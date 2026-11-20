package app.aidan.patches.prometronome.features

import app.aidan.patches.prometronome.shared.COMPATIBILITY_PRO_METRONOME
import app.aidan.patches.shared.returnOptionalBoolean
import app.aidan.patches.shared.returnRequiredBoolean
import app.morphe.patcher.patch.bytecodePatch

@Suppress("unused")
val unlockProPatch = bytecodePatch(
    name = "Unlock Pro",
    description = "Unlocks all Pro features including polyrhythms, advanced subdivisions, visual beat modes, practice modes, and unlimited presets.",
    default = true
) {
    category("Features")
    compatibleWith(COMPATIBILITY_PRO_METRONOME)

    execute {
        returnRequiredBoolean("Lcom/eumlab/prometronome/PayHelper;", "hasPro", true)
        returnRequiredBoolean("Lcom/eumlab/prometronome/oversea/ProUpgradeHelper;", "hasPro", true)
        returnRequiredBoolean("Lcom/eumlab/prometronome/oversea/OverseaServiceImpl;", "hasPro", true)

        returnOptionalBoolean("Lcom/eumlab/prometronome/baselib/util/UserCache;", "isPro", true)
        returnOptionalBoolean("Lcom/eumlab/prometronome/baselib/data/db/entity/User;", "isPro", true)
    }
}

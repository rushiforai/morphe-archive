package app.playerbridge.patches.douban

import app.morphe.patcher.Fingerprint

/**
 * Douban 7.135.0 is protected by the NetEase NIS wrapper.
 *
 * We hook the wrapper Application instead of InstrumentationProxy so the
 * protected startup sequence can finish before any bridge code is loaded.
 */
object DoubanApplicationOnCreateFingerprint : Fingerprint(
    returnType = "V",
    custom = { method, classDef ->
        classDef.type == "Lcom/netease/nis/wrapper/MyApplication;" &&
            method.name == "onCreate" &&
            method.parameterTypes.isEmpty()
    },
)

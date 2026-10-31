package app.ratbanana.patches.gaminghub.home

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.AccessFlags

internal const val SLOT_CLASS =
    "Lcom/samsung/android/game/gamehome/network/gamelauncher/model/main/response/Slot;"

internal const val SLOT_TITLE_GETTER = "getRcuTitle"

internal const val SLOT_DISPLAY_TYPE_GETTER = "getDisplayType"

/**
 * `CardInfoFactory.create(slot: Slot, categoryList: List): MainCardInfo?`
 *
 * Maps every slot of the home feed response to a row. Rows mapped to null are dropped
 * by the caller before they reach the UI, so returning null here removes a row cleanly.
 */
internal object CardInfoFactoryFingerprint : Fingerprint(
    definingClass = "Lcom/samsung/android/game/gamehome/app_domain/usecase/main/CardInfoFactory;",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Lcom/samsung/android/game/gamehome/app_domain/model/main/MainCardInfo;",
    parameters = listOf(SLOT_CLASS, "Ljava/util/List;"),
)

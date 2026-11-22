package dev.supperelias2.sbs.morphe

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall
import app.morphe.patcher.string

internal const val APPLICATION = "Lcom/sbs/ondemand/OnDemandApplication;"
internal const val ACCOUNT_PAGE = "Lcom/sbs/ondemand/ui/settings/AccountPageKt;"
internal const val COMPOSER = "Landroidx/compose/runtime/Composer;"
internal const val FUNCTION0 = "Lkotlin/jvm/functions/Function0;"

internal object SettingsApplicationFingerprint : Fingerprint(
    definingClass = APPLICATION,
    name = "onCreate",
    returnType = "V",
    parameters = emptyList(),
    filters = listOf(methodCall(definingClass = "Landroid/app/Application;", name = "onCreate"))
)

internal object AccountRowsFingerprint : Fingerprint(
    definingClass = ACCOUNT_PAGE,
    name = "AccountRows",
    returnType = "V",
    parameters = listOf(
        "Lcom/sbs/ondemand/ui/settings/SettingsViewModel;",
        FUNCTION0, FUNCTION0, "Lkotlin/jvm/functions/Function1;", COMPOSER, "I", "I"
    ),
    filters = listOf(string("appSettingAction"), string("languageSettingAction"))
)

internal object AccountRowFingerprint : Fingerprint(
    definingClass = ACCOUNT_PAGE,
    name = "AccountRow",
    returnType = "V",
    filters = listOf(
        string("onClickAction"),
        methodCall(definingClass = "Landroidx/compose/ui/graphics/Color\$Companion;", name = "getWhite-0d7_KjU")
    )
)

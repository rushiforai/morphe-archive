// SPDX-License-Identifier: GPL-3.0-only
// Copyright (C) 2026 Kero309x

package app.keropatches.vodafone.account

import app.keropatches.core.PatchCategory
import app.keropatches.core.answerIntCallsWithZero
import app.keropatches.vodafone.VodafoneApp
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.returnEarly

/**
 * The check that decides whether the account list is full.
 *
 * The limit is five saved accounts, or six when the first of them is a seamless
 * one. The method is private and static, so the class and the signature
 * together identify it.
 */
private object AccountLimitFingerprint : Fingerprint(
    definingClass = "Lvodafone/vis/engezly/account/switchaccount/presentation/ui/SwitchAccountOverlayKt;",
    name = "checkIfAccountsMaxLimit",
    isStatic = true,
    returnType = "Z",
    parameters = listOf("Ljava/util/List;"),
)

/**
 * The second place that counts the saved accounts.
 *
 * The overlay that asks which account to switch to compares the size of the
 * saved list with five and shows the "too many accounts" screen when the list
 * is at least that long. The comparison is inline, so the count is answered
 * instead of the branch.
 */
private object SavedAccountCountFingerprint : Fingerprint(
    definingClass = "Lvodafone/vis/engezly/account/login/presentation/credential/ui/overlay/CredentialsLoginOverlayKt;",
    name = "onSwitchAccountClicked",
    isStatic = true,
    returnType = "V",
    parameters = listOf(
        "Lvodafone/vis/engezly/account/login/presentation/model/SavedAccountsUiState;",
        "Lkotlin/jvm/functions/Function0;",
        "Lkotlin/jvm/functions/Function0;",
    ),
)

/**
 * The third place that counts the saved accounts.
 *
 * The screen that shows the accounts and the button that adds another one
 * compares the size of the saved list with five. When the list is that long it
 * shows the "too many accounts" message instead of opening the screen that
 * adds another account. The comparison is inline, so the count is answered
 * instead of the branch.
 */
private object LandingAccountCountFingerprint : Fingerprint(
    definingClass = "Lvodafone/vis/engezly/account/login/presentation/ui/LoginLandingScreenKt;",
    name = "LoginLandingScreen\$lambda\$23\$lambda\$17",
    isStatic = true,
    returnType = "Lkotlin/Unit;",
    parameters = listOf(
        "Lvodafone/vis/engezly/account/login/presentation/main/LoginSharedViewModel;",
        "Landroidx/compose/runtime/State;",
        "Z",
    ),
)

/**
 * The repository that refuses a login when five accounts are saved.
 *
 * The class is the credential-login repository. Its `login` method asks the
 * cache how many saved accounts are not seamless and compares that number with
 * five. When the number is exactly five and the number being signed in is not
 * one of the saved accounts, the method returns an error with the code of the
 * "too many accounts" message instead of asking the login service. The class
 * and the method are both renamed by the shrinker, so the class and the full
 * signature together identify it.
 */
private object LoginRepositoryLimitFingerprint : Fingerprint(
    definingClass = "Lo/GetTargetFragmentUsageViolation;",
    name = "AnimatedBarChartKtAnimatedBarChart1112",
    isStatic = false,
    returnType = "Ljava/lang/Object;",
    parameters = listOf(
        "Lvodafone/vis/engezly/account/login/domain/model/LoginInfoModel;",
        "Lkotlin/coroutines/Continuation;",
    ),
)

/**
 * Removes the limit on the number of saved accounts.
 *
 * The stock build keeps at most five accounts, or six when the first of them is
 * a seamless one, and refuses to switch to another account once the list is
 * that long. The limit is checked in four places: the overlay that lists the
 * accounts, the credential-login overlay that asks which account to switch to,
 * the screen that shows the accounts and the button that adds another one, and
 * the repository that performs the login itself. All four are answered here.
 *
 * The first check is a method of its own, so it is answered with "the list is
 * not full". The next two compare the size of the list with five inline; the
 * size is answered with zero instead, which is the answer the comparison takes
 * for a list that is not full. The account that is being switched to is
 * found in the list in the same way as before, so the account that is opened
 * does not change.
 *
 * The fourth check is the one that is reached when the number being signed in
 * is not one of the saved accounts. It counts the saved accounts with a method
 * of its own and compares the answer with five, then looks the number up in the
 * saved list and answers the "too many accounts" error when it is absent. The
 * count is answered with zero, which is never five, so the login goes to the
 * login service as it does for any account that is not the fifth one. The count
 * is used in this one comparison, so no other behaviour changes.
 *
 * The accounts themselves are stored the way they always were. The patch only
 * removes the check, so nothing about how an account is remembered, logged in
 * or removed changes.
 */
@Suppress("unused")
val removeAccountLimitPatch = bytecodePatch(
    name = "Remove the saved account limit",
    description = "Lets the app keep more than five accounts and switch between all of them.",
    default = true,
) {
    compatibleWith(VodafoneApp.compatibility)
    category(PatchCategory.ENTITLEMENT.label)

    execute {
        AccountLimitFingerprint.method.returnEarly(false)
        SavedAccountCountFingerprint.method.answerIntCallsWithZero("Ljava/util/List;->size()I")
        LandingAccountCountFingerprint.method.answerIntCallsWithZero("Ljava/util/List;->size()I")
        LoginRepositoryLimitFingerprint.method.answerIntCallsWithZero(
            "Lo/GetTargetFragmentUsageViolation;->AnimatedBarChartKtAnimatedBarChart1111()I",
        )
    }
}

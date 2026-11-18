// SPDX-License-Identifier: GPL-3.0-only
// Copyright (C) 2026 Kero309x

package app.keropatches.vodafone.account

import app.keropatches.core.PatchCategory
import app.keropatches.core.replaceStringConstant
import app.keropatches.vodafone.VodafoneApp
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.bytecodePatch

/**
 * The statement that writes the stored password of the account.
 *
 * The application keeps the password of an account in its own database, in
 * encrypted form, so that it can log the account in again without asking. The
 * write is a plain update statement that the data access layer builds. The
 * shrinker renamed the class the statement sits in, so the class and the method
 * together identify it.
 */
private object StoredPasswordStatementFingerprint : Fingerprint(
    definingClass = "Lo/includeOperationsIn\$1;",
    name = "createQuery",
    isStatic = false,
    returnType = "Ljava/lang/String;",
    parameters = emptyList(),
)

/**
 * The same write in the second database of the application.
 *
 * The application keeps two copies of the account: one in the database of the
 * authentication layer, which holds the password encrypted, and one in the
 * database of the application itself, which holds it in the clear and is the
 * one the list of accounts is built from. The copy in the application database
 * is written by the same kind of statement, and it empties the password in the
 * same way. The class and the method together identify it.
 */
private object ApplicationPasswordStatementFingerprint : Fingerprint(
    definingClass = "Lo/sendPreinstallReferrerI;",
    name = "AnimatedBarChartPreview",
    isStatic = true,
    returnType = "Ljava/lang/Object;",
    parameters = listOf(
        "Ljava/lang/String;",
        "Lo/DualSurfaceProcessorExternalSyntheticLambda6;",
    ),
)

/**
 * The statement that writes the whole account record of the application.
 *
 * The copy of the account that the application keeps for itself is written by
 * a statement that replaces the record. It carries the password of the login
 * that is being performed, which is empty for every login that does not ask
 * for one, and it replaces the stored password with that empty one. The class
 * and the method together identify it.
 */
private object ApplicationAccountInsertFingerprint : Fingerprint(
    definingClass = "Lo/sendPreinstallReferrerI\$1;",
    name = "AnimatedBarChartKtAnimatedBarChart1112",
    isStatic = false,
    returnType = "Ljava/lang/String;",
    parameters = emptyList(),
)

/**
 * Keeps the password the application already knows for an account.
 *
 * The application stores the password of every account, encrypted, in its own
 * database, and uses it to log the account in again when the account is
 * opened. The password reaches the stored record through three statements of
 * the data access layer, one for the database of the authentication layer and
 * two for the database of the application itself, and all of them are run with
 * the password of the login that is being performed, which is empty for every
 * login that does not ask for one.
 *
 * That is what makes the application forget. The encryption keeps an empty
 * password as it is, so the stored password really is emptied, and the next
 * time the account is opened the application asks for the password again.
 *
 * The patch makes the three statements keep the password that is already
 * stored when they are handed an empty one. A statement that carries a
 * password still writes it, so the password the user types is stored as it
 * always was, and the application can still log the account in with it.
 *
 * The statements keep their shape: they still write the account that is
 * logged in, and they still write a password when they are given one. The
 * statement that replaces the whole record reads the password that is already
 * stored from the row it replaces.
 */
@Suppress("unused")
val keepStoredPasswordPatch = bytecodePatch(
    name = "Keep the password of each account",
    description = "Stops the app forgetting the password of an account, so it stops asking for it every time.",
    default = true,
) {
    compatibleWith(VodafoneApp.compatibility)
    category(PatchCategory.ENTITLEMENT.label)

    execute {
        StoredPasswordStatementFingerprint.method.replaceStringConstant(
            "UPDATE UserInfoEntity SET password =? where isUserCurrentlyLoggedIn = 1",
            "UPDATE UserInfoEntity SET password =CASE WHEN ?1='' THEN password ELSE ?1 END " +
                "where isUserCurrentlyLoggedIn = 1",
        )
        ApplicationPasswordStatementFingerprint.method.replaceStringConstant(
            "UPDATE UserAuthInfoEntity SET password =? where isUserCurrentlyLoggedIn = 1",
            "UPDATE UserAuthInfoEntity SET password =CASE WHEN ?1='' THEN password ELSE ?1 END " +
                "where isUserCurrentlyLoggedIn = 1",
        )
        ApplicationAccountInsertFingerprint.method.replaceStringConstant(
            "INSERT OR REPLACE INTO `UserAuthInfoEntity` (`msisdn`,`password`,`accountNumber`,`firstName`,`lastName`,`lineType`,`billCycleCode`,`priceGroupType`,`contractStatus`,`encryptedMsisdn`,`customerID`,`contractID`,`segmentValue`,`billCycleDate`,`serviceClassCode`,`contractSubType`,`tariffModelName`,`contractType`,`customerType`,`ratePlanCode`,`ratePlanType`,`serviceClassName`,`digitalID`,`isUserCurrentlyLoggedIn`,`isLoggedInSeamless`,`isAccountOwner`,`isEndUser`,`isProspectUser`,`isSpocUser`,`isFirstTimeSeamlessLogin`,`hasProfile`,`isEnterpriseUser`,`isNewVF`,`tokenInfo`,`eShopTokenInfo`,`subAccounts`,`isPaymentResponsibleFlag`,`contractRole`,`key`,`priceGroupCode`,`ADSLFlag`,`largeBillingAccount`,`loyalAuthorizedFlag`,`priceGroupCategory`,`spocSubAccounts`) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)",
            "INSERT OR REPLACE INTO `UserAuthInfoEntity` (`msisdn`,`password`,`accountNumber`,`firstName`,`lastName`,`lineType`,`billCycleCode`,`priceGroupType`,`contractStatus`,`encryptedMsisdn`,`customerID`,`contractID`,`segmentValue`,`billCycleDate`,`serviceClassCode`,`contractSubType`,`tariffModelName`,`contractType`,`customerType`,`ratePlanCode`,`ratePlanType`,`serviceClassName`,`digitalID`,`isUserCurrentlyLoggedIn`,`isLoggedInSeamless`,`isAccountOwner`,`isEndUser`,`isProspectUser`,`isSpocUser`,`isFirstTimeSeamlessLogin`,`hasProfile`,`isEnterpriseUser`,`isNewVF`,`tokenInfo`,`eShopTokenInfo`,`subAccounts`,`isPaymentResponsibleFlag`,`contractRole`,`key`,`priceGroupCode`,`ADSLFlag`,`largeBillingAccount`,`loyalAuthorizedFlag`,`priceGroupCategory`,`spocSubAccounts`) VALUES (?1,COALESCE(NULLIF(?2,''),(SELECT `password` FROM `UserAuthInfoEntity` WHERE `msisdn`=?1),''),?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)",
        )
    }
}
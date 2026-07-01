package app.bigyank.patches.shealth

/** Smali body: read first Samsung account name from AccountManager (sync methods). */
internal fun accountManagerLookupBody(contextRegister: String = "p1"): String =
    """
    invoke-static {$contextRegister}, Landroid/accounts/AccountManager;->get(Landroid/content/Context;)Landroid/accounts/AccountManager;
    move-result-object v0
    const-string v1, "$DEVICE_SAMSUNG_ACCOUNT_TYPE"
    invoke-virtual {v0, v1}, Landroid/accounts/AccountManager;->getAccountsByType(Ljava/lang/String;)[Landroid/accounts/Account;
    move-result-object v0
    array-length v1, v0
    if-lez v1, :sa_no_account
    const/4 v1, 0x0
    aget-object v0, v0, v1
    iget-object v0, v0, Landroid/accounts/Account;->name:Ljava/lang/String;
    return-object v0
    :sa_no_account
    const/4 v0, 0x0
    return-object v0
    """.trimIndent()

private const val SAMSUNG_ACCOUNT_DATA_SOURCE =
    "Lcom/samsung/android/service/health/server/account/source/remote/SamsungAccountDataSourceImpl;"

/**
 * 7.x routes account ID through [SamsungAccountDataSourceImpl] ContentResolver provider calls.
 * Replaces those invokeSuspend bodies with AccountManager lookup (6.x used [getSamsungAccountId]).
 */
internal fun accountProviderFetchAccountIdBody(innerClassType: String): String {
    val thisField = "$innerClassType->this\$0:$SAMSUNG_ACCOUNT_DATA_SOURCE"
    return """
    iget-object p0, p0, $thisField
    invoke-static {p0}, $SAMSUNG_ACCOUNT_DATA_SOURCE->access${'$'}getContext${'$'}p($SAMSUNG_ACCOUNT_DATA_SOURCE)Landroid/content/Context;
    move-result-object p0
    ${accountManagerLookupBody("p0")}
    """.trimIndent()
}

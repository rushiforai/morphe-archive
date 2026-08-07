.class public Ll/gul0;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public static a(Lcom/p1/mobile/putong/core/data/PurchaseType;Z)V
    .locals 3

    .line 1
    new-instance v0, Lorg/json/JSONObject;

    .line 2
    .line 3
    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 4
    .line 5
    .line 6
    :try_start_0
    const-string v1, "productType"

    .line 7
    .line 8
    invoke-static {p0}, Ll/mib0;->k(Lcom/p1/mobile/putong/core/data/PurchaseType;)Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v2

    .line 12
    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 13
    .line 14
    .line 15
    const-string v1, "is_privileged"

    .line 16
    .line 17
    invoke-static {p0}, Ll/gul0;->d(Lcom/p1/mobile/putong/core/data/PurchaseType;)Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-virtual {v0, v1, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 22
    .line 23
    .line 24
    const-string p0, "is_TeamTanTanlink"

    .line 25
    .line 26
    invoke-virtual {v0, p0, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 27
    .line 28
    .line 29
    goto :goto_0

    .line 30
    :catch_0
    move-exception p0

    .line 31
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 32
    .line 33
    .line 34
    :goto_0
    const-string p0, "e_buy_privilege_button"

    .line 35
    .line 36
    const-string p1, "p_privileges_view"

    .line 37
    .line 38
    invoke-static {p0, p1, v0}, Ll/i4g0;->t(Ljava/lang/String;Ljava/lang/String;Lorg/json/JSONObject;)V

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method public static b(Lcom/p1/mobile/putong/core/data/PurchaseType;)V
    .locals 3

    .line 1
    new-instance v0, Lorg/json/JSONObject;

    .line 2
    .line 3
    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 4
    .line 5
    .line 6
    :try_start_0
    const-string v1, "productType"

    .line 7
    .line 8
    invoke-static {p0}, Ll/mib0;->k(Lcom/p1/mobile/putong/core/data/PurchaseType;)Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v2

    .line 12
    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 13
    .line 14
    .line 15
    const-string v1, "is_privileged"

    .line 16
    .line 17
    invoke-static {p0}, Ll/gul0;->d(Lcom/p1/mobile/putong/core/data/PurchaseType;)Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-virtual {v0, v1, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 22
    .line 23
    .line 24
    goto :goto_0

    .line 25
    :catch_0
    move-exception p0

    .line 26
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 27
    .line 28
    .line 29
    :goto_0
    const-string p0, "e_buy_privilege_button"

    .line 30
    .line 31
    const-string v1, "p_privilege_intro"

    .line 32
    .line 33
    invoke-static {p0, v1, v0}, Ll/i4g0;->t(Ljava/lang/String;Ljava/lang/String;Lorg/json/JSONObject;)V

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public static c(Lcom/p1/mobile/putong/core/data/Privilege;)Ljava/lang/String;
    .locals 2

    .line 1
    sget-object v0, Ll/gul0$a;->a:[I

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/lang/Enum;->ordinal()I

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    aget v0, v0, v1

    .line 8
    .line 9
    packed-switch v0, :pswitch_data_0

    .line 10
    .line 11
    .line 12
    const-string p0, ""

    .line 13
    .line 14
    return-object p0

    .line 15
    :pswitch_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/Privilege;->getFunctionType()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    return-object p0

    .line 20
    :pswitch_1
    const-string p0, "recoverMatches"

    .line 21
    .line 22
    return-object p0

    .line 23
    :pswitch_2
    const-string p0, "letter"

    .line 24
    .line 25
    return-object p0

    .line 26
    :pswitch_3
    const-string p0, "privacyMembership"

    .line 27
    .line 28
    return-object p0

    .line 29
    :pswitch_4
    const-string p0, "advancedFilter"

    .line 30
    .line 31
    return-object p0

    .line 32
    :pswitch_5
    const-string p0, "readMessages"

    .line 33
    .line 34
    return-object p0

    .line 35
    :pswitch_6
    const-string p0, "superLike"

    .line 36
    .line 37
    return-object p0

    .line 38
    :pswitch_7
    const-string p0, "undo"

    .line 39
    .line 40
    return-object p0

    .line 41
    :pswitch_8
    const-string p0, "location"

    .line 42
    .line 43
    return-object p0

    .line 44
    :pswitch_9
    const-string p0, "likeLimit"

    .line 45
    .line 46
    return-object p0

    .line 47
    :pswitch_a
    const-string p0, "badge"

    .line 48
    .line 49
    return-object p0

    .line 50
    nop

    .line 51
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method public static d(Lcom/p1/mobile/putong/core/data/PurchaseType;)Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->l:Ll/j49;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/j49;->e()Lcom/p1/mobile/putong/core/biz/service/CoreMemberInnerService;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-interface {v0, p0}, Lcom/p1/mobile/putong/core/biz/service/CoreMemberInnerService;->Xp(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    invoke-static {p0}, Ll/gul0;->e(Z)Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public static e(Z)Ljava/lang/String;
    .locals 0

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    const-string p0, "yes"

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    const-string p0, "no"

    .line 7
    .line 8
    return-object p0
.end method

.method public static f(Lcom/p1/mobile/putong/core/data/PurchaseType;)V
    .locals 3

    .line 1
    new-instance v0, Lorg/json/JSONObject;

    .line 2
    .line 3
    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 4
    .line 5
    .line 6
    :try_start_0
    const-string v1, "productType"

    .line 7
    .line 8
    invoke-static {p0}, Ll/mib0;->k(Lcom/p1/mobile/putong/core/data/PurchaseType;)Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v2

    .line 12
    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 13
    .line 14
    .line 15
    const-string v1, "is_privileged"

    .line 16
    .line 17
    invoke-static {p0}, Ll/gul0;->d(Lcom/p1/mobile/putong/core/data/PurchaseType;)Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-virtual {v0, v1, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 22
    .line 23
    .line 24
    goto :goto_0

    .line 25
    :catch_0
    move-exception p0

    .line 26
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 27
    .line 28
    .line 29
    :goto_0
    const-string p0, "e_buy_privilege_button"

    .line 30
    .line 31
    const-string v1, "p_privileges_view"

    .line 32
    .line 33
    invoke-static {p0, v1, v0}, Ll/i4g0;->z(Ljava/lang/String;Ljava/lang/String;Lorg/json/JSONObject;)V

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public static g(Lcom/p1/mobile/putong/core/data/PurchaseType;Lcom/p1/mobile/putong/core/data/Privilege;)V
    .locals 2

    .line 1
    new-instance v0, Lorg/json/JSONObject;

    .line 2
    .line 3
    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 4
    .line 5
    .line 6
    :try_start_0
    const-string v1, "productType"

    .line 7
    .line 8
    invoke-static {p0}, Ll/mib0;->k(Lcom/p1/mobile/putong/core/data/PurchaseType;)Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-virtual {v0, v1, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 13
    .line 14
    .line 15
    const-string p0, "privilegeType"

    .line 16
    .line 17
    invoke-static {p1}, Ll/gul0;->c(Lcom/p1/mobile/putong/core/data/Privilege;)Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    invoke-virtual {v0, p0, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 22
    .line 23
    .line 24
    goto :goto_0

    .line 25
    :catch_0
    move-exception p0

    .line 26
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 27
    .line 28
    .line 29
    :goto_0
    const-string p0, "e_privilege_intro_banner"

    .line 30
    .line 31
    const-string p1, "p_privilege_intro"

    .line 32
    .line 33
    invoke-static {p0, p1, v0}, Ll/i4g0;->z(Ljava/lang/String;Ljava/lang/String;Lorg/json/JSONObject;)V

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public static h(Lcom/p1/mobile/putong/core/data/PurchaseType;)V
    .locals 3

    .line 1
    new-instance v0, Lorg/json/JSONObject;

    .line 2
    .line 3
    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 4
    .line 5
    .line 6
    :try_start_0
    const-string v1, "productType"

    .line 7
    .line 8
    invoke-static {p0}, Ll/mib0;->k(Lcom/p1/mobile/putong/core/data/PurchaseType;)Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v2

    .line 12
    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 13
    .line 14
    .line 15
    const-string v1, "is_privileged"

    .line 16
    .line 17
    invoke-static {p0}, Ll/gul0;->d(Lcom/p1/mobile/putong/core/data/PurchaseType;)Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-virtual {v0, v1, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 22
    .line 23
    .line 24
    goto :goto_0

    .line 25
    :catch_0
    move-exception p0

    .line 26
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 27
    .line 28
    .line 29
    :goto_0
    const-string p0, "e_buy_privilege_button"

    .line 30
    .line 31
    const-string v1, "p_privilege_intro"

    .line 32
    .line 33
    invoke-static {p0, v1, v0}, Ll/i4g0;->z(Ljava/lang/String;Ljava/lang/String;Lorg/json/JSONObject;)V

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public static i(Lcom/p1/mobile/putong/core/data/PurchaseType;)V
    .locals 2

    .line 1
    new-instance v0, Lorg/json/JSONObject;

    .line 2
    .line 3
    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 4
    .line 5
    .line 6
    :try_start_0
    const-string v1, "productType"

    .line 7
    .line 8
    invoke-static {p0}, Ll/mib0;->k(Lcom/p1/mobile/putong/core/data/PurchaseType;)Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-virtual {v0, v1, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 13
    .line 14
    .line 15
    goto :goto_0

    .line 16
    :catch_0
    move-exception p0

    .line 17
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 18
    .line 19
    .line 20
    :goto_0
    const-string p0, "e_privilege_page_card"

    .line 21
    .line 22
    const-string v1, "p_privileges_view"

    .line 23
    .line 24
    invoke-static {p0, v1, v0}, Ll/i4g0;->z(Ljava/lang/String;Ljava/lang/String;Lorg/json/JSONObject;)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

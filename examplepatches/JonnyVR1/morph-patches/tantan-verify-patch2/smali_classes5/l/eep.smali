.class public final Ll/eep;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/eep$b;
    }
.end annotation


# direct methods
.method public static a(ZZ)Ljava/lang/String;
    .locals 0

    .line 1
    if-eqz p0, :cond_1

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    const-string p0, "INTL_TTC_ULTRA_FULLBOOST_TITLE_USA"

    .line 6
    .line 7
    return-object p0

    .line 8
    :cond_0
    const-string p0, "INTL_TTC_ULTRA_FULLBOOST_TITLE"

    .line 9
    .line 10
    return-object p0

    .line 11
    :cond_1
    if-eqz p1, :cond_2

    .line 12
    .line 13
    const-string p0, "INTL_TTC_FULLSCREEN_PREMIUM_BOOST_TITLE_USA"

    .line 14
    .line 15
    return-object p0

    .line 16
    :cond_2
    const-string p0, "INTL_TTC_FULLSCREEN_PREMIUM_PRIVILEGE_TITLE_6"

    .line 17
    .line 18
    return-object p0
.end method

.method public static b(Lcom/p1/mobile/putong/core/data/Privilege;)Ljava/lang/String;
    .locals 1
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    sget-object v0, Ll/eep$a;->a:[I

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/lang/Enum;->ordinal()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    aget p0, v0, p0

    .line 8
    .line 9
    const/4 v0, 0x4

    .line 10
    if-eq p0, v0, :cond_4

    .line 11
    .line 12
    const/4 v0, 0x5

    .line 13
    if-eq p0, v0, :cond_3

    .line 14
    .line 15
    const/16 v0, 0x8

    .line 16
    .line 17
    if-eq p0, v0, :cond_1

    .line 18
    .line 19
    const/16 v0, 0xb

    .line 20
    .line 21
    if-eq p0, v0, :cond_0

    .line 22
    .line 23
    const/4 p0, 0x0

    .line 24
    return-object p0

    .line 25
    :cond_0
    const-string p0, "INTL_VIP_PRIVILEGE_TRIBE_TEXT"

    .line 26
    .line 27
    return-object p0

    .line 28
    :cond_1
    invoke-static {}, Lcom/p1/mobile/putong/ab/IntlCountryCodeController;->v()Z

    .line 29
    .line 30
    .line 31
    move-result p0

    .line 32
    if-eqz p0, :cond_2

    .line 33
    .line 34
    const-string p0, "INTL_TTC_ULTRA_FULLBOOST_INTRO_USA"

    .line 35
    .line 36
    return-object p0

    .line 37
    :cond_2
    const-string p0, "INTL_TTC_ULTRA_FULLBOOST_INTRO"

    .line 38
    .line 39
    return-object p0

    .line 40
    :cond_3
    const-string p0, "INTL_PREMIUM_COMPLIMENT_TEXT"

    .line 41
    .line 42
    return-object p0

    .line 43
    :cond_4
    const-string p0, "INTL_TTC_INSTANT_SALE_TEXT"

    .line 44
    .line 45
    return-object p0
.end method

.method public static c(ZZ)Ljava/lang/String;
    .locals 0

    .line 1
    if-eqz p0, :cond_1

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    const-string p0, "INTL_TTC_ULTRA_SUPERLIKE_TITLE_USA"

    .line 6
    .line 7
    return-object p0

    .line 8
    :cond_0
    const-string p0, "INTL_TTC_ULTRA_SUPERLIKE_TITLE"

    .line 9
    .line 10
    return-object p0

    .line 11
    :cond_1
    if-eqz p1, :cond_2

    .line 12
    .line 13
    const-string p0, "INTL_TTC_FULLSCREEN_VIP_PRIVILEGE_TITLE_2_USA"

    .line 14
    .line 15
    return-object p0

    .line 16
    :cond_2
    const-string p0, "INTL_TTC_FULLSCREEN_VIP_PRIVILEGE_TITLE_2"

    .line 17
    .line 18
    return-object p0
.end method

.method public static d(Lcom/p1/mobile/putong/core/data/Privilege;Lcom/p1/mobile/putong/core/data/PurchaseType;)Ljava/lang/String;
    .locals 3
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    invoke-static {p1}, Ll/wib0;->v(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-static {}, Lcom/p1/mobile/putong/ab/IntlCountryCodeController;->v()Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    sget-object v2, Ll/eep$a;->a:[I

    .line 10
    .line 11
    invoke-virtual {p0}, Ljava/lang/Enum;->ordinal()I

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    aget p0, v2, p0

    .line 16
    .line 17
    packed-switch p0, :pswitch_data_0

    .line 18
    .line 19
    .line 20
    const/4 p0, 0x0

    .line 21
    return-object p0

    .line 22
    :pswitch_0
    const-string p0, "INTL_SEARCH_MATCHES_GROUP_A"

    .line 23
    .line 24
    return-object p0

    .line 25
    :pswitch_1
    const-string p0, "INTL_TTC_FULLSCREEN_VIP_PRIVILEGE_TITLE_9"

    .line 26
    .line 27
    return-object p0

    .line 28
    :pswitch_2
    const-string p0, "INTL_TTC_FULLSCREEN_VIP_PRIVILEGE_TITLE_6"

    .line 29
    .line 30
    return-object p0

    .line 31
    :pswitch_3
    const-string p0, "INTL_TTC_FULLSCREEN_VIP_PRIVILEGE_TITLE_8"

    .line 32
    .line 33
    return-object p0

    .line 34
    :pswitch_4
    const-string p0, "INTL_TTC_FULLSCREEN_PREMIUM_PRIVILEGE_TITLE_8"

    .line 35
    .line 36
    return-object p0

    .line 37
    :pswitch_5
    const-string p0, "US_VIP_ALERT_DIGEST_LOCATION"

    .line 38
    .line 39
    return-object p0

    .line 40
    :pswitch_6
    const-string p0, "US_VIP_ALERT_DIGEST_UNDO"

    .line 41
    .line 42
    return-object p0

    .line 43
    :pswitch_7
    const-string p0, "INTL_TTC_FULLSCREEN_PREMIUM_SIGNAGE_BUZZ"

    .line 44
    .line 45
    return-object p0

    .line 46
    :pswitch_8
    const-string p0, "INTL_MEET_TRIBE_TAB"

    .line 47
    .line 48
    return-object p0

    .line 49
    :pswitch_9
    const-string p0, "INTL_PREMIUM_VISITORS_TITLE"

    .line 50
    .line 51
    return-object p0

    .line 52
    :pswitch_a
    const-string p0, "CORE_SVIP_PURCHASE_PRIVILEGE_ADVANCED_FILTER_TITLE"

    .line 53
    .line 54
    return-object p0

    .line 55
    :pswitch_b
    if-eqz v1, :cond_0

    .line 56
    .line 57
    const-string p0, "INTL_TTC_ULTRA_FULLBOOST_TITLE_USA"

    .line 58
    .line 59
    return-object p0

    .line 60
    :cond_0
    const-string p0, "INTL_TTC_ULTRA_FULLBOOST_TITLE"

    .line 61
    .line 62
    return-object p0

    .line 63
    :pswitch_c
    invoke-static {v0, v1}, Ll/eep;->a(ZZ)Ljava/lang/String;

    .line 64
    .line 65
    .line 66
    move-result-object p0

    .line 67
    return-object p0

    .line 68
    :pswitch_d
    const-string p0, "SEE_WHO_LIKED_ME_INTRO_TITLE"

    .line 69
    .line 70
    return-object p0

    .line 71
    :pswitch_e
    const-string p0, "INTL_PREMIUM_COMPLIMENT_TITLE"

    .line 72
    .line 73
    return-object p0

    .line 74
    :pswitch_f
    const-string p0, "INTL_ULTRA_INSTANTMATCH_TITLE"

    .line 75
    .line 76
    return-object p0

    .line 77
    :pswitch_10
    if-eqz v1, :cond_1

    .line 78
    .line 79
    const-string p0, "INTL_TTC_ULTRA_SUPERLIKE_TITLE_USA"

    .line 80
    .line 81
    return-object p0

    .line 82
    :cond_1
    const-string p0, "INTL_TTC_ULTRA_SUPERLIKE_TITLE"

    .line 83
    .line 84
    return-object p0

    .line 85
    :pswitch_11
    invoke-static {p1}, Ll/wib0;->q(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 86
    .line 87
    .line 88
    move-result p0

    .line 89
    if-eqz p0, :cond_3

    .line 90
    .line 91
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 92
    .line 93
    .line 94
    move-result-object p0

    .line 95
    invoke-virtual {p0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 96
    .line 97
    .line 98
    move-result-object p0

    .line 99
    invoke-interface {p0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->Oi()Z

    .line 100
    .line 101
    .line 102
    move-result p0

    .line 103
    if-eqz p0, :cond_3

    .line 104
    .line 105
    if-eqz v1, :cond_2

    .line 106
    .line 107
    const-string p0, "INTL_PREMIUM_PRIVILEGE_2SUPERLIKE_DAY_USA"

    .line 108
    .line 109
    return-object p0

    .line 110
    :cond_2
    const-string p0, "INTL_PREMIUM_PRIVILEGE_2SUPERLIKE_DAY"

    .line 111
    .line 112
    return-object p0

    .line 113
    :cond_3
    invoke-static {v0, v1}, Ll/eep;->c(ZZ)Ljava/lang/String;

    .line 114
    .line 115
    .line 116
    move-result-object p0

    .line 117
    return-object p0

    .line 118
    :pswitch_12
    const-string p0, "VIP_ALERT_DIGEST_LIKE_GROUP_A"

    .line 119
    .line 120
    return-object p0

    .line 121
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_12
        :pswitch_11
        :pswitch_10
        :pswitch_f
        :pswitch_e
        :pswitch_d
        :pswitch_c
        :pswitch_b
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
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public static e(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/Privilege;Lcom/p1/mobile/putong/core/data/PurchaseType;)Ljava/lang/String;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    sget-object p2, Lcom/p1/mobile/putong/core/data/Privilege;->premium_compliment:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 2
    .line 3
    if-ne p1, p2, :cond_0

    .line 4
    .line 5
    sget p1, Lcom/p1/mobile/putong/core/pay/R$string;->e3:I

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-static {}, Ll/joa;->s3()I

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    filled-new-array {p1}, [Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    invoke-static {p0, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    return-object p0

    .line 28
    :cond_0
    const/4 p0, 0x0

    .line 29
    return-object p0
.end method

.method public static f(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/PurchaseType;Lcom/p1/mobile/putong/core/data/Privilege;)Ll/eep$b;
    .locals 4

    .line 1
    invoke-static {p1, p2}, Ll/j690;->m(Lcom/p1/mobile/putong/core/data/PurchaseType;Lcom/p1/mobile/putong/core/data/Privilege;)Ll/a690;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget-object v1, Lcom/p1/mobile/putong/core/data/Privilege;->vip_super_like:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 6
    .line 7
    if-ne p2, v1, :cond_0

    .line 8
    .line 9
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-virtual {v1}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-interface {v1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->Oi()Z

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    if-nez v1, :cond_0

    .line 22
    .line 23
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 24
    .line 25
    sget v2, Lcom/p1/mobile/putong/core/pay/R$string;->b9:I

    .line 26
    .line 27
    const/4 v3, 0x5

    .line 28
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 29
    .line 30
    .line 31
    move-result-object v3

    .line 32
    filled-new-array {v3}, [Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    move-result-object v3

    .line 36
    invoke-virtual {v1, v2, v3}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    goto :goto_0

    .line 41
    :cond_0
    invoke-virtual {v0}, Ll/a690;->t()Ljava/lang/CharSequence;

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    invoke-interface {v1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object v1

    .line 49
    :goto_0
    invoke-virtual {v0}, Ll/a690;->q()Ljava/lang/CharSequence;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    invoke-interface {v0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    invoke-static {p0, p2, p1}, Ll/eep;->e(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/Privilege;Lcom/p1/mobile/putong/core/data/PurchaseType;)Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object v2

    .line 61
    invoke-static {p2, p1}, Ll/eep;->d(Lcom/p1/mobile/putong/core/data/Privilege;Lcom/p1/mobile/putong/core/data/PurchaseType;)Ljava/lang/String;

    .line 62
    .line 63
    .line 64
    move-result-object p1

    .line 65
    invoke-static {p2}, Ll/eep;->b(Lcom/p1/mobile/putong/core/data/Privilege;)Ljava/lang/String;

    .line 66
    .line 67
    .line 68
    move-result-object p2

    .line 69
    if-eqz v2, :cond_1

    .line 70
    .line 71
    move-object v1, v2

    .line 72
    goto :goto_1

    .line 73
    :cond_1
    if-eqz p1, :cond_2

    .line 74
    .line 75
    invoke-static {p0, p1}, Ll/eep;->g(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)Ljava/lang/String;

    .line 76
    .line 77
    .line 78
    move-result-object p1

    .line 79
    if-eqz p1, :cond_2

    .line 80
    .line 81
    move-object v1, p1

    .line 82
    :cond_2
    :goto_1
    if-eqz p2, :cond_3

    .line 83
    .line 84
    invoke-static {p0, p2}, Ll/eep;->g(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)Ljava/lang/String;

    .line 85
    .line 86
    .line 87
    move-result-object p0

    .line 88
    if-eqz p0, :cond_3

    .line 89
    .line 90
    move-object v0, p0

    .line 91
    :cond_3
    new-instance p0, Ll/eep$b;

    .line 92
    .line 93
    invoke-direct {p0, v1, v0}, Ll/eep$b;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 94
    .line 95
    .line 96
    return-object p0
.end method

.method public static g(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    invoke-virtual {p0}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "string"

    .line 6
    .line 7
    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v2

    .line 11
    invoke-virtual {v0, p1, v1, v2}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    if-nez p1, :cond_0

    .line 16
    .line 17
    const/4 p0, 0x0

    .line 18
    return-object p0

    .line 19
    :cond_0
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    return-object p0
.end method

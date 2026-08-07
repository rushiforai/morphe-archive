.class public final Ll/yj90;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public static a(Lcom/p1/mobile/putong/core/data/Privilege;)Ljava/lang/String;
    .locals 2

    .line 1
    const-string v0, ""

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    return-object v0

    .line 6
    :cond_0
    sget-object v1, Ll/yj90$a;->a:[I

    .line 7
    .line 8
    invoke-virtual {p0}, Ljava/lang/Enum;->ordinal()I

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    aget p0, v1, p0

    .line 13
    .line 14
    packed-switch p0, :pswitch_data_0

    .line 15
    .line 16
    .line 17
    return-object v0

    .line 18
    :pswitch_0
    const-string p0, "search"

    .line 19
    .line 20
    return-object p0

    .line 21
    :pswitch_1
    const-string p0, "badge"

    .line 22
    .line 23
    return-object p0

    .line 24
    :pswitch_2
    const-string p0, "hide_active"

    .line 25
    .line 26
    return-object p0

    .line 27
    :pswitch_3
    const-string p0, "ad-free"

    .line 28
    .line 29
    return-object p0

    .line 30
    :pswitch_4
    const-string p0, "receipts"

    .line 31
    .line 32
    return-object p0

    .line 33
    :pswitch_5
    const-string p0, "passport"

    .line 34
    .line 35
    return-object p0

    .line 36
    :pswitch_6
    const-string p0, "undo"

    .line 37
    .line 38
    return-object p0

    .line 39
    :pswitch_7
    const-string p0, "buzz"

    .line 40
    .line 41
    return-object p0

    .line 42
    :pswitch_8
    const-string p0, "tribe"

    .line 43
    .line 44
    return-object p0

    .line 45
    :pswitch_9
    const-string p0, "vistors"

    .line 46
    .line 47
    return-object p0

    .line 48
    :pswitch_a
    const-string p0, "boost"

    .line 49
    .line 50
    return-object p0

    .line 51
    :pswitch_b
    const-string p0, "advanced_showme"

    .line 52
    .line 53
    return-object p0

    .line 54
    :pswitch_c
    const-string p0, "compliment"

    .line 55
    .line 56
    return-object p0

    .line 57
    :pswitch_d
    const-string p0, "instant_match"

    .line 58
    .line 59
    return-object p0

    .line 60
    :pswitch_e
    const-string p0, "see"

    .line 61
    .line 62
    return-object p0

    .line 63
    :pswitch_f
    const-string p0, "superlike"

    .line 64
    .line 65
    return-object p0

    .line 66
    :pswitch_10
    const-string p0, "unlimited_likes"

    .line 67
    .line 68
    return-object p0

    .line 69
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_10
        :pswitch_f
        :pswitch_f
        :pswitch_e
        :pswitch_d
        :pswitch_c
        :pswitch_b
        :pswitch_b
        :pswitch_a
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
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public static b(Lcom/p1/mobile/putong/core/data/Privilege;Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/IntlVipNewUiFrag;)V
    .locals 1

    .line 1
    if-eqz p1, :cond_2

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    invoke-static {p0}, Ll/yj90;->a(Lcom/p1/mobile/putong/core/data/Privilege;)Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-eqz v0, :cond_1

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/IntlVipNewUiFrag;->pageId()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    const-string v0, "privilege_description"

    .line 26
    .line 27
    invoke-static {v0, p0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    filled-new-array {p0}, [Ll/pf60;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    const-string v0, "e_ttc_subcription_privilege_description"

    .line 36
    .line 37
    invoke-static {v0, p1, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 38
    .line 39
    .line 40
    :cond_2
    :goto_0
    return-void
.end method

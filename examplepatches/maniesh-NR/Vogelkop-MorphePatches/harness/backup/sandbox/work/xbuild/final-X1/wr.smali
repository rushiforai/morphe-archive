.class public final Lwr;
.super Lkuk;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function2;


# instance fields
.field public final synthetic t:B

.field public final synthetic u:Landroid/content/Context;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lmt5;)V
    .registers 4

    const/16 v0, 0xb

    iput-byte v0, p0, Lwr;->t:B

    sget-object v0, Ldap;->a:Ldap;

    iput-object p1, p0, Lwr;->u:Landroid/content/Context;

    const/4 p1, 0x2

    invoke-direct {p0, p1, p2}, Lkuk;-><init>(ILmt5;)V

    return-void
.end method

.method public synthetic constructor <init>(Landroid/content/Context;Lmt5;B)V
    .registers 4

    .line 13
    iput-byte p3, p0, Lwr;->t:B

    iput-object p1, p0, Lwr;->u:Landroid/content/Context;

    const/4 p1, 0x2

    invoke-direct {p0, p1, p2}, Lkuk;-><init>(ILmt5;)V

    return-void
.end method


# virtual methods
.method public final create(Ljava/lang/Object;Lmt5;)Lmt5;
    .registers 4

    iget-byte p1, p0, Lwr;->t:B

    iget-object p0, p0, Lwr;->u:Landroid/content/Context;

    packed-switch p1, :pswitch_data_68

    new-instance p1, Lwr;

    const/16 v0, 0xc

    invoke-direct {p1, p0, p2, v0}, Lwr;-><init>(Landroid/content/Context;Lmt5;B)V

    return-object p1

    :pswitch_f
    new-instance p1, Lwr;

    sget-object v0, Ldap;->a:Ldap;

    invoke-direct {p1, p0, p2}, Lwr;-><init>(Landroid/content/Context;Lmt5;)V

    return-object p1

    :pswitch_17
    new-instance p1, Lwr;

    const/16 v0, 0xa

    invoke-direct {p1, p0, p2, v0}, Lwr;-><init>(Landroid/content/Context;Lmt5;B)V

    return-object p1

    :pswitch_1f
    new-instance p1, Lwr;

    const/16 v0, 0x9

    invoke-direct {p1, p0, p2, v0}, Lwr;-><init>(Landroid/content/Context;Lmt5;B)V

    return-object p1

    :pswitch_27
    new-instance p1, Lwr;

    const/16 v0, 0x8

    invoke-direct {p1, p0, p2, v0}, Lwr;-><init>(Landroid/content/Context;Lmt5;B)V

    return-object p1

    :pswitch_2f
    new-instance p1, Lwr;

    const/4 v0, 0x7

    invoke-direct {p1, p0, p2, v0}, Lwr;-><init>(Landroid/content/Context;Lmt5;B)V

    return-object p1

    :pswitch_36
    new-instance p1, Lwr;

    const/4 v0, 0x6

    invoke-direct {p1, p0, p2, v0}, Lwr;-><init>(Landroid/content/Context;Lmt5;B)V

    return-object p1

    :pswitch_3d
    new-instance p1, Lwr;

    const/4 v0, 0x5

    invoke-direct {p1, p0, p2, v0}, Lwr;-><init>(Landroid/content/Context;Lmt5;B)V

    return-object p1

    :pswitch_44
    new-instance p1, Lwr;

    const/4 v0, 0x4

    invoke-direct {p1, p0, p2, v0}, Lwr;-><init>(Landroid/content/Context;Lmt5;B)V

    return-object p1

    :pswitch_4b
    new-instance p1, Lwr;

    const/4 v0, 0x3

    invoke-direct {p1, p0, p2, v0}, Lwr;-><init>(Landroid/content/Context;Lmt5;B)V

    return-object p1

    :pswitch_52
    new-instance p1, Lwr;

    const/4 v0, 0x2

    invoke-direct {p1, p0, p2, v0}, Lwr;-><init>(Landroid/content/Context;Lmt5;B)V

    return-object p1

    :pswitch_59
    new-instance p1, Lwr;

    const/4 v0, 0x1

    invoke-direct {p1, p0, p2, v0}, Lwr;-><init>(Landroid/content/Context;Lmt5;B)V

    return-object p1

    :pswitch_60
    new-instance p1, Lwr;

    const/4 v0, 0x0

    invoke-direct {p1, p0, p2, v0}, Lwr;-><init>(Landroid/content/Context;Lmt5;B)V

    return-object p1

    nop

    :pswitch_data_68
    .packed-switch 0x0
        :pswitch_60
        :pswitch_59
        :pswitch_52
        :pswitch_4b
        :pswitch_44
        :pswitch_3d
        :pswitch_36
        :pswitch_2f
        :pswitch_27
        :pswitch_1f
        :pswitch_17
        :pswitch_f
    .end packed-switch
.end method

.method public final invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 4

    iget-byte v0, p0, Lwr;->t:B

    packed-switch v0, :pswitch_data_e2

    check-cast p1, Lnx5;

    check-cast p2, Lmt5;

    invoke-virtual {p0, p1, p2}, Lwr;->create(Ljava/lang/Object;Lmt5;)Lmt5;

    move-result-object p0

    check-cast p0, Lwr;

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Lwr;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_16
    check-cast p1, Lnx5;

    check-cast p2, Lmt5;

    invoke-virtual {p0, p1, p2}, Lwr;->create(Ljava/lang/Object;Lmt5;)Lmt5;

    move-result-object p0

    check-cast p0, Lwr;

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Lwr;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_27
    check-cast p1, Lnx5;

    check-cast p2, Lmt5;

    invoke-virtual {p0, p1, p2}, Lwr;->create(Ljava/lang/Object;Lmt5;)Lmt5;

    move-result-object p0

    check-cast p0, Lwr;

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Lwr;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_38
    check-cast p1, Lnx5;

    check-cast p2, Lmt5;

    invoke-virtual {p0, p1, p2}, Lwr;->create(Ljava/lang/Object;Lmt5;)Lmt5;

    move-result-object p0

    check-cast p0, Lwr;

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Lwr;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_49
    check-cast p1, Lnx5;

    check-cast p2, Lmt5;

    invoke-virtual {p0, p1, p2}, Lwr;->create(Ljava/lang/Object;Lmt5;)Lmt5;

    move-result-object p0

    check-cast p0, Lwr;

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Lwr;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_5a
    check-cast p1, Lnx5;

    check-cast p2, Lmt5;

    invoke-virtual {p0, p1, p2}, Lwr;->create(Ljava/lang/Object;Lmt5;)Lmt5;

    move-result-object p0

    check-cast p0, Lwr;

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Lwr;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_6b
    check-cast p1, Lnx5;

    check-cast p2, Lmt5;

    invoke-virtual {p0, p1, p2}, Lwr;->create(Ljava/lang/Object;Lmt5;)Lmt5;

    move-result-object p0

    check-cast p0, Lwr;

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Lwr;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_7c
    check-cast p1, Lnx5;

    check-cast p2, Lmt5;

    invoke-virtual {p0, p1, p2}, Lwr;->create(Ljava/lang/Object;Lmt5;)Lmt5;

    move-result-object p0

    check-cast p0, Lwr;

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Lwr;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_8d
    check-cast p1, Lnx5;

    check-cast p2, Lmt5;

    invoke-virtual {p0, p1, p2}, Lwr;->create(Ljava/lang/Object;Lmt5;)Lmt5;

    move-result-object p0

    check-cast p0, Lwr;

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Lwr;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_9e
    check-cast p1, Lnx5;

    check-cast p2, Lmt5;

    invoke-virtual {p0, p1, p2}, Lwr;->create(Ljava/lang/Object;Lmt5;)Lmt5;

    move-result-object p0

    check-cast p0, Lwr;

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Lwr;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_af
    check-cast p1, Lnx5;

    check-cast p2, Lmt5;

    invoke-virtual {p0, p1, p2}, Lwr;->create(Ljava/lang/Object;Lmt5;)Lmt5;

    move-result-object p0

    check-cast p0, Lwr;

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Lwr;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_c0
    check-cast p1, Lnx5;

    check-cast p2, Lmt5;

    invoke-virtual {p0, p1, p2}, Lwr;->create(Ljava/lang/Object;Lmt5;)Lmt5;

    move-result-object p0

    check-cast p0, Lwr;

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Lwr;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_d1
    check-cast p1, Lnx5;

    check-cast p2, Lmt5;

    invoke-virtual {p0, p1, p2}, Lwr;->create(Ljava/lang/Object;Lmt5;)Lmt5;

    move-result-object p0

    check-cast p0, Lwr;

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Lwr;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_data_e2
    .packed-switch 0x0
        :pswitch_d1
        :pswitch_c0
        :pswitch_af
        :pswitch_9e
        :pswitch_8d
        :pswitch_7c
        :pswitch_6b
        :pswitch_5a
        :pswitch_49
        :pswitch_38
        :pswitch_27
        :pswitch_16
    .end packed-switch
.end method

.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 12

    iget-byte v0, p0, Lwr;->t:B

    const/4 v1, 0x2

    const/4 v2, 0x0

    const/4 v3, 0x1

    const/4 v4, 0x0

    packed-switch v0, :pswitch_data_2f2

    sget-object v0, Lpx5;->a:Lpx5;

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    iget-object v0, p0, Lwr;->u:Landroid/content/Context;

    invoke-static {v0}, Luip;->c(Landroid/content/Context;)Lkotlin/Pair;

    move-result-object p0

    iget-object p1, p0, Lkotlin/Pair;->a:Ljava/lang/Object;

    move-object v1, p1

    check-cast v1, Ljava/lang/String;

    iget-object p0, p0, Lkotlin/Pair;->b:Ljava/lang/Object;

    check-cast p0, Ljava/lang/Boolean;

    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    sget-object p0, Luip;->a:Lbxk;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v1}, Luip;->b(Ljava/lang/String;)Z

    iget-object p0, p0, Lbxk;->b:Ljava/lang/Object;

    move-object v3, p0

    check-cast v3, Ljava/util/concurrent/atomic/AtomicReference;

    :cond_2e
    invoke-virtual {v3, v4, v1}, Ljava/util/concurrent/atomic/AtomicReference;->compareAndSet(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_49

    if-eqz v2, :cond_4f

    sget-object p0, Lr8p;->a:Ljava/util/List;

    invoke-static {v0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    const-string p1, "opera.ads.sdk.user_id"

    invoke-interface {p0, p1, v1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    goto :goto_4f

    :cond_49
    invoke-virtual {v3}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object p0

    if-eqz p0, :cond_2e

    :cond_4f
    :goto_4f
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_52
    sget-object v0, Lpx5;->a:Lpx5;

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    sget-object p1, Ldap;->a:Ldap;

    iget-object p0, p0, Lwr;->u:Landroid/content/Context;

    monitor-enter p1

    :try_start_5c
    sget-object v0, Ldap;->c:Lt9f;

    if-nez v0, :cond_66

    invoke-static {p0}, Ldap;->a(Landroid/content/Context;)Lt9f;

    move-result-object p0

    sput-object p0, Ldap;->c:Lt9f;

    :cond_66
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;
    :try_end_68
    .catchall {:try_start_5c .. :try_end_68} :catchall_6a

    monitor-exit p1

    return-object p0

    :catchall_6a
    move-exception p0

    monitor-exit p1

    throw p0

    :pswitch_6d
    sget-object v0, Lpx5;->a:Lpx5;

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    sget-object p1, Ld1p;->a:Lt5p;

    iget-object p0, p0, Lwr;->u:Landroid/content/Context;

    invoke-static {p0}, Ld1p;->d(Landroid/content/Context;)Lt5p;

    move-result-object p0

    invoke-static {p0}, Ld1p;->c(Lt5p;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_80
    const-string v0, "phone"

    sget-object v2, Lpx5;->a:Lpx5;

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    new-instance p1, Lj7m;

    sget-object v2, Lfap;->a:Lzyk;

    iget-object v2, p0, Lwr;->u:Landroid/content/Context;

    const-string v3, ""

    :try_start_8f
    sget-object v5, Lr8p;->a:Ljava/util/List;

    invoke-virtual {v2, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/telephony/TelephonyManager;

    invoke-virtual {v5}, Landroid/telephony/TelephonyManager;->getSimCountryIso()Ljava/lang/String;

    move-result-object v5

    if-eqz v5, :cond_a3

    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v6
    :try_end_a1
    .catch Ljava/lang/Exception; {:try_start_8f .. :try_end_a1} :catch_a3

    if-eq v6, v1, :cond_a4

    :catch_a3
    :cond_a3
    move-object v5, v4

    :cond_a4
    if-nez v5, :cond_d0

    :try_start_a6
    sget-object v5, Lr8p;->a:Ljava/util/List;

    invoke-virtual {v2, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/telephony/TelephonyManager;

    invoke-virtual {v2}, Landroid/telephony/TelephonyManager;->getNetworkCountryIso()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_bc

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v5
    :try_end_b8
    .catch Ljava/lang/Exception; {:try_start_a6 .. :try_end_b8} :catch_bc

    if-ne v5, v1, :cond_bc

    move-object v5, v2

    goto :goto_bd

    :catch_bc
    :cond_bc
    move-object v5, v4

    :goto_bd
    if-nez v5, :cond_d0

    :try_start_bf
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/Locale;->getCountry()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v5
    :try_end_cb
    .catch Ljava/lang/Exception; {:try_start_bf .. :try_end_cb} :catch_cf

    if-ne v5, v1, :cond_cf

    move-object v5, v2

    goto :goto_d0

    :catch_cf
    :cond_cf
    move-object v5, v4

    :cond_d0
    :goto_d0
    if-eqz v5, :cond_e1

    :try_start_d2
    new-instance v1, Ljava/util/Locale;

    invoke-direct {v1, v3, v5}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/util/Locale;->getISO3Country()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v2
    :try_end_df
    .catch Ljava/lang/Exception; {:try_start_d2 .. :try_end_df} :catch_e1

    if-gtz v2, :cond_e2

    :catch_e1
    :cond_e1
    move-object v1, v4

    :cond_e2
    if-eqz v1, :cond_e5

    move-object v3, v1

    :cond_e5
    sput-object v3, Lfap;->d:Ljava/lang/String;

    iget-object v1, p0, Lwr;->u:Landroid/content/Context;

    :try_start_e9
    sget-object v2, Lr8p;->a:Ljava/util/List;

    invoke-virtual {v1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/telephony/TelephonyManager;

    invoke-virtual {v1}, Landroid/telephony/TelephonyManager;->getSimOperatorName()Ljava/lang/String;

    move-result-object v2

    if-nez v2, :cond_fd

    invoke-virtual {v1}, Landroid/telephony/TelephonyManager;->getNetworkOperatorName()Ljava/lang/String;

    move-result-object v2
    :try_end_fb
    .catch Ljava/lang/Exception; {:try_start_e9 .. :try_end_fb} :catch_fc

    goto :goto_fd

    :catch_fc
    move-object v2, v4

    :cond_fd
    :goto_fd
    iget-object p0, p0, Lwr;->u:Landroid/content/Context;

    :try_start_ff
    sget-object v1, Lr8p;->a:Ljava/util/List;

    invoke-virtual {p0, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/telephony/TelephonyManager;

    sget-object v0, Lfap;->a:Lzyk;

    invoke-virtual {p0}, Landroid/telephony/TelephonyManager;->getSimOperator()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lfap;->b(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_11c

    invoke-virtual {p0}, Landroid/telephony/TelephonyManager;->getNetworkOperator()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lfap;->b(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4
    :try_end_11b
    .catch Ljava/lang/Exception; {:try_start_ff .. :try_end_11b} :catch_11d

    goto :goto_11d

    :cond_11c
    move-object v4, v0

    :catch_11d
    :goto_11d
    invoke-direct {p1, v3, v2, v4}, Lj7m;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    return-object p1

    :pswitch_121
    sget-object v0, Lpx5;->a:Lpx5;

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    invoke-static {}, Laap;->f()Lz8p;

    move-result-object p1

    iget-boolean p1, p1, Lz8p;->A:Z

    if-eqz p1, :cond_14a

    sget-object p1, Lfap;->a:Lzyk;

    iget-object p0, p0, Lwr;->u:Landroid/content/Context;

    const-string p1, "android.permission.ACCESS_FINE_LOCATION"

    :try_start_134
    invoke-static {p0, p1}, Lnb6;->h(Landroid/content/Context;Ljava/lang/String;)I

    move-result p1
    :try_end_138
    .catch Ljava/lang/Exception; {:try_start_134 .. :try_end_138} :catch_13a

    if-eqz p1, :cond_142

    :catch_13a
    const-string p1, "android.permission.ACCESS_COARSE_LOCATION"

    :try_start_13c
    invoke-static {p0, p1}, Lnb6;->h(Landroid/content/Context;Ljava/lang/String;)I

    move-result p0
    :try_end_140
    .catch Ljava/lang/Exception; {:try_start_13c .. :try_end_140} :catch_144

    if-nez p0, :cond_144

    :cond_142
    move p0, v3

    goto :goto_145

    :catch_144
    :cond_144
    move p0, v2

    :goto_145
    sput-boolean p0, Lfap;->c:Z

    if-eqz p0, :cond_14a

    move v2, v3

    :cond_14a
    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0

    :pswitch_14f
    sget-object v0, Lpx5;->a:Lpx5;

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    sget-object p1, Lfap;->a:Lzyk;

    iget-object p0, p0, Lwr;->u:Landroid/content/Context;

    :try_start_158
    const-string p1, "location"

    invoke-virtual {p0, p1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/location/LocationManager;

    invoke-static {p0}, Lfap;->a(Landroid/location/LocationManager;)Landroid/location/Location;

    move-result-object p0

    if-eqz p0, :cond_188

    new-instance p1, Landroid/location/Location;

    invoke-direct {p1, p0}, Landroid/location/Location;-><init>(Landroid/location/Location;)V

    invoke-virtual {p0}, Landroid/location/Location;->getLatitude()D

    move-result-wide v0

    const-wide/high16 v2, 0x4024000000000000L    # 10.0

    mul-double/2addr v0, v2

    invoke-static {v0, v1}, Ljava/lang/Math;->rint(D)D

    move-result-wide v0

    div-double/2addr v0, v2

    invoke-virtual {p1, v0, v1}, Landroid/location/Location;->setLatitude(D)V

    invoke-virtual {p0}, Landroid/location/Location;->getLongitude()D

    move-result-wide v0

    mul-double/2addr v0, v2

    invoke-static {v0, v1}, Ljava/lang/Math;->rint(D)D

    move-result-wide v0

    div-double/2addr v0, v2

    invoke-virtual {p1, v0, v1}, Landroid/location/Location;->setLongitude(D)V
    :try_end_187
    .catch Ljava/lang/Exception; {:try_start_158 .. :try_end_187} :catch_188

    move-object v4, p1

    :catch_188
    :cond_188
    return-object v4

    :pswitch_189
    sget-object v0, Lpx5;->a:Lpx5;

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    sget-object p1, Lfap;->a:Lzyk;

    iget-object p0, p0, Lwr;->u:Landroid/content/Context;

    :try_start_192
    invoke-static {}, Lcom/google/android/gms/common/GoogleApiAvailabilityLight;->getInstance()Lcom/google/android/gms/common/GoogleApiAvailabilityLight;

    move-result-object p1

    invoke-virtual {p1, p0}, Lcom/google/android/gms/common/GoogleApiAvailabilityLight;->isGooglePlayServicesAvailable(Landroid/content/Context;)I

    move-result p0
    :try_end_19a
    .catch Ljava/lang/Exception; {:try_start_192 .. :try_end_19a} :catch_19d

    if-nez p0, :cond_19d

    move v2, v3

    :catch_19d
    :cond_19d
    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0

    :pswitch_1a2
    sget-object v0, Lpx5;->a:Lpx5;

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    sget-object p1, Ld1p;->a:Lt5p;

    iget-object p0, p0, Lwr;->u:Landroid/content/Context;

    invoke-static {p0}, Ld1p;->d(Landroid/content/Context;)Lt5p;

    move-result-object p0

    return-object p0

    :pswitch_1b0
    sget-object v0, Lpx5;->a:Lpx5;

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    sget-object p1, Lyro;->a:Ljava/lang/String;

    iget-object p0, p0, Lwr;->u:Landroid/content/Context;

    :try_start_1b9
    sget-object p1, Lt0i;->b:Lp0i;

    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object p1

    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0, v2}, Landroid/content/pm/PackageManager;->getApplicationInfo(Ljava/lang/String;I)Landroid/content/pm/ApplicationInfo;

    move-result-object p1

    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/pm/PackageManager;->getApplicationIcon(Landroid/content/pm/ApplicationInfo;)Landroid/graphics/drawable/Drawable;

    move-result-object p1

    const/high16 v0, 0x42400000    # 48.0f

    invoke-static {p0, v0}, Lnxg;->d(Landroid/content/Context;F)I

    move-result v0

    sget-object v5, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {v0, v0, v5}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v5

    invoke-virtual {p1, v2, v2, v0, v0}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    new-instance v2, Landroid/graphics/Canvas;

    invoke-direct {v2, v5}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    invoke-virtual {p1, v2}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    sget-object p1, Lyro;->d:Ljava/util/List;

    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    move-object v2, v4

    :cond_1ed
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_22f

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/Number;

    invoke-virtual {v6}, Ljava/lang/Number;->intValue()I

    move-result v6

    int-to-float v7, v6

    invoke-static {p0, v7}, Lnxg;->d(Landroid/content/Context;F)I

    move-result v7

    shl-int/lit8 v6, v6, 0x2

    invoke-static {v7, v6}, Ljava/lang/Math;->min(II)I

    move-result v6

    if-lt v6, v0, :cond_20c

    move-object v6, v5

    goto :goto_210

    :cond_20c
    invoke-static {v5, v6, v6, v3}, Landroid/graphics/Bitmap;->createScaledBitmap(Landroid/graphics/Bitmap;IIZ)Landroid/graphics/Bitmap;

    move-result-object v6

    :goto_210
    new-instance v7, Ljava/io/ByteArrayOutputStream;

    const/16 v8, 0x4000

    invoke-direct {v7, v8}, Ljava/io/ByteArrayOutputStream;-><init>(I)V

    sget-object v8, Landroid/graphics/Bitmap$CompressFormat;->PNG:Landroid/graphics/Bitmap$CompressFormat;

    const/16 v9, 0x64

    invoke-virtual {v6, v8, v9, v7}, Landroid/graphics/Bitmap;->compress(Landroid/graphics/Bitmap$CompressFormat;ILjava/io/OutputStream;)Z

    move-result v8

    if-eq v6, v5, :cond_224

    invoke-virtual {v6}, Landroid/graphics/Bitmap;->recycle()V

    :cond_224
    if-eqz v8, :cond_1ed

    invoke-virtual {v7}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v2

    array-length v6, v2

    const/16 v7, 0x5000

    if-gt v6, v7, :cond_1ed

    :cond_22f
    invoke-virtual {v5}, Landroid/graphics/Bitmap;->recycle()V

    if-eqz v2, :cond_24a

    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    const-string p1, "data:image/png;base64,"

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {v2, v1}, Landroid/util/Base64;->encodeToString([BI)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0
    :try_end_249
    .catchall {:try_start_1b9 .. :try_end_249} :catchall_24c

    goto :goto_255

    :cond_24a
    move-object p0, v4

    goto :goto_255

    :catchall_24c
    move-exception p0

    sget-object p1, Lt0i;->b:Lp0i;

    new-instance p1, Lq0i;

    invoke-direct {p1, p0}, Lq0i;-><init>(Ljava/lang/Throwable;)V

    move-object p0, p1

    :goto_255
    sget-object p1, Lt0i;->b:Lp0i;

    instance-of p1, p0, Lq0i;

    if-nez p1, :cond_25c

    move-object v4, p0

    :cond_25c
    check-cast v4, Ljava/lang/String;

    sput-object v4, Lyro;->c:Ljava/lang/String;

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_263
    sget-object v0, Lpx5;->a:Lpx5;

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    sget-object p1, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    iget-object p0, p0, Lwr;->u:Landroid/content/Context;

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    check-cast p0, Lcom/opera/android/OperaApplication;

    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->e()Lj4c;

    move-result-object p0

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lyk6;

    iget-object p0, p0, Lyk6;->i:Lkze;

    invoke-virtual {p0}, Lekc;->g()Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_283
    sget-object v0, Lpx5;->a:Lpx5;

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    sget-object p1, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    iget-object p0, p0, Lwr;->u:Landroid/content/Context;

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    check-cast p0, Lcom/opera/android/OperaApplication;

    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->e()Lj4c;

    move-result-object p0

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lyk6;

    iget-object p0, p0, Lyk6;->j:Lkze;

    invoke-virtual {p0}, Lekc;->g()Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_2a3
    sget-object v0, Lpx5;->a:Lpx5;

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    sget-object p1, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    iget-object p0, p0, Lwr;->u:Landroid/content/Context;

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    check-cast p0, Lcom/opera/android/OperaApplication;

    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->e()Lj4c;

    move-result-object p0

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lyk6;

    iget-object p0, p0, Lyk6;->i:Lkze;

    invoke-virtual {p0}, Lekc;->g()Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_2c3
    sget-object v0, Lpx5;->a:Lpx5;

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    sget p1, Leif;->a:I

    iget-object p0, p0, Lwr;->u:Landroid/content/Context;

    invoke-static {p0}, Lkfo;->e0(Landroid/content/Context;)Z

    move-result p1

    if-eqz p1, :cond_2ed

    sget-object p1, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    check-cast p0, Lcom/opera/android/OperaApplication;

    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->e()Lj4c;

    move-result-object p0

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lyk6;

    iget-object p0, p0, Lyk6;->h:Lwjh;

    invoke-virtual {p0}, Lwjh;->n()Z

    move-result p0

    if-eqz p0, :cond_2ed

    move v2, v3

    :cond_2ed
    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0

    :pswitch_data_2f2
    .packed-switch 0x0
        :pswitch_2c3
        :pswitch_2a3
        :pswitch_283
        :pswitch_263
        :pswitch_1b0
        :pswitch_1a2
        :pswitch_189
        :pswitch_14f
        :pswitch_121
        :pswitch_80
        :pswitch_6d
        :pswitch_52
    .end packed-switch
.end method

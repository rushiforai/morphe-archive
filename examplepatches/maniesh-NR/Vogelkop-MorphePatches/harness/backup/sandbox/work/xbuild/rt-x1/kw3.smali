.class public final synthetic Lkw3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lesk;


# instance fields
.field public final synthetic a:B


# direct methods
.method public synthetic constructor <init>(B)V
    .registers 2

    iput-byte p1, p0, Lkw3;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;B)V
    .registers 3

    .line 6
    iput-byte p2, p0, Lkw3;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final get()Ljava/lang/Object;
    .registers 5

    iget-byte p0, p0, Lkw3;->a:B

    const/4 v0, 0x0

    const/4 v1, 0x0

    packed-switch p0, :pswitch_data_fc

    return-object v1

    :pswitch_8
    invoke-static {}, Lipk;->S()Ljava/util/Date;

    move-result-object p0

    invoke-virtual {p0}, Ljava/util/Date;->getTime()J

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p0

    return-object p0

    :pswitch_15
    invoke-static {}, Lipk;->S()Ljava/util/Date;

    move-result-object p0

    return-object p0

    :pswitch_1a
    new-instance p0, Ljava/util/Date;

    invoke-direct {p0}, Ljava/util/Date;-><init>()V

    return-object p0

    :pswitch_20
    invoke-static {}, Lh1a;->c()Lh1a;

    move-result-object p0

    return-object p0

    :pswitch_25
    const-string p0, ""

    return-object p0

    :pswitch_28
    return-object v1

    :pswitch_29
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object p0

    invoke-virtual {p0}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    move-result-object p0

    return-object p0

    :pswitch_32
    sget-object p0, Lcom/opera/android/browser/chromium/OperaBrowserContext;->b:Lj4c;

    sget-object p0, Lt8;->a:Landroid/content/Context;

    invoke-static {p0}, Lru9;->c(Landroid/content/Context;)Lru9;

    move-result-object p0

    iget-object v1, p0, Lru9;->a:Landroid/content/SharedPreferences;

    const-string v2, "discard_session_cookies_at_startup"

    invoke-interface {v1, v2, v0}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    invoke-virtual {p0}, Lru9;->b()Lnv6;

    move-result-object p0

    iget-object v3, p0, Lnv6;->a:Ljava/lang/Object;

    check-cast v3, Landroid/content/SharedPreferences$Editor;

    invoke-interface {v3, v2, v0}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    invoke-virtual {p0}, Lnv6;->w()V

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0

    :pswitch_55
    sget-object p0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    new-instance p0, Las2;

    invoke-direct {p0}, Las2;-><init>()V

    return-object p0

    :pswitch_5d
    invoke-static {}, Ldgh;->h()Landroid/net/Uri;

    move-result-object p0

    invoke-virtual {p0}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    move-result-object p0

    const-string v0, "account/v2/external"

    invoke-virtual {p0, v0}, Landroid/net/Uri$Builder;->appendEncodedPath(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object p0

    invoke-virtual {p0}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object p0

    return-object p0

    :pswitch_70
    return-object v1

    :pswitch_71
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    return-object p0

    :pswitch_74
    invoke-static {}, Lsfh;->d()Lsfh;

    move-result-object p0

    return-object p0

    :pswitch_79
    sget-object p0, Lcqp;->m:Landroid/content/Context;

    :try_start_7b
    invoke-static {p0}, Lcqp;->h0(Landroid/content/Context;)Lpne;

    move-result-object p0
    :try_end_7f
    .catch Ljava/lang/InterruptedException; {:try_start_7b .. :try_end_7f} :catch_82

    iget-object v1, p0, Lpne;->a:Ljava/lang/String;

    goto :goto_86

    :catch_82
    move-exception p0

    invoke-static {p0}, Lrqd;->p(Ljava/lang/Throwable;)V

    :goto_86
    return-object v1

    :pswitch_87
    sget-object p0, Lcqp;->m:Landroid/content/Context;

    invoke-static {p0}, Lcqp;->f0(Landroid/content/Context;)Lpne;

    move-result-object p0

    iget-object p0, p0, Lpne;->a:Ljava/lang/String;

    return-object p0

    :pswitch_90
    invoke-static {}, Lcqp;->i0()Ljava/lang/String;

    move-result-object p0

    return-object p0

    :pswitch_95
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object p0

    return-object p0

    :pswitch_9a
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object p0

    return-object p0

    :pswitch_9f
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    return-object p0

    :pswitch_a4
    sget-object p0, Ls9g;->h:Ls9g;

    return-object p0

    :pswitch_a7
    sget-object p0, Lo36;->a:[I

    :try_start_a9
    const-string p0, "AES"

    invoke-static {p0}, Ljavax/crypto/KeyGenerator;->getInstance(Ljava/lang/String;)Ljavax/crypto/KeyGenerator;

    move-result-object p0

    sget-object v2, Lo36;->a:[I

    :goto_b1
    const/4 v3, 0x3

    if-ge v0, v3, :cond_c5

    aget v3, v2, v0
    :try_end_b6
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_a9 .. :try_end_b6} :catch_c5

    :try_start_b6
    invoke-virtual {p0, v3}, Ljavax/crypto/KeyGenerator;->init(I)V

    invoke-virtual {p0}, Ljavax/crypto/KeyGenerator;->generateKey()Ljavax/crypto/SecretKey;

    move-result-object v3

    invoke-interface {v3}, Ljava/security/Key;->getEncoded()[B

    move-result-object v1
    :try_end_c1
    .catch Ljava/security/InvalidParameterException; {:try_start_b6 .. :try_end_c1} :catch_c2
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_b6 .. :try_end_c1} :catch_c5

    goto :goto_c5

    :catch_c2
    add-int/lit8 v0, v0, 0x1

    goto :goto_b1

    :catch_c5
    :cond_c5
    :goto_c5
    return-object v1

    :pswitch_c6
    new-instance p0, Ljava/io/File;

    sget-object v0, Lsnf;->e:Ljava/lang/String;

    invoke-direct {p0, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    return-object p0

    :pswitch_ce
    sget-object p0, Ls9g;->h:Ls9g;

    return-object p0

    :pswitch_d1
    sget p0, Lcom/opera/android/vpn/quick_settings_tile/VpnProQuickSettingsTileService;->b:I

    sget p0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x21

    if-lt p0, v1, :cond_da

    const/4 v0, 0x1

    :cond_da
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0

    :pswitch_df
    sget-object p0, Lcom/opera/android/browser/chromium/OperaBrowserContext;->b:Lj4c;

    invoke-static {}, LJ/N;->MDAibNnc()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    return-object p0

    :pswitch_e8
    new-instance p0, Lyqa;

    const/16 v0, 0x15

    invoke-direct {p0, v0}, Lyqa;-><init>(B)V

    return-object p0

    :pswitch_f0
    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    return-object p0

    :pswitch_f3
    invoke-static {}, Li0l;->g()Z

    move-result p0

    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0

    :pswitch_data_fc
    .packed-switch 0x0
        :pswitch_f3
        :pswitch_f0
        :pswitch_e8
        :pswitch_df
        :pswitch_d1
        :pswitch_ce
        :pswitch_c6
        :pswitch_a7
        :pswitch_a4
        :pswitch_9f
        :pswitch_9a
        :pswitch_95
        :pswitch_90
        :pswitch_87
        :pswitch_79
        :pswitch_74
        :pswitch_f0
        :pswitch_71
        :pswitch_70
        :pswitch_5d
        :pswitch_55
        :pswitch_32
        :pswitch_29
        :pswitch_28
        :pswitch_25
        :pswitch_20
        :pswitch_1a
        :pswitch_15
        :pswitch_8
    .end packed-switch
.end method

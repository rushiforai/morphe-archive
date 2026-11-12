.class public final Lgxd;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Landroid/content/Context;

.field public final b:Lb59;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lumi;)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    iput-object v0, p0, Lgxd;->a:Landroid/content/Context;

    const/4 v0, 0x0

    new-array v0, v0, [Lbg1;

    const-string v1, "meta_install_referrer"

    invoke-static {p1, p2, v1, v0}, Lw1h;->l(Landroid/content/Context;Ltcl;Ljava/lang/String;[Lbg1;)Lb59;

    move-result-object p1

    iput-object p1, p0, Lgxd;->b:Lb59;

    return-void
.end method

.method public static b(Landroid/content/Context;Ljava/lang/String;)Landroid/content/pm/ProviderInfo;
    .registers 4

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x21

    if-lt v0, v1, :cond_b

    invoke-static {p0, p1}, Lt8;->S(Landroid/content/Context;Ljava/lang/String;)Landroid/content/pm/ProviderInfo;

    move-result-object p0

    return-object p0

    :cond_b
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object p0

    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Landroid/content/pm/PackageManager;->resolveContentProvider(Ljava/lang/String;I)Landroid/content/pm/ProviderInfo;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public final a(JLjava/lang/String;Ljava/lang/String;)Lfxd;
    .registers 14

    const-string v0, "adgroup_name"

    const-string v1, "campaign_name"

    const-string v2, "campaign_group_name"

    :try_start_6
    new-instance v3, Lorg/json/JSONObject;

    invoke-direct {v3, p3}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    const-string p3, "source"

    new-instance v4, Lorb;

    invoke-virtual {v3, p3}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p3

    invoke-direct {v4, p3}, Lorb;-><init>(Lorg/json/JSONObject;)V

    const-string p3, "data"

    invoke-virtual {v4, p3}, Lorb;->e(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p3

    const-string v3, "nonce"

    invoke-virtual {v4, v3}, Lorb;->e(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_bd

    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_bd

    invoke-static {p3}, Lnb6;->C(Ljava/lang/String;)[B

    move-result-object p3

    invoke-static {p4}, Lnb6;->C(Ljava/lang/String;)[B

    move-result-object p4

    invoke-static {v3}, Lnb6;->C(Ljava/lang/String;)[B

    move-result-object v3
    :try_end_3a
    .catch Lorg/json/JSONException; {:try_start_6 .. :try_end_3a} :catch_c0

    :try_start_3a
    const-string v4, "AES/GCM/NoPadding"

    invoke-static {v4}, Ljavax/crypto/Cipher;->getInstance(Ljava/lang/String;)Ljavax/crypto/Cipher;

    move-result-object v4

    new-instance v5, Ljavax/crypto/spec/SecretKeySpec;

    const-string v6, "AES"

    invoke-direct {v5, p4, v6}, Ljavax/crypto/spec/SecretKeySpec;-><init>([BLjava/lang/String;)V

    new-instance p4, Ljavax/crypto/spec/IvParameterSpec;

    invoke-direct {p4, v3}, Ljavax/crypto/spec/IvParameterSpec;-><init>([B)V

    const/4 v3, 0x2

    invoke-virtual {v4, v3, v5, p4}, Ljavax/crypto/Cipher;->init(ILjava/security/Key;Ljava/security/spec/AlgorithmParameterSpec;)V

    invoke-virtual {v4, p3}, Ljavax/crypto/Cipher;->doFinal([B)[B

    move-result-object p3

    new-instance p4, Ljava/lang/String;

    invoke-direct {p4, p3}, Ljava/lang/String;-><init>([B)V
    :try_end_59
    .catch Ljava/lang/Exception; {:try_start_3a .. :try_end_59} :catch_5a

    goto :goto_5b

    :catch_5a
    const/4 p4, 0x0

    :goto_5b
    :try_start_5b
    invoke-static {p4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p3

    if-eqz p3, :cond_64

    sget-object p0, Lfxd;->h:Lfxd;

    return-object p0

    :cond_64
    new-instance p3, Lorb;

    invoke-direct {p3, p4}, Lorb;-><init>(Ljava/lang/String;)V

    invoke-virtual {p3, v2}, Lorb;->e(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p3, v1}, Lorb;->e(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p3, v0}, Lorb;->e(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p3

    if-eqz p3, :cond_8a

    invoke-static {v6}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p3

    if-eqz p3, :cond_8a

    invoke-static {v7}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p3

    if-eqz p3, :cond_8a

    sget-object p0, Lfxd;->h:Lfxd;

    return-object p0

    :cond_8a
    iget-object p0, p0, Lgxd;->b:Lb59;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/content/SharedPreferences;

    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    const-string p3, "media_source"

    const-string p4, "Facebook Ads"

    invoke-interface {p0, p3, p4}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    invoke-interface {p0, v2, v5}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    invoke-interface {p0, v1, v6}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    invoke-interface {p0, v0, v7}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    const-string p3, "actual_timestamp"

    invoke-interface {p0, p3, p1, p2}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V

    new-instance v3, Lfxd;

    const-string v4, "Facebook Ads"

    sget-object v8, Lei0;->f:Lei0;

    invoke-direct/range {v3 .. v8}, Lfxd;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lei0;)V

    return-object v3

    :cond_bd
    sget-object p0, Lfxd;->h:Lfxd;
    :try_end_bf
    .catch Lorg/json/JSONException; {:try_start_5b .. :try_end_bf} :catch_c0

    return-object p0

    :catch_c0
    sget-object p0, Lfxd;->h:Lfxd;

    return-object p0
.end method

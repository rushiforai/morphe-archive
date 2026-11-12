.class public final Ltmj;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lorg/chromium/support_lib_boundary/SpeculativeLoadingConfigBoundaryInterface;
.implements Lp9f;
.implements Lozl;
.implements Lt55;
.implements Lfoa;
.implements Lkotlin/coroutines/g;
.implements Lcfp;
.implements Loqp;
.implements Lhqp;


# instance fields
.field public final synthetic a:B


# direct methods
.method public synthetic constructor <init>(B)V
    .registers 2

    iput-byte p1, p0, Ltmj;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static c(I)Lads_mobile_sdk/ak2;
    .registers 2

    if-eqz p0, :cond_11

    const/4 v0, 0x1

    if-eq p0, v0, :cond_e

    const/4 v0, 0x2

    if-eq p0, v0, :cond_b

    sget-object p0, Lads_mobile_sdk/ak2;->c:Lads_mobile_sdk/ak2;

    return-object p0

    :cond_b
    sget-object p0, Lads_mobile_sdk/ak2;->d:Lads_mobile_sdk/ak2;

    return-object p0

    :cond_e
    sget-object p0, Lads_mobile_sdk/ak2;->c:Lads_mobile_sdk/ak2;

    return-object p0

    :cond_11
    sget-object p0, Lads_mobile_sdk/ak2;->b:Lads_mobile_sdk/ak2;

    return-object p0
.end method

.method public static i(Landroid/content/Context;)I
    .registers 2

    const/high16 v0, 0x42200000    # 40.0f

    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-static {v0, p0}, Lfan;->a(FLandroid/content/res/Resources;)I

    move-result p0

    return p0
.end method

.method public static j(Landroid/content/Context;Ljava/lang/String;III)Lvmj;
    .registers 12

    sget-object v5, Lna5;->b:Lna5;

    and-int/lit8 p4, p4, 0x20

    if-eqz p4, :cond_9

    const/4 p4, 0x0

    :goto_7
    move v6, p4

    goto :goto_b

    :cond_9
    const/4 p4, 0x1

    goto :goto_7

    :goto_b
    sget-object v2, Lumj;->b:Lumj;

    move-object v0, p0

    move-object v1, p1

    move v3, p2

    move v4, p3

    invoke-static/range {v0 .. v6}, Ltmj;->l(Landroid/content/Context;Ljava/lang/String;Lumj;IILna5;Z)Lvmj;

    move-result-object p0

    return-object p0
.end method

.method public static l(Landroid/content/Context;Ljava/lang/String;Lumj;IILna5;Z)Lvmj;
    .registers 16

    invoke-static {p1}, Lz5i;->a0(Ljava/lang/String;)Z

    move-result v0

    move-object v1, p0

    if-eqz v0, :cond_1c

    new-instance p0, Lxmj;

    move-object v4, p2

    new-instance p2, Llxh;

    const p1, 0x7f0803ec

    invoke-direct {p2, p1}, Llxh;-><init>(I)V

    sget-object p6, Lna5;->e:Lna5;

    move p5, p4

    move-object p1, v1

    move p4, p3

    move-object p3, v4

    invoke-direct/range {p0 .. p6}, Lxmj;-><init>(Landroid/content/Context;Lb8h;Lumj;IILna5;)V

    return-object p0

    :cond_1c
    move-object v4, p2

    move v6, p4

    move p4, p3

    new-instance v0, Lzmj;

    invoke-virtual {p5, v1, p1}, Lna5;->g(Landroid/content/Context;Ljava/lang/String;)Loa5;

    move-result-object v7

    const/4 v3, 0x0

    move-object v2, p1

    move v5, p4

    move v8, p6

    invoke-direct/range {v0 .. v8}, Lzmj;-><init>(Landroid/content/Context;Ljava/lang/String;Lanj;Lumj;IILoa5;Z)V

    return-object v0
.end method

.method public static m(Landroid/content/Context;Ljava/lang/String;IILna5;I)Lvmj;
    .registers 13

    sget v0, Lvmj;->g:I

    and-int/lit8 v0, p5, 0x4

    if-eqz v0, :cond_a

    invoke-static {p0}, Ltmj;->i(Landroid/content/Context;)I

    move-result p2

    :cond_a
    move v3, p2

    and-int/lit8 p2, p5, 0x8

    if-eqz p2, :cond_13

    invoke-static {p0}, Ltmj;->i(Landroid/content/Context;)I

    move-result p3

    :cond_13
    move v4, p3

    and-int/lit8 p5, p5, 0x10

    if-eqz p5, :cond_1a

    sget-object p4, Lna5;->b:Lna5;

    :cond_1a
    move-object v5, p4

    const/4 v6, 0x0

    sget-object v2, Lumj;->c:Lumj;

    move-object v0, p0

    move-object v1, p1

    invoke-static/range {v0 .. v6}, Ltmj;->l(Landroid/content/Context;Ljava/lang/String;Lumj;IILna5;Z)Lvmj;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public final a()Ljava/lang/String;
    .registers 1

    .line 50
    const-string p0, "omidJsAttestationListener"

    return-object p0
.end method

.method public final a(Ljava/lang/String;Lorg/json/JSONObject;)V
    .registers 5

    const-string p0, "version"

    const-string v0, "attest"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_31

    :try_start_a
    const-string p1, "mechanism"

    invoke-virtual {p2, p1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p2, p0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "attestationArgs"

    invoke-virtual {p2, v1}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p2

    invoke-static {p2}, Lads_mobile_sdk/v62;->a(Lorg/json/JSONObject;)Ljava/util/HashMap;

    move-result-object p2

    invoke-virtual {p2, p0, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object p0, Lads_mobile_sdk/pb1;->b:Lads_mobile_sdk/pb1;

    iget-object p0, p0, Lads_mobile_sdk/pb1;->a:Landroid/content/Context;

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    new-instance v0, Lads_mobile_sdk/e7;

    invoke-direct {v0, p2}, Lads_mobile_sdk/e7;-><init>(Ljava/util/HashMap;)V

    invoke-static {p0, p1, v0}, Lcgh;->d(Landroid/content/Context;Ljava/lang/String;Lads_mobile_sdk/e7;)V
    :try_end_31
    .catch Ljava/lang/Exception; {:try_start_a .. :try_end_31} :catch_31

    :catch_31
    :cond_31
    return-void
.end method

.method public final b()V
    .registers 1

    return-void
.end method

.method public final createSeekMap()Ltwi;
    .registers 3

    new-instance p0, Lrv2;

    const-wide v0, -0x7fffffffffffffffL    # -4.9E-324

    invoke-direct {p0, v0, v1}, Lrv2;-><init>(J)V

    return-object p0
.end method

.method public final d()J
    .registers 3

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    return-wide v0
.end method

.method public final e(Lpna;Ljava/lang/Object;)V
    .registers 7

    check-cast p2, Liwn;

    iget-object p0, p1, Lpna;->a:Lz9f;

    iget-object p0, p0, Lz9f;->f:Ljava/util/Set;

    sget-object v0, Lrvn;->a:Lrvn;

    invoke-interface {p0, v0}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result p0

    iget-object v0, p1, Lpna;->d:Lmpa;

    sget-object v1, Lmpa;->l:Lc30;

    new-instance v2, Lgwn;

    const/4 v3, 0x0

    invoke-direct {v2, v3, p2, p0}, Lgwn;-><init>(Lmt5;Liwn;Z)V

    invoke-virtual {v0, v1, v2}, Lcfg;->f(Lc30;Lcr9;)V

    iget-object p1, p1, Lpna;->e:Lmpa;

    sget-object v0, Lmpa;->p:Lc30;

    new-instance v1, Lhwn;

    invoke-direct {v1, v3, p2, p0}, Lhwn;-><init>(Lmt5;Liwn;Z)V

    invoke-virtual {p1, v0, v1}, Lcfg;->f(Lc30;Lcr9;)V

    return-void
.end method

.method public final f(Landroid/content/Context;)Lqb7;
    .registers 4

    sget-object v0, Lqb7;->i:Lqb7;

    if-nez v0, :cond_1a

    monitor-enter p0

    :try_start_5
    sget-object v0, Lqb7;->i:Lqb7;

    if-nez v0, :cond_15

    new-instance v0, Lqb7;

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    const/4 v1, 0x3

    invoke-direct {v0, p1, v1}, Lqb7;-><init>(Landroid/content/Context;B)V

    sput-object v0, Lqb7;->i:Lqb7;
    :try_end_15
    .catchall {:try_start_5 .. :try_end_15} :catchall_17

    :cond_15
    monitor-exit p0

    return-object v0

    :catchall_17
    move-exception p1

    monitor-exit p0

    throw p1

    :cond_1a
    return-object v0
.end method

.method public final g(Lcom/google/ads/interactivemedia/v3/impl/data/zzbr;)Lcom/google/ads/interactivemedia/v3/impl/data/zzbs;
    .registers 11

    const/4 p0, 0x0

    :try_start_1
    new-instance v0, Ljava/net/URL;

    invoke-virtual {p1}, Lcom/google/ads/interactivemedia/v3/impl/data/zzbr;->f()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v0

    check-cast v0, Ljava/net/HttpURLConnection;
    :try_end_10
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_10} :catch_c3
    .catchall {:try_start_1 .. :try_end_10} :catchall_c1

    :try_start_10
    const-string p0, "User-Agent"

    invoke-virtual {p1}, Lcom/google/ads/interactivemedia/v3/impl/data/zzbr;->g()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, p0, v1}, Ljava/net/URLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p1}, Lcom/google/ads/interactivemedia/v3/impl/data/zzbr;->a()I

    move-result p0

    invoke-virtual {v0, p0}, Ljava/net/URLConnection;->setConnectTimeout(I)V

    invoke-virtual {p1}, Lcom/google/ads/interactivemedia/v3/impl/data/zzbr;->d()I

    move-result p0

    invoke-virtual {v0, p0}, Ljava/net/URLConnection;->setReadTimeout(I)V

    invoke-virtual {p1}, Lcom/google/ads/interactivemedia/v3/impl/data/zzbr;->e()Lcom/google/ads/interactivemedia/v3/impl/data/zzbq;

    move-result-object p0

    sget-object v1, Lcom/google/ads/interactivemedia/v3/impl/data/zzbq;->POST:Lcom/google/ads/interactivemedia/v3/impl/data/zzbq;
    :try_end_2d
    .catch Ljava/io/IOException; {:try_start_10 .. :try_end_2d} :catch_bf
    .catchall {:try_start_10 .. :try_end_2d} :catchall_eb

    const-string v2, "addSuppressed"

    const-class v3, Ljava/lang/Throwable;

    if-ne p0, v1, :cond_6a

    const/4 p0, 0x1

    :try_start_34
    invoke-virtual {v0, p0}, Ljava/net/URLConnection;->setDoOutput(Z)V

    const/4 p0, 0x0

    invoke-virtual {v0, p0}, Ljava/net/HttpURLConnection;->setChunkedStreamingMode(I)V

    invoke-virtual {p1}, Lcom/google/ads/interactivemedia/v3/impl/data/zzbr;->b()Ljava/lang/String;

    move-result-object p0

    if-eqz p0, :cond_6a

    invoke-virtual {v0}, Ljava/net/URLConnection;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v1
    :try_end_45
    .catch Ljava/io/IOException; {:try_start_34 .. :try_end_45} :catch_bf
    .catchall {:try_start_34 .. :try_end_45} :catchall_eb

    :try_start_45
    sget-object v4, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-virtual {p0, v4}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object p0

    invoke-virtual {v1, p0}, Ljava/io/OutputStream;->write([B)V
    :try_end_4e
    .catchall {:try_start_45 .. :try_end_4e} :catchall_52

    :try_start_4e
    invoke-virtual {v1}, Ljava/io/OutputStream;->close()V
    :try_end_51
    .catch Ljava/io/IOException; {:try_start_4e .. :try_end_51} :catch_bf
    .catchall {:try_start_4e .. :try_end_51} :catchall_eb

    goto :goto_6a

    :catchall_52
    move-exception p0

    if-eqz v1, :cond_69

    :try_start_55
    invoke-virtual {v1}, Ljava/io/OutputStream;->close()V
    :try_end_58
    .catchall {:try_start_55 .. :try_end_58} :catchall_59

    goto :goto_69

    :catchall_59
    move-exception v1

    :try_start_5a
    filled-new-array {v3}, [Ljava/lang/Class;

    move-result-object v4

    invoke-virtual {v3, v2, v4}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v2

    filled-new-array {v1}, [Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v2, p0, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_69
    .catch Ljava/lang/Exception; {:try_start_5a .. :try_end_69} :catch_69
    .catchall {:try_start_5a .. :try_end_69} :catchall_eb

    :catch_69
    :cond_69
    :goto_69
    :try_start_69
    throw p0

    :cond_6a
    :goto_6a
    invoke-virtual {v0}, Ljava/net/URLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object p0
    :try_end_6e
    .catch Ljava/io/IOException; {:try_start_69 .. :try_end_6e} :catch_bf
    .catchall {:try_start_69 .. :try_end_6e} :catchall_eb

    :try_start_6e
    new-instance v1, Ljava/io/BufferedInputStream;

    invoke-direct {v1, p0}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;)V

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    new-instance v5, Ljava/io/BufferedReader;

    new-instance v6, Ljava/io/InputStreamReader;

    sget-object v7, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-direct {v6, v1, v7}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;Ljava/nio/charset/Charset;)V

    invoke-direct {v5, v6}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    :goto_84
    invoke-virtual {v5}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_8e

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_84

    :cond_8e
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1
    :try_end_92
    .catchall {:try_start_6e .. :try_end_92} :catchall_a7

    if-eqz p0, :cond_97

    :try_start_94
    invoke-virtual {p0}, Ljava/io/InputStream;->close()V

    :cond_97
    invoke-virtual {v0}, Ljava/net/URLConnection;->getContentType()Ljava/lang/String;

    move-result-object p0
    :try_end_9b
    .catch Ljava/io/IOException; {:try_start_94 .. :try_end_9b} :catch_bf
    .catchall {:try_start_94 .. :try_end_9b} :catchall_eb

    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->disconnect()V

    invoke-virtual {p1}, Lcom/google/ads/interactivemedia/v3/impl/data/zzbr;->c()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1, v1, p0}, Lcom/google/ads/interactivemedia/v3/impl/data/zzbs;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/google/ads/interactivemedia/v3/impl/data/zzbs;

    move-result-object p0

    return-object p0

    :catchall_a7
    move-exception v1

    if-eqz p0, :cond_be

    :try_start_aa
    invoke-virtual {p0}, Ljava/io/InputStream;->close()V
    :try_end_ad
    .catchall {:try_start_aa .. :try_end_ad} :catchall_ae

    goto :goto_be

    :catchall_ae
    move-exception p0

    :try_start_af
    filled-new-array {v3}, [Ljava/lang/Class;

    move-result-object v4

    invoke-virtual {v3, v2, v4}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v2

    filled-new-array {p0}, [Ljava/lang/Object;

    move-result-object p0

    invoke-virtual {v2, v1, p0}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_be
    .catch Ljava/lang/Exception; {:try_start_af .. :try_end_be} :catch_be
    .catchall {:try_start_af .. :try_end_be} :catchall_eb

    :catch_be
    :cond_be
    :goto_be
    :try_start_be
    throw v1
    :try_end_bf
    .catch Ljava/io/IOException; {:try_start_be .. :try_end_bf} :catch_bf
    .catchall {:try_start_be .. :try_end_bf} :catchall_eb

    :catch_bf
    move-exception p0

    goto :goto_c7

    :catchall_c1
    move-exception p1

    goto :goto_ee

    :catch_c3
    move-exception v0

    move-object v8, v0

    move-object v0, p0

    move-object p0, v8

    :goto_c7
    :try_start_c7
    instance-of p0, p0, Ljava/net/SocketTimeoutException;

    if-eqz p0, :cond_db

    invoke-virtual {p1}, Lcom/google/ads/interactivemedia/v3/impl/data/zzbr;->c()Ljava/lang/String;

    move-result-object p0

    const/16 p1, 0x65

    invoke-static {p1, p0}, Lcom/google/ads/interactivemedia/v3/impl/data/zzbs;->d(ILjava/lang/String;)Lcom/google/ads/interactivemedia/v3/impl/data/zzbs;

    move-result-object p0
    :try_end_d5
    .catchall {:try_start_c7 .. :try_end_d5} :catchall_eb

    if-eqz v0, :cond_da

    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->disconnect()V

    :cond_da
    return-object p0

    :cond_db
    :try_start_db
    invoke-virtual {p1}, Lcom/google/ads/interactivemedia/v3/impl/data/zzbr;->c()Ljava/lang/String;

    move-result-object p0

    const/16 p1, 0x64

    invoke-static {p1, p0}, Lcom/google/ads/interactivemedia/v3/impl/data/zzbs;->d(ILjava/lang/String;)Lcom/google/ads/interactivemedia/v3/impl/data/zzbs;

    move-result-object p0
    :try_end_e5
    .catchall {:try_start_db .. :try_end_e5} :catchall_eb

    if-eqz v0, :cond_ea

    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->disconnect()V

    :cond_ea
    return-object p0

    :catchall_eb
    move-exception p0

    move-object p1, p0

    move-object p0, v0

    :goto_ee
    if-eqz p0, :cond_f3

    invoke-virtual {p0}, Ljava/net/HttpURLConnection;->disconnect()V

    :cond_f3
    throw p1
.end method

.method public final getKey()Ljf2;
    .registers 1

    sget-object p0, Liwn;->e:Ljf2;

    return-object p0
.end method

.method public final getMaxPrefetches()I
    .registers 1

    const/4 p0, 0x0

    throw p0
.end method

.method public final getMaxPrerenders()I
    .registers 1

    const/4 p0, 0x0

    throw p0
.end method

.method public final getPrefetchTTLSeconds()I
    .registers 1

    const/4 p0, 0x0

    throw p0
.end method

.method public final h(Llp6;)J
    .registers 2

    const-wide/16 p0, -0x1

    return-wide p0
.end method

.method public final k(Lkotlin/jvm/functions/Function1;)Ljava/lang/Object;
    .registers 4

    new-instance p0, Lfwn;

    invoke-direct {p0}, Lfwn;-><init>()V

    invoke-interface {p1, p0}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    new-instance p1, Liwn;

    iget-object v0, p0, Lfwn;->c:Lwub;

    iget-object v1, p0, Lfwn;->b:Lovn;

    iget-object p0, p0, Lfwn;->a:Lo28;

    invoke-direct {p1, p0, v0, v1}, Liwn;-><init>(Lo28;Lwub;Lovn;)V

    return-object p1
.end method

.method public final startSeek(J)V
    .registers 3

    return-void
.end method

.method public final zza(Landroid/os/IBinder;)Ljava/lang/Object;
    .registers 4

    sget p0, Ldqp;->a:I

    if-nez p1, :cond_6

    const/4 p0, 0x0

    return-object p0

    :cond_6
    const-string p0, "com.google.android.play.core.hsdp.protocol.IHpoaService"

    invoke-interface {p1, p0}, Landroid/os/IBinder;->queryLocalInterface(Ljava/lang/String;)Landroid/os/IInterface;

    move-result-object v0

    instance-of v1, v0, Lgrp;

    if-eqz v1, :cond_13

    check-cast v0, Lgrp;

    return-object v0

    :cond_13
    new-instance v0, Lmop;

    invoke-direct {v0, p1, p0}, Lcom/google/android/gms/internal/playcore_hsdp/zza;-><init>(Landroid/os/IBinder;Ljava/lang/String;)V

    return-object v0
.end method

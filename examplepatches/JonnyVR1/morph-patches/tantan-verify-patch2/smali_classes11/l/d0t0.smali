.class public final Ll/d0t0;
.super Ll/gzs0;
.source "SourceFile"


# instance fields
.field public final a:Lcom/google/android/gms/ads/mediation/rtb/RtbAdapter;

.field public b:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/google/android/gms/ads/mediation/rtb/RtbAdapter;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ll/gzs0;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string v0, ""

    .line 5
    .line 6
    iput-object v0, p0, Ll/d0t0;->b:Ljava/lang/String;

    .line 7
    .line 8
    iput-object p1, p0, Ll/d0t0;->a:Lcom/google/android/gms/ads/mediation/rtb/RtbAdapter;

    .line 9
    .line 10
    return-void
.end method

.method public static final q8(Ljava/lang/String;)Landroid/os/Bundle;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 1
    const-string v0, "Server parameters: "

    .line 2
    .line 3
    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-virtual {v0, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-static {v0}, Ll/dct0;->g(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    :try_start_0
    new-instance v0, Landroid/os/Bundle;

    .line 15
    .line 16
    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 17
    .line 18
    .line 19
    if-eqz p0, :cond_1

    .line 20
    .line 21
    new-instance v0, Lorg/json/JSONObject;

    .line 22
    .line 23
    invoke-direct {v0, p0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    new-instance p0, Landroid/os/Bundle;

    .line 27
    .line 28
    invoke-direct {p0}, Landroid/os/Bundle;-><init>()V

    .line 29
    .line 30
    .line 31
    invoke-virtual {v0}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 36
    .line 37
    .line 38
    move-result v2

    .line 39
    if-eqz v2, :cond_0

    .line 40
    .line 41
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 42
    .line 43
    .line 44
    move-result-object v2

    .line 45
    check-cast v2, Ljava/lang/String;

    .line 46
    .line 47
    invoke-virtual {v0, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object v3

    .line 51
    invoke-virtual {p0, v2, v3}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 52
    .line 53
    .line 54
    goto :goto_0

    .line 55
    :cond_0
    return-object p0

    .line 56
    :cond_1
    return-object v0

    .line 57
    :catch_0
    move-exception p0

    .line 58
    const-string v0, ""

    .line 59
    .line 60
    invoke-static {v0, p0}, Ll/dct0;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 61
    .line 62
    .line 63
    invoke-static {}, Ll/pqy0;->a()V

    .line 64
    .line 65
    .line 66
    const/4 p0, 0x0

    .line 67
    return-object p0
.end method

.method public static final r8(Lcom/google/android/gms/ads/internal/client/zzl;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/google/android/gms/ads/internal/client/zzl;->zzf:Z

    .line 2
    .line 3
    if-nez p0, :cond_1

    .line 4
    .line 5
    invoke-static {}, Ll/k6s0;->b()Ll/obt0;

    .line 6
    .line 7
    .line 8
    invoke-static {}, Ll/obt0;->t()Z

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    if-eqz p0, :cond_0

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_0
    const/4 p0, 0x0

    .line 16
    return p0

    .line 17
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 18
    return p0
.end method

.method public static final s8(Ljava/lang/String;Lcom/google/android/gms/ads/internal/client/zzl;)Ljava/lang/String;
    .locals 1
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p1, p1, Lcom/google/android/gms/ads/internal/client/zzl;->zzu:Ljava/lang/String;

    .line 2
    .line 3
    :try_start_0
    new-instance v0, Lorg/json/JSONObject;

    .line 4
    .line 5
    invoke-direct {v0, p0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    const-string p0, "max_ad_content_rating"

    .line 9
    .line 10
    invoke-virtual {v0, p0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object p0
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 14
    return-object p0

    .line 15
    :catch_0
    return-object p1
.end method


# virtual methods
.method public final H(Ll/p1m;)Z
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public final I7(Ljava/lang/String;Ljava/lang/String;Lcom/google/android/gms/ads/internal/client/zzl;Ll/p1m;Ll/ezs0;Ll/jxs0;)V
    .locals 14
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 1
    move-object/from16 v0, p3

    .line 2
    .line 3
    :try_start_0
    new-instance v1, Ll/c0t0;

    .line 4
    .line 5
    move-object/from16 v2, p5

    .line 6
    .line 7
    move-object/from16 v3, p6

    .line 8
    .line 9
    invoke-direct {v1, p0, v2, v3}, Ll/c0t0;-><init>(Ll/d0t0;Ll/ezs0;Ll/jxs0;)V

    .line 10
    .line 11
    .line 12
    iget-object v2, p0, Ll/d0t0;->a:Lcom/google/android/gms/ads/mediation/rtb/RtbAdapter;

    .line 13
    .line 14
    new-instance v3, Ll/e8y;

    .line 15
    .line 16
    invoke-static/range {p4 .. p4}, Ll/h950;->P2(Ll/p1m;)Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object v4

    .line 20
    check-cast v4, Landroid/content/Context;

    .line 21
    .line 22
    invoke-static/range {p2 .. p2}, Ll/d0t0;->q8(Ljava/lang/String;)Landroid/os/Bundle;

    .line 23
    .line 24
    .line 25
    move-result-object v6

    .line 26
    invoke-virtual {p0, v0}, Ll/d0t0;->p8(Lcom/google/android/gms/ads/internal/client/zzl;)Landroid/os/Bundle;

    .line 27
    .line 28
    .line 29
    move-result-object v7

    .line 30
    invoke-static {v0}, Ll/d0t0;->r8(Lcom/google/android/gms/ads/internal/client/zzl;)Z

    .line 31
    .line 32
    .line 33
    move-result v8

    .line 34
    iget-object v9, v0, Lcom/google/android/gms/ads/internal/client/zzl;->zzk:Landroid/location/Location;

    .line 35
    .line 36
    iget v10, v0, Lcom/google/android/gms/ads/internal/client/zzl;->zzg:I

    .line 37
    .line 38
    iget v11, v0, Lcom/google/android/gms/ads/internal/client/zzl;->zzt:I

    .line 39
    .line 40
    invoke-static/range {p2 .. p3}, Ll/d0t0;->s8(Ljava/lang/String;Lcom/google/android/gms/ads/internal/client/zzl;)Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object v12

    .line 44
    iget-object v13, p0, Ll/d0t0;->b:Ljava/lang/String;

    .line 45
    .line 46
    move-object v5, p1

    .line 47
    invoke-direct/range {v3 .. v13}, Ll/e8y;-><init>(Landroid/content/Context;Ljava/lang/String;Landroid/os/Bundle;Landroid/os/Bundle;ZLandroid/location/Location;IILjava/lang/String;Ljava/lang/String;)V

    .line 48
    .line 49
    .line 50
    invoke-virtual {v2, v3, v1}, Lcom/google/android/gms/ads/mediation/rtb/RtbAdapter;->loadRtbRewardedInterstitialAd(Ll/e8y;Ll/t7y;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 51
    .line 52
    .line 53
    return-void

    .line 54
    :catchall_0
    move-exception v0

    .line 55
    move-object p0, v0

    .line 56
    const-string v0, "Adapter failed to render rewarded interstitial ad."

    .line 57
    .line 58
    invoke-static {v0, p0}, Ll/dct0;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 59
    .line 60
    .line 61
    const-string v0, "adapter.loadRtbRewardedInterstitialAd"

    .line 62
    .line 63
    move-object/from16 v1, p4

    .line 64
    .line 65
    invoke-static {v1, p0, v0}, Ll/rws0;->a(Ll/p1m;Ljava/lang/Throwable;Ljava/lang/String;)V

    .line 66
    .line 67
    .line 68
    invoke-static {}, Ll/pqy0;->a()V

    .line 69
    .line 70
    .line 71
    return-void
.end method

.method public final O1(Ljava/lang/String;Ljava/lang/String;Lcom/google/android/gms/ads/internal/client/zzl;Ll/p1m;Ll/vys0;Ll/jxs0;Lcom/google/android/gms/ads/internal/client/zzq;)V
    .locals 17
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p3

    .line 4
    .line 5
    move-object/from16 v2, p7

    .line 6
    .line 7
    :try_start_0
    new-instance v3, Ll/mzs0;

    .line 8
    .line 9
    move-object/from16 v4, p5

    .line 10
    .line 11
    move-object/from16 v5, p6

    .line 12
    .line 13
    invoke-direct {v3, v0, v4, v5}, Ll/mzs0;-><init>(Ll/d0t0;Ll/vys0;Ll/jxs0;)V

    .line 14
    .line 15
    .line 16
    iget-object v4, v0, Ll/d0t0;->a:Lcom/google/android/gms/ads/mediation/rtb/RtbAdapter;

    .line 17
    .line 18
    new-instance v5, Ll/x7y;

    .line 19
    .line 20
    invoke-static/range {p4 .. p4}, Ll/h950;->P2(Ll/p1m;)Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object v6

    .line 24
    check-cast v6, Landroid/content/Context;

    .line 25
    .line 26
    invoke-static/range {p2 .. p2}, Ll/d0t0;->q8(Ljava/lang/String;)Landroid/os/Bundle;

    .line 27
    .line 28
    .line 29
    move-result-object v8

    .line 30
    invoke-virtual {v0, v1}, Ll/d0t0;->p8(Lcom/google/android/gms/ads/internal/client/zzl;)Landroid/os/Bundle;

    .line 31
    .line 32
    .line 33
    move-result-object v9

    .line 34
    invoke-static {v1}, Ll/d0t0;->r8(Lcom/google/android/gms/ads/internal/client/zzl;)Z

    .line 35
    .line 36
    .line 37
    move-result v10

    .line 38
    iget-object v11, v1, Lcom/google/android/gms/ads/internal/client/zzl;->zzk:Landroid/location/Location;

    .line 39
    .line 40
    iget v12, v1, Lcom/google/android/gms/ads/internal/client/zzl;->zzg:I

    .line 41
    .line 42
    iget v13, v1, Lcom/google/android/gms/ads/internal/client/zzl;->zzt:I

    .line 43
    .line 44
    invoke-static/range {p2 .. p3}, Ll/d0t0;->s8(Ljava/lang/String;Lcom/google/android/gms/ads/internal/client/zzl;)Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object v14

    .line 48
    iget v1, v2, Lcom/google/android/gms/ads/internal/client/zzq;->zze:I

    .line 49
    .line 50
    iget v7, v2, Lcom/google/android/gms/ads/internal/client/zzq;->zzb:I

    .line 51
    .line 52
    iget-object v2, v2, Lcom/google/android/gms/ads/internal/client/zzq;->zza:Ljava/lang/String;

    .line 53
    .line 54
    invoke-static {v1, v7, v2}, Ll/l9s0;->c(IILjava/lang/String;)Ll/w70;

    .line 55
    .line 56
    .line 57
    move-result-object v15

    .line 58
    iget-object v0, v0, Ll/d0t0;->b:Ljava/lang/String;

    .line 59
    .line 60
    move-object/from16 v7, p1

    .line 61
    .line 62
    move-object/from16 v16, v0

    .line 63
    .line 64
    invoke-direct/range {v5 .. v16}, Ll/x7y;-><init>(Landroid/content/Context;Ljava/lang/String;Landroid/os/Bundle;Landroid/os/Bundle;ZLandroid/location/Location;IILjava/lang/String;Ll/w70;Ljava/lang/String;)V

    .line 65
    .line 66
    .line 67
    invoke-virtual {v4, v5, v3}, Lcom/google/android/gms/ads/mediation/rtb/RtbAdapter;->loadRtbBannerAd(Ll/x7y;Ll/t7y;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 68
    .line 69
    .line 70
    return-void

    .line 71
    :catchall_0
    move-exception v0

    .line 72
    const-string v1, "Adapter failed to render banner ad."

    .line 73
    .line 74
    invoke-static {v1, v0}, Ll/dct0;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 75
    .line 76
    .line 77
    const-string v1, "adapter.loadRtbBannerAd"

    .line 78
    .line 79
    move-object/from16 v2, p4

    .line 80
    .line 81
    invoke-static {v2, v0, v1}, Ll/rws0;->a(Ll/p1m;Ljava/lang/Throwable;Ljava/lang/String;)V

    .line 82
    .line 83
    .line 84
    invoke-static {}, Ll/pqy0;->a()V

    .line 85
    .line 86
    .line 87
    return-void
.end method

.method public final T(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/d0t0;->b:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public final T0(Ljava/lang/String;Ljava/lang/String;Lcom/google/android/gms/ads/internal/client/zzl;Ll/p1m;Ll/bzs0;Ll/jxs0;)V
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 1
    const/4 v7, 0x0

    .line 2
    move-object v0, p0

    .line 3
    move-object v1, p1

    .line 4
    move-object v2, p2

    .line 5
    move-object v3, p3

    .line 6
    move-object v4, p4

    .line 7
    move-object v5, p5

    .line 8
    move-object v6, p6

    .line 9
    invoke-virtual/range {v0 .. v7}, Ll/d0t0;->X3(Ljava/lang/String;Ljava/lang/String;Lcom/google/android/gms/ads/internal/client/zzl;Ll/p1m;Ll/bzs0;Ll/jxs0;Lcom/google/android/gms/internal/ads/zzbjb;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final X3(Ljava/lang/String;Ljava/lang/String;Lcom/google/android/gms/ads/internal/client/zzl;Ll/p1m;Ll/bzs0;Ll/jxs0;Lcom/google/android/gms/internal/ads/zzbjb;)V
    .locals 16
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p3

    .line 4
    .line 5
    :try_start_0
    new-instance v2, Ll/zzs0;

    .line 6
    .line 7
    move-object/from16 v3, p5

    .line 8
    .line 9
    move-object/from16 v4, p6

    .line 10
    .line 11
    invoke-direct {v2, v0, v3, v4}, Ll/zzs0;-><init>(Ll/d0t0;Ll/bzs0;Ll/jxs0;)V

    .line 12
    .line 13
    .line 14
    iget-object v3, v0, Ll/d0t0;->a:Lcom/google/android/gms/ads/mediation/rtb/RtbAdapter;

    .line 15
    .line 16
    new-instance v4, Ll/c8y;

    .line 17
    .line 18
    invoke-static/range {p4 .. p4}, Ll/h950;->P2(Ll/p1m;)Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object v5

    .line 22
    check-cast v5, Landroid/content/Context;

    .line 23
    .line 24
    invoke-static/range {p2 .. p2}, Ll/d0t0;->q8(Ljava/lang/String;)Landroid/os/Bundle;

    .line 25
    .line 26
    .line 27
    move-result-object v7

    .line 28
    invoke-virtual {v0, v1}, Ll/d0t0;->p8(Lcom/google/android/gms/ads/internal/client/zzl;)Landroid/os/Bundle;

    .line 29
    .line 30
    .line 31
    move-result-object v8

    .line 32
    invoke-static {v1}, Ll/d0t0;->r8(Lcom/google/android/gms/ads/internal/client/zzl;)Z

    .line 33
    .line 34
    .line 35
    move-result v9

    .line 36
    iget-object v10, v1, Lcom/google/android/gms/ads/internal/client/zzl;->zzk:Landroid/location/Location;

    .line 37
    .line 38
    iget v11, v1, Lcom/google/android/gms/ads/internal/client/zzl;->zzg:I

    .line 39
    .line 40
    iget v12, v1, Lcom/google/android/gms/ads/internal/client/zzl;->zzt:I

    .line 41
    .line 42
    invoke-static/range {p2 .. p3}, Ll/d0t0;->s8(Ljava/lang/String;Lcom/google/android/gms/ads/internal/client/zzl;)Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object v13

    .line 46
    iget-object v14, v0, Ll/d0t0;->b:Ljava/lang/String;

    .line 47
    .line 48
    move-object/from16 v6, p1

    .line 49
    .line 50
    move-object/from16 v15, p7

    .line 51
    .line 52
    invoke-direct/range {v4 .. v15}, Ll/c8y;-><init>(Landroid/content/Context;Ljava/lang/String;Landroid/os/Bundle;Landroid/os/Bundle;ZLandroid/location/Location;IILjava/lang/String;Ljava/lang/String;Lcom/google/android/gms/internal/ads/zzbjb;)V

    .line 53
    .line 54
    .line 55
    invoke-virtual {v3, v4, v2}, Lcom/google/android/gms/ads/mediation/rtb/RtbAdapter;->loadRtbNativeAd(Ll/c8y;Ll/t7y;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 56
    .line 57
    .line 58
    return-void

    .line 59
    :catchall_0
    move-exception v0

    .line 60
    const-string v1, "Adapter failed to render native ad."

    .line 61
    .line 62
    invoke-static {v1, v0}, Ll/dct0;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 63
    .line 64
    .line 65
    const-string v1, "adapter.loadRtbNativeAd"

    .line 66
    .line 67
    move-object/from16 v2, p4

    .line 68
    .line 69
    invoke-static {v2, v0, v1}, Ll/rws0;->a(Ll/p1m;Ljava/lang/Throwable;Ljava/lang/String;)V

    .line 70
    .line 71
    .line 72
    invoke-static {}, Ll/pqy0;->a()V

    .line 73
    .line 74
    .line 75
    return-void
.end method

.method public final b3(Ljava/lang/String;Ljava/lang/String;Lcom/google/android/gms/ads/internal/client/zzl;Ll/p1m;Ll/yys0;Ll/jxs0;)V
    .locals 14
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 1
    move-object/from16 v0, p3

    .line 2
    .line 3
    :try_start_0
    new-instance v1, Ll/ozs0;

    .line 4
    .line 5
    move-object/from16 v2, p5

    .line 6
    .line 7
    move-object/from16 v3, p6

    .line 8
    .line 9
    invoke-direct {v1, p0, v2, v3}, Ll/ozs0;-><init>(Ll/d0t0;Ll/yys0;Ll/jxs0;)V

    .line 10
    .line 11
    .line 12
    iget-object v2, p0, Ll/d0t0;->a:Lcom/google/android/gms/ads/mediation/rtb/RtbAdapter;

    .line 13
    .line 14
    new-instance v3, Ll/a8y;

    .line 15
    .line 16
    invoke-static/range {p4 .. p4}, Ll/h950;->P2(Ll/p1m;)Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object v4

    .line 20
    check-cast v4, Landroid/content/Context;

    .line 21
    .line 22
    invoke-static/range {p2 .. p2}, Ll/d0t0;->q8(Ljava/lang/String;)Landroid/os/Bundle;

    .line 23
    .line 24
    .line 25
    move-result-object v6

    .line 26
    invoke-virtual {p0, v0}, Ll/d0t0;->p8(Lcom/google/android/gms/ads/internal/client/zzl;)Landroid/os/Bundle;

    .line 27
    .line 28
    .line 29
    move-result-object v7

    .line 30
    invoke-static {v0}, Ll/d0t0;->r8(Lcom/google/android/gms/ads/internal/client/zzl;)Z

    .line 31
    .line 32
    .line 33
    move-result v8

    .line 34
    iget-object v9, v0, Lcom/google/android/gms/ads/internal/client/zzl;->zzk:Landroid/location/Location;

    .line 35
    .line 36
    iget v10, v0, Lcom/google/android/gms/ads/internal/client/zzl;->zzg:I

    .line 37
    .line 38
    iget v11, v0, Lcom/google/android/gms/ads/internal/client/zzl;->zzt:I

    .line 39
    .line 40
    invoke-static/range {p2 .. p3}, Ll/d0t0;->s8(Ljava/lang/String;Lcom/google/android/gms/ads/internal/client/zzl;)Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object v12

    .line 44
    iget-object v13, p0, Ll/d0t0;->b:Ljava/lang/String;

    .line 45
    .line 46
    move-object v5, p1

    .line 47
    invoke-direct/range {v3 .. v13}, Ll/a8y;-><init>(Landroid/content/Context;Ljava/lang/String;Landroid/os/Bundle;Landroid/os/Bundle;ZLandroid/location/Location;IILjava/lang/String;Ljava/lang/String;)V

    .line 48
    .line 49
    .line 50
    invoke-virtual {v2, v3, v1}, Lcom/google/android/gms/ads/mediation/rtb/RtbAdapter;->loadRtbInterstitialAd(Ll/a8y;Ll/t7y;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 51
    .line 52
    .line 53
    return-void

    .line 54
    :catchall_0
    move-exception v0

    .line 55
    move-object p0, v0

    .line 56
    const-string v0, "Adapter failed to render interstitial ad."

    .line 57
    .line 58
    invoke-static {v0, p0}, Ll/dct0;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 59
    .line 60
    .line 61
    const-string v0, "adapter.loadRtbInterstitialAd"

    .line 62
    .line 63
    move-object/from16 v1, p4

    .line 64
    .line 65
    invoke-static {v1, p0, v0}, Ll/rws0;->a(Ll/p1m;Ljava/lang/Throwable;Ljava/lang/String;)V

    .line 66
    .line 67
    .line 68
    invoke-static {}, Ll/pqy0;->a()V

    .line 69
    .line 70
    .line 71
    return-void
.end method

.method public final e6(Ll/p1m;)Z
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public final o0(Ll/p1m;)Z
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public final p8(Lcom/google/android/gms/ads/internal/client/zzl;)Landroid/os/Bundle;
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/google/android/gms/ads/internal/client/zzl;->zzm:Landroid/os/Bundle;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Ll/d0t0;->a:Lcom/google/android/gms/ads/mediation/rtb/RtbAdapter;

    .line 6
    .line 7
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {p0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-virtual {p1, p0}, Landroid/os/Bundle;->getBundle(Ljava/lang/String;)Landroid/os/Bundle;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    if-eqz p0, :cond_0

    .line 20
    .line 21
    return-object p0

    .line 22
    :cond_0
    new-instance p0, Landroid/os/Bundle;

    .line 23
    .line 24
    invoke-direct {p0}, Landroid/os/Bundle;-><init>()V

    .line 25
    .line 26
    .line 27
    return-object p0
.end method

.method public final s6(Ll/p1m;Ljava/lang/String;Landroid/os/Bundle;Landroid/os/Bundle;Lcom/google/android/gms/ads/internal/client/zzq;Ll/kzs0;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 1
    :try_start_0
    new-instance v0, Ll/b0t0;

    .line 2
    .line 3
    invoke-direct {v0, p0, p6}, Ll/b0t0;-><init>(Ll/d0t0;Ll/kzs0;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ll/d0t0;->a:Lcom/google/android/gms/ads/mediation/rtb/RtbAdapter;

    .line 7
    .line 8
    new-instance p6, Ll/z7y;

    .line 9
    .line 10
    invoke-virtual {p2}, Ljava/lang/String;->hashCode()I

    .line 11
    .line 12
    .line 13
    move-result v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 14
    sparse-switch v1, :sswitch_data_0

    .line 15
    .line 16
    .line 17
    goto/16 :goto_1

    .line 18
    .line 19
    :sswitch_0
    const-string v1, "rewarded_interstitial"

    .line 20
    .line 21
    invoke-virtual {p2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 22
    .line 23
    .line 24
    move-result p2

    .line 25
    if-eqz p2, :cond_0

    .line 26
    .line 27
    :try_start_1
    sget-object p2, Lcom/google/android/gms/ads/AdFormat;->REWARDED_INTERSTITIAL:Lcom/google/android/gms/ads/AdFormat;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :catchall_0
    move-exception p0

    .line 31
    goto/16 :goto_2

    .line 32
    .line 33
    :sswitch_1
    const-string v1, "app_open_ad"

    .line 34
    .line 35
    invoke-virtual {p2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 36
    .line 37
    .line 38
    move-result p2

    .line 39
    if-eqz p2, :cond_0

    .line 40
    .line 41
    :try_start_2
    sget-object p2, Ll/sgs0;->ib:Ll/dgs0;

    .line 42
    .line 43
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 44
    .line 45
    .line 46
    move-result-object v1

    .line 47
    invoke-virtual {v1, p2}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 48
    .line 49
    .line 50
    move-result-object p2

    .line 51
    check-cast p2, Ljava/lang/Boolean;

    .line 52
    .line 53
    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    .line 54
    .line 55
    .line 56
    move-result p2

    .line 57
    if-eqz p2, :cond_0

    .line 58
    .line 59
    sget-object p2, Lcom/google/android/gms/ads/AdFormat;->APP_OPEN_AD:Lcom/google/android/gms/ads/AdFormat;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 60
    .line 61
    goto :goto_0

    .line 62
    :sswitch_2
    const-string v1, "app_open"

    .line 63
    .line 64
    invoke-virtual {p2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 65
    .line 66
    .line 67
    move-result p2

    .line 68
    if-eqz p2, :cond_0

    .line 69
    .line 70
    :try_start_3
    sget-object p2, Lcom/google/android/gms/ads/AdFormat;->APP_OPEN_AD:Lcom/google/android/gms/ads/AdFormat;
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 71
    .line 72
    goto :goto_0

    .line 73
    :sswitch_3
    const-string v1, "interstitial"

    .line 74
    .line 75
    invoke-virtual {p2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 76
    .line 77
    .line 78
    move-result p2

    .line 79
    if-eqz p2, :cond_0

    .line 80
    .line 81
    :try_start_4
    sget-object p2, Lcom/google/android/gms/ads/AdFormat;->INTERSTITIAL:Lcom/google/android/gms/ads/AdFormat;
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 82
    .line 83
    goto :goto_0

    .line 84
    :sswitch_4
    const-string v1, "rewarded"

    .line 85
    .line 86
    invoke-virtual {p2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 87
    .line 88
    .line 89
    move-result p2

    .line 90
    if-eqz p2, :cond_0

    .line 91
    .line 92
    :try_start_5
    sget-object p2, Lcom/google/android/gms/ads/AdFormat;->REWARDED:Lcom/google/android/gms/ads/AdFormat;
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 93
    .line 94
    goto :goto_0

    .line 95
    :sswitch_5
    const-string v1, "native"

    .line 96
    .line 97
    invoke-virtual {p2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 98
    .line 99
    .line 100
    move-result p2

    .line 101
    if-eqz p2, :cond_0

    .line 102
    .line 103
    :try_start_6
    sget-object p2, Lcom/google/android/gms/ads/AdFormat;->NATIVE:Lcom/google/android/gms/ads/AdFormat;
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    .line 104
    .line 105
    goto :goto_0

    .line 106
    :sswitch_6
    const-string v1, "banner"

    .line 107
    .line 108
    invoke-virtual {p2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 109
    .line 110
    .line 111
    move-result p2

    .line 112
    if-eqz p2, :cond_0

    .line 113
    .line 114
    :try_start_7
    sget-object p2, Lcom/google/android/gms/ads/AdFormat;->BANNER:Lcom/google/android/gms/ads/AdFormat;

    .line 115
    .line 116
    :goto_0
    invoke-direct {p6, p2, p4}, Ll/z7y;-><init>(Lcom/google/android/gms/ads/AdFormat;Landroid/os/Bundle;)V

    .line 117
    .line 118
    .line 119
    new-instance p2, Ljava/util/ArrayList;

    .line 120
    .line 121
    invoke-direct {p2}, Ljava/util/ArrayList;-><init>()V

    .line 122
    .line 123
    .line 124
    invoke-interface {p2, p6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 125
    .line 126
    .line 127
    new-instance p4, Ll/wnd0;

    .line 128
    .line 129
    invoke-static {p1}, Ll/h950;->P2(Ll/p1m;)Ljava/lang/Object;

    .line 130
    .line 131
    .line 132
    move-result-object p6

    .line 133
    check-cast p6, Landroid/content/Context;

    .line 134
    .line 135
    iget v1, p5, Lcom/google/android/gms/ads/internal/client/zzq;->zze:I

    .line 136
    .line 137
    iget v2, p5, Lcom/google/android/gms/ads/internal/client/zzq;->zzb:I

    .line 138
    .line 139
    iget-object p5, p5, Lcom/google/android/gms/ads/internal/client/zzq;->zza:Ljava/lang/String;

    .line 140
    .line 141
    invoke-static {v1, v2, p5}, Ll/l9s0;->c(IILjava/lang/String;)Ll/w70;

    .line 142
    .line 143
    .line 144
    move-result-object p5

    .line 145
    invoke-direct {p4, p6, p2, p3, p5}, Ll/wnd0;-><init>(Landroid/content/Context;Ljava/util/List;Landroid/os/Bundle;Ll/w70;)V

    .line 146
    .line 147
    .line 148
    invoke-virtual {p0, p4, v0}, Lcom/google/android/gms/ads/mediation/rtb/RtbAdapter;->collectSignals(Ll/wnd0;Ll/umf0;)V

    .line 149
    .line 150
    .line 151
    return-void

    .line 152
    :cond_0
    :goto_1
    new-instance p0, Ljava/lang/IllegalArgumentException;

    .line 153
    .line 154
    const-string p2, "Internal Error"

    .line 155
    .line 156
    invoke-direct {p0, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 157
    .line 158
    .line 159
    throw p0
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    .line 160
    :goto_2
    const-string p2, "Error generating signals for RTB"

    .line 161
    .line 162
    invoke-static {p2, p0}, Ll/dct0;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 163
    .line 164
    .line 165
    const-string p2, "adapter.collectSignals"

    .line 166
    .line 167
    invoke-static {p1, p0, p2}, Ll/rws0;->a(Ll/p1m;Ljava/lang/Throwable;Ljava/lang/String;)V

    .line 168
    .line 169
    .line 170
    invoke-static {}, Ll/pqy0;->a()V

    .line 171
    .line 172
    .line 173
    return-void

    .line 174
    nop

    .line 175
    :sswitch_data_0
    .sparse-switch
        -0x533a80d4 -> :sswitch_6
        -0x3ebdafe9 -> :sswitch_5
        -0xe47b3f2 -> :sswitch_4
        0x240b672c -> :sswitch_3
        0x459991a8 -> :sswitch_2
        0x69fe9e1a -> :sswitch_1
        0x71ef0bbd -> :sswitch_0
    .end sparse-switch
.end method

.method public final t7(Ljava/lang/String;Ljava/lang/String;Lcom/google/android/gms/ads/internal/client/zzl;Ll/p1m;Ll/ezs0;Ll/jxs0;)V
    .locals 14
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 1
    move-object/from16 v0, p3

    .line 2
    .line 3
    :try_start_0
    new-instance v1, Ll/c0t0;

    .line 4
    .line 5
    move-object/from16 v2, p5

    .line 6
    .line 7
    move-object/from16 v3, p6

    .line 8
    .line 9
    invoke-direct {v1, p0, v2, v3}, Ll/c0t0;-><init>(Ll/d0t0;Ll/ezs0;Ll/jxs0;)V

    .line 10
    .line 11
    .line 12
    iget-object v2, p0, Ll/d0t0;->a:Lcom/google/android/gms/ads/mediation/rtb/RtbAdapter;

    .line 13
    .line 14
    new-instance v3, Ll/e8y;

    .line 15
    .line 16
    invoke-static/range {p4 .. p4}, Ll/h950;->P2(Ll/p1m;)Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object v4

    .line 20
    check-cast v4, Landroid/content/Context;

    .line 21
    .line 22
    invoke-static/range {p2 .. p2}, Ll/d0t0;->q8(Ljava/lang/String;)Landroid/os/Bundle;

    .line 23
    .line 24
    .line 25
    move-result-object v6

    .line 26
    invoke-virtual {p0, v0}, Ll/d0t0;->p8(Lcom/google/android/gms/ads/internal/client/zzl;)Landroid/os/Bundle;

    .line 27
    .line 28
    .line 29
    move-result-object v7

    .line 30
    invoke-static {v0}, Ll/d0t0;->r8(Lcom/google/android/gms/ads/internal/client/zzl;)Z

    .line 31
    .line 32
    .line 33
    move-result v8

    .line 34
    iget-object v9, v0, Lcom/google/android/gms/ads/internal/client/zzl;->zzk:Landroid/location/Location;

    .line 35
    .line 36
    iget v10, v0, Lcom/google/android/gms/ads/internal/client/zzl;->zzg:I

    .line 37
    .line 38
    iget v11, v0, Lcom/google/android/gms/ads/internal/client/zzl;->zzt:I

    .line 39
    .line 40
    invoke-static/range {p2 .. p3}, Ll/d0t0;->s8(Ljava/lang/String;Lcom/google/android/gms/ads/internal/client/zzl;)Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object v12

    .line 44
    iget-object v13, p0, Ll/d0t0;->b:Ljava/lang/String;

    .line 45
    .line 46
    move-object v5, p1

    .line 47
    invoke-direct/range {v3 .. v13}, Ll/e8y;-><init>(Landroid/content/Context;Ljava/lang/String;Landroid/os/Bundle;Landroid/os/Bundle;ZLandroid/location/Location;IILjava/lang/String;Ljava/lang/String;)V

    .line 48
    .line 49
    .line 50
    invoke-virtual {v2, v3, v1}, Lcom/google/android/gms/ads/mediation/rtb/RtbAdapter;->loadRtbRewardedAd(Ll/e8y;Ll/t7y;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 51
    .line 52
    .line 53
    return-void

    .line 54
    :catchall_0
    move-exception v0

    .line 55
    move-object p0, v0

    .line 56
    const-string v0, "Adapter failed to render rewarded ad."

    .line 57
    .line 58
    invoke-static {v0, p0}, Ll/dct0;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 59
    .line 60
    .line 61
    const-string v0, "adapter.loadRtbRewardedAd"

    .line 62
    .line 63
    move-object/from16 v1, p4

    .line 64
    .line 65
    invoke-static {v1, p0, v0}, Ll/rws0;->a(Ll/p1m;Ljava/lang/Throwable;Ljava/lang/String;)V

    .line 66
    .line 67
    .line 68
    invoke-static {}, Ll/pqy0;->a()V

    .line 69
    .line 70
    .line 71
    return-void
.end method

.method public final z1(Ljava/lang/String;Ljava/lang/String;Lcom/google/android/gms/ads/internal/client/zzl;Ll/p1m;Ll/vys0;Ll/jxs0;Lcom/google/android/gms/ads/internal/client/zzq;)V
    .locals 17
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p3

    .line 4
    .line 5
    move-object/from16 v2, p7

    .line 6
    .line 7
    :try_start_0
    new-instance v3, Ll/nzs0;

    .line 8
    .line 9
    move-object/from16 v4, p5

    .line 10
    .line 11
    move-object/from16 v5, p6

    .line 12
    .line 13
    invoke-direct {v3, v0, v4, v5}, Ll/nzs0;-><init>(Ll/d0t0;Ll/vys0;Ll/jxs0;)V

    .line 14
    .line 15
    .line 16
    iget-object v4, v0, Ll/d0t0;->a:Lcom/google/android/gms/ads/mediation/rtb/RtbAdapter;

    .line 17
    .line 18
    new-instance v5, Ll/x7y;

    .line 19
    .line 20
    invoke-static/range {p4 .. p4}, Ll/h950;->P2(Ll/p1m;)Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object v6

    .line 24
    check-cast v6, Landroid/content/Context;

    .line 25
    .line 26
    invoke-static/range {p2 .. p2}, Ll/d0t0;->q8(Ljava/lang/String;)Landroid/os/Bundle;

    .line 27
    .line 28
    .line 29
    move-result-object v8

    .line 30
    invoke-virtual {v0, v1}, Ll/d0t0;->p8(Lcom/google/android/gms/ads/internal/client/zzl;)Landroid/os/Bundle;

    .line 31
    .line 32
    .line 33
    move-result-object v9

    .line 34
    invoke-static {v1}, Ll/d0t0;->r8(Lcom/google/android/gms/ads/internal/client/zzl;)Z

    .line 35
    .line 36
    .line 37
    move-result v10

    .line 38
    iget-object v11, v1, Lcom/google/android/gms/ads/internal/client/zzl;->zzk:Landroid/location/Location;

    .line 39
    .line 40
    iget v12, v1, Lcom/google/android/gms/ads/internal/client/zzl;->zzg:I

    .line 41
    .line 42
    iget v13, v1, Lcom/google/android/gms/ads/internal/client/zzl;->zzt:I

    .line 43
    .line 44
    invoke-static/range {p2 .. p3}, Ll/d0t0;->s8(Ljava/lang/String;Lcom/google/android/gms/ads/internal/client/zzl;)Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object v14

    .line 48
    iget v1, v2, Lcom/google/android/gms/ads/internal/client/zzq;->zze:I

    .line 49
    .line 50
    iget v7, v2, Lcom/google/android/gms/ads/internal/client/zzq;->zzb:I

    .line 51
    .line 52
    iget-object v2, v2, Lcom/google/android/gms/ads/internal/client/zzq;->zza:Ljava/lang/String;

    .line 53
    .line 54
    invoke-static {v1, v7, v2}, Ll/l9s0;->c(IILjava/lang/String;)Ll/w70;

    .line 55
    .line 56
    .line 57
    move-result-object v15

    .line 58
    iget-object v0, v0, Ll/d0t0;->b:Ljava/lang/String;

    .line 59
    .line 60
    move-object/from16 v7, p1

    .line 61
    .line 62
    move-object/from16 v16, v0

    .line 63
    .line 64
    invoke-direct/range {v5 .. v16}, Ll/x7y;-><init>(Landroid/content/Context;Ljava/lang/String;Landroid/os/Bundle;Landroid/os/Bundle;ZLandroid/location/Location;IILjava/lang/String;Ll/w70;Ljava/lang/String;)V

    .line 65
    .line 66
    .line 67
    invoke-virtual {v4, v5, v3}, Lcom/google/android/gms/ads/mediation/rtb/RtbAdapter;->loadRtbInterscrollerAd(Ll/x7y;Ll/t7y;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 68
    .line 69
    .line 70
    return-void

    .line 71
    :catchall_0
    move-exception v0

    .line 72
    const-string v1, "Adapter failed to render interscroller ad."

    .line 73
    .line 74
    invoke-static {v1, v0}, Ll/dct0;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 75
    .line 76
    .line 77
    const-string v1, "adapter.loadRtbInterscrollerAd"

    .line 78
    .line 79
    move-object/from16 v2, p4

    .line 80
    .line 81
    invoke-static {v2, v0, v1}, Ll/rws0;->a(Ll/p1m;Ljava/lang/Throwable;Ljava/lang/String;)V

    .line 82
    .line 83
    .line 84
    invoke-static {}, Ll/pqy0;->a()V

    .line 85
    .line 86
    .line 87
    return-void
.end method

.method public final z6(Ljava/lang/String;Ljava/lang/String;Lcom/google/android/gms/ads/internal/client/zzl;Ll/p1m;Ll/sys0;Ll/jxs0;)V
    .locals 14
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 1
    move-object/from16 v0, p3

    .line 2
    .line 3
    :try_start_0
    new-instance v1, Ll/a0t0;

    .line 4
    .line 5
    move-object/from16 v2, p5

    .line 6
    .line 7
    move-object/from16 v3, p6

    .line 8
    .line 9
    invoke-direct {v1, p0, v2, v3}, Ll/a0t0;-><init>(Ll/d0t0;Ll/sys0;Ll/jxs0;)V

    .line 10
    .line 11
    .line 12
    iget-object v2, p0, Ll/d0t0;->a:Lcom/google/android/gms/ads/mediation/rtb/RtbAdapter;

    .line 13
    .line 14
    new-instance v3, Ll/w7y;

    .line 15
    .line 16
    invoke-static/range {p4 .. p4}, Ll/h950;->P2(Ll/p1m;)Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object v4

    .line 20
    check-cast v4, Landroid/content/Context;

    .line 21
    .line 22
    invoke-static/range {p2 .. p2}, Ll/d0t0;->q8(Ljava/lang/String;)Landroid/os/Bundle;

    .line 23
    .line 24
    .line 25
    move-result-object v6

    .line 26
    invoke-virtual {p0, v0}, Ll/d0t0;->p8(Lcom/google/android/gms/ads/internal/client/zzl;)Landroid/os/Bundle;

    .line 27
    .line 28
    .line 29
    move-result-object v7

    .line 30
    invoke-static {v0}, Ll/d0t0;->r8(Lcom/google/android/gms/ads/internal/client/zzl;)Z

    .line 31
    .line 32
    .line 33
    move-result v8

    .line 34
    iget-object v9, v0, Lcom/google/android/gms/ads/internal/client/zzl;->zzk:Landroid/location/Location;

    .line 35
    .line 36
    iget v10, v0, Lcom/google/android/gms/ads/internal/client/zzl;->zzg:I

    .line 37
    .line 38
    iget v11, v0, Lcom/google/android/gms/ads/internal/client/zzl;->zzt:I

    .line 39
    .line 40
    invoke-static/range {p2 .. p3}, Ll/d0t0;->s8(Ljava/lang/String;Lcom/google/android/gms/ads/internal/client/zzl;)Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object v12

    .line 44
    iget-object v13, p0, Ll/d0t0;->b:Ljava/lang/String;

    .line 45
    .line 46
    move-object v5, p1

    .line 47
    invoke-direct/range {v3 .. v13}, Ll/w7y;-><init>(Landroid/content/Context;Ljava/lang/String;Landroid/os/Bundle;Landroid/os/Bundle;ZLandroid/location/Location;IILjava/lang/String;Ljava/lang/String;)V

    .line 48
    .line 49
    .line 50
    invoke-virtual {v2, v3, v1}, Lcom/google/android/gms/ads/mediation/rtb/RtbAdapter;->loadRtbAppOpenAd(Ll/w7y;Ll/t7y;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 51
    .line 52
    .line 53
    return-void

    .line 54
    :catchall_0
    move-exception v0

    .line 55
    move-object p0, v0

    .line 56
    const-string v0, "Adapter failed to render app open ad."

    .line 57
    .line 58
    invoke-static {v0, p0}, Ll/dct0;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 59
    .line 60
    .line 61
    const-string v0, "adapter.loadRtbAppOpenAd"

    .line 62
    .line 63
    move-object/from16 v1, p4

    .line 64
    .line 65
    invoke-static {v1, p0, v0}, Ll/rws0;->a(Ll/p1m;Ljava/lang/Throwable;Ljava/lang/String;)V

    .line 66
    .line 67
    .line 68
    invoke-static {}, Ll/pqy0;->a()V

    .line 69
    .line 70
    .line 71
    return-void
.end method

.method public final zze()Ll/lpu0;
    .locals 2
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/d0t0;->a:Lcom/google/android/gms/ads/mediation/rtb/RtbAdapter;

    .line 2
    .line 3
    instance-of v0, p0, Ll/lar0;

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    :try_start_0
    check-cast p0, Ll/lar0;

    .line 9
    .line 10
    invoke-interface {p0}, Ll/lar0;->getVideoController()Ll/lpu0;

    .line 11
    .line 12
    .line 13
    move-result-object p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 14
    return-object p0

    .line 15
    :catchall_0
    move-exception p0

    .line 16
    const-string v0, ""

    .line 17
    .line 18
    invoke-static {v0, p0}, Ll/dct0;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 19
    .line 20
    .line 21
    :cond_0
    return-object v1
.end method

.method public final zzf()Lcom/google/android/gms/internal/ads/zzbvg;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/d0t0;->a:Lcom/google/android/gms/ads/mediation/rtb/RtbAdapter;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/b80;->getVersionInfo()Ll/r9l0;

    .line 4
    .line 5
    .line 6
    const/4 p0, 0x0

    .line 7
    invoke-static {p0}, Lcom/google/android/gms/internal/ads/zzbvg;->g(Ll/r9l0;)Lcom/google/android/gms/internal/ads/zzbvg;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public final zzg()Lcom/google/android/gms/internal/ads/zzbvg;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/d0t0;->a:Lcom/google/android/gms/ads/mediation/rtb/RtbAdapter;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/b80;->getSDKVersionInfo()Ll/r9l0;

    .line 4
    .line 5
    .line 6
    const/4 p0, 0x0

    .line 7
    invoke-static {p0}, Lcom/google/android/gms/internal/ads/zzbvg;->g(Ll/r9l0;)Lcom/google/android/gms/internal/ads/zzbvg;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

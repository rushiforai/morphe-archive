.class public final Ll/fgv0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/ucv0;


# instance fields
.field public final a:Landroid/content/Context;

.field public final b:Ll/qju0;

.field public c:Ll/rxs0;

.field public final d:Lcom/google/android/gms/internal/ads/zzcei;


# direct methods
.method public constructor <init>(Landroid/content/Context;Ll/qju0;Lcom/google/android/gms/internal/ads/zzcei;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/fgv0;->a:Landroid/content/Context;

    .line 5
    .line 6
    iput-object p2, p0, Ll/fgv0;->b:Ll/qju0;

    .line 7
    .line 8
    iput-object p3, p0, Ll/fgv0;->d:Lcom/google/android/gms/internal/ads/zzcei;

    .line 9
    .line 10
    return-void
.end method

.method public static bridge synthetic c(Ll/fgv0;Ll/rxs0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/fgv0;->c:Ll/rxs0;

    .line 2
    .line 3
    return-void
.end method


# virtual methods
.method public final bridge synthetic a(Ll/b7w0;Ll/q6w0;Ll/scv0;)Ljava/lang/Object;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/gms/internal/ads/zzfho;,
            Lcom/google/android/gms/internal/ads/zzeml;
        }
    .end annotation

    .line 1
    iget-object v0, p1, Ll/b7w0;->a:Ll/y6w0;

    .line 2
    .line 3
    iget-object v0, v0, Ll/y6w0;->a:Ll/o7w0;

    .line 4
    .line 5
    iget-object v0, v0, Ll/o7w0;->g:Ljava/util/ArrayList;

    .line 6
    .line 7
    const/4 v1, 0x6

    .line 8
    invoke-static {v1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-eqz v0, :cond_1

    .line 17
    .line 18
    iget-object v0, p0, Ll/fgv0;->c:Ll/rxs0;

    .line 19
    .line 20
    invoke-static {v0}, Ll/ulu0;->g0(Ll/rxs0;)Ll/ulu0;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    iget-object v1, p1, Ll/b7w0;->a:Ll/y6w0;

    .line 25
    .line 26
    iget-object v1, v1, Ll/y6w0;->a:Ll/o7w0;

    .line 27
    .line 28
    invoke-virtual {v0}, Ll/ulu0;->P()I

    .line 29
    .line 30
    .line 31
    move-result v2

    .line 32
    invoke-static {v2}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object v2

    .line 36
    iget-object v1, v1, Ll/o7w0;->g:Ljava/util/ArrayList;

    .line 37
    .line 38
    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    .line 39
    .line 40
    .line 41
    move-result v1

    .line 42
    if-eqz v1, :cond_0

    .line 43
    .line 44
    iget-object v1, p0, Ll/fgv0;->b:Ll/qju0;

    .line 45
    .line 46
    iget-object v2, p3, Ll/scv0;->a:Ljava/lang/String;

    .line 47
    .line 48
    new-instance v3, Ll/a0u0;

    .line 49
    .line 50
    invoke-direct {v3, p1, p2, v2}, Ll/a0u0;-><init>(Ll/b7w0;Ll/q6w0;Ljava/lang/String;)V

    .line 51
    .line 52
    .line 53
    new-instance p1, Ll/gmu0;

    .line 54
    .line 55
    invoke-direct {p1, v0}, Ll/gmu0;-><init>(Ll/ulu0;)V

    .line 56
    .line 57
    .line 58
    new-instance p2, Ll/jou0;

    .line 59
    .line 60
    iget-object p0, p0, Ll/fgv0;->c:Ll/rxs0;

    .line 61
    .line 62
    const/4 v0, 0x0

    .line 63
    invoke-direct {p2, v0, v0, p0}, Ll/jou0;-><init>(Ll/oxs0;Ll/nxs0;Ll/rxs0;)V

    .line 64
    .line 65
    .line 66
    invoke-virtual {v1, v3, p1, p2}, Ll/qju0;->d(Ll/a0u0;Ll/gmu0;Ll/jou0;)Ll/wlu0;

    .line 67
    .line 68
    .line 69
    move-result-object p0

    .line 70
    iget-object p1, p3, Ll/scv0;->c:Ll/g8u0;

    .line 71
    .line 72
    check-cast p1, Ll/vev0;

    .line 73
    .line 74
    invoke-virtual {p0}, Ll/lzt0;->f()Ll/wiv0;

    .line 75
    .line 76
    .line 77
    move-result-object p2

    .line 78
    invoke-virtual {p1, p2}, Ll/vev0;->p8(Ll/jxs0;)V

    .line 79
    .line 80
    .line 81
    invoke-virtual {p0}, Ll/xlu0;->h()Ll/ilu0;

    .line 82
    .line 83
    .line 84
    move-result-object p0

    .line 85
    return-object p0

    .line 86
    :cond_0
    new-instance p0, Lcom/google/android/gms/internal/ads/zzeml;

    .line 87
    .line 88
    const/4 p1, 0x1

    .line 89
    const-string p2, "No corresponding native ad listener"

    .line 90
    .line 91
    invoke-direct {p0, p1, p2}, Lcom/google/android/gms/internal/ads/zzeml;-><init>(ILjava/lang/String;)V

    .line 92
    .line 93
    .line 94
    throw p0

    .line 95
    :cond_1
    new-instance p0, Lcom/google/android/gms/internal/ads/zzeml;

    .line 96
    .line 97
    const/4 p1, 0x2

    .line 98
    const-string p2, "Unified must be used for RTB."

    .line 99
    .line 100
    invoke-direct {p0, p1, p2}, Lcom/google/android/gms/internal/ads/zzeml;-><init>(ILjava/lang/String;)V

    .line 101
    .line 102
    .line 103
    throw p0
.end method

.method public final b(Ll/b7w0;Ll/q6w0;Ll/scv0;)V
    .locals 11
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/gms/internal/ads/zzfho;
        }
    .end annotation

    .line 1
    :try_start_0
    iget-object v0, p3, Ll/scv0;->b:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Ll/hzs0;

    .line 4
    .line 5
    iget-object v1, p2, Ll/q6w0;->a0:Ljava/lang/String;

    .line 6
    .line 7
    invoke-interface {v0, v1}, Ll/hzs0;->T(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Ll/fgv0;->d:Lcom/google/android/gms/internal/ads/zzcei;

    .line 11
    .line 12
    iget v0, v0, Lcom/google/android/gms/internal/ads/zzcei;->zzc:I

    .line 13
    .line 14
    sget-object v1, Ll/sgs0;->H1:Ll/dgs0;

    .line 15
    .line 16
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 17
    .line 18
    .line 19
    move-result-object v2

    .line 20
    invoke-virtual {v2, v1}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    check-cast v1, Ljava/lang/Integer;

    .line 25
    .line 26
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 27
    .line 28
    .line 29
    move-result v1
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 30
    iget-object v2, p3, Ll/scv0;->b:Ljava/lang/Object;

    .line 31
    .line 32
    const/4 v3, 0x0

    .line 33
    if-ge v0, v1, :cond_0

    .line 34
    .line 35
    :try_start_1
    move-object v4, v2

    .line 36
    check-cast v4, Ll/hzs0;

    .line 37
    .line 38
    iget-object v5, p2, Ll/q6w0;->V:Ljava/lang/String;

    .line 39
    .line 40
    iget-object p2, p2, Ll/q6w0;->w:Lorg/json/JSONObject;

    .line 41
    .line 42
    invoke-virtual {p2}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object v6

    .line 46
    iget-object p1, p1, Ll/b7w0;->a:Ll/y6w0;

    .line 47
    .line 48
    iget-object p1, p1, Ll/y6w0;->a:Ll/o7w0;

    .line 49
    .line 50
    iget-object v7, p1, Ll/o7w0;->d:Lcom/google/android/gms/ads/internal/client/zzl;

    .line 51
    .line 52
    iget-object p1, p0, Ll/fgv0;->a:Landroid/content/Context;

    .line 53
    .line 54
    invoke-static {p1}, Ll/h950;->Y2(Ljava/lang/Object;)Ll/p1m;

    .line 55
    .line 56
    .line 57
    move-result-object v8

    .line 58
    new-instance v9, Ll/egv0;

    .line 59
    .line 60
    invoke-direct {v9, p0, p3, v3}, Ll/egv0;-><init>(Ll/fgv0;Ll/scv0;Ll/dgv0;)V

    .line 61
    .line 62
    .line 63
    iget-object p0, p3, Ll/scv0;->c:Ll/g8u0;

    .line 64
    .line 65
    move-object v10, p0

    .line 66
    check-cast v10, Ll/jxs0;

    .line 67
    .line 68
    invoke-interface/range {v4 .. v10}, Ll/hzs0;->T0(Ljava/lang/String;Ljava/lang/String;Lcom/google/android/gms/ads/internal/client/zzl;Ll/p1m;Ll/bzs0;Ll/jxs0;)V

    .line 69
    .line 70
    .line 71
    return-void

    .line 72
    :cond_0
    move-object v0, v2

    .line 73
    check-cast v0, Ll/hzs0;

    .line 74
    .line 75
    iget-object v1, p2, Ll/q6w0;->V:Ljava/lang/String;

    .line 76
    .line 77
    iget-object p2, p2, Ll/q6w0;->w:Lorg/json/JSONObject;

    .line 78
    .line 79
    invoke-virtual {p2}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 80
    .line 81
    .line 82
    move-result-object v2

    .line 83
    iget-object p2, p1, Ll/b7w0;->a:Ll/y6w0;

    .line 84
    .line 85
    iget-object p2, p2, Ll/y6w0;->a:Ll/o7w0;

    .line 86
    .line 87
    iget-object p2, p2, Ll/o7w0;->d:Lcom/google/android/gms/ads/internal/client/zzl;

    .line 88
    .line 89
    iget-object v4, p0, Ll/fgv0;->a:Landroid/content/Context;

    .line 90
    .line 91
    invoke-static {v4}, Ll/h950;->Y2(Ljava/lang/Object;)Ll/p1m;

    .line 92
    .line 93
    .line 94
    move-result-object v4

    .line 95
    new-instance v5, Ll/egv0;

    .line 96
    .line 97
    invoke-direct {v5, p0, p3, v3}, Ll/egv0;-><init>(Ll/fgv0;Ll/scv0;Ll/dgv0;)V

    .line 98
    .line 99
    .line 100
    iget-object p0, p3, Ll/scv0;->c:Ll/g8u0;

    .line 101
    .line 102
    move-object v6, p0

    .line 103
    check-cast v6, Ll/jxs0;

    .line 104
    .line 105
    iget-object p0, p1, Ll/b7w0;->a:Ll/y6w0;

    .line 106
    .line 107
    iget-object p0, p0, Ll/y6w0;->a:Ll/o7w0;

    .line 108
    .line 109
    iget-object v7, p0, Ll/o7w0;->i:Lcom/google/android/gms/internal/ads/zzbjb;

    .line 110
    .line 111
    move-object v3, p2

    .line 112
    invoke-interface/range {v0 .. v7}, Ll/hzs0;->X3(Ljava/lang/String;Ljava/lang/String;Lcom/google/android/gms/ads/internal/client/zzl;Ll/p1m;Ll/bzs0;Ll/jxs0;Lcom/google/android/gms/internal/ads/zzbjb;)V
    :try_end_1
    .catch Landroid/os/RemoteException; {:try_start_1 .. :try_end_1} :catch_0

    .line 113
    .line 114
    .line 115
    return-void

    .line 116
    :catch_0
    move-exception v0

    .line 117
    move-object p0, v0

    .line 118
    invoke-static {p0}, Ll/guu0;->a(Ljava/lang/Throwable;)V

    .line 119
    .line 120
    .line 121
    return-void
.end method

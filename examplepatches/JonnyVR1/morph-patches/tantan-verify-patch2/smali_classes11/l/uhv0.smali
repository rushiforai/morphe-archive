.class public final Ll/uhv0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/ucv0;


# instance fields
.field public final a:Landroid/content/Context;

.field public final b:Ll/psu0;


# direct methods
.method public constructor <init>(Landroid/content/Context;Ll/psu0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/uhv0;->a:Landroid/content/Context;

    .line 5
    .line 6
    iput-object p2, p0, Ll/uhv0;->b:Ll/psu0;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final bridge synthetic a(Ll/b7w0;Ll/q6w0;Ll/scv0;)Ljava/lang/Object;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/gms/internal/ads/zzfho;,
            Lcom/google/android/gms/internal/ads/zzeml;
        }
    .end annotation

    .line 1
    new-instance v0, Ll/efv0;

    .line 2
    .line 3
    iget-object v1, p3, Ll/scv0;->b:Ljava/lang/Object;

    .line 4
    .line 5
    check-cast v1, Ll/hzs0;

    .line 6
    .line 7
    sget-object v2, Lcom/google/android/gms/ads/AdFormat;->REWARDED:Lcom/google/android/gms/ads/AdFormat;

    .line 8
    .line 9
    invoke-direct {v0, p2, v1, v2}, Ll/efv0;-><init>(Ll/q6w0;Ll/hzs0;Lcom/google/android/gms/ads/AdFormat;)V

    .line 10
    .line 11
    .line 12
    new-instance v1, Ll/a0u0;

    .line 13
    .line 14
    iget-object v2, p3, Ll/scv0;->a:Ljava/lang/String;

    .line 15
    .line 16
    invoke-direct {v1, p1, p2, v2}, Ll/a0u0;-><init>(Ll/b7w0;Ll/q6w0;Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    new-instance p1, Ll/msu0;

    .line 20
    .line 21
    invoke-direct {p1, v0}, Ll/msu0;-><init>(Ll/wiu0;)V

    .line 22
    .line 23
    .line 24
    iget-object p0, p0, Ll/uhv0;->b:Ll/psu0;

    .line 25
    .line 26
    invoke-virtual {p0, v1, p1}, Ll/psu0;->b(Ll/a0u0;Ll/msu0;)Ll/lsu0;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    invoke-virtual {p0}, Ll/lzt0;->b()Ll/h7u0;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    invoke-virtual {v0, p1}, Ll/efv0;->b(Ll/h7u0;)V

    .line 35
    .line 36
    .line 37
    iget-object p1, p3, Ll/scv0;->c:Ll/g8u0;

    .line 38
    .line 39
    check-cast p1, Ll/vev0;

    .line 40
    .line 41
    invoke-virtual {p0}, Ll/lsu0;->n()Ll/viv0;

    .line 42
    .line 43
    .line 44
    move-result-object p2

    .line 45
    invoke-virtual {p1, p2}, Ll/vev0;->p8(Ll/jxs0;)V

    .line 46
    .line 47
    .line 48
    invoke-virtual {p0}, Ll/lsu0;->k()Ll/ksu0;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    return-object p0
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
    iget-object v0, p1, Ll/b7w0;->a:Ll/y6w0;

    .line 11
    .line 12
    iget-object v0, v0, Ll/y6w0;->a:Ll/o7w0;

    .line 13
    .line 14
    iget-object v0, v0, Ll/o7w0;->o:Ll/x6w0;

    .line 15
    .line 16
    iget v0, v0, Ll/x6w0;->a:I
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 17
    .line 18
    iget-object v1, p3, Ll/scv0;->b:Ljava/lang/Object;

    .line 19
    .line 20
    const/4 v2, 0x0

    .line 21
    const/4 v3, 0x3

    .line 22
    if-ne v0, v3, :cond_0

    .line 23
    .line 24
    :try_start_1
    move-object v4, v1

    .line 25
    check-cast v4, Ll/hzs0;

    .line 26
    .line 27
    iget-object v5, p2, Ll/q6w0;->V:Ljava/lang/String;

    .line 28
    .line 29
    iget-object p2, p2, Ll/q6w0;->w:Lorg/json/JSONObject;

    .line 30
    .line 31
    invoke-virtual {p2}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v6

    .line 35
    iget-object p1, p1, Ll/b7w0;->a:Ll/y6w0;

    .line 36
    .line 37
    iget-object p1, p1, Ll/y6w0;->a:Ll/o7w0;

    .line 38
    .line 39
    iget-object v7, p1, Ll/o7w0;->d:Lcom/google/android/gms/ads/internal/client/zzl;

    .line 40
    .line 41
    iget-object p1, p0, Ll/uhv0;->a:Landroid/content/Context;

    .line 42
    .line 43
    invoke-static {p1}, Ll/h950;->Y2(Ljava/lang/Object;)Ll/p1m;

    .line 44
    .line 45
    .line 46
    move-result-object v8

    .line 47
    new-instance v9, Ll/thv0;

    .line 48
    .line 49
    invoke-direct {v9, p0, p3, v2}, Ll/thv0;-><init>(Ll/uhv0;Ll/scv0;Ll/shv0;)V

    .line 50
    .line 51
    .line 52
    iget-object p0, p3, Ll/scv0;->c:Ll/g8u0;

    .line 53
    .line 54
    move-object v10, p0

    .line 55
    check-cast v10, Ll/jxs0;

    .line 56
    .line 57
    invoke-interface/range {v4 .. v10}, Ll/hzs0;->I7(Ljava/lang/String;Ljava/lang/String;Lcom/google/android/gms/ads/internal/client/zzl;Ll/p1m;Ll/ezs0;Ll/jxs0;)V

    .line 58
    .line 59
    .line 60
    return-void

    .line 61
    :cond_0
    move-object v0, v1

    .line 62
    check-cast v0, Ll/hzs0;

    .line 63
    .line 64
    iget-object v1, p2, Ll/q6w0;->V:Ljava/lang/String;

    .line 65
    .line 66
    iget-object p2, p2, Ll/q6w0;->w:Lorg/json/JSONObject;

    .line 67
    .line 68
    invoke-virtual {p2}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    move-result-object p2

    .line 72
    iget-object p1, p1, Ll/b7w0;->a:Ll/y6w0;

    .line 73
    .line 74
    iget-object p1, p1, Ll/y6w0;->a:Ll/o7w0;

    .line 75
    .line 76
    iget-object v3, p1, Ll/o7w0;->d:Lcom/google/android/gms/ads/internal/client/zzl;

    .line 77
    .line 78
    iget-object p1, p0, Ll/uhv0;->a:Landroid/content/Context;

    .line 79
    .line 80
    invoke-static {p1}, Ll/h950;->Y2(Ljava/lang/Object;)Ll/p1m;

    .line 81
    .line 82
    .line 83
    move-result-object v4

    .line 84
    new-instance v5, Ll/thv0;

    .line 85
    .line 86
    invoke-direct {v5, p0, p3, v2}, Ll/thv0;-><init>(Ll/uhv0;Ll/scv0;Ll/shv0;)V

    .line 87
    .line 88
    .line 89
    iget-object p0, p3, Ll/scv0;->c:Ll/g8u0;

    .line 90
    .line 91
    move-object v6, p0

    .line 92
    check-cast v6, Ll/jxs0;

    .line 93
    .line 94
    move-object v2, p2

    .line 95
    invoke-interface/range {v0 .. v6}, Ll/hzs0;->t7(Ljava/lang/String;Ljava/lang/String;Lcom/google/android/gms/ads/internal/client/zzl;Ll/p1m;Ll/ezs0;Ll/jxs0;)V
    :try_end_1
    .catch Landroid/os/RemoteException; {:try_start_1 .. :try_end_1} :catch_0

    .line 96
    .line 97
    .line 98
    return-void

    .line 99
    :catch_0
    move-exception v0

    .line 100
    move-object p0, v0

    .line 101
    const-string p1, "Remote exception loading a rewarded RTB ad"

    .line 102
    .line 103
    invoke-static {p1, p0}, Ll/d2v0;->l(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 104
    .line 105
    .line 106
    return-void
.end method

.class public final Ll/kfv0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/ucv0;


# instance fields
.field public final a:Landroid/content/Context;

.field public final b:Ll/piu0;


# direct methods
.method public constructor <init>(Landroid/content/Context;Ll/piu0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/kfv0;->a:Landroid/content/Context;

    .line 5
    .line 6
    iput-object p2, p0, Ll/kfv0;->b:Ll/piu0;

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
    sget-object v2, Lcom/google/android/gms/ads/AdFormat;->INTERSTITIAL:Lcom/google/android/gms/ads/AdFormat;

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
    new-instance p1, Ll/lhu0;

    .line 20
    .line 21
    const/4 p2, 0x0

    .line 22
    invoke-direct {p1, v0, p2}, Ll/lhu0;-><init>(Ll/wiu0;Ll/wit0;)V

    .line 23
    .line 24
    .line 25
    iget-object p0, p0, Ll/kfv0;->b:Ll/piu0;

    .line 26
    .line 27
    invoke-virtual {p0, v1, p1}, Ll/piu0;->c(Ll/a0u0;Ll/lhu0;)Ll/ihu0;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-virtual {p0}, Ll/ihu0;->b()Ll/h7u0;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    invoke-virtual {v0, p1}, Ll/efv0;->b(Ll/h7u0;)V

    .line 36
    .line 37
    .line 38
    iget-object p1, p3, Ll/scv0;->c:Ll/g8u0;

    .line 39
    .line 40
    check-cast p1, Ll/vev0;

    .line 41
    .line 42
    invoke-virtual {p0}, Ll/lzt0;->f()Ll/wiv0;

    .line 43
    .line 44
    .line 45
    move-result-object p2

    .line 46
    invoke-virtual {p1, p2}, Ll/vev0;->p8(Ll/jxs0;)V

    .line 47
    .line 48
    .line 49
    invoke-virtual {p0}, Ll/ihu0;->i()Ll/hhu0;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    return-object p0
.end method

.method public final b(Ll/b7w0;Ll/q6w0;Ll/scv0;)V
    .locals 8
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
    iget-object v0, p3, Ll/scv0;->b:Ljava/lang/Object;

    .line 11
    .line 12
    move-object v1, v0

    .line 13
    check-cast v1, Ll/hzs0;

    .line 14
    .line 15
    iget-object v2, p2, Ll/q6w0;->V:Ljava/lang/String;

    .line 16
    .line 17
    iget-object p2, p2, Ll/q6w0;->w:Lorg/json/JSONObject;

    .line 18
    .line 19
    invoke-virtual {p2}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v3

    .line 23
    iget-object p1, p1, Ll/b7w0;->a:Ll/y6w0;

    .line 24
    .line 25
    iget-object p1, p1, Ll/y6w0;->a:Ll/o7w0;

    .line 26
    .line 27
    iget-object v4, p1, Ll/o7w0;->d:Lcom/google/android/gms/ads/internal/client/zzl;

    .line 28
    .line 29
    iget-object p1, p0, Ll/kfv0;->a:Landroid/content/Context;

    .line 30
    .line 31
    invoke-static {p1}, Ll/h950;->Y2(Ljava/lang/Object;)Ll/p1m;

    .line 32
    .line 33
    .line 34
    move-result-object v5

    .line 35
    new-instance v6, Ll/jfv0;

    .line 36
    .line 37
    const/4 p1, 0x0

    .line 38
    invoke-direct {v6, p0, p3, p1}, Ll/jfv0;-><init>(Ll/kfv0;Ll/scv0;Ll/ifv0;)V

    .line 39
    .line 40
    .line 41
    iget-object p0, p3, Ll/scv0;->c:Ll/g8u0;

    .line 42
    .line 43
    move-object v7, p0

    .line 44
    check-cast v7, Ll/jxs0;

    .line 45
    .line 46
    invoke-interface/range {v1 .. v7}, Ll/hzs0;->b3(Ljava/lang/String;Ljava/lang/String;Lcom/google/android/gms/ads/internal/client/zzl;Ll/p1m;Ll/yys0;Ll/jxs0;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 47
    .line 48
    .line 49
    return-void

    .line 50
    :catch_0
    move-exception v0

    .line 51
    move-object p0, v0

    .line 52
    const-string p1, "Remote exception loading a interstitial RTB ad"

    .line 53
    .line 54
    invoke-static {p1, p0}, Ll/d2v0;->l(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 55
    .line 56
    .line 57
    invoke-static {p0}, Ll/guu0;->a(Ljava/lang/Throwable;)V

    .line 58
    .line 59
    .line 60
    return-void
.end method

.class public final Ll/gfv0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/ucv0;


# instance fields
.field public final a:Landroid/content/Context;

.field public final b:Ll/piu0;

.field public final c:Lcom/google/android/gms/internal/ads/zzcei;

.field public final d:Ljava/util/concurrent/Executor;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/google/android/gms/internal/ads/zzcei;Ll/piu0;Ljava/util/concurrent/Executor;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/gfv0;->a:Landroid/content/Context;

    .line 5
    .line 6
    iput-object p2, p0, Ll/gfv0;->c:Lcom/google/android/gms/internal/ads/zzcei;

    .line 7
    .line 8
    iput-object p3, p0, Ll/gfv0;->b:Ll/piu0;

    .line 9
    .line 10
    iput-object p4, p0, Ll/gfv0;->d:Ljava/util/concurrent/Executor;

    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public final bridge synthetic a(Ll/b7w0;Ll/q6w0;Ll/scv0;)Ljava/lang/Object;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/gms/internal/ads/zzfho;,
            Lcom/google/android/gms/internal/ads/zzeml;
        }
    .end annotation

    .line 1
    new-instance v0, Ll/a0u0;

    .line 2
    .line 3
    iget-object v1, p3, Ll/scv0;->a:Ljava/lang/String;

    .line 4
    .line 5
    invoke-direct {v0, p1, p2, v1}, Ll/a0u0;-><init>(Ll/b7w0;Ll/q6w0;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    new-instance p1, Ll/lhu0;

    .line 9
    .line 10
    new-instance p2, Ll/ffv0;

    .line 11
    .line 12
    invoke-direct {p2, p0, p3}, Ll/ffv0;-><init>(Ll/gfv0;Ll/scv0;)V

    .line 13
    .line 14
    .line 15
    const/4 v1, 0x0

    .line 16
    invoke-direct {p1, p2, v1}, Ll/lhu0;-><init>(Ll/wiu0;Ll/wit0;)V

    .line 17
    .line 18
    .line 19
    iget-object p2, p0, Ll/gfv0;->b:Ll/piu0;

    .line 20
    .line 21
    invoke-virtual {p2, v0, p1}, Ll/piu0;->c(Ll/a0u0;Ll/lhu0;)Ll/ihu0;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    invoke-virtual {p1}, Ll/lzt0;->c()Ll/o7u0;

    .line 26
    .line 27
    .line 28
    move-result-object p2

    .line 29
    new-instance v0, Ll/ntt0;

    .line 30
    .line 31
    iget-object v1, p3, Ll/scv0;->b:Ljava/lang/Object;

    .line 32
    .line 33
    check-cast v1, Ll/r8w0;

    .line 34
    .line 35
    invoke-direct {v0, v1}, Ll/ntt0;-><init>(Ll/r8w0;)V

    .line 36
    .line 37
    .line 38
    iget-object p0, p0, Ll/gfv0;->d:Ljava/util/concurrent/Executor;

    .line 39
    .line 40
    invoke-virtual {p2, v0, p0}, Ll/kdu0;->q0(Ljava/lang/Object;Ljava/util/concurrent/Executor;)V

    .line 41
    .line 42
    .line 43
    iget-object p0, p3, Ll/scv0;->c:Ll/g8u0;

    .line 44
    .line 45
    check-cast p0, Ll/vev0;

    .line 46
    .line 47
    invoke-virtual {p1}, Ll/lzt0;->g()Ll/ijv0;

    .line 48
    .line 49
    .line 50
    move-result-object p2

    .line 51
    invoke-virtual {p0, p2}, Ll/vev0;->p8(Ll/jxs0;)V

    .line 52
    .line 53
    .line 54
    invoke-virtual {p1}, Ll/ihu0;->i()Ll/hhu0;

    .line 55
    .line 56
    .line 57
    move-result-object p0

    .line 58
    return-object p0
.end method

.method public final b(Ll/b7w0;Ll/q6w0;Ll/scv0;)V
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/gms/internal/ads/zzfho;
        }
    .end annotation

    .line 1
    iget-object v0, p3, Ll/scv0;->b:Ljava/lang/Object;

    .line 2
    .line 3
    move-object v1, v0

    .line 4
    check-cast v1, Ll/r8w0;

    .line 5
    .line 6
    iget-object p1, p1, Ll/b7w0;->a:Ll/y6w0;

    .line 7
    .line 8
    iget-object p1, p1, Ll/y6w0;->a:Ll/o7w0;

    .line 9
    .line 10
    iget-object v0, p2, Ll/q6w0;->w:Lorg/json/JSONObject;

    .line 11
    .line 12
    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v4

    .line 16
    iget-object p2, p2, Ll/q6w0;->t:Ll/u6w0;

    .line 17
    .line 18
    invoke-static {p2}, Ll/v0t0;->l(Ll/u6w0;)Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v5

    .line 22
    iget-object v2, p0, Ll/gfv0;->a:Landroid/content/Context;

    .line 23
    .line 24
    iget-object v3, p1, Ll/o7w0;->d:Lcom/google/android/gms/ads/internal/client/zzl;

    .line 25
    .line 26
    iget-object p0, p3, Ll/scv0;->c:Ll/g8u0;

    .line 27
    .line 28
    move-object v6, p0

    .line 29
    check-cast v6, Ll/jxs0;

    .line 30
    .line 31
    invoke-virtual/range {v1 .. v6}, Ll/r8w0;->t(Landroid/content/Context;Lcom/google/android/gms/ads/internal/client/zzl;Ljava/lang/String;Ljava/lang/String;Ll/jxs0;)V

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public final synthetic c(Ll/scv0;ZLandroid/content/Context;Ll/c7u0;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/gms/internal/ads/zzdkv;
        }
    .end annotation

    .line 1
    :try_start_0
    iget-object p4, p1, Ll/scv0;->b:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast p4, Ll/r8w0;

    .line 4
    .line 5
    invoke-virtual {p4, p2}, Ll/r8w0;->A(Z)V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Ll/gfv0;->c:Lcom/google/android/gms/internal/ads/zzcei;

    .line 9
    .line 10
    iget p0, p0, Lcom/google/android/gms/internal/ads/zzcei;->zzc:I

    .line 11
    .line 12
    sget-object p2, Ll/sgs0;->H0:Ll/dgs0;

    .line 13
    .line 14
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 15
    .line 16
    .line 17
    move-result-object p4

    .line 18
    invoke-virtual {p4, p2}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object p2

    .line 22
    check-cast p2, Ljava/lang/Integer;

    .line 23
    .line 24
    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    .line 25
    .line 26
    .line 27
    move-result p2
    :try_end_0
    .catch Lcom/google/android/gms/internal/ads/zzfho; {:try_start_0 .. :try_end_0} :catch_0

    .line 28
    iget-object p1, p1, Ll/scv0;->b:Ljava/lang/Object;

    .line 29
    .line 30
    if-ge p0, p2, :cond_0

    .line 31
    .line 32
    :try_start_1
    check-cast p1, Ll/r8w0;

    .line 33
    .line 34
    invoke-virtual {p1}, Ll/r8w0;->C()V

    .line 35
    .line 36
    .line 37
    return-void

    .line 38
    :cond_0
    check-cast p1, Ll/r8w0;

    .line 39
    .line 40
    invoke-virtual {p1, p3}, Ll/r8w0;->D(Landroid/content/Context;)V
    :try_end_1
    .catch Lcom/google/android/gms/internal/ads/zzfho; {:try_start_1 .. :try_end_1} :catch_0

    .line 41
    .line 42
    .line 43
    return-void

    .line 44
    :catch_0
    move-exception p0

    .line 45
    const-string p1, "Cannot show interstitial."

    .line 46
    .line 47
    invoke-static {p1}, Ll/dct0;->f(Ljava/lang/String;)V

    .line 48
    .line 49
    .line 50
    new-instance p1, Lcom/google/android/gms/internal/ads/zzdkv;

    .line 51
    .line 52
    invoke-virtual {p0}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    invoke-direct {p1, p0}, Lcom/google/android/gms/internal/ads/zzdkv;-><init>(Ljava/lang/Throwable;)V

    .line 57
    .line 58
    .line 59
    throw p1
.end method

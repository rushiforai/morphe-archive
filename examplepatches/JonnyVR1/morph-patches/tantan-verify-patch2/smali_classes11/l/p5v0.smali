.class public final Ll/p5v0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ll/xvw0;

.field public final b:Ll/q4v0;

.field public final c:Ll/kpx0;

.field public final d:Ll/hew0;

.field public final e:Landroid/content/Context;

.field public final f:Lcom/google/android/gms/internal/ads/zzcei;


# direct methods
.method public constructor <init>(Ll/xvw0;Ll/q4v0;Ll/kpx0;Ll/hew0;Landroid/content/Context;Lcom/google/android/gms/internal/ads/zzcei;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/p5v0;->a:Ll/xvw0;

    .line 5
    .line 6
    iput-object p2, p0, Ll/p5v0;->b:Ll/q4v0;

    .line 7
    .line 8
    iput-object p3, p0, Ll/p5v0;->c:Ll/kpx0;

    .line 9
    .line 10
    iput-object p4, p0, Ll/p5v0;->d:Ll/hew0;

    .line 11
    .line 12
    iput-object p5, p0, Ll/p5v0;->e:Landroid/content/Context;

    .line 13
    .line 14
    iput-object p6, p0, Ll/p5v0;->f:Lcom/google/android/gms/internal/ads/zzcei;

    .line 15
    .line 16
    return-void
.end method


# virtual methods
.method public final a(Lcom/google/android/gms/internal/ads/zzbze;)Ll/hpr;
    .locals 3

    .line 1
    new-instance v0, Ll/j5v0;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Ll/j5v0;-><init>(Lcom/google/android/gms/internal/ads/zzbze;)V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Ll/p5v0;->b:Ll/q4v0;

    .line 7
    .line 8
    invoke-static {v1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    new-instance v2, Ll/k5v0;

    .line 12
    .line 13
    invoke-direct {v2, v1}, Ll/k5v0;-><init>(Ll/q4v0;)V

    .line 14
    .line 15
    .line 16
    new-instance v1, Ll/l5v0;

    .line 17
    .line 18
    invoke-direct {v1, p0}, Ll/l5v0;-><init>(Ll/p5v0;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p0, p1, v2, v1, v0}, Ll/p5v0;->h(Lcom/google/android/gms/internal/ads/zzbze;Ll/o5v0;Ll/o5v0;Ll/xuw0;)Ll/hpr;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    return-object p0
.end method

.method public final b(Lorg/json/JSONObject;)Ll/hpr;
    .locals 4

    .line 1
    invoke-static {}, Ll/bxy0;->h()Ll/fvs0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v1, p0, Ll/p5v0;->e:Landroid/content/Context;

    .line 6
    .line 7
    iget-object v2, p0, Ll/p5v0;->f:Lcom/google/android/gms/internal/ads/zzcei;

    .line 8
    .line 9
    iget-object v3, p0, Ll/p5v0;->d:Ll/hew0;

    .line 10
    .line 11
    invoke-virtual {v0, v1, v2, v3}, Ll/fvs0;->a(Landroid/content/Context;Lcom/google/android/gms/internal/ads/zzcei;Ll/hew0;)Ll/ovs0;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    sget-object v1, Ll/lvs0;->b:Ll/ivs0;

    .line 16
    .line 17
    sget-object v2, Ll/f5v0;->a:Ll/f5v0;

    .line 18
    .line 19
    const-string v3, "AFMA_getAdDictionary"

    .line 20
    .line 21
    invoke-virtual {v0, v3, v1, v2}, Ll/ovs0;->a(Ljava/lang/String;Ll/hvs0;Ll/gvs0;)Ll/evs0;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-static {p1}, Ll/pvw0;->h(Ljava/lang/Object;)Ll/hpr;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    invoke-static {p1}, Ll/gvw0;->C(Ll/hpr;)Ll/gvw0;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    iget-object p0, p0, Ll/p5v0;->a:Ll/xvw0;

    .line 34
    .line 35
    invoke-static {p1, v0, p0}, Ll/pvw0;->n(Ll/hpr;Ll/xuw0;Ljava/util/concurrent/Executor;)Ll/hpr;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    return-object p0
.end method

.method public final synthetic c(Ll/o5v0;Lcom/google/android/gms/internal/ads/zzbze;Ll/xuw0;Lcom/google/android/gms/internal/ads/zzecf;)Ll/hpr;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/p5v0;->a:Ll/xvw0;

    .line 2
    .line 3
    invoke-interface {p1, p2}, Ll/o5v0;->a(Lcom/google/android/gms/internal/ads/zzbze;)Ll/hpr;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-static {p1, p3, p0}, Ll/pvw0;->n(Ll/hpr;Ll/xuw0;Ljava/util/concurrent/Executor;)Ll/hpr;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public final synthetic d(Lcom/google/android/gms/internal/ads/zzbze;)Ll/hpr;
    .locals 1

    .line 1
    iget-object p0, p0, Ll/p5v0;->c:Ll/kpx0;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/kpx0;->zzb()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ll/u7v0;

    .line 8
    .line 9
    invoke-static {}, Landroid/os/Binder;->getCallingUid()I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    invoke-virtual {p0, p1, v0}, Ll/u7v0;->o8(Lcom/google/android/gms/internal/ads/zzbze;I)Ll/hpr;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0
.end method

.method public final synthetic e(Lcom/google/android/gms/internal/ads/zzbze;)Ll/hpr;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/p5v0;->b:Ll/q4v0;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/google/android/gms/internal/ads/zzbze;->zzh:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/q4v0;->c(Ljava/lang/String;)Ll/hpr;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public final synthetic f(Lcom/google/android/gms/internal/ads/zzbze;)Ll/hpr;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/p5v0;->c:Ll/kpx0;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/kpx0;->zzb()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ll/u7v0;

    .line 8
    .line 9
    iget-object p1, p1, Lcom/google/android/gms/internal/ads/zzbze;->zzh:Ljava/lang/String;

    .line 10
    .line 11
    invoke-virtual {p0, p1}, Ll/u7v0;->r8(Ljava/lang/String;)Ll/hpr;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public final g(Lcom/google/android/gms/internal/ads/zzbze;)Ll/hpr;
    .locals 3

    .line 1
    sget-object v0, Ll/g5v0;->a:Ll/g5v0;

    .line 2
    .line 3
    new-instance v1, Ll/h5v0;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/h5v0;-><init>(Ll/p5v0;)V

    .line 6
    .line 7
    .line 8
    new-instance v2, Ll/i5v0;

    .line 9
    .line 10
    invoke-direct {v2, p0}, Ll/i5v0;-><init>(Ll/p5v0;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p0, p1, v1, v2, v0}, Ll/p5v0;->h(Lcom/google/android/gms/internal/ads/zzbze;Ll/o5v0;Ll/o5v0;Ll/xuw0;)Ll/hpr;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0
.end method

.method public final h(Lcom/google/android/gms/internal/ads/zzbze;Ll/o5v0;Ll/o5v0;Ll/xuw0;)Ll/hpr;
    .locals 3

    .line 1
    iget-object v0, p1, Lcom/google/android/gms/internal/ads/zzbze;->zzd:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {}, Ll/bxy0;->r()Lcom/google/android/gms/ads/internal/util/b;

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Lcom/google/android/gms/ads/internal/util/b;->b(Ljava/lang/String;)Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    new-instance p2, Lcom/google/android/gms/internal/ads/zzecf;

    .line 13
    .line 14
    const/4 v0, 0x1

    .line 15
    invoke-direct {p2, v0}, Lcom/google/android/gms/internal/ads/zzecf;-><init>(I)V

    .line 16
    .line 17
    .line 18
    invoke-static {p2}, Ll/pvw0;->g(Ljava/lang/Throwable;)Ll/hpr;

    .line 19
    .line 20
    .line 21
    move-result-object p2

    .line 22
    goto :goto_0

    .line 23
    :cond_0
    invoke-interface {p2, p1}, Ll/o5v0;->a(Lcom/google/android/gms/internal/ads/zzbze;)Ll/hpr;

    .line 24
    .line 25
    .line 26
    move-result-object p2

    .line 27
    iget-object v0, p0, Ll/p5v0;->a:Ll/xvw0;

    .line 28
    .line 29
    const-class v1, Ljava/util/concurrent/ExecutionException;

    .line 30
    .line 31
    sget-object v2, Ll/n5v0;->a:Ll/n5v0;

    .line 32
    .line 33
    invoke-static {p2, v1, v2, v0}, Ll/pvw0;->f(Ll/hpr;Ljava/lang/Class;Ll/xuw0;Ljava/util/concurrent/Executor;)Ll/hpr;

    .line 34
    .line 35
    .line 36
    move-result-object p2

    .line 37
    :goto_0
    iget-object v0, p0, Ll/p5v0;->a:Ll/xvw0;

    .line 38
    .line 39
    invoke-static {p2}, Ll/gvw0;->C(Ll/hpr;)Ll/gvw0;

    .line 40
    .line 41
    .line 42
    move-result-object p2

    .line 43
    invoke-static {p2, p4, v0}, Ll/pvw0;->n(Ll/hpr;Ll/xuw0;Ljava/util/concurrent/Executor;)Ll/hpr;

    .line 44
    .line 45
    .line 46
    move-result-object p2

    .line 47
    new-instance v0, Ll/m5v0;

    .line 48
    .line 49
    invoke-direct {v0, p0, p3, p1, p4}, Ll/m5v0;-><init>(Ll/p5v0;Ll/o5v0;Lcom/google/android/gms/internal/ads/zzbze;Ll/xuw0;)V

    .line 50
    .line 51
    .line 52
    iget-object p0, p0, Ll/p5v0;->a:Ll/xvw0;

    .line 53
    .line 54
    const-class p1, Lcom/google/android/gms/internal/ads/zzecf;

    .line 55
    .line 56
    invoke-static {p2, p1, v0, p0}, Ll/pvw0;->f(Ll/hpr;Ljava/lang/Class;Ll/xuw0;Ljava/util/concurrent/Executor;)Ll/hpr;

    .line 57
    .line 58
    .line 59
    move-result-object p0

    .line 60
    return-object p0
.end method

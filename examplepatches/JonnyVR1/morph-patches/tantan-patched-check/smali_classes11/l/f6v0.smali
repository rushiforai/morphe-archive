.class public final Ll/f6v0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ll/xvw0;

.field public final b:Ll/xvw0;

.field public final c:Ll/x6v0;


# direct methods
.method public constructor <init>(Ll/xvw0;Ll/xvw0;Ll/x6v0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/f6v0;->a:Ll/xvw0;

    .line 5
    .line 6
    iput-object p2, p0, Ll/f6v0;->b:Ll/xvw0;

    .line 7
    .line 8
    iput-object p3, p0, Ll/f6v0;->c:Ll/x6v0;

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final synthetic a(Lcom/google/android/gms/internal/ads/zzbyi;)Ll/hpr;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    sget-object v0, Ll/sgs0;->Wa:Ll/dgs0;

    .line 2
    .line 3
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-virtual {v1, v0}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Ljava/lang/Long;

    .line 12
    .line 13
    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    .line 14
    .line 15
    .line 16
    move-result-wide v0

    .line 17
    iget-object p0, p0, Ll/f6v0;->c:Ll/x6v0;

    .line 18
    .line 19
    invoke-virtual {p0, p1, v0, v1}, Ll/x6v0;->c(Lcom/google/android/gms/internal/ads/zzbyi;J)Ll/hpr;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    return-object p0
.end method

.method public final b(Lcom/google/android/gms/internal/ads/zzbyi;)Ll/hpr;
    .locals 3

    .line 1
    iget-object v0, p1, Lcom/google/android/gms/internal/ads/zzbyi;->zzb:Ljava/lang/String;

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
    new-instance p1, Lcom/google/android/gms/internal/ads/zzecf;

    .line 13
    .line 14
    const/4 v0, 0x1

    .line 15
    const-string v1, "Ads signal service force local"

    .line 16
    .line 17
    invoke-direct {p1, v0, v1}, Lcom/google/android/gms/internal/ads/zzecf;-><init>(ILjava/lang/String;)V

    .line 18
    .line 19
    .line 20
    invoke-static {p1}, Ll/pvw0;->g(Ljava/lang/Throwable;)Ll/hpr;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    goto :goto_0

    .line 25
    :cond_0
    new-instance v0, Ll/w5v0;

    .line 26
    .line 27
    invoke-direct {v0, p0, p1}, Ll/w5v0;-><init>(Ll/f6v0;Lcom/google/android/gms/internal/ads/zzbyi;)V

    .line 28
    .line 29
    .line 30
    iget-object p1, p0, Ll/f6v0;->a:Ll/xvw0;

    .line 31
    .line 32
    invoke-static {v0, p1}, Ll/pvw0;->k(Ll/wuw0;Ljava/util/concurrent/Executor;)Ll/hpr;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    iget-object v0, p0, Ll/f6v0;->b:Ll/xvw0;

    .line 37
    .line 38
    const-class v1, Ljava/util/concurrent/ExecutionException;

    .line 39
    .line 40
    sget-object v2, Ll/x5v0;->a:Ll/x5v0;

    .line 41
    .line 42
    invoke-static {p1, v1, v2, v0}, Ll/pvw0;->f(Ll/hpr;Ljava/lang/Class;Ll/xuw0;Ljava/util/concurrent/Executor;)Ll/hpr;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    :goto_0
    iget-object v0, p0, Ll/f6v0;->b:Ll/xvw0;

    .line 47
    .line 48
    invoke-static {p1}, Ll/gvw0;->C(Ll/hpr;)Ll/gvw0;

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    const-class v1, Lcom/google/android/gms/internal/ads/zzecf;

    .line 53
    .line 54
    sget-object v2, Ll/y5v0;->a:Ll/y5v0;

    .line 55
    .line 56
    invoke-static {p1, v1, v2, v0}, Ll/pvw0;->f(Ll/hpr;Ljava/lang/Class;Ll/xuw0;Ljava/util/concurrent/Executor;)Ll/hpr;

    .line 57
    .line 58
    .line 59
    move-result-object p1

    .line 60
    iget-object p0, p0, Ll/f6v0;->b:Ll/xvw0;

    .line 61
    .line 62
    sget-object v0, Ll/e6v0;->a:Ll/e6v0;

    .line 63
    .line 64
    invoke-static {p1, v0, p0}, Ll/pvw0;->n(Ll/hpr;Ll/xuw0;Ljava/util/concurrent/Executor;)Ll/hpr;

    .line 65
    .line 66
    .line 67
    move-result-object p0

    .line 68
    return-object p0
.end method

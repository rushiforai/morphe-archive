.class public final Ll/riv0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/ucv0;


# instance fields
.field public final a:Landroid/content/Context;

.field public final b:Ljava/util/concurrent/Executor;

.field public final c:Ll/psu0;


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/util/concurrent/Executor;Ll/psu0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/riv0;->a:Landroid/content/Context;

    .line 5
    .line 6
    iput-object p2, p0, Ll/riv0;->b:Ljava/util/concurrent/Executor;

    .line 7
    .line 8
    iput-object p3, p0, Ll/riv0;->c:Ll/psu0;

    .line 9
    .line 10
    return-void
.end method

.method public static bridge synthetic c(Ll/riv0;)Ljava/util/concurrent/Executor;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/riv0;->b:Ljava/util/concurrent/Executor;

    .line 2
    .line 3
    return-object p0
.end method

.method public static bridge synthetic d(Ll/riv0;Ll/b7w0;Ll/q6w0;Ll/scv0;)V
    .locals 0

    .line 1
    invoke-static {p1, p2, p3}, Ll/riv0;->e(Ll/b7w0;Ll/q6w0;Ll/scv0;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static final e(Ll/b7w0;Ll/q6w0;Ll/scv0;)V
    .locals 1

    .line 1
    :try_start_0
    iget-object v0, p2, Ll/scv0;->b:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Ll/r8w0;

    .line 4
    .line 5
    iget-object p0, p0, Ll/b7w0;->a:Ll/y6w0;

    .line 6
    .line 7
    iget-object p0, p0, Ll/y6w0;->a:Ll/o7w0;

    .line 8
    .line 9
    iget-object p0, p0, Ll/o7w0;->d:Lcom/google/android/gms/ads/internal/client/zzl;

    .line 10
    .line 11
    iget-object p1, p1, Ll/q6w0;->w:Lorg/json/JSONObject;

    .line 12
    .line 13
    invoke-virtual {p1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    invoke-virtual {v0, p0, p1}, Ll/r8w0;->p(Lcom/google/android/gms/ads/internal/client/zzl;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 18
    .line 19
    .line 20
    return-void

    .line 21
    :catch_0
    move-exception p0

    .line 22
    iget-object p1, p2, Ll/scv0;->a:Ljava/lang/String;

    .line 23
    .line 24
    const-string p2, "Fail to load ad from adapter "

    .line 25
    .line 26
    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    invoke-virtual {p2, p1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    invoke-static {p1, p0}, Ll/dct0;->h(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 35
    .line 36
    .line 37
    return-void
.end method


# virtual methods
.method public final bridge synthetic a(Ll/b7w0;Ll/q6w0;Ll/scv0;)Ljava/lang/Object;
    .locals 8
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
    new-instance p1, Ll/msu0;

    .line 9
    .line 10
    new-instance p2, Ll/niv0;

    .line 11
    .line 12
    invoke-direct {p2, p3}, Ll/niv0;-><init>(Ll/scv0;)V

    .line 13
    .line 14
    .line 15
    invoke-direct {p1, p2}, Ll/msu0;-><init>(Ll/wiu0;)V

    .line 16
    .line 17
    .line 18
    iget-object p2, p0, Ll/riv0;->c:Ll/psu0;

    .line 19
    .line 20
    invoke-virtual {p2, v0, p1}, Ll/psu0;->b(Ll/a0u0;Ll/msu0;)Ll/lsu0;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    invoke-virtual {p1}, Ll/lzt0;->c()Ll/o7u0;

    .line 25
    .line 26
    .line 27
    move-result-object p2

    .line 28
    new-instance v0, Ll/ntt0;

    .line 29
    .line 30
    iget-object v1, p3, Ll/scv0;->b:Ljava/lang/Object;

    .line 31
    .line 32
    check-cast v1, Ll/r8w0;

    .line 33
    .line 34
    invoke-direct {v0, v1}, Ll/ntt0;-><init>(Ll/r8w0;)V

    .line 35
    .line 36
    .line 37
    iget-object v1, p0, Ll/riv0;->b:Ljava/util/concurrent/Executor;

    .line 38
    .line 39
    invoke-virtual {p2, v0, v1}, Ll/kdu0;->q0(Ljava/lang/Object;Ljava/util/concurrent/Executor;)V

    .line 40
    .line 41
    .line 42
    invoke-virtual {p1}, Ll/lzt0;->d()Ll/d8u0;

    .line 43
    .line 44
    .line 45
    move-result-object v6

    .line 46
    invoke-virtual {p1}, Ll/lzt0;->a()Ll/g6u0;

    .line 47
    .line 48
    .line 49
    move-result-object v5

    .line 50
    invoke-virtual {p1}, Ll/lsu0;->h()Ll/i9u0;

    .line 51
    .line 52
    .line 53
    move-result-object v4

    .line 54
    invoke-virtual {p1}, Ll/lsu0;->i()Ll/xgu0;

    .line 55
    .line 56
    .line 57
    move-result-object v7

    .line 58
    iget-object p2, p3, Ll/scv0;->c:Ll/g8u0;

    .line 59
    .line 60
    check-cast p2, Ll/wev0;

    .line 61
    .line 62
    new-instance v2, Ll/qiv0;

    .line 63
    .line 64
    move-object v3, p0

    .line 65
    invoke-direct/range {v2 .. v7}, Ll/qiv0;-><init>(Ll/riv0;Ll/i9u0;Ll/g6u0;Ll/d8u0;Ll/xgu0;)V

    .line 66
    .line 67
    .line 68
    invoke-virtual {p2, v2}, Ll/wev0;->p8(Ll/e7t0;)V

    .line 69
    .line 70
    .line 71
    invoke-virtual {p1}, Ll/lsu0;->k()Ll/ksu0;

    .line 72
    .line 73
    .line 74
    move-result-object p0

    .line 75
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
    check-cast v0, Ll/r8w0;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/r8w0;->c()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    new-instance v0, Ll/piv0;

    .line 12
    .line 13
    invoke-direct {v0, p0, p1, p2, p3}, Ll/piv0;-><init>(Ll/riv0;Ll/b7w0;Ll/q6w0;Ll/scv0;)V

    .line 14
    .line 15
    .line 16
    iget-object v1, p3, Ll/scv0;->c:Ll/g8u0;

    .line 17
    .line 18
    check-cast v1, Ll/wev0;

    .line 19
    .line 20
    invoke-virtual {v1, v0}, Ll/wev0;->q8(Ll/zgu0;)V

    .line 21
    .line 22
    .line 23
    iget-object v0, p3, Ll/scv0;->b:Ljava/lang/Object;

    .line 24
    .line 25
    iget-object v2, p0, Ll/riv0;->a:Landroid/content/Context;

    .line 26
    .line 27
    move-object v1, v0

    .line 28
    check-cast v1, Ll/r8w0;

    .line 29
    .line 30
    iget-object p0, p1, Ll/b7w0;->a:Ll/y6w0;

    .line 31
    .line 32
    iget-object p0, p0, Ll/y6w0;->a:Ll/o7w0;

    .line 33
    .line 34
    iget-object p1, p3, Ll/scv0;->c:Ll/g8u0;

    .line 35
    .line 36
    move-object v5, p1

    .line 37
    check-cast v5, Ll/e7t0;

    .line 38
    .line 39
    iget-object p1, p2, Ll/q6w0;->w:Lorg/json/JSONObject;

    .line 40
    .line 41
    invoke-virtual {p1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object v6

    .line 45
    iget-object v3, p0, Ll/o7w0;->d:Lcom/google/android/gms/ads/internal/client/zzl;

    .line 46
    .line 47
    const/4 v4, 0x0

    .line 48
    invoke-virtual/range {v1 .. v6}, Ll/r8w0;->m(Landroid/content/Context;Lcom/google/android/gms/ads/internal/client/zzl;Ljava/lang/String;Ll/e7t0;Ljava/lang/String;)V

    .line 49
    .line 50
    .line 51
    return-void

    .line 52
    :cond_0
    invoke-static {p1, p2, p3}, Ll/riv0;->e(Ll/b7w0;Ll/q6w0;Ll/scv0;)V

    .line 53
    .line 54
    .line 55
    return-void
.end method

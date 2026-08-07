.class public final Ll/qhv0;
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
    iput-object p1, p0, Ll/qhv0;->a:Landroid/content/Context;

    .line 5
    .line 6
    iput-object p2, p0, Ll/qhv0;->b:Ljava/util/concurrent/Executor;

    .line 7
    .line 8
    iput-object p3, p0, Ll/qhv0;->c:Ll/psu0;

    .line 9
    .line 10
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
    new-instance p1, Ll/msu0;

    .line 9
    .line 10
    new-instance p2, Ll/phv0;

    .line 11
    .line 12
    invoke-direct {p2, p3}, Ll/phv0;-><init>(Ll/scv0;)V

    .line 13
    .line 14
    .line 15
    invoke-direct {p1, p2}, Ll/msu0;-><init>(Ll/wiu0;)V

    .line 16
    .line 17
    .line 18
    iget-object p2, p0, Ll/qhv0;->c:Ll/psu0;

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
    iget-object p0, p0, Ll/qhv0;->b:Ljava/util/concurrent/Executor;

    .line 38
    .line 39
    invoke-virtual {p2, v0, p0}, Ll/kdu0;->q0(Ljava/lang/Object;Ljava/util/concurrent/Executor;)V

    .line 40
    .line 41
    .line 42
    iget-object p0, p3, Ll/scv0;->c:Ll/g8u0;

    .line 43
    .line 44
    check-cast p0, Ll/vev0;

    .line 45
    .line 46
    invoke-virtual {p1}, Ll/lsu0;->m()Ll/biv0;

    .line 47
    .line 48
    .line 49
    move-result-object p2

    .line 50
    invoke-virtual {p0, p2}, Ll/vev0;->p8(Ll/jxs0;)V

    .line 51
    .line 52
    .line 53
    invoke-virtual {p1}, Ll/lsu0;->k()Ll/ksu0;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    return-object p0
.end method

.method public final b(Ll/b7w0;Ll/q6w0;Ll/scv0;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/gms/internal/ads/zzfho;
        }
    .end annotation

    .line 1
    :try_start_0
    iget-object p1, p1, Ll/b7w0;->a:Ll/y6w0;

    .line 2
    .line 3
    iget-object p1, p1, Ll/y6w0;->a:Ll/o7w0;

    .line 4
    .line 5
    iget-object v0, p1, Ll/o7w0;->o:Ll/x6w0;

    .line 6
    .line 7
    iget v0, v0, Ll/x6w0;->a:I

    .line 8
    .line 9
    const/4 v1, 0x3

    .line 10
    if-ne v0, v1, :cond_0

    .line 11
    .line 12
    iget-object v0, p3, Ll/scv0;->b:Ljava/lang/Object;

    .line 13
    .line 14
    check-cast v0, Ll/r8w0;

    .line 15
    .line 16
    iget-object p0, p0, Ll/qhv0;->a:Landroid/content/Context;

    .line 17
    .line 18
    iget-object p1, p1, Ll/o7w0;->d:Lcom/google/android/gms/ads/internal/client/zzl;

    .line 19
    .line 20
    iget-object p2, p2, Ll/q6w0;->w:Lorg/json/JSONObject;

    .line 21
    .line 22
    invoke-virtual {p2}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object p2

    .line 26
    iget-object v1, p3, Ll/scv0;->c:Ll/g8u0;

    .line 27
    .line 28
    check-cast v1, Ll/jxs0;

    .line 29
    .line 30
    invoke-virtual {v0, p0, p1, p2, v1}, Ll/r8w0;->w(Landroid/content/Context;Lcom/google/android/gms/ads/internal/client/zzl;Ljava/lang/String;Ll/jxs0;)V

    .line 31
    .line 32
    .line 33
    return-void

    .line 34
    :catch_0
    move-exception p0

    .line 35
    goto :goto_0

    .line 36
    :cond_0
    iget-object v0, p3, Ll/scv0;->b:Ljava/lang/Object;

    .line 37
    .line 38
    check-cast v0, Ll/r8w0;

    .line 39
    .line 40
    iget-object p0, p0, Ll/qhv0;->a:Landroid/content/Context;

    .line 41
    .line 42
    iget-object p1, p1, Ll/o7w0;->d:Lcom/google/android/gms/ads/internal/client/zzl;

    .line 43
    .line 44
    iget-object p2, p2, Ll/q6w0;->w:Lorg/json/JSONObject;

    .line 45
    .line 46
    invoke-virtual {p2}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object p2

    .line 50
    iget-object v1, p3, Ll/scv0;->c:Ll/g8u0;

    .line 51
    .line 52
    check-cast v1, Ll/jxs0;

    .line 53
    .line 54
    invoke-virtual {v0, p0, p1, p2, v1}, Ll/r8w0;->v(Landroid/content/Context;Lcom/google/android/gms/ads/internal/client/zzl;Ljava/lang/String;Ll/jxs0;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 55
    .line 56
    .line 57
    return-void

    .line 58
    :goto_0
    iget-object p1, p3, Ll/scv0;->a:Ljava/lang/String;

    .line 59
    .line 60
    const-string p2, "Fail to load ad from adapter "

    .line 61
    .line 62
    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object p1

    .line 66
    invoke-virtual {p2, p1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 67
    .line 68
    .line 69
    move-result-object p1

    .line 70
    invoke-static {p1, p0}, Ll/dct0;->h(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 71
    .line 72
    .line 73
    return-void
.end method

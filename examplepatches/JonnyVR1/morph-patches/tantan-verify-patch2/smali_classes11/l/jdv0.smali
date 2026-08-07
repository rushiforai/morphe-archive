.class public final Ll/jdv0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/ucv0;


# instance fields
.field public final a:Landroid/content/Context;

.field public final b:Ll/zvt0;

.field public final c:Ljava/util/concurrent/Executor;


# direct methods
.method public constructor <init>(Landroid/content/Context;Ll/zvt0;Ljava/util/concurrent/Executor;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/jdv0;->a:Landroid/content/Context;

    .line 5
    .line 6
    iput-object p2, p0, Ll/jdv0;->b:Ll/zvt0;

    .line 7
    .line 8
    iput-object p3, p0, Ll/jdv0;->c:Ljava/util/concurrent/Executor;

    .line 9
    .line 10
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
    new-instance v1, Ll/idv0;

    .line 11
    .line 12
    invoke-direct {v1, p3}, Ll/idv0;-><init>(Ll/scv0;)V

    .line 13
    .line 14
    .line 15
    const/4 v2, 0x0

    .line 16
    invoke-direct {p1, v1, v2}, Ll/lhu0;-><init>(Ll/wiu0;Ll/wit0;)V

    .line 17
    .line 18
    .line 19
    new-instance v1, Ll/xvt0;

    .line 20
    .line 21
    iget p2, p2, Ll/q6w0;->b0:I

    .line 22
    .line 23
    invoke-direct {v1, p2}, Ll/xvt0;-><init>(I)V

    .line 24
    .line 25
    .line 26
    iget-object p2, p0, Ll/jdv0;->b:Ll/zvt0;

    .line 27
    .line 28
    invoke-virtual {p2, v0, p1, v1}, Ll/zvt0;->a(Ll/a0u0;Ll/lhu0;Ll/xvt0;)Ll/wvt0;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    invoke-virtual {p1}, Ll/lzt0;->c()Ll/o7u0;

    .line 33
    .line 34
    .line 35
    move-result-object p2

    .line 36
    new-instance v0, Ll/ntt0;

    .line 37
    .line 38
    iget-object v1, p3, Ll/scv0;->b:Ljava/lang/Object;

    .line 39
    .line 40
    check-cast v1, Ll/r8w0;

    .line 41
    .line 42
    invoke-direct {v0, v1}, Ll/ntt0;-><init>(Ll/r8w0;)V

    .line 43
    .line 44
    .line 45
    iget-object p0, p0, Ll/jdv0;->c:Ljava/util/concurrent/Executor;

    .line 46
    .line 47
    invoke-virtual {p2, v0, p0}, Ll/kdu0;->q0(Ljava/lang/Object;Ljava/util/concurrent/Executor;)V

    .line 48
    .line 49
    .line 50
    iget-object p0, p3, Ll/scv0;->c:Ll/g8u0;

    .line 51
    .line 52
    check-cast p0, Ll/vev0;

    .line 53
    .line 54
    invoke-virtual {p1}, Ll/lzt0;->g()Ll/ijv0;

    .line 55
    .line 56
    .line 57
    move-result-object p2

    .line 58
    invoke-virtual {p0, p2}, Ll/vev0;->p8(Ll/jxs0;)V

    .line 59
    .line 60
    .line 61
    invoke-virtual {p1}, Ll/wvt0;->h()Ll/fwt0;

    .line 62
    .line 63
    .line 64
    move-result-object p0

    .line 65
    return-object p0
.end method

.method public final b(Ll/b7w0;Ll/q6w0;Ll/scv0;)V
    .locals 1
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
    iget-object p1, p1, Ll/b7w0;->a:Ll/y6w0;

    .line 6
    .line 7
    iget-object p1, p1, Ll/y6w0;->a:Ll/o7w0;

    .line 8
    .line 9
    iget-object p2, p2, Ll/q6w0;->w:Lorg/json/JSONObject;

    .line 10
    .line 11
    invoke-virtual {p2}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p2

    .line 15
    iget-object p0, p0, Ll/jdv0;->a:Landroid/content/Context;

    .line 16
    .line 17
    iget-object p1, p1, Ll/o7w0;->d:Lcom/google/android/gms/ads/internal/client/zzl;

    .line 18
    .line 19
    iget-object p3, p3, Ll/scv0;->c:Ll/g8u0;

    .line 20
    .line 21
    check-cast p3, Ll/jxs0;

    .line 22
    .line 23
    invoke-virtual {v0, p0, p1, p2, p3}, Ll/r8w0;->q(Landroid/content/Context;Lcom/google/android/gms/ads/internal/client/zzl;Ljava/lang/String;Ll/jxs0;)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

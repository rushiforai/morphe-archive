.class public final Ll/r2t0;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static e:Ll/eat0;


# instance fields
.field public final a:Landroid/content/Context;

.field public final b:Lcom/google/android/gms/ads/AdFormat;

.field public final c:Ll/xxu0;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public final d:Ljava/lang/String;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/google/android/gms/ads/AdFormat;Ll/xxu0;Ljava/lang/String;)V
    .locals 0
    .param p3    # Ll/xxu0;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p4    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/r2t0;->a:Landroid/content/Context;

    .line 5
    .line 6
    iput-object p2, p0, Ll/r2t0;->b:Lcom/google/android/gms/ads/AdFormat;

    .line 7
    .line 8
    iput-object p3, p0, Ll/r2t0;->c:Ll/xxu0;

    .line 9
    .line 10
    iput-object p4, p0, Ll/r2t0;->d:Ljava/lang/String;

    .line 11
    .line 12
    return-void
.end method

.method public static a(Landroid/content/Context;)Ll/eat0;
    .locals 3
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    const-class v0, Ll/r2t0;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    sget-object v1, Ll/r2t0;->e:Ll/eat0;

    .line 5
    .line 6
    if-nez v1, :cond_0

    .line 7
    .line 8
    invoke-static {}, Ll/k6s0;->a()Ll/s3s0;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    new-instance v2, Ll/qws0;

    .line 13
    .line 14
    invoke-direct {v2}, Ll/qws0;-><init>()V

    .line 15
    .line 16
    .line 17
    invoke-virtual {v1, p0, v2}, Ll/s3s0;->o(Landroid/content/Context;Ll/uws0;)Ll/eat0;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    sput-object p0, Ll/r2t0;->e:Ll/eat0;

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :catchall_0
    move-exception p0

    .line 25
    goto :goto_1

    .line 26
    :cond_0
    :goto_0
    sget-object p0, Ll/r2t0;->e:Ll/eat0;

    .line 27
    .line 28
    monitor-exit v0

    .line 29
    return-object p0

    .line 30
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 31
    throw p0
.end method


# virtual methods
.method public final b(Ll/yvb0;)V
    .locals 7

    .line 1
    iget-object v0, p0, Ll/r2t0;->a:Landroid/content/Context;

    .line 2
    .line 3
    invoke-static {v0}, Ll/r2t0;->a(Landroid/content/Context;)Ll/eat0;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    const-string p0, "Internal Error, query info generator is null."

    .line 10
    .line 11
    invoke-virtual {p1, p0}, Ll/yvb0;->a(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    iget-object v1, p0, Ll/r2t0;->a:Landroid/content/Context;

    .line 16
    .line 17
    iget-object v2, p0, Ll/r2t0;->c:Ll/xxu0;

    .line 18
    .line 19
    invoke-static {v1}, Ll/h950;->Y2(Ljava/lang/Object;)Ll/p1m;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    if-nez v2, :cond_1

    .line 24
    .line 25
    new-instance v2, Ll/udy0;

    .line 26
    .line 27
    invoke-direct {v2}, Ll/udy0;-><init>()V

    .line 28
    .line 29
    .line 30
    invoke-virtual {v2}, Ll/udy0;->a()Lcom/google/android/gms/ads/internal/client/zzl;

    .line 31
    .line 32
    .line 33
    move-result-object v2

    .line 34
    goto :goto_0

    .line 35
    :cond_1
    iget-object v3, p0, Ll/r2t0;->a:Landroid/content/Context;

    .line 36
    .line 37
    sget-object v4, Ll/ioy0;->a:Ll/ioy0;

    .line 38
    .line 39
    invoke-virtual {v4, v3, v2}, Ll/ioy0;->a(Landroid/content/Context;Ll/xxu0;)Lcom/google/android/gms/ads/internal/client/zzl;

    .line 40
    .line 41
    .line 42
    move-result-object v2

    .line 43
    :goto_0
    iget-object v3, p0, Ll/r2t0;->d:Ljava/lang/String;

    .line 44
    .line 45
    iget-object v4, p0, Ll/r2t0;->b:Lcom/google/android/gms/ads/AdFormat;

    .line 46
    .line 47
    new-instance v5, Lcom/google/android/gms/internal/ads/zzccx;

    .line 48
    .line 49
    invoke-virtual {v4}, Ljava/lang/Enum;->name()Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object v4

    .line 53
    const/4 v6, 0x0

    .line 54
    invoke-direct {v5, v3, v4, v6, v2}, Lcom/google/android/gms/internal/ads/zzccx;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/google/android/gms/ads/internal/client/zzq;Lcom/google/android/gms/ads/internal/client/zzl;)V

    .line 55
    .line 56
    .line 57
    :try_start_0
    new-instance v2, Ll/q2t0;

    .line 58
    .line 59
    invoke-direct {v2, p0, p1}, Ll/q2t0;-><init>(Ll/r2t0;Ll/yvb0;)V

    .line 60
    .line 61
    .line 62
    invoke-interface {v0, v1, v5, v2}, Ll/eat0;->W6(Ll/p1m;Lcom/google/android/gms/internal/ads/zzccx;Ll/bat0;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 63
    .line 64
    .line 65
    return-void

    .line 66
    :catch_0
    const-string p0, "Internal Error."

    .line 67
    .line 68
    invoke-virtual {p1, p0}, Ll/yvb0;->a(Ljava/lang/String;)V

    .line 69
    .line 70
    .line 71
    return-void
.end method

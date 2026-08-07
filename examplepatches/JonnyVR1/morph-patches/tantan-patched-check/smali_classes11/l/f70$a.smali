.class public Ll/f70$a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/f70;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "a"
.end annotation


# instance fields
.field public final a:Landroid/content/Context;

.field public final b:Ll/ats0;


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;)V
    .locals 3
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    const-string v0, "context cannot be null"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Landroid/content/Context;

    .line 8
    .line 9
    invoke-static {}, Ll/k6s0;->a()Ll/s3s0;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    new-instance v2, Ll/qws0;

    .line 14
    .line 15
    invoke-direct {v2}, Ll/qws0;-><init>()V

    .line 16
    .line 17
    .line 18
    invoke-virtual {v1, p1, p2, v2}, Ll/s3s0;->c(Landroid/content/Context;Ljava/lang/String;Ll/uws0;)Ll/ats0;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 23
    .line 24
    .line 25
    iput-object v0, p0, Ll/f70$a;->a:Landroid/content/Context;

    .line 26
    .line 27
    iput-object p1, p0, Ll/f70$a;->b:Ll/ats0;

    .line 28
    .line 29
    return-void
.end method


# virtual methods
.method public a()Ll/f70;
    .locals 4
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    :try_start_0
    new-instance v0, Ll/f70;

    .line 2
    .line 3
    iget-object v1, p0, Ll/f70$a;->a:Landroid/content/Context;

    .line 4
    .line 5
    iget-object v2, p0, Ll/f70$a;->b:Ll/ats0;

    .line 6
    .line 7
    invoke-interface {v2}, Ll/ats0;->zze()Ll/lps0;

    .line 8
    .line 9
    .line 10
    move-result-object v2

    .line 11
    sget-object v3, Ll/ioy0;->a:Ll/ioy0;

    .line 12
    .line 13
    invoke-direct {v0, v1, v2, v3}, Ll/f70;-><init>(Landroid/content/Context;Ll/lps0;Ll/ioy0;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 14
    .line 15
    .line 16
    return-object v0

    .line 17
    :catch_0
    move-exception v0

    .line 18
    const-string v1, "Failed to build AdLoader."

    .line 19
    .line 20
    invoke-static {v1, v0}, Ll/dct0;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 21
    .line 22
    .line 23
    new-instance v0, Ll/nqv0;

    .line 24
    .line 25
    invoke-direct {v0}, Ll/nqv0;-><init>()V

    .line 26
    .line 27
    .line 28
    iget-object p0, p0, Ll/f70$a;->a:Landroid/content/Context;

    .line 29
    .line 30
    new-instance v1, Ll/f70;

    .line 31
    .line 32
    invoke-virtual {v0}, Ll/nqv0;->p8()Ll/lps0;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    sget-object v2, Ll/ioy0;->a:Ll/ioy0;

    .line 37
    .line 38
    invoke-direct {v1, p0, v0, v2}, Ll/f70;-><init>(Landroid/content/Context;Ll/lps0;Ll/ioy0;)V

    .line 39
    .line 40
    .line 41
    return-object v1
.end method

.method public b(Ll/md20$c;)Ll/f70$a;
    .locals 2
    .param p1    # Ll/md20$c;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    :try_start_0
    iget-object v0, p0, Ll/f70$a;->b:Ll/ats0;

    .line 2
    .line 3
    new-instance v1, Ll/h1t0;

    .line 4
    .line 5
    invoke-direct {v1, p1}, Ll/h1t0;-><init>(Ll/md20$c;)V

    .line 6
    .line 7
    .line 8
    invoke-interface {v0, v1}, Ll/ats0;->h4(Ll/fns0;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 9
    .line 10
    .line 11
    return-object p0

    .line 12
    :catch_0
    move-exception p1

    .line 13
    const-string v0, "Failed to add google native ad listener"

    .line 14
    .line 15
    invoke-static {v0, p1}, Ll/dct0;->h(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 16
    .line 17
    .line 18
    return-object p0
.end method

.method public c(Ll/d70;)Ll/f70$a;
    .locals 2
    .param p1    # Ll/d70;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    :try_start_0
    iget-object v0, p0, Ll/f70$a;->b:Ll/ats0;

    .line 2
    .line 3
    new-instance v1, Ll/frw0;

    .line 4
    .line 5
    invoke-direct {v1, p1}, Ll/frw0;-><init>(Ll/d70;)V

    .line 6
    .line 7
    .line 8
    invoke-interface {v0, v1}, Ll/ats0;->T3(Ll/xhs0;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 9
    .line 10
    .line 11
    return-object p0

    .line 12
    :catch_0
    move-exception p1

    .line 13
    const-string v0, "Failed to set AdListener."

    .line 14
    .line 15
    invoke-static {v0, p1}, Ll/dct0;->h(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 16
    .line 17
    .line 18
    return-object p0
.end method

.method public d(Ll/qd20;)Ll/f70$a;
    .locals 13
    .param p1    # Ll/qd20;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    :try_start_0
    iget-object v0, p0, Ll/f70$a;->b:Ll/ats0;

    .line 2
    .line 3
    new-instance v1, Lcom/google/android/gms/internal/ads/zzbjb;

    .line 4
    .line 5
    invoke-virtual {p1}, Ll/qd20;->e()Z

    .line 6
    .line 7
    .line 8
    move-result v3

    .line 9
    invoke-virtual {p1}, Ll/qd20;->d()Z

    .line 10
    .line 11
    .line 12
    move-result v5

    .line 13
    invoke-virtual {p1}, Ll/qd20;->a()I

    .line 14
    .line 15
    .line 16
    move-result v6

    .line 17
    invoke-virtual {p1}, Ll/qd20;->c()Ll/kfl0;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    if-eqz v2, :cond_0

    .line 22
    .line 23
    new-instance v2, Lcom/google/android/gms/ads/internal/client/zzfk;

    .line 24
    .line 25
    invoke-virtual {p1}, Ll/qd20;->c()Ll/kfl0;

    .line 26
    .line 27
    .line 28
    move-result-object v4

    .line 29
    invoke-direct {v2, v4}, Lcom/google/android/gms/ads/internal/client/zzfk;-><init>(Ll/kfl0;)V

    .line 30
    .line 31
    .line 32
    :goto_0
    move-object v7, v2

    .line 33
    goto :goto_1

    .line 34
    :catch_0
    move-exception v0

    .line 35
    move-object p1, v0

    .line 36
    goto :goto_2

    .line 37
    :cond_0
    const/4 v2, 0x0

    .line 38
    goto :goto_0

    .line 39
    :goto_1
    invoke-virtual {p1}, Ll/qd20;->h()Z

    .line 40
    .line 41
    .line 42
    move-result v8

    .line 43
    invoke-virtual {p1}, Ll/qd20;->b()I

    .line 44
    .line 45
    .line 46
    move-result v9

    .line 47
    invoke-virtual {p1}, Ll/qd20;->f()I

    .line 48
    .line 49
    .line 50
    move-result v10

    .line 51
    invoke-virtual {p1}, Ll/qd20;->g()Z

    .line 52
    .line 53
    .line 54
    move-result v11

    .line 55
    invoke-virtual {p1}, Ll/qd20;->i()I

    .line 56
    .line 57
    .line 58
    move-result p1

    .line 59
    add-int/lit8 v12, p1, -0x1

    .line 60
    .line 61
    const/4 v2, 0x4

    .line 62
    const/4 v4, -0x1

    .line 63
    invoke-direct/range {v1 .. v12}, Lcom/google/android/gms/internal/ads/zzbjb;-><init>(IZIZILcom/google/android/gms/ads/internal/client/zzfk;ZIIZI)V

    .line 64
    .line 65
    .line 66
    invoke-interface {v0, v1}, Ll/ats0;->X0(Lcom/google/android/gms/internal/ads/zzbjb;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 67
    .line 68
    .line 69
    return-object p0

    .line 70
    :goto_2
    const-string v0, "Failed to specify native ad options"

    .line 71
    .line 72
    invoke-static {v0, p1}, Ll/dct0;->h(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 73
    .line 74
    .line 75
    return-object p0
.end method

.method public final e(Ljava/lang/String;Ll/yqw0;Ll/byv0;)Ll/f70$a;
    .locals 1
    .param p3    # Ll/byv0;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    new-instance v0, Ll/vns0;

    .line 2
    .line 3
    invoke-direct {v0, p2, p3}, Ll/vns0;-><init>(Ll/yqw0;Ll/byv0;)V

    .line 4
    .line 5
    .line 6
    :try_start_0
    iget-object p2, p0, Ll/f70$a;->b:Ll/ats0;

    .line 7
    .line 8
    invoke-virtual {v0}, Ll/vns0;->d()Ll/oms0;

    .line 9
    .line 10
    .line 11
    move-result-object p3

    .line 12
    invoke-virtual {v0}, Ll/vns0;->c()Ll/lms0;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-interface {p2, p1, p3, v0}, Ll/ats0;->B2(Ljava/lang/String;Ll/oms0;Ll/lms0;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 17
    .line 18
    .line 19
    return-object p0

    .line 20
    :catch_0
    move-exception p1

    .line 21
    const-string p2, "Failed to add custom template ad listener"

    .line 22
    .line 23
    invoke-static {p2, p1}, Ll/dct0;->h(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 24
    .line 25
    .line 26
    return-object p0
.end method

.method public final f(Ll/ntx0;)Ll/f70$a;
    .locals 2
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    :try_start_0
    iget-object v0, p0, Ll/f70$a;->b:Ll/ats0;

    .line 2
    .line 3
    new-instance v1, Ll/wns0;

    .line 4
    .line 5
    invoke-direct {v1, p1}, Ll/wns0;-><init>(Ll/ntx0;)V

    .line 6
    .line 7
    .line 8
    invoke-interface {v0, v1}, Ll/ats0;->h4(Ll/fns0;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 9
    .line 10
    .line 11
    return-object p0

    .line 12
    :catch_0
    move-exception p1

    .line 13
    const-string v0, "Failed to add google native ad listener"

    .line 14
    .line 15
    invoke-static {v0, p1}, Ll/dct0;->h(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 16
    .line 17
    .line 18
    return-object p0
.end method

.method public final g(Ll/pd20;)Ll/f70$a;
    .locals 2
    .param p1    # Ll/pd20;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    :try_start_0
    iget-object v0, p0, Ll/f70$a;->b:Ll/ats0;

    .line 2
    .line 3
    new-instance v1, Lcom/google/android/gms/internal/ads/zzbjb;

    .line 4
    .line 5
    invoke-direct {v1, p1}, Lcom/google/android/gms/internal/ads/zzbjb;-><init>(Ll/pd20;)V

    .line 6
    .line 7
    .line 8
    invoke-interface {v0, v1}, Ll/ats0;->X0(Lcom/google/android/gms/internal/ads/zzbjb;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 9
    .line 10
    .line 11
    return-object p0

    .line 12
    :catch_0
    move-exception p1

    .line 13
    const-string v0, "Failed to specify native ad options"

    .line 14
    .line 15
    invoke-static {v0, p1}, Ll/dct0;->h(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 16
    .line 17
    .line 18
    return-object p0
.end method

.class public final Ll/bbs0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Ll/oys0;

.field public final b:Landroid/content/Context;

.field public final c:Ljava/lang/String;

.field public final d:Ll/xxu0;

.field public final e:I

.field public final f:Ll/bx0$a;

.field public final g:Ll/qws0;

.field public final h:Ll/ioy0;


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;Ll/xxu0;ILl/bx0$a;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/qws0;

    .line 5
    .line 6
    invoke-direct {v0}, Ll/qws0;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/bbs0;->g:Ll/qws0;

    .line 10
    .line 11
    iput-object p1, p0, Ll/bbs0;->b:Landroid/content/Context;

    .line 12
    .line 13
    iput-object p2, p0, Ll/bbs0;->c:Ljava/lang/String;

    .line 14
    .line 15
    iput-object p3, p0, Ll/bbs0;->d:Ll/xxu0;

    .line 16
    .line 17
    iput p4, p0, Ll/bbs0;->e:I

    .line 18
    .line 19
    iput-object p5, p0, Ll/bbs0;->f:Ll/bx0$a;

    .line 20
    .line 21
    sget-object p1, Ll/ioy0;->a:Ll/ioy0;

    .line 22
    .line 23
    iput-object p1, p0, Ll/bbs0;->h:Ll/ioy0;

    .line 24
    .line 25
    return-void
.end method


# virtual methods
.method public final a()V
    .locals 5

    .line 1
    :try_start_0
    invoke-static {}, Lcom/google/android/gms/ads/internal/client/zzq;->F()Lcom/google/android/gms/ads/internal/client/zzq;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {}, Ll/k6s0;->a()Ll/s3s0;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    iget-object v2, p0, Ll/bbs0;->b:Landroid/content/Context;

    .line 10
    .line 11
    iget-object v3, p0, Ll/bbs0;->c:Ljava/lang/String;

    .line 12
    .line 13
    iget-object v4, p0, Ll/bbs0;->g:Ll/qws0;

    .line 14
    .line 15
    invoke-virtual {v1, v2, v0, v3, v4}, Ll/s3s0;->d(Landroid/content/Context;Lcom/google/android/gms/ads/internal/client/zzq;Ljava/lang/String;Ll/uws0;)Ll/oys0;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    iput-object v0, p0, Ll/bbs0;->a:Ll/oys0;

    .line 20
    .line 21
    if-eqz v0, :cond_1

    .line 22
    .line 23
    iget v0, p0, Ll/bbs0;->e:I

    .line 24
    .line 25
    const/4 v1, 0x3

    .line 26
    if-eq v0, v1, :cond_0

    .line 27
    .line 28
    new-instance v0, Lcom/google/android/gms/ads/internal/client/zzw;

    .line 29
    .line 30
    iget v1, p0, Ll/bbs0;->e:I

    .line 31
    .line 32
    invoke-direct {v0, v1}, Lcom/google/android/gms/ads/internal/client/zzw;-><init>(I)V

    .line 33
    .line 34
    .line 35
    iget-object v1, p0, Ll/bbs0;->a:Ll/oys0;

    .line 36
    .line 37
    invoke-interface {v1, v0}, Ll/oys0;->I1(Lcom/google/android/gms/ads/internal/client/zzw;)V

    .line 38
    .line 39
    .line 40
    :cond_0
    iget-object v0, p0, Ll/bbs0;->a:Ll/oys0;

    .line 41
    .line 42
    new-instance v1, Ll/oas0;

    .line 43
    .line 44
    iget-object v2, p0, Ll/bbs0;->f:Ll/bx0$a;

    .line 45
    .line 46
    iget-object v3, p0, Ll/bbs0;->c:Ljava/lang/String;

    .line 47
    .line 48
    invoke-direct {v1, v2, v3}, Ll/oas0;-><init>(Ll/bx0$a;Ljava/lang/String;)V

    .line 49
    .line 50
    .line 51
    invoke-interface {v0, v1}, Ll/oys0;->A5(Ll/was0;)V

    .line 52
    .line 53
    .line 54
    iget-object v0, p0, Ll/bbs0;->a:Ll/oys0;

    .line 55
    .line 56
    iget-object v1, p0, Ll/bbs0;->h:Ll/ioy0;

    .line 57
    .line 58
    iget-object v2, p0, Ll/bbs0;->b:Landroid/content/Context;

    .line 59
    .line 60
    iget-object p0, p0, Ll/bbs0;->d:Ll/xxu0;

    .line 61
    .line 62
    invoke-virtual {v1, v2, p0}, Ll/ioy0;->a(Landroid/content/Context;Ll/xxu0;)Lcom/google/android/gms/ads/internal/client/zzl;

    .line 63
    .line 64
    .line 65
    move-result-object p0

    .line 66
    invoke-interface {v0, p0}, Ll/oys0;->f2(Lcom/google/android/gms/ads/internal/client/zzl;)Z
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 67
    .line 68
    .line 69
    :cond_1
    return-void

    .line 70
    :catch_0
    move-exception p0

    .line 71
    const-string v0, "#007 Could not call remote method."

    .line 72
    .line 73
    invoke-static {v0, p0}, Ll/dct0;->i(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 74
    .line 75
    .line 76
    return-void
.end method

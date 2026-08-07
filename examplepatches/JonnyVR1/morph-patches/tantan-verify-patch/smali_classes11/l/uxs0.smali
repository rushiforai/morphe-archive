.class public final Ll/uxs0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/t7y;


# instance fields
.field public final synthetic a:Ll/jxs0;

.field public final synthetic b:Ll/b80;

.field public final synthetic c:Ll/bys0;


# direct methods
.method public constructor <init>(Ll/bys0;Ll/jxs0;Ll/b80;)V
    .locals 0

    .line 1
    iput-object p2, p0, Ll/uxs0;->a:Ll/jxs0;

    .line 2
    .line 3
    iput-object p3, p0, Ll/uxs0;->b:Ll/b80;

    .line 4
    .line 5
    iput-object p1, p0, Ll/uxs0;->c:Ll/bys0;

    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final a(Ll/b70;)V
    .locals 5
    .param p1    # Ll/b70;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    :try_start_0
    iget-object v0, p0, Ll/uxs0;->b:Ll/b80;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Ljava/lang/Class;->getCanonicalName()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {p1}, Ll/b70;->a()I

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    invoke-virtual {p1}, Ll/b70;->c()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    invoke-virtual {p1}, Ll/b70;->b()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v3

    .line 23
    new-instance v4, Ljava/lang/StringBuilder;

    .line 24
    .line 25
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 26
    .line 27
    .line 28
    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    const-string v0, "failed to load mediation ad: ErrorCode = "

    .line 32
    .line 33
    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 37
    .line 38
    .line 39
    const-string v0, ". ErrorMessage = "

    .line 40
    .line 41
    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 42
    .line 43
    .line 44
    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 45
    .line 46
    .line 47
    const-string v0, ". ErrorDomain = "

    .line 48
    .line 49
    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 50
    .line 51
    .line 52
    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 53
    .line 54
    .line 55
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    invoke-static {v0}, Ll/dct0;->b(Ljava/lang/String;)V

    .line 60
    .line 61
    .line 62
    iget-object v0, p0, Ll/uxs0;->a:Ll/jxs0;

    .line 63
    .line 64
    invoke-virtual {p1}, Ll/b70;->d()Lcom/google/android/gms/ads/internal/client/zze;

    .line 65
    .line 66
    .line 67
    move-result-object v1

    .line 68
    invoke-interface {v0, v1}, Ll/jxs0;->N4(Lcom/google/android/gms/ads/internal/client/zze;)V

    .line 69
    .line 70
    .line 71
    iget-object v0, p0, Ll/uxs0;->a:Ll/jxs0;

    .line 72
    .line 73
    invoke-virtual {p1}, Ll/b70;->a()I

    .line 74
    .line 75
    .line 76
    move-result v1

    .line 77
    invoke-virtual {p1}, Ll/b70;->c()Ljava/lang/String;

    .line 78
    .line 79
    .line 80
    move-result-object v2

    .line 81
    invoke-interface {v0, v1, v2}, Ll/jxs0;->G0(ILjava/lang/String;)V

    .line 82
    .line 83
    .line 84
    iget-object p0, p0, Ll/uxs0;->a:Ll/jxs0;

    .line 85
    .line 86
    invoke-virtual {p1}, Ll/b70;->a()I

    .line 87
    .line 88
    .line 89
    move-result p1

    .line 90
    invoke-interface {p0, p1}, Ll/jxs0;->zzg(I)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 91
    .line 92
    .line 93
    return-void

    .line 94
    :catch_0
    move-exception p0

    .line 95
    const-string p1, ""

    .line 96
    .line 97
    invoke-static {p1, p0}, Ll/dct0;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 98
    .line 99
    .line 100
    return-void
.end method

.class public final Ll/quu0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/upx0;


# instance fields
.field public final a:Ll/kqx0;

.field public final b:Ll/kqx0;

.field public final c:Ll/kqx0;

.field public final d:Ll/kqx0;

.field public final e:Ll/kqx0;


# direct methods
.method public constructor <init>(Ll/kqx0;Ll/kqx0;Ll/kqx0;Ll/kqx0;Ll/kqx0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/quu0;->a:Ll/kqx0;

    .line 5
    .line 6
    iput-object p2, p0, Ll/quu0;->b:Ll/kqx0;

    .line 7
    .line 8
    iput-object p3, p0, Ll/quu0;->c:Ll/kqx0;

    .line 9
    .line 10
    iput-object p4, p0, Ll/quu0;->d:Ll/kqx0;

    .line 11
    .line 12
    iput-object p5, p0, Ll/quu0;->e:Ll/kqx0;

    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public final bridge synthetic zzb()Ljava/lang/Object;
    .locals 6

    .line 1
    iget-object v0, p0, Ll/quu0;->a:Ll/kqx0;

    .line 2
    .line 3
    check-cast v0, Ll/jlt0;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/jlt0;->a()Landroid/content/Context;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-object v1, p0, Ll/quu0;->b:Ll/kqx0;

    .line 10
    .line 11
    check-cast v1, Ll/i3v0;

    .line 12
    .line 13
    invoke-virtual {v1}, Ll/i3v0;->a()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    iget-object v2, p0, Ll/quu0;->c:Ll/kqx0;

    .line 18
    .line 19
    check-cast v2, Ll/vlt0;

    .line 20
    .line 21
    invoke-virtual {v2}, Ll/vlt0;->a()Lcom/google/android/gms/internal/ads/zzcei;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    iget-object v3, p0, Ll/quu0;->d:Ll/kqx0;

    .line 26
    .line 27
    invoke-interface {v3}, Ll/kqx0;->zzb()Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object v3

    .line 31
    check-cast v3, Lcom/google/android/gms/internal/ads/zzbbz;

    .line 32
    .line 33
    iget-object p0, p0, Ll/quu0;->e:Ll/kqx0;

    .line 34
    .line 35
    invoke-interface {p0}, Ll/kqx0;->zzb()Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    check-cast p0, Ljava/lang/String;

    .line 40
    .line 41
    new-instance v4, Ll/fcs0;

    .line 42
    .line 43
    new-instance v5, Ll/lcs0;

    .line 44
    .line 45
    invoke-direct {v5, v0}, Ll/lcs0;-><init>(Landroid/content/Context;)V

    .line 46
    .line 47
    .line 48
    invoke-direct {v4, v5}, Ll/fcs0;-><init>(Ll/lcs0;)V

    .line 49
    .line 50
    .line 51
    invoke-static {}, Lcom/google/android/gms/internal/ads/v0;->L()Ll/bfs0;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    iget v5, v2, Lcom/google/android/gms/internal/ads/zzcei;->zzb:I

    .line 56
    .line 57
    invoke-virtual {v0, v5}, Ll/bfs0;->q(I)Ll/bfs0;

    .line 58
    .line 59
    .line 60
    iget v5, v2, Lcom/google/android/gms/internal/ads/zzcei;->zzc:I

    .line 61
    .line 62
    invoke-virtual {v0, v5}, Ll/bfs0;->s(I)Ll/bfs0;

    .line 63
    .line 64
    .line 65
    const/4 v5, 0x1

    .line 66
    iget-boolean v2, v2, Lcom/google/android/gms/internal/ads/zzcei;->zzd:Z

    .line 67
    .line 68
    if-eq v5, v2, :cond_0

    .line 69
    .line 70
    const/4 v2, 0x2

    .line 71
    goto :goto_0

    .line 72
    :cond_0
    const/4 v2, 0x0

    .line 73
    :goto_0
    invoke-virtual {v0, v2}, Ll/bfs0;->r(I)Ll/bfs0;

    .line 74
    .line 75
    .line 76
    invoke-virtual {v0}, Ll/shx0;->m()Lcom/google/android/gms/internal/ads/p5;

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    check-cast v0, Lcom/google/android/gms/internal/ads/v0;

    .line 81
    .line 82
    new-instance v2, Ll/puu0;

    .line 83
    .line 84
    invoke-direct {v2, v3, v1, v0, p0}, Ll/puu0;-><init>(Lcom/google/android/gms/internal/ads/zzbbz;Ljava/lang/String;Lcom/google/android/gms/internal/ads/v0;Ljava/lang/String;)V

    .line 85
    .line 86
    .line 87
    invoke-virtual {v4, v2}, Ll/fcs0;->b(Ll/ecs0;)V

    .line 88
    .line 89
    .line 90
    return-object v4
.end method

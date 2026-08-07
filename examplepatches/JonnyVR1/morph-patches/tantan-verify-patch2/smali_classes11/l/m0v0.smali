.class public final Ll/m0v0;
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

.field public final f:Ll/kqx0;

.field public final g:Ll/kqx0;

.field public final h:Ll/kqx0;


# direct methods
.method public constructor <init>(Ll/kqx0;Ll/kqx0;Ll/kqx0;Ll/kqx0;Ll/kqx0;Ll/kqx0;Ll/kqx0;Ll/kqx0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/m0v0;->a:Ll/kqx0;

    .line 5
    .line 6
    iput-object p2, p0, Ll/m0v0;->b:Ll/kqx0;

    .line 7
    .line 8
    iput-object p3, p0, Ll/m0v0;->c:Ll/kqx0;

    .line 9
    .line 10
    iput-object p4, p0, Ll/m0v0;->d:Ll/kqx0;

    .line 11
    .line 12
    iput-object p5, p0, Ll/m0v0;->e:Ll/kqx0;

    .line 13
    .line 14
    iput-object p6, p0, Ll/m0v0;->f:Ll/kqx0;

    .line 15
    .line 16
    iput-object p7, p0, Ll/m0v0;->g:Ll/kqx0;

    .line 17
    .line 18
    iput-object p8, p0, Ll/m0v0;->h:Ll/kqx0;

    .line 19
    .line 20
    return-void
.end method


# virtual methods
.method public final bridge synthetic zzb()Ljava/lang/Object;
    .locals 10

    .line 1
    iget-object v0, p0, Ll/m0v0;->a:Ll/kqx0;

    .line 2
    .line 3
    invoke-interface {v0}, Ll/kqx0;->zzb()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    move-object v2, v0

    .line 8
    check-cast v2, Ll/r0v0;

    .line 9
    .line 10
    iget-object v0, p0, Ll/m0v0;->b:Ll/kqx0;

    .line 11
    .line 12
    invoke-interface {v0}, Ll/kqx0;->zzb()Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    move-object v3, v0

    .line 17
    check-cast v3, Ll/r2v0;

    .line 18
    .line 19
    iget-object v0, p0, Ll/m0v0;->c:Ll/kqx0;

    .line 20
    .line 21
    invoke-interface {v0}, Ll/kqx0;->zzb()Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    move-object v4, v0

    .line 26
    check-cast v4, Ll/szu0;

    .line 27
    .line 28
    iget-object v0, p0, Ll/m0v0;->d:Ll/kqx0;

    .line 29
    .line 30
    check-cast v0, Ll/jlt0;

    .line 31
    .line 32
    invoke-virtual {v0}, Ll/jlt0;->a()Landroid/content/Context;

    .line 33
    .line 34
    .line 35
    move-result-object v5

    .line 36
    iget-object v0, p0, Ll/m0v0;->e:Ll/kqx0;

    .line 37
    .line 38
    check-cast v0, Ll/vlt0;

    .line 39
    .line 40
    invoke-virtual {v0}, Ll/vlt0;->a()Lcom/google/android/gms/internal/ads/zzcei;

    .line 41
    .line 42
    .line 43
    move-result-object v6

    .line 44
    iget-object v0, p0, Ll/m0v0;->f:Ll/kqx0;

    .line 45
    .line 46
    invoke-interface {v0}, Ll/kqx0;->zzb()Ljava/lang/Object;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    move-object v7, v0

    .line 51
    check-cast v7, Ll/a0v0;

    .line 52
    .line 53
    iget-object v0, p0, Ll/m0v0;->g:Ll/kqx0;

    .line 54
    .line 55
    invoke-interface {v0}, Ll/kqx0;->zzb()Ljava/lang/Object;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    move-object v8, v0

    .line 60
    check-cast v8, Ll/d1v0;

    .line 61
    .line 62
    iget-object p0, p0, Ll/m0v0;->h:Ll/kqx0;

    .line 63
    .line 64
    check-cast p0, Ll/nlt0;

    .line 65
    .line 66
    invoke-virtual {p0}, Ll/nlt0;->a()Ljava/lang/String;

    .line 67
    .line 68
    .line 69
    move-result-object v9

    .line 70
    new-instance v1, Ll/j0v0;

    .line 71
    .line 72
    invoke-direct/range {v1 .. v9}, Ll/j0v0;-><init>(Ll/r0v0;Ll/r2v0;Ll/szu0;Landroid/content/Context;Lcom/google/android/gms/internal/ads/zzcei;Ll/a0v0;Ll/d1v0;Ljava/lang/String;)V

    .line 73
    .line 74
    .line 75
    return-object v1
.end method

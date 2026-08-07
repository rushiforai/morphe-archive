.class public final Ll/j0z0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/vhu0;


# instance fields
.field public final a:Ll/bou0;

.field public final b:Ll/bou0;

.field public final c:Ll/bou0;

.field public final d:Ll/bou0;

.field public final e:Ll/bou0;

.field public final f:Ll/bou0;

.field public final g:Ll/bou0;


# direct methods
.method public constructor <init>(Ll/bou0;Ll/bou0;Ll/bou0;Ll/bou0;Ll/bou0;Ll/bou0;Ll/bou0;Ll/bou0;Ll/bou0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/j0z0;->a:Ll/bou0;

    .line 5
    .line 6
    iput-object p2, p0, Ll/j0z0;->b:Ll/bou0;

    .line 7
    .line 8
    iput-object p5, p0, Ll/j0z0;->c:Ll/bou0;

    .line 9
    .line 10
    iput-object p6, p0, Ll/j0z0;->d:Ll/bou0;

    .line 11
    .line 12
    iput-object p7, p0, Ll/j0z0;->e:Ll/bou0;

    .line 13
    .line 14
    iput-object p8, p0, Ll/j0z0;->f:Ll/bou0;

    .line 15
    .line 16
    iput-object p9, p0, Ll/j0z0;->g:Ll/bou0;

    .line 17
    .line 18
    return-void
.end method


# virtual methods
.method public final a()Ll/qyy0;
    .locals 11

    .line 1
    iget-object v0, p0, Ll/j0z0;->a:Ll/bou0;

    .line 2
    .line 3
    invoke-interface {v0}, Ll/bou0;->zza()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    move-object v2, v0

    .line 8
    check-cast v2, Landroid/app/Application;

    .line 9
    .line 10
    iget-object v0, p0, Ll/j0z0;->b:Ll/bou0;

    .line 11
    .line 12
    invoke-interface {v0}, Ll/bou0;->zza()Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    move-object v3, v0

    .line 17
    check-cast v3, Ll/hcr0;

    .line 18
    .line 19
    invoke-static {}, Ll/yur0;->a()Landroid/os/Handler;

    .line 20
    .line 21
    .line 22
    move-result-object v4

    .line 23
    invoke-static {}, Ll/nxr0;->a()Ljava/util/concurrent/Executor;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    move-object v5, v0

    .line 28
    check-cast v5, Ljava/util/concurrent/Executor;

    .line 29
    .line 30
    iget-object v0, p0, Ll/j0z0;->c:Ll/bou0;

    .line 31
    .line 32
    invoke-interface {v0}, Ll/bou0;->zza()Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    move-object v6, v0

    .line 37
    check-cast v6, Ll/tqr0;

    .line 38
    .line 39
    iget-object v0, p0, Ll/j0z0;->d:Ll/bou0;

    .line 40
    .line 41
    invoke-interface {v0}, Ll/bou0;->zza()Ljava/lang/Object;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    move-object v7, v0

    .line 46
    check-cast v7, Ll/ols0;

    .line 47
    .line 48
    iget-object v0, p0, Ll/j0z0;->e:Ll/bou0;

    .line 49
    .line 50
    check-cast v0, Ll/nky0;

    .line 51
    .line 52
    invoke-virtual {v0}, Ll/nky0;->a()Ll/c9y0;

    .line 53
    .line 54
    .line 55
    move-result-object v8

    .line 56
    iget-object v0, p0, Ll/j0z0;->f:Ll/bou0;

    .line 57
    .line 58
    check-cast v0, Ll/xar0;

    .line 59
    .line 60
    invoke-virtual {v0}, Ll/xar0;->a()Ll/l3z0;

    .line 61
    .line 62
    .line 63
    move-result-object v9

    .line 64
    iget-object p0, p0, Ll/j0z0;->g:Ll/bou0;

    .line 65
    .line 66
    invoke-interface {p0}, Ll/bou0;->zza()Ljava/lang/Object;

    .line 67
    .line 68
    .line 69
    move-result-object p0

    .line 70
    move-object v10, p0

    .line 71
    check-cast v10, Ll/m1v0;

    .line 72
    .line 73
    new-instance v1, Ll/qyy0;

    .line 74
    .line 75
    invoke-direct/range {v1 .. v10}, Ll/qyy0;-><init>(Landroid/app/Application;Ll/hcr0;Landroid/os/Handler;Ljava/util/concurrent/Executor;Ll/tqr0;Ll/ols0;Ll/c9y0;Ll/l3z0;Ll/m1v0;)V

    .line 76
    .line 77
    .line 78
    return-object v1
.end method

.method public final bridge synthetic zza()Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/j0z0;->a()Ll/qyy0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

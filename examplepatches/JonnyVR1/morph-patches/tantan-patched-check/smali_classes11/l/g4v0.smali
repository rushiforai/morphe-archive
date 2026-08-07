.class public final Ll/g4v0;
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
    iput-object p1, p0, Ll/g4v0;->a:Ll/kqx0;

    .line 5
    .line 6
    iput-object p2, p0, Ll/g4v0;->b:Ll/kqx0;

    .line 7
    .line 8
    iput-object p3, p0, Ll/g4v0;->c:Ll/kqx0;

    .line 9
    .line 10
    iput-object p4, p0, Ll/g4v0;->d:Ll/kqx0;

    .line 11
    .line 12
    iput-object p5, p0, Ll/g4v0;->e:Ll/kqx0;

    .line 13
    .line 14
    iput-object p6, p0, Ll/g4v0;->f:Ll/kqx0;

    .line 15
    .line 16
    iput-object p7, p0, Ll/g4v0;->g:Ll/kqx0;

    .line 17
    .line 18
    iput-object p8, p0, Ll/g4v0;->h:Ll/kqx0;

    .line 19
    .line 20
    return-void
.end method


# virtual methods
.method public final a()Ll/f4v0;
    .locals 10

    .line 1
    iget-object v0, p0, Ll/g4v0;->a:Ll/kqx0;

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
    check-cast v2, Ll/dlt0;

    .line 9
    .line 10
    iget-object v0, p0, Ll/g4v0;->b:Ll/kqx0;

    .line 11
    .line 12
    check-cast v0, Ll/jlt0;

    .line 13
    .line 14
    invoke-virtual {v0}, Ll/jlt0;->a()Landroid/content/Context;

    .line 15
    .line 16
    .line 17
    move-result-object v3

    .line 18
    iget-object v0, p0, Ll/g4v0;->c:Ll/kqx0;

    .line 19
    .line 20
    check-cast v0, Ll/vlt0;

    .line 21
    .line 22
    invoke-virtual {v0}, Ll/vlt0;->a()Lcom/google/android/gms/internal/ads/zzcei;

    .line 23
    .line 24
    .line 25
    move-result-object v4

    .line 26
    iget-object v0, p0, Ll/g4v0;->d:Ll/kqx0;

    .line 27
    .line 28
    check-cast v0, Ll/z5u0;

    .line 29
    .line 30
    invoke-virtual {v0}, Ll/z5u0;->a()Ll/o7w0;

    .line 31
    .line 32
    .line 33
    move-result-object v5

    .line 34
    sget-object v6, Ll/oct0;->a:Ll/xvw0;

    .line 35
    .line 36
    invoke-static {v6}, Ll/cqx0;->b(Ljava/lang/Object;)Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    iget-object v0, p0, Ll/g4v0;->f:Ll/kqx0;

    .line 40
    .line 41
    invoke-interface {v0}, Ll/kqx0;->zzb()Ljava/lang/Object;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    move-object v7, v0

    .line 46
    check-cast v7, Ljava/lang/String;

    .line 47
    .line 48
    iget-object v0, p0, Ll/g4v0;->g:Ll/kqx0;

    .line 49
    .line 50
    invoke-interface {v0}, Ll/kqx0;->zzb()Ljava/lang/Object;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    move-object v8, v0

    .line 55
    check-cast v8, Ll/cew0;

    .line 56
    .line 57
    iget-object p0, p0, Ll/g4v0;->h:Ll/kqx0;

    .line 58
    .line 59
    invoke-interface {p0}, Ll/kqx0;->zzb()Ljava/lang/Object;

    .line 60
    .line 61
    .line 62
    move-result-object p0

    .line 63
    move-object v9, p0

    .line 64
    check-cast v9, Ll/swu0;

    .line 65
    .line 66
    new-instance v1, Ll/f4v0;

    .line 67
    .line 68
    invoke-direct/range {v1 .. v9}, Ll/f4v0;-><init>(Ll/dlt0;Landroid/content/Context;Lcom/google/android/gms/internal/ads/zzcei;Ll/o7w0;Ljava/util/concurrent/Executor;Ljava/lang/String;Ll/cew0;Ll/swu0;)V

    .line 69
    .line 70
    .line 71
    return-object v1
.end method

.method public final bridge synthetic zzb()Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/g4v0;->a()Ll/f4v0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

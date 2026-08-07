.class public final Ll/bnu0;
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

.field public final i:Ll/kqx0;


# direct methods
.method public constructor <init>(Ll/kqx0;Ll/kqx0;Ll/kqx0;Ll/kqx0;Ll/kqx0;Ll/kqx0;Ll/kqx0;Ll/kqx0;Ll/kqx0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/bnu0;->a:Ll/kqx0;

    .line 5
    .line 6
    iput-object p2, p0, Ll/bnu0;->b:Ll/kqx0;

    .line 7
    .line 8
    iput-object p3, p0, Ll/bnu0;->c:Ll/kqx0;

    .line 9
    .line 10
    iput-object p4, p0, Ll/bnu0;->d:Ll/kqx0;

    .line 11
    .line 12
    iput-object p5, p0, Ll/bnu0;->e:Ll/kqx0;

    .line 13
    .line 14
    iput-object p6, p0, Ll/bnu0;->f:Ll/kqx0;

    .line 15
    .line 16
    iput-object p7, p0, Ll/bnu0;->g:Ll/kqx0;

    .line 17
    .line 18
    iput-object p8, p0, Ll/bnu0;->h:Ll/kqx0;

    .line 19
    .line 20
    iput-object p9, p0, Ll/bnu0;->i:Ll/kqx0;

    .line 21
    .line 22
    return-void
.end method


# virtual methods
.method public final a()Ll/anu0;
    .locals 11

    .line 1
    iget-object v0, p0, Ll/bnu0;->a:Ll/kqx0;

    .line 2
    .line 3
    check-cast v0, Ll/hlt0;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/hlt0;->a()Ll/grw0;

    .line 6
    .line 7
    .line 8
    move-result-object v2

    .line 9
    iget-object v0, p0, Ll/bnu0;->b:Ll/kqx0;

    .line 10
    .line 11
    check-cast v0, Ll/z5u0;

    .line 12
    .line 13
    invoke-virtual {v0}, Ll/z5u0;->a()Ll/o7w0;

    .line 14
    .line 15
    .line 16
    move-result-object v3

    .line 17
    iget-object v0, p0, Ll/bnu0;->c:Ll/kqx0;

    .line 18
    .line 19
    invoke-interface {v0}, Ll/kqx0;->zzb()Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    move-object v4, v0

    .line 24
    check-cast v4, Ll/zlu0;

    .line 25
    .line 26
    iget-object v0, p0, Ll/bnu0;->d:Ll/kqx0;

    .line 27
    .line 28
    check-cast v0, Ll/nmu0;

    .line 29
    .line 30
    invoke-virtual {v0}, Ll/nmu0;->a()Ll/ulu0;

    .line 31
    .line 32
    .line 33
    move-result-object v5

    .line 34
    iget-object v0, p0, Ll/bnu0;->e:Ll/kqx0;

    .line 35
    .line 36
    invoke-interface {v0}, Ll/kqx0;->zzb()Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    move-object v6, v0

    .line 41
    check-cast v6, Ll/mnu0;

    .line 42
    .line 43
    iget-object v0, p0, Ll/bnu0;->f:Ll/kqx0;

    .line 44
    .line 45
    invoke-interface {v0}, Ll/kqx0;->zzb()Ljava/lang/Object;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    move-object v7, v0

    .line 50
    check-cast v7, Ll/unu0;

    .line 51
    .line 52
    iget-object v0, p0, Ll/bnu0;->g:Ll/kqx0;

    .line 53
    .line 54
    invoke-interface {v0}, Ll/kqx0;->zzb()Ljava/lang/Object;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    move-object v8, v0

    .line 59
    check-cast v8, Ljava/util/concurrent/Executor;

    .line 60
    .line 61
    sget-object v9, Ll/oct0;->a:Ll/xvw0;

    .line 62
    .line 63
    invoke-static {v9}, Ll/cqx0;->b(Ljava/lang/Object;)Ljava/lang/Object;

    .line 64
    .line 65
    .line 66
    iget-object p0, p0, Ll/bnu0;->i:Ll/kqx0;

    .line 67
    .line 68
    invoke-interface {p0}, Ll/kqx0;->zzb()Ljava/lang/Object;

    .line 69
    .line 70
    .line 71
    move-result-object p0

    .line 72
    move-object v10, p0

    .line 73
    check-cast v10, Ll/klu0;

    .line 74
    .line 75
    new-instance v1, Ll/anu0;

    .line 76
    .line 77
    invoke-direct/range {v1 .. v10}, Ll/anu0;-><init>(Ll/grw0;Ll/o7w0;Ll/zlu0;Ll/ulu0;Ll/mnu0;Ll/unu0;Ljava/util/concurrent/Executor;Ljava/util/concurrent/Executor;Ll/klu0;)V

    .line 78
    .line 79
    .line 80
    return-object v1
.end method

.method public final bridge synthetic zzb()Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/bnu0;->a()Ll/anu0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

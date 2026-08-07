.class public final Ll/b4v0;
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


# direct methods
.method public constructor <init>(Ll/kqx0;Ll/kqx0;Ll/kqx0;Ll/kqx0;Ll/kqx0;Ll/kqx0;Ll/kqx0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/b4v0;->a:Ll/kqx0;

    .line 5
    .line 6
    iput-object p2, p0, Ll/b4v0;->b:Ll/kqx0;

    .line 7
    .line 8
    iput-object p3, p0, Ll/b4v0;->c:Ll/kqx0;

    .line 9
    .line 10
    iput-object p4, p0, Ll/b4v0;->d:Ll/kqx0;

    .line 11
    .line 12
    iput-object p5, p0, Ll/b4v0;->e:Ll/kqx0;

    .line 13
    .line 14
    iput-object p6, p0, Ll/b4v0;->f:Ll/kqx0;

    .line 15
    .line 16
    iput-object p7, p0, Ll/b4v0;->g:Ll/kqx0;

    .line 17
    .line 18
    return-void
.end method


# virtual methods
.method public final bridge synthetic zzb()Ljava/lang/Object;
    .locals 9

    .line 1
    iget-object v0, p0, Ll/b4v0;->a:Ll/kqx0;

    .line 2
    .line 3
    check-cast v0, Ll/jlt0;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/jlt0;->a()Landroid/content/Context;

    .line 6
    .line 7
    .line 8
    move-result-object v2

    .line 9
    iget-object v0, p0, Ll/b4v0;->b:Ll/kqx0;

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
    iget-object v0, p0, Ll/b4v0;->c:Ll/kqx0;

    .line 18
    .line 19
    check-cast v0, Ll/w2v0;

    .line 20
    .line 21
    invoke-virtual {v0}, Ll/w2v0;->a()Ll/v2v0;

    .line 22
    .line 23
    .line 24
    move-result-object v4

    .line 25
    sget-object v5, Ll/oct0;->a:Ll/xvw0;

    .line 26
    .line 27
    invoke-static {v5}, Ll/cqx0;->b(Ljava/lang/Object;)Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    iget-object v0, p0, Ll/b4v0;->e:Ll/kqx0;

    .line 31
    .line 32
    invoke-interface {v0}, Ll/kqx0;->zzb()Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    move-object v6, v0

    .line 37
    check-cast v6, Ljava/util/concurrent/ScheduledExecutorService;

    .line 38
    .line 39
    iget-object v0, p0, Ll/b4v0;->f:Ll/kqx0;

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
    check-cast v7, Ll/u9v0;

    .line 47
    .line 48
    iget-object p0, p0, Ll/b4v0;->g:Ll/kqx0;

    .line 49
    .line 50
    invoke-interface {p0}, Ll/kqx0;->zzb()Ljava/lang/Object;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    move-object v8, p0

    .line 55
    check-cast v8, Ll/cew0;

    .line 56
    .line 57
    new-instance v1, Ll/a4v0;

    .line 58
    .line 59
    invoke-direct/range {v1 .. v8}, Ll/a4v0;-><init>(Landroid/content/Context;Ll/o7w0;Ll/v2v0;Ll/xvw0;Ljava/util/concurrent/ScheduledExecutorService;Ll/u9v0;Ll/cew0;)V

    .line 60
    .line 61
    .line 62
    return-object v1
.end method

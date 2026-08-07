.class public final Ll/v7v0;
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
    iput-object p1, p0, Ll/v7v0;->a:Ll/kqx0;

    .line 5
    .line 6
    iput-object p2, p0, Ll/v7v0;->b:Ll/kqx0;

    .line 7
    .line 8
    iput-object p3, p0, Ll/v7v0;->c:Ll/kqx0;

    .line 9
    .line 10
    iput-object p4, p0, Ll/v7v0;->d:Ll/kqx0;

    .line 11
    .line 12
    iput-object p5, p0, Ll/v7v0;->e:Ll/kqx0;

    .line 13
    .line 14
    iput-object p6, p0, Ll/v7v0;->f:Ll/kqx0;

    .line 15
    .line 16
    iput-object p7, p0, Ll/v7v0;->g:Ll/kqx0;

    .line 17
    .line 18
    iput-object p8, p0, Ll/v7v0;->h:Ll/kqx0;

    .line 19
    .line 20
    return-void
.end method


# virtual methods
.method public final synthetic zzb()Ljava/lang/Object;
    .locals 10

    .line 1
    iget-object v0, p0, Ll/v7v0;->a:Ll/kqx0;

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
    sget-object v3, Ll/oct0;->a:Ll/xvw0;

    .line 10
    .line 11
    invoke-static {v3}, Ll/cqx0;->b(Ljava/lang/Object;)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    new-instance v4, Ll/b5t0;

    .line 15
    .line 16
    invoke-direct {v4}, Ll/b5t0;-><init>()V

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Ll/v7v0;->d:Ll/kqx0;

    .line 20
    .line 21
    check-cast v0, Ll/slt0;

    .line 22
    .line 23
    invoke-virtual {v0}, Ll/slt0;->a()Ll/cst0;

    .line 24
    .line 25
    .line 26
    move-result-object v5

    .line 27
    iget-object v0, p0, Ll/v7v0;->e:Ll/kqx0;

    .line 28
    .line 29
    check-cast v0, Ll/s8v0;

    .line 30
    .line 31
    invoke-virtual {v0}, Ll/s8v0;->a()Ll/r8v0;

    .line 32
    .line 33
    .line 34
    move-result-object v6

    .line 35
    iget-object v0, p0, Ll/v7v0;->f:Ll/kqx0;

    .line 36
    .line 37
    invoke-interface {v0}, Ll/kqx0;->zzb()Ljava/lang/Object;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    move-object v7, v0

    .line 42
    check-cast v7, Ljava/util/ArrayDeque;

    .line 43
    .line 44
    new-instance v8, Ll/o8v0;

    .line 45
    .line 46
    invoke-direct {v8}, Ll/o8v0;-><init>()V

    .line 47
    .line 48
    .line 49
    iget-object p0, p0, Ll/v7v0;->h:Ll/kqx0;

    .line 50
    .line 51
    invoke-interface {p0}, Ll/kqx0;->zzb()Ljava/lang/Object;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    move-object v9, p0

    .line 56
    check-cast v9, Ll/hew0;

    .line 57
    .line 58
    new-instance v1, Ll/u7v0;

    .line 59
    .line 60
    invoke-direct/range {v1 .. v9}, Ll/u7v0;-><init>(Landroid/content/Context;Ll/xvw0;Ll/b5t0;Ll/cst0;Ll/r8v0;Ljava/util/ArrayDeque;Ll/o8v0;Ll/hew0;)V

    .line 61
    .line 62
    .line 63
    return-object v1
.end method

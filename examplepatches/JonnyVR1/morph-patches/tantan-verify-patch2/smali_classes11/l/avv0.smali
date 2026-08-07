.class public final Ll/avv0;
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
    iput-object p1, p0, Ll/avv0;->a:Ll/kqx0;

    .line 5
    .line 6
    iput-object p2, p0, Ll/avv0;->b:Ll/kqx0;

    .line 7
    .line 8
    iput-object p3, p0, Ll/avv0;->c:Ll/kqx0;

    .line 9
    .line 10
    iput-object p4, p0, Ll/avv0;->d:Ll/kqx0;

    .line 11
    .line 12
    iput-object p5, p0, Ll/avv0;->e:Ll/kqx0;

    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public final a()Ll/zuv0;
    .locals 7

    .line 1
    iget-object v0, p0, Ll/avv0;->a:Ll/kqx0;

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
    iget-object v0, p0, Ll/avv0;->c:Ll/kqx0;

    .line 15
    .line 16
    check-cast v0, Ll/iqx0;

    .line 17
    .line 18
    invoke-virtual {v0}, Ll/iqx0;->b()Ljava/util/Set;

    .line 19
    .line 20
    .line 21
    move-result-object v4

    .line 22
    iget-object v0, p0, Ll/avv0;->d:Ll/kqx0;

    .line 23
    .line 24
    invoke-interface {v0}, Ll/kqx0;->zzb()Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    move-object v5, v0

    .line 29
    check-cast v5, Ll/cew0;

    .line 30
    .line 31
    iget-object p0, p0, Ll/avv0;->e:Ll/kqx0;

    .line 32
    .line 33
    invoke-interface {p0}, Ll/kqx0;->zzb()Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    move-object v6, p0

    .line 38
    check-cast v6, Ll/xwu0;

    .line 39
    .line 40
    new-instance v1, Ll/zuv0;

    .line 41
    .line 42
    invoke-direct/range {v1 .. v6}, Ll/zuv0;-><init>(Landroid/content/Context;Ljava/util/concurrent/Executor;Ljava/util/Set;Ll/cew0;Ll/xwu0;)V

    .line 43
    .line 44
    .line 45
    return-object v1
.end method

.method public final bridge synthetic zzb()Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/avv0;->a()Ll/zuv0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

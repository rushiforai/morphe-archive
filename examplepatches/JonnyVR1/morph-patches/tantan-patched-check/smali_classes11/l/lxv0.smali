.class public final Ll/lxv0;
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
    iput-object p1, p0, Ll/lxv0;->a:Ll/kqx0;

    .line 5
    .line 6
    iput-object p2, p0, Ll/lxv0;->b:Ll/kqx0;

    .line 7
    .line 8
    iput-object p3, p0, Ll/lxv0;->c:Ll/kqx0;

    .line 9
    .line 10
    iput-object p4, p0, Ll/lxv0;->d:Ll/kqx0;

    .line 11
    .line 12
    iput-object p5, p0, Ll/lxv0;->e:Ll/kqx0;

    .line 13
    .line 14
    iput-object p6, p0, Ll/lxv0;->f:Ll/kqx0;

    .line 15
    .line 16
    iput-object p7, p0, Ll/lxv0;->g:Ll/kqx0;

    .line 17
    .line 18
    return-void
.end method


# virtual methods
.method public final bridge synthetic zzb()Ljava/lang/Object;
    .locals 8

    .line 1
    new-instance v1, Ll/vat0;

    .line 2
    .line 3
    invoke-direct {v1}, Ll/vat0;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/lxv0;->b:Ll/kqx0;

    .line 7
    .line 8
    check-cast v0, Ll/tzv0;

    .line 9
    .line 10
    invoke-virtual {v0}, Ll/tzv0;->a()Ljava/lang/Integer;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 15
    .line 16
    .line 17
    move-result v2

    .line 18
    iget-object v0, p0, Ll/lxv0;->c:Ll/kqx0;

    .line 19
    .line 20
    check-cast v0, Ll/jlt0;

    .line 21
    .line 22
    invoke-virtual {v0}, Ll/jlt0;->a()Landroid/content/Context;

    .line 23
    .line 24
    .line 25
    move-result-object v3

    .line 26
    iget-object v0, p0, Ll/lxv0;->d:Ll/kqx0;

    .line 27
    .line 28
    invoke-interface {v0}, Ll/kqx0;->zzb()Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    move-object v4, v0

    .line 33
    check-cast v4, Ll/ebt0;

    .line 34
    .line 35
    iget-object v0, p0, Ll/lxv0;->e:Ll/kqx0;

    .line 36
    .line 37
    invoke-interface {v0}, Ll/kqx0;->zzb()Ljava/lang/Object;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    move-object v5, v0

    .line 42
    check-cast v5, Ljava/util/concurrent/ScheduledExecutorService;

    .line 43
    .line 44
    sget-object v6, Ll/oct0;->a:Ll/xvw0;

    .line 45
    .line 46
    invoke-static {v6}, Ll/cqx0;->b(Ljava/lang/Object;)Ljava/lang/Object;

    .line 47
    .line 48
    .line 49
    iget-object p0, p0, Ll/lxv0;->g:Ll/kqx0;

    .line 50
    .line 51
    check-cast p0, Ll/szv0;

    .line 52
    .line 53
    invoke-virtual {p0}, Ll/szv0;->a()Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object v7

    .line 57
    new-instance v0, Ll/jxv0;

    .line 58
    .line 59
    invoke-direct/range {v0 .. v7}, Ll/jxv0;-><init>(Ll/vat0;ILandroid/content/Context;Ll/ebt0;Ljava/util/concurrent/ScheduledExecutorService;Ljava/util/concurrent/Executor;Ljava/lang/String;)V

    .line 60
    .line 61
    .line 62
    return-object v0
.end method

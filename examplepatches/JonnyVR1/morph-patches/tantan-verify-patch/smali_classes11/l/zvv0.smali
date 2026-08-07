.class public final Ll/zvv0;
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
    iput-object p1, p0, Ll/zvv0;->a:Ll/kqx0;

    .line 5
    .line 6
    iput-object p2, p0, Ll/zvv0;->b:Ll/kqx0;

    .line 7
    .line 8
    iput-object p3, p0, Ll/zvv0;->c:Ll/kqx0;

    .line 9
    .line 10
    iput-object p4, p0, Ll/zvv0;->d:Ll/kqx0;

    .line 11
    .line 12
    iput-object p5, p0, Ll/zvv0;->e:Ll/kqx0;

    .line 13
    .line 14
    iput-object p6, p0, Ll/zvv0;->f:Ll/kqx0;

    .line 15
    .line 16
    iput-object p7, p0, Ll/zvv0;->g:Ll/kqx0;

    .line 17
    .line 18
    return-void
.end method

.method public static a(Ll/vat0;Landroid/content/Context;Ljava/util/concurrent/ScheduledExecutorService;Ljava/util/concurrent/Executor;IZZ)Ll/xvv0;
    .locals 8

    .line 1
    new-instance v0, Ll/xvv0;

    .line 2
    .line 3
    move-object v1, p0

    .line 4
    move-object v2, p1

    .line 5
    move-object v3, p2

    .line 6
    move-object v4, p3

    .line 7
    move v5, p4

    .line 8
    move v6, p5

    .line 9
    move v7, p6

    .line 10
    invoke-direct/range {v0 .. v7}, Ll/xvv0;-><init>(Ll/vat0;Landroid/content/Context;Ljava/util/concurrent/ScheduledExecutorService;Ljava/util/concurrent/Executor;IZZ)V

    .line 11
    .line 12
    .line 13
    return-object v0
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
    iget-object v0, p0, Ll/zvv0;->b:Ll/kqx0;

    .line 7
    .line 8
    check-cast v0, Ll/jlt0;

    .line 9
    .line 10
    invoke-virtual {v0}, Ll/jlt0;->a()Landroid/content/Context;

    .line 11
    .line 12
    .line 13
    move-result-object v2

    .line 14
    iget-object v0, p0, Ll/zvv0;->c:Ll/kqx0;

    .line 15
    .line 16
    invoke-interface {v0}, Ll/kqx0;->zzb()Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    move-object v3, v0

    .line 21
    check-cast v3, Ljava/util/concurrent/ScheduledExecutorService;

    .line 22
    .line 23
    sget-object v4, Ll/oct0;->a:Ll/xvw0;

    .line 24
    .line 25
    invoke-static {v4}, Ll/cqx0;->b(Ljava/lang/Object;)Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    iget-object v0, p0, Ll/zvv0;->e:Ll/kqx0;

    .line 29
    .line 30
    check-cast v0, Ll/tzv0;

    .line 31
    .line 32
    invoke-virtual {v0}, Ll/tzv0;->a()Ljava/lang/Integer;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 37
    .line 38
    .line 39
    move-result v5

    .line 40
    iget-object v0, p0, Ll/zvv0;->f:Ll/kqx0;

    .line 41
    .line 42
    check-cast v0, Ll/uzv0;

    .line 43
    .line 44
    invoke-virtual {v0}, Ll/uzv0;->a()Ljava/lang/Boolean;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 49
    .line 50
    .line 51
    move-result v6

    .line 52
    iget-object p0, p0, Ll/zvv0;->g:Ll/kqx0;

    .line 53
    .line 54
    check-cast p0, Ll/wzv0;

    .line 55
    .line 56
    invoke-virtual {p0}, Ll/wzv0;->a()Ljava/lang/Boolean;

    .line 57
    .line 58
    .line 59
    move-result-object p0

    .line 60
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 61
    .line 62
    .line 63
    move-result v7

    .line 64
    new-instance v0, Ll/xvv0;

    .line 65
    .line 66
    invoke-direct/range {v0 .. v7}, Ll/xvv0;-><init>(Ll/vat0;Landroid/content/Context;Ljava/util/concurrent/ScheduledExecutorService;Ljava/util/concurrent/Executor;IZZ)V

    .line 67
    .line 68
    .line 69
    return-object v0
.end method

.class public final Ll/ztv0;
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


# direct methods
.method public constructor <init>(Ll/kqx0;Ll/kqx0;Ll/kqx0;Ll/kqx0;Ll/kqx0;Ll/kqx0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/ztv0;->a:Ll/kqx0;

    .line 5
    .line 6
    iput-object p2, p0, Ll/ztv0;->b:Ll/kqx0;

    .line 7
    .line 8
    iput-object p3, p0, Ll/ztv0;->c:Ll/kqx0;

    .line 9
    .line 10
    iput-object p4, p0, Ll/ztv0;->d:Ll/kqx0;

    .line 11
    .line 12
    iput-object p5, p0, Ll/ztv0;->e:Ll/kqx0;

    .line 13
    .line 14
    iput-object p6, p0, Ll/ztv0;->f:Ll/kqx0;

    .line 15
    .line 16
    return-void
.end method


# virtual methods
.method public final bridge synthetic zzb()Ljava/lang/Object;
    .locals 7

    .line 1
    sget-object v1, Ll/oct0;->a:Ll/xvw0;

    .line 2
    .line 3
    invoke-static {v1}, Ll/cqx0;->b(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/ztv0;->b:Ll/kqx0;

    .line 7
    .line 8
    invoke-interface {v0}, Ll/kqx0;->zzb()Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    move-object v2, v0

    .line 13
    check-cast v2, Ljava/util/concurrent/ScheduledExecutorService;

    .line 14
    .line 15
    iget-object v0, p0, Ll/ztv0;->c:Ll/kqx0;

    .line 16
    .line 17
    invoke-interface {v0}, Ll/kqx0;->zzb()Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    move-object v3, v0

    .line 22
    check-cast v3, Ljava/lang/String;

    .line 23
    .line 24
    iget-object v0, p0, Ll/ztv0;->d:Ll/kqx0;

    .line 25
    .line 26
    invoke-interface {v0}, Ll/kqx0;->zzb()Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    move-object v4, v0

    .line 31
    check-cast v4, Landroid/content/Context;

    .line 32
    .line 33
    iget-object v0, p0, Ll/ztv0;->e:Ll/kqx0;

    .line 34
    .line 35
    check-cast v0, Ll/z5u0;

    .line 36
    .line 37
    invoke-virtual {v0}, Ll/z5u0;->a()Ll/o7w0;

    .line 38
    .line 39
    .line 40
    move-result-object v5

    .line 41
    iget-object p0, p0, Ll/ztv0;->f:Ll/kqx0;

    .line 42
    .line 43
    invoke-interface {p0}, Ll/kqx0;->zzb()Ljava/lang/Object;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    move-object v6, p0

    .line 48
    check-cast v6, Ll/dlt0;

    .line 49
    .line 50
    new-instance v0, Ll/xtv0;

    .line 51
    .line 52
    invoke-direct/range {v0 .. v6}, Ll/xtv0;-><init>(Ll/xvw0;Ljava/util/concurrent/ScheduledExecutorService;Ljava/lang/String;Landroid/content/Context;Ll/o7w0;Ll/dlt0;)V

    .line 53
    .line 54
    .line 55
    return-object v0
.end method

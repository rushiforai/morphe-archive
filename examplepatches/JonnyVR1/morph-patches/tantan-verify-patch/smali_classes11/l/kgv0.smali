.class public final Ll/kgv0;
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
    iput-object p1, p0, Ll/kgv0;->a:Ll/kqx0;

    .line 5
    .line 6
    iput-object p2, p0, Ll/kgv0;->b:Ll/kqx0;

    .line 7
    .line 8
    iput-object p3, p0, Ll/kgv0;->c:Ll/kqx0;

    .line 9
    .line 10
    iput-object p4, p0, Ll/kgv0;->d:Ll/kqx0;

    .line 11
    .line 12
    iput-object p5, p0, Ll/kgv0;->e:Ll/kqx0;

    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public final a()Ll/igv0;
    .locals 6

    .line 1
    sget-object v1, Ll/oct0;->a:Ll/xvw0;

    .line 2
    .line 3
    invoke-static {v1}, Ll/cqx0;->b(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/kgv0;->b:Ll/kqx0;

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
    iget-object v0, p0, Ll/kgv0;->c:Ll/kqx0;

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
    check-cast v3, Ll/nzt0;

    .line 23
    .line 24
    iget-object v0, p0, Ll/kgv0;->d:Ll/kqx0;

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
    check-cast v4, Ll/ehv0;

    .line 32
    .line 33
    iget-object p0, p0, Ll/kgv0;->e:Ll/kqx0;

    .line 34
    .line 35
    invoke-interface {p0}, Ll/kqx0;->zzb()Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    move-object v5, p0

    .line 40
    check-cast v5, Ll/uew0;

    .line 41
    .line 42
    new-instance v0, Ll/igv0;

    .line 43
    .line 44
    invoke-direct/range {v0 .. v5}, Ll/igv0;-><init>(Ljava/util/concurrent/Executor;Ljava/util/concurrent/ScheduledExecutorService;Ll/nzt0;Ll/ehv0;Ll/uew0;)V

    .line 45
    .line 46
    .line 47
    return-object v0
.end method

.method public final bridge synthetic zzb()Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/kgv0;->a()Ll/igv0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

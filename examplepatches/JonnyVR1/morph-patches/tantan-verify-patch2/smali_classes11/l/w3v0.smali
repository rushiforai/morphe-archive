.class public final Ll/w3v0;
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
    iput-object p1, p0, Ll/w3v0;->a:Ll/kqx0;

    .line 5
    .line 6
    iput-object p2, p0, Ll/w3v0;->b:Ll/kqx0;

    .line 7
    .line 8
    iput-object p3, p0, Ll/w3v0;->c:Ll/kqx0;

    .line 9
    .line 10
    iput-object p4, p0, Ll/w3v0;->d:Ll/kqx0;

    .line 11
    .line 12
    iput-object p5, p0, Ll/w3v0;->e:Ll/kqx0;

    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public final a()Ll/v3v0;
    .locals 7

    .line 1
    iget-object v0, p0, Ll/w3v0;->a:Ll/kqx0;

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
    check-cast v2, Ljava/util/concurrent/ScheduledExecutorService;

    .line 9
    .line 10
    sget-object v3, Ll/oct0;->a:Ll/xvw0;

    .line 11
    .line 12
    invoke-static {v3}, Ll/cqx0;->b(Ljava/lang/Object;)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    sget-object v4, Ll/oct0;->b:Ll/xvw0;

    .line 16
    .line 17
    invoke-static {v4}, Ll/cqx0;->b(Ljava/lang/Object;)Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Ll/w3v0;->d:Ll/kqx0;

    .line 21
    .line 22
    check-cast v0, Ll/n4v0;

    .line 23
    .line 24
    invoke-virtual {v0}, Ll/n4v0;->a()Ll/m4v0;

    .line 25
    .line 26
    .line 27
    move-result-object v5

    .line 28
    iget-object p0, p0, Ll/w3v0;->e:Ll/kqx0;

    .line 29
    .line 30
    invoke-static {p0}, Ll/fqx0;->a(Ll/kqx0;)Ll/dqx0;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    invoke-static {p0}, Ll/tpx0;->a(Ll/dqx0;)Ll/kpx0;

    .line 35
    .line 36
    .line 37
    move-result-object v6

    .line 38
    new-instance v1, Ll/v3v0;

    .line 39
    .line 40
    invoke-direct/range {v1 .. v6}, Ll/v3v0;-><init>(Ljava/util/concurrent/ScheduledExecutorService;Ll/xvw0;Ll/xvw0;Ll/m4v0;Ll/kpx0;)V

    .line 41
    .line 42
    .line 43
    return-object v1
.end method

.method public final bridge synthetic zzb()Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/w3v0;->a()Ll/v3v0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

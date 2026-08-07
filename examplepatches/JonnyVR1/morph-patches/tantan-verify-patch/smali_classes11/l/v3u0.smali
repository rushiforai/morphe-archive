.class public final Ll/v3u0;
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
    iput-object p1, p0, Ll/v3u0;->a:Ll/kqx0;

    .line 5
    .line 6
    iput-object p2, p0, Ll/v3u0;->b:Ll/kqx0;

    .line 7
    .line 8
    iput-object p3, p0, Ll/v3u0;->c:Ll/kqx0;

    .line 9
    .line 10
    iput-object p4, p0, Ll/v3u0;->d:Ll/kqx0;

    .line 11
    .line 12
    iput-object p5, p0, Ll/v3u0;->e:Ll/kqx0;

    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public final bridge synthetic zzb()Ljava/lang/Object;
    .locals 7

    .line 1
    iget-object v0, p0, Ll/v3u0;->a:Ll/kqx0;

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
    check-cast v2, Ll/h7u0;

    .line 9
    .line 10
    iget-object v0, p0, Ll/v3u0;->b:Ll/kqx0;

    .line 11
    .line 12
    check-cast v0, Ll/b0u0;

    .line 13
    .line 14
    invoke-virtual {v0}, Ll/b0u0;->a()Ll/q6w0;

    .line 15
    .line 16
    .line 17
    move-result-object v3

    .line 18
    iget-object v0, p0, Ll/v3u0;->c:Ll/kqx0;

    .line 19
    .line 20
    invoke-interface {v0}, Ll/kqx0;->zzb()Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    move-object v4, v0

    .line 25
    check-cast v4, Ljava/util/concurrent/ScheduledExecutorService;

    .line 26
    .line 27
    sget-object v5, Ll/oct0;->a:Ll/xvw0;

    .line 28
    .line 29
    invoke-static {v5}, Ll/cqx0;->b(Ljava/lang/Object;)Ljava/lang/Object;

    .line 30
    .line 31
    .line 32
    iget-object p0, p0, Ll/v3u0;->e:Ll/kqx0;

    .line 33
    .line 34
    check-cast p0, Ll/c0u0;

    .line 35
    .line 36
    invoke-virtual {p0}, Ll/c0u0;->a()Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object v6

    .line 40
    new-instance v1, Ll/u3u0;

    .line 41
    .line 42
    invoke-direct/range {v1 .. v6}, Ll/u3u0;-><init>(Ll/h7u0;Ll/q6w0;Ljava/util/concurrent/ScheduledExecutorService;Ljava/util/concurrent/Executor;Ljava/lang/String;)V

    .line 43
    .line 44
    .line 45
    return-object v1
.end method

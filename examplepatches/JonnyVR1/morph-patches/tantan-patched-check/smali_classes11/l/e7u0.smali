.class public final Ll/e7u0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/upx0;


# instance fields
.field public final a:Ll/kqx0;

.field public final b:Ll/kqx0;

.field public final c:Ll/kqx0;

.field public final d:Ll/kqx0;


# direct methods
.method public constructor <init>(Ll/kqx0;Ll/kqx0;Ll/kqx0;Ll/kqx0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/e7u0;->a:Ll/kqx0;

    .line 5
    .line 6
    iput-object p2, p0, Ll/e7u0;->b:Ll/kqx0;

    .line 7
    .line 8
    iput-object p3, p0, Ll/e7u0;->c:Ll/kqx0;

    .line 9
    .line 10
    iput-object p4, p0, Ll/e7u0;->d:Ll/kqx0;

    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public final bridge synthetic zzb()Ljava/lang/Object;
    .locals 4

    .line 1
    iget-object v0, p0, Ll/e7u0;->a:Ll/kqx0;

    .line 2
    .line 3
    check-cast v0, Ll/d7u0;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/d7u0;->a()Ll/b7u0;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-object v1, p0, Ll/e7u0;->b:Ll/kqx0;

    .line 10
    .line 11
    check-cast v1, Ll/iqx0;

    .line 12
    .line 13
    invoke-virtual {v1}, Ll/iqx0;->b()Ljava/util/Set;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    sget-object v2, Ll/oct0;->a:Ll/xvw0;

    .line 18
    .line 19
    invoke-static {v2}, Ll/cqx0;->b(Ljava/lang/Object;)Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    iget-object p0, p0, Ll/e7u0;->d:Ll/kqx0;

    .line 23
    .line 24
    invoke-interface {p0}, Ll/kqx0;->zzb()Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    check-cast p0, Ljava/util/concurrent/ScheduledExecutorService;

    .line 29
    .line 30
    new-instance v3, Ll/c7u0;

    .line 31
    .line 32
    invoke-direct {v3, v0, v1, v2, p0}, Ll/c7u0;-><init>(Ll/b7u0;Ljava/util/Set;Ljava/util/concurrent/Executor;Ljava/util/concurrent/ScheduledExecutorService;)V

    .line 33
    .line 34
    .line 35
    return-object v3
.end method

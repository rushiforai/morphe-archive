.class public final Ll/wcw0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/upx0;


# instance fields
.field public final a:Ll/kqx0;

.field public final b:Ll/kqx0;

.field public final c:Ll/kqx0;


# direct methods
.method public constructor <init>(Ll/kqx0;Ll/kqx0;Ll/kqx0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/wcw0;->a:Ll/kqx0;

    .line 5
    .line 6
    iput-object p2, p0, Ll/wcw0;->b:Ll/kqx0;

    .line 7
    .line 8
    iput-object p3, p0, Ll/wcw0;->c:Ll/kqx0;

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final bridge synthetic zzb()Ljava/lang/Object;
    .locals 4

    .line 1
    iget-object v0, p0, Ll/wcw0;->a:Ll/kqx0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/fqx0;->a(Ll/kqx0;)Ll/dqx0;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Ll/tpx0;->a(Ll/dqx0;)Ll/kpx0;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iget-object v1, p0, Ll/wcw0;->b:Ll/kqx0;

    .line 12
    .line 13
    invoke-static {v1}, Ll/fqx0;->a(Ll/kqx0;)Ll/dqx0;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-static {v1}, Ll/tpx0;->a(Ll/dqx0;)Ll/kpx0;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    iget-object p0, p0, Ll/wcw0;->c:Ll/kqx0;

    .line 22
    .line 23
    invoke-interface {p0}, Ll/kqx0;->zzb()Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    check-cast p0, Ljava/util/concurrent/ScheduledExecutorService;

    .line 28
    .line 29
    sget-object v2, Ll/sgs0;->A8:Ll/dgs0;

    .line 30
    .line 31
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 32
    .line 33
    .line 34
    move-result-object v3

    .line 35
    invoke-virtual {v3, v2}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    move-result-object v2

    .line 39
    check-cast v2, Ljava/lang/Boolean;

    .line 40
    .line 41
    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    .line 42
    .line 43
    .line 44
    move-result v2

    .line 45
    if-eqz v2, :cond_0

    .line 46
    .line 47
    new-instance v1, Ll/ycw0;

    .line 48
    .line 49
    invoke-interface {v0}, Ll/kpx0;->zzb()Ljava/lang/Object;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    check-cast v0, Ll/vcw0;

    .line 54
    .line 55
    invoke-direct {v1, v0, p0}, Ll/ycw0;-><init>(Ll/vcw0;Ljava/util/concurrent/ScheduledExecutorService;)V

    .line 56
    .line 57
    .line 58
    goto :goto_0

    .line 59
    :cond_0
    invoke-interface {v1}, Ll/kpx0;->zzb()Ljava/lang/Object;

    .line 60
    .line 61
    .line 62
    move-result-object p0

    .line 63
    move-object v1, p0

    .line 64
    check-cast v1, Ll/vcw0;

    .line 65
    .line 66
    :goto_0
    invoke-static {v1}, Ll/cqx0;->b(Ljava/lang/Object;)Ljava/lang/Object;

    .line 67
    .line 68
    .line 69
    return-object v1
.end method

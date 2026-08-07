.class public final Ll/wvu0;
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
    iput-object p1, p0, Ll/wvu0;->a:Ll/kqx0;

    .line 5
    .line 6
    iput-object p2, p0, Ll/wvu0;->b:Ll/kqx0;

    .line 7
    .line 8
    iput-object p3, p0, Ll/wvu0;->c:Ll/kqx0;

    .line 9
    .line 10
    iput-object p4, p0, Ll/wvu0;->d:Ll/kqx0;

    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public final bridge synthetic zzb()Ljava/lang/Object;
    .locals 5

    .line 1
    iget-object v0, p0, Ll/wvu0;->a:Ll/kqx0;

    .line 2
    .line 3
    invoke-interface {v0}, Ll/kqx0;->zzb()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ljava/lang/String;

    .line 8
    .line 9
    iget-object v1, p0, Ll/wvu0;->b:Ll/kqx0;

    .line 10
    .line 11
    check-cast v1, Ll/jlt0;

    .line 12
    .line 13
    invoke-virtual {v1}, Ll/jlt0;->a()Landroid/content/Context;

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
    iget-object p0, p0, Ll/wvu0;->d:Ll/kqx0;

    .line 23
    .line 24
    check-cast p0, Ll/ypx0;

    .line 25
    .line 26
    invoke-virtual {p0}, Ll/ypx0;->c()Ljava/util/Map;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    sget-object v3, Ll/sgs0;->O4:Ll/dgs0;

    .line 31
    .line 32
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 33
    .line 34
    .line 35
    move-result-object v4

    .line 36
    invoke-virtual {v4, v3}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    move-result-object v3

    .line 40
    check-cast v3, Ljava/lang/Boolean;

    .line 41
    .line 42
    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    .line 43
    .line 44
    .line 45
    move-result v3

    .line 46
    if-eqz v3, :cond_0

    .line 47
    .line 48
    new-instance v3, Ll/fcs0;

    .line 49
    .line 50
    new-instance v4, Ll/lcs0;

    .line 51
    .line 52
    invoke-direct {v4, v1}, Ll/lcs0;-><init>(Landroid/content/Context;)V

    .line 53
    .line 54
    .line 55
    invoke-direct {v3, v4}, Ll/fcs0;-><init>(Ll/lcs0;)V

    .line 56
    .line 57
    .line 58
    new-instance v1, Ll/xvu0;

    .line 59
    .line 60
    invoke-direct {v1, v0}, Ll/xvu0;-><init>(Ljava/lang/String;)V

    .line 61
    .line 62
    .line 63
    invoke-virtual {v3, v1}, Ll/fcs0;->b(Ll/ecs0;)V

    .line 64
    .line 65
    .line 66
    new-instance v0, Ll/zvu0;

    .line 67
    .line 68
    invoke-direct {v0, v3, p0}, Ll/zvu0;-><init>(Ll/fcs0;Ljava/util/Map;)V

    .line 69
    .line 70
    .line 71
    new-instance p0, Ll/yfu0;

    .line 72
    .line 73
    invoke-direct {p0, v0, v2}, Ll/yfu0;-><init>(Ljava/lang/Object;Ljava/util/concurrent/Executor;)V

    .line 74
    .line 75
    .line 76
    invoke-static {p0}, Ljava/util/Collections;->singleton(Ljava/lang/Object;)Ljava/util/Set;

    .line 77
    .line 78
    .line 79
    move-result-object p0

    .line 80
    goto :goto_0

    .line 81
    :cond_0
    sget-object p0, Ljava/util/Collections;->EMPTY_SET:Ljava/util/Set;

    .line 82
    .line 83
    :goto_0
    invoke-static {p0}, Ll/cqx0;->b(Ljava/lang/Object;)Ljava/lang/Object;

    .line 84
    .line 85
    .line 86
    return-object p0
.end method

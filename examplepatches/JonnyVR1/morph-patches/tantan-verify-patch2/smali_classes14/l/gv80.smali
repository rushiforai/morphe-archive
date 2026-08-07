.class public Ll/gv80;
.super Ll/kj1;
.source "SourceFile"


# instance fields
.field public final e:Ljava/util/Random;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ll/kj1;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/Random;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/Random;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/gv80;->e:Ljava/util/Random;

    .line 10
    .line 11
    return-void
.end method

.method public static synthetic i(Ll/uxr;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/uxr;->H()Ll/ph4;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ll/ph4;->a()F

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    const v0, 0x3a83126f    # 0.001f

    .line 10
    .line 11
    .line 12
    cmpl-float p0, p0, v0

    .line 13
    .line 14
    if-ltz p0, :cond_0

    .line 15
    .line 16
    const/4 p0, 0x1

    .line 17
    goto :goto_0

    .line 18
    :cond_0
    const/4 p0, 0x0

    .line 19
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    return-object p0
.end method

.method public static synthetic j(Ll/uxr;)Ljava/lang/Float;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/uxr;->H()Ll/ph4;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ll/ph4;->a()F

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    invoke-static {p0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method


# virtual methods
.method public d(Lcom/p1/mobile/putong/live/base/util/IntSet;)V
    .locals 3

    .line 1
    invoke-virtual {p0, p1}, Ll/kj1;->b(Lcom/p1/mobile/putong/live/base/util/IntSet;)Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    new-instance v0, Ll/ev80;

    .line 6
    .line 7
    invoke-direct {v0}, Ll/ev80;-><init>()V

    .line 8
    .line 9
    .line 10
    invoke-static {p1, v0}, Ll/jyb;->n(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    invoke-virtual {p0, p1}, Ll/kj1;->c(Ljava/util/List;)Ll/uxr;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-virtual {p0, p1}, Ll/gv80;->l(Ljava/util/Collection;)Ljava/util/List;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    if-eqz v0, :cond_0

    .line 23
    .line 24
    invoke-virtual {v0}, Ll/uxr;->H()Ll/ph4;

    .line 25
    .line 26
    .line 27
    move-result-object v2

    .line 28
    invoke-virtual {v2}, Ll/ph4;->a()F

    .line 29
    .line 30
    .line 31
    move-result v2

    .line 32
    invoke-virtual {p0, p1}, Ll/gv80;->k(Ljava/util/Collection;)F

    .line 33
    .line 34
    .line 35
    move-result p1

    .line 36
    cmpl-float p1, v2, p1

    .line 37
    .line 38
    if-nez p1, :cond_0

    .line 39
    .line 40
    invoke-virtual {v0}, Ll/d3q;->toString()Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    return-void

    .line 44
    :cond_0
    if-nez v0, :cond_1

    .line 45
    .line 46
    iget-object p1, p0, Ll/kj1;->a:Ll/r0u;

    .line 47
    .line 48
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->J()Ljava/util/List;

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    invoke-virtual {p0, p1}, Ll/kj1;->c(Ljava/util/List;)Ll/uxr;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    :cond_1
    if-eqz v0, :cond_2

    .line 57
    .line 58
    invoke-virtual {v0}, Ll/d3q;->toString()Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    invoke-virtual {p0, v0}, Ll/kj1;->g(Ll/d3q;)V

    .line 62
    .line 63
    .line 64
    :cond_2
    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    .line 65
    .line 66
    .line 67
    move-result p1

    .line 68
    if-eqz p1, :cond_3

    .line 69
    .line 70
    goto :goto_0

    .line 71
    :cond_3
    iget-boolean p1, p0, Ll/kj1;->c:Z

    .line 72
    .line 73
    if-nez p1, :cond_5

    .line 74
    .line 75
    invoke-static {}, Lcom/tantanapp/common/utils/ConnectivityReceiver;->l()Z

    .line 76
    .line 77
    .line 78
    move-result p1

    .line 79
    if-eqz p1, :cond_4

    .line 80
    .line 81
    goto :goto_1

    .line 82
    :cond_4
    :goto_0
    return-void

    .line 83
    :cond_5
    :goto_1
    iget-object p1, p0, Ll/gv80;->e:Ljava/util/Random;

    .line 84
    .line 85
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 86
    .line 87
    .line 88
    move-result v0

    .line 89
    invoke-virtual {p1, v0}, Ljava/util/Random;->nextInt(I)I

    .line 90
    .line 91
    .line 92
    move-result p1

    .line 93
    invoke-interface {v1, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 94
    .line 95
    .line 96
    move-result-object p1

    .line 97
    check-cast p1, Ll/uxr;

    .line 98
    .line 99
    invoke-virtual {p1}, Ll/d3q;->toString()Ljava/lang/String;

    .line 100
    .line 101
    .line 102
    invoke-virtual {p0, p1}, Ll/kj1;->f(Ll/d3q;)V

    .line 103
    .line 104
    .line 105
    return-void
.end method

.method public bridge synthetic h()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/kj1;->h()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final k(Ljava/util/Collection;)F
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection<",
            "Ll/uxr<",
            "*>;>;)F"
        }
    .end annotation

    .line 1
    invoke-interface {p1}, Ljava/util/Collection;->isEmpty()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const/high16 p0, -0x31000000

    .line 8
    .line 9
    return p0

    .line 10
    :cond_0
    invoke-virtual {p0, p1}, Ll/gv80;->l(Ljava/util/Collection;)Ljava/util/List;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    const/4 p1, 0x0

    .line 15
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    check-cast p0, Ll/uxr;

    .line 20
    .line 21
    invoke-virtual {p0}, Ll/uxr;->H()Ll/ph4;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-virtual {p0}, Ll/ph4;->a()F

    .line 26
    .line 27
    .line 28
    move-result p0

    .line 29
    return p0
.end method

.method public final l(Ljava/util/Collection;)Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection<",
            "Ll/uxr<",
            "*>;>;)",
            "Ljava/util/List<",
            "Ll/uxr<",
            "*>;>;"
        }
    .end annotation

    .line 1
    new-instance p0, Ll/fv80;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/fv80;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {p1, p0}, Ll/x7s;->u0(Ljava/util/Collection;Ll/qcj;)Ljava/util/List;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method

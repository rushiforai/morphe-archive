.class public Lcom/p1/mobile/putong/live/base/api/LiveApiBuilder;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/live/base/api/LiveApiBuilder$ReqType;
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/api/api/Network;Lcom/p1/mobile/putong/live/base/api/LiveApiBuilder$ReqType;Ll/rnl;Ljava/lang/String;[Ll/st0;)Lrx/c;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2, p3, p4}, Lcom/p1/mobile/putong/live/base/api/LiveApiBuilder;->l(Lcom/p1/mobile/putong/api/api/Network;Lcom/p1/mobile/putong/live/base/api/LiveApiBuilder$ReqType;Ll/rnl;Ljava/lang/String;[Ll/st0;)Ll/pcj;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0}, Ll/e9t;->a(Ll/pcj;)Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public static synthetic b(Ll/x1d0$a;Ll/z1d0;)Ll/x1d0;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/x1d0$a;->k(Ll/z1d0;)Ll/x1d0$a;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ll/x1d0$a;->b()Ll/x1d0;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/api/api/Network;Lcom/p1/mobile/putong/live/base/api/LiveApiBuilder$ReqType;Ll/rnl;Ljava/lang/String;Lcom/tantanapp/common/data/INetParser;)Lrx/c;
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    new-array v0, v0, [Ll/st0;

    .line 3
    .line 4
    invoke-static {p0, p1, p2, p3, v0}, Lcom/p1/mobile/putong/live/base/api/LiveApiBuilder;->l(Lcom/p1/mobile/putong/api/api/Network;Lcom/p1/mobile/putong/live/base/api/LiveApiBuilder$ReqType;Ll/rnl;Ljava/lang/String;[Ll/st0;)Ll/pcj;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    invoke-static {p0, p4}, Ll/e9t;->b(Ll/pcj;Lcom/tantanapp/common/data/INetParser;)Lrx/c;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method

.method public static synthetic d(Ll/x1d0$a;Ll/st0;)V
    .locals 1

    .line 1
    iget-object v0, p1, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Ljava/lang/String;

    .line 4
    .line 5
    iget-object p1, p1, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 6
    .line 7
    check-cast p1, Ljava/lang/String;

    .line 8
    .line 9
    invoke-virtual {p0, v0, p1}, Ll/x1d0$a;->a(Ljava/lang/String;Ljava/lang/String;)Ll/x1d0$a;

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public static synthetic e(Ll/x1d0$a;Ll/z1d0;)Ll/x1d0;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/x1d0$a;->l(Ll/z1d0;)Ll/x1d0$a;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ll/x1d0$a;->b()Ll/x1d0;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public static synthetic f(Lcom/p1/mobile/putong/api/api/Network;Lcom/p1/mobile/putong/live/base/api/LiveApiBuilder$ReqType;Ll/rnl;Ljava/lang/String;[Ll/st0;Lcom/tantanapp/common/data/JsonAdapter;)Lrx/c;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2, p3, p4}, Lcom/p1/mobile/putong/live/base/api/LiveApiBuilder;->l(Lcom/p1/mobile/putong/api/api/Network;Lcom/p1/mobile/putong/live/base/api/LiveApiBuilder$ReqType;Ll/rnl;Ljava/lang/String;[Ll/st0;)Ll/pcj;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0, p5}, Ll/e9t;->c(Ll/pcj;Lcom/tantanapp/common/data/JsonAdapter;)Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public static synthetic g(Ll/x1d0$a;Ll/z1d0;)Ll/x1d0;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/x1d0$a;->m(Ll/z1d0;)Ll/x1d0$a;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ll/x1d0$a;->b()Ll/x1d0;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public static synthetic h(Ll/x1d0$a;)Ll/x1d0;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/x1d0$a;->f()Ll/x1d0$a;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ll/x1d0$a;->b()Ll/x1d0;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public static synthetic i(Lcom/p1/mobile/putong/api/api/Network;Lcom/p1/mobile/putong/live/base/api/LiveApiBuilder$ReqType;Ll/rnl;Ljava/lang/String;[Ll/st0;)Lrx/c;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2, p3, p4}, Lcom/p1/mobile/putong/live/base/api/LiveApiBuilder;->l(Lcom/p1/mobile/putong/api/api/Network;Lcom/p1/mobile/putong/live/base/api/LiveApiBuilder$ReqType;Ll/rnl;Ljava/lang/String;[Ll/st0;)Ll/pcj;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0}, Ll/e9t;->d(Ll/pcj;)Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-static {}, Ll/psd0;->Q()Lrx/c$d;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    invoke-virtual {p0, p1}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0
.end method

.method public static synthetic j(Ll/x1d0$a;Ll/z1d0;)Ll/x1d0;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/x1d0$a;->e(Ll/z1d0;)Ll/x1d0$a;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ll/x1d0$a;->b()Ll/x1d0;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public static varargs k(Ll/rnl$a;[Ll/st0;)V
    .locals 4
    .param p0    # Ll/rnl$a;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    array-length v0, p1

    .line 2
    const/4 v1, 0x0

    .line 3
    :goto_0
    if-ge v1, v0, :cond_1

    .line 4
    .line 5
    aget-object v2, p1, v1

    .line 6
    .line 7
    if-eqz v2, :cond_0

    .line 8
    .line 9
    iget-object v3, v2, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 10
    .line 11
    if-eqz v3, :cond_0

    .line 12
    .line 13
    check-cast v3, Ljava/lang/String;

    .line 14
    .line 15
    iget-object v2, v2, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 16
    .line 17
    check-cast v2, Ljava/lang/String;

    .line 18
    .line 19
    invoke-virtual {p0, v3, v2}, Ll/rnl$a;->c(Ljava/lang/String;Ljava/lang/String;)Ll/rnl$a;

    .line 20
    .line 21
    .line 22
    :cond_0
    add-int/lit8 v1, v1, 0x1

    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_1
    return-void
.end method

.method public static varargs l(Lcom/p1/mobile/putong/api/api/Network;Lcom/p1/mobile/putong/live/base/api/LiveApiBuilder$ReqType;Ll/rnl;Ljava/lang/String;[Ll/st0;)Ll/pcj;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/api/api/Network;",
            "Lcom/p1/mobile/putong/live/base/api/LiveApiBuilder$ReqType;",
            "Ll/rnl;",
            "Ljava/lang/String;",
            "[",
            "Ll/st0;",
            ")",
            "Ll/pcj<",
            "Ll/x1d0;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/api/api/Network;->JSON:Ll/e7y;

    .line 2
    .line 3
    invoke-static {v0, p3}, Ll/z1d0;->create(Ll/e7y;Ljava/lang/String;)Ll/z1d0;

    .line 4
    .line 5
    .line 6
    move-result-object p3

    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/api/api/Network;->auth()Ll/x1d0$a;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {p0, p2}, Ll/x1d0$a;->s(Ll/rnl;)Ll/x1d0$a;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-static {p4}, Ll/jyb;->K([Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result p2

    .line 19
    if-nez p2, :cond_0

    .line 20
    .line 21
    new-instance p2, Ll/rvr;

    .line 22
    .line 23
    invoke-direct {p2, p0}, Ll/rvr;-><init>(Ll/x1d0$a;)V

    .line 24
    .line 25
    .line 26
    invoke-static {p4, p2}, Ll/jyb;->A([Ljava/lang/Object;Ll/y20;)V

    .line 27
    .line 28
    .line 29
    :cond_0
    sget-object p2, Lcom/p1/mobile/putong/live/base/api/LiveApiBuilder$a;->a:[I

    .line 30
    .line 31
    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    .line 32
    .line 33
    .line 34
    move-result p1

    .line 35
    aget p1, p2, p1

    .line 36
    .line 37
    const/4 p2, 0x1

    .line 38
    if-eq p1, p2, :cond_5

    .line 39
    .line 40
    const/4 p2, 0x2

    .line 41
    if-eq p1, p2, :cond_4

    .line 42
    .line 43
    const/4 p2, 0x3

    .line 44
    if-eq p1, p2, :cond_3

    .line 45
    .line 46
    const/4 p2, 0x4

    .line 47
    if-eq p1, p2, :cond_2

    .line 48
    .line 49
    const/4 p2, 0x5

    .line 50
    if-eq p1, p2, :cond_1

    .line 51
    .line 52
    const/4 p0, 0x0

    .line 53
    return-object p0

    .line 54
    :cond_1
    new-instance p1, Ll/wvr;

    .line 55
    .line 56
    invoke-direct {p1, p0, p3}, Ll/wvr;-><init>(Ll/x1d0$a;Ll/z1d0;)V

    .line 57
    .line 58
    .line 59
    return-object p1

    .line 60
    :cond_2
    new-instance p1, Ll/vvr;

    .line 61
    .line 62
    invoke-direct {p1, p0, p3}, Ll/vvr;-><init>(Ll/x1d0$a;Ll/z1d0;)V

    .line 63
    .line 64
    .line 65
    return-object p1

    .line 66
    :cond_3
    new-instance p1, Ll/uvr;

    .line 67
    .line 68
    invoke-direct {p1, p0, p3}, Ll/uvr;-><init>(Ll/x1d0$a;Ll/z1d0;)V

    .line 69
    .line 70
    .line 71
    return-object p1

    .line 72
    :cond_4
    new-instance p1, Ll/tvr;

    .line 73
    .line 74
    invoke-direct {p1, p0, p3}, Ll/tvr;-><init>(Ll/x1d0$a;Ll/z1d0;)V

    .line 75
    .line 76
    .line 77
    return-object p1

    .line 78
    :cond_5
    new-instance p1, Ll/svr;

    .line 79
    .line 80
    invoke-direct {p1, p0}, Ll/svr;-><init>(Ll/x1d0$a;)V

    .line 81
    .line 82
    .line 83
    return-object p1
.end method

.method public static m(Ljava/lang/String;)Ll/rnl$a;
    .locals 0

    .line 1
    invoke-static {p0}, Ll/rnl;->r(Ljava/lang/String;)Ll/rnl;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ll/rnl;->p()Ll/rnl$a;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public static n(Ll/rnl$a;)Ll/rnl;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/rnl$a;->d()Ll/rnl;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static varargs o(Lcom/p1/mobile/putong/api/api/Network;Lcom/p1/mobile/putong/live/base/api/LiveApiBuilder$ReqType;Ll/rnl;Ljava/lang/String;[Ll/st0;)Ll/pcj;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/api/api/Network;",
            "Lcom/p1/mobile/putong/live/base/api/LiveApiBuilder$ReqType;",
            "Ll/rnl;",
            "Ljava/lang/String;",
            "[",
            "Ll/st0;",
            ")",
            "Ll/pcj<",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;",
            ">;>;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/ovr;

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
    move-object v5, p4

    .line 8
    invoke-direct/range {v0 .. v5}, Ll/ovr;-><init>(Lcom/p1/mobile/putong/api/api/Network;Lcom/p1/mobile/putong/live/base/api/LiveApiBuilder$ReqType;Ll/rnl;Ljava/lang/String;[Ll/st0;)V

    .line 9
    .line 10
    .line 11
    return-object v0
.end method

.method public static varargs p(Lcom/p1/mobile/putong/api/api/Network;Lcom/p1/mobile/putong/live/base/api/LiveApiBuilder$ReqType;Ll/rnl;Ljava/lang/String;[Ll/st0;)Lrx/c;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2, p3, p4}, Lcom/p1/mobile/putong/live/base/api/LiveApiBuilder;->l(Lcom/p1/mobile/putong/api/api/Network;Lcom/p1/mobile/putong/live/base/api/LiveApiBuilder$ReqType;Ll/rnl;Ljava/lang/String;[Ll/st0;)Ll/pcj;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0}, Ll/e9t;->a(Ll/pcj;)Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public static varargs q(Lcom/p1/mobile/putong/api/api/Network;Lcom/p1/mobile/putong/live/base/api/LiveApiBuilder$ReqType;Ll/rnl;Ljava/lang/String;[Ll/st0;)Ll/pcj;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/api/api/Network;",
            "Lcom/p1/mobile/putong/live/base/api/LiveApiBuilder$ReqType;",
            "Ll/rnl;",
            "Ljava/lang/String;",
            "[",
            "Ll/st0;",
            ")",
            "Ll/pcj<",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;",
            ">;>;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/qvr;

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
    move-object v5, p4

    .line 8
    invoke-direct/range {v0 .. v5}, Ll/qvr;-><init>(Lcom/p1/mobile/putong/api/api/Network;Lcom/p1/mobile/putong/live/base/api/LiveApiBuilder$ReqType;Ll/rnl;Ljava/lang/String;[Ll/st0;)V

    .line 9
    .line 10
    .line 11
    return-object v0
.end method

.method public static varargs r(Lcom/p1/mobile/putong/api/api/Network;Lcom/p1/mobile/putong/live/base/api/LiveApiBuilder$ReqType;Ll/rnl;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;[Ll/st0;)Ll/pcj;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/p1/mobile/putong/api/api/Network;",
            "Lcom/p1/mobile/putong/live/base/api/LiveApiBuilder$ReqType;",
            "Ll/rnl;",
            "Lcom/tantanapp/common/data/JsonAdapter<",
            "TT;>;",
            "Ljava/lang/String;",
            "[",
            "Ll/st0;",
            ")",
            "Ll/pcj<",
            "Lrx/c<",
            "TT;>;>;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/xvr;

    .line 2
    .line 3
    move-object v1, p0

    .line 4
    move-object v2, p1

    .line 5
    move-object v3, p2

    .line 6
    move-object v6, p3

    .line 7
    move-object v4, p4

    .line 8
    move-object v5, p5

    .line 9
    invoke-direct/range {v0 .. v6}, Ll/xvr;-><init>(Lcom/p1/mobile/putong/api/api/Network;Lcom/p1/mobile/putong/live/base/api/LiveApiBuilder$ReqType;Ll/rnl;Ljava/lang/String;[Ll/st0;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 10
    .line 11
    .line 12
    return-object v0
.end method

.method public static s(Lcom/p1/mobile/putong/api/api/Network;Lcom/p1/mobile/putong/live/base/api/LiveApiBuilder$ReqType;Ll/rnl;Ljava/lang/String;Lcom/tantanapp/common/data/INetParser;)Ll/pcj;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Lcom/p1/mobile/putong/live/base/apibean/BaseLiveBean;",
            ">(",
            "Lcom/p1/mobile/putong/api/api/Network;",
            "Lcom/p1/mobile/putong/live/base/api/LiveApiBuilder$ReqType;",
            "Ll/rnl;",
            "Ljava/lang/String;",
            "Lcom/tantanapp/common/data/INetParser<",
            "TT;>;)",
            "Ll/pcj<",
            "Lrx/c<",
            "TT;>;>;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/pvr;

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
    move-object v5, p4

    .line 8
    invoke-direct/range {v0 .. v5}, Ll/pvr;-><init>(Lcom/p1/mobile/putong/api/api/Network;Lcom/p1/mobile/putong/live/base/api/LiveApiBuilder$ReqType;Ll/rnl;Ljava/lang/String;Lcom/tantanapp/common/data/INetParser;)V

    .line 9
    .line 10
    .line 11
    return-object v0
.end method

.method public static t(Lcom/p1/mobile/putong/api/api/Network;Lcom/p1/mobile/putong/live/base/api/LiveApiBuilder$ReqType;Ll/rnl;Ljava/lang/String;Lcom/tantanapp/common/data/INetParser;)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Lcom/p1/mobile/putong/live/base/apibean/BaseLiveBean;",
            ">(",
            "Lcom/p1/mobile/putong/api/api/Network;",
            "Lcom/p1/mobile/putong/live/base/api/LiveApiBuilder$ReqType;",
            "Ll/rnl;",
            "Ljava/lang/String;",
            "Lcom/tantanapp/common/data/INetParser<",
            "TT;>;)",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    new-array v0, v0, [Ll/st0;

    .line 3
    .line 4
    invoke-static {p0, p1, p2, p3, v0}, Lcom/p1/mobile/putong/live/base/api/LiveApiBuilder;->l(Lcom/p1/mobile/putong/api/api/Network;Lcom/p1/mobile/putong/live/base/api/LiveApiBuilder$ReqType;Ll/rnl;Ljava/lang/String;[Ll/st0;)Ll/pcj;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    invoke-static {p0, p4}, Ll/e9t;->b(Ll/pcj;Lcom/tantanapp/common/data/INetParser;)Lrx/c;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method

.method public static varargs u(Ljava/lang/String;[Ll/st0;)Ll/rnl;
    .locals 0
    .param p0    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-static {p0}, Lcom/p1/mobile/putong/live/base/api/LiveApiBuilder;->m(Ljava/lang/String;)Ll/rnl$a;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/live/base/api/LiveApiBuilder;->k(Ll/rnl$a;[Ll/st0;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    invoke-static {p0}, Lcom/p1/mobile/putong/live/base/api/LiveApiBuilder;->n(Ll/rnl$a;)Ll/rnl;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    return-object p0
.end method

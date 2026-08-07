.class public Lcom/p1/mobile/putong/live/base/api/LiveBaseApi;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/live/base/api/LiveBaseApi$ReqType;
    }
.end annotation


# static fields
.field public static final a:Lcom/tantanapp/common/network/RunnerProxy;

.field public static b:Lcom/p1/mobile/putong/api/api/Network;

.field public static c:Ll/g2d0;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lcom/tantanapp/common/network/RunnerProxy;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/tantanapp/common/network/RunnerProxy;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/putong/live/base/api/LiveBaseApi;->a:Lcom/tantanapp/common/network/RunnerProxy;

    .line 7
    .line 8
    new-instance v1, Ll/rai0;

    .line 9
    .line 10
    invoke-direct {v1}, Ll/rai0;-><init>()V

    .line 11
    .line 12
    .line 13
    invoke-virtual {v0, v1}, Lcom/tantanapp/common/network/RunnerProxy;->setErrorHandler(Ll/qcj;)V

    .line 14
    .line 15
    .line 16
    sget-object v0, Ll/uqb0;->H:Lcom/p1/mobile/putong/api/api/Network;

    .line 17
    .line 18
    sput-object v0, Lcom/p1/mobile/putong/live/base/api/LiveBaseApi;->b:Lcom/p1/mobile/putong/api/api/Network;

    .line 19
    .line 20
    new-instance v0, Ll/g2d0;

    .line 21
    .line 22
    invoke-direct {v0}, Ll/g2d0;-><init>()V

    .line 23
    .line 24
    .line 25
    sput-object v0, Lcom/p1/mobile/putong/live/base/api/LiveBaseApi;->c:Ll/g2d0;

    .line 26
    .line 27
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/live/base/api/LiveBaseApi$ReqType;Ll/rnl;Ljava/lang/String;)Lrx/c;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Lcom/p1/mobile/putong/live/base/api/LiveBaseApi;->k(Lcom/p1/mobile/putong/live/base/api/LiveBaseApi$ReqType;Ll/rnl;Ljava/lang/String;)Ll/pcj;

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

.method public static synthetic c(Lcom/p1/mobile/putong/live/base/api/LiveBaseApi$ReqType;Ll/rnl;Ljava/lang/String;Lcom/tantanapp/common/data/JsonAdapter;)Lrx/c;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Lcom/p1/mobile/putong/live/base/api/LiveBaseApi;->k(Lcom/p1/mobile/putong/live/base/api/LiveBaseApi$ReqType;Ll/rnl;Ljava/lang/String;)Ll/pcj;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0, p3}, Ll/e9t;->c(Ll/pcj;Lcom/tantanapp/common/data/JsonAdapter;)Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public static synthetic d(Ll/x1d0$a;Ll/z1d0;)Ll/x1d0;
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

.method public static synthetic e(Ll/x1d0$a;Ll/z1d0;)Ll/x1d0;
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

.method public static synthetic f(Ll/x1d0$a;Ljava/util/Map$Entry;)V
    .locals 1

    .line 1
    invoke-interface {p1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    check-cast v0, Ljava/lang/String;

    .line 6
    .line 7
    invoke-interface {p1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    check-cast p1, Ljava/lang/String;

    .line 12
    .line 13
    invoke-virtual {p0, v0, p1}, Ll/x1d0$a;->a(Ljava/lang/String;Ljava/lang/String;)Ll/x1d0$a;

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public static synthetic g(Lcom/p1/mobile/putong/live/base/api/LiveBaseApi$ReqType;Ll/rnl;Ljava/lang/String;Lcom/tantanapp/common/data/INetParser;)Lrx/c;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Lcom/p1/mobile/putong/live/base/api/LiveBaseApi;->k(Lcom/p1/mobile/putong/live/base/api/LiveBaseApi$ReqType;Ll/rnl;Ljava/lang/String;)Ll/pcj;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0, p3}, Ll/e9t;->b(Ll/pcj;Lcom/tantanapp/common/data/INetParser;)Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public static synthetic h(Ll/x1d0$a;Ll/z1d0;)Ll/x1d0;
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

.method public static synthetic i(Ll/x1d0$a;)Ll/x1d0;
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

.method public static synthetic j(Lcom/p1/mobile/putong/live/base/api/LiveBaseApi$ReqType;Ll/rnl;Ljava/lang/String;)Lrx/c;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Lcom/p1/mobile/putong/live/base/api/LiveBaseApi;->k(Lcom/p1/mobile/putong/live/base/api/LiveBaseApi$ReqType;Ll/rnl;Ljava/lang/String;)Ll/pcj;

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

.method public static k(Lcom/p1/mobile/putong/live/base/api/LiveBaseApi$ReqType;Ll/rnl;Ljava/lang/String;)Ll/pcj;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/live/base/api/LiveBaseApi$ReqType;",
            "Ll/rnl;",
            "Ljava/lang/String;",
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
    invoke-static {v0, p2}, Ll/z1d0;->create(Ll/e7y;Ljava/lang/String;)Ll/z1d0;

    .line 4
    .line 5
    .line 6
    move-result-object p2

    .line 7
    sget-object v0, Lcom/p1/mobile/putong/live/base/api/LiveBaseApi;->b:Lcom/p1/mobile/putong/api/api/Network;

    .line 8
    .line 9
    invoke-virtual {v0}, Lcom/p1/mobile/putong/api/api/Network;->auth()Ll/x1d0$a;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {v0, p1}, Ll/x1d0$a;->s(Ll/rnl;)Ll/x1d0$a;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    sget-object v0, Lcom/p1/mobile/putong/live/base/api/LiveBaseApi;->c:Ll/g2d0;

    .line 18
    .line 19
    invoke-virtual {v0}, Ll/g2d0;->getHeader()Ljava/util/Map;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-interface {v0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 28
    .line 29
    .line 30
    move-result v1

    .line 31
    if-nez v1, :cond_0

    .line 32
    .line 33
    new-instance v1, Ll/lxr;

    .line 34
    .line 35
    invoke-direct {v1, p1}, Ll/lxr;-><init>(Ll/x1d0$a;)V

    .line 36
    .line 37
    .line 38
    invoke-static {v0, v1}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 39
    .line 40
    .line 41
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/live/base/api/LiveBaseApi$a;->a:[I

    .line 42
    .line 43
    invoke-virtual {p0}, Ljava/lang/Enum;->ordinal()I

    .line 44
    .line 45
    .line 46
    move-result p0

    .line 47
    aget p0, v0, p0

    .line 48
    .line 49
    const/4 v0, 0x1

    .line 50
    if-eq p0, v0, :cond_4

    .line 51
    .line 52
    const/4 v0, 0x2

    .line 53
    if-eq p0, v0, :cond_3

    .line 54
    .line 55
    const/4 v0, 0x3

    .line 56
    if-eq p0, v0, :cond_2

    .line 57
    .line 58
    const/4 v0, 0x4

    .line 59
    if-eq p0, v0, :cond_1

    .line 60
    .line 61
    new-instance p0, Ll/qxr;

    .line 62
    .line 63
    invoke-direct {p0, p1}, Ll/qxr;-><init>(Ll/x1d0$a;)V

    .line 64
    .line 65
    .line 66
    return-object p0

    .line 67
    :cond_1
    new-instance p0, Ll/pxr;

    .line 68
    .line 69
    invoke-direct {p0, p1, p2}, Ll/pxr;-><init>(Ll/x1d0$a;Ll/z1d0;)V

    .line 70
    .line 71
    .line 72
    return-object p0

    .line 73
    :cond_2
    new-instance p0, Ll/oxr;

    .line 74
    .line 75
    invoke-direct {p0, p1, p2}, Ll/oxr;-><init>(Ll/x1d0$a;Ll/z1d0;)V

    .line 76
    .line 77
    .line 78
    return-object p0

    .line 79
    :cond_3
    new-instance p0, Ll/nxr;

    .line 80
    .line 81
    invoke-direct {p0, p1, p2}, Ll/nxr;-><init>(Ll/x1d0$a;Ll/z1d0;)V

    .line 82
    .line 83
    .line 84
    return-object p0

    .line 85
    :cond_4
    new-instance p0, Ll/mxr;

    .line 86
    .line 87
    invoke-direct {p0, p1, p2}, Ll/mxr;-><init>(Ll/x1d0$a;Ll/z1d0;)V

    .line 88
    .line 89
    .line 90
    return-object p0
.end method

.method public static l(Lcom/p1/mobile/putong/live/base/api/LiveBaseApi$ReqType;Ll/rnl;Ljava/lang/String;)Ll/pcj;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/live/base/api/LiveBaseApi$ReqType;",
            "Ll/rnl;",
            "Ljava/lang/String;",
            ")",
            "Ll/pcj<",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;",
            ">;>;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/txr;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1, p2}, Ll/txr;-><init>(Lcom/p1/mobile/putong/live/base/api/LiveBaseApi$ReqType;Ll/rnl;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public static m(Lcom/p1/mobile/putong/live/base/api/LiveBaseApi$ReqType;Ll/rnl;Ljava/lang/String;)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/live/base/api/LiveBaseApi$ReqType;",
            "Ll/rnl;",
            "Ljava/lang/String;",
            ")",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-static {p0, p1, p2}, Lcom/p1/mobile/putong/live/base/api/LiveBaseApi;->k(Lcom/p1/mobile/putong/live/base/api/LiveBaseApi$ReqType;Ll/rnl;Ljava/lang/String;)Ll/pcj;

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

.method public static n(Lcom/p1/mobile/putong/live/base/api/LiveBaseApi$ReqType;Ll/rnl;Ljava/lang/String;)Ll/pcj;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/live/base/api/LiveBaseApi$ReqType;",
            "Ll/rnl;",
            "Ljava/lang/String;",
            ")",
            "Ll/pcj<",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;",
            ">;>;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/rxr;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1, p2}, Ll/rxr;-><init>(Lcom/p1/mobile/putong/live/base/api/LiveBaseApi$ReqType;Ll/rnl;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public static o(Lcom/p1/mobile/putong/live/base/api/LiveBaseApi$ReqType;Ll/rnl;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;)Ll/pcj;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/p1/mobile/putong/live/base/api/LiveBaseApi$ReqType;",
            "Ll/rnl;",
            "Lcom/tantanapp/common/data/JsonAdapter<",
            "TT;>;",
            "Ljava/lang/String;",
            ")",
            "Ll/pcj<",
            "Lrx/c<",
            "TT;>;>;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/kxr;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1, p3, p2}, Ll/kxr;-><init>(Lcom/p1/mobile/putong/live/base/api/LiveBaseApi$ReqType;Ll/rnl;Ljava/lang/String;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public static p(Lcom/p1/mobile/putong/live/base/api/LiveBaseApi$ReqType;Ll/rnl;Ljava/lang/String;Lcom/tantanapp/common/data/INetParser;)Ll/pcj;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Lcom/p1/mobile/putong/live/base/apibean/BaseLiveBean;",
            ">(",
            "Lcom/p1/mobile/putong/live/base/api/LiveBaseApi$ReqType;",
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
    new-instance v0, Ll/sxr;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1, p2, p3}, Ll/sxr;-><init>(Lcom/p1/mobile/putong/live/base/api/LiveBaseApi$ReqType;Ll/rnl;Ljava/lang/String;Lcom/tantanapp/common/data/INetParser;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public static q()Lcom/tantanapp/common/network/RunnerProxy;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/live/base/api/LiveBaseApi;->a:Lcom/tantanapp/common/network/RunnerProxy;

    .line 2
    .line 3
    return-object v0
.end method

.method public static r(Ll/rnl;)Lrx/c;
    .locals 4
    .param p0    # Ll/rnl;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/rnl;",
            ")",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/live/base/api/LiveBaseApi;->q()Lcom/tantanapp/common/network/RunnerProxy;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0}, Ll/rnl;->toString()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    sget-object v2, Lcom/p1/mobile/putong/live/base/api/LiveBaseApi$ReqType;->GET:Lcom/p1/mobile/putong/live/base/api/LiveBaseApi$ReqType;

    .line 10
    .line 11
    const-string v3, ""

    .line 12
    .line 13
    invoke-static {v2, p0, v3}, Lcom/p1/mobile/putong/live/base/api/LiveBaseApi;->n(Lcom/p1/mobile/putong/live/base/api/LiveBaseApi$ReqType;Ll/rnl;Ljava/lang/String;)Ll/pcj;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    const/4 v2, 0x0

    .line 18
    invoke-virtual {v0, v1, v2, p0}, Lcom/tantanapp/common/network/RunnerProxy;->scheduled(Ljava/lang/String;ILl/pcj;)Lrx/c;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    return-object p0
.end method

.method public static s(Ll/rnl;Ll/wxr;)Lrx/c;
    .locals 4
    .param p0    # Ll/rnl;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Lcom/p1/mobile/putong/live/base/apibean/BaseLiveBean;",
            ">(",
            "Ll/rnl;",
            "Ll/wxr<",
            "TT;>;)",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/rnl;->toString()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p1, v0}, Ll/wxr;->b(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-static {}, Lcom/p1/mobile/putong/live/base/api/LiveBaseApi;->q()Lcom/tantanapp/common/network/RunnerProxy;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {p0}, Ll/rnl;->toString()Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    sget-object v2, Lcom/p1/mobile/putong/live/base/api/LiveBaseApi$ReqType;->GET:Lcom/p1/mobile/putong/live/base/api/LiveBaseApi$ReqType;

    .line 17
    .line 18
    const-string v3, ""

    .line 19
    .line 20
    invoke-static {v2, p0, v3, p1}, Lcom/p1/mobile/putong/live/base/api/LiveBaseApi;->p(Lcom/p1/mobile/putong/live/base/api/LiveBaseApi$ReqType;Ll/rnl;Ljava/lang/String;Lcom/tantanapp/common/data/INetParser;)Ll/pcj;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    const/4 p1, 0x0

    .line 25
    invoke-virtual {v0, v1, p1, p0}, Lcom/tantanapp/common/network/RunnerProxy;->scheduled(Ljava/lang/String;ILl/pcj;)Lrx/c;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    return-object p0
.end method

.method public static t(Ll/rnl;Lcom/tantanapp/common/data/JsonAdapter;)Lrx/c;
    .locals 2
    .param p0    # Ll/rnl;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ll/rnl;",
            "Lcom/tantanapp/common/data/JsonAdapter<",
            "TT;>;)",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/live/base/api/LiveBaseApi$ReqType;->GET:Lcom/p1/mobile/putong/live/base/api/LiveBaseApi$ReqType;

    .line 2
    .line 3
    const-string v1, ""

    .line 4
    .line 5
    invoke-static {v0, p0, p1, v1}, Lcom/p1/mobile/putong/live/base/api/LiveBaseApi;->o(Lcom/p1/mobile/putong/live/base/api/LiveBaseApi$ReqType;Ll/rnl;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;)Ll/pcj;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-static {}, Lcom/p1/mobile/putong/live/base/api/LiveBaseApi;->q()Lcom/tantanapp/common/network/RunnerProxy;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {p0}, Ll/rnl;->toString()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    const/4 v1, 0x0

    .line 18
    invoke-virtual {v0, p0, v1, p1}, Lcom/tantanapp/common/network/RunnerProxy;->scheduled(Ljava/lang/String;ILl/pcj;)Lrx/c;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    return-object p0
.end method

.method public static u(Ll/rnl;)Lrx/c;
    .locals 4
    .param p0    # Ll/rnl;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/rnl;",
            ")",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/live/base/api/LiveBaseApi;->q()Lcom/tantanapp/common/network/RunnerProxy;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0}, Ll/rnl;->toString()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    sget-object v2, Lcom/p1/mobile/putong/live/base/api/LiveBaseApi$ReqType;->GET:Lcom/p1/mobile/putong/live/base/api/LiveBaseApi$ReqType;

    .line 10
    .line 11
    const-string v3, ""

    .line 12
    .line 13
    invoke-static {v2, p0, v3}, Lcom/p1/mobile/putong/live/base/api/LiveBaseApi;->l(Lcom/p1/mobile/putong/live/base/api/LiveBaseApi$ReqType;Ll/rnl;Ljava/lang/String;)Ll/pcj;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    const/4 v2, 0x0

    .line 18
    invoke-virtual {v0, v1, v2, p0}, Lcom/tantanapp/common/network/RunnerProxy;->scheduled(Ljava/lang/String;ILl/pcj;)Lrx/c;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    return-object p0
.end method

.method public static v(Ll/rnl;Ljava/lang/String;)Lrx/c;
    .locals 3
    .param p0    # Ll/rnl;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p1    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/rnl;",
            "Ljava/lang/String;",
            ")",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/live/base/api/LiveBaseApi;->q()Lcom/tantanapp/common/network/RunnerProxy;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0}, Ll/rnl;->toString()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    sget-object v2, Lcom/p1/mobile/putong/live/base/api/LiveBaseApi$ReqType;->PATCH:Lcom/p1/mobile/putong/live/base/api/LiveBaseApi$ReqType;

    .line 10
    .line 11
    invoke-static {v2, p0, p1}, Lcom/p1/mobile/putong/live/base/api/LiveBaseApi;->m(Lcom/p1/mobile/putong/live/base/api/LiveBaseApi$ReqType;Ll/rnl;Ljava/lang/String;)Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-virtual {v0, v1, p0}, Lcom/tantanapp/common/network/RunnerProxy;->now(Ljava/lang/String;Lrx/c;)Lrx/c;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    return-object p0
.end method

.method public static w(Ll/rnl;Ljava/lang/String;)Lrx/c;
    .locals 3
    .param p0    # Ll/rnl;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p1    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/rnl;",
            "Ljava/lang/String;",
            ")",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/live/base/api/LiveBaseApi;->q()Lcom/tantanapp/common/network/RunnerProxy;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0}, Ll/rnl;->toString()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    sget-object v2, Lcom/p1/mobile/putong/live/base/api/LiveBaseApi$ReqType;->POST:Lcom/p1/mobile/putong/live/base/api/LiveBaseApi$ReqType;

    .line 10
    .line 11
    invoke-static {v2, p0, p1}, Lcom/p1/mobile/putong/live/base/api/LiveBaseApi;->m(Lcom/p1/mobile/putong/live/base/api/LiveBaseApi$ReqType;Ll/rnl;Ljava/lang/String;)Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-virtual {v0, v1, p0}, Lcom/tantanapp/common/network/RunnerProxy;->now(Ljava/lang/String;Lrx/c;)Lrx/c;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    return-object p0
.end method

.method public static x(Ll/rnl;Ljava/lang/String;Ll/wxr;)Lrx/c;
    .locals 1
    .param p0    # Ll/rnl;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p1    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Lcom/p1/mobile/putong/live/base/apibean/BaseLiveBean;",
            ">(",
            "Ll/rnl;",
            "Ljava/lang/String;",
            "Ll/wxr<",
            "TT;>;)",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/rnl;->toString()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p2, v0}, Ll/wxr;->b(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    sget-object v0, Lcom/p1/mobile/putong/live/base/api/LiveBaseApi$ReqType;->POST:Lcom/p1/mobile/putong/live/base/api/LiveBaseApi$ReqType;

    .line 9
    .line 10
    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/live/base/api/LiveBaseApi;->k(Lcom/p1/mobile/putong/live/base/api/LiveBaseApi$ReqType;Ll/rnl;Ljava/lang/String;)Ll/pcj;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    invoke-static {}, Lcom/p1/mobile/putong/live/base/api/LiveBaseApi;->q()Lcom/tantanapp/common/network/RunnerProxy;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-virtual {p0}, Ll/rnl;->toString()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    invoke-static {p1, p2}, Ll/e9t;->b(Ll/pcj;Lcom/tantanapp/common/data/INetParser;)Lrx/c;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    invoke-virtual {v0, p0, p1}, Lcom/tantanapp/common/network/RunnerProxy;->now(Ljava/lang/String;Lrx/c;)Lrx/c;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    return-object p0
.end method

.method public static y(Ll/rnl;Ljava/lang/String;)Lrx/c;
    .locals 3
    .param p0    # Ll/rnl;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p1    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/rnl;",
            "Ljava/lang/String;",
            ")",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/live/base/api/LiveBaseApi;->q()Lcom/tantanapp/common/network/RunnerProxy;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0}, Ll/rnl;->toString()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    sget-object v2, Lcom/p1/mobile/putong/live/base/api/LiveBaseApi$ReqType;->PUT:Lcom/p1/mobile/putong/live/base/api/LiveBaseApi$ReqType;

    .line 10
    .line 11
    invoke-static {v2, p0, p1}, Lcom/p1/mobile/putong/live/base/api/LiveBaseApi;->m(Lcom/p1/mobile/putong/live/base/api/LiveBaseApi$ReqType;Ll/rnl;Ljava/lang/String;)Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-virtual {v0, v1, p0}, Lcom/tantanapp/common/network/RunnerProxy;->now(Ljava/lang/String;Lrx/c;)Lrx/c;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    return-object p0
.end method

.class public Lcom/p1/mobile/putong/live/external/module/api/LiveExternalApi;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static final liveRunner:Lcom/tantanapp/common/network/RunnerProxy;

.field public static network:Lcom/p1/mobile/putong/api/api/Network;


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
    sput-object v0, Lcom/p1/mobile/putong/live/external/module/api/LiveExternalApi;->liveRunner:Lcom/tantanapp/common/network/RunnerProxy;

    .line 7
    .line 8
    sget-object v1, Ll/uqb0;->H:Lcom/p1/mobile/putong/api/api/Network;

    .line 9
    .line 10
    sput-object v1, Lcom/p1/mobile/putong/live/external/module/api/LiveExternalApi;->network:Lcom/p1/mobile/putong/api/api/Network;

    .line 11
    .line 12
    new-instance v1, Ll/rai0;

    .line 13
    .line 14
    invoke-direct {v1}, Ll/rai0;-><init>()V

    .line 15
    .line 16
    .line 17
    invoke-virtual {v0, v1}, Lcom/tantanapp/common/network/RunnerProxy;->setErrorHandler(Ll/qcj;)V

    .line 18
    .line 19
    .line 20
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

.method public static buildLivePatch(Ll/rnl;Ljava/lang/String;Ljava/lang/String;Ll/wxr;)Lrx/c;
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
            "<T:",
            "Lcom/p1/mobile/putong/live/base/apibean/BaseLiveBean;",
            ">(",
            "Ll/rnl;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ll/wxr;",
            ")",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    .line 1
    invoke-virtual {p3, p1}, Ll/wxr;->b(Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Lcom/p1/mobile/putong/live/external/module/api/LiveExternalApi;->getRunner()Lcom/tantanapp/common/network/RunnerProxy;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    sget-object v1, Lcom/p1/mobile/putong/live/external/module/api/LiveExternalApi;->network:Lcom/p1/mobile/putong/api/api/Network;

    .line 9
    .line 10
    sget-object v2, Lcom/p1/mobile/putong/live/base/api/LiveApiBuilder$ReqType;->PATCH:Lcom/p1/mobile/putong/live/base/api/LiveApiBuilder$ReqType;

    .line 11
    .line 12
    invoke-static {v1, v2, p0, p2, p3}, Lcom/p1/mobile/putong/live/base/api/LiveApiBuilder;->s(Lcom/p1/mobile/putong/api/api/Network;Lcom/p1/mobile/putong/live/base/api/LiveApiBuilder$ReqType;Ll/rnl;Ljava/lang/String;Lcom/tantanapp/common/data/INetParser;)Ll/pcj;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    const/4 p2, -0x1

    .line 17
    invoke-virtual {v0, p1, p2, p0}, Lcom/tantanapp/common/network/RunnerProxy;->scheduled(Ljava/lang/String;ILl/pcj;)Lrx/c;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    return-object p0
.end method

.method public static buildLivePatchNetReqForAny(Ll/rnl;Ljava/lang/String;Ljava/lang/String;Lcom/tantanapp/common/data/JsonAdapter;)Lrx/c;
    .locals 7
    .param p0    # Ll/rnl;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p1    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ll/rnl;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Lcom/tantanapp/common/data/JsonAdapter<",
            "TT;>;)",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/live/external/module/api/LiveExternalApi;->getRunner()Lcom/tantanapp/common/network/RunnerProxy;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget-object v1, Lcom/p1/mobile/putong/live/external/module/api/LiveExternalApi;->network:Lcom/p1/mobile/putong/api/api/Network;

    .line 6
    .line 7
    sget-object v2, Lcom/p1/mobile/putong/live/base/api/LiveApiBuilder$ReqType;->PATCH:Lcom/p1/mobile/putong/live/base/api/LiveApiBuilder$ReqType;

    .line 8
    .line 9
    const/4 v3, 0x0

    .line 10
    new-array v6, v3, [Ll/st0;

    .line 11
    .line 12
    move-object v3, p0

    .line 13
    move-object v5, p2

    .line 14
    move-object v4, p3

    .line 15
    invoke-static/range {v1 .. v6}, Lcom/p1/mobile/putong/live/base/api/LiveApiBuilder;->r(Lcom/p1/mobile/putong/api/api/Network;Lcom/p1/mobile/putong/live/base/api/LiveApiBuilder$ReqType;Ll/rnl;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;[Ll/st0;)Ll/pcj;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    const/4 p2, -0x1

    .line 20
    invoke-virtual {v0, p1, p2, p0}, Lcom/tantanapp/common/network/RunnerProxy;->scheduled(Ljava/lang/String;ILl/pcj;)Lrx/c;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    return-object p0
.end method

.method public static buildLivePatchNetReqObs(Ll/rnl;Ljava/lang/String;Ljava/lang/String;)Lrx/c;
    .locals 4
    .param p0    # Ll/rnl;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p1    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/rnl;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/live/external/module/api/LiveExternalApi;->getRunner()Lcom/tantanapp/common/network/RunnerProxy;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget-object v1, Lcom/p1/mobile/putong/live/external/module/api/LiveExternalApi;->network:Lcom/p1/mobile/putong/api/api/Network;

    .line 6
    .line 7
    sget-object v2, Lcom/p1/mobile/putong/live/base/api/LiveApiBuilder$ReqType;->PATCH:Lcom/p1/mobile/putong/live/base/api/LiveApiBuilder$ReqType;

    .line 8
    .line 9
    const/4 v3, 0x0

    .line 10
    new-array v3, v3, [Ll/st0;

    .line 11
    .line 12
    invoke-static {v1, v2, p0, p2, v3}, Lcom/p1/mobile/putong/live/base/api/LiveApiBuilder;->q(Lcom/p1/mobile/putong/api/api/Network;Lcom/p1/mobile/putong/live/base/api/LiveApiBuilder$ReqType;Ll/rnl;Ljava/lang/String;[Ll/st0;)Ll/pcj;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    const/4 p2, -0x1

    .line 17
    invoke-virtual {v0, p1, p2, p0}, Lcom/tantanapp/common/network/RunnerProxy;->scheduled(Ljava/lang/String;ILl/pcj;)Lrx/c;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    return-object p0
.end method

.method public static buildLivePatchReqAny(Ll/rnl;Ljava/lang/String;Lcom/tantanapp/common/data/JsonAdapter;)Lrx/c;
    .locals 7
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
            "Ljava/lang/Object;",
            ">(",
            "Ll/rnl;",
            "Ljava/lang/String;",
            "Lcom/tantanapp/common/data/JsonAdapter<",
            "TT;>;)",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/live/external/module/api/LiveExternalApi;->getRunner()Lcom/tantanapp/common/network/RunnerProxy;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget-object v1, Lcom/p1/mobile/putong/live/external/module/api/LiveExternalApi;->network:Lcom/p1/mobile/putong/api/api/Network;

    .line 6
    .line 7
    sget-object v2, Lcom/p1/mobile/putong/live/base/api/LiveApiBuilder$ReqType;->PATCH:Lcom/p1/mobile/putong/live/base/api/LiveApiBuilder$ReqType;

    .line 8
    .line 9
    const/4 v3, 0x0

    .line 10
    new-array v6, v3, [Ll/st0;

    .line 11
    .line 12
    const-string v5, ""

    .line 13
    .line 14
    move-object v3, p0

    .line 15
    move-object v4, p2

    .line 16
    invoke-static/range {v1 .. v6}, Lcom/p1/mobile/putong/live/base/api/LiveApiBuilder;->r(Lcom/p1/mobile/putong/api/api/Network;Lcom/p1/mobile/putong/live/base/api/LiveApiBuilder$ReqType;Ll/rnl;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;[Ll/st0;)Ll/pcj;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    const/4 p2, -0x1

    .line 21
    invoke-virtual {v0, p1, p2, p0}, Lcom/tantanapp/common/network/RunnerProxy;->scheduled(Ljava/lang/String;ILl/pcj;)Lrx/c;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    return-object p0
.end method

.method public static buildLivePost(Ll/rnl;Ljava/lang/String;Ljava/lang/String;Ll/wxr;)Lrx/c;
    .locals 3
    .param p0    # Ll/rnl;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p1    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
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
            "Ljava/lang/String;",
            "Ll/wxr;",
            ")",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    .line 1
    invoke-virtual {p3, p1}, Ll/wxr;->b(Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Lcom/p1/mobile/putong/live/external/module/api/LiveExternalApi;->getRunner()Lcom/tantanapp/common/network/RunnerProxy;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    sget-object v1, Lcom/p1/mobile/putong/live/external/module/api/LiveExternalApi;->network:Lcom/p1/mobile/putong/api/api/Network;

    .line 9
    .line 10
    sget-object v2, Lcom/p1/mobile/putong/live/base/api/LiveApiBuilder$ReqType;->POST:Lcom/p1/mobile/putong/live/base/api/LiveApiBuilder$ReqType;

    .line 11
    .line 12
    invoke-static {v1, v2, p0, p2, p3}, Lcom/p1/mobile/putong/live/base/api/LiveApiBuilder;->s(Lcom/p1/mobile/putong/api/api/Network;Lcom/p1/mobile/putong/live/base/api/LiveApiBuilder$ReqType;Ll/rnl;Ljava/lang/String;Lcom/tantanapp/common/data/INetParser;)Ll/pcj;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    const/4 p2, -0x1

    .line 17
    invoke-virtual {v0, p1, p2, p0}, Lcom/tantanapp/common/network/RunnerProxy;->scheduled(Ljava/lang/String;ILl/pcj;)Lrx/c;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    return-object p0
.end method

.method public static buildLivePostNetReqObs(Ll/rnl;Ljava/lang/String;Ljava/lang/String;)Lrx/c;
    .locals 4
    .param p0    # Ll/rnl;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p1    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/rnl;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/live/external/module/api/LiveExternalApi;->getRunner()Lcom/tantanapp/common/network/RunnerProxy;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget-object v1, Lcom/p1/mobile/putong/live/external/module/api/LiveExternalApi;->network:Lcom/p1/mobile/putong/api/api/Network;

    .line 6
    .line 7
    sget-object v2, Lcom/p1/mobile/putong/live/base/api/LiveApiBuilder$ReqType;->POST:Lcom/p1/mobile/putong/live/base/api/LiveApiBuilder$ReqType;

    .line 8
    .line 9
    const/4 v3, 0x0

    .line 10
    new-array v3, v3, [Ll/st0;

    .line 11
    .line 12
    invoke-static {v1, v2, p0, p2, v3}, Lcom/p1/mobile/putong/live/base/api/LiveApiBuilder;->q(Lcom/p1/mobile/putong/api/api/Network;Lcom/p1/mobile/putong/live/base/api/LiveApiBuilder$ReqType;Ll/rnl;Ljava/lang/String;[Ll/st0;)Ll/pcj;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    const/4 p2, -0x1

    .line 17
    invoke-virtual {v0, p1, p2, p0}, Lcom/tantanapp/common/network/RunnerProxy;->scheduled(Ljava/lang/String;ILl/pcj;)Lrx/c;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    return-object p0
.end method

.method public static buildLivePostReqAny(Ll/rnl;Ljava/lang/String;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;)Lrx/c;
    .locals 7
    .param p0    # Ll/rnl;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p1    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p3    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ll/rnl;",
            "Ljava/lang/String;",
            "Lcom/tantanapp/common/data/JsonAdapter<",
            "TT;>;",
            "Ljava/lang/String;",
            ")",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/live/external/module/api/LiveExternalApi;->getRunner()Lcom/tantanapp/common/network/RunnerProxy;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget-object v1, Lcom/p1/mobile/putong/live/external/module/api/LiveExternalApi;->network:Lcom/p1/mobile/putong/api/api/Network;

    .line 6
    .line 7
    sget-object v2, Lcom/p1/mobile/putong/live/base/api/LiveApiBuilder$ReqType;->POST:Lcom/p1/mobile/putong/live/base/api/LiveApiBuilder$ReqType;

    .line 8
    .line 9
    const/4 v3, 0x0

    .line 10
    new-array v6, v3, [Ll/st0;

    .line 11
    .line 12
    move-object v3, p0

    .line 13
    move-object v4, p2

    .line 14
    move-object v5, p3

    .line 15
    invoke-static/range {v1 .. v6}, Lcom/p1/mobile/putong/live/base/api/LiveApiBuilder;->r(Lcom/p1/mobile/putong/api/api/Network;Lcom/p1/mobile/putong/live/base/api/LiveApiBuilder$ReqType;Ll/rnl;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;[Ll/st0;)Ll/pcj;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    const/4 p2, -0x1

    .line 20
    invoke-virtual {v0, p1, p2, p0}, Lcom/tantanapp/common/network/RunnerProxy;->scheduled(Ljava/lang/String;ILl/pcj;)Lrx/c;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    return-object p0
.end method

.method public static buildLivePut(Ll/rnl;Ljava/lang/String;Ljava/lang/String;Ll/wxr;)Lrx/c;
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
            "<T:",
            "Lcom/p1/mobile/putong/live/base/apibean/BaseLiveBean;",
            ">(",
            "Ll/rnl;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ll/wxr;",
            ")",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    .line 1
    invoke-virtual {p3, p1}, Ll/wxr;->b(Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Lcom/p1/mobile/putong/live/external/module/api/LiveExternalApi;->getRunner()Lcom/tantanapp/common/network/RunnerProxy;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    sget-object v1, Lcom/p1/mobile/putong/live/external/module/api/LiveExternalApi;->network:Lcom/p1/mobile/putong/api/api/Network;

    .line 9
    .line 10
    sget-object v2, Lcom/p1/mobile/putong/live/base/api/LiveApiBuilder$ReqType;->PUT:Lcom/p1/mobile/putong/live/base/api/LiveApiBuilder$ReqType;

    .line 11
    .line 12
    invoke-static {v1, v2, p0, p2, p3}, Lcom/p1/mobile/putong/live/base/api/LiveApiBuilder;->s(Lcom/p1/mobile/putong/api/api/Network;Lcom/p1/mobile/putong/live/base/api/LiveApiBuilder$ReqType;Ll/rnl;Ljava/lang/String;Lcom/tantanapp/common/data/INetParser;)Ll/pcj;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    const/4 p2, -0x1

    .line 17
    invoke-virtual {v0, p1, p2, p0}, Lcom/tantanapp/common/network/RunnerProxy;->scheduled(Ljava/lang/String;ILl/pcj;)Lrx/c;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    return-object p0
.end method

.method public static buildLivePutNetReqObs(Ll/rnl;Ljava/lang/String;Ljava/lang/String;)Lrx/c;
    .locals 4
    .param p0    # Ll/rnl;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p1    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/rnl;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/live/external/module/api/LiveExternalApi;->getRunner()Lcom/tantanapp/common/network/RunnerProxy;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget-object v1, Lcom/p1/mobile/putong/live/external/module/api/LiveExternalApi;->network:Lcom/p1/mobile/putong/api/api/Network;

    .line 6
    .line 7
    sget-object v2, Lcom/p1/mobile/putong/live/base/api/LiveApiBuilder$ReqType;->PUT:Lcom/p1/mobile/putong/live/base/api/LiveApiBuilder$ReqType;

    .line 8
    .line 9
    const/4 v3, 0x0

    .line 10
    new-array v3, v3, [Ll/st0;

    .line 11
    .line 12
    invoke-static {v1, v2, p0, p2, v3}, Lcom/p1/mobile/putong/live/base/api/LiveApiBuilder;->q(Lcom/p1/mobile/putong/api/api/Network;Lcom/p1/mobile/putong/live/base/api/LiveApiBuilder$ReqType;Ll/rnl;Ljava/lang/String;[Ll/st0;)Ll/pcj;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    const/4 p2, -0x1

    .line 17
    invoke-virtual {v0, p1, p2, p0}, Lcom/tantanapp/common/network/RunnerProxy;->scheduled(Ljava/lang/String;ILl/pcj;)Lrx/c;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    return-object p0
.end method

.method public static buildLiveRead(Ll/rnl;Ljava/lang/String;Ll/wxr;)Lrx/c;
    .locals 4
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
            "Ll/wxr;",
            ")",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    .line 1
    invoke-virtual {p2, p1}, Ll/wxr;->b(Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Lcom/p1/mobile/putong/live/external/module/api/LiveExternalApi;->getRunner()Lcom/tantanapp/common/network/RunnerProxy;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    sget-object v1, Lcom/p1/mobile/putong/live/external/module/api/LiveExternalApi;->network:Lcom/p1/mobile/putong/api/api/Network;

    .line 9
    .line 10
    sget-object v2, Lcom/p1/mobile/putong/live/base/api/LiveApiBuilder$ReqType;->GET:Lcom/p1/mobile/putong/live/base/api/LiveApiBuilder$ReqType;

    .line 11
    .line 12
    const-string v3, ""

    .line 13
    .line 14
    invoke-static {v1, v2, p0, v3, p2}, Lcom/p1/mobile/putong/live/base/api/LiveApiBuilder;->s(Lcom/p1/mobile/putong/api/api/Network;Lcom/p1/mobile/putong/live/base/api/LiveApiBuilder$ReqType;Ll/rnl;Ljava/lang/String;Lcom/tantanapp/common/data/INetParser;)Ll/pcj;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    const/4 p2, 0x0

    .line 19
    invoke-virtual {v0, p1, p2, p0}, Lcom/tantanapp/common/network/RunnerProxy;->scheduled(Ljava/lang/String;ILl/pcj;)Lrx/c;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    return-object p0
.end method

.method public static buildLiveReadReq(Ll/rnl;Ljava/lang/String;)Lrx/c;
    .locals 6
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
    invoke-static {}, Lcom/p1/mobile/putong/live/external/module/api/LiveExternalApi;->getRunner()Lcom/tantanapp/common/network/RunnerProxy;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget-object v1, Lcom/p1/mobile/putong/live/external/module/api/LiveExternalApi;->network:Lcom/p1/mobile/putong/api/api/Network;

    .line 6
    .line 7
    sget-object v2, Lcom/p1/mobile/putong/live/base/api/LiveApiBuilder$ReqType;->GET:Lcom/p1/mobile/putong/live/base/api/LiveApiBuilder$ReqType;

    .line 8
    .line 9
    const-string v3, ""

    .line 10
    .line 11
    const/4 v4, 0x0

    .line 12
    new-array v5, v4, [Ll/st0;

    .line 13
    .line 14
    invoke-static {v1, v2, p0, v3, v5}, Lcom/p1/mobile/putong/live/base/api/LiveApiBuilder;->q(Lcom/p1/mobile/putong/api/api/Network;Lcom/p1/mobile/putong/live/base/api/LiveApiBuilder$ReqType;Ll/rnl;Ljava/lang/String;[Ll/st0;)Ll/pcj;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    invoke-virtual {v0, p1, v4, p0}, Lcom/tantanapp/common/network/RunnerProxy;->scheduled(Ljava/lang/String;ILl/pcj;)Lrx/c;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    return-object p0
.end method

.method public static buildLiveReadReqForAny(Ll/rnl;Ljava/lang/String;Lcom/tantanapp/common/data/JsonAdapter;)Lrx/c;
    .locals 8
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
            "Ljava/lang/Object;",
            ">(",
            "Ll/rnl;",
            "Ljava/lang/String;",
            "Lcom/tantanapp/common/data/JsonAdapter<",
            "TT;>;)",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/live/external/module/api/LiveExternalApi;->getRunner()Lcom/tantanapp/common/network/RunnerProxy;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget-object v1, Lcom/p1/mobile/putong/live/external/module/api/LiveExternalApi;->network:Lcom/p1/mobile/putong/api/api/Network;

    .line 6
    .line 7
    sget-object v2, Lcom/p1/mobile/putong/live/base/api/LiveApiBuilder$ReqType;->GET:Lcom/p1/mobile/putong/live/base/api/LiveApiBuilder$ReqType;

    .line 8
    .line 9
    const-string v5, ""

    .line 10
    .line 11
    const/4 v7, 0x0

    .line 12
    new-array v6, v7, [Ll/st0;

    .line 13
    .line 14
    move-object v3, p0

    .line 15
    move-object v4, p2

    .line 16
    invoke-static/range {v1 .. v6}, Lcom/p1/mobile/putong/live/base/api/LiveApiBuilder;->r(Lcom/p1/mobile/putong/api/api/Network;Lcom/p1/mobile/putong/live/base/api/LiveApiBuilder$ReqType;Ll/rnl;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;[Ll/st0;)Ll/pcj;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    invoke-virtual {v0, p1, v7, p0}, Lcom/tantanapp/common/network/RunnerProxy;->scheduled(Ljava/lang/String;ILl/pcj;)Lrx/c;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    return-object p0
.end method

.method public static buildLiveReadReqIO(Ll/rnl;Ljava/lang/String;)Lrx/c;
    .locals 6
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
    invoke-static {}, Lcom/p1/mobile/putong/live/external/module/api/LiveExternalApi;->getRunner()Lcom/tantanapp/common/network/RunnerProxy;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget-object v1, Lcom/p1/mobile/putong/live/external/module/api/LiveExternalApi;->network:Lcom/p1/mobile/putong/api/api/Network;

    .line 6
    .line 7
    sget-object v2, Lcom/p1/mobile/putong/live/base/api/LiveApiBuilder$ReqType;->GET:Lcom/p1/mobile/putong/live/base/api/LiveApiBuilder$ReqType;

    .line 8
    .line 9
    const-string v3, ""

    .line 10
    .line 11
    const/4 v4, 0x0

    .line 12
    new-array v5, v4, [Ll/st0;

    .line 13
    .line 14
    invoke-static {v1, v2, p0, v3, v5}, Lcom/p1/mobile/putong/live/base/api/LiveApiBuilder;->o(Lcom/p1/mobile/putong/api/api/Network;Lcom/p1/mobile/putong/live/base/api/LiveApiBuilder$ReqType;Ll/rnl;Ljava/lang/String;[Ll/st0;)Ll/pcj;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    invoke-virtual {v0, p1, v4, p0}, Lcom/tantanapp/common/network/RunnerProxy;->scheduled(Ljava/lang/String;ILl/pcj;)Lrx/c;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    return-object p0
.end method

.method private static getRunner()Lcom/tantanapp/common/network/RunnerProxy;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/live/external/module/api/LiveExternalApi;->liveRunner:Lcom/tantanapp/common/network/RunnerProxy;

    .line 2
    .line 3
    return-object v0
.end method

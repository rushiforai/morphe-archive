.class public Ll/vrv;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final a:Lcom/tantanapp/common/network/RunnerProxy;

.field public static final b:Lcom/tantanapp/common/network/RunnerProxy;

.field public static c:Lcom/p1/mobile/putong/api/api/Network;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/tantanapp/common/network/RunnerProxy;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/tantanapp/common/network/RunnerProxy;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/vrv;->a:Lcom/tantanapp/common/network/RunnerProxy;

    .line 7
    .line 8
    new-instance v0, Lcom/tantanapp/common/network/RunnerProxy;

    .line 9
    .line 10
    invoke-direct {v0}, Lcom/tantanapp/common/network/RunnerProxy;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v0, Ll/vrv;->b:Lcom/tantanapp/common/network/RunnerProxy;

    .line 14
    .line 15
    sget-object v0, Ll/uqb0;->H:Lcom/p1/mobile/putong/api/api/Network;

    .line 16
    .line 17
    sput-object v0, Ll/vrv;->c:Lcom/p1/mobile/putong/api/api/Network;

    .line 18
    .line 19
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

.method public static a(Ll/rnl;Ljava/lang/String;Ljava/lang/String;)Lrx/c;
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
    invoke-static {}, Ll/vrv;->y()Lcom/tantanapp/common/network/RunnerProxy;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget-object v1, Ll/vrv;->c:Lcom/p1/mobile/putong/api/api/Network;

    .line 6
    .line 7
    sget-object v2, Lcom/p1/mobile/putong/live/base/api/LiveApiBuilder$ReqType;->DELETE:Lcom/p1/mobile/putong/live/base/api/LiveApiBuilder$ReqType;

    .line 8
    .line 9
    sget-object v3, Ll/zrv;->f:Ll/f2d0;

    .line 10
    .line 11
    invoke-virtual {v3}, Ll/f2d0;->c()[Ll/st0;

    .line 12
    .line 13
    .line 14
    move-result-object v3

    .line 15
    invoke-static {v1, v2, p0, p2, v3}, Lcom/p1/mobile/putong/live/base/api/LiveApiBuilder;->q(Lcom/p1/mobile/putong/api/api/Network;Lcom/p1/mobile/putong/live/base/api/LiveApiBuilder$ReqType;Ll/rnl;Ljava/lang/String;[Ll/st0;)Ll/pcj;

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

.method public static b(Ll/rnl;Ljava/lang/String;Ljava/lang/String;)Lrx/c;
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
    invoke-static {}, Ll/vrv;->y()Lcom/tantanapp/common/network/RunnerProxy;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget-object v1, Ll/vrv;->c:Lcom/p1/mobile/putong/api/api/Network;

    .line 6
    .line 7
    sget-object v2, Lcom/p1/mobile/putong/live/base/api/LiveApiBuilder$ReqType;->PATCH:Lcom/p1/mobile/putong/live/base/api/LiveApiBuilder$ReqType;

    .line 8
    .line 9
    sget-object v3, Ll/zrv;->f:Ll/f2d0;

    .line 10
    .line 11
    invoke-virtual {v3}, Ll/f2d0;->c()[Ll/st0;

    .line 12
    .line 13
    .line 14
    move-result-object v3

    .line 15
    invoke-static {v1, v2, p0, p2, v3}, Lcom/p1/mobile/putong/live/base/api/LiveApiBuilder;->q(Lcom/p1/mobile/putong/api/api/Network;Lcom/p1/mobile/putong/live/base/api/LiveApiBuilder$ReqType;Ll/rnl;Ljava/lang/String;[Ll/st0;)Ll/pcj;

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

.method public static c(Ll/rnl;Ljava/lang/String;Lcom/tantanapp/common/data/JsonAdapter;)Lrx/c;
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
    const-string v0, ""

    .line 2
    .line 3
    invoke-static {p0, p1, p2, v0}, Ll/vrv;->d(Ll/rnl;Ljava/lang/String;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;)Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public static d(Ll/rnl;Ljava/lang/String;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;)Lrx/c;
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
    invoke-static {}, Ll/vrv;->y()Lcom/tantanapp/common/network/RunnerProxy;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget-object v1, Ll/vrv;->c:Lcom/p1/mobile/putong/api/api/Network;

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

.method public static e(Ll/rnl;Ljava/lang/String;Ljava/lang/String;)Lrx/c;
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
    invoke-static {}, Ll/vrv;->y()Lcom/tantanapp/common/network/RunnerProxy;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget-object v1, Ll/vrv;->c:Lcom/p1/mobile/putong/api/api/Network;

    .line 6
    .line 7
    sget-object v2, Lcom/p1/mobile/putong/live/base/api/LiveApiBuilder$ReqType;->POST:Lcom/p1/mobile/putong/live/base/api/LiveApiBuilder$ReqType;

    .line 8
    .line 9
    sget-object v3, Ll/zrv;->f:Ll/f2d0;

    .line 10
    .line 11
    invoke-virtual {v3}, Ll/f2d0;->c()[Ll/st0;

    .line 12
    .line 13
    .line 14
    move-result-object v3

    .line 15
    invoke-static {v1, v2, p0, p2, v3}, Lcom/p1/mobile/putong/live/base/api/LiveApiBuilder;->q(Lcom/p1/mobile/putong/api/api/Network;Lcom/p1/mobile/putong/live/base/api/LiveApiBuilder$ReqType;Ll/rnl;Ljava/lang/String;[Ll/st0;)Ll/pcj;

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

.method public static f(Ll/rnl;Ljava/lang/String;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;)Lrx/c;
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
    invoke-static {}, Ll/vrv;->y()Lcom/tantanapp/common/network/RunnerProxy;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget-object v1, Ll/vrv;->c:Lcom/p1/mobile/putong/api/api/Network;

    .line 6
    .line 7
    sget-object v2, Lcom/p1/mobile/putong/live/base/api/LiveApiBuilder$ReqType;->POST:Lcom/p1/mobile/putong/live/base/api/LiveApiBuilder$ReqType;

    .line 8
    .line 9
    sget-object v3, Ll/zrv;->f:Ll/f2d0;

    .line 10
    .line 11
    invoke-virtual {v3}, Ll/f2d0;->c()[Ll/st0;

    .line 12
    .line 13
    .line 14
    move-result-object v6

    .line 15
    move-object v3, p0

    .line 16
    move-object v4, p2

    .line 17
    move-object v5, p3

    .line 18
    invoke-static/range {v1 .. v6}, Lcom/p1/mobile/putong/live/base/api/LiveApiBuilder;->r(Lcom/p1/mobile/putong/api/api/Network;Lcom/p1/mobile/putong/live/base/api/LiveApiBuilder$ReqType;Ll/rnl;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;[Ll/st0;)Ll/pcj;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    const/4 p2, -0x1

    .line 23
    invoke-virtual {v0, p1, p2, p0}, Lcom/tantanapp/common/network/RunnerProxy;->scheduled(Ljava/lang/String;ILl/pcj;)Lrx/c;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    return-object p0
.end method

.method public static g(Ll/rnl;Ljava/lang/String;Ljava/lang/String;)Lrx/c;
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
    invoke-static {}, Ll/vrv;->y()Lcom/tantanapp/common/network/RunnerProxy;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget-object v1, Ll/vrv;->c:Lcom/p1/mobile/putong/api/api/Network;

    .line 6
    .line 7
    sget-object v2, Lcom/p1/mobile/putong/live/base/api/LiveApiBuilder$ReqType;->PUT:Lcom/p1/mobile/putong/live/base/api/LiveApiBuilder$ReqType;

    .line 8
    .line 9
    sget-object v3, Ll/zrv;->f:Ll/f2d0;

    .line 10
    .line 11
    invoke-virtual {v3}, Ll/f2d0;->c()[Ll/st0;

    .line 12
    .line 13
    .line 14
    move-result-object v3

    .line 15
    invoke-static {v1, v2, p0, p2, v3}, Lcom/p1/mobile/putong/live/base/api/LiveApiBuilder;->q(Lcom/p1/mobile/putong/api/api/Network;Lcom/p1/mobile/putong/live/base/api/LiveApiBuilder$ReqType;Ll/rnl;Ljava/lang/String;[Ll/st0;)Ll/pcj;

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

.method public static h(Ll/rnl;Ljava/lang/String;)Lrx/c;
    .locals 5
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
    invoke-static {}, Ll/vrv;->y()Lcom/tantanapp/common/network/RunnerProxy;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget-object v1, Ll/vrv;->c:Lcom/p1/mobile/putong/api/api/Network;

    .line 6
    .line 7
    sget-object v2, Lcom/p1/mobile/putong/live/base/api/LiveApiBuilder$ReqType;->GET:Lcom/p1/mobile/putong/live/base/api/LiveApiBuilder$ReqType;

    .line 8
    .line 9
    sget-object v3, Ll/zrv;->f:Ll/f2d0;

    .line 10
    .line 11
    invoke-virtual {v3}, Ll/f2d0;->c()[Ll/st0;

    .line 12
    .line 13
    .line 14
    move-result-object v3

    .line 15
    const-string v4, ""

    .line 16
    .line 17
    invoke-static {v1, v2, p0, v4, v3}, Lcom/p1/mobile/putong/live/base/api/LiveApiBuilder;->q(Lcom/p1/mobile/putong/api/api/Network;Lcom/p1/mobile/putong/live/base/api/LiveApiBuilder$ReqType;Ll/rnl;Ljava/lang/String;[Ll/st0;)Ll/pcj;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    const/4 v1, 0x0

    .line 22
    invoke-virtual {v0, p1, v1, p0}, Lcom/tantanapp/common/network/RunnerProxy;->scheduled(Ljava/lang/String;ILl/pcj;)Lrx/c;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    return-object p0
.end method

.method public static i(Ll/rnl;Ljava/lang/String;Lcom/tantanapp/common/data/JsonAdapter;)Lrx/c;
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
    invoke-static {}, Ll/vrv;->y()Lcom/tantanapp/common/network/RunnerProxy;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget-object v1, Ll/vrv;->c:Lcom/p1/mobile/putong/api/api/Network;

    .line 6
    .line 7
    sget-object v2, Lcom/p1/mobile/putong/live/base/api/LiveApiBuilder$ReqType;->GET:Lcom/p1/mobile/putong/live/base/api/LiveApiBuilder$ReqType;

    .line 8
    .line 9
    sget-object v3, Ll/zrv;->f:Ll/f2d0;

    .line 10
    .line 11
    invoke-virtual {v3}, Ll/f2d0;->c()[Ll/st0;

    .line 12
    .line 13
    .line 14
    move-result-object v6

    .line 15
    const-string v5, ""

    .line 16
    .line 17
    move-object v3, p0

    .line 18
    move-object v4, p2

    .line 19
    invoke-static/range {v1 .. v6}, Lcom/p1/mobile/putong/live/base/api/LiveApiBuilder;->r(Lcom/p1/mobile/putong/api/api/Network;Lcom/p1/mobile/putong/live/base/api/LiveApiBuilder$ReqType;Ll/rnl;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;[Ll/st0;)Ll/pcj;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    const/4 p2, 0x0

    .line 24
    invoke-virtual {v0, p1, p2, p0}, Lcom/tantanapp/common/network/RunnerProxy;->scheduled(Ljava/lang/String;ILl/pcj;)Lrx/c;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    return-object p0
.end method

.method public static j(Ll/rnl;Ljava/lang/String;Ljava/lang/String;)Lrx/c;
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
    invoke-static {}, Ll/vrv;->z()Lcom/tantanapp/common/network/RunnerProxy;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget-object v1, Ll/vrv;->c:Lcom/p1/mobile/putong/api/api/Network;

    .line 6
    .line 7
    sget-object v2, Lcom/p1/mobile/putong/live/base/api/LiveApiBuilder$ReqType;->DELETE:Lcom/p1/mobile/putong/live/base/api/LiveApiBuilder$ReqType;

    .line 8
    .line 9
    sget-object v3, Ll/zrv;->f:Ll/f2d0;

    .line 10
    .line 11
    invoke-virtual {v3}, Ll/f2d0;->c()[Ll/st0;

    .line 12
    .line 13
    .line 14
    move-result-object v3

    .line 15
    invoke-static {v1, v2, p0, p2, v3}, Lcom/p1/mobile/putong/live/base/api/LiveApiBuilder;->q(Lcom/p1/mobile/putong/api/api/Network;Lcom/p1/mobile/putong/live/base/api/LiveApiBuilder$ReqType;Ll/rnl;Ljava/lang/String;[Ll/st0;)Ll/pcj;

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

.method public static k(Ll/rnl;Ljava/lang/String;Lcom/tantanapp/common/data/JsonAdapter;)Lrx/c;
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
    invoke-static {}, Ll/vrv;->y()Lcom/tantanapp/common/network/RunnerProxy;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget-object v1, Ll/vrv;->c:Lcom/p1/mobile/putong/api/api/Network;

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

.method public static l(Ll/rnl;Ljava/lang/String;Ljava/lang/String;Ll/wxr;)Lrx/c;
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
    invoke-static {}, Ll/vrv;->z()Lcom/tantanapp/common/network/RunnerProxy;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    sget-object v1, Ll/vrv;->c:Lcom/p1/mobile/putong/api/api/Network;

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

.method public static m(Ll/rnl;Ljava/lang/String;Ljava/lang/String;)Lrx/c;
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
    invoke-static {}, Ll/vrv;->z()Lcom/tantanapp/common/network/RunnerProxy;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget-object v1, Ll/vrv;->c:Lcom/p1/mobile/putong/api/api/Network;

    .line 6
    .line 7
    sget-object v2, Lcom/p1/mobile/putong/live/base/api/LiveApiBuilder$ReqType;->PATCH:Lcom/p1/mobile/putong/live/base/api/LiveApiBuilder$ReqType;

    .line 8
    .line 9
    sget-object v3, Ll/zrv;->f:Ll/f2d0;

    .line 10
    .line 11
    invoke-virtual {v3}, Ll/f2d0;->c()[Ll/st0;

    .line 12
    .line 13
    .line 14
    move-result-object v3

    .line 15
    invoke-static {v1, v2, p0, p2, v3}, Lcom/p1/mobile/putong/live/base/api/LiveApiBuilder;->q(Lcom/p1/mobile/putong/api/api/Network;Lcom/p1/mobile/putong/live/base/api/LiveApiBuilder$ReqType;Ll/rnl;Ljava/lang/String;[Ll/st0;)Ll/pcj;

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

.method public static n(Ll/rnl;Ljava/lang/String;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;)Lrx/c;
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
    invoke-static {}, Ll/vrv;->y()Lcom/tantanapp/common/network/RunnerProxy;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget-object v1, Ll/vrv;->c:Lcom/p1/mobile/putong/api/api/Network;

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

.method public static o(Ll/rnl;Ljava/lang/String;Ljava/lang/String;Ll/wxr;)Lrx/c;
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
    invoke-static {}, Ll/vrv;->z()Lcom/tantanapp/common/network/RunnerProxy;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    sget-object v1, Ll/vrv;->c:Lcom/p1/mobile/putong/api/api/Network;

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

.method public static p(Ll/rnl;Ljava/lang/String;Ljava/lang/String;)Lrx/c;
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
    invoke-static {}, Ll/vrv;->z()Lcom/tantanapp/common/network/RunnerProxy;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget-object v1, Ll/vrv;->c:Lcom/p1/mobile/putong/api/api/Network;

    .line 6
    .line 7
    sget-object v2, Lcom/p1/mobile/putong/live/base/api/LiveApiBuilder$ReqType;->POST:Lcom/p1/mobile/putong/live/base/api/LiveApiBuilder$ReqType;

    .line 8
    .line 9
    sget-object v3, Ll/zrv;->f:Ll/f2d0;

    .line 10
    .line 11
    invoke-virtual {v3}, Ll/f2d0;->c()[Ll/st0;

    .line 12
    .line 13
    .line 14
    move-result-object v3

    .line 15
    invoke-static {v1, v2, p0, p2, v3}, Lcom/p1/mobile/putong/live/base/api/LiveApiBuilder;->q(Lcom/p1/mobile/putong/api/api/Network;Lcom/p1/mobile/putong/live/base/api/LiveApiBuilder$ReqType;Ll/rnl;Ljava/lang/String;[Ll/st0;)Ll/pcj;

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

.method public static q(Ll/rnl;Ljava/lang/String;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;)Lrx/c;
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
    invoke-static {}, Ll/vrv;->z()Lcom/tantanapp/common/network/RunnerProxy;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget-object v1, Ll/vrv;->c:Lcom/p1/mobile/putong/api/api/Network;

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

.method public static r(Ll/rnl;Ljava/lang/String;Ljava/lang/String;)Lrx/c;
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
    invoke-static {}, Ll/vrv;->z()Lcom/tantanapp/common/network/RunnerProxy;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget-object v1, Ll/vrv;->c:Lcom/p1/mobile/putong/api/api/Network;

    .line 6
    .line 7
    sget-object v2, Lcom/p1/mobile/putong/live/base/api/LiveApiBuilder$ReqType;->POST:Lcom/p1/mobile/putong/live/base/api/LiveApiBuilder$ReqType;

    .line 8
    .line 9
    sget-object v3, Ll/zrv;->f:Ll/f2d0;

    .line 10
    .line 11
    invoke-virtual {v3}, Ll/f2d0;->c()[Ll/st0;

    .line 12
    .line 13
    .line 14
    move-result-object v3

    .line 15
    invoke-static {v1, v2, p0, p2, v3}, Lcom/p1/mobile/putong/live/base/api/LiveApiBuilder;->p(Lcom/p1/mobile/putong/api/api/Network;Lcom/p1/mobile/putong/live/base/api/LiveApiBuilder$ReqType;Ll/rnl;Ljava/lang/String;[Ll/st0;)Lrx/c;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-virtual {v0, p1, p0}, Lcom/tantanapp/common/network/RunnerProxy;->now(Ljava/lang/String;Lrx/c;)Lrx/c;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    return-object p0
.end method

.method public static s(Ll/rnl;Ljava/lang/String;Ljava/lang/String;Ll/wxr;)Lrx/c;
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
    invoke-static {}, Ll/vrv;->z()Lcom/tantanapp/common/network/RunnerProxy;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    sget-object v1, Ll/vrv;->c:Lcom/p1/mobile/putong/api/api/Network;

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

.method public static t(Ll/rnl;Ljava/lang/String;Ljava/lang/String;)Lrx/c;
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
    invoke-static {}, Ll/vrv;->z()Lcom/tantanapp/common/network/RunnerProxy;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget-object v1, Ll/vrv;->c:Lcom/p1/mobile/putong/api/api/Network;

    .line 6
    .line 7
    sget-object v2, Lcom/p1/mobile/putong/live/base/api/LiveApiBuilder$ReqType;->PUT:Lcom/p1/mobile/putong/live/base/api/LiveApiBuilder$ReqType;

    .line 8
    .line 9
    sget-object v3, Ll/zrv;->f:Ll/f2d0;

    .line 10
    .line 11
    invoke-virtual {v3}, Ll/f2d0;->c()[Ll/st0;

    .line 12
    .line 13
    .line 14
    move-result-object v3

    .line 15
    invoke-static {v1, v2, p0, p2, v3}, Lcom/p1/mobile/putong/live/base/api/LiveApiBuilder;->q(Lcom/p1/mobile/putong/api/api/Network;Lcom/p1/mobile/putong/live/base/api/LiveApiBuilder$ReqType;Ll/rnl;Ljava/lang/String;[Ll/st0;)Ll/pcj;

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

.method public static u(Ll/rnl;Ljava/lang/String;Ljava/lang/String;)Lrx/c;
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
    invoke-static {}, Ll/vrv;->z()Lcom/tantanapp/common/network/RunnerProxy;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget-object v1, Ll/vrv;->c:Lcom/p1/mobile/putong/api/api/Network;

    .line 6
    .line 7
    sget-object v2, Lcom/p1/mobile/putong/live/base/api/LiveApiBuilder$ReqType;->PUT:Lcom/p1/mobile/putong/live/base/api/LiveApiBuilder$ReqType;

    .line 8
    .line 9
    sget-object v3, Ll/zrv;->f:Ll/f2d0;

    .line 10
    .line 11
    invoke-virtual {v3}, Ll/f2d0;->c()[Ll/st0;

    .line 12
    .line 13
    .line 14
    move-result-object v3

    .line 15
    invoke-static {v1, v2, p0, p2, v3}, Lcom/p1/mobile/putong/live/base/api/LiveApiBuilder;->p(Lcom/p1/mobile/putong/api/api/Network;Lcom/p1/mobile/putong/live/base/api/LiveApiBuilder$ReqType;Ll/rnl;Ljava/lang/String;[Ll/st0;)Lrx/c;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-virtual {v0, p1, p0}, Lcom/tantanapp/common/network/RunnerProxy;->now(Ljava/lang/String;Lrx/c;)Lrx/c;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    return-object p0
.end method

.method public static v(Ll/rnl;Ljava/lang/String;Ll/wxr;)Lrx/c;
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
    invoke-static {}, Ll/vrv;->z()Lcom/tantanapp/common/network/RunnerProxy;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    sget-object v1, Ll/vrv;->c:Lcom/p1/mobile/putong/api/api/Network;

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

.method public static w(Ll/rnl;Ljava/lang/String;)Lrx/c;
    .locals 5
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
    invoke-static {}, Ll/vrv;->z()Lcom/tantanapp/common/network/RunnerProxy;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget-object v1, Ll/vrv;->c:Lcom/p1/mobile/putong/api/api/Network;

    .line 6
    .line 7
    sget-object v2, Lcom/p1/mobile/putong/live/base/api/LiveApiBuilder$ReqType;->GET:Lcom/p1/mobile/putong/live/base/api/LiveApiBuilder$ReqType;

    .line 8
    .line 9
    sget-object v3, Ll/zrv;->f:Ll/f2d0;

    .line 10
    .line 11
    invoke-virtual {v3}, Ll/f2d0;->c()[Ll/st0;

    .line 12
    .line 13
    .line 14
    move-result-object v3

    .line 15
    const-string v4, ""

    .line 16
    .line 17
    invoke-static {v1, v2, p0, v4, v3}, Lcom/p1/mobile/putong/live/base/api/LiveApiBuilder;->q(Lcom/p1/mobile/putong/api/api/Network;Lcom/p1/mobile/putong/live/base/api/LiveApiBuilder$ReqType;Ll/rnl;Ljava/lang/String;[Ll/st0;)Ll/pcj;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    const/4 v1, 0x0

    .line 22
    invoke-virtual {v0, p1, v1, p0}, Lcom/tantanapp/common/network/RunnerProxy;->scheduled(Ljava/lang/String;ILl/pcj;)Lrx/c;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    return-object p0
.end method

.method public static x()V
    .locals 1

    .line 1
    sget-object v0, Ll/vrv;->a:Lcom/tantanapp/common/network/RunnerProxy;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/tantanapp/common/network/RunnerProxy;->clearRequestsAndStop()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/tantanapp/common/network/RunnerProxy;->runnerStart()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public static y()Lcom/tantanapp/common/network/RunnerProxy;
    .locals 1

    .line 1
    sget-object v0, Ll/vrv;->b:Lcom/tantanapp/common/network/RunnerProxy;

    .line 2
    .line 3
    return-object v0
.end method

.method public static z()Lcom/tantanapp/common/network/RunnerProxy;
    .locals 1

    .line 1
    sget-object v0, Ll/vrv;->a:Lcom/tantanapp/common/network/RunnerProxy;

    .line 2
    .line 3
    return-object v0
.end method

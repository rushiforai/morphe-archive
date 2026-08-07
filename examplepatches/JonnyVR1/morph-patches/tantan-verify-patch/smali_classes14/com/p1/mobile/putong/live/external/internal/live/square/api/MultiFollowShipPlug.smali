.class public final Lcom/p1/mobile/putong/live/external/internal/live/square/api/MultiFollowShipPlug;
.super Lcom/p1/mobile/putong/live/external/square/api/BaseAsyncPlug;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u00000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0002\u0018\u0002\n\u0002\u0008\u0006\n\u0002\u0018\u0002\n\u0002\u0008\u0007\u0018\u00002\u00020\u0001B\u000f\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u00a2\u0006\u0004\u0008\u0004\u0010\u0005J\u000f\u0010\u0007\u001a\u00020\u0006H\u0016\u00a2\u0006\u0004\u0008\u0007\u0010\u0008R2\u0010\u000c\u001a\u0012\u0012\u0004\u0012\u00020\n0\tj\u0008\u0012\u0004\u0012\u00020\n`\u000b8\u0006@\u0006X\u0086\u000e\u00a2\u0006\u0012\n\u0004\u0008\u000c\u0010\r\u001a\u0004\u0008\u000e\u0010\u000f\"\u0004\u0008\u0010\u0010\u0011R$\u0010\u0013\u001a\u0004\u0018\u00010\u00128\u0006@\u0006X\u0086\u000e\u00a2\u0006\u0012\n\u0004\u0008\u0013\u0010\u0014\u001a\u0004\u0008\u0015\u0010\u0016\"\u0004\u0008\u0017\u0010\u0018\u00a8\u0006\u0019"
    }
    d2 = {
        "Lcom/p1/mobile/putong/live/external/internal/live/square/api/MultiFollowShipPlug;",
        "Lcom/p1/mobile/putong/live/external/square/api/BaseAsyncPlug;",
        "Ll/ner;",
        "lifecycleProvider",
        "<init>",
        "(Ll/ner;)V",
        "",
        "getData",
        "()V",
        "Ljava/util/ArrayList;",
        "",
        "Lkotlin/collections/ArrayList;",
        "userIds",
        "Ljava/util/ArrayList;",
        "getUserIds",
        "()Ljava/util/ArrayList;",
        "setUserIds",
        "(Ljava/util/ArrayList;)V",
        "Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;",
        "resultData",
        "Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;",
        "getResultData",
        "()Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;",
        "setResultData",
        "(Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)V",
        "external_intlGmsRelease"
    }
    k = 0x1
    mv = {
        0x2,
        0x2,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field private resultData:Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field

.field private userIds:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ll/ner;)V
    .locals 0
    .param p1    # Ll/ner;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/external/square/api/BaseAsyncPlug;-><init>(Ll/ner;)V

    .line 5
    .line 6
    .line 7
    new-instance p1, Ljava/util/ArrayList;

    .line 8
    .line 9
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 10
    .line 11
    .line 12
    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/api/MultiFollowShipPlug;->userIds:Ljava/util/ArrayList;

    .line 13
    .line 14
    return-void
.end method

.method public static f(Lorg/json/JSONArray;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static g(Lcom/p1/mobile/putong/live/external/internal/live/square/api/MultiFollowShipPlug;Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/api/MultiFollowShipPlug;->resultData:Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/square/api/BaseAsyncPlug;->success()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static h(Lcom/p1/mobile/putong/live/external/internal/live/square/api/MultiFollowShipPlug;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/square/api/BaseAsyncPlug;->complete()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static i(Lcom/p1/mobile/putong/live/external/internal/live/square/api/MultiFollowShipPlug;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/external/square/api/BaseAsyncPlug;->error(Ljava/lang/Throwable;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method


# virtual methods
.method public getData()V
    .locals 4

    .line 1
    new-instance v0, Lorg/json/JSONArray;

    .line 2
    .line 3
    invoke-direct {v0}, Lorg/json/JSONArray;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/api/MultiFollowShipPlug;->userIds:Ljava/util/ArrayList;

    .line 7
    .line 8
    new-instance v2, Ll/wr10;

    .line 9
    .line 10
    invoke-direct {v2, v0}, Ll/wr10;-><init>(Lorg/json/JSONArray;)V

    .line 11
    .line 12
    .line 13
    invoke-static {v1, v2}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 14
    .line 15
    .line 16
    new-instance v1, Lorg/json/JSONObject;

    .line 17
    .line 18
    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    .line 19
    .line 20
    .line 21
    const-string v2, "userIds"

    .line 22
    .line 23
    invoke-virtual {v1, v2, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 24
    .line 25
    .line 26
    const-string v0, "/live/multi-followship"

    .line 27
    .line 28
    invoke-static {v0}, Ll/zvr;->b(Ljava/lang/String;)Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    invoke-static {v0}, Ll/rnl;->r(Ljava/lang/String;)Ll/rnl;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 37
    .line 38
    .line 39
    const-string v2, "multi-followship"

    .line 40
    .line 41
    invoke-virtual {v1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    invoke-static {v0, v2, v1}, Lcom/p1/mobile/putong/live/external/module/api/LiveExternalApi;->buildLivePostNetReqObs(Ll/rnl;Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 50
    .line 51
    .line 52
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/external/square/api/BaseAsyncPlug;->duringCreated(Lrx/c;)Lrx/c;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 57
    .line 58
    .line 59
    move-result-object v1

    .line 60
    invoke-virtual {v0, v1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    new-instance v1, Ll/xr10;

    .line 65
    .line 66
    invoke-direct {v1, p0}, Ll/xr10;-><init>(Lcom/p1/mobile/putong/live/external/internal/live/square/api/MultiFollowShipPlug;)V

    .line 67
    .line 68
    .line 69
    new-instance v2, Ll/yr10;

    .line 70
    .line 71
    invoke-direct {v2, p0}, Ll/yr10;-><init>(Lcom/p1/mobile/putong/live/external/internal/live/square/api/MultiFollowShipPlug;)V

    .line 72
    .line 73
    .line 74
    new-instance v3, Ll/zr10;

    .line 75
    .line 76
    invoke-direct {v3, p0}, Ll/zr10;-><init>(Lcom/p1/mobile/putong/live/external/internal/live/square/api/MultiFollowShipPlug;)V

    .line 77
    .line 78
    .line 79
    invoke-static {v1, v2, v3}, Ll/dhw;->f(Ll/y20;Ll/y20;Ll/x20;)Ll/t9t;

    .line 80
    .line 81
    .line 82
    move-result-object p0

    .line 83
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 84
    .line 85
    .line 86
    return-void
.end method

.method public final getResultData()Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/api/MultiFollowShipPlug;->resultData:Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;

    .line 2
    .line 3
    return-object p0
.end method

.method public final getUserIds()Ljava/util/ArrayList;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/api/MultiFollowShipPlug;->userIds:Ljava/util/ArrayList;

    .line 2
    .line 3
    return-object p0
.end method

.method public final setResultData(Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)V
    .locals 0
    .param p1    # Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/api/MultiFollowShipPlug;->resultData:Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;

    .line 2
    .line 3
    return-void
.end method

.method public final setUserIds(Ljava/util/ArrayList;)V
    .locals 0
    .param p1    # Ljava/util/ArrayList;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/api/MultiFollowShipPlug;->userIds:Ljava/util/ArrayList;

    .line 5
    .line 6
    return-void
.end method

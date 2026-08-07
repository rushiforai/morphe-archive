.class public Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/utils/ISudFSMStateHandleUtils;
.super Ljava/lang/Object;
.source "SourceFile"


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

.method public static handleSuccess(Ltech/sud/gip/core/ISudFSMStateHandle;)V
    .locals 2

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/MGStateResponse;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/MGStateResponse;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    iput v1, v0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/MGStateResponse;->ret_code:I

    .line 8
    .line 9
    const-string v1, "success"

    .line 10
    .line 11
    iput-object v1, v0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/MGStateResponse;->ret_msg:Ljava/lang/String;

    .line 12
    .line 13
    invoke-static {v0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/utils/SudJsonUtils;->toJson(Ljava/lang/Object;)Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-interface {p0, v0}, Ltech/sud/gip/core/ISudFSMStateHandle;->success(Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

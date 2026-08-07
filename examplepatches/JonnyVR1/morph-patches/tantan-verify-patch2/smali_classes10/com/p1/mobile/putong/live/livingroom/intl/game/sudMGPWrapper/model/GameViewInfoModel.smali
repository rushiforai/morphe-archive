.class public Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/model/GameViewInfoModel;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/model/GameViewInfoModel$GameViewSizeModel;,
        Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/model/GameViewInfoModel$GameViewRectModel;
    }
.end annotation


# instance fields
.field public ret_code:I

.field public ret_msg:Ljava/lang/String;

.field public view_game_rect:Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/model/GameViewInfoModel$GameViewRectModel;

.field public view_size:Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/model/GameViewInfoModel$GameViewSizeModel;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/model/GameViewInfoModel$GameViewSizeModel;

    .line 5
    .line 6
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/model/GameViewInfoModel$GameViewSizeModel;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/model/GameViewInfoModel;->view_size:Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/model/GameViewInfoModel$GameViewSizeModel;

    .line 10
    .line 11
    new-instance v0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/model/GameViewInfoModel$GameViewRectModel;

    .line 12
    .line 13
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/model/GameViewInfoModel$GameViewRectModel;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/model/GameViewInfoModel;->view_game_rect:Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/model/GameViewInfoModel$GameViewRectModel;

    .line 17
    .line 18
    return-void
.end method

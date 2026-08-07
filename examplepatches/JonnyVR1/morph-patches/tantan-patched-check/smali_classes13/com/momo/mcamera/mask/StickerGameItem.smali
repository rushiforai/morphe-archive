.class public Lcom/momo/mcamera/mask/StickerGameItem;
.super Lcom/momo/mcamera/mask/StickerItem;
.source "SourceFile"


# instance fields
.field public downVelocity:F

.field public gameScoreListener:Lcom/momo/mcamera/mask/delegate/GameScoreListener;

.field public isGameLive:Z


# direct methods
.method public constructor <init>(Lcom/momo/mcamera/mask/Sticker;Landroid/content/Context;)V
    .locals 1

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/momo/mcamera/mask/StickerItem;-><init>(Lcom/momo/mcamera/mask/Sticker;Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const/high16 p1, 0x3e800000    # 0.25f

    .line 5
    .line 6
    iput p1, p0, Lcom/momo/mcamera/mask/StickerGameItem;->downVelocity:F

    .line 7
    .line 8
    const/4 p1, 0x1

    .line 9
    iput-boolean p1, p0, Lcom/momo/mcamera/mask/StickerItem;->isDraw:Z

    .line 10
    .line 11
    iget-object p2, p0, Lcom/momo/mcamera/mask/StickerItem;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 12
    .line 13
    invoke-virtual {p2}, Lcom/momo/mcamera/mask/Sticker;->getObjectTriggerType()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p2

    .line 17
    const-string v0, "game_live"

    .line 18
    .line 19
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result p2

    .line 23
    if-eqz p2, :cond_0

    .line 24
    .line 25
    iput-boolean p1, p0, Lcom/momo/mcamera/mask/StickerGameItem;->isGameLive:Z

    .line 26
    .line 27
    return-void

    .line 28
    :cond_0
    const/4 p1, 0x0

    .line 29
    iput-boolean p1, p0, Lcom/momo/mcamera/mask/StickerGameItem;->isGameLive:Z

    .line 30
    .line 31
    return-void
.end method


# virtual methods
.method public setDetectParam(Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;)V
    .locals 0

    return-void
.end method

.method public setGameScoreListener(Lcom/momo/mcamera/mask/delegate/GameScoreListener;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/mcamera/mask/StickerGameItem;->gameScoreListener:Lcom/momo/mcamera/mask/delegate/GameScoreListener;

    .line 2
    .line 3
    return-void
.end method

.method public startPlay()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/momo/mcamera/mask/StickerItem;->stickerStateChangeListener:Lcom/momo/mcamera/mask/StickerBlendFilter$StickerStateChangeListener;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Lcom/momo/mcamera/mask/StickerItem;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 6
    .line 7
    invoke-virtual {v0}, Lcom/momo/mcamera/mask/Sticker;->getSoundId()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-lez v0, :cond_0

    .line 12
    .line 13
    iget-object v0, p0, Lcom/momo/mcamera/mask/StickerItem;->stickerStateChangeListener:Lcom/momo/mcamera/mask/StickerBlendFilter$StickerStateChangeListener;

    .line 14
    .line 15
    iget-object p0, p0, Lcom/momo/mcamera/mask/StickerItem;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 16
    .line 17
    invoke-virtual {p0}, Lcom/momo/mcamera/mask/Sticker;->getSoundId()I

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    const/4 v1, 0x1

    .line 22
    invoke-interface {v0, p0, v1}, Lcom/momo/mcamera/mask/StickerBlendFilter$StickerStateChangeListener;->playStateChanged(IZ)V

    .line 23
    .line 24
    .line 25
    :cond_0
    return-void
.end method

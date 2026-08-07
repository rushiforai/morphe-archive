.class Lcom/momo/mcamera/mask/StickerAdjustFilter$10;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/momo/mcamera/mask/StickerBlendFilter$StickerStateChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/momo/mcamera/mask/StickerAdjustFilter;->multiStickerFilterAddListener(Lcom/momo/mcamera/mask/Sticker;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/momo/mcamera/mask/StickerAdjustFilter;

.field final synthetic val$sticker:Lcom/momo/mcamera/mask/Sticker;


# direct methods
.method public constructor <init>(Lcom/momo/mcamera/mask/StickerAdjustFilter;Lcom/momo/mcamera/mask/Sticker;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter$10;->this$0:Lcom/momo/mcamera/mask/StickerAdjustFilter;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter$10;->val$sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public distortionStateChanged(ZFFFF)V
    .locals 0

    return-void
.end method

.method public faceDetected(Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter$10;->this$0:Lcom/momo/mcamera/mask/StickerAdjustFilter;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/momo/mcamera/mask/StickerAdjustFilter;->access$900(Lcom/momo/mcamera/mask/StickerAdjustFilter;)Lcom/momo/mcamera/mask/StickerBlendFilter$StickerStateChangeListener;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter$10;->this$0:Lcom/momo/mcamera/mask/StickerAdjustFilter;

    .line 10
    .line 11
    invoke-static {p0}, Lcom/momo/mcamera/mask/StickerAdjustFilter;->access$900(Lcom/momo/mcamera/mask/StickerAdjustFilter;)Lcom/momo/mcamera/mask/StickerBlendFilter$StickerStateChangeListener;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-interface {p0, p1}, Lcom/momo/mcamera/mask/StickerBlendFilter$StickerStateChangeListener;->faceDetected(Z)V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public playStateChanged(IZ)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter$10;->this$0:Lcom/momo/mcamera/mask/StickerAdjustFilter;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/momo/mcamera/mask/StickerAdjustFilter;->access$1000(Lcom/momo/mcamera/mask/StickerAdjustFilter;)Landroid/media/SoundPool;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    if-eqz p2, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter$10;->this$0:Lcom/momo/mcamera/mask/StickerAdjustFilter;

    .line 12
    .line 13
    new-instance v1, Lcom/momo/mcamera/mask/StickerAdjustFilter$10$1;

    .line 14
    .line 15
    invoke-direct {v1, p0, p1}, Lcom/momo/mcamera/mask/StickerAdjustFilter$10$1;-><init>(Lcom/momo/mcamera/mask/StickerAdjustFilter$10;I)V

    .line 16
    .line 17
    .line 18
    invoke-static {v0, p1, v1}, Lcom/momo/mcamera/mask/StickerAdjustFilter;->access$1100(Lcom/momo/mcamera/mask/StickerAdjustFilter;ILjava/lang/Runnable;)V

    .line 19
    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    iget-object v0, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter$10;->val$sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 23
    .line 24
    invoke-virtual {v0}, Lcom/momo/mcamera/mask/Sticker;->getPlayingSoundId()I

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    if-lez v0, :cond_1

    .line 29
    .line 30
    iget-object v0, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter$10;->this$0:Lcom/momo/mcamera/mask/StickerAdjustFilter;

    .line 31
    .line 32
    invoke-static {v0}, Lcom/momo/mcamera/mask/StickerAdjustFilter;->access$1000(Lcom/momo/mcamera/mask/StickerAdjustFilter;)Landroid/media/SoundPool;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    iget-object v1, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter$10;->val$sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 37
    .line 38
    invoke-virtual {v1}, Lcom/momo/mcamera/mask/Sticker;->getPlayingSoundId()I

    .line 39
    .line 40
    .line 41
    move-result v1

    .line 42
    invoke-virtual {v0, v1}, Landroid/media/SoundPool;->pause(I)V

    .line 43
    .line 44
    .line 45
    :cond_1
    :goto_0
    iget-object p0, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter$10;->this$0:Lcom/momo/mcamera/mask/StickerAdjustFilter;

    .line 46
    .line 47
    invoke-static {p0}, Lcom/momo/mcamera/mask/StickerAdjustFilter;->access$900(Lcom/momo/mcamera/mask/StickerAdjustFilter;)Lcom/momo/mcamera/mask/StickerBlendFilter$StickerStateChangeListener;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    invoke-interface {p0, p1, p2}, Lcom/momo/mcamera/mask/StickerBlendFilter$StickerStateChangeListener;->playStateChanged(IZ)V

    .line 52
    .line 53
    .line 54
    return-void
.end method

.method public stickerGestureTypeChanged(Ljava/lang/String;Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter$10;->this$0:Lcom/momo/mcamera/mask/StickerAdjustFilter;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/momo/mcamera/mask/StickerAdjustFilter;->access$900(Lcom/momo/mcamera/mask/StickerAdjustFilter;)Lcom/momo/mcamera/mask/StickerBlendFilter$StickerStateChangeListener;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter$10;->this$0:Lcom/momo/mcamera/mask/StickerAdjustFilter;

    .line 10
    .line 11
    invoke-static {p0}, Lcom/momo/mcamera/mask/StickerAdjustFilter;->access$900(Lcom/momo/mcamera/mask/StickerAdjustFilter;)Lcom/momo/mcamera/mask/StickerBlendFilter$StickerStateChangeListener;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-interface {p0, p1, p2}, Lcom/momo/mcamera/mask/StickerBlendFilter$StickerStateChangeListener;->stickerGestureTypeChanged(Ljava/lang/String;Z)V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public stickerStateChanged(II)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter$10;->this$0:Lcom/momo/mcamera/mask/StickerAdjustFilter;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter$10;->val$sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 4
    .line 5
    invoke-static {v0, v1, p1, p2}, Lcom/momo/mcamera/mask/StickerAdjustFilter;->access$800(Lcom/momo/mcamera/mask/StickerAdjustFilter;Lcom/momo/mcamera/mask/Sticker;II)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter$10;->this$0:Lcom/momo/mcamera/mask/StickerAdjustFilter;

    .line 9
    .line 10
    invoke-static {v0}, Lcom/momo/mcamera/mask/StickerAdjustFilter;->access$900(Lcom/momo/mcamera/mask/StickerAdjustFilter;)Lcom/momo/mcamera/mask/StickerBlendFilter$StickerStateChangeListener;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    iget-object p0, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter$10;->this$0:Lcom/momo/mcamera/mask/StickerAdjustFilter;

    .line 17
    .line 18
    invoke-static {p0}, Lcom/momo/mcamera/mask/StickerAdjustFilter;->access$900(Lcom/momo/mcamera/mask/StickerAdjustFilter;)Lcom/momo/mcamera/mask/StickerBlendFilter$StickerStateChangeListener;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    invoke-interface {p0, p1, p2}, Lcom/momo/mcamera/mask/StickerBlendFilter$StickerStateChangeListener;->stickerStateChanged(II)V

    .line 23
    .line 24
    .line 25
    :cond_0
    return-void
.end method

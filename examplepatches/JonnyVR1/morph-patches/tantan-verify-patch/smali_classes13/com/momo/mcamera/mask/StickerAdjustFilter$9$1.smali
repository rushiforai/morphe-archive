.class Lcom/momo/mcamera/mask/StickerAdjustFilter$9$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/momo/mcamera/mask/StickerAdjustFilter$9;->playStateChanged(IZ)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/momo/mcamera/mask/StickerAdjustFilter$9;

.field final synthetic val$soundId:I


# direct methods
.method public constructor <init>(Lcom/momo/mcamera/mask/StickerAdjustFilter$9;I)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter$9$1;->this$1:Lcom/momo/mcamera/mask/StickerAdjustFilter$9;

    .line 2
    .line 3
    iput p2, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter$9$1;->val$soundId:I

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public run()V
    .locals 8

    .line 1
    const-string v0, "media"

    .line 2
    .line 3
    const-string v1, "[SoundPool] Start play sounds !"

    .line 4
    .line 5
    invoke-static {v0, v1}, Lcom/cosmos/mdlog/MDLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter$9$1;->this$1:Lcom/momo/mcamera/mask/StickerAdjustFilter$9;

    .line 9
    .line 10
    iget-object v0, v0, Lcom/momo/mcamera/mask/StickerAdjustFilter$9;->this$0:Lcom/momo/mcamera/mask/StickerAdjustFilter;

    .line 11
    .line 12
    invoke-static {v0}, Lcom/momo/mcamera/mask/StickerAdjustFilter;->access$1000(Lcom/momo/mcamera/mask/StickerAdjustFilter;)Landroid/media/SoundPool;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    iget v2, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter$9$1;->val$soundId:I

    .line 17
    .line 18
    iget-object v0, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter$9$1;->this$1:Lcom/momo/mcamera/mask/StickerAdjustFilter$9;

    .line 19
    .line 20
    iget-object v0, v0, Lcom/momo/mcamera/mask/StickerAdjustFilter$9;->val$sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 21
    .line 22
    invoke-virtual {v0}, Lcom/momo/mcamera/mask/Sticker;->isLoopSound()Z

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    if-eqz v0, :cond_0

    .line 27
    .line 28
    const/4 v0, -0x1

    .line 29
    :goto_0
    move v6, v0

    .line 30
    goto :goto_1

    .line 31
    :cond_0
    const/4 v0, 0x0

    .line 32
    goto :goto_0

    .line 33
    :goto_1
    const/high16 v7, 0x3f800000    # 1.0f

    .line 34
    .line 35
    const/high16 v3, 0x3f800000    # 1.0f

    .line 36
    .line 37
    const/high16 v4, 0x3f800000    # 1.0f

    .line 38
    .line 39
    const/4 v5, 0x0

    .line 40
    invoke-virtual/range {v1 .. v7}, Landroid/media/SoundPool;->play(IFFIIF)I

    .line 41
    .line 42
    .line 43
    move-result v0

    .line 44
    iget-object p0, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter$9$1;->this$1:Lcom/momo/mcamera/mask/StickerAdjustFilter$9;

    .line 45
    .line 46
    iget-object p0, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter$9;->val$sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 47
    .line 48
    invoke-virtual {p0, v0}, Lcom/momo/mcamera/mask/Sticker;->setPlayingSoundId(I)V

    .line 49
    .line 50
    .line 51
    return-void
.end method

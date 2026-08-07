.class Lcom/momo/mcamera/mask/MultiStickerMaskFilter$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/momo/mcamera/mask/StickerBlendFilter$StickerMaskFinishListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->addSticker(Lcom/momo/mcamera/mask/StickerItem;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/momo/mcamera/mask/MultiStickerMaskFilter;

.field final synthetic val$item:Lcom/momo/mcamera/mask/StickerItem;


# direct methods
.method public constructor <init>(Lcom/momo/mcamera/mask/MultiStickerMaskFilter;Lcom/momo/mcamera/mask/StickerItem;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/mcamera/mask/MultiStickerMaskFilter$1;->this$0:Lcom/momo/mcamera/mask/MultiStickerMaskFilter;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/momo/mcamera/mask/MultiStickerMaskFilter$1;->val$item:Lcom/momo/mcamera/mask/StickerItem;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public stickerRenderFinished()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/momo/mcamera/mask/MultiStickerMaskFilter$1;->this$0:Lcom/momo/mcamera/mask/MultiStickerMaskFilter;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/momo/mcamera/mask/MultiStickerMaskFilter$1;->val$item:Lcom/momo/mcamera/mask/StickerItem;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->removeStickerItem(Lcom/momo/mcamera/mask/StickerItem;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/momo/mcamera/mask/MultiStickerMaskFilter$1;->this$0:Lcom/momo/mcamera/mask/MultiStickerMaskFilter;

    .line 9
    .line 10
    iget-object v1, v0, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->finishListener:Lcom/momo/mcamera/mask/MultiStickerMaskFilter$StickerFinishListener;

    .line 11
    .line 12
    if-eqz v1, :cond_1

    .line 13
    .line 14
    iget-object v0, v0, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->stickerItemList:Ljava/util/List;

    .line 15
    .line 16
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    iget-object v1, p0, Lcom/momo/mcamera/mask/MultiStickerMaskFilter$1;->this$0:Lcom/momo/mcamera/mask/MultiStickerMaskFilter;

    .line 21
    .line 22
    iget-object v1, v1, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->stickerItemDestroyList:Ljava/util/List;

    .line 23
    .line 24
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 25
    .line 26
    .line 27
    move-result v1

    .line 28
    sub-int/2addr v0, v1

    .line 29
    iget-object v1, p0, Lcom/momo/mcamera/mask/MultiStickerMaskFilter$1;->this$0:Lcom/momo/mcamera/mask/MultiStickerMaskFilter;

    .line 30
    .line 31
    iget-object v1, v1, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->finishListener:Lcom/momo/mcamera/mask/MultiStickerMaskFilter$StickerFinishListener;

    .line 32
    .line 33
    if-lez v0, :cond_0

    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_0
    const/4 v0, 0x0

    .line 37
    :goto_0
    iget-object p0, p0, Lcom/momo/mcamera/mask/MultiStickerMaskFilter$1;->val$item:Lcom/momo/mcamera/mask/StickerItem;

    .line 38
    .line 39
    iget-object p0, p0, Lcom/momo/mcamera/mask/StickerItem;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 40
    .line 41
    invoke-interface {v1, v0, p0}, Lcom/momo/mcamera/mask/MultiStickerMaskFilter$StickerFinishListener;->stickerRenderFinished(ILcom/momo/mcamera/mask/Sticker;)V

    .line 42
    .line 43
    .line 44
    :cond_1
    return-void
.end method

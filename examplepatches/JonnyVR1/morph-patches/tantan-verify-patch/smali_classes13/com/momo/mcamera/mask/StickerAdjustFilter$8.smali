.class Lcom/momo/mcamera/mask/StickerAdjustFilter$8;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/momo/mcamera/mask/StickerBlendFilter$StickerMaskFinishListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/momo/mcamera/mask/StickerAdjustFilter;->addSticker(Lcom/momo/mcamera/mask/Sticker;)V
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
    iput-object p1, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter$8;->this$0:Lcom/momo/mcamera/mask/StickerAdjustFilter;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter$8;->val$sticker:Lcom/momo/mcamera/mask/Sticker;

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
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter$8;->this$0:Lcom/momo/mcamera/mask/StickerAdjustFilter;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter$8;->val$sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 4
    .line 5
    invoke-static {v0, p0}, Lcom/momo/mcamera/mask/StickerAdjustFilter;->access$700(Lcom/momo/mcamera/mask/StickerAdjustFilter;Lcom/momo/mcamera/mask/Sticker;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.class Lcom/momo/mcamera/mask/StickerAdjustFilter$11;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/momo/mcamera/mask/MultiStickerMaskFilter$StickerFinishListener;


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


# direct methods
.method public constructor <init>(Lcom/momo/mcamera/mask/StickerAdjustFilter;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter$11;->this$0:Lcom/momo/mcamera/mask/StickerAdjustFilter;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public stickerRenderFinished(ILcom/momo/mcamera/mask/Sticker;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter$11;->this$0:Lcom/momo/mcamera/mask/StickerAdjustFilter;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/momo/mcamera/mask/StickerAdjustFilter;->access$1200(Lcom/momo/mcamera/mask/StickerAdjustFilter;)Lcom/momo/mcamera/mask/StickerAdjustFilter$StickerMaskFinishListener;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter$11;->this$0:Lcom/momo/mcamera/mask/StickerAdjustFilter;

    .line 10
    .line 11
    iget-object v0, v0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mStickerFilterMap:Ljava/util/concurrent/ConcurrentHashMap;

    .line 12
    .line 13
    invoke-virtual {v0}, Ljava/util/concurrent/ConcurrentHashMap;->size()I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    add-int/2addr p1, v0

    .line 18
    iget-object v0, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter$11;->this$0:Lcom/momo/mcamera/mask/StickerAdjustFilter;

    .line 19
    .line 20
    invoke-static {v0}, Lcom/momo/mcamera/mask/StickerAdjustFilter;->access$1300(Lcom/momo/mcamera/mask/StickerAdjustFilter;)F

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    add-int/2addr p1, v0

    .line 29
    iget-object v0, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter$11;->this$0:Lcom/momo/mcamera/mask/StickerAdjustFilter;

    .line 30
    .line 31
    invoke-static {v0}, Lcom/momo/mcamera/mask/StickerAdjustFilter;->access$1400(Lcom/momo/mcamera/mask/StickerAdjustFilter;)F

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    add-int/2addr p1, v0

    .line 40
    iget-object p0, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter$11;->this$0:Lcom/momo/mcamera/mask/StickerAdjustFilter;

    .line 41
    .line 42
    invoke-static {p0}, Lcom/momo/mcamera/mask/StickerAdjustFilter;->access$1200(Lcom/momo/mcamera/mask/StickerAdjustFilter;)Lcom/momo/mcamera/mask/StickerAdjustFilter$StickerMaskFinishListener;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    invoke-interface {p0, p1, p2}, Lcom/momo/mcamera/mask/StickerAdjustFilter$StickerMaskFinishListener;->stickerRenderFinished(ILcom/momo/mcamera/mask/Sticker;)V

    .line 47
    .line 48
    .line 49
    :cond_0
    return-void
.end method

.class Lcom/momo/mcamera/mask/StickerAdjustFilter$5;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/momo/mcamera/mask/EffectGroupFilter$EffectRenderFinishListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/momo/mcamera/mask/StickerAdjustFilter;->addEffectProcessFilter(Lcom/momo/mcamera/mask/MaskModel;)V
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
    iput-object p1, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter$5;->this$0:Lcom/momo/mcamera/mask/StickerAdjustFilter;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onRenderFinish()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter$5;->this$0:Lcom/momo/mcamera/mask/StickerAdjustFilter;

    .line 2
    .line 3
    iget-object v1, v0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mEffectGroupFilter:Lcom/momo/mcamera/mask/EffectGroupFilter;

    .line 4
    .line 5
    invoke-static {v0, v1}, Lcom/momo/mcamera/mask/StickerAdjustFilter;->access$500(Lcom/momo/mcamera/mask/StickerAdjustFilter;Ll/jt2;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter$5;->this$0:Lcom/momo/mcamera/mask/StickerAdjustFilter;

    .line 9
    .line 10
    invoke-static {v0}, Lcom/momo/mcamera/mask/StickerAdjustFilter;->access$600(Lcom/momo/mcamera/mask/StickerAdjustFilter;)Ljava/util/List;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    iget-object v1, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter$5;->this$0:Lcom/momo/mcamera/mask/StickerAdjustFilter;

    .line 15
    .line 16
    iget-object v1, v1, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mEffectGroupFilter:Lcom/momo/mcamera/mask/EffectGroupFilter;

    .line 17
    .line 18
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 19
    .line 20
    .line 21
    iget-object p0, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter$5;->this$0:Lcom/momo/mcamera/mask/StickerAdjustFilter;

    .line 22
    .line 23
    const/4 v0, 0x0

    .line 24
    iput-object v0, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mEffectGroupFilter:Lcom/momo/mcamera/mask/EffectGroupFilter;

    .line 25
    .line 26
    return-void
.end method

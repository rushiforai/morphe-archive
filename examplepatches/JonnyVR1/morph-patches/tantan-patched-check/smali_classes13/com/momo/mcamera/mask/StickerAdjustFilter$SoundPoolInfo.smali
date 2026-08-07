.class Lcom/momo/mcamera/mask/StickerAdjustFilter$SoundPoolInfo;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/momo/mcamera/mask/StickerAdjustFilter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "SoundPoolInfo"
.end annotation


# instance fields
.field isLoaded:Z

.field runnable:Ljava/lang/Runnable;

.field soundId:I

.field final synthetic this$0:Lcom/momo/mcamera/mask/StickerAdjustFilter;


# direct methods
.method public constructor <init>(Lcom/momo/mcamera/mask/StickerAdjustFilter;)V
    .locals 1

    .line 1
    iput-object p1, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter$SoundPoolInfo;->this$0:Lcom/momo/mcamera/mask/StickerAdjustFilter;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 p1, 0x0

    .line 7
    iput-boolean p1, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter$SoundPoolInfo;->isLoaded:Z

    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    iput-object v0, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter$SoundPoolInfo;->runnable:Ljava/lang/Runnable;

    .line 11
    .line 12
    iput p1, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter$SoundPoolInfo;->soundId:I

    .line 13
    .line 14
    return-void
.end method

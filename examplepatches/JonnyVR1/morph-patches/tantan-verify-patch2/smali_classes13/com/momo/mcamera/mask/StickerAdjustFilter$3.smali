.class Lcom/momo/mcamera/mask/StickerAdjustFilter$3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/media/MediaPlayer$OnPreparedListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/momo/mcamera/mask/StickerAdjustFilter;->addMaskModel(Lcom/momo/mcamera/mask/MaskModel;)V
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
    iput-object p1, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter$3;->this$0:Lcom/momo/mcamera/mask/StickerAdjustFilter;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onPrepared(Landroid/media/MediaPlayer;)V
    .locals 1

    .line 1
    const-string p0, "FilterProcess"

    .line 2
    .line 3
    const-string v0, "Audio Player onPrepared"

    .line 4
    .line 5
    invoke-static {p0, v0}, Lcom/cosmos/mdlog/MDLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    const/4 p0, 0x1

    .line 9
    invoke-virtual {p1, p0}, Landroid/media/MediaPlayer;->setLooping(Z)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p1}, Landroid/media/MediaPlayer;->start()V

    .line 13
    .line 14
    .line 15
    return-void
.end method

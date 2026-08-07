.class public Lcom/momo/mcamera/mask/StickerFixItem;
.super Lcom/momo/mcamera/mask/StickerItem;
.source "SourceFile"


# static fields
.field public static final FIX_STICKER_TYPE_ICON:Ljava/lang/String; = "FIX_STICKER_TYPE_ICON"

.field public static final FIX_STICKER_TYPE_SCORE:Ljava/lang/String; = "FIX_STICKER_TYPE_SCORE"


# instance fields
.field private curBitmap:Landroid/graphics/Bitmap;

.field public fixStickerType:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/momo/mcamera/mask/Sticker;Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/momo/mcamera/mask/StickerItem;-><init>(Lcom/momo/mcamera/mask/Sticker;Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x1

    .line 5
    iput-boolean p1, p0, Lcom/momo/mcamera/mask/StickerItem;->isDraw:Z

    .line 6
    .line 7
    return-void
.end method


# virtual methods
.method public declared-synchronized getBitmap()Landroid/graphics/Bitmap;
    .locals 1

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Lcom/momo/mcamera/mask/StickerFixItem;->curBitmap:Landroid/graphics/Bitmap;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 3
    .line 4
    monitor-exit p0

    .line 5
    return-object v0

    .line 6
    :catchall_0
    move-exception v0

    .line 7
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 8
    throw v0
.end method

.method public declared-synchronized setBitmap(Landroid/graphics/Bitmap;)V
    .locals 0

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iput-object p1, p0, Lcom/momo/mcamera/mask/StickerFixItem;->curBitmap:Landroid/graphics/Bitmap;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 3
    .line 4
    monitor-exit p0

    .line 5
    return-void

    .line 6
    :catchall_0
    move-exception p1

    .line 7
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 8
    throw p1
.end method

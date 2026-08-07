.class public Lcom/immomo/moment/mask/bean/StickerFrame;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/io/Serializable;


# instance fields
.field public data_len:I

.field public data_ptr:[B

.field public format:I

.field public height:I

.field public step:I

.field public width:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Lcom/immomo/moment/mask/bean/StickerFrame;->width:I

    .line 6
    .line 7
    iput v0, p0, Lcom/immomo/moment/mask/bean/StickerFrame;->height:I

    .line 8
    .line 9
    iput v0, p0, Lcom/immomo/moment/mask/bean/StickerFrame;->step:I

    .line 10
    .line 11
    iput v0, p0, Lcom/immomo/moment/mask/bean/StickerFrame;->format:I

    .line 12
    .line 13
    iput v0, p0, Lcom/immomo/moment/mask/bean/StickerFrame;->data_len:I

    .line 14
    .line 15
    const/4 v0, 0x0

    .line 16
    iput-object v0, p0, Lcom/immomo/moment/mask/bean/StickerFrame;->data_ptr:[B

    .line 17
    .line 18
    return-void
.end method

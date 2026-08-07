.class public Lcom/momo/mcamera/mask/Sticker$VideoFileConfig;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/momo/mcamera/mask/Sticker;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "VideoFileConfig"
.end annotation


# static fields
.field public static final OUTPUT_DEFAULT:I = 0x0

.field public static final OUTPUT_VIDEO:I = 0x1


# instance fields
.field private faceData:[[F

.field private frameRate:I

.field private frameRateToPlay:I

.field private maskBorder:Landroid/graphics/RectF;

.field private maskImage:Ljava/lang/String;

.field private timeStamp:[F

.field private type:I

.field private video:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/16 v0, 0xf

    .line 5
    .line 6
    iput v0, p0, Lcom/momo/mcamera/mask/Sticker$VideoFileConfig;->frameRate:I

    .line 7
    .line 8
    iput v0, p0, Lcom/momo/mcamera/mask/Sticker$VideoFileConfig;->frameRateToPlay:I

    .line 9
    .line 10
    const/4 v0, 0x0

    .line 11
    iput v0, p0, Lcom/momo/mcamera/mask/Sticker$VideoFileConfig;->type:I

    .line 12
    .line 13
    return-void
.end method


# virtual methods
.method public getFaceData()[[F
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/mask/Sticker$VideoFileConfig;->faceData:[[F

    .line 2
    .line 3
    return-object p0
.end method

.method public getFrameRate()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/mcamera/mask/Sticker$VideoFileConfig;->frameRate:I

    .line 2
    .line 3
    return p0
.end method

.method public getFrameRateToPlay()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/mcamera/mask/Sticker$VideoFileConfig;->frameRateToPlay:I

    .line 2
    .line 3
    return p0
.end method

.method public getMaskBorder()Landroid/graphics/RectF;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/mask/Sticker$VideoFileConfig;->maskBorder:Landroid/graphics/RectF;

    .line 2
    .line 3
    return-object p0
.end method

.method public getMaskImage()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/mask/Sticker$VideoFileConfig;->maskImage:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getTimeStamp()[F
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/mask/Sticker$VideoFileConfig;->timeStamp:[F

    .line 2
    .line 3
    return-object p0
.end method

.method public getType()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/mcamera/mask/Sticker$VideoFileConfig;->type:I

    .line 2
    .line 3
    return p0
.end method

.method public getVideo()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/mask/Sticker$VideoFileConfig;->video:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public setFaceData([[F)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/mcamera/mask/Sticker$VideoFileConfig;->faceData:[[F

    .line 2
    .line 3
    return-void
.end method

.method public setFrameRate(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/momo/mcamera/mask/Sticker$VideoFileConfig;->frameRate:I

    .line 2
    .line 3
    return-void
.end method

.method public setFrameRateToPlay(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/momo/mcamera/mask/Sticker$VideoFileConfig;->frameRateToPlay:I

    .line 2
    .line 3
    return-void
.end method

.method public setMaskBorder(Landroid/graphics/RectF;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/mcamera/mask/Sticker$VideoFileConfig;->maskBorder:Landroid/graphics/RectF;

    .line 2
    .line 3
    return-void
.end method

.method public setMaskImage(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/mcamera/mask/Sticker$VideoFileConfig;->maskImage:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setTimeStamp([F)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/mcamera/mask/Sticker$VideoFileConfig;->timeStamp:[F

    .line 2
    .line 3
    return-void
.end method

.method public setType(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/momo/mcamera/mask/Sticker$VideoFileConfig;->type:I

    .line 2
    .line 3
    return-void
.end method

.method public setVideo(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/mcamera/mask/Sticker$VideoFileConfig;->video:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.class public Lcom/effectsar/labcv/effectsdk/BefChromaKeyingInfo;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private color_b:B

.field private color_g:B

.field private color_r:B

.field private height:I

.field private mask:[B

.field private outputTexture:I

.field private width:I


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public getColor_b()B
    .locals 0

    .line 1
    iget-byte p0, p0, Lcom/effectsar/labcv/effectsdk/BefChromaKeyingInfo;->color_b:B

    .line 2
    .line 3
    return p0
.end method

.method public getColor_g()B
    .locals 0

    .line 1
    iget-byte p0, p0, Lcom/effectsar/labcv/effectsdk/BefChromaKeyingInfo;->color_g:B

    .line 2
    .line 3
    return p0
.end method

.method public getColor_r()B
    .locals 0

    .line 1
    iget-byte p0, p0, Lcom/effectsar/labcv/effectsdk/BefChromaKeyingInfo;->color_r:B

    .line 2
    .line 3
    return p0
.end method

.method public getHeight()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/effectsar/labcv/effectsdk/BefChromaKeyingInfo;->height:I

    .line 2
    .line 3
    return p0
.end method

.method public getMask()[B
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/effectsar/labcv/effectsdk/BefChromaKeyingInfo;->mask:[B

    .line 2
    .line 3
    return-object p0
.end method

.method public getOutputTexture()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/effectsar/labcv/effectsdk/BefChromaKeyingInfo;->outputTexture:I

    .line 2
    .line 3
    return p0
.end method

.method public getWidth()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/effectsar/labcv/effectsdk/BefChromaKeyingInfo;->width:I

    .line 2
    .line 3
    return p0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/effectsar/labcv/effectsdk/BefChromaKeyingInfo;->mask:[B

    .line 2
    .line 3
    array-length v0, v0

    .line 4
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iget v1, p0, Lcom/effectsar/labcv/effectsdk/BefChromaKeyingInfo;->width:I

    .line 9
    .line 10
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    iget p0, p0, Lcom/effectsar/labcv/effectsdk/BefChromaKeyingInfo;->height:I

    .line 15
    .line 16
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    filled-new-array {v0, v1, p0}, [Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    const-string v0, "l: %d w:%d, h:%d"

    .line 25
    .line 26
    invoke-static {v0, p0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    return-object p0
.end method

.class public Lcom/idv/identity/ocr/compress/CompressConfig;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/io/Serializable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/idv/identity/ocr/compress/CompressConfig$b;
    }
.end annotation


# instance fields
.field private enablePixelCompress:Z

.field private enableQualityCompress:Z

.field private enableReserveRaw:Z

.field private maxPixel:I

.field private maxSize:I


# direct methods
.method private constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/16 v0, 0x4b0

    .line 5
    .line 6
    iput v0, p0, Lcom/idv/identity/ocr/compress/CompressConfig;->maxPixel:I

    .line 7
    .line 8
    const v0, 0x19000

    .line 9
    .line 10
    .line 11
    iput v0, p0, Lcom/idv/identity/ocr/compress/CompressConfig;->maxSize:I

    .line 12
    .line 13
    const/4 v0, 0x1

    .line 14
    iput-boolean v0, p0, Lcom/idv/identity/ocr/compress/CompressConfig;->enablePixelCompress:Z

    .line 15
    .line 16
    iput-boolean v0, p0, Lcom/idv/identity/ocr/compress/CompressConfig;->enableQualityCompress:Z

    .line 17
    .line 18
    iput-boolean v0, p0, Lcom/idv/identity/ocr/compress/CompressConfig;->enableReserveRaw:Z

    .line 19
    .line 20
    return-void
.end method

.method public synthetic constructor <init>(Lcom/idv/identity/ocr/compress/CompressConfig$a;)V
    .locals 0

    .line 21
    invoke-direct {p0}, Lcom/idv/identity/ocr/compress/CompressConfig;-><init>()V

    return-void
.end method

.method public static ofDefaultConfig()Lcom/idv/identity/ocr/compress/CompressConfig;
    .locals 1

    .line 1
    new-instance v0, Lcom/idv/identity/ocr/compress/CompressConfig;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/idv/identity/ocr/compress/CompressConfig;-><init>()V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method


# virtual methods
.method public enablePixelCompress(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/idv/identity/ocr/compress/CompressConfig;->enablePixelCompress:Z

    .line 2
    .line 3
    return-void
.end method

.method public enableQualityCompress(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/idv/identity/ocr/compress/CompressConfig;->enableQualityCompress:Z

    .line 2
    .line 3
    return-void
.end method

.method public enableReserveRaw(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/idv/identity/ocr/compress/CompressConfig;->enableReserveRaw:Z

    .line 2
    .line 3
    return-void
.end method

.method public getMaxPixel()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/idv/identity/ocr/compress/CompressConfig;->maxPixel:I

    .line 2
    .line 3
    return p0
.end method

.method public getMaxSize()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/idv/identity/ocr/compress/CompressConfig;->maxSize:I

    .line 2
    .line 3
    return p0
.end method

.method public isEnablePixelCompress()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/idv/identity/ocr/compress/CompressConfig;->enablePixelCompress:Z

    .line 2
    .line 3
    return p0
.end method

.method public isEnableQualityCompress()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/idv/identity/ocr/compress/CompressConfig;->enableQualityCompress:Z

    .line 2
    .line 3
    return p0
.end method

.method public isEnableReserveRaw()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/idv/identity/ocr/compress/CompressConfig;->enableReserveRaw:Z

    .line 2
    .line 3
    return p0
.end method

.method public setMaxPixel(I)Lcom/idv/identity/ocr/compress/CompressConfig;
    .locals 0

    .line 1
    iput p1, p0, Lcom/idv/identity/ocr/compress/CompressConfig;->maxPixel:I

    .line 2
    .line 3
    return-object p0
.end method

.method public setMaxSize(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/idv/identity/ocr/compress/CompressConfig;->maxSize:I

    .line 2
    .line 3
    return-void
.end method

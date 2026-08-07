.class public Lcom/momo/xengine/media/DecodeConfig;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private height:I

.field private path:Ljava/lang/String;

.field private scale_format:Lcom/momo/xengine/media/types/PixelFormat;

.field private width:I


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
    iput v0, p0, Lcom/momo/xengine/media/DecodeConfig;->width:I

    .line 6
    .line 7
    iput v0, p0, Lcom/momo/xengine/media/DecodeConfig;->height:I

    .line 8
    .line 9
    sget-object v0, Lcom/momo/xengine/media/types/PixelFormat;->VIDEO_FORMAT_BGRA:Lcom/momo/xengine/media/types/PixelFormat;

    .line 10
    .line 11
    iput-object v0, p0, Lcom/momo/xengine/media/DecodeConfig;->scale_format:Lcom/momo/xengine/media/types/PixelFormat;

    .line 12
    .line 13
    return-void
.end method


# virtual methods
.method public getHeight()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/xengine/media/DecodeConfig;->height:I

    .line 2
    .line 3
    return p0
.end method

.method public getPath()Ljava/lang/String;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/momo/xengine/media/DecodeConfig;->path:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getScale_format()Lcom/momo/xengine/media/types/PixelFormat;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/xengine/media/DecodeConfig;->scale_format:Lcom/momo/xengine/media/types/PixelFormat;

    .line 2
    .line 3
    return-object p0
.end method

.method public getWidth()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/xengine/media/DecodeConfig;->width:I

    .line 2
    .line 3
    return p0
.end method

.method public setHeight(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/momo/xengine/media/DecodeConfig;->height:I

    .line 2
    .line 3
    return-void
.end method

.method public setPath(Ljava/lang/String;)V
    .locals 0
    .param p1    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    iput-object p1, p0, Lcom/momo/xengine/media/DecodeConfig;->path:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setScale_format(Lcom/momo/xengine/media/types/PixelFormat;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/xengine/media/DecodeConfig;->scale_format:Lcom/momo/xengine/media/types/PixelFormat;

    .line 2
    .line 3
    return-void
.end method

.method public setWidth(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/momo/xengine/media/DecodeConfig;->width:I

    .line 2
    .line 3
    return-void
.end method

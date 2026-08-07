.class public Lcom/tantanapp/media/ttmediaeffect/anim/AnimEntity;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private mAnimSize:Lcom/tantanapp/media/ttmediaeffect/anim/AnimRect;

.field private mFps:I

.field private mFrames:I

.field private mImages:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Landroid/graphics/Bitmap;",
            ">;"
        }
    .end annotation
.end field


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

.method public static fromMomoEntity(Lcom/immomo/svgaplayer/SVGAVideoEntity;)Lcom/tantanapp/media/ttmediaeffect/anim/AnimEntity;
    .locals 2

    .line 1
    new-instance v0, Lcom/tantanapp/media/ttmediaeffect/anim/AnimEntity;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/tantanapp/media/ttmediaeffect/anim/AnimEntity;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/immomo/svgaplayer/SVGAVideoEntity;->getFPS()I

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    iput v1, v0, Lcom/tantanapp/media/ttmediaeffect/anim/AnimEntity;->mFps:I

    .line 11
    .line 12
    invoke-virtual {p0}, Lcom/immomo/svgaplayer/SVGAVideoEntity;->getFrames()I

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    iput v1, v0, Lcom/tantanapp/media/ttmediaeffect/anim/AnimEntity;->mFrames:I

    .line 17
    .line 18
    invoke-virtual {p0}, Lcom/immomo/svgaplayer/SVGAVideoEntity;->getImages()Ljava/util/HashMap;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    iput-object v1, v0, Lcom/tantanapp/media/ttmediaeffect/anim/AnimEntity;->mImages:Ljava/util/HashMap;

    .line 23
    .line 24
    invoke-virtual {p0}, Lcom/immomo/svgaplayer/SVGAVideoEntity;->getVideoSize()Lcom/immomo/svgaplayer/SVGARect;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    invoke-static {p0}, Lcom/tantanapp/media/ttmediaeffect/anim/AnimRect;->fromMomoRect(Lcom/immomo/svgaplayer/SVGARect;)Lcom/tantanapp/media/ttmediaeffect/anim/AnimRect;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    iput-object p0, v0, Lcom/tantanapp/media/ttmediaeffect/anim/AnimEntity;->mAnimSize:Lcom/tantanapp/media/ttmediaeffect/anim/AnimRect;

    .line 33
    .line 34
    return-object v0
.end method


# virtual methods
.method public getAnimSize()Lcom/tantanapp/media/ttmediaeffect/anim/AnimRect;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/media/ttmediaeffect/anim/AnimEntity;->mAnimSize:Lcom/tantanapp/media/ttmediaeffect/anim/AnimRect;

    .line 2
    .line 3
    return-object p0
.end method

.method public getFps()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/tantanapp/media/ttmediaeffect/anim/AnimEntity;->mFps:I

    .line 2
    .line 3
    return p0
.end method

.method public getFrames()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/tantanapp/media/ttmediaeffect/anim/AnimEntity;->mFrames:I

    .line 2
    .line 3
    return p0
.end method

.method public getImages()Ljava/util/HashMap;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Landroid/graphics/Bitmap;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/tantanapp/media/ttmediaeffect/anim/AnimEntity;->mImages:Ljava/util/HashMap;

    .line 2
    .line 3
    return-object p0
.end method

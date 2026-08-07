.class public Lcom/tantanapp/media/ttmediaeffect/anim/AnimRect;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private mHeight:D

.field private mWidth:D

.field private mX:D

.field private mY:D


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

.method public static fromMomoRect(Lcom/immomo/svgaplayer/SVGARect;)Lcom/tantanapp/media/ttmediaeffect/anim/AnimRect;
    .locals 3

    .line 1
    new-instance v0, Lcom/tantanapp/media/ttmediaeffect/anim/AnimRect;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/tantanapp/media/ttmediaeffect/anim/AnimRect;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/immomo/svgaplayer/SVGARect;->getX()D

    .line 7
    .line 8
    .line 9
    move-result-wide v1

    .line 10
    iput-wide v1, v0, Lcom/tantanapp/media/ttmediaeffect/anim/AnimRect;->mX:D

    .line 11
    .line 12
    invoke-virtual {p0}, Lcom/immomo/svgaplayer/SVGARect;->getY()D

    .line 13
    .line 14
    .line 15
    move-result-wide v1

    .line 16
    iput-wide v1, v0, Lcom/tantanapp/media/ttmediaeffect/anim/AnimRect;->mY:D

    .line 17
    .line 18
    invoke-virtual {p0}, Lcom/immomo/svgaplayer/SVGARect;->getWidth()D

    .line 19
    .line 20
    .line 21
    move-result-wide v1

    .line 22
    iput-wide v1, v0, Lcom/tantanapp/media/ttmediaeffect/anim/AnimRect;->mWidth:D

    .line 23
    .line 24
    invoke-virtual {p0}, Lcom/immomo/svgaplayer/SVGARect;->getHeight()D

    .line 25
    .line 26
    .line 27
    move-result-wide v1

    .line 28
    iput-wide v1, v0, Lcom/tantanapp/media/ttmediaeffect/anim/AnimRect;->mHeight:D

    .line 29
    .line 30
    return-object v0
.end method

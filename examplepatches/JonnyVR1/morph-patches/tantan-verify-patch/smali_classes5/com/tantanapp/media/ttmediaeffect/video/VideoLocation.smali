.class public Lcom/tantanapp/media/ttmediaeffect/video/VideoLocation;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private mAnchor:Ljava/lang/String;

.field private mWh:F

.field private mWidth:F

.field private mX:F

.field private mY:F


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

.method public static toMomoLocation(Lcom/tantanapp/media/ttmediaeffect/video/VideoLocation;)Lcom/immomo/velib/anim/model/Location;
    .locals 2

    .line 1
    new-instance v0, Lcom/immomo/velib/anim/model/Location;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/immomo/velib/anim/model/Location;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/tantanapp/media/ttmediaeffect/video/VideoLocation;->getAnchor()Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    invoke-virtual {v0, v1}, Lcom/immomo/velib/anim/model/Location;->setAnchor(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/tantanapp/media/ttmediaeffect/video/VideoLocation;->getWh()F

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    invoke-virtual {v0, v1}, Lcom/immomo/velib/anim/model/Location;->setWh(F)V

    .line 18
    .line 19
    .line 20
    iget v1, p0, Lcom/tantanapp/media/ttmediaeffect/video/VideoLocation;->mWidth:F

    .line 21
    .line 22
    invoke-virtual {v0, v1}, Lcom/immomo/velib/anim/model/Location;->setWh(F)V

    .line 23
    .line 24
    .line 25
    iget v1, p0, Lcom/tantanapp/media/ttmediaeffect/video/VideoLocation;->mX:F

    .line 26
    .line 27
    invoke-virtual {v0, v1}, Lcom/immomo/velib/anim/model/Location;->setX(F)V

    .line 28
    .line 29
    .line 30
    iget p0, p0, Lcom/tantanapp/media/ttmediaeffect/video/VideoLocation;->mY:F

    .line 31
    .line 32
    invoke-virtual {v0, p0}, Lcom/immomo/velib/anim/model/Location;->setY(F)V

    .line 33
    .line 34
    .line 35
    return-object v0
.end method


# virtual methods
.method public getAnchor()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/media/ttmediaeffect/video/VideoLocation;->mAnchor:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getWh()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/tantanapp/media/ttmediaeffect/video/VideoLocation;->mWh:F

    .line 2
    .line 3
    return p0
.end method

.method public getWidth()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/tantanapp/media/ttmediaeffect/video/VideoLocation;->mWidth:F

    .line 2
    .line 3
    return p0
.end method

.method public getX()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/tantanapp/media/ttmediaeffect/video/VideoLocation;->mX:F

    .line 2
    .line 3
    return p0
.end method

.method public getY()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/tantanapp/media/ttmediaeffect/video/VideoLocation;->mY:F

    .line 2
    .line 3
    return p0
.end method

.method public setAnchor(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tantanapp/media/ttmediaeffect/video/VideoLocation;->mAnchor:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setWh(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/tantanapp/media/ttmediaeffect/video/VideoLocation;->mWh:F

    .line 2
    .line 3
    return-void
.end method

.method public setWidth(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/tantanapp/media/ttmediaeffect/video/VideoLocation;->mWidth:F

    .line 2
    .line 3
    return-void
.end method

.method public setX(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/tantanapp/media/ttmediaeffect/video/VideoLocation;->mX:F

    .line 2
    .line 3
    return-void
.end method

.method public setY(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/tantanapp/media/ttmediaeffect/video/VideoLocation;->mY:F

    .line 2
    .line 3
    return-void
.end method

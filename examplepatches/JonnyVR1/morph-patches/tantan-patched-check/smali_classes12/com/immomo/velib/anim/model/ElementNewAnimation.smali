.class public Lcom/immomo/velib/anim/model/ElementNewAnimation;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private alpha:F

.field private degress:F

.field private duration:J

.field private interpolator:Ljava/lang/String;

.field private points:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/immomo/velib/anim/model/PointSet;",
            ">;"
        }
    .end annotation
.end field

.field private scale:F

.field private startDelay:J

.field private toAlpha:F

.field private toDegress:F

.field private toScale:F

.field private toX:F

.field private toY:F

.field private type:Ljava/lang/String;

.field private x:F

.field private y:F


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
.method public getAlpha()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/immomo/velib/anim/model/ElementNewAnimation;->alpha:F

    .line 2
    .line 3
    return p0
.end method

.method public getDegress()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/immomo/velib/anim/model/ElementNewAnimation;->degress:F

    .line 2
    .line 3
    return p0
.end method

.method public getDuration()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/immomo/velib/anim/model/ElementNewAnimation;->duration:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public getInterpolator()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/velib/anim/model/ElementNewAnimation;->interpolator:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getPoints()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/immomo/velib/anim/model/PointSet;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/immomo/velib/anim/model/ElementNewAnimation;->points:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method

.method public getScale()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/immomo/velib/anim/model/ElementNewAnimation;->scale:F

    .line 2
    .line 3
    return p0
.end method

.method public getStartDelay()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/immomo/velib/anim/model/ElementNewAnimation;->startDelay:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public getToAlpha()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/immomo/velib/anim/model/ElementNewAnimation;->toAlpha:F

    .line 2
    .line 3
    return p0
.end method

.method public getToDegress()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/immomo/velib/anim/model/ElementNewAnimation;->toDegress:F

    .line 2
    .line 3
    return p0
.end method

.method public getToScale()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/immomo/velib/anim/model/ElementNewAnimation;->toScale:F

    .line 2
    .line 3
    return p0
.end method

.method public getToX()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/immomo/velib/anim/model/ElementNewAnimation;->toX:F

    .line 2
    .line 3
    return p0
.end method

.method public getToY()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/immomo/velib/anim/model/ElementNewAnimation;->toY:F

    .line 2
    .line 3
    return p0
.end method

.method public getType()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/velib/anim/model/ElementNewAnimation;->type:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getX()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/immomo/velib/anim/model/ElementNewAnimation;->x:F

    .line 2
    .line 3
    return p0
.end method

.method public getY()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/immomo/velib/anim/model/ElementNewAnimation;->y:F

    .line 2
    .line 3
    return p0
.end method

.method public setAlpha(F)Lcom/immomo/velib/anim/model/ElementNewAnimation;
    .locals 0

    .line 1
    iput p1, p0, Lcom/immomo/velib/anim/model/ElementNewAnimation;->alpha:F

    .line 2
    .line 3
    return-object p0
.end method

.method public setDegress(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/immomo/velib/anim/model/ElementNewAnimation;->degress:F

    .line 2
    .line 3
    return-void
.end method

.method public setDuration(J)Lcom/immomo/velib/anim/model/ElementNewAnimation;
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/immomo/velib/anim/model/ElementNewAnimation;->duration:J

    .line 2
    .line 3
    return-object p0
.end method

.method public setInterpolator(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/velib/anim/model/ElementNewAnimation;->interpolator:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setPoints(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/immomo/velib/anim/model/PointSet;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/immomo/velib/anim/model/ElementNewAnimation;->points:Ljava/util/List;

    .line 2
    .line 3
    return-void
.end method

.method public setScale(F)Lcom/immomo/velib/anim/model/ElementNewAnimation;
    .locals 0

    .line 1
    iput p1, p0, Lcom/immomo/velib/anim/model/ElementNewAnimation;->scale:F

    .line 2
    .line 3
    return-object p0
.end method

.method public setStartDelay(J)Lcom/immomo/velib/anim/model/ElementNewAnimation;
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/immomo/velib/anim/model/ElementNewAnimation;->startDelay:J

    .line 2
    .line 3
    return-object p0
.end method

.method public setToAlpha(F)Lcom/immomo/velib/anim/model/ElementNewAnimation;
    .locals 0

    .line 1
    iput p1, p0, Lcom/immomo/velib/anim/model/ElementNewAnimation;->toAlpha:F

    .line 2
    .line 3
    return-object p0
.end method

.method public setToDegress(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/immomo/velib/anim/model/ElementNewAnimation;->toDegress:F

    .line 2
    .line 3
    return-void
.end method

.method public setToScale(F)Lcom/immomo/velib/anim/model/ElementNewAnimation;
    .locals 0

    .line 1
    iput p1, p0, Lcom/immomo/velib/anim/model/ElementNewAnimation;->toScale:F

    .line 2
    .line 3
    return-object p0
.end method

.method public setToX(F)Lcom/immomo/velib/anim/model/ElementNewAnimation;
    .locals 0

    .line 1
    iput p1, p0, Lcom/immomo/velib/anim/model/ElementNewAnimation;->toX:F

    .line 2
    .line 3
    return-object p0
.end method

.method public setToY(F)Lcom/immomo/velib/anim/model/ElementNewAnimation;
    .locals 0

    .line 1
    iput p1, p0, Lcom/immomo/velib/anim/model/ElementNewAnimation;->toY:F

    .line 2
    .line 3
    return-object p0
.end method

.method public setType(Ljava/lang/String;)Lcom/immomo/velib/anim/model/ElementNewAnimation;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/velib/anim/model/ElementNewAnimation;->type:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public setX(F)Lcom/immomo/velib/anim/model/ElementNewAnimation;
    .locals 0

    .line 1
    iput p1, p0, Lcom/immomo/velib/anim/model/ElementNewAnimation;->x:F

    .line 2
    .line 3
    return-object p0
.end method

.method public setY(F)Lcom/immomo/velib/anim/model/ElementNewAnimation;
    .locals 0

    .line 1
    iput p1, p0, Lcom/immomo/velib/anim/model/ElementNewAnimation;->y:F

    .line 2
    .line 3
    return-object p0
.end method

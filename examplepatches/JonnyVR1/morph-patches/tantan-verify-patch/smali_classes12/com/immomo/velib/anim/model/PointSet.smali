.class public Lcom/immomo/velib/anim/model/PointSet;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private interpolator:Ljava/lang/String;

.field private point:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/Float;",
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


# virtual methods
.method public getInterpolator()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/velib/anim/model/PointSet;->interpolator:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getPoint()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/Float;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/immomo/velib/anim/model/PointSet;->point:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method

.method public setInterpolator(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/velib/anim/model/PointSet;->interpolator:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setPoint(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/Float;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/immomo/velib/anim/model/PointSet;->point:Ljava/util/List;

    .line 2
    .line 3
    return-void
.end method

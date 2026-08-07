.class public Lcom/ss/bytertc/engine/data/PositionInfo;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public orientation:Lcom/ss/bytertc/engine/data/HumanOrientation;

.field public position:Lcom/ss/bytertc/engine/data/Position;


# direct methods
.method public constructor <init>(Lcom/ss/bytertc/engine/data/Position;Lcom/ss/bytertc/engine/data/HumanOrientation;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/ss/bytertc/engine/data/PositionInfo;->position:Lcom/ss/bytertc/engine/data/Position;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/ss/bytertc/engine/data/PositionInfo;->orientation:Lcom/ss/bytertc/engine/data/HumanOrientation;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public getFieldOrientationForwardX()F
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/engine/data/PositionInfo;->orientation:Lcom/ss/bytertc/engine/data/HumanOrientation;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/ss/bytertc/engine/data/HumanOrientation;->forward:Lcom/ss/bytertc/engine/data/Orientation;

    .line 4
    .line 5
    iget p0, p0, Lcom/ss/bytertc/engine/data/Orientation;->x:F

    .line 6
    .line 7
    return p0
.end method

.method public getFieldOrientationForwardY()F
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/engine/data/PositionInfo;->orientation:Lcom/ss/bytertc/engine/data/HumanOrientation;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/ss/bytertc/engine/data/HumanOrientation;->forward:Lcom/ss/bytertc/engine/data/Orientation;

    .line 4
    .line 5
    iget p0, p0, Lcom/ss/bytertc/engine/data/Orientation;->y:F

    .line 6
    .line 7
    return p0
.end method

.method public getFieldOrientationForwardZ()F
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/engine/data/PositionInfo;->orientation:Lcom/ss/bytertc/engine/data/HumanOrientation;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/ss/bytertc/engine/data/HumanOrientation;->forward:Lcom/ss/bytertc/engine/data/Orientation;

    .line 4
    .line 5
    iget p0, p0, Lcom/ss/bytertc/engine/data/Orientation;->z:F

    .line 6
    .line 7
    return p0
.end method

.method public getFieldOrientationRightX()F
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/engine/data/PositionInfo;->orientation:Lcom/ss/bytertc/engine/data/HumanOrientation;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/ss/bytertc/engine/data/HumanOrientation;->right:Lcom/ss/bytertc/engine/data/Orientation;

    .line 4
    .line 5
    iget p0, p0, Lcom/ss/bytertc/engine/data/Orientation;->x:F

    .line 6
    .line 7
    return p0
.end method

.method public getFieldOrientationRightY()F
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/engine/data/PositionInfo;->orientation:Lcom/ss/bytertc/engine/data/HumanOrientation;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/ss/bytertc/engine/data/HumanOrientation;->right:Lcom/ss/bytertc/engine/data/Orientation;

    .line 4
    .line 5
    iget p0, p0, Lcom/ss/bytertc/engine/data/Orientation;->y:F

    .line 6
    .line 7
    return p0
.end method

.method public getFieldOrientationRightZ()F
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/engine/data/PositionInfo;->orientation:Lcom/ss/bytertc/engine/data/HumanOrientation;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/ss/bytertc/engine/data/HumanOrientation;->right:Lcom/ss/bytertc/engine/data/Orientation;

    .line 4
    .line 5
    iget p0, p0, Lcom/ss/bytertc/engine/data/Orientation;->z:F

    .line 6
    .line 7
    return p0
.end method

.method public getFieldOrientationUpX()F
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/engine/data/PositionInfo;->orientation:Lcom/ss/bytertc/engine/data/HumanOrientation;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/ss/bytertc/engine/data/HumanOrientation;->up:Lcom/ss/bytertc/engine/data/Orientation;

    .line 4
    .line 5
    iget p0, p0, Lcom/ss/bytertc/engine/data/Orientation;->x:F

    .line 6
    .line 7
    return p0
.end method

.method public getFieldOrientationUpY()F
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/engine/data/PositionInfo;->orientation:Lcom/ss/bytertc/engine/data/HumanOrientation;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/ss/bytertc/engine/data/HumanOrientation;->up:Lcom/ss/bytertc/engine/data/Orientation;

    .line 4
    .line 5
    iget p0, p0, Lcom/ss/bytertc/engine/data/Orientation;->y:F

    .line 6
    .line 7
    return p0
.end method

.method public getFieldOrientationUpZ()F
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/engine/data/PositionInfo;->orientation:Lcom/ss/bytertc/engine/data/HumanOrientation;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/ss/bytertc/engine/data/HumanOrientation;->up:Lcom/ss/bytertc/engine/data/Orientation;

    .line 4
    .line 5
    iget p0, p0, Lcom/ss/bytertc/engine/data/Orientation;->z:F

    .line 6
    .line 7
    return p0
.end method

.method public getFieldPositionX()F
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/engine/data/PositionInfo;->position:Lcom/ss/bytertc/engine/data/Position;

    .line 2
    .line 3
    iget p0, p0, Lcom/ss/bytertc/engine/data/Position;->x:F

    .line 4
    .line 5
    return p0
.end method

.method public getFieldPositionY()F
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/engine/data/PositionInfo;->position:Lcom/ss/bytertc/engine/data/Position;

    .line 2
    .line 3
    iget p0, p0, Lcom/ss/bytertc/engine/data/Position;->y:F

    .line 4
    .line 5
    return p0
.end method

.method public getFieldPositionZ()F
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/engine/data/PositionInfo;->position:Lcom/ss/bytertc/engine/data/Position;

    .line 2
    .line 3
    iget p0, p0, Lcom/ss/bytertc/engine/data/Position;->z:F

    .line 4
    .line 5
    return p0
.end method

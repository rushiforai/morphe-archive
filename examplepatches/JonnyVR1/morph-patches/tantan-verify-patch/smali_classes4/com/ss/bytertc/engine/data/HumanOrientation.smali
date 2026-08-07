.class public Lcom/ss/bytertc/engine/data/HumanOrientation;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public forward:Lcom/ss/bytertc/engine/data/Orientation;

.field public right:Lcom/ss/bytertc/engine/data/Orientation;

.field public up:Lcom/ss/bytertc/engine/data/Orientation;


# direct methods
.method public constructor <init>()V
    .locals 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lcom/ss/bytertc/engine/data/Orientation;

    .line 5
    .line 6
    const/high16 v1, 0x3f800000    # 1.0f

    .line 7
    .line 8
    const/4 v2, 0x0

    .line 9
    invoke-direct {v0, v1, v2, v2}, Lcom/ss/bytertc/engine/data/Orientation;-><init>(FFF)V

    .line 10
    .line 11
    .line 12
    iput-object v0, p0, Lcom/ss/bytertc/engine/data/HumanOrientation;->forward:Lcom/ss/bytertc/engine/data/Orientation;

    .line 13
    .line 14
    new-instance v0, Lcom/ss/bytertc/engine/data/Orientation;

    .line 15
    .line 16
    invoke-direct {v0, v2, v1, v2}, Lcom/ss/bytertc/engine/data/Orientation;-><init>(FFF)V

    .line 17
    .line 18
    .line 19
    iput-object v0, p0, Lcom/ss/bytertc/engine/data/HumanOrientation;->right:Lcom/ss/bytertc/engine/data/Orientation;

    .line 20
    .line 21
    new-instance v0, Lcom/ss/bytertc/engine/data/Orientation;

    .line 22
    .line 23
    invoke-direct {v0, v2, v2, v1}, Lcom/ss/bytertc/engine/data/Orientation;-><init>(FFF)V

    .line 24
    .line 25
    .line 26
    iput-object v0, p0, Lcom/ss/bytertc/engine/data/HumanOrientation;->up:Lcom/ss/bytertc/engine/data/Orientation;

    .line 27
    .line 28
    return-void
.end method

.method public constructor <init>(Lcom/ss/bytertc/engine/data/Orientation;Lcom/ss/bytertc/engine/data/Orientation;Lcom/ss/bytertc/engine/data/Orientation;)V
    .locals 0

    .line 29
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 30
    iput-object p1, p0, Lcom/ss/bytertc/engine/data/HumanOrientation;->forward:Lcom/ss/bytertc/engine/data/Orientation;

    .line 31
    iput-object p2, p0, Lcom/ss/bytertc/engine/data/HumanOrientation;->right:Lcom/ss/bytertc/engine/data/Orientation;

    .line 32
    iput-object p3, p0, Lcom/ss/bytertc/engine/data/HumanOrientation;->up:Lcom/ss/bytertc/engine/data/Orientation;

    return-void
.end method

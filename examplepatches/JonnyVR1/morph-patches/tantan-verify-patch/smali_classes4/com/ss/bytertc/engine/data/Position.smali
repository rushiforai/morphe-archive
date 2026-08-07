.class public Lcom/ss/bytertc/engine/data/Position;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public x:F

.field public y:F

.field public z:F


# direct methods
.method public constructor <init>()V
    .locals 1

    const/4 v0, 0x0

    .line 11
    invoke-direct {p0, v0, v0, v0}, Lcom/ss/bytertc/engine/data/Position;-><init>(FFF)V

    return-void
.end method

.method public constructor <init>(FFF)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput p1, p0, Lcom/ss/bytertc/engine/data/Position;->x:F

    .line 5
    .line 6
    iput p2, p0, Lcom/ss/bytertc/engine/data/Position;->y:F

    .line 7
    .line 8
    iput p3, p0, Lcom/ss/bytertc/engine/data/Position;->z:F

    .line 9
    .line 10
    return-void
.end method

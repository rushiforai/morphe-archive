.class public Lcom/ss/bytertc/engine/InternalRectangle;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public height:I

.field public width:I

.field public x:I

.field public y:I


# direct methods
.method public constructor <init>(IIII)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput p1, p0, Lcom/ss/bytertc/engine/InternalRectangle;->x:I

    .line 5
    .line 6
    iput p2, p0, Lcom/ss/bytertc/engine/InternalRectangle;->y:I

    .line 7
    .line 8
    iput p3, p0, Lcom/ss/bytertc/engine/InternalRectangle;->width:I

    .line 9
    .line 10
    iput p4, p0, Lcom/ss/bytertc/engine/InternalRectangle;->height:I

    .line 11
    .line 12
    return-void
.end method

.method public static create(IIII)Lcom/ss/bytertc/engine/InternalRectangle;
    .locals 1
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    new-instance v0, Lcom/ss/bytertc/engine/InternalRectangle;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1, p2, p3}, Lcom/ss/bytertc/engine/InternalRectangle;-><init>(IIII)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

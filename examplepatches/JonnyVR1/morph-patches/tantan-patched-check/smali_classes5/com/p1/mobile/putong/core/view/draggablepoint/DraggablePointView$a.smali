.class public Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/animation/TypeEvaluator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "a"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Landroid/animation/TypeEvaluator<",
        "Landroid/graphics/PointF;",
        ">;"
    }
.end annotation


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
.method public a(FLandroid/graphics/PointF;Landroid/graphics/PointF;)Landroid/graphics/PointF;
    .locals 1

    .line 1
    iget p0, p2, Landroid/graphics/PointF;->x:F

    .line 2
    .line 3
    iget v0, p3, Landroid/graphics/PointF;->x:F

    .line 4
    .line 5
    sub-float/2addr v0, p0

    .line 6
    mul-float/2addr v0, p1

    .line 7
    add-float/2addr p0, v0

    .line 8
    iget p2, p2, Landroid/graphics/PointF;->y:F

    .line 9
    .line 10
    iget p3, p3, Landroid/graphics/PointF;->y:F

    .line 11
    .line 12
    sub-float/2addr p3, p2

    .line 13
    mul-float/2addr p1, p3

    .line 14
    add-float/2addr p2, p1

    .line 15
    new-instance p1, Landroid/graphics/PointF;

    .line 16
    .line 17
    invoke-direct {p1, p0, p2}, Landroid/graphics/PointF;-><init>(FF)V

    .line 18
    .line 19
    .line 20
    return-object p1
.end method

.method public bridge synthetic evaluate(FLjava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    check-cast p2, Landroid/graphics/PointF;

    .line 2
    .line 3
    check-cast p3, Landroid/graphics/PointF;

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView$a;->a(FLandroid/graphics/PointF;Landroid/graphics/PointF;)Landroid/graphics/PointF;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

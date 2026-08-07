.class public Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView$DragView$c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/animation/TimeInterpolator;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView$DragView;->l()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView$DragView;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView$DragView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView$DragView$c;->a:Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView$DragView;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public getInterpolation(F)F
    .locals 4

    .line 1
    const/high16 p0, -0x3f800000    # -4.0f

    .line 2
    .line 3
    mul-float/2addr p0, p1

    .line 4
    float-to-double v0, p0

    .line 5
    const-wide/high16 v2, 0x4000000000000000L    # 2.0

    .line 6
    .line 7
    invoke-static {v2, v3, v0, v1}, Ljava/lang/Math;->pow(DD)D

    .line 8
    .line 9
    .line 10
    move-result-wide v0

    .line 11
    const p0, 0x3e12492c

    .line 12
    .line 13
    .line 14
    sub-float/2addr p1, p0

    .line 15
    float-to-double p0, p1

    .line 16
    const-wide v2, 0x401921fb54442d18L    # 6.283185307179586

    .line 17
    .line 18
    .line 19
    .line 20
    .line 21
    mul-double/2addr p0, v2

    .line 22
    const-wide v2, 0x3fe2492580000000L    # 0.5714290142059326

    .line 23
    .line 24
    .line 25
    .line 26
    .line 27
    div-double/2addr p0, v2

    .line 28
    invoke-static {p0, p1}, Ljava/lang/Math;->sin(D)D

    .line 29
    .line 30
    .line 31
    move-result-wide p0

    .line 32
    mul-double/2addr v0, p0

    .line 33
    const-wide/high16 p0, 0x3ff0000000000000L    # 1.0

    .line 34
    .line 35
    add-double/2addr v0, p0

    .line 36
    double-to-float p0, v0

    .line 37
    return p0
.end method

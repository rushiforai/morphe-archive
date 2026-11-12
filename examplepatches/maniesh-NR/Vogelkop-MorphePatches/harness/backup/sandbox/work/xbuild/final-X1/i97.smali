.class public final Li97;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final e:Landroid/graphics/PointF;


# instance fields
.field public final a:Landroid/graphics/PointF;

.field public final b:Landroid/graphics/PointF;

.field public c:F

.field public final d:Landroid/graphics/PointF;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    new-instance v0, Landroid/graphics/PointF;

    invoke-direct {v0}, Landroid/graphics/PointF;-><init>()V

    sput-object v0, Li97;->e:Landroid/graphics/PointF;

    return-void
.end method

.method public constructor <init>(Landroid/graphics/PointF;I)V
    .registers 4

    new-instance v0, Landroid/graphics/PointF;

    invoke-direct {v0}, Landroid/graphics/PointF;-><init>()V

    and-int/lit8 p2, p2, 0x2

    if-eqz p2, :cond_e

    new-instance p1, Landroid/graphics/PointF;

    invoke-direct {p1}, Landroid/graphics/PointF;-><init>()V

    :cond_e
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Li97;->a:Landroid/graphics/PointF;

    iput-object p1, p0, Li97;->b:Landroid/graphics/PointF;

    const/high16 p1, 0x3f800000    # 1.0f

    iput p1, p0, Li97;->c:F

    new-instance p1, Landroid/graphics/PointF;

    invoke-direct {p1}, Landroid/graphics/PointF;-><init>()V

    iput-object p1, p0, Li97;->d:Landroid/graphics/PointF;

    return-void
.end method


# virtual methods
.method public final a()V
    .registers 3

    iget-object v0, p0, Li97;->a:Landroid/graphics/PointF;

    const/4 v1, 0x0

    invoke-virtual {v0, v1, v1}, Landroid/graphics/PointF;->set(FF)V

    iget-object v0, p0, Li97;->b:Landroid/graphics/PointF;

    invoke-virtual {v0, v1, v1}, Landroid/graphics/PointF;->set(FF)V

    const/high16 v0, 0x3f800000    # 1.0f

    iput v0, p0, Li97;->c:F

    iget-object p0, p0, Li97;->d:Landroid/graphics/PointF;

    invoke-virtual {p0, v1, v1}, Landroid/graphics/PointF;->set(FF)V

    return-void
.end method

.method public final b(FF)Landroid/graphics/PointF;
    .registers 5

    iget-object v0, p0, Li97;->a:Landroid/graphics/PointF;

    iget v1, v0, Landroid/graphics/PointF;->x:F

    sub-float/2addr p1, v1

    iget v0, v0, Landroid/graphics/PointF;->y:F

    sub-float/2addr p2, v0

    iget-object v0, p0, Li97;->b:Landroid/graphics/PointF;

    iget v1, v0, Landroid/graphics/PointF;->x:F

    div-float/2addr p1, v1

    iget-object p0, p0, Li97;->d:Landroid/graphics/PointF;

    iput p1, p0, Landroid/graphics/PointF;->x:F

    iget p1, v0, Landroid/graphics/PointF;->y:F

    div-float/2addr p2, p1

    iput p2, p0, Landroid/graphics/PointF;->y:F

    return-object p0
.end method

.method public final c(Lcom/opera/hype/image/editor/EditImage;)Z
    .registers 7

    invoke-virtual {p0}, Li97;->a()V

    iget-object v0, p1, Lcom/opera/hype/image/editor/EditImage;->b:Lean;

    iget-object v0, v0, Lean;->a:Lydb;

    iget-object v1, v0, Lydb;->b:Landroid/graphics/Matrix;

    invoke-virtual {v0, v1}, Lydb;->b(Landroid/graphics/Matrix;)Landroid/graphics/RectF;

    move-result-object v1

    if-eqz v1, :cond_15

    invoke-virtual {v1}, Landroid/graphics/RectF;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_17

    :cond_15
    const/4 p0, 0x0

    return p0

    :cond_17
    invoke-virtual {v1}, Landroid/graphics/RectF;->width()F

    move-result v2

    invoke-virtual {v1}, Landroid/graphics/RectF;->height()F

    move-result v3

    iget-object v4, p0, Li97;->b:Landroid/graphics/PointF;

    invoke-virtual {v4, v2, v3}, Landroid/graphics/PointF;->set(FF)V

    iget v2, v1, Landroid/graphics/RectF;->left:F

    invoke-virtual {v0}, Landroid/view/View;->getPaddingLeft()I

    move-result v3

    int-to-float v3, v3

    add-float/2addr v2, v3

    iget-object v3, p0, Li97;->a:Landroid/graphics/PointF;

    iput v2, v3, Landroid/graphics/PointF;->x:F

    iget v1, v1, Landroid/graphics/RectF;->top:F

    invoke-virtual {v0}, Landroid/view/View;->getPaddingTop()I

    move-result v2

    int-to-float v2, v2

    add-float/2addr v1, v2

    iput v1, v3, Landroid/graphics/PointF;->y:F

    iget p1, p1, Lcom/opera/hype/image/editor/EditImage;->a:F

    invoke-virtual {v0}, Lydb;->h()F

    move-result v0

    mul-float/2addr v0, p1

    iput v0, p0, Li97;->c:F

    const/4 p0, 0x1

    return p0
.end method

.method public final equals(Ljava/lang/Object;)Z
    .registers 4

    if-eq p0, p1, :cond_28

    instance-of v0, p1, Li97;

    if-eqz v0, :cond_26

    check-cast p1, Li97;

    iget-object v0, p0, Li97;->a:Landroid/graphics/PointF;

    iget-object v1, p1, Li97;->a:Landroid/graphics/PointF;

    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_26

    iget-object v0, p0, Li97;->b:Landroid/graphics/PointF;

    iget-object v1, p1, Li97;->b:Landroid/graphics/PointF;

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_26

    iget p0, p0, Li97;->c:F

    iget p1, p1, Li97;->c:F

    invoke-static {p0, p1}, Ljava/lang/Float;->compare(FF)I

    move-result p0

    if-eqz p0, :cond_28

    :cond_26
    const/4 p0, 0x0

    return p0

    :cond_28
    const/4 p0, 0x1

    return p0
.end method

.method public final hashCode()I
    .registers 3

    iget-object v0, p0, Li97;->a:Landroid/graphics/PointF;

    invoke-virtual {v0}, Landroid/graphics/PointF;->hashCode()I

    move-result v0

    mul-int/lit8 v0, v0, 0x1f

    iget-object v1, p0, Li97;->b:Landroid/graphics/PointF;

    invoke-virtual {v1}, Landroid/graphics/PointF;->hashCode()I

    move-result v1

    add-int/2addr v1, v0

    mul-int/lit8 v1, v1, 0x1f

    iget p0, p0, Li97;->c:F

    invoke-static {p0}, Ljava/lang/Float;->hashCode(F)I

    move-result p0

    add-int/2addr p0, v1

    return p0
.end method

.method public final toString()Ljava/lang/String;
    .registers 1

    const-string p0, ""

    return-object p0
.end method

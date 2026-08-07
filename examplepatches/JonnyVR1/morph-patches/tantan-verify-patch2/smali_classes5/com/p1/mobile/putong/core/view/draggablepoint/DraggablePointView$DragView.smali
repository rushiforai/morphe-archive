.class public Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView$DragView;
.super Landroid/view/View;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "DragView"
.end annotation


# instance fields
.field public a:Landroid/graphics/Path;

.field public b:Landroid/graphics/Paint;

.field public c:Landroid/graphics/Bitmap;

.field public d:Landroid/graphics/PointF;

.field public e:Landroid/graphics/PointF;

.field public f:Landroid/graphics/PointF;

.field public g:F

.field public h:F

.field public i:F

.field public j:F

.field public k:I

.field public l:I

.field public m:I

.field public n:I

.field public o:[I

.field public p:[Landroid/graphics/Bitmap;

.field public q:I

.field public final synthetic r:Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView;Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    .line 39
    invoke-direct {p0, p1, p2, v0}, Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView$DragView;-><init>(Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView;Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView;Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .param p2    # Landroid/content/Context;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    const/4 v0, 0x0

    .line 38
    invoke-direct {p0, p1, p2, p3, v0}, Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView$DragView;-><init>(Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView;Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView;Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 1
    .param p2    # Landroid/content/Context;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView$DragView;->r:Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView;

    .line 2
    .line 3
    invoke-direct {p0, p2, p3, p4}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 4
    .line 5
    .line 6
    const/high16 p1, 0x43960000    # 300.0f

    .line 7
    .line 8
    iput p1, p0, Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView$DragView;->h:F

    .line 9
    .line 10
    const/16 p1, 0x1e

    .line 11
    .line 12
    iput p1, p0, Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView$DragView;->m:I

    .line 13
    .line 14
    const/16 p1, 0x28

    .line 15
    .line 16
    iput p1, p0, Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView$DragView;->n:I

    .line 17
    .line 18
    sget p1, Ll/dbc0;->w7:I

    .line 19
    .line 20
    sget p2, Ll/dbc0;->x7:I

    .line 21
    .line 22
    sget p3, Ll/dbc0;->y7:I

    .line 23
    .line 24
    sget p4, Ll/dbc0;->z7:I

    .line 25
    .line 26
    sget v0, Ll/dbc0;->A7:I

    .line 27
    .line 28
    filled-new-array {p1, p2, p3, p4, v0}, [I

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    iput-object p1, p0, Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView$DragView;->o:[I

    .line 33
    .line 34
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView$DragView;->e()V

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method public static bridge synthetic a(Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView$DragView;)Landroid/graphics/PointF;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView$DragView;->d:Landroid/graphics/PointF;

    return-object p0
.end method

.method public static bridge synthetic b(Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView$DragView;I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView$DragView;->q:I

    return-void
.end method

.method public static bridge synthetic c(Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView$DragView;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView$DragView;->d()V

    return-void
.end method


# virtual methods
.method public final d()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    check-cast v0, Landroid/view/ViewGroup;

    .line 6
    .line 7
    invoke-virtual {v0, p0}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView$DragView;->r:Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView;

    .line 11
    .line 12
    const/4 v1, 0x0

    .line 13
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 14
    .line 15
    .line 16
    iget-object p0, p0, Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView$DragView;->r:Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView;

    .line 17
    .line 18
    invoke-virtual {p0, v1}, Landroid/view/View;->setDrawingCacheEnabled(Z)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public final e()V
    .locals 4

    .line 1
    new-instance v0, Landroid/graphics/Path;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/graphics/Path;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView$DragView;->a:Landroid/graphics/Path;

    .line 7
    .line 8
    new-instance v0, Landroid/graphics/Paint;

    .line 9
    .line 10
    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    .line 11
    .line 12
    .line 13
    iput-object v0, p0, Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView$DragView;->b:Landroid/graphics/Paint;

    .line 14
    .line 15
    const/4 v1, 0x1

    .line 16
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView$DragView;->b:Landroid/graphics/Paint;

    .line 20
    .line 21
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setDither(Z)V

    .line 22
    .line 23
    .line 24
    iget-object v0, p0, Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView$DragView;->b:Landroid/graphics/Paint;

    .line 25
    .line 26
    iget-object v1, p0, Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView$DragView;->r:Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView;

    .line 27
    .line 28
    invoke-static {v1}, Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView;->i(Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView;)I

    .line 29
    .line 30
    .line 31
    move-result v1

    .line 32
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 33
    .line 34
    .line 35
    new-instance v0, Landroid/graphics/PointF;

    .line 36
    .line 37
    invoke-direct {v0}, Landroid/graphics/PointF;-><init>()V

    .line 38
    .line 39
    .line 40
    iput-object v0, p0, Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView$DragView;->d:Landroid/graphics/PointF;

    .line 41
    .line 42
    new-instance v0, Landroid/graphics/PointF;

    .line 43
    .line 44
    invoke-direct {v0}, Landroid/graphics/PointF;-><init>()V

    .line 45
    .line 46
    .line 47
    iput-object v0, p0, Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView$DragView;->e:Landroid/graphics/PointF;

    .line 48
    .line 49
    const/4 v0, 0x0

    .line 50
    iput v0, p0, Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView$DragView;->k:I

    .line 51
    .line 52
    iget-object v1, p0, Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView$DragView;->o:[I

    .line 53
    .line 54
    array-length v1, v1

    .line 55
    new-array v1, v1, [Landroid/graphics/Bitmap;

    .line 56
    .line 57
    iput-object v1, p0, Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView$DragView;->p:[Landroid/graphics/Bitmap;

    .line 58
    .line 59
    :goto_0
    iget-object v1, p0, Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView$DragView;->o:[I

    .line 60
    .line 61
    array-length v1, v1

    .line 62
    if-ge v0, v1, :cond_0

    .line 63
    .line 64
    iget-object v1, p0, Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView$DragView;->p:[Landroid/graphics/Bitmap;

    .line 65
    .line 66
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 67
    .line 68
    .line 69
    move-result-object v2

    .line 70
    iget-object v3, p0, Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView$DragView;->o:[I

    .line 71
    .line 72
    aget v3, v3, v0

    .line 73
    .line 74
    invoke-static {v2, v3}, Landroid/graphics/BitmapFactory;->decodeResource(Landroid/content/res/Resources;I)Landroid/graphics/Bitmap;

    .line 75
    .line 76
    .line 77
    move-result-object v2

    .line 78
    aput-object v2, v1, v0

    .line 79
    .line 80
    add-int/lit8 v0, v0, 0x1

    .line 81
    .line 82
    goto :goto_0

    .line 83
    :cond_0
    return-void
.end method

.method public final f()Z
    .locals 1

    .line 1
    iget v0, p0, Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView$DragView;->g:F

    .line 2
    .line 3
    iget p0, p0, Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView$DragView;->h:F

    .line 4
    .line 5
    cmpg-float p0, v0, p0

    .line 6
    .line 7
    if-gtz p0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x1

    .line 10
    return p0

    .line 11
    :cond_0
    const/4 p0, 0x0

    .line 12
    return p0
.end method

.method public g()V
    .locals 2

    .line 1
    iget v0, p0, Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView$DragView;->k:I

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-ne v0, v1, :cond_0

    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView$DragView;->f()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView$DragView;->l()V

    .line 13
    .line 14
    .line 15
    return-void

    .line 16
    :cond_0
    iget v0, p0, Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView$DragView;->k:I

    .line 17
    .line 18
    const/4 v1, 0x2

    .line 19
    if-ne v0, v1, :cond_2

    .line 20
    .line 21
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView$DragView;->f()Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-eqz v0, :cond_1

    .line 26
    .line 27
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView$DragView;->l()V

    .line 28
    .line 29
    .line 30
    return-void

    .line 31
    :cond_1
    const/4 v0, 0x3

    .line 32
    iput v0, p0, Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView$DragView;->k:I

    .line 33
    .line 34
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView$DragView;->j()V

    .line 35
    .line 36
    .line 37
    :cond_2
    return-void
.end method

.method public h(FF)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView$DragView;->d:Landroid/graphics/PointF;

    .line 2
    .line 3
    invoke-virtual {v0, p1, p2}, Landroid/graphics/PointF;->set(FF)V

    .line 4
    .line 5
    .line 6
    iget-object p1, p0, Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView$DragView;->r:Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView;

    .line 7
    .line 8
    iget-object p2, p0, Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView$DragView;->d:Landroid/graphics/PointF;

    .line 9
    .line 10
    iget-object v0, p0, Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView$DragView;->e:Landroid/graphics/PointF;

    .line 11
    .line 12
    invoke-virtual {p1, p2, v0}, Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView;->o(Landroid/graphics/PointF;Landroid/graphics/PointF;)F

    .line 13
    .line 14
    .line 15
    move-result p1

    .line 16
    iput p1, p0, Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView$DragView;->g:F

    .line 17
    .line 18
    iget p1, p0, Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView$DragView;->k:I

    .line 19
    .line 20
    const/4 p2, 0x1

    .line 21
    if-ne p1, p2, :cond_2

    .line 22
    .line 23
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView$DragView;->f()Z

    .line 24
    .line 25
    .line 26
    move-result p1

    .line 27
    if-eqz p1, :cond_0

    .line 28
    .line 29
    iget p1, p0, Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView$DragView;->m:I

    .line 30
    .line 31
    int-to-float p1, p1

    .line 32
    iget p2, p0, Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView$DragView;->g:F

    .line 33
    .line 34
    const/high16 v0, 0x41200000    # 10.0f

    .line 35
    .line 36
    div-float/2addr p2, v0

    .line 37
    sub-float/2addr p1, p2

    .line 38
    float-to-int p1, p1

    .line 39
    const/16 p2, 0xa

    .line 40
    .line 41
    invoke-static {p1, p2}, Ljava/lang/Math;->max(II)I

    .line 42
    .line 43
    .line 44
    move-result p1

    .line 45
    iput p1, p0, Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView$DragView;->l:I

    .line 46
    .line 47
    goto :goto_0

    .line 48
    :cond_0
    const/4 p1, 0x2

    .line 49
    iput p1, p0, Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView$DragView;->k:I

    .line 50
    .line 51
    iget-object p1, p0, Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView$DragView;->r:Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView;

    .line 52
    .line 53
    invoke-static {p1}, Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView;->h(Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView;)Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView$b;

    .line 54
    .line 55
    .line 56
    const/4 p1, 0x0

    .line 57
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 58
    .line 59
    .line 60
    move-result p2

    .line 61
    if-nez p2, :cond_1

    .line 62
    .line 63
    goto :goto_0

    .line 64
    :cond_1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView$DragView;->r:Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView;

    .line 65
    .line 66
    invoke-static {p0}, Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView;->h(Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView;)Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView$b;

    .line 67
    .line 68
    .line 69
    throw p1

    .line 70
    :cond_2
    :goto_0
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 71
    .line 72
    .line 73
    return-void
.end method

.method public i(FFFF)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView$DragView;->e:Landroid/graphics/PointF;

    .line 2
    .line 3
    invoke-virtual {v0, p1, p2}, Landroid/graphics/PointF;->set(FF)V

    .line 4
    .line 5
    .line 6
    iget-object p1, p0, Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView$DragView;->d:Landroid/graphics/PointF;

    .line 7
    .line 8
    invoke-virtual {p1, p3, p4}, Landroid/graphics/PointF;->set(FF)V

    .line 9
    .line 10
    .line 11
    iget-object p1, p0, Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView$DragView;->r:Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView;

    .line 12
    .line 13
    iget-object p2, p0, Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView$DragView;->d:Landroid/graphics/PointF;

    .line 14
    .line 15
    iget-object p3, p0, Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView$DragView;->e:Landroid/graphics/PointF;

    .line 16
    .line 17
    invoke-virtual {p1, p2, p3}, Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView;->o(Landroid/graphics/PointF;Landroid/graphics/PointF;)F

    .line 18
    .line 19
    .line 20
    move-result p1

    .line 21
    iput p1, p0, Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView$DragView;->g:F

    .line 22
    .line 23
    iget p2, p0, Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView$DragView;->h:F

    .line 24
    .line 25
    cmpg-float p2, p1, p2

    .line 26
    .line 27
    if-gtz p2, :cond_0

    .line 28
    .line 29
    iget p2, p0, Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView$DragView;->m:I

    .line 30
    .line 31
    int-to-float p2, p2

    .line 32
    const/high16 p3, 0x41200000    # 10.0f

    .line 33
    .line 34
    div-float/2addr p1, p3

    .line 35
    sub-float/2addr p2, p1

    .line 36
    float-to-int p1, p2

    .line 37
    const/16 p2, 0xa

    .line 38
    .line 39
    invoke-static {p1, p2}, Ljava/lang/Math;->max(II)I

    .line 40
    .line 41
    .line 42
    move-result p1

    .line 43
    iput p1, p0, Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView$DragView;->l:I

    .line 44
    .line 45
    const/4 p1, 0x1

    .line 46
    iput p1, p0, Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView$DragView;->k:I

    .line 47
    .line 48
    return-void

    .line 49
    :cond_0
    const/4 p1, 0x0

    .line 50
    iput p1, p0, Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView$DragView;->k:I

    .line 51
    .line 52
    return-void
.end method

.method public final j()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView$DragView;->k(Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public final k(Z)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView$DragView;->o:[I

    .line 2
    .line 3
    array-length v0, v0

    .line 4
    const/4 v1, 0x0

    .line 5
    filled-new-array {v1, v0}, [I

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-static {v0}, Landroid/animation/ValueAnimator;->ofInt([I)Landroid/animation/ValueAnimator;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    const-wide/16 v1, 0x12c

    .line 14
    .line 15
    invoke-virtual {v0, v1, v2}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 16
    .line 17
    .line 18
    new-instance v1, Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView$DragView$a;

    .line 19
    .line 20
    invoke-direct {v1, p0}, Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView$DragView$a;-><init>(Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView$DragView;)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 24
    .line 25
    .line 26
    new-instance v1, Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView$DragView$b;

    .line 27
    .line 28
    invoke-direct {v1, p0, p1}, Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView$DragView$b;-><init>(Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView$DragView;Z)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {v0, v1}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->start()V

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method public final l()V
    .locals 5

    .line 1
    iget v0, p0, Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView$DragView;->k:I

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-ne v0, v1, :cond_0

    .line 5
    .line 6
    new-instance v0, Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView$a;

    .line 7
    .line 8
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView$a;-><init>()V

    .line 9
    .line 10
    .line 11
    new-instance v1, Landroid/graphics/PointF;

    .line 12
    .line 13
    iget-object v2, p0, Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView$DragView;->d:Landroid/graphics/PointF;

    .line 14
    .line 15
    iget v3, v2, Landroid/graphics/PointF;->x:F

    .line 16
    .line 17
    iget v2, v2, Landroid/graphics/PointF;->y:F

    .line 18
    .line 19
    invoke-direct {v1, v3, v2}, Landroid/graphics/PointF;-><init>(FF)V

    .line 20
    .line 21
    .line 22
    new-instance v2, Landroid/graphics/PointF;

    .line 23
    .line 24
    iget-object v3, p0, Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView$DragView;->e:Landroid/graphics/PointF;

    .line 25
    .line 26
    iget v4, v3, Landroid/graphics/PointF;->x:F

    .line 27
    .line 28
    iget v3, v3, Landroid/graphics/PointF;->y:F

    .line 29
    .line 30
    invoke-direct {v2, v4, v3}, Landroid/graphics/PointF;-><init>(FF)V

    .line 31
    .line 32
    .line 33
    filled-new-array {v1, v2}, [Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    invoke-static {v0, v1}, Landroid/animation/ValueAnimator;->ofObject(Landroid/animation/TypeEvaluator;[Ljava/lang/Object;)Landroid/animation/ValueAnimator;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    const-wide/16 v1, 0x1f4

    .line 42
    .line 43
    invoke-virtual {v0, v1, v2}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 44
    .line 45
    .line 46
    new-instance v1, Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView$DragView$c;

    .line 47
    .line 48
    invoke-direct {v1, p0}, Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView$DragView$c;-><init>(Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView$DragView;)V

    .line 49
    .line 50
    .line 51
    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 52
    .line 53
    .line 54
    new-instance v1, Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView$DragView$d;

    .line 55
    .line 56
    invoke-direct {v1, p0}, Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView$DragView$d;-><init>(Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView$DragView;)V

    .line 57
    .line 58
    .line 59
    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 60
    .line 61
    .line 62
    new-instance v1, Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView$DragView$e;

    .line 63
    .line 64
    invoke-direct {v1, p0}, Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView$DragView$e;-><init>(Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView$DragView;)V

    .line 65
    .line 66
    .line 67
    invoke-virtual {v0, v1}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 68
    .line 69
    .line 70
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->start()V

    .line 71
    .line 72
    .line 73
    return-void

    .line 74
    :cond_0
    const/4 v1, 0x2

    .line 75
    if-ne v0, v1, :cond_2

    .line 76
    .line 77
    iget-object v0, p0, Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView$DragView;->d:Landroid/graphics/PointF;

    .line 78
    .line 79
    iget-object v1, p0, Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView$DragView;->e:Landroid/graphics/PointF;

    .line 80
    .line 81
    iget v2, v1, Landroid/graphics/PointF;->x:F

    .line 82
    .line 83
    iget v1, v1, Landroid/graphics/PointF;->y:F

    .line 84
    .line 85
    invoke-virtual {v0, v2, v1}, Landroid/graphics/PointF;->set(FF)V

    .line 86
    .line 87
    .line 88
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 89
    .line 90
    .line 91
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView$DragView;->d()V

    .line 92
    .line 93
    .line 94
    iget-object v0, p0, Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView$DragView;->r:Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView;

    .line 95
    .line 96
    invoke-static {v0}, Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView;->h(Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView;)Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView$b;

    .line 97
    .line 98
    .line 99
    const/4 v0, 0x0

    .line 100
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 101
    .line 102
    .line 103
    move-result v1

    .line 104
    if-nez v1, :cond_1

    .line 105
    .line 106
    goto :goto_0

    .line 107
    :cond_1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView$DragView;->r:Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView;

    .line 108
    .line 109
    invoke-static {p0}, Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView;->h(Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView;)Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView$b;

    .line 110
    .line 111
    .line 112
    throw v0

    .line 113
    :cond_2
    :goto_0
    return-void
.end method

.method public onDraw(Landroid/graphics/Canvas;)V
    .locals 9

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView$DragView;->f()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget v0, p0, Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView$DragView;->k:I

    .line 8
    .line 9
    const/4 v1, 0x1

    .line 10
    if-ne v0, v1, :cond_0

    .line 11
    .line 12
    iget-object v0, p0, Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView$DragView;->b:Landroid/graphics/Paint;

    .line 13
    .line 14
    iget-object v2, p0, Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView$DragView;->r:Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView;

    .line 15
    .line 16
    invoke-static {v2}, Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView;->i(Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView;)I

    .line 17
    .line 18
    .line 19
    move-result v2

    .line 20
    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setColor(I)V

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView$DragView;->e:Landroid/graphics/PointF;

    .line 24
    .line 25
    iget v2, v0, Landroid/graphics/PointF;->x:F

    .line 26
    .line 27
    iget v0, v0, Landroid/graphics/PointF;->y:F

    .line 28
    .line 29
    iget v3, p0, Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView$DragView;->l:I

    .line 30
    .line 31
    int-to-float v3, v3

    .line 32
    iget-object v4, p0, Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView$DragView;->b:Landroid/graphics/Paint;

    .line 33
    .line 34
    invoke-virtual {p1, v2, v0, v3, v4}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 35
    .line 36
    .line 37
    iget-object v0, p0, Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView$DragView;->r:Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView;

    .line 38
    .line 39
    iget-object v2, p0, Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView$DragView;->d:Landroid/graphics/PointF;

    .line 40
    .line 41
    iget-object v3, p0, Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView$DragView;->e:Landroid/graphics/PointF;

    .line 42
    .line 43
    invoke-virtual {v0, v2, v3}, Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView;->k(Landroid/graphics/PointF;Landroid/graphics/PointF;)Ljava/lang/Float;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    iget-object v2, p0, Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView$DragView;->r:Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView;

    .line 48
    .line 49
    iget-object v3, p0, Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView$DragView;->e:Landroid/graphics/PointF;

    .line 50
    .line 51
    iget v4, p0, Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView$DragView;->l:I

    .line 52
    .line 53
    int-to-float v4, v4

    .line 54
    invoke-virtual {v2, v3, v4, v0}, Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView;->j(Landroid/graphics/PointF;FLjava/lang/Float;)[Landroid/graphics/PointF;

    .line 55
    .line 56
    .line 57
    move-result-object v2

    .line 58
    iget v3, p0, Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView$DragView;->i:F

    .line 59
    .line 60
    iget v4, p0, Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView$DragView;->j:F

    .line 61
    .line 62
    invoke-static {v3, v4}, Ljava/lang/Math;->min(FF)F

    .line 63
    .line 64
    .line 65
    move-result v3

    .line 66
    float-to-int v3, v3

    .line 67
    div-int/lit8 v3, v3, 0x2

    .line 68
    .line 69
    iput v3, p0, Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView$DragView;->n:I

    .line 70
    .line 71
    iget-object v4, p0, Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView$DragView;->r:Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView;

    .line 72
    .line 73
    iget-object v5, p0, Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView$DragView;->d:Landroid/graphics/PointF;

    .line 74
    .line 75
    int-to-float v3, v3

    .line 76
    invoke-virtual {v4, v5, v3, v0}, Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView;->j(Landroid/graphics/PointF;FLjava/lang/Float;)[Landroid/graphics/PointF;

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    iget-object v3, p0, Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView$DragView;->b:Landroid/graphics/Paint;

    .line 81
    .line 82
    iget-object v4, p0, Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView$DragView;->r:Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView;

    .line 83
    .line 84
    invoke-static {v4}, Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView;->i(Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView;)I

    .line 85
    .line 86
    .line 87
    move-result v4

    .line 88
    invoke-virtual {v3, v4}, Landroid/graphics/Paint;->setColor(I)V

    .line 89
    .line 90
    .line 91
    iget-object v3, p0, Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView$DragView;->r:Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView;

    .line 92
    .line 93
    iget-object v4, p0, Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView$DragView;->d:Landroid/graphics/PointF;

    .line 94
    .line 95
    iget-object v5, p0, Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView$DragView;->e:Landroid/graphics/PointF;

    .line 96
    .line 97
    invoke-virtual {v3, v4, v5}, Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView;->l(Landroid/graphics/PointF;Landroid/graphics/PointF;)Landroid/graphics/PointF;

    .line 98
    .line 99
    .line 100
    move-result-object v3

    .line 101
    iput-object v3, p0, Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView$DragView;->f:Landroid/graphics/PointF;

    .line 102
    .line 103
    iget-object v3, p0, Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView$DragView;->a:Landroid/graphics/Path;

    .line 104
    .line 105
    invoke-virtual {v3}, Landroid/graphics/Path;->reset()V

    .line 106
    .line 107
    .line 108
    iget-object v3, p0, Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView$DragView;->a:Landroid/graphics/Path;

    .line 109
    .line 110
    const/4 v4, 0x0

    .line 111
    aget-object v5, v2, v4

    .line 112
    .line 113
    iget v6, v5, Landroid/graphics/PointF;->x:F

    .line 114
    .line 115
    iget v5, v5, Landroid/graphics/PointF;->y:F

    .line 116
    .line 117
    invoke-virtual {v3, v6, v5}, Landroid/graphics/Path;->moveTo(FF)V

    .line 118
    .line 119
    .line 120
    iget-object v3, p0, Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView$DragView;->a:Landroid/graphics/Path;

    .line 121
    .line 122
    iget-object v5, p0, Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView$DragView;->f:Landroid/graphics/PointF;

    .line 123
    .line 124
    iget v6, v5, Landroid/graphics/PointF;->x:F

    .line 125
    .line 126
    iget v5, v5, Landroid/graphics/PointF;->y:F

    .line 127
    .line 128
    aget-object v7, v0, v4

    .line 129
    .line 130
    iget v8, v7, Landroid/graphics/PointF;->x:F

    .line 131
    .line 132
    iget v7, v7, Landroid/graphics/PointF;->y:F

    .line 133
    .line 134
    invoke-virtual {v3, v6, v5, v8, v7}, Landroid/graphics/Path;->quadTo(FFFF)V

    .line 135
    .line 136
    .line 137
    iget-object v3, p0, Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView$DragView;->a:Landroid/graphics/Path;

    .line 138
    .line 139
    aget-object v0, v0, v1

    .line 140
    .line 141
    iget v5, v0, Landroid/graphics/PointF;->x:F

    .line 142
    .line 143
    iget v0, v0, Landroid/graphics/PointF;->y:F

    .line 144
    .line 145
    invoke-virtual {v3, v5, v0}, Landroid/graphics/Path;->lineTo(FF)V

    .line 146
    .line 147
    .line 148
    iget-object v0, p0, Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView$DragView;->a:Landroid/graphics/Path;

    .line 149
    .line 150
    iget-object v3, p0, Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView$DragView;->f:Landroid/graphics/PointF;

    .line 151
    .line 152
    iget v5, v3, Landroid/graphics/PointF;->x:F

    .line 153
    .line 154
    iget v3, v3, Landroid/graphics/PointF;->y:F

    .line 155
    .line 156
    aget-object v1, v2, v1

    .line 157
    .line 158
    iget v6, v1, Landroid/graphics/PointF;->x:F

    .line 159
    .line 160
    iget v1, v1, Landroid/graphics/PointF;->y:F

    .line 161
    .line 162
    invoke-virtual {v0, v5, v3, v6, v1}, Landroid/graphics/Path;->quadTo(FFFF)V

    .line 163
    .line 164
    .line 165
    iget-object v0, p0, Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView$DragView;->a:Landroid/graphics/Path;

    .line 166
    .line 167
    aget-object v1, v2, v4

    .line 168
    .line 169
    iget v2, v1, Landroid/graphics/PointF;->x:F

    .line 170
    .line 171
    iget v1, v1, Landroid/graphics/PointF;->y:F

    .line 172
    .line 173
    invoke-virtual {v0, v2, v1}, Landroid/graphics/Path;->lineTo(FF)V

    .line 174
    .line 175
    .line 176
    iget-object v0, p0, Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView$DragView;->a:Landroid/graphics/Path;

    .line 177
    .line 178
    iget-object v1, p0, Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView$DragView;->b:Landroid/graphics/Paint;

    .line 179
    .line 180
    invoke-virtual {p1, v0, v1}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 181
    .line 182
    .line 183
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView$DragView;->c:Landroid/graphics/Bitmap;

    .line 184
    .line 185
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 186
    .line 187
    .line 188
    move-result v0

    .line 189
    const/4 v1, 0x3

    .line 190
    const/high16 v2, 0x40000000    # 2.0f

    .line 191
    .line 192
    if-eqz v0, :cond_1

    .line 193
    .line 194
    iget-object v0, p0, Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView$DragView;->c:Landroid/graphics/Bitmap;

    .line 195
    .line 196
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->isRecycled()Z

    .line 197
    .line 198
    .line 199
    move-result v0

    .line 200
    if-nez v0, :cond_1

    .line 201
    .line 202
    iget v0, p0, Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView$DragView;->k:I

    .line 203
    .line 204
    if-eq v0, v1, :cond_1

    .line 205
    .line 206
    iget-object v0, p0, Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView$DragView;->c:Landroid/graphics/Bitmap;

    .line 207
    .line 208
    iget-object v3, p0, Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView$DragView;->d:Landroid/graphics/PointF;

    .line 209
    .line 210
    iget v4, v3, Landroid/graphics/PointF;->x:F

    .line 211
    .line 212
    iget v5, p0, Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView$DragView;->i:F

    .line 213
    .line 214
    div-float/2addr v5, v2

    .line 215
    sub-float/2addr v4, v5

    .line 216
    iget v3, v3, Landroid/graphics/PointF;->y:F

    .line 217
    .line 218
    iget v5, p0, Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView$DragView;->j:F

    .line 219
    .line 220
    div-float/2addr v5, v2

    .line 221
    sub-float/2addr v3, v5

    .line 222
    iget-object v5, p0, Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView$DragView;->b:Landroid/graphics/Paint;

    .line 223
    .line 224
    invoke-virtual {p1, v0, v4, v3, v5}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V

    .line 225
    .line 226
    .line 227
    :cond_1
    iget v0, p0, Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView$DragView;->k:I

    .line 228
    .line 229
    if-ne v0, v1, :cond_2

    .line 230
    .line 231
    iget v0, p0, Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView$DragView;->q:I

    .line 232
    .line 233
    iget-object v1, p0, Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView$DragView;->o:[I

    .line 234
    .line 235
    array-length v1, v1

    .line 236
    if-ge v0, v1, :cond_2

    .line 237
    .line 238
    iget-object v1, p0, Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView$DragView;->p:[Landroid/graphics/Bitmap;

    .line 239
    .line 240
    aget-object v0, v1, v0

    .line 241
    .line 242
    iget-object v1, p0, Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView$DragView;->d:Landroid/graphics/PointF;

    .line 243
    .line 244
    iget v3, v1, Landroid/graphics/PointF;->x:F

    .line 245
    .line 246
    iget v4, p0, Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView$DragView;->i:F

    .line 247
    .line 248
    div-float/2addr v4, v2

    .line 249
    sub-float/2addr v3, v4

    .line 250
    iget v1, v1, Landroid/graphics/PointF;->y:F

    .line 251
    .line 252
    iget v4, p0, Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView$DragView;->j:F

    .line 253
    .line 254
    div-float/2addr v4, v2

    .line 255
    sub-float/2addr v1, v4

    .line 256
    iget-object p0, p0, Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView$DragView;->b:Landroid/graphics/Paint;

    .line 257
    .line 258
    invoke-virtual {p1, v0, v3, v1, p0}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V

    .line 259
    .line 260
    .line 261
    :cond_2
    return-void
.end method

.method public setCacheBitmap(Landroid/graphics/Bitmap;)V
    .locals 1

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView$DragView;->c:Landroid/graphics/Bitmap;

    .line 2
    .line 3
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    int-to-float v0, v0

    .line 8
    iput v0, p0, Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView$DragView;->i:F

    .line 9
    .line 10
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    .line 11
    .line 12
    .line 13
    move-result p1

    .line 14
    int-to-float p1, p1

    .line 15
    iput p1, p0, Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView$DragView;->j:F

    .line 16
    .line 17
    return-void
.end method

.method public setState(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView$DragView;->k:I

    .line 2
    .line 3
    return-void
.end method

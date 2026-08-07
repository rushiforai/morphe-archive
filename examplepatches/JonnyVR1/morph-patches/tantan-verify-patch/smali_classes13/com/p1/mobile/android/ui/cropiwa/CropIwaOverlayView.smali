.class public Lcom/p1/mobile/android/ui/cropiwa/CropIwaOverlayView;
.super Landroid/view/View;
.source "SourceFile"

# interfaces
.implements Ll/dw5;
.implements Ll/km50;


# annotations
.annotation build Landroid/annotation/SuppressLint;
    value = {
        "ViewConstructor"
    }
.end annotation


# instance fields
.field public a:Landroid/graphics/Paint;

.field public b:Ll/zm50;

.field public c:Ll/fwb;

.field public d:Landroid/graphics/RectF;

.field public e:Landroid/graphics/RectF;

.field public f:Landroid/graphics/RectF;

.field public g:Ll/bwb;

.field public h:Z

.field public i:Ll/wm50;

.field public j:I

.field public k:I

.field public l:Ll/x20;

.field public m:F

.field public n:F


# direct methods
.method public constructor <init>(Landroid/content/Context;Ll/bwb;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p2}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaOverlayView;->d(Ll/bwb;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public static synthetic c(Lcom/p1/mobile/android/ui/cropiwa/CropIwaOverlayView;Ljava/lang/Float;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaOverlayView;->k(Ljava/lang/Float;)V

    return-void
.end method


# virtual methods
.method public a()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaOverlayView;->a:Landroid/graphics/Paint;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaOverlayView;->g:Ll/bwb;

    .line 4
    .line 5
    invoke-virtual {v1}, Ll/bwb;->o()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaOverlayView;->g:Ll/bwb;

    .line 13
    .line 14
    invoke-virtual {v0}, Ll/bwb;->j()Ll/fwb;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    iput-object v0, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaOverlayView;->c:Ll/fwb;

    .line 19
    .line 20
    invoke-virtual {v0}, Ll/fwb;->a()V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p0}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaOverlayView;->o()V

    .line 24
    .line 25
    .line 26
    invoke-virtual {p0}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaOverlayView;->l()V

    .line 27
    .line 28
    .line 29
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public b(Landroid/graphics/RectF;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaOverlayView;->d:Landroid/graphics/RectF;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Landroid/graphics/RectF;->set(Landroid/graphics/RectF;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaOverlayView;->o()V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaOverlayView;->l()V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public d(Ll/bwb;)V
    .locals 2

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaOverlayView;->g:Ll/bwb;

    .line 2
    .line 3
    invoke-virtual {p1, p0}, Ll/bwb;->a(Ll/dw5;)V

    .line 4
    .line 5
    .line 6
    new-instance v0, Landroid/graphics/RectF;

    .line 7
    .line 8
    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    .line 9
    .line 10
    .line 11
    iput-object v0, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaOverlayView;->d:Landroid/graphics/RectF;

    .line 12
    .line 13
    invoke-virtual {p1}, Ll/bwb;->j()Ll/fwb;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    iput-object v0, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaOverlayView;->c:Ll/fwb;

    .line 18
    .line 19
    new-instance v0, Landroid/graphics/RectF;

    .line 20
    .line 21
    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    .line 22
    .line 23
    .line 24
    iput-object v0, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaOverlayView;->e:Landroid/graphics/RectF;

    .line 25
    .line 26
    new-instance v0, Landroid/graphics/RectF;

    .line 27
    .line 28
    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    .line 29
    .line 30
    .line 31
    iput-object v0, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaOverlayView;->f:Landroid/graphics/RectF;

    .line 32
    .line 33
    new-instance v0, Landroid/graphics/Paint;

    .line 34
    .line 35
    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    .line 36
    .line 37
    .line 38
    iput-object v0, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaOverlayView;->a:Landroid/graphics/Paint;

    .line 39
    .line 40
    sget-object v1, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    .line 41
    .line 42
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 43
    .line 44
    .line 45
    iget-object v0, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaOverlayView;->a:Landroid/graphics/Paint;

    .line 46
    .line 47
    invoke-virtual {p1}, Ll/bwb;->o()I

    .line 48
    .line 49
    .line 50
    move-result p1

    .line 51
    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setColor(I)V

    .line 52
    .line 53
    .line 54
    const/4 p1, 0x1

    .line 55
    const/4 v0, 0x0

    .line 56
    invoke-virtual {p0, p1, v0}, Landroid/view/View;->setLayerType(ILandroid/graphics/Paint;)V

    .line 57
    .line 58
    .line 59
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 60
    .line 61
    .line 62
    move-result-object p1

    .line 63
    instance-of p1, p1, Lcom/p1/mobile/android/app/Act;

    .line 64
    .line 65
    if-eqz p1, :cond_0

    .line 66
    .line 67
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 68
    .line 69
    .line 70
    move-result-object p1

    .line 71
    check-cast p1, Lcom/p1/mobile/android/app/Act;

    .line 72
    .line 73
    sget-object v0, Ll/phx;->b:Lrx/subjects/b;

    .line 74
    .line 75
    invoke-virtual {p1, v0}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 76
    .line 77
    .line 78
    move-result-object p1

    .line 79
    new-instance v0, Ll/cwb;

    .line 80
    .line 81
    invoke-direct {v0, p0}, Ll/cwb;-><init>(Lcom/p1/mobile/android/ui/cropiwa/CropIwaOverlayView;)V

    .line 82
    .line 83
    .line 84
    invoke-virtual {p1, v0}, Lrx/c;->subscribe(Ll/y20;)Ll/kcg0;

    .line 85
    .line 86
    .line 87
    :cond_0
    return-void
.end method

.method public e()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    return p0
.end method

.method public f()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaOverlayView;->h:Z

    .line 2
    .line 3
    return p0
.end method

.method public g()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    return p0
.end method

.method public getAspectRatio()Ll/q11;
    .locals 2
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaOverlayView;->g:Ll/bwb;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/bwb;->e()Ll/q11;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sget-object v1, Ll/q11;->c:Ll/q11;

    .line 8
    .line 9
    if-ne v0, v1, :cond_2

    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaOverlayView;->d:Landroid/graphics/RectF;

    .line 12
    .line 13
    invoke-virtual {v0}, Landroid/graphics/RectF;->width()F

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    const/4 v1, 0x0

    .line 18
    cmpl-float v0, v0, v1

    .line 19
    .line 20
    if-eqz v0, :cond_1

    .line 21
    .line 22
    iget-object v0, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaOverlayView;->d:Landroid/graphics/RectF;

    .line 23
    .line 24
    invoke-virtual {v0}, Landroid/graphics/RectF;->height()F

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    cmpl-float v0, v0, v1

    .line 29
    .line 30
    if-nez v0, :cond_0

    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_0
    new-instance v0, Ll/q11;

    .line 34
    .line 35
    iget-object v1, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaOverlayView;->d:Landroid/graphics/RectF;

    .line 36
    .line 37
    invoke-virtual {v1}, Landroid/graphics/RectF;->width()F

    .line 38
    .line 39
    .line 40
    move-result v1

    .line 41
    invoke-static {v1}, Ljava/lang/Math;->round(F)I

    .line 42
    .line 43
    .line 44
    move-result v1

    .line 45
    iget-object p0, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaOverlayView;->d:Landroid/graphics/RectF;

    .line 46
    .line 47
    invoke-virtual {p0}, Landroid/graphics/RectF;->height()F

    .line 48
    .line 49
    .line 50
    move-result p0

    .line 51
    invoke-static {p0}, Ljava/lang/Math;->round(F)I

    .line 52
    .line 53
    .line 54
    move-result p0

    .line 55
    invoke-direct {v0, v1, p0}, Ll/q11;-><init>(II)V

    .line 56
    .line 57
    .line 58
    return-object v0

    .line 59
    :cond_1
    :goto_0
    const/4 p0, 0x0

    .line 60
    return-object p0

    .line 61
    :cond_2
    return-object v0
.end method

.method public getCropRect()Landroid/graphics/RectF;
    .locals 1

    .line 1
    new-instance v0, Landroid/graphics/RectF;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaOverlayView;->e:Landroid/graphics/RectF;

    .line 4
    .line 5
    invoke-direct {v0, p0}, Landroid/graphics/RectF;-><init>(Landroid/graphics/RectF;)V

    .line 6
    .line 7
    .line 8
    return-object v0
.end method

.method public getRemainScale()F
    .locals 2

    .line 1
    iget v0, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaOverlayView;->m:F

    .line 2
    .line 3
    const/high16 v1, 0x3f800000    # 1.0f

    .line 4
    .line 5
    iget p0, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaOverlayView;->n:F

    .line 6
    .line 7
    invoke-static {v1, p0}, Ljava/lang/Math;->max(FF)F

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    div-float/2addr v0, p0

    .line 12
    return v0
.end method

.method public h()Z
    .locals 1

    .line 1
    iget v0, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaOverlayView;->n:F

    .line 2
    .line 3
    iget p0, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaOverlayView;->m:F

    .line 4
    .line 5
    cmpg-float p0, v0, p0

    .line 6
    .line 7
    if-gez p0, :cond_0

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

.method public i()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    return p0
.end method

.method public final j()Z
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaOverlayView;->e:Landroid/graphics/RectF;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/graphics/RectF;->width()F

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget-object v1, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaOverlayView;->g:Ll/bwb;

    .line 8
    .line 9
    invoke-virtual {v1}, Ll/bwb;->n()I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    int-to-float v1, v1

    .line 14
    cmpl-float v0, v0, v1

    .line 15
    .line 16
    if-ltz v0, :cond_0

    .line 17
    .line 18
    iget-object v0, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaOverlayView;->e:Landroid/graphics/RectF;

    .line 19
    .line 20
    invoke-virtual {v0}, Landroid/graphics/RectF;->height()F

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    iget-object p0, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaOverlayView;->g:Ll/bwb;

    .line 25
    .line 26
    invoke-virtual {p0}, Ll/bwb;->m()I

    .line 27
    .line 28
    .line 29
    move-result p0

    .line 30
    int-to-float p0, p0

    .line 31
    cmpl-float p0, v0, p0

    .line 32
    .line 33
    if-ltz p0, :cond_0

    .line 34
    .line 35
    const/4 p0, 0x1

    .line 36
    return p0

    .line 37
    :cond_0
    const/4 p0, 0x0

    .line 38
    return p0
.end method

.method public final synthetic k(Ljava/lang/Float;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    iput p1, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaOverlayView;->n:F

    .line 6
    .line 7
    return-void
.end method

.method public l()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaOverlayView;->m(Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public m(Z)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaOverlayView;->b:Ll/zm50;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Landroid/graphics/RectF;

    .line 6
    .line 7
    iget-object v1, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaOverlayView;->e:Landroid/graphics/RectF;

    .line 8
    .line 9
    invoke-direct {v0, v1}, Landroid/graphics/RectF;-><init>(Landroid/graphics/RectF;)V

    .line 10
    .line 11
    .line 12
    iget-object p0, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaOverlayView;->b:Ll/zm50;

    .line 13
    .line 14
    invoke-interface {p0, v0, p1}, Ll/zm50;->b(Landroid/graphics/RectF;Z)V

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public n()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaOverlayView;->b:Ll/zm50;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaOverlayView;->f:Landroid/graphics/RectF;

    .line 10
    .line 11
    invoke-virtual {v0}, Landroid/graphics/RectF;->height()F

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    iget-object v1, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaOverlayView;->e:Landroid/graphics/RectF;

    .line 16
    .line 17
    invoke-virtual {v1}, Landroid/graphics/RectF;->height()F

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    div-float/2addr v0, v1

    .line 22
    iget-object v1, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaOverlayView;->f:Landroid/graphics/RectF;

    .line 23
    .line 24
    invoke-virtual {v1}, Landroid/graphics/RectF;->width()F

    .line 25
    .line 26
    .line 27
    move-result v1

    .line 28
    iget-object v2, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaOverlayView;->e:Landroid/graphics/RectF;

    .line 29
    .line 30
    invoke-virtual {v2}, Landroid/graphics/RectF;->width()F

    .line 31
    .line 32
    .line 33
    move-result v2

    .line 34
    div-float/2addr v1, v2

    .line 35
    invoke-static {v0, v1}, Ljava/lang/Math;->min(FF)F

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    invoke-virtual {p0}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaOverlayView;->getRemainScale()F

    .line 40
    .line 41
    .line 42
    move-result v1

    .line 43
    invoke-static {v0, v1}, Ljava/lang/Math;->min(FF)F

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    iget-object v1, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaOverlayView;->b:Ll/zm50;

    .line 48
    .line 49
    iget-object v2, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaOverlayView;->e:Landroid/graphics/RectF;

    .line 50
    .line 51
    invoke-virtual {v2}, Landroid/graphics/RectF;->centerX()F

    .line 52
    .line 53
    .line 54
    move-result v2

    .line 55
    iget-object v3, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaOverlayView;->e:Landroid/graphics/RectF;

    .line 56
    .line 57
    invoke-virtual {v3}, Landroid/graphics/RectF;->centerY()F

    .line 58
    .line 59
    .line 60
    move-result v3

    .line 61
    invoke-interface {v1, v0, v2, v3}, Ll/zm50;->c(FFF)V

    .line 62
    .line 63
    .line 64
    iget-object v0, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaOverlayView;->l:Ll/x20;

    .line 65
    .line 66
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 67
    .line 68
    .line 69
    move-result v0

    .line 70
    if-eqz v0, :cond_0

    .line 71
    .line 72
    iget-object p0, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaOverlayView;->l:Ll/x20;

    .line 73
    .line 74
    invoke-interface {p0}, Ll/x20;->call()V

    .line 75
    .line 76
    .line 77
    :cond_0
    return-void
.end method

.method public o()V
    .locals 9

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredWidth()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    int-to-float v0, v0

    .line 6
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredHeight()I

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    int-to-float v1, v1

    .line 11
    const/4 v2, 0x0

    .line 12
    cmpl-float v3, v0, v2

    .line 13
    .line 14
    if-eqz v3, :cond_5

    .line 15
    .line 16
    cmpl-float v3, v1, v2

    .line 17
    .line 18
    if-nez v3, :cond_0

    .line 19
    .line 20
    goto/16 :goto_2

    .line 21
    .line 22
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaOverlayView;->getAspectRatio()Ll/q11;

    .line 23
    .line 24
    .line 25
    move-result-object v3

    .line 26
    if-nez v3, :cond_1

    .line 27
    .line 28
    goto :goto_2

    .line 29
    :cond_1
    iget-object v4, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaOverlayView;->e:Landroid/graphics/RectF;

    .line 30
    .line 31
    invoke-virtual {v4}, Landroid/graphics/RectF;->width()F

    .line 32
    .line 33
    .line 34
    move-result v4

    .line 35
    cmpl-float v4, v4, v2

    .line 36
    .line 37
    if-eqz v4, :cond_2

    .line 38
    .line 39
    iget-object v4, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaOverlayView;->e:Landroid/graphics/RectF;

    .line 40
    .line 41
    invoke-virtual {v4}, Landroid/graphics/RectF;->height()F

    .line 42
    .line 43
    .line 44
    move-result v4

    .line 45
    cmpl-float v2, v4, v2

    .line 46
    .line 47
    if-eqz v2, :cond_2

    .line 48
    .line 49
    iget-object v2, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaOverlayView;->e:Landroid/graphics/RectF;

    .line 50
    .line 51
    invoke-virtual {v2}, Landroid/graphics/RectF;->width()F

    .line 52
    .line 53
    .line 54
    move-result v2

    .line 55
    iget-object v4, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaOverlayView;->e:Landroid/graphics/RectF;

    .line 56
    .line 57
    invoke-virtual {v4}, Landroid/graphics/RectF;->height()F

    .line 58
    .line 59
    .line 60
    move-result v4

    .line 61
    div-float/2addr v2, v4

    .line 62
    invoke-virtual {v3}, Ll/q11;->b()F

    .line 63
    .line 64
    .line 65
    move-result v4

    .line 66
    sub-float/2addr v2, v4

    .line 67
    invoke-static {v2}, Ljava/lang/Math;->abs(F)F

    .line 68
    .line 69
    .line 70
    move-result v2

    .line 71
    float-to-double v4, v2

    .line 72
    const-wide v6, 0x3f50624dd2f1a9fcL    # 0.001

    .line 73
    .line 74
    .line 75
    .line 76
    .line 77
    cmpg-double v2, v4, v6

    .line 78
    .line 79
    if-gez v2, :cond_2

    .line 80
    .line 81
    goto :goto_2

    .line 82
    :cond_2
    const/high16 v2, 0x3f000000    # 0.5f

    .line 83
    .line 84
    mul-float v4, v0, v2

    .line 85
    .line 86
    mul-float v5, v1, v2

    .line 87
    .line 88
    invoke-virtual {v3}, Ll/q11;->a()I

    .line 89
    .line 90
    .line 91
    move-result v6

    .line 92
    invoke-virtual {v3}, Ll/q11;->c()I

    .line 93
    .line 94
    .line 95
    move-result v7

    .line 96
    const v8, 0x3f666666    # 0.9f

    .line 97
    .line 98
    .line 99
    if-lt v6, v7, :cond_4

    .line 100
    .line 101
    invoke-virtual {v3}, Ll/q11;->d()Z

    .line 102
    .line 103
    .line 104
    move-result v6

    .line 105
    if-eqz v6, :cond_3

    .line 106
    .line 107
    cmpg-float v6, v0, v1

    .line 108
    .line 109
    if-gez v6, :cond_3

    .line 110
    .line 111
    goto :goto_0

    .line 112
    :cond_3
    mul-float/2addr v1, v8

    .line 113
    mul-float/2addr v1, v2

    .line 114
    invoke-virtual {v3}, Ll/q11;->b()F

    .line 115
    .line 116
    .line 117
    move-result v0

    .line 118
    mul-float/2addr v0, v1

    .line 119
    goto :goto_1

    .line 120
    :cond_4
    :goto_0
    mul-float/2addr v0, v8

    .line 121
    mul-float/2addr v0, v2

    .line 122
    invoke-virtual {v3}, Ll/q11;->b()F

    .line 123
    .line 124
    .line 125
    move-result v1

    .line 126
    div-float v1, v0, v1

    .line 127
    .line 128
    :goto_1
    iget-object p0, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaOverlayView;->e:Landroid/graphics/RectF;

    .line 129
    .line 130
    sub-float v2, v4, v0

    .line 131
    .line 132
    sub-float v3, v5, v1

    .line 133
    .line 134
    add-float/2addr v4, v0

    .line 135
    add-float/2addr v5, v1

    .line 136
    invoke-virtual {p0, v2, v3, v4, v5}, Landroid/graphics/RectF;->set(FFFF)V

    .line 137
    .line 138
    .line 139
    :cond_5
    :goto_2
    return-void
.end method

.method public onDraw(Landroid/graphics/Canvas;)V
    .locals 7

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaOverlayView;->h:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    int-to-float v4, v0

    .line 10
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    int-to-float v5, v0

    .line 15
    iget-object v6, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaOverlayView;->a:Landroid/graphics/Paint;

    .line 16
    .line 17
    const/4 v2, 0x0

    .line 18
    const/4 v3, 0x0

    .line 19
    move-object v1, p1

    .line 20
    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p0}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaOverlayView;->j()Z

    .line 24
    .line 25
    .line 26
    move-result p1

    .line 27
    if-eqz p1, :cond_0

    .line 28
    .line 29
    iget-object p1, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaOverlayView;->c:Ll/fwb;

    .line 30
    .line 31
    iget-object p0, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaOverlayView;->e:Landroid/graphics/RectF;

    .line 32
    .line 33
    invoke-virtual {p1, v1, p0}, Ll/fwb;->c(Landroid/graphics/Canvas;Landroid/graphics/RectF;)V

    .line 34
    .line 35
    .line 36
    :cond_0
    return-void
.end method

.method public onMeasure(II)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Landroid/view/View;->setMeasuredDimension(II)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 0

    const/4 p0, 0x1

    return p0
.end method

.method public setDrawOverlay(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaOverlayView;->h:Z

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setImageHeight(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaOverlayView;->k:I

    .line 2
    .line 3
    return-void
.end method

.method public setImageWidth(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaOverlayView;->j:I

    .line 2
    .line 3
    return-void
.end method

.method public setMaxScale(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaOverlayView;->m:F

    .line 2
    .line 3
    return-void
.end method

.method public setNewBoundsListener(Ll/zm50;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaOverlayView;->b:Ll/zm50;

    .line 2
    .line 3
    return-void
.end method

.method public setOnMovePartImageCenterListener(Ll/wm50;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaOverlayView;->i:Ll/wm50;

    .line 2
    .line 3
    return-void
.end method

.method public setOnTouchActionListener(Ll/x20;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaOverlayView;->l:Ll/x20;

    .line 2
    .line 3
    return-void
.end method

.class public Lcom/p1/mobile/android/ui/cropiwa/CropIwaDynamicOverlayView$a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/android/ui/cropiwa/CropIwaDynamicOverlayView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "a"
.end annotation


# instance fields
.field public a:Landroid/graphics/RectF;

.field public b:Landroid/graphics/PointF;

.field public c:Landroid/graphics/PointF;

.field public d:Landroid/graphics/PointF;

.field public final synthetic e:Lcom/p1/mobile/android/ui/cropiwa/CropIwaDynamicOverlayView;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/ui/cropiwa/CropIwaDynamicOverlayView;Landroid/graphics/PointF;Landroid/graphics/PointF;Landroid/graphics/PointF;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaDynamicOverlayView$a;->e:Lcom/p1/mobile/android/ui/cropiwa/CropIwaDynamicOverlayView;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object p2, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaDynamicOverlayView$a;->b:Landroid/graphics/PointF;

    .line 7
    .line 8
    iput-object p3, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaDynamicOverlayView$a;->c:Landroid/graphics/PointF;

    .line 9
    .line 10
    iput-object p4, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaDynamicOverlayView$a;->d:Landroid/graphics/PointF;

    .line 11
    .line 12
    new-instance p1, Landroid/graphics/RectF;

    .line 13
    .line 14
    invoke-direct {p1}, Landroid/graphics/RectF;-><init>()V

    .line 15
    .line 16
    .line 17
    iput-object p1, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaDynamicOverlayView$a;->a:Landroid/graphics/RectF;

    .line 18
    .line 19
    return-void
.end method


# virtual methods
.method public final a(FFFI)F
    .locals 2

    .line 1
    sub-float p0, p2, p3

    .line 2
    .line 3
    invoke-static {p0}, Ljava/lang/Math;->abs(F)F

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    int-to-float p4, p4

    .line 8
    cmpl-float p0, p0, p4

    .line 9
    .line 10
    const/4 v0, 0x0

    .line 11
    const/4 v1, 0x1

    .line 12
    if-lez p0, :cond_0

    .line 13
    .line 14
    move p0, v1

    .line 15
    goto :goto_0

    .line 16
    :cond_0
    move p0, v0

    .line 17
    :goto_0
    cmpl-float p1, p3, p1

    .line 18
    .line 19
    if-lez p1, :cond_2

    .line 20
    .line 21
    sub-float p1, p3, p4

    .line 22
    .line 23
    cmpg-float p3, p2, p3

    .line 24
    .line 25
    if-gez p3, :cond_1

    .line 26
    .line 27
    :goto_1
    move v0, v1

    .line 28
    :cond_1
    and-int/2addr p0, v0

    .line 29
    goto :goto_2

    .line 30
    :cond_2
    add-float p1, p3, p4

    .line 31
    .line 32
    cmpl-float p3, p2, p3

    .line 33
    .line 34
    if-lez p3, :cond_1

    .line 35
    .line 36
    goto :goto_1

    .line 37
    :goto_2
    if-eqz p0, :cond_3

    .line 38
    .line 39
    return p2

    .line 40
    :cond_3
    return p1
.end method

.method public b(FF)Z
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaDynamicOverlayView$a;->a:Landroid/graphics/RectF;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaDynamicOverlayView$a;->b:Landroid/graphics/PointF;

    .line 4
    .line 5
    iget v2, v1, Landroid/graphics/PointF;->x:F

    .line 6
    .line 7
    iget v1, v1, Landroid/graphics/PointF;->y:F

    .line 8
    .line 9
    invoke-virtual {v0, v2, v1, v2, v1}, Landroid/graphics/RectF;->set(FFFF)V

    .line 10
    .line 11
    .line 12
    invoke-static {}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaDynamicOverlayView;->p()F

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    iget-object v1, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaDynamicOverlayView$a;->a:Landroid/graphics/RectF;

    .line 17
    .line 18
    invoke-static {v0, v1}, Ll/gwb;->f(FLandroid/graphics/RectF;)Landroid/graphics/RectF;

    .line 19
    .line 20
    .line 21
    iget-object p0, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaDynamicOverlayView$a;->a:Landroid/graphics/RectF;

    .line 22
    .line 23
    invoke-virtual {p0, p1, p2}, Landroid/graphics/RectF;->contains(FF)Z

    .line 24
    .line 25
    .line 26
    move-result p0

    .line 27
    return p0
.end method

.method public c()Z
    .locals 7

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaDynamicOverlayView$a;->b:Landroid/graphics/PointF;

    .line 2
    .line 3
    iget v1, v0, Landroid/graphics/PointF;->x:F

    .line 4
    .line 5
    iget-object v2, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaDynamicOverlayView$a;->d:Landroid/graphics/PointF;

    .line 6
    .line 7
    iget v3, v2, Landroid/graphics/PointF;->x:F

    .line 8
    .line 9
    cmpl-float v4, v1, v3

    .line 10
    .line 11
    if-nez v4, :cond_0

    .line 12
    .line 13
    iget v4, v0, Landroid/graphics/PointF;->y:F

    .line 14
    .line 15
    iget v5, v2, Landroid/graphics/PointF;->y:F

    .line 16
    .line 17
    cmpg-float v5, v4, v5

    .line 18
    .line 19
    if-gez v5, :cond_0

    .line 20
    .line 21
    iget-object v5, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaDynamicOverlayView$a;->c:Landroid/graphics/PointF;

    .line 22
    .line 23
    iget v6, v5, Landroid/graphics/PointF;->y:F

    .line 24
    .line 25
    cmpl-float v4, v4, v6

    .line 26
    .line 27
    if-nez v4, :cond_0

    .line 28
    .line 29
    iget v4, v5, Landroid/graphics/PointF;->x:F

    .line 30
    .line 31
    cmpg-float v4, v1, v4

    .line 32
    .line 33
    if-ltz v4, :cond_1

    .line 34
    .line 35
    :cond_0
    cmpl-float v3, v1, v3

    .line 36
    .line 37
    if-nez v3, :cond_2

    .line 38
    .line 39
    iget v0, v0, Landroid/graphics/PointF;->y:F

    .line 40
    .line 41
    iget v2, v2, Landroid/graphics/PointF;->y:F

    .line 42
    .line 43
    cmpl-float v2, v0, v2

    .line 44
    .line 45
    if-lez v2, :cond_2

    .line 46
    .line 47
    iget-object p0, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaDynamicOverlayView$a;->c:Landroid/graphics/PointF;

    .line 48
    .line 49
    iget v2, p0, Landroid/graphics/PointF;->y:F

    .line 50
    .line 51
    cmpl-float v0, v0, v2

    .line 52
    .line 53
    if-nez v0, :cond_2

    .line 54
    .line 55
    iget p0, p0, Landroid/graphics/PointF;->x:F

    .line 56
    .line 57
    cmpl-float p0, v1, p0

    .line 58
    .line 59
    if-lez p0, :cond_2

    .line 60
    .line 61
    :cond_1
    const/4 p0, 0x1

    .line 62
    return p0

    .line 63
    :cond_2
    const/4 p0, 0x0

    .line 64
    return p0
.end method

.method public d()Z
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaDynamicOverlayView$a;->b:Landroid/graphics/PointF;

    .line 2
    .line 3
    iget v0, v0, Landroid/graphics/PointF;->x:F

    .line 4
    .line 5
    iget-object v1, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaDynamicOverlayView$a;->c:Landroid/graphics/PointF;

    .line 6
    .line 7
    iget v1, v1, Landroid/graphics/PointF;->x:F

    .line 8
    .line 9
    sub-float/2addr v0, v1

    .line 10
    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    iget-object p0, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaDynamicOverlayView$a;->e:Lcom/p1/mobile/android/ui/cropiwa/CropIwaDynamicOverlayView;

    .line 15
    .line 16
    iget-object p0, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaOverlayView;->g:Ll/bwb;

    .line 17
    .line 18
    invoke-virtual {p0}, Ll/bwb;->n()I

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    int-to-float p0, p0

    .line 23
    cmpl-float p0, v0, p0

    .line 24
    .line 25
    if-ltz p0, :cond_0

    .line 26
    .line 27
    const/4 p0, 0x1

    .line 28
    return p0

    .line 29
    :cond_0
    const/4 p0, 0x0

    .line 30
    return p0
.end method

.method public e(FF)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaDynamicOverlayView$a;->b:Landroid/graphics/PointF;

    .line 2
    .line 3
    iget v0, v0, Landroid/graphics/PointF;->x:F

    .line 4
    .line 5
    iget-object v1, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaDynamicOverlayView$a;->c:Landroid/graphics/PointF;

    .line 6
    .line 7
    iget v1, v1, Landroid/graphics/PointF;->x:F

    .line 8
    .line 9
    iget-object v2, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaDynamicOverlayView$a;->e:Lcom/p1/mobile/android/ui/cropiwa/CropIwaDynamicOverlayView;

    .line 10
    .line 11
    iget-object v2, v2, Lcom/p1/mobile/android/ui/cropiwa/CropIwaOverlayView;->g:Ll/bwb;

    .line 12
    .line 13
    invoke-virtual {v2}, Ll/bwb;->n()I

    .line 14
    .line 15
    .line 16
    move-result v2

    .line 17
    invoke-virtual {p0, v0, p1, v1, v2}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaDynamicOverlayView$a;->a(FFFI)F

    .line 18
    .line 19
    .line 20
    move-result p1

    .line 21
    iget-object v0, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaDynamicOverlayView$a;->b:Landroid/graphics/PointF;

    .line 22
    .line 23
    iput p1, v0, Landroid/graphics/PointF;->x:F

    .line 24
    .line 25
    iget-object v1, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaDynamicOverlayView$a;->d:Landroid/graphics/PointF;

    .line 26
    .line 27
    iput p1, v1, Landroid/graphics/PointF;->x:F

    .line 28
    .line 29
    iget p1, v0, Landroid/graphics/PointF;->y:F

    .line 30
    .line 31
    iget v0, v1, Landroid/graphics/PointF;->y:F

    .line 32
    .line 33
    iget-object v1, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaDynamicOverlayView$a;->e:Lcom/p1/mobile/android/ui/cropiwa/CropIwaDynamicOverlayView;

    .line 34
    .line 35
    iget-object v1, v1, Lcom/p1/mobile/android/ui/cropiwa/CropIwaOverlayView;->g:Ll/bwb;

    .line 36
    .line 37
    invoke-virtual {v1}, Ll/bwb;->m()I

    .line 38
    .line 39
    .line 40
    move-result v1

    .line 41
    invoke-virtual {p0, p1, p2, v0, v1}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaDynamicOverlayView$a;->a(FFFI)F

    .line 42
    .line 43
    .line 44
    move-result p1

    .line 45
    iget-object p2, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaDynamicOverlayView$a;->b:Landroid/graphics/PointF;

    .line 46
    .line 47
    iput p1, p2, Landroid/graphics/PointF;->y:F

    .line 48
    .line 49
    iget-object p0, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaDynamicOverlayView$a;->c:Landroid/graphics/PointF;

    .line 50
    .line 51
    iput p1, p0, Landroid/graphics/PointF;->y:F

    .line 52
    .line 53
    return-void
.end method

.method public f()F
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaDynamicOverlayView$a;->b:Landroid/graphics/PointF;

    .line 2
    .line 3
    iget p0, p0, Landroid/graphics/PointF;->x:F

    .line 4
    .line 5
    return p0
.end method

.method public g()F
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaDynamicOverlayView$a;->b:Landroid/graphics/PointF;

    .line 2
    .line 3
    iget p0, p0, Landroid/graphics/PointF;->y:F

    .line 4
    .line 5
    return p0
.end method

.method public toString()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaDynamicOverlayView$a;->b:Landroid/graphics/PointF;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/graphics/PointF;->toString()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

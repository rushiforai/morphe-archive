.class public Lcom/p1/mobile/android/ui/cropiwa/CropIwaNewUIDynamicOverlayView$a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/android/ui/cropiwa/CropIwaNewUIDynamicOverlayView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "a"
.end annotation


# instance fields
.field public a:Landroid/graphics/PointF;

.field public b:Landroid/graphics/PointF;

.field public c:Landroid/graphics/PointF;

.field public final synthetic d:Lcom/p1/mobile/android/ui/cropiwa/CropIwaNewUIDynamicOverlayView;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/ui/cropiwa/CropIwaNewUIDynamicOverlayView;Landroid/graphics/PointF;Landroid/graphics/PointF;Landroid/graphics/PointF;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaNewUIDynamicOverlayView$a;->d:Lcom/p1/mobile/android/ui/cropiwa/CropIwaNewUIDynamicOverlayView;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object p2, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaNewUIDynamicOverlayView$a;->a:Landroid/graphics/PointF;

    .line 7
    .line 8
    iput-object p3, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaNewUIDynamicOverlayView$a;->b:Landroid/graphics/PointF;

    .line 9
    .line 10
    iput-object p4, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaNewUIDynamicOverlayView$a;->c:Landroid/graphics/PointF;

    .line 11
    .line 12
    return-void
.end method

.method public static bridge synthetic a(Lcom/p1/mobile/android/ui/cropiwa/CropIwaNewUIDynamicOverlayView$a;)Landroid/graphics/PointF;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaNewUIDynamicOverlayView$a;->c:Landroid/graphics/PointF;

    return-object p0
.end method


# virtual methods
.method public final b(FFFI)F
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

.method public c(FF)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaNewUIDynamicOverlayView$a;->a:Landroid/graphics/PointF;

    .line 2
    .line 3
    iget v0, v0, Landroid/graphics/PointF;->x:F

    .line 4
    .line 5
    iget-object v1, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaNewUIDynamicOverlayView$a;->b:Landroid/graphics/PointF;

    .line 6
    .line 7
    iget v1, v1, Landroid/graphics/PointF;->x:F

    .line 8
    .line 9
    iget-object v2, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaNewUIDynamicOverlayView$a;->d:Lcom/p1/mobile/android/ui/cropiwa/CropIwaNewUIDynamicOverlayView;

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
    invoke-virtual {p0, v0, p1, v1, v2}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaNewUIDynamicOverlayView$a;->b(FFFI)F

    .line 18
    .line 19
    .line 20
    move-result p1

    .line 21
    iget-object v0, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaNewUIDynamicOverlayView$a;->a:Landroid/graphics/PointF;

    .line 22
    .line 23
    iput p1, v0, Landroid/graphics/PointF;->x:F

    .line 24
    .line 25
    iget-object v1, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaNewUIDynamicOverlayView$a;->c:Landroid/graphics/PointF;

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
    iget-object v1, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaNewUIDynamicOverlayView$a;->d:Lcom/p1/mobile/android/ui/cropiwa/CropIwaNewUIDynamicOverlayView;

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
    invoke-virtual {p0, p1, p2, v0, v1}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaNewUIDynamicOverlayView$a;->b(FFFI)F

    .line 42
    .line 43
    .line 44
    move-result p1

    .line 45
    iget-object p2, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaNewUIDynamicOverlayView$a;->a:Landroid/graphics/PointF;

    .line 46
    .line 47
    iput p1, p2, Landroid/graphics/PointF;->y:F

    .line 48
    .line 49
    iget-object p0, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaNewUIDynamicOverlayView$a;->b:Landroid/graphics/PointF;

    .line 50
    .line 51
    iput p1, p0, Landroid/graphics/PointF;->y:F

    .line 52
    .line 53
    return-void
.end method

.method public d()F
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaNewUIDynamicOverlayView$a;->a:Landroid/graphics/PointF;

    .line 2
    .line 3
    iget p0, p0, Landroid/graphics/PointF;->x:F

    .line 4
    .line 5
    return p0
.end method

.method public e()F
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaNewUIDynamicOverlayView$a;->a:Landroid/graphics/PointF;

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
    iget-object p0, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaNewUIDynamicOverlayView$a;->a:Landroid/graphics/PointF;

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

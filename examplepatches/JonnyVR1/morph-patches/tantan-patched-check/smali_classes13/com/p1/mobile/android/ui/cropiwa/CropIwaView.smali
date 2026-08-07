.class public Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;
.super Landroid/widget/FrameLayout;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/android/ui/cropiwa/CropIwaView$f;,
        Lcom/p1/mobile/android/ui/cropiwa/CropIwaView$b;,
        Lcom/p1/mobile/android/ui/cropiwa/CropIwaView$a;,
        Lcom/p1/mobile/android/ui/cropiwa/CropIwaView$d;,
        Lcom/p1/mobile/android/ui/cropiwa/CropIwaView$e;,
        Lcom/p1/mobile/android/ui/cropiwa/CropIwaView$c;
    }
.end annotation


# instance fields
.field public a:Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;

.field public b:Lcom/p1/mobile/android/ui/cropiwa/CropIwaOverlayView;

.field public c:Ll/bwb;

.field public d:Ll/wvb;

.field public e:Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView$b;

.field public f:Landroid/net/Uri;

.field public g:Ll/ktv;

.field public h:Lcom/p1/mobile/android/ui/cropiwa/CropIwaView$d;

.field public i:Lcom/p1/mobile/android/ui/cropiwa/CropIwaView$e;

.field public j:Lcom/p1/mobile/android/ui/cropiwa/CropIwaView$c;

.field public k:Lcom/p1/mobile/android/ui/cropiwa/image/CropIwaResultReceiver;

.field public l:Ll/tvb$a;

.field public m:Z

.field public n:I

.field public o:Ll/x20;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;->o(Landroid/util/AttributeSet;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 9
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 10
    invoke-virtual {p0, p2}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;->o(Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 11
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 12
    invoke-virtual {p0, p2}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;->o(Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .locals 0
    .annotation build Landroid/annotation/TargetApi;
        value = 0x15
    .end annotation

    .line 13
    invoke-direct {p0, p1, p2, p3, p4}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 14
    invoke-virtual {p0, p2}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;->o(Landroid/util/AttributeSet;)V

    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;->t()V

    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;Landroid/graphics/RectF;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;->u(Landroid/graphics/RectF;)V

    return-void
.end method

.method public static synthetic c(Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;->s()V

    return-void
.end method

.method public static bridge synthetic d(Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;)Lcom/p1/mobile/android/ui/cropiwa/CropIwaView$c;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;->j:Lcom/p1/mobile/android/ui/cropiwa/CropIwaView$c;

    return-object p0
.end method

.method public static bridge synthetic e(Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;)Lcom/p1/mobile/android/ui/cropiwa/CropIwaView$d;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;->h:Lcom/p1/mobile/android/ui/cropiwa/CropIwaView$d;

    return-object p0
.end method

.method public static bridge synthetic f(Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;)Ll/tvb$a;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;->l:Ll/tvb$a;

    return-object p0
.end method

.method public static bridge synthetic g(Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;)Landroid/net/Uri;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;->f:Landroid/net/Uri;

    return-object p0
.end method

.method public static bridge synthetic h(Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;)Lcom/p1/mobile/android/ui/cropiwa/CropIwaView$e;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;->i:Lcom/p1/mobile/android/ui/cropiwa/CropIwaView$e;

    return-object p0
.end method

.method public static bridge synthetic i(Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;)Ll/bwb;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;->c:Ll/bwb;

    return-object p0
.end method

.method public static bridge synthetic j(Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;)Lcom/p1/mobile/android/ui/cropiwa/CropIwaOverlayView;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;->b:Lcom/p1/mobile/android/ui/cropiwa/CropIwaOverlayView;

    return-object p0
.end method

.method public static bridge synthetic k(Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;->q()V

    return-void
.end method


# virtual methods
.method public getCropRect()Landroid/graphics/RectF;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;->b:Lcom/p1/mobile/android/ui/cropiwa/CropIwaOverlayView;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaOverlayView;->getCropRect()Landroid/graphics/RectF;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getImageRect()Landroid/graphics/RectF;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;->a:Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;->u()Landroid/graphics/RectF;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getImageViewRotation()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;->n:I

    .line 2
    .line 3
    return p0
.end method

.method public getIwaImageMatrix()Landroid/graphics/Matrix;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;->a:Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;->getImageMatrix()Landroid/graphics/Matrix;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public invalidate()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;->a:Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/View;->invalidate()V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;->b:Lcom/p1/mobile/android/ui/cropiwa/CropIwaOverlayView;

    .line 7
    .line 8
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public l()Ll/wvb;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;->d:Ll/wvb;

    .line 2
    .line 3
    return-object p0
.end method

.method public m()Ll/bwb;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;->c:Ll/bwb;

    .line 2
    .line 3
    return-object p0
.end method

.method public n(Ll/ewb;)V
    .locals 10

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;->m:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;->a:Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;

    .line 7
    .line 8
    invoke-virtual {v0}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;->u()Landroid/graphics/RectF;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    iget-object v1, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;->a:Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;

    .line 13
    .line 14
    invoke-virtual {v1}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;->u()Landroid/graphics/RectF;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    iget-object v2, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;->b:Lcom/p1/mobile/android/ui/cropiwa/CropIwaOverlayView;

    .line 19
    .line 20
    invoke-virtual {v2}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaOverlayView;->getCropRect()Landroid/graphics/RectF;

    .line 21
    .line 22
    .line 23
    move-result-object v2

    .line 24
    invoke-static {v0, v1, v2}, Ll/qvb;->b(Landroid/graphics/RectF;Landroid/graphics/RectF;Landroid/graphics/RectF;)Ll/qvb;

    .line 25
    .line 26
    .line 27
    move-result-object v5

    .line 28
    iget-object v0, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;->c:Ll/bwb;

    .line 29
    .line 30
    invoke-virtual {v0}, Ll/bwb;->j()Ll/fwb;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    invoke-virtual {v0}, Ll/fwb;->g()Lcom/p1/mobile/android/ui/cropiwa/shape/CropIwaShapeMask;

    .line 35
    .line 36
    .line 37
    move-result-object v6

    .line 38
    invoke-static {}, Ll/tvb;->h()Ll/tvb;

    .line 39
    .line 40
    .line 41
    move-result-object v3

    .line 42
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 43
    .line 44
    .line 45
    move-result-object v4

    .line 46
    iget-object v7, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;->f:Landroid/net/Uri;

    .line 47
    .line 48
    move-object v9, p0

    .line 49
    move-object v8, p1

    .line 50
    invoke-virtual/range {v3 .. v9}, Ll/tvb;->b(Landroid/content/Context;Ll/qvb;Lcom/p1/mobile/android/ui/cropiwa/shape/CropIwaShapeMask;Landroid/net/Uri;Ll/ewb;Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;)V

    .line 51
    .line 52
    .line 53
    return-void
.end method

.method public final o(Landroid/util/AttributeSet;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0, p1}, Ll/wvb;->d(Landroid/content/Context;Landroid/util/AttributeSet;)Ll/wvb;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;->d:Ll/wvb;

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;->p()V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-static {v0, p1}, Ll/bwb;->d(Landroid/content/Context;Landroid/util/AttributeSet;)Ll/bwb;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    iput-object p1, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;->c:Ll/bwb;

    .line 23
    .line 24
    new-instance v0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaView$f;

    .line 25
    .line 26
    const/4 v1, 0x0

    .line 27
    invoke-direct {v0, p0, v1}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaView$f;-><init>(Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;Ll/kwb;)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {p1, v0}, Ll/bwb;->a(Ll/dw5;)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {p0}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;->q()V

    .line 34
    .line 35
    .line 36
    iget-object p1, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;->d:Ll/wvb;

    .line 37
    .line 38
    new-instance v0, Ll/hwb;

    .line 39
    .line 40
    invoke-direct {v0, p0}, Ll/hwb;-><init>(Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;)V

    .line 41
    .line 42
    .line 43
    invoke-virtual {p1, v0}, Ll/wvb;->a(Ll/dw5;)V

    .line 44
    .line 45
    .line 46
    new-instance p1, Lcom/p1/mobile/android/ui/cropiwa/image/CropIwaResultReceiver;

    .line 47
    .line 48
    invoke-direct {p1}, Lcom/p1/mobile/android/ui/cropiwa/image/CropIwaResultReceiver;-><init>()V

    .line 49
    .line 50
    .line 51
    iput-object p1, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;->k:Lcom/p1/mobile/android/ui/cropiwa/image/CropIwaResultReceiver;

    .line 52
    .line 53
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    invoke-virtual {p1, v0}, Lcom/p1/mobile/android/ui/cropiwa/image/CropIwaResultReceiver;->register(Landroid/content/Context;)V

    .line 58
    .line 59
    .line 60
    iget-object p1, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;->k:Lcom/p1/mobile/android/ui/cropiwa/image/CropIwaResultReceiver;

    .line 61
    .line 62
    new-instance v0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaView$b;

    .line 63
    .line 64
    invoke-direct {v0, p0, v1}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaView$b;-><init>(Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;Ll/kwb;)V

    .line 65
    .line 66
    .line 67
    invoke-virtual {p1, v0}, Lcom/p1/mobile/android/ui/cropiwa/image/CropIwaResultReceiver;->setListener(Lcom/p1/mobile/android/ui/cropiwa/image/CropIwaResultReceiver$a;)V

    .line 68
    .line 69
    .line 70
    return-void
.end method

.method public onDetachedFromWindow()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onDetachedFromWindow()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;->y()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public onInterceptTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 2

    .line 1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    iget-object p0, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;->e:Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView$b;

    .line 9
    .line 10
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView$b;->a(Landroid/view/MotionEvent;)V

    .line 11
    .line 12
    .line 13
    return v1

    .line 14
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;->b:Lcom/p1/mobile/android/ui/cropiwa/CropIwaOverlayView;

    .line 15
    .line 16
    invoke-virtual {p1}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaOverlayView;->g()Z

    .line 17
    .line 18
    .line 19
    move-result p1

    .line 20
    if-nez p1, :cond_2

    .line 21
    .line 22
    iget-object p1, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;->b:Lcom/p1/mobile/android/ui/cropiwa/CropIwaOverlayView;

    .line 23
    .line 24
    invoke-virtual {p1}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaOverlayView;->e()Z

    .line 25
    .line 26
    .line 27
    move-result p1

    .line 28
    if-nez p1, :cond_2

    .line 29
    .line 30
    iget-object p0, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;->b:Lcom/p1/mobile/android/ui/cropiwa/CropIwaOverlayView;

    .line 31
    .line 32
    invoke-virtual {p0}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaOverlayView;->i()Z

    .line 33
    .line 34
    .line 35
    move-result p0

    .line 36
    if-eqz p0, :cond_1

    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_1
    const/4 p0, 0x1

    .line 40
    return p0

    .line 41
    :cond_2
    :goto_0
    return v1
.end method

.method public onMeasure(II)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;->a:Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;

    .line 2
    .line 3
    invoke-virtual {v0, p1, p2}, Landroid/view/View;->measure(II)V

    .line 4
    .line 5
    .line 6
    iget-object p1, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;->b:Lcom/p1/mobile/android/ui/cropiwa/CropIwaOverlayView;

    .line 7
    .line 8
    iget-object p2, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;->a:Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;

    .line 9
    .line 10
    invoke-virtual {p2}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;->y()I

    .line 11
    .line 12
    .line 13
    move-result p2

    .line 14
    invoke-virtual {p1, p2}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaOverlayView;->setImageWidth(I)V

    .line 15
    .line 16
    .line 17
    iget-object p1, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;->b:Lcom/p1/mobile/android/ui/cropiwa/CropIwaOverlayView;

    .line 18
    .line 19
    iget-object p2, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;->a:Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;

    .line 20
    .line 21
    invoke-virtual {p2}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;->x()I

    .line 22
    .line 23
    .line 24
    move-result p2

    .line 25
    invoke-virtual {p1, p2}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaOverlayView;->setImageHeight(I)V

    .line 26
    .line 27
    .line 28
    iget-object p1, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;->b:Lcom/p1/mobile/android/ui/cropiwa/CropIwaOverlayView;

    .line 29
    .line 30
    iget-object p2, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;->a:Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;

    .line 31
    .line 32
    invoke-virtual {p2}, Landroid/view/View;->getMeasuredWidthAndState()I

    .line 33
    .line 34
    .line 35
    move-result p2

    .line 36
    iget-object v0, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;->a:Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;

    .line 37
    .line 38
    invoke-virtual {v0}, Landroid/view/View;->getMeasuredHeightAndState()I

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    invoke-virtual {p1, p2, v0}, Landroid/view/View;->measure(II)V

    .line 43
    .line 44
    .line 45
    iget-object p1, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;->a:Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;

    .line 46
    .line 47
    invoke-virtual {p1}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;->G()V

    .line 48
    .line 49
    .line 50
    iget-object p1, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;->a:Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;

    .line 51
    .line 52
    invoke-virtual {p1}, Landroid/view/View;->getMeasuredWidthAndState()I

    .line 53
    .line 54
    .line 55
    move-result p1

    .line 56
    iget-object p2, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;->a:Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;

    .line 57
    .line 58
    invoke-virtual {p2}, Landroid/view/View;->getMeasuredHeightAndState()I

    .line 59
    .line 60
    .line 61
    move-result p2

    .line 62
    invoke-virtual {p0, p1, p2}, Landroid/view/View;->setMeasuredDimension(II)V

    .line 63
    .line 64
    .line 65
    return-void
.end method

.method public onSizeChanged(IIII)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3, p4}, Landroid/view/View;->onSizeChanged(IIII)V

    .line 2
    .line 3
    .line 4
    iget-object p3, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;->g:Ll/ktv;

    .line 5
    .line 6
    if-eqz p3, :cond_2

    .line 7
    .line 8
    iget-object p3, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;->d:Ll/wvb;

    .line 9
    .line 10
    invoke-virtual {p3}, Ll/wvb;->f()I

    .line 11
    .line 12
    .line 13
    move-result p3

    .line 14
    iget-object p4, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;->d:Ll/wvb;

    .line 15
    .line 16
    invoke-virtual {p4}, Ll/wvb;->g()I

    .line 17
    .line 18
    .line 19
    move-result p4

    .line 20
    mul-int/2addr p3, p4

    .line 21
    if-eqz p3, :cond_1

    .line 22
    .line 23
    iget-object p3, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;->d:Ll/wvb;

    .line 24
    .line 25
    invoke-virtual {p3}, Ll/wvb;->g()I

    .line 26
    .line 27
    .line 28
    move-result p3

    .line 29
    if-gt p3, p1, :cond_1

    .line 30
    .line 31
    iget-object p3, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;->d:Ll/wvb;

    .line 32
    .line 33
    invoke-virtual {p3}, Ll/wvb;->f()I

    .line 34
    .line 35
    .line 36
    move-result p3

    .line 37
    if-gt p3, p2, :cond_1

    .line 38
    .line 39
    iget-object p3, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;->d:Ll/wvb;

    .line 40
    .line 41
    invoke-virtual {p3}, Ll/wvb;->f()I

    .line 42
    .line 43
    .line 44
    move-result p3

    .line 45
    iget-object p4, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;->d:Ll/wvb;

    .line 46
    .line 47
    invoke-virtual {p4}, Ll/wvb;->g()I

    .line 48
    .line 49
    .line 50
    move-result p4

    .line 51
    mul-int/2addr p3, p4

    .line 52
    mul-int p4, p1, p2

    .line 53
    .line 54
    if-le p3, p4, :cond_0

    .line 55
    .line 56
    goto :goto_0

    .line 57
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;->g:Ll/ktv;

    .line 58
    .line 59
    iget-object p2, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;->d:Ll/wvb;

    .line 60
    .line 61
    invoke-virtual {p2}, Ll/wvb;->g()I

    .line 62
    .line 63
    .line 64
    move-result p2

    .line 65
    iget-object p3, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;->d:Ll/wvb;

    .line 66
    .line 67
    invoke-virtual {p3}, Ll/wvb;->f()I

    .line 68
    .line 69
    .line 70
    move-result p3

    .line 71
    invoke-virtual {p1, p2, p3}, Ll/ktv;->a(II)V

    .line 72
    .line 73
    .line 74
    goto :goto_1

    .line 75
    :cond_1
    :goto_0
    iget-object p3, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;->g:Ll/ktv;

    .line 76
    .line 77
    invoke-virtual {p3, p1, p2}, Ll/ktv;->a(II)V

    .line 78
    .line 79
    .line 80
    :goto_1
    iget-object p1, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;->g:Ll/ktv;

    .line 81
    .line 82
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 83
    .line 84
    .line 85
    move-result-object p0

    .line 86
    invoke-virtual {p1, p0}, Ll/ktv;->b(Landroid/content/Context;)V

    .line 87
    .line 88
    .line 89
    :cond_2
    return-void
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;->o:Ll/x20;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-interface {v0}, Ll/x20;->call()V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;->e:Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView$b;

    .line 9
    .line 10
    invoke-virtual {v0, p1}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView$b;->b(Landroid/view/MotionEvent;)V

    .line 11
    .line 12
    .line 13
    invoke-super {p0, p1}, Landroid/view/View;->onTouchEvent(Landroid/view/MotionEvent;)Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    return p0
.end method

.method public final p()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;->d:Ll/wvb;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;

    .line 6
    .line 7
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    iget-object v2, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;->d:Ll/wvb;

    .line 12
    .line 13
    invoke-direct {v0, v1, v2}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;-><init>(Landroid/content/Context;Ll/wvb;)V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;->a:Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;

    .line 17
    .line 18
    iget-object v1, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;->d:Ll/wvb;

    .line 19
    .line 20
    invoke-virtual {v1}, Ll/wvb;->e()I

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundColor(I)V

    .line 25
    .line 26
    .line 27
    iget-object v0, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;->a:Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;

    .line 28
    .line 29
    invoke-virtual {v0}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;->v()Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView$b;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    iput-object v0, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;->e:Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView$b;

    .line 34
    .line 35
    iget-object v0, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;->a:Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;

    .line 36
    .line 37
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 38
    .line 39
    .line 40
    return-void

    .line 41
    :cond_0
    const-string p0, "imageConfig must be initialized before calling this method"

    .line 42
    .line 43
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    return-void
.end method

.method public final q()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;->a:Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;

    .line 2
    .line 3
    if-eqz v0, :cond_6

    .line 4
    .line 5
    iget-object v0, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;->c:Ll/bwb;

    .line 6
    .line 7
    if-eqz v0, :cond_6

    .line 8
    .line 9
    invoke-virtual {v0}, Ll/bwb;->q()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    new-instance v0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaDynamicOverlayView;

    .line 16
    .line 17
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    iget-object v2, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;->c:Ll/bwb;

    .line 22
    .line 23
    invoke-direct {v0, v1, v2}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaDynamicOverlayView;-><init>(Landroid/content/Context;Ll/bwb;)V

    .line 24
    .line 25
    .line 26
    iput-object v0, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;->b:Lcom/p1/mobile/android/ui/cropiwa/CropIwaOverlayView;

    .line 27
    .line 28
    goto/16 :goto_0

    .line 29
    .line 30
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;->c:Ll/bwb;

    .line 31
    .line 32
    invoke-virtual {v0}, Ll/bwb;->v()Z

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    if-eqz v0, :cond_1

    .line 37
    .line 38
    new-instance v0, Lcom/p1/mobile/android/ui/cropiwa/CropIwa43OverlayView;

    .line 39
    .line 40
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    iget-object v2, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;->c:Ll/bwb;

    .line 45
    .line 46
    invoke-direct {v0, v1, v2}, Lcom/p1/mobile/android/ui/cropiwa/CropIwa43OverlayView;-><init>(Landroid/content/Context;Ll/bwb;)V

    .line 47
    .line 48
    .line 49
    iput-object v0, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;->b:Lcom/p1/mobile/android/ui/cropiwa/CropIwaOverlayView;

    .line 50
    .line 51
    goto :goto_0

    .line 52
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;->c:Ll/bwb;

    .line 53
    .line 54
    invoke-virtual {v0}, Ll/bwb;->r()Z

    .line 55
    .line 56
    .line 57
    move-result v0

    .line 58
    if-eqz v0, :cond_2

    .line 59
    .line 60
    new-instance v0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaNewProfileOverlayView;

    .line 61
    .line 62
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 63
    .line 64
    .line 65
    move-result-object v1

    .line 66
    iget-object v2, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;->c:Ll/bwb;

    .line 67
    .line 68
    invoke-direct {v0, v1, v2}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaNewProfileOverlayView;-><init>(Landroid/content/Context;Ll/bwb;)V

    .line 69
    .line 70
    .line 71
    iput-object v0, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;->b:Lcom/p1/mobile/android/ui/cropiwa/CropIwaOverlayView;

    .line 72
    .line 73
    goto :goto_0

    .line 74
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;->c:Ll/bwb;

    .line 75
    .line 76
    invoke-virtual {v0}, Ll/bwb;->t()Z

    .line 77
    .line 78
    .line 79
    move-result v0

    .line 80
    if-eqz v0, :cond_3

    .line 81
    .line 82
    new-instance v0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaDynamicRatioOverlayView;

    .line 83
    .line 84
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 85
    .line 86
    .line 87
    move-result-object v1

    .line 88
    iget-object v2, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;->c:Ll/bwb;

    .line 89
    .line 90
    invoke-direct {v0, v1, v2}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaDynamicRatioOverlayView;-><init>(Landroid/content/Context;Ll/bwb;)V

    .line 91
    .line 92
    .line 93
    iput-object v0, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;->b:Lcom/p1/mobile/android/ui/cropiwa/CropIwaOverlayView;

    .line 94
    .line 95
    goto :goto_0

    .line 96
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;->c:Ll/bwb;

    .line 97
    .line 98
    invoke-virtual {v0}, Ll/bwb;->s()Z

    .line 99
    .line 100
    .line 101
    move-result v0

    .line 102
    if-eqz v0, :cond_4

    .line 103
    .line 104
    new-instance v0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaNewUIDynamicOverlayView;

    .line 105
    .line 106
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 107
    .line 108
    .line 109
    move-result-object v1

    .line 110
    iget-object v2, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;->c:Ll/bwb;

    .line 111
    .line 112
    invoke-direct {v0, v1, v2}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaNewUIDynamicOverlayView;-><init>(Landroid/content/Context;Ll/bwb;)V

    .line 113
    .line 114
    .line 115
    iput-object v0, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;->b:Lcom/p1/mobile/android/ui/cropiwa/CropIwaOverlayView;

    .line 116
    .line 117
    goto :goto_0

    .line 118
    :cond_4
    iget-object v0, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;->c:Ll/bwb;

    .line 119
    .line 120
    invoke-virtual {v0}, Ll/bwb;->u()Z

    .line 121
    .line 122
    .line 123
    move-result v0

    .line 124
    if-eqz v0, :cond_5

    .line 125
    .line 126
    new-instance v0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaKanKanOverlayView;

    .line 127
    .line 128
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 129
    .line 130
    .line 131
    move-result-object v1

    .line 132
    iget-object v2, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;->c:Ll/bwb;

    .line 133
    .line 134
    invoke-direct {v0, v1, v2}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaKanKanOverlayView;-><init>(Landroid/content/Context;Ll/bwb;)V

    .line 135
    .line 136
    .line 137
    iput-object v0, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;->b:Lcom/p1/mobile/android/ui/cropiwa/CropIwaOverlayView;

    .line 138
    .line 139
    goto :goto_0

    .line 140
    :cond_5
    new-instance v0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaOverlayView;

    .line 141
    .line 142
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 143
    .line 144
    .line 145
    move-result-object v1

    .line 146
    iget-object v2, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;->c:Ll/bwb;

    .line 147
    .line 148
    invoke-direct {v0, v1, v2}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaOverlayView;-><init>(Landroid/content/Context;Ll/bwb;)V

    .line 149
    .line 150
    .line 151
    iput-object v0, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;->b:Lcom/p1/mobile/android/ui/cropiwa/CropIwaOverlayView;

    .line 152
    .line 153
    :goto_0
    iget-object v0, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;->b:Lcom/p1/mobile/android/ui/cropiwa/CropIwaOverlayView;

    .line 154
    .line 155
    iget-object v1, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;->a:Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;

    .line 156
    .line 157
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaOverlayView;->setNewBoundsListener(Ll/zm50;)V

    .line 158
    .line 159
    .line 160
    iget-object v0, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;->b:Lcom/p1/mobile/android/ui/cropiwa/CropIwaOverlayView;

    .line 161
    .line 162
    new-instance v1, Ll/iwb;

    .line 163
    .line 164
    invoke-direct {v1, p0}, Ll/iwb;-><init>(Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;)V

    .line 165
    .line 166
    .line 167
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaOverlayView;->setOnTouchActionListener(Ll/x20;)V

    .line 168
    .line 169
    .line 170
    iget-object v0, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;->b:Lcom/p1/mobile/android/ui/cropiwa/CropIwaOverlayView;

    .line 171
    .line 172
    new-instance v1, Ll/jwb;

    .line 173
    .line 174
    invoke-direct {v1, p0}, Ll/jwb;-><init>(Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;)V

    .line 175
    .line 176
    .line 177
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaOverlayView;->setOnMovePartImageCenterListener(Ll/wm50;)V

    .line 178
    .line 179
    .line 180
    iget-object v0, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;->a:Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;

    .line 181
    .line 182
    iget-object v1, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;->b:Lcom/p1/mobile/android/ui/cropiwa/CropIwaOverlayView;

    .line 183
    .line 184
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;->N(Ll/km50;)V

    .line 185
    .line 186
    .line 187
    iget-object v0, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;->a:Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;

    .line 188
    .line 189
    iget-object v1, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;->c:Ll/bwb;

    .line 190
    .line 191
    invoke-virtual {v1}, Ll/bwb;->t()Z

    .line 192
    .line 193
    .line 194
    move-result v1

    .line 195
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;->P(Z)V

    .line 196
    .line 197
    .line 198
    iget-object v0, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;->b:Lcom/p1/mobile/android/ui/cropiwa/CropIwaOverlayView;

    .line 199
    .line 200
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 201
    .line 202
    .line 203
    return-void

    .line 204
    :cond_6
    const-string p0, "imageView and overlayConfig must be initialized before calling this method"

    .line 205
    .line 206
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 207
    .line 208
    .line 209
    return-void
.end method

.method public r()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;->a:Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;->B()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    xor-int/lit8 p0, p0, 0x1

    .line 8
    .line 9
    return p0
.end method

.method public final synthetic s()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;->b:Lcom/p1/mobile/android/ui/cropiwa/CropIwaOverlayView;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;->d:Ll/wvb;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/wvb;->i()F

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    invoke-virtual {v0, p0}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaOverlayView;->setMaxScale(F)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public setCropSaveCompleteListener(Lcom/p1/mobile/android/ui/cropiwa/CropIwaView$c;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;->j:Lcom/p1/mobile/android/ui/cropiwa/CropIwaView$c;

    .line 2
    .line 3
    return-void
.end method

.method public setErrorListener(Lcom/p1/mobile/android/ui/cropiwa/CropIwaView$d;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;->h:Lcom/p1/mobile/android/ui/cropiwa/CropIwaView$d;

    .line 2
    .line 3
    return-void
.end method

.method public setImage(Landroid/graphics/Bitmap;)V
    .locals 3

    .line 1
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x1

    .line 6
    const/16 v2, 0x1000

    .line 7
    .line 8
    if-ge v0, v2, :cond_0

    .line 9
    .line 10
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-lt v0, v2, :cond_1

    .line 15
    .line 16
    :cond_0
    const/4 v0, 0x0

    .line 17
    invoke-virtual {p0, v1, v0}, Landroid/view/View;->setLayerType(ILandroid/graphics/Paint;)V

    .line 18
    .line 19
    .line 20
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;->a:Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;

    .line 21
    .line 22
    invoke-virtual {v0, p1}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    .line 23
    .line 24
    .line 25
    iget-object p0, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;->b:Lcom/p1/mobile/android/ui/cropiwa/CropIwaOverlayView;

    .line 26
    .line 27
    invoke-virtual {p0, v1}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaOverlayView;->setDrawOverlay(Z)V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public setImageLoadListener(Ll/tvb$a;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;->l:Ll/tvb$a;

    .line 2
    .line 3
    return-void
.end method

.method public setImageMatrix1(Landroid/graphics/Matrix;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;->a:Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;->O(Landroid/graphics/Matrix;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setImageUri(Landroid/net/Uri;)V
    .locals 3

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;->f:Landroid/net/Uri;

    .line 2
    .line 3
    new-instance v0, Ll/ktv;

    .line 4
    .line 5
    new-instance v1, Lcom/p1/mobile/android/ui/cropiwa/CropIwaView$a;

    .line 6
    .line 7
    const/4 v2, 0x0

    .line 8
    invoke-direct {v1, p0, v2}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaView$a;-><init>(Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;Ll/kwb;)V

    .line 9
    .line 10
    .line 11
    invoke-direct {v0, p1, v1}, Ll/ktv;-><init>(Landroid/net/Uri;Ll/tvb$a;)V

    .line 12
    .line 13
    .line 14
    iput-object v0, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;->g:Ll/ktv;

    .line 15
    .line 16
    iget-object p1, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;->d:Ll/wvb;

    .line 17
    .line 18
    invoke-virtual {p1}, Ll/wvb;->g()I

    .line 19
    .line 20
    .line 21
    move-result p1

    .line 22
    iget-object v1, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;->d:Ll/wvb;

    .line 23
    .line 24
    invoke-virtual {v1}, Ll/wvb;->f()I

    .line 25
    .line 26
    .line 27
    move-result v1

    .line 28
    invoke-virtual {v0, p1, v1}, Ll/ktv;->a(II)V

    .line 29
    .line 30
    .line 31
    iget-object p1, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;->g:Ll/ktv;

    .line 32
    .line 33
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    invoke-virtual {p1, p0}, Ll/ktv;->b(Landroid/content/Context;)V

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method public setInvalidCroppingListener(Lcom/p1/mobile/android/ui/cropiwa/CropIwaView$e;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;->i:Lcom/p1/mobile/android/ui/cropiwa/CropIwaView$e;

    .line 2
    .line 3
    return-void
.end method

.method public setTouchAction(Ll/x20;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;->o:Ll/x20;

    .line 2
    .line 3
    return-void
.end method

.method public final synthetic t()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;->o:Ll/x20;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Ll/x20;->call()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public final synthetic u(Landroid/graphics/RectF;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;->a:Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;->F(Landroid/graphics/RectF;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;->o:Ll/x20;

    .line 7
    .line 8
    if-eqz p0, :cond_0

    .line 9
    .line 10
    invoke-interface {p0}, Ll/x20;->call()V

    .line 11
    .line 12
    .line 13
    :cond_0
    return-void
.end method

.method public v()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;->a:Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;->E()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public w()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;->a:Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;->getImageMatrix()Landroid/graphics/Matrix;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Landroid/graphics/Matrix;->reset()V

    .line 8
    .line 9
    .line 10
    const/4 v0, 0x0

    .line 11
    iput v0, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;->n:I

    .line 12
    .line 13
    return-void
.end method

.method public x()V
    .locals 1

    .line 1
    iget v0, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;->n:I

    .line 2
    .line 3
    add-int/lit8 v0, v0, -0x5a

    .line 4
    .line 5
    iput v0, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;->n:I

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;->a:Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;

    .line 8
    .line 9
    const/high16 v0, -0x3d4c0000    # -90.0f

    .line 10
    .line 11
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;->K(F)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public y()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;->f:Landroid/net/Uri;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    invoke-static {}, Ll/tvb;->h()Ll/tvb;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    iget-object v2, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;->f:Landroid/net/Uri;

    .line 11
    .line 12
    invoke-virtual {v0, v2}, Ll/tvb;->t(Landroid/net/Uri;)V

    .line 13
    .line 14
    .line 15
    iget-object v2, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;->f:Landroid/net/Uri;

    .line 16
    .line 17
    invoke-virtual {v0, v2}, Ll/tvb;->p(Landroid/net/Uri;)V

    .line 18
    .line 19
    .line 20
    iput-object v1, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;->f:Landroid/net/Uri;

    .line 21
    .line 22
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;->k:Lcom/p1/mobile/android/ui/cropiwa/image/CropIwaResultReceiver;

    .line 23
    .line 24
    if-eqz v0, :cond_1

    .line 25
    .line 26
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 27
    .line 28
    .line 29
    move-result-object v2

    .line 30
    invoke-virtual {v0, v2}, Lcom/p1/mobile/android/ui/cropiwa/image/CropIwaResultReceiver;->unregister(Landroid/content/Context;)V

    .line 31
    .line 32
    .line 33
    iput-object v1, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;->k:Lcom/p1/mobile/android/ui/cropiwa/image/CropIwaResultReceiver;

    .line 34
    .line 35
    :cond_1
    const/4 v0, 0x1

    .line 36
    iput-boolean v0, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;->m:Z

    .line 37
    .line 38
    return-void
.end method

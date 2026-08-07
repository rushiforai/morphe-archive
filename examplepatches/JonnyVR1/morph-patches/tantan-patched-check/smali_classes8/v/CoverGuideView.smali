.class public Lv/CoverGuideView;
.super Landroid/widget/RelativeLayout;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lv/CoverGuideView$a;,
        Lv/CoverGuideView$b;,
        Lv/CoverGuideView$GuideViewLocation;,
        Lv/CoverGuideView$ShapeType;
    }
.end annotation


# static fields
.field public static final d:Landroid/graphics/PaintFlagsDrawFilter;


# instance fields
.field public a:Z

.field public b:Landroid/graphics/RectF;

.field public c:Landroid/graphics/RectF;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 1
    new-instance v0, Landroid/graphics/PaintFlagsDrawFilter;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const/4 v2, 0x3

    .line 5
    invoke-direct {v0, v1, v2}, Landroid/graphics/PaintFlagsDrawFilter;-><init>(II)V

    .line 6
    .line 7
    .line 8
    sput-object v0, Lv/CoverGuideView;->d:Landroid/graphics/PaintFlagsDrawFilter;

    .line 9
    .line 10
    return-void
.end method

.method public static synthetic a(Lv/CoverGuideView;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lv/CoverGuideView;->e()V

    return-void
.end method


# virtual methods
.method public final b()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    check-cast v0, Landroid/app/Activity;

    .line 6
    .line 7
    invoke-virtual {v0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    check-cast v0, Landroid/widget/FrameLayout;

    .line 16
    .line 17
    invoke-virtual {v0, p0}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 18
    .line 19
    .line 20
    const/4 p0, 0x0

    .line 21
    invoke-static {p0}, Lv/CoverGuideView$a;->c(Lv/CoverGuideView$a;)Lv/CoverGuideView$b;

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public c()V
    .locals 4

    .line 1
    iget-boolean v0, p0, Lv/CoverGuideView;->a:Z

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    invoke-static {v0}, Lv/CoverGuideView$a;->b(Lv/CoverGuideView$a;)Z

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    if-eqz v1, :cond_0

    .line 11
    .line 12
    invoke-static {v0}, Lv/CoverGuideView$a;->a(Lv/CoverGuideView$a;)J

    .line 13
    .line 14
    .line 15
    move-result-wide v1

    .line 16
    new-instance v3, Ll/tsb;

    .line 17
    .line 18
    invoke-direct {v3, p0}, Ll/tsb;-><init>(Lv/CoverGuideView;)V

    .line 19
    .line 20
    .line 21
    invoke-static {v0, v3, v0}, Ll/gt0;->h(Ljava/lang/Runnable;Ljava/lang/Runnable;Ljava/lang/Runnable;)Landroid/animation/Animator$AnimatorListener;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-static {p0, v1, v2, v0}, Ll/gt0;->d(Landroid/view/View;JLandroid/animation/Animator$AnimatorListener;)V

    .line 26
    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_0
    invoke-virtual {p0}, Lv/CoverGuideView;->b()V

    .line 30
    .line 31
    .line 32
    :goto_0
    const/4 v0, 0x0

    .line 33
    iput-boolean v0, p0, Lv/CoverGuideView;->a:Z

    .line 34
    .line 35
    :cond_1
    return-void
.end method

.method public d()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lv/CoverGuideView;->a:Z

    .line 2
    .line 3
    return p0
.end method

.method public final synthetic e()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lv/CoverGuideView;->b()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public onDraw(Landroid/graphics/Canvas;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Landroid/view/View;->onDraw(Landroid/graphics/Canvas;)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lv/CoverGuideView;->b:Landroid/graphics/RectF;

    .line 5
    .line 6
    if-eqz v0, :cond_1

    .line 7
    .line 8
    iget-object p0, p0, Lv/CoverGuideView;->c:Landroid/graphics/RectF;

    .line 9
    .line 10
    if-nez p0, :cond_0

    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_0
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    .line 14
    .line 15
    .line 16
    sget-object p0, Lv/CoverGuideView;->d:Landroid/graphics/PaintFlagsDrawFilter;

    .line 17
    .line 18
    invoke-virtual {p1, p0}, Landroid/graphics/Canvas;->setDrawFilter(Landroid/graphics/DrawFilter;)V

    .line 19
    .line 20
    .line 21
    const/4 p0, 0x0

    .line 22
    throw p0

    .line 23
    :cond_1
    :goto_0
    return-void
.end method

.method public onLayout(ZIIII)V
    .locals 0

    .line 1
    invoke-super/range {p0 .. p5}, Landroid/widget/RelativeLayout;->onLayout(ZIIII)V

    .line 2
    .line 3
    .line 4
    if-nez p1, :cond_0

    .line 5
    .line 6
    return-void

    .line 7
    :cond_0
    new-instance p1, Landroid/graphics/RectF;

    .line 8
    .line 9
    int-to-float p2, p2

    .line 10
    int-to-float p3, p3

    .line 11
    int-to-float p4, p4

    .line 12
    int-to-float p5, p5

    .line 13
    invoke-direct {p1, p2, p3, p4, p5}, Landroid/graphics/RectF;-><init>(FFFF)V

    .line 14
    .line 15
    .line 16
    iput-object p1, p0, Lv/CoverGuideView;->c:Landroid/graphics/RectF;

    .line 17
    .line 18
    const/4 p0, 0x0

    .line 19
    throw p0
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 4

    .line 1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 10
    .line 11
    .line 12
    move-result v2

    .line 13
    const/4 v3, 0x1

    .line 14
    if-ne v2, v3, :cond_1

    .line 15
    .line 16
    iget-object v2, p0, Lv/CoverGuideView;->b:Landroid/graphics/RectF;

    .line 17
    .line 18
    if-eqz v2, :cond_1

    .line 19
    .line 20
    iget v3, v2, Landroid/graphics/RectF;->left:F

    .line 21
    .line 22
    cmpl-float v3, v0, v3

    .line 23
    .line 24
    if-lez v3, :cond_1

    .line 25
    .line 26
    iget v3, v2, Landroid/graphics/RectF;->right:F

    .line 27
    .line 28
    cmpg-float v0, v0, v3

    .line 29
    .line 30
    if-gez v0, :cond_1

    .line 31
    .line 32
    iget v0, v2, Landroid/graphics/RectF;->top:F

    .line 33
    .line 34
    cmpl-float v0, v1, v0

    .line 35
    .line 36
    if-lez v0, :cond_1

    .line 37
    .line 38
    iget v0, v2, Landroid/graphics/RectF;->bottom:F

    .line 39
    .line 40
    cmpg-float v0, v1, v0

    .line 41
    .line 42
    if-ltz v0, :cond_0

    .line 43
    .line 44
    goto :goto_0

    .line 45
    :cond_0
    const/4 p0, 0x0

    .line 46
    throw p0

    .line 47
    :cond_1
    :goto_0
    invoke-super {p0, p1}, Landroid/view/View;->onTouchEvent(Landroid/view/MotionEvent;)Z

    .line 48
    .line 49
    .line 50
    move-result p0

    .line 51
    return p0
.end method

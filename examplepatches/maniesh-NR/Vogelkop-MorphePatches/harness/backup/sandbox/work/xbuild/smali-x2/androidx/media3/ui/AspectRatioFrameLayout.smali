.class public final Landroidx/media3/ui/AspectRatioFrameLayout;
.super Landroid/widget/FrameLayout;
.source "SourceFile"


# instance fields
.field public final a:Lqa2;

.field public b:Lpa2;

.field public c:F

.field public d:I


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 5
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 v0, 0x0

    iput v0, p0, Landroidx/media3/ui/AspectRatioFrameLayout;->d:I

    if-eqz p2, :cond_21

    invoke-virtual {p1}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object p1

    sget-object v1, Lyhh;->a:[I

    invoke-virtual {p1, p2, v1, v0, v0}, Landroid/content/res/Resources$Theme;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object p1

    :try_start_12
    invoke-virtual {p1, v0, v0}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result p2

    iput p2, p0, Landroidx/media3/ui/AspectRatioFrameLayout;->d:I
    :try_end_18
    .catchall {:try_start_12 .. :try_end_18} :catchall_1c

    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    goto :goto_21

    :catchall_1c
    move-exception p0

    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    throw p0

    :cond_21
    :goto_21
    new-instance p1, Lqa2;

    invoke-direct {p1, p0, v0}, Lqa2;-><init>(Landroid/widget/FrameLayout;B)V

    iput-object p1, p0, Landroidx/media3/ui/AspectRatioFrameLayout;->a:Lqa2;

    return-void
.end method


# virtual methods
.method public final onMeasure(II)V
    .registers 11

    invoke-super {p0, p1, p2}, Landroid/widget/FrameLayout;->onMeasure(II)V

    iget p1, p0, Landroidx/media3/ui/AspectRatioFrameLayout;->c:F

    const/4 p2, 0x0

    cmpg-float p1, p1, p2

    if-lez p1, :cond_3d

    invoke-virtual {p0}, Landroid/view/View;->getMeasuredWidth()I

    move-result p1

    invoke-virtual {p0}, Landroid/view/View;->getMeasuredHeight()I

    move-result v0

    int-to-float v1, p1

    int-to-float v2, v0

    div-float v3, v1, v2

    iget v4, p0, Landroidx/media3/ui/AspectRatioFrameLayout;->c:F

    div-float/2addr v4, v3

    const/high16 v3, 0x3f800000    # 1.0f

    sub-float/2addr v4, v3

    invoke-static {v4}, Ljava/lang/Math;->abs(F)F

    move-result v3

    const v5, 0x3c23d70a    # 0.01f

    cmpg-float v3, v3, v5

    const/4 v5, 0x1

    iget-object v6, p0, Landroidx/media3/ui/AspectRatioFrameLayout;->a:Lqa2;

    if-gtz v3, :cond_3e

    invoke-virtual {v6}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/4 p0, 0x0

    iput-boolean p0, v6, Lqa2;->b:Z

    iget-boolean p0, v6, Lqa2;->c:Z

    if-nez p0, :cond_3d

    iput-boolean v5, v6, Lqa2;->c:Z

    iget-object p0, v6, Lqa2;->d:Landroid/widget/FrameLayout;

    check-cast p0, Landroidx/media3/ui/AspectRatioFrameLayout;

    invoke-virtual {p0, v6}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    :cond_3d
    return-void

    :cond_3e
    iget v3, p0, Landroidx/media3/ui/AspectRatioFrameLayout;->d:I

    if-eqz v3, :cond_5b

    if-eq v3, v5, :cond_56

    const/4 v7, 0x2

    if-eq v3, v7, :cond_51

    const/4 v7, 0x4

    if-ne v3, v7, :cond_65

    cmpl-float p2, v4, p2

    iget v3, p0, Landroidx/media3/ui/AspectRatioFrameLayout;->c:F

    if-lez p2, :cond_61

    goto :goto_63

    :cond_51
    iget p1, p0, Landroidx/media3/ui/AspectRatioFrameLayout;->c:F

    mul-float/2addr v2, p1

    :goto_54
    float-to-int p1, v2

    goto :goto_65

    :cond_56
    iget p2, p0, Landroidx/media3/ui/AspectRatioFrameLayout;->c:F

    div-float/2addr v1, p2

    :goto_59
    float-to-int v0, v1

    goto :goto_65

    :cond_5b
    cmpl-float p2, v4, p2

    iget v3, p0, Landroidx/media3/ui/AspectRatioFrameLayout;->c:F

    if-lez p2, :cond_63

    :cond_61
    div-float/2addr v1, v3

    goto :goto_59

    :cond_63
    :goto_63
    mul-float/2addr v2, v3

    goto :goto_54

    :cond_65
    :goto_65
    invoke-virtual {v6}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iput-boolean v5, v6, Lqa2;->b:Z

    iget-boolean p2, v6, Lqa2;->c:Z

    if-nez p2, :cond_77

    iput-boolean v5, v6, Lqa2;->c:Z

    iget-object p2, v6, Lqa2;->d:Landroid/widget/FrameLayout;

    check-cast p2, Landroidx/media3/ui/AspectRatioFrameLayout;

    invoke-virtual {p2, v6}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    :cond_77
    const/high16 p2, 0x40000000    # 2.0f

    invoke-static {p1, p2}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result p1

    invoke-static {v0, p2}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result p2

    invoke-super {p0, p1, p2}, Landroid/widget/FrameLayout;->onMeasure(II)V

    return-void
.end method

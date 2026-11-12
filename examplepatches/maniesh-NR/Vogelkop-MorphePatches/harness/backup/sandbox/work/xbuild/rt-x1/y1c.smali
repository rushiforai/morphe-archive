.class public Ly1c;
.super Lifc;
.source "SourceFile"


# static fields
.field public static final e:J

.field public static final f:Landroid/view/animation/DecelerateInterpolator;


# instance fields
.field public final a:Landroidx/recyclerview/widget/RecyclerView;

.field public final b:Landroidx/recyclerview/widget/LinearLayoutManager;

.field public final c:Lqsh;

.field public d:Z


# direct methods
.method static constructor <clinit>()V
    .registers 2

    sget-object v0, Lpn7;->b:Lon7;

    const/16 v0, 0x12c

    sget-object v1, Lun7;->d:Lun7;

    invoke-static {v0, v1}, Lcs5;->x0(ILun7;)J

    move-result-wide v0

    sput-wide v0, Ly1c;->e:J

    sget-object v0, Llf1;->e:Landroid/view/animation/DecelerateInterpolator;

    sput-object v0, Ly1c;->f:Landroid/view/animation/DecelerateInterpolator;

    return-void
.end method

.method public constructor <init>(Landroidx/recyclerview/widget/RecyclerView;Landroidx/recyclerview/widget/LinearLayoutManager;Lqsh;)V
    .registers 5

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-direct {p0, v0}, Lifc;-><init>(Landroid/content/Context;)V

    iput-object p1, p0, Ly1c;->a:Landroidx/recyclerview/widget/RecyclerView;

    iput-object p2, p0, Ly1c;->b:Landroidx/recyclerview/widget/LinearLayoutManager;

    iput-object p3, p0, Ly1c;->c:Lqsh;

    return-void
.end method


# virtual methods
.method public a(I)Z
    .registers 2

    const/4 p0, 0x1

    return p0
.end method

.method public final calculateSpeedPerPixel(Landroid/util/DisplayMetrics;)F
    .registers 2

    iget p0, p1, Landroid/util/DisplayMetrics;->densityDpi:I

    int-to-float p0, p0

    const/high16 p1, 0x41c80000    # 25.0f

    div-float/2addr p1, p0

    return p1
.end method

.method public final onSeekTargetStep(IILvph;Lsph;)V
    .registers 15

    iget-boolean v0, p0, Ly1c;->d:Z

    if-nez v0, :cond_9a

    invoke-virtual {p0}, Luph;->getTargetPosition()I

    move-result v0

    iget-object v1, p0, Ly1c;->b:Landroidx/recyclerview/widget/LinearLayoutManager;

    invoke-virtual {v1}, Landroidx/recyclerview/widget/LinearLayoutManager;->canScrollHorizontally()Z

    move-result v2

    invoke-virtual {v1}, Landroidx/recyclerview/widget/LinearLayoutManager;->findFirstVisibleItemPosition()I

    move-result v3

    invoke-virtual {v1}, Landroidx/recyclerview/widget/LinearLayoutManager;->findLastVisibleItemPosition()I

    move-result v1

    const/4 v4, 0x1

    const/4 v5, 0x0

    const/4 v6, -0x1

    if-eq v3, v6, :cond_85

    if-eq v1, v6, :cond_85

    if-eq v0, v6, :cond_85

    invoke-virtual {p0, v0}, Luph;->computeScrollVectorForPosition(I)Landroid/graphics/PointF;

    move-result-object v6

    if-eqz v6, :cond_85

    iget-object v5, p0, Ly1c;->a:Landroidx/recyclerview/widget/RecyclerView;

    const/4 v7, 0x0

    const/4 v8, 0x0

    if-eqz v2, :cond_3d

    invoke-virtual {v5}, Landroid/view/View;->getLayoutDirection()I

    move-result v9

    iget v6, v6, Landroid/graphics/PointF;->x:F

    if-ne v9, v4, :cond_38

    cmpg-float v6, v6, v7

    if-gez v6, :cond_45

    goto :goto_43

    :cond_38
    cmpl-float v6, v6, v7

    if-lez v6, :cond_45

    goto :goto_43

    :cond_3d
    iget v6, v6, Landroid/graphics/PointF;->y:F

    cmpl-float v6, v6, v7

    if-lez v6, :cond_45

    :goto_43
    move v6, v4

    goto :goto_46

    :cond_45
    move v6, v8

    :goto_46
    if-eqz v6, :cond_49

    move v3, v1

    :cond_49
    invoke-static {v3, v0}, Ljava/lang/Math;->min(II)I

    move-result v1

    invoke-static {v3, v0}, Ljava/lang/Math;->max(II)I

    move-result v0

    new-instance v3, Landroid/graphics/Point;

    invoke-direct {v3, v8, v8}, Landroid/graphics/Point;-><init>(II)V

    :goto_56
    if-ge v1, v0, :cond_84

    invoke-virtual {p0, v1}, Ly1c;->a(I)Z

    move-result v7

    if-eqz v7, :cond_81

    iget-object v7, p0, Ly1c;->c:Lqsh;

    invoke-virtual {v7, v5, v1}, Lqsh;->b(Landroidx/recyclerview/widget/RecyclerView;I)Landroid/graphics/Point;

    move-result-object v7

    if-eqz v2, :cond_74

    iget v8, v3, Landroid/graphics/Point;->x:I

    iget v7, v7, Landroid/graphics/Point;->x:I

    if-eqz v6, :cond_70

    add-int/2addr v8, v7

    iput v8, v3, Landroid/graphics/Point;->x:I

    goto :goto_81

    :cond_70
    sub-int/2addr v8, v7

    iput v8, v3, Landroid/graphics/Point;->x:I

    goto :goto_81

    :cond_74
    iget v8, v3, Landroid/graphics/Point;->y:I

    iget v7, v7, Landroid/graphics/Point;->y:I

    if-eqz v6, :cond_7e

    add-int/2addr v8, v7

    iput v8, v3, Landroid/graphics/Point;->y:I

    goto :goto_81

    :cond_7e
    sub-int/2addr v8, v7

    iput v8, v3, Landroid/graphics/Point;->y:I

    :cond_81
    :goto_81
    add-int/lit8 v1, v1, 0x1

    goto :goto_56

    :cond_84
    move-object v5, v3

    :cond_85
    if-eqz v5, :cond_9a

    iput-boolean v4, p0, Ly1c;->d:Z

    iget p0, v5, Landroid/graphics/Point;->x:I

    iget p1, v5, Landroid/graphics/Point;->y:I

    sget-wide p2, Ly1c;->e:J

    invoke-static {p2, p3}, Lpn7;->f(J)J

    move-result-wide p2

    long-to-int p2, p2

    sget-object p3, Ly1c;->f:Landroid/view/animation/DecelerateInterpolator;

    invoke-virtual {p4, p0, p1, p2, p3}, Lsph;->b(IIILandroid/view/animation/Interpolator;)V

    return-void

    :cond_9a
    iget-boolean v0, p0, Ly1c;->d:Z

    if-nez v0, :cond_a1

    invoke-super {p0, p1, p2, p3, p4}, Lifc;->onSeekTargetStep(IILvph;Lsph;)V

    :cond_a1
    return-void
.end method

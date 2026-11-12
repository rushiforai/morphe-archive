.class public final Lni7;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final A:J

.field public static final B:J

.field public static final synthetic C:I

.field public static final z:J


# instance fields
.field public final a:Landroid/view/View;

.field public b:Lkotlin/jvm/functions/Function0;

.field public c:Lkotlin/jvm/functions/Function0;

.field public d:Lkotlin/jvm/functions/Function1;

.field public e:Lkotlin/jvm/functions/Function1;

.field public f:Lkotlin/jvm/functions/Function0;

.field public g:Lkotlin/jvm/functions/Function0;

.field public h:Lkotlin/jvm/functions/Function0;

.field public i:Lkotlin/jvm/functions/Function0;

.field public j:I

.field public k:Z

.field public final l:Lii7;

.field public final m:Lii7;

.field public final n:Lii7;

.field public final o:Lii7;

.field public final p:Lii7;

.field public final q:F

.field public final r:I

.field public final s:I

.field public t:Landroid/view/VelocityTracker;

.field public final u:Landroid/graphics/PointF;

.field public v:Landroid/util/Size;

.field public w:Z

.field public final x:Lji7;

.field public y:I


# direct methods
.method static constructor <clinit>()V
    .registers 4

    sget-object v0, Lpn7;->b:Lon7;

    sget-object v0, Lun7;->d:Lun7;

    const/16 v1, 0x96

    invoke-static {v1, v0}, Lcs5;->x0(ILun7;)J

    move-result-wide v1

    sput-wide v1, Lni7;->z:J

    const/16 v1, 0x15e

    invoke-static {v1, v0}, Lcs5;->x0(ILun7;)J

    move-result-wide v2

    sput-wide v2, Lni7;->A:J

    invoke-static {v1, v0}, Lcs5;->x0(ILun7;)J

    move-result-wide v0

    sput-wide v0, Lni7;->B:J

    return-void
.end method

.method public constructor <init>(Landroid/view/View;)V
    .registers 6

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lni7;->a:Landroid/view/View;

    new-instance v0, Lki5;

    const/16 v1, 0x14

    invoke-direct {v0, v1}, Lki5;-><init>(B)V

    iput-object v0, p0, Lni7;->b:Lkotlin/jvm/functions/Function0;

    new-instance v0, Lki5;

    const/16 v1, 0x17

    invoke-direct {v0, v1}, Lki5;-><init>(B)V

    iput-object v0, p0, Lni7;->c:Lkotlin/jvm/functions/Function0;

    new-instance v0, Lm57;

    const/16 v1, 0xb

    invoke-direct {v0, v1}, Lm57;-><init>(B)V

    iput-object v0, p0, Lni7;->d:Lkotlin/jvm/functions/Function1;

    new-instance v0, Lm57;

    const/16 v1, 0xc

    invoke-direct {v0, v1}, Lm57;-><init>(B)V

    iput-object v0, p0, Lni7;->e:Lkotlin/jvm/functions/Function1;

    new-instance v0, Lki5;

    const/16 v1, 0x18

    invoke-direct {v0, v1}, Lki5;-><init>(B)V

    iput-object v0, p0, Lni7;->f:Lkotlin/jvm/functions/Function0;

    new-instance v0, Lki5;

    const/16 v1, 0x19

    invoke-direct {v0, v1}, Lki5;-><init>(B)V

    iput-object v0, p0, Lni7;->g:Lkotlin/jvm/functions/Function0;

    new-instance v0, Lki5;

    const/16 v1, 0x15

    invoke-direct {v0, v1}, Lki5;-><init>(B)V

    iput-object v0, p0, Lni7;->h:Lkotlin/jvm/functions/Function0;

    new-instance v0, Lki5;

    const/16 v1, 0x16

    invoke-direct {v0, v1}, Lki5;-><init>(B)V

    iput-object v0, p0, Lni7;->i:Lkotlin/jvm/functions/Function0;

    new-instance v0, Lii7;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lii7;-><init>(Lni7;B)V

    iput-object v0, p0, Lni7;->l:Lii7;

    new-instance v0, Lii7;

    const/4 v2, 0x1

    invoke-direct {v0, p0, v2}, Lii7;-><init>(Lni7;B)V

    iput-object v0, p0, Lni7;->m:Lii7;

    new-instance v0, Lii7;

    const/4 v3, 0x3

    invoke-direct {v0, p0, v3}, Lii7;-><init>(Lni7;B)V

    iput-object v0, p0, Lni7;->n:Lii7;

    new-instance v0, Lii7;

    const/4 v3, 0x4

    invoke-direct {v0, p0, v3}, Lii7;-><init>(Lni7;B)V

    iput-object v0, p0, Lni7;->o:Lii7;

    new-instance v0, Lii7;

    const/4 v3, 0x5

    invoke-direct {v0, p0, v3}, Lii7;-><init>(Lni7;B)V

    iput-object v0, p0, Lni7;->p:Lii7;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/ViewConfiguration;->getScaledMinimumFlingVelocity()I

    move-result v0

    int-to-float v0, v0

    const/high16 v3, 0x40000000    # 2.0f

    mul-float/2addr v0, v3

    iput v0, p0, Lni7;->q:F

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/ViewConfiguration;->getScaledMaximumFlingVelocity()I

    move-result v0

    iput v0, p0, Lni7;->r:I

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/ViewConfiguration;->getScaledTouchSlop()I

    move-result v0

    iput v0, p0, Lni7;->s:I

    new-instance v0, Landroid/graphics/PointF;

    invoke-direct {v0}, Landroid/graphics/PointF;-><init>()V

    iput-object v0, p0, Lni7;->u:Landroid/graphics/PointF;

    new-instance v0, Landroid/util/Size;

    invoke-direct {v0, v1, v1}, Landroid/util/Size;-><init>(II)V

    iput-object v0, p0, Lni7;->v:Landroid/util/Size;

    new-instance v0, Lji7;

    invoke-direct {v0, p0}, Lji7;-><init>(Lni7;)V

    iput-object v0, p0, Lni7;->x:Lji7;

    new-instance v0, Lm42;

    invoke-direct {v0, p0, v2}, Lm42;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p1, v0}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    return-void
.end method


# virtual methods
.method public final a(Landroid/view/VelocityTracker;Landroid/view/MotionEvent;)V
    .registers 5

    iget-object p0, p0, Lni7;->a:Landroid/view/View;

    invoke-virtual {p0}, Landroid/view/View;->getLeft()I

    move-result v0

    int-to-float v0, v0

    invoke-virtual {p0}, Landroid/view/View;->getTop()I

    move-result v1

    int-to-float v1, v1

    invoke-virtual {p2, v0, v1}, Landroid/view/MotionEvent;->offsetLocation(FF)V

    invoke-virtual {p1, p2}, Landroid/view/VelocityTracker;->addMovement(Landroid/view/MotionEvent;)V

    invoke-virtual {p0}, Landroid/view/View;->getLeft()I

    move-result p1

    int-to-float p1, p1

    neg-float p1, p1

    invoke-virtual {p0}, Landroid/view/View;->getTop()I

    move-result p0

    int-to-float p0, p0

    neg-float p0, p0

    invoke-virtual {p2, p1, p0}, Landroid/view/MotionEvent;->offsetLocation(FF)V

    return-void
.end method

.method public final b(II)V
    .registers 12

    invoke-virtual {p0, p1}, Lni7;->c(I)I

    move-result p1

    invoke-virtual {p0, p2}, Lni7;->d(I)I

    move-result p2

    iget-object v0, p0, Lni7;->a:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    check-cast v1, Landroid/view/ViewGroup$MarginLayoutParams;

    instance-of v2, v1, Landroid/widget/FrameLayout$LayoutParams;

    if-eqz v2, :cond_b5

    iget-object v2, p0, Lni7;->p:Lii7;

    invoke-virtual {v2}, Lii7;->invoke()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/view/View;

    invoke-virtual {v2}, Landroid/view/View;->getPaddingLeft()I

    move-result v3

    invoke-virtual {v2}, Landroid/view/View;->getWidth()I

    move-result v4

    invoke-virtual {v2}, Landroid/view/View;->getPaddingLeft()I

    move-result v5

    invoke-virtual {v2}, Landroid/view/View;->getPaddingRight()I

    move-result v6

    add-int/2addr v6, v5

    sub-int/2addr v4, v6

    div-int/lit8 v4, v4, 0x2

    add-int/2addr v4, v3

    invoke-virtual {v2}, Landroid/view/View;->getPaddingTop()I

    move-result v3

    invoke-virtual {v2}, Landroid/view/View;->getHeight()I

    move-result v5

    invoke-virtual {v2}, Landroid/view/View;->getPaddingTop()I

    move-result v6

    invoke-virtual {v2}, Landroid/view/View;->getPaddingBottom()I

    move-result v7

    add-int/2addr v7, v6

    sub-int/2addr v5, v7

    div-int/lit8 v5, v5, 0x2

    add-int/2addr v5, v3

    invoke-virtual {v0}, Landroid/view/View;->getWidth()I

    move-result v3

    div-int/lit8 v3, v3, 0x2

    add-int/2addr v3, p1

    const/4 v6, 0x1

    const/4 v7, 0x0

    if-ge v3, v4, :cond_53

    move v3, v6

    goto :goto_54

    :cond_53
    move v3, v7

    :goto_54
    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    move-result v4

    div-int/lit8 v4, v4, 0x2

    add-int/2addr v4, p2

    if-lt v4, v5, :cond_5e

    move v6, v7

    :cond_5e
    if-eqz v3, :cond_62

    const/4 v4, 0x3

    goto :goto_63

    :cond_62
    const/4 v4, 0x5

    :goto_63
    if-eqz v6, :cond_68

    const/16 v5, 0x30

    goto :goto_6a

    :cond_68
    const/16 v5, 0x50

    :goto_6a
    or-int/2addr v4, v5

    move-object v5, v1

    check-cast v5, Landroid/widget/FrameLayout$LayoutParams;

    iget v8, v5, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    if-eq v8, v4, :cond_74

    iput v4, v5, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    :cond_74
    if-eqz v3, :cond_81

    invoke-virtual {v2}, Landroid/view/View;->getPaddingLeft()I

    move-result v3

    sub-int v3, p1, v3

    iput v3, v1, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    iput v7, v1, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    goto :goto_94

    :cond_81
    iput v7, v1, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    invoke-virtual {v2}, Landroid/view/View;->getWidth()I

    move-result v3

    sub-int/2addr v3, p1

    invoke-virtual {v0}, Landroid/view/View;->getWidth()I

    move-result v4

    sub-int/2addr v3, v4

    invoke-virtual {v2}, Landroid/view/View;->getPaddingRight()I

    move-result v4

    sub-int/2addr v3, v4

    iput v3, v1, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    :goto_94
    if-eqz v6, :cond_a1

    invoke-virtual {v2}, Landroid/view/View;->getPaddingTop()I

    move-result v2

    sub-int v2, p2, v2

    iput v2, v1, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    iput v7, v1, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    goto :goto_b9

    :cond_a1
    iput v7, v1, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    invoke-virtual {v2}, Landroid/view/View;->getHeight()I

    move-result v3

    sub-int/2addr v3, p2

    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    move-result v4

    sub-int/2addr v3, v4

    invoke-virtual {v2}, Landroid/view/View;->getPaddingBottom()I

    move-result v2

    sub-int/2addr v3, v2

    iput v3, v1, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    goto :goto_b9

    :cond_b5
    iput p1, v1, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    iput p2, v1, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    :goto_b9
    invoke-virtual {v0}, Landroid/view/View;->getLeft()I

    move-result v1

    sub-int/2addr p1, v1

    invoke-virtual {v0, p1}, Landroid/view/View;->offsetLeftAndRight(I)V

    invoke-virtual {v0}, Landroid/view/View;->getTop()I

    move-result p1

    sub-int/2addr p2, p1

    invoke-virtual {v0, p2}, Landroid/view/View;->offsetTopAndBottom(I)V

    iget-object p0, p0, Lni7;->b:Lkotlin/jvm/functions/Function0;

    invoke-interface {p0}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    return-void
.end method

.method public final c(I)I
    .registers 5

    iget-object v0, p0, Lni7;->p:Lii7;

    invoke-virtual {v0}, Lii7;->invoke()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getPaddingLeft()I

    move-result v1

    iget v2, p0, Lni7;->j:I

    add-int/2addr v1, v2

    invoke-virtual {v0}, Landroid/view/View;->getWidth()I

    move-result v2

    invoke-virtual {v0}, Landroid/view/View;->getPaddingRight()I

    move-result v0

    sub-int/2addr v2, v0

    iget v0, p0, Lni7;->j:I

    sub-int/2addr v2, v0

    iget-object v0, p0, Lni7;->a:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getWidth()I

    move-result v0

    sub-int/2addr v2, v0

    iget p0, p0, Lni7;->j:I

    if-ge v2, p0, :cond_27

    move v2, p0

    :cond_27
    invoke-static {p1, v1, v2}, Ldjh;->c(III)I

    move-result p0

    return p0
.end method

.method public final d(I)I
    .registers 6

    iget-object v0, p0, Lni7;->p:Lii7;

    invoke-virtual {v0}, Lii7;->invoke()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getPaddingBottom()I

    move-result v1

    iget v2, p0, Lni7;->y:I

    if-ge v1, v2, :cond_11

    move v1, v2

    :cond_11
    invoke-virtual {v0}, Landroid/view/View;->getPaddingTop()I

    move-result v2

    iget v3, p0, Lni7;->j:I

    add-int/2addr v2, v3

    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    move-result v0

    sub-int/2addr v0, v1

    iget v1, p0, Lni7;->j:I

    sub-int/2addr v0, v1

    iget-object v1, p0, Lni7;->a:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getHeight()I

    move-result v1

    sub-int/2addr v0, v1

    iget p0, p0, Lni7;->j:I

    if-ge v0, p0, :cond_2c

    move v0, p0

    :cond_2c
    invoke-static {p1, v2, v0}, Ldjh;->c(III)I

    move-result p0

    return p0
.end method

.method public final e()V
    .registers 11

    iget-boolean v0, p0, Lni7;->k:Z

    if-eqz v0, :cond_5

    return-void

    :cond_5
    iget-object v0, p0, Lni7;->a:Landroid/view/View;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/View;->performHapticFeedback(I)Z

    const/4 v0, 0x1

    iput-boolean v0, p0, Lni7;->k:Z

    iget-object v0, p0, Lni7;->l:Lii7;

    invoke-virtual {v0}, Lii7;->invoke()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Number;

    invoke-virtual {v0}, Ljava/lang/Number;->floatValue()F

    move-result v0

    iget-object v1, p0, Lni7;->m:Lii7;

    invoke-virtual {v1}, Lii7;->invoke()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Number;

    invoke-virtual {v1}, Ljava/lang/Number;->floatValue()F

    move-result v1

    iget-object v2, p0, Lni7;->x:Lji7;

    invoke-virtual {v2, v0, v1}, Lji7;->c(FF)V

    sget-object v4, Lmi7;->b:Lmi7;

    new-instance v7, Landroid/view/animation/DecelerateInterpolator;

    invoke-direct {v7}, Landroid/view/animation/DecelerateInterpolator;-><init>()V

    iget-object v8, p0, Lni7;->e:Lkotlin/jvm/functions/Function1;

    new-instance v9, Lii7;

    const/4 v0, 0x2

    invoke-direct {v9, p0, v0}, Lii7;-><init>(Lni7;B)V

    iget-object v3, p0, Lni7;->x:Lji7;

    sget-wide v5, Lni7;->z:J

    invoke-virtual/range {v3 .. v9}, Lji7;->a(Lmi7;JLandroid/animation/TimeInterpolator;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function0;)V

    return-void
.end method

.method public final f(FF)Z
    .registers 5

    iget-object v0, p0, Lni7;->l:Lii7;

    invoke-virtual {v0}, Lii7;->invoke()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Number;

    invoke-virtual {v0}, Ljava/lang/Number;->floatValue()F

    move-result v0

    iget-object v1, p0, Lni7;->m:Lii7;

    invoke-virtual {v1}, Lii7;->invoke()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Number;

    invoke-virtual {v1}, Ljava/lang/Number;->floatValue()F

    move-result v1

    sub-float/2addr p1, v0

    sub-float/2addr p2, v1

    mul-float/2addr p1, p1

    mul-float/2addr p2, p2

    add-float/2addr p2, p1

    float-to-double p1, p2

    invoke-static {p1, p2}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide p1

    double-to-float p1, p1

    iget-object p0, p0, Lni7;->i:Lkotlin/jvm/functions/Function0;

    invoke-interface {p0}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Number;

    invoke-virtual {p0}, Ljava/lang/Number;->floatValue()F

    move-result p0

    cmpg-float p0, p1, p0

    if-gez p0, :cond_35

    const/4 p0, 0x1

    return p0

    :cond_35
    const/4 p0, 0x0

    return p0
.end method

.method public final g()V
    .registers 6

    iget-object v0, p0, Lni7;->x:Lji7;

    iget-object v1, v0, Lji7;->d:Landroid/graphics/PointF;

    iget v2, v1, Landroid/graphics/PointF;->x:F

    iget-object v3, v0, Lji7;->e:Landroid/graphics/PointF;

    iget v4, v3, Landroid/graphics/PointF;->x:F

    iget v0, v0, Lji7;->a:F

    invoke-static {v4, v2, v0, v2}, Lv0g;->g(FFFF)F

    move-result v2

    float-to-int v2, v2

    iget v1, v1, Landroid/graphics/PointF;->y:F

    iget v3, v3, Landroid/graphics/PointF;->y:F

    invoke-static {v3, v1, v0, v1}, Lv0g;->g(FFFF)F

    move-result v0

    float-to-int v0, v0

    invoke-virtual {p0, v2, v0}, Lni7;->b(II)V

    return-void
.end method

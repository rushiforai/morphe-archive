.class public Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;
.super Landroid/view/ViewGroup;
.source ""

# interfaces
.implements Ld/h/l/j;
.implements Ld/h/l/f;
.implements Ld/h/l/i;
.implements Ld/h/l/e;
.implements Landroidx/core/view/NestedScrollingParent;
.implements Landroidx/core/view/NestedScrollingParent2;
.implements Landroidx/core/view/NestedScrollingParent3;
.implements Landroidx/core/view/NestedScrollingChild;
.implements Landroidx/core/view/NestedScrollingChild2;
.implements Landroidx/core/view/NestedScrollingChild3;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout$g;,
        Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout$h;
    }
.end annotation


# static fields
.field public static final DEFAULT:I = 0x1

.field public static final DEFAULT_SLINGSHOT_DISTANCE:I = -0x1

.field public static final LARGE:I

.field public static final O:Ljava/lang/String;

.field public static final P:[I


# instance fields
.field public A:I

.field public B:I

.field public C:Ld/u/a/d;

.field public D:Landroid/view/animation/Animation;

.field public E:Landroid/view/animation/Animation;

.field public F:Landroid/view/animation/Animation;

.field public G:Landroid/view/animation/Animation;

.field public H:Landroid/view/animation/Animation;

.field public I:Z

.field public J:I

.field public K:Z

.field public L:Landroid/view/animation/Animation$AnimationListener;

.field public final M:Landroid/view/animation/Animation;

.field public final N:Landroid/view/animation/Animation;

.field public a:Landroid/view/View;

.field public b:Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout$h;

.field public c:Z

.field private callback223:Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout$OnChildScrollUpCallback;

.field private compatConsumed220:[I

.field public d:I

.field public e:F

.field public f:F

.field public final g:Ld/h/l/k;

.field public final i:Ld/h/l/g;

.field public final j:[I

.field public final k:[I

.field public l:Z

.field private legacyIntercept227:Z

.field public m:I

.field public n:I

.field public o:F

.field public p:F

.field private final parentHelper238:Landroidx/core/view/NestedScrollingParentHelper;

.field public q:Z

.field public r:I

.field public s:Z

.field public t:Z

.field public final u:Landroid/view/animation/DecelerateInterpolator;

.field public v:Ld/u/a/a;

.field public w:I

.field public x:I

.field public y:F

.field public z:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 3

    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 8

    invoke-direct {p0, p1, p2}, Landroid/view/ViewGroup;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 v0, 0x0

    iput-boolean v0, p0, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->c:Z

    const/high16 v1, -0x40800000    # -1.0f

    iput v1, p0, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->e:F

    const/4 v1, 0x2

    new-array v2, v1, [I

    iput-object v2, p0, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->j:[I

    new-array v1, v1, [I

    iput-object v1, p0, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->k:[I

    const/4 v1, -0x1

    iput v1, p0, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->r:I

    iput v1, p0, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->w:I

    new-instance v1, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout$a;

    invoke-direct {v1, p0}, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout$a;-><init>(Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;)V

    iput-object v1, p0, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->L:Landroid/view/animation/Animation$AnimationListener;

    new-instance v1, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout$e;

    invoke-direct {v1, p0}, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout$e;-><init>(Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;)V

    iput-object v1, p0, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->M:Landroid/view/animation/Animation;

    new-instance v1, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout$f;

    invoke-direct {v1, p0}, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout$f;-><init>(Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;)V

    iput-object v1, p0, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->N:Landroid/view/animation/Animation;

    invoke-static {p1}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/ViewConfiguration;->getScaledTouchSlop()I

    move-result v1

    iput v1, p0, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->d:I

    invoke-virtual {p0}, Landroid/view/ViewGroup;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x10e0001

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v1

    iput v1, p0, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->m:I

    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->setWillNotDraw(Z)V

    new-instance v1, Landroid/view/animation/DecelerateInterpolator;

    const/high16 v2, 0x40000000    # 2.0f

    invoke-direct {v1, v2}, Landroid/view/animation/DecelerateInterpolator;-><init>(F)V

    iput-object v1, p0, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->u:Landroid/view/animation/DecelerateInterpolator;

    invoke-virtual {p0}, Landroid/view/ViewGroup;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v1

    iget v2, v1, Landroid/util/DisplayMetrics;->density:F

    const/high16 v3, 0x42200000    # 40.0f

    mul-float v2, v2, v3

    float-to-int v2, v2

    iput v2, p0, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->J:I

    .line 1
    new-instance v2, Ld/u/a/a;

    invoke-virtual {p0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-direct {v2, v3}, Ld/u/a/a;-><init>(Landroid/content/Context;)V

    iput-object v2, p0, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->v:Ld/u/a/a;

    new-instance v2, Ld/u/a/d;

    invoke-virtual {p0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-direct {v2, v3}, Ld/u/a/d;-><init>(Landroid/content/Context;)V

    iput-object v2, p0, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->C:Ld/u/a/d;

    iget-object v2, p0, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->C:Ld/u/a/d;

    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Ld/u/a/d;->a(I)V

    iget-object v2, p0, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->v:Ld/u/a/a;

    iget-object v4, p0, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->C:Ld/u/a/d;

    invoke-virtual {v2, v4}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    iget-object v2, p0, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->v:Ld/u/a/a;

    const/16 v4, 0x8

    invoke-virtual {v2, v4}, Landroid/widget/ImageView;->setVisibility(I)V

    iget-object v2, p0, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->v:Ld/u/a/a;

    invoke-virtual {p0, v2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 2
    invoke-virtual {p0, v3}, Landroid/view/ViewGroup;->setChildrenDrawingOrderEnabled(Z)V

    const/high16 v2, 0x42800000    # 64.0f

    iget v1, v1, Landroid/util/DisplayMetrics;->density:F

    mul-float v1, v1, v2

    float-to-int v1, v1

    iput v1, p0, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->A:I

    iget v1, p0, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->A:I

    int-to-float v1, v1

    iput v1, p0, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->e:F

    new-instance v1, Ld/h/l/k;

    invoke-direct {v1}, Ld/h/l/k;-><init>()V

    iput-object v1, p0, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->g:Ld/h/l/k;

    new-instance v1, Landroidx/core/view/NestedScrollingParentHelper;

    invoke-direct {v1, p0}, Landroidx/core/view/NestedScrollingParentHelper;-><init>(Landroid/view/ViewGroup;)V

    iput-object v1, p0, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->parentHelper238:Landroidx/core/view/NestedScrollingParentHelper;

    new-instance v1, Ld/h/l/g;

    invoke-direct {v1, p0}, Ld/h/l/g;-><init>(Landroid/view/View;)V

    iput-object v1, p0, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->i:Ld/h/l/g;

    invoke-virtual {p0, v3}, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->setNestedScrollingEnabled(Z)V

    iget v1, p0, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->J:I

    neg-int v1, v1

    iput v1, p0, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->n:I

    iput v1, p0, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->z:I

    const/high16 v1, 0x3f800000    # 1.0f

    invoke-virtual {p0, v1}, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->c(F)V

    sget-object v1, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->P:[I

    invoke-virtual {p1, p2, v1}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    move-result-object p1

    invoke-virtual {p1, v0, v3}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result p2

    invoke-virtual {p0, p2}, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->setEnabled(Z)V

    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    return-void
.end method

.method private animateOffsetToCorrectPosition(ILandroid/view/animation/Animation$AnimationListener;)V
    .registers 6
    .param p1, "from"    # I
    .param p2, "listener"    # Landroid/view/animation/Animation$AnimationListener;

    .line 1333
    iput p1, p0, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->x:I

    .line 1334
    iget-object v0, p0, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->M:Landroid/view/animation/Animation;

    invoke-virtual {v0}, Landroid/view/animation/Animation;->reset()V

    .line 1335
    iget-object v0, p0, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->M:Landroid/view/animation/Animation;

    const-wide/16 v1, 0xc8

    invoke-virtual {v0, v1, v2}, Landroid/view/animation/Animation;->setDuration(J)V

    .line 1336
    iget-object v0, p0, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->M:Landroid/view/animation/Animation;

    iget-object v1, p0, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->u:Landroid/view/animation/DecelerateInterpolator;

    invoke-virtual {v0, v1}, Landroid/view/animation/Animation;->setInterpolator(Landroid/view/animation/Interpolator;)V

    .line 1337
    if-eqz p2, :cond_0

    .line 1338
    iget-object v0, p0, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->v:Ld/u/a/a;

    invoke-virtual {v0, p2}, Ld/u/a/a;->setAnimationListener(Landroid/view/animation/Animation$AnimationListener;)V

    .line 1340
    :cond_0
    iget-object v0, p0, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->v:Ld/u/a/a;

    invoke-virtual {v0}, Ld/u/a/a;->clearAnimation()V

    .line 1341
    iget-object v0, p0, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->v:Ld/u/a/a;

    iget-object v1, p0, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->M:Landroid/view/animation/Animation;

    invoke-virtual {v0, v1}, Ld/u/a/a;->startAnimation(Landroid/view/animation/Animation;)V

    .line 1342
    return-void
.end method

.method private animateOffsetToStartPosition(ILandroid/view/animation/Animation$AnimationListener;)V
    .registers 6
    .param p1, "from"    # I
    .param p2, "listener"    # Landroid/view/animation/Animation$AnimationListener;

    .line 1345
    iget-boolean v0, p0, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->s:Z

    if-eqz v0, :cond_0

    .line 1347
    invoke-direct {p0, p1, p2}, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->startScaleDownReturnToStartAnimation(ILandroid/view/animation/Animation$AnimationListener;)V

    goto :goto_0

    .line 1349
    :cond_0
    iput p1, p0, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->x:I

    .line 1350
    iget-object v0, p0, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->N:Landroid/view/animation/Animation;

    invoke-virtual {v0}, Landroid/view/animation/Animation;->reset()V

    .line 1351
    iget-object v0, p0, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->N:Landroid/view/animation/Animation;

    const-wide/16 v1, 0xc8

    invoke-virtual {v0, v1, v2}, Landroid/view/animation/Animation;->setDuration(J)V

    .line 1352
    iget-object v0, p0, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->N:Landroid/view/animation/Animation;

    iget-object v1, p0, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->u:Landroid/view/animation/DecelerateInterpolator;

    invoke-virtual {v0, v1}, Landroid/view/animation/Animation;->setInterpolator(Landroid/view/animation/Interpolator;)V

    .line 1353
    if-eqz p2, :cond_1

    .line 1354
    iget-object v0, p0, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->v:Ld/u/a/a;

    invoke-virtual {v0, p2}, Ld/u/a/a;->setAnimationListener(Landroid/view/animation/Animation$AnimationListener;)V

    .line 1356
    :cond_1
    iget-object v0, p0, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->v:Ld/u/a/a;

    invoke-virtual {v0}, Ld/u/a/a;->clearAnimation()V

    .line 1357
    iget-object v0, p0, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->v:Ld/u/a/a;

    iget-object v1, p0, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->N:Landroid/view/animation/Animation;

    invoke-virtual {v0, v1}, Ld/u/a/a;->startAnimation(Landroid/view/animation/Animation;)V

    .line 1359
    :goto_0
    return-void
.end method

.method private setRefreshingWithoutSwipeGesture(ZZ)V
    .registers 6
    .param p1, "refreshing"    # Z
    .param p2, "notify"    # Z

    .line 526
    if-eqz p1, :cond_1

    iget-boolean v0, p0, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->c:Z

    if-eq v0, p1, :cond_1

    .line 528
    iput-boolean p1, p0, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->c:Z

    .line 529
    const/4 v0, 0x0

    .line 530
    .local v0, "endTarget":I
    iget-boolean v1, p0, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->K:Z

    if-nez v1, :cond_0

    .line 531
    iget v1, p0, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->A:I

    iget v2, p0, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->z:I

    add-int/2addr v1, v2

    .end local v0    # "endTarget":I
    .local v1, "endTarget":I
    goto :goto_0

    .line 533
    .end local v1    # "endTarget":I
    .restart local v0    # "endTarget":I
    :cond_0
    iget v1, p0, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->A:I

    .line 535
    .end local v0    # "endTarget":I
    .restart local v1    # "endTarget":I
    :goto_0
    iget v0, p0, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->n:I

    sub-int v0, v1, v0

    invoke-virtual {p0, v0}, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->setTargetOffsetTopAndBottom(I)V

    .line 536
    iput-boolean p2, p0, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->I:Z

    .line 537
    iget-object v0, p0, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->L:Landroid/view/animation/Animation$AnimationListener;

    invoke-direct {p0, v0}, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->startScaleUpAnimation(Landroid/view/animation/Animation$AnimationListener;)V

    .line 538
    .end local v1    # "endTarget":I
    goto :goto_1

    .line 539
    :cond_1
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->a(ZZ)V

    .line 541
    :goto_1
    return-void
.end method

.method private startProgressAlphaMaxAnimation()V
    .registers 3

    .line 574
    iget-object v0, p0, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->C:Ld/u/a/d;

    invoke-virtual {v0}, Ld/u/a/d;->getAlpha()I

    move-result v0

    const/16 v1, 0xff

    invoke-virtual {p0, v0, v1}, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->a(II)Landroid/view/animation/Animation;

    move-result-object v0

    iput-object v0, p0, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->G:Landroid/view/animation/Animation;

    .line 575
    return-void
.end method

.method private startProgressAlphaStartAnimation()V
    .registers 3

    .line 570
    iget-object v0, p0, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->C:Ld/u/a/d;

    invoke-virtual {v0}, Ld/u/a/d;->getAlpha()I

    move-result v0

    const/16 v1, 0x4c

    invoke-virtual {p0, v0, v1}, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->a(II)Landroid/view/animation/Animation;

    move-result-object v0

    iput-object v0, p0, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->F:Landroid/view/animation/Animation;

    .line 571
    return-void
.end method

.method private startScaleDownReturnToStartAnimation(ILandroid/view/animation/Animation$AnimationListener;)V
    .registers 6
    .param p1, "from"    # I
    .param p2, "listener"    # Landroid/view/animation/Animation$AnimationListener;

    .line 1392
    iput p1, p0, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->x:I

    .line 1393
    iget-object v0, p0, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->v:Ld/u/a/a;

    invoke-virtual {v0}, Ld/u/a/a;->getScaleX()F

    move-result v0

    iput v0, p0, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->y:F

    .line 1394
    new-instance v0, Ld/u/a/f;

    invoke-direct {v0, p0}, Ld/u/a/f;-><init>(Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;)V

    iput-object v0, p0, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->H:Landroid/view/animation/Animation;

    .line 1402
    iget-object v0, p0, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->H:Landroid/view/animation/Animation;

    const-wide/16 v1, 0x96

    invoke-virtual {v0, v1, v2}, Landroid/view/animation/Animation;->setDuration(J)V

    .line 1403
    if-eqz p2, :cond_0

    .line 1404
    iget-object v0, p0, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->v:Ld/u/a/a;

    invoke-virtual {v0, p2}, Ld/u/a/a;->setAnimationListener(Landroid/view/animation/Animation$AnimationListener;)V

    .line 1406
    :cond_0
    iget-object v0, p0, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->v:Ld/u/a/a;

    invoke-virtual {v0}, Ld/u/a/a;->clearAnimation()V

    .line 1407
    iget-object v0, p0, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->v:Ld/u/a/a;

    iget-object v1, p0, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->H:Landroid/view/animation/Animation;

    invoke-virtual {v0, v1}, Ld/u/a/a;->startAnimation(Landroid/view/animation/Animation;)V

    .line 1408
    return-void
.end method

.method private startScaleUpAnimation(Landroid/view/animation/Animation$AnimationListener;)V
    .registers 5
    .param p1, "listener"    # Landroid/view/animation/Animation$AnimationListener;

    .line 500
    iget-object v0, p0, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->v:Ld/u/a/a;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ld/u/a/a;->setVisibility(I)V

    .line 501
    iget-object v0, p0, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->C:Ld/u/a/d;

    const/16 v1, 0xff

    invoke-virtual {v0, v1}, Ld/u/a/d;->setAlpha(I)V

    .line 502
    new-instance v0, Ld/u/a/e;

    invoke-direct {v0, p0}, Ld/u/a/e;-><init>(Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;)V

    iput-object v0, p0, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->D:Landroid/view/animation/Animation;

    .line 508
    iget-object v0, p0, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->D:Landroid/view/animation/Animation;

    iget v1, p0, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->m:I

    int-to-long v1, v1

    invoke-virtual {v0, v1, v2}, Landroid/view/animation/Animation;->setDuration(J)V

    .line 509
    if-eqz p1, :cond_0

    .line 510
    iget-object v0, p0, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->v:Ld/u/a/a;

    invoke-virtual {v0, p1}, Ld/u/a/a;->setAnimationListener(Landroid/view/animation/Animation$AnimationListener;)V

    .line 512
    :cond_0
    iget-object v0, p0, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->v:Ld/u/a/a;

    invoke-virtual {v0}, Ld/u/a/a;->clearAnimation()V

    .line 513
    iget-object v0, p0, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->v:Ld/u/a/a;

    iget-object v1, p0, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->D:Landroid/view/animation/Animation;

    invoke-virtual {v0, v1}, Ld/u/a/a;->startAnimation(Landroid/view/animation/Animation;)V

    .line 514
    return-void
.end method


# virtual methods
.method public final a(II)Landroid/view/animation/Animation;
    .registers 6
    .param p1, "startingAlpha"    # I
    .param p2, "endingAlpha"    # I

    .line 578
    new-instance v0, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout$c;

    invoke-direct {v0, p0, p1, p2}, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout$c;-><init>(Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;II)V

    .line 585
    .local v0, "alpha":Landroid/view/animation/Animation;
    const-wide/16 v1, 0x12c

    invoke-virtual {v0, v1, v2}, Landroid/view/animation/Animation;->setDuration(J)V

    .line 587
    iget-object v1, p0, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->v:Ld/u/a/a;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Ld/u/a/a;->setAnimationListener(Landroid/view/animation/Animation$AnimationListener;)V

    .line 588
    iget-object v1, p0, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->v:Ld/u/a/a;

    invoke-virtual {v1}, Ld/u/a/a;->clearAnimation()V

    .line 589
    iget-object v1, p0, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->v:Ld/u/a/a;

    invoke-virtual {v1, v0}, Ld/u/a/a;->startAnimation(Landroid/view/animation/Animation;)V

    .line 590
    return-object v0
.end method

.method public final a(F)V
    .registers 5
    .param p1, "overscrollTop"    # F

    .line 1209
    iget v0, p0, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->e:F

    cmpl-float v0, p1, v0

    if-lez v0, :cond_0

    .line 1210
    const/4 v0, 0x1

    invoke-virtual {p0, v0, v0}, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->a(ZZ)V

    goto :goto_0

    .line 1213
    :cond_0
    const/4 v0, 0x0

    iput-boolean v0, p0, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->c:Z

    .line 1214
    iget-object v1, p0, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->C:Ld/u/a/d;

    const/4 v2, 0x0

    invoke-virtual {v1, v2, v2}, Ld/u/a/d;->setStartEndTrim(FF)V

    .line 1215
    const/4 v1, 0x0

    .line 1216
    .local v1, "listener":Landroid/view/animation/Animation$AnimationListener;
    iget-boolean v2, p0, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->s:Z

    if-nez v2, :cond_1

    .line 1217
    new-instance v2, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout$d;

    invoke-direct {v2, p0}, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout$d;-><init>(Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;)V

    move-object v1, v2

    .line 1236
    :cond_1
    iget v2, p0, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->n:I

    invoke-direct {p0, v2, v1}, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->animateOffsetToStartPosition(ILandroid/view/animation/Animation$AnimationListener;)V

    .line 1237
    iget-object v2, p0, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->C:Ld/u/a/d;

    invoke-virtual {v2, v0}, Ld/u/a/d;->setArrowEnabled(Z)V

    .line 1239
    .end local v1    # "listener":Landroid/view/animation/Animation$AnimationListener;
    :goto_0
    return-void
.end method

.method public final a(Landroid/view/MotionEvent;)V
    .registers 6
    .param p1, "ev"    # Landroid/view/MotionEvent;

    .line 1417
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionIndex()I

    move-result v0

    .line 1418
    .local v0, "pointerIndex":I
    invoke-virtual {p1, v0}, Landroid/view/MotionEvent;->getPointerId(I)I

    move-result v1

    .line 1419
    .local v1, "pointerId":I
    iget v2, p0, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->r:I

    if-ne v1, v2, :cond_1

    .line 1422
    if-nez v0, :cond_0

    const/4 v2, 0x1

    goto :goto_0

    :cond_0
    const/4 v2, 0x0

    .line 1423
    .local v2, "newPointerIndex":I
    :goto_0
    invoke-virtual {p1, v2}, Landroid/view/MotionEvent;->getPointerId(I)I

    move-result v3

    iput v3, p0, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->r:I

    .line 1425
    .end local v2    # "newPointerIndex":I
    :cond_1
    return-void
.end method

.method public a(Landroid/view/View;I)V
    .registers 3

    if-nez p2, :cond_0

    invoke-virtual {p0, p1}, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->onStopNestedScroll(Landroid/view/View;)V

    :cond_0
    return-void
.end method

.method public a(Landroid/view/View;IIIII)V
    .registers 15

    if-nez p6, :cond_1

    iget-object v7, p0, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->compatConsumed220:[I

    if-nez v7, :cond_0

    const/4 v0, 0x2

    new-array v7, v0, [I

    iput-object v7, p0, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->compatConsumed220:[I

    :cond_0
    const/4 v0, 0x0

    const/4 v1, 0x1

    aput v0, v7, v0

    aput v0, v7, v1

    move-object v0, p0

    move-object v1, p1

    move v2, p2

    move v3, p3

    move v4, p4

    move v5, p5

    move v6, p6

    invoke-virtual/range {v0 .. v7}, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->a(Landroid/view/View;IIIII[I)V

    :cond_1
    return-void
.end method

.method public a(Landroid/view/View;IIIII[I)V
    .registers 16

    if-nez p6, :cond_1

    const/4 v0, 0x0

    const/4 v1, 0x1

    iget-object v5, p0, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->k:[I

    aput v0, v5, v0

    aput v0, v5, v1

    aget v0, p7, v1

    move p1, v0

    iget-object v0, p0, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->i:Ld/h/l/g;

    move v1, p2

    move v2, p3

    move v3, p4

    move v4, p5

    move v6, p6

    move-object v7, p7

    invoke-virtual/range {v0 .. v7}, Ld/h/l/g;->a(IIII[II[I)Z

    const/4 v1, 0x1

    aget v2, p7, v1

    sub-int/2addr v2, p1

    sub-int v3, p5, v2

    move v4, v3

    if-nez v3, :cond_0

    iget-object v5, p0, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->k:[I

    aget v4, v5, v1

    add-int/2addr v4, p5

    :cond_0
    if-gez v4, :cond_1

    invoke-virtual {p0}, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->a()Z

    move-result v0

    if-nez v0, :cond_1

    invoke-static {v4}, Ljava/lang/Math;->abs(I)I

    move-result v4

    int-to-float v4, v4

    iget v5, p0, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->f:F

    add-float/2addr v5, v4

    iput v5, p0, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->f:F

    invoke-virtual {p0, v5}, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->b(F)V

    aget v2, p7, v1

    add-int/2addr v2, v3

    aput v2, p7, v1

    :cond_1
    return-void
.end method

.method public a(Landroid/view/View;II[II)V
    .registers 6

    if-nez p5, :cond_0

    invoke-virtual {p0, p1, p2, p3, p4}, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->onNestedPreScroll(Landroid/view/View;II[I)V

    :cond_0
    return-void
.end method

.method public a(Landroid/view/View;Landroid/view/View;II)V
    .registers 5

    if-nez p4, :cond_0

    invoke-virtual {p0, p1, p2, p3}, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->onNestedScrollAccepted(Landroid/view/View;Landroid/view/View;I)V

    :cond_0
    return-void
.end method

.method public a(Landroid/view/animation/Animation$AnimationListener;)V
    .registers 5
    .param p1, "listener"    # Landroid/view/animation/Animation$AnimationListener;

    .line 557
    new-instance v0, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout$b;

    invoke-direct {v0, p0}, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout$b;-><init>(Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;)V

    iput-object v0, p0, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->E:Landroid/view/animation/Animation;

    .line 563
    iget-object v0, p0, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->E:Landroid/view/animation/Animation;

    const-wide/16 v1, 0x96

    invoke-virtual {v0, v1, v2}, Landroid/view/animation/Animation;->setDuration(J)V

    .line 564
    iget-object v0, p0, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->v:Ld/u/a/a;

    invoke-virtual {v0, p1}, Ld/u/a/a;->setAnimationListener(Landroid/view/animation/Animation$AnimationListener;)V

    .line 565
    iget-object v0, p0, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->v:Ld/u/a/a;

    invoke-virtual {v0}, Ld/u/a/a;->clearAnimation()V

    .line 566
    iget-object v0, p0, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->v:Ld/u/a/a;

    iget-object v1, p0, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->E:Landroid/view/animation/Animation;

    invoke-virtual {v0, v1}, Ld/u/a/a;->startAnimation(Landroid/view/animation/Animation;)V

    .line 567
    return-void
.end method

.method public final a(ZZ)V
    .registers 5
    .param p1, "refreshing"    # Z
    .param p2, "notify"    # Z

    .line 544
    iget-boolean v0, p0, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->c:Z

    if-eq v0, p1, :cond_1

    .line 545
    iput-boolean p2, p0, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->I:Z

    .line 546
    invoke-virtual {p0}, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->b()V

    .line 547
    iput-boolean p1, p0, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->c:Z

    .line 548
    iget-boolean v0, p0, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->c:Z

    if-eqz v0, :cond_0

    .line 549
    iget v0, p0, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->n:I

    iget-object v1, p0, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->L:Landroid/view/animation/Animation$AnimationListener;

    invoke-direct {p0, v0, v1}, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->animateOffsetToCorrectPosition(ILandroid/view/animation/Animation$AnimationListener;)V

    goto :goto_0

    .line 551
    :cond_0
    iget-object v0, p0, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->L:Landroid/view/animation/Animation$AnimationListener;

    invoke-virtual {p0, v0}, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->a(Landroid/view/animation/Animation$AnimationListener;)V

    .line 554
    :cond_1
    :goto_0
    return-void
.end method

.method public a()Z
    .registers 5

    iget-object v0, p0, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->callback223:Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout$OnChildScrollUpCallback;

    if-eqz v0, :cond_0

    iget-object v1, p0, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->a:Landroid/view/View;

    invoke-interface {v0, p0, v1}, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout$OnChildScrollUpCallback;->canChildScrollUp(Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;Landroid/view/View;)Z

    move-result v0

    return v0

    :cond_0
    iget-object v0, p0, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->a:Landroid/view/View;

    instance-of v1, v0, Landroid/widget/ListView;

    const/4 v2, -0x1

    if-eqz v1, :cond_5

    check-cast v0, Landroid/widget/ListView;

    .line 1
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0x13

    if-lt v1, v3, :cond_1

    invoke-virtual {v0, v2}, Landroid/widget/ListView;->canScrollList(I)Z

    move-result v0

    goto :goto_2

    :cond_1
    invoke-virtual {v0}, Landroid/widget/ListView;->getChildCount()I

    move-result v1

    const/4 v2, 0x0

    if-nez v1, :cond_2

    goto :goto_0

    :cond_2
    invoke-virtual {v0}, Landroid/widget/ListView;->getFirstVisiblePosition()I

    move-result v1

    invoke-virtual {v0, v2}, Landroid/widget/ListView;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    invoke-virtual {v3}, Landroid/view/View;->getTop()I

    move-result v3

    if-gtz v1, :cond_4

    invoke-virtual {v0}, Landroid/widget/ListView;->getListPaddingTop()I

    move-result v0

    if-ge v3, v0, :cond_3

    goto :goto_1

    :cond_3
    :goto_0
    const/4 v0, 0x0

    goto :goto_2

    :cond_4
    :goto_1
    const/4 v0, 0x1

    :goto_2
    return v0

    .line 2
    :cond_5
    invoke-virtual {v0, v2}, Landroid/view/View;->canScrollVertically(I)Z

    move-result v0

    return v0
.end method

.method public final a(Landroid/view/animation/Animation;)Z
    .registers 3
    .param p1, "animation"    # Landroid/view/animation/Animation;

    .line 1153
    if-eqz p1, :cond_0

    invoke-virtual {p1}, Landroid/view/animation/Animation;->hasStarted()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p1}, Landroid/view/animation/Animation;->hasEnded()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public final b()V
    .registers 4

    .line 666
    iget-object v0, p0, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->a:Landroid/view/View;

    if-nez v0, :cond_1

    .line 667
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    invoke-virtual {p0}, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->getChildCount()I

    move-result v1

    if-ge v0, v1, :cond_1

    .line 668
    invoke-virtual {p0, v0}, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    .line 669
    .local v1, "child":Landroid/view/View;
    iget-object v2, p0, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->v:Ld/u/a/a;

    invoke-virtual {v1, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 670
    iput-object v1, p0, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->a:Landroid/view/View;

    .line 671
    goto :goto_1

    .line 667
    .end local v1    # "child":Landroid/view/View;
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 675
    .end local v0    # "i":I
    :cond_1
    :goto_1
    return-void
.end method

.method public final b(F)V
    .registers 18
    .param p1, "overscrollTop"    # F

    .line 1157
    move-object/from16 v0, p0

    iget-object v1, v0, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->C:Ld/u/a/d;

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Ld/u/a/d;->setArrowEnabled(Z)V

    .line 1158
    iget v1, v0, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->e:F

    div-float v1, p1, v1

    .line 1160
    .local v1, "originalDragPercent":F
    invoke-static {v1}, Ljava/lang/Math;->abs(F)F

    move-result v2

    const/high16 v3, 0x3f800000    # 1.0f

    invoke-static {v3, v2}, Ljava/lang/Math;->min(FF)F

    move-result v2

    .line 1161
    .local v2, "dragPercent":F
    float-to-double v4, v2

    const-wide v6, 0x3fd999999999999aL    # 0.4

    sub-double/2addr v4, v6

    const-wide/16 v6, 0x0

    invoke-static {v4, v5, v6, v7}, Ljava/lang/Math;->max(DD)D

    move-result-wide v4

    double-to-float v4, v4

    const/high16 v5, 0x40a00000    # 5.0f

    mul-float/2addr v4, v5

    const/high16 v5, 0x40400000    # 3.0f

    div-float/2addr v4, v5

    .line 1162
    .local v4, "adjustedPercent":F
    invoke-static/range {p1 .. p1}, Ljava/lang/Math;->abs(F)F

    move-result v5

    iget v6, v0, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->e:F

    sub-float/2addr v5, v6

    .line 1163
    .local v5, "extraOS":F
    iget v6, v0, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->B:I

    if-lez v6, :cond_0

    .line 1164
    iget v6, v0, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->B:I

    int-to-float v6, v6

    goto :goto_1

    .line 1165
    :cond_0
    iget-boolean v6, v0, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->K:Z

    if-eqz v6, :cond_1

    .line 1166
    iget v6, v0, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->A:I

    iget v7, v0, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->z:I

    sub-int/2addr v6, v7

    goto :goto_0

    .line 1167
    :cond_1
    iget v6, v0, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->A:I

    :goto_0
    int-to-float v6, v6

    :goto_1
    nop

    .line 1168
    .local v6, "slingshotDist":F
    const/high16 v7, 0x40000000    # 2.0f

    mul-float v8, v6, v7

    invoke-static {v5, v8}, Ljava/lang/Math;->min(FF)F

    move-result v8

    div-float/2addr v8, v6

    const/4 v9, 0x0

    invoke-static {v9, v8}, Ljava/lang/Math;->max(FF)F

    move-result v8

    .line 1170
    .local v8, "tensionSlingshotPercent":F
    const/high16 v10, 0x40800000    # 4.0f

    div-float v11, v8, v10

    float-to-double v11, v11

    div-float v10, v8, v10

    float-to-double v13, v10

    move v10, v7

    move v15, v8

    .end local v8    # "tensionSlingshotPercent":F
    .local v15, "tensionSlingshotPercent":F
    const-wide/high16 v7, 0x4000000000000000L    # 2.0

    invoke-static {v13, v14, v7, v8}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v7

    sub-double/2addr v11, v7

    double-to-float v7, v11

    mul-float/2addr v7, v10

    .line 1172
    .local v7, "tensionPercent":F
    mul-float v8, v6, v7

    mul-float/2addr v8, v10

    .line 1174
    .local v8, "extraMove":F
    iget v11, v0, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->z:I

    mul-float v12, v6, v2

    add-float/2addr v12, v8

    float-to-int v12, v12

    add-int/2addr v11, v12

    .line 1176
    .local v11, "targetY":I
    iget-object v12, v0, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->v:Ld/u/a/a;

    invoke-virtual {v12}, Ld/u/a/a;->getVisibility()I

    move-result v12

    if-eqz v12, :cond_2

    .line 1177
    iget-object v12, v0, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->v:Ld/u/a/a;

    const/4 v13, 0x0

    invoke-virtual {v12, v13}, Ld/u/a/a;->setVisibility(I)V

    .line 1179
    :cond_2
    iget-boolean v12, v0, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->s:Z

    if-nez v12, :cond_3

    .line 1180
    iget-object v12, v0, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->v:Ld/u/a/a;

    invoke-virtual {v12, v3}, Ld/u/a/a;->setScaleX(F)V

    .line 1181
    iget-object v12, v0, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->v:Ld/u/a/a;

    invoke-virtual {v12, v3}, Ld/u/a/a;->setScaleY(F)V

    .line 1184
    :cond_3
    iget-boolean v12, v0, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->s:Z

    if-eqz v12, :cond_4

    .line 1185
    iget v12, v0, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->e:F

    div-float v12, p1, v12

    invoke-static {v3, v12}, Ljava/lang/Math;->min(FF)F

    move-result v12

    invoke-virtual {v0, v12}, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->setAnimationProgress(F)V

    .line 1187
    :cond_4
    iget v12, v0, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->e:F

    cmpg-float v12, p1, v12

    if-gez v12, :cond_5

    .line 1188
    iget-object v12, v0, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->C:Ld/u/a/d;

    invoke-virtual {v12}, Ld/u/a/d;->getAlpha()I

    move-result v12

    const/16 v13, 0x4c

    if-le v12, v13, :cond_6

    iget-object v12, v0, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->F:Landroid/view/animation/Animation;

    .line 1189
    invoke-virtual {v0, v12}, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->a(Landroid/view/animation/Animation;)Z

    move-result v12

    if-nez v12, :cond_6

    .line 1191
    invoke-direct {v0}, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->startProgressAlphaStartAnimation()V

    goto :goto_2

    .line 1194
    :cond_5
    iget-object v12, v0, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->C:Ld/u/a/d;

    invoke-virtual {v12}, Ld/u/a/d;->getAlpha()I

    move-result v12

    const/16 v13, 0xff

    if-ge v12, v13, :cond_6

    iget-object v12, v0, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->G:Landroid/view/animation/Animation;

    invoke-virtual {v0, v12}, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->a(Landroid/view/animation/Animation;)Z

    move-result v12

    if-nez v12, :cond_6

    .line 1196
    invoke-direct {v0}, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->startProgressAlphaMaxAnimation()V

    .line 1199
    :cond_6
    :goto_2
    const v12, 0x3f4ccccd    # 0.8f

    mul-float v13, v4, v12

    .line 1200
    .local v13, "strokeStart":F
    iget-object v14, v0, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->C:Ld/u/a/d;

    invoke-static {v12, v13}, Ljava/lang/Math;->min(FF)F

    move-result v12

    invoke-virtual {v14, v9, v12}, Ld/u/a/d;->setStartEndTrim(FF)V

    .line 1201
    iget-object v9, v0, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->C:Ld/u/a/d;

    invoke-static {v3, v4}, Ljava/lang/Math;->min(FF)F

    move-result v3

    invoke-virtual {v9, v3}, Ld/u/a/d;->setArrowScale(F)V

    .line 1203
    const v3, 0x3ecccccd    # 0.4f

    mul-float/2addr v3, v4

    const/high16 v9, -0x41800000    # -0.25f

    add-float/2addr v3, v9

    mul-float v9, v7, v10

    add-float/2addr v3, v9

    const/high16 v9, 0x3f000000    # 0.5f

    mul-float/2addr v3, v9

    .line 1204
    .local v3, "rotation":F
    iget-object v9, v0, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->C:Ld/u/a/d;

    invoke-virtual {v9, v3}, Ld/u/a/d;->setProgressRotation(F)V

    .line 1205
    iget v9, v0, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->n:I

    sub-int v9, v11, v9

    invoke-virtual {v0, v9}, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->setTargetOffsetTopAndBottom(I)V

    .line 1206
    return-void
.end method

.method public b(Landroid/view/View;Landroid/view/View;II)Z
    .registers 6

    if-nez p4, :cond_0

    invoke-virtual {p0, p1, p2, p3}, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->onStartNestedScroll(Landroid/view/View;Landroid/view/View;I)Z

    move-result v0

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public c(F)V
    .registers 5
    .param p1, "interpolatedTime"    # F

    .line 1378
    iget v0, p0, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->x:I

    iget v1, p0, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->z:I

    iget v2, p0, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->x:I

    sub-int/2addr v1, v2

    int-to-float v1, v1

    mul-float/2addr v1, p1

    float-to-int v1, v1

    add-int/2addr v0, v1

    .line 1379
    .local v0, "targetTop":I
    iget-object v1, p0, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->v:Ld/u/a/a;

    invoke-virtual {v1}, Ld/u/a/a;->getTop()I

    move-result v1

    sub-int v1, v0, v1

    .line 1380
    .local v1, "offset":I
    invoke-virtual {p0, v1}, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->setTargetOffsetTopAndBottom(I)V

    .line 1381
    return-void
.end method

.method public canChildScrollUp()Z
    .registers 2

    invoke-virtual {p0}, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->a()Z

    move-result v0

    return v0
.end method

.method public final d(F)V
    .registers 5
    .param p1, "y"    # F

    .line 1324
    iget v0, p0, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->p:F

    sub-float v0, p1, v0

    .line 1325
    .local v0, "yDiff":F
    iget v1, p0, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->d:I

    int-to-float v1, v1

    cmpl-float v1, v0, v1

    if-lez v1, :cond_0

    iget-boolean v1, p0, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->q:Z

    if-nez v1, :cond_0

    .line 1326
    iget v1, p0, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->p:F

    iget v2, p0, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->d:I

    int-to-float v2, v2

    add-float/2addr v1, v2

    iput v1, p0, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->o:F

    .line 1327
    const/4 v1, 0x1

    iput-boolean v1, p0, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->q:Z

    .line 1328
    iget-object v1, p0, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->C:Ld/u/a/d;

    const/16 v2, 0x4c

    invoke-virtual {v1, v2}, Ld/u/a/d;->setAlpha(I)V

    .line 1330
    :cond_0
    return-void
.end method

.method public dispatchKeyEvent(Landroid/view/KeyEvent;)Z
    .registers 4

    if-eqz p1, :cond_1

    invoke-virtual {p1}, Landroid/view/KeyEvent;->getAction()I

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_1

    invoke-virtual {p1}, Landroid/view/KeyEvent;->getKeyCode()I

    move-result v0

    const/16 v1, 0x11d

    if-ne v0, v1, :cond_1

    invoke-virtual {p0}, Landroid/view/View;->isEnabled()Z

    move-result v0

    if-eqz v0, :cond_1

    iget-boolean v0, p0, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->c:Z

    if-nez v0, :cond_0

    const/4 v0, 0x1

    invoke-virtual {p0, v0, v0}, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->a(ZZ)V

    :cond_0
    const/4 v0, 0x1

    return v0

    :cond_1
    invoke-super {p0, p1}, Landroid/view/ViewGroup;->dispatchKeyEvent(Landroid/view/KeyEvent;)Z

    move-result v0

    return v0
.end method

.method public dispatchNestedPreScroll(II[I[II)Z
    .registers 7

    if-nez p5, :cond_0

    invoke-virtual {p0, p1, p2, p3, p4}, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->dispatchNestedPreScroll(II[I[I)Z

    move-result v0

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public dispatchNestedScroll(IIII[II[I)V
    .registers 16

    if-nez p6, :cond_0

    iget-object v0, p0, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->i:Ld/h/l/g;

    move v1, p1

    move v2, p2

    move v3, p3

    move v4, p4

    move-object v5, p5

    move v6, p6

    move-object v7, p7

    invoke-virtual/range {v0 .. v7}, Ld/h/l/g;->a(IIII[II[I)Z

    :cond_0
    return-void
.end method

.method public dispatchNestedScroll(IIII[II)Z
    .registers 8

    if-nez p6, :cond_0

    invoke-virtual/range {p0 .. p5}, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->dispatchNestedScroll(IIII[I)Z

    move-result v0

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public getChildDrawingOrder(II)I
    .registers 4
    .param p1, "childCount"    # I
    .param p2, "i"    # I

    .line 457
    iget v0, p0, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->w:I

    if-gez v0, :cond_0

    .line 458
    return p2

    .line 459
    :cond_0
    add-int/lit8 v0, p1, -0x1

    if-ne p2, v0, :cond_1

    .line 461
    iget v0, p0, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->w:I

    return v0

    .line 462
    :cond_1
    iget v0, p0, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->w:I

    if-lt p2, v0, :cond_2

    .line 464
    add-int/lit8 v0, p2, 0x1

    return v0

    .line 467
    :cond_2
    return p2
.end method

.method public getNestedScrollAxes()I
    .registers 2

    iget-object v0, p0, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->parentHelper238:Landroidx/core/view/NestedScrollingParentHelper;

    invoke-virtual {v0}, Landroidx/core/view/NestedScrollingParentHelper;->getNestedScrollAxes()I

    move-result v0

    return v0
.end method

.method public hasNestedScrollingParent(I)Z
    .registers 3

    if-nez p1, :cond_0

    invoke-virtual {p0}, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->hasNestedScrollingParent()Z

    move-result v0

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isRefreshing()Z
    .registers 2

    iget-boolean v0, p0, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->c:Z

    return v0
.end method

.method public onLayout(ZIIII)V
    .registers 20
    .param p1, "changed"    # Z
    .param p2, "left"    # I
    .param p3, "top"    # I
    .param p4, "right"    # I
    .param p5, "bottom"    # I

    .line 688
    invoke-virtual {p0}, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->getMeasuredWidth()I

    move-result v0

    .line 689
    .local v0, "width":I
    invoke-virtual {p0}, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->getMeasuredHeight()I

    move-result v1

    .line 690
    .local v1, "height":I
    invoke-virtual {p0}, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->getChildCount()I

    move-result v2

    if-nez v2, :cond_0

    .line 691
    return-void

    .line 693
    :cond_0
    iget-object v2, p0, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->a:Landroid/view/View;

    if-nez v2, :cond_1

    .line 694
    invoke-virtual {p0}, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->b()V

    .line 696
    :cond_1
    iget-object v2, p0, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->a:Landroid/view/View;

    if-nez v2, :cond_2

    .line 697
    return-void

    .line 699
    :cond_2
    iget-object v2, p0, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->a:Landroid/view/View;

    .line 700
    .local v2, "child":Landroid/view/View;
    invoke-virtual {p0}, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->getPaddingLeft()I

    move-result v3

    .line 701
    .local v3, "childLeft":I
    invoke-virtual {p0}, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->getPaddingTop()I

    move-result v4

    .line 702
    .local v4, "childTop":I
    invoke-virtual {p0}, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->getPaddingLeft()I

    move-result v5

    sub-int v5, v0, v5

    invoke-virtual {p0}, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->getPaddingRight()I

    move-result v6

    sub-int/2addr v5, v6

    .line 703
    .local v5, "childWidth":I
    invoke-virtual {p0}, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->getPaddingTop()I

    move-result v6

    sub-int v6, v1, v6

    invoke-virtual {p0}, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->getPaddingBottom()I

    move-result v7

    sub-int/2addr v6, v7

    .line 704
    .local v6, "childHeight":I
    add-int v7, v3, v5

    add-int v8, v4, v6

    invoke-virtual {v2, v3, v4, v7, v8}, Landroid/view/View;->layout(IIII)V

    .line 705
    iget-object v7, p0, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->v:Ld/u/a/a;

    invoke-virtual {v7}, Ld/u/a/a;->getMeasuredWidth()I

    move-result v7

    .line 706
    .local v7, "circleWidth":I
    iget-object v8, p0, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->v:Ld/u/a/a;

    invoke-virtual {v8}, Ld/u/a/a;->getMeasuredHeight()I

    move-result v8

    .line 707
    .local v8, "circleHeight":I
    iget-object v9, p0, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->v:Ld/u/a/a;

    div-int/lit8 v10, v0, 0x2

    div-int/lit8 v11, v7, 0x2

    sub-int/2addr v10, v11

    iget v11, p0, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->n:I

    div-int/lit8 v12, v0, 0x2

    div-int/lit8 v13, v7, 0x2

    add-int/2addr v12, v13

    iget v13, p0, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->n:I

    add-int/2addr v13, v8

    invoke-virtual {v9, v10, v11, v12, v13}, Ld/u/a/a;->layout(IIII)V

    .line 709
    return-void
.end method

.method public onMeasure(II)V
    .registers 8
    .param p1, "widthMeasureSpec"    # I
    .param p2, "heightMeasureSpec"    # I

    .line 713
    invoke-super {p0, p1, p2}, Landroid/view/ViewGroup;->onMeasure(II)V

    .line 714
    iget-object v0, p0, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->a:Landroid/view/View;

    if-nez v0, :cond_0

    .line 715
    invoke-virtual {p0}, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->b()V

    .line 717
    :cond_0
    iget-object v0, p0, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->a:Landroid/view/View;

    if-nez v0, :cond_1

    .line 718
    return-void

    .line 720
    :cond_1
    iget-object v0, p0, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->a:Landroid/view/View;

    .line 721
    invoke-virtual {p0}, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->getMeasuredWidth()I

    move-result v1

    invoke-virtual {p0}, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->getPaddingLeft()I

    move-result v2

    sub-int/2addr v1, v2

    invoke-virtual {p0}, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->getPaddingRight()I

    move-result v2

    sub-int/2addr v1, v2

    .line 720
    const/high16 v2, 0x40000000    # 2.0f

    invoke-static {v1, v2}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v1

    .line 723
    invoke-virtual {p0}, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->getMeasuredHeight()I

    move-result v3

    invoke-virtual {p0}, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->getPaddingTop()I

    move-result v4

    sub-int/2addr v3, v4

    invoke-virtual {p0}, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->getPaddingBottom()I

    move-result v4

    sub-int/2addr v3, v4

    .line 722
    invoke-static {v3, v2}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v3

    .line 720
    invoke-virtual {v0, v1, v3}, Landroid/view/View;->measure(II)V

    .line 724
    iget-object v0, p0, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->v:Ld/u/a/a;

    iget v1, p0, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->J:I

    invoke-static {v1, v2}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v1

    iget v3, p0, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->J:I

    .line 725
    invoke-static {v3, v2}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v2

    .line 724
    invoke-virtual {v0, v1, v2}, Ld/u/a/a;->measure(II)V

    .line 726
    const/4 v0, -0x1

    iput v0, p0, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->w:I

    .line 728
    const/4 v0, 0x0

    .local v0, "index":I
    :goto_0
    invoke-virtual {p0}, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->getChildCount()I

    move-result v1

    if-ge v0, v1, :cond_3

    .line 729
    invoke-virtual {p0, v0}, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    iget-object v2, p0, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->v:Ld/u/a/a;

    if-ne v1, v2, :cond_2

    .line 730
    iput v0, p0, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->w:I

    .line 731
    goto :goto_1

    .line 728
    :cond_2
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 734
    .end local v0    # "index":I
    :cond_3
    :goto_1
    return-void
.end method

.method public onNestedPreScroll(Landroid/view/View;II[I)V
    .registers 9

    const/4 p1, 0x0

    const/4 v0, 0x1

    if-lez p3, :cond_1

    iget v1, p0, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->f:F

    cmpl-float v2, v1, p1

    if-lez v2, :cond_1

    int-to-float v2, p3

    cmpl-float v3, v2, v1

    if-lez v3, :cond_0

    float-to-int v1, v1

    aput v1, p4, v0

    iput p1, p0, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->f:F

    goto :goto_0

    :cond_0
    sub-float/2addr v1, v2

    iput v1, p0, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->f:F

    aput p3, p4, v0

    :goto_0
    iget v1, p0, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->f:F

    invoke-virtual {p0, v1}, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->b(F)V

    :cond_1
    iget-boolean v1, p0, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->K:Z

    if-eqz v1, :cond_2

    if-lez p3, :cond_2

    iget v1, p0, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->f:F

    cmpl-float p1, v1, p1

    if-nez p1, :cond_2

    aget p1, p4, v0

    sub-int p1, p3, p1

    invoke-static {p1}, Ljava/lang/Math;->abs(I)I

    move-result p1

    if-lez p1, :cond_2

    iget-object p1, p0, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->v:Ld/u/a/a;

    const/16 v1, 0x8

    invoke-virtual {p1, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    :cond_2
    iget-object p1, p0, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->j:[I

    const/4 v1, 0x0

    aget v2, p4, v1

    sub-int/2addr p2, v2

    aget v2, p4, v0

    sub-int/2addr p3, v2

    const/4 v2, 0x0

    invoke-virtual {p0, p2, p3, p1, v2}, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->dispatchNestedPreScroll(II[I[I)Z

    move-result p2

    if-eqz p2, :cond_3

    aget p2, p4, v1

    aget p3, p1, v1

    add-int/2addr p2, p3

    aput p2, p4, v1

    aget p2, p4, v0

    aget p1, p1, v0

    add-int/2addr p2, p1

    aput p2, p4, v0

    :cond_3
    return-void
.end method

.method public onNestedPreScroll(Landroid/view/View;II[II)V
    .registers 6

    invoke-virtual/range {p0 .. p5}, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->a(Landroid/view/View;II[II)V

    return-void
.end method

.method public onNestedScroll(Landroid/view/View;IIII)V
    .registers 13

    const/4 v6, 0x0

    move-object v0, p0

    move-object v1, p1

    move v2, p2

    move v3, p3

    move v4, p4

    move v5, p5

    invoke-virtual/range {v0 .. v6}, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->a(Landroid/view/View;IIIII)V

    return-void
.end method

.method public onNestedScroll(Landroid/view/View;IIIII)V
    .registers 7

    invoke-virtual/range {p0 .. p6}, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->a(Landroid/view/View;IIIII)V

    return-void
.end method

.method public onNestedScroll(Landroid/view/View;IIIII[I)V
    .registers 8

    invoke-virtual/range {p0 .. p7}, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->a(Landroid/view/View;IIIII[I)V

    return-void
.end method

.method public onNestedScrollAccepted(Landroid/view/View;Landroid/view/View;I)V
    .registers 5

    iget-object v0, p0, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->parentHelper238:Landroidx/core/view/NestedScrollingParentHelper;

    invoke-virtual {v0, p1, p2, p3}, Landroidx/core/view/NestedScrollingParentHelper;->onNestedScrollAccepted(Landroid/view/View;Landroid/view/View;I)V

    iget-object p1, p0, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->g:Ld/h/l/k;

    .line 1
    iput p3, p1, Ld/h/l/k;->a:I

    and-int/lit8 p1, p3, 0x2

    .line 2
    invoke-virtual {p0, p1}, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->startNestedScroll(I)Z

    const/4 p1, 0x0

    iput p1, p0, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->f:F

    const/4 p1, 0x1

    iput-boolean p1, p0, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->l:Z

    return-void
.end method

.method public onNestedScrollAccepted(Landroid/view/View;Landroid/view/View;II)V
    .registers 5

    invoke-virtual/range {p0 .. p4}, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->a(Landroid/view/View;Landroid/view/View;II)V

    return-void
.end method

.method protected onRestoreInstanceState(Landroid/os/Parcelable;)V
    .registers 4

    instance-of v0, p1, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout$SavedState;

    if-eqz v0, :cond_1

    check-cast p1, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout$SavedState;

    invoke-virtual {p1}, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout$SavedState;->getSuperState()Landroid/os/Parcelable;

    move-result-object v0

    invoke-super {p0, v0}, Landroid/view/ViewGroup;->onRestoreInstanceState(Landroid/os/Parcelable;)V

    iget-boolean v0, p1, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout$SavedState;->mRefreshing:Z

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->c:Z

    if-nez v0, :cond_0

    invoke-static {p0}, Le/e/a/Refresh192;->ownsRefresh260(Landroid/view/View;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->setRefreshing(Z)V

    :cond_0
    return-void

    :cond_1
    invoke-super {p0, p1}, Landroid/view/ViewGroup;->onRestoreInstanceState(Landroid/os/Parcelable;)V

    return-void
.end method

.method protected onSaveInstanceState()Landroid/os/Parcelable;
    .registers 4

    invoke-super {p0}, Landroid/view/ViewGroup;->onSaveInstanceState()Landroid/os/Parcelable;

    move-result-object v0

    new-instance v1, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout$SavedState;

    iget-boolean v2, p0, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->c:Z

    invoke-direct {v1, v0, v2}, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout$SavedState;-><init>(Landroid/os/Parcelable;Z)V

    return-object v1
.end method

.method public onStartNestedScroll(Landroid/view/View;Landroid/view/View;II)Z
    .registers 6

    invoke-virtual/range {p0 .. p4}, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->b(Landroid/view/View;Landroid/view/View;II)Z

    move-result v0

    return v0
.end method

.method public onStopNestedScroll(Landroid/view/View;)V
    .registers 4

    iget-object v0, p0, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->parentHelper238:Landroidx/core/view/NestedScrollingParentHelper;

    invoke-virtual {v0, p1}, Landroidx/core/view/NestedScrollingParentHelper;->onStopNestedScroll(Landroid/view/View;)V

    iget-object p1, p0, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->g:Ld/h/l/k;

    const/4 v0, 0x0

    .line 1
    invoke-virtual {p1, v0}, Ld/h/l/k;->a(I)V

    .line 2
    iput-boolean v0, p0, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->l:Z

    iget p1, p0, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->f:F

    const/4 v0, 0x0

    cmpl-float v1, p1, v0

    if-lez v1, :cond_0

    invoke-virtual {p0, p1}, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->a(F)V

    iput v0, p0, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->f:F

    goto :goto_0

    :cond_0
    iget-boolean p1, p0, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->c:Z

    if-nez p1, :cond_2

    iget-object p1, p0, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->v:Ld/u/a/a;

    invoke-virtual {p1}, Landroid/view/View;->getVisibility()I

    move-result p1

    if-eqz p1, :cond_1

    iget p1, p0, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->n:I

    iget v1, p0, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->z:I

    if-eq p1, v1, :cond_2

    :cond_1
    new-instance p1, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout$Reset220;

    invoke-direct {p1, p0}, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout$Reset220;-><init>(Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;)V

    invoke-virtual {p0, p1}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    :cond_2
    :goto_0
    invoke-virtual {p0}, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->stopNestedScroll()V

    return-void
.end method

.method public onStopNestedScroll(Landroid/view/View;I)V
    .registers 3

    invoke-virtual/range {p0 .. p2}, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->a(Landroid/view/View;I)V

    return-void
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .registers 7

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v0

    iget-boolean v1, p0, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->t:Z

    const/4 v2, 0x0

    if-eqz v1, :cond_0

    if-nez v0, :cond_0

    iput-boolean v2, p0, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->t:Z

    :cond_0
    invoke-virtual {p0}, Landroid/view/ViewGroup;->isEnabled()Z

    move-result v1

    if-eqz v1, :cond_f

    iget-boolean v1, p0, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->t:Z

    if-nez v1, :cond_f

    invoke-virtual {p0}, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->a()Z

    move-result v1

    if-nez v1, :cond_f

    iget-boolean v1, p0, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->c:Z

    if-nez v1, :cond_f

    iget-boolean v1, p0, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->l:Z

    if-eqz v1, :cond_1

    goto/16 :goto_1

    :cond_1
    const/4 v1, 0x1

    if-eqz v0, :cond_d

    const/high16 v3, 0x3f000000    # 0.5f

    if-eq v0, v1, :cond_a

    const/4 v4, 0x2

    if-eq v0, v4, :cond_6

    const/4 v3, 0x3

    if-eq v0, v3, :cond_5

    const/4 v3, 0x5

    if-eq v0, v3, :cond_3

    const/4 v2, 0x6

    if-eq v0, v2, :cond_2

    goto/16 :goto_0

    :cond_2
    invoke-virtual {p0, p1}, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->a(Landroid/view/MotionEvent;)V

    goto :goto_0

    :cond_3
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionIndex()I

    move-result v0

    if-gez v0, :cond_4

    sget-object p1, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->O:Ljava/lang/String;

    const-string v0, "Got ACTION_POINTER_DOWN event but have an invalid action index."

    invoke-static {p1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    return v2

    :cond_4
    invoke-virtual {p1, v0}, Landroid/view/MotionEvent;->getPointerId(I)I

    move-result p1

    iput p1, p0, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->r:I

    goto :goto_0

    :cond_5
    return v2

    :cond_6
    iget v0, p0, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->r:I

    invoke-virtual {p1, v0}, Landroid/view/MotionEvent;->findPointerIndex(I)I

    move-result v0

    if-gez v0, :cond_7

    sget-object p1, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->O:Ljava/lang/String;

    const-string v0, "Got ACTION_MOVE event but have an invalid active pointer id."

    invoke-static {p1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    return v2

    :cond_7
    invoke-virtual {p1, v0}, Landroid/view/MotionEvent;->getY(I)F

    move-result p1

    invoke-virtual {p0, p1}, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->d(F)V

    iget-boolean v0, p0, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->q:Z

    if-eqz v0, :cond_e

    iget v0, p0, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->o:F

    sub-float/2addr p1, v0

    mul-float p1, p1, v3

    const/4 v0, 0x0

    cmpl-float v0, p1, v0

    if-lez v0, :cond_9

    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    if-eqz v0, :cond_8

    invoke-interface {v0, v1}, Landroid/view/ViewParent;->requestDisallowInterceptTouchEvent(Z)V

    :cond_8
    invoke-virtual {p0, p1}, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->b(F)V

    goto :goto_0

    :cond_9
    return v2

    :cond_a
    iget v0, p0, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->r:I

    invoke-virtual {p1, v0}, Landroid/view/MotionEvent;->findPointerIndex(I)I

    move-result v0

    if-gez v0, :cond_b

    sget-object p1, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->O:Ljava/lang/String;

    const-string v0, "Got ACTION_UP event but don\'t have an active pointer id."

    invoke-static {p1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    return v2

    :cond_b
    iget-boolean v1, p0, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->q:Z

    if-eqz v1, :cond_c

    invoke-virtual {p1, v0}, Landroid/view/MotionEvent;->getY(I)F

    move-result p1

    iget v0, p0, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->o:F

    sub-float/2addr p1, v0

    mul-float p1, p1, v3

    iput-boolean v2, p0, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->q:Z

    invoke-virtual {p0, p1}, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->a(F)V

    :cond_c
    const/4 p1, -0x1

    iput p1, p0, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->r:I

    return v2

    :cond_d
    invoke-virtual {p1, v2}, Landroid/view/MotionEvent;->getPointerId(I)I

    move-result p1

    iput p1, p0, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->r:I

    iput-boolean v2, p0, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->q:Z

    :cond_e
    :goto_0
    return v1

    :cond_f
    :goto_1
    return v2
.end method

.method public requestDisallowInterceptTouchEvent(Z)V
    .registers 4

    iget-boolean v0, p0, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->legacyIntercept227:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->a:Landroid/view/View;

    if-eqz v0, :cond_0

    invoke-static {v0}, Ld/h/l/p;->s(Landroid/view/View;)Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    invoke-super {p0, p1}, Landroid/view/ViewGroup;->requestDisallowInterceptTouchEvent(Z)V

    :cond_1
    return-void
.end method

.method public setLegacyRequestDisallowInterceptTouchEventEnabled(Z)V
    .registers 2

    iput-boolean p1, p0, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->legacyIntercept227:Z

    return-void
.end method

.method public setOnChildScrollUpCallback(Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout$OnChildScrollUpCallback;)V
    .registers 2

    iput-object p1, p0, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->callback223:Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout$OnChildScrollUpCallback;

    return-void
.end method

.method public setOnRefreshListener(Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout$OnRefreshListener;)V
    .registers 3

    if-eqz p1, :cond_0

    new-instance v0, Landroidx/swiperefreshlayout/widget/RefreshListenerBridge223;

    invoke-direct {v0, p1}, Landroidx/swiperefreshlayout/widget/RefreshListenerBridge223;-><init>(Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout$OnRefreshListener;)V

    iput-object v0, p0, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->b:Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout$h;

    return-void

    :cond_0
    const/4 v0, 0x0

    iput-object v0, p0, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->b:Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout$h;

    return-void
.end method

.method public setOnRefreshListener(Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout$h;)V
    .registers 2

    iput-object p1, p0, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->b:Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout$h;

    return-void
.end method

.method public setProgressViewEndTarget(ZI)V
    .registers 4

    iput p2, p0, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->A:I

    iput-boolean p1, p0, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->s:Z

    iget-object v0, p0, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->v:Ld/u/a/a;

    invoke-virtual {v0}, Landroid/view/View;->invalidate()V

    return-void
.end method

.method public setProgressViewOffset(ZII)V
    .registers 5

    iput-boolean p1, p0, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->s:Z

    iput p2, p0, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->z:I

    iput p3, p0, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->A:I

    const/4 v0, 0x1

    iput-boolean v0, p0, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->K:Z

    invoke-virtual {p0}, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->c()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->c:Z

    return-void
.end method

.method public setRefreshing(Z)V
    .registers 3
    .param p1, "refreshing"    # Z

    .line 496
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->setRefreshingWithoutSwipeGesture(ZZ)V

    .line 497
    return-void
.end method

.method public setTargetOffsetTopAndBottom(I)V
    .registers 3
    .param p1, "offset"    # I

    .line 1411
    iget-object v0, p0, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->v:Ld/u/a/a;

    invoke-virtual {v0}, Ld/u/a/a;->bringToFront()V

    .line 1412
    iget-object v0, p0, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->v:Ld/u/a/a;

    invoke-static {v0, p1}, Landroidx/core/view/ViewCompat;->offsetTopAndBottom(Landroid/view/View;I)V

    .line 1413
    iget-object v0, p0, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->v:Ld/u/a/a;

    invoke-virtual {v0}, Ld/u/a/a;->getTop()I

    move-result v0

    iput v0, p0, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->n:I

    .line 1414
    return-void
.end method

.method public startNestedScroll(II)Z
    .registers 4

    if-nez p2, :cond_0

    invoke-virtual {p0, p1}, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->startNestedScroll(I)Z

    move-result v0

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public stopNestedScroll(I)V
    .registers 2

    if-nez p1, :cond_0

    invoke-virtual {p0}, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->stopNestedScroll()V

    :cond_0
    return-void
.end method

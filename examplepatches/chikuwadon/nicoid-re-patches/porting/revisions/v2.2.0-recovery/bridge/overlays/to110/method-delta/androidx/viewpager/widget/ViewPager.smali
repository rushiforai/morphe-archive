.class public Landroidx/viewpager/widget/ViewPager;
.super Landroid/view/ViewGroup;
.source ""


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/viewpager/widget/ViewPager$k;,
        Landroidx/viewpager/widget/ViewPager$LayoutParams;,
        Landroidx/viewpager/widget/ViewPager$j;,
        Landroidx/viewpager/widget/ViewPager$g;,
        Landroidx/viewpager/widget/ViewPager$SavedState;,
        Landroidx/viewpager/widget/ViewPager$e;,
        Landroidx/viewpager/widget/ViewPager$h;,
        Landroidx/viewpager/widget/ViewPager$i;,
        Landroidx/viewpager/widget/ViewPager$f;
    }
.end annotation


# static fields
.field public static final e0:[I

.field public static final f0:Ljava/util/Comparator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Comparator<",
            "Landroidx/viewpager/widget/ViewPager$f;",
            ">;"
        }
    .end annotation
.end field

.field public static final g0:Landroid/view/animation/Interpolator;

.field public static final h0:Landroidx/viewpager/widget/ViewPager$k;


# instance fields
.field public A:I

.field public B:I

.field public C:I

.field public D:F

.field public E:F

.field public F:F

.field public G:F

.field public H:I

.field public I:Landroid/view/VelocityTracker;

.field public J:I

.field public K:I

.field public L:I

.field public M:I

.field public N:Z

.field public O:Landroid/widget/EdgeEffect;

.field public P:Landroid/widget/EdgeEffect;

.field public Q:Z

.field public R:Z

.field public S:I

.field public T:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Landroidx/viewpager/widget/ViewPager$i;",
            ">;"
        }
    .end annotation
.end field

.field public U:Landroidx/viewpager/widget/ViewPager$i;

.field public V:Landroidx/viewpager/widget/ViewPager$i;

.field public W:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Landroidx/viewpager/widget/ViewPager$h;",
            ">;"
        }
    .end annotation
.end field

.field public a:I

.field public a0:I

.field public final b:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Landroidx/viewpager/widget/ViewPager$f;",
            ">;"
        }
    .end annotation
.end field

.field public b0:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end field

.field public final c:Landroidx/viewpager/widget/ViewPager$f;

.field public final c0:Ljava/lang/Runnable;

.field public final d:Landroid/graphics/Rect;

.field public d0:I

.field public e:Ld/x/a/a;

.field public f:I

.field public g:I

.field public i:Landroid/os/Parcelable;

.field public j:Ljava/lang/ClassLoader;

.field public k:Landroid/widget/Scroller;

.field public l:Z

.field public m:Landroidx/viewpager/widget/ViewPager$j;

.field private mDragInGutterEnabled:Z

.field public n:I

.field public o:Landroid/graphics/drawable/Drawable;

.field public p:I

.field public q:I

.field public r:F

.field public s:F

.field public t:I

.field public u:Z

.field public v:Z

.field public w:Z

.field public x:I

.field public y:Z

.field public z:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 3

    invoke-direct {p0, p1}, Landroid/view/ViewGroup;-><init>(Landroid/content/Context;)V

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Landroidx/viewpager/widget/ViewPager;->b:Ljava/util/ArrayList;

    new-instance p1, Landroidx/viewpager/widget/ViewPager$f;

    invoke-direct {p1}, Landroidx/viewpager/widget/ViewPager$f;-><init>()V

    iput-object p1, p0, Landroidx/viewpager/widget/ViewPager;->c:Landroidx/viewpager/widget/ViewPager$f;

    new-instance p1, Landroid/graphics/Rect;

    invoke-direct {p1}, Landroid/graphics/Rect;-><init>()V

    iput-object p1, p0, Landroidx/viewpager/widget/ViewPager;->d:Landroid/graphics/Rect;

    const/4 p1, -0x1

    iput p1, p0, Landroidx/viewpager/widget/ViewPager;->g:I

    const/4 v0, 0x0

    iput-object v0, p0, Landroidx/viewpager/widget/ViewPager;->i:Landroid/os/Parcelable;

    iput-object v0, p0, Landroidx/viewpager/widget/ViewPager;->j:Ljava/lang/ClassLoader;

    const v0, -0x800001

    iput v0, p0, Landroidx/viewpager/widget/ViewPager;->r:F

    const v0, 0x7f7fffff    # Float.MAX_VALUE

    iput v0, p0, Landroidx/viewpager/widget/ViewPager;->s:F

    const/4 v0, 0x1

    iput v0, p0, Landroidx/viewpager/widget/ViewPager;->x:I

    iput-boolean v0, p0, Landroidx/viewpager/widget/ViewPager;->mDragInGutterEnabled:Z

    iput p1, p0, Landroidx/viewpager/widget/ViewPager;->H:I

    iput-boolean v0, p0, Landroidx/viewpager/widget/ViewPager;->Q:Z

    new-instance p1, Landroidx/viewpager/widget/ViewPager$c;

    invoke-direct {p1, p0}, Landroidx/viewpager/widget/ViewPager$c;-><init>(Landroidx/viewpager/widget/ViewPager;)V

    iput-object p1, p0, Landroidx/viewpager/widget/ViewPager;->c0:Ljava/lang/Runnable;

    const/4 p1, 0x0

    iput p1, p0, Landroidx/viewpager/widget/ViewPager;->d0:I

    invoke-virtual {p0}, Landroidx/viewpager/widget/ViewPager;->c()V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 3

    invoke-direct {p0, p1, p2}, Landroid/view/ViewGroup;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Landroidx/viewpager/widget/ViewPager;->b:Ljava/util/ArrayList;

    new-instance p1, Landroidx/viewpager/widget/ViewPager$f;

    invoke-direct {p1}, Landroidx/viewpager/widget/ViewPager$f;-><init>()V

    iput-object p1, p0, Landroidx/viewpager/widget/ViewPager;->c:Landroidx/viewpager/widget/ViewPager$f;

    new-instance p1, Landroid/graphics/Rect;

    invoke-direct {p1}, Landroid/graphics/Rect;-><init>()V

    iput-object p1, p0, Landroidx/viewpager/widget/ViewPager;->d:Landroid/graphics/Rect;

    const/4 p1, -0x1

    iput p1, p0, Landroidx/viewpager/widget/ViewPager;->g:I

    const/4 p2, 0x0

    iput-object p2, p0, Landroidx/viewpager/widget/ViewPager;->i:Landroid/os/Parcelable;

    iput-object p2, p0, Landroidx/viewpager/widget/ViewPager;->j:Ljava/lang/ClassLoader;

    const p2, -0x800001

    iput p2, p0, Landroidx/viewpager/widget/ViewPager;->r:F

    const p2, 0x7f7fffff    # Float.MAX_VALUE

    iput p2, p0, Landroidx/viewpager/widget/ViewPager;->s:F

    const/4 p2, 0x1

    iput p2, p0, Landroidx/viewpager/widget/ViewPager;->x:I

    iput-boolean p2, p0, Landroidx/viewpager/widget/ViewPager;->mDragInGutterEnabled:Z

    iput p1, p0, Landroidx/viewpager/widget/ViewPager;->H:I

    iput-boolean p2, p0, Landroidx/viewpager/widget/ViewPager;->Q:Z

    new-instance p1, Landroidx/viewpager/widget/ViewPager$c;

    invoke-direct {p1, p0}, Landroidx/viewpager/widget/ViewPager$c;-><init>(Landroidx/viewpager/widget/ViewPager;)V

    iput-object p1, p0, Landroidx/viewpager/widget/ViewPager;->c0:Ljava/lang/Runnable;

    const/4 p1, 0x0

    iput p1, p0, Landroidx/viewpager/widget/ViewPager;->d0:I

    invoke-virtual {p0}, Landroidx/viewpager/widget/ViewPager;->c()V

    return-void
.end method

.method private absorbEdge33(IIIZ)V
    .registers 8

    if-ne p1, p2, :cond_1

    if-eqz p4, :cond_1

    iget-object v0, p0, Landroidx/viewpager/widget/ViewPager;->P:Landroid/widget/EdgeEffect;

    invoke-direct {p0, v0}, Landroidx/viewpager/widget/ViewPager;->edgeDistance230(Landroid/widget/EdgeEffect;)F

    move-result v1

    const/4 v2, 0x0

    cmpl-float v1, v1, v2

    if-eqz v1, :cond_0

    neg-int p3, p3

    invoke-virtual {v0, p3}, Landroid/widget/EdgeEffect;->onAbsorb(I)V

    return-void

    :cond_0
    iget-object v0, p0, Landroidx/viewpager/widget/ViewPager;->O:Landroid/widget/EdgeEffect;

    invoke-direct {p0, v0}, Landroidx/viewpager/widget/ViewPager;->edgeDistance230(Landroid/widget/EdgeEffect;)F

    move-result v1

    cmpl-float v1, v1, v2

    if-eqz v1, :cond_1

    invoke-virtual {v0, p3}, Landroid/widget/EdgeEffect;->onAbsorb(I)V

    :cond_1
    return-void
.end method

.method private catchEdge231(Landroid/widget/EdgeEffect;Z)Z
    .registers 6

    invoke-direct {p0, p1}, Landroidx/viewpager/widget/ViewPager;->edgeDistance230(Landroid/widget/EdgeEffect;)F

    move-result v0

    const/4 v1, 0x0

    cmpl-float v2, v0, v1

    if-eqz v2, :cond_0

    invoke-static {v0}, Ljava/lang/Float;->isNaN(F)Z

    move-result v2

    if-nez v2, :cond_0

    invoke-direct {p0, p2}, Landroidx/viewpager/widget/ViewPager;->edgeDisplacement229(Z)F

    move-result v0

    :try_start_0
    invoke-virtual {p1, v1, v0}, Landroid/widget/EdgeEffect;->onPullDistance(FF)F
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    const/4 v0, 0x1

    return v0

    :catch_0
    move-exception v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method private catchStretch231()Z
    .registers 5

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1f

    if-lt v0, v1, :cond_1

    iget-object v0, p0, Landroidx/viewpager/widget/ViewPager;->O:Landroid/widget/EdgeEffect;

    const/4 v1, 0x1

    invoke-direct {p0, v0, v1}, Landroidx/viewpager/widget/ViewPager;->catchEdge231(Landroid/widget/EdgeEffect;Z)Z

    move-result v2

    iget-object v0, p0, Landroidx/viewpager/widget/ViewPager;->P:Landroid/widget/EdgeEffect;

    const/4 v1, 0x0

    invoke-direct {p0, v0, v1}, Landroidx/viewpager/widget/ViewPager;->catchEdge231(Landroid/widget/EdgeEffect;Z)Z

    move-result v3

    if-nez v2, :cond_0

    if-eqz v3, :cond_1

    :cond_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Landroidx/viewpager/widget/ViewPager;->y:Z

    invoke-virtual {p0, v0}, Landroidx/viewpager/widget/ViewPager;->setScrollState(I)V

    invoke-virtual {p0}, Landroid/view/View;->postInvalidateOnAnimation()V

    return v0

    :cond_1
    const/4 v0, 0x0

    return v0
.end method

.method private consumeStretch229(FI)F
    .registers 10

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1f

    if-lt v0, v1, :cond_2

    if-lez p2, :cond_2

    const/4 v0, 0x0

    cmpl-float v1, p1, v0

    if-eqz v1, :cond_2

    if-lez v1, :cond_0

    iget-object v2, p0, Landroidx/viewpager/widget/ViewPager;->O:Landroid/widget/EdgeEffect;

    const/4 v3, 0x1

    goto :goto_0

    :cond_0
    iget-object v2, p0, Landroidx/viewpager/widget/ViewPager;->P:Landroid/widget/EdgeEffect;

    const/4 v3, 0x0

    :goto_0
    :try_start_0
    invoke-virtual {v2}, Landroid/widget/EdgeEffect;->getDistance()F

    move-result v4

    cmpl-float v5, v4, v0

    if-lez v5, :cond_2

    int-to-float v4, p2

    invoke-static {p1}, Ljava/lang/Math;->abs(F)F

    move-result v5

    div-float/2addr v5, v4

    neg-float v5, v5

    invoke-direct {p0, v3}, Landroidx/viewpager/widget/ViewPager;->edgeDisplacement229(Z)F

    move-result v6

    invoke-virtual {v2, v5, v6}, Landroid/widget/EdgeEffect;->onPullDistance(FF)F

    move-result v6

    invoke-static {v6}, Ljava/lang/Float;->isNaN(F)Z

    move-result v2

    if-nez v2, :cond_2

    invoke-static {v0, v6}, Ljava/lang/Math;->min(FF)F

    move-result v6

    invoke-static {v5, v6}, Ljava/lang/Math;->max(FF)F

    move-result v6

    mul-float/2addr v6, v4

    neg-float v6, v6

    if-eqz v3, :cond_1

    sub-float/2addr p1, v6

    goto :goto_1

    :cond_1
    add-float/2addr p1, v6

    :goto_1
    invoke-virtual {p0}, Landroid/view/View;->postInvalidateOnAnimation()V
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    :cond_2
    return p1

    :catch_0
    move-exception v0

    return p1
.end method

.method private edgeDisplacement229(Z)F
    .registers 6

    const/high16 v0, 0x3f000000    # 0.5f

    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    move-result v1

    if-lez v1, :cond_0

    int-to-float v1, v1

    iget v2, p0, Landroidx/viewpager/widget/ViewPager;->E:F

    div-float/2addr v2, v1

    invoke-static {v2}, Ljava/lang/Float;->isNaN(F)Z

    move-result v1

    if-nez v1, :cond_0

    const/4 v1, 0x0

    invoke-static {v1, v2}, Ljava/lang/Math;->max(FF)F

    move-result v2

    const/high16 v1, 0x3f800000    # 1.0f

    invoke-static {v1, v2}, Ljava/lang/Math;->min(FF)F

    move-result v0

    if-eqz p1, :cond_0

    sub-float v0, v1, v0

    :cond_0
    return v0
.end method

.method private edgeDistance230(Landroid/widget/EdgeEffect;)F
    .registers 4

    :try_start_0
    invoke-static {p1}, Landroidx/core/widget/EdgeEffectCompat;->getDistance(Landroid/widget/EdgeEffect;)F

    move-result v0

    return v0
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    move-exception v1

    const/4 v0, 0x0

    return v0
.end method

.method private hasActiveStretch230()Z
    .registers 5

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1f

    if-lt v0, v1, :cond_0

    iget-object v0, p0, Landroidx/viewpager/widget/ViewPager;->O:Landroid/widget/EdgeEffect;

    invoke-direct {p0, v0}, Landroidx/viewpager/widget/ViewPager;->edgeDistance230(Landroid/widget/EdgeEffect;)F

    move-result v0

    const/4 v1, 0x0

    cmpl-float v2, v0, v1

    if-nez v2, :cond_1

    iget-object v0, p0, Landroidx/viewpager/widget/ViewPager;->P:Landroid/widget/EdgeEffect;

    invoke-direct {p0, v0}, Landroidx/viewpager/widget/ViewPager;->edgeDistance230(Landroid/widget/EdgeEffect;)F

    move-result v0

    cmpl-float v2, v0, v1

    if-nez v2, :cond_1

    :cond_0
    const/4 v0, 0x0

    return v0

    :cond_1
    const/4 v0, 0x1

    return v0
.end method

.method private isGutterDrag(FF)Z
    .registers 7
    .param p1, "x"    # F
    .param p2, "dx"    # F

    .line 2023
    iget-boolean v0, p0, Landroidx/viewpager/widget/ViewPager;->mDragInGutterEnabled:Z

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 2024
    return v1

    .line 2026
    :cond_0
    iget v0, p0, Landroidx/viewpager/widget/ViewPager;->B:I

    int-to-float v0, v0

    cmpg-float v0, p1, v0

    const/4 v2, 0x0

    if-gez v0, :cond_1

    cmpl-float v0, p2, v2

    if-gtz v0, :cond_2

    :cond_1
    invoke-virtual {p0}, Landroidx/viewpager/widget/ViewPager;->getWidth()I

    move-result v0

    iget v3, p0, Landroidx/viewpager/widget/ViewPager;->B:I

    sub-int/2addr v0, v3

    int-to-float v0, v0

    cmpl-float v0, p1, v0

    if-lez v0, :cond_3

    cmpg-float v0, p2, v2

    if-gez v0, :cond_3

    :cond_2
    const/4 v1, 0x1

    :cond_3
    return v1
.end method

.method private pullEdge229(Landroid/widget/EdgeEffect;FZ)V
    .registers 7

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1f

    if-lt v0, v1, :cond_0

    invoke-direct {p0, p3}, Landroidx/viewpager/widget/ViewPager;->edgeDisplacement229(Z)F

    move-result v0

    :try_start_0
    invoke-virtual {p1, p2, v0}, Landroid/widget/EdgeEffect;->onPullDistance(FF)F
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception v1

    :cond_0
    invoke-virtual {p1, p2}, Landroid/widget/EdgeEffect;->onPull(F)V

    return-void
.end method


# virtual methods
.method public a(II)Landroidx/viewpager/widget/ViewPager$f;
    .registers 12

    new-instance v0, Landroidx/viewpager/widget/ViewPager$f;

    invoke-direct {v0}, Landroidx/viewpager/widget/ViewPager$f;-><init>()V

    iput p1, v0, Landroidx/viewpager/widget/ViewPager$f;->b:I

    iget-object v1, p0, Landroidx/viewpager/widget/ViewPager;->e:Ld/x/a/a;

    check-cast v1, Ld/k/a/n;

    .line 1
    iget-object v2, v1, Ld/k/a/n;->e:Ld/k/a/o;

    if-nez v2, :cond_0

    iget-object v2, v1, Ld/k/a/n;->c:Ld/k/a/h;

    invoke-virtual {v2}, Ld/k/a/h;->a()Ld/k/a/o;

    move-result-object v2

    iput-object v2, v1, Ld/k/a/n;->e:Ld/k/a/o;

    :cond_0
    int-to-long v2, p1

    invoke-virtual {p0}, Landroid/view/ViewGroup;->getId()I

    move-result v4

    invoke-static {v4, v2, v3}, Ld/k/a/n;->a(IJ)Ljava/lang/String;

    move-result-object v4

    iget-object v5, v1, Ld/k/a/n;->c:Ld/k/a/h;

    invoke-virtual {v5, v4}, Ld/k/a/h;->a(Ljava/lang/String;)Landroidx/fragment/app/Fragment;

    move-result-object v4

    if-eqz v4, :cond_2

    iget-object p1, v1, Ld/k/a/n;->e:Ld/k/a/o;

    instance-of v5, v1, Le/e/a/k3;

    if-eqz v5, :cond_1

    instance-of v5, v4, Lcom/sauzask/nicoid/NicoidVideoPlayerMenuFragment;

    if-eqz v5, :cond_1

    check-cast v1, Le/e/a/k3;

    check-cast v4, Lcom/sauzask/nicoid/NicoidVideoPlayerMenuFragment;

    iget-object v5, v1, Le/e/a/k3;->k:Le/e/a/l3/g;

    iput-object v5, v4, Lcom/sauzask/nicoid/NicoidVideoPlayerMenuFragment;->a0:Le/e/a/l3/g;

    :cond_1
    invoke-virtual {p1, v4}, Ld/k/a/o;->a(Landroidx/fragment/app/Fragment;)Ld/k/a/o;

    goto/16 :goto_2

    :cond_2
    move-object v4, v1

    check-cast v4, Le/e/a/k3;

    .line 2
    iget-object v5, v4, Le/e/a/k3;->j:Ljava/util/ArrayList;

    invoke-virtual {v5, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Le/e/a/k3$a;

    iget-object v6, v4, Le/e/a/k3;->g:Landroid/content/Context;

    if-nez v6, :cond_3

    new-instance p1, Landroidx/fragment/app/Fragment;

    invoke-direct {p1}, Landroidx/fragment/app/Fragment;-><init>()V

    move-object v4, p1

    goto/16 :goto_1

    :cond_3
    iget-object v7, v5, Le/e/a/k3$a;->a:Ljava/lang/Class;

    invoke-virtual {v7}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v7

    iget-object v5, v5, Le/e/a/k3$a;->b:Landroid/os/Bundle;

    invoke-static {v6, v7, v5}, Landroidx/fragment/app/Fragment;->a(Landroid/content/Context;Ljava/lang/String;Landroid/os/Bundle;)Landroidx/fragment/app/Fragment;

    move-result-object v5

    :try_start_0
    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v6

    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v7

    const-string v8, "com.sauzask.nicoid.NicoidVideoPlayerMenuFragment"

    invoke-virtual {v7, v8}, Ljava/lang/ClassLoader;->loadClass(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v8

    if-ne v6, v8, :cond_4

    move-object p1, v5

    check-cast p1, Lcom/sauzask/nicoid/NicoidVideoPlayerMenuFragment;

    iget-object v4, v4, Le/e/a/k3;->k:Le/e/a/l3/g;

    .line 3
    iput-object v4, p1, Lcom/sauzask/nicoid/NicoidVideoPlayerMenuFragment;->a0:Le/e/a/l3/g;

    goto/16 :goto_0

    :cond_4
    const-string v8, "com.sauzask.nicoid.NicoidVideoInfoFragment"

    .line 4
    invoke-virtual {v7, v8}, Ljava/lang/ClassLoader;->loadClass(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v8

    if-ne v6, v8, :cond_5

    iput p1, v4, Le/e/a/k3;->o:I

    move-object p1, v5

    check-cast p1, Lcom/sauzask/nicoid/NicoidVideoInfoFragment;

    iput-object p1, v4, Le/e/a/k3;->l:Lcom/sauzask/nicoid/NicoidVideoInfoFragment;

    iget-object p1, v4, Le/e/a/k3;->l:Lcom/sauzask/nicoid/NicoidVideoInfoFragment;

    iget-object v6, v4, Le/e/a/k3;->n:Landroid/view/View;

    iput-object v6, p1, Lcom/sauzask/nicoid/NicoidVideoInfoFragment;->Z:Landroid/view/View;

    iget-object v4, v4, Le/e/a/k3;->k:Le/e/a/l3/g;

    .line 5
    iput-object v4, p1, Lcom/sauzask/nicoid/NicoidVideoInfoFragment;->g0:Le/e/a/l3/g;

    goto :goto_0

    :cond_5
    const-string p1, "com.sauzask.nicoid.NicoidVideoListFragment"

    .line 6
    invoke-virtual {v7, p1}, Ljava/lang/ClassLoader;->loadClass(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object p1

    if-ne v6, p1, :cond_6

    move-object p1, v5

    check-cast p1, Lcom/sauzask/nicoid/NicoidVideoListFragment;

    iget-object v4, v4, Le/e/a/k3;->k:Le/e/a/l3/g;

    .line 7
    iput-object v4, p1, Lcom/sauzask/nicoid/NicoidVideoListFragment;->v0:Le/e/a/l3/g;

    goto :goto_0

    :cond_6
    const-string p1, "com.sauzask.nicoid.NicoidUserVideoListFragment"

    .line 8
    invoke-virtual {v7, p1}, Ljava/lang/ClassLoader;->loadClass(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object p1

    if-ne v6, p1, :cond_7

    move-object p1, v5

    check-cast p1, Lcom/sauzask/nicoid/NicoidUserVideoListFragment;

    iget-object v4, v4, Le/e/a/k3;->k:Le/e/a/l3/g;

    .line 9
    iput-object v4, p1, Lcom/sauzask/nicoid/NicoidUserVideoListFragment;->c0:Le/e/a/l3/g;

    goto :goto_0

    :cond_7
    const-string p1, "com.sauzask.nicoid.NicoidCommentListFragment"

    .line 10
    invoke-virtual {v7, p1}, Ljava/lang/ClassLoader;->loadClass(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object p1

    if-ne v6, p1, :cond_8

    move-object p1, v5

    check-cast p1, Lcom/sauzask/nicoid/NicoidCommentListFragment;

    iput-object p1, v4, Le/e/a/k3;->m:Lcom/sauzask/nicoid/NicoidCommentListFragment;

    iget-object p1, v4, Le/e/a/k3;->m:Lcom/sauzask/nicoid/NicoidCommentListFragment;

    iget-object v6, v4, Le/e/a/k3;->k:Le/e/a/l3/g;

    .line 11
    iput-object v6, p1, Lcom/sauzask/nicoid/NicoidCommentListFragment;->b0:Le/e/a/l3/g;

    .line 12
    iget-object v4, v4, Le/e/a/k3;->p:Le/e/a/v;

    .line 13
    iput-object v4, p1, Lcom/sauzask/nicoid/NicoidCommentListFragment;->c0:Le/e/a/v;

    iget-object v4, v4, Le/e/a/v;->e:Le/e/a/g0;

    iput-object v4, p1, Lcom/sauzask/nicoid/NicoidCommentListFragment;->d0:Le/e/a/g0;

    goto :goto_0

    :cond_8
    const-string p1, "com.sauzask.nicoid.NicoidNGListFragment"

    .line 14
    invoke-virtual {v7, p1}, Ljava/lang/ClassLoader;->loadClass(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object p1

    if-ne v6, p1, :cond_9

    move-object p1, v5

    check-cast p1, Lcom/sauzask/nicoid/NicoidNGListFragment;

    move-object p1, v5

    check-cast p1, Lcom/sauzask/nicoid/NicoidNGListFragment;

    iget-object v4, v4, Le/e/a/k3;->p:Le/e/a/v;

    .line 15
    iput-object v4, p1, Lcom/sauzask/nicoid/NicoidNGListFragment;->b0:Le/e/a/v;

    iget-object v4, v4, Le/e/a/v;->e:Le/e/a/g0;

    iput-object v4, p1, Lcom/sauzask/nicoid/NicoidNGListFragment;->c0:Le/e/a/g0;
    :try_end_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    .line 16
    invoke-virtual {p1}, Ljava/lang/ClassNotFoundException;->printStackTrace()V

    :cond_9
    :goto_0
    move-object v4, v5

    .line 17
    :goto_1
    iget-object p1, v1, Ld/k/a/n;->e:Ld/k/a/o;

    invoke-virtual {p0}, Landroid/view/ViewGroup;->getId()I

    move-result v5

    invoke-virtual {p0}, Landroid/view/ViewGroup;->getId()I

    move-result v6

    invoke-static {v6, v2, v3}, Ld/k/a/n;->a(IJ)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1, v5, v4, v2}, Ld/k/a/o;->a(ILandroidx/fragment/app/Fragment;Ljava/lang/String;)Ld/k/a/o;

    :goto_2
    iget-object p1, v1, Ld/k/a/n;->f:Landroidx/fragment/app/Fragment;

    if-eq v4, p1, :cond_b

    const/4 p1, 0x0

    invoke-virtual {v4, p1}, Landroidx/fragment/app/Fragment;->e(Z)V

    iget v2, v1, Ld/k/a/n;->d:I

    const/4 v3, 0x1

    if-ne v2, v3, :cond_a

    iget-object p1, v1, Ld/k/a/n;->e:Ld/k/a/o;

    sget-object v1, Ld/m/e$b;->d:Ld/m/e$b;

    invoke-virtual {p1, v4, v1}, Ld/k/a/o;->a(Landroidx/fragment/app/Fragment;Ld/m/e$b;)Ld/k/a/o;

    goto :goto_3

    :cond_a
    invoke-virtual {v4, p1}, Landroidx/fragment/app/Fragment;->f(Z)V

    .line 18
    :cond_b
    :goto_3
    iput-object v4, v0, Landroidx/viewpager/widget/ViewPager$f;->a:Ljava/lang/Object;

    iget-object p1, p0, Landroidx/viewpager/widget/ViewPager;->e:Ld/x/a/a;

    invoke-virtual {p1}, Ld/x/a/a;->c()F

    const/high16 p1, 0x3f800000    # 1.0f

    iput p1, v0, Landroidx/viewpager/widget/ViewPager$f;->d:F

    if-ltz p2, :cond_d

    iget-object p1, p0, Landroidx/viewpager/widget/ViewPager;->b:Ljava/util/ArrayList;

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result p1

    if-lt p2, p1, :cond_c

    goto :goto_4

    :cond_c
    iget-object p1, p0, Landroidx/viewpager/widget/ViewPager;->b:Ljava/util/ArrayList;

    invoke-virtual {p1, p2, v0}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    goto :goto_5

    :cond_d
    :goto_4
    iget-object p1, p0, Landroidx/viewpager/widget/ViewPager;->b:Ljava/util/ArrayList;

    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :goto_5
    return-object v0
.end method

.method public a(III)V
    .registers 13

    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    invoke-direct {p0, v1}, Landroidx/viewpager/widget/ViewPager;->setScrollingCacheEnabled(Z)V

    return-void

    :cond_0
    iget-object v0, p0, Landroidx/viewpager/widget/ViewPager;->k:Landroid/widget/Scroller;

    const/4 v2, 0x1

    if-eqz v0, :cond_1

    invoke-virtual {v0}, Landroid/widget/Scroller;->isFinished()Z

    move-result v0

    if-nez v0, :cond_1

    const/4 v0, 0x1

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    :goto_0
    if-eqz v0, :cond_3

    iget-boolean v0, p0, Landroidx/viewpager/widget/ViewPager;->l:Z

    if-eqz v0, :cond_2

    iget-object v0, p0, Landroidx/viewpager/widget/ViewPager;->k:Landroid/widget/Scroller;

    invoke-virtual {v0}, Landroid/widget/Scroller;->getCurrX()I

    move-result v0

    goto :goto_1

    :cond_2
    iget-object v0, p0, Landroidx/viewpager/widget/ViewPager;->k:Landroid/widget/Scroller;

    invoke-virtual {v0}, Landroid/widget/Scroller;->getStartX()I

    move-result v0

    :goto_1
    iget-object v3, p0, Landroidx/viewpager/widget/ViewPager;->k:Landroid/widget/Scroller;

    invoke-virtual {v3}, Landroid/widget/Scroller;->abortAnimation()V

    invoke-direct {p0, v1}, Landroidx/viewpager/widget/ViewPager;->setScrollingCacheEnabled(Z)V

    goto :goto_2

    :cond_3
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getScrollX()I

    move-result v0

    :goto_2
    move v4, v0

    invoke-virtual {p0}, Landroid/view/ViewGroup;->getScrollY()I

    move-result v5

    sub-int v6, p1, v4

    sub-int v7, p2, v5

    if-nez v6, :cond_4

    if-nez v7, :cond_4

    invoke-virtual {p0, v1}, Landroidx/viewpager/widget/ViewPager;->a(Z)V

    invoke-virtual {p0}, Landroidx/viewpager/widget/ViewPager;->f()V

    invoke-virtual {p0, v1}, Landroidx/viewpager/widget/ViewPager;->setScrollState(I)V

    return-void

    :cond_4
    invoke-direct {p0, v2}, Landroidx/viewpager/widget/ViewPager;->setScrollingCacheEnabled(Z)V

    const/4 p1, 0x2

    invoke-virtual {p0, p1}, Landroidx/viewpager/widget/ViewPager;->setScrollState(I)V

    invoke-direct {p0}, Landroidx/viewpager/widget/ViewPager;->getClientWidth()I

    move-result p1

    div-int/lit8 p2, p1, 0x2

    invoke-static {v6}, Ljava/lang/Math;->abs(I)I

    move-result v0

    int-to-float v0, v0

    const/high16 v2, 0x3f800000    # 1.0f

    mul-float v0, v0, v2

    int-to-float p1, p1

    div-float/2addr v0, p1

    invoke-static {v2, v0}, Ljava/lang/Math;->min(FF)F

    move-result v0

    int-to-float p2, p2

    invoke-virtual {p0, v0}, Landroidx/viewpager/widget/ViewPager;->a(F)F

    move-result v0

    mul-float v0, v0, p2

    add-float/2addr v0, p2

    invoke-static {p3}, Ljava/lang/Math;->abs(I)I

    move-result p2

    if-lez p2, :cond_5

    const/high16 p1, 0x447a0000    # 1000.0f

    int-to-float p2, p2

    div-float/2addr v0, p2

    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    move-result p2

    mul-float p2, p2, p1

    invoke-static {p2}, Ljava/lang/Math;->round(F)I

    move-result p1

    mul-int/lit8 p1, p1, 0x4

    goto :goto_3

    :cond_5
    iget-object p2, p0, Landroidx/viewpager/widget/ViewPager;->e:Ld/x/a/a;

    invoke-virtual {p2}, Ld/x/a/a;->c()F

    mul-float p1, p1, v2

    invoke-static {v6}, Ljava/lang/Math;->abs(I)I

    move-result p2

    int-to-float p2, p2

    iget p3, p0, Landroidx/viewpager/widget/ViewPager;->n:I

    int-to-float p3, p3

    add-float/2addr p1, p3

    div-float/2addr p2, p1

    add-float/2addr p2, v2

    const/high16 p1, 0x42c80000    # 100.0f

    mul-float p2, p2, p1

    float-to-int p1, p2

    :goto_3
    const/16 p2, 0x258

    invoke-static {p1, p2}, Ljava/lang/Math;->min(II)I

    move-result v8

    iput-boolean v1, p0, Landroidx/viewpager/widget/ViewPager;->l:Z

    iget-object v3, p0, Landroidx/viewpager/widget/ViewPager;->k:Landroid/widget/Scroller;

    invoke-virtual/range {v3 .. v8}, Landroid/widget/Scroller;->startScroll(IIIII)V

    invoke-virtual {p0}, Landroid/view/View;->postInvalidateOnAnimation()V

    return-void
.end method

.method public final b(F)Z
    .registers 11

    iget v0, p0, Landroidx/viewpager/widget/ViewPager;->D:F

    sub-float/2addr v0, p1

    iput p1, p0, Landroidx/viewpager/widget/ViewPager;->D:F

    invoke-direct {p0}, Landroidx/viewpager/widget/ViewPager;->getClientWidth()I

    move-result v1

    if-lez v1, :cond_6

    iget-object v2, p0, Landroidx/viewpager/widget/ViewPager;->b:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_6

    iget-object v2, p0, Landroidx/viewpager/widget/ViewPager;->e:Ld/x/a/a;

    if-eqz v2, :cond_6

    invoke-direct {p0, v0, v1}, Landroidx/viewpager/widget/ViewPager;->consumeStretch229(FI)F

    move-result v0

    invoke-virtual {p0}, Landroid/view/ViewGroup;->getScrollX()I

    move-result p1

    int-to-float p1, p1

    add-float/2addr p1, v0

    int-to-float v0, v1

    iget v1, p0, Landroidx/viewpager/widget/ViewPager;->r:F

    mul-float v1, v1, v0

    iget v2, p0, Landroidx/viewpager/widget/ViewPager;->s:F

    mul-float v2, v2, v0

    iget-object v3, p0, Landroidx/viewpager/widget/ViewPager;->b:Ljava/util/ArrayList;

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroidx/viewpager/widget/ViewPager$f;

    iget-object v5, p0, Landroidx/viewpager/widget/ViewPager;->b:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v6

    const/4 v7, 0x1

    sub-int/2addr v6, v7

    invoke-virtual {v5, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroidx/viewpager/widget/ViewPager$f;

    iget v6, v3, Landroidx/viewpager/widget/ViewPager$f;->b:I

    if-eqz v6, :cond_0

    iget v1, v3, Landroidx/viewpager/widget/ViewPager$f;->e:F

    mul-float v1, v1, v0

    const/4 v3, 0x0

    goto :goto_0

    :cond_0
    const/4 v3, 0x1

    :goto_0
    iget v6, v5, Landroidx/viewpager/widget/ViewPager$f;->b:I

    iget-object v8, p0, Landroidx/viewpager/widget/ViewPager;->e:Ld/x/a/a;

    invoke-virtual {v8}, Ld/x/a/a;->a()I

    move-result v8

    sub-int/2addr v8, v7

    if-eq v6, v8, :cond_1

    iget v2, v5, Landroidx/viewpager/widget/ViewPager$f;->e:F

    mul-float v2, v2, v0

    const/4 v5, 0x0

    goto :goto_1

    :cond_1
    const/4 v5, 0x1

    :goto_1
    cmpg-float v6, p1, v1

    if-gez v6, :cond_3

    if-eqz v3, :cond_2

    sub-float p1, v1, p1

    iget-object v2, p0, Landroidx/viewpager/widget/ViewPager;->O:Landroid/widget/EdgeEffect;

    invoke-static {p1}, Ljava/lang/Math;->abs(F)F

    move-result p1

    div-float/2addr p1, v0

    const/4 v6, 0x1

    invoke-direct {p0, v2, p1, v6}, Landroidx/viewpager/widget/ViewPager;->pullEdge229(Landroid/widget/EdgeEffect;FZ)V

    const/4 v4, 0x1

    :cond_2
    move p1, v1

    goto :goto_2

    :cond_3
    cmpl-float v1, p1, v2

    if-lez v1, :cond_5

    if-eqz v5, :cond_4

    sub-float/2addr p1, v2

    iget-object v1, p0, Landroidx/viewpager/widget/ViewPager;->P:Landroid/widget/EdgeEffect;

    invoke-static {p1}, Ljava/lang/Math;->abs(F)F

    move-result p1

    div-float/2addr p1, v0

    const/4 v6, 0x0

    invoke-direct {p0, v1, p1, v6}, Landroidx/viewpager/widget/ViewPager;->pullEdge229(Landroid/widget/EdgeEffect;FZ)V

    const/4 v4, 0x1

    :cond_4
    move p1, v2

    :cond_5
    :goto_2
    iget v0, p0, Landroidx/viewpager/widget/ViewPager;->D:F

    float-to-int v1, p1

    int-to-float v2, v1

    sub-float/2addr p1, v2

    add-float/2addr p1, v0

    iput p1, p0, Landroidx/viewpager/widget/ViewPager;->D:F

    invoke-virtual {p0}, Landroid/view/ViewGroup;->getScrollY()I

    move-result p1

    invoke-virtual {p0, v1, p1}, Landroid/view/ViewGroup;->scrollTo(II)V

    invoke-virtual {p0, v1}, Landroidx/viewpager/widget/ViewPager;->d(I)Z

    return v4

    :cond_6
    const/4 v0, 0x0

    return v0
.end method

.method public computeScroll()V
    .registers 5

    const/4 v0, 0x1

    iput-boolean v0, p0, Landroidx/viewpager/widget/ViewPager;->l:Z

    iget-object v1, p0, Landroidx/viewpager/widget/ViewPager;->k:Landroid/widget/Scroller;

    invoke-virtual {v1}, Landroid/widget/Scroller;->isFinished()Z

    move-result v1

    if-nez v1, :cond_2

    iget-object v1, p0, Landroidx/viewpager/widget/ViewPager;->k:Landroid/widget/Scroller;

    invoke-virtual {v1}, Landroid/widget/Scroller;->computeScrollOffset()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-virtual {p0}, Landroid/view/ViewGroup;->getScrollX()I

    move-result v0

    invoke-virtual {p0}, Landroid/view/ViewGroup;->getScrollY()I

    move-result v1

    iget-object v2, p0, Landroidx/viewpager/widget/ViewPager;->k:Landroid/widget/Scroller;

    invoke-virtual {v2}, Landroid/widget/Scroller;->getCurrX()I

    move-result v2

    iget-object v3, p0, Landroidx/viewpager/widget/ViewPager;->k:Landroid/widget/Scroller;

    invoke-virtual {v3}, Landroid/widget/Scroller;->getCurrY()I

    move-result v3

    if-ne v0, v2, :cond_0

    if-eq v1, v3, :cond_1

    :cond_0
    invoke-virtual {p0, v2, v3}, Landroid/view/ViewGroup;->scrollTo(II)V

    invoke-virtual {p0, v2}, Landroidx/viewpager/widget/ViewPager;->d(I)Z

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p0, Landroidx/viewpager/widget/ViewPager;->k:Landroid/widget/Scroller;

    invoke-virtual {v0}, Landroid/widget/Scroller;->abortAnimation()V

    const/4 v0, 0x0

    invoke-virtual {p0, v0, v3}, Landroid/view/ViewGroup;->scrollTo(II)V

    :cond_1
    invoke-virtual {p0}, Landroid/view/View;->postInvalidateOnAnimation()V

    return-void

    :cond_2
    invoke-virtual {p0, v0}, Landroidx/viewpager/widget/ViewPager;->a(Z)V

    return-void
.end method

.method public draw(Landroid/graphics/Canvas;)V
    .registers 9

    invoke-super {p0, p1}, Landroid/view/ViewGroup;->draw(Landroid/graphics/Canvas;)V

    invoke-virtual {p0}, Landroid/view/ViewGroup;->getOverScrollMode()I

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_1

    const/4 v2, 0x1

    if-ne v0, v2, :cond_0

    iget-object v0, p0, Landroidx/viewpager/widget/ViewPager;->e:Ld/x/a/a;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ld/x/a/a;->a()I

    move-result v0

    if-le v0, v2, :cond_0

    goto :goto_0

    :cond_0
    iget-object p1, p0, Landroidx/viewpager/widget/ViewPager;->O:Landroid/widget/EdgeEffect;

    invoke-virtual {p1}, Landroid/widget/EdgeEffect;->finish()V

    iget-object p1, p0, Landroidx/viewpager/widget/ViewPager;->P:Landroid/widget/EdgeEffect;

    invoke-virtual {p1}, Landroid/widget/EdgeEffect;->finish()V

    goto/16 :goto_1

    :cond_1
    :goto_0
    iget-object v0, p0, Landroidx/viewpager/widget/ViewPager;->O:Landroid/widget/EdgeEffect;

    invoke-virtual {v0}, Landroid/widget/EdgeEffect;->isFinished()Z

    move-result v0

    if-nez v0, :cond_2

    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    move-result v0

    invoke-virtual {p0}, Landroid/view/ViewGroup;->getHeight()I

    move-result v2

    invoke-virtual {p0}, Landroid/view/ViewGroup;->getPaddingTop()I

    move-result v3

    sub-int/2addr v2, v3

    invoke-virtual {p0}, Landroid/view/ViewGroup;->getPaddingBottom()I

    move-result v3

    sub-int/2addr v2, v3

    invoke-virtual {p0}, Landroid/view/ViewGroup;->getWidth()I

    move-result v3

    const/high16 v4, 0x43870000    # 270.0f

    invoke-virtual {p1, v4}, Landroid/graphics/Canvas;->rotate(F)V

    neg-int v4, v2

    invoke-virtual {p0}, Landroid/view/ViewGroup;->getPaddingTop()I

    move-result v5

    add-int/2addr v5, v4

    int-to-float v4, v5

    iget v5, p0, Landroidx/viewpager/widget/ViewPager;->r:F

    int-to-float v6, v3

    mul-float v5, v5, v6

    invoke-virtual {p1, v4, v5}, Landroid/graphics/Canvas;->translate(FF)V

    iget-object v4, p0, Landroidx/viewpager/widget/ViewPager;->O:Landroid/widget/EdgeEffect;

    invoke-virtual {v4, v2, v3}, Landroid/widget/EdgeEffect;->setSize(II)V

    iget-object v2, p0, Landroidx/viewpager/widget/ViewPager;->O:Landroid/widget/EdgeEffect;

    invoke-virtual {v2, p1}, Landroid/widget/EdgeEffect;->draw(Landroid/graphics/Canvas;)Z

    move-result v2

    or-int/2addr v1, v2

    invoke-virtual {p1, v0}, Landroid/graphics/Canvas;->restoreToCount(I)V

    :cond_2
    iget-object v0, p0, Landroidx/viewpager/widget/ViewPager;->P:Landroid/widget/EdgeEffect;

    invoke-virtual {v0}, Landroid/widget/EdgeEffect;->isFinished()Z

    move-result v0

    if-nez v0, :cond_3

    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    move-result v0

    invoke-virtual {p0}, Landroid/view/ViewGroup;->getWidth()I

    move-result v2

    invoke-virtual {p0}, Landroid/view/ViewGroup;->getHeight()I

    move-result v3

    invoke-virtual {p0}, Landroid/view/ViewGroup;->getPaddingTop()I

    move-result v4

    sub-int/2addr v3, v4

    invoke-virtual {p0}, Landroid/view/ViewGroup;->getPaddingBottom()I

    move-result v4

    sub-int/2addr v3, v4

    const/high16 v4, 0x42b40000    # 90.0f

    invoke-virtual {p1, v4}, Landroid/graphics/Canvas;->rotate(F)V

    invoke-virtual {p0}, Landroid/view/ViewGroup;->getPaddingTop()I

    move-result v4

    neg-int v4, v4

    int-to-float v4, v4

    iget v5, p0, Landroidx/viewpager/widget/ViewPager;->s:F

    const/high16 v6, 0x3f800000    # 1.0f

    add-float/2addr v5, v6

    neg-float v5, v5

    int-to-float v6, v2

    mul-float v5, v5, v6

    invoke-virtual {p1, v4, v5}, Landroid/graphics/Canvas;->translate(FF)V

    iget-object v4, p0, Landroidx/viewpager/widget/ViewPager;->P:Landroid/widget/EdgeEffect;

    invoke-virtual {v4, v3, v2}, Landroid/widget/EdgeEffect;->setSize(II)V

    iget-object v2, p0, Landroidx/viewpager/widget/ViewPager;->P:Landroid/widget/EdgeEffect;

    invoke-virtual {v2, p1}, Landroid/widget/EdgeEffect;->draw(Landroid/graphics/Canvas;)Z

    move-result v2

    or-int/2addr v1, v2

    invoke-virtual {p1, v0}, Landroid/graphics/Canvas;->restoreToCount(I)V

    :cond_3
    :goto_1
    if-eqz v1, :cond_4

    invoke-virtual {p0}, Landroid/view/View;->postInvalidateOnAnimation()V

    :cond_4
    return-void
.end method

.method public final g()Z
    .registers 3

    const/4 v0, -0x1

    iput v0, p0, Landroidx/viewpager/widget/ViewPager;->H:I

    const/4 v0, 0x0

    .line 1
    iput-boolean v0, p0, Landroidx/viewpager/widget/ViewPager;->y:Z

    iput-boolean v0, p0, Landroidx/viewpager/widget/ViewPager;->z:Z

    iget-object v1, p0, Landroidx/viewpager/widget/ViewPager;->I:Landroid/view/VelocityTracker;

    if-eqz v1, :cond_0

    invoke-virtual {v1}, Landroid/view/VelocityTracker;->recycle()V

    const/4 v1, 0x0

    iput-object v1, p0, Landroidx/viewpager/widget/ViewPager;->I:Landroid/view/VelocityTracker;

    .line 2
    :cond_0
    iget-object v1, p0, Landroidx/viewpager/widget/ViewPager;->O:Landroid/widget/EdgeEffect;

    invoke-virtual {v1}, Landroid/widget/EdgeEffect;->onRelease()V

    iget-object v1, p0, Landroidx/viewpager/widget/ViewPager;->P:Landroid/widget/EdgeEffect;

    invoke-virtual {v1}, Landroid/widget/EdgeEffect;->onRelease()V

    iget-object v1, p0, Landroidx/viewpager/widget/ViewPager;->O:Landroid/widget/EdgeEffect;

    invoke-virtual {v1}, Landroid/widget/EdgeEffect;->isFinished()Z

    move-result v1

    if-eqz v1, :cond_1

    iget-object v1, p0, Landroidx/viewpager/widget/ViewPager;->P:Landroid/widget/EdgeEffect;

    invoke-virtual {v1}, Landroid/widget/EdgeEffect;->isFinished()Z

    move-result v1

    if-nez v1, :cond_2

    :cond_1
    invoke-virtual {p0}, Landroid/view/View;->postInvalidateOnAnimation()V

    const/4 v0, 0x1

    :cond_2
    return v0
.end method

.method public isDragInGutterEnabled()Z
    .registers 2

    .line 2010
    iget-boolean v0, p0, Landroidx/viewpager/widget/ViewPager;->mDragInGutterEnabled:Z

    return v0
.end method

.method public onInterceptTouchEvent(Landroid/view/MotionEvent;)Z
    .registers 18

    move-object/from16 v6, p0

    move-object/from16 v7, p1

    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v0

    and-int/lit16 v0, v0, 0xff

    const/4 v8, 0x0

    const/4 v1, 0x3

    if-eq v0, v1, :cond_e

    const/4 v9, 0x1

    if-ne v0, v9, :cond_0

    goto/16 :goto_3

    :cond_0
    if-eqz v0, :cond_2

    iget-boolean v1, v6, Landroidx/viewpager/widget/ViewPager;->y:Z

    if-eqz v1, :cond_1

    return v9

    :cond_1
    iget-boolean v1, v6, Landroidx/viewpager/widget/ViewPager;->z:Z

    if-eqz v1, :cond_2

    return v8

    :cond_2
    const/4 v1, 0x2

    if-eqz v0, :cond_a

    if-eq v0, v1, :cond_4

    const/4 v1, 0x6

    if-eq v0, v1, :cond_3

    goto/16 :goto_2

    :cond_3
    invoke-virtual/range {p0 .. p1}, Landroidx/viewpager/widget/ViewPager;->a(Landroid/view/MotionEvent;)V

    goto/16 :goto_2

    :cond_4
    iget v0, v6, Landroidx/viewpager/widget/ViewPager;->H:I

    const/4 v1, -0x1

    if-ne v0, v1, :cond_5

    goto/16 :goto_2

    :cond_5
    invoke-virtual {v7, v0}, Landroid/view/MotionEvent;->findPointerIndex(I)I

    move-result v0

    if-ltz v0, :cond_e

    invoke-virtual {v7, v0}, Landroid/view/MotionEvent;->getX(I)F

    move-result v10

    iget v1, v6, Landroidx/viewpager/widget/ViewPager;->D:F

    sub-float v11, v10, v1

    invoke-static {v11}, Ljava/lang/Math;->abs(F)F

    move-result v12

    invoke-virtual {v7, v0}, Landroid/view/MotionEvent;->getY(I)F

    move-result v13

    iget v0, v6, Landroidx/viewpager/widget/ViewPager;->G:F

    sub-float v0, v13, v0

    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    move-result v14

    const/4 v15, 0x0

    cmpl-float v0, v11, v15

    if-eqz v0, :cond_6

    iget v0, v6, Landroidx/viewpager/widget/ViewPager;->D:F

    invoke-direct {v6, v0, v11}, Landroidx/viewpager/widget/ViewPager;->isGutterDrag(FF)Z

    move-result v0

    if-nez v0, :cond_6

    const/4 v2, 0x0

    float-to-int v3, v11

    float-to-int v4, v10

    float-to-int v5, v13

    move-object/from16 v0, p0

    move-object/from16 v1, p0

    .line 2
    invoke-virtual/range {v0 .. v5}, Landroidx/viewpager/widget/ViewPager;->a(Landroid/view/View;ZIII)Z

    move-result v0

    if-eqz v0, :cond_6

    iput v10, v6, Landroidx/viewpager/widget/ViewPager;->D:F

    iput v13, v6, Landroidx/viewpager/widget/ViewPager;->E:F

    iput-boolean v9, v6, Landroidx/viewpager/widget/ViewPager;->z:Z

    return v8

    :cond_6
    iget v0, v6, Landroidx/viewpager/widget/ViewPager;->C:I

    int-to-float v0, v0

    cmpl-float v0, v12, v0

    if-lez v0, :cond_8

    const/high16 v0, 0x3f000000    # 0.5f

    mul-float v12, v12, v0

    cmpl-float v0, v12, v14

    if-lez v0, :cond_8

    iput-boolean v9, v6, Landroidx/viewpager/widget/ViewPager;->y:Z

    invoke-virtual {v6, v9}, Landroidx/viewpager/widget/ViewPager;->b(Z)V

    invoke-virtual {v6, v9}, Landroidx/viewpager/widget/ViewPager;->setScrollState(I)V

    cmpl-float v0, v11, v15

    if-lez v0, :cond_7

    iget v0, v6, Landroidx/viewpager/widget/ViewPager;->F:F

    iget v1, v6, Landroidx/viewpager/widget/ViewPager;->C:I

    int-to-float v1, v1

    add-float/2addr v0, v1

    goto :goto_0

    :cond_7
    iget v0, v6, Landroidx/viewpager/widget/ViewPager;->F:F

    iget v1, v6, Landroidx/viewpager/widget/ViewPager;->C:I

    int-to-float v1, v1

    sub-float/2addr v0, v1

    :goto_0
    iput v0, v6, Landroidx/viewpager/widget/ViewPager;->D:F

    iput v13, v6, Landroidx/viewpager/widget/ViewPager;->E:F

    invoke-direct {v6, v9}, Landroidx/viewpager/widget/ViewPager;->setScrollingCacheEnabled(Z)V

    goto :goto_1

    :cond_8
    iget v0, v6, Landroidx/viewpager/widget/ViewPager;->C:I

    int-to-float v0, v0

    cmpl-float v0, v14, v0

    if-lez v0, :cond_9

    iput-boolean v9, v6, Landroidx/viewpager/widget/ViewPager;->z:Z

    :cond_9
    :goto_1
    iget-boolean v0, v6, Landroidx/viewpager/widget/ViewPager;->y:Z

    if-eqz v0, :cond_c

    iput v13, v6, Landroidx/viewpager/widget/ViewPager;->E:F

    invoke-virtual {v6, v10}, Landroidx/viewpager/widget/ViewPager;->b(F)Z

    move-result v0

    if-eqz v0, :cond_c

    invoke-virtual/range {p0 .. p0}, Landroid/view/View;->postInvalidateOnAnimation()V

    goto :goto_2

    :cond_a
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getX()F

    move-result v0

    iput v0, v6, Landroidx/viewpager/widget/ViewPager;->F:F

    iput v0, v6, Landroidx/viewpager/widget/ViewPager;->D:F

    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getY()F

    move-result v0

    iput v0, v6, Landroidx/viewpager/widget/ViewPager;->G:F

    iput v0, v6, Landroidx/viewpager/widget/ViewPager;->E:F

    invoke-virtual {v7, v8}, Landroid/view/MotionEvent;->getPointerId(I)I

    move-result v0

    iput v0, v6, Landroidx/viewpager/widget/ViewPager;->H:I

    iput-boolean v8, v6, Landroidx/viewpager/widget/ViewPager;->z:Z

    iput-boolean v9, v6, Landroidx/viewpager/widget/ViewPager;->l:Z

    iget-object v0, v6, Landroidx/viewpager/widget/ViewPager;->k:Landroid/widget/Scroller;

    invoke-virtual {v0}, Landroid/widget/Scroller;->computeScrollOffset()Z

    iget v0, v6, Landroidx/viewpager/widget/ViewPager;->d0:I

    if-ne v0, v1, :cond_b

    iget-object v0, v6, Landroidx/viewpager/widget/ViewPager;->k:Landroid/widget/Scroller;

    invoke-virtual {v0}, Landroid/widget/Scroller;->getFinalX()I

    move-result v0

    iget-object v1, v6, Landroidx/viewpager/widget/ViewPager;->k:Landroid/widget/Scroller;

    invoke-virtual {v1}, Landroid/widget/Scroller;->getCurrX()I

    move-result v1

    sub-int/2addr v0, v1

    invoke-static {v0}, Ljava/lang/Math;->abs(I)I

    move-result v0

    iget v1, v6, Landroidx/viewpager/widget/ViewPager;->M:I

    if-le v0, v1, :cond_b

    iget-object v0, v6, Landroidx/viewpager/widget/ViewPager;->k:Landroid/widget/Scroller;

    invoke-virtual {v0}, Landroid/widget/Scroller;->abortAnimation()V

    iput-boolean v8, v6, Landroidx/viewpager/widget/ViewPager;->w:Z

    invoke-virtual/range {p0 .. p0}, Landroidx/viewpager/widget/ViewPager;->f()V

    iput-boolean v9, v6, Landroidx/viewpager/widget/ViewPager;->y:Z

    invoke-virtual {v6, v9}, Landroidx/viewpager/widget/ViewPager;->b(Z)V

    invoke-virtual {v6, v9}, Landroidx/viewpager/widget/ViewPager;->setScrollState(I)V

    goto :goto_2

    :cond_b
    invoke-direct {v6}, Landroidx/viewpager/widget/ViewPager;->catchStretch231()Z

    move-result v0

    if-nez v0, :cond_c

    invoke-virtual {v6, v8}, Landroidx/viewpager/widget/ViewPager;->a(Z)V

    iput-boolean v8, v6, Landroidx/viewpager/widget/ViewPager;->y:Z

    :cond_c
    :goto_2
    iget-object v0, v6, Landroidx/viewpager/widget/ViewPager;->I:Landroid/view/VelocityTracker;

    if-nez v0, :cond_d

    invoke-static {}, Landroid/view/VelocityTracker;->obtain()Landroid/view/VelocityTracker;

    move-result-object v0

    iput-object v0, v6, Landroidx/viewpager/widget/ViewPager;->I:Landroid/view/VelocityTracker;

    :cond_d
    iget-object v0, v6, Landroidx/viewpager/widget/ViewPager;->I:Landroid/view/VelocityTracker;

    invoke-virtual {v0, v7}, Landroid/view/VelocityTracker;->addMovement(Landroid/view/MotionEvent;)V

    iget-boolean v0, v6, Landroidx/viewpager/widget/ViewPager;->y:Z

    return v0

    :cond_e
    :goto_3
    invoke-virtual/range {p0 .. p0}, Landroidx/viewpager/widget/ViewPager;->g()Z

    return v8
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .registers 11

    iget-boolean v0, p0, Landroidx/viewpager/widget/ViewPager;->N:Z

    const/4 v1, 0x1

    if-eqz v0, :cond_0

    return v1

    :cond_0
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v0

    const/4 v2, 0x0

    if-nez v0, :cond_1

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getEdgeFlags()I

    move-result v0

    if-eqz v0, :cond_1

    return v2

    :cond_1
    iget-object v0, p0, Landroidx/viewpager/widget/ViewPager;->e:Ld/x/a/a;

    if-eqz v0, :cond_17

    invoke-virtual {v0}, Ld/x/a/a;->a()I

    move-result v0

    if-nez v0, :cond_2

    goto/16 :goto_7

    :cond_2
    iget-object v0, p0, Landroidx/viewpager/widget/ViewPager;->I:Landroid/view/VelocityTracker;

    if-nez v0, :cond_3

    invoke-static {}, Landroid/view/VelocityTracker;->obtain()Landroid/view/VelocityTracker;

    move-result-object v0

    iput-object v0, p0, Landroidx/viewpager/widget/ViewPager;->I:Landroid/view/VelocityTracker;

    :cond_3
    iget-object v0, p0, Landroidx/viewpager/widget/ViewPager;->I:Landroid/view/VelocityTracker;

    invoke-virtual {v0, p1}, Landroid/view/VelocityTracker;->addMovement(Landroid/view/MotionEvent;)V

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v0

    and-int/lit16 v0, v0, 0xff

    if-eqz v0, :cond_13

    const/4 v3, -0x1

    if-eq v0, v1, :cond_c

    const/4 v4, 0x2

    if-eq v0, v4, :cond_8

    const/4 v3, 0x3

    if-eq v0, v3, :cond_7

    const/4 v3, 0x5

    if-eq v0, v3, :cond_6

    const/4 v3, 0x6

    if-eq v0, v3, :cond_4

    goto/16 :goto_5

    :cond_4
    invoke-virtual {p0, p1}, Landroidx/viewpager/widget/ViewPager;->a(Landroid/view/MotionEvent;)V

    iget v0, p0, Landroidx/viewpager/widget/ViewPager;->H:I

    invoke-virtual {p1, v0}, Landroid/view/MotionEvent;->findPointerIndex(I)I

    move-result v0

    if-gez v0, :cond_5

    goto/16 :goto_6

    :cond_5
    invoke-virtual {p1, v0}, Landroid/view/MotionEvent;->getX(I)F

    move-result p1

    iput p1, p0, Landroidx/viewpager/widget/ViewPager;->D:F

    goto/16 :goto_5

    :cond_6
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionIndex()I

    move-result v0

    invoke-virtual {p1, v0}, Landroid/view/MotionEvent;->getX(I)F

    move-result v3

    iput v3, p0, Landroidx/viewpager/widget/ViewPager;->D:F

    invoke-virtual {p1, v0}, Landroid/view/MotionEvent;->getPointerId(I)I

    move-result p1

    goto/16 :goto_4

    :cond_7
    iget-boolean p1, p0, Landroidx/viewpager/widget/ViewPager;->y:Z

    if-eqz p1, :cond_14

    iget p1, p0, Landroidx/viewpager/widget/ViewPager;->f:I

    invoke-virtual {p0, p1, v1, v2, v2}, Landroidx/viewpager/widget/ViewPager;->a(IZIZ)V

    goto/16 :goto_3

    :cond_8
    iget-boolean v0, p0, Landroidx/viewpager/widget/ViewPager;->y:Z

    if-nez v0, :cond_b

    iget v0, p0, Landroidx/viewpager/widget/ViewPager;->H:I

    invoke-virtual {p1, v0}, Landroid/view/MotionEvent;->findPointerIndex(I)I

    move-result v0

    if-ne v0, v3, :cond_9

    goto/16 :goto_3

    :cond_9
    invoke-virtual {p1, v0}, Landroid/view/MotionEvent;->getX(I)F

    move-result v3

    iget v4, p0, Landroidx/viewpager/widget/ViewPager;->D:F

    sub-float v4, v3, v4

    invoke-static {v4}, Ljava/lang/Math;->abs(F)F

    move-result v4

    invoke-virtual {p1, v0}, Landroid/view/MotionEvent;->getY(I)F

    move-result v0

    iget v5, p0, Landroidx/viewpager/widget/ViewPager;->E:F

    sub-float v5, v0, v5

    invoke-static {v5}, Ljava/lang/Math;->abs(F)F

    move-result v5

    iget v6, p0, Landroidx/viewpager/widget/ViewPager;->C:I

    int-to-float v6, v6

    cmpl-float v6, v4, v6

    if-lez v6, :cond_b

    cmpl-float v4, v4, v5

    if-lez v4, :cond_b

    iput-boolean v1, p0, Landroidx/viewpager/widget/ViewPager;->y:Z

    invoke-virtual {p0, v1}, Landroidx/viewpager/widget/ViewPager;->b(Z)V

    iget v4, p0, Landroidx/viewpager/widget/ViewPager;->F:F

    sub-float/2addr v3, v4

    const/4 v5, 0x0

    cmpl-float v3, v3, v5

    if-lez v3, :cond_a

    iget v3, p0, Landroidx/viewpager/widget/ViewPager;->C:I

    int-to-float v3, v3

    add-float/2addr v4, v3

    goto :goto_0

    :cond_a
    iget v3, p0, Landroidx/viewpager/widget/ViewPager;->C:I

    int-to-float v3, v3

    sub-float/2addr v4, v3

    :goto_0
    iput v4, p0, Landroidx/viewpager/widget/ViewPager;->D:F

    iput v0, p0, Landroidx/viewpager/widget/ViewPager;->E:F

    invoke-virtual {p0, v1}, Landroidx/viewpager/widget/ViewPager;->setScrollState(I)V

    invoke-direct {p0, v1}, Landroidx/viewpager/widget/ViewPager;->setScrollingCacheEnabled(Z)V

    invoke-virtual {p0}, Landroid/view/ViewGroup;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    if-eqz v0, :cond_b

    invoke-interface {v0, v1}, Landroid/view/ViewParent;->requestDisallowInterceptTouchEvent(Z)V

    :cond_b
    iget-boolean v0, p0, Landroidx/viewpager/widget/ViewPager;->y:Z

    if-eqz v0, :cond_14

    iget v0, p0, Landroidx/viewpager/widget/ViewPager;->H:I

    invoke-virtual {p1, v0}, Landroid/view/MotionEvent;->findPointerIndex(I)I

    move-result v0

    if-ltz v0, :cond_12

    invoke-virtual {p1, v0}, Landroid/view/MotionEvent;->getY(I)F

    move-result v3

    iput v3, p0, Landroidx/viewpager/widget/ViewPager;->E:F

    invoke-virtual {p1, v0}, Landroid/view/MotionEvent;->getX(I)F

    move-result p1

    invoke-virtual {p0, p1}, Landroidx/viewpager/widget/ViewPager;->b(F)Z

    move-result p1

    or-int/2addr v2, p1

    goto/16 :goto_5

    :cond_c
    iget-boolean v0, p0, Landroidx/viewpager/widget/ViewPager;->y:Z

    if-eqz v0, :cond_14

    iget v0, p0, Landroidx/viewpager/widget/ViewPager;->H:I

    invoke-virtual {p1, v0}, Landroid/view/MotionEvent;->findPointerIndex(I)I

    move-result v0

    if-gez v0, :cond_d

    goto/16 :goto_6

    :cond_d
    iget-object v0, p0, Landroidx/viewpager/widget/ViewPager;->I:Landroid/view/VelocityTracker;

    const/16 v4, 0x3e8

    iget v5, p0, Landroidx/viewpager/widget/ViewPager;->K:I

    int-to-float v5, v5

    invoke-virtual {v0, v4, v5}, Landroid/view/VelocityTracker;->computeCurrentVelocity(IF)V

    iget v4, p0, Landroidx/viewpager/widget/ViewPager;->H:I

    invoke-virtual {v0, v4}, Landroid/view/VelocityTracker;->getXVelocity(I)F

    move-result v0

    float-to-int v0, v0

    iput-boolean v1, p0, Landroidx/viewpager/widget/ViewPager;->w:Z

    invoke-direct {p0}, Landroidx/viewpager/widget/ViewPager;->getClientWidth()I

    move-result v4

    invoke-virtual {p0}, Landroid/view/ViewGroup;->getScrollX()I

    move-result v5

    invoke-virtual {p0}, Landroidx/viewpager/widget/ViewPager;->b()Landroidx/viewpager/widget/ViewPager$f;

    move-result-object v6

    iget v7, p0, Landroidx/viewpager/widget/ViewPager;->n:I

    int-to-float v7, v7

    int-to-float v4, v4

    div-float/2addr v7, v4

    iget v8, v6, Landroidx/viewpager/widget/ViewPager$f;->b:I

    int-to-float v5, v5

    div-float/2addr v5, v4

    iget v4, v6, Landroidx/viewpager/widget/ViewPager$f;->e:F

    sub-float/2addr v5, v4

    iget v4, v6, Landroidx/viewpager/widget/ViewPager$f;->d:F

    add-float/2addr v4, v7

    div-float/2addr v5, v4

    move v6, v8

    iget v4, p0, Landroidx/viewpager/widget/ViewPager;->H:I

    invoke-virtual {p1, v4}, Landroid/view/MotionEvent;->findPointerIndex(I)I

    move-result v4

    invoke-virtual {p1, v4}, Landroid/view/MotionEvent;->getX(I)F

    move-result p1

    iget v4, p0, Landroidx/viewpager/widget/ViewPager;->F:F

    sub-float/2addr p1, v4

    float-to-int p1, p1

    .line 1
    invoke-static {p1}, Ljava/lang/Math;->abs(I)I

    move-result p1

    iget v4, p0, Landroidx/viewpager/widget/ViewPager;->L:I

    if-le p1, v4, :cond_f

    invoke-static {v0}, Ljava/lang/Math;->abs(I)I

    move-result p1

    iget v4, p0, Landroidx/viewpager/widget/ViewPager;->J:I

    if-le p1, v4, :cond_f

    invoke-direct {p0}, Landroidx/viewpager/widget/ViewPager;->hasActiveStretch230()Z

    move-result p1

    if-nez p1, :cond_f

    if-lez v0, :cond_e

    goto :goto_2

    :cond_e
    add-int/lit8 v8, v8, 0x1

    goto :goto_2

    :cond_f
    iget p1, p0, Landroidx/viewpager/widget/ViewPager;->f:I

    if-lt v8, p1, :cond_10

    const p1, 0x3ecccccd    # 0.4f

    goto :goto_1

    :cond_10
    const p1, 0x3f19999a    # 0.6f

    :goto_1
    add-float/2addr v5, p1

    float-to-int p1, v5

    add-int/2addr v8, p1

    :goto_2
    iget-object p1, p0, Landroidx/viewpager/widget/ViewPager;->b:Ljava/util/ArrayList;

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result p1

    if-lez p1, :cond_11

    iget-object p1, p0, Landroidx/viewpager/widget/ViewPager;->b:Ljava/util/ArrayList;

    invoke-virtual {p1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroidx/viewpager/widget/ViewPager$f;

    iget-object v2, p0, Landroidx/viewpager/widget/ViewPager;->b:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v4

    add-int/2addr v4, v3

    invoke-virtual {v2, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroidx/viewpager/widget/ViewPager$f;

    iget p1, p1, Landroidx/viewpager/widget/ViewPager$f;->b:I

    iget v2, v2, Landroidx/viewpager/widget/ViewPager$f;->b:I

    invoke-static {v8, v2}, Ljava/lang/Math;->min(II)I

    move-result v2

    invoke-static {p1, v2}, Ljava/lang/Math;->max(II)I

    move-result v8

    .line 2
    :cond_11
    invoke-virtual {p0, v8, v1, v1, v0}, Landroidx/viewpager/widget/ViewPager;->a(IZZI)V

    invoke-virtual {p0}, Landroidx/viewpager/widget/ViewPager;->g()Z

    move-result v2

    invoke-direct {p0, v6, v8, v0, v2}, Landroidx/viewpager/widget/ViewPager;->absorbEdge33(IIIZ)V

    goto/16 :goto_5

    :cond_12
    :goto_3
    invoke-virtual {p0}, Landroidx/viewpager/widget/ViewPager;->g()Z

    move-result v2

    goto :goto_5

    :cond_13
    iget-object v0, p0, Landroidx/viewpager/widget/ViewPager;->k:Landroid/widget/Scroller;

    invoke-virtual {v0}, Landroid/widget/Scroller;->abortAnimation()V

    iput-boolean v2, p0, Landroidx/viewpager/widget/ViewPager;->w:Z

    invoke-virtual {p0}, Landroidx/viewpager/widget/ViewPager;->f()V

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v0

    iput v0, p0, Landroidx/viewpager/widget/ViewPager;->F:F

    iput v0, p0, Landroidx/viewpager/widget/ViewPager;->D:F

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v0

    iput v0, p0, Landroidx/viewpager/widget/ViewPager;->G:F

    iput v0, p0, Landroidx/viewpager/widget/ViewPager;->E:F

    invoke-virtual {p1, v2}, Landroid/view/MotionEvent;->getPointerId(I)I

    move-result p1

    :goto_4
    iput p1, p0, Landroidx/viewpager/widget/ViewPager;->H:I

    :cond_14
    :goto_5
    if-eqz v2, :cond_15

    invoke-virtual {p0}, Landroid/view/View;->postInvalidateOnAnimation()V

    :cond_15
    return v1

    :goto_6
    iget-boolean v0, p0, Landroidx/viewpager/widget/ViewPager;->y:Z

    if-eqz v0, :cond_16

    iget v0, p0, Landroidx/viewpager/widget/ViewPager;->f:I

    invoke-virtual {p0, v0, v1, v2, v2}, Landroidx/viewpager/widget/ViewPager;->a(IZIZ)V

    :cond_16
    invoke-virtual {p0}, Landroidx/viewpager/widget/ViewPager;->g()Z

    return v1

    :cond_17
    :goto_7
    return v2
.end method

.method public setDragInGutterEnabled(Z)V
    .registers 2
    .param p1, "enabled"    # Z

    .line 2019
    iput-boolean p1, p0, Landroidx/viewpager/widget/ViewPager;->mDragInGutterEnabled:Z

    .line 2020
    return-void
.end method

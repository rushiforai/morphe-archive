.class public Lcom/opera/android/sheet/OperaBottomSheetBehavior;
.super Lnv5;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<V:",
        "Landroid/view/View;",
        ">",
        "Lnv5;"
    }
.end annotation


# static fields
.field public static final N:Lsv2;

.field public static final O:Lsv2;


# instance fields
.field public final A:Ljava/util/ArrayList;

.field public final B:Lojf;

.field public C:Landroid/view/VelocityTracker;

.field public D:I

.field public E:I

.field public F:Z

.field public G:Lljf;

.field public H:Ljava/util/HashMap;

.field public I:Z

.field public J:Z

.field public K:I

.field public L:Z

.field public final M:Lkq3;

.field public a:Lsv2;

.field public final b:I

.field public final c:F

.field public final d:F

.field public e:I

.field public f:Z

.field public g:I

.field public final h:I

.field public i:I

.field public final j:Z

.field public k:Lmjf;

.field public l:I

.field public m:I

.field public n:Z

.field public o:Z

.field public p:Z

.field public q:I

.field public r:Lx5n;

.field public s:Z

.field public t:I

.field public u:Z

.field public v:I

.field public w:I

.field public x:I

.field public y:Ljava/lang/ref/WeakReference;

.field public z:Ljava/lang/ref/WeakReference;


# direct methods
.method static constructor <clinit>()V
    .registers 4

    new-instance v0, Lsv2;

    const v1, 0x7fffffff

    const v2, -0x7fffffff

    invoke-direct {v0, v1, v1, v2}, Lsv2;-><init>(III)V

    sput-object v0, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->N:Lsv2;

    new-instance v0, Lsv2;

    const/16 v1, 0xbb8

    const/16 v2, -0x1b58

    const/16 v3, 0x1b58

    invoke-direct {v0, v3, v1, v2}, Lsv2;-><init>(III)V

    sput-object v0, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->O:Lsv2;

    return-void
.end method

.method public constructor <init>()V
    .registers 2

    .line 198
    new-instance v0, Lojf;

    .line 199
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 200
    invoke-direct {p0, v0}, Lcom/opera/android/sheet/OperaBottomSheetBehavior;-><init>(Lojf;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 4
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 187
    new-instance v0, Lojf;

    .line 188
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 189
    invoke-direct {p0, p1, v0, p2}, Lcom/opera/android/sheet/OperaBottomSheetBehavior;-><init>(Landroid/content/Context;Lojf;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lojf;Landroid/util/AttributeSet;)V
    .registers 10
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Lojf;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p3    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    sget-object v0, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->O:Lsv2;

    iput-object v0, p0, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->a:Lsv2;

    const/4 v0, 0x0

    iput v0, p0, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->b:I

    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->p:Z

    const/4 v2, 0x4

    iput v2, p0, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->q:I

    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    iput-object v3, p0, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->A:Ljava/util/ArrayList;

    new-instance v3, Lkq3;

    invoke-direct {v3, p0, v1}, Lkq3;-><init>(Lnv5;B)V

    iput-object v3, p0, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->M:Lkq3;

    iput-object p2, p0, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->B:Lojf;

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p2

    const v3, 0x7f070790

    invoke-virtual {p2, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p2

    iput p2, p0, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->h:I

    sget-object p2, Lihh;->d:[I

    invoke-virtual {p1, p3, p2}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    move-result-object p2

    const/16 p3, 0xc

    invoke-virtual {p2, p3}, Landroid/content/res/TypedArray;->peekValue(I)Landroid/util/TypedValue;

    move-result-object v3

    const/4 v4, -0x1

    if-eqz v3, :cond_44

    iget v3, v3, Landroid/util/TypedValue;->data:I

    if-ne v3, v4, :cond_44

    invoke-virtual {p0, v3}, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->H(I)V

    goto :goto_4b

    :cond_44
    invoke-virtual {p2, p3, v4}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result p3

    invoke-virtual {p0, p3}, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->H(I)V

    :goto_4b
    const/16 p3, 0xa

    invoke-virtual {p2, p3, v0}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result p3

    iget-boolean v3, p0, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->n:Z

    if-eq v3, p3, :cond_64

    iput-boolean p3, p0, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->n:Z

    if-nez p3, :cond_61

    iget p3, p0, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->q:I

    const/4 v3, 0x6

    if-ne p3, v3, :cond_61

    invoke-virtual {p0, v2}, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->I(I)V

    :cond_61
    invoke-virtual {p0}, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->M()V

    :cond_64
    const/16 p3, 0x10

    invoke-virtual {p2, p3, v0}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v2

    iput-boolean v2, p0, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->j:Z

    const/16 v2, 0xf

    invoke-virtual {p2, v2, v0}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v2

    iput-boolean v2, p0, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->o:Z

    const/4 v2, 0x5

    invoke-virtual {p2, v2, v1}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v1

    iput-boolean v1, p0, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->p:Z

    const/16 v1, 0xd

    invoke-virtual {p2, v1, v0}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v1

    iput v1, p0, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->b:I

    const/4 v1, 0x7

    invoke-virtual {p2, v1}, Landroid/content/res/TypedArray;->peekValue(I)Landroid/util/TypedValue;

    move-result-object v2

    const/4 v3, 0x0

    const-string v4, "offset must be greater than or equal to 0"

    if-eqz v2, :cond_99

    iget v5, v2, Landroid/util/TypedValue;->type:I

    if-ne v5, p3, :cond_99

    iget p3, v2, Landroid/util/TypedValue;->data:I

    if-gez p3, :cond_9f

    invoke-static {v4}, Lqp2;->o(Ljava/lang/String;)V

    throw v3

    :cond_99
    invoke-virtual {p2, v1, v0}, Landroid/content/res/TypedArray;->getDimensionPixelOffset(II)I

    move-result p3

    if-ltz p3, :cond_b7

    :cond_9f
    invoke-virtual {p2}, Landroid/content/res/TypedArray;->recycle()V

    invoke-static {p1}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    move-result-object p1

    invoke-virtual {p1}, Landroid/view/ViewConfiguration;->getScaledMinimumFlingVelocity()I

    move-result p2

    shl-int/lit8 p2, p2, 0x2

    int-to-float p2, p2

    iput p2, p0, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->c:F

    invoke-virtual {p1}, Landroid/view/ViewConfiguration;->getScaledMaximumFlingVelocity()I

    move-result p1

    int-to-float p1, p1

    iput p1, p0, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->d:F

    return-void

    :cond_b7
    invoke-static {v4}, Lqp2;->o(Ljava/lang/String;)V

    throw v3
.end method

.method public constructor <init>(Lojf;)V
    .registers 4
    .param p1    # Lojf;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 190
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 191
    sget-object v0, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->O:Lsv2;

    iput-object v0, p0, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->a:Lsv2;

    const/4 v0, 0x0

    .line 192
    iput v0, p0, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->b:I

    const/4 v0, 0x1

    .line 193
    iput-boolean v0, p0, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->p:Z

    const/4 v1, 0x4

    .line 194
    iput v1, p0, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->q:I

    .line 195
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, p0, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->A:Ljava/util/ArrayList;

    .line 196
    new-instance v1, Lkq3;

    invoke-direct {v1, p0, v0}, Lkq3;-><init>(Lnv5;B)V

    iput-object v1, p0, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->M:Lkq3;

    .line 197
    iput-object p1, p0, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->B:Lojf;

    return-void
.end method

.method public static C(Landroid/view/View;)Lcom/opera/android/sheet/OperaBottomSheetBehavior;
    .registers 3

    invoke-virtual {p0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p0

    instance-of v0, p0, Lqv5;

    const/4 v1, 0x0

    if-eqz v0, :cond_1a

    check-cast p0, Lqv5;

    iget-object p0, p0, Lqv5;->a:Lnv5;

    instance-of v0, p0, Lcom/opera/android/sheet/OperaBottomSheetBehavior;

    if-eqz v0, :cond_14

    check-cast p0, Lcom/opera/android/sheet/OperaBottomSheetBehavior;

    return-object p0

    :cond_14
    const-string p0, "The view is not associated with OperaBottomSheetBehavior"

    invoke-static {p0}, Lqp2;->o(Ljava/lang/String;)V

    return-object v1

    :cond_1a
    const-string p0, "The view is not a child of CoordinatorLayout"

    invoke-static {p0}, Lqp2;->o(Ljava/lang/String;)V

    return-object v1
.end method


# virtual methods
.method public final A(I)V
    .registers 5

    iget-object v0, p0, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->y:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    if-eqz v0, :cond_29

    iget-object v1, p0, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->A:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_29

    invoke-virtual {p0, p1}, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->D(I)F

    move-result p0

    const/4 p1, 0x0

    :goto_17
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-ge p1, v2, :cond_29

    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lnjf;

    invoke-virtual {v2, v0, p0}, Lnjf;->c(Landroid/view/View;F)V

    add-int/lit8 p1, p1, 0x1

    goto :goto_17

    :cond_29
    return-void
.end method

.method public final B(Landroid/view/View;)Landroid/view/View;
    .registers 5

    sget-object v0, Lr5n;->a:Ljava/util/WeakHashMap;

    invoke-virtual {p1}, Landroid/view/View;->isNestedScrollingEnabled()Z

    move-result v0

    if-eqz v0, :cond_9

    return-object p1

    :cond_9
    instance-of v0, p1, Landroid/view/ViewGroup;

    if-eqz v0, :cond_24

    check-cast p1, Landroid/view/ViewGroup;

    invoke-virtual {p1}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v0

    const/4 v1, 0x0

    :goto_14
    if-ge v1, v0, :cond_24

    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->B(Landroid/view/View;)Landroid/view/View;

    move-result-object v2

    if-eqz v2, :cond_21

    return-object v2

    :cond_21
    add-int/lit8 v1, v1, 0x1

    goto :goto_14

    :cond_24
    const/4 p0, 0x0

    return-object p0
.end method

.method public final D(I)F
    .registers 7

    iget-object v0, p0, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->y:Ljava/lang/ref/WeakReference;

    const/4 v1, 0x0

    if-nez v0, :cond_6

    return v1

    :cond_6
    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    if-eqz v0, :cond_5d

    iget-object v2, p0, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->A:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_5d

    invoke-virtual {v0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    iget-object p0, p0, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->B:Lojf;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const v3, 0x7f0705a1

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v2

    int-to-float v2, v2

    invoke-virtual {v0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const p0, 0x7f0705a2

    invoke-virtual {v3, p0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p0

    int-to-float p0, p0

    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    move-result v0

    int-to-float v0, v0

    int-to-float p1, p1

    cmpg-float v3, p1, v2

    const/high16 v4, 0x3f800000    # 1.0f

    if-gez v3, :cond_4f

    div-float/2addr p1, v2

    invoke-static {p1, v1, v4}, Lnb6;->i(FFF)F

    move-result p0

    sub-float/2addr v4, p0

    return v4

    :cond_4f
    sub-float v2, v0, p0

    cmpl-float v2, p1, v2

    if-lez v2, :cond_5d

    sub-float/2addr v0, p1

    div-float/2addr v0, p0

    invoke-static {v0, v1, v4}, Lnb6;->i(FFF)F

    move-result p0

    sub-float/2addr p0, v4

    return p0

    :cond_5d
    return v1
.end method

.method public final E(Landroid/view/View;F)V
    .registers 9

    iget-boolean v0, p0, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->o:Z

    const/4 v1, 0x3

    iget v2, p0, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->c:F

    const/4 v3, 0x4

    const/4 v4, 0x0

    if-eqz v0, :cond_e

    neg-float v0, p2

    cmpl-float v0, v0, v2

    if-gtz v0, :cond_1a

    :cond_e
    invoke-virtual {p0, p1, p2}, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->z(Landroid/view/View;F)I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->D(I)F

    move-result v0

    cmpl-float v0, v0, v4

    if-lez v0, :cond_1d

    :cond_1a
    iget v0, p0, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->l:I

    goto :goto_65

    :cond_1d
    iget-boolean v0, p0, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->n:Z

    if-eqz v0, :cond_43

    neg-float v0, p2

    cmpl-float v2, v0, v2

    if-gtz v2, :cond_43

    iget-boolean v2, p0, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->o:Z

    if-nez v2, :cond_3f

    iget-object v2, p0, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->a:Lsv2;

    iget v2, v2, Lsv2;->c:I

    int-to-float v2, v2

    cmpg-float v0, v0, v2

    if-ltz v0, :cond_3f

    invoke-virtual {p0, p1, p2}, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->z(Landroid/view/View;F)I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->D(I)F

    move-result v0

    cmpg-float v0, v0, v4

    if-gez v0, :cond_43

    :cond_3f
    iget v0, p0, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->x:I

    const/4 v1, 0x6

    goto :goto_65

    :cond_43
    iget v0, p0, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->t:I

    if-nez v0, :cond_62

    invoke-virtual {p1}, Landroid/view/View;->getTop()I

    move-result v0

    iget v2, p0, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->l:I

    sub-int v2, v0, v2

    invoke-static {v2}, Ljava/lang/Math;->abs(I)I

    move-result v2

    iget v5, p0, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->m:I

    sub-int/2addr v0, v5

    invoke-static {v0}, Ljava/lang/Math;->abs(I)I

    move-result v0

    if-ge v2, v0, :cond_5f

    iget v0, p0, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->l:I

    goto :goto_65

    :cond_5f
    iget v0, p0, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->m:I

    goto :goto_64

    :cond_62
    iget v0, p0, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->m:I

    :goto_64
    move v1, v3

    :goto_65
    if-ne v1, v3, :cond_a1

    invoke-virtual {p0, p1, p2}, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->z(Landroid/view/View;F)I

    move-result p2

    iget v2, p0, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->x:I

    sub-int/2addr v2, p2

    iget-object p2, p0, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->y:Ljava/lang/ref/WeakReference;

    invoke-virtual {p2}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Landroid/view/View;

    if-eqz p2, :cond_94

    iget-object p2, p0, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->A:Ljava/util/ArrayList;

    invoke-virtual {p2}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_94

    const/4 v3, 0x0

    :goto_81
    invoke-virtual {p2}, Ljava/util/ArrayList;->size()I

    move-result v5

    if-ge v3, v5, :cond_94

    invoke-virtual {p2, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lnjf;

    invoke-virtual {v5, v2}, Lnjf;->a(I)I

    move-result v2

    add-int/lit8 v3, v3, 0x1

    goto :goto_81

    :cond_94
    iget p2, p0, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->x:I

    sub-int/2addr p2, v2

    invoke-virtual {p0, p2}, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->D(I)F

    move-result v2

    cmpl-float v2, v2, v4

    if-nez v2, :cond_a1

    const/4 v1, 0x5

    move v0, p2

    :cond_a1
    invoke-virtual {p0, p1, v1, v0}, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->L(Landroid/view/View;II)V

    return-void
.end method

.method public final F(Landroidx/coordinatorlayout/widget/CoordinatorLayout;Landroid/view/MotionEvent;)V
    .registers 6

    iget-object v0, p0, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->z:Ljava/lang/ref/WeakReference;

    if-eqz v0, :cond_b

    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    goto :goto_c

    :cond_b
    const/4 v0, 0x0

    :goto_c
    if-eqz v0, :cond_2b

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getX()F

    move-result v1

    float-to-int v1, v1

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getY()F

    move-result v2

    float-to-int v2, v2

    invoke-virtual {p1, v0, v1, v2}, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->o(Landroid/view/View;II)Z

    move-result p1

    if-eqz p1, :cond_2b

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getActionIndex()I

    move-result p1

    invoke-virtual {p2, p1}, Landroid/view/MotionEvent;->getPointerId(I)I

    move-result p1

    iput p1, p0, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->D:I

    const/4 p1, 0x1

    iput-boolean p1, p0, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->F:Z

    :cond_2b
    return-void
.end method

.method public final G(ILandroid/view/View;)V
    .registers 5

    const/4 p2, 0x3

    const/4 v0, 0x0

    if-ne p1, p2, :cond_9

    const/4 p2, 0x1

    invoke-virtual {p0, p2}, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->N(Z)V

    goto :goto_15

    :cond_9
    const/4 p2, 0x6

    if-eq p1, p2, :cond_12

    const/4 p2, 0x4

    if-eq p1, p2, :cond_12

    const/4 p2, 0x5

    if-ne p1, p2, :cond_15

    :cond_12
    invoke-virtual {p0, v0}, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->N(Z)V

    :cond_15
    :goto_15
    iget-object p2, p0, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->A:Ljava/util/ArrayList;

    invoke-virtual {p2}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-ge v0, v1, :cond_29

    invoke-virtual {p2, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lnjf;

    invoke-virtual {p2, p1}, Lnjf;->d(I)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_15

    :cond_29
    invoke-virtual {p0}, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->M()V

    return-void
.end method

.method public final H(I)V
    .registers 4

    iget-boolean v0, p0, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->f:Z

    const/4 v1, -0x1

    if-ne p1, v1, :cond_b

    if-nez v0, :cond_11

    const/4 p1, 0x1

    iput-boolean p1, p0, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->f:Z

    goto :goto_1b

    :cond_b
    if-nez v0, :cond_12

    iget v0, p0, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->e:I

    if-ne v0, p1, :cond_12

    :cond_11
    return-void

    :cond_12
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->f:Z

    invoke-static {v0, p1}, Ljava/lang/Math;->max(II)I

    move-result p1

    iput p1, p0, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->e:I

    :goto_1b
    invoke-virtual {p0}, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->O()V

    return-void
.end method

.method public final I(I)V
    .registers 9

    iget v0, p0, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->q:I

    if-eq p1, v0, :cond_15

    iget-object v0, p0, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->y:Ljava/lang/ref/WeakReference;

    if-nez v0, :cond_19

    const/4 v0, 0x4

    if-eq p1, v0, :cond_16

    const/4 v0, 0x3

    if-eq p1, v0, :cond_16

    iget-boolean v0, p0, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->n:Z

    if-eqz v0, :cond_15

    const/4 v0, 0x6

    if-eq p1, v0, :cond_16

    :cond_15
    return-void

    :cond_16
    iput p1, p0, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->q:I

    return-void

    :cond_19
    iget-object v0, p0, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->y:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object v0

    move-object v5, v0

    check-cast v5, Landroid/view/View;

    if-eqz v5, :cond_48

    invoke-virtual {v5}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    if-eqz v0, :cond_43

    invoke-interface {v0}, Landroid/view/ViewParent;->isLayoutRequested()Z

    move-result v0

    if-eqz v0, :cond_43

    invoke-virtual {v5}, Landroid/view/View;->isAttachedToWindow()Z

    move-result v0

    if-eqz v0, :cond_43

    new-instance v1, Lsq1;

    const/4 v2, 0x5

    const/4 v6, 0x0

    move-object v4, p0

    move v3, p1

    invoke-direct/range {v1 .. v6}, Lsq1;-><init>(BILjava/lang/Object;Ljava/lang/Object;Z)V

    invoke-virtual {v5, v1}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    goto :goto_48

    :cond_43
    move-object v4, p0

    move v3, p1

    invoke-virtual {v4, v3, v5}, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->K(ILandroid/view/View;)V

    :cond_48
    :goto_48
    return-void
.end method

.method public final J(I)V
    .registers 3

    iget v0, p0, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->q:I

    if-eq v0, p1, :cond_17

    iput p1, p0, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->q:I

    iget-object v0, p0, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->y:Ljava/lang/ref/WeakReference;

    if-nez v0, :cond_c

    const/4 v0, 0x0

    goto :goto_12

    :cond_c
    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    :goto_12
    if-eqz v0, :cond_17

    invoke-virtual {p0, p1, v0}, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->G(ILandroid/view/View;)V

    :cond_17
    return-void
.end method

.method public final K(ILandroid/view/View;)V
    .registers 8

    const/4 v0, 0x3

    const/4 v1, 0x5

    const/4 v2, 0x4

    if-ne p1, v2, :cond_8

    iget v3, p0, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->m:I

    goto :goto_36

    :cond_8
    if-ne p1, v1, :cond_28

    invoke-virtual {p2}, Landroid/view/View;->isLaidOut()Z

    move-result v3

    if-nez v3, :cond_13

    iget v3, p0, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->m:I

    goto :goto_36

    :cond_13
    invoke-virtual {p2}, Landroid/view/View;->getTop()I

    move-result v3

    invoke-virtual {p0, v3}, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->D(I)F

    move-result v3

    const/4 v4, 0x0

    cmpl-float v3, v3, v4

    if-nez v3, :cond_25

    invoke-virtual {p2}, Landroid/view/View;->getTop()I

    move-result v3

    goto :goto_36

    :cond_25
    iget v3, p0, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->m:I

    goto :goto_36

    :cond_28
    if-ne p1, v0, :cond_2d

    iget v3, p0, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->l:I

    goto :goto_36

    :cond_2d
    iget-boolean v3, p0, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->n:Z

    if-eqz v3, :cond_46

    const/4 v3, 0x6

    if-ne p1, v3, :cond_46

    iget v3, p0, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->x:I

    :goto_36
    if-eq p1, v2, :cond_3a

    if-ne p1, v1, :cond_42

    :cond_3a
    iget v1, p0, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->l:I

    if-gt v3, v1, :cond_42

    invoke-virtual {p0, p2, v0, v1}, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->L(Landroid/view/View;II)V

    return-void

    :cond_42
    invoke-virtual {p0, p2, p1, v3}, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->L(Landroid/view/View;II)V

    return-void

    :cond_46
    const-string p0, "Illegal state argument: "

    invoke-static {p1, p0}, Lsko;->i(ILjava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lqp2;->o(Ljava/lang/String;)V

    return-void
.end method

.method public final L(Landroid/view/View;II)V
    .registers 6

    iget-object v0, p0, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->r:Lx5n;

    if-eqz v0, :cond_2f

    invoke-virtual {p1}, Landroid/view/View;->getLeft()I

    move-result v1

    invoke-virtual {v0, p1, v1, p3}, Lx5n;->p(Landroid/view/View;II)Z

    move-result p3

    if-eqz p3, :cond_2f

    const/4 p3, 0x2

    invoke-virtual {p0, p3}, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->J(I)V

    iget-object p3, p0, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->k:Lmjf;

    if-nez p3, :cond_1d

    new-instance p3, Lmjf;

    invoke-direct {p3, p0, p1, p2}, Lmjf;-><init>(Lcom/opera/android/sheet/OperaBottomSheetBehavior;Landroid/view/View;I)V

    iput-object p3, p0, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->k:Lmjf;

    :cond_1d
    iget-boolean v0, p3, Lmjf;->b:Z

    if-nez v0, :cond_2c

    iput p2, p3, Lmjf;->c:I

    invoke-virtual {p1, p3}, Landroid/view/View;->postOnAnimation(Ljava/lang/Runnable;)V

    iget-object p0, p0, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->k:Lmjf;

    const/4 p1, 0x1

    iput-boolean p1, p0, Lmjf;->b:Z

    return-void

    :cond_2c
    iput p2, p3, Lmjf;->c:I

    return-void

    :cond_2f
    invoke-virtual {p0, p2}, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->J(I)V

    return-void
.end method

.method public final M()V
    .registers 7

    iget-object v0, p0, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->y:Ljava/lang/ref/WeakReference;

    if-eqz v0, :cond_44

    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    if-eqz v0, :cond_44

    const/high16 v1, 0x80000

    invoke-static {v1, v0}, Lr5n;->j(ILandroid/view/View;)V

    const/4 v1, 0x0

    invoke-static {v1, v0}, Lr5n;->g(ILandroid/view/View;)V

    const/high16 v2, 0x40000

    invoke-static {v2, v0}, Lr5n;->j(ILandroid/view/View;)V

    invoke-static {v1, v0}, Lr5n;->g(ILandroid/view/View;)V

    const/high16 v2, 0x100000

    invoke-static {v2, v0}, Lr5n;->j(ILandroid/view/View;)V

    invoke-static {v1, v0}, Lr5n;->g(ILandroid/view/View;)V

    iget-boolean v1, p0, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->n:Z

    const/4 v2, 0x0

    const/4 v3, 0x3

    if-eqz v1, :cond_3a

    iget v1, p0, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->q:I

    const/4 v4, 0x6

    if-eq v1, v4, :cond_3a

    sget-object v1, Ls8;->w:Ls8;

    new-instance v5, Llq3;

    invoke-direct {v5, p0, v4, v3}, Llq3;-><init>(Ljava/lang/Object;IB)V

    invoke-static {v0, v1, v2, v5}, Lr5n;->k(Landroid/view/View;Ls8;Ljava/lang/String;Lla;)V

    :cond_3a
    iget v1, p0, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->q:I

    const/4 v4, 0x4

    if-eq v1, v3, :cond_50

    if-eq v1, v4, :cond_45

    const/4 v4, 0x5

    if-eq v1, v4, :cond_45

    :cond_44
    return-void

    :cond_45
    sget-object v1, Ls8;->u:Ls8;

    new-instance v4, Llq3;

    invoke-direct {v4, p0, v3, v3}, Llq3;-><init>(Ljava/lang/Object;IB)V

    invoke-static {v0, v1, v2, v4}, Lr5n;->k(Landroid/view/View;Ls8;Ljava/lang/String;Lla;)V

    return-void

    :cond_50
    sget-object v1, Ls8;->v:Ls8;

    new-instance v5, Llq3;

    invoke-direct {v5, p0, v4, v3}, Llq3;-><init>(Ljava/lang/Object;IB)V

    invoke-static {v0, v1, v2, v5}, Lr5n;->k(Landroid/view/View;Ls8;Ljava/lang/String;Lla;)V

    return-void
.end method

.method public final N(Z)V
    .registers 8

    iget-object v0, p0, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->y:Ljava/lang/ref/WeakReference;

    if-eqz v0, :cond_4b

    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    instance-of v1, v0, Landroidx/coordinatorlayout/widget/CoordinatorLayout;

    if-eqz v1, :cond_4b

    check-cast v0, Landroidx/coordinatorlayout/widget/CoordinatorLayout;

    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v1

    if-eqz p1, :cond_25

    iget-object v2, p0, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->H:Ljava/util/HashMap;

    if-nez v2, :cond_4b

    new-instance v2, Ljava/util/HashMap;

    invoke-direct {v2, v1}, Ljava/util/HashMap;-><init>(I)V

    iput-object v2, p0, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->H:Ljava/util/HashMap;

    :cond_25
    const/4 v2, 0x0

    :goto_26
    if-ge v2, v1, :cond_46

    invoke-virtual {v0, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    iget-object v4, p0, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->y:Ljava/lang/ref/WeakReference;

    invoke-virtual {v4}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object v4

    if-eq v3, v4, :cond_43

    if-eqz p1, :cond_43

    iget-object v4, p0, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->H:Ljava/util/HashMap;

    invoke-virtual {v3}, Landroid/view/View;->getImportantForAccessibility()I

    move-result v5

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v4, v3, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_43
    add-int/lit8 v2, v2, 0x1

    goto :goto_26

    :cond_46
    if-nez p1, :cond_4b

    const/4 p1, 0x0

    iput-object p1, p0, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->H:Ljava/util/HashMap;

    :cond_4b
    return-void
.end method

.method public final O()V
    .registers 3

    iget-object v0, p0, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->y:Ljava/lang/ref/WeakReference;

    if-eqz v0, :cond_19

    invoke-virtual {p0}, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->y()V

    iget v0, p0, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->q:I

    const/4 v1, 0x4

    if-ne v0, v1, :cond_19

    iget-object p0, p0, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->y:Ljava/lang/ref/WeakReference;

    invoke-virtual {p0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/view/View;

    if-eqz p0, :cond_19

    invoke-virtual {p0}, Landroid/view/View;->requestLayout()V

    :cond_19
    return-void
.end method

.method public final g(Lqv5;)V
    .registers 2

    const/4 p1, 0x0

    iput-object p1, p0, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->y:Ljava/lang/ref/WeakReference;

    iput-object p1, p0, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->r:Lx5n;

    return-void
.end method

.method public final j()V
    .registers 2

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->y:Ljava/lang/ref/WeakReference;

    iput-object v0, p0, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->r:Lx5n;

    return-void
.end method

.method public final k(Landroidx/coordinatorlayout/widget/CoordinatorLayout;Landroid/view/View;Landroid/view/MotionEvent;)Z
    .registers 13

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->I:Z

    iget-object v1, p0, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->G:Lljf;

    const/4 v2, 0x0

    const/4 v3, 0x1

    if-eqz v1, :cond_1d

    iget-boolean v4, v1, Lljf;->e:Z

    if-eqz v4, :cond_f

    move v1, v0

    goto :goto_1a

    :cond_f
    iput-boolean v3, v1, Lljf;->e:Z

    iput-boolean v3, v1, Lljf;->c:Z

    iget-object v4, v1, Lljf;->b:Landroid/widget/OverScroller;

    invoke-virtual {v4}, Landroid/widget/OverScroller;->abortAnimation()V

    iget-boolean v1, v1, Lljf;->d:Z

    :goto_1a
    iput-object v2, p0, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->G:Lljf;

    goto :goto_1e

    :cond_1d
    move v1, v0

    :goto_1e
    invoke-virtual {p2}, Landroid/view/View;->isShown()Z

    move-result v4

    if-eqz v4, :cond_d6

    iget-boolean v4, p0, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->p:Z

    if-eqz v4, :cond_d6

    invoke-virtual {p3}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v4

    const/4 v5, -0x1

    if-nez v4, :cond_3a

    iput v5, p0, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->D:I

    iget-object v6, p0, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->C:Landroid/view/VelocityTracker;

    if-eqz v6, :cond_3a

    invoke-virtual {v6}, Landroid/view/VelocityTracker;->recycle()V

    iput-object v2, p0, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->C:Landroid/view/VelocityTracker;

    :cond_3a
    iget-object v6, p0, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->C:Landroid/view/VelocityTracker;

    if-nez v6, :cond_44

    invoke-static {}, Landroid/view/VelocityTracker;->obtain()Landroid/view/VelocityTracker;

    move-result-object v6

    iput-object v6, p0, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->C:Landroid/view/VelocityTracker;

    :cond_44
    invoke-virtual {v6, p3}, Landroid/view/VelocityTracker;->addMovement(Landroid/view/MotionEvent;)V

    const/4 v6, 0x2

    if-eqz v4, :cond_60

    if-eq v4, v3, :cond_4f

    const/4 p2, 0x3

    if-ne v4, p2, :cond_86

    :cond_4f
    iput-boolean v0, p0, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->F:Z

    iput v5, p0, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->D:I

    iget-boolean p2, p0, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->s:Z

    if-eqz p2, :cond_5a

    iput-boolean v0, p0, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->s:Z

    return v0

    :cond_5a
    if-eqz v1, :cond_86

    invoke-virtual {p0, p1, p3}, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->F(Landroidx/coordinatorlayout/widget/CoordinatorLayout;Landroid/view/MotionEvent;)V

    goto :goto_86

    :cond_60
    invoke-virtual {p3}, Landroid/view/MotionEvent;->getX()F

    move-result v7

    float-to-int v7, v7

    invoke-virtual {p3}, Landroid/view/MotionEvent;->getY()F

    move-result v8

    float-to-int v8, v8

    iput v8, p0, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->E:I

    iget v8, p0, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->q:I

    if-ne v8, v6, :cond_72

    if-eqz v1, :cond_75

    :cond_72
    invoke-virtual {p0, p1, p3}, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->F(Landroidx/coordinatorlayout/widget/CoordinatorLayout;Landroid/view/MotionEvent;)V

    :cond_75
    iget v1, p0, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->D:I

    if-ne v1, v5, :cond_83

    iget v1, p0, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->E:I

    invoke-virtual {p1, p2, v7, v1}, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->o(Landroid/view/View;II)Z

    move-result p2

    if-nez p2, :cond_83

    move p2, v3

    goto :goto_84

    :cond_83
    move p2, v0

    :goto_84
    iput-boolean p2, p0, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->s:Z

    :cond_86
    :goto_86
    iget-boolean p2, p0, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->s:Z

    if-nez p2, :cond_94

    iget-object p2, p0, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->r:Lx5n;

    if-eqz p2, :cond_94

    invoke-virtual {p2, p3}, Lx5n;->o(Landroid/view/MotionEvent;)Z

    move-result p2

    if-nez p2, :cond_d4

    :cond_94
    iget-object p2, p0, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->z:Ljava/lang/ref/WeakReference;

    if-eqz p2, :cond_9f

    invoke-virtual {p2}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object p2

    move-object v2, p2

    check-cast v2, Landroid/view/View;

    :cond_9f
    if-ne v4, v6, :cond_d5

    if-eqz v2, :cond_d5

    iget-boolean p2, p0, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->s:Z

    if-nez p2, :cond_d5

    iget p2, p0, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->q:I

    if-eq p2, v3, :cond_d5

    invoke-virtual {p3}, Landroid/view/MotionEvent;->getX()F

    move-result p2

    float-to-int p2, p2

    invoke-virtual {p3}, Landroid/view/MotionEvent;->getY()F

    move-result v1

    float-to-int v1, v1

    invoke-virtual {p1, v2, p2, v1}, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->o(Landroid/view/View;II)Z

    move-result p1

    if-nez p1, :cond_d5

    iget-object p1, p0, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->r:Lx5n;

    if-eqz p1, :cond_d5

    iget p1, p0, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->E:I

    int-to-float p1, p1

    invoke-virtual {p3}, Landroid/view/MotionEvent;->getY()F

    move-result p2

    sub-float/2addr p1, p2

    invoke-static {p1}, Ljava/lang/Math;->abs(F)F

    move-result p1

    iget-object p0, p0, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->r:Lx5n;

    iget p0, p0, Lx5n;->b:I

    int-to-float p0, p0

    cmpl-float p0, p1, p0

    if-lez p0, :cond_d5

    :cond_d4
    return v3

    :cond_d5
    return v0

    :cond_d6
    iput-boolean v3, p0, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->s:Z

    return v0
.end method

.method public final l(Landroidx/coordinatorlayout/widget/CoordinatorLayout;Landroid/view/View;I)Z
    .registers 9

    invoke-virtual {p1}, Landroid/view/View;->getFitsSystemWindows()Z

    move-result v0

    const/4 v1, 0x1

    if-eqz v0, :cond_10

    invoke-virtual {p2}, Landroid/view/View;->getFitsSystemWindows()Z

    move-result v0

    if-nez v0, :cond_10

    invoke-virtual {p2, v1}, Landroid/view/View;->setFitsSystemWindows(Z)V

    :cond_10
    iget-object v0, p0, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->y:Ljava/lang/ref/WeakReference;

    if-nez v0, :cond_46

    invoke-virtual {p1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v2, 0x7f07017d

    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    iput v0, p0, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->g:I

    iget-boolean v0, p0, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->j:Z

    if-nez v0, :cond_33

    iget-boolean v0, p0, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->f:Z

    if-nez v0, :cond_33

    new-instance v0, Lkqd;

    const/16 v2, 0x11

    invoke-direct {v0, p0, v2}, Lkqd;-><init>(Ljava/lang/Object;B)V

    invoke-static {p2, v0}, Lhn9;->h(Landroid/view/View;Lo9n;)V

    :cond_33
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p2}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->y:Ljava/lang/ref/WeakReference;

    invoke-virtual {p0}, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->M()V

    invoke-virtual {p2}, Landroid/view/View;->getImportantForAccessibility()I

    move-result v0

    if-nez v0, :cond_46

    invoke-virtual {p2, v1}, Landroid/view/View;->setImportantForAccessibility(I)V

    :cond_46
    iget-object v0, p0, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->r:Lx5n;

    if-nez v0, :cond_57

    new-instance v0, Lx5n;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v2

    iget-object v3, p0, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->M:Lkq3;

    invoke-direct {v0, v2, p1, v3}, Lx5n;-><init>(Landroid/content/Context;Landroid/view/ViewGroup;La4h;)V

    iput-object v0, p0, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->r:Lx5n;

    :cond_57
    invoke-virtual {p2}, Landroid/view/View;->getTop()I

    move-result v0

    invoke-virtual {p2}, Landroid/view/View;->getHeight()I

    move-result v2

    invoke-virtual {p1, p3, p2}, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->r(ILandroid/view/View;)V

    iget p3, p0, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->x:I

    invoke-virtual {p1}, Landroid/view/View;->getWidth()I

    move-result v3

    iput v3, p0, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->w:I

    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    move-result p1

    iput p1, p0, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->x:I

    invoke-virtual {p2}, Landroid/view/View;->getHeight()I

    move-result p1

    iput p1, p0, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->v:I

    iget v3, p0, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->x:I

    sub-int/2addr v3, p1

    const/4 p1, 0x0

    invoke-static {p1, v3}, Ljava/lang/Math;->max(II)I

    move-result v3

    iput v3, p0, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->l:I

    invoke-virtual {p0}, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->y()V

    iget v3, p0, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->q:I

    const/4 v4, 0x3

    if-ne v3, v4, :cond_90

    iget p3, p0, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->l:I

    sget-object v3, Lr5n;->a:Ljava/util/WeakHashMap;

    invoke-virtual {p2, p3}, Landroid/view/View;->offsetTopAndBottom(I)V

    goto :goto_d1

    :cond_90
    iget-boolean v4, p0, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->n:Z

    if-eqz v4, :cond_9f

    const/4 v4, 0x6

    if-ne v3, v4, :cond_9f

    iget p3, p0, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->x:I

    sget-object v3, Lr5n;->a:Ljava/util/WeakHashMap;

    invoke-virtual {p2, p3}, Landroid/view/View;->offsetTopAndBottom(I)V

    goto :goto_d1

    :cond_9f
    const/4 v4, 0x4

    if-ne v3, v4, :cond_aa

    iget p3, p0, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->m:I

    sget-object v3, Lr5n;->a:Ljava/util/WeakHashMap;

    invoke-virtual {p2, p3}, Landroid/view/View;->offsetTopAndBottom(I)V

    goto :goto_d1

    :cond_aa
    const/4 v4, 0x5

    if-ne v3, v4, :cond_c1

    iget v3, p0, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->x:I

    sub-int/2addr v3, p3

    invoke-virtual {p2}, Landroid/view/View;->getTop()I

    move-result p3

    sub-int p3, v0, p3

    add-int/2addr p3, v3

    invoke-static {p1, p3}, Ljava/lang/Math;->max(II)I

    move-result p3

    sget-object v3, Lr5n;->a:Ljava/util/WeakHashMap;

    invoke-virtual {p2, p3}, Landroid/view/View;->offsetTopAndBottom(I)V

    goto :goto_d1

    :cond_c1
    if-eq v3, v1, :cond_c6

    const/4 p3, 0x2

    if-ne v3, p3, :cond_d1

    :cond_c6
    invoke-virtual {p2}, Landroid/view/View;->getTop()I

    move-result p3

    sub-int p3, v0, p3

    sget-object v3, Lr5n;->a:Ljava/util/WeakHashMap;

    invoke-virtual {p2, p3}, Landroid/view/View;->offsetTopAndBottom(I)V

    :cond_d1
    :goto_d1
    invoke-virtual {p2}, Landroid/view/View;->getTop()I

    move-result p3

    if-eq p3, v0, :cond_de

    invoke-virtual {p2}, Landroid/view/View;->getTop()I

    move-result p3

    invoke-virtual {p0, p3}, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->A(I)V

    :cond_de
    invoke-virtual {p2}, Landroid/view/View;->getHeight()I

    move-result p3

    if-eq p3, v2, :cond_10c

    invoke-virtual {p2}, Landroid/view/View;->getHeight()I

    iget-object p3, p0, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->y:Ljava/lang/ref/WeakReference;

    invoke-virtual {p3}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Landroid/view/View;

    if-eqz p3, :cond_10c

    iget-object p3, p0, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->A:Ljava/util/ArrayList;

    invoke-virtual {p3}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_10c

    move v0, p1

    :goto_fa
    invoke-virtual {p3}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-ge v0, v2, :cond_10c

    invoke-virtual {p3, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lnjf;

    invoke-virtual {v2}, Lnjf;->b()V

    add-int/lit8 v0, v0, 0x1

    goto :goto_fa

    :cond_10c
    new-instance p3, Ljava/lang/ref/WeakReference;

    invoke-virtual {p0, p2}, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->B(Landroid/view/View;)Landroid/view/View;

    move-result-object p2

    invoke-direct {p3, p2}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object p3, p0, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->z:Ljava/lang/ref/WeakReference;

    iget-boolean p2, p0, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->L:Z

    if-eqz p2, :cond_130

    iput-boolean p1, p0, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->L:Z

    iget p1, p0, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->q:I

    iget-object p2, p0, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->y:Ljava/lang/ref/WeakReference;

    if-nez p2, :cond_125

    const/4 p2, 0x0

    goto :goto_12b

    :cond_125
    invoke-virtual {p2}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Landroid/view/View;

    :goto_12b
    if-eqz p2, :cond_130

    invoke-virtual {p0, p1, p2}, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->G(ILandroid/view/View;)V

    :cond_130
    return v1
.end method

.method public final n(F)V
    .registers 4

    iget v0, p0, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->q:I

    const/4 v1, 0x3

    if-ne v0, v1, :cond_11

    iget-object v0, p0, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->a:Lsv2;

    iget v0, v0, Lsv2;->c:I

    int-to-float v0, v0

    cmpg-float p1, p1, v0

    if-gez p1, :cond_11

    const/4 p1, 0x1

    iput-boolean p1, p0, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->I:Z

    :cond_11
    return-void
.end method

.method public final o(Landroid/view/View;F)Z
    .registers 6

    iget v0, p0, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->q:I

    const/4 v1, 0x1

    const/4 v2, 0x3

    if-eq v0, v2, :cond_13

    iget-object v0, p0, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->a:Lsv2;

    iget v0, v0, Lsv2;->a:I

    int-to-float v0, v0

    cmpl-float v0, p2, v0

    if-lez v0, :cond_13

    float-to-int p1, p2

    iput p1, p0, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->K:I

    return v1

    :cond_13
    iget-object p2, p0, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->z:Ljava/lang/ref/WeakReference;

    if-eqz p2, :cond_22

    invoke-virtual {p2}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object p2

    if-ne p1, p2, :cond_22

    iget p0, p0, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->q:I

    if-eq p0, v2, :cond_22

    return v1

    :cond_22
    const/4 p0, 0x0

    return p0
.end method

.method public final p(Landroidx/coordinatorlayout/widget/CoordinatorLayout;Landroid/view/View;Landroid/view/View;II[II)V
    .registers 9

    const/4 p1, 0x1

    if-eq p7, p1, :cond_5e

    iget-object p4, p0, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->z:Ljava/lang/ref/WeakReference;

    if-eqz p4, :cond_e

    invoke-virtual {p4}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object p4

    check-cast p4, Landroid/view/View;

    goto :goto_f

    :cond_e
    const/4 p4, 0x0

    :goto_f
    if-ne p3, p4, :cond_5e

    invoke-virtual {p2}, Landroid/view/View;->getTop()I

    move-result p4

    sub-int p7, p4, p5

    if-lez p5, :cond_3b

    iget p3, p0, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->l:I

    if-ge p7, p3, :cond_2b

    sub-int/2addr p4, p3

    aput p4, p6, p1

    neg-int p3, p4

    sget-object p4, Lr5n;->a:Ljava/util/WeakHashMap;

    invoke-virtual {p2, p3}, Landroid/view/View;->offsetTopAndBottom(I)V

    const/4 p3, 0x3

    invoke-virtual {p0, p3}, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->J(I)V

    goto :goto_6a

    :cond_2b
    iget-boolean p3, p0, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->p:Z

    if-eqz p3, :cond_5e

    aput p5, p6, p1

    neg-int p3, p5

    sget-object p4, Lr5n;->a:Ljava/util/WeakHashMap;

    invoke-virtual {p2, p3}, Landroid/view/View;->offsetTopAndBottom(I)V

    invoke-virtual {p0, p1}, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->J(I)V

    goto :goto_6a

    :cond_3b
    if-gez p5, :cond_6a

    const/4 v0, -0x1

    invoke-virtual {p3, v0}, Landroid/view/View;->canScrollVertically(I)Z

    move-result p3

    if-nez p3, :cond_6a

    iget p3, p0, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->m:I

    if-le p7, p3, :cond_5a

    iget-boolean p7, p0, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->n:Z

    if-nez p7, :cond_5a

    sub-int/2addr p4, p3

    aput p4, p6, p1

    neg-int p3, p4

    sget-object p4, Lr5n;->a:Ljava/util/WeakHashMap;

    invoke-virtual {p2, p3}, Landroid/view/View;->offsetTopAndBottom(I)V

    const/4 p3, 0x4

    invoke-virtual {p0, p3}, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->J(I)V

    goto :goto_6a

    :cond_5a
    iget-boolean p3, p0, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->p:Z

    if-nez p3, :cond_5f

    :cond_5e
    return-void

    :cond_5f
    aput p5, p6, p1

    neg-int p3, p5

    sget-object p4, Lr5n;->a:Ljava/util/WeakHashMap;

    invoke-virtual {p2, p3}, Landroid/view/View;->offsetTopAndBottom(I)V

    invoke-virtual {p0, p1}, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->J(I)V

    :cond_6a
    :goto_6a
    invoke-virtual {p2}, Landroid/view/View;->getTop()I

    move-result p2

    invoke-virtual {p0, p2}, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->A(I)V

    iput p5, p0, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->t:I

    iput-boolean p1, p0, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->u:Z

    return-void
.end method

.method public final q(Landroidx/coordinatorlayout/widget/CoordinatorLayout;Landroid/view/View;III[I)V
    .registers 7

    invoke-virtual {p2}, Landroid/view/View;->getScrollY()I

    move-result p1

    if-nez p1, :cond_10

    iget-boolean p1, p0, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->I:Z

    if-eqz p1, :cond_d

    const/4 p1, 0x1

    iput-boolean p1, p0, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->J:Z

    :cond_d
    const/4 p1, 0x0

    iput-boolean p1, p0, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->I:Z

    :cond_10
    return-void
.end method

.method public final s(Landroid/view/View;Landroid/os/Parcelable;)V
    .registers 7

    check-cast p2, Lkjf;

    const/4 p1, 0x4

    const/4 v0, 0x1

    iget v1, p0, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->b:I

    if-eqz v1, :cond_28

    const/4 v2, -0x1

    if-eq v1, v2, :cond_f

    and-int/lit8 v3, v1, 0x1

    if-ne v3, v0, :cond_13

    :cond_f
    iget v3, p2, Lkjf;->d:I

    iput v3, p0, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->e:I

    :cond_13
    if-eq v1, v2, :cond_19

    and-int/lit8 v3, v1, 0x4

    if-ne v3, p1, :cond_1d

    :cond_19
    iget-boolean v3, p2, Lkjf;->e:Z

    iput-boolean v3, p0, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->n:Z

    :cond_1d
    if-eq v1, v2, :cond_24

    const/16 v2, 0x8

    and-int/2addr v1, v2

    if-ne v1, v2, :cond_28

    :cond_24
    iget-boolean v1, p2, Lkjf;->f:Z

    iput-boolean v1, p0, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->o:Z

    :cond_28
    iget p2, p2, Lkjf;->c:I

    if-eq p2, v0, :cond_32

    const/4 v1, 0x2

    if-eq p2, v1, :cond_32

    iput p2, p0, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->q:I

    goto :goto_34

    :cond_32
    iput p1, p0, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->q:I

    :goto_34
    iget-object p1, p0, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->y:Ljava/lang/ref/WeakReference;

    if-nez p1, :cond_3a

    const/4 p1, 0x0

    goto :goto_40

    :cond_3a
    invoke-virtual {p1}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/view/View;

    :goto_40
    if-nez p1, :cond_45

    iput-boolean v0, p0, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->L:Z

    return-void

    :cond_45
    iget p2, p0, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->q:I

    invoke-virtual {p0, p2, p1}, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->G(ILandroid/view/View;)V

    return-void
.end method

.method public final t(Landroid/view/View;)Landroid/os/Parcelable;
    .registers 3

    new-instance p1, Lkjf;

    sget-object v0, Landroid/view/View$BaseSavedState;->EMPTY_STATE:Landroid/view/AbsSavedState;

    invoke-direct {p1, p0}, Lkjf;-><init>(Lcom/opera/android/sheet/OperaBottomSheetBehavior;)V

    return-object p1
.end method

.method public final u(Landroidx/coordinatorlayout/widget/CoordinatorLayout;Landroid/view/View;Landroid/view/View;II)Z
    .registers 6

    const/4 p1, 0x0

    iput p1, p0, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->t:I

    iput-boolean p1, p0, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->u:Z

    and-int/lit8 p4, p4, 0x2

    if-eqz p4, :cond_b

    const/4 p0, 0x1

    return p0

    :cond_b
    return p1
.end method

.method public final v(Landroidx/coordinatorlayout/widget/CoordinatorLayout;Landroid/view/View;Landroid/view/View;I)V
    .registers 13

    iget-boolean p4, p0, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->J:Z

    const/4 v0, 0x0

    if-eqz p4, :cond_1b

    iput-boolean v0, p0, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->J:Z

    iget-boolean p1, p0, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->o:Z

    if-eqz p1, :cond_12

    const/4 p1, 0x6

    iget p3, p0, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->x:I

    invoke-virtual {p0, p2, p1, p3}, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->L(Landroid/view/View;II)V

    goto :goto_18

    :cond_12
    const/4 p1, 0x4

    iget p3, p0, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->m:I

    invoke-virtual {p0, p2, p1, p3}, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->L(Landroid/view/View;II)V

    :goto_18
    iput-boolean v0, p0, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->u:Z

    return-void

    :cond_1b
    iget p4, p0, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->K:I

    if-lez p4, :cond_80

    iget-object p1, p0, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->G:Lljf;

    if-eqz p1, :cond_34

    iget-boolean p3, p1, Lljf;->e:Z

    if-nez p3, :cond_31

    const/4 p3, 0x1

    iput-boolean p3, p1, Lljf;->e:Z

    iput-boolean p3, p1, Lljf;->c:Z

    iget-object p1, p1, Lljf;->b:Landroid/widget/OverScroller;

    invoke-virtual {p1}, Landroid/widget/OverScroller;->abortAnimation()V

    :cond_31
    const/4 p1, 0x0

    iput-object p1, p0, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->G:Lljf;

    :cond_34
    new-instance p1, Lljf;

    check-cast p2, Landroidx/core/widget/NestedScrollView;

    invoke-direct {p1, p0, p2}, Lljf;-><init>(Lcom/opera/android/sheet/OperaBottomSheetBehavior;Landroidx/core/widget/NestedScrollView;)V

    iput-object p1, p0, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->G:Lljf;

    iget p3, p0, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->K:I

    iget-object p4, p0, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->a:Lsv2;

    iget p4, p4, Lsv2;->b:I

    invoke-static {p3, p4}, Ljava/lang/Math;->min(II)I

    move-result p3

    invoke-virtual {p2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object p4

    invoke-virtual {p4}, Landroid/view/View;->getHeight()I

    move-result p4

    invoke-virtual {p2}, Landroid/view/View;->getHeight()I

    move-result v1

    sub-int/2addr p4, v1

    invoke-virtual {p2}, Landroid/view/View;->getTop()I

    move-result v1

    neg-int v1, v1

    sub-int v6, v1, p4

    invoke-static {v6}, Ljava/lang/Math;->abs(I)I

    move-result p4

    int-to-float p4, p4

    int-to-float p3, p3

    div-float/2addr p4, p3

    const/high16 p3, 0x447a0000    # 1000.0f

    mul-float/2addr p4, p3

    float-to-int v7, p4

    invoke-virtual {p2}, Landroid/view/View;->getLeft()I

    move-result v3

    invoke-virtual {p2}, Landroid/view/View;->getTop()I

    move-result v4

    const/4 v5, 0x0

    iget-object v2, p1, Lljf;->b:Landroid/widget/OverScroller;

    invoke-virtual/range {v2 .. v7}, Landroid/widget/OverScroller;->startScroll(IIIII)V

    const/4 p3, 0x2

    invoke-virtual {p0, p3}, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->J(I)V

    invoke-virtual {p2, p1}, Landroid/view/View;->postOnAnimation(Ljava/lang/Runnable;)V

    iput v0, p0, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->K:I

    iput-boolean v0, p0, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->u:Z

    return-void

    :cond_80
    invoke-virtual {p2}, Landroid/view/View;->getTop()I

    move-result p4

    iget v1, p0, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->l:I

    if-ne p4, v1, :cond_8d

    const/4 p1, 0x3

    invoke-virtual {p0, p1}, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->J(I)V

    return-void

    :cond_8d
    iget-object p4, p0, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->z:Ljava/lang/ref/WeakReference;

    if-eqz p4, :cond_cc

    invoke-virtual {p4}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object p4

    if-ne p3, p4, :cond_cc

    iget-boolean p3, p0, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->u:Z

    if-eqz p3, :cond_cc

    instance-of p3, p1, Lcom/opera/android/sheet/VelocityTrackingCoordinatorLayout;

    const/16 p4, 0x3e8

    const/4 v1, 0x0

    if-eqz p3, :cond_b6

    check-cast p1, Lcom/opera/android/sheet/VelocityTrackingCoordinatorLayout;

    iget-object p3, p1, Lcom/opera/android/sheet/VelocityTrackingCoordinatorLayout;->z:Landroid/view/VelocityTracker;

    if-eqz p3, :cond_c7

    iget v1, p1, Lcom/opera/android/sheet/VelocityTrackingCoordinatorLayout;->y:F

    invoke-virtual {p3, p4, v1}, Landroid/view/VelocityTracker;->computeCurrentVelocity(IF)V

    iget-object p3, p1, Lcom/opera/android/sheet/VelocityTrackingCoordinatorLayout;->z:Landroid/view/VelocityTracker;

    iget p1, p1, Lcom/opera/android/sheet/VelocityTrackingCoordinatorLayout;->A:I

    invoke-virtual {p3, p1}, Landroid/view/VelocityTracker;->getYVelocity(I)F

    move-result v1

    goto :goto_c7

    :cond_b6
    iget-object p1, p0, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->C:Landroid/view/VelocityTracker;

    if-eqz p1, :cond_c7

    iget p3, p0, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->d:F

    invoke-virtual {p1, p4, p3}, Landroid/view/VelocityTracker;->computeCurrentVelocity(IF)V

    iget-object p1, p0, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->C:Landroid/view/VelocityTracker;

    iget p3, p0, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->D:I

    invoke-virtual {p1, p3}, Landroid/view/VelocityTracker;->getYVelocity(I)F

    move-result v1

    :cond_c7
    :goto_c7
    invoke-virtual {p0, p2, v1}, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->E(Landroid/view/View;F)V

    iput-boolean v0, p0, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->u:Z

    :cond_cc
    return-void
.end method

.method public final w(Landroidx/coordinatorlayout/widget/CoordinatorLayout;Landroid/view/View;Landroid/view/MotionEvent;)Z
    .registers 7

    invoke-virtual {p2}, Landroid/view/View;->isShown()Z

    move-result p1

    if-nez p1, :cond_8

    const/4 p0, 0x0

    return p0

    :cond_8
    invoke-virtual {p3}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result p1

    iget v0, p0, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->q:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_14

    if-nez p1, :cond_14

    return v1

    :cond_14
    iget-object v0, p0, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->r:Lx5n;

    if-eqz v0, :cond_1b

    invoke-virtual {v0, p3}, Lx5n;->i(Landroid/view/MotionEvent;)V

    :cond_1b
    if-nez p1, :cond_2a

    const/4 v0, -0x1

    iput v0, p0, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->D:I

    iget-object v0, p0, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->C:Landroid/view/VelocityTracker;

    if-eqz v0, :cond_2a

    invoke-virtual {v0}, Landroid/view/VelocityTracker;->recycle()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->C:Landroid/view/VelocityTracker;

    :cond_2a
    iget-object v0, p0, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->C:Landroid/view/VelocityTracker;

    if-nez v0, :cond_34

    invoke-static {}, Landroid/view/VelocityTracker;->obtain()Landroid/view/VelocityTracker;

    move-result-object v0

    iput-object v0, p0, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->C:Landroid/view/VelocityTracker;

    :cond_34
    invoke-virtual {v0, p3}, Landroid/view/VelocityTracker;->addMovement(Landroid/view/MotionEvent;)V

    iget-object v0, p0, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->r:Lx5n;

    if-eqz v0, :cond_62

    const/4 v0, 0x2

    if-ne p1, v0, :cond_62

    iget-boolean p1, p0, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->s:Z

    if-nez p1, :cond_62

    iget p1, p0, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->E:I

    int-to-float p1, p1

    invoke-virtual {p3}, Landroid/view/MotionEvent;->getY()F

    move-result v0

    sub-float/2addr p1, v0

    invoke-static {p1}, Ljava/lang/Math;->abs(F)F

    move-result p1

    iget-object v0, p0, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->r:Lx5n;

    iget v2, v0, Lx5n;->b:I

    int-to-float v2, v2

    cmpl-float p1, p1, v2

    if-lez p1, :cond_62

    invoke-virtual {p3}, Landroid/view/MotionEvent;->getActionIndex()I

    move-result p1

    invoke-virtual {p3, p1}, Landroid/view/MotionEvent;->getPointerId(I)I

    move-result p1

    invoke-virtual {v0, p1, p2}, Lx5n;->b(ILandroid/view/View;)V

    :cond_62
    iget-boolean p0, p0, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->s:Z

    xor-int/2addr p0, v1

    return p0
.end method

.method public final x(Lnjf;)V
    .registers 3

    iget-object p0, p0, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->A:Ljava/util/ArrayList;

    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_b

    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_b
    return-void
.end method

.method public final y()V
    .registers 4

    iget-boolean v0, p0, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->f:Z

    if-eqz v0, :cond_1a

    iget v0, p0, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->g:I

    iget v1, p0, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->x:I

    iget v2, p0, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->w:I

    mul-int/lit8 v2, v2, 0x9

    div-int/lit8 v2, v2, 0x10

    sub-int/2addr v1, v2

    invoke-static {v0, v1}, Ljava/lang/Math;->max(II)I

    move-result v0

    iget v1, p0, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->v:I

    invoke-static {v0, v1}, Ljava/lang/Math;->min(II)I

    move-result v0

    goto :goto_2e

    :cond_1a
    iget-boolean v0, p0, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->j:Z

    if-nez v0, :cond_2c

    iget v0, p0, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->i:I

    if-lez v0, :cond_2c

    iget v1, p0, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->e:I

    iget v2, p0, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->h:I

    add-int/2addr v0, v2

    invoke-static {v1, v0}, Ljava/lang/Math;->max(II)I

    move-result v0

    goto :goto_2e

    :cond_2c
    iget v0, p0, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->e:I

    :goto_2e
    iget v1, p0, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->x:I

    sub-int/2addr v1, v0

    iget v0, p0, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->l:I

    invoke-static {v1, v0}, Ljava/lang/Math;->max(II)I

    move-result v0

    iput v0, p0, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->m:I

    return-void
.end method

.method public final z(Landroid/view/View;F)I
    .registers 5

    invoke-virtual {p1}, Landroid/view/View;->getTop()I

    move-result p1

    invoke-static {p2}, Ljava/lang/Math;->abs(F)F

    move-result v0

    iget v1, p0, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->c:F

    cmpg-float v0, v0, v1

    if-gez v0, :cond_10

    const/4 p0, 0x0

    goto :goto_1d

    :cond_10
    iget-object p0, p0, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->a:Lsv2;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const p0, 0x3d99999a    # 0.075f

    mul-float/2addr p2, p0

    invoke-static {p2}, Ljava/lang/Math;->round(F)I

    move-result p0

    :goto_1d
    add-int/2addr p1, p0

    return p1
.end method

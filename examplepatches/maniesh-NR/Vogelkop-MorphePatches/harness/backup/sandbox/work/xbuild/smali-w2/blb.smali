.class public abstract Lblb;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lr8n;


# static fields
.field public static final c:Lalb;

.field public static final d:Lalb;


# instance fields
.field public a:I

.field public b:Ljava/lang/Float;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Lalb;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lalb;-><init>(B)V

    sput-object v0, Lblb;->c:Lalb;

    new-instance v0, Lalb;

    const/4 v1, 0x2

    invoke-direct {v0, v1}, Lalb;-><init>(B)V

    sput-object v0, Lblb;->d:Lalb;

    return-void
.end method

.method public constructor <init>()V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, -0x1

    iput v0, p0, Lblb;->a:I

    return-void
.end method

.method public static e(II)I
    .registers 5

    const v0, 0x303030

    and-int v1, p0, v0

    if-nez v1, :cond_8

    return p0

    :cond_8
    not-int v2, v1

    and-int/2addr p0, v2

    if-nez p1, :cond_10

    :goto_c
    shr-int/lit8 v1, v1, 0x2

    or-int/2addr p0, v1

    return p0

    :cond_10
    shr-int/lit8 v1, v1, 0x1

    const p1, -0x303031

    and-int/2addr p1, v1

    or-int/2addr p0, p1

    and-int/2addr v1, v0

    goto :goto_c
.end method

.method public static f(II)I
    .registers 5

    const v0, 0xc0c0c

    and-int v1, p0, v0

    if-nez v1, :cond_8

    return p0

    :cond_8
    not-int v2, v1

    and-int/2addr p0, v2

    if-nez p1, :cond_10

    :goto_c
    shl-int/lit8 v1, v1, 0x2

    or-int/2addr p0, v1

    return p0

    :cond_10
    shl-int/lit8 v1, v1, 0x1

    const p1, -0xc0c0d

    and-int/2addr p1, v1

    or-int/2addr p0, p1

    and-int/2addr v1, v0

    goto :goto_c
.end method


# virtual methods
.method public a(Landroid/view/View;)V
    .registers 2

    return-void
.end method

.method public b(Landroidx/recyclerview/widget/i;)Z
    .registers 2

    instance-of p0, p0, Lmv2;

    xor-int/lit8 p0, p0, 0x1

    return p0
.end method

.method public c(Landroidx/recyclerview/widget/i;Ljava/util/ArrayList;II)Landroidx/recyclerview/widget/i;
    .registers 16

    iget-object p0, p1, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    move-result p0

    add-int/2addr p0, p3

    iget-object v0, p1, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    move-result v0

    add-int/2addr v0, p4

    iget-object v1, p1, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getLeft()I

    move-result v1

    sub-int v1, p3, v1

    iget-object v2, p1, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {v2}, Landroid/view/View;->getTop()I

    move-result v2

    sub-int v2, p4, v2

    invoke-virtual {p2}, Ljava/util/ArrayList;->size()I

    move-result v3

    const/4 v4, 0x0

    const/4 v5, -0x1

    const/4 v6, 0x0

    :goto_25
    if-ge v6, v3, :cond_b5

    invoke-virtual {p2, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Landroidx/recyclerview/widget/i;

    if-lez v1, :cond_4e

    iget-object v8, v7, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {v8}, Landroid/view/View;->getRight()I

    move-result v8

    sub-int/2addr v8, p0

    if-gez v8, :cond_4e

    iget-object v9, v7, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {v9}, Landroid/view/View;->getRight()I

    move-result v9

    iget-object v10, p1, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {v10}, Landroid/view/View;->getRight()I

    move-result v10

    if-le v9, v10, :cond_4e

    invoke-static {v8}, Ljava/lang/Math;->abs(I)I

    move-result v8

    if-le v8, v5, :cond_4e

    move-object v4, v7

    move v5, v8

    :cond_4e
    if-gez v1, :cond_6f

    iget-object v8, v7, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {v8}, Landroid/view/View;->getLeft()I

    move-result v8

    sub-int/2addr v8, p3

    if-lez v8, :cond_6f

    iget-object v9, v7, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {v9}, Landroid/view/View;->getLeft()I

    move-result v9

    iget-object v10, p1, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {v10}, Landroid/view/View;->getLeft()I

    move-result v10

    if-ge v9, v10, :cond_6f

    invoke-static {v8}, Ljava/lang/Math;->abs(I)I

    move-result v8

    if-le v8, v5, :cond_6f

    move-object v4, v7

    move v5, v8

    :cond_6f
    if-gez v2, :cond_90

    iget-object v8, v7, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {v8}, Landroid/view/View;->getTop()I

    move-result v8

    sub-int/2addr v8, p4

    if-lez v8, :cond_90

    iget-object v9, v7, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {v9}, Landroid/view/View;->getTop()I

    move-result v9

    iget-object v10, p1, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {v10}, Landroid/view/View;->getTop()I

    move-result v10

    if-ge v9, v10, :cond_90

    invoke-static {v8}, Ljava/lang/Math;->abs(I)I

    move-result v8

    if-le v8, v5, :cond_90

    move-object v4, v7

    move v5, v8

    :cond_90
    if-lez v2, :cond_b1

    iget-object v8, v7, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {v8}, Landroid/view/View;->getBottom()I

    move-result v8

    sub-int/2addr v8, v0

    if-gez v8, :cond_b1

    iget-object v9, v7, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {v9}, Landroid/view/View;->getBottom()I

    move-result v9

    iget-object v10, p1, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {v10}, Landroid/view/View;->getBottom()I

    move-result v10

    if-le v9, v10, :cond_b1

    invoke-static {v8}, Ljava/lang/Math;->abs(I)I

    move-result v8

    if-le v8, v5, :cond_b1

    move-object v4, v7

    move v5, v8

    :cond_b1
    add-int/lit8 v6, v6, 0x1

    goto/16 :goto_25

    :cond_b5
    return-object v4
.end method

.method public d(Landroidx/recyclerview/widget/RecyclerView;Landroidx/recyclerview/widget/i;)V
    .registers 3

    iget-object p0, p2, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    sget p1, Landroidx/recyclerview/R$id;->item_touch_helper_previous_elevation:I

    invoke-virtual {p0, p1}, Landroid/view/View;->getTag(I)Ljava/lang/Object;

    move-result-object p1

    if-eqz p1, :cond_19

    instance-of p2, p1, Ljava/lang/Float;

    if-eqz p2, :cond_19

    check-cast p1, Ljava/lang/Float;

    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    move-result p1

    sget-object p2, Lr5n;->a:Ljava/util/WeakHashMap;

    invoke-virtual {p0, p1}, Landroid/view/View;->setElevation(F)V

    :cond_19
    sget p1, Landroidx/recyclerview/R$id;->item_touch_helper_previous_elevation:I

    const/4 p2, 0x0

    invoke-virtual {p0, p1, p2}, Landroid/view/View;->setTag(ILjava/lang/Object;)V

    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Landroid/view/View;->setTranslationX(F)V

    invoke-virtual {p0, p1}, Landroid/view/View;->setTranslationY(F)V

    return-void
.end method

.method public g()I
    .registers 1

    const/4 p0, 0x0

    return p0
.end method

.method public h(Landroidx/recyclerview/widget/RecyclerView;Landroidx/recyclerview/widget/i;)I
    .registers 3

    instance-of p0, p2, Lth7;

    if-eqz p0, :cond_7

    const/16 p0, 0xf

    goto :goto_8

    :cond_7
    const/4 p0, 0x0

    :goto_8
    shl-int/lit8 p1, p0, 0x10

    or-int/2addr p0, p1

    return p0
.end method

.method public i(Landroidx/recyclerview/widget/i;)F
    .registers 2

    const p0, 0x3e4ccccd    # 0.2f

    return p0
.end method

.method public j(Landroidx/recyclerview/widget/i;)F
    .registers 2

    const/high16 p0, 0x3f000000    # 0.5f

    return p0
.end method

.method public final k(Landroid/content/res/Resources;IIJ)I
    .registers 9

    iget v0, p0, Lblb;->a:I

    const/4 v1, -0x1

    if-ne v0, v1, :cond_d

    sget v0, Landroidx/recyclerview/R$dimen;->item_touch_helper_max_drag_scroll_per_frame:I

    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    iput v0, p0, Lblb;->a:I

    :cond_d
    invoke-static {p3}, Ljava/lang/Math;->abs(I)I

    move-result p0

    int-to-float p1, p3

    invoke-static {p1}, Ljava/lang/Math;->signum(F)F

    move-result p1

    float-to-int p1, p1

    int-to-float p0, p0

    const/high16 v2, 0x3f800000    # 1.0f

    mul-float/2addr p0, v2

    int-to-float p2, p2

    div-float/2addr p0, p2

    invoke-static {v2, p0}, Ljava/lang/Math;->min(FF)F

    move-result p0

    mul-int/2addr p1, v0

    int-to-float p1, p1

    sget-object p2, Lblb;->d:Lalb;

    invoke-virtual {p2, p0}, Lalb;->getInterpolation(F)F

    move-result p0

    mul-float/2addr p0, p1

    float-to-int p0, p0

    const-wide/16 p1, 0x7d0

    cmp-long p1, p4, p1

    if-gtz p1, :cond_36

    long-to-float p1, p4

    const/high16 p2, 0x44fa0000    # 2000.0f

    div-float v2, p1, p2

    :cond_36
    int-to-float p0, p0

    sget-object p1, Lblb;->c:Lalb;

    invoke-virtual {p1, v2}, Lalb;->getInterpolation(F)F

    move-result p1

    mul-float/2addr p1, p0

    float-to-int p0, p1

    if-nez p0, :cond_46

    if-lez p3, :cond_45

    const/4 p0, 0x1

    return p0

    :cond_45
    return v1

    :cond_46
    return p0
.end method

.method public l()Z
    .registers 1

    const/4 p0, 0x1

    return p0
.end method

.method public m()Z
    .registers 1

    const/4 p0, 0x1

    return p0
.end method

.method public n(I)Z
    .registers 2

    const/4 p0, 0x0

    return p0
.end method

.method public o(Landroid/graphics/Canvas;Landroidx/recyclerview/widget/RecyclerView;Landroidx/recyclerview/widget/i;FFIZ)V
    .registers 10

    iget-object p0, p3, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    if-eqz p7, :cond_3d

    sget p1, Landroidx/recyclerview/R$id;->item_touch_helper_previous_elevation:I

    invoke-virtual {p0, p1}, Landroid/view/View;->getTag(I)Ljava/lang/Object;

    move-result-object p1

    if-nez p1, :cond_3d

    sget-object p1, Lr5n;->a:Ljava/util/WeakHashMap;

    invoke-virtual {p0}, Landroid/view/View;->getElevation()F

    move-result p1

    invoke-static {p1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object p1

    invoke-virtual {p2}, Landroid/view/ViewGroup;->getChildCount()I

    move-result p3

    const/4 p6, 0x0

    const/4 p7, 0x0

    :goto_1c
    if-ge p7, p3, :cond_32

    invoke-virtual {p2, p7}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    if-eq v0, p0, :cond_2f

    sget-object v1, Lr5n;->a:Ljava/util/WeakHashMap;

    invoke-virtual {v0}, Landroid/view/View;->getElevation()F

    move-result v0

    cmpl-float v1, v0, p6

    if-lez v1, :cond_2f

    move p6, v0

    :cond_2f
    add-int/lit8 p7, p7, 0x1

    goto :goto_1c

    :cond_32
    const/high16 p2, 0x3f800000    # 1.0f

    add-float/2addr p6, p2

    invoke-virtual {p0, p6}, Landroid/view/View;->setElevation(F)V

    sget p2, Landroidx/recyclerview/R$id;->item_touch_helper_previous_elevation:I

    invoke-virtual {p0, p2, p1}, Landroid/view/View;->setTag(ILjava/lang/Object;)V

    :cond_3d
    invoke-virtual {p0, p4}, Landroid/view/View;->setTranslationX(F)V

    invoke-virtual {p0, p5}, Landroid/view/View;->setTranslationY(F)V

    return-void
.end method

.method public p(Landroid/graphics/Canvas;Landroidx/recyclerview/widget/RecyclerView;Landroidx/recyclerview/widget/i;FFIZ)V
    .registers 8

    iget-object p0, p3, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    return-void
.end method

.method public q(Landroidx/recyclerview/widget/RecyclerView;)V
    .registers 2

    return-void
.end method

.method public r(Landroidx/recyclerview/widget/RecyclerView;Landroidx/recyclerview/widget/i;Landroidx/recyclerview/widget/i;)Z
    .registers 4

    const/4 p0, 0x0

    return p0
.end method

.method public s(Landroidx/recyclerview/widget/RecyclerView;Landroidx/recyclerview/widget/i;I)V
    .registers 7

    iget-object p0, p1, Landroidx/recyclerview/widget/RecyclerView;->n:Landroidx/recyclerview/widget/f;

    invoke-virtual {p0}, Landroidx/recyclerview/widget/f;->canScrollHorizontally()Z

    move-result v0

    if-eqz v0, :cond_2b

    iget-object v0, p2, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {p0, v0}, Landroidx/recyclerview/widget/f;->getDecoratedLeft(Landroid/view/View;)I

    move-result v0

    invoke-virtual {p1}, Landroid/view/View;->getPaddingLeft()I

    move-result v1

    if-gt v0, v1, :cond_17

    invoke-virtual {p1, p3}, Landroidx/recyclerview/widget/RecyclerView;->x0(I)V

    :cond_17
    iget-object v0, p2, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {p0, v0}, Landroidx/recyclerview/widget/f;->getDecoratedRight(Landroid/view/View;)I

    move-result v0

    invoke-virtual {p1}, Landroid/view/View;->getWidth()I

    move-result v1

    invoke-virtual {p1}, Landroid/view/View;->getPaddingRight()I

    move-result v2

    sub-int/2addr v1, v2

    if-lt v0, v1, :cond_2b

    invoke-virtual {p1, p3}, Landroidx/recyclerview/widget/RecyclerView;->x0(I)V

    :cond_2b
    invoke-virtual {p0}, Landroidx/recyclerview/widget/f;->canScrollVertically()Z

    move-result v0

    if-eqz v0, :cond_54

    iget-object v0, p2, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {p0, v0}, Landroidx/recyclerview/widget/f;->getDecoratedTop(Landroid/view/View;)I

    move-result v0

    invoke-virtual {p1}, Landroid/view/View;->getPaddingTop()I

    move-result v1

    if-gt v0, v1, :cond_40

    invoke-virtual {p1, p3}, Landroidx/recyclerview/widget/RecyclerView;->x0(I)V

    :cond_40
    iget-object p2, p2, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {p0, p2}, Landroidx/recyclerview/widget/f;->getDecoratedBottom(Landroid/view/View;)I

    move-result p0

    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    move-result p2

    invoke-virtual {p1}, Landroid/view/View;->getPaddingBottom()I

    move-result v0

    sub-int/2addr p2, v0

    if-lt p0, p2, :cond_54

    invoke-virtual {p1, p3}, Landroidx/recyclerview/widget/RecyclerView;->x0(I)V

    :cond_54
    return-void
.end method

.method public abstract t(Landroidx/recyclerview/widget/i;I)V
.end method

.method public u(Landroidx/recyclerview/widget/i;I)V
    .registers 3

    return-void
.end method

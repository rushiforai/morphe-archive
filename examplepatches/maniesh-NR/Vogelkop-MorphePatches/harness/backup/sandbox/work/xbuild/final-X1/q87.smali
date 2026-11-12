.class public final Lq87;
.super Liph;
.source "SourceFile"


# instance fields
.field public final synthetic a:B

.field public final b:Landroid/content/Context;

.field public final c:I

.field public d:Landroid/graphics/drawable/Drawable;

.field public final e:Ljava/lang/Object;

.field public f:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 5

    const/4 v0, 0x0

    iput-byte v0, p0, Lq87;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lq87;->b:Landroid/content/Context;

    const/high16 v1, 0x41800000    # 16.0f

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-static {v1, v2}, Lfan;->a(FLandroid/content/res/Resources;)I

    move-result v1

    iput v1, p0, Lq87;->c:I

    new-instance v1, Ljava/util/HashSet;

    invoke-direct {v1}, Ljava/util/HashSet;-><init>()V

    iput-object v1, p0, Lq87;->e:Ljava/lang/Object;

    new-instance v1, Ljava/util/HashSet;

    invoke-direct {v1}, Ljava/util/HashSet;-><init>()V

    iput-object v1, p0, Lq87;->f:Ljava/lang/Object;

    const v1, 0x1010214

    filled-new-array {v1}, [I

    move-result-object v1

    invoke-virtual {p1, v1}, Landroid/content/Context;->obtainStyledAttributes([I)Landroid/content/res/TypedArray;

    move-result-object v1

    invoke-virtual {v1, v0, v0}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v0

    if-nez v0, :cond_35

    const/4 p1, 0x0

    goto :goto_39

    :cond_35
    invoke-static {v0, p1}, Lsgb;->F(ILandroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object p1

    :goto_39
    iput-object p1, p0, Lq87;->d:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v1}, Landroid/content/res/TypedArray;->recycle()V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;ILll7;)V
    .registers 5

    const/4 v0, 0x1

    iput-byte v0, p0, Lq87;->a:B

    .line 63
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 64
    iput-object p1, p0, Lq87;->b:Landroid/content/Context;

    .line 65
    iput p2, p0, Lq87;->c:I

    .line 66
    iput-object p3, p0, Lq87;->e:Ljava/lang/Object;

    .line 67
    invoke-static {p2, p1}, Lsgb;->F(ILandroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object p2

    .line 68
    iput-object p2, p0, Lq87;->d:Landroid/graphics/drawable/Drawable;

    const p2, 0x7f080a25

    .line 69
    invoke-static {p2, p1}, Lsgb;->F(ILandroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object p1

    .line 70
    iput-object p1, p0, Lq87;->f:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final getItemOffsets(Landroid/graphics/Rect;Landroid/view/View;Landroidx/recyclerview/widget/RecyclerView;Lvph;)V
    .registers 11

    iget-byte v0, p0, Lq87;->a:B

    packed-switch v0, :pswitch_data_b4

    invoke-super {p0, p1, p2, p3, p4}, Liph;->getItemOffsets(Landroid/graphics/Rect;Landroid/view/View;Landroidx/recyclerview/widget/RecyclerView;Lvph;)V

    return-void

    :pswitch_9
    iget-object p4, p0, Lq87;->f:Ljava/lang/Object;

    check-cast p4, Ljava/util/HashSet;

    iget-object v0, p0, Lq87;->e:Ljava/lang/Object;

    check-cast v0, Ljava/util/HashSet;

    invoke-virtual {p1}, Landroid/graphics/Rect;->setEmpty()V

    iget-object v1, p0, Lq87;->d:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p3, p2}, Landroidx/recyclerview/widget/RecyclerView;->T(Landroid/view/View;)Landroidx/recyclerview/widget/i;

    move-result-object v2

    iget-object v3, p3, Landroidx/recyclerview/widget/RecyclerView;->m:Landroidx/recyclerview/widget/d;

    if-eqz v1, :cond_b2

    if-eqz v2, :cond_b2

    if-eqz v3, :cond_b2

    invoke-virtual {v2}, Landroidx/recyclerview/widget/i;->getBindingAdapterPosition()I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v0, v5}, Ljava/util/HashSet;->remove(Ljava/lang/Object;)Z

    if-lez v4, :cond_b2

    iget-object v5, p3, Landroidx/recyclerview/widget/RecyclerView;->n:Landroidx/recyclerview/widget/f;

    invoke-virtual {p3, p2}, Landroidx/recyclerview/widget/RecyclerView;->T(Landroid/view/View;)Landroidx/recyclerview/widget/i;

    move-result-object p2

    instance-of p3, p2, Lp87;

    if-eqz p3, :cond_3c

    check-cast p2, Lp87;

    goto :goto_3d

    :cond_3c
    const/4 p2, 0x0

    :goto_3d
    if-eqz p2, :cond_b2

    invoke-virtual {v2}, Landroidx/recyclerview/widget/i;->getItemViewType()I

    move-result p2

    add-int/lit8 p3, v4, -0x1

    invoke-virtual {v3, p3}, Landroidx/recyclerview/widget/d;->getItemViewType(I)I

    move-result v2

    iget p0, p0, Lq87;->c:I

    if-ne p2, v2, :cond_7d

    instance-of p2, v5, Landroidx/recyclerview/widget/GridLayoutManager;

    if-eqz p2, :cond_b2

    check-cast v5, Landroidx/recyclerview/widget/GridLayoutManager;

    iget-object p2, v5, Landroidx/recyclerview/widget/GridLayoutManager;->g:Ltx7;

    iget v0, v5, Landroidx/recyclerview/widget/GridLayoutManager;->b:I

    invoke-virtual {p2, v4, v0}, Ltx7;->d(II)I

    move-result v0

    iget v2, v5, Landroidx/recyclerview/widget/GridLayoutManager;->b:I

    invoke-virtual {p2, p3, v2}, Ltx7;->d(II)I

    move-result p2

    if-ne v0, p2, :cond_75

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    invoke-virtual {p4, p2}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_b2

    invoke-virtual {v1}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result p2

    add-int/2addr p2, p0

    iput p2, p1, Landroid/graphics/Rect;->top:I

    goto :goto_b2

    :cond_75
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    invoke-virtual {p4, p0}, Ljava/util/HashSet;->remove(Ljava/lang/Object;)Z

    goto :goto_b2

    :cond_7d
    instance-of p2, v5, Landroidx/recyclerview/widget/GridLayoutManager;

    if-eqz p2, :cond_a4

    check-cast v5, Landroidx/recyclerview/widget/GridLayoutManager;

    iget-object p2, v5, Landroidx/recyclerview/widget/GridLayoutManager;->g:Ltx7;

    iget p3, v5, Landroidx/recyclerview/widget/GridLayoutManager;->b:I

    invoke-virtual {p2, v4, p3}, Ltx7;->d(II)I

    move-result p2

    iget-object p3, v5, Landroidx/recyclerview/widget/GridLayoutManager;->g:Ltx7;

    iget v2, v5, Landroidx/recyclerview/widget/GridLayoutManager;->b:I

    invoke-virtual {p3, v4, v2}, Ltx7;->e(II)I

    move-result p3

    if-nez p3, :cond_9c

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p3

    invoke-virtual {v0, p3}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    :cond_9c
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    invoke-virtual {p4, p2}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    goto :goto_ab

    :cond_a4
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    invoke-virtual {v0, p2}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    :goto_ab
    invoke-virtual {v1}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result p2

    add-int/2addr p2, p0

    iput p2, p1, Landroid/graphics/Rect;->top:I

    :cond_b2
    :goto_b2
    return-void

    nop

    :pswitch_data_b4
    .packed-switch 0x0
        :pswitch_9
    .end packed-switch
.end method

.method public final onDraw(Landroid/graphics/Canvas;Landroidx/recyclerview/widget/RecyclerView;Lvph;)V
    .registers 11

    iget-byte v0, p0, Lq87;->a:B

    packed-switch v0, :pswitch_data_88

    invoke-super {p0, p1, p2, p3}, Liph;->onDraw(Landroid/graphics/Canvas;Landroidx/recyclerview/widget/RecyclerView;Lvph;)V

    return-void

    :pswitch_9
    iget-object p3, p2, Landroidx/recyclerview/widget/RecyclerView;->n:Landroidx/recyclerview/widget/f;

    if-eqz p3, :cond_87

    iget-object p3, p0, Lq87;->d:Landroid/graphics/drawable/Drawable;

    if-eqz p3, :cond_87

    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    iget-boolean v0, p2, Landroidx/recyclerview/widget/RecyclerView;->h:Z

    const/4 v1, 0x0

    if-eqz v0, :cond_37

    invoke-virtual {p2}, Landroid/view/View;->getPaddingLeft()I

    move-result v0

    invoke-virtual {p2}, Landroid/view/View;->getWidth()I

    move-result v2

    invoke-virtual {p2}, Landroid/view/View;->getPaddingRight()I

    move-result v3

    sub-int/2addr v2, v3

    invoke-virtual {p2}, Landroid/view/View;->getPaddingTop()I

    move-result v3

    invoke-virtual {p2}, Landroid/view/View;->getHeight()I

    move-result v4

    invoke-virtual {p2}, Landroid/view/View;->getPaddingBottom()I

    move-result v5

    sub-int/2addr v4, v5

    invoke-virtual {p1, v0, v3, v2, v4}, Landroid/graphics/Canvas;->clipRect(IIII)Z

    goto :goto_3c

    :cond_37
    invoke-virtual {p2}, Landroid/view/View;->getWidth()I

    move-result v2

    move v0, v1

    :goto_3c
    invoke-virtual {p2}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v3

    :goto_40
    if-ge v1, v3, :cond_84

    invoke-virtual {p2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v4

    invoke-virtual {p2, v4}, Landroidx/recyclerview/widget/RecyclerView;->T(Landroid/view/View;)Landroidx/recyclerview/widget/i;

    move-result-object v5

    if-eqz v5, :cond_81

    iget-object v6, p0, Lq87;->e:Ljava/lang/Object;

    check-cast v6, Ljava/util/HashSet;

    invoke-virtual {v5}, Landroidx/recyclerview/widget/i;->getBindingAdapterPosition()I

    move-result v5

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v6, v5}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_81

    new-instance v5, Landroid/graphics/Rect;

    invoke-direct {v5}, Landroid/graphics/Rect;-><init>()V

    invoke-static {v5, v4}, Landroidx/recyclerview/widget/RecyclerView;->V(Landroid/graphics/Rect;Landroid/view/View;)V

    iget v5, v5, Landroid/graphics/Rect;->top:I

    invoke-virtual {v4}, Landroid/view/View;->getTranslationY()F

    move-result v4

    invoke-static {v4}, Lzed;->b(F)I

    move-result v4

    add-int/2addr v4, v5

    iget v5, p0, Lq87;->c:I

    div-int/lit8 v5, v5, 0x2

    add-int/2addr v5, v4

    invoke-virtual {p3}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v4

    add-int/2addr v4, v5

    invoke-virtual {p3, v0, v5, v2, v4}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    invoke-virtual {p3, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    :cond_81
    add-int/lit8 v1, v1, 0x1

    goto :goto_40

    :cond_84
    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    :cond_87
    return-void

    :pswitch_data_88
    .packed-switch 0x0
        :pswitch_9
    .end packed-switch
.end method

.method public final onDrawOver(Landroid/graphics/Canvas;Landroidx/recyclerview/widget/RecyclerView;Lvph;)V
    .registers 10

    iget-byte v0, p0, Lq87;->a:B

    packed-switch v0, :pswitch_data_68

    invoke-super {p0, p1, p2, p3}, Liph;->onDrawOver(Landroid/graphics/Canvas;Landroidx/recyclerview/widget/RecyclerView;Lvph;)V

    return-void

    :pswitch_9
    iget-object v0, p0, Lq87;->e:Ljava/lang/Object;

    check-cast v0, Lll7;

    invoke-super {p0, p1, p2, p3}, Liph;->onDrawOver(Landroid/graphics/Canvas;Landroidx/recyclerview/widget/RecyclerView;Lvph;)V

    const/4 p3, 0x0

    :goto_11
    invoke-virtual {p2}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v1

    if-ge p3, v1, :cond_66

    invoke-virtual {p2, p3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    invoke-virtual {p2, v1}, Landroidx/recyclerview/widget/RecyclerView;->T(Landroid/view/View;)Landroidx/recyclerview/widget/i;

    move-result-object v1

    if-eqz v1, :cond_63

    invoke-virtual {v1}, Landroidx/recyclerview/widget/i;->getBindingAdapterPosition()I

    move-result v2

    const/4 v3, -0x1

    if-eq v2, v3, :cond_63

    invoke-interface {v0, v2}, Lll7;->b(I)Z

    move-result v3

    if-eqz v3, :cond_63

    iget-object v3, v1, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {v3}, Landroid/view/View;->getX()F

    move-result v3

    invoke-static {v3}, Ljava/lang/Math;->round(F)I

    move-result v3

    iget-object v4, v1, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {v4}, Landroid/view/View;->getY()F

    move-result v4

    invoke-static {v4}, Ljava/lang/Math;->round(F)I

    move-result v4

    invoke-interface {v0, v2}, Lll7;->l(I)Z

    move-result v2

    if-eqz v2, :cond_4d

    iget-object v2, p0, Lq87;->f:Ljava/lang/Object;

    check-cast v2, Landroid/graphics/drawable/Drawable;

    goto :goto_4f

    :cond_4d
    iget-object v2, p0, Lq87;->d:Landroid/graphics/drawable/Drawable;

    :goto_4f
    iget-object v5, v1, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {v5}, Landroid/view/View;->getWidth()I

    move-result v5

    add-int/2addr v5, v3

    iget-object v1, v1, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getHeight()I

    move-result v1

    add-int/2addr v1, v4

    invoke-virtual {v2, v3, v4, v5, v1}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    invoke-virtual {v2, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    :cond_63
    add-int/lit8 p3, p3, 0x1

    goto :goto_11

    :cond_66
    return-void

    nop

    :pswitch_data_68
    .packed-switch 0x1
        :pswitch_9
    .end packed-switch
.end method

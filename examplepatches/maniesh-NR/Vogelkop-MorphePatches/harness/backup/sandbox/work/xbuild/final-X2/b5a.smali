.class public final Lb5a;
.super Liph;
.source "SourceFile"


# instance fields
.field public final a:Landroidx/recyclerview/widget/RecyclerView;

.field public final b:Z

.field public final c:La5a;

.field public final d:I

.field public final e:Z

.field public final f:I

.field public final g:I

.field public final h:I

.field public final i:I

.field public final j:I

.field public final k:Ljava/util/WeakHashMap;

.field public l:I


# direct methods
.method public constructor <init>(Landroidx/recyclerview/widget/RecyclerView;ZLa5a;IZ)V
    .registers 6

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lb5a;->a:Landroidx/recyclerview/widget/RecyclerView;

    iput-boolean p2, p0, Lb5a;->b:Z

    iput-object p3, p0, Lb5a;->c:La5a;

    iput p4, p0, Lb5a;->d:I

    iput-boolean p5, p0, Lb5a;->e:Z

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p2

    invoke-virtual {p2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p2

    const/high16 p3, 0x40000000    # 2.0f

    invoke-static {p3, p2}, Lfan;->a(FLandroid/content/res/Resources;)I

    move-result p2

    iput p2, p0, Lb5a;->f:I

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p2

    invoke-virtual {p2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p2

    const/high16 p3, 0x41400000    # 12.0f

    invoke-static {p3, p2}, Lfan;->a(FLandroid/content/res/Resources;)I

    move-result p2

    iput p2, p0, Lb5a;->g:I

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p2

    invoke-virtual {p2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p2

    const/high16 p3, 0x41000000    # 8.0f

    invoke-static {p3, p2}, Lfan;->a(FLandroid/content/res/Resources;)I

    move-result p2

    iput p2, p0, Lb5a;->h:I

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p2

    invoke-virtual {p2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p2

    const/high16 p3, 0x41800000    # 16.0f

    invoke-static {p3, p2}, Lfan;->a(FLandroid/content/res/Resources;)I

    move-result p2

    iput p2, p0, Lb5a;->i:I

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p2

    invoke-virtual {p2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p2

    const/high16 p3, 0x40800000    # 4.0f

    invoke-static {p3, p2}, Lfan;->a(FLandroid/content/res/Resources;)I

    move-result p2

    iput p2, p0, Lb5a;->j:I

    new-instance p2, Ljava/util/WeakHashMap;

    invoke-direct {p2}, Ljava/util/WeakHashMap;-><init>()V

    iput-object p2, p0, Lb5a;->k:Ljava/util/WeakHashMap;

    new-instance p2, Lpc5;

    const/16 p3, 0x17

    invoke-direct {p2, p0, p3}, Lpc5;-><init>(Ljava/lang/Object;B)V

    invoke-static {p1, p2}, Lq9n;->e(Landroid/view/View;Lr8n;)V

    invoke-virtual {p2, p1}, Lpc5;->a(Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public final getItemOffsets(Landroid/graphics/Rect;Landroid/view/View;Landroidx/recyclerview/widget/RecyclerView;Lvph;)V
    .registers 7

    invoke-virtual {p1}, Landroid/graphics/Rect;->setEmpty()V

    invoke-static {p2}, Landroidx/recyclerview/widget/RecyclerView;->S(Landroid/view/View;)I

    move-result p2

    iget p3, p0, Lb5a;->j:I

    iget-boolean p4, p0, Lb5a;->b:Z

    if-eqz p4, :cond_21

    iget-object v0, p0, Lb5a;->a:Landroidx/recyclerview/widget/RecyclerView;

    iget-object v0, v0, Landroidx/recyclerview/widget/RecyclerView;->m:Landroidx/recyclerview/widget/d;

    if-eqz v0, :cond_21

    add-int/lit8 v1, p2, 0x1

    invoke-virtual {v0}, Landroidx/recyclerview/widget/d;->getItemCount()I

    move-result v0

    if-ne v1, v0, :cond_21

    iget p4, p1, Landroid/graphics/Rect;->bottom:I

    sub-int/2addr p4, p3

    iput p4, p1, Landroid/graphics/Rect;->bottom:I

    goto :goto_2a

    :cond_21
    if-nez p4, :cond_2a

    if-nez p2, :cond_2a

    iget p4, p1, Landroid/graphics/Rect;->top:I

    sub-int/2addr p4, p3

    iput p4, p1, Landroid/graphics/Rect;->top:I

    :cond_2a
    :goto_2a
    iget-object p3, p0, Lb5a;->c:La5a;

    invoke-interface {p3, p2}, La5a;->Q(I)Z

    move-result p4

    if-nez p4, :cond_33

    return-void

    :cond_33
    invoke-interface {p3, p2}, La5a;->q(I)Lz4a;

    move-result-object p2

    iget-boolean p3, p0, Lb5a;->e:Z

    if-eqz p3, :cond_47

    iget p3, p1, Landroid/graphics/Rect;->left:I

    iget p4, p0, Lb5a;->g:I

    add-int/2addr p3, p4

    iput p3, p1, Landroid/graphics/Rect;->left:I

    iget p3, p1, Landroid/graphics/Rect;->right:I

    add-int/2addr p3, p4

    iput p3, p1, Landroid/graphics/Rect;->right:I

    :cond_47
    invoke-virtual {p2}, Ljava/lang/Enum;->ordinal()I

    move-result p2

    iget p3, p0, Lb5a;->h:I

    if-eqz p2, :cond_7a

    iget p0, p0, Lb5a;->f:I

    const/4 p4, 0x1

    if-eq p2, p4, :cond_6f

    const/4 p4, 0x2

    if-eq p2, p4, :cond_69

    const/4 p0, 0x3

    if-ne p2, p0, :cond_65

    iget p0, p1, Landroid/graphics/Rect;->top:I

    add-int/2addr p0, p3

    iput p0, p1, Landroid/graphics/Rect;->top:I

    iget p0, p1, Landroid/graphics/Rect;->bottom:I

    add-int/2addr p0, p3

    iput p0, p1, Landroid/graphics/Rect;->bottom:I

    return-void

    :cond_65
    invoke-static {}, Lh9o;->p()V

    return-void

    :cond_69
    iget p2, p1, Landroid/graphics/Rect;->top:I

    add-int/2addr p2, p0

    iput p2, p1, Landroid/graphics/Rect;->top:I

    return-void

    :cond_6f
    iget p2, p1, Landroid/graphics/Rect;->top:I

    add-int/2addr p2, p0

    iput p2, p1, Landroid/graphics/Rect;->top:I

    iget p0, p1, Landroid/graphics/Rect;->bottom:I

    add-int/2addr p0, p3

    iput p0, p1, Landroid/graphics/Rect;->bottom:I

    return-void

    :cond_7a
    iget p0, p1, Landroid/graphics/Rect;->top:I

    add-int/2addr p0, p3

    iput p0, p1, Landroid/graphics/Rect;->top:I

    return-void
.end method

.method public final onDraw(Landroid/graphics/Canvas;Landroidx/recyclerview/widget/RecyclerView;Lvph;)V
    .registers 11

    invoke-virtual {p2}, Landroid/view/ViewGroup;->getChildCount()I

    move-result p1

    const/4 p3, 0x0

    :goto_5
    if-ge p3, p1, :cond_c6

    invoke-virtual {p2, p3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    iget-object v1, p0, Lb5a;->a:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v1, v0}, Landroidx/recyclerview/widget/RecyclerView;->T(Landroid/view/View;)Landroidx/recyclerview/widget/i;

    move-result-object v0

    if-eqz v0, :cond_c2

    invoke-virtual {v0}, Landroidx/recyclerview/widget/i;->getBindingAdapterPosition()I

    move-result v1

    const/4 v2, -0x1

    if-eq v1, v2, :cond_c2

    iget-object v2, p0, Lb5a;->c:La5a;

    invoke-interface {v2, v1}, La5a;->Q(I)Z

    move-result v3

    if-eqz v3, :cond_c2

    invoke-interface {v2, v1}, La5a;->q(I)Lz4a;

    move-result-object v1

    iget-object v2, p0, Lb5a;->k:Ljava/util/WeakHashMap;

    invoke-virtual {v2, v0}, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lz4a;

    if-eq v3, v1, :cond_c2

    invoke-virtual {v2, v0, v1}, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v2, v0, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {v2}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v2

    const v3, 0x7f0406a7

    const v4, 0x7f060f8d

    invoke-static {v3, v2, v4}, Lf03;->u(ILandroid/content/Context;I)Landroid/content/res/ColorStateList;

    move-result-object v2

    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    move-result v1

    const/4 v3, 0x0

    iget v4, p0, Lb5a;->i:I

    if-eqz v1, :cond_a6

    const/4 v5, 0x1

    if-eq v1, v5, :cond_89

    const/4 v3, 0x2

    if-eq v1, v3, :cond_76

    const/4 v3, 0x3

    if-ne v1, v3, :cond_72

    iget-object v0, v0, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    iget v1, p0, Lb5a;->l:I

    int-to-float v3, v4

    invoke-static {v3, v3, v3, v3}, Lui6;->q(FFFF)Landroid/graphics/drawable/ShapeDrawable;

    move-result-object v4

    invoke-virtual {v4}, Landroid/graphics/drawable/ShapeDrawable;->getPaint()Landroid/graphics/Paint;

    move-result-object v5

    invoke-virtual {v5, v1}, Landroid/graphics/Paint;->setColor(I)V

    invoke-static {v3, v3, v3, v3}, Lui6;->q(FFFF)Landroid/graphics/drawable/ShapeDrawable;

    move-result-object v1

    new-instance v3, Landroid/graphics/drawable/RippleDrawable;

    invoke-direct {v3, v2, v4, v1}, Landroid/graphics/drawable/RippleDrawable;-><init>(Landroid/content/res/ColorStateList;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    invoke-virtual {v0, v3}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    goto :goto_c2

    :cond_72
    invoke-static {}, Lh9o;->p()V

    return-void

    :cond_76
    iget-object v0, v0, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    iget v1, p0, Lb5a;->l:I

    new-instance v3, Landroid/graphics/drawable/RippleDrawable;

    new-instance v4, Landroid/graphics/drawable/ColorDrawable;

    invoke-direct {v4, v1}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    const/4 v1, 0x0

    invoke-direct {v3, v2, v4, v1}, Landroid/graphics/drawable/RippleDrawable;-><init>(Landroid/content/res/ColorStateList;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    invoke-virtual {v0, v3}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    goto :goto_c2

    :cond_89
    iget-object v0, v0, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    iget v1, p0, Lb5a;->l:I

    int-to-float v4, v4

    invoke-static {v3, v3, v4, v4}, Lui6;->q(FFFF)Landroid/graphics/drawable/ShapeDrawable;

    move-result-object v5

    invoke-virtual {v5}, Landroid/graphics/drawable/ShapeDrawable;->getPaint()Landroid/graphics/Paint;

    move-result-object v6

    invoke-virtual {v6, v1}, Landroid/graphics/Paint;->setColor(I)V

    invoke-static {v3, v3, v4, v4}, Lui6;->q(FFFF)Landroid/graphics/drawable/ShapeDrawable;

    move-result-object v1

    new-instance v3, Landroid/graphics/drawable/RippleDrawable;

    invoke-direct {v3, v2, v5, v1}, Landroid/graphics/drawable/RippleDrawable;-><init>(Landroid/content/res/ColorStateList;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    invoke-virtual {v0, v3}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    goto :goto_c2

    :cond_a6
    iget-object v0, v0, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    iget v1, p0, Lb5a;->l:I

    int-to-float v4, v4

    invoke-static {v4, v4, v3, v3}, Lui6;->q(FFFF)Landroid/graphics/drawable/ShapeDrawable;

    move-result-object v5

    invoke-virtual {v5}, Landroid/graphics/drawable/ShapeDrawable;->getPaint()Landroid/graphics/Paint;

    move-result-object v6

    invoke-virtual {v6, v1}, Landroid/graphics/Paint;->setColor(I)V

    invoke-static {v4, v4, v3, v3}, Lui6;->q(FFFF)Landroid/graphics/drawable/ShapeDrawable;

    move-result-object v1

    new-instance v3, Landroid/graphics/drawable/RippleDrawable;

    invoke-direct {v3, v2, v5, v1}, Landroid/graphics/drawable/RippleDrawable;-><init>(Landroid/content/res/ColorStateList;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    invoke-virtual {v0, v3}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    :cond_c2
    :goto_c2
    add-int/lit8 p3, p3, 0x1

    goto/16 :goto_5

    :cond_c6
    return-void
.end method

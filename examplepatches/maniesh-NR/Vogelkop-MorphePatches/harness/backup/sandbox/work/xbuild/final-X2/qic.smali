.class public final Lqic;
.super Liph;
.source "SourceFile"


# instance fields
.field public final a:Landroid/graphics/Rect;

.field public final b:Landroid/graphics/Paint;

.field public final c:I

.field public final d:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Lqic;->a:Landroid/graphics/Rect;

    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Lqic;->b:Landroid/graphics/Paint;

    const/high16 v0, 0x41000000    # 8.0f

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-static {v0, v1}, Lfan;->a(FLandroid/content/res/Resources;)I

    move-result v0

    iput v0, p0, Lqic;->c:I

    const/high16 v0, 0x3f800000    # 1.0f

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    invoke-static {v0, p1}, Lfan;->a(FLandroid/content/res/Resources;)I

    move-result p1

    iput p1, p0, Lqic;->d:I

    return-void
.end method


# virtual methods
.method public final getItemOffsets(Landroid/graphics/Rect;Landroid/view/View;Landroidx/recyclerview/widget/RecyclerView;Lvph;)V
    .registers 6

    invoke-super {p0, p1, p2, p3, p4}, Liph;->getItemOffsets(Landroid/graphics/Rect;Landroid/view/View;Landroidx/recyclerview/widget/RecyclerView;Lvph;)V

    invoke-virtual {p2}, Landroid/view/View;->getId()I

    move-result p3

    const p4, 0x7f0a0604

    const/4 v0, 0x0

    if-ne p3, p4, :cond_22

    invoke-virtual {p2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p2

    check-cast p2, Llph;

    iget-object p2, p2, Llph;->a:Landroidx/recyclerview/widget/i;

    invoke-virtual {p2}, Landroidx/recyclerview/widget/i;->getBindingAdapterPosition()I

    move-result p2

    iget p3, p0, Lqic;->c:I

    if-lez p2, :cond_21

    iget p0, p0, Lqic;->d:I

    add-int v0, p3, p0

    :cond_21
    add-int/2addr v0, p3

    :cond_22
    iput v0, p1, Landroid/graphics/Rect;->top:I

    return-void
.end method

.method public final onDraw(Landroid/graphics/Canvas;Landroidx/recyclerview/widget/RecyclerView;Lvph;)V
    .registers 12

    invoke-virtual {p2}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p3

    const v0, 0x7f04084a

    const v1, 0x7f0600a8

    invoke-static {v0, p3, v1}, Lf03;->t(ILandroid/content/Context;I)I

    move-result p3

    iget-object v5, p0, Lqic;->b:Landroid/graphics/Paint;

    invoke-virtual {v5, p3}, Landroid/graphics/Paint;->setColor(I)V

    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    invoke-virtual {p2}, Landroid/view/View;->getWidth()I

    move-result p3

    invoke-virtual {p2}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v6

    const/4 v0, 0x0

    move v7, v0

    :goto_20
    if-ge v7, v6, :cond_61

    invoke-virtual {p2, v7}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/View;->getId()I

    move-result v1

    const v2, 0x7f0a0604

    if-ne v1, v2, :cond_5c

    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    check-cast v1, Llph;

    iget-object v1, v1, Llph;->a:Landroidx/recyclerview/widget/i;

    invoke-virtual {v1}, Landroidx/recyclerview/widget/i;->getBindingAdapterPosition()I

    move-result v1

    if-lez v1, :cond_5c

    iget-object v1, p0, Lqic;->a:Landroid/graphics/Rect;

    invoke-static {v1, v0}, Landroidx/recyclerview/widget/RecyclerView;->V(Landroid/graphics/Rect;Landroid/view/View;)V

    iget v1, v1, Landroid/graphics/Rect;->top:I

    iget v2, p0, Lqic;->c:I

    add-int/2addr v1, v2

    invoke-virtual {v0}, Landroid/view/View;->getTranslationY()F

    move-result v0

    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    move-result v0

    add-int/2addr v0, v1

    iget v1, p0, Lqic;->d:I

    add-int/2addr v1, v0

    int-to-float v2, v0

    int-to-float v3, p3

    int-to-float v4, v1

    const/4 v1, 0x0

    move-object v0, p1

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    goto :goto_5d

    :cond_5c
    move-object v0, p1

    :goto_5d
    add-int/lit8 v7, v7, 0x1

    move-object p1, v0

    goto :goto_20

    :cond_61
    move-object v0, p1

    invoke-virtual {v0}, Landroid/graphics/Canvas;->restore()V

    return-void
.end method

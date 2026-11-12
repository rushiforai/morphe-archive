.class public final Ls93;
.super Liph;
.source "SourceFile"


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;B)V
    .registers 3

    iput-byte p2, p0, Ls93;->a:B

    iput-object p1, p0, Ls93;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final getItemOffsets(Landroid/graphics/Rect;Landroid/view/View;Landroidx/recyclerview/widget/RecyclerView;Lvph;)V
    .registers 7

    iget-byte v0, p0, Ls93;->a:B

    iget-object v1, p0, Ls93;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_6c

    :pswitch_7
    invoke-super {p0, p1, p2, p3, p4}, Liph;->getItemOffsets(Landroid/graphics/Rect;Landroid/view/View;Landroidx/recyclerview/widget/RecyclerView;Lvph;)V

    return-void

    :pswitch_b
    check-cast v1, Lcom/opera/android/favorites/SuggestionFavoriteLayoutManager;

    invoke-static {p2}, Landroidx/recyclerview/widget/RecyclerView;->S(Landroid/view/View;)I

    move-result p0

    iget-object p2, p3, Landroidx/recyclerview/widget/RecyclerView;->m:Landroidx/recyclerview/widget/d;

    invoke-virtual {p2}, Landroidx/recyclerview/widget/d;->getItemCount()I

    move-result p2

    add-int/lit8 p2, p2, -0x1

    if-ne p0, p2, :cond_1f

    invoke-virtual {p1}, Landroid/graphics/Rect;->setEmpty()V

    goto :goto_2e

    :cond_1f
    iget-object p0, v1, Lcom/opera/android/favorites/SuggestionFavoriteLayoutManager;->d:Landroidx/recyclerview/widget/RecyclerView;

    invoke-static {p0}, Lcs5;->W(Landroid/view/View;)Z

    move-result p0

    iget p2, v1, Lcom/opera/android/favorites/SuggestionFavoriteLayoutManager;->g:I

    if-eqz p0, :cond_2c

    iput p2, p1, Landroid/graphics/Rect;->left:I

    goto :goto_2e

    :cond_2c
    iput p2, p1, Landroid/graphics/Rect;->right:I

    :goto_2e
    return-void

    :pswitch_2f
    check-cast v1, Ly93;

    iget-object p0, v1, Ly93;->v:Landroidx/viewpager/widget/ViewPager;

    invoke-static {p0}, Lcs5;->W(Landroid/view/View;)Z

    move-result p0

    invoke-static {p2}, Landroidx/recyclerview/widget/RecyclerView;->S(Landroid/view/View;)I

    move-result p4

    const/4 v0, -0x1

    if-eq p4, v0, :cond_6b

    iget-object p3, p3, Landroidx/recyclerview/widget/RecyclerView;->m:Landroidx/recyclerview/widget/d;

    if-eqz p3, :cond_6b

    if-eqz p0, :cond_4d

    invoke-virtual {p3}, Landroidx/recyclerview/widget/d;->getItemCount()I

    move-result p3

    add-int/lit8 p3, p3, -0x1

    if-ne p4, p3, :cond_6b

    goto :goto_4f

    :cond_4d
    if-nez p4, :cond_6b

    :goto_4f
    invoke-virtual {p2}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p3

    const p4, 0x7f070056

    invoke-virtual {p3, p4}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p3

    if-eqz p0, :cond_64

    invoke-virtual {p2}, Landroid/view/View;->getPaddingEnd()I

    move-result p0

    sub-int/2addr p3, p0

    iput p3, p1, Landroid/graphics/Rect;->right:I

    goto :goto_6b

    :cond_64
    invoke-virtual {p2}, Landroid/view/View;->getPaddingStart()I

    move-result p0

    sub-int/2addr p3, p0

    iput p3, p1, Landroid/graphics/Rect;->left:I

    :cond_6b
    :goto_6b
    return-void

    :pswitch_data_6c
    .packed-switch 0x0
        :pswitch_2f
        :pswitch_7
        :pswitch_b
    .end packed-switch
.end method

.method public final onDraw(Landroid/graphics/Canvas;Landroidx/recyclerview/widget/RecyclerView;Lvph;)V
    .registers 5

    iget-byte v0, p0, Ls93;->a:B

    packed-switch v0, :pswitch_data_12

    invoke-super {p0, p1, p2, p3}, Liph;->onDraw(Landroid/graphics/Canvas;Landroidx/recyclerview/widget/RecyclerView;Lvph;)V

    return-void

    :pswitch_9
    iget-object p0, p0, Ls93;->b:Ljava/lang/Object;

    check-cast p0, Lev7;

    invoke-virtual {p0}, Lev7;->j()V

    return-void

    nop

    :pswitch_data_12
    .packed-switch 0x1
        :pswitch_9
    .end packed-switch
.end method

.class public final Lzk7;
.super Liph;
.source "SourceFile"


# instance fields
.field public final a:Lyk7;

.field public final b:Lxk7;

.field public c:Landroid/graphics/drawable/Drawable;

.field public d:Z

.field public e:Landroidx/recyclerview/widget/RecyclerView;

.field public final f:Lz61;

.field public final g:Lwk7;


# direct methods
.method public constructor <init>(Lyk7;Lxk7;)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lz61;

    const/4 v1, 0x6

    invoke-direct {v0, p0, v1}, Lz61;-><init>(Ljava/lang/Object;B)V

    iput-object v0, p0, Lzk7;->f:Lz61;

    new-instance v0, Lwk7;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lwk7;-><init>(Ljava/lang/Object;B)V

    iput-object v0, p0, Lzk7;->g:Lwk7;

    iput-object p1, p0, Lzk7;->a:Lyk7;

    iput-object p2, p0, Lzk7;->b:Lxk7;

    invoke-interface {p1}, Lyk7;->f()Landroid/graphics/drawable/Drawable;

    move-result-object p1

    iget-object p2, p0, Lzk7;->c:Landroid/graphics/drawable/Drawable;

    if-eqz p2, :cond_22

    invoke-virtual {p2, v1, v1}, Landroid/graphics/drawable/Drawable;->setVisible(ZZ)Z

    :cond_22
    iput-object p1, p0, Lzk7;->c:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p1, v0}, Landroid/graphics/drawable/Drawable;->setCallback(Landroid/graphics/drawable/Drawable$Callback;)V

    iget-object p0, p0, Lzk7;->c:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p0, v1, v1}, Landroid/graphics/drawable/Drawable;->setVisible(ZZ)Z

    return-void
.end method


# virtual methods
.method public final onDrawOver(Landroid/graphics/Canvas;Landroidx/recyclerview/widget/RecyclerView;Lvph;)V
    .registers 11

    invoke-super {p0, p1, p2, p3}, Liph;->onDrawOver(Landroid/graphics/Canvas;Landroidx/recyclerview/widget/RecyclerView;Lvph;)V

    const/4 p3, 0x1

    iput-boolean p3, p0, Lzk7;->d:Z

    const/4 v0, 0x0

    move v1, v0

    move v2, v1

    :goto_9
    invoke-virtual {p2}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v3

    if-ge v1, v3, :cond_65

    invoke-virtual {p2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    invoke-virtual {p2, v3}, Landroidx/recyclerview/widget/RecyclerView;->T(Landroid/view/View;)Landroidx/recyclerview/widget/i;

    move-result-object v3

    if-eqz v3, :cond_62

    invoke-virtual {v3}, Landroidx/recyclerview/widget/i;->getBindingAdapterPosition()I

    move-result v4

    const/4 v5, -0x1

    if-eq v4, v5, :cond_62

    iget-object v5, p0, Lzk7;->b:Lxk7;

    invoke-interface {v5, v4}, Lxk7;->b(I)Z

    move-result v4

    if-eqz v4, :cond_62

    iget-object v2, p0, Lzk7;->c:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v2}, Landroid/graphics/drawable/Drawable;->isVisible()Z

    move-result v2

    if-eq p3, v2, :cond_35

    iget-object v2, p0, Lzk7;->c:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v2, p3, v0}, Landroid/graphics/drawable/Drawable;->setVisible(ZZ)Z

    :cond_35
    iget-object v2, v3, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {v2}, Landroid/view/View;->getX()F

    move-result v2

    invoke-static {v2}, Ljava/lang/Math;->round(F)I

    move-result v2

    iget-object v4, v3, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {v4}, Landroid/view/View;->getY()F

    move-result v4

    invoke-static {v4}, Ljava/lang/Math;->round(F)I

    move-result v4

    iget-object v5, p0, Lzk7;->c:Landroid/graphics/drawable/Drawable;

    iget-object v6, v3, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {v6}, Landroid/view/View;->getWidth()I

    move-result v6

    add-int/2addr v6, v2

    iget-object v3, v3, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {v3}, Landroid/view/View;->getHeight()I

    move-result v3

    add-int/2addr v3, v4

    invoke-virtual {v5, v2, v4, v6, v3}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    iget-object v2, p0, Lzk7;->c:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v2, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    move v2, p3

    :cond_62
    add-int/lit8 v1, v1, 0x1

    goto :goto_9

    :cond_65
    if-nez v2, :cond_74

    iget-object p1, p0, Lzk7;->c:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->isVisible()Z

    move-result p1

    if-eqz p1, :cond_74

    iget-object p1, p0, Lzk7;->c:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p1, v0, v0}, Landroid/graphics/drawable/Drawable;->setVisible(ZZ)Z

    :cond_74
    iget-object p1, p0, Lzk7;->e:Landroidx/recyclerview/widget/RecyclerView;

    if-eq p1, p2, :cond_84

    iget-object p3, p0, Lzk7;->f:Lz61;

    if-eqz p1, :cond_7f

    invoke-virtual {p1, p3}, Landroid/view/View;->removeOnAttachStateChangeListener(Landroid/view/View$OnAttachStateChangeListener;)V

    :cond_7f
    iput-object p2, p0, Lzk7;->e:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {p2, p3}, Landroid/view/View;->addOnAttachStateChangeListener(Landroid/view/View$OnAttachStateChangeListener;)V

    :cond_84
    iput-boolean v0, p0, Lzk7;->d:Z

    return-void
.end method

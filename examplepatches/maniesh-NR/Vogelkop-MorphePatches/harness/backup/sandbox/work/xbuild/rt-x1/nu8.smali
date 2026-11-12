.class public final Lnu8;
.super Liph;
.source "SourceFile"


# instance fields
.field public final a:Lwa2;

.field public final b:I

.field public final c:I

.field public d:I


# direct methods
.method public constructor <init>(II)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lwa2;

    invoke-direct {v0}, Lwa2;-><init>()V

    iput-object v0, p0, Lnu8;->a:Lwa2;

    iput p1, p0, Lnu8;->b:I

    iput p2, p0, Lnu8;->c:I

    return-void
.end method


# virtual methods
.method public final getItemOffsets(Landroid/graphics/Rect;Landroid/view/View;Landroidx/recyclerview/widget/RecyclerView;Lvph;)V
    .registers 12

    iget-object v0, p0, Lnu8;->a:Lwa2;

    iget-object v1, v0, Lwa2;->a:Landroid/graphics/Rect;

    invoke-virtual {v1}, Landroid/graphics/Rect;->setEmpty()V

    iget-object v2, v0, Lwa2;->b:Landroid/graphics/Rect;

    invoke-virtual {v2}, Landroid/graphics/Rect;->setEmpty()V

    const/4 v3, 0x1

    iput-boolean v3, v0, Lwa2;->c:Z

    const/4 v4, 0x0

    iput-boolean v4, v0, Lwa2;->d:Z

    invoke-virtual {p3, p2}, Landroidx/recyclerview/widget/RecyclerView;->T(Landroid/view/View;)Landroidx/recyclerview/widget/i;

    move-result-object p2

    check-cast p2, Llx8;

    const/4 v5, -0x1

    if-nez p2, :cond_1d

    move v6, v5

    goto :goto_21

    :cond_1d
    invoke-virtual {p2}, Landroidx/recyclerview/widget/i;->getAdapterPosition()I

    move-result v6

    :goto_21
    if-ne v6, v5, :cond_27

    invoke-virtual {v0, v4, p1}, Lwa2;->a(ILandroid/graphics/Rect;)V

    return-void

    :cond_27
    if-nez v6, :cond_2b

    move v5, v3

    goto :goto_2c

    :cond_2b
    move v5, v4

    :goto_2c
    invoke-virtual {p4}, Lvph;->b()I

    move-result p4

    sub-int/2addr p4, v3

    if-ne v6, p4, :cond_35

    move p4, v3

    goto :goto_36

    :cond_35
    move p4, v4

    :goto_36
    iget-object p3, p3, Landroidx/recyclerview/widget/RecyclerView;->n:Landroidx/recyclerview/widget/f;

    if-eqz p3, :cond_40

    invoke-virtual {p3}, Landroidx/recyclerview/widget/f;->getLayoutDirection()I

    move-result p3

    if-eq p3, v3, :cond_41

    :cond_40
    move v3, v4

    :cond_41
    iget p3, p0, Lnu8;->c:I

    iget v6, p0, Lnu8;->b:I

    if-nez v5, :cond_56

    if-nez p4, :cond_58

    iget p0, v1, Landroid/graphics/Rect;->right:I

    div-int/lit8 v6, v6, 0x2

    add-int/2addr p0, v6

    iput p0, v1, Landroid/graphics/Rect;->right:I

    iget p0, v1, Landroid/graphics/Rect;->left:I

    add-int/2addr v6, p0

    iput v6, v1, Landroid/graphics/Rect;->left:I

    goto :goto_7b

    :cond_56
    if-eqz v3, :cond_6c

    :cond_58
    if-eqz p4, :cond_5c

    if-nez v3, :cond_6c

    :cond_5c
    iget p4, v2, Landroid/graphics/Rect;->right:I

    iget p0, p0, Lnu8;->d:I

    add-int/2addr p3, p0

    add-int/2addr p3, p4

    iput p3, v2, Landroid/graphics/Rect;->right:I

    iget p0, v1, Landroid/graphics/Rect;->left:I

    div-int/lit8 v6, v6, 0x2

    add-int/2addr v6, p0

    iput v6, v1, Landroid/graphics/Rect;->left:I

    goto :goto_7b

    :cond_6c
    iget p4, v1, Landroid/graphics/Rect;->right:I

    div-int/lit8 v6, v6, 0x2

    add-int/2addr v6, p4

    iput v6, v1, Landroid/graphics/Rect;->right:I

    iget p4, v2, Landroid/graphics/Rect;->left:I

    iget p0, p0, Lnu8;->d:I

    add-int/2addr p3, p0

    add-int/2addr p3, p4

    iput p3, v2, Landroid/graphics/Rect;->left:I

    :goto_7b
    instance-of p0, p2, Lxa2;

    if-eqz p0, :cond_84

    check-cast p2, Lxa2;

    invoke-interface {p2, v0}, Lxa2;->J(Lwa2;)V

    :cond_84
    invoke-virtual {v0, v4, p1}, Lwa2;->a(ILandroid/graphics/Rect;)V

    return-void
.end method

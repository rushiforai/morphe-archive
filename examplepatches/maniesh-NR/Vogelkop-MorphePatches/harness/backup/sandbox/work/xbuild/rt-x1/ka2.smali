.class public abstract Lka2;
.super Liph;
.source "SourceFile"


# instance fields
.field public final a:Landroid/graphics/Point;

.field public final b:B

.field public final c:Landroid/graphics/Rect;

.field public final d:Ljava/util/ArrayList;


# direct methods
.method public constructor <init>(Landroid/graphics/Point;I)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Lka2;->c:Landroid/graphics/Rect;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lka2;->d:Ljava/util/ArrayList;

    iput-object p1, p0, Lka2;->a:Landroid/graphics/Point;

    iput-byte p2, p0, Lka2;->b:B

    return-void
.end method


# virtual methods
.method public abstract e(I)I
.end method

.method public final f(Landroid/view/View;Landroidx/recyclerview/widget/RecyclerView;Lvph;)Lwa2;
    .registers 11

    iget-object v0, p0, Lka2;->d:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v1

    const/4 v2, 0x0

    const/4 v3, 0x1

    if-eqz v1, :cond_10

    new-instance v0, Lwa2;

    invoke-direct {v0}, Lwa2;-><init>()V

    goto :goto_24

    :cond_10
    invoke-static {v3, v0}, Lvep;->r(ILjava/util/ArrayList;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lwa2;

    iget-object v1, v0, Lwa2;->a:Landroid/graphics/Rect;

    invoke-virtual {v1}, Landroid/graphics/Rect;->setEmpty()V

    iget-object v1, v0, Lwa2;->b:Landroid/graphics/Rect;

    invoke-virtual {v1}, Landroid/graphics/Rect;->setEmpty()V

    iput-boolean v3, v0, Lwa2;->c:Z

    iput-boolean v2, v0, Lwa2;->d:Z

    :goto_24
    iget-object v1, v0, Lwa2;->b:Landroid/graphics/Rect;

    iget-object v4, v0, Lwa2;->a:Landroid/graphics/Rect;

    iget-object v5, p0, Lka2;->a:Landroid/graphics/Point;

    iget v6, v5, Landroid/graphics/Point;->x:I

    div-int/lit8 v6, v6, 0x2

    iget v5, v5, Landroid/graphics/Point;->y:I

    div-int/lit8 v5, v5, 0x2

    invoke-virtual {v4, v6, v5, v6, v5}, Landroid/graphics/Rect;->set(IIII)V

    invoke-virtual {p2, p1}, Landroidx/recyclerview/widget/RecyclerView;->T(Landroid/view/View;)Landroidx/recyclerview/widget/i;

    move-result-object p1

    check-cast p1, Lab2;

    const/4 v4, -0x1

    if-nez p1, :cond_40

    move v5, v4

    goto :goto_44

    :cond_40
    invoke-virtual {p1}, Landroidx/recyclerview/widget/i;->getAdapterPosition()I

    move-result v5

    :goto_44
    if-eq v5, v4, :cond_ab

    invoke-virtual {p3}, Lvph;->b()I

    move-result p3

    sub-int/2addr p3, v3

    if-eq v5, p3, :cond_4f

    move p3, v3

    goto :goto_50

    :cond_4f
    move p3, v2

    :goto_50
    iput-boolean p3, v0, Lwa2;->c:Z

    check-cast p0, Lqv8;

    invoke-virtual {p1}, Lab2;->U()I

    move-result p3

    iget-byte v6, p0, Lka2;->b:B

    if-eq v6, v3, :cond_60

    if-eq p3, v4, :cond_60

    if-ne p3, v6, :cond_61

    :cond_60
    move v2, v3

    :cond_61
    if-nez v2, :cond_69

    invoke-virtual {p0, v5}, Lka2;->e(I)I

    move-result p3

    if-nez p3, :cond_70

    :cond_69
    iget p3, v1, Landroid/graphics/Rect;->left:I

    iget v4, p0, Lqv8;->f:I

    add-int/2addr p3, v4

    iput p3, v1, Landroid/graphics/Rect;->left:I

    :cond_70
    if-nez v2, :cond_7a

    invoke-virtual {p0, v5}, Lka2;->e(I)I

    move-result p3

    add-int/lit8 v2, v6, -0x1

    if-ne p3, v2, :cond_81

    :cond_7a
    iget p3, v1, Landroid/graphics/Rect;->right:I

    iget v2, p0, Lqv8;->f:I

    add-int/2addr p3, v2

    iput p3, v1, Landroid/graphics/Rect;->right:I

    :cond_81
    if-ne v6, v3, :cond_86

    if-nez v5, :cond_94

    goto :goto_90

    :cond_86
    if-ge v5, v6, :cond_94

    iget-object p0, p0, Lqv8;->e:Ltx7;

    invoke-virtual {p0, v5, v6}, Ltx7;->d(II)I

    move-result p0

    if-nez p0, :cond_94

    :goto_90
    iget p0, v1, Landroid/graphics/Rect;->top:I

    iput p0, v1, Landroid/graphics/Rect;->top:I

    :cond_94
    instance-of p0, p1, Lxa2;

    if-eqz p0, :cond_9d

    check-cast p1, Lxa2;

    invoke-interface {p1, v0}, Lxa2;->J(Lwa2;)V

    :cond_9d
    invoke-virtual {p2}, Landroid/view/View;->getLayoutDirection()I

    move-result p0

    if-ne p0, v3, :cond_ab

    iget p0, v1, Landroid/graphics/Rect;->left:I

    iget p1, v1, Landroid/graphics/Rect;->right:I

    iput p1, v1, Landroid/graphics/Rect;->left:I

    iput p0, v1, Landroid/graphics/Rect;->right:I

    :cond_ab
    return-object v0
.end method

.method public abstract g(Landroid/view/View;Landroidx/recyclerview/widget/RecyclerView;Lvph;Lwa2;)Z
.end method

.method public final getItemOffsets(Landroid/graphics/Rect;Landroid/view/View;Landroidx/recyclerview/widget/RecyclerView;Lvph;)V
    .registers 6

    invoke-virtual {p0, p2, p3, p4}, Lka2;->f(Landroid/view/View;Landroidx/recyclerview/widget/RecyclerView;Lvph;)Lwa2;

    move-result-object v0

    invoke-virtual {p0, p2, p3, p4, v0}, Lka2;->g(Landroid/view/View;Landroidx/recyclerview/widget/RecyclerView;Lvph;Lwa2;)Z

    move-result p2

    if-eqz p2, :cond_19

    invoke-virtual {p3}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p2

    const/high16 p3, 0x3f800000    # 1.0f

    invoke-virtual {p2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p2

    invoke-static {p3, p2}, Lfan;->a(FLandroid/content/res/Resources;)I

    move-result p2

    goto :goto_1a

    :cond_19
    const/4 p2, 0x0

    :goto_1a
    invoke-virtual {v0, p2, p1}, Lwa2;->a(ILandroid/graphics/Rect;)V

    iget-object p0, p0, Lka2;->d:Ljava/util/ArrayList;

    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-void
.end method

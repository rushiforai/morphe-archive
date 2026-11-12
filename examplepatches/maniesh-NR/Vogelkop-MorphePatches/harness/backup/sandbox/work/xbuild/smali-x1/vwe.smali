.class public final Lvwe;
.super Landroidx/viewpager/widget/PagerAdapter;
.source "SourceFile"


# instance fields
.field public final a:[Lsv2;

.field public final b:[Lsv2;

.field public final c:[Lsv2;

.field public d:[Lsv2;

.field public final synthetic e:Lxwe;


# direct methods
.method public constructor <init>(Lxwe;)V
    .registers 12

    iput-object p1, p0, Lvwe;->e:Lxwe;

    invoke-direct {p0}, Landroidx/viewpager/widget/PagerAdapter;-><init>()V

    new-instance p1, Lsv2;

    const v0, 0x7f0d02eb

    const v1, 0x7f08078c

    const v2, 0x7f0a076e

    invoke-direct {p1, v0, v1, v2}, Lsv2;-><init>(III)V

    new-instance v3, Lsv2;

    const v4, 0x7f08078e

    const v5, 0x7f0a0770

    invoke-direct {v3, v0, v4, v5}, Lsv2;-><init>(III)V

    new-instance v6, Lsv2;

    const v7, 0x7f08078d

    const v8, 0x7f0a076f

    invoke-direct {v6, v0, v7, v8}, Lsv2;-><init>(III)V

    filled-new-array {p1, v3, v6}, [Lsv2;

    move-result-object p1

    iput-object p1, p0, Lvwe;->a:[Lsv2;

    new-instance v0, Lsv2;

    const v3, 0x7f0d02ea

    invoke-direct {v0, v3, v1, v2}, Lsv2;-><init>(III)V

    new-instance v6, Lsv2;

    invoke-direct {v6, v3, v4, v5}, Lsv2;-><init>(III)V

    new-instance v9, Lsv2;

    invoke-direct {v9, v3, v7, v8}, Lsv2;-><init>(III)V

    filled-new-array {v0, v6, v9}, [Lsv2;

    move-result-object v0

    iput-object v0, p0, Lvwe;->b:[Lsv2;

    new-instance v0, Lsv2;

    const v3, 0x7f0d02ec

    invoke-direct {v0, v3, v1, v2}, Lsv2;-><init>(III)V

    new-instance v1, Lsv2;

    invoke-direct {v1, v3, v4, v5}, Lsv2;-><init>(III)V

    new-instance v2, Lsv2;

    invoke-direct {v2, v3, v7, v8}, Lsv2;-><init>(III)V

    filled-new-array {v0, v1, v2}, [Lsv2;

    move-result-object v0

    iput-object v0, p0, Lvwe;->c:[Lsv2;

    iput-object p1, p0, Lvwe;->d:[Lsv2;

    invoke-virtual {p0}, Lvwe;->a()V

    return-void
.end method


# virtual methods
.method public final a()V
    .registers 3

    iget-object v0, p0, Lvwe;->e:Lxwe;

    iget-boolean v1, v0, Lxwe;->j:Z

    if-eqz v1, :cond_9

    iget-object v0, p0, Lvwe;->c:[Lsv2;

    goto :goto_14

    :cond_9
    iget-object v0, v0, Lxwe;->i:Ltni;

    iget-boolean v0, v0, Ltni;->b:Z

    if-eqz v0, :cond_12

    iget-object v0, p0, Lvwe;->a:[Lsv2;

    goto :goto_14

    :cond_12
    iget-object v0, p0, Lvwe;->b:[Lsv2;

    :goto_14
    iget-object v1, p0, Lvwe;->d:[Lsv2;

    if-ne v0, v1, :cond_19

    return-void

    :cond_19
    iput-object v0, p0, Lvwe;->d:[Lsv2;

    invoke-virtual {p0}, Landroidx/viewpager/widget/PagerAdapter;->notifyDataSetChanged()V

    return-void
.end method

.method public final destroyItem(Landroid/view/ViewGroup;ILjava/lang/Object;)V
    .registers 4

    check-cast p3, Lwwe;

    iget-object p0, p3, Lwwe;->a:Landroid/view/View;

    invoke-virtual {p1, p0}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    return-void
.end method

.method public final getCount()I
    .registers 1

    iget-object p0, p0, Lvwe;->d:[Lsv2;

    array-length p0, p0

    return p0
.end method

.method public final getItemPosition(Ljava/lang/Object;)I
    .registers 2

    check-cast p1, Lwwe;

    iget-object p1, p1, Lwwe;->b:[Lsv2;

    iget-object p0, p0, Lvwe;->d:[Lsv2;

    if-ne p1, p0, :cond_a

    const/4 p0, -0x1

    return p0

    :cond_a
    const/4 p0, -0x2

    return p0
.end method

.method public final instantiateItem(Landroid/view/ViewGroup;I)Ljava/lang/Object;
    .registers 9

    iget-object v0, p0, Lvwe;->d:[Lsv2;

    aget-object p2, v0, p2

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    iget v1, p2, Lsv2;->a:I

    const/4 v2, 0x0

    invoke-virtual {v0, v1, p1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    sget-object v1, Lr5n;->a:Ljava/util/WeakHashMap;

    const v1, 0x7f0a056f

    invoke-static {v0, v1}, Lm5n;->f(Landroid/view/View;I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/view/View;

    check-cast v1, Landroid/widget/ImageView;

    iget v3, p2, Lsv2;->b:I

    invoke-virtual {v1, v3}, Landroid/widget/ImageView;->setImageResource(I)V

    const v1, 0x7f0a0277

    invoke-static {v0, v1}, Lm5n;->f(Landroid/view/View;I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/view/View;

    check-cast v1, Lcom/opera/android/custom_views/ContentWrapperLayout;

    iget p2, p2, Lsv2;->c:I

    move v3, v2

    :goto_36
    invoke-virtual {v1}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v4

    if-ge v3, v4, :cond_4f

    invoke-virtual {v1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v4

    invoke-virtual {v4}, Landroid/view/View;->getId()I

    move-result v5

    if-ne v5, p2, :cond_48

    move v5, v2

    goto :goto_49

    :cond_48
    const/4 v5, 0x4

    :goto_49
    invoke-virtual {v4, v5}, Landroid/view/View;->setVisibility(I)V

    add-int/lit8 v3, v3, 0x1

    goto :goto_36

    :cond_4f
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    new-instance p1, Lwwe;

    iget-object p0, p0, Lvwe;->d:[Lsv2;

    invoke-direct {p1, v0, p0}, Lwwe;-><init>(Landroid/view/View;[Lsv2;)V

    return-object p1
.end method

.method public final isViewFromObject(Landroid/view/View;Ljava/lang/Object;)Z
    .registers 3

    check-cast p2, Lwwe;

    iget-object p0, p2, Lwwe;->a:Landroid/view/View;

    if-ne p1, p0, :cond_8

    const/4 p0, 0x1

    return p0

    :cond_8
    const/4 p0, 0x0

    return p0
.end method

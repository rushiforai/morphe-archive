.class public final Lr93;
.super Lh8n;
.source "SourceFile"


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;B)V
    .registers 3

    iput-byte p2, p0, Lr93;->a:B

    iput-object p1, p0, Lr93;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onPageScrolled(IFI)V
    .registers 4

    iget-byte p3, p0, Lr93;->a:B

    packed-switch p3, :pswitch_data_16

    return-void

    :pswitch_6
    iget-object p0, p0, Lr93;->b:Ljava/lang/Object;

    check-cast p0, Ly93;

    iget-object p0, p0, Ly93;->w:Lcom/opera/android/custom_views/FadingRecyclerView;

    if-eqz p0, :cond_15

    iput p1, p0, Lcom/opera/android/custom_views/FadingRecyclerView;->K0:I

    iput p2, p0, Lcom/opera/android/custom_views/FadingRecyclerView;->L0:F

    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    :cond_15
    return-void

    :pswitch_data_16
    .packed-switch 0x0
        :pswitch_6
    .end packed-switch
.end method

.method public final onPageSelected(I)V
    .registers 7

    iget-byte v0, p0, Lr93;->a:B

    iget-object p0, p0, Lr93;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_9e

    check-cast p0, Ly9k;

    iget-object v0, p0, Ly9k;->g:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lz65;

    iget-object p0, p0, Ly9k;->a:Lpde;

    iget-object v0, p1, Lz65;->f:Lkl0;

    invoke-virtual {p0, v0}, Lekc;->r(Ljava/lang/Object;)V

    iget-object p0, p1, Lz65;->g:Lpn;

    if-eqz p0, :cond_1f

    invoke-virtual {p0}, Lpn;->run()V

    :cond_1f
    return-void

    :pswitch_20
    check-cast p0, Ll8i;

    invoke-virtual {p0}, Ll8i;->a()V

    return-void

    :pswitch_26
    check-cast p0, Lsue;

    invoke-virtual {p0, p1}, Lsue;->x0(I)V

    return-void

    :pswitch_2c
    check-cast p0, Ly93;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getFragmentManager()Landroidx/fragment/app/w;

    move-result-object v0

    const-string v1, "dialog"

    invoke-virtual {v0, v1}, Landroidx/fragment/app/w;->F(Ljava/lang/String;)Landroidx/fragment/app/Fragment;

    move-result-object v0

    check-cast v0, Landroidx/fragment/app/i;

    if-eqz v0, :cond_3f

    invoke-virtual {v0}, Landroidx/fragment/app/i;->dismiss()V

    :cond_3f
    iget-object v0, p0, Ly93;->y:Lt93;

    if-eqz v0, :cond_9c

    iget-object v1, p0, Ly93;->x:Lcom/google/android/material/appbar/AppBarLayout;

    if-eqz v1, :cond_9c

    iget-object v1, p0, Ly93;->w:Lcom/opera/android/custom_views/FadingRecyclerView;

    if-eqz v1, :cond_9c

    iget-object v1, v0, Lt93;->a:[Ljava/lang/Object;

    const/4 v2, 0x0

    if-eqz v1, :cond_60

    if-ltz p1, :cond_60

    array-length v3, v1

    if-ge p1, v3, :cond_60

    iget-object v0, v0, Lt93;->c:Ljava/util/HashMap;

    aget-object v1, v1, p1

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lu93;

    goto :goto_61

    :cond_60
    move-object v0, v2

    :goto_61
    const/4 v1, 0x0

    if-eqz v0, :cond_8d

    iget-object v0, v0, Lu93;->b:Landroidx/recyclerview/widget/RecyclerView;

    iget-object v3, p0, Ly93;->x:Lcom/google/android/material/appbar/AppBarLayout;

    invoke-virtual {v0}, Landroid/view/View;->getId()I

    move-result v4

    iput v4, v3, Lcom/google/android/material/appbar/AppBarLayout;->n:I

    iget-object v4, v3, Lcom/google/android/material/appbar/AppBarLayout;->o:Ljava/lang/ref/WeakReference;

    if-eqz v4, :cond_75

    invoke-virtual {v4}, Ljava/lang/ref/Reference;->clear()V

    :cond_75
    iput-object v2, v3, Lcom/google/android/material/appbar/AppBarLayout;->o:Ljava/lang/ref/WeakReference;

    iget-object v2, p0, Ly93;->x:Lcom/google/android/material/appbar/AppBarLayout;

    const/4 v3, -0x1

    invoke-virtual {v0, v3}, Landroid/view/View;->canScrollVertically(I)Z

    move-result v3

    const/4 v4, 0x1

    if-nez v3, :cond_89

    invoke-virtual {v0}, Landroid/view/View;->getScrollY()I

    move-result v0

    if-gtz v0, :cond_89

    move v0, v1

    goto :goto_8a

    :cond_89
    move v0, v4

    :goto_8a
    invoke-virtual {v2, v0, v4}, Lcom/google/android/material/appbar/AppBarLayout;->l(ZZ)Z

    :cond_8d
    iget-boolean v0, p0, Ly93;->s:Z

    iget-object v2, p0, Ly93;->w:Lcom/opera/android/custom_views/FadingRecyclerView;

    if-eqz v0, :cond_99

    invoke-virtual {v2, p1}, Landroidx/recyclerview/widget/RecyclerView;->x0(I)V

    iput-boolean v1, p0, Ly93;->s:Z

    goto :goto_9c

    :cond_99
    invoke-virtual {v2, p1}, Landroidx/recyclerview/widget/RecyclerView;->H0(I)V

    :cond_9c
    :goto_9c
    return-void

    nop

    :pswitch_data_9e
    .packed-switch 0x0
        :pswitch_2c
        :pswitch_26
        :pswitch_20
    .end packed-switch
.end method

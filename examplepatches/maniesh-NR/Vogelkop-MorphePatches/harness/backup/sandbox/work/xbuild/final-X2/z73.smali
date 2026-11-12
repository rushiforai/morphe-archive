.class public final Lz73;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/MenuItem$OnActionExpandListener;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Lim3;Litd;)V
    .registers 3

    const/4 p2, 0x1

    iput-byte p2, p0, Lz73;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lz73;->b:Ljava/lang/Object;

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;B)V
    .registers 3

    .line 9
    iput-byte p2, p0, Lz73;->a:B

    iput-object p1, p0, Lz73;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onMenuItemActionCollapse(Landroid/view/MenuItem;)Z
    .registers 6

    iget-byte p1, p0, Lz73;->a:B

    const/4 v0, 0x0

    const/4 v1, 0x1

    iget-object p0, p0, Lz73;->b:Ljava/lang/Object;

    packed-switch p1, :pswitch_data_94

    check-cast p0, Lndn;

    invoke-virtual {p0, v0}, Lndn;->d(Z)V

    return v1

    :pswitch_f
    check-cast p0, Loy;

    invoke-virtual {p0}, Loy;->f()V

    iget-object p0, p0, Loy;->i:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/custom_views/ActionBarSearchView;

    if-eqz p0, :cond_1e

    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Landroidx/appcompat/widget/SearchView;->setOnQueryTextListener(Lhti;)V

    :cond_1e
    return v1

    :pswitch_1f
    check-cast p0, Lzse;

    invoke-virtual {p0, v0}, Lzse;->J0(Z)V

    invoke-virtual {p0}, Lzse;->G0()Ldte;

    move-result-object p0

    invoke-virtual {p0}, Ldte;->f()Lbte;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object p0, p0, Lbte;->c:Lkze;

    sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual {p0, p1}, Lekc;->r(Ljava/lang/Object;)V

    return v1

    :pswitch_37
    check-cast p0, Lim3;

    iget-object p1, p0, Lim3;->x:Lgn3;

    iget-boolean v2, p1, Lgn3;->I:Z

    if-eqz v2, :cond_66

    iput-boolean v0, p1, Lgn3;->I:Z

    iget-object v2, p1, Lgn3;->q:Ly83;

    iget-object v2, v2, Ly83;->f:Ljava/lang/Object;

    check-cast v2, Lcom/opera/android/custom_views/FadingRecyclerView;

    iget-object v3, p1, Lgn3;->E:Landroidx/recyclerview/widget/e;

    invoke-virtual {v2, v3}, Lcom/opera/android/custom_views/RecyclerViewForScreenshot;->B0(Landroidx/recyclerview/widget/e;)V

    iget-object v2, p1, Lgn3;->q:Ly83;

    iget-object v2, v2, Ly83;->g:Ljava/lang/Object;

    check-cast v2, Landroid/view/View;

    const/4 v3, 0x4

    invoke-virtual {v2, v3}, Landroid/view/View;->setVisibility(I)V

    iget-object v2, p1, Lgn3;->q:Ly83;

    iget-object v2, v2, Ly83;->c:Ljava/lang/Object;

    check-cast v2, Lcom/opera/android/StatusBarDrawerAppBarLayout;

    iput-boolean v1, v2, Lcom/google/android/material/appbar/AppBarLayout;->l:Z

    iput-boolean v0, v2, Lcom/google/android/material/appbar/AppBarLayout;->i:Z

    invoke-virtual {p1}, Lgn3;->u()V

    invoke-virtual {p1}, Lgn3;->g()V

    :cond_66
    const p1, 0x7f0a0173

    invoke-virtual {p0, p1, v1}, Lim3;->O0(IZ)V

    const p1, 0x7f0a0168

    invoke-virtual {p0, p1, v1}, Lim3;->O0(IZ)V

    iget-object p0, p0, Lim3;->A:Lgm3;

    iget-object p1, p0, Lgm3;->a:Lim3;

    iget-object v2, p1, Lim3;->J:Lzwk;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {}, Lzwk;->e()Z

    move-result v2

    if-nez v2, :cond_87

    iget-object p1, p1, Lim3;->J:Lzwk;

    invoke-virtual {p1, p0}, Lzwk;->a(Lywk;)V

    goto :goto_8d

    :cond_87
    const p0, 0x7f0a0179

    invoke-virtual {p1, p0, v0}, Lim3;->O0(IZ)V

    :goto_8d
    return v1

    :pswitch_8e
    check-cast p0, Ljh3;

    invoke-virtual {p0, v0}, Ljh3;->I0(Z)V

    return v1

    :pswitch_data_94
    .packed-switch 0x0
        :pswitch_8e
        :pswitch_37
        :pswitch_1f
        :pswitch_f
    .end packed-switch
.end method

.method public final onMenuItemActionExpand(Landroid/view/MenuItem;)Z
    .registers 6

    iget-byte p1, p0, Lz73;->a:B

    const/4 v0, 0x0

    const/4 v1, 0x1

    iget-object p0, p0, Lz73;->b:Ljava/lang/Object;

    packed-switch p1, :pswitch_data_8e

    check-cast p0, Lndn;

    invoke-virtual {p0, v1}, Lndn;->d(Z)V

    return v1

    :pswitch_f
    check-cast p0, Loy;

    invoke-virtual {p0}, Loy;->e()Z

    move-result p1

    if-nez p1, :cond_32

    iget-object p1, p0, Loy;->e:Ljava/lang/Object;

    check-cast p1, Lkze;

    sget-object v2, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {p1, v2}, Lekc;->r(Ljava/lang/Object;)V

    iput-boolean v0, p0, Loy;->a:Z

    iget-object p1, p0, Loy;->j:Ljava/lang/Object;

    check-cast p1, Lj1c;

    if-eqz p1, :cond_2f

    invoke-virtual {p0}, Loy;->e()Z

    move-result v0

    invoke-virtual {p1, v0}, Lj1c;->h(Z)V

    :cond_2f
    invoke-virtual {p0}, Loy;->l()V

    :cond_32
    return v1

    :pswitch_33
    check-cast p0, Lzse;

    invoke-virtual {p0, v1}, Lzse;->J0(Z)V

    invoke-virtual {p0}, Lzse;->G0()Ldte;

    move-result-object p0

    invoke-virtual {p0}, Ldte;->f()Lbte;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object p0, p0, Lbte;->c:Lkze;

    sget-object p1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {p0, p1}, Lekc;->r(Ljava/lang/Object;)V

    return v1

    :pswitch_4b
    check-cast p0, Lim3;

    iget-object p1, p0, Lim3;->x:Lgn3;

    iput-boolean v1, p1, Lgn3;->I:Z

    iput-boolean v0, p1, Lgn3;->K:Z

    iget-object v2, p1, Lgn3;->q:Ly83;

    iget-object v2, v2, Ly83;->f:Ljava/lang/Object;

    check-cast v2, Lcom/opera/android/custom_views/FadingRecyclerView;

    iget-object v3, v2, Landroidx/recyclerview/widget/RecyclerView;->M:Landroidx/recyclerview/widget/e;

    iput-object v3, p1, Lgn3;->E:Landroidx/recyclerview/widget/e;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Lcom/opera/android/custom_views/RecyclerViewForScreenshot;->B0(Landroidx/recyclerview/widget/e;)V

    iget-object v2, p1, Lgn3;->q:Ly83;

    iget-object v2, v2, Ly83;->g:Ljava/lang/Object;

    check-cast v2, Landroid/view/View;

    invoke-virtual {v2, v0}, Landroid/view/View;->setVisibility(I)V

    iget-object v2, p1, Lgn3;->q:Ly83;

    iget-object v2, v2, Ly83;->c:Ljava/lang/Object;

    check-cast v2, Lcom/opera/android/StatusBarDrawerAppBarLayout;

    iput-boolean v0, v2, Lcom/google/android/material/appbar/AppBarLayout;->l:Z

    iput-boolean v1, v2, Lcom/google/android/material/appbar/AppBarLayout;->i:Z

    invoke-virtual {v2, v0, v1}, Lcom/google/android/material/appbar/AppBarLayout;->l(ZZ)Z

    invoke-virtual {p1}, Lgn3;->u()V

    const p1, 0x7f0a0173

    invoke-virtual {p0, p1, v0}, Lim3;->O0(IZ)V

    const p1, 0x7f0a0168

    invoke-virtual {p0, p1, v0}, Lim3;->O0(IZ)V

    return v1

    :pswitch_87
    check-cast p0, Ljh3;

    invoke-virtual {p0, v1}, Ljh3;->I0(Z)V

    return v1

    nop

    :pswitch_data_8e
    .packed-switch 0x0
        :pswitch_87
        :pswitch_4b
        :pswitch_33
        :pswitch_f
    .end packed-switch
.end method

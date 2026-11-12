.class public final synthetic Lv83;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lx83;


# direct methods
.method public synthetic constructor <init>(Lx83;B)V
    .registers 3

    iput-byte p2, p0, Lv83;->a:B

    iput-object p1, p0, Lv83;->b:Lx83;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .registers 10

    iget-byte p1, p0, Lv83;->a:B

    const/4 v0, 0x2

    const/4 v1, 0x1

    iget-object p0, p0, Lv83;->b:Lx83;

    packed-switch p1, :pswitch_data_e2

    iget-object p1, p0, Lx83;->B:Li7f;

    invoke-static {p1, p1}, Lu35;->c(Li7f;Li7f;)Lg7f;

    move-result-object p1

    :cond_f
    :goto_f
    invoke-virtual {p1}, Lg7f;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_40

    invoke-virtual {p1}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ldv7;

    iget-object v3, p0, Lx83;->A:Lhri;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v3}, Ljava/lang/Enum;->ordinal()I

    move-result v3

    if-eqz v3, :cond_2e

    if-eq v3, v1, :cond_f

    if-eq v3, v0, :cond_f

    invoke-static {}, Lh9o;->p()V

    goto :goto_40

    :cond_2e
    iget-object v2, v2, Ldv7;->a:Lev7;

    iget-object v3, v2, Lev7;->g:Ljava/lang/Object;

    check-cast v3, Liv7;

    iget-object v3, v3, Liv7;->e:Lpde;

    invoke-virtual {v3}, Lekc;->g()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Leri;

    invoke-virtual {v2, v3}, Lev7;->k(Leri;)V

    goto :goto_f

    :cond_40
    :goto_40
    return-void

    :pswitch_41
    iget-object p1, p0, Lx83;->B:Li7f;

    invoke-static {p1, p1}, Lu35;->c(Li7f;Li7f;)Lg7f;

    move-result-object p1

    :cond_47
    :goto_47
    invoke-virtual {p1}, Lg7f;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_e0

    invoke-virtual {p1}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ldv7;

    iget-object v3, p0, Lx83;->A:Lhri;

    iget-object v2, v2, Ldv7;->a:Lev7;

    iget-object v4, v2, Lev7;->f:Ljava/lang/Object;

    check-cast v4, Lvs;

    iget-object v5, v2, Lev7;->g:Ljava/lang/Object;

    check-cast v5, Liv7;

    invoke-virtual {v3}, Ljava/lang/Enum;->ordinal()I

    move-result v3

    if-eqz v3, :cond_b5

    const/4 v6, 0x3

    const/4 v7, -0x1

    if-eq v3, v1, :cond_91

    if-ne v3, v0, :cond_8d

    iget-object v3, v5, Liv7;->e:Lpde;

    invoke-virtual {v3}, Lekc;->g()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Leri;

    invoke-virtual {v2, v3}, Lev7;->k(Leri;)V

    iget-object v3, v4, Lvs;->d:Ljava/lang/Object;

    check-cast v3, Lcom/google/android/material/chip/ChipGroup;

    invoke-virtual {v3, p0}, Landroid/view/ViewGroup;->indexOfChild(Landroid/view/View;)I

    move-result v3

    if-eq v3, v7, :cond_47

    iget-object v3, v4, Lvs;->e:Ljava/lang/Object;

    check-cast v3, Landroid/widget/HorizontalScrollView;

    new-instance v4, Lcn7;

    invoke-direct {v4, v2, p0, v6}, Lcn7;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v3, v4}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    goto :goto_47

    :cond_8d
    invoke-static {}, Lh9o;->p()V

    goto :goto_e0

    :cond_91
    iget-object v3, v5, Liv7;->g:Lpde;

    invoke-virtual {v3}, Lekc;->g()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ll42;

    if-eqz v3, :cond_47

    invoke-virtual {v2, v3}, Lev7;->k(Leri;)V

    iget-object v3, v4, Lvs;->d:Ljava/lang/Object;

    check-cast v3, Lcom/google/android/material/chip/ChipGroup;

    invoke-virtual {v3, p0}, Landroid/view/ViewGroup;->indexOfChild(Landroid/view/View;)I

    move-result v3

    if-eq v3, v7, :cond_47

    iget-object v3, v4, Lvs;->e:Ljava/lang/Object;

    check-cast v3, Landroid/widget/HorizontalScrollView;

    new-instance v4, Lcn7;

    invoke-direct {v4, v2, p0, v6}, Lcn7;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v3, v4}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    goto :goto_47

    :cond_b5
    invoke-virtual {p0}, Landroid/view/View;->isSelected()Z

    move-result v3

    if-nez v3, :cond_47

    iget-boolean v3, v2, Lev7;->c:Z

    if-nez v3, :cond_47

    new-instance v3, Lakg;

    iget-object v4, v5, Liv7;->d:Lpde;

    iget-object v5, v5, Liv7;->f:Lpde;

    iget-object v6, v2, Lev7;->j:Ljava/lang/Object;

    check-cast v6, Lqe6;

    invoke-direct {v3, v4, v5, v6}, Lakg;-><init>(Lpde;Lpde;Lori;)V

    iput-boolean v1, v2, Lev7;->c:Z

    iget-object v2, v2, Lev7;->h:Ljava/lang/Object;

    check-cast v2, Lwzg;

    iget-object v2, v2, Lwzg;->b:Ljava/lang/Object;

    check-cast v2, Lmrk;

    iget-object v2, v2, Lmrk;->v:Ligi;

    invoke-virtual {v2}, Ligi;->y0()V

    invoke-virtual {v3, p0}, Lo73;->o(Landroid/view/View;)V

    goto/16 :goto_47

    :cond_e0
    :goto_e0
    return-void

    nop

    :pswitch_data_e2
    .packed-switch 0x0
        :pswitch_41
    .end packed-switch
.end method

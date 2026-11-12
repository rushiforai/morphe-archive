.class public final synthetic Ld9l;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lr9l;


# direct methods
.method public synthetic constructor <init>(Lr9l;B)V
    .registers 3

    iput-byte p2, p0, Ld9l;->a:B

    iput-object p1, p0, Ld9l;->b:Lr9l;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .registers 14

    iget-byte v0, p0, Ld9l;->a:B

    const/4 v1, 0x1

    const/4 v2, 0x0

    iget-object p0, p0, Ld9l;->b:Lr9l;

    packed-switch v0, :pswitch_data_de

    invoke-virtual {p0}, Lr9l;->o()V

    return-void

    :pswitch_d
    invoke-virtual {p0}, Lr9l;->t()V

    return-void

    :pswitch_11
    iget-object v0, p0, Lr9l;->w:Ls9i;

    invoke-virtual {v0}, Ls9i;->Y()Z

    move-result v0

    if-eqz v0, :cond_28

    new-instance v0, Lf9l;

    const/4 v1, 0x2

    invoke-direct {v0, p0, v1}, Lf9l;-><init>(Lr9l;B)V

    new-instance p0, Lge;

    invoke-direct {p0, v0}, Lge;-><init>(Lkotlin/jvm/functions/Function1;)V

    invoke-virtual {p0, p1}, Lo73;->o(Landroid/view/View;)V

    goto :goto_36

    :cond_28
    new-instance v0, Lf9l;

    const/4 v1, 0x3

    invoke-direct {v0, p0, v1}, Lf9l;-><init>(Lr9l;B)V

    new-instance p0, Lge;

    invoke-direct {p0, v0}, Lge;-><init>(Lkotlin/jvm/functions/Function1;)V

    invoke-virtual {p0, p1}, Lo73;->o(Landroid/view/View;)V

    :goto_36
    return-void

    :pswitch_37
    iget-object p0, p0, Lr9l;->q:Lebl;

    iget-object p0, p0, Lebl;->o:Lcom/opera/android/custom_views/ObservableEditText;

    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void

    :pswitch_40
    invoke-virtual {p0, v2}, Lr9l;->r(Z)Z

    return-void

    :pswitch_44
    invoke-virtual {p0, v1}, Lr9l;->r(Z)Z

    return-void

    :pswitch_48
    iget-object p0, p0, Lr9l;->t:Lgal;

    sget-object p1, Lp6l;->b:Lp6l;

    invoke-virtual {p0, p1}, Lgal;->g(Lp6l;)V

    return-void

    :pswitch_50
    iget-object p0, p0, Lr9l;->t:Lgal;

    sget-object p1, Lp6l;->a:Lp6l;

    invoke-virtual {p0, p1}, Lgal;->g(Lp6l;)V

    return-void

    :pswitch_58
    iget-object p1, p0, Lr9l;->z:Lzkk;

    sget-object v0, Lvr0;->x:Lvr0;

    invoke-virtual {p1, v0}, Lzkk;->b(Lvr0;)V

    invoke-virtual {p0}, Lr9l;->h()Lb3c;

    move-result-object p1

    new-instance v8, Lc9l;

    const/4 v0, 0x5

    invoke-direct {v8, p0, v0}, Lc9l;-><init>(Lr9l;B)V

    iget-object v0, p0, Lr9l;->y:Lz9j;

    invoke-virtual {v0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v0

    if-eq v0, p1, :cond_c6

    invoke-virtual {p0}, Lr9l;->k()Z

    move-result v0

    iget-object v3, p0, Lr9l;->q:Lebl;

    if-eqz v0, :cond_7d

    iget-object v0, v3, Lebl;->k:Landroid/widget/FrameLayout;

    :goto_7b
    move-object v5, v0

    goto :goto_80

    :cond_7d
    iget-object v0, v3, Lebl;->l:Landroid/widget/FrameLayout;

    goto :goto_7b

    :goto_80
    sget-object v0, Lpn7;->b:Lon7;

    sget-object v0, Lun7;->d:Lun7;

    const/16 v3, 0x32

    invoke-static {v3, v0}, Lcs5;->x0(ILun7;)J

    move-result-wide v3

    const/16 v6, 0x96

    invoke-static {v6, v0}, Lcs5;->x0(ILun7;)J

    move-result-wide v6

    move-wide v9, v3

    new-instance v4, Leek;

    const/16 v0, 0xa

    invoke-direct {v4, p0, p1, v0}, Leek;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    move-wide v10, v9

    new-instance v9, Ldf1;

    invoke-direct {v9, v8, v2}, Ldf1;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v5}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object p1

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    move-result-object p1

    invoke-static {v10, v11}, Lpn7;->f(J)J

    move-result-wide v2

    invoke-virtual {p1, v2, v3}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    move-result-object p1

    new-instance v3, Lbf1;

    invoke-direct/range {v3 .. v9}, Lbf1;-><init>(Leek;Landroid/widget/FrameLayout;JLc9l;Ldf1;)V

    invoke-virtual {p1, v3}, Landroid/view/ViewPropertyAnimator;->withEndAction(Ljava/lang/Runnable;)Landroid/view/ViewPropertyAnimator;

    move-result-object p1

    invoke-virtual {p1, v9}, Landroid/view/ViewPropertyAnimator;->setListener(Landroid/animation/Animator$AnimatorListener;)Landroid/view/ViewPropertyAnimator;

    move-result-object p1

    invoke-virtual {p1}, Landroid/view/ViewPropertyAnimator;->start()V

    iget-object p0, p0, Lr9l;->D:Lg4l;

    sget-object p1, Luz3;->d:Luz3;

    invoke-static {p0, p1, v1}, Lg4l;->a(Lg4l;Luz3;I)V

    :cond_c6
    return-void

    :pswitch_c7
    invoke-virtual {p0}, Lr9l;->l()V

    invoke-virtual {p0}, Lr9l;->j()Z

    return-void

    :pswitch_ce
    iget-object p1, p0, Lr9l;->z:Lzkk;

    sget-object v0, Lvr0;->C:Lvr0;

    invoke-virtual {p1, v0}, Lzkk;->b(Lvr0;)V

    invoke-virtual {p0}, Lr9l;->b()Z

    return-void

    :pswitch_d9
    invoke-virtual {p0}, Lr9l;->n()V

    return-void

    nop

    :pswitch_data_de
    .packed-switch 0x0
        :pswitch_d9
        :pswitch_ce
        :pswitch_c7
        :pswitch_58
        :pswitch_50
        :pswitch_48
        :pswitch_44
        :pswitch_40
        :pswitch_37
        :pswitch_11
        :pswitch_d
    .end packed-switch
.end method

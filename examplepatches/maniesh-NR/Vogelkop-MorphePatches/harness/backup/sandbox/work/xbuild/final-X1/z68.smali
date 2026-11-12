.class public final Lz68;
.super Lkuk;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function2;


# instance fields
.field public final synthetic t:B

.field public u:Z

.field public synthetic v:Ljava/lang/Object;

.field public final synthetic w:Lcom/opera/android/esim/ui/EsimActivity;


# direct methods
.method public synthetic constructor <init>(Lcom/opera/android/esim/ui/EsimActivity;Lmt5;B)V
    .registers 4

    iput-byte p3, p0, Lz68;->t:B

    iput-object p1, p0, Lz68;->w:Lcom/opera/android/esim/ui/EsimActivity;

    const/4 p1, 0x2

    invoke-direct {p0, p1, p2}, Lkuk;-><init>(ILmt5;)V

    return-void
.end method


# virtual methods
.method public final create(Ljava/lang/Object;Lmt5;)Lmt5;
    .registers 5

    iget-byte v0, p0, Lz68;->t:B

    iget-object p0, p0, Lz68;->w:Lcom/opera/android/esim/ui/EsimActivity;

    packed-switch v0, :pswitch_data_1a

    new-instance v0, Lz68;

    const/4 v1, 0x1

    invoke-direct {v0, p0, p2, v1}, Lz68;-><init>(Lcom/opera/android/esim/ui/EsimActivity;Lmt5;B)V

    iput-object p1, v0, Lz68;->v:Ljava/lang/Object;

    return-object v0

    :pswitch_10
    new-instance v0, Lz68;

    const/4 v1, 0x0

    invoke-direct {v0, p0, p2, v1}, Lz68;-><init>(Lcom/opera/android/esim/ui/EsimActivity;Lmt5;B)V

    iput-object p1, v0, Lz68;->v:Ljava/lang/Object;

    return-object v0

    nop

    :pswitch_data_1a
    .packed-switch 0x0
        :pswitch_10
    .end packed-switch
.end method

.method public final invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 4

    iget-byte v0, p0, Lz68;->t:B

    packed-switch v0, :pswitch_data_28

    check-cast p1, Lnx5;

    check-cast p2, Lmt5;

    invoke-virtual {p0, p1, p2}, Lz68;->create(Ljava/lang/Object;Lmt5;)Lmt5;

    move-result-object p0

    check-cast p0, Lz68;

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Lz68;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_16
    check-cast p1, Li78;

    check-cast p2, Lmt5;

    invoke-virtual {p0, p1, p2}, Lz68;->create(Ljava/lang/Object;Lmt5;)Lmt5;

    move-result-object p0

    check-cast p0, Lz68;

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Lz68;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    nop

    :pswitch_data_28
    .packed-switch 0x0
        :pswitch_16
    .end packed-switch
.end method

.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 13

    iget-byte v0, p0, Lz68;->t:B

    const/4 v1, 0x0

    const-string v2, "call to \'resume\' before \'invoke\' with coroutine"

    const/4 v3, 0x1

    iget-object v4, p0, Lz68;->w:Lcom/opera/android/esim/ui/EsimActivity;

    const/4 v5, 0x0

    packed-switch v0, :pswitch_data_1e4

    iget-object v0, p0, Lz68;->v:Ljava/lang/Object;

    check-cast v0, Lnx5;

    sget-object v6, Lpx5;->a:Lpx5;

    iget-boolean v7, p0, Lz68;->u:Z

    if-eqz v7, :cond_20

    if-ne v7, v3, :cond_1c

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_45

    :cond_1c
    invoke-static {v2}, Lqp2;->n(Ljava/lang/String;)V

    goto :goto_47

    :cond_20
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    sget p1, Lcom/opera/android/esim/ui/EsimActivity;->f0:I

    invoke-virtual {v4}, Lcom/opera/android/esim/ui/EsimActivity;->G0()Lu78;

    move-result-object p1

    iget-object p1, p1, Lu78;->n:Lrlh;

    new-instance v2, Lc78;

    invoke-direct {v2, p1, v1}, Lc78;-><init>(Lrlh;B)V

    invoke-static {v2}, Lqbe;->t(Lf99;)Lf99;

    move-result-object p1

    new-instance v1, Lt07;

    invoke-direct {v1, v0, v4, v5}, Lt07;-><init>(Lnx5;Lcom/opera/android/esim/ui/EsimActivity;Lmt5;)V

    iput-object v5, p0, Lz68;->v:Ljava/lang/Object;

    iput-boolean v3, p0, Lz68;->u:Z

    invoke-static {p1, v1, p0}, Lj14;->v(Lf99;Lkotlin/jvm/functions/Function2;Lkuk;)Ljava/lang/Object;

    move-result-object p0

    if-ne p0, v6, :cond_45

    move-object v5, v6

    goto :goto_47

    :cond_45
    :goto_45
    sget-object v5, Lkotlin/Unit;->a:Lkotlin/Unit;

    :goto_47
    return-object v5

    :pswitch_48
    iget-object v0, p0, Lz68;->v:Ljava/lang/Object;

    check-cast v0, Li78;

    sget-object v6, Lpx5;->a:Lpx5;

    iget-boolean v7, p0, Lz68;->u:Z

    const/16 v8, 0x8

    if-eqz v7, :cond_60

    if-ne v7, v3, :cond_5b

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    goto/16 :goto_184

    :cond_5b
    invoke-static {v2}, Lqp2;->n(Ljava/lang/String;)V

    goto/16 :goto_1e3

    :cond_60
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    iget-object p1, v0, Li78;->a:Lh78;

    iget-object p1, p1, Lh78;->a:Lpxh;

    invoke-virtual {v4}, Lfp1;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {p1, v2}, Lpxh;->a(Landroid/content/res/Resources;)Ljava/lang/CharSequence;

    move-result-object p1

    invoke-virtual {v4, p1}, Landroid/app/Activity;->setTitle(Ljava/lang/CharSequence;)V

    invoke-virtual {v4}, Lxd5;->invalidateMenu()V

    iget-object p1, v0, Li78;->b:Lm78;

    instance-of v2, p1, Lj78;

    if-eqz v2, :cond_d5

    iget-object p0, v4, Lcom/opera/android/esim/ui/EsimActivity;->Z:Lor2;

    if-nez p0, :cond_80

    move-object p0, v5

    :cond_80
    iget-object p0, p0, Lor2;->e:Ljava/lang/Object;

    check-cast p0, Lv88;

    iget-object v0, p0, Lv88;->c:Landroid/widget/TextView;

    check-cast p1, Lj78;

    iget-object v2, p1, Lj78;->a:Lqxh;

    invoke-virtual {v4}, Lfp1;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-virtual {v2, v3}, Lpxh;->a(Landroid/content/res/Resources;)Ljava/lang/CharSequence;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v0, p0, Lv88;->d:Lcom/opera/android/custom_views/StylingImageView;

    new-instance v2, Lyk4;

    const/16 v3, 0x16

    invoke-direct {v2, p0, v3}, Lyk4;-><init>(Ljava/lang/Object;B)V

    invoke-static {v2, v0}, Lp37;->k0(Landroid/view/View$OnClickListener;Landroid/view/View;)V

    iget-object v0, p0, Lv88;->e:Landroid/widget/TextView;

    iget-object p1, p1, Lj78;->b:Lrxh;

    invoke-virtual {v4}, Lfp1;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {p1, v2}, Lpxh;->a(Landroid/content/res/Resources;)Ljava/lang/CharSequence;

    move-result-object p1

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object p0, p0, Lv88;->b:Landroid/widget/LinearLayout;

    invoke-virtual {p0, v1}, Landroid/view/View;->setVisibility(I)V

    iget-object p0, v4, Lcom/opera/android/esim/ui/EsimActivity;->Z:Lor2;

    if-nez p0, :cond_ba

    move-object p0, v5

    :cond_ba
    iget-object p0, p0, Lor2;->d:Ljava/lang/Object;

    check-cast p0, Lpt1;

    iget-object p0, p0, Lpt1;->g:Landroid/view/View;

    check-cast p0, Landroid/widget/LinearLayout;

    invoke-virtual {p0, v8}, Landroid/view/View;->setVisibility(I)V

    iget-object p0, v4, Lcom/opera/android/esim/ui/EsimActivity;->Z:Lor2;

    if-eqz p0, :cond_ca

    move-object v5, p0

    :cond_ca
    iget-object p0, v5, Lor2;->f:Ljava/lang/Object;

    check-cast p0, Lb98;

    iget-object p0, p0, Lb98;->b:Landroid/widget/FrameLayout;

    invoke-virtual {p0, v8}, Landroid/view/View;->setVisibility(I)V

    goto/16 :goto_1dd

    :cond_d5
    instance-of v2, p1, Lk78;

    if-eqz v2, :cond_162

    iget-object p0, v4, Lcom/opera/android/esim/ui/EsimActivity;->Z:Lor2;

    if-nez p0, :cond_de

    move-object p0, v5

    :cond_de
    iget-object p0, p0, Lor2;->d:Ljava/lang/Object;

    check-cast p0, Lpt1;

    iget-object v0, p0, Lpt1;->c:Landroid/view/View;

    check-cast v0, Landroid/widget/TextView;

    check-cast p1, Lk78;

    iget-object v2, p1, Lk78;->a:Lrxh;

    invoke-virtual {v4}, Lfp1;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-virtual {v2, v3}, Lpxh;->a(Landroid/content/res/Resources;)Ljava/lang/CharSequence;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v0, p0, Lpt1;->b:Landroid/view/View;

    check-cast v0, Landroid/widget/TextView;

    iget-object v2, p1, Lk78;->b:Lpxh;

    invoke-virtual {v4}, Lfp1;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-virtual {v2, v3}, Lpxh;->a(Landroid/content/res/Resources;)Ljava/lang/CharSequence;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v0, p0, Lpt1;->f:Ljava/lang/Object;

    check-cast v0, Landroid/widget/TextView;

    iget-object v2, p1, Lk78;->d:Lsxh;

    invoke-virtual {v4}, Lfp1;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-virtual {v2, v3}, Lpxh;->a(Landroid/content/res/Resources;)Ljava/lang/CharSequence;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v0, p0, Lpt1;->d:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/ui/catalog/widget/OperaIconedMessage;

    iget-object v2, p1, Lk78;->c:Lrxh;

    invoke-virtual {v4}, Lfp1;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-virtual {v2, v3}, Lpxh;->a(Landroid/content/res/Resources;)Ljava/lang/CharSequence;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Lcom/opera/android/ui/catalog/widget/OperaIconedMessage;->a(Ljava/lang/String;)V

    iget-object v0, p0, Lpt1;->e:Ljava/lang/Object;

    check-cast v0, Lcom/google/android/material/button/MaterialButton;

    iget-object p1, p1, Lk78;->e:Lrxh;

    invoke-virtual {v4}, Lfp1;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {p1, v2}, Lpxh;->a(Landroid/content/res/Resources;)Ljava/lang/CharSequence;

    move-result-object p1

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object p0, p0, Lpt1;->g:Landroid/view/View;

    check-cast p0, Landroid/widget/LinearLayout;

    invoke-virtual {p0, v1}, Landroid/view/View;->setVisibility(I)V

    iget-object p0, v4, Lcom/opera/android/esim/ui/EsimActivity;->Z:Lor2;

    if-nez p0, :cond_149

    move-object p0, v5

    :cond_149
    iget-object p0, p0, Lor2;->e:Ljava/lang/Object;

    check-cast p0, Lv88;

    iget-object p0, p0, Lv88;->b:Landroid/widget/LinearLayout;

    invoke-virtual {p0, v8}, Landroid/view/View;->setVisibility(I)V

    iget-object p0, v4, Lcom/opera/android/esim/ui/EsimActivity;->Z:Lor2;

    if-eqz p0, :cond_157

    move-object v5, p0

    :cond_157
    iget-object p0, v5, Lor2;->f:Ljava/lang/Object;

    check-cast p0, Lb98;

    iget-object p0, p0, Lb98;->b:Landroid/widget/FrameLayout;

    invoke-virtual {p0, v8}, Landroid/view/View;->setVisibility(I)V

    goto/16 :goto_1dd

    :cond_162
    sget-object v2, Ll78;->a:Ll78;

    invoke-virtual {p1, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_1e0

    iget-boolean p1, v0, Li78;->c:Z

    if-eqz p1, :cond_1b1

    sget-object p1, Lpn7;->b:Lon7;

    const/16 p1, 0xc8

    sget-object v0, Lun7;->d:Lun7;

    invoke-static {p1, v0}, Lcs5;->x0(ILun7;)J

    move-result-wide v9

    iput-object v5, p0, Lz68;->v:Ljava/lang/Object;

    iput-boolean v3, p0, Lz68;->u:Z

    invoke-static {v9, v10, p0}, Lnb6;->q(JLmt5;)Ljava/lang/Object;

    move-result-object p0

    if-ne p0, v6, :cond_184

    move-object v5, v6

    goto :goto_1e3

    :cond_184
    :goto_184
    iget-object p0, v4, Lcom/opera/android/esim/ui/EsimActivity;->Z:Lor2;

    if-nez p0, :cond_189

    move-object p0, v5

    :cond_189
    iget-object p0, p0, Lor2;->f:Ljava/lang/Object;

    check-cast p0, Lb98;

    iget-object p0, p0, Lb98;->b:Landroid/widget/FrameLayout;

    invoke-virtual {p0, v1}, Landroid/view/View;->setVisibility(I)V

    iget-object p0, v4, Lcom/opera/android/esim/ui/EsimActivity;->Z:Lor2;

    if-nez p0, :cond_197

    move-object p0, v5

    :cond_197
    iget-object p0, p0, Lor2;->e:Ljava/lang/Object;

    check-cast p0, Lv88;

    iget-object p0, p0, Lv88;->b:Landroid/widget/LinearLayout;

    invoke-virtual {p0, v8}, Landroid/view/View;->setVisibility(I)V

    iget-object p0, v4, Lcom/opera/android/esim/ui/EsimActivity;->Z:Lor2;

    if-eqz p0, :cond_1a5

    move-object v5, p0

    :cond_1a5
    iget-object p0, v5, Lor2;->d:Ljava/lang/Object;

    check-cast p0, Lpt1;

    iget-object p0, p0, Lpt1;->g:Landroid/view/View;

    check-cast p0, Landroid/widget/LinearLayout;

    invoke-virtual {p0, v8}, Landroid/view/View;->setVisibility(I)V

    goto :goto_1dd

    :cond_1b1
    iget-object p0, v4, Lcom/opera/android/esim/ui/EsimActivity;->Z:Lor2;

    if-nez p0, :cond_1b6

    move-object p0, v5

    :cond_1b6
    iget-object p0, p0, Lor2;->f:Ljava/lang/Object;

    check-cast p0, Lb98;

    iget-object p0, p0, Lb98;->b:Landroid/widget/FrameLayout;

    invoke-virtual {p0, v8}, Landroid/view/View;->setVisibility(I)V

    iget-object p0, v4, Lcom/opera/android/esim/ui/EsimActivity;->Z:Lor2;

    if-nez p0, :cond_1c4

    move-object p0, v5

    :cond_1c4
    iget-object p0, p0, Lor2;->e:Ljava/lang/Object;

    check-cast p0, Lv88;

    iget-object p0, p0, Lv88;->b:Landroid/widget/LinearLayout;

    invoke-virtual {p0, v8}, Landroid/view/View;->setVisibility(I)V

    iget-object p0, v4, Lcom/opera/android/esim/ui/EsimActivity;->Z:Lor2;

    if-eqz p0, :cond_1d2

    move-object v5, p0

    :cond_1d2
    iget-object p0, v5, Lor2;->d:Ljava/lang/Object;

    check-cast p0, Lpt1;

    iget-object p0, p0, Lpt1;->g:Landroid/view/View;

    check-cast p0, Landroid/widget/LinearLayout;

    invoke-virtual {p0, v8}, Landroid/view/View;->setVisibility(I)V

    :goto_1dd
    sget-object v5, Lkotlin/Unit;->a:Lkotlin/Unit;

    goto :goto_1e3

    :cond_1e0
    invoke-static {}, Lh9o;->p()V

    :goto_1e3
    return-object v5

    :pswitch_data_1e4
    .packed-switch 0x0
        :pswitch_48
    .end packed-switch
.end method

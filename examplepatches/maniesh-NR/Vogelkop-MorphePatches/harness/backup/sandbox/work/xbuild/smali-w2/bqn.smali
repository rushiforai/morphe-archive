.class public final synthetic Lbqn;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Llqn;


# direct methods
.method public synthetic constructor <init>(Llqn;B)V
    .registers 3

    iput-byte p2, p0, Lbqn;->a:B

    iput-object p1, p0, Lbqn;->b:Llqn;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 10

    iget-byte v0, p0, Lbqn;->a:B

    iget-object p0, p0, Lbqn;->b:Llqn;

    packed-switch v0, :pswitch_data_14a

    check-cast p1, Lpg;

    iget-object p0, p0, Llqn;->w:Lvsn;

    iget-object p0, p0, Lvsn;->l:Lkze;

    invoke-virtual {p0, p1}, Lekc;->r(Ljava/lang/Object;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_13
    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    if-nez p1, :cond_1e

    invoke-virtual {p0}, Llqn;->g0()V

    :cond_1e
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_21
    check-cast p1, Ljava/lang/String;

    iget-object p1, p0, Llqn;->w:Lvsn;

    iget-object p1, p1, Lvsn;->c:Ls62;

    invoke-virtual {p1}, Ls62;->f()Lqyj;

    move-result-object p1

    iget-object p1, p1, Lqyj;->k:Lkze;

    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-static {p1, v0}, Lxf8;->G0(Lkze;Ljava/lang/Object;)Z

    invoke-virtual {p0}, Llqn;->G0()V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_38
    check-cast p1, Ltsn;

    invoke-virtual {p0}, Lltl;->E0()V

    iget-object v0, p0, Llqn;->w:Lvsn;

    iget-object v1, p0, Lltl;->l:Landroidx/appcompat/widget/Toolbar;

    iget-object v2, p1, Ltsn;->a:Lzm9;

    iget-object v3, p1, Ltsn;->b:Llsn;

    iget-object v2, v2, Lzm9;->b:Ljava/lang/Object;

    check-cast v2, Lpxh;

    invoke-virtual {v1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    invoke-virtual {v2, v4}, Lpxh;->a(Landroid/content/res/Resources;)Ljava/lang/CharSequence;

    move-result-object v2

    iget-object v4, p0, Lltl;->l:Landroidx/appcompat/widget/Toolbar;

    invoke-virtual {v4, v2}, Landroidx/appcompat/widget/Toolbar;->D(Ljava/lang/CharSequence;)V

    iget-object v2, p1, Ltsn;->a:Lzm9;

    iget-boolean v4, v2, Lzm9;->a:Z

    const/4 v5, 0x0

    const/4 v6, 0x0

    if-eqz v4, :cond_7d

    invoke-virtual {v1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    const v7, 0x7f070067

    invoke-virtual {v4, v7}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v4

    iput v4, v1, Landroidx/appcompat/widget/Toolbar;->o:I

    invoke-virtual {v1}, Landroid/view/View;->requestLayout()V

    const v4, 0x7f0803ec

    invoke-virtual {v1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v7

    invoke-static {v4, v7}, Lsgb;->F(ILandroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object v4

    invoke-virtual {v1, v4}, Landroidx/appcompat/widget/Toolbar;->y(Landroid/graphics/drawable/Drawable;)V

    goto :goto_85

    :cond_7d
    iput v6, v1, Landroidx/appcompat/widget/Toolbar;->o:I

    invoke-virtual {v1}, Landroid/view/View;->requestLayout()V

    invoke-virtual {v1, v5}, Landroidx/appcompat/widget/Toolbar;->y(Landroid/graphics/drawable/Drawable;)V

    :goto_85
    invoke-virtual {p0, v2}, Llqn;->M0(Lzm9;)V

    iget-object v1, v2, Lzm9;->d:Ljava/lang/Object;

    check-cast v1, Lpsn;

    iget-object v2, p0, Lltl;->l:Landroidx/appcompat/widget/Toolbar;

    invoke-virtual {v2}, Landroidx/appcompat/widget/Toolbar;->o()Litd;

    move-result-object v2

    const v4, 0x7f0a0754

    iget-object v7, v1, Lpsn;->b:Losn;

    invoke-static {v2, v4, v7}, Laoh;->f(Landroid/view/Menu;ILosn;)V

    iget-object v2, p0, Lltl;->l:Landroidx/appcompat/widget/Toolbar;

    invoke-virtual {v2}, Landroidx/appcompat/widget/Toolbar;->o()Litd;

    move-result-object v2

    const v4, 0x7f0a0200

    iget-object v7, v1, Lpsn;->a:Losn;

    invoke-static {v2, v4, v7}, Laoh;->f(Landroid/view/Menu;ILosn;)V

    iget-object v2, p0, Lltl;->l:Landroidx/appcompat/widget/Toolbar;

    invoke-virtual {v2}, Landroidx/appcompat/widget/Toolbar;->o()Litd;

    move-result-object v2

    const v4, 0x7f0a034d

    iget-object v1, v1, Lpsn;->c:Losn;

    invoke-static {v2, v4, v1}, Laoh;->f(Landroid/view/Menu;ILosn;)V

    iget-object v1, p0, Llqn;->D:Lcom/opera/android/webaiassistant/WebAiAssistantLayoutSwitcher;

    if-nez v1, :cond_bb

    move-object v1, v5

    :cond_bb
    iget-object p1, p1, Ltsn;->c:Lnsn;

    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    move-result p1

    if-eqz p1, :cond_e3

    const/4 v2, 0x1

    if-eq p1, v2, :cond_e0

    const/4 v2, 0x2

    if-eq p1, v2, :cond_e0

    const/4 v2, 0x3

    if-eq p1, v2, :cond_dd

    const/4 v2, 0x4

    if-eq p1, v2, :cond_da

    const/4 v2, 0x5

    if-ne p1, v2, :cond_d5

    sget-object p1, Lnrn;->d:Lnrn;

    goto :goto_e5

    :cond_d5
    invoke-static {}, Lh9o;->p()V

    goto/16 :goto_149

    :cond_da
    sget-object p1, Lnrn;->c:Lnrn;

    goto :goto_e5

    :cond_dd
    sget-object p1, Lnrn;->b:Lnrn;

    goto :goto_e5

    :cond_e0
    sget-object p1, Lnrn;->a:Lnrn;

    goto :goto_e5

    :cond_e3
    sget-object p1, Lnrn;->c:Lnrn;

    :goto_e5
    invoke-virtual {v1, p1}, Lcom/opera/android/webaiassistant/WebAiAssistantLayoutSwitcher;->d(Lnrn;)V

    iget-object p1, p0, Llqn;->G:Lmrn;

    if-nez p1, :cond_ed

    move-object p1, v5

    :cond_ed
    invoke-virtual {p1, v3}, Lmrn;->h(Llsn;)V

    invoke-interface {v3}, Llsn;->isEnabled()Z

    move-result p1

    if-eqz p1, :cond_10f

    iget-object p1, p0, Llqn;->E:Lzv0;

    if-nez p1, :cond_fc

    move-object v1, v5

    goto :goto_fd

    :cond_fc
    move-object v1, p1

    :goto_fd
    iget-object v1, v1, Lzv0;->b:Ljava/lang/String;

    if-nez p1, :cond_102

    move-object p1, v5

    :cond_102
    const/16 v2, 0x7fd

    invoke-static {p1, v2}, Lzv0;->a(Lzv0;I)Lzv0;

    move-result-object p1

    iput-object p1, p0, Llqn;->E:Lzv0;

    if-eqz v1, :cond_10f

    invoke-virtual {v0, v1, v6}, Lvsn;->m(Ljava/lang/String;Z)V

    :cond_10f
    iget-object p1, p0, Llqn;->E:Lzv0;

    if-nez p1, :cond_115

    move-object v0, v5

    goto :goto_116

    :cond_115
    move-object v0, p1

    :goto_116
    iget-object v0, v0, Lzv0;->c:Ljava/lang/String;

    if-nez p1, :cond_11b

    move-object p1, v5

    :cond_11b
    const/16 v1, 0x7fb

    invoke-static {p1, v1}, Lzv0;->a(Lzv0;I)Lzv0;

    move-result-object p1

    iput-object p1, p0, Llqn;->E:Lzv0;

    if-eqz v0, :cond_130

    iget-object p1, p0, Llqn;->G:Lmrn;

    if-nez p1, :cond_12a

    move-object p1, v5

    :cond_12a
    invoke-virtual {p1, v0}, Lmrn;->i(Ljava/lang/String;)V

    invoke-virtual {p0, v0}, Llqn;->H0(Ljava/lang/String;)V

    :cond_130
    invoke-virtual {p0}, Llqn;->G0()V

    iget-boolean p1, p0, Llqn;->O:Z

    if-eqz p1, :cond_147

    invoke-interface {v3}, Llsn;->isEnabled()Z

    move-result p1

    if-eqz p1, :cond_147

    iput-boolean v6, p0, Llqn;->O:Z

    iget-object p0, p0, Llqn;->G:Lmrn;

    if-eqz p0, :cond_144

    move-object v5, p0

    :cond_144
    invoke-virtual {v5}, Lmrn;->g()V

    :cond_147
    sget-object v5, Lkotlin/Unit;->a:Lkotlin/Unit;

    :goto_149
    return-object v5

    :pswitch_data_14a
    .packed-switch 0x0
        :pswitch_38
        :pswitch_21
        :pswitch_13
    .end packed-switch
.end method

.class public final synthetic Lk9;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lf7f;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Lcf4;Ljava/lang/String;)V
    .registers 3

    const/16 p2, 0x16

    iput-byte p2, p0, Lk9;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lk9;->b:Ljava/lang/Object;

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;B)V
    .registers 3

    .line 10
    iput-byte p2, p0, Lk9;->a:B

    iput-object p1, p0, Lk9;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final d0(Ljava/lang/Object;)V
    .registers 15

    iget-byte v0, p0, Lk9;->a:B

    const/4 v1, -0x1

    const/16 v2, 0xa

    const/4 v3, 0x2

    const/4 v4, 0x3

    const/4 v5, 0x0

    const/16 v6, 0x8

    const/4 v7, 0x1

    const/4 v8, 0x0

    iget-object p0, p0, Lk9;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_808

    check-cast p0, Lyk6;

    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p0, v5}, Lyk6;->f(Ljava/lang/Boolean;)V

    return-void

    :pswitch_1c
    check-cast p0, Lkf;

    check-cast p1, Landroid/content/res/Configuration;

    iget p1, p1, Landroid/content/res/Configuration;->screenHeightDp:I

    const/16 v0, 0x258

    if-ge p1, v0, :cond_27

    move v7, v8

    :cond_27
    iget-object p0, p0, Lkf;->c:Ljava/lang/Object;

    check-cast p0, Landroid/widget/FrameLayout;

    if-eqz v7, :cond_2e

    move v6, v8

    :cond_2e
    invoke-virtual {p0, v6}, Landroid/view/View;->setVisibility(I)V

    return-void

    :pswitch_32
    check-cast p0, Lfe5;

    check-cast p1, Lqcc;

    invoke-virtual {p0}, Lfe5;->b()V

    return-void

    :pswitch_3a
    check-cast p0, Lz8b;

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object p0, p0, Lz8b;->a:Ljava/lang/Object;

    check-cast p0, Lpde;

    invoke-static {p0, p1}, Lxf8;->F0(Lpde;Ljava/lang/Object;)Z

    return-void

    :pswitch_49
    check-cast p0, Lex4;

    check-cast p1, Lr6j;

    invoke-virtual {p0, p1}, Lex4;->g(Lr6j;)V

    return-void

    :pswitch_51
    move-object v1, p0

    check-cast v1, Lnrl;

    check-cast p1, Llq4;

    if-eqz p1, :cond_9b

    iget-object p0, p1, Llq4;->a:Ljava/util/List;

    new-instance v0, Lb10;

    invoke-direct {v0, v4}, Lb10;-><init>(B)V

    invoke-static {v0, p0}, Lnb6;->W(Lxq9;Ljava/util/List;)Ljava/util/AbstractList;

    move-result-object v3

    new-instance v4, Lro9;

    iget-object v0, v1, Lnrl;->b:Ljava/lang/Object;

    check-cast v0, Loq4;

    iget-object v2, v0, Loq4;->p:Lcom/google/android/material/textfield/TextInputLayout;

    new-instance v5, Lxj;

    const/16 v6, 0x1c

    invoke-direct {v5, v1, p1, v6}, Lxj;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-direct {v4, v2, v5}, Lro9;-><init>(Lcom/google/android/material/textfield/TextInputLayout;Ltj9;)V

    move-object p1, v0

    new-instance v0, Lei4;

    iget-object p1, p1, Loq4;->p:Lcom/google/android/material/textfield/TextInputLayout;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v2

    const/4 v5, 0x1

    invoke-direct/range {v0 .. v5}, Lei4;-><init>(Ljava/lang/Object;Landroid/content/Context;Ljava/util/AbstractList;Lro9;B)V

    iget-object p1, v4, Lro9;->d:Ljava/lang/Object;

    check-cast p1, Landroid/widget/AutoCompleteTextView;

    invoke-virtual {p1, v0}, Landroid/widget/AutoCompleteTextView;->setAdapter(Landroid/widget/ListAdapter;)V

    invoke-interface {v3, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/CharSequence;

    invoke-virtual {v4, v8, p1}, Lro9;->a0(ILjava/lang/CharSequence;)V

    invoke-interface {p0, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lkq4;

    invoke-virtual {v1, p0}, Lnrl;->Q(Lkq4;)V

    :cond_9b
    return-void

    :pswitch_9c
    check-cast p0, Lzk4;

    check-cast p1, Lbl4;

    iget-boolean v0, p1, Lbl4;->a:Z

    invoke-virtual {p0}, Lzk4;->H0()Lgl9;

    move-result-object v1

    iget-object v1, v1, Lgl9;->c:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    invoke-virtual {v1, v0}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->t(Z)V

    iget-object p1, p1, Lbl4;->b:Lna2;

    sget-object v0, Lkk4;->o:Lkk4;

    invoke-virtual {p1, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_c8

    invoke-virtual {p0}, Lzk4;->H0()Lgl9;

    move-result-object p1

    iget-object p1, p1, Lgl9;->e:Lcom/opera/android/custom_views/SeparatorView;

    invoke-virtual {p1, v6}, Landroid/view/View;->setVisibility(I)V

    invoke-virtual {p0}, Lzk4;->H0()Lgl9;

    move-result-object p0

    iget-object p0, p0, Lgl9;->b:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {p0, v6}, Landroid/view/View;->setVisibility(I)V

    goto :goto_115

    :cond_c8
    instance-of v0, p1, Llk4;

    if-eqz v0, :cond_112

    invoke-virtual {p0}, Lzk4;->H0()Lgl9;

    move-result-object v0

    iget-object v0, v0, Lgl9;->e:Lcom/opera/android/custom_views/SeparatorView;

    invoke-virtual {v0, v8}, Landroid/view/View;->setVisibility(I)V

    invoke-virtual {p0}, Lzk4;->H0()Lgl9;

    move-result-object v0

    iget-object v0, v0, Lgl9;->b:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v0, v8}, Landroid/view/View;->setVisibility(I)V

    iget-object v0, p0, Lzk4;->x:Lyw;

    if-nez v0, :cond_10a

    new-instance v0, Lyw;

    new-instance v1, Lole;

    invoke-direct {v1, p0}, Lole;-><init>(Ljava/lang/Object;)V

    invoke-direct {v0, v1}, Lyw;-><init>(Lole;)V

    iput-object v0, p0, Lzk4;->x:Lyw;

    invoke-virtual {p0}, Lzk4;->H0()Lgl9;

    move-result-object v1

    iget-object v1, v1, Lgl9;->b:Landroidx/recyclerview/widget/RecyclerView;

    iget-object v2, p0, Lzk4;->x:Lyw;

    invoke-virtual {v1, v2}, Landroidx/recyclerview/widget/RecyclerView;->y0(Landroidx/recyclerview/widget/d;)V

    invoke-virtual {p0}, Lzk4;->H0()Lgl9;

    move-result-object v1

    iget-object v1, v1, Lgl9;->b:Landroidx/recyclerview/widget/RecyclerView;

    new-instance v2, Landroidx/recyclerview/widget/LinearLayoutManager;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    invoke-direct {v2}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>()V

    invoke-virtual {v1, v2}, Landroidx/recyclerview/widget/RecyclerView;->C0(Landroidx/recyclerview/widget/f;)V

    :cond_10a
    check-cast p1, Llk4;

    iget-object p0, p1, Llk4;->o:Ljava/util/ArrayList;

    invoke-virtual {v0, p0}, Ldt1;->K(Ljava/util/Collection;)V

    goto :goto_115

    :cond_112
    invoke-static {}, Lh9o;->p()V

    :goto_115
    return-void

    :pswitch_116
    check-cast p0, Lcf4;

    check-cast p1, Lum2;

    iget-object v0, p0, Lcf4;->l:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v0

    if-eqz v0, :cond_130

    iget-object p1, p1, Lum2;->b:Lvm2;

    if-eqz p1, :cond_130

    iget-object p1, p0, Lcf4;->a:Ljava/util/concurrent/Executor;

    new-instance v0, Lye4;

    invoke-direct {v0, p0, v8}, Lye4;-><init>(Lcf4;B)V

    invoke-interface {p1, v0}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    :cond_130
    return-void

    :pswitch_131
    check-cast p0, Lw04;

    iget-object v0, p0, Lw04;->d:Lfv2;

    check-cast p1, Lag2;

    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    move-result p1

    if-eqz p1, :cond_157

    if-eq p1, v7, :cond_147

    if-eq p1, v3, :cond_157

    if-eq p1, v4, :cond_157

    invoke-static {}, Lh9o;->p()V

    goto :goto_169

    :cond_147
    iget-boolean p1, p0, Lw04;->c:Z

    if-nez p1, :cond_169

    iput-boolean v7, p0, Lw04;->c:Z

    sget-wide p0, Lw04;->e:J

    invoke-static {p0, p1}, Lpn7;->f(J)J

    move-result-wide p0

    invoke-static {v0, p0, p1}, Lvml;->d(Ljava/lang/Runnable;J)V

    goto :goto_169

    :cond_157
    iput-boolean v8, p0, Lw04;->c:Z

    invoke-static {v0}, Lvml;->a(Ljava/lang/Runnable;)V

    iget-object p0, p0, Lw04;->b:Lx05;

    iget-object p1, p0, Lx05;->d:Landroid/animation/ValueAnimator;

    invoke-virtual {p1}, Landroid/animation/Animator;->isRunning()Z

    move-result p1

    if-eqz p1, :cond_169

    invoke-virtual {p0}, Lx05;->stop()V

    :cond_169
    :goto_169
    return-void

    :pswitch_16a
    check-cast p0, Lny3;

    check-cast p1, Lm18;

    invoke-virtual {p0}, Lny3;->c()V

    return-void

    :pswitch_172
    check-cast p0, Lgy3;

    check-cast p1, Lky3;

    iget-object v0, p1, Lky3;->a:Lrm5;

    sget-object v1, Lamf;->l:Lamf;

    invoke-virtual {p0}, Lgy3;->H0()Lfl9;

    move-result-object v2

    iget-object v2, v2, Lfl9;->b:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    sget-object v3, Lnm6;->m:Lnm6;

    invoke-virtual {v0, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_18c

    invoke-virtual {v2, v6}, Landroid/view/View;->setVisibility(I)V

    goto :goto_1c8

    :cond_18c
    instance-of v3, v0, Lom6;

    if-eqz v3, :cond_1a2

    invoke-virtual {v2, v8}, Landroid/view/View;->setVisibility(I)V

    new-instance v0, Lrxh;

    const v3, 0x7f140557

    invoke-direct {v0, v3}, Lrxh;-><init>(I)V

    invoke-virtual {v2, v0}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->C(Lpxh;)V

    invoke-virtual {v2, v1}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->B(Li41;)V

    goto :goto_1c8

    :cond_1a2
    instance-of v3, v0, Lpm6;

    if-eqz v3, :cond_28d

    invoke-virtual {v2, v8}, Landroid/view/View;->setVisibility(I)V

    check-cast v0, Lpm6;

    iget-object v3, v0, Lpm6;->m:Landroid/graphics/drawable/Drawable;

    iget-object v0, v0, Lpm6;->n:Ljava/lang/String;

    invoke-static {v2, v0}, Lv0g;->m(Lcom/opera/android/ui/catalog/widget/OperaListItem;Ljava/lang/String;)V

    if-eqz v3, :cond_1c5

    new-instance v0, Lylf;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    invoke-virtual {v2, v0}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->B(Li41;)V

    new-instance v0, Lmxh;

    invoke-direct {v0, v3}, Lmxh;-><init>(Landroid/graphics/drawable/Drawable;)V

    invoke-virtual {v2, v0}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->z(Lb8h;)V

    goto :goto_1c8

    :cond_1c5
    invoke-virtual {v2, v1}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->B(Li41;)V

    :goto_1c8
    iget v0, p1, Lky3;->b:I

    invoke-virtual {p0}, Lgy3;->H0()Lfl9;

    move-result-object v1

    iget-object v1, v1, Lfl9;->g:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    invoke-virtual {v1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-static {v0, v2}, Lz9k;->l0(ILandroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Lv0g;->m(Lcom/opera/android/ui/catalog/widget/OperaListItem;Ljava/lang/String;)V

    iget-object v0, p1, Lky3;->c:Lq7j;

    invoke-virtual {p0}, Lgy3;->H0()Lfl9;

    move-result-object v1

    iget-object v1, v1, Lfl9;->e:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    invoke-virtual {v1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    iget v0, v0, Lq7j;->a:I

    invoke-virtual {v2, v0}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Lv0g;->m(Lcom/opera/android/ui/catalog/widget/OperaListItem;Ljava/lang/String;)V

    iget-object v0, p1, Lky3;->d:Liwk;

    sget-object v1, Lhwk;->a:Lhwk;

    invoke-virtual {v0, v1}, Liwk;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_204

    invoke-virtual {p0}, Lgy3;->H0()Lfl9;

    move-result-object v0

    iget-object v0, v0, Lfl9;->h:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    invoke-virtual {v0, v6}, Landroid/view/View;->setVisibility(I)V

    goto :goto_218

    :cond_204
    invoke-virtual {p0}, Lgy3;->H0()Lfl9;

    move-result-object v2

    iget-object v2, v2, Lfl9;->h:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    invoke-virtual {v2, v8}, Landroid/view/View;->setVisibility(I)V

    invoke-virtual {p0}, Lgy3;->H0()Lfl9;

    move-result-object v2

    iget-object v2, v2, Lfl9;->h:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    iget-boolean v0, v0, Liwk;->a:Z

    invoke-virtual {v2, v0}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->t(Z)V

    :goto_218
    iget-object v0, p1, Lky3;->e:Lk1c;

    invoke-virtual {p0}, Lgy3;->H0()Lfl9;

    move-result-object v2

    iget-object v2, v2, Lfl9;->d:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    iget v0, v0, Lk1c;->a:I

    invoke-static {v0, v2}, Lu35;->k(ILcom/opera/android/ui/catalog/widget/OperaListItem;)V

    iget-object v0, p1, Lky3;->f:Luup;

    invoke-virtual {p0}, Lgy3;->H0()Lfl9;

    move-result-object v2

    iget-object v2, v2, Lfl9;->c:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    instance-of v3, v0, Loab;

    if-eqz v3, :cond_235

    invoke-virtual {v2, v6}, Landroid/view/View;->setVisibility(I)V

    goto :goto_258

    :cond_235
    instance-of v3, v0, Lpab;

    if-eqz v3, :cond_289

    invoke-virtual {v2, v8}, Landroid/view/View;->setVisibility(I)V

    move-object v3, v0

    check-cast v3, Lpab;

    iget-object v4, v3, Lpab;->i:Lrxh;

    iget-object v3, v3, Lpab;->h:Lrxh;

    invoke-virtual {v2, v3}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->C(Lpxh;)V

    if-nez v4, :cond_249

    move v7, v8

    :cond_249
    invoke-virtual {v2, v7}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->setEnabled(Z)V

    if-eqz v4, :cond_258

    new-instance v3, Lnf;

    const/16 v4, 0x17

    invoke-direct {v3, p0, v0, v4}, Lnf;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v2, v3}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    :cond_258
    :goto_258
    iget-object p1, p1, Lky3;->g:Lcgh;

    invoke-virtual {p1, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_26a

    invoke-virtual {p0}, Lgy3;->H0()Lfl9;

    move-result-object p0

    iget-object p0, p0, Lfl9;->f:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    invoke-virtual {p0, v6}, Landroid/view/View;->setVisibility(I)V

    goto :goto_290

    :cond_26a
    instance-of v0, p1, Liwk;

    if-eqz v0, :cond_285

    invoke-virtual {p0}, Lgy3;->H0()Lfl9;

    move-result-object v0

    iget-object v0, v0, Lfl9;->f:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    invoke-virtual {v0, v8}, Landroid/view/View;->setVisibility(I)V

    invoke-virtual {p0}, Lgy3;->H0()Lfl9;

    move-result-object p0

    iget-object p0, p0, Lfl9;->f:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    check-cast p1, Liwk;

    iget-boolean p1, p1, Liwk;->a:Z

    invoke-virtual {p0, p1}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->t(Z)V

    goto :goto_290

    :cond_285
    invoke-static {}, Lh9o;->p()V

    goto :goto_290

    :cond_289
    invoke-static {}, Lh9o;->p()V

    goto :goto_290

    :cond_28d
    invoke-static {}, Lh9o;->p()V

    :goto_290
    return-void

    :pswitch_291
    check-cast p0, Lcom/opera/android/BrowserActivity;

    check-cast p1, Lndc;

    sget v0, Lcom/opera/android/BrowserActivity;->E1:I

    if-nez p1, :cond_29a

    move v7, v8

    :cond_29a
    iput-boolean v7, p0, Lcom/opera/android/BrowserActivity;->P:Z

    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object p1

    if-eqz p1, :cond_2b6

    iget-object p1, p0, Lcom/opera/android/BrowserActivity;->Q:Lcom/opera/android/RootView;

    if-eqz p1, :cond_2a7

    move-object v5, p1

    :cond_2a7
    iget-boolean p1, v5, Lcom/opera/android/RootView;->m:Z

    if-eq v7, p1, :cond_2b6

    iput-boolean v7, v5, Lcom/opera/android/RootView;->m:Z

    invoke-virtual {v5}, Lcom/opera/android/RootView;->f()V

    invoke-virtual {v5}, Lcom/opera/android/RootView;->requestLayout()V

    invoke-virtual {v5}, Landroid/view/View;->requestApplyInsets()V

    :cond_2b6
    invoke-virtual {p0}, Lcom/opera/android/BrowserActivity;->C1()V

    return-void

    :pswitch_2ba
    check-cast p0, Ltt2;

    check-cast p1, Ljava/lang/Boolean;

    sget v0, Lcom/opera/android/BrowserActivity;->E1:I

    invoke-virtual {p0, p1}, Ltt2;->run(Ljava/lang/Object;)V

    return-void

    :pswitch_2c4
    check-cast p0, Ll45;

    check-cast p1, Ljava/lang/Float;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object p1, p0, Ll45;->b:Ljava/lang/Object;

    check-cast p1, Lpde;

    invoke-virtual {p1}, Lekc;->g()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Number;

    invoke-virtual {p1}, Ljava/lang/Number;->floatValue()F

    move-result p1

    const/high16 v0, 0x3f000000    # 0.5f

    cmpl-float p1, p1, v0

    iget-object v0, p0, Ll45;->a:Ljava/lang/Object;

    check-cast v0, Lebl;

    if-lez p1, :cond_2e6

    iget-object p1, v0, Lebl;->v:Lcom/opera/android/custom_views/StylingImageButton;

    goto :goto_2e8

    :cond_2e6
    iget-object p1, v0, Lebl;->e:Lcom/opera/android/custom_views/StylingImageButton;

    :goto_2e8
    iget-object p0, p0, Ll45;->c:Ljava/lang/Object;

    check-cast p0, Ljava/util/List;

    check-cast p0, Ljava/lang/Iterable;

    invoke-interface {p0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_2f2
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_30b

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/opera/android/custom_views/StylingImageButton;

    invoke-static {v0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_306

    move v1, v8

    goto :goto_307

    :cond_306
    move v1, v6

    :goto_307
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    goto :goto_2f2

    :cond_30b
    return-void

    :pswitch_30c
    check-cast p0, Ld5o;

    check-cast p1, Lg03;

    invoke-virtual {p0}, Ld5o;->N()V

    return-void

    :pswitch_314
    check-cast p0, Landroid/view/View;

    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    invoke-virtual {p0, p1}, Landroid/view/View;->setEnabled(Z)V

    return-void

    :pswitch_320
    check-cast p0, Lv73;

    check-cast p1, Lt0a;

    iget-object p1, p0, Lv73;->k:Lu0a;

    iget-object p1, p1, Lu0a;->a:Lpde;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object p1, p0, Lv73;->a:Ljava/util/EnumMap;

    sget-object v0, Ltaf;->g:Ltaf;

    invoke-virtual {p1, v0}, Ljava/util/EnumMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Luaf;

    iget-object p0, p0, Lv73;->b:Landroid/content/Context;

    const v0, 0x7f0805c8

    invoke-static {v0, p0}, Lsgb;->F(ILandroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    const v1, 0x7f040756

    iput v1, p1, Luaf;->i:I

    iput v8, p1, Luaf;->j:I

    iput-object v0, p1, Luaf;->e:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p1, p0}, Luaf;->a(Landroid/content/Context;)V

    const p0, 0x7f140ef4

    iput p0, p1, Luaf;->c:I

    iput p0, p1, Luaf;->b:I

    return-void

    :pswitch_352
    check-cast p0, Lxol;

    check-cast p1, Ljava/util/List;

    invoke-virtual {p0, p1}, Lygc;->H(Ljava/util/List;)V

    return-void

    :pswitch_35a
    check-cast p0, Lw43;

    check-cast p1, Ljava/lang/Integer;

    iget-object p1, p0, Lw43;->b:Ljava/lang/Object;

    check-cast p1, Lk6l;

    iget-object p1, p1, Lk6l;->o:Lb2l;

    invoke-virtual {p0, p1}, Lw43;->W(Lb2l;)V

    return-void

    :pswitch_368
    check-cast p0, Lx03;

    check-cast p1, Lb03;

    iget-object p0, p0, Lx03;->a:Landroid/view/View;

    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    return-void

    :pswitch_372
    check-cast p0, Ls62;

    check-cast p1, Lela;

    iget-object p0, p0, Ls62;->w:Lr9i;

    iget-object p0, p0, Lr9i;->e:Ljava/lang/Object;

    check-cast p0, Lole;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v0, Lbi;

    const/16 v1, 0x16

    invoke-direct {v0, p0, v1}, Lbi;-><init>(Ljava/lang/Object;B)V

    new-instance v1, Lvpb;

    invoke-direct {v1}, Lvpb;-><init>()V

    new-instance v3, Lorb;

    invoke-direct {v3}, Lorb;-><init>()V

    invoke-virtual {v1, v3}, Lvpb;->a(Ljava/lang/Object;)V

    invoke-virtual {p1}, Lela;->a()Lorb;

    move-result-object p1

    const-string v4, "state"

    invoke-virtual {v3, p1, v4}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object p0, p0, Lole;->a:Ljava/lang/Object;

    check-cast p0, Lqq8;

    invoke-virtual {p0}, Lqq8;->h()Ljava/lang/String;

    move-result-object p1

    const-string v3, "2.0"

    const-string v4, "method"

    const-string v5, "jsonrpc"

    const-string v6, "views.v1.notifyHostStateChanged"

    invoke-static {v5, v3, v4, v6}, Lo18;->j(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorb;

    move-result-object v3

    const-string v4, "params"

    invoke-virtual {v3, v1, v4}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v1, "id"

    invoke-virtual {v3, p1, v1}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    new-instance p1, Lt02;

    invoke-direct {p1, v0, v2}, Lt02;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p0, v3, p1}, Lqq8;->l(Lorb;Lkotlin/jvm/functions/Function1;)V

    return-void

    :pswitch_3c3
    check-cast p0, Lpu1;

    check-cast p1, Ltu1;

    iget-object v0, p1, Ltu1;->a:Lfll;

    iget-object v2, p0, Lpu1;->w:Lbv1;

    iget-object v3, v0, Lfll;->a:Ljava/util/List;

    iget-object v4, v0, Lfll;->b:Lf7j;

    iget-object v5, v0, Lfll;->d:Lg7j;

    iget-boolean v9, v0, Lfll;->e:Z

    iget-object v10, v2, Lbv1;->d:Ljava/util/List;

    check-cast v10, Ljava/util/ArrayList;

    invoke-virtual {v10, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_3e5

    iget-object v11, v2, Lbv1;->f:Ljava/lang/Object;

    check-cast v11, Lg7j;

    if-ne v11, v5, :cond_3e5

    move v11, v8

    goto :goto_3e6

    :cond_3e5
    move v11, v7

    :goto_3e6
    iget-boolean v12, v2, Lbv1;->b:Z

    if-ne v12, v9, :cond_3eb

    move v7, v8

    :cond_3eb
    iput-boolean v9, v2, Lbv1;->b:Z

    iput-object v5, v2, Lbv1;->f:Ljava/lang/Object;

    invoke-virtual {v10}, Ljava/util/ArrayList;->clear()V

    check-cast v3, Ljava/util/Collection;

    invoke-virtual {v10, v3}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    if-eqz v11, :cond_3ff

    iput-object v4, v2, Lbv1;->e:Ljava/lang/Object;

    invoke-virtual {v2}, Landroidx/recyclerview/widget/d;->notifyDataSetChanged()V

    goto :goto_41f

    :cond_3ff
    if-eqz v7, :cond_40a

    sget-object v3, Lf7j;->e:Lf7j;

    invoke-virtual {v10, v3}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    move-result v3

    invoke-virtual {v2, v3}, Landroidx/recyclerview/widget/d;->notifyItemChanged(I)V

    :cond_40a
    iget-object v3, v2, Lbv1;->e:Ljava/lang/Object;

    check-cast v3, Lf7j;

    if-eq v3, v4, :cond_41f

    iget-object v7, v2, Lbv1;->d:Ljava/util/List;

    check-cast v7, Ljava/util/ArrayList;

    invoke-virtual {v7, v3}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    move-result v3

    iput-object v4, v2, Lbv1;->e:Ljava/lang/Object;

    if-le v3, v1, :cond_41f

    invoke-virtual {v2, v3}, Landroidx/recyclerview/widget/d;->notifyItemChanged(I)V

    :cond_41f
    :goto_41f
    iget-object v1, p0, Lpu1;->x:Ldt1;

    iget-object v0, v0, Lfll;->c:Ljava/util/List;

    iget-object v2, v1, Ldt1;->c:Ljava/lang/Object;

    check-cast v2, Ljava/util/ArrayList;

    invoke-virtual {v2, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    invoke-virtual {v2}, Ljava/util/ArrayList;->clear()V

    check-cast v0, Ljava/util/Collection;

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    if-nez v3, :cond_43b

    iput-object v5, v1, Ldt1;->d:Ljava/lang/Object;

    invoke-virtual {v1}, Landroidx/recyclerview/widget/d;->notifyDataSetChanged()V

    goto :goto_43e

    :cond_43b
    invoke-virtual {v1, v5, v8}, Ldt1;->M(Lg7j;Z)V

    :goto_43e
    iget-object v0, p1, Ltu1;->b:Lpxe;

    invoke-virtual {p0}, Lpu1;->H0()Lcl9;

    move-result-object v1

    iget-object v1, v1, Lcl9;->k:Landroid/widget/FrameLayout;

    iget-boolean v2, v0, Lpxe;->a:Z

    if-eqz v2, :cond_44c

    move v2, v8

    goto :goto_44d

    :cond_44c
    move v2, v6

    :goto_44d
    invoke-virtual {v1, v2}, Landroid/view/View;->setVisibility(I)V

    invoke-virtual {p0}, Lpu1;->H0()Lcl9;

    move-result-object v1

    iget-object v1, v1, Lcl9;->j:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    iget-boolean v2, v0, Lpxe;->b:Z

    invoke-virtual {v1, v2}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->t(Z)V

    invoke-virtual {p0}, Lpu1;->H0()Lcl9;

    move-result-object v1

    iget-object v1, v1, Lcl9;->j:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    iget-object v0, v0, Lpxe;->c:Ljava/lang/String;

    invoke-static {v1, v0}, Lv0g;->m(Lcom/opera/android/ui/catalog/widget/OperaListItem;Ljava/lang/String;)V

    iget-boolean v0, p1, Ltu1;->c:Z

    invoke-virtual {p0}, Lpu1;->H0()Lcl9;

    move-result-object v1

    iget-object v1, v1, Lcl9;->g:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    invoke-virtual {v1, v0}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->t(Z)V

    iget-object v0, p1, Ltu1;->d:Lp37;

    sget-object v1, Lb4c;->i:Lb4c;

    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_485

    invoke-virtual {p0}, Lpu1;->H0()Lcl9;

    move-result-object v0

    iget-object v0, v0, Lcl9;->i:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v6}, Landroid/view/View;->setVisibility(I)V

    goto :goto_4ca

    :cond_485
    instance-of v1, v0, Lc4c;

    if-eqz v1, :cond_4f6

    invoke-virtual {p0}, Lpu1;->H0()Lcl9;

    move-result-object v1

    iget-object v1, v1, Lcl9;->i:Landroid/widget/LinearLayout;

    invoke-virtual {v1, v8}, Landroid/view/View;->setVisibility(I)V

    check-cast v0, Lc4c;

    iget-boolean v1, v0, Lc4c;->i:Z

    invoke-virtual {p0}, Lpu1;->H0()Lcl9;

    move-result-object v2

    iget-object v2, v2, Lcl9;->l:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    invoke-virtual {v2, v1}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->t(Z)V

    iget v1, v0, Lc4c;->j:I

    invoke-virtual {p0}, Lpu1;->H0()Lcl9;

    move-result-object v2

    iget-object v2, v2, Lcl9;->c:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    invoke-static {v1, v2}, Lu35;->k(ILcom/opera/android/ui/catalog/widget/OperaListItem;)V

    iget v1, v0, Lc4c;->k:I

    invoke-virtual {p0}, Lpu1;->H0()Lcl9;

    move-result-object v2

    iget-object v2, v2, Lcl9;->o:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    new-instance v3, Lrxh;

    invoke-direct {v3, v1}, Lrxh;-><init>(I)V

    invoke-virtual {v2, v3}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->C(Lpxh;)V

    invoke-virtual {p0}, Lpu1;->H0()Lcl9;

    move-result-object v1

    iget-object v1, v1, Lcl9;->f:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    iget-boolean v0, v0, Lc4c;->l:Z

    if-eqz v0, :cond_4c6

    move v0, v8

    goto :goto_4c7

    :cond_4c6
    move v0, v6

    :goto_4c7
    invoke-virtual {v1, v0}, Landroid/view/View;->setVisibility(I)V

    :goto_4ca
    iget-boolean v0, p1, Ltu1;->e:Z

    invoke-virtual {p0}, Lpu1;->H0()Lcl9;

    move-result-object v1

    iget-object v1, v1, Lcl9;->e:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    if-eqz v0, :cond_4d6

    move v0, v8

    goto :goto_4d7

    :cond_4d6
    move v0, v6

    :goto_4d7
    invoke-virtual {v1, v0}, Landroid/view/View;->setVisibility(I)V

    iget-object p1, p1, Ltu1;->f:Lns1;

    invoke-virtual {p0}, Lpu1;->H0()Lcl9;

    move-result-object v0

    iget-object v0, v0, Lcl9;->d:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    iget-boolean v1, p1, Lns1;->a:Z

    if-eqz v1, :cond_4e7

    move v6, v8

    :cond_4e7
    invoke-virtual {v0, v6}, Landroid/view/View;->setVisibility(I)V

    invoke-virtual {p0}, Lpu1;->H0()Lcl9;

    move-result-object p0

    iget-object p0, p0, Lcl9;->d:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    iget-object p1, p1, Lns1;->b:Lrxh;

    invoke-virtual {p0, p1}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->C(Lpxh;)V

    goto :goto_4f9

    :cond_4f6
    invoke-static {}, Lh9o;->p()V

    :goto_4f9
    return-void

    :pswitch_4fa
    check-cast p0, Lex0;

    check-cast p1, Ljava/util/List;

    iget-object v0, p0, Lex0;->d:Lpde;

    invoke-static {v0, p1}, Lxf8;->F0(Lpde;Ljava/lang/Object;)Z

    iget-object p0, p0, Lex0;->e:Lpde;

    check-cast p1, Ljava/lang/Iterable;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_510
    :goto_510
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_525

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    move-object v3, v1

    check-cast v3, Lc52;

    instance-of v3, v3, Ld52;

    if-nez v3, :cond_510

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_510

    :cond_525
    new-instance p1, Ljava/util/ArrayList;

    invoke-static {v0, v2}, Lk95;->o(Ljava/lang/Iterable;I)I

    move-result v1

    invoke-direct {p1, v1}, Ljava/util/ArrayList;-><init>(I)V

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v1

    :goto_532
    if-ge v8, v1, :cond_545

    invoke-virtual {v0, v8}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    add-int/lit8 v8, v8, 0x1

    check-cast v2, Lc52;

    new-instance v3, Lpw0;

    invoke-direct {v3, v2}, Lpw0;-><init>(Lc52;)V

    invoke-virtual {p1, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_532

    :cond_545
    invoke-static {p0, p1}, Lxf8;->F0(Lpde;Ljava/lang/Object;)Z

    return-void

    :pswitch_549
    check-cast p0, Llx;

    check-cast p1, Ltta;

    iget-object v0, p0, Lab2;->b:Lja2;

    check-cast v0, Lmq;

    iget-object v1, p0, Lab2;->c:Lkze;

    invoke-virtual {v1}, Lekc;->g()Ljava/lang/Object;

    move-result-object v1

    sget-object v2, Lng;->a:Lng;

    invoke-static {v1, v2}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_564

    if-eqz v0, :cond_564

    invoke-virtual {p0, v0, v8}, Llx;->V(Lja2;Z)V

    :cond_564
    iget-object p0, p0, Llx;->k:Lcom/opera/android/favorites/FavoriteGridLinearLayout;

    iget-object v0, p0, Lcom/opera/android/favorites/FavoriteGridLinearLayout;->a:Ltta;

    invoke-static {v0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_573

    iput-object p1, p0, Lcom/opera/android/favorites/FavoriteGridLinearLayout;->a:Ltta;

    invoke-virtual {p0}, Landroid/view/View;->requestLayout()V

    :cond_573
    return-void

    :pswitch_574
    check-cast p0, Luw;

    check-cast p1, Lzw;

    iget-boolean v0, p1, Lzw;->a:Z

    invoke-virtual {p0}, Luw;->H0()Lxk9;

    move-result-object v1

    iget-object v1, v1, Lxk9;->d:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    invoke-virtual {v1, v0}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->t(Z)V

    iget-object p1, p1, Lzw;->b:Lsfe;

    sget-object v0, Ljw;->h:Ljw;

    invoke-virtual {p1, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_5a0

    invoke-virtual {p0}, Luw;->H0()Lxk9;

    move-result-object p1

    iget-object p1, p1, Lxk9;->b:Lcom/opera/android/custom_views/SeparatorView;

    invoke-virtual {p1, v6}, Landroid/view/View;->setVisibility(I)V

    invoke-virtual {p0}, Luw;->H0()Lxk9;

    move-result-object p0

    iget-object p0, p0, Lxk9;->c:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {p0, v6}, Landroid/view/View;->setVisibility(I)V

    goto :goto_5f2

    :cond_5a0
    instance-of v0, p1, Lkw;

    if-eqz v0, :cond_5ef

    invoke-virtual {p0}, Luw;->H0()Lxk9;

    move-result-object v0

    iget-object v0, v0, Lxk9;->b:Lcom/opera/android/custom_views/SeparatorView;

    invoke-virtual {v0, v8}, Landroid/view/View;->setVisibility(I)V

    invoke-virtual {p0}, Luw;->H0()Lxk9;

    move-result-object v0

    iget-object v0, v0, Lxk9;->c:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v0, v8}, Landroid/view/View;->setVisibility(I)V

    iget-object v0, p0, Luw;->w:Lyw;

    if-nez v0, :cond_5e7

    new-instance v0, Lyw;

    new-instance v1, Lwth;

    const/4 v2, 0x6

    invoke-direct {v1, p0, v2}, Lwth;-><init>(Ljava/lang/Object;B)V

    invoke-static {}, Li0l;->g()Z

    move-result v2

    invoke-direct {v0, v1, v2}, Lyw;-><init>(Lwth;Z)V

    iput-object v0, p0, Luw;->w:Lyw;

    invoke-virtual {p0}, Luw;->H0()Lxk9;

    move-result-object v1

    iget-object v1, v1, Lxk9;->c:Landroidx/recyclerview/widget/RecyclerView;

    iget-object v2, p0, Luw;->w:Lyw;

    invoke-virtual {v1, v2}, Landroidx/recyclerview/widget/RecyclerView;->y0(Landroidx/recyclerview/widget/d;)V

    invoke-virtual {p0}, Luw;->H0()Lxk9;

    move-result-object v1

    iget-object v1, v1, Lxk9;->c:Landroidx/recyclerview/widget/RecyclerView;

    new-instance v2, Landroidx/recyclerview/widget/LinearLayoutManager;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    invoke-direct {v2}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>()V

    invoke-virtual {v1, v2}, Landroidx/recyclerview/widget/RecyclerView;->C0(Landroidx/recyclerview/widget/f;)V

    :cond_5e7
    check-cast p1, Lkw;

    iget-object p0, p1, Lkw;->h:Ljava/util/ArrayList;

    invoke-virtual {v0, p0}, Ldt1;->K(Ljava/util/Collection;)V

    goto :goto_5f2

    :cond_5ef
    invoke-static {}, Lh9o;->p()V

    :goto_5f2
    return-void

    :pswitch_5f3
    check-cast p0, Lbv;

    check-cast p1, Lnnh;

    iget-boolean p1, p1, Lnnh;->a:Z

    if-nez p1, :cond_602

    iget-object p0, p0, Lbv;->l:Lro9;

    sget-object p1, Lvr0;->o:Lvr0;

    invoke-virtual {p0, p1}, Lro9;->Z(Lvr0;)V

    :cond_602
    return-void

    :pswitch_603
    check-cast p0, Lru;

    check-cast p1, Ljava/util/List;

    invoke-virtual {p0}, Lru;->H0()Ltab;

    move-result-object v0

    iput-object p1, v0, Ltab;->d:Ljava/util/List;

    iput-object p1, v0, Ltab;->e:Ljava/util/List;

    iget-boolean p1, p0, Lru;->C:Z

    if-nez p1, :cond_688

    iget-object p1, p0, Lru;->v:Lua7;

    invoke-virtual {p1}, Lua7;->p()Ln37;

    move-result-object p1

    check-cast p1, Lku;

    iget-object p1, p1, Lku;->a:Lj2g;

    if-eqz p1, :cond_688

    iget-object v0, p1, Lj2g;->a:Ljava/lang/String;

    iget-boolean p1, p1, Lj2g;->b:Z

    if-eqz p1, :cond_67d

    invoke-virtual {p0}, Lru;->J0()Lxu;

    move-result-object p1

    iget-object p1, p1, Lxu;->d:Lode;

    invoke-virtual {p1}, Lekc;->g()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/util/List;

    if-eqz p1, :cond_688

    check-cast p1, Ljava/lang/Iterable;

    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_639
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_64f

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    move-object v2, v1

    check-cast v2, Lwt1;

    iget-object v2, v2, Lwt1;->c:Ljava/lang/String;

    invoke-static {v2, v0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_639

    move-object v5, v1

    :cond_64f
    check-cast v5, Lwt1;

    if-eqz v5, :cond_688

    invoke-virtual {p0}, Lru;->J0()Lxu;

    move-result-object p1

    invoke-virtual {p0}, Lru;->H0()Ltab;

    move-result-object v0

    invoke-virtual {v0, v5}, Ltab;->a(Lzt1;)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    iget-object p1, p1, Lxu;->e:Lode;

    new-instance v1, Lwu;

    invoke-direct {v1, v5, v0}, Lwu;-><init>(Lzt1;Landroid/graphics/drawable/Drawable;)V

    invoke-static {p1, v1}, Lxf8;->E0(Lode;Ljava/lang/Object;)Z

    invoke-virtual {p0}, Lru;->H0()Ltab;

    move-result-object p1

    iget-object v0, v5, Lwt1;->b:Ljava/lang/String;

    iget-object p1, p1, Ltab;->f:Lzyk;

    invoke-virtual {p1}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lsab;

    invoke-virtual {p1, v0}, Landroid/widget/Filter;->filter(Ljava/lang/CharSequence;)V

    iput-boolean v7, p0, Lru;->C:Z

    goto :goto_688

    :cond_67d
    invoke-virtual {p0}, Lru;->I0()Lhm9;

    move-result-object p1

    iget-object p1, p1, Lhm9;->b:Lcom/google/android/material/textfield/MaterialAutoCompleteTextView;

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iput-boolean v7, p0, Lru;->C:Z

    :cond_688
    :goto_688
    return-void

    :pswitch_689
    check-cast p0, Lss;

    check-cast p1, Ljava/util/List;

    iget-object v0, p0, Lss;->t:Lks;

    sget-object v1, Lss;->v:[Lxtb;

    aget-object v1, v1, v8

    invoke-virtual {v0, p0}, Lqr;->b(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Les;

    invoke-virtual {p0, p1}, Lygc;->H(Ljava/util/List;)V

    return-void

    :pswitch_69d
    check-cast p0, Lxb;

    check-cast p1, Lipf;

    iget-object p0, p0, Lxb;->e:Ljze;

    new-instance v0, Ldpf;

    invoke-direct {v0, p1}, Ldpf;-><init>(Lipf;)V

    invoke-virtual {p0, v0}, Ljze;->r(Ljava/lang/Object;)V

    return-void

    :pswitch_6ac
    check-cast p0, Lp9;

    check-cast p1, Lr9;

    iget-object v0, p1, Lr9;->a:Lndo;

    sget-object v2, Lp9;->x:Lixh;

    invoke-virtual {p0}, Lp9;->H0()Lvk9;

    move-result-object v4

    iget-object v4, v4, Lvk9;->e:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    iget-boolean v5, v0, Lndo;->a:Z

    invoke-virtual {v4, v5}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->t(Z)V

    invoke-virtual {p0}, Lp9;->H0()Lvk9;

    move-result-object v4

    iget-object v4, v4, Lvk9;->o:Lcom/google/android/material/slider/Slider;

    iget v6, v0, Lndo;->b:F

    invoke-virtual {v4, v6}, Lcom/google/android/material/slider/Slider;->C0(F)V

    invoke-virtual {p0}, Lp9;->H0()Lvk9;

    move-result-object v4

    iget-object v4, v4, Lvk9;->i:Lcom/opera/android/custom_views/StylingTextView;

    iget v6, v0, Lndo;->c:I

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v9, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v10, "%"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v4, v9}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {p0}, Lp9;->H0()Lvk9;

    move-result-object v4

    iget-object v4, v4, Lvk9;->o:Lcom/google/android/material/slider/Slider;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    filled-new-array {v6}, [Ljava/lang/Object;

    move-result-object v6

    const v9, 0x7f1415bb

    invoke-virtual {p0, v9, v6}, Landroidx/fragment/app/Fragment;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v6}, Landroid/view/View;->setContentDescription(Ljava/lang/CharSequence;)V

    invoke-virtual {p0}, Lp9;->H0()Lvk9;

    move-result-object v4

    iget-object v4, v4, Lvk9;->j:Lcom/opera/android/custom_views/StylingTextView;

    iget v6, v0, Lndo;->d:F

    invoke-virtual {v4, v3, v6}, Landroid/widget/TextView;->setTextSize(IF)V

    invoke-virtual {p0}, Lp9;->H0()Lvk9;

    move-result-object v4

    iget-object v4, v4, Lvk9;->n:Lcom/opera/android/custom_views/StylingTextView;

    iget v6, v0, Lndo;->f:F

    invoke-virtual {v4, v3, v6}, Landroid/widget/TextView;->setTextSize(IF)V

    invoke-virtual {p0}, Lp9;->H0()Lvk9;

    move-result-object v4

    iget-object v4, v4, Lvk9;->k:Landroid/widget/TextView;

    iget v6, v0, Lndo;->e:F

    invoke-virtual {v4, v3, v6}, Landroid/widget/TextView;->setTextSize(IF)V

    invoke-virtual {p0}, Lp9;->H0()Lvk9;

    move-result-object v3

    iget-object v3, v3, Lvk9;->l:Landroid/widget/LinearLayout;

    invoke-virtual {v3}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v4

    check-cast v4, Landroid/view/ViewGroup$MarginLayoutParams;

    invoke-virtual {v3}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v6

    check-cast v6, Landroid/view/ViewGroup;

    const/high16 v9, 0x40000000    # 2.0f

    const/4 v10, -0x2

    if-nez v5, :cond_789

    iput v1, v4, Landroid/view/ViewGroup$MarginLayoutParams;->width:I

    invoke-virtual {v6}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    iput v10, v1, Landroid/view/ViewGroup$LayoutParams;->height:I

    invoke-virtual {v3, v4}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    invoke-virtual {v6}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v2, v1}, Ly7h;->k(Landroid/content/Context;)I

    move-result v1

    invoke-virtual {v6}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v5

    check-cast v5, Landroid/view/ViewGroup$MarginLayoutParams;

    iget v7, v5, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    iget v5, v5, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    add-int/2addr v7, v5

    invoke-virtual {v6}, Landroid/view/View;->getWidth()I

    move-result v5

    invoke-static {v5, v9}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v5

    invoke-virtual {v6, v5, v8}, Landroid/view/View;->measure(II)V

    invoke-virtual {v6}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v5

    invoke-virtual {v6}, Landroid/view/View;->getMeasuredHeight()I

    move-result v10

    sub-int/2addr v1, v7

    invoke-static {v10, v1}, Ljava/lang/Math;->min(II)I

    move-result v1

    iput v1, v5, Landroid/view/ViewGroup$LayoutParams;->height:I

    invoke-virtual {v6}, Landroid/view/View;->getWidth()I

    move-result v1

    if-lez v1, :cond_785

    iget v5, v4, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    sub-int/2addr v1, v5

    iget v5, v4, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    sub-int/2addr v1, v5

    int-to-float v1, v1

    const v5, 0x3f99999a    # 1.2f

    mul-float/2addr v1, v5

    float-to-int v1, v1

    iput v1, v4, Landroid/view/ViewGroup$MarginLayoutParams;->width:I

    invoke-virtual {v3, v4}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    :cond_785
    invoke-virtual {v6, v8}, Landroid/view/ViewGroup;->setClipChildren(Z)V

    goto :goto_797

    :cond_789
    invoke-virtual {v6}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v5

    iput v10, v5, Landroid/view/ViewGroup$LayoutParams;->height:I

    iput v1, v4, Landroid/view/ViewGroup$MarginLayoutParams;->width:I

    invoke-virtual {v3, v4}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    invoke-virtual {v6, v7}, Landroid/view/ViewGroup;->setClipChildren(Z)V

    :goto_797
    iget v0, v0, Lndo;->g:F

    new-instance v1, Lixh;

    invoke-direct {v1, v0}, Lixh;-><init>(F)V

    invoke-virtual {p0}, Lp9;->H0()Lvk9;

    move-result-object v0

    iget-object v0, v0, Lvk9;->a:Landroid/widget/LinearLayout;

    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v1, v0}, Ly7h;->k(Landroid/content/Context;)I

    move-result v0

    invoke-virtual {p0}, Lp9;->H0()Lvk9;

    move-result-object v1

    iget-object v1, v1, Lvk9;->m:Landroid/widget/ImageView;

    invoke-virtual {p0}, Lp9;->H0()Lvk9;

    move-result-object v3

    iget-object v3, v3, Lvk9;->m:Landroid/widget/ImageView;

    invoke-virtual {v3}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v3

    iput v0, v3, Landroid/view/ViewGroup$LayoutParams;->width:I

    iput v0, v3, Landroid/view/ViewGroup$LayoutParams;->height:I

    invoke-virtual {v1, v3}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    invoke-virtual {p0}, Lp9;->H0()Lvk9;

    move-result-object v0

    iget-object v0, v0, Lvk9;->f:Landroid/widget/FrameLayout;

    invoke-virtual {v0}, Landroid/view/View;->getWidth()I

    move-result v1

    if-lez v1, :cond_7f1

    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-virtual {v2, v3}, Ly7h;->k(Landroid/content/Context;)I

    move-result v2

    invoke-static {v1, v9}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v1

    const/high16 v3, -0x80000000

    invoke-static {v2, v3}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v2

    invoke-virtual {v0, v1, v2}, Landroid/view/View;->measure(II)V

    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    invoke-virtual {v0}, Landroid/view/View;->getMeasuredHeight()I

    move-result v2

    iput v2, v1, Landroid/view/ViewGroup$LayoutParams;->height:I

    invoke-virtual {v0, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    :cond_7f1
    iget-boolean v0, p1, Lr9;->b:Z

    invoke-virtual {p0}, Lp9;->H0()Lvk9;

    move-result-object v1

    iget-object v1, v1, Lvk9;->c:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    invoke-virtual {v1, v0}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->t(Z)V

    iget p1, p1, Lr9;->c:I

    invoke-virtual {p0}, Lp9;->H0()Lvk9;

    move-result-object p0

    iget-object p0, p0, Lvk9;->b:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    invoke-static {p1, p0}, Lu35;->k(ILcom/opera/android/ui/catalog/widget/OperaListItem;)V

    return-void

    :pswitch_data_808
    .packed-switch 0x0
        :pswitch_6ac
        :pswitch_69d
        :pswitch_689
        :pswitch_603
        :pswitch_5f3
        :pswitch_574
        :pswitch_549
        :pswitch_4fa
        :pswitch_3c3
        :pswitch_372
        :pswitch_368
        :pswitch_35a
        :pswitch_352
        :pswitch_320
        :pswitch_314
        :pswitch_30c
        :pswitch_2c4
        :pswitch_2ba
        :pswitch_291
        :pswitch_172
        :pswitch_16a
        :pswitch_131
        :pswitch_116
        :pswitch_9c
        :pswitch_51
        :pswitch_49
        :pswitch_3a
        :pswitch_32
        :pswitch_1c
    .end packed-switch
.end method

.class public final synthetic Lqzg;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lf7f;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;B)V
    .registers 3

    iput-byte p2, p0, Lqzg;->a:B

    iput-object p1, p0, Lqzg;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final d0(Ljava/lang/Object;)V
    .registers 14

    iget-byte v0, p0, Lqzg;->a:B

    const/16 v1, 0x16

    const/4 v2, 0x3

    const/4 v3, 0x0

    const/4 v4, 0x2

    const/16 v5, 0x8

    const/4 v6, 0x1

    const/4 v7, 0x0

    iget-object p0, p0, Lqzg;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_72a

    check-cast p0, Lplk;

    check-cast p1, Ljava/lang/Float;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p0}, Lplk;->u()V

    return-void

    :pswitch_1b
    check-cast p0, Lx2l;

    check-cast p1, Ls2l;

    iget-object p0, p0, Lx2l;->m:Lh5k;

    invoke-virtual {p0}, Lh5k;->f()V

    return-void

    :pswitch_25
    check-cast p0, Lsyk;

    check-cast p1, Lpkj;

    sget-object v0, Lpkj;->a:Lpkj;

    if-ne p1, v0, :cond_a4

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->requireContext()Landroid/content/Context;

    move-result-object p1

    sget-object v0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    check-cast p1, Lcom/opera/android/OperaApplication;

    invoke-virtual {p1}, Lcom/opera/android/OperaApplication;->o()Lnr8;

    move-result-object p1

    move-object v0, p1

    check-cast v0, Lcom/opera/android/favorites/e;

    iget-object v0, v0, Lcom/opera/android/favorites/e;->f:Lcom/opera/android/favorites/b;

    check-cast p1, Lcom/opera/android/favorites/e;

    iget-object p1, p1, Lcom/opera/android/favorites/e;->g:Lcom/opera/android/favorites/b;

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v2

    const/4 v3, -0x6

    invoke-virtual {v2, v4, v3}, Ljava/util/Calendar;->add(II)V

    invoke-virtual {v2}, Ljava/util/Calendar;->getTime()Ljava/util/Date;

    move-result-object v2

    move v3, v7

    :goto_58
    iget-object v4, p1, Ltq8;->e:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v4

    if-ge v3, v4, :cond_78

    invoke-virtual {p1, v3}, Ltq8;->u(I)Lhq8;

    move-result-object v4

    check-cast v4, Ltq8;

    if-eq v4, v0, :cond_75

    invoke-virtual {v4}, Ltq8;->z()Ljava/util/Date;

    move-result-object v5

    invoke-virtual {v5, v2}, Ljava/util/Date;->before(Ljava/util/Date;)Z

    move-result v5

    if-eqz v5, :cond_75

    invoke-virtual {v1, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_75
    add-int/lit8 v3, v3, 0x1

    goto :goto_58

    :cond_78
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result p1

    :goto_7c
    if-ge v7, p1, :cond_90

    invoke-virtual {v1, v7}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    add-int/lit8 v7, v7, 0x1

    check-cast v0, Ltq8;

    invoke-virtual {v0}, Lhq8;->e()J

    move-result-wide v2

    sget-object v0, Lcom/opera/android/favorites/FavoritesBridge;->a:Li7f;

    invoke-static {v2, v3}, LJ/N;->Mw8yLl_M(J)V

    goto :goto_7c

    :cond_90
    iget-object p0, p0, Lltl;->n:Lqm9;

    new-instance p1, Lglj;

    new-instance v0, Lrxh;

    const v1, 0x7f140bbe

    invoke-direct {v0, v1}, Lrxh;-><init>(I)V

    const/16 v1, 0x9c4

    invoke-direct {p1, v0, v1}, Lglj;-><init>(Lpxh;I)V

    invoke-virtual {p0, p1}, Lqm9;->f(Lo93;)V

    :cond_a4
    return-void

    :pswitch_a5
    check-cast p0, Luxk;

    check-cast p1, Lvxk;

    sget-object v0, Luxk;->w:[Lxtb;

    iget-boolean v0, p1, Lvxk;->a:Z

    iget-boolean v1, p1, Lvxk;->d:Z

    invoke-virtual {p0}, Luxk;->H0()Lwm9;

    move-result-object v2

    iget-object v2, v2, Lwm9;->i:Llwk;

    iget-object v2, v2, Llwk;->b:Lcom/opera/android/ui/catalog/widget/OperaIconedMessage;

    if-eqz v0, :cond_bb

    move v0, v7

    goto :goto_bc

    :cond_bb
    move v0, v5

    :goto_bc
    invoke-virtual {v2, v0}, Landroid/view/View;->setVisibility(I)V

    iget-boolean v0, p1, Lvxk;->c:Z

    invoke-virtual {p0}, Luxk;->H0()Lwm9;

    move-result-object v2

    iget-object v2, v2, Lwm9;->e:Llwk;

    iget-object v2, v2, Llwk;->b:Lcom/opera/android/ui/catalog/widget/OperaIconedMessage;

    if-eqz v0, :cond_cd

    move v0, v7

    goto :goto_ce

    :cond_cd
    move v0, v5

    :goto_ce
    invoke-virtual {v2, v0}, Landroid/view/View;->setVisibility(I)V

    iget-boolean v0, p1, Lvxk;->b:Z

    invoke-virtual {p0}, Luxk;->H0()Lwm9;

    move-result-object v2

    iget-object v2, v2, Lwm9;->g:Llwk;

    iget-object v2, v2, Llwk;->b:Lcom/opera/android/ui/catalog/widget/OperaIconedMessage;

    if-eqz v0, :cond_de

    move v5, v7

    :cond_de
    invoke-virtual {v2, v5}, Landroid/view/View;->setVisibility(I)V

    invoke-virtual {p0}, Luxk;->H0()Lwm9;

    move-result-object v0

    iget-object v0, v0, Lwm9;->h:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    invoke-virtual {v0, v1}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->t(Z)V

    iget-boolean v0, p1, Lvxk;->f:Z

    iget-boolean v2, p1, Lvxk;->e:Z

    invoke-virtual {p0}, Luxk;->H0()Lwm9;

    move-result-object v3

    iget-object v3, v3, Lwm9;->c:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    invoke-virtual {v3, v0}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->setEnabled(Z)V

    invoke-virtual {p0}, Luxk;->H0()Lwm9;

    move-result-object v0

    iget-object v0, v0, Lwm9;->c:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    invoke-virtual {v0, v2}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->t(Z)V

    iget-object v0, p1, Lvxk;->h:Ljava/util/List;

    invoke-virtual {p0}, Luxk;->H0()Lwm9;

    move-result-object v2

    iget-object v2, v2, Lwm9;->d:Landroid/widget/LinearLayout;

    check-cast v0, Ljava/lang/Iterable;

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_10e
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_199

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Loe6;

    new-instance v4, Lpqh;

    invoke-direct {v4}, Ljava/lang/Object;-><init>()V

    iget-object v5, v3, Loe6;->a:Lne6;

    iget v6, v5, Lne6;->a:I

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v2, v6}, Landroid/view/View;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object v6

    iput-object v6, v4, Lpqh;->a:Ljava/lang/Object;

    if-nez v6, :cond_16c

    invoke-virtual {v2}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v6

    invoke-static {v6}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v6

    const v8, 0x7f0d03e7

    invoke-virtual {v6, v8, v2, v7}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v6

    invoke-virtual {v2, v6}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    if-eqz v6, :cond_166

    check-cast v6, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    iput-object v6, v4, Lpqh;->a:Ljava/lang/Object;

    iget v8, v3, Loe6;->c:I

    invoke-virtual {v6, v8}, Landroidx/constraintlayout/widget/ConstraintLayout;->setId(I)V

    iget-object v6, v4, Lpqh;->a:Ljava/lang/Object;

    check-cast v6, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    iget v8, v5, Lne6;->a:I

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    invoke-virtual {v6, v8}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    iget-object v6, v4, Lpqh;->a:Ljava/lang/Object;

    check-cast v6, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    new-instance v8, Lvdi;

    const/4 v9, 0x6

    invoke-direct {v8, p0, v3, v4, v9}, Lvdi;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    iput-object v8, v6, Lcom/opera/android/ui/catalog/widget/OperaListItem;->u:Lvlf;

    goto :goto_16c

    :cond_166
    const-string p0, "rootView"

    invoke-static {p0}, Lt3p;->q(Ljava/lang/String;)V

    goto :goto_1a4

    :cond_16c
    :goto_16c
    iget-object v6, v4, Lpqh;->a:Ljava/lang/Object;

    check-cast v6, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    invoke-virtual {v2}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v8

    iget v9, v3, Loe6;->d:I

    if-eqz v9, :cond_17d

    invoke-virtual {v8, v9}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v5

    goto :goto_17f

    :cond_17d
    iget-object v5, v5, Lne6;->b:Ljava/lang/String;

    :goto_17f
    new-instance v8, Lqxh;

    invoke-direct {v8, v5}, Lqxh;-><init>(Ljava/lang/CharSequence;)V

    invoke-virtual {v6, v8}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->E(Lpxh;)V

    iget-object v5, v4, Lpqh;->a:Ljava/lang/Object;

    check-cast v5, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    iget-boolean v3, v3, Loe6;->b:Z

    invoke-virtual {v5, v3}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->t(Z)V

    iget-object v3, v4, Lpqh;->a:Ljava/lang/Object;

    check-cast v3, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    invoke-virtual {v3, v1}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->setEnabled(Z)V

    goto/16 :goto_10e

    :cond_199
    iget-boolean p1, p1, Lvxk;->g:Z

    invoke-virtual {p0}, Luxk;->H0()Lwm9;

    move-result-object p0

    iget-object p0, p0, Lwm9;->b:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    invoke-virtual {p0, p1}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->setEnabled(Z)V

    :goto_1a4
    return-void

    :pswitch_1a5
    check-cast p0, Lhqk;

    check-cast p1, Llpk;

    if-eqz p1, :cond_1b3

    iget-object p1, p1, Llpk;->c:Ljava/util/ArrayList;

    invoke-virtual {p1}, Ljava/util/ArrayList;->isEmpty()Z

    move-result p1

    if-eqz p1, :cond_1b4

    :cond_1b3
    move v6, v7

    :cond_1b4
    iput-boolean v6, p0, Lhqk;->B:Z

    return-void

    :pswitch_1b7
    check-cast p0, Lbok;

    check-cast p1, Lvr8;

    iget-object p0, p0, Lbok;->h:Lkf;

    iget-object p0, p0, Lkf;->c:Ljava/lang/Object;

    check-cast p0, Landroid/widget/TextView;

    iget-object v0, p1, Lvr8;->b:Llaj;

    invoke-virtual {v0, p0}, Llaj;->a(Landroid/widget/TextView;)V

    iget-object p1, p1, Lvr8;->f:Lcxh;

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcxh;->a(Landroid/content/Context;)I

    move-result p1

    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setTextColor(I)V

    return-void

    :pswitch_1d4
    check-cast p0, Lq59;

    check-cast p1, Luvg;

    sget-object v0, Luvg;->g:Luvg;

    if-eq p1, v0, :cond_1fe

    sget-object v0, Luvg;->d:Luvg;

    if-ne p1, v0, :cond_1e2

    move p1, v6

    goto :goto_1e3

    :cond_1e2
    move p1, v7

    :goto_1e3
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    iput-object p1, p0, Lq59;->d:Ljava/lang/Object;

    iget-object v0, p0, Lq59;->c:Ljava/lang/Object;

    check-cast v0, Lydn;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    if-eqz p1, :cond_1fb

    iget-boolean p0, p0, Lq59;->b:Z

    if-eqz p0, :cond_1fe

    invoke-virtual {v0, v6}, Lydn;->E(Z)V

    goto :goto_1fe

    :cond_1fb
    invoke-virtual {v0, v7}, Lydn;->E(Z)V

    :cond_1fe
    :goto_1fe
    return-void

    :pswitch_1ff
    check-cast p0, Lgmk;

    check-cast p1, Lwvg;

    iget-object p0, p0, Lgmk;->a:Lkze;

    invoke-static {p1}, Luvg;->d(Lwvg;)Luvg;

    move-result-object p1

    invoke-virtual {p0, p1}, Lekc;->r(Ljava/lang/Object;)V

    return-void

    :pswitch_20d
    check-cast p0, Lghf;

    check-cast p1, Lllk;

    iget-object v0, p1, Lllk;->a:Lmlk;

    iget-boolean v1, v0, Lmlk;->a:Z

    if-eqz v1, :cond_270

    iget-boolean v0, v0, Lmlk;->b:Z

    if-nez v0, :cond_270

    iget-boolean v0, p1, Lllk;->b:Z

    if-nez v0, :cond_270

    iget-boolean p1, p1, Lllk;->c:Z

    if-eqz p1, :cond_27b

    iget-object p1, p0, Lghf;->d:Ljava/lang/Object;

    check-cast p1, Lgkj;

    if-nez p1, :cond_27b

    new-instance p1, Lrxh;

    const v0, 0x7f1413c3

    invoke-direct {p1, v0}, Lrxh;-><init>(I)V

    new-instance v0, Ltxi;

    const/16 v1, 0x14

    invoke-direct {v0, p0, v1}, Ltxi;-><init>(Ljava/lang/Object;B)V

    new-instance v1, Lgkj;

    invoke-direct {v1, v7, v7}, Lnz0;-><init>(ZZ)V

    iput-object v3, v1, Lgkj;->a:Ljava/lang/String;

    iput-object v3, v1, Lgkj;->b:Ljava/lang/String;

    iput-object v3, v1, Lgkj;->c:Ljava/lang/String;

    iput-object v3, v1, Lgkj;->d:Ljava/lang/CharSequence;

    iput-object v3, v1, Lgkj;->e:Lekj;

    iput-object v0, v1, Lgkj;->f:Lfkj;

    iput-object v3, v1, Lgkj;->g:Lqp2;

    iput-object v3, v1, Lgkj;->h:Ldkj;

    iput-object v3, v1, Lgkj;->i:Ldkj;

    iput-object v3, v1, Lgkj;->j:Lql;

    const v0, 0x7f140bbb

    iput v0, v1, Lgkj;->k:I

    iput v7, v1, Lgkj;->l:I

    const v0, 0x7f1413dc

    iput v0, v1, Lgkj;->m:I

    iput-boolean v6, v1, Lgkj;->n:Z

    iput-object p1, v1, Lgkj;->o:Lpxh;

    iput-object v1, p0, Lghf;->d:Ljava/lang/Object;

    iget-object p0, p0, Lghf;->c:Ljava/lang/Object;

    check-cast p0, Lz77;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object p1, Lijm;->b:Lijm;

    invoke-virtual {p0, v1, p1}, Lr22;->b(Ljjm;Lijm;)V

    goto :goto_27b

    :cond_270
    iget-object p0, p0, Lghf;->d:Ljava/lang/Object;

    check-cast p0, Lgkj;

    if-eqz p0, :cond_27b

    sget-object p1, Lhjm;->b:Lhjm;

    invoke-interface {p0, p1}, Ljjm;->finish(Lhjm;)V

    :cond_27b
    :goto_27b
    return-void

    :pswitch_27c
    check-cast p0, Lcom/opera/android/StatusBarDrawerAppBarLayout;

    check-cast p1, Lg3o;

    sget v0, Lcom/opera/android/StatusBarDrawerAppBarLayout;->H:I

    sget-boolean v0, Lpjm;->a:Z

    if-eqz v0, :cond_293

    const/16 v0, 0x207

    iget-object p1, p1, Lg3o;->a:Ld3o;

    invoke-virtual {p1, v0}, Ld3o;->i(I)Lr9b;

    move-result-object p1

    iget p1, p1, Lr9b;->b:I

    invoke-virtual {p0, v7, p1, v7, v7}, Landroid/view/View;->setPadding(IIII)V

    :cond_293
    return-void

    :pswitch_294
    check-cast p0, Lkak;

    iget-object p1, p0, Lkak;->b:Lekc;

    invoke-virtual {p1}, Lekc;->g()Ljava/lang/Object;

    move-result-object p1

    if-eqz p1, :cond_2a3

    iget-object p0, p0, Lkak;->c:Ljak;

    invoke-interface {p0, p1}, Ljak;->y(Ljava/lang/Object;)V

    :cond_2a3
    return-void

    :pswitch_2a4
    check-cast p0, Lshf;

    check-cast p1, Lkl5;

    iget-object p1, p0, Lshf;->c:Ljava/lang/Object;

    check-cast p1, Lpde;

    invoke-virtual {p0}, Lshf;->k()I

    move-result p0

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    invoke-static {p1, p0}, Lxf8;->F0(Lpde;Ljava/lang/Object;)Z

    return-void

    :pswitch_2b8
    check-cast p0, La7k;

    check-cast p1, Lkl5;

    invoke-virtual {p0}, Lu5k;->A()V

    return-void

    :pswitch_2c0
    check-cast p0, Lne5;

    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p0}, Lne5;->V()V

    return-void

    :pswitch_2cb
    check-cast p0, Lcom/jensdriller/libs/undobar/MaxWidthLinearLayout;

    check-cast p1, Ll5k;

    iget p1, p1, Ll5k;->b:I

    invoke-static {p1, p0}, Lp37;->t0(ILandroid/view/View;)V

    return-void

    :pswitch_2d5
    check-cast p0, Lcu5;

    check-cast p1, Ll5k;

    iget-object v0, p0, Lcu5;->d:Lq5g;

    iget-object v1, v0, Lq5g;->d:Ljava/lang/Object;

    check-cast v1, Lcom/opera/android/widget/spotlightcarousel/SpotlightCarouselRecyclerView;

    iget v2, p1, Ll5k;->a:I

    iget p0, p0, Lcu5;->g:I

    invoke-virtual {v1, v2, p0, v2, p0}, Landroid/view/View;->setPadding(IIII)V

    iget-object p0, v0, Lq5g;->c:Ljava/lang/Object;

    check-cast p0, Landroid/widget/FrameLayout;

    iget p1, p1, Ll5k;->a:I

    invoke-virtual {p0}, Landroid/view/View;->getPaddingTop()I

    move-result v0

    invoke-virtual {p0}, Landroid/view/View;->getPaddingBottom()I

    move-result v1

    invoke-virtual {p0, p1, v0, p1, v1}, Landroid/view/View;->setPadding(IIII)V

    return-void

    :pswitch_2f8
    check-cast p0, Lr5k;

    check-cast p1, Lf6k;

    if-eqz p1, :cond_319

    iget-object p1, p1, Lf6k;->a:Lzch;

    instance-of v0, p1, Lg6k;

    if-eqz v0, :cond_30e

    iget-object p0, p0, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    check-cast p1, Lg6k;

    iget p1, p1, Lg6k;->a:I

    invoke-static {p1, p0}, Lp37;->l0(ILandroid/view/View;)V

    goto :goto_319

    :cond_30e
    sget-object p0, Lh6k;->a:Lh6k;

    invoke-virtual {p1, p0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_319

    invoke-static {}, Lh9o;->p()V

    :cond_319
    :goto_319
    return-void

    :pswitch_31a
    check-cast p0, Lmwj;

    check-cast p1, Leyj;

    invoke-virtual {p0}, Lmwj;->a()V

    return-void

    :pswitch_322
    check-cast p0, Lfsj;

    check-cast p1, Ljava/util/Set;

    invoke-virtual {p0}, Lfsj;->b()V

    return-void

    :pswitch_32a
    check-cast p0, Looj;

    check-cast p1, Lyoj;

    iget-object p0, p0, Looj;->w:Lpoj;

    iget-object p0, p0, Lpoj;->m:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    iget-boolean p1, p1, Lyoj;->a:Z

    if-eqz p1, :cond_337

    move v5, v7

    :cond_337
    invoke-virtual {p0, v5}, Landroid/view/View;->setVisibility(I)V

    return-void

    :pswitch_33b
    check-cast p0, Ldaj;

    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p0}, Ldaj;->g()V

    return-void

    :pswitch_346
    check-cast p0, Lk6j;

    check-cast p1, Lt9j;

    sget-object v0, Lk6j;->x:[Lxtb;

    iget-object v0, p1, Lt9j;->b:Lg52;

    invoke-virtual {p0}, Lk6j;->H0()Lpm9;

    move-result-object v1

    iget-object v1, v1, Lpm9;->g:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    iget-boolean v2, v0, Lg52;->a:Z

    if-eqz v2, :cond_35a

    move v3, v7

    goto :goto_35b

    :cond_35a
    move v3, v5

    :goto_35b
    invoke-virtual {v1, v3}, Landroid/view/View;->setVisibility(I)V

    if-eqz v2, :cond_36a

    iget-boolean v2, v0, Lg52;->b:Z

    invoke-virtual {v1, v2}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->t(Z)V

    iget v0, v0, Lg52;->c:I

    invoke-static {v0, v1}, Lu35;->k(ILcom/opera/android/ui/catalog/widget/OperaListItem;)V

    :cond_36a
    iget-object v0, p1, Lt9j;->c:Ljgn;

    iget-boolean v1, v0, Ljgn;->a:Z

    invoke-virtual {p0}, Lk6j;->H0()Lpm9;

    move-result-object v2

    iget-object v2, v2, Lpm9;->t:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    if-eqz v1, :cond_378

    move v3, v7

    goto :goto_379

    :cond_378
    move v3, v5

    :goto_379
    invoke-virtual {v2, v3}, Landroid/view/View;->setVisibility(I)V

    if-eqz v1, :cond_39c

    iget-boolean v1, v0, Ljgn;->b:Z

    invoke-virtual {v2, v1}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->t(Z)V

    iget v1, v0, Ljgn;->c:I

    new-instance v3, Lrxh;

    invoke-direct {v3, v1}, Lrxh;-><init>(I)V

    invoke-virtual {v2, v3}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->E(Lpxh;)V

    iget v1, v0, Ljgn;->d:I

    invoke-static {v1, v2}, Lu35;->k(ILcom/opera/android/ui/catalog/widget/OperaListItem;)V

    iget v0, v0, Ljgn;->e:I

    new-instance v1, Ldxh;

    invoke-direct {v1, v0}, Ldxh;-><init>(I)V

    invoke-virtual {v2, v1}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->D(Lcxh;)V

    :cond_39c
    iget-object v0, p1, Lt9j;->d:Lyc6;

    invoke-virtual {p0}, Lk6j;->H0()Lpm9;

    move-result-object v1

    iget-object v1, v1, Lpm9;->i:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    iget-boolean v2, v0, Lyc6;->a:Z

    invoke-virtual {v1, v2}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->t(Z)V

    iget v2, v0, Lyc6;->c:I

    invoke-virtual {v1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v3

    iget-wide v8, v0, Lyc6;->b:J

    invoke-static {v8, v9, v3}, Laik;->h(JLandroid/content/Context;)Ljava/lang/String;

    move-result-object v3

    filled-new-array {v3}, [Ljava/lang/Object;

    move-result-object v3

    new-instance v4, Lsxh;

    invoke-direct {v4, v2, v3}, Lsxh;-><init>(I[Ljava/lang/Object;)V

    invoke-virtual {v1, v4}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->C(Lpxh;)V

    iget v0, v0, Lyc6;->d:I

    new-instance v2, Ldxh;

    invoke-direct {v2, v0}, Ldxh;-><init>(I)V

    invoke-virtual {v1, v2}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->D(Lcxh;)V

    iget-object v0, p1, Lt9j;->e:Ltj;

    invoke-virtual {p0}, Lk6j;->H0()Lpm9;

    move-result-object v1

    iget-object v1, v1, Lpm9;->e:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    iget-boolean v2, v0, Ltj;->a:Z

    iget v3, v0, Ltj;->b:I

    invoke-virtual {v1, v2}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->t(Z)V

    iget-boolean v2, v0, Ltj;->c:Z

    if-eqz v2, :cond_3fe

    invoke-virtual {v1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-static {}, Ljava/text/NumberFormat;->getNumberInstance()Ljava/text/NumberFormat;

    move-result-object v2

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/text/Format;->format(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    filled-new-array {v2}, [Ljava/lang/Object;

    move-result-object v2

    const/high16 v4, 0x7f120000

    invoke-virtual {v0, v4, v3, v2}, Landroid/content/res/Resources;->getQuantityString(II[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    new-instance v2, Lqxh;

    invoke-direct {v2, v0}, Lqxh;-><init>(Ljava/lang/CharSequence;)V

    goto :goto_405

    :cond_3fe
    iget v0, v0, Ltj;->d:I

    new-instance v2, Lrxh;

    invoke-direct {v2, v0}, Lrxh;-><init>(I)V

    :goto_405
    invoke-virtual {v1, v2}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->C(Lpxh;)V

    iget-object v0, p1, Lt9j;->f:Luyl;

    invoke-virtual {p0}, Lk6j;->H0()Lpm9;

    move-result-object v1

    iget-object v1, v1, Lpm9;->s:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    iget-boolean v2, v0, Luyl;->a:Z

    iget v3, v0, Luyl;->b:I

    invoke-virtual {v1, v2}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->t(Z)V

    iget-boolean v2, v0, Luyl;->c:Z

    if-eqz v2, :cond_43c

    invoke-virtual {v1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-static {}, Ljava/text/NumberFormat;->getNumberInstance()Ljava/text/NumberFormat;

    move-result-object v2

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/text/Format;->format(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    filled-new-array {v2}, [Ljava/lang/Object;

    move-result-object v2

    const v4, 0x7f12006d

    invoke-virtual {v0, v4, v3, v2}, Landroid/content/res/Resources;->getQuantityString(II[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    new-instance v2, Lqxh;

    invoke-direct {v2, v0}, Lqxh;-><init>(Ljava/lang/CharSequence;)V

    goto :goto_443

    :cond_43c
    iget v0, v0, Luyl;->d:I

    new-instance v2, Lrxh;

    invoke-direct {v2, v0}, Lrxh;-><init>(I)V

    :goto_443
    invoke-virtual {v1, v2}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->C(Lpxh;)V

    iget-object v0, p1, Lt9j;->g:Lrxe;

    invoke-virtual {p0}, Lk6j;->H0()Lpm9;

    move-result-object v1

    iget-object v1, v1, Lpm9;->m:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    iget-boolean v2, v0, Lrxe;->a:Z

    invoke-virtual {v1, v2}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->t(Z)V

    iget-object v0, v0, Lrxe;->b:Ljava/lang/String;

    invoke-static {v1, v0}, Lv0g;->m(Lcom/opera/android/ui/catalog/widget/OperaListItem;Ljava/lang/String;)V

    iget v0, p1, Lt9j;->a:I

    invoke-virtual {p0}, Lk6j;->H0()Lpm9;

    move-result-object v1

    iget-object v1, v1, Lpm9;->h:Lcom/opera/android/widget/MenuSettingsListItem;

    iget-object v1, v1, Lcom/opera/android/widget/MenuSettingsListItem;->b:Lor2;

    iget-object v1, v1, Lor2;->b:Ljava/lang/Object;

    check-cast v1, Lcom/opera/android/custom_views/StylingTextView;

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(I)V

    iget-object p1, p1, Lt9j;->h:La8d;

    iget-boolean p1, p1, La8d;->a:Z

    invoke-virtual {p0}, Lk6j;->H0()Lpm9;

    move-result-object v0

    iget-object v0, v0, Lpm9;->b:Lcom/opera/android/custom_views/MakeOperaDefaultBanner;

    if-eqz p1, :cond_476

    move v5, v7

    :cond_476
    invoke-virtual {v0, v5}, Landroid/view/View;->setVisibility(I)V

    if-eqz p1, :cond_498

    invoke-virtual {p0}, Lk6j;->I0()Ldaj;

    move-result-object p0

    iget-object p0, p0, Ldaj;->i:Lru9;

    iget-object p1, p0, Lru9;->a:Landroid/content/SharedPreferences;

    const-string v0, "make_default_banner.show_count"

    invoke-interface {p1, v0, v7}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result p1

    invoke-virtual {p0}, Lru9;->b()Lnv6;

    move-result-object p0

    add-int/2addr p1, v6

    iget-object v1, p0, Lnv6;->a:Ljava/lang/Object;

    check-cast v1, Landroid/content/SharedPreferences$Editor;

    invoke-interface {v1, v0, p1}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    invoke-virtual {p0}, Lnv6;->w()V

    :cond_498
    return-void

    :pswitch_499
    check-cast p0, Lawi;

    check-cast p1, Lbwi;

    if-eqz p1, :cond_54e

    iget-object v0, p1, Lbwi;->d:Ll7j;

    iget-boolean v1, p1, Lbwi;->c:Z

    iget-object v8, p1, Lbwi;->e:Ljava/lang/String;

    invoke-virtual {p0, p1}, Lawi;->L0(Lbwi;)V

    iget-object p1, p0, Lawi;->u:Lei;

    iget-object p1, p1, Lei;->i:Landroid/view/View;

    check-cast p1, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    invoke-virtual {p1, v1}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->t(Z)V

    iget-object p1, p0, Lawi;->u:Lei;

    iget-object p1, p1, Lei;->i:Landroid/view/View;

    check-cast p1, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    const v9, 0x7f141345

    invoke-static {v9, p1}, Lu35;->k(ILcom/opera/android/ui/catalog/widget/OperaListItem;)V

    iget-object p1, p0, Lawi;->u:Lei;

    iget-object p1, p1, Lei;->f:Ljava/lang/Object;

    check-cast p1, Lcom/opera/android/custom_views/OperaRadioGroup;

    if-eqz v1, :cond_4c7

    move v1, v7

    goto :goto_4c8

    :cond_4c7
    move v1, v5

    :goto_4c8
    invoke-virtual {p1, v1}, Landroid/view/View;->setVisibility(I)V

    iget-object p1, p0, Lawi;->u:Lei;

    iget-object p1, p1, Lei;->f:Ljava/lang/Object;

    check-cast p1, Lcom/opera/android/custom_views/OperaRadioGroup;

    iget v1, p1, Lcom/opera/android/custom_views/OperaRadioGroup;->a:I

    sget-object v9, Lawi;->y:Landroid/util/SparseArray;

    invoke-virtual {v9, v0}, Landroid/util/SparseArray;->indexOfValue(Ljava/lang/Object;)I

    move-result v10

    invoke-virtual {v9, v10}, Landroid/util/SparseArray;->keyAt(I)I

    move-result v9

    iget-object v10, p1, Lcom/opera/android/custom_views/OperaRadioGroup;->c:Lyvi;

    iput-object v3, p1, Lcom/opera/android/custom_views/OperaRadioGroup;->c:Lyvi;

    const/4 v3, -0x1

    if-eq v9, v3, :cond_4e8

    iget v11, p1, Lcom/opera/android/custom_views/OperaRadioGroup;->a:I

    if-eq v9, v11, :cond_4f7

    :cond_4e8
    iget v11, p1, Lcom/opera/android/custom_views/OperaRadioGroup;->a:I

    if-eq v11, v3, :cond_4ef

    invoke-virtual {p1, v11, v7}, Lcom/opera/android/custom_views/OperaRadioGroup;->c(IZ)V

    :cond_4ef
    if-eq v9, v3, :cond_4f4

    invoke-virtual {p1, v9, v6}, Lcom/opera/android/custom_views/OperaRadioGroup;->c(IZ)V

    :cond_4f4
    invoke-virtual {p1, v9}, Lcom/opera/android/custom_views/OperaRadioGroup;->b(I)V

    :cond_4f7
    iput-object v10, p1, Lcom/opera/android/custom_views/OperaRadioGroup;->c:Lyvi;

    if-ne v1, v3, :cond_504

    iget-object p1, p0, Lawi;->u:Lei;

    iget-object p1, p1, Lei;->f:Ljava/lang/Object;

    check-cast p1, Lcom/opera/android/custom_views/OperaRadioGroup;

    invoke-virtual {p1}, Landroid/view/View;->jumpDrawablesToCurrentState()V

    :cond_504
    iget-object p1, p0, Lawi;->u:Lei;

    iget-object p1, p1, Lei;->e:Landroid/view/View;

    check-cast p1, Lcom/google/android/material/textfield/TextInputLayout;

    sget-object v1, Ll7j;->c:Ll7j;

    if-ne v0, v1, :cond_50f

    move v5, v7

    :cond_50f
    invoke-virtual {p1, v5}, Landroid/view/View;->setVisibility(I)V

    iget-object p1, p0, Lawi;->u:Lei;

    iget-object p1, p1, Lei;->d:Landroid/view/View;

    check-cast p1, Lcom/opera/android/custom_views/OperaTextInputEditText;

    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object p1

    invoke-static {v8, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result p1

    if-nez p1, :cond_52e

    iget-object p1, p0, Lawi;->u:Lei;

    iget-object p1, p1, Lei;->d:Landroid/view/View;

    check-cast p1, Lcom/opera/android/custom_views/OperaTextInputEditText;

    invoke-virtual {p1, v8}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {p0, v8}, Lawi;->I0(Ljava/lang/CharSequence;)V

    :cond_52e
    iget-object p1, p0, Lawi;->u:Lei;

    iget-object p1, p1, Lei;->b:Landroid/view/ViewGroup;

    check-cast p1, Landroid/widget/LinearLayout;

    invoke-virtual {p1}, Landroid/view/ViewGroup;->getLayoutTransition()Landroid/animation/LayoutTransition;

    move-result-object p1

    invoke-virtual {p1, v4}, Landroid/animation/LayoutTransition;->enableTransitionType(I)V

    invoke-virtual {p1, v2}, Landroid/animation/LayoutTransition;->enableTransitionType(I)V

    iget-object p0, p0, Lawi;->u:Lei;

    iget-object p0, p0, Lei;->f:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/custom_views/OperaRadioGroup;

    invoke-virtual {p0}, Landroid/view/ViewGroup;->getLayoutTransition()Landroid/animation/LayoutTransition;

    move-result-object p0

    invoke-virtual {p0, v4}, Landroid/animation/LayoutTransition;->enableTransitionType(I)V

    invoke-virtual {p0, v2}, Landroid/animation/LayoutTransition;->enableTransitionType(I)V

    :cond_54e
    return-void

    :pswitch_54f
    check-cast p0, Lrn9;

    check-cast p1, Leri;

    iget-boolean p1, p0, Lrn9;->b:Z

    if-eqz p1, :cond_587

    iget-object p1, p0, Lrn9;->d:Ljava/lang/Object;

    check-cast p1, Lx5f;

    iget-object p0, p0, Lrn9;->c:Ljava/lang/Object;

    check-cast p0, Lpde;

    invoke-virtual {p0}, Lekc;->g()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Leri;

    invoke-interface {p0}, Leri;->l()Ljava/lang/String;

    move-result-object p0

    iget-boolean v0, p1, Lx5f;->h:Z

    if-eqz v0, :cond_587

    iget-object v0, p1, Lx5f;->d:Lzpa;

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v2

    new-instance v3, Lck0;

    invoke-direct {v3, v0, v2}, Lck0;-><init>(Lzpa;Lx56;)V

    invoke-virtual {v3}, Lck0;->d()Ltd0;

    move-result-object v0

    new-instance v3, Lzbe;

    invoke-direct {v3, v1}, Lzbe;-><init>(B)V

    invoke-virtual {v0, p0, v3}, Ltd0;->e(Ljava/lang/String;Lkotlin/jvm/functions/Function1;)V

    invoke-virtual {p1, v2}, Lx5f;->U0(Lx56;)V

    :cond_587
    return-void

    :pswitch_588
    check-cast p0, Ldqi;

    check-cast p1, Lfqi;

    iget-object v0, p0, Ldqi;->r:Lwk9;

    iget-object v0, v0, Lwk9;->n:Landroid/view/View;

    check-cast v0, Landroid/widget/TextView;

    iget-boolean v1, p1, Lfqi;->a:Z

    if-eqz v1, :cond_599

    const-string v1, "Until reset"

    goto :goto_59b

    :cond_599
    const-string v1, "This session"

    :goto_59b
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v0, p0, Ldqi;->r:Lwk9;

    iget-object v0, v0, Lwk9;->f:Ljava/lang/Object;

    check-cast v0, Lvs;

    iget-object v1, p1, Lfqi;->b:Leqi;

    invoke-virtual {p0, v0, v1}, Ldqi;->G0(Lvs;Leqi;)V

    iget-object v0, p0, Ldqi;->r:Lwk9;

    iget-object v0, v0, Lwk9;->j:Ljava/lang/Object;

    check-cast v0, Lvs;

    iget-object v1, p1, Lfqi;->c:Leqi;

    invoke-virtual {p0, v0, v1}, Ldqi;->G0(Lvs;Leqi;)V

    iget-object v0, p0, Ldqi;->r:Lwk9;

    iget-object v0, v0, Lwk9;->l:Ljava/lang/Object;

    check-cast v0, Lvs;

    iget-object v1, p1, Lfqi;->d:Leqi;

    invoke-virtual {p0, v0, v1}, Ldqi;->G0(Lvs;Leqi;)V

    iget-object v0, p0, Ldqi;->r:Lwk9;

    iget-object v0, v0, Lwk9;->o:Ljava/lang/Object;

    check-cast v0, Lvs;

    iget-object v1, p1, Lfqi;->e:Leqi;

    invoke-virtual {p0, v0, v1}, Ldqi;->G0(Lvs;Leqi;)V

    iget-object v0, p0, Ldqi;->r:Lwk9;

    iget-object v0, v0, Lwk9;->m:Ljava/lang/Object;

    check-cast v0, Lvs;

    iget-object v1, p1, Lfqi;->f:Leqi;

    invoke-virtual {p0, v0, v1}, Ldqi;->G0(Lvs;Leqi;)V

    iget-object v0, p0, Ldqi;->r:Lwk9;

    iget-object v0, v0, Lwk9;->g:Ljava/lang/Object;

    check-cast v0, Lvs;

    iget-object v1, p1, Lfqi;->g:Leqi;

    invoke-virtual {p0, v0, v1}, Ldqi;->G0(Lvs;Leqi;)V

    iget-object v0, p0, Ldqi;->r:Lwk9;

    iget-object v0, v0, Lwk9;->d:Ljava/lang/Object;

    check-cast v0, Lvs;

    iget-object v1, p1, Lfqi;->h:Leqi;

    invoke-virtual {p0, v0, v1}, Ldqi;->G0(Lvs;Leqi;)V

    iget-object v0, p0, Ldqi;->r:Lwk9;

    iget-object v0, v0, Lwk9;->k:Ljava/lang/Object;

    check-cast v0, Lvs;

    iget-object v1, p1, Lfqi;->i:Leqi;

    invoke-virtual {p0, v0, v1}, Ldqi;->G0(Lvs;Leqi;)V

    iget-object v0, p0, Ldqi;->r:Lwk9;

    iget-object v0, v0, Lwk9;->t:Ljava/lang/Object;

    check-cast v0, Lvs;

    iget-object v1, p1, Lfqi;->j:Leqi;

    invoke-virtual {p0, v0, v1}, Ldqi;->G0(Lvs;Leqi;)V

    iget-object v0, p0, Ldqi;->r:Lwk9;

    iget-object v0, v0, Lwk9;->r:Ljava/lang/Object;

    check-cast v0, Lvs;

    iget-object v1, p1, Lfqi;->k:Leqi;

    invoke-virtual {p0, v0, v1}, Ldqi;->G0(Lvs;Leqi;)V

    iget-object v0, p0, Ldqi;->r:Lwk9;

    iget-object v0, v0, Lwk9;->v:Ljava/lang/Object;

    check-cast v0, Lvs;

    iget-object v1, p1, Lfqi;->l:Leqi;

    invoke-virtual {p0, v0, v1}, Ldqi;->G0(Lvs;Leqi;)V

    iget-object v0, p0, Ldqi;->r:Lwk9;

    iget-object v0, v0, Lwk9;->h:Ljava/lang/Object;

    check-cast v0, Lvs;

    iget-object v1, p1, Lfqi;->m:Leqi;

    invoke-virtual {p0, v0, v1}, Ldqi;->G0(Lvs;Leqi;)V

    iget-object v0, p0, Ldqi;->r:Lwk9;

    iget-object v0, v0, Lwk9;->q:Ljava/lang/Object;

    check-cast v0, Lvs;

    iget-object v1, p1, Lfqi;->n:Leqi;

    invoke-virtual {p0, v0, v1}, Ldqi;->G0(Lvs;Leqi;)V

    iget-object v0, p0, Ldqi;->r:Lwk9;

    iget-object v0, v0, Lwk9;->e:Ljava/lang/Object;

    check-cast v0, Lvs;

    iget-object v1, p1, Lfqi;->o:Leqi;

    invoke-virtual {p0, v0, v1}, Ldqi;->G0(Lvs;Leqi;)V

    iget-object v0, p0, Ldqi;->r:Lwk9;

    iget-object v0, v0, Lwk9;->p:Ljava/lang/Object;

    check-cast v0, Lvs;

    iget-object v1, p1, Lfqi;->p:Leqi;

    invoke-virtual {p0, v0, v1}, Ldqi;->G0(Lvs;Leqi;)V

    iget-object v0, p0, Ldqi;->r:Lwk9;

    iget-object v0, v0, Lwk9;->u:Ljava/lang/Object;

    check-cast v0, Lvs;

    iget-object v1, p1, Lfqi;->q:Leqi;

    invoke-virtual {p0, v0, v1}, Ldqi;->G0(Lvs;Leqi;)V

    iget-object v0, p0, Ldqi;->r:Lwk9;

    iget-object v0, v0, Lwk9;->c:Ljava/lang/Object;

    check-cast v0, Lvs;

    iget-object v1, p1, Lfqi;->r:Leqi;

    invoke-virtual {p0, v0, v1}, Ldqi;->G0(Lvs;Leqi;)V

    iget-object v0, p0, Ldqi;->r:Lwk9;

    iget-object v0, v0, Lwk9;->i:Ljava/lang/Object;

    check-cast v0, Lvs;

    iget-object p1, p1, Lfqi;->s:Leqi;

    invoke-virtual {p0, v0, p1}, Ldqi;->G0(Lvs;Leqi;)V

    return-void

    :pswitch_665
    check-cast p0, Lshf;

    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    iget-object v0, p0, Lshf;->c:Ljava/lang/Object;

    check-cast v0, Ld3k;

    if-eqz p1, :cond_68b

    if-eqz v0, :cond_67b

    invoke-virtual {v0}, Lxob;->isActive()Z

    move-result p1

    if-eq p1, v6, :cond_692

    :cond_67b
    iget-object p1, p0, Lshf;->b:Ljava/lang/Object;

    check-cast p1, Lddc;

    new-instance v0, Lagb;

    invoke-direct {v0, v1, v3, p0}, Lagb;-><init>(BLmt5;Ljava/lang/Object;)V

    invoke-static {p1, v3, v3, v0, v2}, Lna2;->B(Lnx5;Lkotlin/coroutines/CoroutineContext;Lrx5;Lkotlin/jvm/functions/Function2;I)Ld3k;

    move-result-object p1

    iput-object p1, p0, Lshf;->c:Ljava/lang/Object;

    goto :goto_692

    :cond_68b
    if-eqz v0, :cond_692

    invoke-virtual {v0, v3}, Lxob;->k(Ljava/util/concurrent/CancellationException;)V

    iput-object v3, p0, Lshf;->c:Ljava/lang/Object;

    :cond_692
    :goto_692
    return-void

    :pswitch_693
    check-cast p0, Li0h;

    check-cast p1, Lh1b;

    iget-object v0, p0, Li0h;->d:Lxol;

    invoke-virtual {v0, p1}, Lygc;->H(Ljava/util/List;)V

    invoke-virtual {p1}, Ljava/util/AbstractCollection;->isEmpty()Z

    move-result p1

    iget-object p0, p0, Li0h;->e:Lq5g;

    if-eqz p1, :cond_6ac

    iget-object p0, p0, Lq5g;->d:Ljava/lang/Object;

    check-cast p0, Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {p0, v5}, Landroid/view/View;->setVisibility(I)V

    goto :goto_6b3

    :cond_6ac
    iget-object p0, p0, Lq5g;->d:Ljava/lang/Object;

    check-cast p0, Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {p0, v7}, Landroid/view/View;->setVisibility(I)V

    :goto_6b3
    return-void

    :pswitch_6b4
    check-cast p0, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    invoke-virtual {p0, p1}, Landroid/view/View;->setVisibility(I)V

    return-void

    :pswitch_6c0
    check-cast p0, Lghf;

    check-cast p1, Lvzg;

    iget-object v0, p0, Lghf;->d:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/custom_views/FadingScrollView;

    iget-object v0, v0, Lcom/opera/android/custom_views/FadingScrollView;->c:Lz5n;

    iget-object v1, p0, Lghf;->b:Ljava/lang/Object;

    check-cast v1, Landroid/view/View;

    iget-object p0, p0, Lghf;->c:Ljava/lang/Object;

    check-cast p0, Landroid/view/View;

    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    move-result p1

    if-eqz p1, :cond_700

    if-eq p1, v6, :cond_6ee

    if-ne p1, v4, :cond_711

    invoke-virtual {p0, v5}, Landroid/view/View;->setVisibility(I)V

    invoke-virtual {v1, v5}, Landroid/view/View;->setVisibility(I)V

    iget-boolean p0, v0, Lz5n;->n:Z

    if-eq p0, v6, :cond_711

    iput-boolean v6, v0, Lz5n;->n:Z

    iget-object p0, v0, Lz5n;->a:Landroid/view/View;

    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    goto :goto_711

    :cond_6ee
    invoke-virtual {p0, v5}, Landroid/view/View;->setVisibility(I)V

    invoke-virtual {v1, v7}, Landroid/view/View;->setVisibility(I)V

    iget-boolean p0, v0, Lz5n;->n:Z

    if-eqz p0, :cond_711

    iput-boolean v7, v0, Lz5n;->n:Z

    iget-object p0, v0, Lz5n;->a:Landroid/view/View;

    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    goto :goto_711

    :cond_700
    invoke-virtual {p0, v7}, Landroid/view/View;->setVisibility(I)V

    invoke-virtual {v1, v5}, Landroid/view/View;->setVisibility(I)V

    iget-boolean p0, v0, Lz5n;->n:Z

    if-eqz p0, :cond_711

    iput-boolean v7, v0, Lz5n;->n:Z

    iget-object p0, v0, Lz5n;->a:Landroid/view/View;

    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    :cond_711
    :goto_711
    return-void

    :pswitch_712
    check-cast p0, Lxzg;

    check-cast p1, Lqwi;

    iget-object v0, p0, Lxzg;->h:Lei;

    iget-object v0, v0, Lei;->d:Landroid/view/View;

    check-cast v0, Lcom/opera/android/custom_views/StylingTextView;

    invoke-virtual {v0}, Lyq1;->getText()Ljava/lang/CharSequence;

    move-result-object v0

    invoke-interface {v0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v0

    iget-object p1, p1, Lqwi;->a:Lnwi;

    invoke-virtual {p0, v0, p1}, Lxzg;->k0(Ljava/lang/String;Lnwi;)V

    return-void

    :pswitch_data_72a
    .packed-switch 0x0
        :pswitch_712
        :pswitch_6c0
        :pswitch_6b4
        :pswitch_693
        :pswitch_665
        :pswitch_588
        :pswitch_54f
        :pswitch_499
        :pswitch_346
        :pswitch_33b
        :pswitch_32a
        :pswitch_322
        :pswitch_31a
        :pswitch_2f8
        :pswitch_2d5
        :pswitch_2cb
        :pswitch_2c0
        :pswitch_2b8
        :pswitch_2a4
        :pswitch_294
        :pswitch_27c
        :pswitch_20d
        :pswitch_1ff
        :pswitch_1d4
        :pswitch_1b7
        :pswitch_1a5
        :pswitch_a5
        :pswitch_25
        :pswitch_1b
    .end packed-switch
.end method

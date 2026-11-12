.class public final Lakg;
.super Lo73;
.source "SourceFile"


# instance fields
.field public final synthetic j:B

.field public k:Z

.field public final l:Ljava/lang/Object;

.field public final m:Ljava/lang/Object;

.field public final n:Ljava/lang/Object;

.field public o:Ljava/lang/Object;

.field public p:Ljava/lang/Object;

.field public q:Ljava/lang/Object;

.field public r:Ljava/lang/Object;

.field public s:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Lpde;Lpde;Lori;)V
    .registers 5

    const/4 v0, 0x1

    iput-byte v0, p0, Lakg;->j:B

    invoke-direct {p0}, Lo73;-><init>()V

    iput-object p1, p0, Lakg;->l:Ljava/lang/Object;

    iput-object p2, p0, Lakg;->m:Ljava/lang/Object;

    iput-object p3, p0, Lakg;->n:Ljava/lang/Object;

    new-instance p1, Lhe;

    const/4 p2, 0x3

    invoke-direct {p1, p0, p2}, Lhe;-><init>(Ljava/lang/Object;B)V

    iput-object p1, p0, Lakg;->o:Ljava/lang/Object;

    new-instance p1, Lisd;

    const/16 p2, 0x16

    invoke-direct {p1, p0, p2}, Lisd;-><init>(Ljava/lang/Object;B)V

    iput-object p1, p0, Lakg;->p:Ljava/lang/Object;

    new-instance p1, Lnri;

    const/4 p2, 0x0

    invoke-direct {p1, p0, p2}, Lnri;-><init>(Lakg;B)V

    iput-object p1, p0, Lakg;->q:Ljava/lang/Object;

    new-instance p1, Lnri;

    invoke-direct {p1, p0, v0}, Lnri;-><init>(Lakg;B)V

    iput-object p1, p0, Lakg;->r:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lxbf;ZLjava/lang/Runnable;Lga6;)V
    .registers 8

    const/4 v0, 0x0

    iput-byte v0, p0, Lakg;->j:B

    .line 45
    invoke-direct {p0}, Lo73;-><init>()V

    .line 46
    new-instance v0, Lxjg;

    invoke-direct {v0, p0}, Lxjg;-><init>(Lakg;)V

    .line 47
    new-instance v1, Lwe7;

    const/4 v2, 0x6

    invoke-direct {v1, p0, v0, v2}, Lwe7;-><init>(Ljava/lang/Object;Leig;B)V

    iput-object v1, p0, Lakg;->s:Ljava/lang/Object;

    .line 48
    iput-object p1, p0, Lakg;->l:Ljava/lang/Object;

    .line 49
    iput-boolean p2, p0, Lakg;->k:Z

    .line 50
    iput-object p3, p0, Lakg;->m:Ljava/lang/Object;

    .line 51
    iput-object p4, p0, Lakg;->n:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final m(Lr9i;Landroid/view/View;)V
    .registers 7

    iget-byte v0, p0, Lakg;->j:B

    iget-object v1, p0, Lakg;->l:Ljava/lang/Object;

    const/4 v2, 0x1

    packed-switch v0, :pswitch_data_98

    iget-object p2, p0, Lo73;->a:Ldkf;

    iput-object p2, p0, Lakg;->s:Ljava/lang/Object;

    const/4 v0, 0x0

    if-nez p2, :cond_10

    move-object p2, v0

    :cond_10
    invoke-virtual {p2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p2

    const v3, 0x7f07084d

    invoke-virtual {p2, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p2

    iget-object v3, p1, Lr9i;->d:Ljava/lang/Object;

    check-cast v3, Lo66;

    iput p2, v3, Lo66;->u:I

    invoke-virtual {p1, v2}, Lr9i;->S(Z)V

    iget-object p1, p1, Lr9i;->c:Ljava/lang/Object;

    check-cast p1, Lm66;

    invoke-virtual {p0, p1}, Lakg;->t(Landroid/view/Menu;)V

    iget-object p1, p0, Lakg;->s:Ljava/lang/Object;

    check-cast p1, Ldkf;

    if-eqz p1, :cond_32

    move-object v0, p1

    :cond_32
    invoke-static {v0}, Lzi4;->y(Landroid/content/Context;)Lm24;

    move-result-object p1

    iget-object p2, p0, Lakg;->o:Ljava/lang/Object;

    check-cast p2, Lhe;

    invoke-interface {p1, p2}, Lm24;->a(Ll24;)V

    check-cast v1, Lpde;

    iget-object p1, p0, Lakg;->q:Ljava/lang/Object;

    check-cast p1, Lnri;

    invoke-virtual {v1, p1}, Lekc;->k(Lf7f;)V

    iget-object p1, p0, Lakg;->m:Ljava/lang/Object;

    check-cast p1, Lpde;

    iget-object p0, p0, Lakg;->r:Ljava/lang/Object;

    check-cast p0, Lnri;

    invoke-virtual {p1, p0}, Lekc;->k(Lf7f;)V

    return-void

    :pswitch_52
    invoke-virtual {p2}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    iput-object v0, p0, Lakg;->q:Ljava/lang/Object;

    const v0, 0x7f10001b

    invoke-virtual {p1, v0}, Lr9i;->L(I)V

    iget-object v0, p1, Lr9i;->c:Ljava/lang/Object;

    check-cast v0, Lm66;

    iput-object v0, p0, Lakg;->p:Ljava/lang/Object;

    invoke-virtual {p0}, Lakg;->w()V

    iget-object v0, p0, Lakg;->s:Ljava/lang/Object;

    check-cast v0, Lwe7;

    check-cast v1, Lxbf;

    invoke-virtual {v0, v1}, Lhkg;->a(Lxbf;)V

    iput-object p2, p0, Lakg;->r:Ljava/lang/Object;

    iget-boolean p0, p0, Lakg;->k:Z

    if-eqz p0, :cond_97

    invoke-static {p2}, Lcs5;->W(Landroid/view/View;)Z

    move-result p0

    const/4 p2, 0x2

    if-eqz p0, :cond_7f

    move p0, v2

    goto :goto_80

    :cond_7f
    move p0, p2

    :goto_80
    or-int/lit8 p0, p0, 0x4

    iget-object p1, p1, Lr9i;->d:Ljava/lang/Object;

    check-cast p1, Lo66;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    and-int/lit8 v0, p0, 0x3

    if-eqz v0, :cond_95

    if-eq v0, v2, :cond_95

    if-eq v0, p2, :cond_95

    invoke-static {}, Lhai;->d()V

    goto :goto_97

    :cond_95
    iput p0, p1, Lo66;->r:I

    :cond_97
    :goto_97
    return-void

    :pswitch_data_98
    .packed-switch 0x0
        :pswitch_52
    .end packed-switch
.end method

.method public final onDismiss()V
    .registers 5

    iget-byte v0, p0, Lakg;->j:B

    iget-object v1, p0, Lakg;->m:Ljava/lang/Object;

    iget-object v2, p0, Lakg;->l:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_4c

    invoke-super {p0}, Lo73;->onDismiss()V

    iget-object v0, p0, Lakg;->s:Ljava/lang/Object;

    check-cast v0, Ldkf;

    if-nez v0, :cond_13

    const/4 v0, 0x0

    :cond_13
    invoke-static {v0}, Lzi4;->y(Landroid/content/Context;)Lm24;

    move-result-object v0

    iget-object v3, p0, Lakg;->o:Ljava/lang/Object;

    check-cast v3, Lhe;

    invoke-interface {v0, v3}, Lm24;->c(Ll24;)V

    check-cast v2, Lpde;

    iget-object v0, p0, Lakg;->q:Ljava/lang/Object;

    check-cast v0, Lnri;

    invoke-virtual {v2, v0}, Lekc;->p(Lf7f;)V

    check-cast v1, Lpde;

    iget-object v0, p0, Lakg;->r:Ljava/lang/Object;

    check-cast v0, Lnri;

    invoke-virtual {v1, v0}, Lekc;->p(Lf7f;)V

    iget-object p0, p0, Lakg;->n:Ljava/lang/Object;

    check-cast p0, Lori;

    invoke-interface {p0}, Lori;->d()V

    return-void

    :pswitch_38
    iget-object v0, p0, Lakg;->s:Ljava/lang/Object;

    check-cast v0, Lwe7;

    check-cast v2, Lxbf;

    invoke-virtual {v0, v2}, Lhkg;->b(Lxbf;)V

    invoke-super {p0}, Lo73;->onDismiss()V

    check-cast v1, Ljava/lang/Runnable;

    if-eqz v1, :cond_4b

    invoke-interface {v1}, Ljava/lang/Runnable;->run()V

    :cond_4b
    return-void

    :pswitch_data_4c
    .packed-switch 0x0
        :pswitch_38
    .end packed-switch
.end method

.method public final onMenuItemClick(Landroid/view/MenuItem;)Z
    .registers 18

    move-object/from16 v1, p0

    iget-byte v0, v1, Lakg;->j:B

    iget-object v2, v1, Lakg;->n:Ljava/lang/Object;

    const/4 v6, 0x1

    packed-switch v0, :pswitch_data_32a

    iget-boolean v0, v1, Lakg;->k:Z

    if-nez v0, :cond_1f

    iput-boolean v6, v1, Lakg;->k:Z

    check-cast v2, Lori;

    invoke-interface/range {p1 .. p1}, Landroid/view/MenuItem;->getActionView()Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Leri;

    invoke-interface {v2, v0}, Lori;->l(Leri;)V

    :cond_1f
    return v6

    :pswitch_20
    check-cast v2, Lga6;

    iget-object v0, v1, Lakg;->l:Ljava/lang/Object;

    check-cast v0, Lxbf;

    invoke-interface/range {p1 .. p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v3

    const v4, 0x7f0a06b4

    const/4 v5, 0x0

    const/4 v7, 0x2

    const/4 v8, -0x1

    if-ne v3, v4, :cond_af

    sget-object v2, Lxh0;->b:Lxh0;

    invoke-virtual {v1, v2}, Lakg;->s(Lxh0;)V

    iget-object v0, v0, Lxbf;->c:Ljava/lang/Object;

    check-cast v0, Lode;

    invoke-virtual {v0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lgig;

    invoke-interface {v0}, Lgig;->getPlaybackParameters()Lthg;

    move-result-object v0

    iget v0, v0, Lthg;->a:F

    const/16 v2, 0x8

    new-array v3, v2, [F

    fill-array-data v3, :array_330

    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4, v2}, Ljava/util/ArrayList;-><init>(I)V

    move v9, v5

    :goto_54
    if-ge v9, v2, :cond_88

    aget v10, v3, v9

    new-instance v11, Likg;

    iget-object v12, v1, Lakg;->q:Ljava/lang/Object;

    check-cast v12, Landroid/content/Context;

    invoke-static {}, Ljava/text/NumberFormat;->getInstance()Ljava/text/NumberFormat;

    move-result-object v13

    check-cast v13, Ljava/text/DecimalFormat;

    invoke-virtual {v13, v5}, Ljava/text/DecimalFormat;->setMinimumFractionDigits(I)V

    invoke-virtual {v13, v7}, Ljava/text/DecimalFormat;->setMaximumFractionDigits(I)V

    float-to-double v14, v10

    invoke-virtual {v13, v14, v15}, Ljava/text/NumberFormat;->format(D)Ljava/lang/String;

    move-result-object v13

    filled-new-array {v13}, [Ljava/lang/Object;

    move-result-object v13

    const v14, 0x7f141176

    invoke-virtual {v12, v14, v13}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v12

    invoke-direct {v11, v12}, Likg;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, v11}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    cmpl-float v10, v10, v0

    if-nez v10, :cond_85

    move v8, v9

    :cond_85
    add-int/lit8 v9, v9, 0x1

    goto :goto_54

    :cond_88
    new-array v0, v5, [Likg;

    invoke-virtual {v4, v0}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Likg;

    move-object v2, v0

    new-instance v0, Lyjg;

    aget-object v5, v2, v8

    move-object v7, v5

    new-instance v5, Lhk5;

    invoke-direct {v5, v1, v3, v4}, Lhk5;-><init>(Lakg;[FLjava/util/ArrayList;)V

    iget-object v3, v1, Lakg;->r:Ljava/lang/Object;

    check-cast v3, Landroid/view/View;

    invoke-static {v3}, Lipe;->A(Landroid/view/View;)Landroid/graphics/Point;

    move-object v3, v2

    const v2, 0x7f140d2a

    move-object v4, v7

    invoke-direct/range {v0 .. v5}, Lyjg;-><init>(Lakg;I[Likg;Likg;Lcom/opera/api/Callback;)V

    invoke-virtual {v1, v0}, Lakg;->v(Lyjg;)V

    goto/16 :goto_329

    :cond_af
    invoke-interface/range {p1 .. p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v3

    const v4, 0x7f0a06b0

    const/4 v9, 0x0

    if-ne v3, v4, :cond_116

    sget-object v0, Lxh0;->c:Lxh0;

    invoke-virtual {v1, v0}, Lakg;->s(Lxh0;)V

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {v1, v7, v0}, Lakg;->q(ILjava/util/ArrayList;)I

    move-result v2

    if-ltz v2, :cond_d0

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lzjg;

    goto :goto_d1

    :cond_d0
    move-object v2, v9

    :goto_d1
    new-instance v3, Lc9;

    const/16 v4, 0x1a

    invoke-direct {v3, v4}, Lc9;-><init>(B)V

    invoke-static {v0, v3}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    move-result v2

    new-instance v3, Ljava/util/ArrayList;

    new-instance v4, Lujg;

    invoke-direct {v4, v1, v5}, Lujg;-><init>(Lakg;B)V

    invoke-static {v4, v0}, Lnb6;->W(Lxq9;Ljava/util/List;)Ljava/util/AbstractList;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    new-array v4, v5, [Likg;

    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v4

    check-cast v4, [Likg;

    new-instance v7, Lyjg;

    if-eq v2, v8, :cond_fb

    aget-object v9, v4, v2

    :cond_fb
    new-instance v2, Lvjg;

    invoke-direct {v2, v1, v3, v0, v5}, Lvjg;-><init>(Lakg;Ljava/util/ArrayList;Ljava/util/ArrayList;B)V

    iget-object v0, v1, Lakg;->r:Ljava/lang/Object;

    check-cast v0, Landroid/view/View;

    invoke-static {v0}, Lipe;->A(Landroid/view/View;)Landroid/graphics/Point;

    move-object v5, v2

    const v2, 0x7f140d29

    move-object v3, v4

    move-object v0, v7

    move-object v4, v9

    invoke-direct/range {v0 .. v5}, Lyjg;-><init>(Lakg;I[Likg;Likg;Lcom/opera/api/Callback;)V

    invoke-virtual {v1, v0}, Lakg;->v(Lyjg;)V

    goto/16 :goto_329

    :cond_116
    invoke-interface/range {p1 .. p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v3

    const v4, 0x7f0a0684

    if-ne v3, v4, :cond_164

    sget-object v0, Lxh0;->d:Lxh0;

    invoke-virtual {v1, v0}, Lakg;->s(Lxh0;)V

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {v1, v6, v0}, Lakg;->q(ILjava/util/ArrayList;)I

    move-result v2

    new-instance v3, Ljava/util/ArrayList;

    new-instance v4, Lujg;

    invoke-direct {v4, v1, v6}, Lujg;-><init>(Lakg;B)V

    invoke-static {v4, v0}, Lnb6;->W(Lxq9;Ljava/util/List;)Ljava/util/AbstractList;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    new-array v4, v5, [Likg;

    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v4

    check-cast v4, [Likg;

    new-instance v5, Lyjg;

    if-eq v2, v8, :cond_149

    aget-object v9, v4, v2

    :cond_149
    move-object v2, v5

    new-instance v5, Lvjg;

    invoke-direct {v5, v1, v3, v0, v6}, Lvjg;-><init>(Lakg;Ljava/util/ArrayList;Ljava/util/ArrayList;B)V

    iget-object v0, v1, Lakg;->r:Ljava/lang/Object;

    check-cast v0, Landroid/view/View;

    invoke-static {v0}, Lipe;->A(Landroid/view/View;)Landroid/graphics/Point;

    move-object v0, v2

    const v2, 0x7f1401ea

    move-object v3, v4

    move-object v4, v9

    invoke-direct/range {v0 .. v5}, Lyjg;-><init>(Lakg;I[Likg;Likg;Lcom/opera/api/Callback;)V

    invoke-virtual {v1, v0}, Lakg;->v(Lyjg;)V

    goto/16 :goto_329

    :cond_164
    invoke-interface/range {p1 .. p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v3

    const v4, 0x7f0a0686

    if-ne v3, v4, :cond_213

    sget-object v2, Lxh0;->e:Lxh0;

    invoke-virtual {v1, v2}, Lakg;->s(Lxh0;)V

    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    const/4 v3, 0x3

    invoke-virtual {v1, v3, v2}, Lakg;->q(ILjava/util/ArrayList;)I

    move-result v4

    new-instance v10, Ljava/util/ArrayList;

    new-instance v11, Lujg;

    invoke-direct {v11, v1, v7}, Lujg;-><init>(Lakg;B)V

    invoke-static {v11, v2}, Lnb6;->W(Lxq9;Ljava/util/List;)Ljava/util/AbstractList;

    move-result-object v11

    invoke-direct {v10, v11}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    new-instance v11, Likg;

    iget-object v12, v1, Lakg;->q:Ljava/lang/Object;

    check-cast v12, Landroid/content/Context;

    const v13, 0x7f1403c0

    invoke-virtual {v12, v13}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v12

    invoke-direct {v11, v12}, Likg;-><init>(Ljava/lang/String;)V

    invoke-virtual {v10, v5, v11}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    if-ltz v4, :cond_1a2

    add-int/lit8 v4, v4, 0x1

    goto :goto_1ec

    :cond_1a2
    iget-object v0, v0, Lxbf;->e:Ljava/lang/Object;

    check-cast v0, Ljjg;

    iget-object v0, v0, Ljjg;->b:Ljava/lang/Object;

    check-cast v0, Ltjg;

    iget-object v0, v0, Ltjg;->n:Ljx6;

    invoke-virtual {v0}, Ljx6;->d()Lbx6;

    move-result-object v0

    move v11, v5

    :goto_1b1
    iget-object v12, v1, Lakg;->o:Ljava/lang/Object;

    check-cast v12, Lsvb;

    iget-object v12, v12, Lsvb;->g:Ljava/lang/Object;

    check-cast v12, Lpr;

    iget v13, v12, Lpr;->a:I

    if-ge v11, v13, :cond_1ec

    iget-object v13, v12, Lpr;->b:Ljava/lang/Object;

    check-cast v13, [I

    aget v13, v13, v11

    if-ne v13, v3, :cond_1e9

    iget-object v3, v12, Lpr;->c:Ljava/lang/Object;

    check-cast v3, [Lfyl;

    aget-object v3, v3, v11

    if-eqz v3, :cond_1ec

    invoke-virtual {v0, v11, v3}, Lbx6;->d(ILfyl;)Z

    move-result v12

    if-eqz v12, :cond_1ec

    iget-object v0, v0, Lbx6;->E0:Landroid/util/SparseArray;

    invoke-virtual {v0, v11}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map;

    if-eqz v0, :cond_1e4

    invoke-interface {v0, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcx6;

    goto :goto_1e5

    :cond_1e4
    move-object v0, v9

    :goto_1e5
    if-nez v0, :cond_1ec

    move v4, v5

    goto :goto_1ec

    :cond_1e9
    add-int/lit8 v11, v11, 0x1

    goto :goto_1b1

    :cond_1ec
    :goto_1ec
    new-array v0, v5, [Likg;

    invoke-virtual {v10, v0}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    move-object v3, v0

    check-cast v3, [Likg;

    new-instance v0, Lyjg;

    if-eq v4, v8, :cond_1fb

    aget-object v9, v3, v4

    :cond_1fb
    move-object v4, v9

    new-instance v5, Lvjg;

    invoke-direct {v5, v1, v10, v2, v7}, Lvjg;-><init>(Lakg;Ljava/util/ArrayList;Ljava/util/ArrayList;B)V

    iget-object v2, v1, Lakg;->r:Ljava/lang/Object;

    check-cast v2, Landroid/view/View;

    invoke-static {v2}, Lipe;->A(Landroid/view/View;)Landroid/graphics/Point;

    const v2, 0x7f1403c2

    invoke-direct/range {v0 .. v5}, Lyjg;-><init>(Lakg;I[Likg;Likg;Lcom/opera/api/Callback;)V

    invoke-virtual {v1, v0}, Lakg;->v(Lyjg;)V

    goto/16 :goto_329

    :cond_213
    invoke-interface/range {p1 .. p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    const v3, 0x7f0a06b3

    if-ne v0, v3, :cond_2bd

    sget-object v0, Lxh0;->f:Lxh0;

    invoke-virtual {v1, v0}, Lakg;->s(Lxh0;)V

    iget-object v0, v1, Lakg;->o:Ljava/lang/Object;

    check-cast v0, Lsvb;

    iget-object v0, v0, Lsvb;->d:Ljava/lang/Object;

    check-cast v0, Landroid/net/Uri;

    invoke-static {v0}, Ls29;->g(Landroid/net/Uri;)Z

    move-result v0

    const/16 v3, 0x13

    if-eqz v0, :cond_258

    iget-object v0, v1, Lakg;->q:Ljava/lang/Object;

    check-cast v0, Landroid/content/Context;

    iget-object v4, v1, Lakg;->o:Ljava/lang/Object;

    check-cast v4, Lsvb;

    iget-object v5, v4, Lsvb;->d:Ljava/lang/Object;

    check-cast v5, Landroid/net/Uri;

    iget-object v4, v4, Lsvb;->f:Ljava/lang/Object;

    check-cast v4, Ljava/lang/String;

    invoke-static {v0, v5, v4}, Lcom/opera/android/downloads/DownloadProvider;->b(Landroid/content/Context;Landroid/net/Uri;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    iget-object v4, v1, Lakg;->o:Ljava/lang/Object;

    check-cast v4, Lsvb;

    iget-object v4, v4, Lsvb;->f:Ljava/lang/Object;

    check-cast v4, Ljava/lang/String;

    new-instance v5, Li4d;

    new-instance v7, Lvvf;

    invoke-direct {v7, v0, v4, v3}, Lvvf;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-direct {v5, v7}, Li4d;-><init>(Lkotlin/jvm/functions/Function1;)V

    goto :goto_29f

    :cond_258
    iget-object v0, v1, Lakg;->o:Ljava/lang/Object;

    check-cast v0, Lsvb;

    iget-object v0, v0, Lsvb;->d:Ljava/lang/Object;

    check-cast v0, Landroid/net/Uri;

    invoke-virtual {v0}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v0

    const-string v4, "content"

    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    iget-object v4, v1, Lakg;->o:Ljava/lang/Object;

    check-cast v4, Lsvb;

    if-eqz v0, :cond_283

    iget-object v0, v4, Lsvb;->d:Ljava/lang/Object;

    check-cast v0, Landroid/net/Uri;

    iget-object v4, v4, Lsvb;->f:Ljava/lang/Object;

    check-cast v4, Ljava/lang/String;

    new-instance v5, Li4d;

    new-instance v7, Lvvf;

    invoke-direct {v7, v0, v4, v3}, Lvvf;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-direct {v5, v7}, Li4d;-><init>(Lkotlin/jvm/functions/Function1;)V

    goto :goto_29f

    :cond_283
    iget-object v0, v4, Lsvb;->d:Ljava/lang/Object;

    check-cast v0, Landroid/net/Uri;

    invoke-virtual {v0}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v0

    iget-object v3, v1, Lakg;->o:Ljava/lang/Object;

    check-cast v3, Lsvb;

    iget-object v3, v3, Lsvb;->e:Ljava/lang/Object;

    check-cast v3, Ljava/lang/String;

    new-instance v5, Li4d;

    new-instance v4, Le5f;

    const/16 v7, 0xa

    invoke-direct {v4, v0, v3, v7}, Le5f;-><init>(Ljava/lang/String;Ljava/lang/String;B)V

    invoke-direct {v5, v4}, Li4d;-><init>(Lkotlin/jvm/functions/Function1;)V

    :goto_29f
    new-instance v0, Lghf;

    invoke-direct {v0, v5}, Lghf;-><init>(Li4d;)V

    new-instance v3, Lwjg;

    invoke-direct {v3, v1}, Lwjg;-><init>(Lakg;)V

    iput-object v3, v0, Lghf;->c:Ljava/lang/Object;

    iget-object v1, v1, Lakg;->q:Ljava/lang/Object;

    check-cast v1, Landroid/content/Context;

    invoke-virtual {v0, v1}, Lghf;->I(Landroid/content/Context;)Ljjm;

    move-result-object v0

    if-eqz v2, :cond_329

    iget-object v1, v2, Lga6;->b:Ljava/lang/Object;

    check-cast v1, Ljava/util/HashSet;

    invoke-virtual {v1, v0}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    goto :goto_329

    :cond_2bd
    invoke-interface/range {p1 .. p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    const v3, 0x7f0a0688

    if-ne v0, v3, :cond_328

    sget-object v0, Lxh0;->g:Lxh0;

    invoke-virtual {v1, v0}, Lakg;->s(Lxh0;)V

    new-instance v0, Lrxh;

    const v3, 0x7f140568

    invoke-direct {v0, v3}, Lrxh;-><init>(I)V

    new-instance v3, Lwjg;

    invoke-direct {v3, v1}, Lwjg;-><init>(Lakg;)V

    if-eqz v2, :cond_2e1

    new-instance v4, Lr9g;

    const/4 v7, 0x4

    invoke-direct {v4, v2, v7}, Lr9g;-><init>(Ljava/lang/Object;B)V

    goto :goto_2e2

    :cond_2e1
    move-object v4, v9

    :goto_2e2
    new-instance v7, Lgkj;

    invoke-direct {v7, v5, v5}, Lnz0;-><init>(ZZ)V

    iput-object v9, v7, Lgkj;->a:Ljava/lang/String;

    iput-object v9, v7, Lgkj;->b:Ljava/lang/String;

    iput-object v9, v7, Lgkj;->c:Ljava/lang/String;

    iput-object v9, v7, Lgkj;->d:Ljava/lang/CharSequence;

    iput-object v9, v7, Lgkj;->e:Lekj;

    iput-object v4, v7, Lgkj;->f:Lfkj;

    iput-object v9, v7, Lgkj;->g:Lqp2;

    iput-object v3, v7, Lgkj;->h:Ldkj;

    iput-object v9, v7, Lgkj;->i:Ldkj;

    iput-object v9, v7, Lgkj;->j:Lql;

    const v3, 0x7f140567

    iput v3, v7, Lgkj;->k:I

    const v3, 0x7f1403bf

    iput v3, v7, Lgkj;->l:I

    const v3, 0x7f140569

    iput v3, v7, Lgkj;->m:I

    iput-boolean v6, v7, Lgkj;->n:Z

    iput-object v0, v7, Lgkj;->o:Lpxh;

    iget-object v0, v1, Lakg;->q:Ljava/lang/Object;

    check-cast v0, Landroid/content/Context;

    invoke-static {v0}, Lsfe;->U(Landroid/content/Context;)Lz77;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v1, Lijm;->b:Lijm;

    invoke-virtual {v0, v7, v1}, Lr22;->b(Ljjm;Lijm;)V

    if-eqz v2, :cond_329

    iget-object v0, v2, Lga6;->b:Ljava/lang/Object;

    check-cast v0, Ljava/util/HashSet;

    invoke-virtual {v0, v7}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    goto :goto_329

    :cond_328
    move v6, v5

    :cond_329
    :goto_329
    return v6

    :pswitch_data_32a
    .packed-switch 0x0
        :pswitch_20
    .end packed-switch

    :array_330
    .array-data 4
        0x3e800000    # 0.25f
        0x3f000000    # 0.5f
        0x3f400000    # 0.75f
        0x3f800000    # 1.0f
        0x3fa00000    # 1.25f
        0x3fc00000    # 1.5f
        0x3fe00000    # 1.75f
        0x40000000    # 2.0f
    .end array-data
.end method

.method public final q(ILjava/util/ArrayList;)I
    .registers 20

    move-object/from16 v0, p0

    iget-object v1, v0, Lakg;->o:Ljava/lang/Object;

    check-cast v1, Lsvb;

    iget-object v1, v1, Lsvb;->g:Ljava/lang/Object;

    check-cast v1, Lpr;

    const/4 v2, -0x1

    if-nez v1, :cond_e

    return v2

    :cond_e
    iget-object v1, v0, Lakg;->l:Ljava/lang/Object;

    check-cast v1, Lxbf;

    iget-object v1, v1, Lxbf;->e:Ljava/lang/Object;

    check-cast v1, Ljjg;

    iget-object v1, v1, Ljjg;->b:Ljava/lang/Object;

    check-cast v1, Ltjg;

    iget-object v1, v1, Ltjg;->n:Ljx6;

    invoke-virtual {v1}, Ljx6;->d()Lbx6;

    move-result-object v1

    move v4, v2

    move v5, v4

    move v7, v5

    const/4 v6, 0x0

    :goto_24
    iget-object v8, v0, Lakg;->o:Ljava/lang/Object;

    check-cast v8, Lsvb;

    iget-object v8, v8, Lsvb;->g:Ljava/lang/Object;

    check-cast v8, Lpr;

    iget v9, v8, Lpr;->a:I

    if-ge v6, v9, :cond_f1

    iget-object v9, v8, Lpr;->b:Ljava/lang/Object;

    check-cast v9, [I

    aget v9, v9, v6

    move/from16 v10, p1

    if-ne v9, v10, :cond_e8

    iget-object v8, v8, Lpr;->c:Ljava/lang/Object;

    check-cast v8, [Lfyl;

    aget-object v8, v8, v6

    if-eqz v8, :cond_e8

    invoke-virtual {v1, v6, v8}, Lbx6;->d(ILfyl;)Z

    move-result v11

    const/4 v9, 0x0

    if-eqz v11, :cond_59

    iget-object v12, v1, Lbx6;->E0:Landroid/util/SparseArray;

    invoke-virtual {v12, v6}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Ljava/util/Map;

    if-eqz v12, :cond_59

    invoke-interface {v12, v8}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lcx6;

    :cond_59
    move-object v12, v9

    const/4 v9, 0x0

    :goto_5b
    iget v13, v8, Lfyl;->a:I

    if-ge v9, v13, :cond_e8

    invoke-virtual {v8, v9}, Lfyl;->a(I)Leyl;

    move-result-object v13

    const/4 v14, 0x0

    :goto_64
    iget v15, v13, Leyl;->a:I

    if-ge v14, v15, :cond_dc

    iget-object v15, v13, Leyl;->d:[Loj9;

    aget-object v15, v15, v14

    iget-object v3, v0, Lakg;->o:Ljava/lang/Object;

    check-cast v3, Lsvb;

    iget-object v3, v3, Lsvb;->g:Ljava/lang/Object;

    check-cast v3, Lpr;

    invoke-virtual {v3, v6, v9, v14}, Lpr;->o(III)I

    move-result v3

    const/4 v2, 0x4

    if-eq v3, v2, :cond_8a

    const/4 v2, 0x3

    if-eq v3, v2, :cond_8a

    iget v2, v15, Loj9;->e:I

    and-int/lit8 v2, v2, 0x1

    if-nez v2, :cond_8a

    move v0, v4

    move v4, v14

    move v14, v9

    move-object v9, v8

    move v8, v6

    goto :goto_d2

    :cond_8a
    if-nez v11, :cond_a0

    iget v2, v15, Loj9;->e:I

    and-int/lit8 v2, v2, 0x1

    if-eqz v2, :cond_96

    invoke-virtual/range {p2 .. p2}, Ljava/util/ArrayList;->size()I

    move-result v7

    :cond_96
    iget v2, v15, Loj9;->e:I

    and-int/lit8 v2, v2, 0x2

    if-eqz v2, :cond_a0

    invoke-virtual/range {p2 .. p2}, Ljava/util/ArrayList;->size()I

    move-result v5

    :cond_a0
    move v2, v5

    move v3, v7

    if-eqz v12, :cond_b8

    iget v5, v12, Lcx6;->a:I

    if-ne v5, v9, :cond_b8

    iget-object v5, v12, Lcx6;->b:[I

    array-length v7, v5

    const/4 v0, 0x0

    :goto_ac
    if-ge v0, v7, :cond_b8

    move/from16 v16, v0

    aget v0, v5, v16

    if-ne v0, v14, :cond_ba

    invoke-virtual/range {p2 .. p2}, Ljava/util/ArrayList;->size()I

    move-result v4

    :cond_b8
    move v0, v4

    goto :goto_bd

    :cond_ba
    add-int/lit8 v0, v16, 0x1

    goto :goto_ac

    :goto_bd
    new-instance v4, Lzjg;

    move-object v7, v8

    move v8, v9

    move v9, v14

    move-object v5, v15

    invoke-direct/range {v4 .. v9}, Lzjg;-><init>(Loj9;ILfyl;II)V

    move-object v5, v4

    move v14, v8

    move v4, v9

    move v8, v6

    move-object v9, v7

    move-object/from16 v6, p2

    invoke-virtual {v6, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    move v5, v2

    move v7, v3

    :goto_d2
    add-int/lit8 v2, v4, 0x1

    move v4, v0

    move v6, v8

    move-object v8, v9

    move v9, v14

    move-object/from16 v0, p0

    move v14, v2

    goto :goto_64

    :cond_dc
    move v14, v9

    move-object v9, v8

    move v8, v6

    add-int/lit8 v0, v14, 0x1

    move v6, v8

    move-object v8, v9

    move v9, v0

    move-object/from16 v0, p0

    goto/16 :goto_5b

    :cond_e8
    move v8, v6

    add-int/lit8 v0, v8, 0x1

    move v6, v0

    const/4 v2, -0x1

    move-object/from16 v0, p0

    goto/16 :goto_24

    :cond_f1
    move v0, v2

    if-eq v4, v0, :cond_f5

    return v4

    :cond_f5
    if-eq v5, v0, :cond_f8

    return v5

    :cond_f8
    return v7
.end method

.method public final r(Loj9;)Ljava/lang/String;
    .registers 4

    iget-object v0, p1, Loj9;->d:Ljava/lang/String;

    iget-object v1, p1, Loj9;->d:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_76

    const-string v0, "und"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_76

    invoke-static {v1}, Ljava/util/Locale;->forLanguageTag(Ljava/lang/String;)Ljava/util/Locale;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/Locale;->getDisplayName()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_65

    iget p1, p1, Loj9;->f:I

    and-int/lit16 v1, p1, 0x440

    if-eqz v1, :cond_32

    iget-object p1, p0, Lakg;->q:Ljava/lang/Object;

    check-cast p1, Landroid/content/Context;

    const v1, 0x7f14070b

    invoke-virtual {p1, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p1

    goto :goto_63

    :cond_32
    and-int/lit8 v1, p1, 0x8

    if-eqz v1, :cond_42

    iget-object p1, p0, Lakg;->q:Ljava/lang/Object;

    check-cast p1, Landroid/content/Context;

    const v1, 0x7f14070c

    invoke-virtual {p1, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p1

    goto :goto_63

    :cond_42
    and-int/lit8 v1, p1, 0x4

    if-eqz v1, :cond_52

    iget-object p1, p0, Lakg;->q:Ljava/lang/Object;

    check-cast p1, Landroid/content/Context;

    const v1, 0x7f14070d

    invoke-virtual {p1, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p1

    goto :goto_63

    :cond_52
    and-int/lit8 p1, p1, 0x2

    if-eqz p1, :cond_62

    iget-object p1, p0, Lakg;->q:Ljava/lang/Object;

    check-cast p1, Landroid/content/Context;

    const v1, 0x7f14070a

    invoke-virtual {p1, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p1

    goto :goto_63

    :cond_62
    const/4 p1, 0x0

    :goto_63
    if-nez p1, :cond_66

    :cond_65
    return-object v0

    :cond_66
    iget-object p0, p0, Lakg;->q:Ljava/lang/Object;

    check-cast p0, Landroid/content/Context;

    const v1, 0x7f1412d1

    filled-new-array {v0, p1}, [Ljava/lang/Object;

    move-result-object p1

    invoke-virtual {p0, v1, p1}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_76
    iget-object p0, p1, Loj9;->b:Ljava/lang/String;

    return-object p0
.end method

.method public final s(Lxh0;)V
    .registers 8

    iget-object p0, p0, Lakg;->q:Ljava/lang/Object;

    check-cast p0, Landroid/content/Context;

    sget-object v0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    check-cast p0, Lcom/opera/android/OperaApplication;

    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object p0

    iget-object p0, p0, Ld6j;->c:Lx5f;

    iget-boolean v0, p0, Lx5f;->h:Z

    if-nez v0, :cond_17

    return-void

    :cond_17
    iget-object v0, p0, Lx5f;->d:Lzpa;

    new-instance v1, Lwh0;

    const/16 v2, 0x98b

    const/4 v3, -0x1

    const/4 v4, 0x1

    invoke-direct {v1, v2, v3, v4}, Ljf0;-><init>(III)V

    const/4 v2, 0x0

    invoke-virtual {v1, v2, v4, p1}, Ljf0;->q(IILjava/lang/Object;)V

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object p1

    invoke-virtual {p1, v0}, Lx56;->B(Lzpa;)Lqd0;

    move-result-object v0

    const/16 v2, 0xe

    invoke-virtual {v0, v2}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/List;

    if-eqz v3, :cond_44

    invoke-interface {v3}, Ljava/util/List;->isEmpty()Z

    move-result v5

    if-nez v5, :cond_44

    new-instance v4, Lhf0;

    invoke-direct {v4, v0, v2, v3}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    goto :goto_4d

    :cond_44
    invoke-static {v0, v2, v4}, Lvep;->t(Lqd0;II)Ljava/util/ArrayList;

    move-result-object v3

    new-instance v4, Lhf0;

    invoke-direct {v4, v0, v2, v3}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    :goto_4d
    invoke-virtual {v4, v1}, Ljava/util/AbstractList;->add(Ljava/lang/Object;)Z

    invoke-virtual {p0, p1}, Lx5f;->U0(Lx56;)V

    return-void
.end method

.method public final t(Landroid/view/Menu;)V
    .registers 10

    iget-object v0, p0, Lakg;->n:Ljava/lang/Object;

    check-cast v0, Lori;

    invoke-interface {v0}, Lori;->x()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_c
    :goto_c
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_78

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Leri;

    invoke-interface {v2}, Leri;->e()Z

    move-result v3

    if-nez v3, :cond_24

    invoke-interface {v0}, Lori;->B()Z

    move-result v3

    if-nez v3, :cond_c

    :cond_24
    invoke-interface {v2}, Leri;->getTitle()Ljava/lang/String;

    move-result-object v3

    invoke-interface {p1, v3}, Landroid/view/Menu;->add(Ljava/lang/CharSequence;)Landroid/view/MenuItem;

    move-result-object v3

    const v4, 0x7f0d00c2

    invoke-interface {v3, v4}, Landroid/view/MenuItem;->setActionView(I)Landroid/view/MenuItem;

    invoke-interface {v3}, Landroid/view/MenuItem;->getActionView()Landroid/view/View;

    move-result-object v4

    invoke-virtual {v4, v2}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    invoke-interface {v2}, Leri;->b()Z

    move-result v5

    const/4 v6, 0x0

    if-eqz v5, :cond_58

    new-instance v5, Luri;

    iget-object v7, p0, Lakg;->s:Ljava/lang/Object;

    check-cast v7, Ldkf;

    if-eqz v7, :cond_49

    move-object v6, v7

    :cond_49
    invoke-virtual {v6}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v6

    iget-object v7, p0, Lakg;->p:Ljava/lang/Object;

    check-cast v7, Lisd;

    invoke-direct {v5, v6, v7}, Luri;-><init>(Landroid/content/res/Resources;Ltri;)V

    invoke-virtual {v4, v5}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    goto :goto_5b

    :cond_58
    invoke-virtual {v4, v6}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    :goto_5b
    const/4 v4, 0x1

    invoke-interface {v3, v4}, Landroid/view/MenuItem;->setCheckable(Z)Landroid/view/MenuItem;

    iget-object v4, p0, Lakg;->m:Ljava/lang/Object;

    check-cast v4, Lpde;

    invoke-static {v4, v2}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v4

    invoke-interface {v3, v4}, Landroid/view/MenuItem;->setChecked(Z)Landroid/view/MenuItem;

    invoke-interface {v3}, Landroid/view/MenuItem;->getActionView()Landroid/view/View;

    move-result-object v4

    new-instance v5, Lvs5;

    const/4 v6, 0x4

    invoke-direct {v5, v2, p0, v3, v6}, Lvs5;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-static {v4, v5}, Lq9n;->f(Landroid/view/View;Lr8n;)V

    goto :goto_c

    :cond_78
    return-void
.end method

.method public final u(Lzjg;Lodf;)V
    .registers 7

    new-instance v0, Lcx6;

    iget v1, p1, Lzjg;->d:I

    iget v2, p1, Lzjg;->e:I

    filled-new-array {v2}, [I

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lcx6;-><init>(I[I)V

    iget-object p0, p0, Lakg;->l:Ljava/lang/Object;

    check-cast p0, Lxbf;

    iget-object p0, p0, Lxbf;->e:Ljava/lang/Object;

    check-cast p0, Ljjg;

    iget-object p0, p0, Ljjg;->b:Ljava/lang/Object;

    check-cast p0, Ltjg;

    iget-object p0, p0, Ltjg;->n:Ljx6;

    invoke-virtual {p0}, Ljx6;->d()Lbx6;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v2, Lax6;

    invoke-direct {v2, v1}, Lax6;-><init>(Lbx6;)V

    iget v1, p1, Lzjg;->b:I

    iget-object v3, p1, Lzjg;->c:Lfyl;

    invoke-virtual {v2, v1, v3, v0}, Lax6;->o(ILfyl;Lcx6;)V

    iget-object p1, p1, Lzjg;->a:Loj9;

    iget-byte p2, p2, Lodf;->a:B

    packed-switch p2, :pswitch_data_7a

    iget-object p2, p1, Loj9;->d:Ljava/lang/String;

    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p2

    if-eqz p2, :cond_42

    const/4 p1, 0x0

    invoke-virtual {v2, p1}, Lax6;->n(Ljava/lang/String;)V

    goto :goto_71

    :cond_42
    iget-object p1, p1, Loj9;->d:Ljava/lang/String;

    invoke-virtual {v2, p1}, Lax6;->n(Ljava/lang/String;)V

    goto :goto_71

    :pswitch_48
    iget-object p2, p1, Loj9;->d:Ljava/lang/String;

    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p2

    const/4 v0, 0x0

    if-eqz p2, :cond_5a

    new-array p1, v0, [Ljava/lang/String;

    invoke-static {p1}, Lmyl;->f([Ljava/lang/String;)Lcsh;

    move-result-object p1

    iput-object p1, v2, Lmyl;->q:Lcsh;

    goto :goto_71

    :cond_5a
    iget-object p1, p1, Loj9;->d:Ljava/lang/String;

    if-nez p1, :cond_67

    new-array p1, v0, [Ljava/lang/String;

    invoke-static {p1}, Lmyl;->f([Ljava/lang/String;)Lcsh;

    move-result-object p1

    iput-object p1, v2, Lmyl;->q:Lcsh;

    goto :goto_71

    :cond_67
    filled-new-array {p1}, [Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lmyl;->f([Ljava/lang/String;)Lcsh;

    move-result-object p1

    iput-object p1, v2, Lmyl;->q:Lcsh;

    :goto_71
    new-instance p1, Lbx6;

    invoke-direct {p1, v2}, Lbx6;-><init>(Lax6;)V

    invoke-virtual {p0, p1}, Ljx6;->k(Lnyl;)V

    return-void

    :pswitch_data_7a
    .packed-switch 0x14
        :pswitch_48
    .end packed-switch
.end method

.method public final v(Lyjg;)V
    .registers 4

    iget-object v0, p0, Lakg;->q:Ljava/lang/Object;

    check-cast v0, Landroid/content/Context;

    invoke-static {v0}, La4h;->f(Landroid/content/Context;)Lnej;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v1, Lijm;->b:Lijm;

    invoke-virtual {v0, p1, v1}, Lr22;->b(Ljjm;Lijm;)V

    iget-object p0, p0, Lakg;->n:Ljava/lang/Object;

    check-cast p0, Lga6;

    if-eqz p0, :cond_1d

    iget-object p0, p0, Lga6;->b:Ljava/lang/Object;

    check-cast p0, Ljava/util/HashSet;

    invoke-virtual {p0, p1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    :cond_1d
    return-void
.end method

.method public final w()V
    .registers 16

    new-instance v0, Lsvb;

    iget-object v1, p0, Lakg;->l:Ljava/lang/Object;

    check-cast v1, Lxbf;

    invoke-direct {v0, v1}, Lsvb;-><init>(Lxbf;)V

    iput-object v0, p0, Lakg;->o:Ljava/lang/Object;

    iget-object v0, p0, Lakg;->p:Ljava/lang/Object;

    check-cast v0, Lm66;

    const v1, 0x7f0a06b4

    invoke-virtual {v0, v1}, Litd;->findItem(I)Landroid/view/MenuItem;

    move-result-object v0

    iget-object v2, p0, Lakg;->o:Ljava/lang/Object;

    check-cast v2, Lsvb;

    iget-object v2, v2, Lsvb;->b:Ljava/lang/Object;

    check-cast v2, Lqjd;

    const/4 v3, 0x0

    const/4 v4, 0x1

    if-eqz v2, :cond_3f

    iget-object v5, v2, Lqjd;->e:Lvjd;

    invoke-static {v5}, Lsfe;->d0(Lvjd;)Landroid/net/Uri;

    move-result-object v5

    if-nez v5, :cond_37

    iget-object v2, v2, Lqjd;->b:Lmjd;

    if-eqz v2, :cond_31

    iget-object v5, v2, Lmjd;->a:Landroid/net/Uri;

    goto :goto_37

    :cond_31
    const-string v2, ""

    invoke-static {v2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v5

    :cond_37
    :goto_37
    invoke-static {v5}, Ls29;->g(Landroid/net/Uri;)Z

    move-result v2

    if-eqz v2, :cond_3f

    move v2, v4

    goto :goto_40

    :cond_3f
    move v2, v3

    :goto_40
    invoke-interface {v0, v2}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    iget-object v0, p0, Lakg;->p:Ljava/lang/Object;

    check-cast v0, Lm66;

    invoke-virtual {v0, v1}, Litd;->findItem(I)Landroid/view/MenuItem;

    move-result-object v0

    iget-object v1, p0, Lo73;->a:Ldkf;

    if-nez v1, :cond_53

    iget-object v1, p0, Lakg;->q:Ljava/lang/Object;

    check-cast v1, Landroid/content/Context;

    :cond_53
    iget-object v2, p0, Lakg;->o:Ljava/lang/Object;

    check-cast v2, Lsvb;

    iget v2, v2, Lsvb;->a:F

    iget-object v5, p0, Lakg;->q:Ljava/lang/Object;

    check-cast v5, Landroid/content/Context;

    invoke-static {}, Ljava/text/NumberFormat;->getInstance()Ljava/text/NumberFormat;

    move-result-object v6

    check-cast v6, Ljava/text/DecimalFormat;

    invoke-virtual {v6, v3}, Ljava/text/DecimalFormat;->setMinimumFractionDigits(I)V

    const/4 v7, 0x2

    invoke-virtual {v6, v7}, Ljava/text/DecimalFormat;->setMaximumFractionDigits(I)V

    float-to-double v8, v2

    invoke-virtual {v6, v8, v9}, Ljava/text/NumberFormat;->format(D)Ljava/lang/String;

    move-result-object v2

    filled-new-array {v2}, [Ljava/lang/Object;

    move-result-object v2

    const v6, 0x7f141176

    invoke-virtual {v5, v6, v2}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    const v5, 0x7f140d2a

    invoke-virtual {v1, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v5

    new-instance v6, Landroid/text/SpannableStringBuilder;

    invoke-direct {v6, v5}, Landroid/text/SpannableStringBuilder;-><init>(Ljava/lang/CharSequence;)V

    const-string v8, " \u2022 "

    invoke-virtual {v6, v8}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    invoke-virtual {v6, v2}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    new-instance v2, Lj97;

    invoke-direct {v2, v1, v7}, Lj97;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v1

    invoke-virtual {v6}, Landroid/text/SpannableStringBuilder;->length()I

    move-result v5

    const/16 v8, 0x21

    invoke-virtual {v6, v2, v1, v5, v8}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    invoke-interface {v0, v6}, Landroid/view/MenuItem;->setTitle(Ljava/lang/CharSequence;)Landroid/view/MenuItem;

    iget-object v0, p0, Lakg;->o:Ljava/lang/Object;

    check-cast v0, Lsvb;

    iget-object v0, v0, Lsvb;->g:Ljava/lang/Object;

    check-cast v0, Lpr;

    if-eqz v0, :cond_10b

    move v0, v3

    move v1, v0

    move v2, v1

    move v5, v2

    :goto_b1
    iget-object v6, p0, Lakg;->o:Ljava/lang/Object;

    check-cast v6, Lsvb;

    iget-object v6, v6, Lsvb;->g:Ljava/lang/Object;

    check-cast v6, Lpr;

    iget v8, v6, Lpr;->a:I

    if-ge v0, v8, :cond_10e

    iget-object v6, v6, Lpr;->c:Ljava/lang/Object;

    check-cast v6, [Lfyl;

    aget-object v6, v6, v0

    if-eqz v6, :cond_108

    move v8, v3

    move v9, v8

    :goto_c7
    iget v10, v6, Lfyl;->a:I

    const/4 v11, 0x3

    if-ge v8, v10, :cond_ed

    invoke-virtual {v6, v8}, Lfyl;->a(I)Leyl;

    move-result-object v10

    move v12, v3

    :goto_d1
    iget v13, v10, Leyl;->a:I

    if-ge v12, v13, :cond_ea

    iget-object v13, p0, Lakg;->o:Ljava/lang/Object;

    check-cast v13, Lsvb;

    iget-object v13, v13, Lsvb;->g:Ljava/lang/Object;

    check-cast v13, Lpr;

    invoke-virtual {v13, v0, v8, v12}, Lpr;->o(III)I

    move-result v13

    const/4 v14, 0x4

    if-eq v13, v14, :cond_e9

    if-eq v13, v11, :cond_e9

    add-int/lit8 v12, v12, 0x1

    goto :goto_d1

    :cond_e9
    move v9, v4

    :cond_ea
    add-int/lit8 v8, v8, 0x1

    goto :goto_c7

    :cond_ed
    if-eqz v9, :cond_108

    iget-object v6, p0, Lakg;->o:Ljava/lang/Object;

    check-cast v6, Lsvb;

    iget-object v6, v6, Lsvb;->g:Ljava/lang/Object;

    check-cast v6, Lpr;

    iget-object v6, v6, Lpr;->b:Ljava/lang/Object;

    check-cast v6, [I

    aget v6, v6, v0

    if-eq v6, v4, :cond_107

    if-eq v6, v7, :cond_105

    if-ne v6, v11, :cond_108

    move v5, v4

    goto :goto_108

    :cond_105
    move v1, v4

    goto :goto_108

    :cond_107
    move v2, v4

    :cond_108
    :goto_108
    add-int/lit8 v0, v0, 0x1

    goto :goto_b1

    :cond_10b
    move v1, v3

    move v2, v1

    move v5, v2

    :cond_10e
    iget-object v0, p0, Lakg;->p:Ljava/lang/Object;

    check-cast v0, Lm66;

    const v6, 0x7f0a06b0

    invoke-virtual {v0, v6}, Litd;->findItem(I)Landroid/view/MenuItem;

    move-result-object v0

    invoke-interface {v0, v1}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    iget-object v0, p0, Lakg;->p:Ljava/lang/Object;

    check-cast v0, Lm66;

    const v1, 0x7f0a0684

    invoke-virtual {v0, v1}, Litd;->findItem(I)Landroid/view/MenuItem;

    move-result-object v0

    invoke-interface {v0, v2}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    iget-object v0, p0, Lakg;->p:Ljava/lang/Object;

    check-cast v0, Lm66;

    const v1, 0x7f0a0686

    invoke-virtual {v0, v1}, Litd;->findItem(I)Landroid/view/MenuItem;

    move-result-object v0

    invoke-interface {v0, v5}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    iget-object v0, p0, Lakg;->p:Ljava/lang/Object;

    check-cast v0, Lm66;

    const v1, 0x7f0a06b3

    invoke-virtual {v0, v1}, Litd;->findItem(I)Landroid/view/MenuItem;

    move-result-object v0

    iget-object v1, p0, Lakg;->o:Ljava/lang/Object;

    check-cast v1, Lsvb;

    iget-object v1, v1, Lsvb;->d:Ljava/lang/Object;

    check-cast v1, Landroid/net/Uri;

    if-eqz v1, :cond_14f

    move v1, v4

    goto :goto_150

    :cond_14f
    move v1, v3

    :goto_150
    invoke-interface {v0, v1}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    iget-object v0, p0, Lakg;->p:Ljava/lang/Object;

    check-cast v0, Lm66;

    const v1, 0x7f0a0688

    invoke-virtual {v0, v1}, Litd;->findItem(I)Landroid/view/MenuItem;

    move-result-object v0

    iget-object p0, p0, Lakg;->o:Ljava/lang/Object;

    check-cast p0, Lsvb;

    iget-object p0, p0, Lsvb;->c:Ljava/lang/Object;

    check-cast p0, Lre7;

    if-eqz p0, :cond_16f

    invoke-virtual {p0}, Lre7;->k()Z

    move-result p0

    if-eqz p0, :cond_16f

    move v3, v4

    :cond_16f
    invoke-interface {v0, v3}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    return-void
.end method

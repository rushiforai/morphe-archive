.class public final Lxw;
.super Lo73;
.source "SourceFile"


# instance fields
.field public final synthetic j:B

.field public k:Ljava/lang/Object;

.field public final l:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(BLjava/lang/Object;Ljava/lang/Object;Z)V
    .registers 5

    .line 95
    iput-byte p1, p0, Lxw;->j:B

    iput-object p2, p0, Lxw;->k:Ljava/lang/Object;

    iput-object p3, p0, Lxw;->l:Ljava/lang/Object;

    invoke-direct {p0}, Lo73;-><init>()V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Ljbn;)V
    .registers 9

    const/16 v0, 0xb

    iput-byte v0, p0, Lxw;->j:B

    invoke-direct {p0}, Lo73;-><init>()V

    iput-object p2, p0, Lxw;->k:Ljava/lang/Object;

    invoke-virtual {p2}, Ljbn;->b()Ljava/util/ArrayList;

    move-result-object p2

    invoke-static {}, Lywc;->d()V

    sget-object v0, Lywc;->a:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v0

    check-cast v0, Ljava/util/Set;

    invoke-static {}, Lywc;->c()Ljava/util/ArrayList;

    move-result-object v1

    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_25
    :goto_25
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_4e

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_25

    invoke-static {v3}, Lywc;->a(Ljava/lang/String;)Lxwc;

    move-result-object v4

    new-instance v5, Lsbn;

    invoke-static {v3}, Lsfe;->S(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iget v4, v4, Lxwc;->b:I

    invoke-virtual {p1, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v5, v3, v4}, Lsbn;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_25

    :cond_4e
    new-instance p1, Lta2;

    invoke-direct {p1, p2}, Lta2;-><init>(Ljava/util/ArrayList;)V

    invoke-static {p1, v2}, Ln95;->r(Ljava/util/Comparator;Ljava/util/List;)V

    iput-object v2, p0, Lxw;->l:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lgn3;Lqhc;)V
    .registers 4

    const/4 v0, 0x4

    iput-byte v0, p0, Lxw;->j:B

    .line 100
    iput-object p2, p0, Lxw;->k:Ljava/lang/Object;

    iput-object p1, p0, Lxw;->l:Ljava/lang/Object;

    invoke-direct {p0}, Lo73;-><init>()V

    return-void
.end method

.method public constructor <init>(Lim3;)V
    .registers 3

    const/4 v0, 0x3

    iput-byte v0, p0, Lxw;->j:B

    .line 99
    iput-object p1, p0, Lxw;->l:Ljava/lang/Object;

    invoke-direct {p0}, Lo73;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;Lcom/opera/android/autofill/Address;B)V
    .registers 4

    .line 89
    iput-byte p3, p0, Lxw;->j:B

    iput-object p1, p0, Lxw;->l:Ljava/lang/Object;

    invoke-direct {p0}, Lo73;-><init>()V

    iput-object p2, p0, Lxw;->k:Ljava/lang/Object;

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;Ljava/lang/Object;B)V
    .registers 4

    .line 90
    iput-byte p3, p0, Lxw;->j:B

    invoke-direct {p0}, Lo73;-><init>()V

    iput-object p1, p0, Lxw;->k:Ljava/lang/Object;

    iput-object p2, p0, Lxw;->l:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lm0a;)V
    .registers 3

    const/4 v0, 0x7

    iput-byte v0, p0, Lxw;->j:B

    .line 91
    invoke-direct {p0}, Lo73;-><init>()V

    .line 92
    iput-object p1, p0, Lxw;->k:Ljava/lang/Object;

    .line 93
    iget-object p1, p1, Lm0a;->a:Ltah;

    .line 94
    iput-object p1, p0, Lxw;->l:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lvvj;Lig7;)V
    .registers 4

    const/4 v0, 0x5

    iput-byte v0, p0, Lxw;->j:B

    .line 96
    invoke-direct {p0}, Lo73;-><init>()V

    .line 97
    iput-object p1, p0, Lxw;->l:Ljava/lang/Object;

    .line 98
    iput-object p2, p0, Lxw;->k:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final l(Landroid/view/View;)Z
    .registers 3

    iget-byte v0, p0, Lxw;->j:B

    packed-switch v0, :pswitch_data_1c

    invoke-super {p0, p1}, Lo73;->l(Landroid/view/View;)Z

    move-result p0

    return p0

    :pswitch_a
    invoke-static {p1}, Lcs5;->W(Landroid/view/View;)Z

    move-result p0

    :goto_e
    xor-int/lit8 p0, p0, 0x1

    return p0

    :pswitch_11
    invoke-static {p1}, Lcs5;->W(Landroid/view/View;)Z

    move-result p0

    goto :goto_e

    :pswitch_16
    invoke-static {p1}, Lcs5;->W(Landroid/view/View;)Z

    move-result p0

    goto :goto_e

    nop

    :pswitch_data_1c
    .packed-switch 0x0
        :pswitch_16
        :pswitch_11
        :pswitch_a
    .end packed-switch
.end method

.method public final m(Lr9i;Landroid/view/View;)V
    .registers 20

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    iget-byte v2, v0, Lxw;->j:B

    const v3, 0x7f100009

    const/4 v4, 0x3

    const v5, 0x7f0a068d

    const v6, 0x7f100023

    const/4 v7, 0x0

    iget-object v8, v0, Lxw;->l:Ljava/lang/Object;

    const/4 v9, 0x1

    const/4 v10, 0x0

    packed-switch v2, :pswitch_data_3a0

    invoke-virtual {v1, v6}, Lr9i;->L(I)V

    iget-object v1, v1, Lr9i;->c:Ljava/lang/Object;

    check-cast v1, Lm66;

    invoke-virtual {v1, v5}, Litd;->findItem(I)Landroid/view/MenuItem;

    move-result-object v1

    iget-object v0, v0, Lxw;->k:Ljava/lang/Object;

    check-cast v0, Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lr9n;->A(Landroid/content/Context;)Z

    move-result v0

    invoke-interface {v1, v0}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    return-void

    :pswitch_33
    iget-object v2, v1, Lr9i;->c:Ljava/lang/Object;

    check-cast v2, Lm66;

    if-eqz v2, :cond_3c

    iput-boolean v9, v2, Litd;->x:Z

    goto :goto_3e

    :cond_3c
    iput-boolean v9, v2, Litd;->x:Z

    :goto_3e
    const v3, 0x7f100006

    invoke-virtual {v1, v3}, Lr9i;->L(I)V

    iget-object v0, v0, Lxw;->k:Ljava/lang/Object;

    check-cast v0, Lssn;

    iget-object v1, v0, Lssn;->f:Losn;

    iget-object v3, v0, Lssn;->g:Losn;

    iget-object v4, v0, Lssn;->e:Losn;

    iget-object v5, v0, Lssn;->d:Losn;

    iget-object v6, v0, Lssn;->c:Losn;

    iget-object v7, v0, Lssn;->b:Losn;

    iget-object v8, v0, Lssn;->a:Losn;

    const v11, 0x7f0a01ff

    invoke-static {v2, v11, v1}, Laoh;->f(Landroid/view/Menu;ILosn;)V

    const v1, 0x7f0a04ab

    invoke-virtual {v2, v1}, Litd;->findItem(I)Landroid/view/MenuItem;

    move-result-object v1

    iget-object v0, v0, Lssn;->f:Losn;

    sget-object v11, Losn;->a:Losn;

    if-eq v0, v11, :cond_77

    if-ne v8, v11, :cond_75

    if-ne v7, v11, :cond_75

    if-ne v6, v11, :cond_75

    if-ne v5, v11, :cond_75

    if-ne v4, v11, :cond_75

    if-eq v3, v11, :cond_77

    :cond_75
    move v0, v9

    goto :goto_78

    :cond_77
    move v0, v10

    :goto_78
    invoke-interface {v1, v0}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    const v0, 0x7f0a0293

    invoke-static {v2, v0, v8}, Laoh;->f(Landroid/view/Menu;ILosn;)V

    const v0, 0x7f0a0a3b

    invoke-static {v2, v0, v7}, Laoh;->f(Landroid/view/Menu;ILosn;)V

    const v0, 0x7f0a02cd

    invoke-static {v2, v0, v6}, Laoh;->f(Landroid/view/Menu;ILosn;)V

    const v0, 0x7f0a0952

    invoke-virtual {v2, v0}, Litd;->findItem(I)Landroid/view/MenuItem;

    move-result-object v0

    if-ne v8, v11, :cond_9a

    if-ne v7, v11, :cond_9a

    if-eq v6, v11, :cond_a0

    :cond_9a
    if-ne v5, v11, :cond_a1

    if-ne v4, v11, :cond_a1

    if-ne v3, v11, :cond_a1

    :cond_a0
    move v9, v10

    :cond_a1
    invoke-interface {v0, v9}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    const v0, 0x7f0a0a65

    invoke-static {v2, v0, v5}, Laoh;->f(Landroid/view/Menu;ILosn;)V

    const v0, 0x7f0a0994

    invoke-static {v2, v0, v4}, Laoh;->f(Landroid/view/Menu;ILosn;)V

    const v0, 0x7f0a041a

    invoke-virtual {v2, v0}, Litd;->findItem(I)Landroid/view/MenuItem;

    move-result-object v1

    invoke-virtual/range {p2 .. p2}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v4

    const v5, 0x7f140110

    invoke-virtual {v4, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v5

    filled-new-array {v5}, [Ljava/lang/Object;

    move-result-object v5

    const v6, 0x7f1400f9

    invoke-virtual {v4, v6, v5}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-interface {v1, v4}, Landroid/view/MenuItem;->setTitle(Ljava/lang/CharSequence;)Landroid/view/MenuItem;

    invoke-static {v2, v0, v3}, Laoh;->f(Landroid/view/Menu;ILosn;)V

    return-void

    :pswitch_d4
    iget-object v1, v1, Lr9i;->c:Ljava/lang/Object;

    check-cast v1, Lm66;

    iget-object v0, v0, Lxw;->k:Ljava/lang/Object;

    check-cast v0, Ljbn;

    invoke-virtual {v0}, Ljbn;->b()Ljava/util/ArrayList;

    move-result-object v0

    check-cast v8, Ljava/util/ArrayList;

    invoke-virtual {v8}, Ljava/util/ArrayList;->size()I

    move-result v2

    move v3, v10

    move v4, v3

    :goto_e8
    if-ge v4, v2, :cond_10d

    invoke-virtual {v8, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    add-int/lit8 v4, v4, 0x1

    add-int/lit8 v6, v3, 0x1

    if-ltz v3, :cond_109

    check-cast v5, Lsbn;

    iget-object v5, v5, Lsbn;->b:Ljava/lang/String;

    invoke-virtual {v1, v10, v6, v6, v5}, Litd;->a(IIILjava/lang/CharSequence;)Lptd;

    move-result-object v5

    invoke-virtual {v5, v9}, Lptd;->setCheckable(Z)Landroid/view/MenuItem;

    if-nez v3, :cond_103

    move v3, v9

    goto :goto_104

    :cond_103
    move v3, v10

    :goto_104
    invoke-virtual {v5, v3}, Lptd;->setChecked(Z)Landroid/view/MenuItem;

    move v3, v6

    goto :goto_e8

    :cond_109
    invoke-static {}, Lj95;->n()V

    throw v7

    :cond_10d
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    const-string v2, ""

    invoke-virtual {v1, v10, v10, v0, v2}, Litd;->a(IIILjava/lang/CharSequence;)Lptd;

    move-result-object v0

    const v1, 0x7f0d010e

    invoke-virtual {v0, v1}, Lptd;->setActionView(I)Landroid/view/MenuItem;

    invoke-virtual {v0, v10}, Lptd;->setEnabled(Z)Landroid/view/MenuItem;

    return-void

    :pswitch_121
    const v2, 0x7f100031

    invoke-virtual {v1, v2}, Lr9i;->L(I)V

    iget-object v1, v1, Lr9i;->c:Ljava/lang/Object;

    check-cast v1, Lm66;

    const v2, 0x7f0a068f

    invoke-virtual {v1, v2}, Litd;->findItem(I)Landroid/view/MenuItem;

    move-result-object v2

    iget-object v0, v0, Lxw;->k:Ljava/lang/Object;

    check-cast v0, Leqi;

    iget-object v3, v0, Leqi;->a:Ljava/lang/String;

    if-eqz v3, :cond_13c

    move v3, v9

    goto :goto_13d

    :cond_13c
    move v3, v10

    :goto_13d
    invoke-interface {v2, v3}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    const v2, 0x7f0a0690

    invoke-virtual {v1, v2}, Litd;->findItem(I)Landroid/view/MenuItem;

    move-result-object v1

    iget-object v0, v0, Leqi;->b:Ljava/lang/String;

    if-nez v0, :cond_14c

    move v9, v10

    :cond_14c
    invoke-interface {v1, v9}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    return-void

    :pswitch_150
    const v0, 0x7f100038

    invoke-virtual {v1, v0}, Lr9i;->L(I)V

    return-void

    :pswitch_157
    const v0, 0x7f100037

    invoke-virtual {v1, v0}, Lr9i;->L(I)V

    return-void

    :pswitch_15e
    const v2, 0x7f100019

    invoke-virtual {v1, v2}, Lr9i;->L(I)V

    iget-object v2, v0, Lxw;->k:Ljava/lang/Object;

    check-cast v2, Lm0a;

    iget-object v2, v2, Lm0a;->e:Lpde;

    iget-object v3, v1, Lr9i;->d:Ljava/lang/Object;

    check-cast v3, Lo66;

    iget-object v3, v3, Lo66;->F:Lkze;

    new-instance v5, Lwj;

    invoke-direct {v5, v0, v1, v4}, Lwj;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-static {v2, v3, v5}, La26;->T(Lekc;Likc;Lf7f;)V

    iget-object v0, v1, Lr9i;->c:Ljava/lang/Object;

    check-cast v0, Lm66;

    const v2, 0x7f0a04e7

    invoke-virtual {v0, v2}, Litd;->findItem(I)Landroid/view/MenuItem;

    move-result-object v0

    const v2, 0x7f0d00e5

    invoke-interface {v0, v2}, Landroid/view/MenuItem;->setActionView(I)Landroid/view/MenuItem;

    invoke-interface {v0}, Landroid/view/MenuItem;->getActionView()Landroid/view/View;

    move-result-object v2

    instance-of v3, v2, Lcom/opera/android/menu/CustomMenuItemView;

    if-eqz v3, :cond_194

    move-object v7, v2

    check-cast v7, Lcom/opera/android/menu/CustomMenuItemView;

    :cond_194
    if-eqz v7, :cond_19f

    iget-boolean v2, v7, Lcom/opera/android/menu/CustomMenuItemView;->e:Z

    if-eqz v2, :cond_19f

    iput-boolean v10, v7, Lcom/opera/android/menu/CustomMenuItemView;->e:Z

    invoke-virtual {v7}, Lcom/opera/android/menu/CustomMenuItemView;->d()V

    :cond_19f
    iget-object v1, v1, Lr9i;->b:Ljava/lang/Object;

    check-cast v1, Ldkf;

    const v2, 0x7f0801e3

    invoke-static {v2, v1}, Lj14;->i0(ILandroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-interface {v0, v1}, Landroid/view/MenuItem;->setIcon(Landroid/graphics/drawable/Drawable;)Landroid/view/MenuItem;

    return-void

    :pswitch_1ae
    invoke-virtual {v1, v6}, Lr9i;->L(I)V

    iget-object v1, v1, Lr9i;->c:Ljava/lang/Object;

    check-cast v1, Lm66;

    invoke-virtual {v1, v5}, Litd;->findItem(I)Landroid/view/MenuItem;

    move-result-object v1

    iget-object v0, v0, Lxw;->k:Ljava/lang/Object;

    check-cast v0, Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lr9n;->A(Landroid/content/Context;)Z

    move-result v0

    invoke-interface {v1, v0}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    return-void

    :pswitch_1c9
    const v0, 0x7f100018

    invoke-virtual {v1, v0}, Lr9i;->L(I)V

    iget-object v0, v1, Lr9i;->c:Ljava/lang/Object;

    move-object v11, v0

    check-cast v11, Lm66;

    const/4 v15, 0x0

    const/16 v16, 0x0

    const v12, 0x7f14060f

    const/4 v13, 0x0

    const/4 v14, 0x0

    invoke-virtual/range {v11 .. v16}, Litd;->u(ILjava/lang/CharSequence;ILandroid/graphics/drawable/Drawable;Landroid/view/View;)V

    iget-object v0, v1, Lr9i;->c:Ljava/lang/Object;

    check-cast v0, Lm66;

    check-cast v8, Lvvj;

    invoke-virtual {v8}, Ljava/lang/Enum;->ordinal()I

    move-result v1

    if-eqz v1, :cond_1fe

    if-eq v1, v9, :cond_1fa

    const/4 v2, 0x2

    if-eq v1, v2, :cond_1f6

    if-ne v1, v4, :cond_201

    const v10, 0x7f0a0335

    goto :goto_201

    :cond_1f6
    const v10, 0x7f0a0332

    goto :goto_201

    :cond_1fa
    const v10, 0x7f0a0334

    goto :goto_201

    :cond_1fe
    const v10, 0x7f0a0333

    :cond_201
    :goto_201
    invoke-virtual {v0, v10}, Litd;->findItem(I)Landroid/view/MenuItem;

    move-result-object v0

    invoke-interface {v0, v9}, Landroid/view/MenuItem;->setChecked(Z)Landroid/view/MenuItem;

    return-void

    :pswitch_209
    const v2, 0x7f100010

    invoke-virtual {v1, v2}, Lr9i;->L(I)V

    iget-object v1, v1, Lr9i;->c:Ljava/lang/Object;

    check-cast v1, Lm66;

    const v2, 0x7f0a06a2

    invoke-virtual {v1, v2}, Litd;->findItem(I)Landroid/view/MenuItem;

    move-result-object v2

    iget-object v0, v0, Lxw;->k:Ljava/lang/Object;

    check-cast v0, Lqhc;

    iget-object v3, v0, Lqhc;->a:Lal3;

    iget-object v4, v0, Lqhc;->a:Lal3;

    invoke-interface {v3}, Lol3;->g()Z

    move-result v3

    if-nez v3, :cond_232

    check-cast v8, Lgn3;

    invoke-virtual {v8}, Lgn3;->e()Z

    move-result v3

    if-eqz v3, :cond_232

    move v3, v9

    goto :goto_233

    :cond_232
    move v3, v10

    :goto_233
    invoke-interface {v2, v3}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    const v2, 0x7f0a0694

    invoke-virtual {v1, v2}, Litd;->findItem(I)Landroid/view/MenuItem;

    move-result-object v2

    iget v3, v0, Lqhc;->b:I

    if-ne v3, v9, :cond_243

    move v3, v9

    goto :goto_244

    :cond_243
    move v3, v10

    :goto_244
    invoke-interface {v2, v3}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    const v2, 0x7f0a0691

    invoke-virtual {v1, v2}, Litd;->findItem(I)Landroid/view/MenuItem;

    move-result-object v2

    invoke-virtual {v0}, Lqhc;->a()Z

    move-result v3

    invoke-interface {v2, v3}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    invoke-interface {v4}, Lol3;->g()Z

    move-result v2

    if-nez v2, :cond_266

    invoke-virtual {v0}, Lqhc;->e()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lz5i;->a0(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_266

    move v10, v9

    :cond_266
    const v0, 0x7f0a068e

    invoke-virtual {v1, v0}, Litd;->findItem(I)Landroid/view/MenuItem;

    move-result-object v0

    invoke-interface {v0, v10}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    const v0, 0x7f0a06a1

    invoke-virtual {v1, v0}, Litd;->findItem(I)Landroid/view/MenuItem;

    move-result-object v0

    invoke-interface {v0, v10}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    new-instance v0, Ll5b;

    invoke-direct {v0, v9}, Ll5b;-><init>(B)V

    invoke-interface {v4, v0}, Lal3;->c(Lzk3;)Z

    iget-boolean v0, v0, Ll5b;->b:Z

    const v2, 0x7f0a0697

    invoke-virtual {v1, v2, v0}, Litd;->setGroupVisible(IZ)V

    invoke-interface {v4}, Lol3;->g()Z

    move-result v0

    const v2, 0x7f0a0699

    const v3, 0x7f0a069a

    if-eqz v0, :cond_2bb

    invoke-virtual {v1, v3}, Litd;->findItem(I)Landroid/view/MenuItem;

    move-result-object v0

    invoke-virtual/range {p2 .. p2}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v3

    const v4, 0x7f140be9

    invoke-virtual {v3, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v0, v3}, Landroid/view/MenuItem;->setTitle(Ljava/lang/CharSequence;)Landroid/view/MenuItem;

    invoke-virtual {v1, v2}, Litd;->findItem(I)Landroid/view/MenuItem;

    move-result-object v0

    invoke-virtual/range {p2 .. p2}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    const v2, 0x7f140a37

    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Landroid/view/MenuItem;->setTitle(Ljava/lang/CharSequence;)Landroid/view/MenuItem;

    goto :goto_2df

    :cond_2bb
    invoke-virtual {v1, v3}, Litd;->findItem(I)Landroid/view/MenuItem;

    move-result-object v0

    invoke-virtual/range {p2 .. p2}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v3

    const v4, 0x7f1404fc

    invoke-virtual {v3, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v0, v3}, Landroid/view/MenuItem;->setTitle(Ljava/lang/CharSequence;)Landroid/view/MenuItem;

    invoke-virtual {v1, v2}, Litd;->findItem(I)Landroid/view/MenuItem;

    move-result-object v0

    invoke-virtual/range {p2 .. p2}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    const v2, 0x7f1404fe

    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Landroid/view/MenuItem;->setTitle(Ljava/lang/CharSequence;)Landroid/view/MenuItem;

    :goto_2df
    return-void

    :pswitch_2e0
    const v2, 0x7f100027

    invoke-virtual {v1, v2}, Lr9i;->L(I)V

    iget-object v1, v1, Lr9i;->c:Ljava/lang/Object;

    check-cast v1, Lm66;

    iput-object v1, v0, Lxw;->k:Ljava/lang/Object;

    check-cast v8, Lim3;

    iget-object v1, v8, Lim3;->A:Lgm3;

    iget-object v2, v1, Lgm3;->a:Lim3;

    iget-object v3, v2, Lim3;->J:Lzwk;

    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {}, Lzwk;->e()Z

    move-result v3

    if-nez v3, :cond_303

    iget-object v2, v2, Lim3;->J:Lzwk;

    invoke-virtual {v2, v1}, Lzwk;->a(Lywk;)V

    goto :goto_309

    :cond_303
    const v1, 0x7f0a0179

    invoke-virtual {v2, v1, v10}, Lim3;->O0(IZ)V

    :goto_309
    iget-object v1, v8, Lim3;->x:Lgn3;

    invoke-virtual {v1}, Lgn3;->a()Lml3;

    move-result-object v1

    invoke-virtual {v8, v1}, Lim3;->P0(Lml3;)V

    iget-object v1, v0, Lxw;->k:Ljava/lang/Object;

    check-cast v1, Lm66;

    const v2, 0x7f0a0172

    if-eqz v1, :cond_31f

    invoke-virtual {v1, v2}, Litd;->findItem(I)Landroid/view/MenuItem;

    move-result-object v7

    :cond_31f
    if-eqz v7, :cond_352

    invoke-interface {v7}, Landroid/view/MenuItem;->getActionView()Landroid/view/View;

    move-result-object v1

    if-eqz v1, :cond_352

    sget-object v3, Lq9n;->c:Ll5b;

    const v3, 0x7f0a05bd

    invoke-virtual {v1, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    invoke-static {v1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    check-cast v1, Landroidx/appcompat/widget/SwitchCompat;

    iget-object v3, v8, Lim3;->x:Lgn3;

    iget-object v3, v3, Lgn3;->b:Lcom/opera/android/bookmarks/h;

    iget-object v3, v3, Lcom/opera/android/bookmarks/h;->j:Lb59;

    invoke-virtual {v3}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/content/SharedPreferences;

    const-string v4, "show_full_address"

    invoke-interface {v3, v4, v10}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v3

    invoke-virtual {v1, v3}, Landroidx/appcompat/widget/SwitchCompat;->setChecked(Z)V

    new-instance v3, Lhm3;

    invoke-direct {v3, v0, v10}, Lhm3;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v1, v3}, Landroid/widget/CompoundButton;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    :cond_352
    invoke-virtual {v8}, Lim3;->I0()V

    iget-object v0, v8, Lim3;->x:Lgn3;

    iget-object v0, v0, Lgn3;->b:Lcom/opera/android/bookmarks/h;

    invoke-virtual {v0}, Lcom/opera/android/bookmarks/h;->d()Z

    move-result v0

    xor-int/2addr v0, v9

    invoke-virtual {v8, v2, v0}, Lim3;->O0(IZ)V

    iget-object v0, v8, Lim3;->K:Lcq5;

    invoke-virtual {v0}, Lcq5;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lf8f;

    invoke-virtual {v0}, Lf8f;->f()Z

    move-result v0

    xor-int/2addr v0, v9

    const v1, 0x7f0a016b

    invoke-virtual {v8, v1, v0}, Lim3;->O0(IZ)V

    invoke-virtual {v8}, Lim3;->Q0()V

    invoke-virtual {v8}, Lim3;->R0()V

    invoke-virtual {v8, v1}, Lim3;->M0(I)Z

    move-result v0

    const v1, 0x7f0a016a

    invoke-virtual {v8, v1}, Lim3;->M0(I)Z

    move-result v1

    if-nez v0, :cond_38a

    if-nez v1, :cond_38a

    move v9, v10

    :cond_38a
    const v0, 0x7f0a0165

    invoke-virtual {v8, v0, v9}, Lim3;->O0(IZ)V

    return-void

    :pswitch_391
    const v0, 0x7f10000a

    invoke-virtual {v1, v0}, Lr9i;->L(I)V

    return-void

    :pswitch_398
    invoke-virtual {v1, v3}, Lr9i;->L(I)V

    return-void

    :pswitch_39c
    invoke-virtual {v1, v3}, Lr9i;->L(I)V

    return-void

    :pswitch_data_3a0
    .packed-switch 0x0
        :pswitch_39c
        :pswitch_398
        :pswitch_391
        :pswitch_2e0
        :pswitch_209
        :pswitch_1c9
        :pswitch_1ae
        :pswitch_15e
        :pswitch_157
        :pswitch_150
        :pswitch_121
        :pswitch_d4
        :pswitch_33
    .end packed-switch
.end method

.method public final onDismiss()V
    .registers 2

    iget-byte v0, p0, Lxw;->j:B

    packed-switch v0, :pswitch_data_1c

    invoke-super {p0}, Lo73;->onDismiss()V

    return-void

    :pswitch_9
    invoke-super {p0}, Lo73;->onDismiss()V

    iget-object p0, p0, Lxw;->l:Ljava/lang/Object;

    check-cast p0, Lgn3;

    const/4 v0, 0x0

    iput-object v0, p0, Lgn3;->D:Lxw;

    return-void

    :pswitch_14
    invoke-super {p0}, Lo73;->onDismiss()V

    const/4 v0, 0x0

    iput-object v0, p0, Lxw;->k:Ljava/lang/Object;

    return-void

    nop

    :pswitch_data_1c
    .packed-switch 0x3
        :pswitch_14
        :pswitch_9
    .end packed-switch
.end method

.method public final onMenuItemClick(Landroid/view/MenuItem;)Z
    .registers 14

    iget-byte v0, p0, Lxw;->j:B

    const v1, 0x7f140bbb

    const v2, 0x7f140774

    const v3, 0x7f0a0691

    const v4, 0x7f0a0694

    const/4 v5, 0x0

    const v6, 0x7f0a0693

    const v7, 0x7f0a0696

    const v8, 0x7f0a068d

    const/4 v9, 0x0

    iget-object v10, p0, Lxw;->l:Ljava/lang/Object;

    const/4 v11, 0x1

    packed-switch v0, :pswitch_data_3e4

    check-cast v10, Lmrn;

    iget-object p0, v10, Lmrn;->p:Lkrn;

    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result p1

    if-ne p1, v8, :cond_2f

    sget-object p1, Ldrn;->d:Ldrn;

    invoke-interface {p0, p1}, Lkrn;->f(Ltc2;)V

    goto :goto_3e

    :cond_2f
    if-ne p1, v7, :cond_37

    sget-object p1, Ldrn;->f:Ldrn;

    invoke-interface {p0, p1}, Lkrn;->f(Ltc2;)V

    goto :goto_3e

    :cond_37
    if-ne p1, v6, :cond_3e

    sget-object p1, Ldrn;->e:Ldrn;

    invoke-interface {p0, p1}, Lkrn;->f(Ltc2;)V

    :cond_3e
    :goto_3e
    return v11

    :pswitch_3f
    check-cast v10, Llrk;

    invoke-virtual {v10, p1}, Llrk;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Boolean;

    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p0

    return p0

    :pswitch_4c
    check-cast v10, Ljava/util/ArrayList;

    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result p1

    sub-int/2addr p1, v11

    invoke-virtual {v10, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lsbn;

    iget-object p0, p0, Lxw;->k:Ljava/lang/Object;

    check-cast p0, Ljbn;

    iget-object p1, p1, Lsbn;->a:Ljava/lang/String;

    invoke-virtual {p0, p1}, Ljbn;->d(Ljava/lang/String;)V

    return v11

    :pswitch_63
    iget-object p0, p0, Lxw;->k:Ljava/lang/Object;

    check-cast p0, Leqi;

    check-cast v10, Landroid/view/View;

    invoke-virtual {v10}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result p1

    const v1, 0x7f0a068f

    const-string v2, ""

    if-ne p1, v1, :cond_81

    iget-object p0, p0, Leqi;->a:Ljava/lang/String;

    if-eqz p0, :cond_7d

    move-object v2, p0

    :cond_7d
    invoke-static {v0, v2}, Llcp;->m(Landroid/content/Context;Ljava/lang/String;)V

    goto :goto_8e

    :cond_81
    const v1, 0x7f0a0690

    if-ne p1, v1, :cond_8e

    iget-object p0, p0, Leqi;->b:Ljava/lang/String;

    if-eqz p0, :cond_8b

    move-object v2, p0

    :cond_8b
    invoke-static {v0, v2}, Llcp;->m(Landroid/content/Context;Ljava/lang/String;)V

    :cond_8e
    :goto_8e
    return v11

    :pswitch_8f
    iget-object p0, p0, Lxw;->k:Ljava/lang/Object;

    check-cast p0, Lenh;

    check-cast v10, Lgnh;

    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result p1

    const v0, 0x7f0a08ab

    if-ne p1, v0, :cond_aa

    invoke-virtual {v10}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {p0}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object p0

    invoke-virtual {v10, p0}, Lgnh;->d(Ljava/util/List;)V

    :goto_a8
    move v9, v11

    goto :goto_d7

    :cond_aa
    const v0, 0x7f0a08a7

    if-ne p1, v0, :cond_ba

    invoke-virtual {v10}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {p0}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object p0

    invoke-virtual {v10, p0, v9}, Lgnh;->c(Ljava/util/List;Z)V

    goto :goto_a8

    :cond_ba
    const v0, 0x7f0a08a8

    if-ne p1, v0, :cond_ca

    invoke-virtual {v10}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {p0}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object p0

    invoke-virtual {v10, p0, v11}, Lgnh;->c(Ljava/util/List;Z)V

    goto :goto_a8

    :cond_ca
    const v0, 0x7f0a08a6

    if-ne p1, v0, :cond_d7

    iget-object p1, v10, Lgnh;->a:Landroid/content/Context;

    iget-object p0, p0, Lenh;->b:Ljava/lang/String;

    invoke-static {p1, p0}, Llcp;->m(Landroid/content/Context;Ljava/lang/String;)V

    goto :goto_a8

    :cond_d7
    :goto_d7
    return v9

    :pswitch_d8
    iget-object p0, p0, Lxw;->k:Ljava/lang/Object;

    check-cast p0, Ljava/util/ArrayList;

    check-cast v10, Lgnh;

    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result p1

    const v0, 0x7f0a08ac

    if-ne p1, v0, :cond_ec

    invoke-virtual {v10, p0}, Lgnh;->d(Ljava/util/List;)V

    :goto_ea
    move v9, v11

    goto :goto_fe

    :cond_ec
    const v0, 0x7f0a08a9

    if-ne p1, v0, :cond_f5

    invoke-virtual {v10, p0, v9}, Lgnh;->c(Ljava/util/List;Z)V

    goto :goto_ea

    :cond_f5
    const v0, 0x7f0a08aa

    if-ne p1, v0, :cond_fe

    invoke-virtual {v10, p0, v11}, Lgnh;->c(Ljava/util/List;Z)V

    goto :goto_ea

    :cond_fe
    :goto_fe
    return v9

    :pswitch_ff
    iget-object p0, p0, Lxw;->k:Ljava/lang/Object;

    check-cast p0, Lm0a;

    check-cast v10, Ltah;

    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result p1

    const-string v0, "webp"

    if-ne p1, v8, :cond_131

    invoke-virtual {v10}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide p0

    invoke-static {p0, p1}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v10, p0, v0}, Ltah;->r(Ljava/lang/String;Ljava/lang/String;)Ljava/io/File;

    move-result-object p1

    iget-object v0, v10, Ltah;->j:Ljava/lang/Object;

    check-cast v0, Ljava/util/LinkedHashSet;

    invoke-interface {v0, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    iget-object v0, v10, Ltah;->d:Ljava/lang/Object;

    check-cast v0, Lq32;

    new-instance v1, Le0a;

    invoke-direct {v1, v10, p1, p0}, Le0a;-><init>(Ltah;Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v0, p1, v1}, Lq32;->a(Ljava/io/File;Lcom/opera/api/Callback;)V

    goto/16 :goto_1b7

    :cond_131
    if-ne p1, v7, :cond_15d

    invoke-virtual {v10}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide p0

    invoke-static {p0, p1}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v10, p0, v0}, Ltah;->r(Ljava/lang/String;Ljava/lang/String;)Ljava/io/File;

    move-result-object p1

    iget-object v0, v10, Ltah;->j:Ljava/lang/Object;

    check-cast v0, Ljava/util/LinkedHashSet;

    invoke-interface {v0, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    iget-object v0, v10, Ltah;->d:Ljava/lang/Object;

    check-cast v0, Lq32;

    new-instance v1, Le0a;

    invoke-direct {v1, v10, p0, p1}, Le0a;-><init>(Ltah;Ljava/lang/String;Ljava/io/File;)V

    iget-object p0, v0, Lq32;->a:Landroid/content/Context;

    new-instance p1, Lj12;

    invoke-direct {p1, v1, v11}, Lj12;-><init>(Lcom/opera/api/Callback;B)V

    invoke-static {p0, p1}, Lb8h;->m(Landroid/content/Context;Lcom/opera/api/Callback;)V

    goto :goto_1b7

    :cond_15d
    if-ne p1, v6, :cond_180

    iget-object p0, v10, Ltah;->e:Ljava/lang/Object;

    check-cast p0, Lny1;

    new-instance p1, Ldg7;

    const/16 v0, 0x1d

    invoke-direct {p1, v10, v0}, Ldg7;-><init>(Ljava/lang/Object;B)V

    iget-object v0, p0, Lny1;->a:Landroid/content/Context;

    :try_start_16c
    invoke-virtual {p0, v0, p1}, Lny1;->a(Landroid/content/Context;Lcom/opera/api/Callback;)V
    :try_end_16f
    .catch Landroid/content/ActivityNotFoundException; {:try_start_16c .. :try_end_16f} :catch_170

    goto :goto_1b7

    :catch_170
    new-instance p0, Laz0;

    invoke-direct {p0, v0}, Laz0;-><init>(Landroid/content/Context;)V

    invoke-virtual {p0, v2}, Laz0;->a(I)V

    invoke-virtual {p0, v1, v5}, Laz0;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Laz0;

    move-result-object p0

    invoke-virtual {p0}, Laz0;->c()Lbz0;

    goto :goto_1b7

    :cond_180
    const v0, 0x7f0a04e6

    if-ne p1, v0, :cond_19c

    sget-object p1, Lo0a;->a:Lo0a;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {p1}, Ljava/util/Collections;->singleton(Ljava/lang/Object;)Ljava/util/Set;

    move-result-object p1

    iget-object v0, p0, Lm0a;->d:Ljava/util/Set;

    invoke-static {v0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1b7

    iput-object p1, p0, Lm0a;->d:Ljava/util/Set;

    invoke-virtual {p0}, Lm0a;->b()V

    goto :goto_1b7

    :cond_19c
    const v0, 0x7f0a04e7

    if-ne p1, v0, :cond_1b7

    sget-object p1, Lo0a;->b:Lo0a;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {p1}, Ljava/util/Collections;->singleton(Ljava/lang/Object;)Ljava/util/Set;

    move-result-object p1

    iget-object v0, p0, Lm0a;->d:Ljava/util/Set;

    invoke-static {v0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1b7

    iput-object p1, p0, Lm0a;->d:Ljava/util/Set;

    invoke-virtual {p0}, Lm0a;->b()V

    :cond_1b7
    :goto_1b7
    return v11

    :pswitch_1b8
    check-cast v10, Lwt7;

    iget-object p0, v10, Lwt7;->g:Lhd;

    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result p1

    if-ne p1, v8, :cond_1d2

    iget-object p1, p0, Lhd;->f:Ljava/lang/Object;

    check-cast p1, Liy1;

    sget-object v0, Lux1;->a:Lux1;

    new-instance v1, Ldg7;

    const/4 v2, 0x5

    invoke-direct {v1, p0, v2}, Ldg7;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p1, v0, v1}, Liy1;->f(Lux1;Lcom/opera/api/Callback;)V

    goto :goto_22b

    :cond_1d2
    if-ne p1, v7, :cond_1fd

    iget-object p0, p0, Lhd;->f:Ljava/lang/Object;

    move-object v1, p0

    check-cast v1, Liy1;

    sget-object v4, Lux1;->a:Lux1;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide p0

    invoke-static {p0, p1}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Liy1;->c(Ljava/lang/String;)Ljava/io/File;

    move-result-object v3

    iget-object p0, v1, Liy1;->d:Lq32;

    new-instance v0, Lxx1;

    const/4 v5, 0x0

    invoke-direct/range {v0 .. v5}, Lxx1;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    iget-object p0, p0, Lq32;->a:Landroid/content/Context;

    new-instance p1, Lj12;

    invoke-direct {p1, v0, v11}, Lj12;-><init>(Lcom/opera/api/Callback;B)V

    invoke-static {p0, p1}, Lb8h;->m(Landroid/content/Context;Lcom/opera/api/Callback;)V

    goto :goto_22b

    :cond_1fd
    if-ne p1, v6, :cond_22b

    iget-object p0, p0, Lhd;->f:Ljava/lang/Object;

    check-cast p0, Liy1;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    invoke-static {v3, v4}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object p1

    iget-object v0, p0, Liy1;->f:Lny1;

    new-instance v3, Lwx;

    const/4 v4, 0x4

    invoke-direct {v3, p0, p1, v4}, Lwx;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    iget-object p0, v0, Lny1;->a:Landroid/content/Context;

    :try_start_218
    invoke-virtual {v0, p0, v3}, Lny1;->a(Landroid/content/Context;Lcom/opera/api/Callback;)V
    :try_end_21b
    .catch Landroid/content/ActivityNotFoundException; {:try_start_218 .. :try_end_21b} :catch_21c

    goto :goto_22b

    :catch_21c
    new-instance p1, Laz0;

    invoke-direct {p1, p0}, Laz0;-><init>(Landroid/content/Context;)V

    invoke-virtual {p1, v2}, Laz0;->a(I)V

    invoke-virtual {p1, v1, v5}, Laz0;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Laz0;

    move-result-object p0

    invoke-virtual {p0}, Laz0;->c()Lbz0;

    :cond_22b
    :goto_22b
    return v11

    :pswitch_22c
    iget-object p0, p0, Lxw;->k:Ljava/lang/Object;

    check-cast p0, Lig7;

    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    const v1, 0x7f0a0333

    if-ne v0, v1, :cond_240

    sget-object p1, Lvvj;->c:Lvvj;

    invoke-virtual {p0, p1}, Lig7;->b(Lvvj;)V

    :goto_23e
    move v9, v11

    goto :goto_26d

    :cond_240
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    const v1, 0x7f0a0334

    if-ne v0, v1, :cond_24f

    sget-object p1, Lvvj;->d:Lvvj;

    invoke-virtual {p0, p1}, Lig7;->b(Lvvj;)V

    goto :goto_23e

    :cond_24f
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    const v1, 0x7f0a0332

    if-ne v0, v1, :cond_25e

    sget-object p1, Lvvj;->e:Lvvj;

    invoke-virtual {p0, p1}, Lig7;->b(Lvvj;)V

    goto :goto_23e

    :cond_25e
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result p1

    const v0, 0x7f0a0335

    if-ne p1, v0, :cond_26d

    sget-object p1, Lvvj;->f:Lvvj;

    invoke-virtual {p0, p1}, Lig7;->b(Lvvj;)V

    goto :goto_23e

    :cond_26d
    :goto_26d
    return v9

    :pswitch_26e
    check-cast v10, Lgn3;

    iget-object p0, p0, Lxw;->k:Ljava/lang/Object;

    check-cast p0, Lqhc;

    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    const v1, 0x7f0a06a2

    if-ne v0, v1, :cond_288

    iget-object p0, p0, Lqhc;->a:Lal3;

    invoke-virtual {v10, p0}, Lgn3;->m(Lal3;)V

    invoke-virtual {v10}, Lgn3;->g()V

    :goto_285
    move v9, v11

    goto/16 :goto_320

    :cond_288
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    const v1, 0x7f0a069a

    const v2, 0x7f0a0699

    if-eq v0, v1, :cond_2f5

    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    if-eq v0, v2, :cond_2f5

    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    if-ne v0, v4, :cond_2a6

    iget-object p0, p0, Lqhc;->a:Lal3;

    invoke-virtual {v10, p0}, Lgn3;->r(Lal3;)V

    goto :goto_285

    :cond_2a6
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    if-ne v0, v3, :cond_2b4

    invoke-static {p0}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object p0

    invoke-virtual {v10, p0}, Lgn3;->p(Ljava/util/List;)V

    goto :goto_285

    :cond_2b4
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    const v1, 0x7f0a068e

    if-ne v0, v1, :cond_2c7

    iget-object p1, v10, Lgn3;->p:Landroidx/fragment/app/r;

    invoke-virtual {p0}, Lqhc;->e()Ljava/lang/String;

    move-result-object p0

    invoke-static {p1, p0}, Llcp;->m(Landroid/content/Context;Ljava/lang/String;)V

    goto :goto_285

    :cond_2c7
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result p1

    const v0, 0x7f0a06a1

    if-ne p1, v0, :cond_320

    invoke-virtual {p0}, Lqhc;->e()Ljava/lang/String;

    move-result-object p1

    iget-object v0, v10, Lgn3;->p:Landroidx/fragment/app/r;

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {p0, v0}, Lqhc;->d(Landroid/content/res/Resources;)Ljava/lang/String;

    move-result-object p0

    new-instance v0, Lghf;

    new-instance v1, Li4d;

    new-instance v2, Le5f;

    const/16 v3, 0xa

    invoke-direct {v2, p1, p0, v3}, Le5f;-><init>(Ljava/lang/String;Ljava/lang/String;B)V

    invoke-direct {v1, v2}, Li4d;-><init>(Lkotlin/jvm/functions/Function1;)V

    invoke-direct {v0, v1}, Lghf;-><init>(Li4d;)V

    iget-object p0, v10, Lgn3;->p:Landroidx/fragment/app/r;

    invoke-virtual {v0, p0}, Lghf;->I(Landroid/content/Context;)Ljjm;

    goto :goto_285

    :cond_2f5
    iget-object v0, p0, Lqhc;->a:Lal3;

    iget-object p0, p0, Lqhc;->a:Lal3;

    invoke-interface {v0}, Lol3;->g()Z

    move-result v0

    if-eqz v0, :cond_306

    move-object v0, p0

    check-cast v0, Lml3;

    invoke-interface {v0}, Lal3;->getTitle()Ljava/lang/String;

    move-result-object v5

    :cond_306
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result p1

    if-ne p1, v2, :cond_30e

    move p1, v11

    goto :goto_30f

    :cond_30e
    move p1, v9

    :goto_30f
    new-array v0, v11, [Lal3;

    aput-object p0, v0, v9

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object p0

    invoke-static {p0}, Lalo;->r(Ljava/util/List;)Ljava/util/ArrayList;

    move-result-object p0

    invoke-virtual {v10, p0, v5, p1}, Lgn3;->s(Ljava/util/ArrayList;Ljava/lang/String;Z)V

    goto/16 :goto_285

    :cond_320
    :goto_320
    return v9

    :pswitch_321
    check-cast v10, Lim3;

    invoke-virtual {v10, p1}, Lim3;->onMenuItemClick(Landroid/view/MenuItem;)Z

    move-result p0

    return p0

    :pswitch_328
    iget-object p0, p0, Lxw;->k:Ljava/lang/Object;

    check-cast p0, Lw3g;

    check-cast v10, Lwth;

    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result p1

    const v0, 0x7f0a035e

    if-ne p1, v0, :cond_36c

    iget-object p1, v10, Lwth;->b:Ljava/lang/Object;

    check-cast p1, Leu2;

    invoke-virtual {p1}, Landroidx/fragment/app/Fragment;->requireContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lsj2;->g(Landroid/content/Context;)Z

    move-result v0

    iget-object v1, p1, Leu2;->w:Lua7;

    if-nez v0, :cond_35d

    new-instance p0, Ls4g;

    invoke-direct {p0}, Ls4g;-><init>()V

    new-instance v0, Ldu2;

    invoke-direct {v0, p1, v11}, Ldu2;-><init>(Leu2;B)V

    new-instance p1, Lug;

    const/16 v2, 0x8

    invoke-direct {p1, v0, v2}, Lug;-><init>(Lkotlin/jvm/functions/Function1;B)V

    invoke-virtual {v1, p0, p1}, Lua7;->E(Lr37;Lf7f;)V

    :goto_35b
    move v9, v11

    goto :goto_386

    :cond_35d
    new-instance p1, Lzv7;

    iget p0, p0, Lw3g;->a:I

    invoke-direct {p1, p0}, Lzv7;-><init>(I)V

    iget-object p0, v1, Lua7;->c:Ljava/lang/Object;

    check-cast p0, Lgjm;

    invoke-virtual {p0, p1, v9}, Lgjm;->e(Ln37;Z)V

    goto :goto_35b

    :cond_36c
    const v0, 0x7f0a0c8b

    if-ne p1, v0, :cond_386

    iget-object p1, v10, Lwth;->b:Ljava/lang/Object;

    check-cast p1, Leu2;

    iget-object p1, p1, Leu2;->w:Lua7;

    new-instance v0, Lj8n;

    iget p0, p0, Lw3g;->a:I

    invoke-direct {v0, p0}, Lj8n;-><init>(I)V

    iget-object p0, p1, Lua7;->c:Ljava/lang/Object;

    check-cast p0, Lgjm;

    invoke-virtual {p0, v0, v9}, Lgjm;->e(Ln37;Z)V

    goto :goto_35b

    :cond_386
    :goto_386
    return v9

    :pswitch_387
    iget-object p0, p0, Lxw;->k:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/autofill/Address;

    check-cast v10, Lwr2;

    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    if-ne v0, v4, :cond_398

    invoke-virtual {v10, p0}, Lwr2;->I0(Lcom/opera/android/autofill/Address;)V

    :goto_396
    move v9, v11

    goto :goto_3a6

    :cond_398
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result p1

    if-ne p1, v3, :cond_3a6

    iget-object p1, v10, Lwr2;->r:Lbv1;

    iget-object p0, p0, Lcom/opera/android/autofill/AutofillItem;->a:Ljava/lang/String;

    invoke-virtual {p1, p0}, Lbv1;->H(Ljava/lang/String;)V

    goto :goto_396

    :cond_3a6
    :goto_3a6
    return v9

    :pswitch_3a7
    iget-object p0, p0, Lxw;->k:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/autofill/Address;

    check-cast v10, Lyw;

    iget-object v0, v10, Lyw;->e:Ljava/lang/Object;

    check-cast v0, Lwth;

    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result p1

    if-ne p1, v4, :cond_3cb

    iget-object p1, v0, Lwth;->b:Ljava/lang/Object;

    check-cast p1, Luw;

    invoke-virtual {p1}, Luw;->I0()Lcx;

    move-result-object p1

    iget-object v0, p1, Lcx;->d:Lot2;

    new-instance v1, Lax;

    invoke-direct {v1, p1, v11}, Lax;-><init>(Lcx;B)V

    invoke-virtual {v0, p0, v1}, Lot2;->c(Lcom/opera/android/autofill/Address;Lkotlin/jvm/functions/Function1;)V

    :cond_3c9
    :goto_3c9
    move v9, v11

    goto :goto_3e3

    :cond_3cb
    if-ne p1, v3, :cond_3e3

    iget-object p1, v0, Lwth;->b:Ljava/lang/Object;

    check-cast p1, Luw;

    invoke-virtual {p1}, Luw;->I0()Lcx;

    move-result-object p1

    iget-object p1, p1, Lcx;->j:Lcom/opera/android/undo/UndoBar;

    if-eqz p1, :cond_3c9

    iget-object p0, p0, Lcom/opera/android/autofill/AutofillItem;->a:Ljava/lang/String;

    invoke-static {p0}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object p0

    invoke-virtual {p1, p0}, Lcom/opera/android/undo/UndoBar;->c(Ljava/util/List;)V

    goto :goto_3c9

    :cond_3e3
    :goto_3e3
    return v9

    :pswitch_data_3e4
    .packed-switch 0x0
        :pswitch_3a7
        :pswitch_387
        :pswitch_328
        :pswitch_321
        :pswitch_26e
        :pswitch_22c
        :pswitch_1b8
        :pswitch_ff
        :pswitch_d8
        :pswitch_8f
        :pswitch_63
        :pswitch_4c
        :pswitch_3f
    .end packed-switch
.end method

.class public final Ldbl;
.super Lo73;
.source "SourceFile"


# instance fields
.field public final j:Landroid/content/Context;

.field public final k:Lwv1;

.field public final l:Ldu3;

.field public final m:Lnue;

.field public final n:Ldu3;

.field public final o:Lnwf;

.field public final p:Lesk;

.field public final q:Lkze;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lwv1;Ldu3;Lnue;Ldu3;Lesk;Lkze;Lnwf;)V
    .registers 9

    invoke-direct {p0}, Lo73;-><init>()V

    iput-object p1, p0, Ldbl;->j:Landroid/content/Context;

    iput-object p2, p0, Ldbl;->k:Lwv1;

    iput-object p3, p0, Ldbl;->l:Ldu3;

    iput-object p4, p0, Ldbl;->m:Lnue;

    iput-object p5, p0, Ldbl;->n:Ldu3;

    iput-object p8, p0, Ldbl;->o:Lnwf;

    iput-object p6, p0, Ldbl;->p:Lesk;

    iput-object p7, p0, Ldbl;->q:Lkze;

    return-void
.end method

.method public static r(Landroid/view/Menu;Z)V
    .registers 5

    const v0, 0x7f0a07ee

    const v1, 0x7f1412b9

    const/4 v2, 0x0

    invoke-interface {p0, v2, v0, v2, v1}, Landroid/view/Menu;->add(IIII)Landroid/view/MenuItem;

    move-result-object p0

    const v0, 0x7f0805d4

    invoke-interface {p0, v0}, Landroid/view/MenuItem;->setIcon(I)Landroid/view/MenuItem;

    move-result-object p0

    invoke-interface {p0, p1}, Landroid/view/MenuItem;->setEnabled(Z)Landroid/view/MenuItem;

    return-void
.end method


# virtual methods
.method public final m(Lr9i;Landroid/view/View;)V
    .registers 19

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    iget-object v2, v1, Lr9i;->c:Ljava/lang/Object;

    check-cast v2, Lm66;

    iget-object v3, v1, Lr9i;->d:Ljava/lang/Object;

    check-cast v3, Lo66;

    iget-object v4, v0, Ldbl;->p:Lesk;

    invoke-interface {v4}, Lesk;->get()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lntl;

    iget-boolean v5, v4, Lntl;->a:Z

    iget-boolean v6, v4, Lntl;->b:Z

    const/4 v7, 0x0

    if-nez v5, :cond_23

    if-nez v6, :cond_23

    iget-boolean v4, v4, Lntl;->c:Z

    if-nez v4, :cond_23

    const/4 v4, 0x1

    goto :goto_24

    :cond_23
    move v4, v7

    :goto_24
    if-nez v4, :cond_2a

    if-nez v6, :cond_2a

    const/4 v5, 0x1

    goto :goto_2b

    :cond_2a
    move v5, v7

    :goto_2b
    iget-object v6, v0, Ldbl;->n:Ldu3;

    invoke-virtual {v6}, Ldu3;->get()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lk6l;

    if-eqz v9, :cond_45

    iget-object v9, v9, Lk6l;->o:Lb2l;

    if-eqz v9, :cond_45

    check-cast v9, Ld7l;

    iget-object v9, v9, Ld7l;->j:Le7l;

    invoke-interface {v9}, Lb9l;->m()Z

    move-result v9

    if-eqz v9, :cond_45

    const/4 v9, 0x1

    goto :goto_46

    :cond_45
    move v9, v7

    :goto_46
    iget-object v10, v0, Ldbl;->j:Landroid/content/Context;

    invoke-static {v10}, Lr9n;->A(Landroid/content/Context;)Z

    move-result v10

    invoke-virtual {v0}, Ldbl;->t()Z

    move-result v11

    if-eqz v11, :cond_56

    if-nez v4, :cond_56

    const/4 v11, 0x1

    goto :goto_57

    :cond_56
    move v11, v7

    :goto_57
    if-eqz v9, :cond_5f

    if-nez v10, :cond_5f

    if-nez v11, :cond_5f

    move v12, v7

    goto :goto_60

    :cond_5f
    const/4 v12, 0x1

    :goto_60
    if-eqz v9, :cond_6e

    if-nez v10, :cond_6e

    if-nez v11, :cond_6e

    if-nez v4, :cond_6e

    invoke-static {v2, v7}, Ldbl;->r(Landroid/view/Menu;Z)V

    :cond_6b
    :goto_6b
    const/4 v3, 0x1

    goto/16 :goto_125

    :cond_6e
    move-object/from16 v13, p2

    invoke-virtual {v0, v13}, Lo73;->j(Landroid/view/View;)Z

    move-result v13

    const-string v15, ""

    const v8, 0x7f14051e

    const v14, 0x7f0a07e3

    if-eqz v13, :cond_d1

    if-nez v9, :cond_8c

    invoke-virtual {v2, v7, v14, v7, v8}, Litd;->add(IIII)Landroid/view/MenuItem;

    move-result-object v8

    check-cast v8, Lptd;

    const v9, 0x7f08061c

    invoke-virtual {v8, v9}, Lptd;->setIcon(I)Landroid/view/MenuItem;

    :cond_8c
    if-eqz v10, :cond_91

    invoke-virtual {v0, v2}, Ldbl;->s(Landroid/view/Menu;)V

    :cond_91
    if-eqz v11, :cond_97

    const/4 v8, 0x1

    invoke-static {v2, v8}, Ldbl;->r(Landroid/view/Menu;Z)V

    :cond_97
    if-eqz v5, :cond_ba

    iget-object v3, v3, Lo66;->F:Lkze;

    invoke-virtual {v6}, Ldu3;->get()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lk6l;

    if-eqz v5, :cond_ba

    const v6, 0x7f14129c

    const v8, 0x7f0a07e6

    invoke-virtual {v2, v7, v8, v7, v6}, Litd;->add(IIII)Landroid/view/MenuItem;

    move-result-object v6

    check-cast v6, Lptd;

    const v8, 0x7f0804f6

    invoke-virtual {v6, v8}, Lptd;->setIcon(I)Landroid/view/MenuItem;

    new-instance v8, Lc37;

    invoke-direct {v8, v3, v5, v6}, Lc37;-><init>(Lkze;Lk6l;Landroid/view/MenuItem;)V

    :cond_ba
    if-eqz v4, :cond_6b

    if-eqz v12, :cond_cd

    invoke-virtual {v2, v7, v7, v7, v15}, Litd;->add(IIILjava/lang/CharSequence;)Landroid/view/MenuItem;

    move-result-object v3

    check-cast v3, Lptd;

    const v4, 0x7f0d010e

    invoke-virtual {v3, v4}, Lptd;->setActionView(I)Landroid/view/MenuItem;

    invoke-interface {v3, v7}, Landroid/view/MenuItem;->setEnabled(Z)Landroid/view/MenuItem;

    :cond_cd
    invoke-virtual {v0, v2}, Ldbl;->q(Landroid/view/Menu;)V

    goto :goto_6b

    :cond_d1
    if-eqz v4, :cond_e7

    invoke-virtual {v0, v2}, Ldbl;->q(Landroid/view/Menu;)V

    if-eqz v12, :cond_e7

    invoke-virtual {v2, v7, v7, v7, v15}, Litd;->add(IIILjava/lang/CharSequence;)Landroid/view/MenuItem;

    move-result-object v4

    check-cast v4, Lptd;

    const v12, 0x7f0d010e

    invoke-virtual {v4, v12}, Lptd;->setActionView(I)Landroid/view/MenuItem;

    invoke-interface {v4, v7}, Landroid/view/MenuItem;->setEnabled(Z)Landroid/view/MenuItem;

    :cond_e7
    if-eqz v5, :cond_10a

    iget-object v3, v3, Lo66;->F:Lkze;

    invoke-virtual {v6}, Ldu3;->get()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lk6l;

    if-eqz v4, :cond_10a

    const v5, 0x7f0a07e6

    const v6, 0x7f14129c

    invoke-virtual {v2, v7, v5, v7, v6}, Litd;->add(IIII)Landroid/view/MenuItem;

    move-result-object v5

    check-cast v5, Lptd;

    const v6, 0x7f0804f6

    invoke-virtual {v5, v6}, Lptd;->setIcon(I)Landroid/view/MenuItem;

    new-instance v6, Lc37;

    invoke-direct {v6, v3, v4, v5}, Lc37;-><init>(Lkze;Lk6l;Landroid/view/MenuItem;)V

    :cond_10a
    if-eqz v11, :cond_110

    const/4 v3, 0x1

    invoke-static {v2, v3}, Ldbl;->r(Landroid/view/Menu;Z)V

    :cond_110
    if-eqz v10, :cond_115

    invoke-virtual {v0, v2}, Ldbl;->s(Landroid/view/Menu;)V

    :cond_115
    if-nez v9, :cond_6b

    invoke-virtual {v2, v7, v14, v7, v8}, Litd;->add(IIII)Landroid/view/MenuItem;

    move-result-object v0

    check-cast v0, Lptd;

    const v9, 0x7f08061c

    invoke-virtual {v0, v9}, Lptd;->setIcon(I)Landroid/view/MenuItem;

    goto/16 :goto_6b

    :goto_125
    invoke-virtual {v1, v3}, Lr9i;->S(Z)V

    return-void
.end method

.method public final onMenuItemClick(Landroid/view/MenuItem;)Z
    .registers 6

    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    const v1, 0x7f0a07ee

    const/4 v2, 0x1

    iget-object p0, p0, Ldbl;->o:Lnwf;

    if-ne v0, v1, :cond_16

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance p1, Lc7k;

    const/4 v0, 0x4

    invoke-direct {p1, p0, v0}, Lc7k;-><init>(Lnwf;B)V

    return v2

    :cond_16
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    const v1, 0x7f0a07e6

    const/4 v3, 0x0

    if-ne v0, v1, :cond_24

    invoke-virtual {p0, v3}, Lnwf;->u(Z)V

    return v2

    :cond_24
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    const v1, 0x7f0a07f2

    if-ne v0, v1, :cond_37

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance p1, Lc7k;

    const/4 v0, 0x5

    invoke-direct {p1, p0, v0}, Lc7k;-><init>(Lnwf;B)V

    return v2

    :cond_37
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result p1

    const v0, 0x7f0a07e3

    if-ne p1, v0, :cond_49

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance p1, Lc7k;

    invoke-direct {p1, p0, v3}, Lc7k;-><init>(Lnwf;B)V

    return v2

    :cond_49
    return v3
.end method

.method public final q(Landroid/view/Menu;)V
    .registers 12

    const v0, 0x7f0a07fa

    const-string v1, ""

    const/4 v2, 0x0

    invoke-interface {p1, v2, v0, v2, v1}, Landroid/view/Menu;->add(IIILjava/lang/CharSequence;)Landroid/view/MenuItem;

    move-result-object p1

    const v0, 0x7f0d0320

    invoke-interface {p1, v0}, Landroid/view/MenuItem;->setActionView(I)Landroid/view/MenuItem;

    move-result-object p1

    invoke-interface {p1, v2}, Landroid/view/MenuItem;->setEnabled(Z)Landroid/view/MenuItem;

    invoke-interface {p1}, Landroid/view/MenuItem;->getActionView()Landroid/view/View;

    move-result-object p1

    invoke-static {p1}, Lpt1;->b(Landroid/view/View;)Lpt1;

    move-result-object v5

    iget-object p1, p0, Ldbl;->n:Ldu3;

    invoke-virtual {p1}, Ldu3;->get()Ljava/lang/Object;

    move-result-object p1

    move-object v4, p1

    check-cast v4, Lk6l;

    if-nez v4, :cond_28

    return-void

    :cond_28
    new-instance v3, Ligi;

    new-instance v6, Leu3;

    const/4 p1, 0x3

    invoke-direct {v6, p0, p1}, Leu3;-><init>(Ljava/lang/Object;B)V

    new-instance v8, Lcbl;

    invoke-direct {v8, p0, v2}, Lcbl;-><init>(Ljava/lang/Object;B)V

    iget-object v9, p0, Ldbl;->q:Lkze;

    iget-object v7, p0, Ldbl;->o:Lnwf;

    invoke-direct/range {v3 .. v9}, Ligi;-><init>(Lk6l;Lpt1;Ljava/util/function/BooleanSupplier;Lnwf;Ljava/lang/Runnable;Lkze;)V

    return-void
.end method

.method public final s(Landroid/view/Menu;)V
    .registers 5

    iget-object p0, p0, Ldbl;->j:Landroid/content/Context;

    invoke-static {p0}, Lru9;->c(Landroid/content/Context;)Lru9;

    move-result-object p0

    iget-object p0, p0, Lru9;->a:Landroid/content/SharedPreferences;

    const-string v0, "qr.google_lens_supported"

    const/4 v1, 0x0

    invoke-interface {p0, v0, v1}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result p0

    if-eqz p0, :cond_15

    const v0, 0x7f1408ac

    goto :goto_18

    :cond_15
    const v0, 0x7f140ef4

    :goto_18
    const v2, 0x7f0a07f2

    invoke-interface {p1, v1, v2, v1, v0}, Landroid/view/Menu;->add(IIII)Landroid/view/MenuItem;

    move-result-object p1

    if-eqz p0, :cond_25

    const p0, 0x7f0805e3

    goto :goto_28

    :cond_25
    const p0, 0x7f0805c8

    :goto_28
    invoke-interface {p1, p0}, Landroid/view/MenuItem;->setIcon(I)Landroid/view/MenuItem;

    return-void
.end method

.method public final t()Z
    .registers 5

    iget-object v0, p0, Ldbl;->n:Ldu3;

    invoke-virtual {v0}, Ldu3;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lk6l;

    const/4 v1, 0x0

    if-eqz v0, :cond_1a

    iget-object v0, v0, Lk6l;->o:Lb2l;

    if-eqz v0, :cond_1a

    check-cast v0, Ld7l;

    iget-object v0, v0, Ld7l;->j:Le7l;

    invoke-interface {v0}, Lb9l;->m()Z

    move-result v0

    if-eqz v0, :cond_1a

    return v1

    :cond_1a
    iget-object v0, p0, Ldbl;->m:Lnue;

    invoke-interface {v0}, Lnue;->getVisibility()Lize;

    move-result-object v0

    invoke-virtual {v0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Llue;

    invoke-virtual {v0}, Llue;->d()Z

    move-result v0

    if-nez v0, :cond_54

    iget-object v0, p0, Ldbl;->k:Lwv1;

    iget-object v2, v0, Lwv1;->b:Lb6h;

    invoke-interface {v2}, Lvtb;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/opera/android/settings/SettingsManager;

    const-string v3, "speed_dial.enabled"

    invoke-virtual {v2, v3}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_56

    iget-object v0, v0, Lwv1;->b:Lb6h;

    invoke-interface {v0}, Lvtb;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/opera/android/settings/SettingsManager;

    iget-object p0, p0, Ldbl;->l:Ldu3;

    invoke-virtual {p0}, Ldu3;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lxnh;

    invoke-virtual {v0, p0}, Lcom/opera/android/settings/SettingsManager;->A(Lxnh;)Z

    move-result p0

    if-eqz p0, :cond_56

    :cond_54
    const/4 p0, 0x1

    return p0

    :cond_56
    return v1
.end method

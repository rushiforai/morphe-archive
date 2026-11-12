.class public final Lhok;
.super Lns8;
.source "SourceFile"


# instance fields
.field public final synthetic B:B

.field public final C:Ljava/lang/Object;

.field public final D:Ljava/lang/Object;

.field public final E:Ljava/lang/Object;

.field public final F:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Lipk;Lnr8;Lw6j;Lxok;Lgd6;Lcom/opera/android/settings/SettingsManager;Ltta;Lx5f;Lqr8;Lnv2;Lp6l;)V
    .registers 26

    const/4 v1, 0x0

    iput-byte v1, p0, Lhok;->B:B

    const/4 v11, 0x0

    const/4 v12, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v6, 0x1

    const/4 v7, 0x0

    move-object v0, p0

    move-object/from16 v1, p4

    move-object/from16 v2, p6

    move-object/from16 v5, p7

    move-object/from16 v8, p8

    move-object/from16 v9, p9

    move-object/from16 v10, p10

    move-object/from16 v13, p11

    .line 44
    invoke-direct/range {v0 .. v13}, Lns8;-><init>(Ltq8;Lcom/opera/android/settings/SettingsManager;ZLo28;Ltta;ZZLskm;Lqr8;Lnv2;Ltlg;Lzzj;Lp6l;)V

    .line 45
    iput-object p1, p0, Lhok;->C:Ljava/lang/Object;

    move-object/from16 v1, p2

    .line 46
    iput-object v1, p0, Lhok;->D:Ljava/lang/Object;

    move-object/from16 v1, p3

    .line 47
    iput-object v1, p0, Lhok;->E:Ljava/lang/Object;

    move-object/from16 v1, p5

    .line 48
    iput-object v1, p0, Lhok;->F:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lxok;Lcom/opera/android/settings/SettingsManager;Ltta;Lw6j;Lcbf;Lx5f;Lqr8;Lnv2;Lp6l;)V
    .registers 24

    const/4 v1, 0x1

    iput-byte v1, p0, Lhok;->B:B

    const/4 v11, 0x0

    const/4 v12, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object/from16 v2, p2

    move-object/from16 v5, p3

    move-object/from16 v8, p6

    move-object/from16 v9, p7

    move-object/from16 v10, p8

    move-object/from16 v13, p9

    invoke-direct/range {v0 .. v13}, Lns8;-><init>(Ltq8;Lcom/opera/android/settings/SettingsManager;ZLo28;Ltta;ZZLskm;Lqr8;Lnv2;Ltlg;Lzzj;Lp6l;)V

    new-instance v1, Ljava/util/HashSet;

    invoke-direct {v1}, Ljava/util/HashSet;-><init>()V

    iput-object v1, p0, Lhok;->C:Ljava/lang/Object;

    move-object/from16 v1, p4

    iput-object v1, p0, Lhok;->D:Ljava/lang/Object;

    move-object/from16 v1, p5

    iput-object v1, p0, Lhok;->E:Ljava/lang/Object;

    iput-object v8, p0, Lhok;->F:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final G(ILo28;)Lvi7;
    .registers 9

    iget-byte v0, p0, Lhok;->B:B

    packed-switch v0, :pswitch_data_2c

    invoke-super {p0, p1, p2}, Lns8;->G(ILo28;)Lvi7;

    move-result-object p0

    return-object p0

    :pswitch_a
    if-nez p2, :cond_e

    const/4 p0, 0x0

    goto :goto_2a

    :cond_e
    new-instance v0, Lgok;

    sget-object v2, Lvml;->d:Lumi;

    iget-object v1, p0, Lns8;->c:Ls9i;

    iget-object v1, v1, Ls9i;->b:Ljava/lang/Object;

    check-cast v1, Ltq8;

    invoke-virtual {v1}, Ltq8;->y()Z

    move-result v4

    move-object v5, p0

    move-object v1, p0

    move v3, p1

    invoke-direct/range {v0 .. v5}, Lgok;-><init>(Lhok;Lumi;IZLhok;)V

    const/4 p0, 0x0

    iput-boolean p0, v0, Lvi7;->t:Z

    iput-boolean p0, v0, Lvi7;->q:Z

    iput-object p2, v0, Lvi7;->n:Lo28;

    move-object p0, v0

    :goto_2a
    return-object p0

    nop

    :pswitch_data_2c
    .packed-switch 0x0
        :pswitch_a
    .end packed-switch
.end method

.method public final H(Landroid/content/Context;Lhq8;)Ljava/util/List;
    .registers 9

    iget-byte v0, p0, Lhok;->B:B

    packed-switch v0, :pswitch_data_54

    const/4 p0, 0x0

    return-object p0

    :pswitch_7
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    move-object v1, p2

    check-cast v1, Lqok;

    iget-object v1, v1, Lqok;->e:Look;

    iget-byte v1, v1, Look;->d:B

    const/4 v2, 0x3

    if-eq v1, v2, :cond_34

    new-instance v1, Lgtd;

    new-instance v2, Lrxh;

    const v3, 0x7f140d08

    invoke-direct {v2, v3}, Lrxh;-><init>(I)V

    new-instance v3, Llxh;

    const v4, 0x7f0805b6

    invoke-direct {v3, v4}, Llxh;-><init>(I)V

    new-instance v4, Lfok;

    const/4 v5, 0x0

    invoke-direct {v4, p0, p1, p2, v5}, Lfok;-><init>(Lhok;Landroid/content/Context;Lhq8;B)V

    invoke-direct {v1, v2, v3, v4}, Lgtd;-><init>(Lrxh;Llxh;Landroid/view/View$OnClickListener;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_34
    new-instance v1, Lgtd;

    new-instance v2, Lrxh;

    const v3, 0x7f140e9f

    invoke-direct {v2, v3}, Lrxh;-><init>(I)V

    new-instance v3, Llxh;

    const v4, 0x7f080540

    invoke-direct {v3, v4}, Llxh;-><init>(I)V

    new-instance v4, Lfok;

    const/4 v5, 0x1

    invoke-direct {v4, p0, p1, p2, v5}, Lfok;-><init>(Lhok;Landroid/content/Context;Lhq8;B)V

    invoke-direct {v1, v2, v3, v4}, Lgtd;-><init>(Lrxh;Llxh;Landroid/view/View$OnClickListener;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-object v0

    nop

    :pswitch_data_54
    .packed-switch 0x0
        :pswitch_7
    .end packed-switch
.end method

.method public final M(Lcom/opera/android/favorites/e;Lhq8;)V
    .registers 11

    iget-byte v0, p0, Lhok;->B:B

    iget-object v1, p0, Lhok;->E:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_82

    move-object v0, p2

    check-cast v0, Lqok;

    iget-object v0, v0, Lqok;->e:Look;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    iget-byte v4, v0, Look;->d:B

    const/4 v5, 0x7

    if-eq v4, v5, :cond_62

    const/16 v5, 0x8

    if-ne v4, v5, :cond_2d

    iget-object v4, p0, Lhok;->F:Ljava/lang/Object;

    check-cast v4, Lx5f;

    invoke-virtual {p2}, Lhq8;->m()Z

    move-result v5

    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v6, Lc5f;

    const/4 v7, 0x0

    invoke-direct {v6, v2, v3, v5, v7}, Lc5f;-><init>(JZZ)V

    invoke-virtual {v4, v6}, Lx5f;->T0(Lkotlin/jvm/functions/Function1;)V

    :cond_2d
    invoke-virtual {p1, p2}, Lcom/opera/android/favorites/e;->k(Lhq8;)V

    iget-object p1, p0, Lhok;->D:Ljava/lang/Object;

    check-cast p1, Lw6j;

    invoke-virtual {p0, p2}, Lns8;->K(Lhq8;)I

    move-result p0

    iget-object p2, p1, Lw6j;->c:Ljava/lang/Object;

    check-cast p2, Landroid/util/SparseArray;

    iget-byte v2, v0, Look;->d:B

    const/4 v3, 0x6

    if-eq v2, v3, :cond_57

    const/16 v3, 0xb

    if-eq v2, v3, :cond_57

    iget-object v2, p1, Lw6j;->d:Ljava/lang/Object;

    check-cast v2, Landroid/util/SparseArray;

    invoke-virtual {v2, p0}, Landroid/util/SparseArray;->remove(I)V

    invoke-virtual {p2, p0}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Look;

    if-nez v2, :cond_57

    invoke-virtual {p2, p0, v0}, Landroid/util/SparseArray;->append(ILjava/lang/Object;)V

    :cond_57
    sget-object p2, Lxk0;->c:Lxk0;

    invoke-virtual {p1, p0, p2}, Lw6j;->n(ILxk0;)V

    check-cast v1, Lcbf;

    invoke-virtual {v1}, Lcbf;->run()V

    return-void

    :cond_62
    const/4 p0, -0x1

    invoke-static {p0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    const/4 p0, 0x0

    throw p0

    :pswitch_68
    move-object p1, p2

    check-cast p1, Lqok;

    iget-object p1, p1, Lqok;->e:Look;

    invoke-virtual {p0, p2}, Lns8;->K(Lhq8;)I

    move-result p0

    if-ltz p0, :cond_80

    check-cast v1, Lw6j;

    invoke-virtual {v1, p0, p1}, Lw6j;->f(ILook;)V

    sget-object p1, Lhr0;->c:Lhr0;

    invoke-virtual {v1, p0, p1}, Lw6j;->o(ILhr0;)V

    invoke-virtual {v1}, Lw6j;->p()V

    :cond_80
    return-void

    nop

    :pswitch_data_82
    .packed-switch 0x0
        :pswitch_68
    .end packed-switch
.end method

.method public final b0(Lhq8;Z)V
    .registers 8

    move-object v0, p1

    check-cast v0, Lqok;

    iget-object v0, v0, Lqok;->e:Look;

    invoke-virtual {p0, p1}, Lns8;->K(Lhq8;)I

    move-result v1

    if-ltz v1, :cond_90

    iget-object v2, p0, Lhok;->E:Ljava/lang/Object;

    check-cast v2, Lw6j;

    if-eqz p2, :cond_1d

    invoke-virtual {v2, v1, v0}, Lw6j;->f(ILook;)V

    sget-object v3, Lhr0;->d:Lhr0;

    invoke-virtual {v2, v1, v3}, Lw6j;->o(ILhr0;)V

    invoke-virtual {v2}, Lw6j;->p()V

    goto :goto_28

    :cond_1d
    invoke-virtual {v2, v1, v0}, Lw6j;->f(ILook;)V

    sget-object v3, Lhr0;->e:Lhr0;

    invoke-virtual {v2, v1, v3}, Lw6j;->o(ILhr0;)V

    invoke-virtual {v2}, Lw6j;->p()V

    :goto_28
    iget-object v1, p0, Lns8;->c:Ls9i;

    iget-object v1, v1, Ls9i;->b:Ljava/lang/Object;

    check-cast v1, Ltq8;

    check-cast v1, Lxok;

    iget-object v2, v1, Lxok;->h:Ljava/util/ArrayList;

    iget-object v3, v1, Ltq8;->e:Ljava/util/ArrayList;

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    invoke-virtual {v1, p1}, Ltq8;->A(Lhq8;)V

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result p1

    iget v0, v1, Lxok;->i:I

    const/4 v2, 0x1

    if-ge p1, v0, :cond_64

    iget-object p1, v1, Lxok;->h:Ljava/util/ArrayList;

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result p1

    iget v0, v1, Lxok;->i:I

    if-lt p1, v0, :cond_64

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result p1

    new-instance v0, Lqok;

    iget-object v3, v1, Lxok;->h:Ljava/util/ArrayList;

    iget v4, v1, Lxok;->i:I

    sub-int/2addr v4, v2

    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Look;

    invoke-direct {v0, v3}, Lqok;-><init>(Look;)V

    invoke-virtual {v1, p1, v0}, Ltq8;->s(ILhq8;)V

    :cond_64
    iget-object p1, p0, Lhok;->F:Ljava/lang/Object;

    check-cast p1, Lgd6;

    if-eqz p2, :cond_6d

    iput-boolean v2, p1, Lgd6;->b:Z

    return-void

    :cond_6d
    invoke-virtual {p0}, Lns8;->getItemCount()I

    move-result p0

    iget-object p2, p1, Lgd6;->a:Landroid/content/Context;

    iget v0, p1, Lgd6;->c:I

    add-int/2addr v0, v2

    iput v0, p1, Lgd6;->c:I

    if-lez p0, :cond_7d

    const/4 p0, 0x3

    if-lt v0, p0, :cond_90

    :cond_7d
    iget-boolean p0, p1, Lgd6;->b:Z

    if-nez p0, :cond_90

    invoke-static {p2}, Lru9;->c(Landroid/content/Context;)Lru9;

    move-result-object p0

    iget-object v0, p0, Lru9;->a:Landroid/content/SharedPreferences;

    const-string v1, "startpage.disable_suggested_sites_dialog_shown"

    const/4 v3, 0x0

    invoke-interface {v0, v1, v3}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_91

    :cond_90
    return-void

    :cond_91
    new-instance v0, Lrxh;

    const v1, 0x7f140581

    invoke-direct {v0, v1}, Lrxh;-><init>(I)V

    new-instance v1, Luk6;

    const/16 v4, 0x8

    invoke-direct {v1, p0, v4}, Luk6;-><init>(Ljava/lang/Object;B)V

    new-instance p0, Luk6;

    const/16 v4, 0x9

    invoke-direct {p0, p1, v4}, Luk6;-><init>(Ljava/lang/Object;B)V

    invoke-static {p2}, Lsfe;->U(Landroid/content/Context;)Lz77;

    move-result-object p1

    new-instance p2, Lgkj;

    invoke-direct {p2, v3, v3}, Lnz0;-><init>(ZZ)V

    const/4 v4, 0x0

    iput-object v4, p2, Lgkj;->a:Ljava/lang/String;

    iput-object v4, p2, Lgkj;->b:Ljava/lang/String;

    iput-object v4, p2, Lgkj;->c:Ljava/lang/String;

    iput-object v4, p2, Lgkj;->d:Ljava/lang/CharSequence;

    iput-object v1, p2, Lgkj;->e:Lekj;

    iput-object v4, p2, Lgkj;->f:Lfkj;

    iput-object v4, p2, Lgkj;->g:Lqp2;

    iput-object p0, p2, Lgkj;->h:Ldkj;

    iput-object v4, p2, Lgkj;->i:Ldkj;

    iput-object v4, p2, Lgkj;->j:Lql;

    const p0, 0x7f140580

    iput p0, p2, Lgkj;->k:I

    const p0, 0x7f1403bf

    iput p0, p2, Lgkj;->l:I

    iput v3, p2, Lgkj;->m:I

    iput-boolean v2, p2, Lgkj;->n:Z

    iput-object v0, p2, Lgkj;->o:Lpxh;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object p0, Lijm;->b:Lijm;

    invoke-virtual {p1, p2, p0}, Lr22;->b(Ljjm;Lijm;)V

    return-void
.end method

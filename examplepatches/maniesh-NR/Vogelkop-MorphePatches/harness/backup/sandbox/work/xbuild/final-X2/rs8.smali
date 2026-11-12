.class public final Lrs8;
.super Lwu8;
.source "SourceFile"


# instance fields
.field public final g:Ldg7;

.field public final h:Lps8;

.field public final i:Lks6;

.field public final j:Low7;

.field public k:Z


# direct methods
.method public constructor <init>(Landroid/view/View;Lcom/opera/android/feed/FeedScrollView;Lx5f;Lcom/opera/android/settings/SettingsManager;Lnr8;Lkze;Landroid/view/View$OnLongClickListener;Ldg7;Lnv2;Ltlg;Lbvl;Lpde;Lp6l;Lps8;)V
    .registers 31

    move-object/from16 v0, p0

    invoke-direct/range {p0 .. p1}, Lwu8;-><init>(Landroid/view/View;)V

    move-object/from16 v1, p8

    iput-object v1, v0, Lrs8;->g:Ldg7;

    move-object/from16 v1, p14

    iput-object v1, v0, Lrs8;->h:Lps8;

    new-instance v1, Lks6;

    const/16 v2, 0x8

    invoke-direct {v1, v0, v2}, Lks6;-><init>(Ljava/lang/Object;B)V

    iput-object v1, v0, Lrs8;->i:Lks6;

    const/4 v2, 0x1

    iput-boolean v2, v0, Lrs8;->k:Z

    iget-object v2, v0, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    const v3, 0x7f0a04ef

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    move-object v6, v2

    check-cast v6, Landroidx/recyclerview/widget/RecyclerView;

    new-instance v3, Low7;

    sget-object v2, Lq9n;->c:Ll5b;

    if-nez v6, :cond_2d

    const/4 v2, 0x0

    goto :goto_35

    :cond_2d
    invoke-virtual {v6}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-static {v2}, Lq9n;->p(Landroid/content/Context;)Ldx3;

    move-result-object v2

    :goto_35
    move-object v4, v2

    check-cast v4, Lcom/opera/android/BrowserActivity;

    move-object/from16 v7, p2

    move-object/from16 v9, p3

    move-object/from16 v10, p4

    move-object/from16 v5, p5

    move-object/from16 v11, p6

    move-object/from16 v12, p9

    move-object/from16 v13, p10

    move-object/from16 v8, p11

    move-object/from16 v14, p12

    move-object/from16 v15, p13

    invoke-direct/range {v3 .. v15}, Low7;-><init>(Lcom/opera/android/BrowserActivity;Lnr8;Landroidx/recyclerview/widget/RecyclerView;Lcom/opera/android/feed/FeedScrollView;Lbvl;Lx5f;Lcom/opera/android/settings/SettingsManager;Lkze;Lnv2;Ltlg;Lpde;Lp6l;)V

    iput-object v3, v0, Lrs8;->j:Low7;

    new-instance v0, Leqh;

    move-object/from16 v2, p7

    invoke-direct {v0, v6, v2}, Leqh;-><init>(Landroidx/recyclerview/widget/RecyclerView;Landroid/view/View$OnLongClickListener;)V

    iget-object v0, v3, Low7;->n:Lx77;

    iget-object v0, v0, Lx77;->b:Ljava/lang/Object;

    check-cast v0, Lpde;

    invoke-virtual {v0, v1}, Lekc;->k(Lf7f;)V

    return-void
.end method


# virtual methods
.method public final c0()V
    .registers 3

    iget-object v0, p0, Lrs8;->j:Low7;

    iget-boolean v1, v0, Low7;->j:Z

    if-eqz v1, :cond_e

    const/4 v1, 0x0

    iput-boolean v1, v0, Low7;->j:Z

    iget-object v0, v0, Low7;->g:Ljr8;

    invoke-virtual {v0}, Lo63;->i()V

    :cond_e
    iget-object p0, p0, Lrs8;->g:Ldg7;

    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual {p0, v0}, Ldg7;->run(Ljava/lang/Object;)V

    return-void
.end method

.method public final e0()V
    .registers 3

    iget-object v0, p0, Lrs8;->j:Low7;

    iget-boolean v1, v0, Low7;->j:Z

    if-nez v1, :cond_11

    const/4 v1, 0x1

    iput-boolean v1, v0, Low7;->j:Z

    new-instance v1, Lig;

    invoke-direct {v1, v0}, Lig;-><init>(Low7;)V

    invoke-static {v1}, Lvml;->c(Ljava/lang/Runnable;)V

    :cond_11
    iget-object p0, p0, Lrs8;->g:Ldg7;

    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {p0, v0}, Ldg7;->run(Ljava/lang/Object;)V

    return-void
.end method

.method public final onDestroy()V
    .registers 3

    iget-object v0, p0, Lrs8;->j:Low7;

    iget-object v1, v0, Low7;->n:Lx77;

    iget-object v1, v1, Lx77;->b:Ljava/lang/Object;

    check-cast v1, Lpde;

    iget-object p0, p0, Lrs8;->i:Lks6;

    invoke-virtual {v1, p0}, Lekc;->p(Lf7f;)V

    iget-object p0, v0, Low7;->l:Lkze;

    iget-object v1, v0, Low7;->m:Lfw7;

    invoke-virtual {p0, v1}, Lekc;->p(Lf7f;)V

    iget-object p0, v0, Low7;->c:Landroidx/recyclerview/widget/RecyclerView;

    const/4 v1, 0x0

    invoke-virtual {p0, v1}, Landroidx/recyclerview/widget/RecyclerView;->y0(Landroidx/recyclerview/widget/d;)V

    iput-object v1, v0, Low7;->i:Lns8;

    invoke-virtual {p0, v1}, Landroidx/recyclerview/widget/RecyclerView;->C0(Landroidx/recyclerview/widget/f;)V

    iget-object p0, v0, Low7;->e:Lizj;

    iget-object p0, p0, Lizj;->a:Ljava/util/ArrayList;

    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    iget-object p0, v0, Low7;->h:Llw7;

    iget-object v0, p0, Llw7;->b:Ltcc;

    if-eqz v0, :cond_31

    invoke-virtual {v0, p0}, Ltcc;->b(Lmdc;)V

    iput-object v1, p0, Llw7;->b:Ltcc;

    :cond_31
    return-void
.end method

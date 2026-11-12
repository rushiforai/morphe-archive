.class public final Lbok;
.super Lwu8;
.source "SourceFile"


# instance fields
.field public final g:Lkze;

.field public final h:Lkf;

.field public final i:Lkok;

.field public final j:Lqzg;


# direct methods
.method public constructor <init>(Landroid/view/View;Lcom/opera/android/feed/FeedScrollView;Lcom/opera/android/settings/SettingsManager;Lnr8;Lipk;Lx5f;Lx5f;Losf;Lkze;Landroid/view/View$OnLongClickListener;Lqr8;Lnv2;Lbvl;Lpde;Lp6l;)V
    .registers 35

    move-object/from16 v0, p0

    invoke-direct/range {p0 .. p1}, Lwu8;-><init>(Landroid/view/View;)V

    move-object/from16 v13, p9

    iput-object v13, v0, Lbok;->g:Lkze;

    iget-object v1, v0, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    const v2, 0x7f0a0af8

    invoke-static {v2, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v3

    move-object v6, v3

    check-cast v6, Lcom/opera/android/custom_views/FadingRecyclerView;

    const/4 v3, 0x0

    if-eqz v6, :cond_75

    const v2, 0x7f0a0af9

    invoke-static {v2, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v4

    move-object v8, v4

    check-cast v8, Landroid/widget/TextView;

    if-eqz v8, :cond_75

    new-instance v2, Lkf;

    check-cast v1, Lcom/opera/android/favorites/NonCollapsingCardView;

    invoke-direct {v2, v1, v6, v8}, Lkf;-><init>(Lcom/opera/android/favorites/NonCollapsingCardView;Lcom/opera/android/custom_views/FadingRecyclerView;Landroid/widget/TextView;)V

    new-instance v1, Leqh;

    move-object/from16 v4, p10

    invoke-direct {v1, v6, v4}, Leqh;-><init>(Landroidx/recyclerview/widget/RecyclerView;Landroid/view/View$OnLongClickListener;)V

    iput-object v2, v0, Lbok;->h:Lkf;

    new-instance v1, Lkok;

    iget-object v2, v0, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    sget-object v4, Lq9n;->c:Ll5b;

    if-eqz v2, :cond_44

    invoke-virtual {v2}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-static {v2}, Lq9n;->p(Landroid/content/Context;)Ldx3;

    move-result-object v3

    :cond_44
    move-object v5, v3

    check-cast v5, Lcom/opera/android/BrowserActivity;

    new-instance v9, Lvk2;

    const/16 v2, 0x13

    invoke-direct {v9, v2}, Lvk2;-><init>(B)V

    move-object/from16 v7, p2

    move-object/from16 v2, p3

    move-object/from16 v3, p4

    move-object/from16 v4, p5

    move-object/from16 v10, p6

    move-object/from16 v11, p7

    move-object/from16 v12, p8

    move-object/from16 v14, p11

    move-object/from16 v15, p12

    move-object/from16 v16, p13

    move-object/from16 v17, p14

    move-object/from16 v18, p15

    invoke-direct/range {v1 .. v18}, Lkok;-><init>(Lcom/opera/android/settings/SettingsManager;Lnr8;Lipk;Lcom/opera/android/BrowserActivity;Lcom/opera/android/custom_views/FadingRecyclerView;Lcom/opera/android/feed/FeedScrollView;Landroid/widget/TextView;Lvk2;Lx5f;Lx5f;Losf;Lkze;Lqr8;Lnv2;Lbvl;Lpde;Lp6l;)V

    iput-object v1, v0, Lbok;->i:Lkok;

    new-instance v1, Lqzg;

    const/16 v2, 0x18

    invoke-direct {v1, v0, v2}, Lqzg;-><init>(Ljava/lang/Object;B)V

    iput-object v1, v0, Lbok;->j:Lqzg;

    return-void

    :cond_75
    invoke-virtual {v1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object v0

    const-string v1, "Missing required view with ID: "

    invoke-virtual {v1, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lt3p;->q(Ljava/lang/String;)V

    throw v3
.end method


# virtual methods
.method public final V(Lja2;Z)V
    .registers 4

    if-nez p2, :cond_39

    iget-object p1, p0, Lbok;->g:Lkze;

    iget-object p2, p0, Lbok;->j:Lqzg;

    invoke-virtual {p1, p2}, Lekc;->k(Lf7f;)V

    new-instance p1, Lzzh;

    const/16 p2, 0xd

    invoke-direct {p1, p0, p2}, Lzzh;-><init>(Ljava/lang/Object;B)V

    iget-object p2, p0, Lbok;->i:Lkok;

    iput-object p1, p2, Lkok;->p:Lzzh;

    iget-object v0, p2, Lkok;->d:Lcom/opera/android/favorites/FavoriteGridLayoutManager;

    iget v0, v0, Landroidx/recyclerview/widget/CustomGridLayoutManager;->b:I

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {p1, v0}, Lzzh;->run(Ljava/lang/Object;)V

    invoke-virtual {p0}, Lab2;->a0()Lja2;

    move-result-object p0

    check-cast p0, Laok;

    iget-object p0, p0, Laok;->c:Lvpk;

    iget-object p0, p0, Lvpk;->b:Lode;

    iget-object p1, p2, Lkok;->g:Liok;

    iget-object p2, p1, Liok;->c:Lode;

    if-eqz p2, :cond_32

    invoke-virtual {p2, p1}, Lekc;->p(Lf7f;)V

    :cond_32
    iput-object p0, p1, Liok;->c:Lode;

    if-eqz p0, :cond_39

    invoke-virtual {p0, p1}, Lekc;->k(Lf7f;)V

    :cond_39
    return-void
.end method

.method public final Y()V
    .registers 4

    iget-object v0, p0, Lbok;->g:Lkze;

    iget-object v1, p0, Lbok;->j:Lqzg;

    invoke-virtual {v0, v1}, Lekc;->p(Lf7f;)V

    iget-object v0, p0, Lbok;->i:Lkok;

    const/4 v1, 0x0

    iput-object v1, v0, Lkok;->p:Lzzh;

    iget-object v0, v0, Lkok;->g:Liok;

    iget-object v2, v0, Liok;->c:Lode;

    if-eqz v2, :cond_15

    invoke-virtual {v2, v0}, Lekc;->p(Lf7f;)V

    :cond_15
    iput-object v1, v0, Liok;->c:Lode;

    invoke-super {p0}, Lwu8;->Y()V

    return-void
.end method

.method public final c0()V
    .registers 4

    iget-object p0, p0, Lbok;->i:Lkok;

    iget-boolean v0, p0, Lkok;->q:Z

    if-nez v0, :cond_7

    return-void

    :cond_7
    const/4 v0, 0x0

    iput-boolean v0, p0, Lkok;->q:Z

    iget-object v1, p0, Lkok;->n:Lgd6;

    iput-boolean v0, v1, Lgd6;->b:Z

    iput v0, v1, Lgd6;->c:I

    iget-object v1, p0, Lkok;->g:Liok;

    iput-boolean v0, v1, Liok;->d:Z

    iget-object v0, p0, Lkok;->i:Lw6j;

    const/4 v1, -0x1

    sget-object v2, Lhr0;->b:Lhr0;

    invoke-virtual {v0, v1, v2}, Lw6j;->o(ILhr0;)V

    iget-object p0, p0, Lkok;->a:Lcom/opera/android/custom_views/FadingRecyclerView;

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/opera/android/custom_views/RecyclerViewForScreenshot;->B0(Landroidx/recyclerview/widget/e;)V

    return-void
.end method

.method public final e0()V
    .registers 4

    iget-object p0, p0, Lbok;->i:Lkok;

    iget-object v0, p0, Lkok;->a:Lcom/opera/android/custom_views/FadingRecyclerView;

    iget-boolean v1, p0, Lkok;->q:Z

    if-eqz v1, :cond_9

    return-void

    :cond_9
    const/4 v1, 0x1

    iput-boolean v1, p0, Lkok;->q:Z

    iget-object v2, p0, Lkok;->g:Liok;

    iput-boolean v1, v2, Liok;->d:Z

    iget-boolean v1, v2, Liok;->e:Z

    if-eqz v1, :cond_2b

    const/4 v1, 0x0

    iput-boolean v1, v2, Liok;->e:Z

    iget-object v1, v2, Liok;->c:Lode;

    if-eqz v1, :cond_24

    invoke-virtual {v1}, Lekc;->g()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lupk;

    iget-object v1, v1, Lupk;->a:Lh1b;

    goto :goto_26

    :cond_24
    sget-object v1, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    :goto_26
    iget-object v2, v2, Liok;->a:Lxok;

    invoke-virtual {v2, v1}, Lxok;->D(Ljava/util/List;)Ljava/util/List;

    :cond_2b
    iget-object v1, p0, Lkok;->i:Lw6j;

    invoke-virtual {v1}, Lw6j;->p()V

    iget-object v1, p0, Lkok;->j:Ljok;

    invoke-virtual {v1}, Ljok;->j()V

    invoke-virtual {v0}, Lcom/opera/android/custom_views/FadingRecyclerView;->requestLayout()V

    new-instance v1, Lho3;

    const/4 v2, 0x7

    invoke-direct {v1, p0, v2}, Lho3;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v0, v1}, Landroid/view/View;->addOnLayoutChangeListener(Landroid/view/View$OnLayoutChangeListener;)V

    return-void
.end method

.method public final onDestroy()V
    .registers 4

    iget-object p0, p0, Lbok;->i:Lkok;

    iget-object v0, p0, Lkok;->a:Lcom/opera/android/custom_views/FadingRecyclerView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->y0(Landroidx/recyclerview/widget/d;)V

    iput-object v1, p0, Lkok;->k:Lhok;

    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->C0(Landroidx/recyclerview/widget/f;)V

    iget-object v0, p0, Lkok;->e:Lizj;

    iget-object v0, v0, Lizj;->a:Ljava/util/ArrayList;

    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    iget-object v0, p0, Lkok;->g:Liok;

    iget-object v2, v0, Liok;->c:Lode;

    if-eqz v2, :cond_1d

    invoke-virtual {v2, v0}, Lekc;->p(Lf7f;)V

    :cond_1d
    iput-object v1, v0, Liok;->c:Lode;

    iget-object v0, p0, Lkok;->t:Lkze;

    iget-object p0, p0, Lkok;->u:Ldok;

    invoke-virtual {v0, p0}, Lekc;->p(Lf7f;)V

    return-void
.end method

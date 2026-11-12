.class public final Low7;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lhzj;


# instance fields
.field public final a:Landroid/view/View;

.field public final b:Lnr8;

.field public final c:Landroidx/recyclerview/widget/RecyclerView;

.field public final d:Lcom/opera/android/feed/FeedScrollView;

.field public final e:Lizj;

.field public final f:Lx5f;

.field public final g:Ljr8;

.field public final h:Llw7;

.field public i:Lns8;

.field public j:Z

.field public final k:Liw7;

.field public final l:Lkze;

.field public final m:Lfw7;

.field public final n:Lx77;

.field public final o:Lcom/opera/android/favorites/FavoriteGridLayoutManager;


# direct methods
.method public constructor <init>(Lcom/opera/android/BrowserActivity;Lnr8;Landroidx/recyclerview/widget/RecyclerView;Lcom/opera/android/feed/FeedScrollView;Lbvl;Lx5f;Lcom/opera/android/settings/SettingsManager;Lkze;Lnv2;Ltlg;Lpde;Lp6l;)V
    .registers 26

    move-object v8, p2

    move-object/from16 v0, p3

    move-object/from16 v2, p4

    move-object/from16 v3, p6

    move-object/from16 v4, p8

    move-object/from16 v5, p11

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v6, Lkr8;

    invoke-direct {v6}, Lxr6;-><init>()V

    new-instance v7, Liw7;

    const/4 v9, 0x0

    invoke-direct {v7, p0, v9}, Liw7;-><init>(Lhzj;B)V

    iput-object v7, p0, Low7;->k:Liw7;

    new-instance v7, Lfw7;

    invoke-direct {v7, p0, v9}, Lfw7;-><init>(Low7;B)V

    iput-object v7, p0, Low7;->m:Lfw7;

    new-instance v10, Lx77;

    const/4 v11, 0x7

    invoke-direct {v10, v11}, Lx77;-><init>(B)V

    iput-object v10, p0, Low7;->n:Lx77;

    invoke-static {v0}, Lp37;->z(Landroid/view/View;)Lkze;

    move-result-object v10

    const v11, 0x7f0a062b

    invoke-virtual {p1, v11}, Lfp1;->findViewById(I)Landroid/view/View;

    move-result-object v11

    iput-object v11, p0, Low7;->a:Landroid/view/View;

    iput-object v8, p0, Low7;->b:Lnr8;

    iput-object v0, p0, Low7;->c:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v0, v6}, Landroidx/recyclerview/widget/RecyclerView;->B0(Landroidx/recyclerview/widget/e;)V

    invoke-virtual {v0, v9}, Landroidx/recyclerview/widget/RecyclerView;->setNestedScrollingEnabled(Z)V

    iput-object v2, p0, Low7;->d:Lcom/opera/android/feed/FeedScrollView;

    invoke-virtual {v0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    invoke-virtual {p1}, Lcom/opera/android/BrowserActivity;->K0()Lizj;

    move-result-object v6

    iput-object v6, p0, Low7;->e:Lizj;

    iget-object v11, v6, Lizj;->a:Ljava/util/ArrayList;

    invoke-virtual {v11, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    new-instance v11, Lfw7;

    const/4 v12, 0x1

    invoke-direct {v11, p0, v12}, Lfw7;-><init>(Low7;B)V

    invoke-static {v5, v10, v11}, La26;->T(Lekc;Likc;Lf7f;)V

    iput-object v3, p0, Low7;->f:Lx5f;

    new-instance v10, Ljr8;

    invoke-direct {v10, v3}, Ljr8;-><init>(Lskm;)V

    iput-object v10, p0, Low7;->g:Ljr8;

    iput-object v4, p0, Low7;->l:Lkze;

    invoke-virtual {v4, v7}, Lekc;->k(Lf7f;)V

    new-instance v3, Llw7;

    invoke-virtual {p1}, Lxd5;->getLifecycle()Ltcc;

    move-result-object v4

    invoke-direct {v3, p0, v4}, Llw7;-><init>(Low7;Ltcc;)V

    iput-object v3, p0, Low7;->h:Llw7;

    new-instance v3, Lcom/opera/android/favorites/FavoriteGridLayoutManager;

    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    iget-object v4, v6, Lizj;->d:Lpde;

    invoke-static {v4}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v6, Lgw7;

    invoke-direct {v6, v4, v9}, Lgw7;-><init>(Lpde;B)V

    invoke-static {v5}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v4, Lgw7;

    invoke-direct {v4, v5, v12}, Lgw7;-><init>(Lpde;B)V

    invoke-direct {v3, v6, v4, v9}, Lcom/opera/android/favorites/FavoriteGridLayoutManager;-><init>(Lesk;Lesk;Z)V

    iput-object v3, p0, Low7;->o:Lcom/opera/android/favorites/FavoriteGridLayoutManager;

    invoke-virtual {v0, v3}, Landroidx/recyclerview/widget/RecyclerView;->C0(Landroidx/recyclerview/widget/f;)V

    new-instance v3, Lnw7;

    invoke-direct {v3, p0}, Lnw7;-><init>(Low7;)V

    sget v4, Lcom/opera/android/RootView;->D:I

    const v4, 0x7f0a0342

    invoke-virtual {v0, v4, v3}, Landroid/view/View;->setTag(ILjava/lang/Object;)V

    new-instance v0, Lhw7;

    invoke-direct {v0, p0, v9}, Lhw7;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v2, v0}, Lcom/opera/android/feed/FeedScrollView;->F(Lile;)V

    new-instance v0, Lkw7;

    move-object v1, p0

    move-object v3, p1

    move-object/from16 v7, p5

    move-object/from16 v2, p7

    move-object/from16 v4, p9

    move-object/from16 v5, p10

    move-object/from16 v6, p12

    invoke-direct/range {v0 .. v7}, Lkw7;-><init>(Low7;Lcom/opera/android/settings/SettingsManager;Lcom/opera/android/BrowserActivity;Lnv2;Ltlg;Lp6l;Lbvl;)V

    invoke-virtual {p2, v0}, Lnr8;->f(Ljava/lang/Runnable;)V

    return-void
.end method


# virtual methods
.method public final a(Z)V
    .registers 4

    if-eqz p1, :cond_38

    iget-object p1, p0, Low7;->e:Lizj;

    iget-object p1, p1, Lizj;->d:Lpde;

    invoke-virtual {p1}, Lekc;->g()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ltta;

    iget-object v0, p0, Low7;->i:Lns8;

    if-eqz v0, :cond_13

    invoke-virtual {v0, p1}, Lns8;->V(Ltta;)V

    :cond_13
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object p1, p0, Low7;->o:Lcom/opera/android/favorites/FavoriteGridLayoutManager;

    iget v0, p1, Landroidx/recyclerview/widget/CustomGridLayoutManager;->g:I

    const/4 v1, 0x1

    if-eq v0, v1, :cond_22

    iput v1, p1, Landroidx/recyclerview/widget/CustomGridLayoutManager;->g:I

    invoke-virtual {p1}, Landroidx/recyclerview/widget/f;->requestLayout()V

    :cond_22
    iget-object p0, p0, Low7;->c:Landroidx/recyclerview/widget/RecyclerView;

    iget-object p1, p0, Landroidx/recyclerview/widget/RecyclerView;->m:Landroidx/recyclerview/widget/d;

    if-eqz p1, :cond_38

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Landroidx/recyclerview/widget/RecyclerView;->y0(Landroidx/recyclerview/widget/d;)V

    iget-object v0, p0, Landroidx/recyclerview/widget/RecyclerView;->c:Landroidx/recyclerview/widget/g;

    invoke-virtual {v0}, Landroidx/recyclerview/widget/g;->c()Lro9;

    move-result-object v0

    invoke-virtual {v0}, Lro9;->f()V

    invoke-virtual {p0, p1}, Landroidx/recyclerview/widget/RecyclerView;->y0(Landroidx/recyclerview/widget/d;)V

    :cond_38
    return-void
.end method

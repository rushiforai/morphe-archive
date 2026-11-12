.class public final Lkw7;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/opera/android/settings/SettingsManager;

.field public final synthetic b:Lcom/opera/android/BrowserActivity;

.field public final synthetic c:Lnv2;

.field public final synthetic d:Ltlg;

.field public final synthetic e:Lp6l;

.field public final synthetic f:Lbvl;

.field public final synthetic g:Low7;


# direct methods
.method public constructor <init>(Low7;Lcom/opera/android/settings/SettingsManager;Lcom/opera/android/BrowserActivity;Lnv2;Ltlg;Lp6l;Lbvl;)V
    .registers 8

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lkw7;->a:Lcom/opera/android/settings/SettingsManager;

    iput-object p3, p0, Lkw7;->b:Lcom/opera/android/BrowserActivity;

    iput-object p4, p0, Lkw7;->c:Lnv2;

    iput-object p5, p0, Lkw7;->d:Ltlg;

    iput-object p6, p0, Lkw7;->e:Lp6l;

    iput-object p7, p0, Lkw7;->f:Lbvl;

    iput-object p1, p0, Lkw7;->g:Low7;

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 19

    move-object/from16 v0, p0

    new-instance v1, Lns8;

    iget-object v15, v0, Lkw7;->g:Low7;

    iget-object v2, v15, Low7;->b:Lnr8;

    check-cast v2, Lcom/opera/android/favorites/e;

    iget-object v2, v2, Lcom/opera/android/favorites/e;->f:Lcom/opera/android/favorites/b;

    iget-object v3, v15, Low7;->e:Lizj;

    iget-object v4, v3, Lizj;->d:Lpde;

    invoke-virtual {v4}, Lekc;->g()Ljava/lang/Object;

    move-result-object v4

    move-object v6, v4

    check-cast v6, Ltta;

    iget-object v9, v15, Low7;->f:Lx5f;

    const-class v4, Lqr8;

    iget-object v5, v0, Lkw7;->b:Lcom/opera/android/BrowserActivity;

    iget-object v5, v5, Lcom/opera/android/BrowserActivity;->g0:Lwub;

    invoke-virtual {v5, v4}, Lwub;->E(Ljava/lang/Class;)Ljnf;

    move-result-object v4

    move-object v10, v4

    check-cast v10, Lqr8;

    const/4 v13, 0x0

    iget-object v14, v0, Lkw7;->e:Lp6l;

    move-object v4, v3

    iget-object v3, v0, Lkw7;->a:Lcom/opera/android/settings/SettingsManager;

    move-object v5, v4

    const/4 v4, 0x1

    move-object v7, v5

    const/4 v5, 0x0

    move-object v8, v7

    const/4 v7, 0x1

    move-object v11, v8

    const/4 v8, 0x0

    move-object v12, v11

    iget-object v11, v0, Lkw7;->c:Lnv2;

    move-object/from16 v16, v12

    iget-object v12, v0, Lkw7;->d:Ltlg;

    move-object/from16 v17, v16

    invoke-direct/range {v1 .. v14}, Lns8;-><init>(Ltq8;Lcom/opera/android/settings/SettingsManager;ZLo28;Ltta;ZZLskm;Lqr8;Lnv2;Ltlg;Lzzj;Lp6l;)V

    iput-object v1, v15, Low7;->i:Lns8;

    iget-object v2, v15, Low7;->l:Lkze;

    invoke-virtual {v2}, Lekc;->g()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lvr8;

    invoke-virtual {v1, v2}, Lns8;->X(Lvr8;)V

    iget-object v1, v15, Low7;->i:Lns8;

    const/4 v2, 0x1

    iput-boolean v2, v1, Lns8;->t:Z

    new-instance v3, Lr9i;

    iget-object v4, v15, Low7;->d:Lcom/opera/android/feed/FeedScrollView;

    iget-object v5, v15, Low7;->a:Landroid/view/View;

    new-instance v6, Ljw7;

    const/4 v7, 0x0

    iget-object v0, v0, Lkw7;->f:Lbvl;

    invoke-direct {v6, v0, v7}, Ljw7;-><init>(Lbvl;B)V

    invoke-direct {v3, v4, v5, v6}, Lr9i;-><init>(Landroidx/core/widget/NestedScrollView;Landroid/view/View;Lhcb;)V

    iput-object v3, v1, Lns8;->f:Lr9i;

    iget-object v0, v15, Low7;->k:Liw7;

    iget-object v1, v1, Lns8;->k:Lh7f;

    invoke-virtual {v1, v0}, Lh7f;->b(Ljava/lang/Object;)Z

    move-object/from16 v4, v17

    iget-object v0, v4, Lizj;->d:Lpde;

    invoke-virtual {v0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ltta;

    iget-object v1, v15, Low7;->i:Lns8;

    if-eqz v1, :cond_7d

    invoke-virtual {v1, v0}, Lns8;->V(Ltta;)V

    :cond_7d
    iget-object v1, v15, Low7;->o:Lcom/opera/android/favorites/FavoriteGridLayoutManager;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget v0, v1, Landroidx/recyclerview/widget/CustomGridLayoutManager;->g:I

    if-eq v0, v2, :cond_8b

    iput v2, v1, Landroidx/recyclerview/widget/CustomGridLayoutManager;->g:I

    invoke-virtual {v1}, Landroidx/recyclerview/widget/f;->requestLayout()V

    :cond_8b
    iget-object v0, v15, Low7;->c:Landroidx/recyclerview/widget/RecyclerView;

    iget-object v1, v15, Low7;->i:Lns8;

    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->y0(Landroidx/recyclerview/widget/d;)V

    iget-object v0, v15, Low7;->n:Lx77;

    iget-object v1, v15, Low7;->i:Lns8;

    iget-object v2, v0, Lx77;->d:Ljava/lang/Object;

    check-cast v2, La83;

    iget-object v3, v0, Lx77;->c:Ljava/lang/Object;

    check-cast v3, Lns8;

    if-ne v1, v3, :cond_a1

    return-void

    :cond_a1
    if-eqz v3, :cond_a6

    invoke-virtual {v3, v2}, Landroidx/recyclerview/widget/d;->unregisterAdapterDataObserver(Lgph;)V

    :cond_a6
    iput-object v1, v0, Lx77;->c:Ljava/lang/Object;

    if-eqz v1, :cond_ad

    invoke-virtual {v1, v2}, Landroidx/recyclerview/widget/d;->registerAdapterDataObserver(Lgph;)V

    :cond_ad
    invoke-virtual {v0}, Lx77;->p()V

    return-void
.end method

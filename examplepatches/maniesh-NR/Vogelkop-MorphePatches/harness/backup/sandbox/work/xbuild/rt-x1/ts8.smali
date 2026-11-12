.class public final Lts8;
.super Lv5k;
.source "SourceFile"


# instance fields
.field public final d:Landroidx/recyclerview/widget/RecyclerView;

.field public final e:Lcom/opera/android/feed/FeedScrollView;

.field public final f:Lx5f;

.field public final g:Lcom/opera/android/settings/SettingsManager;

.field public final h:Ltsd;

.field public final i:Ltsd;

.field public final j:Lbvl;

.field public final k:Lnr8;

.field public final l:Lkze;

.field public final m:Landroid/view/View$OnLongClickListener;

.field public final n:Ldg7;

.field public final o:Lnv2;

.field public final p:Ltlg;

.field public final q:Lss8;

.field public final r:Los8;

.field public final s:Los8;

.field public t:Z

.field public final u:Lagm;


# direct methods
.method public constructor <init>(Landroidx/recyclerview/widget/RecyclerView;Lcom/opera/android/feed/FeedScrollView;Lx5f;Lcom/opera/android/settings/SettingsManager;Ltsd;Ltsd;Lbvl;Lnr8;Lkze;Landroid/view/View$OnLongClickListener;Lijc;Ldg7;Lnv2;Ltlg;Lpde;Lp6l;)V
    .registers 24

    move-object v0, p8

    move-object/from16 v1, p14

    sget-object v2, Le6k;->i:Le6k;

    const v3, 0x7f0d01a4

    const-class v4, Lqs8;

    move-object/from16 v5, p11

    invoke-direct {p0, v4, v5, v2, v3}, Lv5k;-><init>(Ljava/lang/Class;Lijc;Le6k;I)V

    iput-object p1, p0, Lts8;->d:Landroidx/recyclerview/widget/RecyclerView;

    iput-object p2, p0, Lts8;->e:Lcom/opera/android/feed/FeedScrollView;

    iput-object p3, p0, Lts8;->f:Lx5f;

    iput-object p4, p0, Lts8;->g:Lcom/opera/android/settings/SettingsManager;

    iput-object p5, p0, Lts8;->h:Ltsd;

    iput-object p6, p0, Lts8;->i:Ltsd;

    move-object p1, p7

    iput-object p1, p0, Lts8;->j:Lbvl;

    iput-object v0, p0, Lts8;->k:Lnr8;

    move-object/from16 p1, p9

    iput-object p1, p0, Lts8;->l:Lkze;

    move-object/from16 p1, p10

    iput-object p1, p0, Lts8;->m:Landroid/view/View$OnLongClickListener;

    move-object/from16 p1, p12

    iput-object p1, p0, Lts8;->n:Ldg7;

    move-object/from16 p1, p13

    iput-object p1, p0, Lts8;->o:Lnv2;

    iput-object v1, p0, Lts8;->p:Ltlg;

    new-instance p1, Lss8;

    invoke-direct {p1, p0, v2}, Lss8;-><init>(Lts8;Le6k;)V

    iput-object p1, p0, Lts8;->q:Lss8;

    new-instance p1, Los8;

    const/4 p2, 0x0

    invoke-direct {p1, p0, p2}, Los8;-><init>(Lts8;B)V

    iput-object p1, p0, Lts8;->r:Los8;

    new-instance p3, Los8;

    const/4 v2, 0x1

    invoke-direct {p3, p0, v2}, Los8;-><init>(Lts8;B)V

    iput-object p3, p0, Lts8;->s:Los8;

    new-instance v2, Lagm;

    new-instance v3, Lhv;

    const/16 v4, 0xe

    move-object/from16 v5, p15

    move-object/from16 v6, p16

    invoke-direct {v3, p0, v5, v6, v4}, Lhv;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-direct {v2, v3}, Lagm;-><init>(Lkotlin/jvm/functions/Function0;)V

    iput-object v2, p0, Lts8;->u:Lagm;

    invoke-virtual {p5, p1}, Lekc;->k(Lf7f;)V

    invoke-virtual {p6, p1}, Lekc;->k(Lf7f;)V

    iget-object p1, v1, Ltlg;->h:Lkze;

    invoke-virtual {p1, p3}, Lekc;->k(Lf7f;)V

    new-instance p1, Lps8;

    invoke-direct {p1, p0, p2}, Lps8;-><init>(Lts8;B)V

    invoke-virtual {p8, p1}, Lnr8;->f(Ljava/lang/Runnable;)V

    invoke-static {p0}, Lac8;->c(Ljava/lang/Object;)V

    return-void
.end method


# virtual methods
.method public final B(Landroid/view/ViewGroup;)Lab2;
    .registers 2

    iget-object p0, p0, Lts8;->u:Lagm;

    invoke-virtual {p0}, Lagm;->r()Lab2;

    move-result-object p0

    return-object p0
.end method

.method public final C(Lnzj;)V
    .registers 2
    .param p1    # Lnzj;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation runtime Lvkk;
    .end annotation

    invoke-virtual {p0}, Lu5k;->A()V

    return-void
.end method

.method public final onDestroy()V
    .registers 3

    iget-object v0, p0, Lts8;->h:Ltsd;

    iget-object v1, p0, Lts8;->r:Los8;

    invoke-virtual {v0, v1}, Lekc;->p(Lf7f;)V

    iget-object v0, p0, Lts8;->i:Ltsd;

    invoke-virtual {v0, v1}, Lekc;->p(Lf7f;)V

    iget-object v0, p0, Lts8;->p:Ltlg;

    iget-object v0, v0, Ltlg;->h:Lkze;

    iget-object v1, p0, Lts8;->s:Los8;

    invoke-virtual {v0, v1}, Lekc;->p(Lf7f;)V

    invoke-static {p0}, Lac8;->d(Ljava/lang/Object;)V

    return-void
.end method

.method public final u()Lk6k;
    .registers 1

    iget-object p0, p0, Lts8;->q:Lss8;

    return-object p0
.end method

.method public final z()Z
    .registers 2

    iget-object v0, p0, Lts8;->h:Ltsd;

    invoke-virtual {v0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_40

    iget-boolean v0, p0, Lts8;->t:Z

    if-eqz v0, :cond_20

    iget-object v0, p0, Lts8;->k:Lnr8;

    check-cast v0, Lcom/opera/android/favorites/e;

    iget-object v0, v0, Lcom/opera/android/favorites/e;->f:Lcom/opera/android/favorites/b;

    iget-object v0, v0, Ltq8;->e:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-gtz v0, :cond_3e

    :cond_20
    iget-object v0, p0, Lts8;->i:Ltsd;

    invoke-virtual {v0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_40

    iget-object p0, p0, Lts8;->p:Ltlg;

    iget-object p0, p0, Ltlg;->h:Lkze;

    invoke-virtual {p0}, Lekc;->g()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Boolean;

    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p0

    if-eqz p0, :cond_40

    :cond_3e
    const/4 p0, 0x1

    return p0

    :cond_40
    const/4 p0, 0x0

    return p0
.end method

.class public Lns8;
.super Landroidx/recyclerview/widget/d;
.source "SourceFile"

# interfaces
.implements Lgq8;
.implements Lsq8;
.implements Lsj7;


# instance fields
.field public A:Z

.field public a:Z

.field public final b:Lqr8;

.field public final c:Ls9i;

.field public final d:Z

.field public e:Landroidx/recyclerview/widget/RecyclerView;

.field public f:Lr9i;

.field public g:Ltta;

.field public h:Lvr8;

.field public final i:Lvi7;

.field public final j:Lflb;

.field public final k:Lh7f;

.field public final l:Lskm;

.field public final m:Lcom/opera/android/settings/SettingsManager;

.field public final n:Z

.field public final o:Z

.field public final p:Lgs8;

.field public final q:Ljava/util/HashMap;

.field public r:Lbn7;

.field public s:Lqlk;

.field public t:Z

.field public final u:Lnv2;

.field public final v:Lzr8;

.field public final w:Lzr8;

.field public final x:Ltlg;

.field public final y:Lzzj;

.field public final z:Lp6l;


# direct methods
.method public constructor <init>(Ltq8;Lcom/opera/android/settings/SettingsManager;ZLo28;Ltta;ZZLskm;Lqr8;Lnv2;Ltlg;Lzzj;Lp6l;)V
    .registers 15

    invoke-direct {p0}, Landroidx/recyclerview/widget/d;-><init>()V

    sget-object v0, Lvr8;->l:Lvr8;

    iput-object v0, p0, Lns8;->h:Lvr8;

    new-instance v0, Lh7f;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lns8;->k:Lh7f;

    new-instance v0, Lgs8;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lns8;->p:Lgs8;

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lns8;->q:Ljava/util/HashMap;

    iput-object p11, p0, Lns8;->x:Ltlg;

    const/4 p11, 0x1

    invoke-virtual {p0, p11}, Landroidx/recyclerview/widget/d;->setHasStableIds(Z)V

    new-instance v0, Ls9i;

    invoke-direct {v0, p0, p1}, Ls9i;-><init>(Lns8;Ltq8;)V

    iput-object v0, p0, Lns8;->c:Ls9i;

    new-instance p1, Lzr8;

    const/4 v0, 0x0

    invoke-direct {p1, p0, v0}, Lzr8;-><init>(Lns8;B)V

    iput-object p1, p0, Lns8;->v:Lzr8;

    new-instance p1, Lzr8;

    invoke-direct {p1, p0, p11}, Lzr8;-><init>(Lns8;B)V

    iput-object p1, p0, Lns8;->w:Lzr8;

    iput-boolean p3, p0, Lns8;->d:Z

    iput-object p5, p0, Lns8;->g:Ltta;

    iget p1, p5, Ltta;->a:I

    invoke-virtual {p0, p1, p4}, Lns8;->G(ILo28;)Lvi7;

    move-result-object p1

    iput-object p1, p0, Lns8;->i:Lvi7;

    if-eqz p1, :cond_49

    iget-object p1, p1, Lvi7;->g:Lflb;

    goto :goto_4a

    :cond_49
    const/4 p1, 0x0

    :goto_4a
    iput-object p1, p0, Lns8;->j:Lflb;

    iput-boolean p6, p0, Lns8;->n:Z

    iput-boolean p7, p0, Lns8;->o:Z

    iput-object p8, p0, Lns8;->l:Lskm;

    iput-object p2, p0, Lns8;->m:Lcom/opera/android/settings/SettingsManager;

    iput-object p9, p0, Lns8;->b:Lqr8;

    iput-object p10, p0, Lns8;->u:Lnv2;

    iput-object p12, p0, Lns8;->y:Lzzj;

    iput-object p13, p0, Lns8;->z:Lp6l;

    return-void
.end method


# virtual methods
.method public final B(ILhq8;)V
    .registers 3

    invoke-virtual {p0, p1}, Landroidx/recyclerview/widget/d;->notifyItemRemoved(I)V

    return-void
.end method

.method public G(ILo28;)Lvi7;
    .registers 10

    iget-boolean v0, p0, Lns8;->d:Z

    if-nez v0, :cond_6

    const/4 p0, 0x0

    return-object p0

    :cond_6
    new-instance v0, Lvi7;

    sget-object v1, Lvml;->d:Lumi;

    iget-object v2, p0, Lns8;->c:Ls9i;

    iget-object v2, v2, Ls9i;->b:Ljava/lang/Object;

    check-cast v2, Ltq8;

    invoke-virtual {v2}, Ltq8;->y()Z

    move-result v3

    const/16 v4, 0x1f4

    const/4 v6, 0x1

    move-object v5, p0

    move v2, p1

    invoke-direct/range {v0 .. v6}, Lvi7;-><init>(Lumi;IZILns8;Z)V

    const/4 p0, 0x0

    iput-boolean p0, v0, Lvi7;->t:Z

    iput-object p2, v0, Lvi7;->n:Lo28;

    return-object v0
.end method

.method public H(Landroid/content/Context;Lhq8;)Ljava/util/List;
    .registers 10

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iget-object v1, p0, Lns8;->z:Lp6l;

    invoke-virtual {p2, v1}, Lhq8;->i(Lp6l;)Ljava/lang/String;

    move-result-object v1

    sget-object v2, Lhk6;->e:La36;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v1}, La36;->p(Ljava/lang/String;)Z

    move-result v1

    iget-boolean v2, p0, Lns8;->d:Z

    const/4 v3, 0x1

    const/4 v4, 0x0

    const v5, 0x7f0804df

    const v6, 0x7f140be8

    if-eqz v2, :cond_74

    if-nez v1, :cond_39

    new-instance v1, Lgtd;

    new-instance v2, Lrxh;

    invoke-direct {v2, v6}, Lrxh;-><init>(I)V

    new-instance v6, Llxh;

    invoke-direct {v6, v5}, Llxh;-><init>(I)V

    new-instance v5, Las8;

    invoke-direct {v5, p0, p2, v4}, Las8;-><init>(Lns8;Lhq8;B)V

    invoke-direct {v1, v2, v6, v5}, Lgtd;-><init>(Lrxh;Llxh;Landroid/view/View$OnClickListener;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_39
    new-instance v1, Lgtd;

    new-instance v2, Lrxh;

    const v5, 0x7f140634

    invoke-direct {v2, v5}, Lrxh;-><init>(I)V

    new-instance v5, Llxh;

    const v6, 0x7f0803fe

    invoke-direct {v5, v6}, Llxh;-><init>(I)V

    new-instance v6, Lbs8;

    invoke-direct {v6, p0, p1, p2, v4}, Lbs8;-><init>(Lns8;Landroid/content/Context;Lhq8;B)V

    invoke-direct {v1, v2, v5, v6}, Lgtd;-><init>(Lrxh;Llxh;Landroid/view/View$OnClickListener;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    new-instance v1, Lgtd;

    new-instance v2, Lrxh;

    const v4, 0x7f140567

    invoke-direct {v2, v4}, Lrxh;-><init>(I)V

    new-instance v4, Llxh;

    const v5, 0x7f080540

    invoke-direct {v4, v5}, Llxh;-><init>(I)V

    new-instance v5, Lbs8;

    invoke-direct {v5, p0, p1, p2, v3}, Lbs8;-><init>(Lns8;Landroid/content/Context;Lhq8;B)V

    invoke-direct {v1, v2, v4, v5}, Lgtd;-><init>(Lrxh;Llxh;Landroid/view/View$OnClickListener;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-object v0

    :cond_74
    if-nez v1, :cond_8d

    new-instance v1, Lgtd;

    new-instance v2, Lrxh;

    invoke-direct {v2, v6}, Lrxh;-><init>(I)V

    new-instance v6, Llxh;

    invoke-direct {v6, v5}, Llxh;-><init>(I)V

    new-instance v5, Las8;

    invoke-direct {v5, p0, p2, v3}, Las8;-><init>(Lns8;Lhq8;B)V

    invoke-direct {v1, v2, v6, v5}, Lgtd;-><init>(Lrxh;Llxh;Landroid/view/View$OnClickListener;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_8d
    new-instance v1, Lgtd;

    new-instance v2, Lrxh;

    const v5, 0x7f140a2a

    invoke-direct {v2, v5}, Lrxh;-><init>(I)V

    new-instance v5, Llxh;

    const v6, 0x7f0805fa

    invoke-direct {v5, v6}, Llxh;-><init>(I)V

    new-instance v6, Lcs8;

    invoke-direct {v6, p0, p1, p2, v4}, Lcs8;-><init>(Lns8;Landroid/content/Context;Lhq8;B)V

    invoke-direct {v1, v2, v5, v6}, Lgtd;-><init>(Lrxh;Llxh;Landroid/view/View$OnClickListener;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-virtual {p2}, Lhq8;->j()Z

    move-result v1

    if-nez v1, :cond_cd

    new-instance v1, Lgtd;

    new-instance v2, Lrxh;

    const v4, 0x7f1404f4

    invoke-direct {v2, v4}, Lrxh;-><init>(I)V

    new-instance v4, Llxh;

    const v5, 0x7f080533

    invoke-direct {v4, v5}, Llxh;-><init>(I)V

    new-instance v5, Lcs8;

    invoke-direct {v5, p0, p1, p2, v3}, Lcs8;-><init>(Lns8;Landroid/content/Context;Lhq8;B)V

    invoke-direct {v1, v2, v4, v5}, Lgtd;-><init>(Lrxh;Llxh;Landroid/view/View$OnClickListener;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_cd
    return-object v0
.end method

.method public I(Landroid/content/Context;Lhq8;)V
    .registers 3

    sget-object p0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    check-cast p0, Lcom/opera/android/OperaApplication;

    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->o()Lnr8;

    move-result-object p0

    check-cast p0, Lcom/opera/android/favorites/e;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p2}, Lhq8;->e()J

    move-result-wide p0

    sget-object p2, Lcom/opera/android/favorites/FavoritesBridge;->a:Li7f;

    invoke-static {p0, p1}, LJ/N;->Mw8yLl_M(J)V

    return-void
.end method

.method public final J(Lvx3;Z)V
    .registers 6

    iget-object p0, p0, Lns8;->m:Lcom/opera/android/settings/SettingsManager;

    invoke-virtual {p0}, Lcom/opera/android/settings/SettingsManager;->C()Lq7j;

    move-result-object p0

    sget-object v0, Lq7j;->b:Lq7j;

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-ne p0, v0, :cond_e

    move p0, v2

    goto :goto_f

    :cond_e
    move p0, v1

    :goto_f
    invoke-virtual {p1, v2}, Lvx3;->c(Z)V

    sget-object v0, Lwx3;->Go:Lulp;

    iput-object v0, p1, Lvx3;->k:Lwx3;

    iput v2, p1, Lvx3;->c:I

    xor-int/lit8 v0, p0, 0x1

    invoke-virtual {p1, v0}, Lvx3;->a(Z)V

    if-nez p0, :cond_21

    if-nez p2, :cond_22

    :cond_21
    move v1, v2

    :cond_22
    invoke-virtual {p1, v1}, Lvx3;->d(Z)V

    iput-boolean p2, p1, Lvx3;->f:Z

    invoke-static {p1}, Lam2;->v(Lvx3;)V

    return-void
.end method

.method public final K(Lhq8;)I
    .registers 3

    iget-object p0, p0, Lns8;->c:Ls9i;

    iget-object p0, p0, Ls9i;->b:Ljava/lang/Object;

    check-cast p0, Ltq8;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object v0, p1, Lhq8;->b:Ltq8;

    if-eq v0, p0, :cond_f

    const/4 p0, -0x1

    return p0

    :cond_f
    iget p0, p1, Lhq8;->c:I

    return p0
.end method

.method public final L(Lfs8;Lhq8;)Z
    .registers 9

    iget-object v0, p1, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    if-eqz v0, :cond_73

    iget-object v0, p0, Lns8;->j:Lflb;

    if-eqz v0, :cond_14

    iget v1, v0, Lflb;->p:I

    const/4 v2, -0x1

    if-eq v1, v2, :cond_14

    invoke-virtual {v0, p1}, Lflb;->s(Landroidx/recyclerview/widget/i;)V

    :cond_14
    iget-object v1, p1, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v1

    check-cast v1, Landroidx/recyclerview/widget/RecyclerView;

    iget-object v2, p1, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {v2}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {p0, v2, p2}, Lns8;->H(Landroid/content/Context;Lhq8;)Ljava/util/List;

    move-result-object v2

    if-eqz v2, :cond_73

    invoke-interface {v2}, Ljava/util/List;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_73

    new-instance v3, Li3j;

    invoke-direct {v3, v1, p0, p2}, Li3j;-><init>(Landroidx/recyclerview/widget/RecyclerView;Lns8;Lhq8;)V

    iget-boolean p2, p0, Lns8;->o:Z

    if-eqz p2, :cond_3a

    sget-object p2, Lftd;->d:Lftd;

    goto :goto_3c

    :cond_3a
    sget-object p2, Lftd;->c:Lftd;

    :goto_3c
    new-instance v4, Lexd;

    iget-object v5, p0, Lns8;->b:Lqr8;

    iget-object v5, v5, Lqr8;->i:Lwt3;

    invoke-virtual {v5}, Lwt3;->get()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/view/ViewGroup;

    invoke-direct {v4, v5, v3, p2, v2}, Lexd;-><init>(Landroid/view/ViewGroup;Lhxj;Lftd;Ljava/util/List;)V

    iget-object p2, p0, Lns8;->p:Lgs8;

    invoke-virtual {v4, p2}, Llz3;->a(Lkz3;)V

    const/4 v2, 0x1

    if-eqz v0, :cond_57

    iget-boolean p0, p0, Lns8;->a:Z

    if-nez p0, :cond_60

    :cond_57
    iget-object p0, p1, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object p0

    invoke-interface {p0, v2}, Landroid/view/ViewParent;->requestDisallowInterceptTouchEvent(Z)V

    :cond_60
    invoke-virtual {v1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/high16 p1, 0x41800000    # 16.0f

    invoke-static {p0, p1}, Lz7h;->h(Landroid/content/Context;F)I

    move-result p0

    iput p0, p2, Lgs8;->b:I

    invoke-virtual {v4}, Llz3;->f()V

    return v2

    :cond_73
    const/4 p0, 0x0

    return p0
.end method

.method public M(Lcom/opera/android/favorites/e;Lhq8;)V
    .registers 8

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    invoke-virtual {p2}, Lhq8;->m()Z

    move-result v2

    iget-object v3, p0, Lns8;->l:Lskm;

    check-cast v3, Lx5f;

    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v4, Lc5f;

    iget-boolean p0, p0, Lns8;->n:Z

    invoke-direct {v4, v0, v1, v2, p0}, Lc5f;-><init>(JZZ)V

    invoke-virtual {v3, v4}, Lx5f;->T0(Lkotlin/jvm/functions/Function1;)V

    invoke-virtual {p1, p2}, Lcom/opera/android/favorites/e;->k(Lhq8;)V

    return-void
.end method

.method public final P(Lhq8;Llqm;)V
    .registers 13

    iget-object v0, p0, Lns8;->e:Landroidx/recyclerview/widget/RecyclerView;

    if-eqz v0, :cond_42

    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    invoke-virtual {p1}, Lhq8;->j()Z

    move-result v0

    const/4 v1, 0x1

    sget-object v2, Llqm;->h:Llqm;

    iget-object v3, p0, Lns8;->z:Lp6l;

    const/4 v4, 0x0

    if-eqz v0, :cond_55

    check-cast p1, Ltq8;

    iget-object v0, p1, Ltq8;->e:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v5

    const/4 v6, 0x0

    move v7, v4

    :cond_1d
    :goto_1d
    if-ge v7, v5, :cond_40

    invoke-virtual {v0, v7}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v8

    add-int/lit8 v7, v7, 0x1

    check-cast v8, Lhq8;

    invoke-virtual {v8}, Lhq8;->j()Z

    move-result v9

    if-nez v9, :cond_1d

    if-nez v6, :cond_38

    invoke-virtual {v8, v3}, Lhq8;->i(Lp6l;)Ljava/lang/String;

    move-result-object v6

    invoke-static {v6, p2, v4}, Lay3;->a(Ljava/lang/String;Llqm;Z)Lvx3;

    move-result-object v6

    goto :goto_1d

    :cond_38
    invoke-virtual {v8, v3}, Lhq8;->i(Lp6l;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v6, v8, v4}, Lvx3;->b(Ljava/lang/String;Z)V

    goto :goto_1d

    :cond_40
    if-nez v6, :cond_43

    :cond_42
    return-void

    :cond_43
    invoke-virtual {p1}, Lhq8;->h()Ljava/lang/String;

    move-result-object p1

    new-instance v0, Lv4l;

    invoke-direct {v0, p1, v4, v4}, Lv4l;-><init>(Ljava/lang/String;ZZ)V

    iput-object v0, v6, Lvx3;->i:Lv4l;

    if-ne p2, v2, :cond_51

    move v1, v4

    :cond_51
    invoke-virtual {p0, v6, v1}, Lns8;->J(Lvx3;Z)V

    return-void

    :cond_55
    invoke-virtual {p1, v3}, Lhq8;->i(Lp6l;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1, p2, v4}, Lay3;->a(Ljava/lang/String;Llqm;Z)Lvx3;

    move-result-object p1

    if-ne p2, v2, :cond_60

    move v1, v4

    :cond_60
    invoke-virtual {p0, p1, v1}, Lns8;->J(Lvx3;Z)V

    return-void
.end method

.method public final Q(Lhq8;)V
    .registers 2

    return-void
.end method

.method public T()V
    .registers 4

    iget-object v0, p0, Lns8;->x:Ltlg;

    if-eqz v0, :cond_1a

    iget-object v1, p0, Lns8;->c:Ls9i;

    invoke-virtual {v1}, Ls9i;->i0()Z

    move-result v1

    if-eqz v1, :cond_1a

    iget-object v1, v0, Ltlg;->h:Lkze;

    iget-object v2, p0, Lns8;->v:Lzr8;

    invoke-virtual {v1, v2}, Lekc;->p(Lf7f;)V

    iget-object v0, v0, Ltlg;->i:Lkze;

    iget-object p0, p0, Lns8;->w:Lzr8;

    invoke-virtual {v0, p0}, Lekc;->p(Lf7f;)V

    :cond_1a
    return-void
.end method

.method public final U()V
    .registers 4

    iget-object v0, p0, Lns8;->q:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_10

    iget-object v0, p0, Lns8;->r:Lbn7;

    if-nez v0, :cond_10

    iget-object v0, p0, Lns8;->e:Landroidx/recyclerview/widget/RecyclerView;

    if-nez v0, :cond_11

    :cond_10
    return-void

    :cond_11
    new-instance v1, Lbn7;

    const/16 v2, 0x15

    invoke-direct {v1, p0, v2}, Lbn7;-><init>(Ljava/lang/Object;B)V

    iput-object v1, p0, Lns8;->r:Lbn7;

    invoke-virtual {v0, v1}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method public final V(Ltta;)V
    .registers 3

    iget-object v0, p0, Lns8;->g:Ltta;

    invoke-virtual {v0, p1}, Ltta;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_9

    return-void

    :cond_9
    iput-object p1, p0, Lns8;->g:Ltta;

    return-void
.end method

.method public W()V
    .registers 4

    iget-object v0, p0, Lns8;->x:Ltlg;

    if-eqz v0, :cond_1a

    iget-object v1, p0, Lns8;->c:Ls9i;

    invoke-virtual {v1}, Ls9i;->i0()Z

    move-result v1

    if-eqz v1, :cond_1a

    iget-object v1, v0, Ltlg;->h:Lkze;

    iget-object v2, p0, Lns8;->v:Lzr8;

    invoke-virtual {v1, v2}, Lekc;->k(Lf7f;)V

    iget-object v0, v0, Ltlg;->i:Lkze;

    iget-object p0, p0, Lns8;->w:Lzr8;

    invoke-virtual {v0, p0}, Lekc;->k(Lf7f;)V

    :cond_1a
    return-void
.end method

.method public final X(Lvr8;)V
    .registers 4

    iget-object v0, p0, Lns8;->h:Lvr8;

    invoke-virtual {v0, p1}, Lvr8;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2f

    iput-object p1, p0, Lns8;->h:Lvr8;

    iget-object p1, p0, Lns8;->e:Landroidx/recyclerview/widget/RecyclerView;

    if-eqz p1, :cond_2f

    const/4 p1, 0x0

    :goto_f
    iget-object v0, p0, Lns8;->e:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v0

    if-ge p1, v0, :cond_2f

    iget-object v0, p0, Lns8;->e:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v0, p1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->T(Landroid/view/View;)Landroidx/recyclerview/widget/i;

    move-result-object v0

    check-cast v0, Les8;

    if-eqz v0, :cond_2c

    iget-object v1, p0, Lns8;->h:Lvr8;

    iget-object v0, v0, Les8;->b:Lfr8;

    invoke-virtual {v0, v1}, Lfr8;->p(Lvr8;)V

    :cond_2c
    add-int/lit8 p1, p1, 0x1

    goto :goto_f

    :cond_2f
    return-void
.end method

.method public final Y(Ltq8;Z)V
    .registers 22

    move-object/from16 v0, p0

    iget-object v1, v0, Lns8;->e:Landroidx/recyclerview/widget/RecyclerView;

    if-nez v1, :cond_7

    return-void

    :cond_7
    new-instance v3, Li3j;

    move-object/from16 v5, p1

    invoke-direct {v3, v1, v0, v5}, Li3j;-><init>(Landroidx/recyclerview/widget/RecyclerView;Lns8;Lhq8;)V

    iget-object v1, v0, Lns8;->f:Lr9i;

    iget-object v12, v0, Lns8;->b:Lqr8;

    iget-object v2, v12, Lqr8;->e:Lwv1;

    iget-object v2, v2, Lwv1;->b:Lb6h;

    invoke-interface {v2}, Lvtb;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/opera/android/settings/SettingsManager;

    iget-object v4, v12, Lqr8;->c:Lwv1;

    iget-object v4, v4, Lwv1;->b:Lb6h;

    invoke-interface {v4}, Lvtb;->get()Ljava/lang/Object;

    move-result-object v4

    move-object v10, v4

    check-cast v10, Lorm;

    iget-object v4, v12, Lqr8;->d:Lwv1;

    iget-object v4, v4, Lwv1;->b:Lb6h;

    invoke-interface {v4}, Lvtb;->get()Ljava/lang/Object;

    move-result-object v4

    move-object v6, v4

    check-cast v6, Lskm;

    iget-object v4, v12, Lqr8;->f:Lwv1;

    iget-object v4, v4, Lwv1;->b:Lb6h;

    invoke-interface {v4}, Lvtb;->get()Ljava/lang/Object;

    move-result-object v4

    move-object v11, v4

    check-cast v11, Lmdh;

    iget-object v4, v12, Lqr8;->g:Lwv1;

    iget-object v4, v4, Lwv1;->b:Lb6h;

    invoke-interface {v4}, Lvtb;->get()Ljava/lang/Object;

    move-result-object v4

    move-object v7, v4

    check-cast v7, Lqdh;

    iget-object v4, v12, Lqr8;->h:Lcom/opera/android/Lazy;

    invoke-virtual {v4}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v4

    move-object v13, v4

    check-cast v13, Lnv2;

    iget-object v14, v12, Lqr8;->j:Ltlg;

    iget-object v4, v12, Lqr8;->k:Lwv1;

    iget-object v4, v4, Lwv1;->b:Lb6h;

    invoke-interface {v4}, Lvtb;->get()Ljava/lang/Object;

    move-result-object v4

    move-object v15, v4

    check-cast v15, Lzzj;

    iget-object v4, v12, Lqr8;->l:Lwt3;

    invoke-virtual {v4}, Lwt3;->get()Ljava/lang/Object;

    move-result-object v4

    move-object/from16 v17, v4

    check-cast v17, Ljvj;

    new-instance v4, Lx77;

    const/16 v9, 0xa

    const/4 v8, 0x0

    invoke-direct/range {v4 .. v9}, Lx77;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;ZB)V

    move-object/from16 v18, v4

    new-instance v4, Lvq8;

    move-object v8, v10

    move-object v10, v11

    move-object v11, v7

    iget-boolean v7, v0, Lns8;->d:Z

    iget-object v0, v0, Lns8;->z:Lp6l;

    move-object/from16 v16, v0

    move-object v9, v6

    move-object v6, v2

    invoke-direct/range {v4 .. v16}, Lvq8;-><init>(Ltq8;Lcom/opera/android/settings/SettingsManager;ZLorm;Lskm;Lmdh;Lqdh;Lqr8;Lnv2;Ltlg;Lzzj;Lp6l;)V

    move v0, v7

    new-instance v2, Lar8;

    move-object v6, v4

    move-object/from16 v8, v17

    move-object/from16 v7, v18

    move-object v4, v1

    invoke-direct/range {v2 .. v8}, Lar8;-><init>(Li3j;Lr9i;Ltq8;Lvq8;Lx77;Ljvj;)V

    new-instance v1, Landroid/os/Bundle;

    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    const-string v3, "editable"

    invoke-virtual {v1, v3, v0}, Landroid/os/BaseBundle;->putBoolean(Ljava/lang/String;Z)V

    const-string v0, "focus"

    move/from16 v3, p2

    invoke-virtual {v1, v0, v3}, Landroid/os/BaseBundle;->putBoolean(Ljava/lang/String;Z)V

    invoke-virtual {v2, v1}, Landroidx/fragment/app/Fragment;->setArguments(Landroid/os/Bundle;)V

    const/4 v0, 0x0

    invoke-static {v2, v0}, Lzhj;->a(Lryl;I)Lzhj;

    move-result-object v0

    iget-object v1, v12, Lqr8;->a:Lcom/opera/android/BrowserActivity;

    invoke-virtual {v0, v1}, Lzhj;->c(Landroid/content/Context;)V

    return-void
.end method

.method public final Z(Lpzj;Z)V
    .registers 11

    iget-object v0, p0, Lns8;->c:Ls9i;

    iget-object v1, v0, Ls9i;->c:Ljava/lang/Object;

    check-cast v1, Ljava/util/ArrayList;

    iget-object v2, v0, Ls9i;->c:Ljava/lang/Object;

    check-cast v2, Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v3

    const/4 v4, 0x0

    move v5, v4

    :goto_10
    if-ge v5, v3, :cond_22

    invoke-virtual {v1, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    add-int/lit8 v5, v5, 0x1

    check-cast v6, Lgyj;

    iget-object v7, v6, Lgyj;->b:Lcom/opera/android/settings/SettingsManager;

    iget-object v6, v6, Lgyj;->d:Lezg;

    invoke-virtual {v7, v6}, Lcom/opera/android/settings/SettingsManager;->T(Lp5j;)V

    goto :goto_10

    :cond_22
    sget-object v1, Lpzj;->a:Lpzj;

    if-ne p1, v1, :cond_2a

    const p1, 0x7f0a0424

    goto :goto_2d

    :cond_2a
    const p1, 0x7f0a0425

    :goto_2d
    invoke-virtual {v0}, Ls9i;->i0()Z

    move-result v1

    if-eqz v1, :cond_5a

    invoke-virtual {v2}, Ljava/util/ArrayList;->clear()V

    if-eqz p2, :cond_49

    new-instance p2, Lgyj;

    new-instance v1, Ldg7;

    const/16 v3, 0xd

    invoke-direct {v1, v0, v3}, Ldg7;-><init>(Ljava/lang/Object;B)V

    iget-object p0, p0, Lns8;->m:Lcom/opera/android/settings/SettingsManager;

    invoke-direct {p2, p1, p0, v1}, Lgyj;-><init>(ILcom/opera/android/settings/SettingsManager;Ldg7;)V

    invoke-virtual {v2, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_49
    invoke-interface {v2}, Ljava/util/Collection;->stream()Ljava/util/stream/Stream;

    move-result-object p0

    new-instance p1, Lnn;

    const/4 p2, 0x6

    invoke-direct {p1, p2}, Lnn;-><init>(B)V

    invoke-interface {p0, p1}, Ljava/util/stream/Stream;->anyMatch(Ljava/util/function/Predicate;)Z

    move-result p0

    invoke-virtual {v0, p0}, Ls9i;->k0(Z)V

    :cond_5a
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result p0

    :goto_5e
    if-ge v4, p0, :cond_70

    invoke-virtual {v2, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    add-int/lit8 v4, v4, 0x1

    check-cast p1, Lgyj;

    iget-object p2, p1, Lgyj;->b:Lcom/opera/android/settings/SettingsManager;

    iget-object p1, p1, Lgyj;->d:Lezg;

    invoke-virtual {p2, p1}, Lcom/opera/android/settings/SettingsManager;->a(Lp5j;)V

    goto :goto_5e

    :cond_70
    return-void
.end method

.method public final c(Landroidx/recyclerview/widget/i;)V
    .registers 7

    iget-object v0, p1, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    iget-object v1, p0, Lns8;->j:Lflb;

    iget-boolean v1, v1, Lflb;->d:Z

    sget-object v2, Llf1;->b:Landroid/view/animation/AccelerateInterpolator;

    if-eqz v1, :cond_d

    const-wide/16 v3, 0x0

    goto :goto_f

    :cond_d
    const-wide/16 v3, 0x64

    :goto_f
    const v1, 0x3f8f5c29    # 1.12f

    invoke-static {v0, v2, v3, v4, v1}, Lw7d;->d(Landroid/view/View;Landroid/view/animation/BaseInterpolator;JF)V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lns8;->a:Z

    iget-object v0, p0, Lns8;->c:Ls9i;

    iget-object v1, v0, Ls9i;->e:Ljava/lang/Object;

    check-cast v1, Lns8;

    iget-object v2, v0, Ls9i;->b:Ljava/lang/Object;

    check-cast v2, Ltq8;

    iget-object v2, v2, Ltq8;->e:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    iget-object v0, v0, Ls9i;->d:Ljava/lang/Object;

    check-cast v0, Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    invoke-virtual {v1, v2, v0}, Landroidx/recyclerview/widget/d;->notifyItemRangeChanged(II)V

    iget-object p0, p0, Lns8;->k:Lh7f;

    invoke-static {p0, p0}, Lam2;->h(Lh7f;Lh7f;)Lg7f;

    move-result-object p0

    :goto_39
    invoke-virtual {p0}, Lg7f;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_49

    invoke-virtual {p0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lsj7;

    invoke-interface {v0, p1}, Lsj7;->c(Landroidx/recyclerview/widget/i;)V

    goto :goto_39

    :cond_49
    return-void
.end method

.method public final getItemCount()I
    .registers 2

    iget-object p0, p0, Lns8;->c:Ls9i;

    iget-object v0, p0, Ls9i;->b:Ljava/lang/Object;

    check-cast v0, Ltq8;

    iget-object v0, v0, Ltq8;->e:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    iget-object p0, p0, Ls9i;->d:Ljava/lang/Object;

    check-cast p0, Ljava/util/ArrayList;

    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result p0

    add-int/2addr p0, v0

    return p0
.end method

.method public final getItemId(I)J
    .registers 4

    iget-object p0, p0, Lns8;->c:Ls9i;

    iget-object v0, p0, Ls9i;->b:Ljava/lang/Object;

    check-cast v0, Ltq8;

    iget-object v1, v0, Ltq8;->e:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-lt p1, v1, :cond_14

    invoke-virtual {p0, p1}, Ls9i;->R(I)I

    move-result p0

    int-to-long p0, p0

    return-wide p0

    :cond_14
    invoke-virtual {v0, p1}, Ltq8;->u(I)Lhq8;

    move-result-object p0

    invoke-virtual {p0}, Lhq8;->e()J

    move-result-wide p0

    return-wide p0
.end method

.method public final getItemViewType(I)I
    .registers 2

    iget-object p0, p0, Lns8;->c:Ls9i;

    invoke-virtual {p0, p1}, Ls9i;->R(I)I

    move-result p0

    return p0
.end method

.method public final o(Landroidx/recyclerview/widget/i;)V
    .registers 7

    iget-object v0, p1, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    sget-object v1, Llf1;->a:Landroid/view/animation/AccelerateDecelerateInterpolator;

    const-wide/16 v2, 0x96

    const/high16 v4, 0x3f800000    # 1.0f

    invoke-static {v0, v1, v2, v3, v4}, Lw7d;->d(Landroid/view/View;Landroid/view/animation/BaseInterpolator;JF)V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lns8;->a:Z

    iget-object v0, p0, Lns8;->c:Ls9i;

    iget-object v1, v0, Ls9i;->e:Ljava/lang/Object;

    check-cast v1, Lns8;

    iget-object v2, v0, Ls9i;->b:Ljava/lang/Object;

    check-cast v2, Ltq8;

    iget-object v2, v2, Ltq8;->e:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    iget-object v0, v0, Ls9i;->d:Ljava/lang/Object;

    check-cast v0, Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    invoke-virtual {v1, v2, v0}, Landroidx/recyclerview/widget/d;->notifyItemRangeChanged(II)V

    iget-object p0, p0, Lns8;->k:Lh7f;

    invoke-static {p0, p0}, Lam2;->h(Lh7f;Lh7f;)Lg7f;

    move-result-object p0

    :goto_2f
    invoke-virtual {p0}, Lg7f;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_3f

    invoke-virtual {p0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lsj7;

    invoke-interface {v0, p1}, Lsj7;->o(Landroidx/recyclerview/widget/i;)V

    goto :goto_2f

    :cond_3f
    return-void
.end method

.method public final onAttachedToRecyclerView(Landroidx/recyclerview/widget/RecyclerView;)V
    .registers 8

    invoke-super {p0, p1}, Landroidx/recyclerview/widget/d;->onAttachedToRecyclerView(Landroidx/recyclerview/widget/RecyclerView;)V

    iput-object p1, p0, Lns8;->e:Landroidx/recyclerview/widget/RecyclerView;

    iget-object v0, p0, Lns8;->c:Ls9i;

    iget-object v1, v0, Ls9i;->c:Ljava/lang/Object;

    check-cast v1, Ljava/util/ArrayList;

    iget-object v0, v0, Ls9i;->b:Ljava/lang/Object;

    check-cast v0, Ltq8;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v2

    const/4 v3, 0x0

    :goto_14
    if-ge v3, v2, :cond_26

    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    add-int/lit8 v3, v3, 0x1

    check-cast v4, Lgyj;

    iget-object v5, v4, Lgyj;->b:Lcom/opera/android/settings/SettingsManager;

    iget-object v4, v4, Lgyj;->d:Lezg;

    invoke-virtual {v5, v4}, Lcom/opera/android/settings/SettingsManager;->a(Lp5j;)V

    goto :goto_14

    :cond_26
    invoke-virtual {v0, p0}, Ltq8;->t(Lsq8;)V

    invoke-virtual {v0, p0}, Lhq8;->b(Lgq8;)V

    invoke-virtual {p0}, Lns8;->W()V

    iget-object p0, p0, Lns8;->j:Lflb;

    if-eqz p0, :cond_36

    invoke-virtual {p0, p1}, Lflb;->e(Landroidx/recyclerview/widget/RecyclerView;)V

    :cond_36
    return-void
.end method

.method public final onBindViewHolder(Landroidx/recyclerview/widget/i;I)V
    .registers 8

    check-cast p1, Les8;

    iget-boolean v0, p0, Lns8;->t:Z

    if-eqz v0, :cond_d

    iget-object v0, p0, Lns8;->q:Ljava/util/HashMap;

    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual {v0, p1, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_d
    iget-object v0, p0, Lns8;->h:Lvr8;

    iput-object p0, p1, Les8;->d:Lns8;

    iget-object v1, p1, Les8;->b:Lfr8;

    invoke-virtual {v1, v0}, Lfr8;->p(Lvr8;)V

    const/4 v0, 0x0

    iput-boolean v0, v1, Lfr8;->m:Z

    iget-object v2, p1, Les8;->c:Lds8;

    const-wide/16 v3, 0x2710

    invoke-static {v2, v3, v4}, Lvml;->d(Ljava/lang/Runnable;J)V

    new-instance v2, Lds8;

    invoke-direct {v2, p1, v0}, Lds8;-><init>(Les8;B)V

    iget-boolean v3, v1, Lfr8;->m:Z

    if-eqz v3, :cond_2d

    invoke-virtual {v2}, Lds8;->run()V

    goto :goto_2f

    :cond_2d
    iput-object v2, v1, Lfr8;->n:Lds8;

    :goto_2f
    instance-of v1, p1, Lfs8;

    if-eqz v1, :cond_44

    move-object v0, p1

    check-cast v0, Lfs8;

    iget-object v1, p0, Lns8;->c:Ls9i;

    iget-object v1, v1, Ls9i;->b:Ljava/lang/Object;

    check-cast v1, Ltq8;

    invoke-virtual {v1, p2}, Ltq8;->u(I)Lhq8;

    move-result-object p2

    invoke-virtual {v0, p2}, Lfs8;->Z(Lhq8;)V

    goto :goto_5c

    :cond_44
    instance-of p2, p1, Lms8;

    if-eqz p2, :cond_59

    move-object p2, p1

    check-cast p2, Lms8;

    iget-boolean v1, p0, Lns8;->a:Z

    iget-object p2, p2, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    if-eqz v1, :cond_52

    const/4 v0, 0x4

    :cond_52
    invoke-virtual {p2, v0}, Landroid/view/View;->setVisibility(I)V

    invoke-virtual {p1}, Les8;->X()V

    goto :goto_5c

    :cond_59
    invoke-virtual {p1}, Les8;->X()V

    :goto_5c
    iget-boolean p0, p0, Lns8;->t:Z

    if-nez p0, :cond_63

    invoke-virtual {p1}, Les8;->V()V

    :cond_63
    return-void
.end method

.method public final onCreateViewHolder(Landroid/view/ViewGroup;I)Landroidx/recyclerview/widget/i;
    .registers 7

    const v0, 0x7f0a0423

    iget-object v1, p0, Lns8;->y:Lzzj;

    if-ne p2, v0, :cond_1a

    new-instance p2, Lls8;

    new-instance v0, Ler8;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    iget-object v2, p0, Lns8;->g:Ltta;

    iget-object p0, p0, Lns8;->h:Lvr8;

    invoke-direct {v0, p1, v2, p0, v1}, Ler8;-><init>(Landroid/content/Context;Ltta;Lvr8;Lzzj;)V

    invoke-direct {p2, v0}, Lls8;-><init>(Ler8;)V

    return-object p2

    :cond_1a
    const v0, 0x7f0a0421

    if-ne p2, v0, :cond_32

    new-instance p2, Lis8;

    new-instance v0, Lcr8;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    iget-object v2, p0, Lns8;->g:Ltta;

    iget-object p0, p0, Lns8;->h:Lvr8;

    invoke-direct {v0, p1, v2, p0, v1}, Lcr8;-><init>(Landroid/content/Context;Ltta;Lvr8;Lzzj;)V

    invoke-direct {p2, v0}, Lis8;-><init>(Lcr8;)V

    return-object p2

    :cond_32
    const v0, 0x7f0a0425

    const v1, 0x7f0a0424

    const/4 v2, 0x0

    if-eq p2, v0, :cond_70

    if-eq p2, v1, :cond_70

    const v0, 0x7f0a0428

    if-ne p2, v0, :cond_55

    new-instance p2, Lls8;

    new-instance v0, Lznk;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    iget-object v1, p0, Lns8;->g:Ltta;

    iget-object p0, p0, Lns8;->h:Lvr8;

    invoke-direct {v0, p1, v1, p0}, Lznk;-><init>(Landroid/content/Context;Ltta;Lvr8;)V

    invoke-direct {p2, v0}, Lls8;-><init>(Ler8;)V

    return-object p2

    :cond_55
    const v0, 0x7f0a0427

    if-ne p2, v0, :cond_6f

    new-instance p2, Lls8;

    new-instance v0, Lrch;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    iget-object v1, p0, Lns8;->g:Ltta;

    iget-object v2, p0, Lns8;->h:Lvr8;

    iget-object p0, p0, Lns8;->l:Lskm;

    invoke-direct {v0, p1, p0, v1, v2}, Lrch;-><init>(Landroid/content/Context;Lskm;Ltta;Lvr8;)V

    invoke-direct {p2, v0}, Lls8;-><init>(Ler8;)V

    return-object p2

    :cond_6f
    return-object v2

    :cond_70
    if-ne p2, v1, :cond_75

    sget-object v0, Lpzj;->a:Lpzj;

    goto :goto_77

    :cond_75
    sget-object v0, Lpzj;->b:Lpzj;

    :goto_77
    invoke-virtual {v0}, Ljava/lang/Enum;->ordinal()I

    move-result v0

    if-eqz v0, :cond_9b

    const/4 v1, 0x1

    if-ne v0, v1, :cond_95

    new-instance v0, Ljx;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    new-instance v1, Llf5;

    const/16 v2, 0xa

    invoke-direct {v1, v2}, Llf5;-><init>(B)V

    iget-object v2, p0, Lns8;->g:Ltta;

    iget-object v3, p0, Lns8;->h:Lvr8;

    invoke-direct {v0, p1, v1, v2, v3}, Ljx;-><init>(Landroid/content/Context;Llf5;Ltta;Lvr8;)V

    goto :goto_a8

    :cond_95
    new-instance p0, Ljava/lang/RuntimeException;

    invoke-direct {p0, v2, v2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw p0

    :cond_9b
    new-instance v0, Ldr8;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    iget-object v1, p0, Lns8;->g:Ltta;

    iget-object v2, p0, Lns8;->h:Lvr8;

    invoke-direct {v0, p1, v1, v2}, Ldr8;-><init>(Landroid/content/Context;Ltta;Lvr8;)V

    :goto_a8
    new-instance p1, Lms8;

    iget-object p0, p0, Lns8;->b:Lqr8;

    invoke-direct {p1, p2, v0, p0}, Lms8;-><init>(ILfr8;Lpr8;)V

    return-object p1
.end method

.method public final onDetachedFromRecyclerView(Landroidx/recyclerview/widget/RecyclerView;)V
    .registers 8

    invoke-super {p0, p1}, Landroidx/recyclerview/widget/d;->onDetachedFromRecyclerView(Landroidx/recyclerview/widget/RecyclerView;)V

    const/4 p1, 0x0

    iput-object p1, p0, Lns8;->e:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {p0}, Lns8;->T()V

    iget-object v0, p0, Lns8;->c:Ls9i;

    iget-object v1, v0, Ls9i;->c:Ljava/lang/Object;

    check-cast v1, Ljava/util/ArrayList;

    iget-object v0, v0, Ls9i;->b:Ljava/lang/Object;

    check-cast v0, Ltq8;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v2

    const/4 v3, 0x0

    :goto_18
    if-ge v3, v2, :cond_2a

    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    add-int/lit8 v3, v3, 0x1

    check-cast v4, Lgyj;

    iget-object v5, v4, Lgyj;->b:Lcom/opera/android/settings/SettingsManager;

    iget-object v4, v4, Lgyj;->d:Lezg;

    invoke-virtual {v5, v4}, Lcom/opera/android/settings/SettingsManager;->T(Lp5j;)V

    goto :goto_18

    :cond_2a
    invoke-virtual {v0, p0}, Ltq8;->B(Lsq8;)V

    invoke-virtual {v0, p0}, Lhq8;->o(Lgq8;)V

    iget-object p0, p0, Lns8;->j:Lflb;

    if-eqz p0, :cond_37

    invoke-virtual {p0, p1}, Lflb;->e(Landroidx/recyclerview/widget/RecyclerView;)V

    :cond_37
    return-void
.end method

.method public final onFailedToRecycleView(Landroidx/recyclerview/widget/i;)Z
    .registers 2

    check-cast p1, Les8;

    iget-object p0, p1, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {p0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object p0

    invoke-virtual {p0}, Landroid/view/ViewPropertyAnimator;->cancel()V

    const/4 p0, 0x1

    return p0
.end method

.method public final onViewAttachedToWindow(Landroidx/recyclerview/widget/i;)V
    .registers 7

    check-cast p1, Les8;

    invoke-super {p0, p1}, Landroidx/recyclerview/widget/d;->onViewAttachedToWindow(Landroidx/recyclerview/widget/i;)V

    iget-object v0, p0, Lns8;->j:Lflb;

    if-eqz v0, :cond_45

    instance-of v1, p1, Lfs8;

    if-eqz v1, :cond_45

    move-object v1, p1

    check-cast v1, Lfs8;

    iget-object p0, p0, Lns8;->i:Lvi7;

    if-nez p0, :cond_16

    const/4 p0, 0x0

    goto :goto_1a

    :cond_16
    iget-object p0, p0, Lvi7;->i:Landroidx/recyclerview/widget/i;

    check-cast p0, Lfs8;

    :goto_1a
    if-eqz p0, :cond_45

    iget-object p0, p0, Lfs8;->f:Lhq8;

    if-eqz p0, :cond_45

    iget-object v1, v1, Lfs8;->f:Lhq8;

    invoke-virtual {p0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_45

    iget p0, v0, Lflb;->l:F

    iget v1, v0, Lflb;->e:F

    add-float/2addr p0, v1

    iget v2, v0, Lflb;->m:F

    iget v3, v0, Lflb;->f:F

    add-float/2addr v2, v3

    iget v4, v0, Lflb;->n:F

    sub-float/2addr v1, v4

    iget v4, v0, Lflb;->o:F

    sub-float/2addr v3, v4

    invoke-virtual {v0, p1}, Lflb;->s(Landroidx/recyclerview/widget/i;)V

    iput p0, v0, Lflb;->e:F

    iput v2, v0, Lflb;->f:F

    sub-float/2addr p0, v1

    iput p0, v0, Lflb;->n:F

    sub-float/2addr v2, v3

    iput v2, v0, Lflb;->o:F

    :cond_45
    return-void
.end method

.method public final onViewRecycled(Landroidx/recyclerview/widget/i;)V
    .registers 4

    check-cast p1, Les8;

    invoke-super {p0, p1}, Landroidx/recyclerview/widget/d;->onViewRecycled(Landroidx/recyclerview/widget/i;)V

    iget-object v0, p0, Lns8;->q:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    instance-of v0, p1, Lfs8;

    const/4 v1, 0x0

    if-eqz v0, :cond_15

    move-object v0, p1

    check-cast v0, Lfs8;

    invoke-virtual {v0, v1}, Lfs8;->Z(Lhq8;)V

    :cond_15
    iget-object v0, p1, Les8;->c:Lds8;

    invoke-static {v0}, Lvml;->a(Ljava/lang/Runnable;)V

    iput-object v1, p1, Les8;->d:Lns8;

    invoke-virtual {p0}, Lns8;->U()V

    return-void
.end method

.method public final r(ILhq8;)V
    .registers 4

    iget-object p1, p2, Lhq8;->b:Ltq8;

    iget-object v0, p0, Lns8;->c:Ls9i;

    iget-object v0, v0, Ls9i;->b:Ljava/lang/Object;

    check-cast v0, Ltq8;

    invoke-virtual {p1, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_1d

    invoke-virtual {p0, p2}, Lns8;->K(Lhq8;)I

    move-result p1

    if-ltz p1, :cond_1d

    invoke-virtual {p0}, Lns8;->getItemCount()I

    move-result p2

    if-ge p1, p2, :cond_1d

    invoke-virtual {p0, p1}, Landroidx/recyclerview/widget/d;->notifyItemChanged(I)V

    :cond_1d
    return-void
.end method

.method public final u(ILhq8;)V
    .registers 3

    invoke-virtual {p0, p2}, Lns8;->K(Lhq8;)I

    move-result p2

    invoke-virtual {p0, p1, p2}, Landroidx/recyclerview/widget/d;->notifyItemMoved(II)V

    return-void
.end method

.method public final w(Lhq8;)V
    .registers 2

    invoke-virtual {p0, p1}, Lns8;->K(Lhq8;)I

    move-result p1

    invoke-virtual {p0, p1}, Landroidx/recyclerview/widget/d;->notifyItemInserted(I)V

    return-void
.end method

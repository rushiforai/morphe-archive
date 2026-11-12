.class public final Lvdh;
.super Lv5k;
.source "SourceFile"

# interfaces
.implements Lzsh;
.implements Le5k;


# instance fields
.field public final d:Landroidx/recyclerview/widget/RecyclerView;

.field public final e:Lcom/opera/android/settings/SettingsManager;

.field public final f:Ltsd;

.field public final g:Lpde;

.field public final h:Lkze;

.field public final i:Lx5f;

.field public final j:Lx5f;

.field public final k:Lmdh;

.field public final l:Lqdh;

.field public final m:Landroid/view/View$OnLongClickListener;

.field public final n:Lcy;

.field public final o:Lqr8;

.field public final p:Lnv2;

.field public final q:Ltlg;

.field public final r:Lo4b;

.field public final s:Lkze;

.field public final t:Lagm;


# direct methods
.method public constructor <init>(Landroidx/recyclerview/widget/RecyclerView;Lcom/opera/android/settings/SettingsManager;Ltsd;Lpde;Lkze;Lx5f;Lx5f;Lmdh;Lqdh;Landroid/view/View$OnLongClickListener;Lcy;Lijc;Lqr8;Lnv2;Ltlg;Lpde;Lp6l;)V
    .registers 22

    sget-object v0, Le6k;->h:Le6k;

    const v1, 0x7f0d01ac

    const-class v2, Ludh;

    move-object/from16 v3, p12

    invoke-direct {p0, v2, v3, v0, v1}, Lv5k;-><init>(Ljava/lang/Class;Lijc;Le6k;I)V

    iput-object p1, p0, Lvdh;->d:Landroidx/recyclerview/widget/RecyclerView;

    iput-object p2, p0, Lvdh;->e:Lcom/opera/android/settings/SettingsManager;

    iput-object p3, p0, Lvdh;->f:Ltsd;

    iput-object p4, p0, Lvdh;->g:Lpde;

    iput-object p5, p0, Lvdh;->h:Lkze;

    iput-object p6, p0, Lvdh;->i:Lx5f;

    iput-object p7, p0, Lvdh;->j:Lx5f;

    iput-object p8, p0, Lvdh;->k:Lmdh;

    iput-object p9, p0, Lvdh;->l:Lqdh;

    iput-object p10, p0, Lvdh;->m:Landroid/view/View$OnLongClickListener;

    iput-object p11, p0, Lvdh;->n:Lcy;

    move-object/from16 p1, p13

    iput-object p1, p0, Lvdh;->o:Lqr8;

    move-object/from16 p1, p14

    iput-object p1, p0, Lvdh;->p:Lnv2;

    move-object/from16 p1, p15

    iput-object p1, p0, Lvdh;->q:Ltlg;

    new-instance p1, Lo4b;

    const/4 p2, 0x3

    invoke-direct {p1, p0, v0, p2}, Lo4b;-><init>(Lu5k;Le6k;B)V

    iput-object p1, p0, Lvdh;->r:Lo4b;

    new-instance p1, Lkze;

    sget-object p2, Lng;->a:Lng;

    invoke-direct {p1, p2}, Lekc;-><init>(Ljava/lang/Object;)V

    iput-object p1, p0, Lvdh;->s:Lkze;

    new-instance p2, Lagm;

    new-instance p4, Luef;

    const/4 p5, 0x4

    move-object/from16 p6, p16

    move-object/from16 p7, p17

    invoke-direct {p4, p0, p6, p7, p5}, Luef;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-direct {p2, p4}, Lagm;-><init>(Lkotlin/jvm/functions/Function0;)V

    iput-object p2, p0, Lvdh;->t:Lagm;

    iget-object p2, p8, Lmdh;->h:Lh42;

    new-instance p4, Ltdh;

    const/4 p5, 0x0

    invoke-direct {p4, p0, p5}, Ltdh;-><init>(Lvdh;B)V

    invoke-static {p2, p1, p4}, La26;->T(Lekc;Likc;Lf7f;)V

    new-instance p2, Ltdh;

    const/4 p4, 0x1

    invoke-direct {p2, p0, p4}, Ltdh;-><init>(Lvdh;B)V

    invoke-static {p3, p1, p2}, La26;->T(Lekc;Likc;Lf7f;)V

    return-void
.end method


# virtual methods
.method public final B(Landroid/view/ViewGroup;)Lab2;
    .registers 2

    iget-object p0, p0, Lvdh;->t:Lagm;

    invoke-virtual {p0}, Lagm;->r()Lab2;

    move-result-object p0

    return-object p0
.end method

.method public final c()V
    .registers 4

    iget-object p0, p0, Lvdh;->k:Lmdh;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/4 v0, 0x1

    const/4 v1, 0x2

    const/4 v2, 0x0

    invoke-static {p0, v0, v2, v2, v1}, Lmdh;->b(Lmdh;ZLiqi;Lkotlin/jvm/functions/Function1;I)V

    return-void
.end method

.method public final onDestroy()V
    .registers 3

    iget-object v0, p0, Lvdh;->n:Lcy;

    iget-object v0, v0, Lcy;->f:Ljava/lang/Object;

    check-cast v0, Llw7;

    iget-object v1, v0, Llw7;->b:Ltcc;

    if-eqz v1, :cond_d

    invoke-virtual {v1, v0}, Ltcc;->b(Lmdc;)V

    :cond_d
    const/4 v1, 0x0

    iput-object v1, v0, Llw7;->b:Ltcc;

    iget-object p0, p0, Lvdh;->s:Lkze;

    sget-object v0, Log;->a:Log;

    invoke-virtual {p0, v0}, Lekc;->r(Ljava/lang/Object;)V

    return-void
.end method

.method public final p(Z)V
    .registers 2

    if-nez p1, :cond_14

    iget-object p0, p0, Lvdh;->n:Lcy;

    iget-object p1, p0, Lcy;->d:Ljava/lang/Object;

    check-cast p1, Lxdh;

    invoke-virtual {p1}, Lo63;->i()V

    iget-object p0, p0, Lcy;->c:Ljava/lang/Object;

    check-cast p0, Lqdh;

    iget-object p0, p0, Lqdh;->c:Ljava/util/ArrayList;

    invoke-virtual {p0}, Ljava/util/ArrayList;->clear()V

    :cond_14
    return-void
.end method

.method public final t()Lja2;
    .registers 1

    new-instance p0, Ludh;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-object p0
.end method

.method public final u()Lk6k;
    .registers 1

    iget-object p0, p0, Lvdh;->r:Lo4b;

    return-object p0
.end method

.method public final z()Z
    .registers 2

    iget-object v0, p0, Lvdh;->f:Ltsd;

    invoke-virtual {v0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_22

    iget-object p0, p0, Lvdh;->k:Lmdh;

    iget-object p0, p0, Lmdh;->h:Lh42;

    invoke-virtual {p0}, Lekc;->g()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/util/Collection;

    if-eqz p0, :cond_22

    invoke-interface {p0}, Ljava/util/Collection;->isEmpty()Z

    move-result p0

    if-nez p0, :cond_22

    const/4 p0, 0x1

    return p0

    :cond_22
    const/4 p0, 0x0

    return p0
.end method

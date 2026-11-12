.class public final Lcok;
.super Lv5k;
.source "SourceFile"

# interfaces
.implements Lzsh;
.implements Le5k;
.implements Lw25;
.implements Lp5j;
.implements Lmo7;


# instance fields
.field public final d:Lf35;

.field public final e:Lcom/opera/android/settings/SettingsManager;

.field public final f:Lnr8;

.field public final g:Lipk;

.field public final h:Lxnh;

.field public final i:Lcom/opera/android/feed/FeedScrollView;

.field public final j:Lx5f;

.field public final k:Lx5f;

.field public final l:Losf;

.field public final m:Lkze;

.field public final n:Landroid/view/View$OnLongClickListener;

.field public final o:Lqr8;

.field public final p:Lnv2;

.field public final q:Lo4b;

.field public final r:Lvpk;

.field public final s:Lagm;


# direct methods
.method public constructor <init>(Landroidx/recyclerview/widget/RecyclerView;Lf35;Lcom/opera/android/settings/SettingsManager;Lnr8;Lipk;Lxnh;Lcom/opera/android/feed/FeedScrollView;Lx5f;Lx5f;Losf;Lkze;Landroid/view/View$OnLongClickListener;Lijc;Lqr8;Lnv2;Lbvl;Lpde;Lp6l;)V
    .registers 23

    sget-object v0, Le6k;->q:Le6k;

    const v1, 0x7f0d01af

    const-class v2, Laok;

    move-object/from16 v3, p13

    invoke-direct {p0, v2, v3, v0, v1}, Lv5k;-><init>(Ljava/lang/Class;Lijc;Le6k;I)V

    iput-object p2, p0, Lcok;->d:Lf35;

    iput-object p3, p0, Lcok;->e:Lcom/opera/android/settings/SettingsManager;

    iput-object p4, p0, Lcok;->f:Lnr8;

    iput-object p5, p0, Lcok;->g:Lipk;

    iput-object p6, p0, Lcok;->h:Lxnh;

    iput-object p7, p0, Lcok;->i:Lcom/opera/android/feed/FeedScrollView;

    iput-object p8, p0, Lcok;->j:Lx5f;

    iput-object p9, p0, Lcok;->k:Lx5f;

    iput-object p10, p0, Lcok;->l:Losf;

    iput-object p11, p0, Lcok;->m:Lkze;

    move-object/from16 p4, p12

    iput-object p4, p0, Lcok;->n:Landroid/view/View$OnLongClickListener;

    move-object/from16 p4, p14

    iput-object p4, p0, Lcok;->o:Lqr8;

    move-object/from16 p4, p15

    iput-object p4, p0, Lcok;->p:Lnv2;

    new-instance p4, Lo4b;

    const/16 p7, 0xd

    invoke-direct {p4, p0, v0, p7}, Lo4b;-><init>(Lu5k;Le6k;B)V

    iput-object p4, p0, Lcok;->q:Lo4b;

    new-instance p4, Lvpk;

    invoke-direct {p4, p5}, Lvpk;-><init>(Lipk;)V

    iput-object p4, p0, Lcok;->r:Lvpk;

    new-instance p4, Lagm;

    new-instance p7, Ln12;

    const/4 p5, 0x4

    move-object p9, p0

    move-object p8, p1

    move/from16 p13, p5

    move-object/from16 p10, p16

    move-object/from16 p11, p17

    move-object/from16 p12, p18

    invoke-direct/range {p7 .. p13}, Ln12;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-direct {p4, p7}, Lagm;-><init>(Lkotlin/jvm/functions/Function0;)V

    iput-object p4, p0, Lcok;->s:Lagm;

    iget-object p1, p2, Lf35;->a:Li7f;

    invoke-virtual {p1, p0}, Li7f;->b(Ljava/lang/Object;)Z

    invoke-virtual {p3, p0}, Lcom/opera/android/settings/SettingsManager;->a(Lp5j;)V

    invoke-virtual {p6, p0}, Lno7;->g(Lmo7;)V

    return-void
.end method


# virtual methods
.method public final B(Landroid/view/ViewGroup;)Lab2;
    .registers 2

    iget-object p0, p0, Lcok;->s:Lagm;

    invoke-virtual {p0}, Lagm;->r()Lab2;

    move-result-object p0

    return-object p0
.end method

.method public final M(Ljava/lang/String;)V
    .registers 3

    const-string v0, "enable_suggested_speed_dials_on_start_page"

    invoke-virtual {v0, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_b

    invoke-virtual {p0}, Lu5k;->A()V

    :cond_b
    return-void
.end method

.method public final P()V
    .registers 3

    iget-object p0, p0, Lcok;->r:Lvpk;

    iget v0, p0, Lvpk;->e:I

    const/4 v1, -0x1

    if-eq v0, v1, :cond_8

    return-void

    :cond_8
    const/4 v0, 0x2

    iput v0, p0, Lvpk;->e:I

    return-void
.end method

.method public final c()V
    .registers 4

    iget-object v0, p0, Lcok;->r:Lvpk;

    iget v1, v0, Lvpk;->e:I

    const/4 v2, -0x1

    if-ne v1, v2, :cond_a

    const/4 v1, 0x1

    iput v1, v0, Lvpk;->e:I

    :cond_a
    iget-object p0, p0, Lcok;->g:Lipk;

    iget-object p0, p0, Lipk;->b:Ljs6;

    invoke-virtual {p0}, Ljs6;->a()V

    return-void
.end method

.method public final onDestroy()V
    .registers 4

    iget-object v0, p0, Lcok;->r:Lvpk;

    iget-object v1, v0, Lvpk;->d:Lh42;

    invoke-virtual {v1, v0}, Lekc;->p(Lf7f;)V

    sget-object v1, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    const/4 v2, -0x1

    invoke-virtual {v0, v2, v1}, Lvpk;->b(ILjava/util/List;)V

    iget-object v0, p0, Lcok;->d:Lf35;

    iget-object v0, v0, Lf35;->a:Li7f;

    invoke-virtual {v0, p0}, Li7f;->c(Ljava/lang/Object;)Z

    iget-object v0, p0, Lcok;->e:Lcom/opera/android/settings/SettingsManager;

    invoke-virtual {v0, p0}, Lcom/opera/android/settings/SettingsManager;->T(Lp5j;)V

    iget-object v0, p0, Lcok;->h:Lxnh;

    invoke-virtual {v0, p0}, Lno7;->p(Lmo7;)V

    return-void
.end method

.method public final p(Z)V
    .registers 2

    if-eqz p1, :cond_7

    iget-object p0, p0, Lcok;->r:Lvpk;

    invoke-virtual {p0}, Lvpk;->a()V

    :cond_7
    return-void
.end method

.method public final t()Lja2;
    .registers 2

    new-instance v0, Laok;

    iget-object p0, p0, Lcok;->r:Lvpk;

    invoke-direct {v0, p0}, Laok;-><init>(Lvpk;)V

    return-object v0
.end method

.method public final u()Lk6k;
    .registers 1

    iget-object p0, p0, Lcok;->q:Lo4b;

    return-object p0
.end method

.method public final z()Z
    .registers 2

    iget-object v0, p0, Lcok;->e:Lcom/opera/android/settings/SettingsManager;

    iget-object p0, p0, Lcok;->h:Lxnh;

    invoke-virtual {v0, p0}, Lcom/opera/android/settings/SettingsManager;->A(Lxnh;)Z

    move-result p0

    return p0
.end method

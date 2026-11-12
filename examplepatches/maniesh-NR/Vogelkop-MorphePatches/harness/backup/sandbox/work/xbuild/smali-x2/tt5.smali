.class public final Ltt5;
.super Lz5k;
.source "SourceFile"

# interfaces
.implements Lju5;


# instance fields
.field public final f:Landroidx/recyclerview/widget/RecyclerView;

.field public final g:Lft3;

.field public final h:Lyu8;

.field public final i:Ls6h;

.field public final j:Lku5;

.field public final k:Ltsd;

.field public final l:Lkze;

.field public final m:Lqt5;

.field public final n:Lagm;

.field public o:Z


# direct methods
.method public constructor <init>(Lx5f;Lijc;Landroidx/recyclerview/widget/RecyclerView;Lft3;Lyu8;Ls6h;Lku5;Ltsd;Lkze;Ltsd;)V
    .registers 23

    move-object/from16 v8, p7

    sget-object v3, Le6k;->r:Le6k;

    const v4, 0x7f0d00da

    const/4 v5, 0x0

    const-class v1, Lst5;

    move-object v0, p0

    move-object v2, p2

    invoke-direct/range {v0 .. v5}, Lz5k;-><init>(Ljava/lang/Class;Lijc;Le6k;IB)V

    iput-object p3, p0, Ltt5;->f:Landroidx/recyclerview/widget/RecyclerView;

    move-object/from16 v1, p4

    iput-object v1, p0, Ltt5;->g:Lft3;

    move-object/from16 v1, p5

    iput-object v1, p0, Ltt5;->h:Lyu8;

    move-object/from16 v1, p6

    iput-object v1, p0, Ltt5;->i:Ls6h;

    iput-object v8, p0, Ltt5;->j:Lku5;

    move-object/from16 v1, p8

    iput-object v1, p0, Ltt5;->k:Ltsd;

    move-object/from16 v1, p9

    iput-object v1, p0, Ltt5;->l:Lkze;

    new-instance v9, Lqt5;

    new-instance v10, Lrt5;

    const/4 v1, 0x0

    invoke-direct {v10, p0, v1}, Lrt5;-><init>(Ltt5;B)V

    new-instance v11, Lrt5;

    const/4 v1, 0x1

    invoke-direct {v11, p0, v1}, Lrt5;-><init>(Ltt5;B)V

    new-instance v0, Ls2;

    const/4 v6, 0x0

    const/4 v7, 0x7

    const/4 v1, 0x2

    const-class v3, Ltt5;

    const-string v4, "showOfferMenu"

    const-string v5, "showOfferMenu(Landroid/view/View;Lcom/opera/android/continue_on_booking/Offer;)V"

    move-object v2, p0

    invoke-direct/range {v0 .. v7}, Ls2;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;IB)V

    move-object v1, v0

    invoke-direct {v9, v10, v11, v1}, Lqt5;-><init>(Lrt5;Lrt5;Ls2;)V

    iput-object v9, p0, Ltt5;->m:Lqt5;

    new-instance v1, Lagm;

    new-instance v2, Lhv;

    const/16 v3, 0xb

    move-object/from16 v5, p10

    invoke-direct {v2, p0, v5, p1, v3}, Lhv;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-direct {v1, v2}, Lagm;-><init>(Lkotlin/jvm/functions/Function0;)V

    iput-object v1, p0, Ltt5;->n:Lagm;

    iget-object v1, v8, Lku5;->e:Lh7f;

    invoke-virtual {v1, p0}, Lh7f;->b(Ljava/lang/Object;)Z

    iget-boolean v1, v8, Lku5;->g:Z

    invoke-virtual {p0, v1}, Ltt5;->e(Z)V

    return-void
.end method


# virtual methods
.method public final C()Lagm;
    .registers 1

    iget-object p0, p0, Ltt5;->n:Lagm;

    return-object p0
.end method

.method public final e(Z)V
    .registers 3

    iget-boolean v0, p0, Ltt5;->o:Z

    if-ne v0, p1, :cond_5

    return-void

    :cond_5
    iput-boolean p1, p0, Ltt5;->o:Z

    if-eqz p1, :cond_22

    iget-object p1, p0, Ltt5;->j:Lku5;

    iget-object v0, p1, Lku5;->f:Ljava/util/List;

    if-nez v0, :cond_15

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    goto :goto_1d

    :cond_15
    new-instance v0, Ljava/util/ArrayList;

    iget-object p1, p1, Lku5;->f:Ljava/util/List;

    invoke-direct {v0, p1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    move-object p1, v0

    :goto_1d
    iget-object v0, p0, Ltt5;->m:Lqt5;

    invoke-virtual {v0, p1}, Lqt5;->H(Ljava/util/ArrayList;)V

    :cond_22
    invoke-virtual {p0}, Lu5k;->A()V

    return-void
.end method

.method public final onDataChanged()V
    .registers 3

    iget-boolean v0, p0, Ltt5;->o:Z

    if-eqz v0, :cond_1d

    iget-object v0, p0, Ltt5;->j:Lku5;

    iget-object v1, v0, Lku5;->f:Ljava/util/List;

    if-nez v1, :cond_10

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    goto :goto_18

    :cond_10
    new-instance v1, Ljava/util/ArrayList;

    iget-object v0, v0, Lku5;->f:Ljava/util/List;

    invoke-direct {v1, v0}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    move-object v0, v1

    :goto_18
    iget-object p0, p0, Ltt5;->m:Lqt5;

    invoke-virtual {p0, v0}, Lqt5;->H(Ljava/util/ArrayList;)V

    :cond_1d
    return-void
.end method

.method public final onDestroy()V
    .registers 2

    iget-object v0, p0, Ltt5;->j:Lku5;

    iget-object v0, v0, Lku5;->e:Lh7f;

    invoke-virtual {v0, p0}, Lh7f;->c(Ljava/lang/Object;)Z

    return-void
.end method

.method public final t()Lja2;
    .registers 2

    new-instance p0, Lst5;

    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lia2;-><init>(B)V

    return-object p0
.end method

.method public final w()Z
    .registers 1

    iget-boolean p0, p0, Ltt5;->o:Z

    return p0
.end method

.method public final z()Z
    .registers 1

    iget-boolean p0, p0, Ltt5;->o:Z

    return p0
.end method

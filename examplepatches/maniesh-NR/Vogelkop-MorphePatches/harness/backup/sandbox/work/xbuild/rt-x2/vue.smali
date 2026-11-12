.class public final Lvue;
.super Liu8;
.source "SourceFile"

# interfaces
.implements Lfu8;
.implements Lylg;


# instance fields
.field public final h:Lqq6;

.field public final i:Lro9;

.field public final j:Lhu8;

.field public final k:Lx5f;

.field public final l:Lumi;

.field public final m:Lrl3;

.field public final n:Landroidx/fragment/app/w;

.field public final o:Lamg;

.field public final p:Lghf;

.field public final q:Lque;


# direct methods
.method public constructor <init>(Lcom/opera/android/BrowserActivity;Lxw8;Luqe;Lhu8;Lx5f;Lumi;Lrl3;Lqq6;)V
    .registers 17

    new-instance v4, Lp12;

    iget-object v6, p2, Lxw8;->g:Landroidx/recyclerview/widget/RecyclerView;

    iget-object v0, p2, Lxw8;->h:Low8;

    iget-object v1, p1, Lcom/opera/android/BrowserActivity;->l0:Lj4c;

    invoke-virtual {v1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lq82;

    iget-object v7, p2, Lxw8;->b:Lbwf;

    invoke-virtual {v7}, Lbwf;->a()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v4}, Ljava/lang/Object;-><init>()V

    iput-object v6, v4, Lp12;->a:Ljava/lang/Object;

    iput-object v0, v4, Lp12;->b:Ljava/lang/Object;

    iput-object v1, v4, Lp12;->c:Ljava/lang/Object;

    iput-object v2, v4, Lp12;->d:Ljava/lang/Object;

    new-instance v0, Ltsh;

    invoke-virtual {v6}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-direct {v0, v2}, Ltsh;-><init>(Landroid/content/Context;)V

    iput-object v0, v4, Lp12;->e:Ljava/lang/Object;

    iget-object v1, v1, Lq82;->a:Lh7f;

    invoke-virtual {v1, v0}, Lh7f;->b(Ljava/lang/Object;)Z

    new-instance v0, Llve;

    invoke-direct {v0, v4}, Llve;-><init>(Lp12;)V

    iput-object v0, v4, Lp12;->g:Ljava/lang/Object;

    iput-object p3, v4, Lp12;->h:Ljava/lang/Object;

    invoke-static {v0}, Lac8;->c(Ljava/lang/Object;)V

    iget-boolean v0, p2, Lxw8;->c:Z

    if-eqz v0, :cond_5f

    new-instance v0, Lx79;

    iget-object v1, p2, Lxw8;->h:Low8;

    invoke-virtual {v7}, Lbwf;->a()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    new-instance v3, Ljava/util/HashMap;

    invoke-direct {v3}, Ljava/util/HashMap;-><init>()V

    iput-object v3, v0, Lx79;->d:Ljava/lang/Object;

    iput-object v6, v0, Lx79;->a:Ljava/lang/Object;

    iput-object v1, v0, Lx79;->b:Ljava/lang/Object;

    iput-object v2, v0, Lx79;->c:Ljava/lang/Object;

    iput-object p3, v0, Lx79;->e:Ljava/lang/Object;

    :goto_59
    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v5, v0

    move-object v0, p0

    goto :goto_61

    :cond_5f
    const/4 v0, 0x0

    goto :goto_59

    :goto_61
    invoke-direct/range {v0 .. v5}, Liu8;-><init>(Lcom/opera/android/BrowserActivity;Lxw8;Luqe;Lp12;Lx79;)V

    new-instance p2, Lque;

    const/4 v1, 0x0

    invoke-direct {p2, p0, v1}, Lque;-><init>(Ljava/lang/Object;B)V

    iput-object p2, p0, Lvue;->q:Lque;

    invoke-virtual {v7}, Lbwf;->b()Ljava/lang/String;

    move-object/from16 v2, p8

    iput-object v2, p0, Lvue;->h:Lqq6;

    iget-object v2, v6, Landroidx/recyclerview/widget/RecyclerView;->c:Landroidx/recyclerview/widget/g;

    invoke-virtual {v2}, Landroidx/recyclerview/widget/g;->c()Lro9;

    move-result-object v2

    iput-object v2, p0, Lvue;->i:Lro9;

    iput-object p4, p0, Lvue;->j:Lhu8;

    iput-object p5, p0, Lvue;->k:Lx5f;

    iput-object p6, p0, Lvue;->l:Lumi;

    move-object p4, p7

    iput-object p4, p0, Lvue;->m:Lrl3;

    invoke-virtual {p1}, Landroidx/fragment/app/r;->getSupportFragmentManager()Landroidx/fragment/app/w;

    move-result-object p4

    iput-object p4, p0, Lvue;->n:Landroidx/fragment/app/w;

    invoke-virtual {p4, p2, v1}, Landroidx/fragment/app/w;->b0(Lx1p;Z)V

    invoke-static {p1}, Lxnh;->t(Landroid/content/Context;)Lxnh;

    new-instance p1, Lamg;

    invoke-direct {p1, p5, p3}, Lamg;-><init>(Lx5f;Luqe;)V

    iput-object p1, p0, Lvue;->o:Lamg;

    new-instance p1, Lghf;

    invoke-direct {p1, p5, p3}, Lghf;-><init>(Lx5f;Luqe;)V

    iput-object p1, p0, Lvue;->p:Lghf;

    return-void
.end method

.method public static t(Loqe;Z)I
    .registers 3

    instance-of v0, p0, Ljre;

    if-eqz v0, :cond_a

    if-eqz p1, :cond_40

    const p0, 0x7f0d0184

    return p0

    :cond_a
    instance-of v0, p0, Lure;

    if-eqz v0, :cond_14

    if-eqz p1, :cond_40

    const p0, 0x7f0d018a

    return p0

    :cond_14
    instance-of v0, p0, Ldre;

    if-eqz v0, :cond_22

    if-eqz p1, :cond_1e

    const p0, 0x7f0d0187

    return p0

    :cond_1e
    const p0, 0x7f0d0189

    return p0

    :cond_22
    instance-of v0, p0, Lrre;

    if-eqz v0, :cond_2c

    if-eqz p1, :cond_40

    const p0, 0x7f0d0185

    return p0

    :cond_2c
    instance-of p1, p0, Ld9i;

    if-eqz p1, :cond_34

    const p0, 0x7f0d018b

    return p0

    :cond_34
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p1

    const-class v0, Lmsh;

    invoke-virtual {p1, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_44

    :cond_40
    const p0, 0x7f0d0182

    return p0

    :cond_44
    instance-of p0, p0, Lfre;

    if-eqz p0, :cond_4c

    const p0, 0x7f0d01a2

    return p0

    :cond_4c
    const/4 p0, 0x0

    return p0
.end method


# virtual methods
.method public final k(Landroid/view/ViewGroup;I)Lab2;
    .registers 15

    const v0, 0x7f0d0182

    iget-object v8, p0, Lvue;->m:Lrl3;

    iget-object v4, p0, Lvue;->o:Lamg;

    iget-object v1, p0, Liu8;->c:Luqe;

    const/4 v9, 0x0

    iget-object v10, p0, Liu8;->g:Lp0c;

    if-ne p2, v0, :cond_21

    new-instance v11, Luue;

    invoke-static {p1, p2, v9}, Lha2;->M(Landroid/view/ViewGroup;II)Landroid/view/View;

    move-result-object v6

    new-instance v0, Lr9i;

    const/16 v5, 0x16

    move-object v3, p0

    move-object v2, p0

    invoke-direct/range {v0 .. v5}, Lr9i;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-direct {v11, v6, v0, v8, v10}, Luue;-><init>(Landroid/view/View;Lr9i;Lrl3;Lp0c;)V

    return-object v11

    :cond_21
    const v0, 0x7f0d0184

    if-ne p2, v0, :cond_39

    new-instance v0, Lsue;

    move-object v3, v1

    invoke-static {p1, p2, v9}, Lha2;->M(Landroid/view/ViewGroup;II)Landroid/view/View;

    move-result-object v1

    iget-object v5, p0, Lvue;->o:Lamg;

    iget-object v6, p0, Lvue;->m:Lrl3;

    move-object v4, p0

    move-object v2, v3

    move-object v7, v10

    move-object v3, p0

    invoke-direct/range {v0 .. v7}, Lsue;-><init>(Landroid/view/View;Luqe;Lvue;Lvue;Ldmg;Lrl3;Lp0c;)V

    return-object v0

    :cond_39
    const v0, 0x7f0d018a

    if-ne p2, v0, :cond_50

    new-instance v0, Lmve;

    const/4 v5, 0x1

    move-object v3, p0

    move-object v2, p0

    invoke-direct/range {v0 .. v5}, Lmve;-><init>(Luqe;Lfu8;Lylg;Ldmg;B)V

    new-instance v1, Lnve;

    invoke-static {p1, p2, v9}, Lha2;->M(Landroid/view/ViewGroup;II)Landroid/view/View;

    move-result-object v2

    invoke-direct {v1, v2, v0, v8, v10}, Lnve;-><init>(Landroid/view/View;Lmve;Lrl3;Lp0c;)V

    return-object v1

    :cond_50
    const v0, 0x7f0d0187

    if-ne p2, v0, :cond_67

    new-instance v0, Lmve;

    const/4 v5, 0x0

    move-object v3, p0

    move-object v2, p0

    invoke-direct/range {v0 .. v5}, Lmve;-><init>(Luqe;Lfu8;Lylg;Ldmg;B)V

    new-instance v1, Lnve;

    invoke-static {p1, p2, v9}, Lha2;->M(Landroid/view/ViewGroup;II)Landroid/view/View;

    move-result-object v2

    invoke-direct {v1, v2, v0, v8, v10}, Lnve;-><init>(Landroid/view/View;Lmve;Lrl3;Lp0c;)V

    return-object v1

    :cond_67
    const v0, 0x7f0d0189

    if-ne p2, v0, :cond_7e

    new-instance v11, Luue;

    invoke-static {p1, p2, v9}, Lha2;->M(Landroid/view/ViewGroup;II)Landroid/view/View;

    move-result-object v6

    new-instance v0, Lmve;

    const/4 v5, 0x0

    move-object v3, p0

    move-object v2, p0

    invoke-direct/range {v0 .. v5}, Lmve;-><init>(Luqe;Lfu8;Lylg;Ldmg;B)V

    invoke-direct {v11, v6, v0, v8, v10}, Luue;-><init>(Landroid/view/View;Lr9i;Lrl3;Lp0c;)V

    return-object v11

    :cond_7e
    const v0, 0x7f0d0185

    if-ne p2, v0, :cond_96

    new-instance v11, Ltue;

    invoke-static {p1, p2, v9}, Lha2;->M(Landroid/view/ViewGroup;II)Landroid/view/View;

    move-result-object v6

    new-instance v0, Lr9i;

    const/16 v5, 0x16

    move-object v3, p0

    move-object v2, p0

    invoke-direct/range {v0 .. v5}, Lr9i;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-direct {v11, v6, v0, v8, v10}, Luue;-><init>(Landroid/view/View;Lr9i;Lrl3;Lp0c;)V

    return-object v11

    :cond_96
    const v0, 0x7f0d018b

    const/4 v3, 0x0

    if-ne p2, v0, :cond_b0

    new-instance v8, Luue;

    invoke-static {p1, p2, v9}, Lha2;->M(Landroid/view/ViewGroup;II)Landroid/view/View;

    move-result-object v6

    new-instance v0, Lr9i;

    const/16 v5, 0x16

    move-object v2, p0

    invoke-direct/range {v0 .. v5}, Lr9i;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    iget-object v1, p0, Lvue;->l:Lumi;

    invoke-direct {v8, v6, v0, v10, v1}, Luue;-><init>(Landroid/view/View;Lr9i;Lp0c;Lumi;)V

    return-object v8

    :cond_b0
    const v0, 0x7f0d0191

    if-ne p2, v0, :cond_c7

    new-instance v0, Lcve;

    move-object v3, v1

    invoke-static {p1, p2, v9}, Lha2;->M(Landroid/view/ViewGroup;II)Landroid/view/View;

    move-result-object v1

    iget-object v4, p0, Lvue;->i:Lro9;

    iget-object v6, p0, Lvue;->o:Lamg;

    move-object v5, p0

    move-object v2, v4

    move-object v4, p0

    invoke-direct/range {v0 .. v6}, Lcve;-><init>(Landroid/view/View;Lro9;Luqe;Lvue;Lvue;Ldmg;)V

    return-object v0

    :cond_c7
    const v0, 0x7f0d018f

    if-ne p2, v0, :cond_df

    new-instance v0, Lkve;

    move-object v3, v1

    invoke-static {p1, p2, v9}, Lha2;->M(Landroid/view/ViewGroup;II)Landroid/view/View;

    move-result-object v1

    iget-object v6, p0, Lvue;->o:Lamg;

    iget-object v7, p0, Lvue;->k:Lx5f;

    iget-object v2, p0, Lvue;->i:Lro9;

    move-object v5, p0

    move-object v4, p0

    invoke-direct/range {v0 .. v7}, Lkve;-><init>(Landroid/view/View;Lro9;Luqe;Lvue;Lvue;Ldmg;Lx5f;)V

    return-object v0

    :cond_df
    const v0, 0x7f0d019b

    if-ne p2, v0, :cond_f6

    new-instance v0, Lgve;

    move-object v3, v1

    invoke-static {p1, p2, v9}, Lha2;->M(Landroid/view/ViewGroup;II)Landroid/view/View;

    move-result-object v1

    iget-object v4, p0, Lvue;->i:Lro9;

    iget-object v6, p0, Lvue;->o:Lamg;

    move-object v5, p0

    move-object v2, v4

    move-object v4, p0

    invoke-direct/range {v0 .. v6}, Lcve;-><init>(Landroid/view/View;Lro9;Luqe;Lvue;Lvue;Ldmg;)V

    return-object v0

    :cond_f6
    const v0, 0x7f0d019c

    if-ne p2, v0, :cond_110

    new-instance v0, Lbve;

    move-object v3, v1

    invoke-static {p1, p2, v9}, Lha2;->M(Landroid/view/ViewGroup;II)Landroid/view/View;

    move-result-object v1

    iget-object v7, p0, Lvue;->k:Lx5f;

    const/4 v8, 0x1

    iget-object v4, p0, Lvue;->i:Lro9;

    iget-object v6, p0, Lvue;->o:Lamg;

    move-object v5, p0

    move-object v2, v4

    move-object v4, p0

    invoke-direct/range {v0 .. v8}, Lbve;-><init>(Landroid/view/View;Lro9;Luqe;Lvue;Lvue;Ldmg;Lx5f;B)V

    return-object v0

    :cond_110
    const v0, 0x7f0d0196

    if-ne p2, v0, :cond_12a

    new-instance v0, Lbve;

    move-object v3, v1

    invoke-static {p1, p2, v9}, Lha2;->M(Landroid/view/ViewGroup;II)Landroid/view/View;

    move-result-object v1

    iget-object v7, p0, Lvue;->k:Lx5f;

    const/4 v8, 0x0

    iget-object v4, p0, Lvue;->i:Lro9;

    iget-object v6, p0, Lvue;->o:Lamg;

    move-object v5, p0

    move-object v2, v4

    move-object v4, p0

    invoke-direct/range {v0 .. v8}, Lbve;-><init>(Landroid/view/View;Lro9;Luqe;Lvue;Lvue;Ldmg;Lx5f;B)V

    return-object v0

    :cond_12a
    const v0, 0x7f0d01a2

    if-ne p2, v0, :cond_13e

    new-instance v0, Lhve;

    invoke-direct {v0, v1, p0, p0, v4}, Lhve;-><init>(Luqe;Lvue;Lvue;Ldmg;)V

    new-instance v1, Live;

    invoke-static {p1, p2, v9}, Lha2;->M(Landroid/view/ViewGroup;II)Landroid/view/View;

    move-result-object v2

    invoke-direct {v1, v2, v0, v10}, Live;-><init>(Landroid/view/View;Lhve;Lp0c;)V

    return-object v1

    :cond_13e
    const v0, 0x7f0d01a3

    if-ne p2, v0, :cond_158

    new-instance v0, Ljve;

    invoke-static {p1, p2, v9}, Lha2;->M(Landroid/view/ViewGroup;II)Landroid/view/View;

    move-result-object v3

    iget-object v6, p0, Lvue;->o:Lamg;

    iget-object v7, p0, Lvue;->k:Lx5f;

    iget-object v2, p0, Lvue;->i:Lro9;

    move-object v5, p0

    move-object v4, v3

    move-object v3, v1

    move-object v1, v4

    move-object v4, p0

    invoke-direct/range {v0 .. v7}, Ljve;-><init>(Landroid/view/View;Lro9;Luqe;Lvue;Lvue;Ldmg;Lx5f;)V

    return-object v0

    :cond_158
    return-object v3
.end method

.method public final n(Llx8;Lj82;)V
    .registers 14

    move-object v0, p2

    check-cast v0, Lpue;

    iget-object v0, v0, Lj82;->c:Loqe;

    instance-of v1, v0, Lmsh;

    if-eqz v1, :cond_ad

    check-cast v0, Lmsh;

    iget-object v0, v0, Lmsh;->z:Lxlg;

    if-eqz v0, :cond_ad

    invoke-virtual {p1}, Llx8;->c0()Lcmg;

    move-result-object v1

    iget-object v10, v1, Lcmg;->a:Lf90;

    iget-object v1, p0, Lvue;->p:Lghf;

    iget-object v2, v1, Lghf;->d:Ljava/lang/Object;

    check-cast v2, Ljava/util/LinkedHashSet;

    invoke-interface {v2, p2}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_8b

    invoke-interface {v2, p2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    iget-object v2, v1, Lghf;->b:Ljava/lang/Object;

    check-cast v2, Lx5f;

    iget-boolean v3, v2, Lx5f;->h:Z

    const/4 v4, 0x2

    if-eqz v3, :cond_30

    invoke-virtual {v2, v10, v4}, Lx5f;->w(Lf90;I)V

    :cond_30
    instance-of v2, p2, Lpue;

    if-eqz v2, :cond_41

    check-cast p2, Lpue;

    iget-object p2, p2, Lj82;->c:Loqe;

    instance-of v2, p2, Lmsh;

    if-eqz v2, :cond_41

    check-cast p2, Lmsh;

    iget-object p2, p2, Lmsh;->v:Lp12;

    goto :goto_42

    :cond_41
    const/4 p2, 0x0

    :goto_42
    if-eqz p2, :cond_8b

    iget-object v1, v1, Lghf;->c:Ljava/lang/Object;

    check-cast v1, Luqe;

    iget-object p2, p2, Lp12;->b:Ljava/lang/Object;

    check-cast p2, Ljava/lang/String;

    iget-object v1, v1, Luqe;->h:Luy8;

    sget-object v2, Lf90;->e:Lf90;

    const/4 v3, 0x0

    if-ne v10, v2, :cond_61

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v2, Lsy8;

    const-string v4, "podcast_in_article_card"

    invoke-direct {v2, v4, p2, v3}, Lsy8;-><init>(Ljava/lang/String;Ljava/lang/String;B)V

    invoke-virtual {v1, v2}, Luy8;->c(Ldy8;)V

    goto :goto_8b

    :cond_61
    sget-object v2, Lf90;->f:Lf90;

    if-ne v10, v2, :cond_73

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v2, Lsy8;

    const-string v4, "podcast_in_article_detail"

    invoke-direct {v2, v4, p2, v3}, Lsy8;-><init>(Ljava/lang/String;Ljava/lang/String;B)V

    invoke-virtual {v1, v2}, Luy8;->c(Ldy8;)V

    goto :goto_8b

    :cond_73
    sget-object v2, Lf90;->b:Lf90;

    if-ne v10, v2, :cond_7b

    invoke-virtual {v1, v3, p2}, Luy8;->l(ILjava/lang/String;)V

    goto :goto_8b

    :cond_7b
    sget-object v2, Lf90;->c:Lf90;

    if-ne v10, v2, :cond_84

    const/4 v2, 0x1

    invoke-virtual {v1, v2, p2}, Luy8;->l(ILjava/lang/String;)V

    goto :goto_8b

    :cond_84
    sget-object v2, Lf90;->d:Lf90;

    if-ne v10, v2, :cond_8b

    invoke-virtual {v1, v4, p2}, Luy8;->l(ILjava/lang/String;)V

    :cond_8b
    :goto_8b
    iget-object p0, p0, Lvue;->h:Lqq6;

    iget-object p0, p0, Lqq6;->b:Ljava/lang/Object;

    check-cast p0, Lhw3;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    move-object v2, p0

    check-cast v2, Lbmg;

    iget-object p0, p1, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v3

    iget-object v4, v0, Lxlg;->d:Ljava/lang/String;

    iget-object v5, v0, Lxlg;->b:Ljava/lang/String;

    iget-object v6, v0, Lxlg;->a:Ljava/lang/String;

    iget-object v7, v0, Lxlg;->f:Ljava/lang/String;

    iget-object v8, v0, Lxlg;->i:Ljava/lang/String;

    iget-object v9, v0, Lxlg;->c:Ljava/util/List;

    invoke-virtual/range {v2 .. v10}, Lbmg;->a(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/List;Lf90;)V

    :cond_ad
    return-void
.end method

.method public final onDestroy()V
    .registers 6

    iget-object v0, p0, Liu8;->d:Lp12;

    const/4 v1, 0x0

    iput-object v1, v0, Lp12;->f:Ljava/lang/Object;

    iget-object v1, v0, Lp12;->c:Ljava/lang/Object;

    check-cast v1, Lq82;

    iget-object v2, v0, Lp12;->e:Ljava/lang/Object;

    check-cast v2, Ltsh;

    iget-object v1, v1, Lq82;->a:Lh7f;

    invoke-virtual {v1, v2}, Lh7f;->c(Ljava/lang/Object;)Z

    iget-object v0, v0, Lp12;->g:Ljava/lang/Object;

    check-cast v0, Llve;

    invoke-static {v0}, Lac8;->d(Ljava/lang/Object;)V

    iget-object v0, p0, Liu8;->e:Lx79;

    if-eqz v0, :cond_24

    iget-object v0, v0, Lx79;->d:Ljava/lang/Object;

    check-cast v0, Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->clear()V

    :cond_24
    iget-object v0, p0, Lvue;->n:Landroidx/fragment/app/w;

    iget-object p0, p0, Lvue;->q:Lque;

    iget-object v0, v0, Landroidx/fragment/app/w;->p:Lz8b;

    iget-object v1, v0, Lz8b;->b:Ljava/lang/Object;

    check-cast v1, Ljava/util/concurrent/CopyOnWriteArrayList;

    monitor-enter v1

    :try_start_2f
    iget-object v2, v0, Lz8b;->b:Ljava/lang/Object;

    check-cast v2, Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-virtual {v2}, Ljava/util/concurrent/CopyOnWriteArrayList;->size()I

    move-result v2

    const/4 v3, 0x0

    :goto_38
    if-ge v3, v2, :cond_53

    iget-object v4, v0, Lz8b;->b:Ljava/lang/Object;

    check-cast v4, Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-virtual {v4, v3}, Ljava/util/concurrent/CopyOnWriteArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lrl9;

    iget-object v4, v4, Lrl9;->a:Lx1p;

    if-ne v4, p0, :cond_50

    iget-object p0, v0, Lz8b;->b:Ljava/lang/Object;

    check-cast p0, Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-virtual {p0, v3}, Ljava/util/concurrent/CopyOnWriteArrayList;->remove(I)Ljava/lang/Object;
    :try_end_4f
    .catchall {:try_start_2f .. :try_end_4f} :catchall_55

    goto :goto_53

    :cond_50
    add-int/lit8 v3, v3, 0x1

    goto :goto_38

    :cond_53
    :goto_53
    monitor-exit v1

    return-void

    :catchall_55
    move-exception p0

    monitor-exit v1

    throw p0
.end method

.method public final q(Lja2;ILca2;)I
    .registers 4

    instance-of p0, p1, Lfve;

    if-eqz p0, :cond_42

    check-cast p1, Lfve;

    iget-boolean p0, p1, Lfve;->g:Z

    if-eqz p0, :cond_e

    const p0, 0x7f0d018f

    return p0

    :cond_e
    iget-object p0, p1, Lfve;->f:Ljava/util/List;

    invoke-interface {p0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result p2

    if-eqz p2, :cond_26

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p0

    instance-of p0, p0, Lmre;

    if-eqz p0, :cond_26

    const p0, 0x7f0d019b

    return p0

    :cond_26
    iget-boolean p0, p1, Lfve;->h:Z

    if-eqz p0, :cond_2e

    const p0, 0x7f0d019c

    return p0

    :cond_2e
    iget-boolean p0, p1, Lfve;->i:Z

    if-eqz p0, :cond_36

    const p0, 0x7f0d0196

    return p0

    :cond_36
    iget-boolean p0, p1, Lfve;->k:Z

    if-eqz p0, :cond_3e

    const p0, 0x7f0d01a3

    return p0

    :cond_3e
    const p0, 0x7f0d0191

    return p0

    :cond_42
    check-cast p1, Lpue;

    iget-object p0, p1, Lj82;->c:Loqe;

    iget-boolean p1, p3, Lca2;->a:Z

    invoke-static {p0, p1}, Lvue;->t(Loqe;Z)I

    move-result p0

    return p0
.end method

.method public final r(Llx8;Lj82;)V
    .registers 13

    move-object v0, p2

    check-cast v0, Lpue;

    iget-object v0, v0, Lj82;->c:Loqe;

    check-cast v0, Lmsh;

    instance-of v1, v0, Ldre;

    const/4 v2, 0x1

    iget-object v3, p0, Liu8;->c:Luqe;

    iget-object v4, p0, Liu8;->b:Lcom/opera/android/BrowserActivity;

    const/4 v5, 0x0

    if-eqz v1, :cond_37

    move-object v6, v0

    check-cast v6, Ldre;

    iget-object v6, v6, Ldre;->D:Llog;

    iget-object v6, v6, Llog;->e:Lkog;

    iget-object v6, v6, Lkog;->d:Landroid/net/Uri;

    new-instance v7, Lkx8;

    invoke-direct {v7}, Lkx8;-><init>()V

    new-instance v8, Landroid/os/Bundle;

    invoke-direct {v8}, Landroid/os/Bundle;-><init>()V

    const-string v9, "uri"

    invoke-virtual {v8, v9, v6}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    invoke-virtual {v7, v8}, Landroidx/fragment/app/Fragment;->setArguments(Landroid/os/Bundle;)V

    const/16 v6, 0x1003

    invoke-static {v7, v6}, Lzhj;->a(Lryl;I)Lzhj;

    move-result-object v6

    invoke-virtual {v6, v4}, Lzhj;->c(Landroid/content/Context;)V

    goto/16 :goto_b9

    :cond_37
    instance-of v6, v0, Ld9i;

    if-nez v6, :cond_b6

    const-string v6, "podcast"

    iget-object v7, v0, Loqe;->c:Ljava/lang/String;

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_b6

    instance-of v6, v0, Lfre;

    if-eqz v6, :cond_7d

    move-object v6, v0

    check-cast v6, Lfre;

    iget-object v6, v6, Lfre;->D:Ljb8;

    iget-object v7, v6, Ljb8;->j:Ljava/lang/String;

    invoke-static {v7}, Lwqm;->v(Ljava/lang/String;)Z

    move-result v7

    iget-object v8, v6, Ljb8;->j:Ljava/lang/String;

    sget-object v9, Llqm;->C:Llqm;

    if-eqz v7, :cond_62

    invoke-static {v8}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v6

    invoke-static {v6, v9, v2, v4}, Llk6;->a(Landroid/net/Uri;Llqm;ILandroid/content/Context;)Z

    goto :goto_b9

    :cond_62
    new-instance v4, Lcom/opera/android/browser/UrlMangler$Builder;

    const-string v7, "newsevent"

    invoke-direct {v4, v7, v8}, Lcom/opera/android/browser/UrlMangler$Builder;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v6, v6, Ljb8;->a:Ljava/lang/String;

    invoke-virtual {v4, v6}, Lcom/opera/android/browser/UrlMangler$Builder;->displayString(Ljava/lang/String;)Lcom/opera/android/browser/UrlMangler$Builder;

    invoke-virtual {v4}, Lcom/opera/android/browser/UrlMangler$Builder;->build()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4, v9, v5}, Lay3;->a(Ljava/lang/String;Llqm;Z)Lvx3;

    move-result-object v4

    invoke-virtual {v4, v2}, Lvx3;->a(Z)V

    invoke-static {v4}, Lam2;->v(Lvx3;)V

    goto :goto_b9

    :cond_7d
    iget-boolean v4, p2, Lj82;->e:Z

    invoke-virtual {v3, v0, v4}, Luqe;->i(Lmsh;Z)Lg82;

    move-result-object v4

    new-instance v6, Lwhj;

    sget-object v7, Llqm;->e:Llqm;

    const/4 v8, 0x0

    invoke-direct {v6, v4, v5, v7, v8}, Lwhj;-><init>(Lg82;ILlqm;Ljava/util/ArrayList;)V

    invoke-static {v6}, Lac8;->a(Ljava/lang/Object;)V

    instance-of v4, p1, Lou8;

    if-nez v4, :cond_b9

    iget-object v4, v0, Lmsh;->A:Lkm5;

    iget-boolean v4, v4, Lkm5;->b:Z

    if-nez v4, :cond_b9

    iget-object v4, p0, Liu8;->d:Lp12;

    iput-object v0, v4, Lp12;->f:Ljava/lang/Object;

    invoke-static {v0}, Lp12;->h(Loqe;)Ljava/util/ArrayList;

    move-result-object v6

    invoke-virtual {v6}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v6

    if-eqz v6, :cond_b9

    iget-object v6, v4, Lp12;->f:Ljava/lang/Object;

    check-cast v6, Loqe;

    check-cast v6, Lmsh;

    iget-object v4, v4, Lp12;->h:Ljava/lang/Object;

    check-cast v4, Luqe;

    sget-object v7, Lssh;->a:Lrsh;

    invoke-virtual {v6, v4, v7, v5}, Lmsh;->d(Luqe;Lssh;Z)V

    goto :goto_b9

    :cond_b6
    invoke-virtual {p0, p1, p2}, Lvue;->n(Llx8;Lj82;)V

    :cond_b9
    :goto_b9
    iget-object v3, v3, Luqe;->h:Luy8;

    if-eqz v1, :cond_c0

    invoke-virtual {v3, v5, v0}, Luy8;->h(ILmsh;)V

    :cond_c0
    instance-of v1, v0, Lire;

    if-eqz v1, :cond_c7

    invoke-virtual {v3, v5, v0}, Luy8;->h(ILmsh;)V

    :cond_c7
    instance-of v1, v0, Lure;

    if-eqz v1, :cond_10a

    check-cast v0, Lure;

    iget-object v1, v3, Luy8;->q:Ljava/util/Set;

    iget-object v4, v0, Lmsh;->v:Lp12;

    iget-object v4, v4, Lp12;->b:Ljava/lang/Object;

    check-cast v4, Ljava/lang/String;

    invoke-interface {v1, v4}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_10a

    iget-object v1, v3, Luy8;->n:Lb59;

    invoke-virtual {v1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/content/SharedPreferences;

    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v4

    const-string v6, "FEEDBACK_TRACKER_ARTICLES_CLICKED"

    invoke-interface {v1, v6, v5}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v1

    add-int/2addr v1, v2

    invoke-interface {v4, v6, v1}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    invoke-interface {v1}, Landroid/content/SharedPreferences$Editor;->apply()V

    iget-object v1, v3, Luy8;->K:Ly0f;

    invoke-virtual {v1, v0}, Ly0f;->a(Lmsh;)V

    iget-object v1, v3, Luy8;->L:Lcom/opera/android/settings/SettingsManager;

    invoke-virtual {v1}, Lcom/opera/android/settings/SettingsManager;->M()Z

    move-result v1

    if-eqz v1, :cond_10a

    new-instance v1, Lby8;

    invoke-direct {v1, v0, v5}, Lby8;-><init>(Lmsh;B)V

    invoke-virtual {v3, v1}, Luy8;->e(Lzx8;)V

    :cond_10a
    iget-object p0, p0, Lvue;->j:Lhu8;

    if-eqz p0, :cond_111

    invoke-virtual {p0, p1, p2}, Lhu8;->r(Llx8;Lj82;)V

    :cond_111
    return-void
.end method

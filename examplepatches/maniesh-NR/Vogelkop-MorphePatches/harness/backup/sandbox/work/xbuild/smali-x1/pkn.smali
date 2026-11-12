.class public final Lpkn;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ltjn;


# instance fields
.field public final synthetic a:Lwln;

.field public final synthetic b:Ln1;

.field public final synthetic c:Lqln;

.field public final synthetic d:Lorm;

.field public final synthetic e:Leej;

.field public final synthetic f:Lqkn;


# direct methods
.method public constructor <init>(Lqkn;Lwln;Ln1;Lqln;Lorm;Leej;)V
    .registers 7

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lpkn;->a:Lwln;

    iput-object p3, p0, Lpkn;->b:Ln1;

    iput-object p4, p0, Lpkn;->c:Lqln;

    iput-object p5, p0, Lpkn;->d:Lorm;

    iput-object p6, p0, Lpkn;->e:Leej;

    iput-object p1, p0, Lpkn;->f:Lqkn;

    return-void
.end method


# virtual methods
.method public final a()I
    .registers 1

    iget-object p0, p0, Lpkn;->f:Lqkn;

    iget-object p0, p0, Lqkn;->m:Lt79;

    if-eqz p0, :cond_b

    invoke-virtual {p0}, Lt79;->s0()I

    move-result p0

    return p0

    :cond_b
    const/4 p0, 0x0

    return p0
.end method

.method public final b()V
    .registers 3

    iget-object p0, p0, Lpkn;->f:Lqkn;

    iget-object p0, p0, Lqkn;->a:Lgjm;

    new-instance v0, Lsln;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lgjm;->e(Ln37;Z)V

    return-void
.end method

.method public final c()V
    .registers 3

    const/16 v0, 0xd

    iget-object v1, p0, Lpkn;->d:Lorm;

    check-cast v1, Lx5f;

    invoke-virtual {v1, v0}, Lx5f;->S(I)V

    iget-object p0, p0, Lpkn;->f:Lqkn;

    iget-object p0, p0, Lqkn;->f:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-static {p0}, Lrih;->q(Landroid/content/Context;)Ljava/lang/String;

    move-result-object p0

    if-nez p0, :cond_18

    return-void

    :cond_18
    sget-object v0, Llqm;->d:Llqm;

    const/4 v1, 0x0

    invoke-static {p0, v0, v1}, Lay3;->a(Ljava/lang/String;Llqm;Z)Lvx3;

    move-result-object p0

    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lvx3;->a(Z)V

    const/4 v0, 0x3

    iput v0, p0, Lvx3;->b:I

    invoke-static {p0}, Lam2;->v(Lvx3;)V

    return-void
.end method

.method public final d()Z
    .registers 1

    iget-object p0, p0, Lpkn;->f:Lqkn;

    iget-object p0, p0, Lqkn;->b:Lqln;

    invoke-virtual {p0}, Lqln;->g()Z

    move-result p0

    return p0
.end method

.method public final e()Ljava/lang/String;
    .registers 1

    iget-object p0, p0, Lpkn;->f:Lqkn;

    iget-object p0, p0, Lqkn;->b:Lqln;

    invoke-virtual {p0}, Lqln;->i()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public final f()Ljava/lang/String;
    .registers 1

    iget-object p0, p0, Lpkn;->f:Lqkn;

    iget-object p0, p0, Lqkn;->b:Lqln;

    invoke-virtual {p0}, Lqln;->f()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public final g()V
    .registers 3

    iget-object p0, p0, Lpkn;->f:Lqkn;

    iget-object p0, p0, Lqkn;->a:Lgjm;

    new-instance v0, Lmkn;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lgjm;->e(Ln37;Z)V

    return-void
.end method

.method public final i(Landroid/view/View;)V
    .registers 6

    iget-object p1, p0, Lpkn;->f:Lqkn;

    iget-object p1, p1, Lqkn;->f:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    new-instance v0, Liyk;

    const/16 v1, 0xc

    iget-object v2, p0, Lpkn;->a:Lwln;

    invoke-direct {v0, p0, v2, v1}, Liyk;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    :try_start_11
    new-instance p0, Landroid/content/Intent;

    const-string v1, "android.intent.action.GET_CONTENT"

    invoke-direct {p0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string v1, "image/*"

    invoke-virtual {p0, v1}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    move-result-object p0

    const-string v1, "android.intent.category.OPENABLE"

    invoke-virtual {p0, v1}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    move-result-object p0

    const-string v1, "android.intent.extra.ALLOW_MULTIPLE"

    const/4 v2, 0x1

    invoke-virtual {p0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    invoke-static {p1}, Loi;->d(Landroid/content/Context;)Loi;

    move-result-object v1

    new-instance v2, Lqj2;

    const/16 v3, 0xe

    invoke-direct {v2, v0, v3}, Lqj2;-><init>(Ljava/lang/Object;B)V

    check-cast v1, Lhjf;

    invoke-virtual {v1, p0, v2}, Lhjf;->D(Landroid/content/Intent;Lni;)V
    :try_end_3a
    .catch Landroid/content/ActivityNotFoundException; {:try_start_11 .. :try_end_3a} :catch_3b

    return-void

    :catch_3b
    new-instance p0, Laz0;

    invoke-direct {p0, p1}, Laz0;-><init>(Landroid/content/Context;)V

    const p1, 0x7f140774

    invoke-virtual {p0, p1}, Laz0;->a(I)V

    const p1, 0x7f140bbb

    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Laz0;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Laz0;

    move-result-object p0

    invoke-virtual {p0}, Laz0;->c()Lbz0;

    return-void
.end method

.method public final j(Z)V
    .registers 6

    iget-object v0, p0, Lpkn;->f:Lqkn;

    iget-object v0, v0, Lqkn;->b:Lqln;

    if-nez p1, :cond_4b

    sget-object p1, Lzg;->e:Log5;

    if-eqz p1, :cond_b

    return-void

    :cond_b
    iget-object p1, p0, Lpkn;->c:Lqln;

    iget-object v0, p1, Lqln;->f:Lami;

    iget-object v0, v0, Lami;->e:Ljava/lang/Object;

    check-cast v0, Lvq8;

    invoke-virtual {v0}, Lvq8;->i()Z

    move-result v0

    iget-object v1, p0, Lpkn;->e:Leej;

    if-nez v0, :cond_2a

    iget-object v0, p1, Lqln;->f:Lami;

    new-instance v2, Lh4m;

    const/16 v3, 0x8

    iget-object p0, p0, Lpkn;->d:Lorm;

    invoke-direct {v2, p1, p0, v1, v3}, Lh4m;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v0, v2}, Lami;->r(Ljava/lang/Runnable;)V

    return-void

    :cond_2a
    new-instance p0, Lurj;

    const/16 v0, 0x9

    invoke-direct {p0, v0}, Lurj;-><init>(B)V

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v0, Lzg;

    invoke-direct {v0, p1}, Lzg;-><init>(Lqln;)V

    new-instance p1, Log5;

    invoke-direct {p1, v0, p0}, Log5;-><init>(Lzg;Lurj;)V

    iget-object p0, v1, Leej;->a:Lnej;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v0, Lijm;->b:Lijm;

    invoke-virtual {p0, p1, v0}, Lr22;->b(Ljjm;Lijm;)V

    sput-object p1, Lzg;->e:Log5;

    return-void

    :cond_4b
    const/4 p0, 0x0

    invoke-virtual {v0, p0}, Lqln;->o(Z)V

    const-string p0, "most_popular"

    invoke-virtual {v0, p0}, Lqln;->n(Ljava/lang/String;)V

    return-void
.end method

.method public final k(Landroid/view/View;)V
    .registers 2

    return-void
.end method

.method public final l()V
    .registers 2

    const/16 v0, 0xc

    iget-object p0, p0, Lpkn;->d:Lorm;

    check-cast p0, Lx5f;

    invoke-virtual {p0, v0}, Lx5f;->S(I)V

    return-void
.end method

.method public final m(Landroid/view/View;Laln;)V
    .registers 12

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iget-object v1, p0, Lpkn;->f:Lqkn;

    iget-object v2, v1, Lqkn;->h:Lx4i;

    iget-object v2, v2, Lx4i;->h:Lode;

    invoke-virtual {v2}, Lekc;->g()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map;

    const/4 v3, 0x0

    const/4 v4, 0x1

    if-eqz v2, :cond_2d

    invoke-interface {v2}, Ljava/util/Map;->isEmpty()Z

    move-result v5

    if-nez v5, :cond_2d

    invoke-interface {p2}, Laln;->getId()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v2, v5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lk15;

    if-eqz v2, :cond_2d

    invoke-virtual {v2}, Lk15;->a()Z

    move-result v2

    if-eqz v2, :cond_77

    :cond_2d
    iget-object v2, v1, Lqkn;->b:Lqln;

    invoke-interface {p2}, Laln;->getId()Ljava/lang/String;

    move-result-object v5

    iget-object v2, v2, Lqln;->j:Lvzk;

    iget-object v2, v2, Lvzk;->d:Ljava/lang/Object;

    check-cast v2, Ljava/util/ArrayList;

    invoke-virtual {v2, v5}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v2

    const v5, 0x7f080551

    if-eqz v2, :cond_5d

    new-instance v2, Lgtd;

    new-instance v6, Lrxh;

    const v7, 0x7f140ea6

    invoke-direct {v6, v7}, Lrxh;-><init>(I)V

    new-instance v7, Llxh;

    invoke-direct {v7, v5}, Llxh;-><init>(I)V

    new-instance v5, Lokn;

    invoke-direct {v5, p0, p2, v3}, Lokn;-><init>(Lpkn;Laln;B)V

    invoke-direct {v2, v6, v7, v5}, Lgtd;-><init>(Lrxh;Llxh;Landroid/view/View$OnClickListener;)V

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_77

    :cond_5d
    new-instance v2, Lgtd;

    new-instance v6, Lrxh;

    const v7, 0x7f1400e9

    invoke-direct {v6, v7}, Lrxh;-><init>(I)V

    new-instance v7, Llxh;

    invoke-direct {v7, v5}, Llxh;-><init>(I)V

    new-instance v5, Lokn;

    invoke-direct {v5, p0, p2, v4}, Lokn;-><init>(Lpkn;Laln;B)V

    invoke-direct {v2, v6, v7, v5}, Lgtd;-><init>(Lrxh;Llxh;Landroid/view/View$OnClickListener;)V

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_77
    :goto_77
    new-instance v2, Lgtd;

    new-instance v5, Lrxh;

    const v6, 0x7f140f42

    invoke-direct {v5, v6}, Lrxh;-><init>(I)V

    new-instance v6, Llxh;

    const v7, 0x7f080631

    invoke-direct {v6, v7}, Llxh;-><init>(I)V

    new-instance v7, Lokn;

    const/4 v8, 0x2

    invoke-direct {v7, p0, p2, v8}, Lokn;-><init>(Lpkn;Laln;B)V

    invoke-direct {v2, v5, v6, v7}, Lgtd;-><init>(Lrxh;Llxh;Landroid/view/View$OnClickListener;)V

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    iget-object v2, p0, Lpkn;->b:Ln1;

    instance-of v2, v2, Lyjn;

    const/4 v5, 0x3

    if-eqz v2, :cond_b9

    new-instance v2, Lgtd;

    new-instance v6, Lrxh;

    const v7, 0x7f140ea3

    invoke-direct {v6, v7}, Lrxh;-><init>(I)V

    new-instance v7, Llxh;

    const v8, 0x7f080540

    invoke-direct {v7, v8}, Llxh;-><init>(I)V

    new-instance v8, Lokn;

    invoke-direct {v8, p0, p2, v5}, Lokn;-><init>(Lpkn;Laln;B)V

    invoke-direct {v2, v6, v7, v8}, Lgtd;-><init>(Lrxh;Llxh;Landroid/view/View$OnClickListener;)V

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_b9
    new-instance p0, Lexd;

    iget-object p2, v1, Lqkn;->r:Lcom/opera/android/StatusBarDrawingFrameLayout;

    new-instance v2, Ll11;

    const/16 v6, 0x30

    invoke-direct {v2, v5, v3, v6, p1}, Ll11;-><init>(IIILandroid/view/View;)V

    invoke-direct {p0, p2, v2, v0}, Lexd;-><init>(Landroid/view/ViewGroup;Ll11;Ljava/util/List;)V

    iput-object p0, v1, Lqkn;->q:Lexd;

    invoke-virtual {p0}, Llz3;->f()V

    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object p0

    invoke-interface {p0, v4}, Landroid/view/ViewParent;->requestDisallowInterceptTouchEvent(Z)V

    return-void
.end method

.method public final n(Laln;)V
    .registers 10

    iget-object v0, p0, Lpkn;->f:Lqkn;

    iget-object v1, v0, Lqkn;->c:Lonn;

    iget-object v1, v1, Lonn;->g:Lmnn;

    if-eqz v1, :cond_d

    iget-object v1, v1, Lmnn;->c:Ljava/util/ArrayList;

    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_d
    invoke-interface {p1}, Laln;->getId()Ljava/lang/String;

    move-result-object v3

    new-instance v2, Lcmn;

    const/4 v7, 0x1

    const/4 v6, 0x6

    const/4 v4, 0x0

    const/4 v5, 0x0

    invoke-direct/range {v2 .. v7}, Lcmn;-><init>(Ljava/lang/String;Ljava/lang/String;IIZ)V

    iget-object p1, v0, Lqkn;->a:Lgjm;

    new-instance v0, Ldmn;

    iget-object v1, p0, Lpkn;->a:Lwln;

    invoke-direct {v0, v1, v2}, Ldmn;-><init>(Lwln;Lcmn;)V

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Lgjm;->e(Ln37;Z)V

    invoke-virtual {p0}, Lpkn;->p()V

    return-void
.end method

.method public final o()Lx4i;
    .registers 2

    iget-object p0, p0, Lpkn;->f:Lqkn;

    iget-object v0, p0, Lqkn;->g:Lk3i;

    invoke-virtual {v0}, Lk3i;->c()Z

    move-result v0

    if-eqz v0, :cond_d

    iget-object p0, p0, Lqkn;->h:Lx4i;

    return-object p0

    :cond_d
    const/4 p0, 0x0

    return-object p0
.end method

.method public final p()V
    .registers 3

    iget-object p0, p0, Lpkn;->f:Lqkn;

    iget-object v0, p0, Lqkn;->q:Lexd;

    if-eqz v0, :cond_b

    sget-object v1, Lhjm;->a:Lhjm;

    invoke-virtual {v0, v1}, Llz3;->b(Lhjm;)Z

    :cond_b
    const/4 v0, 0x0

    iput-object v0, p0, Lqkn;->q:Lexd;

    return-void
.end method

.method public final retry()V
    .registers 3

    iget-object p0, p0, Lpkn;->f:Lqkn;

    iget-object p0, p0, Lqkn;->b:Lqln;

    iget-object p0, p0, Lqln;->f:Lami;

    new-instance v0, Lrl;

    const/4 v1, 0x4

    invoke-direct {v0, v1}, Lrl;-><init>(B)V

    invoke-virtual {p0, v0}, Lami;->r(Ljava/lang/Runnable;)V

    return-void
.end method

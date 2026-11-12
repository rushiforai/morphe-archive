.class public final Lplj;
.super Lk8;
.source "SourceFile"

# interfaces
.implements Lkq;


# instance fields
.field public final o:Lwy;

.field public final p:Locd;

.field public q:Ln43;

.field public r:Luo;

.field public s:Lncd;

.field public t:Lolj;


# direct methods
.method public constructor <init>(Lwy;Locd;Lx5f;)V
    .registers 5

    const/4 v0, 0x0

    invoke-direct {p0, p3, v0}, Lk8;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    iput-object p1, p0, Lplj;->o:Lwy;

    iput-object p2, p0, Lplj;->p:Locd;

    new-instance p1, Lin7;

    const/4 p2, 0x1

    invoke-direct {p1, p2}, Lia2;-><init>(B)V

    iput-object p1, p0, Lplj;->q:Ln43;

    return-void
.end method


# virtual methods
.method public final Y(Lmq;)Z
    .registers 2

    iget-object p0, p0, Lplj;->p:Locd;

    invoke-virtual {p0}, Locd;->a()Z

    move-result p0

    if-eqz p0, :cond_a

    const/4 p0, 0x0

    return p0

    :cond_a
    const/4 p0, 0x1

    return p0
.end method

.method public final f0(Lmq;)V
    .registers 3

    iget-object v0, p0, Lplj;->q:Ln43;

    invoke-virtual {p1, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_11

    iget-object p0, p0, Lplj;->t:Lolj;

    if-eqz p0, :cond_11

    const-string p1, "cancelled"

    invoke-virtual {p0, p1}, Lolj;->onFailed(Ljava/lang/String;)V

    :cond_11
    return-void
.end method

.method public final p0(Lmq;)V
    .registers 4

    iget-object v0, p0, Lplj;->q:Ln43;

    invoke-virtual {p1, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_18

    iget-object v0, p0, Lplj;->p:Locd;

    invoke-virtual {v0}, Locd;->a()Z

    move-result v0

    if-eqz v0, :cond_18

    const/4 v0, 0x1

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Lmq;->g(ZZ)Z

    move-result p1

    if-nez p1, :cond_19

    :cond_18
    return-void

    :cond_19
    invoke-virtual {p0, v1}, Lplj;->t0(Z)V

    return-void
.end method

.method public final r(Lmq;)V
    .registers 6

    iget-object v0, p0, Lplj;->q:Ln43;

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_34

    iget-object p1, p0, Lplj;->p:Locd;

    iget-object p1, p1, Locd;->a:Lb59;

    invoke-virtual {p1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/content/SharedPreferences;

    invoke-interface {p1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "masthead_ad.last_removed_timestamp"

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    invoke-interface {v0, v1, v2, v3}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const/4 v1, 0x0

    const-string v2, "masthead_ad.removed_count"

    invoke-interface {p1, v2, v1}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result p1

    add-int/lit8 p1, p1, 0x1

    invoke-interface {v0, v2, p1}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    invoke-interface {p1}, Landroid/content/SharedPreferences$Editor;->apply()V

    iget-object p1, p0, Lplj;->r:Luo;

    if-nez p1, :cond_35

    :cond_34
    return-void

    :cond_35
    new-instance v0, Lno;

    iget-object v1, p0, Lplj;->o:Lwy;

    iget-object v1, v1, Lwy;->l:Lyl;

    sget-object v2, Ll08;->a:Ll08;

    invoke-direct {v0, p1, v1, p0, v2}, Lno;-><init>(Luo;Lkm;Lk8;Ljava/util/List;)V

    invoke-virtual {p0, v0}, Lplj;->s0(Ln43;)V

    return-void
.end method

.method public final s0(Ln43;)V
    .registers 4

    iget-object v0, p0, Lplj;->t:Lolj;

    if-eqz v0, :cond_9

    const-string v1, "cancelled"

    invoke-virtual {v0, v1}, Lolj;->onFailed(Ljava/lang/String;)V

    :cond_9
    iget-object v0, p0, Lplj;->q:Ln43;

    iput-object p1, p0, Lplj;->q:Ln43;

    iget-object p0, p0, Lplj;->s:Lncd;

    if-eqz p0, :cond_14

    invoke-virtual {p0}, Lu5k;->A()V

    :cond_14
    invoke-virtual {v0}, Ln43;->f()V

    return-void
.end method

.method public final t0(Z)V
    .registers 18

    move-object/from16 v0, p0

    iget-object v1, v0, Lplj;->r:Luo;

    if-eqz v1, :cond_a

    iget-object v2, v0, Lplj;->t:Lolj;

    if-eqz v2, :cond_b

    :cond_a
    return-void

    :cond_b
    new-instance v3, Lolj;

    iget-object v4, v1, Luo;->a:Lbz;

    iget-object v1, v1, Luo;->b:Ldl;

    iget-object v2, v1, Ldl;->c:Ljava/lang/String;

    sget-object v5, Ll08;->a:Ll08;

    new-instance v6, Lm43;

    const/4 v7, 0x0

    invoke-direct {v6, v1, v2, v7, v5}, Lm43;-><init>(Ldl;Ljava/lang/String;ILjava/util/List;)V

    new-instance v8, Lr31;

    iget-object v1, v0, Lplj;->o:Lwy;

    iget-object v10, v1, Lwy;->y:Lej;

    const/4 v14, 0x0

    const/4 v15, 0x5

    const/4 v9, 0x3

    const-class v11, Lej;

    const-string v12, "maybePreloadEssentialAssets"

    const-string v13, "maybePreloadEssentialAssets(Lcom/opera/android/ads/Advertisement;ZLkotlin/jvm/functions/Function2;)V"

    invoke-direct/range {v8 .. v15}, Lr31;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;IB)V

    new-instance v7, Lsn3;

    const/16 v1, 0x8

    move/from16 v2, p1

    invoke-direct {v7, v1, v0, v2}, Lsn3;-><init>(BLjava/lang/Object;Z)V

    move-object v5, v6

    move-object v6, v8

    new-instance v8, Ltji;

    const/16 v1, 0x12

    invoke-direct {v8, v0, v1}, Ltji;-><init>(Ljava/lang/Object;B)V

    invoke-direct/range {v3 .. v8}, Lolj;-><init>(Lbz;Lm43;Lr31;Lsn3;Ltji;)V

    iput-object v3, v0, Lplj;->t:Lolj;

    invoke-interface {v4, v5}, Lbz;->d(Laz;)Lyz;

    move-result-object v0

    if-eqz v0, :cond_5c

    invoke-virtual {v5}, Lm43;->b()Z

    move-result v1

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    new-instance v2, Lq01;

    const/4 v4, 0x1

    invoke-direct {v2, v3, v0, v4}, Lq01;-><init>(Lolj;Lyz;Z)V

    invoke-virtual {v6, v0, v1, v2}, Lr31;->invoke(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void

    :cond_5c
    invoke-interface {v4, v3, v5}, Lbz;->e(Lzy;Laz;)V

    return-void
.end method

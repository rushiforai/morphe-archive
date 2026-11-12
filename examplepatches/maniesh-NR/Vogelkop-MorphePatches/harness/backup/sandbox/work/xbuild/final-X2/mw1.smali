.class public final Lmw1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/appsflyer/AppsFlyerConversionListener;


# instance fields
.field public final a:Lvzk;

.field public final b:Lx5f;

.field public final c:Ll45;


# direct methods
.method public constructor <init>(Lvzk;Lx5f;Ll45;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lmw1;->a:Lvzk;

    iput-object p2, p0, Lmw1;->b:Lx5f;

    iput-object p3, p0, Lmw1;->c:Ll45;

    return-void
.end method


# virtual methods
.method public final onAppOpenAttribution(Ljava/util/Map;)V
    .registers 2

    return-void
.end method

.method public final onAttributionFailure(Ljava/lang/String;)V
    .registers 10

    sget-object v0, Laik;->a:[Ljava/lang/String;

    const-string v0, ""

    if-nez p1, :cond_7

    move-object p1, v0

    :cond_7
    iget-object v1, p0, Lmw1;->b:Lx5f;

    iget-object v2, v1, Lx5f;->d:Lzpa;

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v3

    invoke-virtual {v3, v2}, Lx56;->z(Lzpa;)Lq56;

    move-result-object v2

    invoke-virtual {v2}, Lq56;->A()Lhf0;

    move-result-object v2

    new-instance v4, Lq70;

    const/4 v5, -0x1

    const/4 v6, 0x2

    const/16 v7, 0x98b

    invoke-direct {v4, v7, v5, v6}, Ljf0;-><init>(III)V

    const/4 v5, 0x0

    const/4 v6, 0x1

    sget-object v7, Lp70;->c:Lp70;

    invoke-virtual {v4, v5, v6, v7}, Ljf0;->q(IILjava/lang/Object;)V

    invoke-virtual {v4, v6, v6, p1}, Ljf0;->q(IILjava/lang/Object;)V

    invoke-virtual {v2, v4}, Ljava/util/AbstractList;->add(Ljava/lang/Object;)Z

    invoke-virtual {v1, v3}, Lx5f;->U0(Lx56;)V

    iget-object p0, p0, Lmw1;->c:Ll45;

    sget-object p1, Ltw1;->f:Ltw1;

    invoke-virtual {p0, p1, v0}, Ll45;->M(Ltw1;Ljava/lang/String;)V

    return-void
.end method

.method public final onConversionDataFail(Ljava/lang/String;)V
    .registers 8

    iget-object p1, p0, Lmw1;->a:Lvzk;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Lvzk;->b0(Ljava/util/Map;)V

    iget-object p1, p0, Lmw1;->b:Lx5f;

    iget-object v0, p1, Lx5f;->d:Lzpa;

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v1

    invoke-virtual {v1, v0}, Lx56;->z(Lzpa;)Lq56;

    move-result-object v0

    invoke-virtual {v0}, Lq56;->A()Lhf0;

    move-result-object v0

    new-instance v2, Lq70;

    const/4 v3, -0x1

    const/4 v4, 0x2

    const/16 v5, 0x98b

    invoke-direct {v2, v5, v3, v4}, Ljf0;-><init>(III)V

    const/4 v3, 0x0

    const/4 v4, 0x1

    sget-object v5, Lp70;->b:Lp70;

    invoke-virtual {v2, v3, v4, v5}, Ljf0;->q(IILjava/lang/Object;)V

    invoke-virtual {v0, v2}, Ljava/util/AbstractList;->add(Ljava/lang/Object;)Z

    invoke-virtual {p1, v1}, Lx5f;->U0(Lx56;)V

    sget-object p1, Ltw1;->e:Ltw1;

    const-string v0, ""

    iget-object p0, p0, Lmw1;->c:Ll45;

    invoke-virtual {p0, p1, v0}, Ll45;->M(Ltw1;Ljava/lang/String;)V

    return-void
.end method

.method public final onConversionDataSuccess(Ljava/util/Map;)V
    .registers 11

    sget-object v0, Lt8;->a:Landroid/content/Context;

    invoke-static {v0}, Ls6e;->b(Landroid/content/Context;)Ls6e;

    move-result-object v0

    invoke-virtual {v0}, Ls6e;->c()Z

    move-result v1

    iget-object v0, v0, Ls6e;->b:Lvq8;

    const/4 v2, 0x0

    if-nez v1, :cond_11

    move-object v1, v2

    goto :goto_3d

    :cond_11
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    const-string v3, ""

    if-eqz v0, :cond_1f

    iget-object v4, v0, Lvq8;->j:Ljava/lang/Object;

    check-cast v4, Ljava/lang/String;

    goto :goto_20

    :cond_1f
    move-object v4, v3

    :goto_20
    invoke-virtual {v4}, Ljava/lang/String;->isEmpty()Z

    move-result v5

    if-nez v5, :cond_2b

    const-string v5, "adset"

    invoke-virtual {v1, v5, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_2b
    if-eqz v0, :cond_32

    iget-object v0, v0, Lvq8;->k:Ljava/lang/Object;

    move-object v3, v0

    check-cast v3, Ljava/lang/String;

    :cond_32
    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_3d

    const-string v0, "af_adset"

    invoke-virtual {v1, v0, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_3d
    :goto_3d
    if-eqz v1, :cond_52

    invoke-interface {v1}, Ljava/util/Map;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_52

    if-nez p1, :cond_49

    move-object p1, v1

    goto :goto_52

    :cond_49
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0, p1}, Ljava/util/HashMap;-><init>(Ljava/util/Map;)V

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->putAll(Ljava/util/Map;)V

    move-object p1, v0

    :cond_52
    :goto_52
    iget-object v0, p0, Lmw1;->a:Lvzk;

    invoke-virtual {v0, p1}, Lvzk;->b0(Ljava/util/Map;)V

    if-eqz p1, :cond_df

    const-string v0, "is_first_launch"

    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    const-string v1, "true"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_df

    const-string v0, "af_message"

    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    const-string v1, "click_time"

    invoke-interface {p1, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    const-string v3, "install_time"

    invoke-interface {p1, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    if-eqz v0, :cond_80

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_81

    :cond_80
    move-object v0, v2

    :goto_81
    if-eqz v1, :cond_88

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_89

    :cond_88
    move-object v1, v2

    :goto_89
    if-eqz p1, :cond_8f

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    :cond_8f
    iget-object p0, p0, Lmw1;->b:Lx5f;

    iget-object p1, p0, Lx5f;->d:Lzpa;

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v3

    invoke-virtual {v3, p1}, Lx56;->z(Lzpa;)Lq56;

    move-result-object p1

    const/16 v4, 0xb

    invoke-virtual {p1, v4}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/List;

    const/4 v6, 0x1

    if-eqz v5, :cond_b2

    invoke-interface {v5}, Ljava/util/List;->isEmpty()Z

    move-result v7

    if-nez v7, :cond_b2

    new-instance v7, Lhf0;

    invoke-direct {v7, p1, v4, v5}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    goto :goto_bf

    :cond_b2
    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {p1, v4, v6, v5}, Ljf0;->q(IILjava/lang/Object;)V

    new-instance v7, Lhf0;

    invoke-direct {v7, p1, v4, v5}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    :goto_bf
    new-instance p1, Lr70;

    const/4 v4, -0x1

    const/4 v5, 0x3

    const/16 v8, 0x98b

    invoke-direct {p1, v8, v4, v5}, Ljf0;-><init>(III)V

    if-eqz v0, :cond_ce

    const/4 v4, 0x2

    invoke-virtual {p1, v4, v0}, Lr70;->x(ILjava/lang/String;)V

    :cond_ce
    if-eqz v1, :cond_d4

    const/4 v0, 0x0

    invoke-virtual {p1, v0, v1}, Lr70;->x(ILjava/lang/String;)V

    :cond_d4
    if-eqz v2, :cond_d9

    invoke-virtual {p1, v6, v2}, Lr70;->x(ILjava/lang/String;)V

    :cond_d9
    invoke-virtual {v7, p1}, Ljava/util/AbstractList;->add(Ljava/lang/Object;)Z

    invoke-virtual {p0, v3}, Lx5f;->U0(Lx56;)V

    :cond_df
    return-void
.end method

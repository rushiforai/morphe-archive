.class public final Lw6o;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ll45;

.field public final b:Lxnc;

.field public final c:Lfs6;

.field public final d:Lhx5;

.field public final e:Lrs6;

.field public final f:Ltn;

.field public final g:Lddc;

.field public final h:Lxz6;

.field public final i:Lnak;

.field public final j:Lrlh;

.field public final k:Lc78;

.field public final l:Lrlh;

.field public final m:Lzyk;

.field public final n:Ljava/util/LinkedHashMap;

.field public o:Ls6o;


# direct methods
.method public constructor <init>(Ll45;Lxnc;Lfs6;Lhx5;Lrs6;Ltn;Lddc;Lvk1;Lt1;Ljg8;Lx5f;)V
    .registers 12

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lw6o;->a:Ll45;

    iput-object p2, p0, Lw6o;->b:Lxnc;

    iput-object p3, p0, Lw6o;->c:Lfs6;

    iput-object p4, p0, Lw6o;->d:Lhx5;

    iput-object p5, p0, Lw6o;->e:Lrs6;

    iput-object p6, p0, Lw6o;->f:Ltn;

    iput-object p7, p0, Lw6o;->g:Lddc;

    new-instance p1, Lxz6;

    invoke-direct {p1, p11}, Lxz6;-><init>(Lx5f;)V

    iput-object p1, p0, Lw6o;->h:Lxz6;

    sget-object p1, Ldtc;->a:Ldtc;

    invoke-static {p1}, Lz4o;->f(Ljava/lang/Object;)Lnak;

    move-result-object p1

    iput-object p1, p0, Lw6o;->i:Lnak;

    invoke-static {p1}, La26;->j(Lnak;)Lrlh;

    move-result-object p1

    iput-object p1, p0, Lw6o;->j:Lrlh;

    new-instance p3, Lc78;

    const/4 p4, 0x6

    invoke-direct {p3, p1, p4}, Lc78;-><init>(Lrlh;B)V

    iput-object p3, p0, Lw6o;->k:Lc78;

    iget-object p1, p2, Lxnc;->d:Lz78;

    sget-object p2, Laej;->a:Lftj;

    sget-object p3, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-static {p1, p7, p2, p3}, La26;->o0(Lf99;Lnx5;Lbej;Ljava/lang/Object;)Lrlh;

    move-result-object p1

    iput-object p1, p0, Lw6o;->l:Lrlh;

    new-instance p1, Luef;

    const/16 p2, 0xb

    invoke-direct {p1, p8, p9, p10, p2}, Luef;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-static {p1}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object p1

    iput-object p1, p0, Lw6o;->m:Lzyk;

    new-instance p1, Ljava/util/LinkedHashMap;

    invoke-direct {p1}, Ljava/util/LinkedHashMap;-><init>()V

    iput-object p1, p0, Lw6o;->n:Ljava/util/LinkedHashMap;

    new-instance p1, Lzhl;

    const/16 p2, 0xa

    const/4 p3, 0x0

    invoke-direct {p1, p2, p3, p0}, Lzhl;-><init>(BLmt5;Ljava/lang/Object;)V

    const/4 p0, 0x3

    invoke-static {p7, p3, p3, p1, p0}, Lna2;->B(Lnx5;Lkotlin/coroutines/CoroutineContext;Lrx5;Lkotlin/jvm/functions/Function2;I)Ld3k;

    return-void
.end method


# virtual methods
.method public final a(Ljava/lang/String;Lnt5;)Ljava/lang/Object;
    .registers 8

    instance-of v0, p2, Lt6o;

    if-eqz v0, :cond_13

    move-object v0, p2

    check-cast v0, Lt6o;

    iget v1, v0, Lt6o;->w:I

    const/high16 v2, -0x80000000

    and-int v3, v1, v2

    if-eqz v3, :cond_13

    sub-int/2addr v1, v2

    iput v1, v0, Lt6o;->w:I

    goto :goto_18

    :cond_13
    new-instance v0, Lt6o;

    invoke-direct {v0, p0, p2}, Lt6o;-><init>(Lw6o;Lnt5;)V

    :goto_18
    iget-object p2, v0, Lt6o;->u:Ljava/lang/Object;

    sget-object v1, Lpx5;->a:Lpx5;

    iget v2, v0, Lt6o;->w:I

    iget-object v3, p0, Lw6o;->n:Ljava/util/LinkedHashMap;

    const/4 v4, 0x1

    if-eqz v2, :cond_32

    if-ne v2, v4, :cond_2b

    iget-object p1, v0, Lt6o;->t:Ljava/lang/String;

    invoke-static {p2}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_51

    :cond_2b
    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    const/4 p0, 0x0

    return-object p0

    :cond_32
    invoke-static {p2}, Lybh;->y(Ljava/lang/Object;)V

    invoke-virtual {v3, p1}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/util/Set;

    if-eqz p2, :cond_3e

    return-object p2

    :cond_3e
    iget-object p0, p0, Lw6o;->m:Lzyk;

    invoke-virtual {p0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lq7o;

    iput-object p1, v0, Lt6o;->t:Ljava/lang/String;

    iput v4, v0, Lt6o;->w:I

    invoke-virtual {p0, p1, v0}, Lq7o;->b(Ljava/lang/String;Lnt5;)Ljava/lang/Object;

    move-result-object p2

    if-ne p2, v1, :cond_51

    return-object v1

    :cond_51
    :goto_51
    check-cast p2, Ljava/lang/Iterable;

    sget-object p0, Lr7o;->e:Lavj;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    invoke-interface {p2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p2

    :cond_5e
    :goto_5e
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_83

    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Number;

    invoke-virtual {v1}, Ljava/lang/Number;->longValue()J

    move-result-wide v1

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v4, Lr7o;->f:Ljava/util/LinkedHashMap;

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {v4, v1}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lr7o;

    if-eqz v1, :cond_5e

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_5e

    :cond_83
    invoke-static {v0}, Lkotlin/collections/CollectionsKt;->n0(Ljava/lang/Iterable;)Ljava/util/Set;

    move-result-object p0

    invoke-interface {v3, p1, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-object p0
.end method

.method public final b(J)Z
    .registers 6

    iget-object p0, p0, Lw6o;->d:Lhx5;

    invoke-virtual {p0}, Lekc;->g()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/util/List;

    if-eqz p0, :cond_37

    check-cast p0, Ljava/lang/Iterable;

    instance-of v0, p0, Ljava/util/Collection;

    if-eqz v0, :cond_19

    move-object v0, p0

    check-cast v0, Ljava/util/Collection;

    invoke-interface {v0}, Ljava/util/Collection;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_37

    :cond_19
    invoke-interface {p0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_1d
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_37

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lkpc;

    iget-object v1, v0, Lkpc;->b:Lapc;

    sget-object v2, Lapc;->c:Lapc;

    if-ne v1, v2, :cond_1d

    iget-wide v0, v0, Lkpc;->a:J

    cmp-long v0, v0, p1

    if-nez v0, :cond_1d

    const/4 p0, 0x1

    return p0

    :cond_37
    const/4 p0, 0x0

    return p0
.end method

.method public final c(Lp6o;)V
    .registers 7

    iget-object p0, p0, Lw6o;->h:Lxz6;

    iget-boolean v0, p0, Lxz6;->b:Z

    if-eqz v0, :cond_45

    iget-object v0, p0, Lxz6;->a:Lx5f;

    if-eqz p1, :cond_42

    instance-of v1, p1, Lo6o;

    if-eqz v1, :cond_11

    const-string p1, "follow_national_team"

    goto :goto_1e

    :cond_11
    instance-of v1, p1, Li6o;

    if-eqz v1, :cond_18

    const-string p1, "follow_national_team_gb"

    goto :goto_1e

    :cond_18
    instance-of p1, p1, Lk7o;

    if-eqz p1, :cond_42

    const-string p1, "pick_favorite_team"

    :goto_1e
    iget-boolean v1, v0, Lx5f;->h:Z

    if-eqz v1, :cond_3e

    iget-object v1, v0, Lx5f;->d:Lzpa;

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v2

    new-instance v3, Lck0;

    invoke-direct {v3, v1, v2}, Lck0;-><init>(Lzpa;Lx56;)V

    invoke-virtual {v3}, Lck0;->d()Ltd0;

    move-result-object v1

    new-instance v3, Lzbe;

    const/16 v4, 0x18

    invoke-direct {v3, v4}, Lzbe;-><init>(B)V

    invoke-virtual {v1, p1, v3}, Ltd0;->d(Ljava/lang/String;Lkotlin/jvm/functions/Function1;)V

    invoke-virtual {v0, v2}, Lx5f;->U0(Lx56;)V

    :cond_3e
    const/4 p1, 0x0

    iput-boolean p1, p0, Lxz6;->b:Z

    return-void

    :cond_42
    invoke-static {}, Lh9o;->p()V

    :cond_45
    return-void
.end method

.method public final d(Lsk4;)V
    .registers 8

    iget-object v0, p0, Lw6o;->h:Lxz6;

    iget-boolean v1, v0, Lxz6;->c:Z

    const/4 v2, 0x1

    if-eqz v1, :cond_2e

    iget-object v1, v0, Lxz6;->a:Lx5f;

    invoke-static {p1}, Lxz6;->a(Lsk4;)Ljava/lang/String;

    move-result-object p1

    iget-boolean v3, v1, Lx5f;->h:Z

    if-eqz v3, :cond_2b

    iget-object v3, v1, Lx5f;->d:Lzpa;

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v4

    new-instance v5, Lck0;

    invoke-direct {v5, v3, v4}, Lck0;-><init>(Lzpa;Lx56;)V

    invoke-virtual {v5}, Lck0;->d()Ltd0;

    move-result-object v3

    new-instance v5, Lw5f;

    invoke-direct {v5, v2}, Lw5f;-><init>(B)V

    invoke-virtual {v3, p1, v5}, Ltd0;->d(Ljava/lang/String;Lkotlin/jvm/functions/Function1;)V

    invoke-virtual {v1, v4}, Lx5f;->U0(Lx56;)V

    :cond_2b
    const/4 p1, 0x0

    iput-boolean p1, v0, Lxz6;->c:Z

    :cond_2e
    iget-object p1, p0, Lw6o;->e:Lrs6;

    iget-object p1, p1, Lrs6;->a:Lb59;

    invoke-virtual {p1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/content/SharedPreferences;

    invoke-interface {p1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    const-string v0, "world_cup_promo_card_dismissed"

    invoke-interface {p1, v0, v2}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    invoke-interface {p1}, Landroid/content/SharedPreferences$Editor;->apply()V

    invoke-virtual {p0}, Lw6o;->f()V

    return-void
.end method

.method public final e(Landroid/content/Context;JLsk4;)V
    .registers 11

    iget-object v0, p0, Lw6o;->c:Lfs6;

    iget-object v0, v0, Lfs6;->a:Lcom/opera/android/settings/SettingsManager;

    const-string v1, "live_scores_enabled"

    const/4 v2, 0x1

    invoke-virtual {v0, v2, v1}, Lcom/opera/android/settings/SettingsManager;->V(ILjava/lang/String;)V

    iget-object v0, p0, Lw6o;->h:Lxz6;

    iget-object v0, v0, Lxz6;->a:Lx5f;

    invoke-static {p4}, Lxz6;->a(Lsk4;)Ljava/lang/String;

    move-result-object p4

    iget-boolean v1, v0, Lx5f;->h:Z

    if-eqz v1, :cond_32

    iget-object v1, v0, Lx5f;->d:Lzpa;

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v3

    new-instance v4, Lck0;

    invoke-direct {v4, v1, v3}, Lck0;-><init>(Lzpa;Lx56;)V

    invoke-virtual {v4}, Lck0;->d()Ltd0;

    move-result-object v1

    new-instance v4, Lzbe;

    const/16 v5, 0x12

    invoke-direct {v4, v5}, Lzbe;-><init>(B)V

    invoke-virtual {v1, p4, v4}, Ltd0;->d(Ljava/lang/String;Lkotlin/jvm/functions/Function1;)V

    invoke-virtual {v0, v3}, Lx5f;->U0(Lx56;)V

    :cond_32
    new-instance p4, Lmqc;

    invoke-static {p2, p3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p2

    invoke-direct {p4, p2}, Lmqc;-><init>(Ljava/lang/Long;)V

    const/4 p2, 0x0

    iget-object p3, p0, Lw6o;->f:Ltn;

    invoke-virtual {p3, p1, p4, p2}, Ltn;->D(Landroid/content/Context;Ltc2;Ljava/lang/Runnable;)V

    iget-object p1, p0, Lw6o;->e:Lrs6;

    iget-object p1, p1, Lrs6;->a:Lb59;

    invoke-virtual {p1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/content/SharedPreferences;

    invoke-interface {p1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    const-string p2, "world_cup_promo_card_dismissed"

    invoke-interface {p1, p2, v2}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    invoke-interface {p1}, Landroid/content/SharedPreferences$Editor;->apply()V

    invoke-virtual {p0}, Lw6o;->f()V

    return-void
.end method

.method public final f()V
    .registers 10

    iget-object v0, p0, Lw6o;->l:Lrlh;

    iget-object v0, v0, Lrlh;->a:Lnak;

    invoke-virtual {v0}, Lnak;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    sget-object v1, Lwze;->a:Lwze;

    iget-object v2, p0, Lw6o;->i:Lnak;

    const/4 v3, 0x0

    if-eqz v0, :cond_46

    iget-object v0, p0, Lw6o;->b:Lxnc;

    iget-object v4, v0, Lxnc;->a:Lkze;

    invoke-virtual {v4}, Lekc;->g()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Boolean;

    invoke-virtual {v4}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v4

    if-eqz v4, :cond_46

    iget-object v0, v0, Lxnc;->b:Lkze;

    invoke-virtual {v0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_46

    iget-object v0, p0, Lw6o;->e:Lrs6;

    iget-object v0, v0, Lrs6;->a:Lb59;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/SharedPreferences;

    const-string v4, "world_cup_promo_card_dismissed"

    const/4 v5, 0x0

    invoke-interface {v0, v4, v5}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_56

    :cond_46
    iget-object p0, p0, Lw6o;->o:Ls6o;

    if-eqz p0, :cond_4f

    iget-object p0, p0, Ls6o;->b:Ld3k;

    invoke-virtual {p0, v3}, Lxob;->k(Ljava/util/concurrent/CancellationException;)V

    :cond_4f
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v2, v3, v1}, Lnak;->k(Ljava/lang/Object;Ljava/lang/Object;)Z

    return-void

    :cond_56
    iget-object v0, p0, Lw6o;->a:Ll45;

    invoke-virtual {v0}, Ll45;->A()Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_6e

    iget-object p0, p0, Lw6o;->o:Ls6o;

    if-eqz p0, :cond_67

    iget-object p0, p0, Ls6o;->b:Ld3k;

    invoke-virtual {p0, v3}, Lxob;->k(Ljava/util/concurrent/CancellationException;)V

    :cond_67
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v2, v3, v1}, Lnak;->k(Ljava/lang/Object;Ljava/lang/Object;)Z

    return-void

    :cond_6e
    const-string v4, "gb"

    invoke-virtual {v0, v4}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v6

    iget-object v7, p0, Lw6o;->c:Lfs6;

    if-eqz v6, :cond_d2

    iget-object v0, p0, Lw6o;->o:Ls6o;

    if-eqz v0, :cond_81

    iget-object v0, v0, Ls6o;->b:Ld3k;

    invoke-virtual {v0, v3}, Lxob;->k(Ljava/util/concurrent/CancellationException;)V

    :cond_81
    iget-object v0, v7, Lfs6;->d:Ljze;

    invoke-virtual {v0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_c9

    sget-object v0, Lr7o;->e:Lavj;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v0, Lr7o;->h:Lr7o;

    sget-object v4, Lr7o;->i:Lr7o;

    filled-new-array {v0, v4}, [Lr7o;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    check-cast v0, Ljava/lang/Iterable;

    instance-of v4, v0, Ljava/util/Collection;

    if-eqz v4, :cond_af

    move-object v4, v0

    check-cast v4, Ljava/util/Collection;

    invoke-interface {v4}, Ljava/util/Collection;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_c9

    :cond_af
    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_b3
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_c9

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lr7o;

    iget v4, v4, Lr7o;->b:I

    int-to-long v4, v4

    invoke-virtual {p0, v4, v5}, Lw6o;->b(J)Z

    move-result v4

    if-eqz v4, :cond_b3

    goto :goto_cb

    :cond_c9
    sget-object v1, Lpk4;->a:Lpk4;

    :goto_cb
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v2, v3, v1}, Lnak;->k(Ljava/lang/Object;Ljava/lang/Object;)Z

    return-void

    :cond_d2
    sget-object v6, Lr7o;->e:Lavj;

    invoke-virtual {v6}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v0, v4}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_ea

    sget-object v4, Lr7o;->h:Lr7o;

    sget-object v6, Lr7o;->i:Lr7o;

    filled-new-array {v4, v6}, [Lr7o;

    move-result-object v4

    invoke-static {v4}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v4

    goto :goto_fa

    :cond_ea
    sget-object v4, Lr7o;->g:Ljava/util/LinkedHashMap;

    sget-object v6, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {v0, v6}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v6}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    invoke-static {v4}, Lj95;->i(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v4

    :goto_fa
    move-object v6, v4

    check-cast v6, Ljava/util/Collection;

    invoke-interface {v6}, Ljava/util/Collection;->isEmpty()Z

    move-result v6

    iget-object v8, p0, Lw6o;->o:Ls6o;

    if-nez v6, :cond_135

    if-eqz v8, :cond_10c

    iget-object v0, v8, Ls6o;->b:Ld3k;

    invoke-virtual {v0, v3}, Lxob;->k(Ljava/util/concurrent/CancellationException;)V

    :cond_10c
    invoke-static {v4}, Lkotlin/collections/CollectionsKt;->K(Ljava/util/List;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lr7o;

    iget-object v4, v7, Lfs6;->d:Ljze;

    invoke-virtual {v4}, Lekc;->g()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Boolean;

    invoke-virtual {v4}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v4

    if-eqz v4, :cond_129

    iget v4, v0, Lr7o;->b:I

    int-to-long v4, v4

    invoke-virtual {p0, v4, v5}, Lw6o;->b(J)Z

    move-result p0

    if-nez p0, :cond_12e

    :cond_129
    new-instance v1, Lqk4;

    invoke-direct {v1, v0}, Lqk4;-><init>(Lr7o;)V

    :cond_12e
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v2, v3, v1}, Lnak;->k(Ljava/lang/Object;Ljava/lang/Object;)Z

    return-void

    :cond_135
    if-eqz v8, :cond_13a

    iget-object v1, v8, Ls6o;->a:Ljava/lang/String;

    goto :goto_13b

    :cond_13a
    move-object v1, v3

    :goto_13b
    invoke-static {v1, v0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_16c

    if-eqz v8, :cond_148

    iget-object v1, v8, Ls6o;->b:Ld3k;

    invoke-virtual {v1, v3}, Lxob;->k(Ljava/util/concurrent/CancellationException;)V

    :cond_148
    new-instance v1, Lbhj;

    invoke-direct {v1, p0, v0, v3}, Lbhj;-><init>(Lw6o;Ljava/lang/String;Lmt5;)V

    const/4 v2, 0x3

    iget-object v4, p0, Lw6o;->g:Lddc;

    invoke-static {v4, v3, v3, v1, v2}, Lna2;->B(Lnx5;Lkotlin/coroutines/CoroutineContext;Lrx5;Lkotlin/jvm/functions/Function2;I)Ld3k;

    move-result-object v1

    new-instance v2, Lq6o;

    invoke-direct {v2, p0, v5}, Lq6o;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v1, v2}, Lxob;->s(Lkotlin/jvm/functions/Function1;)Lxb7;

    new-instance v2, Ls6o;

    invoke-direct {v2, v0, v1}, Ls6o;-><init>(Ljava/lang/String;Ld3k;)V

    iput-object v2, p0, Lw6o;->o:Ls6o;

    invoke-virtual {v1}, Lxob;->h0()Z

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_16c

    iput-object v3, p0, Lw6o;->o:Ls6o;

    :cond_16c
    return-void
.end method

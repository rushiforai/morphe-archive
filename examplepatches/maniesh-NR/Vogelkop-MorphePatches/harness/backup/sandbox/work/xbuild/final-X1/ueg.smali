.class public final Lueg;
.super Lgtg;
.source "SourceFile"


# instance fields
.field public final d:Ldl;

.field public final e:Lwy;

.field public f:Z

.field public g:Z

.field public final h:Ljava/util/ArrayList;

.field public i:Lbz;

.field public j:Lbz;


# direct methods
.method public constructor <init>(Ldl;Lwy;Lr9g;)V
    .registers 5

    invoke-direct {p0, p3}, Lgtg;-><init>(Lr9g;)V

    const/4 p3, 0x1

    iput-boolean p3, p0, Lueg;->f:Z

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0, p3}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v0, p0, Lueg;->h:Ljava/util/ArrayList;

    iput-object p1, p0, Lueg;->d:Ldl;

    iput-object p2, p0, Lueg;->e:Lwy;

    return-void
.end method


# virtual methods
.method public final a()Z
    .registers 1

    const/4 p0, 0x1

    return p0
.end method

.method public final b()Ls50;
    .registers 3

    iget-object v0, p0, Lueg;->i:Lbz;

    sget-object v1, Ls50;->f:Ls50;

    if-eqz v0, :cond_d

    invoke-interface {v0}, Lbz;->b()Ls50;

    move-result-object v0

    if-eq v0, v1, :cond_d

    return-object v0

    :cond_d
    iget-object v0, p0, Lueg;->j:Lbz;

    if-eqz v0, :cond_18

    invoke-interface {v0}, Lbz;->b()Ls50;

    move-result-object v0

    if-eq v0, v1, :cond_18

    return-object v0

    :cond_18
    iget-boolean p0, p0, Lueg;->g:Z

    if-eqz p0, :cond_1f

    sget-object p0, Ls50;->e:Ls50;

    return-object p0

    :cond_1f
    return-object v1
.end method

.method public final c()I
    .registers 2

    iget-object v0, p0, Lueg;->i:Lbz;

    if-eqz v0, :cond_9

    invoke-interface {v0}, Lbz;->c()I

    move-result p0

    return p0

    :cond_9
    iget-object p0, p0, Lueg;->j:Lbz;

    if-eqz p0, :cond_12

    invoke-interface {p0}, Lbz;->c()I

    move-result p0

    return p0

    :cond_12
    const/4 p0, 0x4

    return p0
.end method

.method public final d(Laz;)Lyz;
    .registers 6

    iget-object v0, p0, Lueg;->i:Lbz;

    iget-object v1, p0, Lueg;->d:Ldl;

    if-eqz v0, :cond_18

    new-instance v2, Ls7o;

    invoke-direct {v2, p1, v1}, Ls7o;-><init>(Laz;Ldl;)V

    invoke-interface {v0, v2}, Lbz;->d(Laz;)Lyz;

    move-result-object v0

    if-eqz v0, :cond_19

    invoke-interface {p1}, Laz;->a()Ldl;

    move-result-object v2

    iput-object v2, v0, Lyz;->p:Ldl;

    goto :goto_19

    :cond_18
    const/4 v0, 0x0

    :cond_19
    :goto_19
    if-nez v0, :cond_3a

    iget-object v2, p0, Lueg;->j:Lbz;

    if-eqz v2, :cond_3a

    iget-object v3, p0, Lueg;->i:Lbz;

    invoke-virtual {v2, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_3a

    iget-object v0, p0, Lueg;->j:Lbz;

    new-instance v2, Ls7o;

    invoke-direct {v2, p1, v1}, Ls7o;-><init>(Laz;Ldl;)V

    invoke-interface {v0, v2}, Lbz;->d(Laz;)Lyz;

    move-result-object v0

    if-eqz v0, :cond_3a

    invoke-interface {p1}, Laz;->a()Ldl;

    move-result-object v1

    iput-object v1, v0, Lyz;->p:Ldl;

    :cond_3a
    if-nez v0, :cond_41

    invoke-virtual {p0, p1}, Lueg;->m(Laz;)Lyz;

    move-result-object p0

    return-object p0

    :cond_41
    return-object v0
.end method

.method public final e(Lzy;Laz;)V
    .registers 5

    new-instance v0, Lteg;

    invoke-direct {v0, p0, p1, p2}, Lteg;-><init>(Lueg;Lzy;Laz;)V

    iget-object p1, p0, Lueg;->i:Lbz;

    if-eqz p1, :cond_17

    const/4 v1, 0x0

    iput-object v1, p0, Lueg;->i:Lbz;

    new-instance v1, Ls7o;

    iget-object p0, p0, Lueg;->d:Ldl;

    invoke-direct {v1, p2, p0}, Ls7o;-><init>(Laz;Ldl;)V

    invoke-interface {p1, v0, v1}, Lbz;->e(Lzy;Laz;)V

    return-void

    :cond_17
    invoke-virtual {p0, v0, p2}, Lueg;->n(Lteg;Laz;)V

    return-void
.end method

.method public final j(Lsx;Ldl;)V
    .registers 7

    iget-object v0, p0, Lueg;->i:Lbz;

    const/4 v1, 0x0

    if-eqz v0, :cond_b

    iget-object p0, p0, Lueg;->d:Ldl;

    invoke-interface {v0, p0}, Lbz;->g(Ldl;)V

    goto :goto_16

    :cond_b
    new-instance v0, Lm43;

    const/4 v2, 0x1

    sget-object v3, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    invoke-direct {v0, p2, v1, v2, v3}, Lm43;-><init>(Ldl;Ljava/lang/String;ILjava/util/List;)V

    invoke-virtual {p0, v1, v0}, Lueg;->n(Lteg;Laz;)V

    :goto_16
    invoke-virtual {p1, v1}, Lsx;->onFailed(Ljava/lang/String;)V

    return-void
.end method

.method public final k(Ljava/lang/String;)Z
    .registers 3

    iget-boolean v0, p0, Lueg;->g:Z

    if-nez v0, :cond_12

    iget-object p0, p0, Lueg;->i:Lbz;

    instance-of v0, p0, Lgtg;

    if-eqz v0, :cond_14

    check-cast p0, Lgtg;

    invoke-virtual {p0, p1}, Lgtg;->k(Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_14

    :cond_12
    const/4 p0, 0x1

    return p0

    :cond_14
    const/4 p0, 0x0

    return p0
.end method

.method public final l(Laz;)Ljava/util/List;
    .registers 9

    invoke-interface {p1}, Laz;->e()Z

    move-result v0

    if-eqz v0, :cond_9

    sget-object p0, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    return-object p0

    :cond_9
    iget-object v0, p0, Lueg;->e:Lwy;

    iget-object v1, v0, Lwy;->h:Li3j;

    iget-object v0, p0, Lueg;->d:Ldl;

    iget-object v2, v0, Ldl;->d:Ljava/util/SortedSet;

    iget-object v3, v0, Ldl;->e:Ljava/util/SortedSet;

    iget-boolean v5, p0, Lueg;->f:Z

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    move-object v4, p1

    invoke-virtual/range {v1 .. v6}, Li3j;->v(Ljava/util/Set;Ljava/util/Set;Laz;ZLjava/util/ArrayList;)Z

    move-result p0

    if-eqz p0, :cond_27

    invoke-virtual {v1}, Li3j;->u()V

    :cond_27
    new-instance p0, Lc9;

    const/4 p1, 0x2

    invoke-direct {p0, p1}, Lc9;-><init>(B)V

    invoke-static {v6, p0}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    return-object v6
.end method

.method public final m(Laz;)Lyz;
    .registers 10

    invoke-interface {p1}, Laz;->e()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_8

    return-object v1

    :cond_8
    iget-object v0, p0, Lueg;->e:Lwy;

    iget-object v2, v0, Lwy;->h:Li3j;

    iget-object v0, p0, Lueg;->d:Ldl;

    iget-object v3, v0, Ldl;->d:Ljava/util/SortedSet;

    iget-object v4, v0, Ldl;->e:Ljava/util/SortedSet;

    iget-boolean v6, p0, Lueg;->f:Z

    iget-object p0, v2, Li3j;->b:Ljava/lang/Object;

    check-cast p0, Ljava/util/HashMap;

    new-instance v7, Ljava/util/ArrayList;

    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    move-object v5, p1

    invoke-virtual/range {v2 .. v7}, Li3j;->v(Ljava/util/Set;Ljava/util/Set;Laz;ZLjava/util/ArrayList;)Z

    move-result p1

    invoke-virtual {v7}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_2e

    if-eqz p1, :cond_59

    invoke-virtual {v2}, Li3j;->u()V

    goto :goto_59

    :cond_2e
    new-instance p1, Lc9;

    const/4 v0, 0x2

    invoke-direct {p1, v0}, Lc9;-><init>(B)V

    invoke-static {v7, p1}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    const/4 p1, 0x0

    invoke-virtual {v7, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    move-object v1, p1

    check-cast v1, Lyz;

    new-instance p1, Lpx;

    invoke-direct {p1, v1}, Lpx;-><init>(Lyz;)V

    invoke-virtual {p0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    invoke-interface {v0, v1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_56

    invoke-virtual {p0, p1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    :cond_56
    invoke-virtual {v2}, Li3j;->u()V

    :cond_59
    :goto_59
    if-eqz v1, :cond_61

    invoke-interface {v5}, Laz;->a()Ldl;

    move-result-object p0

    iput-object p0, v1, Lyz;->p:Ldl;

    :cond_61
    return-object v1
.end method

.method public final n(Lteg;Laz;)V
    .registers 20

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    if-eqz v1, :cond_12

    new-instance v2, Llyf;

    move-object/from16 v3, p2

    invoke-direct {v2, v1, v3}, Llyf;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    iget-object v1, v0, Lueg;->h:Ljava/util/ArrayList;

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_12
    iget-boolean v1, v0, Lueg;->g:Z

    if-nez v1, :cond_127

    const/4 v1, 0x1

    iput-boolean v1, v0, Lueg;->g:Z

    iget-object v2, v0, Lueg;->e:Lwy;

    iget-object v2, v2, Lwy;->e:Lvzk;

    new-instance v3, Lo8f;

    const/16 v4, 0x16

    invoke-direct {v3, v0, v4}, Lo8f;-><init>(Ljava/lang/Object;B)V

    iget-object v2, v2, Lvzk;->b:Ljava/lang/Object;

    move-object v5, v2

    check-cast v5, Lami;

    iget-object v2, v5, Lami;->g:Ljava/lang/Object;

    check-cast v2, Lsy;

    iget-object v4, v5, Lami;->e:Ljava/lang/Object;

    check-cast v4, Lvzk;

    new-instance v6, Lxx;

    iget-object v0, v0, Lueg;->d:Ldl;

    iget-object v0, v0, Ldl;->c:Ljava/lang/String;

    const-string v7, "null,null"

    invoke-direct {v6, v0, v7}, Llyf;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    iget-object v0, v5, Lami;->b:Ljava/lang/Object;

    check-cast v0, Ljava/util/HashMap;

    invoke-virtual {v0, v6}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lzo;

    const/4 v8, 0x0

    if-nez v7, :cond_d0

    iget-object v7, v5, Lami;->f:Ljava/lang/Object;

    check-cast v7, Lb59;

    invoke-virtual {v7}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Landroid/content/SharedPreferences;

    invoke-static {v6}, Lami;->g(Lxx;)Ljava/lang/String;

    move-result-object v9

    const-string v10, "_timestamp"

    invoke-virtual {v9, v10}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    const-wide/16 v11, 0x0

    invoke-interface {v7, v10, v11, v12}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v13

    cmp-long v10, v13, v11

    if-eqz v10, :cond_76

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v10

    const-wide/32 v15, 0x4d3f6400

    add-long/2addr v13, v15

    cmp-long v10, v10, v13

    if-lez v10, :cond_78

    invoke-static {v7, v9}, Lami;->s(Landroid/content/SharedPreferences;Ljava/lang/String;)V

    :cond_76
    :goto_76
    move-object v7, v8

    goto :goto_d0

    :cond_78
    const-string v10, "_url"

    invoke-virtual {v9, v10}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    invoke-interface {v7, v10, v8}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    if-eqz v10, :cond_9c

    invoke-virtual {v2}, Lsy;->get()Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Lr9i;

    iget-object v11, v11, Lr9i;->c:Ljava/lang/Object;

    check-cast v11, Landroid/net/Uri;

    invoke-virtual {v11}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-nez v10, :cond_9c

    invoke-static {v7, v9}, Lami;->s(Landroid/content/SharedPreferences;Ljava/lang/String;)V

    goto :goto_76

    :cond_9c
    const-string v10, "_data"

    invoke-virtual {v9, v10}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    const-string v10, ""

    invoke-interface {v7, v9, v10}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    iget-object v9, v6, Llyf;->a:Ljava/lang/Object;

    check-cast v9, Ljava/lang/String;

    new-instance v10, Lix5;

    const/16 v11, 0x15

    invoke-direct {v10, v11}, Lix5;-><init>(B)V

    invoke-static {v7, v9, v10, v1}, Lzo;->a(Ljava/lang/String;Ljava/lang/String;Lgm;Z)Lzo;

    move-result-object v7

    if-eqz v7, :cond_76

    iget-object v9, v6, Llyf;->a:Ljava/lang/Object;

    check-cast v9, Ljava/lang/String;

    iget-object v10, v4, Lvzk;->a:Ljava/lang/Object;

    check-cast v10, Lcy;

    invoke-virtual {v10}, Lcy;->c()Lml;

    move-result-object v10

    iget-object v10, v10, Lml;->j:Ljava/util/HashSet;

    invoke-virtual {v10, v9}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_76

    invoke-virtual {v0, v6, v7}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_d0
    :goto_d0
    iget-object v0, v5, Lami;->h:Ljava/lang/Object;

    check-cast v0, Lwjh;

    if-eqz v7, :cond_d8

    move v10, v1

    goto :goto_d9

    :cond_d8
    const/4 v10, 0x0

    :goto_d9
    iget-object v11, v0, Lwjh;->f:Ljava/lang/Object;

    check-cast v11, Lo59;

    if-eqz v11, :cond_f9

    iget-wide v12, v11, Lo59;->e:J

    const-wide/16 v14, -0x1

    cmp-long v12, v12, v14

    if-gtz v12, :cond_f9

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v12

    iget-object v14, v0, Lwjh;->f:Ljava/lang/Object;

    check-cast v14, Lo59;

    iget-wide v8, v14, Lo59;->b:J

    sub-long/2addr v12, v8

    iput-wide v12, v11, Lo59;->e:J

    iput-boolean v10, v14, Lo59;->n:Z

    invoke-virtual {v0}, Lwjh;->p()V

    :cond_f9
    if-eqz v7, :cond_109

    invoke-virtual {v3, v7}, Lo8f;->run(Ljava/lang/Object;)V

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v8

    iget-wide v10, v7, Lzo;->c:J

    cmp-long v0, v8, v10

    if-ltz v0, :cond_127

    const/4 v3, 0x0

    :cond_109
    iget-object v0, v5, Lami;->c:Ljava/lang/Object;

    check-cast v0, Ljava/util/HashMap;

    invoke-virtual {v0, v6}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/util/List;

    if-eqz v7, :cond_117

    move v9, v1

    goto :goto_120

    :cond_117
    new-instance v7, Ljava/util/ArrayList;

    invoke-direct {v7, v1}, Ljava/util/ArrayList;-><init>(I)V

    invoke-virtual {v0, v6, v7}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const/4 v9, 0x0

    :goto_120
    if-eqz v3, :cond_125

    invoke-interface {v7, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_125
    if-eqz v9, :cond_128

    :cond_127
    return-void

    :cond_128
    invoke-virtual {v2}, Lsy;->get()Ljava/lang/Object;

    move-result-object v0

    move-object v7, v0

    check-cast v7, Lr9i;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v8

    iget-object v0, v4, Lvzk;->d:Ljava/lang/Object;

    check-cast v0, Li5o;

    iget-object v2, v5, Lami;->d:Ljava/lang/Object;

    check-cast v2, Landroid/content/Context;

    iget-object v3, v6, Llyf;->a:Ljava/lang/Object;

    check-cast v3, Ljava/lang/String;

    new-instance v4, Lyx;

    invoke-direct/range {v4 .. v9}, Lyx;-><init>(Lami;Lxx;Lr9i;J)V

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object v5, v7, Lr9i;->c:Ljava/lang/Object;

    check-cast v5, Landroid/net/Uri;

    invoke-virtual {v5}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    move-result-object v5

    const-string v6, "pid"

    invoke-virtual {v5, v6, v3}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    invoke-static {v2}, Lcom/opera/android/utilities/DisplayUtil;->c(Landroid/content/Context;)I

    move-result v6

    invoke-static {v6}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v6

    const-string v8, "w"

    invoke-virtual {v5, v8, v6}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    invoke-static {v2}, Lcom/opera/android/utilities/DisplayUtil;->b(Landroid/content/Context;)I

    move-result v2

    invoke-static {v2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    const-string v6, "h"

    invoke-virtual {v5, v6, v2}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    iget-object v2, v0, Li5o;->a:Ljava/lang/Object;

    check-cast v2, Liy;

    new-instance v6, Lpy;

    new-instance v8, Lqy;

    iget-object v7, v7, Lr9i;->d:Ljava/lang/Object;

    check-cast v7, Landroid/net/Uri;

    invoke-direct {v8, v0, v1, v7, v3}, Loy;-><init>(Li5o;ILandroid/net/Uri;Ljava/lang/String;)V

    new-instance v1, Lbi;

    const/16 v3, 0xd

    invoke-direct {v1, v4, v3}, Lbi;-><init>(Ljava/lang/Object;B)V

    invoke-direct {v6, v0, v5, v8, v1}, Lpy;-><init>(Li5o;Landroid/net/Uri$Builder;Lqy;Lbi;)V

    invoke-virtual {v2, v6}, Liy;->d(Ljava/lang/Runnable;)Ljava/lang/Runnable;

    return-void
.end method

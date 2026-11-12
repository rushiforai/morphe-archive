.class public final Lhp4;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lk7j;
.implements Lq8j;
.implements Llp4;


# instance fields
.field public final a:Lisd;

.field public b:Lqtm;

.field public c:Z

.field public d:Z

.field public final synthetic e:Lip4;


# direct methods
.method public constructor <init>(Lip4;Lisd;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lhp4;->e:Lip4;

    iput-object p2, p0, Lhp4;->a:Lisd;

    iget-object p1, p1, Lip4;->l:Lstm;

    invoke-virtual {p1, p0}, Lt7j;->b(Lq8j;)V

    return-void
.end method


# virtual methods
.method public final a()V
    .registers 1

    iget-object p0, p0, Lhp4;->e:Lip4;

    invoke-virtual {p0}, Lt7j;->c()V

    return-void
.end method

.method public final b()V
    .registers 2

    const/4 v0, 0x1

    iput-boolean v0, p0, Lhp4;->c:Z

    return-void
.end method

.method public final c(Ljava/lang/Object;)V
    .registers 5

    check-cast p1, Lqtm;

    iget-boolean v0, p0, Lhp4;->c:Z

    if-nez v0, :cond_1f

    if-nez p1, :cond_e

    const/4 p1, 0x0

    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lhp4;->e(Lfp4;Z)V

    return-void

    :cond_e
    iput-object p1, p0, Lhp4;->b:Lqtm;

    iget-object p1, p0, Lhp4;->e:Lip4;

    iget-boolean v0, p1, Lip4;->o:Z

    invoke-virtual {p0}, Lhp4;->g()Z

    move-result v1

    if-eqz v1, :cond_20

    invoke-virtual {p0}, Lhp4;->f()V

    if-nez v0, :cond_20

    :cond_1f
    return-void

    :cond_20
    iget-object p1, p1, Lip4;->k:Ls9i;

    iget-object v0, p0, Lhp4;->b:Lqtm;

    new-instance v1, Lmp4;

    iget-object v2, p1, Ls9i;->b:Ljava/lang/Object;

    check-cast v2, Landroid/content/Context;

    iget-object p1, p1, Ls9i;->c:Ljava/lang/Object;

    check-cast p1, Lga6;

    invoke-direct {v1, v2, p1, v0}, Lmp4;-><init>(Landroid/content/Context;Lywh;Lqtm;)V

    invoke-virtual {v1, p0}, Lmp4;->Q(Llp4;)V

    return-void
.end method

.method public final d(Ljava/util/ArrayList;Z)V
    .registers 19

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    iget-boolean v2, v0, Lhp4;->c:Z

    if-nez v2, :cond_21

    if-eqz p2, :cond_e

    iget-boolean v2, v0, Lhp4;->d:Z

    if-nez v2, :cond_21

    :cond_e
    const/4 v2, 0x0

    sget-object v3, Lyqe;->d:Lyqe;

    const/4 v4, 0x1

    if-nez v1, :cond_3e

    invoke-virtual {v0}, Lhp4;->g()Z

    move-result v1

    if-eqz v1, :cond_22

    iget-boolean v1, v0, Lhp4;->d:Z

    if-nez v1, :cond_21

    invoke-virtual {v0}, Lhp4;->f()V

    :cond_21
    return-void

    :cond_22
    new-instance v9, Ljava/util/ArrayList;

    invoke-direct {v9, v4}, Ljava/util/ArrayList;-><init>(I)V

    invoke-virtual {v9, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    new-instance v3, Lfp4;

    iget-object v1, v0, Lhp4;->b:Lqtm;

    iget-object v4, v1, Ld93;->a:Lyla;

    iget-wide v5, v1, Ld93;->b:J

    iget-object v7, v1, Ld93;->c:Ljava/lang/String;

    iget-object v8, v1, Lqtm;->d:Ljava/lang/String;

    move-object v10, v9

    invoke-direct/range {v3 .. v10}, Lfp4;-><init>(Lyla;JLjava/lang/String;Ljava/lang/String;Ljava/util/List;Ljava/util/List;)V

    invoke-virtual {v0, v3, v2}, Lhp4;->e(Lfp4;Z)V

    return-void

    :cond_3e
    iget-object v5, v0, Lhp4;->b:Lqtm;

    iget-object v6, v5, Ld93;->a:Lyla;

    iget-object v6, v6, Lyla;->a:Ljava/net/URL;

    iget-object v7, v0, Lhp4;->e:Lip4;

    iget-object v8, v7, Lip4;->j:Lta7;

    iget-object v7, v7, Lip4;->j:Lta7;

    iget-wide v9, v5, Ld93;->b:J

    invoke-virtual {v8}, Lta7;->s()Landroid/content/SharedPreferences;

    move-result-object v5

    invoke-interface {v5}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v5

    const-string v8, "categories_features"

    invoke-interface {v5, v8, v9, v10}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    move-result-object v5

    invoke-interface {v5}, Landroid/content/SharedPreferences$Editor;->apply()V

    iget-object v5, v0, Lhp4;->b:Lqtm;

    iget-object v5, v5, Ld93;->c:Ljava/lang/String;

    invoke-virtual {v7}, Lta7;->s()Landroid/content/SharedPreferences;

    move-result-object v8

    invoke-interface {v8}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v8

    const-string v9, "categories_config_bundle"

    invoke-interface {v8, v9, v5}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v5

    invoke-interface {v5}, Landroid/content/SharedPreferences$Editor;->apply()V

    iget-object v5, v7, Lta7;->b:Ljava/lang/Object;

    check-cast v5, Li16;

    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v1}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v8

    if-nez v8, :cond_96

    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_96

    new-instance v8, Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v9

    add-int/2addr v9, v4

    invoke-direct {v8, v9}, Ljava/util/ArrayList;-><init>(I)V

    invoke-virtual {v8, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-virtual {v8, v1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    move-object v1, v8

    :cond_96
    invoke-virtual {v5, v2, v2}, Li16;->t(ZZ)Ljava/util/ArrayList;

    move-result-object v3

    invoke-virtual {v5, v2, v4}, Li16;->t(ZZ)Ljava/util/ArrayList;

    move-result-object v8

    invoke-virtual {v5, v4, v2}, Li16;->t(ZZ)Ljava/util/ArrayList;

    move-result-object v9

    new-instance v10, Ljava/util/ArrayList;

    invoke-direct {v10, v9}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v9

    move v11, v2

    :goto_ac
    if-ge v11, v9, :cond_cf

    invoke-virtual {v1, v11}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v12

    add-int/lit8 v11, v11, 0x1

    invoke-virtual {v10, v12}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    move-result v13

    const/4 v14, -0x1

    if-eq v13, v14, :cond_bf

    invoke-virtual {v10, v13, v12}, Ljava/util/ArrayList;->set(ILjava/lang/Object;)Ljava/lang/Object;

    goto :goto_ac

    :cond_bf
    invoke-interface {v1, v12}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    move-result v13

    invoke-virtual {v10}, Ljava/util/ArrayList;->size()I

    move-result v14

    invoke-static {v13, v2, v14}, Lcs5;->t(III)I

    move-result v13

    invoke-virtual {v10, v13, v12}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    goto :goto_ac

    :cond_cf
    new-instance v9, Ljava/util/HashSet;

    invoke-direct {v9}, Ljava/util/HashSet;-><init>()V

    invoke-virtual {v9, v1}, Ljava/util/AbstractCollection;->addAll(Ljava/util/Collection;)Z

    invoke-virtual {v9, v3}, Ljava/util/AbstractCollection;->addAll(Ljava/util/Collection;)Z

    new-instance v11, Ljava/util/ArrayList;

    invoke-virtual {v9}, Ljava/util/HashSet;->size()I

    move-result v12

    invoke-direct {v11, v12}, Ljava/util/ArrayList;-><init>(I)V

    invoke-virtual {v9}, Ljava/util/HashSet;->iterator()Ljava/util/Iterator;

    move-result-object v9

    :goto_e7
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v12

    if-eqz v12, :cond_119

    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Lyqe;

    invoke-virtual {v3, v12}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v13

    new-instance v14, Lop4;

    invoke-interface {v1, v12}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v15

    if-nez v13, :cond_104

    iget-boolean v13, v12, Lyqe;->c:Z

    if-nez v13, :cond_10a

    goto :goto_10c

    :cond_104
    invoke-virtual {v8, v12}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_10c

    :cond_10a
    move v13, v4

    goto :goto_10d

    :cond_10c
    :goto_10c
    move v13, v2

    :goto_10d
    invoke-virtual {v10, v12}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    move-result v2

    invoke-direct {v14, v12, v15, v13, v2}, Lop4;-><init>(Lyqe;ZZI)V

    invoke-virtual {v11, v14}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    const/4 v2, 0x0

    goto :goto_e7

    :cond_119
    new-instance v1, Lyg9;

    const/16 v2, 0x10

    invoke-direct {v1, v2}, Lyg9;-><init>(B)V

    invoke-static {v11, v1}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    iput-object v11, v5, Li16;->c:Ljava/lang/Object;

    iget-object v1, v5, Li16;->b:Ljava/lang/Object;

    check-cast v1, Li32;

    invoke-virtual {v1, v11}, Lldk;->g(Ljava/lang/Object;)V

    const/4 v1, 0x0

    iput-object v1, v7, Lta7;->m:Ljava/lang/Object;

    iput-object v1, v7, Lta7;->h:Ljava/lang/Object;

    invoke-virtual {v7}, Lta7;->s()Landroid/content/SharedPreferences;

    move-result-object v1

    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    const-string v2, "categories_host"

    invoke-static {v6}, Lta7;->q(Ljava/net/URL;)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    invoke-interface {v1}, Landroid/content/SharedPreferences$Editor;->apply()V

    new-instance v8, Lfp4;

    iget-object v1, v0, Lhp4;->b:Lqtm;

    iget-object v9, v1, Ld93;->a:Lyla;

    iget-wide v10, v1, Ld93;->b:J

    iget-object v12, v1, Ld93;->c:Ljava/lang/String;

    iget-object v13, v1, Lqtm;->d:Ljava/lang/String;

    iget-object v1, v7, Lta7;->m:Ljava/lang/Object;

    check-cast v1, Ljava/util/ArrayList;

    if-nez v1, :cond_163

    iget-object v1, v7, Lta7;->b:Ljava/lang/Object;

    check-cast v1, Li16;

    const/4 v2, 0x0

    invoke-virtual {v1, v4, v2}, Li16;->t(ZZ)Ljava/util/ArrayList;

    move-result-object v1

    iput-object v1, v7, Lta7;->m:Ljava/lang/Object;

    :cond_163
    move-object v14, v1

    iget-object v1, v7, Lta7;->h:Ljava/lang/Object;

    check-cast v1, Ljava/util/ArrayList;

    if-nez v1, :cond_174

    iget-object v1, v7, Lta7;->b:Ljava/lang/Object;

    check-cast v1, Li16;

    invoke-virtual {v1, v4, v4}, Li16;->t(ZZ)Ljava/util/ArrayList;

    move-result-object v1

    iput-object v1, v7, Lta7;->h:Ljava/lang/Object;

    :cond_174
    move-object v15, v1

    invoke-direct/range {v8 .. v15}, Lfp4;-><init>(Lyla;JLjava/lang/String;Ljava/lang/String;Ljava/util/List;Ljava/util/List;)V

    invoke-virtual {v0, v8, v4}, Lhp4;->e(Lfp4;Z)V

    return-void
.end method

.method public final e(Lfp4;Z)V
    .registers 5

    iget-boolean v0, p0, Lhp4;->c:Z

    if-eqz v0, :cond_5

    return-void

    :cond_5
    const/4 v0, 0x0

    iget-object v1, p0, Lhp4;->e:Lip4;

    iput-boolean v0, v1, Lip4;->o:Z

    iget-boolean v0, p0, Lhp4;->d:Z

    if-eqz v0, :cond_12

    invoke-virtual {v1}, Lt7j;->c()V

    return-void

    :cond_12
    const/4 v0, 0x1

    iput-boolean v0, p0, Lhp4;->d:Z

    iget-object p0, p0, Lhp4;->a:Lisd;

    invoke-virtual {p0, p1, p2}, Lisd;->E(Ljava/lang/Object;Z)V

    return-void
.end method

.method public final f()V
    .registers 12

    new-instance v0, Lfp4;

    iget-object v1, p0, Lhp4;->b:Lqtm;

    move-object v2, v1

    iget-object v1, v2, Ld93;->a:Lyla;

    move-object v4, v2

    iget-wide v2, v4, Ld93;->b:J

    move-object v5, v4

    iget-object v4, v5, Ld93;->c:Ljava/lang/String;

    iget-object v5, v5, Lqtm;->d:Ljava/lang/String;

    iget-object v6, p0, Lhp4;->e:Lip4;

    iget-object v7, v6, Lip4;->j:Lta7;

    iget-object v8, v7, Lta7;->m:Ljava/lang/Object;

    check-cast v8, Ljava/util/ArrayList;

    const/4 v9, 0x1

    if-nez v8, :cond_25

    iget-object v8, v7, Lta7;->b:Ljava/lang/Object;

    check-cast v8, Li16;

    const/4 v10, 0x0

    invoke-virtual {v8, v9, v10}, Li16;->t(ZZ)Ljava/util/ArrayList;

    move-result-object v8

    iput-object v8, v7, Lta7;->m:Ljava/lang/Object;

    :cond_25
    iget-object v6, v6, Lip4;->j:Lta7;

    iget-object v7, v6, Lta7;->h:Ljava/lang/Object;

    check-cast v7, Ljava/util/ArrayList;

    if-nez v7, :cond_37

    iget-object v7, v6, Lta7;->b:Ljava/lang/Object;

    check-cast v7, Li16;

    invoke-virtual {v7, v9, v9}, Li16;->t(ZZ)Ljava/util/ArrayList;

    move-result-object v7

    iput-object v7, v6, Lta7;->h:Ljava/lang/Object;

    :cond_37
    move-object v6, v8

    invoke-direct/range {v0 .. v7}, Lfp4;-><init>(Lyla;JLjava/lang/String;Ljava/lang/String;Ljava/util/List;Ljava/util/List;)V

    invoke-virtual {p0, v0, v9}, Lhp4;->e(Lfp4;Z)V

    return-void
.end method

.method public final g()Z
    .registers 8

    iget-object v0, p0, Lhp4;->e:Lip4;

    iget-object v1, v0, Lip4;->j:Lta7;

    iget-object v0, v0, Lip4;->j:Lta7;

    iget-object v2, v1, Lta7;->m:Ljava/lang/Object;

    check-cast v2, Ljava/util/ArrayList;

    const/4 v3, 0x0

    const/4 v4, 0x1

    if-nez v2, :cond_18

    iget-object v2, v1, Lta7;->b:Ljava/lang/Object;

    check-cast v2, Li16;

    invoke-virtual {v2, v4, v3}, Li16;->t(ZZ)Ljava/util/ArrayList;

    move-result-object v2

    iput-object v2, v1, Lta7;->m:Ljava/lang/Object;

    :cond_18
    invoke-interface {v2}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_73

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const-string v1, "categories_features"

    :try_start_23
    invoke-virtual {v0}, Lta7;->s()Landroid/content/SharedPreferences;

    move-result-object v2

    const-wide/16 v5, 0x0

    invoke-interface {v2, v1, v5, v6}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v1
    :try_end_2d
    .catch Ljava/lang/ClassCastException; {:try_start_23 .. :try_end_2d} :catch_2e

    goto :goto_37

    :catch_2e
    invoke-virtual {v0}, Lta7;->s()Landroid/content/SharedPreferences;

    move-result-object v2

    invoke-interface {v2, v1, v3}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v1

    int-to-long v1, v1

    :goto_37
    iget-object v5, p0, Lhp4;->b:Lqtm;

    iget-wide v5, v5, Ld93;->b:J

    cmp-long v1, v1, v5

    if-nez v1, :cond_73

    invoke-virtual {v0}, Lta7;->s()Landroid/content/SharedPreferences;

    move-result-object v1

    const-string v2, "categories_config_bundle"

    const/4 v5, 0x0

    invoke-interface {v1, v2, v5}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lhp4;->b:Lqtm;

    iget-object v2, v2, Ld93;->c:Ljava/lang/String;

    invoke-static {v1, v2}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_73

    iget-object p0, p0, Lhp4;->b:Lqtm;

    iget-object p0, p0, Ld93;->a:Lyla;

    iget-object p0, p0, Lyla;->a:Ljava/net/URL;

    invoke-virtual {v0}, Lta7;->s()Landroid/content/SharedPreferences;

    move-result-object v0

    const-string v1, "categories_host"

    invoke-interface {v0, v1, v5}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_68

    move p0, v4

    goto :goto_70

    :cond_68
    invoke-static {p0}, Lta7;->q(Ljava/net/URL;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    :goto_70
    if-eqz p0, :cond_73

    return v4

    :cond_73
    return v3
.end method

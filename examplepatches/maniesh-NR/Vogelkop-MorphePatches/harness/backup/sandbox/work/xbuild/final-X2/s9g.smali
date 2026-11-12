.class public final Ls9g;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lw6f;


# static fields
.field public static h:Ls9g;

.field public static i:I


# instance fields
.field public final a:Lumi;

.field public final b:Lcom/opera/android/settings/SettingsManager;

.field public final c:Lvzk;

.field public final d:Lvzk;

.field public final e:Lk5o;

.field public final f:Li7f;

.field public final g:Ljava/util/HashMap;


# direct methods
.method public constructor <init>(Lumi;Lcom/opera/android/settings/SettingsManager;Lk5o;)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Li7f;

    invoke-direct {v0}, Li7f;-><init>()V

    iput-object v0, p0, Ls9g;->f:Li7f;

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Ls9g;->g:Ljava/util/HashMap;

    iput-object p1, p0, Ls9g;->a:Lumi;

    iput-object p2, p0, Ls9g;->b:Lcom/opera/android/settings/SettingsManager;

    new-instance p1, Lr9g;

    const/4 p2, 0x0

    invoke-direct {p1, p0, p2}, Lr9g;-><init>(Ljava/lang/Object;B)V

    new-instance p2, Lvzk;

    invoke-direct {p2, p1}, Lvzk;-><init>(Lr9g;)V

    iput-object p2, p0, Ls9g;->c:Lvzk;

    new-instance p2, Lvzk;

    invoke-direct {p2, p1}, Lvzk;-><init>(Lr9g;)V

    iput-object p2, p0, Ls9g;->d:Lvzk;

    iput-object p3, p0, Ls9g;->e:Lk5o;

    return-void
.end method

.method public static k(Llag;Ljava/lang/String;Ljava/lang/String;Z)Z
    .registers 6

    const/4 v0, 0x1

    if-nez p3, :cond_1b

    invoke-virtual {p0}, Ljava/lang/Enum;->ordinal()I

    move-result p3

    if-eq p3, v0, :cond_19

    const/4 v1, 0x2

    if-eq p3, v1, :cond_19

    const/4 v1, 0x3

    if-eq p3, v1, :cond_19

    const/4 v1, 0x4

    if-eq p3, v1, :cond_19

    const/4 v1, 0x5

    if-eq p3, v1, :cond_19

    const/16 v1, 0x8

    if-ne p3, v1, :cond_1b

    :cond_19
    const/4 p0, 0x0

    return p0

    :cond_1b
    sget-object p3, Llag;->b:Llag;

    if-ne p0, p3, :cond_24

    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    return p0

    :cond_24
    return v0
.end method


# virtual methods
.method public final bridge synthetic F(Ljava/lang/Object;)V
    .registers 2

    check-cast p1, Lq9g;

    invoke-virtual {p0, p1}, Ls9g;->a(Lq9g;)V

    return-void
.end method

.method public final bridge synthetic H(Ljava/lang/Object;)V
    .registers 2

    check-cast p1, Lq9g;

    invoke-virtual {p0, p1}, Ls9g;->m(Lq9g;)V

    return-void
.end method

.method public final a(Lq9g;)V
    .registers 2

    iget-object p0, p0, Ls9g;->f:Li7f;

    invoke-virtual {p0, p1}, Li7f;->b(Ljava/lang/Object;)Z

    return-void
.end method

.method public final b(Llag;Ljava/lang/String;Z)V
    .registers 8

    sget-object v0, Llag;->a:Llag;

    if-ne p1, v0, :cond_5

    return-void

    :cond_5
    invoke-virtual {p0, p3}, Ls9g;->j(Z)Lvzk;

    move-result-object v0

    iget-object v1, v0, Lvzk;->a:Ljava/lang/Object;

    monitor-enter v1

    :try_start_c
    iget-object v2, v0, Lvzk;->b:Ljava/lang/Object;

    check-cast v2, Ljava/util/HashMap;

    invoke-virtual {v2, p2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljag;

    if-nez v2, :cond_1a

    monitor-exit v1

    return-void

    :cond_1a
    const/4 v3, 0x0

    invoke-virtual {v2, p1, v3}, Ljag;->a(Llag;Lkag;)Lkag;

    move-result-object v3

    if-nez v3, :cond_23

    monitor-exit v1

    return-void

    :cond_23
    iget-object v3, v0, Lvzk;->d:Ljava/lang/Object;

    check-cast v3, Lr9g;

    iget-object v3, v3, Lr9g;->b:Ljava/lang/Object;

    check-cast v3, Ls9g;

    iget-object v3, v3, Ls9g;->b:Lcom/opera/android/settings/SettingsManager;

    invoke-virtual {v3, p1}, Lcom/opera/android/settings/SettingsManager;->k(Llag;)Lkag;

    move-result-object v3

    invoke-virtual {v0, p2, p1, v3}, Lvzk;->g0(Ljava/lang/String;Llag;Lkag;)V

    iget-object v3, v2, Ljag;->a:Ljava/util/EnumMap;

    invoke-virtual {v3, p1}, Ljava/util/EnumMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v2, v2, Ljag;->a:Ljava/util/EnumMap;

    invoke-virtual {v2}, Ljava/util/AbstractMap;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_48

    iget-object v0, v0, Lvzk;->b:Ljava/lang/Object;

    check-cast v0, Ljava/util/HashMap;

    invoke-virtual {v0, p2}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    :cond_48
    monitor-exit v1
    :try_end_49
    .catchall {:try_start_c .. :try_end_49} :catchall_70

    if-nez p3, :cond_4e

    invoke-virtual {p0}, Ls9g;->n()V

    :cond_4e
    new-instance p3, Lloj;

    invoke-direct {p3, p2, p1}, Lloj;-><init>(Ljava/lang/String;Llag;)V

    filled-new-array {p3}, [Ljava/lang/Object;

    move-result-object p1

    new-instance p2, Ljava/util/ArrayList;

    const/4 p3, 0x1

    invoke-direct {p2, p3}, Ljava/util/ArrayList;-><init>(I)V

    const/4 p3, 0x0

    aget-object p1, p1, p3

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {p2, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-static {p2}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object p1

    invoke-virtual {p0, p1}, Ls9g;->l(Ljava/util/List;)V

    return-void

    :goto_6e
    :try_start_6e
    monitor-exit v1
    :try_end_6f
    .catchall {:try_start_6e .. :try_end_6f} :catchall_70

    throw p0

    :catchall_70
    move-exception p0

    goto :goto_6e
.end method

.method public final c(Ljava/lang/String;)V
    .registers 7

    iget-object v0, p0, Ls9g;->c:Lvzk;

    iget-object v1, v0, Lvzk;->a:Ljava/lang/Object;

    monitor-enter v1

    :try_start_5
    iget-object v2, v0, Lvzk;->b:Ljava/lang/Object;

    check-cast v2, Ljava/util/HashMap;

    invoke-virtual {v2, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljag;

    if-nez v2, :cond_13

    monitor-exit v1

    return-void

    :cond_13
    iget-object v2, v2, Ljag;->a:Ljava/util/EnumMap;

    invoke-virtual {v2}, Ljava/util/EnumMap;->keySet()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_1d
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_3b

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Llag;

    iget-object v4, v0, Lvzk;->d:Ljava/lang/Object;

    check-cast v4, Lr9g;

    iget-object v4, v4, Lr9g;->b:Ljava/lang/Object;

    check-cast v4, Ls9g;

    iget-object v4, v4, Ls9g;->b:Lcom/opera/android/settings/SettingsManager;

    invoke-virtual {v4, v3}, Lcom/opera/android/settings/SettingsManager;->k(Llag;)Lkag;

    move-result-object v4

    invoke-virtual {v0, p1, v3, v4}, Lvzk;->g0(Ljava/lang/String;Llag;Lkag;)V

    goto :goto_1d

    :cond_3b
    iget-object v0, v0, Lvzk;->b:Ljava/lang/Object;

    check-cast v0, Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    monitor-exit v1
    :try_end_43
    .catchall {:try_start_5 .. :try_end_43} :catchall_69

    invoke-virtual {p0}, Ls9g;->n()V

    new-instance v0, Lloj;

    const/4 v1, 0x0

    invoke-direct {v0, p1, v1}, Lloj;-><init>(Ljava/lang/String;Llag;)V

    filled-new-array {v0}, [Ljava/lang/Object;

    move-result-object p1

    new-instance v0, Ljava/util/ArrayList;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    const/4 v1, 0x0

    aget-object p1, p1, v1

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object p1

    invoke-virtual {p0, p1}, Ls9g;->l(Ljava/util/List;)V

    return-void

    :goto_67
    :try_start_67
    monitor-exit v1
    :try_end_68
    .catchall {:try_start_67 .. :try_end_68} :catchall_69

    throw p0

    :catchall_69
    move-exception p0

    goto :goto_67
.end method

.method public final e(Z)V
    .registers 9

    invoke-virtual {p0, p1}, Ls9g;->j(Z)Lvzk;

    move-result-object v0

    iget-object v1, v0, Lvzk;->a:Ljava/lang/Object;

    monitor-enter v1

    :try_start_7
    iget-object v2, v0, Lvzk;->b:Ljava/lang/Object;

    check-cast v2, Ljava/util/HashMap;

    invoke-virtual {v2}, Ljava/util/HashMap;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_13

    monitor-exit v1

    return-void

    :cond_13
    iget-object v2, v0, Lvzk;->b:Ljava/lang/Object;

    check-cast v2, Ljava/util/HashMap;

    invoke-virtual {v2}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_1f
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_5f

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/Map$Entry;

    invoke-interface {v3}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-interface {v3}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljag;

    iget-object v3, v3, Ljag;->a:Ljava/util/EnumMap;

    invoke-virtual {v3}, Ljava/util/EnumMap;->keySet()Ljava/util/Set;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_41
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_1f

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Llag;

    iget-object v6, v0, Lvzk;->d:Ljava/lang/Object;

    check-cast v6, Lr9g;

    iget-object v6, v6, Lr9g;->b:Ljava/lang/Object;

    check-cast v6, Ls9g;

    iget-object v6, v6, Ls9g;->b:Lcom/opera/android/settings/SettingsManager;

    invoke-virtual {v6, v5}, Lcom/opera/android/settings/SettingsManager;->k(Llag;)Lkag;

    move-result-object v6

    invoke-virtual {v0, v4, v5, v6}, Lvzk;->g0(Ljava/lang/String;Llag;Lkag;)V

    goto :goto_41

    :cond_5f
    iget-object v0, v0, Lvzk;->b:Ljava/lang/Object;

    check-cast v0, Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->clear()V

    monitor-exit v1
    :try_end_67
    .catchall {:try_start_7 .. :try_end_67} :catchall_80

    if-nez p1, :cond_6c

    invoke-virtual {p0}, Ls9g;->n()V

    :cond_6c
    iget-object p1, p0, Ls9g;->a:Lumi;

    new-instance v0, Lvdf;

    const/16 v1, 0x13

    invoke-direct {v0, p0, v1}, Lvdf;-><init>(Ljava/lang/Object;B)V

    invoke-interface {p1, v0}, Ltcl;->d(Ljava/lang/Runnable;)Lnml;

    move-result-object p0

    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Lnml;->a(Ljava/lang/Object;)Loml;

    return-void

    :goto_7e
    :try_start_7e
    monitor-exit v1
    :try_end_7f
    .catchall {:try_start_7e .. :try_end_7f} :catchall_80

    throw p0

    :catchall_80
    move-exception p0

    goto :goto_7e
.end method

.method public final f(Ljava/lang/String;Z)Ljag;
    .registers 6

    iget-object v0, p0, Ls9g;->c:Lvzk;

    if-eqz p2, :cond_61

    iget-object p0, p0, Ls9g;->d:Lvzk;

    invoke-virtual {p0, p1}, Lvzk;->C(Ljava/lang/String;)Ljag;

    move-result-object p0

    invoke-virtual {v0, p1}, Lvzk;->C(Ljava/lang/String;)Ljag;

    move-result-object p1

    if-nez p0, :cond_1a

    if-nez p1, :cond_14

    const/4 p0, 0x0

    return-object p0

    :cond_14
    new-instance p0, Ljag;

    invoke-direct {p0}, Ljag;-><init>()V

    goto :goto_20

    :cond_1a
    new-instance p2, Ljag;

    invoke-direct {p2, p0}, Ljag;-><init>(Ljag;)V

    move-object p0, p2

    :goto_20
    if-eqz p1, :cond_60

    iget-object p2, p0, Ljag;->a:Ljava/util/EnumMap;

    iget-object p1, p1, Ljag;->a:Ljava/util/EnumMap;

    invoke-virtual {p1}, Ljava/util/EnumMap;->entrySet()Ljava/util/Set;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_2e
    :goto_2e
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_60

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {p2, v1}, Ljava/util/EnumMap;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_2e

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Liag;

    iget-object v1, v1, Liag;->a:Lkag;

    sget-object v2, Lkag;->c:Lkag;

    if-ne v1, v2, :cond_2e

    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Llag;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Liag;

    invoke-virtual {p2, v1, v0}, Ljava/util/EnumMap;->put(Ljava/lang/Enum;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_2e

    :cond_60
    return-object p0

    :cond_61
    invoke-virtual {v0, p1}, Lvzk;->C(Ljava/lang/String;)Ljag;

    move-result-object p0

    return-object p0
.end method

.method public final g(Llag;Ljava/lang/String;Z)Lkag;
    .registers 4

    invoke-virtual {p0, p2, p3}, Ls9g;->f(Ljava/lang/String;Z)Ljag;

    move-result-object p2

    iget-object p0, p0, Ls9g;->b:Lcom/opera/android/settings/SettingsManager;

    invoke-virtual {p0, p1}, Lcom/opera/android/settings/SettingsManager;->k(Llag;)Lkag;

    move-result-object p0

    if-eqz p3, :cond_16

    sget-object p3, Llag;->c:Llag;

    if-ne p1, p3, :cond_16

    sget-object p3, Lkag;->b:Lkag;

    if-ne p0, p3, :cond_16

    sget-object p0, Lkag;->d:Lkag;

    :cond_16
    if-eqz p2, :cond_1c

    invoke-virtual {p2, p1, p0}, Ljag;->a(Llag;Lkag;)Lkag;

    move-result-object p0

    :cond_1c
    return-object p0
.end method

.method public final h(Llag;Ljava/lang/String;Z)Lkag;
    .registers 4

    invoke-virtual {p0, p1, p2, p3}, Ls9g;->g(Llag;Ljava/lang/String;Z)Lkag;

    move-result-object p0

    sget-object p2, Lkag;->b:Lkag;

    if-ne p0, p2, :cond_11

    invoke-static {p1}, Lf03;->z(Llag;)I

    move-result p1

    const/4 p2, 0x3

    if-ne p1, p2, :cond_11

    sget-object p0, Lkag;->d:Lkag;

    :cond_11
    return-object p0
.end method

.method public final i(Z)Ljava/util/Set;
    .registers 3

    invoke-virtual {p0, p1}, Ls9g;->j(Z)Lvzk;

    move-result-object p0

    iget-object p1, p0, Lvzk;->a:Ljava/lang/Object;

    monitor-enter p1

    :try_start_7
    new-instance v0, Ljava/util/HashSet;

    iget-object p0, p0, Lvzk;->b:Ljava/lang/Object;

    check-cast p0, Ljava/util/HashMap;

    invoke-virtual {p0}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object p0

    invoke-direct {v0, p0}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableSet(Ljava/util/Set;)Ljava/util/Set;

    move-result-object p0

    monitor-exit p1

    return-object p0

    :goto_1a
    monitor-exit p1
    :try_end_1b
    .catchall {:try_start_7 .. :try_end_1b} :catchall_1c

    throw p0

    :catchall_1c
    move-exception p0

    goto :goto_1a
.end method

.method public final j(Z)Lvzk;
    .registers 2

    if-eqz p1, :cond_5

    iget-object p0, p0, Ls9g;->d:Lvzk;

    return-object p0

    :cond_5
    iget-object p0, p0, Ls9g;->c:Lvzk;

    return-object p0
.end method

.method public final l(Ljava/util/List;)V
    .registers 4

    new-instance v0, Lq2g;

    const/4 v1, 0x2

    invoke-direct {v0, p0, p1, v1}, Lq2g;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    iget-object p0, p0, Ls9g;->a:Lumi;

    invoke-interface {p0, v0}, Ltcl;->d(Ljava/lang/Runnable;)Lnml;

    move-result-object p0

    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Lnml;->a(Ljava/lang/Object;)Loml;

    return-void
.end method

.method public final m(Lq9g;)V
    .registers 2

    iget-object p0, p0, Ls9g;->f:Li7f;

    invoke-virtual {p0, p1}, Li7f;->c(Ljava/lang/Object;)Z

    return-void
.end method

.method public final n()V
    .registers 5

    iget-object v0, p0, Ls9g;->c:Lvzk;

    invoke-virtual {v0}, Lvzk;->D()Ljava/util/HashMap;

    move-result-object v0

    iget-object p0, p0, Ls9g;->e:Lk5o;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1, v0}, Ljava/util/HashMap;-><init>(Ljava/util/Map;)V

    iget-object v0, p0, Lk5o;->c:Ljava/lang/Object;

    check-cast v0, Lumi;

    new-instance v2, Lfh4;

    const/16 v3, 0x14

    invoke-direct {v2, p0, v1, v3}, Lfh4;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-interface {v0, v2}, Ltcl;->c(Ljava/lang/Runnable;)Lnml;

    move-result-object p0

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lnml;->a(Ljava/lang/Object;)Loml;

    return-void
.end method

.method public final o(ZLjava/lang/String;Llag;Lkag;Z)V
    .registers 9

    const/4 v0, 0x0

    if-eqz p1, :cond_12

    iget-object v1, p0, Ls9g;->d:Lvzk;

    iget-object v2, v1, Lvzk;->a:Ljava/lang/Object;

    monitor-enter v2

    :try_start_8
    invoke-virtual {v1, p2, p3, p4, v0}, Lvzk;->f0(Ljava/lang/String;Llag;Lkag;Z)Z

    move-result p4

    monitor-exit v2

    goto :goto_1c

    :goto_e
    monitor-exit v2
    :try_end_f
    .catchall {:try_start_8 .. :try_end_f} :catchall_10

    throw p0

    :catchall_10
    move-exception p0

    goto :goto_e

    :cond_12
    iget-object v1, p0, Ls9g;->c:Lvzk;

    iget-object v2, v1, Lvzk;->a:Ljava/lang/Object;

    monitor-enter v2

    :try_start_17
    invoke-virtual {v1, p2, p3, p4, p5}, Lvzk;->f0(Ljava/lang/String;Llag;Lkag;Z)Z

    move-result p4

    monitor-exit v2
    :try_end_1c
    .catchall {:try_start_17 .. :try_end_1c} :catchall_47

    :goto_1c
    if-nez p4, :cond_1f

    return-void

    :cond_1f
    if-eqz p5, :cond_26

    if-nez p1, :cond_26

    invoke-virtual {p0}, Ls9g;->n()V

    :cond_26
    new-instance p1, Lloj;

    invoke-direct {p1, p2, p3}, Lloj;-><init>(Ljava/lang/String;Llag;)V

    filled-new-array {p1}, [Ljava/lang/Object;

    move-result-object p1

    new-instance p2, Ljava/util/ArrayList;

    const/4 p3, 0x1

    invoke-direct {p2, p3}, Ljava/util/ArrayList;-><init>(I)V

    aget-object p1, p1, v0

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {p2, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-static {p2}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object p1

    invoke-virtual {p0, p1}, Ls9g;->l(Ljava/util/List;)V

    return-void

    :goto_45
    :try_start_45
    monitor-exit v2
    :try_end_46
    .catchall {:try_start_45 .. :try_end_46} :catchall_47

    throw p0

    :catchall_47
    move-exception p0

    goto :goto_45
.end method

.method public final p(Llag;Lkag;)V
    .registers 4

    iget-object p0, p0, Ls9g;->b:Lcom/opera/android/settings/SettingsManager;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v0, Lkag;->b:Lkag;

    if-ne p2, v0, :cond_11

    invoke-static {p1}, Lcom/opera/android/settings/SettingsManager;->K(Llag;)Z

    move-result v0

    if-nez v0, :cond_11

    sget-object p2, Lkag;->d:Lkag;

    :cond_11
    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    move-result p1

    packed-switch p1, :pswitch_data_6a

    return-void

    :pswitch_19
    const-string p1, "local_network_permission_default"

    invoke-virtual {p2}, Ljava/lang/Enum;->ordinal()I

    move-result p2

    invoke-virtual {p0, p2, p1}, Lcom/opera/android/settings/SettingsManager;->V(ILjava/lang/String;)V

    return-void

    :pswitch_23
    const-string p1, "automatic_downloads_permission_default"

    invoke-virtual {p2}, Ljava/lang/Enum;->ordinal()I

    move-result p2

    invoke-virtual {p0, p2, p1}, Lcom/opera/android/settings/SettingsManager;->V(ILjava/lang/String;)V

    return-void

    :pswitch_2d
    const-string p1, "external_apps_permission_default"

    invoke-virtual {p2}, Ljava/lang/Enum;->ordinal()I

    move-result p2

    invoke-virtual {p0, p2, p1}, Lcom/opera/android/settings/SettingsManager;->V(ILjava/lang/String;)V

    return-void

    :pswitch_37
    const-string p1, "camera_permission_defualt"

    invoke-virtual {p2}, Ljava/lang/Enum;->ordinal()I

    move-result p2

    invoke-virtual {p0, p2, p1}, Lcom/opera/android/settings/SettingsManager;->V(ILjava/lang/String;)V

    return-void

    :pswitch_41
    const-string p1, "permission_permission_defualt"

    invoke-virtual {p2}, Ljava/lang/Enum;->ordinal()I

    move-result p2

    invoke-virtual {p0, p2, p1}, Lcom/opera/android/settings/SettingsManager;->V(ILjava/lang/String;)V

    return-void

    :pswitch_4b
    const-string p1, "protected_media_identifier_permission_default"

    invoke-virtual {p2}, Ljava/lang/Enum;->ordinal()I

    move-result p2

    invoke-virtual {p0, p2, p1}, Lcom/opera/android/settings/SettingsManager;->V(ILjava/lang/String;)V

    return-void

    :pswitch_55
    const-string p1, "location_permission_defualt"

    invoke-virtual {p2}, Ljava/lang/Enum;->ordinal()I

    move-result p2

    invoke-virtual {p0, p2, p1}, Lcom/opera/android/settings/SettingsManager;->V(ILjava/lang/String;)V

    return-void

    :pswitch_5f
    const-string p1, "notifications_permission_defualt"

    invoke-virtual {p2}, Ljava/lang/Enum;->ordinal()I

    move-result p2

    invoke-virtual {p0, p2, p1}, Lcom/opera/android/settings/SettingsManager;->V(ILjava/lang/String;)V

    return-void

    nop

    :pswitch_data_6a
    .packed-switch 0x1
        :pswitch_5f
        :pswitch_55
        :pswitch_4b
        :pswitch_41
        :pswitch_37
        :pswitch_2d
        :pswitch_23
        :pswitch_19
    .end packed-switch
.end method

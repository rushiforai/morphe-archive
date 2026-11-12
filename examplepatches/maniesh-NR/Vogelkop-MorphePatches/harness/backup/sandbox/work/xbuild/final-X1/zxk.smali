.class public final Lzxk;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lu9j;


# instance fields
.field public final a:Lzwk;

.field public final b:Lcom/opera/android/settings/SettingsManager;

.field public final c:Ldb;

.field public final d:Lsom;

.field public final e:Lbf9;

.field public final f:Lv9j;

.field public final g:Lh5k;

.field public h:Z

.field public i:Z

.field public j:Landroid/os/CancellationSignal;

.field public final k:Lyxk;


# direct methods
.method public constructor <init>(Lzwk;Lcom/opera/android/settings/SettingsManager;Ldb;Lsom;Lbf9;)V
    .registers 6

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lzxk;->a:Lzwk;

    iput-object p2, p0, Lzxk;->b:Lcom/opera/android/settings/SettingsManager;

    iput-object p3, p0, Lzxk;->c:Ldb;

    iput-object p4, p0, Lzxk;->d:Lsom;

    iput-object p5, p0, Lzxk;->e:Lbf9;

    new-instance p1, Lv9j;

    invoke-direct {p1, p0}, Lv9j;-><init>(Lu9j;)V

    iput-object p1, p0, Lzxk;->f:Lv9j;

    new-instance p1, Lh5k;

    invoke-direct {p1}, Ljava/lang/Object;-><init>()V

    iput-object p0, p1, Lh5k;->d:Ljava/lang/Object;

    new-instance p3, Ljava/util/HashSet;

    invoke-direct {p3}, Ljava/util/HashSet;-><init>()V

    iput-object p3, p1, Lh5k;->c:Ljava/lang/Object;

    new-instance p3, Ljava/util/HashSet;

    invoke-direct {p3}, Ljava/util/HashSet;-><init>()V

    iput-object p3, p1, Lh5k;->b:Ljava/lang/Object;

    iput-object p1, p0, Lzxk;->g:Lh5k;

    const-string p1, "enable_sync"

    invoke-virtual {p2, p1}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result p1

    iput-boolean p1, p0, Lzxk;->i:Z

    new-instance p1, Lyxk;

    invoke-direct {p1, p0}, Lyxk;-><init>(Lzxk;)V

    iput-object p1, p0, Lzxk;->k:Lyxk;

    return-void
.end method

.method public static a(Lne6;Z)Loe6;
    .registers 9

    new-instance v0, Loe6;

    sget-object v1, Lxxk;->b:Ljava/util/HashMap;

    iget-object v2, p0, Lne6;->b:Ljava/lang/String;

    iget-object v3, p0, Lne6;->b:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lwxk;

    const/4 v4, 0x0

    if-eqz v2, :cond_14

    iget v2, v2, Lwxk;->b:I

    goto :goto_26

    :cond_14
    sget-object v2, Lq9n;->c:Ll5b;

    invoke-static {}, Landroid/view/View;->generateViewId()I

    move-result v2

    invoke-virtual {v1}, Ljava/util/HashMap;->size()I

    move-result v5

    new-instance v6, Lwxk;

    invoke-direct {v6, v5, v2, v4}, Lwxk;-><init>(III)V

    invoke-virtual {v1, v3, v6}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :goto_26
    invoke-virtual {v1, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lwxk;

    if-eqz v1, :cond_30

    iget v4, v1, Lwxk;->c:I

    :cond_30
    invoke-direct {v0, p0, p1, v2, v4}, Loe6;-><init>(Lne6;ZII)V

    return-object v0
.end method


# virtual methods
.method public final b()V
    .registers 21

    move-object/from16 v0, p0

    iget-object v1, v0, Lzxk;->g:Lh5k;

    iget-object v2, v1, Lh5k;->c:Ljava/lang/Object;

    check-cast v2, Ljava/util/HashSet;

    new-instance v3, Ljava/util/ArrayList;

    const/16 v4, 0xa

    invoke-static {v2, v4}, Lk95;->o(Ljava/lang/Iterable;I)I

    move-result v5

    invoke-direct {v3, v5}, Ljava/util/ArrayList;-><init>(I)V

    invoke-virtual {v2}, Ljava/util/HashSet;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_17
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    const/4 v6, 0x1

    if-eqz v5, :cond_2c

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lne6;

    invoke-static {v5, v6}, Lzxk;->a(Lne6;Z)Loe6;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_17

    :cond_2c
    iget-object v1, v1, Lh5k;->b:Ljava/lang/Object;

    check-cast v1, Ljava/util/HashSet;

    new-instance v2, Ljava/util/ArrayList;

    invoke-static {v1, v4}, Lk95;->o(Ljava/lang/Iterable;I)I

    move-result v4

    invoke-direct {v2, v4}, Ljava/util/ArrayList;-><init>(I)V

    invoke-virtual {v1}, Ljava/util/HashSet;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_3d
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    const/4 v5, 0x0

    if-eqz v4, :cond_52

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lne6;

    invoke-static {v4, v5}, Lzxk;->a(Lne6;Z)Loe6;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_3d

    :cond_52
    invoke-static {v2, v3}, Lkotlin/collections/CollectionsKt;->V(Ljava/lang/Iterable;Ljava/util/Collection;)Ljava/util/ArrayList;

    move-result-object v1

    sget-object v2, Lxxk;->a:Lomj;

    invoke-static {v2, v1}, Lkotlin/collections/CollectionsKt;->c0(Ljava/util/Comparator;Ljava/lang/Iterable;)Ljava/util/List;

    move-result-object v15

    sget-object v1, Lxxk;->b:Ljava/util/HashMap;

    invoke-virtual {v1}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v1

    check-cast v1, Ljava/lang/Iterable;

    invoke-static {v1}, Lkotlin/collections/CollectionsKt;->i0(Ljava/lang/Iterable;)Ljava/util/HashSet;

    move-result-object v1

    invoke-interface {v15}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    move/from16 v16, v5

    move/from16 v17, v16

    move/from16 v18, v17

    move/from16 v19, v18

    :cond_74
    :goto_74
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_c7

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Loe6;

    invoke-virtual {v1}, Ljava/util/HashSet;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_c7

    iget-object v3, v3, Loe6;->a:Lne6;

    iget-object v3, v3, Lne6;->b:Ljava/lang/String;

    invoke-virtual {v1, v3}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_74

    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    move-result v4

    sparse-switch v4, :sswitch_data_146

    goto :goto_c3

    :sswitch_98
    const-string v4, "sync.bookmarks"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_c3

    move/from16 v17, v6

    goto :goto_c3

    :sswitch_a3
    const-string v4, "sync.typed_urls"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_c3

    move/from16 v18, v6

    goto :goto_c3

    :sswitch_ae
    const-string v4, "sync.tabs"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_c3

    move/from16 v19, v6

    goto :goto_c3

    :sswitch_b9
    const-string v4, "sync.passwords"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_c3

    move/from16 v16, v6

    :cond_c3
    :goto_c3
    invoke-virtual {v1, v3}, Ljava/util/HashSet;->remove(Ljava/lang/Object;)Z

    goto :goto_74

    :cond_c7
    iget-object v1, v0, Lzxk;->a:Lzwk;

    iget-object v2, v0, Lzxk;->c:Ldb;

    invoke-static {v2, v1}, Lxgh;->s(Ldb;Lzwk;)Z

    move-result v9

    iget-object v1, v0, Lzxk;->e:Lbf9;

    invoke-virtual {v1}, Lbf9;->t()Z

    move-result v3

    if-eqz v3, :cond_e0

    invoke-virtual {v1}, Lbf9;->r()I

    move-result v1

    const/4 v4, 0x2

    if-lt v1, v4, :cond_e0

    move v1, v6

    goto :goto_e1

    :cond_e0
    move v1, v5

    :goto_e1
    invoke-virtual {v2}, Ldb;->f()Z

    move-result v4

    invoke-virtual {v2}, Ldb;->e()Z

    move-result v7

    if-eqz v7, :cond_f1

    iget-boolean v8, v0, Lzxk;->h:Z

    if-nez v8, :cond_f3

    move v7, v5

    goto :goto_f3

    :cond_f1
    iput-boolean v6, v0, Lzxk;->h:Z

    :cond_f3
    :goto_f3
    if-eqz v4, :cond_101

    if-nez v9, :cond_101

    if-eqz v7, :cond_101

    invoke-virtual {v2}, Ldb;->d()Z

    move-result v2

    if-nez v2, :cond_101

    move v8, v6

    goto :goto_102

    :cond_101
    move v8, v5

    :goto_102
    if-nez v9, :cond_10e

    iget-object v2, v0, Lzxk;->d:Lsom;

    invoke-virtual {v2, v5}, Lsom;->R(I)Z

    move-result v2

    if-eqz v2, :cond_10e

    move v10, v6

    goto :goto_10f

    :cond_10e
    move v10, v5

    :goto_10f
    if-eqz v1, :cond_11d

    iget-object v2, v0, Lzxk;->b:Lcom/opera/android/settings/SettingsManager;

    const-string v7, "my_flow_visible"

    invoke-virtual {v2, v7}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_11d

    move v12, v6

    goto :goto_11e

    :cond_11d
    move v12, v5

    :goto_11e
    if-eqz v3, :cond_128

    if-nez v1, :cond_124

    if-eqz v4, :cond_128

    :cond_124
    if-nez v9, :cond_128

    move v13, v6

    goto :goto_129

    :cond_128
    move v13, v5

    :goto_129
    if-eqz v4, :cond_12f

    if-nez v9, :cond_12f

    move v14, v6

    goto :goto_130

    :cond_12f
    move v14, v5

    :goto_130
    if-eqz v4, :cond_13a

    iget-boolean v1, v0, Lzxk;->i:Z

    if-eqz v1, :cond_13a

    if-nez v9, :cond_13a

    move v11, v6

    goto :goto_13b

    :cond_13a
    move v11, v5

    :goto_13b
    new-instance v7, Lvxk;

    invoke-direct/range {v7 .. v19}, Lvxk;-><init>(ZZZZZZZLjava/util/List;ZZZZ)V

    iget-object v0, v0, Lzxk;->f:Lv9j;

    invoke-virtual {v0, v7}, Lekc;->r(Ljava/lang/Object;)V

    return-void

    :sswitch_data_146
    .sparse-switch
        -0x3cca3e5b -> :sswitch_b9
        0x1ac7baf1 -> :sswitch_ae
        0x1d8be0cc -> :sswitch_a3
        0x73f52a6a -> :sswitch_98
    .end sparse-switch
.end method

.method public final j()V
    .registers 9

    iget-object v0, p0, Lzxk;->g:Lh5k;

    iget-object v1, v0, Lh5k;->c:Ljava/lang/Object;

    check-cast v1, Ljava/util/HashSet;

    invoke-virtual {v1}, Ljava/util/HashSet;->clear()V

    iget-object v2, v0, Lh5k;->b:Ljava/lang/Object;

    check-cast v2, Ljava/util/HashSet;

    invoke-virtual {v2}, Ljava/util/HashSet;->clear()V

    const/4 v3, 0x0

    iput-boolean v3, v0, Lh5k;->a:Z

    iget-object v3, p0, Lzxk;->a:Lzwk;

    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {}, Lzwk;->b()Lwyk;

    move-result-object v4

    iget-object v4, v4, Lwyk;->a:Ljava/util/Set;

    check-cast v4, Ljava/lang/Iterable;

    invoke-interface {v4}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_24
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    iget-object v6, p0, Lzxk;->b:Lcom/opera/android/settings/SettingsManager;

    if-eqz v5, :cond_4b

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lne6;

    iget-boolean v7, p0, Lzxk;->i:Z

    if-nez v7, :cond_47

    invoke-virtual {v6}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v5}, Lcom/opera/android/settings/SettingsManager;->B(Lne6;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result v6

    if-nez v6, :cond_47

    invoke-virtual {v2, v5}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    goto :goto_24

    :cond_47
    invoke-virtual {v1, v5}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    goto :goto_24

    :cond_4b
    invoke-static {}, Lzwk;->b()Lwyk;

    move-result-object v4

    iget-object v4, v4, Lwyk;->b:Ljava/util/Set;

    check-cast v4, Ljava/lang/Iterable;

    invoke-interface {v4}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_57
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_7b

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lne6;

    invoke-virtual {v6}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v5}, Lcom/opera/android/settings/SettingsManager;->B(Lne6;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_77

    const/4 v7, 0x1

    iput-boolean v7, v0, Lh5k;->a:Z

    invoke-virtual {v1, v5}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    goto :goto_57

    :cond_77
    invoke-virtual {v2, v5}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    goto :goto_57

    :cond_7b
    invoke-virtual {p0}, Lzxk;->b()V

    iget-object p0, p0, Lzxk;->k:Lyxk;

    invoke-virtual {v3, p0}, Lzwk;->a(Lywk;)V

    return-void
.end method

.method public final onStopped()V
    .registers 7

    iget-object v0, p0, Lzxk;->j:Landroid/os/CancellationSignal;

    if-eqz v0, :cond_7

    invoke-virtual {v0}, Landroid/os/CancellationSignal;->cancel()V

    :cond_7
    const/4 v0, 0x0

    iput-object v0, p0, Lzxk;->j:Landroid/os/CancellationSignal;

    iget-object v0, p0, Lzxk;->k:Lyxk;

    iget-object v1, p0, Lzxk;->a:Lzwk;

    invoke-virtual {v1, v0}, Lzwk;->j(Lywk;)V

    iget-object v0, p0, Lzxk;->c:Ldb;

    invoke-virtual {v0}, Ldb;->f()Z

    move-result v0

    if-eqz v0, :cond_8b

    iget-boolean v0, p0, Lzxk;->i:Z

    iget-object v1, p0, Lzxk;->g:Lh5k;

    iget-boolean v2, v1, Lh5k;->a:Z

    iget-object v3, v1, Lh5k;->c:Ljava/lang/Object;

    check-cast v3, Ljava/util/HashSet;

    iget-object v4, p0, Lzxk;->b:Lcom/opera/android/settings/SettingsManager;

    if-eqz v2, :cond_76

    const/4 v2, 0x0

    iput-boolean v2, v1, Lh5k;->a:Z

    iget-object v5, v1, Lh5k;->d:Ljava/lang/Object;

    check-cast v5, Lzxk;

    iget-object v5, v5, Lzxk;->a:Lzwk;

    if-eqz v0, :cond_36

    invoke-virtual {v5, v3}, Lzwk;->k(Ljava/util/Set;)V

    goto :goto_3b

    :cond_36
    sget-object v0, Lv08;->a:Lv08;

    invoke-virtual {v5, v0}, Lzwk;->k(Ljava/util/Set;)V

    :goto_3b
    invoke-virtual {v3}, Ljava/util/HashSet;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_3f
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_57

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lne6;

    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v3}, Lcom/opera/android/settings/SettingsManager;->B(Lne6;)Ljava/lang/String;

    move-result-object v3

    const/4 v5, 0x1

    invoke-virtual {v4, v5, v3}, Lcom/opera/android/settings/SettingsManager;->V(ILjava/lang/String;)V

    goto :goto_3f

    :cond_57
    iget-object v0, v1, Lh5k;->b:Ljava/lang/Object;

    check-cast v0, Ljava/util/HashSet;

    invoke-virtual {v0}, Ljava/util/HashSet;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_5f
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_76

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lne6;

    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v1}, Lcom/opera/android/settings/SettingsManager;->B(Lne6;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v4, v2, v1}, Lcom/opera/android/settings/SettingsManager;->V(ILjava/lang/String;)V

    goto :goto_5f

    :cond_76
    iget-boolean v0, p0, Lzxk;->i:Z

    const-string v1, "enable_sync"

    invoke-virtual {v4, v1}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result v2

    if-eq v0, v2, :cond_8b

    invoke-static {}, Lzwk;->i()Z

    move-result v0

    if-nez v0, :cond_8b

    iget-boolean p0, p0, Lzxk;->i:Z

    invoke-virtual {v4, p0, v1}, Lcom/opera/android/settings/SettingsManager;->V(ILjava/lang/String;)V

    :cond_8b
    return-void
.end method

.class public final Lqln;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lw6f;


# instance fields
.field public final a:Landroid/content/Context;

.field public final b:Lumi;

.field public final c:Lx4i;

.field public final d:Lonn;

.field public final e:Lcom/opera/android/settings/SettingsManager;

.field public final f:Lami;

.field public final g:Lagm;

.field public final h:Lkze;

.field public final i:Lqi5;

.field public final j:Lvzk;

.field public final k:Lvs8;

.field public final l:Lqs7;

.field public final m:Lrgh;

.field public final n:Lay;

.field public final o:Lagm;

.field public final p:Ly9e;

.field public final q:Li7f;

.field public r:Z


# direct methods
.method public constructor <init>(Lndc;Landroid/content/Context;Lumi;Lii;Lcom/opera/android/settings/SettingsManager;Ldll;Lz7f;Lonn;Lx4i;)V
    .registers 36

    move-object/from16 v0, p0

    move-object/from16 v3, p2

    move-object/from16 v11, p5

    move-object/from16 v1, p7

    move-object/from16 v9, p8

    move-object/from16 v2, p9

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    new-instance v12, Lrw0;

    const/16 v4, 0x8

    invoke-direct {v12, v0, v4}, Lrw0;-><init>(Ljava/lang/Object;B)V

    new-instance v13, Lezg;

    const/16 v4, 0xc

    invoke-direct {v13, v0, v4}, Lezg;-><init>(Ljava/lang/Object;B)V

    new-instance v4, Lay;

    const/16 v5, 0xd

    invoke-direct {v4, v0, v5}, Lay;-><init>(Ljava/lang/Object;B)V

    iput-object v4, v0, Lqln;->n:Lay;

    new-instance v4, Li7f;

    invoke-direct {v4}, Li7f;-><init>()V

    iput-object v4, v0, Lqln;->q:Li7f;

    iput-object v3, v0, Lqln;->a:Landroid/content/Context;

    move-object/from16 v5, p3

    iput-object v5, v0, Lqln;->b:Lumi;

    new-instance v4, Ljava/io/File;

    const/4 v14, 0x0

    invoke-static {v14}, Lorg/chromium/base/PathUtils;->a(I)Ljava/lang/String;

    move-result-object v6

    const-string v7, "wallpapers"

    invoke-direct {v4, v6, v7}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {v3}, Lru9;->c(Landroid/content/Context;)Lru9;

    move-result-object v15

    iput-object v11, v0, Lqln;->e:Lcom/opera/android/settings/SettingsManager;

    iput-object v9, v0, Lqln;->d:Lonn;

    iput-object v2, v0, Lqln;->c:Lx4i;

    new-instance v6, Ly9e;

    invoke-direct {v6, v1}, Ly9e;-><init>(Lz7f;)V

    iput-object v6, v0, Lqln;->p:Ly9e;

    new-instance v6, Lqi5;

    invoke-direct {v6, v15}, Lqi5;-><init>(Lru9;)V

    iput-object v6, v0, Lqln;->i:Lqi5;

    new-instance v8, Lvzk;

    invoke-direct {v8}, Ljava/lang/Object;-><init>()V

    iput-object v15, v8, Lvzk;->a:Ljava/lang/Object;

    iput-object v9, v8, Lvzk;->b:Ljava/lang/Object;

    iget-object v7, v15, Lru9;->a:Landroid/content/SharedPreferences;

    const-string v10, "wallpaper.favorites.list"

    const/4 v14, 0x0

    invoke-interface {v7, v10, v14}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    const/4 v14, 0x6

    if-eqz v7, :cond_7a

    const-string v10, ","

    filled-new-array {v10}, [Ljava/lang/String;

    move-result-object v10

    move-object/from16 v18, v4

    const/4 v4, 0x0

    invoke-static {v7, v10, v4, v14}, Lkotlin/text/StringsKt;->Y(Ljava/lang/CharSequence;[Ljava/lang/String;II)Ljava/util/List;

    move-result-object v7

    goto :goto_b9

    :cond_7a
    move-object/from16 v18, v4

    iget-object v4, v15, Lru9;->a:Landroid/content/SharedPreferences;

    const-string v7, "wallpaper.favorites"

    const/4 v14, 0x0

    invoke-static {v4, v7, v14}, Lw1h;->o(Landroid/content/SharedPreferences;Ljava/lang/String;Ljava/util/Set;)Ljava/util/Set;

    move-result-object v4

    if-eqz v4, :cond_b7

    check-cast v4, Ljava/lang/Iterable;

    invoke-static {v4}, Lkotlin/collections/CollectionsKt;->k0(Ljava/lang/Iterable;)Ljava/util/List;

    move-result-object v4

    invoke-virtual {v15}, Lru9;->b()Lnv6;

    move-result-object v14

    move-object/from16 v17, v4

    iget-object v4, v14, Lnv6;->a:Ljava/lang/Object;

    check-cast v4, Landroid/content/SharedPreferences$Editor;

    move-object/from16 v19, v17

    check-cast v19, Ljava/lang/Iterable;

    const/16 v24, 0x0

    const/16 v25, 0x3e

    const-string v20, ","

    const/16 v21, 0x0

    const/16 v22, 0x0

    const/16 v23, 0x0

    invoke-static/range {v19 .. v25}, Lkotlin/collections/CollectionsKt;->P(Ljava/lang/Iterable;Ljava/lang/CharSequence;Ljava/lang/CharSequence;Ljava/lang/String;ILkotlin/jvm/functions/Function1;I)Ljava/lang/String;

    move-result-object v5

    invoke-interface {v4, v10, v5}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    invoke-interface {v4, v7}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    invoke-virtual {v14}, Lnv6;->w()V

    move-object/from16 v7, v17

    goto :goto_b9

    :cond_b7
    sget-object v7, Ll08;->a:Ll08;

    :goto_b9
    check-cast v7, Ljava/util/Collection;

    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4, v7}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    iput-object v4, v8, Lvzk;->d:Ljava/lang/Object;

    new-instance v5, Lkze;

    invoke-direct {v5, v4}, Lekc;-><init>(Ljava/lang/Object;)V

    iput-object v5, v8, Lvzk;->c:Ljava/lang/Object;

    iput-object v8, v0, Lqln;->j:Lvzk;

    new-instance v4, Lvs8;

    invoke-direct {v4}, Lvs8;-><init>()V

    iput-object v4, v0, Lqln;->k:Lvs8;

    new-instance v7, Lrgh;

    invoke-direct {v7}, Ljava/lang/Object;-><init>()V

    iput-object v3, v7, Lrgh;->a:Ljava/lang/Object;

    invoke-virtual {v3}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    iput-object v5, v7, Lrgh;->b:Ljava/lang/Object;

    iput-object v7, v0, Lqln;->m:Lrgh;

    new-instance v5, Lami;

    new-instance v10, Lqi5;

    new-instance v14, Lvs8;

    invoke-direct {v14, v11}, Lvs8;-><init>(Lcom/opera/android/settings/SettingsManager;)V

    new-instance v3, Lvs8;

    invoke-direct {v3, v8}, Lvs8;-><init>(Lvzk;)V

    move-object/from16 v17, v3

    new-instance v3, Ly9e;

    invoke-direct {v3, v1}, Ly9e;-><init>(Lz7f;)V

    new-instance v1, Lz4i;

    invoke-direct {v1, v2, v15}, Lz4i;-><init>(Lx4i;Lru9;)V

    move-object/from16 p7, v1

    const/4 v2, 0x6

    new-array v1, v2, [Lwkn;

    const/16 v16, 0x0

    aput-object v14, v1, v16

    const/4 v14, 0x1

    aput-object v17, v1, v14

    const/4 v2, 0x2

    aput-object v3, v1, v2

    const/4 v3, 0x3

    aput-object p7, v1, v3

    const/16 v17, 0x4

    aput-object v6, v1, v17

    const/4 v6, 0x5

    aput-object v4, v1, v6

    invoke-direct {v10, v1}, Lqi5;-><init>([Lwkn;)V

    move-object/from16 v2, p1

    move-object/from16 v3, p2

    move-object/from16 v6, p4

    move-object v1, v5

    move-object/from16 v4, v18

    move-object/from16 v5, p3

    invoke-direct/range {v1 .. v10}, Lami;-><init>(Lndc;Landroid/content/Context;Ljava/io/File;Lumi;Lii;Lrgh;Lvzk;Lonn;Lqi5;)V

    iput-object v1, v0, Lqln;->f:Lami;

    new-instance v3, Lagm;

    invoke-direct {v3, v4}, Lagm;-><init>(Ljava/io/File;)V

    iput-object v3, v0, Lqln;->g:Lagm;

    new-instance v3, Lkze;

    invoke-virtual {v0}, Lqln;->b()Lqjn;

    move-result-object v4

    invoke-direct {v3, v4}, Lekc;-><init>(Ljava/lang/Object;)V

    iput-object v3, v0, Lqln;->h:Lkze;

    sget-object v3, Lqs7;->o:Lqs7;

    iput-object v3, v0, Lqln;->l:Lqs7;

    new-instance v3, Lagm;

    const/4 v4, 0x6

    invoke-direct {v3, v11, v15, v9, v4}, Lagm;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    iput-object v3, v0, Lqln;->o:Lagm;

    iget-object v3, v1, Lami;->g:Ljava/lang/Object;

    check-cast v3, Lkze;

    new-instance v4, Lpln;

    const/4 v5, 0x0

    invoke-direct {v4, v0, v5}, Lpln;-><init>(Lqln;B)V

    invoke-virtual {v3, v2, v4}, Lekc;->j(Lndc;Lf7f;)V

    iget-object v4, v1, Lami;->h:Ljava/lang/Object;

    check-cast v4, Lkze;

    new-instance v5, Lpln;

    invoke-direct {v5, v0, v14}, Lpln;-><init>(Lqln;B)V

    invoke-virtual {v4, v2, v5}, Lekc;->j(Lndc;Lf7f;)V

    iget-object v1, v1, Lami;->d:Ljava/lang/Object;

    check-cast v1, Ls14;

    iget-object v1, v1, Ls14;->f:Ljava/lang/Object;

    check-cast v1, Lkze;

    new-instance v4, Lpln;

    const/4 v5, 0x2

    invoke-direct {v4, v0, v5}, Lpln;-><init>(Lqln;B)V

    invoke-virtual {v1, v2, v4}, Lekc;->j(Lndc;Lf7f;)V

    new-instance v1, Lpln;

    const/4 v4, 0x3

    invoke-direct {v1, v0, v4}, Lpln;-><init>(Lqln;B)V

    invoke-virtual {v3, v2, v1}, Lekc;->j(Lndc;Lf7f;)V

    new-instance v0, Lvme;

    const/16 v1, 0x13

    invoke-direct {v0, v1}, Lvme;-><init>(B)V

    invoke-static {v11, v2, v13, v0}, Laib;->B(Lw6f;Lndc;Ljava/lang/Object;Lkotlin/jvm/functions/Function0;)V

    new-instance v0, Lvme;

    invoke-direct {v0, v1}, Lvme;-><init>(B)V

    move-object/from16 v1, p6

    invoke-static {v1, v2, v12, v0}, Laib;->B(Lw6f;Lndc;Ljava/lang/Object;Lkotlin/jvm/functions/Function0;)V

    return-void
.end method


# virtual methods
.method public final F(Ljava/lang/Object;)V
    .registers 2

    check-cast p1, Lu4j;

    iget-object p0, p0, Lqln;->q:Li7f;

    invoke-virtual {p0, p1}, Li7f;->b(Ljava/lang/Object;)Z

    return-void
.end method

.method public final H(Ljava/lang/Object;)V
    .registers 2

    check-cast p1, Lu4j;

    iget-object p0, p0, Lqln;->q:Li7f;

    invoke-virtual {p0, p1}, Li7f;->c(Ljava/lang/Object;)Z

    return-void
.end method

.method public final a(Lcom/opera/api/Callback;I)V
    .registers 15

    iget-object v0, p0, Lqln;->o:Lagm;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    iget-object v4, v0, Lagm;->c:Ljava/lang/Object;

    check-cast v4, Lru9;

    iget-object v5, v4, Lru9;->a:Landroid/content/SharedPreferences;

    const-string v6, "wallpaper.rotation.timestamp"

    const-wide v7, 0x7fffffffffffffffL

    invoke-interface {v5, v6, v7, v8}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v9

    cmp-long v5, v9, v7

    const/4 v7, 0x0

    if-nez v5, :cond_21

    move v3, v7

    goto :goto_4e

    :cond_21
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v5

    invoke-virtual {v5, v2, v3}, Ljava/util/Calendar;->setTimeInMillis(J)V

    const/4 v8, 0x6

    invoke-virtual {v5, v8}, Ljava/util/Calendar;->get(I)I

    move-result v5

    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v11

    invoke-virtual {v11, v9, v10}, Ljava/util/Calendar;->setTimeInMillis(J)V

    invoke-virtual {v11, v8}, Ljava/util/Calendar;->get(I)I

    move-result v8

    if-eq v5, v8, :cond_3c

    const/4 v5, 0x1

    goto :goto_3d

    :cond_3c
    move v5, v7

    :goto_3d
    if-eqz v5, :cond_4d

    invoke-virtual {v4}, Lru9;->b()Lnv6;

    move-result-object v4

    iget-object v8, v4, Lnv6;->a:Ljava/lang/Object;

    check-cast v8, Landroid/content/SharedPreferences$Editor;

    invoke-interface {v8, v6, v2, v3}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    invoke-virtual {v4}, Lnv6;->w()V

    :cond_4d
    move v3, v5

    :goto_4e
    const/4 v2, 0x0

    if-eqz v3, :cond_66

    invoke-virtual {v0}, Lagm;->p()Z

    move-result v4

    if-eqz v4, :cond_5d

    const/16 v2, 0xd

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    :cond_5d
    invoke-virtual {p0}, Lqln;->i()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v4}, Lagm;->n(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    goto :goto_6a

    :cond_66
    invoke-virtual {p0}, Lqln;->i()Ljava/lang/String;

    move-result-object v4

    :goto_6a
    iget-boolean v5, p0, Lqln;->r:Z

    if-eqz v5, :cond_7c

    iput-boolean v7, p0, Lqln;->r:Z

    invoke-virtual {v0}, Lagm;->p()Z

    move-result v0

    if-eqz v0, :cond_7c

    const/16 v0, 0xc

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    :cond_7c
    new-instance v0, Lyt3;

    move-object v1, p0

    move-object v6, p1

    move v5, p2

    invoke-direct/range {v0 .. v6}, Lyt3;-><init>(Lqln;Ljava/lang/Integer;ZLjava/lang/String;ILcom/opera/api/Callback;)V

    invoke-virtual {p0, v4, p2, v0}, Lqln;->l(Ljava/lang/String;ILcom/opera/api/Callback;)V

    return-void
.end method

.method public final b()Lqjn;
    .registers 5

    new-instance v0, Lo2c;

    const/4 v1, 0x0

    invoke-direct {v0, v1, v1, v1, v1}, Lo2c;-><init>(ZIIZ)V

    sget-object v1, Lami;->l:Lill;

    iget-object v2, p0, Lqln;->a:Landroid/content/Context;

    invoke-virtual {v1, v2, v0}, Lill;->c(Landroid/content/Context;Lo2c;)Lxkn;

    move-result-object v1

    new-instance v2, Lvk2;

    const/16 v3, 0x19

    invoke-direct {v2, v3}, Lvk2;-><init>(B)V

    new-instance v3, Lqjn;

    iget-object p0, p0, Lqln;->g:Lagm;

    invoke-direct {v3, p0, v1, v2, v0}, Lqjn;-><init>(Lagm;Lxkn;Lcom/opera/api/Callback;Lo2c;)V

    return-object v3
.end method

.method public final c(Ljava/util/stream/Stream;)Ljava/util/stream/Stream;
    .registers 4

    iget-object p0, p0, Lqln;->c:Lx4i;

    iget-object p0, p0, Lx4i;->h:Lode;

    invoke-virtual {p0}, Lekc;->g()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/util/Map;

    if-eqz p0, :cond_1e

    invoke-interface {p0}, Ljava/util/Map;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_1e

    new-instance v0, Lzx1;

    const/16 v1, 0x13

    invoke-direct {v0, p0, v1}, Lzx1;-><init>(Ljava/lang/Object;B)V

    invoke-interface {p1, v0}, Ljava/util/stream/Stream;->filter(Ljava/util/function/Predicate;)Ljava/util/stream/Stream;

    move-result-object p0

    return-object p0

    :cond_1e
    return-object p1
.end method

.method public final e()Ljava/util/List;
    .registers 4

    iget-object v0, p0, Lqln;->f:Lami;

    iget-object v0, v0, Lami;->g:Ljava/lang/Object;

    check-cast v0, Lkze;

    invoke-virtual {v0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    invoke-interface {v0}, Ljava/util/Collection;->stream()Ljava/util/stream/Stream;

    move-result-object v0

    new-instance v1, Lzx1;

    const/16 v2, 0x14

    invoke-direct {v1, p0, v2}, Lzx1;-><init>(Ljava/lang/Object;B)V

    invoke-interface {v0, v1}, Ljava/util/stream/Stream;->filter(Ljava/util/function/Predicate;)Ljava/util/stream/Stream;

    move-result-object p0

    invoke-static {}, Ljava/util/stream/Collectors;->toList()Ljava/util/stream/Collector;

    move-result-object v0

    invoke-interface {p0, v0}, Ljava/util/stream/Stream;->collect(Ljava/util/stream/Collector;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/util/List;

    return-object p0
.end method

.method public final f()Ljava/lang/String;
    .registers 2

    iget-object p0, p0, Lqln;->e:Lcom/opera/android/settings/SettingsManager;

    const-string v0, "wallpaper_rotation_category"

    invoke-virtual {p0, v0}, Lcom/opera/android/settings/SettingsManager;->z(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public final g()Z
    .registers 2

    iget-object p0, p0, Lqln;->e:Lcom/opera/android/settings/SettingsManager;

    const-string v0, "wallpaper_rotation_enabled"

    invoke-virtual {p0, v0}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result p0

    return p0
.end method

.method public final h()Ljava/util/ArrayList;
    .registers 8

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iget-object v1, p0, Lqln;->f:Lami;

    iget-object v2, v1, Lami;->g:Ljava/lang/Object;

    check-cast v2, Lkze;

    invoke-virtual {v2}, Lekc;->g()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/List;

    invoke-interface {v2}, Ljava/util/Collection;->stream()Ljava/util/stream/Stream;

    move-result-object v2

    invoke-virtual {p0, v2}, Lqln;->c(Ljava/util/stream/Stream;)Ljava/util/stream/Stream;

    move-result-object v2

    invoke-static {v2}, Lj$/util/stream/Stream$-EL;->toList(Ljava/util/stream/Stream;)Ljava/util/List;

    move-result-object v2

    iget-object v3, v1, Lami;->d:Ljava/lang/Object;

    check-cast v3, Ls14;

    iget-object v3, v3, Ls14;->f:Ljava/lang/Object;

    check-cast v3, Lkze;

    invoke-virtual {v3}, Lekc;->g()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/List;

    iget-object v1, v1, Lami;->h:Ljava/lang/Object;

    check-cast v1, Lkze;

    invoke-virtual {v1}, Lekc;->g()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/List;

    invoke-virtual {p0}, Lqln;->e()Ljava/util/List;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/List;->isEmpty()Z

    move-result v4

    const/4 v5, 0x0

    if-nez v4, :cond_50

    new-instance v4, Lbkn;

    invoke-interface {p0, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Laln;

    const/16 v6, 0x16

    invoke-direct {v4, p0, v6}, Lbkn;-><init>(Laln;I)V

    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_50
    invoke-interface {v3}, Ljava/util/List;->isEmpty()Z

    move-result p0

    const/4 v4, 0x1

    if-nez p0, :cond_65

    new-instance p0, Lbkn;

    invoke-interface {v3, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Laln;

    invoke-direct {p0, v3, v4}, Lbkn;-><init>(Laln;I)V

    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_65
    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result p0

    if-nez p0, :cond_7b

    new-instance p0, Lbkn;

    invoke-interface {v1, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Laln;

    const/16 v3, 0x17

    invoke-direct {p0, v1, v3}, Lbkn;-><init>(Laln;I)V

    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_7b
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_7f
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_b7

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Laln;

    invoke-interface {v1}, Laln;->f()I

    move-result v2

    invoke-static {v2, v5}, Lvep;->e(II)Z

    move-result v2

    if-nez v2, :cond_b2

    invoke-interface {v1}, Laln;->f()I

    move-result v2

    invoke-static {v2, v4}, Lvep;->e(II)Z

    move-result v2

    if-nez v2, :cond_b2

    invoke-interface {v1}, Laln;->getType()I

    move-result v2

    const/4 v3, 0x2

    if-ne v2, v3, :cond_b2

    new-instance v2, Lbkn;

    invoke-interface {v1}, Laln;->f()I

    move-result v3

    invoke-direct {v2, v1, v3}, Lbkn;-><init>(Laln;I)V

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_b2
    invoke-interface {v1}, Laln;->f()I

    move-result v5

    goto :goto_7f

    :cond_b7
    return-object v0
.end method

.method public final i()Ljava/lang/String;
    .registers 2

    iget-object p0, p0, Lqln;->e:Lcom/opera/android/settings/SettingsManager;

    const-string v0, "wallpaper_current"

    invoke-virtual {p0, v0}, Lcom/opera/android/settings/SettingsManager;->z(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public final j()Ljava/util/ArrayList;
    .registers 8

    invoke-virtual {p0}, Lqln;->i()Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lqln;->f:Lami;

    iget-object v2, v1, Lami;->g:Ljava/lang/Object;

    check-cast v2, Lkze;

    invoke-virtual {v2}, Lekc;->g()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/List;

    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    invoke-interface {v2}, Ljava/util/Collection;->stream()Ljava/util/stream/Stream;

    move-result-object v4

    new-instance v5, Ln0h;

    const/4 v6, 0x3

    invoke-direct {v5, v0, v6}, Ln0h;-><init>(Ljava/lang/String;B)V

    invoke-interface {v4, v5}, Ljava/util/stream/Stream;->filter(Ljava/util/function/Predicate;)Ljava/util/stream/Stream;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/stream/Stream;->findFirst()Ljava/util/Optional;

    move-result-object v4

    new-instance v5, Lpv1;

    const/16 v6, 0x9

    invoke-direct {v5, v3, v6}, Lpv1;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v4, v5}, Ljava/util/Optional;->ifPresent(Ljava/util/function/Consumer;)V

    invoke-virtual {p0}, Lqln;->f()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->isEmpty()Z

    move-result v4

    if-eqz v4, :cond_40

    invoke-virtual {p0}, Lqln;->e()Ljava/util/List;

    move-result-object p0

    goto :goto_91

    :cond_40
    invoke-virtual {p0}, Lqln;->f()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lam2;->a(Ljava/lang/String;)I

    move-result v4

    invoke-static {v4}, Lvep;->A(I)I

    move-result v5

    if-eqz v5, :cond_83

    const/16 v6, 0x15

    if-eq v5, v6, :cond_7e

    const/16 v6, 0x16

    if-eq v5, v6, :cond_73

    invoke-interface {v2}, Ljava/util/Collection;->stream()Ljava/util/stream/Stream;

    move-result-object v1

    new-instance v2, Lz3g;

    const/4 v5, 0x2

    invoke-direct {v2, v5, v4}, Lz3g;-><init>(BI)V

    invoke-interface {v1, v2}, Ljava/util/stream/Stream;->filter(Ljava/util/function/Predicate;)Ljava/util/stream/Stream;

    move-result-object v1

    invoke-virtual {p0, v1}, Lqln;->c(Ljava/util/stream/Stream;)Ljava/util/stream/Stream;

    move-result-object p0

    invoke-static {}, Ljava/util/stream/Collectors;->toList()Ljava/util/stream/Collector;

    move-result-object v1

    invoke-interface {p0, v1}, Ljava/util/stream/Stream;->collect(Ljava/util/stream/Collector;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/util/List;

    goto :goto_91

    :cond_73
    iget-object p0, v1, Lami;->h:Ljava/lang/Object;

    check-cast p0, Lkze;

    invoke-virtual {p0}, Lekc;->g()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/util/List;

    goto :goto_91

    :cond_7e
    invoke-virtual {p0}, Lqln;->e()Ljava/util/List;

    move-result-object p0

    goto :goto_91

    :cond_83
    iget-object p0, v1, Lami;->d:Ljava/lang/Object;

    check-cast p0, Ls14;

    iget-object p0, p0, Ls14;->f:Ljava/lang/Object;

    check-cast p0, Lkze;

    invoke-virtual {p0}, Lekc;->g()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/util/List;

    :goto_91
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_95
    :goto_95
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_af

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Laln;

    invoke-interface {v1}, Laln;->getId()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_95

    invoke-virtual {v3, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_95

    :cond_af
    return-object v3
.end method

.method public final k(Ljava/util/Set;)Ljava/util/ArrayList;
    .registers 5

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iget-object p0, p0, Lqln;->f:Lami;

    iget-object p0, p0, Lami;->g:Ljava/lang/Object;

    check-cast p0, Lkze;

    invoke-virtual {p0}, Lekc;->g()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/util/List;

    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_15
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_29

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Laln;

    invoke-interface {v1}, Laln;->getId()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_15

    :cond_29
    new-instance p0, Ljava/util/ArrayList;

    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    invoke-interface {p1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_32
    :goto_32
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_4e

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_32

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Laln;

    invoke-virtual {p0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_32

    :cond_4e
    return-object p0
.end method

.method public final l(Ljava/lang/String;ILcom/opera/api/Callback;)V
    .registers 6

    new-instance v0, Liyk;

    const/16 v1, 0xe

    invoke-direct {v0, p0, p3, v1}, Liyk;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    iget-object p0, p0, Lqln;->f:Lami;

    invoke-virtual {p0, p1, p2, v0}, Lami;->k(Ljava/lang/String;ILcom/opera/api/Callback;)V

    return-void
.end method

.method public final m(Ljava/lang/String;)V
    .registers 4

    iget-object v0, p0, Lqln;->j:Lvzk;

    iget-object v1, v0, Lvzk;->d:Ljava/lang/Object;

    check-cast v1, Ljava/util/ArrayList;

    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    invoke-virtual {v0}, Lvzk;->i0()V

    iget-object p1, v0, Lvzk;->c:Ljava/lang/Object;

    check-cast p1, Lkze;

    invoke-virtual {p1}, Lekc;->g()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/util/List;

    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    move-result p1

    if-eqz p1, :cond_31

    invoke-virtual {p0}, Lqln;->f()Ljava/lang/String;

    move-result-object p1

    const-string v0, "favorites"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_31

    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Lqln;->o(Z)V

    const-string p1, "most_popular"

    invoke-virtual {p0, p1}, Lqln;->n(Ljava/lang/String;)V

    :cond_31
    return-void
.end method

.method public final n(Ljava/lang/String;)V
    .registers 4

    new-instance v0, Leek;

    const/16 v1, 0x18

    invoke-direct {v0, p0, p1, v1}, Leek;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    iget-object v1, p0, Lqln;->o:Lagm;

    invoke-virtual {v1, p1, v0}, Lagm;->u(Ljava/lang/String;Lkotlin/jvm/functions/Function0;)V

    iget-object p1, p0, Lqln;->n:Lay;

    invoke-virtual {p1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lkze;

    invoke-virtual {p0}, Lqln;->j()Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {p1, v0}, Lekc;->r(Ljava/lang/Object;)V

    invoke-virtual {p0}, Lqln;->g()Z

    move-result p1

    if-eqz p1, :cond_2c

    sget-object p1, Lava;->a:Lcva;

    new-instance v0, Lnln;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lnln;-><init>(Lqln;B)V

    invoke-virtual {p1, v0}, Lcva;->a(Ljava/lang/Runnable;)V

    :cond_2c
    return-void
.end method

.method public final o(Z)V
    .registers 6

    iget-object p0, p0, Lqln;->o:Lagm;

    iget-object v0, p0, Lagm;->d:Ljava/lang/Object;

    check-cast v0, Lonn;

    iget-object v1, p0, Lagm;->c:Ljava/lang/Object;

    check-cast v1, Lru9;

    invoke-virtual {v0}, Lonn;->a()V

    iget-object p0, p0, Lagm;->b:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/settings/SettingsManager;

    const-string v2, "wallpaper_rotation_enabled"

    invoke-virtual {p0, p1, v2}, Lcom/opera/android/settings/SettingsManager;->V(ILjava/lang/String;)V

    const/4 p0, 0x1

    invoke-virtual {v0, p1, p0}, Lonn;->d(ZZ)V

    const-string p0, "wallpaper.rotation.timestamp"

    if-eqz p1, :cond_31

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    invoke-virtual {v1}, Lru9;->b()Lnv6;

    move-result-object p1

    iget-object v0, p1, Lnv6;->a:Ljava/lang/Object;

    check-cast v0, Landroid/content/SharedPreferences$Editor;

    invoke-interface {v0, p0, v2, v3}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    invoke-virtual {p1}, Lnv6;->w()V

    return-void

    :cond_31
    invoke-virtual {v1}, Lru9;->b()Lnv6;

    move-result-object p1

    iget-object v0, p1, Lnv6;->a:Ljava/lang/Object;

    check-cast v0, Landroid/content/SharedPreferences$Editor;

    const-wide v1, 0x7fffffffffffffffL

    invoke-interface {v0, p0, v1, v2}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    invoke-virtual {p1}, Lnv6;->w()V

    return-void
.end method

.method public final p(ILjava/lang/String;)V
    .registers 9

    iget-object v0, p0, Lqln;->l:Lqs7;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sput-object p2, Lqs7;->p:Ljava/lang/String;

    new-instance v0, Ltt2;

    const/4 v1, 0x7

    invoke-direct {v0, p0, p1, v1}, Ltt2;-><init>(Ljava/lang/Object;IB)V

    iget-object v2, p0, Lqln;->f:Lami;

    const/4 v3, 0x0

    invoke-virtual {v2, p2, v3, v0}, Lami;->k(Ljava/lang/String;ILcom/opera/api/Callback;)V

    invoke-virtual {p0}, Lqln;->i()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    const/4 v2, 0x1

    if-eqz v0, :cond_29

    new-instance p1, Lvk2;

    const/16 p2, 0x1a

    invoke-direct {p1, p2}, Lvk2;-><init>(B)V

    invoke-virtual {p0, p1, v2}, Lqln;->a(Lcom/opera/api/Callback;I)V

    return-void

    :cond_29
    if-eq p1, v1, :cond_34

    const/16 v0, 0xd

    if-eq p1, v0, :cond_34

    const/16 v0, 0x10

    if-eq p1, v0, :cond_34

    move v3, v2

    :cond_34
    iget-object p1, p0, Lqln;->e:Lcom/opera/android/settings/SettingsManager;

    if-eqz v3, :cond_49

    iget-object v0, p1, Lcom/opera/android/settings/SettingsManager;->a:Ly9j;

    const-string v1, "manual_wallpaper_first_occurrence"

    invoke-interface {v0, v1}, Ly9j;->contains(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_49

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    invoke-virtual {p1, v4, v5, v1}, Lcom/opera/android/settings/SettingsManager;->W(JLjava/lang/String;)V

    :cond_49
    const-string v0, "wallpaper_current"

    invoke-virtual {p1, v0, p2}, Lcom/opera/android/settings/SettingsManager;->Y(Ljava/lang/String;Ljava/lang/String;)V

    iget-object p0, p0, Lqln;->q:Li7f;

    invoke-static {p0, p0}, Lu35;->c(Li7f;Li7f;)Lg7f;

    move-result-object p0

    :goto_54
    invoke-virtual {p0}, Lg7f;->hasNext()Z

    move-result p1

    if-eqz p1, :cond_74

    invoke-virtual {p0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lu4j;

    if-eqz v3, :cond_70

    iget-object p1, p1, Lu4j;->a:Lj4c;

    invoke-virtual {p1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ly3i;

    sget-object p2, Lt4j;->a:Lt4j;

    invoke-interface {p1, p2}, Ly3i;->n(Lz1e;)V

    goto :goto_54

    :cond_70
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    goto :goto_54

    :cond_74
    return-void
.end method

.method public final q(Ljava/util/Set;)V
    .registers 3

    iget-object p0, p0, Lqln;->k:Lvs8;

    iget-object p0, p0, Lvs8;->b:Lekc;

    check-cast p0, Lpde;

    invoke-virtual {p0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Iterable;

    invoke-static {v0}, Lkotlin/collections/CollectionsKt;->m0(Ljava/lang/Iterable;)Ljava/util/LinkedHashSet;

    move-result-object v0

    check-cast p1, Ljava/util/Collection;

    invoke-interface {v0, p1}, Ljava/util/Set;->addAll(Ljava/util/Collection;)Z

    invoke-static {p0, v0}, Lxf8;->F0(Lpde;Ljava/lang/Object;)Z

    return-void
.end method

.method public final r()V
    .registers 3

    iget-object v0, p0, Lqln;->f:Lami;

    iget-object v0, v0, Lami;->e:Ljava/lang/Object;

    check-cast v0, Lvq8;

    invoke-virtual {v0}, Lvq8;->i()Z

    move-result v0

    if-nez v0, :cond_d

    return-void

    :cond_d
    iget-object v0, p0, Lqln;->n:Lay;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lkze;

    invoke-virtual {p0}, Lqln;->j()Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v0, v1}, Lekc;->r(Ljava/lang/Object;)V

    invoke-virtual {p0}, Lqln;->f()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lqln;->n(Ljava/lang/String;)V

    return-void
.end method

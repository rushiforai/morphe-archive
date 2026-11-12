.class public final Lb8k;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Led;
.implements Lu9j;
.implements Lp5j;


# instance fields
.field public final a:Landroid/content/Context;

.field public final b:Lcom/opera/android/settings/SettingsManager;

.field public final c:Lqln;

.field public final d:Lxnh;

.field public final e:Lkze;

.field public final f:Lfue;

.field public final g:Lode;

.field public final h:Lmgh;

.field public final i:Lhx5;

.field public final j:Likc;

.field public final k:Lfd;

.field public final l:Likc;

.field public final m:Lv9j;

.field public final n:Lh42;

.field public o:Ljava/util/List;

.field public p:Z

.field public q:Z

.field public r:Z

.field public s:Z

.field public final t:Ljava/util/Set;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/opera/android/settings/SettingsManager;Lqln;Lxnh;Lkze;Lfue;Lode;Lmgh;Lhx5;Likc;Lfd;Likc;)V
    .registers 13

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lb8k;->a:Landroid/content/Context;

    iput-object p2, p0, Lb8k;->b:Lcom/opera/android/settings/SettingsManager;

    iput-object p3, p0, Lb8k;->c:Lqln;

    iput-object p4, p0, Lb8k;->d:Lxnh;

    iput-object p5, p0, Lb8k;->e:Lkze;

    iput-object p6, p0, Lb8k;->f:Lfue;

    iput-object p7, p0, Lb8k;->g:Lode;

    iput-object p8, p0, Lb8k;->h:Lmgh;

    iput-object p9, p0, Lb8k;->i:Lhx5;

    iput-object p10, p0, Lb8k;->j:Likc;

    iput-object p11, p0, Lb8k;->k:Lfd;

    iput-object p12, p0, Lb8k;->l:Likc;

    new-instance p1, Lv9j;

    invoke-direct {p1, p0}, Lv9j;-><init>(Lu9j;)V

    iput-object p1, p0, Lb8k;->m:Lv9j;

    invoke-static {p1}, Lb8h;->d(Lekc;)Lh42;

    move-result-object p1

    iput-object p1, p0, Lb8k;->n:Lh42;

    sget-object p1, Ll08;->a:Ll08;

    iput-object p1, p0, Lb8k;->o:Ljava/util/List;

    const-string p11, "enable_weather"

    const-string p12, "app_layout"

    const-string p2, "wallpaper_current"

    const-string p3, "speed_dial.enabled"

    const-string p4, "enable_suggested_speed_dials_on_start_page"

    const-string p5, "live_scores_enabled"

    const-string p6, "enable_newsfeed"

    const-string p7, "enable_start_page_customize_button"

    const-string p8, "enable_start_page_opera_logo"

    const-string p9, "enable_search_shortcuts"

    const-string p10, "enable_search_shortcuts_tablet"

    filled-new-array/range {p2 .. p12}, [Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Le82;->E([Ljava/lang/Object;)Ljava/util/Set;

    move-result-object p1

    iput-object p1, p0, Lb8k;->t:Ljava/util/Set;

    return-void
.end method


# virtual methods
.method public final M(Ljava/lang/String;)V
    .registers 3

    iget-object v0, p0, Lb8k;->t:Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_b

    invoke-virtual {p0}, Lb8k;->b()V

    :cond_b
    return-void
.end method

.method public final a()V
    .registers 1

    invoke-virtual {p0}, Lb8k;->b()V

    return-void
.end method

.method public final b()V
    .registers 21

    move-object/from16 v0, p0

    new-instance v2, Lknn;

    iget-object v1, v0, Lb8k;->o:Ljava/util/List;

    const-string v3, "wallpaper_current"

    iget-object v4, v0, Lb8k;->b:Lcom/opera/android/settings/SettingsManager;

    invoke-virtual {v4, v3}, Lcom/opera/android/settings/SettingsManager;->z(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v1, v3}, Lknn;-><init>(Ljava/util/List;Ljava/lang/String;)V

    new-instance v3, Lyt8;

    iget-boolean v1, v0, Lb8k;->q:Z

    iget-boolean v5, v0, Lb8k;->r:Z

    iget-object v6, v0, Lb8k;->h:Lmgh;

    iget-object v7, v6, Lmgh;->c:Ljava/lang/Object;

    check-cast v7, Lru9;

    iget-object v8, v7, Lru9;->a:Landroid/content/SharedPreferences;

    const-string v9, "startpage.logo_fits"

    invoke-interface {v8, v9}, Landroid/content/SharedPreferences;->contains(Ljava/lang/String;)Z

    move-result v8

    const/4 v11, 0x1

    if-eqz v8, :cond_33

    iget-object v7, v7, Lru9;->a:Landroid/content/SharedPreferences;

    invoke-interface {v7, v9, v11}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v7

    invoke-static {v7}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v7

    goto :goto_34

    :cond_33
    const/4 v7, 0x0

    :goto_34
    if-eqz v7, :cond_3b

    invoke-virtual {v7}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v7

    goto :goto_3c

    :cond_3b
    move v7, v11

    :goto_3c
    invoke-virtual {v6, v7, v5}, Lmgh;->k(ZZ)Z

    move-result v5

    invoke-direct {v3, v1, v5}, Lyt8;-><init>(ZZ)V

    new-instance v1, Lyt8;

    iget-boolean v5, v0, Lb8k;->s:Z

    const-string v6, "enable_weather"

    invoke-virtual {v4, v6}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result v6

    invoke-direct {v1, v5, v6}, Lyt8;-><init>(ZZ)V

    new-instance v12, Lyt8;

    const-string v5, "speed_dial.enabled"

    invoke-virtual {v4, v5}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result v5

    invoke-direct {v12, v11, v5}, Lyt8;-><init>(ZZ)V

    new-instance v13, Lyt8;

    iget-object v5, v0, Lb8k;->d:Lxnh;

    invoke-virtual {v5}, Lno7;->i()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lwnh;

    const/high16 v6, 0x8000000

    invoke-virtual {v5, v6}, Lwnh;->a(I)Z

    move-result v5

    const-string v6, "enable_suggested_speed_dials_on_start_page"

    invoke-virtual {v4, v6}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result v6

    invoke-direct {v13, v5, v6}, Lyt8;-><init>(ZZ)V

    new-instance v8, Lyt8;

    const/4 v5, 0x0

    invoke-direct {v8, v5, v5}, Lyt8;-><init>(ZZ)V

    new-instance v9, Lyt8;

    iget-boolean v6, v0, Lb8k;->p:Z

    const-string v7, "live_scores_enabled"

    invoke-virtual {v4, v7}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result v7

    invoke-direct {v9, v6, v7}, Lyt8;-><init>(ZZ)V

    iget-object v6, v0, Lb8k;->j:Likc;

    invoke-virtual {v6}, Lekc;->g()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lyt8;

    new-instance v7, Lyt8;

    iget-object v14, v0, Lb8k;->f:Lfue;

    invoke-virtual {v14}, Lfue;->d()V

    iget-object v14, v14, Lfue;->a:Lcue;

    sget-object v15, Lcue;->b:Lcue;

    if-eq v14, v15, :cond_9e

    move v14, v11

    goto :goto_9f

    :cond_9e
    move v14, v5

    :goto_9f
    const-string v15, "enable_newsfeed"

    invoke-virtual {v4, v15}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result v15

    invoke-direct {v7, v14, v15}, Lyt8;-><init>(ZZ)V

    new-instance v5, Lyt8;

    const-string v15, "enable_start_page_customize_button"

    invoke-virtual {v4, v15}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result v15

    invoke-direct {v5, v11, v15}, Lyt8;-><init>(ZZ)V

    sget-object v15, Lpc;->z:Lpc;

    iget-object v10, v0, Lb8k;->k:Lfd;

    invoke-virtual {v10, v15}, Lfd;->b(Lpc;)Z

    move-result v15

    if-nez v15, :cond_c7

    sget-object v14, Lpc;->m:Lpc;

    invoke-virtual {v10, v14}, Lfd;->b(Lpc;)Z

    move-result v10

    if-nez v10, :cond_c7

    const/4 v10, 0x0

    goto :goto_c8

    :cond_c7
    move v10, v11

    :goto_c8
    iget-object v14, v0, Lb8k;->g:Lode;

    invoke-virtual {v14}, Lekc;->g()Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Lt8k;

    if-eqz v14, :cond_d5

    iget-object v14, v14, Lt8k;->d:Lr8k;

    goto :goto_d6

    :cond_d5
    const/4 v14, 0x0

    :goto_d6
    sget-object v11, Lr8k;->b:Lr8k;

    if-ne v14, v11, :cond_dc

    const/4 v11, 0x1

    goto :goto_dd

    :cond_dc
    const/4 v11, 0x0

    :goto_dd
    invoke-virtual {v4}, Lcom/opera/android/settings/SettingsManager;->f()Le7j;

    move-result-object v14

    move-object/from16 v16, v1

    sget-object v1, Le7j;->d:Le7j;

    if-ne v14, v1, :cond_eb

    const/4 v14, 0x1

    :goto_e8
    move-object/from16 v17, v2

    goto :goto_ed

    :cond_eb
    const/4 v14, 0x0

    goto :goto_e8

    :goto_ed
    const-string v2, "enable_search_shortcuts"

    invoke-virtual {v4, v2}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result v2

    move/from16 v18, v10

    move-object v10, v6

    new-instance v6, Lrsi;

    if-eqz v11, :cond_100

    if-eqz v18, :cond_100

    if-nez v14, :cond_100

    const/4 v11, 0x1

    goto :goto_101

    :cond_100
    const/4 v11, 0x0

    :goto_101
    if-eqz v15, :cond_10c

    new-instance v14, Lrxh;

    const v15, 0x7f14110c

    invoke-direct {v14, v15}, Lrxh;-><init>(I)V

    goto :goto_114

    :cond_10c
    new-instance v14, Lrxh;

    const v15, 0x7f14110d

    invoke-direct {v14, v15}, Lrxh;-><init>(I)V

    :goto_114
    if-eqz v2, :cond_11e

    const v18, 0x7f0804eb

    move/from16 v15, v18

    :goto_11b
    move-object/from16 v19, v3

    goto :goto_122

    :cond_11e
    const v15, 0x7f0804ea

    goto :goto_11b

    :goto_122
    new-instance v3, Llxh;

    invoke-direct {v3, v15}, Llxh;-><init>(I)V

    invoke-direct {v6, v11, v2, v14, v3}, Lrsi;-><init>(ZZLrxh;Llxh;)V

    invoke-virtual {v4}, Lcom/opera/android/settings/SettingsManager;->f()Le7j;

    move-result-object v2

    if-ne v2, v1, :cond_132

    const/4 v1, 0x1

    goto :goto_133

    :cond_132
    const/4 v1, 0x0

    :goto_133
    iget-object v2, v0, Lb8k;->l:Likc;

    invoke-virtual {v2}, Lekc;->g()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lkl5;

    iget-object v2, v2, Lkl5;->b:Landroid/graphics/Rect;

    invoke-virtual {v2}, Landroid/graphics/Rect;->width()I

    move-result v2

    iget-object v3, v0, Lb8k;->a:Landroid/content/Context;

    invoke-static {v2, v3}, Lddh;->t(ILandroid/content/Context;)Lhpj;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Enum;->ordinal()I

    move-result v2

    const/4 v3, 0x1

    if-eqz v2, :cond_15c

    if-eq v2, v3, :cond_15a

    const/4 v11, 0x2

    if-eq v2, v11, :cond_15a

    const/4 v11, 0x3

    if-eq v2, v11, :cond_15a

    invoke-static {}, Lh9o;->p()V

    return-void

    :cond_15a
    move v2, v3

    goto :goto_15d

    :cond_15c
    const/4 v2, 0x0

    :goto_15d
    const-string v11, "enable_search_shortcuts_tablet"

    invoke-virtual {v4, v11}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result v4

    move-object v11, v7

    new-instance v7, Lrsi;

    if-eqz v1, :cond_16a

    if-nez v2, :cond_16b

    :cond_16a
    const/4 v3, 0x0

    :cond_16b
    new-instance v1, Lrxh;

    const v2, 0x7f14110e

    invoke-direct {v1, v2}, Lrxh;-><init>(I)V

    new-instance v2, Llxh;

    const v14, 0x7f0804ea

    invoke-direct {v2, v14}, Llxh;-><init>(I)V

    invoke-direct {v7, v3, v4, v1, v2}, Lrsi;-><init>(ZZLrxh;Llxh;)V

    new-instance v1, Lz7k;

    move-object/from16 v4, v16

    move-object/from16 v2, v17

    move-object/from16 v3, v19

    invoke-direct/range {v1 .. v13}, Lz7k;-><init>(Lknn;Lyt8;Lyt8;Lyt8;Lrsi;Lrsi;Lyt8;Lyt8;Lyt8;Lyt8;Lyt8;Lyt8;)V

    iget-object v0, v0, Lb8k;->m:Lv9j;

    invoke-virtual {v0, v1}, Lekc;->r(Ljava/lang/Object;)V

    return-void
.end method

.method public final j()V
    .registers 6

    invoke-virtual {p0}, Lb8k;->b()V

    iget-object v0, p0, Lb8k;->b:Lcom/opera/android/settings/SettingsManager;

    invoke-virtual {v0, p0}, Lcom/opera/android/settings/SettingsManager;->a(Lp5j;)V

    iget-object v0, p0, Lb8k;->c:Lqln;

    iget-object v1, v0, Lqln;->f:Lami;

    new-instance v2, Lrl;

    const/4 v3, 0x4

    invoke-direct {v2, v3}, Lrl;-><init>(B)V

    invoke-virtual {v1, v2}, Lami;->r(Ljava/lang/Runnable;)V

    iget-object v0, v0, Lqln;->n:Lay;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lize;

    new-instance v1, La8k;

    const/4 v2, 0x0

    invoke-direct {v1, p0, v2}, La8k;-><init>(Lb8k;B)V

    new-instance v2, Lt7d;

    const/16 v4, 0x12

    invoke-direct {v2, v1, v4}, Lt7d;-><init>(Lkotlin/jvm/functions/Function1;B)V

    iget-object v1, p0, Lb8k;->m:Lv9j;

    invoke-virtual {v1, v0, v2}, Lh42;->s(Lekc;Lf7f;)V

    new-instance v0, La8k;

    const/4 v2, 0x1

    invoke-direct {v0, p0, v2}, La8k;-><init>(Lb8k;B)V

    new-instance v2, Lt7d;

    invoke-direct {v2, v0, v4}, Lt7d;-><init>(Lkotlin/jvm/functions/Function1;B)V

    iget-object v0, p0, Lb8k;->e:Lkze;

    invoke-virtual {v1, v0, v2}, Lh42;->s(Lekc;Lf7f;)V

    new-instance v0, La8k;

    const/4 v2, 0x2

    invoke-direct {v0, p0, v2}, La8k;-><init>(Lb8k;B)V

    new-instance v2, Lt7d;

    invoke-direct {v2, v0, v4}, Lt7d;-><init>(Lkotlin/jvm/functions/Function1;B)V

    iget-object v0, p0, Lb8k;->g:Lode;

    invoke-virtual {v1, v0, v2}, Lh42;->s(Lekc;Lf7f;)V

    new-instance v0, La8k;

    const/4 v2, 0x3

    invoke-direct {v0, p0, v2}, La8k;-><init>(Lb8k;B)V

    new-instance v2, Lt7d;

    invoke-direct {v2, v0, v4}, Lt7d;-><init>(Lkotlin/jvm/functions/Function1;B)V

    iget-object v0, p0, Lb8k;->i:Lhx5;

    invoke-virtual {v1, v0, v2}, Lh42;->s(Lekc;Lf7f;)V

    new-instance v0, La8k;

    invoke-direct {v0, p0, v3}, La8k;-><init>(Lb8k;B)V

    new-instance v2, Lt7d;

    invoke-direct {v2, v0, v4}, Lt7d;-><init>(Lkotlin/jvm/functions/Function1;B)V

    iget-object v0, p0, Lb8k;->j:Likc;

    invoke-virtual {v1, v0, v2}, Lh42;->s(Lekc;Lf7f;)V

    new-instance v0, La8k;

    const/4 v2, 0x5

    invoke-direct {v0, p0, v2}, La8k;-><init>(Lb8k;B)V

    new-instance v2, Lt7d;

    invoke-direct {v2, v0, v4}, Lt7d;-><init>(Lkotlin/jvm/functions/Function1;B)V

    iget-object v0, p0, Lb8k;->l:Likc;

    invoke-virtual {v1, v0, v2}, Lh42;->s(Lekc;Lf7f;)V

    iget-object v0, p0, Lb8k;->k:Lfd;

    iget-object v0, v0, Lfd;->d:Li7f;

    invoke-virtual {v0, p0}, Li7f;->b(Ljava/lang/Object;)Z

    invoke-virtual {p0}, Lb8k;->a()V

    return-void
.end method

.method public final onStopped()V
    .registers 3

    iget-object v0, p0, Lb8k;->c:Lqln;

    iget-object v0, v0, Lqln;->n:Lay;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lize;

    iget-object v1, p0, Lb8k;->m:Lv9j;

    invoke-virtual {v1, v0}, Lh42;->t(Lekc;)V

    iget-object v0, p0, Lb8k;->e:Lkze;

    invoke-virtual {v1, v0}, Lh42;->t(Lekc;)V

    iget-object v0, p0, Lb8k;->g:Lode;

    invoke-virtual {v1, v0}, Lh42;->t(Lekc;)V

    iget-object v0, p0, Lb8k;->i:Lhx5;

    invoke-virtual {v1, v0}, Lh42;->t(Lekc;)V

    iget-object v0, p0, Lb8k;->j:Likc;

    invoke-virtual {v1, v0}, Lh42;->t(Lekc;)V

    iget-object v0, p0, Lb8k;->l:Likc;

    invoke-virtual {v1, v0}, Lh42;->t(Lekc;)V

    iget-object v0, p0, Lb8k;->k:Lfd;

    iget-object v0, v0, Lfd;->d:Li7f;

    invoke-virtual {v0, p0}, Li7f;->c(Ljava/lang/Object;)Z

    iget-object v0, p0, Lb8k;->b:Lcom/opera/android/settings/SettingsManager;

    invoke-virtual {v0, p0}, Lcom/opera/android/settings/SettingsManager;->T(Lp5j;)V

    return-void
.end method

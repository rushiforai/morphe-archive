.class public final Lpsi;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lcom/opera/android/settings/SettingsManager;

.field public final b:Lxnh;

.field public final c:Lq6e;

.field public final d:Lf99;

.field public final e:Lf99;

.field public final f:Lf99;

.field public final g:Ljbf;

.field public final h:Lwok;

.field public final i:Lew3;

.field public final j:Lplh;

.field public final k:Lf99;

.field public final l:Ljdj;

.field public final m:Lr9g;

.field public n:Z

.field public o:Z

.field public p:Z

.field public q:Z

.field public r:Z

.field public final s:Ljava/util/Set;

.field public final t:Lf99;


# direct methods
.method public constructor <init>(Lcom/opera/android/settings/SettingsManager;Lxnh;Lq6e;Lf99;Lf99;Lf99;Ljbf;Lwok;Lew3;Lplh;Lplh;)V
    .registers 31

    move-object/from16 v0, p0

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    move-object/from16 v1, p1

    iput-object v1, v0, Lpsi;->a:Lcom/opera/android/settings/SettingsManager;

    move-object/from16 v1, p2

    iput-object v1, v0, Lpsi;->b:Lxnh;

    move-object/from16 v1, p3

    iput-object v1, v0, Lpsi;->c:Lq6e;

    move-object/from16 v1, p4

    iput-object v1, v0, Lpsi;->d:Lf99;

    move-object/from16 v1, p5

    iput-object v1, v0, Lpsi;->e:Lf99;

    move-object/from16 v1, p6

    iput-object v1, v0, Lpsi;->f:Lf99;

    move-object/from16 v1, p7

    iput-object v1, v0, Lpsi;->g:Ljbf;

    move-object/from16 v1, p8

    iput-object v1, v0, Lpsi;->h:Lwok;

    move-object/from16 v1, p9

    iput-object v1, v0, Lpsi;->i:Lew3;

    move-object/from16 v1, p10

    iput-object v1, v0, Lpsi;->j:Lplh;

    move-object/from16 v1, p11

    iput-object v1, v0, Lpsi;->k:Lf99;

    const/4 v1, 0x5

    const/4 v2, 0x0

    const/4 v3, 0x1

    const/4 v4, 0x0

    invoke-static {v2, v3, v4, v1}, Lipe;->c(IILh04;I)Ljdj;

    move-result-object v1

    iput-object v1, v0, Lpsi;->l:Ljdj;

    new-instance v1, Lr9g;

    const/16 v3, 0x1d

    invoke-direct {v1, v0, v3}, Lr9g;-><init>(Ljava/lang/Object;B)V

    iput-object v1, v0, Lpsi;->m:Lr9g;

    iput-boolean v2, v0, Lpsi;->n:Z

    const-string v17, "enable_product_suggestion"

    const-string v18, "enable_google_ai_mode"

    const-string v5, "autocomplete_omnibar"

    const-string v6, "enable_suggested_speed_dials"

    const-string v7, "enable_frequently_visited_sites"

    const-string v8, "enable_recent_searches"

    const-string v9, "enable_trending_searches"

    const-string v10, "enable_suggestion_provider_clipboard"

    const-string v11, "enable_suggestion_provider_recommendations"

    const-string v12, "enable_suggestion_provider_history"

    const-string v13, "enable_suggestion_provider_bookmarks"

    const-string v14, "enable_suggestion_provider_speeddials"

    const-string v15, "enable_suggestion_provider_ai_prompts"

    const-string v16, "enable_suggestion_provider_ai_recent_activity"

    filled-new-array/range {v5 .. v18}, [Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Le82;->E([Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v1

    iput-object v1, v0, Lpsi;->s:Ljava/util/Set;

    new-instance v1, Lr8h;

    const/16 v2, 0xc

    invoke-direct {v1, v2, v4, v0}, Lr8h;-><init>(BLmt5;Ljava/lang/Object;)V

    invoke-static {v1}, Lf03;->g(Lkotlin/jvm/functions/Function2;)Lj94;

    move-result-object v1

    const/4 v2, -0x1

    invoke-static {v1, v2}, Lic4;->l(Lf99;I)Lf99;

    move-result-object v1

    iput-object v1, v0, Lpsi;->t:Lf99;

    return-void
.end method


# virtual methods
.method public final a()Lmsi;
    .registers 28

    move-object/from16 v0, p0

    iget-object v1, v0, Lpsi;->c:Lq6e;

    invoke-virtual {v1}, Lq6e;->b()Leri;

    move-result-object v3

    iget-boolean v4, v0, Lpsi;->r:Z

    const-string v2, "enable_google_ai_mode"

    iget-object v5, v0, Lpsi;->a:Lcom/opera/android/settings/SettingsManager;

    invoke-virtual {v5, v2}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result v2

    const-string v6, "autocomplete_omnibar"

    invoke-virtual {v5, v6}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result v6

    const-string v7, "enable_suggestion_provider_recommendations"

    invoke-virtual {v5, v7}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result v13

    const-string v7, "enable_suggested_speed_dials"

    invoke-virtual {v5, v7}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result v7

    iget-object v8, v0, Lpsi;->h:Lwok;

    invoke-virtual {v8}, Lno7;->i()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lvok;

    iget-boolean v9, v0, Lpsi;->o:Z

    if-nez v9, :cond_5c

    iget-object v9, v0, Lpsi;->g:Ljbf;

    invoke-virtual {v9}, Lno7;->i()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Libf;

    const/16 v12, 0x800

    invoke-virtual {v9, v12}, Libf;->a(I)Z

    move-result v9

    if-nez v9, :cond_5c

    iget v8, v8, Lvok;->a:I

    and-int/lit8 v9, v8, 0x4

    if-nez v9, :cond_5c

    and-int/lit8 v8, v8, 0x8

    if-nez v8, :cond_5c

    iget-object v8, v0, Lpsi;->b:Lxnh;

    invoke-virtual {v8}, Lno7;->i()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lwnh;

    const/high16 v9, 0x800000

    invoke-virtual {v8, v9}, Lwnh;->a(I)Z

    move-result v8

    if-eqz v8, :cond_5c

    const/4 v8, 0x0

    goto :goto_5d

    :cond_5c
    const/4 v8, 0x1

    :goto_5d
    const-string v9, "enable_frequently_visited_sites"

    invoke-virtual {v5, v9}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result v9

    const-string v12, "enable_suggestion_provider_clipboard"

    invoke-virtual {v5, v12}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result v12

    const-string v14, "enable_recent_searches"

    invoke-virtual {v5, v14}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result v14

    const-string v15, "enable_trending_searches"

    invoke-virtual {v5, v15}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result v15

    const-string v10, "enable_suggestion_provider_history"

    invoke-virtual {v5, v10}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result v10

    const-string v11, "enable_suggestion_provider_bookmarks"

    invoke-virtual {v5, v11}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result v11

    if-eqz v11, :cond_93

    const-string v11, "enable_suggestion_provider_speeddials"

    invoke-virtual {v5, v11}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result v11

    if-eqz v11, :cond_93

    move v11, v14

    move v14, v10

    move v10, v12

    move v12, v15

    const/4 v15, 0x1

    :goto_90
    move-object/from16 v16, v1

    goto :goto_99

    :cond_93
    move v11, v14

    move v14, v10

    move v10, v12

    move v12, v15

    const/4 v15, 0x0

    goto :goto_90

    :goto_99
    iget-boolean v1, v0, Lpsi;->q:Z

    move/from16 v18, v1

    const-string v1, "enable_suggestion_provider_ai_prompts"

    invoke-virtual {v5, v1}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result v1

    move/from16 v19, v1

    iget-boolean v1, v0, Lpsi;->q:Z

    move/from16 v20, v1

    const-string v1, "enable_suggestion_provider_ai_recent_activity"

    invoke-virtual {v5, v1}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result v1

    move/from16 v21, v1

    iget-boolean v1, v0, Lpsi;->p:Z

    move/from16 v22, v1

    const-string v1, "ai_assistant_menu_shortcut"

    invoke-virtual {v5, v1}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result v1

    move/from16 v23, v1

    iget-object v1, v0, Lpsi;->i:Lew3;

    invoke-virtual {v1}, Lew3;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    move/from16 v24, v1

    invoke-virtual/range {v16 .. v16}, Lq6e;->b()Leri;

    move-result-object v1

    sget-object v25, Leti;->a:Lq6e;

    if-nez v1, :cond_d6

    const/16 v25, 0x0

    goto :goto_da

    :cond_d6
    instance-of v1, v1, Lf1a;

    move/from16 v25, v1

    :goto_da
    invoke-virtual/range {v16 .. v16}, Lq6e;->b()Leri;

    move-result-object v1

    invoke-interface {v1}, Leri;->f()Z

    move-result v26

    const-string v1, "enable_product_suggestion"

    invoke-virtual {v5, v1}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result v1

    iget-boolean v0, v0, Lpsi;->n:Z

    move v5, v2

    new-instance v2, Lmsi;

    move/from16 v16, v18

    move/from16 v17, v19

    move/from16 v18, v20

    move/from16 v19, v21

    move/from16 v20, v22

    move/from16 v21, v23

    move/from16 v22, v24

    move/from16 v24, v0

    move/from16 v23, v1

    invoke-direct/range {v2 .. v26}, Lmsi;-><init>(Leri;ZZZZZZZZZZZZZZZZZZZZZZZ)V

    return-object v2
.end method

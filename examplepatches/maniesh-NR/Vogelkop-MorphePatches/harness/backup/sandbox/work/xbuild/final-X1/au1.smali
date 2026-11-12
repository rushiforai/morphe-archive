.class public final Lau1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/app/Application$ActivityLifecycleCallbacks;
.implements Lp5j;


# instance fields
.field public final a:Lcom/opera/android/settings/SettingsManager;

.field public final b:Ltd2;

.field public c:I

.field public final d:Landroid/content/Context;

.field public final e:Lox3;

.field public final f:Lf4b;

.field public final g:Lj4c;


# direct methods
.method public constructor <init>(Lcom/opera/android/settings/SettingsManager;Lumi;Landroid/content/Context;Lox3;Lf4b;Lj4c;)V
    .registers 8

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lau1;->a:Lcom/opera/android/settings/SettingsManager;

    new-instance v0, Ltd2;

    invoke-direct {v0, p2}, Ltd2;-><init>(Lumi;)V

    iput-object v0, p0, Lau1;->b:Ltd2;

    iput-object p3, p0, Lau1;->d:Landroid/content/Context;

    iput-object p4, p0, Lau1;->e:Lox3;

    iput-object p5, p0, Lau1;->f:Lf4b;

    iput-object p6, p0, Lau1;->g:Lj4c;

    invoke-virtual {p1, p0}, Lcom/opera/android/settings/SettingsManager;->a(Lp5j;)V

    return-void
.end method

.method public static a(Lkag;)Ldq0;
    .registers 2

    invoke-virtual {p0}, Ljava/lang/Enum;->ordinal()I

    move-result p0

    if-eqz p0, :cond_17

    const/4 v0, 0x1

    if-eq p0, v0, :cond_14

    const/4 v0, 0x2

    if-ne p0, v0, :cond_f

    sget-object p0, Ldq0;->c:Ldq0;

    return-object p0

    :cond_f
    invoke-static {}, Lhai;->d()V

    const/4 p0, 0x0

    return-object p0

    :cond_14
    sget-object p0, Ldq0;->d:Ldq0;

    return-object p0

    :cond_17
    sget-object p0, Ldq0;->b:Ldq0;

    return-object p0
.end method


# virtual methods
.method public final M(Ljava/lang/String;)V
    .registers 4

    const-string v0, "eula_accepted.gdpr"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_13

    iget p1, p0, Lau1;->c:I

    if-lez p1, :cond_13

    const/4 p1, 0x0

    const/4 v0, 0x1

    iget-object v1, p0, Lau1;->d:Landroid/content/Context;

    invoke-virtual {p0, v1, p1, v0}, Lau1;->b(Landroid/content/Context;Landroid/app/Activity;I)V

    :cond_13
    return-void
.end method

.method public final b(Landroid/content/Context;Landroid/app/Activity;I)V
    .registers 20

    move-object/from16 v0, p0

    move/from16 v1, p3

    iget-object v2, v0, Lau1;->d:Landroid/content/Context;

    iget-object v3, v0, Lau1;->a:Lcom/opera/android/settings/SettingsManager;

    const-string v4, "eula_accepted.gdpr"

    invoke-virtual {v3, v4}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_879

    const-string v4, "ad_blocking"

    sget-object v5, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {v2}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v5

    check-cast v5, Lcom/opera/android/OperaApplication;

    invoke-virtual {v5}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object v5

    iget-object v5, v5, Ld6j;->d:Lx5f;

    const-string v6, "turbo_client_id"

    invoke-virtual {v3, v6}, Lcom/opera/android/settings/SettingsManager;->z(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    iget-object v7, v3, Lcom/opera/android/settings/SettingsManager;->a:Ly9j;

    iget-object v8, v5, Lx5f;->d:Lzpa;

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v9

    invoke-virtual {v9, v8}, Lx56;->D(Lzpa;)Ltf0;

    move-result-object v8

    invoke-static {v6}, Laik;->o(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    const/4 v10, 0x2

    invoke-virtual {v8, v10, v6}, Ltf0;->x(ILjava/lang/String;)V

    invoke-virtual {v5, v9}, Lx5f;->U0(Lx56;)V

    const-string v6, "enable_newsfeed"

    invoke-virtual {v3, v6}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result v6

    iget-object v8, v5, Lx5f;->d:Lzpa;

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v9

    invoke-virtual {v9, v8}, Lx56;->L(Lzpa;)Lrr0;

    move-result-object v11

    const/16 v12, 0xf

    const/4 v13, 0x1

    invoke-virtual {v11, v12, v13, v6}, Ljf0;->r(IIZ)V

    invoke-virtual {v5, v9}, Lx5f;->U0(Lx56;)V

    invoke-virtual {v2}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v6

    check-cast v6, Lcom/opera/android/OperaApplication;

    invoke-virtual {v6}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object v6

    iget-object v6, v6, Ld6j;->c:Lx5f;

    const-string v9, "block_popups"

    invoke-virtual {v3, v9}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result v9

    iget-boolean v11, v6, Lx5f;->h:Z

    const/4 v12, 0x7

    if-eqz v11, :cond_7f

    iget-object v11, v6, Lx5f;->d:Lzpa;

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v14

    invoke-static {v11, v14}, Lam2;->g(Lzpa;Lx56;)Lqp0;

    move-result-object v11

    iget-object v11, v11, Lqp0;->b:Lb66;

    invoke-virtual {v11, v12, v13, v9}, Ljf0;->r(IIZ)V

    invoke-virtual {v6, v14}, Lx5f;->U0(Lx56;)V

    :cond_7f
    const-string v9, "text_wrap"

    invoke-virtual {v3, v9}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result v9

    iget-object v11, v6, Lx5f;->d:Lzpa;

    iget-boolean v14, v6, Lx5f;->h:Z

    const/16 v15, 0x15

    if-eqz v14, :cond_9f

    iget-object v14, v6, Lx5f;->d:Lzpa;

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v12

    invoke-static {v14, v12}, Lam2;->g(Lzpa;Lx56;)Lqp0;

    move-result-object v14

    iget-object v14, v14, Lqp0;->b:Lb66;

    invoke-virtual {v14, v15, v13, v9}, Ljf0;->r(IIZ)V

    invoke-virtual {v6, v12}, Lx5f;->U0(Lx56;)V

    :cond_9f
    const-string v9, "compression"

    invoke-virtual {v3, v9}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result v9

    iget-boolean v12, v6, Lx5f;->h:Z

    const/4 v14, 0x5

    if-eqz v12, :cond_bc

    iget-object v12, v6, Lx5f;->d:Lzpa;

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v15

    invoke-static {v12, v15}, Lam2;->g(Lzpa;Lx56;)Lqp0;

    move-result-object v12

    iget-object v12, v12, Lqp0;->b:Lb66;

    invoke-virtual {v12, v14, v13, v9}, Ljf0;->r(IIZ)V

    invoke-virtual {v6, v15}, Lx5f;->U0(Lx56;)V

    :cond_bc
    invoke-virtual {v3}, Lcom/opera/android/settings/SettingsManager;->c()Lb7j;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/Enum;->ordinal()I

    move-result v9

    if-eqz v9, :cond_ce

    if-ne v9, v13, :cond_d3

    sget-object v9, Lb60;->b:Lb60;

    invoke-virtual {v6, v9}, Lx5f;->A0(Lb60;)V

    goto :goto_d3

    :cond_ce
    sget-object v9, Lb60;->c:Lb60;

    invoke-virtual {v6, v9}, Lx5f;->A0(Lb60;)V

    :cond_d3
    :goto_d3
    invoke-virtual {v3}, Lcom/opera/android/settings/SettingsManager;->f()Le7j;

    move-result-object v9

    sget-object v12, Le7j;->d:Le7j;

    if-ne v9, v12, :cond_dd

    move v12, v13

    goto :goto_de

    :cond_dd
    const/4 v12, 0x0

    :goto_de
    iget-boolean v14, v6, Lx5f;->h:Z

    if-eqz v14, :cond_f2

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v14

    invoke-virtual {v14, v11}, Lx56;->F(Lzpa;)Lb66;

    move-result-object v15

    const/16 v10, 0x4d

    invoke-virtual {v15, v10, v13, v12}, Ljf0;->r(IIZ)V

    invoke-virtual {v6, v14}, Lx5f;->U0(Lx56;)V

    :cond_f2
    invoke-virtual {v3, v9}, Lcom/opera/android/settings/SettingsManager;->D(Le7j;)Lr7j;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/Enum;->ordinal()I

    move-result v9

    if-eqz v9, :cond_10d

    if-eq v9, v13, :cond_107

    const/4 v10, 0x2

    if-ne v9, v10, :cond_112

    sget-object v9, Ljs0;->d:Ljs0;

    invoke-virtual {v6, v9}, Lx5f;->I0(Ljs0;)V

    goto :goto_112

    :cond_107
    sget-object v9, Ljs0;->c:Ljs0;

    invoke-virtual {v6, v9}, Lx5f;->I0(Ljs0;)V

    goto :goto_112

    :cond_10d
    sget-object v9, Ljs0;->b:Ljs0;

    invoke-virtual {v6, v9}, Lx5f;->I0(Ljs0;)V

    :cond_112
    :goto_112
    invoke-static {}, Lj7j;->values()[Lj7j;

    move-result-object v9

    const-string v10, "accept_cookies"

    invoke-virtual {v3, v10}, Lcom/opera/android/settings/SettingsManager;->n(Ljava/lang/String;)I

    move-result v10

    aget-object v9, v9, v10

    invoke-virtual {v9}, Ljava/lang/Enum;->ordinal()I

    move-result v9

    if-eqz v9, :cond_135

    if-eq v9, v13, :cond_12f

    const/4 v10, 0x2

    if-ne v9, v10, :cond_13a

    sget-object v9, Lab0;->d:Lab0;

    invoke-virtual {v6, v9}, Lx5f;->B0(Lab0;)V

    goto :goto_13a

    :cond_12f
    sget-object v9, Lab0;->c:Lab0;

    invoke-virtual {v6, v9}, Lx5f;->B0(Lab0;)V

    goto :goto_13a

    :cond_135
    sget-object v9, Lab0;->b:Lab0;

    invoke-virtual {v6, v9}, Lx5f;->B0(Lab0;)V

    :cond_13a
    :goto_13a
    invoke-static {v2}, Lxnh;->t(Landroid/content/Context;)Lxnh;

    move-result-object v9

    invoke-virtual {v9}, Lno7;->j()Z

    move-result v10

    const/16 v12, 0x10

    const/4 v14, 0x6

    if-eqz v10, :cond_163

    invoke-virtual {v9}, Lno7;->i()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lwnh;

    invoke-virtual {v9, v12}, Lwnh;->b(I)Z

    move-result v9

    iget-boolean v10, v6, Lx5f;->h:Z

    if-eqz v10, :cond_163

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v10

    invoke-virtual {v10, v11}, Lx56;->J(Lzpa;)Lsn0;

    move-result-object v15

    invoke-virtual {v15, v14, v13, v9}, Ljf0;->r(IIZ)V

    invoke-virtual {v6, v10}, Lx5f;->U0(Lx56;)V

    :cond_163
    invoke-virtual {v3}, Lcom/opera/android/settings/SettingsManager;->getTurboImageQualityMode()I

    move-result v9

    const/4 v10, 0x3

    const/4 v15, 0x4

    if-eq v9, v13, :cond_184

    const/4 v12, 0x2

    if-eq v9, v12, :cond_17e

    if-eq v9, v10, :cond_178

    if-ne v9, v15, :cond_189

    sget-object v9, Lyf0;->e:Lyf0;

    invoke-virtual {v6, v9}, Lx5f;->C0(Lyf0;)V

    goto :goto_189

    :cond_178
    sget-object v9, Lyf0;->d:Lyf0;

    invoke-virtual {v6, v9}, Lx5f;->C0(Lyf0;)V

    goto :goto_189

    :cond_17e
    sget-object v9, Lyf0;->c:Lyf0;

    invoke-virtual {v6, v9}, Lx5f;->C0(Lyf0;)V

    goto :goto_189

    :cond_184
    sget-object v9, Lyf0;->b:Lyf0;

    invoke-virtual {v6, v9}, Lx5f;->C0(Lyf0;)V

    :cond_189
    :goto_189
    invoke-virtual {v3}, Lcom/opera/android/settings/SettingsManager;->C()Lq7j;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/Enum;->ordinal()I

    move-result v9

    if-eqz v9, :cond_19b

    if-ne v9, v13, :cond_1a0

    sget-object v9, Ldj0;->c:Ldj0;

    invoke-virtual {v6, v9}, Lx5f;->D0(Ldj0;)V

    goto :goto_1a0

    :cond_19b
    sget-object v9, Ldj0;->b:Ldj0;

    invoke-virtual {v6, v9}, Lx5f;->D0(Ldj0;)V

    :cond_1a0
    :goto_1a0
    invoke-static {}, Ls7j;->values()[Ls7j;

    move-result-object v9

    const-string v12, "user_agent"

    invoke-virtual {v3, v12}, Lcom/opera/android/settings/SettingsManager;->n(Ljava/lang/String;)I

    move-result v12

    aget-object v9, v9, v12

    invoke-virtual {v9}, Ljava/lang/Enum;->ordinal()I

    move-result v9

    if-eqz v9, :cond_1ba

    if-ne v9, v13, :cond_1bf

    sget-object v9, Lit0;->c:Lit0;

    invoke-virtual {v6, v9}, Lx5f;->J0(Lit0;)V

    goto :goto_1bf

    :cond_1ba
    sget-object v9, Lit0;->b:Lit0;

    invoke-virtual {v6, v9}, Lx5f;->J0(Lit0;)V

    :cond_1bf
    :goto_1bf
    iget-object v9, v5, Lx5f;->d:Lzpa;

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v12

    new-instance v14, Lck0;

    invoke-direct {v14, v9, v12}, Lck0;-><init>(Lzpa;Lx56;)V

    invoke-virtual {v14}, Lck0;->i()Lbt0;

    move-result-object v9

    sget-object v14, Lm50;->e:Lm50;

    iget-object v9, v9, Lbt0;->a:Le66;

    invoke-virtual {v9}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/4 v15, 0x0

    invoke-virtual {v9, v15, v13, v14}, Ljf0;->q(IILjava/lang/Object;)V

    invoke-virtual {v5, v12}, Lx5f;->U0(Lx56;)V

    invoke-virtual {v3, v4}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result v9

    iget-boolean v12, v6, Lx5f;->h:Z

    if-eqz v12, :cond_1f6

    iget-object v12, v6, Lx5f;->d:Lzpa;

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v14

    invoke-static {v12, v14}, Lam2;->g(Lzpa;Lx56;)Lqp0;

    move-result-object v12

    iget-object v12, v12, Lqp0;->b:Lb66;

    invoke-virtual {v12, v15, v13, v9}, Ljf0;->r(IIZ)V

    invoke-virtual {v6, v14}, Lx5f;->U0(Lx56;)V

    :cond_1f6
    invoke-virtual {v0, v6, v13, v4}, Lau1;->d(Lx5f;ILjava/lang/String;)V

    const-string v4, "vpn_pro_in_app_notification"

    const/4 v12, 0x2

    invoke-virtual {v0, v6, v12, v4}, Lau1;->d(Lx5f;ILjava/lang/String;)V

    const-string v4, "wallpaper_in_app_notification"

    invoke-virtual {v0, v6, v10, v4}, Lau1;->d(Lx5f;ILjava/lang/String;)V

    const-string v4, "feedback_in_app_notification"

    const/4 v9, 0x4

    invoke-virtual {v0, v6, v9, v4}, Lau1;->d(Lx5f;ILjava/lang/String;)V

    const-string v4, "product_and_service_in_app_notification"

    const/4 v9, 0x5

    invoke-virtual {v0, v6, v9, v4}, Lau1;->d(Lx5f;ILjava/lang/String;)V

    const-string v4, "feature_tips_notification"

    const/4 v9, 0x6

    invoke-virtual {v0, v6, v9, v4}, Lau1;->d(Lx5f;ILjava/lang/String;)V

    const-string v4, "esim_notifications"

    const/16 v9, 0x20

    invoke-virtual {v0, v6, v9, v4}, Lau1;->d(Lx5f;ILjava/lang/String;)V

    const/16 v4, 0x21

    const-string v12, "rewards_notifications"

    invoke-virtual {v0, v6, v4, v12}, Lau1;->d(Lx5f;ILjava/lang/String;)V

    const-string v4, "live_scores_odds_enabled"

    const/4 v12, 0x7

    invoke-virtual {v0, v6, v12, v4}, Lau1;->d(Lx5f;ILjava/lang/String;)V

    const-string v4, "ai_assistant_menu_shortcut"

    const/16 v12, 0x12

    invoke-virtual {v0, v6, v12, v4}, Lau1;->d(Lx5f;ILjava/lang/String;)V

    const/16 v4, 0xc

    const-string v14, "ai_assistant_ask_aria"

    invoke-virtual {v0, v6, v4, v14}, Lau1;->d(Lx5f;ILjava/lang/String;)V

    const-string v4, "ask_before_downloading"

    const/16 v14, 0x10

    invoke-virtual {v0, v6, v14, v4}, Lau1;->d(Lx5f;ILjava/lang/String;)V

    const-string v4, "media_background_play"

    const/16 v14, 0x15

    invoke-virtual {v0, v6, v14, v4}, Lau1;->d(Lx5f;ILjava/lang/String;)V

    const/16 v4, 0x19

    const-string v14, "live_scores_enabled"

    invoke-virtual {v0, v6, v4, v14}, Lau1;->d(Lx5f;ILjava/lang/String;)V

    iget-object v4, v0, Lau1;->g:Lj4c;

    invoke-virtual {v4}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lh0a;

    iget-object v4, v4, Lh0a;->d:Lode;

    invoke-virtual {v4}, Lekc;->g()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Li0a;

    if-eqz v4, :cond_26e

    iget-boolean v4, v4, Li0a;->a:Z

    const/16 v14, 0x1f

    if-nez v4, :cond_269

    invoke-virtual {v6, v14}, Lx5f;->N0(I)V

    goto :goto_26e

    :cond_269
    const-string v4, "enable_google_ai_mode"

    invoke-virtual {v0, v6, v14, v4}, Lau1;->d(Lx5f;ILjava/lang/String;)V

    :cond_26e
    :goto_26e
    const-string v4, "tracker_blocker"

    invoke-virtual {v3, v4}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result v4

    iget-boolean v14, v6, Lx5f;->h:Z

    if-eqz v14, :cond_28a

    iget-object v14, v6, Lx5f;->d:Lzpa;

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v15

    invoke-static {v14, v15}, Lam2;->g(Lzpa;Lx56;)Lqp0;

    move-result-object v14

    iget-object v14, v14, Lqp0;->b:Lb66;

    invoke-virtual {v14, v13, v13, v4}, Ljf0;->r(IIZ)V

    invoke-virtual {v6, v15}, Lx5f;->U0(Lx56;)V

    :cond_28a
    const-string v4, "force_enable_zoom"

    invoke-virtual {v3, v4}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result v4

    iget-boolean v14, v6, Lx5f;->h:Z

    if-eqz v14, :cond_2a8

    iget-object v14, v6, Lx5f;->d:Lzpa;

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v15

    invoke-static {v14, v15}, Lam2;->g(Lzpa;Lx56;)Lqp0;

    move-result-object v14

    iget-object v14, v14, Lqp0;->b:Lb66;

    const/16 v12, 0x9

    invoke-virtual {v14, v12, v13, v4}, Ljf0;->r(IIZ)V

    invoke-virtual {v6, v15}, Lx5f;->U0(Lx56;)V

    :cond_2a8
    const-string v4, "default_webpage_zoom"

    invoke-virtual {v3, v4}, Lcom/opera/android/settings/SettingsManager;->n(Ljava/lang/String;)I

    move-result v4

    const/16 v12, 0x64

    if-eq v4, v12, :cond_2b4

    move v4, v13

    goto :goto_2b5

    :cond_2b4
    const/4 v4, 0x0

    :goto_2b5
    iget-boolean v12, v6, Lx5f;->h:Z

    if-eqz v12, :cond_2cd

    iget-object v12, v6, Lx5f;->d:Lzpa;

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v14

    invoke-static {v12, v14}, Lam2;->g(Lzpa;Lx56;)Lqp0;

    move-result-object v12

    iget-object v12, v12, Lqp0;->b:Lb66;

    const/16 v15, 0x57

    invoke-virtual {v12, v15, v13, v4}, Ljf0;->r(IIZ)V

    invoke-virtual {v6, v14}, Lx5f;->U0(Lx56;)V

    :cond_2cd
    sget-object v4, Le7d;->a:Ljava/lang/Object;

    monitor-enter v4

    :try_start_2d0
    sget v12, Le7d;->b:I

    monitor-exit v4
    :try_end_2d3
    .catchall {:try_start_2d0 .. :try_end_2d3} :catchall_87c

    if-ne v12, v10, :cond_304

    invoke-static {}, LJ/N;->M9qRRZZC()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, [Ljava/lang/String;

    invoke-static {v4}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Collection;->stream()Ljava/util/stream/Stream;

    move-result-object v4

    new-instance v12, Lnn;

    invoke-direct {v12, v13}, Lnn;-><init>(B)V

    invoke-interface {v4, v12}, Ljava/util/stream/Stream;->anyMatch(Ljava/util/function/Predicate;)Z

    move-result v4

    iget-boolean v12, v6, Lx5f;->h:Z

    if-eqz v12, :cond_304

    iget-object v12, v6, Lx5f;->d:Lzpa;

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v14

    invoke-static {v12, v14}, Lam2;->g(Lzpa;Lx56;)Lqp0;

    move-result-object v12

    iget-object v12, v12, Lqp0;->b:Lb66;

    const/16 v15, 0x56

    invoke-virtual {v12, v15, v13, v4}, Ljf0;->r(IIZ)V

    invoke-virtual {v6, v14}, Lx5f;->U0(Lx56;)V

    :cond_304
    invoke-static {}, Lo7j;->values()[Lo7j;

    move-result-object v4

    const-string v12, "enable_reading_mode_as_default"

    invoke-virtual {v3, v12}, Lcom/opera/android/settings/SettingsManager;->n(Ljava/lang/String;)I

    move-result v12

    aget-object v4, v4, v12

    invoke-virtual {v4}, Ljava/lang/Enum;->ordinal()I

    move-result v4

    if-eqz v4, :cond_327

    if-eq v4, v13, :cond_321

    const/4 v12, 0x2

    if-ne v4, v12, :cond_32c

    sget-object v4, Lko0;->b:Lko0;

    invoke-virtual {v6, v4}, Lx5f;->F0(Lko0;)V

    goto :goto_32c

    :cond_321
    sget-object v4, Lko0;->c:Lko0;

    invoke-virtual {v6, v4}, Lx5f;->F0(Lko0;)V

    goto :goto_32c

    :cond_327
    sget-object v4, Lko0;->d:Lko0;

    invoke-virtual {v6, v4}, Lx5f;->F0(Lko0;)V

    :cond_32c
    :goto_32c
    sget-object v4, Llag;->c:Llag;

    invoke-virtual {v3, v4}, Lcom/opera/android/settings/SettingsManager;->k(Llag;)Lkag;

    move-result-object v4

    invoke-static {v4}, Lau1;->a(Lkag;)Ldq0;

    move-result-object v4

    iget-boolean v12, v6, Lx5f;->h:Z

    if-eqz v12, :cond_350

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v12

    invoke-virtual {v12, v11}, Lx56;->F(Lzpa;)Lb66;

    move-result-object v14

    invoke-virtual {v14, v11}, Lb66;->B(Lzpa;)Leq0;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/4 v15, 0x0

    invoke-virtual {v14, v15, v13, v4}, Ljf0;->q(IILjava/lang/Object;)V

    invoke-virtual {v6, v12}, Lx5f;->U0(Lx56;)V

    :cond_350
    sget-object v4, Llag;->b:Llag;

    invoke-virtual {v3, v4}, Lcom/opera/android/settings/SettingsManager;->k(Llag;)Lkag;

    move-result-object v4

    invoke-static {v4}, Lau1;->a(Lkag;)Ldq0;

    move-result-object v4

    iget-boolean v12, v6, Lx5f;->h:Z

    if-eqz v12, :cond_373

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v12

    invoke-virtual {v12, v11}, Lx56;->F(Lzpa;)Lb66;

    move-result-object v14

    invoke-virtual {v14, v11}, Lb66;->B(Lzpa;)Leq0;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v14, v13, v13, v4}, Ljf0;->q(IILjava/lang/Object;)V

    invoke-virtual {v6, v12}, Lx5f;->U0(Lx56;)V

    :cond_373
    sget-object v4, Llag;->f:Llag;

    invoke-virtual {v3, v4}, Lcom/opera/android/settings/SettingsManager;->k(Llag;)Lkag;

    move-result-object v4

    invoke-static {v4}, Lau1;->a(Lkag;)Ldq0;

    move-result-object v4

    iget-boolean v12, v6, Lx5f;->h:Z

    if-eqz v12, :cond_397

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v12

    invoke-virtual {v12, v11}, Lx56;->F(Lzpa;)Lb66;

    move-result-object v14

    invoke-virtual {v14, v11}, Lb66;->B(Lzpa;)Leq0;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/4 v15, 0x2

    invoke-virtual {v14, v15, v13, v4}, Ljf0;->q(IILjava/lang/Object;)V

    invoke-virtual {v6, v12}, Lx5f;->U0(Lx56;)V

    :cond_397
    sget-object v4, Llag;->e:Llag;

    invoke-virtual {v3, v4}, Lcom/opera/android/settings/SettingsManager;->k(Llag;)Lkag;

    move-result-object v4

    invoke-static {v4}, Lau1;->a(Lkag;)Ldq0;

    move-result-object v4

    iget-boolean v12, v6, Lx5f;->h:Z

    if-eqz v12, :cond_3ba

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v12

    invoke-virtual {v12, v11}, Lx56;->F(Lzpa;)Lb66;

    move-result-object v14

    invoke-virtual {v14, v11}, Lb66;->B(Lzpa;)Leq0;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v14, v10, v13, v4}, Ljf0;->q(IILjava/lang/Object;)V

    invoke-virtual {v6, v12}, Lx5f;->U0(Lx56;)V

    :cond_3ba
    const-string v4, "app_theme"

    const/4 v12, -0x1

    invoke-interface {v7, v4, v12}, Ly9j;->getInt(Ljava/lang/String;I)I

    move-result v4

    if-gez v4, :cond_3c5

    const/4 v4, 0x0

    goto :goto_3cb

    :cond_3c5
    invoke-static {}, Lf7j;->values()[Lf7j;

    move-result-object v15

    aget-object v4, v15, v4

    :goto_3cb
    if-nez v4, :cond_3d0

    sget-object v4, Lcs0;->b:Lcs0;

    goto :goto_3e9

    :cond_3d0
    invoke-virtual {v4}, Ljava/lang/Enum;->ordinal()I

    move-result v15

    if-eqz v15, :cond_3e7

    if-eq v15, v13, :cond_3e4

    const/4 v14, 0x2

    if-ne v15, v14, :cond_3de

    sget-object v4, Lcs0;->f:Lcs0;

    goto :goto_3e9

    :cond_3de
    const-string v0, "Unknown theme: "

    invoke-static {v4, v0}, Ls49;->l(Ljava/lang/Object;Ljava/lang/String;)V

    return-void

    :cond_3e4
    sget-object v4, Lcs0;->e:Lcs0;

    goto :goto_3e9

    :cond_3e7
    sget-object v4, Lcs0;->c:Lcs0;

    :goto_3e9
    const-string v14, "app_theme_accent_changed_by_user"

    invoke-virtual {v3, v14}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result v14

    if-eqz v14, :cond_3fb

    iget-object v14, v3, Lcom/opera/android/settings/SettingsManager;->a:Ly9j;

    const-string v15, "app_theme_accent"

    invoke-interface {v14, v15, v12}, Ly9j;->getInt(Ljava/lang/String;I)I

    move-result v14

    if-gez v14, :cond_3fd

    :cond_3fb
    const/4 v14, 0x0

    goto :goto_403

    :cond_3fd
    invoke-static {}, Lg7j;->values()[Lg7j;

    move-result-object v15

    aget-object v14, v15, v14

    :goto_403
    if-nez v14, :cond_408

    sget-object v14, Ll50;->b:Ll50;

    goto :goto_42f

    :cond_408
    invoke-virtual {v14}, Ljava/lang/Enum;->ordinal()I

    move-result v15

    packed-switch v15, :pswitch_data_87e

    const-string v0, "Unknown theme accent: "

    invoke-static {v14, v0}, Ls49;->l(Ljava/lang/Object;Ljava/lang/String;)V

    return-void

    :pswitch_415
    sget-object v14, Ll50;->k:Ll50;

    goto :goto_42f

    :pswitch_418
    sget-object v14, Ll50;->j:Ll50;

    goto :goto_42f

    :pswitch_41b
    sget-object v14, Ll50;->i:Ll50;

    goto :goto_42f

    :pswitch_41e
    sget-object v14, Ll50;->h:Ll50;

    goto :goto_42f

    :pswitch_421
    sget-object v14, Ll50;->f:Ll50;

    goto :goto_42f

    :pswitch_424
    sget-object v14, Ll50;->e:Ll50;

    goto :goto_42f

    :pswitch_427
    sget-object v14, Ll50;->d:Ll50;

    goto :goto_42f

    :pswitch_42a
    sget-object v14, Ll50;->g:Ll50;

    goto :goto_42f

    :pswitch_42d
    sget-object v14, Ll50;->c:Ll50;

    :goto_42f
    iget-boolean v15, v6, Lx5f;->h:Z

    const/16 v10, 0x16

    if-eqz v15, :cond_44b

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v15

    invoke-virtual {v15, v11}, Lx56;->F(Lzpa;)Lb66;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v11, v10, v13, v4}, Ljf0;->q(IILjava/lang/Object;)V

    const/16 v4, 0x17

    invoke-virtual {v11, v4, v13, v14}, Ljf0;->q(IILjava/lang/Object;)V

    invoke-virtual {v6, v15}, Lx5f;->U0(Lx56;)V

    :cond_44b
    invoke-virtual {v3}, Lcom/opera/android/settings/SettingsManager;->y()I

    move-result v4

    invoke-static {v4}, Lvep;->A(I)I

    move-result v4

    if-eqz v4, :cond_466

    if-eq v4, v13, :cond_460

    const/4 v14, 0x2

    if-ne v4, v14, :cond_46b

    sget-object v4, Lwq0;->d:Lwq0;

    invoke-virtual {v6, v4}, Lx5f;->H0(Lwq0;)V

    goto :goto_46b

    :cond_460
    sget-object v4, Lwq0;->b:Lwq0;

    invoke-virtual {v6, v4}, Lx5f;->H0(Lwq0;)V

    goto :goto_46b

    :cond_466
    sget-object v4, Lwq0;->c:Lwq0;

    invoke-virtual {v6, v4}, Lx5f;->H0(Lwq0;)V

    :cond_46b
    :goto_46b
    invoke-virtual {v3}, Lcom/opera/android/settings/SettingsManager;->h()Z

    move-result v4

    iget-boolean v11, v6, Lx5f;->h:Z

    if-eqz v11, :cond_485

    iget-object v11, v6, Lx5f;->d:Lzpa;

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v14

    invoke-static {v11, v14}, Lam2;->g(Lzpa;Lx56;)Lqp0;

    move-result-object v11

    iget-object v11, v11, Lqp0;->b:Lb66;

    invoke-virtual {v11, v9, v13, v4}, Ljf0;->r(IIZ)V

    invoke-virtual {v6, v14}, Lx5f;->U0(Lx56;)V

    :cond_485
    const-string v4, "speed_dial.enabled"

    invoke-virtual {v3, v4}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result v4

    iget-boolean v9, v6, Lx5f;->h:Z

    if-eqz v9, :cond_4a3

    iget-object v9, v6, Lx5f;->d:Lzpa;

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v11

    invoke-static {v9, v11}, Lam2;->g(Lzpa;Lx56;)Lqp0;

    move-result-object v9

    iget-object v9, v9, Lqp0;->b:Lb66;

    const/16 v14, 0x3c

    invoke-virtual {v9, v14, v13, v4}, Ljf0;->r(IIZ)V

    invoke-virtual {v6, v11}, Lx5f;->U0(Lx56;)V

    :cond_4a3
    const-string v4, "concurrent_downloads"

    invoke-interface {v7, v4}, Ly9j;->contains(Ljava/lang/String;)Z

    move-result v9

    if-eqz v9, :cond_4ae

    sget-object v7, Lop0;->d:Lop0;

    goto :goto_4b9

    :cond_4ae
    invoke-interface {v7, v4}, Ly9j;->d(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_4b7

    sget-object v7, Lop0;->c:Lop0;

    goto :goto_4b9

    :cond_4b7
    sget-object v7, Lop0;->b:Lop0;

    :goto_4b9
    invoke-virtual {v3, v4}, Lcom/opera/android/settings/SettingsManager;->n(Ljava/lang/String;)I

    move-result v4

    if-ne v4, v12, :cond_4c2

    const-string v4, "Unlimited"

    goto :goto_4c6

    :cond_4c2
    invoke-static {v4}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v4

    :goto_4c6
    iget-boolean v9, v6, Lx5f;->h:Z

    if-eqz v9, :cond_4e4

    iget-object v9, v6, Lx5f;->d:Lzpa;

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v11

    new-instance v12, Lck0;

    invoke-direct {v12, v9, v11}, Lck0;-><init>(Lzpa;Lx56;)V

    new-instance v9, Ljkc;

    invoke-direct {v9, v4, v7, v10}, Ljkc;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v12}, Lck0;->g()Lqp0;

    move-result-object v4

    invoke-virtual {v9, v4}, Ljkc;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {v6, v11}, Lx5f;->U0(Lx56;)V

    :cond_4e4
    const-string v4, "dns_over_https_enabled"

    invoke-virtual {v3, v4}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_4f2

    sget-object v4, Ljp0;->b:Ljp0;

    invoke-virtual {v6, v4}, Lx5f;->y0(Ljp0;)V

    goto :goto_516

    :cond_4f2
    invoke-virtual {v3}, Lcom/opera/android/settings/SettingsManager;->l()Ll7j;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Enum;->ordinal()I

    move-result v4

    if-eqz v4, :cond_511

    if-eq v4, v13, :cond_50e

    const/4 v12, 0x2

    if-eq v4, v12, :cond_50b

    const/4 v7, 0x3

    if-ne v4, v7, :cond_507

    sget-object v4, Ljp0;->f:Ljp0;

    goto :goto_513

    :cond_507
    invoke-static {}, Lh9o;->p()V

    return-void

    :cond_50b
    sget-object v4, Ljp0;->e:Ljp0;

    goto :goto_513

    :cond_50e
    sget-object v4, Ljp0;->d:Ljp0;

    goto :goto_513

    :cond_511
    sget-object v4, Ljp0;->c:Ljp0;

    :goto_513
    invoke-virtual {v6, v4}, Lx5f;->y0(Ljp0;)V

    :goto_516
    invoke-virtual {v3}, Lcom/opera/android/settings/SettingsManager;->b()La7j;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Enum;->ordinal()I

    move-result v3

    if-eqz v3, :cond_532

    if-eq v3, v13, :cond_52f

    const/4 v12, 0x2

    if-ne v3, v12, :cond_528

    sget-object v3, Lx50;->d:Lx50;

    goto :goto_534

    :cond_528
    new-instance v0, Ljava/lang/RuntimeException;

    const/4 v1, 0x0

    invoke-direct {v0, v1, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v0

    :cond_52f
    sget-object v3, Lx50;->c:Lx50;

    goto :goto_534

    :cond_532
    sget-object v3, Lx50;->b:Lx50;

    :goto_534
    iget-boolean v4, v6, Lx5f;->h:Z

    if-eqz v4, :cond_54f

    iget-object v4, v6, Lx5f;->d:Lzpa;

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v7

    invoke-static {v4, v7}, Lam2;->g(Lzpa;Lx56;)Lqp0;

    move-result-object v4

    iget-object v4, v4, Lqp0;->b:Lb66;

    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/16 v9, 0x53

    invoke-virtual {v4, v9, v13, v3}, Ljf0;->q(IILjava/lang/Object;)V

    invoke-virtual {v6, v7}, Lx5f;->U0(Lx56;)V

    :cond_54f
    sget-object v3, Lzi3;->k:Lui3;

    sget-object v3, Lio7;->E:Lio7;

    sget-object v4, Lzi3;->l:Lqp2;

    invoke-static {v2, v3, v4}, Lno7;->n(Landroid/content/Context;Lio7;Llo7;)Lno7;

    move-result-object v3

    check-cast v3, Lzi3;

    new-instance v4, Lwx;

    const/4 v7, 0x3

    invoke-direct {v4, v0, v6, v7}, Lwx;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    new-instance v6, Lcn7;

    const/4 v12, 0x2

    invoke-direct {v6, v3, v4, v12}, Lcn7;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v3, v6}, Lno7;->b(Ljava/lang/Runnable;)V

    invoke-static {}, Ltz5;->b()Ljava/lang/String;

    move-result-object v3

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v4

    invoke-virtual {v4, v8}, Lx56;->D(Lzpa;)Ltf0;

    move-result-object v6

    const/4 v9, 0x6

    invoke-virtual {v6, v9, v3}, Ltf0;->x(ILjava/lang/String;)V

    invoke-virtual {v5, v4}, Lx5f;->U0(Lx56;)V

    invoke-virtual {v2}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v4

    check-cast v4, Lcom/opera/android/OperaApplication;

    invoke-virtual {v4}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object v4

    iget-object v4, v4, Ld6j;->f:Losf;

    iget-object v5, v4, Losf;->b:Lpsp;

    invoke-static {}, Lpsp;->f()Lt56;

    move-result-object v6

    new-instance v7, Lyj0;

    invoke-direct {v7, v5, v6}, Lyj0;-><init>(Lpsp;Lt56;)V

    iget-object v5, v7, Lyj0;->c:Lzyk;

    invoke-virtual {v5}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Luf0;

    iget-object v5, v5, Luf0;->a:Lpf0;

    const/4 v12, 0x2

    invoke-virtual {v5, v12, v3}, Lpf0;->x(ILjava/lang/String;)V

    iget-object v3, v4, Losf;->e:Lmgh;

    invoke-virtual {v3, v6}, Lmgh;->c(Ljf0;)Z

    move-result v3

    if-nez v3, :cond_5c1

    iget-object v3, v4, Losf;->a:Lumi;

    new-instance v5, Lrml;

    sget-object v6, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-direct {v5, v6, v3}, Lrml;-><init>(Ljava/lang/Object;Ltcl;)V

    new-instance v3, Lmsf;

    invoke-direct {v3, v4, v13}, Lmsf;-><init>(Losf;B)V

    invoke-virtual {v5, v3}, Lrml;->a(Lkotlin/jvm/functions/Function1;)Lplk;

    move-result-object v3

    iget-object v4, v4, Losf;->d:Lqie;

    invoke-virtual {v3, v4}, Lplk;->m(Lqie;)Lp1j;

    :cond_5c1
    invoke-virtual {v2}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v3

    check-cast v3, Lcom/opera/android/OperaApplication;

    invoke-virtual {v3}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object v3

    iget-object v3, v3, Ld6j;->c:Lx5f;

    const-string v4, "news"

    invoke-static {v2, v4}, Lwbh;->m(Landroid/content/Context;Ljava/lang/String;)I

    move-result v4

    const/16 v5, 0x11

    if-eqz v4, :cond_603

    if-ne v4, v13, :cond_62d

    iget-boolean v4, v3, Lx5f;->h:Z

    if-eqz v4, :cond_62d

    iget-object v4, v3, Lx5f;->d:Lzpa;

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v6

    new-instance v7, Lck0;

    invoke-direct {v7, v4, v6}, Lck0;-><init>(Lzpa;Lx56;)V

    iget-object v4, v7, Lck0;->e:Lzyk;

    invoke-virtual {v4}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lun0;

    iget-object v4, v4, Lun0;->b:Lsn0;

    const/4 v12, 0x2

    invoke-virtual {v4, v12, v13, v13}, Ljf0;->r(IIZ)V

    invoke-virtual {v7}, Lck0;->g()Lqp0;

    move-result-object v4

    iget-object v4, v4, Lqp0;->b:Lb66;

    invoke-virtual {v4, v5, v13, v13}, Ljf0;->r(IIZ)V

    invoke-virtual {v3, v6}, Lx5f;->U0(Lx56;)V

    goto :goto_62d

    :cond_603
    iget-boolean v4, v3, Lx5f;->h:Z

    if-eqz v4, :cond_62d

    iget-object v4, v3, Lx5f;->d:Lzpa;

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v6

    new-instance v7, Lck0;

    invoke-direct {v7, v4, v6}, Lck0;-><init>(Lzpa;Lx56;)V

    iget-object v4, v7, Lck0;->e:Lzyk;

    invoke-virtual {v4}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lun0;

    iget-object v4, v4, Lun0;->b:Lsn0;

    const/4 v12, 0x2

    const/4 v15, 0x0

    invoke-virtual {v4, v12, v13, v15}, Ljf0;->r(IIZ)V

    invoke-virtual {v7}, Lck0;->g()Lqp0;

    move-result-object v4

    iget-object v4, v4, Lqp0;->b:Lb66;

    invoke-virtual {v4, v5, v13, v15}, Ljf0;->r(IIZ)V

    invoke-virtual {v3, v6}, Lx5f;->U0(Lx56;)V

    :cond_62d
    :goto_62d
    const-string v4, "com_appboy_default_notification_channel"

    invoke-static {v2, v4}, Lwbh;->m(Landroid/content/Context;Ljava/lang/String;)I

    move-result v4

    if-eqz v4, :cond_663

    if-ne v4, v13, :cond_667

    iget-boolean v4, v3, Lx5f;->h:Z

    if-eqz v4, :cond_667

    iget-object v4, v3, Lx5f;->d:Lzpa;

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v5

    new-instance v6, Lck0;

    invoke-direct {v6, v4, v5}, Lck0;-><init>(Lzpa;Lx56;)V

    iget-object v4, v6, Lck0;->e:Lzyk;

    invoke-virtual {v4}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lun0;

    iget-object v4, v4, Lun0;->b:Lsn0;

    const/4 v7, 0x3

    invoke-virtual {v4, v7, v13, v13}, Ljf0;->r(IIZ)V

    invoke-virtual {v6}, Lck0;->g()Lqp0;

    move-result-object v4

    iget-object v4, v4, Lqp0;->b:Lb66;

    const/16 v6, 0x12

    invoke-virtual {v4, v6, v13, v13}, Ljf0;->r(IIZ)V

    invoke-virtual {v3, v5}, Lx5f;->U0(Lx56;)V

    goto :goto_667

    :cond_663
    iget-boolean v4, v3, Lx5f;->h:Z

    if-nez v4, :cond_669

    :cond_667
    :goto_667
    const/4 v7, 0x3

    goto :goto_691

    :cond_669
    iget-object v4, v3, Lx5f;->d:Lzpa;

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v5

    new-instance v6, Lck0;

    invoke-direct {v6, v4, v5}, Lck0;-><init>(Lzpa;Lx56;)V

    iget-object v4, v6, Lck0;->e:Lzyk;

    invoke-virtual {v4}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lun0;

    iget-object v4, v4, Lun0;->b:Lsn0;

    const/4 v7, 0x3

    const/4 v15, 0x0

    invoke-virtual {v4, v7, v13, v15}, Ljf0;->r(IIZ)V

    invoke-virtual {v6}, Lck0;->g()Lqp0;

    move-result-object v4

    iget-object v4, v4, Lqp0;->b:Lb66;

    const/16 v6, 0x12

    invoke-virtual {v4, v6, v13, v15}, Ljf0;->r(IIZ)V

    invoke-virtual {v3, v5}, Lx5f;->U0(Lx56;)V

    :goto_691
    invoke-virtual {v0, v3, v13}, Lau1;->c(Lx5f;I)V

    const/4 v12, 0x2

    invoke-virtual {v0, v3, v12}, Lau1;->c(Lx5f;I)V

    invoke-virtual {v0, v3, v7}, Lau1;->c(Lx5f;I)V

    const/4 v9, 0x4

    invoke-virtual {v0, v3, v9}, Lau1;->c(Lx5f;I)V

    invoke-static {v2}, Lhyg;->h(Landroid/content/Context;)Z

    move-result v4

    iget-boolean v5, v3, Lx5f;->h:Z

    if-eqz v5, :cond_6b7

    iget-object v5, v3, Lx5f;->d:Lzpa;

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v6

    invoke-virtual {v6, v5}, Lx56;->J(Lzpa;)Lsn0;

    move-result-object v5

    invoke-virtual {v5, v9, v13, v4}, Ljf0;->r(IIZ)V

    invoke-virtual {v3, v6}, Lx5f;->U0(Lx56;)V

    :cond_6b7
    if-eqz p2, :cond_6ff

    invoke-virtual/range {p2 .. p2}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v3

    if-nez v3, :cond_6c1

    const/4 v3, 0x0

    goto :goto_6cb

    :cond_6c1
    invoke-virtual {v3}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v3

    sget-object v4, Lr5n;->a:Ljava/util/WeakHashMap;

    invoke-static {v3}, Li5n;->a(Landroid/view/View;)Lg3o;

    move-result-object v3

    :goto_6cb
    if-eqz v3, :cond_6ff

    invoke-virtual {v2}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v4

    check-cast v4, Lcom/opera/android/OperaApplication;

    invoke-virtual {v4}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object v4

    iget-object v4, v4, Ld6j;->d:Lx5f;

    iget-object v3, v3, Lg3o;->a:Ld3o;

    const/16 v14, 0x10

    invoke-virtual {v3, v14}, Ld3o;->i(I)Lr9b;

    move-result-object v3

    iget v5, v3, Lr9b;->a:I

    if-nez v5, :cond_6eb

    iget v3, v3, Lr9b;->c:I

    if-nez v3, :cond_6eb

    move v15, v13

    goto :goto_6ec

    :cond_6eb
    const/4 v15, 0x0

    :goto_6ec
    xor-int/2addr v15, v13

    iget-object v3, v4, Lx5f;->d:Lzpa;

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v5

    invoke-virtual {v5, v3}, Lx56;->L(Lzpa;)Lrr0;

    move-result-object v3

    const/16 v6, 0x14

    invoke-virtual {v3, v6, v13, v15}, Ljf0;->r(IIZ)V

    invoke-virtual {v4, v5}, Lx5f;->U0(Lx56;)V

    :cond_6ff
    invoke-static {v2}, Li0l;->d(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Laik;->o(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v2}, Li0l;->e(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Laik;->o(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    :try_start_70f
    const-string v5, "phone"

    invoke-virtual {v2, v5}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/telephony/TelephonyManager;

    if-eqz v5, :cond_71e

    invoke-virtual {v5}, Landroid/telephony/TelephonyManager;->getSimOperatorName()Ljava/lang/String;

    move-result-object v5
    :try_end_71d
    .catch Ljava/lang/RuntimeException; {:try_start_70f .. :try_end_71d} :catch_71e

    goto :goto_71f

    :catch_71e
    :cond_71e
    const/4 v5, 0x0

    :goto_71f
    invoke-static {v5}, Laik;->o(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v2}, Li0l;->c(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v6

    sget-object v7, Li0l;->b:Lnx1;

    invoke-virtual {v7, v2}, Li7c;->d(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lbu6;

    const/4 v15, 0x0

    invoke-virtual {v7, v2, v15}, Lbu6;->a(Landroid/content/Context;Z)Ljava/lang/String;

    move-result-object v7

    sget-object v8, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {v2}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v8

    check-cast v8, Lcom/opera/android/OperaApplication;

    invoke-virtual {v8}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object v8

    iget-object v8, v8, Ld6j;->d:Lx5f;

    iget-object v9, v8, Lx5f;->d:Lzpa;

    if-nez v3, :cond_74e

    if-nez v4, :cond_74e

    if-nez v5, :cond_74e

    if-nez v6, :cond_74e

    if-eqz v7, :cond_777

    :cond_74e
    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v10

    invoke-virtual {v10, v9}, Lx56;->L(Lzpa;)Lrr0;

    move-result-object v9

    if-eqz v3, :cond_75c

    const/4 v12, 0x7

    invoke-virtual {v9, v12, v3}, Lrr0;->y(ILjava/lang/String;)V

    :cond_75c
    if-eqz v4, :cond_762

    const/4 v3, 0x6

    invoke-virtual {v9, v3, v4}, Lrr0;->y(ILjava/lang/String;)V

    :cond_762
    if-eqz v5, :cond_768

    const/4 v3, 0x5

    invoke-virtual {v9, v3, v5}, Lrr0;->y(ILjava/lang/String;)V

    :cond_768
    if-eqz v6, :cond_76e

    const/4 v3, 0x3

    invoke-virtual {v9, v3, v6}, Lrr0;->y(ILjava/lang/String;)V

    :cond_76e
    if-eqz v7, :cond_774

    const/4 v3, 0x4

    invoke-virtual {v9, v3, v7}, Lrr0;->y(ILjava/lang/String;)V

    :cond_774
    invoke-virtual {v8, v10}, Lx5f;->U0(Lx56;)V

    :cond_777
    invoke-virtual {v2}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v3

    check-cast v3, Lcom/opera/android/OperaApplication;

    invoke-virtual {v3}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object v3

    iget-object v3, v3, Ld6j;->e:Lhd;

    iget-boolean v4, v3, Lhd;->b:Z

    if-eqz v4, :cond_795

    if-nez v6, :cond_78b

    if-eqz v7, :cond_795

    :cond_78b
    new-instance v4, Le5f;

    const/16 v5, 0x8

    invoke-direct {v4, v6, v7, v5}, Le5f;-><init>(Ljava/lang/String;Ljava/lang/String;B)V

    invoke-virtual {v3, v4}, Lhd;->t(Lkotlin/jvm/functions/Function1;)V

    :cond_795
    const-string v3, "android.permission.ACCESS_FINE_LOCATION"

    invoke-static {v2, v3}, Lfr3;->Q(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_7a0

    sget-object v3, Lih0;->c:Lih0;

    goto :goto_7ad

    :cond_7a0
    const-string v3, "android.permission.ACCESS_COARSE_LOCATION"

    invoke-static {v2, v3}, Lfr3;->Q(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_7ab

    sget-object v3, Lih0;->d:Lih0;

    goto :goto_7ad

    :cond_7ab
    sget-object v3, Lih0;->b:Lih0;

    :goto_7ad
    invoke-virtual {v2}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v4

    check-cast v4, Lcom/opera/android/OperaApplication;

    invoke-virtual {v4}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object v4

    iget-object v4, v4, Ld6j;->d:Lx5f;

    iget-object v5, v4, Lx5f;->d:Lzpa;

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v6

    invoke-virtual {v6, v5}, Lx56;->L(Lzpa;)Lrr0;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/16 v7, 0x13

    invoke-virtual {v5, v7, v13, v3}, Ljf0;->q(IILjava/lang/Object;)V

    invoke-virtual {v4, v6}, Lx5f;->U0(Lx56;)V

    invoke-virtual {v2}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v3

    check-cast v3, Lcom/opera/android/OperaApplication;

    invoke-virtual {v3}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object v3

    iget-object v3, v3, Ld6j;->d:Lx5f;

    iget-object v4, v0, Lau1;->e:Lox3;

    invoke-virtual {v4}, Lox3;->get()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljtg;

    invoke-virtual {v4}, Ljtg;->b()Z

    move-result v5

    iget-object v6, v3, Lx5f;->d:Lzpa;

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v7

    invoke-virtual {v7, v6}, Lx56;->O(Lzpa;)Le66;

    move-result-object v6

    const/4 v8, 0x3

    invoke-virtual {v6, v8, v13, v5}, Ljf0;->r(IIZ)V

    invoke-virtual {v3, v7}, Lx5f;->U0(Lx56;)V

    invoke-virtual {v4}, Ljtg;->d()Z

    move-result v4

    iget-object v5, v3, Lx5f;->d:Lzpa;

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v6

    invoke-virtual {v6, v5}, Lx56;->O(Lzpa;)Le66;

    move-result-object v5

    const/4 v9, 0x4

    invoke-virtual {v5, v9, v13, v4}, Ljf0;->r(IIZ)V

    invoke-virtual {v3, v6}, Lx5f;->U0(Lx56;)V

    invoke-virtual {v2}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v3

    check-cast v3, Lcom/opera/android/OperaApplication;

    invoke-virtual {v3}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object v3

    iget-object v3, v3, Ld6j;->d:Lx5f;

    iget-object v4, v0, Lau1;->f:Lf4b;

    invoke-virtual {v4}, Lf4b;->b()Z

    move-result v4

    iget-object v5, v3, Lx5f;->d:Lzpa;

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v6

    invoke-virtual {v6, v5}, Lx56;->N(Lzpa;)Lzs0;

    move-result-object v5

    const/4 v12, 0x7

    invoke-virtual {v5, v12, v13, v4}, Ljf0;->r(IIZ)V

    invoke-virtual {v3, v6}, Lx5f;->U0(Lx56;)V

    invoke-virtual {v2}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v3

    check-cast v3, Lcom/opera/android/OperaApplication;

    invoke-virtual {v3}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object v3

    iget-object v3, v3, Ld6j;->d:Lx5f;

    invoke-static {v2}, Lz5i;->I(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v2

    iget-object v4, v3, Lx5f;->d:Lzpa;

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v5

    new-instance v6, Lck0;

    invoke-direct {v6, v4, v5}, Lck0;-><init>(Lzpa;Lx56;)V

    iget-object v4, v6, Lck0;->c:Lzyk;

    invoke-virtual {v4}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lxf0;

    iget-object v4, v4, Lxf0;->a:Ltf0;

    const/16 v6, 0xb

    invoke-virtual {v4, v6, v2}, Ltf0;->x(ILjava/lang/String;)V

    invoke-virtual {v3, v5}, Lx5f;->U0(Lx56;)V

    new-instance v2, Lbp;

    invoke-direct {v2}, Ljava/lang/Object;-><init>()V

    invoke-virtual/range {p1 .. p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v3

    iput-object v3, v2, Lbp;->b:Ljava/lang/Object;

    iput v1, v2, Lbp;->a:I

    if-eq v1, v13, :cond_873

    invoke-static/range {p1 .. p1}, Lmom;->a(Landroid/content/Context;)Lgom;

    move-result-object v0

    invoke-virtual {v2, v0}, Lbp;->Y(Lgom;)V

    goto :goto_879

    :cond_873
    iget-object v0, v0, Lau1;->b:Ltd2;

    const/4 v1, 0x0

    invoke-virtual {v0, v1, v2}, Ltd2;->a(Landroid/app/NotificationManager;Lfd2;)V

    :cond_879
    :goto_879
    return-void

    :goto_87a
    :try_start_87a
    monitor-exit v4
    :try_end_87b
    .catchall {:try_start_87a .. :try_end_87b} :catchall_87c

    throw v0

    :catchall_87c
    move-exception v0

    goto :goto_87a

    :pswitch_data_87e
    .packed-switch 0x0
        :pswitch_42d
        :pswitch_42a
        :pswitch_427
        :pswitch_424
        :pswitch_421
        :pswitch_41e
        :pswitch_41b
        :pswitch_418
        :pswitch_415
    .end packed-switch
.end method

.method public final c(Lx5f;I)V
    .registers 5

    const/4 v0, 0x1

    if-eq p2, v0, :cond_1f

    const/4 v1, 0x2

    if-eq p2, v1, :cond_1c

    const/4 v1, 0x3

    if-eq p2, v1, :cond_19

    const/4 v1, 0x4

    if-ne p2, v1, :cond_f

    const-string v1, "weather_forecast"

    goto :goto_21

    :cond_f
    const-string p0, "Unknown notification channel: "

    invoke-static {p2, p0}, Lsko;->i(ILjava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lqp2;->o(Ljava/lang/String;)V

    return-void

    :cond_19
    const-string v1, "livescore"

    goto :goto_21

    :cond_1c
    const-string v1, "news"

    goto :goto_21

    :cond_1f
    const-string v1, "com_appboy_default_notification_channel"

    :goto_21
    iget-object p0, p0, Lau1;->d:Landroid/content/Context;

    invoke-static {p0, v1}, Lwbh;->m(Landroid/content/Context;Ljava/lang/String;)I

    move-result p0

    const/4 v1, -0x1

    if-eq p0, v1, :cond_4c

    if-eqz p0, :cond_3d

    if-ne p0, v0, :cond_50

    iget-boolean p0, p1, Lx5f;->h:Z

    if-eqz p0, :cond_50

    new-instance p0, Lz91;

    sget-object v0, Lvd0;->b:Lvd0;

    invoke-direct {p0, p2, v0}, Lz91;-><init>(ILvd0;)V

    invoke-virtual {p1, p0}, Lx5f;->T0(Lkotlin/jvm/functions/Function1;)V

    return-void

    :cond_3d
    iget-boolean p0, p1, Lx5f;->h:Z

    if-eqz p0, :cond_50

    new-instance p0, Lz91;

    sget-object v0, Lvd0;->c:Lvd0;

    invoke-direct {p0, p2, v0}, Lz91;-><init>(ILvd0;)V

    invoke-virtual {p1, p0}, Lx5f;->T0(Lkotlin/jvm/functions/Function1;)V

    return-void

    :cond_4c
    iget-boolean p0, p1, Lx5f;->h:Z

    if-nez p0, :cond_51

    :cond_50
    return-void

    :cond_51
    new-instance p0, Lz91;

    sget-object v0, Lvd0;->d:Lvd0;

    invoke-direct {p0, p2, v0}, Lz91;-><init>(ILvd0;)V

    invoke-virtual {p1, p0}, Lx5f;->T0(Lkotlin/jvm/functions/Function1;)V

    return-void
.end method

.method public final d(Lx5f;ILjava/lang/String;)V
    .registers 4

    iget-object p0, p0, Lau1;->a:Lcom/opera/android/settings/SettingsManager;

    invoke-virtual {p0, p3}, Lcom/opera/android/settings/SettingsManager;->j(Ljava/lang/String;)Lh7j;

    move-result-object p0

    iget-object p3, p0, Lh7j;->b:Lop0;

    iget-boolean p0, p0, Lh7j;->a:Z

    invoke-virtual {p1, p2, p3, p0}, Lx5f;->M0(ILop0;Z)V

    return-void
.end method

.method public final onActivityCreated(Landroid/app/Activity;Landroid/os/Bundle;)V
    .registers 3

    return-void
.end method

.method public final onActivityDestroyed(Landroid/app/Activity;)V
    .registers 2

    return-void
.end method

.method public final onActivityPaused(Landroid/app/Activity;)V
    .registers 2

    return-void
.end method

.method public final onActivityResumed(Landroid/app/Activity;)V
    .registers 2

    return-void
.end method

.method public final onActivitySaveInstanceState(Landroid/app/Activity;Landroid/os/Bundle;)V
    .registers 3

    return-void
.end method

.method public final onActivityStarted(Landroid/app/Activity;)V
    .registers 4

    iget v0, p0, Lau1;->c:I

    const/4 v1, 0x1

    if-nez v0, :cond_8

    invoke-virtual {p0, p1, p1, v1}, Lau1;->b(Landroid/content/Context;Landroid/app/Activity;I)V

    :cond_8
    iget p1, p0, Lau1;->c:I

    add-int/2addr p1, v1

    iput p1, p0, Lau1;->c:I

    return-void
.end method

.method public final onActivityStopped(Landroid/app/Activity;)V
    .registers 3

    iget v0, p0, Lau1;->c:I

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lau1;->c:I

    if-nez v0, :cond_14

    invoke-virtual {p1}, Landroid/app/Activity;->isFinishing()Z

    move-result v0

    if-eqz v0, :cond_10

    const/4 v0, 0x3

    goto :goto_11

    :cond_10
    const/4 v0, 0x2

    :goto_11
    invoke-virtual {p0, p1, p1, v0}, Lau1;->b(Landroid/content/Context;Landroid/app/Activity;I)V

    :cond_14
    return-void
.end method

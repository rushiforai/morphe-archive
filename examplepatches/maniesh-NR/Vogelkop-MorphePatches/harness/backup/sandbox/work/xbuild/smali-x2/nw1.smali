.class public final Lnw1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lqw1;


# instance fields
.field public final a:Lx5f;

.field public final b:Lx5f;

.field public final c:Lxnh;

.field public final d:Ll45;

.field public final e:Landroid/content/Context;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lx5f;Lx5f;Lxnh;Ll45;)V
    .registers 6

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lnw1;->a:Lx5f;

    iput-object p3, p0, Lnw1;->b:Lx5f;

    iput-object p4, p0, Lnw1;->c:Lxnh;

    iput-object p5, p0, Lnw1;->d:Ll45;

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    iput-object p1, p0, Lnw1;->e:Landroid/content/Context;

    return-void
.end method


# virtual methods
.method public final a(Lpw1;)V
    .registers 22

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    iget-object v2, v0, Lnw1;->a:Lx5f;

    iget-object v3, v2, Lx5f;->d:Lzpa;

    iget-object v4, v1, Lpw1;->a:Ljava/util/Map;

    const-string v5, "ad_set"

    const-string v6, ""

    iget-object v7, v0, Lnw1;->e:Landroid/content/Context;

    if-eqz v4, :cond_1b3

    new-instance v4, Lxa;

    const/16 v8, 0x12

    invoke-direct {v4, v0, v1, v8}, Lxa;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    iget-object v0, v0, Lnw1;->c:Lxnh;

    invoke-virtual {v0, v4}, Lno7;->b(Ljava/lang/Runnable;)V

    sget-object v0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {v7}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Lcom/opera/android/OperaApplication;

    invoke-virtual {v0}, Lcom/opera/android/OperaApplication;->u()Lm9c;

    move-result-object v0

    sget-object v4, Low1;->c:Low1;

    invoke-virtual {v1, v4}, Lpw1;->a(Low1;)Ljava/lang/String;

    move-result-object v9

    sget-object v10, Low1;->j:Low1;

    invoke-virtual {v1, v10}, Lpw1;->a(Low1;)Ljava/lang/String;

    move-result-object v11

    sget-object v12, Low1;->g:Low1;

    invoke-virtual {v1, v12}, Lpw1;->a(Low1;)Ljava/lang/String;

    move-result-object v13

    if-eqz v9, :cond_70

    invoke-virtual {v9}, Ljava/lang/String;->hashCode()I

    move-result v14

    const v15, -0x3135fb43

    if-eq v14, v15, :cond_65

    const v15, -0x207f24c2

    if-eq v14, v15, :cond_5c

    const v15, -0xbfa57aa

    if-ne v14, v15, :cond_70

    const-string v14, "Facebook Ads"

    invoke-virtual {v9, v14}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_70

    if-nez v11, :cond_76

    goto :goto_77

    :cond_5c
    const-string v14, "bytedanceglobal_int"

    invoke-virtual {v9, v14}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-nez v9, :cond_6d

    goto :goto_70

    :cond_65
    const-string v14, "googleadwords_int"

    invoke-virtual {v9, v14}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_70

    :cond_6d
    if-nez v13, :cond_74

    goto :goto_77

    :cond_70
    :goto_70
    if-nez v11, :cond_76

    if-eqz v13, :cond_77

    :cond_74
    move-object v6, v13

    goto :goto_77

    :cond_76
    move-object v6, v11

    :cond_77
    :goto_77
    iget-object v0, v0, Lm9c;->b:Lb59;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/SharedPreferences;

    invoke-static {v0, v5, v6}, Lcom/appsflyer/internal/j;->c(Landroid/content/SharedPreferences;Ljava/lang/String;Ljava/lang/String;)V

    sget-object v0, Low1;->b:Low1;

    invoke-virtual {v1, v0}, Lpw1;->a(Low1;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1, v4}, Lpw1;->a(Low1;)Ljava/lang/String;

    move-result-object v6

    sget-object v9, Low1;->d:Low1;

    invoke-virtual {v1, v9}, Lpw1;->a(Low1;)Ljava/lang/String;

    move-result-object v9

    sget-object v11, Low1;->e:Low1;

    invoke-virtual {v1, v11}, Lpw1;->a(Low1;)Ljava/lang/String;

    move-result-object v13

    sget-object v14, Low1;->f:Low1;

    invoke-virtual {v1, v14}, Lpw1;->a(Low1;)Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v1, v12}, Lpw1;->a(Low1;)Ljava/lang/String;

    move-result-object v12

    sget-object v8, Low1;->h:Low1;

    invoke-virtual {v1, v8}, Lpw1;->a(Low1;)Ljava/lang/String;

    move-result-object v8

    move-object/from16 v16, v7

    sget-object v7, Low1;->i:Low1;

    invoke-virtual {v1, v7}, Lpw1;->a(Low1;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v1, v10}, Lpw1;->a(Low1;)Ljava/lang/String;

    move-result-object v10

    move-object/from16 p0, v14

    sget-object v14, Low1;->n:Low1;

    invoke-virtual {v1, v14}, Lpw1;->a(Low1;)Ljava/lang/String;

    move-result-object v14

    move-object/from16 v17, v11

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v11

    if-eqz v5, :cond_d2

    move-object/from16 v18, v4

    invoke-virtual {v11, v3}, Lx56;->I(Lzpa;)Lin0;

    move-result-object v4

    move-object/from16 v19, v0

    const/16 v0, 0x12

    invoke-virtual {v4, v0, v5}, Lin0;->x(ILjava/lang/String;)V

    goto :goto_d6

    :cond_d2
    move-object/from16 v19, v0

    move-object/from16 v18, v4

    :goto_d6
    if-eqz v6, :cond_e1

    invoke-virtual {v11, v3}, Lx56;->I(Lzpa;)Lin0;

    move-result-object v0

    const/16 v4, 0x13

    invoke-virtual {v0, v4, v6}, Lin0;->x(ILjava/lang/String;)V

    :cond_e1
    if-eqz v9, :cond_ec

    invoke-virtual {v11, v3}, Lx56;->I(Lzpa;)Lin0;

    move-result-object v0

    const/16 v4, 0x14

    invoke-virtual {v0, v4, v9}, Lin0;->x(ILjava/lang/String;)V

    :cond_ec
    if-eqz v13, :cond_f7

    invoke-virtual {v11, v3}, Lx56;->I(Lzpa;)Lin0;

    move-result-object v0

    const/16 v4, 0x15

    invoke-virtual {v0, v4, v13}, Lin0;->x(ILjava/lang/String;)V

    :cond_f7
    if-eqz v15, :cond_102

    invoke-virtual {v11, v3}, Lx56;->I(Lzpa;)Lin0;

    move-result-object v0

    const/16 v4, 0x16

    invoke-virtual {v0, v4, v15}, Lin0;->x(ILjava/lang/String;)V

    :cond_102
    if-eqz v12, :cond_116

    invoke-virtual {v11, v3}, Lx56;->I(Lzpa;)Lin0;

    move-result-object v0

    const/16 v4, 0x17

    invoke-virtual {v0, v4, v12}, Lin0;->x(ILjava/lang/String;)V

    invoke-virtual {v11, v3}, Lx56;->I(Lzpa;)Lin0;

    move-result-object v0

    const/16 v4, 0x18

    invoke-virtual {v0, v4, v8}, Lin0;->x(ILjava/lang/String;)V

    :cond_116
    if-eqz v7, :cond_121

    invoke-virtual {v11, v3}, Lx56;->I(Lzpa;)Lin0;

    move-result-object v0

    const/16 v4, 0x19

    invoke-virtual {v0, v4, v7}, Lin0;->x(ILjava/lang/String;)V

    :cond_121
    if-eqz v10, :cond_12c

    invoke-virtual {v11, v3}, Lx56;->I(Lzpa;)Lin0;

    move-result-object v0

    const/16 v4, 0x1a

    invoke-virtual {v0, v4, v10}, Lin0;->x(ILjava/lang/String;)V

    :cond_12c
    if-eqz v14, :cond_137

    invoke-virtual {v11, v3}, Lx56;->I(Lzpa;)Lin0;

    move-result-object v0

    const/16 v4, 0x1b

    invoke-virtual {v0, v4, v14}, Lin0;->x(ILjava/lang/String;)V

    :cond_137
    invoke-virtual {v2, v11}, Lx5f;->U0(Lx56;)V

    move-object/from16 v0, v19

    invoke-virtual {v1, v0}, Lpw1;->a(Low1;)Ljava/lang/String;

    move-result-object v0

    move-object/from16 v4, v18

    invoke-virtual {v1, v4}, Lpw1;->a(Low1;)Ljava/lang/String;

    move-result-object v4

    move-object/from16 v5, v17

    invoke-virtual {v1, v5}, Lpw1;->a(Low1;)Ljava/lang/String;

    move-result-object v5

    move-object/from16 v6, p0

    invoke-virtual {v1, v6}, Lpw1;->a(Low1;)Ljava/lang/String;

    move-result-object v6

    const-string v7, "news_push_tracker"

    const/4 v8, 0x0

    move-object/from16 v9, v16

    invoke-virtual {v9, v7, v8}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v7

    invoke-interface {v7}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v7

    const-string v8, "npt_appsflyer_campaign"

    invoke-interface {v7, v8, v0}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v7, "npt_appsflyer_source"

    invoke-interface {v0, v7, v4}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v4, "npt_appsflyer_adgroup_id"

    invoke-interface {v0, v4, v5}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v4, "npt_appsflyer_af_adset_id"

    invoke-interface {v0, v4, v6}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    sget-object v0, Low1;->k:Low1;

    invoke-virtual {v1, v0}, Lpw1;->a(Low1;)Ljava/lang/String;

    move-result-object v0

    sget-object v4, Low1;->l:Low1;

    invoke-virtual {v1, v4}, Lpw1;->a(Low1;)Ljava/lang/String;

    move-result-object v4

    sget-object v5, Low1;->m:Low1;

    invoke-virtual {v1, v5}, Lpw1;->a(Low1;)Ljava/lang/String;

    move-result-object v1

    if-nez v0, :cond_192

    if-nez v4, :cond_192

    if-eqz v1, :cond_1cd

    :cond_192
    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v5

    invoke-virtual {v5, v3}, Lx56;->I(Lzpa;)Lin0;

    move-result-object v3

    if-eqz v0, :cond_1a1

    const/16 v6, 0x1c

    invoke-virtual {v3, v6, v0}, Lin0;->x(ILjava/lang/String;)V

    :cond_1a1
    if-eqz v4, :cond_1a8

    const/16 v0, 0x1d

    invoke-virtual {v3, v0, v4}, Lin0;->x(ILjava/lang/String;)V

    :cond_1a8
    if-eqz v1, :cond_1af

    const/16 v0, 0x1e

    invoke-virtual {v3, v0, v1}, Lin0;->x(ILjava/lang/String;)V

    :cond_1af
    invoke-virtual {v2, v5}, Lx5f;->U0(Lx56;)V

    return-void

    :cond_1b3
    move-object v9, v7

    iget-object v0, v0, Lnw1;->d:Ll45;

    sget-object v1, Ltw1;->b:Ltw1;

    invoke-virtual {v0, v1, v6}, Ll45;->M(Ltw1;Ljava/lang/String;)V

    sget-object v0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {v9}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Lcom/opera/android/OperaApplication;

    invoke-virtual {v0}, Lcom/opera/android/OperaApplication;->u()Lm9c;

    move-result-object v0

    invoke-virtual {v0}, Lm9c;->a()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_1ce

    :cond_1cd
    return-void

    :cond_1ce
    iget-object v0, v0, Lm9c;->b:Lb59;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/SharedPreferences;

    invoke-static {v0, v5, v6}, Lcom/appsflyer/internal/j;->c(Landroid/content/SharedPreferences;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

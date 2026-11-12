.class public final Lkse;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lb6j;
.implements Lf7f;


# instance fields
.field public final a:Lwnm;

.field public final b:Lv1;

.field public final c:Ljava/lang/String;

.field public final d:Lfqe;

.field public e:Z

.field public f:Lnre;

.field public g:Ljava/lang/String;

.field public final synthetic h:Lhd;


# direct methods
.method public constructor <init>(Lhd;Landroid/content/Context;Ljava/lang/String;)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lkse;->h:Lhd;

    sget-object p1, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {p2}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    check-cast p1, Lcom/opera/android/OperaApplication;

    iget-object v0, p1, Lcom/opera/android/OperaApplication;->r:Lxv1;

    iget-object v0, v0, Lxv1;->j0:Lj4c;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ldse;

    iget-object v0, v0, Ldse;->a:Lwnm;

    iput-object v0, p0, Lkse;->a:Lwnm;

    invoke-static {p2}, Lv1;->u(Landroid/content/Context;)Lv1;

    move-result-object p2

    iput-object p2, p0, Lkse;->b:Lv1;

    iput-object p3, p0, Lkse;->c:Ljava/lang/String;

    invoke-virtual {p1}, Lcom/opera/android/OperaApplication;->y()Lfqe;

    move-result-object p1

    iput-object p1, p0, Lkse;->d:Lfqe;

    invoke-virtual {v0, p0}, Lekc;->k(Lf7f;)V

    new-instance p1, Lyqd;

    const/16 p3, 0xc

    invoke-direct {p1, p0, p3}, Lyqd;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p2, p1}, Lno7;->b(Ljava/lang/Runnable;)V

    return-void
.end method


# virtual methods
.method public final a()V
    .registers 19

    move-object/from16 v0, p0

    iget-object v1, v0, Lkse;->f:Lnre;

    if-eqz v1, :cond_9b

    iget-object v13, v0, Lkse;->g:Ljava/lang/String;

    if-eqz v13, :cond_9b

    iget-object v15, v0, Lkse;->h:Lhd;

    iget-object v2, v15, Lhd;->c:Ljava/lang/Object;

    move-object/from16 v16, v2

    check-cast v16, Lfse;

    iget-object v2, v15, Lhd;->f:Ljava/lang/Object;

    move-object/from16 v17, v2

    check-cast v17, Landroid/content/Context;

    iget-object v2, v1, Lnre;->a:Ljava/lang/String;

    if-eqz v2, :cond_98

    iget-object v6, v0, Lkse;->c:Ljava/lang/String;

    invoke-virtual {v6}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_98

    invoke-static/range {v17 .. v17}, Lhd;->j(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    const-string v2, "npt_push_level"

    invoke-interface {v0, v2}, Landroid/content/SharedPreferences;->contains(Ljava/lang/String;)Z

    move-result v3

    const/4 v4, 0x0

    if-eqz v3, :cond_3c

    const/4 v3, -0x1

    invoke-interface {v0, v2, v3}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    move-object v3, v2

    goto :goto_3d

    :cond_3c
    move-object v3, v4

    :goto_3d
    const-string v2, "npt_facebook_campaign"

    invoke-interface {v0, v2, v4}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    const-string v2, "npt_appsflyer_campaign"

    invoke-interface {v0, v2, v4}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    const-string v2, "npt_appsflyer_source"

    invoke-interface {v0, v2, v4}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    const-string v2, "npt_appsflyer_adgroup_id"

    invoke-interface {v0, v2, v4}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    const-string v2, "npt_appsflyer_af_adset_id"

    invoke-interface {v0, v2, v4}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    const-string v2, "npt_install_referrer"

    invoke-interface {v0, v2, v4}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    const-string v2, "npt_user_mode"

    const-string v4, "classic"

    invoke-interface {v0, v2, v4}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v2, "npt_unsent_fcm_token"

    invoke-interface {v0, v2}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    new-instance v2, Ljse;

    iget-object v4, v1, Lnre;->a:Ljava/lang/String;

    iget-object v0, v1, Lnre;->b:Ljava/net/URL;

    invoke-virtual {v0}, Ljava/net/URL;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct/range {v2 .. v14}, Ljse;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual/range {v16 .. v16}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lmse;

    invoke-virtual {v0, v2}, Lmse;->e(Ljava/lang/Object;)V

    invoke-virtual/range {v16 .. v16}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lmse;

    invoke-virtual {v0}, Lmse;->g()V

    invoke-static/range {v17 .. v17}, Lcom/opera/android/news/newsfeed/internal/NewsPushTokenUploaderWorker;->d(Landroid/content/Context;)V

    :cond_98
    const/4 v0, 0x0

    iput-boolean v0, v15, Lhd;->b:Z

    :cond_9b
    return-void
.end method

.method public final b()V
    .registers 1

    invoke-virtual {p0}, Lkse;->c()V

    return-void
.end method

.method public final c()V
    .registers 4

    iget-object v0, p0, Lkse;->d:Lfqe;

    invoke-virtual {v0}, Lfqe;->c()Luqe;

    move-result-object v0

    invoke-virtual {v0}, Luqe;->h()Lc6j;

    move-result-object v0

    iget-object v1, v0, Lc6j;->c:Ljava/util/HashSet;

    iget-object v0, v0, Lc6j;->b:Ljava/lang/Object;

    check-cast v0, Lnre;

    iput-object v0, p0, Lkse;->f:Lnre;

    iget-boolean v2, p0, Lkse;->e:Z

    if-eqz v0, :cond_22

    if-eqz v2, :cond_1e

    const/4 v0, 0x0

    iput-boolean v0, p0, Lkse;->e:Z

    invoke-virtual {v1, p0}, Ljava/util/HashSet;->remove(Ljava/lang/Object;)Z

    :cond_1e
    invoke-virtual {p0}, Lkse;->a()V

    return-void

    :cond_22
    if-nez v2, :cond_2a

    const/4 v0, 0x1

    iput-boolean v0, p0, Lkse;->e:Z

    invoke-virtual {v1, p0}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    :cond_2a
    return-void
.end method

.method public final d0(Ljava/lang/Object;)V
    .registers 2

    check-cast p1, Lcse;

    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    move-result p1

    if-eqz p1, :cond_9

    return-void

    :cond_9
    iget-object p1, p0, Lkse;->a:Lwnm;

    invoke-virtual {p1, p0}, Lekc;->p(Lf7f;)V

    invoke-virtual {p0}, Lkse;->c()V

    return-void
.end method

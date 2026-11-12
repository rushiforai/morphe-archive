.class public abstract Lase;
.super Lwbh;
.source "SourceFile"


# instance fields
.field public final r:Lnrl;

.field public final s:Ljava/lang/String;

.field public final t:Lcue;

.field public final u:Lua7;

.field public final v:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;Lorm;Lskm;Landroid/os/Bundle;Ls0f;Lua7;)V
    .registers 7

    invoke-direct/range {p0 .. p5}, Lwbh;-><init>(Landroid/content/Context;Lorm;Lskm;Landroid/os/Bundle;Ls0f;)V

    const/4 p2, 0x1

    iput-boolean p2, p0, Lase;->v:Z

    iput-object p6, p0, Lase;->u:Lua7;

    const-string p2, "news_backend"

    invoke-virtual {p4, p2}, Landroid/os/BaseBundle;->containsKey(Ljava/lang/String;)Z

    move-result p3

    if-eqz p3, :cond_4e

    const/4 p3, -0x1

    invoke-virtual {p4, p2, p3}, Landroid/os/BaseBundle;->getInt(Ljava/lang/String;I)I

    move-result p3

    invoke-static {p3}, Lcue;->d(I)Lcue;

    move-result-object p3

    const/4 p5, 0x0

    if-eqz p3, :cond_48

    sget-object p6, Lcue;->b:Lcue;

    if-eq p3, p6, :cond_42

    iput-object p3, p0, Lase;->t:Lcue;

    const-string p2, "news_article_id"

    const-string p3, ""

    invoke-virtual {p4, p2, p3}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    iput-object p2, p0, Lase;->s:Ljava/lang/String;

    new-instance p2, Lnrl;

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const-string p3, "news_icon_fetch_failed"

    invoke-virtual {p4, p3}, Landroid/os/BaseBundle;->getBoolean(Ljava/lang/String;)Z

    move-result p3

    invoke-direct {p2, p1, p3}, Lnrl;-><init>(Ljava/lang/Object;Z)V

    iput-object p2, p0, Lase;->r:Lnrl;

    return-void

    :cond_42
    new-instance p0, Ldjb;

    invoke-direct {p0, p2, p5}, Ldjb;-><init>(Ljava/lang/String;Ljava/lang/Exception;)V

    throw p0

    :cond_48
    new-instance p0, Ldjb;

    invoke-direct {p0, p2, p5}, Ldjb;-><init>(Ljava/lang/String;Ljava/lang/Exception;)V

    throw p0

    :cond_4e
    new-instance p0, Ldjb;

    invoke-direct {p0, p2}, Ldjb;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static y(Landroid/widget/RemoteViews;Landroid/graphics/Bitmap;)V
    .registers 5

    const v0, 0x7f0a01bc

    const v1, 0x7f0a0322

    if-eqz p1, :cond_11

    const/16 v2, 0x8

    invoke-virtual {p0, v0, v2}, Landroid/widget/RemoteViews;->setViewVisibility(II)V

    invoke-virtual {p0, v1, p1}, Landroid/widget/RemoteViews;->setImageViewBitmap(ILandroid/graphics/Bitmap;)V

    return-void

    :cond_11
    const/4 p1, 0x0

    invoke-virtual {p0, v1, p1}, Landroid/widget/RemoteViews;->setViewVisibility(II)V

    const p1, 0x7f0808f5

    invoke-virtual {p0, v0, p1}, Landroid/widget/RemoteViews;->setImageViewResource(II)V

    const p1, 0x7f08027f

    invoke-virtual {p0, v1, p1}, Landroid/widget/RemoteViews;->setImageViewResource(II)V

    return-void
.end method


# virtual methods
.method public final b()Ljava/lang/Boolean;
    .registers 1

    iget-object p0, p0, Lase;->r:Lnrl;

    iget-boolean p0, p0, Lnrl;->a:Z

    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public final d()Lua7;
    .registers 3

    invoke-super {p0}, Lwbh;->d()Lua7;

    move-result-object v0

    invoke-virtual {p0}, Lase;->x()Landroid/widget/RemoteViews;

    move-result-object p0

    iget-object v1, v0, Lua7;->b:Ljava/lang/Object;

    check-cast v1, Ll1f;

    iput-object p0, v1, Ll1f;->B:Landroid/widget/RemoteViews;

    return-object v0
.end method

.method public final l()Ljava/lang/String;
    .registers 1

    const-string p0, "news"

    return-object p0
.end method

.method public final o()Ljava/lang/String;
    .registers 1

    const-string p0, "news"

    return-object p0
.end method

.method public final s(JZ)V
    .registers 11

    invoke-super {p0, p1, p2, p3}, Lwbh;->s(JZ)V

    invoke-interface {p0}, Lqyl;->i()Lzn0;

    move-result-object p1

    invoke-virtual {p0}, Lwbh;->c()Lyn0;

    move-result-object p2

    iget-object v2, p0, Lwbh;->k:Ljava/lang/String;

    sget-object p3, Lhd;->h:Lhd;

    if-nez p3, :cond_12

    return-void

    :cond_12
    sget-object v0, Lyn0;->f:Lyn0;

    if-ne v0, p2, :cond_26

    sget-object p2, Lzn0;->d:Lzn0;

    if-eq p1, p2, :cond_28

    sget-object p2, Lzn0;->e:Lzn0;

    if-eq p1, p2, :cond_28

    sget-object p2, Lzn0;->j:Lzn0;

    if-eq p1, p2, :cond_28

    sget-object p2, Lzn0;->l:Lzn0;

    if-eq p1, p2, :cond_28

    :cond_26
    const/4 p0, 0x0

    goto :goto_38

    :cond_28
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v5

    new-instance v0, Lgse;

    const-string v1, "firebase"

    iget-object v3, p0, Lwbh;->l:Ljava/lang/String;

    const-string v4, "click"

    invoke-direct/range {v0 .. v6}, Lgse;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;J)V

    move-object p0, v0

    :goto_38
    invoke-virtual {p3, p0}, Lhd;->s(Lgse;)V

    return-void
.end method

.method public final u()V
    .registers 11

    invoke-super {p0}, Lwbh;->u()V

    invoke-interface {p0}, Lqyl;->i()Lzn0;

    move-result-object v0

    invoke-virtual {p0}, Lwbh;->c()Lyn0;

    move-result-object v1

    iget-object v4, p0, Lwbh;->k:Ljava/lang/String;

    sget-object v9, Lhd;->h:Lhd;

    if-nez v9, :cond_12

    return-void

    :cond_12
    sget-object v2, Lyn0;->f:Lyn0;

    if-ne v2, v1, :cond_26

    sget-object v1, Lzn0;->d:Lzn0;

    if-eq v0, v1, :cond_28

    sget-object v1, Lzn0;->e:Lzn0;

    if-eq v0, v1, :cond_28

    sget-object v1, Lzn0;->j:Lzn0;

    if-eq v0, v1, :cond_28

    sget-object v1, Lzn0;->l:Lzn0;

    if-eq v0, v1, :cond_28

    :cond_26
    const/4 p0, 0x0

    goto :goto_38

    :cond_28
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v7

    new-instance v2, Lgse;

    const-string v3, "firebase"

    iget-object v5, p0, Lwbh;->l:Ljava/lang/String;

    const-string v6, "receive"

    invoke-direct/range {v2 .. v8}, Lgse;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;J)V

    move-object p0, v2

    :goto_38
    invoke-virtual {v9, p0}, Lhd;->s(Lgse;)V

    return-void
.end method

.method public final v(Z)V
    .registers 11

    invoke-super {p0, p1}, Lwbh;->v(Z)V

    invoke-interface {p0}, Lqyl;->i()Lzn0;

    move-result-object p1

    invoke-virtual {p0}, Lwbh;->c()Lyn0;

    move-result-object v0

    iget-object v3, p0, Lwbh;->k:Ljava/lang/String;

    sget-object v8, Lhd;->h:Lhd;

    if-nez v8, :cond_12

    return-void

    :cond_12
    sget-object v1, Lyn0;->f:Lyn0;

    if-ne v1, v0, :cond_26

    sget-object v0, Lzn0;->d:Lzn0;

    if-eq p1, v0, :cond_28

    sget-object v0, Lzn0;->e:Lzn0;

    if-eq p1, v0, :cond_28

    sget-object v0, Lzn0;->j:Lzn0;

    if-eq p1, v0, :cond_28

    sget-object v0, Lzn0;->l:Lzn0;

    if-eq p1, v0, :cond_28

    :cond_26
    const/4 p0, 0x0

    goto :goto_38

    :cond_28
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v6

    new-instance v1, Lgse;

    const-string v2, "firebase"

    iget-object v4, p0, Lwbh;->l:Ljava/lang/String;

    const-string v5, "show"

    invoke-direct/range {v1 .. v7}, Lgse;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;J)V

    move-object p0, v1

    :goto_38
    invoke-virtual {v8, p0}, Lhd;->s(Lgse;)V

    return-void
.end method

.method public w()Z
    .registers 12

    const-string v0, "news"

    iget-object v1, p0, Lwbh;->a:Landroid/content/Context;

    invoke-static {v1, v0}, Lwbh;->m(Landroid/content/Context;Ljava/lang/String;)I

    move-result v0

    const/4 v2, 0x1

    if-eq v0, v2, :cond_11

    sget-object v0, Lvn0;->k:Lvn0;

    invoke-virtual {p0, v0}, Lwbh;->t(Lvn0;)V

    return v2

    :cond_11
    sget-object v0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {v1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Lcom/opera/android/OperaApplication;

    sget-object v3, Lhte;->k:Lite;

    invoke-static {v1}, Lna2;->w(Landroid/content/Context;)Lhte;

    move-result-object v1

    invoke-virtual {v0}, Lcom/opera/android/OperaApplication;->J()Lcom/opera/android/settings/SettingsManager;

    move-result-object v0

    const-string v3, "enable_newsfeed"

    invoke-virtual {v0, v3}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result v0

    invoke-virtual {v1}, Lno7;->i()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lite;

    if-nez v1, :cond_34

    sget-object v0, Lcse;->c:Lcse;

    goto :goto_49

    :cond_34
    iget-boolean v3, v1, Lite;->c:Z

    if-eqz v3, :cond_3b

    sget-object v0, Lcse;->b:Lcse;

    goto :goto_49

    :cond_3b
    iget-boolean v1, v1, Lite;->d:Z

    if-eqz v1, :cond_42

    sget-object v0, Lcse;->a:Lcse;

    goto :goto_49

    :cond_42
    if-eqz v0, :cond_47

    sget-object v0, Lcse;->a:Lcse;

    goto :goto_49

    :cond_47
    sget-object v0, Lcse;->b:Lcse;

    :goto_49
    sget-object v1, Lcse;->a:Lcse;

    if-ne v0, v1, :cond_109

    iget-boolean v0, p0, Lase;->v:Z

    const/4 v1, 0x0

    if-eqz v0, :cond_108

    iget-object v0, p0, Lase;->t:Lcue;

    sget-object v3, Lcue;->c:Lcue;

    if-ne v0, v3, :cond_108

    iget-object v0, p0, Lase;->s:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_108

    iget-object v3, p0, Lase;->u:Lua7;

    iget-object v4, v3, Lua7;->d:Ljava/lang/Object;

    check-cast v4, Lni6;

    iget-object v4, v4, Lni6;->a:Lb59;

    invoke-virtual {v4}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/content/SharedPreferences;

    const-string v5, "recent_news_push_history"

    const/4 v6, 0x0

    invoke-interface {v4, v5, v6}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    const-string v7, "\n"

    if-eqz v4, :cond_82

    invoke-virtual {v4, v7}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v4

    goto :goto_84

    :cond_82
    sget-object v4, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    :goto_84
    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v8

    sub-int/2addr v8, v2

    :goto_89
    if-ltz v8, :cond_9a

    invoke-interface {v4, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v9

    invoke-virtual {v0, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_97

    move v4, v2

    goto :goto_9b

    :cond_97
    add-int/lit8 v8, v8, -0x1

    goto :goto_89

    :cond_9a
    move v4, v1

    :goto_9b
    if-nez v4, :cond_e2

    iget-object v8, v3, Lua7;->d:Ljava/lang/Object;

    check-cast v8, Lni6;

    iget-object v8, v8, Lni6;->a:Lb59;

    new-instance v9, Ljava/util/ArrayList;

    invoke-virtual {v8}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Landroid/content/SharedPreferences;

    invoke-interface {v10, v5, v6}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    if-eqz v6, :cond_ba

    invoke-virtual {v6, v7}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v6

    goto :goto_bc

    :cond_ba
    sget-object v6, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    :goto_bc
    invoke-direct {v9, v6}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-virtual {v9, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-virtual {v9}, Ljava/util/ArrayList;->size()I

    move-result v6

    const/16 v10, 0x32

    if-le v6, v10, :cond_cd

    invoke-virtual {v9, v1}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    :cond_cd
    invoke-virtual {v8}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Landroid/content/SharedPreferences;

    invoke-interface {v6}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v6

    invoke-static {v7, v9}, Landroid/text/TextUtils;->join(Ljava/lang/CharSequence;Ljava/lang/Iterable;)Ljava/lang/String;

    move-result-object v7

    invoke-interface {v6, v5, v7}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v5

    invoke-interface {v5}, Landroid/content/SharedPreferences$Editor;->apply()V

    :cond_e2
    if-nez v4, :cond_102

    iget-object v4, v3, Lua7;->b:Ljava/lang/Object;

    check-cast v4, Landroid/content/Context;

    iget-object v3, v3, Lua7;->c:Ljava/lang/Object;

    check-cast v3, Lii;

    invoke-virtual {v3}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lqre;

    new-instance v5, Lrqd;

    const/16 v6, 0x12

    invoke-direct {v5, v6}, Lrqd;-><init>(B)V

    invoke-static {v4, v0, v3, v5}, Lxqe;->c(Landroid/content/Context;Ljava/lang/String;Lqre;Lwqe;)Lmsh;

    move-result-object v0

    if-eqz v0, :cond_108

    sget-object v0, Lvn0;->g:Lvn0;

    goto :goto_104

    :cond_102
    sget-object v0, Lvn0;->i:Lvn0;

    :goto_104
    invoke-virtual {p0, v0}, Lwbh;->t(Lvn0;)V

    return v2

    :cond_108
    return v1

    :cond_109
    sget-object v0, Lvn0;->j:Lvn0;

    invoke-virtual {p0, v0}, Lwbh;->t(Lvn0;)V

    return v2
.end method

.method public abstract x()Landroid/widget/RemoteViews;
.end method

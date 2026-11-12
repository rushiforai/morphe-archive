.class public final Leij;
.super Lvhj;
.source "SourceFile"


# instance fields
.field public final q:Ljava/lang/String;

.field public final r:Ljava/lang/String;

.field public final s:Ljava/lang/String;

.field public final t:Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lumi;Landroid/os/Bundle;)V
    .registers 4

    invoke-direct {p0, p1, p2, p3}, Lvhj;-><init>(Landroid/content/Context;Lumi;Landroid/os/Bundle;)V

    iget-object p1, p0, Ldij;->d:Lcue;

    sget-object p2, Lcue;->c:Lcue;

    if-ne p1, p2, :cond_48

    iget-object p1, p0, Ldij;->c:Ljava/lang/String;

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p1

    if-nez p1, :cond_40

    const-string p1, "newsfeed_hot_topic"

    const-string p2, ""

    invoke-virtual {p3, p1, p2}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Leij;->q:Ljava/lang/String;

    const-string p1, "newsfeed_category"

    invoke-virtual {p3, p1, p2}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Leij;->r:Ljava/lang/String;

    const-string p1, "newsfeed_recommend_type"

    invoke-virtual {p3, p1, p2}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Leij;->s:Ljava/lang/String;

    const-string p1, "newsfeed_type"

    invoke-virtual {p3, p1}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p3

    if-nez p3, :cond_3a

    iput-object p2, p0, Leij;->t:Ljava/lang/String;

    return-void

    :cond_3a
    new-instance p0, Ldjb;

    invoke-direct {p0, p1}, Ldjb;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_40
    new-instance p0, Ldjb;

    const-string p1, "show_news_request_id"

    invoke-direct {p0, p1}, Ldjb;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_48
    new-instance p0, Ldjb;

    const-string p1, "show_news_backend"

    const/4 p2, 0x0

    invoke-direct {p0, p1, p2}, Ldjb;-><init>(Ljava/lang/String;Ljava/lang/Exception;)V

    throw p0
.end method


# virtual methods
.method public final a(Landroid/content/Context;)Landroid/content/Intent;
    .registers 3

    const-string v0, "com.opera.android.action.SHOW_NEWSFEED_ARTICLE"

    invoke-virtual {p0, p1, v0}, Ls0f;->b(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object p0

    return-object p0
.end method

.method public final c()Landroid/os/Bundle;
    .registers 4

    invoke-super {p0}, Lvhj;->c()Landroid/os/Bundle;

    move-result-object v0

    const-string v1, "newsfeed_hot_topic"

    iget-object v2, p0, Leij;->q:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "newsfeed_category"

    iget-object v2, p0, Leij;->r:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "newsfeed_recommend_type"

    iget-object v2, p0, Leij;->s:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "newsfeed_type"

    iget-object p0, p0, Leij;->t:Ljava/lang/String;

    invoke-virtual {v0, v1, p0}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    return-object v0
.end method

.method public final e(Lcom/opera/android/BrowserActivity;)Z
    .registers 34

    move-object/from16 v0, p0

    iget-object v1, v0, Ldij;->c:Ljava/lang/String;

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    const/4 v2, 0x0

    if-eqz v1, :cond_c

    return v2

    :cond_c
    sget-object v1, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual/range {p1 .. p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    check-cast v1, Lcom/opera/android/OperaApplication;

    invoke-virtual {v1}, Lcom/opera/android/OperaApplication;->y()Lfqe;

    move-result-object v1

    invoke-virtual {v1}, Lfqe;->c()Luqe;

    move-result-object v1

    iget-object v3, v1, Luqe;->v:Lta7;

    iget-object v4, v0, Lvhj;->i:Ljava/net/URL;

    if-eqz v4, :cond_41

    invoke-virtual {v4}, Ljava/net/URL;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3}, Lta7;->s()Landroid/content/SharedPreferences;

    move-result-object v3

    const-string v5, "user_id"

    const/4 v6, 0x0

    invoke-interface {v3, v5, v6}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v4, v6, v6, v6, v3}, Ll45;->r(Ljava/lang/String;Ljava/lang/Integer;Ljava/lang/String;Ljava/util/List;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v3

    invoke-virtual {v3}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v3

    sget-object v4, Lwqm;->a:[Ljava/lang/String;

    invoke-static {v3}, La26;->e0(Ljava/lang/String;)Ljava/net/URL;

    move-result-object v3

    iput-object v3, v0, Lvhj;->i:Ljava/net/URL;

    :cond_41
    new-instance v4, Lp12;

    const/4 v11, 0x0

    const/4 v12, 0x0

    iget-object v5, v0, Ldij;->c:Ljava/lang/String;

    iget-object v6, v0, Lvhj;->g:Ljava/lang/String;

    const/4 v7, 0x0

    iget-object v8, v0, Leij;->q:Ljava/lang/String;

    iget-object v9, v0, Leij;->r:Ljava/lang/String;

    iget-object v10, v0, Leij;->s:Ljava/lang/String;

    invoke-direct/range {v4 .. v12}, Lp12;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/io/Serializable;)V

    const-string v3, ""

    invoke-static {v3}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v8

    new-instance v29, Lpre;

    invoke-direct/range {v29 .. v29}, Lpre;-><init>()V

    move-object/from16 v25, v4

    new-instance v4, Lmsh;

    sget-object v10, Landroid/net/Uri;->EMPTY:Landroid/net/Uri;

    const/16 v30, 0x0

    const/16 v31, 0x0

    const-string v5, ""

    iget-object v6, v0, Leij;->t:Ljava/lang/String;

    iget v9, v0, Lvhj;->j:I

    const/4 v13, 0x0

    const-wide/16 v14, 0x0

    const-wide/16 v16, 0x0

    const/16 v20, 0x0

    const/16 v21, 0x0

    const/16 v22, 0x0

    const/16 v23, 0x0

    iget-object v3, v0, Lvhj;->f:Ljava/lang/String;

    const/16 v26, 0x0

    const/16 v27, 0x0

    const/16 v28, 0x0

    move-object v7, v5

    move-object v11, v8

    move-object v12, v8

    move-object/from16 v18, v5

    move-object/from16 v19, v5

    move-object/from16 v24, v3

    invoke-direct/range {v4 .. v31}, Lmsh;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/net/Uri;ILandroid/net/Uri;Landroid/net/Uri;Landroid/net/Uri;Landroid/net/Uri;JJLjava/lang/String;Ljava/lang/String;IIILjava/util/ArrayList;Ljava/lang/String;Lp12;Ljava/util/List;Ljava/util/List;Ljava/lang/String;Lqre;Lxlg;Lnb8;)V

    iget-object v3, v4, Lmsh;->v:Lp12;

    iget-object v3, v3, Lp12;->b:Ljava/lang/Object;

    check-cast v3, Ljava/lang/String;

    iget-object v5, v1, Luqe;->h:Luy8;

    invoke-virtual {v5, v4, v2}, Luy8;->j(Loqe;I)V

    iget-object v2, v1, Luqe;->u:Landroid/util/LruCache;

    invoke-virtual {v2, v3, v4}, Landroid/util/LruCache;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v2, v1, Luqe;->t:Lbch;

    invoke-virtual {v2, v1, v3}, Lbch;->a(Luqe;Ljava/lang/String;)V

    invoke-super/range {p0 .. p1}, Lvhj;->e(Lcom/opera/android/BrowserActivity;)Z

    move-result v0

    return v0
.end method

.class public Lvhj;
.super Ldij;
.source "SourceFile"


# instance fields
.field public final f:Ljava/lang/String;

.field public final g:Ljava/lang/String;

.field public final h:Ljava/net/URL;

.field public i:Ljava/net/URL;

.field public final j:I

.field public final k:Ljava/lang/String;

.field public final l:I

.field public final m:Ljava/lang/String;

.field public final n:Landroid/content/Context;

.field public final o:Ljava/lang/String;

.field public final p:Ljava/net/URL;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lumi;Landroid/os/Bundle;)V
    .registers 16

    invoke-direct {p0, p3}, Ldij;-><init>(Landroid/os/Bundle;)V

    iput-object p1, p0, Lvhj;->n:Landroid/content/Context;

    const-string v0, "show_article_article_id"

    invoke-virtual {p3, v0}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_15a

    iput-object v1, p0, Lvhj;->g:Ljava/lang/String;

    const-string v0, "show_article_final_url"

    invoke-virtual {p3, v0}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_154

    invoke-static {v1}, Lmdb;->e(Ljava/lang/String;)Z

    move-result v2

    const/4 v3, 0x0

    if-eqz v2, :cond_2d

    sget-object v2, Lwqm;->a:[Ljava/lang/String;

    invoke-static {v1}, La26;->e0(Ljava/lang/String;)Ljava/net/URL;

    move-result-object v1

    goto :goto_2e

    :cond_2d
    move-object v1, v3

    :goto_2e
    if-eqz v1, :cond_14e

    iput-object v1, p0, Lvhj;->h:Ljava/net/URL;

    const-string v0, "show_article_news_id"

    const-string v1, ""

    invoke-virtual {p3, v0, v1}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lvhj;->f:Ljava/lang/String;

    const-string v2, "show_article_reader_mode_url"

    invoke-virtual {p3, v2}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-eqz v5, :cond_4e

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-nez v5, :cond_ad

    :cond_4e
    iget-object v5, p0, Ldij;->d:Lcue;

    sget-object v6, Lcue;->c:Lcue;

    if-ne v5, v6, :cond_a7

    new-instance v5, Lta7;

    invoke-direct {v5, p1, p2}, Lta7;-><init>(Landroid/content/Context;Lumi;)V

    invoke-virtual {v5}, Lta7;->r()Lyla;

    move-result-object p2

    if-eqz p2, :cond_a7

    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v6

    if-eqz v6, :cond_6d

    iget-object v6, p2, Lyla;->b:Ljava/net/URL;

    invoke-static {v6, v0}, Ll45;->o(Ljava/net/URL;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    :goto_6b
    move-object v6, v0

    goto :goto_72

    :cond_6d
    invoke-static {v4}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    goto :goto_6b

    :goto_72
    const-string v0, "categories_features"

    :try_start_74
    invoke-virtual {v5}, Lta7;->s()Landroid/content/SharedPreferences;

    move-result-object v7

    const-wide/16 v8, 0x0

    invoke-interface {v7, v0, v8, v9}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v7
    :try_end_7e
    .catch Ljava/lang/ClassCastException; {:try_start_74 .. :try_end_7e} :catch_80

    :goto_7e
    move-wide v8, v7

    goto :goto_8b

    :catch_80
    invoke-virtual {v5}, Lta7;->s()Landroid/content/SharedPreferences;

    move-result-object v7

    const/4 v8, 0x0

    invoke-interface {v7, v0, v8}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v0

    int-to-long v7, v0

    goto :goto_7e

    :goto_8b
    invoke-virtual {v5}, Lta7;->s()Landroid/content/SharedPreferences;

    move-result-object v0

    const-string v5, "categories_config_bundle"

    invoke-interface {v0, v5, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    iget-object v11, p2, Lyla;->e:Ll0c;

    move-object v7, p1

    invoke-static/range {v6 .. v11}, Ll45;->x(Landroid/net/Uri;Landroid/content/Context;JLjava/lang/String;Ll0c;)Landroid/net/Uri;

    move-result-object p1

    invoke-virtual {p1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object p1

    sget-object p2, Lwqm;->a:[Ljava/lang/String;

    invoke-static {p1}, La26;->e0(Ljava/lang/String;)Ljava/net/URL;

    move-result-object p1

    goto :goto_b5

    :cond_a7
    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p1

    if-eqz p1, :cond_af

    :cond_ad
    move-object p1, v3

    goto :goto_b5

    :cond_af
    sget-object p1, Lwqm;->a:[Ljava/lang/String;

    invoke-static {v4}, La26;->e0(Ljava/lang/String;)Ljava/net/URL;

    move-result-object p1

    :goto_b5
    iput-object p1, p0, Lvhj;->i:Ljava/net/URL;

    const-string p1, "show_article_open_type"

    invoke-virtual {p3, p1}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    const-string p2, "original"

    invoke-virtual {p2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_c7

    const/4 p1, 0x1

    goto :goto_d2

    :cond_c7
    const-string p2, "transcoded"

    invoke-virtual {p2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_d1

    const/4 p1, 0x2

    goto :goto_d2

    :cond_d1
    const/4 p1, 0x3

    :goto_d2
    iput p1, p0, Lvhj;->j:I

    const-string p1, "show_article_hint_text"

    invoke-virtual {p3, p1, v1}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lvhj;->k:Ljava/lang/String;

    const-string p1, "show_article_hint_scroll_pos"

    const/4 p2, -0x1

    invoke-virtual {p3, p1, p2}, Landroid/os/BaseBundle;->getInt(Ljava/lang/String;I)I

    move-result p1

    if-ltz p1, :cond_ec

    const/16 p2, 0x64

    if-gt p1, p2, :cond_ec

    iput p1, p0, Lvhj;->l:I

    goto :goto_f0

    :cond_ec
    const/16 p1, 0x50

    iput p1, p0, Lvhj;->l:I

    :goto_f0
    const-string p1, "show_article_back_dest"

    invoke-virtual {p3, p1, v1}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    const-string p2, "top_news"

    invoke-virtual {p2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-nez p2, :cond_109

    const-string p2, "sd"

    invoke-virtual {p2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-nez p2, :cond_109

    iput-object p1, p0, Lvhj;->m:Ljava/lang/String;

    goto :goto_10b

    :cond_109
    iput-object v1, p0, Lvhj;->m:Ljava/lang/String;

    :goto_10b
    const-string p1, "show_article_title"

    invoke-virtual {p3, p1, v1}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lvhj;->o:Ljava/lang/String;

    const-string p1, "show_article_share_url"

    invoke-virtual {p3, p1}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p3

    if-eqz p3, :cond_121

    move-object p3, v3

    goto :goto_127

    :cond_121
    sget-object p3, Lwqm;->a:[Ljava/lang/String;

    invoke-static {p2}, La26;->e0(Ljava/lang/String;)Ljava/net/URL;

    move-result-object p3

    :goto_127
    iput-object p3, p0, Lvhj;->p:Ljava/net/URL;

    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p0

    if-nez p0, :cond_13b

    invoke-static {v4}, Lmdb;->e(Ljava/lang/String;)Z

    move-result p0

    if-nez p0, :cond_13b

    new-instance p0, Ldjb;

    invoke-direct {p0, v2, v3}, Ldjb;-><init>(Ljava/lang/String;Ljava/lang/Exception;)V

    throw p0

    :cond_13b
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p0

    if-nez p0, :cond_14d

    invoke-static {p2}, Lmdb;->e(Ljava/lang/String;)Z

    move-result p0

    if-nez p0, :cond_14d

    new-instance p0, Ldjb;

    invoke-direct {p0, p1, v3}, Ldjb;-><init>(Ljava/lang/String;Ljava/lang/Exception;)V

    throw p0

    :cond_14d
    return-void

    :cond_14e
    new-instance p0, Ldjb;

    invoke-direct {p0, v0, v3}, Ldjb;-><init>(Ljava/lang/String;Ljava/lang/Exception;)V

    throw p0

    :cond_154
    new-instance p0, Ldjb;

    invoke-direct {p0, v0}, Ldjb;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_15a
    new-instance p0, Ldjb;

    invoke-direct {p0, v0}, Ldjb;-><init>(Ljava/lang/String;)V

    throw p0
.end method


# virtual methods
.method public a(Landroid/content/Context;)Landroid/content/Intent;
    .registers 3

    const-string v0, "com.opera.android.action.SHOW_NEWS_ARTICLE"

    invoke-virtual {p0, p1, v0}, Ls0f;->b(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object p0

    return-object p0
.end method

.method public c()Landroid/os/Bundle;
    .registers 4

    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    const-string v1, "show_news_request_id"

    iget-object v2, p0, Ldij;->c:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "show_news_backend"

    const-string v2, "newsfeed"

    invoke-virtual {v0, v1, v2}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "show_news_reusable"

    iget-boolean v2, p0, Ldij;->e:Z

    invoke-virtual {v0, v1, v2}, Landroid/os/BaseBundle;->putBoolean(Ljava/lang/String;Z)V

    const-string v1, "show_article_article_id"

    iget-object v2, p0, Lvhj;->g:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v1, p0, Lvhj;->h:Ljava/net/URL;

    invoke-virtual {v1}, Ljava/net/URL;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "show_article_final_url"

    invoke-virtual {v0, v2, v1}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v1, p0, Lvhj;->i:Ljava/net/URL;

    if-eqz v1, :cond_39

    const-string v2, "show_article_reader_mode_url"

    invoke-virtual {v1}, Ljava/net/URL;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v2, v1}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    :cond_39
    const-string v1, "show_article_hint_text"

    iget-object v2, p0, Lvhj;->k:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "show_article_hint_scroll_pos"

    iget v2, p0, Lvhj;->l:I

    invoke-virtual {v0, v1, v2}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    const-string v1, "show_article_back_dest"

    iget-object v2, p0, Lvhj;->m:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const/4 v1, 0x1

    iget v2, p0, Lvhj;->j:I

    if-eq v2, v1, :cond_67

    const/4 v1, 0x2

    if-eq v2, v1, :cond_64

    const/4 v1, 0x3

    if-eq v2, v1, :cond_61

    const/4 v1, 0x4

    if-ne v2, v1, :cond_5f

    const-string v1, ""

    goto :goto_69

    :cond_5f
    const/4 p0, 0x0

    throw p0

    :cond_61
    const-string v1, "auto"

    goto :goto_69

    :cond_64
    const-string v1, "transcoded"

    goto :goto_69

    :cond_67
    const-string v1, "original"

    :goto_69
    const-string v2, "show_article_open_type"

    invoke-virtual {v0, v2, v1}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "show_article_title"

    iget-object v2, p0, Lvhj;->o:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    iget-object p0, p0, Lvhj;->p:Ljava/net/URL;

    if-eqz p0, :cond_82

    const-string v1, "show_article_share_url"

    invoke-virtual {p0}, Ljava/net/URL;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, v1, p0}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    :cond_82
    return-object v0
.end method

.method public e(Lcom/opera/android/BrowserActivity;)Z
    .registers 12

    iget-object p1, p0, Lvhj;->i:Ljava/net/URL;

    if-nez p1, :cond_6

    const/4 p0, 0x0

    return p0

    :cond_6
    new-instance v0, Lrgh;

    new-instance v1, Lg82;

    invoke-virtual {p1}, Ljava/net/URL;->toString()Ljava/lang/String;

    move-result-object v5

    iget-object p1, p0, Lvhj;->h:Ljava/net/URL;

    invoke-virtual {p1}, Ljava/net/URL;->toString()Ljava/lang/String;

    move-result-object v6

    const/4 p1, 0x0

    iget-object v2, p0, Lvhj;->p:Ljava/net/URL;

    if-eqz v2, :cond_1f

    invoke-virtual {v2}, Ljava/net/URL;->toString()Ljava/lang/String;

    move-result-object v2

    move-object v7, v2

    goto :goto_20

    :cond_1f
    move-object v7, p1

    :goto_20
    const/4 v8, 0x0

    const/4 v9, 0x0

    iget v2, p0, Lvhj;->j:I

    iget-object v3, p0, Lvhj;->g:Ljava/lang/String;

    iget-object v4, p0, Lvhj;->o:Ljava/lang/String;

    invoke-direct/range {v1 .. v9}, Lg82;-><init>(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)V

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sget-object v2, Llqm;->e:Llqm;

    iput-object v2, v0, Lrgh;->a:Ljava/lang/Object;

    sget-object v2, Llqm;->i:Llqm;

    iput-object v2, v0, Lrgh;->a:Ljava/lang/Object;

    const-string v2, "sd"

    iget-object v3, p0, Lvhj;->m:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    iget-object v4, p0, Lvhj;->n:Landroid/content/Context;

    if-eqz v2, :cond_48

    sget-object p0, Lcue;->b:Lcue;

    invoke-virtual {v0, v4, p0, p1}, Lrgh;->q(Landroid/content/Context;Lcue;Ljava/lang/String;)V

    goto :goto_5b

    :cond_48
    const-string p1, "top_news"

    invoke-virtual {p1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    iget-object p0, p0, Ldij;->d:Lcue;

    if-eqz p1, :cond_58

    const-string p1, "topnews"

    invoke-virtual {v0, v4, p0, p1}, Lrgh;->q(Landroid/content/Context;Lcue;Ljava/lang/String;)V

    goto :goto_5b

    :cond_58
    invoke-virtual {v0, v4, p0, v3}, Lrgh;->q(Landroid/content/Context;Lcue;Ljava/lang/String;)V

    :goto_5b
    new-instance p0, Lwhj;

    iget-object p1, v0, Lrgh;->a:Ljava/lang/Object;

    check-cast p1, Llqm;

    iget-object v0, v0, Lrgh;->b:Ljava/lang/Object;

    check-cast v0, Ljava/util/ArrayList;

    const/4 v2, 0x1

    invoke-direct {p0, v1, v2, p1, v0}, Lwhj;-><init>(Lg82;ILlqm;Ljava/util/ArrayList;)V

    new-instance p1, Lxxh;

    invoke-direct {p1}, Ljava/lang/Object;-><init>()V

    invoke-static {p1}, Lac8;->a(Ljava/lang/Object;)V

    invoke-static {p0}, Lac8;->a(Ljava/lang/Object;)V

    return v2
.end method

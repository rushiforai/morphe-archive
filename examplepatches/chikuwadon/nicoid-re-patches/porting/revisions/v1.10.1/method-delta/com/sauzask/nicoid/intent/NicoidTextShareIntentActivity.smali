.class public Lcom/sauzask/nicoid/intent/NicoidTextShareIntentActivity;
.super Landroid/app/Activity;
.source ""


# instance fields
.field public a:Ljava/lang/String;

.field public b:Ljava/lang/String;


# virtual methods
.method public onCreate(Landroid/os/Bundle;)V
    .registers 7

    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    const-string v1, "android.intent.action.SEND"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    const/4 v1, 0x2

    if-eqz v0, :cond_5d

    invoke-virtual {p1}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object p1

    if-eqz p1, :cond_5d

    const-string v0, "android.intent.extra.TEXT"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getCharSequence(Ljava/lang/String;)Ljava/lang/CharSequence;

    move-result-object p1

    if-eqz p1, :cond_5d

    const/16 v0, 0x20

    const-string v2, "(/nico.ms/|watch/)([\\w]+)"

    invoke-static {v2, v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;I)Ljava/util/regex/Pattern;

    move-result-object v0

    invoke-interface {p1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object p1

    invoke-virtual {p1}, Ljava/util/regex/Matcher;->find()Z

    move-result v0

    if-eqz v0, :cond_3e

    invoke-virtual {p1, v1}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/sauzask/nicoid/intent/NicoidTextShareIntentActivity;->b:Ljava/lang/String;

    :cond_3e
    iget-object p1, p0, Lcom/sauzask/nicoid/intent/NicoidTextShareIntentActivity;->b:Ljava/lang/String;

    if-nez p1, :cond_4c

    const/4 p1, 0x0

    const-string v0, "\u30c6\u30ad\u30b9\u30c8\u306b\u52d5\u753b\u306eURL\u304c\u542b\u307e\u308c\u3066\u3044\u307e\u305b\u3093"

    .line 1
    invoke-static {v0, p1, p0}, Le/e/a/v0;->a(Ljava/lang/String;ILandroid/content/Context;)V

    .line 2
    invoke-virtual {p0}, Landroid/app/Activity;->finish()V

    return-void

    :cond_4c
    const-string p1, "https://www.nicovideo.jp/watch/"

    invoke-static {p1}, Le/b/a/a/a;->a(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    iget-object v0, p0, Lcom/sauzask/nicoid/intent/NicoidTextShareIntentActivity;->b:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/sauzask/nicoid/intent/NicoidTextShareIntentActivity;->a:Ljava/lang/String;

    :cond_5d
    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p1

    const-string v0, "intent_type"

    const-string v2, "1"

    invoke-interface {p1, v0, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result p1

    const-string v0, "intentselect"

    const-string v2, "com.sauzask.nicoid.hls"

    const-string v3, "android.intent.action.VIEW"

    const/4 v4, 0x1

    if-eqz p1, :cond_c7

    if-eq p1, v4, :cond_b9

    if-eq p1, v1, :cond_a5

    const/4 v0, 0x3

    const-string v1, "url"

    if-eq p1, v0, :cond_95

    const/4 v0, 0x4

    if-eq p1, v0, :cond_83

    goto :goto_dd

    :cond_83
    new-instance p1, Landroid/content/Intent;

    const-class v0, Lcom/sauzask/nicoid/NicoidPopupViewService;

    invoke-direct {p1, p0, v0}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    iget-object v0, p0, Lcom/sauzask/nicoid/intent/NicoidTextShareIntentActivity;->b:Ljava/lang/String;

    invoke-virtual {p1, v1, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string v0, "isBackgroundPlay"

    invoke-virtual {p1, v0, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    goto :goto_a1

    :cond_95
    new-instance p1, Landroid/content/Intent;

    const-class v0, Lcom/sauzask/nicoid/NicoidPopupViewService;

    invoke-direct {p1, p0, v0}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    iget-object v0, p0, Lcom/sauzask/nicoid/intent/NicoidTextShareIntentActivity;->b:Ljava/lang/String;

    invoke-virtual {p1, v1, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    :goto_a1
    invoke-static {p0, p1}, Le/e/a/v0;->a(Landroid/content/Context;Landroid/content/Intent;)V

    goto :goto_dd

    :cond_a5
    iget-object p1, p0, Lcom/sauzask/nicoid/intent/NicoidTextShareIntentActivity;->a:Ljava/lang/String;

    invoke-static {p1}, Le/e/a/CachePlayback;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p1

    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0, v3, p1}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    const-string p1, "com.sauzask.nicoid.NicoidVideoInfoActivity"

    invoke-virtual {v0, v2, p1}, Landroid/content/Intent;->setClassName(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    invoke-virtual {p0, v0}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V

    goto :goto_dd

    :cond_b9
    iget-object p1, p0, Lcom/sauzask/nicoid/intent/NicoidTextShareIntentActivity;->a:Ljava/lang/String;

    invoke-static {p1}, Le/e/a/CachePlayback;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p1

    new-instance v1, Landroid/content/Intent;

    invoke-direct {v1, v3, p1}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    const-string p1, "com.sauzask.nicoid.NicoidVideoActivity"

    goto :goto_d4

    :cond_c7
    iget-object p1, p0, Lcom/sauzask/nicoid/intent/NicoidTextShareIntentActivity;->a:Ljava/lang/String;

    invoke-static {p1}, Le/e/a/CachePlayback;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p1

    new-instance v1, Landroid/content/Intent;

    invoke-direct {v1, v3, p1}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    const-string p1, "com.sauzask.nicoid.intent.NicoidIntentSelect"

    :goto_d4
    invoke-virtual {v1, v2, p1}, Landroid/content/Intent;->setClassName(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    invoke-virtual {v1, v0, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    invoke-virtual {p0, v1}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V

    :goto_dd
    invoke-virtual {p0}, Landroid/app/Activity;->finish()V

    return-void
.end method

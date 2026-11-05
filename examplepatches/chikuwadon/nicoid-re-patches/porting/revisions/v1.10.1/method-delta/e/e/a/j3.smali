.class public Le/e/a/j3;
.super Landroid/text/method/ScrollingMovementMethod;
.source ""


# instance fields
.field public a:Landroid/app/Activity;

.field public b:Le/e/a/l3/g;

.field public c:I

.field public d:Landroid/text/style/BackgroundColorSpan;

.field public e:Le/e/a/j3;

.field public f:Ljava/lang/Object;


# virtual methods
.method public a(Ljava/lang/String;)V
    .registers 13

    const-string v0, "^https?://(www|sp).nicovideo.jp/watch/"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/regex/Matcher;->find()Z

    move-result v0

    const/4 v1, 0x2

    const/4 v2, 0x1

    const-string v3, "com.sauzask.nicoid.hls"

    const-string v4, "android.intent.action.VIEW"

    if-eqz v0, :cond_34

    invoke-static {p1}, Le/e/a/CachePlayback;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p1

    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0, v4, p1}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    iget p1, p0, Le/e/a/j3;->c:I

    if-eqz p1, :cond_30

    if-eq p1, v2, :cond_2c

    if-eq p1, v1, :cond_30

    const/4 v1, 0x3

    if-eq p1, v1, :cond_30

    goto/16 :goto_150

    :cond_2c
    const-string p1, "com.sauzask.nicoid.NicoidVideoInfoActivity"

    goto/16 :goto_134

    :cond_30
    const-string p1, "com.sauzask.nicoid.NicoidVideoActivity"

    goto/16 :goto_134

    :cond_34
    const-string v0, "^https?://(www|sp).nicovideo.jp/mylist/"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/regex/Matcher;->find()Z

    move-result v0

    const-string v5, "com.sauzask.nicoid.NicoidVideoListActivity"

    const/4 v6, 0x0

    const v7, 0x7f0f01f0

    const v8, 0x7f0f01f1

    const-string v9, ""

    const-string v10, "^http://(www|sp).nicovideo.jp/"

    if-eqz v0, :cond_88

    iget-object v0, p0, Le/e/a/j3;->b:Le/e/a/l3/g;

    if-eqz v0, :cond_7e

    new-instance v0, Landroid/app/AlertDialog$Builder;

    iget-object v3, p0, Le/e/a/j3;->a:Landroid/app/Activity;

    invoke-direct {v0, v3}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    invoke-virtual {p1, v10, v9}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    iget-object v3, p0, Le/e/a/j3;->a:Landroid/app/Activity;

    invoke-virtual {v3, v8}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v3

    new-instance v4, Le/e/a/j3$a;

    invoke-direct {v4, p0, p1}, Le/e/a/j3$a;-><init>(Le/e/a/j3;Ljava/lang/String;)V

    invoke-virtual {v0, v3, v4}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    iget-object v3, p0, Le/e/a/j3;->a:Landroid/app/Activity;

    invoke-virtual {v3, v7}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v3

    new-instance v4, Le/e/a/j3$b;

    invoke-direct {v4, p0, p1}, Le/e/a/j3$b;-><init>(Le/e/a/j3;Ljava/lang/String;)V

    goto/16 :goto_10c

    :cond_7e
    invoke-static {p1}, Le/e/a/CachePlayback;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p1

    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0, v4, p1}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    goto :goto_cd

    :cond_88
    const-string v0, "^https?://(www|sp).nicovideo.jp/user/[0-9]+/video"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/regex/Matcher;->find()Z

    move-result v0

    if-eqz v0, :cond_d1

    iget-object v0, p0, Le/e/a/j3;->b:Le/e/a/l3/g;

    if-eqz v0, :cond_c4

    new-instance v0, Landroid/app/AlertDialog$Builder;

    iget-object v3, p0, Le/e/a/j3;->a:Landroid/app/Activity;

    invoke-direct {v0, v3}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    invoke-virtual {p1, v10, v9}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    iget-object v3, p0, Le/e/a/j3;->a:Landroid/app/Activity;

    invoke-virtual {v3, v8}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v3

    new-instance v4, Le/e/a/j3$c;

    invoke-direct {v4, p0, p1}, Le/e/a/j3$c;-><init>(Le/e/a/j3;Ljava/lang/String;)V

    invoke-virtual {v0, v3, v4}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    iget-object v3, p0, Le/e/a/j3;->a:Landroid/app/Activity;

    invoke-virtual {v3, v7}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v3

    new-instance v4, Le/e/a/j3$d;

    invoke-direct {v4, p0, p1}, Le/e/a/j3$d;-><init>(Le/e/a/j3;Ljava/lang/String;)V

    goto :goto_10c

    :cond_c4
    invoke-static {p1}, Le/e/a/CachePlayback;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p1

    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0, v4, p1}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    :goto_cd
    invoke-virtual {v0, v3, v5}, Landroid/content/Intent;->setClassName(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    goto :goto_137

    :cond_d1
    const-string v0, "^https?://(www|sp).nicovideo.jp/user/"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/regex/Matcher;->find()Z

    move-result v0

    if-eqz v0, :cond_13d

    iget-object v0, p0, Le/e/a/j3;->b:Le/e/a/l3/g;

    if-eqz v0, :cond_121

    new-instance v0, Landroid/app/AlertDialog$Builder;

    iget-object v3, p0, Le/e/a/j3;->a:Landroid/app/Activity;

    invoke-direct {v0, v3}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    invoke-virtual {p1, v10, v9}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    iget-object v3, p0, Le/e/a/j3;->a:Landroid/app/Activity;

    invoke-virtual {v3, v8}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v3

    new-instance v4, Le/e/a/j3$e;

    invoke-direct {v4, p0, p1}, Le/e/a/j3$e;-><init>(Le/e/a/j3;Ljava/lang/String;)V

    invoke-virtual {v0, v3, v4}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    iget-object v3, p0, Le/e/a/j3;->a:Landroid/app/Activity;

    invoke-virtual {v3, v7}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v3

    new-instance v4, Le/e/a/j3$f;

    invoke-direct {v4, p0, p1}, Le/e/a/j3$f;-><init>(Le/e/a/j3;Ljava/lang/String;)V

    :goto_10c
    invoke-virtual {v0, v3, v4}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object p1

    invoke-virtual {p1, v2}, Landroid/app/AlertDialog;->setCanceledOnTouchOutside(Z)V

    invoke-virtual {p1}, Landroid/app/AlertDialog;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0, v6, v1}, Landroid/view/Window;->setFlags(II)V

    invoke-static {p1}, Le/e/a/PlaybackSession;->showDialog(Landroid/app/AlertDialog;)V

    goto :goto_150

    :cond_121
    const-string v0, "http"

    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_150

    invoke-static {p1}, Le/e/a/CachePlayback;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p1

    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0, v4, p1}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    const-string p1, "com.sauzask.nicoid.NicoidUserVideoListActivity"

    :goto_134
    invoke-virtual {v0, v3, p1}, Landroid/content/Intent;->setClassName(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    :goto_137
    iget-object p1, p0, Le/e/a/j3;->a:Landroid/app/Activity;

    invoke-virtual {p1, v0}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V

    goto :goto_150

    :cond_13d
    :try_start_13d
    invoke-static {p1}, Le/e/a/CachePlayback;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p1

    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0, v4, p1}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    iget-object p1, p0, Le/e/a/j3;->a:Landroid/app/Activity;

    invoke-virtual {p1, v0}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V
    :try_end_14b
    .catch Landroid/content/ActivityNotFoundException; {:try_start_13d .. :try_end_14b} :catch_14c

    goto :goto_150

    :catch_14c
    move-exception p1

    invoke-virtual {p1}, Landroid/content/ActivityNotFoundException;->printStackTrace()V

    :cond_150
    :goto_150
    return-void
.end method

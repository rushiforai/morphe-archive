.class public Le/e/a/m0$b$a;
.super Ljava/lang/Object;
.source ""

# interfaces
.implements Ld/b/q/z$b;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Le/e/a/m0$b;->onClick(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Le/e/a/m0$b;


# virtual methods
.method public onMenuItemClick(Landroid/view/MenuItem;)Z
    .registers 7

    invoke-interface {p1}, Landroid/view/MenuItem;->getOrder()I

    move-result v0

    const-string v1, "com.sauzask.nicoid.hls"

    const-string v2, "android.intent.action.VIEW"

    const/4 v3, 0x1

    if-eqz v0, :cond_64

    if-eq v0, v3, :cond_55

    const/4 v1, 0x2

    const/4 v2, 0x3

    if-eq v0, v1, :cond_21

    if-eq v0, v2, :cond_21

    const/4 p1, 0x5

    if-eq v0, p1, :cond_17

    goto :goto_89

    :cond_17
    iget-object p1, p0, Le/e/a/m0$b$a;->a:Le/e/a/m0$b;

    iget-object v0, p1, Le/e/a/m0$b;->d:Le/e/a/m0;

    iget-object p1, p1, Le/e/a/m0$b;->c:Ljava/lang/String;

    invoke-virtual {v0, p1}, Le/e/a/m0;->a(Ljava/lang/String;)V

    goto :goto_89

    :cond_21
    new-instance v0, Landroid/content/Intent;

    iget-object v1, p0, Le/e/a/m0$b$a;->a:Le/e/a/m0$b;

    iget-object v1, v1, Le/e/a/m0$b;->d:Le/e/a/m0;

    .line 1
    iget-object v1, v1, Le/e/a/m0;->d:Landroid/app/Activity;

    .line 2
    const-class v4, Lcom/sauzask/nicoid/NicoidPopupViewService;

    invoke-direct {v0, v1, v4}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    iget-object v1, p0, Le/e/a/m0$b$a;->a:Le/e/a/m0$b;

    iget-object v1, v1, Le/e/a/m0$b;->c:Ljava/lang/String;

    const-string v4, "url"

    invoke-virtual {v0, v4, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    invoke-interface {p1}, Landroid/view/MenuItem;->getOrder()I

    move-result p1

    if-ne p1, v2, :cond_4b

    const-string p1, "isBackgroundPlay"

    invoke-virtual {v0, p1, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    iget-object p1, p0, Le/e/a/m0$b$a;->a:Le/e/a/m0$b;

    iget-object p1, p1, Le/e/a/m0$b;->b:Landroid/text/Spanned;

    const-string v1, "tickerText"

    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/CharSequence;)Landroid/content/Intent;

    :cond_4b
    iget-object p1, p0, Le/e/a/m0$b$a;->a:Le/e/a/m0$b;

    iget-object p1, p1, Le/e/a/m0$b;->d:Le/e/a/m0;

    .line 3
    iget-object p1, p1, Le/e/a/m0;->d:Landroid/app/Activity;

    .line 4
    invoke-static {p1, v0}, Le/e/a/v0;->a(Landroid/content/Context;Landroid/content/Intent;)V

    goto :goto_89

    :cond_55
    iget-object p1, p0, Le/e/a/m0$b$a;->a:Le/e/a/m0$b;

    iget-object p1, p1, Le/e/a/m0$b;->a:Ljava/lang/String;

    invoke-static {p1}, Le/e/a/CachePlayback;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p1

    const-string v0, "com.sauzask.nicoid.NicoidVideoInfoActivity"

    invoke-static {v2, p1, v1, v0}, Le/b/a/a/a;->a(Ljava/lang/String;Landroid/net/Uri;Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object p1

    goto :goto_80

    :cond_64
    iget-object p1, p0, Le/e/a/m0$b$a;->a:Le/e/a/m0$b;

    iget-object p1, p1, Le/e/a/m0$b;->a:Ljava/lang/String;

    invoke-static {p1}, Le/e/a/CachePlayback;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p1

    const-string v0, "com.sauzask.nicoid.NicoidVideoActivity"

    invoke-static {v2, p1, v1, v0}, Le/b/a/a/a;->a(Ljava/lang/String;Landroid/net/Uri;Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object p1

    const-string v0, "intentselect"

    invoke-virtual {p1, v0, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    iget-object v0, p0, Le/e/a/m0$b$a;->a:Le/e/a/m0$b;

    iget-object v0, v0, Le/e/a/m0$b;->b:Landroid/text/Spanned;

    const-string v1, "title"

    invoke-virtual {p1, v1, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/CharSequence;)Landroid/content/Intent;

    :goto_80
    iget-object v0, p0, Le/e/a/m0$b$a;->a:Le/e/a/m0$b;

    iget-object v0, v0, Le/e/a/m0$b;->d:Le/e/a/m0;

    .line 5
    iget-object v0, v0, Le/e/a/m0;->d:Landroid/app/Activity;

    .line 6
    invoke-virtual {v0, p1}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V

    :goto_89
    return v3
.end method

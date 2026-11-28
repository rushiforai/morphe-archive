.class public Le/e/a/k2;
.super Ljava/lang/Object;
.source ""

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ljava/util/ArrayList;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Ljava/lang/String;

.field public final synthetic d:Le/e/a/i2;


# virtual methods
.method public run()V
    .registers 9

    const-string v0, "UTF-8"

    :try_start_0
    iget-object v1, p0, Le/e/a/k2;->d:Le/e/a/i2;

    iget-object v2, p0, Le/e/a/k2;->a:Ljava/util/ArrayList;

    invoke-virtual {v1, v2}, Le/e/a/i2;->a(Ljava/util/ArrayList;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1, v0}, Ljava/net/URLEncoder;->encode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v1

    invoke-virtual {v1}, Ljava/io/UnsupportedEncodingException;->printStackTrace()V

    const-string v1, ""

    :goto_0
    iget-object v2, p0, Le/e/a/k2;->d:Le/e/a/i2;

    .line 1
    iget-object v2, v2, Le/e/a/i2;->b:Landroid/app/Activity;

    const-string v3, "https://nvapi.nicovideo.jp/v1/users/me/move-mylist-items?from="

    .line 2
    invoke-static {v3}, Le/b/a/a/a;->a(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Le/e/a/k2;->b:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, "&to="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v5, p0, Le/e/a/k2;->c:Ljava/lang/String;

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v5, "&itemIds="

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    const/4 v6, 0x0

    invoke-static {v2, v3, v6}, Lnicoid/network238/MutationStatus280;->post(Landroid/content/Context;Ljava/lang/String;Ljava/util/List;)Ljava/lang/Integer;

    move-result-object v2

    const/4 v3, 0x0

    if-nez v2, :cond_0

    iget-object v0, p0, Le/e/a/k2;->d:Le/e/a/i2;

    invoke-static {v0}, Le/e/a/i2;->a(Le/e/a/i2;)V

    :goto_1
    iget-object v0, p0, Le/e/a/k2;->d:Le/e/a/i2;

    .line 3
    iput-boolean v3, v0, Le/e/a/i2;->e:Z

    return-void

    .line 4
    :cond_0
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v0

    iget-object v1, p0, Le/e/a/k2;->d:Le/e/a/i2;

    .line 5
    iget-object v1, v1, Le/e/a/i2;->a:Landroid/os/Handler;

    .line 6
    new-instance v2, Le/e/a/k2$a;

    invoke-direct {v2, p0, v0}, Le/e/a/k2$a;-><init>(Le/e/a/k2;I)V

    invoke-virtual {v1, v2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    goto :goto_1
.end method

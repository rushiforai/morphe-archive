.class public Le/e/a/b1$b;
.super Ljava/lang/Object;
.source ""

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Le/e/a/b1;->a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ljava/lang/String;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Ljava/lang/String;

.field public final synthetic d:Ljava/lang/String;

.field public final synthetic e:Le/e/a/b1;


# virtual methods
.method public run()V
    .registers 9

    const-string v0, "UTF-8"

    :try_start_0
    iget-object v1, p0, Le/e/a/b1$b;->a:Ljava/lang/String;

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
    const-string v2, "https://nvapi.nicovideo.jp/v1/users/me/mylists/"

    invoke-static {v2}, Le/b/a/a/a;->a(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Le/e/a/b1$b;->b:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, "/items?itemId="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v4, p0, Le/e/a/b1$b;->c:Ljava/lang/String;

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, "&description="

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    iget-object v5, p0, Le/e/a/b1$b;->b:Ljava/lang/String;

    const-string v6, "deflist"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_0

    const-string v2, "https://nvapi.nicovideo.jp/v1/users/me/deflist/items/"

    invoke-static {v2}, Le/b/a/a/a;->a(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v5, p0, Le/e/a/b1$b;->c:Ljava/lang/String;

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v5, "?description="

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    :cond_0
    iget-object v5, p0, Le/e/a/b1$b;->e:Le/e/a/b1;

    .line 1
    iget-object v5, v5, Le/e/a/b1;->b:Landroid/app/Activity;

    const/4 v7, 0x0

    .line 2
    invoke-static {v5, v2, v7}, Lnicoid/network238/MutationStatus280;->post(Landroid/content/Context;Ljava/lang/String;Ljava/util/List;)Ljava/lang/Integer;

    move-result-object v2

    if-nez v2, :cond_1

    iget-object v0, p0, Le/e/a/b1$b;->e:Le/e/a/b1;

    .line 3
    iget-object v0, v0, Le/e/a/b1;->a:Landroid/os/Handler;

    .line 4
    new-instance v1, Le/e/a/b1$b$a;

    invoke-direct {v1, p0}, Le/e/a/b1$b$a;-><init>(Le/e/a/b1$b;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    iget-object v0, p0, Le/e/a/b1$b;->e:Le/e/a/b1;

    const/4 v1, 0x0

    iput-boolean v1, v0, Le/e/a/b1;->f:Z

    return-void

    :cond_1
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v0

    iget-object v1, p0, Le/e/a/b1$b;->e:Le/e/a/b1;

    .line 5
    iget-object v1, v1, Le/e/a/b1;->a:Landroid/os/Handler;

    .line 6
    new-instance v2, Le/e/a/b1$b$b;

    invoke-direct {v2, p0, v0}, Le/e/a/b1$b$b;-><init>(Le/e/a/b1$b;I)V

    invoke-virtual {v1, v2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

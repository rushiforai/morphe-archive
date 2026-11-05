.class public Le/e/a/i2$a;
.super Ljava/lang/Object;
.source ""

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Le/e/a/i2;->a(Ljava/lang/String;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ljava/lang/String;

.field public final synthetic b:I

.field public final synthetic c:Le/e/a/i2;


# virtual methods
.method public run()V
    .registers 5

    iget-object v0, p0, Le/e/a/i2$a;->c:Le/e/a/i2;

    .line 1
    iget-object v0, v0, Le/e/a/i2;->b:Landroid/app/Activity;

    const-string v1, "https://nvapi.nicovideo.jp/v2/users/me/watch/history?target="

    .line 2
    invoke-static {v1}, Le/b/a/a/a;->a(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Le/e/a/i2$a;->a:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Le/e/a/v0;->b(Landroid/content/Context;Ljava/lang/String;Lorg/apache/http/client/CookieStore;)Lorg/apache/http/HttpResponse;

    move-result-object v0

    const/4 v1, 0x0

    if-nez v0, :cond_25

    iget-object v0, p0, Le/e/a/i2$a;->c:Le/e/a/i2;

    invoke-static {v0}, Le/e/a/i2;->a(Le/e/a/i2;)V

    :goto_20
    iget-object v0, p0, Le/e/a/i2$a;->c:Le/e/a/i2;

    .line 3
    iput-boolean v1, v0, Le/e/a/i2;->e:Z

    return-void

    .line 4
    :cond_25
    invoke-interface {v0}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object v0

    invoke-interface {v0}, Lorg/apache/http/StatusLine;->getStatusCode()I

    move-result v0

    iget-object v2, p0, Le/e/a/i2$a;->c:Le/e/a/i2;

    .line 5
    iget-object v2, v2, Le/e/a/i2;->a:Landroid/os/Handler;

    .line 6
    new-instance v3, Le/e/a/i2$a$a;

    invoke-direct {v3, p0, v0}, Le/e/a/i2$a$a;-><init>(Le/e/a/i2$a;I)V

    invoke-virtual {v2, v3}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    goto :goto_20
.end method

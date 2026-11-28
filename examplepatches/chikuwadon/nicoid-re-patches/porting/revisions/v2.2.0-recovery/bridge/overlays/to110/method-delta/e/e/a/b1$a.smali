.class public Le/e/a/b1$a;
.super Ljava/lang/Object;
.source ""

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Le/e/a/b1;->a(Ljava/lang/String;ZI)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ljava/lang/String;

.field public final synthetic b:Z

.field public final synthetic c:I

.field public final synthetic d:Le/e/a/b1;


# virtual methods
.method public run()V
    .registers 6

    const/4 v0, 0x0

    :try_start_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "https://user-follow-api.nicovideo.jp/v1/user/followees/niconico-users/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Le/e/a/b1$a;->a:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, ".json"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    iget-boolean v2, p0, Le/e/a/b1$a;->b:Z

    if-eqz v2, :cond_0

    iget-object v2, p0, Le/e/a/b1$a;->d:Le/e/a/b1;

    .line 1
    iget-object v2, v2, Le/e/a/b1;->b:Landroid/app/Activity;

    .line 2
    iget-object v3, p0, Le/e/a/b1$a;->d:Le/e/a/b1;

    .line 3
    iget-object v3, v3, Le/e/a/b1;->d:Lorg/apache/http/client/CookieStore;

    .line 4
    invoke-static {v2, v1, v3}, Lnicoid/network238/MutationStatus280;->deleteExplicit(Landroid/content/Context;Ljava/lang/String;Lorg/apache/http/client/CookieStore;)Ljava/lang/Integer;

    move-result-object v1

    goto :goto_0

    :cond_0
    iget-object v2, p0, Le/e/a/b1$a;->d:Le/e/a/b1;

    .line 5
    iget-object v2, v2, Le/e/a/b1;->b:Landroid/app/Activity;

    const/4 v3, 0x0

    .line 6
    iget-object v4, p0, Le/e/a/b1$a;->d:Le/e/a/b1;

    .line 7
    iget-object v4, v4, Le/e/a/b1;->d:Lorg/apache/http/client/CookieStore;

    .line 8
    invoke-static {v2, v1, v3, v4}, Lnicoid/network238/MutationStatus280;->postExplicit(Landroid/content/Context;Ljava/lang/String;Ljava/util/List;Lorg/apache/http/client/CookieStore;)Ljava/lang/Integer;

    move-result-object v1

    :goto_0
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v3, ""

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    const/16 v2, 0xc8

    if-ne v1, v2, :cond_1

    iget-object v1, p0, Le/e/a/b1$a;->d:Le/e/a/b1;

    .line 9
    iget-object v1, v1, Le/e/a/b1;->a:Landroid/os/Handler;

    .line 10
    new-instance v2, Le/e/a/b1$a$a;

    invoke-direct {v2, p0}, Le/e/a/b1$a$a;-><init>(Le/e/a/b1$a;)V

    :goto_1
    invoke-virtual {v1, v2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    goto :goto_2

    :cond_1
    iget-object v1, p0, Le/e/a/b1$a;->d:Le/e/a/b1;

    .line 11
    iget-object v1, v1, Le/e/a/b1;->a:Landroid/os/Handler;

    .line 12
    new-instance v2, Le/e/a/b1$a$b;

    invoke-direct {v2, p0}, Le/e/a/b1$a$b;-><init>(Le/e/a/b1$a;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_1

    :goto_2
    iget-object v1, p0, Le/e/a/b1$a;->d:Le/e/a/b1;

    iput-boolean v0, v1, Le/e/a/b1;->f:Z

    .line 13
    iget-object v0, v1, Le/e/a/b1;->a:Landroid/os/Handler;

    .line 14
    new-instance v1, Le/e/a/b1$a$d;

    invoke-direct {v1, p0}, Le/e/a/b1$a$d;-><init>(Le/e/a/b1$a;)V

    goto :goto_3

    :catchall_0
    move-exception v1

    goto :goto_4

    :catch_0
    move-exception v1

    :try_start_1
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    iget-object v1, p0, Le/e/a/b1$a;->d:Le/e/a/b1;

    .line 15
    iget-object v1, v1, Le/e/a/b1;->a:Landroid/os/Handler;

    .line 16
    new-instance v2, Le/e/a/b1$a$c;

    invoke-direct {v2, p0}, Le/e/a/b1$a$c;-><init>(Le/e/a/b1$a;)V

    invoke-virtual {v1, v2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    iget-object v1, p0, Le/e/a/b1$a;->d:Le/e/a/b1;

    iput-boolean v0, v1, Le/e/a/b1;->f:Z

    .line 17
    iget-object v0, v1, Le/e/a/b1;->a:Landroid/os/Handler;

    .line 18
    new-instance v1, Le/e/a/b1$a$d;

    invoke-direct {v1, p0}, Le/e/a/b1$a$d;-><init>(Le/e/a/b1$a;)V

    :goto_3
    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void

    :goto_4
    iget-object v2, p0, Le/e/a/b1$a;->d:Le/e/a/b1;

    iput-boolean v0, v2, Le/e/a/b1;->f:Z

    .line 19
    iget-object v0, v2, Le/e/a/b1;->a:Landroid/os/Handler;

    .line 20
    new-instance v2, Le/e/a/b1$a$d;

    invoke-direct {v2, p0}, Le/e/a/b1$a$d;-><init>(Le/e/a/b1$a;)V

    invoke-virtual {v0, v2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    goto :goto_6

    :goto_5
    throw v1

    :goto_6
    goto :goto_5
.end method

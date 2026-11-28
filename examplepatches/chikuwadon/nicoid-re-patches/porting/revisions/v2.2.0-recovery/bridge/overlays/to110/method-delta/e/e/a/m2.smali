.class public Le/e/a/m2;
.super Ljava/lang/Object;
.source ""

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ljava/util/List;

.field public final synthetic b:Le/e/a/i2;


# virtual methods
.method public run()V
    .registers 5

    iget-object v0, p0, Le/e/a/m2;->b:Le/e/a/i2;

    .line 1
    iget-object v0, v0, Le/e/a/i2;->b:Landroid/app/Activity;

    .line 2
    iget-object v1, p0, Le/e/a/m2;->a:Ljava/util/List;

    const/4 v2, 0x0

    const-string v3, "https://nvapi.nicovideo.jp/v1/users/me/mylists"

    invoke-static {v0, v3, v1}, Lnicoid/network238/MutationStatus280;->post(Landroid/content/Context;Ljava/lang/String;Ljava/util/List;)Ljava/lang/Integer;

    move-result-object v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    iget-object v0, p0, Le/e/a/m2;->b:Le/e/a/i2;

    invoke-static {v0}, Le/e/a/i2;->a(Le/e/a/i2;)V

    iget-object v0, p0, Le/e/a/m2;->b:Le/e/a/i2;

    .line 3
    iput-boolean v1, v0, Le/e/a/i2;->e:Z

    return-void

    .line 4
    :cond_0
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    iget-object v2, p0, Le/e/a/m2;->b:Le/e/a/i2;

    .line 5
    iget-object v2, v2, Le/e/a/i2;->a:Landroid/os/Handler;

    .line 6
    new-instance v3, Le/e/a/m2$a;

    invoke-direct {v3, p0, v0}, Le/e/a/m2$a;-><init>(Le/e/a/m2;I)V

    invoke-virtual {v2, v3}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    iget-object v0, p0, Le/e/a/m2;->b:Le/e/a/i2;

    .line 7
    iput-boolean v1, v0, Le/e/a/i2;->e:Z

    return-void
.end method

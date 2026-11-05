.class public Le/e/a/m2$a;
.super Ljava/lang/Object;
.source ""

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Le/e/a/m2;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:I

.field public final synthetic b:Le/e/a/m2;


# virtual methods
.method public run()V
    .registers 4

    iget v0, p0, Le/e/a/m2$a;->a:I

    const/16 v1, 0xc8

    const/4 v2, 0x0

    if-eq v0, v1, :cond_20

    const/16 v1, 0xc9

    if-eq v0, v1, :cond_20

    iget-object v0, p0, Le/e/a/m2$a;->b:Le/e/a/m2;

    iget-object v0, v0, Le/e/a/m2;->b:Le/e/a/i2;

    .line 1
    iget-object v0, v0, Le/e/a/i2;->b:Landroid/app/Activity;

    const-string v1, "\u5931\u6557\u3057\u307e\u3057\u305f"

    .line 2
    invoke-static {v1, v2, v0}, Le/e/a/v0;->a(Ljava/lang/String;ILandroid/content/Context;)V

    .line 3
    iget-object v0, p0, Le/e/a/m2$a;->b:Le/e/a/m2;

    iget-object v0, v0, Le/e/a/m2;->b:Le/e/a/i2;

    .line 4
    iget-object v0, v0, Le/e/a/i2;->d:Le/e/a/l3/k;

    .line 5
    invoke-interface {v0}, Le/e/a/l3/k;->c()V

    goto :goto_56

    :cond_20
    iget-object v0, p0, Le/e/a/m2$a;->b:Le/e/a/m2;

    iget-object v0, v0, Le/e/a/m2;->b:Le/e/a/i2;

    .line 6
    iget-object v0, v0, Le/e/a/i2;->b:Landroid/app/Activity;

    const v1, 0x7f0f0228

    .line 7
    invoke-virtual {v0, v1}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Le/e/a/m2$a;->b:Le/e/a/m2;

    iget-object v1, v1, Le/e/a/m2;->b:Le/e/a/i2;

    .line 8
    iget-object v1, v1, Le/e/a/i2;->b:Landroid/app/Activity;

    .line 9
    invoke-static {v0, v2, v1}, Le/e/a/v0;->a(Ljava/lang/String;ILandroid/content/Context;)V

    .line 10
    iget-object v0, p0, Le/e/a/m2$a;->b:Le/e/a/m2;

    iget-object v0, v0, Le/e/a/m2;->b:Le/e/a/i2;

    .line 11
    iget-object v0, v0, Le/e/a/i2;->b:Landroid/app/Activity;

    .line 12
    invoke-virtual {v0}, Landroid/app/Activity;->finish()V

    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.VIEW"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string v1, "com.sauzask.nicoid.hls"

    const-string v2, "com.sauzask.nicoid.NicoidMylistGroupActivity"

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->setClassName(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    iget-object v1, p0, Le/e/a/m2$a;->b:Le/e/a/m2;

    iget-object v1, v1, Le/e/a/m2;->b:Le/e/a/i2;

    .line 13
    iget-object v1, v1, Le/e/a/i2;->b:Landroid/app/Activity;

    .line 14
    invoke-virtual {v1, v0}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V

    :goto_56
    return-void
.end method

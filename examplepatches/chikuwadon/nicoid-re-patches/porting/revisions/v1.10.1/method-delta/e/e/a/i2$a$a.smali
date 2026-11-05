.class public Le/e/a/i2$a$a;
.super Ljava/lang/Object;
.source ""

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Le/e/a/i2$a;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:I

.field public final synthetic b:Le/e/a/i2$a;


# virtual methods
.method public run()V
    .registers 4

    iget v0, p0, Le/e/a/i2$a$a;->a:I

    const/16 v1, 0xc8

    if-eq v0, v1, :cond_2a

    const/16 v1, 0xc9

    if-eq v0, v1, :cond_2a

    const/16 v1, 0xcc

    if-eq v0, v1, :cond_2a

    iget-object v0, p0, Le/e/a/i2$a$a;->b:Le/e/a/i2$a;

    iget-object v0, v0, Le/e/a/i2$a;->c:Le/e/a/i2;

    .line 1
    iget-object v0, v0, Le/e/a/i2;->b:Landroid/app/Activity;

    const v1, 0x7f0f021b

    .line 2
    invoke-virtual {v0, v1}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-static/range {v0 .. v0}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Le/e/a/i2$a$a;->b:Le/e/a/i2$a;

    iget-object v1, v1, Le/e/a/i2$a;->c:Le/e/a/i2;

    .line 3
    iget-object v1, v1, Le/e/a/i2;->b:Landroid/app/Activity;

    const/4 v2, 0x0

    .line 4
    invoke-static {v0, v2, v1}, Le/e/a/v0;->a(Ljava/lang/String;ILandroid/content/Context;)V

    goto :goto_35

    .line 5
    :cond_2a
    iget-object v0, p0, Le/e/a/i2$a$a;->b:Le/e/a/i2$a;

    iget-object v1, v0, Le/e/a/i2$a;->c:Le/e/a/i2;

    .line 6
    iget-object v1, v1, Le/e/a/i2;->c:Le/e/a/b0;

    .line 7
    iget v0, v0, Le/e/a/i2$a;->b:I

    invoke-virtual {v1, v0}, Le/e/a/b0;->a(I)V

    :goto_35
    iget-object v0, p0, Le/e/a/i2$a$a;->b:Le/e/a/i2$a;

    iget-object v0, v0, Le/e/a/i2$a;->c:Le/e/a/i2;

    .line 8
    iget-object v0, v0, Le/e/a/i2;->c:Le/e/a/b0;

    .line 9
    invoke-virtual {v0}, Le/e/a/b0;->notifyDataSetChanged()V

    iget-object v0, p0, Le/e/a/i2$a$a;->b:Le/e/a/i2$a;

    iget-object v0, v0, Le/e/a/i2$a;->c:Le/e/a/i2;

    .line 10
    iget-object v0, v0, Le/e/a/i2;->d:Le/e/a/l3/k;

    .line 11
    invoke-interface {v0}, Le/e/a/l3/k;->c()V

    return-void
.end method

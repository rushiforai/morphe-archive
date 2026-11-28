.class public Le/e/a/e0$b;
.super Ljava/lang/Object;
.source ""

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Le/e/a/e0;->a()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Le/e/a/e0;


# virtual methods
.method public run()V
    .registers 6

    iget-object v0, p0, Le/e/a/e0$b;->a:Le/e/a/e0;

    iget-object v1, v0, Le/e/a/e0;->m:Lorg/apache/http/client/CookieStore;

    if-nez v1, :cond_1

    iget v1, v0, Le/e/a/e0;->g:I

    const/4 v2, 0x2

    if-eq v1, v2, :cond_0

    .line 1
    iget-object v1, v0, Le/e/a/e0;->p:Landroid/content/Context;

    .line 2
    invoke-static {v1}, Le/e/a/v0;->h(Landroid/content/Context;)Lorg/apache/http/client/CookieStore;

    move-result-object v1

    goto :goto_0

    :cond_0
    new-instance v1, Lnicoid/network238/SessionStore258;

    invoke-direct {v1}, Lnicoid/network238/SessionStore258;-><init>()V

    :goto_0
    iput-object v1, v0, Le/e/a/e0;->m:Lorg/apache/http/client/CookieStore;

    :cond_1
    iget-object v0, p0, Le/e/a/e0$b;->a:Le/e/a/e0;

    iget v0, v0, Le/e/a/e0;->g:I

    const/4 v1, 0x5

    const/4 v2, 0x1

    const/4 v3, 0x0

    if-ne v0, v1, :cond_2

    const/4 v0, 0x1

    goto :goto_1

    :cond_2
    const/4 v0, 0x0

    :goto_1
    iget-object v1, p0, Le/e/a/e0$b;->a:Le/e/a/e0;

    iget v1, v1, Le/e/a/e0;->g:I

    const/16 v4, 0x9

    if-ne v1, v4, :cond_3

    goto :goto_2

    :cond_3
    const/4 v2, 0x0

    :goto_2
    or-int/2addr v0, v2

    if-eqz v0, :cond_4

    iget-object v0, p0, Le/e/a/e0$b;->a:Le/e/a/e0;

    iget v1, v0, Le/e/a/e0;->g:I

    .line 3
    invoke-virtual {v0, v1}, Le/e/a/e0;->b(I)V

    goto :goto_3

    .line 4
    :cond_4
    iget-object v0, p0, Le/e/a/e0$b;->a:Le/e/a/e0;

    iget v1, v0, Le/e/a/e0;->g:I

    .line 5
    invoke-virtual {v0, v1}, Le/e/a/e0;->a(I)V

    :goto_3
    return-void
.end method

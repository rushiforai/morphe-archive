.class public Le/e/a/b0$a$a;
.super Ljava/lang/Object;
.source ""

# interfaces
.implements Ld/b/q/z$b;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Le/e/a/b0$a;->onClick(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Le/e/a/b0$a;


# virtual methods
.method public onMenuItemClick(Landroid/view/MenuItem;)Z
    .registers 6

    invoke-interface {p1}, Landroid/view/MenuItem;->getOrder()I

    move-result v0

    const-string v1, "com.sauzask.nicoid.hls"

    const-string v2, "android.intent.action.VIEW"

    const/4 v3, 0x1

    packed-switch v0, :pswitch_data_be

    goto/16 :goto_bc

    :pswitch_e
    iget-object p1, p0, Le/e/a/b0$a$a;->a:Le/e/a/b0$a;

    iget-object v0, p1, Le/e/a/b0$a;->e:Le/e/a/b0;

    iget-object p1, p1, Le/e/a/b0$a;->d:Ljava/lang/String;

    invoke-virtual {v0, p1}, Le/e/a/b0;->a(Ljava/lang/String;)V

    goto/16 :goto_bc

    :pswitch_19
    iget-object p1, p0, Le/e/a/b0$a$a;->a:Le/e/a/b0$a;

    iget-object v0, p1, Le/e/a/b0$a;->e:Le/e/a/b0;

    iget-object p1, p1, Le/e/a/b0$a;->d:Ljava/lang/String;

    invoke-virtual {v0, p1}, Le/e/a/b0;->b(Ljava/lang/String;)V

    goto/16 :goto_bc

    :pswitch_24
    iget-object p1, p0, Le/e/a/b0$a$a;->a:Le/e/a/b0$a;

    iget-object v0, p1, Le/e/a/b0$a;->e:Le/e/a/b0;

    iget-object p1, p1, Le/e/a/b0$a;->d:Ljava/lang/String;

    .line 1
    iget-object v0, v0, Le/e/a/b0;->l:Le/e/a/b1;

    invoke-virtual {v0, p1}, Le/e/a/b1;->a(Ljava/lang/String;)V

    goto/16 :goto_bc

    .line 2
    :pswitch_31
    new-instance v0, Landroid/content/Intent;

    iget-object v1, p0, Le/e/a/b0$a$a;->a:Le/e/a/b0$a;

    iget-object v1, v1, Le/e/a/b0$a;->e:Le/e/a/b0;

    .line 3
    iget-object v1, v1, Le/e/a/b0;->d:Landroid/app/Activity;

    .line 4
    const-class v2, Lcom/sauzask/nicoid/NicoidPopupViewService;

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    iget-object v1, p0, Le/e/a/b0$a$a;->a:Le/e/a/b0$a;

    iget-object v1, v1, Le/e/a/b0$a;->d:Ljava/lang/String;

    const-string v2, "url"

    invoke-virtual {v0, v2, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    invoke-interface {p1}, Landroid/view/MenuItem;->getOrder()I

    move-result p1

    const/4 v1, 0x3

    if-ne p1, v1, :cond_5c

    const-string p1, "isBackgroundPlay"

    invoke-virtual {v0, p1, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    iget-object p1, p0, Le/e/a/b0$a$a;->a:Le/e/a/b0$a;

    iget-object p1, p1, Le/e/a/b0$a;->b:Ljava/lang/String;

    const-string v1, "tickerText"

    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    :cond_5c
    sget-boolean p1, Lcom/sauzask/nicoid/NicoidVideoListActivity;->I:Z

    if-eqz p1, :cond_6b

    iget-object p1, p0, Le/e/a/b0$a$a;->a:Le/e/a/b0$a;

    iget-object v1, p1, Le/e/a/b0$a;->e:Le/e/a/b0;

    .line 5
    iget-object v1, v1, Le/e/a/b0;->b:Ljava/util/ArrayList;

    .line 6
    iget p1, p1, Le/e/a/b0$a;->c:I

    .line 7
    invoke-static {v0, v1, p1, v3}, Le/e/a/v0;->a(Landroid/content/Intent;Ljava/util/ArrayList;IZ)V

    .line 8
    :cond_6b
    iget-object p1, p0, Le/e/a/b0$a$a;->a:Le/e/a/b0$a;

    iget-object p1, p1, Le/e/a/b0$a;->e:Le/e/a/b0;

    .line 9
    iget-object p1, p1, Le/e/a/b0;->d:Landroid/app/Activity;

    .line 10
    invoke-static {p1, v0}, Le/e/a/v0;->a(Landroid/content/Context;Landroid/content/Intent;)V

    goto :goto_bc

    :pswitch_75
    iget-object p1, p0, Le/e/a/b0$a$a;->a:Le/e/a/b0$a;

    iget-object p1, p1, Le/e/a/b0$a;->a:Ljava/lang/String;

    invoke-static {p1}, Le/e/a/CachePlayback;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p1

    const-string v0, "com.sauzask.nicoid.NicoidVideoInfoActivity"

    invoke-static {v2, p1, v1, v0}, Le/b/a/a/a;->a(Ljava/lang/String;Landroid/net/Uri;Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object p1

    sget-boolean v0, Lcom/sauzask/nicoid/NicoidVideoListActivity;->I:Z

    if-eqz v0, :cond_b3

    goto :goto_a8

    :pswitch_88
    iget-object p1, p0, Le/e/a/b0$a$a;->a:Le/e/a/b0$a;

    iget-object p1, p1, Le/e/a/b0$a;->a:Ljava/lang/String;

    invoke-static {p1}, Le/e/a/CachePlayback;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p1

    const-string v0, "com.sauzask.nicoid.NicoidVideoActivity"

    invoke-static {v2, p1, v1, v0}, Le/b/a/a/a;->a(Ljava/lang/String;Landroid/net/Uri;Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object p1

    const-string v0, "intentselect"

    invoke-virtual {p1, v0, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    iget-object v0, p0, Le/e/a/b0$a$a;->a:Le/e/a/b0$a;

    iget-object v0, v0, Le/e/a/b0$a;->b:Ljava/lang/String;

    const-string v1, "title"

    invoke-virtual {p1, v1, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    sget-boolean v0, Lcom/sauzask/nicoid/NicoidVideoListActivity;->I:Z

    if-eqz v0, :cond_b3

    :goto_a8
    iget-object v0, p0, Le/e/a/b0$a$a;->a:Le/e/a/b0$a;

    iget-object v1, v0, Le/e/a/b0$a;->e:Le/e/a/b0;

    .line 11
    iget-object v1, v1, Le/e/a/b0;->b:Ljava/util/ArrayList;

    .line 12
    iget v0, v0, Le/e/a/b0$a;->c:I

    .line 13
    invoke-static {p1, v1, v0, v3}, Le/e/a/v0;->a(Landroid/content/Intent;Ljava/util/ArrayList;IZ)V

    .line 14
    :cond_b3
    iget-object v0, p0, Le/e/a/b0$a$a;->a:Le/e/a/b0$a;

    iget-object v0, v0, Le/e/a/b0$a;->e:Le/e/a/b0;

    .line 15
    iget-object v0, v0, Le/e/a/b0;->d:Landroid/app/Activity;

    .line 16
    invoke-virtual {v0, p1}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V

    :goto_bc
    return v3

    nop

    :pswitch_data_be
    .packed-switch 0x0
        :pswitch_88
        :pswitch_75
        :pswitch_31
        :pswitch_31
        :pswitch_24
        :pswitch_19
        :pswitch_e
    .end packed-switch
.end method

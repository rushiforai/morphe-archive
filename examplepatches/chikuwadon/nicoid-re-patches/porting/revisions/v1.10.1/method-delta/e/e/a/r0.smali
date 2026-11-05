.class public Le/e/a/r0;
.super Ljava/lang/Object;
.source ""

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/sauzask/nicoid/NicoidPopupViewService;


# virtual methods
.method public onClick(Landroid/view/View;)V
    .registers 4

    const-string p1, "http://www.nicovideo.jp/watch/"

    invoke-static {p1}, Le/b/a/a/a;->a(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    iget-object v0, p0, Le/e/a/r0;->a:Lcom/sauzask/nicoid/NicoidPopupViewService;

    .line 1
    iget-object v0, v0, Lcom/sauzask/nicoid/NicoidPopupViewService;->f:Ljava/lang/String;

    .line 2
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Le/e/a/CachePlayback;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p1

    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.VIEW"

    invoke-direct {v0, v1, p1}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    const-string p1, "com.sauzask.nicoid.hls"

    const-string v1, "com.sauzask.nicoid.NicoidVideoInfoActivity"

    invoke-virtual {v0, p1, v1}, Landroid/content/Intent;->setClassName(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    sget-object p1, Lcom/sauzask/nicoid/NicoidPopupViewService;->s0:Landroid/os/Bundle;

    if-eqz p1, :cond_2c

    const-string v1, "infodata"

    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Bundle;)Landroid/content/Intent;

    :cond_2c
    const/high16 p1, 0x10000000

    invoke-virtual {v0, p1}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    const/4 p1, 0x0

    sput-object p1, Lcom/sauzask/nicoid/NicoidPopupViewService;->l0:Le/e/a/l3/i;

    iget-object p1, p0, Le/e/a/r0;->a:Lcom/sauzask/nicoid/NicoidPopupViewService;

    invoke-virtual {p1, v0}, Landroid/app/Service;->startActivity(Landroid/content/Intent;)V

    return-void
.end method

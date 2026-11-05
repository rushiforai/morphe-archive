.class public Lcom/sauzask/nicoid/NicoidVideoInfoActivity$g;
.super Ljava/lang/Object;
.source ""

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/sauzask/nicoid/NicoidVideoInfoActivity;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/sauzask/nicoid/NicoidVideoInfoActivity;


# virtual methods
.method public onClick(Landroid/view/View;)V
    .registers 5

    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidVideoInfoActivity$g;->a:Lcom/sauzask/nicoid/NicoidVideoInfoActivity;

    .line 1
    iget-object p1, p1, Lcom/sauzask/nicoid/NicoidVideoInfoActivity;->K:Landroid/os/Bundle;

    if-nez p1, :cond_7

    return-void

    :cond_7
    const-string p1, "http://www.nicovideo.jp/watch/"

    .line 2
    invoke-static {p1}, Le/b/a/a/a;->a(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidVideoInfoActivity$g;->a:Lcom/sauzask/nicoid/NicoidVideoInfoActivity;

    .line 3
    iget-object v0, v0, Lcom/sauzask/nicoid/NicoidVideoInfoActivity;->E:Ljava/lang/String;

    .line 4
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Le/e/a/CachePlayback;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p1

    const-string v0, "android.intent.action.VIEW"

    const-string v1, "com.sauzask.nicoid.hls"

    const-string v2, "com.sauzask.nicoid.NicoidVideoActivity"

    invoke-static {v0, p1, v1, v2}, Le/b/a/a/a;->a(Ljava/lang/String;Landroid/net/Uri;Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object p1

    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidVideoInfoActivity$g;->a:Lcom/sauzask/nicoid/NicoidVideoInfoActivity;

    .line 5
    iget-object v0, v0, Lcom/sauzask/nicoid/NicoidVideoInfoActivity;->F:Ljava/lang/String;

    const-string v1, "title"

    .line 6
    invoke-virtual {p1, v1, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidVideoInfoActivity$g;->a:Lcom/sauzask/nicoid/NicoidVideoInfoActivity;

    .line 7
    iget-boolean v1, v0, Lcom/sauzask/nicoid/NicoidVideoInfoActivity;->P:Z

    if-eqz v1, :cond_3c

    const/4 v1, 0x0

    .line 8
    iget v0, v0, Lcom/sauzask/nicoid/NicoidVideoInfoActivity;->O:I

    const/4 v2, 0x1

    .line 9
    invoke-static {p1, v1, v0, v2}, Le/e/a/v0;->a(Landroid/content/Intent;Ljava/util/ArrayList;IZ)V

    .line 10
    :cond_3c
    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidVideoInfoActivity$g;->a:Lcom/sauzask/nicoid/NicoidVideoInfoActivity;

    invoke-virtual {v0, p1}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V

    return-void
.end method

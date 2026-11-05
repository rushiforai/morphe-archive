.class public Lcom/sauzask/nicoid/NicoidFavUserActivity$a;
.super Ljava/lang/Object;
.source ""

# interfaces
.implements Landroid/widget/AdapterView$OnItemClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/sauzask/nicoid/NicoidFavUserActivity;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/sauzask/nicoid/NicoidFavUserActivity;


# virtual methods
.method public onItemClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/AdapterView<",
            "*>;",
            "Landroid/view/View;",
            "IJ)V"
        }
    .end annotation

    long-to-int p1, p4

    iget-object p3, p0, Lcom/sauzask/nicoid/NicoidFavUserActivity$a;->a:Lcom/sauzask/nicoid/NicoidFavUserActivity;

    .line 1
    iget-object p3, p3, Lcom/sauzask/nicoid/NicoidFavUserActivity;->O:Landroid/view/View;

    if-eq p2, p3, :cond_3e

    if-gez p1, :cond_a

    goto :goto_3e

    :cond_a
    const-string p2, "http://www.nicovideo.jp/user/"

    .line 2
    invoke-static {p2}, Le/b/a/a/a;->a(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    iget-object p3, p0, Lcom/sauzask/nicoid/NicoidFavUserActivity$a;->a:Lcom/sauzask/nicoid/NicoidFavUserActivity;

    .line 3
    iget-object p3, p3, Lcom/sauzask/nicoid/NicoidFavUserActivity;->z:Ljava/util/ArrayList;

    .line 4
    invoke-virtual {p3, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/util/HashMap;

    const-string p3, "mainurl"

    invoke-virtual {p1, p3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Le/e/a/CachePlayback;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p1

    const-string p2, "android.intent.action.VIEW"

    const-string p3, "com.sauzask.nicoid.hls"

    const-string p4, "com.sauzask.nicoid.NicoidUserVideoListActivity"

    invoke-static {p2, p1, p3, p4}, Le/b/a/a/a;->a(Ljava/lang/String;Landroid/net/Uri;Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object p1

    iget-object p2, p0, Lcom/sauzask/nicoid/NicoidFavUserActivity$a;->a:Lcom/sauzask/nicoid/NicoidFavUserActivity;

    invoke-virtual {p2, p1}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V

    :cond_3e
    :goto_3e
    return-void
.end method

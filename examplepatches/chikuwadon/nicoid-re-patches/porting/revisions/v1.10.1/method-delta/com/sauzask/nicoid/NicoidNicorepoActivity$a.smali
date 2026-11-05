.class public Lcom/sauzask/nicoid/NicoidNicorepoActivity$a;
.super Ljava/lang/Object;
.source ""

# interfaces
.implements Landroid/widget/AdapterView$OnItemClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/sauzask/nicoid/NicoidNicorepoActivity;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/sauzask/nicoid/NicoidNicorepoActivity;


# virtual methods
.method public onItemClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .registers 13
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

    iget-object p3, p0, Lcom/sauzask/nicoid/NicoidNicorepoActivity$a;->a:Lcom/sauzask/nicoid/NicoidNicorepoActivity;

    .line 1
    iget-object p4, p3, Lcom/sauzask/nicoid/NicoidNicorepoActivity;->Q:Landroid/view/View;

    if-eq p2, p4, :cond_e4

    if-gez p1, :cond_b

    goto/16 :goto_e4

    .line 2
    :cond_b
    iget-object p2, p3, Lcom/sauzask/nicoid/NicoidNicorepoActivity;->z:Ljava/util/ArrayList;

    .line 3
    invoke-virtual {p2, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/util/HashMap;

    const-string p3, "mainurl"

    invoke-virtual {p2, p3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p2

    const-string p3, "^.*?/(?:watch|shorts)/(nm|sm|so|ss|)([0-9]+).*?$"

    invoke-virtual {p2, p3}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result p4

    if-eqz p4, :cond_d7

    invoke-static {}, Le/e/a/PlaybackRouting;->isPopupActive()Z

    move-result p4

    const-string p5, "tickerText"

    const-string v0, "isBackgroundPlay"

    const-string v1, "url"

    const-string v2, "$1$2"

    const-string v3, "title"

    if-eqz p4, :cond_51

    invoke-virtual {p2, p3, v2}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    new-instance p3, Landroid/content/Intent;

    iget-object p4, p0, Lcom/sauzask/nicoid/NicoidNicorepoActivity$a;->a:Lcom/sauzask/nicoid/NicoidNicorepoActivity;

    .line 4
    iget-object p4, p4, Lcom/sauzask/nicoid/NicoidNicorepoActivity;->B:Landroid/app/Activity;

    .line 5
    const-class v2, Lcom/sauzask/nicoid/NicoidPopupViewService;

    invoke-direct {p3, p4, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {p3, v1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    sget-boolean p2, Lcom/sauzask/nicoid/NicoidPopupViewService;->p0:Z

    invoke-virtual {p3, v0, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    sget-boolean p2, Lcom/sauzask/nicoid/NicoidPopupViewService;->p0:Z

    if-eqz p2, :cond_96

    goto :goto_81

    :cond_51
    iget-object p4, p0, Lcom/sauzask/nicoid/NicoidNicorepoActivity$a;->a:Lcom/sauzask/nicoid/NicoidNicorepoActivity;

    .line 6
    iget p4, p4, Lcom/sauzask/nicoid/NicoidNicorepoActivity;->M:I

    const-string v4, "com.sauzask.nicoid.hls"

    const-string v5, "android.intent.action.VIEW"

    if-eqz p4, :cond_b0

    const/4 v6, 0x1

    if-eq p4, v6, :cond_9e

    const/4 v4, 0x2

    const/4 v5, 0x3

    if-eq p4, v4, :cond_66

    if-eq p4, v5, :cond_66

    goto/16 :goto_e4

    .line 7
    :cond_66
    invoke-virtual {p2, p3, v2}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    new-instance p3, Landroid/content/Intent;

    iget-object p4, p0, Lcom/sauzask/nicoid/NicoidNicorepoActivity$a;->a:Lcom/sauzask/nicoid/NicoidNicorepoActivity;

    .line 8
    iget-object p4, p4, Lcom/sauzask/nicoid/NicoidNicorepoActivity;->B:Landroid/app/Activity;

    .line 9
    const-class v2, Lcom/sauzask/nicoid/NicoidPopupViewService;

    invoke-direct {p3, p4, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {p3, v1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    iget-object p2, p0, Lcom/sauzask/nicoid/NicoidNicorepoActivity$a;->a:Lcom/sauzask/nicoid/NicoidNicorepoActivity;

    .line 10
    iget p2, p2, Lcom/sauzask/nicoid/NicoidNicorepoActivity;->M:I

    if-ne p2, v5, :cond_96

    .line 11
    invoke-virtual {p3, v0, v6}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    :goto_81
    iget-object p2, p0, Lcom/sauzask/nicoid/NicoidNicorepoActivity$a;->a:Lcom/sauzask/nicoid/NicoidNicorepoActivity;

    .line 12
    iget-object p2, p2, Lcom/sauzask/nicoid/NicoidNicorepoActivity;->z:Ljava/util/ArrayList;

    .line 13
    invoke-virtual {p2, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/util/HashMap;

    invoke-virtual {p1, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p3, p5, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    :cond_96
    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidNicorepoActivity$a;->a:Lcom/sauzask/nicoid/NicoidNicorepoActivity;

    .line 14
    iget-object p1, p1, Lcom/sauzask/nicoid/NicoidNicorepoActivity;->B:Landroid/app/Activity;

    .line 15
    invoke-static {p1, p3}, Le/e/a/v0;->a(Landroid/content/Context;Landroid/content/Intent;)V

    goto :goto_e4

    :cond_9e
    invoke-static {p2}, Le/e/a/CachePlayback;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p1

    const-string p2, "com.sauzask.nicoid.NicoidVideoInfoActivity"

    invoke-static {v5, p1, v4, p2}, Le/b/a/a/a;->a(Ljava/lang/String;Landroid/net/Uri;Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object p1

    iget-object p2, p0, Lcom/sauzask/nicoid/NicoidNicorepoActivity$a;->a:Lcom/sauzask/nicoid/NicoidNicorepoActivity;

    .line 16
    iget-object p2, p2, Lcom/sauzask/nicoid/NicoidNicorepoActivity;->B:Landroid/app/Activity;

    .line 17
    invoke-virtual {p2, p1}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V

    goto :goto_e4

    :cond_b0
    invoke-static {p2}, Le/e/a/CachePlayback;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p2

    const-string p3, "com.sauzask.nicoid.NicoidVideoActivity"

    invoke-static {v5, p2, v4, p3}, Le/b/a/a/a;->a(Ljava/lang/String;Landroid/net/Uri;Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object p2

    iget-object p3, p0, Lcom/sauzask/nicoid/NicoidNicorepoActivity$a;->a:Lcom/sauzask/nicoid/NicoidNicorepoActivity;

    .line 18
    iget-object p3, p3, Lcom/sauzask/nicoid/NicoidNicorepoActivity;->z:Ljava/util/ArrayList;

    .line 19
    invoke-virtual {p3, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/util/HashMap;

    invoke-virtual {p1, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p2, v3, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidNicorepoActivity$a;->a:Lcom/sauzask/nicoid/NicoidNicorepoActivity;

    .line 20
    iget-object p1, p1, Lcom/sauzask/nicoid/NicoidNicorepoActivity;->B:Landroid/app/Activity;

    .line 21
    invoke-virtual {p1, p2}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V

    goto :goto_e4

    :cond_d7
    new-instance p1, Le/e/a/j3;

    iget-object p3, p0, Lcom/sauzask/nicoid/NicoidNicorepoActivity$a;->a:Lcom/sauzask/nicoid/NicoidNicorepoActivity;

    .line 22
    iget-object p3, p3, Lcom/sauzask/nicoid/NicoidNicorepoActivity;->B:Landroid/app/Activity;

    const/4 p4, 0x0

    .line 23
    invoke-direct {p1, p3, p4}, Le/e/a/j3;-><init>(Landroid/app/Activity;Le/e/a/l3/g;)V

    invoke-virtual {p1, p2}, Le/e/a/j3;->a(Ljava/lang/String;)V

    :cond_e4
    :goto_e4
    return-void
.end method

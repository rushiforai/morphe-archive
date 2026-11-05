.class public Lcom/sauzask/nicoid/NicoidRankingActivity$a;
.super Ljava/lang/Object;
.source ""

# interfaces
.implements Landroid/widget/AdapterView$OnItemClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/sauzask/nicoid/NicoidRankingActivity;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/sauzask/nicoid/NicoidRankingActivity;


# virtual methods
.method public onItemClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .registers 8
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

    iget-object p3, p0, Lcom/sauzask/nicoid/NicoidRankingActivity$a;->a:Lcom/sauzask/nicoid/NicoidRankingActivity;

    .line 1
    iget-object p4, p3, Lcom/sauzask/nicoid/NicoidRankingActivity;->H:Landroid/view/View;

    if-eq p2, p4, :cond_135

    if-gez p1, :cond_b

    goto/16 :goto_135

    .line 2
    :cond_b
    :try_start_b
    iget-object p2, p3, Lcom/sauzask/nicoid/NicoidRankingActivity;->z:Ljava/util/ArrayList;

    .line 3
    invoke-virtual {p2, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/util/HashMap;

    const-string p3, "id"

    invoke-virtual {p2, p3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/lang/String;

    iget-object p3, p0, Lcom/sauzask/nicoid/NicoidRankingActivity$a;->a:Lcom/sauzask/nicoid/NicoidRankingActivity;

    .line 4
    iget-object p3, p3, Lcom/sauzask/nicoid/NicoidRankingActivity;->z:Ljava/util/ArrayList;

    .line 5
    invoke-virtual {p3, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/util/HashMap;

    const-string p3, "title"

    invoke-virtual {p1, p3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    iget-object p3, p0, Lcom/sauzask/nicoid/NicoidRankingActivity$a;->a:Lcom/sauzask/nicoid/NicoidRankingActivity;

    .line 6
    iget-object p3, p3, Lcom/sauzask/nicoid/NicoidRankingActivity;->E:Ljava/lang/String;

    const-string p4, "hour"

    .line 7
    invoke-virtual {p4, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p3
    :try_end_37
    .catch Ljava/lang/Exception; {:try_start_b .. :try_end_37} :catch_131

    const-string p4, ""

    if-eqz p3, :cond_47

    :try_start_3b
    iget-object p3, p0, Lcom/sauzask/nicoid/NicoidRankingActivity$a;->a:Lcom/sauzask/nicoid/NicoidRankingActivity;

    .line 8
    iget-object p3, p3, Lcom/sauzask/nicoid/NicoidRankingActivity;->B:Landroid/app/Activity;

    const p5, 0x7f0f00e0

    .line 9
    invoke-virtual {p3, p5}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object p3

    goto :goto_48

    :cond_47
    move-object p3, p4

    :goto_48
    iget-object p5, p0, Lcom/sauzask/nicoid/NicoidRankingActivity$a;->a:Lcom/sauzask/nicoid/NicoidRankingActivity;

    .line 10
    iget-object p5, p5, Lcom/sauzask/nicoid/NicoidRankingActivity;->E:Ljava/lang/String;

    const-string v0, "24h"

    .line 11
    invoke-virtual {p5, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p5

    if-eqz p5, :cond_5f

    iget-object p3, p0, Lcom/sauzask/nicoid/NicoidRankingActivity$a;->a:Lcom/sauzask/nicoid/NicoidRankingActivity;

    .line 12
    iget-object p3, p3, Lcom/sauzask/nicoid/NicoidRankingActivity;->B:Landroid/app/Activity;

    const p5, 0x7f0f00de

    .line 13
    invoke-virtual {p3, p5}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object p3

    :cond_5f
    iget-object p5, p0, Lcom/sauzask/nicoid/NicoidRankingActivity$a;->a:Lcom/sauzask/nicoid/NicoidRankingActivity;

    .line 14
    iget-object p5, p5, Lcom/sauzask/nicoid/NicoidRankingActivity;->E:Ljava/lang/String;

    const-string v0, "week"

    .line 15
    invoke-virtual {p5, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p5

    if-eqz p5, :cond_76

    iget-object p3, p0, Lcom/sauzask/nicoid/NicoidRankingActivity$a;->a:Lcom/sauzask/nicoid/NicoidRankingActivity;

    .line 16
    iget-object p3, p3, Lcom/sauzask/nicoid/NicoidRankingActivity;->B:Landroid/app/Activity;

    const p5, 0x7f0f00e6

    .line 17
    invoke-virtual {p3, p5}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object p3

    :cond_76
    iget-object p5, p0, Lcom/sauzask/nicoid/NicoidRankingActivity$a;->a:Lcom/sauzask/nicoid/NicoidRankingActivity;

    .line 18
    iget-object p5, p5, Lcom/sauzask/nicoid/NicoidRankingActivity;->E:Ljava/lang/String;

    const-string v0, "month"

    .line 19
    invoke-virtual {p5, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p5

    if-eqz p5, :cond_8d

    iget-object p3, p0, Lcom/sauzask/nicoid/NicoidRankingActivity$a;->a:Lcom/sauzask/nicoid/NicoidRankingActivity;

    .line 20
    iget-object p3, p3, Lcom/sauzask/nicoid/NicoidRankingActivity;->B:Landroid/app/Activity;

    const p5, 0x7f0f00e1

    .line 21
    invoke-virtual {p3, p5}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object p3

    :cond_8d
    iget-object p5, p0, Lcom/sauzask/nicoid/NicoidRankingActivity$a;->a:Lcom/sauzask/nicoid/NicoidRankingActivity;

    .line 22
    iget-object p5, p5, Lcom/sauzask/nicoid/NicoidRankingActivity;->E:Ljava/lang/String;

    const-string v0, "total"

    .line 23
    invoke-virtual {p5, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p5

    if-eqz p5, :cond_a4

    iget-object p3, p0, Lcom/sauzask/nicoid/NicoidRankingActivity$a;->a:Lcom/sauzask/nicoid/NicoidRankingActivity;

    .line 24
    iget-object p3, p3, Lcom/sauzask/nicoid/NicoidRankingActivity;->B:Landroid/app/Activity;

    const p5, 0x7f0f00e4

    .line 25
    invoke-virtual {p3, p5}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object p3

    :cond_a4
    const-string p5, "hot-topic"

    invoke-virtual {p2, p5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p5
    :try_end_aa
    .catch Ljava/lang/Exception; {:try_start_3b .. :try_end_aa} :catch_131

    const-string v0, "?term="

    if-eqz p5, :cond_ca

    :try_start_ae
    new-instance p5, Ljava/lang/StringBuilder;

    invoke-direct {p5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "https://sp.nicovideo.jp/api/ranking/"

    invoke-virtual {p5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p5, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p2, p0, Lcom/sauzask/nicoid/NicoidRankingActivity$a;->a:Lcom/sauzask/nicoid/NicoidRankingActivity;

    .line 26
    iget-object p2, p2, Lcom/sauzask/nicoid/NicoidRankingActivity;->E:Ljava/lang/String;

    .line 27
    invoke-virtual {p5, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :goto_c5
    invoke-virtual {p5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    goto :goto_e2

    :cond_ca
    new-instance p5, Ljava/lang/StringBuilder;

    invoke-direct {p5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "https://sp.nicovideo.jp/api/ranking/genre/"

    invoke-virtual {p5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p5, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p2, p0, Lcom/sauzask/nicoid/NicoidRankingActivity$a;->a:Lcom/sauzask/nicoid/NicoidRankingActivity;

    .line 28
    iget-object p2, p2, Lcom/sauzask/nicoid/NicoidRankingActivity;->E:Ljava/lang/String;

    .line 29
    invoke-virtual {p5, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_c5

    :goto_e2
    invoke-static {p2}, Le/e/a/CachePlayback;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p2

    invoke-static {}, Le/e/a/v0;->d()Z

    new-instance p5, Landroid/content/Intent;

    const-string v0, "android.intent.action.VIEW"

    invoke-direct {p5, v0, p2}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    const-string p2, "com.sauzask.nicoid.hls"

    const-string v0, "com.sauzask.nicoid.NicoidVideoListActivity"

    invoke-virtual {p5, p2, v0}, Landroid/content/Intent;->setClassName(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string p2, "name"

    invoke-virtual {p5, p2, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string p1, "subtitle"

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p3, " "

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p3, p0, Lcom/sauzask/nicoid/NicoidRankingActivity$a;->a:Lcom/sauzask/nicoid/NicoidRankingActivity;

    .line 30
    iget-object p3, p3, Lcom/sauzask/nicoid/NicoidRankingActivity;->B:Landroid/app/Activity;

    const p4, 0x7f0f00dd

    .line 31
    invoke-virtual {p3, p4}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p5, p1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string p1, "type"

    const/4 p2, 0x6

    invoke-virtual {p5, p1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidRankingActivity$a;->a:Lcom/sauzask/nicoid/NicoidRankingActivity;

    .line 32
    iget-object p1, p1, Lcom/sauzask/nicoid/NicoidRankingActivity;->B:Landroid/app/Activity;

    .line 33
    invoke-virtual {p1, p5}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V
    :try_end_130
    .catch Ljava/lang/Exception; {:try_start_ae .. :try_end_130} :catch_131

    goto :goto_135

    :catch_131
    move-exception p1

    invoke-virtual {p1}, Ljava/lang/Exception;->printStackTrace()V

    :cond_135
    :goto_135
    return-void
.end method

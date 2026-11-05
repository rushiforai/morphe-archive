.class public Lcom/sauzask/nicoid/NicoidCacheManagerActivity$b;
.super Ljava/lang/Object;
.source ""

# interfaces
.implements Landroid/widget/AdapterView$OnItemClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/sauzask/nicoid/NicoidCacheManagerActivity;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/sauzask/nicoid/NicoidCacheManagerActivity;


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

    const-string p1, "isselect"

    long-to-int p3, p4

    iget-object p4, p0, Lcom/sauzask/nicoid/NicoidCacheManagerActivity$b;->a:Lcom/sauzask/nicoid/NicoidCacheManagerActivity;

    .line 1
    iget-object p5, p4, Lcom/sauzask/nicoid/NicoidCacheManagerActivity;->Q:Landroid/view/View;

    if-eq p2, p5, :cond_15f

    if-gez p3, :cond_d

    goto/16 :goto_15f

    .line 2
    :cond_d
    :try_start_d
    iget-boolean p5, p4, Lcom/sauzask/nicoid/NicoidCacheManagerActivity;->G:Z

    const/4 v0, 0x1

    if-eqz p5, :cond_49

    .line 3
    iget-object p4, p4, Lcom/sauzask/nicoid/NicoidCacheManagerActivity;->z:Ljava/util/ArrayList;

    .line 4
    invoke-virtual {p4, p3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Le/e/a/x1;

    invoke-virtual {p3, p1}, Le/e/a/x1;->a(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p4

    check-cast p4, Ljava/lang/Boolean;

    const/4 p5, 0x0

    if-eqz p4, :cond_36

    invoke-virtual {p4}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p4

    if-nez p4, :cond_2a

    goto :goto_36

    :cond_2a
    invoke-static {p5}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p4

    invoke-virtual {p3, p1, p4}, Le/e/a/x1;->a(Ljava/lang/String;Ljava/lang/Object;)V

    invoke-static {p5}, Landroid/graphics/Color;->alpha(I)I

    move-result p1

    goto :goto_40

    :cond_36
    :goto_36
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p4

    invoke-virtual {p3, p1, p4}, Le/e/a/x1;->a(Ljava/lang/String;Ljava/lang/Object;)V

    const p1, 0x6631c7b1

    :goto_40
    invoke-virtual {p2, p1}, Landroid/view/View;->setBackgroundColor(I)V

    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidCacheManagerActivity$b;->a:Lcom/sauzask/nicoid/NicoidCacheManagerActivity;

    invoke-virtual {p1}, Lcom/sauzask/nicoid/NicoidCacheManagerActivity;->updateSelectionCount()V

    return-void

    :cond_49
    invoke-static {}, Le/e/a/PlaybackRouting;->isPopupActive()Z

    move-result p1
    :try_end_4d
    .catch Ljava/lang/Exception; {:try_start_d .. :try_end_4d} :catch_15b

    const-string p2, "tickerText"

    const-string p5, "isBackgroundPlay"

    const-string v1, "url"

    const-string v2, "$1$2"

    const-string v3, "^.*?/(?:watch|shorts)/(nm|sm|so|ss|)([0-9]+).*?$"

    const-string v4, "videourl"

    const-string v5, "title"

    if-eqz p1, :cond_ad

    .line 5
    :try_start_5d
    iget-object p1, p4, Lcom/sauzask/nicoid/NicoidCacheManagerActivity;->z:Ljava/util/ArrayList;

    .line 6
    invoke-virtual {p1, p3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Le/e/a/x1;

    invoke-virtual {p1, v4}, Le/e/a/x1;->a(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1, v3, v2}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    new-instance p4, Landroid/content/Intent;

    iget-object v2, p0, Lcom/sauzask/nicoid/NicoidCacheManagerActivity$b;->a:Lcom/sauzask/nicoid/NicoidCacheManagerActivity;

    .line 7
    iget-object v2, v2, Lcom/sauzask/nicoid/NicoidCacheManagerActivity;->B:Landroid/app/Activity;

    .line 8
    const-class v3, Lcom/sauzask/nicoid/NicoidPopupViewService;

    invoke-direct {p4, v2, v3}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {p4, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    sget-boolean p1, Lcom/sauzask/nicoid/NicoidPopupViewService;->p0:Z

    invoke-virtual {p4, p5, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    sget-boolean p1, Lcom/sauzask/nicoid/NicoidPopupViewService;->p0:Z

    if-eqz p1, :cond_9d

    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidCacheManagerActivity$b;->a:Lcom/sauzask/nicoid/NicoidCacheManagerActivity;

    .line 9
    iget-object p1, p1, Lcom/sauzask/nicoid/NicoidCacheManagerActivity;->z:Ljava/util/ArrayList;

    .line 10
    invoke-virtual {p1, p3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Le/e/a/x1;

    invoke-virtual {p1, v5}, Le/e/a/x1;->a(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p4, p2, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    :cond_9d
    sget-boolean p1, Lcom/sauzask/nicoid/NicoidVideoListActivity;->I:Z

    if-eqz p1, :cond_a8

    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidCacheManagerActivity$b;->a:Lcom/sauzask/nicoid/NicoidCacheManagerActivity;

    .line 11
    iget-object p1, p1, Lcom/sauzask/nicoid/NicoidCacheManagerActivity;->z:Ljava/util/ArrayList;

    .line 12
    invoke-static {p4, p1, p3, v0}, Le/e/a/v0;->a(Landroid/content/Intent;Ljava/util/ArrayList;IZ)V

    .line 13
    :cond_a8
    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidCacheManagerActivity$b;->a:Lcom/sauzask/nicoid/NicoidCacheManagerActivity;

    .line 14
    :goto_aa
    iget-object p1, p1, Lcom/sauzask/nicoid/NicoidCacheManagerActivity;->B:Landroid/app/Activity;

    goto :goto_10f

    .line 15
    :cond_ad
    iget-object p1, p4, Lcom/sauzask/nicoid/NicoidCacheManagerActivity;->z:Ljava/util/ArrayList;

    .line 16
    invoke-virtual {p1, p3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Le/e/a/x1;

    invoke-virtual {p1, v4}, Le/e/a/x1;->a(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    iget-object p4, p0, Lcom/sauzask/nicoid/NicoidCacheManagerActivity$b;->a:Lcom/sauzask/nicoid/NicoidCacheManagerActivity;

    .line 17
    iget p4, p4, Lcom/sauzask/nicoid/NicoidCacheManagerActivity;->I:I
    :try_end_c1
    .catch Ljava/lang/Exception; {:try_start_5d .. :try_end_c1} :catch_15b

    const-string v4, "com.sauzask.nicoid.hls"

    const-string v6, "android.intent.action.VIEW"

    if-eqz p4, :cond_126

    if-eq p4, v0, :cond_113

    const/4 v4, 0x2

    const/4 v6, 0x3

    if-eq p4, v4, :cond_d1

    if-eq p4, v6, :cond_d1

    goto/16 :goto_15f

    .line 18
    :cond_d1
    :try_start_d1
    invoke-virtual {p1, v3, v2}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    new-instance p4, Landroid/content/Intent;

    iget-object v2, p0, Lcom/sauzask/nicoid/NicoidCacheManagerActivity$b;->a:Lcom/sauzask/nicoid/NicoidCacheManagerActivity;

    .line 19
    iget-object v2, v2, Lcom/sauzask/nicoid/NicoidCacheManagerActivity;->B:Landroid/app/Activity;

    .line 20
    const-class v3, Lcom/sauzask/nicoid/NicoidPopupViewService;

    invoke-direct {p4, v2, v3}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {p4, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidCacheManagerActivity$b;->a:Lcom/sauzask/nicoid/NicoidCacheManagerActivity;

    .line 21
    iget p1, p1, Lcom/sauzask/nicoid/NicoidCacheManagerActivity;->I:I

    if-ne p1, v6, :cond_101

    .line 22
    invoke-virtual {p4, p5, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidCacheManagerActivity$b;->a:Lcom/sauzask/nicoid/NicoidCacheManagerActivity;

    .line 23
    iget-object p1, p1, Lcom/sauzask/nicoid/NicoidCacheManagerActivity;->z:Ljava/util/ArrayList;

    .line 24
    invoke-virtual {p1, p3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Le/e/a/x1;

    invoke-virtual {p1, v5}, Le/e/a/x1;->a(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p4, p2, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    :cond_101
    sget-boolean p1, Lcom/sauzask/nicoid/NicoidVideoListActivity;->I:Z

    if-eqz p1, :cond_10c

    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidCacheManagerActivity$b;->a:Lcom/sauzask/nicoid/NicoidCacheManagerActivity;

    .line 25
    iget-object p1, p1, Lcom/sauzask/nicoid/NicoidCacheManagerActivity;->z:Ljava/util/ArrayList;

    .line 26
    invoke-static {p4, p1, p3, v0}, Le/e/a/v0;->a(Landroid/content/Intent;Ljava/util/ArrayList;IZ)V

    .line 27
    :cond_10c
    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidCacheManagerActivity$b;->a:Lcom/sauzask/nicoid/NicoidCacheManagerActivity;

    goto :goto_aa

    :goto_10f
    invoke-static {p1, p4}, Le/e/a/v0;->a(Landroid/content/Context;Landroid/content/Intent;)V

    goto :goto_15f

    :cond_113
    invoke-static {p1}, Le/e/a/CachePlayback;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p1

    new-instance p2, Landroid/content/Intent;

    invoke-direct {p2, v6, p1}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    const-string p1, "com.sauzask.nicoid.NicoidVideoInfoActivity"

    invoke-virtual {p2, v4, p1}, Landroid/content/Intent;->setClassName(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidCacheManagerActivity$b;->a:Lcom/sauzask/nicoid/NicoidCacheManagerActivity;

    .line 28
    :goto_123
    iget-object p1, p1, Lcom/sauzask/nicoid/NicoidCacheManagerActivity;->B:Landroid/app/Activity;

    goto :goto_157

    .line 29
    :cond_126
    invoke-static {p1}, Le/e/a/CachePlayback;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p1

    new-instance p2, Landroid/content/Intent;

    invoke-direct {p2, v6, p1}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    const-string p1, "com.sauzask.nicoid.NicoidVideoActivity"

    invoke-virtual {p2, v4, p1}, Landroid/content/Intent;->setClassName(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidCacheManagerActivity$b;->a:Lcom/sauzask/nicoid/NicoidCacheManagerActivity;

    .line 30
    iget-object p1, p1, Lcom/sauzask/nicoid/NicoidCacheManagerActivity;->z:Ljava/util/ArrayList;

    .line 31
    invoke-virtual {p1, p3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Le/e/a/x1;

    invoke-virtual {p1, v5}, Le/e/a/x1;->a(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p2, v5, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    sget-boolean p1, Lcom/sauzask/nicoid/NicoidVideoListActivity;->I:Z

    if-eqz p1, :cond_154

    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidCacheManagerActivity$b;->a:Lcom/sauzask/nicoid/NicoidCacheManagerActivity;

    .line 32
    iget-object p1, p1, Lcom/sauzask/nicoid/NicoidCacheManagerActivity;->z:Ljava/util/ArrayList;

    .line 33
    invoke-static {p2, p1, p3, v0}, Le/e/a/v0;->a(Landroid/content/Intent;Ljava/util/ArrayList;IZ)V

    .line 34
    :cond_154
    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidCacheManagerActivity$b;->a:Lcom/sauzask/nicoid/NicoidCacheManagerActivity;

    goto :goto_123

    :goto_157
    invoke-virtual {p1, p2}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V
    :try_end_15a
    .catch Ljava/lang/Exception; {:try_start_d1 .. :try_end_15a} :catch_15b

    goto :goto_15f

    :catch_15b
    move-exception p1

    invoke-virtual {p1}, Ljava/lang/Exception;->printStackTrace()V

    :cond_15f
    :goto_15f
    return-void
.end method

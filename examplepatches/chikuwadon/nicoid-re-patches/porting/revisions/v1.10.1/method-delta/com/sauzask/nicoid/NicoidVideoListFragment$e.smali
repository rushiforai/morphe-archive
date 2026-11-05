.class public Lcom/sauzask/nicoid/NicoidVideoListFragment$e;
.super Ljava/lang/Object;
.source ""

# interfaces
.implements Landroid/widget/AdapterView$OnItemClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/sauzask/nicoid/NicoidVideoListFragment;->b(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/sauzask/nicoid/NicoidVideoListFragment;


# virtual methods
.method public onItemClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .registers 15
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

    iget-object p4, p0, Lcom/sauzask/nicoid/NicoidVideoListFragment$e;->a:Lcom/sauzask/nicoid/NicoidVideoListFragment;

    .line 1
    iget-object p5, p4, Lcom/sauzask/nicoid/NicoidVideoListFragment;->z0:Landroid/view/View;

    if-eq p2, p5, :cond_1b2

    if-gez p3, :cond_d

    goto/16 :goto_1b2

    .line 2
    :cond_d
    :try_start_d
    iget-boolean p5, p4, Lcom/sauzask/nicoid/NicoidVideoListFragment;->k0:Z

    const/4 v0, 0x1

    const/4 v1, 0x0

    if-eqz p5, :cond_49

    .line 3
    iget-object p4, p4, Lcom/sauzask/nicoid/NicoidVideoListFragment;->a0:Ljava/util/ArrayList;

    .line 4
    invoke-virtual {p4, p3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Le/e/a/x1;

    invoke-virtual {p3, p1}, Le/e/a/x1;->a(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p4

    check-cast p4, Ljava/lang/Boolean;

    if-eqz p4, :cond_36

    invoke-virtual {p4}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p4

    if-nez p4, :cond_2a

    goto :goto_36

    :cond_2a
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p4

    invoke-virtual {p3, p1, p4}, Le/e/a/x1;->a(Ljava/lang/String;Ljava/lang/Object;)V

    invoke-static {v1}, Landroid/graphics/Color;->alpha(I)I

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

    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidVideoListFragment$e;->a:Lcom/sauzask/nicoid/NicoidVideoListFragment;

    invoke-virtual {p1}, Lcom/sauzask/nicoid/NicoidVideoListFragment;->updateSelectionCount()V

    return-void

    :cond_49
    invoke-virtual {p4}, Lcom/sauzask/nicoid/NicoidVideoListFragment;->refreshTapAction()V

    invoke-static {}, Le/e/a/PlaybackRouting;->isPopupActive()Z

    move-result p1
    :try_end_50
    .catch Ljava/lang/Exception; {:try_start_d .. :try_end_50} :catch_1ae

    const-string p2, "tickerText"

    const-string p5, "isBackgroundPlay"

    const-string v2, "url"

    const-string v3, "$1$2"

    const-string v4, "^.*?/(?:watch|shorts)/(nm|sm|so|ss|)([0-9]+).*?$"

    const-string v5, "videourl"

    const-string v6, "title"

    if-eqz p1, :cond_b4

    .line 5
    :try_start_60
    iget-object p1, p4, Lcom/sauzask/nicoid/NicoidVideoListFragment;->a0:Ljava/util/ArrayList;

    .line 6
    invoke-virtual {p1, p3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Le/e/a/x1;

    invoke-virtual {p1, v5}, Le/e/a/x1;->a(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1, v4, v3}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    new-instance p4, Landroid/content/Intent;

    iget-object v1, p0, Lcom/sauzask/nicoid/NicoidVideoListFragment$e;->a:Lcom/sauzask/nicoid/NicoidVideoListFragment;

    .line 7
    iget-object v1, v1, Lcom/sauzask/nicoid/NicoidVideoListFragment;->o0:Landroid/app/Activity;

    .line 8
    const-class v3, Lcom/sauzask/nicoid/NicoidPopupViewService;

    invoke-direct {p4, v1, v3}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {p4, v2, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    sget-boolean p1, Lcom/sauzask/nicoid/NicoidPopupViewService;->p0:Z

    invoke-virtual {p4, p5, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    sget-boolean p1, Lcom/sauzask/nicoid/NicoidPopupViewService;->p0:Z

    if-eqz p1, :cond_a0

    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidVideoListFragment$e;->a:Lcom/sauzask/nicoid/NicoidVideoListFragment;

    .line 9
    iget-object p1, p1, Lcom/sauzask/nicoid/NicoidVideoListFragment;->a0:Ljava/util/ArrayList;

    .line 10
    invoke-virtual {p1, p3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Le/e/a/x1;

    invoke-virtual {p1, v6}, Le/e/a/x1;->a(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p4, p2, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    :cond_a0
    sget-boolean p1, Lcom/sauzask/nicoid/NicoidVideoListActivity;->I:Z

    if-eqz p1, :cond_ab

    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidVideoListFragment$e;->a:Lcom/sauzask/nicoid/NicoidVideoListFragment;

    .line 11
    iget-object p1, p1, Lcom/sauzask/nicoid/NicoidVideoListFragment;->a0:Ljava/util/ArrayList;

    .line 12
    invoke-static {p4, p1, p3, v0}, Le/e/a/v0;->a(Landroid/content/Intent;Ljava/util/ArrayList;IZ)V

    .line 13
    :cond_ab
    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidVideoListFragment$e;->a:Lcom/sauzask/nicoid/NicoidVideoListFragment;

    .line 14
    iget-object p1, p1, Lcom/sauzask/nicoid/NicoidVideoListFragment;->o0:Landroid/app/Activity;

    .line 15
    :goto_af
    invoke-static {p1, p4}, Le/e/a/v0;->a(Landroid/content/Context;Landroid/content/Intent;)V

    goto/16 :goto_1b2

    .line 16
    :cond_b4
    iget-object p1, p4, Lcom/sauzask/nicoid/NicoidVideoListFragment;->a0:Ljava/util/ArrayList;

    .line 17
    invoke-virtual {p1, p3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Le/e/a/x1;

    invoke-virtual {p1, v5}, Le/e/a/x1;->a(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    iget-object p4, p0, Lcom/sauzask/nicoid/NicoidVideoListFragment$e;->a:Lcom/sauzask/nicoid/NicoidVideoListFragment;

    .line 18
    iget-boolean p4, p4, Lcom/sauzask/nicoid/NicoidVideoListFragment;->u0:Z

    const/4 v5, 0x2

    if-nez p4, :cond_d5

    .line 19
    iget-object p4, p0, Lcom/sauzask/nicoid/NicoidVideoListFragment$e;->a:Lcom/sauzask/nicoid/NicoidVideoListFragment;

    .line 20
    iget p4, p4, Lcom/sauzask/nicoid/NicoidVideoListFragment;->j0:I

    if-ne p4, v5, :cond_d5

    .line 21
    iget-object p4, p0, Lcom/sauzask/nicoid/NicoidVideoListFragment$e;->a:Lcom/sauzask/nicoid/NicoidVideoListFragment;

    .line 22
    iput v1, p4, Lcom/sauzask/nicoid/NicoidVideoListFragment;->j0:I

    .line 23
    :cond_d5
    iget-object p4, p0, Lcom/sauzask/nicoid/NicoidVideoListFragment$e;->a:Lcom/sauzask/nicoid/NicoidVideoListFragment;

    .line 24
    iget p4, p4, Lcom/sauzask/nicoid/NicoidVideoListFragment;->j0:I
    :try_end_d9
    .catch Ljava/lang/Exception; {:try_start_60 .. :try_end_d9} :catch_1ae

    const-string v7, "com.sauzask.nicoid.hls"

    const-string v8, "android.intent.action.VIEW"

    if-eqz p4, :cond_149

    if-eq p4, v0, :cond_128

    const/4 v1, 0x3

    if-eq p4, v5, :cond_e8

    if-eq p4, v1, :cond_e8

    goto/16 :goto_1b2

    .line 25
    :cond_e8
    :try_start_e8
    invoke-virtual {p1, v4, v3}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    new-instance p4, Landroid/content/Intent;

    iget-object v3, p0, Lcom/sauzask/nicoid/NicoidVideoListFragment$e;->a:Lcom/sauzask/nicoid/NicoidVideoListFragment;

    .line 26
    iget-object v3, v3, Lcom/sauzask/nicoid/NicoidVideoListFragment;->o0:Landroid/app/Activity;

    .line 27
    const-class v4, Lcom/sauzask/nicoid/NicoidPopupViewService;

    invoke-direct {p4, v3, v4}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {p4, v2, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidVideoListFragment$e;->a:Lcom/sauzask/nicoid/NicoidVideoListFragment;

    .line 28
    iget p1, p1, Lcom/sauzask/nicoid/NicoidVideoListFragment;->j0:I

    if-ne p1, v1, :cond_118

    .line 29
    invoke-virtual {p4, p5, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidVideoListFragment$e;->a:Lcom/sauzask/nicoid/NicoidVideoListFragment;

    .line 30
    iget-object p1, p1, Lcom/sauzask/nicoid/NicoidVideoListFragment;->a0:Ljava/util/ArrayList;

    .line 31
    invoke-virtual {p1, p3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Le/e/a/x1;

    invoke-virtual {p1, v6}, Le/e/a/x1;->a(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p4, p2, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    :cond_118
    sget-boolean p1, Lcom/sauzask/nicoid/NicoidVideoListActivity;->I:Z

    if-eqz p1, :cond_123

    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidVideoListFragment$e;->a:Lcom/sauzask/nicoid/NicoidVideoListFragment;

    .line 32
    iget-object p1, p1, Lcom/sauzask/nicoid/NicoidVideoListFragment;->a0:Ljava/util/ArrayList;

    .line 33
    invoke-static {p4, p1, p3, v0}, Le/e/a/v0;->a(Landroid/content/Intent;Ljava/util/ArrayList;IZ)V

    .line 34
    :cond_123
    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidVideoListFragment$e;->a:Lcom/sauzask/nicoid/NicoidVideoListFragment;

    .line 35
    iget-object p1, p1, Lcom/sauzask/nicoid/NicoidVideoListFragment;->o0:Landroid/app/Activity;

    goto :goto_af

    .line 36
    :cond_128
    invoke-static {p1}, Le/e/a/CachePlayback;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p1

    new-instance p2, Landroid/content/Intent;

    invoke-direct {p2, v8, p1}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    const-string p1, "com.sauzask.nicoid.NicoidVideoInfoActivity"

    invoke-virtual {p2, v7, p1}, Landroid/content/Intent;->setClassName(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    sget-boolean p1, Lcom/sauzask/nicoid/NicoidVideoListActivity;->I:Z

    if-eqz p1, :cond_141

    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidVideoListFragment$e;->a:Lcom/sauzask/nicoid/NicoidVideoListFragment;

    .line 37
    iget-object p1, p1, Lcom/sauzask/nicoid/NicoidVideoListFragment;->a0:Ljava/util/ArrayList;

    .line 38
    invoke-static {p2, p1, p3, v0}, Le/e/a/v0;->a(Landroid/content/Intent;Ljava/util/ArrayList;IZ)V

    .line 39
    :cond_141
    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidVideoListFragment$e;->a:Lcom/sauzask/nicoid/NicoidVideoListFragment;

    .line 40
    iget-object p1, p1, Lcom/sauzask/nicoid/NicoidVideoListFragment;->o0:Landroid/app/Activity;

    .line 41
    invoke-virtual {p1, p2}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V

    goto :goto_1b2

    :cond_149
    invoke-static {p1}, Le/e/a/CachePlayback;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p1

    new-instance p2, Landroid/content/Intent;

    invoke-direct {p2, v8, p1}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    const-string p1, "com.sauzask.nicoid.NicoidVideoActivity"

    invoke-virtual {p2, v7, p1}, Landroid/content/Intent;->setClassName(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string p1, "intentselect"

    invoke-virtual {p2, p1, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidVideoListFragment$e;->a:Lcom/sauzask/nicoid/NicoidVideoListFragment;

    .line 42
    iget-object p1, p1, Lcom/sauzask/nicoid/NicoidVideoListFragment;->a0:Ljava/util/ArrayList;

    .line 43
    invoke-virtual {p1, p3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Le/e/a/x1;

    invoke-virtual {p1, v6}, Le/e/a/x1;->a(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p2, v6, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    sget-boolean p1, Lcom/sauzask/nicoid/NicoidVideoListActivity;->I:Z

    const/16 p4, 0xc

    if-eqz p1, :cond_18c

    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidVideoListFragment$e;->a:Lcom/sauzask/nicoid/NicoidVideoListFragment;

    .line 44
    iget-object p1, p1, Lcom/sauzask/nicoid/NicoidVideoListFragment;->a0:Ljava/util/ArrayList;

    .line 45
    iget-object p5, p0, Lcom/sauzask/nicoid/NicoidVideoListFragment$e;->a:Lcom/sauzask/nicoid/NicoidVideoListFragment;

    .line 46
    iget p5, p5, Lcom/sauzask/nicoid/NicoidVideoListFragment;->g0:I

    if-ne p5, p4, :cond_189

    .line 47
    iget-object p5, p0, Lcom/sauzask/nicoid/NicoidVideoListFragment$e;->a:Lcom/sauzask/nicoid/NicoidVideoListFragment;

    .line 48
    iget-boolean p5, p5, Lcom/sauzask/nicoid/NicoidVideoListFragment;->u0:Z

    if-eqz p5, :cond_188

    goto :goto_189

    :cond_188
    const/4 v0, 0x0

    .line 49
    :cond_189
    :goto_189
    invoke-static {p2, p1, p3, v0}, Le/e/a/v0;->a(Landroid/content/Intent;Ljava/util/ArrayList;IZ)V

    :cond_18c
    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidVideoListFragment$e;->a:Lcom/sauzask/nicoid/NicoidVideoListFragment;

    .line 50
    iget-object p1, p1, Lcom/sauzask/nicoid/NicoidVideoListFragment;->o0:Landroid/app/Activity;

    .line 51
    invoke-virtual {p1, p2}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V

    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidVideoListFragment$e;->a:Lcom/sauzask/nicoid/NicoidVideoListFragment;

    .line 52
    iget p1, p1, Lcom/sauzask/nicoid/NicoidVideoListFragment;->g0:I

    if-ne p1, p4, :cond_1b2

    .line 53
    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidVideoListFragment$e;->a:Lcom/sauzask/nicoid/NicoidVideoListFragment;

    .line 54
    iget-boolean p1, p1, Lcom/sauzask/nicoid/NicoidVideoListFragment;->u0:Z

    if-nez p1, :cond_1b2

    .line 55
    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidVideoListFragment$e;->a:Lcom/sauzask/nicoid/NicoidVideoListFragment;

    .line 56
    iget-object p1, p1, Lcom/sauzask/nicoid/NicoidVideoListFragment;->o0:Landroid/app/Activity;

    .line 57
    invoke-virtual {p1, v1, v1}, Landroid/app/Activity;->overridePendingTransition(II)V

    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidVideoListFragment$e;->a:Lcom/sauzask/nicoid/NicoidVideoListFragment;

    .line 58
    iget-object p1, p1, Lcom/sauzask/nicoid/NicoidVideoListFragment;->o0:Landroid/app/Activity;

    .line 59
    invoke-virtual {p1}, Landroid/app/Activity;->finish()V
    :try_end_1ad
    .catch Ljava/lang/Exception; {:try_start_e8 .. :try_end_1ad} :catch_1ae

    goto :goto_1b2

    :catch_1ae
    move-exception p1

    invoke-virtual {p1}, Ljava/lang/Exception;->printStackTrace()V

    :cond_1b2
    :goto_1b2
    return-void
.end method

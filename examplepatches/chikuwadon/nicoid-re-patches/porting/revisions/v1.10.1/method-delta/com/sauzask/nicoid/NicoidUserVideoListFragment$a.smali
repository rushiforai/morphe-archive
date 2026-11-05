.class public Lcom/sauzask/nicoid/NicoidUserVideoListFragment$a;
.super Ljava/lang/Object;
.source ""

# interfaces
.implements Landroid/widget/AdapterView$OnItemClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/sauzask/nicoid/NicoidUserVideoListFragment;->a(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/sauzask/nicoid/NicoidUserVideoListFragment;


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

    if-gez p1, :cond_4

    return-void

    :cond_4
    iget-object p2, p0, Lcom/sauzask/nicoid/NicoidUserVideoListFragment$a;->a:Lcom/sauzask/nicoid/NicoidUserVideoListFragment;

    .line 1
    iget-object p2, p2, Lcom/sauzask/nicoid/NicoidUserVideoListFragment;->g0:Ljava/util/ArrayList;

    .line 2
    invoke-virtual {p2, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/util/HashMap;

    const-string p3, "islabel"

    invoke-virtual {p2, p3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/lang/Boolean;

    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p2

    if-eqz p2, :cond_1d

    return-void

    :cond_1d
    iget-object p2, p0, Lcom/sauzask/nicoid/NicoidUserVideoListFragment$a;->a:Lcom/sauzask/nicoid/NicoidUserVideoListFragment;

    .line 3
    iget-object p2, p2, Lcom/sauzask/nicoid/NicoidUserVideoListFragment;->g0:Ljava/util/ArrayList;

    .line 4
    invoke-virtual {p2, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/util/HashMap;

    const-string p2, "url"

    invoke-virtual {p1, p2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    iget-object p2, p0, Lcom/sauzask/nicoid/NicoidUserVideoListFragment$a;->a:Lcom/sauzask/nicoid/NicoidUserVideoListFragment;

    .line 5
    iget-object p3, p2, Lcom/sauzask/nicoid/NicoidUserVideoListFragment;->c0:Le/e/a/l3/g;

    if-nez p3, :cond_50

    .line 6
    invoke-static {p1}, Le/e/a/CachePlayback;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p1

    const-string p2, "android.intent.action.VIEW"

    const-string p3, "com.sauzask.nicoid.hls"

    const-string p4, "com.sauzask.nicoid.NicoidVideoListActivity"

    invoke-static {p2, p1, p3, p4}, Le/b/a/a/a;->a(Ljava/lang/String;Landroid/net/Uri;Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object p1

    iget-object p2, p0, Lcom/sauzask/nicoid/NicoidUserVideoListFragment$a;->a:Lcom/sauzask/nicoid/NicoidUserVideoListFragment;

    .line 7
    iget-object p2, p2, Lcom/sauzask/nicoid/NicoidUserVideoListFragment;->b0:Landroid/app/Activity;

    .line 8
    invoke-static {p2, p1}, Le/e/a/CreatorIntent119;->forward(Landroid/app/Activity;Landroid/content/Intent;)V

    invoke-virtual {p2, p1}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V

    goto :goto_5a

    :cond_50
    new-instance p4, Le/e/a/j3;

    .line 9
    iget-object p2, p2, Lcom/sauzask/nicoid/NicoidUserVideoListFragment;->b0:Landroid/app/Activity;

    .line 10
    invoke-direct {p4, p2, p3}, Le/e/a/j3;-><init>(Landroid/app/Activity;Le/e/a/l3/g;)V

    invoke-virtual {p4, p1}, Le/e/a/j3;->a(Ljava/lang/String;)V

    :goto_5a
    return-void
.end method

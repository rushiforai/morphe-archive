.class public Lcom/sauzask/nicoid/NicoidMylistGroupActivity$a;
.super Ljava/lang/Object;
.source ""

# interfaces
.implements Landroid/widget/AdapterView$OnItemClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/sauzask/nicoid/NicoidMylistGroupActivity;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/sauzask/nicoid/NicoidMylistGroupActivity;


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

    iget-object p3, p0, Lcom/sauzask/nicoid/NicoidMylistGroupActivity$a;->a:Lcom/sauzask/nicoid/NicoidMylistGroupActivity;

    .line 1
    iget-object p4, p3, Lcom/sauzask/nicoid/NicoidMylistGroupActivity;->G:Landroid/view/View;

    if-eq p2, p4, :cond_50

    if-gez p1, :cond_a

    goto :goto_50

    .line 2
    :cond_a
    iget-object p2, p3, Lcom/sauzask/nicoid/NicoidMylistGroupActivity;->z:Ljava/util/ArrayList;

    .line 3
    invoke-virtual {p2, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/util/HashMap;

    const-string p3, "id"

    invoke-virtual {p2, p3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p2}, Le/e/a/CachePlayback;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p2

    const-string p3, "android.intent.action.VIEW"

    const-string p4, "com.sauzask.nicoid.hls"

    const-string p5, "com.sauzask.nicoid.NicoidVideoListActivity"

    invoke-static {p3, p2, p4, p5}, Le/b/a/a/a;->a(Ljava/lang/String;Landroid/net/Uri;Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object p2

    const/4 p3, 0x5

    const-string p4, "type"

    invoke-virtual {p2, p4, p3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    iget-object p3, p0, Lcom/sauzask/nicoid/NicoidMylistGroupActivity$a;->a:Lcom/sauzask/nicoid/NicoidMylistGroupActivity;

    .line 4
    iget-object p3, p3, Lcom/sauzask/nicoid/NicoidMylistGroupActivity;->z:Ljava/util/ArrayList;

    .line 5
    invoke-virtual {p3, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/util/HashMap;

    const-string p3, "title"

    invoke-virtual {p1, p3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    const-string p3, "name"

    invoke-virtual {p2, p3, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidMylistGroupActivity$a;->a:Lcom/sauzask/nicoid/NicoidMylistGroupActivity;

    .line 6
    iget-object p1, p1, Lcom/sauzask/nicoid/NicoidMylistGroupActivity;->B:Landroid/app/Activity;

    .line 7
    invoke-virtual {p1, p2}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V

    :cond_50
    :goto_50
    return-void
.end method

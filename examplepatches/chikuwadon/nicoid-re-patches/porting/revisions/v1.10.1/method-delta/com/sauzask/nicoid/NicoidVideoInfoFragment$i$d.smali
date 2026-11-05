.class public Lcom/sauzask/nicoid/NicoidVideoInfoFragment$i$d;
.super Ljava/lang/Object;
.source ""

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/sauzask/nicoid/NicoidVideoInfoFragment$i;->onClick(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/sauzask/nicoid/NicoidVideoInfoFragment$i;


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .registers 6

    const/4 p1, 0x4

    new-array p1, p1, [I

    const/4 p2, 0x1

    const/4 v0, 0x0

    aput p2, p1, v0

    iget-object v1, p0, Lcom/sauzask/nicoid/NicoidVideoInfoFragment$i$d;->a:Lcom/sauzask/nicoid/NicoidVideoInfoFragment$i;

    iget-object v1, v1, Lcom/sauzask/nicoid/NicoidVideoInfoFragment$i;->b:Lcom/sauzask/nicoid/NicoidVideoInfoFragment;

    .line 1
    iget-object v1, v1, Lcom/sauzask/nicoid/NicoidVideoInfoFragment;->n0:Landroid/content/SharedPreferences;

    const-string v2, "search_Sort"

    .line 2
    invoke-interface {v1, v2, v0}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v1

    aput v1, p1, p2

    const/4 p2, 0x2

    aput v0, p1, p2

    const/4 p2, 0x3

    aput v0, p1, p2

    iget-object p2, p0, Lcom/sauzask/nicoid/NicoidVideoInfoFragment$i$d;->a:Lcom/sauzask/nicoid/NicoidVideoInfoFragment$i;

    iget-object p2, p2, Lcom/sauzask/nicoid/NicoidVideoInfoFragment$i;->a:Ljava/lang/String;

    invoke-static {p1, p2}, Le/e/a/v0;->a([ILjava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Le/e/a/CachePlayback;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p1

    const-string p2, "android.intent.action.VIEW"

    const-string v0, "com.sauzask.nicoid.hls"

    const-string v1, "com.sauzask.nicoid.NicoidVideoListActivity"

    invoke-static {p2, p1, v0, v1}, Le/b/a/a/a;->a(Ljava/lang/String;Landroid/net/Uri;Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object p1

    iget-object p2, p0, Lcom/sauzask/nicoid/NicoidVideoInfoFragment$i$d;->a:Lcom/sauzask/nicoid/NicoidVideoInfoFragment$i;

    iget-object p2, p2, Lcom/sauzask/nicoid/NicoidVideoInfoFragment$i;->b:Lcom/sauzask/nicoid/NicoidVideoInfoFragment;

    .line 3
    iget-object p2, p2, Lcom/sauzask/nicoid/NicoidVideoInfoFragment;->b0:Landroid/app/Activity;

    .line 4
    invoke-virtual {p2, p1}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V

    return-void
.end method

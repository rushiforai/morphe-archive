.class public Lcom/sauzask/nicoid/NicoidVideoInfoFragment$j$a;
.super Ljava/lang/Object;
.source ""

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/sauzask/nicoid/NicoidVideoInfoFragment$j;->onLongClick(Landroid/view/View;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/sauzask/nicoid/NicoidVideoInfoFragment$j;


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .registers 4

    const-string p1, "http://dic.nicovideo.jp/a/"

    invoke-static {p1}, Le/b/a/a/a;->a(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    iget-object p2, p0, Lcom/sauzask/nicoid/NicoidVideoInfoFragment$j$a;->a:Lcom/sauzask/nicoid/NicoidVideoInfoFragment$j;

    iget-object p2, p2, Lcom/sauzask/nicoid/NicoidVideoInfoFragment$j;->b:Ljava/lang/String;

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Le/e/a/CachePlayback;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p1

    new-instance p2, Landroid/content/Intent;

    const-string v0, "android.intent.action.VIEW"

    invoke-direct {p2, v0, p1}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidVideoInfoFragment$j$a;->a:Lcom/sauzask/nicoid/NicoidVideoInfoFragment$j;

    iget-object p1, p1, Lcom/sauzask/nicoid/NicoidVideoInfoFragment$j;->c:Lcom/sauzask/nicoid/NicoidVideoInfoFragment;

    .line 1
    iget-object p1, p1, Lcom/sauzask/nicoid/NicoidVideoInfoFragment;->b0:Landroid/app/Activity;

    .line 2
    invoke-virtual {p1, p2}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V

    return-void
.end method

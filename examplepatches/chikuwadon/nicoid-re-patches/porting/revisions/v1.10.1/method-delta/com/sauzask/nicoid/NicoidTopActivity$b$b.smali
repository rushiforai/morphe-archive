.class public Lcom/sauzask/nicoid/NicoidTopActivity$b$b;
.super Ljava/lang/Object;
.source ""

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/sauzask/nicoid/NicoidTopActivity$b;->onItemClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Landroid/widget/EditText;

.field public final synthetic b:Lcom/sauzask/nicoid/NicoidTopActivity$b;


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .registers 5

    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidTopActivity$b$b;->a:Landroid/widget/EditText;

    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result p2

    if-nez p2, :cond_24

    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidTopActivity$b$b;->b:Lcom/sauzask/nicoid/NicoidTopActivity$b;

    iget-object p1, p1, Lcom/sauzask/nicoid/NicoidTopActivity$b;->b:Landroid/content/Context;

    const p2, 0x7f0f01cf

    invoke-virtual {p1, p2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p1

    iget-object p2, p0, Lcom/sauzask/nicoid/NicoidTopActivity$b$b;->b:Lcom/sauzask/nicoid/NicoidTopActivity$b;

    iget-object p2, p2, Lcom/sauzask/nicoid/NicoidTopActivity$b;->b:Landroid/content/Context;

    const/4 v0, 0x0

    .line 1
    invoke-static {p1, v0, p2}, Le/e/a/v0;->a(Ljava/lang/String;ILandroid/content/Context;)V

    return-void

    .line 2
    :cond_24
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "http://www.nicovideo.jp/watch/"

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Le/e/a/CachePlayback;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p1

    const-string p2, "android.intent.action.VIEW"

    const-string v0, "com.sauzask.nicoid.hls"

    const-string v1, "com.sauzask.nicoid.NicoidVideoInfoActivity"

    invoke-static {p2, p1, v0, v1}, Le/b/a/a/a;->a(Ljava/lang/String;Landroid/net/Uri;Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object p1

    iget-object p2, p0, Lcom/sauzask/nicoid/NicoidTopActivity$b$b;->b:Lcom/sauzask/nicoid/NicoidTopActivity$b;

    iget-object p2, p2, Lcom/sauzask/nicoid/NicoidTopActivity$b;->b:Landroid/content/Context;

    invoke-virtual {p2, p1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    return-void
.end method

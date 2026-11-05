.class public Lcom/sauzask/nicoid/intent/NicoidIntentSelect$c;
.super Ljava/lang/Object;
.source ""

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/sauzask/nicoid/intent/NicoidIntentSelect;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/sauzask/nicoid/intent/NicoidIntentSelect;


# virtual methods
.method public onClick(Landroid/view/View;)V
    .registers 5

    iget-object p1, p0, Lcom/sauzask/nicoid/intent/NicoidIntentSelect$c;->a:Lcom/sauzask/nicoid/intent/NicoidIntentSelect;

    .line 1
    iget-object p1, p1, Lcom/sauzask/nicoid/intent/NicoidIntentSelect;->a:Ljava/lang/String;

    .line 2
    invoke-static {p1}, Le/e/a/CachePlayback;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p1

    const-string v0, "android.intent.action.VIEW"

    const-string v1, "com.sauzask.nicoid.hls"

    const-string v2, "com.sauzask.nicoid.NicoidVideoInfoActivity"

    invoke-static {v0, p1, v1, v2}, Le/b/a/a/a;->a(Ljava/lang/String;Landroid/net/Uri;Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object p1

    iget-object v0, p0, Lcom/sauzask/nicoid/intent/NicoidIntentSelect$c;->a:Lcom/sauzask/nicoid/intent/NicoidIntentSelect;

    invoke-virtual {v0, p1}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V

    iget-object p1, p0, Lcom/sauzask/nicoid/intent/NicoidIntentSelect$c;->a:Lcom/sauzask/nicoid/intent/NicoidIntentSelect;

    invoke-virtual {p1}, Landroid/app/Activity;->finish()V

    return-void
.end method

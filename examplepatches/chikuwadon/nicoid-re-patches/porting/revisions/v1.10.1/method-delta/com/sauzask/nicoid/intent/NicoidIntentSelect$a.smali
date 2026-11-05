.class public Lcom/sauzask/nicoid/intent/NicoidIntentSelect$a;
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
    .registers 4

    iget-object p1, p0, Lcom/sauzask/nicoid/intent/NicoidIntentSelect$a;->a:Lcom/sauzask/nicoid/intent/NicoidIntentSelect;

    .line 1
    iget-object p1, p1, Lcom/sauzask/nicoid/intent/NicoidIntentSelect;->a:Ljava/lang/String;

    .line 2
    invoke-static {p1}, Le/e/a/CachePlayback;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p1

    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.VIEW"

    invoke-direct {v0, v1, p1}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    iget-object p1, p0, Lcom/sauzask/nicoid/intent/NicoidIntentSelect$a;->a:Lcom/sauzask/nicoid/intent/NicoidIntentSelect;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Landroid/content/Intent;->createChooser(Landroid/content/Intent;Ljava/lang/CharSequence;)Landroid/content/Intent;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V

    iget-object p1, p0, Lcom/sauzask/nicoid/intent/NicoidIntentSelect$a;->a:Lcom/sauzask/nicoid/intent/NicoidIntentSelect;

    invoke-virtual {p1}, Landroid/app/Activity;->finish()V

    return-void
.end method

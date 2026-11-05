.class public Lcom/sauzask/nicoid/NicoidChormecastSenderService$d;
.super Ljava/lang/Object;
.source ""

# interfaces
.implements Le/d/b/b/e/k/e$c;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/sauzask/nicoid/NicoidChormecastSenderService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/sauzask/nicoid/NicoidChormecastSenderService;


# virtual methods
.method public a(Lcom/google/android/gms/common/ConnectionResult;)V
    .registers 4

    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidChormecastSenderService$d;->a:Lcom/sauzask/nicoid/NicoidChormecastSenderService;

    .line 1
    iget-object v0, v0, Lcom/sauzask/nicoid/NicoidChormecastSenderService;->b:Ljava/lang/String;

    const-string v0, "sssxx:"

    .line 2
    invoke-static {v0}, Le/b/a/a/a;->a(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p1}, Lcom/google/android/gms/common/ConnectionResult;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    invoke-virtual {p1}, Lcom/google/android/gms/common/ConnectionResult;->l()I

    move-result p1

    const/4 v0, 0x2

    if-eq p1, v0, :cond_1c

    goto :goto_42

    :cond_1c
    const/4 p1, 0x1

    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidChormecastSenderService$d;->a:Lcom/sauzask/nicoid/NicoidChormecastSenderService;

    .line 3
    iget-object v0, v0, Lcom/sauzask/nicoid/NicoidChormecastSenderService;->m:Landroid/content/Context;

    const-string v1, "Google Play\u958b\u767a\u8005\u30b5\u30fc\u30d3\u30b9\u306e\u66f4\u65b0\u304c\u5fc5\u8981\u3067\u3059"

    .line 4
    invoke-static {v1, p1, v0}, Le/e/a/v0;->a(Ljava/lang/String;ILandroid/content/Context;)V

    :try_start_26
    const-string p1, "market://details?id=com.google.android.gms"

    invoke-static {p1}, Le/e/a/CachePlayback;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p1

    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.VIEW"

    invoke-direct {v0, v1, p1}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    const/high16 p1, 0x10000000

    invoke-virtual {v0, p1}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidChormecastSenderService$d;->a:Lcom/sauzask/nicoid/NicoidChormecastSenderService;

    invoke-virtual {p1, v0}, Landroid/app/Service;->startActivity(Landroid/content/Intent;)V
    :try_end_3d
    .catch Ljava/lang/Exception; {:try_start_26 .. :try_end_3d} :catch_3e

    goto :goto_42

    :catch_3e
    move-exception p1

    invoke-virtual {p1}, Ljava/lang/Exception;->printStackTrace()V

    :goto_42
    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidChormecastSenderService$d;->a:Lcom/sauzask/nicoid/NicoidChormecastSenderService;

    invoke-virtual {p1}, Landroid/app/Service;->stopSelf()V

    return-void
.end method

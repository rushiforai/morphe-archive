.class public final Lerj;
.super Lfrj;
.source "SourceFile"


# virtual methods
.method public final d(Landroid/content/Context;Landroid/net/Uri;)Landroid/content/Intent;
    .registers 3

    invoke-super {p0, p1, p2}, Lfrj;->d(Landroid/content/Context;Landroid/net/Uri;)Landroid/content/Intent;

    move-result-object p0

    const-class p2, Lcom/opera/android/IntentDispatcherActivity;

    invoke-virtual {p0, p1, p2}, Landroid/content/Intent;->setClass(Landroid/content/Context;Ljava/lang/Class;)Landroid/content/Intent;

    return-object p0
.end method

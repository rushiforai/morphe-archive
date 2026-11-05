.class public Le/e/a/j3$b;
.super Ljava/lang/Object;
.source ""

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Le/e/a/j3;->a(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ljava/lang/String;

.field public final synthetic b:Le/e/a/j3;


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .registers 5

    iget-object p1, p0, Le/e/a/j3$b;->a:Ljava/lang/String;

    invoke-static {p1}, Le/e/a/CachePlayback;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p1

    const-string p2, "android.intent.action.VIEW"

    const-string v0, "com.sauzask.nicoid.hls"

    const-string v1, "com.sauzask.nicoid.NicoidVideoListActivity"

    invoke-static {p2, p1, v0, v1}, Le/b/a/a/a;->a(Ljava/lang/String;Landroid/net/Uri;Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object p1

    iget-object p2, p0, Le/e/a/j3$b;->b:Le/e/a/j3;

    .line 1
    iget-object p2, p2, Le/e/a/j3;->a:Landroid/app/Activity;

    .line 2
    invoke-virtual {p2, p1}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V

    return-void
.end method

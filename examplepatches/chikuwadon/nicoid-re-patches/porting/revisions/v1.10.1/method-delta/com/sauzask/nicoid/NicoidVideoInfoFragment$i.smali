.class public Lcom/sauzask/nicoid/NicoidVideoInfoFragment$i;
.super Ljava/lang/Object;
.source ""

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/sauzask/nicoid/NicoidVideoInfoFragment;->a(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ljava/lang/String;

.field public final synthetic b:Lcom/sauzask/nicoid/NicoidVideoInfoFragment;


# virtual methods
.method public onClick(Landroid/view/View;)V
    .registers 9

    new-instance p1, Landroid/app/AlertDialog$Builder;

    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidVideoInfoFragment$i;->b:Lcom/sauzask/nicoid/NicoidVideoInfoFragment;

    .line 1
    iget-object v0, v0, Lcom/sauzask/nicoid/NicoidVideoInfoFragment;->b0:Landroid/app/Activity;

    .line 2
    invoke-direct {p1, v0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidVideoInfoFragment$i;->a:Ljava/lang/String;

    const-string v1, "^.*?(nm|sm|so|ss)([0-9]+).*?$"

    invoke-virtual {v0, v1}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v0

    const-string v2, "android.intent.action.VIEW"

    if-eqz v0, :cond_7c

    iget-object v3, p0, Lcom/sauzask/nicoid/NicoidVideoInfoFragment$i;->a:Ljava/lang/String;

    const-string v4, "$1$2"

    invoke-virtual {v3, v1, v4}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "http://www.nicovideo.jp/watch/"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Le/e/a/CachePlayback;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v3

    new-instance v4, Landroid/content/Intent;

    invoke-direct {v4, v2, v3}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    iget-object v3, p0, Lcom/sauzask/nicoid/NicoidVideoInfoFragment$i;->a:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "<b>"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v1, v5}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v1

    invoke-virtual {p1, v1}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    iget-object v1, p0, Lcom/sauzask/nicoid/NicoidVideoInfoFragment$i;->b:Lcom/sauzask/nicoid/NicoidVideoInfoFragment;

    .line 3
    iget-object v1, v1, Lcom/sauzask/nicoid/NicoidVideoInfoFragment;->b0:Landroid/app/Activity;

    const v3, 0x7f0f01f7

    .line 4
    invoke-virtual {v1, v3}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v1

    new-instance v3, Lcom/sauzask/nicoid/NicoidVideoInfoFragment$i$a;

    invoke-direct {v3, p0, v4}, Lcom/sauzask/nicoid/NicoidVideoInfoFragment$i$a;-><init>(Lcom/sauzask/nicoid/NicoidVideoInfoFragment$i;Landroid/content/Intent;)V

    invoke-virtual {p1, v1, v3}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    iget-object v1, p0, Lcom/sauzask/nicoid/NicoidVideoInfoFragment$i;->b:Lcom/sauzask/nicoid/NicoidVideoInfoFragment;

    .line 5
    iget-object v1, v1, Lcom/sauzask/nicoid/NicoidVideoInfoFragment;->b0:Landroid/app/Activity;

    const v3, 0x7f0f01fb

    .line 6
    invoke-virtual {v1, v3}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v1

    new-instance v3, Lcom/sauzask/nicoid/NicoidVideoInfoFragment$i$b;

    invoke-direct {v3, p0, v4}, Lcom/sauzask/nicoid/NicoidVideoInfoFragment$i$b;-><init>(Lcom/sauzask/nicoid/NicoidVideoInfoFragment$i;Landroid/content/Intent;)V

    goto :goto_a4

    :cond_7c
    iget-object v1, p0, Lcom/sauzask/nicoid/NicoidVideoInfoFragment$i;->a:Ljava/lang/String;

    invoke-virtual {p1, v1}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    iget-object v1, p0, Lcom/sauzask/nicoid/NicoidVideoInfoFragment$i;->b:Lcom/sauzask/nicoid/NicoidVideoInfoFragment;

    .line 7
    iget-object v1, v1, Lcom/sauzask/nicoid/NicoidVideoInfoFragment;->b0:Landroid/app/Activity;

    const v3, 0x7f0f01f1

    .line 8
    invoke-virtual {v1, v3}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v1

    new-instance v3, Lcom/sauzask/nicoid/NicoidVideoInfoFragment$i$c;

    invoke-direct {v3, p0}, Lcom/sauzask/nicoid/NicoidVideoInfoFragment$i$c;-><init>(Lcom/sauzask/nicoid/NicoidVideoInfoFragment$i;)V

    invoke-virtual {p1, v1, v3}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    iget-object v1, p0, Lcom/sauzask/nicoid/NicoidVideoInfoFragment$i;->b:Lcom/sauzask/nicoid/NicoidVideoInfoFragment;

    .line 9
    iget-object v1, v1, Lcom/sauzask/nicoid/NicoidVideoInfoFragment;->b0:Landroid/app/Activity;

    const v3, 0x7f0f01f0

    .line 10
    invoke-virtual {v1, v3}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v1

    new-instance v3, Lcom/sauzask/nicoid/NicoidVideoInfoFragment$i$d;

    invoke-direct {v3, p0}, Lcom/sauzask/nicoid/NicoidVideoInfoFragment$i$d;-><init>(Lcom/sauzask/nicoid/NicoidVideoInfoFragment$i;)V

    :goto_a4
    invoke-virtual {p1, v1, v3}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    iget-object v1, p0, Lcom/sauzask/nicoid/NicoidVideoInfoFragment$i;->b:Lcom/sauzask/nicoid/NicoidVideoInfoFragment;

    .line 11
    iget-object v1, v1, Lcom/sauzask/nicoid/NicoidVideoInfoFragment;->g0:Le/e/a/l3/g;

    const/4 v3, 0x1

    const/4 v4, 0x0

    if-eqz v1, :cond_b1

    const/4 v1, 0x1

    goto :goto_b2

    :cond_b1
    const/4 v1, 0x0

    .line 12
    :goto_b2
    iget-object v5, p0, Lcom/sauzask/nicoid/NicoidVideoInfoFragment$i;->b:Lcom/sauzask/nicoid/NicoidVideoInfoFragment;

    .line 13
    iget-object v5, v5, Lcom/sauzask/nicoid/NicoidVideoInfoFragment;->g0:Le/e/a/l3/g;

    if-nez v5, :cond_bc

    if-eqz v0, :cond_bc

    const/4 v0, 0x1

    goto :goto_bd

    :cond_bc
    const/4 v0, 0x0

    :goto_bd
    or-int/2addr v0, v1

    const/4 v1, 0x2

    if-eqz v0, :cond_d3

    .line 14
    invoke-virtual {p1}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object p1

    invoke-virtual {p1, v3}, Landroid/app/AlertDialog;->setCanceledOnTouchOutside(Z)V

    invoke-virtual {p1}, Landroid/app/AlertDialog;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0, v4, v1}, Landroid/view/Window;->setFlags(II)V

    invoke-static {p1}, Le/e/a/PlaybackSession;->showDialog(Landroid/app/AlertDialog;)V

    goto :goto_116

    :cond_d3
    const/4 p1, 0x4

    new-array p1, p1, [I

    aput v3, p1, v4

    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidVideoInfoFragment$i;->b:Lcom/sauzask/nicoid/NicoidVideoInfoFragment;

    .line 15
    iget-object v0, v0, Lcom/sauzask/nicoid/NicoidVideoInfoFragment;->n0:Landroid/content/SharedPreferences;

    const-string v5, "search_Sort"

    .line 16
    invoke-interface {v0, v5, v4}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v0

    aput v0, p1, v3

    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidVideoInfoFragment$i;->b:Lcom/sauzask/nicoid/NicoidVideoInfoFragment;

    .line 17
    iget-object v0, v0, Lcom/sauzask/nicoid/NicoidVideoInfoFragment;->n0:Landroid/content/SharedPreferences;

    const-string v3, "search_Time"

    .line 18
    invoke-interface {v0, v3, v4}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v0

    aput v0, p1, v1

    const/4 v0, 0x3

    iget-object v1, p0, Lcom/sauzask/nicoid/NicoidVideoInfoFragment$i;->b:Lcom/sauzask/nicoid/NicoidVideoInfoFragment;

    .line 19
    iget-object v1, v1, Lcom/sauzask/nicoid/NicoidVideoInfoFragment;->n0:Landroid/content/SharedPreferences;

    const-string v3, "search_Date"

    .line 20
    invoke-interface {v1, v3, v4}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v1

    aput v1, p1, v0

    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidVideoInfoFragment$i;->a:Ljava/lang/String;

    invoke-static {p1, v0}, Le/e/a/v0;->a([ILjava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Le/e/a/CachePlayback;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p1

    const-string v0, "com.sauzask.nicoid.hls"

    const-string v1, "com.sauzask.nicoid.NicoidVideoListActivity"

    invoke-static {v2, p1, v0, v1}, Le/b/a/a/a;->a(Ljava/lang/String;Landroid/net/Uri;Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object p1

    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidVideoInfoFragment$i;->b:Lcom/sauzask/nicoid/NicoidVideoInfoFragment;

    .line 21
    iget-object v0, v0, Lcom/sauzask/nicoid/NicoidVideoInfoFragment;->b0:Landroid/app/Activity;

    .line 22
    invoke-virtual {v0, p1}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V

    :goto_116
    return-void
.end method

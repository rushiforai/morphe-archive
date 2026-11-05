.class public Lcom/sauzask/nicoid/NicoidVideoInfoFragment$h;
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
.field public final synthetic a:Lcom/sauzask/nicoid/NicoidVideoInfoFragment;


# direct methods
.method public constructor <init>(Lcom/sauzask/nicoid/NicoidVideoInfoFragment;)V
    .registers 2

    iput-object p1, p0, Lcom/sauzask/nicoid/NicoidVideoInfoFragment$h;->a:Lcom/sauzask/nicoid/NicoidVideoInfoFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .registers 6

    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidVideoInfoFragment$h;->a:Lcom/sauzask/nicoid/NicoidVideoInfoFragment;

    iget-object v1, v0, Lcom/sauzask/nicoid/NicoidVideoInfoFragment;->i0:Landroid/os/Bundle;

    if-eqz v1, :cond_60

    const-string v2, "videoUserId"

    invoke-virtual {v1, v2}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_15

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v3

    if-lez v3, :cond_15

    goto :goto_2f

    :cond_15
    sget-object v2, Le/e/a/ModernPlayback;->latestWatch:Lorg/json/JSONObject;

    if-eqz v2, :cond_36

    const-string v3, "owner"

    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v2

    if-eqz v2, :cond_36

    const-string v3, "id"

    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_36

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v3

    if-lez v3, :cond_36

    :goto_2f
    const-string v1, "https://www.nicovideo.jp/user/"

    invoke-virtual {v1, v2}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    goto :goto_3e

    :cond_36
    const-string v2, "channelVideoURL"

    invoke-virtual {v1, v2}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_60

    :goto_3e
    invoke-static {v1}, Le/e/a/CachePlayback;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    new-instance v2, Landroid/content/Intent;

    const-string v3, "android.intent.action.VIEW"

    invoke-direct {v2, v3, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    iget-object v1, v0, Lcom/sauzask/nicoid/NicoidVideoInfoFragment;->b0:Landroid/app/Activity;

    const-class v3, Lcom/sauzask/nicoid/NicoidUserVideoListActivity;

    invoke-virtual {v2, v1, v3}, Landroid/content/Intent;->setClass(Landroid/content/Context;Ljava/lang/Class;)Landroid/content/Intent;

    iget-object v3, v0, Lcom/sauzask/nicoid/NicoidVideoInfoFragment;->i0:Landroid/os/Bundle;

    const-string v0, "nickname"

    invoke-virtual {v3, v0}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const-string v0, "uploader_name"

    invoke-virtual {v2, v0, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    invoke-virtual {v1, v2}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V

    :cond_60
    return-void
.end method

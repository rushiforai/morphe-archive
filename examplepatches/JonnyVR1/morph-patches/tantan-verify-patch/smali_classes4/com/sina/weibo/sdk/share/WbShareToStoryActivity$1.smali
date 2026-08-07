.class Lcom/sina/weibo/sdk/share/WbShareToStoryActivity$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/sina/weibo/sdk/share/TransResourceCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/sina/weibo/sdk/share/WbShareToStoryActivity;->gotoSave(Lcom/sina/weibo/sdk/api/StoryMessage;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/sina/weibo/sdk/share/WbShareToStoryActivity;


# direct methods
.method public constructor <init>(Lcom/sina/weibo/sdk/share/WbShareToStoryActivity;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/sina/weibo/sdk/share/WbShareToStoryActivity$1;->this$0:Lcom/sina/weibo/sdk/share/WbShareToStoryActivity;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onTransFinish(Lcom/sina/weibo/sdk/api/StoryObject;)V
    .locals 4

    .line 1
    const/4 v0, 0x2

    .line 2
    if-eqz p1, :cond_0

    .line 3
    .line 4
    :try_start_0
    new-instance v1, Landroid/content/Intent;

    .line 5
    .line 6
    const-string v2, "android.intent.action.VIEW"

    .line 7
    .line 8
    const-string v3, "sinaweibo://story/publish?forceedit=1&finish=true"

    .line 9
    .line 10
    invoke-static {v3}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 11
    .line 12
    .line 13
    move-result-object v3

    .line 14
    invoke-direct {v1, v2, v3}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 15
    .line 16
    .line 17
    const-string v2, "startPackage"

    .line 18
    .line 19
    invoke-virtual {v1, v2}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v2

    .line 23
    invoke-virtual {v1, v2}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    .line 24
    .line 25
    .line 26
    const-string v2, "storyData"

    .line 27
    .line 28
    invoke-virtual {v1, v2, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 29
    .line 30
    .line 31
    iget-object p1, p0, Lcom/sina/weibo/sdk/share/WbShareToStoryActivity$1;->this$0:Lcom/sina/weibo/sdk/share/WbShareToStoryActivity;

    .line 32
    .line 33
    invoke-virtual {p1, v1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 34
    .line 35
    .line 36
    return-void

    .line 37
    :catch_0
    iget-object p0, p0, Lcom/sina/weibo/sdk/share/WbShareToStoryActivity$1;->this$0:Lcom/sina/weibo/sdk/share/WbShareToStoryActivity;

    .line 38
    .line 39
    invoke-static {p0, v0}, Lcom/sina/weibo/sdk/share/WbShareToStoryActivity;->access$000(Lcom/sina/weibo/sdk/share/WbShareToStoryActivity;I)V

    .line 40
    .line 41
    .line 42
    return-void

    .line 43
    :cond_0
    iget-object p0, p0, Lcom/sina/weibo/sdk/share/WbShareToStoryActivity$1;->this$0:Lcom/sina/weibo/sdk/share/WbShareToStoryActivity;

    .line 44
    .line 45
    invoke-static {p0, v0}, Lcom/sina/weibo/sdk/share/WbShareToStoryActivity;->access$000(Lcom/sina/weibo/sdk/share/WbShareToStoryActivity;I)V

    .line 46
    .line 47
    .line 48
    return-void
.end method

.method public onTransFinish(Lcom/sina/weibo/sdk/share/TransResourceResult;)V
    .locals 0

    .line 49
    return-void
.end method

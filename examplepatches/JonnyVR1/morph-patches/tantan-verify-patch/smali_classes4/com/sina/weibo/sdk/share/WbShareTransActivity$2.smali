.class Lcom/sina/weibo/sdk/share/WbShareTransActivity$2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/sina/weibo/sdk/share/TransResourceCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/sina/weibo/sdk/share/WbShareTransActivity;->transPicAndVideoResource(Lcom/sina/weibo/sdk/api/WeiboMultiMessage;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/sina/weibo/sdk/share/WbShareTransActivity;


# direct methods
.method public constructor <init>(Lcom/sina/weibo/sdk/share/WbShareTransActivity;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/sina/weibo/sdk/share/WbShareTransActivity$2;->this$0:Lcom/sina/weibo/sdk/share/WbShareTransActivity;

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
    .locals 0

    .line 32
    return-void
.end method

.method public onTransFinish(Lcom/sina/weibo/sdk/share/TransResourceResult;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/sina/weibo/sdk/share/WbShareTransActivity$2;->this$0:Lcom/sina/weibo/sdk/share/WbShareTransActivity;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/sina/weibo/sdk/share/WbShareTransActivity;->access$100(Lcom/sina/weibo/sdk/share/WbShareTransActivity;)Landroid/widget/FrameLayout;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const/4 v1, 0x4

    .line 8
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 9
    .line 10
    .line 11
    if-eqz p1, :cond_0

    .line 12
    .line 13
    iget-boolean v0, p1, Lcom/sina/weibo/sdk/share/TransResourceResult;->transDone:Z

    .line 14
    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    iget-object p0, p0, Lcom/sina/weibo/sdk/share/WbShareTransActivity$2;->this$0:Lcom/sina/weibo/sdk/share/WbShareTransActivity;

    .line 18
    .line 19
    iget-object p1, p1, Lcom/sina/weibo/sdk/share/TransResourceResult;->message:Lcom/sina/weibo/sdk/api/WeiboMultiMessage;

    .line 20
    .line 21
    invoke-static {p0, p1}, Lcom/sina/weibo/sdk/share/WbShareTransActivity;->access$200(Lcom/sina/weibo/sdk/share/WbShareTransActivity;Lcom/sina/weibo/sdk/api/WeiboMultiMessage;)V

    .line 22
    .line 23
    .line 24
    return-void

    .line 25
    :cond_0
    iget-object p0, p0, Lcom/sina/weibo/sdk/share/WbShareTransActivity$2;->this$0:Lcom/sina/weibo/sdk/share/WbShareTransActivity;

    .line 26
    .line 27
    const/4 p1, 0x2

    .line 28
    invoke-static {p0, p1}, Lcom/sina/weibo/sdk/share/WbShareTransActivity;->access$000(Lcom/sina/weibo/sdk/share/WbShareTransActivity;I)V

    .line 29
    .line 30
    .line 31
    return-void
.end method

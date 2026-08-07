.class Lcom/sina/weibo/sdk/web/view/WbSdkProgressBar$1;
.super Landroid/os/Handler;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/sina/weibo/sdk/web/view/WbSdkProgressBar;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/sina/weibo/sdk/web/view/WbSdkProgressBar;


# direct methods
.method public constructor <init>(Lcom/sina/weibo/sdk/web/view/WbSdkProgressBar;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/sina/weibo/sdk/web/view/WbSdkProgressBar$1;->this$0:Lcom/sina/weibo/sdk/web/view/WbSdkProgressBar;

    .line 2
    .line 3
    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Landroid/os/Handler;->handleMessage(Landroid/os/Message;)V

    .line 2
    .line 3
    .line 4
    iget p1, p1, Landroid/os/Message;->what:I

    .line 5
    .line 6
    if-eqz p1, :cond_0

    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    iget-object p0, p0, Lcom/sina/weibo/sdk/web/view/WbSdkProgressBar$1;->this$0:Lcom/sina/weibo/sdk/web/view/WbSdkProgressBar;

    .line 10
    .line 11
    const/4 p1, 0x0

    .line 12
    invoke-static {p0, p1}, Lcom/sina/weibo/sdk/web/view/WbSdkProgressBar;->access$002(Lcom/sina/weibo/sdk/web/view/WbSdkProgressBar;Z)Z

    .line 13
    .line 14
    .line 15
    return-void
.end method

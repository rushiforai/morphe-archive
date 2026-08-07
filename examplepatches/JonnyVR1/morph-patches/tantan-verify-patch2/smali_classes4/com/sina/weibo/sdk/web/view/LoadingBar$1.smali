.class Lcom/sina/weibo/sdk/web/view/LoadingBar$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/sina/weibo/sdk/web/view/LoadingBar;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/sina/weibo/sdk/web/view/LoadingBar;


# direct methods
.method public constructor <init>(Lcom/sina/weibo/sdk/web/view/LoadingBar;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/sina/weibo/sdk/web/view/LoadingBar$1;->this$0:Lcom/sina/weibo/sdk/web/view/LoadingBar;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/sina/weibo/sdk/web/view/LoadingBar$1;->this$0:Lcom/sina/weibo/sdk/web/view/LoadingBar;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/sina/weibo/sdk/web/view/LoadingBar;->access$008(Lcom/sina/weibo/sdk/web/view/LoadingBar;)I

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/sina/weibo/sdk/web/view/LoadingBar$1;->this$0:Lcom/sina/weibo/sdk/web/view/LoadingBar;

    .line 7
    .line 8
    invoke-static {p0}, Lcom/sina/weibo/sdk/web/view/LoadingBar;->access$000(Lcom/sina/weibo/sdk/web/view/LoadingBar;)I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    invoke-virtual {p0, v0}, Lcom/sina/weibo/sdk/web/view/LoadingBar;->drawProgress(I)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

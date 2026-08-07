.class Lcom/sina/weibo/sdk/network/impl/FixRequestTask$RequestCallback;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/os/Handler$Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/sina/weibo/sdk/network/impl/FixRequestTask;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "RequestCallback"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/sina/weibo/sdk/network/impl/FixRequestTask;


# direct methods
.method private constructor <init>(Lcom/sina/weibo/sdk/network/impl/FixRequestTask;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/sina/weibo/sdk/network/impl/FixRequestTask$RequestCallback;->this$0:Lcom/sina/weibo/sdk/network/impl/FixRequestTask;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public synthetic constructor <init>(Lcom/sina/weibo/sdk/network/impl/FixRequestTask;Lcom/sina/weibo/sdk/network/impl/FixRequestTask$1;)V
    .locals 0

    .line 7
    invoke-direct {p0, p1}, Lcom/sina/weibo/sdk/network/impl/FixRequestTask$RequestCallback;-><init>(Lcom/sina/weibo/sdk/network/impl/FixRequestTask;)V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)Z
    .locals 2

    .line 1
    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast p1, Lcom/sina/weibo/sdk/network/base/RequestResult;

    .line 4
    .line 5
    iget-object v0, p0, Lcom/sina/weibo/sdk/network/impl/FixRequestTask$RequestCallback;->this$0:Lcom/sina/weibo/sdk/network/impl/FixRequestTask;

    .line 6
    .line 7
    invoke-static {v0}, Lcom/sina/weibo/sdk/network/impl/FixRequestTask;->access$100(Lcom/sina/weibo/sdk/network/impl/FixRequestTask;)Lcom/sina/weibo/sdk/network/target/Target;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    if-eqz v0, :cond_1

    .line 12
    .line 13
    iget-object v0, p0, Lcom/sina/weibo/sdk/network/impl/FixRequestTask$RequestCallback;->this$0:Lcom/sina/weibo/sdk/network/impl/FixRequestTask;

    .line 14
    .line 15
    invoke-static {v0}, Lcom/sina/weibo/sdk/network/impl/FixRequestTask;->access$100(Lcom/sina/weibo/sdk/network/impl/FixRequestTask;)Lcom/sina/weibo/sdk/network/target/Target;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-interface {v0}, Lcom/sina/weibo/sdk/network/target/Target;->onRequestDone()V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p1}, Lcom/sina/weibo/sdk/network/base/RequestResult;->getE()Ljava/lang/Exception;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    iget-object v1, p0, Lcom/sina/weibo/sdk/network/impl/FixRequestTask$RequestCallback;->this$0:Lcom/sina/weibo/sdk/network/impl/FixRequestTask;

    .line 27
    .line 28
    if-eqz v0, :cond_0

    .line 29
    .line 30
    invoke-static {v1}, Lcom/sina/weibo/sdk/network/impl/FixRequestTask;->access$100(Lcom/sina/weibo/sdk/network/impl/FixRequestTask;)Lcom/sina/weibo/sdk/network/target/Target;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    invoke-virtual {p1}, Lcom/sina/weibo/sdk/network/base/RequestResult;->getE()Ljava/lang/Exception;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    invoke-interface {v0, p1}, Lcom/sina/weibo/sdk/network/target/Target;->onFailure(Ljava/lang/Exception;)V

    .line 39
    .line 40
    .line 41
    iget-object p0, p0, Lcom/sina/weibo/sdk/network/impl/FixRequestTask$RequestCallback;->this$0:Lcom/sina/weibo/sdk/network/impl/FixRequestTask;

    .line 42
    .line 43
    invoke-static {p0}, Lcom/sina/weibo/sdk/network/impl/FixRequestTask;->access$100(Lcom/sina/weibo/sdk/network/impl/FixRequestTask;)Lcom/sina/weibo/sdk/network/target/Target;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    invoke-interface {p0}, Lcom/sina/weibo/sdk/network/target/Target;->onError()V

    .line 48
    .line 49
    .line 50
    goto :goto_0

    .line 51
    :cond_0
    invoke-static {v1}, Lcom/sina/weibo/sdk/network/impl/FixRequestTask;->access$100(Lcom/sina/weibo/sdk/network/impl/FixRequestTask;)Lcom/sina/weibo/sdk/network/target/Target;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    invoke-virtual {p1}, Lcom/sina/weibo/sdk/network/base/RequestResult;->getResponse()Ljava/lang/Object;

    .line 56
    .line 57
    .line 58
    move-result-object p1

    .line 59
    invoke-interface {p0, p1}, Lcom/sina/weibo/sdk/network/target/Target;->onRequestSuccess(Ljava/lang/Object;)V

    .line 60
    .line 61
    .line 62
    :cond_1
    :goto_0
    const/4 p0, 0x0

    .line 63
    return p0
.end method

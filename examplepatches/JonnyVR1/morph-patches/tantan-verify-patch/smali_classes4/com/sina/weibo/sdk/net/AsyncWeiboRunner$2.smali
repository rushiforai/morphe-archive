.class Lcom/sina/weibo/sdk/net/AsyncWeiboRunner$2;
.super Ljava/lang/Thread;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/sina/weibo/sdk/net/AsyncWeiboRunner;->request4RdirectURL(Ljava/lang/String;Lcom/sina/weibo/sdk/net/WeiboParameters;Ljava/lang/String;Lcom/sina/weibo/sdk/net/RequestListener;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/sina/weibo/sdk/net/AsyncWeiboRunner;

.field final synthetic val$httpMethod:Ljava/lang/String;

.field final synthetic val$listener:Lcom/sina/weibo/sdk/net/RequestListener;

.field final synthetic val$params:Lcom/sina/weibo/sdk/net/WeiboParameters;

.field final synthetic val$url:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/sina/weibo/sdk/net/AsyncWeiboRunner;Ljava/lang/String;Ljava/lang/String;Lcom/sina/weibo/sdk/net/WeiboParameters;Lcom/sina/weibo/sdk/net/RequestListener;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/sina/weibo/sdk/net/AsyncWeiboRunner$2;->this$0:Lcom/sina/weibo/sdk/net/AsyncWeiboRunner;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/sina/weibo/sdk/net/AsyncWeiboRunner$2;->val$url:Ljava/lang/String;

    .line 4
    .line 5
    iput-object p3, p0, Lcom/sina/weibo/sdk/net/AsyncWeiboRunner$2;->val$httpMethod:Ljava/lang/String;

    .line 6
    .line 7
    iput-object p4, p0, Lcom/sina/weibo/sdk/net/AsyncWeiboRunner$2;->val$params:Lcom/sina/weibo/sdk/net/WeiboParameters;

    .line 8
    .line 9
    iput-object p5, p0, Lcom/sina/weibo/sdk/net/AsyncWeiboRunner$2;->val$listener:Lcom/sina/weibo/sdk/net/RequestListener;

    .line 10
    .line 11
    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    .line 12
    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .line 1
    :try_start_0
    iget-object v0, p0, Lcom/sina/weibo/sdk/net/AsyncWeiboRunner$2;->this$0:Lcom/sina/weibo/sdk/net/AsyncWeiboRunner;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/sina/weibo/sdk/net/AsyncWeiboRunner;->access$000(Lcom/sina/weibo/sdk/net/AsyncWeiboRunner;)Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v1, p0, Lcom/sina/weibo/sdk/net/AsyncWeiboRunner$2;->val$url:Ljava/lang/String;

    .line 8
    .line 9
    iget-object v2, p0, Lcom/sina/weibo/sdk/net/AsyncWeiboRunner$2;->val$httpMethod:Ljava/lang/String;

    .line 10
    .line 11
    iget-object v3, p0, Lcom/sina/weibo/sdk/net/AsyncWeiboRunner$2;->val$params:Lcom/sina/weibo/sdk/net/WeiboParameters;

    .line 12
    .line 13
    invoke-static {v0, v1, v2, v3}, Lcom/sina/weibo/sdk/net/HttpManager;->openRedirectUrl4LocationUri(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Lcom/sina/weibo/sdk/net/WeiboParameters;)Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    iget-object v1, p0, Lcom/sina/weibo/sdk/net/AsyncWeiboRunner$2;->val$listener:Lcom/sina/weibo/sdk/net/RequestListener;

    .line 18
    .line 19
    if-eqz v1, :cond_0

    .line 20
    .line 21
    invoke-interface {v1, v0}, Lcom/sina/weibo/sdk/net/RequestListener;->onComplete(Ljava/lang/String;)V
    :try_end_0
    .catch Lcom/sina/weibo/sdk/exception/WeiboException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 22
    .line 23
    .line 24
    return-void

    .line 25
    :catch_0
    move-exception v0

    .line 26
    goto :goto_0

    .line 27
    :catchall_0
    move-exception p0

    .line 28
    throw p0

    .line 29
    :goto_0
    iget-object p0, p0, Lcom/sina/weibo/sdk/net/AsyncWeiboRunner$2;->val$listener:Lcom/sina/weibo/sdk/net/RequestListener;

    .line 30
    .line 31
    if-eqz p0, :cond_0

    .line 32
    .line 33
    invoke-interface {p0, v0}, Lcom/sina/weibo/sdk/net/RequestListener;->onWeiboException(Lcom/sina/weibo/sdk/exception/WeiboException;)V

    .line 34
    .line 35
    .line 36
    :cond_0
    return-void
.end method

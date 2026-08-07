.class Lcom/sina/weibo/sdk/web/WeiboSdkWebActivity$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/sina/weibo/sdk/web/param/BaseWebViewRequestParam$ExtraTaskCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/sina/weibo/sdk/web/WeiboSdkWebActivity;->initLoad()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/sina/weibo/sdk/web/WeiboSdkWebActivity;


# direct methods
.method public constructor <init>(Lcom/sina/weibo/sdk/web/WeiboSdkWebActivity;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/sina/weibo/sdk/web/WeiboSdkWebActivity$1;->this$0:Lcom/sina/weibo/sdk/web/WeiboSdkWebActivity;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onComplete(Ljava/lang/String;)V
    .locals 1

    .line 1
    const-string p1, "Share"

    .line 2
    .line 3
    const-string v0, "WebActivity.sharePic.onComplete()"

    .line 4
    .line 5
    invoke-static {p1, v0}, Lcom/sina/weibo/sdk/utils/LogUtil;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object p1, p0, Lcom/sina/weibo/sdk/web/WeiboSdkWebActivity$1;->this$0:Lcom/sina/weibo/sdk/web/WeiboSdkWebActivity;

    .line 9
    .line 10
    invoke-static {p1}, Lcom/sina/weibo/sdk/web/WeiboSdkWebActivity;->access$000(Lcom/sina/weibo/sdk/web/WeiboSdkWebActivity;)Lcom/sina/weibo/sdk/web/param/BaseWebViewRequestParam;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {v0}, Lcom/sina/weibo/sdk/web/param/BaseWebViewRequestParam;->getRequestUrl()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-static {p1, v0}, Lcom/sina/weibo/sdk/web/WeiboSdkWebActivity;->access$100(Lcom/sina/weibo/sdk/web/WeiboSdkWebActivity;Ljava/lang/String;)Z

    .line 19
    .line 20
    .line 21
    move-result p1

    .line 22
    if-eqz p1, :cond_0

    .line 23
    .line 24
    iget-object p1, p0, Lcom/sina/weibo/sdk/web/WeiboSdkWebActivity$1;->this$0:Lcom/sina/weibo/sdk/web/WeiboSdkWebActivity;

    .line 25
    .line 26
    invoke-static {p1}, Lcom/sina/weibo/sdk/web/WeiboSdkWebActivity;->access$200(Lcom/sina/weibo/sdk/web/WeiboSdkWebActivity;)Landroid/webkit/WebView;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    iget-object p0, p0, Lcom/sina/weibo/sdk/web/WeiboSdkWebActivity$1;->this$0:Lcom/sina/weibo/sdk/web/WeiboSdkWebActivity;

    .line 31
    .line 32
    invoke-static {p0}, Lcom/sina/weibo/sdk/web/WeiboSdkWebActivity;->access$000(Lcom/sina/weibo/sdk/web/WeiboSdkWebActivity;)Lcom/sina/weibo/sdk/web/param/BaseWebViewRequestParam;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    invoke-virtual {p0}, Lcom/sina/weibo/sdk/web/param/BaseWebViewRequestParam;->getRequestUrl()Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    invoke-virtual {p1, p0}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    :cond_0
    return-void
.end method

.method public onException(Ljava/lang/String;)V
    .locals 2

    .line 1
    const-string p1, "Share"

    .line 2
    .line 3
    const-string v0, "WebActivity.sharePic.onException()"

    .line 4
    .line 5
    invoke-static {p1, v0}, Lcom/sina/weibo/sdk/utils/LogUtil;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object p1, p0, Lcom/sina/weibo/sdk/web/WeiboSdkWebActivity$1;->this$0:Lcom/sina/weibo/sdk/web/WeiboSdkWebActivity;

    .line 9
    .line 10
    invoke-static {p1}, Lcom/sina/weibo/sdk/web/WeiboSdkWebActivity;->access$300(Lcom/sina/weibo/sdk/web/WeiboSdkWebActivity;)Lcom/sina/weibo/sdk/web/client/BaseWebViewClient;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    iget-object v0, p0, Lcom/sina/weibo/sdk/web/WeiboSdkWebActivity$1;->this$0:Lcom/sina/weibo/sdk/web/WeiboSdkWebActivity;

    .line 15
    .line 16
    const-string v1, "pic upload error"

    .line 17
    .line 18
    invoke-virtual {p1, v0, v1}, Lcom/sina/weibo/sdk/web/client/BaseWebViewClient;->errorBack(Landroid/app/Activity;Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    iget-object p0, p0, Lcom/sina/weibo/sdk/web/WeiboSdkWebActivity$1;->this$0:Lcom/sina/weibo/sdk/web/WeiboSdkWebActivity;

    .line 22
    .line 23
    invoke-virtual {p0}, Landroid/app/Activity;->finish()V

    .line 24
    .line 25
    .line 26
    return-void
.end method

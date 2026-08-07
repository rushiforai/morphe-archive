.class Lcom/sina/weibo/sdk/web/WeiboSdkWebActivity$3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/sina/weibo/sdk/web/WeiboSdkWebActivity;->initView()Landroid/view/View;
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
    iput-object p1, p0, Lcom/sina/weibo/sdk/web/WeiboSdkWebActivity$3;->this$0:Lcom/sina/weibo/sdk/web/WeiboSdkWebActivity;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p1, p0, Lcom/sina/weibo/sdk/web/WeiboSdkWebActivity$3;->this$0:Lcom/sina/weibo/sdk/web/WeiboSdkWebActivity;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-static {p1, v0}, Lcom/sina/weibo/sdk/web/WeiboSdkWebActivity;->access$602(Lcom/sina/weibo/sdk/web/WeiboSdkWebActivity;I)I

    .line 5
    .line 6
    .line 7
    iget-object p1, p0, Lcom/sina/weibo/sdk/web/WeiboSdkWebActivity$3;->this$0:Lcom/sina/weibo/sdk/web/WeiboSdkWebActivity;

    .line 8
    .line 9
    invoke-static {p1}, Lcom/sina/weibo/sdk/web/WeiboSdkWebActivity;->access$700(Lcom/sina/weibo/sdk/web/WeiboSdkWebActivity;)V

    .line 10
    .line 11
    .line 12
    iget-object p0, p0, Lcom/sina/weibo/sdk/web/WeiboSdkWebActivity$3;->this$0:Lcom/sina/weibo/sdk/web/WeiboSdkWebActivity;

    .line 13
    .line 14
    invoke-static {p0}, Lcom/sina/weibo/sdk/web/WeiboSdkWebActivity;->access$200(Lcom/sina/weibo/sdk/web/WeiboSdkWebActivity;)Landroid/webkit/WebView;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    invoke-virtual {p0}, Landroid/webkit/WebView;->reload()V

    .line 19
    .line 20
    .line 21
    return-void
.end method

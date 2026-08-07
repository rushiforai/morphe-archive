.class Lcom/sina/weibo/sdk/web/WeiboSdkWebActivity$2;
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
    iput-object p1, p0, Lcom/sina/weibo/sdk/web/WeiboSdkWebActivity$2;->this$0:Lcom/sina/weibo/sdk/web/WeiboSdkWebActivity;

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
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/sina/weibo/sdk/web/WeiboSdkWebActivity$2;->this$0:Lcom/sina/weibo/sdk/web/WeiboSdkWebActivity;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/sina/weibo/sdk/web/WeiboSdkWebActivity;->access$300(Lcom/sina/weibo/sdk/web/WeiboSdkWebActivity;)Lcom/sina/weibo/sdk/web/client/BaseWebViewClient;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-virtual {p1}, Lcom/sina/weibo/sdk/web/client/BaseWebViewClient;->closeWeb()V

    .line 8
    .line 9
    .line 10
    iget-object p0, p0, Lcom/sina/weibo/sdk/web/WeiboSdkWebActivity$2;->this$0:Lcom/sina/weibo/sdk/web/WeiboSdkWebActivity;

    .line 11
    .line 12
    invoke-static {p0}, Lcom/sina/weibo/sdk/web/WeiboSdkWebActivity;->access$400(Lcom/sina/weibo/sdk/web/WeiboSdkWebActivity;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

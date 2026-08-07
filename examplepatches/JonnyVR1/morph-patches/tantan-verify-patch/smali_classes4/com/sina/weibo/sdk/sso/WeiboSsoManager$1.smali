.class Lcom/sina/weibo/sdk/sso/WeiboSsoManager$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/weibo/ssosdk/a;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/sina/weibo/sdk/sso/WeiboSsoManager;->initAid()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/sina/weibo/sdk/sso/WeiboSsoManager;


# direct methods
.method public constructor <init>(Lcom/sina/weibo/sdk/sso/WeiboSsoManager;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/sina/weibo/sdk/sso/WeiboSsoManager$1;->this$0:Lcom/sina/weibo/sdk/sso/WeiboSsoManager;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public handler(Lcom/weibo/ssosdk/WeiboSsoSdk$d;)V
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iget-object p0, p0, Lcom/sina/weibo/sdk/sso/WeiboSsoManager$1;->this$0:Lcom/sina/weibo/sdk/sso/WeiboSsoManager;

    .line 4
    .line 5
    invoke-virtual {p1}, Lcom/weibo/ssosdk/WeiboSsoSdk$d;->a()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-static {p0, p1}, Lcom/sina/weibo/sdk/sso/WeiboSsoManager;->access$202(Lcom/sina/weibo/sdk/sso/WeiboSsoManager;Ljava/lang/String;)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    const-string p0, "WeiboSsoManager"

    .line 14
    .line 15
    const-string p1, "VisitorLoginInfo is null."

    .line 16
    .line 17
    invoke-static {p0, p1}, Lcom/sina/weibo/sdk/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

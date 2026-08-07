.class Lcom/tencent/connect/api/QQAuthManage$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/tencent/tauth/IUiListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tencent/connect/api/QQAuthManage;->gotoManagePage(Landroid/app/Activity;Lcom/tencent/open/apireq/IApiCallback;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Landroid/app/Activity;

.field final synthetic b:Lcom/tencent/open/apireq/IApiCallback;

.field final synthetic c:Lcom/tencent/connect/api/QQAuthManage$Resp;

.field final synthetic d:Lcom/tencent/connect/api/QQAuthManage;


# direct methods
.method public constructor <init>(Lcom/tencent/connect/api/QQAuthManage;Landroid/app/Activity;Lcom/tencent/open/apireq/IApiCallback;Lcom/tencent/connect/api/QQAuthManage$Resp;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/connect/api/QQAuthManage$1;->d:Lcom/tencent/connect/api/QQAuthManage;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/tencent/connect/api/QQAuthManage$1;->a:Landroid/app/Activity;

    .line 4
    .line 5
    iput-object p3, p0, Lcom/tencent/connect/api/QQAuthManage$1;->b:Lcom/tencent/open/apireq/IApiCallback;

    .line 6
    .line 7
    iput-object p4, p0, Lcom/tencent/connect/api/QQAuthManage$1;->c:Lcom/tencent/connect/api/QQAuthManage$Resp;

    .line 8
    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 10
    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public onCancel()V
    .locals 0

    return-void
.end method

.method public onComplete(Ljava/lang/Object;)V
    .locals 2

    .line 1
    instance-of v0, p1, Lorg/json/JSONObject;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    check-cast p1, Lorg/json/JSONObject;

    .line 6
    .line 7
    const-string v0, "ret"

    .line 8
    .line 9
    const/4 v1, -0x1

    .line 10
    invoke-virtual {p1, v0, v1}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    .line 11
    .line 12
    .line 13
    move-result p1

    .line 14
    if-nez p1, :cond_0

    .line 15
    .line 16
    iget-object p1, p0, Lcom/tencent/connect/api/QQAuthManage$1;->d:Lcom/tencent/connect/api/QQAuthManage;

    .line 17
    .line 18
    iget-object v0, p0, Lcom/tencent/connect/api/QQAuthManage$1;->a:Landroid/app/Activity;

    .line 19
    .line 20
    iget-object p0, p0, Lcom/tencent/connect/api/QQAuthManage$1;->b:Lcom/tencent/open/apireq/IApiCallback;

    .line 21
    .line 22
    invoke-static {p1, v0, p0}, Lcom/tencent/connect/api/QQAuthManage;->a(Lcom/tencent/connect/api/QQAuthManage;Landroid/app/Activity;Lcom/tencent/open/apireq/IApiCallback;)V

    .line 23
    .line 24
    .line 25
    return-void

    .line 26
    :cond_0
    const-string p1, "QQAuthManage"

    .line 27
    .line 28
    const-string v0, "gotoManagePage: checkLogin not login"

    .line 29
    .line 30
    invoke-static {p1, v0}, Lcom/tencent/open/log/SLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    iget-object p1, p0, Lcom/tencent/connect/api/QQAuthManage$1;->c:Lcom/tencent/connect/api/QQAuthManage$Resp;

    .line 34
    .line 35
    const/16 v0, -0x7d1

    .line 36
    .line 37
    invoke-virtual {p1, v0}, Lcom/tencent/open/apireq/BaseResp;->setCode(I)V

    .line 38
    .line 39
    .line 40
    iget-object p1, p0, Lcom/tencent/connect/api/QQAuthManage$1;->b:Lcom/tencent/open/apireq/IApiCallback;

    .line 41
    .line 42
    iget-object p0, p0, Lcom/tencent/connect/api/QQAuthManage$1;->c:Lcom/tencent/connect/api/QQAuthManage$Resp;

    .line 43
    .line 44
    invoke-interface {p1, p0}, Lcom/tencent/open/apireq/IApiCallback;->onResp(Lcom/tencent/open/apireq/BaseResp;)V

    .line 45
    .line 46
    .line 47
    :cond_1
    return-void
.end method

.method public onError(Lcom/tencent/tauth/UiError;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/tencent/connect/api/QQAuthManage$1;->c:Lcom/tencent/connect/api/QQAuthManage$Resp;

    .line 2
    .line 3
    iget v1, p1, Lcom/tencent/tauth/UiError;->errorCode:I

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Lcom/tencent/open/apireq/BaseResp;->setCode(I)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/tencent/connect/api/QQAuthManage$1;->c:Lcom/tencent/connect/api/QQAuthManage$Resp;

    .line 9
    .line 10
    iget-object p1, p1, Lcom/tencent/tauth/UiError;->errorMessage:Ljava/lang/String;

    .line 11
    .line 12
    invoke-virtual {v0, p1}, Lcom/tencent/open/apireq/BaseResp;->setErrorMsg(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    new-instance p1, Ljava/lang/StringBuilder;

    .line 16
    .line 17
    const-string v0, "gotoManagePage: checkLogin error. "

    .line 18
    .line 19
    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Lcom/tencent/connect/api/QQAuthManage$1;->c:Lcom/tencent/connect/api/QQAuthManage$Resp;

    .line 23
    .line 24
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    const-string v0, "QQAuthManage"

    .line 32
    .line 33
    invoke-static {v0, p1}, Lcom/tencent/open/log/SLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    iget-object p1, p0, Lcom/tencent/connect/api/QQAuthManage$1;->b:Lcom/tencent/open/apireq/IApiCallback;

    .line 37
    .line 38
    iget-object p0, p0, Lcom/tencent/connect/api/QQAuthManage$1;->c:Lcom/tencent/connect/api/QQAuthManage$Resp;

    .line 39
    .line 40
    invoke-interface {p1, p0}, Lcom/tencent/open/apireq/IApiCallback;->onResp(Lcom/tencent/open/apireq/BaseResp;)V

    .line 41
    .line 42
    .line 43
    return-void
.end method

.method public onWarning(I)V
    .locals 0

    return-void
.end method

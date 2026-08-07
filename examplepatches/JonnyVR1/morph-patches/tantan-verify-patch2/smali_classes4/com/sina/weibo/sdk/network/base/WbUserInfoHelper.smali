.class public Lcom/sina/weibo/sdk/network/base/WbUserInfoHelper;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static userInfoHelper:Lcom/sina/weibo/sdk/network/base/WbUserInfoHelper;


# instance fields
.field private userInfo:Lcom/sina/weibo/sdk/network/base/WbUserInfo;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static getInstance()Lcom/sina/weibo/sdk/network/base/WbUserInfoHelper;
    .locals 1

    .line 1
    sget-object v0, Lcom/sina/weibo/sdk/network/base/WbUserInfoHelper;->userInfoHelper:Lcom/sina/weibo/sdk/network/base/WbUserInfoHelper;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Lcom/sina/weibo/sdk/network/base/WbUserInfoHelper;

    .line 6
    .line 7
    invoke-direct {v0}, Lcom/sina/weibo/sdk/network/base/WbUserInfoHelper;-><init>()V

    .line 8
    .line 9
    .line 10
    sput-object v0, Lcom/sina/weibo/sdk/network/base/WbUserInfoHelper;->userInfoHelper:Lcom/sina/weibo/sdk/network/base/WbUserInfoHelper;

    .line 11
    .line 12
    :cond_0
    sget-object v0, Lcom/sina/weibo/sdk/network/base/WbUserInfoHelper;->userInfoHelper:Lcom/sina/weibo/sdk/network/base/WbUserInfoHelper;

    .line 13
    .line 14
    return-object v0
.end method


# virtual methods
.method public clearUserInfo()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lcom/sina/weibo/sdk/network/base/WbUserInfoHelper;->userInfo:Lcom/sina/weibo/sdk/network/base/WbUserInfo;

    .line 3
    .line 4
    return-void
.end method

.method public getUserInfo(Landroid/content/Context;)Lcom/sina/weibo/sdk/network/base/WbUserInfo;
    .locals 4

    .line 1
    const/4 v0, 0x0

    .line 2
    if-nez p1, :cond_0

    .line 3
    .line 4
    return-object v0

    .line 5
    :cond_0
    iget-object v1, p0, Lcom/sina/weibo/sdk/network/base/WbUserInfoHelper;->userInfo:Lcom/sina/weibo/sdk/network/base/WbUserInfo;

    .line 6
    .line 7
    if-nez v1, :cond_1

    .line 8
    .line 9
    const-string v1, "wb_sdk_user_key"

    .line 10
    .line 11
    const/4 v2, 0x0

    .line 12
    invoke-virtual {p1, v1, v2}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    const-string v1, "uid"

    .line 17
    .line 18
    invoke-interface {p1, v1, v0}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    const-string v2, "gsid"

    .line 23
    .line 24
    invoke-interface {p1, v2, v0}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v2

    .line 28
    const-string v3, "token"

    .line 29
    .line 30
    invoke-interface {p1, v3, v0}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 35
    .line 36
    .line 37
    move-result v0

    .line 38
    if-nez v0, :cond_1

    .line 39
    .line 40
    new-instance v0, Lcom/sina/weibo/sdk/network/base/WbUserInfo;

    .line 41
    .line 42
    invoke-direct {v0, v2, v1, p1}, Lcom/sina/weibo/sdk/network/base/WbUserInfo;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 43
    .line 44
    .line 45
    iput-object v0, p0, Lcom/sina/weibo/sdk/network/base/WbUserInfoHelper;->userInfo:Lcom/sina/weibo/sdk/network/base/WbUserInfo;

    .line 46
    .line 47
    :cond_1
    iget-object p0, p0, Lcom/sina/weibo/sdk/network/base/WbUserInfoHelper;->userInfo:Lcom/sina/weibo/sdk/network/base/WbUserInfo;

    .line 48
    .line 49
    return-object p0
.end method

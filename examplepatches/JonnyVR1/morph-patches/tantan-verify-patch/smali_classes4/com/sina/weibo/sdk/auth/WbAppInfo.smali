.class public Lcom/sina/weibo/sdk/auth/WbAppInfo;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private authActivityName:Ljava/lang/String;

.field private packageName:Ljava/lang/String;

.field private supportVersion:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string v0, "com.sina.weibo"

    .line 5
    .line 6
    iput-object v0, p0, Lcom/sina/weibo/sdk/auth/WbAppInfo;->packageName:Ljava/lang/String;

    .line 7
    .line 8
    const-string v0, "com.sina.weibo.SSOActivity"

    .line 9
    .line 10
    iput-object v0, p0, Lcom/sina/weibo/sdk/auth/WbAppInfo;->authActivityName:Ljava/lang/String;

    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public getAuthActivityName()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/sina/weibo/sdk/auth/WbAppInfo;->authActivityName:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getPackageName()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/sina/weibo/sdk/auth/WbAppInfo;->packageName:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getSupportVersion()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/sina/weibo/sdk/auth/WbAppInfo;->supportVersion:I

    .line 2
    .line 3
    return p0
.end method

.method public isLegal()Z
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/sina/weibo/sdk/auth/WbAppInfo;->packageName:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget p0, p0, Lcom/sina/weibo/sdk/auth/WbAppInfo;->supportVersion:I

    .line 10
    .line 11
    if-lez p0, :cond_0

    .line 12
    .line 13
    const/4 p0, 0x1

    .line 14
    return p0

    .line 15
    :cond_0
    const/4 p0, 0x0

    .line 16
    return p0
.end method

.method public setAuthActivityName(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/sina/weibo/sdk/auth/WbAppInfo;->authActivityName:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setPackageName(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/sina/weibo/sdk/auth/WbAppInfo;->packageName:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setSupportVersion(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/sina/weibo/sdk/auth/WbAppInfo;->supportVersion:I

    .line 2
    .line 3
    return-void
.end method

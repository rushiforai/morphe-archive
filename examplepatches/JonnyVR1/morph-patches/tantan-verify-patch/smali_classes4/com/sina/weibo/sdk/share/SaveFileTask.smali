.class public Lcom/sina/weibo/sdk/share/SaveFileTask;
.super Landroid/os/AsyncTask;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask<",
        "Lcom/sina/weibo/sdk/api/StoryMessage;",
        "Ljava/lang/Object;",
        "Lcom/sina/weibo/sdk/api/StoryObject;",
        ">;"
    }
.end annotation


# instance fields
.field private mCallback:Lcom/sina/weibo/sdk/share/TransResourceCallback;

.field private mReference:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Landroid/content/Context;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/sina/weibo/sdk/share/TransResourceCallback;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/lang/ref/WeakReference;

    .line 5
    .line 6
    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/sina/weibo/sdk/share/SaveFileTask;->mReference:Ljava/lang/ref/WeakReference;

    .line 10
    .line 11
    iput-object p2, p0, Lcom/sina/weibo/sdk/share/SaveFileTask;->mCallback:Lcom/sina/weibo/sdk/share/TransResourceCallback;

    .line 12
    .line 13
    return-void
.end method

.method private copyFileToWeiboTem(Landroid/content/Context;Landroid/net/Uri;I)Lcom/sina/weibo/sdk/api/StoryObject;
    .locals 0

    .line 1
    invoke-static {p1, p2, p3}, Lcom/sina/weibo/sdk/share/ShareUtils;->copyFileToWeiboTem(Landroid/content/Context;Landroid/net/Uri;I)Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result p2

    .line 9
    if-eqz p2, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    return-object p0

    .line 13
    :cond_0
    new-instance p2, Lcom/sina/weibo/sdk/api/StoryObject;

    .line 14
    .line 15
    invoke-direct {p2}, Lcom/sina/weibo/sdk/api/StoryObject;-><init>()V

    .line 16
    .line 17
    .line 18
    iput-object p0, p2, Lcom/sina/weibo/sdk/api/StoryObject;->sourcePath:Ljava/lang/String;

    .line 19
    .line 20
    iput p3, p2, Lcom/sina/weibo/sdk/api/StoryObject;->sourceType:I

    .line 21
    .line 22
    invoke-static {}, Lcom/sina/weibo/sdk/WbSdk;->getAuthInfo()Lcom/sina/weibo/sdk/auth/AuthInfo;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    invoke-virtual {p0}, Lcom/sina/weibo/sdk/auth/AuthInfo;->getAppKey()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    iput-object p0, p2, Lcom/sina/weibo/sdk/api/StoryObject;->appId:Ljava/lang/String;

    .line 31
    .line 32
    invoke-virtual {p1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    iput-object p0, p2, Lcom/sina/weibo/sdk/api/StoryObject;->appPackage:Ljava/lang/String;

    .line 37
    .line 38
    return-object p2
.end method


# virtual methods
.method public varargs doInBackground([Lcom/sina/weibo/sdk/api/StoryMessage;)Lcom/sina/weibo/sdk/api/StoryObject;
    .locals 5

    .line 1
    const/4 v0, 0x0

    .line 2
    aget-object p1, p1, v0

    .line 3
    .line 4
    const/4 v1, 0x0

    .line 5
    if-nez p1, :cond_0

    .line 6
    .line 7
    return-object v1

    .line 8
    :cond_0
    invoke-virtual {p1}, Lcom/sina/weibo/sdk/api/StoryMessage;->getImageUri()Landroid/net/Uri;

    .line 9
    .line 10
    .line 11
    move-result-object v2

    .line 12
    invoke-virtual {p1}, Lcom/sina/weibo/sdk/api/StoryMessage;->getVideoUri()Landroid/net/Uri;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    iget-object v3, p0, Lcom/sina/weibo/sdk/share/SaveFileTask;->mReference:Ljava/lang/ref/WeakReference;

    .line 17
    .line 18
    invoke-virtual {v3}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object v3

    .line 22
    check-cast v3, Landroid/content/Context;

    .line 23
    .line 24
    if-nez v3, :cond_1

    .line 25
    .line 26
    return-object v1

    .line 27
    :cond_1
    if-eqz v2, :cond_2

    .line 28
    .line 29
    invoke-static {v3, v2}, Lcom/sina/weibo/sdk/utils/FileUtils;->isImageFile(Landroid/content/Context;Landroid/net/Uri;)Z

    .line 30
    .line 31
    .line 32
    move-result v4

    .line 33
    if-eqz v4, :cond_2

    .line 34
    .line 35
    const/4 p1, 0x1

    .line 36
    invoke-direct {p0, v3, v2, p1}, Lcom/sina/weibo/sdk/share/SaveFileTask;->copyFileToWeiboTem(Landroid/content/Context;Landroid/net/Uri;I)Lcom/sina/weibo/sdk/api/StoryObject;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    return-object p0

    .line 41
    :cond_2
    if-eqz p1, :cond_3

    .line 42
    .line 43
    invoke-static {v3, p1}, Lcom/sina/weibo/sdk/utils/FileUtils;->isVideoFile(Landroid/content/Context;Landroid/net/Uri;)Z

    .line 44
    .line 45
    .line 46
    move-result v2

    .line 47
    if-eqz v2, :cond_3

    .line 48
    .line 49
    invoke-direct {p0, v3, p1, v0}, Lcom/sina/weibo/sdk/share/SaveFileTask;->copyFileToWeiboTem(Landroid/content/Context;Landroid/net/Uri;I)Lcom/sina/weibo/sdk/api/StoryObject;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    return-object p0

    .line 54
    :cond_3
    return-object v1
.end method

.method public bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 55
    check-cast p1, [Lcom/sina/weibo/sdk/api/StoryMessage;

    invoke-virtual {p0, p1}, Lcom/sina/weibo/sdk/share/SaveFileTask;->doInBackground([Lcom/sina/weibo/sdk/api/StoryMessage;)Lcom/sina/weibo/sdk/api/StoryObject;

    move-result-object p0

    return-object p0
.end method

.method public onPostExecute(Lcom/sina/weibo/sdk/api/StoryObject;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Landroid/os/AsyncTask;->onPostExecute(Ljava/lang/Object;)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/sina/weibo/sdk/share/SaveFileTask;->mCallback:Lcom/sina/weibo/sdk/share/TransResourceCallback;

    .line 5
    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    invoke-interface {p0, p1}, Lcom/sina/weibo/sdk/share/TransResourceCallback;->onTransFinish(Lcom/sina/weibo/sdk/api/StoryObject;)V

    .line 9
    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method public bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0

    .line 12
    check-cast p1, Lcom/sina/weibo/sdk/api/StoryObject;

    invoke-virtual {p0, p1}, Lcom/sina/weibo/sdk/share/SaveFileTask;->onPostExecute(Lcom/sina/weibo/sdk/api/StoryObject;)V

    return-void
.end method

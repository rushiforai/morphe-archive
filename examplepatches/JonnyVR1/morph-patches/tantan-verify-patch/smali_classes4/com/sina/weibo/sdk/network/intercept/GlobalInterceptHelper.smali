.class public Lcom/sina/weibo/sdk/network/intercept/GlobalInterceptHelper;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static globalInterceptHelper:Lcom/sina/weibo/sdk/network/intercept/GlobalInterceptHelper;


# instance fields
.field private globalIntercept:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Lcom/sina/weibo/sdk/network/IRequestIntercept;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method private constructor <init>()V
    .locals 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/HashMap;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/sina/weibo/sdk/network/intercept/GlobalInterceptHelper;->globalIntercept:Ljava/util/HashMap;

    .line 10
    .line 11
    const-class v1, Lcom/sina/weibo/sdk/network/intercept/GuestParamInterception;

    .line 12
    .line 13
    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    new-instance v2, Lcom/sina/weibo/sdk/network/intercept/GuestParamInterception;

    .line 18
    .line 19
    invoke-direct {v2}, Lcom/sina/weibo/sdk/network/intercept/GuestParamInterception;-><init>()V

    .line 20
    .line 21
    .line 22
    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    iget-object p0, p0, Lcom/sina/weibo/sdk/network/intercept/GlobalInterceptHelper;->globalIntercept:Ljava/util/HashMap;

    .line 26
    .line 27
    const-class v0, Lcom/sina/weibo/sdk/network/intercept/CommonParamInterception;

    .line 28
    .line 29
    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    new-instance v1, Lcom/sina/weibo/sdk/network/intercept/CommonParamInterception;

    .line 34
    .line 35
    invoke-direct {v1}, Lcom/sina/weibo/sdk/network/intercept/CommonParamInterception;-><init>()V

    .line 36
    .line 37
    .line 38
    invoke-virtual {p0, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method public static init()Lcom/sina/weibo/sdk/network/intercept/GlobalInterceptHelper;
    .locals 1

    .line 1
    sget-object v0, Lcom/sina/weibo/sdk/network/intercept/GlobalInterceptHelper;->globalInterceptHelper:Lcom/sina/weibo/sdk/network/intercept/GlobalInterceptHelper;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Lcom/sina/weibo/sdk/network/intercept/GlobalInterceptHelper;

    .line 6
    .line 7
    invoke-direct {v0}, Lcom/sina/weibo/sdk/network/intercept/GlobalInterceptHelper;-><init>()V

    .line 8
    .line 9
    .line 10
    sput-object v0, Lcom/sina/weibo/sdk/network/intercept/GlobalInterceptHelper;->globalInterceptHelper:Lcom/sina/weibo/sdk/network/intercept/GlobalInterceptHelper;

    .line 11
    .line 12
    :cond_0
    sget-object v0, Lcom/sina/weibo/sdk/network/intercept/GlobalInterceptHelper;->globalInterceptHelper:Lcom/sina/weibo/sdk/network/intercept/GlobalInterceptHelper;

    .line 13
    .line 14
    return-object v0
.end method


# virtual methods
.method public addIntercept(Ljava/lang/String;Lcom/sina/weibo/sdk/network/IRequestIntercept;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/sina/weibo/sdk/network/intercept/GlobalInterceptHelper;->globalIntercept:Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public getGlobalIntercept()Ljava/util/HashMap;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Lcom/sina/weibo/sdk/network/IRequestIntercept;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/sina/weibo/sdk/network/intercept/GlobalInterceptHelper;->globalIntercept:Ljava/util/HashMap;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    new-instance p0, Ljava/util/HashMap;

    .line 6
    .line 7
    invoke-direct {p0}, Ljava/util/HashMap;-><init>()V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-object p0
.end method

.method public removeIntercept(Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/sina/weibo/sdk/network/intercept/GlobalInterceptHelper;->globalIntercept:Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/sina/weibo/sdk/network/intercept/GlobalInterceptHelper;->globalIntercept:Ljava/util/HashMap;

    .line 10
    .line 11
    invoke-virtual {p0, p1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

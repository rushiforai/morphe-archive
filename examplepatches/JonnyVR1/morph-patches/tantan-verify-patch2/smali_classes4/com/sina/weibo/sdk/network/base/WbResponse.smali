.class public Lcom/sina/weibo/sdk/network/base/WbResponse;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private responseBody:Lcom/sina/weibo/sdk/network/base/WbResponseBody;

.field private resultCode:I


# direct methods
.method public constructor <init>(Lcom/sina/weibo/sdk/network/base/WbResponseBody;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/16 v0, 0xc8

    .line 5
    .line 6
    iput v0, p0, Lcom/sina/weibo/sdk/network/base/WbResponse;->resultCode:I

    .line 7
    .line 8
    iput-object p1, p0, Lcom/sina/weibo/sdk/network/base/WbResponse;->responseBody:Lcom/sina/weibo/sdk/network/base/WbResponseBody;

    .line 9
    .line 10
    return-void
.end method

.method public constructor <init>(Lcom/sina/weibo/sdk/network/base/WbResponseBody;I)V
    .locals 0

    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 12
    iput-object p1, p0, Lcom/sina/weibo/sdk/network/base/WbResponse;->responseBody:Lcom/sina/weibo/sdk/network/base/WbResponseBody;

    .line 13
    iput p2, p0, Lcom/sina/weibo/sdk/network/base/WbResponse;->resultCode:I

    return-void
.end method


# virtual methods
.method public body()Lcom/sina/weibo/sdk/network/base/WbResponseBody;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/sina/weibo/sdk/network/base/WbResponse;->responseBody:Lcom/sina/weibo/sdk/network/base/WbResponseBody;

    .line 2
    .line 3
    return-object p0
.end method

.method public isSuccessful()Z
    .locals 1

    .line 1
    iget p0, p0, Lcom/sina/weibo/sdk/network/base/WbResponse;->resultCode:I

    .line 2
    .line 3
    const/16 v0, 0xc8

    .line 4
    .line 5
    if-ne p0, v0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x1

    .line 8
    return p0

    .line 9
    :cond_0
    const/4 p0, 0x0

    .line 10
    return p0
.end method

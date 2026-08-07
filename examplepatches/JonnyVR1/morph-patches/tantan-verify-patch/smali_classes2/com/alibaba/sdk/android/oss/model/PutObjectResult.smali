.class public Lcom/alibaba/sdk/android/oss/model/PutObjectResult;
.super Lcom/alibaba/sdk/android/oss/model/OSSResult;
.source "SourceFile"


# instance fields
.field private eTag:Ljava/lang/String;

.field private serverCallbackReturnBody:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/alibaba/sdk/android/oss/model/OSSResult;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public getETag()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/alibaba/sdk/android/oss/model/PutObjectResult;->eTag:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getServerCallbackReturnBody()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/alibaba/sdk/android/oss/model/PutObjectResult;->serverCallbackReturnBody:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public setETag(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/alibaba/sdk/android/oss/model/PutObjectResult;->eTag:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setServerCallbackReturnBody(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/alibaba/sdk/android/oss/model/PutObjectResult;->serverCallbackReturnBody:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

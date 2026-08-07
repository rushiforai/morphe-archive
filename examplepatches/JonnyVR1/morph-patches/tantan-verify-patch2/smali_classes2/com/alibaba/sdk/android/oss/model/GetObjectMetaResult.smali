.class public Lcom/alibaba/sdk/android/oss/model/GetObjectMetaResult;
.super Lcom/alibaba/sdk/android/oss/model/OSSResult;
.source "SourceFile"


# instance fields
.field private metadata:Lcom/alibaba/sdk/android/oss/model/ObjectMetadata;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/alibaba/sdk/android/oss/model/OSSResult;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lcom/alibaba/sdk/android/oss/model/ObjectMetadata;

    .line 5
    .line 6
    invoke-direct {v0}, Lcom/alibaba/sdk/android/oss/model/ObjectMetadata;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/alibaba/sdk/android/oss/model/GetObjectMetaResult;->metadata:Lcom/alibaba/sdk/android/oss/model/ObjectMetadata;

    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public getMetadata()Lcom/alibaba/sdk/android/oss/model/ObjectMetadata;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/alibaba/sdk/android/oss/model/GetObjectMetaResult;->metadata:Lcom/alibaba/sdk/android/oss/model/ObjectMetadata;

    .line 2
    .line 3
    return-object p0
.end method

.method public setMetadata(Lcom/alibaba/sdk/android/oss/model/ObjectMetadata;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/alibaba/sdk/android/oss/model/GetObjectMetaResult;->metadata:Lcom/alibaba/sdk/android/oss/model/ObjectMetadata;

    .line 2
    .line 3
    return-void
.end method

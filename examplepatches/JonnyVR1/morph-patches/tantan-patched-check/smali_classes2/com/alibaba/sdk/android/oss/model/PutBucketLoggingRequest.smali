.class public Lcom/alibaba/sdk/android/oss/model/PutBucketLoggingRequest;
.super Lcom/alibaba/sdk/android/oss/model/OSSRequest;
.source "SourceFile"


# instance fields
.field private mBucketName:Ljava/lang/String;

.field private mTargetBucketName:Ljava/lang/String;

.field private mTargetPrefix:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/alibaba/sdk/android/oss/model/OSSRequest;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public getBucketName()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/alibaba/sdk/android/oss/model/PutBucketLoggingRequest;->mBucketName:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getTargetBucketName()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/alibaba/sdk/android/oss/model/PutBucketLoggingRequest;->mTargetBucketName:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getTargetPrefix()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/alibaba/sdk/android/oss/model/PutBucketLoggingRequest;->mTargetPrefix:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public setBucketName(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/alibaba/sdk/android/oss/model/PutBucketLoggingRequest;->mBucketName:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setTargetBucketName(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/alibaba/sdk/android/oss/model/PutBucketLoggingRequest;->mTargetBucketName:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setTargetPrefix(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/alibaba/sdk/android/oss/model/PutBucketLoggingRequest;->mTargetPrefix:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

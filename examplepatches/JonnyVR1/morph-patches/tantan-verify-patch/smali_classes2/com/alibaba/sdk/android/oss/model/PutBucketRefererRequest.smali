.class public Lcom/alibaba/sdk/android/oss/model/PutBucketRefererRequest;
.super Lcom/alibaba/sdk/android/oss/model/OSSRequest;
.source "SourceFile"


# instance fields
.field private mAllowEmpty:Z

.field private mBucketName:Ljava/lang/String;

.field private mReferers:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


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
    iget-object p0, p0, Lcom/alibaba/sdk/android/oss/model/PutBucketRefererRequest;->mBucketName:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getReferers()Ljava/util/ArrayList;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/alibaba/sdk/android/oss/model/PutBucketRefererRequest;->mReferers:Ljava/util/ArrayList;

    .line 2
    .line 3
    return-object p0
.end method

.method public isAllowEmpty()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/alibaba/sdk/android/oss/model/PutBucketRefererRequest;->mAllowEmpty:Z

    .line 2
    .line 3
    return p0
.end method

.method public setAllowEmpty(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/alibaba/sdk/android/oss/model/PutBucketRefererRequest;->mAllowEmpty:Z

    .line 2
    .line 3
    return-void
.end method

.method public setBucketName(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/alibaba/sdk/android/oss/model/PutBucketRefererRequest;->mBucketName:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setReferers(Ljava/util/ArrayList;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/alibaba/sdk/android/oss/model/PutBucketRefererRequest;->mReferers:Ljava/util/ArrayList;

    .line 2
    .line 3
    return-void
.end method

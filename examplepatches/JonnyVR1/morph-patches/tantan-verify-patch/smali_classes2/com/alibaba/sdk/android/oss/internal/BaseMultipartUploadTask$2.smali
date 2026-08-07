.class Lcom/alibaba/sdk/android/oss/internal/BaseMultipartUploadTask$2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/alibaba/sdk/android/oss/internal/BaseMultipartUploadTask;->completeMultipartUploadResult()Lcom/alibaba/sdk/android/oss/model/CompleteMultipartUploadResult;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Comparator<",
        "Lcom/alibaba/sdk/android/oss/model/PartETag;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/alibaba/sdk/android/oss/internal/BaseMultipartUploadTask;


# direct methods
.method public constructor <init>(Lcom/alibaba/sdk/android/oss/internal/BaseMultipartUploadTask;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/alibaba/sdk/android/oss/internal/BaseMultipartUploadTask$2;->this$0:Lcom/alibaba/sdk/android/oss/internal/BaseMultipartUploadTask;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public compare(Lcom/alibaba/sdk/android/oss/model/PartETag;Lcom/alibaba/sdk/android/oss/model/PartETag;)I
    .locals 1

    .line 1
    invoke-virtual {p1}, Lcom/alibaba/sdk/android/oss/model/PartETag;->getPartNumber()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    invoke-virtual {p2}, Lcom/alibaba/sdk/android/oss/model/PartETag;->getPartNumber()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-ge p0, v0, :cond_0

    .line 10
    .line 11
    const/4 p0, -0x1

    .line 12
    return p0

    .line 13
    :cond_0
    invoke-virtual {p1}, Lcom/alibaba/sdk/android/oss/model/PartETag;->getPartNumber()I

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    invoke-virtual {p2}, Lcom/alibaba/sdk/android/oss/model/PartETag;->getPartNumber()I

    .line 18
    .line 19
    .line 20
    move-result p1

    .line 21
    if-le p0, p1, :cond_1

    .line 22
    .line 23
    const/4 p0, 0x1

    .line 24
    return p0

    .line 25
    :cond_1
    const/4 p0, 0x0

    .line 26
    return p0
.end method

.method public bridge synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 0

    .line 27
    check-cast p1, Lcom/alibaba/sdk/android/oss/model/PartETag;

    check-cast p2, Lcom/alibaba/sdk/android/oss/model/PartETag;

    invoke-virtual {p0, p1, p2}, Lcom/alibaba/sdk/android/oss/internal/BaseMultipartUploadTask$2;->compare(Lcom/alibaba/sdk/android/oss/model/PartETag;Lcom/alibaba/sdk/android/oss/model/PartETag;)I

    move-result p0

    return p0
.end method

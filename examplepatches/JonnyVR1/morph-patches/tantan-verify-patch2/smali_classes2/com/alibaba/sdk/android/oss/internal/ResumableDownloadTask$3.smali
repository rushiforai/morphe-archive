.class Lcom/alibaba/sdk/android/oss/internal/ResumableDownloadTask$3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/alibaba/sdk/android/oss/internal/ResumableDownloadTask;->doMultipartDownload()Lcom/alibaba/sdk/android/oss/model/ResumableDownloadResult;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Comparator<",
        "Lcom/alibaba/sdk/android/oss/internal/ResumableDownloadTask$DownloadPartResult;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/alibaba/sdk/android/oss/internal/ResumableDownloadTask;


# direct methods
.method public constructor <init>(Lcom/alibaba/sdk/android/oss/internal/ResumableDownloadTask;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/alibaba/sdk/android/oss/internal/ResumableDownloadTask$3;->this$0:Lcom/alibaba/sdk/android/oss/internal/ResumableDownloadTask;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public compare(Lcom/alibaba/sdk/android/oss/internal/ResumableDownloadTask$DownloadPartResult;Lcom/alibaba/sdk/android/oss/internal/ResumableDownloadTask$DownloadPartResult;)I
    .locals 0

    .line 10
    iget p0, p1, Lcom/alibaba/sdk/android/oss/internal/ResumableDownloadTask$DownloadPartResult;->partNumber:I

    iget p1, p2, Lcom/alibaba/sdk/android/oss/internal/ResumableDownloadTask$DownloadPartResult;->partNumber:I

    sub-int/2addr p0, p1

    return p0
.end method

.method public bridge synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 0

    .line 1
    check-cast p1, Lcom/alibaba/sdk/android/oss/internal/ResumableDownloadTask$DownloadPartResult;

    .line 2
    .line 3
    check-cast p2, Lcom/alibaba/sdk/android/oss/internal/ResumableDownloadTask$DownloadPartResult;

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2}, Lcom/alibaba/sdk/android/oss/internal/ResumableDownloadTask$3;->compare(Lcom/alibaba/sdk/android/oss/internal/ResumableDownloadTask$DownloadPartResult;Lcom/alibaba/sdk/android/oss/internal/ResumableDownloadTask$DownloadPartResult;)I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

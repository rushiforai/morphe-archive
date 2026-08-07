.class Lcom/alibaba/sdk/android/oss/internal/ResumableUploadTask$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/alibaba/sdk/android/oss/internal/ResumableUploadTask;->doMultipartUpload()Lcom/alibaba/sdk/android/oss/model/ResumableUploadResult;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/alibaba/sdk/android/oss/internal/ResumableUploadTask;

.field final synthetic val$byteCount:I

.field final synthetic val$partNumber:I

.field final synthetic val$readIndex:I


# direct methods
.method public constructor <init>(Lcom/alibaba/sdk/android/oss/internal/ResumableUploadTask;III)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/alibaba/sdk/android/oss/internal/ResumableUploadTask$1;->this$0:Lcom/alibaba/sdk/android/oss/internal/ResumableUploadTask;

    .line 2
    .line 3
    iput p2, p0, Lcom/alibaba/sdk/android/oss/internal/ResumableUploadTask$1;->val$readIndex:I

    .line 4
    .line 5
    iput p3, p0, Lcom/alibaba/sdk/android/oss/internal/ResumableUploadTask$1;->val$byteCount:I

    .line 6
    .line 7
    iput p4, p0, Lcom/alibaba/sdk/android/oss/internal/ResumableUploadTask$1;->val$partNumber:I

    .line 8
    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 10
    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/alibaba/sdk/android/oss/internal/ResumableUploadTask$1;->this$0:Lcom/alibaba/sdk/android/oss/internal/ResumableUploadTask;

    .line 2
    .line 3
    iget v1, p0, Lcom/alibaba/sdk/android/oss/internal/ResumableUploadTask$1;->val$readIndex:I

    .line 4
    .line 5
    iget v2, p0, Lcom/alibaba/sdk/android/oss/internal/ResumableUploadTask$1;->val$byteCount:I

    .line 6
    .line 7
    iget p0, p0, Lcom/alibaba/sdk/android/oss/internal/ResumableUploadTask$1;->val$partNumber:I

    .line 8
    .line 9
    invoke-virtual {v0, v1, v2, p0}, Lcom/alibaba/sdk/android/oss/internal/BaseMultipartUploadTask;->uploadPart(III)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

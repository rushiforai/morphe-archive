.class public Lcom/alibaba/sdk/android/oss/model/ListMultipartUploadsRequest;
.super Lcom/alibaba/sdk/android/oss/model/OSSRequest;
.source "SourceFile"


# instance fields
.field private bucketName:Ljava/lang/String;

.field private delimiter:Ljava/lang/String;

.field private encodingType:Ljava/lang/String;

.field private keyMarker:Ljava/lang/String;

.field private maxUploads:Ljava/lang/Integer;

.field private prefix:Ljava/lang/String;

.field private uploadIdMarker:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/alibaba/sdk/android/oss/model/OSSRequest;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/alibaba/sdk/android/oss/model/ListMultipartUploadsRequest;->bucketName:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public getBucketName()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/alibaba/sdk/android/oss/model/ListMultipartUploadsRequest;->bucketName:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getDelimiter()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/alibaba/sdk/android/oss/model/ListMultipartUploadsRequest;->delimiter:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getEncodingType()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/alibaba/sdk/android/oss/model/ListMultipartUploadsRequest;->encodingType:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getKeyMarker()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/alibaba/sdk/android/oss/model/ListMultipartUploadsRequest;->keyMarker:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getMaxUploads()Ljava/lang/Integer;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/alibaba/sdk/android/oss/model/ListMultipartUploadsRequest;->maxUploads:Ljava/lang/Integer;

    .line 2
    .line 3
    return-object p0
.end method

.method public getPrefix()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/alibaba/sdk/android/oss/model/ListMultipartUploadsRequest;->prefix:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getUploadIdMarker()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/alibaba/sdk/android/oss/model/ListMultipartUploadsRequest;->uploadIdMarker:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public setDelimiter(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/alibaba/sdk/android/oss/model/ListMultipartUploadsRequest;->delimiter:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setEncodingType(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/alibaba/sdk/android/oss/model/ListMultipartUploadsRequest;->encodingType:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setKeyMarker(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/alibaba/sdk/android/oss/model/ListMultipartUploadsRequest;->keyMarker:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setMaxUploads(Ljava/lang/Integer;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/alibaba/sdk/android/oss/model/ListMultipartUploadsRequest;->maxUploads:Ljava/lang/Integer;

    .line 2
    .line 3
    return-void
.end method

.method public setPrefix(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/alibaba/sdk/android/oss/model/ListMultipartUploadsRequest;->prefix:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setUploadIdMarker(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/alibaba/sdk/android/oss/model/ListMultipartUploadsRequest;->uploadIdMarker:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

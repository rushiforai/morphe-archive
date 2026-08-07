.class public Lcom/idv/identity/platform/model/ZimInitContent;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public AccessKeyId:Ljava/lang/String;

.field public AccessKeySecret:Ljava/lang/String;

.field public AlbumMaxWidth:F

.field public BizCode:Ljava/lang/String;

.field public BizMessage:Ljava/lang/String;

.field public BucketName:Ljava/lang/String;

.field public CertifyId:Ljava/lang/String;

.field public ExtProtocol:Ljava/lang/String;

.field public FileNamePrefix:Ljava/lang/String;

.field public ImageCount:I

.field public NowDate:Ljava/lang/String;

.field public Ocr:Ljava/lang/String;

.field public OriPicMaxWidth:F

.field public OssEndPoint:Ljava/lang/String;

.field public PictureMaxWidth:F

.field public PictureQuality:F

.field public Protocol:Ljava/lang/String;

.field public SecurityToken:Ljava/lang/String;

.field public docPageTotalNum:I

.field public docType:Ljava/lang/String;

.field public productCode:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public getAccessKeyId()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/idv/identity/platform/model/ZimInitContent;->AccessKeyId:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getAccessKeySecret()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/idv/identity/platform/model/ZimInitContent;->AccessKeySecret:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getAlbumMaxWidth()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/idv/identity/platform/model/ZimInitContent;->AlbumMaxWidth:F

    .line 2
    .line 3
    return p0
.end method

.method public getBizCode()Ljava/lang/String;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/idv/identity/platform/model/ZimInitContent;->isValid()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    const-string p0, ""

    .line 8
    .line 9
    return-object p0

    .line 10
    :cond_0
    iget-object p0, p0, Lcom/idv/identity/platform/model/ZimInitContent;->BizCode:Ljava/lang/String;

    .line 11
    .line 12
    return-object p0
.end method

.method public getBizMessage()Ljava/lang/String;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/idv/identity/platform/model/ZimInitContent;->isValid()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    const-string p0, ""

    .line 8
    .line 9
    return-object p0

    .line 10
    :cond_0
    iget-object p0, p0, Lcom/idv/identity/platform/model/ZimInitContent;->BizMessage:Ljava/lang/String;

    .line 11
    .line 12
    return-object p0
.end method

.method public getBucketName()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/idv/identity/platform/model/ZimInitContent;->BucketName:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getCertifyId()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/idv/identity/platform/model/ZimInitContent;->CertifyId:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getDocPageTotalNum()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/idv/identity/platform/model/ZimInitContent;->docPageTotalNum:I

    .line 2
    .line 3
    return p0
.end method

.method public getDocType()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/idv/identity/platform/model/ZimInitContent;->docType:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getExtProtocol()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/idv/identity/platform/model/ZimInitContent;->ExtProtocol:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getFileName()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/idv/identity/platform/model/ZimInitContent;->FileNamePrefix:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getImageCount()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/idv/identity/platform/model/ZimInitContent;->ImageCount:I

    .line 2
    .line 3
    return p0
.end method

.method public getNowDate()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/idv/identity/platform/model/ZimInitContent;->NowDate:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getOcrSwitch()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/idv/identity/platform/model/ZimInitContent;->Ocr:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getOriPicMaxWidth()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/idv/identity/platform/model/ZimInitContent;->OriPicMaxWidth:F

    .line 2
    .line 3
    return p0
.end method

.method public getOssEndPoint()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/idv/identity/platform/model/ZimInitContent;->OssEndPoint:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getPictureMaxWidth()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/idv/identity/platform/model/ZimInitContent;->PictureMaxWidth:F

    .line 2
    .line 3
    return p0
.end method

.method public getPictureQuality()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/idv/identity/platform/model/ZimInitContent;->PictureQuality:F

    .line 2
    .line 3
    return p0
.end method

.method public getProductCode()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/idv/identity/platform/model/ZimInitContent;->productCode:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getProtocol()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/idv/identity/platform/model/ZimInitContent;->Protocol:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getSecurityToken()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/idv/identity/platform/model/ZimInitContent;->SecurityToken:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public isInitSuccess()Z
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/idv/identity/platform/model/ZimInitContent;->isValid()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x0

    .line 8
    return p0

    .line 9
    :cond_0
    const-string v0, "CODE_INIT_SUCCESS"

    .line 10
    .line 11
    iget-object p0, p0, Lcom/idv/identity/platform/model/ZimInitContent;->BizCode:Ljava/lang/String;

    .line 12
    .line 13
    invoke-virtual {v0, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    return p0
.end method

.method public isValid()Z
    .locals 0

    const/4 p0, 0x1

    return p0
.end method

.method public setImageCount(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/idv/identity/platform/model/ZimInitContent;->ImageCount:I

    .line 2
    .line 3
    return-void
.end method

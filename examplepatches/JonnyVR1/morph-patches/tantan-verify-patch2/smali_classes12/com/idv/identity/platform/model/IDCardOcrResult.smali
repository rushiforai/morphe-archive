.class public Lcom/idv/identity/platform/model/IDCardOcrResult;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/idv/identity/platform/model/IDCardOcrResult$OcrResult;
    }
.end annotation


# instance fields
.field public BizCode:Ljava/lang/String;

.field public BizMessage:Ljava/lang/String;

.field public ocrResult:Lcom/idv/identity/platform/model/IDCardOcrResult$OcrResult;


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
.method public getBizCode()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/idv/identity/platform/model/IDCardOcrResult;->BizCode:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getBizMessage()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/idv/identity/platform/model/IDCardOcrResult;->BizMessage:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getOcrResult()Lcom/idv/identity/platform/model/IDCardOcrResult$OcrResult;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/idv/identity/platform/model/IDCardOcrResult;->ocrResult:Lcom/idv/identity/platform/model/IDCardOcrResult$OcrResult;

    .line 2
    .line 3
    return-object p0
.end method

.method public isOCRError()Z
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/idv/identity/platform/model/IDCardOcrResult;->isValid()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const-string v0, "CODE_OCR_FAILED"

    .line 8
    .line 9
    iget-object p0, p0, Lcom/idv/identity/platform/model/IDCardOcrResult;->BizCode:Ljava/lang/String;

    .line 10
    .line 11
    invoke-virtual {v0, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    return p0

    .line 16
    :cond_0
    const/4 p0, 0x0

    .line 17
    return p0
.end method

.method public isOCRPictureQualityNotGood()Z
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/idv/identity/platform/model/IDCardOcrResult;->isValid()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const-string v0, "CODE_OCR_FAILED_COMPLIANCE"

    .line 8
    .line 9
    iget-object p0, p0, Lcom/idv/identity/platform/model/IDCardOcrResult;->BizCode:Ljava/lang/String;

    .line 10
    .line 11
    invoke-virtual {v0, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    return p0

    .line 16
    :cond_0
    const/4 p0, 0x0

    .line 17
    return p0
.end method

.method public isOCRSuccess()Z
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/idv/identity/platform/model/IDCardOcrResult;->isValid()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const-string v0, "CODE_OCR_SUCCESS"

    .line 8
    .line 9
    iget-object p0, p0, Lcom/idv/identity/platform/model/IDCardOcrResult;->BizCode:Ljava/lang/String;

    .line 10
    .line 11
    invoke-virtual {v0, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    return p0

    .line 16
    :cond_0
    const/4 p0, 0x0

    .line 17
    return p0
.end method

.method public isOCRTypeError()Z
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/idv/identity/platform/model/IDCardOcrResult;->isValid()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const-string v0, "CODE_OCR_WRONG_CARD"

    .line 8
    .line 9
    iget-object p0, p0, Lcom/idv/identity/platform/model/IDCardOcrResult;->BizCode:Ljava/lang/String;

    .line 10
    .line 11
    invoke-virtual {v0, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    return p0

    .line 16
    :cond_0
    const/4 p0, 0x0

    .line 17
    return p0
.end method

.method public isValid()Z
    .locals 0

    const/4 p0, 0x1

    return p0
.end method

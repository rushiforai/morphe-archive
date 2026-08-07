.class public Lcom/idv/identity/platform/model/IDCardOcrProResult;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private bizCode:Ljava/lang/String;
    .annotation runtime Lcom/alibaba/fastjson/annotation/JSONField;
        name = "bizCode"
    .end annotation
.end field

.field private bizMessage:Ljava/lang/String;
    .annotation runtime Lcom/alibaba/fastjson/annotation/JSONField;
        name = "bizMessage"
    .end annotation
.end field

.field private docParamConfig:Ljava/lang/String;
    .annotation runtime Lcom/alibaba/fastjson/annotation/JSONField;
        name = "docParamConfig"
    .end annotation
.end field

.field private docType:Ljava/lang/String;
    .annotation runtime Lcom/alibaba/fastjson/annotation/JSONField;
        name = "docType"
    .end annotation
.end field

.field private ocrResult:Ljava/lang/String;
    .annotation runtime Lcom/alibaba/fastjson/annotation/JSONField;
        name = "ocrResult"
    .end annotation
.end field

.field private ocrStandardData:Ljava/lang/String;
    .annotation runtime Lcom/alibaba/fastjson/annotation/JSONField;
        name = "ocrStandardData"
    .end annotation
.end field

.field private pageNo:I
    .annotation runtime Lcom/alibaba/fastjson/annotation/JSONField;
        name = "pageNo"
    .end annotation
.end field

.field private sortedOcrResult:Ljava/util/Map;
    .annotation runtime Lcom/alibaba/fastjson/annotation/JSONField;
        serialize = false
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string v0, ""

    .line 5
    .line 6
    iput-object v0, p0, Lcom/idv/identity/platform/model/IDCardOcrProResult;->docParamConfig:Ljava/lang/String;

    .line 7
    .line 8
    return-void
.end method

.method private isValid()Z
    .locals 0

    const/4 p0, 0x1

    return p0
.end method


# virtual methods
.method public getBizCode()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/idv/identity/platform/model/IDCardOcrProResult;->bizCode:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getBizMessage()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/idv/identity/platform/model/IDCardOcrProResult;->bizMessage:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getDocParamConfig()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/idv/identity/platform/model/IDCardOcrProResult;->docParamConfig:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getDocType()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/idv/identity/platform/model/IDCardOcrProResult;->docType:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getOcrResult()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/idv/identity/platform/model/IDCardOcrProResult;->ocrResult:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getOcrStandardData()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/idv/identity/platform/model/IDCardOcrProResult;->ocrStandardData:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getOcrStandardDataMap()Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/idv/identity/platform/model/IDCardOcrProResult;->ocrStandardData:Ljava/lang/String;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    return-object p0

    .line 7
    :cond_0
    const-class v0, Ljava/util/HashMap;

    .line 8
    .line 9
    invoke-static {p0, v0}, Lcom/alibaba/fastjson/JSON;->parseObject(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Ljava/util/Map;

    .line 14
    .line 15
    return-object p0
.end method

.method public getPageNo()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/idv/identity/platform/model/IDCardOcrProResult;->pageNo:I

    .line 2
    .line 3
    return p0
.end method

.method public getSortedOcrResult()Ljava/util/Map;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/idv/identity/platform/model/IDCardOcrProResult;->sortedOcrResult:Ljava/util/Map;

    .line 2
    .line 3
    return-object p0
.end method

.method public isOCRError()Z
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/idv/identity/platform/model/IDCardOcrProResult;->isValid()Z

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
    iget-object p0, p0, Lcom/idv/identity/platform/model/IDCardOcrProResult;->bizCode:Ljava/lang/String;

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
    invoke-direct {p0}, Lcom/idv/identity/platform/model/IDCardOcrProResult;->isValid()Z

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
    iget-object p0, p0, Lcom/idv/identity/platform/model/IDCardOcrProResult;->bizCode:Ljava/lang/String;

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
    invoke-direct {p0}, Lcom/idv/identity/platform/model/IDCardOcrProResult;->isValid()Z

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
    iget-object p0, p0, Lcom/idv/identity/platform/model/IDCardOcrProResult;->bizCode:Ljava/lang/String;

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
    invoke-direct {p0}, Lcom/idv/identity/platform/model/IDCardOcrProResult;->isValid()Z

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
    iget-object p0, p0, Lcom/idv/identity/platform/model/IDCardOcrProResult;->bizCode:Ljava/lang/String;

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

.method public setBizCode(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/idv/identity/platform/model/IDCardOcrProResult;->bizCode:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setBizMessage(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/idv/identity/platform/model/IDCardOcrProResult;->bizMessage:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setDocParamConfig(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/idv/identity/platform/model/IDCardOcrProResult;->docParamConfig:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setDocType(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/idv/identity/platform/model/IDCardOcrProResult;->docType:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setOcrResult(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/idv/identity/platform/model/IDCardOcrProResult;->ocrResult:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setOcrStandardData(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/idv/identity/platform/model/IDCardOcrProResult;->ocrStandardData:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setPageNo(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/idv/identity/platform/model/IDCardOcrProResult;->pageNo:I

    .line 2
    .line 3
    return-void
.end method

.method public sortOcrResult()V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/idv/identity/platform/model/IDCardOcrProResult;->docParamConfig:Ljava/lang/String;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    :try_start_0
    const-class v1, Ljava/lang/String;

    .line 7
    .line 8
    invoke-static {v0, v1}, Lcom/alibaba/fastjson/JSON;->parseArray(Ljava/lang/String;Ljava/lang/Class;)Ljava/util/List;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    new-instance v1, Ljava/util/HashMap;

    .line 13
    .line 14
    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 15
    .line 16
    .line 17
    iget-object v2, p0, Lcom/idv/identity/platform/model/IDCardOcrProResult;->ocrResult:Ljava/lang/String;

    .line 18
    .line 19
    if-eqz v2, :cond_1

    .line 20
    .line 21
    const-class v1, Ljava/util/HashMap;

    .line 22
    .line 23
    invoke-static {v2, v1}, Lcom/alibaba/fastjson/JSON;->parseObject(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    check-cast v1, Ljava/util/HashMap;

    .line 28
    .line 29
    :cond_1
    new-instance v2, Ljava/util/LinkedHashMap;

    .line 30
    .line 31
    invoke-direct {v2}, Ljava/util/LinkedHashMap;-><init>()V

    .line 32
    .line 33
    .line 34
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 39
    .line 40
    .line 41
    move-result v3

    .line 42
    if-eqz v3, :cond_3

    .line 43
    .line 44
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 45
    .line 46
    .line 47
    move-result-object v3

    .line 48
    check-cast v3, Ljava/lang/String;

    .line 49
    .line 50
    invoke-virtual {v1, v3}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    .line 51
    .line 52
    .line 53
    move-result v4

    .line 54
    if-eqz v4, :cond_2

    .line 55
    .line 56
    invoke-virtual {v1, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 57
    .line 58
    .line 59
    move-result-object v4

    .line 60
    invoke-interface {v2, v3, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 61
    .line 62
    .line 63
    goto :goto_0

    .line 64
    :cond_2
    const-string v4, ""

    .line 65
    .line 66
    invoke-interface {v2, v3, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 67
    .line 68
    .line 69
    goto :goto_0

    .line 70
    :cond_3
    iput-object v2, p0, Lcom/idv/identity/platform/model/IDCardOcrProResult;->sortedOcrResult:Ljava/util/Map;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 71
    .line 72
    return-void

    .line 73
    :catch_0
    move-exception p0

    .line 74
    invoke-static {}, Lcom/idv/identity/platform/log/RecordService;->getInstance()Lcom/idv/identity/platform/log/RecordService;

    .line 75
    .line 76
    .line 77
    move-result-object v0

    .line 78
    invoke-virtual {v0, p0}, Lcom/idv/identity/platform/log/RecordService;->recordException(Ljava/lang/Throwable;)V

    .line 79
    .line 80
    .line 81
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "IDCardOcrProResult{bizCode=\'"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v1, p0, Lcom/idv/identity/platform/model/IDCardOcrProResult;->bizCode:Ljava/lang/String;

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v1, "\', bizMessage=\'"

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    iget-object v1, p0, Lcom/idv/identity/platform/model/IDCardOcrProResult;->bizMessage:Ljava/lang/String;

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    const-string v1, "\', docParamConfig=\'"

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    iget-object v1, p0, Lcom/idv/identity/platform/model/IDCardOcrProResult;->docParamConfig:Ljava/lang/String;

    .line 29
    .line 30
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    const-string v1, "\', docType=\'"

    .line 34
    .line 35
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    iget-object v1, p0, Lcom/idv/identity/platform/model/IDCardOcrProResult;->docType:Ljava/lang/String;

    .line 39
    .line 40
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    const-string v1, "\', pageNo="

    .line 44
    .line 45
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    iget v1, p0, Lcom/idv/identity/platform/model/IDCardOcrProResult;->pageNo:I

    .line 49
    .line 50
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 51
    .line 52
    .line 53
    const-string v1, ", ocrResult="

    .line 54
    .line 55
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    iget-object v1, p0, Lcom/idv/identity/platform/model/IDCardOcrProResult;->ocrResult:Ljava/lang/String;

    .line 59
    .line 60
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 61
    .line 62
    .line 63
    const-string v1, ", sortedOcrResult="

    .line 64
    .line 65
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 66
    .line 67
    .line 68
    iget-object p0, p0, Lcom/idv/identity/platform/model/IDCardOcrProResult;->sortedOcrResult:Ljava/util/Map;

    .line 69
    .line 70
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 71
    .line 72
    .line 73
    const/16 p0, 0x7d

    .line 74
    .line 75
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 76
    .line 77
    .line 78
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 79
    .line 80
    .line 81
    move-result-object p0

    .line 82
    return-object p0
.end method

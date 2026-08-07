.class public Lcom/idv/identity/platform/config/CustomUIConfig;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/io/Serializable;


# instance fields
.field private errMsg:Ljava/lang/String;

.field private faceConfig:Lcom/idv/identity/platform/config/FaceConfig;

.field private isValid:Z

.field private ocrConfig:Lcom/idv/identity/platform/config/OCRConfig;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    iput-boolean v0, p0, Lcom/idv/identity/platform/config/CustomUIConfig;->isValid:Z

    .line 6
    .line 7
    return-void
.end method


# virtual methods
.method public getErrMsg()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/idv/identity/platform/config/CustomUIConfig;->errMsg:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getFaceConfig()Lcom/idv/identity/platform/config/FaceConfig;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/idv/identity/platform/config/CustomUIConfig;->faceConfig:Lcom/idv/identity/platform/config/FaceConfig;

    .line 2
    .line 3
    return-object p0
.end method

.method public getOcrConfig()Lcom/idv/identity/platform/config/OCRConfig;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/idv/identity/platform/config/CustomUIConfig;->ocrConfig:Lcom/idv/identity/platform/config/OCRConfig;

    .line 2
    .line 3
    return-object p0
.end method

.method public isValid()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/idv/identity/platform/config/CustomUIConfig;->isValid:Z

    .line 2
    .line 3
    return p0
.end method

.method public setErrMsg(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/idv/identity/platform/config/CustomUIConfig;->errMsg:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setFaceConfig(Lcom/idv/identity/platform/config/FaceConfig;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/idv/identity/platform/config/CustomUIConfig;->faceConfig:Lcom/idv/identity/platform/config/FaceConfig;

    .line 2
    .line 3
    return-void
.end method

.method public setOcrConfig(Lcom/idv/identity/platform/config/OCRConfig;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/idv/identity/platform/config/CustomUIConfig;->ocrConfig:Lcom/idv/identity/platform/config/OCRConfig;

    .line 2
    .line 3
    return-void
.end method

.method public setValid(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/idv/identity/platform/config/CustomUIConfig;->isValid:Z

    .line 2
    .line 3
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "CustomUIConfig{orcConfig="

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v1, p0, Lcom/idv/identity/platform/config/CustomUIConfig;->ocrConfig:Lcom/idv/identity/platform/config/OCRConfig;

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v1, ", faceConfig="

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    iget-object v1, p0, Lcom/idv/identity/platform/config/CustomUIConfig;->faceConfig:Lcom/idv/identity/platform/config/FaceConfig;

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    const-string v1, ", errMsg=\'"

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    iget-object v1, p0, Lcom/idv/identity/platform/config/CustomUIConfig;->errMsg:Ljava/lang/String;

    .line 29
    .line 30
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    const-string v1, "\', isValid="

    .line 34
    .line 35
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    iget-boolean p0, p0, Lcom/idv/identity/platform/config/CustomUIConfig;->isValid:Z

    .line 39
    .line 40
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    const/16 p0, 0x7d

    .line 44
    .line 45
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    return-object p0
.end method

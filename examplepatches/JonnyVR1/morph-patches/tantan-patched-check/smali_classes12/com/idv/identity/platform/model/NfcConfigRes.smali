.class public Lcom/idv/identity/platform/model/NfcConfigRes;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private dateOfBirth:Ljava/lang/String;

.field private dateOfExpiry:Ljava/lang/String;

.field private documentNumber:Ljava/lang/String;

.field private nfcMode:Ljava/lang/String;


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
.method public getDateOfBirth()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/idv/identity/platform/model/NfcConfigRes;->dateOfBirth:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getDateOfExpiry()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/idv/identity/platform/model/NfcConfigRes;->dateOfExpiry:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getDocumentNumber()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/idv/identity/platform/model/NfcConfigRes;->documentNumber:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getNfcMode()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/idv/identity/platform/model/NfcConfigRes;->nfcMode:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public setDateOfBirth(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/idv/identity/platform/model/NfcConfigRes;->dateOfBirth:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setDateOfExpiry(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/idv/identity/platform/model/NfcConfigRes;->dateOfExpiry:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setDocumentNumber(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/idv/identity/platform/model/NfcConfigRes;->documentNumber:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setNfcMode(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/idv/identity/platform/model/NfcConfigRes;->nfcMode:Ljava/lang/String;

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
    const-string v1, "NfcConfigRes{nfcMode=\'"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v1, p0, Lcom/idv/identity/platform/model/NfcConfigRes;->nfcMode:Ljava/lang/String;

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v1, "\', documentNumber=\'"

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    iget-object v1, p0, Lcom/idv/identity/platform/model/NfcConfigRes;->documentNumber:Ljava/lang/String;

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    const-string v1, "\', dateOfBirth=\'"

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    iget-object v1, p0, Lcom/idv/identity/platform/model/NfcConfigRes;->dateOfBirth:Ljava/lang/String;

    .line 29
    .line 30
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    const-string v1, "\', dateOfExpiry=\'"

    .line 34
    .line 35
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    iget-object p0, p0, Lcom/idv/identity/platform/model/NfcConfigRes;->dateOfExpiry:Ljava/lang/String;

    .line 39
    .line 40
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    const-string p0, "\'}"

    .line 44
    .line 45
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

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

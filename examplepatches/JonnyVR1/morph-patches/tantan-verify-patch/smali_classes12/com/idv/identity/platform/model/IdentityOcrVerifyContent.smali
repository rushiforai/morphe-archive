.class public Lcom/idv/identity/platform/model/IdentityOcrVerifyContent;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public BizCode:Ljava/lang/String;

.field public BizMessage:Ljava/lang/String;

.field public extParams:Ljava/lang/String;

.field public hasNext:Ljava/lang/String;


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
    iget-object p0, p0, Lcom/idv/identity/platform/model/IdentityOcrVerifyContent;->BizCode:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getBizMessage()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/idv/identity/platform/model/IdentityOcrVerifyContent;->BizMessage:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public isOCRVerifySuccess()Z
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/idv/identity/platform/model/IdentityOcrVerifyContent;->isValid()Z

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
    const-string v0, "CODE_VERIFY_SUCCESS"

    .line 10
    .line 11
    iget-object p0, p0, Lcom/idv/identity/platform/model/IdentityOcrVerifyContent;->BizCode:Ljava/lang/String;

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

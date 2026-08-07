.class public final Lcom/p1/mobile/putong/data/VerificationTokenRequestParam$VerificationTokenRequestParamBuilder;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/data/VerificationTokenRequestParam;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "VerificationTokenRequestParamBuilder"
.end annotation


# instance fields
.field public appId:Ljava/lang/String;

.field private idName:Ljava/lang/String;

.field private idNumber:Ljava/lang/String;

.field private identity:Lcom/p1/mobile/putong/data/VerificationTokenIdentity;

.field private picture:Lcom/p1/mobile/putong/data/VerificationTokenIdentity;

.field public productId:Ljava/lang/String;

.field private provider:Ljava/lang/String;

.field private retrieveId:Ljava/lang/String;

.field public type:Ljava/lang/String;


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 2
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Ll/r5l0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/data/VerificationTokenRequestParam$VerificationTokenRequestParamBuilder;-><init>()V

    return-void
.end method


# virtual methods
.method public build()Lcom/p1/mobile/putong/data/VerificationTokenRequestParam;
    .locals 2

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/data/VerificationTokenRequestParam;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/VerificationTokenRequestParam;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/p1/mobile/putong/data/VerificationTokenRequestParam$VerificationTokenRequestParamBuilder;->identity:Lcom/p1/mobile/putong/data/VerificationTokenIdentity;

    .line 7
    .line 8
    if-eqz v1, :cond_0

    .line 9
    .line 10
    iput-object v1, v0, Lcom/p1/mobile/putong/data/VerificationTokenRequestParam;->identity:Lcom/p1/mobile/putong/data/VerificationTokenIdentity;

    .line 11
    .line 12
    :cond_0
    iget-object v1, p0, Lcom/p1/mobile/putong/data/VerificationTokenRequestParam$VerificationTokenRequestParamBuilder;->picture:Lcom/p1/mobile/putong/data/VerificationTokenIdentity;

    .line 13
    .line 14
    if-eqz v1, :cond_1

    .line 15
    .line 16
    iput-object v1, v0, Lcom/p1/mobile/putong/data/VerificationTokenRequestParam;->picture:Lcom/p1/mobile/putong/data/VerificationTokenIdentity;

    .line 17
    .line 18
    :cond_1
    iget-object v1, p0, Lcom/p1/mobile/putong/data/VerificationTokenRequestParam$VerificationTokenRequestParamBuilder;->type:Ljava/lang/String;

    .line 19
    .line 20
    iput-object v1, v0, Lcom/p1/mobile/putong/data/VerificationTokenRequestParam;->verifyType:Ljava/lang/String;

    .line 21
    .line 22
    iget-object v1, p0, Lcom/p1/mobile/putong/data/VerificationTokenRequestParam$VerificationTokenRequestParamBuilder;->appId:Ljava/lang/String;

    .line 23
    .line 24
    iput-object v1, v0, Lcom/p1/mobile/putong/data/VerificationTokenRequestParam;->appId:Ljava/lang/String;

    .line 25
    .line 26
    iget-object v1, p0, Lcom/p1/mobile/putong/data/VerificationTokenRequestParam$VerificationTokenRequestParamBuilder;->productId:Ljava/lang/String;

    .line 27
    .line 28
    iput-object v1, v0, Lcom/p1/mobile/putong/data/VerificationTokenRequestParam;->productId:Ljava/lang/String;

    .line 29
    .line 30
    iget-object p0, p0, Lcom/p1/mobile/putong/data/VerificationTokenRequestParam$VerificationTokenRequestParamBuilder;->retrieveId:Ljava/lang/String;

    .line 31
    .line 32
    const-string v1, "oversea"

    .line 33
    .line 34
    iput-object v1, v0, Lcom/p1/mobile/putong/data/VerificationTokenRequestParam;->region:Ljava/lang/String;

    .line 35
    .line 36
    iput-object p0, v0, Lcom/p1/mobile/putong/data/VerificationTokenRequestParam;->retrieveId:Ljava/lang/String;

    .line 37
    .line 38
    return-object v0
.end method

.method public setAppId(Ljava/lang/String;)Lcom/p1/mobile/putong/data/VerificationTokenRequestParam$VerificationTokenRequestParamBuilder;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/data/VerificationTokenRequestParam$VerificationTokenRequestParamBuilder;->appId:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public setIdName(Ljava/lang/String;)Lcom/p1/mobile/putong/data/VerificationTokenRequestParam$VerificationTokenRequestParamBuilder;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/data/VerificationTokenRequestParam$VerificationTokenRequestParamBuilder;->idName:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public setIdNumber(Ljava/lang/String;)Lcom/p1/mobile/putong/data/VerificationTokenRequestParam$VerificationTokenRequestParamBuilder;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/data/VerificationTokenRequestParam$VerificationTokenRequestParamBuilder;->idNumber:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public setIdentity(Lcom/p1/mobile/putong/data/VerificationTokenIdentity;)Lcom/p1/mobile/putong/data/VerificationTokenRequestParam$VerificationTokenRequestParamBuilder;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/data/VerificationTokenRequestParam$VerificationTokenRequestParamBuilder;->identity:Lcom/p1/mobile/putong/data/VerificationTokenIdentity;

    .line 2
    .line 3
    return-object p0
.end method

.method public setPicture(Lcom/p1/mobile/putong/data/VerificationTokenIdentity;)Lcom/p1/mobile/putong/data/VerificationTokenRequestParam$VerificationTokenRequestParamBuilder;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/data/VerificationTokenRequestParam$VerificationTokenRequestParamBuilder;->picture:Lcom/p1/mobile/putong/data/VerificationTokenIdentity;

    .line 2
    .line 3
    return-object p0
.end method

.method public setProductId(Ljava/lang/String;)Lcom/p1/mobile/putong/data/VerificationTokenRequestParam$VerificationTokenRequestParamBuilder;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/data/VerificationTokenRequestParam$VerificationTokenRequestParamBuilder;->productId:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public setProvider(Ljava/lang/String;)Lcom/p1/mobile/putong/data/VerificationTokenRequestParam$VerificationTokenRequestParamBuilder;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/data/VerificationTokenRequestParam$VerificationTokenRequestParamBuilder;->provider:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public setRetrieveId(Ljava/lang/String;)Lcom/p1/mobile/putong/data/VerificationTokenRequestParam$VerificationTokenRequestParamBuilder;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/data/VerificationTokenRequestParam$VerificationTokenRequestParamBuilder;->retrieveId:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public setVerifyType(Ljava/lang/String;)Lcom/p1/mobile/putong/data/VerificationTokenRequestParam$VerificationTokenRequestParamBuilder;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/data/VerificationTokenRequestParam$VerificationTokenRequestParamBuilder;->type:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public useAccountBackTemplate(Ljava/lang/String;ZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/p1/mobile/putong/data/VerificationTokenRequestParam$VerificationTokenRequestParamBuilder;
    .locals 1

    .line 1
    const-string v0, "1"

    .line 2
    .line 3
    iput-object v0, p0, Lcom/p1/mobile/putong/data/VerificationTokenRequestParam$VerificationTokenRequestParamBuilder;->appId:Ljava/lang/String;

    .line 4
    .line 5
    iput-object p4, p0, Lcom/p1/mobile/putong/data/VerificationTokenRequestParam$VerificationTokenRequestParamBuilder;->productId:Ljava/lang/String;

    .line 6
    .line 7
    const-string p4, "identity"

    .line 8
    .line 9
    iput-object p4, p0, Lcom/p1/mobile/putong/data/VerificationTokenRequestParam$VerificationTokenRequestParamBuilder;->type:Ljava/lang/String;

    .line 10
    .line 11
    iput-object p5, p0, Lcom/p1/mobile/putong/data/VerificationTokenRequestParam$VerificationTokenRequestParamBuilder;->retrieveId:Ljava/lang/String;

    .line 12
    .line 13
    invoke-static {}, Lcom/p1/mobile/putong/data/VerificationTokenIdentity;->new_()Lcom/p1/mobile/putong/data/VerificationTokenIdentity;

    .line 14
    .line 15
    .line 16
    move-result-object p4

    .line 17
    iput-object p3, p4, Lcom/p1/mobile/putong/data/VerificationTokenIdentity;->provider:Ljava/lang/String;

    .line 18
    .line 19
    const/4 p3, 0x1

    .line 20
    iput-boolean p3, p4, Lcom/p1/mobile/putong/data/VerificationTokenIdentity;->dynamicProvider:Z

    .line 21
    .line 22
    iget-object p3, p0, Lcom/p1/mobile/putong/data/VerificationTokenRequestParam$VerificationTokenRequestParamBuilder;->idName:Ljava/lang/String;

    .line 23
    .line 24
    iput-object p3, p4, Lcom/p1/mobile/putong/data/VerificationTokenIdentity;->identityName:Ljava/lang/String;

    .line 25
    .line 26
    iget-object p3, p0, Lcom/p1/mobile/putong/data/VerificationTokenRequestParam$VerificationTokenRequestParamBuilder;->idNumber:Ljava/lang/String;

    .line 27
    .line 28
    iput-object p3, p4, Lcom/p1/mobile/putong/data/VerificationTokenIdentity;->identityNumber:Ljava/lang/String;

    .line 29
    .line 30
    iput-boolean p2, p4, Lcom/p1/mobile/putong/data/VerificationTokenIdentity;->upgrade:Z

    .line 31
    .line 32
    invoke-static {}, Lcom/p1/mobile/putong/facertification/TTFacertificationClient;->q()Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object p2

    .line 36
    iput-object p2, p4, Lcom/p1/mobile/putong/data/VerificationTokenIdentity;->providerAppId:Ljava/lang/String;

    .line 37
    .line 38
    iput-object p1, p4, Lcom/p1/mobile/putong/data/VerificationTokenIdentity;->metaInfo:Ljava/lang/String;

    .line 39
    .line 40
    iput-object p4, p0, Lcom/p1/mobile/putong/data/VerificationTokenRequestParam$VerificationTokenRequestParamBuilder;->identity:Lcom/p1/mobile/putong/data/VerificationTokenIdentity;

    .line 41
    .line 42
    return-object p0
.end method

.method public useCoreTemplate(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/p1/mobile/putong/data/VerificationTokenRequestParam$VerificationTokenRequestParamBuilder;
    .locals 1

    .line 1
    const-string v0, "1"

    .line 2
    .line 3
    iput-object v0, p0, Lcom/p1/mobile/putong/data/VerificationTokenRequestParam$VerificationTokenRequestParamBuilder;->appId:Ljava/lang/String;

    .line 4
    .line 5
    iput-object p1, p0, Lcom/p1/mobile/putong/data/VerificationTokenRequestParam$VerificationTokenRequestParamBuilder;->productId:Ljava/lang/String;

    .line 6
    .line 7
    const-string p1, "picture"

    .line 8
    .line 9
    iput-object p1, p0, Lcom/p1/mobile/putong/data/VerificationTokenRequestParam$VerificationTokenRequestParamBuilder;->type:Ljava/lang/String;

    .line 10
    .line 11
    invoke-static {}, Lcom/p1/mobile/putong/data/VerificationTokenIdentity;->new_()Lcom/p1/mobile/putong/data/VerificationTokenIdentity;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    invoke-static {}, Lcom/p1/mobile/putong/facertification/TTFacertificationClient;->q()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    iput-object v0, p1, Lcom/p1/mobile/putong/data/VerificationTokenIdentity;->providerAppId:Ljava/lang/String;

    .line 20
    .line 21
    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    iput-boolean v0, p1, Lcom/p1/mobile/putong/data/VerificationTokenIdentity;->dynamicProvider:Z

    .line 26
    .line 27
    iput-object p3, p1, Lcom/p1/mobile/putong/data/VerificationTokenIdentity;->provider:Ljava/lang/String;

    .line 28
    .line 29
    iput-object p2, p1, Lcom/p1/mobile/putong/data/VerificationTokenIdentity;->metaInfo:Ljava/lang/String;

    .line 30
    .line 31
    iput-object p1, p0, Lcom/p1/mobile/putong/data/VerificationTokenRequestParam$VerificationTokenRequestParamBuilder;->picture:Lcom/p1/mobile/putong/data/VerificationTokenIdentity;

    .line 32
    .line 33
    return-object p0
.end method

.method public useCountryAccountBackTemplate(Ljava/lang/String;ZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/p1/mobile/putong/data/VerificationTokenRequestParam$VerificationTokenRequestParamBuilder;
    .locals 0

    .line 1
    const-string p2, "1"

    .line 2
    .line 3
    iput-object p2, p0, Lcom/p1/mobile/putong/data/VerificationTokenRequestParam$VerificationTokenRequestParamBuilder;->appId:Ljava/lang/String;

    .line 4
    .line 5
    iput-object p4, p0, Lcom/p1/mobile/putong/data/VerificationTokenRequestParam$VerificationTokenRequestParamBuilder;->productId:Ljava/lang/String;

    .line 6
    .line 7
    const-string p2, "ctdid_picture"

    .line 8
    .line 9
    iput-object p2, p0, Lcom/p1/mobile/putong/data/VerificationTokenRequestParam$VerificationTokenRequestParamBuilder;->type:Ljava/lang/String;

    .line 10
    .line 11
    iput-object p5, p0, Lcom/p1/mobile/putong/data/VerificationTokenRequestParam$VerificationTokenRequestParamBuilder;->retrieveId:Ljava/lang/String;

    .line 12
    .line 13
    invoke-static {}, Lcom/p1/mobile/putong/data/VerificationTokenIdentity;->new_()Lcom/p1/mobile/putong/data/VerificationTokenIdentity;

    .line 14
    .line 15
    .line 16
    move-result-object p2

    .line 17
    invoke-static {}, Lcom/p1/mobile/putong/facertification/TTFacertificationClient;->q()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object p4

    .line 21
    iput-object p4, p2, Lcom/p1/mobile/putong/data/VerificationTokenIdentity;->providerAppId:Ljava/lang/String;

    .line 22
    .line 23
    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 24
    .line 25
    .line 26
    move-result p3

    .line 27
    iput-boolean p3, p2, Lcom/p1/mobile/putong/data/VerificationTokenIdentity;->dynamicProvider:Z

    .line 28
    .line 29
    iput-object p1, p2, Lcom/p1/mobile/putong/data/VerificationTokenIdentity;->metaInfo:Ljava/lang/String;

    .line 30
    .line 31
    iput-object p2, p0, Lcom/p1/mobile/putong/data/VerificationTokenRequestParam$VerificationTokenRequestParamBuilder;->picture:Lcom/p1/mobile/putong/data/VerificationTokenIdentity;

    .line 32
    .line 33
    return-object p0
.end method

.method public useCountryTemplate(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/p1/mobile/putong/data/VerificationTokenRequestParam$VerificationTokenRequestParamBuilder;
    .locals 1

    .line 1
    const-string v0, "1"

    .line 2
    .line 3
    iput-object v0, p0, Lcom/p1/mobile/putong/data/VerificationTokenRequestParam$VerificationTokenRequestParamBuilder;->appId:Ljava/lang/String;

    .line 4
    .line 5
    iput-object p1, p0, Lcom/p1/mobile/putong/data/VerificationTokenRequestParam$VerificationTokenRequestParamBuilder;->productId:Ljava/lang/String;

    .line 6
    .line 7
    const-string p1, "ctdid_picture"

    .line 8
    .line 9
    iput-object p1, p0, Lcom/p1/mobile/putong/data/VerificationTokenRequestParam$VerificationTokenRequestParamBuilder;->type:Ljava/lang/String;

    .line 10
    .line 11
    invoke-static {}, Lcom/p1/mobile/putong/data/VerificationTokenIdentity;->new_()Lcom/p1/mobile/putong/data/VerificationTokenIdentity;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    invoke-static {}, Lcom/p1/mobile/putong/facertification/TTFacertificationClient;->q()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    iput-object v0, p1, Lcom/p1/mobile/putong/data/VerificationTokenIdentity;->providerAppId:Ljava/lang/String;

    .line 20
    .line 21
    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    iput-boolean v0, p1, Lcom/p1/mobile/putong/data/VerificationTokenIdentity;->dynamicProvider:Z

    .line 26
    .line 27
    iput-object p3, p1, Lcom/p1/mobile/putong/data/VerificationTokenIdentity;->provider:Ljava/lang/String;

    .line 28
    .line 29
    iput-object p2, p1, Lcom/p1/mobile/putong/data/VerificationTokenIdentity;->metaInfo:Ljava/lang/String;

    .line 30
    .line 31
    iput-object p1, p0, Lcom/p1/mobile/putong/data/VerificationTokenRequestParam$VerificationTokenRequestParamBuilder;->picture:Lcom/p1/mobile/putong/data/VerificationTokenIdentity;

    .line 32
    .line 33
    return-object p0
.end method

.method public useLiveTemplate()Lcom/p1/mobile/putong/data/VerificationTokenRequestParam$VerificationTokenRequestParamBuilder;
    .locals 2

    .line 1
    const-string v0, "1"

    .line 2
    .line 3
    iput-object v0, p0, Lcom/p1/mobile/putong/data/VerificationTokenRequestParam$VerificationTokenRequestParamBuilder;->appId:Ljava/lang/String;

    .line 4
    .line 5
    const-string v0, "3"

    .line 6
    .line 7
    iput-object v0, p0, Lcom/p1/mobile/putong/data/VerificationTokenRequestParam$VerificationTokenRequestParamBuilder;->productId:Ljava/lang/String;

    .line 8
    .line 9
    const-string v0, "identity"

    .line 10
    .line 11
    iput-object v0, p0, Lcom/p1/mobile/putong/data/VerificationTokenRequestParam$VerificationTokenRequestParamBuilder;->type:Ljava/lang/String;

    .line 12
    .line 13
    const-string v0, "aliyun"

    .line 14
    .line 15
    iput-object v0, p0, Lcom/p1/mobile/putong/data/VerificationTokenRequestParam$VerificationTokenRequestParamBuilder;->provider:Ljava/lang/String;

    .line 16
    .line 17
    invoke-static {}, Lcom/p1/mobile/putong/data/VerificationTokenIdentity;->new_()Lcom/p1/mobile/putong/data/VerificationTokenIdentity;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    iget-object v1, p0, Lcom/p1/mobile/putong/data/VerificationTokenRequestParam$VerificationTokenRequestParamBuilder;->provider:Ljava/lang/String;

    .line 22
    .line 23
    iput-object v1, v0, Lcom/p1/mobile/putong/data/VerificationTokenIdentity;->provider:Ljava/lang/String;

    .line 24
    .line 25
    iget-object v1, p0, Lcom/p1/mobile/putong/data/VerificationTokenRequestParam$VerificationTokenRequestParamBuilder;->idNumber:Ljava/lang/String;

    .line 26
    .line 27
    iput-object v1, v0, Lcom/p1/mobile/putong/data/VerificationTokenIdentity;->identityNumber:Ljava/lang/String;

    .line 28
    .line 29
    iget-object v1, p0, Lcom/p1/mobile/putong/data/VerificationTokenRequestParam$VerificationTokenRequestParamBuilder;->idName:Ljava/lang/String;

    .line 30
    .line 31
    iput-object v1, v0, Lcom/p1/mobile/putong/data/VerificationTokenIdentity;->identityName:Ljava/lang/String;

    .line 32
    .line 33
    iput-object v0, p0, Lcom/p1/mobile/putong/data/VerificationTokenRequestParam$VerificationTokenRequestParamBuilder;->identity:Lcom/p1/mobile/putong/data/VerificationTokenIdentity;

    .line 34
    .line 35
    return-object p0
.end method

.method public useNewLiveTemplate(Ljava/lang/String;ZLjava/lang/String;Ljava/lang/String;)Lcom/p1/mobile/putong/data/VerificationTokenRequestParam$VerificationTokenRequestParamBuilder;
    .locals 1

    .line 1
    const-string v0, "1"

    .line 2
    .line 3
    iput-object v0, p0, Lcom/p1/mobile/putong/data/VerificationTokenRequestParam$VerificationTokenRequestParamBuilder;->appId:Ljava/lang/String;

    .line 4
    .line 5
    iput-object p4, p0, Lcom/p1/mobile/putong/data/VerificationTokenRequestParam$VerificationTokenRequestParamBuilder;->productId:Ljava/lang/String;

    .line 6
    .line 7
    const-string p4, "identity"

    .line 8
    .line 9
    iput-object p4, p0, Lcom/p1/mobile/putong/data/VerificationTokenRequestParam$VerificationTokenRequestParamBuilder;->type:Ljava/lang/String;

    .line 10
    .line 11
    invoke-static {}, Lcom/p1/mobile/putong/data/VerificationTokenIdentity;->new_()Lcom/p1/mobile/putong/data/VerificationTokenIdentity;

    .line 12
    .line 13
    .line 14
    move-result-object p4

    .line 15
    iput-object p3, p4, Lcom/p1/mobile/putong/data/VerificationTokenIdentity;->provider:Ljava/lang/String;

    .line 16
    .line 17
    const/4 p3, 0x0

    .line 18
    iput-boolean p3, p4, Lcom/p1/mobile/putong/data/VerificationTokenIdentity;->dynamicProvider:Z

    .line 19
    .line 20
    iget-object p3, p0, Lcom/p1/mobile/putong/data/VerificationTokenRequestParam$VerificationTokenRequestParamBuilder;->idName:Ljava/lang/String;

    .line 21
    .line 22
    iput-object p3, p4, Lcom/p1/mobile/putong/data/VerificationTokenIdentity;->identityName:Ljava/lang/String;

    .line 23
    .line 24
    iget-object p3, p0, Lcom/p1/mobile/putong/data/VerificationTokenRequestParam$VerificationTokenRequestParamBuilder;->idNumber:Ljava/lang/String;

    .line 25
    .line 26
    iput-object p3, p4, Lcom/p1/mobile/putong/data/VerificationTokenIdentity;->identityNumber:Ljava/lang/String;

    .line 27
    .line 28
    iput-boolean p2, p4, Lcom/p1/mobile/putong/data/VerificationTokenIdentity;->upgrade:Z

    .line 29
    .line 30
    iput-object p1, p4, Lcom/p1/mobile/putong/data/VerificationTokenIdentity;->metaInfo:Ljava/lang/String;

    .line 31
    .line 32
    iput-object p4, p0, Lcom/p1/mobile/putong/data/VerificationTokenRequestParam$VerificationTokenRequestParamBuilder;->identity:Lcom/p1/mobile/putong/data/VerificationTokenIdentity;

    .line 33
    .line 34
    return-object p0
.end method

.method public useServerTemplate(Ljava/lang/String;ZLjava/lang/String;Ljava/lang/String;)Lcom/p1/mobile/putong/data/VerificationTokenRequestParam$VerificationTokenRequestParamBuilder;
    .locals 1

    .line 1
    const-string v0, "1"

    .line 2
    .line 3
    iput-object v0, p0, Lcom/p1/mobile/putong/data/VerificationTokenRequestParam$VerificationTokenRequestParamBuilder;->appId:Ljava/lang/String;

    .line 4
    .line 5
    iput-object p4, p0, Lcom/p1/mobile/putong/data/VerificationTokenRequestParam$VerificationTokenRequestParamBuilder;->productId:Ljava/lang/String;

    .line 6
    .line 7
    const-string p4, "identity"

    .line 8
    .line 9
    iput-object p4, p0, Lcom/p1/mobile/putong/data/VerificationTokenRequestParam$VerificationTokenRequestParamBuilder;->type:Ljava/lang/String;

    .line 10
    .line 11
    invoke-static {}, Lcom/p1/mobile/putong/data/VerificationTokenIdentity;->new_()Lcom/p1/mobile/putong/data/VerificationTokenIdentity;

    .line 12
    .line 13
    .line 14
    move-result-object p4

    .line 15
    iput-object p3, p4, Lcom/p1/mobile/putong/data/VerificationTokenIdentity;->provider:Ljava/lang/String;

    .line 16
    .line 17
    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 18
    .line 19
    .line 20
    move-result p3

    .line 21
    iput-boolean p3, p4, Lcom/p1/mobile/putong/data/VerificationTokenIdentity;->dynamicProvider:Z

    .line 22
    .line 23
    iget-object p3, p0, Lcom/p1/mobile/putong/data/VerificationTokenRequestParam$VerificationTokenRequestParamBuilder;->idName:Ljava/lang/String;

    .line 24
    .line 25
    iput-object p3, p4, Lcom/p1/mobile/putong/data/VerificationTokenIdentity;->identityName:Ljava/lang/String;

    .line 26
    .line 27
    iget-object p3, p0, Lcom/p1/mobile/putong/data/VerificationTokenRequestParam$VerificationTokenRequestParamBuilder;->idNumber:Ljava/lang/String;

    .line 28
    .line 29
    iput-object p3, p4, Lcom/p1/mobile/putong/data/VerificationTokenIdentity;->identityNumber:Ljava/lang/String;

    .line 30
    .line 31
    iput-boolean p2, p4, Lcom/p1/mobile/putong/data/VerificationTokenIdentity;->upgrade:Z

    .line 32
    .line 33
    invoke-static {}, Lcom/p1/mobile/putong/facertification/TTFacertificationClient;->q()Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object p2

    .line 37
    iput-object p2, p4, Lcom/p1/mobile/putong/data/VerificationTokenIdentity;->providerAppId:Ljava/lang/String;

    .line 38
    .line 39
    iput-object p1, p4, Lcom/p1/mobile/putong/data/VerificationTokenIdentity;->metaInfo:Ljava/lang/String;

    .line 40
    .line 41
    iput-object p4, p0, Lcom/p1/mobile/putong/data/VerificationTokenRequestParam$VerificationTokenRequestParamBuilder;->identity:Lcom/p1/mobile/putong/data/VerificationTokenIdentity;

    .line 42
    .line 43
    return-object p0
.end method

.method public useTestAliTemplate(Ljava/lang/String;Ljava/lang/String;)Lcom/p1/mobile/putong/data/VerificationTokenRequestParam$VerificationTokenRequestParamBuilder;
    .locals 1
    .annotation build Lorg/jetbrains/annotations/TestOnly;
    .end annotation

    .line 1
    const-string v0, "1"

    .line 2
    .line 3
    iput-object v0, p0, Lcom/p1/mobile/putong/data/VerificationTokenRequestParam$VerificationTokenRequestParamBuilder;->appId:Ljava/lang/String;

    .line 4
    .line 5
    iput-object p2, p0, Lcom/p1/mobile/putong/data/VerificationTokenRequestParam$VerificationTokenRequestParamBuilder;->productId:Ljava/lang/String;

    .line 6
    .line 7
    const-string p2, "picture"

    .line 8
    .line 9
    iput-object p2, p0, Lcom/p1/mobile/putong/data/VerificationTokenRequestParam$VerificationTokenRequestParamBuilder;->type:Ljava/lang/String;

    .line 10
    .line 11
    invoke-static {}, Lcom/p1/mobile/putong/data/VerificationTokenIdentity;->new_()Lcom/p1/mobile/putong/data/VerificationTokenIdentity;

    .line 12
    .line 13
    .line 14
    move-result-object p2

    .line 15
    const/4 v0, 0x0

    .line 16
    iput-boolean v0, p2, Lcom/p1/mobile/putong/data/VerificationTokenIdentity;->dynamicProvider:Z

    .line 17
    .line 18
    const-string v0, "aliyun"

    .line 19
    .line 20
    iput-object v0, p2, Lcom/p1/mobile/putong/data/VerificationTokenIdentity;->provider:Ljava/lang/String;

    .line 21
    .line 22
    iput-object p1, p2, Lcom/p1/mobile/putong/data/VerificationTokenIdentity;->metaInfo:Ljava/lang/String;

    .line 23
    .line 24
    iput-object p2, p0, Lcom/p1/mobile/putong/data/VerificationTokenRequestParam$VerificationTokenRequestParamBuilder;->picture:Lcom/p1/mobile/putong/data/VerificationTokenIdentity;

    .line 25
    .line 26
    return-object p0
.end method

.method public useTestMoMoTemplate(Ljava/lang/String;)Lcom/p1/mobile/putong/data/VerificationTokenRequestParam$VerificationTokenRequestParamBuilder;
    .locals 1
    .annotation build Lorg/jetbrains/annotations/TestOnly;
    .end annotation

    .line 1
    const-string v0, "1"

    .line 2
    .line 3
    iput-object v0, p0, Lcom/p1/mobile/putong/data/VerificationTokenRequestParam$VerificationTokenRequestParamBuilder;->appId:Ljava/lang/String;

    .line 4
    .line 5
    iput-object p1, p0, Lcom/p1/mobile/putong/data/VerificationTokenRequestParam$VerificationTokenRequestParamBuilder;->productId:Ljava/lang/String;

    .line 6
    .line 7
    const-string p1, "picture"

    .line 8
    .line 9
    iput-object p1, p0, Lcom/p1/mobile/putong/data/VerificationTokenRequestParam$VerificationTokenRequestParamBuilder;->type:Ljava/lang/String;

    .line 10
    .line 11
    invoke-static {}, Lcom/p1/mobile/putong/data/VerificationTokenIdentity;->new_()Lcom/p1/mobile/putong/data/VerificationTokenIdentity;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    invoke-static {}, Lcom/p1/mobile/putong/facertification/TTFacertificationClient;->q()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    iput-object v0, p1, Lcom/p1/mobile/putong/data/VerificationTokenIdentity;->providerAppId:Ljava/lang/String;

    .line 20
    .line 21
    const/4 v0, 0x0

    .line 22
    iput-boolean v0, p1, Lcom/p1/mobile/putong/data/VerificationTokenIdentity;->dynamicProvider:Z

    .line 23
    .line 24
    const-string v0, "momocv"

    .line 25
    .line 26
    iput-object v0, p1, Lcom/p1/mobile/putong/data/VerificationTokenIdentity;->provider:Ljava/lang/String;

    .line 27
    .line 28
    iput-object p1, p0, Lcom/p1/mobile/putong/data/VerificationTokenRequestParam$VerificationTokenRequestParamBuilder;->picture:Lcom/p1/mobile/putong/data/VerificationTokenIdentity;

    .line 29
    .line 30
    return-object p0
.end method

.method public useTestTencentIntlTemplate(Ljava/lang/String;)Lcom/p1/mobile/putong/data/VerificationTokenRequestParam$VerificationTokenRequestParamBuilder;
    .locals 1
    .annotation build Lorg/jetbrains/annotations/TestOnly;
    .end annotation

    .line 1
    const-string v0, "1"

    .line 2
    .line 3
    iput-object v0, p0, Lcom/p1/mobile/putong/data/VerificationTokenRequestParam$VerificationTokenRequestParamBuilder;->appId:Ljava/lang/String;

    .line 4
    .line 5
    iput-object p1, p0, Lcom/p1/mobile/putong/data/VerificationTokenRequestParam$VerificationTokenRequestParamBuilder;->productId:Ljava/lang/String;

    .line 6
    .line 7
    const-string p1, "picture"

    .line 8
    .line 9
    iput-object p1, p0, Lcom/p1/mobile/putong/data/VerificationTokenRequestParam$VerificationTokenRequestParamBuilder;->type:Ljava/lang/String;

    .line 10
    .line 11
    invoke-static {}, Lcom/p1/mobile/putong/data/VerificationTokenIdentity;->new_()Lcom/p1/mobile/putong/data/VerificationTokenIdentity;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    invoke-static {}, Lcom/p1/mobile/putong/facertification/TTFacertificationClient;->q()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    iput-object v0, p1, Lcom/p1/mobile/putong/data/VerificationTokenIdentity;->providerAppId:Ljava/lang/String;

    .line 20
    .line 21
    const/4 v0, 0x0

    .line 22
    iput-boolean v0, p1, Lcom/p1/mobile/putong/data/VerificationTokenIdentity;->dynamicProvider:Z

    .line 23
    .line 24
    const-string v0, "tencentIntl"

    .line 25
    .line 26
    iput-object v0, p1, Lcom/p1/mobile/putong/data/VerificationTokenIdentity;->provider:Ljava/lang/String;

    .line 27
    .line 28
    iput-object p1, p0, Lcom/p1/mobile/putong/data/VerificationTokenRequestParam$VerificationTokenRequestParamBuilder;->picture:Lcom/p1/mobile/putong/data/VerificationTokenIdentity;

    .line 29
    .line 30
    return-object p0
.end method

.method public useTestTencentTemplate(Ljava/lang/String;)Lcom/p1/mobile/putong/data/VerificationTokenRequestParam$VerificationTokenRequestParamBuilder;
    .locals 1
    .annotation build Lorg/jetbrains/annotations/TestOnly;
    .end annotation

    .line 1
    const-string v0, "1"

    .line 2
    .line 3
    iput-object v0, p0, Lcom/p1/mobile/putong/data/VerificationTokenRequestParam$VerificationTokenRequestParamBuilder;->appId:Ljava/lang/String;

    .line 4
    .line 5
    iput-object p1, p0, Lcom/p1/mobile/putong/data/VerificationTokenRequestParam$VerificationTokenRequestParamBuilder;->productId:Ljava/lang/String;

    .line 6
    .line 7
    const-string p1, "picture"

    .line 8
    .line 9
    iput-object p1, p0, Lcom/p1/mobile/putong/data/VerificationTokenRequestParam$VerificationTokenRequestParamBuilder;->type:Ljava/lang/String;

    .line 10
    .line 11
    invoke-static {}, Lcom/p1/mobile/putong/data/VerificationTokenIdentity;->new_()Lcom/p1/mobile/putong/data/VerificationTokenIdentity;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    invoke-static {}, Lcom/p1/mobile/putong/facertification/TTFacertificationClient;->q()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    iput-object v0, p1, Lcom/p1/mobile/putong/data/VerificationTokenIdentity;->providerAppId:Ljava/lang/String;

    .line 20
    .line 21
    const/4 v0, 0x0

    .line 22
    iput-boolean v0, p1, Lcom/p1/mobile/putong/data/VerificationTokenIdentity;->dynamicProvider:Z

    .line 23
    .line 24
    const-string v0, "tencent"

    .line 25
    .line 26
    iput-object v0, p1, Lcom/p1/mobile/putong/data/VerificationTokenIdentity;->provider:Ljava/lang/String;

    .line 27
    .line 28
    iput-object p1, p0, Lcom/p1/mobile/putong/data/VerificationTokenRequestParam$VerificationTokenRequestParamBuilder;->picture:Lcom/p1/mobile/putong/data/VerificationTokenIdentity;

    .line 29
    .line 30
    return-object p0
.end method

.method public useTestVolcFaceTemplate(Ljava/lang/String;)Lcom/p1/mobile/putong/data/VerificationTokenRequestParam$VerificationTokenRequestParamBuilder;
    .locals 1
    .annotation build Lorg/jetbrains/annotations/TestOnly;
    .end annotation

    .line 1
    const-string v0, "1"

    .line 2
    .line 3
    iput-object v0, p0, Lcom/p1/mobile/putong/data/VerificationTokenRequestParam$VerificationTokenRequestParamBuilder;->appId:Ljava/lang/String;

    .line 4
    .line 5
    iput-object p1, p0, Lcom/p1/mobile/putong/data/VerificationTokenRequestParam$VerificationTokenRequestParamBuilder;->productId:Ljava/lang/String;

    .line 6
    .line 7
    const-string p1, "picture"

    .line 8
    .line 9
    iput-object p1, p0, Lcom/p1/mobile/putong/data/VerificationTokenRequestParam$VerificationTokenRequestParamBuilder;->type:Ljava/lang/String;

    .line 10
    .line 11
    invoke-static {}, Lcom/p1/mobile/putong/data/VerificationTokenIdentity;->new_()Lcom/p1/mobile/putong/data/VerificationTokenIdentity;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    const/4 v0, 0x0

    .line 16
    iput-boolean v0, p1, Lcom/p1/mobile/putong/data/VerificationTokenIdentity;->dynamicProvider:Z

    .line 17
    .line 18
    const-string v0, "volcEnginePro"

    .line 19
    .line 20
    iput-object v0, p1, Lcom/p1/mobile/putong/data/VerificationTokenIdentity;->provider:Ljava/lang/String;

    .line 21
    .line 22
    iput-object p1, p0, Lcom/p1/mobile/putong/data/VerificationTokenRequestParam$VerificationTokenRequestParamBuilder;->picture:Lcom/p1/mobile/putong/data/VerificationTokenIdentity;

    .line 23
    .line 24
    return-object p0
.end method

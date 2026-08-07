.class public Lcom/alibaba/sdk/android/oss/signer/OSSSignerParams;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private additionalHeaderNames:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private cloudBoxId:Ljava/lang/String;

.field private credentialProvider:Lcom/alibaba/sdk/android/oss/common/auth/OSSCredentialProvider;

.field private expiration:J

.field private product:Ljava/lang/String;

.field private region:Ljava/lang/String;

.field private resourcePath:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Lcom/alibaba/sdk/android/oss/common/auth/OSSCredentialProvider;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/HashSet;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/alibaba/sdk/android/oss/signer/OSSSignerParams;->additionalHeaderNames:Ljava/util/Set;

    .line 10
    .line 11
    iput-object p1, p0, Lcom/alibaba/sdk/android/oss/signer/OSSSignerParams;->resourcePath:Ljava/lang/String;

    .line 12
    .line 13
    iput-object p2, p0, Lcom/alibaba/sdk/android/oss/signer/OSSSignerParams;->credentialProvider:Lcom/alibaba/sdk/android/oss/common/auth/OSSCredentialProvider;

    .line 14
    .line 15
    return-void
.end method


# virtual methods
.method public getAdditionalHeaderNames()Ljava/util/Set;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/alibaba/sdk/android/oss/signer/OSSSignerParams;->additionalHeaderNames:Ljava/util/Set;

    .line 2
    .line 3
    return-object p0
.end method

.method public getCloudBoxId()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/alibaba/sdk/android/oss/signer/OSSSignerParams;->cloudBoxId:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getCredentialProvider()Lcom/alibaba/sdk/android/oss/common/auth/OSSCredentialProvider;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/alibaba/sdk/android/oss/signer/OSSSignerParams;->credentialProvider:Lcom/alibaba/sdk/android/oss/common/auth/OSSCredentialProvider;

    .line 2
    .line 3
    return-object p0
.end method

.method public getExpiration()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/alibaba/sdk/android/oss/signer/OSSSignerParams;->expiration:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public getProduct()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/alibaba/sdk/android/oss/signer/OSSSignerParams;->product:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getRegion()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/alibaba/sdk/android/oss/signer/OSSSignerParams;->region:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getResourcePath()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/alibaba/sdk/android/oss/signer/OSSSignerParams;->resourcePath:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public setAdditionalHeaderNames(Ljava/util/Set;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/alibaba/sdk/android/oss/signer/OSSSignerParams;->additionalHeaderNames:Ljava/util/Set;

    .line 2
    .line 3
    return-void
.end method

.method public setCloudBoxId(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/alibaba/sdk/android/oss/signer/OSSSignerParams;->cloudBoxId:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setCredentialProvider(Lcom/alibaba/sdk/android/oss/common/auth/OSSCredentialProvider;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/alibaba/sdk/android/oss/signer/OSSSignerParams;->credentialProvider:Lcom/alibaba/sdk/android/oss/common/auth/OSSCredentialProvider;

    .line 2
    .line 3
    return-void
.end method

.method public setExpiration(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/alibaba/sdk/android/oss/signer/OSSSignerParams;->expiration:J

    .line 2
    .line 3
    return-void
.end method

.method public setProduct(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/alibaba/sdk/android/oss/signer/OSSSignerParams;->product:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setRegion(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/alibaba/sdk/android/oss/signer/OSSSignerParams;->region:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setResourcePath(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/alibaba/sdk/android/oss/signer/OSSSignerParams;->resourcePath:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

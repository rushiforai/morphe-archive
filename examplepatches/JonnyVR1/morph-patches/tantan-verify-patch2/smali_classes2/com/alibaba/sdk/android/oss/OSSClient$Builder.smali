.class public Lcom/alibaba/sdk/android/oss/OSSClient$Builder;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/alibaba/sdk/android/oss/OSSClient;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation


# instance fields
.field private clientConfiguration:Lcom/alibaba/sdk/android/oss/ClientConfiguration;

.field private cloudBoxId:Ljava/lang/String;

.field private context:Landroid/content/Context;

.field private credentialProvider:Lcom/alibaba/sdk/android/oss/common/auth/OSSCredentialProvider;

.field private endpoint:Ljava/lang/String;

.field private region:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Lcom/alibaba/sdk/android/oss/ClientConfiguration;->getDefaultConf()Lcom/alibaba/sdk/android/oss/ClientConfiguration;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iput-object v0, p0, Lcom/alibaba/sdk/android/oss/OSSClient$Builder;->clientConfiguration:Lcom/alibaba/sdk/android/oss/ClientConfiguration;

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public build()Lcom/alibaba/sdk/android/oss/OSS;
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/alibaba/sdk/android/oss/OSSClient$Builder;->context:Landroid/content/Context;

    .line 2
    .line 3
    const-string v1, "Endpoint haven\'t been set!"

    .line 4
    .line 5
    invoke-static {v0, v1}, Lcom/alibaba/sdk/android/oss/common/utils/OSSUtils;->assertNotNull(Ljava/lang/Object;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/alibaba/sdk/android/oss/OSSClient$Builder;->endpoint:Ljava/lang/String;

    .line 9
    .line 10
    invoke-static {v0, v1}, Lcom/alibaba/sdk/android/oss/common/utils/OSSUtils;->assertNotNull(Ljava/lang/Object;Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Lcom/alibaba/sdk/android/oss/OSSClient$Builder;->credentialProvider:Lcom/alibaba/sdk/android/oss/common/auth/OSSCredentialProvider;

    .line 14
    .line 15
    const-string v1, "CredentialProvider haven\'t been set!"

    .line 16
    .line 17
    invoke-static {v0, v1}, Lcom/alibaba/sdk/android/oss/common/utils/OSSUtils;->assertNotNull(Ljava/lang/Object;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Lcom/alibaba/sdk/android/oss/OSSClient$Builder;->clientConfiguration:Lcom/alibaba/sdk/android/oss/ClientConfiguration;

    .line 21
    .line 22
    invoke-virtual {v0}, Lcom/alibaba/sdk/android/oss/ClientConfiguration;->getSignVersion()Lcom/alibaba/sdk/android/oss/signer/SignVersion;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    sget-object v1, Lcom/alibaba/sdk/android/oss/signer/SignVersion;->V4:Lcom/alibaba/sdk/android/oss/signer/SignVersion;

    .line 27
    .line 28
    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    if-eqz v0, :cond_0

    .line 33
    .line 34
    iget-object v0, p0, Lcom/alibaba/sdk/android/oss/OSSClient$Builder;->region:Ljava/lang/String;

    .line 35
    .line 36
    const-string v1, "Region haven\'t been set!"

    .line 37
    .line 38
    invoke-static {v0, v1}, Lcom/alibaba/sdk/android/oss/common/utils/OSSUtils;->assertNotNull(Ljava/lang/Object;Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    :cond_0
    new-instance v0, Lcom/alibaba/sdk/android/oss/OSSClient;

    .line 42
    .line 43
    iget-object v1, p0, Lcom/alibaba/sdk/android/oss/OSSClient$Builder;->context:Landroid/content/Context;

    .line 44
    .line 45
    iget-object v2, p0, Lcom/alibaba/sdk/android/oss/OSSClient$Builder;->endpoint:Ljava/lang/String;

    .line 46
    .line 47
    iget-object v3, p0, Lcom/alibaba/sdk/android/oss/OSSClient$Builder;->credentialProvider:Lcom/alibaba/sdk/android/oss/common/auth/OSSCredentialProvider;

    .line 48
    .line 49
    iget-object v4, p0, Lcom/alibaba/sdk/android/oss/OSSClient$Builder;->clientConfiguration:Lcom/alibaba/sdk/android/oss/ClientConfiguration;

    .line 50
    .line 51
    invoke-direct {v0, v1, v2, v3, v4}, Lcom/alibaba/sdk/android/oss/OSSClient;-><init>(Landroid/content/Context;Ljava/lang/String;Lcom/alibaba/sdk/android/oss/common/auth/OSSCredentialProvider;Lcom/alibaba/sdk/android/oss/ClientConfiguration;)V

    .line 52
    .line 53
    .line 54
    iget-object v1, p0, Lcom/alibaba/sdk/android/oss/OSSClient$Builder;->region:Ljava/lang/String;

    .line 55
    .line 56
    invoke-virtual {v0, v1}, Lcom/alibaba/sdk/android/oss/OSSClient;->setRegion(Ljava/lang/String;)V

    .line 57
    .line 58
    .line 59
    iget-object p0, p0, Lcom/alibaba/sdk/android/oss/OSSClient$Builder;->cloudBoxId:Ljava/lang/String;

    .line 60
    .line 61
    invoke-virtual {v0, p0}, Lcom/alibaba/sdk/android/oss/OSSClient;->setCloudBoxId(Ljava/lang/String;)V

    .line 62
    .line 63
    .line 64
    return-object v0
.end method

.method public clientConfiguration(Lcom/alibaba/sdk/android/oss/ClientConfiguration;)Lcom/alibaba/sdk/android/oss/OSSClient$Builder;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/alibaba/sdk/android/oss/OSSClient$Builder;->clientConfiguration:Lcom/alibaba/sdk/android/oss/ClientConfiguration;

    .line 2
    .line 3
    return-object p0
.end method

.method public cloudBoxId(Ljava/lang/String;)Lcom/alibaba/sdk/android/oss/OSSClient$Builder;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/alibaba/sdk/android/oss/OSSClient$Builder;->cloudBoxId:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public context(Landroid/content/Context;)Lcom/alibaba/sdk/android/oss/OSSClient$Builder;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/alibaba/sdk/android/oss/OSSClient$Builder;->context:Landroid/content/Context;

    .line 2
    .line 3
    return-object p0
.end method

.method public credentialsProvider(Lcom/alibaba/sdk/android/oss/common/auth/OSSCredentialProvider;)Lcom/alibaba/sdk/android/oss/OSSClient$Builder;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/alibaba/sdk/android/oss/OSSClient$Builder;->credentialProvider:Lcom/alibaba/sdk/android/oss/common/auth/OSSCredentialProvider;

    .line 2
    .line 3
    return-object p0
.end method

.method public endpoint(Ljava/lang/String;)Lcom/alibaba/sdk/android/oss/OSSClient$Builder;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/alibaba/sdk/android/oss/OSSClient$Builder;->endpoint:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public region(Ljava/lang/String;)Lcom/alibaba/sdk/android/oss/OSSClient$Builder;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/alibaba/sdk/android/oss/OSSClient$Builder;->region:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.class public Lcom/hihonor/push/framework/aidl/entity/RequestHeader;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/hihonor/push/framework/aidl/IMessageEntity;


# instance fields
.field private AAID:Ljava/lang/String;
    .annotation runtime Lcom/hihonor/push/framework/aidl/annotation/Packed;
    .end annotation
.end field

.field private appId:Ljava/lang/String;
    .annotation runtime Lcom/hihonor/push/framework/aidl/annotation/Packed;
    .end annotation
.end field

.field private certificateFingerprint:Ljava/lang/String;
    .annotation runtime Lcom/hihonor/push/framework/aidl/annotation/Packed;
    .end annotation
.end field

.field private packageName:Ljava/lang/String;
    .annotation runtime Lcom/hihonor/push/framework/aidl/annotation/Packed;
    .end annotation
.end field

.field private pushToken:Ljava/lang/String;
    .annotation runtime Lcom/hihonor/push/framework/aidl/annotation/Packed;
    .end annotation
.end field

.field private sdkVersion:I
    .annotation runtime Lcom/hihonor/push/framework/aidl/annotation/Packed;
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getAAID()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/hihonor/push/framework/aidl/entity/RequestHeader;->AAID:Ljava/lang/String;

    return-object p0
.end method

.method public getAppId()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/hihonor/push/framework/aidl/entity/RequestHeader;->appId:Ljava/lang/String;

    return-object p0
.end method

.method public getCertificateFingerprint()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/hihonor/push/framework/aidl/entity/RequestHeader;->certificateFingerprint:Ljava/lang/String;

    return-object p0
.end method

.method public getPackageName()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/hihonor/push/framework/aidl/entity/RequestHeader;->packageName:Ljava/lang/String;

    return-object p0
.end method

.method public getPushToken()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/hihonor/push/framework/aidl/entity/RequestHeader;->pushToken:Ljava/lang/String;

    return-object p0
.end method

.method public getSdkVersion()I
    .locals 0

    iget p0, p0, Lcom/hihonor/push/framework/aidl/entity/RequestHeader;->sdkVersion:I

    return p0
.end method

.method public setAAID(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/hihonor/push/framework/aidl/entity/RequestHeader;->AAID:Ljava/lang/String;

    return-void
.end method

.method public setAppId(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/hihonor/push/framework/aidl/entity/RequestHeader;->appId:Ljava/lang/String;

    return-void
.end method

.method public setCertificateFingerprint(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/hihonor/push/framework/aidl/entity/RequestHeader;->certificateFingerprint:Ljava/lang/String;

    return-void
.end method

.method public setPackageName(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/hihonor/push/framework/aidl/entity/RequestHeader;->packageName:Ljava/lang/String;

    return-void
.end method

.method public setPushToken(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/hihonor/push/framework/aidl/entity/RequestHeader;->pushToken:Ljava/lang/String;

    return-void
.end method

.method public setSdkVersion(I)V
    .locals 0

    iput p1, p0, Lcom/hihonor/push/framework/aidl/entity/RequestHeader;->sdkVersion:I

    return-void
.end method

.class public Lcom/samsung/android/security/keystore/AttestParameterSpec$Builder;
.super Ljava/lang/Object;


.method public constructor <init>()V
    .locals 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;[B)V
    .locals 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method public build()Lcom/samsung/android/security/keystore/AttestParameterSpec;
    .locals 2
    new-instance v0, Lcom/samsung/android/security/keystore/AttestParameterSpec;
    invoke-direct {v0}, Lcom/samsung/android/security/keystore/AttestParameterSpec;-><init>()V
    return-object v0
.end method

.method public setAlgorithm(Ljava/lang/String;)Lcom/samsung/android/security/keystore/AttestParameterSpec$Builder;
    .locals 2
    return-object p0
.end method

.method public setDeviceAttestation(Z)Lcom/samsung/android/security/keystore/AttestParameterSpec$Builder;
    .locals 2
    return-object p0
.end method

.method public setKeyGenParameterSpec(Landroid/security/keystore/KeyGenParameterSpec;)Lcom/samsung/android/security/keystore/AttestParameterSpec$Builder;
    .locals 2
    return-object p0
.end method

.method public setVerifiableIntegrity(Z)Lcom/samsung/android/security/keystore/AttestParameterSpec$Builder;
    .locals 2
    return-object p0
.end method


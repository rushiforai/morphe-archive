.class public Lcom/samsung/android/bio/fingerprint/SemFingerprintManager;
.super Ljava/lang/Object;


.method public constructor <init>()V
    .locals 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method public authenticate(Lcom/samsung/android/bio/fingerprint/SemFingerprintManager$CryptoObject;Landroid/os/CancellationSignal;Lcom/samsung/android/bio/fingerprint/SemFingerprintManager$AuthenticationCallback;Landroid/os/Handler;ILandroid/os/Bundle;)V
    .locals 2
    return-void
.end method

.method public static createInstance(Landroid/content/Context;)Lcom/samsung/android/bio/fingerprint/SemFingerprintManager;
    .locals 2
    new-instance v0, Lcom/samsung/android/bio/fingerprint/SemFingerprintManager;
    invoke-direct {v0}, Lcom/samsung/android/bio/fingerprint/SemFingerprintManager;-><init>()V
    return-object v0
.end method

.method public hasEnrolledFingerprints()Z
    .locals 2
    const/4 v0, 0x0
    return v0
.end method


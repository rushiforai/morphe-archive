.class public Lcom/samsung/android/os/SemDvfsManager;
.super Ljava/lang/Object;


.method public constructor <init>()V
    .locals 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method public acquire()V
    .locals 2
    return-void
.end method

.method public acquire(I)V
    .locals 2
    return-void
.end method

.method public checkHintSupported(I)Z
    .locals 2
    const/4 v0, 0x0
    return v0
.end method

.method public static createInstance(Landroid/content/Context;I)Lcom/samsung/android/os/SemDvfsManager;
    .locals 2
    new-instance v0, Lcom/samsung/android/os/SemDvfsManager;
    invoke-direct {v0}, Lcom/samsung/android/os/SemDvfsManager;-><init>()V
    return-object v0
.end method

.method public static createInstance(Landroid/content/Context;Ljava/lang/String;)Lcom/samsung/android/os/SemDvfsManager;
    .locals 2
    new-instance v0, Lcom/samsung/android/os/SemDvfsManager;
    invoke-direct {v0}, Lcom/samsung/android/os/SemDvfsManager;-><init>()V
    return-object v0
.end method

.method public getSupportedFrequencyForSsrm()[I
    .locals 2
    const/4 v0, 0x0
    return-object v0
.end method

.method public release()V
    .locals 2
    return-void
.end method

.method public setDvfsValue(I)V
    .locals 2
    return-void
.end method

.method public setHint(I)V
    .locals 2
    return-void
.end method


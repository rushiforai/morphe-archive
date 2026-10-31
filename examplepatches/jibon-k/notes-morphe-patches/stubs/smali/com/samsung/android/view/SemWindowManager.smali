.class public Lcom/samsung/android/view/SemWindowManager;
.super Ljava/lang/Object;


.method public constructor <init>()V
    .locals 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method public static getInstance()Lcom/samsung/android/view/SemWindowManager;
    .locals 2
    new-instance v0, Lcom/samsung/android/view/SemWindowManager;
    invoke-direct {v0}, Lcom/samsung/android/view/SemWindowManager;-><init>()V
    return-object v0
.end method

.method public isFolded()Z
    .locals 2
    const/4 v0, 0x0
    return v0
.end method

.method public registerFoldStateListener(Lcom/samsung/android/view/SemWindowManager$FoldStateListener;Landroid/os/Handler;)V
    .locals 2
    return-void
.end method

.method public registerSystemKeyEvent(ILandroid/content/ComponentName;I)V
    .locals 2
    return-void
.end method

.method public unregisterFoldStateListener(Lcom/samsung/android/view/SemWindowManager$FoldStateListener;)V
    .locals 2
    return-void
.end method

.method public unregisterSystemKeyEvent(ILandroid/content/ComponentName;)V
    .locals 2
    return-void
.end method


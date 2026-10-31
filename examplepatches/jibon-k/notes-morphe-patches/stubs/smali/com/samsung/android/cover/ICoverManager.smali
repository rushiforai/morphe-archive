.class public abstract interface Lcom/samsung/android/cover/ICoverManager;
.super Ljava/lang/Object;


.method public abstract addLedNotification(Landroid/os/Bundle;)V
.end method

.method public abstract disableCoverManager(ZLandroid/os/IBinder;Ljava/lang/String;)V
.end method

.method public abstract disableLcdOffByCover(Landroid/os/IBinder;Landroid/content/ComponentName;)Z
.end method

.method public abstract enableLcdOffByCover(Landroid/os/IBinder;Landroid/content/ComponentName;)Z
.end method

.method public abstract getCoverState()Lcom/samsung/android/cover/CoverState;
.end method

.method public abstract isCoverManagerDisabled()Z
.end method

.method public abstract registerCallback(Landroid/os/IBinder;Landroid/content/ComponentName;)V
.end method

.method public abstract registerListenerCallback(Landroid/os/IBinder;Landroid/content/ComponentName;I)V
.end method

.method public abstract registerNfcTouchListenerCallback(ILandroid/os/IBinder;Landroid/content/ComponentName;)V
.end method

.method public abstract removeLedNotification(Landroid/os/Bundle;)V
.end method

.method public abstract sendDataToCover(I[B)V
.end method

.method public abstract sendDataToNfcLedCover(I[B)V
.end method

.method public abstract sendSystemEvent(Landroid/os/Bundle;)V
.end method

.method public abstract unregisterCallback(Landroid/os/IBinder;)Z
.end method

.method public abstract unregisterNfcTouchListenerCallback(Landroid/os/IBinder;)Z
.end method


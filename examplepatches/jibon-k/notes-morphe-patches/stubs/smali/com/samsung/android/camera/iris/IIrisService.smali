.class public abstract interface Lcom/samsung/android/camera/iris/IIrisService;
.super Ljava/lang/Object;


.method public abstract authenticate(Landroid/os/IBinder;Landroid/os/IBinder;IIIIJILcom/samsung/android/camera/iris/IIrisServiceReceiver;ILjava/lang/String;Landroid/os/Bundle;[B)V
.end method

.method public abstract cancelAuthentication(Landroid/os/IBinder;Ljava/lang/String;)V
.end method

.method public abstract enableIRImageCallback(ILjava/lang/String;I)V
.end method

.method public abstract getEnrolledIrises(ILjava/lang/String;)Ljava/util/List;
.end method

.method public abstract hasDisabledIrises(ILjava/lang/String;)Z
.end method

.method public abstract hasEnrolledIrises(ILjava/lang/String;)Z
.end method

.method public abstract isHardwareDetected(JLjava/lang/String;)Z
.end method

.method public abstract request(Landroid/os/IBinder;I[B[BIILcom/samsung/android/camera/iris/IIrisServiceReceiver;)I
.end method

.method public abstract setIrisViewType(ILjava/lang/String;I)V
.end method


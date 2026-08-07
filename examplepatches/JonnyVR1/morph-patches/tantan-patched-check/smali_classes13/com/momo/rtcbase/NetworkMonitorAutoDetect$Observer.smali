.class public interface abstract Lcom/momo/rtcbase/NetworkMonitorAutoDetect$Observer;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/momo/rtcbase/NetworkMonitorAutoDetect;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "Observer"
.end annotation


# virtual methods
.method public abstract onConnectionTypeChanged(Lcom/momo/rtcbase/NetworkMonitorAutoDetect$ConnectionType;)V
.end method

.method public abstract onNetworkConnect(Lcom/momo/rtcbase/NetworkMonitorAutoDetect$NetworkInformation;)V
.end method

.method public abstract onNetworkDisconnect(J)V
.end method

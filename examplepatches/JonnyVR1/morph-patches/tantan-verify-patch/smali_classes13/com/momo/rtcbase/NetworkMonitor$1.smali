.class Lcom/momo/rtcbase/NetworkMonitor$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/momo/rtcbase/NetworkMonitorAutoDetect$Observer;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/momo/rtcbase/NetworkMonitor;->createAutoDetect(Landroid/content/Context;)Lcom/momo/rtcbase/NetworkMonitorAutoDetect;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/momo/rtcbase/NetworkMonitor;


# direct methods
.method public constructor <init>(Lcom/momo/rtcbase/NetworkMonitor;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/rtcbase/NetworkMonitor$1;->this$0:Lcom/momo/rtcbase/NetworkMonitor;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onConnectionTypeChanged(Lcom/momo/rtcbase/NetworkMonitorAutoDetect$ConnectionType;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/rtcbase/NetworkMonitor$1;->this$0:Lcom/momo/rtcbase/NetworkMonitor;

    .line 2
    .line 3
    invoke-static {p0, p1}, Lcom/momo/rtcbase/NetworkMonitor;->access$100(Lcom/momo/rtcbase/NetworkMonitor;Lcom/momo/rtcbase/NetworkMonitorAutoDetect$ConnectionType;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public onNetworkConnect(Lcom/momo/rtcbase/NetworkMonitorAutoDetect$NetworkInformation;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/rtcbase/NetworkMonitor$1;->this$0:Lcom/momo/rtcbase/NetworkMonitor;

    .line 2
    .line 3
    invoke-static {p0, p1}, Lcom/momo/rtcbase/NetworkMonitor;->access$200(Lcom/momo/rtcbase/NetworkMonitor;Lcom/momo/rtcbase/NetworkMonitorAutoDetect$NetworkInformation;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public onNetworkDisconnect(J)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/rtcbase/NetworkMonitor$1;->this$0:Lcom/momo/rtcbase/NetworkMonitor;

    .line 2
    .line 3
    invoke-static {p0, p1, p2}, Lcom/momo/rtcbase/NetworkMonitor;->access$300(Lcom/momo/rtcbase/NetworkMonitor;J)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.class public Lcom/momo/rtcbase/NetworkMonitorAutoDetect$IPAddress;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/momo/rtcbase/NetworkMonitorAutoDetect;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "IPAddress"
.end annotation


# instance fields
.field public final address:[B


# direct methods
.method public constructor <init>([B)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/momo/rtcbase/NetworkMonitorAutoDetect$IPAddress;->address:[B

    .line 5
    .line 6
    return-void
.end method

.method private getAddress()[B
    .locals 0
    .annotation build Lcom/momo/rtcbase/CalledByNative;
        value = "IPAddress"
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/momo/rtcbase/NetworkMonitorAutoDetect$IPAddress;->address:[B

    .line 2
    .line 3
    return-object p0
.end method

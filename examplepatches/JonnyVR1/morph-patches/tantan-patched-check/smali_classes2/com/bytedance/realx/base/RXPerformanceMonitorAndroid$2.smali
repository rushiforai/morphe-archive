.class Lcom/bytedance/realx/base/RXPerformanceMonitorAndroid$2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/os/PowerManager$OnThermalStatusChangedListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/bytedance/realx/base/RXPerformanceMonitorAndroid;->getThermalState()I
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public onThermalStatusChanged(I)V
    .locals 0

    .line 1
    invoke-static {p1}, Lcom/bytedance/realx/base/RXPerformanceMonitorAndroid;->access$100(I)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    invoke-static {p0}, Lcom/bytedance/realx/base/RXPerformanceMonitorAndroid;->access$002(I)I

    .line 6
    .line 7
    .line 8
    return-void
.end method

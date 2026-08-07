.class Lio/agora/rtc2/internal/gdp/GDPAndroid$BatteryLevel;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/agora/rtc2/internal/gdp/GDPAndroid;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "BatteryLevel"
.end annotation


# static fields
.field static batt:I


# instance fields
.field final runDone:Ljava/util/concurrent/CountDownLatch;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>()V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/concurrent/CountDownLatch;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Ljava/util/concurrent/CountDownLatch;-><init>(I)V

    iput-object v0, p0, Lio/agora/rtc2/internal/gdp/GDPAndroid$BatteryLevel;->runDone:Ljava/util/concurrent/CountDownLatch;

    return-void
.end method


# virtual methods
.method public getBatteryLevelSafe()I
    .locals 2

    new-instance v0, Ljava/lang/Thread;

    invoke-direct {v0, p0}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    iget-object p0, p0, Lio/agora/rtc2/internal/gdp/GDPAndroid$BatteryLevel;->runDone:Ljava/util/concurrent/CountDownLatch;

    const-wide/16 v0, 0x64

    invoke-static {p0, v0, v1}, Lio/agora/base/internal/ThreadUtils;->awaitUninterruptibly(Ljava/util/concurrent/CountDownLatch;J)Z

    move-result p0

    if-nez p0, :cond_0

    const-string p0, "GDPAndroid"

    const-string v0, "getBatteryLevelSafe timeout"

    invoke-static {p0, v0}, Lio/agora/utils2/internal/Logging;->e(Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    sget p0, Lio/agora/rtc2/internal/gdp/GDPAndroid$BatteryLevel;->batt:I

    return p0
.end method

.method public run()V
    .locals 1

    invoke-static {}, Lio/agora/rtc2/internal/gdp/GDPAndroid;->access$900()I

    move-result v0

    sput v0, Lio/agora/rtc2/internal/gdp/GDPAndroid$BatteryLevel;->batt:I

    iget-object p0, p0, Lio/agora/rtc2/internal/gdp/GDPAndroid$BatteryLevel;->runDone:Ljava/util/concurrent/CountDownLatch;

    invoke-virtual {p0}, Ljava/util/concurrent/CountDownLatch;->countDown()V

    return-void
.end method

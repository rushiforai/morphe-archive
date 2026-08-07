.class Lio/agora/rtc2/internal/gdp/GDPAndroid$CPUTemperature;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/agora/rtc2/internal/gdp/GDPAndroid;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "CPUTemperature"
.end annotation


# static fields
.field static currentTemp:D


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

    iput-object v0, p0, Lio/agora/rtc2/internal/gdp/GDPAndroid$CPUTemperature;->runDone:Ljava/util/concurrent/CountDownLatch;

    return-void
.end method


# virtual methods
.method public getCpuTemperatureSafe()I
    .locals 4

    new-instance v0, Ljava/lang/Thread;

    invoke-direct {v0, p0}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    iget-object p0, p0, Lio/agora/rtc2/internal/gdp/GDPAndroid$CPUTemperature;->runDone:Ljava/util/concurrent/CountDownLatch;

    const-wide/16 v0, 0x64

    invoke-static {p0, v0, v1}, Lio/agora/base/internal/ThreadUtils;->awaitUninterruptibly(Ljava/util/concurrent/CountDownLatch;J)Z

    move-result p0

    if-nez p0, :cond_0

    const-string p0, "GDPAndroid"

    const-string v0, "getCpuTemperatureSafe timeout"

    invoke-static {p0, v0}, Lio/agora/utils2/internal/Logging;->e(Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    sget-wide v0, Lio/agora/rtc2/internal/gdp/GDPAndroid$CPUTemperature;->currentTemp:D

    const-wide v2, 0x408f400000000000L    # 1000.0

    mul-double/2addr v0, v2

    double-to-int p0, v0

    return p0
.end method

.method public run()V
    .locals 9

    const/4 v0, 0x0

    :goto_0
    invoke-static {}, Lio/agora/rtc2/internal/gdp/GDPAndroid;->access$200()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-ge v0, v1, :cond_3

    invoke-static {}, Lio/agora/rtc2/internal/gdp/GDPAndroid;->access$200()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    new-instance v2, Ljava/io/File;

    invoke-direct {v2, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-static {v2}, Lio/agora/rtc2/internal/gdp/GDPAndroid;->access$300(Ljava/io/File;)D

    move-result-wide v2

    invoke-static {v2, v3}, Lio/agora/rtc2/internal/gdp/GDPAndroid;->access$400(D)Z

    move-result v4

    const-string v5, "getCpuTemperature valid path:"

    const-string v6, "GDPAndroid"

    if-nez v4, :cond_2

    invoke-static {}, Lio/agora/rtc2/internal/gdp/GDPAndroid;->access$500()Z

    move-result v4

    if-eqz v4, :cond_0

    goto :goto_2

    :cond_0
    const-wide v7, 0x408f400000000000L    # 1000.0

    div-double/2addr v2, v7

    invoke-static {v2, v3}, Lio/agora/rtc2/internal/gdp/GDPAndroid;->access$400(D)Z

    move-result v4

    if-eqz v4, :cond_1

    sput-wide v2, Lio/agora/rtc2/internal/gdp/GDPAndroid$CPUTemperature;->currentTemp:D

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    :goto_1
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v6, v0}, Lio/agora/utils2/internal/Logging;->d(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_3

    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_2
    :goto_2
    sput-wide v2, Lio/agora/rtc2/internal/gdp/GDPAndroid$CPUTemperature;->currentTemp:D

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    goto :goto_1

    :cond_3
    :goto_3
    iget-object p0, p0, Lio/agora/rtc2/internal/gdp/GDPAndroid$CPUTemperature;->runDone:Ljava/util/concurrent/CountDownLatch;

    invoke-virtual {p0}, Ljava/util/concurrent/CountDownLatch;->countDown()V

    return-void
.end method

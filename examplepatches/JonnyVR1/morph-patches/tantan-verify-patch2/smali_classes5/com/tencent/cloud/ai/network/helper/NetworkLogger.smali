.class public Lcom/tencent/cloud/ai/network/helper/NetworkLogger;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/tencent/cloud/ai/network/helper/NetworkLogger$LOG_LEVEL;
    }
.end annotation


# static fields
.field public static final LOG_DEBUG:Ljava/lang/String; = "[ai-network-debug]"

.field public static final LOG_ERROR:Ljava/lang/String; = "[ai-network]"

.field public static logLevel:Lcom/tencent/cloud/ai/network/helper/NetworkLogger$LOG_LEVEL;


# direct methods
.method public static constructor <clinit>()V
    .locals 1

    .line 1
    sget-object v0, Lcom/tencent/cloud/ai/network/helper/NetworkLogger$LOG_LEVEL;->LEVEL_INFO:Lcom/tencent/cloud/ai/network/helper/NetworkLogger$LOG_LEVEL;

    .line 2
    .line 3
    sput-object v0, Lcom/tencent/cloud/ai/network/helper/NetworkLogger;->logLevel:Lcom/tencent/cloud/ai/network/helper/NetworkLogger$LOG_LEVEL;

    .line 4
    .line 5
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static debug(Ljava/lang/String;Ljava/lang/String;Lcom/tencent/cloud/ai/network/helper/NetworkLoggerCallBack;)V
    .locals 2

    .line 1
    sget-object v0, Lcom/tencent/cloud/ai/network/helper/NetworkLogger$LOG_LEVEL;->LEVEL_DEBUG:Lcom/tencent/cloud/ai/network/helper/NetworkLogger$LOG_LEVEL;

    .line 2
    .line 3
    sget-object v1, Lcom/tencent/cloud/ai/network/helper/NetworkLogger;->logLevel:Lcom/tencent/cloud/ai/network/helper/NetworkLogger$LOG_LEVEL;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Ljava/lang/Enum;->compareTo(Ljava/lang/Enum;)I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-ltz v0, :cond_0

    .line 10
    .line 11
    const/4 v0, 0x1

    .line 12
    invoke-static {v0, p0, p1, p2}, Lcom/tencent/cloud/ai/network/helper/NetworkLogger;->doLogInfo(ZLjava/lang/String;Ljava/lang/String;Lcom/tencent/cloud/ai/network/helper/NetworkLoggerCallBack;)V

    .line 13
    .line 14
    .line 15
    :cond_0
    return-void
.end method

.method public static doLogInfo(ZLjava/lang/String;Ljava/lang/String;Lcom/tencent/cloud/ai/network/helper/NetworkLoggerCallBack;)V
    .locals 1

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    const-string p0, "[ai-network-debug]"

    .line 9
    .line 10
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    const-string p0, "[ai-network]"

    .line 15
    .line 16
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    :goto_0
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    if-eqz p3, :cond_1

    .line 23
    .line 24
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    invoke-interface {p3, p1, p0}, Lcom/tencent/cloud/ai/network/helper/NetworkLoggerCallBack;->logger(Ljava/lang/String;Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    :cond_1
    return-void
.end method

.method public static error(Ljava/lang/String;Ljava/lang/String;Lcom/tencent/cloud/ai/network/helper/NetworkLoggerCallBack;)V
    .locals 2

    .line 1
    sget-object v0, Lcom/tencent/cloud/ai/network/helper/NetworkLogger$LOG_LEVEL;->LEVEL_ERROR:Lcom/tencent/cloud/ai/network/helper/NetworkLogger$LOG_LEVEL;

    .line 2
    .line 3
    sget-object v1, Lcom/tencent/cloud/ai/network/helper/NetworkLogger;->logLevel:Lcom/tencent/cloud/ai/network/helper/NetworkLogger$LOG_LEVEL;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Ljava/lang/Enum;->compareTo(Ljava/lang/Enum;)I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-ltz v0, :cond_0

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    invoke-static {v0, p0, p1, p2}, Lcom/tencent/cloud/ai/network/helper/NetworkLogger;->doLogInfo(ZLjava/lang/String;Ljava/lang/String;Lcom/tencent/cloud/ai/network/helper/NetworkLoggerCallBack;)V

    .line 13
    .line 14
    .line 15
    :cond_0
    return-void
.end method

.method public static info(Ljava/lang/String;Ljava/lang/String;Lcom/tencent/cloud/ai/network/helper/NetworkLoggerCallBack;)V
    .locals 2

    .line 1
    sget-object v0, Lcom/tencent/cloud/ai/network/helper/NetworkLogger$LOG_LEVEL;->LEVEL_INFO:Lcom/tencent/cloud/ai/network/helper/NetworkLogger$LOG_LEVEL;

    .line 2
    .line 3
    sget-object v1, Lcom/tencent/cloud/ai/network/helper/NetworkLogger;->logLevel:Lcom/tencent/cloud/ai/network/helper/NetworkLogger$LOG_LEVEL;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Ljava/lang/Enum;->compareTo(Ljava/lang/Enum;)I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-ltz v0, :cond_0

    .line 10
    .line 11
    const/4 v0, 0x1

    .line 12
    invoke-static {v0, p0, p1, p2}, Lcom/tencent/cloud/ai/network/helper/NetworkLogger;->doLogInfo(ZLjava/lang/String;Ljava/lang/String;Lcom/tencent/cloud/ai/network/helper/NetworkLoggerCallBack;)V

    .line 13
    .line 14
    .line 15
    :cond_0
    return-void
.end method

.method public static setLogLevel(Lcom/tencent/cloud/ai/network/helper/NetworkLogger$LOG_LEVEL;)V
    .locals 0

    .line 1
    sput-object p0, Lcom/tencent/cloud/ai/network/helper/NetworkLogger;->logLevel:Lcom/tencent/cloud/ai/network/helper/NetworkLogger$LOG_LEVEL;

    .line 2
    .line 3
    return-void
.end method

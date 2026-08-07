.class public Lcom/tencent/could/aicamare/util/CameraLogger;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/tencent/could/aicamare/util/CameraLogger$LOG_LEVEL;
    }
.end annotation


# static fields
.field public static a:Lcom/tencent/could/aicamare/util/CameraLogger$LOG_LEVEL;


# direct methods
.method public static constructor <clinit>()V
    .locals 1

    .line 1
    sget-object v0, Lcom/tencent/could/aicamare/util/CameraLogger$LOG_LEVEL;->LEVEL_VERBOSE:Lcom/tencent/could/aicamare/util/CameraLogger$LOG_LEVEL;

    .line 2
    .line 3
    sput-object v0, Lcom/tencent/could/aicamare/util/CameraLogger;->a:Lcom/tencent/could/aicamare/util/CameraLogger$LOG_LEVEL;

    .line 4
    .line 5
    return-void
.end method

.method public static a(Ljava/lang/String;Ljava/lang/String;Lcom/tencent/could/aicamare/callback/CameraLoggerCallBack;)V
    .locals 2

    .line 32
    sget-object v0, Lcom/tencent/could/aicamare/util/CameraLogger$LOG_LEVEL;->LEVEL_DEBUG:Lcom/tencent/could/aicamare/util/CameraLogger$LOG_LEVEL;

    sget-object v1, Lcom/tencent/could/aicamare/util/CameraLogger;->a:Lcom/tencent/could/aicamare/util/CameraLogger$LOG_LEVEL;

    invoke-virtual {v0, v1}, Ljava/lang/Enum;->compareTo(Ljava/lang/Enum;)I

    move-result v0

    if-ltz v0, :cond_0

    const/4 v0, 0x1

    .line 33
    invoke-static {v0, p0, p1, p2}, Lcom/tencent/could/aicamare/util/CameraLogger;->a(ZLjava/lang/String;Ljava/lang/String;Lcom/tencent/could/aicamare/callback/CameraLoggerCallBack;)V

    :cond_0
    return-void
.end method

.method public static a(ZLjava/lang/String;Ljava/lang/String;Lcom/tencent/could/aicamare/callback/CameraLoggerCallBack;)V
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
    const-string p0, "[ai-camera-debug]"

    .line 9
    .line 10
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    const-string p0, "[ai-camera-error]"

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
    invoke-interface {p3, p1, p0}, Lcom/tencent/could/aicamare/callback/CameraLoggerCallBack;->logger(Ljava/lang/String;Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    :cond_1
    return-void
.end method

.method public static b(Ljava/lang/String;Ljava/lang/String;Lcom/tencent/could/aicamare/callback/CameraLoggerCallBack;)V
    .locals 2

    .line 1
    sget-object v0, Lcom/tencent/could/aicamare/util/CameraLogger$LOG_LEVEL;->LEVEL_ERROR:Lcom/tencent/could/aicamare/util/CameraLogger$LOG_LEVEL;

    .line 2
    .line 3
    sget-object v1, Lcom/tencent/could/aicamare/util/CameraLogger;->a:Lcom/tencent/could/aicamare/util/CameraLogger$LOG_LEVEL;

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
    invoke-static {v0, p0, p1, p2}, Lcom/tencent/could/aicamare/util/CameraLogger;->a(ZLjava/lang/String;Ljava/lang/String;Lcom/tencent/could/aicamare/callback/CameraLoggerCallBack;)V

    .line 13
    .line 14
    .line 15
    :cond_0
    return-void
.end method

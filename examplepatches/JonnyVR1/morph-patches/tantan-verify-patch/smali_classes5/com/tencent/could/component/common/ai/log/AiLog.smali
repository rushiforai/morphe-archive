.class public Lcom/tencent/could/component/common/ai/log/AiLog;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final ASSERT:I = 0x7

.field public static final DEBUG:I = 0x3

.field public static final ERROR:I = 0x6

.field public static final INFO:I = 0x4

.field public static final TAG:Ljava/lang/String; = "AiLog"

.field public static final VERBOSE:I = 0x2

.field public static final WARN:I = 0x5

.field public static isInit:Z

.field public static logger:Lcom/tencent/could/component/common/ai/log/AiLogger;


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

.method public static assertInitLogger()Z
    .locals 2

    .line 1
    sget-boolean v0, Lcom/tencent/could/component/common/ai/log/AiLog;->isInit:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const-string v0, "AiLog"

    .line 6
    .line 7
    const-string v1, "aiLogger is not init!"

    .line 8
    .line 9
    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 10
    .line 11
    .line 12
    const/4 v0, 0x0

    .line 13
    return v0

    .line 14
    :cond_0
    const/4 v0, 0x1

    .line 15
    return v0
.end method

.method public static asset(Ljava/lang/String;)V
    .locals 1

    .line 17
    sget-object v0, Lcom/tencent/could/component/common/ai/log/AiLog;->logger:Lcom/tencent/could/component/common/ai/log/AiLogger;

    if-eqz v0, :cond_0

    invoke-static {}, Lcom/tencent/could/component/common/ai/log/AiLog;->assertInitLogger()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 18
    sget-object v0, Lcom/tencent/could/component/common/ai/log/AiLog;->logger:Lcom/tencent/could/component/common/ai/log/AiLogger;

    invoke-virtual {v0, p0}, Lcom/tencent/could/component/common/ai/log/AiLogger;->asset(Ljava/lang/String;)V

    :cond_0
    return-void
.end method

.method public static asset(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/tencent/could/component/common/ai/log/AiLog;->logger:Lcom/tencent/could/component/common/ai/log/AiLogger;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lcom/tencent/could/component/common/ai/log/AiLog;->assertInitLogger()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    sget-object v0, Lcom/tencent/could/component/common/ai/log/AiLog;->logger:Lcom/tencent/could/component/common/ai/log/AiLogger;

    .line 12
    .line 13
    invoke-virtual {v0, p0, p1}, Lcom/tencent/could/component/common/ai/log/AiLogger;->asset(Ljava/lang/String;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method public static varargs asset(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V
    .locals 1

    .line 19
    sget-object v0, Lcom/tencent/could/component/common/ai/log/AiLog;->logger:Lcom/tencent/could/component/common/ai/log/AiLogger;

    if-eqz v0, :cond_0

    invoke-static {}, Lcom/tencent/could/component/common/ai/log/AiLog;->assertInitLogger()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 20
    sget-object v0, Lcom/tencent/could/component/common/ai/log/AiLog;->logger:Lcom/tencent/could/component/common/ai/log/AiLogger;

    invoke-virtual {v0, p0, p1, p2}, Lcom/tencent/could/component/common/ai/log/AiLogger;->asset(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    :cond_0
    return-void
.end method

.method public static debug(Ljava/lang/String;)V
    .locals 1

    .line 17
    sget-object v0, Lcom/tencent/could/component/common/ai/log/AiLog;->logger:Lcom/tencent/could/component/common/ai/log/AiLogger;

    if-eqz v0, :cond_0

    invoke-static {}, Lcom/tencent/could/component/common/ai/log/AiLog;->assertInitLogger()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 18
    sget-object v0, Lcom/tencent/could/component/common/ai/log/AiLog;->logger:Lcom/tencent/could/component/common/ai/log/AiLogger;

    invoke-virtual {v0, p0}, Lcom/tencent/could/component/common/ai/log/AiLogger;->debug(Ljava/lang/String;)V

    :cond_0
    return-void
.end method

.method public static debug(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/tencent/could/component/common/ai/log/AiLog;->logger:Lcom/tencent/could/component/common/ai/log/AiLogger;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lcom/tencent/could/component/common/ai/log/AiLog;->assertInitLogger()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    sget-object v0, Lcom/tencent/could/component/common/ai/log/AiLog;->logger:Lcom/tencent/could/component/common/ai/log/AiLogger;

    .line 12
    .line 13
    invoke-virtual {v0, p0, p1}, Lcom/tencent/could/component/common/ai/log/AiLogger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method public static varargs debug(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V
    .locals 1

    .line 19
    sget-object v0, Lcom/tencent/could/component/common/ai/log/AiLog;->logger:Lcom/tencent/could/component/common/ai/log/AiLogger;

    if-eqz v0, :cond_0

    invoke-static {}, Lcom/tencent/could/component/common/ai/log/AiLog;->assertInitLogger()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 20
    sget-object v0, Lcom/tencent/could/component/common/ai/log/AiLog;->logger:Lcom/tencent/could/component/common/ai/log/AiLogger;

    invoke-virtual {v0, p0, p1, p2}, Lcom/tencent/could/component/common/ai/log/AiLogger;->debug(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    :cond_0
    return-void
.end method

.method public static error(Ljava/lang/String;)V
    .locals 1

    .line 17
    sget-object v0, Lcom/tencent/could/component/common/ai/log/AiLog;->logger:Lcom/tencent/could/component/common/ai/log/AiLogger;

    if-eqz v0, :cond_0

    invoke-static {}, Lcom/tencent/could/component/common/ai/log/AiLog;->assertInitLogger()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 18
    sget-object v0, Lcom/tencent/could/component/common/ai/log/AiLog;->logger:Lcom/tencent/could/component/common/ai/log/AiLogger;

    invoke-virtual {v0, p0}, Lcom/tencent/could/component/common/ai/log/AiLogger;->error(Ljava/lang/String;)V

    :cond_0
    return-void
.end method

.method public static error(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/tencent/could/component/common/ai/log/AiLog;->logger:Lcom/tencent/could/component/common/ai/log/AiLogger;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lcom/tencent/could/component/common/ai/log/AiLog;->assertInitLogger()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    sget-object v0, Lcom/tencent/could/component/common/ai/log/AiLog;->logger:Lcom/tencent/could/component/common/ai/log/AiLogger;

    .line 12
    .line 13
    invoke-virtual {v0, p0, p1}, Lcom/tencent/could/component/common/ai/log/AiLogger;->error(Ljava/lang/String;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method public static varargs error(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V
    .locals 1

    .line 19
    sget-object v0, Lcom/tencent/could/component/common/ai/log/AiLog;->logger:Lcom/tencent/could/component/common/ai/log/AiLogger;

    if-eqz v0, :cond_0

    invoke-static {}, Lcom/tencent/could/component/common/ai/log/AiLog;->assertInitLogger()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 20
    sget-object v0, Lcom/tencent/could/component/common/ai/log/AiLog;->logger:Lcom/tencent/could/component/common/ai/log/AiLogger;

    invoke-virtual {v0, p0, p1, p2}, Lcom/tencent/could/component/common/ai/log/AiLogger;->error(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    :cond_0
    return-void
.end method

.method public static info(Ljava/lang/String;)V
    .locals 1

    .line 17
    sget-object v0, Lcom/tencent/could/component/common/ai/log/AiLog;->logger:Lcom/tencent/could/component/common/ai/log/AiLogger;

    if-eqz v0, :cond_0

    invoke-static {}, Lcom/tencent/could/component/common/ai/log/AiLog;->assertInitLogger()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 18
    sget-object v0, Lcom/tencent/could/component/common/ai/log/AiLog;->logger:Lcom/tencent/could/component/common/ai/log/AiLogger;

    invoke-virtual {v0, p0}, Lcom/tencent/could/component/common/ai/log/AiLogger;->info(Ljava/lang/String;)V

    :cond_0
    return-void
.end method

.method public static info(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/tencent/could/component/common/ai/log/AiLog;->logger:Lcom/tencent/could/component/common/ai/log/AiLogger;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lcom/tencent/could/component/common/ai/log/AiLog;->assertInitLogger()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    sget-object v0, Lcom/tencent/could/component/common/ai/log/AiLog;->logger:Lcom/tencent/could/component/common/ai/log/AiLogger;

    .line 12
    .line 13
    invoke-virtual {v0, p0, p1}, Lcom/tencent/could/component/common/ai/log/AiLogger;->info(Ljava/lang/String;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method public static varargs info(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V
    .locals 1

    .line 19
    sget-object v0, Lcom/tencent/could/component/common/ai/log/AiLog;->logger:Lcom/tencent/could/component/common/ai/log/AiLogger;

    if-eqz v0, :cond_0

    invoke-static {}, Lcom/tencent/could/component/common/ai/log/AiLog;->assertInitLogger()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 20
    sget-object v0, Lcom/tencent/could/component/common/ai/log/AiLog;->logger:Lcom/tencent/could/component/common/ai/log/AiLogger;

    invoke-virtual {v0, p0, p1, p2}, Lcom/tencent/could/component/common/ai/log/AiLogger;->info(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    :cond_0
    return-void
.end method

.method public static init(Lcom/tencent/could/component/common/ai/log/AiLogger;)V
    .locals 1

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    sput-object p0, Lcom/tencent/could/component/common/ai/log/AiLog;->logger:Lcom/tencent/could/component/common/ai/log/AiLogger;

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    sput-boolean p0, Lcom/tencent/could/component/common/ai/log/AiLog;->isInit:Z

    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    const-string p0, "AiLog"

    .line 10
    .line 11
    const-string v0, "init AiLogger is null!"

    .line 12
    .line 13
    invoke-static {p0, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 14
    .line 15
    .line 16
    invoke-static {v0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public static release()V
    .locals 1

    .line 1
    sget-object v0, Lcom/tencent/could/component/common/ai/log/AiLog;->logger:Lcom/tencent/could/component/common/ai/log/AiLogger;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/tencent/could/component/common/ai/log/AiLogger;->release()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public static verbose(Ljava/lang/String;)V
    .locals 1

    .line 17
    sget-object v0, Lcom/tencent/could/component/common/ai/log/AiLog;->logger:Lcom/tencent/could/component/common/ai/log/AiLogger;

    if-eqz v0, :cond_0

    invoke-static {}, Lcom/tencent/could/component/common/ai/log/AiLog;->assertInitLogger()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 18
    sget-object v0, Lcom/tencent/could/component/common/ai/log/AiLog;->logger:Lcom/tencent/could/component/common/ai/log/AiLogger;

    invoke-virtual {v0, p0}, Lcom/tencent/could/component/common/ai/log/AiLogger;->verbose(Ljava/lang/String;)V

    :cond_0
    return-void
.end method

.method public static verbose(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/tencent/could/component/common/ai/log/AiLog;->logger:Lcom/tencent/could/component/common/ai/log/AiLogger;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lcom/tencent/could/component/common/ai/log/AiLog;->assertInitLogger()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    sget-object v0, Lcom/tencent/could/component/common/ai/log/AiLog;->logger:Lcom/tencent/could/component/common/ai/log/AiLogger;

    .line 12
    .line 13
    invoke-virtual {v0, p0, p1}, Lcom/tencent/could/component/common/ai/log/AiLogger;->verbose(Ljava/lang/String;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method public static varargs verbose(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V
    .locals 1

    .line 19
    sget-object v0, Lcom/tencent/could/component/common/ai/log/AiLog;->logger:Lcom/tencent/could/component/common/ai/log/AiLogger;

    if-eqz v0, :cond_0

    invoke-static {}, Lcom/tencent/could/component/common/ai/log/AiLog;->assertInitLogger()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 20
    sget-object v0, Lcom/tencent/could/component/common/ai/log/AiLog;->logger:Lcom/tencent/could/component/common/ai/log/AiLogger;

    invoke-virtual {v0, p0, p1, p2}, Lcom/tencent/could/component/common/ai/log/AiLogger;->verbose(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    :cond_0
    return-void
.end method

.method public static warn(Ljava/lang/String;)V
    .locals 1

    .line 17
    sget-object v0, Lcom/tencent/could/component/common/ai/log/AiLog;->logger:Lcom/tencent/could/component/common/ai/log/AiLogger;

    if-eqz v0, :cond_0

    invoke-static {}, Lcom/tencent/could/component/common/ai/log/AiLog;->assertInitLogger()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 18
    sget-object v0, Lcom/tencent/could/component/common/ai/log/AiLog;->logger:Lcom/tencent/could/component/common/ai/log/AiLogger;

    invoke-virtual {v0, p0}, Lcom/tencent/could/component/common/ai/log/AiLogger;->warn(Ljava/lang/String;)V

    :cond_0
    return-void
.end method

.method public static warn(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/tencent/could/component/common/ai/log/AiLog;->logger:Lcom/tencent/could/component/common/ai/log/AiLogger;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lcom/tencent/could/component/common/ai/log/AiLog;->assertInitLogger()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    sget-object v0, Lcom/tencent/could/component/common/ai/log/AiLog;->logger:Lcom/tencent/could/component/common/ai/log/AiLogger;

    .line 12
    .line 13
    invoke-virtual {v0, p0, p1}, Lcom/tencent/could/component/common/ai/log/AiLogger;->warn(Ljava/lang/String;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method public static varargs warn(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V
    .locals 1

    .line 19
    sget-object v0, Lcom/tencent/could/component/common/ai/log/AiLog;->logger:Lcom/tencent/could/component/common/ai/log/AiLogger;

    if-eqz v0, :cond_0

    invoke-static {}, Lcom/tencent/could/component/common/ai/log/AiLog;->assertInitLogger()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 20
    sget-object v0, Lcom/tencent/could/component/common/ai/log/AiLog;->logger:Lcom/tencent/could/component/common/ai/log/AiLogger;

    invoke-virtual {v0, p0, p1, p2}, Lcom/tencent/could/component/common/ai/log/AiLogger;->warn(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    :cond_0
    return-void
.end method

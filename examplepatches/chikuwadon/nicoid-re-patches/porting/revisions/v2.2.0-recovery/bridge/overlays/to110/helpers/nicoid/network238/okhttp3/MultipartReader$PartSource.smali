.class final Lnicoid/network238/okhttp3/MultipartReader$PartSource;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lnicoid/network238/okio/Source;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lnicoid/network238/okhttp3/MultipartReader;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "PartSource"
.end annotation

.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000&\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0010\t\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\u0008\u0082\u0004\u0018\u00002\u00020\u0001B\u0007\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\u0008\u0010\u0006\u001a\u00020\u0007H\u0016J\u0018\u0010\u0008\u001a\u00020\t2\u0006\u0010\n\u001a\u00020\u000b2\u0006\u0010\u000c\u001a\u00020\tH\u0016J\u0008\u0010\u0004\u001a\u00020\u0005H\u0016R\u000e\u0010\u0004\u001a\u00020\u0005X\u0082\u0004\u00a2\u0006\u0002\n\u0000\u00a8\u0006\r"
    }
    d2 = {
        "Lnicoid/network238/okhttp3/MultipartReader$PartSource;",
        "Lnicoid/network238/okio/Source;",
        "<init>",
        "(Lnicoid/network238/okhttp3/MultipartReader;)V",
        "timeout",
        "Lnicoid/network238/okio/Timeout;",
        "close",
        "",
        "read",
        "",
        "sink",
        "Lnicoid/network238/okio/Buffer;",
        "byteCount",
        "okhttp"
    }
    k = 0x1
    mv = {
        0x2,
        0x1,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field final synthetic this$0:Lnicoid/network238/okhttp3/MultipartReader;

.field private final timeout:Lnicoid/network238/okio/Timeout;


# direct methods
.method public constructor <init>(Lnicoid/network238/okhttp3/MultipartReader;)V
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 154
    iput-object p1, p0, Lnicoid/network238/okhttp3/MultipartReader$PartSource;->this$0:Lnicoid/network238/okhttp3/MultipartReader;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 155
    new-instance p1, Lnicoid/network238/okio/Timeout;

    invoke-direct {p1}, Lnicoid/network238/okio/Timeout;-><init>()V

    iput-object p1, p0, Lnicoid/network238/okhttp3/MultipartReader$PartSource;->timeout:Lnicoid/network238/okio/Timeout;

    return-void
.end method


# virtual methods
.method public close()V
    .registers 3

    .line 158
    iget-object v0, p0, Lnicoid/network238/okhttp3/MultipartReader$PartSource;->this$0:Lnicoid/network238/okhttp3/MultipartReader;

    # getter for: Lnicoid/network238/okhttp3/MultipartReader;->currentPart:Lnicoid/network238/okhttp3/MultipartReader$PartSource;
    invoke-static {v0}, Lnicoid/network238/okhttp3/MultipartReader;->access$getCurrentPart$p(Lnicoid/network238/okhttp3/MultipartReader;)Lnicoid/network238/okhttp3/MultipartReader$PartSource;

    move-result-object v0

    invoke-static {v0, p0}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 159
    iget-object v0, p0, Lnicoid/network238/okhttp3/MultipartReader$PartSource;->this$0:Lnicoid/network238/okhttp3/MultipartReader;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lnicoid/network238/okhttp3/MultipartReader;->access$setCurrentPart$p(Lnicoid/network238/okhttp3/MultipartReader;Lnicoid/network238/okhttp3/MultipartReader$PartSource;)V

    :cond_0
    return-void
.end method

.method public read(Lnicoid/network238/okio/Buffer;J)J
    .registers 22

    move-object/from16 v1, p0

    move-object/from16 v0, p1

    move-wide/from16 v2, p2

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const-wide/16 v4, 0x0

    cmp-long v6, v2, v4

    if-ltz v6, :cond_9

    .line 168
    iget-object v6, v1, Lnicoid/network238/okhttp3/MultipartReader$PartSource;->this$0:Lnicoid/network238/okhttp3/MultipartReader;

    # getter for: Lnicoid/network238/okhttp3/MultipartReader;->currentPart:Lnicoid/network238/okhttp3/MultipartReader$PartSource;
    invoke-static {v6}, Lnicoid/network238/okhttp3/MultipartReader;->access$getCurrentPart$p(Lnicoid/network238/okhttp3/MultipartReader;)Lnicoid/network238/okhttp3/MultipartReader$PartSource;

    move-result-object v6

    invoke-static {v6, v1}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_8

    .line 170
    iget-object v6, v1, Lnicoid/network238/okhttp3/MultipartReader$PartSource;->this$0:Lnicoid/network238/okhttp3/MultipartReader;

    # getter for: Lnicoid/network238/okhttp3/MultipartReader;->source:Lnicoid/network238/okio/BufferedSource;
    invoke-static {v6}, Lnicoid/network238/okhttp3/MultipartReader;->access$getSource$p(Lnicoid/network238/okhttp3/MultipartReader;)Lnicoid/network238/okio/BufferedSource;

    move-result-object v6

    invoke-interface {v6}, Lnicoid/network238/okio/Source;->timeout()Lnicoid/network238/okio/Timeout;

    move-result-object v6

    iget-object v7, v1, Lnicoid/network238/okhttp3/MultipartReader$PartSource;->timeout:Lnicoid/network238/okio/Timeout;

    iget-object v8, v1, Lnicoid/network238/okhttp3/MultipartReader$PartSource;->this$0:Lnicoid/network238/okhttp3/MultipartReader;

    .line 238
    invoke-virtual {v6}, Lnicoid/network238/okio/Timeout;->timeoutNanos()J

    move-result-wide v9

    .line 239
    sget-object v11, Lnicoid/network238/okio/Timeout;->Companion:Lnicoid/network238/okio/Timeout$Companion;

    invoke-virtual {v7}, Lnicoid/network238/okio/Timeout;->timeoutNanos()J

    move-result-wide v12

    invoke-virtual {v6}, Lnicoid/network238/okio/Timeout;->timeoutNanos()J

    move-result-wide v14

    invoke-virtual {v11, v12, v13, v14, v15}, Lnicoid/network238/okio/Timeout$Companion;->minTimeout(JJ)J

    move-result-wide v11

    sget-object v13, Ljava/util/concurrent/TimeUnit;->NANOSECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v6, v11, v12, v13}, Lnicoid/network238/okio/Timeout;->timeout(JLjava/util/concurrent/TimeUnit;)Lnicoid/network238/okio/Timeout;

    .line 241
    invoke-virtual {v6}, Lnicoid/network238/okio/Timeout;->hasDeadline()Z

    move-result v11

    if-eqz v11, :cond_3

    .line 242
    invoke-virtual {v6}, Lnicoid/network238/okio/Timeout;->deadlineNanoTime()J

    move-result-wide v11

    .line 243
    invoke-virtual {v7}, Lnicoid/network238/okio/Timeout;->hasDeadline()Z

    move-result v16

    if-eqz v16, :cond_0

    .line 244
    move-wide/from16 v16, v4

    invoke-virtual {v6}, Lnicoid/network238/okio/Timeout;->deadlineNanoTime()J

    move-result-wide v4

    invoke-virtual {v7}, Lnicoid/network238/okio/Timeout;->deadlineNanoTime()J

    move-result-wide v14

    invoke-static {v4, v5, v14, v15}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v4

    invoke-virtual {v6, v4, v5}, Lnicoid/network238/okio/Timeout;->deadlineNanoTime(J)Lnicoid/network238/okio/Timeout;

    goto :goto_0

    .line 243
    :cond_0
    move-wide/from16 v16, v4

    .line 171
    :goto_0
    :try_start_0
    # invokes: Lnicoid/network238/okhttp3/MultipartReader;->currentPartBytesRemaining(J)J
    invoke-static {v8, v2, v3}, Lnicoid/network238/okhttp3/MultipartReader;->access$currentPartBytesRemaining(Lnicoid/network238/okhttp3/MultipartReader;J)J

    move-result-wide v2

    cmp-long v4, v2, v16

    if-nez v4, :cond_1

    const-wide/16 v14, -0x1

    goto :goto_1

    .line 175
    :cond_1
    # getter for: Lnicoid/network238/okhttp3/MultipartReader;->source:Lnicoid/network238/okio/BufferedSource;
    invoke-static {v8}, Lnicoid/network238/okhttp3/MultipartReader;->access$getSource$p(Lnicoid/network238/okhttp3/MultipartReader;)Lnicoid/network238/okio/BufferedSource;

    move-result-object v4

    invoke-interface {v4, v0, v2, v3}, Lnicoid/network238/okio/Source;->read(Lnicoid/network238/okio/Buffer;J)J

    move-result-wide v14
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 249
    :goto_1
    invoke-virtual {v6, v9, v10, v13}, Lnicoid/network238/okio/Timeout;->timeout(JLjava/util/concurrent/TimeUnit;)Lnicoid/network238/okio/Timeout;

    .line 250
    invoke-virtual {v7}, Lnicoid/network238/okio/Timeout;->hasDeadline()Z

    move-result v0

    if-eqz v0, :cond_6

    .line 251
    invoke-virtual {v6, v11, v12}, Lnicoid/network238/okio/Timeout;->deadlineNanoTime(J)Lnicoid/network238/okio/Timeout;

    return-wide v14

    :catchall_0
    move-exception v0

    .line 249
    sget-object v2, Ljava/util/concurrent/TimeUnit;->NANOSECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v6, v9, v10, v2}, Lnicoid/network238/okio/Timeout;->timeout(JLjava/util/concurrent/TimeUnit;)Lnicoid/network238/okio/Timeout;

    .line 250
    invoke-virtual {v7}, Lnicoid/network238/okio/Timeout;->hasDeadline()Z

    move-result v2

    if-eqz v2, :cond_2

    .line 251
    invoke-virtual {v6, v11, v12}, Lnicoid/network238/okio/Timeout;->deadlineNanoTime(J)Lnicoid/network238/okio/Timeout;

    :cond_2
    throw v0

    .line 255
    :cond_3
    move-wide/from16 v16, v4

    invoke-virtual {v7}, Lnicoid/network238/okio/Timeout;->hasDeadline()Z

    move-result v4

    if-eqz v4, :cond_4

    .line 256
    invoke-virtual {v7}, Lnicoid/network238/okio/Timeout;->deadlineNanoTime()J

    move-result-wide v4

    invoke-virtual {v6, v4, v5}, Lnicoid/network238/okio/Timeout;->deadlineNanoTime(J)Lnicoid/network238/okio/Timeout;

    .line 171
    :cond_4
    :try_start_1
    # invokes: Lnicoid/network238/okhttp3/MultipartReader;->currentPartBytesRemaining(J)J
    invoke-static {v8, v2, v3}, Lnicoid/network238/okhttp3/MultipartReader;->access$currentPartBytesRemaining(Lnicoid/network238/okhttp3/MultipartReader;J)J

    move-result-wide v2

    cmp-long v4, v2, v16

    if-nez v4, :cond_5

    const-wide/16 v14, -0x1

    goto :goto_2

    .line 175
    :cond_5
    # getter for: Lnicoid/network238/okhttp3/MultipartReader;->source:Lnicoid/network238/okio/BufferedSource;
    invoke-static {v8}, Lnicoid/network238/okhttp3/MultipartReader;->access$getSource$p(Lnicoid/network238/okhttp3/MultipartReader;)Lnicoid/network238/okio/BufferedSource;

    move-result-object v4

    invoke-interface {v4, v0, v2, v3}, Lnicoid/network238/okio/Source;->read(Lnicoid/network238/okio/Buffer;J)J

    move-result-wide v14
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 261
    :goto_2
    invoke-virtual {v6, v9, v10, v13}, Lnicoid/network238/okio/Timeout;->timeout(JLjava/util/concurrent/TimeUnit;)Lnicoid/network238/okio/Timeout;

    .line 262
    invoke-virtual {v7}, Lnicoid/network238/okio/Timeout;->hasDeadline()Z

    move-result v0

    if-eqz v0, :cond_6

    .line 263
    invoke-virtual {v6}, Lnicoid/network238/okio/Timeout;->clearDeadline()Lnicoid/network238/okio/Timeout;

    :cond_6
    return-wide v14

    :catchall_1
    move-exception v0

    .line 261
    sget-object v2, Ljava/util/concurrent/TimeUnit;->NANOSECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v6, v9, v10, v2}, Lnicoid/network238/okio/Timeout;->timeout(JLjava/util/concurrent/TimeUnit;)Lnicoid/network238/okio/Timeout;

    .line 262
    invoke-virtual {v7}, Lnicoid/network238/okio/Timeout;->hasDeadline()Z

    move-result v2

    if-eqz v2, :cond_7

    .line 263
    invoke-virtual {v6}, Lnicoid/network238/okio/Timeout;->clearDeadline()Lnicoid/network238/okio/Timeout;

    :cond_7
    throw v0

    .line 168
    :cond_8
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v2, "closed"

    invoke-direct {v0, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 167
    :cond_9
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v4, "byteCount < 0: "

    invoke-direct {v0, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    new-instance v2, Ljava/lang/IllegalArgumentException;

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v2, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method public timeout()Lnicoid/network238/okio/Timeout;
    .registers 2

    .line 180
    iget-object v0, p0, Lnicoid/network238/okhttp3/MultipartReader$PartSource;->timeout:Lnicoid/network238/okio/Timeout;

    return-object v0
.end method

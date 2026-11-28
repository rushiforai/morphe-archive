.class public final Lnicoid/network238/okio/AsyncTimeout$source$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lnicoid/network238/okio/Source;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lnicoid/network238/okio/AsyncTimeout;->source(Lnicoid/network238/okio/Source;)Lnicoid/network238/okio/Source;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000+\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\t\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0000*\u0001\u0000\u0008\n\u0018\u00002\u00020\u0001J\u0018\u0010\u0002\u001a\u00020\u00032\u0006\u0010\u0004\u001a\u00020\u00052\u0006\u0010\u0006\u001a\u00020\u0003H\u0016J\u0008\u0010\u0007\u001a\u00020\u0008H\u0016J\u0008\u0010\t\u001a\u00020\nH\u0016J\u0008\u0010\u000b\u001a\u00020\u000cH\u0016\u00a8\u0006\r"
    }
    d2 = {
        "nicoid/network238/okio/AsyncTimeout$source$1",
        "Lnicoid/network238/okio/Source;",
        "read",
        "",
        "sink",
        "Lnicoid/network238/okio/Buffer;",
        "byteCount",
        "close",
        "",
        "timeout",
        "Lnicoid/network238/okio/AsyncTimeout;",
        "toString",
        "",
        "okio"
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
.field final synthetic $source:Lnicoid/network238/okio/Source;

.field final synthetic this$0:Lnicoid/network238/okio/AsyncTimeout;


# direct methods
.method constructor <init>(Lnicoid/network238/okio/AsyncTimeout;Lnicoid/network238/okio/Source;)V
    .registers 3

    iput-object p1, p0, Lnicoid/network238/okio/AsyncTimeout$source$1;->this$0:Lnicoid/network238/okio/AsyncTimeout;

    iput-object p2, p0, Lnicoid/network238/okio/AsyncTimeout$source$1;->$source:Lnicoid/network238/okio/Source;

    .line 175
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public close()V
    .registers 4

    .line 181
    iget-object v0, p0, Lnicoid/network238/okio/AsyncTimeout$source$1;->this$0:Lnicoid/network238/okio/AsyncTimeout;

    iget-object v1, p0, Lnicoid/network238/okio/AsyncTimeout$source$1;->$source:Lnicoid/network238/okio/Source;

    .line 527
    invoke-virtual {v0}, Lnicoid/network238/okio/AsyncTimeout;->enter()V

    .line 181
    :try_start_0
    invoke-interface {v1}, Lnicoid/network238/okio/Source;->close()V

    sget-object v1, Lnicoid/network238/kotlin/Unit;->INSTANCE:Lnicoid/network238/kotlin/Unit;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 535
    invoke-virtual {v0}, Lnicoid/network238/okio/AsyncTimeout;->exit()Z

    move-result v1

    if-nez v1, :cond_0

    return-void

    .line 536
    :cond_0
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lnicoid/network238/okio/AsyncTimeout;->access$newTimeoutException(Ljava/io/IOException;)Ljava/io/IOException;

    move-result-object v0

    throw v0

    :catch_0
    move-exception v1

    .line 533
    :try_start_1
    invoke-virtual {v0}, Lnicoid/network238/okio/AsyncTimeout;->exit()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-virtual {v0, v1}, Lnicoid/network238/okio/AsyncTimeout;->access$newTimeoutException(Ljava/io/IOException;)Ljava/io/IOException;

    move-result-object v1

    :cond_1
    throw v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :catchall_0
    move-exception v1

    .line 535
    invoke-virtual {v0}, Lnicoid/network238/okio/AsyncTimeout;->exit()Z

    .line 536
    throw v1
.end method

.method public read(Lnicoid/network238/okio/Buffer;J)J
    .registers 6

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 177
    iget-object v0, p0, Lnicoid/network238/okio/AsyncTimeout$source$1;->this$0:Lnicoid/network238/okio/AsyncTimeout;

    iget-object v1, p0, Lnicoid/network238/okio/AsyncTimeout$source$1;->$source:Lnicoid/network238/okio/Source;

    .line 516
    invoke-virtual {v0}, Lnicoid/network238/okio/AsyncTimeout;->enter()V

    .line 177
    :try_start_0
    invoke-interface {v1, p1, p2, p3}, Lnicoid/network238/okio/Source;->read(Lnicoid/network238/okio/Buffer;J)J

    move-result-wide p1
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 524
    invoke-virtual {v0}, Lnicoid/network238/okio/AsyncTimeout;->exit()Z

    move-result p3

    if-nez p3, :cond_0

    return-wide p1

    .line 525
    :cond_0
    const/4 p1, 0x0

    invoke-virtual {v0, p1}, Lnicoid/network238/okio/AsyncTimeout;->access$newTimeoutException(Ljava/io/IOException;)Ljava/io/IOException;

    move-result-object p1

    throw p1

    :catch_0
    move-exception p1

    .line 522
    :try_start_1
    invoke-virtual {v0}, Lnicoid/network238/okio/AsyncTimeout;->exit()Z

    move-result p2

    if-eqz p2, :cond_1

    invoke-virtual {v0, p1}, Lnicoid/network238/okio/AsyncTimeout;->access$newTimeoutException(Ljava/io/IOException;)Ljava/io/IOException;

    move-result-object p1

    :cond_1
    throw p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :catchall_0
    move-exception p1

    .line 524
    invoke-virtual {v0}, Lnicoid/network238/okio/AsyncTimeout;->exit()Z

    .line 525
    throw p1
.end method

.method public timeout()Lnicoid/network238/okio/AsyncTimeout;
    .registers 2

    .line 184
    iget-object v0, p0, Lnicoid/network238/okio/AsyncTimeout$source$1;->this$0:Lnicoid/network238/okio/AsyncTimeout;

    return-object v0
.end method

.method public bridge synthetic timeout()Lnicoid/network238/okio/Timeout;
    .registers 2

    .line 175
    invoke-virtual {p0}, Lnicoid/network238/okio/AsyncTimeout$source$1;->timeout()Lnicoid/network238/okio/AsyncTimeout;

    move-result-object v0

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    .line 186
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "AsyncTimeout.source("

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lnicoid/network238/okio/AsyncTimeout$source$1;->$source:Lnicoid/network238/okio/Source;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v1, 0x29

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

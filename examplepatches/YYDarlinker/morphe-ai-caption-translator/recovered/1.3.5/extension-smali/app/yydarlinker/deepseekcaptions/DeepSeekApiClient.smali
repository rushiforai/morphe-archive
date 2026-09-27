.class final Lapp/yydarlinker/deepseekcaptions/DeepSeekApiClient;
.super Ljava/lang/Object;
.source "DeepSeekApiClient.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lapp/yydarlinker/deepseekcaptions/DeepSeekApiClient$RequestControl;
    }
.end annotation


# direct methods
.method constructor <init>()V
    .registers 1

    .line 8
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static readFully(Ljava/io/InputStream;I)[B
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 21
    :try_start_0
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V
    :try_end_5
    .catchall {:try_start_0 .. :try_end_5} :catchall_4b

    const/16 v1, 0x2000

    .line 22
    :try_start_7
    new-array v1, v1, [B

    .line 24
    :goto_9
    invoke-virtual {p0, v1}, Ljava/io/InputStream;->read([B)I

    move-result v2

    const/4 v3, -0x1

    if-eq v2, v3, :cond_34

    .line 25
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Thread;->isInterrupted()Z

    move-result v3

    if-nez v3, :cond_2e

    .line 26
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->size()I

    move-result v3

    add-int/2addr v3, v2

    if-gt v3, p1, :cond_26

    const/4 v3, 0x0

    .line 27
    invoke-virtual {v0, v1, v3, v2}, Ljava/io/ByteArrayOutputStream;->write([BII)V

    goto :goto_9

    .line 26
    :cond_26
    new-instance p1, Ljava/io/IOException;

    const-string v1, "response_too_large"

    invoke-direct {p1, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 25
    :cond_2e
    new-instance p1, Ljava/lang/InterruptedException;

    invoke-direct {p1}, Ljava/lang/InterruptedException;-><init>()V

    throw p1

    .line 29
    :cond_34
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object p1
    :try_end_38
    .catchall {:try_start_7 .. :try_end_38} :catchall_41

    .line 30
    :try_start_38
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->close()V
    :try_end_3b
    .catchall {:try_start_38 .. :try_end_3b} :catchall_4b

    if-eqz p0, :cond_40

    invoke-virtual {p0}, Ljava/io/InputStream;->close()V

    :cond_40
    return-object p1

    :catchall_41
    move-exception p1

    .line 20
    :try_start_42
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->close()V
    :try_end_45
    .catchall {:try_start_42 .. :try_end_45} :catchall_46

    goto :goto_4a

    :catchall_46
    move-exception v0

    :try_start_47
    invoke-virtual {p1, v0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :goto_4a
    throw p1
    :try_end_4b
    .catchall {:try_start_47 .. :try_end_4b} :catchall_4b

    :catchall_4b
    move-exception p1

    if-eqz p0, :cond_56

    :try_start_4e
    invoke-virtual {p0}, Ljava/io/InputStream;->close()V
    :try_end_51
    .catchall {:try_start_4e .. :try_end_51} :catchall_52

    goto :goto_56

    :catchall_52
    move-exception p0

    invoke-virtual {p1, p0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_56
    :goto_56
    throw p1
.end method

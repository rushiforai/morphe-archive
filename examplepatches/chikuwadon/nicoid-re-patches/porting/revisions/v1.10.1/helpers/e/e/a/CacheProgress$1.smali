.class Le/e/a/CacheProgress$1;
.super Ljava/lang/Object;
.source "CacheProgress.java"

# interfaces
.implements Le/e/a/CacheTransferPlan$Fetch;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Le/e/a/CacheProgress;->measure(Ljava/lang/String;Ljava/lang/Object;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field private final synthetic val$cookie:Ljava/lang/String;

.field private final synthetic val$session:I


# direct methods
.method constructor <init>(ILjava/lang/String;)V
    .registers 3

    .line 55
    iput p1, p0, Le/e/a/CacheProgress$1;->val$session:I

    iput-object p2, p0, Le/e/a/CacheProgress$1;->val$cookie:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public assets(I)V
    .registers 4

    .line 55
    iget v0, p0, Le/e/a/CacheProgress$1;->val$session:I

    # getter for: Le/e/a/CacheProgress;->generation:I
    invoke-static {}, Le/e/a/CacheProgress;->access$7()I

    move-result v1

    if-ne v0, v1, :cond_b

    invoke-static {p1}, Le/e/a/CacheProgress;->access$8(I)V

    :cond_b
    return-void
.end method

.method public length(Ljava/net/URL;)J
    .registers 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 64
    iget v0, p0, Le/e/a/CacheProgress$1;->val$session:I

    # getter for: Le/e/a/CacheProgress;->generation:I
    invoke-static {}, Le/e/a/CacheProgress;->access$7()I

    move-result v1

    if-ne v0, v1, :cond_76

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Thread;->isInterrupted()Z

    move-result v0

    if-nez v0, :cond_76

    .line 65
    const-string v0, "https"

    invoke-virtual {p1}, Ljava/net/URL;->getProtocol()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_6e

    .line 66
    iget-object v0, p0, Le/e/a/CacheProgress$1;->val$cookie:Ljava/lang/String;

    const-string v1, "0-0"

    const/4 v2, 0x0

    invoke-static {p1, v0, v1, v2}, Le/e/a/SecureMedia240;->connect(Ljava/net/URL;Ljava/lang/String;Ljava/lang/String;Z)Ljava/net/HttpURLConnection;

    move-result-object p1

    .line 67
    :try_start_27
    invoke-virtual {p1}, Ljava/net/HttpURLConnection;->getResponseCode()I

    move-result v0

    const-wide/16 v1, -0x1

    const/16 v3, 0xc8

    if-lt v0, v3, :cond_65

    const/16 v4, 0x12c

    if-lt v0, v4, :cond_36

    goto :goto_65

    .line 68
    :cond_36
    const-string v4, "Content-Range"

    invoke-virtual {p1, v4}, Ljava/net/HttpURLConnection;->getHeaderField(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    if-eqz v4, :cond_5b

    const-string v5, "/"

    invoke-virtual {v4, v5}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v5
    :try_end_44
    .catchall {:try_start_27 .. :try_end_44} :catchall_69

    if-eqz v5, :cond_5b

    const/16 v5, 0x2f

    :try_start_48
    invoke-virtual {v4, v5}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v5

    add-int/lit8 v5, v5, 0x1

    invoke-virtual {v4, v5}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v0
    :try_end_56
    .catch Ljava/lang/NumberFormatException; {:try_start_48 .. :try_end_56} :catch_5a
    .catchall {:try_start_48 .. :try_end_56} :catchall_69

    .line 70
    invoke-virtual {p1}, Ljava/net/HttpURLConnection;->disconnect()V

    return-wide v0

    .line 68
    :catch_5a
    move-exception v4

    .line 69
    :cond_5b
    if-ne v0, v3, :cond_61

    :try_start_5d
    invoke-virtual {p1}, Ljava/net/HttpURLConnection;->getContentLengthLong()J

    move-result-wide v1
    :try_end_61
    .catchall {:try_start_5d .. :try_end_61} :catchall_69

    .line 70
    :cond_61
    invoke-virtual {p1}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 69
    return-wide v1

    .line 70
    :cond_65
    :goto_65
    invoke-virtual {p1}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 67
    return-wide v1

    .line 70
    :catchall_69
    move-exception v0

    invoke-virtual {p1}, Ljava/net/HttpURLConnection;->disconnect()V

    throw v0

    .line 65
    :cond_6e
    new-instance p1, Ljava/io/IOException;

    const-string v0, "Invalid media URL"

    invoke-direct {p1, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 64
    :cond_76
    new-instance p1, Ljava/io/InterruptedIOException;

    invoke-direct {p1}, Ljava/io/InterruptedIOException;-><init>()V

    throw p1
.end method

.method public text(Ljava/net/URL;)Ljava/lang/String;
    .registers 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 56
    iget v0, p0, Le/e/a/CacheProgress$1;->val$session:I

    # getter for: Le/e/a/CacheProgress;->generation:I
    invoke-static {}, Le/e/a/CacheProgress;->access$7()I

    move-result v1

    if-ne v0, v1, :cond_8d

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Thread;->isInterrupted()Z

    move-result v0

    if-nez v0, :cond_8d

    .line 57
    const-string v0, "https"

    invoke-virtual {p1}, Ljava/net/URL;->getProtocol()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_85

    .line 58
    iget-object v0, p0, Le/e/a/CacheProgress$1;->val$cookie:Ljava/lang/String;

    const/4 v1, 0x0

    const/4 v2, 0x0

    invoke-static {p1, v0, v1, v2}, Le/e/a/SecureMedia240;->connect(Ljava/net/URL;Ljava/lang/String;Ljava/lang/String;Z)Ljava/net/HttpURLConnection;

    move-result-object p1

    .line 59
    :try_start_26
    invoke-virtual {p1}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v0
    :try_end_2a
    .catchall {:try_start_26 .. :try_end_2a} :catchall_76

    :try_start_2a
    new-instance v3, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v3}, Ljava/io/ByteArrayOutputStream;-><init>()V
    :try_end_2f
    .catchall {:try_start_2a .. :try_end_2f} :catchall_66

    .line 60
    const/16 v4, 0x2000

    :try_start_31
    new-array v4, v4, [B

    :goto_33
    invoke-virtual {v0, v4}, Ljava/io/InputStream;->read([B)I

    move-result v5

    const/4 v6, -0x1

    if-ne v5, v6, :cond_4c

    const-string v2, "UTF-8"

    invoke-virtual {v3, v2}, Ljava/io/ByteArrayOutputStream;->toString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2
    :try_end_40
    .catchall {:try_start_31 .. :try_end_40} :catchall_61

    .line 61
    :try_start_40
    invoke-virtual {v3}, Ljava/io/ByteArrayOutputStream;->close()V
    :try_end_43
    .catchall {:try_start_40 .. :try_end_43} :catchall_66

    if-eqz v0, :cond_48

    :try_start_45
    invoke-virtual {v0}, Ljava/io/InputStream;->close()V
    :try_end_48
    .catchall {:try_start_45 .. :try_end_48} :catchall_76

    :cond_48
    invoke-virtual {p1}, Ljava/net/HttpURLConnection;->disconnect()V

    return-object v2

    .line 60
    :cond_4c
    :try_start_4c
    invoke-virtual {v3}, Ljava/io/ByteArrayOutputStream;->size()I

    move-result v6

    add-int/2addr v6, v5

    const/high16 v7, 0x400000

    if-gt v6, v7, :cond_59

    invoke-virtual {v3, v4, v2, v5}, Ljava/io/ByteArrayOutputStream;->write([BII)V

    goto :goto_33

    :cond_59
    new-instance v1, Ljava/io/IOException;

    const-string v2, "Playlist too large"

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1
    :try_end_61
    .catchall {:try_start_4c .. :try_end_61} :catchall_61

    .line 61
    :catchall_61
    move-exception v1

    :try_start_62
    invoke-virtual {v3}, Ljava/io/ByteArrayOutputStream;->close()V

    throw v1
    :try_end_66
    .catchall {:try_start_62 .. :try_end_66} :catchall_66

    :catchall_66
    move-exception v2

    if-nez v1, :cond_6b

    move-object v1, v2

    goto :goto_70

    :cond_6b
    if-eq v1, v2, :cond_70

    :try_start_6d
    invoke-virtual {v1, v2}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_70
    :goto_70
    if-eqz v0, :cond_75

    invoke-virtual {v0}, Ljava/io/InputStream;->close()V

    :cond_75
    throw v1
    :try_end_76
    .catchall {:try_start_6d .. :try_end_76} :catchall_76

    :catchall_76
    move-exception v0

    if-eqz v1, :cond_7f

    if-eq v1, v0, :cond_7e

    :try_start_7b
    invoke-virtual {v1, v0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_7e
    move-object v0, v1

    :cond_7f
    throw v0
    :try_end_80
    .catchall {:try_start_7b .. :try_end_80} :catchall_80

    :catchall_80
    move-exception v0

    invoke-virtual {p1}, Ljava/net/HttpURLConnection;->disconnect()V

    throw v0

    .line 57
    :cond_85
    new-instance p1, Ljava/io/IOException;

    const-string v0, "Invalid media URL"

    invoke-direct {p1, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 56
    :cond_8d
    new-instance p1, Ljava/io/InterruptedIOException;

    invoke-direct {p1}, Ljava/io/InterruptedIOException;-><init>()V

    throw p1
.end method

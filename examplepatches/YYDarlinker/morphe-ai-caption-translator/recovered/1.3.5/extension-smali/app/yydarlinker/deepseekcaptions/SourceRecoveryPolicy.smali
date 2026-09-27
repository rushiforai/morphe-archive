.class final Lapp/yydarlinker/deepseekcaptions/SourceRecoveryPolicy;
.super Ljava/lang/Object;
.source "SourceRecoveryPolicy.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lapp/yydarlinker/deepseekcaptions/SourceRecoveryPolicy$Failure;
    }
.end annotation


# direct methods
.method private constructor <init>()V
    .registers 1

    .line 48
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static classify(Ljava/lang/Throwable;)Lapp/yydarlinker/deepseekcaptions/SourceRecoveryPolicy$Failure;
    .registers 10

    move-object v0, p0

    :goto_1
    if-eqz v0, :cond_20

    .line 21
    instance-of v1, v0, Lapp/yydarlinker/deepseekcaptions/SourceRecoveryPolicy$Failure;

    if-eqz v1, :cond_a

    check-cast v0, Lapp/yydarlinker/deepseekcaptions/SourceRecoveryPolicy$Failure;

    return-object v0

    .line 22
    :cond_a
    instance-of v1, v0, Ljavax/net/ssl/SSLException;

    if-eqz v1, :cond_1a

    new-instance v2, Lapp/yydarlinker/deepseekcaptions/SourceRecoveryPolicy$Failure;

    const/4 v4, 0x0

    const-wide/16 v5, 0x0

    const-string v3, "tls"

    move-object v7, p0

    invoke-direct/range {v2 .. v7}, Lapp/yydarlinker/deepseekcaptions/SourceRecoveryPolicy$Failure;-><init>(Ljava/lang/String;ZJLjava/lang/Throwable;)V

    return-object v2

    :cond_1a
    move-object v8, p0

    .line 20
    invoke-virtual {v0}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v0

    goto :goto_1

    :cond_20
    move-object v8, p0

    :goto_21
    if-eqz p0, :cond_5a

    .line 25
    instance-of v0, p0, Ljava/net/SocketTimeoutException;

    if-eqz v0, :cond_32

    new-instance v3, Lapp/yydarlinker/deepseekcaptions/SourceRecoveryPolicy$Failure;

    const/4 v5, 0x1

    const-wide/16 v6, 0x0

    const-string v4, "timeout"

    invoke-direct/range {v3 .. v8}, Lapp/yydarlinker/deepseekcaptions/SourceRecoveryPolicy$Failure;-><init>(Ljava/lang/String;ZJLjava/lang/Throwable;)V

    return-object v3

    .line 26
    :cond_32
    instance-of v0, p0, Ljava/lang/InterruptedException;

    if-nez v0, :cond_4f

    instance-of v0, p0, Ljava/io/InterruptedIOException;

    if-eqz v0, :cond_3b

    goto :goto_4f

    .line 28
    :cond_3b
    instance-of v0, p0, Ljava/io/IOException;

    if-eqz v0, :cond_4a

    new-instance v3, Lapp/yydarlinker/deepseekcaptions/SourceRecoveryPolicy$Failure;

    const/4 v5, 0x1

    const-wide/16 v6, 0x0

    const-string v4, "network"

    invoke-direct/range {v3 .. v8}, Lapp/yydarlinker/deepseekcaptions/SourceRecoveryPolicy$Failure;-><init>(Ljava/lang/String;ZJLjava/lang/Throwable;)V

    return-object v3

    .line 24
    :cond_4a
    invoke-virtual {p0}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object p0

    goto :goto_21

    .line 27
    :cond_4f
    :goto_4f
    new-instance v3, Lapp/yydarlinker/deepseekcaptions/SourceRecoveryPolicy$Failure;

    const/4 v5, 0x0

    const-wide/16 v6, 0x0

    const-string v4, "cancelled"

    invoke-direct/range {v3 .. v8}, Lapp/yydarlinker/deepseekcaptions/SourceRecoveryPolicy$Failure;-><init>(Ljava/lang/String;ZJLjava/lang/Throwable;)V

    return-object v3

    .line 30
    :cond_5a
    new-instance v3, Lapp/yydarlinker/deepseekcaptions/SourceRecoveryPolicy$Failure;

    const/4 v5, 0x0

    const-wide/16 v6, 0x0

    const-string v4, "source_format"

    invoke-direct/range {v3 .. v8}, Lapp/yydarlinker/deepseekcaptions/SourceRecoveryPolicy$Failure;-><init>(Ljava/lang/String;ZJLjava/lang/Throwable;)V

    return-object v3
.end method

.method static delay(IJ)J
    .registers 6

    const/4 v0, 0x5

    .line 45
    new-array v0, v0, [J

    fill-array-data v0, :array_1a

    add-int/lit8 p0, p0, -0x1

    const/4 v1, 0x0

    .line 46
    invoke-static {v1, p0}, Ljava/lang/Math;->max(II)I

    move-result p0

    const/4 v1, 0x4

    invoke-static {v1, p0}, Ljava/lang/Math;->min(II)I

    move-result p0

    aget-wide v1, v0, p0

    invoke-static {v1, v2, p1, p2}, Ljava/lang/Math;->max(JJ)J

    move-result-wide p0

    return-wide p0

    nop

    :array_1a
    .array-data 8
        0x2ee
        0x7d0
        0x1388
        0x3a98
        0x7530
    .end array-data
.end method

.method static formatFallback(Ljava/lang/Throwable;)Z
    .registers 3

    .line 38
    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/SourceRecoveryPolicy;->classify(Ljava/lang/Throwable;)Lapp/yydarlinker/deepseekcaptions/SourceRecoveryPolicy$Failure;

    move-result-object p0

    .line 39
    iget-object v0, p0, Lapp/yydarlinker/deepseekcaptions/SourceRecoveryPolicy$Failure;->category:Ljava/lang/String;

    const-string v1, "source_format"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_43

    iget-object v0, p0, Lapp/yydarlinker/deepseekcaptions/SourceRecoveryPolicy$Failure;->category:Ljava/lang/String;

    const-string v1, "source_empty"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_43

    iget-object v0, p0, Lapp/yydarlinker/deepseekcaptions/SourceRecoveryPolicy$Failure;->category:Ljava/lang/String;

    const-string v1, "empty_response"

    .line 40
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_43

    iget-object v0, p0, Lapp/yydarlinker/deepseekcaptions/SourceRecoveryPolicy$Failure;->category:Ljava/lang/String;

    const-string v1, "http_400"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_43

    iget-object v0, p0, Lapp/yydarlinker/deepseekcaptions/SourceRecoveryPolicy$Failure;->category:Ljava/lang/String;

    const-string v1, "http_403"

    .line 41
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_43

    iget-object p0, p0, Lapp/yydarlinker/deepseekcaptions/SourceRecoveryPolicy$Failure;->category:Ljava/lang/String;

    const-string v0, "http_404"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_41

    goto :goto_43

    :cond_41
    const/4 p0, 0x0

    return p0

    :cond_43
    :goto_43
    const/4 p0, 0x1

    return p0
.end method

.method static http(ILjava/lang/String;)Lapp/yydarlinker/deepseekcaptions/SourceRecoveryPolicy$Failure;
    .registers 10

    const-wide/16 v0, 0x0

    .line 34
    :try_start_2
    invoke-static {p1}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v2

    invoke-static {v0, v1, v2, v3}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v2

    const-wide/16 v4, 0x78

    invoke-static {v4, v5, v2, v3}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v0
    :try_end_10
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_10} :catch_13

    const-wide/16 v2, 0x3e8

    mul-long/2addr v0, v2

    :catch_13
    move-wide v5, v0

    .line 35
    new-instance v2, Lapp/yydarlinker/deepseekcaptions/SourceRecoveryPolicy$Failure;

    new-instance p1, Ljava/lang/StringBuilder;

    const-string v0, "http_"

    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    const/16 p1, 0x198

    if-eq p0, p1, :cond_37

    const/16 p1, 0x1a9

    if-eq p0, p1, :cond_37

    const/16 p1, 0x1ad

    if-eq p0, p1, :cond_37

    const/16 p1, 0x1f4

    if-lt p0, p1, :cond_35

    goto :goto_37

    :cond_35
    const/4 p0, 0x0

    goto :goto_38

    :cond_37
    :goto_37
    const/4 p0, 0x1

    :goto_38
    move v4, p0

    const/4 v7, 0x0

    invoke-direct/range {v2 .. v7}, Lapp/yydarlinker/deepseekcaptions/SourceRecoveryPolicy$Failure;-><init>(Ljava/lang/String;ZJLjava/lang/Throwable;)V

    return-object v2
.end method

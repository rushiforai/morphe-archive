.class final Lnicoid/network238/okio/LimitSource;
.super Lnicoid/network238/okio/ForwardingSource;
.source "SourceFile"


# annotations
.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000,\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\t\n\u0000\n\u0002\u0010\u000b\n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0002\u0008\u0002\u0018\u00002\u00020\u0001B\u001f\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u0012\u0006\u0010\u0006\u001a\u00020\u0007\u00a2\u0006\u0004\u0008\u0008\u0010\tJ\u0018\u0010\u000b\u001a\u00020\u00052\u0006\u0010\u000c\u001a\u00020\r2\u0006\u0010\u0004\u001a\u00020\u0005H\u0016J\u0014\u0010\u000e\u001a\u00020\u000f*\u00020\r2\u0006\u0010\u0010\u001a\u00020\u0005H\u0002R\u000e\u0010\u0004\u001a\u00020\u0005X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0006\u001a\u00020\u0007X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\n\u001a\u00020\u0005X\u0082\u000e\u00a2\u0006\u0002\n\u0000\u00a8\u0006\u0011"
    }
    d2 = {
        "Lnicoid/network238/okio/LimitSource;",
        "Lnicoid/network238/okio/ForwardingSource;",
        "delegate",
        "Lnicoid/network238/okio/Source;",
        "byteCount",
        "",
        "throwIfSourceIsLonger",
        "",
        "<init>",
        "(Lnicoid/network238/okio/Source;JZ)V",
        "bytesReceived",
        "read",
        "sink",
        "Lnicoid/network238/okio/Buffer;",
        "truncateToSize",
        "",
        "newByteCount",
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
.field private final byteCount:J

.field private bytesReceived:J

.field private final throwIfSourceIsLonger:Z


# direct methods
.method public constructor <init>(Lnicoid/network238/okio/Source;JZ)V
    .registers 7

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 99
    invoke-direct {p0, p1}, Lnicoid/network238/okio/ForwardingSource;-><init>(Lnicoid/network238/okio/Source;)V

    .line 101
    iput-wide p2, p0, Lnicoid/network238/okio/LimitSource;->byteCount:J

    .line 102
    iput-boolean p4, p0, Lnicoid/network238/okio/LimitSource;->throwIfSourceIsLonger:Z

    const-wide/16 v0, 0x0

    cmp-long p1, p2, v0

    if-ltz p1, :cond_0

    return-void

    .line 107
    :cond_0
    new-instance p1, Ljava/lang/StringBuilder;

    const-string p4, "byteCount < 0: "

    invoke-direct {p1, p4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, p2, p3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    new-instance p2, Ljava/lang/IllegalArgumentException;

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p2
.end method

.method private final truncateToSize(Lnicoid/network238/okio/Buffer;J)V
    .registers 5

    .line 149
    new-instance v0, Lnicoid/network238/okio/Buffer;

    invoke-direct {v0}, Lnicoid/network238/okio/Buffer;-><init>()V

    .line 150
    invoke-virtual {v0, p1}, Lnicoid/network238/okio/Buffer;->writeAll(Lnicoid/network238/okio/Source;)J

    .line 151
    invoke-virtual {p1, v0, p2, p3}, Lnicoid/network238/okio/Buffer;->write(Lnicoid/network238/okio/Buffer;J)V

    .line 152
    invoke-virtual {v0}, Lnicoid/network238/okio/Buffer;->clear()V

    return-void
.end method


# virtual methods
.method public read(Lnicoid/network238/okio/Buffer;J)J
    .registers 16

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 111
    iget-wide v0, p0, Lnicoid/network238/okio/LimitSource;->byteCount:J

    iget-wide v2, p0, Lnicoid/network238/okio/LimitSource;->bytesReceived:J

    sub-long/2addr v0, v2

    const-wide/16 v2, 0x0

    cmp-long v4, v0, v2

    const-string v5, " bytes but got "

    const-string v6, "expected "

    if-ltz v4, :cond_5

    .line 117
    iget-boolean v7, p0, Lnicoid/network238/okio/LimitSource;->throwIfSourceIsLonger:Z

    const-wide/16 v8, -0x1

    if-eqz v7, :cond_0

    const-wide/16 v10, 0x1

    add-long/2addr v0, v10

    .line 119
    invoke-static {p2, p3, v0, v1}, Lnicoid/network238/kotlin/ranges/RangesKt;->coerceAtMost(JJ)J

    move-result-wide p2

    goto :goto_0

    :cond_0
    if-nez v4, :cond_1

    goto :goto_1

    .line 126
    :cond_1
    invoke-static {p2, p3, v0, v1}, Lnicoid/network238/kotlin/ranges/RangesKt;->coerceAtMost(JJ)J

    move-result-wide p2

    .line 129
    :goto_0
    invoke-super {p0, p1, p2, p3}, Lnicoid/network238/okio/ForwardingSource;->read(Lnicoid/network238/okio/Buffer;J)J

    move-result-wide p2

    cmp-long v0, p2, v8

    if-nez v0, :cond_3

    if-nez v4, :cond_2

    :goto_1
    return-wide v8

    .line 133
    :cond_2
    new-instance p1, Ljava/io/EOFException;

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-wide v0, p0, Lnicoid/network238/okio/LimitSource;->byteCount:J

    invoke-virtual {p2, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    iget-wide v0, p0, Lnicoid/network238/okio/LimitSource;->bytesReceived:J

    invoke-virtual {p2, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Ljava/io/EOFException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 136
    :cond_3
    iget-wide v0, p0, Lnicoid/network238/okio/LimitSource;->bytesReceived:J

    add-long/2addr v0, p2

    iput-wide v0, p0, Lnicoid/network238/okio/LimitSource;->bytesReceived:J

    .line 138
    iget-wide v7, p0, Lnicoid/network238/okio/LimitSource;->byteCount:J

    sub-long/2addr v0, v7

    cmp-long v2, v0, v2

    if-gtz v2, :cond_4

    return-wide p2

    .line 141
    :cond_4
    invoke-virtual {p1}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide p2

    sub-long/2addr p2, v0

    invoke-direct {p0, p1, p2, p3}, Lnicoid/network238/okio/LimitSource;->truncateToSize(Lnicoid/network238/okio/Buffer;J)V

    .line 142
    new-instance p1, Ljava/io/IOException;

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-wide v0, p0, Lnicoid/network238/okio/LimitSource;->byteCount:J

    invoke-virtual {p2, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    iget-wide v0, p0, Lnicoid/network238/okio/LimitSource;->bytesReceived:J

    invoke-virtual {p2, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 114
    :cond_5
    new-instance p1, Ljava/io/IOException;

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-wide v0, p0, Lnicoid/network238/okio/LimitSource;->byteCount:J

    invoke-virtual {p2, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    iget-wide v0, p0, Lnicoid/network238/okio/LimitSource;->bytesReceived:J

    invoke-virtual {p2, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

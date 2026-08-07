.class public final Lcom/tencent/cloud/ai/network/okio/r;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/tencent/cloud/ai/network/okio/g;


# instance fields
.field public final a:Lcom/tencent/cloud/ai/network/okio/e;

.field public final b:Lcom/tencent/cloud/ai/network/okio/w;

.field public c:Z


# direct methods
.method public constructor <init>(Lcom/tencent/cloud/ai/network/okio/w;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lcom/tencent/cloud/ai/network/okio/e;

    .line 5
    .line 6
    invoke-direct {v0}, Lcom/tencent/cloud/ai/network/okio/e;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/tencent/cloud/ai/network/okio/r;->a:Lcom/tencent/cloud/ai/network/okio/e;

    .line 10
    .line 11
    if-eqz p1, :cond_0

    .line 12
    .line 13
    iput-object p1, p0, Lcom/tencent/cloud/ai/network/okio/r;->b:Lcom/tencent/cloud/ai/network/okio/w;

    .line 14
    .line 15
    return-void

    .line 16
    :cond_0
    const-string p0, "source == null"

    .line 17
    .line 18
    invoke-static {p0}, Ll/mnd0;->a(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    const/4 p0, 0x0

    .line 22
    throw p0
.end method


# virtual methods
.method public a(Lcom/tencent/cloud/ai/network/okio/p;)I
    .locals 13

    .line 1
    iget-boolean v0, p0, Lcom/tencent/cloud/ai/network/okio/r;->c:Z

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-nez v0, :cond_6

    .line 5
    .line 6
    :cond_0
    iget-object v2, p0, Lcom/tencent/cloud/ai/network/okio/r;->a:Lcom/tencent/cloud/ai/network/okio/e;

    .line 7
    .line 8
    iget-object v3, v2, Lcom/tencent/cloud/ai/network/okio/e;->a:Lcom/tencent/cloud/ai/network/okio/s;

    .line 9
    .line 10
    iget-object v0, p1, Lcom/tencent/cloud/ai/network/okio/p;->a:[Lcom/tencent/cloud/ai/network/okio/ByteString;

    .line 11
    .line 12
    array-length v8, v0

    .line 13
    move v9, v1

    .line 14
    :goto_0
    const/4 v10, -0x1

    .line 15
    if-ge v9, v8, :cond_2

    .line 16
    .line 17
    aget-object v5, v0, v9

    .line 18
    .line 19
    iget-wide v6, v2, Lcom/tencent/cloud/ai/network/okio/e;->b:J

    .line 20
    .line 21
    invoke-virtual {v5}, Lcom/tencent/cloud/ai/network/okio/ByteString;->size()I

    .line 22
    .line 23
    .line 24
    move-result v4

    .line 25
    int-to-long v11, v4

    .line 26
    invoke-static {v6, v7, v11, v12}, Ljava/lang/Math;->min(JJ)J

    .line 27
    .line 28
    .line 29
    move-result-wide v6

    .line 30
    long-to-int v7, v6

    .line 31
    if-eqz v7, :cond_3

    .line 32
    .line 33
    iget v4, v3, Lcom/tencent/cloud/ai/network/okio/s;->b:I

    .line 34
    .line 35
    const/4 v6, 0x0

    .line 36
    invoke-virtual/range {v2 .. v7}, Lcom/tencent/cloud/ai/network/okio/e;->a(Lcom/tencent/cloud/ai/network/okio/s;ILcom/tencent/cloud/ai/network/okio/ByteString;II)Z

    .line 37
    .line 38
    .line 39
    move-result v4

    .line 40
    if-eqz v4, :cond_1

    .line 41
    .line 42
    goto :goto_1

    .line 43
    :cond_1
    add-int/lit8 v9, v9, 0x1

    .line 44
    .line 45
    goto :goto_0

    .line 46
    :cond_2
    move v9, v10

    .line 47
    :cond_3
    :goto_1
    if-ne v9, v10, :cond_4

    .line 48
    .line 49
    return v10

    .line 50
    :cond_4
    iget-object v0, p1, Lcom/tencent/cloud/ai/network/okio/p;->a:[Lcom/tencent/cloud/ai/network/okio/ByteString;

    .line 51
    .line 52
    aget-object v0, v0, v9

    .line 53
    .line 54
    invoke-virtual {v0}, Lcom/tencent/cloud/ai/network/okio/ByteString;->size()I

    .line 55
    .line 56
    .line 57
    move-result v0

    .line 58
    int-to-long v2, v0

    .line 59
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okio/r;->a:Lcom/tencent/cloud/ai/network/okio/e;

    .line 60
    .line 61
    iget-wide v4, v0, Lcom/tencent/cloud/ai/network/okio/e;->b:J

    .line 62
    .line 63
    cmp-long v4, v2, v4

    .line 64
    .line 65
    if-gtz v4, :cond_5

    .line 66
    .line 67
    invoke-virtual {v0, v2, v3}, Lcom/tencent/cloud/ai/network/okio/e;->d(J)V

    .line 68
    .line 69
    .line 70
    return v9

    .line 71
    :cond_5
    iget-object v2, p0, Lcom/tencent/cloud/ai/network/okio/r;->b:Lcom/tencent/cloud/ai/network/okio/w;

    .line 72
    .line 73
    const-wide/16 v3, 0x2000

    .line 74
    .line 75
    invoke-interface {v2, v0, v3, v4}, Lcom/tencent/cloud/ai/network/okio/w;->a(Lcom/tencent/cloud/ai/network/okio/e;J)J

    .line 76
    .line 77
    .line 78
    move-result-wide v2

    .line 79
    const-wide/16 v4, -0x1

    .line 80
    .line 81
    cmp-long v0, v2, v4

    .line 82
    .line 83
    if-nez v0, :cond_0

    .line 84
    .line 85
    return v10

    .line 86
    :cond_6
    const-string p0, "closed"

    .line 87
    .line 88
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 89
    .line 90
    .line 91
    return v1
.end method

.method public a(B)J
    .locals 6

    const-wide/16 v2, 0x0

    const-wide v4, 0x7fffffffffffffffL

    move-object v0, p0

    move v1, p1

    .line 110
    invoke-virtual/range {v0 .. v5}, Lcom/tencent/cloud/ai/network/okio/r;->a(BJJ)J

    move-result-wide p0

    return-wide p0
.end method

.method public a(BJJ)J
    .locals 9

    .line 111
    iget-boolean v0, p0, Lcom/tencent/cloud/ai/network/okio/r;->c:Z

    const-wide/16 v1, 0x0

    if-nez v0, :cond_4

    cmp-long v0, p2, v1

    if-ltz v0, :cond_3

    cmp-long v0, p4, p2

    if-ltz v0, :cond_3

    move-wide v5, p2

    :goto_0
    cmp-long p2, v5, p4

    const-wide/16 v0, -0x1

    if-gez p2, :cond_2

    .line 112
    iget-object v3, p0, Lcom/tencent/cloud/ai/network/okio/r;->a:Lcom/tencent/cloud/ai/network/okio/e;

    move v4, p1

    move-wide v7, p4

    invoke-virtual/range {v3 .. v8}, Lcom/tencent/cloud/ai/network/okio/e;->a(BJJ)J

    move-result-wide p1

    cmp-long p3, p1, v0

    if-eqz p3, :cond_0

    return-wide p1

    .line 113
    :cond_0
    iget-object p1, p0, Lcom/tencent/cloud/ai/network/okio/r;->a:Lcom/tencent/cloud/ai/network/okio/e;

    iget-wide p2, p1, Lcom/tencent/cloud/ai/network/okio/e;->b:J

    cmp-long p4, p2, v7

    if-gez p4, :cond_2

    .line 114
    iget-object p4, p0, Lcom/tencent/cloud/ai/network/okio/r;->b:Lcom/tencent/cloud/ai/network/okio/w;

    const-wide/16 v2, 0x2000

    invoke-interface {p4, p1, v2, v3}, Lcom/tencent/cloud/ai/network/okio/w;->a(Lcom/tencent/cloud/ai/network/okio/e;J)J

    move-result-wide p4

    cmp-long p1, p4, v0

    if-nez p1, :cond_1

    goto :goto_1

    .line 115
    :cond_1
    invoke-static {v5, v6, p2, p3}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v5

    move p1, v4

    move-wide p4, v7

    goto :goto_0

    :cond_2
    :goto_1
    return-wide v0

    :cond_3
    move-wide v7, p4

    .line 116
    invoke-static {p2, p3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p0

    invoke-static {v7, v8}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p1

    filled-new-array {p0, p1}, [Ljava/lang/Object;

    move-result-object p0

    const-string p1, "fromIndex=%s toIndex=%s"

    invoke-static {p1, p0}, Ll/gzi0;->a(Ljava/lang/String;[Ljava/lang/Object;)V

    return-wide v1

    .line 117
    :cond_4
    const-string p0, "closed"

    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    return-wide v1
.end method

.method public a(Lcom/tencent/cloud/ai/network/okio/e;J)J
    .locals 5

    const-wide/16 v0, 0x0

    if-eqz p1, :cond_3

    cmp-long v2, p2, v0

    if-ltz v2, :cond_2

    .line 92
    iget-boolean v2, p0, Lcom/tencent/cloud/ai/network/okio/r;->c:Z

    if-nez v2, :cond_1

    .line 93
    iget-object v2, p0, Lcom/tencent/cloud/ai/network/okio/r;->a:Lcom/tencent/cloud/ai/network/okio/e;

    iget-wide v3, v2, Lcom/tencent/cloud/ai/network/okio/e;->b:J

    cmp-long v0, v3, v0

    if-nez v0, :cond_0

    .line 94
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okio/r;->b:Lcom/tencent/cloud/ai/network/okio/w;

    const-wide/16 v3, 0x2000

    invoke-interface {v0, v2, v3, v4}, Lcom/tencent/cloud/ai/network/okio/w;->a(Lcom/tencent/cloud/ai/network/okio/e;J)J

    move-result-wide v0

    const-wide/16 v2, -0x1

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    return-wide v2

    .line 95
    :cond_0
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okio/r;->a:Lcom/tencent/cloud/ai/network/okio/e;

    iget-wide v0, v0, Lcom/tencent/cloud/ai/network/okio/e;->b:J

    invoke-static {p2, p3, v0, v1}, Ljava/lang/Math;->min(JJ)J

    move-result-wide p2

    .line 96
    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okio/r;->a:Lcom/tencent/cloud/ai/network/okio/e;

    invoke-virtual {p0, p1, p2, p3}, Lcom/tencent/cloud/ai/network/okio/e;->a(Lcom/tencent/cloud/ai/network/okio/e;J)J

    move-result-wide p0

    return-wide p0

    .line 97
    :cond_1
    const-string p0, "closed"

    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    return-wide v0

    .line 98
    :cond_2
    const-string p0, "byteCount < 0: "

    invoke-static {p0, p2, p3}, Ll/fcg0;->a(Ljava/lang/String;J)V

    return-wide v0

    .line 99
    :cond_3
    const-string p0, "sink == null"

    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    return-wide v0
.end method

.method public a(J)Lcom/tencent/cloud/ai/network/okio/ByteString;
    .locals 1

    .line 100
    invoke-virtual {p0, p1, p2}, Lcom/tencent/cloud/ai/network/okio/r;->b(J)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 101
    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okio/r;->a:Lcom/tencent/cloud/ai/network/okio/e;

    invoke-virtual {p0, p1, p2}, Lcom/tencent/cloud/ai/network/okio/e;->a(J)Lcom/tencent/cloud/ai/network/okio/ByteString;

    move-result-object p0

    return-object p0

    .line 102
    :cond_0
    invoke-static {}, Ll/vg3;->a()V

    const/4 p0, 0x0

    return-object p0
.end method

.method public a()Lcom/tencent/cloud/ai/network/okio/e;
    .locals 0

    .line 103
    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okio/r;->a:Lcom/tencent/cloud/ai/network/okio/e;

    return-object p0
.end method

.method public a(Ljava/nio/charset/Charset;)Ljava/lang/String;
    .locals 3

    const/4 v0, 0x0

    if-eqz p1, :cond_0

    .line 104
    iget-object v1, p0, Lcom/tencent/cloud/ai/network/okio/r;->a:Lcom/tencent/cloud/ai/network/okio/e;

    iget-object v2, p0, Lcom/tencent/cloud/ai/network/okio/r;->b:Lcom/tencent/cloud/ai/network/okio/w;

    invoke-virtual {v1, v2}, Lcom/tencent/cloud/ai/network/okio/e;->a(Lcom/tencent/cloud/ai/network/okio/w;)J

    .line 105
    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okio/r;->a:Lcom/tencent/cloud/ai/network/okio/e;

    .line 106
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 107
    :try_start_0
    iget-wide v1, p0, Lcom/tencent/cloud/ai/network/okio/e;->b:J

    invoke-virtual {p0, v1, v2, p1}, Lcom/tencent/cloud/ai/network/okio/e;->a(JLjava/nio/charset/Charset;)Ljava/lang/String;

    move-result-object p0
    :try_end_0
    .catch Ljava/io/EOFException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    :catch_0
    move-exception p0

    .line 108
    invoke-static {p0}, Ll/gig0;->a(Ljava/lang/Object;)V

    return-object v0

    .line 109
    :cond_0
    const-string p0, "charset == null"

    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    return-object v0
.end method

.method public b()I
    .locals 2

    const-wide/16 v0, 0x4

    .line 58
    invoke-virtual {p0, v0, v1}, Lcom/tencent/cloud/ai/network/okio/r;->f(J)V

    .line 59
    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okio/r;->a:Lcom/tencent/cloud/ai/network/okio/e;

    .line 60
    invoke-virtual {p0}, Lcom/tencent/cloud/ai/network/okio/e;->readInt()I

    move-result p0

    invoke-static {p0}, Lcom/tencent/cloud/ai/network/okio/y;->a(I)I

    move-result p0

    return p0
.end method

.method public b(Lcom/tencent/cloud/ai/network/okio/e;J)V
    .locals 3

    .line 49
    :try_start_0
    invoke-virtual {p0, p2, p3}, Lcom/tencent/cloud/ai/network/okio/r;->b(J)Z

    move-result v0
    :try_end_0
    .catch Ljava/io/EOFException; {:try_start_0 .. :try_end_0} :catch_0

    if-eqz v0, :cond_1

    .line 50
    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okio/r;->a:Lcom/tencent/cloud/ai/network/okio/e;

    .line 51
    iget-wide v0, p0, Lcom/tencent/cloud/ai/network/okio/e;->b:J

    cmp-long v2, v0, p2

    if-ltz v2, :cond_0

    .line 52
    invoke-virtual {p1, p0, p2, p3}, Lcom/tencent/cloud/ai/network/okio/e;->write(Lcom/tencent/cloud/ai/network/okio/e;J)V

    return-void

    .line 53
    :cond_0
    invoke-virtual {p1, p0, v0, v1}, Lcom/tencent/cloud/ai/network/okio/e;->write(Lcom/tencent/cloud/ai/network/okio/e;J)V

    .line 54
    invoke-static {}, Ll/vg3;->a()V

    return-void

    .line 55
    :cond_1
    :try_start_1
    new-instance p2, Ljava/io/EOFException;

    invoke-direct {p2}, Ljava/io/EOFException;-><init>()V

    throw p2
    :try_end_1
    .catch Ljava/io/EOFException; {:try_start_1 .. :try_end_1} :catch_0

    :catch_0
    move-exception p2

    .line 56
    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okio/r;->a:Lcom/tencent/cloud/ai/network/okio/e;

    invoke-virtual {p1, p0}, Lcom/tencent/cloud/ai/network/okio/e;->a(Lcom/tencent/cloud/ai/network/okio/w;)J

    .line 57
    throw p2
.end method

.method public b(J)Z
    .locals 6

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    cmp-long v0, p1, v0

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    if-ltz v0, :cond_3

    .line 7
    .line 8
    iget-boolean v0, p0, Lcom/tencent/cloud/ai/network/okio/r;->c:Z

    .line 9
    .line 10
    if-nez v0, :cond_2

    .line 11
    .line 12
    :cond_0
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okio/r;->a:Lcom/tencent/cloud/ai/network/okio/e;

    .line 13
    .line 14
    iget-wide v2, v0, Lcom/tencent/cloud/ai/network/okio/e;->b:J

    .line 15
    .line 16
    cmp-long v2, v2, p1

    .line 17
    .line 18
    if-gez v2, :cond_1

    .line 19
    .line 20
    iget-object v2, p0, Lcom/tencent/cloud/ai/network/okio/r;->b:Lcom/tencent/cloud/ai/network/okio/w;

    .line 21
    .line 22
    const-wide/16 v3, 0x2000

    .line 23
    .line 24
    invoke-interface {v2, v0, v3, v4}, Lcom/tencent/cloud/ai/network/okio/w;->a(Lcom/tencent/cloud/ai/network/okio/e;J)J

    .line 25
    .line 26
    .line 27
    move-result-wide v2

    .line 28
    const-wide/16 v4, -0x1

    .line 29
    .line 30
    cmp-long v0, v2, v4

    .line 31
    .line 32
    if-nez v0, :cond_0

    .line 33
    .line 34
    return v1

    .line 35
    :cond_1
    const/4 p0, 0x1

    .line 36
    return p0

    .line 37
    :cond_2
    const-string p0, "closed"

    .line 38
    .line 39
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    return v1

    .line 43
    :cond_3
    const-string p0, "byteCount < 0: "

    .line 44
    .line 45
    invoke-static {p0, p1, p2}, Ll/fcg0;->a(Ljava/lang/String;J)V

    .line 46
    .line 47
    .line 48
    return v1
.end method

.method public c()J
    .locals 5

    const-wide/16 v0, 0x1

    .line 141
    invoke-virtual {p0, v0, v1}, Lcom/tencent/cloud/ai/network/okio/r;->f(J)V

    const/4 v0, 0x0

    :goto_0
    add-int/lit8 v1, v0, 0x1

    int-to-long v2, v1

    .line 142
    invoke-virtual {p0, v2, v3}, Lcom/tencent/cloud/ai/network/okio/r;->b(J)Z

    move-result v2

    if-eqz v2, :cond_5

    .line 143
    iget-object v2, p0, Lcom/tencent/cloud/ai/network/okio/r;->a:Lcom/tencent/cloud/ai/network/okio/e;

    int-to-long v3, v0

    invoke-virtual {v2, v3, v4}, Lcom/tencent/cloud/ai/network/okio/e;->h(J)B

    move-result v2

    const/16 v3, 0x30

    if-lt v2, v3, :cond_0

    const/16 v3, 0x39

    if-le v2, v3, :cond_2

    :cond_0
    const/16 v3, 0x61

    if-lt v2, v3, :cond_1

    const/16 v3, 0x66

    if-le v2, v3, :cond_2

    :cond_1
    const/16 v3, 0x41

    if-lt v2, v3, :cond_3

    const/16 v3, 0x46

    if-le v2, v3, :cond_2

    goto :goto_1

    :cond_2
    move v0, v1

    goto :goto_0

    :cond_3
    :goto_1
    if-eqz v0, :cond_4

    goto :goto_2

    .line 144
    :cond_4
    new-instance p0, Ljava/lang/NumberFormatException;

    .line 145
    invoke-static {v2}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object v0

    filled-new-array {v0}, [Ljava/lang/Object;

    move-result-object v0

    const-string v1, "Expected leading [0-9a-fA-F] character but was %#x"

    .line 146
    invoke-static {v1, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Ljava/lang/NumberFormatException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 147
    :cond_5
    :goto_2
    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okio/r;->a:Lcom/tencent/cloud/ai/network/okio/e;

    invoke-virtual {p0}, Lcom/tencent/cloud/ai/network/okio/e;->c()J

    move-result-wide v0

    return-wide v0
.end method

.method public c(J)Ljava/lang/String;
    .locals 15

    .line 1
    move-wide/from16 v6, p1

    .line 2
    .line 3
    const-wide/16 v0, 0x0

    .line 4
    .line 5
    cmp-long v0, v6, v0

    .line 6
    .line 7
    const/4 v8, 0x0

    .line 8
    if-ltz v0, :cond_3

    .line 9
    .line 10
    const-wide v9, 0x7fffffffffffffffL

    .line 11
    .line 12
    .line 13
    .line 14
    .line 15
    cmp-long v0, v6, v9

    .line 16
    .line 17
    const-wide/16 v11, 0x1

    .line 18
    .line 19
    if-nez v0, :cond_0

    .line 20
    .line 21
    move-wide v4, v9

    .line 22
    goto :goto_0

    .line 23
    :cond_0
    add-long v0, v6, v11

    .line 24
    .line 25
    move-wide v4, v0

    .line 26
    :goto_0
    const/16 v1, 0xa

    .line 27
    .line 28
    const-wide/16 v2, 0x0

    .line 29
    .line 30
    move-object v0, p0

    .line 31
    invoke-virtual/range {v0 .. v5}, Lcom/tencent/cloud/ai/network/okio/r;->a(BJJ)J

    .line 32
    .line 33
    .line 34
    move-result-wide v1

    .line 35
    const-wide/16 v13, -0x1

    .line 36
    .line 37
    cmp-long v3, v1, v13

    .line 38
    .line 39
    if-eqz v3, :cond_1

    .line 40
    .line 41
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okio/r;->a:Lcom/tencent/cloud/ai/network/okio/e;

    .line 42
    .line 43
    invoke-virtual {v0, v1, v2}, Lcom/tencent/cloud/ai/network/okio/e;->i(J)Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    return-object v0

    .line 48
    :cond_1
    cmp-long v1, v4, v9

    .line 49
    .line 50
    if-gez v1, :cond_2

    .line 51
    .line 52
    invoke-virtual {p0, v4, v5}, Lcom/tencent/cloud/ai/network/okio/r;->b(J)Z

    .line 53
    .line 54
    .line 55
    move-result v1

    .line 56
    if-eqz v1, :cond_2

    .line 57
    .line 58
    iget-object v1, p0, Lcom/tencent/cloud/ai/network/okio/r;->a:Lcom/tencent/cloud/ai/network/okio/e;

    .line 59
    .line 60
    sub-long v2, v4, v11

    .line 61
    .line 62
    invoke-virtual {v1, v2, v3}, Lcom/tencent/cloud/ai/network/okio/e;->h(J)B

    .line 63
    .line 64
    .line 65
    move-result v1

    .line 66
    const/16 v2, 0xd

    .line 67
    .line 68
    if-ne v1, v2, :cond_2

    .line 69
    .line 70
    add-long v1, v4, v11

    .line 71
    .line 72
    invoke-virtual {p0, v1, v2}, Lcom/tencent/cloud/ai/network/okio/r;->b(J)Z

    .line 73
    .line 74
    .line 75
    move-result v1

    .line 76
    if-eqz v1, :cond_2

    .line 77
    .line 78
    iget-object v1, p0, Lcom/tencent/cloud/ai/network/okio/r;->a:Lcom/tencent/cloud/ai/network/okio/e;

    .line 79
    .line 80
    invoke-virtual {v1, v4, v5}, Lcom/tencent/cloud/ai/network/okio/e;->h(J)B

    .line 81
    .line 82
    .line 83
    move-result v1

    .line 84
    const/16 v2, 0xa

    .line 85
    .line 86
    if-ne v1, v2, :cond_2

    .line 87
    .line 88
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okio/r;->a:Lcom/tencent/cloud/ai/network/okio/e;

    .line 89
    .line 90
    invoke-virtual {v0, v4, v5}, Lcom/tencent/cloud/ai/network/okio/e;->i(J)Ljava/lang/String;

    .line 91
    .line 92
    .line 93
    move-result-object v0

    .line 94
    return-object v0

    .line 95
    :cond_2
    new-instance v10, Lcom/tencent/cloud/ai/network/okio/e;

    .line 96
    .line 97
    invoke-direct {v10}, Lcom/tencent/cloud/ai/network/okio/e;-><init>()V

    .line 98
    .line 99
    .line 100
    iget-object v9, p0, Lcom/tencent/cloud/ai/network/okio/r;->a:Lcom/tencent/cloud/ai/network/okio/e;

    .line 101
    .line 102
    const-wide/16 v1, 0x20

    .line 103
    .line 104
    iget-wide v3, v9, Lcom/tencent/cloud/ai/network/okio/e;->b:J

    .line 105
    .line 106
    invoke-static {v1, v2, v3, v4}, Ljava/lang/Math;->min(JJ)J

    .line 107
    .line 108
    .line 109
    move-result-wide v13

    .line 110
    const-wide/16 v11, 0x0

    .line 111
    .line 112
    invoke-virtual/range {v9 .. v14}, Lcom/tencent/cloud/ai/network/okio/e;->a(Lcom/tencent/cloud/ai/network/okio/e;JJ)Lcom/tencent/cloud/ai/network/okio/e;

    .line 113
    .line 114
    .line 115
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okio/r;->a:Lcom/tencent/cloud/ai/network/okio/e;

    .line 116
    .line 117
    iget-wide v0, v0, Lcom/tencent/cloud/ai/network/okio/e;->b:J

    .line 118
    .line 119
    invoke-static {v0, v1, v6, v7}, Ljava/lang/Math;->min(JJ)J

    .line 120
    .line 121
    .line 122
    move-result-wide v0

    .line 123
    invoke-virtual {v10}, Lcom/tencent/cloud/ai/network/okio/e;->m()Lcom/tencent/cloud/ai/network/okio/ByteString;

    .line 124
    .line 125
    .line 126
    move-result-object v2

    .line 127
    invoke-virtual {v2}, Lcom/tencent/cloud/ai/network/okio/ByteString;->hex()Ljava/lang/String;

    .line 128
    .line 129
    .line 130
    move-result-object v2

    .line 131
    invoke-static {v0, v1, v2}, Ll/xg3;->a(JLjava/lang/Object;)V

    .line 132
    .line 133
    .line 134
    return-object v8

    .line 135
    :cond_3
    const-string v0, "limit < 0: "

    .line 136
    .line 137
    invoke-static {v0, v6, v7}, Ll/fcg0;->a(Ljava/lang/String;J)V

    .line 138
    .line 139
    .line 140
    return-object v8
.end method

.method public close()V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/tencent/cloud/ai/network/okio/r;->c:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    const/4 v0, 0x1

    .line 7
    iput-boolean v0, p0, Lcom/tencent/cloud/ai/network/okio/r;->c:Z

    .line 8
    .line 9
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okio/r;->b:Lcom/tencent/cloud/ai/network/okio/w;

    .line 10
    .line 11
    invoke-interface {v0}, Lcom/tencent/cloud/ai/network/okio/w;->close()V

    .line 12
    .line 13
    .line 14
    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okio/r;->a:Lcom/tencent/cloud/ai/network/okio/e;

    .line 15
    .line 16
    invoke-virtual {p0}, Lcom/tencent/cloud/ai/network/okio/e;->k()V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public d()Ljava/io/InputStream;
    .locals 1

    .line 60
    new-instance v0, Lcom/tencent/cloud/ai/network/okio/r$a;

    invoke-direct {v0, p0}, Lcom/tencent/cloud/ai/network/okio/r$a;-><init>(Lcom/tencent/cloud/ai/network/okio/r;)V

    return-object v0
.end method

.method public d(J)V
    .locals 5

    .line 1
    iget-boolean v0, p0, Lcom/tencent/cloud/ai/network/okio/r;->c:Z

    .line 2
    .line 3
    if-nez v0, :cond_3

    .line 4
    .line 5
    :goto_0
    const-wide/16 v0, 0x0

    .line 6
    .line 7
    cmp-long v2, p1, v0

    .line 8
    .line 9
    if-lez v2, :cond_2

    .line 10
    .line 11
    iget-object v2, p0, Lcom/tencent/cloud/ai/network/okio/r;->a:Lcom/tencent/cloud/ai/network/okio/e;

    .line 12
    .line 13
    iget-wide v3, v2, Lcom/tencent/cloud/ai/network/okio/e;->b:J

    .line 14
    .line 15
    cmp-long v0, v3, v0

    .line 16
    .line 17
    if-nez v0, :cond_1

    .line 18
    .line 19
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okio/r;->b:Lcom/tencent/cloud/ai/network/okio/w;

    .line 20
    .line 21
    const-wide/16 v3, 0x2000

    .line 22
    .line 23
    invoke-interface {v0, v2, v3, v4}, Lcom/tencent/cloud/ai/network/okio/w;->a(Lcom/tencent/cloud/ai/network/okio/e;J)J

    .line 24
    .line 25
    .line 26
    move-result-wide v0

    .line 27
    const-wide/16 v2, -0x1

    .line 28
    .line 29
    cmp-long v0, v0, v2

    .line 30
    .line 31
    if-eqz v0, :cond_0

    .line 32
    .line 33
    goto :goto_1

    .line 34
    :cond_0
    invoke-static {}, Ll/vg3;->a()V

    .line 35
    .line 36
    .line 37
    return-void

    .line 38
    :cond_1
    :goto_1
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okio/r;->a:Lcom/tencent/cloud/ai/network/okio/e;

    .line 39
    .line 40
    iget-wide v0, v0, Lcom/tencent/cloud/ai/network/okio/e;->b:J

    .line 41
    .line 42
    invoke-static {p1, p2, v0, v1}, Ljava/lang/Math;->min(JJ)J

    .line 43
    .line 44
    .line 45
    move-result-wide v0

    .line 46
    iget-object v2, p0, Lcom/tencent/cloud/ai/network/okio/r;->a:Lcom/tencent/cloud/ai/network/okio/e;

    .line 47
    .line 48
    invoke-virtual {v2, v0, v1}, Lcom/tencent/cloud/ai/network/okio/e;->d(J)V

    .line 49
    .line 50
    .line 51
    sub-long/2addr p1, v0

    .line 52
    goto :goto_0

    .line 53
    :cond_2
    return-void

    .line 54
    :cond_3
    const-string p0, "closed"

    .line 55
    .line 56
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 57
    .line 58
    .line 59
    return-void
.end method

.method public e()Ljava/lang/String;
    .locals 2

    .line 1
    const-wide v0, 0x7fffffffffffffffL

    .line 2
    .line 3
    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0, v1}, Lcom/tencent/cloud/ai/network/okio/r;->c(J)Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method

.method public f(J)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/tencent/cloud/ai/network/okio/r;->b(J)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    invoke-static {}, Ll/vg3;->a()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public g()Z
    .locals 4

    .line 1
    iget-boolean v0, p0, Lcom/tencent/cloud/ai/network/okio/r;->c:Z

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okio/r;->a:Lcom/tencent/cloud/ai/network/okio/e;

    .line 6
    .line 7
    invoke-virtual {v0}, Lcom/tencent/cloud/ai/network/okio/e;->g()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okio/r;->b:Lcom/tencent/cloud/ai/network/okio/w;

    .line 14
    .line 15
    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okio/r;->a:Lcom/tencent/cloud/ai/network/okio/e;

    .line 16
    .line 17
    const-wide/16 v1, 0x2000

    .line 18
    .line 19
    invoke-interface {v0, p0, v1, v2}, Lcom/tencent/cloud/ai/network/okio/w;->a(Lcom/tencent/cloud/ai/network/okio/e;J)J

    .line 20
    .line 21
    .line 22
    move-result-wide v0

    .line 23
    const-wide/16 v2, -0x1

    .line 24
    .line 25
    cmp-long p0, v0, v2

    .line 26
    .line 27
    if-nez p0, :cond_0

    .line 28
    .line 29
    const/4 p0, 0x1

    .line 30
    return p0

    .line 31
    :cond_0
    const/4 p0, 0x0

    .line 32
    return p0

    .line 33
    :cond_1
    const-string p0, "closed"

    .line 34
    .line 35
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    const/4 p0, 0x0

    .line 39
    return p0
.end method

.method public g(J)[B
    .locals 1

    .line 40
    invoke-virtual {p0, p1, p2}, Lcom/tencent/cloud/ai/network/okio/r;->b(J)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 41
    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okio/r;->a:Lcom/tencent/cloud/ai/network/okio/e;

    invoke-virtual {p0, p1, p2}, Lcom/tencent/cloud/ai/network/okio/e;->g(J)[B

    move-result-object p0

    return-object p0

    .line 42
    :cond_0
    invoke-static {}, Ll/vg3;->a()V

    const/4 p0, 0x0

    return-object p0
.end method

.method public h()[B
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okio/r;->a:Lcom/tencent/cloud/ai/network/okio/e;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/tencent/cloud/ai/network/okio/r;->b:Lcom/tencent/cloud/ai/network/okio/w;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Lcom/tencent/cloud/ai/network/okio/e;->a(Lcom/tencent/cloud/ai/network/okio/w;)J

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okio/r;->a:Lcom/tencent/cloud/ai/network/okio/e;

    .line 9
    .line 10
    invoke-virtual {p0}, Lcom/tencent/cloud/ai/network/okio/e;->h()[B

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    return-object p0
.end method

.method public isOpen()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/tencent/cloud/ai/network/okio/r;->c:Z

    .line 2
    .line 3
    xor-int/lit8 p0, p0, 0x1

    .line 4
    .line 5
    return p0
.end method

.method public j()S
    .locals 2

    .line 1
    const-wide/16 v0, 0x2

    .line 2
    .line 3
    invoke-virtual {p0, v0, v1}, Lcom/tencent/cloud/ai/network/okio/r;->f(J)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okio/r;->a:Lcom/tencent/cloud/ai/network/okio/e;

    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/tencent/cloud/ai/network/okio/e;->readShort()S

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    invoke-static {p0}, Lcom/tencent/cloud/ai/network/okio/y;->a(S)S

    .line 13
    .line 14
    .line 15
    move-result p0

    .line 16
    return p0
.end method

.method public read(Ljava/nio/ByteBuffer;)I
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okio/r;->a:Lcom/tencent/cloud/ai/network/okio/e;

    .line 2
    .line 3
    iget-wide v1, v0, Lcom/tencent/cloud/ai/network/okio/e;->b:J

    .line 4
    .line 5
    const-wide/16 v3, 0x0

    .line 6
    .line 7
    cmp-long v1, v1, v3

    .line 8
    .line 9
    if-nez v1, :cond_0

    .line 10
    .line 11
    iget-object v1, p0, Lcom/tencent/cloud/ai/network/okio/r;->b:Lcom/tencent/cloud/ai/network/okio/w;

    .line 12
    .line 13
    const-wide/16 v2, 0x2000

    .line 14
    .line 15
    invoke-interface {v1, v0, v2, v3}, Lcom/tencent/cloud/ai/network/okio/w;->a(Lcom/tencent/cloud/ai/network/okio/e;J)J

    .line 16
    .line 17
    .line 18
    move-result-wide v0

    .line 19
    const-wide/16 v2, -0x1

    .line 20
    .line 21
    cmp-long v0, v0, v2

    .line 22
    .line 23
    if-nez v0, :cond_0

    .line 24
    .line 25
    const/4 p0, -0x1

    .line 26
    return p0

    .line 27
    :cond_0
    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okio/r;->a:Lcom/tencent/cloud/ai/network/okio/e;

    .line 28
    .line 29
    invoke-virtual {p0, p1}, Lcom/tencent/cloud/ai/network/okio/e;->read(Ljava/nio/ByteBuffer;)I

    .line 30
    .line 31
    .line 32
    move-result p0

    .line 33
    return p0
.end method

.method public readByte()B
    .locals 2

    .line 1
    const-wide/16 v0, 0x1

    .line 2
    .line 3
    invoke-virtual {p0, v0, v1}, Lcom/tencent/cloud/ai/network/okio/r;->f(J)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okio/r;->a:Lcom/tencent/cloud/ai/network/okio/e;

    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/tencent/cloud/ai/network/okio/e;->readByte()B

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    return p0
.end method

.method public readFully([B)V
    .locals 7

    .line 1
    :try_start_0
    array-length v0, p1

    .line 2
    int-to-long v0, v0

    .line 3
    invoke-virtual {p0, v0, v1}, Lcom/tencent/cloud/ai/network/okio/r;->f(J)V
    :try_end_0
    .catch Ljava/io/EOFException; {:try_start_0 .. :try_end_0} :catch_0

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okio/r;->a:Lcom/tencent/cloud/ai/network/okio/e;

    .line 7
    .line 8
    invoke-virtual {p0, p1}, Lcom/tencent/cloud/ai/network/okio/e;->readFully([B)V

    .line 9
    .line 10
    .line 11
    return-void

    .line 12
    :catch_0
    move-exception v0

    .line 13
    const/4 v1, 0x0

    .line 14
    :goto_0
    iget-object v2, p0, Lcom/tencent/cloud/ai/network/okio/r;->a:Lcom/tencent/cloud/ai/network/okio/e;

    .line 15
    .line 16
    iget-wide v3, v2, Lcom/tencent/cloud/ai/network/okio/e;->b:J

    .line 17
    .line 18
    const-wide/16 v5, 0x0

    .line 19
    .line 20
    cmp-long v5, v3, v5

    .line 21
    .line 22
    if-lez v5, :cond_1

    .line 23
    .line 24
    long-to-int v3, v3

    .line 25
    invoke-virtual {v2, p1, v1, v3}, Lcom/tencent/cloud/ai/network/okio/e;->a([BII)I

    .line 26
    .line 27
    .line 28
    move-result v2

    .line 29
    const/4 v3, -0x1

    .line 30
    if-eq v2, v3, :cond_0

    .line 31
    .line 32
    add-int/2addr v1, v2

    .line 33
    goto :goto_0

    .line 34
    :cond_0
    invoke-static {}, Ll/aqg0;->a()V

    .line 35
    .line 36
    .line 37
    return-void

    .line 38
    :cond_1
    throw v0
.end method

.method public readInt()I
    .locals 2

    .line 1
    const-wide/16 v0, 0x4

    .line 2
    .line 3
    invoke-virtual {p0, v0, v1}, Lcom/tencent/cloud/ai/network/okio/r;->f(J)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okio/r;->a:Lcom/tencent/cloud/ai/network/okio/e;

    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/tencent/cloud/ai/network/okio/e;->readInt()I

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    return p0
.end method

.method public readLong()J
    .locals 2

    .line 1
    const-wide/16 v0, 0x8

    .line 2
    .line 3
    invoke-virtual {p0, v0, v1}, Lcom/tencent/cloud/ai/network/okio/r;->f(J)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okio/r;->a:Lcom/tencent/cloud/ai/network/okio/e;

    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/tencent/cloud/ai/network/okio/e;->readLong()J

    .line 9
    .line 10
    .line 11
    move-result-wide v0

    .line 12
    return-wide v0
.end method

.method public readShort()S
    .locals 2

    .line 1
    const-wide/16 v0, 0x2

    .line 2
    .line 3
    invoke-virtual {p0, v0, v1}, Lcom/tencent/cloud/ai/network/okio/r;->f(J)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okio/r;->a:Lcom/tencent/cloud/ai/network/okio/e;

    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/tencent/cloud/ai/network/okio/e;->readShort()S

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    return p0
.end method

.method public timeout()Lcom/tencent/cloud/ai/network/okio/x;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okio/r;->b:Lcom/tencent/cloud/ai/network/okio/w;

    .line 2
    .line 3
    invoke-interface {p0}, Lcom/tencent/cloud/ai/network/okio/w;->timeout()Lcom/tencent/cloud/ai/network/okio/x;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "buffer("

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okio/r;->b:Lcom/tencent/cloud/ai/network/okio/w;

    .line 9
    .line 10
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string p0, ")"

    .line 14
    .line 15
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    return-object p0
.end method

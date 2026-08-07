.class public final Lcom/tencent/cloud/ai/network/okio/l;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/tencent/cloud/ai/network/okio/w;


# instance fields
.field public final a:Lcom/tencent/cloud/ai/network/okio/g;

.field public final b:Ljava/util/zip/Inflater;

.field public c:I

.field public d:Z


# direct methods
.method public constructor <init>(Lcom/tencent/cloud/ai/network/okio/g;Ljava/util/zip/Inflater;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    if-eqz p2, :cond_0

    .line 5
    .line 6
    iput-object p1, p0, Lcom/tencent/cloud/ai/network/okio/l;->a:Lcom/tencent/cloud/ai/network/okio/g;

    .line 7
    .line 8
    iput-object p2, p0, Lcom/tencent/cloud/ai/network/okio/l;->b:Ljava/util/zip/Inflater;

    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    const-string p0, "inflater == null"

    .line 12
    .line 13
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    const/4 p0, 0x0

    .line 17
    throw p0
.end method


# virtual methods
.method public a(Lcom/tencent/cloud/ai/network/okio/e;J)J
    .locals 8

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    cmp-long v2, p2, v0

    .line 4
    .line 5
    if-ltz v2, :cond_a

    .line 6
    .line 7
    iget-boolean v3, p0, Lcom/tencent/cloud/ai/network/okio/l;->d:Z

    .line 8
    .line 9
    if-nez v3, :cond_9

    .line 10
    .line 11
    if-nez v2, :cond_0

    .line 12
    .line 13
    return-wide v0

    .line 14
    :cond_0
    :goto_0
    iget-object v2, p0, Lcom/tencent/cloud/ai/network/okio/l;->b:Ljava/util/zip/Inflater;

    .line 15
    .line 16
    invoke-virtual {v2}, Ljava/util/zip/Inflater;->needsInput()Z

    .line 17
    .line 18
    .line 19
    move-result v2

    .line 20
    const/4 v3, 0x1

    .line 21
    const/4 v4, 0x0

    .line 22
    if-nez v2, :cond_1

    .line 23
    .line 24
    goto :goto_1

    .line 25
    :cond_1
    invoke-virtual {p0}, Lcom/tencent/cloud/ai/network/okio/l;->k()V

    .line 26
    .line 27
    .line 28
    iget-object v2, p0, Lcom/tencent/cloud/ai/network/okio/l;->b:Ljava/util/zip/Inflater;

    .line 29
    .line 30
    invoke-virtual {v2}, Ljava/util/zip/Inflater;->getRemaining()I

    .line 31
    .line 32
    .line 33
    move-result v2

    .line 34
    if-nez v2, :cond_8

    .line 35
    .line 36
    iget-object v2, p0, Lcom/tencent/cloud/ai/network/okio/l;->a:Lcom/tencent/cloud/ai/network/okio/g;

    .line 37
    .line 38
    invoke-interface {v2}, Lcom/tencent/cloud/ai/network/okio/g;->g()Z

    .line 39
    .line 40
    .line 41
    move-result v2

    .line 42
    if-eqz v2, :cond_2

    .line 43
    .line 44
    move v4, v3

    .line 45
    goto :goto_1

    .line 46
    :cond_2
    iget-object v2, p0, Lcom/tencent/cloud/ai/network/okio/l;->a:Lcom/tencent/cloud/ai/network/okio/g;

    .line 47
    .line 48
    invoke-interface {v2}, Lcom/tencent/cloud/ai/network/okio/g;->a()Lcom/tencent/cloud/ai/network/okio/e;

    .line 49
    .line 50
    .line 51
    move-result-object v2

    .line 52
    iget-object v2, v2, Lcom/tencent/cloud/ai/network/okio/e;->a:Lcom/tencent/cloud/ai/network/okio/s;

    .line 53
    .line 54
    iget v5, v2, Lcom/tencent/cloud/ai/network/okio/s;->c:I

    .line 55
    .line 56
    iget v6, v2, Lcom/tencent/cloud/ai/network/okio/s;->b:I

    .line 57
    .line 58
    sub-int/2addr v5, v6

    .line 59
    iput v5, p0, Lcom/tencent/cloud/ai/network/okio/l;->c:I

    .line 60
    .line 61
    iget-object v7, p0, Lcom/tencent/cloud/ai/network/okio/l;->b:Ljava/util/zip/Inflater;

    .line 62
    .line 63
    iget-object v2, v2, Lcom/tencent/cloud/ai/network/okio/s;->a:[B

    .line 64
    .line 65
    invoke-virtual {v7, v2, v6, v5}, Ljava/util/zip/Inflater;->setInput([BII)V

    .line 66
    .line 67
    .line 68
    :goto_1
    :try_start_0
    invoke-virtual {p1, v3}, Lcom/tencent/cloud/ai/network/okio/e;->d(I)Lcom/tencent/cloud/ai/network/okio/s;

    .line 69
    .line 70
    .line 71
    move-result-object v2

    .line 72
    iget v3, v2, Lcom/tencent/cloud/ai/network/okio/s;->c:I

    .line 73
    .line 74
    rsub-int v3, v3, 0x2000

    .line 75
    .line 76
    int-to-long v5, v3

    .line 77
    invoke-static {p2, p3, v5, v6}, Ljava/lang/Math;->min(JJ)J

    .line 78
    .line 79
    .line 80
    move-result-wide v5

    .line 81
    long-to-int v3, v5

    .line 82
    iget-object v5, p0, Lcom/tencent/cloud/ai/network/okio/l;->b:Ljava/util/zip/Inflater;

    .line 83
    .line 84
    iget-object v6, v2, Lcom/tencent/cloud/ai/network/okio/s;->a:[B

    .line 85
    .line 86
    iget v7, v2, Lcom/tencent/cloud/ai/network/okio/s;->c:I

    .line 87
    .line 88
    invoke-virtual {v5, v6, v7, v3}, Ljava/util/zip/Inflater;->inflate([BII)I

    .line 89
    .line 90
    .line 91
    move-result v3

    .line 92
    if-lez v3, :cond_3

    .line 93
    .line 94
    iget p0, v2, Lcom/tencent/cloud/ai/network/okio/s;->c:I

    .line 95
    .line 96
    add-int/2addr p0, v3

    .line 97
    iput p0, v2, Lcom/tencent/cloud/ai/network/okio/s;->c:I

    .line 98
    .line 99
    iget-wide p2, p1, Lcom/tencent/cloud/ai/network/okio/e;->b:J

    .line 100
    .line 101
    int-to-long v0, v3

    .line 102
    add-long/2addr p2, v0

    .line 103
    iput-wide p2, p1, Lcom/tencent/cloud/ai/network/okio/e;->b:J

    .line 104
    .line 105
    return-wide v0

    .line 106
    :cond_3
    iget-object v3, p0, Lcom/tencent/cloud/ai/network/okio/l;->b:Ljava/util/zip/Inflater;

    .line 107
    .line 108
    invoke-virtual {v3}, Ljava/util/zip/Inflater;->finished()Z

    .line 109
    .line 110
    .line 111
    move-result v3

    .line 112
    if-nez v3, :cond_6

    .line 113
    .line 114
    iget-object v3, p0, Lcom/tencent/cloud/ai/network/okio/l;->b:Ljava/util/zip/Inflater;

    .line 115
    .line 116
    invoke-virtual {v3}, Ljava/util/zip/Inflater;->needsDictionary()Z

    .line 117
    .line 118
    .line 119
    move-result v3

    .line 120
    if-eqz v3, :cond_4

    .line 121
    .line 122
    goto :goto_2

    .line 123
    :cond_4
    if-nez v4, :cond_5

    .line 124
    .line 125
    goto :goto_0

    .line 126
    :cond_5
    new-instance p0, Ljava/io/EOFException;

    .line 127
    .line 128
    const-string p1, "source exhausted prematurely"

    .line 129
    .line 130
    invoke-direct {p0, p1}, Ljava/io/EOFException;-><init>(Ljava/lang/String;)V

    .line 131
    .line 132
    .line 133
    throw p0

    .line 134
    :cond_6
    :goto_2
    invoke-virtual {p0}, Lcom/tencent/cloud/ai/network/okio/l;->k()V

    .line 135
    .line 136
    .line 137
    iget p0, v2, Lcom/tencent/cloud/ai/network/okio/s;->b:I

    .line 138
    .line 139
    iget p2, v2, Lcom/tencent/cloud/ai/network/okio/s;->c:I

    .line 140
    .line 141
    if-ne p0, p2, :cond_7

    .line 142
    .line 143
    invoke-virtual {v2}, Lcom/tencent/cloud/ai/network/okio/s;->a()Lcom/tencent/cloud/ai/network/okio/s;

    .line 144
    .line 145
    .line 146
    move-result-object p0

    .line 147
    iput-object p0, p1, Lcom/tencent/cloud/ai/network/okio/e;->a:Lcom/tencent/cloud/ai/network/okio/s;

    .line 148
    .line 149
    invoke-static {v2}, Lcom/tencent/cloud/ai/network/okio/t;->a(Lcom/tencent/cloud/ai/network/okio/s;)V
    :try_end_0
    .catch Ljava/util/zip/DataFormatException; {:try_start_0 .. :try_end_0} :catch_0

    .line 150
    .line 151
    .line 152
    :cond_7
    const-wide/16 p0, -0x1

    .line 153
    .line 154
    return-wide p0

    .line 155
    :catch_0
    move-exception p0

    .line 156
    new-instance p1, Ljava/io/IOException;

    .line 157
    .line 158
    invoke-direct {p1, p0}, Ljava/io/IOException;-><init>(Ljava/lang/Throwable;)V

    .line 159
    .line 160
    .line 161
    throw p1

    .line 162
    :cond_8
    const-string p0, "?"

    .line 163
    .line 164
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 165
    .line 166
    .line 167
    return-wide v0

    .line 168
    :cond_9
    const-string p0, "closed"

    .line 169
    .line 170
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 171
    .line 172
    .line 173
    return-wide v0

    .line 174
    :cond_a
    const-string p0, "byteCount < 0: "

    .line 175
    .line 176
    invoke-static {p0, p2, p3}, Ll/fcg0;->a(Ljava/lang/String;J)V

    .line 177
    .line 178
    .line 179
    return-wide v0
.end method

.method public close()V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/tencent/cloud/ai/network/okio/l;->d:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okio/l;->b:Ljava/util/zip/Inflater;

    .line 7
    .line 8
    invoke-virtual {v0}, Ljava/util/zip/Inflater;->end()V

    .line 9
    .line 10
    .line 11
    const/4 v0, 0x1

    .line 12
    iput-boolean v0, p0, Lcom/tencent/cloud/ai/network/okio/l;->d:Z

    .line 13
    .line 14
    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okio/l;->a:Lcom/tencent/cloud/ai/network/okio/g;

    .line 15
    .line 16
    invoke-interface {p0}, Lcom/tencent/cloud/ai/network/okio/w;->close()V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public final k()V
    .locals 2

    .line 1
    iget v0, p0, Lcom/tencent/cloud/ai/network/okio/l;->c:I

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iget-object v1, p0, Lcom/tencent/cloud/ai/network/okio/l;->b:Ljava/util/zip/Inflater;

    .line 7
    .line 8
    invoke-virtual {v1}, Ljava/util/zip/Inflater;->getRemaining()I

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    sub-int/2addr v0, v1

    .line 13
    iget v1, p0, Lcom/tencent/cloud/ai/network/okio/l;->c:I

    .line 14
    .line 15
    sub-int/2addr v1, v0

    .line 16
    iput v1, p0, Lcom/tencent/cloud/ai/network/okio/l;->c:I

    .line 17
    .line 18
    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okio/l;->a:Lcom/tencent/cloud/ai/network/okio/g;

    .line 19
    .line 20
    int-to-long v0, v0

    .line 21
    invoke-interface {p0, v0, v1}, Lcom/tencent/cloud/ai/network/okio/g;->d(J)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public timeout()Lcom/tencent/cloud/ai/network/okio/x;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okio/l;->a:Lcom/tencent/cloud/ai/network/okio/g;

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

.class public final Lcom/tencent/cloud/ai/network/okio/e$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/io/Closeable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/tencent/cloud/ai/network/okio/e;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "b"
.end annotation


# instance fields
.field public a:Lcom/tencent/cloud/ai/network/okio/e;

.field public b:Z

.field public c:Lcom/tencent/cloud/ai/network/okio/s;

.field public d:J

.field public e:[B

.field public f:I

.field public g:I


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-wide/16 v0, -0x1

    .line 5
    .line 6
    iput-wide v0, p0, Lcom/tencent/cloud/ai/network/okio/e$b;->d:J

    .line 7
    .line 8
    const/4 v0, -0x1

    .line 9
    iput v0, p0, Lcom/tencent/cloud/ai/network/okio/e$b;->f:I

    .line 10
    .line 11
    iput v0, p0, Lcom/tencent/cloud/ai/network/okio/e$b;->g:I

    .line 12
    .line 13
    return-void
.end method


# virtual methods
.method public close()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okio/e$b;->a:Lcom/tencent/cloud/ai/network/okio/e;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    iput-object v0, p0, Lcom/tencent/cloud/ai/network/okio/e$b;->a:Lcom/tencent/cloud/ai/network/okio/e;

    .line 7
    .line 8
    iput-object v0, p0, Lcom/tencent/cloud/ai/network/okio/e$b;->c:Lcom/tencent/cloud/ai/network/okio/s;

    .line 9
    .line 10
    const-wide/16 v1, -0x1

    .line 11
    .line 12
    iput-wide v1, p0, Lcom/tencent/cloud/ai/network/okio/e$b;->d:J

    .line 13
    .line 14
    iput-object v0, p0, Lcom/tencent/cloud/ai/network/okio/e$b;->e:[B

    .line 15
    .line 16
    const/4 v0, -0x1

    .line 17
    iput v0, p0, Lcom/tencent/cloud/ai/network/okio/e$b;->f:I

    .line 18
    .line 19
    iput v0, p0, Lcom/tencent/cloud/ai/network/okio/e$b;->g:I

    .line 20
    .line 21
    return-void

    .line 22
    :cond_0
    const-string p0, "not attached to a buffer"

    .line 23
    .line 24
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public h(J)I
    .locals 12

    .line 1
    const-wide/16 v0, -0x1

    .line 2
    .line 3
    cmp-long v0, p1, v0

    .line 4
    .line 5
    if-ltz v0, :cond_9

    .line 6
    .line 7
    iget-object v1, p0, Lcom/tencent/cloud/ai/network/okio/e$b;->a:Lcom/tencent/cloud/ai/network/okio/e;

    .line 8
    .line 9
    iget-wide v2, v1, Lcom/tencent/cloud/ai/network/okio/e;->b:J

    .line 10
    .line 11
    cmp-long v4, p1, v2

    .line 12
    .line 13
    if-gtz v4, :cond_9

    .line 14
    .line 15
    if-eqz v0, :cond_8

    .line 16
    .line 17
    if-nez v4, :cond_0

    .line 18
    .line 19
    goto/16 :goto_3

    .line 20
    .line 21
    :cond_0
    iget-object v0, v1, Lcom/tencent/cloud/ai/network/okio/e;->a:Lcom/tencent/cloud/ai/network/okio/s;

    .line 22
    .line 23
    iget-object v1, p0, Lcom/tencent/cloud/ai/network/okio/e$b;->c:Lcom/tencent/cloud/ai/network/okio/s;

    .line 24
    .line 25
    const-wide/16 v4, 0x0

    .line 26
    .line 27
    if-eqz v1, :cond_2

    .line 28
    .line 29
    iget-wide v6, p0, Lcom/tencent/cloud/ai/network/okio/e$b;->d:J

    .line 30
    .line 31
    iget v8, p0, Lcom/tencent/cloud/ai/network/okio/e$b;->f:I

    .line 32
    .line 33
    iget v9, v1, Lcom/tencent/cloud/ai/network/okio/s;->b:I

    .line 34
    .line 35
    sub-int/2addr v8, v9

    .line 36
    int-to-long v8, v8

    .line 37
    sub-long/2addr v6, v8

    .line 38
    cmp-long v8, v6, p1

    .line 39
    .line 40
    if-lez v8, :cond_1

    .line 41
    .line 42
    move-object v2, v1

    .line 43
    move-object v1, v0

    .line 44
    move-object v0, v2

    .line 45
    move-wide v2, v6

    .line 46
    goto :goto_0

    .line 47
    :cond_1
    move-wide v4, v6

    .line 48
    goto :goto_0

    .line 49
    :cond_2
    move-object v1, v0

    .line 50
    :goto_0
    sub-long v6, v2, p1

    .line 51
    .line 52
    sub-long v8, p1, v4

    .line 53
    .line 54
    cmp-long v6, v6, v8

    .line 55
    .line 56
    if-lez v6, :cond_3

    .line 57
    .line 58
    :goto_1
    iget v0, v1, Lcom/tencent/cloud/ai/network/okio/s;->c:I

    .line 59
    .line 60
    iget v2, v1, Lcom/tencent/cloud/ai/network/okio/s;->b:I

    .line 61
    .line 62
    sub-int/2addr v0, v2

    .line 63
    int-to-long v2, v0

    .line 64
    add-long/2addr v2, v4

    .line 65
    cmp-long v0, p1, v2

    .line 66
    .line 67
    if-ltz v0, :cond_5

    .line 68
    .line 69
    iget-object v1, v1, Lcom/tencent/cloud/ai/network/okio/s;->f:Lcom/tencent/cloud/ai/network/okio/s;

    .line 70
    .line 71
    move-wide v4, v2

    .line 72
    goto :goto_1

    .line 73
    :cond_3
    :goto_2
    cmp-long v1, v2, p1

    .line 74
    .line 75
    if-lez v1, :cond_4

    .line 76
    .line 77
    iget-object v0, v0, Lcom/tencent/cloud/ai/network/okio/s;->g:Lcom/tencent/cloud/ai/network/okio/s;

    .line 78
    .line 79
    iget v1, v0, Lcom/tencent/cloud/ai/network/okio/s;->c:I

    .line 80
    .line 81
    iget v4, v0, Lcom/tencent/cloud/ai/network/okio/s;->b:I

    .line 82
    .line 83
    sub-int/2addr v1, v4

    .line 84
    int-to-long v4, v1

    .line 85
    sub-long/2addr v2, v4

    .line 86
    goto :goto_2

    .line 87
    :cond_4
    move-object v1, v0

    .line 88
    move-wide v4, v2

    .line 89
    :cond_5
    iget-boolean v0, p0, Lcom/tencent/cloud/ai/network/okio/e$b;->b:Z

    .line 90
    .line 91
    if-eqz v0, :cond_7

    .line 92
    .line 93
    iget-boolean v0, v1, Lcom/tencent/cloud/ai/network/okio/s;->d:Z

    .line 94
    .line 95
    if-eqz v0, :cond_7

    .line 96
    .line 97
    new-instance v6, Lcom/tencent/cloud/ai/network/okio/s;

    .line 98
    .line 99
    iget-object v0, v1, Lcom/tencent/cloud/ai/network/okio/s;->a:[B

    .line 100
    .line 101
    invoke-virtual {v0}, [B->clone()Ljava/lang/Object;

    .line 102
    .line 103
    .line 104
    move-result-object v0

    .line 105
    move-object v7, v0

    .line 106
    check-cast v7, [B

    .line 107
    .line 108
    iget v8, v1, Lcom/tencent/cloud/ai/network/okio/s;->b:I

    .line 109
    .line 110
    iget v9, v1, Lcom/tencent/cloud/ai/network/okio/s;->c:I

    .line 111
    .line 112
    const/4 v10, 0x0

    .line 113
    const/4 v11, 0x1

    .line 114
    invoke-direct/range {v6 .. v11}, Lcom/tencent/cloud/ai/network/okio/s;-><init>([BIIZZ)V

    .line 115
    .line 116
    .line 117
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okio/e$b;->a:Lcom/tencent/cloud/ai/network/okio/e;

    .line 118
    .line 119
    iget-object v2, v0, Lcom/tencent/cloud/ai/network/okio/e;->a:Lcom/tencent/cloud/ai/network/okio/s;

    .line 120
    .line 121
    if-ne v2, v1, :cond_6

    .line 122
    .line 123
    iput-object v6, v0, Lcom/tencent/cloud/ai/network/okio/e;->a:Lcom/tencent/cloud/ai/network/okio/s;

    .line 124
    .line 125
    :cond_6
    invoke-virtual {v1, v6}, Lcom/tencent/cloud/ai/network/okio/s;->a(Lcom/tencent/cloud/ai/network/okio/s;)Lcom/tencent/cloud/ai/network/okio/s;

    .line 126
    .line 127
    .line 128
    move-result-object v1

    .line 129
    iget-object v0, v1, Lcom/tencent/cloud/ai/network/okio/s;->g:Lcom/tencent/cloud/ai/network/okio/s;

    .line 130
    .line 131
    invoke-virtual {v0}, Lcom/tencent/cloud/ai/network/okio/s;->a()Lcom/tencent/cloud/ai/network/okio/s;

    .line 132
    .line 133
    .line 134
    :cond_7
    iput-object v1, p0, Lcom/tencent/cloud/ai/network/okio/e$b;->c:Lcom/tencent/cloud/ai/network/okio/s;

    .line 135
    .line 136
    iput-wide p1, p0, Lcom/tencent/cloud/ai/network/okio/e$b;->d:J

    .line 137
    .line 138
    iget-object v0, v1, Lcom/tencent/cloud/ai/network/okio/s;->a:[B

    .line 139
    .line 140
    iput-object v0, p0, Lcom/tencent/cloud/ai/network/okio/e$b;->e:[B

    .line 141
    .line 142
    iget v0, v1, Lcom/tencent/cloud/ai/network/okio/s;->b:I

    .line 143
    .line 144
    sub-long/2addr p1, v4

    .line 145
    long-to-int p1, p1

    .line 146
    add-int/2addr v0, p1

    .line 147
    iput v0, p0, Lcom/tencent/cloud/ai/network/okio/e$b;->f:I

    .line 148
    .line 149
    iget p1, v1, Lcom/tencent/cloud/ai/network/okio/s;->c:I

    .line 150
    .line 151
    iput p1, p0, Lcom/tencent/cloud/ai/network/okio/e$b;->g:I

    .line 152
    .line 153
    sub-int/2addr p1, v0

    .line 154
    return p1

    .line 155
    :cond_8
    :goto_3
    const/4 v0, 0x0

    .line 156
    iput-object v0, p0, Lcom/tencent/cloud/ai/network/okio/e$b;->c:Lcom/tencent/cloud/ai/network/okio/s;

    .line 157
    .line 158
    iput-wide p1, p0, Lcom/tencent/cloud/ai/network/okio/e$b;->d:J

    .line 159
    .line 160
    iput-object v0, p0, Lcom/tencent/cloud/ai/network/okio/e$b;->e:[B

    .line 161
    .line 162
    const/4 p1, -0x1

    .line 163
    iput p1, p0, Lcom/tencent/cloud/ai/network/okio/e$b;->f:I

    .line 164
    .line 165
    iput p1, p0, Lcom/tencent/cloud/ai/network/okio/e$b;->g:I

    .line 166
    .line 167
    return p1

    .line 168
    :cond_9
    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 169
    .line 170
    .line 171
    move-result-object p1

    .line 172
    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okio/e$b;->a:Lcom/tencent/cloud/ai/network/okio/e;

    .line 173
    .line 174
    iget-wide v0, p0, Lcom/tencent/cloud/ai/network/okio/e;->b:J

    .line 175
    .line 176
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 177
    .line 178
    .line 179
    move-result-object p0

    .line 180
    filled-new-array {p1, p0}, [Ljava/lang/Object;

    .line 181
    .line 182
    .line 183
    move-result-object p0

    .line 184
    const-string p1, "offset=%s > size=%s"

    .line 185
    .line 186
    invoke-static {p1, p0}, Ll/zg3;->a(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 187
    .line 188
    .line 189
    const/4 p0, 0x0

    .line 190
    return p0
.end method

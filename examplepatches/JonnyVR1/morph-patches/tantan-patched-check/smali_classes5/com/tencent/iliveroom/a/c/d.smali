.class public Lcom/tencent/iliveroom/a/c/d;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private a:I

.field private b:J

.field private c:J

.field private d:J

.field private e:J

.field private f:J

.field private g:J

.field private h:J


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/16 v0, 0x7d0

    .line 5
    .line 6
    iput v0, p0, Lcom/tencent/iliveroom/a/c/d;->a:I

    .line 7
    .line 8
    const-wide/16 v0, 0x0

    .line 9
    .line 10
    iput-wide v0, p0, Lcom/tencent/iliveroom/a/c/d;->e:J

    .line 11
    .line 12
    iput-wide v0, p0, Lcom/tencent/iliveroom/a/c/d;->f:J

    .line 13
    .line 14
    iput-wide v0, p0, Lcom/tencent/iliveroom/a/c/d;->h:J

    .line 15
    .line 16
    return-void
.end method


# virtual methods
.method public a()V
    .locals 8

    .line 1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    iget-wide v2, p0, Lcom/tencent/iliveroom/a/c/d;->e:J

    .line 6
    .line 7
    const-wide/16 v4, 0x0

    .line 8
    .line 9
    cmp-long v6, v2, v4

    .line 10
    .line 11
    if-eqz v6, :cond_5

    .line 12
    .line 13
    sub-long v2, v0, v2

    .line 14
    .line 15
    const-wide/16 v6, 0x96

    .line 16
    .line 17
    cmp-long v6, v2, v6

    .line 18
    .line 19
    if-lez v6, :cond_0

    .line 20
    .line 21
    iget-wide v6, p0, Lcom/tencent/iliveroom/a/c/d;->d:J

    .line 22
    .line 23
    cmp-long v6, v6, v2

    .line 24
    .line 25
    if-gez v6, :cond_0

    .line 26
    .line 27
    iput-wide v2, p0, Lcom/tencent/iliveroom/a/c/d;->d:J

    .line 28
    .line 29
    :cond_0
    const-wide/16 v6, 0x1e

    .line 30
    .line 31
    cmp-long v6, v2, v6

    .line 32
    .line 33
    if-gez v6, :cond_2

    .line 34
    .line 35
    iget-wide v6, p0, Lcom/tencent/iliveroom/a/c/d;->c:J

    .line 36
    .line 37
    cmp-long v6, v6, v4

    .line 38
    .line 39
    if-nez v6, :cond_1

    .line 40
    .line 41
    iput-wide v2, p0, Lcom/tencent/iliveroom/a/c/d;->c:J

    .line 42
    .line 43
    :cond_1
    iget-wide v6, p0, Lcom/tencent/iliveroom/a/c/d;->c:J

    .line 44
    .line 45
    cmp-long v6, v6, v2

    .line 46
    .line 47
    if-lez v6, :cond_2

    .line 48
    .line 49
    iput-wide v2, p0, Lcom/tencent/iliveroom/a/c/d;->c:J

    .line 50
    .line 51
    :cond_2
    iget-wide v2, p0, Lcom/tencent/iliveroom/a/c/d;->b:J

    .line 52
    .line 53
    sub-long/2addr v0, v2

    .line 54
    iget v2, p0, Lcom/tencent/iliveroom/a/c/d;->a:I

    .line 55
    .line 56
    int-to-long v2, v2

    .line 57
    cmp-long v0, v0, v2

    .line 58
    .line 59
    if-lez v0, :cond_5

    .line 60
    .line 61
    iget-wide v0, p0, Lcom/tencent/iliveroom/a/c/d;->d:J

    .line 62
    .line 63
    cmp-long v0, v0, v4

    .line 64
    .line 65
    const-string v1, "TRTCAdapter-VideoPath"

    .line 66
    .line 67
    if-eqz v0, :cond_3

    .line 68
    .line 69
    new-instance v0, Ljava/lang/StringBuilder;

    .line 70
    .line 71
    const-string v2, "send custom video too slow "

    .line 72
    .line 73
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 74
    .line 75
    .line 76
    iget-wide v2, p0, Lcom/tencent/iliveroom/a/c/d;->d:J

    .line 77
    .line 78
    invoke-virtual {v0, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 79
    .line 80
    .line 81
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 82
    .line 83
    .line 84
    move-result-object v0

    .line 85
    invoke-static {v1, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 86
    .line 87
    .line 88
    :cond_3
    iget-wide v2, p0, Lcom/tencent/iliveroom/a/c/d;->c:J

    .line 89
    .line 90
    cmp-long v0, v2, v4

    .line 91
    .line 92
    if-eqz v0, :cond_4

    .line 93
    .line 94
    new-instance v0, Ljava/lang/StringBuilder;

    .line 95
    .line 96
    const-string v2, "send custom video too fast "

    .line 97
    .line 98
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 99
    .line 100
    .line 101
    iget-wide v2, p0, Lcom/tencent/iliveroom/a/c/d;->c:J

    .line 102
    .line 103
    invoke-virtual {v0, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 104
    .line 105
    .line 106
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 107
    .line 108
    .line 109
    move-result-object v0

    .line 110
    invoke-static {v1, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 111
    .line 112
    .line 113
    :cond_4
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 114
    .line 115
    .line 116
    move-result-wide v0

    .line 117
    iput-wide v0, p0, Lcom/tencent/iliveroom/a/c/d;->b:J

    .line 118
    .line 119
    iput-wide v4, p0, Lcom/tencent/iliveroom/a/c/d;->d:J

    .line 120
    .line 121
    iput-wide v4, p0, Lcom/tencent/iliveroom/a/c/d;->c:J

    .line 122
    .line 123
    :cond_5
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 124
    .line 125
    .line 126
    move-result-wide v0

    .line 127
    iput-wide v0, p0, Lcom/tencent/iliveroom/a/c/d;->e:J

    .line 128
    .line 129
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 130
    .line 131
    .line 132
    move-result-wide v0

    .line 133
    iget-wide v2, p0, Lcom/tencent/iliveroom/a/c/d;->g:J

    .line 134
    .line 135
    sub-long/2addr v0, v2

    .line 136
    iget-wide v2, p0, Lcom/tencent/iliveroom/a/c/d;->f:J

    .line 137
    .line 138
    const-wide/16 v4, 0x1

    .line 139
    .line 140
    add-long/2addr v2, v4

    .line 141
    iput-wide v2, p0, Lcom/tencent/iliveroom/a/c/d;->f:J

    .line 142
    .line 143
    const-wide/16 v4, 0x3e8

    .line 144
    .line 145
    cmp-long v4, v0, v4

    .line 146
    .line 147
    if-ltz v4, :cond_6

    .line 148
    .line 149
    iget-wide v4, p0, Lcom/tencent/iliveroom/a/c/d;->h:J

    .line 150
    .line 151
    sub-long/2addr v2, v4

    .line 152
    long-to-double v2, v2

    .line 153
    const-wide v4, 0x408f400000000000L    # 1000.0

    .line 154
    .line 155
    .line 156
    .line 157
    .line 158
    mul-double/2addr v2, v4

    .line 159
    long-to-double v4, v0

    .line 160
    div-double/2addr v2, v4

    .line 161
    const/4 v4, 0x2

    .line 162
    invoke-static {v2, v3}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 163
    .line 164
    .line 165
    move-result-object v2

    .line 166
    const-string v3, "18446744073709551615"

    .line 167
    .line 168
    const/16 v5, 0x3e9

    .line 169
    .line 170
    invoke-static {v3, v5, v4, v2}, Lcom/tencent/liteav/basic/module/TXCStatus;->a(Ljava/lang/String;IILjava/lang/Object;)Z

    .line 171
    .line 172
    .line 173
    iget-wide v2, p0, Lcom/tencent/iliveroom/a/c/d;->f:J

    .line 174
    .line 175
    iput-wide v2, p0, Lcom/tencent/iliveroom/a/c/d;->h:J

    .line 176
    .line 177
    iget-wide v2, p0, Lcom/tencent/iliveroom/a/c/d;->g:J

    .line 178
    .line 179
    add-long/2addr v2, v0

    .line 180
    iput-wide v2, p0, Lcom/tencent/iliveroom/a/c/d;->g:J

    .line 181
    .line 182
    :cond_6
    return-void
.end method

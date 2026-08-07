.class public final Ll/ppd0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/zrf;


# annotations
.annotation runtime Ljava/lang/Deprecated;
.end annotation


# instance fields
.field public final a:Ll/aqd0;

.field public final b:Ll/ig60;

.field public final c:Ll/ig60;

.field public final d:I

.field public final e:Ljava/lang/Object;

.field public final f:Ll/ypd0;

.field public g:Ll/bsf;

.field public h:Z

.field public volatile i:J

.field public volatile j:I

.field public k:Z
    .annotation build Landroidx/annotation/GuardedBy;
        value = "lock"
    .end annotation
.end field

.field public l:J
    .annotation build Landroidx/annotation/GuardedBy;
        value = "lock"
    .end annotation
.end field

.field public m:J
    .annotation build Landroidx/annotation/GuardedBy;
        value = "lock"
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ll/zpd0;I)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput p2, p0, Ll/ppd0;->d:I

    .line 5
    .line 6
    new-instance p2, Ll/yrd;

    .line 7
    .line 8
    invoke-direct {p2}, Ll/yrd;-><init>()V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p2, p1}, Ll/yrd;->a(Ll/zpd0;)Ll/aqd0;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    invoke-static {p1}, Ll/w11;->e(Ljava/lang/Object;)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    check-cast p1, Ll/aqd0;

    .line 20
    .line 21
    iput-object p1, p0, Ll/ppd0;->a:Ll/aqd0;

    .line 22
    .line 23
    new-instance p1, Ll/ig60;

    .line 24
    .line 25
    const p2, 0xffe3

    .line 26
    .line 27
    .line 28
    invoke-direct {p1, p2}, Ll/ig60;-><init>(I)V

    .line 29
    .line 30
    .line 31
    iput-object p1, p0, Ll/ppd0;->b:Ll/ig60;

    .line 32
    .line 33
    new-instance p1, Ll/ig60;

    .line 34
    .line 35
    invoke-direct {p1}, Ll/ig60;-><init>()V

    .line 36
    .line 37
    .line 38
    iput-object p1, p0, Ll/ppd0;->c:Ll/ig60;

    .line 39
    .line 40
    new-instance p1, Ljava/lang/Object;

    .line 41
    .line 42
    invoke-direct {p1}, Ljava/lang/Object;-><init>()V

    .line 43
    .line 44
    .line 45
    iput-object p1, p0, Ll/ppd0;->e:Ljava/lang/Object;

    .line 46
    .line 47
    new-instance p1, Ll/ypd0;

    .line 48
    .line 49
    invoke-direct {p1}, Ll/ypd0;-><init>()V

    .line 50
    .line 51
    .line 52
    iput-object p1, p0, Ll/ppd0;->f:Ll/ypd0;

    .line 53
    .line 54
    const-wide p1, -0x7fffffffffffffffL    # -4.9E-324

    .line 55
    .line 56
    .line 57
    .line 58
    .line 59
    iput-wide p1, p0, Ll/ppd0;->i:J

    .line 60
    .line 61
    const/4 v0, -0x1

    .line 62
    iput v0, p0, Ll/ppd0;->j:I

    .line 63
    .line 64
    iput-wide p1, p0, Ll/ppd0;->l:J

    .line 65
    .line 66
    iput-wide p1, p0, Ll/ppd0;->m:J

    .line 67
    .line 68
    return-void
.end method

.method public static c(J)J
    .locals 2

    .line 1
    const-wide/16 v0, 0x1e

    .line 2
    .line 3
    sub-long/2addr p0, v0

    .line 4
    return-wide p0
.end method


# virtual methods
.method public a(JJ)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ppd0;->e:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-boolean v1, p0, Ll/ppd0;->k:Z

    .line 5
    .line 6
    if-nez v1, :cond_0

    .line 7
    .line 8
    const/4 v1, 0x1

    .line 9
    iput-boolean v1, p0, Ll/ppd0;->k:Z

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :catchall_0
    move-exception p0

    .line 13
    goto :goto_1

    .line 14
    :cond_0
    :goto_0
    iput-wide p1, p0, Ll/ppd0;->l:J

    .line 15
    .line 16
    iput-wide p3, p0, Ll/ppd0;->m:J

    .line 17
    .line 18
    monitor-exit v0

    .line 19
    return-void

    .line 20
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 21
    throw p0
.end method

.method public b(Ll/bsf;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/ppd0;->a:Ll/aqd0;

    .line 2
    .line 3
    iget v1, p0, Ll/ppd0;->d:I

    .line 4
    .line 5
    invoke-interface {v0, p1, v1}, Ll/aqd0;->d(Ll/bsf;I)V

    .line 6
    .line 7
    .line 8
    invoke-interface {p1}, Ll/bsf;->l()V

    .line 9
    .line 10
    .line 11
    new-instance v0, Ll/mke0$b;

    .line 12
    .line 13
    const-wide v1, -0x7fffffffffffffffL    # -4.9E-324

    .line 14
    .line 15
    .line 16
    .line 17
    .line 18
    invoke-direct {v0, v1, v2}, Ll/mke0$b;-><init>(J)V

    .line 19
    .line 20
    .line 21
    invoke-interface {p1, v0}, Ll/bsf;->k(Ll/mke0;)V

    .line 22
    .line 23
    .line 24
    iput-object p1, p0, Ll/ppd0;->g:Ll/bsf;

    .line 25
    .line 26
    return-void
.end method

.method public d()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/ppd0;->h:Z

    .line 2
    .line 3
    return p0
.end method

.method public e()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ppd0;->e:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    const/4 v1, 0x1

    .line 5
    :try_start_0
    iput-boolean v1, p0, Ll/ppd0;->k:Z

    .line 6
    .line 7
    monitor-exit v0

    .line 8
    return-void

    .line 9
    :catchall_0
    move-exception p0

    .line 10
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 11
    throw p0
.end method

.method public f(Ll/asf;)Z
    .locals 0

    .line 1
    new-instance p0, Ljava/lang/UnsupportedOperationException;

    .line 2
    .line 3
    const-string p1, "RTP packets are transmitted in a packet stream do not support sniffing."

    .line 4
    .line 5
    invoke-direct {p0, p1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    throw p0
.end method

.method public g(I)V
    .locals 0

    .line 1
    iput p1, p0, Ll/ppd0;->j:I

    .line 2
    .line 3
    return-void
.end method

.method public h(Ll/asf;Ll/ll80;)I
    .locals 12
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p2, p0, Ll/ppd0;->g:Ll/bsf;

    .line 2
    .line 3
    invoke-static {p2}, Ll/w11;->e(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    iget-object p2, p0, Ll/ppd0;->b:Ll/ig60;

    .line 7
    .line 8
    invoke-virtual {p2}, Ll/ig60;->e()[B

    .line 9
    .line 10
    .line 11
    move-result-object p2

    .line 12
    const v0, 0xffe3

    .line 13
    .line 14
    .line 15
    const/4 v1, 0x0

    .line 16
    invoke-interface {p1, p2, v1, v0}, Ll/asf;->read([BII)I

    .line 17
    .line 18
    .line 19
    move-result p1

    .line 20
    const/4 p2, -0x1

    .line 21
    if-ne p1, p2, :cond_0

    .line 22
    .line 23
    return p2

    .line 24
    :cond_0
    if-nez p1, :cond_1

    .line 25
    .line 26
    return v1

    .line 27
    :cond_1
    iget-object v0, p0, Ll/ppd0;->b:Ll/ig60;

    .line 28
    .line 29
    invoke-virtual {v0, v1}, Ll/ig60;->U(I)V

    .line 30
    .line 31
    .line 32
    iget-object v0, p0, Ll/ppd0;->b:Ll/ig60;

    .line 33
    .line 34
    invoke-virtual {v0, p1}, Ll/ig60;->T(I)V

    .line 35
    .line 36
    .line 37
    iget-object p1, p0, Ll/ppd0;->b:Ll/ig60;

    .line 38
    .line 39
    invoke-static {p1}, Ll/wpd0;->d(Ll/ig60;)Ll/wpd0;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    if-nez p1, :cond_2

    .line 44
    .line 45
    return v1

    .line 46
    :cond_2
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 47
    .line 48
    .line 49
    move-result-wide v2

    .line 50
    invoke-static {v2, v3}, Ll/ppd0;->c(J)J

    .line 51
    .line 52
    .line 53
    move-result-wide v4

    .line 54
    iget-object v0, p0, Ll/ppd0;->f:Ll/ypd0;

    .line 55
    .line 56
    invoke-virtual {v0, p1, v2, v3}, Ll/ypd0;->d(Ll/wpd0;J)Z

    .line 57
    .line 58
    .line 59
    iget-object p1, p0, Ll/ppd0;->f:Ll/ypd0;

    .line 60
    .line 61
    invoke-virtual {p1, v4, v5}, Ll/ypd0;->e(J)Ll/wpd0;

    .line 62
    .line 63
    .line 64
    move-result-object p1

    .line 65
    if-nez p1, :cond_3

    .line 66
    .line 67
    return v1

    .line 68
    :cond_3
    iget-boolean v0, p0, Ll/ppd0;->h:Z

    .line 69
    .line 70
    const-wide v2, -0x7fffffffffffffffL    # -4.9E-324

    .line 71
    .line 72
    .line 73
    .line 74
    .line 75
    if-nez v0, :cond_6

    .line 76
    .line 77
    iget-wide v6, p0, Ll/ppd0;->i:J

    .line 78
    .line 79
    cmp-long v0, v6, v2

    .line 80
    .line 81
    if-nez v0, :cond_4

    .line 82
    .line 83
    iget-wide v6, p1, Ll/wpd0;->h:J

    .line 84
    .line 85
    iput-wide v6, p0, Ll/ppd0;->i:J

    .line 86
    .line 87
    :cond_4
    iget v0, p0, Ll/ppd0;->j:I

    .line 88
    .line 89
    if-ne v0, p2, :cond_5

    .line 90
    .line 91
    iget p2, p1, Ll/wpd0;->g:I

    .line 92
    .line 93
    iput p2, p0, Ll/ppd0;->j:I

    .line 94
    .line 95
    :cond_5
    iget-object p2, p0, Ll/ppd0;->a:Ll/aqd0;

    .line 96
    .line 97
    iget-wide v6, p0, Ll/ppd0;->i:J

    .line 98
    .line 99
    iget v0, p0, Ll/ppd0;->j:I

    .line 100
    .line 101
    invoke-interface {p2, v6, v7, v0}, Ll/aqd0;->c(JI)V

    .line 102
    .line 103
    .line 104
    const/4 p2, 0x1

    .line 105
    iput-boolean p2, p0, Ll/ppd0;->h:Z

    .line 106
    .line 107
    :cond_6
    iget-object p2, p0, Ll/ppd0;->e:Ljava/lang/Object;

    .line 108
    .line 109
    monitor-enter p2

    .line 110
    :try_start_0
    iget-boolean v0, p0, Ll/ppd0;->k:Z

    .line 111
    .line 112
    if-eqz v0, :cond_7

    .line 113
    .line 114
    iget-wide v4, p0, Ll/ppd0;->l:J

    .line 115
    .line 116
    cmp-long p1, v4, v2

    .line 117
    .line 118
    if-eqz p1, :cond_8

    .line 119
    .line 120
    iget-wide v4, p0, Ll/ppd0;->m:J

    .line 121
    .line 122
    cmp-long p1, v4, v2

    .line 123
    .line 124
    if-eqz p1, :cond_8

    .line 125
    .line 126
    iget-object p1, p0, Ll/ppd0;->f:Ll/ypd0;

    .line 127
    .line 128
    invoke-virtual {p1}, Ll/ypd0;->f()V

    .line 129
    .line 130
    .line 131
    iget-object p1, p0, Ll/ppd0;->a:Ll/aqd0;

    .line 132
    .line 133
    iget-wide v4, p0, Ll/ppd0;->l:J

    .line 134
    .line 135
    iget-wide v6, p0, Ll/ppd0;->m:J

    .line 136
    .line 137
    invoke-interface {p1, v4, v5, v6, v7}, Ll/aqd0;->a(JJ)V

    .line 138
    .line 139
    .line 140
    iput-boolean v1, p0, Ll/ppd0;->k:Z

    .line 141
    .line 142
    iput-wide v2, p0, Ll/ppd0;->l:J

    .line 143
    .line 144
    iput-wide v2, p0, Ll/ppd0;->m:J

    .line 145
    .line 146
    goto :goto_0

    .line 147
    :catchall_0
    move-exception v0

    .line 148
    move-object p0, v0

    .line 149
    goto :goto_1

    .line 150
    :cond_7
    iget-object v0, p0, Ll/ppd0;->c:Ll/ig60;

    .line 151
    .line 152
    iget-object v2, p1, Ll/wpd0;->k:[B

    .line 153
    .line 154
    invoke-virtual {v0, v2}, Ll/ig60;->R([B)V

    .line 155
    .line 156
    .line 157
    iget-object v6, p0, Ll/ppd0;->a:Ll/aqd0;

    .line 158
    .line 159
    iget-object v7, p0, Ll/ppd0;->c:Ll/ig60;

    .line 160
    .line 161
    iget-wide v8, p1, Ll/wpd0;->h:J

    .line 162
    .line 163
    iget v10, p1, Ll/wpd0;->g:I

    .line 164
    .line 165
    iget-boolean v11, p1, Ll/wpd0;->e:Z

    .line 166
    .line 167
    invoke-interface/range {v6 .. v11}, Ll/aqd0;->b(Ll/ig60;JIZ)V

    .line 168
    .line 169
    .line 170
    iget-object p1, p0, Ll/ppd0;->f:Ll/ypd0;

    .line 171
    .line 172
    invoke-virtual {p1, v4, v5}, Ll/ypd0;->e(J)Ll/wpd0;

    .line 173
    .line 174
    .line 175
    move-result-object p1

    .line 176
    if-nez p1, :cond_7

    .line 177
    .line 178
    :cond_8
    :goto_0
    monitor-exit p2

    .line 179
    return v1

    .line 180
    :goto_1
    monitor-exit p2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 181
    throw p0
.end method

.method public i(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Ll/ppd0;->i:J

    .line 2
    .line 3
    return-void
.end method

.method public release()V
    .locals 0

    .line 1
    return-void
.end method

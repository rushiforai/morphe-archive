.class public final Lcom/google/android/exoplayer2/source/rtsp/b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/google/android/exoplayer2/upstream/Loader$e;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/exoplayer2/source/rtsp/b$a;
    }
.end annotation

.annotation runtime Ljava/lang/Deprecated;
.end annotation


# instance fields
.field public final a:I

.field public final b:Ll/lqd0;

.field public final c:Lcom/google/android/exoplayer2/source/rtsp/b$a;

.field public final d:Ll/bsf;

.field public final e:Landroid/os/Handler;

.field public final f:Lcom/google/android/exoplayer2/source/rtsp/a$a;

.field public g:Lcom/google/android/exoplayer2/source/rtsp/a;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public h:Ll/ppd0;

.field public i:Ll/qod;

.field public volatile j:Z

.field public volatile k:J

.field public volatile l:J


# direct methods
.method public constructor <init>(ILl/lqd0;Lcom/google/android/exoplayer2/source/rtsp/b$a;Ll/bsf;Lcom/google/android/exoplayer2/source/rtsp/a$a;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput p1, p0, Lcom/google/android/exoplayer2/source/rtsp/b;->a:I

    .line 5
    .line 6
    iput-object p2, p0, Lcom/google/android/exoplayer2/source/rtsp/b;->b:Ll/lqd0;

    .line 7
    .line 8
    iput-object p3, p0, Lcom/google/android/exoplayer2/source/rtsp/b;->c:Lcom/google/android/exoplayer2/source/rtsp/b$a;

    .line 9
    .line 10
    iput-object p4, p0, Lcom/google/android/exoplayer2/source/rtsp/b;->d:Ll/bsf;

    .line 11
    .line 12
    invoke-static {}, Ll/bmk0;->w()Landroid/os/Handler;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    iput-object p1, p0, Lcom/google/android/exoplayer2/source/rtsp/b;->e:Landroid/os/Handler;

    .line 17
    .line 18
    iput-object p5, p0, Lcom/google/android/exoplayer2/source/rtsp/b;->f:Lcom/google/android/exoplayer2/source/rtsp/a$a;

    .line 19
    .line 20
    const-wide p1, -0x7fffffffffffffffL    # -4.9E-324

    .line 21
    .line 22
    .line 23
    .line 24
    .line 25
    iput-wide p1, p0, Lcom/google/android/exoplayer2/source/rtsp/b;->k:J

    .line 26
    .line 27
    return-void
.end method

.method public static synthetic b(Lcom/google/android/exoplayer2/source/rtsp/b;Ljava/lang/String;Lcom/google/android/exoplayer2/source/rtsp/a;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/android/exoplayer2/source/rtsp/b;->c:Lcom/google/android/exoplayer2/source/rtsp/b$a;

    .line 2
    .line 3
    invoke-interface {p0, p1, p2}, Lcom/google/android/exoplayer2/source/rtsp/b$a;->a(Ljava/lang/String;Lcom/google/android/exoplayer2/source/rtsp/a;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a()V
    .locals 12
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-boolean v0, p0, Lcom/google/android/exoplayer2/source/rtsp/b;->j:Z

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    iput-boolean v1, p0, Lcom/google/android/exoplayer2/source/rtsp/b;->j:Z

    .line 7
    .line 8
    :cond_0
    const/4 v2, 0x0

    .line 9
    :try_start_0
    iget-object v0, p0, Lcom/google/android/exoplayer2/source/rtsp/b;->g:Lcom/google/android/exoplayer2/source/rtsp/a;

    .line 10
    .line 11
    if-nez v0, :cond_1

    .line 12
    .line 13
    iget-object v0, p0, Lcom/google/android/exoplayer2/source/rtsp/b;->f:Lcom/google/android/exoplayer2/source/rtsp/a$a;

    .line 14
    .line 15
    iget v3, p0, Lcom/google/android/exoplayer2/source/rtsp/b;->a:I

    .line 16
    .line 17
    invoke-interface {v0, v3}, Lcom/google/android/exoplayer2/source/rtsp/a$a;->b(I)Lcom/google/android/exoplayer2/source/rtsp/a;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    iput-object v0, p0, Lcom/google/android/exoplayer2/source/rtsp/b;->g:Lcom/google/android/exoplayer2/source/rtsp/a;

    .line 22
    .line 23
    invoke-interface {v0}, Lcom/google/android/exoplayer2/source/rtsp/a;->getTransport()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    iget-object v3, p0, Lcom/google/android/exoplayer2/source/rtsp/b;->g:Lcom/google/android/exoplayer2/source/rtsp/a;

    .line 28
    .line 29
    iget-object v4, p0, Lcom/google/android/exoplayer2/source/rtsp/b;->e:Landroid/os/Handler;

    .line 30
    .line 31
    new-instance v5, Ll/opd0;

    .line 32
    .line 33
    invoke-direct {v5, p0, v0, v3}, Ll/opd0;-><init>(Lcom/google/android/exoplayer2/source/rtsp/b;Ljava/lang/String;Lcom/google/android/exoplayer2/source/rtsp/a;)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {v4, v5}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 37
    .line 38
    .line 39
    new-instance v6, Ll/qod;

    .line 40
    .line 41
    iget-object v0, p0, Lcom/google/android/exoplayer2/source/rtsp/b;->g:Lcom/google/android/exoplayer2/source/rtsp/a;

    .line 42
    .line 43
    invoke-static {v0}, Ll/w11;->e(Ljava/lang/Object;)Ljava/lang/Object;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    move-object v7, v0

    .line 48
    check-cast v7, Ll/e6c;

    .line 49
    .line 50
    const-wide/16 v8, 0x0

    .line 51
    .line 52
    const-wide/16 v10, -0x1

    .line 53
    .line 54
    invoke-direct/range {v6 .. v11}, Ll/qod;-><init>(Ll/e6c;JJ)V

    .line 55
    .line 56
    .line 57
    iput-object v6, p0, Lcom/google/android/exoplayer2/source/rtsp/b;->i:Ll/qod;

    .line 58
    .line 59
    new-instance v0, Ll/ppd0;

    .line 60
    .line 61
    iget-object v3, p0, Lcom/google/android/exoplayer2/source/rtsp/b;->b:Ll/lqd0;

    .line 62
    .line 63
    iget-object v3, v3, Ll/lqd0;->a:Ll/zpd0;

    .line 64
    .line 65
    iget v4, p0, Lcom/google/android/exoplayer2/source/rtsp/b;->a:I

    .line 66
    .line 67
    invoke-direct {v0, v3, v4}, Ll/ppd0;-><init>(Ll/zpd0;I)V

    .line 68
    .line 69
    .line 70
    iput-object v0, p0, Lcom/google/android/exoplayer2/source/rtsp/b;->h:Ll/ppd0;

    .line 71
    .line 72
    iget-object v3, p0, Lcom/google/android/exoplayer2/source/rtsp/b;->d:Ll/bsf;

    .line 73
    .line 74
    invoke-virtual {v0, v3}, Ll/ppd0;->b(Ll/bsf;)V

    .line 75
    .line 76
    .line 77
    goto :goto_0

    .line 78
    :catchall_0
    move-exception v0

    .line 79
    goto :goto_1

    .line 80
    :cond_1
    :goto_0
    iget-boolean v0, p0, Lcom/google/android/exoplayer2/source/rtsp/b;->j:Z

    .line 81
    .line 82
    if-nez v0, :cond_3

    .line 83
    .line 84
    iget-wide v3, p0, Lcom/google/android/exoplayer2/source/rtsp/b;->k:J

    .line 85
    .line 86
    const-wide v5, -0x7fffffffffffffffL    # -4.9E-324

    .line 87
    .line 88
    .line 89
    .line 90
    .line 91
    cmp-long v0, v3, v5

    .line 92
    .line 93
    if-eqz v0, :cond_2

    .line 94
    .line 95
    iget-object v0, p0, Lcom/google/android/exoplayer2/source/rtsp/b;->h:Ll/ppd0;

    .line 96
    .line 97
    invoke-static {v0}, Ll/w11;->e(Ljava/lang/Object;)Ljava/lang/Object;

    .line 98
    .line 99
    .line 100
    move-result-object v0

    .line 101
    check-cast v0, Ll/ppd0;

    .line 102
    .line 103
    iget-wide v3, p0, Lcom/google/android/exoplayer2/source/rtsp/b;->l:J

    .line 104
    .line 105
    iget-wide v7, p0, Lcom/google/android/exoplayer2/source/rtsp/b;->k:J

    .line 106
    .line 107
    invoke-virtual {v0, v3, v4, v7, v8}, Ll/ppd0;->a(JJ)V

    .line 108
    .line 109
    .line 110
    iput-wide v5, p0, Lcom/google/android/exoplayer2/source/rtsp/b;->k:J

    .line 111
    .line 112
    :cond_2
    iget-object v0, p0, Lcom/google/android/exoplayer2/source/rtsp/b;->h:Ll/ppd0;

    .line 113
    .line 114
    invoke-static {v0}, Ll/w11;->e(Ljava/lang/Object;)Ljava/lang/Object;

    .line 115
    .line 116
    .line 117
    move-result-object v0

    .line 118
    check-cast v0, Ll/ppd0;

    .line 119
    .line 120
    iget-object v3, p0, Lcom/google/android/exoplayer2/source/rtsp/b;->i:Ll/qod;

    .line 121
    .line 122
    invoke-static {v3}, Ll/w11;->e(Ljava/lang/Object;)Ljava/lang/Object;

    .line 123
    .line 124
    .line 125
    move-result-object v3

    .line 126
    check-cast v3, Ll/asf;

    .line 127
    .line 128
    new-instance v4, Ll/ll80;

    .line 129
    .line 130
    invoke-direct {v4}, Ll/ll80;-><init>()V

    .line 131
    .line 132
    .line 133
    invoke-virtual {v0, v3, v4}, Ll/ppd0;->h(Ll/asf;Ll/ll80;)I

    .line 134
    .line 135
    .line 136
    move-result v0

    .line 137
    const/4 v3, -0x1

    .line 138
    if-ne v0, v3, :cond_1

    .line 139
    .line 140
    :cond_3
    iput-boolean v1, p0, Lcom/google/android/exoplayer2/source/rtsp/b;->j:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 141
    .line 142
    iget-object v0, p0, Lcom/google/android/exoplayer2/source/rtsp/b;->g:Lcom/google/android/exoplayer2/source/rtsp/a;

    .line 143
    .line 144
    invoke-static {v0}, Ll/w11;->e(Ljava/lang/Object;)Ljava/lang/Object;

    .line 145
    .line 146
    .line 147
    move-result-object v0

    .line 148
    check-cast v0, Lcom/google/android/exoplayer2/source/rtsp/a;

    .line 149
    .line 150
    invoke-interface {v0}, Lcom/google/android/exoplayer2/source/rtsp/a;->i()Z

    .line 151
    .line 152
    .line 153
    move-result v0

    .line 154
    if-eqz v0, :cond_4

    .line 155
    .line 156
    iget-object v0, p0, Lcom/google/android/exoplayer2/source/rtsp/b;->g:Lcom/google/android/exoplayer2/source/rtsp/a;

    .line 157
    .line 158
    invoke-static {v0}, Ll/m6c;->a(Ll/g6c;)V

    .line 159
    .line 160
    .line 161
    iput-object v2, p0, Lcom/google/android/exoplayer2/source/rtsp/b;->g:Lcom/google/android/exoplayer2/source/rtsp/a;

    .line 162
    .line 163
    :cond_4
    return-void

    .line 164
    :goto_1
    iget-object v1, p0, Lcom/google/android/exoplayer2/source/rtsp/b;->g:Lcom/google/android/exoplayer2/source/rtsp/a;

    .line 165
    .line 166
    invoke-static {v1}, Ll/w11;->e(Ljava/lang/Object;)Ljava/lang/Object;

    .line 167
    .line 168
    .line 169
    move-result-object v1

    .line 170
    check-cast v1, Lcom/google/android/exoplayer2/source/rtsp/a;

    .line 171
    .line 172
    invoke-interface {v1}, Lcom/google/android/exoplayer2/source/rtsp/a;->i()Z

    .line 173
    .line 174
    .line 175
    move-result v1

    .line 176
    if-eqz v1, :cond_5

    .line 177
    .line 178
    iget-object v1, p0, Lcom/google/android/exoplayer2/source/rtsp/b;->g:Lcom/google/android/exoplayer2/source/rtsp/a;

    .line 179
    .line 180
    invoke-static {v1}, Ll/m6c;->a(Ll/g6c;)V

    .line 181
    .line 182
    .line 183
    iput-object v2, p0, Lcom/google/android/exoplayer2/source/rtsp/b;->g:Lcom/google/android/exoplayer2/source/rtsp/a;

    .line 184
    .line 185
    :cond_5
    throw v0
.end method

.method public c()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lcom/google/android/exoplayer2/source/rtsp/b;->j:Z

    .line 3
    .line 4
    return-void
.end method

.method public d()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/android/exoplayer2/source/rtsp/b;->h:Ll/ppd0;

    .line 2
    .line 3
    invoke-static {p0}, Ll/w11;->e(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ll/ppd0;

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/ppd0;->e()V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public e(JJ)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/google/android/exoplayer2/source/rtsp/b;->k:J

    .line 2
    .line 3
    iput-wide p3, p0, Lcom/google/android/exoplayer2/source/rtsp/b;->l:J

    .line 4
    .line 5
    return-void
.end method

.method public f(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/google/android/exoplayer2/source/rtsp/b;->h:Ll/ppd0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/w11;->e(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ll/ppd0;

    .line 8
    .line 9
    invoke-virtual {v0}, Ll/ppd0;->d()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    iget-object p0, p0, Lcom/google/android/exoplayer2/source/rtsp/b;->h:Ll/ppd0;

    .line 16
    .line 17
    invoke-virtual {p0, p1}, Ll/ppd0;->g(I)V

    .line 18
    .line 19
    .line 20
    :cond_0
    return-void
.end method

.method public g(J)V
    .locals 2

    .line 1
    const-wide v0, -0x7fffffffffffffffL    # -4.9E-324

    .line 2
    .line 3
    .line 4
    .line 5
    .line 6
    cmp-long v0, p1, v0

    .line 7
    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    iget-object v0, p0, Lcom/google/android/exoplayer2/source/rtsp/b;->h:Ll/ppd0;

    .line 11
    .line 12
    invoke-static {v0}, Ll/w11;->e(Ljava/lang/Object;)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    check-cast v0, Ll/ppd0;

    .line 17
    .line 18
    invoke-virtual {v0}, Ll/ppd0;->d()Z

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-nez v0, :cond_0

    .line 23
    .line 24
    iget-object p0, p0, Lcom/google/android/exoplayer2/source/rtsp/b;->h:Ll/ppd0;

    .line 25
    .line 26
    invoke-virtual {p0, p1, p2}, Ll/ppd0;->i(J)V

    .line 27
    .line 28
    .line 29
    :cond_0
    return-void
.end method

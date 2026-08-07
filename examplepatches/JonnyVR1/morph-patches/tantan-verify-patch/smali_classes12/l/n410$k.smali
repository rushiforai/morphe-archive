.class Ll/n410$k;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/immomo/moment/mediautils/o$d;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/n410;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Ll/n410;


# direct methods
.method public constructor <init>(Ll/n410;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/n410$k;->a:Ll/n410;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a()V
    .locals 3

    .line 1
    const-string v0, "EditProcess"

    .line 2
    .line 3
    const-string v1, "loop back again !!!"

    .line 4
    .line 5
    invoke-static {v0, v1}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ll/n410$k;->a:Ll/n410;

    .line 9
    .line 10
    iget-object v0, v0, Ll/n410;->h:Ll/qvf0;

    .line 11
    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    invoke-virtual {v0}, Ll/qvf0;->a()Z

    .line 15
    .line 16
    .line 17
    :cond_0
    iget-object v0, p0, Ll/n410$k;->a:Ll/n410;

    .line 18
    .line 19
    iget-object v0, v0, Ll/n410;->e:Ll/ed1;

    .line 20
    .line 21
    if-eqz v0, :cond_1

    .line 22
    .line 23
    invoke-virtual {v0}, Ll/ed1;->c()Z

    .line 24
    .line 25
    .line 26
    :cond_1
    iget-object v0, p0, Ll/n410$k;->a:Ll/n410;

    .line 27
    .line 28
    iget-object v0, v0, Ll/n410;->f:Ll/ob1;

    .line 29
    .line 30
    if-eqz v0, :cond_2

    .line 31
    .line 32
    invoke-virtual {v0}, Ll/ob1;->c()Z

    .line 33
    .line 34
    .line 35
    :cond_2
    iget-object v0, p0, Ll/n410$k;->a:Ll/n410;

    .line 36
    .line 37
    iget-object v0, v0, Ll/n410;->u0:Ll/rb1;

    .line 38
    .line 39
    if-eqz v0, :cond_3

    .line 40
    .line 41
    invoke-virtual {v0}, Ll/rb1;->c()Z

    .line 42
    .line 43
    .line 44
    :cond_3
    iget-object v0, p0, Ll/n410$k;->a:Ll/n410;

    .line 45
    .line 46
    iget-object v0, v0, Ll/n410;->d:Lcom/immomo/moment/mediautils/d;

    .line 47
    .line 48
    if-eqz v0, :cond_4

    .line 49
    .line 50
    invoke-virtual {v0}, Lcom/immomo/moment/mediautils/d;->p()V

    .line 51
    .line 52
    .line 53
    :cond_4
    iget-object v0, p0, Ll/n410$k;->a:Ll/n410;

    .line 54
    .line 55
    const-wide/16 v1, 0x0

    .line 56
    .line 57
    invoke-static {v0, v1, v2}, Ll/n410;->s(Ll/n410;J)J

    .line 58
    .line 59
    .line 60
    iget-object p0, p0, Ll/n410$k;->a:Ll/n410;

    .line 61
    .line 62
    invoke-static {p0, v1, v2}, Ll/n410;->n(Ll/n410;J)J

    .line 63
    .line 64
    .line 65
    return-void
.end method

.method public b(Ljava/nio/ByteBuffer;)V
    .locals 3

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    goto :goto_1

    .line 4
    :cond_0
    iget-object v0, p0, Ll/n410$k;->a:Ll/n410;

    .line 5
    .line 6
    invoke-static {v0}, Ll/n410;->E(Ll/n410;)V

    .line 7
    .line 8
    .line 9
    iget-object v0, p0, Ll/n410$k;->a:Ll/n410;

    .line 10
    .line 11
    invoke-static {v0}, Ll/n410;->F(Ll/n410;)Ll/crf0;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iget-object v1, p0, Ll/n410$k;->a:Ll/n410;

    .line 16
    .line 17
    if-nez v0, :cond_1

    .line 18
    .line 19
    new-instance v0, Ll/crf0;

    .line 20
    .line 21
    invoke-static {v1}, Ll/n410;->u(Ll/n410;)I

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    iget-object v2, p0, Ll/n410$k;->a:Ll/n410;

    .line 26
    .line 27
    invoke-static {v2}, Ll/n410;->v(Ll/n410;)I

    .line 28
    .line 29
    .line 30
    move-result v2

    .line 31
    invoke-direct {v0, v1, v2}, Ll/crf0;-><init>(II)V

    .line 32
    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_1
    invoke-static {v1}, Ll/n410;->F(Ll/n410;)Ll/crf0;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    :goto_0
    iget-object v1, p0, Ll/n410$k;->a:Ll/n410;

    .line 40
    .line 41
    invoke-static {v1}, Ll/n410;->G(Ll/n410;)Z

    .line 42
    .line 43
    .line 44
    move-result v1

    .line 45
    if-eqz v1, :cond_2

    .line 46
    .line 47
    iget-object v1, p0, Ll/n410$k;->a:Ll/n410;

    .line 48
    .line 49
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 50
    .line 51
    .line 52
    :cond_2
    iget-object v1, p0, Ll/n410$k;->a:Ll/n410;

    .line 53
    .line 54
    iget-object v1, v1, Ll/n410;->k:Ll/eli0;

    .line 55
    .line 56
    if-eqz v1, :cond_3

    .line 57
    .line 58
    check-cast v1, Ll/v5c;

    .line 59
    .line 60
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->array()[B

    .line 61
    .line 62
    .line 63
    move-result-object v2

    .line 64
    invoke-virtual {p1}, Ljava/nio/Buffer;->limit()I

    .line 65
    .line 66
    .line 67
    move-result p1

    .line 68
    invoke-virtual {v1, v2, p1}, Ll/v5c;->r1([BI)V

    .line 69
    .line 70
    .line 71
    iget-object p1, p0, Ll/n410$k;->a:Ll/n410;

    .line 72
    .line 73
    invoke-static {p1}, Ll/n410;->h(Ll/n410;)I

    .line 74
    .line 75
    .line 76
    move-result p1

    .line 77
    const/4 v1, 0x1

    .line 78
    if-ne p1, v1, :cond_3

    .line 79
    .line 80
    iget-object p1, p0, Ll/n410$k;->a:Ll/n410;

    .line 81
    .line 82
    invoke-static {p1}, Ll/n410;->H(Ll/n410;)Z

    .line 83
    .line 84
    .line 85
    move-result p1

    .line 86
    if-eqz p1, :cond_3

    .line 87
    .line 88
    iget-object p1, p0, Ll/n410$k;->a:Ll/n410;

    .line 89
    .line 90
    iget-object v1, p1, Ll/n410;->k:Ll/eli0;

    .line 91
    .line 92
    invoke-static {p1}, Ll/n410;->J(Ll/n410;)Ljava/lang/Object;

    .line 93
    .line 94
    .line 95
    move-result-object p1

    .line 96
    invoke-virtual {v1, p1, v0}, Ll/eli0;->y0(Ljava/lang/Object;Ll/crf0;)V

    .line 97
    .line 98
    .line 99
    iget-object p0, p0, Ll/n410$k;->a:Ll/n410;

    .line 100
    .line 101
    const/4 p1, 0x0

    .line 102
    invoke-static {p0, p1}, Ll/n410;->I(Ll/n410;Z)Z

    .line 103
    .line 104
    .line 105
    :cond_3
    :goto_1
    return-void
.end method

.method public c(J)V
    .locals 5

    .line 1
    const-wide/16 v0, -0x1

    .line 2
    .line 3
    cmp-long v0, p1, v0

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    iget-object v1, p0, Ll/n410$k;->a:Ll/n410;

    .line 8
    .line 9
    invoke-static {v1}, Ll/n410;->f(Ll/n410;)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    const-string v2, "Pts is -1"

    .line 14
    .line 15
    invoke-static {v1, v2}, Lcom/cosmos/mdlog/MDLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    :cond_0
    iget-object v1, p0, Ll/n410$k;->a:Ll/n410;

    .line 19
    .line 20
    iget-object v1, v1, Ll/n410;->i:Ll/xcl0;

    .line 21
    .line 22
    if-eqz v1, :cond_1

    .line 23
    .line 24
    invoke-virtual {v1, p1, p2}, Ll/xcl0;->l(J)V

    .line 25
    .line 26
    .line 27
    :cond_1
    if-nez v0, :cond_2

    .line 28
    .line 29
    return-void

    .line 30
    :cond_2
    iget-object v0, p0, Ll/n410$k;->a:Ll/n410;

    .line 31
    .line 32
    invoke-static {v0}, Ll/n410;->g(Ll/n410;)Ll/kpw;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    if-eqz v0, :cond_4

    .line 37
    .line 38
    iget-object v0, p0, Ll/n410$k;->a:Ll/n410;

    .line 39
    .line 40
    invoke-static {v0}, Ll/n410;->h(Ll/n410;)I

    .line 41
    .line 42
    .line 43
    move-result v0

    .line 44
    if-nez v0, :cond_4

    .line 45
    .line 46
    iget-object v0, p0, Ll/n410$k;->a:Ll/n410;

    .line 47
    .line 48
    invoke-static {v0}, Ll/n410;->i(Ll/n410;)Z

    .line 49
    .line 50
    .line 51
    move-result v0

    .line 52
    if-eqz v0, :cond_4

    .line 53
    .line 54
    iget-object v0, p0, Ll/n410$k;->a:Ll/n410;

    .line 55
    .line 56
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 57
    .line 58
    .line 59
    move-result-wide v1

    .line 60
    invoke-static {v0, v1, v2}, Ll/n410;->k(Ll/n410;J)J

    .line 61
    .line 62
    .line 63
    iget-object v0, p0, Ll/n410$k;->a:Ll/n410;

    .line 64
    .line 65
    invoke-static {v0}, Ll/n410;->l(Ll/n410;)J

    .line 66
    .line 67
    .line 68
    move-result-wide v0

    .line 69
    const-wide/16 v2, 0x0

    .line 70
    .line 71
    cmp-long v0, v0, v2

    .line 72
    .line 73
    if-eqz v0, :cond_4

    .line 74
    .line 75
    iget-object v0, p0, Ll/n410$k;->a:Ll/n410;

    .line 76
    .line 77
    invoke-static {v0}, Ll/n410;->m(Ll/n410;)J

    .line 78
    .line 79
    .line 80
    move-result-wide v0

    .line 81
    add-long/2addr v0, p1

    .line 82
    iget-object v2, p0, Ll/n410$k;->a:Ll/n410;

    .line 83
    .line 84
    invoke-static {v2}, Ll/n410;->l(Ll/n410;)J

    .line 85
    .line 86
    .line 87
    move-result-wide v2

    .line 88
    cmp-long v0, v0, v2

    .line 89
    .line 90
    iget-object v1, p0, Ll/n410$k;->a:Ll/n410;

    .line 91
    .line 92
    const/high16 v2, 0x3f800000    # 1.0f

    .line 93
    .line 94
    if-lez v0, :cond_3

    .line 95
    .line 96
    invoke-static {v1}, Ll/n410;->g(Ll/n410;)Ll/kpw;

    .line 97
    .line 98
    .line 99
    move-result-object v0

    .line 100
    long-to-float v1, p1

    .line 101
    mul-float/2addr v1, v2

    .line 102
    iget-object v2, p0, Ll/n410$k;->a:Ll/n410;

    .line 103
    .line 104
    invoke-static {v2}, Ll/n410;->l(Ll/n410;)J

    .line 105
    .line 106
    .line 107
    move-result-wide v2

    .line 108
    long-to-float v2, v2

    .line 109
    div-float/2addr v1, v2

    .line 110
    invoke-interface {v0, v1}, Ll/kpw;->onProcessProgress(F)V

    .line 111
    .line 112
    .line 113
    goto :goto_0

    .line 114
    :cond_3
    invoke-static {v1}, Ll/n410;->g(Ll/n410;)Ll/kpw;

    .line 115
    .line 116
    .line 117
    move-result-object v0

    .line 118
    iget-object v1, p0, Ll/n410$k;->a:Ll/n410;

    .line 119
    .line 120
    invoke-static {v1}, Ll/n410;->m(Ll/n410;)J

    .line 121
    .line 122
    .line 123
    move-result-wide v3

    .line 124
    add-long/2addr v3, p1

    .line 125
    long-to-float v1, v3

    .line 126
    mul-float/2addr v1, v2

    .line 127
    iget-object v2, p0, Ll/n410$k;->a:Ll/n410;

    .line 128
    .line 129
    invoke-static {v2}, Ll/n410;->l(Ll/n410;)J

    .line 130
    .line 131
    .line 132
    move-result-wide v2

    .line 133
    long-to-float v2, v2

    .line 134
    div-float/2addr v1, v2

    .line 135
    invoke-interface {v0, v1}, Ll/kpw;->onProcessProgress(F)V

    .line 136
    .line 137
    .line 138
    :cond_4
    :goto_0
    iget-object v0, p0, Ll/n410$k;->a:Ll/n410;

    .line 139
    .line 140
    invoke-static {v0}, Ll/n410;->o(Ll/n410;)Ljava/lang/Object;

    .line 141
    .line 142
    .line 143
    move-result-object v0

    .line 144
    monitor-enter v0

    .line 145
    :try_start_0
    iget-object v1, p0, Ll/n410$k;->a:Ll/n410;

    .line 146
    .line 147
    invoke-static {v1}, Ll/n410;->m(Ll/n410;)J

    .line 148
    .line 149
    .line 150
    move-result-wide v1

    .line 151
    add-long/2addr p1, v1

    .line 152
    iget-object v1, p0, Ll/n410$k;->a:Ll/n410;

    .line 153
    .line 154
    invoke-static {v1}, Ll/n410;->q(Ll/n410;)Ll/ipw;

    .line 155
    .line 156
    .line 157
    move-result-object v1

    .line 158
    if-eqz v1, :cond_5

    .line 159
    .line 160
    iget-object v1, p0, Ll/n410$k;->a:Ll/n410;

    .line 161
    .line 162
    invoke-static {v1}, Ll/n410;->h(Ll/n410;)I

    .line 163
    .line 164
    .line 165
    move-result v1

    .line 166
    const/4 v2, 0x1

    .line 167
    if-ne v1, v2, :cond_5

    .line 168
    .line 169
    iget-object v1, p0, Ll/n410$k;->a:Ll/n410;

    .line 170
    .line 171
    invoke-static {v1}, Ll/n410;->q(Ll/n410;)Ll/ipw;

    .line 172
    .line 173
    .line 174
    move-result-object v1

    .line 175
    const-wide/16 v2, 0x3e8

    .line 176
    .line 177
    div-long v2, p1, v2

    .line 178
    .line 179
    invoke-interface {v1, v2, v3}, Ll/ipw;->n(J)V

    .line 180
    .line 181
    .line 182
    goto :goto_1

    .line 183
    :catchall_0
    move-exception p0

    .line 184
    goto :goto_3

    .line 185
    :cond_5
    :goto_1
    iget-object v1, p0, Ll/n410$k;->a:Ll/n410;

    .line 186
    .line 187
    invoke-static {v1}, Ll/n410;->r(Ll/n410;)J

    .line 188
    .line 189
    .line 190
    move-result-wide v2

    .line 191
    cmp-long v2, v2, p1

    .line 192
    .line 193
    if-gez v2, :cond_6

    .line 194
    .line 195
    goto :goto_2

    .line 196
    :cond_6
    iget-object p0, p0, Ll/n410$k;->a:Ll/n410;

    .line 197
    .line 198
    invoke-static {p0}, Ll/n410;->r(Ll/n410;)J

    .line 199
    .line 200
    .line 201
    move-result-wide p1

    .line 202
    :goto_2
    invoke-static {v1, p1, p2}, Ll/n410;->s(Ll/n410;J)J

    .line 203
    .line 204
    .line 205
    monitor-exit v0

    .line 206
    return-void

    .line 207
    :goto_3
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 208
    throw p0
.end method

.method public d(Landroid/media/MediaFormat;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/n410$k;->a:Ll/n410;

    .line 2
    .line 3
    iget-object p0, p0, Ll/n410;->j:Ll/ka1;

    .line 4
    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Ll/ka1;->e(Landroid/media/MediaFormat;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public e(I)V
    .locals 0

    .line 1
    return-void
.end method

.method public f()V
    .locals 5

    .line 1
    iget-object v0, p0, Ll/n410$k;->a:Ll/n410;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-static {v0, v1}, Ll/n410;->M(Ll/n410;Z)Z

    .line 5
    .line 6
    .line 7
    new-instance v0, Ljava/lang/StringBuilder;

    .line 8
    .line 9
    const-string v1, "onPreviewFinished mIsLoopbackMode="

    .line 10
    .line 11
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    iget-object v1, p0, Ll/n410$k;->a:Ll/n410;

    .line 15
    .line 16
    invoke-static {v1}, Ll/n410;->N(Ll/n410;)Z

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    const-string v1, " mSeekPending="

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    iget-object v1, p0, Ll/n410$k;->a:Ll/n410;

    .line 29
    .line 30
    invoke-static {v1}, Ll/n410;->O(Ll/n410;)Z

    .line 31
    .line 32
    .line 33
    move-result v1

    .line 34
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 35
    .line 36
    .line 37
    const-string v1, " thread="

    .line 38
    .line 39
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 40
    .line 41
    .line 42
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    invoke-virtual {v1}, Ljava/lang/Thread;->getName()Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object v1

    .line 50
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 51
    .line 52
    .line 53
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    const-string v1, "SeekDiag"

    .line 58
    .line 59
    invoke-static {v1, v0}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 60
    .line 61
    .line 62
    iget-object v0, p0, Ll/n410$k;->a:Ll/n410;

    .line 63
    .line 64
    invoke-static {v0}, Ll/n410;->q(Ll/n410;)Ll/ipw;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    if-eqz v0, :cond_0

    .line 69
    .line 70
    iget-object v0, p0, Ll/n410$k;->a:Ll/n410;

    .line 71
    .line 72
    invoke-static {v0}, Ll/n410;->q(Ll/n410;)Ll/ipw;

    .line 73
    .line 74
    .line 75
    move-result-object v0

    .line 76
    const/high16 v1, 0x3f800000    # 1.0f

    .line 77
    .line 78
    invoke-interface {v0, v1}, Ll/ipw;->W(F)V

    .line 79
    .line 80
    .line 81
    iget-object v0, p0, Ll/n410$k;->a:Ll/n410;

    .line 82
    .line 83
    invoke-static {v0}, Ll/n410;->q(Ll/n410;)Ll/ipw;

    .line 84
    .line 85
    .line 86
    move-result-object v0

    .line 87
    invoke-interface {v0}, Ll/ipw;->z()V

    .line 88
    .line 89
    .line 90
    iget-object v0, p0, Ll/n410$k;->a:Ll/n410;

    .line 91
    .line 92
    invoke-static {v0}, Ll/n410;->q(Ll/n410;)Ll/ipw;

    .line 93
    .line 94
    .line 95
    move-result-object v0

    .line 96
    invoke-interface {v0}, Ll/ipw;->l0()V

    .line 97
    .line 98
    .line 99
    iget-object v0, p0, Ll/n410$k;->a:Ll/n410;

    .line 100
    .line 101
    invoke-static {v0}, Ll/n410;->q(Ll/n410;)Ll/ipw;

    .line 102
    .line 103
    .line 104
    move-result-object v0

    .line 105
    iget-object v1, p0, Ll/n410$k;->a:Ll/n410;

    .line 106
    .line 107
    invoke-static {v1}, Ll/n410;->r(Ll/n410;)J

    .line 108
    .line 109
    .line 110
    move-result-wide v1

    .line 111
    const-wide/16 v3, 0x3e8

    .line 112
    .line 113
    div-long/2addr v1, v3

    .line 114
    invoke-interface {v0, v1, v2}, Ll/ipw;->n(J)V

    .line 115
    .line 116
    .line 117
    iget-object p0, p0, Ll/n410$k;->a:Ll/n410;

    .line 118
    .line 119
    const-wide/16 v0, 0x0

    .line 120
    .line 121
    invoke-static {p0, v0, v1}, Ll/n410;->s(Ll/n410;J)J

    .line 122
    .line 123
    .line 124
    :cond_0
    const-string p0, "EditProcess"

    .line 125
    .line 126
    const-string v0, "MomoProcess onPreviewFinished !!!"

    .line 127
    .line 128
    invoke-static {p0, v0}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 129
    .line 130
    .line 131
    return-void
.end method

.method public g(Ljava/nio/ByteBuffer;IJ)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/n410$k;->a:Ll/n410;

    .line 2
    .line 3
    iget-object p0, p0, Ll/n410;->j:Ll/ka1;

    .line 4
    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/ka1;->c(Ljava/nio/ByteBuffer;IJ)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public h(Landroid/media/MediaFormat;)V
    .locals 4

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    goto/16 :goto_4

    .line 4
    .line 5
    :cond_0
    iget-object v0, p0, Ll/n410$k;->a:Ll/n410;

    .line 6
    .line 7
    invoke-static {v0}, Ll/n410;->t(Ll/n410;)Ljava/lang/ref/WeakReference;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    if-eqz v0, :cond_1

    .line 12
    .line 13
    iget-object v0, p0, Ll/n410$k;->a:Ll/n410;

    .line 14
    .line 15
    invoke-static {v0}, Ll/n410;->w(Ll/n410;)Landroid/os/Handler;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    new-instance v1, Ll/n410$k$a;

    .line 20
    .line 21
    invoke-direct {v1, p0}, Ll/n410$k$a;-><init>(Ll/n410$k;)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 25
    .line 26
    .line 27
    :cond_1
    const-string v0, "rotation-degrees"

    .line 28
    .line 29
    invoke-virtual {p1, v0}, Landroid/media/MediaFormat;->containsKey(Ljava/lang/String;)Z

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    const/4 v2, 0x0

    .line 34
    if-eqz v1, :cond_2

    .line 35
    .line 36
    invoke-virtual {p1, v0}, Landroid/media/MediaFormat;->getInteger(Ljava/lang/String;)I

    .line 37
    .line 38
    .line 39
    move-result v0

    .line 40
    goto :goto_0

    .line 41
    :cond_2
    move v0, v2

    .line 42
    :goto_0
    iget-object v1, p0, Ll/n410$k;->a:Ll/n410;

    .line 43
    .line 44
    invoke-static {v1}, Ll/n410;->x(Ll/n410;)I

    .line 45
    .line 46
    .line 47
    move-result v1

    .line 48
    if-eq v0, v1, :cond_5

    .line 49
    .line 50
    const-string v1, "width"

    .line 51
    .line 52
    invoke-virtual {p1, v1}, Landroid/media/MediaFormat;->containsKey(Ljava/lang/String;)Z

    .line 53
    .line 54
    .line 55
    move-result v3

    .line 56
    if-eqz v3, :cond_3

    .line 57
    .line 58
    iget-object v3, p0, Ll/n410$k;->a:Ll/n410;

    .line 59
    .line 60
    invoke-virtual {p1, v1}, Landroid/media/MediaFormat;->getInteger(Ljava/lang/String;)I

    .line 61
    .line 62
    .line 63
    move-result v1

    .line 64
    invoke-static {v3, v1}, Ll/n410;->z(Ll/n410;I)I

    .line 65
    .line 66
    .line 67
    :cond_3
    const-string v1, "height"

    .line 68
    .line 69
    invoke-virtual {p1, v1}, Landroid/media/MediaFormat;->containsKey(Ljava/lang/String;)Z

    .line 70
    .line 71
    .line 72
    move-result v3

    .line 73
    if-eqz v3, :cond_4

    .line 74
    .line 75
    iget-object v3, p0, Ll/n410$k;->a:Ll/n410;

    .line 76
    .line 77
    invoke-virtual {p1, v1}, Landroid/media/MediaFormat;->getInteger(Ljava/lang/String;)I

    .line 78
    .line 79
    .line 80
    move-result p1

    .line 81
    invoke-static {v3, p1}, Ll/n410;->B(Ll/n410;I)I

    .line 82
    .line 83
    .line 84
    :cond_4
    const/4 p1, 0x1

    .line 85
    goto :goto_1

    .line 86
    :cond_5
    move p1, v2

    .line 87
    :goto_1
    iget-object v1, p0, Ll/n410$k;->a:Ll/n410;

    .line 88
    .line 89
    invoke-static {v1}, Ll/n410;->C(Ll/n410;)Z

    .line 90
    .line 91
    .line 92
    move-result v1

    .line 93
    iget-object v3, p0, Ll/n410$k;->a:Ll/n410;

    .line 94
    .line 95
    if-nez v1, :cond_7

    .line 96
    .line 97
    iget-object v0, v3, Ll/n410;->k:Ll/eli0;

    .line 98
    .line 99
    if-eqz v0, :cond_a

    .line 100
    .line 101
    if-eqz p1, :cond_6

    .line 102
    .line 103
    invoke-static {v3}, Ll/n410;->x(Ll/n410;)I

    .line 104
    .line 105
    .line 106
    move-result p1

    .line 107
    invoke-virtual {v0, p1}, Ll/eli0;->x0(I)V

    .line 108
    .line 109
    .line 110
    goto :goto_2

    .line 111
    :cond_6
    invoke-virtual {v0, v2}, Ll/eli0;->x0(I)V

    .line 112
    .line 113
    .line 114
    :goto_2
    iget-object p1, p0, Ll/n410$k;->a:Ll/n410;

    .line 115
    .line 116
    iget-object v0, p1, Ll/n410;->k:Ll/eli0;

    .line 117
    .line 118
    new-instance v1, Ll/crf0;

    .line 119
    .line 120
    invoke-static {p1}, Ll/n410;->y(Ll/n410;)I

    .line 121
    .line 122
    .line 123
    move-result p1

    .line 124
    iget-object p0, p0, Ll/n410$k;->a:Ll/n410;

    .line 125
    .line 126
    invoke-static {p0}, Ll/n410;->A(Ll/n410;)I

    .line 127
    .line 128
    .line 129
    move-result p0

    .line 130
    invoke-direct {v1, p1, p0}, Ll/crf0;-><init>(II)V

    .line 131
    .line 132
    .line 133
    invoke-virtual {v0, v1}, Ll/qt2;->R(Ljava/lang/Object;)V

    .line 134
    .line 135
    .line 136
    return-void

    .line 137
    :cond_7
    iget-object p1, v3, Ll/n410;->k:Ll/eli0;

    .line 138
    .line 139
    if-eqz p1, :cond_a

    .line 140
    .line 141
    invoke-static {v3}, Ll/n410;->x(Ll/n410;)I

    .line 142
    .line 143
    .line 144
    move-result v1

    .line 145
    invoke-virtual {p1, v1}, Ll/eli0;->x0(I)V

    .line 146
    .line 147
    .line 148
    const/16 p1, 0x5a

    .line 149
    .line 150
    if-eq v0, p1, :cond_9

    .line 151
    .line 152
    const/16 p1, 0x10e

    .line 153
    .line 154
    if-ne v0, p1, :cond_8

    .line 155
    .line 156
    goto :goto_3

    .line 157
    :cond_8
    iget-object p1, p0, Ll/n410$k;->a:Ll/n410;

    .line 158
    .line 159
    iget-object v0, p1, Ll/n410;->k:Ll/eli0;

    .line 160
    .line 161
    new-instance v1, Ll/crf0;

    .line 162
    .line 163
    invoke-static {p1}, Ll/n410;->y(Ll/n410;)I

    .line 164
    .line 165
    .line 166
    move-result p1

    .line 167
    iget-object p0, p0, Ll/n410$k;->a:Ll/n410;

    .line 168
    .line 169
    invoke-static {p0}, Ll/n410;->A(Ll/n410;)I

    .line 170
    .line 171
    .line 172
    move-result p0

    .line 173
    invoke-direct {v1, p1, p0}, Ll/crf0;-><init>(II)V

    .line 174
    .line 175
    .line 176
    invoke-virtual {v0, v1}, Ll/qt2;->R(Ljava/lang/Object;)V

    .line 177
    .line 178
    .line 179
    return-void

    .line 180
    :cond_9
    :goto_3
    iget-object p1, p0, Ll/n410$k;->a:Ll/n410;

    .line 181
    .line 182
    iget-object v0, p1, Ll/n410;->k:Ll/eli0;

    .line 183
    .line 184
    new-instance v1, Ll/crf0;

    .line 185
    .line 186
    invoke-static {p1}, Ll/n410;->A(Ll/n410;)I

    .line 187
    .line 188
    .line 189
    move-result p1

    .line 190
    iget-object p0, p0, Ll/n410$k;->a:Ll/n410;

    .line 191
    .line 192
    invoke-static {p0}, Ll/n410;->y(Ll/n410;)I

    .line 193
    .line 194
    .line 195
    move-result p0

    .line 196
    invoke-direct {v1, p1, p0}, Ll/crf0;-><init>(II)V

    .line 197
    .line 198
    .line 199
    invoke-virtual {v0, v1}, Ll/qt2;->R(Ljava/lang/Object;)V

    .line 200
    .line 201
    .line 202
    :cond_a
    :goto_4
    return-void
.end method

.method public i(Landroid/graphics/SurfaceTexture;)V
    .locals 5

    .line 1
    iget-object v0, p0, Ll/n410$k;->a:Ll/n410;

    .line 2
    .line 3
    invoke-static {v0}, Ll/n410;->E(Ll/n410;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/n410$k;->a:Ll/n410;

    .line 7
    .line 8
    iget-object v1, v0, Ll/n410;->k:Ll/eli0;

    .line 9
    .line 10
    if-eqz v1, :cond_3

    .line 11
    .line 12
    invoke-static {v0}, Ll/n410;->K(Ll/n410;)I

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-lez v0, :cond_0

    .line 17
    .line 18
    iget-object v0, p0, Ll/n410$k;->a:Ll/n410;

    .line 19
    .line 20
    invoke-static {v0}, Ll/n410;->K(Ll/n410;)I

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    const/16 v1, 0xf

    .line 25
    .line 26
    if-gt v0, v1, :cond_0

    .line 27
    .line 28
    iget-object v0, p0, Ll/n410$k;->a:Ll/n410;

    .line 29
    .line 30
    iget-object v0, v0, Ll/n410;->C0:Ljava/lang/Object;

    .line 31
    .line 32
    monitor-enter v0

    .line 33
    :try_start_0
    iget-object v1, p0, Ll/n410$k;->a:Ll/n410;

    .line 34
    .line 35
    iget-object v2, v1, Ll/n410;->C0:Ljava/lang/Object;

    .line 36
    .line 37
    invoke-static {v1}, Ll/n410;->K(Ll/n410;)I

    .line 38
    .line 39
    .line 40
    move-result v1

    .line 41
    int-to-long v3, v1

    .line 42
    invoke-virtual {v2, v3, v4}, Ljava/lang/Object;->wait(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 43
    .line 44
    .line 45
    goto :goto_0

    .line 46
    :catchall_0
    move-exception p0

    .line 47
    goto :goto_1

    .line 48
    :catch_0
    move-exception v1

    .line 49
    :try_start_1
    const-string v2, "mediaRender"

    .line 50
    .line 51
    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object v1

    .line 55
    invoke-static {v2, v1}, Lcom/cosmos/mdlog/MDLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 56
    .line 57
    .line 58
    :goto_0
    monitor-exit v0

    .line 59
    goto :goto_2

    .line 60
    :goto_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 61
    throw p0

    .line 62
    :cond_0
    :goto_2
    iget-object v0, p0, Ll/n410$k;->a:Ll/n410;

    .line 63
    .line 64
    invoke-static {v0}, Ll/n410;->F(Ll/n410;)Ll/crf0;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    iget-object v1, p0, Ll/n410$k;->a:Ll/n410;

    .line 69
    .line 70
    if-nez v0, :cond_1

    .line 71
    .line 72
    new-instance v0, Ll/crf0;

    .line 73
    .line 74
    invoke-static {v1}, Ll/n410;->u(Ll/n410;)I

    .line 75
    .line 76
    .line 77
    move-result v1

    .line 78
    iget-object v2, p0, Ll/n410$k;->a:Ll/n410;

    .line 79
    .line 80
    invoke-static {v2}, Ll/n410;->v(Ll/n410;)I

    .line 81
    .line 82
    .line 83
    move-result v2

    .line 84
    invoke-direct {v0, v1, v2}, Ll/crf0;-><init>(II)V

    .line 85
    .line 86
    .line 87
    goto :goto_3

    .line 88
    :cond_1
    invoke-static {v1}, Ll/n410;->F(Ll/n410;)Ll/crf0;

    .line 89
    .line 90
    .line 91
    move-result-object v0

    .line 92
    :goto_3
    iget-object v1, p0, Ll/n410$k;->a:Ll/n410;

    .line 93
    .line 94
    invoke-static {v1}, Ll/n410;->G(Ll/n410;)Z

    .line 95
    .line 96
    .line 97
    move-result v1

    .line 98
    if-eqz v1, :cond_2

    .line 99
    .line 100
    iget-object v1, p0, Ll/n410$k;->a:Ll/n410;

    .line 101
    .line 102
    iget-object v1, v1, Ll/n410;->k:Ll/eli0;

    .line 103
    .line 104
    check-cast v1, Ll/abh0;

    .line 105
    .line 106
    invoke-virtual {v1}, Ll/abh0;->H0()Landroid/graphics/SurfaceTexture;

    .line 107
    .line 108
    .line 109
    move-result-object v1

    .line 110
    if-eqz v1, :cond_2

    .line 111
    .line 112
    :try_start_2
    iget-object v1, p0, Ll/n410$k;->a:Ll/n410;

    .line 113
    .line 114
    iget-object v1, v1, Ll/n410;->k:Ll/eli0;

    .line 115
    .line 116
    check-cast v1, Ll/abh0;

    .line 117
    .line 118
    invoke-virtual {v1}, Ll/abh0;->M0()V
    :try_end_2
    .catch Ljava/lang/RuntimeException; {:try_start_2 .. :try_end_2} :catch_1

    .line 119
    .line 120
    .line 121
    goto :goto_4

    .line 122
    :catch_1
    const-string v1, "EditProcess"

    .line 123
    .line 124
    const-string v2, "SurfaceTexture updateTexImage failed!!"

    .line 125
    .line 126
    invoke-static {v1, v2}, Lcom/cosmos/mdlog/MDLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 127
    .line 128
    .line 129
    :cond_2
    :goto_4
    iget-object v1, p0, Ll/n410$k;->a:Ll/n410;

    .line 130
    .line 131
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 132
    .line 133
    .line 134
    iget-object v1, p0, Ll/n410$k;->a:Ll/n410;

    .line 135
    .line 136
    iget-object v1, v1, Ll/n410;->k:Ll/eli0;

    .line 137
    .line 138
    check-cast v1, Ll/abh0;

    .line 139
    .line 140
    invoke-virtual {v1, p1}, Ll/abh0;->onFrameAvailable(Landroid/graphics/SurfaceTexture;)V

    .line 141
    .line 142
    .line 143
    iget-object p1, p0, Ll/n410$k;->a:Ll/n410;

    .line 144
    .line 145
    invoke-static {p1}, Ll/n410;->h(Ll/n410;)I

    .line 146
    .line 147
    .line 148
    move-result p1

    .line 149
    const/4 v1, 0x1

    .line 150
    if-ne p1, v1, :cond_3

    .line 151
    .line 152
    iget-object p1, p0, Ll/n410$k;->a:Ll/n410;

    .line 153
    .line 154
    invoke-static {p1}, Ll/n410;->H(Ll/n410;)Z

    .line 155
    .line 156
    .line 157
    move-result p1

    .line 158
    if-eqz p1, :cond_3

    .line 159
    .line 160
    iget-object p1, p0, Ll/n410$k;->a:Ll/n410;

    .line 161
    .line 162
    iget-object v1, p1, Ll/n410;->k:Ll/eli0;

    .line 163
    .line 164
    invoke-static {p1}, Ll/n410;->J(Ll/n410;)Ljava/lang/Object;

    .line 165
    .line 166
    .line 167
    move-result-object p1

    .line 168
    invoke-virtual {v1, p1, v0}, Ll/eli0;->y0(Ljava/lang/Object;Ll/crf0;)V

    .line 169
    .line 170
    .line 171
    iget-object p0, p0, Ll/n410$k;->a:Ll/n410;

    .line 172
    .line 173
    const/4 p1, 0x0

    .line 174
    invoke-static {p0, p1}, Ll/n410;->I(Ll/n410;Z)Z

    .line 175
    .line 176
    .line 177
    :cond_3
    return-void
.end method

.method public onFinished()V
    .locals 5

    .line 1
    iget-object v0, p0, Ll/n410$k;->a:Ll/n410;

    .line 2
    .line 3
    invoke-static {v0}, Ll/n410;->h(Ll/n410;)I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Ll/n410$k;->a:Ll/n410;

    .line 10
    .line 11
    invoke-static {v0}, Ll/n410;->P(Ll/n410;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    const-string v0, "EditProcess"

    .line 15
    .line 16
    const-string v1, "On process Finished"

    .line 17
    .line 18
    invoke-static {v0, v1}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    new-instance v0, Ljava/lang/StringBuilder;

    .line 22
    .line 23
    const-string v1, "onFinished mMode="

    .line 24
    .line 25
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    iget-object v1, p0, Ll/n410$k;->a:Ll/n410;

    .line 29
    .line 30
    invoke-static {v1}, Ll/n410;->h(Ll/n410;)I

    .line 31
    .line 32
    .line 33
    move-result v1

    .line 34
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 35
    .line 36
    .line 37
    const-string v1, " mIsLoopbackMode="

    .line 38
    .line 39
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 40
    .line 41
    .line 42
    iget-object v1, p0, Ll/n410$k;->a:Ll/n410;

    .line 43
    .line 44
    invoke-static {v1}, Ll/n410;->N(Ll/n410;)Z

    .line 45
    .line 46
    .line 47
    move-result v1

    .line 48
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 49
    .line 50
    .line 51
    const-string v1, " mSeekPending="

    .line 52
    .line 53
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 54
    .line 55
    .line 56
    iget-object v1, p0, Ll/n410$k;->a:Ll/n410;

    .line 57
    .line 58
    invoke-static {v1}, Ll/n410;->O(Ll/n410;)Z

    .line 59
    .line 60
    .line 61
    move-result v1

    .line 62
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 63
    .line 64
    .line 65
    const-string v1, " thread="

    .line 66
    .line 67
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 68
    .line 69
    .line 70
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    .line 71
    .line 72
    .line 73
    move-result-object v1

    .line 74
    invoke-virtual {v1}, Ljava/lang/Thread;->getName()Ljava/lang/String;

    .line 75
    .line 76
    .line 77
    move-result-object v1

    .line 78
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 79
    .line 80
    .line 81
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 82
    .line 83
    .line 84
    move-result-object v0

    .line 85
    const-string v1, "SeekDiag"

    .line 86
    .line 87
    invoke-static {v1, v0}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 88
    .line 89
    .line 90
    iget-object v0, p0, Ll/n410$k;->a:Ll/n410;

    .line 91
    .line 92
    const/4 v1, 0x0

    .line 93
    invoke-static {v0, v1}, Ll/n410;->M(Ll/n410;Z)Z

    .line 94
    .line 95
    .line 96
    iget-object v0, p0, Ll/n410$k;->a:Ll/n410;

    .line 97
    .line 98
    invoke-static {v0}, Ll/n410;->h(Ll/n410;)I

    .line 99
    .line 100
    .line 101
    move-result v0

    .line 102
    iget-object v1, p0, Ll/n410$k;->a:Ll/n410;

    .line 103
    .line 104
    const/high16 v2, 0x3f800000    # 1.0f

    .line 105
    .line 106
    const/4 v3, 0x1

    .line 107
    if-ne v0, v3, :cond_1

    .line 108
    .line 109
    invoke-static {v1}, Ll/n410;->q(Ll/n410;)Ll/ipw;

    .line 110
    .line 111
    .line 112
    move-result-object v0

    .line 113
    if-eqz v0, :cond_2

    .line 114
    .line 115
    iget-object v0, p0, Ll/n410$k;->a:Ll/n410;

    .line 116
    .line 117
    invoke-static {v0}, Ll/n410;->q(Ll/n410;)Ll/ipw;

    .line 118
    .line 119
    .line 120
    move-result-object v0

    .line 121
    invoke-interface {v0}, Ll/ipw;->z()V

    .line 122
    .line 123
    .line 124
    iget-object v0, p0, Ll/n410$k;->a:Ll/n410;

    .line 125
    .line 126
    invoke-static {v0}, Ll/n410;->q(Ll/n410;)Ll/ipw;

    .line 127
    .line 128
    .line 129
    move-result-object v0

    .line 130
    invoke-interface {v0}, Ll/ipw;->l0()V

    .line 131
    .line 132
    .line 133
    iget-object v0, p0, Ll/n410$k;->a:Ll/n410;

    .line 134
    .line 135
    invoke-static {v0}, Ll/n410;->q(Ll/n410;)Ll/ipw;

    .line 136
    .line 137
    .line 138
    move-result-object v0

    .line 139
    invoke-interface {v0, v2}, Ll/ipw;->W(F)V

    .line 140
    .line 141
    .line 142
    iget-object v0, p0, Ll/n410$k;->a:Ll/n410;

    .line 143
    .line 144
    invoke-static {v0}, Ll/n410;->q(Ll/n410;)Ll/ipw;

    .line 145
    .line 146
    .line 147
    move-result-object v0

    .line 148
    iget-object v1, p0, Ll/n410$k;->a:Ll/n410;

    .line 149
    .line 150
    invoke-static {v1}, Ll/n410;->r(Ll/n410;)J

    .line 151
    .line 152
    .line 153
    move-result-wide v1

    .line 154
    const-wide/16 v3, 0x3e8

    .line 155
    .line 156
    div-long/2addr v1, v3

    .line 157
    invoke-interface {v0, v1, v2}, Ll/ipw;->n(J)V

    .line 158
    .line 159
    .line 160
    iget-object p0, p0, Ll/n410$k;->a:Ll/n410;

    .line 161
    .line 162
    const-wide/16 v0, 0x0

    .line 163
    .line 164
    invoke-static {p0, v0, v1}, Ll/n410;->s(Ll/n410;J)J

    .line 165
    .line 166
    .line 167
    return-void

    .line 168
    :cond_1
    invoke-static {v1}, Ll/n410;->g(Ll/n410;)Ll/kpw;

    .line 169
    .line 170
    .line 171
    move-result-object v0

    .line 172
    if-eqz v0, :cond_2

    .line 173
    .line 174
    iget-object v0, p0, Ll/n410$k;->a:Ll/n410;

    .line 175
    .line 176
    invoke-static {v0}, Ll/n410;->g(Ll/n410;)Ll/kpw;

    .line 177
    .line 178
    .line 179
    move-result-object v0

    .line 180
    invoke-interface {v0, v2}, Ll/kpw;->onProcessProgress(F)V

    .line 181
    .line 182
    .line 183
    iget-object v0, p0, Ll/n410$k;->a:Ll/n410;

    .line 184
    .line 185
    invoke-static {v0}, Ll/n410;->g(Ll/n410;)Ll/kpw;

    .line 186
    .line 187
    .line 188
    move-result-object v0

    .line 189
    invoke-interface {v0}, Ll/kpw;->a()V

    .line 190
    .line 191
    .line 192
    iget-object p0, p0, Ll/n410$k;->a:Ll/n410;

    .line 193
    .line 194
    invoke-static {p0}, Ll/n410;->j(Ll/n410;)J

    .line 195
    .line 196
    .line 197
    move-result-wide v0

    .line 198
    invoke-static {p0, v0, v1}, Ll/n410;->Q(Ll/n410;J)V

    .line 199
    .line 200
    .line 201
    :cond_2
    return-void
.end method

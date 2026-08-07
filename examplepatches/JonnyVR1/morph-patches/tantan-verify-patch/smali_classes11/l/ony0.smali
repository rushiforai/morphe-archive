.class public final Ll/ony0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/wny0;


# static fields
.field public static final i:Ll/fpw0;

.field public static final j:Ljava/util/Random;


# instance fields
.field public final a:Ll/wyt0;

.field public final b:Ll/hwt0;

.field public final c:Ljava/util/HashMap;

.field public final d:Ll/fpw0;

.field public e:Ll/uny0;

.field public f:Ll/d0u0;

.field public g:Ljava/lang/String;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public h:J


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    sget-object v0, Ll/kny0;->a:Ll/kny0;

    .line 2
    .line 3
    sput-object v0, Ll/ony0;->i:Ll/fpw0;

    .line 4
    .line 5
    new-instance v0, Ljava/util/Random;

    .line 6
    .line 7
    invoke-direct {v0}, Ljava/util/Random;-><init>()V

    .line 8
    .line 9
    .line 10
    sput-object v0, Ll/ony0;->j:Ljava/util/Random;

    .line 11
    .line 12
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    const/4 p0, 0x0

    .line 36
    throw p0
.end method

.method public constructor <init>(Ll/fpw0;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/ony0;->d:Ll/fpw0;

    .line 5
    .line 6
    new-instance p1, Ll/wyt0;

    .line 7
    .line 8
    invoke-direct {p1}, Ll/wyt0;-><init>()V

    .line 9
    .line 10
    .line 11
    iput-object p1, p0, Ll/ony0;->a:Ll/wyt0;

    .line 12
    .line 13
    new-instance p1, Ll/hwt0;

    .line 14
    .line 15
    invoke-direct {p1}, Ll/hwt0;-><init>()V

    .line 16
    .line 17
    .line 18
    iput-object p1, p0, Ll/ony0;->b:Ll/hwt0;

    .line 19
    .line 20
    new-instance p1, Ljava/util/HashMap;

    .line 21
    .line 22
    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    .line 23
    .line 24
    .line 25
    iput-object p1, p0, Ll/ony0;->c:Ljava/util/HashMap;

    .line 26
    .line 27
    sget-object p1, Ll/d0u0;->a:Ll/d0u0;

    .line 28
    .line 29
    iput-object p1, p0, Ll/ony0;->f:Ll/d0u0;

    .line 30
    .line 31
    const-wide/16 v0, -0x1

    .line 32
    .line 33
    iput-wide v0, p0, Ll/ony0;->h:J

    .line 34
    .line 35
    return-void
.end method

.method public static bridge synthetic g(Ll/ony0;)J
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/ony0;->k()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    return-wide v0
.end method

.method public static bridge synthetic h(Ll/ony0;)Ll/hwt0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ony0;->b:Ll/hwt0;

    .line 2
    .line 3
    return-object p0
.end method

.method public static bridge synthetic i(Ll/ony0;)Ll/wyt0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ony0;->a:Ll/wyt0;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic j()Ljava/lang/String;
    .locals 1

    .line 1
    invoke-static {}, Ll/ony0;->m()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    return-object v0
.end method

.method public static m()Ljava/lang/String;
    .locals 2

    .line 1
    const/16 v0, 0xc

    .line 2
    .line 3
    new-array v0, v0, [B

    .line 4
    .line 5
    sget-object v1, Ll/ony0;->j:Ljava/util/Random;

    .line 6
    .line 7
    invoke-virtual {v1, v0}, Ljava/util/Random;->nextBytes([B)V

    .line 8
    .line 9
    .line 10
    const/16 v1, 0xa

    .line 11
    .line 12
    invoke-static {v0, v1}, Landroid/util/Base64;->encodeToString([BI)Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    return-object v0
.end method


# virtual methods
.method public final declared-synchronized a(Ll/yfy0;)V
    .locals 4

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Ll/ony0;->g:Ljava/lang/String;

    .line 3
    .line 4
    if-eqz v0, :cond_1

    .line 5
    .line 6
    iget-object v1, p0, Ll/ony0;->c:Ljava/util/HashMap;

    .line 7
    .line 8
    invoke-virtual {v1, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    check-cast v0, Ll/mny0;

    .line 13
    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    invoke-virtual {p0, v0}, Ll/ony0;->n(Ll/mny0;)V

    .line 17
    .line 18
    .line 19
    goto :goto_0

    .line 20
    :catchall_0
    move-exception p1

    .line 21
    goto :goto_2

    .line 22
    :cond_0
    const/4 p1, 0x0

    .line 23
    throw p1

    .line 24
    :cond_1
    :goto_0
    iget-object v0, p0, Ll/ony0;->c:Ljava/util/HashMap;

    .line 25
    .line 26
    invoke-virtual {v0}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    :cond_2
    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 35
    .line 36
    .line 37
    move-result v1

    .line 38
    if-eqz v1, :cond_3

    .line 39
    .line 40
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    check-cast v1, Ll/mny0;

    .line 45
    .line 46
    invoke-interface {v0}, Ljava/util/Iterator;->remove()V

    .line 47
    .line 48
    .line 49
    invoke-static {v1}, Ll/mny0;->i(Ll/mny0;)Z

    .line 50
    .line 51
    .line 52
    move-result v2

    .line 53
    if-eqz v2, :cond_2

    .line 54
    .line 55
    iget-object v2, p0, Ll/ony0;->e:Ll/uny0;

    .line 56
    .line 57
    if-eqz v2, :cond_2

    .line 58
    .line 59
    invoke-static {v1}, Ll/mny0;->d(Ll/mny0;)Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object v1

    .line 63
    const/4 v3, 0x0

    .line 64
    invoke-interface {v2, p1, v1, v3}, Ll/uny0;->i(Ll/yfy0;Ljava/lang/String;Z)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 65
    .line 66
    .line 67
    goto :goto_1

    .line 68
    :cond_3
    monitor-exit p0

    .line 69
    return-void

    .line 70
    :goto_2
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 71
    throw p1
.end method

.method public final declared-synchronized b(Ll/yfy0;)V
    .locals 9

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Ll/ony0;->e:Ll/uny0;

    .line 3
    .line 4
    if-eqz v0, :cond_6

    .line 5
    .line 6
    iget-object v0, p1, Ll/yfy0;->b:Ll/d0u0;

    .line 7
    .line 8
    invoke-virtual {v0}, Ll/d0u0;->o()Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    goto/16 :goto_1

    .line 15
    .line 16
    :cond_0
    iget-object v0, p1, Ll/yfy0;->d:Ll/kzy0;

    .line 17
    .line 18
    if-eqz v0, :cond_1

    .line 19
    .line 20
    invoke-virtual {p0}, Ll/ony0;->k()J

    .line 21
    .line 22
    .line 23
    move-result-wide v1

    .line 24
    iget-wide v3, v0, Ll/kzy0;->d:J

    .line 25
    .line 26
    cmp-long v0, v3, v1

    .line 27
    .line 28
    if-ltz v0, :cond_5

    .line 29
    .line 30
    iget-object v0, p0, Ll/ony0;->c:Ljava/util/HashMap;

    .line 31
    .line 32
    iget-object v1, p0, Ll/ony0;->g:Ljava/lang/String;

    .line 33
    .line 34
    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    check-cast v0, Ll/mny0;

    .line 39
    .line 40
    if-eqz v0, :cond_1

    .line 41
    .line 42
    invoke-static {v0}, Ll/mny0;->b(Ll/mny0;)J

    .line 43
    .line 44
    .line 45
    move-result-wide v1

    .line 46
    const-wide/16 v3, -0x1

    .line 47
    .line 48
    cmp-long v1, v1, v3

    .line 49
    .line 50
    if-nez v1, :cond_1

    .line 51
    .line 52
    invoke-static {v0}, Ll/mny0;->a(Ll/mny0;)I

    .line 53
    .line 54
    .line 55
    move-result v0

    .line 56
    iget v1, p1, Ll/yfy0;->c:I

    .line 57
    .line 58
    if-ne v0, v1, :cond_5

    .line 59
    .line 60
    goto :goto_0

    .line 61
    :catchall_0
    move-exception p1

    .line 62
    goto/16 :goto_2

    .line 63
    .line 64
    :cond_1
    :goto_0
    iget v0, p1, Ll/yfy0;->c:I

    .line 65
    .line 66
    iget-object v1, p1, Ll/yfy0;->d:Ll/kzy0;

    .line 67
    .line 68
    invoke-virtual {p0, v0, v1}, Ll/ony0;->l(ILl/kzy0;)Ll/mny0;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    iget-object v1, p0, Ll/ony0;->g:Ljava/lang/String;

    .line 73
    .line 74
    if-nez v1, :cond_2

    .line 75
    .line 76
    invoke-static {v0}, Ll/mny0;->d(Ll/mny0;)Ljava/lang/String;

    .line 77
    .line 78
    .line 79
    move-result-object v1

    .line 80
    iput-object v1, p0, Ll/ony0;->g:Ljava/lang/String;

    .line 81
    .line 82
    :cond_2
    iget-object v1, p1, Ll/yfy0;->d:Ll/kzy0;

    .line 83
    .line 84
    const/4 v2, 0x1

    .line 85
    if-eqz v1, :cond_3

    .line 86
    .line 87
    invoke-virtual {v1}, Ll/kzy0;->b()Z

    .line 88
    .line 89
    .line 90
    move-result v3

    .line 91
    if-eqz v3, :cond_3

    .line 92
    .line 93
    iget-object v3, v1, Ll/kzy0;->a:Ljava/lang/Object;

    .line 94
    .line 95
    iget-wide v4, v1, Ll/kzy0;->d:J

    .line 96
    .line 97
    iget v1, v1, Ll/kzy0;->b:I

    .line 98
    .line 99
    new-instance v6, Ll/kzy0;

    .line 100
    .line 101
    invoke-direct {v6, v3, v4, v5, v1}, Ll/kzy0;-><init>(Ljava/lang/Object;JI)V

    .line 102
    .line 103
    .line 104
    iget v1, p1, Ll/yfy0;->c:I

    .line 105
    .line 106
    invoke-virtual {p0, v1, v6}, Ll/ony0;->l(ILl/kzy0;)Ll/mny0;

    .line 107
    .line 108
    .line 109
    move-result-object v1

    .line 110
    invoke-static {v1}, Ll/mny0;->i(Ll/mny0;)Z

    .line 111
    .line 112
    .line 113
    move-result v3

    .line 114
    if-nez v3, :cond_3

    .line 115
    .line 116
    invoke-static {v1, v2}, Ll/mny0;->f(Ll/mny0;Z)V

    .line 117
    .line 118
    .line 119
    iget-object v3, p1, Ll/yfy0;->b:Ll/d0u0;

    .line 120
    .line 121
    iget-object v4, p1, Ll/yfy0;->d:Ll/kzy0;

    .line 122
    .line 123
    iget-object v5, p0, Ll/ony0;->b:Ll/hwt0;

    .line 124
    .line 125
    iget-object v4, v4, Ll/kzy0;->a:Ljava/lang/Object;

    .line 126
    .line 127
    invoke-virtual {v3, v4, v5}, Ll/d0u0;->n(Ljava/lang/Object;Ll/hwt0;)Ll/hwt0;

    .line 128
    .line 129
    .line 130
    iget-object v3, p0, Ll/ony0;->b:Ll/hwt0;

    .line 131
    .line 132
    iget-object v4, p1, Ll/yfy0;->d:Ll/kzy0;

    .line 133
    .line 134
    iget v4, v4, Ll/kzy0;->b:I

    .line 135
    .line 136
    invoke-virtual {v3, v4}, Ll/hwt0;->i(I)J

    .line 137
    .line 138
    .line 139
    const-wide/16 v3, 0x0

    .line 140
    .line 141
    invoke-static {v3, v4}, Ll/mpw0;->I(J)J

    .line 142
    .line 143
    .line 144
    move-result-wide v5

    .line 145
    invoke-static {v3, v4}, Ll/mpw0;->I(J)J

    .line 146
    .line 147
    .line 148
    move-result-wide v7

    .line 149
    add-long/2addr v5, v7

    .line 150
    invoke-static {v3, v4, v5, v6}, Ljava/lang/Math;->max(JJ)J

    .line 151
    .line 152
    .line 153
    invoke-static {v1}, Ll/mny0;->d(Ll/mny0;)Ljava/lang/String;

    .line 154
    .line 155
    .line 156
    :cond_3
    invoke-static {v0}, Ll/mny0;->i(Ll/mny0;)Z

    .line 157
    .line 158
    .line 159
    move-result v1

    .line 160
    if-nez v1, :cond_4

    .line 161
    .line 162
    invoke-static {v0, v2}, Ll/mny0;->f(Ll/mny0;Z)V

    .line 163
    .line 164
    .line 165
    invoke-static {v0}, Ll/mny0;->d(Ll/mny0;)Ljava/lang/String;

    .line 166
    .line 167
    .line 168
    :cond_4
    invoke-static {v0}, Ll/mny0;->d(Ll/mny0;)Ljava/lang/String;

    .line 169
    .line 170
    .line 171
    move-result-object v1

    .line 172
    iget-object v3, p0, Ll/ony0;->g:Ljava/lang/String;

    .line 173
    .line 174
    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 175
    .line 176
    .line 177
    move-result v1

    .line 178
    if-eqz v1, :cond_5

    .line 179
    .line 180
    invoke-static {v0}, Ll/mny0;->h(Ll/mny0;)Z

    .line 181
    .line 182
    .line 183
    move-result v1

    .line 184
    if-nez v1, :cond_5

    .line 185
    .line 186
    invoke-static {v0, v2}, Ll/mny0;->e(Ll/mny0;Z)V

    .line 187
    .line 188
    .line 189
    iget-object v1, p0, Ll/ony0;->e:Ll/uny0;

    .line 190
    .line 191
    invoke-static {v0}, Ll/mny0;->d(Ll/mny0;)Ljava/lang/String;

    .line 192
    .line 193
    .line 194
    move-result-object v0

    .line 195
    invoke-interface {v1, p1, v0}, Ll/uny0;->k(Ll/yfy0;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 196
    .line 197
    .line 198
    monitor-exit p0

    .line 199
    return-void

    .line 200
    :cond_5
    :goto_1
    monitor-exit p0

    .line 201
    return-void

    .line 202
    :cond_6
    const/4 p1, 0x0

    .line 203
    :try_start_1
    throw p1

    .line 204
    :goto_2
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 205
    throw p1
.end method

.method public final c(Ll/uny0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/ony0;->e:Ll/uny0;

    .line 2
    .line 3
    return-void
.end method

.method public final declared-synchronized d(Ll/yfy0;)V
    .locals 5

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Ll/ony0;->e:Ll/uny0;

    .line 3
    .line 4
    if-eqz v0, :cond_4

    .line 5
    .line 6
    iget-object v0, p0, Ll/ony0;->f:Ll/d0u0;

    .line 7
    .line 8
    iget-object v1, p1, Ll/yfy0;->b:Ll/d0u0;

    .line 9
    .line 10
    iput-object v1, p0, Ll/ony0;->f:Ll/d0u0;

    .line 11
    .line 12
    iget-object v1, p0, Ll/ony0;->c:Ljava/util/HashMap;

    .line 13
    .line 14
    invoke-virtual {v1}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    invoke-interface {v1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 23
    .line 24
    .line 25
    move-result v2

    .line 26
    if-eqz v2, :cond_3

    .line 27
    .line 28
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object v2

    .line 32
    check-cast v2, Ll/mny0;

    .line 33
    .line 34
    iget-object v3, p0, Ll/ony0;->f:Ll/d0u0;

    .line 35
    .line 36
    invoke-virtual {v2, v0, v3}, Ll/mny0;->l(Ll/d0u0;Ll/d0u0;)Z

    .line 37
    .line 38
    .line 39
    move-result v3

    .line 40
    if-eqz v3, :cond_1

    .line 41
    .line 42
    invoke-virtual {v2, p1}, Ll/mny0;->k(Ll/yfy0;)Z

    .line 43
    .line 44
    .line 45
    move-result v3

    .line 46
    if-eqz v3, :cond_0

    .line 47
    .line 48
    goto :goto_1

    .line 49
    :catchall_0
    move-exception p1

    .line 50
    goto :goto_2

    .line 51
    :cond_1
    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->remove()V

    .line 52
    .line 53
    .line 54
    invoke-static {v2}, Ll/mny0;->i(Ll/mny0;)Z

    .line 55
    .line 56
    .line 57
    move-result v3

    .line 58
    if-eqz v3, :cond_0

    .line 59
    .line 60
    invoke-static {v2}, Ll/mny0;->d(Ll/mny0;)Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object v3

    .line 64
    iget-object v4, p0, Ll/ony0;->g:Ljava/lang/String;

    .line 65
    .line 66
    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 67
    .line 68
    .line 69
    move-result v3

    .line 70
    if-eqz v3, :cond_2

    .line 71
    .line 72
    invoke-virtual {p0, v2}, Ll/ony0;->n(Ll/mny0;)V

    .line 73
    .line 74
    .line 75
    :cond_2
    iget-object v3, p0, Ll/ony0;->e:Ll/uny0;

    .line 76
    .line 77
    invoke-static {v2}, Ll/mny0;->d(Ll/mny0;)Ljava/lang/String;

    .line 78
    .line 79
    .line 80
    move-result-object v2

    .line 81
    const/4 v4, 0x0

    .line 82
    invoke-interface {v3, p1, v2, v4}, Ll/uny0;->i(Ll/yfy0;Ljava/lang/String;Z)V

    .line 83
    .line 84
    .line 85
    goto :goto_0

    .line 86
    :cond_3
    invoke-virtual {p0, p1}, Ll/ony0;->o(Ll/yfy0;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 87
    .line 88
    .line 89
    monitor-exit p0

    .line 90
    return-void

    .line 91
    :cond_4
    const/4 p1, 0x0

    .line 92
    :try_start_1
    throw p1

    .line 93
    :goto_2
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 94
    throw p1
.end method

.method public final declared-synchronized e(Ll/d0u0;Ll/kzy0;)Ljava/lang/String;
    .locals 2

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p2, Ll/kzy0;->a:Ljava/lang/Object;

    .line 3
    .line 4
    iget-object v1, p0, Ll/ony0;->b:Ll/hwt0;

    .line 5
    .line 6
    invoke-virtual {p1, v0, v1}, Ll/d0u0;->n(Ljava/lang/Object;Ll/hwt0;)Ll/hwt0;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    iget p1, p1, Ll/hwt0;->c:I

    .line 11
    .line 12
    invoke-virtual {p0, p1, p2}, Ll/ony0;->l(ILl/kzy0;)Ll/mny0;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    invoke-static {p1}, Ll/mny0;->d(Ll/mny0;)Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 20
    monitor-exit p0

    .line 21
    return-object p1

    .line 22
    :catchall_0
    move-exception p1

    .line 23
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 24
    throw p1
.end method

.method public final declared-synchronized f(Ll/yfy0;I)V
    .locals 5

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Ll/ony0;->e:Ll/uny0;

    .line 3
    .line 4
    if-eqz v0, :cond_4

    .line 5
    .line 6
    iget-object v0, p0, Ll/ony0;->c:Ljava/util/HashMap;

    .line 7
    .line 8
    invoke-virtual {v0}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    if-eqz v1, :cond_3

    .line 21
    .line 22
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    check-cast v1, Ll/mny0;

    .line 27
    .line 28
    invoke-virtual {v1, p1}, Ll/mny0;->k(Ll/yfy0;)Z

    .line 29
    .line 30
    .line 31
    move-result v2

    .line 32
    if-eqz v2, :cond_0

    .line 33
    .line 34
    invoke-interface {v0}, Ljava/util/Iterator;->remove()V

    .line 35
    .line 36
    .line 37
    invoke-static {v1}, Ll/mny0;->i(Ll/mny0;)Z

    .line 38
    .line 39
    .line 40
    move-result v2

    .line 41
    if-eqz v2, :cond_0

    .line 42
    .line 43
    invoke-static {v1}, Ll/mny0;->d(Ll/mny0;)Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object v2

    .line 47
    iget-object v3, p0, Ll/ony0;->g:Ljava/lang/String;

    .line 48
    .line 49
    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 50
    .line 51
    .line 52
    move-result v2

    .line 53
    const/4 v3, 0x0

    .line 54
    if-nez p2, :cond_1

    .line 55
    .line 56
    if-eqz v2, :cond_1

    .line 57
    .line 58
    invoke-static {v1}, Ll/mny0;->h(Ll/mny0;)Z

    .line 59
    .line 60
    .line 61
    move-result v4

    .line 62
    if-eqz v4, :cond_1

    .line 63
    .line 64
    const/4 v3, 0x1

    .line 65
    goto :goto_1

    .line 66
    :catchall_0
    move-exception p1

    .line 67
    goto :goto_2

    .line 68
    :cond_1
    :goto_1
    if-eqz v2, :cond_2

    .line 69
    .line 70
    invoke-virtual {p0, v1}, Ll/ony0;->n(Ll/mny0;)V

    .line 71
    .line 72
    .line 73
    :cond_2
    iget-object v2, p0, Ll/ony0;->e:Ll/uny0;

    .line 74
    .line 75
    invoke-static {v1}, Ll/mny0;->d(Ll/mny0;)Ljava/lang/String;

    .line 76
    .line 77
    .line 78
    move-result-object v1

    .line 79
    invoke-interface {v2, p1, v1, v3}, Ll/uny0;->i(Ll/yfy0;Ljava/lang/String;Z)V

    .line 80
    .line 81
    .line 82
    goto :goto_0

    .line 83
    :cond_3
    invoke-virtual {p0, p1}, Ll/ony0;->o(Ll/yfy0;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 84
    .line 85
    .line 86
    monitor-exit p0

    .line 87
    return-void

    .line 88
    :cond_4
    const/4 p1, 0x0

    .line 89
    :try_start_1
    throw p1

    .line 90
    :goto_2
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 91
    throw p1
.end method

.method public final k()J
    .locals 5

    .line 1
    iget-object v0, p0, Ll/ony0;->c:Ljava/util/HashMap;

    .line 2
    .line 3
    iget-object v1, p0, Ll/ony0;->g:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    check-cast v0, Ll/mny0;

    .line 10
    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    invoke-static {v0}, Ll/mny0;->b(Ll/mny0;)J

    .line 14
    .line 15
    .line 16
    move-result-wide v1

    .line 17
    const-wide/16 v3, -0x1

    .line 18
    .line 19
    cmp-long v1, v1, v3

    .line 20
    .line 21
    if-eqz v1, :cond_0

    .line 22
    .line 23
    invoke-static {v0}, Ll/mny0;->b(Ll/mny0;)J

    .line 24
    .line 25
    .line 26
    move-result-wide v0

    .line 27
    return-wide v0

    .line 28
    :cond_0
    iget-wide v0, p0, Ll/ony0;->h:J

    .line 29
    .line 30
    const-wide/16 v2, 0x1

    .line 31
    .line 32
    add-long/2addr v0, v2

    .line 33
    return-wide v0
.end method

.method public final l(ILl/kzy0;)Ll/mny0;
    .locals 9
    .param p2    # Ll/kzy0;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    iget-object v0, p0, Ll/ony0;->c:Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    const-wide v1, 0x7fffffffffffffffL

    .line 12
    .line 13
    .line 14
    .line 15
    .line 16
    const/4 v3, 0x0

    .line 17
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 18
    .line 19
    .line 20
    move-result v4

    .line 21
    if-eqz v4, :cond_3

    .line 22
    .line 23
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object v4

    .line 27
    check-cast v4, Ll/mny0;

    .line 28
    .line 29
    invoke-virtual {v4, p1, p2}, Ll/mny0;->g(ILl/kzy0;)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {v4, p1, p2}, Ll/mny0;->j(ILl/kzy0;)Z

    .line 33
    .line 34
    .line 35
    move-result v5

    .line 36
    if-eqz v5, :cond_0

    .line 37
    .line 38
    invoke-static {v4}, Ll/mny0;->b(Ll/mny0;)J

    .line 39
    .line 40
    .line 41
    move-result-wide v5

    .line 42
    const-wide/16 v7, -0x1

    .line 43
    .line 44
    cmp-long v7, v5, v7

    .line 45
    .line 46
    if-eqz v7, :cond_2

    .line 47
    .line 48
    cmp-long v7, v5, v1

    .line 49
    .line 50
    if-gez v7, :cond_1

    .line 51
    .line 52
    goto :goto_1

    .line 53
    :cond_1
    if-nez v7, :cond_0

    .line 54
    .line 55
    sget v5, Ll/mpw0;->a:I

    .line 56
    .line 57
    invoke-static {v3}, Ll/mny0;->c(Ll/mny0;)Ll/kzy0;

    .line 58
    .line 59
    .line 60
    move-result-object v5

    .line 61
    if-eqz v5, :cond_0

    .line 62
    .line 63
    invoke-static {v4}, Ll/mny0;->c(Ll/mny0;)Ll/kzy0;

    .line 64
    .line 65
    .line 66
    move-result-object v5

    .line 67
    if-eqz v5, :cond_0

    .line 68
    .line 69
    move-object v3, v4

    .line 70
    goto :goto_0

    .line 71
    :cond_2
    :goto_1
    move-object v3, v4

    .line 72
    move-wide v1, v5

    .line 73
    goto :goto_0

    .line 74
    :cond_3
    if-nez v3, :cond_4

    .line 75
    .line 76
    invoke-static {}, Ll/ony0;->m()Ljava/lang/String;

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    new-instance v1, Ll/mny0;

    .line 81
    .line 82
    invoke-direct {v1, p0, v0, p1, p2}, Ll/mny0;-><init>(Ll/ony0;Ljava/lang/String;ILl/kzy0;)V

    .line 83
    .line 84
    .line 85
    iget-object p0, p0, Ll/ony0;->c:Ljava/util/HashMap;

    .line 86
    .line 87
    invoke-virtual {p0, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 88
    .line 89
    .line 90
    return-object v1

    .line 91
    :cond_4
    return-object v3
.end method

.method public final n(Ll/mny0;)V
    .locals 4

    .line 1
    invoke-static {p1}, Ll/mny0;->b(Ll/mny0;)J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    const-wide/16 v2, -0x1

    .line 6
    .line 7
    cmp-long v0, v0, v2

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-static {p1}, Ll/mny0;->b(Ll/mny0;)J

    .line 12
    .line 13
    .line 14
    move-result-wide v0

    .line 15
    iput-wide v0, p0, Ll/ony0;->h:J

    .line 16
    .line 17
    :cond_0
    const/4 p1, 0x0

    .line 18
    iput-object p1, p0, Ll/ony0;->g:Ljava/lang/String;

    .line 19
    .line 20
    return-void
.end method

.method public final o(Ll/yfy0;)V
    .locals 6
    .annotation runtime Lorg/checkerframework/checker/nullness/qual/RequiresNonNull;
        value = {
            "listener"
        }
    .end annotation

    .line 1
    iget-object v0, p1, Ll/yfy0;->b:Ll/d0u0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/d0u0;->o()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p1, p0, Ll/ony0;->g:Ljava/lang/String;

    .line 10
    .line 11
    if-eqz p1, :cond_2

    .line 12
    .line 13
    iget-object v0, p0, Ll/ony0;->c:Ljava/util/HashMap;

    .line 14
    .line 15
    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    check-cast p1, Ll/mny0;

    .line 20
    .line 21
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 22
    .line 23
    .line 24
    invoke-virtual {p0, p1}, Ll/ony0;->n(Ll/mny0;)V

    .line 25
    .line 26
    .line 27
    return-void

    .line 28
    :cond_0
    iget-object v0, p0, Ll/ony0;->c:Ljava/util/HashMap;

    .line 29
    .line 30
    iget-object v1, p0, Ll/ony0;->g:Ljava/lang/String;

    .line 31
    .line 32
    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    check-cast v0, Ll/mny0;

    .line 37
    .line 38
    iget v1, p1, Ll/yfy0;->c:I

    .line 39
    .line 40
    iget-object v2, p1, Ll/yfy0;->d:Ll/kzy0;

    .line 41
    .line 42
    invoke-virtual {p0, v1, v2}, Ll/ony0;->l(ILl/kzy0;)Ll/mny0;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    invoke-static {v1}, Ll/mny0;->d(Ll/mny0;)Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object v2

    .line 50
    iput-object v2, p0, Ll/ony0;->g:Ljava/lang/String;

    .line 51
    .line 52
    invoke-virtual {p0, p1}, Ll/ony0;->b(Ll/yfy0;)V

    .line 53
    .line 54
    .line 55
    iget-object v2, p1, Ll/yfy0;->d:Ll/kzy0;

    .line 56
    .line 57
    if-eqz v2, :cond_2

    .line 58
    .line 59
    invoke-virtual {v2}, Ll/kzy0;->b()Z

    .line 60
    .line 61
    .line 62
    move-result v3

    .line 63
    if-eqz v3, :cond_2

    .line 64
    .line 65
    if-eqz v0, :cond_1

    .line 66
    .line 67
    iget-wide v2, v2, Ll/kzy0;->d:J

    .line 68
    .line 69
    invoke-static {v0}, Ll/mny0;->b(Ll/mny0;)J

    .line 70
    .line 71
    .line 72
    move-result-wide v4

    .line 73
    cmp-long v2, v4, v2

    .line 74
    .line 75
    if-nez v2, :cond_1

    .line 76
    .line 77
    invoke-static {v0}, Ll/mny0;->c(Ll/mny0;)Ll/kzy0;

    .line 78
    .line 79
    .line 80
    move-result-object v2

    .line 81
    if-eqz v2, :cond_1

    .line 82
    .line 83
    invoke-static {v0}, Ll/mny0;->c(Ll/mny0;)Ll/kzy0;

    .line 84
    .line 85
    .line 86
    move-result-object v2

    .line 87
    iget v2, v2, Ll/kzy0;->b:I

    .line 88
    .line 89
    iget-object v3, p1, Ll/yfy0;->d:Ll/kzy0;

    .line 90
    .line 91
    iget v3, v3, Ll/kzy0;->b:I

    .line 92
    .line 93
    if-ne v2, v3, :cond_1

    .line 94
    .line 95
    invoke-static {v0}, Ll/mny0;->c(Ll/mny0;)Ll/kzy0;

    .line 96
    .line 97
    .line 98
    move-result-object v0

    .line 99
    iget v0, v0, Ll/kzy0;->c:I

    .line 100
    .line 101
    iget-object v2, p1, Ll/yfy0;->d:Ll/kzy0;

    .line 102
    .line 103
    iget v2, v2, Ll/kzy0;->c:I

    .line 104
    .line 105
    if-eq v0, v2, :cond_2

    .line 106
    .line 107
    :cond_1
    iget-object v0, p1, Ll/yfy0;->d:Ll/kzy0;

    .line 108
    .line 109
    new-instance v2, Ll/kzy0;

    .line 110
    .line 111
    iget-object v3, v0, Ll/kzy0;->a:Ljava/lang/Object;

    .line 112
    .line 113
    iget-wide v4, v0, Ll/kzy0;->d:J

    .line 114
    .line 115
    invoke-direct {v2, v3, v4, v5}, Ll/kzy0;-><init>(Ljava/lang/Object;J)V

    .line 116
    .line 117
    .line 118
    iget p1, p1, Ll/yfy0;->c:I

    .line 119
    .line 120
    invoke-virtual {p0, p1, v2}, Ll/ony0;->l(ILl/kzy0;)Ll/mny0;

    .line 121
    .line 122
    .line 123
    move-result-object p0

    .line 124
    invoke-static {p0}, Ll/mny0;->d(Ll/mny0;)Ljava/lang/String;

    .line 125
    .line 126
    .line 127
    invoke-static {v1}, Ll/mny0;->d(Ll/mny0;)Ljava/lang/String;

    .line 128
    .line 129
    .line 130
    :cond_2
    return-void
.end method

.method public final declared-synchronized zze()Ljava/lang/String;
    .locals 1
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Ll/ony0;->g:Ljava/lang/String;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 3
    .line 4
    monitor-exit p0

    .line 5
    return-object v0

    .line 6
    :catchall_0
    move-exception v0

    .line 7
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 8
    throw v0
.end method

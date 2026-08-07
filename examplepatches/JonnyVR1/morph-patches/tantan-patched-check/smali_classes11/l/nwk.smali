.class public final Ll/nwk;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/hte;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/nwk$a;
    }
.end annotation

.annotation runtime Ljava/lang/Deprecated;
.end annotation


# static fields
.field public static final q:[D


# instance fields
.field public a:Ljava/lang/String;

.field public b:Ll/qfj0;

.field public final c:Ll/bek0;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public final d:Ll/ig60;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public final e:Ll/ib20;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public final f:[Z

.field public final g:Ll/nwk$a;

.field public h:J

.field public i:Z

.field public j:Z

.field public k:J

.field public l:J

.field public m:J

.field public n:J

.field public o:Z

.field public p:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const/16 v0, 0x8

    .line 2
    .line 3
    new-array v0, v0, [D

    .line 4
    .line 5
    fill-array-data v0, :array_0

    .line 6
    .line 7
    .line 8
    sput-object v0, Ll/nwk;->q:[D

    .line 9
    .line 10
    return-void

    .line 11
    :array_0
    .array-data 8
        0x4037f9dcb5112287L    # 23.976023976023978
        0x4038000000000000L    # 24.0
        0x4039000000000000L    # 25.0
        0x403df853e2556b28L    # 29.97002997002997
        0x403e000000000000L    # 30.0
        0x4049000000000000L    # 50.0
        0x404df853e2556b28L    # 59.94005994005994
        0x404e000000000000L    # 60.0
    .end array-data
.end method

.method public constructor <init>()V
    .locals 1

    const/4 v0, 0x0

    .line 54
    invoke-direct {p0, v0}, Ll/nwk;-><init>(Ll/bek0;)V

    return-void
.end method

.method public constructor <init>(Ll/bek0;)V
    .locals 2
    .param p1    # Ll/bek0;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/nwk;->c:Ll/bek0;

    .line 5
    .line 6
    const/4 v0, 0x4

    .line 7
    new-array v0, v0, [Z

    .line 8
    .line 9
    iput-object v0, p0, Ll/nwk;->f:[Z

    .line 10
    .line 11
    new-instance v0, Ll/nwk$a;

    .line 12
    .line 13
    const/16 v1, 0x80

    .line 14
    .line 15
    invoke-direct {v0, v1}, Ll/nwk$a;-><init>(I)V

    .line 16
    .line 17
    .line 18
    iput-object v0, p0, Ll/nwk;->g:Ll/nwk$a;

    .line 19
    .line 20
    if-eqz p1, :cond_0

    .line 21
    .line 22
    new-instance p1, Ll/ib20;

    .line 23
    .line 24
    const/16 v0, 0xb2

    .line 25
    .line 26
    invoke-direct {p1, v0, v1}, Ll/ib20;-><init>(II)V

    .line 27
    .line 28
    .line 29
    iput-object p1, p0, Ll/nwk;->e:Ll/ib20;

    .line 30
    .line 31
    new-instance p1, Ll/ig60;

    .line 32
    .line 33
    invoke-direct {p1}, Ll/ig60;-><init>()V

    .line 34
    .line 35
    .line 36
    iput-object p1, p0, Ll/nwk;->d:Ll/ig60;

    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_0
    const/4 p1, 0x0

    .line 40
    iput-object p1, p0, Ll/nwk;->e:Ll/ib20;

    .line 41
    .line 42
    iput-object p1, p0, Ll/nwk;->d:Ll/ig60;

    .line 43
    .line 44
    :goto_0
    const-wide v0, -0x7fffffffffffffffL    # -4.9E-324

    .line 45
    .line 46
    .line 47
    .line 48
    .line 49
    iput-wide v0, p0, Ll/nwk;->l:J

    .line 50
    .line 51
    iput-wide v0, p0, Ll/nwk;->n:J

    .line 52
    .line 53
    return-void
.end method

.method public static f(Ll/nwk$a;Ljava/lang/String;)Landroid/util/Pair;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/nwk$a;",
            "Ljava/lang/String;",
            ")",
            "Landroid/util/Pair<",
            "Lcom/google/android/exoplayer2/k;",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/nwk$a;->d:[B

    .line 2
    .line 3
    iget v1, p0, Ll/nwk$a;->b:I

    .line 4
    .line 5
    invoke-static {v0, v1}, Ljava/util/Arrays;->copyOf([BI)[B

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const/4 v1, 0x4

    .line 10
    aget-byte v2, v0, v1

    .line 11
    .line 12
    and-int/lit16 v2, v2, 0xff

    .line 13
    .line 14
    const/4 v3, 0x5

    .line 15
    aget-byte v4, v0, v3

    .line 16
    .line 17
    and-int/lit16 v5, v4, 0xff

    .line 18
    .line 19
    const/4 v6, 0x6

    .line 20
    aget-byte v6, v0, v6

    .line 21
    .line 22
    and-int/lit16 v6, v6, 0xff

    .line 23
    .line 24
    shl-int/2addr v2, v1

    .line 25
    shr-int/2addr v5, v1

    .line 26
    or-int/2addr v2, v5

    .line 27
    and-int/lit8 v4, v4, 0xf

    .line 28
    .line 29
    shl-int/lit8 v4, v4, 0x8

    .line 30
    .line 31
    or-int/2addr v4, v6

    .line 32
    const/4 v5, 0x7

    .line 33
    aget-byte v6, v0, v5

    .line 34
    .line 35
    and-int/lit16 v6, v6, 0xf0

    .line 36
    .line 37
    shr-int/2addr v6, v1

    .line 38
    const/4 v7, 0x2

    .line 39
    if-eq v6, v7, :cond_2

    .line 40
    .line 41
    const/4 v7, 0x3

    .line 42
    if-eq v6, v7, :cond_1

    .line 43
    .line 44
    if-eq v6, v1, :cond_0

    .line 45
    .line 46
    const/high16 v1, 0x3f800000    # 1.0f

    .line 47
    .line 48
    goto :goto_1

    .line 49
    :cond_0
    mul-int/lit8 v1, v4, 0x79

    .line 50
    .line 51
    int-to-float v1, v1

    .line 52
    mul-int/lit8 v6, v2, 0x64

    .line 53
    .line 54
    :goto_0
    int-to-float v6, v6

    .line 55
    div-float/2addr v1, v6

    .line 56
    goto :goto_1

    .line 57
    :cond_1
    mul-int/lit8 v1, v4, 0x10

    .line 58
    .line 59
    int-to-float v1, v1

    .line 60
    mul-int/lit8 v6, v2, 0x9

    .line 61
    .line 62
    goto :goto_0

    .line 63
    :cond_2
    mul-int/lit8 v1, v4, 0x4

    .line 64
    .line 65
    int-to-float v1, v1

    .line 66
    mul-int/lit8 v6, v2, 0x3

    .line 67
    .line 68
    goto :goto_0

    .line 69
    :goto_1
    new-instance v6, Lcom/google/android/exoplayer2/k$b;

    .line 70
    .line 71
    invoke-direct {v6}, Lcom/google/android/exoplayer2/k$b;-><init>()V

    .line 72
    .line 73
    .line 74
    invoke-virtual {v6, p1}, Lcom/google/android/exoplayer2/k$b;->U(Ljava/lang/String;)Lcom/google/android/exoplayer2/k$b;

    .line 75
    .line 76
    .line 77
    move-result-object p1

    .line 78
    const-string v6, "video/mpeg2"

    .line 79
    .line 80
    invoke-virtual {p1, v6}, Lcom/google/android/exoplayer2/k$b;->g0(Ljava/lang/String;)Lcom/google/android/exoplayer2/k$b;

    .line 81
    .line 82
    .line 83
    move-result-object p1

    .line 84
    invoke-virtual {p1, v2}, Lcom/google/android/exoplayer2/k$b;->n0(I)Lcom/google/android/exoplayer2/k$b;

    .line 85
    .line 86
    .line 87
    move-result-object p1

    .line 88
    invoke-virtual {p1, v4}, Lcom/google/android/exoplayer2/k$b;->S(I)Lcom/google/android/exoplayer2/k$b;

    .line 89
    .line 90
    .line 91
    move-result-object p1

    .line 92
    invoke-virtual {p1, v1}, Lcom/google/android/exoplayer2/k$b;->c0(F)Lcom/google/android/exoplayer2/k$b;

    .line 93
    .line 94
    .line 95
    move-result-object p1

    .line 96
    invoke-static {v0}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    .line 97
    .line 98
    .line 99
    move-result-object v1

    .line 100
    invoke-virtual {p1, v1}, Lcom/google/android/exoplayer2/k$b;->V(Ljava/util/List;)Lcom/google/android/exoplayer2/k$b;

    .line 101
    .line 102
    .line 103
    move-result-object p1

    .line 104
    invoke-virtual {p1}, Lcom/google/android/exoplayer2/k$b;->G()Lcom/google/android/exoplayer2/k;

    .line 105
    .line 106
    .line 107
    move-result-object p1

    .line 108
    aget-byte v1, v0, v5

    .line 109
    .line 110
    and-int/lit8 v1, v1, 0xf

    .line 111
    .line 112
    add-int/lit8 v1, v1, -0x1

    .line 113
    .line 114
    if-ltz v1, :cond_4

    .line 115
    .line 116
    sget-object v2, Ll/nwk;->q:[D

    .line 117
    .line 118
    array-length v4, v2

    .line 119
    if-ge v1, v4, :cond_4

    .line 120
    .line 121
    aget-wide v1, v2, v1

    .line 122
    .line 123
    iget p0, p0, Ll/nwk$a;->c:I

    .line 124
    .line 125
    add-int/lit8 p0, p0, 0x9

    .line 126
    .line 127
    aget-byte p0, v0, p0

    .line 128
    .line 129
    and-int/lit8 v0, p0, 0x60

    .line 130
    .line 131
    shr-int/2addr v0, v3

    .line 132
    and-int/lit8 p0, p0, 0x1f

    .line 133
    .line 134
    if-eq v0, p0, :cond_3

    .line 135
    .line 136
    int-to-double v3, v0

    .line 137
    const-wide/high16 v5, 0x3ff0000000000000L    # 1.0

    .line 138
    .line 139
    add-double/2addr v3, v5

    .line 140
    add-int/lit8 p0, p0, 0x1

    .line 141
    .line 142
    int-to-double v5, p0

    .line 143
    div-double/2addr v3, v5

    .line 144
    mul-double/2addr v1, v3

    .line 145
    :cond_3
    const-wide v3, 0x412e848000000000L    # 1000000.0

    .line 146
    .line 147
    .line 148
    .line 149
    .line 150
    div-double/2addr v3, v1

    .line 151
    double-to-long v0, v3

    .line 152
    goto :goto_2

    .line 153
    :cond_4
    const-wide/16 v0, 0x0

    .line 154
    .line 155
    :goto_2
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 156
    .line 157
    .line 158
    move-result-object p0

    .line 159
    invoke-static {p1, p0}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    .line 160
    .line 161
    .line 162
    move-result-object p0

    .line 163
    return-object p0
.end method


# virtual methods
.method public a(Ll/ig60;)V
    .locals 19

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    iget-object v1, v0, Ll/nwk;->b:Ll/qfj0;

    .line 4
    .line 5
    invoke-static {v1}, Ll/w11;->i(Ljava/lang/Object;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    invoke-virtual/range {p1 .. p1}, Ll/ig60;->f()I

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    invoke-virtual/range {p1 .. p1}, Ll/ig60;->g()I

    .line 13
    .line 14
    .line 15
    move-result v2

    .line 16
    invoke-virtual/range {p1 .. p1}, Ll/ig60;->e()[B

    .line 17
    .line 18
    .line 19
    move-result-object v3

    .line 20
    iget-wide v4, v0, Ll/nwk;->h:J

    .line 21
    .line 22
    invoke-virtual/range {p1 .. p1}, Ll/ig60;->a()I

    .line 23
    .line 24
    .line 25
    move-result v6

    .line 26
    int-to-long v6, v6

    .line 27
    add-long/2addr v4, v6

    .line 28
    iput-wide v4, v0, Ll/nwk;->h:J

    .line 29
    .line 30
    iget-object v4, v0, Ll/nwk;->b:Ll/qfj0;

    .line 31
    .line 32
    invoke-virtual/range {p1 .. p1}, Ll/ig60;->a()I

    .line 33
    .line 34
    .line 35
    move-result v5

    .line 36
    move-object/from16 v6, p1

    .line 37
    .line 38
    invoke-interface {v4, v6, v5}, Ll/qfj0;->d(Ll/ig60;I)V

    .line 39
    .line 40
    .line 41
    :goto_0
    iget-object v4, v0, Ll/nwk;->f:[Z

    .line 42
    .line 43
    invoke-static {v3, v1, v2, v4}, Ll/jb20;->c([BII[Z)I

    .line 44
    .line 45
    .line 46
    move-result v4

    .line 47
    if-ne v4, v2, :cond_2

    .line 48
    .line 49
    iget-boolean v4, v0, Ll/nwk;->j:Z

    .line 50
    .line 51
    if-nez v4, :cond_0

    .line 52
    .line 53
    iget-object v4, v0, Ll/nwk;->g:Ll/nwk$a;

    .line 54
    .line 55
    invoke-virtual {v4, v3, v1, v2}, Ll/nwk$a;->a([BII)V

    .line 56
    .line 57
    .line 58
    :cond_0
    iget-object v0, v0, Ll/nwk;->e:Ll/ib20;

    .line 59
    .line 60
    if-eqz v0, :cond_1

    .line 61
    .line 62
    invoke-virtual {v0, v3, v1, v2}, Ll/ib20;->a([BII)V

    .line 63
    .line 64
    .line 65
    :cond_1
    return-void

    .line 66
    :cond_2
    invoke-virtual {v6}, Ll/ig60;->e()[B

    .line 67
    .line 68
    .line 69
    move-result-object v5

    .line 70
    add-int/lit8 v7, v4, 0x3

    .line 71
    .line 72
    aget-byte v5, v5, v7

    .line 73
    .line 74
    and-int/lit16 v5, v5, 0xff

    .line 75
    .line 76
    sub-int v8, v4, v1

    .line 77
    .line 78
    iget-boolean v9, v0, Ll/nwk;->j:Z

    .line 79
    .line 80
    const/4 v10, 0x0

    .line 81
    const/4 v11, 0x1

    .line 82
    if-nez v9, :cond_5

    .line 83
    .line 84
    if-lez v8, :cond_3

    .line 85
    .line 86
    iget-object v9, v0, Ll/nwk;->g:Ll/nwk$a;

    .line 87
    .line 88
    invoke-virtual {v9, v3, v1, v4}, Ll/nwk$a;->a([BII)V

    .line 89
    .line 90
    .line 91
    :cond_3
    if-gez v8, :cond_4

    .line 92
    .line 93
    neg-int v9, v8

    .line 94
    goto :goto_1

    .line 95
    :cond_4
    move v9, v10

    .line 96
    :goto_1
    iget-object v12, v0, Ll/nwk;->g:Ll/nwk$a;

    .line 97
    .line 98
    invoke-virtual {v12, v5, v9}, Ll/nwk$a;->b(II)Z

    .line 99
    .line 100
    .line 101
    move-result v9

    .line 102
    if-eqz v9, :cond_5

    .line 103
    .line 104
    iget-object v9, v0, Ll/nwk;->g:Ll/nwk$a;

    .line 105
    .line 106
    iget-object v12, v0, Ll/nwk;->a:Ljava/lang/String;

    .line 107
    .line 108
    invoke-static {v12}, Ll/w11;->e(Ljava/lang/Object;)Ljava/lang/Object;

    .line 109
    .line 110
    .line 111
    move-result-object v12

    .line 112
    check-cast v12, Ljava/lang/String;

    .line 113
    .line 114
    invoke-static {v9, v12}, Ll/nwk;->f(Ll/nwk$a;Ljava/lang/String;)Landroid/util/Pair;

    .line 115
    .line 116
    .line 117
    move-result-object v9

    .line 118
    iget-object v12, v0, Ll/nwk;->b:Ll/qfj0;

    .line 119
    .line 120
    iget-object v13, v9, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 121
    .line 122
    check-cast v13, Lcom/google/android/exoplayer2/k;

    .line 123
    .line 124
    invoke-interface {v12, v13}, Ll/qfj0;->b(Lcom/google/android/exoplayer2/k;)V

    .line 125
    .line 126
    .line 127
    iget-object v9, v9, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 128
    .line 129
    check-cast v9, Ljava/lang/Long;

    .line 130
    .line 131
    invoke-virtual {v9}, Ljava/lang/Long;->longValue()J

    .line 132
    .line 133
    .line 134
    move-result-wide v12

    .line 135
    iput-wide v12, v0, Ll/nwk;->k:J

    .line 136
    .line 137
    iput-boolean v11, v0, Ll/nwk;->j:Z

    .line 138
    .line 139
    :cond_5
    iget-object v9, v0, Ll/nwk;->e:Ll/ib20;

    .line 140
    .line 141
    if-eqz v9, :cond_8

    .line 142
    .line 143
    if-lez v8, :cond_6

    .line 144
    .line 145
    invoke-virtual {v9, v3, v1, v4}, Ll/ib20;->a([BII)V

    .line 146
    .line 147
    .line 148
    move v1, v10

    .line 149
    goto :goto_2

    .line 150
    :cond_6
    neg-int v1, v8

    .line 151
    :goto_2
    iget-object v8, v0, Ll/nwk;->e:Ll/ib20;

    .line 152
    .line 153
    invoke-virtual {v8, v1}, Ll/ib20;->b(I)Z

    .line 154
    .line 155
    .line 156
    move-result v1

    .line 157
    if-eqz v1, :cond_7

    .line 158
    .line 159
    iget-object v1, v0, Ll/nwk;->e:Ll/ib20;

    .line 160
    .line 161
    iget-object v8, v1, Ll/ib20;->d:[B

    .line 162
    .line 163
    iget v1, v1, Ll/ib20;->e:I

    .line 164
    .line 165
    invoke-static {v8, v1}, Ll/jb20;->q([BI)I

    .line 166
    .line 167
    .line 168
    move-result v1

    .line 169
    iget-object v8, v0, Ll/nwk;->d:Ll/ig60;

    .line 170
    .line 171
    invoke-static {v8}, Ll/bmk0;->j(Ljava/lang/Object;)Ljava/lang/Object;

    .line 172
    .line 173
    .line 174
    move-result-object v8

    .line 175
    check-cast v8, Ll/ig60;

    .line 176
    .line 177
    iget-object v9, v0, Ll/nwk;->e:Ll/ib20;

    .line 178
    .line 179
    iget-object v9, v9, Ll/ib20;->d:[B

    .line 180
    .line 181
    invoke-virtual {v8, v9, v1}, Ll/ig60;->S([BI)V

    .line 182
    .line 183
    .line 184
    iget-object v1, v0, Ll/nwk;->c:Ll/bek0;

    .line 185
    .line 186
    invoke-static {v1}, Ll/bmk0;->j(Ljava/lang/Object;)Ljava/lang/Object;

    .line 187
    .line 188
    .line 189
    move-result-object v1

    .line 190
    check-cast v1, Ll/bek0;

    .line 191
    .line 192
    iget-wide v8, v0, Ll/nwk;->n:J

    .line 193
    .line 194
    iget-object v12, v0, Ll/nwk;->d:Ll/ig60;

    .line 195
    .line 196
    invoke-virtual {v1, v8, v9, v12}, Ll/bek0;->a(JLl/ig60;)V

    .line 197
    .line 198
    .line 199
    :cond_7
    const/16 v1, 0xb2

    .line 200
    .line 201
    if-ne v5, v1, :cond_8

    .line 202
    .line 203
    invoke-virtual {v6}, Ll/ig60;->e()[B

    .line 204
    .line 205
    .line 206
    move-result-object v1

    .line 207
    add-int/lit8 v8, v4, 0x2

    .line 208
    .line 209
    aget-byte v1, v1, v8

    .line 210
    .line 211
    if-ne v1, v11, :cond_8

    .line 212
    .line 213
    iget-object v1, v0, Ll/nwk;->e:Ll/ib20;

    .line 214
    .line 215
    invoke-virtual {v1, v5}, Ll/ib20;->e(I)V

    .line 216
    .line 217
    .line 218
    :cond_8
    if-eqz v5, :cond_b

    .line 219
    .line 220
    const/16 v1, 0xb3

    .line 221
    .line 222
    if-ne v5, v1, :cond_9

    .line 223
    .line 224
    goto :goto_3

    .line 225
    :cond_9
    const/16 v1, 0xb8

    .line 226
    .line 227
    if-ne v5, v1, :cond_a

    .line 228
    .line 229
    iput-boolean v11, v0, Ll/nwk;->o:Z

    .line 230
    .line 231
    :cond_a
    move v4, v2

    .line 232
    goto :goto_9

    .line 233
    :cond_b
    :goto_3
    sub-int v17, v2, v4

    .line 234
    .line 235
    iget-boolean v1, v0, Ll/nwk;->p:Z

    .line 236
    .line 237
    const-wide v8, -0x7fffffffffffffffL    # -4.9E-324

    .line 238
    .line 239
    .line 240
    .line 241
    .line 242
    if-eqz v1, :cond_c

    .line 243
    .line 244
    iget-boolean v1, v0, Ll/nwk;->j:Z

    .line 245
    .line 246
    if-eqz v1, :cond_c

    .line 247
    .line 248
    iget-wide v13, v0, Ll/nwk;->n:J

    .line 249
    .line 250
    cmp-long v1, v13, v8

    .line 251
    .line 252
    if-eqz v1, :cond_c

    .line 253
    .line 254
    iget-boolean v15, v0, Ll/nwk;->o:Z

    .line 255
    .line 256
    iget-wide v11, v0, Ll/nwk;->h:J

    .line 257
    .line 258
    move v4, v2

    .line 259
    iget-wide v1, v0, Ll/nwk;->m:J

    .line 260
    .line 261
    sub-long/2addr v11, v1

    .line 262
    long-to-int v1, v11

    .line 263
    sub-int v16, v1, v17

    .line 264
    .line 265
    iget-object v12, v0, Ll/nwk;->b:Ll/qfj0;

    .line 266
    .line 267
    const/16 v18, 0x0

    .line 268
    .line 269
    invoke-interface/range {v12 .. v18}, Ll/qfj0;->a(JIIILl/qfj0$a;)V

    .line 270
    .line 271
    .line 272
    :goto_4
    move/from16 v2, v17

    .line 273
    .line 274
    goto :goto_5

    .line 275
    :cond_c
    move v4, v2

    .line 276
    goto :goto_4

    .line 277
    :goto_5
    iget-boolean v1, v0, Ll/nwk;->i:Z

    .line 278
    .line 279
    if-eqz v1, :cond_e

    .line 280
    .line 281
    iget-boolean v1, v0, Ll/nwk;->p:Z

    .line 282
    .line 283
    if-eqz v1, :cond_d

    .line 284
    .line 285
    goto :goto_6

    .line 286
    :cond_d
    const/4 v1, 0x1

    .line 287
    goto :goto_8

    .line 288
    :cond_e
    :goto_6
    iget-wide v11, v0, Ll/nwk;->h:J

    .line 289
    .line 290
    int-to-long v1, v2

    .line 291
    sub-long/2addr v11, v1

    .line 292
    iput-wide v11, v0, Ll/nwk;->m:J

    .line 293
    .line 294
    iget-wide v1, v0, Ll/nwk;->l:J

    .line 295
    .line 296
    cmp-long v11, v1, v8

    .line 297
    .line 298
    if-eqz v11, :cond_f

    .line 299
    .line 300
    goto :goto_7

    .line 301
    :cond_f
    iget-wide v1, v0, Ll/nwk;->n:J

    .line 302
    .line 303
    cmp-long v11, v1, v8

    .line 304
    .line 305
    if-eqz v11, :cond_10

    .line 306
    .line 307
    iget-wide v11, v0, Ll/nwk;->k:J

    .line 308
    .line 309
    add-long/2addr v1, v11

    .line 310
    goto :goto_7

    .line 311
    :cond_10
    move-wide v1, v8

    .line 312
    :goto_7
    iput-wide v1, v0, Ll/nwk;->n:J

    .line 313
    .line 314
    iput-boolean v10, v0, Ll/nwk;->o:Z

    .line 315
    .line 316
    iput-wide v8, v0, Ll/nwk;->l:J

    .line 317
    .line 318
    const/4 v1, 0x1

    .line 319
    iput-boolean v1, v0, Ll/nwk;->i:Z

    .line 320
    .line 321
    :goto_8
    if-nez v5, :cond_11

    .line 322
    .line 323
    move v10, v1

    .line 324
    :cond_11
    iput-boolean v10, v0, Ll/nwk;->p:Z

    .line 325
    .line 326
    :goto_9
    move v2, v4

    .line 327
    move v1, v7

    .line 328
    goto/16 :goto_0
.end method

.method public b()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/nwk;->f:[Z

    .line 2
    .line 3
    invoke-static {v0}, Ll/jb20;->a([Z)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/nwk;->g:Ll/nwk$a;

    .line 7
    .line 8
    invoke-virtual {v0}, Ll/nwk$a;->c()V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Ll/nwk;->e:Ll/ib20;

    .line 12
    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    invoke-virtual {v0}, Ll/ib20;->d()V

    .line 16
    .line 17
    .line 18
    :cond_0
    const-wide/16 v0, 0x0

    .line 19
    .line 20
    iput-wide v0, p0, Ll/nwk;->h:J

    .line 21
    .line 22
    const/4 v0, 0x0

    .line 23
    iput-boolean v0, p0, Ll/nwk;->i:Z

    .line 24
    .line 25
    const-wide v0, -0x7fffffffffffffffL    # -4.9E-324

    .line 26
    .line 27
    .line 28
    .line 29
    .line 30
    iput-wide v0, p0, Ll/nwk;->l:J

    .line 31
    .line 32
    iput-wide v0, p0, Ll/nwk;->n:J

    .line 33
    .line 34
    return-void
.end method

.method public c()V
    .locals 0

    .line 1
    return-void
.end method

.method public d(JI)V
    .locals 0

    .line 1
    iput-wide p1, p0, Ll/nwk;->l:J

    .line 2
    .line 3
    return-void
.end method

.method public e(Ll/bsf;Ll/jkj0$d;)V
    .locals 2

    .line 1
    invoke-virtual {p2}, Ll/jkj0$d;->a()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p2}, Ll/jkj0$d;->b()Ljava/lang/String;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iput-object v0, p0, Ll/nwk;->a:Ljava/lang/String;

    .line 9
    .line 10
    invoke-virtual {p2}, Ll/jkj0$d;->c()I

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    const/4 v1, 0x2

    .line 15
    invoke-interface {p1, v0, v1}, Ll/bsf;->b(II)Ll/qfj0;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    iput-object v0, p0, Ll/nwk;->b:Ll/qfj0;

    .line 20
    .line 21
    iget-object p0, p0, Ll/nwk;->c:Ll/bek0;

    .line 22
    .line 23
    if-eqz p0, :cond_0

    .line 24
    .line 25
    invoke-virtual {p0, p1, p2}, Ll/bek0;->b(Ll/bsf;Ll/jkj0$d;)V

    .line 26
    .line 27
    .line 28
    :cond_0
    return-void
.end method

.class public final Lcom/google/android/exoplayer2/j;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/os/Handler$Callback;
.implements Lcom/google/android/exoplayer2/source/h$a;
.implements Ll/cgj0$a;
.implements Lcom/google/android/exoplayer2/q$d;
.implements Lcom/google/android/exoplayer2/g$a;
.implements Lcom/google/android/exoplayer2/u$a;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/exoplayer2/j$f;,
        Lcom/google/android/exoplayer2/j$e;,
        Lcom/google/android/exoplayer2/j$h;,
        Lcom/google/android/exoplayer2/j$b;,
        Lcom/google/android/exoplayer2/j$c;,
        Lcom/google/android/exoplayer2/j$d;,
        Lcom/google/android/exoplayer2/j$g;
    }
.end annotation

.annotation runtime Ljava/lang/Deprecated;
.end annotation


# instance fields
.field public A:Z

.field public B:Z

.field public C:Z

.field public D:Z

.field public E:I

.field public F:Z

.field public G:Z

.field public H:Z

.field public I:Z

.field public J:I

.field public K:Lcom/google/android/exoplayer2/j$h;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public L:J

.field public M:I

.field public N:Z

.field public O:Lcom/google/android/exoplayer2/ExoPlaybackException;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public P:J

.field public Q:J

.field public final a:[Lcom/google/android/exoplayer2/x;

.field public final b:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Lcom/google/android/exoplayer2/x;",
            ">;"
        }
    .end annotation
.end field

.field public final c:[Lcom/google/android/exoplayer2/y;

.field public final d:Ll/cgj0;

.field public final e:Ll/dgj0;

.field public final f:Ll/ltv;

.field public final g:Ll/md2;

.field public final h:Ll/sxk;

.field public final i:Landroid/os/HandlerThread;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public final j:Landroid/os/Looper;

.field public final k:Lcom/google/android/exoplayer2/c0$d;

.field public final l:Lcom/google/android/exoplayer2/c0$b;

.field public final m:J

.field public final n:Z

.field public final o:Lcom/google/android/exoplayer2/g;

.field public final p:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/google/android/exoplayer2/j$d;",
            ">;"
        }
    .end annotation
.end field

.field public final q:Ll/qa5;

.field public final r:Lcom/google/android/exoplayer2/j$f;

.field public final s:Lcom/google/android/exoplayer2/p;

.field public final t:Lcom/google/android/exoplayer2/q;

.field public final u:Lcom/google/android/exoplayer2/m;

.field public final v:J

.field public w:Ll/nke0;

.field public x:Ll/fe80;

.field public y:Lcom/google/android/exoplayer2/j$e;

.field public z:Z


# direct methods
.method public constructor <init>([Lcom/google/android/exoplayer2/x;Ll/cgj0;Ll/dgj0;Ll/ltv;Ll/md2;IZLl/dk0;Ll/nke0;Lcom/google/android/exoplayer2/m;JZLandroid/os/Looper;Ll/qa5;Lcom/google/android/exoplayer2/j$f;Ll/bf80;Landroid/os/Looper;)V
    .locals 8

    .line 1
    move-object/from16 v0, p8

    .line 2
    .line 3
    move-wide/from16 v1, p11

    .line 4
    .line 5
    move-object/from16 v3, p15

    .line 6
    .line 7
    move-object/from16 v4, p17

    .line 8
    .line 9
    move-object/from16 v5, p18

    .line 10
    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 12
    .line 13
    .line 14
    move-object/from16 v6, p16

    .line 15
    .line 16
    iput-object v6, p0, Lcom/google/android/exoplayer2/j;->r:Lcom/google/android/exoplayer2/j$f;

    .line 17
    .line 18
    iput-object p1, p0, Lcom/google/android/exoplayer2/j;->a:[Lcom/google/android/exoplayer2/x;

    .line 19
    .line 20
    iput-object p2, p0, Lcom/google/android/exoplayer2/j;->d:Ll/cgj0;

    .line 21
    .line 22
    iput-object p3, p0, Lcom/google/android/exoplayer2/j;->e:Ll/dgj0;

    .line 23
    .line 24
    iput-object p4, p0, Lcom/google/android/exoplayer2/j;->f:Ll/ltv;

    .line 25
    .line 26
    iput-object p5, p0, Lcom/google/android/exoplayer2/j;->g:Ll/md2;

    .line 27
    .line 28
    iput p6, p0, Lcom/google/android/exoplayer2/j;->E:I

    .line 29
    .line 30
    move v7, p7

    .line 31
    iput-boolean v7, p0, Lcom/google/android/exoplayer2/j;->F:Z

    .line 32
    .line 33
    move-object/from16 v7, p9

    .line 34
    .line 35
    iput-object v7, p0, Lcom/google/android/exoplayer2/j;->w:Ll/nke0;

    .line 36
    .line 37
    move-object/from16 v7, p10

    .line 38
    .line 39
    iput-object v7, p0, Lcom/google/android/exoplayer2/j;->u:Lcom/google/android/exoplayer2/m;

    .line 40
    .line 41
    iput-wide v1, p0, Lcom/google/android/exoplayer2/j;->v:J

    .line 42
    .line 43
    iput-wide v1, p0, Lcom/google/android/exoplayer2/j;->P:J

    .line 44
    .line 45
    move/from16 v1, p13

    .line 46
    .line 47
    iput-boolean v1, p0, Lcom/google/android/exoplayer2/j;->A:Z

    .line 48
    .line 49
    iput-object v3, p0, Lcom/google/android/exoplayer2/j;->q:Ll/qa5;

    .line 50
    .line 51
    const-wide v1, -0x7fffffffffffffffL    # -4.9E-324

    .line 52
    .line 53
    .line 54
    .line 55
    .line 56
    iput-wide v1, p0, Lcom/google/android/exoplayer2/j;->Q:J

    .line 57
    .line 58
    invoke-interface {p4}, Ll/ltv;->g()J

    .line 59
    .line 60
    .line 61
    move-result-wide v1

    .line 62
    iput-wide v1, p0, Lcom/google/android/exoplayer2/j;->m:J

    .line 63
    .line 64
    invoke-interface {p4}, Ll/ltv;->b()Z

    .line 65
    .line 66
    .line 67
    move-result v1

    .line 68
    iput-boolean v1, p0, Lcom/google/android/exoplayer2/j;->n:Z

    .line 69
    .line 70
    invoke-static {p3}, Ll/fe80;->k(Ll/dgj0;)Ll/fe80;

    .line 71
    .line 72
    .line 73
    move-result-object p3

    .line 74
    iput-object p3, p0, Lcom/google/android/exoplayer2/j;->x:Ll/fe80;

    .line 75
    .line 76
    new-instance v1, Lcom/google/android/exoplayer2/j$e;

    .line 77
    .line 78
    invoke-direct {v1, p3}, Lcom/google/android/exoplayer2/j$e;-><init>(Ll/fe80;)V

    .line 79
    .line 80
    .line 81
    iput-object v1, p0, Lcom/google/android/exoplayer2/j;->y:Lcom/google/android/exoplayer2/j$e;

    .line 82
    .line 83
    array-length p3, p1

    .line 84
    new-array p3, p3, [Lcom/google/android/exoplayer2/y;

    .line 85
    .line 86
    iput-object p3, p0, Lcom/google/android/exoplayer2/j;->c:[Lcom/google/android/exoplayer2/y;

    .line 87
    .line 88
    invoke-virtual {p2}, Ll/cgj0;->d()Lcom/google/android/exoplayer2/y$a;

    .line 89
    .line 90
    .line 91
    move-result-object p3

    .line 92
    const/4 v1, 0x0

    .line 93
    :goto_0
    array-length v2, p1

    .line 94
    if-ge v1, v2, :cond_1

    .line 95
    .line 96
    aget-object v2, p1, v1

    .line 97
    .line 98
    invoke-interface {v2, v1, v4}, Lcom/google/android/exoplayer2/x;->x(ILl/bf80;)V

    .line 99
    .line 100
    .line 101
    iget-object v2, p0, Lcom/google/android/exoplayer2/j;->c:[Lcom/google/android/exoplayer2/y;

    .line 102
    .line 103
    aget-object v6, p1, v1

    .line 104
    .line 105
    invoke-interface {v6}, Lcom/google/android/exoplayer2/x;->y()Lcom/google/android/exoplayer2/y;

    .line 106
    .line 107
    .line 108
    move-result-object v6

    .line 109
    aput-object v6, v2, v1

    .line 110
    .line 111
    if-eqz p3, :cond_0

    .line 112
    .line 113
    iget-object v2, p0, Lcom/google/android/exoplayer2/j;->c:[Lcom/google/android/exoplayer2/y;

    .line 114
    .line 115
    aget-object v2, v2, v1

    .line 116
    .line 117
    invoke-interface {v2, p3}, Lcom/google/android/exoplayer2/y;->n(Lcom/google/android/exoplayer2/y$a;)V

    .line 118
    .line 119
    .line 120
    :cond_0
    add-int/lit8 v1, v1, 0x1

    .line 121
    .line 122
    goto :goto_0

    .line 123
    :cond_1
    new-instance p1, Lcom/google/android/exoplayer2/g;

    .line 124
    .line 125
    invoke-direct {p1, p0, v3}, Lcom/google/android/exoplayer2/g;-><init>(Lcom/google/android/exoplayer2/g$a;Ll/qa5;)V

    .line 126
    .line 127
    .line 128
    iput-object p1, p0, Lcom/google/android/exoplayer2/j;->o:Lcom/google/android/exoplayer2/g;

    .line 129
    .line 130
    new-instance p1, Ljava/util/ArrayList;

    .line 131
    .line 132
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 133
    .line 134
    .line 135
    iput-object p1, p0, Lcom/google/android/exoplayer2/j;->p:Ljava/util/ArrayList;

    .line 136
    .line 137
    invoke-static {}, Lcom/google/common/collect/Sets;->h()Ljava/util/Set;

    .line 138
    .line 139
    .line 140
    move-result-object p1

    .line 141
    iput-object p1, p0, Lcom/google/android/exoplayer2/j;->b:Ljava/util/Set;

    .line 142
    .line 143
    new-instance p1, Lcom/google/android/exoplayer2/c0$d;

    .line 144
    .line 145
    invoke-direct {p1}, Lcom/google/android/exoplayer2/c0$d;-><init>()V

    .line 146
    .line 147
    .line 148
    iput-object p1, p0, Lcom/google/android/exoplayer2/j;->k:Lcom/google/android/exoplayer2/c0$d;

    .line 149
    .line 150
    new-instance p1, Lcom/google/android/exoplayer2/c0$b;

    .line 151
    .line 152
    invoke-direct {p1}, Lcom/google/android/exoplayer2/c0$b;-><init>()V

    .line 153
    .line 154
    .line 155
    iput-object p1, p0, Lcom/google/android/exoplayer2/j;->l:Lcom/google/android/exoplayer2/c0$b;

    .line 156
    .line 157
    invoke-virtual {p2, p0, p5}, Ll/cgj0;->e(Ll/cgj0$a;Ll/md2;)V

    .line 158
    .line 159
    .line 160
    const/4 p1, 0x1

    .line 161
    iput-boolean p1, p0, Lcom/google/android/exoplayer2/j;->N:Z

    .line 162
    .line 163
    const/4 p1, 0x0

    .line 164
    move-object/from16 p2, p14

    .line 165
    .line 166
    invoke-interface {v3, p2, p1}, Ll/qa5;->c(Landroid/os/Looper;Landroid/os/Handler$Callback;)Ll/sxk;

    .line 167
    .line 168
    .line 169
    move-result-object p2

    .line 170
    new-instance p3, Lcom/google/android/exoplayer2/p;

    .line 171
    .line 172
    invoke-direct {p3, v0, p2}, Lcom/google/android/exoplayer2/p;-><init>(Ll/dk0;Ll/sxk;)V

    .line 173
    .line 174
    .line 175
    iput-object p3, p0, Lcom/google/android/exoplayer2/j;->s:Lcom/google/android/exoplayer2/p;

    .line 176
    .line 177
    new-instance p3, Lcom/google/android/exoplayer2/q;

    .line 178
    .line 179
    invoke-direct {p3, p0, v0, p2, v4}, Lcom/google/android/exoplayer2/q;-><init>(Lcom/google/android/exoplayer2/q$d;Ll/dk0;Ll/sxk;Ll/bf80;)V

    .line 180
    .line 181
    .line 182
    iput-object p3, p0, Lcom/google/android/exoplayer2/j;->t:Lcom/google/android/exoplayer2/q;

    .line 183
    .line 184
    if-eqz v5, :cond_2

    .line 185
    .line 186
    iput-object p1, p0, Lcom/google/android/exoplayer2/j;->i:Landroid/os/HandlerThread;

    .line 187
    .line 188
    iput-object v5, p0, Lcom/google/android/exoplayer2/j;->j:Landroid/os/Looper;

    .line 189
    .line 190
    goto :goto_1

    .line 191
    :cond_2
    new-instance p1, Landroid/os/HandlerThread;

    .line 192
    .line 193
    const-string p2, "ExoPlayer:Playback"

    .line 194
    .line 195
    const/16 p3, -0x10

    .line 196
    .line 197
    invoke-direct {p1, p2, p3}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;I)V

    .line 198
    .line 199
    .line 200
    iput-object p1, p0, Lcom/google/android/exoplayer2/j;->i:Landroid/os/HandlerThread;

    .line 201
    .line 202
    invoke-virtual {p1}, Ljava/lang/Thread;->start()V

    .line 203
    .line 204
    .line 205
    invoke-virtual {p1}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    .line 206
    .line 207
    .line 208
    move-result-object p1

    .line 209
    iput-object p1, p0, Lcom/google/android/exoplayer2/j;->j:Landroid/os/Looper;

    .line 210
    .line 211
    :goto_1
    iget-object p1, p0, Lcom/google/android/exoplayer2/j;->j:Landroid/os/Looper;

    .line 212
    .line 213
    invoke-interface {v3, p1, p0}, Ll/qa5;->c(Landroid/os/Looper;Landroid/os/Handler$Callback;)Ll/sxk;

    .line 214
    .line 215
    .line 216
    move-result-object p1

    .line 217
    iput-object p1, p0, Lcom/google/android/exoplayer2/j;->h:Ll/sxk;

    .line 218
    .line 219
    return-void
.end method

.method public static B(Ll/u9f;)[Lcom/google/android/exoplayer2/k;
    .locals 4

    .line 1
    const/4 v0, 0x0

    .line 2
    if-eqz p0, :cond_0

    .line 3
    .line 4
    invoke-interface {p0}, Ll/vfj0;->length()I

    .line 5
    .line 6
    .line 7
    move-result v1

    .line 8
    goto :goto_0

    .line 9
    :cond_0
    move v1, v0

    .line 10
    :goto_0
    new-array v2, v1, [Lcom/google/android/exoplayer2/k;

    .line 11
    .line 12
    :goto_1
    if-ge v0, v1, :cond_1

    .line 13
    .line 14
    invoke-interface {p0, v0}, Ll/vfj0;->m(I)Lcom/google/android/exoplayer2/k;

    .line 15
    .line 16
    .line 17
    move-result-object v3

    .line 18
    aput-object v3, v2, v0

    .line 19
    .line 20
    add-int/lit8 v0, v0, 0x1

    .line 21
    .line 22
    goto :goto_1

    .line 23
    :cond_1
    return-object v2
.end method

.method public static B0(Lcom/google/android/exoplayer2/c0;Ll/fe80;Lcom/google/android/exoplayer2/j$h;Lcom/google/android/exoplayer2/p;IZLcom/google/android/exoplayer2/c0$d;Lcom/google/android/exoplayer2/c0$b;)Lcom/google/android/exoplayer2/j$g;
    .locals 31
    .param p2    # Lcom/google/android/exoplayer2/j$h;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    move-object/from16 v7, p1

    .line 2
    .line 3
    move-object/from16 v2, p7

    .line 4
    .line 5
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/exoplayer2/c0;->u()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    new-instance v1, Lcom/google/android/exoplayer2/j$g;

    .line 12
    .line 13
    invoke-static {}, Ll/fe80;->l()Lcom/google/android/exoplayer2/source/i$b;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    const/4 v8, 0x1

    .line 18
    const/4 v9, 0x0

    .line 19
    const-wide/16 v3, 0x0

    .line 20
    .line 21
    const-wide v5, -0x7fffffffffffffffL    # -4.9E-324

    .line 22
    .line 23
    .line 24
    .line 25
    .line 26
    const/4 v7, 0x0

    .line 27
    invoke-direct/range {v1 .. v9}, Lcom/google/android/exoplayer2/j$g;-><init>(Lcom/google/android/exoplayer2/source/i$b;JJZZZ)V

    .line 28
    .line 29
    .line 30
    return-object v1

    .line 31
    :cond_0
    iget-object v9, v7, Ll/fe80;->b:Lcom/google/android/exoplayer2/source/i$b;

    .line 32
    .line 33
    iget-object v8, v9, Ll/fyx;->a:Ljava/lang/Object;

    .line 34
    .line 35
    invoke-static {v7, v2}, Lcom/google/android/exoplayer2/j;->W(Ll/fe80;Lcom/google/android/exoplayer2/c0$b;)Z

    .line 36
    .line 37
    .line 38
    move-result v10

    .line 39
    iget-object v0, v7, Ll/fe80;->b:Lcom/google/android/exoplayer2/source/i$b;

    .line 40
    .line 41
    invoke-virtual {v0}, Ll/fyx;->b()Z

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    if-nez v0, :cond_2

    .line 46
    .line 47
    if-eqz v10, :cond_1

    .line 48
    .line 49
    goto :goto_1

    .line 50
    :cond_1
    iget-wide v0, v7, Ll/fe80;->r:J

    .line 51
    .line 52
    :goto_0
    move-wide v11, v0

    .line 53
    goto :goto_2

    .line 54
    :cond_2
    :goto_1
    iget-wide v0, v7, Ll/fe80;->c:J

    .line 55
    .line 56
    goto :goto_0

    .line 57
    :goto_2
    const-wide v13, -0x7fffffffffffffffL    # -4.9E-324

    .line 58
    .line 59
    .line 60
    .line 61
    .line 62
    const/4 v15, -0x1

    .line 63
    const/16 v16, 0x0

    .line 64
    .line 65
    const/16 v17, 0x1

    .line 66
    .line 67
    if-eqz p2, :cond_6

    .line 68
    .line 69
    const/4 v2, 0x1

    .line 70
    move-object/from16 v0, p0

    .line 71
    .line 72
    move-object/from16 v1, p2

    .line 73
    .line 74
    move/from16 v3, p4

    .line 75
    .line 76
    move/from16 v4, p5

    .line 77
    .line 78
    move-object/from16 v5, p6

    .line 79
    .line 80
    move-object/from16 v6, p7

    .line 81
    .line 82
    invoke-static/range {v0 .. v6}, Lcom/google/android/exoplayer2/j;->C0(Lcom/google/android/exoplayer2/c0;Lcom/google/android/exoplayer2/j$h;ZIZLcom/google/android/exoplayer2/c0$d;Lcom/google/android/exoplayer2/c0$b;)Landroid/util/Pair;

    .line 83
    .line 84
    .line 85
    move-result-object v2

    .line 86
    move v3, v4

    .line 87
    if-nez v2, :cond_3

    .line 88
    .line 89
    invoke-virtual {v0, v3}, Lcom/google/android/exoplayer2/c0;->e(Z)I

    .line 90
    .line 91
    .line 92
    move-result v1

    .line 93
    move v3, v1

    .line 94
    move-wide v1, v11

    .line 95
    move-wide/from16 v18, v13

    .line 96
    .line 97
    move/from16 v4, v16

    .line 98
    .line 99
    move v5, v4

    .line 100
    move/from16 v13, v17

    .line 101
    .line 102
    goto :goto_5

    .line 103
    :cond_3
    iget-wide v3, v1, Lcom/google/android/exoplayer2/j$h;->c:J

    .line 104
    .line 105
    cmp-long v1, v3, v13

    .line 106
    .line 107
    iget-object v3, v2, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 108
    .line 109
    if-nez v1, :cond_4

    .line 110
    .line 111
    invoke-virtual {v0, v3, v6}, Lcom/google/android/exoplayer2/c0;->l(Ljava/lang/Object;Lcom/google/android/exoplayer2/c0$b;)Lcom/google/android/exoplayer2/c0$b;

    .line 112
    .line 113
    .line 114
    move-result-object v1

    .line 115
    iget v1, v1, Lcom/google/android/exoplayer2/c0$b;->c:I

    .line 116
    .line 117
    move v3, v1

    .line 118
    move-wide v1, v11

    .line 119
    move/from16 v4, v16

    .line 120
    .line 121
    goto :goto_3

    .line 122
    :cond_4
    iget-object v1, v2, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 123
    .line 124
    check-cast v1, Ljava/lang/Long;

    .line 125
    .line 126
    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    .line 127
    .line 128
    .line 129
    move-result-wide v1

    .line 130
    move-object v8, v3

    .line 131
    move v3, v15

    .line 132
    move/from16 v4, v17

    .line 133
    .line 134
    :goto_3
    iget v5, v7, Ll/fe80;->e:I

    .line 135
    .line 136
    move-wide/from16 v18, v13

    .line 137
    .line 138
    const/4 v13, 0x4

    .line 139
    if-ne v5, v13, :cond_5

    .line 140
    .line 141
    move/from16 v5, v17

    .line 142
    .line 143
    goto :goto_4

    .line 144
    :cond_5
    move/from16 v5, v16

    .line 145
    .line 146
    :goto_4
    move/from16 v13, v16

    .line 147
    .line 148
    :goto_5
    move/from16 v28, v4

    .line 149
    .line 150
    move/from16 v26, v5

    .line 151
    .line 152
    move/from16 v27, v13

    .line 153
    .line 154
    goto/16 :goto_b

    .line 155
    .line 156
    :cond_6
    move-object/from16 v0, p0

    .line 157
    .line 158
    move/from16 v3, p5

    .line 159
    .line 160
    move-object v6, v2

    .line 161
    move-wide/from16 v18, v13

    .line 162
    .line 163
    iget-object v1, v7, Ll/fe80;->a:Lcom/google/android/exoplayer2/c0;

    .line 164
    .line 165
    invoke-virtual {v1}, Lcom/google/android/exoplayer2/c0;->u()Z

    .line 166
    .line 167
    .line 168
    move-result v1

    .line 169
    if-eqz v1, :cond_7

    .line 170
    .line 171
    invoke-virtual {v0, v3}, Lcom/google/android/exoplayer2/c0;->e(Z)I

    .line 172
    .line 173
    .line 174
    move-result v3

    .line 175
    :goto_6
    move-wide v1, v11

    .line 176
    :goto_7
    move/from16 v26, v16

    .line 177
    .line 178
    move/from16 v27, v26

    .line 179
    .line 180
    move/from16 v28, v27

    .line 181
    .line 182
    goto/16 :goto_b

    .line 183
    .line 184
    :cond_7
    invoke-virtual {v0, v8}, Lcom/google/android/exoplayer2/c0;->f(Ljava/lang/Object;)I

    .line 185
    .line 186
    .line 187
    move-result v1

    .line 188
    if-ne v1, v15, :cond_9

    .line 189
    .line 190
    iget-object v5, v7, Ll/fe80;->a:Lcom/google/android/exoplayer2/c0;

    .line 191
    .line 192
    move/from16 v2, p4

    .line 193
    .line 194
    move-object v1, v6

    .line 195
    move-object v4, v8

    .line 196
    move-object v6, v0

    .line 197
    move-object/from16 v0, p6

    .line 198
    .line 199
    invoke-static/range {v0 .. v6}, Lcom/google/android/exoplayer2/j;->D0(Lcom/google/android/exoplayer2/c0$d;Lcom/google/android/exoplayer2/c0$b;IZLjava/lang/Object;Lcom/google/android/exoplayer2/c0;Lcom/google/android/exoplayer2/c0;)Ljava/lang/Object;

    .line 200
    .line 201
    .line 202
    move-result-object v2

    .line 203
    move-object v0, v6

    .line 204
    move-object v6, v1

    .line 205
    if-nez v2, :cond_8

    .line 206
    .line 207
    invoke-virtual {v0, v3}, Lcom/google/android/exoplayer2/c0;->e(Z)I

    .line 208
    .line 209
    .line 210
    move-result v1

    .line 211
    move/from16 v13, v17

    .line 212
    .line 213
    :goto_8
    move v3, v1

    .line 214
    goto :goto_9

    .line 215
    :cond_8
    invoke-virtual {v0, v2, v6}, Lcom/google/android/exoplayer2/c0;->l(Ljava/lang/Object;Lcom/google/android/exoplayer2/c0$b;)Lcom/google/android/exoplayer2/c0$b;

    .line 216
    .line 217
    .line 218
    move-result-object v1

    .line 219
    iget v1, v1, Lcom/google/android/exoplayer2/c0$b;->c:I

    .line 220
    .line 221
    move/from16 v13, v16

    .line 222
    .line 223
    goto :goto_8

    .line 224
    :goto_9
    move-object v8, v4

    .line 225
    move-wide v1, v11

    .line 226
    move/from16 v27, v13

    .line 227
    .line 228
    move/from16 v26, v16

    .line 229
    .line 230
    move/from16 v28, v26

    .line 231
    .line 232
    goto/16 :goto_b

    .line 233
    .line 234
    :cond_9
    move-object v4, v8

    .line 235
    cmp-long v1, v11, v18

    .line 236
    .line 237
    if-nez v1, :cond_a

    .line 238
    .line 239
    invoke-virtual {v0, v4, v6}, Lcom/google/android/exoplayer2/c0;->l(Ljava/lang/Object;Lcom/google/android/exoplayer2/c0$b;)Lcom/google/android/exoplayer2/c0$b;

    .line 240
    .line 241
    .line 242
    move-result-object v1

    .line 243
    iget v3, v1, Lcom/google/android/exoplayer2/c0$b;->c:I

    .line 244
    .line 245
    move-object v8, v4

    .line 246
    goto :goto_6

    .line 247
    :cond_a
    if-eqz v10, :cond_c

    .line 248
    .line 249
    iget-object v1, v7, Ll/fe80;->a:Lcom/google/android/exoplayer2/c0;

    .line 250
    .line 251
    iget-object v2, v9, Ll/fyx;->a:Ljava/lang/Object;

    .line 252
    .line 253
    invoke-virtual {v1, v2, v6}, Lcom/google/android/exoplayer2/c0;->l(Ljava/lang/Object;Lcom/google/android/exoplayer2/c0$b;)Lcom/google/android/exoplayer2/c0$b;

    .line 254
    .line 255
    .line 256
    iget-object v1, v7, Ll/fe80;->a:Lcom/google/android/exoplayer2/c0;

    .line 257
    .line 258
    iget v2, v6, Lcom/google/android/exoplayer2/c0$b;->c:I

    .line 259
    .line 260
    move-object/from16 v5, p6

    .line 261
    .line 262
    invoke-virtual {v1, v2, v5}, Lcom/google/android/exoplayer2/c0;->r(ILcom/google/android/exoplayer2/c0$d;)Lcom/google/android/exoplayer2/c0$d;

    .line 263
    .line 264
    .line 265
    move-result-object v1

    .line 266
    iget v1, v1, Lcom/google/android/exoplayer2/c0$d;->o:I

    .line 267
    .line 268
    iget-object v2, v7, Ll/fe80;->a:Lcom/google/android/exoplayer2/c0;

    .line 269
    .line 270
    iget-object v3, v9, Ll/fyx;->a:Ljava/lang/Object;

    .line 271
    .line 272
    invoke-virtual {v2, v3}, Lcom/google/android/exoplayer2/c0;->f(Ljava/lang/Object;)I

    .line 273
    .line 274
    .line 275
    move-result v2

    .line 276
    if-ne v1, v2, :cond_b

    .line 277
    .line 278
    invoke-virtual {v6}, Lcom/google/android/exoplayer2/c0$b;->q()J

    .line 279
    .line 280
    .line 281
    move-result-wide v1

    .line 282
    add-long/2addr v1, v11

    .line 283
    invoke-virtual {v0, v4, v6}, Lcom/google/android/exoplayer2/c0;->l(Ljava/lang/Object;Lcom/google/android/exoplayer2/c0$b;)Lcom/google/android/exoplayer2/c0$b;

    .line 284
    .line 285
    .line 286
    move-result-object v3

    .line 287
    iget v3, v3, Lcom/google/android/exoplayer2/c0$b;->c:I

    .line 288
    .line 289
    move-wide/from16 v29, v1

    .line 290
    .line 291
    move-object v1, v5

    .line 292
    move-wide/from16 v4, v29

    .line 293
    .line 294
    move-object v2, v6

    .line 295
    invoke-virtual/range {v0 .. v5}, Lcom/google/android/exoplayer2/c0;->n(Lcom/google/android/exoplayer2/c0$d;Lcom/google/android/exoplayer2/c0$b;IJ)Landroid/util/Pair;

    .line 296
    .line 297
    .line 298
    move-result-object v3

    .line 299
    iget-object v8, v3, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 300
    .line 301
    iget-object v0, v3, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 302
    .line 303
    check-cast v0, Ljava/lang/Long;

    .line 304
    .line 305
    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    .line 306
    .line 307
    .line 308
    move-result-wide v0

    .line 309
    move-wide v1, v0

    .line 310
    goto :goto_a

    .line 311
    :cond_b
    move-object v8, v4

    .line 312
    move-wide v1, v11

    .line 313
    :goto_a
    move v3, v15

    .line 314
    move/from16 v26, v16

    .line 315
    .line 316
    move/from16 v27, v26

    .line 317
    .line 318
    move/from16 v28, v17

    .line 319
    .line 320
    goto :goto_b

    .line 321
    :cond_c
    move-object v8, v4

    .line 322
    move-wide v1, v11

    .line 323
    move v3, v15

    .line 324
    goto/16 :goto_7

    .line 325
    .line 326
    :goto_b
    if-eq v3, v15, :cond_d

    .line 327
    .line 328
    const-wide v4, -0x7fffffffffffffffL    # -4.9E-324

    .line 329
    .line 330
    .line 331
    .line 332
    .line 333
    move-object/from16 v0, p0

    .line 334
    .line 335
    move-object/from16 v1, p6

    .line 336
    .line 337
    move-object/from16 v2, p7

    .line 338
    .line 339
    invoke-virtual/range {v0 .. v5}, Lcom/google/android/exoplayer2/c0;->n(Lcom/google/android/exoplayer2/c0$d;Lcom/google/android/exoplayer2/c0$b;IJ)Landroid/util/Pair;

    .line 340
    .line 341
    .line 342
    move-result-object v1

    .line 343
    move-object v6, v2

    .line 344
    iget-object v8, v1, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 345
    .line 346
    iget-object v1, v1, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 347
    .line 348
    check-cast v1, Ljava/lang/Long;

    .line 349
    .line 350
    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    .line 351
    .line 352
    .line 353
    move-result-wide v1

    .line 354
    move-wide/from16 v24, v18

    .line 355
    .line 356
    :goto_c
    move-object/from16 v3, p3

    .line 357
    .line 358
    goto :goto_d

    .line 359
    :cond_d
    move-object/from16 v0, p0

    .line 360
    .line 361
    move-object/from16 v6, p7

    .line 362
    .line 363
    move-wide/from16 v24, v1

    .line 364
    .line 365
    goto :goto_c

    .line 366
    :goto_d
    invoke-virtual {v3, v0, v8, v1, v2}, Lcom/google/android/exoplayer2/p;->E(Lcom/google/android/exoplayer2/c0;Ljava/lang/Object;J)Lcom/google/android/exoplayer2/source/i$b;

    .line 367
    .line 368
    .line 369
    move-result-object v3

    .line 370
    iget v4, v3, Ll/fyx;->e:I

    .line 371
    .line 372
    if-eq v4, v15, :cond_f

    .line 373
    .line 374
    iget v5, v9, Ll/fyx;->e:I

    .line 375
    .line 376
    if-eq v5, v15, :cond_e

    .line 377
    .line 378
    if-lt v4, v5, :cond_e

    .line 379
    .line 380
    goto :goto_e

    .line 381
    :cond_e
    move/from16 v4, v16

    .line 382
    .line 383
    goto :goto_f

    .line 384
    :cond_f
    :goto_e
    move/from16 v4, v17

    .line 385
    .line 386
    :goto_f
    iget-object v5, v9, Ll/fyx;->a:Ljava/lang/Object;

    .line 387
    .line 388
    invoke-virtual {v5, v8}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 389
    .line 390
    .line 391
    move-result v5

    .line 392
    if-eqz v5, :cond_10

    .line 393
    .line 394
    invoke-virtual {v9}, Ll/fyx;->b()Z

    .line 395
    .line 396
    .line 397
    move-result v5

    .line 398
    if-nez v5, :cond_10

    .line 399
    .line 400
    invoke-virtual {v3}, Ll/fyx;->b()Z

    .line 401
    .line 402
    .line 403
    move-result v5

    .line 404
    if-nez v5, :cond_10

    .line 405
    .line 406
    if-eqz v4, :cond_10

    .line 407
    .line 408
    move/from16 v16, v17

    .line 409
    .line 410
    :cond_10
    invoke-virtual {v0, v8, v6}, Lcom/google/android/exoplayer2/c0;->l(Ljava/lang/Object;Lcom/google/android/exoplayer2/c0$b;)Lcom/google/android/exoplayer2/c0$b;

    .line 411
    .line 412
    .line 413
    move-result-object v13

    .line 414
    move v8, v10

    .line 415
    move-wide v10, v11

    .line 416
    move-wide/from16 v14, v24

    .line 417
    .line 418
    move-object v12, v3

    .line 419
    invoke-static/range {v8 .. v15}, Lcom/google/android/exoplayer2/j;->S(ZLcom/google/android/exoplayer2/source/i$b;JLcom/google/android/exoplayer2/source/i$b;Lcom/google/android/exoplayer2/c0$b;J)Z

    .line 420
    .line 421
    .line 422
    move-result v3

    .line 423
    if-nez v16, :cond_11

    .line 424
    .line 425
    if-eqz v3, :cond_12

    .line 426
    .line 427
    :cond_11
    move-object v12, v9

    .line 428
    :cond_12
    invoke-virtual {v12}, Ll/fyx;->b()Z

    .line 429
    .line 430
    .line 431
    move-result v3

    .line 432
    if-eqz v3, :cond_13

    .line 433
    .line 434
    invoke-virtual {v12, v9}, Ll/fyx;->equals(Ljava/lang/Object;)Z

    .line 435
    .line 436
    .line 437
    move-result v1

    .line 438
    if-eqz v1, :cond_14

    .line 439
    .line 440
    iget-wide v1, v7, Ll/fe80;->r:J

    .line 441
    .line 442
    :cond_13
    :goto_10
    move-wide/from16 v22, v1

    .line 443
    .line 444
    goto :goto_12

    .line 445
    :cond_14
    iget-object v1, v12, Ll/fyx;->a:Ljava/lang/Object;

    .line 446
    .line 447
    invoke-virtual {v0, v1, v6}, Lcom/google/android/exoplayer2/c0;->l(Ljava/lang/Object;Lcom/google/android/exoplayer2/c0$b;)Lcom/google/android/exoplayer2/c0$b;

    .line 448
    .line 449
    .line 450
    iget v0, v12, Ll/fyx;->c:I

    .line 451
    .line 452
    iget v1, v12, Ll/fyx;->b:I

    .line 453
    .line 454
    invoke-virtual {v6, v1}, Lcom/google/android/exoplayer2/c0$b;->n(I)I

    .line 455
    .line 456
    .line 457
    move-result v1

    .line 458
    if-ne v0, v1, :cond_15

    .line 459
    .line 460
    invoke-virtual {v6}, Lcom/google/android/exoplayer2/c0$b;->j()J

    .line 461
    .line 462
    .line 463
    move-result-wide v0

    .line 464
    :goto_11
    move-wide v1, v0

    .line 465
    goto :goto_10

    .line 466
    :cond_15
    const-wide/16 v0, 0x0

    .line 467
    .line 468
    goto :goto_11

    .line 469
    :goto_12
    new-instance v20, Lcom/google/android/exoplayer2/j$g;

    .line 470
    .line 471
    move-object/from16 v21, v12

    .line 472
    .line 473
    invoke-direct/range {v20 .. v28}, Lcom/google/android/exoplayer2/j$g;-><init>(Lcom/google/android/exoplayer2/source/i$b;JJZZZ)V

    .line 474
    .line 475
    .line 476
    return-object v20
.end method

.method public static C0(Lcom/google/android/exoplayer2/c0;Lcom/google/android/exoplayer2/j$h;ZIZLcom/google/android/exoplayer2/c0$d;Lcom/google/android/exoplayer2/c0$b;)Landroid/util/Pair;
    .locals 9
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/exoplayer2/c0;",
            "Lcom/google/android/exoplayer2/j$h;",
            "ZIZ",
            "Lcom/google/android/exoplayer2/c0$d;",
            "Lcom/google/android/exoplayer2/c0$b;",
            ")",
            "Landroid/util/Pair<",
            "Ljava/lang/Object;",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object v2, p1, Lcom/google/android/exoplayer2/j$h;->a:Lcom/google/android/exoplayer2/c0;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/c0;->u()Z

    .line 4
    .line 5
    .line 6
    move-result v3

    .line 7
    const/4 v8, 0x0

    .line 8
    if-eqz v3, :cond_0

    .line 9
    .line 10
    return-object v8

    .line 11
    :cond_0
    invoke-virtual {v2}, Lcom/google/android/exoplayer2/c0;->u()Z

    .line 12
    .line 13
    .line 14
    move-result v3

    .line 15
    if-eqz v3, :cond_1

    .line 16
    .line 17
    move-object v2, p0

    .line 18
    :cond_1
    :try_start_0
    iget v5, p1, Lcom/google/android/exoplayer2/j$h;->b:I

    .line 19
    .line 20
    iget-wide v6, p1, Lcom/google/android/exoplayer2/j$h;->c:J

    .line 21
    .line 22
    move-object v3, p5

    .line 23
    move-object v4, p6

    .line 24
    invoke-virtual/range {v2 .. v7}, Lcom/google/android/exoplayer2/c0;->n(Lcom/google/android/exoplayer2/c0$d;Lcom/google/android/exoplayer2/c0$b;IJ)Landroid/util/Pair;

    .line 25
    .line 26
    .line 27
    move-result-object v5
    :try_end_0
    .catch Ljava/lang/IndexOutOfBoundsException; {:try_start_0 .. :try_end_0} :catch_0

    .line 28
    move-object v3, v2

    .line 29
    invoke-virtual {p0, v3}, Lcom/google/android/exoplayer2/c0;->equals(Ljava/lang/Object;)Z

    .line 30
    .line 31
    .line 32
    move-result v4

    .line 33
    if-eqz v4, :cond_2

    .line 34
    .line 35
    return-object v5

    .line 36
    :cond_2
    iget-object v4, v5, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 37
    .line 38
    invoke-virtual {p0, v4}, Lcom/google/android/exoplayer2/c0;->f(Ljava/lang/Object;)I

    .line 39
    .line 40
    .line 41
    move-result v4

    .line 42
    const/4 v6, -0x1

    .line 43
    if-eq v4, v6, :cond_4

    .line 44
    .line 45
    iget-object v4, v5, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 46
    .line 47
    invoke-virtual {v3, v4, p6}, Lcom/google/android/exoplayer2/c0;->l(Ljava/lang/Object;Lcom/google/android/exoplayer2/c0$b;)Lcom/google/android/exoplayer2/c0$b;

    .line 48
    .line 49
    .line 50
    move-result-object v4

    .line 51
    iget-boolean v4, v4, Lcom/google/android/exoplayer2/c0$b;->f:Z

    .line 52
    .line 53
    if-eqz v4, :cond_3

    .line 54
    .line 55
    iget v4, p6, Lcom/google/android/exoplayer2/c0$b;->c:I

    .line 56
    .line 57
    invoke-virtual {v3, v4, p5}, Lcom/google/android/exoplayer2/c0;->r(ILcom/google/android/exoplayer2/c0$d;)Lcom/google/android/exoplayer2/c0$d;

    .line 58
    .line 59
    .line 60
    move-result-object v4

    .line 61
    iget v4, v4, Lcom/google/android/exoplayer2/c0$d;->o:I

    .line 62
    .line 63
    iget-object v7, v5, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 64
    .line 65
    invoke-virtual {v3, v7}, Lcom/google/android/exoplayer2/c0;->f(Ljava/lang/Object;)I

    .line 66
    .line 67
    .line 68
    move-result v3

    .line 69
    if-ne v4, v3, :cond_3

    .line 70
    .line 71
    iget-object v3, v5, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 72
    .line 73
    invoke-virtual {p0, v3, p6}, Lcom/google/android/exoplayer2/c0;->l(Ljava/lang/Object;Lcom/google/android/exoplayer2/c0$b;)Lcom/google/android/exoplayer2/c0$b;

    .line 74
    .line 75
    .line 76
    move-result-object v3

    .line 77
    iget v3, v3, Lcom/google/android/exoplayer2/c0$b;->c:I

    .line 78
    .line 79
    iget-wide v4, p1, Lcom/google/android/exoplayer2/j$h;->c:J

    .line 80
    .line 81
    move-object v0, p0

    .line 82
    move-object v1, p5

    .line 83
    move-object v2, p6

    .line 84
    invoke-virtual/range {v0 .. v5}, Lcom/google/android/exoplayer2/c0;->n(Lcom/google/android/exoplayer2/c0$d;Lcom/google/android/exoplayer2/c0$b;IJ)Landroid/util/Pair;

    .line 85
    .line 86
    .line 87
    move-result-object v0

    .line 88
    return-object v0

    .line 89
    :cond_3
    return-object v5

    .line 90
    :cond_4
    if-eqz p2, :cond_5

    .line 91
    .line 92
    iget-object v4, v5, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 93
    .line 94
    move-object v6, p0

    .line 95
    move v2, p3

    .line 96
    move-object v0, p5

    .line 97
    move-object v1, p6

    .line 98
    move-object v5, v3

    .line 99
    move v3, p4

    .line 100
    invoke-static/range {v0 .. v6}, Lcom/google/android/exoplayer2/j;->D0(Lcom/google/android/exoplayer2/c0$d;Lcom/google/android/exoplayer2/c0$b;IZLjava/lang/Object;Lcom/google/android/exoplayer2/c0;Lcom/google/android/exoplayer2/c0;)Ljava/lang/Object;

    .line 101
    .line 102
    .line 103
    move-result-object v2

    .line 104
    if-eqz v2, :cond_5

    .line 105
    .line 106
    invoke-virtual {p0, v2, p6}, Lcom/google/android/exoplayer2/c0;->l(Ljava/lang/Object;Lcom/google/android/exoplayer2/c0$b;)Lcom/google/android/exoplayer2/c0$b;

    .line 107
    .line 108
    .line 109
    move-result-object v2

    .line 110
    iget v3, v2, Lcom/google/android/exoplayer2/c0$b;->c:I

    .line 111
    .line 112
    const-wide v4, -0x7fffffffffffffffL    # -4.9E-324

    .line 113
    .line 114
    .line 115
    .line 116
    .line 117
    move-object v0, p0

    .line 118
    move-object v1, p5

    .line 119
    move-object v2, p6

    .line 120
    invoke-virtual/range {v0 .. v5}, Lcom/google/android/exoplayer2/c0;->n(Lcom/google/android/exoplayer2/c0$d;Lcom/google/android/exoplayer2/c0$b;IJ)Landroid/util/Pair;

    .line 121
    .line 122
    .line 123
    move-result-object v0

    .line 124
    return-object v0

    .line 125
    :catch_0
    :cond_5
    return-object v8
.end method

.method public static D0(Lcom/google/android/exoplayer2/c0$d;Lcom/google/android/exoplayer2/c0$b;IZLjava/lang/Object;Lcom/google/android/exoplayer2/c0;Lcom/google/android/exoplayer2/c0;)Ljava/lang/Object;
    .locals 9
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    invoke-virtual {p5, p4}, Lcom/google/android/exoplayer2/c0;->f(Ljava/lang/Object;)I

    .line 2
    .line 3
    .line 4
    move-result p4

    .line 5
    invoke-virtual {p5}, Lcom/google/android/exoplayer2/c0;->m()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    const/4 v1, -0x1

    .line 10
    const/4 v2, 0x0

    .line 11
    move v4, p4

    .line 12
    move p4, v1

    .line 13
    :goto_0
    if-ge v2, v0, :cond_1

    .line 14
    .line 15
    if-ne p4, v1, :cond_1

    .line 16
    .line 17
    move-object v6, p0

    .line 18
    move-object v5, p1

    .line 19
    move v7, p2

    .line 20
    move v8, p3

    .line 21
    move-object v3, p5

    .line 22
    invoke-virtual/range {v3 .. v8}, Lcom/google/android/exoplayer2/c0;->h(ILcom/google/android/exoplayer2/c0$b;Lcom/google/android/exoplayer2/c0$d;IZ)I

    .line 23
    .line 24
    .line 25
    move-result v4

    .line 26
    if-ne v4, v1, :cond_0

    .line 27
    .line 28
    goto :goto_1

    .line 29
    :cond_0
    invoke-virtual {v3, v4}, Lcom/google/android/exoplayer2/c0;->q(I)Ljava/lang/Object;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    invoke-virtual {p6, p0}, Lcom/google/android/exoplayer2/c0;->f(Ljava/lang/Object;)I

    .line 34
    .line 35
    .line 36
    move-result p4

    .line 37
    add-int/lit8 v2, v2, 0x1

    .line 38
    .line 39
    move-object p5, v3

    .line 40
    move-object p1, v5

    .line 41
    move-object p0, v6

    .line 42
    move p2, v7

    .line 43
    move p3, v8

    .line 44
    goto :goto_0

    .line 45
    :cond_1
    :goto_1
    if-ne p4, v1, :cond_2

    .line 46
    .line 47
    const/4 p0, 0x0

    .line 48
    return-object p0

    .line 49
    :cond_2
    invoke-virtual {p6, p4}, Lcom/google/android/exoplayer2/c0;->q(I)Ljava/lang/Object;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    return-object p0
.end method

.method public static S(ZLcom/google/android/exoplayer2/source/i$b;JLcom/google/android/exoplayer2/source/i$b;Lcom/google/android/exoplayer2/c0$b;J)Z
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    if-nez p0, :cond_3

    .line 3
    .line 4
    cmp-long p0, p2, p6

    .line 5
    .line 6
    if-nez p0, :cond_3

    .line 7
    .line 8
    iget-object p0, p1, Ll/fyx;->a:Ljava/lang/Object;

    .line 9
    .line 10
    iget-object p2, p4, Ll/fyx;->a:Ljava/lang/Object;

    .line 11
    .line 12
    invoke-virtual {p0, p2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 13
    .line 14
    .line 15
    move-result p0

    .line 16
    if-nez p0, :cond_0

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_0
    invoke-virtual {p1}, Ll/fyx;->b()Z

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    const/4 p2, 0x1

    .line 24
    if-eqz p0, :cond_2

    .line 25
    .line 26
    iget p0, p1, Ll/fyx;->b:I

    .line 27
    .line 28
    invoke-virtual {p5, p0}, Lcom/google/android/exoplayer2/c0$b;->u(I)Z

    .line 29
    .line 30
    .line 31
    move-result p0

    .line 32
    if-eqz p0, :cond_2

    .line 33
    .line 34
    iget p0, p1, Ll/fyx;->b:I

    .line 35
    .line 36
    iget p3, p1, Ll/fyx;->c:I

    .line 37
    .line 38
    invoke-virtual {p5, p0, p3}, Lcom/google/android/exoplayer2/c0$b;->k(II)I

    .line 39
    .line 40
    .line 41
    move-result p0

    .line 42
    const/4 p3, 0x4

    .line 43
    if-eq p0, p3, :cond_1

    .line 44
    .line 45
    iget p0, p1, Ll/fyx;->b:I

    .line 46
    .line 47
    iget p1, p1, Ll/fyx;->c:I

    .line 48
    .line 49
    invoke-virtual {p5, p0, p1}, Lcom/google/android/exoplayer2/c0$b;->k(II)I

    .line 50
    .line 51
    .line 52
    move-result p0

    .line 53
    const/4 p1, 0x2

    .line 54
    if-eq p0, p1, :cond_1

    .line 55
    .line 56
    return p2

    .line 57
    :cond_1
    return v0

    .line 58
    :cond_2
    invoke-virtual {p4}, Ll/fyx;->b()Z

    .line 59
    .line 60
    .line 61
    move-result p0

    .line 62
    if-eqz p0, :cond_3

    .line 63
    .line 64
    iget p0, p4, Ll/fyx;->b:I

    .line 65
    .line 66
    invoke-virtual {p5, p0}, Lcom/google/android/exoplayer2/c0$b;->u(I)Z

    .line 67
    .line 68
    .line 69
    move-result p0

    .line 70
    if-eqz p0, :cond_3

    .line 71
    .line 72
    return p2

    .line 73
    :cond_3
    :goto_0
    return v0
.end method

.method public static U(Lcom/google/android/exoplayer2/x;)Z
    .locals 0

    .line 1
    invoke-interface {p0}, Lcom/google/android/exoplayer2/x;->getState()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x1

    .line 8
    return p0

    .line 9
    :cond_0
    const/4 p0, 0x0

    .line 10
    return p0
.end method

.method public static W(Ll/fe80;Lcom/google/android/exoplayer2/c0$b;)Z
    .locals 2

    .line 1
    iget-object v0, p0, Ll/fe80;->b:Lcom/google/android/exoplayer2/source/i$b;

    .line 2
    .line 3
    iget-object p0, p0, Ll/fe80;->a:Lcom/google/android/exoplayer2/c0;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/c0;->u()Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    if-nez v1, :cond_1

    .line 10
    .line 11
    iget-object v0, v0, Ll/fyx;->a:Ljava/lang/Object;

    .line 12
    .line 13
    invoke-virtual {p0, v0, p1}, Lcom/google/android/exoplayer2/c0;->l(Ljava/lang/Object;Lcom/google/android/exoplayer2/c0$b;)Lcom/google/android/exoplayer2/c0$b;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    iget-boolean p0, p0, Lcom/google/android/exoplayer2/c0$b;->f:Z

    .line 18
    .line 19
    if-eqz p0, :cond_0

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    const/4 p0, 0x0

    .line 23
    return p0

    .line 24
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 25
    return p0
.end method

.method public static synthetic f(Lcom/google/android/exoplayer2/j;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/google/android/exoplayer2/j;->z:Z

    .line 2
    .line 3
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public static synthetic g(Lcom/google/android/exoplayer2/j;Lcom/google/android/exoplayer2/u;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    :try_start_0
    invoke-virtual {p0, p1}, Lcom/google/android/exoplayer2/j;->p(Lcom/google/android/exoplayer2/u;)V
    :try_end_0
    .catch Lcom/google/android/exoplayer2/ExoPlaybackException; {:try_start_0 .. :try_end_0} :catch_0

    .line 5
    .line 6
    .line 7
    return-void

    .line 8
    :catch_0
    move-exception p0

    .line 9
    const-string p1, "ExoPlayerImplInternal"

    .line 10
    .line 11
    const-string v0, "Unexpected error delivering message on external thread."

    .line 12
    .line 13
    invoke-static {p1, v0, p0}, Ll/kyv;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 14
    .line 15
    .line 16
    invoke-static {p0}, Ll/iig0;->a(Ljava/lang/Throwable;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public static synthetic h(Lcom/google/android/exoplayer2/j;Z)Z
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/google/android/exoplayer2/j;->H:Z

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic i(Lcom/google/android/exoplayer2/j;)Ll/sxk;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/android/exoplayer2/j;->h:Ll/sxk;

    .line 2
    .line 3
    return-object p0
.end method

.method public static y0(Lcom/google/android/exoplayer2/c0;Lcom/google/android/exoplayer2/j$d;Lcom/google/android/exoplayer2/c0$d;Lcom/google/android/exoplayer2/c0$b;)V
    .locals 4

    .line 1
    iget-object v0, p1, Lcom/google/android/exoplayer2/j$d;->d:Ljava/lang/Object;

    .line 2
    .line 3
    invoke-virtual {p0, v0, p3}, Lcom/google/android/exoplayer2/c0;->l(Ljava/lang/Object;Lcom/google/android/exoplayer2/c0$b;)Lcom/google/android/exoplayer2/c0$b;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget v0, v0, Lcom/google/android/exoplayer2/c0$b;->c:I

    .line 8
    .line 9
    invoke-virtual {p0, v0, p2}, Lcom/google/android/exoplayer2/c0;->r(ILcom/google/android/exoplayer2/c0$d;)Lcom/google/android/exoplayer2/c0$d;

    .line 10
    .line 11
    .line 12
    move-result-object p2

    .line 13
    iget p2, p2, Lcom/google/android/exoplayer2/c0$d;->p:I

    .line 14
    .line 15
    const/4 v0, 0x1

    .line 16
    invoke-virtual {p0, p2, p3, v0}, Lcom/google/android/exoplayer2/c0;->k(ILcom/google/android/exoplayer2/c0$b;Z)Lcom/google/android/exoplayer2/c0$b;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    iget-object p0, p0, Lcom/google/android/exoplayer2/c0$b;->b:Ljava/lang/Object;

    .line 21
    .line 22
    iget-wide v0, p3, Lcom/google/android/exoplayer2/c0$b;->d:J

    .line 23
    .line 24
    const-wide v2, -0x7fffffffffffffffL    # -4.9E-324

    .line 25
    .line 26
    .line 27
    .line 28
    .line 29
    cmp-long p3, v0, v2

    .line 30
    .line 31
    if-eqz p3, :cond_0

    .line 32
    .line 33
    const-wide/16 v2, 0x1

    .line 34
    .line 35
    sub-long/2addr v0, v2

    .line 36
    goto :goto_0

    .line 37
    :cond_0
    const-wide v0, 0x7fffffffffffffffL

    .line 38
    .line 39
    .line 40
    .line 41
    .line 42
    :goto_0
    invoke-virtual {p1, p2, v0, v1, p0}, Lcom/google/android/exoplayer2/j$d;->b(IJLjava/lang/Object;)V

    .line 43
    .line 44
    .line 45
    return-void
.end method

.method public static z0(Lcom/google/android/exoplayer2/j$d;Lcom/google/android/exoplayer2/c0;Lcom/google/android/exoplayer2/c0;IZLcom/google/android/exoplayer2/c0$d;Lcom/google/android/exoplayer2/c0$b;)Z
    .locals 11

    .line 1
    iget-object v0, p0, Lcom/google/android/exoplayer2/j$d;->d:Ljava/lang/Object;

    .line 2
    .line 3
    const/4 v7, 0x0

    .line 4
    const/4 v8, 0x1

    .line 5
    const-wide/high16 v9, -0x8000000000000000L

    .line 6
    .line 7
    if-nez v0, :cond_3

    .line 8
    .line 9
    iget-object p2, p0, Lcom/google/android/exoplayer2/j$d;->a:Lcom/google/android/exoplayer2/u;

    .line 10
    .line 11
    invoke-virtual {p2}, Lcom/google/android/exoplayer2/u;->f()J

    .line 12
    .line 13
    .line 14
    move-result-wide v0

    .line 15
    cmp-long p2, v0, v9

    .line 16
    .line 17
    if-nez p2, :cond_0

    .line 18
    .line 19
    const-wide v0, -0x7fffffffffffffffL    # -4.9E-324

    .line 20
    .line 21
    .line 22
    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_0
    iget-object p2, p0, Lcom/google/android/exoplayer2/j$d;->a:Lcom/google/android/exoplayer2/u;

    .line 26
    .line 27
    invoke-virtual {p2}, Lcom/google/android/exoplayer2/u;->f()J

    .line 28
    .line 29
    .line 30
    move-result-wide v0

    .line 31
    invoke-static {v0, v1}, Ll/bmk0;->J0(J)J

    .line 32
    .line 33
    .line 34
    move-result-wide v0

    .line 35
    :goto_0
    new-instance p2, Lcom/google/android/exoplayer2/j$h;

    .line 36
    .line 37
    iget-object v2, p0, Lcom/google/android/exoplayer2/j$d;->a:Lcom/google/android/exoplayer2/u;

    .line 38
    .line 39
    invoke-virtual {v2}, Lcom/google/android/exoplayer2/u;->h()Lcom/google/android/exoplayer2/c0;

    .line 40
    .line 41
    .line 42
    move-result-object v2

    .line 43
    iget-object v3, p0, Lcom/google/android/exoplayer2/j$d;->a:Lcom/google/android/exoplayer2/u;

    .line 44
    .line 45
    invoke-virtual {v3}, Lcom/google/android/exoplayer2/u;->d()I

    .line 46
    .line 47
    .line 48
    move-result v3

    .line 49
    invoke-direct {p2, v2, v3, v0, v1}, Lcom/google/android/exoplayer2/j$h;-><init>(Lcom/google/android/exoplayer2/c0;IJ)V

    .line 50
    .line 51
    .line 52
    const/4 v2, 0x0

    .line 53
    move-object v0, p1

    .line 54
    move-object v1, p2

    .line 55
    move v3, p3

    .line 56
    move v4, p4

    .line 57
    move-object/from16 v5, p5

    .line 58
    .line 59
    move-object/from16 v6, p6

    .line 60
    .line 61
    invoke-static/range {v0 .. v6}, Lcom/google/android/exoplayer2/j;->C0(Lcom/google/android/exoplayer2/c0;Lcom/google/android/exoplayer2/j$h;ZIZLcom/google/android/exoplayer2/c0$d;Lcom/google/android/exoplayer2/c0$b;)Landroid/util/Pair;

    .line 62
    .line 63
    .line 64
    move-result-object p2

    .line 65
    move-object v2, v6

    .line 66
    if-nez p2, :cond_1

    .line 67
    .line 68
    return v7

    .line 69
    :cond_1
    iget-object v0, p2, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 70
    .line 71
    invoke-virtual {p1, v0}, Lcom/google/android/exoplayer2/c0;->f(Ljava/lang/Object;)I

    .line 72
    .line 73
    .line 74
    move-result v0

    .line 75
    iget-object v3, p2, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 76
    .line 77
    check-cast v3, Ljava/lang/Long;

    .line 78
    .line 79
    invoke-virtual {v3}, Ljava/lang/Long;->longValue()J

    .line 80
    .line 81
    .line 82
    move-result-wide v3

    .line 83
    iget-object p2, p2, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 84
    .line 85
    invoke-virtual {p0, v0, v3, v4, p2}, Lcom/google/android/exoplayer2/j$d;->b(IJLjava/lang/Object;)V

    .line 86
    .line 87
    .line 88
    iget-object p2, p0, Lcom/google/android/exoplayer2/j$d;->a:Lcom/google/android/exoplayer2/u;

    .line 89
    .line 90
    invoke-virtual {p2}, Lcom/google/android/exoplayer2/u;->f()J

    .line 91
    .line 92
    .line 93
    move-result-wide v3

    .line 94
    cmp-long p2, v3, v9

    .line 95
    .line 96
    if-nez p2, :cond_2

    .line 97
    .line 98
    invoke-static {p1, p0, v5, v2}, Lcom/google/android/exoplayer2/j;->y0(Lcom/google/android/exoplayer2/c0;Lcom/google/android/exoplayer2/j$d;Lcom/google/android/exoplayer2/c0$d;Lcom/google/android/exoplayer2/c0$b;)V

    .line 99
    .line 100
    .line 101
    :cond_2
    return v8

    .line 102
    :cond_3
    move-object/from16 v5, p5

    .line 103
    .line 104
    move-object/from16 v2, p6

    .line 105
    .line 106
    invoke-virtual {p1, v0}, Lcom/google/android/exoplayer2/c0;->f(Ljava/lang/Object;)I

    .line 107
    .line 108
    .line 109
    move-result v0

    .line 110
    const/4 v3, -0x1

    .line 111
    if-ne v0, v3, :cond_4

    .line 112
    .line 113
    return v7

    .line 114
    :cond_4
    iget-object v3, p0, Lcom/google/android/exoplayer2/j$d;->a:Lcom/google/android/exoplayer2/u;

    .line 115
    .line 116
    invoke-virtual {v3}, Lcom/google/android/exoplayer2/u;->f()J

    .line 117
    .line 118
    .line 119
    move-result-wide v3

    .line 120
    cmp-long v3, v3, v9

    .line 121
    .line 122
    if-nez v3, :cond_5

    .line 123
    .line 124
    invoke-static {p1, p0, v5, v2}, Lcom/google/android/exoplayer2/j;->y0(Lcom/google/android/exoplayer2/c0;Lcom/google/android/exoplayer2/j$d;Lcom/google/android/exoplayer2/c0$d;Lcom/google/android/exoplayer2/c0$b;)V

    .line 125
    .line 126
    .line 127
    return v8

    .line 128
    :cond_5
    iput v0, p0, Lcom/google/android/exoplayer2/j$d;->b:I

    .line 129
    .line 130
    iget-object v0, p0, Lcom/google/android/exoplayer2/j$d;->d:Ljava/lang/Object;

    .line 131
    .line 132
    invoke-virtual {p2, v0, v2}, Lcom/google/android/exoplayer2/c0;->l(Ljava/lang/Object;Lcom/google/android/exoplayer2/c0$b;)Lcom/google/android/exoplayer2/c0$b;

    .line 133
    .line 134
    .line 135
    iget-boolean v0, v2, Lcom/google/android/exoplayer2/c0$b;->f:Z

    .line 136
    .line 137
    if-eqz v0, :cond_6

    .line 138
    .line 139
    iget v0, v2, Lcom/google/android/exoplayer2/c0$b;->c:I

    .line 140
    .line 141
    invoke-virtual {p2, v0, v5}, Lcom/google/android/exoplayer2/c0;->r(ILcom/google/android/exoplayer2/c0$d;)Lcom/google/android/exoplayer2/c0$d;

    .line 142
    .line 143
    .line 144
    move-result-object v0

    .line 145
    iget v0, v0, Lcom/google/android/exoplayer2/c0$d;->o:I

    .line 146
    .line 147
    iget-object v3, p0, Lcom/google/android/exoplayer2/j$d;->d:Ljava/lang/Object;

    .line 148
    .line 149
    invoke-virtual {p2, v3}, Lcom/google/android/exoplayer2/c0;->f(Ljava/lang/Object;)I

    .line 150
    .line 151
    .line 152
    move-result p2

    .line 153
    if-ne v0, p2, :cond_6

    .line 154
    .line 155
    iget-wide v3, p0, Lcom/google/android/exoplayer2/j$d;->c:J

    .line 156
    .line 157
    invoke-virtual {v2}, Lcom/google/android/exoplayer2/c0$b;->q()J

    .line 158
    .line 159
    .line 160
    move-result-wide v6

    .line 161
    add-long/2addr v3, v6

    .line 162
    iget-object p2, p0, Lcom/google/android/exoplayer2/j$d;->d:Ljava/lang/Object;

    .line 163
    .line 164
    invoke-virtual {p1, p2, v2}, Lcom/google/android/exoplayer2/c0;->l(Ljava/lang/Object;Lcom/google/android/exoplayer2/c0$b;)Lcom/google/android/exoplayer2/c0$b;

    .line 165
    .line 166
    .line 167
    move-result-object p2

    .line 168
    iget p2, p2, Lcom/google/android/exoplayer2/c0$b;->c:I

    .line 169
    .line 170
    move-object v0, p1

    .line 171
    move-object v1, v5

    .line 172
    move-wide v4, v3

    .line 173
    move v3, p2

    .line 174
    invoke-virtual/range {v0 .. v5}, Lcom/google/android/exoplayer2/c0;->n(Lcom/google/android/exoplayer2/c0$d;Lcom/google/android/exoplayer2/c0$b;IJ)Landroid/util/Pair;

    .line 175
    .line 176
    .line 177
    move-result-object p2

    .line 178
    iget-object v1, p2, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 179
    .line 180
    invoke-virtual {p1, v1}, Lcom/google/android/exoplayer2/c0;->f(Ljava/lang/Object;)I

    .line 181
    .line 182
    .line 183
    move-result p1

    .line 184
    iget-object v0, p2, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 185
    .line 186
    check-cast v0, Ljava/lang/Long;

    .line 187
    .line 188
    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    .line 189
    .line 190
    .line 191
    move-result-wide v0

    .line 192
    iget-object p2, p2, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 193
    .line 194
    invoke-virtual {p0, p1, v0, v1, p2}, Lcom/google/android/exoplayer2/j$d;->b(IJLjava/lang/Object;)V

    .line 195
    .line 196
    .line 197
    :cond_6
    return v8
.end method


# virtual methods
.method public final A()J
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/google/android/exoplayer2/j;->x:Ll/fe80;

    .line 2
    .line 3
    iget-object v1, v0, Ll/fe80;->a:Lcom/google/android/exoplayer2/c0;

    .line 4
    .line 5
    iget-object v2, v0, Ll/fe80;->b:Lcom/google/android/exoplayer2/source/i$b;

    .line 6
    .line 7
    iget-object v2, v2, Ll/fyx;->a:Ljava/lang/Object;

    .line 8
    .line 9
    iget-wide v3, v0, Ll/fe80;->r:J

    .line 10
    .line 11
    invoke-virtual {p0, v1, v2, v3, v4}, Lcom/google/android/exoplayer2/j;->C(Lcom/google/android/exoplayer2/c0;Ljava/lang/Object;J)J

    .line 12
    .line 13
    .line 14
    move-result-wide v0

    .line 15
    return-wide v0
.end method

.method public final A0(Lcom/google/android/exoplayer2/c0;Lcom/google/android/exoplayer2/c0;)V
    .locals 9

    .line 1
    invoke-virtual {p1}, Lcom/google/android/exoplayer2/c0;->u()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p2}, Lcom/google/android/exoplayer2/c0;->u()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    iget-object v0, p0, Lcom/google/android/exoplayer2/j;->p:Ljava/util/ArrayList;

    .line 15
    .line 16
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    add-int/lit8 v0, v0, -0x1

    .line 21
    .line 22
    :goto_0
    iget-object v1, p0, Lcom/google/android/exoplayer2/j;->p:Ljava/util/ArrayList;

    .line 23
    .line 24
    if-ltz v0, :cond_2

    .line 25
    .line 26
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    move-object v2, v1

    .line 31
    check-cast v2, Lcom/google/android/exoplayer2/j$d;

    .line 32
    .line 33
    iget v5, p0, Lcom/google/android/exoplayer2/j;->E:I

    .line 34
    .line 35
    iget-boolean v6, p0, Lcom/google/android/exoplayer2/j;->F:Z

    .line 36
    .line 37
    iget-object v7, p0, Lcom/google/android/exoplayer2/j;->k:Lcom/google/android/exoplayer2/c0$d;

    .line 38
    .line 39
    iget-object v8, p0, Lcom/google/android/exoplayer2/j;->l:Lcom/google/android/exoplayer2/c0$b;

    .line 40
    .line 41
    move-object v3, p1

    .line 42
    move-object v4, p2

    .line 43
    invoke-static/range {v2 .. v8}, Lcom/google/android/exoplayer2/j;->z0(Lcom/google/android/exoplayer2/j$d;Lcom/google/android/exoplayer2/c0;Lcom/google/android/exoplayer2/c0;IZLcom/google/android/exoplayer2/c0$d;Lcom/google/android/exoplayer2/c0$b;)Z

    .line 44
    .line 45
    .line 46
    move-result p1

    .line 47
    if-nez p1, :cond_1

    .line 48
    .line 49
    iget-object p1, p0, Lcom/google/android/exoplayer2/j;->p:Ljava/util/ArrayList;

    .line 50
    .line 51
    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 52
    .line 53
    .line 54
    move-result-object p1

    .line 55
    check-cast p1, Lcom/google/android/exoplayer2/j$d;

    .line 56
    .line 57
    iget-object p1, p1, Lcom/google/android/exoplayer2/j$d;->a:Lcom/google/android/exoplayer2/u;

    .line 58
    .line 59
    const/4 p2, 0x0

    .line 60
    invoke-virtual {p1, p2}, Lcom/google/android/exoplayer2/u;->k(Z)V

    .line 61
    .line 62
    .line 63
    iget-object p1, p0, Lcom/google/android/exoplayer2/j;->p:Ljava/util/ArrayList;

    .line 64
    .line 65
    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 66
    .line 67
    .line 68
    :cond_1
    add-int/lit8 v0, v0, -0x1

    .line 69
    .line 70
    move-object p1, v3

    .line 71
    move-object p2, v4

    .line 72
    goto :goto_0

    .line 73
    :cond_2
    invoke-static {v1}, Ljava/util/Collections;->sort(Ljava/util/List;)V

    .line 74
    .line 75
    .line 76
    return-void
.end method

.method public final C(Lcom/google/android/exoplayer2/c0;Ljava/lang/Object;J)J
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/google/android/exoplayer2/j;->l:Lcom/google/android/exoplayer2/c0$b;

    .line 2
    .line 3
    invoke-virtual {p1, p2, v0}, Lcom/google/android/exoplayer2/c0;->l(Ljava/lang/Object;Lcom/google/android/exoplayer2/c0$b;)Lcom/google/android/exoplayer2/c0$b;

    .line 4
    .line 5
    .line 6
    move-result-object p2

    .line 7
    iget p2, p2, Lcom/google/android/exoplayer2/c0$b;->c:I

    .line 8
    .line 9
    iget-object v0, p0, Lcom/google/android/exoplayer2/j;->k:Lcom/google/android/exoplayer2/c0$d;

    .line 10
    .line 11
    invoke-virtual {p1, p2, v0}, Lcom/google/android/exoplayer2/c0;->r(ILcom/google/android/exoplayer2/c0$d;)Lcom/google/android/exoplayer2/c0$d;

    .line 12
    .line 13
    .line 14
    iget-object p1, p0, Lcom/google/android/exoplayer2/j;->k:Lcom/google/android/exoplayer2/c0$d;

    .line 15
    .line 16
    iget-wide v0, p1, Lcom/google/android/exoplayer2/c0$d;->f:J

    .line 17
    .line 18
    const-wide v2, -0x7fffffffffffffffL    # -4.9E-324

    .line 19
    .line 20
    .line 21
    .line 22
    .line 23
    cmp-long p2, v0, v2

    .line 24
    .line 25
    if-eqz p2, :cond_1

    .line 26
    .line 27
    invoke-virtual {p1}, Lcom/google/android/exoplayer2/c0$d;->h()Z

    .line 28
    .line 29
    .line 30
    move-result p1

    .line 31
    if-eqz p1, :cond_1

    .line 32
    .line 33
    iget-object p1, p0, Lcom/google/android/exoplayer2/j;->k:Lcom/google/android/exoplayer2/c0$d;

    .line 34
    .line 35
    iget-boolean p2, p1, Lcom/google/android/exoplayer2/c0$d;->i:Z

    .line 36
    .line 37
    if-nez p2, :cond_0

    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_0
    invoke-virtual {p1}, Lcom/google/android/exoplayer2/c0$d;->c()J

    .line 41
    .line 42
    .line 43
    move-result-wide p1

    .line 44
    iget-object v0, p0, Lcom/google/android/exoplayer2/j;->k:Lcom/google/android/exoplayer2/c0$d;

    .line 45
    .line 46
    iget-wide v0, v0, Lcom/google/android/exoplayer2/c0$d;->f:J

    .line 47
    .line 48
    sub-long/2addr p1, v0

    .line 49
    invoke-static {p1, p2}, Ll/bmk0;->J0(J)J

    .line 50
    .line 51
    .line 52
    move-result-wide p1

    .line 53
    iget-object p0, p0, Lcom/google/android/exoplayer2/j;->l:Lcom/google/android/exoplayer2/c0$b;

    .line 54
    .line 55
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/c0$b;->q()J

    .line 56
    .line 57
    .line 58
    move-result-wide v0

    .line 59
    add-long/2addr p3, v0

    .line 60
    sub-long/2addr p1, p3

    .line 61
    return-wide p1

    .line 62
    :cond_1
    :goto_0
    return-wide v2
.end method

.method public final D()J
    .locals 9

    .line 1
    iget-object v0, p0, Lcom/google/android/exoplayer2/j;->s:Lcom/google/android/exoplayer2/p;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/google/android/exoplayer2/p;->s()Ll/eyx;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    const-wide/16 v0, 0x0

    .line 10
    .line 11
    return-wide v0

    .line 12
    :cond_0
    invoke-virtual {v0}, Ll/eyx;->l()J

    .line 13
    .line 14
    .line 15
    move-result-wide v1

    .line 16
    iget-boolean v3, v0, Ll/eyx;->d:Z

    .line 17
    .line 18
    if-nez v3, :cond_1

    .line 19
    .line 20
    return-wide v1

    .line 21
    :cond_1
    const/4 v3, 0x0

    .line 22
    :goto_0
    iget-object v4, p0, Lcom/google/android/exoplayer2/j;->a:[Lcom/google/android/exoplayer2/x;

    .line 23
    .line 24
    array-length v5, v4

    .line 25
    if-ge v3, v5, :cond_5

    .line 26
    .line 27
    aget-object v4, v4, v3

    .line 28
    .line 29
    invoke-static {v4}, Lcom/google/android/exoplayer2/j;->U(Lcom/google/android/exoplayer2/x;)Z

    .line 30
    .line 31
    .line 32
    move-result v4

    .line 33
    if-eqz v4, :cond_4

    .line 34
    .line 35
    iget-object v4, p0, Lcom/google/android/exoplayer2/j;->a:[Lcom/google/android/exoplayer2/x;

    .line 36
    .line 37
    aget-object v4, v4, v3

    .line 38
    .line 39
    invoke-interface {v4}, Lcom/google/android/exoplayer2/x;->getStream()Ll/xwd0;

    .line 40
    .line 41
    .line 42
    move-result-object v4

    .line 43
    iget-object v5, v0, Ll/eyx;->c:[Ll/xwd0;

    .line 44
    .line 45
    aget-object v5, v5, v3

    .line 46
    .line 47
    if-eq v4, v5, :cond_2

    .line 48
    .line 49
    goto :goto_1

    .line 50
    :cond_2
    iget-object v4, p0, Lcom/google/android/exoplayer2/j;->a:[Lcom/google/android/exoplayer2/x;

    .line 51
    .line 52
    aget-object v4, v4, v3

    .line 53
    .line 54
    invoke-interface {v4}, Lcom/google/android/exoplayer2/x;->k()J

    .line 55
    .line 56
    .line 57
    move-result-wide v4

    .line 58
    const-wide/high16 v6, -0x8000000000000000L

    .line 59
    .line 60
    cmp-long v8, v4, v6

    .line 61
    .line 62
    if-nez v8, :cond_3

    .line 63
    .line 64
    return-wide v6

    .line 65
    :cond_3
    invoke-static {v4, v5, v1, v2}, Ljava/lang/Math;->max(JJ)J

    .line 66
    .line 67
    .line 68
    move-result-wide v1

    .line 69
    :cond_4
    :goto_1
    add-int/lit8 v3, v3, 0x1

    .line 70
    .line 71
    goto :goto_0

    .line 72
    :cond_5
    return-wide v1
.end method

.method public final E(Lcom/google/android/exoplayer2/c0;)Landroid/util/Pair;
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/exoplayer2/c0;",
            ")",
            "Landroid/util/Pair<",
            "Lcom/google/android/exoplayer2/source/i$b;",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Lcom/google/android/exoplayer2/c0;->u()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const-wide/16 v1, 0x0

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-static {}, Ll/fe80;->l()Lcom/google/android/exoplayer2/source/i$b;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    invoke-static {p0, p1}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    return-object p0

    .line 22
    :cond_0
    iget-boolean v0, p0, Lcom/google/android/exoplayer2/j;->F:Z

    .line 23
    .line 24
    invoke-virtual {p1, v0}, Lcom/google/android/exoplayer2/c0;->e(Z)I

    .line 25
    .line 26
    .line 27
    move-result v6

    .line 28
    iget-object v4, p0, Lcom/google/android/exoplayer2/j;->k:Lcom/google/android/exoplayer2/c0$d;

    .line 29
    .line 30
    iget-object v5, p0, Lcom/google/android/exoplayer2/j;->l:Lcom/google/android/exoplayer2/c0$b;

    .line 31
    .line 32
    const-wide v7, -0x7fffffffffffffffL    # -4.9E-324

    .line 33
    .line 34
    .line 35
    .line 36
    .line 37
    move-object v3, p1

    .line 38
    invoke-virtual/range {v3 .. v8}, Lcom/google/android/exoplayer2/c0;->n(Lcom/google/android/exoplayer2/c0$d;Lcom/google/android/exoplayer2/c0$b;IJ)Landroid/util/Pair;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    iget-object v0, p0, Lcom/google/android/exoplayer2/j;->s:Lcom/google/android/exoplayer2/p;

    .line 43
    .line 44
    iget-object v4, p1, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 45
    .line 46
    invoke-virtual {v0, v3, v4, v1, v2}, Lcom/google/android/exoplayer2/p;->E(Lcom/google/android/exoplayer2/c0;Ljava/lang/Object;J)Lcom/google/android/exoplayer2/source/i$b;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    iget-object p1, p1, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 51
    .line 52
    check-cast p1, Ljava/lang/Long;

    .line 53
    .line 54
    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    .line 55
    .line 56
    .line 57
    move-result-wide v4

    .line 58
    invoke-virtual {v0}, Ll/fyx;->b()Z

    .line 59
    .line 60
    .line 61
    move-result p1

    .line 62
    if-eqz p1, :cond_2

    .line 63
    .line 64
    iget-object p1, v0, Ll/fyx;->a:Ljava/lang/Object;

    .line 65
    .line 66
    iget-object v4, p0, Lcom/google/android/exoplayer2/j;->l:Lcom/google/android/exoplayer2/c0$b;

    .line 67
    .line 68
    invoke-virtual {v3, p1, v4}, Lcom/google/android/exoplayer2/c0;->l(Ljava/lang/Object;Lcom/google/android/exoplayer2/c0$b;)Lcom/google/android/exoplayer2/c0$b;

    .line 69
    .line 70
    .line 71
    iget p1, v0, Ll/fyx;->c:I

    .line 72
    .line 73
    iget-object v3, p0, Lcom/google/android/exoplayer2/j;->l:Lcom/google/android/exoplayer2/c0$b;

    .line 74
    .line 75
    iget v4, v0, Ll/fyx;->b:I

    .line 76
    .line 77
    invoke-virtual {v3, v4}, Lcom/google/android/exoplayer2/c0$b;->n(I)I

    .line 78
    .line 79
    .line 80
    move-result v3

    .line 81
    if-ne p1, v3, :cond_1

    .line 82
    .line 83
    iget-object p0, p0, Lcom/google/android/exoplayer2/j;->l:Lcom/google/android/exoplayer2/c0$b;

    .line 84
    .line 85
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/c0$b;->j()J

    .line 86
    .line 87
    .line 88
    move-result-wide v1

    .line 89
    :cond_1
    move-wide v4, v1

    .line 90
    :cond_2
    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 91
    .line 92
    .line 93
    move-result-object p0

    .line 94
    invoke-static {v0, p0}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    .line 95
    .line 96
    .line 97
    move-result-object p0

    .line 98
    return-object p0
.end method

.method public final E0(JJ)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/google/android/exoplayer2/j;->h:Ll/sxk;

    .line 2
    .line 3
    const/4 v0, 0x2

    .line 4
    add-long/2addr p1, p3

    .line 5
    invoke-interface {p0, v0, p1, p2}, Ll/sxk;->k(IJ)Z

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public F()Landroid/os/Looper;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/android/exoplayer2/j;->j:Landroid/os/Looper;

    .line 2
    .line 3
    return-object p0
.end method

.method public F0(Lcom/google/android/exoplayer2/c0;IJ)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/google/android/exoplayer2/j;->h:Ll/sxk;

    .line 2
    .line 3
    new-instance v0, Lcom/google/android/exoplayer2/j$h;

    .line 4
    .line 5
    invoke-direct {v0, p1, p2, p3, p4}, Lcom/google/android/exoplayer2/j$h;-><init>(Lcom/google/android/exoplayer2/c0;IJ)V

    .line 6
    .line 7
    .line 8
    const/4 p1, 0x3

    .line 9
    invoke-interface {p0, p1, v0}, Ll/sxk;->c(ILjava/lang/Object;)Ll/sxk$a;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-interface {p0}, Ll/sxk$a;->a()V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public final G()J
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/google/android/exoplayer2/j;->x:Ll/fe80;

    .line 2
    .line 3
    iget-wide v0, v0, Ll/fe80;->p:J

    .line 4
    .line 5
    invoke-virtual {p0, v0, v1}, Lcom/google/android/exoplayer2/j;->H(J)J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    return-wide v0
.end method

.method public final G0(Z)V
    .locals 11
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer2/ExoPlaybackException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/google/android/exoplayer2/j;->s:Lcom/google/android/exoplayer2/p;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/google/android/exoplayer2/p;->r()Ll/eyx;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v0, v0, Ll/eyx;->f:Ll/gyx;

    .line 8
    .line 9
    iget-object v2, v0, Ll/gyx;->a:Lcom/google/android/exoplayer2/source/i$b;

    .line 10
    .line 11
    iget-object v0, p0, Lcom/google/android/exoplayer2/j;->x:Ll/fe80;

    .line 12
    .line 13
    iget-wide v3, v0, Ll/fe80;->r:J

    .line 14
    .line 15
    const/4 v5, 0x1

    .line 16
    const/4 v6, 0x0

    .line 17
    move-object v1, p0

    .line 18
    invoke-virtual/range {v1 .. v6}, Lcom/google/android/exoplayer2/j;->J0(Lcom/google/android/exoplayer2/source/i$b;JZZ)J

    .line 19
    .line 20
    .line 21
    move-result-wide v3

    .line 22
    iget-object p0, v1, Lcom/google/android/exoplayer2/j;->x:Ll/fe80;

    .line 23
    .line 24
    iget-wide v5, p0, Ll/fe80;->r:J

    .line 25
    .line 26
    cmp-long p0, v3, v5

    .line 27
    .line 28
    if-eqz p0, :cond_0

    .line 29
    .line 30
    iget-object p0, v1, Lcom/google/android/exoplayer2/j;->x:Ll/fe80;

    .line 31
    .line 32
    iget-wide v5, p0, Ll/fe80;->c:J

    .line 33
    .line 34
    iget-wide v7, p0, Ll/fe80;->d:J

    .line 35
    .line 36
    const/4 v10, 0x5

    .line 37
    move v9, p1

    .line 38
    invoke-virtual/range {v1 .. v10}, Lcom/google/android/exoplayer2/j;->P(Lcom/google/android/exoplayer2/source/i$b;JJJZI)Ll/fe80;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    iput-object p0, v1, Lcom/google/android/exoplayer2/j;->x:Ll/fe80;

    .line 43
    .line 44
    :cond_0
    return-void
.end method

.method public final H(J)J
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/google/android/exoplayer2/j;->s:Lcom/google/android/exoplayer2/p;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/google/android/exoplayer2/p;->l()Ll/eyx;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-wide/16 v1, 0x0

    .line 8
    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    return-wide v1

    .line 12
    :cond_0
    iget-wide v3, p0, Lcom/google/android/exoplayer2/j;->L:J

    .line 13
    .line 14
    invoke-virtual {v0, v3, v4}, Ll/eyx;->y(J)J

    .line 15
    .line 16
    .line 17
    move-result-wide v3

    .line 18
    sub-long/2addr p1, v3

    .line 19
    invoke-static {v1, v2, p1, p2}, Ljava/lang/Math;->max(JJ)J

    .line 20
    .line 21
    .line 22
    move-result-wide p0

    .line 23
    return-wide p0
.end method

.method public final H0(Lcom/google/android/exoplayer2/j$h;)V
    .locals 17
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer2/ExoPlaybackException;
        }
    .end annotation

    .line 1
    move-object/from16 v1, p0

    .line 2
    .line 3
    iget-object v0, v1, Lcom/google/android/exoplayer2/j;->y:Lcom/google/android/exoplayer2/j$e;

    .line 4
    .line 5
    const/4 v9, 0x1

    .line 6
    invoke-virtual {v0, v9}, Lcom/google/android/exoplayer2/j$e;->b(I)V

    .line 7
    .line 8
    .line 9
    iget-object v0, v1, Lcom/google/android/exoplayer2/j;->x:Ll/fe80;

    .line 10
    .line 11
    iget-object v2, v0, Ll/fe80;->a:Lcom/google/android/exoplayer2/c0;

    .line 12
    .line 13
    iget v5, v1, Lcom/google/android/exoplayer2/j;->E:I

    .line 14
    .line 15
    iget-boolean v6, v1, Lcom/google/android/exoplayer2/j;->F:Z

    .line 16
    .line 17
    iget-object v7, v1, Lcom/google/android/exoplayer2/j;->k:Lcom/google/android/exoplayer2/c0$d;

    .line 18
    .line 19
    iget-object v8, v1, Lcom/google/android/exoplayer2/j;->l:Lcom/google/android/exoplayer2/c0$b;

    .line 20
    .line 21
    const/4 v4, 0x1

    .line 22
    move-object/from16 v3, p1

    .line 23
    .line 24
    invoke-static/range {v2 .. v8}, Lcom/google/android/exoplayer2/j;->C0(Lcom/google/android/exoplayer2/c0;Lcom/google/android/exoplayer2/j$h;ZIZLcom/google/android/exoplayer2/c0$d;Lcom/google/android/exoplayer2/c0$b;)Landroid/util/Pair;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    const-wide v6, -0x7fffffffffffffffL    # -4.9E-324

    .line 29
    .line 30
    .line 31
    .line 32
    .line 33
    const/4 v2, 0x0

    .line 34
    if-nez v0, :cond_0

    .line 35
    .line 36
    iget-object v8, v1, Lcom/google/android/exoplayer2/j;->x:Ll/fe80;

    .line 37
    .line 38
    iget-object v8, v8, Ll/fe80;->a:Lcom/google/android/exoplayer2/c0;

    .line 39
    .line 40
    invoke-virtual {v1, v8}, Lcom/google/android/exoplayer2/j;->E(Lcom/google/android/exoplayer2/c0;)Landroid/util/Pair;

    .line 41
    .line 42
    .line 43
    move-result-object v8

    .line 44
    iget-object v10, v8, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 45
    .line 46
    check-cast v10, Lcom/google/android/exoplayer2/source/i$b;

    .line 47
    .line 48
    iget-object v8, v8, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 49
    .line 50
    check-cast v8, Ljava/lang/Long;

    .line 51
    .line 52
    invoke-virtual {v8}, Ljava/lang/Long;->longValue()J

    .line 53
    .line 54
    .line 55
    move-result-wide v11

    .line 56
    iget-object v8, v1, Lcom/google/android/exoplayer2/j;->x:Ll/fe80;

    .line 57
    .line 58
    iget-object v8, v8, Ll/fe80;->a:Lcom/google/android/exoplayer2/c0;

    .line 59
    .line 60
    invoke-virtual {v8}, Lcom/google/android/exoplayer2/c0;->u()Z

    .line 61
    .line 62
    .line 63
    move-result v8

    .line 64
    xor-int/2addr v8, v9

    .line 65
    move-wide v5, v6

    .line 66
    :goto_0
    const-wide/16 v15, 0x0

    .line 67
    .line 68
    goto :goto_4

    .line 69
    :cond_0
    iget-object v8, v0, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 70
    .line 71
    iget-object v10, v0, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 72
    .line 73
    check-cast v10, Ljava/lang/Long;

    .line 74
    .line 75
    invoke-virtual {v10}, Ljava/lang/Long;->longValue()J

    .line 76
    .line 77
    .line 78
    move-result-wide v11

    .line 79
    iget-wide v13, v3, Lcom/google/android/exoplayer2/j$h;->c:J

    .line 80
    .line 81
    cmp-long v10, v13, v6

    .line 82
    .line 83
    if-nez v10, :cond_1

    .line 84
    .line 85
    move-wide v13, v6

    .line 86
    goto :goto_1

    .line 87
    :cond_1
    move-wide v13, v11

    .line 88
    :goto_1
    iget-object v10, v1, Lcom/google/android/exoplayer2/j;->s:Lcom/google/android/exoplayer2/p;

    .line 89
    .line 90
    iget-object v15, v1, Lcom/google/android/exoplayer2/j;->x:Ll/fe80;

    .line 91
    .line 92
    iget-object v15, v15, Ll/fe80;->a:Lcom/google/android/exoplayer2/c0;

    .line 93
    .line 94
    invoke-virtual {v10, v15, v8, v11, v12}, Lcom/google/android/exoplayer2/p;->E(Lcom/google/android/exoplayer2/c0;Ljava/lang/Object;J)Lcom/google/android/exoplayer2/source/i$b;

    .line 95
    .line 96
    .line 97
    move-result-object v10

    .line 98
    invoke-virtual {v10}, Ll/fyx;->b()Z

    .line 99
    .line 100
    .line 101
    move-result v8

    .line 102
    if-eqz v8, :cond_3

    .line 103
    .line 104
    iget-object v6, v1, Lcom/google/android/exoplayer2/j;->x:Ll/fe80;

    .line 105
    .line 106
    iget-object v6, v6, Ll/fe80;->a:Lcom/google/android/exoplayer2/c0;

    .line 107
    .line 108
    iget-object v7, v10, Ll/fyx;->a:Ljava/lang/Object;

    .line 109
    .line 110
    iget-object v8, v1, Lcom/google/android/exoplayer2/j;->l:Lcom/google/android/exoplayer2/c0$b;

    .line 111
    .line 112
    invoke-virtual {v6, v7, v8}, Lcom/google/android/exoplayer2/c0;->l(Ljava/lang/Object;Lcom/google/android/exoplayer2/c0$b;)Lcom/google/android/exoplayer2/c0$b;

    .line 113
    .line 114
    .line 115
    iget-object v6, v1, Lcom/google/android/exoplayer2/j;->l:Lcom/google/android/exoplayer2/c0$b;

    .line 116
    .line 117
    iget v7, v10, Ll/fyx;->b:I

    .line 118
    .line 119
    invoke-virtual {v6, v7}, Lcom/google/android/exoplayer2/c0$b;->n(I)I

    .line 120
    .line 121
    .line 122
    move-result v6

    .line 123
    iget v7, v10, Ll/fyx;->c:I

    .line 124
    .line 125
    if-ne v6, v7, :cond_2

    .line 126
    .line 127
    iget-object v6, v1, Lcom/google/android/exoplayer2/j;->l:Lcom/google/android/exoplayer2/c0$b;

    .line 128
    .line 129
    invoke-virtual {v6}, Lcom/google/android/exoplayer2/c0$b;->j()J

    .line 130
    .line 131
    .line 132
    move-result-wide v6

    .line 133
    move-wide v11, v6

    .line 134
    goto :goto_2

    .line 135
    :cond_2
    const-wide/16 v11, 0x0

    .line 136
    .line 137
    :goto_2
    move v8, v9

    .line 138
    move-wide v5, v13

    .line 139
    goto :goto_0

    .line 140
    :cond_3
    const-wide/16 v15, 0x0

    .line 141
    .line 142
    iget-wide v4, v3, Lcom/google/android/exoplayer2/j$h;->c:J

    .line 143
    .line 144
    cmp-long v4, v4, v6

    .line 145
    .line 146
    if-nez v4, :cond_4

    .line 147
    .line 148
    move v8, v9

    .line 149
    goto :goto_3

    .line 150
    :cond_4
    move v8, v2

    .line 151
    :goto_3
    move-wide v5, v13

    .line 152
    :goto_4
    :try_start_0
    iget-object v4, v1, Lcom/google/android/exoplayer2/j;->x:Ll/fe80;

    .line 153
    .line 154
    iget-object v4, v4, Ll/fe80;->a:Lcom/google/android/exoplayer2/c0;

    .line 155
    .line 156
    invoke-virtual {v4}, Lcom/google/android/exoplayer2/c0;->u()Z

    .line 157
    .line 158
    .line 159
    move-result v4
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 160
    if-eqz v4, :cond_5

    .line 161
    .line 162
    :try_start_1
    iput-object v3, v1, Lcom/google/android/exoplayer2/j;->K:Lcom/google/android/exoplayer2/j$h;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 163
    .line 164
    goto :goto_6

    .line 165
    :catchall_0
    move-exception v0

    .line 166
    move v9, v8

    .line 167
    move-object v2, v10

    .line 168
    :goto_5
    move-wide v3, v11

    .line 169
    goto/16 :goto_10

    .line 170
    .line 171
    :cond_5
    iget-object v3, v1, Lcom/google/android/exoplayer2/j;->x:Ll/fe80;

    .line 172
    .line 173
    const/4 v4, 0x4

    .line 174
    if-nez v0, :cond_7

    .line 175
    .line 176
    :try_start_2
    iget v0, v3, Ll/fe80;->e:I

    .line 177
    .line 178
    if-eq v0, v9, :cond_6

    .line 179
    .line 180
    invoke-virtual {v1, v4}, Lcom/google/android/exoplayer2/j;->j1(I)V

    .line 181
    .line 182
    .line 183
    :cond_6
    invoke-virtual {v1, v2, v9, v2, v9}, Lcom/google/android/exoplayer2/j;->v0(ZZZZ)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 184
    .line 185
    .line 186
    :goto_6
    move v9, v8

    .line 187
    move-object v2, v10

    .line 188
    move-wide v3, v11

    .line 189
    goto/16 :goto_e

    .line 190
    .line 191
    :cond_7
    :try_start_3
    iget-object v0, v3, Ll/fe80;->b:Lcom/google/android/exoplayer2/source/i$b;

    .line 192
    .line 193
    invoke-virtual {v10, v0}, Ll/fyx;->equals(Ljava/lang/Object;)Z

    .line 194
    .line 195
    .line 196
    move-result v0

    .line 197
    if-eqz v0, :cond_b

    .line 198
    .line 199
    iget-object v0, v1, Lcom/google/android/exoplayer2/j;->s:Lcom/google/android/exoplayer2/p;

    .line 200
    .line 201
    invoke-virtual {v0}, Lcom/google/android/exoplayer2/p;->r()Ll/eyx;

    .line 202
    .line 203
    .line 204
    move-result-object v0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 205
    if-eqz v0, :cond_8

    .line 206
    .line 207
    :try_start_4
    iget-boolean v3, v0, Ll/eyx;->d:Z

    .line 208
    .line 209
    if-eqz v3, :cond_8

    .line 210
    .line 211
    cmp-long v3, v11, v15

    .line 212
    .line 213
    if-eqz v3, :cond_8

    .line 214
    .line 215
    iget-object v0, v0, Ll/eyx;->a:Lcom/google/android/exoplayer2/source/h;

    .line 216
    .line 217
    iget-object v3, v1, Lcom/google/android/exoplayer2/j;->w:Ll/nke0;

    .line 218
    .line 219
    invoke-interface {v0, v11, v12, v3}, Lcom/google/android/exoplayer2/source/h;->g(JLl/nke0;)J

    .line 220
    .line 221
    .line 222
    move-result-wide v13
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 223
    goto :goto_7

    .line 224
    :cond_8
    move-wide v13, v11

    .line 225
    :goto_7
    :try_start_5
    invoke-static {v13, v14}, Ll/bmk0;->l1(J)J

    .line 226
    .line 227
    .line 228
    move-result-wide v15

    .line 229
    iget-object v0, v1, Lcom/google/android/exoplayer2/j;->x:Ll/fe80;

    .line 230
    .line 231
    iget-wide v2, v0, Ll/fe80;->r:J

    .line 232
    .line 233
    invoke-static {v2, v3}, Ll/bmk0;->l1(J)J

    .line 234
    .line 235
    .line 236
    move-result-wide v2

    .line 237
    cmp-long v0, v15, v2

    .line 238
    .line 239
    if-nez v0, :cond_9

    .line 240
    .line 241
    iget-object v0, v1, Lcom/google/android/exoplayer2/j;->x:Ll/fe80;

    .line 242
    .line 243
    iget v2, v0, Ll/fe80;->e:I

    .line 244
    .line 245
    const/4 v3, 0x2

    .line 246
    if-eq v2, v3, :cond_a

    .line 247
    .line 248
    const/4 v3, 0x3

    .line 249
    if-ne v2, v3, :cond_9

    .line 250
    .line 251
    goto :goto_8

    .line 252
    :cond_9
    move-object v2, v10

    .line 253
    goto :goto_b

    .line 254
    :cond_a
    :goto_8
    iget-wide v3, v0, Ll/fe80;->r:J
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    .line 255
    .line 256
    move-object v2, v10

    .line 257
    const/4 v10, 0x2

    .line 258
    move v9, v8

    .line 259
    move-wide v7, v3

    .line 260
    :goto_9
    invoke-virtual/range {v1 .. v10}, Lcom/google/android/exoplayer2/j;->P(Lcom/google/android/exoplayer2/source/i$b;JJJZI)Ll/fe80;

    .line 261
    .line 262
    .line 263
    move-result-object v0

    .line 264
    iput-object v0, v1, Lcom/google/android/exoplayer2/j;->x:Ll/fe80;

    .line 265
    .line 266
    return-void

    .line 267
    :catchall_1
    move-exception v0

    .line 268
    move-object v2, v10

    .line 269
    :goto_a
    move v9, v8

    .line 270
    goto :goto_5

    .line 271
    :cond_b
    move-object v2, v10

    .line 272
    move-wide v13, v11

    .line 273
    :goto_b
    :try_start_6
    iget-object v0, v1, Lcom/google/android/exoplayer2/j;->x:Ll/fe80;

    .line 274
    .line 275
    iget v0, v0, Ll/fe80;->e:I

    .line 276
    .line 277
    if-ne v0, v4, :cond_c

    .line 278
    .line 279
    move v0, v9

    .line 280
    goto :goto_c

    .line 281
    :cond_c
    const/4 v0, 0x0

    .line 282
    :goto_c
    invoke-virtual {v1, v2, v13, v14, v0}, Lcom/google/android/exoplayer2/j;->I0(Lcom/google/android/exoplayer2/source/i$b;JZ)J

    .line 283
    .line 284
    .line 285
    move-result-wide v13
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_5

    .line 286
    cmp-long v0, v11, v13

    .line 287
    .line 288
    if-eqz v0, :cond_d

    .line 289
    .line 290
    goto :goto_d

    .line 291
    :cond_d
    const/4 v9, 0x0

    .line 292
    :goto_d
    or-int/2addr v9, v8

    .line 293
    :try_start_7
    iget-object v0, v1, Lcom/google/android/exoplayer2/j;->x:Ll/fe80;
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_4

    .line 294
    .line 295
    move-object v3, v2

    .line 296
    :try_start_8
    iget-object v2, v0, Ll/fe80;->a:Lcom/google/android/exoplayer2/c0;

    .line 297
    .line 298
    iget-object v0, v0, Ll/fe80;->b:Lcom/google/android/exoplayer2/source/i$b;
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_3

    .line 299
    .line 300
    const/4 v8, 0x1

    .line 301
    move-object v4, v2

    .line 302
    move-wide v6, v5

    .line 303
    move-object v5, v0

    .line 304
    :try_start_9
    invoke-virtual/range {v1 .. v8}, Lcom/google/android/exoplayer2/j;->x1(Lcom/google/android/exoplayer2/c0;Lcom/google/android/exoplayer2/source/i$b;Lcom/google/android/exoplayer2/c0;Lcom/google/android/exoplayer2/source/i$b;JZ)V
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_2

    .line 305
    .line 306
    .line 307
    move-object v2, v3

    .line 308
    move-wide v5, v6

    .line 309
    move-wide v3, v13

    .line 310
    :goto_e
    const/4 v10, 0x2

    .line 311
    move-wide v7, v3

    .line 312
    move-object/from16 v1, p0

    .line 313
    .line 314
    goto :goto_9

    .line 315
    :catchall_2
    move-exception v0

    .line 316
    move-object v2, v3

    .line 317
    move-wide v5, v6

    .line 318
    :goto_f
    move-wide v3, v13

    .line 319
    goto :goto_10

    .line 320
    :catchall_3
    move-exception v0

    .line 321
    move-object v2, v3

    .line 322
    goto :goto_f

    .line 323
    :catchall_4
    move-exception v0

    .line 324
    goto :goto_f

    .line 325
    :catchall_5
    move-exception v0

    .line 326
    goto :goto_a

    .line 327
    :goto_10
    const/4 v10, 0x2

    .line 328
    move-wide v7, v3

    .line 329
    invoke-virtual/range {v1 .. v10}, Lcom/google/android/exoplayer2/j;->P(Lcom/google/android/exoplayer2/source/i$b;JJJZI)Ll/fe80;

    .line 330
    .line 331
    .line 332
    move-result-object v2

    .line 333
    iput-object v2, v1, Lcom/google/android/exoplayer2/j;->x:Ll/fe80;

    .line 334
    .line 335
    throw v0
.end method

.method public final I(Lcom/google/android/exoplayer2/source/h;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/google/android/exoplayer2/j;->s:Lcom/google/android/exoplayer2/p;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Lcom/google/android/exoplayer2/p;->y(Lcom/google/android/exoplayer2/source/h;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-nez p1, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    iget-object p1, p0, Lcom/google/android/exoplayer2/j;->s:Lcom/google/android/exoplayer2/p;

    .line 11
    .line 12
    iget-wide v0, p0, Lcom/google/android/exoplayer2/j;->L:J

    .line 13
    .line 14
    invoke-virtual {p1, v0, v1}, Lcom/google/android/exoplayer2/p;->B(J)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/j;->X()V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public final I0(Lcom/google/android/exoplayer2/source/i$b;JZ)J
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer2/ExoPlaybackException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/google/android/exoplayer2/j;->s:Lcom/google/android/exoplayer2/p;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/google/android/exoplayer2/p;->r()Ll/eyx;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v1, p0, Lcom/google/android/exoplayer2/j;->s:Lcom/google/android/exoplayer2/p;

    .line 8
    .line 9
    invoke-virtual {v1}, Lcom/google/android/exoplayer2/p;->s()Ll/eyx;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    if-eq v0, v1, :cond_0

    .line 14
    .line 15
    const/4 v0, 0x1

    .line 16
    :goto_0
    move-object v1, p0

    .line 17
    move-object v2, p1

    .line 18
    move-wide v3, p2

    .line 19
    move v6, p4

    .line 20
    move v5, v0

    .line 21
    goto :goto_1

    .line 22
    :cond_0
    const/4 v0, 0x0

    .line 23
    goto :goto_0

    .line 24
    :goto_1
    invoke-virtual/range {v1 .. v6}, Lcom/google/android/exoplayer2/j;->J0(Lcom/google/android/exoplayer2/source/i$b;JZZ)J

    .line 25
    .line 26
    .line 27
    move-result-wide p0

    .line 28
    return-wide p0
.end method

.method public final J(Ljava/io/IOException;I)V
    .locals 1

    .line 1
    invoke-static {p1, p2}, Lcom/google/android/exoplayer2/ExoPlaybackException;->createForSource(Ljava/io/IOException;I)Lcom/google/android/exoplayer2/ExoPlaybackException;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iget-object p2, p0, Lcom/google/android/exoplayer2/j;->s:Lcom/google/android/exoplayer2/p;

    .line 6
    .line 7
    invoke-virtual {p2}, Lcom/google/android/exoplayer2/p;->r()Ll/eyx;

    .line 8
    .line 9
    .line 10
    move-result-object p2

    .line 11
    if-eqz p2, :cond_0

    .line 12
    .line 13
    iget-object p2, p2, Ll/eyx;->f:Ll/gyx;

    .line 14
    .line 15
    iget-object p2, p2, Ll/gyx;->a:Lcom/google/android/exoplayer2/source/i$b;

    .line 16
    .line 17
    invoke-virtual {p1, p2}, Lcom/google/android/exoplayer2/ExoPlaybackException;->copyWithMediaPeriodId(Ll/fyx;)Lcom/google/android/exoplayer2/ExoPlaybackException;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    :cond_0
    const-string p2, "ExoPlayerImplInternal"

    .line 22
    .line 23
    const-string v0, "Playback error"

    .line 24
    .line 25
    invoke-static {p2, v0, p1}, Ll/kyv;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 26
    .line 27
    .line 28
    const/4 p2, 0x0

    .line 29
    invoke-virtual {p0, p2, p2}, Lcom/google/android/exoplayer2/j;->r1(ZZ)V

    .line 30
    .line 31
    .line 32
    iget-object p2, p0, Lcom/google/android/exoplayer2/j;->x:Ll/fe80;

    .line 33
    .line 34
    invoke-virtual {p2, p1}, Ll/fe80;->f(Lcom/google/android/exoplayer2/ExoPlaybackException;)Ll/fe80;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    iput-object p1, p0, Lcom/google/android/exoplayer2/j;->x:Ll/fe80;

    .line 39
    .line 40
    return-void
.end method

.method public final J0(Lcom/google/android/exoplayer2/source/i$b;JZZ)J
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer2/ExoPlaybackException;
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/j;->s1()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Lcom/google/android/exoplayer2/j;->C:Z

    .line 6
    .line 7
    const/4 v1, 0x2

    .line 8
    if-nez p5, :cond_0

    .line 9
    .line 10
    iget-object p5, p0, Lcom/google/android/exoplayer2/j;->x:Ll/fe80;

    .line 11
    .line 12
    iget p5, p5, Ll/fe80;->e:I

    .line 13
    .line 14
    const/4 v2, 0x3

    .line 15
    if-ne p5, v2, :cond_1

    .line 16
    .line 17
    :cond_0
    invoke-virtual {p0, v1}, Lcom/google/android/exoplayer2/j;->j1(I)V

    .line 18
    .line 19
    .line 20
    :cond_1
    iget-object p5, p0, Lcom/google/android/exoplayer2/j;->s:Lcom/google/android/exoplayer2/p;

    .line 21
    .line 22
    invoke-virtual {p5}, Lcom/google/android/exoplayer2/p;->r()Ll/eyx;

    .line 23
    .line 24
    .line 25
    move-result-object p5

    .line 26
    move-object v2, p5

    .line 27
    :goto_0
    if-eqz v2, :cond_3

    .line 28
    .line 29
    iget-object v3, v2, Ll/eyx;->f:Ll/gyx;

    .line 30
    .line 31
    iget-object v3, v3, Ll/gyx;->a:Lcom/google/android/exoplayer2/source/i$b;

    .line 32
    .line 33
    invoke-virtual {p1, v3}, Ll/fyx;->equals(Ljava/lang/Object;)Z

    .line 34
    .line 35
    .line 36
    move-result v3

    .line 37
    if-eqz v3, :cond_2

    .line 38
    .line 39
    goto :goto_1

    .line 40
    :cond_2
    invoke-virtual {v2}, Ll/eyx;->j()Ll/eyx;

    .line 41
    .line 42
    .line 43
    move-result-object v2

    .line 44
    goto :goto_0

    .line 45
    :cond_3
    :goto_1
    if-nez p4, :cond_4

    .line 46
    .line 47
    if-ne p5, v2, :cond_4

    .line 48
    .line 49
    if-eqz v2, :cond_7

    .line 50
    .line 51
    invoke-virtual {v2, p2, p3}, Ll/eyx;->z(J)J

    .line 52
    .line 53
    .line 54
    move-result-wide p4

    .line 55
    const-wide/16 v3, 0x0

    .line 56
    .line 57
    cmp-long p1, p4, v3

    .line 58
    .line 59
    if-gez p1, :cond_7

    .line 60
    .line 61
    :cond_4
    iget-object p1, p0, Lcom/google/android/exoplayer2/j;->a:[Lcom/google/android/exoplayer2/x;

    .line 62
    .line 63
    array-length p4, p1

    .line 64
    move p5, v0

    .line 65
    :goto_2
    if-ge p5, p4, :cond_5

    .line 66
    .line 67
    aget-object v3, p1, p5

    .line 68
    .line 69
    invoke-virtual {p0, v3}, Lcom/google/android/exoplayer2/j;->q(Lcom/google/android/exoplayer2/x;)V

    .line 70
    .line 71
    .line 72
    add-int/lit8 p5, p5, 0x1

    .line 73
    .line 74
    goto :goto_2

    .line 75
    :cond_5
    if-eqz v2, :cond_7

    .line 76
    .line 77
    :goto_3
    iget-object p1, p0, Lcom/google/android/exoplayer2/j;->s:Lcom/google/android/exoplayer2/p;

    .line 78
    .line 79
    invoke-virtual {p1}, Lcom/google/android/exoplayer2/p;->r()Ll/eyx;

    .line 80
    .line 81
    .line 82
    move-result-object p1

    .line 83
    iget-object p4, p0, Lcom/google/android/exoplayer2/j;->s:Lcom/google/android/exoplayer2/p;

    .line 84
    .line 85
    if-eq p1, v2, :cond_6

    .line 86
    .line 87
    invoke-virtual {p4}, Lcom/google/android/exoplayer2/p;->b()Ll/eyx;

    .line 88
    .line 89
    .line 90
    goto :goto_3

    .line 91
    :cond_6
    invoke-virtual {p4, v2}, Lcom/google/android/exoplayer2/p;->C(Ll/eyx;)Z

    .line 92
    .line 93
    .line 94
    const-wide p4, 0xe8d4a51000L

    .line 95
    .line 96
    .line 97
    .line 98
    .line 99
    invoke-virtual {v2, p4, p5}, Ll/eyx;->x(J)V

    .line 100
    .line 101
    .line 102
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/j;->u()V

    .line 103
    .line 104
    .line 105
    :cond_7
    iget-object p1, p0, Lcom/google/android/exoplayer2/j;->s:Lcom/google/android/exoplayer2/p;

    .line 106
    .line 107
    if-eqz v2, :cond_a

    .line 108
    .line 109
    invoke-virtual {p1, v2}, Lcom/google/android/exoplayer2/p;->C(Ll/eyx;)Z

    .line 110
    .line 111
    .line 112
    iget-boolean p1, v2, Ll/eyx;->d:Z

    .line 113
    .line 114
    if-nez p1, :cond_8

    .line 115
    .line 116
    iget-object p1, v2, Ll/eyx;->f:Ll/gyx;

    .line 117
    .line 118
    invoke-virtual {p1, p2, p3}, Ll/gyx;->b(J)Ll/gyx;

    .line 119
    .line 120
    .line 121
    move-result-object p1

    .line 122
    iput-object p1, v2, Ll/eyx;->f:Ll/gyx;

    .line 123
    .line 124
    goto :goto_4

    .line 125
    :cond_8
    iget-boolean p1, v2, Ll/eyx;->e:Z

    .line 126
    .line 127
    if-eqz p1, :cond_9

    .line 128
    .line 129
    iget-object p1, v2, Ll/eyx;->a:Lcom/google/android/exoplayer2/source/h;

    .line 130
    .line 131
    invoke-interface {p1, p2, p3}, Lcom/google/android/exoplayer2/source/h;->h(J)J

    .line 132
    .line 133
    .line 134
    move-result-wide p2

    .line 135
    iget-object p1, v2, Ll/eyx;->a:Lcom/google/android/exoplayer2/source/h;

    .line 136
    .line 137
    iget-wide p4, p0, Lcom/google/android/exoplayer2/j;->m:J

    .line 138
    .line 139
    sub-long p4, p2, p4

    .line 140
    .line 141
    iget-boolean v2, p0, Lcom/google/android/exoplayer2/j;->n:Z

    .line 142
    .line 143
    invoke-interface {p1, p4, p5, v2}, Lcom/google/android/exoplayer2/source/h;->t(JZ)V

    .line 144
    .line 145
    .line 146
    :cond_9
    :goto_4
    invoke-virtual {p0, p2, p3}, Lcom/google/android/exoplayer2/j;->x0(J)V

    .line 147
    .line 148
    .line 149
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/j;->X()V

    .line 150
    .line 151
    .line 152
    goto :goto_5

    .line 153
    :cond_a
    invoke-virtual {p1}, Lcom/google/android/exoplayer2/p;->f()V

    .line 154
    .line 155
    .line 156
    invoke-virtual {p0, p2, p3}, Lcom/google/android/exoplayer2/j;->x0(J)V

    .line 157
    .line 158
    .line 159
    :goto_5
    invoke-virtual {p0, v0}, Lcom/google/android/exoplayer2/j;->K(Z)V

    .line 160
    .line 161
    .line 162
    iget-object p0, p0, Lcom/google/android/exoplayer2/j;->h:Ll/sxk;

    .line 163
    .line 164
    invoke-interface {p0, v1}, Ll/sxk;->j(I)Z

    .line 165
    .line 166
    .line 167
    return-wide p2
.end method

.method public final K(Z)V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/google/android/exoplayer2/j;->s:Lcom/google/android/exoplayer2/p;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/google/android/exoplayer2/p;->l()Ll/eyx;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget-object v1, p0, Lcom/google/android/exoplayer2/j;->x:Ll/fe80;

    .line 10
    .line 11
    iget-object v1, v1, Ll/fe80;->b:Lcom/google/android/exoplayer2/source/i$b;

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    iget-object v1, v0, Ll/eyx;->f:Ll/gyx;

    .line 15
    .line 16
    iget-object v1, v1, Ll/gyx;->a:Lcom/google/android/exoplayer2/source/i$b;

    .line 17
    .line 18
    :goto_0
    iget-object v2, p0, Lcom/google/android/exoplayer2/j;->x:Ll/fe80;

    .line 19
    .line 20
    iget-object v2, v2, Ll/fe80;->k:Lcom/google/android/exoplayer2/source/i$b;

    .line 21
    .line 22
    invoke-virtual {v2, v1}, Ll/fyx;->equals(Ljava/lang/Object;)Z

    .line 23
    .line 24
    .line 25
    move-result v2

    .line 26
    if-nez v2, :cond_1

    .line 27
    .line 28
    iget-object v3, p0, Lcom/google/android/exoplayer2/j;->x:Ll/fe80;

    .line 29
    .line 30
    invoke-virtual {v3, v1}, Ll/fe80;->c(Lcom/google/android/exoplayer2/source/i$b;)Ll/fe80;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    iput-object v1, p0, Lcom/google/android/exoplayer2/j;->x:Ll/fe80;

    .line 35
    .line 36
    :cond_1
    iget-object v1, p0, Lcom/google/android/exoplayer2/j;->x:Ll/fe80;

    .line 37
    .line 38
    if-nez v0, :cond_2

    .line 39
    .line 40
    iget-wide v3, v1, Ll/fe80;->r:J

    .line 41
    .line 42
    goto :goto_1

    .line 43
    :cond_2
    invoke-virtual {v0}, Ll/eyx;->i()J

    .line 44
    .line 45
    .line 46
    move-result-wide v3

    .line 47
    :goto_1
    iput-wide v3, v1, Ll/fe80;->p:J

    .line 48
    .line 49
    iget-object v1, p0, Lcom/google/android/exoplayer2/j;->x:Ll/fe80;

    .line 50
    .line 51
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/j;->G()J

    .line 52
    .line 53
    .line 54
    move-result-wide v3

    .line 55
    iput-wide v3, v1, Ll/fe80;->q:J

    .line 56
    .line 57
    if-eqz v2, :cond_3

    .line 58
    .line 59
    if-eqz p1, :cond_4

    .line 60
    .line 61
    :cond_3
    if-eqz v0, :cond_4

    .line 62
    .line 63
    iget-boolean p1, v0, Ll/eyx;->d:Z

    .line 64
    .line 65
    if-eqz p1, :cond_4

    .line 66
    .line 67
    iget-object p1, v0, Ll/eyx;->f:Ll/gyx;

    .line 68
    .line 69
    iget-object p1, p1, Ll/gyx;->a:Lcom/google/android/exoplayer2/source/i$b;

    .line 70
    .line 71
    invoke-virtual {v0}, Ll/eyx;->n()Ll/ffj0;

    .line 72
    .line 73
    .line 74
    move-result-object v1

    .line 75
    invoke-virtual {v0}, Ll/eyx;->o()Ll/dgj0;

    .line 76
    .line 77
    .line 78
    move-result-object v0

    .line 79
    invoke-virtual {p0, p1, v1, v0}, Lcom/google/android/exoplayer2/j;->u1(Lcom/google/android/exoplayer2/source/i$b;Ll/ffj0;Ll/dgj0;)V

    .line 80
    .line 81
    .line 82
    :cond_4
    return-void
.end method

.method public final K0(Lcom/google/android/exoplayer2/u;)V
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer2/ExoPlaybackException;
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Lcom/google/android/exoplayer2/u;->f()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    const-wide v2, -0x7fffffffffffffffL    # -4.9E-324

    .line 6
    .line 7
    .line 8
    .line 9
    .line 10
    cmp-long v0, v0, v2

    .line 11
    .line 12
    if-nez v0, :cond_0

    .line 13
    .line 14
    invoke-virtual {p0, p1}, Lcom/google/android/exoplayer2/j;->L0(Lcom/google/android/exoplayer2/u;)V

    .line 15
    .line 16
    .line 17
    return-void

    .line 18
    :cond_0
    iget-object v0, p0, Lcom/google/android/exoplayer2/j;->x:Ll/fe80;

    .line 19
    .line 20
    iget-object v0, v0, Ll/fe80;->a:Lcom/google/android/exoplayer2/c0;

    .line 21
    .line 22
    invoke-virtual {v0}, Lcom/google/android/exoplayer2/c0;->u()Z

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    if-eqz v0, :cond_1

    .line 27
    .line 28
    iget-object p0, p0, Lcom/google/android/exoplayer2/j;->p:Ljava/util/ArrayList;

    .line 29
    .line 30
    new-instance v0, Lcom/google/android/exoplayer2/j$d;

    .line 31
    .line 32
    invoke-direct {v0, p1}, Lcom/google/android/exoplayer2/j$d;-><init>(Lcom/google/android/exoplayer2/u;)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 36
    .line 37
    .line 38
    return-void

    .line 39
    :cond_1
    new-instance v1, Lcom/google/android/exoplayer2/j$d;

    .line 40
    .line 41
    invoke-direct {v1, p1}, Lcom/google/android/exoplayer2/j$d;-><init>(Lcom/google/android/exoplayer2/u;)V

    .line 42
    .line 43
    .line 44
    iget-object v0, p0, Lcom/google/android/exoplayer2/j;->x:Ll/fe80;

    .line 45
    .line 46
    iget-object v2, v0, Ll/fe80;->a:Lcom/google/android/exoplayer2/c0;

    .line 47
    .line 48
    iget v4, p0, Lcom/google/android/exoplayer2/j;->E:I

    .line 49
    .line 50
    iget-boolean v5, p0, Lcom/google/android/exoplayer2/j;->F:Z

    .line 51
    .line 52
    iget-object v6, p0, Lcom/google/android/exoplayer2/j;->k:Lcom/google/android/exoplayer2/c0$d;

    .line 53
    .line 54
    iget-object v7, p0, Lcom/google/android/exoplayer2/j;->l:Lcom/google/android/exoplayer2/c0$b;

    .line 55
    .line 56
    move-object v3, v2

    .line 57
    invoke-static/range {v1 .. v7}, Lcom/google/android/exoplayer2/j;->z0(Lcom/google/android/exoplayer2/j$d;Lcom/google/android/exoplayer2/c0;Lcom/google/android/exoplayer2/c0;IZLcom/google/android/exoplayer2/c0$d;Lcom/google/android/exoplayer2/c0$b;)Z

    .line 58
    .line 59
    .line 60
    move-result v0

    .line 61
    if-eqz v0, :cond_2

    .line 62
    .line 63
    iget-object p1, p0, Lcom/google/android/exoplayer2/j;->p:Ljava/util/ArrayList;

    .line 64
    .line 65
    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 66
    .line 67
    .line 68
    iget-object p0, p0, Lcom/google/android/exoplayer2/j;->p:Ljava/util/ArrayList;

    .line 69
    .line 70
    invoke-static {p0}, Ljava/util/Collections;->sort(Ljava/util/List;)V

    .line 71
    .line 72
    .line 73
    return-void

    .line 74
    :cond_2
    const/4 p0, 0x0

    .line 75
    invoke-virtual {p1, p0}, Lcom/google/android/exoplayer2/u;->k(Z)V

    .line 76
    .line 77
    .line 78
    return-void
.end method

.method public final L(Lcom/google/android/exoplayer2/c0;Z)V
    .locals 22
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer2/ExoPlaybackException;
        }
    .end annotation

    .line 1
    move-object/from16 v1, p0

    .line 2
    .line 3
    iget-object v3, v1, Lcom/google/android/exoplayer2/j;->x:Ll/fe80;

    .line 4
    .line 5
    iget-object v4, v1, Lcom/google/android/exoplayer2/j;->K:Lcom/google/android/exoplayer2/j$h;

    .line 6
    .line 7
    iget-object v5, v1, Lcom/google/android/exoplayer2/j;->s:Lcom/google/android/exoplayer2/p;

    .line 8
    .line 9
    iget v6, v1, Lcom/google/android/exoplayer2/j;->E:I

    .line 10
    .line 11
    iget-boolean v7, v1, Lcom/google/android/exoplayer2/j;->F:Z

    .line 12
    .line 13
    iget-object v8, v1, Lcom/google/android/exoplayer2/j;->k:Lcom/google/android/exoplayer2/c0$d;

    .line 14
    .line 15
    iget-object v9, v1, Lcom/google/android/exoplayer2/j;->l:Lcom/google/android/exoplayer2/c0$b;

    .line 16
    .line 17
    move-object/from16 v2, p1

    .line 18
    .line 19
    invoke-static/range {v2 .. v9}, Lcom/google/android/exoplayer2/j;->B0(Lcom/google/android/exoplayer2/c0;Ll/fe80;Lcom/google/android/exoplayer2/j$h;Lcom/google/android/exoplayer2/p;IZLcom/google/android/exoplayer2/c0$d;Lcom/google/android/exoplayer2/c0$b;)Lcom/google/android/exoplayer2/j$g;

    .line 20
    .line 21
    .line 22
    move-result-object v8

    .line 23
    iget-object v9, v8, Lcom/google/android/exoplayer2/j$g;->a:Lcom/google/android/exoplayer2/source/i$b;

    .line 24
    .line 25
    iget-wide v10, v8, Lcom/google/android/exoplayer2/j$g;->c:J

    .line 26
    .line 27
    iget-boolean v0, v8, Lcom/google/android/exoplayer2/j$g;->d:Z

    .line 28
    .line 29
    iget-wide v12, v8, Lcom/google/android/exoplayer2/j$g;->b:J

    .line 30
    .line 31
    iget-object v2, v1, Lcom/google/android/exoplayer2/j;->x:Ll/fe80;

    .line 32
    .line 33
    iget-object v2, v2, Ll/fe80;->b:Lcom/google/android/exoplayer2/source/i$b;

    .line 34
    .line 35
    invoke-virtual {v2, v9}, Ll/fyx;->equals(Ljava/lang/Object;)Z

    .line 36
    .line 37
    .line 38
    move-result v2

    .line 39
    const/4 v14, 0x1

    .line 40
    const/4 v15, 0x0

    .line 41
    if-eqz v2, :cond_1

    .line 42
    .line 43
    iget-object v2, v1, Lcom/google/android/exoplayer2/j;->x:Ll/fe80;

    .line 44
    .line 45
    iget-wide v2, v2, Ll/fe80;->r:J

    .line 46
    .line 47
    cmp-long v2, v12, v2

    .line 48
    .line 49
    if-eqz v2, :cond_0

    .line 50
    .line 51
    goto :goto_0

    .line 52
    :cond_0
    move/from16 v16, v15

    .line 53
    .line 54
    goto :goto_1

    .line 55
    :cond_1
    :goto_0
    move/from16 v16, v14

    .line 56
    .line 57
    :goto_1
    const/4 v2, 0x0

    .line 58
    const/16 v17, 0x3

    .line 59
    .line 60
    const/4 v3, -0x1

    .line 61
    const-wide v18, -0x7fffffffffffffffL    # -4.9E-324

    .line 62
    .line 63
    .line 64
    .line 65
    .line 66
    const/4 v4, 0x4

    .line 67
    :try_start_0
    iget-boolean v5, v8, Lcom/google/android/exoplayer2/j$g;->e:Z

    .line 68
    .line 69
    if-eqz v5, :cond_3

    .line 70
    .line 71
    iget-object v5, v1, Lcom/google/android/exoplayer2/j;->x:Ll/fe80;

    .line 72
    .line 73
    iget v5, v5, Ll/fe80;->e:I

    .line 74
    .line 75
    if-eq v5, v14, :cond_2

    .line 76
    .line 77
    invoke-virtual {v1, v4}, Lcom/google/android/exoplayer2/j;->j1(I)V

    .line 78
    .line 79
    .line 80
    goto :goto_2

    .line 81
    :catchall_0
    move-exception v0

    .line 82
    move v14, v3

    .line 83
    move/from16 v21, v4

    .line 84
    .line 85
    move-object v3, v9

    .line 86
    move-wide v9, v10

    .line 87
    move-object/from16 v11, p1

    .line 88
    .line 89
    goto/16 :goto_c

    .line 90
    .line 91
    :cond_2
    :goto_2
    invoke-virtual {v1, v15, v15, v15, v14}, Lcom/google/android/exoplayer2/j;->v0(ZZZZ)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 92
    .line 93
    .line 94
    :cond_3
    if-nez v16, :cond_4

    .line 95
    .line 96
    move-object v5, v2

    .line 97
    :try_start_1
    iget-object v2, v1, Lcom/google/android/exoplayer2/j;->s:Lcom/google/android/exoplayer2/p;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_5

    .line 98
    .line 99
    move v7, v4

    .line 100
    move-object v6, v5

    .line 101
    :try_start_2
    iget-wide v4, v1, Lcom/google/android/exoplayer2/j;->L:J
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_4

    .line 102
    .line 103
    move-object/from16 v20, v6

    .line 104
    .line 105
    move/from16 v21, v7

    .line 106
    .line 107
    :try_start_3
    invoke-virtual {v1}, Lcom/google/android/exoplayer2/j;->D()J

    .line 108
    .line 109
    .line 110
    move-result-wide v6
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_3

    .line 111
    move v14, v3

    .line 112
    move-object/from16 v3, p1

    .line 113
    .line 114
    :try_start_4
    invoke-virtual/range {v2 .. v7}, Lcom/google/android/exoplayer2/p;->I(Lcom/google/android/exoplayer2/c0;JJ)Z

    .line 115
    .line 116
    .line 117
    move-result v0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    .line 118
    move-object v2, v3

    .line 119
    if-nez v0, :cond_7

    .line 120
    .line 121
    :try_start_5
    invoke-virtual {v1, v15}, Lcom/google/android/exoplayer2/j;->G0(Z)V

    .line 122
    .line 123
    .line 124
    goto :goto_5

    .line 125
    :catchall_1
    move-exception v0

    .line 126
    :goto_3
    move-object v3, v9

    .line 127
    move-wide v9, v10

    .line 128
    move-object v11, v2

    .line 129
    goto/16 :goto_c

    .line 130
    .line 131
    :catchall_2
    move-exception v0

    .line 132
    move-object v2, v3

    .line 133
    goto :goto_3

    .line 134
    :catchall_3
    move-exception v0

    .line 135
    move-object/from16 v2, p1

    .line 136
    .line 137
    move v14, v3

    .line 138
    goto :goto_3

    .line 139
    :catchall_4
    move-exception v0

    .line 140
    move-object/from16 v2, p1

    .line 141
    .line 142
    move v14, v3

    .line 143
    move/from16 v21, v7

    .line 144
    .line 145
    goto :goto_3

    .line 146
    :catchall_5
    move-exception v0

    .line 147
    move-object/from16 v2, p1

    .line 148
    .line 149
    move v14, v3

    .line 150
    move/from16 v21, v4

    .line 151
    .line 152
    goto :goto_3

    .line 153
    :cond_4
    move-object/from16 v2, p1

    .line 154
    .line 155
    move v14, v3

    .line 156
    move/from16 v21, v4

    .line 157
    .line 158
    invoke-virtual {v2}, Lcom/google/android/exoplayer2/c0;->u()Z

    .line 159
    .line 160
    .line 161
    move-result v3

    .line 162
    if-nez v3, :cond_7

    .line 163
    .line 164
    iget-object v3, v1, Lcom/google/android/exoplayer2/j;->s:Lcom/google/android/exoplayer2/p;

    .line 165
    .line 166
    invoke-virtual {v3}, Lcom/google/android/exoplayer2/p;->r()Ll/eyx;

    .line 167
    .line 168
    .line 169
    move-result-object v3

    .line 170
    :goto_4
    if-eqz v3, :cond_6

    .line 171
    .line 172
    iget-object v4, v3, Ll/eyx;->f:Ll/gyx;

    .line 173
    .line 174
    iget-object v4, v4, Ll/gyx;->a:Lcom/google/android/exoplayer2/source/i$b;

    .line 175
    .line 176
    invoke-virtual {v4, v9}, Ll/fyx;->equals(Ljava/lang/Object;)Z

    .line 177
    .line 178
    .line 179
    move-result v4

    .line 180
    if-eqz v4, :cond_5

    .line 181
    .line 182
    iget-object v4, v1, Lcom/google/android/exoplayer2/j;->s:Lcom/google/android/exoplayer2/p;

    .line 183
    .line 184
    iget-object v5, v3, Ll/eyx;->f:Ll/gyx;

    .line 185
    .line 186
    invoke-virtual {v4, v2, v5}, Lcom/google/android/exoplayer2/p;->t(Lcom/google/android/exoplayer2/c0;Ll/gyx;)Ll/gyx;

    .line 187
    .line 188
    .line 189
    move-result-object v4

    .line 190
    iput-object v4, v3, Ll/eyx;->f:Ll/gyx;

    .line 191
    .line 192
    invoke-virtual {v3}, Ll/eyx;->A()V

    .line 193
    .line 194
    .line 195
    :cond_5
    invoke-virtual {v3}, Ll/eyx;->j()Ll/eyx;

    .line 196
    .line 197
    .line 198
    move-result-object v3

    .line 199
    goto :goto_4

    .line 200
    :cond_6
    invoke-virtual {v1, v9, v12, v13, v0}, Lcom/google/android/exoplayer2/j;->I0(Lcom/google/android/exoplayer2/source/i$b;JZ)J

    .line 201
    .line 202
    .line 203
    move-result-wide v12
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    .line 204
    :cond_7
    :goto_5
    iget-object v0, v1, Lcom/google/android/exoplayer2/j;->x:Ll/fe80;

    .line 205
    .line 206
    iget-object v4, v0, Ll/fe80;->a:Lcom/google/android/exoplayer2/c0;

    .line 207
    .line 208
    iget-object v5, v0, Ll/fe80;->b:Lcom/google/android/exoplayer2/source/i$b;

    .line 209
    .line 210
    iget-boolean v0, v8, Lcom/google/android/exoplayer2/j$g;->f:Z

    .line 211
    .line 212
    if-eqz v0, :cond_8

    .line 213
    .line 214
    move-wide v6, v12

    .line 215
    goto :goto_6

    .line 216
    :cond_8
    move-wide/from16 v6, v18

    .line 217
    .line 218
    :goto_6
    const/4 v8, 0x0

    .line 219
    move-object v3, v9

    .line 220
    invoke-virtual/range {v1 .. v8}, Lcom/google/android/exoplayer2/j;->x1(Lcom/google/android/exoplayer2/c0;Lcom/google/android/exoplayer2/source/i$b;Lcom/google/android/exoplayer2/c0;Lcom/google/android/exoplayer2/source/i$b;JZ)V

    .line 221
    .line 222
    .line 223
    if-nez v16, :cond_a

    .line 224
    .line 225
    iget-object v0, v1, Lcom/google/android/exoplayer2/j;->x:Ll/fe80;

    .line 226
    .line 227
    iget-wide v4, v0, Ll/fe80;->c:J

    .line 228
    .line 229
    cmp-long v0, v10, v4

    .line 230
    .line 231
    if-eqz v0, :cond_9

    .line 232
    .line 233
    goto :goto_7

    .line 234
    :cond_9
    move-object v11, v2

    .line 235
    goto :goto_b

    .line 236
    :cond_a
    :goto_7
    iget-object v0, v1, Lcom/google/android/exoplayer2/j;->x:Ll/fe80;

    .line 237
    .line 238
    iget-object v4, v0, Ll/fe80;->b:Lcom/google/android/exoplayer2/source/i$b;

    .line 239
    .line 240
    iget-object v4, v4, Ll/fyx;->a:Ljava/lang/Object;

    .line 241
    .line 242
    iget-object v0, v0, Ll/fe80;->a:Lcom/google/android/exoplayer2/c0;

    .line 243
    .line 244
    if-eqz v16, :cond_b

    .line 245
    .line 246
    if-eqz p2, :cond_b

    .line 247
    .line 248
    invoke-virtual {v0}, Lcom/google/android/exoplayer2/c0;->u()Z

    .line 249
    .line 250
    .line 251
    move-result v5

    .line 252
    if-nez v5, :cond_b

    .line 253
    .line 254
    iget-object v5, v1, Lcom/google/android/exoplayer2/j;->l:Lcom/google/android/exoplayer2/c0$b;

    .line 255
    .line 256
    invoke-virtual {v0, v4, v5}, Lcom/google/android/exoplayer2/c0;->l(Ljava/lang/Object;Lcom/google/android/exoplayer2/c0$b;)Lcom/google/android/exoplayer2/c0$b;

    .line 257
    .line 258
    .line 259
    move-result-object v0

    .line 260
    iget-boolean v0, v0, Lcom/google/android/exoplayer2/c0$b;->f:Z

    .line 261
    .line 262
    if-nez v0, :cond_b

    .line 263
    .line 264
    const/4 v9, 0x1

    .line 265
    goto :goto_8

    .line 266
    :cond_b
    move v9, v15

    .line 267
    :goto_8
    iget-object v0, v1, Lcom/google/android/exoplayer2/j;->x:Ll/fe80;

    .line 268
    .line 269
    iget-wide v7, v0, Ll/fe80;->d:J

    .line 270
    .line 271
    invoke-virtual {v2, v4}, Lcom/google/android/exoplayer2/c0;->f(Ljava/lang/Object;)I

    .line 272
    .line 273
    .line 274
    move-result v0

    .line 275
    if-ne v0, v14, :cond_c

    .line 276
    .line 277
    move-wide v5, v10

    .line 278
    move/from16 v10, v21

    .line 279
    .line 280
    :goto_9
    move-object v11, v2

    .line 281
    move-object v2, v3

    .line 282
    move-wide v3, v12

    .line 283
    goto :goto_a

    .line 284
    :cond_c
    move-wide v5, v10

    .line 285
    move/from16 v10, v17

    .line 286
    .line 287
    goto :goto_9

    .line 288
    :goto_a
    invoke-virtual/range {v1 .. v10}, Lcom/google/android/exoplayer2/j;->P(Lcom/google/android/exoplayer2/source/i$b;JJJZI)Ll/fe80;

    .line 289
    .line 290
    .line 291
    move-result-object v0

    .line 292
    iput-object v0, v1, Lcom/google/android/exoplayer2/j;->x:Ll/fe80;

    .line 293
    .line 294
    :goto_b
    invoke-virtual {v1}, Lcom/google/android/exoplayer2/j;->w0()V

    .line 295
    .line 296
    .line 297
    iget-object v0, v1, Lcom/google/android/exoplayer2/j;->x:Ll/fe80;

    .line 298
    .line 299
    iget-object v0, v0, Ll/fe80;->a:Lcom/google/android/exoplayer2/c0;

    .line 300
    .line 301
    invoke-virtual {v1, v11, v0}, Lcom/google/android/exoplayer2/j;->A0(Lcom/google/android/exoplayer2/c0;Lcom/google/android/exoplayer2/c0;)V

    .line 302
    .line 303
    .line 304
    iget-object v0, v1, Lcom/google/android/exoplayer2/j;->x:Ll/fe80;

    .line 305
    .line 306
    invoke-virtual {v0, v11}, Ll/fe80;->j(Lcom/google/android/exoplayer2/c0;)Ll/fe80;

    .line 307
    .line 308
    .line 309
    move-result-object v0

    .line 310
    iput-object v0, v1, Lcom/google/android/exoplayer2/j;->x:Ll/fe80;

    .line 311
    .line 312
    invoke-virtual {v11}, Lcom/google/android/exoplayer2/c0;->u()Z

    .line 313
    .line 314
    .line 315
    move-result v0

    .line 316
    if-nez v0, :cond_d

    .line 317
    .line 318
    const/4 v5, 0x0

    .line 319
    iput-object v5, v1, Lcom/google/android/exoplayer2/j;->K:Lcom/google/android/exoplayer2/j$h;

    .line 320
    .line 321
    :cond_d
    invoke-virtual {v1, v15}, Lcom/google/android/exoplayer2/j;->K(Z)V

    .line 322
    .line 323
    .line 324
    return-void

    .line 325
    :goto_c
    iget-object v2, v1, Lcom/google/android/exoplayer2/j;->x:Ll/fe80;

    .line 326
    .line 327
    iget-object v4, v2, Ll/fe80;->a:Lcom/google/android/exoplayer2/c0;

    .line 328
    .line 329
    iget-object v5, v2, Ll/fe80;->b:Lcom/google/android/exoplayer2/source/i$b;

    .line 330
    .line 331
    iget-boolean v2, v8, Lcom/google/android/exoplayer2/j$g;->f:Z

    .line 332
    .line 333
    if-eqz v2, :cond_e

    .line 334
    .line 335
    move-wide v6, v12

    .line 336
    goto :goto_d

    .line 337
    :cond_e
    move-wide/from16 v6, v18

    .line 338
    .line 339
    :goto_d
    const/4 v8, 0x0

    .line 340
    move-object v2, v11

    .line 341
    invoke-virtual/range {v1 .. v8}, Lcom/google/android/exoplayer2/j;->x1(Lcom/google/android/exoplayer2/c0;Lcom/google/android/exoplayer2/source/i$b;Lcom/google/android/exoplayer2/c0;Lcom/google/android/exoplayer2/source/i$b;JZ)V

    .line 342
    .line 343
    .line 344
    if-nez v16, :cond_f

    .line 345
    .line 346
    iget-object v2, v1, Lcom/google/android/exoplayer2/j;->x:Ll/fe80;

    .line 347
    .line 348
    iget-wide v4, v2, Ll/fe80;->c:J

    .line 349
    .line 350
    cmp-long v2, v9, v4

    .line 351
    .line 352
    if-eqz v2, :cond_12

    .line 353
    .line 354
    :cond_f
    iget-object v2, v1, Lcom/google/android/exoplayer2/j;->x:Ll/fe80;

    .line 355
    .line 356
    iget-object v4, v2, Ll/fe80;->b:Lcom/google/android/exoplayer2/source/i$b;

    .line 357
    .line 358
    iget-object v4, v4, Ll/fyx;->a:Ljava/lang/Object;

    .line 359
    .line 360
    iget-object v2, v2, Ll/fe80;->a:Lcom/google/android/exoplayer2/c0;

    .line 361
    .line 362
    if-eqz v16, :cond_10

    .line 363
    .line 364
    if-eqz p2, :cond_10

    .line 365
    .line 366
    invoke-virtual {v2}, Lcom/google/android/exoplayer2/c0;->u()Z

    .line 367
    .line 368
    .line 369
    move-result v5

    .line 370
    if-nez v5, :cond_10

    .line 371
    .line 372
    iget-object v5, v1, Lcom/google/android/exoplayer2/j;->l:Lcom/google/android/exoplayer2/c0$b;

    .line 373
    .line 374
    invoke-virtual {v2, v4, v5}, Lcom/google/android/exoplayer2/c0;->l(Ljava/lang/Object;Lcom/google/android/exoplayer2/c0$b;)Lcom/google/android/exoplayer2/c0$b;

    .line 375
    .line 376
    .line 377
    move-result-object v2

    .line 378
    iget-boolean v2, v2, Lcom/google/android/exoplayer2/c0$b;->f:Z

    .line 379
    .line 380
    if-nez v2, :cond_10

    .line 381
    .line 382
    move-wide v5, v9

    .line 383
    const/4 v9, 0x1

    .line 384
    goto :goto_e

    .line 385
    :cond_10
    move-wide v5, v9

    .line 386
    move v9, v15

    .line 387
    :goto_e
    iget-object v2, v1, Lcom/google/android/exoplayer2/j;->x:Ll/fe80;

    .line 388
    .line 389
    iget-wide v7, v2, Ll/fe80;->d:J

    .line 390
    .line 391
    invoke-virtual {v11, v4}, Lcom/google/android/exoplayer2/c0;->f(Ljava/lang/Object;)I

    .line 392
    .line 393
    .line 394
    move-result v2

    .line 395
    if-ne v2, v14, :cond_11

    .line 396
    .line 397
    move/from16 v10, v21

    .line 398
    .line 399
    :goto_f
    move-object v2, v3

    .line 400
    move-wide v3, v12

    .line 401
    goto :goto_10

    .line 402
    :cond_11
    move/from16 v10, v17

    .line 403
    .line 404
    goto :goto_f

    .line 405
    :goto_10
    invoke-virtual/range {v1 .. v10}, Lcom/google/android/exoplayer2/j;->P(Lcom/google/android/exoplayer2/source/i$b;JJJZI)Ll/fe80;

    .line 406
    .line 407
    .line 408
    move-result-object v2

    .line 409
    iput-object v2, v1, Lcom/google/android/exoplayer2/j;->x:Ll/fe80;

    .line 410
    .line 411
    :cond_12
    invoke-virtual {v1}, Lcom/google/android/exoplayer2/j;->w0()V

    .line 412
    .line 413
    .line 414
    iget-object v2, v1, Lcom/google/android/exoplayer2/j;->x:Ll/fe80;

    .line 415
    .line 416
    iget-object v2, v2, Ll/fe80;->a:Lcom/google/android/exoplayer2/c0;

    .line 417
    .line 418
    invoke-virtual {v1, v11, v2}, Lcom/google/android/exoplayer2/j;->A0(Lcom/google/android/exoplayer2/c0;Lcom/google/android/exoplayer2/c0;)V

    .line 419
    .line 420
    .line 421
    iget-object v2, v1, Lcom/google/android/exoplayer2/j;->x:Ll/fe80;

    .line 422
    .line 423
    invoke-virtual {v2, v11}, Ll/fe80;->j(Lcom/google/android/exoplayer2/c0;)Ll/fe80;

    .line 424
    .line 425
    .line 426
    move-result-object v2

    .line 427
    iput-object v2, v1, Lcom/google/android/exoplayer2/j;->x:Ll/fe80;

    .line 428
    .line 429
    invoke-virtual {v11}, Lcom/google/android/exoplayer2/c0;->u()Z

    .line 430
    .line 431
    .line 432
    move-result v2

    .line 433
    if-nez v2, :cond_13

    .line 434
    .line 435
    const/4 v5, 0x0

    .line 436
    iput-object v5, v1, Lcom/google/android/exoplayer2/j;->K:Lcom/google/android/exoplayer2/j$h;

    .line 437
    .line 438
    :cond_13
    invoke-virtual {v1, v15}, Lcom/google/android/exoplayer2/j;->K(Z)V

    .line 439
    .line 440
    .line 441
    throw v0
.end method

.method public final L0(Lcom/google/android/exoplayer2/u;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer2/ExoPlaybackException;
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Lcom/google/android/exoplayer2/u;->c()Landroid/os/Looper;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v1, p0, Lcom/google/android/exoplayer2/j;->j:Landroid/os/Looper;

    .line 6
    .line 7
    if-ne v0, v1, :cond_2

    .line 8
    .line 9
    invoke-virtual {p0, p1}, Lcom/google/android/exoplayer2/j;->p(Lcom/google/android/exoplayer2/u;)V

    .line 10
    .line 11
    .line 12
    iget-object p1, p0, Lcom/google/android/exoplayer2/j;->x:Ll/fe80;

    .line 13
    .line 14
    iget p1, p1, Ll/fe80;->e:I

    .line 15
    .line 16
    const/4 v0, 0x3

    .line 17
    const/4 v1, 0x2

    .line 18
    if-eq p1, v0, :cond_1

    .line 19
    .line 20
    if-ne p1, v1, :cond_0

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    return-void

    .line 24
    :cond_1
    :goto_0
    iget-object p0, p0, Lcom/google/android/exoplayer2/j;->h:Ll/sxk;

    .line 25
    .line 26
    invoke-interface {p0, v1}, Ll/sxk;->j(I)Z

    .line 27
    .line 28
    .line 29
    return-void

    .line 30
    :cond_2
    iget-object p0, p0, Lcom/google/android/exoplayer2/j;->h:Ll/sxk;

    .line 31
    .line 32
    const/16 v0, 0xf

    .line 33
    .line 34
    invoke-interface {p0, v0, p1}, Ll/sxk;->c(ILjava/lang/Object;)Ll/sxk$a;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    invoke-interface {p0}, Ll/sxk$a;->a()V

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method public final M(Lcom/google/android/exoplayer2/source/h;)V
    .locals 11
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer2/ExoPlaybackException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/google/android/exoplayer2/j;->s:Lcom/google/android/exoplayer2/p;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Lcom/google/android/exoplayer2/p;->y(Lcom/google/android/exoplayer2/source/h;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-nez p1, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    iget-object p1, p0, Lcom/google/android/exoplayer2/j;->s:Lcom/google/android/exoplayer2/p;

    .line 11
    .line 12
    invoke-virtual {p1}, Lcom/google/android/exoplayer2/p;->l()Ll/eyx;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    iget-object v0, p0, Lcom/google/android/exoplayer2/j;->o:Lcom/google/android/exoplayer2/g;

    .line 17
    .line 18
    invoke-virtual {v0}, Lcom/google/android/exoplayer2/g;->getPlaybackParameters()Lcom/google/android/exoplayer2/s;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    iget v0, v0, Lcom/google/android/exoplayer2/s;->a:F

    .line 23
    .line 24
    iget-object v1, p0, Lcom/google/android/exoplayer2/j;->x:Ll/fe80;

    .line 25
    .line 26
    iget-object v1, v1, Ll/fe80;->a:Lcom/google/android/exoplayer2/c0;

    .line 27
    .line 28
    invoke-virtual {p1, v0, v1}, Ll/eyx;->p(FLcom/google/android/exoplayer2/c0;)V

    .line 29
    .line 30
    .line 31
    iget-object v0, p1, Ll/eyx;->f:Ll/gyx;

    .line 32
    .line 33
    iget-object v0, v0, Ll/gyx;->a:Lcom/google/android/exoplayer2/source/i$b;

    .line 34
    .line 35
    invoke-virtual {p1}, Ll/eyx;->n()Ll/ffj0;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    invoke-virtual {p1}, Ll/eyx;->o()Ll/dgj0;

    .line 40
    .line 41
    .line 42
    move-result-object v2

    .line 43
    invoke-virtual {p0, v0, v1, v2}, Lcom/google/android/exoplayer2/j;->u1(Lcom/google/android/exoplayer2/source/i$b;Ll/ffj0;Ll/dgj0;)V

    .line 44
    .line 45
    .line 46
    iget-object v0, p0, Lcom/google/android/exoplayer2/j;->s:Lcom/google/android/exoplayer2/p;

    .line 47
    .line 48
    invoke-virtual {v0}, Lcom/google/android/exoplayer2/p;->r()Ll/eyx;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    if-ne p1, v0, :cond_1

    .line 53
    .line 54
    iget-object v0, p1, Ll/eyx;->f:Ll/gyx;

    .line 55
    .line 56
    iget-wide v0, v0, Ll/gyx;->b:J

    .line 57
    .line 58
    invoke-virtual {p0, v0, v1}, Lcom/google/android/exoplayer2/j;->x0(J)V

    .line 59
    .line 60
    .line 61
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/j;->u()V

    .line 62
    .line 63
    .line 64
    iget-object v0, p0, Lcom/google/android/exoplayer2/j;->x:Ll/fe80;

    .line 65
    .line 66
    iget-object v2, v0, Ll/fe80;->b:Lcom/google/android/exoplayer2/source/i$b;

    .line 67
    .line 68
    iget-object p1, p1, Ll/eyx;->f:Ll/gyx;

    .line 69
    .line 70
    iget-wide v3, p1, Ll/gyx;->b:J

    .line 71
    .line 72
    iget-wide v5, v0, Ll/fe80;->c:J

    .line 73
    .line 74
    const/4 v9, 0x0

    .line 75
    const/4 v10, 0x5

    .line 76
    move-wide v7, v3

    .line 77
    move-object v1, p0

    .line 78
    invoke-virtual/range {v1 .. v10}, Lcom/google/android/exoplayer2/j;->P(Lcom/google/android/exoplayer2/source/i$b;JJJZI)Ll/fe80;

    .line 79
    .line 80
    .line 81
    move-result-object p0

    .line 82
    iput-object p0, v1, Lcom/google/android/exoplayer2/j;->x:Ll/fe80;

    .line 83
    .line 84
    goto :goto_0

    .line 85
    :cond_1
    move-object v1, p0

    .line 86
    :goto_0
    invoke-virtual {v1}, Lcom/google/android/exoplayer2/j;->X()V

    .line 87
    .line 88
    .line 89
    return-void
.end method

.method public final M0(Lcom/google/android/exoplayer2/u;)V
    .locals 3

    .line 1
    invoke-virtual {p1}, Lcom/google/android/exoplayer2/u;->c()Landroid/os/Looper;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Landroid/os/Looper;->getThread()Ljava/lang/Thread;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-virtual {v1}, Ljava/lang/Thread;->isAlive()Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    if-nez v1, :cond_0

    .line 14
    .line 15
    const-string p0, "TAG"

    .line 16
    .line 17
    const-string v0, "Trying to send message on a dead thread."

    .line 18
    .line 19
    invoke-static {p0, v0}, Ll/kyv;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    const/4 p0, 0x0

    .line 23
    invoke-virtual {p1, p0}, Lcom/google/android/exoplayer2/u;->k(Z)V

    .line 24
    .line 25
    .line 26
    return-void

    .line 27
    :cond_0
    iget-object v1, p0, Lcom/google/android/exoplayer2/j;->q:Ll/qa5;

    .line 28
    .line 29
    const/4 v2, 0x0

    .line 30
    invoke-interface {v1, v0, v2}, Ll/qa5;->c(Landroid/os/Looper;Landroid/os/Handler$Callback;)Ll/sxk;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    new-instance v1, Ll/s9f;

    .line 35
    .line 36
    invoke-direct {v1, p0, p1}, Ll/s9f;-><init>(Lcom/google/android/exoplayer2/j;Lcom/google/android/exoplayer2/u;)V

    .line 37
    .line 38
    .line 39
    invoke-interface {v0, v1}, Ll/sxk;->i(Ljava/lang/Runnable;)Z

    .line 40
    .line 41
    .line 42
    return-void
.end method

.method public final N(Lcom/google/android/exoplayer2/s;FZZ)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer2/ExoPlaybackException;
        }
    .end annotation

    .line 1
    if-eqz p3, :cond_1

    .line 2
    .line 3
    if-eqz p4, :cond_0

    .line 4
    .line 5
    iget-object p3, p0, Lcom/google/android/exoplayer2/j;->y:Lcom/google/android/exoplayer2/j$e;

    .line 6
    .line 7
    const/4 p4, 0x1

    .line 8
    invoke-virtual {p3, p4}, Lcom/google/android/exoplayer2/j$e;->b(I)V

    .line 9
    .line 10
    .line 11
    :cond_0
    iget-object p3, p0, Lcom/google/android/exoplayer2/j;->x:Ll/fe80;

    .line 12
    .line 13
    invoke-virtual {p3, p1}, Ll/fe80;->g(Lcom/google/android/exoplayer2/s;)Ll/fe80;

    .line 14
    .line 15
    .line 16
    move-result-object p3

    .line 17
    iput-object p3, p0, Lcom/google/android/exoplayer2/j;->x:Ll/fe80;

    .line 18
    .line 19
    :cond_1
    iget p3, p1, Lcom/google/android/exoplayer2/s;->a:F

    .line 20
    .line 21
    invoke-virtual {p0, p3}, Lcom/google/android/exoplayer2/j;->y1(F)V

    .line 22
    .line 23
    .line 24
    iget-object p0, p0, Lcom/google/android/exoplayer2/j;->a:[Lcom/google/android/exoplayer2/x;

    .line 25
    .line 26
    array-length p3, p0

    .line 27
    const/4 p4, 0x0

    .line 28
    :goto_0
    if-ge p4, p3, :cond_3

    .line 29
    .line 30
    aget-object v0, p0, p4

    .line 31
    .line 32
    if-eqz v0, :cond_2

    .line 33
    .line 34
    iget v1, p1, Lcom/google/android/exoplayer2/s;->a:F

    .line 35
    .line 36
    invoke-interface {v0, p2, v1}, Lcom/google/android/exoplayer2/x;->A(FF)V

    .line 37
    .line 38
    .line 39
    :cond_2
    add-int/lit8 p4, p4, 0x1

    .line 40
    .line 41
    goto :goto_0

    .line 42
    :cond_3
    return-void
.end method

.method public final N0(J)V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/google/android/exoplayer2/j;->a:[Lcom/google/android/exoplayer2/x;

    .line 2
    .line 3
    array-length v1, v0

    .line 4
    const/4 v2, 0x0

    .line 5
    :goto_0
    if-ge v2, v1, :cond_1

    .line 6
    .line 7
    aget-object v3, v0, v2

    .line 8
    .line 9
    invoke-interface {v3}, Lcom/google/android/exoplayer2/x;->getStream()Ll/xwd0;

    .line 10
    .line 11
    .line 12
    move-result-object v4

    .line 13
    if-eqz v4, :cond_0

    .line 14
    .line 15
    invoke-virtual {p0, v3, p1, p2}, Lcom/google/android/exoplayer2/j;->O0(Lcom/google/android/exoplayer2/x;J)V

    .line 16
    .line 17
    .line 18
    :cond_0
    add-int/lit8 v2, v2, 0x1

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_1
    return-void
.end method

.method public final O(Lcom/google/android/exoplayer2/s;Z)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer2/ExoPlaybackException;
        }
    .end annotation

    .line 1
    iget v0, p1, Lcom/google/android/exoplayer2/s;->a:F

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-virtual {p0, p1, v0, v1, p2}, Lcom/google/android/exoplayer2/j;->N(Lcom/google/android/exoplayer2/s;FZZ)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final O0(Lcom/google/android/exoplayer2/x;J)V
    .locals 0

    .line 1
    invoke-interface {p1}, Lcom/google/android/exoplayer2/x;->s()V

    .line 2
    .line 3
    .line 4
    instance-of p0, p1, Ll/esi0;

    .line 5
    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    check-cast p1, Ll/esi0;

    .line 9
    .line 10
    invoke-virtual {p1, p2, p3}, Ll/esi0;->h0(J)V

    .line 11
    .line 12
    .line 13
    :cond_0
    return-void
.end method

.method public final P(Lcom/google/android/exoplayer2/source/i$b;JJJZI)Ll/fe80;
    .locals 13
    .annotation build Landroidx/annotation/CheckResult;
    .end annotation

    .line 1
    move-wide/from16 v4, p4

    .line 2
    .line 3
    iget-boolean v0, p0, Lcom/google/android/exoplayer2/j;->N:Z

    .line 4
    .line 5
    if-nez v0, :cond_1

    .line 6
    .line 7
    iget-object v0, p0, Lcom/google/android/exoplayer2/j;->x:Ll/fe80;

    .line 8
    .line 9
    iget-wide v0, v0, Ll/fe80;->r:J

    .line 10
    .line 11
    cmp-long v0, p2, v0

    .line 12
    .line 13
    if-nez v0, :cond_1

    .line 14
    .line 15
    iget-object v0, p0, Lcom/google/android/exoplayer2/j;->x:Ll/fe80;

    .line 16
    .line 17
    iget-object v0, v0, Ll/fe80;->b:Lcom/google/android/exoplayer2/source/i$b;

    .line 18
    .line 19
    invoke-virtual {p1, v0}, Ll/fyx;->equals(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-nez v0, :cond_0

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    const/4 v0, 0x0

    .line 27
    goto :goto_1

    .line 28
    :cond_1
    :goto_0
    const/4 v0, 0x1

    .line 29
    :goto_1
    iput-boolean v0, p0, Lcom/google/android/exoplayer2/j;->N:Z

    .line 30
    .line 31
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/j;->w0()V

    .line 32
    .line 33
    .line 34
    iget-object v0, p0, Lcom/google/android/exoplayer2/j;->x:Ll/fe80;

    .line 35
    .line 36
    iget-object v1, v0, Ll/fe80;->h:Ll/ffj0;

    .line 37
    .line 38
    iget-object v2, v0, Ll/fe80;->i:Ll/dgj0;

    .line 39
    .line 40
    iget-object v0, v0, Ll/fe80;->j:Ljava/util/List;

    .line 41
    .line 42
    iget-object v3, p0, Lcom/google/android/exoplayer2/j;->t:Lcom/google/android/exoplayer2/q;

    .line 43
    .line 44
    invoke-virtual {v3}, Lcom/google/android/exoplayer2/q;->t()Z

    .line 45
    .line 46
    .line 47
    move-result v3

    .line 48
    if-eqz v3, :cond_5

    .line 49
    .line 50
    iget-object v0, p0, Lcom/google/android/exoplayer2/j;->s:Lcom/google/android/exoplayer2/p;

    .line 51
    .line 52
    invoke-virtual {v0}, Lcom/google/android/exoplayer2/p;->r()Ll/eyx;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    if-nez v0, :cond_2

    .line 57
    .line 58
    sget-object v1, Ll/ffj0;->d:Ll/ffj0;

    .line 59
    .line 60
    goto :goto_2

    .line 61
    :cond_2
    invoke-virtual {v0}, Ll/eyx;->n()Ll/ffj0;

    .line 62
    .line 63
    .line 64
    move-result-object v1

    .line 65
    :goto_2
    if-nez v0, :cond_3

    .line 66
    .line 67
    iget-object v2, p0, Lcom/google/android/exoplayer2/j;->e:Ll/dgj0;

    .line 68
    .line 69
    goto :goto_3

    .line 70
    :cond_3
    invoke-virtual {v0}, Ll/eyx;->o()Ll/dgj0;

    .line 71
    .line 72
    .line 73
    move-result-object v2

    .line 74
    :goto_3
    iget-object v3, v2, Ll/dgj0;->c:[Ll/u9f;

    .line 75
    .line 76
    invoke-virtual {p0, v3}, Lcom/google/android/exoplayer2/j;->z([Ll/u9f;)Lcom/google/common/collect/ImmutableList;

    .line 77
    .line 78
    .line 79
    move-result-object v3

    .line 80
    if-eqz v0, :cond_4

    .line 81
    .line 82
    iget-object v6, v0, Ll/eyx;->f:Ll/gyx;

    .line 83
    .line 84
    iget-wide v7, v6, Ll/gyx;->c:J

    .line 85
    .line 86
    cmp-long v7, v7, v4

    .line 87
    .line 88
    if-eqz v7, :cond_4

    .line 89
    .line 90
    invoke-virtual {v6, v4, v5}, Ll/gyx;->a(J)Ll/gyx;

    .line 91
    .line 92
    .line 93
    move-result-object v6

    .line 94
    iput-object v6, v0, Ll/eyx;->f:Ll/gyx;

    .line 95
    .line 96
    :cond_4
    move-object v10, v1

    .line 97
    move-object v11, v2

    .line 98
    move-object v12, v3

    .line 99
    goto :goto_4

    .line 100
    :cond_5
    iget-object v3, p0, Lcom/google/android/exoplayer2/j;->x:Ll/fe80;

    .line 101
    .line 102
    iget-object v3, v3, Ll/fe80;->b:Lcom/google/android/exoplayer2/source/i$b;

    .line 103
    .line 104
    invoke-virtual {p1, v3}, Ll/fyx;->equals(Ljava/lang/Object;)Z

    .line 105
    .line 106
    .line 107
    move-result v3

    .line 108
    if-nez v3, :cond_6

    .line 109
    .line 110
    sget-object v1, Ll/ffj0;->d:Ll/ffj0;

    .line 111
    .line 112
    iget-object v2, p0, Lcom/google/android/exoplayer2/j;->e:Ll/dgj0;

    .line 113
    .line 114
    invoke-static {}, Lcom/google/common/collect/ImmutableList;->of()Lcom/google/common/collect/ImmutableList;

    .line 115
    .line 116
    .line 117
    move-result-object v0

    .line 118
    :cond_6
    move-object v12, v0

    .line 119
    move-object v10, v1

    .line 120
    move-object v11, v2

    .line 121
    :goto_4
    if-eqz p8, :cond_7

    .line 122
    .line 123
    iget-object v0, p0, Lcom/google/android/exoplayer2/j;->y:Lcom/google/android/exoplayer2/j$e;

    .line 124
    .line 125
    move/from16 v1, p9

    .line 126
    .line 127
    invoke-virtual {v0, v1}, Lcom/google/android/exoplayer2/j$e;->e(I)V

    .line 128
    .line 129
    .line 130
    :cond_7
    iget-object v0, p0, Lcom/google/android/exoplayer2/j;->x:Ll/fe80;

    .line 131
    .line 132
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/j;->G()J

    .line 133
    .line 134
    .line 135
    move-result-wide v8

    .line 136
    move-object v1, p1

    .line 137
    move-wide v2, p2

    .line 138
    move-wide/from16 v6, p6

    .line 139
    .line 140
    invoke-virtual/range {v0 .. v12}, Ll/fe80;->d(Lcom/google/android/exoplayer2/source/i$b;JJJJLl/ffj0;Ll/dgj0;Ljava/util/List;)Ll/fe80;

    .line 141
    .line 142
    .line 143
    move-result-object p0

    .line 144
    return-object p0
.end method

.method public declared-synchronized P0(Z)Z
    .locals 3

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-boolean v0, p0, Lcom/google/android/exoplayer2/j;->z:Z

    .line 3
    .line 4
    const/4 v1, 0x1

    .line 5
    if-nez v0, :cond_2

    .line 6
    .line 7
    iget-object v0, p0, Lcom/google/android/exoplayer2/j;->j:Landroid/os/Looper;

    .line 8
    .line 9
    invoke-virtual {v0}, Landroid/os/Looper;->getThread()Ljava/lang/Thread;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {v0}, Ljava/lang/Thread;->isAlive()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-nez v0, :cond_0

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    const/16 v0, 0xd

    .line 21
    .line 22
    const/4 v2, 0x0

    .line 23
    if-eqz p1, :cond_1

    .line 24
    .line 25
    iget-object p1, p0, Lcom/google/android/exoplayer2/j;->h:Ll/sxk;

    .line 26
    .line 27
    invoke-interface {p1, v0, v1, v2}, Ll/sxk;->e(III)Ll/sxk$a;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    invoke-interface {p1}, Ll/sxk$a;->a()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 32
    .line 33
    .line 34
    monitor-exit p0

    .line 35
    return v1

    .line 36
    :catchall_0
    move-exception p1

    .line 37
    goto :goto_1

    .line 38
    :cond_1
    :try_start_1
    new-instance p1, Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 39
    .line 40
    invoke-direct {p1}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>()V

    .line 41
    .line 42
    .line 43
    iget-object v1, p0, Lcom/google/android/exoplayer2/j;->h:Ll/sxk;

    .line 44
    .line 45
    invoke-interface {v1, v0, v2, v2, p1}, Ll/sxk;->f(IIILjava/lang/Object;)Ll/sxk$a;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    invoke-interface {v0}, Ll/sxk$a;->a()V

    .line 50
    .line 51
    .line 52
    new-instance v0, Ll/q9f;

    .line 53
    .line 54
    invoke-direct {v0, p1}, Ll/q9f;-><init>(Ljava/util/concurrent/atomic/AtomicBoolean;)V

    .line 55
    .line 56
    .line 57
    iget-wide v1, p0, Lcom/google/android/exoplayer2/j;->P:J

    .line 58
    .line 59
    invoke-virtual {p0, v0, v1, v2}, Lcom/google/android/exoplayer2/j;->z1(Ll/b7h0;J)V

    .line 60
    .line 61
    .line 62
    invoke-virtual {p1}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    .line 63
    .line 64
    .line 65
    move-result p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 66
    monitor-exit p0

    .line 67
    return p1

    .line 68
    :cond_2
    :goto_0
    monitor-exit p0

    .line 69
    return v1

    .line 70
    :goto_1
    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 71
    throw p1
.end method

.method public final Q(Lcom/google/android/exoplayer2/x;Ll/eyx;)Z
    .locals 2

    .line 1
    invoke-virtual {p2}, Ll/eyx;->j()Ll/eyx;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p2, p2, Ll/eyx;->f:Ll/gyx;

    .line 6
    .line 7
    iget-boolean p2, p2, Ll/gyx;->f:Z

    .line 8
    .line 9
    if-eqz p2, :cond_1

    .line 10
    .line 11
    iget-boolean p2, p0, Ll/eyx;->d:Z

    .line 12
    .line 13
    if-eqz p2, :cond_1

    .line 14
    .line 15
    instance-of p2, p1, Ll/esi0;

    .line 16
    .line 17
    if-nez p2, :cond_0

    .line 18
    .line 19
    instance-of p2, p1, Lcom/google/android/exoplayer2/metadata/a;

    .line 20
    .line 21
    if-nez p2, :cond_0

    .line 22
    .line 23
    invoke-interface {p1}, Lcom/google/android/exoplayer2/x;->k()J

    .line 24
    .line 25
    .line 26
    move-result-wide p1

    .line 27
    invoke-virtual {p0}, Ll/eyx;->m()J

    .line 28
    .line 29
    .line 30
    move-result-wide v0

    .line 31
    cmp-long p0, p1, v0

    .line 32
    .line 33
    if-ltz p0, :cond_1

    .line 34
    .line 35
    :cond_0
    const/4 p0, 0x1

    .line 36
    return p0

    .line 37
    :cond_1
    const/4 p0, 0x0

    .line 38
    return p0
.end method

.method public final Q0(ZLjava/util/concurrent/atomic/AtomicBoolean;)V
    .locals 4
    .param p2    # Ljava/util/concurrent/atomic/AtomicBoolean;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    iget-boolean v0, p0, Lcom/google/android/exoplayer2/j;->G:Z

    .line 2
    .line 3
    if-eq v0, p1, :cond_1

    .line 4
    .line 5
    iput-boolean p1, p0, Lcom/google/android/exoplayer2/j;->G:Z

    .line 6
    .line 7
    if-nez p1, :cond_1

    .line 8
    .line 9
    iget-object p1, p0, Lcom/google/android/exoplayer2/j;->a:[Lcom/google/android/exoplayer2/x;

    .line 10
    .line 11
    array-length v0, p1

    .line 12
    const/4 v1, 0x0

    .line 13
    :goto_0
    if-ge v1, v0, :cond_1

    .line 14
    .line 15
    aget-object v2, p1, v1

    .line 16
    .line 17
    invoke-static {v2}, Lcom/google/android/exoplayer2/j;->U(Lcom/google/android/exoplayer2/x;)Z

    .line 18
    .line 19
    .line 20
    move-result v3

    .line 21
    if-nez v3, :cond_0

    .line 22
    .line 23
    iget-object v3, p0, Lcom/google/android/exoplayer2/j;->b:Ljava/util/Set;

    .line 24
    .line 25
    invoke-interface {v3, v2}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    move-result v3

    .line 29
    if-eqz v3, :cond_0

    .line 30
    .line 31
    invoke-interface {v2}, Lcom/google/android/exoplayer2/x;->reset()V

    .line 32
    .line 33
    .line 34
    :cond_0
    add-int/lit8 v1, v1, 0x1

    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_1
    if-eqz p2, :cond_2

    .line 38
    .line 39
    monitor-enter p0

    .line 40
    const/4 p1, 0x1

    .line 41
    :try_start_0
    invoke-virtual {p2, p1}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 42
    .line 43
    .line 44
    invoke-virtual {p0}, Ljava/lang/Object;->notifyAll()V

    .line 45
    .line 46
    .line 47
    monitor-exit p0

    .line 48
    return-void

    .line 49
    :catchall_0
    move-exception p1

    .line 50
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 51
    throw p1

    .line 52
    :cond_2
    return-void
.end method

.method public final R()Z
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/google/android/exoplayer2/j;->s:Lcom/google/android/exoplayer2/p;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/google/android/exoplayer2/p;->s()Ll/eyx;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-boolean v1, v0, Ll/eyx;->d:Z

    .line 8
    .line 9
    const/4 v2, 0x0

    .line 10
    if-nez v1, :cond_0

    .line 11
    .line 12
    return v2

    .line 13
    :cond_0
    move v1, v2

    .line 14
    :goto_0
    iget-object v3, p0, Lcom/google/android/exoplayer2/j;->a:[Lcom/google/android/exoplayer2/x;

    .line 15
    .line 16
    array-length v4, v3

    .line 17
    if-ge v1, v4, :cond_3

    .line 18
    .line 19
    aget-object v3, v3, v1

    .line 20
    .line 21
    iget-object v4, v0, Ll/eyx;->c:[Ll/xwd0;

    .line 22
    .line 23
    aget-object v4, v4, v1

    .line 24
    .line 25
    invoke-interface {v3}, Lcom/google/android/exoplayer2/x;->getStream()Ll/xwd0;

    .line 26
    .line 27
    .line 28
    move-result-object v5

    .line 29
    if-ne v5, v4, :cond_2

    .line 30
    .line 31
    if-eqz v4, :cond_1

    .line 32
    .line 33
    invoke-interface {v3}, Lcom/google/android/exoplayer2/x;->d()Z

    .line 34
    .line 35
    .line 36
    move-result v4

    .line 37
    if-nez v4, :cond_1

    .line 38
    .line 39
    invoke-virtual {p0, v3, v0}, Lcom/google/android/exoplayer2/j;->Q(Lcom/google/android/exoplayer2/x;Ll/eyx;)Z

    .line 40
    .line 41
    .line 42
    move-result v3

    .line 43
    if-nez v3, :cond_1

    .line 44
    .line 45
    goto :goto_1

    .line 46
    :cond_1
    add-int/lit8 v1, v1, 0x1

    .line 47
    .line 48
    goto :goto_0

    .line 49
    :cond_2
    :goto_1
    return v2

    .line 50
    :cond_3
    const/4 p0, 0x1

    .line 51
    return p0
.end method

.method public final R0(Lcom/google/android/exoplayer2/s;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/google/android/exoplayer2/j;->h:Ll/sxk;

    .line 2
    .line 3
    const/16 v1, 0x10

    .line 4
    .line 5
    invoke-interface {v0, v1}, Ll/sxk;->l(I)V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Lcom/google/android/exoplayer2/j;->o:Lcom/google/android/exoplayer2/g;

    .line 9
    .line 10
    invoke-virtual {p0, p1}, Lcom/google/android/exoplayer2/g;->setPlaybackParameters(Lcom/google/android/exoplayer2/s;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public final S0(Lcom/google/android/exoplayer2/j$b;)V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer2/ExoPlaybackException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/google/android/exoplayer2/j;->y:Lcom/google/android/exoplayer2/j$e;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-virtual {v0, v1}, Lcom/google/android/exoplayer2/j$e;->b(I)V

    .line 5
    .line 6
    .line 7
    invoke-static {p1}, Lcom/google/android/exoplayer2/j$b;->a(Lcom/google/android/exoplayer2/j$b;)I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    const/4 v1, -0x1

    .line 12
    if-eq v0, v1, :cond_0

    .line 13
    .line 14
    new-instance v0, Lcom/google/android/exoplayer2/j$h;

    .line 15
    .line 16
    new-instance v1, Lcom/google/android/exoplayer2/v;

    .line 17
    .line 18
    invoke-static {p1}, Lcom/google/android/exoplayer2/j$b;->b(Lcom/google/android/exoplayer2/j$b;)Ljava/util/List;

    .line 19
    .line 20
    .line 21
    move-result-object v2

    .line 22
    invoke-static {p1}, Lcom/google/android/exoplayer2/j$b;->c(Lcom/google/android/exoplayer2/j$b;)Ll/n8f0;

    .line 23
    .line 24
    .line 25
    move-result-object v3

    .line 26
    invoke-direct {v1, v2, v3}, Lcom/google/android/exoplayer2/v;-><init>(Ljava/util/Collection;Ll/n8f0;)V

    .line 27
    .line 28
    .line 29
    invoke-static {p1}, Lcom/google/android/exoplayer2/j$b;->a(Lcom/google/android/exoplayer2/j$b;)I

    .line 30
    .line 31
    .line 32
    move-result v2

    .line 33
    invoke-static {p1}, Lcom/google/android/exoplayer2/j$b;->d(Lcom/google/android/exoplayer2/j$b;)J

    .line 34
    .line 35
    .line 36
    move-result-wide v3

    .line 37
    invoke-direct {v0, v1, v2, v3, v4}, Lcom/google/android/exoplayer2/j$h;-><init>(Lcom/google/android/exoplayer2/c0;IJ)V

    .line 38
    .line 39
    .line 40
    iput-object v0, p0, Lcom/google/android/exoplayer2/j;->K:Lcom/google/android/exoplayer2/j$h;

    .line 41
    .line 42
    :cond_0
    iget-object v0, p0, Lcom/google/android/exoplayer2/j;->t:Lcom/google/android/exoplayer2/q;

    .line 43
    .line 44
    invoke-static {p1}, Lcom/google/android/exoplayer2/j$b;->b(Lcom/google/android/exoplayer2/j$b;)Ljava/util/List;

    .line 45
    .line 46
    .line 47
    move-result-object v1

    .line 48
    invoke-static {p1}, Lcom/google/android/exoplayer2/j$b;->c(Lcom/google/android/exoplayer2/j$b;)Ll/n8f0;

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    invoke-virtual {v0, v1, p1}, Lcom/google/android/exoplayer2/q;->C(Ljava/util/List;Ll/n8f0;)Lcom/google/android/exoplayer2/c0;

    .line 53
    .line 54
    .line 55
    move-result-object p1

    .line 56
    const/4 v0, 0x0

    .line 57
    invoke-virtual {p0, p1, v0}, Lcom/google/android/exoplayer2/j;->L(Lcom/google/android/exoplayer2/c0;Z)V

    .line 58
    .line 59
    .line 60
    return-void
.end method

.method public final T()Z
    .locals 5

    .line 1
    iget-object p0, p0, Lcom/google/android/exoplayer2/j;->s:Lcom/google/android/exoplayer2/p;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/p;->l()Ll/eyx;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const/4 v0, 0x0

    .line 8
    if-nez p0, :cond_0

    .line 9
    .line 10
    return v0

    .line 11
    :cond_0
    invoke-virtual {p0}, Ll/eyx;->k()J

    .line 12
    .line 13
    .line 14
    move-result-wide v1

    .line 15
    const-wide/high16 v3, -0x8000000000000000L

    .line 16
    .line 17
    cmp-long p0, v1, v3

    .line 18
    .line 19
    if-nez p0, :cond_1

    .line 20
    .line 21
    return v0

    .line 22
    :cond_1
    const/4 p0, 0x1

    .line 23
    return p0
.end method

.method public T0(Ljava/util/List;IJLl/n8f0;)V
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/google/android/exoplayer2/q$c;",
            ">;IJ",
            "Ll/n8f0;",
            ")V"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/google/android/exoplayer2/j;->h:Ll/sxk;

    .line 2
    .line 3
    new-instance v0, Lcom/google/android/exoplayer2/j$b;

    .line 4
    .line 5
    const/4 v6, 0x0

    .line 6
    move-object v1, p1

    .line 7
    move v3, p2

    .line 8
    move-wide v4, p3

    .line 9
    move-object v2, p5

    .line 10
    invoke-direct/range {v0 .. v6}, Lcom/google/android/exoplayer2/j$b;-><init>(Ljava/util/List;Ll/n8f0;IJLcom/google/android/exoplayer2/j$a;)V

    .line 11
    .line 12
    .line 13
    const/16 p1, 0x11

    .line 14
    .line 15
    invoke-interface {p0, p1, v0}, Ll/sxk;->c(ILjava/lang/Object;)Ll/sxk$a;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-interface {p0}, Ll/sxk$a;->a()V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public final U0(Z)V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/google/android/exoplayer2/j;->I:Z

    .line 2
    .line 3
    if-ne p1, v0, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    iput-boolean p1, p0, Lcom/google/android/exoplayer2/j;->I:Z

    .line 7
    .line 8
    if-nez p1, :cond_1

    .line 9
    .line 10
    iget-object p1, p0, Lcom/google/android/exoplayer2/j;->x:Ll/fe80;

    .line 11
    .line 12
    iget-boolean p1, p1, Ll/fe80;->o:Z

    .line 13
    .line 14
    if-eqz p1, :cond_1

    .line 15
    .line 16
    iget-object p0, p0, Lcom/google/android/exoplayer2/j;->h:Ll/sxk;

    .line 17
    .line 18
    const/4 p1, 0x2

    .line 19
    invoke-interface {p0, p1}, Ll/sxk;->j(I)Z

    .line 20
    .line 21
    .line 22
    :cond_1
    :goto_0
    return-void
.end method

.method public final V()Z
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/google/android/exoplayer2/j;->s:Lcom/google/android/exoplayer2/p;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/google/android/exoplayer2/p;->r()Ll/eyx;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v1, v0, Ll/eyx;->f:Ll/gyx;

    .line 8
    .line 9
    iget-wide v1, v1, Ll/gyx;->e:J

    .line 10
    .line 11
    iget-boolean v0, v0, Ll/eyx;->d:Z

    .line 12
    .line 13
    if-eqz v0, :cond_1

    .line 14
    .line 15
    const-wide v3, -0x7fffffffffffffffL    # -4.9E-324

    .line 16
    .line 17
    .line 18
    .line 19
    .line 20
    cmp-long v0, v1, v3

    .line 21
    .line 22
    if-eqz v0, :cond_0

    .line 23
    .line 24
    iget-object v0, p0, Lcom/google/android/exoplayer2/j;->x:Ll/fe80;

    .line 25
    .line 26
    iget-wide v3, v0, Ll/fe80;->r:J

    .line 27
    .line 28
    cmp-long v0, v3, v1

    .line 29
    .line 30
    if-ltz v0, :cond_0

    .line 31
    .line 32
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/j;->m1()Z

    .line 33
    .line 34
    .line 35
    move-result p0

    .line 36
    if-nez p0, :cond_1

    .line 37
    .line 38
    :cond_0
    const/4 p0, 0x1

    .line 39
    return p0

    .line 40
    :cond_1
    const/4 p0, 0x0

    .line 41
    return p0
.end method

.method public V0(Z)V
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/google/android/exoplayer2/j;->h:Ll/sxk;

    .line 2
    .line 3
    const/16 v0, 0x17

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    invoke-interface {p0, v0, p1, v1}, Ll/sxk;->e(III)Ll/sxk$a;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    invoke-interface {p0}, Ll/sxk$a;->a()V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public final W0(Z)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer2/ExoPlaybackException;
        }
    .end annotation

    .line 1
    iput-boolean p1, p0, Lcom/google/android/exoplayer2/j;->A:Z

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/j;->w0()V

    .line 4
    .line 5
    .line 6
    iget-boolean p1, p0, Lcom/google/android/exoplayer2/j;->B:Z

    .line 7
    .line 8
    if-eqz p1, :cond_0

    .line 9
    .line 10
    iget-object p1, p0, Lcom/google/android/exoplayer2/j;->s:Lcom/google/android/exoplayer2/p;

    .line 11
    .line 12
    invoke-virtual {p1}, Lcom/google/android/exoplayer2/p;->s()Ll/eyx;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    iget-object v0, p0, Lcom/google/android/exoplayer2/j;->s:Lcom/google/android/exoplayer2/p;

    .line 17
    .line 18
    invoke-virtual {v0}, Lcom/google/android/exoplayer2/p;->r()Ll/eyx;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    if-eq p1, v0, :cond_0

    .line 23
    .line 24
    const/4 p1, 0x1

    .line 25
    invoke-virtual {p0, p1}, Lcom/google/android/exoplayer2/j;->G0(Z)V

    .line 26
    .line 27
    .line 28
    const/4 p1, 0x0

    .line 29
    invoke-virtual {p0, p1}, Lcom/google/android/exoplayer2/j;->K(Z)V

    .line 30
    .line 31
    .line 32
    :cond_0
    return-void
.end method

.method public final X()V
    .locals 3

    .line 1
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/j;->l1()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iput-boolean v0, p0, Lcom/google/android/exoplayer2/j;->D:Z

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/google/android/exoplayer2/j;->s:Lcom/google/android/exoplayer2/p;

    .line 10
    .line 11
    invoke-virtual {v0}, Lcom/google/android/exoplayer2/p;->l()Ll/eyx;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iget-wide v1, p0, Lcom/google/android/exoplayer2/j;->L:J

    .line 16
    .line 17
    invoke-virtual {v0, v1, v2}, Ll/eyx;->d(J)V

    .line 18
    .line 19
    .line 20
    :cond_0
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/j;->t1()V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public X0(ZI)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/google/android/exoplayer2/j;->h:Ll/sxk;

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    invoke-interface {p0, v0, p1, p2}, Ll/sxk;->e(III)Ll/sxk$a;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    invoke-interface {p0}, Ll/sxk$a;->a()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final Y()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/google/android/exoplayer2/j;->y:Lcom/google/android/exoplayer2/j$e;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/google/android/exoplayer2/j;->x:Ll/fe80;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Lcom/google/android/exoplayer2/j$e;->d(Ll/fe80;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/google/android/exoplayer2/j;->y:Lcom/google/android/exoplayer2/j$e;

    .line 9
    .line 10
    invoke-static {v0}, Lcom/google/android/exoplayer2/j$e;->a(Lcom/google/android/exoplayer2/j$e;)Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    iget-object v0, p0, Lcom/google/android/exoplayer2/j;->r:Lcom/google/android/exoplayer2/j$f;

    .line 17
    .line 18
    iget-object v1, p0, Lcom/google/android/exoplayer2/j;->y:Lcom/google/android/exoplayer2/j$e;

    .line 19
    .line 20
    invoke-interface {v0, v1}, Lcom/google/android/exoplayer2/j$f;->a(Lcom/google/android/exoplayer2/j$e;)V

    .line 21
    .line 22
    .line 23
    new-instance v0, Lcom/google/android/exoplayer2/j$e;

    .line 24
    .line 25
    iget-object v1, p0, Lcom/google/android/exoplayer2/j;->x:Ll/fe80;

    .line 26
    .line 27
    invoke-direct {v0, v1}, Lcom/google/android/exoplayer2/j$e;-><init>(Ll/fe80;)V

    .line 28
    .line 29
    .line 30
    iput-object v0, p0, Lcom/google/android/exoplayer2/j;->y:Lcom/google/android/exoplayer2/j$e;

    .line 31
    .line 32
    :cond_0
    return-void
.end method

.method public final Y0(ZIZI)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer2/ExoPlaybackException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/google/android/exoplayer2/j;->y:Lcom/google/android/exoplayer2/j$e;

    .line 2
    .line 3
    invoke-virtual {v0, p3}, Lcom/google/android/exoplayer2/j$e;->b(I)V

    .line 4
    .line 5
    .line 6
    iget-object p3, p0, Lcom/google/android/exoplayer2/j;->y:Lcom/google/android/exoplayer2/j$e;

    .line 7
    .line 8
    invoke-virtual {p3, p4}, Lcom/google/android/exoplayer2/j$e;->c(I)V

    .line 9
    .line 10
    .line 11
    iget-object p3, p0, Lcom/google/android/exoplayer2/j;->x:Ll/fe80;

    .line 12
    .line 13
    invoke-virtual {p3, p1, p2}, Ll/fe80;->e(ZI)Ll/fe80;

    .line 14
    .line 15
    .line 16
    move-result-object p2

    .line 17
    iput-object p2, p0, Lcom/google/android/exoplayer2/j;->x:Ll/fe80;

    .line 18
    .line 19
    const/4 p2, 0x0

    .line 20
    iput-boolean p2, p0, Lcom/google/android/exoplayer2/j;->C:Z

    .line 21
    .line 22
    invoke-virtual {p0, p1}, Lcom/google/android/exoplayer2/j;->i0(Z)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/j;->m1()Z

    .line 26
    .line 27
    .line 28
    move-result p1

    .line 29
    if-nez p1, :cond_0

    .line 30
    .line 31
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/j;->s1()V

    .line 32
    .line 33
    .line 34
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/j;->w1()V

    .line 35
    .line 36
    .line 37
    return-void

    .line 38
    :cond_0
    iget-object p1, p0, Lcom/google/android/exoplayer2/j;->x:Ll/fe80;

    .line 39
    .line 40
    iget p1, p1, Ll/fe80;->e:I

    .line 41
    .line 42
    const/4 p2, 0x3

    .line 43
    const/4 p3, 0x2

    .line 44
    if-ne p1, p2, :cond_1

    .line 45
    .line 46
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/j;->p1()V

    .line 47
    .line 48
    .line 49
    iget-object p0, p0, Lcom/google/android/exoplayer2/j;->h:Ll/sxk;

    .line 50
    .line 51
    invoke-interface {p0, p3}, Ll/sxk;->j(I)Z

    .line 52
    .line 53
    .line 54
    return-void

    .line 55
    :cond_1
    if-ne p1, p3, :cond_2

    .line 56
    .line 57
    iget-object p0, p0, Lcom/google/android/exoplayer2/j;->h:Ll/sxk;

    .line 58
    .line 59
    invoke-interface {p0, p3}, Ll/sxk;->j(I)Z

    .line 60
    .line 61
    .line 62
    :cond_2
    return-void
.end method

.method public final Z(JJ)V
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer2/ExoPlaybackException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/google/android/exoplayer2/j;->p:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_f

    .line 8
    .line 9
    iget-object v0, p0, Lcom/google/android/exoplayer2/j;->x:Ll/fe80;

    .line 10
    .line 11
    iget-object v0, v0, Ll/fe80;->b:Lcom/google/android/exoplayer2/source/i$b;

    .line 12
    .line 13
    invoke-virtual {v0}, Ll/fyx;->b()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    goto/16 :goto_6

    .line 20
    .line 21
    :cond_0
    iget-boolean v0, p0, Lcom/google/android/exoplayer2/j;->N:Z

    .line 22
    .line 23
    if-eqz v0, :cond_1

    .line 24
    .line 25
    const-wide/16 v0, 0x1

    .line 26
    .line 27
    sub-long/2addr p1, v0

    .line 28
    const/4 v0, 0x0

    .line 29
    iput-boolean v0, p0, Lcom/google/android/exoplayer2/j;->N:Z

    .line 30
    .line 31
    :cond_1
    iget-object v0, p0, Lcom/google/android/exoplayer2/j;->x:Ll/fe80;

    .line 32
    .line 33
    iget-object v1, v0, Ll/fe80;->a:Lcom/google/android/exoplayer2/c0;

    .line 34
    .line 35
    iget-object v0, v0, Ll/fe80;->b:Lcom/google/android/exoplayer2/source/i$b;

    .line 36
    .line 37
    iget-object v0, v0, Ll/fyx;->a:Ljava/lang/Object;

    .line 38
    .line 39
    invoke-virtual {v1, v0}, Lcom/google/android/exoplayer2/c0;->f(Ljava/lang/Object;)I

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    iget v1, p0, Lcom/google/android/exoplayer2/j;->M:I

    .line 44
    .line 45
    iget-object v2, p0, Lcom/google/android/exoplayer2/j;->p:Ljava/util/ArrayList;

    .line 46
    .line 47
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    .line 48
    .line 49
    .line 50
    move-result v2

    .line 51
    invoke-static {v1, v2}, Ljava/lang/Math;->min(II)I

    .line 52
    .line 53
    .line 54
    move-result v1

    .line 55
    const/4 v2, 0x0

    .line 56
    if-lez v1, :cond_2

    .line 57
    .line 58
    iget-object v3, p0, Lcom/google/android/exoplayer2/j;->p:Ljava/util/ArrayList;

    .line 59
    .line 60
    add-int/lit8 v4, v1, -0x1

    .line 61
    .line 62
    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 63
    .line 64
    .line 65
    move-result-object v3

    .line 66
    check-cast v3, Lcom/google/android/exoplayer2/j$d;

    .line 67
    .line 68
    goto :goto_0

    .line 69
    :cond_2
    move-object v3, v2

    .line 70
    :goto_0
    if-eqz v3, :cond_5

    .line 71
    .line 72
    iget v4, v3, Lcom/google/android/exoplayer2/j$d;->b:I

    .line 73
    .line 74
    if-gt v4, v0, :cond_3

    .line 75
    .line 76
    if-ne v4, v0, :cond_5

    .line 77
    .line 78
    iget-wide v3, v3, Lcom/google/android/exoplayer2/j$d;->c:J

    .line 79
    .line 80
    cmp-long v3, v3, p1

    .line 81
    .line 82
    if-lez v3, :cond_5

    .line 83
    .line 84
    :cond_3
    add-int/lit8 v3, v1, -0x1

    .line 85
    .line 86
    if-lez v3, :cond_4

    .line 87
    .line 88
    iget-object v4, p0, Lcom/google/android/exoplayer2/j;->p:Ljava/util/ArrayList;

    .line 89
    .line 90
    add-int/lit8 v1, v1, -0x2

    .line 91
    .line 92
    invoke-virtual {v4, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 93
    .line 94
    .line 95
    move-result-object v1

    .line 96
    check-cast v1, Lcom/google/android/exoplayer2/j$d;

    .line 97
    .line 98
    goto :goto_1

    .line 99
    :cond_4
    move-object v1, v2

    .line 100
    :goto_1
    move v7, v3

    .line 101
    move-object v3, v1

    .line 102
    move v1, v7

    .line 103
    goto :goto_0

    .line 104
    :cond_5
    iget-object v3, p0, Lcom/google/android/exoplayer2/j;->p:Ljava/util/ArrayList;

    .line 105
    .line 106
    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    .line 107
    .line 108
    .line 109
    move-result v3

    .line 110
    if-ge v1, v3, :cond_6

    .line 111
    .line 112
    iget-object v3, p0, Lcom/google/android/exoplayer2/j;->p:Ljava/util/ArrayList;

    .line 113
    .line 114
    invoke-virtual {v3, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 115
    .line 116
    .line 117
    move-result-object v3

    .line 118
    check-cast v3, Lcom/google/android/exoplayer2/j$d;

    .line 119
    .line 120
    goto :goto_2

    .line 121
    :cond_6
    move-object v3, v2

    .line 122
    :goto_2
    if-eqz v3, :cond_8

    .line 123
    .line 124
    iget-object v4, v3, Lcom/google/android/exoplayer2/j$d;->d:Ljava/lang/Object;

    .line 125
    .line 126
    if-eqz v4, :cond_8

    .line 127
    .line 128
    iget v4, v3, Lcom/google/android/exoplayer2/j$d;->b:I

    .line 129
    .line 130
    if-lt v4, v0, :cond_7

    .line 131
    .line 132
    if-ne v4, v0, :cond_8

    .line 133
    .line 134
    iget-wide v4, v3, Lcom/google/android/exoplayer2/j$d;->c:J

    .line 135
    .line 136
    cmp-long v4, v4, p1

    .line 137
    .line 138
    if-gtz v4, :cond_8

    .line 139
    .line 140
    :cond_7
    add-int/lit8 v1, v1, 0x1

    .line 141
    .line 142
    iget-object v3, p0, Lcom/google/android/exoplayer2/j;->p:Ljava/util/ArrayList;

    .line 143
    .line 144
    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    .line 145
    .line 146
    .line 147
    move-result v3

    .line 148
    if-ge v1, v3, :cond_6

    .line 149
    .line 150
    iget-object v3, p0, Lcom/google/android/exoplayer2/j;->p:Ljava/util/ArrayList;

    .line 151
    .line 152
    invoke-virtual {v3, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 153
    .line 154
    .line 155
    move-result-object v3

    .line 156
    check-cast v3, Lcom/google/android/exoplayer2/j$d;

    .line 157
    .line 158
    goto :goto_2

    .line 159
    :cond_8
    :goto_3
    if-eqz v3, :cond_e

    .line 160
    .line 161
    iget-object v4, v3, Lcom/google/android/exoplayer2/j$d;->d:Ljava/lang/Object;

    .line 162
    .line 163
    if-eqz v4, :cond_e

    .line 164
    .line 165
    iget v4, v3, Lcom/google/android/exoplayer2/j$d;->b:I

    .line 166
    .line 167
    if-ne v4, v0, :cond_e

    .line 168
    .line 169
    iget-wide v4, v3, Lcom/google/android/exoplayer2/j$d;->c:J

    .line 170
    .line 171
    cmp-long v6, v4, p1

    .line 172
    .line 173
    if-lez v6, :cond_e

    .line 174
    .line 175
    cmp-long v4, v4, p3

    .line 176
    .line 177
    if-gtz v4, :cond_e

    .line 178
    .line 179
    :try_start_0
    iget-object v4, v3, Lcom/google/android/exoplayer2/j$d;->a:Lcom/google/android/exoplayer2/u;

    .line 180
    .line 181
    invoke-virtual {p0, v4}, Lcom/google/android/exoplayer2/j;->L0(Lcom/google/android/exoplayer2/u;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 182
    .line 183
    .line 184
    iget-object v4, v3, Lcom/google/android/exoplayer2/j$d;->a:Lcom/google/android/exoplayer2/u;

    .line 185
    .line 186
    invoke-virtual {v4}, Lcom/google/android/exoplayer2/u;->b()Z

    .line 187
    .line 188
    .line 189
    move-result v4

    .line 190
    if-nez v4, :cond_a

    .line 191
    .line 192
    iget-object v3, v3, Lcom/google/android/exoplayer2/j$d;->a:Lcom/google/android/exoplayer2/u;

    .line 193
    .line 194
    invoke-virtual {v3}, Lcom/google/android/exoplayer2/u;->j()Z

    .line 195
    .line 196
    .line 197
    move-result v3

    .line 198
    if-eqz v3, :cond_9

    .line 199
    .line 200
    goto :goto_4

    .line 201
    :cond_9
    add-int/lit8 v1, v1, 0x1

    .line 202
    .line 203
    goto :goto_5

    .line 204
    :cond_a
    :goto_4
    iget-object v3, p0, Lcom/google/android/exoplayer2/j;->p:Ljava/util/ArrayList;

    .line 205
    .line 206
    invoke-virtual {v3, v1}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 207
    .line 208
    .line 209
    :goto_5
    iget-object v3, p0, Lcom/google/android/exoplayer2/j;->p:Ljava/util/ArrayList;

    .line 210
    .line 211
    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    .line 212
    .line 213
    .line 214
    move-result v3

    .line 215
    if-ge v1, v3, :cond_b

    .line 216
    .line 217
    iget-object v3, p0, Lcom/google/android/exoplayer2/j;->p:Ljava/util/ArrayList;

    .line 218
    .line 219
    invoke-virtual {v3, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 220
    .line 221
    .line 222
    move-result-object v3

    .line 223
    check-cast v3, Lcom/google/android/exoplayer2/j$d;

    .line 224
    .line 225
    goto :goto_3

    .line 226
    :cond_b
    move-object v3, v2

    .line 227
    goto :goto_3

    .line 228
    :catchall_0
    move-exception p1

    .line 229
    iget-object p2, v3, Lcom/google/android/exoplayer2/j$d;->a:Lcom/google/android/exoplayer2/u;

    .line 230
    .line 231
    invoke-virtual {p2}, Lcom/google/android/exoplayer2/u;->b()Z

    .line 232
    .line 233
    .line 234
    move-result p2

    .line 235
    if-nez p2, :cond_c

    .line 236
    .line 237
    iget-object p2, v3, Lcom/google/android/exoplayer2/j$d;->a:Lcom/google/android/exoplayer2/u;

    .line 238
    .line 239
    invoke-virtual {p2}, Lcom/google/android/exoplayer2/u;->j()Z

    .line 240
    .line 241
    .line 242
    move-result p2

    .line 243
    if-eqz p2, :cond_d

    .line 244
    .line 245
    :cond_c
    iget-object p0, p0, Lcom/google/android/exoplayer2/j;->p:Ljava/util/ArrayList;

    .line 246
    .line 247
    invoke-virtual {p0, v1}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 248
    .line 249
    .line 250
    :cond_d
    throw p1

    .line 251
    :cond_e
    iput v1, p0, Lcom/google/android/exoplayer2/j;->M:I

    .line 252
    .line 253
    :cond_f
    :goto_6
    return-void
.end method

.method public Z0(Lcom/google/android/exoplayer2/s;)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/google/android/exoplayer2/j;->h:Ll/sxk;

    .line 2
    .line 3
    const/4 v0, 0x4

    .line 4
    invoke-interface {p0, v0, p1}, Ll/sxk;->c(ILjava/lang/Object;)Ll/sxk$a;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    invoke-interface {p0}, Ll/sxk$a;->a()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final a0()V
    .locals 11
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer2/ExoPlaybackException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/google/android/exoplayer2/j;->s:Lcom/google/android/exoplayer2/p;

    .line 2
    .line 3
    iget-wide v1, p0, Lcom/google/android/exoplayer2/j;->L:J

    .line 4
    .line 5
    invoke-virtual {v0, v1, v2}, Lcom/google/android/exoplayer2/p;->B(J)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/google/android/exoplayer2/j;->s:Lcom/google/android/exoplayer2/p;

    .line 9
    .line 10
    invoke-virtual {v0}, Lcom/google/android/exoplayer2/p;->G()Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-eqz v0, :cond_1

    .line 15
    .line 16
    iget-object v0, p0, Lcom/google/android/exoplayer2/j;->s:Lcom/google/android/exoplayer2/p;

    .line 17
    .line 18
    iget-wide v1, p0, Lcom/google/android/exoplayer2/j;->L:J

    .line 19
    .line 20
    iget-object v3, p0, Lcom/google/android/exoplayer2/j;->x:Ll/fe80;

    .line 21
    .line 22
    invoke-virtual {v0, v1, v2, v3}, Lcom/google/android/exoplayer2/p;->q(JLl/fe80;)Ll/gyx;

    .line 23
    .line 24
    .line 25
    move-result-object v9

    .line 26
    if-eqz v9, :cond_1

    .line 27
    .line 28
    iget-object v4, p0, Lcom/google/android/exoplayer2/j;->s:Lcom/google/android/exoplayer2/p;

    .line 29
    .line 30
    iget-object v5, p0, Lcom/google/android/exoplayer2/j;->c:[Lcom/google/android/exoplayer2/y;

    .line 31
    .line 32
    iget-object v6, p0, Lcom/google/android/exoplayer2/j;->d:Ll/cgj0;

    .line 33
    .line 34
    iget-object v0, p0, Lcom/google/android/exoplayer2/j;->f:Ll/ltv;

    .line 35
    .line 36
    invoke-interface {v0}, Ll/ltv;->i()Ll/oj0;

    .line 37
    .line 38
    .line 39
    move-result-object v7

    .line 40
    iget-object v8, p0, Lcom/google/android/exoplayer2/j;->t:Lcom/google/android/exoplayer2/q;

    .line 41
    .line 42
    iget-object v10, p0, Lcom/google/android/exoplayer2/j;->e:Ll/dgj0;

    .line 43
    .line 44
    invoke-virtual/range {v4 .. v10}, Lcom/google/android/exoplayer2/p;->g([Lcom/google/android/exoplayer2/y;Ll/cgj0;Ll/oj0;Lcom/google/android/exoplayer2/q;Ll/gyx;Ll/dgj0;)Ll/eyx;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    iget-object v1, v0, Ll/eyx;->a:Lcom/google/android/exoplayer2/source/h;

    .line 49
    .line 50
    iget-wide v2, v9, Ll/gyx;->b:J

    .line 51
    .line 52
    invoke-interface {v1, p0, v2, v3}, Lcom/google/android/exoplayer2/source/h;->p(Lcom/google/android/exoplayer2/source/h$a;J)V

    .line 53
    .line 54
    .line 55
    iget-object v1, p0, Lcom/google/android/exoplayer2/j;->s:Lcom/google/android/exoplayer2/p;

    .line 56
    .line 57
    invoke-virtual {v1}, Lcom/google/android/exoplayer2/p;->r()Ll/eyx;

    .line 58
    .line 59
    .line 60
    move-result-object v1

    .line 61
    if-ne v1, v0, :cond_0

    .line 62
    .line 63
    iget-wide v0, v9, Ll/gyx;->b:J

    .line 64
    .line 65
    invoke-virtual {p0, v0, v1}, Lcom/google/android/exoplayer2/j;->x0(J)V

    .line 66
    .line 67
    .line 68
    :cond_0
    const/4 v0, 0x0

    .line 69
    invoke-virtual {p0, v0}, Lcom/google/android/exoplayer2/j;->K(Z)V

    .line 70
    .line 71
    .line 72
    :cond_1
    iget-boolean v0, p0, Lcom/google/android/exoplayer2/j;->D:Z

    .line 73
    .line 74
    if-eqz v0, :cond_2

    .line 75
    .line 76
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/j;->T()Z

    .line 77
    .line 78
    .line 79
    move-result v0

    .line 80
    iput-boolean v0, p0, Lcom/google/android/exoplayer2/j;->D:Z

    .line 81
    .line 82
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/j;->t1()V

    .line 83
    .line 84
    .line 85
    return-void

    .line 86
    :cond_2
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/j;->X()V

    .line 87
    .line 88
    .line 89
    return-void
.end method

.method public final a1(Lcom/google/android/exoplayer2/s;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer2/ExoPlaybackException;
        }
    .end annotation

    .line 1
    invoke-virtual {p0, p1}, Lcom/google/android/exoplayer2/j;->R0(Lcom/google/android/exoplayer2/s;)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Lcom/google/android/exoplayer2/j;->o:Lcom/google/android/exoplayer2/g;

    .line 5
    .line 6
    invoke-virtual {p1}, Lcom/google/android/exoplayer2/g;->getPlaybackParameters()Lcom/google/android/exoplayer2/s;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    const/4 v0, 0x1

    .line 11
    invoke-virtual {p0, p1, v0}, Lcom/google/android/exoplayer2/j;->O(Lcom/google/android/exoplayer2/s;Z)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public b(Lcom/google/android/exoplayer2/x;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/android/exoplayer2/j;->h:Ll/sxk;

    .line 2
    .line 3
    const/16 p1, 0x1a

    .line 4
    .line 5
    invoke-interface {p0, p1}, Ll/sxk;->j(I)Z

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final b0()V
    .locals 14
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer2/ExoPlaybackException;
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    move v1, v0

    .line 3
    :goto_0
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/j;->k1()Z

    .line 4
    .line 5
    .line 6
    move-result v2

    .line 7
    if-eqz v2, :cond_2

    .line 8
    .line 9
    if-eqz v1, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/j;->Y()V

    .line 12
    .line 13
    .line 14
    :cond_0
    iget-object v1, p0, Lcom/google/android/exoplayer2/j;->s:Lcom/google/android/exoplayer2/p;

    .line 15
    .line 16
    invoke-virtual {v1}, Lcom/google/android/exoplayer2/p;->b()Ll/eyx;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    invoke-static {v1}, Ll/w11;->e(Ljava/lang/Object;)Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    check-cast v1, Ll/eyx;

    .line 25
    .line 26
    iget-object v2, p0, Lcom/google/android/exoplayer2/j;->x:Ll/fe80;

    .line 27
    .line 28
    iget-object v2, v2, Ll/fe80;->b:Lcom/google/android/exoplayer2/source/i$b;

    .line 29
    .line 30
    iget-object v2, v2, Ll/fyx;->a:Ljava/lang/Object;

    .line 31
    .line 32
    iget-object v3, v1, Ll/eyx;->f:Ll/gyx;

    .line 33
    .line 34
    iget-object v3, v3, Ll/gyx;->a:Lcom/google/android/exoplayer2/source/i$b;

    .line 35
    .line 36
    iget-object v3, v3, Ll/fyx;->a:Ljava/lang/Object;

    .line 37
    .line 38
    invoke-virtual {v2, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 39
    .line 40
    .line 41
    move-result v2

    .line 42
    const/4 v3, 0x1

    .line 43
    if-eqz v2, :cond_1

    .line 44
    .line 45
    iget-object v2, p0, Lcom/google/android/exoplayer2/j;->x:Ll/fe80;

    .line 46
    .line 47
    iget-object v2, v2, Ll/fe80;->b:Lcom/google/android/exoplayer2/source/i$b;

    .line 48
    .line 49
    iget v4, v2, Ll/fyx;->b:I

    .line 50
    .line 51
    const/4 v5, -0x1

    .line 52
    if-ne v4, v5, :cond_1

    .line 53
    .line 54
    iget-object v4, v1, Ll/eyx;->f:Ll/gyx;

    .line 55
    .line 56
    iget-object v4, v4, Ll/gyx;->a:Lcom/google/android/exoplayer2/source/i$b;

    .line 57
    .line 58
    iget v6, v4, Ll/fyx;->b:I

    .line 59
    .line 60
    if-ne v6, v5, :cond_1

    .line 61
    .line 62
    iget v2, v2, Ll/fyx;->e:I

    .line 63
    .line 64
    iget v4, v4, Ll/fyx;->e:I

    .line 65
    .line 66
    if-eq v2, v4, :cond_1

    .line 67
    .line 68
    move v2, v3

    .line 69
    goto :goto_1

    .line 70
    :cond_1
    move v2, v0

    .line 71
    :goto_1
    iget-object v1, v1, Ll/eyx;->f:Ll/gyx;

    .line 72
    .line 73
    iget-object v5, v1, Ll/gyx;->a:Lcom/google/android/exoplayer2/source/i$b;

    .line 74
    .line 75
    iget-wide v6, v1, Ll/gyx;->b:J

    .line 76
    .line 77
    iget-wide v8, v1, Ll/gyx;->c:J

    .line 78
    .line 79
    xor-int/lit8 v12, v2, 0x1

    .line 80
    .line 81
    const/4 v13, 0x0

    .line 82
    move-wide v10, v6

    .line 83
    move-object v4, p0

    .line 84
    invoke-virtual/range {v4 .. v13}, Lcom/google/android/exoplayer2/j;->P(Lcom/google/android/exoplayer2/source/i$b;JJJZI)Ll/fe80;

    .line 85
    .line 86
    .line 87
    move-result-object p0

    .line 88
    iput-object p0, v4, Lcom/google/android/exoplayer2/j;->x:Ll/fe80;

    .line 89
    .line 90
    invoke-virtual {v4}, Lcom/google/android/exoplayer2/j;->w0()V

    .line 91
    .line 92
    .line 93
    invoke-virtual {v4}, Lcom/google/android/exoplayer2/j;->w1()V

    .line 94
    .line 95
    .line 96
    move v1, v3

    .line 97
    move-object p0, v4

    .line 98
    goto :goto_0

    .line 99
    :cond_2
    return-void
.end method

.method public b1(I)V
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/google/android/exoplayer2/j;->h:Ll/sxk;

    .line 2
    .line 3
    const/16 v0, 0xb

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    invoke-interface {p0, v0, p1, v1}, Ll/sxk;->e(III)Ll/sxk$a;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    invoke-interface {p0}, Ll/sxk$a;->a()V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public c()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/google/android/exoplayer2/j;->h:Ll/sxk;

    .line 2
    .line 3
    const/16 v0, 0xa

    .line 4
    .line 5
    invoke-interface {p0, v0}, Ll/sxk;->j(I)Z

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final c0()V
    .locals 14
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer2/ExoPlaybackException;
        }
    .end annotation

    .line 1
    iget-object v1, p0, Lcom/google/android/exoplayer2/j;->s:Lcom/google/android/exoplayer2/p;

    .line 2
    .line 3
    invoke-virtual {v1}, Lcom/google/android/exoplayer2/p;->s()Ll/eyx;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    if-nez v1, :cond_0

    .line 8
    .line 9
    goto/16 :goto_5

    .line 10
    .line 11
    :cond_0
    invoke-virtual {v1}, Ll/eyx;->j()Ll/eyx;

    .line 12
    .line 13
    .line 14
    move-result-object v2

    .line 15
    const/4 v8, 0x0

    .line 16
    const-wide v9, -0x7fffffffffffffffL    # -4.9E-324

    .line 17
    .line 18
    .line 19
    .line 20
    .line 21
    if-eqz v2, :cond_8

    .line 22
    .line 23
    iget-boolean v2, p0, Lcom/google/android/exoplayer2/j;->B:Z

    .line 24
    .line 25
    if-eqz v2, :cond_1

    .line 26
    .line 27
    goto/16 :goto_2

    .line 28
    .line 29
    :cond_1
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/j;->R()Z

    .line 30
    .line 31
    .line 32
    move-result v2

    .line 33
    if-nez v2, :cond_2

    .line 34
    .line 35
    goto/16 :goto_5

    .line 36
    .line 37
    :cond_2
    invoke-virtual {v1}, Ll/eyx;->j()Ll/eyx;

    .line 38
    .line 39
    .line 40
    move-result-object v2

    .line 41
    iget-boolean v2, v2, Ll/eyx;->d:Z

    .line 42
    .line 43
    if-nez v2, :cond_3

    .line 44
    .line 45
    iget-wide v2, p0, Lcom/google/android/exoplayer2/j;->L:J

    .line 46
    .line 47
    invoke-virtual {v1}, Ll/eyx;->j()Ll/eyx;

    .line 48
    .line 49
    .line 50
    move-result-object v4

    .line 51
    invoke-virtual {v4}, Ll/eyx;->m()J

    .line 52
    .line 53
    .line 54
    move-result-wide v4

    .line 55
    cmp-long v2, v2, v4

    .line 56
    .line 57
    if-gez v2, :cond_3

    .line 58
    .line 59
    goto/16 :goto_5

    .line 60
    .line 61
    :cond_3
    invoke-virtual {v1}, Ll/eyx;->o()Ll/dgj0;

    .line 62
    .line 63
    .line 64
    move-result-object v11

    .line 65
    iget-object v2, p0, Lcom/google/android/exoplayer2/j;->s:Lcom/google/android/exoplayer2/p;

    .line 66
    .line 67
    invoke-virtual {v2}, Lcom/google/android/exoplayer2/p;->c()Ll/eyx;

    .line 68
    .line 69
    .line 70
    move-result-object v12

    .line 71
    invoke-virtual {v12}, Ll/eyx;->o()Ll/dgj0;

    .line 72
    .line 73
    .line 74
    move-result-object v13

    .line 75
    iget-object v2, p0, Lcom/google/android/exoplayer2/j;->x:Ll/fe80;

    .line 76
    .line 77
    iget-object v2, v2, Ll/fe80;->a:Lcom/google/android/exoplayer2/c0;

    .line 78
    .line 79
    iget-object v3, v12, Ll/eyx;->f:Ll/gyx;

    .line 80
    .line 81
    iget-object v3, v3, Ll/gyx;->a:Lcom/google/android/exoplayer2/source/i$b;

    .line 82
    .line 83
    iget-object v1, v1, Ll/eyx;->f:Ll/gyx;

    .line 84
    .line 85
    iget-object v4, v1, Ll/gyx;->a:Lcom/google/android/exoplayer2/source/i$b;

    .line 86
    .line 87
    const-wide v5, -0x7fffffffffffffffL    # -4.9E-324

    .line 88
    .line 89
    .line 90
    .line 91
    .line 92
    const/4 v7, 0x0

    .line 93
    move-object v1, v2

    .line 94
    move-object v2, v3

    .line 95
    move-object v3, v1

    .line 96
    move-object v0, p0

    .line 97
    invoke-virtual/range {v0 .. v7}, Lcom/google/android/exoplayer2/j;->x1(Lcom/google/android/exoplayer2/c0;Lcom/google/android/exoplayer2/source/i$b;Lcom/google/android/exoplayer2/c0;Lcom/google/android/exoplayer2/source/i$b;JZ)V

    .line 98
    .line 99
    .line 100
    iget-boolean v1, v12, Ll/eyx;->d:Z

    .line 101
    .line 102
    if-eqz v1, :cond_4

    .line 103
    .line 104
    iget-object v1, v12, Ll/eyx;->a:Lcom/google/android/exoplayer2/source/h;

    .line 105
    .line 106
    invoke-interface {v1}, Lcom/google/android/exoplayer2/source/h;->i()J

    .line 107
    .line 108
    .line 109
    move-result-wide v1

    .line 110
    cmp-long v1, v1, v9

    .line 111
    .line 112
    if-eqz v1, :cond_4

    .line 113
    .line 114
    invoke-virtual {v12}, Ll/eyx;->m()J

    .line 115
    .line 116
    .line 117
    move-result-wide v1

    .line 118
    invoke-virtual {p0, v1, v2}, Lcom/google/android/exoplayer2/j;->N0(J)V

    .line 119
    .line 120
    .line 121
    return-void

    .line 122
    :cond_4
    move v1, v8

    .line 123
    :goto_0
    iget-object v2, p0, Lcom/google/android/exoplayer2/j;->a:[Lcom/google/android/exoplayer2/x;

    .line 124
    .line 125
    array-length v2, v2

    .line 126
    if-ge v1, v2, :cond_c

    .line 127
    .line 128
    invoke-virtual {v11, v1}, Ll/dgj0;->c(I)Z

    .line 129
    .line 130
    .line 131
    move-result v2

    .line 132
    invoke-virtual {v13, v1}, Ll/dgj0;->c(I)Z

    .line 133
    .line 134
    .line 135
    move-result v3

    .line 136
    if-eqz v2, :cond_7

    .line 137
    .line 138
    iget-object v2, p0, Lcom/google/android/exoplayer2/j;->a:[Lcom/google/android/exoplayer2/x;

    .line 139
    .line 140
    aget-object v2, v2, v1

    .line 141
    .line 142
    invoke-interface {v2}, Lcom/google/android/exoplayer2/x;->g()Z

    .line 143
    .line 144
    .line 145
    move-result v2

    .line 146
    if-nez v2, :cond_7

    .line 147
    .line 148
    iget-object v2, p0, Lcom/google/android/exoplayer2/j;->c:[Lcom/google/android/exoplayer2/y;

    .line 149
    .line 150
    aget-object v2, v2, v1

    .line 151
    .line 152
    invoke-interface {v2}, Lcom/google/android/exoplayer2/y;->getTrackType()I

    .line 153
    .line 154
    .line 155
    move-result v2

    .line 156
    const/4 v4, -0x2

    .line 157
    if-ne v2, v4, :cond_5

    .line 158
    .line 159
    const/4 v2, 0x1

    .line 160
    goto :goto_1

    .line 161
    :cond_5
    move v2, v8

    .line 162
    :goto_1
    iget-object v4, v11, Ll/dgj0;->b:[Ll/jzc0;

    .line 163
    .line 164
    aget-object v4, v4, v1

    .line 165
    .line 166
    iget-object v5, v13, Ll/dgj0;->b:[Ll/jzc0;

    .line 167
    .line 168
    aget-object v5, v5, v1

    .line 169
    .line 170
    if-eqz v3, :cond_6

    .line 171
    .line 172
    invoke-virtual {v5, v4}, Ll/jzc0;->equals(Ljava/lang/Object;)Z

    .line 173
    .line 174
    .line 175
    move-result v3

    .line 176
    if-eqz v3, :cond_6

    .line 177
    .line 178
    if-eqz v2, :cond_7

    .line 179
    .line 180
    :cond_6
    iget-object v2, p0, Lcom/google/android/exoplayer2/j;->a:[Lcom/google/android/exoplayer2/x;

    .line 181
    .line 182
    aget-object v2, v2, v1

    .line 183
    .line 184
    invoke-virtual {v12}, Ll/eyx;->m()J

    .line 185
    .line 186
    .line 187
    move-result-wide v3

    .line 188
    invoke-virtual {p0, v2, v3, v4}, Lcom/google/android/exoplayer2/j;->O0(Lcom/google/android/exoplayer2/x;J)V

    .line 189
    .line 190
    .line 191
    :cond_7
    add-int/lit8 v1, v1, 0x1

    .line 192
    .line 193
    goto :goto_0

    .line 194
    :cond_8
    :goto_2
    iget-object v2, v1, Ll/eyx;->f:Ll/gyx;

    .line 195
    .line 196
    iget-boolean v2, v2, Ll/gyx;->i:Z

    .line 197
    .line 198
    if-nez v2, :cond_9

    .line 199
    .line 200
    iget-boolean v2, p0, Lcom/google/android/exoplayer2/j;->B:Z

    .line 201
    .line 202
    if-eqz v2, :cond_c

    .line 203
    .line 204
    :cond_9
    :goto_3
    iget-object v2, p0, Lcom/google/android/exoplayer2/j;->a:[Lcom/google/android/exoplayer2/x;

    .line 205
    .line 206
    array-length v3, v2

    .line 207
    if-ge v8, v3, :cond_c

    .line 208
    .line 209
    aget-object v2, v2, v8

    .line 210
    .line 211
    iget-object v3, v1, Ll/eyx;->c:[Ll/xwd0;

    .line 212
    .line 213
    aget-object v3, v3, v8

    .line 214
    .line 215
    if-eqz v3, :cond_b

    .line 216
    .line 217
    invoke-interface {v2}, Lcom/google/android/exoplayer2/x;->getStream()Ll/xwd0;

    .line 218
    .line 219
    .line 220
    move-result-object v4

    .line 221
    if-ne v4, v3, :cond_b

    .line 222
    .line 223
    invoke-interface {v2}, Lcom/google/android/exoplayer2/x;->d()Z

    .line 224
    .line 225
    .line 226
    move-result v3

    .line 227
    if-eqz v3, :cond_b

    .line 228
    .line 229
    iget-object v3, v1, Ll/eyx;->f:Ll/gyx;

    .line 230
    .line 231
    iget-wide v3, v3, Ll/gyx;->e:J

    .line 232
    .line 233
    cmp-long v5, v3, v9

    .line 234
    .line 235
    if-eqz v5, :cond_a

    .line 236
    .line 237
    const-wide/high16 v5, -0x8000000000000000L

    .line 238
    .line 239
    cmp-long v3, v3, v5

    .line 240
    .line 241
    if-eqz v3, :cond_a

    .line 242
    .line 243
    invoke-virtual {v1}, Ll/eyx;->l()J

    .line 244
    .line 245
    .line 246
    move-result-wide v3

    .line 247
    iget-object v5, v1, Ll/eyx;->f:Ll/gyx;

    .line 248
    .line 249
    iget-wide v5, v5, Ll/gyx;->e:J

    .line 250
    .line 251
    add-long/2addr v3, v5

    .line 252
    goto :goto_4

    .line 253
    :cond_a
    move-wide v3, v9

    .line 254
    :goto_4
    invoke-virtual {p0, v2, v3, v4}, Lcom/google/android/exoplayer2/j;->O0(Lcom/google/android/exoplayer2/x;J)V

    .line 255
    .line 256
    .line 257
    :cond_b
    add-int/lit8 v8, v8, 0x1

    .line 258
    .line 259
    goto :goto_3

    .line 260
    :cond_c
    :goto_5
    return-void
.end method

.method public final c1(I)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer2/ExoPlaybackException;
        }
    .end annotation

    .line 1
    iput p1, p0, Lcom/google/android/exoplayer2/j;->E:I

    .line 2
    .line 3
    iget-object v0, p0, Lcom/google/android/exoplayer2/j;->s:Lcom/google/android/exoplayer2/p;

    .line 4
    .line 5
    iget-object v1, p0, Lcom/google/android/exoplayer2/j;->x:Ll/fe80;

    .line 6
    .line 7
    iget-object v1, v1, Ll/fe80;->a:Lcom/google/android/exoplayer2/c0;

    .line 8
    .line 9
    invoke-virtual {v0, v1, p1}, Lcom/google/android/exoplayer2/p;->J(Lcom/google/android/exoplayer2/c0;I)Z

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    if-nez p1, :cond_0

    .line 14
    .line 15
    const/4 p1, 0x1

    .line 16
    invoke-virtual {p0, p1}, Lcom/google/android/exoplayer2/j;->G0(Z)V

    .line 17
    .line 18
    .line 19
    :cond_0
    const/4 p1, 0x0

    .line 20
    invoke-virtual {p0, p1}, Lcom/google/android/exoplayer2/j;->K(Z)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public d()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/google/android/exoplayer2/j;->h:Ll/sxk;

    .line 2
    .line 3
    const/16 v0, 0x16

    .line 4
    .line 5
    invoke-interface {p0, v0}, Ll/sxk;->j(I)Z

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final d0()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer2/ExoPlaybackException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/google/android/exoplayer2/j;->s:Lcom/google/android/exoplayer2/p;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/google/android/exoplayer2/p;->s()Ll/eyx;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    iget-object v1, p0, Lcom/google/android/exoplayer2/j;->s:Lcom/google/android/exoplayer2/p;

    .line 10
    .line 11
    invoke-virtual {v1}, Lcom/google/android/exoplayer2/p;->r()Ll/eyx;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    if-eq v1, v0, :cond_1

    .line 16
    .line 17
    iget-boolean v0, v0, Ll/eyx;->g:Z

    .line 18
    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/j;->s0()Z

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    if-eqz v0, :cond_1

    .line 27
    .line 28
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/j;->u()V

    .line 29
    .line 30
    .line 31
    :cond_1
    :goto_0
    return-void
.end method

.method public d1(Ll/nke0;)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/google/android/exoplayer2/j;->h:Ll/sxk;

    .line 2
    .line 3
    const/4 v0, 0x5

    .line 4
    invoke-interface {p0, v0, p1}, Ll/sxk;->c(ILjava/lang/Object;)Ll/sxk$a;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    invoke-interface {p0}, Ll/sxk$a;->a()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public declared-synchronized e(Lcom/google/android/exoplayer2/u;)V
    .locals 2

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-boolean v0, p0, Lcom/google/android/exoplayer2/j;->z:Z

    .line 3
    .line 4
    if-nez v0, :cond_1

    .line 5
    .line 6
    iget-object v0, p0, Lcom/google/android/exoplayer2/j;->j:Landroid/os/Looper;

    .line 7
    .line 8
    invoke-virtual {v0}, Landroid/os/Looper;->getThread()Ljava/lang/Thread;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {v0}, Ljava/lang/Thread;->isAlive()Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-nez v0, :cond_0

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_0
    iget-object v0, p0, Lcom/google/android/exoplayer2/j;->h:Ll/sxk;

    .line 20
    .line 21
    const/16 v1, 0xe

    .line 22
    .line 23
    invoke-interface {v0, v1, p1}, Ll/sxk;->c(ILjava/lang/Object;)Ll/sxk$a;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    invoke-interface {p1}, Ll/sxk$a;->a()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 28
    .line 29
    .line 30
    monitor-exit p0

    .line 31
    return-void

    .line 32
    :catchall_0
    move-exception p1

    .line 33
    goto :goto_1

    .line 34
    :cond_1
    :goto_0
    :try_start_1
    const-string v0, "ExoPlayerImplInternal"

    .line 35
    .line 36
    const-string v1, "Ignoring messages sent after release."

    .line 37
    .line 38
    invoke-static {v0, v1}, Ll/kyv;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    const/4 v0, 0x0

    .line 42
    invoke-virtual {p1, v0}, Lcom/google/android/exoplayer2/u;->k(Z)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 43
    .line 44
    .line 45
    monitor-exit p0

    .line 46
    return-void

    .line 47
    :goto_1
    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 48
    throw p1
.end method

.method public final e0()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer2/ExoPlaybackException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/google/android/exoplayer2/j;->t:Lcom/google/android/exoplayer2/q;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/google/android/exoplayer2/q;->i()Lcom/google/android/exoplayer2/c0;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const/4 v1, 0x1

    .line 8
    invoke-virtual {p0, v0, v1}, Lcom/google/android/exoplayer2/j;->L(Lcom/google/android/exoplayer2/c0;Z)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final e1(Ll/nke0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/google/android/exoplayer2/j;->w:Ll/nke0;

    .line 2
    .line 3
    return-void
.end method

.method public final f0(Lcom/google/android/exoplayer2/j$c;)V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer2/ExoPlaybackException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/google/android/exoplayer2/j;->y:Lcom/google/android/exoplayer2/j$e;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-virtual {v0, v1}, Lcom/google/android/exoplayer2/j$e;->b(I)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/google/android/exoplayer2/j;->t:Lcom/google/android/exoplayer2/q;

    .line 8
    .line 9
    iget v1, p1, Lcom/google/android/exoplayer2/j$c;->a:I

    .line 10
    .line 11
    iget v2, p1, Lcom/google/android/exoplayer2/j$c;->b:I

    .line 12
    .line 13
    iget v3, p1, Lcom/google/android/exoplayer2/j$c;->c:I

    .line 14
    .line 15
    iget-object p1, p1, Lcom/google/android/exoplayer2/j$c;->d:Ll/n8f0;

    .line 16
    .line 17
    invoke-virtual {v0, v1, v2, v3, p1}, Lcom/google/android/exoplayer2/q;->v(IIILl/n8f0;)Lcom/google/android/exoplayer2/c0;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    const/4 v0, 0x0

    .line 22
    invoke-virtual {p0, p1, v0}, Lcom/google/android/exoplayer2/j;->L(Lcom/google/android/exoplayer2/c0;Z)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public f1(Z)V
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/google/android/exoplayer2/j;->h:Ll/sxk;

    .line 2
    .line 3
    const/16 v0, 0xc

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    invoke-interface {p0, v0, p1, v1}, Ll/sxk;->e(III)Ll/sxk$a;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    invoke-interface {p0}, Ll/sxk$a;->a()V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public g0(IIILl/n8f0;)V
    .locals 1

    .line 1
    new-instance v0, Lcom/google/android/exoplayer2/j$c;

    .line 2
    .line 3
    invoke-direct {v0, p1, p2, p3, p4}, Lcom/google/android/exoplayer2/j$c;-><init>(IIILl/n8f0;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/google/android/exoplayer2/j;->h:Ll/sxk;

    .line 7
    .line 8
    const/16 p1, 0x13

    .line 9
    .line 10
    invoke-interface {p0, p1, v0}, Ll/sxk;->c(ILjava/lang/Object;)Ll/sxk$a;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    invoke-interface {p0}, Ll/sxk$a;->a()V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public final g1(Z)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer2/ExoPlaybackException;
        }
    .end annotation

    .line 1
    iput-boolean p1, p0, Lcom/google/android/exoplayer2/j;->F:Z

    .line 2
    .line 3
    iget-object v0, p0, Lcom/google/android/exoplayer2/j;->s:Lcom/google/android/exoplayer2/p;

    .line 4
    .line 5
    iget-object v1, p0, Lcom/google/android/exoplayer2/j;->x:Ll/fe80;

    .line 6
    .line 7
    iget-object v1, v1, Ll/fe80;->a:Lcom/google/android/exoplayer2/c0;

    .line 8
    .line 9
    invoke-virtual {v0, v1, p1}, Lcom/google/android/exoplayer2/p;->K(Lcom/google/android/exoplayer2/c0;Z)Z

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    if-nez p1, :cond_0

    .line 14
    .line 15
    const/4 p1, 0x1

    .line 16
    invoke-virtual {p0, p1}, Lcom/google/android/exoplayer2/j;->G0(Z)V

    .line 17
    .line 18
    .line 19
    :cond_0
    const/4 p1, 0x0

    .line 20
    invoke-virtual {p0, p1}, Lcom/google/android/exoplayer2/j;->K(Z)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public final h0()V
    .locals 4

    .line 1
    iget-object p0, p0, Lcom/google/android/exoplayer2/j;->s:Lcom/google/android/exoplayer2/p;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/p;->r()Ll/eyx;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    :goto_0
    if-eqz p0, :cond_2

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/eyx;->o()Ll/dgj0;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iget-object v0, v0, Ll/dgj0;->c:[Ll/u9f;

    .line 14
    .line 15
    array-length v1, v0

    .line 16
    const/4 v2, 0x0

    .line 17
    :goto_1
    if-ge v2, v1, :cond_1

    .line 18
    .line 19
    aget-object v3, v0, v2

    .line 20
    .line 21
    if-eqz v3, :cond_0

    .line 22
    .line 23
    invoke-interface {v3}, Ll/u9f;->e()V

    .line 24
    .line 25
    .line 26
    :cond_0
    add-int/lit8 v2, v2, 0x1

    .line 27
    .line 28
    goto :goto_1

    .line 29
    :cond_1
    invoke-virtual {p0}, Ll/eyx;->j()Ll/eyx;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    goto :goto_0

    .line 34
    :cond_2
    return-void
.end method

.method public h1(Ll/n8f0;)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/google/android/exoplayer2/j;->h:Ll/sxk;

    .line 2
    .line 3
    const/16 v0, 0x15

    .line 4
    .line 5
    invoke-interface {p0, v0, p1}, Ll/sxk;->c(ILjava/lang/Object;)Ll/sxk$a;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-interface {p0}, Ll/sxk$a;->a()V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public handleMessage(Landroid/os/Message;)Z
    .locals 13

    .line 1
    const-string v2, "Playback error"

    .line 2
    .line 3
    const-string v3, "ExoPlayerImplInternal"

    .line 4
    .line 5
    const/16 v4, 0x3e8

    .line 6
    .line 7
    const/4 v11, 0x0

    .line 8
    const/4 v12, 0x1

    .line 9
    :try_start_0
    iget v5, p1, Landroid/os/Message;->what:I

    .line 10
    .line 11
    packed-switch v5, :pswitch_data_0

    .line 12
    .line 13
    .line 14
    return v11

    .line 15
    :pswitch_0
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/j;->u0()V

    .line 16
    .line 17
    .line 18
    goto/16 :goto_f

    .line 19
    .line 20
    :catch_0
    move-exception v0

    .line 21
    goto/16 :goto_5

    .line 22
    .line 23
    :catch_1
    move-exception v0

    .line 24
    goto/16 :goto_6

    .line 25
    .line 26
    :catch_2
    move-exception v0

    .line 27
    goto/16 :goto_7

    .line 28
    .line 29
    :catch_3
    move-exception v0

    .line 30
    goto/16 :goto_8

    .line 31
    .line 32
    :catch_4
    move-exception v0

    .line 33
    goto/16 :goto_9

    .line 34
    .line 35
    :catch_5
    move-exception v0

    .line 36
    goto/16 :goto_c

    .line 37
    .line 38
    :catch_6
    move-exception v0

    .line 39
    goto/16 :goto_d

    .line 40
    .line 41
    :pswitch_1
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/j;->o()V

    .line 42
    .line 43
    .line 44
    goto/16 :goto_f

    .line 45
    .line 46
    :pswitch_2
    iget v0, p1, Landroid/os/Message;->arg1:I

    .line 47
    .line 48
    if-ne v0, v12, :cond_0

    .line 49
    .line 50
    move v0, v12

    .line 51
    goto :goto_0

    .line 52
    :cond_0
    move v0, v11

    .line 53
    :goto_0
    invoke-virtual {p0, v0}, Lcom/google/android/exoplayer2/j;->U0(Z)V

    .line 54
    .line 55
    .line 56
    goto/16 :goto_f

    .line 57
    .line 58
    :pswitch_3
    iget v0, p1, Landroid/os/Message;->arg1:I

    .line 59
    .line 60
    if-eqz v0, :cond_1

    .line 61
    .line 62
    move v0, v12

    .line 63
    goto :goto_1

    .line 64
    :cond_1
    move v0, v11

    .line 65
    :goto_1
    invoke-virtual {p0, v0}, Lcom/google/android/exoplayer2/j;->W0(Z)V

    .line 66
    .line 67
    .line 68
    goto/16 :goto_f

    .line 69
    .line 70
    :pswitch_4
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/j;->e0()V

    .line 71
    .line 72
    .line 73
    goto/16 :goto_f

    .line 74
    .line 75
    :pswitch_5
    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 76
    .line 77
    check-cast v0, Ll/n8f0;

    .line 78
    .line 79
    invoke-virtual {p0, v0}, Lcom/google/android/exoplayer2/j;->i1(Ll/n8f0;)V

    .line 80
    .line 81
    .line 82
    goto/16 :goto_f

    .line 83
    .line 84
    :pswitch_6
    iget v5, p1, Landroid/os/Message;->arg1:I

    .line 85
    .line 86
    iget v6, p1, Landroid/os/Message;->arg2:I

    .line 87
    .line 88
    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 89
    .line 90
    check-cast v0, Ll/n8f0;

    .line 91
    .line 92
    invoke-virtual {p0, v5, v6, v0}, Lcom/google/android/exoplayer2/j;->q0(IILl/n8f0;)V

    .line 93
    .line 94
    .line 95
    goto/16 :goto_f

    .line 96
    .line 97
    :pswitch_7
    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 98
    .line 99
    check-cast v0, Lcom/google/android/exoplayer2/j$c;

    .line 100
    .line 101
    invoke-virtual {p0, v0}, Lcom/google/android/exoplayer2/j;->f0(Lcom/google/android/exoplayer2/j$c;)V

    .line 102
    .line 103
    .line 104
    goto/16 :goto_f

    .line 105
    .line 106
    :pswitch_8
    iget-object v5, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 107
    .line 108
    check-cast v5, Lcom/google/android/exoplayer2/j$b;

    .line 109
    .line 110
    iget v0, p1, Landroid/os/Message;->arg1:I

    .line 111
    .line 112
    invoke-virtual {p0, v5, v0}, Lcom/google/android/exoplayer2/j;->m(Lcom/google/android/exoplayer2/j$b;I)V

    .line 113
    .line 114
    .line 115
    goto/16 :goto_f

    .line 116
    .line 117
    :pswitch_9
    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 118
    .line 119
    check-cast v0, Lcom/google/android/exoplayer2/j$b;

    .line 120
    .line 121
    invoke-virtual {p0, v0}, Lcom/google/android/exoplayer2/j;->S0(Lcom/google/android/exoplayer2/j$b;)V

    .line 122
    .line 123
    .line 124
    goto/16 :goto_f

    .line 125
    .line 126
    :pswitch_a
    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 127
    .line 128
    check-cast v0, Lcom/google/android/exoplayer2/s;

    .line 129
    .line 130
    invoke-virtual {p0, v0, v11}, Lcom/google/android/exoplayer2/j;->O(Lcom/google/android/exoplayer2/s;Z)V

    .line 131
    .line 132
    .line 133
    goto/16 :goto_f

    .line 134
    .line 135
    :pswitch_b
    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 136
    .line 137
    check-cast v0, Lcom/google/android/exoplayer2/u;

    .line 138
    .line 139
    invoke-virtual {p0, v0}, Lcom/google/android/exoplayer2/j;->M0(Lcom/google/android/exoplayer2/u;)V

    .line 140
    .line 141
    .line 142
    goto/16 :goto_f

    .line 143
    .line 144
    :pswitch_c
    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 145
    .line 146
    check-cast v0, Lcom/google/android/exoplayer2/u;

    .line 147
    .line 148
    invoke-virtual {p0, v0}, Lcom/google/android/exoplayer2/j;->K0(Lcom/google/android/exoplayer2/u;)V

    .line 149
    .line 150
    .line 151
    goto/16 :goto_f

    .line 152
    .line 153
    :pswitch_d
    iget v5, p1, Landroid/os/Message;->arg1:I

    .line 154
    .line 155
    if-eqz v5, :cond_2

    .line 156
    .line 157
    move v5, v12

    .line 158
    goto :goto_2

    .line 159
    :cond_2
    move v5, v11

    .line 160
    :goto_2
    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 161
    .line 162
    check-cast v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 163
    .line 164
    invoke-virtual {p0, v5, v0}, Lcom/google/android/exoplayer2/j;->Q0(ZLjava/util/concurrent/atomic/AtomicBoolean;)V

    .line 165
    .line 166
    .line 167
    goto/16 :goto_f

    .line 168
    .line 169
    :pswitch_e
    iget v0, p1, Landroid/os/Message;->arg1:I

    .line 170
    .line 171
    if-eqz v0, :cond_3

    .line 172
    .line 173
    move v0, v12

    .line 174
    goto :goto_3

    .line 175
    :cond_3
    move v0, v11

    .line 176
    :goto_3
    invoke-virtual {p0, v0}, Lcom/google/android/exoplayer2/j;->g1(Z)V

    .line 177
    .line 178
    .line 179
    goto/16 :goto_f

    .line 180
    .line 181
    :pswitch_f
    iget v0, p1, Landroid/os/Message;->arg1:I

    .line 182
    .line 183
    invoke-virtual {p0, v0}, Lcom/google/android/exoplayer2/j;->c1(I)V

    .line 184
    .line 185
    .line 186
    goto/16 :goto_f

    .line 187
    .line 188
    :pswitch_10
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/j;->t0()V

    .line 189
    .line 190
    .line 191
    goto/16 :goto_f

    .line 192
    .line 193
    :pswitch_11
    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 194
    .line 195
    check-cast v0, Lcom/google/android/exoplayer2/source/h;

    .line 196
    .line 197
    invoke-virtual {p0, v0}, Lcom/google/android/exoplayer2/j;->I(Lcom/google/android/exoplayer2/source/h;)V

    .line 198
    .line 199
    .line 200
    goto/16 :goto_f

    .line 201
    .line 202
    :pswitch_12
    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 203
    .line 204
    check-cast v0, Lcom/google/android/exoplayer2/source/h;

    .line 205
    .line 206
    invoke-virtual {p0, v0}, Lcom/google/android/exoplayer2/j;->M(Lcom/google/android/exoplayer2/source/h;)V

    .line 207
    .line 208
    .line 209
    goto/16 :goto_f

    .line 210
    .line 211
    :pswitch_13
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/j;->o0()V

    .line 212
    .line 213
    .line 214
    return v12

    .line 215
    :pswitch_14
    invoke-virtual {p0, v11, v12}, Lcom/google/android/exoplayer2/j;->r1(ZZ)V

    .line 216
    .line 217
    .line 218
    goto/16 :goto_f

    .line 219
    .line 220
    :pswitch_15
    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 221
    .line 222
    check-cast v0, Ll/nke0;

    .line 223
    .line 224
    invoke-virtual {p0, v0}, Lcom/google/android/exoplayer2/j;->e1(Ll/nke0;)V

    .line 225
    .line 226
    .line 227
    goto/16 :goto_f

    .line 228
    .line 229
    :pswitch_16
    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 230
    .line 231
    check-cast v0, Lcom/google/android/exoplayer2/s;

    .line 232
    .line 233
    invoke-virtual {p0, v0}, Lcom/google/android/exoplayer2/j;->a1(Lcom/google/android/exoplayer2/s;)V

    .line 234
    .line 235
    .line 236
    goto/16 :goto_f

    .line 237
    .line 238
    :pswitch_17
    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 239
    .line 240
    check-cast v0, Lcom/google/android/exoplayer2/j$h;

    .line 241
    .line 242
    invoke-virtual {p0, v0}, Lcom/google/android/exoplayer2/j;->H0(Lcom/google/android/exoplayer2/j$h;)V

    .line 243
    .line 244
    .line 245
    goto/16 :goto_f

    .line 246
    .line 247
    :pswitch_18
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/j;->r()V

    .line 248
    .line 249
    .line 250
    goto/16 :goto_f

    .line 251
    .line 252
    :pswitch_19
    iget v5, p1, Landroid/os/Message;->arg1:I

    .line 253
    .line 254
    if-eqz v5, :cond_4

    .line 255
    .line 256
    move v5, v12

    .line 257
    goto :goto_4

    .line 258
    :cond_4
    move v5, v11

    .line 259
    :goto_4
    iget v0, p1, Landroid/os/Message;->arg2:I

    .line 260
    .line 261
    invoke-virtual {p0, v5, v0, v12, v12}, Lcom/google/android/exoplayer2/j;->Y0(ZIZI)V

    .line 262
    .line 263
    .line 264
    goto/16 :goto_f

    .line 265
    .line 266
    :pswitch_1a
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/j;->m0()V
    :try_end_0
    .catch Lcom/google/android/exoplayer2/ExoPlaybackException; {:try_start_0 .. :try_end_0} :catch_6
    .catch Lcom/google/android/exoplayer2/drm/DrmSession$DrmSessionException; {:try_start_0 .. :try_end_0} :catch_5
    .catch Lcom/google/android/exoplayer2/ParserException; {:try_start_0 .. :try_end_0} :catch_4
    .catch Lcom/google/android/exoplayer2/upstream/DataSourceException; {:try_start_0 .. :try_end_0} :catch_3
    .catch Lcom/google/android/exoplayer2/source/BehindLiveWindowException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    .line 267
    .line 268
    .line 269
    goto/16 :goto_f

    .line 270
    .line 271
    :goto_5
    instance-of v5, v0, Ljava/lang/IllegalStateException;

    .line 272
    .line 273
    if-nez v5, :cond_5

    .line 274
    .line 275
    instance-of v5, v0, Ljava/lang/IllegalArgumentException;

    .line 276
    .line 277
    if-eqz v5, :cond_6

    .line 278
    .line 279
    :cond_5
    const/16 v4, 0x3ec

    .line 280
    .line 281
    :cond_6
    invoke-static {v0, v4}, Lcom/google/android/exoplayer2/ExoPlaybackException;->createForUnexpected(Ljava/lang/RuntimeException;I)Lcom/google/android/exoplayer2/ExoPlaybackException;

    .line 282
    .line 283
    .line 284
    move-result-object v0

    .line 285
    invoke-static {v3, v2, v0}, Ll/kyv;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 286
    .line 287
    .line 288
    invoke-virtual {p0, v12, v11}, Lcom/google/android/exoplayer2/j;->r1(ZZ)V

    .line 289
    .line 290
    .line 291
    iget-object v2, p0, Lcom/google/android/exoplayer2/j;->x:Ll/fe80;

    .line 292
    .line 293
    invoke-virtual {v2, v0}, Ll/fe80;->f(Lcom/google/android/exoplayer2/ExoPlaybackException;)Ll/fe80;

    .line 294
    .line 295
    .line 296
    move-result-object v0

    .line 297
    iput-object v0, p0, Lcom/google/android/exoplayer2/j;->x:Ll/fe80;

    .line 298
    .line 299
    goto/16 :goto_f

    .line 300
    .line 301
    :goto_6
    const/16 v2, 0x7d0

    .line 302
    .line 303
    invoke-virtual {p0, v0, v2}, Lcom/google/android/exoplayer2/j;->J(Ljava/io/IOException;I)V

    .line 304
    .line 305
    .line 306
    goto/16 :goto_f

    .line 307
    .line 308
    :goto_7
    const/16 v2, 0x3ea

    .line 309
    .line 310
    invoke-virtual {p0, v0, v2}, Lcom/google/android/exoplayer2/j;->J(Ljava/io/IOException;I)V

    .line 311
    .line 312
    .line 313
    goto/16 :goto_f

    .line 314
    .line 315
    :goto_8
    iget v2, v0, Lcom/google/android/exoplayer2/upstream/DataSourceException;->reason:I

    .line 316
    .line 317
    invoke-virtual {p0, v0, v2}, Lcom/google/android/exoplayer2/j;->J(Ljava/io/IOException;I)V

    .line 318
    .line 319
    .line 320
    goto/16 :goto_f

    .line 321
    .line 322
    :goto_9
    iget v2, v0, Lcom/google/android/exoplayer2/ParserException;->dataType:I

    .line 323
    .line 324
    if-ne v2, v12, :cond_8

    .line 325
    .line 326
    iget-boolean v2, v0, Lcom/google/android/exoplayer2/ParserException;->contentIsMalformed:Z

    .line 327
    .line 328
    if-eqz v2, :cond_7

    .line 329
    .line 330
    const/16 v2, 0xbb9

    .line 331
    .line 332
    :goto_a
    move v4, v2

    .line 333
    goto :goto_b

    .line 334
    :cond_7
    const/16 v2, 0xbbb

    .line 335
    .line 336
    goto :goto_a

    .line 337
    :cond_8
    const/4 v3, 0x4

    .line 338
    if-ne v2, v3, :cond_a

    .line 339
    .line 340
    iget-boolean v2, v0, Lcom/google/android/exoplayer2/ParserException;->contentIsMalformed:Z

    .line 341
    .line 342
    if-eqz v2, :cond_9

    .line 343
    .line 344
    const/16 v2, 0xbba

    .line 345
    .line 346
    goto :goto_a

    .line 347
    :cond_9
    const/16 v2, 0xbbc

    .line 348
    .line 349
    goto :goto_a

    .line 350
    :cond_a
    :goto_b
    invoke-virtual {p0, v0, v4}, Lcom/google/android/exoplayer2/j;->J(Ljava/io/IOException;I)V

    .line 351
    .line 352
    .line 353
    goto/16 :goto_f

    .line 354
    .line 355
    :goto_c
    iget v2, v0, Lcom/google/android/exoplayer2/drm/DrmSession$DrmSessionException;->errorCode:I

    .line 356
    .line 357
    invoke-virtual {p0, v0, v2}, Lcom/google/android/exoplayer2/j;->J(Ljava/io/IOException;I)V

    .line 358
    .line 359
    .line 360
    goto/16 :goto_f

    .line 361
    .line 362
    :goto_d
    iget v4, v0, Lcom/google/android/exoplayer2/ExoPlaybackException;->type:I

    .line 363
    .line 364
    if-ne v4, v12, :cond_b

    .line 365
    .line 366
    iget-object v4, p0, Lcom/google/android/exoplayer2/j;->s:Lcom/google/android/exoplayer2/p;

    .line 367
    .line 368
    invoke-virtual {v4}, Lcom/google/android/exoplayer2/p;->s()Ll/eyx;

    .line 369
    .line 370
    .line 371
    move-result-object v4

    .line 372
    if-eqz v4, :cond_b

    .line 373
    .line 374
    iget-object v4, v4, Ll/eyx;->f:Ll/gyx;

    .line 375
    .line 376
    iget-object v4, v4, Ll/gyx;->a:Lcom/google/android/exoplayer2/source/i$b;

    .line 377
    .line 378
    invoke-virtual {v0, v4}, Lcom/google/android/exoplayer2/ExoPlaybackException;->copyWithMediaPeriodId(Ll/fyx;)Lcom/google/android/exoplayer2/ExoPlaybackException;

    .line 379
    .line 380
    .line 381
    move-result-object v0

    .line 382
    :cond_b
    iget-boolean v4, v0, Lcom/google/android/exoplayer2/ExoPlaybackException;->isRecoverable:Z

    .line 383
    .line 384
    if-eqz v4, :cond_c

    .line 385
    .line 386
    iget-object v4, p0, Lcom/google/android/exoplayer2/j;->O:Lcom/google/android/exoplayer2/ExoPlaybackException;

    .line 387
    .line 388
    if-nez v4, :cond_c

    .line 389
    .line 390
    const-string v2, "Recoverable renderer error"

    .line 391
    .line 392
    invoke-static {v3, v2, v0}, Ll/kyv;->j(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 393
    .line 394
    .line 395
    iput-object v0, p0, Lcom/google/android/exoplayer2/j;->O:Lcom/google/android/exoplayer2/ExoPlaybackException;

    .line 396
    .line 397
    iget-object v2, p0, Lcom/google/android/exoplayer2/j;->h:Ll/sxk;

    .line 398
    .line 399
    const/16 v3, 0x19

    .line 400
    .line 401
    invoke-interface {v2, v3, v0}, Ll/sxk;->c(ILjava/lang/Object;)Ll/sxk$a;

    .line 402
    .line 403
    .line 404
    move-result-object v0

    .line 405
    invoke-interface {v2, v0}, Ll/sxk;->h(Ll/sxk$a;)Z

    .line 406
    .line 407
    .line 408
    goto :goto_f

    .line 409
    :cond_c
    iget-object v4, p0, Lcom/google/android/exoplayer2/j;->O:Lcom/google/android/exoplayer2/ExoPlaybackException;

    .line 410
    .line 411
    if-eqz v4, :cond_d

    .line 412
    .line 413
    invoke-virtual {v4, v0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .line 414
    .line 415
    .line 416
    iget-object v0, p0, Lcom/google/android/exoplayer2/j;->O:Lcom/google/android/exoplayer2/ExoPlaybackException;

    .line 417
    .line 418
    :cond_d
    invoke-static {v3, v2, v0}, Ll/kyv;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 419
    .line 420
    .line 421
    iget v2, v0, Lcom/google/android/exoplayer2/ExoPlaybackException;->type:I

    .line 422
    .line 423
    if-ne v2, v12, :cond_f

    .line 424
    .line 425
    iget-object v2, p0, Lcom/google/android/exoplayer2/j;->s:Lcom/google/android/exoplayer2/p;

    .line 426
    .line 427
    invoke-virtual {v2}, Lcom/google/android/exoplayer2/p;->r()Ll/eyx;

    .line 428
    .line 429
    .line 430
    move-result-object v2

    .line 431
    iget-object v3, p0, Lcom/google/android/exoplayer2/j;->s:Lcom/google/android/exoplayer2/p;

    .line 432
    .line 433
    invoke-virtual {v3}, Lcom/google/android/exoplayer2/p;->s()Ll/eyx;

    .line 434
    .line 435
    .line 436
    move-result-object v3

    .line 437
    if-eq v2, v3, :cond_f

    .line 438
    .line 439
    :goto_e
    iget-object v2, p0, Lcom/google/android/exoplayer2/j;->s:Lcom/google/android/exoplayer2/p;

    .line 440
    .line 441
    invoke-virtual {v2}, Lcom/google/android/exoplayer2/p;->r()Ll/eyx;

    .line 442
    .line 443
    .line 444
    move-result-object v2

    .line 445
    iget-object v3, p0, Lcom/google/android/exoplayer2/j;->s:Lcom/google/android/exoplayer2/p;

    .line 446
    .line 447
    invoke-virtual {v3}, Lcom/google/android/exoplayer2/p;->s()Ll/eyx;

    .line 448
    .line 449
    .line 450
    move-result-object v3

    .line 451
    iget-object v4, p0, Lcom/google/android/exoplayer2/j;->s:Lcom/google/android/exoplayer2/p;

    .line 452
    .line 453
    if-eq v2, v3, :cond_e

    .line 454
    .line 455
    invoke-virtual {v4}, Lcom/google/android/exoplayer2/p;->b()Ll/eyx;

    .line 456
    .line 457
    .line 458
    goto :goto_e

    .line 459
    :cond_e
    invoke-virtual {v4}, Lcom/google/android/exoplayer2/p;->r()Ll/eyx;

    .line 460
    .line 461
    .line 462
    move-result-object v2

    .line 463
    invoke-static {v2}, Ll/w11;->e(Ljava/lang/Object;)Ljava/lang/Object;

    .line 464
    .line 465
    .line 466
    move-result-object v2

    .line 467
    check-cast v2, Ll/eyx;

    .line 468
    .line 469
    iget-object v2, v2, Ll/eyx;->f:Ll/gyx;

    .line 470
    .line 471
    iget-object v3, v2, Ll/gyx;->a:Lcom/google/android/exoplayer2/source/i$b;

    .line 472
    .line 473
    move-object v5, v3

    .line 474
    iget-wide v3, v2, Ll/gyx;->b:J

    .line 475
    .line 476
    iget-wide v6, v2, Ll/gyx;->c:J

    .line 477
    .line 478
    const/4 v9, 0x1

    .line 479
    const/4 v10, 0x0

    .line 480
    move-object v2, v5

    .line 481
    move-wide v5, v6

    .line 482
    move-wide v7, v3

    .line 483
    move-object v1, p0

    .line 484
    invoke-virtual/range {v1 .. v10}, Lcom/google/android/exoplayer2/j;->P(Lcom/google/android/exoplayer2/source/i$b;JJJZI)Ll/fe80;

    .line 485
    .line 486
    .line 487
    move-result-object v2

    .line 488
    iput-object v2, p0, Lcom/google/android/exoplayer2/j;->x:Ll/fe80;

    .line 489
    .line 490
    :cond_f
    invoke-virtual {p0, v12, v11}, Lcom/google/android/exoplayer2/j;->r1(ZZ)V

    .line 491
    .line 492
    .line 493
    iget-object v2, p0, Lcom/google/android/exoplayer2/j;->x:Ll/fe80;

    .line 494
    .line 495
    invoke-virtual {v2, v0}, Ll/fe80;->f(Lcom/google/android/exoplayer2/ExoPlaybackException;)Ll/fe80;

    .line 496
    .line 497
    .line 498
    move-result-object v0

    .line 499
    iput-object v0, p0, Lcom/google/android/exoplayer2/j;->x:Ll/fe80;

    .line 500
    .line 501
    :goto_f
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/j;->Y()V

    .line 502
    .line 503
    .line 504
    return v12

    .line 505
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1a
        :pswitch_19
        :pswitch_18
        :pswitch_17
        :pswitch_16
        :pswitch_15
        :pswitch_14
        :pswitch_13
        :pswitch_12
        :pswitch_11
        :pswitch_10
        :pswitch_f
        :pswitch_e
        :pswitch_d
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public final i0(Z)V
    .locals 4

    .line 1
    iget-object p0, p0, Lcom/google/android/exoplayer2/j;->s:Lcom/google/android/exoplayer2/p;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/p;->r()Ll/eyx;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    :goto_0
    if-eqz p0, :cond_2

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/eyx;->o()Ll/dgj0;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iget-object v0, v0, Ll/dgj0;->c:[Ll/u9f;

    .line 14
    .line 15
    array-length v1, v0

    .line 16
    const/4 v2, 0x0

    .line 17
    :goto_1
    if-ge v2, v1, :cond_1

    .line 18
    .line 19
    aget-object v3, v0, v2

    .line 20
    .line 21
    if-eqz v3, :cond_0

    .line 22
    .line 23
    invoke-interface {v3, p1}, Ll/u9f;->q(Z)V

    .line 24
    .line 25
    .line 26
    :cond_0
    add-int/lit8 v2, v2, 0x1

    .line 27
    .line 28
    goto :goto_1

    .line 29
    :cond_1
    invoke-virtual {p0}, Ll/eyx;->j()Ll/eyx;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    goto :goto_0

    .line 34
    :cond_2
    return-void
.end method

.method public final i1(Ll/n8f0;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer2/ExoPlaybackException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/google/android/exoplayer2/j;->y:Lcom/google/android/exoplayer2/j$e;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-virtual {v0, v1}, Lcom/google/android/exoplayer2/j$e;->b(I)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/google/android/exoplayer2/j;->t:Lcom/google/android/exoplayer2/q;

    .line 8
    .line 9
    invoke-virtual {v0, p1}, Lcom/google/android/exoplayer2/q;->D(Ll/n8f0;)Lcom/google/android/exoplayer2/c0;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    const/4 v0, 0x0

    .line 14
    invoke-virtual {p0, p1, v0}, Lcom/google/android/exoplayer2/j;->L(Lcom/google/android/exoplayer2/c0;Z)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public bridge synthetic j(Lcom/google/android/exoplayer2/source/r;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/google/android/exoplayer2/source/h;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/google/android/exoplayer2/j;->k0(Lcom/google/android/exoplayer2/source/h;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final j0()V
    .locals 4

    .line 1
    iget-object p0, p0, Lcom/google/android/exoplayer2/j;->s:Lcom/google/android/exoplayer2/p;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/p;->r()Ll/eyx;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    :goto_0
    if-eqz p0, :cond_2

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/eyx;->o()Ll/dgj0;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iget-object v0, v0, Ll/dgj0;->c:[Ll/u9f;

    .line 14
    .line 15
    array-length v1, v0

    .line 16
    const/4 v2, 0x0

    .line 17
    :goto_1
    if-ge v2, v1, :cond_1

    .line 18
    .line 19
    aget-object v3, v0, v2

    .line 20
    .line 21
    if-eqz v3, :cond_0

    .line 22
    .line 23
    invoke-interface {v3}, Ll/u9f;->l()V

    .line 24
    .line 25
    .line 26
    :cond_0
    add-int/lit8 v2, v2, 0x1

    .line 27
    .line 28
    goto :goto_1

    .line 29
    :cond_1
    invoke-virtual {p0}, Ll/eyx;->j()Ll/eyx;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    goto :goto_0

    .line 34
    :cond_2
    return-void
.end method

.method public final j1(I)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/google/android/exoplayer2/j;->x:Ll/fe80;

    .line 2
    .line 3
    iget v1, v0, Ll/fe80;->e:I

    .line 4
    .line 5
    if-eq v1, p1, :cond_1

    .line 6
    .line 7
    const/4 v1, 0x2

    .line 8
    if-eq p1, v1, :cond_0

    .line 9
    .line 10
    const-wide v1, -0x7fffffffffffffffL    # -4.9E-324

    .line 11
    .line 12
    .line 13
    .line 14
    .line 15
    iput-wide v1, p0, Lcom/google/android/exoplayer2/j;->Q:J

    .line 16
    .line 17
    :cond_0
    invoke-virtual {v0, p1}, Ll/fe80;->h(I)Ll/fe80;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    iput-object p1, p0, Lcom/google/android/exoplayer2/j;->x:Ll/fe80;

    .line 22
    .line 23
    :cond_1
    return-void
.end method

.method public k0(Lcom/google/android/exoplayer2/source/h;)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/google/android/exoplayer2/j;->h:Ll/sxk;

    .line 2
    .line 3
    const/16 v0, 0x9

    .line 4
    .line 5
    invoke-interface {p0, v0, p1}, Ll/sxk;->c(ILjava/lang/Object;)Ll/sxk$a;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-interface {p0}, Ll/sxk$a;->a()V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final k1()Z
    .locals 6

    .line 1
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/j;->m1()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    return v1

    .line 9
    :cond_0
    iget-boolean v0, p0, Lcom/google/android/exoplayer2/j;->B:Z

    .line 10
    .line 11
    if-eqz v0, :cond_1

    .line 12
    .line 13
    return v1

    .line 14
    :cond_1
    iget-object v0, p0, Lcom/google/android/exoplayer2/j;->s:Lcom/google/android/exoplayer2/p;

    .line 15
    .line 16
    invoke-virtual {v0}, Lcom/google/android/exoplayer2/p;->r()Ll/eyx;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    if-nez v0, :cond_2

    .line 21
    .line 22
    return v1

    .line 23
    :cond_2
    invoke-virtual {v0}, Ll/eyx;->j()Ll/eyx;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    if-eqz v0, :cond_3

    .line 28
    .line 29
    iget-wide v2, p0, Lcom/google/android/exoplayer2/j;->L:J

    .line 30
    .line 31
    invoke-virtual {v0}, Ll/eyx;->m()J

    .line 32
    .line 33
    .line 34
    move-result-wide v4

    .line 35
    cmp-long p0, v2, v4

    .line 36
    .line 37
    if-ltz p0, :cond_3

    .line 38
    .line 39
    iget-boolean p0, v0, Ll/eyx;->g:Z

    .line 40
    .line 41
    if-eqz p0, :cond_3

    .line 42
    .line 43
    const/4 p0, 0x1

    .line 44
    return p0

    .line 45
    :cond_3
    return v1
.end method

.method public l(Lcom/google/android/exoplayer2/source/h;)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/google/android/exoplayer2/j;->h:Ll/sxk;

    .line 2
    .line 3
    const/16 v0, 0x8

    .line 4
    .line 5
    invoke-interface {p0, v0, p1}, Ll/sxk;->c(ILjava/lang/Object;)Ll/sxk$a;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-interface {p0}, Ll/sxk$a;->a()V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public l0()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/google/android/exoplayer2/j;->h:Ll/sxk;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-interface {p0, v0}, Ll/sxk;->a(I)Ll/sxk$a;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    invoke-interface {p0}, Ll/sxk$a;->a()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final l1()Z
    .locals 11

    .line 1
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/j;->T()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    return v1

    .line 9
    :cond_0
    iget-object v0, p0, Lcom/google/android/exoplayer2/j;->s:Lcom/google/android/exoplayer2/p;

    .line 10
    .line 11
    invoke-virtual {v0}, Lcom/google/android/exoplayer2/p;->l()Ll/eyx;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {v0}, Ll/eyx;->k()J

    .line 16
    .line 17
    .line 18
    move-result-wide v2

    .line 19
    invoke-virtual {p0, v2, v3}, Lcom/google/android/exoplayer2/j;->H(J)J

    .line 20
    .line 21
    .line 22
    move-result-wide v7

    .line 23
    iget-object v2, p0, Lcom/google/android/exoplayer2/j;->s:Lcom/google/android/exoplayer2/p;

    .line 24
    .line 25
    invoke-virtual {v2}, Lcom/google/android/exoplayer2/p;->r()Ll/eyx;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    iget-wide v3, p0, Lcom/google/android/exoplayer2/j;->L:J

    .line 30
    .line 31
    if-ne v0, v2, :cond_1

    .line 32
    .line 33
    invoke-virtual {v0, v3, v4}, Ll/eyx;->y(J)J

    .line 34
    .line 35
    .line 36
    move-result-wide v2

    .line 37
    :goto_0
    move-wide v5, v2

    .line 38
    goto :goto_1

    .line 39
    :cond_1
    invoke-virtual {v0, v3, v4}, Ll/eyx;->y(J)J

    .line 40
    .line 41
    .line 42
    move-result-wide v2

    .line 43
    iget-object v0, v0, Ll/eyx;->f:Ll/gyx;

    .line 44
    .line 45
    iget-wide v4, v0, Ll/gyx;->b:J

    .line 46
    .line 47
    sub-long/2addr v2, v4

    .line 48
    goto :goto_0

    .line 49
    :goto_1
    iget-object v4, p0, Lcom/google/android/exoplayer2/j;->f:Ll/ltv;

    .line 50
    .line 51
    iget-object v0, p0, Lcom/google/android/exoplayer2/j;->o:Lcom/google/android/exoplayer2/g;

    .line 52
    .line 53
    invoke-virtual {v0}, Lcom/google/android/exoplayer2/g;->getPlaybackParameters()Lcom/google/android/exoplayer2/s;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    iget v9, v0, Lcom/google/android/exoplayer2/s;->a:F

    .line 58
    .line 59
    invoke-interface/range {v4 .. v9}, Ll/ltv;->e(JJF)Z

    .line 60
    .line 61
    .line 62
    move-result v0

    .line 63
    if-nez v0, :cond_3

    .line 64
    .line 65
    const-wide/32 v2, 0x7a120

    .line 66
    .line 67
    .line 68
    cmp-long v2, v7, v2

    .line 69
    .line 70
    if-gez v2, :cond_3

    .line 71
    .line 72
    iget-wide v2, p0, Lcom/google/android/exoplayer2/j;->m:J

    .line 73
    .line 74
    const-wide/16 v9, 0x0

    .line 75
    .line 76
    cmp-long v2, v2, v9

    .line 77
    .line 78
    if-gtz v2, :cond_2

    .line 79
    .line 80
    iget-boolean v2, p0, Lcom/google/android/exoplayer2/j;->n:Z

    .line 81
    .line 82
    if-eqz v2, :cond_3

    .line 83
    .line 84
    :cond_2
    iget-object v0, p0, Lcom/google/android/exoplayer2/j;->s:Lcom/google/android/exoplayer2/p;

    .line 85
    .line 86
    invoke-virtual {v0}, Lcom/google/android/exoplayer2/p;->r()Ll/eyx;

    .line 87
    .line 88
    .line 89
    move-result-object v0

    .line 90
    iget-object v0, v0, Ll/eyx;->a:Lcom/google/android/exoplayer2/source/h;

    .line 91
    .line 92
    iget-object v2, p0, Lcom/google/android/exoplayer2/j;->x:Ll/fe80;

    .line 93
    .line 94
    iget-wide v2, v2, Ll/fe80;->r:J

    .line 95
    .line 96
    invoke-interface {v0, v2, v3, v1}, Lcom/google/android/exoplayer2/source/h;->t(JZ)V

    .line 97
    .line 98
    .line 99
    iget-object v4, p0, Lcom/google/android/exoplayer2/j;->f:Ll/ltv;

    .line 100
    .line 101
    iget-object p0, p0, Lcom/google/android/exoplayer2/j;->o:Lcom/google/android/exoplayer2/g;

    .line 102
    .line 103
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/g;->getPlaybackParameters()Lcom/google/android/exoplayer2/s;

    .line 104
    .line 105
    .line 106
    move-result-object p0

    .line 107
    iget v9, p0, Lcom/google/android/exoplayer2/s;->a:F

    .line 108
    .line 109
    invoke-interface/range {v4 .. v9}, Ll/ltv;->e(JJF)Z

    .line 110
    .line 111
    .line 112
    move-result p0

    .line 113
    return p0

    .line 114
    :cond_3
    return v0
.end method

.method public final m(Lcom/google/android/exoplayer2/j$b;I)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer2/ExoPlaybackException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/google/android/exoplayer2/j;->y:Lcom/google/android/exoplayer2/j$e;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-virtual {v0, v1}, Lcom/google/android/exoplayer2/j$e;->b(I)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/google/android/exoplayer2/j;->t:Lcom/google/android/exoplayer2/q;

    .line 8
    .line 9
    const/4 v1, -0x1

    .line 10
    if-ne p2, v1, :cond_0

    .line 11
    .line 12
    invoke-virtual {v0}, Lcom/google/android/exoplayer2/q;->r()I

    .line 13
    .line 14
    .line 15
    move-result p2

    .line 16
    :cond_0
    invoke-static {p1}, Lcom/google/android/exoplayer2/j$b;->b(Lcom/google/android/exoplayer2/j$b;)Ljava/util/List;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    invoke-static {p1}, Lcom/google/android/exoplayer2/j$b;->c(Lcom/google/android/exoplayer2/j$b;)Ll/n8f0;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    invoke-virtual {v0, p2, v1, p1}, Lcom/google/android/exoplayer2/q;->f(ILjava/util/List;Ll/n8f0;)Lcom/google/android/exoplayer2/c0;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    const/4 p2, 0x0

    .line 29
    invoke-virtual {p0, p1, p2}, Lcom/google/android/exoplayer2/j;->L(Lcom/google/android/exoplayer2/c0;Z)V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public final m0()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/google/android/exoplayer2/j;->y:Lcom/google/android/exoplayer2/j$e;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-virtual {v0, v1}, Lcom/google/android/exoplayer2/j$e;->b(I)V

    .line 5
    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    invoke-virtual {p0, v0, v0, v0, v1}, Lcom/google/android/exoplayer2/j;->v0(ZZZZ)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Lcom/google/android/exoplayer2/j;->f:Ll/ltv;

    .line 12
    .line 13
    invoke-interface {v0}, Ll/ltv;->a()V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Lcom/google/android/exoplayer2/j;->x:Ll/fe80;

    .line 17
    .line 18
    iget-object v0, v0, Ll/fe80;->a:Lcom/google/android/exoplayer2/c0;

    .line 19
    .line 20
    invoke-virtual {v0}, Lcom/google/android/exoplayer2/c0;->u()Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    const/4 v1, 0x2

    .line 25
    if-eqz v0, :cond_0

    .line 26
    .line 27
    const/4 v0, 0x4

    .line 28
    goto :goto_0

    .line 29
    :cond_0
    move v0, v1

    .line 30
    :goto_0
    invoke-virtual {p0, v0}, Lcom/google/android/exoplayer2/j;->j1(I)V

    .line 31
    .line 32
    .line 33
    iget-object v0, p0, Lcom/google/android/exoplayer2/j;->t:Lcom/google/android/exoplayer2/q;

    .line 34
    .line 35
    iget-object v2, p0, Lcom/google/android/exoplayer2/j;->g:Ll/md2;

    .line 36
    .line 37
    invoke-interface {v2}, Ll/md2;->g()Ll/pgj0;

    .line 38
    .line 39
    .line 40
    move-result-object v2

    .line 41
    invoke-virtual {v0, v2}, Lcom/google/android/exoplayer2/q;->w(Ll/pgj0;)V

    .line 42
    .line 43
    .line 44
    iget-object p0, p0, Lcom/google/android/exoplayer2/j;->h:Ll/sxk;

    .line 45
    .line 46
    invoke-interface {p0, v1}, Ll/sxk;->j(I)Z

    .line 47
    .line 48
    .line 49
    return-void
.end method

.method public final m1()Z
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/google/android/exoplayer2/j;->x:Ll/fe80;

    .line 2
    .line 3
    iget-boolean v0, p0, Ll/fe80;->l:Z

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget p0, p0, Ll/fe80;->m:I

    .line 8
    .line 9
    if-nez p0, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x1

    .line 12
    return p0

    .line 13
    :cond_0
    const/4 p0, 0x0

    .line 14
    return p0
.end method

.method public n(ILjava/util/List;Ll/n8f0;)V
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/util/List<",
            "Lcom/google/android/exoplayer2/q$c;",
            ">;",
            "Ll/n8f0;",
            ")V"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/google/android/exoplayer2/j;->h:Ll/sxk;

    .line 2
    .line 3
    new-instance v0, Lcom/google/android/exoplayer2/j$b;

    .line 4
    .line 5
    const-wide v4, -0x7fffffffffffffffL    # -4.9E-324

    .line 6
    .line 7
    .line 8
    .line 9
    .line 10
    const/4 v6, 0x0

    .line 11
    const/4 v3, -0x1

    .line 12
    move-object v1, p2

    .line 13
    move-object v2, p3

    .line 14
    invoke-direct/range {v0 .. v6}, Lcom/google/android/exoplayer2/j$b;-><init>(Ljava/util/List;Ll/n8f0;IJLcom/google/android/exoplayer2/j$a;)V

    .line 15
    .line 16
    .line 17
    const/16 p2, 0x12

    .line 18
    .line 19
    const/4 p3, 0x0

    .line 20
    invoke-interface {p0, p2, p1, p3, v0}, Ll/sxk;->f(IIILjava/lang/Object;)Ll/sxk$a;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    invoke-interface {p0}, Ll/sxk$a;->a()V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public declared-synchronized n0()Z
    .locals 3

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-boolean v0, p0, Lcom/google/android/exoplayer2/j;->z:Z

    .line 3
    .line 4
    if-nez v0, :cond_1

    .line 5
    .line 6
    iget-object v0, p0, Lcom/google/android/exoplayer2/j;->j:Landroid/os/Looper;

    .line 7
    .line 8
    invoke-virtual {v0}, Landroid/os/Looper;->getThread()Ljava/lang/Thread;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {v0}, Ljava/lang/Thread;->isAlive()Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-nez v0, :cond_0

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_0
    iget-object v0, p0, Lcom/google/android/exoplayer2/j;->h:Ll/sxk;

    .line 20
    .line 21
    const/4 v1, 0x7

    .line 22
    invoke-interface {v0, v1}, Ll/sxk;->j(I)Z

    .line 23
    .line 24
    .line 25
    new-instance v0, Ll/r9f;

    .line 26
    .line 27
    invoke-direct {v0, p0}, Ll/r9f;-><init>(Lcom/google/android/exoplayer2/j;)V

    .line 28
    .line 29
    .line 30
    iget-wide v1, p0, Lcom/google/android/exoplayer2/j;->v:J

    .line 31
    .line 32
    invoke-virtual {p0, v0, v1, v2}, Lcom/google/android/exoplayer2/j;->z1(Ll/b7h0;J)V

    .line 33
    .line 34
    .line 35
    iget-boolean v0, p0, Lcom/google/android/exoplayer2/j;->z:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 36
    .line 37
    monitor-exit p0

    .line 38
    return v0

    .line 39
    :catchall_0
    move-exception v0

    .line 40
    goto :goto_1

    .line 41
    :cond_1
    :goto_0
    monitor-exit p0

    .line 42
    const/4 p0, 0x1

    .line 43
    return p0

    .line 44
    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 45
    throw v0
.end method

.method public final n1(Z)Z
    .locals 13

    .line 1
    iget v0, p0, Lcom/google/android/exoplayer2/j;->J:I

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/j;->V()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0

    .line 10
    :cond_0
    const/4 v0, 0x0

    .line 11
    if-nez p1, :cond_1

    .line 12
    .line 13
    return v0

    .line 14
    :cond_1
    iget-object p1, p0, Lcom/google/android/exoplayer2/j;->x:Ll/fe80;

    .line 15
    .line 16
    iget-boolean p1, p1, Ll/fe80;->g:Z

    .line 17
    .line 18
    const/4 v1, 0x1

    .line 19
    if-nez p1, :cond_2

    .line 20
    .line 21
    return v1

    .line 22
    :cond_2
    iget-object p1, p0, Lcom/google/android/exoplayer2/j;->s:Lcom/google/android/exoplayer2/p;

    .line 23
    .line 24
    invoke-virtual {p1}, Lcom/google/android/exoplayer2/p;->r()Ll/eyx;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    iget-object v2, p0, Lcom/google/android/exoplayer2/j;->x:Ll/fe80;

    .line 29
    .line 30
    iget-object v2, v2, Ll/fe80;->a:Lcom/google/android/exoplayer2/c0;

    .line 31
    .line 32
    iget-object v3, p1, Ll/eyx;->f:Ll/gyx;

    .line 33
    .line 34
    iget-object v3, v3, Ll/gyx;->a:Lcom/google/android/exoplayer2/source/i$b;

    .line 35
    .line 36
    invoke-virtual {p0, v2, v3}, Lcom/google/android/exoplayer2/j;->o1(Lcom/google/android/exoplayer2/c0;Lcom/google/android/exoplayer2/source/i$b;)Z

    .line 37
    .line 38
    .line 39
    move-result v2

    .line 40
    if-eqz v2, :cond_3

    .line 41
    .line 42
    iget-object v2, p0, Lcom/google/android/exoplayer2/j;->u:Lcom/google/android/exoplayer2/m;

    .line 43
    .line 44
    invoke-interface {v2}, Lcom/google/android/exoplayer2/m;->c()J

    .line 45
    .line 46
    .line 47
    move-result-wide v2

    .line 48
    :goto_0
    move-wide v11, v2

    .line 49
    goto :goto_1

    .line 50
    :cond_3
    const-wide v2, -0x7fffffffffffffffL    # -4.9E-324

    .line 51
    .line 52
    .line 53
    .line 54
    .line 55
    goto :goto_0

    .line 56
    :goto_1
    iget-object v2, p0, Lcom/google/android/exoplayer2/j;->s:Lcom/google/android/exoplayer2/p;

    .line 57
    .line 58
    invoke-virtual {v2}, Lcom/google/android/exoplayer2/p;->l()Ll/eyx;

    .line 59
    .line 60
    .line 61
    move-result-object v2

    .line 62
    invoke-virtual {v2}, Ll/eyx;->q()Z

    .line 63
    .line 64
    .line 65
    move-result v3

    .line 66
    if-eqz v3, :cond_4

    .line 67
    .line 68
    iget-object v3, v2, Ll/eyx;->f:Ll/gyx;

    .line 69
    .line 70
    iget-boolean v3, v3, Ll/gyx;->i:Z

    .line 71
    .line 72
    if-eqz v3, :cond_4

    .line 73
    .line 74
    move v3, v1

    .line 75
    goto :goto_2

    .line 76
    :cond_4
    move v3, v0

    .line 77
    :goto_2
    iget-object v4, v2, Ll/eyx;->f:Ll/gyx;

    .line 78
    .line 79
    iget-object v4, v4, Ll/gyx;->a:Lcom/google/android/exoplayer2/source/i$b;

    .line 80
    .line 81
    invoke-virtual {v4}, Ll/fyx;->b()Z

    .line 82
    .line 83
    .line 84
    move-result v4

    .line 85
    if-eqz v4, :cond_5

    .line 86
    .line 87
    iget-boolean v2, v2, Ll/eyx;->d:Z

    .line 88
    .line 89
    if-nez v2, :cond_5

    .line 90
    .line 91
    move v2, v1

    .line 92
    goto :goto_3

    .line 93
    :cond_5
    move v2, v0

    .line 94
    :goto_3
    if-nez v3, :cond_7

    .line 95
    .line 96
    if-nez v2, :cond_7

    .line 97
    .line 98
    iget-object v4, p0, Lcom/google/android/exoplayer2/j;->f:Ll/ltv;

    .line 99
    .line 100
    iget-object v2, p0, Lcom/google/android/exoplayer2/j;->x:Ll/fe80;

    .line 101
    .line 102
    iget-object v5, v2, Ll/fe80;->a:Lcom/google/android/exoplayer2/c0;

    .line 103
    .line 104
    iget-object p1, p1, Ll/eyx;->f:Ll/gyx;

    .line 105
    .line 106
    iget-object v6, p1, Ll/gyx;->a:Lcom/google/android/exoplayer2/source/i$b;

    .line 107
    .line 108
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/j;->G()J

    .line 109
    .line 110
    .line 111
    move-result-wide v7

    .line 112
    iget-object p1, p0, Lcom/google/android/exoplayer2/j;->o:Lcom/google/android/exoplayer2/g;

    .line 113
    .line 114
    invoke-virtual {p1}, Lcom/google/android/exoplayer2/g;->getPlaybackParameters()Lcom/google/android/exoplayer2/s;

    .line 115
    .line 116
    .line 117
    move-result-object p1

    .line 118
    iget v9, p1, Lcom/google/android/exoplayer2/s;->a:F

    .line 119
    .line 120
    iget-boolean v10, p0, Lcom/google/android/exoplayer2/j;->C:Z

    .line 121
    .line 122
    invoke-interface/range {v4 .. v12}, Ll/ltv;->k(Lcom/google/android/exoplayer2/c0;Ll/fyx;JFZJ)Z

    .line 123
    .line 124
    .line 125
    move-result p0

    .line 126
    if-eqz p0, :cond_6

    .line 127
    .line 128
    goto :goto_4

    .line 129
    :cond_6
    return v0

    .line 130
    :cond_7
    :goto_4
    return v1
.end method

.method public final o()V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer2/ExoPlaybackException;
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/j;->u0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final o0()V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    const/4 v1, 0x1

    .line 3
    invoke-virtual {p0, v1, v0, v1, v0}, Lcom/google/android/exoplayer2/j;->v0(ZZZZ)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/j;->p0()V

    .line 7
    .line 8
    .line 9
    iget-object v0, p0, Lcom/google/android/exoplayer2/j;->f:Ll/ltv;

    .line 10
    .line 11
    invoke-interface {v0}, Ll/ltv;->d()V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0, v1}, Lcom/google/android/exoplayer2/j;->j1(I)V

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Lcom/google/android/exoplayer2/j;->i:Landroid/os/HandlerThread;

    .line 18
    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    invoke-virtual {v0}, Landroid/os/HandlerThread;->quit()Z

    .line 22
    .line 23
    .line 24
    :cond_0
    monitor-enter p0

    .line 25
    :try_start_0
    iput-boolean v1, p0, Lcom/google/android/exoplayer2/j;->z:Z

    .line 26
    .line 27
    invoke-virtual {p0}, Ljava/lang/Object;->notifyAll()V

    .line 28
    .line 29
    .line 30
    monitor-exit p0

    .line 31
    return-void

    .line 32
    :catchall_0
    move-exception v0

    .line 33
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 34
    throw v0
.end method

.method public final o1(Lcom/google/android/exoplayer2/c0;Lcom/google/android/exoplayer2/source/i$b;)Z
    .locals 4

    .line 1
    invoke-virtual {p2}, Ll/fyx;->b()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-nez v0, :cond_1

    .line 7
    .line 8
    invoke-virtual {p1}, Lcom/google/android/exoplayer2/c0;->u()Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_0
    iget-object p2, p2, Ll/fyx;->a:Ljava/lang/Object;

    .line 16
    .line 17
    iget-object v0, p0, Lcom/google/android/exoplayer2/j;->l:Lcom/google/android/exoplayer2/c0$b;

    .line 18
    .line 19
    invoke-virtual {p1, p2, v0}, Lcom/google/android/exoplayer2/c0;->l(Ljava/lang/Object;Lcom/google/android/exoplayer2/c0$b;)Lcom/google/android/exoplayer2/c0$b;

    .line 20
    .line 21
    .line 22
    move-result-object p2

    .line 23
    iget p2, p2, Lcom/google/android/exoplayer2/c0$b;->c:I

    .line 24
    .line 25
    iget-object v0, p0, Lcom/google/android/exoplayer2/j;->k:Lcom/google/android/exoplayer2/c0$d;

    .line 26
    .line 27
    invoke-virtual {p1, p2, v0}, Lcom/google/android/exoplayer2/c0;->r(ILcom/google/android/exoplayer2/c0$d;)Lcom/google/android/exoplayer2/c0$d;

    .line 28
    .line 29
    .line 30
    iget-object p1, p0, Lcom/google/android/exoplayer2/j;->k:Lcom/google/android/exoplayer2/c0$d;

    .line 31
    .line 32
    invoke-virtual {p1}, Lcom/google/android/exoplayer2/c0$d;->h()Z

    .line 33
    .line 34
    .line 35
    move-result p1

    .line 36
    if-eqz p1, :cond_1

    .line 37
    .line 38
    iget-object p0, p0, Lcom/google/android/exoplayer2/j;->k:Lcom/google/android/exoplayer2/c0$d;

    .line 39
    .line 40
    iget-boolean p1, p0, Lcom/google/android/exoplayer2/c0$d;->i:Z

    .line 41
    .line 42
    if-eqz p1, :cond_1

    .line 43
    .line 44
    iget-wide p0, p0, Lcom/google/android/exoplayer2/c0$d;->f:J

    .line 45
    .line 46
    const-wide v2, -0x7fffffffffffffffL    # -4.9E-324

    .line 47
    .line 48
    .line 49
    .line 50
    .line 51
    cmp-long p0, p0, v2

    .line 52
    .line 53
    if-eqz p0, :cond_1

    .line 54
    .line 55
    const/4 p0, 0x1

    .line 56
    return p0

    .line 57
    :cond_1
    :goto_0
    return v1
.end method

.method public final p(Lcom/google/android/exoplayer2/u;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer2/ExoPlaybackException;
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Lcom/google/android/exoplayer2/u;->j()Z

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
    const/4 p0, 0x1

    .line 9
    :try_start_0
    invoke-virtual {p1}, Lcom/google/android/exoplayer2/u;->g()Lcom/google/android/exoplayer2/u$b;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {p1}, Lcom/google/android/exoplayer2/u;->i()I

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    invoke-virtual {p1}, Lcom/google/android/exoplayer2/u;->e()Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    invoke-interface {v0, v1, v2}, Lcom/google/android/exoplayer2/u$b;->f(ILjava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 22
    .line 23
    .line 24
    invoke-virtual {p1, p0}, Lcom/google/android/exoplayer2/u;->k(Z)V

    .line 25
    .line 26
    .line 27
    return-void

    .line 28
    :catchall_0
    move-exception v0

    .line 29
    invoke-virtual {p1, p0}, Lcom/google/android/exoplayer2/u;->k(Z)V

    .line 30
    .line 31
    .line 32
    throw v0
.end method

.method public final p0()V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    :goto_0
    iget-object v1, p0, Lcom/google/android/exoplayer2/j;->a:[Lcom/google/android/exoplayer2/x;

    .line 3
    .line 4
    array-length v1, v1

    .line 5
    if-ge v0, v1, :cond_0

    .line 6
    .line 7
    iget-object v1, p0, Lcom/google/android/exoplayer2/j;->c:[Lcom/google/android/exoplayer2/y;

    .line 8
    .line 9
    aget-object v1, v1, v0

    .line 10
    .line 11
    invoke-interface {v1}, Lcom/google/android/exoplayer2/y;->q()V

    .line 12
    .line 13
    .line 14
    iget-object v1, p0, Lcom/google/android/exoplayer2/j;->a:[Lcom/google/android/exoplayer2/x;

    .line 15
    .line 16
    aget-object v1, v1, v0

    .line 17
    .line 18
    invoke-interface {v1}, Lcom/google/android/exoplayer2/x;->release()V

    .line 19
    .line 20
    .line 21
    add-int/lit8 v0, v0, 0x1

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_0
    return-void
.end method

.method public final p1()V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer2/ExoPlaybackException;
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Lcom/google/android/exoplayer2/j;->C:Z

    .line 3
    .line 4
    iget-object v1, p0, Lcom/google/android/exoplayer2/j;->o:Lcom/google/android/exoplayer2/g;

    .line 5
    .line 6
    invoke-virtual {v1}, Lcom/google/android/exoplayer2/g;->e()V

    .line 7
    .line 8
    .line 9
    iget-object p0, p0, Lcom/google/android/exoplayer2/j;->a:[Lcom/google/android/exoplayer2/x;

    .line 10
    .line 11
    array-length v1, p0

    .line 12
    :goto_0
    if-ge v0, v1, :cond_1

    .line 13
    .line 14
    aget-object v2, p0, v0

    .line 15
    .line 16
    invoke-static {v2}, Lcom/google/android/exoplayer2/j;->U(Lcom/google/android/exoplayer2/x;)Z

    .line 17
    .line 18
    .line 19
    move-result v3

    .line 20
    if-eqz v3, :cond_0

    .line 21
    .line 22
    invoke-interface {v2}, Lcom/google/android/exoplayer2/x;->start()V

    .line 23
    .line 24
    .line 25
    :cond_0
    add-int/lit8 v0, v0, 0x1

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_1
    return-void
.end method

.method public final q(Lcom/google/android/exoplayer2/x;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer2/ExoPlaybackException;
        }
    .end annotation

    .line 1
    invoke-static {p1}, Lcom/google/android/exoplayer2/j;->U(Lcom/google/android/exoplayer2/x;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    iget-object v0, p0, Lcom/google/android/exoplayer2/j;->o:Lcom/google/android/exoplayer2/g;

    .line 9
    .line 10
    invoke-virtual {v0, p1}, Lcom/google/android/exoplayer2/g;->a(Lcom/google/android/exoplayer2/x;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p0, p1}, Lcom/google/android/exoplayer2/j;->w(Lcom/google/android/exoplayer2/x;)V

    .line 14
    .line 15
    .line 16
    invoke-interface {p1}, Lcom/google/android/exoplayer2/x;->disable()V

    .line 17
    .line 18
    .line 19
    iget p1, p0, Lcom/google/android/exoplayer2/j;->J:I

    .line 20
    .line 21
    add-int/lit8 p1, p1, -0x1

    .line 22
    .line 23
    iput p1, p0, Lcom/google/android/exoplayer2/j;->J:I

    .line 24
    .line 25
    return-void
.end method

.method public final q0(IILl/n8f0;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer2/ExoPlaybackException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/google/android/exoplayer2/j;->y:Lcom/google/android/exoplayer2/j$e;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-virtual {v0, v1}, Lcom/google/android/exoplayer2/j$e;->b(I)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/google/android/exoplayer2/j;->t:Lcom/google/android/exoplayer2/q;

    .line 8
    .line 9
    invoke-virtual {v0, p1, p2, p3}, Lcom/google/android/exoplayer2/q;->A(IILl/n8f0;)Lcom/google/android/exoplayer2/c0;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    const/4 p2, 0x0

    .line 14
    invoke-virtual {p0, p1, p2}, Lcom/google/android/exoplayer2/j;->L(Lcom/google/android/exoplayer2/c0;Z)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public q1()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/google/android/exoplayer2/j;->h:Ll/sxk;

    .line 2
    .line 3
    const/4 v0, 0x6

    .line 4
    invoke-interface {p0, v0}, Ll/sxk;->a(I)Ll/sxk$a;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    invoke-interface {p0}, Ll/sxk$a;->a()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final r()V
    .locals 16
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer2/ExoPlaybackException;,
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    iget-object v1, v0, Lcom/google/android/exoplayer2/j;->q:Ll/qa5;

    .line 4
    .line 5
    invoke-interface {v1}, Ll/qa5;->a()J

    .line 6
    .line 7
    .line 8
    move-result-wide v1

    .line 9
    iget-object v3, v0, Lcom/google/android/exoplayer2/j;->h:Ll/sxk;

    .line 10
    .line 11
    const/4 v4, 0x2

    .line 12
    invoke-interface {v3, v4}, Ll/sxk;->l(I)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {v0}, Lcom/google/android/exoplayer2/j;->v1()V

    .line 16
    .line 17
    .line 18
    iget-object v3, v0, Lcom/google/android/exoplayer2/j;->x:Ll/fe80;

    .line 19
    .line 20
    iget v3, v3, Ll/fe80;->e:I

    .line 21
    .line 22
    const/4 v5, 0x1

    .line 23
    if-eq v3, v5, :cond_21

    .line 24
    .line 25
    const/4 v6, 0x4

    .line 26
    if-ne v3, v6, :cond_0

    .line 27
    .line 28
    goto/16 :goto_10

    .line 29
    .line 30
    :cond_0
    iget-object v3, v0, Lcom/google/android/exoplayer2/j;->s:Lcom/google/android/exoplayer2/p;

    .line 31
    .line 32
    invoke-virtual {v3}, Lcom/google/android/exoplayer2/p;->r()Ll/eyx;

    .line 33
    .line 34
    .line 35
    move-result-object v3

    .line 36
    const-wide/16 v7, 0xa

    .line 37
    .line 38
    if-nez v3, :cond_1

    .line 39
    .line 40
    invoke-virtual {v0, v1, v2, v7, v8}, Lcom/google/android/exoplayer2/j;->E0(JJ)V

    .line 41
    .line 42
    .line 43
    return-void

    .line 44
    :cond_1
    const-string v9, "doSomeWork"

    .line 45
    .line 46
    invoke-static {v9}, Ll/nej0;->a(Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    invoke-virtual {v0}, Lcom/google/android/exoplayer2/j;->w1()V

    .line 50
    .line 51
    .line 52
    iget-boolean v9, v3, Ll/eyx;->d:Z

    .line 53
    .line 54
    const-wide/16 v10, 0x3e8

    .line 55
    .line 56
    const/4 v12, 0x0

    .line 57
    if-eqz v9, :cond_a

    .line 58
    .line 59
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 60
    .line 61
    .line 62
    move-result-wide v13

    .line 63
    mul-long/2addr v13, v10

    .line 64
    iget-object v9, v3, Ll/eyx;->a:Lcom/google/android/exoplayer2/source/h;

    .line 65
    .line 66
    iget-object v15, v0, Lcom/google/android/exoplayer2/j;->x:Ll/fe80;

    .line 67
    .line 68
    iget-wide v7, v15, Ll/fe80;->r:J

    .line 69
    .line 70
    iget-wide v10, v0, Lcom/google/android/exoplayer2/j;->m:J

    .line 71
    .line 72
    sub-long/2addr v7, v10

    .line 73
    iget-boolean v10, v0, Lcom/google/android/exoplayer2/j;->n:Z

    .line 74
    .line 75
    invoke-interface {v9, v7, v8, v10}, Lcom/google/android/exoplayer2/source/h;->t(JZ)V

    .line 76
    .line 77
    .line 78
    move v8, v5

    .line 79
    move v9, v8

    .line 80
    move v7, v12

    .line 81
    :goto_0
    iget-object v10, v0, Lcom/google/android/exoplayer2/j;->a:[Lcom/google/android/exoplayer2/x;

    .line 82
    .line 83
    array-length v11, v10

    .line 84
    if-ge v7, v11, :cond_b

    .line 85
    .line 86
    aget-object v10, v10, v7

    .line 87
    .line 88
    invoke-static {v10}, Lcom/google/android/exoplayer2/j;->U(Lcom/google/android/exoplayer2/x;)Z

    .line 89
    .line 90
    .line 91
    move-result v11

    .line 92
    if-nez v11, :cond_2

    .line 93
    .line 94
    goto :goto_7

    .line 95
    :cond_2
    iget-wide v4, v0, Lcom/google/android/exoplayer2/j;->L:J

    .line 96
    .line 97
    invoke-interface {v10, v4, v5, v13, v14}, Lcom/google/android/exoplayer2/x;->j(JJ)V

    .line 98
    .line 99
    .line 100
    if-eqz v8, :cond_3

    .line 101
    .line 102
    invoke-interface {v10}, Lcom/google/android/exoplayer2/x;->c()Z

    .line 103
    .line 104
    .line 105
    move-result v4

    .line 106
    if-eqz v4, :cond_3

    .line 107
    .line 108
    const/4 v8, 0x1

    .line 109
    goto :goto_1

    .line 110
    :cond_3
    move v8, v12

    .line 111
    :goto_1
    iget-object v4, v3, Ll/eyx;->c:[Ll/xwd0;

    .line 112
    .line 113
    aget-object v4, v4, v7

    .line 114
    .line 115
    invoke-interface {v10}, Lcom/google/android/exoplayer2/x;->getStream()Ll/xwd0;

    .line 116
    .line 117
    .line 118
    move-result-object v5

    .line 119
    if-eq v4, v5, :cond_4

    .line 120
    .line 121
    const/4 v4, 0x1

    .line 122
    goto :goto_2

    .line 123
    :cond_4
    move v4, v12

    .line 124
    :goto_2
    if-nez v4, :cond_5

    .line 125
    .line 126
    invoke-interface {v10}, Lcom/google/android/exoplayer2/x;->d()Z

    .line 127
    .line 128
    .line 129
    move-result v5

    .line 130
    if-eqz v5, :cond_5

    .line 131
    .line 132
    const/4 v5, 0x1

    .line 133
    goto :goto_3

    .line 134
    :cond_5
    move v5, v12

    .line 135
    :goto_3
    if-nez v4, :cond_7

    .line 136
    .line 137
    if-nez v5, :cond_7

    .line 138
    .line 139
    invoke-interface {v10}, Lcom/google/android/exoplayer2/x;->b()Z

    .line 140
    .line 141
    .line 142
    move-result v4

    .line 143
    if-nez v4, :cond_7

    .line 144
    .line 145
    invoke-interface {v10}, Lcom/google/android/exoplayer2/x;->c()Z

    .line 146
    .line 147
    .line 148
    move-result v4

    .line 149
    if-eqz v4, :cond_6

    .line 150
    .line 151
    goto :goto_4

    .line 152
    :cond_6
    move v4, v12

    .line 153
    goto :goto_5

    .line 154
    :cond_7
    :goto_4
    const/4 v4, 0x1

    .line 155
    :goto_5
    if-eqz v9, :cond_8

    .line 156
    .line 157
    if-eqz v4, :cond_8

    .line 158
    .line 159
    const/4 v9, 0x1

    .line 160
    goto :goto_6

    .line 161
    :cond_8
    move v9, v12

    .line 162
    :goto_6
    if-nez v4, :cond_9

    .line 163
    .line 164
    invoke-interface {v10}, Lcom/google/android/exoplayer2/x;->w()V

    .line 165
    .line 166
    .line 167
    :cond_9
    :goto_7
    add-int/lit8 v7, v7, 0x1

    .line 168
    .line 169
    const/4 v4, 0x2

    .line 170
    const/4 v5, 0x1

    .line 171
    goto :goto_0

    .line 172
    :cond_a
    iget-object v4, v3, Ll/eyx;->a:Lcom/google/android/exoplayer2/source/h;

    .line 173
    .line 174
    invoke-interface {v4}, Lcom/google/android/exoplayer2/source/h;->s()V

    .line 175
    .line 176
    .line 177
    const/4 v8, 0x1

    .line 178
    const/4 v9, 0x1

    .line 179
    :cond_b
    iget-object v4, v3, Ll/eyx;->f:Ll/gyx;

    .line 180
    .line 181
    iget-wide v4, v4, Ll/gyx;->e:J

    .line 182
    .line 183
    const-wide v13, -0x7fffffffffffffffL    # -4.9E-324

    .line 184
    .line 185
    .line 186
    .line 187
    .line 188
    if-eqz v8, :cond_d

    .line 189
    .line 190
    iget-boolean v7, v3, Ll/eyx;->d:Z

    .line 191
    .line 192
    if-eqz v7, :cond_d

    .line 193
    .line 194
    cmp-long v7, v4, v13

    .line 195
    .line 196
    if-eqz v7, :cond_c

    .line 197
    .line 198
    iget-object v7, v0, Lcom/google/android/exoplayer2/j;->x:Ll/fe80;

    .line 199
    .line 200
    iget-wide v7, v7, Ll/fe80;->r:J

    .line 201
    .line 202
    cmp-long v4, v4, v7

    .line 203
    .line 204
    if-gtz v4, :cond_d

    .line 205
    .line 206
    :cond_c
    const/4 v4, 0x1

    .line 207
    goto :goto_8

    .line 208
    :cond_d
    move v4, v12

    .line 209
    :goto_8
    if-eqz v4, :cond_e

    .line 210
    .line 211
    iget-boolean v5, v0, Lcom/google/android/exoplayer2/j;->B:Z

    .line 212
    .line 213
    if-eqz v5, :cond_e

    .line 214
    .line 215
    iput-boolean v12, v0, Lcom/google/android/exoplayer2/j;->B:Z

    .line 216
    .line 217
    iget-object v5, v0, Lcom/google/android/exoplayer2/j;->x:Ll/fe80;

    .line 218
    .line 219
    iget v5, v5, Ll/fe80;->m:I

    .line 220
    .line 221
    const/4 v7, 0x5

    .line 222
    invoke-virtual {v0, v12, v5, v12, v7}, Lcom/google/android/exoplayer2/j;->Y0(ZIZI)V

    .line 223
    .line 224
    .line 225
    :cond_e
    const/4 v5, 0x3

    .line 226
    if-eqz v4, :cond_f

    .line 227
    .line 228
    iget-object v4, v3, Ll/eyx;->f:Ll/gyx;

    .line 229
    .line 230
    iget-boolean v4, v4, Ll/gyx;->i:Z

    .line 231
    .line 232
    if-eqz v4, :cond_f

    .line 233
    .line 234
    invoke-virtual {v0, v6}, Lcom/google/android/exoplayer2/j;->j1(I)V

    .line 235
    .line 236
    .line 237
    invoke-virtual {v0}, Lcom/google/android/exoplayer2/j;->s1()V

    .line 238
    .line 239
    .line 240
    goto :goto_9

    .line 241
    :cond_f
    iget-object v4, v0, Lcom/google/android/exoplayer2/j;->x:Ll/fe80;

    .line 242
    .line 243
    iget v4, v4, Ll/fe80;->e:I

    .line 244
    .line 245
    const/4 v11, 0x2

    .line 246
    if-ne v4, v11, :cond_10

    .line 247
    .line 248
    invoke-virtual {v0, v9}, Lcom/google/android/exoplayer2/j;->n1(Z)Z

    .line 249
    .line 250
    .line 251
    move-result v4

    .line 252
    if-eqz v4, :cond_10

    .line 253
    .line 254
    invoke-virtual {v0, v5}, Lcom/google/android/exoplayer2/j;->j1(I)V

    .line 255
    .line 256
    .line 257
    const/4 v4, 0x0

    .line 258
    iput-object v4, v0, Lcom/google/android/exoplayer2/j;->O:Lcom/google/android/exoplayer2/ExoPlaybackException;

    .line 259
    .line 260
    invoke-virtual {v0}, Lcom/google/android/exoplayer2/j;->m1()Z

    .line 261
    .line 262
    .line 263
    move-result v4

    .line 264
    if-eqz v4, :cond_14

    .line 265
    .line 266
    invoke-virtual {v0}, Lcom/google/android/exoplayer2/j;->p1()V

    .line 267
    .line 268
    .line 269
    goto :goto_9

    .line 270
    :cond_10
    iget-object v4, v0, Lcom/google/android/exoplayer2/j;->x:Ll/fe80;

    .line 271
    .line 272
    iget v4, v4, Ll/fe80;->e:I

    .line 273
    .line 274
    if-ne v4, v5, :cond_14

    .line 275
    .line 276
    iget v4, v0, Lcom/google/android/exoplayer2/j;->J:I

    .line 277
    .line 278
    if-nez v4, :cond_11

    .line 279
    .line 280
    invoke-virtual {v0}, Lcom/google/android/exoplayer2/j;->V()Z

    .line 281
    .line 282
    .line 283
    move-result v4

    .line 284
    if-eqz v4, :cond_12

    .line 285
    .line 286
    goto :goto_9

    .line 287
    :cond_11
    if-nez v9, :cond_14

    .line 288
    .line 289
    :cond_12
    invoke-virtual {v0}, Lcom/google/android/exoplayer2/j;->m1()Z

    .line 290
    .line 291
    .line 292
    move-result v4

    .line 293
    iput-boolean v4, v0, Lcom/google/android/exoplayer2/j;->C:Z

    .line 294
    .line 295
    const/4 v11, 0x2

    .line 296
    invoke-virtual {v0, v11}, Lcom/google/android/exoplayer2/j;->j1(I)V

    .line 297
    .line 298
    .line 299
    iget-boolean v4, v0, Lcom/google/android/exoplayer2/j;->C:Z

    .line 300
    .line 301
    if-eqz v4, :cond_13

    .line 302
    .line 303
    invoke-virtual {v0}, Lcom/google/android/exoplayer2/j;->j0()V

    .line 304
    .line 305
    .line 306
    iget-object v4, v0, Lcom/google/android/exoplayer2/j;->u:Lcom/google/android/exoplayer2/m;

    .line 307
    .line 308
    invoke-interface {v4}, Lcom/google/android/exoplayer2/m;->d()V

    .line 309
    .line 310
    .line 311
    :cond_13
    invoke-virtual {v0}, Lcom/google/android/exoplayer2/j;->s1()V

    .line 312
    .line 313
    .line 314
    :cond_14
    :goto_9
    iget-object v4, v0, Lcom/google/android/exoplayer2/j;->x:Ll/fe80;

    .line 315
    .line 316
    iget v4, v4, Ll/fe80;->e:I

    .line 317
    .line 318
    const/4 v11, 0x2

    .line 319
    if-ne v4, v11, :cond_19

    .line 320
    .line 321
    move v4, v12

    .line 322
    :goto_a
    iget-object v7, v0, Lcom/google/android/exoplayer2/j;->a:[Lcom/google/android/exoplayer2/x;

    .line 323
    .line 324
    array-length v8, v7

    .line 325
    if-ge v4, v8, :cond_16

    .line 326
    .line 327
    aget-object v7, v7, v4

    .line 328
    .line 329
    invoke-static {v7}, Lcom/google/android/exoplayer2/j;->U(Lcom/google/android/exoplayer2/x;)Z

    .line 330
    .line 331
    .line 332
    move-result v7

    .line 333
    if-eqz v7, :cond_15

    .line 334
    .line 335
    iget-object v7, v0, Lcom/google/android/exoplayer2/j;->a:[Lcom/google/android/exoplayer2/x;

    .line 336
    .line 337
    aget-object v7, v7, v4

    .line 338
    .line 339
    invoke-interface {v7}, Lcom/google/android/exoplayer2/x;->getStream()Ll/xwd0;

    .line 340
    .line 341
    .line 342
    move-result-object v7

    .line 343
    iget-object v8, v3, Ll/eyx;->c:[Ll/xwd0;

    .line 344
    .line 345
    aget-object v8, v8, v4

    .line 346
    .line 347
    if-ne v7, v8, :cond_15

    .line 348
    .line 349
    iget-object v7, v0, Lcom/google/android/exoplayer2/j;->a:[Lcom/google/android/exoplayer2/x;

    .line 350
    .line 351
    aget-object v7, v7, v4

    .line 352
    .line 353
    invoke-interface {v7}, Lcom/google/android/exoplayer2/x;->w()V

    .line 354
    .line 355
    .line 356
    :cond_15
    add-int/lit8 v4, v4, 0x1

    .line 357
    .line 358
    goto :goto_a

    .line 359
    :cond_16
    iget-object v3, v0, Lcom/google/android/exoplayer2/j;->x:Ll/fe80;

    .line 360
    .line 361
    iget-boolean v4, v3, Ll/fe80;->g:Z

    .line 362
    .line 363
    if-nez v4, :cond_19

    .line 364
    .line 365
    iget-wide v3, v3, Ll/fe80;->q:J

    .line 366
    .line 367
    const-wide/32 v7, 0x7a120

    .line 368
    .line 369
    .line 370
    cmp-long v3, v3, v7

    .line 371
    .line 372
    if-gez v3, :cond_19

    .line 373
    .line 374
    invoke-virtual {v0}, Lcom/google/android/exoplayer2/j;->T()Z

    .line 375
    .line 376
    .line 377
    move-result v3

    .line 378
    if-eqz v3, :cond_19

    .line 379
    .line 380
    iget-wide v3, v0, Lcom/google/android/exoplayer2/j;->Q:J

    .line 381
    .line 382
    cmp-long v3, v3, v13

    .line 383
    .line 384
    iget-object v4, v0, Lcom/google/android/exoplayer2/j;->q:Ll/qa5;

    .line 385
    .line 386
    if-nez v3, :cond_17

    .line 387
    .line 388
    invoke-interface {v4}, Ll/qa5;->elapsedRealtime()J

    .line 389
    .line 390
    .line 391
    move-result-wide v3

    .line 392
    iput-wide v3, v0, Lcom/google/android/exoplayer2/j;->Q:J

    .line 393
    .line 394
    goto :goto_b

    .line 395
    :cond_17
    invoke-interface {v4}, Ll/qa5;->elapsedRealtime()J

    .line 396
    .line 397
    .line 398
    move-result-wide v3

    .line 399
    iget-wide v7, v0, Lcom/google/android/exoplayer2/j;->Q:J

    .line 400
    .line 401
    sub-long/2addr v3, v7

    .line 402
    const-wide/16 v7, 0xfa0

    .line 403
    .line 404
    cmp-long v3, v3, v7

    .line 405
    .line 406
    if-gez v3, :cond_18

    .line 407
    .line 408
    goto :goto_b

    .line 409
    :cond_18
    const-string v0, "Playback stuck buffering and not loading"

    .line 410
    .line 411
    invoke-static {v0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 412
    .line 413
    .line 414
    return-void

    .line 415
    :cond_19
    iput-wide v13, v0, Lcom/google/android/exoplayer2/j;->Q:J

    .line 416
    .line 417
    :goto_b
    invoke-virtual {v0}, Lcom/google/android/exoplayer2/j;->m1()Z

    .line 418
    .line 419
    .line 420
    move-result v3

    .line 421
    if-eqz v3, :cond_1a

    .line 422
    .line 423
    iget-object v3, v0, Lcom/google/android/exoplayer2/j;->x:Ll/fe80;

    .line 424
    .line 425
    iget v3, v3, Ll/fe80;->e:I

    .line 426
    .line 427
    if-ne v3, v5, :cond_1a

    .line 428
    .line 429
    const/4 v3, 0x1

    .line 430
    goto :goto_c

    .line 431
    :cond_1a
    move v3, v12

    .line 432
    :goto_c
    iget-boolean v4, v0, Lcom/google/android/exoplayer2/j;->I:Z

    .line 433
    .line 434
    if-eqz v4, :cond_1b

    .line 435
    .line 436
    iget-boolean v4, v0, Lcom/google/android/exoplayer2/j;->H:Z

    .line 437
    .line 438
    if-eqz v4, :cond_1b

    .line 439
    .line 440
    if-eqz v3, :cond_1b

    .line 441
    .line 442
    const/4 v15, 0x1

    .line 443
    goto :goto_d

    .line 444
    :cond_1b
    move v15, v12

    .line 445
    :goto_d
    iget-object v4, v0, Lcom/google/android/exoplayer2/j;->x:Ll/fe80;

    .line 446
    .line 447
    iget-boolean v7, v4, Ll/fe80;->o:Z

    .line 448
    .line 449
    if-eq v7, v15, :cond_1c

    .line 450
    .line 451
    invoke-virtual {v4, v15}, Ll/fe80;->i(Z)Ll/fe80;

    .line 452
    .line 453
    .line 454
    move-result-object v4

    .line 455
    iput-object v4, v0, Lcom/google/android/exoplayer2/j;->x:Ll/fe80;

    .line 456
    .line 457
    :cond_1c
    iput-boolean v12, v0, Lcom/google/android/exoplayer2/j;->H:Z

    .line 458
    .line 459
    if-nez v15, :cond_20

    .line 460
    .line 461
    iget-object v4, v0, Lcom/google/android/exoplayer2/j;->x:Ll/fe80;

    .line 462
    .line 463
    iget v4, v4, Ll/fe80;->e:I

    .line 464
    .line 465
    if-ne v4, v6, :cond_1d

    .line 466
    .line 467
    goto :goto_f

    .line 468
    :cond_1d
    if-nez v3, :cond_1e

    .line 469
    .line 470
    const/4 v11, 0x2

    .line 471
    if-ne v4, v11, :cond_1f

    .line 472
    .line 473
    :cond_1e
    const-wide/16 v3, 0xa

    .line 474
    .line 475
    goto :goto_e

    .line 476
    :cond_1f
    if-ne v4, v5, :cond_20

    .line 477
    .line 478
    iget v3, v0, Lcom/google/android/exoplayer2/j;->J:I

    .line 479
    .line 480
    if-eqz v3, :cond_20

    .line 481
    .line 482
    const-wide/16 v3, 0x3e8

    .line 483
    .line 484
    invoke-virtual {v0, v1, v2, v3, v4}, Lcom/google/android/exoplayer2/j;->E0(JJ)V

    .line 485
    .line 486
    .line 487
    goto :goto_f

    .line 488
    :goto_e
    invoke-virtual {v0, v1, v2, v3, v4}, Lcom/google/android/exoplayer2/j;->E0(JJ)V

    .line 489
    .line 490
    .line 491
    :cond_20
    :goto_f
    invoke-static {}, Ll/nej0;->c()V

    .line 492
    .line 493
    .line 494
    :cond_21
    :goto_10
    return-void
.end method

.method public r0(IILl/n8f0;)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/google/android/exoplayer2/j;->h:Ll/sxk;

    .line 2
    .line 3
    const/16 v0, 0x14

    .line 4
    .line 5
    invoke-interface {p0, v0, p1, p2, p3}, Ll/sxk;->f(IIILjava/lang/Object;)Ll/sxk$a;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-interface {p0}, Ll/sxk$a;->a()V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final r1(ZZ)V
    .locals 2

    .line 1
    const/4 v0, 0x1

    .line 2
    const/4 v1, 0x0

    .line 3
    if-nez p1, :cond_1

    .line 4
    .line 5
    iget-boolean p1, p0, Lcom/google/android/exoplayer2/j;->G:Z

    .line 6
    .line 7
    if-nez p1, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    move p1, v1

    .line 11
    goto :goto_1

    .line 12
    :cond_1
    :goto_0
    move p1, v0

    .line 13
    :goto_1
    invoke-virtual {p0, p1, v1, v0, v1}, Lcom/google/android/exoplayer2/j;->v0(ZZZZ)V

    .line 14
    .line 15
    .line 16
    iget-object p1, p0, Lcom/google/android/exoplayer2/j;->y:Lcom/google/android/exoplayer2/j$e;

    .line 17
    .line 18
    invoke-virtual {p1, p2}, Lcom/google/android/exoplayer2/j$e;->b(I)V

    .line 19
    .line 20
    .line 21
    iget-object p1, p0, Lcom/google/android/exoplayer2/j;->f:Ll/ltv;

    .line 22
    .line 23
    invoke-interface {p1}, Ll/ltv;->j()V

    .line 24
    .line 25
    .line 26
    invoke-virtual {p0, v0}, Lcom/google/android/exoplayer2/j;->j1(I)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public s(Lcom/google/android/exoplayer2/s;)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/google/android/exoplayer2/j;->h:Ll/sxk;

    .line 2
    .line 3
    const/16 v0, 0x10

    .line 4
    .line 5
    invoke-interface {p0, v0, p1}, Ll/sxk;->c(ILjava/lang/Object;)Ll/sxk$a;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-interface {p0}, Ll/sxk$a;->a()V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final s0()Z
    .locals 15
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer2/ExoPlaybackException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/google/android/exoplayer2/j;->s:Lcom/google/android/exoplayer2/p;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/google/android/exoplayer2/p;->s()Ll/eyx;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Ll/eyx;->o()Ll/dgj0;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    const/4 v2, 0x0

    .line 12
    move v3, v2

    .line 13
    move v4, v3

    .line 14
    :goto_0
    iget-object v5, p0, Lcom/google/android/exoplayer2/j;->a:[Lcom/google/android/exoplayer2/x;

    .line 15
    .line 16
    array-length v6, v5

    .line 17
    const/4 v7, 0x1

    .line 18
    if-ge v3, v6, :cond_5

    .line 19
    .line 20
    aget-object v8, v5, v3

    .line 21
    .line 22
    invoke-static {v8}, Lcom/google/android/exoplayer2/j;->U(Lcom/google/android/exoplayer2/x;)Z

    .line 23
    .line 24
    .line 25
    move-result v5

    .line 26
    if-nez v5, :cond_0

    .line 27
    .line 28
    goto :goto_2

    .line 29
    :cond_0
    invoke-interface {v8}, Lcom/google/android/exoplayer2/x;->getStream()Ll/xwd0;

    .line 30
    .line 31
    .line 32
    move-result-object v5

    .line 33
    iget-object v6, v0, Ll/eyx;->c:[Ll/xwd0;

    .line 34
    .line 35
    aget-object v6, v6, v3

    .line 36
    .line 37
    if-eq v5, v6, :cond_1

    .line 38
    .line 39
    move v5, v7

    .line 40
    goto :goto_1

    .line 41
    :cond_1
    move v5, v2

    .line 42
    :goto_1
    invoke-virtual {v1, v3}, Ll/dgj0;->c(I)Z

    .line 43
    .line 44
    .line 45
    move-result v6

    .line 46
    if-eqz v6, :cond_2

    .line 47
    .line 48
    if-nez v5, :cond_2

    .line 49
    .line 50
    goto :goto_2

    .line 51
    :cond_2
    invoke-interface {v8}, Lcom/google/android/exoplayer2/x;->g()Z

    .line 52
    .line 53
    .line 54
    move-result v5

    .line 55
    if-nez v5, :cond_3

    .line 56
    .line 57
    iget-object v5, v1, Ll/dgj0;->c:[Ll/u9f;

    .line 58
    .line 59
    aget-object v5, v5, v3

    .line 60
    .line 61
    invoke-static {v5}, Lcom/google/android/exoplayer2/j;->B(Ll/u9f;)[Lcom/google/android/exoplayer2/k;

    .line 62
    .line 63
    .line 64
    move-result-object v9

    .line 65
    iget-object v5, v0, Ll/eyx;->c:[Ll/xwd0;

    .line 66
    .line 67
    aget-object v10, v5, v3

    .line 68
    .line 69
    invoke-virtual {v0}, Ll/eyx;->m()J

    .line 70
    .line 71
    .line 72
    move-result-wide v11

    .line 73
    invoke-virtual {v0}, Ll/eyx;->l()J

    .line 74
    .line 75
    .line 76
    move-result-wide v13

    .line 77
    invoke-interface/range {v8 .. v14}, Lcom/google/android/exoplayer2/x;->o([Lcom/google/android/exoplayer2/k;Ll/xwd0;JJ)V

    .line 78
    .line 79
    .line 80
    goto :goto_2

    .line 81
    :cond_3
    invoke-interface {v8}, Lcom/google/android/exoplayer2/x;->c()Z

    .line 82
    .line 83
    .line 84
    move-result v5

    .line 85
    if-eqz v5, :cond_4

    .line 86
    .line 87
    invoke-virtual {p0, v8}, Lcom/google/android/exoplayer2/j;->q(Lcom/google/android/exoplayer2/x;)V

    .line 88
    .line 89
    .line 90
    goto :goto_2

    .line 91
    :cond_4
    move v4, v7

    .line 92
    :goto_2
    add-int/lit8 v3, v3, 0x1

    .line 93
    .line 94
    goto :goto_0

    .line 95
    :cond_5
    xor-int/lit8 p0, v4, 0x1

    .line 96
    .line 97
    return p0
.end method

.method public final s1()V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer2/ExoPlaybackException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/google/android/exoplayer2/j;->o:Lcom/google/android/exoplayer2/g;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/google/android/exoplayer2/g;->f()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/google/android/exoplayer2/j;->a:[Lcom/google/android/exoplayer2/x;

    .line 7
    .line 8
    array-length v1, v0

    .line 9
    const/4 v2, 0x0

    .line 10
    :goto_0
    if-ge v2, v1, :cond_1

    .line 11
    .line 12
    aget-object v3, v0, v2

    .line 13
    .line 14
    invoke-static {v3}, Lcom/google/android/exoplayer2/j;->U(Lcom/google/android/exoplayer2/x;)Z

    .line 15
    .line 16
    .line 17
    move-result v4

    .line 18
    if-eqz v4, :cond_0

    .line 19
    .line 20
    invoke-virtual {p0, v3}, Lcom/google/android/exoplayer2/j;->w(Lcom/google/android/exoplayer2/x;)V

    .line 21
    .line 22
    .line 23
    :cond_0
    add-int/lit8 v2, v2, 0x1

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_1
    return-void
.end method

.method public final t(IZ)V
    .locals 14
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer2/ExoPlaybackException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/google/android/exoplayer2/j;->a:[Lcom/google/android/exoplayer2/x;

    .line 2
    .line 3
    aget-object v1, v0, p1

    .line 4
    .line 5
    invoke-static {v1}, Lcom/google/android/exoplayer2/j;->U(Lcom/google/android/exoplayer2/x;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    goto/16 :goto_3

    .line 12
    .line 13
    :cond_0
    iget-object v0, p0, Lcom/google/android/exoplayer2/j;->s:Lcom/google/android/exoplayer2/p;

    .line 14
    .line 15
    invoke-virtual {v0}, Lcom/google/android/exoplayer2/p;->s()Ll/eyx;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    iget-object v2, p0, Lcom/google/android/exoplayer2/j;->s:Lcom/google/android/exoplayer2/p;

    .line 20
    .line 21
    invoke-virtual {v2}, Lcom/google/android/exoplayer2/p;->r()Ll/eyx;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    const/4 v3, 0x0

    .line 26
    const/4 v4, 0x1

    .line 27
    if-ne v0, v2, :cond_1

    .line 28
    .line 29
    move v8, v4

    .line 30
    goto :goto_0

    .line 31
    :cond_1
    move v8, v3

    .line 32
    :goto_0
    invoke-virtual {v0}, Ll/eyx;->o()Ll/dgj0;

    .line 33
    .line 34
    .line 35
    move-result-object v2

    .line 36
    iget-object v5, v2, Ll/dgj0;->b:[Ll/jzc0;

    .line 37
    .line 38
    aget-object v5, v5, p1

    .line 39
    .line 40
    iget-object v2, v2, Ll/dgj0;->c:[Ll/u9f;

    .line 41
    .line 42
    aget-object v2, v2, p1

    .line 43
    .line 44
    invoke-static {v2}, Lcom/google/android/exoplayer2/j;->B(Ll/u9f;)[Lcom/google/android/exoplayer2/k;

    .line 45
    .line 46
    .line 47
    move-result-object v2

    .line 48
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/j;->m1()Z

    .line 49
    .line 50
    .line 51
    move-result v6

    .line 52
    if-eqz v6, :cond_2

    .line 53
    .line 54
    iget-object v6, p0, Lcom/google/android/exoplayer2/j;->x:Ll/fe80;

    .line 55
    .line 56
    iget v6, v6, Ll/fe80;->e:I

    .line 57
    .line 58
    const/4 v7, 0x3

    .line 59
    if-ne v6, v7, :cond_2

    .line 60
    .line 61
    move v13, v4

    .line 62
    goto :goto_1

    .line 63
    :cond_2
    move v13, v3

    .line 64
    :goto_1
    if-nez p2, :cond_3

    .line 65
    .line 66
    if-eqz v13, :cond_3

    .line 67
    .line 68
    move v7, v4

    .line 69
    goto :goto_2

    .line 70
    :cond_3
    move v7, v3

    .line 71
    :goto_2
    iget v3, p0, Lcom/google/android/exoplayer2/j;->J:I

    .line 72
    .line 73
    add-int/2addr v3, v4

    .line 74
    iput v3, p0, Lcom/google/android/exoplayer2/j;->J:I

    .line 75
    .line 76
    iget-object v3, p0, Lcom/google/android/exoplayer2/j;->b:Ljava/util/Set;

    .line 77
    .line 78
    invoke-interface {v3, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 79
    .line 80
    .line 81
    iget-object v3, v0, Ll/eyx;->c:[Ll/xwd0;

    .line 82
    .line 83
    aget-object v4, v3, p1

    .line 84
    .line 85
    move-object v3, v2

    .line 86
    move-object v2, v5

    .line 87
    iget-wide v5, p0, Lcom/google/android/exoplayer2/j;->L:J

    .line 88
    .line 89
    invoke-virtual {v0}, Ll/eyx;->m()J

    .line 90
    .line 91
    .line 92
    move-result-wide v9

    .line 93
    invoke-virtual {v0}, Ll/eyx;->l()J

    .line 94
    .line 95
    .line 96
    move-result-wide v11

    .line 97
    invoke-interface/range {v1 .. v12}, Lcom/google/android/exoplayer2/x;->B(Ll/jzc0;[Lcom/google/android/exoplayer2/k;Ll/xwd0;JZZJJ)V

    .line 98
    .line 99
    .line 100
    new-instance v0, Lcom/google/android/exoplayer2/j$a;

    .line 101
    .line 102
    invoke-direct {v0, p0}, Lcom/google/android/exoplayer2/j$a;-><init>(Lcom/google/android/exoplayer2/j;)V

    .line 103
    .line 104
    .line 105
    const/16 v2, 0xb

    .line 106
    .line 107
    invoke-interface {v1, v2, v0}, Lcom/google/android/exoplayer2/u$b;->f(ILjava/lang/Object;)V

    .line 108
    .line 109
    .line 110
    iget-object p0, p0, Lcom/google/android/exoplayer2/j;->o:Lcom/google/android/exoplayer2/g;

    .line 111
    .line 112
    invoke-virtual {p0, v1}, Lcom/google/android/exoplayer2/g;->b(Lcom/google/android/exoplayer2/x;)V

    .line 113
    .line 114
    .line 115
    if-eqz v13, :cond_4

    .line 116
    .line 117
    invoke-interface {v1}, Lcom/google/android/exoplayer2/x;->start()V

    .line 118
    .line 119
    .line 120
    :cond_4
    :goto_3
    return-void
.end method

.method public final t0()V
    .locals 19
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer2/ExoPlaybackException;
        }
    .end annotation

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    iget-object v1, v0, Lcom/google/android/exoplayer2/j;->o:Lcom/google/android/exoplayer2/g;

    .line 4
    .line 5
    invoke-virtual {v1}, Lcom/google/android/exoplayer2/g;->getPlaybackParameters()Lcom/google/android/exoplayer2/s;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    iget v1, v1, Lcom/google/android/exoplayer2/s;->a:F

    .line 10
    .line 11
    iget-object v2, v0, Lcom/google/android/exoplayer2/j;->s:Lcom/google/android/exoplayer2/p;

    .line 12
    .line 13
    invoke-virtual {v2}, Lcom/google/android/exoplayer2/p;->r()Ll/eyx;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    iget-object v3, v0, Lcom/google/android/exoplayer2/j;->s:Lcom/google/android/exoplayer2/p;

    .line 18
    .line 19
    invoke-virtual {v3}, Lcom/google/android/exoplayer2/p;->s()Ll/eyx;

    .line 20
    .line 21
    .line 22
    move-result-object v3

    .line 23
    const/4 v10, 0x1

    .line 24
    move v4, v10

    .line 25
    :goto_0
    if-eqz v2, :cond_a

    .line 26
    .line 27
    iget-boolean v5, v2, Ll/eyx;->d:Z

    .line 28
    .line 29
    if-nez v5, :cond_0

    .line 30
    .line 31
    goto/16 :goto_5

    .line 32
    .line 33
    :cond_0
    iget-object v5, v0, Lcom/google/android/exoplayer2/j;->x:Ll/fe80;

    .line 34
    .line 35
    iget-object v5, v5, Ll/fe80;->a:Lcom/google/android/exoplayer2/c0;

    .line 36
    .line 37
    invoke-virtual {v2, v1, v5}, Ll/eyx;->v(FLcom/google/android/exoplayer2/c0;)Ll/dgj0;

    .line 38
    .line 39
    .line 40
    move-result-object v12

    .line 41
    invoke-virtual {v2}, Ll/eyx;->o()Ll/dgj0;

    .line 42
    .line 43
    .line 44
    move-result-object v5

    .line 45
    invoke-virtual {v12, v5}, Ll/dgj0;->a(Ll/dgj0;)Z

    .line 46
    .line 47
    .line 48
    move-result v5

    .line 49
    const/4 v6, 0x0

    .line 50
    if-nez v5, :cond_8

    .line 51
    .line 52
    iget-object v1, v0, Lcom/google/android/exoplayer2/j;->s:Lcom/google/android/exoplayer2/p;

    .line 53
    .line 54
    const/4 v3, 0x4

    .line 55
    if-eqz v4, :cond_6

    .line 56
    .line 57
    invoke-virtual {v1}, Lcom/google/android/exoplayer2/p;->r()Ll/eyx;

    .line 58
    .line 59
    .line 60
    move-result-object v11

    .line 61
    iget-object v1, v0, Lcom/google/android/exoplayer2/j;->s:Lcom/google/android/exoplayer2/p;

    .line 62
    .line 63
    invoke-virtual {v1, v11}, Lcom/google/android/exoplayer2/p;->C(Ll/eyx;)Z

    .line 64
    .line 65
    .line 66
    move-result v15

    .line 67
    iget-object v1, v0, Lcom/google/android/exoplayer2/j;->a:[Lcom/google/android/exoplayer2/x;

    .line 68
    .line 69
    array-length v1, v1

    .line 70
    new-array v1, v1, [Z

    .line 71
    .line 72
    iget-object v2, v0, Lcom/google/android/exoplayer2/j;->x:Ll/fe80;

    .line 73
    .line 74
    iget-wide v13, v2, Ll/fe80;->r:J

    .line 75
    .line 76
    move-object/from16 v16, v1

    .line 77
    .line 78
    invoke-virtual/range {v11 .. v16}, Ll/eyx;->b(Ll/dgj0;JZ[Z)J

    .line 79
    .line 80
    .line 81
    move-result-wide v1

    .line 82
    iget-object v4, v0, Lcom/google/android/exoplayer2/j;->x:Ll/fe80;

    .line 83
    .line 84
    iget v5, v4, Ll/fe80;->e:I

    .line 85
    .line 86
    if-eq v5, v3, :cond_1

    .line 87
    .line 88
    iget-wide v4, v4, Ll/fe80;->r:J

    .line 89
    .line 90
    cmp-long v4, v1, v4

    .line 91
    .line 92
    if-eqz v4, :cond_1

    .line 93
    .line 94
    move v8, v10

    .line 95
    goto :goto_1

    .line 96
    :cond_1
    move v8, v6

    .line 97
    :goto_1
    iget-object v4, v0, Lcom/google/android/exoplayer2/j;->x:Ll/fe80;

    .line 98
    .line 99
    move v5, v3

    .line 100
    move-wide v2, v1

    .line 101
    iget-object v1, v4, Ll/fe80;->b:Lcom/google/android/exoplayer2/source/i$b;

    .line 102
    .line 103
    iget-wide v12, v4, Ll/fe80;->c:J

    .line 104
    .line 105
    iget-wide v14, v4, Ll/fe80;->d:J

    .line 106
    .line 107
    const/4 v9, 0x5

    .line 108
    move-wide/from16 v17, v12

    .line 109
    .line 110
    move v13, v5

    .line 111
    move-wide/from16 v4, v17

    .line 112
    .line 113
    move v12, v6

    .line 114
    move-wide v6, v14

    .line 115
    invoke-virtual/range {v0 .. v9}, Lcom/google/android/exoplayer2/j;->P(Lcom/google/android/exoplayer2/source/i$b;JJJZI)Ll/fe80;

    .line 116
    .line 117
    .line 118
    move-result-object v1

    .line 119
    iput-object v1, v0, Lcom/google/android/exoplayer2/j;->x:Ll/fe80;

    .line 120
    .line 121
    if-eqz v8, :cond_2

    .line 122
    .line 123
    invoke-virtual {v0, v2, v3}, Lcom/google/android/exoplayer2/j;->x0(J)V

    .line 124
    .line 125
    .line 126
    :cond_2
    iget-object v1, v0, Lcom/google/android/exoplayer2/j;->a:[Lcom/google/android/exoplayer2/x;

    .line 127
    .line 128
    array-length v1, v1

    .line 129
    new-array v1, v1, [Z

    .line 130
    .line 131
    move v6, v12

    .line 132
    :goto_2
    iget-object v2, v0, Lcom/google/android/exoplayer2/j;->a:[Lcom/google/android/exoplayer2/x;

    .line 133
    .line 134
    array-length v3, v2

    .line 135
    if-ge v6, v3, :cond_5

    .line 136
    .line 137
    aget-object v2, v2, v6

    .line 138
    .line 139
    invoke-static {v2}, Lcom/google/android/exoplayer2/j;->U(Lcom/google/android/exoplayer2/x;)Z

    .line 140
    .line 141
    .line 142
    move-result v3

    .line 143
    aput-boolean v3, v1, v6

    .line 144
    .line 145
    iget-object v4, v11, Ll/eyx;->c:[Ll/xwd0;

    .line 146
    .line 147
    aget-object v4, v4, v6

    .line 148
    .line 149
    if-eqz v3, :cond_4

    .line 150
    .line 151
    invoke-interface {v2}, Lcom/google/android/exoplayer2/x;->getStream()Ll/xwd0;

    .line 152
    .line 153
    .line 154
    move-result-object v3

    .line 155
    if-eq v4, v3, :cond_3

    .line 156
    .line 157
    invoke-virtual {v0, v2}, Lcom/google/android/exoplayer2/j;->q(Lcom/google/android/exoplayer2/x;)V

    .line 158
    .line 159
    .line 160
    goto :goto_3

    .line 161
    :cond_3
    aget-boolean v3, v16, v6

    .line 162
    .line 163
    if-eqz v3, :cond_4

    .line 164
    .line 165
    iget-wide v3, v0, Lcom/google/android/exoplayer2/j;->L:J

    .line 166
    .line 167
    invoke-interface {v2, v3, v4}, Lcom/google/android/exoplayer2/x;->l(J)V

    .line 168
    .line 169
    .line 170
    :cond_4
    :goto_3
    add-int/lit8 v6, v6, 0x1

    .line 171
    .line 172
    goto :goto_2

    .line 173
    :cond_5
    invoke-virtual {v0, v1}, Lcom/google/android/exoplayer2/j;->v([Z)V

    .line 174
    .line 175
    .line 176
    goto :goto_4

    .line 177
    :cond_6
    move v13, v3

    .line 178
    move-object v3, v12

    .line 179
    move v12, v6

    .line 180
    invoke-virtual {v1, v2}, Lcom/google/android/exoplayer2/p;->C(Ll/eyx;)Z

    .line 181
    .line 182
    .line 183
    iget-boolean v1, v2, Ll/eyx;->d:Z

    .line 184
    .line 185
    if-eqz v1, :cond_7

    .line 186
    .line 187
    iget-object v1, v2, Ll/eyx;->f:Ll/gyx;

    .line 188
    .line 189
    iget-wide v4, v1, Ll/gyx;->b:J

    .line 190
    .line 191
    iget-wide v6, v0, Lcom/google/android/exoplayer2/j;->L:J

    .line 192
    .line 193
    invoke-virtual {v2, v6, v7}, Ll/eyx;->y(J)J

    .line 194
    .line 195
    .line 196
    move-result-wide v6

    .line 197
    invoke-static {v4, v5, v6, v7}, Ljava/lang/Math;->max(JJ)J

    .line 198
    .line 199
    .line 200
    move-result-wide v4

    .line 201
    invoke-virtual {v2, v3, v4, v5, v12}, Ll/eyx;->a(Ll/dgj0;JZ)J

    .line 202
    .line 203
    .line 204
    :cond_7
    :goto_4
    invoke-virtual {v0, v10}, Lcom/google/android/exoplayer2/j;->K(Z)V

    .line 205
    .line 206
    .line 207
    iget-object v1, v0, Lcom/google/android/exoplayer2/j;->x:Ll/fe80;

    .line 208
    .line 209
    iget v1, v1, Ll/fe80;->e:I

    .line 210
    .line 211
    if-eq v1, v13, :cond_a

    .line 212
    .line 213
    invoke-virtual {v0}, Lcom/google/android/exoplayer2/j;->X()V

    .line 214
    .line 215
    .line 216
    invoke-virtual {v0}, Lcom/google/android/exoplayer2/j;->w1()V

    .line 217
    .line 218
    .line 219
    iget-object v0, v0, Lcom/google/android/exoplayer2/j;->h:Ll/sxk;

    .line 220
    .line 221
    const/4 v1, 0x2

    .line 222
    invoke-interface {v0, v1}, Ll/sxk;->j(I)Z

    .line 223
    .line 224
    .line 225
    return-void

    .line 226
    :cond_8
    move v12, v6

    .line 227
    if-ne v2, v3, :cond_9

    .line 228
    .line 229
    move v4, v12

    .line 230
    :cond_9
    invoke-virtual {v2}, Ll/eyx;->j()Ll/eyx;

    .line 231
    .line 232
    .line 233
    move-result-object v2

    .line 234
    goto/16 :goto_0

    .line 235
    .line 236
    :cond_a
    :goto_5
    return-void
.end method

.method public final t1()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/google/android/exoplayer2/j;->s:Lcom/google/android/exoplayer2/p;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/google/android/exoplayer2/p;->l()Ll/eyx;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-boolean v1, p0, Lcom/google/android/exoplayer2/j;->D:Z

    .line 8
    .line 9
    if-nez v1, :cond_1

    .line 10
    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    iget-object v0, v0, Ll/eyx;->a:Lcom/google/android/exoplayer2/source/h;

    .line 14
    .line 15
    invoke-interface {v0}, Lcom/google/android/exoplayer2/source/h;->isLoading()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    const/4 v0, 0x0

    .line 23
    goto :goto_1

    .line 24
    :cond_1
    :goto_0
    const/4 v0, 0x1

    .line 25
    :goto_1
    iget-object v1, p0, Lcom/google/android/exoplayer2/j;->x:Ll/fe80;

    .line 26
    .line 27
    iget-boolean v2, v1, Ll/fe80;->g:Z

    .line 28
    .line 29
    if-eq v0, v2, :cond_2

    .line 30
    .line 31
    invoke-virtual {v1, v0}, Ll/fe80;->b(Z)Ll/fe80;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    iput-object v0, p0, Lcom/google/android/exoplayer2/j;->x:Ll/fe80;

    .line 36
    .line 37
    :cond_2
    return-void
.end method

.method public final u()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer2/ExoPlaybackException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/google/android/exoplayer2/j;->a:[Lcom/google/android/exoplayer2/x;

    .line 2
    .line 3
    array-length v0, v0

    .line 4
    new-array v0, v0, [Z

    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lcom/google/android/exoplayer2/j;->v([Z)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final u0()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer2/ExoPlaybackException;
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/j;->t0()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    invoke-virtual {p0, v0}, Lcom/google/android/exoplayer2/j;->G0(Z)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final u1(Lcom/google/android/exoplayer2/source/i$b;Ll/ffj0;Ll/dgj0;)V
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/google/android/exoplayer2/j;->f:Ll/ltv;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/google/android/exoplayer2/j;->x:Ll/fe80;

    .line 4
    .line 5
    iget-object v1, v1, Ll/fe80;->a:Lcom/google/android/exoplayer2/c0;

    .line 6
    .line 7
    iget-object v3, p0, Lcom/google/android/exoplayer2/j;->a:[Lcom/google/android/exoplayer2/x;

    .line 8
    .line 9
    iget-object v5, p3, Ll/dgj0;->c:[Ll/u9f;

    .line 10
    .line 11
    move-object v2, p1

    .line 12
    move-object v4, p2

    .line 13
    invoke-interface/range {v0 .. v5}, Ll/ltv;->f(Lcom/google/android/exoplayer2/c0;Ll/fyx;[Lcom/google/android/exoplayer2/x;Ll/ffj0;[Ll/u9f;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public final v([Z)V
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer2/ExoPlaybackException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/google/android/exoplayer2/j;->s:Lcom/google/android/exoplayer2/p;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/google/android/exoplayer2/p;->s()Ll/eyx;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Ll/eyx;->o()Ll/dgj0;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    const/4 v2, 0x0

    .line 12
    move v3, v2

    .line 13
    :goto_0
    iget-object v4, p0, Lcom/google/android/exoplayer2/j;->a:[Lcom/google/android/exoplayer2/x;

    .line 14
    .line 15
    array-length v4, v4

    .line 16
    if-ge v3, v4, :cond_1

    .line 17
    .line 18
    invoke-virtual {v1, v3}, Ll/dgj0;->c(I)Z

    .line 19
    .line 20
    .line 21
    move-result v4

    .line 22
    if-nez v4, :cond_0

    .line 23
    .line 24
    iget-object v4, p0, Lcom/google/android/exoplayer2/j;->b:Ljava/util/Set;

    .line 25
    .line 26
    iget-object v5, p0, Lcom/google/android/exoplayer2/j;->a:[Lcom/google/android/exoplayer2/x;

    .line 27
    .line 28
    aget-object v5, v5, v3

    .line 29
    .line 30
    invoke-interface {v4, v5}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    .line 31
    .line 32
    .line 33
    move-result v4

    .line 34
    if-eqz v4, :cond_0

    .line 35
    .line 36
    iget-object v4, p0, Lcom/google/android/exoplayer2/j;->a:[Lcom/google/android/exoplayer2/x;

    .line 37
    .line 38
    aget-object v4, v4, v3

    .line 39
    .line 40
    invoke-interface {v4}, Lcom/google/android/exoplayer2/x;->reset()V

    .line 41
    .line 42
    .line 43
    :cond_0
    add-int/lit8 v3, v3, 0x1

    .line 44
    .line 45
    goto :goto_0

    .line 46
    :cond_1
    :goto_1
    iget-object v3, p0, Lcom/google/android/exoplayer2/j;->a:[Lcom/google/android/exoplayer2/x;

    .line 47
    .line 48
    array-length v3, v3

    .line 49
    if-ge v2, v3, :cond_3

    .line 50
    .line 51
    invoke-virtual {v1, v2}, Ll/dgj0;->c(I)Z

    .line 52
    .line 53
    .line 54
    move-result v3

    .line 55
    if-eqz v3, :cond_2

    .line 56
    .line 57
    aget-boolean v3, p1, v2

    .line 58
    .line 59
    invoke-virtual {p0, v2, v3}, Lcom/google/android/exoplayer2/j;->t(IZ)V

    .line 60
    .line 61
    .line 62
    :cond_2
    add-int/lit8 v2, v2, 0x1

    .line 63
    .line 64
    goto :goto_1

    .line 65
    :cond_3
    const/4 p0, 0x1

    .line 66
    iput-boolean p0, v0, Ll/eyx;->g:Z

    .line 67
    .line 68
    return-void
.end method

.method public final v0(ZZZZ)V
    .locals 31

    .line 1
    move-object/from16 v1, p0

    .line 2
    .line 3
    iget-object v0, v1, Lcom/google/android/exoplayer2/j;->h:Ll/sxk;

    .line 4
    .line 5
    const/4 v2, 0x2

    .line 6
    invoke-interface {v0, v2}, Ll/sxk;->l(I)V

    .line 7
    .line 8
    .line 9
    const/4 v2, 0x0

    .line 10
    iput-object v2, v1, Lcom/google/android/exoplayer2/j;->O:Lcom/google/android/exoplayer2/ExoPlaybackException;

    .line 11
    .line 12
    const/4 v3, 0x0

    .line 13
    iput-boolean v3, v1, Lcom/google/android/exoplayer2/j;->C:Z

    .line 14
    .line 15
    iget-object v0, v1, Lcom/google/android/exoplayer2/j;->o:Lcom/google/android/exoplayer2/g;

    .line 16
    .line 17
    invoke-virtual {v0}, Lcom/google/android/exoplayer2/g;->f()V

    .line 18
    .line 19
    .line 20
    const-wide v4, 0xe8d4a51000L

    .line 21
    .line 22
    .line 23
    .line 24
    .line 25
    iput-wide v4, v1, Lcom/google/android/exoplayer2/j;->L:J

    .line 26
    .line 27
    iget-object v4, v1, Lcom/google/android/exoplayer2/j;->a:[Lcom/google/android/exoplayer2/x;

    .line 28
    .line 29
    array-length v5, v4

    .line 30
    move v6, v3

    .line 31
    :goto_0
    const-string v7, "ExoPlayerImplInternal"

    .line 32
    .line 33
    if-ge v6, v5, :cond_0

    .line 34
    .line 35
    aget-object v0, v4, v6

    .line 36
    .line 37
    :try_start_0
    invoke-virtual {v1, v0}, Lcom/google/android/exoplayer2/j;->q(Lcom/google/android/exoplayer2/x;)V
    :try_end_0
    .catch Lcom/google/android/exoplayer2/ExoPlaybackException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    .line 38
    .line 39
    .line 40
    goto :goto_2

    .line 41
    :catch_0
    move-exception v0

    .line 42
    goto :goto_1

    .line 43
    :catch_1
    move-exception v0

    .line 44
    :goto_1
    const-string v8, "Disable failed."

    .line 45
    .line 46
    invoke-static {v7, v8, v0}, Ll/kyv;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 47
    .line 48
    .line 49
    :goto_2
    add-int/lit8 v6, v6, 0x1

    .line 50
    .line 51
    goto :goto_0

    .line 52
    :cond_0
    if-eqz p1, :cond_2

    .line 53
    .line 54
    iget-object v4, v1, Lcom/google/android/exoplayer2/j;->a:[Lcom/google/android/exoplayer2/x;

    .line 55
    .line 56
    array-length v5, v4

    .line 57
    move v6, v3

    .line 58
    :goto_3
    if-ge v6, v5, :cond_2

    .line 59
    .line 60
    aget-object v0, v4, v6

    .line 61
    .line 62
    iget-object v8, v1, Lcom/google/android/exoplayer2/j;->b:Ljava/util/Set;

    .line 63
    .line 64
    invoke-interface {v8, v0}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    .line 65
    .line 66
    .line 67
    move-result v8

    .line 68
    if-eqz v8, :cond_1

    .line 69
    .line 70
    :try_start_1
    invoke-interface {v0}, Lcom/google/android/exoplayer2/x;->reset()V
    :try_end_1
    .catch Ljava/lang/RuntimeException; {:try_start_1 .. :try_end_1} :catch_2

    .line 71
    .line 72
    .line 73
    goto :goto_4

    .line 74
    :catch_2
    move-exception v0

    .line 75
    const-string v8, "Reset failed."

    .line 76
    .line 77
    invoke-static {v7, v8, v0}, Ll/kyv;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 78
    .line 79
    .line 80
    :cond_1
    :goto_4
    add-int/lit8 v6, v6, 0x1

    .line 81
    .line 82
    goto :goto_3

    .line 83
    :cond_2
    iput v3, v1, Lcom/google/android/exoplayer2/j;->J:I

    .line 84
    .line 85
    iget-object v0, v1, Lcom/google/android/exoplayer2/j;->x:Ll/fe80;

    .line 86
    .line 87
    iget-object v4, v0, Ll/fe80;->b:Lcom/google/android/exoplayer2/source/i$b;

    .line 88
    .line 89
    iget-wide v5, v0, Ll/fe80;->r:J

    .line 90
    .line 91
    iget-object v0, v1, Lcom/google/android/exoplayer2/j;->x:Ll/fe80;

    .line 92
    .line 93
    iget-object v0, v0, Ll/fe80;->b:Lcom/google/android/exoplayer2/source/i$b;

    .line 94
    .line 95
    invoke-virtual {v0}, Ll/fyx;->b()Z

    .line 96
    .line 97
    .line 98
    move-result v0

    .line 99
    if-nez v0, :cond_4

    .line 100
    .line 101
    iget-object v0, v1, Lcom/google/android/exoplayer2/j;->x:Ll/fe80;

    .line 102
    .line 103
    iget-object v7, v1, Lcom/google/android/exoplayer2/j;->l:Lcom/google/android/exoplayer2/c0$b;

    .line 104
    .line 105
    invoke-static {v0, v7}, Lcom/google/android/exoplayer2/j;->W(Ll/fe80;Lcom/google/android/exoplayer2/c0$b;)Z

    .line 106
    .line 107
    .line 108
    move-result v0

    .line 109
    if-eqz v0, :cond_3

    .line 110
    .line 111
    goto :goto_5

    .line 112
    :cond_3
    iget-object v0, v1, Lcom/google/android/exoplayer2/j;->x:Ll/fe80;

    .line 113
    .line 114
    iget-wide v7, v0, Ll/fe80;->r:J

    .line 115
    .line 116
    goto :goto_6

    .line 117
    :cond_4
    :goto_5
    iget-object v0, v1, Lcom/google/android/exoplayer2/j;->x:Ll/fe80;

    .line 118
    .line 119
    iget-wide v7, v0, Ll/fe80;->c:J

    .line 120
    .line 121
    :goto_6
    if-eqz p2, :cond_5

    .line 122
    .line 123
    iput-object v2, v1, Lcom/google/android/exoplayer2/j;->K:Lcom/google/android/exoplayer2/j$h;

    .line 124
    .line 125
    iget-object v0, v1, Lcom/google/android/exoplayer2/j;->x:Ll/fe80;

    .line 126
    .line 127
    iget-object v0, v0, Ll/fe80;->a:Lcom/google/android/exoplayer2/c0;

    .line 128
    .line 129
    invoke-virtual {v1, v0}, Lcom/google/android/exoplayer2/j;->E(Lcom/google/android/exoplayer2/c0;)Landroid/util/Pair;

    .line 130
    .line 131
    .line 132
    move-result-object v0

    .line 133
    iget-object v4, v0, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 134
    .line 135
    check-cast v4, Lcom/google/android/exoplayer2/source/i$b;

    .line 136
    .line 137
    iget-object v0, v0, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 138
    .line 139
    check-cast v0, Ljava/lang/Long;

    .line 140
    .line 141
    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    .line 142
    .line 143
    .line 144
    move-result-wide v5

    .line 145
    iget-object v0, v1, Lcom/google/android/exoplayer2/j;->x:Ll/fe80;

    .line 146
    .line 147
    iget-object v0, v0, Ll/fe80;->b:Lcom/google/android/exoplayer2/source/i$b;

    .line 148
    .line 149
    invoke-virtual {v4, v0}, Ll/fyx;->equals(Ljava/lang/Object;)Z

    .line 150
    .line 151
    .line 152
    move-result v0

    .line 153
    const-wide v7, -0x7fffffffffffffffL    # -4.9E-324

    .line 154
    .line 155
    .line 156
    .line 157
    .line 158
    if-nez v0, :cond_5

    .line 159
    .line 160
    const/4 v0, 0x1

    .line 161
    :goto_7
    move-wide v10, v5

    .line 162
    move-wide v8, v7

    .line 163
    goto :goto_8

    .line 164
    :cond_5
    move v0, v3

    .line 165
    goto :goto_7

    .line 166
    :goto_8
    iget-object v5, v1, Lcom/google/android/exoplayer2/j;->s:Lcom/google/android/exoplayer2/p;

    .line 167
    .line 168
    invoke-virtual {v5}, Lcom/google/android/exoplayer2/p;->f()V

    .line 169
    .line 170
    .line 171
    iput-boolean v3, v1, Lcom/google/android/exoplayer2/j;->D:Z

    .line 172
    .line 173
    iget-object v3, v1, Lcom/google/android/exoplayer2/j;->x:Ll/fe80;

    .line 174
    .line 175
    iget-object v3, v3, Ll/fe80;->a:Lcom/google/android/exoplayer2/c0;

    .line 176
    .line 177
    if-eqz p3, :cond_6

    .line 178
    .line 179
    instance-of v5, v3, Lcom/google/android/exoplayer2/v;

    .line 180
    .line 181
    if-eqz v5, :cond_6

    .line 182
    .line 183
    check-cast v3, Lcom/google/android/exoplayer2/v;

    .line 184
    .line 185
    iget-object v5, v1, Lcom/google/android/exoplayer2/j;->t:Lcom/google/android/exoplayer2/q;

    .line 186
    .line 187
    invoke-virtual {v5}, Lcom/google/android/exoplayer2/q;->q()Ll/n8f0;

    .line 188
    .line 189
    .line 190
    move-result-object v5

    .line 191
    invoke-virtual {v3, v5}, Lcom/google/android/exoplayer2/v;->I(Ll/n8f0;)Lcom/google/android/exoplayer2/v;

    .line 192
    .line 193
    .line 194
    move-result-object v3

    .line 195
    iget v5, v4, Ll/fyx;->b:I

    .line 196
    .line 197
    const/4 v6, -0x1

    .line 198
    if-eq v5, v6, :cond_6

    .line 199
    .line 200
    iget-object v5, v4, Ll/fyx;->a:Ljava/lang/Object;

    .line 201
    .line 202
    iget-object v6, v1, Lcom/google/android/exoplayer2/j;->l:Lcom/google/android/exoplayer2/c0$b;

    .line 203
    .line 204
    invoke-virtual {v3, v5, v6}, Lcom/google/android/exoplayer2/c0;->l(Ljava/lang/Object;Lcom/google/android/exoplayer2/c0$b;)Lcom/google/android/exoplayer2/c0$b;

    .line 205
    .line 206
    .line 207
    iget-object v5, v1, Lcom/google/android/exoplayer2/j;->l:Lcom/google/android/exoplayer2/c0$b;

    .line 208
    .line 209
    iget v5, v5, Lcom/google/android/exoplayer2/c0$b;->c:I

    .line 210
    .line 211
    iget-object v6, v1, Lcom/google/android/exoplayer2/j;->k:Lcom/google/android/exoplayer2/c0$d;

    .line 212
    .line 213
    invoke-virtual {v3, v5, v6}, Lcom/google/android/exoplayer2/c0;->r(ILcom/google/android/exoplayer2/c0$d;)Lcom/google/android/exoplayer2/c0$d;

    .line 214
    .line 215
    .line 216
    move-result-object v5

    .line 217
    invoke-virtual {v5}, Lcom/google/android/exoplayer2/c0$d;->h()Z

    .line 218
    .line 219
    .line 220
    move-result v5

    .line 221
    if-eqz v5, :cond_6

    .line 222
    .line 223
    new-instance v5, Lcom/google/android/exoplayer2/source/i$b;

    .line 224
    .line 225
    iget-object v6, v4, Ll/fyx;->a:Ljava/lang/Object;

    .line 226
    .line 227
    iget-wide v12, v4, Ll/fyx;->d:J

    .line 228
    .line 229
    invoke-direct {v5, v6, v12, v13}, Lcom/google/android/exoplayer2/source/i$b;-><init>(Ljava/lang/Object;J)V

    .line 230
    .line 231
    .line 232
    move-object v6, v3

    .line 233
    move-object v7, v5

    .line 234
    goto :goto_9

    .line 235
    :cond_6
    move-object v6, v3

    .line 236
    move-object v7, v4

    .line 237
    :goto_9
    new-instance v5, Ll/fe80;

    .line 238
    .line 239
    iget-object v3, v1, Lcom/google/android/exoplayer2/j;->x:Ll/fe80;

    .line 240
    .line 241
    iget v12, v3, Ll/fe80;->e:I

    .line 242
    .line 243
    if-eqz p4, :cond_7

    .line 244
    .line 245
    :goto_a
    move-object v13, v2

    .line 246
    goto :goto_b

    .line 247
    :cond_7
    iget-object v2, v3, Ll/fe80;->f:Lcom/google/android/exoplayer2/ExoPlaybackException;

    .line 248
    .line 249
    goto :goto_a

    .line 250
    :goto_b
    if-eqz v0, :cond_8

    .line 251
    .line 252
    sget-object v2, Ll/ffj0;->d:Ll/ffj0;

    .line 253
    .line 254
    :goto_c
    move-object v15, v2

    .line 255
    goto :goto_d

    .line 256
    :cond_8
    iget-object v2, v3, Ll/fe80;->h:Ll/ffj0;

    .line 257
    .line 258
    goto :goto_c

    .line 259
    :goto_d
    if-eqz v0, :cond_9

    .line 260
    .line 261
    iget-object v2, v1, Lcom/google/android/exoplayer2/j;->e:Ll/dgj0;

    .line 262
    .line 263
    :goto_e
    move-object/from16 v16, v2

    .line 264
    .line 265
    goto :goto_f

    .line 266
    :cond_9
    iget-object v2, v3, Ll/fe80;->i:Ll/dgj0;

    .line 267
    .line 268
    goto :goto_e

    .line 269
    :goto_f
    if-eqz v0, :cond_a

    .line 270
    .line 271
    invoke-static {}, Lcom/google/common/collect/ImmutableList;->of()Lcom/google/common/collect/ImmutableList;

    .line 272
    .line 273
    .line 274
    move-result-object v0

    .line 275
    :goto_10
    move-object/from16 v17, v0

    .line 276
    .line 277
    goto :goto_11

    .line 278
    :cond_a
    iget-object v0, v3, Ll/fe80;->j:Ljava/util/List;

    .line 279
    .line 280
    goto :goto_10

    .line 281
    :goto_11
    iget-object v0, v1, Lcom/google/android/exoplayer2/j;->x:Ll/fe80;

    .line 282
    .line 283
    iget-boolean v2, v0, Ll/fe80;->l:Z

    .line 284
    .line 285
    iget v3, v0, Ll/fe80;->m:I

    .line 286
    .line 287
    iget-object v0, v0, Ll/fe80;->n:Lcom/google/android/exoplayer2/s;

    .line 288
    .line 289
    const-wide/16 v28, 0x0

    .line 290
    .line 291
    const/16 v30, 0x0

    .line 292
    .line 293
    const/4 v14, 0x0

    .line 294
    const-wide/16 v24, 0x0

    .line 295
    .line 296
    move-object/from16 v18, v7

    .line 297
    .line 298
    move-wide/from16 v22, v10

    .line 299
    .line 300
    move-wide/from16 v26, v10

    .line 301
    .line 302
    move-object/from16 v21, v0

    .line 303
    .line 304
    move/from16 v19, v2

    .line 305
    .line 306
    move/from16 v20, v3

    .line 307
    .line 308
    invoke-direct/range {v5 .. v30}, Ll/fe80;-><init>(Lcom/google/android/exoplayer2/c0;Lcom/google/android/exoplayer2/source/i$b;JJILcom/google/android/exoplayer2/ExoPlaybackException;ZLl/ffj0;Ll/dgj0;Ljava/util/List;Lcom/google/android/exoplayer2/source/i$b;ZILcom/google/android/exoplayer2/s;JJJJZ)V

    .line 309
    .line 310
    .line 311
    iput-object v5, v1, Lcom/google/android/exoplayer2/j;->x:Ll/fe80;

    .line 312
    .line 313
    if-eqz p3, :cond_b

    .line 314
    .line 315
    iget-object v0, v1, Lcom/google/android/exoplayer2/j;->t:Lcom/google/android/exoplayer2/q;

    .line 316
    .line 317
    invoke-virtual {v0}, Lcom/google/android/exoplayer2/q;->y()V

    .line 318
    .line 319
    .line 320
    :cond_b
    return-void
.end method

.method public final v1()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer2/ExoPlaybackException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/google/android/exoplayer2/j;->x:Ll/fe80;

    .line 2
    .line 3
    iget-object v0, v0, Ll/fe80;->a:Lcom/google/android/exoplayer2/c0;

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/google/android/exoplayer2/c0;->u()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_1

    .line 10
    .line 11
    iget-object v0, p0, Lcom/google/android/exoplayer2/j;->t:Lcom/google/android/exoplayer2/q;

    .line 12
    .line 13
    invoke-virtual {v0}, Lcom/google/android/exoplayer2/q;->t()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-nez v0, :cond_0

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/j;->a0()V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/j;->c0()V

    .line 24
    .line 25
    .line 26
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/j;->d0()V

    .line 27
    .line 28
    .line 29
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/j;->b0()V

    .line 30
    .line 31
    .line 32
    :cond_1
    :goto_0
    return-void
.end method

.method public final w(Lcom/google/android/exoplayer2/x;)V
    .locals 1

    .line 1
    invoke-interface {p1}, Lcom/google/android/exoplayer2/x;->getState()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    const/4 v0, 0x2

    .line 6
    if-ne p0, v0, :cond_0

    .line 7
    .line 8
    invoke-interface {p1}, Lcom/google/android/exoplayer2/x;->stop()V

    .line 9
    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method public final w0()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/google/android/exoplayer2/j;->s:Lcom/google/android/exoplayer2/p;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/google/android/exoplayer2/p;->r()Ll/eyx;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, v0, Ll/eyx;->f:Ll/gyx;

    .line 10
    .line 11
    iget-boolean v0, v0, Ll/gyx;->h:Z

    .line 12
    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    iget-boolean v0, p0, Lcom/google/android/exoplayer2/j;->A:Z

    .line 16
    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    const/4 v0, 0x1

    .line 20
    goto :goto_0

    .line 21
    :cond_0
    const/4 v0, 0x0

    .line 22
    :goto_0
    iput-boolean v0, p0, Lcom/google/android/exoplayer2/j;->B:Z

    .line 23
    .line 24
    return-void
.end method

.method public final w1()V
    .locals 13
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer2/ExoPlaybackException;
        }
    .end annotation

    .line 1
    iget-object v1, p0, Lcom/google/android/exoplayer2/j;->s:Lcom/google/android/exoplayer2/p;

    .line 2
    .line 3
    invoke-virtual {v1}, Lcom/google/android/exoplayer2/p;->r()Ll/eyx;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    if-nez v1, :cond_0

    .line 8
    .line 9
    goto/16 :goto_3

    .line 10
    .line 11
    :cond_0
    iget-boolean v2, v1, Ll/eyx;->d:Z

    .line 12
    .line 13
    const-wide v3, -0x7fffffffffffffffL    # -4.9E-324

    .line 14
    .line 15
    .line 16
    .line 17
    .line 18
    if-eqz v2, :cond_1

    .line 19
    .line 20
    iget-object v2, v1, Ll/eyx;->a:Lcom/google/android/exoplayer2/source/h;

    .line 21
    .line 22
    invoke-interface {v2}, Lcom/google/android/exoplayer2/source/h;->i()J

    .line 23
    .line 24
    .line 25
    move-result-wide v5

    .line 26
    goto :goto_0

    .line 27
    :cond_1
    move-wide v5, v3

    .line 28
    :goto_0
    cmp-long v2, v5, v3

    .line 29
    .line 30
    const/4 v10, 0x0

    .line 31
    if-eqz v2, :cond_2

    .line 32
    .line 33
    invoke-virtual {p0, v5, v6}, Lcom/google/android/exoplayer2/j;->x0(J)V

    .line 34
    .line 35
    .line 36
    iget-object v1, p0, Lcom/google/android/exoplayer2/j;->x:Ll/fe80;

    .line 37
    .line 38
    iget-wide v1, v1, Ll/fe80;->r:J

    .line 39
    .line 40
    cmp-long v1, v5, v1

    .line 41
    .line 42
    if-eqz v1, :cond_4

    .line 43
    .line 44
    iget-object v1, p0, Lcom/google/android/exoplayer2/j;->x:Ll/fe80;

    .line 45
    .line 46
    iget-object v2, v1, Ll/fe80;->b:Lcom/google/android/exoplayer2/source/i$b;

    .line 47
    .line 48
    iget-wide v3, v1, Ll/fe80;->c:J

    .line 49
    .line 50
    const/4 v8, 0x1

    .line 51
    const/4 v9, 0x5

    .line 52
    move-object v1, v2

    .line 53
    move-wide v11, v5

    .line 54
    move-wide v4, v3

    .line 55
    move-wide v2, v11

    .line 56
    move-wide v6, v2

    .line 57
    move-object v0, p0

    .line 58
    invoke-virtual/range {v0 .. v9}, Lcom/google/android/exoplayer2/j;->P(Lcom/google/android/exoplayer2/source/i$b;JJJZI)Ll/fe80;

    .line 59
    .line 60
    .line 61
    move-result-object v1

    .line 62
    iput-object v1, p0, Lcom/google/android/exoplayer2/j;->x:Ll/fe80;

    .line 63
    .line 64
    goto :goto_2

    .line 65
    :cond_2
    iget-object v2, p0, Lcom/google/android/exoplayer2/j;->o:Lcom/google/android/exoplayer2/g;

    .line 66
    .line 67
    iget-object v3, p0, Lcom/google/android/exoplayer2/j;->s:Lcom/google/android/exoplayer2/p;

    .line 68
    .line 69
    invoke-virtual {v3}, Lcom/google/android/exoplayer2/p;->s()Ll/eyx;

    .line 70
    .line 71
    .line 72
    move-result-object v3

    .line 73
    if-eq v1, v3, :cond_3

    .line 74
    .line 75
    const/4 v3, 0x1

    .line 76
    goto :goto_1

    .line 77
    :cond_3
    move v3, v10

    .line 78
    :goto_1
    invoke-virtual {v2, v3}, Lcom/google/android/exoplayer2/g;->g(Z)J

    .line 79
    .line 80
    .line 81
    move-result-wide v2

    .line 82
    iput-wide v2, p0, Lcom/google/android/exoplayer2/j;->L:J

    .line 83
    .line 84
    invoke-virtual {v1, v2, v3}, Ll/eyx;->y(J)J

    .line 85
    .line 86
    .line 87
    move-result-wide v1

    .line 88
    iget-object v3, p0, Lcom/google/android/exoplayer2/j;->x:Ll/fe80;

    .line 89
    .line 90
    iget-wide v3, v3, Ll/fe80;->r:J

    .line 91
    .line 92
    invoke-virtual {p0, v3, v4, v1, v2}, Lcom/google/android/exoplayer2/j;->Z(JJ)V

    .line 93
    .line 94
    .line 95
    iget-object v3, p0, Lcom/google/android/exoplayer2/j;->x:Ll/fe80;

    .line 96
    .line 97
    invoke-virtual {v3, v1, v2}, Ll/fe80;->o(J)V

    .line 98
    .line 99
    .line 100
    :cond_4
    :goto_2
    iget-object v1, p0, Lcom/google/android/exoplayer2/j;->s:Lcom/google/android/exoplayer2/p;

    .line 101
    .line 102
    invoke-virtual {v1}, Lcom/google/android/exoplayer2/p;->l()Ll/eyx;

    .line 103
    .line 104
    .line 105
    move-result-object v1

    .line 106
    iget-object v2, p0, Lcom/google/android/exoplayer2/j;->x:Ll/fe80;

    .line 107
    .line 108
    invoke-virtual {v1}, Ll/eyx;->i()J

    .line 109
    .line 110
    .line 111
    move-result-wide v3

    .line 112
    iput-wide v3, v2, Ll/fe80;->p:J

    .line 113
    .line 114
    iget-object v1, p0, Lcom/google/android/exoplayer2/j;->x:Ll/fe80;

    .line 115
    .line 116
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/j;->G()J

    .line 117
    .line 118
    .line 119
    move-result-wide v2

    .line 120
    iput-wide v2, v1, Ll/fe80;->q:J

    .line 121
    .line 122
    iget-object v1, p0, Lcom/google/android/exoplayer2/j;->x:Ll/fe80;

    .line 123
    .line 124
    iget-boolean v2, v1, Ll/fe80;->l:Z

    .line 125
    .line 126
    if-eqz v2, :cond_5

    .line 127
    .line 128
    iget v2, v1, Ll/fe80;->e:I

    .line 129
    .line 130
    const/4 v3, 0x3

    .line 131
    if-ne v2, v3, :cond_5

    .line 132
    .line 133
    iget-object v2, v1, Ll/fe80;->a:Lcom/google/android/exoplayer2/c0;

    .line 134
    .line 135
    iget-object v1, v1, Ll/fe80;->b:Lcom/google/android/exoplayer2/source/i$b;

    .line 136
    .line 137
    invoke-virtual {p0, v2, v1}, Lcom/google/android/exoplayer2/j;->o1(Lcom/google/android/exoplayer2/c0;Lcom/google/android/exoplayer2/source/i$b;)Z

    .line 138
    .line 139
    .line 140
    move-result v1

    .line 141
    if-eqz v1, :cond_5

    .line 142
    .line 143
    iget-object v1, p0, Lcom/google/android/exoplayer2/j;->x:Ll/fe80;

    .line 144
    .line 145
    iget-object v1, v1, Ll/fe80;->n:Lcom/google/android/exoplayer2/s;

    .line 146
    .line 147
    iget v1, v1, Lcom/google/android/exoplayer2/s;->a:F

    .line 148
    .line 149
    const/high16 v2, 0x3f800000    # 1.0f

    .line 150
    .line 151
    cmpl-float v1, v1, v2

    .line 152
    .line 153
    if-nez v1, :cond_5

    .line 154
    .line 155
    iget-object v1, p0, Lcom/google/android/exoplayer2/j;->u:Lcom/google/android/exoplayer2/m;

    .line 156
    .line 157
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/j;->A()J

    .line 158
    .line 159
    .line 160
    move-result-wide v2

    .line 161
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/j;->G()J

    .line 162
    .line 163
    .line 164
    move-result-wide v4

    .line 165
    invoke-interface {v1, v2, v3, v4, v5}, Lcom/google/android/exoplayer2/m;->b(JJ)F

    .line 166
    .line 167
    .line 168
    move-result v1

    .line 169
    iget-object v2, p0, Lcom/google/android/exoplayer2/j;->o:Lcom/google/android/exoplayer2/g;

    .line 170
    .line 171
    invoke-virtual {v2}, Lcom/google/android/exoplayer2/g;->getPlaybackParameters()Lcom/google/android/exoplayer2/s;

    .line 172
    .line 173
    .line 174
    move-result-object v2

    .line 175
    iget v2, v2, Lcom/google/android/exoplayer2/s;->a:F

    .line 176
    .line 177
    cmpl-float v2, v2, v1

    .line 178
    .line 179
    if-eqz v2, :cond_5

    .line 180
    .line 181
    iget-object v2, p0, Lcom/google/android/exoplayer2/j;->x:Ll/fe80;

    .line 182
    .line 183
    iget-object v2, v2, Ll/fe80;->n:Lcom/google/android/exoplayer2/s;

    .line 184
    .line 185
    invoke-virtual {v2, v1}, Lcom/google/android/exoplayer2/s;->c(F)Lcom/google/android/exoplayer2/s;

    .line 186
    .line 187
    .line 188
    move-result-object v1

    .line 189
    invoke-virtual {p0, v1}, Lcom/google/android/exoplayer2/j;->R0(Lcom/google/android/exoplayer2/s;)V

    .line 190
    .line 191
    .line 192
    iget-object v1, p0, Lcom/google/android/exoplayer2/j;->x:Ll/fe80;

    .line 193
    .line 194
    iget-object v1, v1, Ll/fe80;->n:Lcom/google/android/exoplayer2/s;

    .line 195
    .line 196
    iget-object v2, p0, Lcom/google/android/exoplayer2/j;->o:Lcom/google/android/exoplayer2/g;

    .line 197
    .line 198
    invoke-virtual {v2}, Lcom/google/android/exoplayer2/g;->getPlaybackParameters()Lcom/google/android/exoplayer2/s;

    .line 199
    .line 200
    .line 201
    move-result-object v2

    .line 202
    iget v2, v2, Lcom/google/android/exoplayer2/s;->a:F

    .line 203
    .line 204
    invoke-virtual {p0, v1, v2, v10, v10}, Lcom/google/android/exoplayer2/j;->N(Lcom/google/android/exoplayer2/s;FZZ)V

    .line 205
    .line 206
    .line 207
    :cond_5
    :goto_3
    return-void
.end method

.method public x(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/google/android/exoplayer2/j;->P:J

    .line 2
    .line 3
    return-void
.end method

.method public final x0(J)V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer2/ExoPlaybackException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/google/android/exoplayer2/j;->s:Lcom/google/android/exoplayer2/p;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/google/android/exoplayer2/p;->r()Ll/eyx;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    const-wide v0, 0xe8d4a51000L

    .line 10
    .line 11
    .line 12
    .line 13
    .line 14
    add-long/2addr p1, v0

    .line 15
    goto :goto_0

    .line 16
    :cond_0
    invoke-virtual {v0, p1, p2}, Ll/eyx;->z(J)J

    .line 17
    .line 18
    .line 19
    move-result-wide p1

    .line 20
    :goto_0
    iput-wide p1, p0, Lcom/google/android/exoplayer2/j;->L:J

    .line 21
    .line 22
    iget-object v0, p0, Lcom/google/android/exoplayer2/j;->o:Lcom/google/android/exoplayer2/g;

    .line 23
    .line 24
    invoke-virtual {v0, p1, p2}, Lcom/google/android/exoplayer2/g;->c(J)V

    .line 25
    .line 26
    .line 27
    iget-object p1, p0, Lcom/google/android/exoplayer2/j;->a:[Lcom/google/android/exoplayer2/x;

    .line 28
    .line 29
    array-length p2, p1

    .line 30
    const/4 v0, 0x0

    .line 31
    :goto_1
    if-ge v0, p2, :cond_2

    .line 32
    .line 33
    aget-object v1, p1, v0

    .line 34
    .line 35
    invoke-static {v1}, Lcom/google/android/exoplayer2/j;->U(Lcom/google/android/exoplayer2/x;)Z

    .line 36
    .line 37
    .line 38
    move-result v2

    .line 39
    if-eqz v2, :cond_1

    .line 40
    .line 41
    iget-wide v2, p0, Lcom/google/android/exoplayer2/j;->L:J

    .line 42
    .line 43
    invoke-interface {v1, v2, v3}, Lcom/google/android/exoplayer2/x;->l(J)V

    .line 44
    .line 45
    .line 46
    :cond_1
    add-int/lit8 v0, v0, 0x1

    .line 47
    .line 48
    goto :goto_1

    .line 49
    :cond_2
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/j;->h0()V

    .line 50
    .line 51
    .line 52
    return-void
.end method

.method public final x1(Lcom/google/android/exoplayer2/c0;Lcom/google/android/exoplayer2/source/i$b;Lcom/google/android/exoplayer2/c0;Lcom/google/android/exoplayer2/source/i$b;JZ)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer2/ExoPlaybackException;
        }
    .end annotation

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/google/android/exoplayer2/j;->o1(Lcom/google/android/exoplayer2/c0;Lcom/google/android/exoplayer2/source/i$b;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_1

    .line 6
    .line 7
    invoke-virtual {p2}, Ll/fyx;->b()Z

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    if-eqz p1, :cond_0

    .line 12
    .line 13
    sget-object p1, Lcom/google/android/exoplayer2/s;->d:Lcom/google/android/exoplayer2/s;

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    iget-object p1, p0, Lcom/google/android/exoplayer2/j;->x:Ll/fe80;

    .line 17
    .line 18
    iget-object p1, p1, Ll/fe80;->n:Lcom/google/android/exoplayer2/s;

    .line 19
    .line 20
    :goto_0
    iget-object p2, p0, Lcom/google/android/exoplayer2/j;->o:Lcom/google/android/exoplayer2/g;

    .line 21
    .line 22
    invoke-virtual {p2}, Lcom/google/android/exoplayer2/g;->getPlaybackParameters()Lcom/google/android/exoplayer2/s;

    .line 23
    .line 24
    .line 25
    move-result-object p2

    .line 26
    invoke-virtual {p2, p1}, Lcom/google/android/exoplayer2/s;->equals(Ljava/lang/Object;)Z

    .line 27
    .line 28
    .line 29
    move-result p2

    .line 30
    if-nez p2, :cond_4

    .line 31
    .line 32
    invoke-virtual {p0, p1}, Lcom/google/android/exoplayer2/j;->R0(Lcom/google/android/exoplayer2/s;)V

    .line 33
    .line 34
    .line 35
    iget-object p2, p0, Lcom/google/android/exoplayer2/j;->x:Ll/fe80;

    .line 36
    .line 37
    iget-object p2, p2, Ll/fe80;->n:Lcom/google/android/exoplayer2/s;

    .line 38
    .line 39
    iget p1, p1, Lcom/google/android/exoplayer2/s;->a:F

    .line 40
    .line 41
    const/4 p3, 0x0

    .line 42
    invoke-virtual {p0, p2, p1, p3, p3}, Lcom/google/android/exoplayer2/j;->N(Lcom/google/android/exoplayer2/s;FZZ)V

    .line 43
    .line 44
    .line 45
    return-void

    .line 46
    :cond_1
    iget-object v0, p2, Ll/fyx;->a:Ljava/lang/Object;

    .line 47
    .line 48
    iget-object v1, p0, Lcom/google/android/exoplayer2/j;->l:Lcom/google/android/exoplayer2/c0$b;

    .line 49
    .line 50
    invoke-virtual {p1, v0, v1}, Lcom/google/android/exoplayer2/c0;->l(Ljava/lang/Object;Lcom/google/android/exoplayer2/c0$b;)Lcom/google/android/exoplayer2/c0$b;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    iget v0, v0, Lcom/google/android/exoplayer2/c0$b;->c:I

    .line 55
    .line 56
    iget-object v1, p0, Lcom/google/android/exoplayer2/j;->k:Lcom/google/android/exoplayer2/c0$d;

    .line 57
    .line 58
    invoke-virtual {p1, v0, v1}, Lcom/google/android/exoplayer2/c0;->r(ILcom/google/android/exoplayer2/c0$d;)Lcom/google/android/exoplayer2/c0$d;

    .line 59
    .line 60
    .line 61
    iget-object v0, p0, Lcom/google/android/exoplayer2/j;->u:Lcom/google/android/exoplayer2/m;

    .line 62
    .line 63
    iget-object v1, p0, Lcom/google/android/exoplayer2/j;->k:Lcom/google/android/exoplayer2/c0$d;

    .line 64
    .line 65
    iget-object v1, v1, Lcom/google/android/exoplayer2/c0$d;->k:Lcom/google/android/exoplayer2/n$g;

    .line 66
    .line 67
    invoke-static {v1}, Ll/bmk0;->j(Ljava/lang/Object;)Ljava/lang/Object;

    .line 68
    .line 69
    .line 70
    move-result-object v1

    .line 71
    check-cast v1, Lcom/google/android/exoplayer2/n$g;

    .line 72
    .line 73
    invoke-interface {v0, v1}, Lcom/google/android/exoplayer2/m;->a(Lcom/google/android/exoplayer2/n$g;)V

    .line 74
    .line 75
    .line 76
    const-wide v0, -0x7fffffffffffffffL    # -4.9E-324

    .line 77
    .line 78
    .line 79
    .line 80
    .line 81
    cmp-long v2, p5, v0

    .line 82
    .line 83
    if-eqz v2, :cond_2

    .line 84
    .line 85
    iget-object p3, p0, Lcom/google/android/exoplayer2/j;->u:Lcom/google/android/exoplayer2/m;

    .line 86
    .line 87
    iget-object p2, p2, Ll/fyx;->a:Ljava/lang/Object;

    .line 88
    .line 89
    invoke-virtual {p0, p1, p2, p5, p6}, Lcom/google/android/exoplayer2/j;->C(Lcom/google/android/exoplayer2/c0;Ljava/lang/Object;J)J

    .line 90
    .line 91
    .line 92
    move-result-wide p0

    .line 93
    invoke-interface {p3, p0, p1}, Lcom/google/android/exoplayer2/m;->e(J)V

    .line 94
    .line 95
    .line 96
    return-void

    .line 97
    :cond_2
    iget-object p1, p0, Lcom/google/android/exoplayer2/j;->k:Lcom/google/android/exoplayer2/c0$d;

    .line 98
    .line 99
    iget-object p1, p1, Lcom/google/android/exoplayer2/c0$d;->a:Ljava/lang/Object;

    .line 100
    .line 101
    invoke-virtual {p3}, Lcom/google/android/exoplayer2/c0;->u()Z

    .line 102
    .line 103
    .line 104
    move-result p2

    .line 105
    if-nez p2, :cond_3

    .line 106
    .line 107
    iget-object p2, p4, Ll/fyx;->a:Ljava/lang/Object;

    .line 108
    .line 109
    iget-object p4, p0, Lcom/google/android/exoplayer2/j;->l:Lcom/google/android/exoplayer2/c0$b;

    .line 110
    .line 111
    invoke-virtual {p3, p2, p4}, Lcom/google/android/exoplayer2/c0;->l(Ljava/lang/Object;Lcom/google/android/exoplayer2/c0$b;)Lcom/google/android/exoplayer2/c0$b;

    .line 112
    .line 113
    .line 114
    move-result-object p2

    .line 115
    iget p2, p2, Lcom/google/android/exoplayer2/c0$b;->c:I

    .line 116
    .line 117
    iget-object p4, p0, Lcom/google/android/exoplayer2/j;->k:Lcom/google/android/exoplayer2/c0$d;

    .line 118
    .line 119
    invoke-virtual {p3, p2, p4}, Lcom/google/android/exoplayer2/c0;->r(ILcom/google/android/exoplayer2/c0$d;)Lcom/google/android/exoplayer2/c0$d;

    .line 120
    .line 121
    .line 122
    move-result-object p2

    .line 123
    iget-object p2, p2, Lcom/google/android/exoplayer2/c0$d;->a:Ljava/lang/Object;

    .line 124
    .line 125
    goto :goto_1

    .line 126
    :cond_3
    const/4 p2, 0x0

    .line 127
    :goto_1
    invoke-static {p2, p1}, Ll/bmk0;->c(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 128
    .line 129
    .line 130
    move-result p1

    .line 131
    if-eqz p1, :cond_5

    .line 132
    .line 133
    if-eqz p7, :cond_4

    .line 134
    .line 135
    goto :goto_2

    .line 136
    :cond_4
    return-void

    .line 137
    :cond_5
    :goto_2
    iget-object p0, p0, Lcom/google/android/exoplayer2/j;->u:Lcom/google/android/exoplayer2/m;

    .line 138
    .line 139
    invoke-interface {p0, v0, v1}, Lcom/google/android/exoplayer2/m;->e(J)V

    .line 140
    .line 141
    .line 142
    return-void
.end method

.method public y(Z)V
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/google/android/exoplayer2/j;->h:Ll/sxk;

    .line 2
    .line 3
    const/16 v0, 0x18

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    invoke-interface {p0, v0, p1, v1}, Ll/sxk;->e(III)Ll/sxk$a;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    invoke-interface {p0}, Ll/sxk$a;->a()V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public final y1(F)V
    .locals 4

    .line 1
    iget-object p0, p0, Lcom/google/android/exoplayer2/j;->s:Lcom/google/android/exoplayer2/p;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/p;->r()Ll/eyx;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    :goto_0
    if-eqz p0, :cond_2

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/eyx;->o()Ll/dgj0;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iget-object v0, v0, Ll/dgj0;->c:[Ll/u9f;

    .line 14
    .line 15
    array-length v1, v0

    .line 16
    const/4 v2, 0x0

    .line 17
    :goto_1
    if-ge v2, v1, :cond_1

    .line 18
    .line 19
    aget-object v3, v0, v2

    .line 20
    .line 21
    if-eqz v3, :cond_0

    .line 22
    .line 23
    invoke-interface {v3, p1}, Ll/u9f;->n(F)V

    .line 24
    .line 25
    .line 26
    :cond_0
    add-int/lit8 v2, v2, 0x1

    .line 27
    .line 28
    goto :goto_1

    .line 29
    :cond_1
    invoke-virtual {p0}, Ll/eyx;->j()Ll/eyx;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    goto :goto_0

    .line 34
    :cond_2
    return-void
.end method

.method public final z([Ll/u9f;)Lcom/google/common/collect/ImmutableList;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Ll/u9f;",
            ")",
            "Lcom/google/common/collect/ImmutableList<",
            "Lcom/google/android/exoplayer2/metadata/Metadata;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/google/common/collect/ImmutableList$a;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/google/common/collect/ImmutableList$a;-><init>()V

    .line 4
    .line 5
    .line 6
    array-length v0, p1

    .line 7
    const/4 v1, 0x0

    .line 8
    move v2, v1

    .line 9
    move v3, v2

    .line 10
    :goto_0
    if-ge v2, v0, :cond_2

    .line 11
    .line 12
    aget-object v4, p1, v2

    .line 13
    .line 14
    if-eqz v4, :cond_1

    .line 15
    .line 16
    invoke-interface {v4, v1}, Ll/vfj0;->m(I)Lcom/google/android/exoplayer2/k;

    .line 17
    .line 18
    .line 19
    move-result-object v4

    .line 20
    iget-object v4, v4, Lcom/google/android/exoplayer2/k;->j:Lcom/google/android/exoplayer2/metadata/Metadata;

    .line 21
    .line 22
    if-nez v4, :cond_0

    .line 23
    .line 24
    new-instance v4, Lcom/google/android/exoplayer2/metadata/Metadata;

    .line 25
    .line 26
    new-array v5, v1, [Lcom/google/android/exoplayer2/metadata/Metadata$Entry;

    .line 27
    .line 28
    invoke-direct {v4, v5}, Lcom/google/android/exoplayer2/metadata/Metadata;-><init>([Lcom/google/android/exoplayer2/metadata/Metadata$Entry;)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {p0, v4}, Lcom/google/common/collect/ImmutableList$a;->i(Ljava/lang/Object;)Lcom/google/common/collect/ImmutableList$a;

    .line 32
    .line 33
    .line 34
    goto :goto_1

    .line 35
    :cond_0
    invoke-virtual {p0, v4}, Lcom/google/common/collect/ImmutableList$a;->i(Ljava/lang/Object;)Lcom/google/common/collect/ImmutableList$a;

    .line 36
    .line 37
    .line 38
    const/4 v3, 0x1

    .line 39
    :cond_1
    :goto_1
    add-int/lit8 v2, v2, 0x1

    .line 40
    .line 41
    goto :goto_0

    .line 42
    :cond_2
    if-eqz v3, :cond_3

    .line 43
    .line 44
    invoke-virtual {p0}, Lcom/google/common/collect/ImmutableList$a;->m()Lcom/google/common/collect/ImmutableList;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    return-object p0

    .line 49
    :cond_3
    invoke-static {}, Lcom/google/common/collect/ImmutableList;->of()Lcom/google/common/collect/ImmutableList;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    return-object p0
.end method

.method public final declared-synchronized z1(Ll/b7h0;J)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/b7h0<",
            "Ljava/lang/Boolean;",
            ">;J)V"
        }
    .end annotation

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Lcom/google/android/exoplayer2/j;->q:Ll/qa5;

    .line 3
    .line 4
    invoke-interface {v0}, Ll/qa5;->elapsedRealtime()J

    .line 5
    .line 6
    .line 7
    move-result-wide v0

    .line 8
    add-long/2addr v0, p2

    .line 9
    const/4 v2, 0x0

    .line 10
    :goto_0
    invoke-interface {p1}, Ll/b7h0;->get()Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    move-result-object v3

    .line 14
    check-cast v3, Ljava/lang/Boolean;

    .line 15
    .line 16
    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    .line 17
    .line 18
    .line 19
    move-result v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 20
    if-nez v3, :cond_0

    .line 21
    .line 22
    const-wide/16 v3, 0x0

    .line 23
    .line 24
    cmp-long v3, p2, v3

    .line 25
    .line 26
    if-lez v3, :cond_0

    .line 27
    .line 28
    :try_start_1
    iget-object v3, p0, Lcom/google/android/exoplayer2/j;->q:Ll/qa5;

    .line 29
    .line 30
    invoke-interface {v3}, Ll/qa5;->b()V

    .line 31
    .line 32
    .line 33
    invoke-virtual {p0, p2, p3}, Ljava/lang/Object;->wait(J)V
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 34
    .line 35
    .line 36
    goto :goto_1

    .line 37
    :catchall_0
    move-exception p1

    .line 38
    goto :goto_2

    .line 39
    :catch_0
    const/4 p2, 0x1

    .line 40
    move v2, p2

    .line 41
    :goto_1
    :try_start_2
    iget-object p2, p0, Lcom/google/android/exoplayer2/j;->q:Ll/qa5;

    .line 42
    .line 43
    invoke-interface {p2}, Ll/qa5;->elapsedRealtime()J

    .line 44
    .line 45
    .line 46
    move-result-wide p2

    .line 47
    sub-long p2, v0, p2

    .line 48
    .line 49
    goto :goto_0

    .line 50
    :cond_0
    if-eqz v2, :cond_1

    .line 51
    .line 52
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    .line 53
    .line 54
    .line 55
    move-result-object p1

    .line 56
    invoke-virtual {p1}, Ljava/lang/Thread;->interrupt()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 57
    .line 58
    .line 59
    :cond_1
    monitor-exit p0

    .line 60
    return-void

    .line 61
    :goto_2
    :try_start_3
    monitor-exit p0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 62
    throw p1
.end method

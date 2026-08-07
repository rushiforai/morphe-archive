.class public final Lcom/google/android/exoplayer2/audio/DefaultAudioSink;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/google/android/exoplayer2/audio/AudioSink;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/exoplayer2/audio/DefaultAudioSink$f;,
        Lcom/google/android/exoplayer2/audio/DefaultAudioSink$e;,
        Lcom/google/android/exoplayer2/audio/DefaultAudioSink$k;,
        Lcom/google/android/exoplayer2/audio/DefaultAudioSink$i;,
        Lcom/google/android/exoplayer2/audio/DefaultAudioSink$j;,
        Lcom/google/android/exoplayer2/audio/DefaultAudioSink$g;,
        Lcom/google/android/exoplayer2/audio/DefaultAudioSink$c;,
        Lcom/google/android/exoplayer2/audio/DefaultAudioSink$d;,
        Lcom/google/android/exoplayer2/audio/DefaultAudioSink$b;,
        Lcom/google/android/exoplayer2/audio/DefaultAudioSink$l;,
        Lcom/google/android/exoplayer2/audio/DefaultAudioSink$h;,
        Lcom/google/android/exoplayer2/audio/DefaultAudioSink$InvalidAudioTrackTimestampException;
    }
.end annotation

.annotation runtime Ljava/lang/Deprecated;
.end annotation


# static fields
.field public static h0:Z

.field public static final i0:Ljava/lang/Object;

.field public static j0:Ljava/util/concurrent/ExecutorService;
    .annotation build Landroidx/annotation/GuardedBy;
        value = "releaseExecutorLock"
    .end annotation

    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public static k0:I
    .annotation build Landroidx/annotation/GuardedBy;
        value = "releaseExecutorLock"
    .end annotation
.end field


# instance fields
.field public A:Lcom/google/android/exoplayer2/audio/DefaultAudioSink$i;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public B:Lcom/google/android/exoplayer2/audio/DefaultAudioSink$i;

.field public C:Lcom/google/android/exoplayer2/s;

.field public D:Z

.field public E:Ljava/nio/ByteBuffer;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public F:I

.field public G:J

.field public H:J

.field public I:J

.field public J:J

.field public K:I

.field public L:Z

.field public M:Z

.field public N:J

.field public O:F

.field public P:Ljava/nio/ByteBuffer;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public Q:I

.field public R:Ljava/nio/ByteBuffer;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public S:[B

.field public T:I

.field public U:Z

.field public V:Z

.field public W:Z

.field public X:Z

.field public Y:I

.field public Z:Ll/wj1;

.field public final a:Landroid/content/Context;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public a0:Lcom/google/android/exoplayer2/audio/DefaultAudioSink$d;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public final b:Ll/cc1;

.field public b0:Z

.field public final c:Z

.field public c0:J

.field public final d:Lcom/google/android/exoplayer2/audio/f;

.field public d0:J

.field public final e:Lcom/google/android/exoplayer2/audio/m;

.field public e0:Z

.field public final f:Lcom/google/common/collect/ImmutableList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/collect/ImmutableList<",
            "Lcom/google/android/exoplayer2/audio/AudioProcessor;",
            ">;"
        }
    .end annotation
.end field

.field public f0:Z

.field public final g:Lcom/google/common/collect/ImmutableList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/collect/ImmutableList<",
            "Lcom/google/android/exoplayer2/audio/AudioProcessor;",
            ">;"
        }
    .end annotation
.end field

.field public g0:Landroid/os/Looper;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public final h:Ll/wt5;

.field public final i:Lcom/google/android/exoplayer2/audio/d;

.field public final j:Ljava/util/ArrayDeque;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayDeque<",
            "Lcom/google/android/exoplayer2/audio/DefaultAudioSink$i;",
            ">;"
        }
    .end annotation
.end field

.field public final k:Z

.field public final l:I

.field public m:Lcom/google/android/exoplayer2/audio/DefaultAudioSink$l;

.field public final n:Lcom/google/android/exoplayer2/audio/DefaultAudioSink$j;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/android/exoplayer2/audio/DefaultAudioSink$j<",
            "Lcom/google/android/exoplayer2/audio/AudioSink$InitializationException;",
            ">;"
        }
    .end annotation
.end field

.field public final o:Lcom/google/android/exoplayer2/audio/DefaultAudioSink$j;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/android/exoplayer2/audio/DefaultAudioSink$j<",
            "Lcom/google/android/exoplayer2/audio/AudioSink$WriteException;",
            ">;"
        }
    .end annotation
.end field

.field public final p:Lcom/google/android/exoplayer2/audio/DefaultAudioSink$e;

.field public final q:Lcom/google/android/exoplayer2/ExoPlayer$b;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public r:Ll/bf80;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public s:Lcom/google/android/exoplayer2/audio/AudioSink$a;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public t:Lcom/google/android/exoplayer2/audio/DefaultAudioSink$g;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public u:Lcom/google/android/exoplayer2/audio/DefaultAudioSink$g;

.field public v:Lcom/google/android/exoplayer2/audio/b;

.field public w:Landroid/media/AudioTrack;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public x:Ll/ha1;

.field public y:Lcom/google/android/exoplayer2/audio/AudioCapabilitiesReceiver;

.field public z:Lcom/google/android/exoplayer2/audio/a;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ljava/lang/Object;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->i0:Ljava/lang/Object;

    .line 7
    .line 8
    return-void
.end method

.method public constructor <init>(Lcom/google/android/exoplayer2/audio/DefaultAudioSink$f;)V
    .locals 11
    .annotation runtime Lorg/checkerframework/checker/nullness/qual/RequiresNonNull;
        value = {
            "#1.audioProcessorChain"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-static {p1}, Lcom/google/android/exoplayer2/audio/DefaultAudioSink$f;->a(Lcom/google/android/exoplayer2/audio/DefaultAudioSink$f;)Landroid/content/Context;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iput-object v0, p0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->a:Landroid/content/Context;

    .line 9
    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    invoke-static {v0}, Ll/ha1;->c(Landroid/content/Context;)Ll/ha1;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    goto :goto_0

    .line 17
    :cond_0
    invoke-static {p1}, Lcom/google/android/exoplayer2/audio/DefaultAudioSink$f;->b(Lcom/google/android/exoplayer2/audio/DefaultAudioSink$f;)Ll/ha1;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    :goto_0
    iput-object v0, p0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->x:Ll/ha1;

    .line 22
    .line 23
    invoke-static {p1}, Lcom/google/android/exoplayer2/audio/DefaultAudioSink$f;->c(Lcom/google/android/exoplayer2/audio/DefaultAudioSink$f;)Ll/cc1;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    iput-object v0, p0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->b:Ll/cc1;

    .line 28
    .line 29
    sget v0, Ll/bmk0;->a:I

    .line 30
    .line 31
    const/16 v1, 0x15

    .line 32
    .line 33
    const/4 v2, 0x1

    .line 34
    const/4 v3, 0x0

    .line 35
    if-lt v0, v1, :cond_1

    .line 36
    .line 37
    invoke-static {p1}, Lcom/google/android/exoplayer2/audio/DefaultAudioSink$f;->d(Lcom/google/android/exoplayer2/audio/DefaultAudioSink$f;)Z

    .line 38
    .line 39
    .line 40
    move-result v1

    .line 41
    if-eqz v1, :cond_1

    .line 42
    .line 43
    move v1, v2

    .line 44
    goto :goto_1

    .line 45
    :cond_1
    move v1, v3

    .line 46
    :goto_1
    iput-boolean v1, p0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->c:Z

    .line 47
    .line 48
    const/16 v1, 0x17

    .line 49
    .line 50
    if-lt v0, v1, :cond_2

    .line 51
    .line 52
    invoke-static {p1}, Lcom/google/android/exoplayer2/audio/DefaultAudioSink$f;->e(Lcom/google/android/exoplayer2/audio/DefaultAudioSink$f;)Z

    .line 53
    .line 54
    .line 55
    move-result v1

    .line 56
    if-eqz v1, :cond_2

    .line 57
    .line 58
    goto :goto_2

    .line 59
    :cond_2
    move v2, v3

    .line 60
    :goto_2
    iput-boolean v2, p0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->k:Z

    .line 61
    .line 62
    const/16 v1, 0x1d

    .line 63
    .line 64
    if-lt v0, v1, :cond_3

    .line 65
    .line 66
    invoke-static {p1}, Lcom/google/android/exoplayer2/audio/DefaultAudioSink$f;->f(Lcom/google/android/exoplayer2/audio/DefaultAudioSink$f;)I

    .line 67
    .line 68
    .line 69
    move-result v0

    .line 70
    goto :goto_3

    .line 71
    :cond_3
    move v0, v3

    .line 72
    :goto_3
    iput v0, p0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->l:I

    .line 73
    .line 74
    iget-object v0, p1, Lcom/google/android/exoplayer2/audio/DefaultAudioSink$f;->g:Lcom/google/android/exoplayer2/audio/DefaultAudioSink$e;

    .line 75
    .line 76
    iput-object v0, p0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->p:Lcom/google/android/exoplayer2/audio/DefaultAudioSink$e;

    .line 77
    .line 78
    new-instance v0, Ll/wt5;

    .line 79
    .line 80
    sget-object v1, Ll/qa5;->a:Ll/qa5;

    .line 81
    .line 82
    invoke-direct {v0, v1}, Ll/wt5;-><init>(Ll/qa5;)V

    .line 83
    .line 84
    .line 85
    iput-object v0, p0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->h:Ll/wt5;

    .line 86
    .line 87
    invoke-virtual {v0}, Ll/wt5;->e()Z

    .line 88
    .line 89
    .line 90
    new-instance v0, Lcom/google/android/exoplayer2/audio/d;

    .line 91
    .line 92
    new-instance v1, Lcom/google/android/exoplayer2/audio/DefaultAudioSink$k;

    .line 93
    .line 94
    const/4 v2, 0x0

    .line 95
    invoke-direct {v1, p0, v2}, Lcom/google/android/exoplayer2/audio/DefaultAudioSink$k;-><init>(Lcom/google/android/exoplayer2/audio/DefaultAudioSink;Lcom/google/android/exoplayer2/audio/DefaultAudioSink$a;)V

    .line 96
    .line 97
    .line 98
    invoke-direct {v0, v1}, Lcom/google/android/exoplayer2/audio/d;-><init>(Lcom/google/android/exoplayer2/audio/d$a;)V

    .line 99
    .line 100
    .line 101
    iput-object v0, p0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->i:Lcom/google/android/exoplayer2/audio/d;

    .line 102
    .line 103
    new-instance v0, Lcom/google/android/exoplayer2/audio/f;

    .line 104
    .line 105
    invoke-direct {v0}, Lcom/google/android/exoplayer2/audio/f;-><init>()V

    .line 106
    .line 107
    .line 108
    iput-object v0, p0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->d:Lcom/google/android/exoplayer2/audio/f;

    .line 109
    .line 110
    new-instance v1, Lcom/google/android/exoplayer2/audio/m;

    .line 111
    .line 112
    invoke-direct {v1}, Lcom/google/android/exoplayer2/audio/m;-><init>()V

    .line 113
    .line 114
    .line 115
    iput-object v1, p0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->e:Lcom/google/android/exoplayer2/audio/m;

    .line 116
    .line 117
    new-instance v2, Lcom/google/android/exoplayer2/audio/l;

    .line 118
    .line 119
    invoke-direct {v2}, Lcom/google/android/exoplayer2/audio/l;-><init>()V

    .line 120
    .line 121
    .line 122
    invoke-static {v2, v0, v1}, Lcom/google/common/collect/ImmutableList;->of(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lcom/google/common/collect/ImmutableList;

    .line 123
    .line 124
    .line 125
    move-result-object v0

    .line 126
    iput-object v0, p0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->f:Lcom/google/common/collect/ImmutableList;

    .line 127
    .line 128
    new-instance v0, Lcom/google/android/exoplayer2/audio/k;

    .line 129
    .line 130
    invoke-direct {v0}, Lcom/google/android/exoplayer2/audio/k;-><init>()V

    .line 131
    .line 132
    .line 133
    invoke-static {v0}, Lcom/google/common/collect/ImmutableList;->of(Ljava/lang/Object;)Lcom/google/common/collect/ImmutableList;

    .line 134
    .line 135
    .line 136
    move-result-object v0

    .line 137
    iput-object v0, p0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->g:Lcom/google/common/collect/ImmutableList;

    .line 138
    .line 139
    const/high16 v0, 0x3f800000    # 1.0f

    .line 140
    .line 141
    iput v0, p0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->O:F

    .line 142
    .line 143
    sget-object v0, Lcom/google/android/exoplayer2/audio/a;->g:Lcom/google/android/exoplayer2/audio/a;

    .line 144
    .line 145
    iput-object v0, p0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->z:Lcom/google/android/exoplayer2/audio/a;

    .line 146
    .line 147
    iput v3, p0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->Y:I

    .line 148
    .line 149
    new-instance v0, Ll/wj1;

    .line 150
    .line 151
    const/4 v1, 0x0

    .line 152
    invoke-direct {v0, v3, v1}, Ll/wj1;-><init>(IF)V

    .line 153
    .line 154
    .line 155
    iput-object v0, p0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->Z:Ll/wj1;

    .line 156
    .line 157
    new-instance v4, Lcom/google/android/exoplayer2/audio/DefaultAudioSink$i;

    .line 158
    .line 159
    sget-object v5, Lcom/google/android/exoplayer2/s;->d:Lcom/google/android/exoplayer2/s;

    .line 160
    .line 161
    const-wide/16 v8, 0x0

    .line 162
    .line 163
    const/4 v10, 0x0

    .line 164
    const-wide/16 v6, 0x0

    .line 165
    .line 166
    invoke-direct/range {v4 .. v10}, Lcom/google/android/exoplayer2/audio/DefaultAudioSink$i;-><init>(Lcom/google/android/exoplayer2/s;JJLcom/google/android/exoplayer2/audio/DefaultAudioSink$a;)V

    .line 167
    .line 168
    .line 169
    iput-object v4, p0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->B:Lcom/google/android/exoplayer2/audio/DefaultAudioSink$i;

    .line 170
    .line 171
    iput-object v5, p0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->C:Lcom/google/android/exoplayer2/s;

    .line 172
    .line 173
    iput-boolean v3, p0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->D:Z

    .line 174
    .line 175
    new-instance v0, Ljava/util/ArrayDeque;

    .line 176
    .line 177
    invoke-direct {v0}, Ljava/util/ArrayDeque;-><init>()V

    .line 178
    .line 179
    .line 180
    iput-object v0, p0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->j:Ljava/util/ArrayDeque;

    .line 181
    .line 182
    new-instance v0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink$j;

    .line 183
    .line 184
    const-wide/16 v1, 0x64

    .line 185
    .line 186
    invoke-direct {v0, v1, v2}, Lcom/google/android/exoplayer2/audio/DefaultAudioSink$j;-><init>(J)V

    .line 187
    .line 188
    .line 189
    iput-object v0, p0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->n:Lcom/google/android/exoplayer2/audio/DefaultAudioSink$j;

    .line 190
    .line 191
    new-instance v0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink$j;

    .line 192
    .line 193
    invoke-direct {v0, v1, v2}, Lcom/google/android/exoplayer2/audio/DefaultAudioSink$j;-><init>(J)V

    .line 194
    .line 195
    .line 196
    iput-object v0, p0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->o:Lcom/google/android/exoplayer2/audio/DefaultAudioSink$j;

    .line 197
    .line 198
    iget-object p1, p1, Lcom/google/android/exoplayer2/audio/DefaultAudioSink$f;->h:Lcom/google/android/exoplayer2/ExoPlayer$b;

    .line 199
    .line 200
    iput-object p1, p0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->q:Lcom/google/android/exoplayer2/ExoPlayer$b;

    .line 201
    .line 202
    return-void
.end method

.method public synthetic constructor <init>(Lcom/google/android/exoplayer2/audio/DefaultAudioSink$f;Lcom/google/android/exoplayer2/audio/DefaultAudioSink$a;)V
    .locals 0

    .line 203
    invoke-direct {p0, p1}, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;-><init>(Lcom/google/android/exoplayer2/audio/DefaultAudioSink$f;)V

    return-void
.end method

.method public static F(III)Landroid/media/AudioFormat;
    .locals 1
    .annotation build Landroidx/annotation/RequiresApi;
        value = 0x15
    .end annotation

    .line 1
    new-instance v0, Landroid/media/AudioFormat$Builder;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/media/AudioFormat$Builder;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0, p0}, Landroid/media/AudioFormat$Builder;->setSampleRate(I)Landroid/media/AudioFormat$Builder;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    invoke-virtual {p0, p1}, Landroid/media/AudioFormat$Builder;->setChannelMask(I)Landroid/media/AudioFormat$Builder;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    invoke-virtual {p0, p2}, Landroid/media/AudioFormat$Builder;->setEncoding(I)Landroid/media/AudioFormat$Builder;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    invoke-virtual {p0}, Landroid/media/AudioFormat$Builder;->build()Landroid/media/AudioFormat;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    return-object p0
.end method

.method public static G(III)I
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Landroid/media/AudioTrack;->getMinBufferSize(III)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    const/4 p1, -0x2

    .line 6
    if-eq p0, p1, :cond_0

    .line 7
    .line 8
    const/4 p1, 0x1

    .line 9
    goto :goto_0

    .line 10
    :cond_0
    const/4 p1, 0x0

    .line 11
    :goto_0
    invoke-static {p1}, Ll/w11;->g(Z)V

    .line 12
    .line 13
    .line 14
    return p0
.end method

.method public static H(ILjava/nio/ByteBuffer;)I
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    const/4 v1, -0x1

    .line 3
    const/16 v2, 0x400

    .line 4
    .line 5
    packed-switch p0, :pswitch_data_0

    .line 6
    .line 7
    .line 8
    :pswitch_0
    const-string p1, "Unexpected audio encoding: "

    .line 9
    .line 10
    invoke-static {p1, p0}, Ll/o4c;->a(Ljava/lang/String;I)V

    .line 11
    .line 12
    .line 13
    return v0

    .line 14
    :pswitch_1
    invoke-static {p1}, Ll/w560;->g(Ljava/nio/ByteBuffer;)I

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    return p0

    .line 19
    :pswitch_2
    invoke-static {p1}, Ll/d9;->c(Ljava/nio/ByteBuffer;)I

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    return p0

    .line 24
    :pswitch_3
    return v2

    .line 25
    :pswitch_4
    const/16 p0, 0x200

    .line 26
    .line 27
    return p0

    .line 28
    :pswitch_5
    invoke-static {p1}, Ll/z8;->b(Ljava/nio/ByteBuffer;)I

    .line 29
    .line 30
    .line 31
    move-result p0

    .line 32
    if-ne p0, v1, :cond_0

    .line 33
    .line 34
    return v0

    .line 35
    :cond_0
    invoke-static {p1, p0}, Ll/z8;->i(Ljava/nio/ByteBuffer;I)I

    .line 36
    .line 37
    .line 38
    move-result p0

    .line 39
    mul-int/lit8 p0, p0, 0x10

    .line 40
    .line 41
    return p0

    .line 42
    :pswitch_6
    const/16 p0, 0x800

    .line 43
    .line 44
    return p0

    .line 45
    :pswitch_7
    return v2

    .line 46
    :pswitch_8
    invoke-virtual {p1}, Ljava/nio/Buffer;->position()I

    .line 47
    .line 48
    .line 49
    move-result p0

    .line 50
    invoke-static {p1, p0}, Ll/bmk0;->J(Ljava/nio/ByteBuffer;I)I

    .line 51
    .line 52
    .line 53
    move-result p0

    .line 54
    invoke-static {p0}, Ll/i710;->m(I)I

    .line 55
    .line 56
    .line 57
    move-result p0

    .line 58
    if-eq p0, v1, :cond_1

    .line 59
    .line 60
    return p0

    .line 61
    :cond_1
    invoke-static {}, Ll/fig0;->a()V

    .line 62
    .line 63
    .line 64
    return v0

    .line 65
    :pswitch_9
    invoke-static {p1}, Ll/ofe;->e(Ljava/nio/ByteBuffer;)I

    .line 66
    .line 67
    .line 68
    move-result p0

    .line 69
    return p0

    .line 70
    :pswitch_a
    invoke-static {p1}, Ll/z8;->e(Ljava/nio/ByteBuffer;)I

    .line 71
    .line 72
    .line 73
    move-result p0

    .line 74
    return p0

    .line 75
    :pswitch_data_0
    .packed-switch 0x5
        :pswitch_a
        :pswitch_a
        :pswitch_9
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_6
        :pswitch_0
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_a
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public static M(I)Z
    .locals 2

    .line 1
    sget v0, Ll/bmk0;->a:I

    .line 2
    .line 3
    const/16 v1, 0x18

    .line 4
    .line 5
    if-lt v0, v1, :cond_0

    .line 6
    .line 7
    const/4 v0, -0x6

    .line 8
    if-eq p0, v0, :cond_1

    .line 9
    .line 10
    :cond_0
    const/16 v0, -0x20

    .line 11
    .line 12
    if-ne p0, v0, :cond_2

    .line 13
    .line 14
    :cond_1
    const/4 p0, 0x1

    .line 15
    return p0

    .line 16
    :cond_2
    const/4 p0, 0x0

    .line 17
    return p0
.end method

.method public static O(Landroid/media/AudioTrack;)Z
    .locals 2

    .line 1
    sget v0, Ll/bmk0;->a:I

    .line 2
    .line 3
    const/16 v1, 0x1d

    .line 4
    .line 5
    if-lt v0, v1, :cond_0

    .line 6
    .line 7
    invoke-static {p0}, Ll/emd;->a(Landroid/media/AudioTrack;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    const/4 p0, 0x1

    .line 14
    return p0

    .line 15
    :cond_0
    const/4 p0, 0x0

    .line 16
    return p0
.end method

.method public static U(Landroid/media/AudioTrack;Ll/wt5;)V
    .locals 3

    .line 1
    invoke-virtual {p1}, Ll/wt5;->c()Z

    .line 2
    .line 3
    .line 4
    sget-object v0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->i0:Ljava/lang/Object;

    .line 5
    .line 6
    monitor-enter v0

    .line 7
    :try_start_0
    sget-object v1, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->j0:Ljava/util/concurrent/ExecutorService;

    .line 8
    .line 9
    if-nez v1, :cond_0

    .line 10
    .line 11
    const-string v1, "ExoPlayer:AudioTrackReleaseThread"

    .line 12
    .line 13
    invoke-static {v1}, Ll/bmk0;->K0(Ljava/lang/String;)Ljava/util/concurrent/ExecutorService;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    sput-object v1, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->j0:Ljava/util/concurrent/ExecutorService;

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :catchall_0
    move-exception p0

    .line 21
    goto :goto_1

    .line 22
    :cond_0
    :goto_0
    sget v1, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->k0:I

    .line 23
    .line 24
    add-int/lit8 v1, v1, 0x1

    .line 25
    .line 26
    sput v1, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->k0:I

    .line 27
    .line 28
    sget-object v1, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->j0:Ljava/util/concurrent/ExecutorService;

    .line 29
    .line 30
    new-instance v2, Ll/gmd;

    .line 31
    .line 32
    invoke-direct {v2, p0, p1}, Ll/gmd;-><init>(Landroid/media/AudioTrack;Ll/wt5;)V

    .line 33
    .line 34
    .line 35
    invoke-interface {v1, v2}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 36
    .line 37
    .line 38
    monitor-exit v0

    .line 39
    return-void

    .line 40
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 41
    throw p0
.end method

.method public static Z(Landroid/media/AudioTrack;F)V
    .locals 0
    .annotation build Landroidx/annotation/RequiresApi;
        value = 0x15
    .end annotation

    .line 1
    invoke-virtual {p0, p1}, Landroid/media/AudioTrack;->setVolume(F)I

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static a0(Landroid/media/AudioTrack;F)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p1}, Landroid/media/AudioTrack;->setStereoVolume(FF)I

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static h0(Landroid/media/AudioTrack;Ljava/nio/ByteBuffer;I)I
    .locals 1
    .annotation build Landroidx/annotation/RequiresApi;
        value = 0x15
    .end annotation

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-virtual {p0, p1, p2, v0}, Landroid/media/AudioTrack;->write(Ljava/nio/ByteBuffer;II)I

    .line 3
    .line 4
    .line 5
    move-result p0

    .line 6
    return p0
.end method

.method public static synthetic q(Landroid/media/AudioTrack;Ll/wt5;)V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    :try_start_0
    invoke-virtual {p0}, Landroid/media/AudioTrack;->flush()V

    .line 3
    .line 4
    .line 5
    invoke-virtual {p0}, Landroid/media/AudioTrack;->release()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 6
    .line 7
    .line 8
    invoke-virtual {p1}, Ll/wt5;->e()Z

    .line 9
    .line 10
    .line 11
    sget-object p0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->i0:Ljava/lang/Object;

    .line 12
    .line 13
    monitor-enter p0

    .line 14
    :try_start_1
    sget p1, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->k0:I

    .line 15
    .line 16
    add-int/lit8 p1, p1, -0x1

    .line 17
    .line 18
    sput p1, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->k0:I

    .line 19
    .line 20
    if-nez p1, :cond_0

    .line 21
    .line 22
    sget-object p1, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->j0:Ljava/util/concurrent/ExecutorService;

    .line 23
    .line 24
    invoke-interface {p1}, Ljava/util/concurrent/ExecutorService;->shutdown()V

    .line 25
    .line 26
    .line 27
    sput-object v0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->j0:Ljava/util/concurrent/ExecutorService;

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :catchall_0
    move-exception p1

    .line 31
    goto :goto_1

    .line 32
    :cond_0
    :goto_0
    monitor-exit p0

    .line 33
    return-void

    .line 34
    :goto_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 35
    throw p1

    .line 36
    :catchall_1
    move-exception p0

    .line 37
    invoke-virtual {p1}, Ll/wt5;->e()Z

    .line 38
    .line 39
    .line 40
    sget-object p1, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->i0:Ljava/lang/Object;

    .line 41
    .line 42
    monitor-enter p1

    .line 43
    :try_start_2
    sget v1, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->k0:I

    .line 44
    .line 45
    add-int/lit8 v1, v1, -0x1

    .line 46
    .line 47
    sput v1, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->k0:I

    .line 48
    .line 49
    if-nez v1, :cond_1

    .line 50
    .line 51
    sget-object v1, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->j0:Ljava/util/concurrent/ExecutorService;

    .line 52
    .line 53
    invoke-interface {v1}, Ljava/util/concurrent/ExecutorService;->shutdown()V

    .line 54
    .line 55
    .line 56
    sput-object v0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->j0:Ljava/util/concurrent/ExecutorService;

    .line 57
    .line 58
    goto :goto_2

    .line 59
    :catchall_2
    move-exception p0

    .line 60
    goto :goto_3

    .line 61
    :cond_1
    :goto_2
    monitor-exit p1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    .line 62
    throw p0

    .line 63
    :goto_3
    :try_start_3
    monitor-exit p1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    .line 64
    throw p0
.end method

.method public static synthetic r(Lcom/google/android/exoplayer2/audio/DefaultAudioSink;)Lcom/google/android/exoplayer2/audio/AudioSink$a;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->s:Lcom/google/android/exoplayer2/audio/AudioSink$a;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic s(Lcom/google/android/exoplayer2/audio/DefaultAudioSink;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->W:Z

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic t(Lcom/google/android/exoplayer2/audio/DefaultAudioSink;)J
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->J()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    return-wide v0
.end method

.method public static synthetic u(Lcom/google/android/exoplayer2/audio/DefaultAudioSink;)J
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->K()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    return-wide v0
.end method

.method public static synthetic v(Lcom/google/android/exoplayer2/audio/DefaultAudioSink;)J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->d0:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public static synthetic w(III)Landroid/media/AudioFormat;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->F(III)Landroid/media/AudioFormat;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic x(Lcom/google/android/exoplayer2/audio/DefaultAudioSink;)Landroid/media/AudioTrack;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->w:Landroid/media/AudioTrack;

    .line 2
    .line 3
    return-object p0
.end method


# virtual methods
.method public final A(J)J
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->u:Lcom/google/android/exoplayer2/audio/DefaultAudioSink$g;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->b:Ll/cc1;

    .line 4
    .line 5
    invoke-interface {p0}, Ll/cc1;->c()J

    .line 6
    .line 7
    .line 8
    move-result-wide v1

    .line 9
    invoke-virtual {v0, v1, v2}, Lcom/google/android/exoplayer2/audio/DefaultAudioSink$g;->h(J)J

    .line 10
    .line 11
    .line 12
    move-result-wide v0

    .line 13
    add-long/2addr p1, v0

    .line 14
    return-wide p1
.end method

.method public final B(Lcom/google/android/exoplayer2/audio/DefaultAudioSink$g;)Landroid/media/AudioTrack;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer2/audio/AudioSink$InitializationException;
        }
    .end annotation

    .line 1
    :try_start_0
    iget-boolean v0, p0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->b0:Z

    .line 2
    .line 3
    iget-object v1, p0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->z:Lcom/google/android/exoplayer2/audio/a;

    .line 4
    .line 5
    iget v2, p0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->Y:I

    .line 6
    .line 7
    invoke-virtual {p1, v0, v1, v2}, Lcom/google/android/exoplayer2/audio/DefaultAudioSink$g;->a(ZLcom/google/android/exoplayer2/audio/a;I)Landroid/media/AudioTrack;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    iget-object v0, p0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->q:Lcom/google/android/exoplayer2/ExoPlayer$b;

    .line 12
    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    invoke-static {p1}, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->O(Landroid/media/AudioTrack;)Z

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    invoke-interface {v0, v1}, Lcom/google/android/exoplayer2/ExoPlayer$b;->E(Z)V
    :try_end_0
    .catch Lcom/google/android/exoplayer2/audio/AudioSink$InitializationException; {:try_start_0 .. :try_end_0} :catch_0

    .line 20
    .line 21
    .line 22
    return-object p1

    .line 23
    :catch_0
    move-exception p1

    .line 24
    goto :goto_0

    .line 25
    :cond_0
    return-object p1

    .line 26
    :goto_0
    iget-object p0, p0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->s:Lcom/google/android/exoplayer2/audio/AudioSink$a;

    .line 27
    .line 28
    if-eqz p0, :cond_1

    .line 29
    .line 30
    invoke-interface {p0, p1}, Lcom/google/android/exoplayer2/audio/AudioSink$a;->b(Ljava/lang/Exception;)V

    .line 31
    .line 32
    .line 33
    :cond_1
    throw p1
.end method

.method public final C()Landroid/media/AudioTrack;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer2/audio/AudioSink$InitializationException;
        }
    .end annotation

    .line 1
    :try_start_0
    iget-object v0, p0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->u:Lcom/google/android/exoplayer2/audio/DefaultAudioSink$g;

    .line 2
    .line 3
    invoke-static {v0}, Ll/w11;->e(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink$g;

    .line 8
    .line 9
    invoke-virtual {p0, v0}, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->B(Lcom/google/android/exoplayer2/audio/DefaultAudioSink$g;)Landroid/media/AudioTrack;

    .line 10
    .line 11
    .line 12
    move-result-object p0
    :try_end_0
    .catch Lcom/google/android/exoplayer2/audio/AudioSink$InitializationException; {:try_start_0 .. :try_end_0} :catch_0

    .line 13
    return-object p0

    .line 14
    :catch_0
    move-exception v0

    .line 15
    iget-object v1, p0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->u:Lcom/google/android/exoplayer2/audio/DefaultAudioSink$g;

    .line 16
    .line 17
    iget v2, v1, Lcom/google/android/exoplayer2/audio/DefaultAudioSink$g;->h:I

    .line 18
    .line 19
    const v3, 0xf4240

    .line 20
    .line 21
    .line 22
    if-le v2, v3, :cond_0

    .line 23
    .line 24
    invoke-virtual {v1, v3}, Lcom/google/android/exoplayer2/audio/DefaultAudioSink$g;->c(I)Lcom/google/android/exoplayer2/audio/DefaultAudioSink$g;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    :try_start_1
    invoke-virtual {p0, v1}, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->B(Lcom/google/android/exoplayer2/audio/DefaultAudioSink$g;)Landroid/media/AudioTrack;

    .line 29
    .line 30
    .line 31
    move-result-object v2

    .line 32
    iput-object v1, p0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->u:Lcom/google/android/exoplayer2/audio/DefaultAudioSink$g;
    :try_end_1
    .catch Lcom/google/android/exoplayer2/audio/AudioSink$InitializationException; {:try_start_1 .. :try_end_1} :catch_1

    .line 33
    .line 34
    return-object v2

    .line 35
    :catch_1
    move-exception v1

    .line 36
    invoke-virtual {v0, v1}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .line 37
    .line 38
    .line 39
    :cond_0
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->P()V

    .line 40
    .line 41
    .line 42
    throw v0
.end method

.method public final D()Z
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer2/audio/AudioSink$WriteException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->v:Lcom/google/android/exoplayer2/audio/b;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/google/android/exoplayer2/audio/b;->f()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x0

    .line 8
    const-wide/high16 v2, -0x8000000000000000L

    .line 9
    .line 10
    const/4 v4, 0x1

    .line 11
    if-nez v0, :cond_2

    .line 12
    .line 13
    iget-object v0, p0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->R:Ljava/nio/ByteBuffer;

    .line 14
    .line 15
    if-nez v0, :cond_0

    .line 16
    .line 17
    return v4

    .line 18
    :cond_0
    invoke-virtual {p0, v0, v2, v3}, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->g0(Ljava/nio/ByteBuffer;J)V

    .line 19
    .line 20
    .line 21
    iget-object p0, p0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->R:Ljava/nio/ByteBuffer;

    .line 22
    .line 23
    if-nez p0, :cond_1

    .line 24
    .line 25
    return v4

    .line 26
    :cond_1
    return v1

    .line 27
    :cond_2
    iget-object v0, p0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->v:Lcom/google/android/exoplayer2/audio/b;

    .line 28
    .line 29
    invoke-virtual {v0}, Lcom/google/android/exoplayer2/audio/b;->h()V

    .line 30
    .line 31
    .line 32
    invoke-virtual {p0, v2, v3}, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->S(J)V

    .line 33
    .line 34
    .line 35
    iget-object v0, p0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->v:Lcom/google/android/exoplayer2/audio/b;

    .line 36
    .line 37
    invoke-virtual {v0}, Lcom/google/android/exoplayer2/audio/b;->e()Z

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    if-eqz v0, :cond_4

    .line 42
    .line 43
    iget-object p0, p0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->R:Ljava/nio/ByteBuffer;

    .line 44
    .line 45
    if-eqz p0, :cond_3

    .line 46
    .line 47
    invoke-virtual {p0}, Ljava/nio/Buffer;->hasRemaining()Z

    .line 48
    .line 49
    .line 50
    move-result p0

    .line 51
    if-nez p0, :cond_4

    .line 52
    .line 53
    :cond_3
    return v4

    .line 54
    :cond_4
    return v1
.end method

.method public final E()Ll/ha1;
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->y:Lcom/google/android/exoplayer2/audio/AudioCapabilitiesReceiver;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->a:Landroid/content/Context;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iput-object v0, p0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->g0:Landroid/os/Looper;

    .line 14
    .line 15
    new-instance v0, Lcom/google/android/exoplayer2/audio/AudioCapabilitiesReceiver;

    .line 16
    .line 17
    iget-object v1, p0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->a:Landroid/content/Context;

    .line 18
    .line 19
    new-instance v2, Ll/fmd;

    .line 20
    .line 21
    invoke-direct {v2, p0}, Ll/fmd;-><init>(Lcom/google/android/exoplayer2/audio/DefaultAudioSink;)V

    .line 22
    .line 23
    .line 24
    invoke-direct {v0, v1, v2}, Lcom/google/android/exoplayer2/audio/AudioCapabilitiesReceiver;-><init>(Landroid/content/Context;Lcom/google/android/exoplayer2/audio/AudioCapabilitiesReceiver$e;)V

    .line 25
    .line 26
    .line 27
    iput-object v0, p0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->y:Lcom/google/android/exoplayer2/audio/AudioCapabilitiesReceiver;

    .line 28
    .line 29
    invoke-virtual {v0}, Lcom/google/android/exoplayer2/audio/AudioCapabilitiesReceiver;->d()Ll/ha1;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    iput-object v0, p0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->x:Ll/ha1;

    .line 34
    .line 35
    :cond_0
    iget-object p0, p0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->x:Ll/ha1;

    .line 36
    .line 37
    return-object p0
.end method

.method public final I(Landroid/media/AudioFormat;Landroid/media/AudioAttributes;)I
    .locals 1
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "InlinedApi"
        }
    .end annotation

    .annotation build Landroidx/annotation/RequiresApi;
        value = 0x1d
    .end annotation

    .line 1
    sget p0, Ll/bmk0;->a:I

    .line 2
    .line 3
    const/16 v0, 0x1f

    .line 4
    .line 5
    if-lt p0, v0, :cond_0

    .line 6
    .line 7
    invoke-static {p1, p2}, Ll/amd;->a(Landroid/media/AudioFormat;Landroid/media/AudioAttributes;)I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0

    .line 12
    :cond_0
    invoke-static {p1, p2}, Ll/bmd;->a(Landroid/media/AudioFormat;Landroid/media/AudioAttributes;)Z

    .line 13
    .line 14
    .line 15
    move-result p1

    .line 16
    if-nez p1, :cond_1

    .line 17
    .line 18
    const/4 p0, 0x0

    .line 19
    return p0

    .line 20
    :cond_1
    const/16 p1, 0x1e

    .line 21
    .line 22
    if-ne p0, p1, :cond_2

    .line 23
    .line 24
    sget-object p0, Ll/bmk0;->d:Ljava/lang/String;

    .line 25
    .line 26
    const-string p1, "Pixel"

    .line 27
    .line 28
    invoke-virtual {p0, p1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 29
    .line 30
    .line 31
    move-result p0

    .line 32
    if-eqz p0, :cond_2

    .line 33
    .line 34
    const/4 p0, 0x2

    .line 35
    return p0

    .line 36
    :cond_2
    const/4 p0, 0x1

    .line 37
    return p0
.end method

.method public final J()J
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->u:Lcom/google/android/exoplayer2/audio/DefaultAudioSink$g;

    .line 2
    .line 3
    iget v1, v0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink$g;->c:I

    .line 4
    .line 5
    if-nez v1, :cond_0

    .line 6
    .line 7
    iget-wide v1, p0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->G:J

    .line 8
    .line 9
    iget p0, v0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink$g;->b:I

    .line 10
    .line 11
    int-to-long v3, p0

    .line 12
    div-long/2addr v1, v3

    .line 13
    return-wide v1

    .line 14
    :cond_0
    iget-wide v0, p0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->H:J

    .line 15
    .line 16
    return-wide v0
.end method

.method public final K()J
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->u:Lcom/google/android/exoplayer2/audio/DefaultAudioSink$g;

    .line 2
    .line 3
    iget v1, v0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink$g;->c:I

    .line 4
    .line 5
    if-nez v1, :cond_0

    .line 6
    .line 7
    iget-wide v1, p0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->I:J

    .line 8
    .line 9
    iget p0, v0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink$g;->d:I

    .line 10
    .line 11
    int-to-long v3, p0

    .line 12
    div-long/2addr v1, v3

    .line 13
    return-wide v1

    .line 14
    :cond_0
    iget-wide v0, p0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->J:J

    .line 15
    .line 16
    return-wide v0
.end method

.method public final L()Z
    .locals 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer2/audio/AudioSink$InitializationException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->h:Ll/wt5;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/wt5;->d()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x0

    .line 8
    if-nez v0, :cond_0

    .line 9
    .line 10
    return v1

    .line 11
    :cond_0
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->C()Landroid/media/AudioTrack;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iput-object v0, p0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->w:Landroid/media/AudioTrack;

    .line 16
    .line 17
    invoke-static {v0}, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->O(Landroid/media/AudioTrack;)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-eqz v0, :cond_1

    .line 22
    .line 23
    iget-object v0, p0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->w:Landroid/media/AudioTrack;

    .line 24
    .line 25
    invoke-virtual {p0, v0}, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->T(Landroid/media/AudioTrack;)V

    .line 26
    .line 27
    .line 28
    iget v0, p0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->l:I

    .line 29
    .line 30
    const/4 v2, 0x3

    .line 31
    if-eq v0, v2, :cond_1

    .line 32
    .line 33
    iget-object v0, p0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->w:Landroid/media/AudioTrack;

    .line 34
    .line 35
    iget-object v2, p0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->u:Lcom/google/android/exoplayer2/audio/DefaultAudioSink$g;

    .line 36
    .line 37
    iget-object v2, v2, Lcom/google/android/exoplayer2/audio/DefaultAudioSink$g;->a:Lcom/google/android/exoplayer2/k;

    .line 38
    .line 39
    iget v3, v2, Lcom/google/android/exoplayer2/k;->B:I

    .line 40
    .line 41
    iget v2, v2, Lcom/google/android/exoplayer2/k;->C:I

    .line 42
    .line 43
    invoke-static {v0, v3, v2}, Ll/dmd;->a(Landroid/media/AudioTrack;II)V

    .line 44
    .line 45
    .line 46
    :cond_1
    sget v0, Ll/bmk0;->a:I

    .line 47
    .line 48
    const/16 v2, 0x1f

    .line 49
    .line 50
    if-lt v0, v2, :cond_2

    .line 51
    .line 52
    iget-object v2, p0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->r:Ll/bf80;

    .line 53
    .line 54
    if-eqz v2, :cond_2

    .line 55
    .line 56
    iget-object v3, p0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->w:Landroid/media/AudioTrack;

    .line 57
    .line 58
    invoke-static {v3, v2}, Lcom/google/android/exoplayer2/audio/DefaultAudioSink$c;->a(Landroid/media/AudioTrack;Ll/bf80;)V

    .line 59
    .line 60
    .line 61
    :cond_2
    iget-object v2, p0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->w:Landroid/media/AudioTrack;

    .line 62
    .line 63
    invoke-virtual {v2}, Landroid/media/AudioTrack;->getAudioSessionId()I

    .line 64
    .line 65
    .line 66
    move-result v2

    .line 67
    iput v2, p0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->Y:I

    .line 68
    .line 69
    iget-object v3, p0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->i:Lcom/google/android/exoplayer2/audio/d;

    .line 70
    .line 71
    iget-object v4, p0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->w:Landroid/media/AudioTrack;

    .line 72
    .line 73
    iget-object v2, p0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->u:Lcom/google/android/exoplayer2/audio/DefaultAudioSink$g;

    .line 74
    .line 75
    iget v5, v2, Lcom/google/android/exoplayer2/audio/DefaultAudioSink$g;->c:I

    .line 76
    .line 77
    const/4 v6, 0x2

    .line 78
    const/4 v9, 0x1

    .line 79
    if-ne v5, v6, :cond_3

    .line 80
    .line 81
    move v5, v9

    .line 82
    goto :goto_0

    .line 83
    :cond_3
    move v5, v1

    .line 84
    :goto_0
    iget v6, v2, Lcom/google/android/exoplayer2/audio/DefaultAudioSink$g;->g:I

    .line 85
    .line 86
    iget v7, v2, Lcom/google/android/exoplayer2/audio/DefaultAudioSink$g;->d:I

    .line 87
    .line 88
    iget v8, v2, Lcom/google/android/exoplayer2/audio/DefaultAudioSink$g;->h:I

    .line 89
    .line 90
    invoke-virtual/range {v3 .. v8}, Lcom/google/android/exoplayer2/audio/d;->r(Landroid/media/AudioTrack;ZIII)V

    .line 91
    .line 92
    .line 93
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->Y()V

    .line 94
    .line 95
    .line 96
    iget-object v1, p0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->Z:Ll/wj1;

    .line 97
    .line 98
    iget v1, v1, Ll/wj1;->a:I

    .line 99
    .line 100
    if-eqz v1, :cond_4

    .line 101
    .line 102
    iget-object v2, p0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->w:Landroid/media/AudioTrack;

    .line 103
    .line 104
    invoke-virtual {v2, v1}, Landroid/media/AudioTrack;->attachAuxEffect(I)I

    .line 105
    .line 106
    .line 107
    iget-object v1, p0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->w:Landroid/media/AudioTrack;

    .line 108
    .line 109
    iget-object v2, p0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->Z:Ll/wj1;

    .line 110
    .line 111
    iget v2, v2, Ll/wj1;->b:F

    .line 112
    .line 113
    invoke-virtual {v1, v2}, Landroid/media/AudioTrack;->setAuxEffectSendLevel(F)I

    .line 114
    .line 115
    .line 116
    :cond_4
    iget-object v1, p0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->a0:Lcom/google/android/exoplayer2/audio/DefaultAudioSink$d;

    .line 117
    .line 118
    if-eqz v1, :cond_5

    .line 119
    .line 120
    const/16 v2, 0x17

    .line 121
    .line 122
    if-lt v0, v2, :cond_5

    .line 123
    .line 124
    iget-object v0, p0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->w:Landroid/media/AudioTrack;

    .line 125
    .line 126
    invoke-static {v0, v1}, Lcom/google/android/exoplayer2/audio/DefaultAudioSink$b;->a(Landroid/media/AudioTrack;Lcom/google/android/exoplayer2/audio/DefaultAudioSink$d;)V

    .line 127
    .line 128
    .line 129
    :cond_5
    iput-boolean v9, p0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->M:Z

    .line 130
    .line 131
    return v9
.end method

.method public final N()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->w:Landroid/media/AudioTrack;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    return p0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    return p0
.end method

.method public final P()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->u:Lcom/google/android/exoplayer2/audio/DefaultAudioSink$g;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/google/android/exoplayer2/audio/DefaultAudioSink$g;->l()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    const/4 v0, 0x1

    .line 11
    iput-boolean v0, p0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->e0:Z

    .line 12
    .line 13
    return-void
.end method

.method public Q(Ll/ha1;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->g0:Landroid/os/Looper;

    .line 2
    .line 3
    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    if-ne v0, v1, :cond_0

    .line 8
    .line 9
    const/4 v0, 0x1

    .line 10
    goto :goto_0

    .line 11
    :cond_0
    const/4 v0, 0x0

    .line 12
    :goto_0
    invoke-static {v0}, Ll/w11;->g(Z)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->E()Ll/ha1;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-virtual {p1, v0}, Ll/ha1;->equals(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-nez v0, :cond_1

    .line 24
    .line 25
    iput-object p1, p0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->x:Ll/ha1;

    .line 26
    .line 27
    iget-object p0, p0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->s:Lcom/google/android/exoplayer2/audio/AudioSink$a;

    .line 28
    .line 29
    if-eqz p0, :cond_1

    .line 30
    .line 31
    invoke-interface {p0}, Lcom/google/android/exoplayer2/audio/AudioSink$a;->e()V

    .line 32
    .line 33
    .line 34
    :cond_1
    return-void
.end method

.method public final R()V
    .locals 3

    .line 1
    iget-boolean v0, p0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->V:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    iput-boolean v0, p0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->V:Z

    .line 7
    .line 8
    iget-object v0, p0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->i:Lcom/google/android/exoplayer2/audio/d;

    .line 9
    .line 10
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->K()J

    .line 11
    .line 12
    .line 13
    move-result-wide v1

    .line 14
    invoke-virtual {v0, v1, v2}, Lcom/google/android/exoplayer2/audio/d;->f(J)V

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->w:Landroid/media/AudioTrack;

    .line 18
    .line 19
    invoke-virtual {v0}, Landroid/media/AudioTrack;->stop()V

    .line 20
    .line 21
    .line 22
    const/4 v0, 0x0

    .line 23
    iput v0, p0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->F:I

    .line 24
    .line 25
    :cond_0
    return-void
.end method

.method public final S(J)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer2/audio/AudioSink$WriteException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->v:Lcom/google/android/exoplayer2/audio/b;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/google/android/exoplayer2/audio/b;->f()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_1

    .line 8
    .line 9
    iget-object v0, p0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->P:Ljava/nio/ByteBuffer;

    .line 10
    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    sget-object v0, Lcom/google/android/exoplayer2/audio/AudioProcessor;->a:Ljava/nio/ByteBuffer;

    .line 15
    .line 16
    :goto_0
    invoke-virtual {p0, v0, p1, p2}, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->g0(Ljava/nio/ByteBuffer;J)V

    .line 17
    .line 18
    .line 19
    return-void

    .line 20
    :cond_1
    :goto_1
    iget-object v0, p0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->v:Lcom/google/android/exoplayer2/audio/b;

    .line 21
    .line 22
    invoke-virtual {v0}, Lcom/google/android/exoplayer2/audio/b;->e()Z

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    if-nez v0, :cond_5

    .line 27
    .line 28
    :cond_2
    iget-object v0, p0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->v:Lcom/google/android/exoplayer2/audio/b;

    .line 29
    .line 30
    invoke-virtual {v0}, Lcom/google/android/exoplayer2/audio/b;->d()Ljava/nio/ByteBuffer;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    invoke-virtual {v0}, Ljava/nio/Buffer;->hasRemaining()Z

    .line 35
    .line 36
    .line 37
    move-result v1

    .line 38
    if-eqz v1, :cond_3

    .line 39
    .line 40
    invoke-virtual {p0, v0, p1, p2}, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->g0(Ljava/nio/ByteBuffer;J)V

    .line 41
    .line 42
    .line 43
    invoke-virtual {v0}, Ljava/nio/Buffer;->hasRemaining()Z

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    if-eqz v0, :cond_2

    .line 48
    .line 49
    goto :goto_2

    .line 50
    :cond_3
    iget-object v0, p0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->P:Ljava/nio/ByteBuffer;

    .line 51
    .line 52
    if-eqz v0, :cond_5

    .line 53
    .line 54
    invoke-virtual {v0}, Ljava/nio/Buffer;->hasRemaining()Z

    .line 55
    .line 56
    .line 57
    move-result v0

    .line 58
    if-nez v0, :cond_4

    .line 59
    .line 60
    goto :goto_2

    .line 61
    :cond_4
    iget-object v0, p0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->v:Lcom/google/android/exoplayer2/audio/b;

    .line 62
    .line 63
    iget-object v1, p0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->P:Ljava/nio/ByteBuffer;

    .line 64
    .line 65
    invoke-virtual {v0, v1}, Lcom/google/android/exoplayer2/audio/b;->i(Ljava/nio/ByteBuffer;)V

    .line 66
    .line 67
    .line 68
    goto :goto_1

    .line 69
    :cond_5
    :goto_2
    return-void
.end method

.method public final T(Landroid/media/AudioTrack;)V
    .locals 1
    .annotation build Landroidx/annotation/RequiresApi;
        value = 0x1d
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->m:Lcom/google/android/exoplayer2/audio/DefaultAudioSink$l;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink$l;

    .line 6
    .line 7
    invoke-direct {v0, p0}, Lcom/google/android/exoplayer2/audio/DefaultAudioSink$l;-><init>(Lcom/google/android/exoplayer2/audio/DefaultAudioSink;)V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->m:Lcom/google/android/exoplayer2/audio/DefaultAudioSink$l;

    .line 11
    .line 12
    :cond_0
    iget-object p0, p0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->m:Lcom/google/android/exoplayer2/audio/DefaultAudioSink$l;

    .line 13
    .line 14
    invoke-virtual {p0, p1}, Lcom/google/android/exoplayer2/audio/DefaultAudioSink$l;->a(Landroid/media/AudioTrack;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public final V()V
    .locals 10

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    iput-wide v0, p0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->G:J

    .line 4
    .line 5
    iput-wide v0, p0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->H:J

    .line 6
    .line 7
    iput-wide v0, p0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->I:J

    .line 8
    .line 9
    iput-wide v0, p0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->J:J

    .line 10
    .line 11
    const/4 v2, 0x0

    .line 12
    iput-boolean v2, p0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->f0:Z

    .line 13
    .line 14
    iput v2, p0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->K:I

    .line 15
    .line 16
    new-instance v3, Lcom/google/android/exoplayer2/audio/DefaultAudioSink$i;

    .line 17
    .line 18
    iget-object v4, p0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->C:Lcom/google/android/exoplayer2/s;

    .line 19
    .line 20
    const-wide/16 v7, 0x0

    .line 21
    .line 22
    const/4 v9, 0x0

    .line 23
    const-wide/16 v5, 0x0

    .line 24
    .line 25
    invoke-direct/range {v3 .. v9}, Lcom/google/android/exoplayer2/audio/DefaultAudioSink$i;-><init>(Lcom/google/android/exoplayer2/s;JJLcom/google/android/exoplayer2/audio/DefaultAudioSink$a;)V

    .line 26
    .line 27
    .line 28
    iput-object v3, p0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->B:Lcom/google/android/exoplayer2/audio/DefaultAudioSink$i;

    .line 29
    .line 30
    iput-wide v0, p0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->N:J

    .line 31
    .line 32
    const/4 v0, 0x0

    .line 33
    iput-object v0, p0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->A:Lcom/google/android/exoplayer2/audio/DefaultAudioSink$i;

    .line 34
    .line 35
    iget-object v1, p0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->j:Ljava/util/ArrayDeque;

    .line 36
    .line 37
    invoke-virtual {v1}, Ljava/util/ArrayDeque;->clear()V

    .line 38
    .line 39
    .line 40
    iput-object v0, p0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->P:Ljava/nio/ByteBuffer;

    .line 41
    .line 42
    iput v2, p0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->Q:I

    .line 43
    .line 44
    iput-object v0, p0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->R:Ljava/nio/ByteBuffer;

    .line 45
    .line 46
    iput-boolean v2, p0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->V:Z

    .line 47
    .line 48
    iput-boolean v2, p0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->U:Z

    .line 49
    .line 50
    iput-object v0, p0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->E:Ljava/nio/ByteBuffer;

    .line 51
    .line 52
    iput v2, p0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->F:I

    .line 53
    .line 54
    iget-object v0, p0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->e:Lcom/google/android/exoplayer2/audio/m;

    .line 55
    .line 56
    invoke-virtual {v0}, Lcom/google/android/exoplayer2/audio/m;->i()V

    .line 57
    .line 58
    .line 59
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->b0()V

    .line 60
    .line 61
    .line 62
    return-void
.end method

.method public final W(Lcom/google/android/exoplayer2/s;)V
    .locals 7

    .line 1
    new-instance v0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink$i;

    .line 2
    .line 3
    const-wide v4, -0x7fffffffffffffffL    # -4.9E-324

    .line 4
    .line 5
    .line 6
    .line 7
    .line 8
    const/4 v6, 0x0

    .line 9
    const-wide v2, -0x7fffffffffffffffL    # -4.9E-324

    .line 10
    .line 11
    .line 12
    .line 13
    .line 14
    move-object v1, p1

    .line 15
    invoke-direct/range {v0 .. v6}, Lcom/google/android/exoplayer2/audio/DefaultAudioSink$i;-><init>(Lcom/google/android/exoplayer2/s;JJLcom/google/android/exoplayer2/audio/DefaultAudioSink$a;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->N()Z

    .line 19
    .line 20
    .line 21
    move-result p1

    .line 22
    if-eqz p1, :cond_0

    .line 23
    .line 24
    iput-object v0, p0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->A:Lcom/google/android/exoplayer2/audio/DefaultAudioSink$i;

    .line 25
    .line 26
    return-void

    .line 27
    :cond_0
    iput-object v0, p0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->B:Lcom/google/android/exoplayer2/audio/DefaultAudioSink$i;

    .line 28
    .line 29
    return-void
.end method

.method public final X()V
    .locals 3
    .annotation build Landroidx/annotation/RequiresApi;
        value = 0x17
    .end annotation

    .line 1
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->N()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    new-instance v0, Landroid/media/PlaybackParams;

    .line 8
    .line 9
    invoke-direct {v0}, Landroid/media/PlaybackParams;-><init>()V

    .line 10
    .line 11
    .line 12
    invoke-virtual {v0}, Landroid/media/PlaybackParams;->allowDefaults()Landroid/media/PlaybackParams;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    iget-object v1, p0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->C:Lcom/google/android/exoplayer2/s;

    .line 17
    .line 18
    iget v1, v1, Lcom/google/android/exoplayer2/s;->a:F

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Landroid/media/PlaybackParams;->setSpeed(F)Landroid/media/PlaybackParams;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    iget-object v1, p0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->C:Lcom/google/android/exoplayer2/s;

    .line 25
    .line 26
    iget v1, v1, Lcom/google/android/exoplayer2/s;->b:F

    .line 27
    .line 28
    invoke-virtual {v0, v1}, Landroid/media/PlaybackParams;->setPitch(F)Landroid/media/PlaybackParams;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    const/4 v1, 0x2

    .line 33
    invoke-virtual {v0, v1}, Landroid/media/PlaybackParams;->setAudioFallbackMode(I)Landroid/media/PlaybackParams;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    :try_start_0
    iget-object v1, p0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->w:Landroid/media/AudioTrack;

    .line 38
    .line 39
    invoke-virtual {v1, v0}, Landroid/media/AudioTrack;->setPlaybackParams(Landroid/media/PlaybackParams;)V
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    .line 40
    .line 41
    .line 42
    goto :goto_0

    .line 43
    :catch_0
    move-exception v0

    .line 44
    const-string v1, "DefaultAudioSink"

    .line 45
    .line 46
    const-string v2, "Failed to set playback params"

    .line 47
    .line 48
    invoke-static {v1, v2, v0}, Ll/kyv;->j(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 49
    .line 50
    .line 51
    :goto_0
    new-instance v0, Lcom/google/android/exoplayer2/s;

    .line 52
    .line 53
    iget-object v1, p0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->w:Landroid/media/AudioTrack;

    .line 54
    .line 55
    invoke-virtual {v1}, Landroid/media/AudioTrack;->getPlaybackParams()Landroid/media/PlaybackParams;

    .line 56
    .line 57
    .line 58
    move-result-object v1

    .line 59
    invoke-virtual {v1}, Landroid/media/PlaybackParams;->getSpeed()F

    .line 60
    .line 61
    .line 62
    move-result v1

    .line 63
    iget-object v2, p0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->w:Landroid/media/AudioTrack;

    .line 64
    .line 65
    invoke-virtual {v2}, Landroid/media/AudioTrack;->getPlaybackParams()Landroid/media/PlaybackParams;

    .line 66
    .line 67
    .line 68
    move-result-object v2

    .line 69
    invoke-virtual {v2}, Landroid/media/PlaybackParams;->getPitch()F

    .line 70
    .line 71
    .line 72
    move-result v2

    .line 73
    invoke-direct {v0, v1, v2}, Lcom/google/android/exoplayer2/s;-><init>(FF)V

    .line 74
    .line 75
    .line 76
    iput-object v0, p0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->C:Lcom/google/android/exoplayer2/s;

    .line 77
    .line 78
    iget-object p0, p0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->i:Lcom/google/android/exoplayer2/audio/d;

    .line 79
    .line 80
    iget v0, v0, Lcom/google/android/exoplayer2/s;->a:F

    .line 81
    .line 82
    invoke-virtual {p0, v0}, Lcom/google/android/exoplayer2/audio/d;->s(F)V

    .line 83
    .line 84
    .line 85
    :cond_0
    return-void
.end method

.method public final Y()V
    .locals 3

    .line 1
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->N()Z

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
    sget v0, Ll/bmk0;->a:I

    .line 9
    .line 10
    iget-object v1, p0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->w:Landroid/media/AudioTrack;

    .line 11
    .line 12
    const/16 v2, 0x15

    .line 13
    .line 14
    if-lt v0, v2, :cond_1

    .line 15
    .line 16
    iget p0, p0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->O:F

    .line 17
    .line 18
    invoke-static {v1, p0}, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->Z(Landroid/media/AudioTrack;F)V

    .line 19
    .line 20
    .line 21
    return-void

    .line 22
    :cond_1
    iget p0, p0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->O:F

    .line 23
    .line 24
    invoke-static {v1, p0}, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->a0(Landroid/media/AudioTrack;F)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public a(Lcom/google/android/exoplayer2/k;)Z
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->j(Lcom/google/android/exoplayer2/k;)I

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

.method public b()V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->b0:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    iput-boolean v0, p0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->b0:Z

    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->flush()V

    .line 9
    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method public final b0()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->u:Lcom/google/android/exoplayer2/audio/DefaultAudioSink$g;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink$g;->i:Lcom/google/android/exoplayer2/audio/b;

    .line 4
    .line 5
    iput-object v0, p0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->v:Lcom/google/android/exoplayer2/audio/b;

    .line 6
    .line 7
    invoke-virtual {v0}, Lcom/google/android/exoplayer2/audio/b;->b()V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public c()Z
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->N()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    iget-boolean v0, p0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->U:Z

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->g()Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    if-nez p0, :cond_0

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    const/4 p0, 0x0

    .line 19
    return p0

    .line 20
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 21
    return p0
.end method

.method public final c0()Z
    .locals 2

    .line 1
    iget-boolean v0, p0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->b0:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->u:Lcom/google/android/exoplayer2/audio/DefaultAudioSink$g;

    .line 6
    .line 7
    iget v1, v0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink$g;->c:I

    .line 8
    .line 9
    if-nez v1, :cond_0

    .line 10
    .line 11
    iget-object v0, v0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink$g;->a:Lcom/google/android/exoplayer2/k;

    .line 12
    .line 13
    iget v0, v0, Lcom/google/android/exoplayer2/k;->A:I

    .line 14
    .line 15
    invoke-virtual {p0, v0}, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->d0(I)Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    if-nez p0, :cond_0

    .line 20
    .line 21
    const/4 p0, 0x1

    .line 22
    return p0

    .line 23
    :cond_0
    const/4 p0, 0x0

    .line 24
    return p0
.end method

.method public d(Lcom/google/android/exoplayer2/audio/a;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->z:Lcom/google/android/exoplayer2/audio/a;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Lcom/google/android/exoplayer2/audio/a;->equals(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    iput-object p1, p0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->z:Lcom/google/android/exoplayer2/audio/a;

    .line 11
    .line 12
    iget-boolean p1, p0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->b0:Z

    .line 13
    .line 14
    if-eqz p1, :cond_1

    .line 15
    .line 16
    :goto_0
    return-void

    .line 17
    :cond_1
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->flush()V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public final d0(I)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->c:Z

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-static {p1}, Ll/bmk0;->B0(I)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-eqz p0, :cond_0

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

.method public e()V
    .locals 8

    .line 1
    sget v0, Ll/bmk0;->a:I

    .line 2
    .line 3
    const/16 v1, 0x19

    .line 4
    .line 5
    if-ge v0, v1, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->flush()V

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    iget-object v0, p0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->o:Lcom/google/android/exoplayer2/audio/DefaultAudioSink$j;

    .line 12
    .line 13
    invoke-virtual {v0}, Lcom/google/android/exoplayer2/audio/DefaultAudioSink$j;->a()V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->n:Lcom/google/android/exoplayer2/audio/DefaultAudioSink$j;

    .line 17
    .line 18
    invoke-virtual {v0}, Lcom/google/android/exoplayer2/audio/DefaultAudioSink$j;->a()V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->N()Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-nez v0, :cond_1

    .line 26
    .line 27
    return-void

    .line 28
    :cond_1
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->V()V

    .line 29
    .line 30
    .line 31
    iget-object v0, p0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->i:Lcom/google/android/exoplayer2/audio/d;

    .line 32
    .line 33
    invoke-virtual {v0}, Lcom/google/android/exoplayer2/audio/d;->h()Z

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    if-eqz v0, :cond_2

    .line 38
    .line 39
    iget-object v0, p0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->w:Landroid/media/AudioTrack;

    .line 40
    .line 41
    invoke-virtual {v0}, Landroid/media/AudioTrack;->pause()V

    .line 42
    .line 43
    .line 44
    :cond_2
    iget-object v0, p0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->w:Landroid/media/AudioTrack;

    .line 45
    .line 46
    invoke-virtual {v0}, Landroid/media/AudioTrack;->flush()V

    .line 47
    .line 48
    .line 49
    iget-object v0, p0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->i:Lcom/google/android/exoplayer2/audio/d;

    .line 50
    .line 51
    invoke-virtual {v0}, Lcom/google/android/exoplayer2/audio/d;->p()V

    .line 52
    .line 53
    .line 54
    iget-object v1, p0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->i:Lcom/google/android/exoplayer2/audio/d;

    .line 55
    .line 56
    iget-object v2, p0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->w:Landroid/media/AudioTrack;

    .line 57
    .line 58
    iget-object v0, p0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->u:Lcom/google/android/exoplayer2/audio/DefaultAudioSink$g;

    .line 59
    .line 60
    iget v3, v0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink$g;->c:I

    .line 61
    .line 62
    const/4 v4, 0x2

    .line 63
    const/4 v7, 0x1

    .line 64
    if-ne v3, v4, :cond_3

    .line 65
    .line 66
    move v3, v7

    .line 67
    goto :goto_0

    .line 68
    :cond_3
    const/4 v3, 0x0

    .line 69
    :goto_0
    iget v4, v0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink$g;->g:I

    .line 70
    .line 71
    iget v5, v0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink$g;->d:I

    .line 72
    .line 73
    iget v6, v0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink$g;->h:I

    .line 74
    .line 75
    invoke-virtual/range {v1 .. v6}, Lcom/google/android/exoplayer2/audio/d;->r(Landroid/media/AudioTrack;ZIII)V

    .line 76
    .line 77
    .line 78
    iput-boolean v7, p0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->M:Z

    .line 79
    .line 80
    return-void
.end method

.method public final e0()Z
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->u:Lcom/google/android/exoplayer2/audio/DefaultAudioSink$g;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    iget-boolean p0, p0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink$g;->j:Z

    .line 6
    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    sget p0, Ll/bmk0;->a:I

    .line 10
    .line 11
    const/16 v0, 0x17

    .line 12
    .line 13
    if-lt p0, v0, :cond_0

    .line 14
    .line 15
    const/4 p0, 0x1

    .line 16
    return p0

    .line 17
    :cond_0
    const/4 p0, 0x0

    .line 18
    return p0
.end method

.method public f()V
    .locals 3

    .line 1
    sget v0, Ll/bmk0;->a:I

    .line 2
    .line 3
    const/16 v1, 0x15

    .line 4
    .line 5
    const/4 v2, 0x1

    .line 6
    if-lt v0, v1, :cond_0

    .line 7
    .line 8
    move v0, v2

    .line 9
    goto :goto_0

    .line 10
    :cond_0
    const/4 v0, 0x0

    .line 11
    :goto_0
    invoke-static {v0}, Ll/w11;->g(Z)V

    .line 12
    .line 13
    .line 14
    iget-boolean v0, p0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->X:Z

    .line 15
    .line 16
    invoke-static {v0}, Ll/w11;->g(Z)V

    .line 17
    .line 18
    .line 19
    iget-boolean v0, p0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->b0:Z

    .line 20
    .line 21
    if-nez v0, :cond_1

    .line 22
    .line 23
    iput-boolean v2, p0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->b0:Z

    .line 24
    .line 25
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->flush()V

    .line 26
    .line 27
    .line 28
    :cond_1
    return-void
.end method

.method public final f0(Lcom/google/android/exoplayer2/k;Lcom/google/android/exoplayer2/audio/a;)Z
    .locals 4

    .line 1
    sget v0, Ll/bmk0;->a:I

    .line 2
    .line 3
    const/16 v1, 0x1d

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    if-lt v0, v1, :cond_a

    .line 7
    .line 8
    iget v0, p0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->l:I

    .line 9
    .line 10
    if-nez v0, :cond_0

    .line 11
    .line 12
    goto :goto_4

    .line 13
    :cond_0
    iget-object v0, p1, Lcom/google/android/exoplayer2/k;->l:Ljava/lang/String;

    .line 14
    .line 15
    invoke-static {v0}, Ll/w11;->e(Ljava/lang/Object;)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    check-cast v0, Ljava/lang/String;

    .line 20
    .line 21
    iget-object v1, p1, Lcom/google/android/exoplayer2/k;->i:Ljava/lang/String;

    .line 22
    .line 23
    invoke-static {v0, v1}, Ll/kb00;->f(Ljava/lang/String;Ljava/lang/String;)I

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-nez v0, :cond_1

    .line 28
    .line 29
    return v2

    .line 30
    :cond_1
    iget v1, p1, Lcom/google/android/exoplayer2/k;->y:I

    .line 31
    .line 32
    invoke-static {v1}, Ll/bmk0;->H(I)I

    .line 33
    .line 34
    .line 35
    move-result v1

    .line 36
    if-nez v1, :cond_2

    .line 37
    .line 38
    return v2

    .line 39
    :cond_2
    iget v3, p1, Lcom/google/android/exoplayer2/k;->z:I

    .line 40
    .line 41
    invoke-static {v3, v1, v0}, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->F(III)Landroid/media/AudioFormat;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    invoke-virtual {p2}, Lcom/google/android/exoplayer2/audio/a;->b()Lcom/google/android/exoplayer2/audio/a$d;

    .line 46
    .line 47
    .line 48
    move-result-object p2

    .line 49
    iget-object p2, p2, Lcom/google/android/exoplayer2/audio/a$d;->a:Landroid/media/AudioAttributes;

    .line 50
    .line 51
    invoke-virtual {p0, v0, p2}, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->I(Landroid/media/AudioFormat;Landroid/media/AudioAttributes;)I

    .line 52
    .line 53
    .line 54
    move-result p2

    .line 55
    if-eqz p2, :cond_a

    .line 56
    .line 57
    const/4 v0, 0x1

    .line 58
    if-eq p2, v0, :cond_4

    .line 59
    .line 60
    const/4 p0, 0x2

    .line 61
    if-ne p2, p0, :cond_3

    .line 62
    .line 63
    return v0

    .line 64
    :cond_3
    invoke-static {}, Ll/wpg0;->a()V

    .line 65
    .line 66
    .line 67
    return v2

    .line 68
    :cond_4
    iget p2, p1, Lcom/google/android/exoplayer2/k;->B:I

    .line 69
    .line 70
    if-nez p2, :cond_6

    .line 71
    .line 72
    iget p1, p1, Lcom/google/android/exoplayer2/k;->C:I

    .line 73
    .line 74
    if-eqz p1, :cond_5

    .line 75
    .line 76
    goto :goto_0

    .line 77
    :cond_5
    move p1, v2

    .line 78
    goto :goto_1

    .line 79
    :cond_6
    :goto_0
    move p1, v0

    .line 80
    :goto_1
    iget p0, p0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->l:I

    .line 81
    .line 82
    if-ne p0, v0, :cond_7

    .line 83
    .line 84
    move p0, v0

    .line 85
    goto :goto_2

    .line 86
    :cond_7
    move p0, v2

    .line 87
    :goto_2
    if-eqz p1, :cond_9

    .line 88
    .line 89
    if-nez p0, :cond_8

    .line 90
    .line 91
    goto :goto_3

    .line 92
    :cond_8
    return v2

    .line 93
    :cond_9
    :goto_3
    return v0

    .line 94
    :cond_a
    :goto_4
    return v2
.end method

.method public flush()V
    .locals 3

    .line 1
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->N()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_4

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->V()V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->i:Lcom/google/android/exoplayer2/audio/d;

    .line 11
    .line 12
    invoke-virtual {v0}, Lcom/google/android/exoplayer2/audio/d;->h()Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-eqz v0, :cond_0

    .line 17
    .line 18
    iget-object v0, p0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->w:Landroid/media/AudioTrack;

    .line 19
    .line 20
    invoke-virtual {v0}, Landroid/media/AudioTrack;->pause()V

    .line 21
    .line 22
    .line 23
    :cond_0
    iget-object v0, p0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->w:Landroid/media/AudioTrack;

    .line 24
    .line 25
    invoke-static {v0}, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->O(Landroid/media/AudioTrack;)Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-eqz v0, :cond_1

    .line 30
    .line 31
    iget-object v0, p0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->m:Lcom/google/android/exoplayer2/audio/DefaultAudioSink$l;

    .line 32
    .line 33
    invoke-static {v0}, Ll/w11;->e(Ljava/lang/Object;)Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    check-cast v0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink$l;

    .line 38
    .line 39
    iget-object v1, p0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->w:Landroid/media/AudioTrack;

    .line 40
    .line 41
    invoke-virtual {v0, v1}, Lcom/google/android/exoplayer2/audio/DefaultAudioSink$l;->b(Landroid/media/AudioTrack;)V

    .line 42
    .line 43
    .line 44
    :cond_1
    sget v0, Ll/bmk0;->a:I

    .line 45
    .line 46
    const/16 v1, 0x15

    .line 47
    .line 48
    if-ge v0, v1, :cond_2

    .line 49
    .line 50
    iget-boolean v0, p0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->X:Z

    .line 51
    .line 52
    if-nez v0, :cond_2

    .line 53
    .line 54
    const/4 v0, 0x0

    .line 55
    iput v0, p0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->Y:I

    .line 56
    .line 57
    :cond_2
    iget-object v0, p0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->t:Lcom/google/android/exoplayer2/audio/DefaultAudioSink$g;

    .line 58
    .line 59
    const/4 v1, 0x0

    .line 60
    if-eqz v0, :cond_3

    .line 61
    .line 62
    iput-object v0, p0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->u:Lcom/google/android/exoplayer2/audio/DefaultAudioSink$g;

    .line 63
    .line 64
    iput-object v1, p0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->t:Lcom/google/android/exoplayer2/audio/DefaultAudioSink$g;

    .line 65
    .line 66
    :cond_3
    iget-object v0, p0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->i:Lcom/google/android/exoplayer2/audio/d;

    .line 67
    .line 68
    invoke-virtual {v0}, Lcom/google/android/exoplayer2/audio/d;->p()V

    .line 69
    .line 70
    .line 71
    iget-object v0, p0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->w:Landroid/media/AudioTrack;

    .line 72
    .line 73
    iget-object v2, p0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->h:Ll/wt5;

    .line 74
    .line 75
    invoke-static {v0, v2}, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->U(Landroid/media/AudioTrack;Ll/wt5;)V

    .line 76
    .line 77
    .line 78
    iput-object v1, p0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->w:Landroid/media/AudioTrack;

    .line 79
    .line 80
    :cond_4
    iget-object v0, p0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->o:Lcom/google/android/exoplayer2/audio/DefaultAudioSink$j;

    .line 81
    .line 82
    invoke-virtual {v0}, Lcom/google/android/exoplayer2/audio/DefaultAudioSink$j;->a()V

    .line 83
    .line 84
    .line 85
    iget-object p0, p0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->n:Lcom/google/android/exoplayer2/audio/DefaultAudioSink$j;

    .line 86
    .line 87
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/audio/DefaultAudioSink$j;->a()V

    .line 88
    .line 89
    .line 90
    return-void
.end method

.method public g()Z
    .locals 3

    .line 1
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->N()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->i:Lcom/google/android/exoplayer2/audio/d;

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->K()J

    .line 10
    .line 11
    .line 12
    move-result-wide v1

    .line 13
    invoke-virtual {v0, v1, v2}, Lcom/google/android/exoplayer2/audio/d;->g(J)Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    if-eqz p0, :cond_0

    .line 18
    .line 19
    const/4 p0, 0x1

    .line 20
    return p0

    .line 21
    :cond_0
    const/4 p0, 0x0

    .line 22
    return p0
.end method

.method public final g0(Ljava/nio/ByteBuffer;J)V
    .locals 12
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer2/audio/AudioSink$WriteException;
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/nio/Buffer;->hasRemaining()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    goto/16 :goto_9

    .line 8
    .line 9
    :cond_0
    iget-object v0, p0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->R:Ljava/nio/ByteBuffer;

    .line 10
    .line 11
    const/16 v1, 0x15

    .line 12
    .line 13
    const/4 v2, 0x1

    .line 14
    const/4 v3, 0x0

    .line 15
    if-eqz v0, :cond_2

    .line 16
    .line 17
    if-ne v0, p1, :cond_1

    .line 18
    .line 19
    move v0, v2

    .line 20
    goto :goto_0

    .line 21
    :cond_1
    move v0, v3

    .line 22
    :goto_0
    invoke-static {v0}, Ll/w11;->a(Z)V

    .line 23
    .line 24
    .line 25
    goto :goto_1

    .line 26
    :cond_2
    iput-object p1, p0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->R:Ljava/nio/ByteBuffer;

    .line 27
    .line 28
    sget v0, Ll/bmk0;->a:I

    .line 29
    .line 30
    if-ge v0, v1, :cond_5

    .line 31
    .line 32
    invoke-virtual {p1}, Ljava/nio/Buffer;->remaining()I

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    iget-object v4, p0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->S:[B

    .line 37
    .line 38
    if-eqz v4, :cond_3

    .line 39
    .line 40
    array-length v4, v4

    .line 41
    if-ge v4, v0, :cond_4

    .line 42
    .line 43
    :cond_3
    new-array v4, v0, [B

    .line 44
    .line 45
    iput-object v4, p0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->S:[B

    .line 46
    .line 47
    :cond_4
    invoke-virtual {p1}, Ljava/nio/Buffer;->position()I

    .line 48
    .line 49
    .line 50
    move-result v4

    .line 51
    iget-object v5, p0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->S:[B

    .line 52
    .line 53
    invoke-virtual {p1, v5, v3, v0}, Ljava/nio/ByteBuffer;->get([BII)Ljava/nio/ByteBuffer;

    .line 54
    .line 55
    .line 56
    invoke-virtual {p1, v4}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 57
    .line 58
    .line 59
    iput v3, p0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->T:I

    .line 60
    .line 61
    :cond_5
    :goto_1
    invoke-virtual {p1}, Ljava/nio/Buffer;->remaining()I

    .line 62
    .line 63
    .line 64
    move-result v9

    .line 65
    sget v0, Ll/bmk0;->a:I

    .line 66
    .line 67
    if-ge v0, v1, :cond_8

    .line 68
    .line 69
    iget-object p2, p0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->i:Lcom/google/android/exoplayer2/audio/d;

    .line 70
    .line 71
    iget-wide v0, p0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->I:J

    .line 72
    .line 73
    invoke-virtual {p2, v0, v1}, Lcom/google/android/exoplayer2/audio/d;->b(J)I

    .line 74
    .line 75
    .line 76
    move-result p2

    .line 77
    if-lez p2, :cond_6

    .line 78
    .line 79
    invoke-static {v9, p2}, Ljava/lang/Math;->min(II)I

    .line 80
    .line 81
    .line 82
    move-result p2

    .line 83
    iget-object p3, p0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->w:Landroid/media/AudioTrack;

    .line 84
    .line 85
    iget-object v0, p0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->S:[B

    .line 86
    .line 87
    iget v1, p0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->T:I

    .line 88
    .line 89
    invoke-virtual {p3, v0, v1, p2}, Landroid/media/AudioTrack;->write([BII)I

    .line 90
    .line 91
    .line 92
    move-result p2

    .line 93
    if-lez p2, :cond_7

    .line 94
    .line 95
    iget p3, p0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->T:I

    .line 96
    .line 97
    add-int/2addr p3, p2

    .line 98
    iput p3, p0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->T:I

    .line 99
    .line 100
    invoke-virtual {p1}, Ljava/nio/Buffer;->position()I

    .line 101
    .line 102
    .line 103
    move-result p3

    .line 104
    add-int/2addr p3, p2

    .line 105
    invoke-virtual {p1, p3}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 106
    .line 107
    .line 108
    goto :goto_2

    .line 109
    :cond_6
    move p2, v3

    .line 110
    :cond_7
    :goto_2
    move-object v6, p0

    .line 111
    move-object v8, p1

    .line 112
    goto :goto_6

    .line 113
    :cond_8
    iget-boolean v0, p0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->b0:Z

    .line 114
    .line 115
    if-eqz v0, :cond_b

    .line 116
    .line 117
    const-wide v0, -0x7fffffffffffffffL    # -4.9E-324

    .line 118
    .line 119
    .line 120
    .line 121
    .line 122
    cmp-long v0, p2, v0

    .line 123
    .line 124
    if-eqz v0, :cond_9

    .line 125
    .line 126
    move v0, v2

    .line 127
    goto :goto_3

    .line 128
    :cond_9
    move v0, v3

    .line 129
    :goto_3
    invoke-static {v0}, Ll/w11;->g(Z)V

    .line 130
    .line 131
    .line 132
    const-wide/high16 v0, -0x8000000000000000L

    .line 133
    .line 134
    cmp-long v0, p2, v0

    .line 135
    .line 136
    if-nez v0, :cond_a

    .line 137
    .line 138
    iget-wide p2, p0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->c0:J

    .line 139
    .line 140
    :goto_4
    move-wide v10, p2

    .line 141
    goto :goto_5

    .line 142
    :cond_a
    iput-wide p2, p0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->c0:J

    .line 143
    .line 144
    goto :goto_4

    .line 145
    :goto_5
    iget-object v7, p0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->w:Landroid/media/AudioTrack;

    .line 146
    .line 147
    move-object v6, p0

    .line 148
    move-object v8, p1

    .line 149
    invoke-virtual/range {v6 .. v11}, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->i0(Landroid/media/AudioTrack;Ljava/nio/ByteBuffer;IJ)I

    .line 150
    .line 151
    .line 152
    move-result p2

    .line 153
    goto :goto_6

    .line 154
    :cond_b
    move-object v6, p0

    .line 155
    move-object v8, p1

    .line 156
    iget-object p0, v6, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->w:Landroid/media/AudioTrack;

    .line 157
    .line 158
    invoke-static {p0, v8, v9}, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->h0(Landroid/media/AudioTrack;Ljava/nio/ByteBuffer;I)I

    .line 159
    .line 160
    .line 161
    move-result p2

    .line 162
    :goto_6
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 163
    .line 164
    .line 165
    move-result-wide p0

    .line 166
    iput-wide p0, v6, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->d0:J

    .line 167
    .line 168
    const-wide/16 p0, 0x0

    .line 169
    .line 170
    if-gez p2, :cond_f

    .line 171
    .line 172
    invoke-static {p2}, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->M(I)Z

    .line 173
    .line 174
    .line 175
    move-result p3

    .line 176
    if-eqz p3, :cond_c

    .line 177
    .line 178
    iget-wide v0, v6, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->J:J

    .line 179
    .line 180
    cmp-long p0, v0, p0

    .line 181
    .line 182
    if-lez p0, :cond_c

    .line 183
    .line 184
    goto :goto_7

    .line 185
    :cond_c
    move v2, v3

    .line 186
    :goto_7
    new-instance p0, Lcom/google/android/exoplayer2/audio/AudioSink$WriteException;

    .line 187
    .line 188
    iget-object p1, v6, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->u:Lcom/google/android/exoplayer2/audio/DefaultAudioSink$g;

    .line 189
    .line 190
    iget-object p1, p1, Lcom/google/android/exoplayer2/audio/DefaultAudioSink$g;->a:Lcom/google/android/exoplayer2/k;

    .line 191
    .line 192
    invoke-direct {p0, p2, p1, v2}, Lcom/google/android/exoplayer2/audio/AudioSink$WriteException;-><init>(ILcom/google/android/exoplayer2/k;Z)V

    .line 193
    .line 194
    .line 195
    iget-object p1, v6, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->s:Lcom/google/android/exoplayer2/audio/AudioSink$a;

    .line 196
    .line 197
    if-eqz p1, :cond_d

    .line 198
    .line 199
    invoke-interface {p1, p0}, Lcom/google/android/exoplayer2/audio/AudioSink$a;->b(Ljava/lang/Exception;)V

    .line 200
    .line 201
    .line 202
    :cond_d
    iget-boolean p1, p0, Lcom/google/android/exoplayer2/audio/AudioSink$WriteException;->isRecoverable:Z

    .line 203
    .line 204
    if-nez p1, :cond_e

    .line 205
    .line 206
    iget-object p1, v6, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->o:Lcom/google/android/exoplayer2/audio/DefaultAudioSink$j;

    .line 207
    .line 208
    invoke-virtual {p1, p0}, Lcom/google/android/exoplayer2/audio/DefaultAudioSink$j;->b(Ljava/lang/Exception;)V

    .line 209
    .line 210
    .line 211
    return-void

    .line 212
    :cond_e
    sget-object p1, Ll/ha1;->c:Ll/ha1;

    .line 213
    .line 214
    iput-object p1, v6, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->x:Ll/ha1;

    .line 215
    .line 216
    throw p0

    .line 217
    :cond_f
    iget-object p3, v6, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->o:Lcom/google/android/exoplayer2/audio/DefaultAudioSink$j;

    .line 218
    .line 219
    invoke-virtual {p3}, Lcom/google/android/exoplayer2/audio/DefaultAudioSink$j;->a()V

    .line 220
    .line 221
    .line 222
    iget-object p3, v6, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->w:Landroid/media/AudioTrack;

    .line 223
    .line 224
    invoke-static {p3}, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->O(Landroid/media/AudioTrack;)Z

    .line 225
    .line 226
    .line 227
    move-result p3

    .line 228
    if-eqz p3, :cond_11

    .line 229
    .line 230
    iget-wide v0, v6, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->J:J

    .line 231
    .line 232
    cmp-long p0, v0, p0

    .line 233
    .line 234
    if-lez p0, :cond_10

    .line 235
    .line 236
    iput-boolean v3, v6, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->f0:Z

    .line 237
    .line 238
    :cond_10
    iget-boolean p0, v6, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->W:Z

    .line 239
    .line 240
    if-eqz p0, :cond_11

    .line 241
    .line 242
    iget-object p0, v6, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->s:Lcom/google/android/exoplayer2/audio/AudioSink$a;

    .line 243
    .line 244
    if-eqz p0, :cond_11

    .line 245
    .line 246
    if-ge p2, v9, :cond_11

    .line 247
    .line 248
    iget-boolean p1, v6, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->f0:Z

    .line 249
    .line 250
    if-nez p1, :cond_11

    .line 251
    .line 252
    invoke-interface {p0}, Lcom/google/android/exoplayer2/audio/AudioSink$a;->f()V

    .line 253
    .line 254
    .line 255
    :cond_11
    iget-object p0, v6, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->u:Lcom/google/android/exoplayer2/audio/DefaultAudioSink$g;

    .line 256
    .line 257
    iget p0, p0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink$g;->c:I

    .line 258
    .line 259
    if-nez p0, :cond_12

    .line 260
    .line 261
    iget-wide v0, v6, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->I:J

    .line 262
    .line 263
    int-to-long v4, p2

    .line 264
    add-long/2addr v0, v4

    .line 265
    iput-wide v0, v6, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->I:J

    .line 266
    .line 267
    :cond_12
    if-ne p2, v9, :cond_15

    .line 268
    .line 269
    if-eqz p0, :cond_14

    .line 270
    .line 271
    iget-object p0, v6, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->P:Ljava/nio/ByteBuffer;

    .line 272
    .line 273
    if-ne v8, p0, :cond_13

    .line 274
    .line 275
    goto :goto_8

    .line 276
    :cond_13
    move v2, v3

    .line 277
    :goto_8
    invoke-static {v2}, Ll/w11;->g(Z)V

    .line 278
    .line 279
    .line 280
    iget-wide p0, v6, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->J:J

    .line 281
    .line 282
    iget p2, v6, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->K:I

    .line 283
    .line 284
    int-to-long p2, p2

    .line 285
    iget v0, v6, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->Q:I

    .line 286
    .line 287
    int-to-long v0, v0

    .line 288
    mul-long/2addr p2, v0

    .line 289
    add-long/2addr p0, p2

    .line 290
    iput-wide p0, v6, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->J:J

    .line 291
    .line 292
    :cond_14
    const/4 p0, 0x0

    .line 293
    iput-object p0, v6, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->R:Ljava/nio/ByteBuffer;

    .line 294
    .line 295
    :cond_15
    :goto_9
    return-void
.end method

.method public getPlaybackParameters()Lcom/google/android/exoplayer2/s;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->C:Lcom/google/android/exoplayer2/s;

    .line 2
    .line 3
    return-object p0
.end method

.method public h(Ljava/nio/ByteBuffer;JI)Z
    .locals 17
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer2/audio/AudioSink$InitializationException;,
            Lcom/google/android/exoplayer2/audio/AudioSink$WriteException;
        }
    .end annotation

    .line 1
    move-object/from16 v1, p0

    .line 2
    .line 3
    move-object/from16 v0, p1

    .line 4
    .line 5
    move-wide/from16 v2, p2

    .line 6
    .line 7
    move/from16 v4, p4

    .line 8
    .line 9
    iget-object v5, v1, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->P:Ljava/nio/ByteBuffer;

    .line 10
    .line 11
    const/4 v6, 0x1

    .line 12
    const/4 v7, 0x0

    .line 13
    if-eqz v5, :cond_1

    .line 14
    .line 15
    if-ne v0, v5, :cond_0

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    move v5, v7

    .line 19
    goto :goto_1

    .line 20
    :cond_1
    :goto_0
    move v5, v6

    .line 21
    :goto_1
    invoke-static {v5}, Ll/w11;->a(Z)V

    .line 22
    .line 23
    .line 24
    iget-object v5, v1, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->t:Lcom/google/android/exoplayer2/audio/DefaultAudioSink$g;

    .line 25
    .line 26
    const/4 v8, 0x0

    .line 27
    if-eqz v5, :cond_7

    .line 28
    .line 29
    invoke-virtual {v1}, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->D()Z

    .line 30
    .line 31
    .line 32
    move-result v5

    .line 33
    if-nez v5, :cond_2

    .line 34
    .line 35
    return v7

    .line 36
    :cond_2
    iget-object v5, v1, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->t:Lcom/google/android/exoplayer2/audio/DefaultAudioSink$g;

    .line 37
    .line 38
    iget-object v9, v1, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->u:Lcom/google/android/exoplayer2/audio/DefaultAudioSink$g;

    .line 39
    .line 40
    invoke-virtual {v5, v9}, Lcom/google/android/exoplayer2/audio/DefaultAudioSink$g;->b(Lcom/google/android/exoplayer2/audio/DefaultAudioSink$g;)Z

    .line 41
    .line 42
    .line 43
    move-result v5

    .line 44
    if-nez v5, :cond_4

    .line 45
    .line 46
    invoke-virtual {v1}, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->R()V

    .line 47
    .line 48
    .line 49
    invoke-virtual {v1}, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->g()Z

    .line 50
    .line 51
    .line 52
    move-result v5

    .line 53
    if-eqz v5, :cond_3

    .line 54
    .line 55
    return v7

    .line 56
    :cond_3
    invoke-virtual {v1}, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->flush()V

    .line 57
    .line 58
    .line 59
    goto :goto_2

    .line 60
    :cond_4
    iget-object v5, v1, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->t:Lcom/google/android/exoplayer2/audio/DefaultAudioSink$g;

    .line 61
    .line 62
    iput-object v5, v1, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->u:Lcom/google/android/exoplayer2/audio/DefaultAudioSink$g;

    .line 63
    .line 64
    iput-object v8, v1, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->t:Lcom/google/android/exoplayer2/audio/DefaultAudioSink$g;

    .line 65
    .line 66
    iget-object v5, v1, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->w:Landroid/media/AudioTrack;

    .line 67
    .line 68
    invoke-static {v5}, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->O(Landroid/media/AudioTrack;)Z

    .line 69
    .line 70
    .line 71
    move-result v5

    .line 72
    if-eqz v5, :cond_6

    .line 73
    .line 74
    iget v5, v1, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->l:I

    .line 75
    .line 76
    const/4 v9, 0x3

    .line 77
    if-eq v5, v9, :cond_6

    .line 78
    .line 79
    iget-object v5, v1, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->w:Landroid/media/AudioTrack;

    .line 80
    .line 81
    invoke-virtual {v5}, Landroid/media/AudioTrack;->getPlayState()I

    .line 82
    .line 83
    .line 84
    move-result v5

    .line 85
    if-ne v5, v9, :cond_5

    .line 86
    .line 87
    iget-object v5, v1, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->w:Landroid/media/AudioTrack;

    .line 88
    .line 89
    invoke-static {v5}, Ll/cmd;->a(Landroid/media/AudioTrack;)V

    .line 90
    .line 91
    .line 92
    :cond_5
    iget-object v5, v1, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->w:Landroid/media/AudioTrack;

    .line 93
    .line 94
    iget-object v9, v1, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->u:Lcom/google/android/exoplayer2/audio/DefaultAudioSink$g;

    .line 95
    .line 96
    iget-object v9, v9, Lcom/google/android/exoplayer2/audio/DefaultAudioSink$g;->a:Lcom/google/android/exoplayer2/k;

    .line 97
    .line 98
    iget v10, v9, Lcom/google/android/exoplayer2/k;->B:I

    .line 99
    .line 100
    iget v9, v9, Lcom/google/android/exoplayer2/k;->C:I

    .line 101
    .line 102
    invoke-static {v5, v10, v9}, Ll/dmd;->a(Landroid/media/AudioTrack;II)V

    .line 103
    .line 104
    .line 105
    iput-boolean v6, v1, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->f0:Z

    .line 106
    .line 107
    :cond_6
    :goto_2
    invoke-virtual {v1, v2, v3}, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->y(J)V

    .line 108
    .line 109
    .line 110
    :cond_7
    invoke-virtual {v1}, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->N()Z

    .line 111
    .line 112
    .line 113
    move-result v5

    .line 114
    if-nez v5, :cond_9

    .line 115
    .line 116
    :try_start_0
    invoke-virtual {v1}, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->L()Z

    .line 117
    .line 118
    .line 119
    move-result v5
    :try_end_0
    .catch Lcom/google/android/exoplayer2/audio/AudioSink$InitializationException; {:try_start_0 .. :try_end_0} :catch_0

    .line 120
    if-nez v5, :cond_9

    .line 121
    .line 122
    return v7

    .line 123
    :catch_0
    move-exception v0

    .line 124
    iget-boolean v2, v0, Lcom/google/android/exoplayer2/audio/AudioSink$InitializationException;->isRecoverable:Z

    .line 125
    .line 126
    if-nez v2, :cond_8

    .line 127
    .line 128
    iget-object v1, v1, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->n:Lcom/google/android/exoplayer2/audio/DefaultAudioSink$j;

    .line 129
    .line 130
    invoke-virtual {v1, v0}, Lcom/google/android/exoplayer2/audio/DefaultAudioSink$j;->b(Ljava/lang/Exception;)V

    .line 131
    .line 132
    .line 133
    return v7

    .line 134
    :cond_8
    throw v0

    .line 135
    :cond_9
    iget-object v5, v1, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->n:Lcom/google/android/exoplayer2/audio/DefaultAudioSink$j;

    .line 136
    .line 137
    invoke-virtual {v5}, Lcom/google/android/exoplayer2/audio/DefaultAudioSink$j;->a()V

    .line 138
    .line 139
    .line 140
    iget-boolean v5, v1, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->M:Z

    .line 141
    .line 142
    const-wide/16 v9, 0x0

    .line 143
    .line 144
    if-eqz v5, :cond_b

    .line 145
    .line 146
    invoke-static {v9, v10, v2, v3}, Ljava/lang/Math;->max(JJ)J

    .line 147
    .line 148
    .line 149
    move-result-wide v11

    .line 150
    iput-wide v11, v1, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->N:J

    .line 151
    .line 152
    iput-boolean v7, v1, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->L:Z

    .line 153
    .line 154
    iput-boolean v7, v1, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->M:Z

    .line 155
    .line 156
    invoke-virtual {v1}, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->e0()Z

    .line 157
    .line 158
    .line 159
    move-result v5

    .line 160
    if-eqz v5, :cond_a

    .line 161
    .line 162
    invoke-virtual {v1}, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->X()V

    .line 163
    .line 164
    .line 165
    :cond_a
    invoke-virtual {v1, v2, v3}, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->y(J)V

    .line 166
    .line 167
    .line 168
    iget-boolean v5, v1, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->W:Z

    .line 169
    .line 170
    if-eqz v5, :cond_b

    .line 171
    .line 172
    invoke-virtual {v1}, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->play()V

    .line 173
    .line 174
    .line 175
    :cond_b
    iget-object v5, v1, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->i:Lcom/google/android/exoplayer2/audio/d;

    .line 176
    .line 177
    invoke-virtual {v1}, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->K()J

    .line 178
    .line 179
    .line 180
    move-result-wide v11

    .line 181
    invoke-virtual {v5, v11, v12}, Lcom/google/android/exoplayer2/audio/d;->j(J)Z

    .line 182
    .line 183
    .line 184
    move-result v5

    .line 185
    if-nez v5, :cond_c

    .line 186
    .line 187
    return v7

    .line 188
    :cond_c
    iget-object v5, v1, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->P:Ljava/nio/ByteBuffer;

    .line 189
    .line 190
    if-nez v5, :cond_17

    .line 191
    .line 192
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->order()Ljava/nio/ByteOrder;

    .line 193
    .line 194
    .line 195
    move-result-object v5

    .line 196
    sget-object v11, Ljava/nio/ByteOrder;->LITTLE_ENDIAN:Ljava/nio/ByteOrder;

    .line 197
    .line 198
    if-ne v5, v11, :cond_d

    .line 199
    .line 200
    move v5, v6

    .line 201
    goto :goto_3

    .line 202
    :cond_d
    move v5, v7

    .line 203
    :goto_3
    invoke-static {v5}, Ll/w11;->a(Z)V

    .line 204
    .line 205
    .line 206
    invoke-virtual {v0}, Ljava/nio/Buffer;->hasRemaining()Z

    .line 207
    .line 208
    .line 209
    move-result v5

    .line 210
    if-nez v5, :cond_e

    .line 211
    .line 212
    return v6

    .line 213
    :cond_e
    iget-object v5, v1, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->u:Lcom/google/android/exoplayer2/audio/DefaultAudioSink$g;

    .line 214
    .line 215
    iget v11, v5, Lcom/google/android/exoplayer2/audio/DefaultAudioSink$g;->c:I

    .line 216
    .line 217
    if-eqz v11, :cond_f

    .line 218
    .line 219
    iget v11, v1, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->K:I

    .line 220
    .line 221
    if-nez v11, :cond_f

    .line 222
    .line 223
    iget v5, v5, Lcom/google/android/exoplayer2/audio/DefaultAudioSink$g;->g:I

    .line 224
    .line 225
    invoke-static {v5, v0}, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->H(ILjava/nio/ByteBuffer;)I

    .line 226
    .line 227
    .line 228
    move-result v5

    .line 229
    iput v5, v1, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->K:I

    .line 230
    .line 231
    if-nez v5, :cond_f

    .line 232
    .line 233
    return v6

    .line 234
    :cond_f
    iget-object v5, v1, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->A:Lcom/google/android/exoplayer2/audio/DefaultAudioSink$i;

    .line 235
    .line 236
    if-eqz v5, :cond_11

    .line 237
    .line 238
    invoke-virtual {v1}, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->D()Z

    .line 239
    .line 240
    .line 241
    move-result v5

    .line 242
    if-nez v5, :cond_10

    .line 243
    .line 244
    return v7

    .line 245
    :cond_10
    invoke-virtual {v1, v2, v3}, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->y(J)V

    .line 246
    .line 247
    .line 248
    iput-object v8, v1, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->A:Lcom/google/android/exoplayer2/audio/DefaultAudioSink$i;

    .line 249
    .line 250
    :cond_11
    iget-wide v11, v1, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->N:J

    .line 251
    .line 252
    iget-object v5, v1, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->u:Lcom/google/android/exoplayer2/audio/DefaultAudioSink$g;

    .line 253
    .line 254
    invoke-virtual {v1}, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->J()J

    .line 255
    .line 256
    .line 257
    move-result-wide v13

    .line 258
    iget-object v15, v1, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->e:Lcom/google/android/exoplayer2/audio/m;

    .line 259
    .line 260
    invoke-virtual {v15}, Lcom/google/android/exoplayer2/audio/m;->h()J

    .line 261
    .line 262
    .line 263
    move-result-wide v15

    .line 264
    sub-long/2addr v13, v15

    .line 265
    invoke-virtual {v5, v13, v14}, Lcom/google/android/exoplayer2/audio/DefaultAudioSink$g;->k(J)J

    .line 266
    .line 267
    .line 268
    move-result-wide v13

    .line 269
    add-long/2addr v11, v13

    .line 270
    iget-boolean v5, v1, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->L:Z

    .line 271
    .line 272
    if-nez v5, :cond_13

    .line 273
    .line 274
    sub-long v13, v11, v2

    .line 275
    .line 276
    invoke-static {v13, v14}, Ljava/lang/Math;->abs(J)J

    .line 277
    .line 278
    .line 279
    move-result-wide v13

    .line 280
    const-wide/32 v15, 0x30d40

    .line 281
    .line 282
    .line 283
    cmp-long v5, v13, v15

    .line 284
    .line 285
    if-lez v5, :cond_13

    .line 286
    .line 287
    iget-object v5, v1, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->s:Lcom/google/android/exoplayer2/audio/AudioSink$a;

    .line 288
    .line 289
    if-eqz v5, :cond_12

    .line 290
    .line 291
    new-instance v13, Lcom/google/android/exoplayer2/audio/AudioSink$UnexpectedDiscontinuityException;

    .line 292
    .line 293
    invoke-direct {v13, v2, v3, v11, v12}, Lcom/google/android/exoplayer2/audio/AudioSink$UnexpectedDiscontinuityException;-><init>(JJ)V

    .line 294
    .line 295
    .line 296
    invoke-interface {v5, v13}, Lcom/google/android/exoplayer2/audio/AudioSink$a;->b(Ljava/lang/Exception;)V

    .line 297
    .line 298
    .line 299
    :cond_12
    iput-boolean v6, v1, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->L:Z

    .line 300
    .line 301
    :cond_13
    iget-boolean v5, v1, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->L:Z

    .line 302
    .line 303
    if-eqz v5, :cond_15

    .line 304
    .line 305
    invoke-virtual {v1}, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->D()Z

    .line 306
    .line 307
    .line 308
    move-result v5

    .line 309
    if-nez v5, :cond_14

    .line 310
    .line 311
    return v7

    .line 312
    :cond_14
    sub-long v11, v2, v11

    .line 313
    .line 314
    iget-wide v13, v1, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->N:J

    .line 315
    .line 316
    add-long/2addr v13, v11

    .line 317
    iput-wide v13, v1, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->N:J

    .line 318
    .line 319
    iput-boolean v7, v1, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->L:Z

    .line 320
    .line 321
    invoke-virtual {v1, v2, v3}, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->y(J)V

    .line 322
    .line 323
    .line 324
    iget-object v5, v1, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->s:Lcom/google/android/exoplayer2/audio/AudioSink$a;

    .line 325
    .line 326
    if-eqz v5, :cond_15

    .line 327
    .line 328
    cmp-long v9, v11, v9

    .line 329
    .line 330
    if-eqz v9, :cond_15

    .line 331
    .line 332
    invoke-interface {v5}, Lcom/google/android/exoplayer2/audio/AudioSink$a;->g()V

    .line 333
    .line 334
    .line 335
    :cond_15
    iget-object v5, v1, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->u:Lcom/google/android/exoplayer2/audio/DefaultAudioSink$g;

    .line 336
    .line 337
    iget v5, v5, Lcom/google/android/exoplayer2/audio/DefaultAudioSink$g;->c:I

    .line 338
    .line 339
    if-nez v5, :cond_16

    .line 340
    .line 341
    iget-wide v9, v1, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->G:J

    .line 342
    .line 343
    invoke-virtual {v0}, Ljava/nio/Buffer;->remaining()I

    .line 344
    .line 345
    .line 346
    move-result v5

    .line 347
    int-to-long v11, v5

    .line 348
    add-long/2addr v9, v11

    .line 349
    iput-wide v9, v1, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->G:J

    .line 350
    .line 351
    goto :goto_4

    .line 352
    :cond_16
    iget-wide v9, v1, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->H:J

    .line 353
    .line 354
    iget v5, v1, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->K:I

    .line 355
    .line 356
    int-to-long v11, v5

    .line 357
    int-to-long v13, v4

    .line 358
    mul-long/2addr v11, v13

    .line 359
    add-long/2addr v9, v11

    .line 360
    iput-wide v9, v1, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->H:J

    .line 361
    .line 362
    :goto_4
    iput-object v0, v1, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->P:Ljava/nio/ByteBuffer;

    .line 363
    .line 364
    iput v4, v1, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->Q:I

    .line 365
    .line 366
    :cond_17
    invoke-virtual {v1, v2, v3}, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->S(J)V

    .line 367
    .line 368
    .line 369
    iget-object v0, v1, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->P:Ljava/nio/ByteBuffer;

    .line 370
    .line 371
    invoke-virtual {v0}, Ljava/nio/Buffer;->hasRemaining()Z

    .line 372
    .line 373
    .line 374
    move-result v0

    .line 375
    if-nez v0, :cond_18

    .line 376
    .line 377
    iput-object v8, v1, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->P:Ljava/nio/ByteBuffer;

    .line 378
    .line 379
    iput v7, v1, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->Q:I

    .line 380
    .line 381
    return v6

    .line 382
    :cond_18
    iget-object v0, v1, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->i:Lcom/google/android/exoplayer2/audio/d;

    .line 383
    .line 384
    invoke-virtual {v1}, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->K()J

    .line 385
    .line 386
    .line 387
    move-result-wide v2

    .line 388
    invoke-virtual {v0, v2, v3}, Lcom/google/android/exoplayer2/audio/d;->i(J)Z

    .line 389
    .line 390
    .line 391
    move-result v0

    .line 392
    if-eqz v0, :cond_19

    .line 393
    .line 394
    const-string v0, "DefaultAudioSink"

    .line 395
    .line 396
    const-string v2, "Resetting stalled audio track"

    .line 397
    .line 398
    invoke-static {v0, v2}, Ll/kyv;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 399
    .line 400
    .line 401
    invoke-virtual {v1}, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->flush()V

    .line 402
    .line 403
    .line 404
    return v6

    .line 405
    :cond_19
    return v7
.end method

.method public i(Lcom/google/android/exoplayer2/audio/AudioSink$a;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->s:Lcom/google/android/exoplayer2/audio/AudioSink$a;

    .line 2
    .line 3
    return-void
.end method

.method public final i0(Landroid/media/AudioTrack;Ljava/nio/ByteBuffer;IJ)I
    .locals 6
    .annotation build Landroidx/annotation/RequiresApi;
        value = 0x15
    .end annotation

    .line 1
    sget v0, Ll/bmk0;->a:I

    .line 2
    .line 3
    const/16 v1, 0x1a

    .line 4
    .line 5
    const-wide/16 v2, 0x3e8

    .line 6
    .line 7
    if-lt v0, v1, :cond_0

    .line 8
    .line 9
    move-object p0, p1

    .line 10
    move-object p1, p2

    .line 11
    move p2, p3

    .line 12
    const/4 p3, 0x1

    .line 13
    mul-long/2addr p4, v2

    .line 14
    invoke-virtual/range {p0 .. p5}, Landroid/media/AudioTrack;->write(Ljava/nio/ByteBuffer;IIJ)I

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    return p0

    .line 19
    :cond_0
    move v5, p3

    .line 20
    move-object p3, p0

    .line 21
    move-object p0, p1

    .line 22
    move-object p1, p2

    .line 23
    move p2, v5

    .line 24
    iget-object v0, p3, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->E:Ljava/nio/ByteBuffer;

    .line 25
    .line 26
    if-nez v0, :cond_1

    .line 27
    .line 28
    const/16 v0, 0x10

    .line 29
    .line 30
    invoke-static {v0}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    iput-object v0, p3, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->E:Ljava/nio/ByteBuffer;

    .line 35
    .line 36
    sget-object v1, Ljava/nio/ByteOrder;->BIG_ENDIAN:Ljava/nio/ByteOrder;

    .line 37
    .line 38
    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 39
    .line 40
    .line 41
    iget-object v0, p3, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->E:Ljava/nio/ByteBuffer;

    .line 42
    .line 43
    const v1, 0x55550001

    .line 44
    .line 45
    .line 46
    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 47
    .line 48
    .line 49
    :cond_1
    iget v0, p3, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->F:I

    .line 50
    .line 51
    const/4 v1, 0x0

    .line 52
    if-nez v0, :cond_2

    .line 53
    .line 54
    iget-object v0, p3, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->E:Ljava/nio/ByteBuffer;

    .line 55
    .line 56
    const/4 v4, 0x4

    .line 57
    invoke-virtual {v0, v4, p2}, Ljava/nio/ByteBuffer;->putInt(II)Ljava/nio/ByteBuffer;

    .line 58
    .line 59
    .line 60
    iget-object v0, p3, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->E:Ljava/nio/ByteBuffer;

    .line 61
    .line 62
    const/16 v4, 0x8

    .line 63
    .line 64
    mul-long/2addr p4, v2

    .line 65
    invoke-virtual {v0, v4, p4, p5}, Ljava/nio/ByteBuffer;->putLong(IJ)Ljava/nio/ByteBuffer;

    .line 66
    .line 67
    .line 68
    iget-object p4, p3, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->E:Ljava/nio/ByteBuffer;

    .line 69
    .line 70
    invoke-virtual {p4, v1}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 71
    .line 72
    .line 73
    iput p2, p3, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->F:I

    .line 74
    .line 75
    :cond_2
    iget-object p4, p3, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->E:Ljava/nio/ByteBuffer;

    .line 76
    .line 77
    invoke-virtual {p4}, Ljava/nio/Buffer;->remaining()I

    .line 78
    .line 79
    .line 80
    move-result p4

    .line 81
    if-lez p4, :cond_4

    .line 82
    .line 83
    iget-object p5, p3, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->E:Ljava/nio/ByteBuffer;

    .line 84
    .line 85
    const/4 v0, 0x1

    .line 86
    invoke-virtual {p0, p5, p4, v0}, Landroid/media/AudioTrack;->write(Ljava/nio/ByteBuffer;II)I

    .line 87
    .line 88
    .line 89
    move-result p5

    .line 90
    if-gez p5, :cond_3

    .line 91
    .line 92
    iput v1, p3, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->F:I

    .line 93
    .line 94
    return p5

    .line 95
    :cond_3
    if-ge p5, p4, :cond_4

    .line 96
    .line 97
    return v1

    .line 98
    :cond_4
    invoke-static {p0, p1, p2}, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->h0(Landroid/media/AudioTrack;Ljava/nio/ByteBuffer;I)I

    .line 99
    .line 100
    .line 101
    move-result p0

    .line 102
    if-gez p0, :cond_5

    .line 103
    .line 104
    iput v1, p3, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->F:I

    .line 105
    .line 106
    return p0

    .line 107
    :cond_5
    iget p1, p3, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->F:I

    .line 108
    .line 109
    sub-int/2addr p1, p0

    .line 110
    iput p1, p3, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->F:I

    .line 111
    .line 112
    return p0
.end method

.method public j(Lcom/google/android/exoplayer2/k;)I
    .locals 3

    .line 1
    const-string v0, "audio/raw"

    .line 2
    .line 3
    iget-object v1, p1, Lcom/google/android/exoplayer2/k;->l:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    const/4 v1, 0x0

    .line 10
    const/4 v2, 0x2

    .line 11
    if-eqz v0, :cond_3

    .line 12
    .line 13
    iget v0, p1, Lcom/google/android/exoplayer2/k;->A:I

    .line 14
    .line 15
    invoke-static {v0}, Ll/bmk0;->C0(I)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    iget p1, p1, Lcom/google/android/exoplayer2/k;->A:I

    .line 20
    .line 21
    if-nez v0, :cond_0

    .line 22
    .line 23
    new-instance p0, Ljava/lang/StringBuilder;

    .line 24
    .line 25
    const-string v0, "Invalid PCM encoding: "

    .line 26
    .line 27
    invoke-direct {p0, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    const-string p1, "DefaultAudioSink"

    .line 38
    .line 39
    invoke-static {p1, p0}, Ll/kyv;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    return v1

    .line 43
    :cond_0
    if-eq p1, v2, :cond_2

    .line 44
    .line 45
    iget-boolean p0, p0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->c:Z

    .line 46
    .line 47
    if-eqz p0, :cond_1

    .line 48
    .line 49
    const/4 p0, 0x4

    .line 50
    if-ne p1, p0, :cond_1

    .line 51
    .line 52
    goto :goto_0

    .line 53
    :cond_1
    const/4 p0, 0x1

    .line 54
    return p0

    .line 55
    :cond_2
    :goto_0
    return v2

    .line 56
    :cond_3
    iget-boolean v0, p0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->e0:Z

    .line 57
    .line 58
    if-nez v0, :cond_4

    .line 59
    .line 60
    iget-object v0, p0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->z:Lcom/google/android/exoplayer2/audio/a;

    .line 61
    .line 62
    invoke-virtual {p0, p1, v0}, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->f0(Lcom/google/android/exoplayer2/k;Lcom/google/android/exoplayer2/audio/a;)Z

    .line 63
    .line 64
    .line 65
    move-result v0

    .line 66
    if-eqz v0, :cond_4

    .line 67
    .line 68
    return v2

    .line 69
    :cond_4
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->E()Ll/ha1;

    .line 70
    .line 71
    .line 72
    move-result-object p0

    .line 73
    invoke-virtual {p0, p1}, Ll/ha1;->i(Lcom/google/android/exoplayer2/k;)Z

    .line 74
    .line 75
    .line 76
    move-result p0

    .line 77
    if-eqz p0, :cond_5

    .line 78
    .line 79
    return v2

    .line 80
    :cond_5
    return v1
.end method

.method public k()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer2/audio/AudioSink$WriteException;
        }
    .end annotation

    .line 1
    iget-boolean v0, p0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->U:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->N()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->D()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->R()V

    .line 18
    .line 19
    .line 20
    const/4 v0, 0x1

    .line 21
    iput-boolean v0, p0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->U:Z

    .line 22
    .line 23
    :cond_0
    return-void
.end method

.method public l(Z)J
    .locals 4

    .line 1
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->N()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    iget-boolean v0, p0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->M:Z

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    iget-object v0, p0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->i:Lcom/google/android/exoplayer2/audio/d;

    .line 13
    .line 14
    invoke-virtual {v0, p1}, Lcom/google/android/exoplayer2/audio/d;->c(Z)J

    .line 15
    .line 16
    .line 17
    move-result-wide v0

    .line 18
    iget-object p1, p0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->u:Lcom/google/android/exoplayer2/audio/DefaultAudioSink$g;

    .line 19
    .line 20
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->K()J

    .line 21
    .line 22
    .line 23
    move-result-wide v2

    .line 24
    invoke-virtual {p1, v2, v3}, Lcom/google/android/exoplayer2/audio/DefaultAudioSink$g;->h(J)J

    .line 25
    .line 26
    .line 27
    move-result-wide v2

    .line 28
    invoke-static {v0, v1, v2, v3}, Ljava/lang/Math;->min(JJ)J

    .line 29
    .line 30
    .line 31
    move-result-wide v0

    .line 32
    invoke-virtual {p0, v0, v1}, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->z(J)J

    .line 33
    .line 34
    .line 35
    move-result-wide v0

    .line 36
    invoke-virtual {p0, v0, v1}, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->A(J)J

    .line 37
    .line 38
    .line 39
    move-result-wide p0

    .line 40
    return-wide p0

    .line 41
    :cond_1
    :goto_0
    const-wide/high16 p0, -0x8000000000000000L

    .line 42
    .line 43
    return-wide p0
.end method

.method public n()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->L:Z

    .line 3
    .line 4
    return-void
.end method

.method public o(Ll/bf80;)V
    .locals 0
    .param p1    # Ll/bf80;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    iput-object p1, p0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->r:Ll/bf80;

    .line 2
    .line 3
    return-void
.end method

.method public p(Lcom/google/android/exoplayer2/k;I[I)V
    .locals 21
    .param p3    # [I
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer2/audio/AudioSink$ConfigurationException;
        }
    .end annotation

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v2, p1

    .line 4
    .line 5
    const-string v1, "audio/raw"

    .line 6
    .line 7
    iget-object v3, v2, Lcom/google/android/exoplayer2/k;->l:Ljava/lang/String;

    .line 8
    .line 9
    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    const/4 v3, -0x1

    .line 14
    const/4 v4, 0x0

    .line 15
    const/4 v5, 0x1

    .line 16
    if-eqz v1, :cond_4

    .line 17
    .line 18
    iget v1, v2, Lcom/google/android/exoplayer2/k;->A:I

    .line 19
    .line 20
    invoke-static {v1}, Ll/bmk0;->C0(I)Z

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    invoke-static {v1}, Ll/w11;->a(Z)V

    .line 25
    .line 26
    .line 27
    iget v1, v2, Lcom/google/android/exoplayer2/k;->A:I

    .line 28
    .line 29
    iget v6, v2, Lcom/google/android/exoplayer2/k;->y:I

    .line 30
    .line 31
    invoke-static {v1, v6}, Ll/bmk0;->h0(II)I

    .line 32
    .line 33
    .line 34
    move-result v1

    .line 35
    new-instance v6, Lcom/google/common/collect/ImmutableList$a;

    .line 36
    .line 37
    invoke-direct {v6}, Lcom/google/common/collect/ImmutableList$a;-><init>()V

    .line 38
    .line 39
    .line 40
    iget v7, v2, Lcom/google/android/exoplayer2/k;->A:I

    .line 41
    .line 42
    invoke-virtual {v0, v7}, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->d0(I)Z

    .line 43
    .line 44
    .line 45
    move-result v7

    .line 46
    if-eqz v7, :cond_0

    .line 47
    .line 48
    iget-object v7, v0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->g:Lcom/google/common/collect/ImmutableList;

    .line 49
    .line 50
    invoke-virtual {v6, v7}, Lcom/google/common/collect/ImmutableList$a;->k(Ljava/lang/Iterable;)Lcom/google/common/collect/ImmutableList$a;

    .line 51
    .line 52
    .line 53
    goto :goto_0

    .line 54
    :cond_0
    iget-object v7, v0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->f:Lcom/google/common/collect/ImmutableList;

    .line 55
    .line 56
    invoke-virtual {v6, v7}, Lcom/google/common/collect/ImmutableList$a;->k(Ljava/lang/Iterable;)Lcom/google/common/collect/ImmutableList$a;

    .line 57
    .line 58
    .line 59
    iget-object v7, v0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->b:Ll/cc1;

    .line 60
    .line 61
    invoke-interface {v7}, Ll/cc1;->a()[Lcom/google/android/exoplayer2/audio/AudioProcessor;

    .line 62
    .line 63
    .line 64
    move-result-object v7

    .line 65
    invoke-virtual {v6, v7}, Lcom/google/common/collect/ImmutableList$a;->j([Ljava/lang/Object;)Lcom/google/common/collect/ImmutableList$a;

    .line 66
    .line 67
    .line 68
    :goto_0
    new-instance v7, Lcom/google/android/exoplayer2/audio/b;

    .line 69
    .line 70
    invoke-virtual {v6}, Lcom/google/common/collect/ImmutableList$a;->m()Lcom/google/common/collect/ImmutableList;

    .line 71
    .line 72
    .line 73
    move-result-object v6

    .line 74
    invoke-direct {v7, v6}, Lcom/google/android/exoplayer2/audio/b;-><init>(Lcom/google/common/collect/ImmutableList;)V

    .line 75
    .line 76
    .line 77
    iget-object v6, v0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->v:Lcom/google/android/exoplayer2/audio/b;

    .line 78
    .line 79
    invoke-virtual {v7, v6}, Lcom/google/android/exoplayer2/audio/b;->equals(Ljava/lang/Object;)Z

    .line 80
    .line 81
    .line 82
    move-result v6

    .line 83
    if-eqz v6, :cond_1

    .line 84
    .line 85
    iget-object v7, v0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->v:Lcom/google/android/exoplayer2/audio/b;

    .line 86
    .line 87
    :cond_1
    iget-object v6, v0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->e:Lcom/google/android/exoplayer2/audio/m;

    .line 88
    .line 89
    iget v8, v2, Lcom/google/android/exoplayer2/k;->B:I

    .line 90
    .line 91
    iget v9, v2, Lcom/google/android/exoplayer2/k;->C:I

    .line 92
    .line 93
    invoke-virtual {v6, v8, v9}, Lcom/google/android/exoplayer2/audio/m;->j(II)V

    .line 94
    .line 95
    .line 96
    sget v6, Ll/bmk0;->a:I

    .line 97
    .line 98
    const/16 v8, 0x15

    .line 99
    .line 100
    if-ge v6, v8, :cond_2

    .line 101
    .line 102
    iget v6, v2, Lcom/google/android/exoplayer2/k;->y:I

    .line 103
    .line 104
    const/16 v8, 0x8

    .line 105
    .line 106
    if-ne v6, v8, :cond_2

    .line 107
    .line 108
    if-nez p3, :cond_2

    .line 109
    .line 110
    const/4 v6, 0x6

    .line 111
    new-array v8, v6, [I

    .line 112
    .line 113
    move v9, v4

    .line 114
    :goto_1
    if-ge v9, v6, :cond_3

    .line 115
    .line 116
    aput v9, v8, v9

    .line 117
    .line 118
    add-int/lit8 v9, v9, 0x1

    .line 119
    .line 120
    goto :goto_1

    .line 121
    :cond_2
    move-object/from16 v8, p3

    .line 122
    .line 123
    :cond_3
    iget-object v6, v0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->d:Lcom/google/android/exoplayer2/audio/f;

    .line 124
    .line 125
    invoke-virtual {v6, v8}, Lcom/google/android/exoplayer2/audio/f;->h([I)V

    .line 126
    .line 127
    .line 128
    new-instance v6, Lcom/google/android/exoplayer2/audio/AudioProcessor$a;

    .line 129
    .line 130
    iget v8, v2, Lcom/google/android/exoplayer2/k;->z:I

    .line 131
    .line 132
    iget v9, v2, Lcom/google/android/exoplayer2/k;->y:I

    .line 133
    .line 134
    iget v10, v2, Lcom/google/android/exoplayer2/k;->A:I

    .line 135
    .line 136
    invoke-direct {v6, v8, v9, v10}, Lcom/google/android/exoplayer2/audio/AudioProcessor$a;-><init>(III)V

    .line 137
    .line 138
    .line 139
    :try_start_0
    invoke-virtual {v7, v6}, Lcom/google/android/exoplayer2/audio/b;->a(Lcom/google/android/exoplayer2/audio/AudioProcessor$a;)Lcom/google/android/exoplayer2/audio/AudioProcessor$a;

    .line 140
    .line 141
    .line 142
    move-result-object v6
    :try_end_0
    .catch Lcom/google/android/exoplayer2/audio/AudioProcessor$UnhandledAudioFormatException; {:try_start_0 .. :try_end_0} :catch_0

    .line 143
    iget v8, v6, Lcom/google/android/exoplayer2/audio/AudioProcessor$a;->c:I

    .line 144
    .line 145
    iget v9, v6, Lcom/google/android/exoplayer2/audio/AudioProcessor$a;->a:I

    .line 146
    .line 147
    iget v10, v6, Lcom/google/android/exoplayer2/audio/AudioProcessor$a;->b:I

    .line 148
    .line 149
    invoke-static {v10}, Ll/bmk0;->H(I)I

    .line 150
    .line 151
    .line 152
    move-result v10

    .line 153
    iget v6, v6, Lcom/google/android/exoplayer2/audio/AudioProcessor$a;->b:I

    .line 154
    .line 155
    invoke-static {v8, v6}, Ll/bmk0;->h0(II)I

    .line 156
    .line 157
    .line 158
    move-result v6

    .line 159
    iget-boolean v11, v0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->k:Z

    .line 160
    .line 161
    move v14, v10

    .line 162
    move-object v10, v7

    .line 163
    move v7, v14

    .line 164
    move v15, v4

    .line 165
    :goto_2
    move v14, v8

    .line 166
    goto :goto_3

    .line 167
    :catch_0
    move-exception v0

    .line 168
    new-instance v1, Lcom/google/android/exoplayer2/audio/AudioSink$ConfigurationException;

    .line 169
    .line 170
    invoke-direct {v1, v0, v2}, Lcom/google/android/exoplayer2/audio/AudioSink$ConfigurationException;-><init>(Ljava/lang/Throwable;Lcom/google/android/exoplayer2/k;)V

    .line 171
    .line 172
    .line 173
    throw v1

    .line 174
    :cond_4
    new-instance v7, Lcom/google/android/exoplayer2/audio/b;

    .line 175
    .line 176
    invoke-static {}, Lcom/google/common/collect/ImmutableList;->of()Lcom/google/common/collect/ImmutableList;

    .line 177
    .line 178
    .line 179
    move-result-object v1

    .line 180
    invoke-direct {v7, v1}, Lcom/google/android/exoplayer2/audio/b;-><init>(Lcom/google/common/collect/ImmutableList;)V

    .line 181
    .line 182
    .line 183
    iget v9, v2, Lcom/google/android/exoplayer2/k;->z:I

    .line 184
    .line 185
    iget-object v1, v0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->z:Lcom/google/android/exoplayer2/audio/a;

    .line 186
    .line 187
    invoke-virtual {v0, v2, v1}, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->f0(Lcom/google/android/exoplayer2/k;Lcom/google/android/exoplayer2/audio/a;)Z

    .line 188
    .line 189
    .line 190
    move-result v1

    .line 191
    if-eqz v1, :cond_5

    .line 192
    .line 193
    iget-object v1, v2, Lcom/google/android/exoplayer2/k;->l:Ljava/lang/String;

    .line 194
    .line 195
    invoke-static {v1}, Ll/w11;->e(Ljava/lang/Object;)Ljava/lang/Object;

    .line 196
    .line 197
    .line 198
    move-result-object v1

    .line 199
    check-cast v1, Ljava/lang/String;

    .line 200
    .line 201
    iget-object v6, v2, Lcom/google/android/exoplayer2/k;->i:Ljava/lang/String;

    .line 202
    .line 203
    invoke-static {v1, v6}, Ll/kb00;->f(Ljava/lang/String;Ljava/lang/String;)I

    .line 204
    .line 205
    .line 206
    move-result v8

    .line 207
    iget v1, v2, Lcom/google/android/exoplayer2/k;->y:I

    .line 208
    .line 209
    invoke-static {v1}, Ll/bmk0;->H(I)I

    .line 210
    .line 211
    .line 212
    move-result v10

    .line 213
    move v1, v10

    .line 214
    move-object v10, v7

    .line 215
    move v7, v1

    .line 216
    move v1, v3

    .line 217
    move v6, v1

    .line 218
    move v11, v5

    .line 219
    move v15, v11

    .line 220
    goto :goto_2

    .line 221
    :cond_5
    invoke-virtual {v0}, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->E()Ll/ha1;

    .line 222
    .line 223
    .line 224
    move-result-object v1

    .line 225
    invoke-virtual {v1, v2}, Ll/ha1;->f(Lcom/google/android/exoplayer2/k;)Landroid/util/Pair;

    .line 226
    .line 227
    .line 228
    move-result-object v1

    .line 229
    if-eqz v1, :cond_c

    .line 230
    .line 231
    iget-object v6, v1, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 232
    .line 233
    check-cast v6, Ljava/lang/Integer;

    .line 234
    .line 235
    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    .line 236
    .line 237
    .line 238
    move-result v8

    .line 239
    iget-object v1, v1, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 240
    .line 241
    check-cast v1, Ljava/lang/Integer;

    .line 242
    .line 243
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 244
    .line 245
    .line 246
    move-result v10

    .line 247
    iget-boolean v11, v0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->k:Z

    .line 248
    .line 249
    const/4 v1, 0x2

    .line 250
    move v6, v10

    .line 251
    move-object v10, v7

    .line 252
    move v7, v6

    .line 253
    move v15, v1

    .line 254
    move v1, v3

    .line 255
    move v6, v1

    .line 256
    goto :goto_2

    .line 257
    :goto_3
    const-string v8, ") for: "

    .line 258
    .line 259
    if-eqz v14, :cond_b

    .line 260
    .line 261
    if-eqz v7, :cond_a

    .line 262
    .line 263
    if-eqz p2, :cond_6

    .line 264
    .line 265
    move/from16 v17, v9

    .line 266
    .line 267
    move/from16 v9, p2

    .line 268
    .line 269
    goto :goto_7

    .line 270
    :cond_6
    iget-object v12, v0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->p:Lcom/google/android/exoplayer2/audio/DefaultAudioSink$e;

    .line 271
    .line 272
    invoke-static {v9, v7, v14}, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->G(III)I

    .line 273
    .line 274
    .line 275
    move-result v13

    .line 276
    if-eq v6, v3, :cond_7

    .line 277
    .line 278
    move/from16 v16, v6

    .line 279
    .line 280
    goto :goto_4

    .line 281
    :cond_7
    move/from16 v16, v5

    .line 282
    .line 283
    :goto_4
    iget v3, v2, Lcom/google/android/exoplayer2/k;->h:I

    .line 284
    .line 285
    if-eqz v11, :cond_8

    .line 286
    .line 287
    const-wide/high16 v17, 0x4020000000000000L    # 8.0

    .line 288
    .line 289
    :goto_5
    move-wide/from16 v19, v17

    .line 290
    .line 291
    move/from16 v18, v3

    .line 292
    .line 293
    move/from16 v17, v9

    .line 294
    .line 295
    goto :goto_6

    .line 296
    :cond_8
    const-wide/high16 v17, 0x3ff0000000000000L    # 1.0

    .line 297
    .line 298
    goto :goto_5

    .line 299
    :goto_6
    invoke-interface/range {v12 .. v20}, Lcom/google/android/exoplayer2/audio/DefaultAudioSink$e;->a(IIIIIID)I

    .line 300
    .line 301
    .line 302
    move-result v3

    .line 303
    move v9, v3

    .line 304
    :goto_7
    iput-boolean v4, v0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->e0:Z

    .line 305
    .line 306
    move v3, v1

    .line 307
    new-instance v1, Lcom/google/android/exoplayer2/audio/DefaultAudioSink$g;

    .line 308
    .line 309
    move v5, v6

    .line 310
    move v8, v14

    .line 311
    move v4, v15

    .line 312
    move/from16 v6, v17

    .line 313
    .line 314
    invoke-direct/range {v1 .. v11}, Lcom/google/android/exoplayer2/audio/DefaultAudioSink$g;-><init>(Lcom/google/android/exoplayer2/k;IIIIIIILcom/google/android/exoplayer2/audio/b;Z)V

    .line 315
    .line 316
    .line 317
    invoke-virtual {v0}, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->N()Z

    .line 318
    .line 319
    .line 320
    move-result v2

    .line 321
    if-eqz v2, :cond_9

    .line 322
    .line 323
    iput-object v1, v0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->t:Lcom/google/android/exoplayer2/audio/DefaultAudioSink$g;

    .line 324
    .line 325
    return-void

    .line 326
    :cond_9
    iput-object v1, v0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->u:Lcom/google/android/exoplayer2/audio/DefaultAudioSink$g;

    .line 327
    .line 328
    return-void

    .line 329
    :cond_a
    new-instance v0, Lcom/google/android/exoplayer2/audio/AudioSink$ConfigurationException;

    .line 330
    .line 331
    new-instance v1, Ljava/lang/StringBuilder;

    .line 332
    .line 333
    const-string v3, "Invalid output channel config (mode="

    .line 334
    .line 335
    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 336
    .line 337
    .line 338
    invoke-virtual {v1, v15}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 339
    .line 340
    .line 341
    invoke-virtual {v1, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 342
    .line 343
    .line 344
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 345
    .line 346
    .line 347
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 348
    .line 349
    .line 350
    move-result-object v1

    .line 351
    invoke-direct {v0, v1, v2}, Lcom/google/android/exoplayer2/audio/AudioSink$ConfigurationException;-><init>(Ljava/lang/String;Lcom/google/android/exoplayer2/k;)V

    .line 352
    .line 353
    .line 354
    throw v0

    .line 355
    :cond_b
    new-instance v0, Lcom/google/android/exoplayer2/audio/AudioSink$ConfigurationException;

    .line 356
    .line 357
    new-instance v1, Ljava/lang/StringBuilder;

    .line 358
    .line 359
    const-string v3, "Invalid output encoding (mode="

    .line 360
    .line 361
    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 362
    .line 363
    .line 364
    invoke-virtual {v1, v15}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 365
    .line 366
    .line 367
    invoke-virtual {v1, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 368
    .line 369
    .line 370
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 371
    .line 372
    .line 373
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 374
    .line 375
    .line 376
    move-result-object v1

    .line 377
    invoke-direct {v0, v1, v2}, Lcom/google/android/exoplayer2/audio/AudioSink$ConfigurationException;-><init>(Ljava/lang/String;Lcom/google/android/exoplayer2/k;)V

    .line 378
    .line 379
    .line 380
    throw v0

    .line 381
    :cond_c
    new-instance v0, Lcom/google/android/exoplayer2/audio/AudioSink$ConfigurationException;

    .line 382
    .line 383
    new-instance v1, Ljava/lang/StringBuilder;

    .line 384
    .line 385
    const-string v3, "Unable to configure passthrough for: "

    .line 386
    .line 387
    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 388
    .line 389
    .line 390
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 391
    .line 392
    .line 393
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 394
    .line 395
    .line 396
    move-result-object v1

    .line 397
    invoke-direct {v0, v1, v2}, Lcom/google/android/exoplayer2/audio/AudioSink$ConfigurationException;-><init>(Ljava/lang/String;Lcom/google/android/exoplayer2/k;)V

    .line 398
    .line 399
    .line 400
    throw v0
.end method

.method public pause()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->W:Z

    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->N()Z

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    iget-object v0, p0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->i:Lcom/google/android/exoplayer2/audio/d;

    .line 11
    .line 12
    invoke-virtual {v0}, Lcom/google/android/exoplayer2/audio/d;->o()Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-eqz v0, :cond_0

    .line 17
    .line 18
    iget-object p0, p0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->w:Landroid/media/AudioTrack;

    .line 19
    .line 20
    invoke-virtual {p0}, Landroid/media/AudioTrack;->pause()V

    .line 21
    .line 22
    .line 23
    :cond_0
    return-void
.end method

.method public play()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->W:Z

    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->N()Z

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    iget-object v0, p0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->i:Lcom/google/android/exoplayer2/audio/d;

    .line 11
    .line 12
    invoke-virtual {v0}, Lcom/google/android/exoplayer2/audio/d;->t()V

    .line 13
    .line 14
    .line 15
    iget-object p0, p0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->w:Landroid/media/AudioTrack;

    .line 16
    .line 17
    invoke-virtual {p0}, Landroid/media/AudioTrack;->play()V

    .line 18
    .line 19
    .line 20
    :cond_0
    return-void
.end method

.method public release()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->y:Lcom/google/android/exoplayer2/audio/AudioCapabilitiesReceiver;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/audio/AudioCapabilitiesReceiver;->e()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public reset()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->flush()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->f:Lcom/google/common/collect/ImmutableList;

    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/google/common/collect/ImmutableList;->iterator()Ll/gyj0;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    if-eqz v1, :cond_0

    .line 15
    .line 16
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    check-cast v1, Lcom/google/android/exoplayer2/audio/AudioProcessor;

    .line 21
    .line 22
    invoke-interface {v1}, Lcom/google/android/exoplayer2/audio/AudioProcessor;->reset()V

    .line 23
    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    iget-object v0, p0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->g:Lcom/google/common/collect/ImmutableList;

    .line 27
    .line 28
    invoke-virtual {v0}, Lcom/google/common/collect/ImmutableList;->iterator()Ll/gyj0;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 33
    .line 34
    .line 35
    move-result v1

    .line 36
    if-eqz v1, :cond_1

    .line 37
    .line 38
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    check-cast v1, Lcom/google/android/exoplayer2/audio/AudioProcessor;

    .line 43
    .line 44
    invoke-interface {v1}, Lcom/google/android/exoplayer2/audio/AudioProcessor;->reset()V

    .line 45
    .line 46
    .line 47
    goto :goto_1

    .line 48
    :cond_1
    iget-object v0, p0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->v:Lcom/google/android/exoplayer2/audio/b;

    .line 49
    .line 50
    if-eqz v0, :cond_2

    .line 51
    .line 52
    invoke-virtual {v0}, Lcom/google/android/exoplayer2/audio/b;->j()V

    .line 53
    .line 54
    .line 55
    :cond_2
    const/4 v0, 0x0

    .line 56
    iput-boolean v0, p0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->W:Z

    .line 57
    .line 58
    iput-boolean v0, p0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->e0:Z

    .line 59
    .line 60
    return-void
.end method

.method public setAudioSessionId(I)V
    .locals 1

    .line 1
    iget v0, p0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->Y:I

    .line 2
    .line 3
    if-eq v0, p1, :cond_1

    .line 4
    .line 5
    iput p1, p0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->Y:I

    .line 6
    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    const/4 p1, 0x1

    .line 10
    goto :goto_0

    .line 11
    :cond_0
    const/4 p1, 0x0

    .line 12
    :goto_0
    iput-boolean p1, p0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->X:Z

    .line 13
    .line 14
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->flush()V

    .line 15
    .line 16
    .line 17
    :cond_1
    return-void
.end method

.method public setAuxEffectInfo(Ll/wj1;)V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->Z:Ll/wj1;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ll/wj1;->equals(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    iget v0, p1, Ll/wj1;->a:I

    .line 11
    .line 12
    iget v1, p1, Ll/wj1;->b:F

    .line 13
    .line 14
    iget-object v2, p0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->w:Landroid/media/AudioTrack;

    .line 15
    .line 16
    if-eqz v2, :cond_2

    .line 17
    .line 18
    iget-object v3, p0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->Z:Ll/wj1;

    .line 19
    .line 20
    iget v3, v3, Ll/wj1;->a:I

    .line 21
    .line 22
    if-eq v3, v0, :cond_1

    .line 23
    .line 24
    invoke-virtual {v2, v0}, Landroid/media/AudioTrack;->attachAuxEffect(I)I

    .line 25
    .line 26
    .line 27
    :cond_1
    if-eqz v0, :cond_2

    .line 28
    .line 29
    iget-object v0, p0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->w:Landroid/media/AudioTrack;

    .line 30
    .line 31
    invoke-virtual {v0, v1}, Landroid/media/AudioTrack;->setAuxEffectSendLevel(F)I

    .line 32
    .line 33
    .line 34
    :cond_2
    iput-object p1, p0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->Z:Ll/wj1;

    .line 35
    .line 36
    return-void
.end method

.method public setPlaybackParameters(Lcom/google/android/exoplayer2/s;)V
    .locals 5

    .line 1
    new-instance v0, Lcom/google/android/exoplayer2/s;

    .line 2
    .line 3
    iget v1, p1, Lcom/google/android/exoplayer2/s;->a:F

    .line 4
    .line 5
    const v2, 0x3dcccccd    # 0.1f

    .line 6
    .line 7
    .line 8
    const/high16 v3, 0x41000000    # 8.0f

    .line 9
    .line 10
    invoke-static {v1, v2, v3}, Ll/bmk0;->p(FFF)F

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    iget v4, p1, Lcom/google/android/exoplayer2/s;->b:F

    .line 15
    .line 16
    invoke-static {v4, v2, v3}, Ll/bmk0;->p(FFF)F

    .line 17
    .line 18
    .line 19
    move-result v2

    .line 20
    invoke-direct {v0, v1, v2}, Lcom/google/android/exoplayer2/s;-><init>(FF)V

    .line 21
    .line 22
    .line 23
    iput-object v0, p0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->C:Lcom/google/android/exoplayer2/s;

    .line 24
    .line 25
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->e0()Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-eqz v0, :cond_0

    .line 30
    .line 31
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->X()V

    .line 32
    .line 33
    .line 34
    return-void

    .line 35
    :cond_0
    invoke-virtual {p0, p1}, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->W(Lcom/google/android/exoplayer2/s;)V

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method public setPreferredDevice(Landroid/media/AudioDeviceInfo;)V
    .locals 1
    .param p1    # Landroid/media/AudioDeviceInfo;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/RequiresApi;
        value = 0x17
    .end annotation

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    const/4 p1, 0x0

    .line 4
    goto :goto_0

    .line 5
    :cond_0
    new-instance v0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink$d;

    .line 6
    .line 7
    invoke-direct {v0, p1}, Lcom/google/android/exoplayer2/audio/DefaultAudioSink$d;-><init>(Landroid/media/AudioDeviceInfo;)V

    .line 8
    .line 9
    .line 10
    move-object p1, v0

    .line 11
    :goto_0
    iput-object p1, p0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->a0:Lcom/google/android/exoplayer2/audio/DefaultAudioSink$d;

    .line 12
    .line 13
    iget-object p0, p0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->w:Landroid/media/AudioTrack;

    .line 14
    .line 15
    if-eqz p0, :cond_1

    .line 16
    .line 17
    invoke-static {p0, p1}, Lcom/google/android/exoplayer2/audio/DefaultAudioSink$b;->a(Landroid/media/AudioTrack;Lcom/google/android/exoplayer2/audio/DefaultAudioSink$d;)V

    .line 18
    .line 19
    .line 20
    :cond_1
    return-void
.end method

.method public setSkipSilenceEnabled(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->D:Z

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->e0()Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    sget-object p1, Lcom/google/android/exoplayer2/s;->d:Lcom/google/android/exoplayer2/s;

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    iget-object p1, p0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->C:Lcom/google/android/exoplayer2/s;

    .line 13
    .line 14
    :goto_0
    invoke-virtual {p0, p1}, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->W(Lcom/google/android/exoplayer2/s;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public setVolume(F)V
    .locals 1

    .line 1
    iget v0, p0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->O:F

    .line 2
    .line 3
    cmpl-float v0, v0, p1

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iput p1, p0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->O:F

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->Y()V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public final y(J)V
    .locals 8

    .line 1
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->e0()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_1

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->c0()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    iget-object v0, p0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->b:Ll/cc1;

    .line 14
    .line 15
    iget-object v1, p0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->C:Lcom/google/android/exoplayer2/s;

    .line 16
    .line 17
    invoke-interface {v0, v1}, Ll/cc1;->b(Lcom/google/android/exoplayer2/s;)Lcom/google/android/exoplayer2/s;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    goto :goto_0

    .line 22
    :cond_0
    sget-object v0, Lcom/google/android/exoplayer2/s;->d:Lcom/google/android/exoplayer2/s;

    .line 23
    .line 24
    :goto_0
    iput-object v0, p0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->C:Lcom/google/android/exoplayer2/s;

    .line 25
    .line 26
    :goto_1
    move-object v2, v0

    .line 27
    goto :goto_2

    .line 28
    :cond_1
    sget-object v0, Lcom/google/android/exoplayer2/s;->d:Lcom/google/android/exoplayer2/s;

    .line 29
    .line 30
    goto :goto_1

    .line 31
    :goto_2
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->c0()Z

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    if-eqz v0, :cond_2

    .line 36
    .line 37
    iget-object v0, p0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->b:Ll/cc1;

    .line 38
    .line 39
    iget-boolean v1, p0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->D:Z

    .line 40
    .line 41
    invoke-interface {v0, v1}, Ll/cc1;->e(Z)Z

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    goto :goto_3

    .line 46
    :cond_2
    const/4 v0, 0x0

    .line 47
    :goto_3
    iput-boolean v0, p0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->D:Z

    .line 48
    .line 49
    iget-object v0, p0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->j:Ljava/util/ArrayDeque;

    .line 50
    .line 51
    new-instance v1, Lcom/google/android/exoplayer2/audio/DefaultAudioSink$i;

    .line 52
    .line 53
    const-wide/16 v3, 0x0

    .line 54
    .line 55
    invoke-static {v3, v4, p1, p2}, Ljava/lang/Math;->max(JJ)J

    .line 56
    .line 57
    .line 58
    move-result-wide v3

    .line 59
    iget-object p1, p0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->u:Lcom/google/android/exoplayer2/audio/DefaultAudioSink$g;

    .line 60
    .line 61
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->K()J

    .line 62
    .line 63
    .line 64
    move-result-wide v5

    .line 65
    invoke-virtual {p1, v5, v6}, Lcom/google/android/exoplayer2/audio/DefaultAudioSink$g;->h(J)J

    .line 66
    .line 67
    .line 68
    move-result-wide v5

    .line 69
    const/4 v7, 0x0

    .line 70
    invoke-direct/range {v1 .. v7}, Lcom/google/android/exoplayer2/audio/DefaultAudioSink$i;-><init>(Lcom/google/android/exoplayer2/s;JJLcom/google/android/exoplayer2/audio/DefaultAudioSink$a;)V

    .line 71
    .line 72
    .line 73
    invoke-virtual {v0, v1}, Ljava/util/ArrayDeque;->add(Ljava/lang/Object;)Z

    .line 74
    .line 75
    .line 76
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->b0()V

    .line 77
    .line 78
    .line 79
    iget-object p1, p0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->s:Lcom/google/android/exoplayer2/audio/AudioSink$a;

    .line 80
    .line 81
    if-eqz p1, :cond_3

    .line 82
    .line 83
    iget-boolean p0, p0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->D:Z

    .line 84
    .line 85
    invoke-interface {p1, p0}, Lcom/google/android/exoplayer2/audio/AudioSink$a;->a(Z)V

    .line 86
    .line 87
    .line 88
    :cond_3
    return-void
.end method

.method public final z(J)J
    .locals 4

    .line 1
    :goto_0
    iget-object v0, p0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->j:Ljava/util/ArrayDeque;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/ArrayDeque;->isEmpty()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->j:Ljava/util/ArrayDeque;

    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/util/ArrayDeque;->getFirst()Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    check-cast v0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink$i;

    .line 16
    .line 17
    iget-wide v0, v0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink$i;->c:J

    .line 18
    .line 19
    cmp-long v0, p1, v0

    .line 20
    .line 21
    if-ltz v0, :cond_0

    .line 22
    .line 23
    iget-object v0, p0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->j:Ljava/util/ArrayDeque;

    .line 24
    .line 25
    invoke-virtual {v0}, Ljava/util/ArrayDeque;->remove()Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    check-cast v0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink$i;

    .line 30
    .line 31
    iput-object v0, p0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->B:Lcom/google/android/exoplayer2/audio/DefaultAudioSink$i;

    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_0
    iget-object v0, p0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->B:Lcom/google/android/exoplayer2/audio/DefaultAudioSink$i;

    .line 35
    .line 36
    iget-wide v1, v0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink$i;->c:J

    .line 37
    .line 38
    sub-long v1, p1, v1

    .line 39
    .line 40
    iget-object v0, v0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink$i;->a:Lcom/google/android/exoplayer2/s;

    .line 41
    .line 42
    sget-object v3, Lcom/google/android/exoplayer2/s;->d:Lcom/google/android/exoplayer2/s;

    .line 43
    .line 44
    invoke-virtual {v0, v3}, Lcom/google/android/exoplayer2/s;->equals(Ljava/lang/Object;)Z

    .line 45
    .line 46
    .line 47
    move-result v0

    .line 48
    if-eqz v0, :cond_1

    .line 49
    .line 50
    iget-object p0, p0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->B:Lcom/google/android/exoplayer2/audio/DefaultAudioSink$i;

    .line 51
    .line 52
    iget-wide p0, p0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink$i;->b:J

    .line 53
    .line 54
    add-long/2addr p0, v1

    .line 55
    return-wide p0

    .line 56
    :cond_1
    iget-object v0, p0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->j:Ljava/util/ArrayDeque;

    .line 57
    .line 58
    invoke-virtual {v0}, Ljava/util/ArrayDeque;->isEmpty()Z

    .line 59
    .line 60
    .line 61
    move-result v0

    .line 62
    if-eqz v0, :cond_2

    .line 63
    .line 64
    iget-object p1, p0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->b:Ll/cc1;

    .line 65
    .line 66
    invoke-interface {p1, v1, v2}, Ll/cc1;->d(J)J

    .line 67
    .line 68
    .line 69
    move-result-wide p1

    .line 70
    iget-object p0, p0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->B:Lcom/google/android/exoplayer2/audio/DefaultAudioSink$i;

    .line 71
    .line 72
    iget-wide v0, p0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink$i;->b:J

    .line 73
    .line 74
    add-long/2addr v0, p1

    .line 75
    return-wide v0

    .line 76
    :cond_2
    iget-object v0, p0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->j:Ljava/util/ArrayDeque;

    .line 77
    .line 78
    invoke-virtual {v0}, Ljava/util/ArrayDeque;->getFirst()Ljava/lang/Object;

    .line 79
    .line 80
    .line 81
    move-result-object v0

    .line 82
    check-cast v0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink$i;

    .line 83
    .line 84
    iget-wide v1, v0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink$i;->c:J

    .line 85
    .line 86
    sub-long/2addr v1, p1

    .line 87
    iget-object p0, p0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink;->B:Lcom/google/android/exoplayer2/audio/DefaultAudioSink$i;

    .line 88
    .line 89
    iget-object p0, p0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink$i;->a:Lcom/google/android/exoplayer2/s;

    .line 90
    .line 91
    iget p0, p0, Lcom/google/android/exoplayer2/s;->a:F

    .line 92
    .line 93
    invoke-static {v1, v2, p0}, Ll/bmk0;->d0(JF)J

    .line 94
    .line 95
    .line 96
    move-result-wide p0

    .line 97
    iget-wide v0, v0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink$i;->b:J

    .line 98
    .line 99
    sub-long/2addr v0, p0

    .line 100
    return-wide v0
.end method

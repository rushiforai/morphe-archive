.class public Lcom/immomo/moment/mediautils/l;
.super Lcom/immomo/moment/mediautils/e;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/immomo/moment/mediautils/l$f;,
        Lcom/immomo/moment/mediautils/l$c;,
        Lcom/immomo/moment/mediautils/l$d;,
        Lcom/immomo/moment/mediautils/l$e;
    }
.end annotation


# static fields
.field public static U:I = 0x0

.field public static V:I = 0x1


# instance fields
.field private A:Ljava/util/LinkedList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedList<",
            "Ll/ad60;",
            ">;"
        }
    .end annotation
.end field

.field private B:Ljava/util/concurrent/LinkedBlockingQueue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/LinkedBlockingQueue<",
            "Ll/ad60;",
            ">;"
        }
    .end annotation
.end field

.field private C:I

.field private D:I

.field private E:Ll/ad60;

.field private F:Lcom/immomo/moment/mediautils/l$e;

.field private G:J

.field private H:J

.field private I:J

.field private J:J

.field private K:J

.field private L:J

.field private M:Z

.field N:I

.field O:F

.field private P:F

.field private Q:Lcom/immomo/moment/mediautils/l$f;

.field private R:Ll/spw;

.field private S:I

.field private T:I

.field private final o:Ljava/lang/String;

.field private final p:Ljava/lang/String;

.field private final q:Ljava/lang/String;

.field private r:Lcom/immomo/moment/mediautils/h;

.field private s:Lcom/immomo/moment/mediautils/h;

.field private t:Ll/f220;

.field private u:Landroid/media/MediaFormat;

.field private v:Landroid/media/MediaFormat;

.field private w:Ljava/lang/Object;

.field private x:I

.field private y:I

.field private z:Ljava/util/LinkedList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedList<",
            "Ll/ad60;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>()V
    .locals 4

    .line 1
    invoke-direct {p0}, Lcom/immomo/moment/mediautils/e;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string v0, "MediaEncoderWrapper"

    .line 5
    .line 6
    iput-object v0, p0, Lcom/immomo/moment/mediautils/l;->o:Ljava/lang/String;

    .line 7
    .line 8
    const-string v0, "video/avc"

    .line 9
    .line 10
    iput-object v0, p0, Lcom/immomo/moment/mediautils/l;->p:Ljava/lang/String;

    .line 11
    .line 12
    const-string v0, "audio/mp4a-latm"

    .line 13
    .line 14
    iput-object v0, p0, Lcom/immomo/moment/mediautils/l;->q:Ljava/lang/String;

    .line 15
    .line 16
    const/4 v0, 0x0

    .line 17
    iput-object v0, p0, Lcom/immomo/moment/mediautils/l;->r:Lcom/immomo/moment/mediautils/h;

    .line 18
    .line 19
    iput-object v0, p0, Lcom/immomo/moment/mediautils/l;->s:Lcom/immomo/moment/mediautils/h;

    .line 20
    .line 21
    iput-object v0, p0, Lcom/immomo/moment/mediautils/l;->t:Ll/f220;

    .line 22
    .line 23
    iput-object v0, p0, Lcom/immomo/moment/mediautils/l;->u:Landroid/media/MediaFormat;

    .line 24
    .line 25
    iput-object v0, p0, Lcom/immomo/moment/mediautils/l;->v:Landroid/media/MediaFormat;

    .line 26
    .line 27
    new-instance v1, Ljava/lang/Object;

    .line 28
    .line 29
    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    .line 30
    .line 31
    .line 32
    iput-object v1, p0, Lcom/immomo/moment/mediautils/l;->w:Ljava/lang/Object;

    .line 33
    .line 34
    const/4 v1, 0x0

    .line 35
    iput v1, p0, Lcom/immomo/moment/mediautils/l;->x:I

    .line 36
    .line 37
    iput v1, p0, Lcom/immomo/moment/mediautils/l;->y:I

    .line 38
    .line 39
    new-instance v2, Ljava/util/LinkedList;

    .line 40
    .line 41
    invoke-direct {v2}, Ljava/util/LinkedList;-><init>()V

    .line 42
    .line 43
    .line 44
    iput-object v2, p0, Lcom/immomo/moment/mediautils/l;->z:Ljava/util/LinkedList;

    .line 45
    .line 46
    new-instance v2, Ljava/util/LinkedList;

    .line 47
    .line 48
    invoke-direct {v2}, Ljava/util/LinkedList;-><init>()V

    .line 49
    .line 50
    .line 51
    iput-object v2, p0, Lcom/immomo/moment/mediautils/l;->A:Ljava/util/LinkedList;

    .line 52
    .line 53
    new-instance v2, Ljava/util/concurrent/LinkedBlockingQueue;

    .line 54
    .line 55
    invoke-direct {v2}, Ljava/util/concurrent/LinkedBlockingQueue;-><init>()V

    .line 56
    .line 57
    .line 58
    iput-object v2, p0, Lcom/immomo/moment/mediautils/l;->B:Ljava/util/concurrent/LinkedBlockingQueue;

    .line 59
    .line 60
    iput v1, p0, Lcom/immomo/moment/mediautils/l;->C:I

    .line 61
    .line 62
    iput v1, p0, Lcom/immomo/moment/mediautils/l;->D:I

    .line 63
    .line 64
    iput-object v0, p0, Lcom/immomo/moment/mediautils/l;->E:Ll/ad60;

    .line 65
    .line 66
    iput-object v0, p0, Lcom/immomo/moment/mediautils/l;->F:Lcom/immomo/moment/mediautils/l$e;

    .line 67
    .line 68
    const-wide/16 v2, -0x1

    .line 69
    .line 70
    iput-wide v2, p0, Lcom/immomo/moment/mediautils/l;->G:J

    .line 71
    .line 72
    iput-wide v2, p0, Lcom/immomo/moment/mediautils/l;->H:J

    .line 73
    .line 74
    iput-wide v2, p0, Lcom/immomo/moment/mediautils/l;->I:J

    .line 75
    .line 76
    iput-wide v2, p0, Lcom/immomo/moment/mediautils/l;->J:J

    .line 77
    .line 78
    iput-wide v2, p0, Lcom/immomo/moment/mediautils/l;->K:J

    .line 79
    .line 80
    iput-wide v2, p0, Lcom/immomo/moment/mediautils/l;->L:J

    .line 81
    .line 82
    iput-boolean v1, p0, Lcom/immomo/moment/mediautils/l;->M:Z

    .line 83
    .line 84
    iput v1, p0, Lcom/immomo/moment/mediautils/l;->N:I

    .line 85
    .line 86
    const/4 v2, 0x0

    .line 87
    iput v2, p0, Lcom/immomo/moment/mediautils/l;->O:F

    .line 88
    .line 89
    const/high16 v2, 0x3f800000    # 1.0f

    .line 90
    .line 91
    iput v2, p0, Lcom/immomo/moment/mediautils/l;->P:F

    .line 92
    .line 93
    iput-object v0, p0, Lcom/immomo/moment/mediautils/l;->R:Ll/spw;

    .line 94
    .line 95
    iput v1, p0, Lcom/immomo/moment/mediautils/l;->S:I

    .line 96
    .line 97
    iput v1, p0, Lcom/immomo/moment/mediautils/l;->T:I

    .line 98
    .line 99
    return-void
.end method

.method public static synthetic A(Lcom/immomo/moment/mediautils/l;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/immomo/moment/mediautils/l;->C:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic B(Lcom/immomo/moment/mediautils/l;I)I
    .locals 0

    .line 1
    iput p1, p0, Lcom/immomo/moment/mediautils/l;->C:I

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic C(Lcom/immomo/moment/mediautils/l;)Lcom/immomo/moment/mediautils/l$c;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    const/4 p0, 0x0

    .line 5
    return-object p0
.end method

.method public static synthetic D(Lcom/immomo/moment/mediautils/l;Ljava/nio/ByteBuffer;Landroid/media/MediaCodec$BufferInfo;)[Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/immomo/moment/mediautils/l;->F(Ljava/nio/ByteBuffer;Landroid/media/MediaCodec$BufferInfo;)[Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method private F(Ljava/nio/ByteBuffer;Landroid/media/MediaCodec$BufferInfo;)[Ljava/lang/Object;
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/immomo/moment/mediautils/l;->A:Ljava/util/LinkedList;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/LinkedList;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-lez v0, :cond_1

    .line 8
    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    if-eqz p2, :cond_0

    .line 12
    .line 13
    iget-object v0, p0, Lcom/immomo/moment/mediautils/l;->A:Ljava/util/LinkedList;

    .line 14
    .line 15
    new-instance v1, Ll/ad60;

    .line 16
    .line 17
    invoke-direct {v1, p1, p2}, Ll/ad60;-><init>(Ljava/nio/ByteBuffer;Landroid/media/MediaCodec$BufferInfo;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {v0, v1}, Ljava/util/LinkedList;->offerLast(Ljava/lang/Object;)Z

    .line 21
    .line 22
    .line 23
    :cond_0
    iget-object p1, p0, Lcom/immomo/moment/mediautils/l;->A:Ljava/util/LinkedList;

    .line 24
    .line 25
    invoke-virtual {p1}, Ljava/util/LinkedList;->pollFirst()Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    check-cast p1, Ll/ad60;

    .line 30
    .line 31
    invoke-virtual {p1}, Ll/ad60;->a()Ljava/nio/ByteBuffer;

    .line 32
    .line 33
    .line 34
    move-result-object p2

    .line 35
    invoke-virtual {p1}, Ll/ad60;->b()Landroid/media/MediaCodec$BufferInfo;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    move-object v4, p2

    .line 40
    move-object p2, p1

    .line 41
    move-object p1, v4

    .line 42
    :cond_1
    iget-wide v0, p0, Lcom/immomo/moment/mediautils/l;->G:J

    .line 43
    .line 44
    const-wide/16 v2, 0x0

    .line 45
    .line 46
    cmp-long v0, v0, v2

    .line 47
    .line 48
    if-gez v0, :cond_2

    .line 49
    .line 50
    iget-wide v0, p2, Landroid/media/MediaCodec$BufferInfo;->presentationTimeUs:J

    .line 51
    .line 52
    iput-wide v0, p0, Lcom/immomo/moment/mediautils/l;->G:J

    .line 53
    .line 54
    :cond_2
    iget-wide v0, p0, Lcom/immomo/moment/mediautils/l;->I:J

    .line 55
    .line 56
    iget-wide v2, p2, Landroid/media/MediaCodec$BufferInfo;->presentationTimeUs:J

    .line 57
    .line 58
    cmp-long v0, v0, v2

    .line 59
    .line 60
    if-gez v0, :cond_3

    .line 61
    .line 62
    iput-wide v2, p0, Lcom/immomo/moment/mediautils/l;->I:J

    .line 63
    .line 64
    iget-wide v0, p0, Lcom/immomo/moment/mediautils/l;->G:J

    .line 65
    .line 66
    sub-long/2addr v2, v0

    .line 67
    iput-wide v2, p2, Landroid/media/MediaCodec$BufferInfo;->presentationTimeUs:J

    .line 68
    .line 69
    iput-wide v2, p0, Lcom/immomo/moment/mediautils/l;->L:J

    .line 70
    .line 71
    goto :goto_0

    .line 72
    :cond_3
    iget-wide v0, p0, Lcom/immomo/moment/mediautils/l;->L:J

    .line 73
    .line 74
    iput-wide v0, p2, Landroid/media/MediaCodec$BufferInfo;->presentationTimeUs:J

    .line 75
    .line 76
    :goto_0
    filled-new-array {p1, p2}, [Ljava/lang/Object;

    .line 77
    .line 78
    .line 79
    move-result-object p0

    .line 80
    return-object p0
.end method

.method private G(Ljava/nio/ByteBuffer;Landroid/media/MediaCodec$BufferInfo;)[Ljava/lang/Object;
    .locals 11

    .line 1
    iget-object v0, p0, Lcom/immomo/moment/mediautils/l;->z:Ljava/util/LinkedList;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/LinkedList;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-lez v0, :cond_1

    .line 8
    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    if-eqz p2, :cond_0

    .line 12
    .line 13
    iget-object v0, p0, Lcom/immomo/moment/mediautils/l;->z:Ljava/util/LinkedList;

    .line 14
    .line 15
    new-instance v1, Ll/ad60;

    .line 16
    .line 17
    invoke-direct {v1, p1, p2}, Ll/ad60;-><init>(Ljava/nio/ByteBuffer;Landroid/media/MediaCodec$BufferInfo;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {v0, v1}, Ljava/util/LinkedList;->offerLast(Ljava/lang/Object;)Z

    .line 21
    .line 22
    .line 23
    :cond_0
    iget-object p1, p0, Lcom/immomo/moment/mediautils/l;->z:Ljava/util/LinkedList;

    .line 24
    .line 25
    invoke-virtual {p1}, Ljava/util/LinkedList;->pollFirst()Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    check-cast p1, Ll/ad60;

    .line 30
    .line 31
    invoke-virtual {p1}, Ll/ad60;->a()Ljava/nio/ByteBuffer;

    .line 32
    .line 33
    .line 34
    move-result-object p2

    .line 35
    invoke-virtual {p1}, Ll/ad60;->b()Landroid/media/MediaCodec$BufferInfo;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    move-object v10, p2

    .line 40
    move-object p2, p1

    .line 41
    move-object p1, v10

    .line 42
    :cond_1
    iget-wide v0, p0, Lcom/immomo/moment/mediautils/l;->H:J

    .line 43
    .line 44
    const-wide/16 v2, 0x0

    .line 45
    .line 46
    cmp-long v0, v0, v2

    .line 47
    .line 48
    const-wide/16 v4, 0x7530

    .line 49
    .line 50
    if-gez v0, :cond_8

    .line 51
    .line 52
    iget v0, p2, Landroid/media/MediaCodec$BufferInfo;->flags:I

    .line 53
    .line 54
    const/4 v1, 0x1

    .line 55
    and-int/2addr v0, v1

    .line 56
    if-eqz v0, :cond_4

    .line 57
    .line 58
    iget-object v0, p0, Lcom/immomo/moment/mediautils/l;->F:Lcom/immomo/moment/mediautils/l$e;

    .line 59
    .line 60
    if-eqz v0, :cond_2

    .line 61
    .line 62
    invoke-interface {v0}, Lcom/immomo/moment/mediautils/l$e;->a()J

    .line 63
    .line 64
    .line 65
    move-result-wide v0

    .line 66
    cmp-long v6, v0, v2

    .line 67
    .line 68
    if-ltz v6, :cond_2

    .line 69
    .line 70
    iput-wide v0, p2, Landroid/media/MediaCodec$BufferInfo;->presentationTimeUs:J

    .line 71
    .line 72
    :cond_2
    iget-boolean v0, p0, Lcom/immomo/moment/mediautils/l;->M:Z

    .line 73
    .line 74
    iget-wide v6, p2, Landroid/media/MediaCodec$BufferInfo;->presentationTimeUs:J

    .line 75
    .line 76
    if-eqz v0, :cond_3

    .line 77
    .line 78
    sub-long/2addr v6, v4

    .line 79
    iput-wide v6, p0, Lcom/immomo/moment/mediautils/l;->H:J

    .line 80
    .line 81
    goto :goto_0

    .line 82
    :cond_3
    iput-wide v6, p0, Lcom/immomo/moment/mediautils/l;->H:J

    .line 83
    .line 84
    goto :goto_0

    .line 85
    :cond_4
    iget-boolean v0, p0, Lcom/immomo/moment/mediautils/l;->M:Z

    .line 86
    .line 87
    if-eqz v0, :cond_7

    .line 88
    .line 89
    iget-object v0, p0, Lcom/immomo/moment/mediautils/l;->F:Lcom/immomo/moment/mediautils/l$e;

    .line 90
    .line 91
    if-eqz v0, :cond_5

    .line 92
    .line 93
    invoke-interface {v0}, Lcom/immomo/moment/mediautils/l$e;->a()J

    .line 94
    .line 95
    .line 96
    move-result-wide v0

    .line 97
    cmp-long v6, v0, v2

    .line 98
    .line 99
    if-ltz v6, :cond_5

    .line 100
    .line 101
    iput-wide v0, p2, Landroid/media/MediaCodec$BufferInfo;->presentationTimeUs:J

    .line 102
    .line 103
    :cond_5
    iget-wide v0, p2, Landroid/media/MediaCodec$BufferInfo;->presentationTimeUs:J

    .line 104
    .line 105
    cmp-long v6, v0, v2

    .line 106
    .line 107
    if-lez v6, :cond_6

    .line 108
    .line 109
    sub-long/2addr v0, v4

    .line 110
    iput-wide v0, p0, Lcom/immomo/moment/mediautils/l;->H:J

    .line 111
    .line 112
    goto :goto_0

    .line 113
    :cond_6
    const-string v0, "MediaEncoder"

    .line 114
    .line 115
    const-string v1, "MeidaEncoder pts not incresing !!"

    .line 116
    .line 117
    invoke-static {v0, v1}, Lcom/cosmos/mdlog/MDLog;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 118
    .line 119
    .line 120
    goto :goto_0

    .line 121
    :cond_7
    iput-boolean v1, p0, Lcom/immomo/moment/mediautils/l;->M:Z

    .line 122
    .line 123
    iget-wide v0, p2, Landroid/media/MediaCodec$BufferInfo;->presentationTimeUs:J

    .line 124
    .line 125
    cmp-long v4, v0, v2

    .line 126
    .line 127
    if-lez v4, :cond_a

    .line 128
    .line 129
    iput-wide v0, p0, Lcom/immomo/moment/mediautils/l;->H:J

    .line 130
    .line 131
    goto :goto_0

    .line 132
    :cond_8
    iget-object v0, p0, Lcom/immomo/moment/mediautils/l;->F:Lcom/immomo/moment/mediautils/l$e;

    .line 133
    .line 134
    if-eqz v0, :cond_a

    .line 135
    .line 136
    invoke-interface {v0}, Lcom/immomo/moment/mediautils/l$e;->a()J

    .line 137
    .line 138
    .line 139
    move-result-wide v0

    .line 140
    cmp-long v6, v0, v2

    .line 141
    .line 142
    if-ltz v6, :cond_9

    .line 143
    .line 144
    iput-wide v0, p2, Landroid/media/MediaCodec$BufferInfo;->presentationTimeUs:J

    .line 145
    .line 146
    goto :goto_0

    .line 147
    :cond_9
    iget-wide v0, p0, Lcom/immomo/moment/mediautils/l;->J:J

    .line 148
    .line 149
    add-long/2addr v0, v4

    .line 150
    iput-wide v0, p2, Landroid/media/MediaCodec$BufferInfo;->presentationTimeUs:J

    .line 151
    .line 152
    :cond_a
    :goto_0
    iget-wide v0, p0, Lcom/immomo/moment/mediautils/l;->H:J

    .line 153
    .line 154
    cmp-long v4, v0, v2

    .line 155
    .line 156
    if-ltz v4, :cond_f

    .line 157
    .line 158
    iget-wide v4, p0, Lcom/immomo/moment/mediautils/l;->J:J

    .line 159
    .line 160
    iget-wide v6, p2, Landroid/media/MediaCodec$BufferInfo;->presentationTimeUs:J

    .line 161
    .line 162
    cmp-long v8, v4, v6

    .line 163
    .line 164
    if-gez v8, :cond_d

    .line 165
    .line 166
    iput-wide v6, p0, Lcom/immomo/moment/mediautils/l;->J:J

    .line 167
    .line 168
    sub-long/2addr v6, v0

    .line 169
    iget-wide v0, p0, Lcom/immomo/moment/mediautils/l;->K:J

    .line 170
    .line 171
    sub-long v4, v6, v0

    .line 172
    .line 173
    cmp-long v4, v4, v2

    .line 174
    .line 175
    const-wide/16 v8, 0x1388

    .line 176
    .line 177
    if-ltz v4, :cond_b

    .line 178
    .line 179
    sub-long v4, v6, v0

    .line 180
    .line 181
    cmp-long v4, v4, v8

    .line 182
    .line 183
    if-gez v4, :cond_c

    .line 184
    .line 185
    cmp-long v2, v6, v2

    .line 186
    .line 187
    if-eqz v2, :cond_c

    .line 188
    .line 189
    :cond_b
    add-long v6, v0, v8

    .line 190
    .line 191
    :cond_c
    iput-wide v6, p2, Landroid/media/MediaCodec$BufferInfo;->presentationTimeUs:J

    .line 192
    .line 193
    iput-wide v6, p0, Lcom/immomo/moment/mediautils/l;->K:J

    .line 194
    .line 195
    goto :goto_1

    .line 196
    :cond_d
    cmp-long v0, v4, v6

    .line 197
    .line 198
    const-wide/16 v1, 0x4e20

    .line 199
    .line 200
    if-nez v0, :cond_e

    .line 201
    .line 202
    iget-wide v6, p0, Lcom/immomo/moment/mediautils/l;->K:J

    .line 203
    .line 204
    add-long/2addr v6, v1

    .line 205
    iput-wide v6, p2, Landroid/media/MediaCodec$BufferInfo;->presentationTimeUs:J

    .line 206
    .line 207
    iput-wide v6, p0, Lcom/immomo/moment/mediautils/l;->K:J

    .line 208
    .line 209
    add-long/2addr v4, v1

    .line 210
    iput-wide v4, p0, Lcom/immomo/moment/mediautils/l;->J:J

    .line 211
    .line 212
    goto :goto_1

    .line 213
    :cond_e
    add-long/2addr v4, v1

    .line 214
    iput-wide v4, p0, Lcom/immomo/moment/mediautils/l;->J:J

    .line 215
    .line 216
    iget-wide v3, p0, Lcom/immomo/moment/mediautils/l;->K:J

    .line 217
    .line 218
    add-long/2addr v3, v1

    .line 219
    iput-wide v3, p2, Landroid/media/MediaCodec$BufferInfo;->presentationTimeUs:J

    .line 220
    .line 221
    iput-wide v3, p0, Lcom/immomo/moment/mediautils/l;->K:J

    .line 222
    .line 223
    :cond_f
    :goto_1
    iget-wide v0, p2, Landroid/media/MediaCodec$BufferInfo;->presentationTimeUs:J

    .line 224
    .line 225
    long-to-float v0, v0

    .line 226
    iget p0, p0, Lcom/immomo/moment/mediautils/l;->P:F

    .line 227
    .line 228
    mul-float/2addr v0, p0

    .line 229
    float-to-long v0, v0

    .line 230
    iput-wide v0, p2, Landroid/media/MediaCodec$BufferInfo;->presentationTimeUs:J

    .line 231
    .line 232
    filled-new-array {p1, p2}, [Ljava/lang/Object;

    .line 233
    .line 234
    .line 235
    move-result-object p0

    .line 236
    return-object p0
.end method

.method private I(Ljava/nio/ByteBuffer;Landroid/media/MediaCodec$BufferInfo;)Z
    .locals 18
    .annotation build Landroidx/annotation/RequiresApi;
        api = 0x10
    .end annotation

    .line 1
    move-object/from16 v1, p0

    .line 2
    .line 3
    move-object/from16 v0, p1

    .line 4
    .line 5
    const-string v2, "Get mediaCodec buffer error !!! "

    .line 6
    .line 7
    const-string v3, "Get mediaCodec buffer error !!! "

    .line 8
    .line 9
    iget-object v4, v1, Lcom/immomo/moment/mediautils/l;->w:Ljava/lang/Object;

    .line 10
    .line 11
    monitor-enter v4

    .line 12
    :try_start_0
    iget-object v5, v1, Lcom/immomo/moment/mediautils/l;->B:Ljava/util/concurrent/LinkedBlockingQueue;

    .line 13
    .line 14
    invoke-virtual {v5}, Ljava/util/concurrent/LinkedBlockingQueue;->size()I

    .line 15
    .line 16
    .line 17
    move-result v5

    .line 18
    const/4 v6, 0x0

    .line 19
    if-gtz v5, :cond_0

    .line 20
    .line 21
    monitor-exit v4
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 22
    return v6

    .line 23
    :catchall_0
    move-exception v0

    .line 24
    goto/16 :goto_3

    .line 25
    .line 26
    :cond_0
    :try_start_1
    iget v5, v1, Lcom/immomo/moment/mediautils/l;->S:I

    .line 27
    .line 28
    if-nez v5, :cond_1

    .line 29
    .line 30
    iget-object v5, v1, Lcom/immomo/moment/mediautils/l;->B:Ljava/util/concurrent/LinkedBlockingQueue;

    .line 31
    .line 32
    invoke-virtual {v5}, Ljava/util/concurrent/LinkedBlockingQueue;->take()Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    move-result-object v5

    .line 36
    check-cast v5, Ll/ad60;

    .line 37
    .line 38
    iput-object v5, v1, Lcom/immomo/moment/mediautils/l;->E:Ll/ad60;

    .line 39
    .line 40
    invoke-virtual {v5}, Ll/ad60;->b()Landroid/media/MediaCodec$BufferInfo;

    .line 41
    .line 42
    .line 43
    move-result-object v5

    .line 44
    iget v5, v5, Landroid/media/MediaCodec$BufferInfo;->size:I

    .line 45
    .line 46
    iput v5, v1, Lcom/immomo/moment/mediautils/l;->S:I

    .line 47
    .line 48
    iput v6, v1, Lcom/immomo/moment/mediautils/l;->T:I

    .line 49
    .line 50
    goto :goto_0

    .line 51
    :catch_0
    move-exception v0

    .line 52
    goto/16 :goto_1

    .line 53
    .line 54
    :cond_1
    :goto_0
    iget-object v5, v1, Lcom/immomo/moment/mediautils/l;->E:Ll/ad60;

    .line 55
    .line 56
    invoke-virtual {v5}, Ll/ad60;->b()Landroid/media/MediaCodec$BufferInfo;

    .line 57
    .line 58
    .line 59
    move-result-object v5

    .line 60
    iget v7, v1, Lcom/immomo/moment/mediautils/l;->S:I

    .line 61
    .line 62
    if-lez v7, :cond_5

    .line 63
    .line 64
    invoke-virtual {v0, v6}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 65
    .line 66
    .line 67
    invoke-virtual {v0}, Ljava/nio/Buffer;->capacity()I

    .line 68
    .line 69
    .line 70
    move-result v7

    .line 71
    iget v8, v1, Lcom/immomo/moment/mediautils/l;->S:I

    .line 72
    .line 73
    const/4 v9, 0x0

    .line 74
    const-wide/16 v10, 0x0

    .line 75
    .line 76
    if-lt v7, v8, :cond_3

    .line 77
    .line 78
    iget-object v7, v1, Lcom/immomo/moment/mediautils/l;->E:Ll/ad60;

    .line 79
    .line 80
    invoke-virtual {v7}, Ll/ad60;->a()Ljava/nio/ByteBuffer;

    .line 81
    .line 82
    .line 83
    move-result-object v7

    .line 84
    invoke-virtual {v7}, Ljava/nio/ByteBuffer;->array()[B

    .line 85
    .line 86
    .line 87
    move-result-object v7

    .line 88
    iget v8, v1, Lcom/immomo/moment/mediautils/l;->T:I

    .line 89
    .line 90
    iget v12, v1, Lcom/immomo/moment/mediautils/l;->S:I

    .line 91
    .line 92
    invoke-virtual {v0, v7, v8, v12}, Ljava/nio/ByteBuffer;->put([BII)Ljava/nio/ByteBuffer;

    .line 93
    .line 94
    .line 95
    iget v0, v1, Lcom/immomo/moment/mediautils/l;->O:F

    .line 96
    .line 97
    cmpl-float v7, v0, v9

    .line 98
    .line 99
    if-lez v7, :cond_2

    .line 100
    .line 101
    iget v7, v1, Lcom/immomo/moment/mediautils/l;->T:I

    .line 102
    .line 103
    int-to-long v7, v7

    .line 104
    long-to-float v7, v7

    .line 105
    mul-float/2addr v7, v0

    .line 106
    float-to-long v10, v7

    .line 107
    :cond_2
    iget v13, v5, Landroid/media/MediaCodec$BufferInfo;->offset:I

    .line 108
    .line 109
    iget v14, v1, Lcom/immomo/moment/mediautils/l;->S:I

    .line 110
    .line 111
    iget-wide v7, v5, Landroid/media/MediaCodec$BufferInfo;->presentationTimeUs:J

    .line 112
    .line 113
    add-long v15, v7, v10

    .line 114
    .line 115
    iget v0, v5, Landroid/media/MediaCodec$BufferInfo;->flags:I

    .line 116
    .line 117
    move-object/from16 v12, p2

    .line 118
    .line 119
    move/from16 v17, v0

    .line 120
    .line 121
    invoke-virtual/range {v12 .. v17}, Landroid/media/MediaCodec$BufferInfo;->set(IIJI)V

    .line 122
    .line 123
    .line 124
    iput v6, v1, Lcom/immomo/moment/mediautils/l;->S:I

    .line 125
    .line 126
    iget v0, v1, Lcom/immomo/moment/mediautils/l;->T:I

    .line 127
    .line 128
    iput v0, v1, Lcom/immomo/moment/mediautils/l;->T:I

    .line 129
    .line 130
    goto/16 :goto_2

    .line 131
    .line 132
    :cond_3
    iget v6, v1, Lcom/immomo/moment/mediautils/l;->O:F

    .line 133
    .line 134
    cmpl-float v7, v6, v9

    .line 135
    .line 136
    if-lez v7, :cond_4

    .line 137
    .line 138
    iget v7, v1, Lcom/immomo/moment/mediautils/l;->T:I

    .line 139
    .line 140
    int-to-long v7, v7

    .line 141
    long-to-float v7, v7

    .line 142
    mul-float/2addr v7, v6

    .line 143
    float-to-long v10, v7

    .line 144
    :cond_4
    iget-object v6, v1, Lcom/immomo/moment/mediautils/l;->E:Ll/ad60;

    .line 145
    .line 146
    invoke-virtual {v6}, Ll/ad60;->a()Ljava/nio/ByteBuffer;

    .line 147
    .line 148
    .line 149
    move-result-object v6

    .line 150
    invoke-virtual {v6}, Ljava/nio/ByteBuffer;->array()[B

    .line 151
    .line 152
    .line 153
    move-result-object v6

    .line 154
    iget v7, v1, Lcom/immomo/moment/mediautils/l;->T:I

    .line 155
    .line 156
    invoke-virtual {v0}, Ljava/nio/Buffer;->capacity()I

    .line 157
    .line 158
    .line 159
    move-result v8

    .line 160
    invoke-virtual {v0, v6, v7, v8}, Ljava/nio/ByteBuffer;->put([BII)Ljava/nio/ByteBuffer;

    .line 161
    .line 162
    .line 163
    iget v6, v5, Landroid/media/MediaCodec$BufferInfo;->offset:I

    .line 164
    .line 165
    invoke-virtual {v0}, Ljava/nio/Buffer;->capacity()I

    .line 166
    .line 167
    .line 168
    move-result v7

    .line 169
    iget-wide v8, v5, Landroid/media/MediaCodec$BufferInfo;->presentationTimeUs:J

    .line 170
    .line 171
    add-long/2addr v8, v10

    .line 172
    iget v10, v5, Landroid/media/MediaCodec$BufferInfo;->flags:I

    .line 173
    .line 174
    move-object/from16 v5, p2

    .line 175
    .line 176
    invoke-virtual/range {v5 .. v10}, Landroid/media/MediaCodec$BufferInfo;->set(IIJI)V

    .line 177
    .line 178
    .line 179
    iget v5, v1, Lcom/immomo/moment/mediautils/l;->S:I

    .line 180
    .line 181
    invoke-virtual {v0}, Ljava/nio/Buffer;->capacity()I

    .line 182
    .line 183
    .line 184
    move-result v6

    .line 185
    sub-int/2addr v5, v6

    .line 186
    iput v5, v1, Lcom/immomo/moment/mediautils/l;->S:I

    .line 187
    .line 188
    iget v5, v1, Lcom/immomo/moment/mediautils/l;->T:I

    .line 189
    .line 190
    invoke-virtual {v0}, Ljava/nio/Buffer;->capacity()I

    .line 191
    .line 192
    .line 193
    move-result v0

    .line 194
    add-int/2addr v5, v0

    .line 195
    iput v5, v1, Lcom/immomo/moment/mediautils/l;->T:I
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 196
    .line 197
    goto :goto_2

    .line 198
    :goto_1
    :try_start_2
    const-string v5, "MediaEncoder"

    .line 199
    .line 200
    new-instance v6, Ljava/lang/StringBuilder;

    .line 201
    .line 202
    invoke-direct {v6, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 203
    .line 204
    .line 205
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 206
    .line 207
    .line 208
    move-result-object v3

    .line 209
    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 210
    .line 211
    .line 212
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 213
    .line 214
    .line 215
    move-result-object v3

    .line 216
    invoke-static {v5, v3}, Lcom/cosmos/mdlog/MDLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 217
    .line 218
    .line 219
    iget-object v3, v1, Lcom/immomo/moment/mediautils/l;->R:Ll/spw;

    .line 220
    .line 221
    if-eqz v3, :cond_5

    .line 222
    .line 223
    new-instance v5, Ljava/lang/StringBuilder;

    .line 224
    .line 225
    invoke-direct {v5, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 226
    .line 227
    .line 228
    invoke-static {v0}, Ll/g8g0;->a(Ljava/lang/Exception;)Ljava/lang/String;

    .line 229
    .line 230
    .line 231
    move-result-object v0

    .line 232
    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 233
    .line 234
    .line 235
    const-string v0, " mOutputFilePath:"

    .line 236
    .line 237
    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 238
    .line 239
    .line 240
    iget-object v0, v1, Lcom/immomo/moment/mediautils/e;->n:Ljava/lang/String;

    .line 241
    .line 242
    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 243
    .line 244
    .line 245
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 246
    .line 247
    .line 248
    move-result-object v0

    .line 249
    const/16 v1, 0xbc0

    .line 250
    .line 251
    invoke-interface {v3, v1, v0}, Ll/spw;->onFail(ILjava/lang/String;)V

    .line 252
    .line 253
    .line 254
    :cond_5
    :goto_2
    monitor-exit v4

    .line 255
    const/4 v0, 0x1

    .line 256
    return v0

    .line 257
    :goto_3
    monitor-exit v4
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 258
    throw v0
.end method

.method private J()Z
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "raw frame queue size:"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v1, p0, Lcom/immomo/moment/mediautils/l;->B:Ljava/util/concurrent/LinkedBlockingQueue;

    .line 9
    .line 10
    invoke-virtual {v1}, Ljava/util/concurrent/LinkedBlockingQueue;->size()I

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    const-string v1, " audio packet queue size:"

    .line 18
    .line 19
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    iget-object v1, p0, Lcom/immomo/moment/mediautils/l;->A:Ljava/util/LinkedList;

    .line 23
    .line 24
    invoke-virtual {v1}, Ljava/util/LinkedList;->size()I

    .line 25
    .line 26
    .line 27
    move-result v1

    .line 28
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    const-string v1, " video packet queue size:"

    .line 32
    .line 33
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    iget-object v1, p0, Lcom/immomo/moment/mediautils/l;->A:Ljava/util/LinkedList;

    .line 37
    .line 38
    invoke-virtual {v1}, Ljava/util/LinkedList;->size()I

    .line 39
    .line 40
    .line 41
    move-result v1

    .line 42
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 43
    .line 44
    .line 45
    const-string v1, " muxer status : "

    .line 46
    .line 47
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 48
    .line 49
    .line 50
    iget-object v1, p0, Lcom/immomo/moment/mediautils/l;->t:Ll/f220;

    .line 51
    .line 52
    if-eqz v1, :cond_0

    .line 53
    .line 54
    invoke-virtual {v1}, Ll/f220;->b()Z

    .line 55
    .line 56
    .line 57
    move-result v1

    .line 58
    if-eqz v1, :cond_0

    .line 59
    .line 60
    const-string v1, "starting"

    .line 61
    .line 62
    goto :goto_0

    .line 63
    :cond_0
    const-string v1, "not start"

    .line 64
    .line 65
    :goto_0
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 66
    .line 67
    .line 68
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    const-string v1, "MediaEncoderWrapper"

    .line 73
    .line 74
    invoke-static {v1, v0}, Lcom/cosmos/mdlog/MDLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 75
    .line 76
    .line 77
    iget-object v0, p0, Lcom/immomo/moment/mediautils/l;->B:Ljava/util/concurrent/LinkedBlockingQueue;

    .line 78
    .line 79
    invoke-virtual {v0}, Ljava/util/AbstractCollection;->isEmpty()Z

    .line 80
    .line 81
    .line 82
    move-result v0

    .line 83
    if-eqz v0, :cond_1

    .line 84
    .line 85
    iget-object v0, p0, Lcom/immomo/moment/mediautils/l;->z:Ljava/util/LinkedList;

    .line 86
    .line 87
    invoke-virtual {v0}, Ljava/util/AbstractCollection;->isEmpty()Z

    .line 88
    .line 89
    .line 90
    move-result v0

    .line 91
    if-eqz v0, :cond_1

    .line 92
    .line 93
    iget-object v0, p0, Lcom/immomo/moment/mediautils/l;->A:Ljava/util/LinkedList;

    .line 94
    .line 95
    invoke-virtual {v0}, Ljava/util/AbstractCollection;->isEmpty()Z

    .line 96
    .line 97
    .line 98
    move-result v0

    .line 99
    if-nez v0, :cond_3

    .line 100
    .line 101
    :cond_1
    iget-object p0, p0, Lcom/immomo/moment/mediautils/l;->t:Ll/f220;

    .line 102
    .line 103
    if-eqz p0, :cond_3

    .line 104
    .line 105
    invoke-virtual {p0}, Ll/f220;->b()Z

    .line 106
    .line 107
    .line 108
    move-result p0

    .line 109
    if-nez p0, :cond_2

    .line 110
    .line 111
    goto :goto_1

    .line 112
    :cond_2
    const/4 p0, 0x0

    .line 113
    return p0

    .line 114
    :cond_3
    :goto_1
    const/4 p0, 0x1

    .line 115
    return p0
.end method

.method private T(Z)V
    .locals 4

    .line 1
    const-string v0, "MediaEncoder"

    .line 2
    .line 3
    const-string v1, "May be lost audio frame , frame queue have data packet cnt is "

    .line 4
    .line 5
    new-instance v2, Ljava/lang/StringBuilder;

    .line 6
    .line 7
    const-string v3, "IsCancel "

    .line 8
    .line 9
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    const-string v3, "MediaEncoderWrapper"

    .line 20
    .line 21
    invoke-static {v3, v2}, Lcom/cosmos/mdlog/MDLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    if-nez p1, :cond_0

    .line 25
    .line 26
    invoke-direct {p0}, Lcom/immomo/moment/mediautils/l;->U()Z

    .line 27
    .line 28
    .line 29
    move-result p1

    .line 30
    if-nez p1, :cond_0

    .line 31
    .line 32
    new-instance p1, Ljava/lang/StringBuilder;

    .line 33
    .line 34
    const-string v2, "May be lost frame , raw frame queue size:"

    .line 35
    .line 36
    invoke-direct {p1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    iget-object v2, p0, Lcom/immomo/moment/mediautils/l;->B:Ljava/util/concurrent/LinkedBlockingQueue;

    .line 40
    .line 41
    invoke-virtual {v2}, Ljava/util/concurrent/LinkedBlockingQueue;->size()I

    .line 42
    .line 43
    .line 44
    move-result v2

    .line 45
    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    const-string v2, " audio packet queue size:"

    .line 49
    .line 50
    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 51
    .line 52
    .line 53
    iget-object v2, p0, Lcom/immomo/moment/mediautils/l;->A:Ljava/util/LinkedList;

    .line 54
    .line 55
    invoke-virtual {v2}, Ljava/util/LinkedList;->size()I

    .line 56
    .line 57
    .line 58
    move-result v2

    .line 59
    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 60
    .line 61
    .line 62
    const-string v2, " video packet queue size:"

    .line 63
    .line 64
    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 65
    .line 66
    .line 67
    iget-object v2, p0, Lcom/immomo/moment/mediautils/l;->A:Ljava/util/LinkedList;

    .line 68
    .line 69
    invoke-virtual {v2}, Ljava/util/LinkedList;->size()I

    .line 70
    .line 71
    .line 72
    move-result v2

    .line 73
    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 74
    .line 75
    .line 76
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 77
    .line 78
    .line 79
    move-result-object p1

    .line 80
    invoke-static {v3, p1}, Lcom/cosmos/mdlog/MDLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 81
    .line 82
    .line 83
    :cond_0
    const/4 p1, 0x0

    .line 84
    :try_start_0
    const-string v2, "MediaEncoderWrapper stopEncoding !!!"

    .line 85
    .line 86
    invoke-static {v0, v2}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 87
    .line 88
    .line 89
    iget-object v2, p0, Lcom/immomo/moment/mediautils/l;->r:Lcom/immomo/moment/mediautils/h;

    .line 90
    .line 91
    if-eqz v2, :cond_1

    .line 92
    .line 93
    invoke-virtual {v2}, Lcom/immomo/moment/mediautils/h;->C()V

    .line 94
    .line 95
    .line 96
    iput-object p1, p0, Lcom/immomo/moment/mediautils/l;->r:Lcom/immomo/moment/mediautils/h;

    .line 97
    .line 98
    goto :goto_0

    .line 99
    :catch_0
    move-exception v1

    .line 100
    goto :goto_1

    .line 101
    :cond_1
    :goto_0
    iget-object v2, p0, Lcom/immomo/moment/mediautils/l;->s:Lcom/immomo/moment/mediautils/h;

    .line 102
    .line 103
    if-eqz v2, :cond_3

    .line 104
    .line 105
    iget-object v2, p0, Lcom/immomo/moment/mediautils/l;->B:Ljava/util/concurrent/LinkedBlockingQueue;

    .line 106
    .line 107
    invoke-virtual {v2}, Ljava/util/concurrent/LinkedBlockingQueue;->size()I

    .line 108
    .line 109
    .line 110
    move-result v2

    .line 111
    if-lez v2, :cond_2

    .line 112
    .line 113
    new-instance v2, Ljava/lang/StringBuilder;

    .line 114
    .line 115
    invoke-direct {v2, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 116
    .line 117
    .line 118
    iget-object v1, p0, Lcom/immomo/moment/mediautils/l;->B:Ljava/util/concurrent/LinkedBlockingQueue;

    .line 119
    .line 120
    invoke-virtual {v1}, Ljava/util/concurrent/LinkedBlockingQueue;->size()I

    .line 121
    .line 122
    .line 123
    move-result v1

    .line 124
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 125
    .line 126
    .line 127
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 128
    .line 129
    .line 130
    move-result-object v1

    .line 131
    invoke-static {v0, v1}, Lcom/cosmos/mdlog/MDLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 132
    .line 133
    .line 134
    :cond_2
    iget-object v1, p0, Lcom/immomo/moment/mediautils/l;->s:Lcom/immomo/moment/mediautils/h;

    .line 135
    .line 136
    invoke-virtual {v1}, Lcom/immomo/moment/mediautils/h;->C()V

    .line 137
    .line 138
    .line 139
    iput-object p1, p0, Lcom/immomo/moment/mediautils/l;->s:Lcom/immomo/moment/mediautils/h;

    .line 140
    .line 141
    :cond_3
    iget-object v1, p0, Lcom/immomo/moment/mediautils/l;->t:Ll/f220;

    .line 142
    .line 143
    if-eqz v1, :cond_4

    .line 144
    .line 145
    invoke-virtual {v1}, Ll/f220;->e()V

    .line 146
    .line 147
    .line 148
    iput-object p1, p0, Lcom/immomo/moment/mediautils/l;->t:Ll/f220;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 149
    .line 150
    goto :goto_2

    .line 151
    :goto_1
    const-string v2, "StopEncoding failed !!!"

    .line 152
    .line 153
    invoke-static {v0, v2}, Lcom/cosmos/mdlog/MDLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 154
    .line 155
    .line 156
    iget-object v0, p0, Lcom/immomo/moment/mediautils/l;->R:Ll/spw;

    .line 157
    .line 158
    if-eqz v0, :cond_4

    .line 159
    .line 160
    new-instance v2, Ljava/lang/StringBuilder;

    .line 161
    .line 162
    const-string v3, "Stop encoding Exception !!! "

    .line 163
    .line 164
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 165
    .line 166
    .line 167
    invoke-static {v1}, Ll/g8g0;->a(Ljava/lang/Exception;)Ljava/lang/String;

    .line 168
    .line 169
    .line 170
    move-result-object v1

    .line 171
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 172
    .line 173
    .line 174
    const-string v1, " mOutputFilePath:"

    .line 175
    .line 176
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 177
    .line 178
    .line 179
    iget-object v1, p0, Lcom/immomo/moment/mediautils/e;->n:Ljava/lang/String;

    .line 180
    .line 181
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 182
    .line 183
    .line 184
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 185
    .line 186
    .line 187
    move-result-object v1

    .line 188
    const/16 v2, 0xbbf

    .line 189
    .line 190
    invoke-interface {v0, v2, v1}, Ll/spw;->onFail(ILjava/lang/String;)V

    .line 191
    .line 192
    .line 193
    :cond_4
    :goto_2
    iput-object p1, p0, Lcom/immomo/moment/mediautils/l;->v:Landroid/media/MediaFormat;

    .line 194
    .line 195
    iput-object p1, p0, Lcom/immomo/moment/mediautils/l;->u:Landroid/media/MediaFormat;

    .line 196
    .line 197
    iput-object p1, p0, Lcom/immomo/moment/mediautils/e;->n:Ljava/lang/String;

    .line 198
    .line 199
    iput-object p1, p0, Lcom/immomo/moment/mediautils/l;->F:Lcom/immomo/moment/mediautils/l$e;

    .line 200
    .line 201
    return-void
.end method

.method private U()Z
    .locals 8

    .line 1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    :goto_0
    invoke-direct {p0}, Lcom/immomo/moment/mediautils/l;->J()Z

    .line 6
    .line 7
    .line 8
    move-result v2

    .line 9
    const-string v3, "MediaEncoderWrapper"

    .line 10
    .line 11
    if-nez v2, :cond_1

    .line 12
    .line 13
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 14
    .line 15
    .line 16
    move-result-wide v4

    .line 17
    sub-long/2addr v4, v0

    .line 18
    const-wide/16 v6, 0x2710

    .line 19
    .line 20
    cmp-long v2, v4, v6

    .line 21
    .line 22
    if-lez v2, :cond_0

    .line 23
    .line 24
    const/4 p0, 0x0

    .line 25
    goto :goto_1

    .line 26
    :cond_0
    const-wide/16 v4, 0xa

    .line 27
    .line 28
    :try_start_0
    invoke-static {v4, v5}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 29
    .line 30
    .line 31
    goto :goto_0

    .line 32
    :catch_0
    move-exception v2

    .line 33
    invoke-static {v3, v2}, Lcom/cosmos/mdlog/MDLog;->printErrStackTrace(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 34
    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_1
    const/4 p0, 0x1

    .line 38
    :goto_1
    new-instance v2, Ljava/lang/StringBuilder;

    .line 39
    .line 40
    const-string v4, "wait encoder time:"

    .line 41
    .line 42
    invoke-direct {v2, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 43
    .line 44
    .line 45
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 46
    .line 47
    .line 48
    move-result-wide v4

    .line 49
    sub-long/2addr v4, v0

    .line 50
    invoke-virtual {v2, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 51
    .line 52
    .line 53
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    invoke-static {v3, v0}, Lcom/cosmos/mdlog/MDLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 58
    .line 59
    .line 60
    return p0
.end method

.method public static synthetic o(Lcom/immomo/moment/mediautils/l;)Ll/f220;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/moment/mediautils/l;->t:Ll/f220;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic p(Lcom/immomo/moment/mediautils/l;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/immomo/moment/mediautils/l;->D:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic q(Lcom/immomo/moment/mediautils/l;)Ljava/util/LinkedList;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/moment/mediautils/l;->A:Ljava/util/LinkedList;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic r(Lcom/immomo/moment/mediautils/l;I)I
    .locals 0

    .line 1
    iput p1, p0, Lcom/immomo/moment/mediautils/l;->D:I

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic s(Lcom/immomo/moment/mediautils/l;)Lcom/immomo/moment/mediautils/l$d;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    const/4 p0, 0x0

    .line 5
    return-object p0
.end method

.method public static synthetic t(Lcom/immomo/moment/mediautils/l;)Ljava/util/concurrent/LinkedBlockingQueue;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/moment/mediautils/l;->B:Ljava/util/concurrent/LinkedBlockingQueue;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic u(Lcom/immomo/moment/mediautils/l;Ljava/nio/ByteBuffer;Landroid/media/MediaCodec$BufferInfo;)Z
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/immomo/moment/mediautils/l;->I(Ljava/nio/ByteBuffer;Landroid/media/MediaCodec$BufferInfo;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public static synthetic v(Lcom/immomo/moment/mediautils/l;Ljava/nio/ByteBuffer;Landroid/media/MediaCodec$BufferInfo;)[Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/immomo/moment/mediautils/l;->G(Ljava/nio/ByteBuffer;Landroid/media/MediaCodec$BufferInfo;)[Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic w(Lcom/immomo/moment/mediautils/l;)Ljava/util/LinkedList;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/moment/mediautils/l;->z:Ljava/util/LinkedList;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic x(Lcom/immomo/moment/mediautils/l;)Lcom/immomo/moment/mediautils/l$f;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/moment/mediautils/l;->Q:Lcom/immomo/moment/mediautils/l$f;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic y(Lcom/immomo/moment/mediautils/l;)Lcom/immomo/moment/mediautils/l$d;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    const/4 p0, 0x0

    .line 5
    return-object p0
.end method

.method public static synthetic z(Lcom/immomo/moment/mediautils/l;)Ll/spw;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/moment/mediautils/l;->R:Ll/spw;

    .line 2
    .line 3
    return-object p0
.end method


# virtual methods
.method public E(Ll/ad60;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/immomo/moment/mediautils/l;->w:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    if-eqz p1, :cond_0

    .line 5
    .line 6
    :try_start_0
    iget-object p0, p0, Lcom/immomo/moment/mediautils/l;->B:Ljava/util/concurrent/LinkedBlockingQueue;

    .line 7
    .line 8
    invoke-virtual {p0, p1}, Ljava/util/concurrent/LinkedBlockingQueue;->offer(Ljava/lang/Object;)Z

    .line 9
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
    monitor-exit v0

    .line 15
    return-void

    .line 16
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 17
    throw p0
.end method

.method public H()Landroid/view/Surface;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/immomo/moment/mediautils/l;->w:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object p0, p0, Lcom/immomo/moment/mediautils/l;->r:Lcom/immomo/moment/mediautils/h;

    .line 5
    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/immomo/moment/mediautils/h;->x()Landroid/view/Surface;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    monitor-exit v0

    .line 13
    return-object p0

    .line 14
    :catchall_0
    move-exception p0

    .line 15
    goto :goto_0

    .line 16
    :cond_0
    const/4 p0, 0x0

    .line 17
    monitor-exit v0

    .line 18
    return-object p0

    .line 19
    :goto_0
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 20
    throw p0
.end method

.method public K(IIIII)V
    .locals 5
    .annotation build Landroidx/annotation/RequiresApi;
        api = 0x10
    .end annotation

    .line 1
    const-string v0, "Invalid parameter!  sampleRate="

    .line 2
    .line 3
    const-string v1, "Audio Invalid parameter!  sampleRate="

    .line 4
    .line 5
    iget-object v2, p0, Lcom/immomo/moment/mediautils/l;->w:Ljava/lang/Object;

    .line 6
    .line 7
    monitor-enter v2

    .line 8
    if-eqz p1, :cond_2

    .line 9
    .line 10
    if-eqz p3, :cond_2

    .line 11
    .line 12
    if-eqz p4, :cond_2

    .line 13
    .line 14
    if-nez p5, :cond_0

    .line 15
    .line 16
    goto :goto_1

    .line 17
    :cond_0
    :try_start_0
    iget-object p2, p0, Lcom/immomo/moment/mediautils/l;->v:Landroid/media/MediaFormat;

    .line 18
    .line 19
    if-nez p2, :cond_1

    .line 20
    .line 21
    new-instance p2, Landroid/media/MediaFormat;

    .line 22
    .line 23
    invoke-direct {p2}, Landroid/media/MediaFormat;-><init>()V

    .line 24
    .line 25
    .line 26
    iput-object p2, p0, Lcom/immomo/moment/mediautils/l;->v:Landroid/media/MediaFormat;

    .line 27
    .line 28
    const-string v0, "mime"

    .line 29
    .line 30
    const-string v1, "audio/mp4a-latm"

    .line 31
    .line 32
    invoke-virtual {p2, v0, v1}, Landroid/media/MediaFormat;->setString(Ljava/lang/String;Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    iget-object p2, p0, Lcom/immomo/moment/mediautils/l;->v:Landroid/media/MediaFormat;

    .line 36
    .line 37
    const-string v0, "bitrate"

    .line 38
    .line 39
    invoke-virtual {p2, v0, p4}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 40
    .line 41
    .line 42
    iget-object p2, p0, Lcom/immomo/moment/mediautils/l;->v:Landroid/media/MediaFormat;

    .line 43
    .line 44
    const-string p4, "channel-count"

    .line 45
    .line 46
    invoke-virtual {p2, p4, p3}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 47
    .line 48
    .line 49
    iget-object p2, p0, Lcom/immomo/moment/mediautils/l;->v:Landroid/media/MediaFormat;

    .line 50
    .line 51
    const-string p4, "sample-rate"

    .line 52
    .line 53
    invoke-virtual {p2, p4, p1}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 54
    .line 55
    .line 56
    iget-object p2, p0, Lcom/immomo/moment/mediautils/l;->v:Landroid/media/MediaFormat;

    .line 57
    .line 58
    const-string p4, "aac-profile"

    .line 59
    .line 60
    const/4 v0, 0x2

    .line 61
    invoke-virtual {p2, p4, v0}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 62
    .line 63
    .line 64
    iget-object p2, p0, Lcom/immomo/moment/mediautils/l;->v:Landroid/media/MediaFormat;

    .line 65
    .line 66
    const-string p4, "max-input-size"

    .line 67
    .line 68
    invoke-virtual {p2, p4, p5}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 69
    .line 70
    .line 71
    iget p2, p0, Lcom/immomo/moment/mediautils/l;->x:I

    .line 72
    .line 73
    or-int/lit8 p2, p2, 0x1

    .line 74
    .line 75
    iput p2, p0, Lcom/immomo/moment/mediautils/l;->x:I

    .line 76
    .line 77
    mul-int/lit8 p3, p3, 0x10

    .line 78
    .line 79
    div-int/lit8 p3, p3, 0x8

    .line 80
    .line 81
    iput p3, p0, Lcom/immomo/moment/mediautils/l;->N:I

    .line 82
    .line 83
    const p2, 0xf4240

    .line 84
    .line 85
    .line 86
    mul-int/2addr p1, p3

    .line 87
    div-int/2addr p2, p1

    .line 88
    int-to-float p1, p2

    .line 89
    iput p1, p0, Lcom/immomo/moment/mediautils/l;->O:F

    .line 90
    .line 91
    goto :goto_0

    .line 92
    :catchall_0
    move-exception p0

    .line 93
    goto :goto_2

    .line 94
    :cond_1
    :goto_0
    monitor-exit v2

    .line 95
    return-void

    .line 96
    :cond_2
    :goto_1
    iget-object p0, p0, Lcom/immomo/moment/mediautils/l;->R:Ll/spw;

    .line 97
    .line 98
    if-eqz p0, :cond_3

    .line 99
    .line 100
    const-string v3, "the Audio encoder parameter is exception !!!"

    .line 101
    .line 102
    const/16 v4, 0xbb8

    .line 103
    .line 104
    invoke-interface {p0, v4, v3}, Ll/spw;->onFail(ILjava/lang/String;)V

    .line 105
    .line 106
    .line 107
    :cond_3
    const-string p0, "MediaEncoder"

    .line 108
    .line 109
    new-instance v3, Ljava/lang/StringBuilder;

    .line 110
    .line 111
    invoke-direct {v3, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 112
    .line 113
    .line 114
    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 115
    .line 116
    .line 117
    const-string v1, " bits="

    .line 118
    .line 119
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 120
    .line 121
    .line 122
    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 123
    .line 124
    .line 125
    const-string v1, " channels="

    .line 126
    .line 127
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 128
    .line 129
    .line 130
    invoke-virtual {v3, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 131
    .line 132
    .line 133
    const-string v1, " bitrate="

    .line 134
    .line 135
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 136
    .line 137
    .line 138
    invoke-virtual {v3, p4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 139
    .line 140
    .line 141
    const-string v1, " maxInputBufsize="

    .line 142
    .line 143
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 144
    .line 145
    .line 146
    invoke-virtual {v3, p5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 147
    .line 148
    .line 149
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 150
    .line 151
    .line 152
    move-result-object v1

    .line 153
    invoke-static {p0, v1}, Lcom/cosmos/mdlog/MDLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 154
    .line 155
    .line 156
    new-instance p0, Ljava/security/InvalidParameterException;

    .line 157
    .line 158
    new-instance v1, Ljava/lang/StringBuilder;

    .line 159
    .line 160
    invoke-direct {v1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 161
    .line 162
    .line 163
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 164
    .line 165
    .line 166
    const-string p1, " bits="

    .line 167
    .line 168
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 169
    .line 170
    .line 171
    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 172
    .line 173
    .line 174
    const-string p1, " channels="

    .line 175
    .line 176
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 177
    .line 178
    .line 179
    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 180
    .line 181
    .line 182
    const-string p1, " bitrate="

    .line 183
    .line 184
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 185
    .line 186
    .line 187
    invoke-virtual {v1, p4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 188
    .line 189
    .line 190
    const-string p1, " maxInputBufsize="

    .line 191
    .line 192
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 193
    .line 194
    .line 195
    invoke-virtual {v1, p5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 196
    .line 197
    .line 198
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 199
    .line 200
    .line 201
    move-result-object p1

    .line 202
    invoke-direct {p0, p1}, Ljava/security/InvalidParameterException;-><init>(Ljava/lang/String;)V

    .line 203
    .line 204
    .line 205
    throw p0

    .line 206
    :goto_2
    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 207
    throw p0
.end method

.method public L()V
    .locals 4
    .annotation build Landroid/annotation/TargetApi;
        value = 0x15
    .end annotation

    .line 1
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 2
    .line 3
    const/16 v1, 0x1c

    .line 4
    .line 5
    const-string v2, "bitrate-mode"

    .line 6
    .line 7
    const/4 v3, 0x0

    .line 8
    if-lt v0, v1, :cond_2

    .line 9
    .line 10
    const-string v0, "video/avc"

    .line 11
    .line 12
    invoke-static {v0, v3}, Lcom/immomo/moment/mediautils/h;->z(Ljava/lang/String;I)Z

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    if-nez v1, :cond_1

    .line 17
    .line 18
    invoke-static {}, Ll/vrx;->a()Z

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    if-eqz v1, :cond_0

    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_0
    return-void

    .line 26
    :cond_1
    :goto_0
    iget-object v1, p0, Lcom/immomo/moment/mediautils/l;->u:Landroid/media/MediaFormat;

    .line 27
    .line 28
    invoke-virtual {v1, v2, v3}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 29
    .line 30
    .line 31
    iget-object p0, p0, Lcom/immomo/moment/mediautils/l;->u:Landroid/media/MediaFormat;

    .line 32
    .line 33
    const-string v1, "quality"

    .line 34
    .line 35
    invoke-static {v0}, Lcom/immomo/moment/mediautils/h;->y(Ljava/lang/String;)I

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    invoke-virtual {p0, v1, v0}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 40
    .line 41
    .line 42
    return-void

    .line 43
    :cond_2
    iget-object p0, p0, Lcom/immomo/moment/mediautils/l;->u:Landroid/media/MediaFormat;

    .line 44
    .line 45
    invoke-virtual {p0, v2, v3}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 46
    .line 47
    .line 48
    return-void
.end method

.method public M(Ll/spw;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/moment/mediautils/l;->R:Ll/spw;

    .line 2
    .line 3
    return-void
.end method

.method public N(Ljava/lang/String;)V
    .locals 4

    .line 1
    const-string v0, "Invalid parameter! outPath="

    .line 2
    .line 3
    const-string v1, "Invalid parameter! outPath="

    .line 4
    .line 5
    iget-object v2, p0, Lcom/immomo/moment/mediautils/l;->w:Ljava/lang/Object;

    .line 6
    .line 7
    monitor-enter v2

    .line 8
    if-eqz p1, :cond_0

    .line 9
    .line 10
    :try_start_0
    iput-object p1, p0, Lcom/immomo/moment/mediautils/e;->n:Ljava/lang/String;

    .line 11
    .line 12
    monitor-exit v2

    .line 13
    return-void

    .line 14
    :catchall_0
    move-exception p0

    .line 15
    goto :goto_0

    .line 16
    :cond_0
    const-string p0, "MediaEncoder"

    .line 17
    .line 18
    new-instance v3, Ljava/lang/StringBuilder;

    .line 19
    .line 20
    invoke-direct {v3, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    invoke-static {p0, v1}, Lcom/cosmos/mdlog/MDLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    new-instance p0, Ljava/security/InvalidParameterException;

    .line 34
    .line 35
    new-instance v1, Ljava/lang/StringBuilder;

    .line 36
    .line 37
    invoke-direct {v1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    invoke-direct {p0, p1}, Ljava/security/InvalidParameterException;-><init>(Ljava/lang/String;)V

    .line 48
    .line 49
    .line 50
    throw p0

    .line 51
    :goto_0
    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 52
    throw p0
.end method

.method public O(Landroid/os/Bundle;)V
    .locals 3

    .line 1
    :try_start_0
    iget-object v0, p0, Lcom/immomo/moment/mediautils/l;->r:Lcom/immomo/moment/mediautils/h;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Lcom/immomo/moment/mediautils/h;->K(Landroid/os/Bundle;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :catch_0
    move-exception p1

    .line 10
    new-instance v0, Ljava/lang/StringBuilder;

    .line 11
    .line 12
    const-string v1, "set encoder params error !!! "

    .line 13
    .line 14
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    const-string v2, "MediaEncoder"

    .line 29
    .line 30
    invoke-static {v2, v0}, Lcom/cosmos/mdlog/MDLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    iget-object v0, p0, Lcom/immomo/moment/mediautils/l;->R:Ll/spw;

    .line 34
    .line 35
    if-eqz v0, :cond_0

    .line 36
    .line 37
    new-instance v2, Ljava/lang/StringBuilder;

    .line 38
    .line 39
    invoke-direct {v2, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    invoke-static {p1}, Ll/g8g0;->a(Ljava/lang/Exception;)Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 47
    .line 48
    .line 49
    const-string p1, " mOutputFilePath:"

    .line 50
    .line 51
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 52
    .line 53
    .line 54
    iget-object p0, p0, Lcom/immomo/moment/mediautils/e;->n:Ljava/lang/String;

    .line 55
    .line 56
    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 57
    .line 58
    .line 59
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object p0

    .line 63
    const/16 p1, 0xbc1

    .line 64
    .line 65
    invoke-interface {v0, p1, p0}, Ll/spw;->onFail(ILjava/lang/String;)V

    .line 66
    .line 67
    .line 68
    :cond_0
    return-void
.end method

.method public P(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/immomo/moment/mediautils/l;->P:F

    .line 2
    .line 3
    return-void
.end method

.method public Q(Lcom/immomo/moment/mediautils/l$f;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/moment/mediautils/l;->Q:Lcom/immomo/moment/mediautils/l$f;

    .line 2
    .line 3
    return-void
.end method

.method public R(Lcom/immomo/moment/mediautils/l$e;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/immomo/moment/mediautils/l;->w:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iput-object p1, p0, Lcom/immomo/moment/mediautils/l;->F:Lcom/immomo/moment/mediautils/l$e;

    .line 5
    .line 6
    monitor-exit v0

    .line 7
    return-void

    .line 8
    :catchall_0
    move-exception p0

    .line 9
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 10
    throw p0
.end method

.method public S(IIIIIIIZ)V
    .locals 4
    .annotation build Landroidx/annotation/RequiresApi;
        api = 0x10
    .end annotation

    .line 1
    const-string v0, "Parameter is invalid ! width="

    .line 2
    .line 3
    const-string v1, "Video Parameter is invalid ! width="

    .line 4
    .line 5
    iget-object v2, p0, Lcom/immomo/moment/mediautils/l;->w:Ljava/lang/Object;

    .line 6
    .line 7
    monitor-enter v2

    .line 8
    if-eqz p1, :cond_5

    .line 9
    .line 10
    if-eqz p2, :cond_5

    .line 11
    .line 12
    if-eqz p3, :cond_5

    .line 13
    .line 14
    if-eqz p4, :cond_5

    .line 15
    .line 16
    :try_start_0
    sget v3, Lcom/immomo/moment/mediautils/l;->U:I

    .line 17
    .line 18
    if-lt p7, v3, :cond_5

    .line 19
    .line 20
    sget v3, Lcom/immomo/moment/mediautils/l;->V:I

    .line 21
    .line 22
    if-le p7, v3, :cond_0

    .line 23
    .line 24
    goto :goto_1

    .line 25
    :cond_0
    iget-object v0, p0, Lcom/immomo/moment/mediautils/l;->u:Landroid/media/MediaFormat;

    .line 26
    .line 27
    if-nez v0, :cond_4

    .line 28
    .line 29
    const-string v0, "video/avc"

    .line 30
    .line 31
    invoke-static {v0, p1, p2}, Landroid/media/MediaFormat;->createVideoFormat(Ljava/lang/String;II)Landroid/media/MediaFormat;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    iput-object p1, p0, Lcom/immomo/moment/mediautils/l;->u:Landroid/media/MediaFormat;

    .line 36
    .line 37
    const-string p2, "bitrate"

    .line 38
    .line 39
    invoke-virtual {p1, p2, p4}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 40
    .line 41
    .line 42
    iget-object p1, p0, Lcom/immomo/moment/mediautils/l;->u:Landroid/media/MediaFormat;

    .line 43
    .line 44
    const-string p2, "frame-rate"

    .line 45
    .line 46
    invoke-virtual {p1, p2, p3}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 47
    .line 48
    .line 49
    sget p1, Lcom/immomo/moment/mediautils/l;->U:I

    .line 50
    .line 51
    if-ne p7, p1, :cond_1

    .line 52
    .line 53
    iget-object p1, p0, Lcom/immomo/moment/mediautils/l;->u:Landroid/media/MediaFormat;

    .line 54
    .line 55
    const-string p2, "color-format"

    .line 56
    .line 57
    const p3, 0x7f000789

    .line 58
    .line 59
    .line 60
    invoke-virtual {p1, p2, p3}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 61
    .line 62
    .line 63
    goto :goto_0

    .line 64
    :catchall_0
    move-exception p0

    .line 65
    goto/16 :goto_2

    .line 66
    .line 67
    :cond_1
    sget p1, Lcom/immomo/moment/mediautils/l;->V:I

    .line 68
    .line 69
    if-ne p7, p1, :cond_2

    .line 70
    .line 71
    iget-object p1, p0, Lcom/immomo/moment/mediautils/l;->u:Landroid/media/MediaFormat;

    .line 72
    .line 73
    const-string p2, "color-format"

    .line 74
    .line 75
    const/16 p3, 0x13

    .line 76
    .line 77
    invoke-virtual {p1, p2, p3}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 78
    .line 79
    .line 80
    :cond_2
    :goto_0
    iget-object p1, p0, Lcom/immomo/moment/mediautils/l;->u:Landroid/media/MediaFormat;

    .line 81
    .line 82
    const-string p2, "i-frame-interval"

    .line 83
    .line 84
    invoke-virtual {p1, p2, p5}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 85
    .line 86
    .line 87
    if-eqz p6, :cond_3

    .line 88
    .line 89
    if-eqz p8, :cond_3

    .line 90
    .line 91
    iput p6, p0, Lcom/immomo/moment/mediautils/l;->y:I

    .line 92
    .line 93
    :cond_3
    iget p1, p0, Lcom/immomo/moment/mediautils/l;->x:I

    .line 94
    .line 95
    or-int/lit8 p1, p1, 0x2

    .line 96
    .line 97
    iput p1, p0, Lcom/immomo/moment/mediautils/l;->x:I

    .line 98
    .line 99
    :cond_4
    monitor-exit v2

    .line 100
    return-void

    .line 101
    :cond_5
    :goto_1
    iget-object p0, p0, Lcom/immomo/moment/mediautils/l;->R:Ll/spw;

    .line 102
    .line 103
    if-eqz p0, :cond_6

    .line 104
    .line 105
    const-string p6, "the Video encoder parameter is exception !!!"

    .line 106
    .line 107
    const/16 p8, 0xbb9

    .line 108
    .line 109
    invoke-interface {p0, p8, p6}, Ll/spw;->onFail(ILjava/lang/String;)V

    .line 110
    .line 111
    .line 112
    :cond_6
    const-string p0, "MediaEncoder"

    .line 113
    .line 114
    new-instance p6, Ljava/lang/StringBuilder;

    .line 115
    .line 116
    invoke-direct {p6, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 117
    .line 118
    .line 119
    invoke-virtual {p6, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 120
    .line 121
    .line 122
    const-string p8, " height="

    .line 123
    .line 124
    invoke-virtual {p6, p8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 125
    .line 126
    .line 127
    invoke-virtual {p6, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 128
    .line 129
    .line 130
    const-string p8, " fps="

    .line 131
    .line 132
    invoke-virtual {p6, p8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 133
    .line 134
    .line 135
    invoke-virtual {p6, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 136
    .line 137
    .line 138
    const-string p8, " bitrate="

    .line 139
    .line 140
    invoke-virtual {p6, p8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 141
    .line 142
    .line 143
    invoke-virtual {p6, p4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 144
    .line 145
    .line 146
    const-string p8, " gopSize="

    .line 147
    .line 148
    invoke-virtual {p6, p8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 149
    .line 150
    .line 151
    invoke-virtual {p6, p5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 152
    .line 153
    .line 154
    const-string p8, " srcType="

    .line 155
    .line 156
    invoke-virtual {p6, p8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 157
    .line 158
    .line 159
    invoke-virtual {p6, p7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 160
    .line 161
    .line 162
    invoke-virtual {p6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 163
    .line 164
    .line 165
    move-result-object p6

    .line 166
    invoke-static {p0, p6}, Lcom/cosmos/mdlog/MDLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 167
    .line 168
    .line 169
    new-instance p0, Ljava/security/InvalidParameterException;

    .line 170
    .line 171
    new-instance p6, Ljava/lang/StringBuilder;

    .line 172
    .line 173
    invoke-direct {p6, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 174
    .line 175
    .line 176
    invoke-virtual {p6, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 177
    .line 178
    .line 179
    const-string p1, " height="

    .line 180
    .line 181
    invoke-virtual {p6, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 182
    .line 183
    .line 184
    invoke-virtual {p6, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 185
    .line 186
    .line 187
    const-string p1, " fps="

    .line 188
    .line 189
    invoke-virtual {p6, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 190
    .line 191
    .line 192
    invoke-virtual {p6, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 193
    .line 194
    .line 195
    const-string p1, " bitrate="

    .line 196
    .line 197
    invoke-virtual {p6, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 198
    .line 199
    .line 200
    invoke-virtual {p6, p4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 201
    .line 202
    .line 203
    const-string p1, " gopSize="

    .line 204
    .line 205
    invoke-virtual {p6, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 206
    .line 207
    .line 208
    invoke-virtual {p6, p5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 209
    .line 210
    .line 211
    const-string p1, " srcType="

    .line 212
    .line 213
    invoke-virtual {p6, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 214
    .line 215
    .line 216
    invoke-virtual {p6, p7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 217
    .line 218
    .line 219
    invoke-virtual {p6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 220
    .line 221
    .line 222
    move-result-object p1

    .line 223
    invoke-direct {p0, p1}, Ljava/security/InvalidParameterException;-><init>(Ljava/lang/String;)V

    .line 224
    .line 225
    .line 226
    throw p0

    .line 227
    :goto_2
    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 228
    throw p0
.end method

.method public a()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-direct {p0, v0}, Lcom/immomo/moment/mediautils/l;->T(Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public b(Ll/ad60;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/immomo/moment/mediautils/l;->w:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    if-eqz p1, :cond_0

    .line 5
    .line 6
    :try_start_0
    iget-object p0, p0, Lcom/immomo/moment/mediautils/l;->B:Ljava/util/concurrent/LinkedBlockingQueue;

    .line 7
    .line 8
    invoke-virtual {p0, p1}, Ljava/util/concurrent/LinkedBlockingQueue;->offer(Ljava/lang/Object;)Z

    .line 9
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
    monitor-exit v0

    .line 15
    return-void

    .line 16
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 17
    throw p0
.end method

.method public c(Ll/ad60;)V
    .locals 0

    .line 1
    return-void
.end method

.method public m()Z
    .locals 10
    .annotation build Landroidx/annotation/RequiresApi;
        api = 0x10
    .end annotation

    .line 1
    const-string v0, "Create audio mediacodec erorr ! mOutputFilePath:"

    .line 2
    .line 3
    const-string v1, "Create video mediacodec error ! mOutputFilePath:"

    .line 4
    .line 5
    const-string v2, "Create video mediacodec error !"

    .line 6
    .line 7
    const-string v3, "The Mp4MuxerWrapper create failed mOutputFilePath:"

    .line 8
    .line 9
    const-string v4, "The Mp4MuxerWrapper create failed"

    .line 10
    .line 11
    iget-object v5, p0, Lcom/immomo/moment/mediautils/l;->w:Ljava/lang/Object;

    .line 12
    .line 13
    monitor-enter v5

    .line 14
    :try_start_0
    iget-object v6, p0, Lcom/immomo/moment/mediautils/l;->t:Ll/f220;

    .line 15
    .line 16
    const/4 v7, 0x0

    .line 17
    if-nez v6, :cond_1

    .line 18
    .line 19
    iget v6, p0, Lcom/immomo/moment/mediautils/l;->x:I

    .line 20
    .line 21
    if-eqz v6, :cond_1

    .line 22
    .line 23
    iget-object v8, p0, Lcom/immomo/moment/mediautils/e;->n:Ljava/lang/String;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 24
    .line 25
    if-eqz v8, :cond_1

    .line 26
    .line 27
    :try_start_1
    new-instance v9, Ll/d710;

    .line 28
    .line 29
    invoke-direct {v9, v8, v6}, Ll/d710;-><init>(Ljava/lang/String;I)V

    .line 30
    .line 31
    .line 32
    iput-object v9, p0, Lcom/immomo/moment/mediautils/l;->t:Ll/f220;
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 33
    .line 34
    goto :goto_0

    .line 35
    :catchall_0
    move-exception p0

    .line 36
    goto/16 :goto_2

    .line 37
    .line 38
    :catch_0
    move-exception v0

    .line 39
    :try_start_2
    const-string v1, "MediaEncoder"

    .line 40
    .line 41
    new-instance v2, Ljava/lang/StringBuilder;

    .line 42
    .line 43
    invoke-direct {v2, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 51
    .line 52
    .line 53
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    invoke-static {v1, v0}, Lcom/cosmos/mdlog/MDLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 58
    .line 59
    .line 60
    iget-object v0, p0, Lcom/immomo/moment/mediautils/l;->R:Ll/spw;

    .line 61
    .line 62
    if-eqz v0, :cond_0

    .line 63
    .line 64
    new-instance v1, Ljava/lang/StringBuilder;

    .line 65
    .line 66
    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 67
    .line 68
    .line 69
    iget-object v2, p0, Lcom/immomo/moment/mediautils/e;->n:Ljava/lang/String;

    .line 70
    .line 71
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 72
    .line 73
    .line 74
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 75
    .line 76
    .line 77
    move-result-object v1

    .line 78
    const/16 v2, 0xbba

    .line 79
    .line 80
    invoke-interface {v0, v2, v1}, Ll/spw;->onFail(ILjava/lang/String;)V

    .line 81
    .line 82
    .line 83
    :cond_0
    const/4 v0, 0x0

    .line 84
    iput-object v0, p0, Lcom/immomo/moment/mediautils/l;->t:Ll/f220;

    .line 85
    .line 86
    monitor-exit v5

    .line 87
    return v7

    .line 88
    :cond_1
    :goto_0
    iget-object v3, p0, Lcom/immomo/moment/mediautils/l;->u:Landroid/media/MediaFormat;

    .line 89
    .line 90
    const/4 v4, 0x1

    .line 91
    if-eqz v3, :cond_6

    .line 92
    .line 93
    new-instance v3, Lcom/immomo/moment/mediautils/h;

    .line 94
    .line 95
    invoke-direct {v3}, Lcom/immomo/moment/mediautils/h;-><init>()V

    .line 96
    .line 97
    .line 98
    iput-object v3, p0, Lcom/immomo/moment/mediautils/l;->r:Lcom/immomo/moment/mediautils/h;

    .line 99
    .line 100
    iget-object v6, p0, Lcom/immomo/moment/mediautils/l;->u:Landroid/media/MediaFormat;

    .line 101
    .line 102
    invoke-virtual {v3, v6, v7}, Lcom/immomo/moment/mediautils/h;->u(Landroid/media/MediaFormat;I)Z

    .line 103
    .line 104
    .line 105
    move-result v3

    .line 106
    if-nez v3, :cond_3

    .line 107
    .line 108
    const-string v0, "MediaEncoder"

    .line 109
    .line 110
    new-instance v3, Ljava/lang/StringBuilder;

    .line 111
    .line 112
    invoke-direct {v3, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 113
    .line 114
    .line 115
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 116
    .line 117
    .line 118
    move-result-object v2

    .line 119
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 120
    .line 121
    .line 122
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 123
    .line 124
    .line 125
    move-result-object v2

    .line 126
    invoke-static {v0, v2}, Lcom/cosmos/mdlog/MDLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 127
    .line 128
    .line 129
    iget-object v0, p0, Lcom/immomo/moment/mediautils/l;->R:Ll/spw;

    .line 130
    .line 131
    if-eqz v0, :cond_2

    .line 132
    .line 133
    new-instance v2, Ljava/lang/StringBuilder;

    .line 134
    .line 135
    invoke-direct {v2, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 136
    .line 137
    .line 138
    iget-object p0, p0, Lcom/immomo/moment/mediautils/e;->n:Ljava/lang/String;

    .line 139
    .line 140
    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 141
    .line 142
    .line 143
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 144
    .line 145
    .line 146
    move-result-object p0

    .line 147
    const/16 v1, 0xbbb

    .line 148
    .line 149
    invoke-interface {v0, v1, p0}, Ll/spw;->onFail(ILjava/lang/String;)V

    .line 150
    .line 151
    .line 152
    :cond_2
    monitor-exit v5

    .line 153
    return v7

    .line 154
    :cond_3
    iget v1, p0, Lcom/immomo/moment/mediautils/l;->y:I

    .line 155
    .line 156
    if-eqz v1, :cond_4

    .line 157
    .line 158
    iget-object v2, p0, Lcom/immomo/moment/mediautils/l;->t:Ll/f220;

    .line 159
    .line 160
    invoke-virtual {v2, v1}, Ll/f220;->c(I)V

    .line 161
    .line 162
    .line 163
    :cond_4
    iget-object v1, p0, Lcom/immomo/moment/mediautils/l;->r:Lcom/immomo/moment/mediautils/h;

    .line 164
    .line 165
    new-instance v2, Lcom/immomo/moment/mediautils/l$a;

    .line 166
    .line 167
    invoke-direct {v2, p0}, Lcom/immomo/moment/mediautils/l$a;-><init>(Lcom/immomo/moment/mediautils/l;)V

    .line 168
    .line 169
    .line 170
    invoke-virtual {v1, v2}, Lcom/immomo/moment/mediautils/h;->I(Lcom/immomo/moment/mediautils/h$b;)V

    .line 171
    .line 172
    .line 173
    iget-object v1, p0, Lcom/immomo/moment/mediautils/l;->u:Landroid/media/MediaFormat;

    .line 174
    .line 175
    const-string v2, "color-format"

    .line 176
    .line 177
    invoke-virtual {v1, v2}, Landroid/media/MediaFormat;->getInteger(Ljava/lang/String;)I

    .line 178
    .line 179
    .line 180
    move-result v1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 181
    iget-object v2, p0, Lcom/immomo/moment/mediautils/l;->r:Lcom/immomo/moment/mediautils/h;

    .line 182
    .line 183
    const/16 v3, 0x13

    .line 184
    .line 185
    if-ne v1, v3, :cond_5

    .line 186
    .line 187
    :try_start_3
    invoke-virtual {v2, v4}, Lcom/immomo/moment/mediautils/h;->L(Z)V

    .line 188
    .line 189
    .line 190
    goto :goto_1

    .line 191
    :cond_5
    invoke-virtual {v2, v7}, Lcom/immomo/moment/mediautils/h;->L(Z)V

    .line 192
    .line 193
    .line 194
    :cond_6
    :goto_1
    iget-object v1, p0, Lcom/immomo/moment/mediautils/l;->v:Landroid/media/MediaFormat;

    .line 195
    .line 196
    if-eqz v1, :cond_9

    .line 197
    .line 198
    new-instance v1, Lcom/immomo/moment/mediautils/h;

    .line 199
    .line 200
    invoke-direct {v1}, Lcom/immomo/moment/mediautils/h;-><init>()V

    .line 201
    .line 202
    .line 203
    iput-object v1, p0, Lcom/immomo/moment/mediautils/l;->s:Lcom/immomo/moment/mediautils/h;

    .line 204
    .line 205
    iget-object v2, p0, Lcom/immomo/moment/mediautils/l;->v:Landroid/media/MediaFormat;

    .line 206
    .line 207
    invoke-virtual {v1, v2, v7}, Lcom/immomo/moment/mediautils/h;->u(Landroid/media/MediaFormat;I)Z

    .line 208
    .line 209
    .line 210
    move-result v1

    .line 211
    if-nez v1, :cond_8

    .line 212
    .line 213
    const-string v1, "MediaEncoder"

    .line 214
    .line 215
    const-string v2, "Create audio mediacodec erorr !"

    .line 216
    .line 217
    invoke-static {v1, v2}, Lcom/cosmos/mdlog/MDLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 218
    .line 219
    .line 220
    iget-object v1, p0, Lcom/immomo/moment/mediautils/l;->R:Ll/spw;

    .line 221
    .line 222
    if-eqz v1, :cond_7

    .line 223
    .line 224
    new-instance v2, Ljava/lang/StringBuilder;

    .line 225
    .line 226
    invoke-direct {v2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 227
    .line 228
    .line 229
    iget-object p0, p0, Lcom/immomo/moment/mediautils/e;->n:Ljava/lang/String;

    .line 230
    .line 231
    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 232
    .line 233
    .line 234
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 235
    .line 236
    .line 237
    move-result-object p0

    .line 238
    const/16 v0, 0xbbc

    .line 239
    .line 240
    invoke-interface {v1, v0, p0}, Ll/spw;->onFail(ILjava/lang/String;)V

    .line 241
    .line 242
    .line 243
    :cond_7
    monitor-exit v5

    .line 244
    return v7

    .line 245
    :cond_8
    iget-object v0, p0, Lcom/immomo/moment/mediautils/l;->s:Lcom/immomo/moment/mediautils/h;

    .line 246
    .line 247
    new-instance v1, Lcom/immomo/moment/mediautils/l$b;

    .line 248
    .line 249
    invoke-direct {v1, p0}, Lcom/immomo/moment/mediautils/l$b;-><init>(Lcom/immomo/moment/mediautils/l;)V

    .line 250
    .line 251
    .line 252
    invoke-virtual {v0, v1}, Lcom/immomo/moment/mediautils/h;->I(Lcom/immomo/moment/mediautils/h$b;)V

    .line 253
    .line 254
    .line 255
    iput v7, p0, Lcom/immomo/moment/mediautils/l;->S:I

    .line 256
    .line 257
    iput v7, p0, Lcom/immomo/moment/mediautils/l;->T:I

    .line 258
    .line 259
    iget-object p0, p0, Lcom/immomo/moment/mediautils/l;->s:Lcom/immomo/moment/mediautils/h;

    .line 260
    .line 261
    invoke-virtual {p0, v4}, Lcom/immomo/moment/mediautils/h;->L(Z)V

    .line 262
    .line 263
    .line 264
    :cond_9
    monitor-exit v5

    .line 265
    return v4

    .line 266
    :goto_2
    monitor-exit v5
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 267
    throw p0
.end method

.method public n()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, v0}, Lcom/immomo/moment/mediautils/l;->T(Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

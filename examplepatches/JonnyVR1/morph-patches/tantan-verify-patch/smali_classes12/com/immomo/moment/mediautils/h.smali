.class public Lcom/immomo/moment/mediautils/h;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/immomo/moment/mediautils/h$c;,
        Lcom/immomo/moment/mediautils/h$a;,
        Lcom/immomo/moment/mediautils/h$b;,
        Lcom/immomo/moment/mediautils/h$d;
    }
.end annotation


# instance fields
.field private A:Z

.field private B:Z

.field private C:Ljava/lang/Object;

.field private D:Ljava/lang/Object;

.field private E:Ljava/lang/String;

.field private F:Z

.field private G:Z

.field private H:Z

.field private I:Ljava/nio/ByteBuffer;

.field private J:Landroid/media/MediaCodec$BufferInfo;

.field private K:Lcom/immomo/moment/mediautils/h$d;

.field private L:I

.field M:I

.field N:Z

.field private final a:I

.field private final b:I

.field private final c:Ljava/lang/String;

.field private final d:Ljava/lang/String;

.field private final e:Ljava/lang/String;

.field private final f:J

.field private final g:J

.field private h:Landroid/media/MediaCodec;

.field private i:Landroid/view/Surface;

.field private j:Ljava/lang/String;

.field private k:[Ljava/nio/ByteBuffer;

.field private l:[Ljava/nio/ByteBuffer;

.field private m:Ljava/lang/Thread;

.field private n:Ljava/lang/Thread;

.field private o:Ljava/lang/Object;

.field private p:I

.field private q:Z

.field private r:Z

.field private s:Lcom/immomo/moment/mediautils/h$b;

.field private t:Lcom/immomo/moment/mediautils/h$a;

.field private u:Ljava/util/concurrent/LinkedBlockingQueue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/LinkedBlockingQueue<",
            "Ll/ad60;",
            ">;"
        }
    .end annotation
.end field

.field private v:Ljava/util/LinkedList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedList<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private w:Ljava/lang/Object;

.field private x:Z

.field private y:Z

.field private z:Z


# direct methods
.method public constructor <init>()V
    .locals 3

    .line 181
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/16 v0, 0x191

    .line 182
    iput v0, p0, Lcom/immomo/moment/mediautils/h;->a:I

    const/16 v0, 0x192

    .line 183
    iput v0, p0, Lcom/immomo/moment/mediautils/h;->b:I

    .line 184
    const-string v0, "MedaiCodecWrapper"

    iput-object v0, p0, Lcom/immomo/moment/mediautils/h;->c:Ljava/lang/String;

    .line 185
    const-string v0, "video"

    iput-object v0, p0, Lcom/immomo/moment/mediautils/h;->d:Ljava/lang/String;

    .line 186
    const-string v0, "audio"

    iput-object v0, p0, Lcom/immomo/moment/mediautils/h;->e:Ljava/lang/String;

    const-wide/16 v0, 0x2710

    .line 187
    iput-wide v0, p0, Lcom/immomo/moment/mediautils/h;->f:J

    const-wide/16 v0, 0xc8

    .line 188
    iput-wide v0, p0, Lcom/immomo/moment/mediautils/h;->g:J

    const/4 v0, 0x0

    .line 189
    iput-object v0, p0, Lcom/immomo/moment/mediautils/h;->h:Landroid/media/MediaCodec;

    .line 190
    iput-object v0, p0, Lcom/immomo/moment/mediautils/h;->i:Landroid/view/Surface;

    .line 191
    iput-object v0, p0, Lcom/immomo/moment/mediautils/h;->j:Ljava/lang/String;

    .line 192
    iput-object v0, p0, Lcom/immomo/moment/mediautils/h;->k:[Ljava/nio/ByteBuffer;

    .line 193
    iput-object v0, p0, Lcom/immomo/moment/mediautils/h;->l:[Ljava/nio/ByteBuffer;

    .line 194
    iput-object v0, p0, Lcom/immomo/moment/mediautils/h;->m:Ljava/lang/Thread;

    .line 195
    iput-object v0, p0, Lcom/immomo/moment/mediautils/h;->n:Ljava/lang/Thread;

    .line 196
    new-instance v1, Ljava/lang/Object;

    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    iput-object v1, p0, Lcom/immomo/moment/mediautils/h;->o:Ljava/lang/Object;

    const/4 v1, -0x1

    .line 197
    iput v1, p0, Lcom/immomo/moment/mediautils/h;->p:I

    const/4 v1, 0x0

    .line 198
    iput-boolean v1, p0, Lcom/immomo/moment/mediautils/h;->q:Z

    .line 199
    iput-boolean v1, p0, Lcom/immomo/moment/mediautils/h;->r:Z

    .line 200
    new-instance v2, Ljava/util/concurrent/LinkedBlockingQueue;

    invoke-direct {v2}, Ljava/util/concurrent/LinkedBlockingQueue;-><init>()V

    iput-object v2, p0, Lcom/immomo/moment/mediautils/h;->u:Ljava/util/concurrent/LinkedBlockingQueue;

    .line 201
    new-instance v2, Ljava/util/LinkedList;

    invoke-direct {v2}, Ljava/util/LinkedList;-><init>()V

    iput-object v2, p0, Lcom/immomo/moment/mediautils/h;->v:Ljava/util/LinkedList;

    .line 202
    new-instance v2, Ljava/lang/Object;

    invoke-direct {v2}, Ljava/lang/Object;-><init>()V

    iput-object v2, p0, Lcom/immomo/moment/mediautils/h;->w:Ljava/lang/Object;

    .line 203
    iput-boolean v1, p0, Lcom/immomo/moment/mediautils/h;->x:Z

    .line 204
    iput-boolean v1, p0, Lcom/immomo/moment/mediautils/h;->y:Z

    .line 205
    iput-boolean v1, p0, Lcom/immomo/moment/mediautils/h;->z:Z

    .line 206
    iput-boolean v1, p0, Lcom/immomo/moment/mediautils/h;->A:Z

    const/4 v2, 0x1

    .line 207
    iput-boolean v2, p0, Lcom/immomo/moment/mediautils/h;->B:Z

    .line 208
    new-instance v2, Ljava/lang/Object;

    invoke-direct {v2}, Ljava/lang/Object;-><init>()V

    iput-object v2, p0, Lcom/immomo/moment/mediautils/h;->C:Ljava/lang/Object;

    .line 209
    new-instance v2, Ljava/lang/Object;

    invoke-direct {v2}, Ljava/lang/Object;-><init>()V

    iput-object v2, p0, Lcom/immomo/moment/mediautils/h;->D:Ljava/lang/Object;

    .line 210
    iput-object v0, p0, Lcom/immomo/moment/mediautils/h;->E:Ljava/lang/String;

    .line 211
    iput-boolean v1, p0, Lcom/immomo/moment/mediautils/h;->F:Z

    .line 212
    iput-boolean v1, p0, Lcom/immomo/moment/mediautils/h;->G:Z

    .line 213
    iput-boolean v1, p0, Lcom/immomo/moment/mediautils/h;->H:Z

    const/high16 v0, 0x100000

    .line 214
    invoke-static {v0}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v0

    iput-object v0, p0, Lcom/immomo/moment/mediautils/h;->I:Ljava/nio/ByteBuffer;

    .line 215
    new-instance v0, Landroid/media/MediaCodec$BufferInfo;

    invoke-direct {v0}, Landroid/media/MediaCodec$BufferInfo;-><init>()V

    iput-object v0, p0, Lcom/immomo/moment/mediautils/h;->J:Landroid/media/MediaCodec$BufferInfo;

    .line 216
    iput v1, p0, Lcom/immomo/moment/mediautils/h;->L:I

    .line 217
    iput v1, p0, Lcom/immomo/moment/mediautils/h;->M:I

    .line 218
    iput-boolean v1, p0, Lcom/immomo/moment/mediautils/h;->N:Z

    return-void
.end method

.method public constructor <init>(ILjava/lang/String;)V
    .locals 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/16 v0, 0x191

    .line 5
    .line 6
    iput v0, p0, Lcom/immomo/moment/mediautils/h;->a:I

    .line 7
    .line 8
    const/16 v0, 0x192

    .line 9
    .line 10
    iput v0, p0, Lcom/immomo/moment/mediautils/h;->b:I

    .line 11
    .line 12
    const-string v0, "MedaiCodecWrapper"

    .line 13
    .line 14
    iput-object v0, p0, Lcom/immomo/moment/mediautils/h;->c:Ljava/lang/String;

    .line 15
    .line 16
    const-string v0, "video"

    .line 17
    .line 18
    iput-object v0, p0, Lcom/immomo/moment/mediautils/h;->d:Ljava/lang/String;

    .line 19
    .line 20
    const-string v0, "audio"

    .line 21
    .line 22
    iput-object v0, p0, Lcom/immomo/moment/mediautils/h;->e:Ljava/lang/String;

    .line 23
    .line 24
    const-wide/16 v0, 0x2710

    .line 25
    .line 26
    iput-wide v0, p0, Lcom/immomo/moment/mediautils/h;->f:J

    .line 27
    .line 28
    const-wide/16 v0, 0xc8

    .line 29
    .line 30
    iput-wide v0, p0, Lcom/immomo/moment/mediautils/h;->g:J

    .line 31
    .line 32
    const/4 v0, 0x0

    .line 33
    iput-object v0, p0, Lcom/immomo/moment/mediautils/h;->h:Landroid/media/MediaCodec;

    .line 34
    .line 35
    iput-object v0, p0, Lcom/immomo/moment/mediautils/h;->i:Landroid/view/Surface;

    .line 36
    .line 37
    iput-object v0, p0, Lcom/immomo/moment/mediautils/h;->j:Ljava/lang/String;

    .line 38
    .line 39
    iput-object v0, p0, Lcom/immomo/moment/mediautils/h;->k:[Ljava/nio/ByteBuffer;

    .line 40
    .line 41
    iput-object v0, p0, Lcom/immomo/moment/mediautils/h;->l:[Ljava/nio/ByteBuffer;

    .line 42
    .line 43
    iput-object v0, p0, Lcom/immomo/moment/mediautils/h;->m:Ljava/lang/Thread;

    .line 44
    .line 45
    iput-object v0, p0, Lcom/immomo/moment/mediautils/h;->n:Ljava/lang/Thread;

    .line 46
    .line 47
    new-instance v1, Ljava/lang/Object;

    .line 48
    .line 49
    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    .line 50
    .line 51
    .line 52
    iput-object v1, p0, Lcom/immomo/moment/mediautils/h;->o:Ljava/lang/Object;

    .line 53
    .line 54
    const/4 v1, -0x1

    .line 55
    iput v1, p0, Lcom/immomo/moment/mediautils/h;->p:I

    .line 56
    .line 57
    const/4 v1, 0x0

    .line 58
    iput-boolean v1, p0, Lcom/immomo/moment/mediautils/h;->q:Z

    .line 59
    .line 60
    iput-boolean v1, p0, Lcom/immomo/moment/mediautils/h;->r:Z

    .line 61
    .line 62
    new-instance v2, Ljava/util/concurrent/LinkedBlockingQueue;

    .line 63
    .line 64
    invoke-direct {v2}, Ljava/util/concurrent/LinkedBlockingQueue;-><init>()V

    .line 65
    .line 66
    .line 67
    iput-object v2, p0, Lcom/immomo/moment/mediautils/h;->u:Ljava/util/concurrent/LinkedBlockingQueue;

    .line 68
    .line 69
    new-instance v2, Ljava/util/LinkedList;

    .line 70
    .line 71
    invoke-direct {v2}, Ljava/util/LinkedList;-><init>()V

    .line 72
    .line 73
    .line 74
    iput-object v2, p0, Lcom/immomo/moment/mediautils/h;->v:Ljava/util/LinkedList;

    .line 75
    .line 76
    new-instance v2, Ljava/lang/Object;

    .line 77
    .line 78
    invoke-direct {v2}, Ljava/lang/Object;-><init>()V

    .line 79
    .line 80
    .line 81
    iput-object v2, p0, Lcom/immomo/moment/mediautils/h;->w:Ljava/lang/Object;

    .line 82
    .line 83
    iput-boolean v1, p0, Lcom/immomo/moment/mediautils/h;->x:Z

    .line 84
    .line 85
    iput-boolean v1, p0, Lcom/immomo/moment/mediautils/h;->y:Z

    .line 86
    .line 87
    iput-boolean v1, p0, Lcom/immomo/moment/mediautils/h;->z:Z

    .line 88
    .line 89
    iput-boolean v1, p0, Lcom/immomo/moment/mediautils/h;->A:Z

    .line 90
    .line 91
    const/4 v2, 0x1

    .line 92
    iput-boolean v2, p0, Lcom/immomo/moment/mediautils/h;->B:Z

    .line 93
    .line 94
    new-instance v2, Ljava/lang/Object;

    .line 95
    .line 96
    invoke-direct {v2}, Ljava/lang/Object;-><init>()V

    .line 97
    .line 98
    .line 99
    iput-object v2, p0, Lcom/immomo/moment/mediautils/h;->C:Ljava/lang/Object;

    .line 100
    .line 101
    new-instance v2, Ljava/lang/Object;

    .line 102
    .line 103
    invoke-direct {v2}, Ljava/lang/Object;-><init>()V

    .line 104
    .line 105
    .line 106
    iput-object v2, p0, Lcom/immomo/moment/mediautils/h;->D:Ljava/lang/Object;

    .line 107
    .line 108
    iput-object v0, p0, Lcom/immomo/moment/mediautils/h;->E:Ljava/lang/String;

    .line 109
    .line 110
    iput-boolean v1, p0, Lcom/immomo/moment/mediautils/h;->F:Z

    .line 111
    .line 112
    iput-boolean v1, p0, Lcom/immomo/moment/mediautils/h;->G:Z

    .line 113
    .line 114
    iput-boolean v1, p0, Lcom/immomo/moment/mediautils/h;->H:Z

    .line 115
    .line 116
    const/high16 v0, 0x100000

    .line 117
    .line 118
    invoke-static {v0}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    .line 119
    .line 120
    .line 121
    move-result-object v0

    .line 122
    iput-object v0, p0, Lcom/immomo/moment/mediautils/h;->I:Ljava/nio/ByteBuffer;

    .line 123
    .line 124
    new-instance v0, Landroid/media/MediaCodec$BufferInfo;

    .line 125
    .line 126
    invoke-direct {v0}, Landroid/media/MediaCodec$BufferInfo;-><init>()V

    .line 127
    .line 128
    .line 129
    iput-object v0, p0, Lcom/immomo/moment/mediautils/h;->J:Landroid/media/MediaCodec$BufferInfo;

    .line 130
    .line 131
    iput v1, p0, Lcom/immomo/moment/mediautils/h;->L:I

    .line 132
    .line 133
    iput v1, p0, Lcom/immomo/moment/mediautils/h;->M:I

    .line 134
    .line 135
    iput-boolean v1, p0, Lcom/immomo/moment/mediautils/h;->N:Z

    .line 136
    .line 137
    iput p1, p0, Lcom/immomo/moment/mediautils/h;->p:I

    .line 138
    .line 139
    iput-object p2, p0, Lcom/immomo/moment/mediautils/h;->E:Ljava/lang/String;

    .line 140
    .line 141
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 3

    .line 142
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/16 v0, 0x191

    .line 143
    iput v0, p0, Lcom/immomo/moment/mediautils/h;->a:I

    const/16 v0, 0x192

    .line 144
    iput v0, p0, Lcom/immomo/moment/mediautils/h;->b:I

    .line 145
    const-string v0, "MedaiCodecWrapper"

    iput-object v0, p0, Lcom/immomo/moment/mediautils/h;->c:Ljava/lang/String;

    .line 146
    const-string v0, "video"

    iput-object v0, p0, Lcom/immomo/moment/mediautils/h;->d:Ljava/lang/String;

    .line 147
    const-string v0, "audio"

    iput-object v0, p0, Lcom/immomo/moment/mediautils/h;->e:Ljava/lang/String;

    const-wide/16 v0, 0x2710

    .line 148
    iput-wide v0, p0, Lcom/immomo/moment/mediautils/h;->f:J

    const-wide/16 v0, 0xc8

    .line 149
    iput-wide v0, p0, Lcom/immomo/moment/mediautils/h;->g:J

    const/4 v0, 0x0

    .line 150
    iput-object v0, p0, Lcom/immomo/moment/mediautils/h;->h:Landroid/media/MediaCodec;

    .line 151
    iput-object v0, p0, Lcom/immomo/moment/mediautils/h;->i:Landroid/view/Surface;

    .line 152
    iput-object v0, p0, Lcom/immomo/moment/mediautils/h;->j:Ljava/lang/String;

    .line 153
    iput-object v0, p0, Lcom/immomo/moment/mediautils/h;->k:[Ljava/nio/ByteBuffer;

    .line 154
    iput-object v0, p0, Lcom/immomo/moment/mediautils/h;->l:[Ljava/nio/ByteBuffer;

    .line 155
    iput-object v0, p0, Lcom/immomo/moment/mediautils/h;->m:Ljava/lang/Thread;

    .line 156
    iput-object v0, p0, Lcom/immomo/moment/mediautils/h;->n:Ljava/lang/Thread;

    .line 157
    new-instance v1, Ljava/lang/Object;

    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    iput-object v1, p0, Lcom/immomo/moment/mediautils/h;->o:Ljava/lang/Object;

    const/4 v1, -0x1

    .line 158
    iput v1, p0, Lcom/immomo/moment/mediautils/h;->p:I

    const/4 v1, 0x0

    .line 159
    iput-boolean v1, p0, Lcom/immomo/moment/mediautils/h;->q:Z

    .line 160
    iput-boolean v1, p0, Lcom/immomo/moment/mediautils/h;->r:Z

    .line 161
    new-instance v2, Ljava/util/concurrent/LinkedBlockingQueue;

    invoke-direct {v2}, Ljava/util/concurrent/LinkedBlockingQueue;-><init>()V

    iput-object v2, p0, Lcom/immomo/moment/mediautils/h;->u:Ljava/util/concurrent/LinkedBlockingQueue;

    .line 162
    new-instance v2, Ljava/util/LinkedList;

    invoke-direct {v2}, Ljava/util/LinkedList;-><init>()V

    iput-object v2, p0, Lcom/immomo/moment/mediautils/h;->v:Ljava/util/LinkedList;

    .line 163
    new-instance v2, Ljava/lang/Object;

    invoke-direct {v2}, Ljava/lang/Object;-><init>()V

    iput-object v2, p0, Lcom/immomo/moment/mediautils/h;->w:Ljava/lang/Object;

    .line 164
    iput-boolean v1, p0, Lcom/immomo/moment/mediautils/h;->x:Z

    .line 165
    iput-boolean v1, p0, Lcom/immomo/moment/mediautils/h;->y:Z

    .line 166
    iput-boolean v1, p0, Lcom/immomo/moment/mediautils/h;->z:Z

    .line 167
    iput-boolean v1, p0, Lcom/immomo/moment/mediautils/h;->A:Z

    const/4 v2, 0x1

    .line 168
    iput-boolean v2, p0, Lcom/immomo/moment/mediautils/h;->B:Z

    .line 169
    new-instance v2, Ljava/lang/Object;

    invoke-direct {v2}, Ljava/lang/Object;-><init>()V

    iput-object v2, p0, Lcom/immomo/moment/mediautils/h;->C:Ljava/lang/Object;

    .line 170
    new-instance v2, Ljava/lang/Object;

    invoke-direct {v2}, Ljava/lang/Object;-><init>()V

    iput-object v2, p0, Lcom/immomo/moment/mediautils/h;->D:Ljava/lang/Object;

    .line 171
    iput-object v0, p0, Lcom/immomo/moment/mediautils/h;->E:Ljava/lang/String;

    .line 172
    iput-boolean v1, p0, Lcom/immomo/moment/mediautils/h;->F:Z

    .line 173
    iput-boolean v1, p0, Lcom/immomo/moment/mediautils/h;->G:Z

    .line 174
    iput-boolean v1, p0, Lcom/immomo/moment/mediautils/h;->H:Z

    const/high16 v0, 0x100000

    .line 175
    invoke-static {v0}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v0

    iput-object v0, p0, Lcom/immomo/moment/mediautils/h;->I:Ljava/nio/ByteBuffer;

    .line 176
    new-instance v0, Landroid/media/MediaCodec$BufferInfo;

    invoke-direct {v0}, Landroid/media/MediaCodec$BufferInfo;-><init>()V

    iput-object v0, p0, Lcom/immomo/moment/mediautils/h;->J:Landroid/media/MediaCodec$BufferInfo;

    .line 177
    iput v1, p0, Lcom/immomo/moment/mediautils/h;->L:I

    .line 178
    iput v1, p0, Lcom/immomo/moment/mediautils/h;->M:I

    .line 179
    iput-boolean v1, p0, Lcom/immomo/moment/mediautils/h;->N:Z

    .line 180
    iput-object p1, p0, Lcom/immomo/moment/mediautils/h;->E:Ljava/lang/String;

    return-void
.end method

.method public static synthetic a(Lcom/immomo/moment/mediautils/h;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/immomo/moment/mediautils/h;->p:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic b(Lcom/immomo/moment/mediautils/h;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/immomo/moment/mediautils/h;->r:Z

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic c(Lcom/immomo/moment/mediautils/h;Z)Z
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/immomo/moment/mediautils/h;->r:Z

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic d(Lcom/immomo/moment/mediautils/h;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/moment/mediautils/h;->D:Ljava/lang/Object;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic e(Lcom/immomo/moment/mediautils/h;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/immomo/moment/mediautils/h;->y:Z

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic f(Lcom/immomo/moment/mediautils/h;Z)Z
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/immomo/moment/mediautils/h;->A:Z

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic g(Lcom/immomo/moment/mediautils/h;)Z
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/immomo/moment/mediautils/h;->v()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public static synthetic h(Lcom/immomo/moment/mediautils/h;)[Ljava/nio/ByteBuffer;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/moment/mediautils/h;->l:[Ljava/nio/ByteBuffer;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic i(Lcom/immomo/moment/mediautils/h;[Ljava/nio/ByteBuffer;)[Ljava/nio/ByteBuffer;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/moment/mediautils/h;->l:[Ljava/nio/ByteBuffer;

    .line 2
    .line 3
    return-object p1
.end method

.method public static synthetic j(Lcom/immomo/moment/mediautils/h;)Landroid/view/Surface;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/moment/mediautils/h;->i:Landroid/view/Surface;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic k(Lcom/immomo/moment/mediautils/h;)Lcom/immomo/moment/mediautils/h$a;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/moment/mediautils/h;->t:Lcom/immomo/moment/mediautils/h$a;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic l(Lcom/immomo/moment/mediautils/h;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/moment/mediautils/h;->w:Ljava/lang/Object;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic m(Lcom/immomo/moment/mediautils/h;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/moment/mediautils/h;->j:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic n(Lcom/immomo/moment/mediautils/h;)Ljava/util/LinkedList;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/moment/mediautils/h;->v:Ljava/util/LinkedList;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic o(Lcom/immomo/moment/mediautils/h;)Lcom/immomo/moment/mediautils/h$d;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/moment/mediautils/h;->K:Lcom/immomo/moment/mediautils/h$d;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic p(Lcom/immomo/moment/mediautils/h;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/immomo/moment/mediautils/h;->G:Z

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic q(Lcom/immomo/moment/mediautils/h;)Lcom/immomo/moment/mediautils/h$b;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/moment/mediautils/h;->s:Lcom/immomo/moment/mediautils/h$b;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic r(Lcom/immomo/moment/mediautils/h;)Landroid/media/MediaCodec;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/moment/mediautils/h;->h:Landroid/media/MediaCodec;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic s(Lcom/immomo/moment/mediautils/h;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/immomo/moment/mediautils/h;->F:Z

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic t(Lcom/immomo/moment/mediautils/h;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/immomo/moment/mediautils/h;->L:I

    .line 2
    .line 3
    return p0
.end method

.method private v()Z
    .locals 12

    .line 1
    iget-boolean v0, p0, Lcom/immomo/moment/mediautils/h;->B:Z

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    return v1

    .line 7
    :cond_0
    const/4 v2, 0x0

    .line 8
    :try_start_0
    iget-object v0, p0, Lcom/immomo/moment/mediautils/h;->k:[Ljava/nio/ByteBuffer;

    .line 9
    .line 10
    if-nez v0, :cond_2

    .line 11
    .line 12
    iget-object v0, p0, Lcom/immomo/moment/mediautils/h;->h:Landroid/media/MediaCodec;

    .line 13
    .line 14
    invoke-virtual {v0}, Landroid/media/MediaCodec;->getInputBuffers()[Ljava/nio/ByteBuffer;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    iput-object v0, p0, Lcom/immomo/moment/mediautils/h;->k:[Ljava/nio/ByteBuffer;

    .line 19
    .line 20
    array-length v0, v0

    .line 21
    if-nez v0, :cond_1

    .line 22
    .line 23
    return v2

    .line 24
    :cond_1
    iget-object v0, p0, Lcom/immomo/moment/mediautils/h;->I:Ljava/nio/ByteBuffer;

    .line 25
    .line 26
    invoke-virtual {v0}, Ljava/nio/Buffer;->capacity()I

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    iget-object v3, p0, Lcom/immomo/moment/mediautils/h;->k:[Ljava/nio/ByteBuffer;

    .line 31
    .line 32
    aget-object v3, v3, v2

    .line 33
    .line 34
    invoke-virtual {v3}, Ljava/nio/Buffer;->capacity()I

    .line 35
    .line 36
    .line 37
    move-result v3

    .line 38
    if-le v0, v3, :cond_2

    .line 39
    .line 40
    iget-object v0, p0, Lcom/immomo/moment/mediautils/h;->k:[Ljava/nio/ByteBuffer;

    .line 41
    .line 42
    aget-object v0, v0, v2

    .line 43
    .line 44
    invoke-virtual {v0}, Ljava/nio/Buffer;->capacity()I

    .line 45
    .line 46
    .line 47
    move-result v0

    .line 48
    invoke-static {v0}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    iput-object v0, p0, Lcom/immomo/moment/mediautils/h;->I:Ljava/nio/ByteBuffer;

    .line 53
    .line 54
    goto :goto_0

    .line 55
    :catch_0
    move-exception v0

    .line 56
    goto/16 :goto_3

    .line 57
    .line 58
    :cond_2
    :goto_0
    iget-boolean v0, p0, Lcom/immomo/moment/mediautils/h;->N:Z

    .line 59
    .line 60
    if-nez v0, :cond_5

    .line 61
    .line 62
    iget-object v0, p0, Lcom/immomo/moment/mediautils/h;->s:Lcom/immomo/moment/mediautils/h$b;

    .line 63
    .line 64
    if-eqz v0, :cond_4

    .line 65
    .line 66
    iget-object v0, p0, Lcom/immomo/moment/mediautils/h;->J:Landroid/media/MediaCodec$BufferInfo;

    .line 67
    .line 68
    iget v0, v0, Landroid/media/MediaCodec$BufferInfo;->size:I

    .line 69
    .line 70
    if-nez v0, :cond_5

    .line 71
    .line 72
    iget-object v0, p0, Lcom/immomo/moment/mediautils/h;->I:Ljava/nio/ByteBuffer;

    .line 73
    .line 74
    invoke-virtual {v0, v2}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 75
    .line 76
    .line 77
    iget-object v0, p0, Lcom/immomo/moment/mediautils/h;->s:Lcom/immomo/moment/mediautils/h$b;

    .line 78
    .line 79
    iget-object v3, p0, Lcom/immomo/moment/mediautils/h;->I:Ljava/nio/ByteBuffer;

    .line 80
    .line 81
    iget-object v4, p0, Lcom/immomo/moment/mediautils/h;->J:Landroid/media/MediaCodec$BufferInfo;

    .line 82
    .line 83
    invoke-interface {v0, v3, v4}, Lcom/immomo/moment/mediautils/h$b;->onFeedingData(Ljava/nio/ByteBuffer;Landroid/media/MediaCodec$BufferInfo;)Z

    .line 84
    .line 85
    .line 86
    move-result v0

    .line 87
    if-nez v0, :cond_3

    .line 88
    .line 89
    return v2

    .line 90
    :cond_3
    iget-object v0, p0, Lcom/immomo/moment/mediautils/h;->J:Landroid/media/MediaCodec$BufferInfo;

    .line 91
    .line 92
    iget v0, v0, Landroid/media/MediaCodec$BufferInfo;->size:I

    .line 93
    .line 94
    if-nez v0, :cond_5

    .line 95
    .line 96
    iput-boolean v1, p0, Lcom/immomo/moment/mediautils/h;->N:Z

    .line 97
    .line 98
    goto :goto_1

    .line 99
    :cond_4
    return v2

    .line 100
    :cond_5
    :goto_1
    iget-object v0, p0, Lcom/immomo/moment/mediautils/h;->h:Landroid/media/MediaCodec;

    .line 101
    .line 102
    const-wide/16 v3, 0x2710

    .line 103
    .line 104
    invoke-virtual {v0, v3, v4}, Landroid/media/MediaCodec;->dequeueInputBuffer(J)I

    .line 105
    .line 106
    .line 107
    move-result v6

    .line 108
    if-ltz v6, :cond_8

    .line 109
    .line 110
    iget-object v0, p0, Lcom/immomo/moment/mediautils/h;->J:Landroid/media/MediaCodec$BufferInfo;

    .line 111
    .line 112
    iget v0, v0, Landroid/media/MediaCodec$BufferInfo;->size:I

    .line 113
    .line 114
    if-lez v0, :cond_6

    .line 115
    .line 116
    iget-object v0, p0, Lcom/immomo/moment/mediautils/h;->k:[Ljava/nio/ByteBuffer;

    .line 117
    .line 118
    aget-object v0, v0, v6

    .line 119
    .line 120
    invoke-virtual {v0, v2}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 121
    .line 122
    .line 123
    iget-object v0, p0, Lcom/immomo/moment/mediautils/h;->k:[Ljava/nio/ByteBuffer;

    .line 124
    .line 125
    aget-object v0, v0, v6

    .line 126
    .line 127
    iget-object v3, p0, Lcom/immomo/moment/mediautils/h;->I:Ljava/nio/ByteBuffer;

    .line 128
    .line 129
    invoke-virtual {v3}, Ljava/nio/ByteBuffer;->array()[B

    .line 130
    .line 131
    .line 132
    move-result-object v3

    .line 133
    iget-object v4, p0, Lcom/immomo/moment/mediautils/h;->J:Landroid/media/MediaCodec$BufferInfo;

    .line 134
    .line 135
    iget v4, v4, Landroid/media/MediaCodec$BufferInfo;->size:I

    .line 136
    .line 137
    invoke-virtual {v0, v3, v2, v4}, Ljava/nio/ByteBuffer;->put([BII)Ljava/nio/ByteBuffer;

    .line 138
    .line 139
    .line 140
    iget-object v5, p0, Lcom/immomo/moment/mediautils/h;->h:Landroid/media/MediaCodec;

    .line 141
    .line 142
    iget-object v0, p0, Lcom/immomo/moment/mediautils/h;->J:Landroid/media/MediaCodec$BufferInfo;

    .line 143
    .line 144
    iget v8, v0, Landroid/media/MediaCodec$BufferInfo;->size:I

    .line 145
    .line 146
    iget-wide v9, v0, Landroid/media/MediaCodec$BufferInfo;->presentationTimeUs:J

    .line 147
    .line 148
    const/4 v11, 0x0

    .line 149
    const/4 v7, 0x0

    .line 150
    invoke-virtual/range {v5 .. v11}, Landroid/media/MediaCodec;->queueInputBuffer(IIIJI)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 151
    .line 152
    .line 153
    goto :goto_2

    .line 154
    :cond_6
    iget-object v5, p0, Lcom/immomo/moment/mediautils/h;->h:Landroid/media/MediaCodec;

    .line 155
    .line 156
    const/4 v3, 0x4

    .line 157
    if-nez v0, :cond_7

    .line 158
    .line 159
    const-wide/16 v9, 0x0

    .line 160
    .line 161
    const/4 v11, 0x4

    .line 162
    const/4 v7, 0x0

    .line 163
    const/4 v8, 0x0

    .line 164
    :try_start_1
    invoke-virtual/range {v5 .. v11}, Landroid/media/MediaCodec;->queueInputBuffer(IIIJI)V

    .line 165
    .line 166
    .line 167
    iput-boolean v2, p0, Lcom/immomo/moment/mediautils/h;->N:Z

    .line 168
    .line 169
    iput v3, p0, Lcom/immomo/moment/mediautils/h;->L:I

    .line 170
    .line 171
    goto :goto_2

    .line 172
    :cond_7
    const-wide/16 v9, 0x0

    .line 173
    .line 174
    const/4 v11, 0x4

    .line 175
    const/4 v7, 0x0

    .line 176
    const/4 v8, 0x0

    .line 177
    invoke-virtual/range {v5 .. v11}, Landroid/media/MediaCodec;->queueInputBuffer(IIIJI)V

    .line 178
    .line 179
    .line 180
    iput-boolean v1, p0, Lcom/immomo/moment/mediautils/h;->F:Z

    .line 181
    .line 182
    iput v3, p0, Lcom/immomo/moment/mediautils/h;->L:I

    .line 183
    .line 184
    :goto_2
    iget-object v0, p0, Lcom/immomo/moment/mediautils/h;->J:Landroid/media/MediaCodec$BufferInfo;

    .line 185
    .line 186
    iput v2, v0, Landroid/media/MediaCodec$BufferInfo;->size:I
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 187
    .line 188
    return v1

    .line 189
    :cond_8
    return v2

    .line 190
    :goto_3
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 191
    .line 192
    .line 193
    iget-object v3, p0, Lcom/immomo/moment/mediautils/h;->s:Lcom/immomo/moment/mediautils/h$b;

    .line 194
    .line 195
    if-eqz v3, :cond_a

    .line 196
    .line 197
    iget v4, p0, Lcom/immomo/moment/mediautils/h;->p:I

    .line 198
    .line 199
    const-string v5, " codecStatus"

    .line 200
    .line 201
    if-ne v4, v1, :cond_9

    .line 202
    .line 203
    new-instance v1, Ljava/lang/StringBuilder;

    .line 204
    .line 205
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 206
    .line 207
    .line 208
    invoke-static {v0}, Ll/g8g0;->a(Ljava/lang/Exception;)Ljava/lang/String;

    .line 209
    .line 210
    .line 211
    move-result-object v0

    .line 212
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 213
    .line 214
    .line 215
    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 216
    .line 217
    .line 218
    iget p0, p0, Lcom/immomo/moment/mediautils/h;->L:I

    .line 219
    .line 220
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 221
    .line 222
    .line 223
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 224
    .line 225
    .line 226
    move-result-object p0

    .line 227
    const/16 v0, -0x191

    .line 228
    .line 229
    invoke-interface {v3, v0, v2, p0}, Lcom/immomo/moment/mediautils/h$b;->onError(IILjava/lang/String;)V

    .line 230
    .line 231
    .line 232
    goto :goto_4

    .line 233
    :cond_9
    new-instance v1, Ljava/lang/StringBuilder;

    .line 234
    .line 235
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 236
    .line 237
    .line 238
    invoke-static {v0}, Ll/g8g0;->a(Ljava/lang/Exception;)Ljava/lang/String;

    .line 239
    .line 240
    .line 241
    move-result-object v0

    .line 242
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 243
    .line 244
    .line 245
    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 246
    .line 247
    .line 248
    iget p0, p0, Lcom/immomo/moment/mediautils/h;->L:I

    .line 249
    .line 250
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 251
    .line 252
    .line 253
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 254
    .line 255
    .line 256
    move-result-object p0

    .line 257
    const/16 v0, -0x192

    .line 258
    .line 259
    invoke-interface {v3, v0, v2, p0}, Lcom/immomo/moment/mediautils/h$b;->onError(IILjava/lang/String;)V

    .line 260
    .line 261
    .line 262
    :cond_a
    :goto_4
    return v2
.end method

.method public static y(Ljava/lang/String;)I
    .locals 8
    .annotation build Landroidx/annotation/RequiresApi;
        api = 0x1c
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    if-eqz p0, :cond_3

    .line 3
    .line 4
    :try_start_0
    invoke-static {}, Landroid/media/MediaCodecList;->getCodecCount()I

    .line 5
    .line 6
    .line 7
    move-result v1

    .line 8
    move v2, v0

    .line 9
    :goto_0
    if-ge v2, v1, :cond_3

    .line 10
    .line 11
    invoke-static {v2}, Landroid/media/MediaCodecList;->getCodecInfoAt(I)Landroid/media/MediaCodecInfo;

    .line 12
    .line 13
    .line 14
    move-result-object v3

    .line 15
    if-eqz v3, :cond_2

    .line 16
    .line 17
    invoke-virtual {v3}, Landroid/media/MediaCodecInfo;->isEncoder()Z

    .line 18
    .line 19
    .line 20
    move-result v4

    .line 21
    if-eqz v4, :cond_2

    .line 22
    .line 23
    invoke-virtual {v3}, Landroid/media/MediaCodecInfo;->getSupportedTypes()[Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v4

    .line 27
    if-nez v4, :cond_0

    .line 28
    .line 29
    goto :goto_2

    .line 30
    :cond_0
    move v5, v0

    .line 31
    :goto_1
    array-length v6, v4

    .line 32
    if-ge v5, v6, :cond_2

    .line 33
    .line 34
    const-string v6, "codec"

    .line 35
    .line 36
    aget-object v7, v4, v5

    .line 37
    .line 38
    invoke-static {v6, v7}, Ll/lyv;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 39
    .line 40
    .line 41
    aget-object v6, v4, v5

    .line 42
    .line 43
    invoke-virtual {v6, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 44
    .line 45
    .line 46
    move-result v6

    .line 47
    if-eqz v6, :cond_1

    .line 48
    .line 49
    invoke-virtual {v3, p0}, Landroid/media/MediaCodecInfo;->getCapabilitiesForType(Ljava/lang/String;)Landroid/media/MediaCodecInfo$CodecCapabilities;

    .line 50
    .line 51
    .line 52
    move-result-object v6

    .line 53
    invoke-virtual {v6}, Landroid/media/MediaCodecInfo$CodecCapabilities;->getEncoderCapabilities()Landroid/media/MediaCodecInfo$EncoderCapabilities;

    .line 54
    .line 55
    .line 56
    move-result-object v6

    .line 57
    if-eqz v6, :cond_1

    .line 58
    .line 59
    invoke-static {v6}, Ll/yrx;->a(Landroid/media/MediaCodecInfo$EncoderCapabilities;)Landroid/util/Range;

    .line 60
    .line 61
    .line 62
    move-result-object p0

    .line 63
    invoke-virtual {p0}, Landroid/util/Range;->getUpper()Ljava/lang/Comparable;

    .line 64
    .line 65
    .line 66
    move-result-object p0

    .line 67
    check-cast p0, Ljava/lang/Integer;

    .line 68
    .line 69
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 70
    .line 71
    .line 72
    move-result p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 73
    return p0

    .line 74
    :cond_1
    add-int/lit8 v5, v5, 0x1

    .line 75
    .line 76
    goto :goto_1

    .line 77
    :cond_2
    :goto_2
    add-int/lit8 v2, v2, 0x1

    .line 78
    .line 79
    goto :goto_0

    .line 80
    :catch_0
    :cond_3
    return v0
.end method

.method public static z(Ljava/lang/String;I)Z
    .locals 8

    .line 1
    const/4 v0, 0x0

    .line 2
    if-eqz p0, :cond_3

    .line 3
    .line 4
    invoke-static {}, Landroid/media/MediaCodecList;->getCodecCount()I

    .line 5
    .line 6
    .line 7
    move-result v1

    .line 8
    move v2, v0

    .line 9
    :goto_0
    if-ge v2, v1, :cond_3

    .line 10
    .line 11
    invoke-static {v2}, Landroid/media/MediaCodecList;->getCodecInfoAt(I)Landroid/media/MediaCodecInfo;

    .line 12
    .line 13
    .line 14
    move-result-object v3

    .line 15
    if-eqz v3, :cond_2

    .line 16
    .line 17
    invoke-virtual {v3}, Landroid/media/MediaCodecInfo;->isEncoder()Z

    .line 18
    .line 19
    .line 20
    move-result v4

    .line 21
    if-eqz v4, :cond_2

    .line 22
    .line 23
    invoke-virtual {v3}, Landroid/media/MediaCodecInfo;->getSupportedTypes()[Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v4

    .line 27
    if-nez v4, :cond_0

    .line 28
    .line 29
    goto :goto_2

    .line 30
    :cond_0
    move v5, v0

    .line 31
    :goto_1
    array-length v6, v4

    .line 32
    if-ge v5, v6, :cond_2

    .line 33
    .line 34
    const-string v6, "codec"

    .line 35
    .line 36
    aget-object v7, v4, v5

    .line 37
    .line 38
    invoke-static {v6, v7}, Ll/lyv;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 39
    .line 40
    .line 41
    aget-object v6, v4, v5

    .line 42
    .line 43
    invoke-virtual {v6, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 44
    .line 45
    .line 46
    move-result v6

    .line 47
    if-eqz v6, :cond_1

    .line 48
    .line 49
    invoke-virtual {v3, p0}, Landroid/media/MediaCodecInfo;->getCapabilitiesForType(Ljava/lang/String;)Landroid/media/MediaCodecInfo$CodecCapabilities;

    .line 50
    .line 51
    .line 52
    move-result-object v6

    .line 53
    invoke-virtual {v6}, Landroid/media/MediaCodecInfo$CodecCapabilities;->getEncoderCapabilities()Landroid/media/MediaCodecInfo$EncoderCapabilities;

    .line 54
    .line 55
    .line 56
    move-result-object v6

    .line 57
    if-eqz v6, :cond_1

    .line 58
    .line 59
    invoke-virtual {v6, p1}, Landroid/media/MediaCodecInfo$EncoderCapabilities;->isBitrateModeSupported(I)Z

    .line 60
    .line 61
    .line 62
    move-result p0

    .line 63
    return p0

    .line 64
    :cond_1
    add-int/lit8 v5, v5, 0x1

    .line 65
    .line 66
    goto :goto_1

    .line 67
    :cond_2
    :goto_2
    add-int/lit8 v2, v2, 0x1

    .line 68
    .line 69
    goto :goto_0

    .line 70
    :cond_3
    return v0
.end method


# virtual methods
.method public A()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/immomo/moment/mediautils/h;->m:Ljava/lang/Thread;

    .line 2
    .line 3
    const-wide/16 v1, 0x5

    .line 4
    .line 5
    const/4 v3, 0x1

    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    iget-boolean v0, p0, Lcom/immomo/moment/mediautils/h;->z:Z

    .line 9
    .line 10
    if-nez v0, :cond_0

    .line 11
    .line 12
    iget-object v0, p0, Lcom/immomo/moment/mediautils/h;->C:Ljava/lang/Object;

    .line 13
    .line 14
    monitor-enter v0

    .line 15
    :try_start_0
    iput-boolean v3, p0, Lcom/immomo/moment/mediautils/h;->x:Z

    .line 16
    .line 17
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 18
    :goto_0
    iget-boolean v0, p0, Lcom/immomo/moment/mediautils/h;->z:Z

    .line 19
    .line 20
    if-nez v0, :cond_0

    .line 21
    .line 22
    iget-boolean v0, p0, Lcom/immomo/moment/mediautils/h;->q:Z

    .line 23
    .line 24
    if-nez v0, :cond_0

    .line 25
    .line 26
    :try_start_1
    invoke-static {v1, v2}, Ljava/lang/Thread;->sleep(J)V
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0

    .line 27
    .line 28
    .line 29
    goto :goto_0

    .line 30
    :catch_0
    move-exception v0

    .line 31
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 32
    .line 33
    .line 34
    goto :goto_0

    .line 35
    :catchall_0
    move-exception p0

    .line 36
    :try_start_2
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 37
    throw p0

    .line 38
    :cond_0
    iget-object v0, p0, Lcom/immomo/moment/mediautils/h;->n:Ljava/lang/Thread;

    .line 39
    .line 40
    if-eqz v0, :cond_1

    .line 41
    .line 42
    iget-boolean v0, p0, Lcom/immomo/moment/mediautils/h;->A:Z

    .line 43
    .line 44
    if-nez v0, :cond_1

    .line 45
    .line 46
    iget-object v0, p0, Lcom/immomo/moment/mediautils/h;->D:Ljava/lang/Object;

    .line 47
    .line 48
    monitor-enter v0

    .line 49
    :try_start_3
    iput-boolean v3, p0, Lcom/immomo/moment/mediautils/h;->y:Z

    .line 50
    .line 51
    monitor-exit v0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 52
    :goto_1
    iget-boolean v0, p0, Lcom/immomo/moment/mediautils/h;->A:Z

    .line 53
    .line 54
    if-nez v0, :cond_1

    .line 55
    .line 56
    iget-boolean v0, p0, Lcom/immomo/moment/mediautils/h;->r:Z

    .line 57
    .line 58
    if-nez v0, :cond_1

    .line 59
    .line 60
    :try_start_4
    invoke-static {v1, v2}, Ljava/lang/Thread;->sleep(J)V
    :try_end_4
    .catch Ljava/lang/InterruptedException; {:try_start_4 .. :try_end_4} :catch_1

    .line 61
    .line 62
    .line 63
    goto :goto_1

    .line 64
    :catch_1
    move-exception v0

    .line 65
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 66
    .line 67
    .line 68
    goto :goto_1

    .line 69
    :catchall_1
    move-exception p0

    .line 70
    :try_start_5
    monitor-exit v0
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    .line 71
    throw p0

    .line 72
    :cond_1
    return-void
.end method

.method public B()V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/immomo/moment/mediautils/h;->w:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object v1, p0, Lcom/immomo/moment/mediautils/h;->w:Ljava/lang/Object;

    .line 5
    .line 6
    monitor-enter v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 7
    :try_start_1
    const-string v2, "MedaiCodecWrapper"

    .line 8
    .line 9
    const-string v3, "release all framebuffer"

    .line 10
    .line 11
    invoke-static {v2, v3}, Lcom/cosmos/mdlog/MDLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    :goto_0
    iget-object v2, p0, Lcom/immomo/moment/mediautils/h;->v:Ljava/util/LinkedList;

    .line 15
    .line 16
    invoke-virtual {v2}, Ljava/util/LinkedList;->size()I

    .line 17
    .line 18
    .line 19
    move-result v2

    .line 20
    if-lez v2, :cond_0

    .line 21
    .line 22
    iget-object v2, p0, Lcom/immomo/moment/mediautils/h;->v:Ljava/util/LinkedList;

    .line 23
    .line 24
    invoke-virtual {v2}, Ljava/util/LinkedList;->pollFirst()Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object v2

    .line 28
    check-cast v2, Ljava/lang/Integer;

    .line 29
    .line 30
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    .line 31
    .line 32
    .line 33
    move-result v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 34
    :try_start_2
    iget-object v3, p0, Lcom/immomo/moment/mediautils/h;->h:Landroid/media/MediaCodec;

    .line 35
    .line 36
    const/4 v4, 0x0

    .line 37
    invoke-virtual {v3, v2, v4}, Landroid/media/MediaCodec;->releaseOutputBuffer(IZ)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 38
    .line 39
    .line 40
    goto :goto_0

    .line 41
    :catchall_0
    move-exception p0

    .line 42
    goto :goto_1

    .line 43
    :catch_0
    :try_start_3
    const-string v2, "releaseAllCachedFrames error"

    .line 44
    .line 45
    invoke-static {v2}, Ll/lyv;->b(Ljava/lang/String;)I

    .line 46
    .line 47
    .line 48
    iget-object v2, p0, Lcom/immomo/moment/mediautils/h;->v:Ljava/util/LinkedList;

    .line 49
    .line 50
    invoke-virtual {v2}, Ljava/util/LinkedList;->clear()V

    .line 51
    .line 52
    .line 53
    goto :goto_0

    .line 54
    :cond_0
    monitor-exit v1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 55
    :try_start_4
    monitor-exit v0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 56
    return-void

    .line 57
    :catchall_1
    move-exception p0

    .line 58
    goto :goto_2

    .line 59
    :goto_1
    :try_start_5
    monitor-exit v1
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 60
    :try_start_6
    throw p0

    .line 61
    :goto_2
    monitor-exit v0
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_1

    .line 62
    throw p0
.end method

.method public C()V
    .locals 7

    .line 1
    iget-object v0, p0, Lcom/immomo/moment/mediautils/h;->o:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    const/4 v1, 0x1

    .line 5
    :try_start_0
    iput-boolean v1, p0, Lcom/immomo/moment/mediautils/h;->G:Z

    .line 6
    .line 7
    iget-object v2, p0, Lcom/immomo/moment/mediautils/h;->m:Ljava/lang/Thread;

    .line 8
    .line 9
    const/4 v3, 0x0

    .line 10
    if-eqz v2, :cond_0

    .line 11
    .line 12
    iput-boolean v1, p0, Lcom/immomo/moment/mediautils/h;->q:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 13
    .line 14
    :try_start_1
    invoke-virtual {v2}, Ljava/lang/Thread;->join()V
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 15
    .line 16
    .line 17
    goto :goto_0

    .line 18
    :catchall_0
    move-exception p0

    .line 19
    goto/16 :goto_6

    .line 20
    .line 21
    :catch_0
    move-exception v2

    .line 22
    :try_start_2
    invoke-virtual {v2}, Ljava/lang/Throwable;->printStackTrace()V

    .line 23
    .line 24
    .line 25
    :goto_0
    iput-object v3, p0, Lcom/immomo/moment/mediautils/h;->m:Ljava/lang/Thread;

    .line 26
    .line 27
    :cond_0
    iget-object v2, p0, Lcom/immomo/moment/mediautils/h;->n:Ljava/lang/Thread;

    .line 28
    .line 29
    if-eqz v2, :cond_2

    .line 30
    .line 31
    iget-object v2, p0, Lcom/immomo/moment/mediautils/h;->h:Landroid/media/MediaCodec;

    .line 32
    .line 33
    if-eqz v2, :cond_1

    .line 34
    .line 35
    iget v2, p0, Lcom/immomo/moment/mediautils/h;->p:I

    .line 36
    .line 37
    if-nez v2, :cond_1

    .line 38
    .line 39
    iget-object v2, p0, Lcom/immomo/moment/mediautils/h;->j:Ljava/lang/String;

    .line 40
    .line 41
    const-string v4, "video"

    .line 42
    .line 43
    invoke-virtual {v2, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 44
    .line 45
    .line 46
    move-result v2

    .line 47
    if-eqz v2, :cond_1

    .line 48
    .line 49
    iget-object v2, p0, Lcom/immomo/moment/mediautils/h;->i:Landroid/view/Surface;

    .line 50
    .line 51
    if-eqz v2, :cond_1

    .line 52
    .line 53
    iget-object v2, p0, Lcom/immomo/moment/mediautils/h;->h:Landroid/media/MediaCodec;

    .line 54
    .line 55
    invoke-virtual {v2}, Landroid/media/MediaCodec;->signalEndOfInputStream()V

    .line 56
    .line 57
    .line 58
    goto :goto_1

    .line 59
    :cond_1
    iput-boolean v1, p0, Lcom/immomo/moment/mediautils/h;->r:Z
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 60
    .line 61
    :goto_1
    :try_start_3
    iget-object v2, p0, Lcom/immomo/moment/mediautils/h;->n:Ljava/lang/Thread;

    .line 62
    .line 63
    invoke-virtual {v2}, Ljava/lang/Thread;->join()V
    :try_end_3
    .catch Ljava/lang/InterruptedException; {:try_start_3 .. :try_end_3} :catch_1
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 64
    .line 65
    .line 66
    goto :goto_2

    .line 67
    :catch_1
    move-exception v2

    .line 68
    :try_start_4
    invoke-virtual {v2}, Ljava/lang/Throwable;->printStackTrace()V

    .line 69
    .line 70
    .line 71
    :goto_2
    iput-object v3, p0, Lcom/immomo/moment/mediautils/h;->n:Ljava/lang/Thread;
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 72
    .line 73
    :cond_2
    const/4 v2, 0x0

    .line 74
    :try_start_5
    iget-object v4, p0, Lcom/immomo/moment/mediautils/h;->h:Landroid/media/MediaCodec;

    .line 75
    .line 76
    if-eqz v4, :cond_5

    .line 77
    .line 78
    iget-boolean v5, p0, Lcom/immomo/moment/mediautils/h;->H:Z

    .line 79
    .line 80
    if-eqz v5, :cond_3

    .line 81
    .line 82
    invoke-virtual {v4}, Landroid/media/MediaCodec;->stop()V

    .line 83
    .line 84
    .line 85
    iput-boolean v2, p0, Lcom/immomo/moment/mediautils/h;->H:Z

    .line 86
    .line 87
    goto :goto_3

    .line 88
    :catch_2
    move-exception v4

    .line 89
    goto :goto_4

    .line 90
    :cond_3
    :goto_3
    iget-object v4, p0, Lcom/immomo/moment/mediautils/h;->h:Landroid/media/MediaCodec;

    .line 91
    .line 92
    invoke-virtual {v4}, Landroid/media/MediaCodec;->release()V

    .line 93
    .line 94
    .line 95
    iput-object v3, p0, Lcom/immomo/moment/mediautils/h;->h:Landroid/media/MediaCodec;

    .line 96
    .line 97
    iput v2, p0, Lcom/immomo/moment/mediautils/h;->L:I
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_2
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 98
    .line 99
    goto :goto_5

    .line 100
    :goto_4
    :try_start_6
    invoke-virtual {v4}, Ljava/lang/Throwable;->printStackTrace()V

    .line 101
    .line 102
    .line 103
    iget-object v5, p0, Lcom/immomo/moment/mediautils/h;->s:Lcom/immomo/moment/mediautils/h$b;

    .line 104
    .line 105
    if-eqz v5, :cond_5

    .line 106
    .line 107
    iget v6, p0, Lcom/immomo/moment/mediautils/h;->p:I

    .line 108
    .line 109
    if-ne v6, v1, :cond_4

    .line 110
    .line 111
    new-instance v1, Ljava/lang/StringBuilder;

    .line 112
    .line 113
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 114
    .line 115
    .line 116
    invoke-static {v4}, Ll/g8g0;->a(Ljava/lang/Exception;)Ljava/lang/String;

    .line 117
    .line 118
    .line 119
    move-result-object v4

    .line 120
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 121
    .line 122
    .line 123
    const-string v4, " codecStatus"

    .line 124
    .line 125
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 126
    .line 127
    .line 128
    iget v4, p0, Lcom/immomo/moment/mediautils/h;->L:I

    .line 129
    .line 130
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 131
    .line 132
    .line 133
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 134
    .line 135
    .line 136
    move-result-object v1

    .line 137
    const/16 v4, -0x191

    .line 138
    .line 139
    invoke-interface {v5, v4, v2, v1}, Lcom/immomo/moment/mediautils/h$b;->onError(IILjava/lang/String;)V

    .line 140
    .line 141
    .line 142
    goto :goto_5

    .line 143
    :cond_4
    new-instance v1, Ljava/lang/StringBuilder;

    .line 144
    .line 145
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 146
    .line 147
    .line 148
    invoke-static {v4}, Ll/g8g0;->a(Ljava/lang/Exception;)Ljava/lang/String;

    .line 149
    .line 150
    .line 151
    move-result-object v4

    .line 152
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 153
    .line 154
    .line 155
    const-string v4, " codecStatus"

    .line 156
    .line 157
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 158
    .line 159
    .line 160
    iget v4, p0, Lcom/immomo/moment/mediautils/h;->L:I

    .line 161
    .line 162
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 163
    .line 164
    .line 165
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 166
    .line 167
    .line 168
    move-result-object v1

    .line 169
    const/16 v4, -0x192

    .line 170
    .line 171
    invoke-interface {v5, v4, v2, v1}, Lcom/immomo/moment/mediautils/h$b;->onError(IILjava/lang/String;)V

    .line 172
    .line 173
    .line 174
    :cond_5
    :goto_5
    iget-object v1, p0, Lcom/immomo/moment/mediautils/h;->i:Landroid/view/Surface;

    .line 175
    .line 176
    if-eqz v1, :cond_6

    .line 177
    .line 178
    iput-object v3, p0, Lcom/immomo/moment/mediautils/h;->i:Landroid/view/Surface;

    .line 179
    .line 180
    :cond_6
    iput-object v3, p0, Lcom/immomo/moment/mediautils/h;->j:Ljava/lang/String;

    .line 181
    .line 182
    iput-object v3, p0, Lcom/immomo/moment/mediautils/h;->I:Ljava/nio/ByteBuffer;

    .line 183
    .line 184
    iput-object v3, p0, Lcom/immomo/moment/mediautils/h;->J:Landroid/media/MediaCodec$BufferInfo;

    .line 185
    .line 186
    monitor-exit v0

    .line 187
    return-void

    .line 188
    :goto_6
    monitor-exit v0
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    .line 189
    throw p0
.end method

.method public D(Z)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/immomo/moment/mediautils/h;->w:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-boolean v1, p0, Lcom/immomo/moment/mediautils/h;->y:Z

    .line 5
    .line 6
    if-eqz v1, :cond_0

    .line 7
    .line 8
    monitor-exit v0

    .line 9
    return-void

    .line 10
    :catchall_0
    move-exception p0

    .line 11
    goto :goto_1

    .line 12
    :cond_0
    iget-object v1, p0, Lcom/immomo/moment/mediautils/h;->v:Ljava/util/LinkedList;

    .line 13
    .line 14
    invoke-virtual {v1}, Ljava/util/LinkedList;->size()I

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    if-lez v1, :cond_1

    .line 19
    .line 20
    iget-object v1, p0, Lcom/immomo/moment/mediautils/h;->v:Ljava/util/LinkedList;

    .line 21
    .line 22
    invoke-virtual {v1}, Ljava/util/LinkedList;->pollFirst()Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    check-cast v1, Ljava/lang/Integer;

    .line 27
    .line 28
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 29
    .line 30
    .line 31
    move-result v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 32
    :try_start_1
    iget v2, p0, Lcom/immomo/moment/mediautils/h;->M:I

    .line 33
    .line 34
    add-int/lit8 v2, v2, 0x1

    .line 35
    .line 36
    iput v2, p0, Lcom/immomo/moment/mediautils/h;->M:I

    .line 37
    .line 38
    iget-object p0, p0, Lcom/immomo/moment/mediautils/h;->h:Landroid/media/MediaCodec;

    .line 39
    .line 40
    invoke-virtual {p0, v1, p1}, Landroid/media/MediaCodec;->releaseOutputBuffer(IZ)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 41
    .line 42
    .line 43
    goto :goto_0

    .line 44
    :catch_0
    :try_start_2
    const-string p0, "MedaiCodecWrapper"

    .line 45
    .line 46
    const-string p1, "onPrepareOneFrame error"

    .line 47
    .line 48
    invoke-static {p0, p1}, Lcom/cosmos/mdlog/MDLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 49
    .line 50
    .line 51
    :cond_1
    :goto_0
    monitor-exit v0

    .line 52
    return-void

    .line 53
    :goto_1
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 54
    throw p0
.end method

.method public E()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/immomo/moment/mediautils/h;->C:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    const/4 v1, 0x0

    .line 5
    :try_start_0
    iput-boolean v1, p0, Lcom/immomo/moment/mediautils/h;->y:Z

    .line 6
    .line 7
    iput-boolean v1, p0, Lcom/immomo/moment/mediautils/h;->x:Z

    .line 8
    .line 9
    iput-boolean v1, p0, Lcom/immomo/moment/mediautils/h;->A:Z

    .line 10
    .line 11
    iput-boolean v1, p0, Lcom/immomo/moment/mediautils/h;->z:Z

    .line 12
    .line 13
    monitor-exit v0

    .line 14
    return-void

    .line 15
    :catchall_0
    move-exception p0

    .line 16
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 17
    throw p0
.end method

.method public F(Landroid/view/Surface;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/immomo/moment/mediautils/h;->o:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget v1, p0, Lcom/immomo/moment/mediautils/h;->p:I

    .line 5
    .line 6
    const/4 v2, 0x1

    .line 7
    if-ne v1, v2, :cond_0

    .line 8
    .line 9
    iput-object p1, p0, Lcom/immomo/moment/mediautils/h;->i:Landroid/view/Surface;

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

.method public G(Lcom/immomo/moment/mediautils/h$a;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/immomo/moment/mediautils/h;->o:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iput-object p1, p0, Lcom/immomo/moment/mediautils/h;->t:Lcom/immomo/moment/mediautils/h$a;

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

.method public H(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/immomo/moment/mediautils/h;->I:Ljava/nio/ByteBuffer;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Ljava/nio/Buffer;->capacity()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-le p1, v0, :cond_1

    .line 10
    .line 11
    invoke-static {p1}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    iput-object p1, p0, Lcom/immomo/moment/mediautils/h;->I:Ljava/nio/ByteBuffer;

    .line 16
    .line 17
    return-void

    .line 18
    :cond_0
    if-lez p1, :cond_1

    .line 19
    .line 20
    invoke-static {p1}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    iput-object p1, p0, Lcom/immomo/moment/mediautils/h;->I:Ljava/nio/ByteBuffer;

    .line 25
    .line 26
    :cond_1
    return-void
.end method

.method public I(Lcom/immomo/moment/mediautils/h$b;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/immomo/moment/mediautils/h;->o:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iput-object p1, p0, Lcom/immomo/moment/mediautils/h;->s:Lcom/immomo/moment/mediautils/h$b;

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

.method public J(Lcom/immomo/moment/mediautils/h$d;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/moment/mediautils/h;->K:Lcom/immomo/moment/mediautils/h$d;

    .line 2
    .line 3
    return-void
.end method

.method public K(Landroid/os/Bundle;)V
    .locals 0
    .annotation build Landroidx/annotation/RequiresApi;
        api = 0x13
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/immomo/moment/mediautils/h;->h:Landroid/media/MediaCodec;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    :try_start_0
    invoke-virtual {p0, p1}, Landroid/media/MediaCodec;->setParameters(Landroid/os/Bundle;)V
    :try_end_0
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_0

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :catch_0
    move-exception p0

    .line 10
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 11
    .line 12
    .line 13
    :cond_0
    return-void
.end method

.method public L(Z)V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/immomo/moment/mediautils/h;->o:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object v1, p0, Lcom/immomo/moment/mediautils/h;->n:Ljava/lang/Thread;

    .line 5
    .line 6
    if-nez v1, :cond_0

    .line 7
    .line 8
    new-instance v1, Ljava/lang/Thread;

    .line 9
    .line 10
    new-instance v2, Lcom/immomo/moment/mediautils/h$c;

    .line 11
    .line 12
    invoke-direct {v2, p0}, Lcom/immomo/moment/mediautils/h$c;-><init>(Lcom/immomo/moment/mediautils/h;)V

    .line 13
    .line 14
    .line 15
    new-instance v3, Ljava/lang/StringBuilder;

    .line 16
    .line 17
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 18
    .line 19
    .line 20
    iget-object v4, p0, Lcom/immomo/moment/mediautils/h;->E:Ljava/lang/String;

    .line 21
    .line 22
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    const-string v4, "_outdata"

    .line 26
    .line 27
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    invoke-static {}, Ll/g8g0;->b()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v4

    .line 34
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 35
    .line 36
    .line 37
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v3

    .line 41
    invoke-direct {v1, v2, v3}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    iput-object v1, p0, Lcom/immomo/moment/mediautils/h;->n:Ljava/lang/Thread;

    .line 45
    .line 46
    invoke-virtual {v1}, Ljava/lang/Thread;->start()V

    .line 47
    .line 48
    .line 49
    goto :goto_0

    .line 50
    :catchall_0
    move-exception p0

    .line 51
    goto :goto_1

    .line 52
    :cond_0
    :goto_0
    iput-boolean p1, p0, Lcom/immomo/moment/mediautils/h;->B:Z

    .line 53
    .line 54
    monitor-exit v0

    .line 55
    return-void

    .line 56
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 57
    throw p0
.end method

.method public u(Landroid/media/MediaFormat;I)Z
    .locals 6

    .line 1
    const-string v0, "CreateMediaCodec Error ["

    .line 2
    .line 3
    iget-object v1, p0, Lcom/immomo/moment/mediautils/h;->o:Ljava/lang/Object;

    .line 4
    .line 5
    monitor-enter v1

    .line 6
    :try_start_0
    const-string v2, "mime"

    .line 7
    .line 8
    invoke-virtual {p1, v2}, Landroid/media/MediaFormat;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v2

    .line 12
    const-string v3, "video/dolby-vision"

    .line 13
    .line 14
    invoke-static {v2, v3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 15
    .line 16
    .line 17
    move-result v2

    .line 18
    const/4 v3, 0x1

    .line 19
    if-eqz v2, :cond_0

    .line 20
    .line 21
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 22
    return v3

    .line 23
    :catchall_0
    move-exception p0

    .line 24
    goto/16 :goto_3

    .line 25
    .line 26
    :cond_0
    const/4 v2, 0x0

    .line 27
    if-gt p2, v3, :cond_5

    .line 28
    .line 29
    if-gez p2, :cond_1

    .line 30
    .line 31
    goto/16 :goto_2

    .line 32
    .line 33
    :cond_1
    const/4 v4, 0x0

    .line 34
    :try_start_1
    iput p2, p0, Lcom/immomo/moment/mediautils/h;->p:I

    .line 35
    .line 36
    const-string p2, "mime"

    .line 37
    .line 38
    invoke-virtual {p1, p2}, Landroid/media/MediaFormat;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object p2

    .line 42
    iput-object p2, p0, Lcom/immomo/moment/mediautils/h;->j:Ljava/lang/String;

    .line 43
    .line 44
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 45
    .line 46
    .line 47
    move-result p2

    .line 48
    if-eqz p2, :cond_2

    .line 49
    .line 50
    const-string p1, "MedaiCodecWrapper"

    .line 51
    .line 52
    const-string p2, "Media codec name is null"

    .line 53
    .line 54
    invoke-static {p1, p2}, Ll/lyv;->c(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 55
    .line 56
    .line 57
    :try_start_2
    monitor-exit v1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 58
    return v2

    .line 59
    :catch_0
    move-exception p1

    .line 60
    goto :goto_1

    .line 61
    :cond_2
    :try_start_3
    iget p2, p0, Lcom/immomo/moment/mediautils/h;->p:I

    .line 62
    .line 63
    if-nez p2, :cond_3

    .line 64
    .line 65
    iget-object p2, p0, Lcom/immomo/moment/mediautils/h;->j:Ljava/lang/String;

    .line 66
    .line 67
    invoke-static {p2}, Landroid/media/MediaCodec;->createEncoderByType(Ljava/lang/String;)Landroid/media/MediaCodec;

    .line 68
    .line 69
    .line 70
    move-result-object p2

    .line 71
    iput-object p2, p0, Lcom/immomo/moment/mediautils/h;->h:Landroid/media/MediaCodec;

    .line 72
    .line 73
    invoke-virtual {p2, p1, v4, v4, v3}, Landroid/media/MediaCodec;->configure(Landroid/media/MediaFormat;Landroid/view/Surface;Landroid/media/MediaCrypto;I)V

    .line 74
    .line 75
    .line 76
    iget-object p2, p0, Lcom/immomo/moment/mediautils/h;->j:Ljava/lang/String;

    .line 77
    .line 78
    const-string v5, "video"

    .line 79
    .line 80
    invoke-virtual {p2, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 81
    .line 82
    .line 83
    move-result p2

    .line 84
    if-eqz p2, :cond_4

    .line 85
    .line 86
    const-string p2, "color-format"

    .line 87
    .line 88
    invoke-virtual {p1, p2}, Landroid/media/MediaFormat;->getInteger(Ljava/lang/String;)I

    .line 89
    .line 90
    .line 91
    move-result p1

    .line 92
    const p2, 0x7f000789

    .line 93
    .line 94
    .line 95
    if-ne p1, p2, :cond_4

    .line 96
    .line 97
    iget-object p1, p0, Lcom/immomo/moment/mediautils/h;->h:Landroid/media/MediaCodec;

    .line 98
    .line 99
    invoke-virtual {p1}, Landroid/media/MediaCodec;->createInputSurface()Landroid/view/Surface;

    .line 100
    .line 101
    .line 102
    move-result-object p1

    .line 103
    iput-object p1, p0, Lcom/immomo/moment/mediautils/h;->i:Landroid/view/Surface;

    .line 104
    .line 105
    goto :goto_0

    .line 106
    :cond_3
    if-ne p2, v3, :cond_4

    .line 107
    .line 108
    iget-object p2, p0, Lcom/immomo/moment/mediautils/h;->j:Ljava/lang/String;

    .line 109
    .line 110
    invoke-static {p2}, Landroid/media/MediaCodec;->createDecoderByType(Ljava/lang/String;)Landroid/media/MediaCodec;

    .line 111
    .line 112
    .line 113
    move-result-object p2

    .line 114
    iput-object p2, p0, Lcom/immomo/moment/mediautils/h;->h:Landroid/media/MediaCodec;

    .line 115
    .line 116
    iget-object v5, p0, Lcom/immomo/moment/mediautils/h;->i:Landroid/view/Surface;

    .line 117
    .line 118
    invoke-virtual {p2, p1, v5, v4, v2}, Landroid/media/MediaCodec;->configure(Landroid/media/MediaFormat;Landroid/view/Surface;Landroid/media/MediaCrypto;I)V

    .line 119
    .line 120
    .line 121
    :cond_4
    :goto_0
    iput v3, p0, Lcom/immomo/moment/mediautils/h;->L:I

    .line 122
    .line 123
    iget-object p1, p0, Lcom/immomo/moment/mediautils/h;->h:Landroid/media/MediaCodec;

    .line 124
    .line 125
    invoke-virtual {p1}, Landroid/media/MediaCodec;->start()V

    .line 126
    .line 127
    .line 128
    const/4 p1, 0x2

    .line 129
    iput p1, p0, Lcom/immomo/moment/mediautils/h;->L:I

    .line 130
    .line 131
    iput-boolean v3, p0, Lcom/immomo/moment/mediautils/h;->H:Z
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 132
    .line 133
    :try_start_4
    monitor-exit v1

    .line 134
    return v3

    .line 135
    :goto_1
    invoke-virtual {p1}, Ljava/lang/Throwable;->printStackTrace()V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 136
    .line 137
    .line 138
    :try_start_5
    iget-object p2, p0, Lcom/immomo/moment/mediautils/h;->h:Landroid/media/MediaCodec;

    .line 139
    .line 140
    invoke-virtual {p2}, Landroid/media/MediaCodec;->release()V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_1
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 141
    .line 142
    .line 143
    :catch_1
    :try_start_6
    iput-object v4, p0, Lcom/immomo/moment/mediautils/h;->h:Landroid/media/MediaCodec;

    .line 144
    .line 145
    const-string p0, "MedaiCodecWrapper"

    .line 146
    .line 147
    new-instance p2, Ljava/lang/StringBuilder;

    .line 148
    .line 149
    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 150
    .line 151
    .line 152
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 153
    .line 154
    .line 155
    move-result-object p1

    .line 156
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 157
    .line 158
    .line 159
    const-string p1, "]"

    .line 160
    .line 161
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 162
    .line 163
    .line 164
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 165
    .line 166
    .line 167
    move-result-object p1

    .line 168
    invoke-static {p0, p1}, Ll/lyv;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 169
    .line 170
    .line 171
    monitor-exit v1

    .line 172
    return v2

    .line 173
    :cond_5
    :goto_2
    const-string p0, "MedaiCodecWrapper"

    .line 174
    .line 175
    const-string p1, "Media format is null"

    .line 176
    .line 177
    invoke-static {p0, p1}, Ll/lyv;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 178
    .line 179
    .line 180
    monitor-exit v1

    .line 181
    return v2

    .line 182
    :goto_3
    monitor-exit v1
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    .line 183
    throw p0
.end method

.method public w()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/immomo/moment/mediautils/h;->o:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object v1, p0, Lcom/immomo/moment/mediautils/h;->h:Landroid/media/MediaCodec;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 5
    .line 6
    if-eqz v1, :cond_0

    .line 7
    .line 8
    :try_start_1
    invoke-virtual {v1}, Landroid/media/MediaCodec;->flush()V

    .line 9
    .line 10
    .line 11
    const/4 v1, 0x3

    .line 12
    iput v1, p0, Lcom/immomo/moment/mediautils/h;->L:I
    :try_end_1
    .catch Ljava/lang/IllegalStateException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :catchall_0
    move-exception p0

    .line 16
    goto :goto_1

    .line 17
    :catch_0
    move-exception v1

    .line 18
    :try_start_2
    const-string v2, "MedaiCodecWrapper"

    .line 19
    .line 20
    invoke-static {v2, v1}, Lcom/cosmos/mdlog/MDLog;->printErrStackTrace(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 21
    .line 22
    .line 23
    :goto_0
    iget-object p0, p0, Lcom/immomo/moment/mediautils/h;->J:Landroid/media/MediaCodec$BufferInfo;

    .line 24
    .line 25
    const/4 v1, 0x0

    .line 26
    iput v1, p0, Landroid/media/MediaCodec$BufferInfo;->size:I

    .line 27
    .line 28
    :cond_0
    monitor-exit v0

    .line 29
    return-void

    .line 30
    :goto_1
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 31
    throw p0
.end method

.method public x()Landroid/view/Surface;
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/immomo/moment/mediautils/h;->o:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object v1, p0, Lcom/immomo/moment/mediautils/h;->j:Ljava/lang/String;

    .line 5
    .line 6
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    if-nez v1, :cond_0

    .line 11
    .line 12
    iget-object v1, p0, Lcom/immomo/moment/mediautils/h;->j:Ljava/lang/String;

    .line 13
    .line 14
    const-string v2, "video"

    .line 15
    .line 16
    invoke-virtual {v1, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    if-eqz v1, :cond_0

    .line 21
    .line 22
    iget-object p0, p0, Lcom/immomo/moment/mediautils/h;->i:Landroid/view/Surface;

    .line 23
    .line 24
    monitor-exit v0

    .line 25
    return-object p0

    .line 26
    :catchall_0
    move-exception p0

    .line 27
    goto :goto_0

    .line 28
    :cond_0
    const/4 p0, 0x0

    .line 29
    monitor-exit v0

    .line 30
    return-object p0

    .line 31
    :goto_0
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 32
    throw p0
.end method

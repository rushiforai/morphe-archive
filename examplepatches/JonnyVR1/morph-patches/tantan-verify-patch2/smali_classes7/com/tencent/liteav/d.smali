.class public Lcom/tencent/liteav/d;
.super Lcom/tencent/liteav/basic/module/a;
.source "SourceFile"

# interfaces
.implements Lcom/tencent/liteav/b$b;
.implements Lcom/tencent/liteav/basic/b/b;
.implements Lcom/tencent/liteav/beauty/f;
.implements Lcom/tencent/liteav/l;
.implements Lcom/tencent/liteav/videoencoder/d;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/tencent/liteav/d$a;
    }
.end annotation


# instance fields
.field private A:I

.field private B:I

.field private C:Lcom/tencent/liteav/basic/c/e;

.field private D:Lcom/tencent/liteav/basic/structs/b;

.field private E:I

.field private F:Z

.field private G:Z

.field private H:J

.field private I:J

.field private J:I

.field private K:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Lcom/tencent/liteav/o;",
            ">;"
        }
    .end annotation
.end field

.field private L:Z

.field private M:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Lcom/tencent/liteav/d$a;",
            ">;"
        }
    .end annotation
.end field

.field private N:Lcom/tencent/liteav/basic/c/h;

.field private O:Lcom/tencent/liteav/basic/c/h;

.field private P:Lcom/tencent/liteav/basic/c/h;

.field private Q:Lcom/tencent/liteav/beauty/b/k;

.field private R:[B

.field private S:Z

.field private T:Z

.field private U:Z

.field private final V:Lcom/tencent/liteav/beauty/b;

.field private W:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Lcom/tencent/liteav/basic/b/b;",
            ">;"
        }
    .end annotation
.end field

.field private X:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Lcom/tencent/liteav/m;",
            ">;"
        }
    .end annotation
.end field

.field private Y:I

.field private Z:I

.field a:Lcom/tencent/liteav/b;

.field b:Lcom/tencent/liteav/b;

.field private final c:Lcom/tencent/liteav/basic/util/e;

.field private d:Lcom/tencent/liteav/k;

.field private e:Lcom/tencent/liteav/beauty/d;

.field private f:Z

.field private g:Z

.field private h:Lcom/tencent/liteav/videoencoder/TXSVideoEncoderParam;

.field private i:Lcom/tencent/liteav/videoencoder/b;

.field private j:I

.field private k:Z

.field private l:Lcom/tencent/liteav/videoencoder/TXSVideoEncoderParam;

.field private m:Lcom/tencent/liteav/videoencoder/b;

.field private final n:Ljava/lang/Object;

.field private o:Landroid/content/Context;

.field private p:Lcom/tencent/liteav/g;

.field private q:I

.field private r:I

.field private s:I

.field private t:Z

.field private u:I

.field private v:I

.field private w:Z

.field private x:Lcom/tencent/rtmp/ui/TXCloudVideoView;

.field private final y:Ljava/lang/Object;

.field private z:Landroid/view/Surface;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 4

    .line 1
    invoke-direct {p0}, Lcom/tencent/liteav/basic/module/a;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lcom/tencent/liteav/basic/util/e;

    .line 5
    .line 6
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    invoke-direct {v0, v1}, Lcom/tencent/liteav/basic/util/e;-><init>(Landroid/os/Looper;)V

    .line 11
    .line 12
    .line 13
    iput-object v0, p0, Lcom/tencent/liteav/d;->c:Lcom/tencent/liteav/basic/util/e;

    .line 14
    .line 15
    const/4 v0, 0x0

    .line 16
    iput-object v0, p0, Lcom/tencent/liteav/d;->d:Lcom/tencent/liteav/k;

    .line 17
    .line 18
    iput-object v0, p0, Lcom/tencent/liteav/d;->e:Lcom/tencent/liteav/beauty/d;

    .line 19
    .line 20
    const/4 v1, 0x0

    .line 21
    iput-boolean v1, p0, Lcom/tencent/liteav/d;->f:Z

    .line 22
    .line 23
    iput-boolean v1, p0, Lcom/tencent/liteav/d;->g:Z

    .line 24
    .line 25
    iput-object v0, p0, Lcom/tencent/liteav/d;->h:Lcom/tencent/liteav/videoencoder/TXSVideoEncoderParam;

    .line 26
    .line 27
    iput-object v0, p0, Lcom/tencent/liteav/d;->i:Lcom/tencent/liteav/videoencoder/b;

    .line 28
    .line 29
    const/16 v2, 0xf

    .line 30
    .line 31
    iput v2, p0, Lcom/tencent/liteav/d;->j:I

    .line 32
    .line 33
    iput-boolean v1, p0, Lcom/tencent/liteav/d;->k:Z

    .line 34
    .line 35
    iput-object v0, p0, Lcom/tencent/liteav/d;->l:Lcom/tencent/liteav/videoencoder/TXSVideoEncoderParam;

    .line 36
    .line 37
    iput-object v0, p0, Lcom/tencent/liteav/d;->m:Lcom/tencent/liteav/videoencoder/b;

    .line 38
    .line 39
    new-instance v2, Ljava/lang/Object;

    .line 40
    .line 41
    invoke-direct {v2}, Ljava/lang/Object;-><init>()V

    .line 42
    .line 43
    .line 44
    iput-object v2, p0, Lcom/tencent/liteav/d;->n:Ljava/lang/Object;

    .line 45
    .line 46
    iput-object v0, p0, Lcom/tencent/liteav/d;->o:Landroid/content/Context;

    .line 47
    .line 48
    iput-object v0, p0, Lcom/tencent/liteav/d;->p:Lcom/tencent/liteav/g;

    .line 49
    .line 50
    iput v1, p0, Lcom/tencent/liteav/d;->q:I

    .line 51
    .line 52
    iput v1, p0, Lcom/tencent/liteav/d;->r:I

    .line 53
    .line 54
    iput v1, p0, Lcom/tencent/liteav/d;->s:I

    .line 55
    .line 56
    iput-boolean v1, p0, Lcom/tencent/liteav/d;->t:Z

    .line 57
    .line 58
    iput v1, p0, Lcom/tencent/liteav/d;->u:I

    .line 59
    .line 60
    iput v1, p0, Lcom/tencent/liteav/d;->v:I

    .line 61
    .line 62
    iput-boolean v1, p0, Lcom/tencent/liteav/d;->w:Z

    .line 63
    .line 64
    iput-object v0, p0, Lcom/tencent/liteav/d;->x:Lcom/tencent/rtmp/ui/TXCloudVideoView;

    .line 65
    .line 66
    new-instance v2, Ljava/lang/Object;

    .line 67
    .line 68
    invoke-direct {v2}, Ljava/lang/Object;-><init>()V

    .line 69
    .line 70
    .line 71
    iput-object v2, p0, Lcom/tencent/liteav/d;->y:Ljava/lang/Object;

    .line 72
    .line 73
    iput-object v0, p0, Lcom/tencent/liteav/d;->z:Landroid/view/Surface;

    .line 74
    .line 75
    iput v1, p0, Lcom/tencent/liteav/d;->A:I

    .line 76
    .line 77
    iput v1, p0, Lcom/tencent/liteav/d;->B:I

    .line 78
    .line 79
    iput-object v0, p0, Lcom/tencent/liteav/d;->C:Lcom/tencent/liteav/basic/c/e;

    .line 80
    .line 81
    iput v1, p0, Lcom/tencent/liteav/d;->E:I

    .line 82
    .line 83
    iput-boolean v1, p0, Lcom/tencent/liteav/d;->F:Z

    .line 84
    .line 85
    iput-boolean v1, p0, Lcom/tencent/liteav/d;->G:Z

    .line 86
    .line 87
    const-wide/16 v2, 0x0

    .line 88
    .line 89
    iput-wide v2, p0, Lcom/tencent/liteav/d;->H:J

    .line 90
    .line 91
    iput-wide v2, p0, Lcom/tencent/liteav/d;->I:J

    .line 92
    .line 93
    const/4 v2, 0x2

    .line 94
    iput v2, p0, Lcom/tencent/liteav/d;->J:I

    .line 95
    .line 96
    iput-boolean v1, p0, Lcom/tencent/liteav/d;->L:Z

    .line 97
    .line 98
    iput-object v0, p0, Lcom/tencent/liteav/d;->M:Ljava/lang/ref/WeakReference;

    .line 99
    .line 100
    iput-object v0, p0, Lcom/tencent/liteav/d;->N:Lcom/tencent/liteav/basic/c/h;

    .line 101
    .line 102
    iput-boolean v1, p0, Lcom/tencent/liteav/d;->S:Z

    .line 103
    .line 104
    iput-boolean v1, p0, Lcom/tencent/liteav/d;->T:Z

    .line 105
    .line 106
    iput-boolean v1, p0, Lcom/tencent/liteav/d;->U:Z

    .line 107
    .line 108
    iput v1, p0, Lcom/tencent/liteav/d;->Y:I

    .line 109
    .line 110
    iput v1, p0, Lcom/tencent/liteav/d;->Z:I

    .line 111
    .line 112
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 113
    .line 114
    .line 115
    move-result-object p1

    .line 116
    iput-object p1, p0, Lcom/tencent/liteav/d;->o:Landroid/content/Context;

    .line 117
    .line 118
    new-instance p1, Lcom/tencent/liteav/g;

    .line 119
    .line 120
    invoke-direct {p1}, Lcom/tencent/liteav/g;-><init>()V

    .line 121
    .line 122
    .line 123
    iput-object p1, p0, Lcom/tencent/liteav/d;->p:Lcom/tencent/liteav/g;

    .line 124
    .line 125
    new-instance p1, Lcom/tencent/liteav/beauty/d;

    .line 126
    .line 127
    iget-object v1, p0, Lcom/tencent/liteav/d;->o:Landroid/content/Context;

    .line 128
    .line 129
    const/4 v2, 0x1

    .line 130
    invoke-direct {p1, v1, v2}, Lcom/tencent/liteav/beauty/d;-><init>(Landroid/content/Context;Z)V

    .line 131
    .line 132
    .line 133
    iput-object p1, p0, Lcom/tencent/liteav/d;->e:Lcom/tencent/liteav/beauty/d;

    .line 134
    .line 135
    invoke-virtual {p1, p0}, Lcom/tencent/liteav/beauty/d;->a(Lcom/tencent/liteav/beauty/f;)V

    .line 136
    .line 137
    .line 138
    iget-object p1, p0, Lcom/tencent/liteav/d;->e:Lcom/tencent/liteav/beauty/d;

    .line 139
    .line 140
    invoke-virtual {p1, p0}, Lcom/tencent/liteav/beauty/d;->a(Lcom/tencent/liteav/basic/b/b;)V

    .line 141
    .line 142
    .line 143
    iget-object p1, p0, Lcom/tencent/liteav/d;->p:Lcom/tencent/liteav/g;

    .line 144
    .line 145
    iget-boolean v1, p1, Lcom/tencent/liteav/g;->U:Z

    .line 146
    .line 147
    if-eqz v1, :cond_0

    .line 148
    .line 149
    iget-object p1, p0, Lcom/tencent/liteav/d;->e:Lcom/tencent/liteav/beauty/d;

    .line 150
    .line 151
    sget-object v1, Lcom/tencent/liteav/beauty/d$d;->a:Lcom/tencent/liteav/beauty/d$d;

    .line 152
    .line 153
    invoke-virtual {p1, v1}, Lcom/tencent/liteav/beauty/d;->a(Lcom/tencent/liteav/beauty/d$d;)V

    .line 154
    .line 155
    .line 156
    goto :goto_0

    .line 157
    :cond_0
    iget-boolean p1, p1, Lcom/tencent/liteav/g;->T:Z

    .line 158
    .line 159
    iget-object v1, p0, Lcom/tencent/liteav/d;->e:Lcom/tencent/liteav/beauty/d;

    .line 160
    .line 161
    if-eqz p1, :cond_1

    .line 162
    .line 163
    sget-object p1, Lcom/tencent/liteav/beauty/d$d;->b:Lcom/tencent/liteav/beauty/d$d;

    .line 164
    .line 165
    invoke-virtual {v1, p1}, Lcom/tencent/liteav/beauty/d;->a(Lcom/tencent/liteav/beauty/d$d;)V

    .line 166
    .line 167
    .line 168
    goto :goto_0

    .line 169
    :cond_1
    sget-object p1, Lcom/tencent/liteav/beauty/d$d;->c:Lcom/tencent/liteav/beauty/d$d;

    .line 170
    .line 171
    invoke-virtual {v1, p1}, Lcom/tencent/liteav/beauty/d;->a(Lcom/tencent/liteav/beauty/d$d;)V

    .line 172
    .line 173
    .line 174
    :goto_0
    new-instance p1, Lcom/tencent/liteav/videoencoder/TXSVideoEncoderParam;

    .line 175
    .line 176
    invoke-direct {p1}, Lcom/tencent/liteav/videoencoder/TXSVideoEncoderParam;-><init>()V

    .line 177
    .line 178
    .line 179
    iput-object p1, p0, Lcom/tencent/liteav/d;->h:Lcom/tencent/liteav/videoencoder/TXSVideoEncoderParam;

    .line 180
    .line 181
    iput v2, p1, Lcom/tencent/liteav/videoencoder/TXSVideoEncoderParam;->encoderMode:I

    .line 182
    .line 183
    iput-object v0, p0, Lcom/tencent/liteav/d;->i:Lcom/tencent/liteav/videoencoder/b;

    .line 184
    .line 185
    new-instance p1, Lcom/tencent/liteav/videoencoder/TXSVideoEncoderParam;

    .line 186
    .line 187
    invoke-direct {p1}, Lcom/tencent/liteav/videoencoder/TXSVideoEncoderParam;-><init>()V

    .line 188
    .line 189
    .line 190
    iput-object p1, p0, Lcom/tencent/liteav/d;->l:Lcom/tencent/liteav/videoencoder/TXSVideoEncoderParam;

    .line 191
    .line 192
    iput v2, p1, Lcom/tencent/liteav/videoencoder/TXSVideoEncoderParam;->encoderMode:I

    .line 193
    .line 194
    new-instance p1, Lcom/tencent/liteav/b;

    .line 195
    .line 196
    invoke-direct {p1, p0}, Lcom/tencent/liteav/b;-><init>(Lcom/tencent/liteav/b$b;)V

    .line 197
    .line 198
    .line 199
    iput-object p1, p0, Lcom/tencent/liteav/d;->a:Lcom/tencent/liteav/b;

    .line 200
    .line 201
    new-instance p1, Lcom/tencent/liteav/basic/license/g;

    .line 202
    .line 203
    iget-object v0, p0, Lcom/tencent/liteav/d;->o:Landroid/content/Context;

    .line 204
    .line 205
    invoke-direct {p1, v0}, Lcom/tencent/liteav/basic/license/g;-><init>(Landroid/content/Context;)V

    .line 206
    .line 207
    .line 208
    new-instance v0, Lcom/tencent/liteav/beauty/b;

    .line 209
    .line 210
    invoke-direct {v0, p1}, Lcom/tencent/liteav/beauty/b;-><init>(Lcom/tencent/liteav/basic/license/e;)V

    .line 211
    .line 212
    .line 213
    iput-object v0, p0, Lcom/tencent/liteav/d;->V:Lcom/tencent/liteav/beauty/b;

    .line 214
    .line 215
    iget-object p1, p0, Lcom/tencent/liteav/d;->e:Lcom/tencent/liteav/beauty/d;

    .line 216
    .line 217
    invoke-virtual {v0, p1}, Lcom/tencent/liteav/beauty/b;->setPreprocessor(Lcom/tencent/liteav/beauty/d;)V

    .line 218
    .line 219
    .line 220
    invoke-static {}, Lcom/tencent/liteav/basic/d/c;->a()Lcom/tencent/liteav/basic/d/c;

    .line 221
    .line 222
    .line 223
    move-result-object p1

    .line 224
    iget-object p0, p0, Lcom/tencent/liteav/d;->o:Landroid/content/Context;

    .line 225
    .line 226
    invoke-virtual {p1, p0}, Lcom/tencent/liteav/basic/d/c;->a(Landroid/content/Context;)V

    .line 227
    .line 228
    .line 229
    return-void
.end method

.method private a(IILjava/lang/Object;)I
    .locals 4

    .line 574
    iget-object p1, p0, Lcom/tencent/liteav/d;->p:Lcom/tencent/liteav/g;

    iget p2, p1, Lcom/tencent/liteav/g;->a:I

    .line 575
    iget v0, p1, Lcom/tencent/liteav/g;->b:I

    .line 576
    iget v1, p1, Lcom/tencent/liteav/g;->l:I

    if-eqz v1, :cond_0

    const/4 v2, 0x2

    if-ne v1, v2, :cond_1

    :cond_0
    move v3, v0

    move v0, p2

    move p2, v3

    :cond_1
    if-lez p2, :cond_4

    if-gtz v0, :cond_2

    goto :goto_0

    .line 577
    :cond_2
    iget-boolean p1, p1, Lcom/tencent/liteav/g;->M:Z

    if-eqz p1, :cond_3

    .line 578
    invoke-direct {p0}, Lcom/tencent/liteav/d;->x()V

    const/16 p0, -0x3e8

    return p0

    .line 579
    :cond_3
    invoke-direct {p0, p2, v0, p3}, Lcom/tencent/liteav/d;->b(IILjava/lang/Object;)V

    const/4 p0, 0x0

    return p0

    .line 580
    :cond_4
    :goto_0
    const-string p0, "TXCCaptureAndEnc"

    const-string p1, "sendCustomYUVData: invalid video encode resolution"

    invoke-static {p0, p1}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    const/4 p0, -0x1

    return p0
.end method

.method public static synthetic a(Lcom/tencent/liteav/d;I)I
    .locals 0

    .line 335
    iput p1, p0, Lcom/tencent/liteav/d;->j:I

    return p1
.end method

.method public static synthetic a(Lcom/tencent/liteav/d;)Lcom/tencent/liteav/videoencoder/b;
    .locals 0

    .line 336
    iget-object p0, p0, Lcom/tencent/liteav/d;->i:Lcom/tencent/liteav/videoencoder/b;

    return-object p0
.end method

.method private a(IIIJ)V
    .locals 6

    const-wide/16 v0, 0x0

    cmp-long v0, p4, v0

    if-nez v0, :cond_0

    .line 568
    invoke-static {}, Lcom/tencent/liteav/basic/util/TXCTimeUtil;->generatePtsMS()J

    move-result-wide p4

    :cond_0
    move-wide v4, p4

    .line 569
    iget-object p4, p0, Lcom/tencent/liteav/d;->e:Lcom/tencent/liteav/beauty/d;

    invoke-virtual {p4}, Lcom/tencent/liteav/beauty/d;->a()Ljava/lang/Object;

    move-result-object p4

    invoke-direct {p0, p2, p3, p4}, Lcom/tencent/liteav/d;->b(IILjava/lang/Object;)V

    .line 570
    iget-object v0, p0, Lcom/tencent/liteav/d;->i:Lcom/tencent/liteav/videoencoder/b;

    move v1, p1

    move v2, p2

    move v3, p3

    if-eqz v0, :cond_1

    .line 571
    invoke-virtual/range {v0 .. v5}, Lcom/tencent/liteav/videoencoder/b;->a(IIIJ)J

    .line 572
    :cond_1
    iget-object v0, p0, Lcom/tencent/liteav/d;->m:Lcom/tencent/liteav/videoencoder/b;

    if-eqz v0, :cond_2

    .line 573
    invoke-virtual/range {v0 .. v5}, Lcom/tencent/liteav/videoencoder/b;->a(IIIJ)J

    :cond_2
    return-void
.end method

.method private a(IIILjava/lang/Object;IZ)V
    .locals 23

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move/from16 v1, p1

    .line 4
    .line 5
    move/from16 v2, p2

    .line 6
    .line 7
    move/from16 v3, p3

    .line 8
    .line 9
    move-object/from16 v4, p4

    .line 10
    .line 11
    new-instance v5, Ljava/lang/StringBuilder;

    .line 12
    .line 13
    const-string v6, "New encode size width = "

    .line 14
    .line 15
    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    const-string v6, " height = "

    .line 22
    .line 23
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    const-string v6, " encType = "

    .line 30
    .line 31
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 35
    .line 36
    .line 37
    const-string v6, " eglContext: "

    .line 38
    .line 39
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 40
    .line 41
    .line 42
    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 43
    .line 44
    .line 45
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object v5

    .line 49
    const-string v6, "TXCCaptureAndEnc"

    .line 50
    .line 51
    invoke-static {v6, v5}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 52
    .line 53
    .line 54
    invoke-direct {v0}, Lcom/tencent/liteav/d;->x()V

    .line 55
    .line 56
    .line 57
    new-instance v5, Lcom/tencent/liteav/videoencoder/b;

    .line 58
    .line 59
    invoke-direct {v5, v3}, Lcom/tencent/liteav/videoencoder/b;-><init>(I)V

    .line 60
    .line 61
    .line 62
    invoke-virtual {v0}, Lcom/tencent/liteav/basic/module/a;->getID()Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object v6

    .line 66
    iget v7, v0, Lcom/tencent/liteav/d;->E:I

    .line 67
    .line 68
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 69
    .line 70
    .line 71
    move-result-object v8

    .line 72
    const/16 v9, 0xfa5

    .line 73
    .line 74
    invoke-static {v6, v9, v7, v8}, Lcom/tencent/liteav/basic/module/TXCStatus;->a(Ljava/lang/String;IILjava/lang/Object;)Z

    .line 75
    .line 76
    .line 77
    const/4 v6, 0x1

    .line 78
    if-ne v3, v6, :cond_0

    .line 79
    .line 80
    invoke-virtual {v0}, Lcom/tencent/liteav/basic/module/a;->getID()Ljava/lang/String;

    .line 81
    .line 82
    .line 83
    move-result-object v7

    .line 84
    const-string v13, ""

    .line 85
    .line 86
    iget v14, v0, Lcom/tencent/liteav/d;->E:I

    .line 87
    .line 88
    const/16 v8, 0xfa4

    .line 89
    .line 90
    const-wide/16 v9, 0x1

    .line 91
    .line 92
    const-wide/16 v11, -0x1

    .line 93
    .line 94
    invoke-static/range {v7 .. v14}, Lcom/tencent/liteav/basic/module/TXCEventRecorderProxy;->a(Ljava/lang/String;IJJLjava/lang/String;I)V

    .line 95
    .line 96
    .line 97
    goto :goto_0

    .line 98
    :cond_0
    invoke-virtual {v0}, Lcom/tencent/liteav/basic/module/a;->getID()Ljava/lang/String;

    .line 99
    .line 100
    .line 101
    move-result-object v15

    .line 102
    const-string v21, ""

    .line 103
    .line 104
    iget v6, v0, Lcom/tencent/liteav/d;->E:I

    .line 105
    .line 106
    const/16 v16, 0xfa4

    .line 107
    .line 108
    const-wide/16 v17, 0x0

    .line 109
    .line 110
    const-wide/16 v19, -0x1

    .line 111
    .line 112
    move/from16 v22, v6

    .line 113
    .line 114
    invoke-static/range {v15 .. v22}, Lcom/tencent/liteav/basic/module/TXCEventRecorderProxy;->a(Ljava/lang/String;IJJLjava/lang/String;I)V

    .line 115
    .line 116
    .line 117
    :goto_0
    const/4 v6, 0x0

    .line 118
    iput-boolean v6, v0, Lcom/tencent/liteav/d;->T:Z

    .line 119
    .line 120
    iget-object v6, v0, Lcom/tencent/liteav/d;->h:Lcom/tencent/liteav/videoencoder/TXSVideoEncoderParam;

    .line 121
    .line 122
    iput v3, v6, Lcom/tencent/liteav/videoencoder/TXSVideoEncoderParam;->encodeType:I

    .line 123
    .line 124
    iput v1, v6, Lcom/tencent/liteav/videoencoder/TXSVideoEncoderParam;->width:I

    .line 125
    .line 126
    iput v2, v6, Lcom/tencent/liteav/videoencoder/TXSVideoEncoderParam;->height:I

    .line 127
    .line 128
    move/from16 v3, p5

    .line 129
    .line 130
    iput v3, v6, Lcom/tencent/liteav/videoencoder/TXSVideoEncoderParam;->fps:I

    .line 131
    .line 132
    iget-object v3, v0, Lcom/tencent/liteav/d;->p:Lcom/tencent/liteav/g;

    .line 133
    .line 134
    iget v7, v3, Lcom/tencent/liteav/g;->i:I

    .line 135
    .line 136
    iput v7, v6, Lcom/tencent/liteav/videoencoder/TXSVideoEncoderParam;->gop:I

    .line 137
    .line 138
    iget v3, v3, Lcom/tencent/liteav/g;->n:I

    .line 139
    .line 140
    iput v3, v6, Lcom/tencent/liteav/videoencoder/TXSVideoEncoderParam;->encoderProfile:I

    .line 141
    .line 142
    if-eqz v4, :cond_1

    .line 143
    .line 144
    move-object v1, v4

    .line 145
    goto :goto_1

    .line 146
    :cond_1
    invoke-virtual {v5, v1, v2}, Lcom/tencent/liteav/videoencoder/b;->a(II)Ljavax/microedition/khronos/egl/EGLContext;

    .line 147
    .line 148
    .line 149
    move-result-object v1

    .line 150
    :goto_1
    iput-object v1, v6, Lcom/tencent/liteav/videoencoder/TXSVideoEncoderParam;->glContext:Ljava/lang/Object;

    .line 151
    .line 152
    iget-object v1, v0, Lcom/tencent/liteav/d;->h:Lcom/tencent/liteav/videoencoder/TXSVideoEncoderParam;

    .line 153
    .line 154
    move/from16 v2, p6

    .line 155
    .line 156
    iput-boolean v2, v1, Lcom/tencent/liteav/videoencoder/TXSVideoEncoderParam;->realTime:Z

    .line 157
    .line 158
    iget v2, v0, Lcom/tencent/liteav/d;->E:I

    .line 159
    .line 160
    iput v2, v1, Lcom/tencent/liteav/videoencoder/TXSVideoEncoderParam;->streamType:I

    .line 161
    .line 162
    iget-boolean v2, v0, Lcom/tencent/liteav/d;->G:Z

    .line 163
    .line 164
    iput-boolean v2, v1, Lcom/tencent/liteav/videoencoder/TXSVideoEncoderParam;->annexb:Z

    .line 165
    .line 166
    iget-boolean v2, v0, Lcom/tencent/liteav/d;->F:Z

    .line 167
    .line 168
    iput-boolean v2, v1, Lcom/tencent/liteav/videoencoder/TXSVideoEncoderParam;->bMultiRef:Z

    .line 169
    .line 170
    iget-wide v2, v0, Lcom/tencent/liteav/d;->H:J

    .line 171
    .line 172
    const-wide/16 v6, 0x14

    .line 173
    .line 174
    add-long/2addr v2, v6

    .line 175
    iput-wide v2, v1, Lcom/tencent/liteav/videoencoder/TXSVideoEncoderParam;->baseFrameIndex:J

    .line 176
    .line 177
    iget-wide v2, v0, Lcom/tencent/liteav/d;->I:J

    .line 178
    .line 179
    const-wide/16 v6, 0x1

    .line 180
    .line 181
    add-long/2addr v2, v6

    .line 182
    const-wide/16 v8, 0xff

    .line 183
    .line 184
    rem-long/2addr v2, v8

    .line 185
    add-long/2addr v2, v6

    .line 186
    iput-wide v2, v1, Lcom/tencent/liteav/videoencoder/TXSVideoEncoderParam;->baseGopIndex:J

    .line 187
    .line 188
    iget-boolean v2, v0, Lcom/tencent/liteav/d;->g:Z

    .line 189
    .line 190
    iput-boolean v2, v1, Lcom/tencent/liteav/videoencoder/TXSVideoEncoderParam;->bLimitFps:Z

    .line 191
    .line 192
    iget-boolean v2, v0, Lcom/tencent/liteav/d;->U:Z

    .line 193
    .line 194
    iput-boolean v2, v1, Lcom/tencent/liteav/videoencoder/TXSVideoEncoderParam;->record:Z

    .line 195
    .line 196
    iget-object v2, v0, Lcom/tencent/liteav/d;->p:Lcom/tencent/liteav/g;

    .line 197
    .line 198
    iget-object v2, v2, Lcom/tencent/liteav/g;->Y:Lorg/json/JSONArray;

    .line 199
    .line 200
    iput-object v2, v1, Lcom/tencent/liteav/videoencoder/TXSVideoEncoderParam;->encFmt:Lorg/json/JSONArray;

    .line 201
    .line 202
    invoke-virtual {v5, v0}, Lcom/tencent/liteav/videoencoder/b;->a(Lcom/tencent/liteav/videoencoder/d;)V

    .line 203
    .line 204
    .line 205
    invoke-virtual {v5, v0}, Lcom/tencent/liteav/videoencoder/b;->a(Lcom/tencent/liteav/basic/b/b;)V

    .line 206
    .line 207
    .line 208
    iget-object v1, v0, Lcom/tencent/liteav/d;->h:Lcom/tencent/liteav/videoencoder/TXSVideoEncoderParam;

    .line 209
    .line 210
    invoke-virtual {v5, v1}, Lcom/tencent/liteav/videoencoder/b;->a(Lcom/tencent/liteav/videoencoder/TXSVideoEncoderParam;)I

    .line 211
    .line 212
    .line 213
    iget-object v1, v0, Lcom/tencent/liteav/d;->p:Lcom/tencent/liteav/g;

    .line 214
    .line 215
    iget v1, v1, Lcom/tencent/liteav/g;->c:I

    .line 216
    .line 217
    invoke-virtual {v5, v1}, Lcom/tencent/liteav/videoencoder/b;->c(I)V

    .line 218
    .line 219
    .line 220
    iget v1, v0, Lcom/tencent/liteav/d;->j:I

    .line 221
    .line 222
    invoke-virtual {v5, v1}, Lcom/tencent/liteav/videoencoder/b;->d(I)Z

    .line 223
    .line 224
    .line 225
    invoke-virtual {v0}, Lcom/tencent/liteav/basic/module/a;->getID()Ljava/lang/String;

    .line 226
    .line 227
    .line 228
    move-result-object v1

    .line 229
    invoke-virtual {v5, v1}, Lcom/tencent/liteav/videoencoder/b;->setID(Ljava/lang/String;)V

    .line 230
    .line 231
    .line 232
    iget v1, v0, Lcom/tencent/liteav/d;->Y:I

    .line 233
    .line 234
    invoke-virtual {v5, v1}, Lcom/tencent/liteav/videoencoder/b;->a(I)V

    .line 235
    .line 236
    .line 237
    iput-object v5, v0, Lcom/tencent/liteav/d;->i:Lcom/tencent/liteav/videoencoder/b;

    .line 238
    .line 239
    invoke-virtual {v0}, Lcom/tencent/liteav/basic/module/a;->getID()Ljava/lang/String;

    .line 240
    .line 241
    .line 242
    move-result-object v1

    .line 243
    iget v2, v0, Lcom/tencent/liteav/d;->E:I

    .line 244
    .line 245
    iget-object v3, v0, Lcom/tencent/liteav/d;->h:Lcom/tencent/liteav/videoencoder/TXSVideoEncoderParam;

    .line 246
    .line 247
    iget v4, v3, Lcom/tencent/liteav/videoencoder/TXSVideoEncoderParam;->width:I

    .line 248
    .line 249
    shl-int/lit8 v4, v4, 0x10

    .line 250
    .line 251
    iget v3, v3, Lcom/tencent/liteav/videoencoder/TXSVideoEncoderParam;->height:I

    .line 252
    .line 253
    or-int/2addr v3, v4

    .line 254
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 255
    .line 256
    .line 257
    move-result-object v3

    .line 258
    const/16 v4, 0xfa3

    .line 259
    .line 260
    invoke-static {v1, v4, v2, v3}, Lcom/tencent/liteav/basic/module/TXCStatus;->a(Ljava/lang/String;IILjava/lang/Object;)Z

    .line 261
    .line 262
    .line 263
    invoke-virtual {v0}, Lcom/tencent/liteav/basic/module/a;->getID()Ljava/lang/String;

    .line 264
    .line 265
    .line 266
    move-result-object v1

    .line 267
    iget v2, v0, Lcom/tencent/liteav/d;->E:I

    .line 268
    .line 269
    iget-object v3, v0, Lcom/tencent/liteav/d;->h:Lcom/tencent/liteav/videoencoder/TXSVideoEncoderParam;

    .line 270
    .line 271
    iget v3, v3, Lcom/tencent/liteav/videoencoder/TXSVideoEncoderParam;->gop:I

    .line 272
    .line 273
    mul-int/lit16 v3, v3, 0x3e8

    .line 274
    .line 275
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 276
    .line 277
    .line 278
    move-result-object v3

    .line 279
    const/16 v4, 0x32cb

    .line 280
    .line 281
    invoke-static {v1, v4, v2, v3}, Lcom/tencent/liteav/basic/module/TXCStatus;->a(Ljava/lang/String;IILjava/lang/Object;)Z

    .line 282
    .line 283
    .line 284
    invoke-virtual {v0}, Lcom/tencent/liteav/basic/module/a;->getID()Ljava/lang/String;

    .line 285
    .line 286
    .line 287
    move-result-object v5

    .line 288
    iget-object v1, v0, Lcom/tencent/liteav/d;->h:Lcom/tencent/liteav/videoencoder/TXSVideoEncoderParam;

    .line 289
    .line 290
    iget v2, v1, Lcom/tencent/liteav/videoencoder/TXSVideoEncoderParam;->width:I

    .line 291
    .line 292
    int-to-long v7, v2

    .line 293
    iget v1, v1, Lcom/tencent/liteav/videoencoder/TXSVideoEncoderParam;->height:I

    .line 294
    .line 295
    int-to-long v9, v1

    .line 296
    const-string v11, ""

    .line 297
    .line 298
    iget v12, v0, Lcom/tencent/liteav/d;->E:I

    .line 299
    .line 300
    const/16 v6, 0xfa3

    .line 301
    .line 302
    invoke-static/range {v5 .. v12}, Lcom/tencent/liteav/basic/module/TXCEventRecorderProxy;->a(Ljava/lang/String;IJJLjava/lang/String;I)V

    .line 303
    .line 304
    .line 305
    iget-object v1, v0, Lcom/tencent/liteav/d;->h:Lcom/tencent/liteav/videoencoder/TXSVideoEncoderParam;

    .line 306
    .line 307
    iget v1, v1, Lcom/tencent/liteav/videoencoder/TXSVideoEncoderParam;->encodeType:I

    .line 308
    .line 309
    iget v2, v0, Lcom/tencent/liteav/d;->E:I

    .line 310
    .line 311
    const v3, 0x9c64

    .line 312
    .line 313
    .line 314
    invoke-static {v3, v1, v2}, Lcom/tencent/liteav/basic/module/TXCKeyPointReportProxy;->a(III)V

    .line 315
    .line 316
    .line 317
    iget-object v1, v0, Lcom/tencent/liteav/d;->h:Lcom/tencent/liteav/videoencoder/TXSVideoEncoderParam;

    .line 318
    .line 319
    iget v2, v1, Lcom/tencent/liteav/videoencoder/TXSVideoEncoderParam;->width:I

    .line 320
    .line 321
    shl-int/lit8 v2, v2, 0x10

    .line 322
    .line 323
    iget v1, v1, Lcom/tencent/liteav/videoencoder/TXSVideoEncoderParam;->height:I

    .line 324
    .line 325
    or-int/2addr v1, v2

    .line 326
    iget v0, v0, Lcom/tencent/liteav/d;->E:I

    .line 327
    .line 328
    const v2, 0x9c65

    .line 329
    .line 330
    .line 331
    invoke-static {v2, v1, v0}, Lcom/tencent/liteav/basic/module/TXCKeyPointReportProxy;->a(III)V

    .line 332
    .line 333
    .line 334
    return-void
.end method

.method private a(ILjava/lang/String;)V
    .locals 24

    move-object/from16 v0, p0

    move/from16 v1, p1

    move-object/from16 v2, p2

    .line 466
    new-instance v3, Landroid/os/Bundle;

    invoke-direct {v3}, Landroid/os/Bundle;-><init>()V

    .line 467
    const-string v4, "EVT_USERID"

    invoke-virtual {v0}, Lcom/tencent/liteav/basic/module/a;->getID()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 468
    const-string v4, "EVT_ID"

    invoke-virtual {v3, v4, v1}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    .line 469
    const-string v4, "EVT_TIME"

    invoke-static {}, Lcom/tencent/liteav/basic/util/TXCTimeUtil;->getTimeTick()J

    move-result-wide v5

    invoke-virtual {v3, v4, v5, v6}, Landroid/os/BaseBundle;->putLong(Ljava/lang/String;J)V

    if-eqz v2, :cond_0

    .line 470
    const-string v4, "EVT_MSG"

    invoke-virtual {v3, v4, v2}, Landroid/os/Bundle;->putCharSequence(Ljava/lang/String;Ljava/lang/CharSequence;)V

    .line 471
    :cond_0
    iget-object v2, v0, Lcom/tencent/liteav/d;->W:Ljava/lang/ref/WeakReference;

    invoke-static {v2, v1, v3}, Lcom/tencent/liteav/basic/util/f;->a(Ljava/lang/ref/WeakReference;ILandroid/os/Bundle;)V

    const-wide/16 v2, 0x1

    const-wide/16 v4, 0x0

    const/16 v6, -0x522

    const/16 v7, -0x525

    if-ne v1, v7, :cond_1

    .line 472
    invoke-virtual {v0}, Lcom/tencent/liteav/basic/module/a;->getID()Ljava/lang/String;

    move-result-object v8

    const-string v14, ""

    iget v15, v0, Lcom/tencent/liteav/d;->E:I

    const/16 v9, 0x7d2

    const-wide/16 v10, 0x4

    const-wide/16 v12, -0x1

    invoke-static/range {v8 .. v15}, Lcom/tencent/liteav/basic/module/TXCEventRecorderProxy;->a(Ljava/lang/String;IJJLjava/lang/String;I)V

    goto :goto_1

    :cond_1
    if-ne v1, v6, :cond_2

    .line 473
    invoke-virtual {v0}, Lcom/tencent/liteav/basic/module/a;->getID()Ljava/lang/String;

    move-result-object v16

    const-string v22, ""

    iget v8, v0, Lcom/tencent/liteav/d;->E:I

    const/16 v17, 0x7d2

    const-wide/16 v18, 0x5

    const-wide/16 v20, -0x1

    move/from16 v23, v8

    invoke-static/range {v16 .. v23}, Lcom/tencent/liteav/basic/module/TXCEventRecorderProxy;->a(Ljava/lang/String;IJJLjava/lang/String;I)V

    goto :goto_1

    :cond_2
    const/16 v8, 0x3eb

    if-ne v1, v8, :cond_4

    .line 474
    iget-object v8, v0, Lcom/tencent/liteav/d;->d:Lcom/tencent/liteav/k;

    if-eqz v8, :cond_4

    invoke-virtual {v0}, Lcom/tencent/liteav/basic/module/a;->getID()Ljava/lang/String;

    move-result-object v9

    iget-object v8, v0, Lcom/tencent/liteav/d;->d:Lcom/tencent/liteav/k;

    invoke-interface {v8}, Lcom/tencent/liteav/k;->l()Z

    move-result v8

    if-eqz v8, :cond_3

    move-wide v11, v4

    goto :goto_0

    :cond_3
    move-wide v11, v2

    :goto_0
    const-string v15, ""

    iget v8, v0, Lcom/tencent/liteav/d;->E:I

    const/16 v10, 0xfa1

    const-wide/16 v13, -0x1

    move/from16 v16, v8

    invoke-static/range {v9 .. v16}, Lcom/tencent/liteav/basic/module/TXCEventRecorderProxy;->a(Ljava/lang/String;IJJLjava/lang/String;I)V

    :cond_4
    :goto_1
    const/16 v8, -0x516

    if-eq v1, v8, :cond_9

    if-eq v1, v7, :cond_9

    const/16 v7, -0x526

    if-eq v1, v7, :cond_9

    const/16 v7, -0x527

    if-ne v1, v7, :cond_5

    goto :goto_3

    :cond_5
    const/16 v7, -0x515

    if-eq v1, v7, :cond_6

    if-eq v1, v6, :cond_6

    const/16 v6, -0x523

    if-eq v1, v6, :cond_6

    const/16 v6, -0x524

    if-ne v1, v6, :cond_8

    :cond_6
    const/16 v6, 0x7533

    .line 475
    invoke-static {v6, v1}, Lcom/tencent/liteav/basic/module/TXCKeyPointReportProxy;->b(II)V

    .line 476
    iget-object v6, v0, Lcom/tencent/liteav/d;->d:Lcom/tencent/liteav/k;

    if-eqz v6, :cond_8

    invoke-virtual {v0}, Lcom/tencent/liteav/basic/module/a;->getID()Ljava/lang/String;

    move-result-object v7

    iget-object v6, v0, Lcom/tencent/liteav/d;->d:Lcom/tencent/liteav/k;

    invoke-interface {v6}, Lcom/tencent/liteav/k;->l()Z

    move-result v6

    if-eqz v6, :cond_7

    move-wide v9, v4

    goto :goto_2

    :cond_7
    move-wide v9, v2

    :goto_2
    int-to-long v11, v1

    const-string v13, ""

    iget v14, v0, Lcom/tencent/liteav/d;->E:I

    const/16 v8, 0xfa2

    invoke-static/range {v7 .. v14}, Lcom/tencent/liteav/basic/module/TXCEventRecorderProxy;->a(Ljava/lang/String;IJJLjava/lang/String;I)V

    :cond_8
    return-void

    :cond_9
    :goto_3
    const/16 v0, 0x7532

    .line 477
    invoke-static {v0, v1}, Lcom/tencent/liteav/basic/module/TXCKeyPointReportProxy;->b(II)V

    return-void
.end method

.method private a(Lcom/tencent/liteav/basic/structs/b;IILjava/lang/Object;J)V
    .locals 9

    .line 499
    const-string v1, "send custom video frame failed."

    iget-object v2, p0, Lcom/tencent/liteav/d;->n:Ljava/lang/Object;

    monitor-enter v2

    .line 500
    :try_start_0
    iget v0, p0, Lcom/tencent/liteav/d;->s:I

    const/4 v3, 0x2

    if-ne v0, v3, :cond_0

    monitor-exit v2

    return-void

    :catchall_0
    move-exception v0

    move-object p0, v0

    goto :goto_2

    .line 501
    :cond_0
    iput p2, p1, Lcom/tencent/liteav/basic/structs/b;->e:I

    .line 502
    iput p3, p1, Lcom/tencent/liteav/basic/structs/b;->f:I

    .line 503
    iget-object v0, p0, Lcom/tencent/liteav/d;->p:Lcom/tencent/liteav/g;

    iget-boolean v3, v0, Lcom/tencent/liteav/g;->S:Z

    iput-boolean v3, p1, Lcom/tencent/liteav/basic/structs/b;->i:Z

    .line 504
    iget v3, v0, Lcom/tencent/liteav/g;->l:I

    if-nez v3, :cond_1

    .line 505
    iget v3, v0, Lcom/tencent/liteav/g;->b:I

    iput v3, p1, Lcom/tencent/liteav/basic/structs/b;->g:I

    .line 506
    iget v0, v0, Lcom/tencent/liteav/g;->a:I

    iput v0, p1, Lcom/tencent/liteav/basic/structs/b;->h:I

    goto :goto_0

    .line 507
    :cond_1
    iget v3, v0, Lcom/tencent/liteav/g;->a:I

    iput v3, p1, Lcom/tencent/liteav/basic/structs/b;->g:I

    .line 508
    iget v0, v0, Lcom/tencent/liteav/g;->b:I

    iput v0, p1, Lcom/tencent/liteav/basic/structs/b;->h:I

    .line 509
    :goto_0
    iget v0, p1, Lcom/tencent/liteav/basic/structs/b;->g:I

    iget v3, p1, Lcom/tencent/liteav/basic/structs/b;->h:I

    invoke-static {p2, p3, v0, v3}, Lcom/tencent/liteav/basic/util/f;->a(IIII)Lcom/tencent/liteav/basic/c/a;

    move-result-object p2

    iput-object p2, p1, Lcom/tencent/liteav/basic/structs/b;->l:Lcom/tencent/liteav/basic/c/a;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 510
    :try_start_1
    iget-object p2, p0, Lcom/tencent/liteav/d;->e:Lcom/tencent/liteav/beauty/d;

    iget-object p3, p0, Lcom/tencent/liteav/d;->p:Lcom/tencent/liteav/g;

    iget p3, p3, Lcom/tencent/liteav/g;->l:I

    invoke-virtual {p2, p3}, Lcom/tencent/liteav/beauty/d;->a(I)V

    .line 511
    iget-object p2, p0, Lcom/tencent/liteav/d;->e:Lcom/tencent/liteav/beauty/d;

    invoke-virtual {p2, p4}, Lcom/tencent/liteav/beauty/d;->a(Ljava/lang/Object;)V

    .line 512
    iget-object v3, p0, Lcom/tencent/liteav/d;->e:Lcom/tencent/liteav/beauty/d;

    iget v5, p1, Lcom/tencent/liteav/basic/structs/b;->b:I

    const/4 v6, 0x0

    move-object v4, p1

    move-wide v7, p5

    invoke-virtual/range {v3 .. v8}, Lcom/tencent/liteav/beauty/d;->a(Lcom/tencent/liteav/basic/structs/b;IIJ)I
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_1

    :catch_0
    move-exception v0

    move-object p0, v0

    .line 513
    :try_start_2
    const-string p1, "TXCCaptureAndEnc"

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p1, p0}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 514
    :goto_1
    monitor-exit v2

    return-void

    :goto_2
    monitor-exit v2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw p0
.end method

.method private a(Lcom/tencent/liteav/basic/structs/b;Z)V
    .locals 12

    .line 581
    iget v0, p1, Lcom/tencent/liteav/basic/structs/b;->e:I

    iget v1, p1, Lcom/tencent/liteav/basic/structs/b;->f:I

    invoke-direct {p0, v0, v1}, Lcom/tencent/liteav/d;->e(II)V

    .line 582
    iput-object p1, p0, Lcom/tencent/liteav/d;->D:Lcom/tencent/liteav/basic/structs/b;

    .line 583
    iget-object v0, p0, Lcom/tencent/liteav/d;->x:Lcom/tencent/rtmp/ui/TXCloudVideoView;

    if-eqz v0, :cond_1

    .line 584
    iget-object p0, p0, Lcom/tencent/liteav/d;->d:Lcom/tencent/liteav/k;

    if-eqz p0, :cond_0

    .line 585
    invoke-interface {p0, p1}, Lcom/tencent/liteav/k;->a(Lcom/tencent/liteav/basic/structs/b;)V

    :cond_0
    return-void

    .line 586
    :cond_1
    iget-object v1, p0, Lcom/tencent/liteav/d;->y:Ljava/lang/Object;

    monitor-enter v1

    .line 587
    :try_start_0
    iget-object v0, p0, Lcom/tencent/liteav/d;->z:Landroid/view/Surface;

    if-eqz v0, :cond_2

    .line 588
    iget-object v0, p0, Lcom/tencent/liteav/d;->C:Lcom/tencent/liteav/basic/c/e;

    if-nez v0, :cond_2

    .line 589
    iget-object v0, p0, Lcom/tencent/liteav/d;->d:Lcom/tencent/liteav/k;

    if-eqz v0, :cond_2

    invoke-interface {v0}, Lcom/tencent/liteav/k;->f()Ljavax/microedition/khronos/egl/EGLContext;

    move-result-object v0

    if-eqz v0, :cond_2

    .line 590
    new-instance v0, Lcom/tencent/liteav/basic/c/e;

    invoke-direct {v0}, Lcom/tencent/liteav/basic/c/e;-><init>()V

    iput-object v0, p0, Lcom/tencent/liteav/d;->C:Lcom/tencent/liteav/basic/c/e;

    .line 591
    iget-object v2, p0, Lcom/tencent/liteav/d;->d:Lcom/tencent/liteav/k;

    invoke-interface {v2}, Lcom/tencent/liteav/k;->f()Ljavax/microedition/khronos/egl/EGLContext;

    move-result-object v2

    iget-object v3, p0, Lcom/tencent/liteav/d;->z:Landroid/view/Surface;

    invoke-virtual {v0, v2, v3}, Lcom/tencent/liteav/basic/c/e;->a(Ljava/lang/Object;Landroid/view/Surface;)V

    .line 592
    iget-object v0, p0, Lcom/tencent/liteav/d;->C:Lcom/tencent/liteav/basic/c/e;

    iget v2, p0, Lcom/tencent/liteav/d;->v:I

    invoke-virtual {v0, v2}, Lcom/tencent/liteav/basic/c/e;->a(I)V

    .line 593
    iget-object v0, p0, Lcom/tencent/liteav/d;->C:Lcom/tencent/liteav/basic/c/e;

    iget v2, p0, Lcom/tencent/liteav/d;->Z:I

    invoke-virtual {v0, v2}, Lcom/tencent/liteav/basic/c/e;->b(I)V

    goto :goto_0

    :catchall_0
    move-exception v0

    move-object p0, v0

    goto :goto_1

    .line 594
    :cond_2
    :goto_0
    iget-object v2, p0, Lcom/tencent/liteav/d;->C:Lcom/tencent/liteav/basic/c/e;

    if-eqz v2, :cond_3

    iget-object v0, p0, Lcom/tencent/liteav/d;->d:Lcom/tencent/liteav/k;

    if-eqz v0, :cond_3

    .line 595
    iget v3, p1, Lcom/tencent/liteav/basic/structs/b;->a:I

    iget-boolean v4, p1, Lcom/tencent/liteav/basic/structs/b;->i:Z

    iget v5, p0, Lcom/tencent/liteav/d;->u:I

    iget v6, p0, Lcom/tencent/liteav/d;->A:I

    iget v7, p0, Lcom/tencent/liteav/d;->B:I

    iget v8, p1, Lcom/tencent/liteav/basic/structs/b;->e:I

    iget v9, p1, Lcom/tencent/liteav/basic/structs/b;->f:I

    invoke-interface {v0}, Lcom/tencent/liteav/k;->l()Z

    move-result v11

    move v10, p2

    invoke-virtual/range {v2 .. v11}, Lcom/tencent/liteav/basic/c/e;->a(IZIIIIIZZ)V

    .line 596
    :cond_3
    monitor-exit v1

    return-void

    :goto_1
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0
.end method

.method public static synthetic a(Lcom/tencent/liteav/d;II)V
    .locals 0

    .line 337
    invoke-direct {p0, p1, p2}, Lcom/tencent/liteav/d;->c(II)V

    return-void
.end method

.method public static synthetic a(Lcom/tencent/liteav/d;IIILjava/lang/Object;IZ)V
    .locals 0

    .line 338
    invoke-direct/range {p0 .. p6}, Lcom/tencent/liteav/d;->a(IIILjava/lang/Object;IZ)V

    return-void
.end method

.method public static synthetic a(Lcom/tencent/liteav/d;Lcom/tencent/liteav/basic/structs/b;Z)V
    .locals 0

    .line 339
    invoke-direct {p0, p1, p2}, Lcom/tencent/liteav/d;->a(Lcom/tencent/liteav/basic/structs/b;Z)V

    return-void
.end method

.method public static synthetic a(Lcom/tencent/liteav/d;Ljava/lang/Object;IZ)V
    .locals 0

    .line 340
    invoke-direct {p0, p1, p2, p3}, Lcom/tencent/liteav/d;->a(Ljava/lang/Object;IZ)V

    return-void
.end method

.method private a(Ljava/lang/Object;IZ)V
    .locals 23

    move-object/from16 v0, p0

    move/from16 v1, p2

    .line 550
    invoke-direct {v0}, Lcom/tencent/liteav/d;->w()V

    .line 551
    new-instance v2, Lcom/tencent/liteav/videoencoder/b;

    invoke-direct {v2, v1}, Lcom/tencent/liteav/videoencoder/b;-><init>(I)V

    .line 552
    invoke-virtual {v0}, Lcom/tencent/liteav/basic/module/a;->getID()Ljava/lang/String;

    move-result-object v3

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    const/16 v5, 0xfa5

    const/4 v6, 0x3

    invoke-static {v3, v5, v6, v4}, Lcom/tencent/liteav/basic/module/TXCStatus;->a(Ljava/lang/String;IILjava/lang/Object;)Z

    const/4 v3, 0x1

    if-ne v1, v3, :cond_0

    .line 553
    invoke-virtual {v0}, Lcom/tencent/liteav/basic/module/a;->getID()Ljava/lang/String;

    move-result-object v7

    const-string v13, ""

    const/4 v14, 0x3

    const/16 v8, 0xfa4

    const-wide/16 v9, 0x1

    const-wide/16 v11, -0x1

    invoke-static/range {v7 .. v14}, Lcom/tencent/liteav/basic/module/TXCEventRecorderProxy;->a(Ljava/lang/String;IJJLjava/lang/String;I)V

    goto :goto_0

    .line 554
    :cond_0
    invoke-virtual {v0}, Lcom/tencent/liteav/basic/module/a;->getID()Ljava/lang/String;

    move-result-object v15

    const-string v21, ""

    const/16 v22, 0x3

    const/16 v16, 0xfa4

    const-wide/16 v17, 0x0

    const-wide/16 v19, -0x1

    invoke-static/range {v15 .. v22}, Lcom/tencent/liteav/basic/module/TXCEventRecorderProxy;->a(Ljava/lang/String;IJJLjava/lang/String;I)V

    .line 555
    :goto_0
    iget-object v3, v0, Lcom/tencent/liteav/d;->l:Lcom/tencent/liteav/videoencoder/TXSVideoEncoderParam;

    if-eqz p1, :cond_1

    move-object/from16 v4, p1

    goto :goto_1

    :cond_1
    iget v4, v3, Lcom/tencent/liteav/videoencoder/TXSVideoEncoderParam;->width:I

    iget v5, v3, Lcom/tencent/liteav/videoencoder/TXSVideoEncoderParam;->height:I

    invoke-virtual {v2, v4, v5}, Lcom/tencent/liteav/videoencoder/b;->a(II)Ljavax/microedition/khronos/egl/EGLContext;

    move-result-object v4

    :goto_1
    iput-object v4, v3, Lcom/tencent/liteav/videoencoder/TXSVideoEncoderParam;->glContext:Ljava/lang/Object;

    .line 556
    iget-object v3, v0, Lcom/tencent/liteav/d;->l:Lcom/tencent/liteav/videoencoder/TXSVideoEncoderParam;

    iput v1, v3, Lcom/tencent/liteav/videoencoder/TXSVideoEncoderParam;->encodeType:I

    move/from16 v1, p3

    .line 557
    iput-boolean v1, v3, Lcom/tencent/liteav/videoencoder/TXSVideoEncoderParam;->realTime:Z

    .line 558
    const-string v1, "TXCCaptureAndEnc"

    const-string v3, "start small video encoder"

    invoke-static {v1, v3}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 559
    invoke-virtual {v2, v0}, Lcom/tencent/liteav/videoencoder/b;->a(Lcom/tencent/liteav/videoencoder/d;)V

    .line 560
    invoke-virtual {v2, v0}, Lcom/tencent/liteav/videoencoder/b;->a(Lcom/tencent/liteav/basic/b/b;)V

    .line 561
    iget-object v1, v0, Lcom/tencent/liteav/d;->l:Lcom/tencent/liteav/videoencoder/TXSVideoEncoderParam;

    invoke-virtual {v2, v1}, Lcom/tencent/liteav/videoencoder/b;->a(Lcom/tencent/liteav/videoencoder/TXSVideoEncoderParam;)I

    .line 562
    iget-object v1, v0, Lcom/tencent/liteav/d;->l:Lcom/tencent/liteav/videoencoder/TXSVideoEncoderParam;

    iget v1, v1, Lcom/tencent/liteav/videoencoder/TXSVideoEncoderParam;->bitrate:I

    invoke-virtual {v2, v1}, Lcom/tencent/liteav/videoencoder/b;->c(I)V

    .line 563
    invoke-virtual {v0}, Lcom/tencent/liteav/basic/module/a;->getID()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v2, v1}, Lcom/tencent/liteav/videoencoder/b;->setID(Ljava/lang/String;)V

    .line 564
    iget v1, v0, Lcom/tencent/liteav/d;->Y:I

    invoke-virtual {v2, v1}, Lcom/tencent/liteav/videoencoder/b;->a(I)V

    .line 565
    iput-object v2, v0, Lcom/tencent/liteav/d;->m:Lcom/tencent/liteav/videoencoder/b;

    .line 566
    invoke-virtual {v0}, Lcom/tencent/liteav/basic/module/a;->getID()Ljava/lang/String;

    move-result-object v1

    iget-object v2, v0, Lcom/tencent/liteav/d;->l:Lcom/tencent/liteav/videoencoder/TXSVideoEncoderParam;

    iget v3, v2, Lcom/tencent/liteav/videoencoder/TXSVideoEncoderParam;->width:I

    shl-int/lit8 v3, v3, 0x10

    iget v2, v2, Lcom/tencent/liteav/videoencoder/TXSVideoEncoderParam;->height:I

    or-int/2addr v2, v3

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const/16 v3, 0xfa3

    invoke-static {v1, v3, v6, v2}, Lcom/tencent/liteav/basic/module/TXCStatus;->a(Ljava/lang/String;IILjava/lang/Object;)Z

    .line 567
    invoke-virtual {v0}, Lcom/tencent/liteav/basic/module/a;->getID()Ljava/lang/String;

    move-result-object v1

    iget-object v0, v0, Lcom/tencent/liteav/d;->l:Lcom/tencent/liteav/videoencoder/TXSVideoEncoderParam;

    iget v0, v0, Lcom/tencent/liteav/videoencoder/TXSVideoEncoderParam;->gop:I

    mul-int/lit16 v0, v0, 0x3e8

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    const/16 v2, 0x32cb

    invoke-static {v1, v2, v6, v0}, Lcom/tencent/liteav/basic/module/TXCStatus;->a(Ljava/lang/String;IILjava/lang/Object;)Z

    return-void
.end method

.method private a(Ljava/lang/Runnable;)V
    .locals 2

    .line 597
    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    move-result-object v0

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    if-eq v0, v1, :cond_0

    .line 598
    iget-object p0, p0, Lcom/tencent/liteav/d;->c:Lcom/tencent/liteav/basic/util/e;

    invoke-virtual {p0, p1}, Lcom/tencent/liteav/basic/util/e;->a(Ljava/lang/Runnable;)Z

    return-void

    .line 599
    :cond_0
    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    return-void
.end method

.method public static synthetic a(Lcom/tencent/liteav/d;[B)[B
    .locals 0

    .line 341
    iput-object p1, p0, Lcom/tencent/liteav/d;->R:[B

    return-object p1
.end method

.method public static synthetic b(Lcom/tencent/liteav/d;I)I
    .locals 0

    .line 119
    iput p1, p0, Lcom/tencent/liteav/d;->A:I

    return p1
.end method

.method public static synthetic b(Lcom/tencent/liteav/d;)Lcom/tencent/liteav/videoencoder/b;
    .locals 0

    .line 93
    iget-object p0, p0, Lcom/tencent/liteav/d;->m:Lcom/tencent/liteav/videoencoder/b;

    return-object p0
.end method

.method private b(IILjava/lang/Object;)V
    .locals 11

    .line 1
    iget-object v0, p0, Lcom/tencent/liteav/d;->p:Lcom/tencent/liteav/g;

    .line 2
    .line 3
    iget v1, v0, Lcom/tencent/liteav/g;->j:I

    .line 4
    .line 5
    const/4 v2, 0x1

    .line 6
    const/4 v3, 0x2

    .line 7
    if-eqz v1, :cond_2

    .line 8
    .line 9
    if-eq v1, v2, :cond_1

    .line 10
    .line 11
    if-eq v1, v3, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    const/4 v3, 0x3

    .line 15
    goto :goto_0

    .line 16
    :cond_1
    move v3, v2

    .line 17
    :cond_2
    :goto_0
    iget v1, p0, Lcom/tencent/liteav/d;->q:I

    .line 18
    .line 19
    if-ne v1, v2, :cond_3

    .line 20
    .line 21
    iget v1, p0, Lcom/tencent/liteav/d;->r:I

    .line 22
    .line 23
    if-nez v1, :cond_3

    .line 24
    .line 25
    move v7, v2

    .line 26
    goto :goto_1

    .line 27
    :cond_3
    move v7, v3

    .line 28
    :goto_1
    iget v1, v0, Lcom/tencent/liteav/g;->i:I

    .line 29
    .line 30
    iget-object v2, p0, Lcom/tencent/liteav/d;->i:Lcom/tencent/liteav/videoencoder/b;

    .line 31
    .line 32
    if-eqz v2, :cond_5

    .line 33
    .line 34
    iget-boolean v2, p0, Lcom/tencent/liteav/d;->T:Z

    .line 35
    .line 36
    if-nez v2, :cond_5

    .line 37
    .line 38
    iget-object v2, p0, Lcom/tencent/liteav/d;->h:Lcom/tencent/liteav/videoencoder/TXSVideoEncoderParam;

    .line 39
    .line 40
    iget v3, v2, Lcom/tencent/liteav/videoencoder/TXSVideoEncoderParam;->width:I

    .line 41
    .line 42
    if-ne v3, p1, :cond_5

    .line 43
    .line 44
    iget v3, v2, Lcom/tencent/liteav/videoencoder/TXSVideoEncoderParam;->height:I

    .line 45
    .line 46
    if-ne v3, p2, :cond_5

    .line 47
    .line 48
    iget v3, v2, Lcom/tencent/liteav/videoencoder/TXSVideoEncoderParam;->encodeType:I

    .line 49
    .line 50
    if-ne v3, v7, :cond_5

    .line 51
    .line 52
    iget v2, v2, Lcom/tencent/liteav/videoencoder/TXSVideoEncoderParam;->gop:I

    .line 53
    .line 54
    if-eq v2, v1, :cond_4

    .line 55
    .line 56
    goto :goto_2

    .line 57
    :cond_4
    move-object v4, p0

    .line 58
    move-object v8, p3

    .line 59
    goto :goto_3

    .line 60
    :cond_5
    :goto_2
    iget v9, v0, Lcom/tencent/liteav/g;->h:I

    .line 61
    .line 62
    iget-boolean v10, v0, Lcom/tencent/liteav/g;->P:Z

    .line 63
    .line 64
    move-object v4, p0

    .line 65
    move v5, p1

    .line 66
    move v6, p2

    .line 67
    move-object v8, p3

    .line 68
    invoke-direct/range {v4 .. v10}, Lcom/tencent/liteav/d;->a(IIILjava/lang/Object;IZ)V

    .line 69
    .line 70
    .line 71
    :goto_3
    iget-object p0, v4, Lcom/tencent/liteav/d;->m:Lcom/tencent/liteav/videoencoder/b;

    .line 72
    .line 73
    if-eqz p0, :cond_6

    .line 74
    .line 75
    iget-object p0, v4, Lcom/tencent/liteav/d;->l:Lcom/tencent/liteav/videoencoder/TXSVideoEncoderParam;

    .line 76
    .line 77
    iget p0, p0, Lcom/tencent/liteav/videoencoder/TXSVideoEncoderParam;->encodeType:I

    .line 78
    .line 79
    if-eq p0, v7, :cond_7

    .line 80
    .line 81
    :cond_6
    iget-boolean p0, v4, Lcom/tencent/liteav/d;->k:Z

    .line 82
    .line 83
    if-eqz p0, :cond_7

    .line 84
    .line 85
    iget-object p0, v4, Lcom/tencent/liteav/d;->p:Lcom/tencent/liteav/g;

    .line 86
    .line 87
    iget-boolean p0, p0, Lcom/tencent/liteav/g;->P:Z

    .line 88
    .line 89
    invoke-direct {v4, v8, v7, p0}, Lcom/tencent/liteav/d;->a(Ljava/lang/Object;IZ)V

    .line 90
    .line 91
    .line 92
    :cond_7
    return-void
.end method

.method private c(Lcom/tencent/liteav/basic/structs/b;)I
    .locals 13

    .line 1
    iget-boolean v0, p0, Lcom/tencent/liteav/d;->L:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget p0, p1, Lcom/tencent/liteav/basic/structs/b;->a:I

    .line 6
    .line 7
    return p0

    .line 8
    :cond_0
    iget v0, p1, Lcom/tencent/liteav/basic/structs/b;->a:I

    .line 9
    .line 10
    iget v1, p0, Lcom/tencent/liteav/d;->Z:I

    .line 11
    .line 12
    const/4 v2, 0x0

    .line 13
    const/4 v3, 0x1

    .line 14
    if-ne v1, v3, :cond_1

    .line 15
    .line 16
    move v1, v3

    .line 17
    goto :goto_0

    .line 18
    :cond_1
    move v1, v2

    .line 19
    :goto_0
    iget-boolean v4, p1, Lcom/tencent/liteav/basic/structs/b;->i:Z

    .line 20
    .line 21
    if-eq v1, v4, :cond_4

    .line 22
    .line 23
    iget-object v1, p0, Lcom/tencent/liteav/d;->O:Lcom/tencent/liteav/basic/c/h;

    .line 24
    .line 25
    if-nez v1, :cond_3

    .line 26
    .line 27
    new-instance v1, Lcom/tencent/liteav/basic/c/h;

    .line 28
    .line 29
    invoke-direct {v1}, Lcom/tencent/liteav/basic/c/h;-><init>()V

    .line 30
    .line 31
    .line 32
    invoke-virtual {v1}, Lcom/tencent/liteav/basic/c/h;->a()Z

    .line 33
    .line 34
    .line 35
    invoke-virtual {v1, v3}, Lcom/tencent/liteav/basic/c/h;->a(Z)V

    .line 36
    .line 37
    .line 38
    iget v4, p1, Lcom/tencent/liteav/basic/structs/b;->e:I

    .line 39
    .line 40
    iget v5, p1, Lcom/tencent/liteav/basic/structs/b;->f:I

    .line 41
    .line 42
    invoke-virtual {v1, v4, v5}, Lcom/tencent/liteav/basic/c/h;->a(II)V

    .line 43
    .line 44
    .line 45
    iget v4, p1, Lcom/tencent/liteav/basic/structs/b;->e:I

    .line 46
    .line 47
    iget v5, p1, Lcom/tencent/liteav/basic/structs/b;->f:I

    .line 48
    .line 49
    if-le v4, v5, :cond_2

    .line 50
    .line 51
    invoke-virtual {v1}, Lcom/tencent/liteav/basic/c/h;->h()V

    .line 52
    .line 53
    .line 54
    goto :goto_1

    .line 55
    :cond_2
    invoke-virtual {v1}, Lcom/tencent/liteav/basic/c/h;->g()V

    .line 56
    .line 57
    .line 58
    :goto_1
    iput-object v1, p0, Lcom/tencent/liteav/d;->O:Lcom/tencent/liteav/basic/c/h;

    .line 59
    .line 60
    :cond_3
    iget-object v1, p0, Lcom/tencent/liteav/d;->O:Lcom/tencent/liteav/basic/c/h;

    .line 61
    .line 62
    if-eqz v1, :cond_4

    .line 63
    .line 64
    iget v0, p1, Lcom/tencent/liteav/basic/structs/b;->e:I

    .line 65
    .line 66
    iget v4, p1, Lcom/tencent/liteav/basic/structs/b;->f:I

    .line 67
    .line 68
    invoke-virtual {v1, v0, v4}, Lcom/tencent/liteav/basic/c/h;->a(II)V

    .line 69
    .line 70
    .line 71
    iget v0, p1, Lcom/tencent/liteav/basic/structs/b;->a:I

    .line 72
    .line 73
    invoke-virtual {v1, v0}, Lcom/tencent/liteav/basic/c/h;->b(I)I

    .line 74
    .line 75
    .line 76
    move-result v0

    .line 77
    :cond_4
    iget v1, p0, Lcom/tencent/liteav/d;->u:I

    .line 78
    .line 79
    if-eqz v1, :cond_a

    .line 80
    .line 81
    iget-object v1, p0, Lcom/tencent/liteav/d;->P:Lcom/tencent/liteav/basic/c/h;

    .line 82
    .line 83
    if-nez v1, :cond_5

    .line 84
    .line 85
    new-instance v1, Lcom/tencent/liteav/basic/c/h;

    .line 86
    .line 87
    invoke-direct {v1}, Lcom/tencent/liteav/basic/c/h;-><init>()V

    .line 88
    .line 89
    .line 90
    invoke-virtual {v1}, Lcom/tencent/liteav/basic/c/h;->a()Z

    .line 91
    .line 92
    .line 93
    invoke-virtual {v1, v3}, Lcom/tencent/liteav/basic/c/h;->a(Z)V

    .line 94
    .line 95
    .line 96
    iget v3, p1, Lcom/tencent/liteav/basic/structs/b;->e:I

    .line 97
    .line 98
    iget v4, p1, Lcom/tencent/liteav/basic/structs/b;->f:I

    .line 99
    .line 100
    invoke-virtual {v1, v3, v4}, Lcom/tencent/liteav/basic/c/h;->a(II)V

    .line 101
    .line 102
    .line 103
    iput-object v1, p0, Lcom/tencent/liteav/d;->P:Lcom/tencent/liteav/basic/c/h;

    .line 104
    .line 105
    :cond_5
    iget-object v5, p0, Lcom/tencent/liteav/d;->P:Lcom/tencent/liteav/basic/c/h;

    .line 106
    .line 107
    if-eqz v5, :cond_a

    .line 108
    .line 109
    iget v1, p1, Lcom/tencent/liteav/basic/structs/b;->e:I

    .line 110
    .line 111
    iget v3, p1, Lcom/tencent/liteav/basic/structs/b;->f:I

    .line 112
    .line 113
    invoke-static {v2, v2, v1, v3}, Landroid/opengl/GLES20;->glViewport(IIII)V

    .line 114
    .line 115
    .line 116
    iget v6, p1, Lcom/tencent/liteav/basic/structs/b;->e:I

    .line 117
    .line 118
    iget v7, p1, Lcom/tencent/liteav/basic/structs/b;->f:I

    .line 119
    .line 120
    invoke-static {v6, v7, v6, v7}, Lcom/tencent/liteav/basic/util/f;->a(IIII)Lcom/tencent/liteav/basic/c/a;

    .line 121
    .line 122
    .line 123
    move-result-object v9

    .line 124
    const/4 v8, 0x0

    .line 125
    const/4 v10, 0x0

    .line 126
    invoke-virtual/range {v5 .. v10}, Lcom/tencent/liteav/basic/c/h;->a(IILjava/nio/FloatBuffer;Lcom/tencent/liteav/basic/c/a;I)[F

    .line 127
    .line 128
    .line 129
    move-result-object v9

    .line 130
    iget p0, p0, Lcom/tencent/liteav/d;->u:I

    .line 131
    .line 132
    rsub-int p0, p0, 0x2d0

    .line 133
    .line 134
    rem-int/lit16 v8, p0, 0x168

    .line 135
    .line 136
    const/16 p0, 0x10e

    .line 137
    .line 138
    const/16 v1, 0x5a

    .line 139
    .line 140
    if-eq v8, v1, :cond_7

    .line 141
    .line 142
    if-ne v8, p0, :cond_6

    .line 143
    .line 144
    goto :goto_2

    .line 145
    :cond_6
    iget v2, p1, Lcom/tencent/liteav/basic/structs/b;->e:I

    .line 146
    .line 147
    goto :goto_3

    .line 148
    :cond_7
    :goto_2
    iget v2, p1, Lcom/tencent/liteav/basic/structs/b;->f:I

    .line 149
    .line 150
    :goto_3
    if-eq v8, v1, :cond_9

    .line 151
    .line 152
    if-ne v8, p0, :cond_8

    .line 153
    .line 154
    goto :goto_4

    .line 155
    :cond_8
    iget p0, p1, Lcom/tencent/liteav/basic/structs/b;->f:I

    .line 156
    .line 157
    goto :goto_5

    .line 158
    :cond_9
    :goto_4
    iget p0, p1, Lcom/tencent/liteav/basic/structs/b;->e:I

    .line 159
    .line 160
    :goto_5
    int-to-float p1, v2

    .line 161
    int-to-float p0, p0

    .line 162
    div-float v10, p1, p0

    .line 163
    .line 164
    const/4 v11, 0x0

    .line 165
    const/4 v12, 0x0

    .line 166
    invoke-virtual/range {v5 .. v12}, Lcom/tencent/liteav/basic/c/h;->a(III[FFZZ)V

    .line 167
    .line 168
    .line 169
    invoke-virtual {v5, v0}, Lcom/tencent/liteav/basic/c/h;->b(I)I

    .line 170
    .line 171
    .line 172
    invoke-virtual {v5}, Lcom/tencent/liteav/basic/c/h;->l()I

    .line 173
    .line 174
    .line 175
    move-result p0

    .line 176
    return p0

    .line 177
    :cond_a
    return v0
.end method

.method public static synthetic c(Lcom/tencent/liteav/d;I)I
    .locals 0

    .line 187
    iput p1, p0, Lcom/tencent/liteav/d;->B:I

    return p1
.end method

.method public static synthetic c(Lcom/tencent/liteav/d;)Lcom/tencent/liteav/videoencoder/TXSVideoEncoderParam;
    .locals 0

    .line 178
    iget-object p0, p0, Lcom/tencent/liteav/d;->h:Lcom/tencent/liteav/videoencoder/TXSVideoEncoderParam;

    return-object p0
.end method

.method private c(II)V
    .locals 3

    .line 183
    iget-object v0, p0, Lcom/tencent/liteav/d;->p:Lcom/tencent/liteav/g;

    iget v1, v0, Lcom/tencent/liteav/g;->J:F

    const/high16 v2, -0x40800000    # -1.0f

    cmpl-float v2, v1, v2

    .line 184
    iget-object p0, p0, Lcom/tencent/liteav/d;->e:Lcom/tencent/liteav/beauty/d;

    if-eqz v2, :cond_0

    if-eqz p0, :cond_2

    .line 185
    iget-object p1, v0, Lcom/tencent/liteav/g;->E:Landroid/graphics/Bitmap;

    iget p2, v0, Lcom/tencent/liteav/g;->H:F

    iget v0, v0, Lcom/tencent/liteav/g;->I:F

    invoke-virtual {p0, p1, p2, v0, v1}, Lcom/tencent/liteav/beauty/d;->a(Landroid/graphics/Bitmap;FFF)V

    return-void

    :cond_0
    if-eqz p0, :cond_2

    if-eqz p1, :cond_2

    if-eqz p2, :cond_2

    .line 186
    iget-object v1, v0, Lcom/tencent/liteav/g;->E:Landroid/graphics/Bitmap;

    iget v2, v0, Lcom/tencent/liteav/g;->F:I

    int-to-float v2, v2

    int-to-float p1, p1

    div-float/2addr v2, p1

    iget v0, v0, Lcom/tencent/liteav/g;->G:I

    int-to-float v0, v0

    int-to-float p2, p2

    div-float/2addr v0, p2

    if-nez v1, :cond_1

    const/4 p1, 0x0

    goto :goto_0

    :cond_1
    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result p2

    int-to-float p2, p2

    div-float p1, p2, p1

    :goto_0
    invoke-virtual {p0, v1, v2, v0, p1}, Lcom/tencent/liteav/beauty/d;->a(Landroid/graphics/Bitmap;FFF)V

    :cond_2
    return-void
.end method

.method public static synthetic d(Lcom/tencent/liteav/d;)Lcom/tencent/liteav/g;
    .locals 0

    .line 264
    iget-object p0, p0, Lcom/tencent/liteav/d;->p:Lcom/tencent/liteav/g;

    return-object p0
.end method

.method private d(II)V
    .locals 0

    .line 263
    invoke-direct {p0, p1, p2}, Lcom/tencent/liteav/d;->c(II)V

    return-void
.end method

.method private d(Lcom/tencent/liteav/basic/structs/b;)V
    .locals 10

    .line 1
    iget-object v0, p0, Lcom/tencent/liteav/d;->K:Ljava/lang/ref/WeakReference;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    goto/16 :goto_4

    .line 6
    .line 7
    :cond_0
    invoke-direct {p0, p1}, Lcom/tencent/liteav/d;->c(Lcom/tencent/liteav/basic/structs/b;)I

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    iget v2, p0, Lcom/tencent/liteav/d;->J:I

    .line 12
    .line 13
    const/4 v3, 0x2

    .line 14
    if-ne v2, v3, :cond_1

    .line 15
    .line 16
    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    check-cast v0, Lcom/tencent/liteav/o;

    .line 21
    .line 22
    if-eqz v0, :cond_c

    .line 23
    .line 24
    new-instance v2, Lcom/tencent/liteav/basic/structs/TXSVideoFrame;

    .line 25
    .line 26
    invoke-direct {v2}, Lcom/tencent/liteav/basic/structs/TXSVideoFrame;-><init>()V

    .line 27
    .line 28
    .line 29
    iget v3, p1, Lcom/tencent/liteav/basic/structs/b;->e:I

    .line 30
    .line 31
    iput v3, v2, Lcom/tencent/liteav/basic/structs/TXSVideoFrame;->width:I

    .line 32
    .line 33
    iget v3, p1, Lcom/tencent/liteav/basic/structs/b;->f:I

    .line 34
    .line 35
    iput v3, v2, Lcom/tencent/liteav/basic/structs/TXSVideoFrame;->height:I

    .line 36
    .line 37
    iput v1, v2, Lcom/tencent/liteav/basic/structs/TXSVideoFrame;->textureId:I

    .line 38
    .line 39
    iget-object v1, p0, Lcom/tencent/liteav/d;->e:Lcom/tencent/liteav/beauty/d;

    .line 40
    .line 41
    invoke-virtual {v1}, Lcom/tencent/liteav/beauty/d;->a()Ljava/lang/Object;

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    iput-object v1, v2, Lcom/tencent/liteav/basic/structs/TXSVideoFrame;->eglContext:Ljava/lang/Object;

    .line 46
    .line 47
    invoke-static {}, Lcom/tencent/liteav/basic/util/TXCTimeUtil;->generatePtsMS()J

    .line 48
    .line 49
    .line 50
    move-result-wide v3

    .line 51
    iput-wide v3, v2, Lcom/tencent/liteav/basic/structs/TXSVideoFrame;->pts:J

    .line 52
    .line 53
    invoke-virtual {p0}, Lcom/tencent/liteav/basic/module/a;->getID()Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object v1

    .line 57
    iget v3, p0, Lcom/tencent/liteav/d;->E:I

    .line 58
    .line 59
    invoke-interface {v0, v1, v3, v2}, Lcom/tencent/liteav/o;->onRenderVideoFrame(Ljava/lang/String;ILcom/tencent/liteav/basic/structs/TXSVideoFrame;)V

    .line 60
    .line 61
    .line 62
    iget-boolean v0, p0, Lcom/tencent/liteav/d;->L:Z

    .line 63
    .line 64
    if-eqz v0, :cond_c

    .line 65
    .line 66
    iget v0, v2, Lcom/tencent/liteav/basic/structs/TXSVideoFrame;->textureId:I

    .line 67
    .line 68
    iput v0, p1, Lcom/tencent/liteav/basic/structs/b;->a:I

    .line 69
    .line 70
    goto/16 :goto_3

    .line 71
    .line 72
    :cond_1
    const/4 v3, 0x4

    .line 73
    const/4 v4, 0x1

    .line 74
    if-eq v2, v4, :cond_2

    .line 75
    .line 76
    if-ne v2, v3, :cond_c

    .line 77
    .line 78
    :cond_2
    iget-object v5, p0, Lcom/tencent/liteav/d;->N:Lcom/tencent/liteav/basic/c/h;

    .line 79
    .line 80
    const/4 v6, 0x0

    .line 81
    const-string v7, "TXCCaptureAndEnc"

    .line 82
    .line 83
    const/4 v8, 0x3

    .line 84
    if-nez v5, :cond_5

    .line 85
    .line 86
    if-ne v2, v4, :cond_3

    .line 87
    .line 88
    new-instance v2, Lcom/tencent/liteav/beauty/b/p;

    .line 89
    .line 90
    invoke-direct {v2, v4}, Lcom/tencent/liteav/beauty/b/p;-><init>(I)V

    .line 91
    .line 92
    .line 93
    goto :goto_0

    .line 94
    :cond_3
    new-instance v2, Lcom/tencent/liteav/beauty/b/p;

    .line 95
    .line 96
    invoke-direct {v2, v8}, Lcom/tencent/liteav/beauty/b/p;-><init>(I)V

    .line 97
    .line 98
    .line 99
    :goto_0
    invoke-virtual {v2, v4}, Lcom/tencent/liteav/basic/c/h;->a(Z)V

    .line 100
    .line 101
    .line 102
    invoke-virtual {v2}, Lcom/tencent/liteav/basic/c/h;->a()Z

    .line 103
    .line 104
    .line 105
    move-result v5

    .line 106
    if-eqz v5, :cond_4

    .line 107
    .line 108
    iget v5, p1, Lcom/tencent/liteav/basic/structs/b;->e:I

    .line 109
    .line 110
    iget v9, p1, Lcom/tencent/liteav/basic/structs/b;->f:I

    .line 111
    .line 112
    invoke-virtual {v2, v5, v9}, Lcom/tencent/liteav/basic/c/h;->a(II)V

    .line 113
    .line 114
    .line 115
    new-instance v5, Lcom/tencent/liteav/d$16;

    .line 116
    .line 117
    invoke-direct {v5, p0, v0}, Lcom/tencent/liteav/d$16;-><init>(Lcom/tencent/liteav/d;Ljava/lang/ref/WeakReference;)V

    .line 118
    .line 119
    .line 120
    invoke-virtual {v2, v5}, Lcom/tencent/liteav/basic/c/h;->a(Lcom/tencent/liteav/basic/c/h$a;)V

    .line 121
    .line 122
    .line 123
    iput-object v2, p0, Lcom/tencent/liteav/d;->N:Lcom/tencent/liteav/basic/c/h;

    .line 124
    .line 125
    goto :goto_1

    .line 126
    :cond_4
    const-string v0, "init filter error "

    .line 127
    .line 128
    invoke-static {v7, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 129
    .line 130
    .line 131
    iput-object v6, p0, Lcom/tencent/liteav/d;->N:Lcom/tencent/liteav/basic/c/h;

    .line 132
    .line 133
    :cond_5
    :goto_1
    iget-object v0, p0, Lcom/tencent/liteav/d;->N:Lcom/tencent/liteav/basic/c/h;

    .line 134
    .line 135
    const/4 v2, 0x0

    .line 136
    if-eqz v0, :cond_6

    .line 137
    .line 138
    iget v5, p1, Lcom/tencent/liteav/basic/structs/b;->e:I

    .line 139
    .line 140
    iget v9, p1, Lcom/tencent/liteav/basic/structs/b;->f:I

    .line 141
    .line 142
    invoke-static {v2, v2, v5, v9}, Landroid/opengl/GLES20;->glViewport(IIII)V

    .line 143
    .line 144
    .line 145
    iget v5, p1, Lcom/tencent/liteav/basic/structs/b;->e:I

    .line 146
    .line 147
    iget v9, p1, Lcom/tencent/liteav/basic/structs/b;->f:I

    .line 148
    .line 149
    invoke-virtual {v0, v5, v9}, Lcom/tencent/liteav/basic/c/h;->a(II)V

    .line 150
    .line 151
    .line 152
    invoke-virtual {v0, v1}, Lcom/tencent/liteav/basic/c/h;->b(I)I

    .line 153
    .line 154
    .line 155
    :cond_6
    iget-boolean v0, p0, Lcom/tencent/liteav/d;->L:Z

    .line 156
    .line 157
    if-eqz v0, :cond_c

    .line 158
    .line 159
    iget-object v0, p0, Lcom/tencent/liteav/d;->R:[B

    .line 160
    .line 161
    if-eqz v0, :cond_c

    .line 162
    .line 163
    iget v0, p0, Lcom/tencent/liteav/d;->J:I

    .line 164
    .line 165
    if-ne v0, v4, :cond_8

    .line 166
    .line 167
    :cond_7
    move v8, v4

    .line 168
    goto :goto_2

    .line 169
    :cond_8
    if-ne v0, v3, :cond_7

    .line 170
    .line 171
    :goto_2
    iget-object v0, p0, Lcom/tencent/liteav/d;->Q:Lcom/tencent/liteav/beauty/b/k;

    .line 172
    .line 173
    if-nez v0, :cond_a

    .line 174
    .line 175
    new-instance v0, Lcom/tencent/liteav/beauty/b/k;

    .line 176
    .line 177
    invoke-direct {v0, v8}, Lcom/tencent/liteav/beauty/b/k;-><init>(I)V

    .line 178
    .line 179
    .line 180
    invoke-virtual {v0, v4}, Lcom/tencent/liteav/basic/c/h;->a(Z)V

    .line 181
    .line 182
    .line 183
    invoke-virtual {v0}, Lcom/tencent/liteav/beauty/b/k;->a()Z

    .line 184
    .line 185
    .line 186
    move-result v1

    .line 187
    if-nez v1, :cond_9

    .line 188
    .line 189
    const-string v1, " init i420ToRGBA filter failed"

    .line 190
    .line 191
    invoke-static {v7, v1}, Lcom/tencent/liteav/basic/log/TXCLog;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 192
    .line 193
    .line 194
    :cond_9
    iget v1, p1, Lcom/tencent/liteav/basic/structs/b;->e:I

    .line 195
    .line 196
    iget v3, p1, Lcom/tencent/liteav/basic/structs/b;->f:I

    .line 197
    .line 198
    invoke-virtual {v0, v1, v3}, Lcom/tencent/liteav/beauty/b/k;->a(II)V

    .line 199
    .line 200
    .line 201
    iput-object v0, p0, Lcom/tencent/liteav/d;->Q:Lcom/tencent/liteav/beauty/b/k;

    .line 202
    .line 203
    :cond_a
    iget-object v0, p0, Lcom/tencent/liteav/d;->Q:Lcom/tencent/liteav/beauty/b/k;

    .line 204
    .line 205
    if-eqz v0, :cond_b

    .line 206
    .line 207
    iget v1, p1, Lcom/tencent/liteav/basic/structs/b;->e:I

    .line 208
    .line 209
    iget v3, p1, Lcom/tencent/liteav/basic/structs/b;->f:I

    .line 210
    .line 211
    invoke-static {v2, v2, v1, v3}, Landroid/opengl/GLES20;->glViewport(IIII)V

    .line 212
    .line 213
    .line 214
    iget v1, p1, Lcom/tencent/liteav/basic/structs/b;->e:I

    .line 215
    .line 216
    iget v2, p1, Lcom/tencent/liteav/basic/structs/b;->f:I

    .line 217
    .line 218
    invoke-virtual {v0, v1, v2}, Lcom/tencent/liteav/beauty/b/k;->a(II)V

    .line 219
    .line 220
    .line 221
    iget-object v1, p0, Lcom/tencent/liteav/d;->R:[B

    .line 222
    .line 223
    invoke-virtual {v0, v1}, Lcom/tencent/liteav/beauty/b/k;->a([B)V

    .line 224
    .line 225
    .line 226
    invoke-virtual {v0}, Lcom/tencent/liteav/beauty/b/k;->q()I

    .line 227
    .line 228
    .line 229
    move-result v0

    .line 230
    iput v0, p1, Lcom/tencent/liteav/basic/structs/b;->a:I

    .line 231
    .line 232
    :cond_b
    iput-object v6, p0, Lcom/tencent/liteav/d;->R:[B

    .line 233
    .line 234
    :cond_c
    :goto_3
    iget-boolean p1, p0, Lcom/tencent/liteav/d;->L:Z

    .line 235
    .line 236
    if-eqz p1, :cond_d

    .line 237
    .line 238
    iget-object p0, p0, Lcom/tencent/liteav/d;->x:Lcom/tencent/rtmp/ui/TXCloudVideoView;

    .line 239
    .line 240
    if-eqz p0, :cond_d

    .line 241
    .line 242
    invoke-virtual {p0}, Lcom/tencent/rtmp/ui/TXCloudVideoView;->getGLSurfaceView()Lcom/tencent/liteav/renderer/TXCGLSurfaceView;

    .line 243
    .line 244
    .line 245
    move-result-object p0

    .line 246
    if-eqz p0, :cond_d

    .line 247
    .line 248
    invoke-virtual {p0}, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase;->d()Z

    .line 249
    .line 250
    .line 251
    :cond_d
    :goto_4
    return-void
.end method

.method public static synthetic e(Lcom/tencent/liteav/d;)Lcom/tencent/liteav/k;
    .locals 0

    .line 114
    iget-object p0, p0, Lcom/tencent/liteav/d;->d:Lcom/tencent/liteav/k;

    return-object p0
.end method

.method private e(II)V
    .locals 5

    .line 1
    iget-boolean v0, p0, Lcom/tencent/liteav/d;->w:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Landroid/os/Bundle;

    .line 6
    .line 7
    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 8
    .line 9
    .line 10
    const-string v1, "EVT_USERID"

    .line 11
    .line 12
    invoke-virtual {p0}, Lcom/tencent/liteav/basic/module/a;->getID()Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v2

    .line 16
    invoke-virtual {v0, v1, v2}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    const-string v1, "EVT_ID"

    .line 20
    .line 21
    const/16 v2, 0x7d3

    .line 22
    .line 23
    invoke-virtual {v0, v1, v2}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    .line 24
    .line 25
    .line 26
    const-string v1, "EVT_TIME"

    .line 27
    .line 28
    invoke-static {}, Lcom/tencent/liteav/basic/util/TXCTimeUtil;->getTimeTick()J

    .line 29
    .line 30
    .line 31
    move-result-wide v3

    .line 32
    invoke-virtual {v0, v1, v3, v4}, Landroid/os/BaseBundle;->putLong(Ljava/lang/String;J)V

    .line 33
    .line 34
    .line 35
    const-string v1, "EVT_MSG"

    .line 36
    .line 37
    const-string v3, "Renders the first video frame"

    .line 38
    .line 39
    invoke-virtual {v0, v1, v3}, Landroid/os/Bundle;->putCharSequence(Ljava/lang/String;Ljava/lang/CharSequence;)V

    .line 40
    .line 41
    .line 42
    const-string v1, "EVT_PARAM1"

    .line 43
    .line 44
    invoke-virtual {v0, v1, p1}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    .line 45
    .line 46
    .line 47
    const-string p1, "EVT_PARAM2"

    .line 48
    .line 49
    invoke-virtual {v0, p1, p2}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    .line 50
    .line 51
    .line 52
    iget-object p1, p0, Lcom/tencent/liteav/d;->W:Ljava/lang/ref/WeakReference;

    .line 53
    .line 54
    invoke-static {p1, v2, v0}, Lcom/tencent/liteav/basic/util/f;->a(Ljava/lang/ref/WeakReference;ILandroid/os/Bundle;)V

    .line 55
    .line 56
    .line 57
    new-instance p1, Ljava/lang/StringBuilder;

    .line 58
    .line 59
    const-string p2, "trtc_render render first frame "

    .line 60
    .line 61
    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 62
    .line 63
    .line 64
    invoke-virtual {p0}, Lcom/tencent/liteav/basic/module/a;->getID()Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object p2

    .line 68
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 69
    .line 70
    .line 71
    const-string p2, ", "

    .line 72
    .line 73
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 74
    .line 75
    .line 76
    iget p2, p0, Lcom/tencent/liteav/d;->E:I

    .line 77
    .line 78
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 79
    .line 80
    .line 81
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 82
    .line 83
    .line 84
    move-result-object p1

    .line 85
    const-string p2, "TXCCaptureAndEnc"

    .line 86
    .line 87
    invoke-static {p2, p1}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 88
    .line 89
    .line 90
    const/4 p1, 0x1

    .line 91
    iput-boolean p1, p0, Lcom/tencent/liteav/d;->w:Z

    .line 92
    .line 93
    :cond_0
    return-void
.end method

.method public static synthetic f(Lcom/tencent/liteav/d;)V
    .locals 0

    .line 79
    invoke-direct {p0}, Lcom/tencent/liteav/d;->x()V

    return-void
.end method

.method public static synthetic g(Lcom/tencent/liteav/d;)Lcom/tencent/liteav/videoencoder/TXSVideoEncoderParam;
    .locals 0

    .line 68
    iget-object p0, p0, Lcom/tencent/liteav/d;->l:Lcom/tencent/liteav/videoencoder/TXSVideoEncoderParam;

    return-object p0
.end method

.method public static synthetic h(Lcom/tencent/liteav/d;)V
    .locals 0

    .line 13
    invoke-direct {p0}, Lcom/tencent/liteav/d;->w()V

    return-void
.end method

.method public static synthetic i(Lcom/tencent/liteav/d;)I
    .locals 0

    .line 88
    iget p0, p0, Lcom/tencent/liteav/d;->Y:I

    return p0
.end method

.method private i(Z)V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/tencent/liteav/d;->d:Lcom/tencent/liteav/k;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    goto :goto_1

    .line 6
    :cond_0
    new-instance v1, Lcom/tencent/liteav/d$7;

    .line 7
    .line 8
    invoke-direct {v1, p0}, Lcom/tencent/liteav/d$7;-><init>(Lcom/tencent/liteav/d;)V

    .line 9
    .line 10
    .line 11
    invoke-interface {v0, v1}, Lcom/tencent/liteav/k;->a(Ljava/lang/Runnable;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0}, Lcom/tencent/liteav/d;->r()V

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Lcom/tencent/liteav/d;->d:Lcom/tencent/liteav/k;

    .line 18
    .line 19
    invoke-interface {v0, p1}, Lcom/tencent/liteav/k;->a(Z)V

    .line 20
    .line 21
    .line 22
    const/4 v0, 0x0

    .line 23
    iput-object v0, p0, Lcom/tencent/liteav/d;->d:Lcom/tencent/liteav/k;

    .line 24
    .line 25
    const-string v1, "TXCCaptureAndEnc"

    .line 26
    .line 27
    const-string v2, "stopped CaptureSource"

    .line 28
    .line 29
    invoke-static {v1, v2}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    iget-object v1, p0, Lcom/tencent/liteav/d;->x:Lcom/tencent/rtmp/ui/TXCloudVideoView;

    .line 33
    .line 34
    iget-object v2, p0, Lcom/tencent/liteav/d;->c:Lcom/tencent/liteav/basic/util/e;

    .line 35
    .line 36
    new-instance v3, Lcom/tencent/liteav/d$8;

    .line 37
    .line 38
    invoke-direct {v3, p0, v1, p1}, Lcom/tencent/liteav/d$8;-><init>(Lcom/tencent/liteav/d;Lcom/tencent/rtmp/ui/TXCloudVideoView;Z)V

    .line 39
    .line 40
    .line 41
    invoke-virtual {v2, v3}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 42
    .line 43
    .line 44
    iput-object v0, p0, Lcom/tencent/liteav/d;->x:Lcom/tencent/rtmp/ui/TXCloudVideoView;

    .line 45
    .line 46
    iget-object p1, p0, Lcom/tencent/liteav/d;->y:Ljava/lang/Object;

    .line 47
    .line 48
    monitor-enter p1

    .line 49
    :try_start_0
    iput-object v0, p0, Lcom/tencent/liteav/d;->z:Landroid/view/Surface;

    .line 50
    .line 51
    iget-object v1, p0, Lcom/tencent/liteav/d;->C:Lcom/tencent/liteav/basic/c/e;

    .line 52
    .line 53
    if-eqz v1, :cond_1

    .line 54
    .line 55
    invoke-virtual {v1}, Lcom/tencent/liteav/basic/c/e;->a()V

    .line 56
    .line 57
    .line 58
    iput-object v0, p0, Lcom/tencent/liteav/d;->C:Lcom/tencent/liteav/basic/c/e;

    .line 59
    .line 60
    goto :goto_0

    .line 61
    :catchall_0
    move-exception p0

    .line 62
    goto :goto_2

    .line 63
    :cond_1
    :goto_0
    monitor-exit p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 64
    iget-object p1, p0, Lcom/tencent/liteav/d;->a:Lcom/tencent/liteav/b;

    .line 65
    .line 66
    invoke-virtual {p1}, Lcom/tencent/liteav/b;->a()Z

    .line 67
    .line 68
    .line 69
    move-result p1

    .line 70
    if-eqz p1, :cond_2

    .line 71
    .line 72
    iget-object p1, p0, Lcom/tencent/liteav/d;->a:Lcom/tencent/liteav/b;

    .line 73
    .line 74
    invoke-virtual {p1}, Lcom/tencent/liteav/b;->b()V

    .line 75
    .line 76
    .line 77
    :cond_2
    iget-boolean p1, p0, Lcom/tencent/liteav/d;->t:Z

    .line 78
    .line 79
    if-eqz p1, :cond_3

    .line 80
    .line 81
    invoke-direct {p0}, Lcom/tencent/liteav/d;->u()V

    .line 82
    .line 83
    .line 84
    :cond_3
    :goto_1
    return-void

    .line 85
    :goto_2
    :try_start_1
    monitor-exit p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 86
    throw p0
.end method

.method public static synthetic j(Lcom/tencent/liteav/d;)Lcom/tencent/liteav/basic/structs/b;
    .locals 0

    .line 22
    iget-object p0, p0, Lcom/tencent/liteav/d;->D:Lcom/tencent/liteav/basic/structs/b;

    return-object p0
.end method

.method private j(Z)V
    .locals 2

    .line 23
    iget-object v0, p0, Lcom/tencent/liteav/d;->d:Lcom/tencent/liteav/k;

    if-eqz v0, :cond_0

    .line 24
    new-instance v1, Lcom/tencent/liteav/d$14;

    invoke-direct {v1, p0, p1}, Lcom/tencent/liteav/d$14;-><init>(Lcom/tencent/liteav/d;Z)V

    invoke-interface {v0, v1}, Lcom/tencent/liteav/k;->a(Ljava/lang/Runnable;)V

    :cond_0
    return-void
.end method

.method public static synthetic k(Lcom/tencent/liteav/d;)Lcom/tencent/liteav/basic/c/e;
    .locals 0

    .line 51
    iget-object p0, p0, Lcom/tencent/liteav/d;->C:Lcom/tencent/liteav/basic/c/e;

    return-object p0
.end method

.method public static synthetic l(Lcom/tencent/liteav/d;)Lcom/tencent/liteav/beauty/d;
    .locals 0

    .line 12
    iget-object p0, p0, Lcom/tencent/liteav/d;->e:Lcom/tencent/liteav/beauty/d;

    return-object p0
.end method

.method public static synthetic m(Lcom/tencent/liteav/d;)I
    .locals 0

    .line 28
    iget p0, p0, Lcom/tencent/liteav/d;->s:I

    return p0
.end method

.method public static synthetic n(Lcom/tencent/liteav/d;)Z
    .locals 0

    .line 12
    iget-boolean p0, p0, Lcom/tencent/liteav/d;->t:Z

    return p0
.end method

.method public static synthetic o(Lcom/tencent/liteav/d;)Z
    .locals 0

    .line 12
    iget-boolean p0, p0, Lcom/tencent/liteav/d;->T:Z

    return p0
.end method

.method public static synthetic p(Lcom/tencent/liteav/d;)Z
    .locals 0

    .line 52
    iget-boolean p0, p0, Lcom/tencent/liteav/d;->k:Z

    return p0
.end method

.method public static synthetic q(Lcom/tencent/liteav/d;)Lcom/tencent/liteav/basic/c/h;
    .locals 0

    .line 74
    iget-object p0, p0, Lcom/tencent/liteav/d;->N:Lcom/tencent/liteav/basic/c/h;

    return-object p0
.end method

.method public static synthetic r(Lcom/tencent/liteav/d;)I
    .locals 0

    .line 25
    iget p0, p0, Lcom/tencent/liteav/d;->E:I

    return p0
.end method

.method private u()V
    .locals 7

    .line 1
    const-string v0, "TXCCaptureAndEnc"

    .line 2
    .line 3
    const-string v1, " startBlackStream"

    .line 4
    .line 5
    invoke-static {v0, v1}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/tencent/liteav/d;->b:Lcom/tencent/liteav/b;

    .line 9
    .line 10
    if-nez v0, :cond_0

    .line 11
    .line 12
    new-instance v0, Lcom/tencent/liteav/b;

    .line 13
    .line 14
    invoke-direct {v0, p0}, Lcom/tencent/liteav/b;-><init>(Lcom/tencent/liteav/b$b;)V

    .line 15
    .line 16
    .line 17
    iput-object v0, p0, Lcom/tencent/liteav/d;->b:Lcom/tencent/liteav/b;

    .line 18
    .line 19
    :cond_0
    iget-object v1, p0, Lcom/tencent/liteav/d;->b:Lcom/tencent/liteav/b;

    .line 20
    .line 21
    const/16 v5, 0x40

    .line 22
    .line 23
    const/16 v6, 0x40

    .line 24
    .line 25
    const/16 v2, 0xa

    .line 26
    .line 27
    const/4 v3, -0x1

    .line 28
    const/4 v4, 0x0

    .line 29
    invoke-virtual/range {v1 .. v6}, Lcom/tencent/liteav/b;->a(IILandroid/graphics/Bitmap;II)V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method private v()V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, " stopBlackStream when enableBlackStream "

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-boolean v1, p0, Lcom/tencent/liteav/d;->t:Z

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    const-string v1, "TXCCaptureAndEnc"

    .line 18
    .line 19
    invoke-static {v1, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    iget-object p0, p0, Lcom/tencent/liteav/d;->b:Lcom/tencent/liteav/b;

    .line 23
    .line 24
    if-eqz p0, :cond_0

    .line 25
    .line 26
    invoke-virtual {p0}, Lcom/tencent/liteav/b;->b()V

    .line 27
    .line 28
    .line 29
    :cond_0
    return-void
.end method

.method private w()V
    .locals 2

    .line 1
    :try_start_0
    iget-object v0, p0, Lcom/tencent/liteav/d;->m:Lcom/tencent/liteav/videoencoder/b;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    iput-object v1, p0, Lcom/tencent/liteav/d;->m:Lcom/tencent/liteav/videoencoder/b;

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    invoke-virtual {v0}, Lcom/tencent/liteav/videoencoder/b;->a()V

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0, v1}, Lcom/tencent/liteav/videoencoder/b;->a(Lcom/tencent/liteav/videoencoder/d;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void

    .line 15
    :catch_0
    move-exception p0

    .line 16
    const-string v0, "TXCCaptureAndEnc"

    .line 17
    .line 18
    const-string v1, "stop video encoder failed."

    .line 19
    .line 20
    invoke-static {v0, v1, p0}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method private x()V
    .locals 3

    .line 1
    const-string v0, "TXCCaptureAndEnc"

    .line 2
    .line 3
    :try_start_0
    const-string v1, "stopBigVideoEncoderInGLThread"

    .line 4
    .line 5
    invoke-static {v0, v1}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v1, p0, Lcom/tencent/liteav/d;->i:Lcom/tencent/liteav/videoencoder/b;

    .line 9
    .line 10
    const/4 v2, 0x0

    .line 11
    iput-object v2, p0, Lcom/tencent/liteav/d;->i:Lcom/tencent/liteav/videoencoder/b;

    .line 12
    .line 13
    if-eqz v1, :cond_0

    .line 14
    .line 15
    invoke-virtual {v1}, Lcom/tencent/liteav/videoencoder/b;->a()V

    .line 16
    .line 17
    .line 18
    invoke-virtual {v1, v2}, Lcom/tencent/liteav/videoencoder/b;->a(Lcom/tencent/liteav/videoencoder/d;)V

    .line 19
    .line 20
    .line 21
    goto :goto_0

    .line 22
    :catch_0
    move-exception p0

    .line 23
    goto :goto_1

    .line 24
    :cond_0
    :goto_0
    const/4 v1, 0x1

    .line 25
    iput-boolean v1, p0, Lcom/tencent/liteav/d;->T:Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 26
    .line 27
    return-void

    .line 28
    :goto_1
    const-string v1, "stopBigVideoEncoder failed."

    .line 29
    .line 30
    invoke-static {v0, v1, p0}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method private y()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/tencent/liteav/d;->d:Lcom/tencent/liteav/k;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    new-instance v1, Lcom/tencent/liteav/d$15;

    .line 6
    .line 7
    invoke-direct {v1, p0}, Lcom/tencent/liteav/d$15;-><init>(Lcom/tencent/liteav/d;)V

    .line 8
    .line 9
    .line 10
    invoke-interface {v0, v1}, Lcom/tencent/liteav/k;->a(Ljava/lang/Runnable;)V

    .line 11
    .line 12
    .line 13
    :cond_0
    return-void
.end method

.method private z()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/tencent/liteav/d;->e:Lcom/tencent/liteav/beauty/d;

    .line 2
    .line 3
    if-eqz v0, :cond_2

    .line 4
    .line 5
    iget-object p0, p0, Lcom/tencent/liteav/d;->p:Lcom/tencent/liteav/g;

    .line 6
    .line 7
    iget-boolean v1, p0, Lcom/tencent/liteav/g;->U:Z

    .line 8
    .line 9
    if-eqz v1, :cond_0

    .line 10
    .line 11
    sget-object p0, Lcom/tencent/liteav/beauty/d$d;->a:Lcom/tencent/liteav/beauty/d$d;

    .line 12
    .line 13
    invoke-virtual {v0, p0}, Lcom/tencent/liteav/beauty/d;->a(Lcom/tencent/liteav/beauty/d$d;)V

    .line 14
    .line 15
    .line 16
    return-void

    .line 17
    :cond_0
    iget-boolean p0, p0, Lcom/tencent/liteav/g;->T:Z

    .line 18
    .line 19
    if-eqz p0, :cond_1

    .line 20
    .line 21
    sget-object p0, Lcom/tencent/liteav/beauty/d$d;->b:Lcom/tencent/liteav/beauty/d$d;

    .line 22
    .line 23
    invoke-virtual {v0, p0}, Lcom/tencent/liteav/beauty/d;->a(Lcom/tencent/liteav/beauty/d$d;)V

    .line 24
    .line 25
    .line 26
    return-void

    .line 27
    :cond_1
    sget-object p0, Lcom/tencent/liteav/beauty/d$d;->c:Lcom/tencent/liteav/beauty/d$d;

    .line 28
    .line 29
    invoke-virtual {v0, p0}, Lcom/tencent/liteav/beauty/d;->a(Lcom/tencent/liteav/beauty/d$d;)V

    .line 30
    .line 31
    .line 32
    :cond_2
    return-void
.end method


# virtual methods
.method public a(IIILjava/lang/Object;J)I
    .locals 6

    .line 483
    iget-object v1, p0, Lcom/tencent/liteav/d;->n:Ljava/lang/Object;

    monitor-enter v1

    .line 484
    :try_start_0
    iget v0, p0, Lcom/tencent/liteav/d;->s:I

    const/4 v2, 0x2

    const/4 v3, 0x0

    if-ne v0, v2, :cond_0

    monitor-exit v1

    return v3

    :catchall_0
    move-exception v0

    move-object p0, v0

    goto :goto_0

    .line 485
    :cond_0
    invoke-direct {p0, p2, p3, p4}, Lcom/tencent/liteav/d;->a(IILjava/lang/Object;)I

    move-result p4

    if-eqz p4, :cond_1

    .line 486
    monitor-exit v1

    return p4

    :cond_1
    const-wide/16 v4, 0x0

    cmp-long p4, p5, v4

    if-nez p4, :cond_2

    .line 487
    invoke-static {}, Lcom/tencent/liteav/basic/util/TXCTimeUtil;->generatePtsMS()J

    move-result-wide p5

    :cond_2
    move p4, p3

    move p3, p2

    move p2, p1

    .line 488
    iget-object p1, p0, Lcom/tencent/liteav/d;->i:Lcom/tencent/liteav/videoencoder/b;

    if-eqz p1, :cond_3

    .line 489
    iget-object v0, p0, Lcom/tencent/liteav/d;->p:Lcom/tencent/liteav/g;

    iget-boolean v0, v0, Lcom/tencent/liteav/g;->S:Z

    invoke-virtual {p1, v0}, Lcom/tencent/liteav/videoencoder/b;->a(Z)V

    .line 490
    invoke-virtual/range {p1 .. p6}, Lcom/tencent/liteav/videoencoder/b;->a(IIIJ)J

    .line 491
    :cond_3
    iget-object p1, p0, Lcom/tencent/liteav/d;->m:Lcom/tencent/liteav/videoencoder/b;

    if-eqz p1, :cond_4

    .line 492
    iget-object p0, p0, Lcom/tencent/liteav/d;->p:Lcom/tencent/liteav/g;

    iget-boolean p0, p0, Lcom/tencent/liteav/g;->S:Z

    invoke-virtual {p1, p0}, Lcom/tencent/liteav/videoencoder/b;->a(Z)V

    .line 493
    invoke-virtual/range {p1 .. p6}, Lcom/tencent/liteav/videoencoder/b;->a(IIIJ)J

    .line 494
    :cond_4
    monitor-exit v1

    return v3

    :goto_0
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0
.end method

.method public a(IIILjava/lang/Object;JI)I
    .locals 0

    move p7, p1

    .line 495
    new-instance p1, Lcom/tencent/liteav/basic/structs/b;

    invoke-direct {p1}, Lcom/tencent/liteav/basic/structs/b;-><init>()V

    .line 496
    iput p7, p1, Lcom/tencent/liteav/basic/structs/b;->a:I

    const/4 p7, 0x0

    .line 497
    iput p7, p1, Lcom/tencent/liteav/basic/structs/b;->b:I

    .line 498
    invoke-direct/range {p0 .. p6}, Lcom/tencent/liteav/d;->a(Lcom/tencent/liteav/basic/structs/b;IILjava/lang/Object;J)V

    return p7
.end method

.method public a(Lcom/tencent/liteav/basic/structs/b;)I
    .locals 4

    .line 515
    iget-object v0, p0, Lcom/tencent/liteav/d;->X:Ljava/lang/ref/WeakReference;

    if-eqz v0, :cond_0

    .line 516
    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/tencent/liteav/m;

    if-eqz v0, :cond_0

    .line 517
    iget v1, p1, Lcom/tencent/liteav/basic/structs/b;->a:I

    iget v2, p1, Lcom/tencent/liteav/basic/structs/b;->e:I

    iget v3, p1, Lcom/tencent/liteav/basic/structs/b;->f:I

    invoke-interface {v0, v1, v2, v3}, Lcom/tencent/liteav/m;->a(III)I

    move-result v0

    iput v0, p1, Lcom/tencent/liteav/basic/structs/b;->a:I

    .line 518
    :cond_0
    invoke-direct {p0, p1}, Lcom/tencent/liteav/d;->d(Lcom/tencent/liteav/basic/structs/b;)V

    const/4 v0, 0x0

    .line 519
    invoke-direct {p0, p1, v0}, Lcom/tencent/liteav/d;->a(Lcom/tencent/liteav/basic/structs/b;Z)V

    .line 520
    iget p0, p1, Lcom/tencent/liteav/basic/structs/b;->a:I

    return p0
.end method

.method public a(ZIIIII)I
    .locals 4

    .line 410
    iget-object v0, p0, Lcom/tencent/liteav/d;->l:Lcom/tencent/liteav/videoencoder/TXSVideoEncoderParam;

    iget v1, v0, Lcom/tencent/liteav/videoencoder/TXSVideoEncoderParam;->width:I

    const/4 v2, 0x1

    const/4 v3, 0x0

    if-ne v1, p2, :cond_1

    iget v1, v0, Lcom/tencent/liteav/videoencoder/TXSVideoEncoderParam;->height:I

    if-eq v1, p3, :cond_0

    goto :goto_0

    :cond_0
    move v1, v3

    goto :goto_1

    :cond_1
    :goto_0
    move v1, v2

    .line 411
    :goto_1
    iput p2, v0, Lcom/tencent/liteav/videoencoder/TXSVideoEncoderParam;->width:I

    .line 412
    iput p3, v0, Lcom/tencent/liteav/videoencoder/TXSVideoEncoderParam;->height:I

    .line 413
    iput p4, v0, Lcom/tencent/liteav/videoencoder/TXSVideoEncoderParam;->fps:I

    .line 414
    iput p6, v0, Lcom/tencent/liteav/videoencoder/TXSVideoEncoderParam;->gop:I

    .line 415
    iput v2, v0, Lcom/tencent/liteav/videoencoder/TXSVideoEncoderParam;->encoderProfile:I

    .line 416
    iget-object p2, p0, Lcom/tencent/liteav/d;->p:Lcom/tencent/liteav/g;

    iget-boolean p2, p2, Lcom/tencent/liteav/g;->P:Z

    iput-boolean p2, v0, Lcom/tencent/liteav/videoencoder/TXSVideoEncoderParam;->realTime:Z

    const/4 p2, 0x3

    .line 417
    iput p2, v0, Lcom/tencent/liteav/videoencoder/TXSVideoEncoderParam;->streamType:I

    .line 418
    iput p5, v0, Lcom/tencent/liteav/videoencoder/TXSVideoEncoderParam;->bitrate:I

    .line 419
    iput-boolean v2, v0, Lcom/tencent/liteav/videoencoder/TXSVideoEncoderParam;->annexb:Z

    .line 420
    iput-boolean v3, v0, Lcom/tencent/liteav/videoencoder/TXSVideoEncoderParam;->bMultiRef:Z

    .line 421
    iget-object p2, p0, Lcom/tencent/liteav/d;->m:Lcom/tencent/liteav/videoencoder/b;

    if-eqz p2, :cond_4

    if-nez v1, :cond_2

    iget-boolean p2, p0, Lcom/tencent/liteav/d;->k:Z

    if-eqz p2, :cond_4

    if-nez p1, :cond_4

    .line 422
    :cond_2
    iget-object p2, p0, Lcom/tencent/liteav/d;->d:Lcom/tencent/liteav/k;

    if-eqz p2, :cond_3

    .line 423
    new-instance p3, Lcom/tencent/liteav/d$3;

    invoke-direct {p3, p0}, Lcom/tencent/liteav/d$3;-><init>(Lcom/tencent/liteav/d;)V

    invoke-interface {p2, p3}, Lcom/tencent/liteav/k;->a(Ljava/lang/Runnable;)V

    goto :goto_2

    .line 424
    :cond_3
    invoke-direct {p0}, Lcom/tencent/liteav/d;->w()V

    .line 425
    :cond_4
    :goto_2
    iput-boolean p1, p0, Lcom/tencent/liteav/d;->k:Z

    return v3
.end method

.method public a([BIIILjava/lang/Object;JI)I
    .locals 0

    move-object p8, p1

    .line 478
    new-instance p1, Lcom/tencent/liteav/basic/structs/b;

    invoke-direct {p1}, Lcom/tencent/liteav/basic/structs/b;-><init>()V

    .line 479
    iput-object p8, p1, Lcom/tencent/liteav/basic/structs/b;->m:[B

    .line 480
    iput p2, p1, Lcom/tencent/liteav/basic/structs/b;->b:I

    const/4 p2, 0x1

    .line 481
    iput-boolean p2, p1, Lcom/tencent/liteav/basic/structs/b;->d:Z

    move p2, p3

    move p3, p4

    move-object p4, p5

    move-wide p5, p6

    .line 482
    invoke-direct/range {p0 .. p6}, Lcom/tencent/liteav/d;->a(Lcom/tencent/liteav/basic/structs/b;IILjava/lang/Object;J)V

    const/4 p0, 0x0

    return p0
.end method

.method public a()V
    .locals 2

    .line 543
    const-string v0, "TXCCaptureAndEnc"

    const-string v1, "onPushEnd"

    invoke-static {v0, v1}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 544
    iget-object p0, p0, Lcom/tencent/liteav/d;->M:Ljava/lang/ref/WeakReference;

    if-nez p0, :cond_0

    goto :goto_0

    .line 545
    :cond_0
    invoke-virtual {p0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/tencent/liteav/d$a;

    if-nez p0, :cond_1

    :goto_0
    return-void

    .line 546
    :cond_1
    invoke-interface {p0}, Lcom/tencent/liteav/d$a;->onBackgroudPushStop()V

    return-void
.end method

.method public a(I)V
    .locals 2

    .line 361
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "vrotation setVideoEncRotation "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "TXCCaptureAndEnc"

    invoke-static {v1, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 362
    iput p1, p0, Lcom/tencent/liteav/d;->Y:I

    .line 363
    iget-object v0, p0, Lcom/tencent/liteav/d;->d:Lcom/tencent/liteav/k;

    if-eqz v0, :cond_0

    .line 364
    new-instance v1, Lcom/tencent/liteav/d$1;

    invoke-direct {v1, p0, p1}, Lcom/tencent/liteav/d$1;-><init>(Lcom/tencent/liteav/d;I)V

    invoke-interface {v0, v1}, Lcom/tencent/liteav/k;->a(Ljava/lang/Runnable;)V

    return-void

    .line 365
    :cond_0
    iget-object v0, p0, Lcom/tencent/liteav/d;->i:Lcom/tencent/liteav/videoencoder/b;

    if-eqz v0, :cond_1

    .line 366
    invoke-virtual {v0, p1}, Lcom/tencent/liteav/videoencoder/b;->a(I)V

    .line 367
    :cond_1
    iget-object p0, p0, Lcom/tencent/liteav/d;->m:Lcom/tencent/liteav/videoencoder/b;

    if-eqz p0, :cond_2

    .line 368
    invoke-virtual {p0, p1}, Lcom/tencent/liteav/videoencoder/b;->a(I)V

    :cond_2
    return-void
.end method

.method public a(II)V
    .locals 3

    .line 437
    iget-object v0, p0, Lcom/tencent/liteav/d;->y:Ljava/lang/Object;

    monitor-enter v0

    .line 438
    :try_start_0
    iget-object v1, p0, Lcom/tencent/liteav/d;->C:Lcom/tencent/liteav/basic/c/e;

    if-eqz v1, :cond_0

    .line 439
    new-instance v2, Lcom/tencent/liteav/d$4;

    invoke-direct {v2, p0, p1, p2}, Lcom/tencent/liteav/d$4;-><init>(Lcom/tencent/liteav/d;II)V

    invoke-virtual {v1, v2}, Lcom/tencent/liteav/basic/c/e;->a(Ljava/lang/Runnable;)V

    goto :goto_0

    :catchall_0
    move-exception p0

    goto :goto_1

    .line 440
    :cond_0
    iput p1, p0, Lcom/tencent/liteav/d;->A:I

    .line 441
    iput p2, p0, Lcom/tencent/liteav/d;->B:I

    .line 442
    :goto_0
    monitor-exit v0

    return-void

    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0
.end method

.method public a(IIIIIII)V
    .locals 6

    const/4 v0, 0x2

    if-ne p1, v0, :cond_4

    .line 369
    iget-object p1, p0, Lcom/tencent/liteav/d;->h:Lcom/tencent/liteav/videoencoder/TXSVideoEncoderParam;

    iget v0, p1, Lcom/tencent/liteav/videoencoder/TXSVideoEncoderParam;->width:I

    if-eqz v0, :cond_0

    iget v1, p1, Lcom/tencent/liteav/videoencoder/TXSVideoEncoderParam;->height:I

    if-eqz v1, :cond_0

    if-ne p2, v0, :cond_1

    if-ne p3, v1, :cond_1

    iget p1, p1, Lcom/tencent/liteav/videoencoder/TXSVideoEncoderParam;->fps:I

    if-le p4, p1, :cond_0

    goto :goto_0

    :cond_0
    move-object v1, p0

    move v4, p4

    move v5, p5

    goto :goto_1

    .line 370
    :cond_1
    :goto_0
    iget-object p1, p0, Lcom/tencent/liteav/d;->d:Lcom/tencent/liteav/k;

    if-eqz p1, :cond_2

    .line 371
    new-instance v0, Lcom/tencent/liteav/d$12;

    move-object v1, p0

    move v2, p2

    move v3, p3

    move v4, p4

    move v5, p5

    invoke-direct/range {v0 .. v5}, Lcom/tencent/liteav/d$12;-><init>(Lcom/tencent/liteav/d;IIII)V

    invoke-interface {p1, v0}, Lcom/tencent/liteav/k;->a(Ljava/lang/Runnable;)V

    goto :goto_2

    :cond_2
    move-object v1, p0

    goto :goto_2

    .line 372
    :goto_1
    iget-object p0, v1, Lcom/tencent/liteav/d;->i:Lcom/tencent/liteav/videoencoder/b;

    if-eqz p0, :cond_3

    .line 373
    invoke-virtual {p0, v5, p6}, Lcom/tencent/liteav/videoencoder/b;->b(II)Z

    .line 374
    invoke-virtual {p0, v4}, Lcom/tencent/liteav/videoencoder/b;->b(I)Z

    .line 375
    :cond_3
    :goto_2
    invoke-virtual {v1, p7}, Lcom/tencent/liteav/d;->d(I)V

    return-void

    :cond_4
    move-object v1, p0

    move v2, p2

    move v3, p3

    move v4, p4

    move v5, p5

    .line 376
    iget-object p0, v1, Lcom/tencent/liteav/d;->l:Lcom/tencent/liteav/videoencoder/TXSVideoEncoderParam;

    if-eqz p0, :cond_6

    iget p1, p0, Lcom/tencent/liteav/videoencoder/TXSVideoEncoderParam;->width:I

    if-ne v2, p1, :cond_5

    iget p0, p0, Lcom/tencent/liteav/videoencoder/TXSVideoEncoderParam;->height:I

    if-eq v3, p0, :cond_6

    .line 377
    :cond_5
    iget-object p0, v1, Lcom/tencent/liteav/d;->d:Lcom/tencent/liteav/k;

    if-eqz p0, :cond_6

    .line 378
    new-instance p1, Lcom/tencent/liteav/d$18;

    invoke-direct {p1, v1, v2, v3, v4}, Lcom/tencent/liteav/d$18;-><init>(Lcom/tencent/liteav/d;III)V

    invoke-interface {p0, p1}, Lcom/tencent/liteav/k;->a(Ljava/lang/Runnable;)V

    .line 379
    :cond_6
    iget-object p0, v1, Lcom/tencent/liteav/d;->m:Lcom/tencent/liteav/videoencoder/b;

    if-eqz p0, :cond_7

    .line 380
    invoke-virtual {p0, v5, p6}, Lcom/tencent/liteav/videoencoder/b;->b(II)Z

    .line 381
    invoke-virtual {p0, v4}, Lcom/tencent/liteav/videoencoder/b;->b(I)Z

    :cond_7
    return-void
.end method

.method public a(IJJ)V
    .locals 1

    const/4 v0, 0x2

    if-ne p1, v0, :cond_0

    .line 537
    iput-wide p2, p0, Lcom/tencent/liteav/d;->I:J

    .line 538
    iput-wide p4, p0, Lcom/tencent/liteav/d;->H:J

    :cond_0
    return-void
.end method

.method public a(Landroid/graphics/Bitmap;FFF)V
    .locals 1

    .line 461
    iget-object v0, p0, Lcom/tencent/liteav/d;->p:Lcom/tencent/liteav/g;

    iput-object p1, v0, Lcom/tencent/liteav/g;->E:Landroid/graphics/Bitmap;

    .line 462
    iput p2, v0, Lcom/tencent/liteav/g;->H:F

    .line 463
    iput p3, v0, Lcom/tencent/liteav/g;->I:F

    .line 464
    iput p4, v0, Lcom/tencent/liteav/g;->J:F

    .line 465
    invoke-direct {p0}, Lcom/tencent/liteav/d;->y()V

    return-void
.end method

.method public a(Landroid/graphics/Bitmap;Ljava/nio/ByteBuffer;II)V
    .locals 6

    .line 539
    new-instance v0, Lcom/tencent/liteav/d$9;

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    move v4, p3

    move v5, p4

    invoke-direct/range {v0 .. v5}, Lcom/tencent/liteav/d$9;-><init>(Lcom/tencent/liteav/d;Landroid/graphics/Bitmap;Ljava/nio/ByteBuffer;II)V

    .line 540
    iget-object p0, v1, Lcom/tencent/liteav/d;->d:Lcom/tencent/liteav/k;

    if-eqz p0, :cond_0

    .line 541
    invoke-interface {p0, v0}, Lcom/tencent/liteav/k;->a(Ljava/lang/Runnable;)V

    return-void

    .line 542
    :cond_0
    invoke-interface {v0}, Ljava/lang/Runnable;->run()V

    return-void
.end method

.method public a(Landroid/graphics/SurfaceTexture;)V
    .locals 0

    .line 547
    iget-object p0, p0, Lcom/tencent/liteav/d;->e:Lcom/tencent/liteav/beauty/d;

    if-eqz p0, :cond_0

    .line 548
    invoke-virtual {p0}, Lcom/tencent/liteav/beauty/d;->b()V

    :cond_0
    return-void
.end method

.method public a(Landroid/media/MediaFormat;)V
    .locals 0

    .line 534
    iget-object p0, p0, Lcom/tencent/liteav/d;->M:Ljava/lang/ref/WeakReference;

    if-nez p0, :cond_0

    goto :goto_0

    .line 535
    :cond_0
    invoke-virtual {p0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/tencent/liteav/d$a;

    if-eqz p0, :cond_1

    .line 536
    invoke-interface {p0, p1}, Lcom/tencent/liteav/d$a;->onEncVideoFormat(Landroid/media/MediaFormat;)V

    :cond_1
    :goto_0
    return-void
.end method

.method public a(Landroid/view/Surface;)V
    .locals 4

    .line 426
    const-string v0, "surface-render: set surface the same"

    const-string v1, "surface-render: set surface "

    iget-object v2, p0, Lcom/tencent/liteav/d;->x:Lcom/tencent/rtmp/ui/TXCloudVideoView;

    if-eqz v2, :cond_0

    .line 427
    const-string p0, "TXCCaptureAndEnc"

    const-string p1, "camera preview view is not null, can\'t set surface"

    invoke-static {p0, p1}, Lcom/tencent/liteav/basic/log/TXCLog;->w(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    .line 428
    :cond_0
    iget-object v2, p0, Lcom/tencent/liteav/d;->y:Ljava/lang/Object;

    monitor-enter v2

    .line 429
    :try_start_0
    iget-object v3, p0, Lcom/tencent/liteav/d;->z:Landroid/view/Surface;

    if-eq v3, p1, :cond_1

    .line 430
    const-string v0, "TXCCaptureAndEnc"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 431
    iput-object p1, p0, Lcom/tencent/liteav/d;->z:Landroid/view/Surface;

    .line 432
    iget-object p1, p0, Lcom/tencent/liteav/d;->C:Lcom/tencent/liteav/basic/c/e;

    if-eqz p1, :cond_2

    .line 433
    invoke-virtual {p1}, Lcom/tencent/liteav/basic/c/e;->a()V

    const/4 p1, 0x0

    .line 434
    iput-object p1, p0, Lcom/tencent/liteav/d;->C:Lcom/tencent/liteav/basic/c/e;

    goto :goto_0

    :catchall_0
    move-exception p0

    goto :goto_1

    .line 435
    :cond_1
    const-string p0, "TXCCaptureAndEnc"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p0, p1}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 436
    :cond_2
    :goto_0
    monitor-exit v2

    return-void

    :goto_1
    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0
.end method

.method public a(Lcom/tencent/liteav/basic/b/b;)V
    .locals 1

    .line 360
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/tencent/liteav/d;->W:Ljava/lang/ref/WeakReference;

    return-void
.end method

.method public a(Lcom/tencent/liteav/basic/c/o;)V
    .locals 2

    .line 443
    iget-object v0, p0, Lcom/tencent/liteav/d;->x:Lcom/tencent/rtmp/ui/TXCloudVideoView;

    const/4 v1, 0x0

    if-eqz v0, :cond_1

    .line 444
    invoke-virtual {v0}, Lcom/tencent/rtmp/ui/TXCloudVideoView;->getGLSurfaceView()Lcom/tencent/liteav/renderer/TXCGLSurfaceView;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 445
    new-instance v1, Lcom/tencent/liteav/d$5;

    invoke-direct {v1, p0, p1}, Lcom/tencent/liteav/d$5;-><init>(Lcom/tencent/liteav/d;Lcom/tencent/liteav/basic/c/o;)V

    invoke-virtual {v0, v1}, Lcom/tencent/liteav/renderer/TXCGLSurfaceView;->a(Lcom/tencent/liteav/basic/c/o;)V

    return-void

    :cond_0
    if-eqz p1, :cond_3

    .line 446
    invoke-interface {p1, v1}, Lcom/tencent/liteav/basic/c/o;->onTakePhotoComplete(Landroid/graphics/Bitmap;)V

    return-void

    .line 447
    :cond_1
    iget-object v0, p0, Lcom/tencent/liteav/d;->C:Lcom/tencent/liteav/basic/c/e;

    if-eqz v0, :cond_2

    .line 448
    new-instance v1, Lcom/tencent/liteav/d$6;

    invoke-direct {v1, p0, p1}, Lcom/tencent/liteav/d$6;-><init>(Lcom/tencent/liteav/d;Lcom/tencent/liteav/basic/c/o;)V

    invoke-virtual {v0, v1}, Lcom/tencent/liteav/basic/c/e;->a(Lcom/tencent/liteav/basic/c/o;)V

    return-void

    :cond_2
    if-eqz p1, :cond_3

    .line 449
    invoke-interface {p1, v1}, Lcom/tencent/liteav/basic/c/o;->onTakePhotoComplete(Landroid/graphics/Bitmap;)V

    :cond_3
    return-void
.end method

.method public a(Lcom/tencent/liteav/basic/structs/TXSNALPacket;I)V
    .locals 3

    const/4 v0, 0x2

    if-nez p2, :cond_2

    .line 522
    iget p2, p1, Lcom/tencent/liteav/basic/structs/TXSNALPacket;->streamType:I

    if-ne p2, v0, :cond_0

    .line 523
    iget-wide v0, p1, Lcom/tencent/liteav/basic/structs/TXSNALPacket;->gopIndex:J

    iput-wide v0, p0, Lcom/tencent/liteav/d;->I:J

    .line 524
    iget-wide v0, p1, Lcom/tencent/liteav/basic/structs/TXSNALPacket;->frameIndex:J

    iput-wide v0, p0, Lcom/tencent/liteav/d;->H:J

    .line 525
    :cond_0
    iget-object p0, p0, Lcom/tencent/liteav/d;->M:Ljava/lang/ref/WeakReference;

    if-nez p0, :cond_1

    goto :goto_0

    .line 526
    :cond_1
    invoke-virtual {p0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/tencent/liteav/d$a;

    if-eqz p0, :cond_4

    .line 527
    invoke-interface {p0, p1}, Lcom/tencent/liteav/d$a;->onEncVideo(Lcom/tencent/liteav/basic/structs/TXSNALPacket;)V

    return-void

    :cond_2
    const p1, 0x989684

    if-eq p2, p1, :cond_3

    const p1, 0x989685

    if-ne p2, p1, :cond_4

    .line 528
    :cond_3
    iget-object p1, p0, Lcom/tencent/liteav/d;->h:Lcom/tencent/liteav/videoencoder/TXSVideoEncoderParam;

    iget p1, p1, Lcom/tencent/liteav/videoencoder/TXSVideoEncoderParam;->encodeType:I

    const/4 v1, 0x1

    if-ne p1, v1, :cond_4

    .line 529
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    filled-new-array {p1}, [Ljava/lang/Object;

    move-result-object p1

    const-string p2, "VideoEncoder: hardware encoder error %d, switch to software encoder"

    invoke-static {p2, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    const-string p2, ""

    const/4 v2, 0x0

    invoke-static {v0, p1, p2, v2}, Lcom/tencent/liteav/basic/module/Monitor;->a(ILjava/lang/String;Ljava/lang/String;I)V

    .line 530
    invoke-virtual {p0}, Lcom/tencent/liteav/d;->r()V

    .line 531
    iget p1, p0, Lcom/tencent/liteav/d;->r:I

    add-int/2addr p1, v1

    iput p1, p0, Lcom/tencent/liteav/d;->r:I

    .line 532
    iget-object p1, p0, Lcom/tencent/liteav/d;->p:Lcom/tencent/liteav/g;

    iput v2, p1, Lcom/tencent/liteav/g;->j:I

    const/16 p1, 0x44f

    .line 533
    const-string p2, "Failed to enable hardware encoder, use software encoder"

    invoke-direct {p0, p1, p2}, Lcom/tencent/liteav/d;->a(ILjava/lang/String;)V

    :cond_4
    :goto_0
    return-void
.end method

.method public a(Lcom/tencent/liteav/basic/structs/b;J)V
    .locals 6

    .line 521
    iget v1, p1, Lcom/tencent/liteav/basic/structs/b;->a:I

    iget v2, p1, Lcom/tencent/liteav/basic/structs/b;->e:I

    iget v3, p1, Lcom/tencent/liteav/basic/structs/b;->f:I

    move-object v0, p0

    move-wide v4, p2

    invoke-direct/range {v0 .. v5}, Lcom/tencent/liteav/d;->a(IIIJ)V

    return-void
.end method

.method public a(Lcom/tencent/liteav/d$a;)V
    .locals 1

    .line 342
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/tencent/liteav/d;->M:Ljava/lang/ref/WeakReference;

    return-void
.end method

.method public a(Lcom/tencent/liteav/g;)V
    .locals 6

    const/4 v0, 0x0

    const/4 v1, 0x1

    if-eqz p1, :cond_1

    .line 347
    iget-object v2, p0, Lcom/tencent/liteav/d;->p:Lcom/tencent/liteav/g;

    iget-object v3, v2, Lcom/tencent/liteav/g;->E:Landroid/graphics/Bitmap;

    iget-object v4, p1, Lcom/tencent/liteav/g;->E:Landroid/graphics/Bitmap;

    if-ne v3, v4, :cond_0

    iget v3, v2, Lcom/tencent/liteav/g;->F:I

    iget v4, p1, Lcom/tencent/liteav/g;->F:I

    if-ne v3, v4, :cond_0

    iget v3, v2, Lcom/tencent/liteav/g;->G:I

    iget v4, p1, Lcom/tencent/liteav/g;->G:I

    if-ne v3, v4, :cond_0

    iget v3, v2, Lcom/tencent/liteav/g;->J:F

    iget v4, p1, Lcom/tencent/liteav/g;->J:F

    cmpl-float v3, v3, v4

    if-nez v3, :cond_0

    iget v3, v2, Lcom/tencent/liteav/g;->H:F

    iget v4, p1, Lcom/tencent/liteav/g;->H:F

    cmpl-float v3, v3, v4

    if-nez v3, :cond_0

    iget v2, v2, Lcom/tencent/liteav/g;->I:F

    iget v3, p1, Lcom/tencent/liteav/g;->I:F

    cmpl-float v2, v2, v3

    if-eqz v2, :cond_1

    :cond_0
    move v2, v1

    goto :goto_0

    :cond_1
    move v2, v0

    :goto_0
    if-eqz p1, :cond_3

    .line 348
    iget-object v3, p0, Lcom/tencent/liteav/d;->p:Lcom/tencent/liteav/g;

    iget v4, v3, Lcom/tencent/liteav/g;->a:I

    iget v5, p1, Lcom/tencent/liteav/g;->a:I

    if-ne v4, v5, :cond_2

    iget v3, v3, Lcom/tencent/liteav/g;->b:I

    iget v4, p1, Lcom/tencent/liteav/g;->b:I

    if-eq v3, v4, :cond_3

    :cond_2
    move v3, v1

    goto :goto_1

    :cond_3
    move v3, v0

    :goto_1
    if-eqz p1, :cond_4

    .line 349
    :try_start_0
    invoke-virtual {p1}, Lcom/tencent/liteav/g;->clone()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/tencent/liteav/g;

    iput-object p1, p0, Lcom/tencent/liteav/d;->p:Lcom/tencent/liteav/g;
    :try_end_0
    .catch Ljava/lang/CloneNotSupportedException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_2

    :catch_0
    move-exception p1

    .line 350
    new-instance v4, Lcom/tencent/liteav/g;

    invoke-direct {v4}, Lcom/tencent/liteav/g;-><init>()V

    iput-object v4, p0, Lcom/tencent/liteav/d;->p:Lcom/tencent/liteav/g;

    .line 351
    invoke-virtual {p1}, Ljava/lang/Throwable;->printStackTrace()V

    goto :goto_2

    .line 352
    :cond_4
    new-instance p1, Lcom/tencent/liteav/g;

    invoke-direct {p1}, Lcom/tencent/liteav/g;-><init>()V

    iput-object p1, p0, Lcom/tencent/liteav/d;->p:Lcom/tencent/liteav/g;

    .line 353
    :goto_2
    iget-object p1, p0, Lcom/tencent/liteav/d;->p:Lcom/tencent/liteav/g;

    iget p1, p1, Lcom/tencent/liteav/g;->a:I

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    iget-object v4, p0, Lcom/tencent/liteav/d;->p:Lcom/tencent/liteav/g;

    iget v4, v4, Lcom/tencent/liteav/g;->b:I

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    iget-object v5, p0, Lcom/tencent/liteav/d;->p:Lcom/tencent/liteav/g;

    iget v5, v5, Lcom/tencent/liteav/g;->l:I

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    filled-new-array {p1, v4, v5}, [Ljava/lang/Object;

    move-result-object p1

    const-string v4, "vsize setConfig w*h:%d*%d orientation:%d"

    invoke-static {v4, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    const-string v4, "TXCCaptureAndEnc"

    invoke-static {v4, p1}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 354
    iget-object p1, p0, Lcom/tencent/liteav/d;->d:Lcom/tencent/liteav/k;

    if-eqz p1, :cond_5

    .line 355
    iget-object v4, p0, Lcom/tencent/liteav/d;->p:Lcom/tencent/liteav/g;

    iget v4, v4, Lcom/tencent/liteav/g;->l:I

    invoke-interface {p1, v4}, Lcom/tencent/liteav/k;->e(I)V

    .line 356
    :cond_5
    invoke-direct {p0}, Lcom/tencent/liteav/d;->z()V

    if-eqz v3, :cond_6

    .line 357
    iget-object p1, p0, Lcom/tencent/liteav/d;->p:Lcom/tencent/liteav/g;

    iget-boolean p1, p1, Lcom/tencent/liteav/g;->T:Z

    if-nez p1, :cond_6

    move v0, v1

    :cond_6
    invoke-direct {p0, v0}, Lcom/tencent/liteav/d;->j(Z)V

    .line 358
    invoke-virtual {p0}, Lcom/tencent/liteav/d;->i()Z

    move-result p1

    if-eqz p1, :cond_7

    if-eqz v2, :cond_7

    .line 359
    invoke-direct {p0}, Lcom/tencent/liteav/d;->y()V

    :cond_7
    return-void
.end method

.method public a(Lcom/tencent/liteav/o;I)V
    .locals 0

    .line 343
    iput p2, p0, Lcom/tencent/liteav/d;->J:I

    if-eqz p1, :cond_0

    .line 344
    new-instance p2, Ljava/lang/ref/WeakReference;

    invoke-direct {p2, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object p2, p0, Lcom/tencent/liteav/d;->K:Ljava/lang/ref/WeakReference;

    return-void

    :cond_0
    const/4 p1, 0x0

    .line 345
    iput-object p1, p0, Lcom/tencent/liteav/d;->K:Ljava/lang/ref/WeakReference;

    return-void
.end method

.method public a(Lcom/tencent/liteav/screencapture/a$a;)V
    .locals 3

    const/4 v0, 0x1

    .line 450
    iput v0, p0, Lcom/tencent/liteav/d;->q:I

    .line 451
    iget-object v0, p0, Lcom/tencent/liteav/d;->d:Lcom/tencent/liteav/k;

    if-nez v0, :cond_0

    .line 452
    new-instance v0, Lcom/tencent/liteav/i;

    iget-object v1, p0, Lcom/tencent/liteav/d;->o:Landroid/content/Context;

    iget-object v2, p0, Lcom/tencent/liteav/d;->p:Lcom/tencent/liteav/g;

    invoke-direct {v0, v1, v2, p1}, Lcom/tencent/liteav/i;-><init>(Landroid/content/Context;Lcom/tencent/liteav/g;Lcom/tencent/liteav/screencapture/a$a;)V

    iput-object v0, p0, Lcom/tencent/liteav/d;->d:Lcom/tencent/liteav/k;

    .line 453
    const-string p1, "TXCCaptureAndEnc"

    const-string v0, "create TXCScreenCaptureSource"

    invoke-static {p1, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 454
    :cond_0
    iget-object p1, p0, Lcom/tencent/liteav/d;->V:Lcom/tencent/liteav/beauty/b;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Lcom/tencent/liteav/beauty/b;->a(Z)V

    .line 455
    iget p1, p0, Lcom/tencent/liteav/d;->E:I

    invoke-virtual {p0, p1}, Lcom/tencent/liteav/d;->i(I)V

    .line 456
    iget-object p1, p0, Lcom/tencent/liteav/d;->d:Lcom/tencent/liteav/k;

    invoke-interface {p1, p0}, Lcom/tencent/liteav/k;->a(Lcom/tencent/liteav/basic/b/b;)V

    .line 457
    iget-object p1, p0, Lcom/tencent/liteav/d;->d:Lcom/tencent/liteav/k;

    invoke-interface {p1, p0}, Lcom/tencent/liteav/k;->a(Lcom/tencent/liteav/l;)V

    .line 458
    iget-object p1, p0, Lcom/tencent/liteav/d;->d:Lcom/tencent/liteav/k;

    invoke-interface {p1}, Lcom/tencent/liteav/k;->a()V

    .line 459
    iget-object p1, p0, Lcom/tencent/liteav/d;->d:Lcom/tencent/liteav/k;

    invoke-virtual {p0}, Lcom/tencent/liteav/basic/module/a;->getID()Ljava/lang/String;

    move-result-object v0

    invoke-interface {p1, v0}, Lcom/tencent/liteav/k;->a(Ljava/lang/String;)V

    .line 460
    iget-object p0, p0, Lcom/tencent/liteav/d;->o:Landroid/content/Context;

    sget p1, Lcom/tencent/liteav/basic/datareport/a;->aG:I

    invoke-static {p0, p1}, Lcom/tencent/liteav/basic/datareport/TXCDRApi;->txReportDAU(Landroid/content/Context;I)V

    return-void
.end method

.method public a(Lcom/tencent/rtmp/ui/TXCloudVideoView;)V
    .locals 6

    .line 382
    iget-object v0, p0, Lcom/tencent/liteav/d;->p:Lcom/tencent/liteav/g;

    iget-boolean v0, v0, Lcom/tencent/liteav/g;->M:Z

    const-string v1, "TXCCaptureAndEnc"

    if-eqz v0, :cond_0

    .line 383
    const-string p0, "enable pure audio push , so can not start preview!"

    invoke-static {v1, p0}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    .line 384
    :cond_0
    iget-object v0, p0, Lcom/tencent/liteav/d;->a:Lcom/tencent/liteav/b;

    if-eqz v0, :cond_1

    .line 385
    invoke-virtual {v0}, Lcom/tencent/liteav/b;->b()V

    :cond_1
    const/4 v0, 0x0

    .line 386
    iput-boolean v0, p0, Lcom/tencent/liteav/d;->w:Z

    .line 387
    iget-object v2, p0, Lcom/tencent/liteav/d;->p:Lcom/tencent/liteav/g;

    iget-boolean v2, v2, Lcom/tencent/liteav/g;->W:Z

    if-eqz p1, :cond_2

    const/4 v3, 0x1

    .line 388
    new-array v3, v3, [Lcom/tencent/liteav/renderer/TXCGLSurfaceView;

    .line 389
    new-instance v4, Lcom/tencent/liteav/d$22;

    invoke-direct {v4, p0, v3, p1}, Lcom/tencent/liteav/d$22;-><init>(Lcom/tencent/liteav/d;[Lcom/tencent/liteav/renderer/TXCGLSurfaceView;Lcom/tencent/rtmp/ui/TXCloudVideoView;)V

    invoke-direct {p0, v4}, Lcom/tencent/liteav/d;->a(Ljava/lang/Runnable;)V

    .line 390
    aget-object v3, v3, v0

    .line 391
    invoke-virtual {v3, p0}, Lcom/tencent/liteav/renderer/TXCGLSurfaceView;->setNotifyListener(Lcom/tencent/liteav/basic/b/b;)V

    .line 392
    const-string v4, "start camera preview with GLSurfaceView"

    invoke-static {v1, v4}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 393
    :cond_2
    new-instance v3, Lcom/tencent/liteav/basic/c/f;

    invoke-direct {v3}, Lcom/tencent/liteav/basic/c/f;-><init>()V

    .line 394
    const-string v2, "start camera preview with SurfaceTexture"

    invoke-static {v1, v2}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    move v2, v0

    .line 395
    :goto_0
    iput v0, p0, Lcom/tencent/liteav/d;->q:I

    .line 396
    new-instance v1, Lcom/tencent/liteav/c;

    iget-object v4, p0, Lcom/tencent/liteav/d;->o:Landroid/content/Context;

    iget-object v5, p0, Lcom/tencent/liteav/d;->p:Lcom/tencent/liteav/g;

    invoke-direct {v1, v4, v5, v3, v2}, Lcom/tencent/liteav/c;-><init>(Landroid/content/Context;Lcom/tencent/liteav/g;Lcom/tencent/liteav/basic/c/m;Z)V

    iput-object v1, p0, Lcom/tencent/liteav/d;->d:Lcom/tencent/liteav/k;

    .line 397
    invoke-direct {p0}, Lcom/tencent/liteav/d;->v()V

    .line 398
    iget v1, p0, Lcom/tencent/liteav/d;->E:I

    invoke-virtual {p0, v1}, Lcom/tencent/liteav/d;->i(I)V

    .line 399
    iget-object v1, p0, Lcom/tencent/liteav/d;->d:Lcom/tencent/liteav/k;

    invoke-virtual {p0}, Lcom/tencent/liteav/basic/module/a;->getID()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Lcom/tencent/liteav/k;->a(Ljava/lang/String;)V

    .line 400
    iget-object v1, p0, Lcom/tencent/liteav/d;->d:Lcom/tencent/liteav/k;

    invoke-interface {v1, p0}, Lcom/tencent/liteav/k;->a(Lcom/tencent/liteav/l;)V

    .line 401
    iget-object v1, p0, Lcom/tencent/liteav/d;->d:Lcom/tencent/liteav/k;

    invoke-interface {v1, p0}, Lcom/tencent/liteav/k;->a(Lcom/tencent/liteav/basic/b/b;)V

    .line 402
    iget-object v1, p0, Lcom/tencent/liteav/d;->d:Lcom/tencent/liteav/k;

    invoke-interface {v1}, Lcom/tencent/liteav/k;->a()V

    .line 403
    iget-object v1, p0, Lcom/tencent/liteav/d;->d:Lcom/tencent/liteav/k;

    iget v2, p0, Lcom/tencent/liteav/d;->u:I

    invoke-interface {v1, v2}, Lcom/tencent/liteav/k;->b(I)V

    .line 404
    iget-object v1, p0, Lcom/tencent/liteav/d;->d:Lcom/tencent/liteav/k;

    iget v2, p0, Lcom/tencent/liteav/d;->v:I

    invoke-interface {v1, v2}, Lcom/tencent/liteav/k;->c(I)V

    .line 405
    iget-object v1, p0, Lcom/tencent/liteav/d;->d:Lcom/tencent/liteav/k;

    iget v2, p0, Lcom/tencent/liteav/d;->Z:I

    invoke-interface {v1, v2}, Lcom/tencent/liteav/k;->d(I)V

    .line 406
    iput-object p1, p0, Lcom/tencent/liteav/d;->x:Lcom/tencent/rtmp/ui/TXCloudVideoView;

    .line 407
    iget-object v1, p0, Lcom/tencent/liteav/d;->c:Lcom/tencent/liteav/basic/util/e;

    new-instance v2, Lcom/tencent/liteav/d$2;

    invoke-direct {v2, p0, p1}, Lcom/tencent/liteav/d$2;-><init>(Lcom/tencent/liteav/d;Lcom/tencent/rtmp/ui/TXCloudVideoView;)V

    invoke-virtual {v1, v2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 408
    iput-boolean v0, p0, Lcom/tencent/liteav/d;->w:Z

    const/16 p0, 0x7533

    .line 409
    invoke-static {p0}, Lcom/tencent/liteav/basic/module/TXCKeyPointReportProxy;->a(I)V

    return-void
.end method

.method public a(Z)V
    .locals 0

    .line 346
    iput-boolean p1, p0, Lcom/tencent/liteav/d;->L:Z

    return-void
.end method

.method public a([BIIIJ)V
    .locals 0

    .line 549
    return-void
.end method

.method public b()Lcom/tencent/liteav/beauty/TXBeautyManager;
    .locals 0

    .line 94
    iget-object p0, p0, Lcom/tencent/liteav/d;->V:Lcom/tencent/liteav/beauty/b;

    return-object p0
.end method

.method public b(I)V
    .locals 2

    .line 95
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "setLocalViewMirror "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "TXCCaptureAndEnc"

    invoke-static {v1, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 96
    iput p1, p0, Lcom/tencent/liteav/d;->Z:I

    .line 97
    iget-object v0, p0, Lcom/tencent/liteav/d;->d:Lcom/tencent/liteav/k;

    if-eqz v0, :cond_0

    .line 98
    invoke-interface {v0, p1}, Lcom/tencent/liteav/k;->d(I)V

    .line 99
    :cond_0
    iget-object p1, p0, Lcom/tencent/liteav/d;->C:Lcom/tencent/liteav/basic/c/e;

    if-eqz p1, :cond_1

    .line 100
    iget p0, p0, Lcom/tencent/liteav/d;->Z:I

    invoke-virtual {p1, p0}, Lcom/tencent/liteav/basic/c/e;->b(I)V

    :cond_1
    return-void
.end method

.method public b(II)V
    .locals 0

    .line 106
    iget-object p0, p0, Lcom/tencent/liteav/d;->d:Lcom/tencent/liteav/k;

    if-nez p0, :cond_0

    return-void

    .line 107
    :cond_0
    invoke-interface {p0, p1, p2}, Lcom/tencent/liteav/k;->a(II)V

    return-void
.end method

.method public b(Lcom/tencent/liteav/basic/structs/b;)V
    .locals 8

    .line 108
    iget-boolean v0, p0, Lcom/tencent/liteav/d;->S:Z

    if-nez v0, :cond_0

    const/4 v0, 0x1

    .line 109
    iput-boolean v0, p0, Lcom/tencent/liteav/d;->S:Z

    const/16 v0, 0x7533

    const/4 v1, 0x0

    .line 110
    invoke-static {v0, v1}, Lcom/tencent/liteav/basic/module/TXCKeyPointReportProxy;->b(II)V

    .line 111
    :cond_0
    iget v0, p0, Lcom/tencent/liteav/d;->s:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_1

    goto :goto_0

    .line 112
    :cond_1
    iget-object v0, p0, Lcom/tencent/liteav/d;->d:Lcom/tencent/liteav/k;

    .line 113
    iget-object v1, p0, Lcom/tencent/liteav/d;->e:Lcom/tencent/liteav/beauty/d;

    if-eqz v1, :cond_4

    iget-object v1, p0, Lcom/tencent/liteav/d;->p:Lcom/tencent/liteav/g;

    iget-boolean v1, v1, Lcom/tencent/liteav/g;->M:Z

    if-nez v1, :cond_4

    if-eqz v0, :cond_4

    .line 114
    iget-object v1, p0, Lcom/tencent/liteav/d;->h:Lcom/tencent/liteav/videoencoder/TXSVideoEncoderParam;

    iget v2, v1, Lcom/tencent/liteav/videoencoder/TXSVideoEncoderParam;->height:I

    iget v3, p1, Lcom/tencent/liteav/basic/structs/b;->h:I

    if-ne v2, v3, :cond_2

    iget v1, v1, Lcom/tencent/liteav/videoencoder/TXSVideoEncoderParam;->width:I

    iget v2, p1, Lcom/tencent/liteav/basic/structs/b;->g:I

    if-eq v1, v2, :cond_3

    .line 115
    :cond_2
    iget v1, p1, Lcom/tencent/liteav/basic/structs/b;->g:I

    invoke-direct {p0, v1, v3}, Lcom/tencent/liteav/d;->d(II)V

    .line 116
    :cond_3
    iget-object v1, p0, Lcom/tencent/liteav/d;->e:Lcom/tencent/liteav/beauty/d;

    invoke-interface {v0}, Lcom/tencent/liteav/k;->f()Ljavax/microedition/khronos/egl/EGLContext;

    move-result-object v0

    invoke-virtual {v1, v0}, Lcom/tencent/liteav/beauty/d;->a(Ljava/lang/Object;)V

    .line 117
    iget-object v0, p0, Lcom/tencent/liteav/d;->e:Lcom/tencent/liteav/beauty/d;

    iget-object v1, p0, Lcom/tencent/liteav/d;->p:Lcom/tencent/liteav/g;

    iget v1, v1, Lcom/tencent/liteav/g;->l:I

    invoke-virtual {v0, v1}, Lcom/tencent/liteav/beauty/d;->a(I)V

    .line 118
    iget-object v2, p0, Lcom/tencent/liteav/d;->e:Lcom/tencent/liteav/beauty/d;

    iget v4, p1, Lcom/tencent/liteav/basic/structs/b;->b:I

    const/4 v5, 0x0

    const-wide/16 v6, 0x0

    move-object v3, p1

    invoke-virtual/range {v2 .. v7}, Lcom/tencent/liteav/beauty/d;->a(Lcom/tencent/liteav/basic/structs/b;IIJ)I

    :cond_4
    :goto_0
    return-void
.end method

.method public b(Z)V
    .locals 2

    .line 101
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "enableBlackStream "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "TXCCaptureAndEnc"

    invoke-static {v1, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 102
    iput-boolean p1, p0, Lcom/tencent/liteav/d;->t:Z

    if-eqz p1, :cond_1

    .line 103
    iget-object p1, p0, Lcom/tencent/liteav/d;->d:Lcom/tencent/liteav/k;

    if-nez p1, :cond_0

    .line 104
    invoke-direct {p0}, Lcom/tencent/liteav/d;->u()V

    :cond_0
    return-void

    .line 105
    :cond_1
    invoke-direct {p0}, Lcom/tencent/liteav/d;->v()V

    return-void
.end method

.method public c()Lcom/tencent/liteav/g;
    .locals 0

    .line 179
    iget-object p0, p0, Lcom/tencent/liteav/d;->p:Lcom/tencent/liteav/g;

    return-object p0
.end method

.method public c(I)V
    .locals 2

    .line 180
    iget-object v0, p0, Lcom/tencent/liteav/d;->d:Lcom/tencent/liteav/k;

    if-nez v0, :cond_0

    return-void

    .line 181
    :cond_0
    new-instance v1, Lcom/tencent/liteav/d$19;

    invoke-direct {v1, p0, p1}, Lcom/tencent/liteav/d$19;-><init>(Lcom/tencent/liteav/d;I)V

    invoke-interface {v0, v1}, Lcom/tencent/liteav/k;->a(Ljava/lang/Runnable;)V

    return-void
.end method

.method public c(Z)V
    .locals 0

    .line 182
    invoke-direct {p0, p1}, Lcom/tencent/liteav/d;->i(Z)V

    return-void
.end method

.method public d()I
    .locals 3

    .line 252
    invoke-virtual {p0}, Lcom/tencent/liteav/d;->i()Z

    move-result v0

    const-string v1, "TXCCaptureAndEnc"

    if-eqz v0, :cond_0

    .line 253
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v2, "ignore startPush when pushing, status:"

    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget p0, p0, Lcom/tencent/liteav/d;->s:I

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v1, p0}, Lcom/tencent/liteav/basic/log/TXCLog;->w(Ljava/lang/String;Ljava/lang/String;)V

    const/4 p0, -0x2

    return p0

    .line 254
    :cond_0
    iget-object v0, p0, Lcom/tencent/liteav/d;->o:Landroid/content/Context;

    invoke-static {v0}, Lcom/tencent/liteav/basic/datareport/TXCDRApi;->initCrashReport(Landroid/content/Context;)V

    const/4 v0, 0x1

    .line 255
    iput v0, p0, Lcom/tencent/liteav/d;->s:I

    .line 256
    const-string v0, "startWithoutAudio"

    invoke-static {v1, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 257
    invoke-direct {p0}, Lcom/tencent/liteav/d;->z()V

    .line 258
    iget-object p0, p0, Lcom/tencent/liteav/d;->o:Landroid/content/Context;

    sget v0, Lcom/tencent/liteav/basic/datareport/a;->bu:I

    invoke-static {p0, v0}, Lcom/tencent/liteav/basic/datareport/TXCDRApi;->txReportDAU(Landroid/content/Context;I)V

    const/4 p0, 0x0

    return p0
.end method

.method public d(I)V
    .locals 2

    .line 259
    iget-object v0, p0, Lcom/tencent/liteav/d;->d:Lcom/tencent/liteav/k;

    if-nez v0, :cond_0

    return-void

    .line 260
    :cond_0
    new-instance v1, Lcom/tencent/liteav/d$20;

    invoke-direct {v1, p0, p1}, Lcom/tencent/liteav/d$20;-><init>(Lcom/tencent/liteav/d;I)V

    invoke-interface {v0, v1}, Lcom/tencent/liteav/k;->a(Ljava/lang/Runnable;)V

    return-void
.end method

.method public d(Z)Z
    .locals 0

    .line 261
    iget-object p0, p0, Lcom/tencent/liteav/d;->d:Lcom/tencent/liteav/k;

    if-nez p0, :cond_0

    const/4 p0, 0x0

    return p0

    .line 262
    :cond_0
    invoke-interface {p0, p1}, Lcom/tencent/liteav/k;->d(Z)Z

    move-result p0

    return p0
.end method

.method public e()V
    .locals 3

    .line 94
    invoke-virtual {p0}, Lcom/tencent/liteav/d;->i()Z

    move-result v0

    const-string v1, "TXCCaptureAndEnc"

    if-nez v0, :cond_0

    .line 95
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v2, "ignore stopPush when not pushing, status:"

    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget p0, p0, Lcom/tencent/liteav/d;->s:I

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v1, p0}, Lcom/tencent/liteav/basic/log/TXCLog;->w(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    .line 96
    :cond_0
    const-string v0, "stop"

    invoke-static {v1, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    const/4 v0, 0x0

    .line 97
    iput v0, p0, Lcom/tencent/liteav/d;->s:I

    .line 98
    invoke-virtual {p0}, Lcom/tencent/liteav/d;->r()V

    .line 99
    iget-object v1, p0, Lcom/tencent/liteav/d;->p:Lcom/tencent/liteav/g;

    iput-boolean v0, v1, Lcom/tencent/liteav/g;->P:Z

    .line 100
    iget-object v1, p0, Lcom/tencent/liteav/d;->a:Lcom/tencent/liteav/b;

    if-eqz v1, :cond_1

    .line 101
    invoke-virtual {v1}, Lcom/tencent/liteav/b;->b()V

    .line 102
    :cond_1
    invoke-virtual {p0, v0}, Lcom/tencent/liteav/d;->b(Z)V

    const/4 v0, 0x0

    .line 103
    iput-object v0, p0, Lcom/tencent/liteav/d;->D:Lcom/tencent/liteav/basic/structs/b;

    return-void
.end method

.method public e(I)V
    .locals 2

    .line 104
    iget-object v0, p0, Lcom/tencent/liteav/d;->p:Lcom/tencent/liteav/g;

    iget v1, v0, Lcom/tencent/liteav/g;->h:I

    if-ne v1, p1, :cond_0

    goto :goto_0

    .line 105
    :cond_0
    iput p1, v0, Lcom/tencent/liteav/g;->h:I

    .line 106
    iget-object v0, p0, Lcom/tencent/liteav/d;->d:Lcom/tencent/liteav/k;

    if-eqz v0, :cond_3

    invoke-interface {v0}, Lcom/tencent/liteav/k;->g()I

    move-result v0

    if-ge v0, p1, :cond_3

    .line 107
    iget v0, p0, Lcom/tencent/liteav/d;->q:I

    const/4 v1, 0x1

    if-eqz v0, :cond_2

    if-eq v0, v1, :cond_1

    goto :goto_0

    .line 108
    :cond_1
    iget-object p0, p0, Lcom/tencent/liteav/d;->d:Lcom/tencent/liteav/k;

    invoke-interface {p0, p1}, Lcom/tencent/liteav/k;->f(I)V

    return-void

    .line 109
    :cond_2
    invoke-direct {p0, v1}, Lcom/tencent/liteav/d;->j(Z)V

    .line 110
    invoke-virtual {p0}, Lcom/tencent/liteav/d;->r()V

    :cond_3
    :goto_0
    return-void
.end method

.method public e(Z)Z
    .locals 1

    .line 111
    iget-object v0, p0, Lcom/tencent/liteav/d;->p:Lcom/tencent/liteav/g;

    iput-boolean p1, v0, Lcom/tencent/liteav/g;->S:Z

    .line 112
    iget-object p0, p0, Lcom/tencent/liteav/d;->d:Lcom/tencent/liteav/k;

    if-nez p0, :cond_0

    const/4 p0, 0x0

    return p0

    .line 113
    :cond_0
    invoke-interface {p0, p1}, Lcom/tencent/liteav/k;->c(Z)V

    const/4 p0, 0x1

    return p0
.end method

.method public f()V
    .locals 9

    .line 1
    iget v0, p0, Lcom/tencent/liteav/d;->s:I

    .line 2
    .line 3
    const-string v1, "TXCCaptureAndEnc"

    .line 4
    .line 5
    const/4 v2, 0x1

    .line 6
    if-eq v0, v2, :cond_0

    .line 7
    .line 8
    new-instance v0, Ljava/lang/StringBuilder;

    .line 9
    .line 10
    const-string v2, "ignore pause push when is not pushing, status:"

    .line 11
    .line 12
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    iget p0, p0, Lcom/tencent/liteav/d;->s:I

    .line 16
    .line 17
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    invoke-static {v1, p0}, Lcom/tencent/liteav/basic/log/TXCLog;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    return-void

    .line 28
    :cond_0
    const/4 v0, 0x2

    .line 29
    iput v0, p0, Lcom/tencent/liteav/d;->s:I

    .line 30
    .line 31
    const-string v0, "pausePusher"

    .line 32
    .line 33
    invoke-static {v1, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    iget-object v0, p0, Lcom/tencent/liteav/d;->p:Lcom/tencent/liteav/g;

    .line 37
    .line 38
    iget v0, v0, Lcom/tencent/liteav/g;->D:I

    .line 39
    .line 40
    and-int/2addr v0, v2

    .line 41
    if-ne v0, v2, :cond_2

    .line 42
    .line 43
    invoke-virtual {p0}, Lcom/tencent/liteav/d;->r()V

    .line 44
    .line 45
    .line 46
    iget-object v3, p0, Lcom/tencent/liteav/d;->a:Lcom/tencent/liteav/b;

    .line 47
    .line 48
    if-eqz v3, :cond_1

    .line 49
    .line 50
    iget-object v0, p0, Lcom/tencent/liteav/d;->p:Lcom/tencent/liteav/g;

    .line 51
    .line 52
    iget-boolean v1, v0, Lcom/tencent/liteav/g;->M:Z

    .line 53
    .line 54
    if-nez v1, :cond_1

    .line 55
    .line 56
    iget v4, v0, Lcom/tencent/liteav/g;->C:I

    .line 57
    .line 58
    iget v5, v0, Lcom/tencent/liteav/g;->B:I

    .line 59
    .line 60
    iget-object v6, v0, Lcom/tencent/liteav/g;->A:Landroid/graphics/Bitmap;

    .line 61
    .line 62
    iget-object v0, p0, Lcom/tencent/liteav/d;->h:Lcom/tencent/liteav/videoencoder/TXSVideoEncoderParam;

    .line 63
    .line 64
    iget v7, v0, Lcom/tencent/liteav/videoencoder/TXSVideoEncoderParam;->width:I

    .line 65
    .line 66
    iget v8, v0, Lcom/tencent/liteav/videoencoder/TXSVideoEncoderParam;->height:I

    .line 67
    .line 68
    invoke-virtual/range {v3 .. v8}, Lcom/tencent/liteav/b;->a(IILandroid/graphics/Bitmap;II)V

    .line 69
    .line 70
    .line 71
    :cond_1
    iget-object p0, p0, Lcom/tencent/liteav/d;->d:Lcom/tencent/liteav/k;

    .line 72
    .line 73
    if-eqz p0, :cond_2

    .line 74
    .line 75
    invoke-interface {p0}, Lcom/tencent/liteav/k;->c()V

    .line 76
    .line 77
    .line 78
    :cond_2
    return-void
.end method

.method public f(I)V
    .locals 2

    .line 80
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "setRenderMode "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "TXCCaptureAndEnc"

    invoke-static {v1, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 81
    iput p1, p0, Lcom/tencent/liteav/d;->v:I

    .line 82
    iget-object v0, p0, Lcom/tencent/liteav/d;->d:Lcom/tencent/liteav/k;

    if-eqz v0, :cond_0

    .line 83
    invoke-interface {v0, p1}, Lcom/tencent/liteav/k;->c(I)V

    .line 84
    :cond_0
    iget-object p1, p0, Lcom/tencent/liteav/d;->C:Lcom/tencent/liteav/basic/c/e;

    if-eqz p1, :cond_1

    .line 85
    iget p0, p0, Lcom/tencent/liteav/d;->v:I

    invoke-virtual {p1, p0}, Lcom/tencent/liteav/basic/c/e;->a(I)V

    :cond_1
    return-void
.end method

.method public f(Z)V
    .locals 1

    .line 86
    iget-boolean v0, p0, Lcom/tencent/liteav/d;->F:Z

    if-ne v0, p1, :cond_0

    return-void

    .line 87
    :cond_0
    iput-boolean p1, p0, Lcom/tencent/liteav/d;->F:Z

    .line 88
    new-instance p1, Ljava/lang/StringBuilder;

    const-string v0, "trtc_api onVideoConfigChanged enableRps "

    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-boolean v0, p0, Lcom/tencent/liteav/d;->F:Z

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string v0, "TXCCaptureAndEnc"

    invoke-static {v0, p1}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 89
    iget-boolean p1, p0, Lcom/tencent/liteav/d;->F:Z

    if-eqz p1, :cond_1

    iget-object p1, p0, Lcom/tencent/liteav/d;->p:Lcom/tencent/liteav/g;

    const/4 v0, 0x0

    iput v0, p1, Lcom/tencent/liteav/g;->j:I

    .line 90
    :cond_1
    invoke-virtual {p0}, Lcom/tencent/liteav/d;->r()V

    return-void
.end method

.method public g()V
    .locals 3

    .line 1
    iget v0, p0, Lcom/tencent/liteav/d;->s:I

    .line 2
    .line 3
    const/4 v1, 0x2

    .line 4
    const-string v2, "TXCCaptureAndEnc"

    .line 5
    .line 6
    if-eq v0, v1, :cond_0

    .line 7
    .line 8
    new-instance v0, Ljava/lang/StringBuilder;

    .line 9
    .line 10
    const-string v1, "ignore resume push when is not pause, status:"

    .line 11
    .line 12
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    iget p0, p0, Lcom/tencent/liteav/d;->s:I

    .line 16
    .line 17
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    invoke-static {v2, p0}, Lcom/tencent/liteav/basic/log/TXCLog;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    return-void

    .line 28
    :cond_0
    const/4 v0, 0x1

    .line 29
    iput v0, p0, Lcom/tencent/liteav/d;->s:I

    .line 30
    .line 31
    const-string v1, "resumePusher"

    .line 32
    .line 33
    invoke-static {v2, v1}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    iget-object v1, p0, Lcom/tencent/liteav/d;->p:Lcom/tencent/liteav/g;

    .line 37
    .line 38
    iget v2, v1, Lcom/tencent/liteav/g;->D:I

    .line 39
    .line 40
    and-int/2addr v2, v0

    .line 41
    if-ne v2, v0, :cond_3

    .line 42
    .line 43
    iget-object v0, p0, Lcom/tencent/liteav/d;->a:Lcom/tencent/liteav/b;

    .line 44
    .line 45
    if-eqz v0, :cond_1

    .line 46
    .line 47
    iget-boolean v1, v1, Lcom/tencent/liteav/g;->M:Z

    .line 48
    .line 49
    if-nez v1, :cond_1

    .line 50
    .line 51
    invoke-virtual {v0}, Lcom/tencent/liteav/b;->b()V

    .line 52
    .line 53
    .line 54
    :cond_1
    invoke-virtual {p0}, Lcom/tencent/liteav/d;->r()V

    .line 55
    .line 56
    .line 57
    iget-object v0, p0, Lcom/tencent/liteav/d;->d:Lcom/tencent/liteav/k;

    .line 58
    .line 59
    if-eqz v0, :cond_2

    .line 60
    .line 61
    invoke-interface {v0}, Lcom/tencent/liteav/k;->b()V

    .line 62
    .line 63
    .line 64
    :cond_2
    invoke-direct {p0}, Lcom/tencent/liteav/d;->y()V

    .line 65
    .line 66
    .line 67
    :cond_3
    return-void
.end method

.method public g(I)V
    .locals 2

    .line 69
    iget v0, p0, Lcom/tencent/liteav/d;->u:I

    if-eq v0, p1, :cond_0

    .line 70
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "vrotation setRenderRotation "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "TXCCaptureAndEnc"

    invoke-static {v1, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 71
    :cond_0
    iput p1, p0, Lcom/tencent/liteav/d;->u:I

    .line 72
    iget-object p0, p0, Lcom/tencent/liteav/d;->d:Lcom/tencent/liteav/k;

    if-nez p0, :cond_1

    return-void

    .line 73
    :cond_1
    invoke-interface {p0, p1}, Lcom/tencent/liteav/k;->b(I)V

    return-void
.end method

.method public g(Z)V
    .locals 0

    .line 74
    iput-boolean p1, p0, Lcom/tencent/liteav/d;->g:Z

    return-void
.end method

.method public h(Z)V
    .locals 0

    .line 14
    iput-boolean p1, p0, Lcom/tencent/liteav/d;->G:Z

    return-void
.end method

.method public h()Z
    .locals 0

    .line 12
    iget-boolean p0, p0, Lcom/tencent/liteav/d;->t:Z

    return p0
.end method

.method public h(I)Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/liteav/d;->d:Lcom/tencent/liteav/k;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    return p0

    .line 7
    :cond_0
    invoke-interface {p0, p1}, Lcom/tencent/liteav/k;->a(I)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public i(I)V
    .locals 0

    .line 89
    iput p1, p0, Lcom/tencent/liteav/d;->E:I

    .line 90
    iget-object p0, p0, Lcom/tencent/liteav/d;->d:Lcom/tencent/liteav/k;

    if-eqz p0, :cond_0

    .line 91
    invoke-interface {p0, p1}, Lcom/tencent/liteav/k;->g(I)V

    :cond_0
    return-void
.end method

.method public i()Z
    .locals 0

    .line 87
    iget p0, p0, Lcom/tencent/liteav/d;->s:I

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method public j()V
    .locals 2

    .line 20
    iget-object v0, p0, Lcom/tencent/liteav/d;->d:Lcom/tencent/liteav/k;

    if-nez v0, :cond_0

    return-void

    .line 21
    :cond_0
    new-instance v1, Lcom/tencent/liteav/d$21;

    invoke-direct {v1, p0}, Lcom/tencent/liteav/d$21;-><init>(Lcom/tencent/liteav/d;)V

    invoke-interface {v0, v1}, Lcom/tencent/liteav/k;->a(Ljava/lang/Runnable;)V

    return-void
.end method

.method public j(I)V
    .locals 1

    .line 1
    const/4 v0, 0x2

    .line 2
    if-ne p1, v0, :cond_0

    .line 3
    .line 4
    iget-object p0, p0, Lcom/tencent/liteav/d;->i:Lcom/tencent/liteav/videoencoder/b;

    .line 5
    .line 6
    goto :goto_0

    .line 7
    :cond_0
    const/4 v0, 0x3

    .line 8
    if-ne p1, v0, :cond_1

    .line 9
    .line 10
    iget-object p0, p0, Lcom/tencent/liteav/d;->m:Lcom/tencent/liteav/videoencoder/b;

    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_1
    const/4 p0, 0x0

    .line 14
    :goto_0
    if-eqz p0, :cond_2

    .line 15
    .line 16
    invoke-virtual {p0}, Lcom/tencent/liteav/videoencoder/b;->b()V

    .line 17
    .line 18
    .line 19
    :cond_2
    return-void
.end method

.method public k()V
    .locals 2

    .line 48
    iget-object v0, p0, Lcom/tencent/liteav/d;->d:Lcom/tencent/liteav/k;

    if-nez v0, :cond_0

    return-void

    .line 49
    :cond_0
    iget-object v0, p0, Lcom/tencent/liteav/d;->V:Lcom/tencent/liteav/beauty/b;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/tencent/liteav/beauty/b;->a(Z)V

    .line 50
    invoke-direct {p0, v1}, Lcom/tencent/liteav/d;->i(Z)V

    return-void
.end method

.method public k(I)V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/tencent/liteav/d;->h:Lcom/tencent/liteav/videoencoder/TXSVideoEncoderParam;

    .line 2
    .line 3
    iget v1, v0, Lcom/tencent/liteav/videoencoder/TXSVideoEncoderParam;->width:I

    .line 4
    .line 5
    iget v0, v0, Lcom/tencent/liteav/videoencoder/TXSVideoEncoderParam;->height:I

    .line 6
    .line 7
    mul-int v2, v1, v0

    .line 8
    .line 9
    const v3, 0x7e900

    .line 10
    .line 11
    .line 12
    const/4 v4, 0x0

    .line 13
    if-ge v2, v3, :cond_0

    .line 14
    .line 15
    iget-object v0, p0, Lcom/tencent/liteav/d;->p:Lcom/tencent/liteav/g;

    .line 16
    .line 17
    iput v4, v0, Lcom/tencent/liteav/g;->j:I

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    mul-int/2addr v1, v0

    .line 21
    const v0, 0xe1000

    .line 22
    .line 23
    .line 24
    if-ge v1, v0, :cond_1

    .line 25
    .line 26
    iget-boolean v0, p0, Lcom/tencent/liteav/d;->f:Z

    .line 27
    .line 28
    if-eqz v0, :cond_1

    .line 29
    .line 30
    iget-object v0, p0, Lcom/tencent/liteav/d;->p:Lcom/tencent/liteav/g;

    .line 31
    .line 32
    iput v4, v0, Lcom/tencent/liteav/g;->j:I

    .line 33
    .line 34
    :cond_1
    :goto_0
    const/4 v0, 0x3

    .line 35
    if-ne p1, v0, :cond_2

    .line 36
    .line 37
    invoke-virtual {p0}, Lcom/tencent/liteav/d;->t()V

    .line 38
    .line 39
    .line 40
    return-void

    .line 41
    :cond_2
    const/4 p1, 0x1

    .line 42
    iput-boolean p1, p0, Lcom/tencent/liteav/d;->f:Z

    .line 43
    .line 44
    invoke-virtual {p0}, Lcom/tencent/liteav/d;->s()V

    .line 45
    .line 46
    .line 47
    return-void
.end method

.method public l(I)V
    .locals 0

    .line 13
    return-void
.end method

.method public l()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/liteav/d;->d:Lcom/tencent/liteav/k;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Lcom/tencent/liteav/k;->h()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return p0
.end method

.method public m(I)V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    if-ge p1, v0, :cond_0

    .line 3
    .line 4
    move p1, v0

    .line 5
    :cond_0
    const/4 v0, 0x2

    .line 6
    if-le p1, v0, :cond_1

    .line 7
    .line 8
    move p1, v0

    .line 9
    :cond_1
    new-instance v0, Lcom/tencent/liteav/d$17;

    .line 10
    .line 11
    invoke-direct {v0, p0, p1}, Lcom/tencent/liteav/d$17;-><init>(Lcom/tencent/liteav/d;I)V

    .line 12
    .line 13
    .line 14
    iget-object p0, p0, Lcom/tencent/liteav/d;->d:Lcom/tencent/liteav/k;

    .line 15
    .line 16
    if-nez p0, :cond_2

    .line 17
    .line 18
    invoke-interface {v0}, Ljava/lang/Runnable;->run()V

    .line 19
    .line 20
    .line 21
    return-void

    .line 22
    :cond_2
    invoke-interface {p0, v0}, Lcom/tencent/liteav/k;->a(Ljava/lang/Runnable;)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public m()Z
    .locals 0

    .line 26
    iget-object p0, p0, Lcom/tencent/liteav/d;->d:Lcom/tencent/liteav/k;

    if-eqz p0, :cond_0

    .line 27
    invoke-interface {p0}, Lcom/tencent/liteav/k;->i()Z

    move-result p0

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method public n()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/liteav/d;->d:Lcom/tencent/liteav/k;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Lcom/tencent/liteav/k;->j()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return p0
.end method

.method public o()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/liteav/d;->d:Lcom/tencent/liteav/k;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Lcom/tencent/liteav/k;->k()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return p0
.end method

.method public onNotifyEvent(ILandroid/os/Bundle;)V
    .locals 24

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move/from16 v1, p1

    .line 4
    .line 5
    move-object/from16 v2, p2

    .line 6
    .line 7
    if-eqz v2, :cond_0

    .line 8
    .line 9
    const-string v3, "EVT_USERID"

    .line 10
    .line 11
    invoke-virtual {v0}, Lcom/tencent/liteav/basic/module/a;->getID()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v4

    .line 15
    invoke-virtual {v2, v3, v4}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    :cond_0
    iget-object v3, v0, Lcom/tencent/liteav/d;->W:Ljava/lang/ref/WeakReference;

    .line 19
    .line 20
    invoke-static {v3, v1, v2}, Lcom/tencent/liteav/basic/util/f;->a(Ljava/lang/ref/WeakReference;ILandroid/os/Bundle;)V

    .line 21
    .line 22
    .line 23
    const-wide/16 v2, 0x1

    .line 24
    .line 25
    const-wide/16 v4, 0x0

    .line 26
    .line 27
    const/16 v6, -0x522

    .line 28
    .line 29
    const/16 v7, -0x525

    .line 30
    .line 31
    if-ne v1, v7, :cond_1

    .line 32
    .line 33
    invoke-virtual {v0}, Lcom/tencent/liteav/basic/module/a;->getID()Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object v8

    .line 37
    const-string v14, ""

    .line 38
    .line 39
    iget v15, v0, Lcom/tencent/liteav/d;->E:I

    .line 40
    .line 41
    const/16 v9, 0x7d2

    .line 42
    .line 43
    const-wide/16 v10, 0x4

    .line 44
    .line 45
    const-wide/16 v12, -0x1

    .line 46
    .line 47
    invoke-static/range {v8 .. v15}, Lcom/tencent/liteav/basic/module/TXCEventRecorderProxy;->a(Ljava/lang/String;IJJLjava/lang/String;I)V

    .line 48
    .line 49
    .line 50
    goto :goto_1

    .line 51
    :cond_1
    if-ne v1, v6, :cond_2

    .line 52
    .line 53
    invoke-virtual {v0}, Lcom/tencent/liteav/basic/module/a;->getID()Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object v16

    .line 57
    const-string v22, ""

    .line 58
    .line 59
    iget v8, v0, Lcom/tencent/liteav/d;->E:I

    .line 60
    .line 61
    const/16 v17, 0x7d2

    .line 62
    .line 63
    const-wide/16 v18, 0x5

    .line 64
    .line 65
    const-wide/16 v20, -0x1

    .line 66
    .line 67
    move/from16 v23, v8

    .line 68
    .line 69
    invoke-static/range {v16 .. v23}, Lcom/tencent/liteav/basic/module/TXCEventRecorderProxy;->a(Ljava/lang/String;IJJLjava/lang/String;I)V

    .line 70
    .line 71
    .line 72
    goto :goto_1

    .line 73
    :cond_2
    const/16 v8, 0x3eb

    .line 74
    .line 75
    if-ne v1, v8, :cond_4

    .line 76
    .line 77
    iget-object v8, v0, Lcom/tencent/liteav/d;->d:Lcom/tencent/liteav/k;

    .line 78
    .line 79
    if-eqz v8, :cond_5

    .line 80
    .line 81
    invoke-virtual {v0}, Lcom/tencent/liteav/basic/module/a;->getID()Ljava/lang/String;

    .line 82
    .line 83
    .line 84
    move-result-object v9

    .line 85
    iget-object v8, v0, Lcom/tencent/liteav/d;->d:Lcom/tencent/liteav/k;

    .line 86
    .line 87
    invoke-interface {v8}, Lcom/tencent/liteav/k;->l()Z

    .line 88
    .line 89
    .line 90
    move-result v8

    .line 91
    if-eqz v8, :cond_3

    .line 92
    .line 93
    move-wide v11, v4

    .line 94
    goto :goto_0

    .line 95
    :cond_3
    move-wide v11, v2

    .line 96
    :goto_0
    const-string v15, ""

    .line 97
    .line 98
    iget v8, v0, Lcom/tencent/liteav/d;->E:I

    .line 99
    .line 100
    const/16 v10, 0xfa1

    .line 101
    .line 102
    const-wide/16 v13, -0x1

    .line 103
    .line 104
    move/from16 v16, v8

    .line 105
    .line 106
    invoke-static/range {v9 .. v16}, Lcom/tencent/liteav/basic/module/TXCEventRecorderProxy;->a(Ljava/lang/String;IJJLjava/lang/String;I)V

    .line 107
    .line 108
    .line 109
    goto :goto_1

    .line 110
    :cond_4
    const/16 v8, -0x51c

    .line 111
    .line 112
    if-ne v1, v8, :cond_5

    .line 113
    .line 114
    invoke-virtual {v0}, Lcom/tencent/liteav/d;->k()V

    .line 115
    .line 116
    .line 117
    :cond_5
    :goto_1
    const/16 v8, -0x516

    .line 118
    .line 119
    if-eq v1, v8, :cond_a

    .line 120
    .line 121
    if-eq v1, v7, :cond_a

    .line 122
    .line 123
    const/16 v7, -0x526

    .line 124
    .line 125
    if-eq v1, v7, :cond_a

    .line 126
    .line 127
    const/16 v7, -0x527

    .line 128
    .line 129
    if-ne v1, v7, :cond_6

    .line 130
    .line 131
    goto :goto_3

    .line 132
    :cond_6
    const/16 v7, -0x515

    .line 133
    .line 134
    if-eq v1, v7, :cond_7

    .line 135
    .line 136
    if-eq v1, v6, :cond_7

    .line 137
    .line 138
    const/16 v6, -0x523

    .line 139
    .line 140
    if-eq v1, v6, :cond_7

    .line 141
    .line 142
    const/16 v6, -0x524

    .line 143
    .line 144
    if-ne v1, v6, :cond_9

    .line 145
    .line 146
    :cond_7
    const/16 v6, 0x7533

    .line 147
    .line 148
    invoke-static {v6, v1}, Lcom/tencent/liteav/basic/module/TXCKeyPointReportProxy;->b(II)V

    .line 149
    .line 150
    .line 151
    iget-object v6, v0, Lcom/tencent/liteav/d;->d:Lcom/tencent/liteav/k;

    .line 152
    .line 153
    if-eqz v6, :cond_9

    .line 154
    .line 155
    invoke-virtual {v0}, Lcom/tencent/liteav/basic/module/a;->getID()Ljava/lang/String;

    .line 156
    .line 157
    .line 158
    move-result-object v7

    .line 159
    iget-object v6, v0, Lcom/tencent/liteav/d;->d:Lcom/tencent/liteav/k;

    .line 160
    .line 161
    invoke-interface {v6}, Lcom/tencent/liteav/k;->l()Z

    .line 162
    .line 163
    .line 164
    move-result v6

    .line 165
    if-eqz v6, :cond_8

    .line 166
    .line 167
    move-wide v9, v4

    .line 168
    goto :goto_2

    .line 169
    :cond_8
    move-wide v9, v2

    .line 170
    :goto_2
    int-to-long v11, v1

    .line 171
    const-string v13, ""

    .line 172
    .line 173
    iget v14, v0, Lcom/tencent/liteav/d;->E:I

    .line 174
    .line 175
    const/16 v8, 0xfa2

    .line 176
    .line 177
    invoke-static/range {v7 .. v14}, Lcom/tencent/liteav/basic/module/TXCEventRecorderProxy;->a(Ljava/lang/String;IJJLjava/lang/String;I)V

    .line 178
    .line 179
    .line 180
    :cond_9
    return-void

    .line 181
    :cond_a
    :goto_3
    const/16 v0, 0x7532

    .line 182
    .line 183
    invoke-static {v0, v1}, Lcom/tencent/liteav/basic/module/TXCKeyPointReportProxy;->b(II)V

    .line 184
    .line 185
    .line 186
    return-void
.end method

.method public p()V
    .locals 2

    .line 1
    :try_start_0
    iget-object v0, p0, Lcom/tencent/liteav/d;->e:Lcom/tencent/liteav/beauty/d;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/tencent/liteav/beauty/d;->b()V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object v0, p0, Lcom/tencent/liteav/d;->N:Lcom/tencent/liteav/basic/c/h;

    .line 9
    .line 10
    const/4 v1, 0x0

    .line 11
    if-eqz v0, :cond_1

    .line 12
    .line 13
    invoke-virtual {v0}, Lcom/tencent/liteav/basic/c/h;->d()V

    .line 14
    .line 15
    .line 16
    iput-object v1, p0, Lcom/tencent/liteav/d;->N:Lcom/tencent/liteav/basic/c/h;

    .line 17
    .line 18
    :cond_1
    iget-object v0, p0, Lcom/tencent/liteav/d;->P:Lcom/tencent/liteav/basic/c/h;

    .line 19
    .line 20
    if-eqz v0, :cond_2

    .line 21
    .line 22
    invoke-virtual {v0}, Lcom/tencent/liteav/basic/c/h;->d()V

    .line 23
    .line 24
    .line 25
    iput-object v1, p0, Lcom/tencent/liteav/d;->P:Lcom/tencent/liteav/basic/c/h;

    .line 26
    .line 27
    :cond_2
    iget-object v0, p0, Lcom/tencent/liteav/d;->O:Lcom/tencent/liteav/basic/c/h;

    .line 28
    .line 29
    if-eqz v0, :cond_3

    .line 30
    .line 31
    invoke-virtual {v0}, Lcom/tencent/liteav/basic/c/h;->d()V

    .line 32
    .line 33
    .line 34
    iput-object v1, p0, Lcom/tencent/liteav/d;->O:Lcom/tencent/liteav/basic/c/h;

    .line 35
    .line 36
    :cond_3
    invoke-direct {p0}, Lcom/tencent/liteav/d;->x()V

    .line 37
    .line 38
    .line 39
    invoke-direct {p0}, Lcom/tencent/liteav/d;->w()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 40
    .line 41
    .line 42
    return-void

    .line 43
    :catch_0
    move-exception p0

    .line 44
    const-string v0, "TXCCaptureAndEnc"

    .line 45
    .line 46
    const-string v1, "stop preprocessor and encoder failed."

    .line 47
    .line 48
    invoke-static {v0, v1, p0}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 49
    .line 50
    .line 51
    return-void
.end method

.method public q()V
    .locals 2

    .line 1
    const-string v0, "TXCCaptureAndEnc"

    .line 2
    .line 3
    const-string v1, "onCaptureDestroy->enter "

    .line 4
    .line 5
    invoke-static {v0, v1}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/tencent/liteav/d;->e:Lcom/tencent/liteav/beauty/d;

    .line 9
    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    invoke-virtual {v0}, Lcom/tencent/liteav/beauty/d;->b()V

    .line 13
    .line 14
    .line 15
    :cond_0
    iget-object v0, p0, Lcom/tencent/liteav/d;->N:Lcom/tencent/liteav/basic/c/h;

    .line 16
    .line 17
    const/4 v1, 0x0

    .line 18
    if-eqz v0, :cond_1

    .line 19
    .line 20
    invoke-virtual {v0}, Lcom/tencent/liteav/basic/c/h;->d()V

    .line 21
    .line 22
    .line 23
    iput-object v1, p0, Lcom/tencent/liteav/d;->N:Lcom/tencent/liteav/basic/c/h;

    .line 24
    .line 25
    :cond_1
    iget-object v0, p0, Lcom/tencent/liteav/d;->P:Lcom/tencent/liteav/basic/c/h;

    .line 26
    .line 27
    if-eqz v0, :cond_2

    .line 28
    .line 29
    invoke-virtual {v0}, Lcom/tencent/liteav/basic/c/h;->d()V

    .line 30
    .line 31
    .line 32
    iput-object v1, p0, Lcom/tencent/liteav/d;->P:Lcom/tencent/liteav/basic/c/h;

    .line 33
    .line 34
    :cond_2
    iget-object v0, p0, Lcom/tencent/liteav/d;->O:Lcom/tencent/liteav/basic/c/h;

    .line 35
    .line 36
    if-eqz v0, :cond_3

    .line 37
    .line 38
    invoke-virtual {v0}, Lcom/tencent/liteav/basic/c/h;->d()V

    .line 39
    .line 40
    .line 41
    iput-object v1, p0, Lcom/tencent/liteav/d;->O:Lcom/tencent/liteav/basic/c/h;

    .line 42
    .line 43
    :cond_3
    iget-object v0, p0, Lcom/tencent/liteav/d;->Q:Lcom/tencent/liteav/beauty/b/k;

    .line 44
    .line 45
    if-eqz v0, :cond_4

    .line 46
    .line 47
    invoke-virtual {v0}, Lcom/tencent/liteav/basic/c/h;->d()V

    .line 48
    .line 49
    .line 50
    iput-object v1, p0, Lcom/tencent/liteav/d;->Q:Lcom/tencent/liteav/beauty/b/k;

    .line 51
    .line 52
    :cond_4
    invoke-direct {p0}, Lcom/tencent/liteav/d;->x()V

    .line 53
    .line 54
    .line 55
    invoke-direct {p0}, Lcom/tencent/liteav/d;->w()V

    .line 56
    .line 57
    .line 58
    iget-object p0, p0, Lcom/tencent/liteav/d;->X:Ljava/lang/ref/WeakReference;

    .line 59
    .line 60
    if-eqz p0, :cond_5

    .line 61
    .line 62
    invoke-virtual {p0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 63
    .line 64
    .line 65
    move-result-object p0

    .line 66
    check-cast p0, Lcom/tencent/liteav/m;

    .line 67
    .line 68
    if-eqz p0, :cond_5

    .line 69
    .line 70
    invoke-interface {p0}, Lcom/tencent/liteav/m;->a()V

    .line 71
    .line 72
    .line 73
    :cond_5
    return-void
.end method

.method public r()V
    .locals 2

    .line 1
    new-instance v0, Lcom/tencent/liteav/d$10;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lcom/tencent/liteav/d$10;-><init>(Lcom/tencent/liteav/d;)V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/tencent/liteav/d;->d:Lcom/tencent/liteav/k;

    .line 7
    .line 8
    if-eqz v1, :cond_0

    .line 9
    .line 10
    invoke-interface {v1, v0}, Lcom/tencent/liteav/k;->a(Ljava/lang/Runnable;)V

    .line 11
    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    iget-object p0, p0, Lcom/tencent/liteav/d;->n:Ljava/lang/Object;

    .line 15
    .line 16
    monitor-enter p0

    .line 17
    :try_start_0
    invoke-interface {v0}, Ljava/lang/Runnable;->run()V

    .line 18
    .line 19
    .line 20
    monitor-exit p0

    .line 21
    return-void

    .line 22
    :catchall_0
    move-exception v0

    .line 23
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 24
    throw v0
.end method

.method public s()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/tencent/liteav/d;->i:Lcom/tencent/liteav/videoencoder/b;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iget-object v0, p0, Lcom/tencent/liteav/d;->d:Lcom/tencent/liteav/k;

    .line 7
    .line 8
    if-eqz v0, :cond_1

    .line 9
    .line 10
    new-instance v1, Lcom/tencent/liteav/d$11;

    .line 11
    .line 12
    invoke-direct {v1, p0}, Lcom/tencent/liteav/d$11;-><init>(Lcom/tencent/liteav/d;)V

    .line 13
    .line 14
    .line 15
    invoke-interface {v0, v1}, Lcom/tencent/liteav/k;->a(Ljava/lang/Runnable;)V

    .line 16
    .line 17
    .line 18
    return-void

    .line 19
    :cond_1
    invoke-direct {p0}, Lcom/tencent/liteav/d;->x()V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public setID(Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Lcom/tencent/liteav/basic/module/a;->setID(Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/tencent/liteav/d;->i:Lcom/tencent/liteav/videoencoder/b;

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    invoke-virtual {v0, p1}, Lcom/tencent/liteav/videoencoder/b;->setID(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    :cond_0
    iget-object v0, p0, Lcom/tencent/liteav/d;->m:Lcom/tencent/liteav/videoencoder/b;

    .line 12
    .line 13
    if-eqz v0, :cond_1

    .line 14
    .line 15
    invoke-virtual {v0, p1}, Lcom/tencent/liteav/videoencoder/b;->setID(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    :cond_1
    iget-object v0, p0, Lcom/tencent/liteav/d;->e:Lcom/tencent/liteav/beauty/d;

    .line 19
    .line 20
    if-eqz v0, :cond_2

    .line 21
    .line 22
    invoke-virtual {v0, p1}, Lcom/tencent/liteav/beauty/d;->setID(Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    :cond_2
    iget-object v0, p0, Lcom/tencent/liteav/d;->d:Lcom/tencent/liteav/k;

    .line 26
    .line 27
    if-eqz v0, :cond_3

    .line 28
    .line 29
    invoke-virtual {p0}, Lcom/tencent/liteav/basic/module/a;->getID()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    invoke-interface {v0, p0}, Lcom/tencent/liteav/k;->a(Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    :cond_3
    new-instance p0, Ljava/lang/StringBuilder;

    .line 37
    .line 38
    const-string v0, "setID:"

    .line 39
    .line 40
    invoke-direct {p0, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 44
    .line 45
    .line 46
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    const-string p1, "TXCCaptureAndEnc"

    .line 51
    .line 52
    invoke-static {p1, p0}, Lcom/tencent/liteav/basic/log/TXCLog;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 53
    .line 54
    .line 55
    return-void
.end method

.method public t()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/tencent/liteav/d;->m:Lcom/tencent/liteav/videoencoder/b;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iget-object v0, p0, Lcom/tencent/liteav/d;->d:Lcom/tencent/liteav/k;

    .line 7
    .line 8
    if-eqz v0, :cond_1

    .line 9
    .line 10
    new-instance v1, Lcom/tencent/liteav/d$13;

    .line 11
    .line 12
    invoke-direct {v1, p0}, Lcom/tencent/liteav/d$13;-><init>(Lcom/tencent/liteav/d;)V

    .line 13
    .line 14
    .line 15
    invoke-interface {v0, v1}, Lcom/tencent/liteav/k;->a(Ljava/lang/Runnable;)V

    .line 16
    .line 17
    .line 18
    return-void

    .line 19
    :cond_1
    invoke-direct {p0}, Lcom/tencent/liteav/d;->w()V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.class Lcom/tencent/liteav/beauty/c;
.super Landroid/os/HandlerThread;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/tencent/liteav/beauty/c$a;
    }
.end annotation


# instance fields
.field private A:I

.field private B:I

.field private C:I

.field private D:I

.field private E:Landroid/content/Context;

.field private F:Z

.field private G:Z

.field private H:Lcom/tencent/liteav/beauty/d$e;

.field private I:Lcom/tencent/liteav/beauty/d$f;

.field private J:I

.field private K:I

.field private L:I

.field private M:I

.field private N:I

.field private O:I

.field private P:F

.field private Q:I

.field private R:I

.field private S:I

.field private T:Z

.field private U:[F

.field private V:Z

.field private W:I

.field private X:I

.field private Y:Lcom/tencent/liteav/basic/c/a;

.field private Z:Landroid/graphics/Bitmap;

.field a:Z

.field private aA:Lcom/tencent/liteav/beauty/c$a;

.field private aB:F

.field private aC:I

.field private aD:I

.field private aE:I

.field private aF:I

.field private aG:I

.field private aH:Z

.field private aI:Lcom/tencent/liteav/beauty/a/a/c;

.field private aJ:Lcom/tencent/liteav/beauty/a/a/a;

.field private aK:Landroid/graphics/Bitmap;

.field private aL:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/tencent/liteav/beauty/d$f;",
            ">;"
        }
    .end annotation
.end field

.field private aM:J

.field private aN:I

.field private final aO:I

.field private final aP:F

.field private aQ:[B

.field private aR:[I

.field private aS:Z

.field private aT:[B

.field private aU:I

.field private aV:I

.field private aW:I

.field private aX:I

.field private aY:Lcom/tencent/liteav/beauty/e;

.field private aZ:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Lcom/tencent/liteav/basic/b/b;",
            ">;"
        }
    .end annotation
.end field

.field private aa:Lcom/tencent/liteav/beauty/b/k;

.field private ab:Lcom/tencent/liteav/beauty/b/p;

.field private ac:Lcom/tencent/liteav/beauty/b/b;

.field private ad:Lcom/tencent/liteav/beauty/b/a/a;

.field private ae:Lcom/tencent/liteav/beauty/b/b/a;

.field private af:Lcom/tencent/liteav/beauty/b/c;

.field private ag:Lcom/tencent/liteav/beauty/b/c/a;

.field private ah:Landroid/graphics/Bitmap;

.field private ai:Landroid/graphics/Bitmap;

.field private aj:F

.field private ak:F

.field private al:F

.field private am:Lcom/tencent/liteav/beauty/b/m;

.field private an:Lcom/tencent/liteav/beauty/b/n;

.field private ao:Lcom/tencent/liteav/beauty/b/z;

.field private ap:Lcom/tencent/liteav/beauty/b/j;

.field private aq:Lcom/tencent/liteav/beauty/b/i;

.field private ar:Lcom/tencent/liteav/basic/c/h;

.field private as:Lcom/tencent/liteav/beauty/b/l;

.field private at:Lcom/tencent/liteav/basic/c/i;

.field private au:Lcom/tencent/liteav/basic/c/h;

.field private final av:Ljava/util/Queue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Queue<",
            "Ljava/lang/Runnable;",
            ">;"
        }
    .end annotation
.end field

.field private aw:Z

.field private ax:Ljava/lang/Object;

.field private ay:Ljava/lang/Object;

.field private az:Landroid/os/Handler;

.field protected b:[I

.field private ba:Lcom/tencent/liteav/basic/c/j$b;

.field protected c:[I

.field d:Lcom/tencent/liteav/beauty/b/a;

.field e:Lcom/tencent/liteav/beauty/b/a;

.field f:Lcom/tencent/liteav/beauty/b/a;

.field private g:I

.field private h:I

.field private i:I

.field private j:I

.field private k:I

.field private l:I

.field private m:I

.field private n:I

.field private o:I

.field private p:I

.field private q:I

.field private r:I

.field private s:I

.field private t:I

.field private u:I

.field private v:I

.field private w:I

.field private x:I

.field private y:I

.field private z:I


# direct methods
.method public constructor <init>(Landroid/content/Context;Z)V
    .locals 6

    .line 1
    const-string v0, "TXCFilterDrawer"

    .line 2
    .line 3
    invoke-direct {p0, v0}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    iput v0, p0, Lcom/tencent/liteav/beauty/c;->g:I

    .line 8
    .line 9
    iput v0, p0, Lcom/tencent/liteav/beauty/c;->h:I

    .line 10
    .line 11
    iput v0, p0, Lcom/tencent/liteav/beauty/c;->i:I

    .line 12
    .line 13
    iput v0, p0, Lcom/tencent/liteav/beauty/c;->j:I

    .line 14
    .line 15
    iput v0, p0, Lcom/tencent/liteav/beauty/c;->k:I

    .line 16
    .line 17
    iput v0, p0, Lcom/tencent/liteav/beauty/c;->l:I

    .line 18
    .line 19
    iput v0, p0, Lcom/tencent/liteav/beauty/c;->m:I

    .line 20
    .line 21
    iput v0, p0, Lcom/tencent/liteav/beauty/c;->n:I

    .line 22
    .line 23
    iput v0, p0, Lcom/tencent/liteav/beauty/c;->o:I

    .line 24
    .line 25
    iput v0, p0, Lcom/tencent/liteav/beauty/c;->p:I

    .line 26
    .line 27
    iput v0, p0, Lcom/tencent/liteav/beauty/c;->q:I

    .line 28
    .line 29
    iput v0, p0, Lcom/tencent/liteav/beauty/c;->r:I

    .line 30
    .line 31
    iput v0, p0, Lcom/tencent/liteav/beauty/c;->s:I

    .line 32
    .line 33
    iput v0, p0, Lcom/tencent/liteav/beauty/c;->t:I

    .line 34
    .line 35
    iput v0, p0, Lcom/tencent/liteav/beauty/c;->u:I

    .line 36
    .line 37
    iput v0, p0, Lcom/tencent/liteav/beauty/c;->v:I

    .line 38
    .line 39
    iput v0, p0, Lcom/tencent/liteav/beauty/c;->w:I

    .line 40
    .line 41
    iput v0, p0, Lcom/tencent/liteav/beauty/c;->x:I

    .line 42
    .line 43
    iput v0, p0, Lcom/tencent/liteav/beauty/c;->y:I

    .line 44
    .line 45
    iput v0, p0, Lcom/tencent/liteav/beauty/c;->z:I

    .line 46
    .line 47
    iput v0, p0, Lcom/tencent/liteav/beauty/c;->A:I

    .line 48
    .line 49
    iput v0, p0, Lcom/tencent/liteav/beauty/c;->B:I

    .line 50
    .line 51
    iput v0, p0, Lcom/tencent/liteav/beauty/c;->C:I

    .line 52
    .line 53
    iput v0, p0, Lcom/tencent/liteav/beauty/c;->D:I

    .line 54
    .line 55
    const/4 v1, 0x0

    .line 56
    iput-object v1, p0, Lcom/tencent/liteav/beauty/c;->E:Landroid/content/Context;

    .line 57
    .line 58
    const/4 v2, 0x1

    .line 59
    iput-boolean v2, p0, Lcom/tencent/liteav/beauty/c;->F:Z

    .line 60
    .line 61
    iput-boolean v0, p0, Lcom/tencent/liteav/beauty/c;->G:Z

    .line 62
    .line 63
    new-instance v3, Lcom/tencent/liteav/beauty/d$e;

    .line 64
    .line 65
    invoke-direct {v3}, Lcom/tencent/liteav/beauty/d$e;-><init>()V

    .line 66
    .line 67
    .line 68
    iput-object v3, p0, Lcom/tencent/liteav/beauty/c;->H:Lcom/tencent/liteav/beauty/d$e;

    .line 69
    .line 70
    iput-object v1, p0, Lcom/tencent/liteav/beauty/c;->I:Lcom/tencent/liteav/beauty/d$f;

    .line 71
    .line 72
    const/4 v3, -0x1

    .line 73
    iput v3, p0, Lcom/tencent/liteav/beauty/c;->J:I

    .line 74
    .line 75
    iput v3, p0, Lcom/tencent/liteav/beauty/c;->K:I

    .line 76
    .line 77
    iput v3, p0, Lcom/tencent/liteav/beauty/c;->L:I

    .line 78
    .line 79
    iput v3, p0, Lcom/tencent/liteav/beauty/c;->M:I

    .line 80
    .line 81
    iput v3, p0, Lcom/tencent/liteav/beauty/c;->N:I

    .line 82
    .line 83
    iput v3, p0, Lcom/tencent/liteav/beauty/c;->O:I

    .line 84
    .line 85
    const/high16 v4, 0x3f800000    # 1.0f

    .line 86
    .line 87
    iput v4, p0, Lcom/tencent/liteav/beauty/c;->P:F

    .line 88
    .line 89
    iput v3, p0, Lcom/tencent/liteav/beauty/c;->Q:I

    .line 90
    .line 91
    iput v3, p0, Lcom/tencent/liteav/beauty/c;->R:I

    .line 92
    .line 93
    iput v2, p0, Lcom/tencent/liteav/beauty/c;->S:I

    .line 94
    .line 95
    iput-boolean v0, p0, Lcom/tencent/liteav/beauty/c;->T:Z

    .line 96
    .line 97
    iput-object v1, p0, Lcom/tencent/liteav/beauty/c;->U:[F

    .line 98
    .line 99
    iput-boolean v0, p0, Lcom/tencent/liteav/beauty/c;->V:Z

    .line 100
    .line 101
    iput v0, p0, Lcom/tencent/liteav/beauty/c;->W:I

    .line 102
    .line 103
    iput v0, p0, Lcom/tencent/liteav/beauty/c;->X:I

    .line 104
    .line 105
    iput-object v1, p0, Lcom/tencent/liteav/beauty/c;->Y:Lcom/tencent/liteav/basic/c/a;

    .line 106
    .line 107
    iput-object v1, p0, Lcom/tencent/liteav/beauty/c;->Z:Landroid/graphics/Bitmap;

    .line 108
    .line 109
    iput-object v1, p0, Lcom/tencent/liteav/beauty/c;->aa:Lcom/tencent/liteav/beauty/b/k;

    .line 110
    .line 111
    iput-object v1, p0, Lcom/tencent/liteav/beauty/c;->ab:Lcom/tencent/liteav/beauty/b/p;

    .line 112
    .line 113
    iput-object v1, p0, Lcom/tencent/liteav/beauty/c;->ac:Lcom/tencent/liteav/beauty/b/b;

    .line 114
    .line 115
    iput-object v1, p0, Lcom/tencent/liteav/beauty/c;->ad:Lcom/tencent/liteav/beauty/b/a/a;

    .line 116
    .line 117
    iput-object v1, p0, Lcom/tencent/liteav/beauty/c;->ae:Lcom/tencent/liteav/beauty/b/b/a;

    .line 118
    .line 119
    iput-object v1, p0, Lcom/tencent/liteav/beauty/c;->af:Lcom/tencent/liteav/beauty/b/c;

    .line 120
    .line 121
    iput-object v1, p0, Lcom/tencent/liteav/beauty/c;->ag:Lcom/tencent/liteav/beauty/b/c/a;

    .line 122
    .line 123
    iput-object v1, p0, Lcom/tencent/liteav/beauty/c;->an:Lcom/tencent/liteav/beauty/b/n;

    .line 124
    .line 125
    iput-object v1, p0, Lcom/tencent/liteav/beauty/c;->ao:Lcom/tencent/liteav/beauty/b/z;

    .line 126
    .line 127
    iput-object v1, p0, Lcom/tencent/liteav/beauty/c;->ap:Lcom/tencent/liteav/beauty/b/j;

    .line 128
    .line 129
    iput-object v1, p0, Lcom/tencent/liteav/beauty/c;->aq:Lcom/tencent/liteav/beauty/b/i;

    .line 130
    .line 131
    iput-object v1, p0, Lcom/tencent/liteav/beauty/c;->ar:Lcom/tencent/liteav/basic/c/h;

    .line 132
    .line 133
    iput-object v1, p0, Lcom/tencent/liteav/beauty/c;->as:Lcom/tencent/liteav/beauty/b/l;

    .line 134
    .line 135
    iput-object v1, p0, Lcom/tencent/liteav/beauty/c;->at:Lcom/tencent/liteav/basic/c/i;

    .line 136
    .line 137
    iput-object v1, p0, Lcom/tencent/liteav/beauty/c;->au:Lcom/tencent/liteav/basic/c/h;

    .line 138
    .line 139
    new-instance v4, Ljava/util/LinkedList;

    .line 140
    .line 141
    invoke-direct {v4}, Ljava/util/LinkedList;-><init>()V

    .line 142
    .line 143
    .line 144
    iput-object v4, p0, Lcom/tencent/liteav/beauty/c;->av:Ljava/util/Queue;

    .line 145
    .line 146
    iput-boolean v0, p0, Lcom/tencent/liteav/beauty/c;->a:Z

    .line 147
    .line 148
    new-instance v4, Ljava/lang/Object;

    .line 149
    .line 150
    invoke-direct {v4}, Ljava/lang/Object;-><init>()V

    .line 151
    .line 152
    .line 153
    iput-object v4, p0, Lcom/tencent/liteav/beauty/c;->ax:Ljava/lang/Object;

    .line 154
    .line 155
    new-instance v4, Ljava/lang/Object;

    .line 156
    .line 157
    invoke-direct {v4}, Ljava/lang/Object;-><init>()V

    .line 158
    .line 159
    .line 160
    iput-object v4, p0, Lcom/tencent/liteav/beauty/c;->ay:Ljava/lang/Object;

    .line 161
    .line 162
    const/high16 v4, 0x3f000000    # 0.5f

    .line 163
    .line 164
    iput v4, p0, Lcom/tencent/liteav/beauty/c;->aB:F

    .line 165
    .line 166
    iput v0, p0, Lcom/tencent/liteav/beauty/c;->aC:I

    .line 167
    .line 168
    iput v0, p0, Lcom/tencent/liteav/beauty/c;->aD:I

    .line 169
    .line 170
    iput v0, p0, Lcom/tencent/liteav/beauty/c;->aE:I

    .line 171
    .line 172
    iput v0, p0, Lcom/tencent/liteav/beauty/c;->aF:I

    .line 173
    .line 174
    iput v0, p0, Lcom/tencent/liteav/beauty/c;->aG:I

    .line 175
    .line 176
    iput-boolean v0, p0, Lcom/tencent/liteav/beauty/c;->aH:Z

    .line 177
    .line 178
    iput-object v1, p0, Lcom/tencent/liteav/beauty/c;->aI:Lcom/tencent/liteav/beauty/a/a/c;

    .line 179
    .line 180
    iput-object v1, p0, Lcom/tencent/liteav/beauty/c;->aJ:Lcom/tencent/liteav/beauty/a/a/a;

    .line 181
    .line 182
    iput-object v1, p0, Lcom/tencent/liteav/beauty/c;->aK:Landroid/graphics/Bitmap;

    .line 183
    .line 184
    iput-object v1, p0, Lcom/tencent/liteav/beauty/c;->aL:Ljava/util/List;

    .line 185
    .line 186
    const-wide/16 v4, 0x0

    .line 187
    .line 188
    iput-wide v4, p0, Lcom/tencent/liteav/beauty/c;->aM:J

    .line 189
    .line 190
    iput v0, p0, Lcom/tencent/liteav/beauty/c;->aN:I

    .line 191
    .line 192
    const/16 v4, 0x64

    .line 193
    .line 194
    iput v4, p0, Lcom/tencent/liteav/beauty/c;->aO:I

    .line 195
    .line 196
    const/high16 v4, 0x447a0000    # 1000.0f

    .line 197
    .line 198
    iput v4, p0, Lcom/tencent/liteav/beauty/c;->aP:F

    .line 199
    .line 200
    iput-object v1, p0, Lcom/tencent/liteav/beauty/c;->aQ:[B

    .line 201
    .line 202
    iput-object v1, p0, Lcom/tencent/liteav/beauty/c;->aR:[I

    .line 203
    .line 204
    iput-boolean v0, p0, Lcom/tencent/liteav/beauty/c;->aS:Z

    .line 205
    .line 206
    iput-object v1, p0, Lcom/tencent/liteav/beauty/c;->aT:[B

    .line 207
    .line 208
    iput-object v1, p0, Lcom/tencent/liteav/beauty/c;->b:[I

    .line 209
    .line 210
    iput-object v1, p0, Lcom/tencent/liteav/beauty/c;->c:[I

    .line 211
    .line 212
    iput v3, p0, Lcom/tencent/liteav/beauty/c;->aU:I

    .line 213
    .line 214
    iput v0, p0, Lcom/tencent/liteav/beauty/c;->aV:I

    .line 215
    .line 216
    iput v2, p0, Lcom/tencent/liteav/beauty/c;->aW:I

    .line 217
    .line 218
    iput v3, p0, Lcom/tencent/liteav/beauty/c;->aX:I

    .line 219
    .line 220
    iput-object v1, p0, Lcom/tencent/liteav/beauty/c;->aY:Lcom/tencent/liteav/beauty/e;

    .line 221
    .line 222
    new-instance v0, Ljava/lang/ref/WeakReference;

    .line 223
    .line 224
    invoke-direct {v0, v1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    .line 225
    .line 226
    .line 227
    iput-object v0, p0, Lcom/tencent/liteav/beauty/c;->aZ:Ljava/lang/ref/WeakReference;

    .line 228
    .line 229
    new-instance v0, Lcom/tencent/liteav/beauty/b/a;

    .line 230
    .line 231
    invoke-direct {v0}, Lcom/tencent/liteav/beauty/b/a;-><init>()V

    .line 232
    .line 233
    .line 234
    iput-object v0, p0, Lcom/tencent/liteav/beauty/c;->d:Lcom/tencent/liteav/beauty/b/a;

    .line 235
    .line 236
    new-instance v0, Lcom/tencent/liteav/beauty/b/a;

    .line 237
    .line 238
    invoke-direct {v0}, Lcom/tencent/liteav/beauty/b/a;-><init>()V

    .line 239
    .line 240
    .line 241
    iput-object v0, p0, Lcom/tencent/liteav/beauty/c;->e:Lcom/tencent/liteav/beauty/b/a;

    .line 242
    .line 243
    new-instance v0, Lcom/tencent/liteav/beauty/b/a;

    .line 244
    .line 245
    invoke-direct {v0}, Lcom/tencent/liteav/beauty/b/a;-><init>()V

    .line 246
    .line 247
    .line 248
    iput-object v0, p0, Lcom/tencent/liteav/beauty/c;->f:Lcom/tencent/liteav/beauty/b/a;

    .line 249
    .line 250
    new-instance v0, Lcom/tencent/liteav/beauty/c$12;

    .line 251
    .line 252
    invoke-direct {v0, p0}, Lcom/tencent/liteav/beauty/c$12;-><init>(Lcom/tencent/liteav/beauty/c;)V

    .line 253
    .line 254
    .line 255
    iput-object v0, p0, Lcom/tencent/liteav/beauty/c;->ba:Lcom/tencent/liteav/basic/c/j$b;

    .line 256
    .line 257
    iput-object p1, p0, Lcom/tencent/liteav/beauty/c;->E:Landroid/content/Context;

    .line 258
    .line 259
    new-instance p1, Landroid/os/Handler;

    .line 260
    .line 261
    iget-object v0, p0, Lcom/tencent/liteav/beauty/c;->E:Landroid/content/Context;

    .line 262
    .line 263
    invoke-virtual {v0}, Landroid/content/Context;->getMainLooper()Landroid/os/Looper;

    .line 264
    .line 265
    .line 266
    move-result-object v0

    .line 267
    invoke-direct {p1, v0}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 268
    .line 269
    .line 270
    iput-object p1, p0, Lcom/tencent/liteav/beauty/c;->az:Landroid/os/Handler;

    .line 271
    .line 272
    iput-boolean p2, p0, Lcom/tencent/liteav/beauty/c;->aw:Z

    .line 273
    .line 274
    return-void
.end method

.method private A(I)I
    .locals 3

    .line 1
    iget v0, p0, Lcom/tencent/liteav/beauty/c;->J:I

    .line 2
    .line 3
    iget v1, p0, Lcom/tencent/liteav/beauty/c;->K:I

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    invoke-static {v2, v2, v0, v1}, Landroid/opengl/GLES20;->glViewport(IIII)V

    .line 7
    .line 8
    .line 9
    iget-object v0, p0, Lcom/tencent/liteav/beauty/c;->aa:Lcom/tencent/liteav/beauty/b/k;

    .line 10
    .line 11
    invoke-virtual {v0}, Lcom/tencent/liteav/beauty/b/k;->q()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    const-wide/16 v1, 0x0

    .line 16
    .line 17
    invoke-virtual {p0, v0, p1, v1, v2}, Lcom/tencent/liteav/beauty/c;->a(IIJ)I

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    return p0
.end method

.method public static synthetic a(Lcom/tencent/liteav/beauty/c;F)F
    .locals 0

    .line 212
    iput p1, p0, Lcom/tencent/liteav/beauty/c;->aB:F

    return p1
.end method

.method private a(II)I
    .locals 9

    .line 305
    iget-boolean v0, p0, Lcom/tencent/liteav/beauty/c;->aw:Z

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-ne v2, v0, :cond_1

    .line 306
    iget-object v0, p0, Lcom/tencent/liteav/beauty/c;->aY:Lcom/tencent/liteav/beauty/e;

    if-eqz v0, :cond_0

    .line 307
    invoke-static {}, Lcom/tencent/liteav/beauty/NativeLoad;->getInstance()Lcom/tencent/liteav/beauty/NativeLoad;

    iget-object v0, p0, Lcom/tencent/liteav/beauty/c;->aQ:[B

    invoke-static {p1, p2, v0}, Lcom/tencent/liteav/beauty/NativeLoad;->nativeGlReadPixs(II[B)V

    .line 308
    iget-object v2, p0, Lcom/tencent/liteav/beauty/c;->aY:Lcom/tencent/liteav/beauty/e;

    iget-object v3, p0, Lcom/tencent/liteav/beauty/c;->aQ:[B

    iget v4, p0, Lcom/tencent/liteav/beauty/c;->Q:I

    iget v5, p0, Lcom/tencent/liteav/beauty/c;->R:I

    iget v6, p0, Lcom/tencent/liteav/beauty/c;->X:I

    invoke-static {}, Lcom/tencent/liteav/basic/util/TXCTimeUtil;->generatePtsMS()J

    move-result-wide v7

    invoke-interface/range {v2 .. v8}, Lcom/tencent/liteav/beauty/e;->a([BIIIJ)V

    goto/16 :goto_0

    .line 309
    :cond_0
    iget-object v0, p0, Lcom/tencent/liteav/beauty/c;->aT:[B

    if-eqz v0, :cond_6

    .line 310
    invoke-static {}, Lcom/tencent/liteav/beauty/NativeLoad;->getInstance()Lcom/tencent/liteav/beauty/NativeLoad;

    iget-object p0, p0, Lcom/tencent/liteav/beauty/c;->aT:[B

    invoke-static {p1, p2, p0}, Lcom/tencent/liteav/beauty/NativeLoad;->nativeGlReadPixs(II[B)V

    goto/16 :goto_0

    :cond_1
    const/4 v0, 0x3

    .line 311
    invoke-static {}, Lcom/tencent/liteav/basic/c/j;->a()I

    move-result v3

    if-ne v0, v3, :cond_5

    const-wide/16 v3, 0x0

    .line 312
    iget-wide v5, p0, Lcom/tencent/liteav/beauty/c;->aM:J

    cmp-long v0, v3, v5

    if-nez v0, :cond_2

    .line 313
    invoke-static {}, Lcom/tencent/liteav/basic/util/TXCTimeUtil;->getTimeTick()J

    move-result-wide v3

    iput-wide v3, p0, Lcom/tencent/liteav/beauty/c;->aM:J

    .line 314
    :cond_2
    iget v0, p0, Lcom/tencent/liteav/beauty/c;->aN:I

    add-int/2addr v0, v2

    iput v0, p0, Lcom/tencent/liteav/beauty/c;->aN:I

    const/16 v3, 0x64

    const-string v4, "TXCFilterDrawer"

    if-lt v0, v3, :cond_3

    .line 315
    invoke-static {}, Lcom/tencent/liteav/basic/util/TXCTimeUtil;->getTimeTick()J

    move-result-wide v5

    iget-wide v7, p0, Lcom/tencent/liteav/beauty/c;->aM:J

    sub-long/2addr v5, v7

    long-to-float v0, v5

    const/high16 v3, 0x447a0000    # 1000.0f

    div-float/2addr v0, v3

    const/high16 v3, 0x42c80000    # 100.0f

    div-float/2addr v3, v0

    .line 316
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v5, "Real fps "

    invoke-direct {v0, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v4, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 317
    iput v1, p0, Lcom/tencent/liteav/beauty/c;->aN:I

    .line 318
    invoke-static {}, Lcom/tencent/liteav/basic/util/TXCTimeUtil;->getTimeTick()J

    move-result-wide v5

    iput-wide v5, p0, Lcom/tencent/liteav/beauty/c;->aM:J

    :cond_3
    const/16 v0, 0xd05

    .line 319
    invoke-static {v0, v2}, Landroid/opengl/GLES20;->glPixelStorei(II)V

    const/16 v0, 0x405

    .line 320
    invoke-static {v0}, Landroid/opengl/GLES30;->glReadBuffer(I)V

    .line 321
    iget-object p0, p0, Lcom/tencent/liteav/beauty/c;->aR:[I

    aget p0, p0, v1

    const v0, 0x88eb

    invoke-static {v0, p0}, Landroid/opengl/GLES20;->glBindBuffer(II)V

    .line 322
    invoke-static {}, Lcom/tencent/liteav/beauty/NativeLoad;->getInstance()Lcom/tencent/liteav/beauty/NativeLoad;

    const/4 p0, 0x0

    invoke-static {p1, p2, p0}, Lcom/tencent/liteav/beauty/NativeLoad;->nativeGlReadPixs(II[B)V

    mul-int p0, p1, p2

    mul-int/lit8 p0, p0, 0x4

    .line 323
    invoke-static {v0, v1, p0, v2}, Landroid/opengl/GLES30;->glMapBufferRange(IIII)Ljava/nio/Buffer;

    move-result-object p0

    check-cast p0, Ljava/nio/ByteBuffer;

    if-nez p0, :cond_4

    .line 324
    const-string p0, "glMapBufferRange is null"

    invoke-static {v4, p0}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    const/4 p0, -0x1

    return p0

    .line 325
    :cond_4
    invoke-static {}, Lcom/tencent/liteav/beauty/NativeLoad;->getInstance()Lcom/tencent/liteav/beauty/NativeLoad;

    invoke-static {p1, p2, p0}, Lcom/tencent/liteav/beauty/NativeLoad;->nativeGlMapBufferToQueue(IILjava/nio/ByteBuffer;)V

    .line 326
    invoke-static {v0}, Landroid/opengl/GLES30;->glUnmapBuffer(I)Z

    .line 327
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glBindBuffer(II)V

    goto :goto_0

    .line 328
    :cond_5
    invoke-static {}, Lcom/tencent/liteav/beauty/NativeLoad;->getInstance()Lcom/tencent/liteav/beauty/NativeLoad;

    invoke-static {p1, p2}, Lcom/tencent/liteav/beauty/NativeLoad;->nativeGlReadPixsToQueue(II)V

    :cond_6
    :goto_0
    return v1
.end method

.method private a(IJ)I
    .locals 6

    .line 289
    iget v0, p0, Lcom/tencent/liteav/beauty/c;->X:I

    if-nez v0, :cond_2

    .line 290
    iget-object v0, p0, Lcom/tencent/liteav/beauty/c;->aY:Lcom/tencent/liteav/beauty/e;

    if-eqz v0, :cond_1

    const-wide/16 v0, 0x0

    cmp-long v0, p2, v0

    if-nez v0, :cond_0

    .line 291
    invoke-static {}, Lcom/tencent/liteav/basic/util/TXCTimeUtil;->generatePtsMS()J

    move-result-wide p2

    :cond_0
    move-wide v4, p2

    .line 292
    iget-object v0, p0, Lcom/tencent/liteav/beauty/c;->aY:Lcom/tencent/liteav/beauty/e;

    iget v2, p0, Lcom/tencent/liteav/beauty/c;->Q:I

    iget v3, p0, Lcom/tencent/liteav/beauty/c;->R:I

    move v1, p1

    invoke-interface/range {v0 .. v5}, Lcom/tencent/liteav/beauty/e;->a(IIIJ)V

    return v1

    :cond_1
    move v1, p1

    return v1

    :cond_2
    move v1, p1

    const/4 p1, 0x1

    .line 293
    const-string p2, "TXCFilterDrawer"

    const/4 p3, 0x2

    const/4 v2, 0x3

    if-eq p1, v0, :cond_4

    if-eq v2, v0, :cond_4

    if-ne p3, v0, :cond_3

    goto :goto_0

    .line 294
    :cond_3
    const-string p0, "Don\'t support format!"

    invoke-static {p2, p0}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    const/4 p0, -0x1

    return p0

    .line 295
    :cond_4
    :goto_0
    iget p1, p0, Lcom/tencent/liteav/beauty/c;->Q:I

    iget v0, p0, Lcom/tencent/liteav/beauty/c;->R:I

    const/4 v3, 0x0

    invoke-static {v3, v3, p1, v0}, Landroid/opengl/GLES20;->glViewport(IIII)V

    .line 296
    iget-object p1, p0, Lcom/tencent/liteav/beauty/c;->ab:Lcom/tencent/liteav/beauty/b/p;

    if-nez p1, :cond_5

    .line 297
    const-string p0, "mRGBA2I420Filter is null!"

    invoke-static {p2, p0}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    return v1

    .line 298
    :cond_5
    iget-object p1, p0, Lcom/tencent/liteav/beauty/c;->b:[I

    aget p1, p1, v3

    const p2, 0x8d40

    invoke-static {p2, p1}, Landroid/opengl/GLES20;->glBindFramebuffer(II)V

    .line 299
    iget-object p1, p0, Lcom/tencent/liteav/beauty/c;->ab:Lcom/tencent/liteav/beauty/b/p;

    invoke-virtual {p1, v1}, Lcom/tencent/liteav/basic/c/h;->a(I)I

    .line 300
    iget p1, p0, Lcom/tencent/liteav/beauty/c;->X:I

    .line 301
    iget v0, p0, Lcom/tencent/liteav/beauty/c;->Q:I

    if-ne p3, p1, :cond_6

    .line 302
    iget p1, p0, Lcom/tencent/liteav/beauty/c;->R:I

    invoke-direct {p0, v0, p1}, Lcom/tencent/liteav/beauty/c;->a(II)I

    goto :goto_1

    .line 303
    :cond_6
    iget p1, p0, Lcom/tencent/liteav/beauty/c;->R:I

    mul-int/2addr p1, v2

    div-int/lit8 p1, p1, 0x8

    invoke-direct {p0, v0, p1}, Lcom/tencent/liteav/beauty/c;->a(II)I

    .line 304
    :goto_1
    invoke-static {p2, v3}, Landroid/opengl/GLES20;->glBindFramebuffer(II)V

    return v1
.end method

.method public static synthetic a(Lcom/tencent/liteav/beauty/c;I)I
    .locals 0

    .line 213
    iput p1, p0, Lcom/tencent/liteav/beauty/c;->X:I

    return p1
.end method

.method public static synthetic a(Lcom/tencent/liteav/beauty/c;Lcom/tencent/liteav/beauty/a/a/a;)Lcom/tencent/liteav/beauty/a/a/a;
    .locals 0

    .line 214
    iput-object p1, p0, Lcom/tencent/liteav/beauty/c;->aJ:Lcom/tencent/liteav/beauty/a/a/a;

    return-object p1
.end method

.method public static synthetic a(Lcom/tencent/liteav/beauty/c;Lcom/tencent/liteav/beauty/a/a/c;)Lcom/tencent/liteav/beauty/a/a/c;
    .locals 0

    .line 215
    iput-object p1, p0, Lcom/tencent/liteav/beauty/c;->aI:Lcom/tencent/liteav/beauty/a/a/c;

    return-object p1
.end method

.method public static synthetic a(Lcom/tencent/liteav/beauty/c;)Lcom/tencent/liteav/beauty/b/m;
    .locals 0

    .line 216
    iget-object p0, p0, Lcom/tencent/liteav/beauty/c;->am:Lcom/tencent/liteav/beauty/b/m;

    return-object p0
.end method

.method public static synthetic a(Lcom/tencent/liteav/beauty/c;Lcom/tencent/liteav/beauty/b/m;)Lcom/tencent/liteav/beauty/b/m;
    .locals 0

    .line 217
    iput-object p1, p0, Lcom/tencent/liteav/beauty/c;->am:Lcom/tencent/liteav/beauty/b/m;

    return-object p1
.end method

.method public static synthetic a(Lcom/tencent/liteav/beauty/c;Lcom/tencent/liteav/beauty/b/z;)Lcom/tencent/liteav/beauty/b/z;
    .locals 0

    .line 218
    iput-object p1, p0, Lcom/tencent/liteav/beauty/c;->ao:Lcom/tencent/liteav/beauty/b/z;

    return-object p1
.end method

.method private a(IIFLandroid/graphics/Bitmap;FLandroid/graphics/Bitmap;F)V
    .locals 8

    .line 392
    iget-object v0, p0, Lcom/tencent/liteav/beauty/c;->am:Lcom/tencent/liteav/beauty/b/m;

    if-nez v0, :cond_1

    .line 393
    const-string v0, "createComLooKupFilter"

    const-string v1, "TXCFilterDrawer"

    invoke-static {v1, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 394
    new-instance v2, Lcom/tencent/liteav/beauty/b/m;

    move v3, p3

    move-object v4, p4

    move v5, p5

    move-object v6, p6

    move v7, p7

    invoke-direct/range {v2 .. v7}, Lcom/tencent/liteav/beauty/b/m;-><init>(FLandroid/graphics/Bitmap;FLandroid/graphics/Bitmap;F)V

    iput-object v2, p0, Lcom/tencent/liteav/beauty/c;->am:Lcom/tencent/liteav/beauty/b/m;

    .line 395
    invoke-virtual {v2}, Lcom/tencent/liteav/basic/c/h;->a()Z

    move-result p3

    const/4 p4, 0x1

    if-ne p4, p3, :cond_0

    .line 396
    iget-object p3, p0, Lcom/tencent/liteav/beauty/c;->am:Lcom/tencent/liteav/beauty/b/m;

    invoke-virtual {p3, p4}, Lcom/tencent/liteav/basic/c/h;->a(Z)V

    .line 397
    iget-object p0, p0, Lcom/tencent/liteav/beauty/c;->am:Lcom/tencent/liteav/beauty/b/m;

    invoke-virtual {p0, p1, p2}, Lcom/tencent/liteav/basic/c/h;->a(II)V

    return-void

    .line 398
    :cond_0
    const-string p0, "mLookupFilterGroup init failed!"

    invoke-static {v1, p0}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    :cond_1
    return-void
.end method

.method private a(III)V
    .locals 3

    .line 366
    const-string v0, "create Beauty Filter!"

    const-string v1, "TXCFilterDrawer"

    invoke-static {v1, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    const/4 v0, 0x1

    if-nez p3, :cond_1

    .line 367
    iget-object p3, p0, Lcom/tencent/liteav/beauty/c;->ad:Lcom/tencent/liteav/beauty/b/a/a;

    if-nez p3, :cond_0

    .line 368
    new-instance p3, Lcom/tencent/liteav/beauty/b/a/a;

    invoke-direct {p3}, Lcom/tencent/liteav/beauty/b/a/a;-><init>()V

    iput-object p3, p0, Lcom/tencent/liteav/beauty/c;->ad:Lcom/tencent/liteav/beauty/b/a/a;

    .line 369
    :cond_0
    iget-object p3, p0, Lcom/tencent/liteav/beauty/c;->ad:Lcom/tencent/liteav/beauty/b/a/a;

    iput-object p3, p0, Lcom/tencent/liteav/beauty/c;->ac:Lcom/tencent/liteav/beauty/b/b;

    goto :goto_0

    :cond_1
    if-ne v0, p3, :cond_3

    .line 370
    iget-object p3, p0, Lcom/tencent/liteav/beauty/c;->ae:Lcom/tencent/liteav/beauty/b/b/a;

    if-nez p3, :cond_2

    .line 371
    new-instance p3, Lcom/tencent/liteav/beauty/b/b/a;

    invoke-direct {p3}, Lcom/tencent/liteav/beauty/b/b/a;-><init>()V

    iput-object p3, p0, Lcom/tencent/liteav/beauty/c;->ae:Lcom/tencent/liteav/beauty/b/b/a;

    .line 372
    :cond_2
    iget-object p3, p0, Lcom/tencent/liteav/beauty/c;->ae:Lcom/tencent/liteav/beauty/b/b/a;

    iput-object p3, p0, Lcom/tencent/liteav/beauty/c;->ac:Lcom/tencent/liteav/beauty/b/b;

    goto :goto_0

    :cond_3
    const/4 v2, 0x2

    if-ne v2, p3, :cond_5

    .line 373
    iget-object p3, p0, Lcom/tencent/liteav/beauty/c;->ag:Lcom/tencent/liteav/beauty/b/c/a;

    if-nez p3, :cond_4

    .line 374
    new-instance p3, Lcom/tencent/liteav/beauty/b/c/a;

    invoke-direct {p3}, Lcom/tencent/liteav/beauty/b/c/a;-><init>()V

    iput-object p3, p0, Lcom/tencent/liteav/beauty/c;->ag:Lcom/tencent/liteav/beauty/b/c/a;

    .line 375
    :cond_4
    iget-object p3, p0, Lcom/tencent/liteav/beauty/c;->ag:Lcom/tencent/liteav/beauty/b/c/a;

    iput-object p3, p0, Lcom/tencent/liteav/beauty/c;->ac:Lcom/tencent/liteav/beauty/b/b;

    goto :goto_0

    :cond_5
    const/4 v2, 0x3

    if-ne v2, p3, :cond_7

    .line 376
    iget-object p3, p0, Lcom/tencent/liteav/beauty/c;->af:Lcom/tencent/liteav/beauty/b/c;

    if-nez p3, :cond_6

    .line 377
    new-instance p3, Lcom/tencent/liteav/beauty/b/c;

    invoke-direct {p3}, Lcom/tencent/liteav/beauty/b/c;-><init>()V

    iput-object p3, p0, Lcom/tencent/liteav/beauty/c;->af:Lcom/tencent/liteav/beauty/b/c;

    .line 378
    :cond_6
    iget-object p3, p0, Lcom/tencent/liteav/beauty/c;->af:Lcom/tencent/liteav/beauty/b/c;

    iput-object p3, p0, Lcom/tencent/liteav/beauty/c;->ac:Lcom/tencent/liteav/beauty/b/b;

    .line 379
    :cond_7
    :goto_0
    iget-object p3, p0, Lcom/tencent/liteav/beauty/c;->ac:Lcom/tencent/liteav/beauty/b/b;

    if-nez p3, :cond_8

    .line 380
    const-string p0, "mBeautyFilter set error!"

    invoke-static {v1, p0}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    .line 381
    :cond_8
    invoke-virtual {p3, v0}, Lcom/tencent/liteav/basic/c/h;->a(Z)V

    .line 382
    iget-object p3, p0, Lcom/tencent/liteav/beauty/c;->ac:Lcom/tencent/liteav/beauty/b/b;

    invoke-virtual {p3, p1, p2}, Lcom/tencent/liteav/beauty/b/b;->c(II)Z

    move-result p1

    if-ne v0, p1, :cond_d

    .line 383
    iget p1, p0, Lcom/tencent/liteav/beauty/c;->aD:I

    if-lez p1, :cond_9

    .line 384
    iget-object p2, p0, Lcom/tencent/liteav/beauty/c;->ac:Lcom/tencent/liteav/beauty/b/b;

    invoke-virtual {p2, p1}, Lcom/tencent/liteav/beauty/b/b;->c(I)V

    .line 385
    :cond_9
    iget p1, p0, Lcom/tencent/liteav/beauty/c;->aE:I

    if-lez p1, :cond_a

    .line 386
    iget-object p2, p0, Lcom/tencent/liteav/beauty/c;->ac:Lcom/tencent/liteav/beauty/b/b;

    invoke-virtual {p2, p1}, Lcom/tencent/liteav/beauty/b/b;->d(I)V

    .line 387
    :cond_a
    iget p1, p0, Lcom/tencent/liteav/beauty/c;->aG:I

    if-lez p1, :cond_b

    .line 388
    iget-object p2, p0, Lcom/tencent/liteav/beauty/c;->ac:Lcom/tencent/liteav/beauty/b/b;

    invoke-virtual {p2, p1}, Lcom/tencent/liteav/beauty/b/b;->e(I)V

    .line 389
    :cond_b
    iget p1, p0, Lcom/tencent/liteav/beauty/c;->aF:I

    if-lez p1, :cond_c

    .line 390
    iget-object p0, p0, Lcom/tencent/liteav/beauty/c;->ac:Lcom/tencent/liteav/beauty/b/b;

    invoke-virtual {p0, p1}, Lcom/tencent/liteav/beauty/b/b;->f(I)V

    :cond_c
    return-void

    .line 391
    :cond_d
    const-string p0, "mBeautyFilter init failed!"

    invoke-static {v1, p0}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method private a(IIIII)V
    .locals 4

    .line 261
    const-string v0, "real outputAngle "

    iget-object v1, p0, Lcom/tencent/liteav/beauty/c;->ay:Ljava/lang/Object;

    monitor-enter v1

    add-int/lit16 p5, p5, 0x168

    .line 262
    :try_start_0
    rem-int/lit16 p5, p5, 0x168

    .line 263
    const-string v2, "TXCFilterDrawer"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, p5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v2, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 264
    iget-object v0, p0, Lcom/tencent/liteav/beauty/c;->ar:Lcom/tencent/liteav/basic/c/h;

    if-nez v0, :cond_2

    if-ne p1, p3, :cond_0

    if-ne p2, p4, :cond_0

    if-nez p5, :cond_0

    .line 265
    const-string p0, "TXCFilterDrawer"

    const-string p1, "Don\'t need change output Image, don\'t create out filter!"

    invoke-static {p0, p1}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 266
    monitor-exit v1

    return-void

    :catchall_0
    move-exception p0

    goto :goto_1

    .line 267
    :cond_0
    new-instance p1, Lcom/tencent/liteav/basic/c/h;

    invoke-direct {p1}, Lcom/tencent/liteav/basic/c/h;-><init>()V

    iput-object p1, p0, Lcom/tencent/liteav/beauty/c;->ar:Lcom/tencent/liteav/basic/c/h;

    .line 268
    invoke-virtual {p1}, Lcom/tencent/liteav/basic/c/h;->a()Z

    move-result p1

    const/4 p2, 0x1

    if-ne p2, p1, :cond_1

    .line 269
    iget-object p1, p0, Lcom/tencent/liteav/beauty/c;->ar:Lcom/tencent/liteav/basic/c/h;

    invoke-virtual {p1, p2}, Lcom/tencent/liteav/basic/c/h;->a(Z)V

    goto :goto_0

    .line 270
    :cond_1
    const-string p1, "TXCFilterDrawer"

    const-string p2, "mOutputZoomFilter init failed!"

    invoke-static {p1, p2}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 271
    :cond_2
    :goto_0
    iget-object p1, p0, Lcom/tencent/liteav/beauty/c;->ar:Lcom/tencent/liteav/basic/c/h;

    invoke-virtual {p1, p3, p4}, Lcom/tencent/liteav/basic/c/h;->a(II)V

    rsub-int p1, p5, 0x2d0

    .line 272
    rem-int/lit16 p1, p1, 0x168

    .line 273
    iget-object p0, p0, Lcom/tencent/liteav/beauty/c;->ar:Lcom/tencent/liteav/basic/c/h;

    const/4 p2, 0x0

    invoke-virtual {p0, p1, p2}, Lcom/tencent/liteav/basic/c/h;->a(ILjava/nio/FloatBuffer;)V

    .line 274
    monitor-exit v1

    return-void

    :goto_1
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0
.end method

.method private a(Lcom/tencent/liteav/basic/c/a;IIIIZII)V
    .locals 7

    .line 250
    iget-object v0, p0, Lcom/tencent/liteav/beauty/c;->as:Lcom/tencent/liteav/beauty/b/l;

    if-nez v0, :cond_2

    .line 251
    const-string v0, "Create CropFilter"

    const-string v1, "TXCFilterDrawer"

    invoke-static {v1, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    const/4 v0, 0x4

    const/4 v2, 0x1

    if-ne v0, p8, :cond_0

    .line 252
    new-instance v0, Lcom/tencent/liteav/beauty/b/l;

    const-string v3, "attribute vec4 position;\nattribute vec4 inputTextureCoordinate;\n \nuniform mat4 textureTransform;\nvarying vec2 textureCoordinate;\n \nvoid main()\n{\n    gl_Position = position;\n    textureCoordinate = (textureTransform * inputTextureCoordinate).xy;\n}"

    const-string v4, "#extension GL_OES_EGL_image_external : require\n\nvarying lowp vec2 textureCoordinate;\n \nuniform samplerExternalOES inputImageTexture;\n \nvoid main()\n{\n     gl_FragColor = texture2D(inputImageTexture, textureCoordinate);\n}"

    invoke-direct {v0, v3, v4, v2}, Lcom/tencent/liteav/beauty/b/l;-><init>(Ljava/lang/String;Ljava/lang/String;Z)V

    iput-object v0, p0, Lcom/tencent/liteav/beauty/c;->as:Lcom/tencent/liteav/beauty/b/l;

    goto :goto_0

    .line 253
    :cond_0
    new-instance v0, Lcom/tencent/liteav/beauty/b/l;

    invoke-direct {v0}, Lcom/tencent/liteav/beauty/b/l;-><init>()V

    iput-object v0, p0, Lcom/tencent/liteav/beauty/c;->as:Lcom/tencent/liteav/beauty/b/l;

    .line 254
    :goto_0
    iget-object v0, p0, Lcom/tencent/liteav/beauty/c;->as:Lcom/tencent/liteav/beauty/b/l;

    invoke-virtual {v0}, Lcom/tencent/liteav/basic/c/h;->a()Z

    move-result v0

    if-ne v2, v0, :cond_1

    .line 255
    iget-object v0, p0, Lcom/tencent/liteav/beauty/c;->as:Lcom/tencent/liteav/beauty/b/l;

    invoke-virtual {v0, v2}, Lcom/tencent/liteav/basic/c/h;->a(Z)V

    goto :goto_1

    .line 256
    :cond_1
    const-string v0, "mInputCropFilter init failed!"

    invoke-static {v1, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 257
    :cond_2
    :goto_1
    iget-object v0, p0, Lcom/tencent/liteav/beauty/c;->as:Lcom/tencent/liteav/beauty/b/l;

    invoke-virtual {v0, p4, p5}, Lcom/tencent/liteav/basic/c/h;->a(II)V

    .line 258
    iget-object v1, p0, Lcom/tencent/liteav/beauty/c;->as:Lcom/tencent/liteav/beauty/b/l;

    iget v2, p0, Lcom/tencent/liteav/beauty/c;->J:I

    iget v3, p0, Lcom/tencent/liteav/beauty/c;->K:I

    const/4 v4, 0x0

    move-object v5, p1

    move v6, p8

    invoke-virtual/range {v1 .. v6}, Lcom/tencent/liteav/basic/c/h;->a(IILjava/nio/FloatBuffer;Lcom/tencent/liteav/basic/c/a;I)[F

    move-result-object p1

    rsub-int p7, p7, 0x2d0

    .line 259
    rem-int/lit16 p7, p7, 0x168

    const/16 p8, 0x10e

    const/16 v0, 0x5a

    if-eq p7, v0, :cond_4

    if-ne p7, p8, :cond_3

    goto :goto_2

    :cond_3
    move v1, p4

    goto :goto_3

    :cond_4
    :goto_2
    move v1, p5

    :goto_3
    if-eq p7, v0, :cond_6

    if-ne p7, p8, :cond_5

    goto :goto_4

    :cond_5
    move p4, p5

    .line 260
    :cond_6
    :goto_4
    iget-object p0, p0, Lcom/tencent/liteav/beauty/c;->as:Lcom/tencent/liteav/beauty/b/l;

    int-to-float p5, v1

    int-to-float p4, p4

    div-float/2addr p5, p4

    move-object p4, p1

    move p1, p2

    move p2, p3

    move p3, p7

    const/4 p7, 0x0

    invoke-virtual/range {p0 .. p7}, Lcom/tencent/liteav/basic/c/h;->a(III[FFZZ)V

    return-void
.end method

.method public static synthetic a(Lcom/tencent/liteav/beauty/c;IIFLandroid/graphics/Bitmap;FLandroid/graphics/Bitmap;F)V
    .locals 0

    .line 219
    invoke-direct/range {p0 .. p7}, Lcom/tencent/liteav/beauty/c;->a(IIFLandroid/graphics/Bitmap;FLandroid/graphics/Bitmap;F)V

    return-void
.end method

.method public static synthetic a(Lcom/tencent/liteav/beauty/c;III)V
    .locals 0

    .line 220
    invoke-direct {p0, p1, p2, p3}, Lcom/tencent/liteav/beauty/c;->a(III)V

    return-void
.end method

.method public static synthetic a(Lcom/tencent/liteav/beauty/c;[B)V
    .locals 0

    .line 221
    invoke-direct {p0, p1}, Lcom/tencent/liteav/beauty/c;->b([B)V

    return-void
.end method

.method private a(Ljava/lang/Runnable;)V
    .locals 1

    .line 399
    iget-object v0, p0, Lcom/tencent/liteav/beauty/c;->av:Ljava/util/Queue;

    monitor-enter v0

    .line 400
    :try_start_0
    iget-object p0, p0, Lcom/tencent/liteav/beauty/c;->av:Ljava/util/Queue;

    invoke-interface {p0, p1}, Ljava/util/Queue;->add(Ljava/lang/Object;)Z

    .line 401
    monitor-exit v0

    return-void

    :catchall_0
    move-exception p0

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0
.end method

.method private a(Ljava/util/Queue;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Queue<",
            "Ljava/lang/Runnable;",
            ">;)V"
        }
    .end annotation

    .line 402
    :goto_0
    monitor-enter p1

    .line 403
    :try_start_0
    invoke-interface {p1}, Ljava/util/Collection;->isEmpty()Z

    move-result p0

    if-nez p0, :cond_0

    invoke-interface {p1}, Ljava/util/Queue;->poll()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Runnable;

    goto :goto_1

    :catchall_0
    move-exception p0

    goto :goto_2

    :cond_0
    const/4 p0, 0x0

    .line 404
    :goto_1
    monitor-exit p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz p0, :cond_1

    .line 405
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    goto :goto_0

    :cond_1
    return-void

    .line 406
    :goto_2
    :try_start_1
    monitor-exit p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p0
.end method

.method private a([BZ)V
    .locals 9

    .line 329
    const-string v0, "TXCFilterDrawer"

    if-nez p2, :cond_1

    .line 330
    iget-object v1, p0, Lcom/tencent/liteav/beauty/c;->aY:Lcom/tencent/liteav/beauty/e;

    if-eqz v1, :cond_0

    .line 331
    iget v3, p0, Lcom/tencent/liteav/beauty/c;->Q:I

    iget v4, p0, Lcom/tencent/liteav/beauty/c;->R:I

    iget v5, p0, Lcom/tencent/liteav/beauty/c;->X:I

    invoke-static {}, Lcom/tencent/liteav/basic/util/TXCTimeUtil;->generatePtsMS()J

    move-result-wide v6

    move-object v2, p1

    invoke-interface/range {v1 .. v7}, Lcom/tencent/liteav/beauty/e;->a([BIIIJ)V

    return-void

    .line 332
    :cond_0
    const-string p0, "First Frame, don\'t process!"

    invoke-static {v0, p0}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_1
    move-object v2, p1

    .line 333
    iget p1, p0, Lcom/tencent/liteav/beauty/c;->R:I

    mul-int/lit8 p2, p1, 0x3

    div-int/lit8 p2, p2, 0x8

    const/4 v1, 0x2

    .line 334
    iget v3, p0, Lcom/tencent/liteav/beauty/c;->X:I

    if-ne v1, v3, :cond_2

    goto :goto_0

    :cond_2
    move p1, p2

    .line 335
    :goto_0
    iget-object p2, p0, Lcom/tencent/liteav/beauty/c;->aY:Lcom/tencent/liteav/beauty/e;

    const-string v1, "nativeGlReadPixsFromQueue Failed"

    if-eqz p2, :cond_4

    .line 336
    invoke-static {}, Lcom/tencent/liteav/beauty/NativeLoad;->getInstance()Lcom/tencent/liteav/beauty/NativeLoad;

    iget p2, p0, Lcom/tencent/liteav/beauty/c;->Q:I

    iget-object v3, p0, Lcom/tencent/liteav/beauty/c;->aQ:[B

    invoke-static {p2, p1, v3}, Lcom/tencent/liteav/beauty/NativeLoad;->nativeGlReadPixsFromQueue(II[B)Z

    move-result p1

    const/4 p2, 0x1

    if-ne p2, p1, :cond_3

    .line 337
    iget-object v2, p0, Lcom/tencent/liteav/beauty/c;->aY:Lcom/tencent/liteav/beauty/e;

    iget-object v3, p0, Lcom/tencent/liteav/beauty/c;->aQ:[B

    iget v4, p0, Lcom/tencent/liteav/beauty/c;->Q:I

    iget v5, p0, Lcom/tencent/liteav/beauty/c;->R:I

    iget v6, p0, Lcom/tencent/liteav/beauty/c;->X:I

    invoke-static {}, Lcom/tencent/liteav/basic/util/TXCTimeUtil;->generatePtsMS()J

    move-result-wide v7

    invoke-interface/range {v2 .. v8}, Lcom/tencent/liteav/beauty/e;->a([BIIIJ)V

    return-void

    .line 338
    :cond_3
    invoke-static {v0, v1}, Lcom/tencent/liteav/basic/log/TXCLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 339
    iget-object v1, p0, Lcom/tencent/liteav/beauty/c;->aY:Lcom/tencent/liteav/beauty/e;

    iget v3, p0, Lcom/tencent/liteav/beauty/c;->Q:I

    iget v4, p0, Lcom/tencent/liteav/beauty/c;->R:I

    iget v5, p0, Lcom/tencent/liteav/beauty/c;->X:I

    invoke-static {}, Lcom/tencent/liteav/basic/util/TXCTimeUtil;->generatePtsMS()J

    move-result-wide v6

    invoke-interface/range {v1 .. v7}, Lcom/tencent/liteav/beauty/e;->a([BIIIJ)V

    return-void

    .line 340
    :cond_4
    invoke-static {}, Lcom/tencent/liteav/beauty/NativeLoad;->getInstance()Lcom/tencent/liteav/beauty/NativeLoad;

    iget p2, p0, Lcom/tencent/liteav/beauty/c;->Q:I

    iget-object p0, p0, Lcom/tencent/liteav/beauty/c;->aT:[B

    invoke-static {p2, p1, p0}, Lcom/tencent/liteav/beauty/NativeLoad;->nativeGlReadPixsFromQueue(II[B)Z

    move-result p0

    if-nez p0, :cond_5

    .line 341
    invoke-static {v0, v1}, Lcom/tencent/liteav/basic/log/TXCLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    :cond_5
    return-void
.end method

.method private a([I[III)V
    .locals 1

    const/4 p0, 0x1

    const/4 v0, 0x0

    .line 348
    invoke-static {p0, p1, v0}, Landroid/opengl/GLES20;->glGenFramebuffers(I[II)V

    const/16 p0, 0x1908

    .line 349
    invoke-static {p3, p4, p0, p0, p2}, Lcom/tencent/liteav/basic/c/j;->a(IIII[I)I

    move-result p0

    aput p0, p2, v0

    .line 350
    aget p0, p1, v0

    const p1, 0x8d40

    invoke-static {p1, p0}, Landroid/opengl/GLES20;->glBindFramebuffer(II)V

    const/16 p0, 0xde1

    .line 351
    aget p2, p2, v0

    const p3, 0x8ce0

    invoke-static {p1, p3, p0, p2, v0}, Landroid/opengl/GLES20;->glFramebufferTexture2D(IIIII)V

    .line 352
    invoke-static {p1, v0}, Landroid/opengl/GLES20;->glBindFramebuffer(II)V

    return-void
.end method

.method public static synthetic a(Lcom/tencent/liteav/beauty/c;Lcom/tencent/liteav/beauty/d$b;)Z
    .locals 0

    .line 222
    invoke-direct {p0, p1}, Lcom/tencent/liteav/beauty/c;->c(Lcom/tencent/liteav/beauty/d$b;)Z

    move-result p0

    return p0
.end method

.method public static synthetic a(Lcom/tencent/liteav/beauty/c;Z)Z
    .locals 0

    .line 223
    iput-boolean p1, p0, Lcom/tencent/liteav/beauty/c;->V:Z

    return p1
.end method

.method public static synthetic a(Lcom/tencent/liteav/beauty/c;[F)[F
    .locals 0

    .line 224
    iput-object p1, p0, Lcom/tencent/liteav/beauty/c;->U:[F

    return-object p1
.end method

.method public static synthetic b(Lcom/tencent/liteav/beauty/c;I)I
    .locals 0

    .line 152
    invoke-direct {p0, p1}, Lcom/tencent/liteav/beauty/c;->A(I)I

    move-result p0

    return p0
.end method

.method public static synthetic b(Lcom/tencent/liteav/beauty/c;)Lcom/tencent/liteav/beauty/b/z;
    .locals 0

    .line 153
    iget-object p0, p0, Lcom/tencent/liteav/beauty/c;->ao:Lcom/tencent/liteav/beauty/b/z;

    return-object p0
.end method

.method private b()V
    .locals 6

    .line 1
    const-string v0, "come into releaseInternal"

    .line 2
    .line 3
    const-string v1, "TXCFilterDrawer"

    .line 4
    .line 5
    invoke-static {v1, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    iput-boolean v0, p0, Lcom/tencent/liteav/beauty/c;->aS:Z

    .line 10
    .line 11
    iget-object v2, p0, Lcom/tencent/liteav/beauty/c;->aa:Lcom/tencent/liteav/beauty/b/k;

    .line 12
    .line 13
    const/4 v3, 0x0

    .line 14
    if-eqz v2, :cond_0

    .line 15
    .line 16
    invoke-virtual {v2}, Lcom/tencent/liteav/basic/c/h;->d()V

    .line 17
    .line 18
    .line 19
    iput-object v3, p0, Lcom/tencent/liteav/beauty/c;->aa:Lcom/tencent/liteav/beauty/b/k;

    .line 20
    .line 21
    :cond_0
    iget-object v2, p0, Lcom/tencent/liteav/beauty/c;->ab:Lcom/tencent/liteav/beauty/b/p;

    .line 22
    .line 23
    if-eqz v2, :cond_1

    .line 24
    .line 25
    invoke-virtual {v2}, Lcom/tencent/liteav/basic/c/h;->d()V

    .line 26
    .line 27
    .line 28
    iput-object v3, p0, Lcom/tencent/liteav/beauty/c;->ab:Lcom/tencent/liteav/beauty/b/p;

    .line 29
    .line 30
    :cond_1
    invoke-direct {p0}, Lcom/tencent/liteav/beauty/c;->c()V

    .line 31
    .line 32
    .line 33
    iget-object v2, p0, Lcom/tencent/liteav/beauty/c;->am:Lcom/tencent/liteav/beauty/b/m;

    .line 34
    .line 35
    if-eqz v2, :cond_2

    .line 36
    .line 37
    invoke-virtual {v2}, Lcom/tencent/liteav/basic/c/h;->d()V

    .line 38
    .line 39
    .line 40
    iput-object v3, p0, Lcom/tencent/liteav/beauty/c;->am:Lcom/tencent/liteav/beauty/b/m;

    .line 41
    .line 42
    :cond_2
    iget-object v2, p0, Lcom/tencent/liteav/beauty/c;->an:Lcom/tencent/liteav/beauty/b/n;

    .line 43
    .line 44
    if-eqz v2, :cond_3

    .line 45
    .line 46
    invoke-interface {v2}, Lcom/tencent/liteav/beauty/b/n;->a()V

    .line 47
    .line 48
    .line 49
    iput-object v3, p0, Lcom/tencent/liteav/beauty/c;->an:Lcom/tencent/liteav/beauty/b/n;

    .line 50
    .line 51
    :cond_3
    iget-object v2, p0, Lcom/tencent/liteav/beauty/c;->at:Lcom/tencent/liteav/basic/c/i;

    .line 52
    .line 53
    if-eqz v2, :cond_4

    .line 54
    .line 55
    invoke-virtual {v2}, Lcom/tencent/liteav/basic/c/h;->d()V

    .line 56
    .line 57
    .line 58
    iput-object v3, p0, Lcom/tencent/liteav/beauty/c;->at:Lcom/tencent/liteav/basic/c/i;

    .line 59
    .line 60
    :cond_4
    iget-object v2, p0, Lcom/tencent/liteav/beauty/c;->as:Lcom/tencent/liteav/beauty/b/l;

    .line 61
    .line 62
    if-eqz v2, :cond_5

    .line 63
    .line 64
    invoke-virtual {v2}, Lcom/tencent/liteav/basic/c/h;->d()V

    .line 65
    .line 66
    .line 67
    iput-object v3, p0, Lcom/tencent/liteav/beauty/c;->as:Lcom/tencent/liteav/beauty/b/l;

    .line 68
    .line 69
    :cond_5
    iget-object v2, p0, Lcom/tencent/liteav/beauty/c;->ar:Lcom/tencent/liteav/basic/c/h;

    .line 70
    .line 71
    if-eqz v2, :cond_6

    .line 72
    .line 73
    invoke-virtual {v2}, Lcom/tencent/liteav/basic/c/h;->d()V

    .line 74
    .line 75
    .line 76
    iput-object v3, p0, Lcom/tencent/liteav/beauty/c;->ar:Lcom/tencent/liteav/basic/c/h;

    .line 77
    .line 78
    :cond_6
    iget-object v2, p0, Lcom/tencent/liteav/beauty/c;->ao:Lcom/tencent/liteav/beauty/b/z;

    .line 79
    .line 80
    if-eqz v2, :cond_7

    .line 81
    .line 82
    invoke-virtual {v2}, Lcom/tencent/liteav/beauty/b/z;->d()V

    .line 83
    .line 84
    .line 85
    iput-object v3, p0, Lcom/tencent/liteav/beauty/c;->ao:Lcom/tencent/liteav/beauty/b/z;

    .line 86
    .line 87
    :cond_7
    iget-object v2, p0, Lcom/tencent/liteav/beauty/c;->ap:Lcom/tencent/liteav/beauty/b/j;

    .line 88
    .line 89
    if-eqz v2, :cond_8

    .line 90
    .line 91
    invoke-virtual {v2}, Lcom/tencent/liteav/beauty/b/j;->a()V

    .line 92
    .line 93
    .line 94
    iput-object v3, p0, Lcom/tencent/liteav/beauty/c;->ap:Lcom/tencent/liteav/beauty/b/j;

    .line 95
    .line 96
    :cond_8
    iget-object v2, p0, Lcom/tencent/liteav/beauty/c;->aq:Lcom/tencent/liteav/beauty/b/i;

    .line 97
    .line 98
    if-eqz v2, :cond_9

    .line 99
    .line 100
    invoke-virtual {v2}, Lcom/tencent/liteav/basic/c/h;->d()V

    .line 101
    .line 102
    .line 103
    iput-object v3, p0, Lcom/tencent/liteav/beauty/c;->aq:Lcom/tencent/liteav/beauty/b/i;

    .line 104
    .line 105
    :cond_9
    iget-object v2, p0, Lcom/tencent/liteav/beauty/c;->au:Lcom/tencent/liteav/basic/c/h;

    .line 106
    .line 107
    if-eqz v2, :cond_a

    .line 108
    .line 109
    invoke-virtual {v2}, Lcom/tencent/liteav/basic/c/h;->d()V

    .line 110
    .line 111
    .line 112
    iput-object v3, p0, Lcom/tencent/liteav/beauty/c;->au:Lcom/tencent/liteav/basic/c/h;

    .line 113
    .line 114
    :cond_a
    iget-object v2, p0, Lcom/tencent/liteav/beauty/c;->b:[I

    .line 115
    .line 116
    const/4 v4, 0x1

    .line 117
    if-eqz v2, :cond_b

    .line 118
    .line 119
    invoke-static {v4, v2, v0}, Landroid/opengl/GLES20;->glDeleteFramebuffers(I[II)V

    .line 120
    .line 121
    .line 122
    iput-object v3, p0, Lcom/tencent/liteav/beauty/c;->b:[I

    .line 123
    .line 124
    :cond_b
    iget-object v2, p0, Lcom/tencent/liteav/beauty/c;->c:[I

    .line 125
    .line 126
    if-eqz v2, :cond_c

    .line 127
    .line 128
    invoke-static {v4, v2, v0}, Landroid/opengl/GLES20;->glDeleteTextures(I[II)V

    .line 129
    .line 130
    .line 131
    iput-object v3, p0, Lcom/tencent/liteav/beauty/c;->c:[I

    .line 132
    .line 133
    :cond_c
    iget-object v2, p0, Lcom/tencent/liteav/beauty/c;->aR:[I

    .line 134
    .line 135
    if-eqz v2, :cond_d

    .line 136
    .line 137
    aget v5, v2, v0

    .line 138
    .line 139
    if-lez v5, :cond_d

    .line 140
    .line 141
    invoke-static {v4, v2, v0}, Landroid/opengl/GLES20;->glDeleteBuffers(I[II)V

    .line 142
    .line 143
    .line 144
    iput-object v3, p0, Lcom/tencent/liteav/beauty/c;->aR:[I

    .line 145
    .line 146
    :cond_d
    const-string p0, "come out releaseInternal"

    .line 147
    .line 148
    invoke-static {v1, p0}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 149
    .line 150
    .line 151
    return-void
.end method

.method private b(II)V
    .locals 3

    .line 166
    iget-object v0, p0, Lcom/tencent/liteav/beauty/c;->au:Lcom/tencent/liteav/basic/c/h;

    if-nez v0, :cond_1

    .line 167
    const-string v0, "createRecoverScaleFilter"

    const-string v1, "TXCFilterDrawer"

    invoke-static {v1, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 168
    new-instance v0, Lcom/tencent/liteav/basic/c/h;

    invoke-direct {v0}, Lcom/tencent/liteav/basic/c/h;-><init>()V

    iput-object v0, p0, Lcom/tencent/liteav/beauty/c;->au:Lcom/tencent/liteav/basic/c/h;

    .line 169
    invoke-virtual {v0}, Lcom/tencent/liteav/basic/c/h;->a()Z

    move-result v0

    const/4 v2, 0x1

    if-ne v2, v0, :cond_0

    .line 170
    iget-object v0, p0, Lcom/tencent/liteav/beauty/c;->au:Lcom/tencent/liteav/basic/c/h;

    invoke-virtual {v0, v2}, Lcom/tencent/liteav/basic/c/h;->a(Z)V

    goto :goto_0

    .line 171
    :cond_0
    const-string v0, "mRecoverScaleFilter init failed!"

    invoke-static {v1, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 172
    :cond_1
    :goto_0
    iget-object p0, p0, Lcom/tencent/liteav/beauty/c;->au:Lcom/tencent/liteav/basic/c/h;

    if-eqz p0, :cond_2

    invoke-virtual {p0, p1, p2}, Lcom/tencent/liteav/basic/c/h;->a(II)V

    :cond_2
    return-void
.end method

.method private b([B)V
    .locals 0

    .line 157
    iget-object p0, p0, Lcom/tencent/liteav/beauty/c;->aa:Lcom/tencent/liteav/beauty/b/k;

    if-nez p0, :cond_0

    .line 158
    const-string p0, "TXCFilterDrawer"

    const-string p1, "mI4202RGBAFilter is null!"

    invoke-static {p0, p1}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    .line 159
    :cond_0
    invoke-virtual {p0, p1}, Lcom/tencent/liteav/beauty/b/k;->a([B)V

    return-void
.end method

.method public static synthetic b(Lcom/tencent/liteav/beauty/c;Lcom/tencent/liteav/beauty/d$b;)Z
    .locals 0

    .line 154
    invoke-direct {p0, p1}, Lcom/tencent/liteav/beauty/c;->d(Lcom/tencent/liteav/beauty/d$b;)Z

    move-result p0

    return p0
.end method

.method public static synthetic b(Lcom/tencent/liteav/beauty/c;Z)Z
    .locals 0

    .line 155
    iput-boolean p1, p0, Lcom/tencent/liteav/beauty/c;->aH:Z

    return p1
.end method

.method public static synthetic c(Lcom/tencent/liteav/beauty/c;)I
    .locals 0

    .line 328
    iget p0, p0, Lcom/tencent/liteav/beauty/c;->L:I

    return p0
.end method

.method private c()V
    .locals 2

    .line 331
    iget-object v0, p0, Lcom/tencent/liteav/beauty/c;->ad:Lcom/tencent/liteav/beauty/b/a/a;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 332
    invoke-virtual {v0}, Lcom/tencent/liteav/basic/c/h;->d()V

    .line 333
    iput-object v1, p0, Lcom/tencent/liteav/beauty/c;->ad:Lcom/tencent/liteav/beauty/b/a/a;

    .line 334
    :cond_0
    iget-object v0, p0, Lcom/tencent/liteav/beauty/c;->ae:Lcom/tencent/liteav/beauty/b/b/a;

    if-eqz v0, :cond_1

    .line 335
    invoke-virtual {v0}, Lcom/tencent/liteav/basic/c/h;->d()V

    .line 336
    iput-object v1, p0, Lcom/tencent/liteav/beauty/c;->ae:Lcom/tencent/liteav/beauty/b/b/a;

    .line 337
    :cond_1
    iget-object v0, p0, Lcom/tencent/liteav/beauty/c;->af:Lcom/tencent/liteav/beauty/b/c;

    if-eqz v0, :cond_2

    .line 338
    invoke-virtual {v0}, Lcom/tencent/liteav/basic/c/h;->d()V

    .line 339
    iput-object v1, p0, Lcom/tencent/liteav/beauty/c;->af:Lcom/tencent/liteav/beauty/b/c;

    .line 340
    :cond_2
    iget-object v0, p0, Lcom/tencent/liteav/beauty/c;->ag:Lcom/tencent/liteav/beauty/b/c/a;

    if-eqz v0, :cond_3

    .line 341
    invoke-virtual {v0}, Lcom/tencent/liteav/basic/c/h;->d()V

    .line 342
    iput-object v1, p0, Lcom/tencent/liteav/beauty/c;->ag:Lcom/tencent/liteav/beauty/b/c/a;

    .line 343
    :cond_3
    iput-object v1, p0, Lcom/tencent/liteav/beauty/c;->ac:Lcom/tencent/liteav/beauty/b/b;

    return-void
.end method

.method private c(Lcom/tencent/liteav/beauty/d$b;)Z
    .locals 13

    .line 1
    const-string v2, "come into initInternal"

    .line 2
    .line 3
    const-string v9, "TXCFilterDrawer"

    .line 4
    .line 5
    invoke-static {v9, v2}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-direct {p0}, Lcom/tencent/liteav/beauty/c;->b()V

    .line 9
    .line 10
    .line 11
    iget-boolean v2, p1, Lcom/tencent/liteav/beauty/d$b;->j:Z

    .line 12
    .line 13
    iput-boolean v2, p0, Lcom/tencent/liteav/beauty/c;->aw:Z

    .line 14
    .line 15
    iget v2, p1, Lcom/tencent/liteav/beauty/d$b;->d:I

    .line 16
    .line 17
    iput v2, p0, Lcom/tencent/liteav/beauty/c;->J:I

    .line 18
    .line 19
    iget v2, p1, Lcom/tencent/liteav/beauty/d$b;->e:I

    .line 20
    .line 21
    iput v2, p0, Lcom/tencent/liteav/beauty/c;->K:I

    .line 22
    .line 23
    iget-object v2, p1, Lcom/tencent/liteav/beauty/d$b;->m:Lcom/tencent/liteav/basic/c/a;

    .line 24
    .line 25
    iput-object v2, p0, Lcom/tencent/liteav/beauty/c;->Y:Lcom/tencent/liteav/basic/c/a;

    .line 26
    .line 27
    iget v8, p1, Lcom/tencent/liteav/beauty/d$b;->g:I

    .line 28
    .line 29
    iget v10, p1, Lcom/tencent/liteav/beauty/d$b;->f:I

    .line 30
    .line 31
    iget v11, p1, Lcom/tencent/liteav/beauty/d$b;->h:I

    .line 32
    .line 33
    iget-boolean v2, p1, Lcom/tencent/liteav/beauty/d$b;->i:Z

    .line 34
    .line 35
    iput-boolean v2, p0, Lcom/tencent/liteav/beauty/c;->T:Z

    .line 36
    .line 37
    iget v2, p1, Lcom/tencent/liteav/beauty/d$b;->b:I

    .line 38
    .line 39
    iput v2, p0, Lcom/tencent/liteav/beauty/c;->Q:I

    .line 40
    .line 41
    iget v3, p1, Lcom/tencent/liteav/beauty/d$b;->c:I

    .line 42
    .line 43
    iput v3, p0, Lcom/tencent/liteav/beauty/c;->R:I

    .line 44
    .line 45
    iget v12, p1, Lcom/tencent/liteav/beauty/d$b;->a:I

    .line 46
    .line 47
    iput v8, p0, Lcom/tencent/liteav/beauty/c;->L:I

    .line 48
    .line 49
    iput v10, p0, Lcom/tencent/liteav/beauty/c;->M:I

    .line 50
    .line 51
    const/16 v4, 0x5a

    .line 52
    .line 53
    if-eq v11, v4, :cond_0

    .line 54
    .line 55
    const/16 v4, 0x10e

    .line 56
    .line 57
    if-ne v11, v4, :cond_1

    .line 58
    .line 59
    :cond_0
    iput v10, p0, Lcom/tencent/liteav/beauty/c;->L:I

    .line 60
    .line 61
    iput v8, p0, Lcom/tencent/liteav/beauty/c;->M:I

    .line 62
    .line 63
    :cond_1
    iget v4, p1, Lcom/tencent/liteav/beauty/d$b;->l:I

    .line 64
    .line 65
    iput v4, p0, Lcom/tencent/liteav/beauty/c;->X:I

    .line 66
    .line 67
    iget v1, p1, Lcom/tencent/liteav/beauty/d$b;->k:I

    .line 68
    .line 69
    iput v1, p0, Lcom/tencent/liteav/beauty/c;->W:I

    .line 70
    .line 71
    mul-int/2addr v2, v3

    .line 72
    mul-int/lit8 v2, v2, 0x4

    .line 73
    .line 74
    new-array v1, v2, [B

    .line 75
    .line 76
    iput-object v1, p0, Lcom/tencent/liteav/beauty/c;->aQ:[B

    .line 77
    .line 78
    iget v1, p0, Lcom/tencent/liteav/beauty/c;->P:F

    .line 79
    .line 80
    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 81
    .line 82
    .line 83
    move-result-object v1

    .line 84
    iget v2, p0, Lcom/tencent/liteav/beauty/c;->L:I

    .line 85
    .line 86
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 87
    .line 88
    .line 89
    move-result-object v2

    .line 90
    iget v3, p0, Lcom/tencent/liteav/beauty/c;->M:I

    .line 91
    .line 92
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 93
    .line 94
    .line 95
    move-result-object v3

    .line 96
    filled-new-array {v1, v2, v3}, [Ljava/lang/Object;

    .line 97
    .line 98
    .line 99
    move-result-object v1

    .line 100
    const-string v2, "processWidth mPituScaleRatio is %f, process size: %d x %d"

    .line 101
    .line 102
    invoke-static {v9, v2, v1}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 103
    .line 104
    .line 105
    iget v1, p0, Lcom/tencent/liteav/beauty/c;->P:F

    .line 106
    .line 107
    const/high16 v2, 0x3f800000    # 1.0f

    .line 108
    .line 109
    cmpl-float v1, v1, v2

    .line 110
    .line 111
    if-eqz v1, :cond_4

    .line 112
    .line 113
    iget v1, p0, Lcom/tencent/liteav/beauty/c;->L:I

    .line 114
    .line 115
    iget v3, p0, Lcom/tencent/liteav/beauty/c;->M:I

    .line 116
    .line 117
    if-ge v1, v3, :cond_2

    .line 118
    .line 119
    goto :goto_0

    .line 120
    :cond_2
    move v1, v3

    .line 121
    :goto_0
    const/16 v3, 0x170

    .line 122
    .line 123
    if-le v1, v3, :cond_3

    .line 124
    .line 125
    const/high16 v3, 0x43d80000    # 432.0f

    .line 126
    .line 127
    int-to-float v1, v1

    .line 128
    div-float/2addr v3, v1

    .line 129
    iput v3, p0, Lcom/tencent/liteav/beauty/c;->P:F

    .line 130
    .line 131
    :cond_3
    iget v1, p0, Lcom/tencent/liteav/beauty/c;->P:F

    .line 132
    .line 133
    cmpl-float v1, v1, v2

    .line 134
    .line 135
    if-lez v1, :cond_4

    .line 136
    .line 137
    iput v2, p0, Lcom/tencent/liteav/beauty/c;->P:F

    .line 138
    .line 139
    :cond_4
    iget v1, p0, Lcom/tencent/liteav/beauty/c;->L:I

    .line 140
    .line 141
    int-to-float v1, v1

    .line 142
    iget v2, p0, Lcom/tencent/liteav/beauty/c;->P:F

    .line 143
    .line 144
    mul-float/2addr v1, v2

    .line 145
    float-to-int v1, v1

    .line 146
    iput v1, p0, Lcom/tencent/liteav/beauty/c;->N:I

    .line 147
    .line 148
    iget v3, p0, Lcom/tencent/liteav/beauty/c;->M:I

    .line 149
    .line 150
    int-to-float v3, v3

    .line 151
    mul-float/2addr v3, v2

    .line 152
    float-to-int v2, v3

    .line 153
    iput v2, p0, Lcom/tencent/liteav/beauty/c;->O:I

    .line 154
    .line 155
    iget v3, p0, Lcom/tencent/liteav/beauty/c;->aC:I

    .line 156
    .line 157
    invoke-direct {p0, v1, v2, v3}, Lcom/tencent/liteav/beauty/c;->a(III)V

    .line 158
    .line 159
    .line 160
    iget-object v1, p0, Lcom/tencent/liteav/beauty/c;->I:Lcom/tencent/liteav/beauty/d$f;

    .line 161
    .line 162
    if-eqz v1, :cond_5

    .line 163
    .line 164
    iget-object v1, v1, Lcom/tencent/liteav/beauty/d$f;->a:Landroid/graphics/Bitmap;

    .line 165
    .line 166
    if-eqz v1, :cond_5

    .line 167
    .line 168
    iget-object v1, p0, Lcom/tencent/liteav/beauty/c;->ao:Lcom/tencent/liteav/beauty/b/z;

    .line 169
    .line 170
    if-nez v1, :cond_5

    .line 171
    .line 172
    const-string v1, "reset water mark!"

    .line 173
    .line 174
    invoke-static {v9, v1}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 175
    .line 176
    .line 177
    iget-object v1, p0, Lcom/tencent/liteav/beauty/c;->I:Lcom/tencent/liteav/beauty/d$f;

    .line 178
    .line 179
    iget-object v2, v1, Lcom/tencent/liteav/beauty/d$f;->a:Landroid/graphics/Bitmap;

    .line 180
    .line 181
    iget v3, v1, Lcom/tencent/liteav/beauty/d$f;->b:F

    .line 182
    .line 183
    iget v4, v1, Lcom/tencent/liteav/beauty/d$f;->c:F

    .line 184
    .line 185
    iget v1, v1, Lcom/tencent/liteav/beauty/d$f;->d:F

    .line 186
    .line 187
    invoke-virtual {p0, v2, v3, v4, v1}, Lcom/tencent/liteav/beauty/c;->a(Landroid/graphics/Bitmap;FFF)V

    .line 188
    .line 189
    .line 190
    :cond_5
    iget-object v4, p0, Lcom/tencent/liteav/beauty/c;->ah:Landroid/graphics/Bitmap;

    .line 191
    .line 192
    if-nez v4, :cond_6

    .line 193
    .line 194
    iget-object v1, p0, Lcom/tencent/liteav/beauty/c;->ai:Landroid/graphics/Bitmap;

    .line 195
    .line 196
    if-eqz v1, :cond_7

    .line 197
    .line 198
    :cond_6
    iget-object v1, p0, Lcom/tencent/liteav/beauty/c;->am:Lcom/tencent/liteav/beauty/b/m;

    .line 199
    .line 200
    if-nez v1, :cond_7

    .line 201
    .line 202
    iget v1, p0, Lcom/tencent/liteav/beauty/c;->N:I

    .line 203
    .line 204
    iget v2, p0, Lcom/tencent/liteav/beauty/c;->O:I

    .line 205
    .line 206
    iget v3, p0, Lcom/tencent/liteav/beauty/c;->aj:F

    .line 207
    .line 208
    iget v5, p0, Lcom/tencent/liteav/beauty/c;->ak:F

    .line 209
    .line 210
    iget-object v6, p0, Lcom/tencent/liteav/beauty/c;->ai:Landroid/graphics/Bitmap;

    .line 211
    .line 212
    iget v7, p0, Lcom/tencent/liteav/beauty/c;->al:F

    .line 213
    .line 214
    move-object v0, p0

    .line 215
    invoke-direct/range {v0 .. v7}, Lcom/tencent/liteav/beauty/c;->a(IIFLandroid/graphics/Bitmap;FLandroid/graphics/Bitmap;F)V

    .line 216
    .line 217
    .line 218
    :cond_7
    iget-object v1, p0, Lcom/tencent/liteav/beauty/c;->Y:Lcom/tencent/liteav/basic/c/a;

    .line 219
    .line 220
    iget v4, p0, Lcom/tencent/liteav/beauty/c;->N:I

    .line 221
    .line 222
    iget v5, p0, Lcom/tencent/liteav/beauty/c;->O:I

    .line 223
    .line 224
    iget-boolean v6, p0, Lcom/tencent/liteav/beauty/c;->T:Z

    .line 225
    .line 226
    move v2, v8

    .line 227
    iget v8, p0, Lcom/tencent/liteav/beauty/c;->W:I

    .line 228
    .line 229
    move-object v0, p0

    .line 230
    move v3, v10

    .line 231
    move v7, v11

    .line 232
    invoke-direct/range {v0 .. v8}, Lcom/tencent/liteav/beauty/c;->a(Lcom/tencent/liteav/basic/c/a;IIIIZII)V

    .line 233
    .line 234
    .line 235
    move v6, v2

    .line 236
    move v7, v3

    .line 237
    iget v1, p0, Lcom/tencent/liteav/beauty/c;->L:I

    .line 238
    .line 239
    iget v2, p0, Lcom/tencent/liteav/beauty/c;->M:I

    .line 240
    .line 241
    iget v3, p0, Lcom/tencent/liteav/beauty/c;->Q:I

    .line 242
    .line 243
    iget v4, p0, Lcom/tencent/liteav/beauty/c;->R:I

    .line 244
    .line 245
    move v5, v12

    .line 246
    invoke-direct/range {v0 .. v5}, Lcom/tencent/liteav/beauty/c;->a(IIIII)V

    .line 247
    .line 248
    .line 249
    iget-object v1, p0, Lcom/tencent/liteav/beauty/c;->b:[I

    .line 250
    .line 251
    const/4 v2, 0x0

    .line 252
    const/4 v3, 0x1

    .line 253
    if-nez v1, :cond_8

    .line 254
    .line 255
    new-array v1, v3, [I

    .line 256
    .line 257
    iput-object v1, p0, Lcom/tencent/liteav/beauty/c;->b:[I

    .line 258
    .line 259
    goto :goto_1

    .line 260
    :cond_8
    invoke-static {v3, v1, v2}, Landroid/opengl/GLES20;->glDeleteFramebuffers(I[II)V

    .line 261
    .line 262
    .line 263
    :goto_1
    iget-object v1, p0, Lcom/tencent/liteav/beauty/c;->c:[I

    .line 264
    .line 265
    if-nez v1, :cond_9

    .line 266
    .line 267
    new-array v1, v3, [I

    .line 268
    .line 269
    iput-object v1, p0, Lcom/tencent/liteav/beauty/c;->c:[I

    .line 270
    .line 271
    goto :goto_2

    .line 272
    :cond_9
    invoke-static {v3, v1, v2}, Landroid/opengl/GLES20;->glDeleteTextures(I[II)V

    .line 273
    .line 274
    .line 275
    :goto_2
    iget-object v1, p0, Lcom/tencent/liteav/beauty/c;->b:[I

    .line 276
    .line 277
    iget-object v4, p0, Lcom/tencent/liteav/beauty/c;->c:[I

    .line 278
    .line 279
    iget v5, p0, Lcom/tencent/liteav/beauty/c;->Q:I

    .line 280
    .line 281
    iget v8, p0, Lcom/tencent/liteav/beauty/c;->R:I

    .line 282
    .line 283
    invoke-direct {p0, v1, v4, v5, v8}, Lcom/tencent/liteav/beauty/c;->a([I[III)V

    .line 284
    .line 285
    .line 286
    const/4 v1, 0x3

    .line 287
    invoke-static {}, Lcom/tencent/liteav/basic/c/j;->a()I

    .line 288
    .line 289
    .line 290
    move-result v4

    .line 291
    if-ne v1, v4, :cond_b

    .line 292
    .line 293
    iget-object v1, p0, Lcom/tencent/liteav/beauty/c;->aR:[I

    .line 294
    .line 295
    if-nez v1, :cond_a

    .line 296
    .line 297
    new-array v1, v3, [I

    .line 298
    .line 299
    iput-object v1, p0, Lcom/tencent/liteav/beauty/c;->aR:[I

    .line 300
    .line 301
    goto :goto_3

    .line 302
    :cond_a
    const-string v1, "m_pbo0 is not null, delete Buffers, and recreate"

    .line 303
    .line 304
    invoke-static {v9, v1}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 305
    .line 306
    .line 307
    iget-object v1, p0, Lcom/tencent/liteav/beauty/c;->aR:[I

    .line 308
    .line 309
    invoke-static {v3, v1, v2}, Landroid/opengl/GLES20;->glDeleteBuffers(I[II)V

    .line 310
    .line 311
    .line 312
    :goto_3
    const-string v1, "opengl es 3.0, use PBO"

    .line 313
    .line 314
    invoke-static {v9, v1}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 315
    .line 316
    .line 317
    iget-object v0, p0, Lcom/tencent/liteav/beauty/c;->aR:[I

    .line 318
    .line 319
    invoke-static {v6, v7, v0}, Lcom/tencent/liteav/basic/c/j;->a(II[I)I

    .line 320
    .line 321
    .line 322
    :cond_b
    const-string v0, "come out initInternal"

    .line 323
    .line 324
    invoke-static {v9, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 325
    .line 326
    .line 327
    return v3
.end method

.method public static synthetic d(Lcom/tencent/liteav/beauty/c;)I
    .locals 0

    .line 97
    iget p0, p0, Lcom/tencent/liteav/beauty/c;->M:I

    return p0
.end method

.method private d(Lcom/tencent/liteav/beauty/d$b;)Z
    .locals 8

    .line 1
    iget v0, p1, Lcom/tencent/liteav/beauty/d$b;->k:I

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const-string v2, "TXCFilterDrawer"

    .line 5
    .line 6
    const/4 v3, 0x2

    .line 7
    const/4 v4, 0x3

    .line 8
    const/4 v5, 0x1

    .line 9
    if-eq v5, v0, :cond_0

    .line 10
    .line 11
    if-eq v4, v0, :cond_0

    .line 12
    .line 13
    if-ne v3, v0, :cond_2

    .line 14
    .line 15
    :cond_0
    iget-object v0, p0, Lcom/tencent/liteav/beauty/c;->aa:Lcom/tencent/liteav/beauty/b/k;

    .line 16
    .line 17
    if-nez v0, :cond_2

    .line 18
    .line 19
    new-instance v0, Lcom/tencent/liteav/beauty/b/k;

    .line 20
    .line 21
    iget v6, p1, Lcom/tencent/liteav/beauty/d$b;->k:I

    .line 22
    .line 23
    invoke-direct {v0, v6}, Lcom/tencent/liteav/beauty/b/k;-><init>(I)V

    .line 24
    .line 25
    .line 26
    iput-object v0, p0, Lcom/tencent/liteav/beauty/c;->aa:Lcom/tencent/liteav/beauty/b/k;

    .line 27
    .line 28
    invoke-virtual {v0, v5}, Lcom/tencent/liteav/basic/c/h;->a(Z)V

    .line 29
    .line 30
    .line 31
    iget-object v0, p0, Lcom/tencent/liteav/beauty/c;->aa:Lcom/tencent/liteav/beauty/b/k;

    .line 32
    .line 33
    invoke-virtual {v0}, Lcom/tencent/liteav/beauty/b/k;->a()Z

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    if-nez v0, :cond_1

    .line 38
    .line 39
    const-string p0, "mI4202RGBAFilter init failed!!, break init"

    .line 40
    .line 41
    invoke-static {v2, p0}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    return v1

    .line 45
    :cond_1
    iget-object v0, p0, Lcom/tencent/liteav/beauty/c;->aa:Lcom/tencent/liteav/beauty/b/k;

    .line 46
    .line 47
    iget v6, p1, Lcom/tencent/liteav/beauty/d$b;->d:I

    .line 48
    .line 49
    iget v7, p1, Lcom/tencent/liteav/beauty/d$b;->e:I

    .line 50
    .line 51
    invoke-virtual {v0, v6, v7}, Lcom/tencent/liteav/beauty/b/k;->a(II)V

    .line 52
    .line 53
    .line 54
    :cond_2
    iget v0, p1, Lcom/tencent/liteav/beauty/d$b;->l:I

    .line 55
    .line 56
    if-eq v5, v0, :cond_3

    .line 57
    .line 58
    if-eq v4, v0, :cond_3

    .line 59
    .line 60
    if-ne v3, v0, :cond_5

    .line 61
    .line 62
    :cond_3
    iget-object v0, p0, Lcom/tencent/liteav/beauty/c;->ab:Lcom/tencent/liteav/beauty/b/p;

    .line 63
    .line 64
    if-nez v0, :cond_5

    .line 65
    .line 66
    new-instance v0, Lcom/tencent/liteav/beauty/b/p;

    .line 67
    .line 68
    iget v3, p1, Lcom/tencent/liteav/beauty/d$b;->l:I

    .line 69
    .line 70
    invoke-direct {v0, v3}, Lcom/tencent/liteav/beauty/b/p;-><init>(I)V

    .line 71
    .line 72
    .line 73
    iput-object v0, p0, Lcom/tencent/liteav/beauty/c;->ab:Lcom/tencent/liteav/beauty/b/p;

    .line 74
    .line 75
    invoke-virtual {v0}, Lcom/tencent/liteav/beauty/b/p;->a()Z

    .line 76
    .line 77
    .line 78
    move-result v0

    .line 79
    if-nez v0, :cond_4

    .line 80
    .line 81
    const-string p0, "mRGBA2I420Filter init failed!!, break init"

    .line 82
    .line 83
    invoke-static {v2, p0}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 84
    .line 85
    .line 86
    return v1

    .line 87
    :cond_4
    iget-object p0, p0, Lcom/tencent/liteav/beauty/c;->ab:Lcom/tencent/liteav/beauty/b/p;

    .line 88
    .line 89
    iget v0, p1, Lcom/tencent/liteav/beauty/d$b;->b:I

    .line 90
    .line 91
    iget p1, p1, Lcom/tencent/liteav/beauty/d$b;->c:I

    .line 92
    .line 93
    invoke-virtual {p0, v0, p1}, Lcom/tencent/liteav/beauty/b/p;->a(II)V

    .line 94
    .line 95
    .line 96
    :cond_5
    return v5
.end method

.method public static synthetic e(Lcom/tencent/liteav/beauty/c;)Lcom/tencent/liteav/beauty/b/b;
    .locals 0

    .line 12
    iget-object p0, p0, Lcom/tencent/liteav/beauty/c;->ac:Lcom/tencent/liteav/beauty/b/b;

    return-object p0
.end method

.method public static synthetic f(Lcom/tencent/liteav/beauty/c;)I
    .locals 0

    .line 12
    iget p0, p0, Lcom/tencent/liteav/beauty/c;->N:I

    return p0
.end method

.method public static synthetic g(Lcom/tencent/liteav/beauty/c;)I
    .locals 0

    .line 12
    iget p0, p0, Lcom/tencent/liteav/beauty/c;->O:I

    return p0
.end method

.method public static synthetic h(Lcom/tencent/liteav/beauty/c;)Landroid/graphics/Bitmap;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/liteav/beauty/c;->ah:Landroid/graphics/Bitmap;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic i(Lcom/tencent/liteav/beauty/c;)Landroid/graphics/Bitmap;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/liteav/beauty/c;->ai:Landroid/graphics/Bitmap;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic j(Lcom/tencent/liteav/beauty/c;)F
    .locals 0

    .line 1
    iget p0, p0, Lcom/tencent/liteav/beauty/c;->aj:F

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic k(Lcom/tencent/liteav/beauty/c;)F
    .locals 0

    .line 1
    iget p0, p0, Lcom/tencent/liteav/beauty/c;->ak:F

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic l(Lcom/tencent/liteav/beauty/c;)F
    .locals 0

    .line 1
    iget p0, p0, Lcom/tencent/liteav/beauty/c;->al:F

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic m(Lcom/tencent/liteav/beauty/c;)Lcom/tencent/liteav/beauty/a/a/a;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/liteav/beauty/c;->aJ:Lcom/tencent/liteav/beauty/a/a/a;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic n(Lcom/tencent/liteav/beauty/c;)Lcom/tencent/liteav/beauty/a/a/c;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/liteav/beauty/c;->aI:Lcom/tencent/liteav/beauty/a/a/c;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic o(Lcom/tencent/liteav/beauty/c;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/tencent/liteav/beauty/c;->b()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic p(Lcom/tencent/liteav/beauty/c;)F
    .locals 0

    .line 1
    iget p0, p0, Lcom/tencent/liteav/beauty/c;->aB:F

    .line 2
    .line 3
    return p0
.end method


# virtual methods
.method public a(IIJ)I
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/tencent/liteav/beauty/c;->av:Ljava/util/Queue;

    .line 2
    .line 3
    invoke-direct {p0, v0}, Lcom/tencent/liteav/beauty/c;->a(Ljava/util/Queue;)V

    .line 4
    .line 5
    .line 6
    iget v0, p0, Lcom/tencent/liteav/beauty/c;->P:F

    .line 7
    .line 8
    const/high16 v1, 0x3f800000    # 1.0f

    .line 9
    .line 10
    cmpl-float v0, v0, v1

    .line 11
    .line 12
    const/4 v1, 0x1

    .line 13
    const/4 v2, 0x0

    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    move v0, v1

    .line 17
    goto :goto_0

    .line 18
    :cond_0
    move v0, v2

    .line 19
    :goto_0
    iget v3, p0, Lcom/tencent/liteav/beauty/c;->N:I

    .line 20
    .line 21
    iget v4, p0, Lcom/tencent/liteav/beauty/c;->O:I

    .line 22
    .line 23
    invoke-static {v2, v2, v3, v4}, Landroid/opengl/GLES20;->glViewport(IIII)V

    .line 24
    .line 25
    .line 26
    iget-object v3, p0, Lcom/tencent/liteav/beauty/c;->as:Lcom/tencent/liteav/beauty/b/l;

    .line 27
    .line 28
    if-eqz v3, :cond_3

    .line 29
    .line 30
    const/4 v4, 0x4

    .line 31
    if-eq v4, p2, :cond_1

    .line 32
    .line 33
    iget-boolean p2, p0, Lcom/tencent/liteav/beauty/c;->V:Z

    .line 34
    .line 35
    if-ne v1, p2, :cond_2

    .line 36
    .line 37
    :cond_1
    iget-object p2, p0, Lcom/tencent/liteav/beauty/c;->U:[F

    .line 38
    .line 39
    invoke-virtual {v3, p2}, Lcom/tencent/liteav/beauty/b/l;->a([F)V

    .line 40
    .line 41
    .line 42
    iget-object p2, p0, Lcom/tencent/liteav/beauty/c;->as:Lcom/tencent/liteav/beauty/b/l;

    .line 43
    .line 44
    iget-boolean v1, p0, Lcom/tencent/liteav/beauty/c;->V:Z

    .line 45
    .line 46
    invoke-virtual {p2, v1}, Lcom/tencent/liteav/beauty/b/l;->c(Z)V

    .line 47
    .line 48
    .line 49
    :cond_2
    iget-object p2, p0, Lcom/tencent/liteav/beauty/c;->as:Lcom/tencent/liteav/beauty/b/l;

    .line 50
    .line 51
    invoke-virtual {p2, p1}, Lcom/tencent/liteav/basic/c/h;->b(I)I

    .line 52
    .line 53
    .line 54
    move-result p1

    .line 55
    :cond_3
    iget-object p2, p0, Lcom/tencent/liteav/beauty/c;->ac:Lcom/tencent/liteav/beauty/b/b;

    .line 56
    .line 57
    if-eqz p2, :cond_6

    .line 58
    .line 59
    iget p2, p0, Lcom/tencent/liteav/beauty/c;->Q:I

    .line 60
    .line 61
    iget v1, p0, Lcom/tencent/liteav/beauty/c;->R:I

    .line 62
    .line 63
    invoke-static {p2, v1}, Ljava/lang/Math;->min(II)I

    .line 64
    .line 65
    .line 66
    move-result p2

    .line 67
    const/16 v1, 0x21c

    .line 68
    .line 69
    if-ge p2, v1, :cond_4

    .line 70
    .line 71
    move p2, v2

    .line 72
    goto :goto_1

    .line 73
    :cond_4
    iget p2, p0, Lcom/tencent/liteav/beauty/c;->aF:I

    .line 74
    .line 75
    :goto_1
    iget-object v1, p0, Lcom/tencent/liteav/beauty/c;->ac:Lcom/tencent/liteav/beauty/b/b;

    .line 76
    .line 77
    invoke-virtual {v1, p2}, Lcom/tencent/liteav/beauty/b/b;->f(I)V

    .line 78
    .line 79
    .line 80
    iget v1, p0, Lcom/tencent/liteav/beauty/c;->aD:I

    .line 81
    .line 82
    if-gtz v1, :cond_5

    .line 83
    .line 84
    iget v1, p0, Lcom/tencent/liteav/beauty/c;->aE:I

    .line 85
    .line 86
    if-gtz v1, :cond_5

    .line 87
    .line 88
    iget v1, p0, Lcom/tencent/liteav/beauty/c;->aG:I

    .line 89
    .line 90
    if-gtz v1, :cond_5

    .line 91
    .line 92
    if-lez p2, :cond_6

    .line 93
    .line 94
    :cond_5
    iget-object p2, p0, Lcom/tencent/liteav/beauty/c;->ac:Lcom/tencent/liteav/beauty/b/b;

    .line 95
    .line 96
    invoke-virtual {p2, p1}, Lcom/tencent/liteav/basic/c/h;->b(I)I

    .line 97
    .line 98
    .line 99
    move-result p1

    .line 100
    :cond_6
    iget-object p2, p0, Lcom/tencent/liteav/beauty/c;->am:Lcom/tencent/liteav/beauty/b/m;

    .line 101
    .line 102
    if-eqz p2, :cond_7

    .line 103
    .line 104
    invoke-virtual {p2, p1}, Lcom/tencent/liteav/basic/c/h;->b(I)I

    .line 105
    .line 106
    .line 107
    move-result p1

    .line 108
    :cond_7
    iget p2, p0, Lcom/tencent/liteav/beauty/c;->L:I

    .line 109
    .line 110
    iget v1, p0, Lcom/tencent/liteav/beauty/c;->M:I

    .line 111
    .line 112
    invoke-static {v2, v2, p2, v1}, Landroid/opengl/GLES20;->glViewport(IIII)V

    .line 113
    .line 114
    .line 115
    iget-object p2, p0, Lcom/tencent/liteav/beauty/c;->ap:Lcom/tencent/liteav/beauty/b/j;

    .line 116
    .line 117
    if-eqz p2, :cond_8

    .line 118
    .line 119
    invoke-virtual {p2, p1}, Lcom/tencent/liteav/beauty/b/j;->a(I)I

    .line 120
    .line 121
    .line 122
    move-result p1

    .line 123
    move v0, v2

    .line 124
    :cond_8
    iget-object p2, p0, Lcom/tencent/liteav/beauty/c;->aq:Lcom/tencent/liteav/beauty/b/i;

    .line 125
    .line 126
    if-eqz p2, :cond_9

    .line 127
    .line 128
    invoke-virtual {p2, p1}, Lcom/tencent/liteav/basic/c/h;->b(I)I

    .line 129
    .line 130
    .line 131
    move-result p1

    .line 132
    move v0, v2

    .line 133
    :cond_9
    if-eqz v0, :cond_a

    .line 134
    .line 135
    iget p2, p0, Lcom/tencent/liteav/beauty/c;->L:I

    .line 136
    .line 137
    iget v0, p0, Lcom/tencent/liteav/beauty/c;->M:I

    .line 138
    .line 139
    invoke-direct {p0, p2, v0}, Lcom/tencent/liteav/beauty/c;->b(II)V

    .line 140
    .line 141
    .line 142
    iget-object p2, p0, Lcom/tencent/liteav/beauty/c;->au:Lcom/tencent/liteav/basic/c/h;

    .line 143
    .line 144
    if-eqz p2, :cond_a

    .line 145
    .line 146
    iget p2, p0, Lcom/tencent/liteav/beauty/c;->L:I

    .line 147
    .line 148
    iget v0, p0, Lcom/tencent/liteav/beauty/c;->M:I

    .line 149
    .line 150
    invoke-static {v2, v2, p2, v0}, Landroid/opengl/GLES20;->glViewport(IIII)V

    .line 151
    .line 152
    .line 153
    iget-object p2, p0, Lcom/tencent/liteav/beauty/c;->au:Lcom/tencent/liteav/basic/c/h;

    .line 154
    .line 155
    invoke-virtual {p2, p1}, Lcom/tencent/liteav/basic/c/h;->b(I)I

    .line 156
    .line 157
    .line 158
    move-result p1

    .line 159
    :cond_a
    iget-object p2, p0, Lcom/tencent/liteav/beauty/c;->aY:Lcom/tencent/liteav/beauty/e;

    .line 160
    .line 161
    if-eqz p2, :cond_b

    .line 162
    .line 163
    iget v0, p0, Lcom/tencent/liteav/beauty/c;->L:I

    .line 164
    .line 165
    iget v1, p0, Lcom/tencent/liteav/beauty/c;->M:I

    .line 166
    .line 167
    invoke-interface {p2, p1, v0, v1}, Lcom/tencent/liteav/beauty/e;->a(III)I

    .line 168
    .line 169
    .line 170
    move-result p2

    .line 171
    if-lez p2, :cond_b

    .line 172
    .line 173
    move p1, p2

    .line 174
    :cond_b
    iget p2, p0, Lcom/tencent/liteav/beauty/c;->L:I

    .line 175
    .line 176
    iget v0, p0, Lcom/tencent/liteav/beauty/c;->M:I

    .line 177
    .line 178
    invoke-static {v2, v2, p2, v0}, Landroid/opengl/GLES20;->glViewport(IIII)V

    .line 179
    .line 180
    .line 181
    iget-object p2, p0, Lcom/tencent/liteav/beauty/c;->ao:Lcom/tencent/liteav/beauty/b/z;

    .line 182
    .line 183
    if-eqz p2, :cond_c

    .line 184
    .line 185
    invoke-virtual {p2, p1}, Lcom/tencent/liteav/basic/c/h;->b(I)I

    .line 186
    .line 187
    .line 188
    move-result p1

    .line 189
    :cond_c
    iget-object p2, p0, Lcom/tencent/liteav/beauty/c;->ar:Lcom/tencent/liteav/basic/c/h;

    .line 190
    .line 191
    if-eqz p2, :cond_d

    .line 192
    .line 193
    iget p2, p0, Lcom/tencent/liteav/beauty/c;->Q:I

    .line 194
    .line 195
    iget v0, p0, Lcom/tencent/liteav/beauty/c;->R:I

    .line 196
    .line 197
    invoke-static {v2, v2, p2, v0}, Landroid/opengl/GLES20;->glViewport(IIII)V

    .line 198
    .line 199
    .line 200
    iget-object p2, p0, Lcom/tencent/liteav/beauty/c;->ar:Lcom/tencent/liteav/basic/c/h;

    .line 201
    .line 202
    invoke-virtual {p2, p1}, Lcom/tencent/liteav/basic/c/h;->b(I)I

    .line 203
    .line 204
    .line 205
    move-result p1

    .line 206
    :cond_d
    invoke-direct {p0, p1, p3, p4}, Lcom/tencent/liteav/beauty/c;->a(IJ)I

    .line 207
    .line 208
    .line 209
    return p1
.end method

.method public a([BI)I
    .locals 3

    .line 234
    invoke-virtual {p0, p1}, Lcom/tencent/liteav/beauty/c;->a([B)V

    .line 235
    iget-boolean v0, p0, Lcom/tencent/liteav/beauty/c;->aw:Z

    if-nez v0, :cond_1

    .line 236
    invoke-virtual {p1}, [B->clone()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, [B

    .line 237
    iget-object v0, p0, Lcom/tencent/liteav/beauty/c;->aA:Lcom/tencent/liteav/beauty/c$a;

    const/4 v1, 0x2

    invoke-virtual {v0, v1, p1}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v0

    invoke-virtual {v0}, Landroid/os/Message;->sendToTarget()V

    .line 238
    iget-boolean v0, p0, Lcom/tencent/liteav/beauty/c;->aS:Z

    if-nez v0, :cond_0

    .line 239
    const-string v0, "TXCFilterDrawer"

    const-string v1, "First Frame, clear queue"

    invoke-static {v0, v1}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 240
    invoke-static {}, Lcom/tencent/liteav/beauty/NativeLoad;->getInstance()Lcom/tencent/liteav/beauty/NativeLoad;

    invoke-static {}, Lcom/tencent/liteav/beauty/NativeLoad;->nativeClearQueue()V

    .line 241
    :cond_0
    iget-object v0, p0, Lcom/tencent/liteav/beauty/c;->aA:Lcom/tencent/liteav/beauty/c$a;

    const/4 v1, 0x3

    const/4 v2, 0x0

    invoke-virtual {v0, v1, p2, v2}, Landroid/os/Handler;->obtainMessage(III)Landroid/os/Message;

    move-result-object p2

    invoke-virtual {p2}, Landroid/os/Message;->sendToTarget()V

    .line 242
    iget-boolean p2, p0, Lcom/tencent/liteav/beauty/c;->aS:Z

    invoke-direct {p0, p1, p2}, Lcom/tencent/liteav/beauty/c;->a([BZ)V

    const/4 p1, 0x1

    .line 243
    iput-boolean p1, p0, Lcom/tencent/liteav/beauty/c;->aS:Z

    const/4 p0, -0x1

    return p0

    .line 244
    :cond_1
    invoke-direct {p0, p1}, Lcom/tencent/liteav/beauty/c;->b([B)V

    .line 245
    invoke-direct {p0, p2}, Lcom/tencent/liteav/beauty/c;->A(I)I

    move-result p0

    return p0
.end method

.method public a()V
    .locals 2

    .line 343
    iget-boolean v0, p0, Lcom/tencent/liteav/beauty/c;->aw:Z

    if-nez v0, :cond_1

    .line 344
    iget-object v0, p0, Lcom/tencent/liteav/beauty/c;->aA:Lcom/tencent/liteav/beauty/c$a;

    if-eqz v0, :cond_0

    const/4 v1, 0x1

    .line 345
    invoke-virtual {v0, v1}, Landroid/os/Handler;->obtainMessage(I)Landroid/os/Message;

    move-result-object v0

    invoke-virtual {v0}, Landroid/os/Message;->sendToTarget()V

    .line 346
    :try_start_0
    iget-object p0, p0, Lcom/tencent/liteav/beauty/c;->d:Lcom/tencent/liteav/beauty/b/a;

    invoke-virtual {p0}, Lcom/tencent/liteav/beauty/b/a;->b()V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    :cond_0
    return-void

    .line 347
    :cond_1
    invoke-direct {p0}, Lcom/tencent/liteav/beauty/c;->b()V

    return-void
.end method

.method public a(F)V
    .locals 1

    .line 246
    iput p1, p0, Lcom/tencent/liteav/beauty/c;->aB:F

    .line 247
    new-instance v0, Lcom/tencent/liteav/beauty/c$1;

    invoke-direct {v0, p0, p1}, Lcom/tencent/liteav/beauty/c$1;-><init>(Lcom/tencent/liteav/beauty/c;F)V

    invoke-direct {p0, v0}, Lcom/tencent/liteav/beauty/c;->a(Ljava/lang/Runnable;)V

    return-void
.end method

.method public a(FLandroid/graphics/Bitmap;FLandroid/graphics/Bitmap;F)V
    .locals 7

    .line 354
    iget-object v0, p0, Lcom/tencent/liteav/beauty/c;->ah:Landroid/graphics/Bitmap;

    if-ne v0, p2, :cond_3

    iget-object v0, p0, Lcom/tencent/liteav/beauty/c;->ai:Landroid/graphics/Bitmap;

    if-eq v0, p4, :cond_0

    goto :goto_0

    .line 355
    :cond_0
    iget-object p2, p0, Lcom/tencent/liteav/beauty/c;->am:Lcom/tencent/liteav/beauty/b/m;

    if-eqz p2, :cond_2

    iget p2, p0, Lcom/tencent/liteav/beauty/c;->aj:F

    cmpl-float p2, p2, p1

    if-nez p2, :cond_1

    iget p2, p0, Lcom/tencent/liteav/beauty/c;->ak:F

    cmpl-float p2, p2, p3

    if-nez p2, :cond_1

    iget p2, p0, Lcom/tencent/liteav/beauty/c;->al:F

    cmpl-float p2, p2, p5

    if-eqz p2, :cond_2

    .line 356
    :cond_1
    iput p1, p0, Lcom/tencent/liteav/beauty/c;->aj:F

    .line 357
    iput p3, p0, Lcom/tencent/liteav/beauty/c;->ak:F

    .line 358
    iput p5, p0, Lcom/tencent/liteav/beauty/c;->al:F

    .line 359
    new-instance p2, Lcom/tencent/liteav/beauty/c$8;

    invoke-direct {p2, p0, p1, p3, p5}, Lcom/tencent/liteav/beauty/c$8;-><init>(Lcom/tencent/liteav/beauty/c;FFF)V

    invoke-direct {p0, p2}, Lcom/tencent/liteav/beauty/c;->a(Ljava/lang/Runnable;)V

    :cond_2
    return-void

    .line 360
    :cond_3
    :goto_0
    iput-object p2, p0, Lcom/tencent/liteav/beauty/c;->ah:Landroid/graphics/Bitmap;

    .line 361
    iput-object p4, p0, Lcom/tencent/liteav/beauty/c;->ai:Landroid/graphics/Bitmap;

    .line 362
    iput p1, p0, Lcom/tencent/liteav/beauty/c;->aj:F

    .line 363
    iput p3, p0, Lcom/tencent/liteav/beauty/c;->ak:F

    .line 364
    iput p5, p0, Lcom/tencent/liteav/beauty/c;->al:F

    .line 365
    new-instance v0, Lcom/tencent/liteav/beauty/c$6;

    move-object v1, p0

    move v2, p1

    move-object v3, p2

    move v4, p3

    move-object v5, p4

    move v6, p5

    invoke-direct/range {v0 .. v6}, Lcom/tencent/liteav/beauty/c$6;-><init>(Lcom/tencent/liteav/beauty/c;FLandroid/graphics/Bitmap;FLandroid/graphics/Bitmap;F)V

    invoke-direct {v1, v0}, Lcom/tencent/liteav/beauty/c;->a(Ljava/lang/Runnable;)V

    return-void
.end method

.method public a(I)V
    .locals 0

    .line 233
    return-void
.end method

.method public a(Landroid/graphics/Bitmap;)V
    .locals 6

    .line 353
    iget v3, p0, Lcom/tencent/liteav/beauty/c;->aB:F

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/high16 v1, 0x3f800000    # 1.0f

    move-object v0, p0

    move-object v2, p1

    invoke-virtual/range {v0 .. v5}, Lcom/tencent/liteav/beauty/c;->a(FLandroid/graphics/Bitmap;FLandroid/graphics/Bitmap;F)V

    return-void
.end method

.method public a(Landroid/graphics/Bitmap;FFF)V
    .locals 7

    .line 275
    iget-object v0, p0, Lcom/tencent/liteav/beauty/c;->I:Lcom/tencent/liteav/beauty/d$f;

    if-nez v0, :cond_0

    .line 276
    new-instance v0, Lcom/tencent/liteav/beauty/d$f;

    invoke-direct {v0}, Lcom/tencent/liteav/beauty/d$f;-><init>()V

    iput-object v0, p0, Lcom/tencent/liteav/beauty/c;->I:Lcom/tencent/liteav/beauty/d$f;

    .line 277
    :cond_0
    iget-object v0, p0, Lcom/tencent/liteav/beauty/c;->I:Lcom/tencent/liteav/beauty/d$f;

    iget-object v0, v0, Lcom/tencent/liteav/beauty/d$f;->a:Landroid/graphics/Bitmap;

    invoke-static {v0, p1}, Lcom/tencent/liteav/basic/util/TXCCommonUtil;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/tencent/liteav/beauty/c;->I:Lcom/tencent/liteav/beauty/d$f;

    iget v1, v0, Lcom/tencent/liteav/beauty/d$f;->b:F

    cmpl-float v1, p2, v1

    if-nez v1, :cond_1

    iget v1, v0, Lcom/tencent/liteav/beauty/d$f;->c:F

    cmpl-float v1, p3, v1

    if-nez v1, :cond_1

    iget v0, v0, Lcom/tencent/liteav/beauty/d$f;->d:F

    cmpl-float v0, p4, v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/tencent/liteav/beauty/c;->ao:Lcom/tencent/liteav/beauty/b/z;

    if-eqz v0, :cond_1

    return-void

    .line 278
    :cond_1
    iget-object v0, p0, Lcom/tencent/liteav/beauty/c;->I:Lcom/tencent/liteav/beauty/d$f;

    iput-object p1, v0, Lcom/tencent/liteav/beauty/d$f;->a:Landroid/graphics/Bitmap;

    .line 279
    iput p2, v0, Lcom/tencent/liteav/beauty/d$f;->b:F

    .line 280
    iput p3, v0, Lcom/tencent/liteav/beauty/d$f;->c:F

    .line 281
    iput p4, v0, Lcom/tencent/liteav/beauty/d$f;->d:F

    .line 282
    new-instance v1, Lcom/tencent/liteav/beauty/c$10;

    move-object v2, p0

    move-object v3, p1

    move v4, p2

    move v5, p3

    move v6, p4

    invoke-direct/range {v1 .. v6}, Lcom/tencent/liteav/beauty/c$10;-><init>(Lcom/tencent/liteav/beauty/c;Landroid/graphics/Bitmap;FFF)V

    invoke-direct {v2, v1}, Lcom/tencent/liteav/beauty/c;->a(Ljava/lang/Runnable;)V

    return-void
.end method

.method public a(Lcom/tencent/liteav/basic/b/b;)V
    .locals 2

    .line 285
    const-string v0, "TXCFilterDrawer"

    const-string v1, "set notify"

    invoke-static {v0, v1}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 286
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/tencent/liteav/beauty/c;->aZ:Ljava/lang/ref/WeakReference;

    .line 287
    iget-object p0, p0, Lcom/tencent/liteav/beauty/c;->ap:Lcom/tencent/liteav/beauty/b/j;

    if-eqz p0, :cond_0

    .line 288
    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/tencent/liteav/basic/b/b;

    invoke-virtual {p0, p1}, Lcom/tencent/liteav/beauty/b/j;->a(Lcom/tencent/liteav/basic/b/b;)V

    :cond_0
    return-void
.end method

.method public a(Lcom/tencent/liteav/beauty/e;)V
    .locals 2

    .line 283
    const-string v0, "TXCFilterDrawer"

    const-string v1, "set listener"

    invoke-static {v0, v1}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 284
    iput-object p1, p0, Lcom/tencent/liteav/beauty/c;->aY:Lcom/tencent/liteav/beauty/e;

    return-void
.end method

.method public a(Ljava/lang/String;)V
    .locals 0

    .line 210
    return-void
.end method

.method public a(Ljava/lang/String;Z)V
    .locals 0

    .line 211
    return-void
.end method

.method public a(Z)V
    .locals 1

    .line 249
    new-instance v0, Lcom/tencent/liteav/beauty/c$9;

    invoke-direct {v0, p0, p1}, Lcom/tencent/liteav/beauty/c$9;-><init>(Lcom/tencent/liteav/beauty/c;Z)V

    invoke-direct {p0, v0}, Lcom/tencent/liteav/beauty/c;->a(Ljava/lang/Runnable;)V

    return-void
.end method

.method public a([B)V
    .locals 0

    .line 342
    iput-object p1, p0, Lcom/tencent/liteav/beauty/c;->aT:[B

    return-void
.end method

.method public a([F)V
    .locals 1

    .line 248
    new-instance v0, Lcom/tencent/liteav/beauty/c$7;

    invoke-direct {v0, p0, p1}, Lcom/tencent/liteav/beauty/c$7;-><init>(Lcom/tencent/liteav/beauty/c;[F)V

    invoke-direct {p0, v0}, Lcom/tencent/liteav/beauty/c;->a(Ljava/lang/Runnable;)V

    return-void
.end method

.method public declared-synchronized a(Lcom/tencent/liteav/beauty/d$b;)Z
    .locals 3

    monitor-enter p0

    .line 225
    :try_start_0
    iget-boolean v0, p1, Lcom/tencent/liteav/beauty/d$b;->j:Z

    if-nez v0, :cond_1

    .line 226
    iget-object v0, p0, Lcom/tencent/liteav/beauty/c;->aA:Lcom/tencent/liteav/beauty/c$a;

    if-nez v0, :cond_0

    .line 227
    invoke-virtual {p0}, Ljava/lang/Thread;->start()V

    .line 228
    new-instance v0, Lcom/tencent/liteav/beauty/c$a;

    invoke-virtual {p0}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    move-result-object v1

    iget-object v2, p0, Lcom/tencent/liteav/beauty/c;->E:Landroid/content/Context;

    invoke-direct {v0, p0, v1, v2}, Lcom/tencent/liteav/beauty/c$a;-><init>(Lcom/tencent/liteav/beauty/c;Landroid/os/Looper;Landroid/content/Context;)V

    iput-object v0, p0, Lcom/tencent/liteav/beauty/c;->aA:Lcom/tencent/liteav/beauty/c$a;

    goto :goto_0

    :catchall_0
    move-exception p1

    goto :goto_2

    .line 229
    :cond_0
    :goto_0
    iget-object v0, p0, Lcom/tencent/liteav/beauty/c;->aA:Lcom/tencent/liteav/beauty/c$a;

    const/4 v1, 0x0

    invoke-virtual {v0, v1, p1}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object p1

    invoke-virtual {p1}, Landroid/os/Message;->sendToTarget()V

    .line 230
    iget-object p1, p0, Lcom/tencent/liteav/beauty/c;->aA:Lcom/tencent/liteav/beauty/c$a;

    invoke-virtual {p1}, Lcom/tencent/liteav/beauty/c$a;->b()V

    const/4 p1, 0x1

    goto :goto_1

    .line 231
    :cond_1
    invoke-direct {p0, p1}, Lcom/tencent/liteav/beauty/c;->c(Lcom/tencent/liteav/beauty/d$b;)Z

    move-result p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 232
    :goto_1
    monitor-exit p0

    return p1

    :goto_2
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1
.end method

.method public b(I)V
    .locals 1

    .line 156
    new-instance v0, Lcom/tencent/liteav/beauty/c$11;

    invoke-direct {v0, p0, p1}, Lcom/tencent/liteav/beauty/c$11;-><init>(Lcom/tencent/liteav/beauty/c;I)V

    invoke-direct {p0, v0}, Lcom/tencent/liteav/beauty/c;->a(Ljava/lang/Runnable;)V

    return-void
.end method

.method public b(Z)V
    .locals 0

    .line 160
    return-void
.end method

.method public b(Lcom/tencent/liteav/beauty/d$b;)Z
    .locals 2

    .line 161
    iget-boolean v0, p0, Lcom/tencent/liteav/beauty/c;->aw:Z

    if-nez v0, :cond_1

    .line 162
    iget-object p0, p0, Lcom/tencent/liteav/beauty/c;->aA:Lcom/tencent/liteav/beauty/c$a;

    const/4 v0, 0x0

    if-nez p0, :cond_0

    .line 163
    const-string p0, "TXCFilterDrawer"

    const-string p1, "mThreadHandler is null!"

    invoke-static {p0, p1}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    return v0

    :cond_0
    const/4 v1, 0x5

    .line 164
    invoke-virtual {p0, v1, v0, v0, p1}, Landroid/os/Handler;->obtainMessage(IIILjava/lang/Object;)Landroid/os/Message;

    move-result-object p0

    invoke-virtual {p0}, Landroid/os/Message;->sendToTarget()V

    goto :goto_0

    .line 165
    :cond_1
    invoke-direct {p0, p1}, Lcom/tencent/liteav/beauty/c;->d(Lcom/tencent/liteav/beauty/d$b;)Z

    :goto_0
    const/4 p0, 0x1

    return p0
.end method

.method public c(I)V
    .locals 1

    .line 329
    iput p1, p0, Lcom/tencent/liteav/beauty/c;->aD:I

    .line 330
    new-instance v0, Lcom/tencent/liteav/beauty/c$13;

    invoke-direct {v0, p0, p1}, Lcom/tencent/liteav/beauty/c$13;-><init>(Lcom/tencent/liteav/beauty/c;I)V

    invoke-direct {p0, v0}, Lcom/tencent/liteav/beauty/c;->a(Ljava/lang/Runnable;)V

    return-void
.end method

.method public d(I)V
    .locals 1

    .line 98
    iget v0, p0, Lcom/tencent/liteav/beauty/c;->aC:I

    if-eq v0, p1, :cond_1

    const/4 v0, 0x3

    if-gt p1, v0, :cond_1

    if-gez p1, :cond_0

    goto :goto_0

    .line 99
    :cond_0
    iput p1, p0, Lcom/tencent/liteav/beauty/c;->aC:I

    .line 100
    new-instance v0, Lcom/tencent/liteav/beauty/c$2;

    invoke-direct {v0, p0, p1}, Lcom/tencent/liteav/beauty/c$2;-><init>(Lcom/tencent/liteav/beauty/c;I)V

    invoke-direct {p0, v0}, Lcom/tencent/liteav/beauty/c;->a(Ljava/lang/Runnable;)V

    :cond_1
    :goto_0
    return-void
.end method

.method public e(I)V
    .locals 1

    .line 1
    iput p1, p0, Lcom/tencent/liteav/beauty/c;->aE:I

    .line 2
    .line 3
    new-instance v0, Lcom/tencent/liteav/beauty/c$3;

    .line 4
    .line 5
    invoke-direct {v0, p0, p1}, Lcom/tencent/liteav/beauty/c$3;-><init>(Lcom/tencent/liteav/beauty/c;I)V

    .line 6
    .line 7
    .line 8
    invoke-direct {p0, v0}, Lcom/tencent/liteav/beauty/c;->a(Ljava/lang/Runnable;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public f(I)V
    .locals 1

    .line 1
    iput p1, p0, Lcom/tencent/liteav/beauty/c;->aF:I

    .line 2
    .line 3
    new-instance v0, Lcom/tencent/liteav/beauty/c$4;

    .line 4
    .line 5
    invoke-direct {v0, p0, p1}, Lcom/tencent/liteav/beauty/c$4;-><init>(Lcom/tencent/liteav/beauty/c;I)V

    .line 6
    .line 7
    .line 8
    invoke-direct {p0, v0}, Lcom/tencent/liteav/beauty/c;->a(Ljava/lang/Runnable;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public g(I)V
    .locals 1

    .line 1
    iput p1, p0, Lcom/tencent/liteav/beauty/c;->aG:I

    .line 2
    .line 3
    new-instance v0, Lcom/tencent/liteav/beauty/c$5;

    .line 4
    .line 5
    invoke-direct {v0, p0, p1}, Lcom/tencent/liteav/beauty/c$5;-><init>(Lcom/tencent/liteav/beauty/c;I)V

    .line 6
    .line 7
    .line 8
    invoke-direct {p0, v0}, Lcom/tencent/liteav/beauty/c;->a(Ljava/lang/Runnable;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public h(I)V
    .locals 0

    .line 4
    return-void
.end method

.method public i(I)V
    .locals 0

    .line 4
    return-void
.end method

.method public j(I)V
    .locals 0

    .line 4
    return-void
.end method

.method public k(I)V
    .locals 0

    .line 4
    return-void
.end method

.method public l(I)V
    .locals 0

    .line 4
    return-void
.end method

.method public m(I)V
    .locals 0

    .line 4
    return-void
.end method

.method public n(I)V
    .locals 0

    .line 4
    return-void
.end method

.method public o(I)V
    .locals 0

    .line 5
    return-void
.end method

.method public p(I)V
    .locals 0

    .line 4
    return-void
.end method

.method public q(I)V
    .locals 0

    return-void
.end method

.method public r(I)V
    .locals 0

    return-void
.end method

.method public s(I)V
    .locals 0

    return-void
.end method

.method public t(I)V
    .locals 0

    return-void
.end method

.method public u(I)V
    .locals 0

    return-void
.end method

.method public v(I)V
    .locals 0

    return-void
.end method

.method public w(I)V
    .locals 0

    return-void
.end method

.method public x(I)V
    .locals 0

    return-void
.end method

.method public y(I)V
    .locals 0

    return-void
.end method

.method public z(I)V
    .locals 0

    return-void
.end method

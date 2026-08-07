.class public Ll/ob4;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/nb4;


# instance fields
.field protected A:Landroid/view/Surface;

.field private A0:Ll/ppw;

.field protected B:Landroid/view/Surface;

.field private B0:Ll/tpr;

.field protected C:I

.field C0:Ll/upr;

.field protected D:I

.field D0:Ll/rpr;

.field private E:Z

.field E0:Ll/spr;

.field private F:[B

.field F0:Ll/ppr;

.field private G:Z

.field final H:Ljava/lang/Object;

.field private I:Ll/ia4;

.field private J:Z

.field private K:J

.field protected L:J

.field protected M:I

.field private N:J

.field private O:J

.field protected P:Ljava/lang/Boolean;

.field private Q:Ll/kt2;

.field private R:Ljava/lang/Object;

.field private S:I

.field private T:I

.field private U:I

.field private V:Z

.field private W:I

.field private X:I

.field private Y:J

.field private Z:Z

.field final a:I

.field private a0:Ll/apw;

.field final b:I

.field private b0:I

.field final c:I

.field private c0:I

.field private final d:I

.field private d0:Ll/qow;

.field private final e:I

.field private e0:Ll/qpw;

.field private f:Landroid/opengl/EGLContext;

.field f0:Ll/c3i0;

.field private g:Ll/v5c;

.field private g0:I

.field private h:Ll/sow;

.field private h0:I

.field private i:Ljava/lang/String;

.field private i0:Ll/cvf;

.field private j:Ljava/lang/String;

.field protected j0:Ljava/util/LinkedList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedList<",
            "Lcom/immomo/components/interfaces/IProcessOutput;",
            ">;"
        }
    .end annotation
.end field

.field private k:F

.field private k0:Z

.field private l:J

.field private volatile l0:Z

.field private volatile m:Z

.field private m0:I

.field private n:Z

.field private n0:I

.field private o:Landroid/graphics/SurfaceTexture;

.field private volatile o0:Z

.field private p:Ll/uje;

.field private p0:J

.field private q:Landroid/os/Looper;

.field private q0:J

.field private r:I

.field private r0:J

.field protected s:Lcom/immomo/moment/mediautils/l;

.field private s0:J

.field protected t:Lcom/immomo/moment/mediautils/l;

.field private t0:J

.field protected u:Ll/pc1;

.field private u0:J

.field v:Ll/bpw;

.field private v0:J

.field private w:Z

.field private w0:I

.field protected x:Ll/ed1;

.field private x0:J

.field protected y:Ll/epw;

.field private y0:J

.field private z:Ll/xow;

.field private z0:J


# direct methods
.method public constructor <init>(Ll/sow;Landroid/opengl/EGLContext;)V
    .locals 6

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/16 v0, 0x12e

    .line 5
    .line 6
    iput v0, p0, Ll/ob4;->a:I

    .line 7
    .line 8
    const/16 v0, 0x12f

    .line 9
    .line 10
    iput v0, p0, Ll/ob4;->b:I

    .line 11
    .line 12
    const/16 v0, 0x131

    .line 13
    .line 14
    iput v0, p0, Ll/ob4;->c:I

    .line 15
    .line 16
    const/4 v0, 0x1

    .line 17
    iput v0, p0, Ll/ob4;->d:I

    .line 18
    .line 19
    const/4 v1, 0x2

    .line 20
    iput v1, p0, Ll/ob4;->e:I

    .line 21
    .line 22
    const/high16 v1, 0x3f800000    # 1.0f

    .line 23
    .line 24
    iput v1, p0, Ll/ob4;->k:F

    .line 25
    .line 26
    const-wide/16 v1, 0x0

    .line 27
    .line 28
    iput-wide v1, p0, Ll/ob4;->l:J

    .line 29
    .line 30
    const/4 v3, 0x0

    .line 31
    iput-boolean v3, p0, Ll/ob4;->m:Z

    .line 32
    .line 33
    iput-boolean v3, p0, Ll/ob4;->n:Z

    .line 34
    .line 35
    const/4 v4, 0x0

    .line 36
    iput-object v4, p0, Ll/ob4;->p:Ll/uje;

    .line 37
    .line 38
    iput-object v4, p0, Ll/ob4;->q:Landroid/os/Looper;

    .line 39
    .line 40
    iput v3, p0, Ll/ob4;->r:I

    .line 41
    .line 42
    iput-object v4, p0, Ll/ob4;->s:Lcom/immomo/moment/mediautils/l;

    .line 43
    .line 44
    iput-object v4, p0, Ll/ob4;->t:Lcom/immomo/moment/mediautils/l;

    .line 45
    .line 46
    iput-object v4, p0, Ll/ob4;->u:Ll/pc1;

    .line 47
    .line 48
    iput-object v4, p0, Ll/ob4;->v:Ll/bpw;

    .line 49
    .line 50
    iput-boolean v3, p0, Ll/ob4;->w:Z

    .line 51
    .line 52
    iput-object v4, p0, Ll/ob4;->y:Ll/epw;

    .line 53
    .line 54
    iput-object v4, p0, Ll/ob4;->z:Ll/xow;

    .line 55
    .line 56
    iput-object v4, p0, Ll/ob4;->A:Landroid/view/Surface;

    .line 57
    .line 58
    iput-object v4, p0, Ll/ob4;->B:Landroid/view/Surface;

    .line 59
    .line 60
    const/16 v5, 0x14

    .line 61
    .line 62
    iput v5, p0, Ll/ob4;->C:I

    .line 63
    .line 64
    iput v5, p0, Ll/ob4;->D:I

    .line 65
    .line 66
    iput-boolean v3, p0, Ll/ob4;->E:Z

    .line 67
    .line 68
    iput-boolean v3, p0, Ll/ob4;->G:Z

    .line 69
    .line 70
    new-instance v5, Ljava/lang/Object;

    .line 71
    .line 72
    invoke-direct {v5}, Ljava/lang/Object;-><init>()V

    .line 73
    .line 74
    .line 75
    iput-object v5, p0, Ll/ob4;->H:Ljava/lang/Object;

    .line 76
    .line 77
    iput-boolean v3, p0, Ll/ob4;->J:Z

    .line 78
    .line 79
    iput-wide v1, p0, Ll/ob4;->K:J

    .line 80
    .line 81
    iput-wide v1, p0, Ll/ob4;->L:J

    .line 82
    .line 83
    iput v3, p0, Ll/ob4;->M:I

    .line 84
    .line 85
    iput-wide v1, p0, Ll/ob4;->N:J

    .line 86
    .line 87
    iput-wide v1, p0, Ll/ob4;->O:J

    .line 88
    .line 89
    sget-object v5, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 90
    .line 91
    iput-object v5, p0, Ll/ob4;->P:Ljava/lang/Boolean;

    .line 92
    .line 93
    iput-object v4, p0, Ll/ob4;->Q:Ll/kt2;

    .line 94
    .line 95
    iput-object v4, p0, Ll/ob4;->R:Ljava/lang/Object;

    .line 96
    .line 97
    iput v3, p0, Ll/ob4;->S:I

    .line 98
    .line 99
    iput v3, p0, Ll/ob4;->T:I

    .line 100
    .line 101
    iput v3, p0, Ll/ob4;->U:I

    .line 102
    .line 103
    iput-boolean v3, p0, Ll/ob4;->V:Z

    .line 104
    .line 105
    iput v3, p0, Ll/ob4;->W:I

    .line 106
    .line 107
    iput v3, p0, Ll/ob4;->X:I

    .line 108
    .line 109
    iput-wide v1, p0, Ll/ob4;->Y:J

    .line 110
    .line 111
    iput-boolean v3, p0, Ll/ob4;->Z:Z

    .line 112
    .line 113
    iput-object v4, p0, Ll/ob4;->a0:Ll/apw;

    .line 114
    .line 115
    const v1, 0x186a0

    .line 116
    .line 117
    .line 118
    iput v1, p0, Ll/ob4;->b0:I

    .line 119
    .line 120
    iput v3, p0, Ll/ob4;->c0:I

    .line 121
    .line 122
    iput-object v4, p0, Ll/ob4;->e0:Ll/qpw;

    .line 123
    .line 124
    new-instance v1, Ll/c3i0;

    .line 125
    .line 126
    invoke-direct {v1}, Ll/c3i0;-><init>()V

    .line 127
    .line 128
    .line 129
    iput-object v1, p0, Ll/ob4;->f0:Ll/c3i0;

    .line 130
    .line 131
    const/16 v1, 0x160

    .line 132
    .line 133
    iput v1, p0, Ll/ob4;->g0:I

    .line 134
    .line 135
    const/16 v1, 0x280

    .line 136
    .line 137
    iput v1, p0, Ll/ob4;->h0:I

    .line 138
    .line 139
    new-instance v1, Ljava/util/LinkedList;

    .line 140
    .line 141
    invoke-direct {v1}, Ljava/util/LinkedList;-><init>()V

    .line 142
    .line 143
    .line 144
    iput-object v1, p0, Ll/ob4;->j0:Ljava/util/LinkedList;

    .line 145
    .line 146
    iput-boolean v3, p0, Ll/ob4;->k0:Z

    .line 147
    .line 148
    iput-boolean v0, p0, Ll/ob4;->l0:Z

    .line 149
    .line 150
    iput v3, p0, Ll/ob4;->m0:I

    .line 151
    .line 152
    iput v3, p0, Ll/ob4;->n0:I

    .line 153
    .line 154
    iput-boolean v3, p0, Ll/ob4;->o0:Z

    .line 155
    .line 156
    new-instance v0, Ll/ob4$j;

    .line 157
    .line 158
    invoke-direct {v0, p0}, Ll/ob4$j;-><init>(Ll/ob4;)V

    .line 159
    .line 160
    .line 161
    iput-object v0, p0, Ll/ob4;->A0:Ll/ppw;

    .line 162
    .line 163
    new-instance v0, Ll/ob4$o;

    .line 164
    .line 165
    invoke-direct {v0, p0}, Ll/ob4$o;-><init>(Ll/ob4;)V

    .line 166
    .line 167
    .line 168
    iput-object v0, p0, Ll/ob4;->B0:Ll/tpr;

    .line 169
    .line 170
    new-instance v0, Ll/ob4$a;

    .line 171
    .line 172
    invoke-direct {v0, p0}, Ll/ob4$a;-><init>(Ll/ob4;)V

    .line 173
    .line 174
    .line 175
    iput-object v0, p0, Ll/ob4;->C0:Ll/upr;

    .line 176
    .line 177
    new-instance v0, Ll/ob4$b;

    .line 178
    .line 179
    invoke-direct {v0, p0}, Ll/ob4$b;-><init>(Ll/ob4;)V

    .line 180
    .line 181
    .line 182
    iput-object v0, p0, Ll/ob4;->D0:Ll/rpr;

    .line 183
    .line 184
    new-instance v0, Ll/ob4$c;

    .line 185
    .line 186
    invoke-direct {v0, p0}, Ll/ob4$c;-><init>(Ll/ob4;)V

    .line 187
    .line 188
    .line 189
    iput-object v0, p0, Ll/ob4;->E0:Ll/spr;

    .line 190
    .line 191
    new-instance v0, Ll/ob4$d;

    .line 192
    .line 193
    invoke-direct {v0, p0}, Ll/ob4$d;-><init>(Ll/ob4;)V

    .line 194
    .line 195
    .line 196
    iput-object v0, p0, Ll/ob4;->F0:Ll/ppr;

    .line 197
    .line 198
    if-eqz p1, :cond_0

    .line 199
    .line 200
    iput-object p2, p0, Ll/ob4;->f:Landroid/opengl/EGLContext;

    .line 201
    .line 202
    invoke-direct {p0, p1}, Ll/ob4;->x1(Ll/sow;)V

    .line 203
    .line 204
    .line 205
    iget-object p0, p0, Ll/ob4;->g:Ll/v5c;

    .line 206
    .line 207
    invoke-virtual {p0}, Ll/eli0;->P()V

    .line 208
    .line 209
    .line 210
    :cond_0
    return-void
.end method

.method public static synthetic A0(Ll/ob4;J)J
    .locals 0

    .line 1
    iput-wide p1, p0, Ll/ob4;->O:J

    .line 2
    .line 3
    return-wide p1
.end method

.method private A1()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/ob4;->h:Ll/sow;

    .line 2
    .line 3
    iget-boolean v1, v0, Ll/sow;->g0:Z

    .line 4
    .line 5
    if-eqz v1, :cond_0

    .line 6
    .line 7
    iget v1, p0, Ll/ob4;->m0:I

    .line 8
    .line 9
    iget v2, p0, Ll/ob4;->n0:I

    .line 10
    .line 11
    iget v3, v0, Ll/sow;->p:I

    .line 12
    .line 13
    iget v0, v0, Ll/sow;->o:I

    .line 14
    .line 15
    invoke-static {v1, v2, v3, v0}, Ll/omq0;->a(IIII)Ll/omq0$a;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    iget-object p0, p0, Ll/ob4;->h:Ll/sow;

    .line 20
    .line 21
    iget v1, v0, Ll/omq0$a;->a:I

    .line 22
    .line 23
    iput v1, p0, Ll/sow;->d:I

    .line 24
    .line 25
    iget v1, v0, Ll/omq0$a;->b:I

    .line 26
    .line 27
    iput v1, p0, Ll/sow;->e:I

    .line 28
    .line 29
    iget v1, v0, Ll/omq0$a;->c:I

    .line 30
    .line 31
    iput v1, p0, Ll/sow;->f:I

    .line 32
    .line 33
    iget v0, v0, Ll/omq0$a;->d:I

    .line 34
    .line 35
    iput v0, p0, Ll/sow;->g:I

    .line 36
    .line 37
    :cond_0
    return-void
.end method

.method public static synthetic B0(Ll/ob4;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/ob4;->s1()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private B1()V
    .locals 2

    .line 1
    new-instance v0, Landroid/os/Message;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/os/Message;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 v1, 0x2

    .line 7
    iput v1, v0, Landroid/os/Message;->what:I

    .line 8
    .line 9
    iget-object p0, p0, Ll/ob4;->g:Ll/v5c;

    .line 10
    .line 11
    invoke-virtual {p0, v0}, Ll/v5c;->e1(Landroid/os/Message;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public static synthetic C0(Ll/ob4;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/ob4;->u1()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private C1([B)Lcom/immomo/components/interfaces/IProcessOutput;
    .locals 0

    .line 1
    invoke-static {}, Ll/byx;->a()Z

    .line 2
    .line 3
    .line 4
    const/4 p0, 0x0

    .line 5
    return-object p0
.end method

.method public static synthetic D0(Ll/ob4;)J
    .locals 2

    .line 1
    iget-wide v0, p0, Ll/ob4;->r0:J

    .line 2
    .line 3
    return-wide v0
.end method

.method private D1()Z
    .locals 9

    .line 1
    iget-object v0, p0, Ll/ob4;->s:Lcom/immomo/moment/mediautils/l;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-eqz v0, :cond_1

    .line 5
    .line 6
    iget-wide v2, p0, Ll/ob4;->K:J

    .line 7
    .line 8
    const-wide/16 v4, 0x1

    .line 9
    .line 10
    add-long/2addr v2, v4

    .line 11
    iput-wide v2, p0, Ll/ob4;->K:J

    .line 12
    .line 13
    iget-boolean v0, p0, Ll/ob4;->n:Z

    .line 14
    .line 15
    if-eqz v0, :cond_1

    .line 16
    .line 17
    iget p0, p0, Ll/ob4;->k:F

    .line 18
    .line 19
    const/high16 v0, 0x3f000000    # 0.5f

    .line 20
    .line 21
    cmpg-float v0, p0, v0

    .line 22
    .line 23
    const/4 v4, 0x0

    .line 24
    const-wide/16 v5, 0x0

    .line 25
    .line 26
    if-gez v0, :cond_0

    .line 27
    .line 28
    const-wide/16 v7, 0x2

    .line 29
    .line 30
    rem-long v7, v2, v7

    .line 31
    .line 32
    cmp-long v0, v7, v5

    .line 33
    .line 34
    if-nez v0, :cond_0

    .line 35
    .line 36
    return v4

    .line 37
    :cond_0
    const v0, 0x3f4ccccd    # 0.8f

    .line 38
    .line 39
    .line 40
    cmpg-float p0, p0, v0

    .line 41
    .line 42
    if-gez p0, :cond_1

    .line 43
    .line 44
    const-wide/16 v7, 0x4

    .line 45
    .line 46
    rem-long/2addr v2, v7

    .line 47
    cmp-long p0, v2, v5

    .line 48
    .line 49
    if-nez p0, :cond_1

    .line 50
    .line 51
    return v4

    .line 52
    :cond_1
    return v1
.end method

.method public static synthetic E0(Ll/ob4;J)J
    .locals 0

    .line 1
    iput-wide p1, p0, Ll/ob4;->r0:J

    .line 2
    .line 3
    return-wide p1
.end method

.method public static synthetic F0(Ll/ob4;J)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Ll/ob4;->k1(J)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private F1()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/ob4;->I:Ll/ia4;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/ia4;->d()Ll/ypl;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-interface {v0}, Ll/ypl;->x()Ll/crf0;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-static {}, Lcom/immomo/moment/datadot/DataDotUtils;->getInstance()Lcom/immomo/moment/datadot/DataDotUtils;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    invoke-virtual {v2}, Lcom/immomo/moment/datadot/DataDotUtils;->getRecoderDataDotInfo()Lcom/immomo/moment/datadot/RecoderDataDotInfo;

    .line 20
    .line 21
    .line 22
    move-result-object v2

    .line 23
    invoke-interface {v0}, Ll/ypl;->n()[I

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    invoke-virtual {v2, v0}, Lcom/immomo/moment/datadot/RecoderDataDotInfo;->setCameraSourceFps([I)V

    .line 28
    .line 29
    .line 30
    invoke-static {}, Lcom/immomo/moment/datadot/DataDotUtils;->getInstance()Lcom/immomo/moment/datadot/DataDotUtils;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    invoke-virtual {v0}, Lcom/immomo/moment/datadot/DataDotUtils;->getRecoderDataDotInfo()Lcom/immomo/moment/datadot/RecoderDataDotInfo;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    invoke-virtual {v1}, Ll/crf0;->b()I

    .line 39
    .line 40
    .line 41
    move-result v2

    .line 42
    invoke-virtual {v0, v2}, Lcom/immomo/moment/datadot/RecoderDataDotInfo;->setCameraSizeWidth(I)V

    .line 43
    .line 44
    .line 45
    invoke-static {}, Lcom/immomo/moment/datadot/DataDotUtils;->getInstance()Lcom/immomo/moment/datadot/DataDotUtils;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    invoke-virtual {v0}, Lcom/immomo/moment/datadot/DataDotUtils;->getRecoderDataDotInfo()Lcom/immomo/moment/datadot/RecoderDataDotInfo;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    invoke-virtual {v1}, Ll/crf0;->a()I

    .line 54
    .line 55
    .line 56
    move-result v1

    .line 57
    invoke-virtual {v0, v1}, Lcom/immomo/moment/datadot/RecoderDataDotInfo;->setCameraSizeHeight(I)V

    .line 58
    .line 59
    .line 60
    invoke-static {}, Lcom/immomo/moment/datadot/DataDotUtils;->getInstance()Lcom/immomo/moment/datadot/DataDotUtils;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    invoke-virtual {v0}, Lcom/immomo/moment/datadot/DataDotUtils;->getRecoderDataDotInfo()Lcom/immomo/moment/datadot/RecoderDataDotInfo;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    iget-object v1, p0, Ll/ob4;->h:Ll/sow;

    .line 69
    .line 70
    iget v1, v1, Ll/sow;->b:I

    .line 71
    .line 72
    invoke-virtual {v0, v1}, Lcom/immomo/moment/datadot/RecoderDataDotInfo;->setCameraPreviewVideoWidth(I)V

    .line 73
    .line 74
    .line 75
    invoke-static {}, Lcom/immomo/moment/datadot/DataDotUtils;->getInstance()Lcom/immomo/moment/datadot/DataDotUtils;

    .line 76
    .line 77
    .line 78
    move-result-object v0

    .line 79
    invoke-virtual {v0}, Lcom/immomo/moment/datadot/DataDotUtils;->getRecoderDataDotInfo()Lcom/immomo/moment/datadot/RecoderDataDotInfo;

    .line 80
    .line 81
    .line 82
    move-result-object v0

    .line 83
    iget-object p0, p0, Ll/ob4;->h:Ll/sow;

    .line 84
    .line 85
    iget p0, p0, Ll/sow;->c:I

    .line 86
    .line 87
    invoke-virtual {v0, p0}, Lcom/immomo/moment/datadot/RecoderDataDotInfo;->setCameraPreviewVideoHeight(I)V

    .line 88
    .line 89
    .line 90
    :cond_0
    return-void
.end method

.method public static synthetic G0(Ll/ob4;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/ob4;->t1()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private G1(IIIIIIIIIII)V
    .locals 1

    .line 1
    invoke-static {}, Lcom/immomo/moment/datadot/DataDotUtils;->getInstance()Lcom/immomo/moment/datadot/DataDotUtils;

    move-result-object p0

    invoke-virtual {p0}, Lcom/immomo/moment/datadot/DataDotUtils;->getRecoderDataDotInfo()Lcom/immomo/moment/datadot/RecoderDataDotInfo;

    move-result-object p0

    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/immomo/moment/datadot/RecoderDataDotInfo;->setCameraUseSpeedvary(Z)V

    .line 2
    invoke-static {}, Lcom/immomo/moment/datadot/DataDotUtils;->getInstance()Lcom/immomo/moment/datadot/DataDotUtils;

    move-result-object p0

    invoke-virtual {p0}, Lcom/immomo/moment/datadot/DataDotUtils;->getRecoderDataDotInfo()Lcom/immomo/moment/datadot/RecoderDataDotInfo;

    move-result-object p0

    invoke-virtual {p0, p1}, Lcom/immomo/moment/datadot/RecoderDataDotInfo;->setCameraVideoEncodeWidth(I)V

    .line 3
    invoke-static {}, Lcom/immomo/moment/datadot/DataDotUtils;->getInstance()Lcom/immomo/moment/datadot/DataDotUtils;

    move-result-object p0

    invoke-virtual {p0}, Lcom/immomo/moment/datadot/DataDotUtils;->getRecoderDataDotInfo()Lcom/immomo/moment/datadot/RecoderDataDotInfo;

    move-result-object p0

    invoke-virtual {p0, p2}, Lcom/immomo/moment/datadot/RecoderDataDotInfo;->setCameraVideoEncodeHeight(I)V

    .line 4
    invoke-static {}, Lcom/immomo/moment/datadot/DataDotUtils;->getInstance()Lcom/immomo/moment/datadot/DataDotUtils;

    move-result-object p0

    invoke-virtual {p0}, Lcom/immomo/moment/datadot/DataDotUtils;->getRecoderDataDotInfo()Lcom/immomo/moment/datadot/RecoderDataDotInfo;

    move-result-object p0

    invoke-virtual {p0, p3}, Lcom/immomo/moment/datadot/RecoderDataDotInfo;->setCameraVideoEncodeFps(I)V

    .line 5
    invoke-static {}, Lcom/immomo/moment/datadot/DataDotUtils;->getInstance()Lcom/immomo/moment/datadot/DataDotUtils;

    move-result-object p0

    invoke-virtual {p0}, Lcom/immomo/moment/datadot/DataDotUtils;->getRecoderDataDotInfo()Lcom/immomo/moment/datadot/RecoderDataDotInfo;

    move-result-object p0

    invoke-virtual {p0, p4}, Lcom/immomo/moment/datadot/RecoderDataDotInfo;->setCameraVideoBitrate(I)V

    .line 6
    invoke-static {}, Lcom/immomo/moment/datadot/DataDotUtils;->getInstance()Lcom/immomo/moment/datadot/DataDotUtils;

    move-result-object p0

    invoke-virtual {p0}, Lcom/immomo/moment/datadot/DataDotUtils;->getRecoderDataDotInfo()Lcom/immomo/moment/datadot/RecoderDataDotInfo;

    move-result-object p0

    invoke-virtual {p0, p5}, Lcom/immomo/moment/datadot/RecoderDataDotInfo;->setCameraVideoGopSize(I)V

    .line 7
    invoke-static {}, Lcom/immomo/moment/datadot/DataDotUtils;->getInstance()Lcom/immomo/moment/datadot/DataDotUtils;

    move-result-object p0

    invoke-virtual {p0}, Lcom/immomo/moment/datadot/DataDotUtils;->getRecoderDataDotInfo()Lcom/immomo/moment/datadot/RecoderDataDotInfo;

    move-result-object p0

    invoke-virtual {p0, p6}, Lcom/immomo/moment/datadot/RecoderDataDotInfo;->setCameraVideoRotation(I)V

    .line 8
    invoke-static {}, Lcom/immomo/moment/datadot/DataDotUtils;->getInstance()Lcom/immomo/moment/datadot/DataDotUtils;

    move-result-object p0

    invoke-virtual {p0}, Lcom/immomo/moment/datadot/DataDotUtils;->getRecoderDataDotInfo()Lcom/immomo/moment/datadot/RecoderDataDotInfo;

    move-result-object p0

    invoke-virtual {p0, p7}, Lcom/immomo/moment/datadot/RecoderDataDotInfo;->setCameraAudioSampleRate(I)V

    .line 9
    invoke-static {}, Lcom/immomo/moment/datadot/DataDotUtils;->getInstance()Lcom/immomo/moment/datadot/DataDotUtils;

    move-result-object p0

    invoke-virtual {p0}, Lcom/immomo/moment/datadot/DataDotUtils;->getRecoderDataDotInfo()Lcom/immomo/moment/datadot/RecoderDataDotInfo;

    move-result-object p0

    invoke-virtual {p0, p8}, Lcom/immomo/moment/datadot/RecoderDataDotInfo;->setCameraAudioBits(I)V

    .line 10
    invoke-static {}, Lcom/immomo/moment/datadot/DataDotUtils;->getInstance()Lcom/immomo/moment/datadot/DataDotUtils;

    move-result-object p0

    invoke-virtual {p0}, Lcom/immomo/moment/datadot/DataDotUtils;->getRecoderDataDotInfo()Lcom/immomo/moment/datadot/RecoderDataDotInfo;

    move-result-object p0

    invoke-virtual {p0, p9}, Lcom/immomo/moment/datadot/RecoderDataDotInfo;->setCameraAudioChannel(I)V

    .line 11
    invoke-static {}, Lcom/immomo/moment/datadot/DataDotUtils;->getInstance()Lcom/immomo/moment/datadot/DataDotUtils;

    move-result-object p0

    invoke-virtual {p0}, Lcom/immomo/moment/datadot/DataDotUtils;->getRecoderDataDotInfo()Lcom/immomo/moment/datadot/RecoderDataDotInfo;

    move-result-object p0

    invoke-virtual {p0, p10}, Lcom/immomo/moment/datadot/RecoderDataDotInfo;->setCameraAudioBitrate(I)V

    .line 12
    invoke-static {}, Lcom/immomo/moment/datadot/DataDotUtils;->getInstance()Lcom/immomo/moment/datadot/DataDotUtils;

    move-result-object p0

    invoke-virtual {p0}, Lcom/immomo/moment/datadot/DataDotUtils;->getRecoderDataDotInfo()Lcom/immomo/moment/datadot/RecoderDataDotInfo;

    move-result-object p0

    invoke-virtual {p0, p11}, Lcom/immomo/moment/datadot/RecoderDataDotInfo;->setCameraAudioMediaformatInputSize(I)V

    .line 13
    invoke-static {}, Lcom/immomo/moment/datadot/DataDotUtils;->getInstance()Lcom/immomo/moment/datadot/DataDotUtils;

    move-result-object p0

    invoke-virtual {p0}, Lcom/immomo/moment/datadot/DataDotUtils;->getRecoderDataDotInfo()Lcom/immomo/moment/datadot/RecoderDataDotInfo;

    move-result-object p0

    const-string p1, "video/avc"

    invoke-virtual {p0, p1}, Lcom/immomo/moment/datadot/RecoderDataDotInfo;->setCameraVideoEncode(Ljava/lang/String;)V

    .line 14
    invoke-static {}, Lcom/immomo/moment/datadot/DataDotUtils;->getInstance()Lcom/immomo/moment/datadot/DataDotUtils;

    move-result-object p0

    invoke-virtual {p0}, Lcom/immomo/moment/datadot/DataDotUtils;->getRecoderDataDotInfo()Lcom/immomo/moment/datadot/RecoderDataDotInfo;

    move-result-object p0

    const-string p1, "mp4"

    invoke-virtual {p0, p1}, Lcom/immomo/moment/datadot/RecoderDataDotInfo;->setCameraVideoExtension(Ljava/lang/String;)V

    .line 15
    invoke-static {}, Lcom/immomo/moment/datadot/DataDotUtils;->getInstance()Lcom/immomo/moment/datadot/DataDotUtils;

    move-result-object p0

    invoke-virtual {p0}, Lcom/immomo/moment/datadot/DataDotUtils;->getRecoderDataDotInfo()Lcom/immomo/moment/datadot/RecoderDataDotInfo;

    move-result-object p0

    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Lcom/immomo/moment/datadot/RecoderDataDotInfo;->setCameraVideoCq(Z)V

    .line 16
    invoke-static {}, Lcom/immomo/moment/datadot/DataDotUtils;->getInstance()Lcom/immomo/moment/datadot/DataDotUtils;

    move-result-object p0

    invoke-virtual {p0}, Lcom/immomo/moment/datadot/DataDotUtils;->getRecoderDataDotInfo()Lcom/immomo/moment/datadot/RecoderDataDotInfo;

    move-result-object p0

    const-string p1, "audio/mp4a-latm"

    invoke-virtual {p0, p1}, Lcom/immomo/moment/datadot/RecoderDataDotInfo;->setCameraAudioEncode(Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic H0(Ll/ob4;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/ob4;->p1()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private H1()V
    .locals 1

    .line 1
    iget p0, p0, Ll/ob4;->W:I

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    if-ne p0, v0, :cond_0

    .line 5
    .line 6
    invoke-static {}, Lcom/immomo/moment/datadot/DataDotUtils;->getInstance()Lcom/immomo/moment/datadot/DataDotUtils;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    invoke-virtual {p0}, Lcom/immomo/moment/datadot/DataDotUtils;->getRecoderDataDotInfo()Lcom/immomo/moment/datadot/RecoderDataDotInfo;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    invoke-virtual {p0, v0}, Lcom/immomo/moment/datadot/RecoderDataDotInfo;->setCameraPositionState(I)V

    .line 15
    .line 16
    .line 17
    return-void

    .line 18
    :cond_0
    const/16 v0, 0x10

    .line 19
    .line 20
    if-ne p0, v0, :cond_1

    .line 21
    .line 22
    invoke-static {}, Lcom/immomo/moment/datadot/DataDotUtils;->getInstance()Lcom/immomo/moment/datadot/DataDotUtils;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    invoke-virtual {p0}, Lcom/immomo/moment/datadot/DataDotUtils;->getRecoderDataDotInfo()Lcom/immomo/moment/datadot/RecoderDataDotInfo;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    const/4 v0, 0x2

    .line 31
    invoke-virtual {p0, v0}, Lcom/immomo/moment/datadot/RecoderDataDotInfo;->setCameraPositionState(I)V

    .line 32
    .line 33
    .line 34
    return-void

    .line 35
    :cond_1
    const/16 v0, 0x11

    .line 36
    .line 37
    if-ne p0, v0, :cond_2

    .line 38
    .line 39
    invoke-static {}, Lcom/immomo/moment/datadot/DataDotUtils;->getInstance()Lcom/immomo/moment/datadot/DataDotUtils;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    invoke-virtual {p0}, Lcom/immomo/moment/datadot/DataDotUtils;->getRecoderDataDotInfo()Lcom/immomo/moment/datadot/RecoderDataDotInfo;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    const/4 v0, 0x3

    .line 48
    invoke-virtual {p0, v0}, Lcom/immomo/moment/datadot/RecoderDataDotInfo;->setCameraPositionState(I)V

    .line 49
    .line 50
    .line 51
    :cond_2
    return-void
.end method

.method public static synthetic I0(Ll/ob4;)Ll/ia4;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ob4;->I:Ll/ia4;

    .line 2
    .line 3
    return-object p0
.end method

.method private I1()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/ob4;->d0:Ll/qow;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/qow;->n()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Ll/ob4;->h:Ll/sow;

    .line 10
    .line 11
    iget v0, v0, Ll/sow;->h:I

    .line 12
    .line 13
    iput v0, p0, Ll/ob4;->g0:I

    .line 14
    .line 15
    iput v0, p0, Ll/ob4;->h0:I

    .line 16
    .line 17
    return-void

    .line 18
    :cond_0
    const/4 v1, 0x1

    .line 19
    if-ne v0, v1, :cond_2

    .line 20
    .line 21
    iget-object v0, p0, Ll/ob4;->h:Ll/sow;

    .line 22
    .line 23
    iget v0, v0, Ll/sow;->h:I

    .line 24
    .line 25
    mul-int/lit8 v1, v0, 0x4

    .line 26
    .line 27
    div-int/lit8 v1, v1, 0x3

    .line 28
    .line 29
    rem-int/lit8 v2, v1, 0x4

    .line 30
    .line 31
    if-eqz v2, :cond_1

    .line 32
    .line 33
    shr-int/lit8 v1, v1, 0x4

    .line 34
    .line 35
    shl-int/lit8 v1, v1, 0x4

    .line 36
    .line 37
    :cond_1
    iput v0, p0, Ll/ob4;->g0:I

    .line 38
    .line 39
    iput v1, p0, Ll/ob4;->h0:I

    .line 40
    .line 41
    return-void

    .line 42
    :cond_2
    const/4 v1, 0x2

    .line 43
    if-ne v0, v1, :cond_3

    .line 44
    .line 45
    iget-object v0, p0, Ll/ob4;->h:Ll/sow;

    .line 46
    .line 47
    iget v1, v0, Ll/sow;->h:I

    .line 48
    .line 49
    iput v1, p0, Ll/ob4;->g0:I

    .line 50
    .line 51
    iget v0, v0, Ll/sow;->i:I

    .line 52
    .line 53
    iput v0, p0, Ll/ob4;->h0:I

    .line 54
    .line 55
    :cond_3
    return-void
.end method

.method public static synthetic J0(Ll/ob4;Ljava/lang/Object;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ob4;->r1(Ljava/lang/Object;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic K0(Ll/ob4;Ll/crf0;Ll/xow;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Ll/ob4;->v1(Ll/crf0;Ll/xow;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private K1()V
    .locals 1

    .line 1
    new-instance v0, Ll/ob4$l;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/ob4$l;-><init>(Ll/ob4;)V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Ll/w310;->b(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public static synthetic L0(Ll/ob4;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ob4;->q1(I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private L1()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ob4;->I:Ll/ia4;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/ia4;->i()V

    .line 6
    .line 7
    .line 8
    :cond_0
    new-instance v0, Ll/ob4$m;

    .line 9
    .line 10
    invoke-direct {v0, p0}, Ll/ob4$m;-><init>(Ll/ob4;)V

    .line 11
    .line 12
    .line 13
    invoke-static {v0}, Ll/w310;->b(Ljava/lang/Runnable;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public static synthetic M0(Ll/ob4;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/ob4;->Q1()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private M1(IIII)V
    .locals 3

    .line 1
    invoke-static {}, Lcom/immomo/moment/util/datadot/RecorderDataDotUtils;->getInstance()Lcom/immomo/moment/util/datadot/RecorderDataDotUtils;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    int-to-long v0, p1

    .line 6
    sget-object p1, Lcom/momo/xengine/mestatistics/ReportType;->COUNT:Lcom/momo/xengine/mestatistics/ReportType;

    .line 7
    .line 8
    const-string v2, "sdk-camera-engine-encode-width"

    .line 9
    .line 10
    invoke-virtual {p0, v2, v0, v1, p1}, Lcom/immomo/moment/util/datadot/RecorderDataDotUtils;->realTimeReport(Ljava/lang/String;JLcom/momo/xengine/mestatistics/ReportType;)V

    .line 11
    .line 12
    .line 13
    invoke-static {}, Lcom/immomo/moment/util/datadot/RecorderDataDotUtils;->getInstance()Lcom/immomo/moment/util/datadot/RecorderDataDotUtils;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    const-string v0, "sdk-camera-engine-encode-height"

    .line 18
    .line 19
    int-to-long v1, p2

    .line 20
    invoke-virtual {p0, v0, v1, v2, p1}, Lcom/immomo/moment/util/datadot/RecorderDataDotUtils;->realTimeReport(Ljava/lang/String;JLcom/momo/xengine/mestatistics/ReportType;)V

    .line 21
    .line 22
    .line 23
    invoke-static {}, Lcom/immomo/moment/util/datadot/RecorderDataDotUtils;->getInstance()Lcom/immomo/moment/util/datadot/RecorderDataDotUtils;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    const-string p2, "sdk-camera-engine-encode-fps"

    .line 28
    .line 29
    int-to-long v0, p3

    .line 30
    invoke-virtual {p0, p2, v0, v1, p1}, Lcom/immomo/moment/util/datadot/RecorderDataDotUtils;->realTimeReport(Ljava/lang/String;JLcom/momo/xengine/mestatistics/ReportType;)V

    .line 31
    .line 32
    .line 33
    invoke-static {}, Lcom/immomo/moment/util/datadot/RecorderDataDotUtils;->getInstance()Lcom/immomo/moment/util/datadot/RecorderDataDotUtils;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    const-string p2, "sdk-camera-engine-encode-bitrate"

    .line 38
    .line 39
    int-to-long p3, p4

    .line 40
    invoke-virtual {p0, p2, p3, p4, p1}, Lcom/immomo/moment/util/datadot/RecorderDataDotUtils;->realTimeReport(Ljava/lang/String;JLcom/momo/xengine/mestatistics/ReportType;)V

    .line 41
    .line 42
    .line 43
    return-void
.end method

.method public static synthetic N0(Ll/ob4;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/ob4;->h1()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic O0(Ll/ob4;)Ll/la1;
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

.method public static synthetic P0(Ll/ob4;)F
    .locals 0

    .line 1
    iget p0, p0, Ll/ob4;->k:F

    .line 2
    .line 3
    return p0
.end method

.method private P1(Z)Lcom/immomo/moment/model/VideoFragment;
    .locals 4

    .line 1
    const-string v0, "media"

    .line 2
    .line 3
    new-instance v1, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    const-string v2, " Calling stoprecording withsync value=["

    .line 6
    .line 7
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v2, "]"

    .line 14
    .line 15
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    invoke-static {v0, v1}, Lcom/cosmos/mdlog/MDLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    iget-boolean v0, p0, Ll/ob4;->n:Z

    .line 26
    .line 27
    if-nez v0, :cond_0

    .line 28
    .line 29
    const/4 p0, 0x0

    .line 30
    return-object p0

    .line 31
    :cond_0
    iget-object v0, p0, Ll/ob4;->H:Ljava/lang/Object;

    .line 32
    .line 33
    monitor-enter v0

    .line 34
    :try_start_0
    iget-object v1, p0, Ll/ob4;->g:Ll/v5c;

    .line 35
    .line 36
    if-eqz v1, :cond_3

    .line 37
    .line 38
    iget-object v2, p0, Ll/ob4;->A:Landroid/view/Surface;

    .line 39
    .line 40
    invoke-virtual {v1, v2}, Ll/v5c;->f1(Ljava/lang/Object;)V

    .line 41
    .line 42
    .line 43
    iget-object v1, p0, Ll/ob4;->B:Landroid/view/Surface;

    .line 44
    .line 45
    if-eqz v1, :cond_1

    .line 46
    .line 47
    iget-object v2, p0, Ll/ob4;->g:Ll/v5c;

    .line 48
    .line 49
    invoke-virtual {v2, v1}, Ll/v5c;->g1(Ljava/lang/Object;)V

    .line 50
    .line 51
    .line 52
    goto :goto_0

    .line 53
    :catchall_0
    move-exception p0

    .line 54
    goto :goto_2

    .line 55
    :cond_1
    :goto_0
    if-eqz p1, :cond_2

    .line 56
    .line 57
    invoke-direct {p0}, Ll/ob4;->u1()V

    .line 58
    .line 59
    .line 60
    goto :goto_1

    .line 61
    :cond_2
    iget-object p1, p0, Ll/ob4;->g:Ll/v5c;

    .line 62
    .line 63
    invoke-virtual {p1}, Ll/qt2;->O()V

    .line 64
    .line 65
    .line 66
    :cond_3
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 67
    invoke-direct {p0}, Ll/ob4;->H1()V

    .line 68
    .line 69
    .line 70
    const-string p1, "media"

    .line 71
    .line 72
    new-instance v0, Ljava/lang/StringBuilder;

    .line 73
    .line 74
    const-string v1, "Stop recording , path is "

    .line 75
    .line 76
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 77
    .line 78
    .line 79
    iget-object v1, p0, Ll/ob4;->i:Ljava/lang/String;

    .line 80
    .line 81
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 82
    .line 83
    .line 84
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 85
    .line 86
    .line 87
    move-result-object v0

    .line 88
    invoke-static {p1, v0}, Lcom/cosmos/mdlog/MDLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 89
    .line 90
    .line 91
    new-instance p1, Lcom/immomo/moment/model/VideoFragment;

    .line 92
    .line 93
    invoke-direct {p1}, Lcom/immomo/moment/model/VideoFragment;-><init>()V

    .line 94
    .line 95
    .line 96
    iget-object v0, p0, Ll/ob4;->i:Ljava/lang/String;

    .line 97
    .line 98
    invoke-virtual {p1, v0}, Lcom/immomo/moment/model/VideoFragment;->setVideoPath(Ljava/lang/String;)V

    .line 99
    .line 100
    .line 101
    iget v0, p0, Ll/ob4;->k:F

    .line 102
    .line 103
    invoke-virtual {p1, v0}, Lcom/immomo/moment/model/VideoFragment;->setSpeed(F)V

    .line 104
    .line 105
    .line 106
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    .line 107
    .line 108
    .line 109
    move-result-wide v0

    .line 110
    iget-wide v2, p0, Ll/ob4;->l:J

    .line 111
    .line 112
    sub-long/2addr v0, v2

    .line 113
    invoke-virtual {p1, v0, v1}, Lcom/immomo/moment/model/VideoFragment;->setDuration(J)V

    .line 114
    .line 115
    .line 116
    return-object p1

    .line 117
    :goto_2
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 118
    throw p0
.end method

.method public static synthetic Q0(Ll/ob4;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/ob4;->V:Z

    .line 2
    .line 3
    return p0
.end method

.method private declared-synchronized Q1()V
    .locals 3

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    const-string v0, "mediaRender"

    .line 3
    .line 4
    const-string v1, "Release SurfaceTexture in host looper !"

    .line 5
    .line 6
    invoke-static {v0, v1}, Lcom/cosmos/mdlog/MDLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 7
    .line 8
    .line 9
    iget-object v0, p0, Ll/ob4;->o:Landroid/graphics/SurfaceTexture;

    .line 10
    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    invoke-virtual {v0}, Landroid/graphics/SurfaceTexture;->release()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 14
    .line 15
    .line 16
    goto :goto_0

    .line 17
    :catchall_0
    move-exception v0

    .line 18
    :try_start_1
    const-string v1, "mediaRender"

    .line 19
    .line 20
    const-string v2, "SurfaceTexture release error !"

    .line 21
    .line 22
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-static {v1, v2, v0}, Lcom/cosmos/mdlog/MDLog;->e(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 27
    .line 28
    .line 29
    :cond_0
    :goto_0
    const/4 v0, 0x0

    .line 30
    iput-object v0, p0, Ll/ob4;->o:Landroid/graphics/SurfaceTexture;

    .line 31
    .line 32
    iget-object v1, p0, Ll/ob4;->p:Ll/uje;

    .line 33
    .line 34
    if-eqz v1, :cond_1

    .line 35
    .line 36
    const-string v1, "mediaRender"

    .line 37
    .line 38
    const-string v2, "Release EglWrapper in host looper !"

    .line 39
    .line 40
    invoke-static {v1, v2}, Lcom/cosmos/mdlog/MDLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    iget-object v1, p0, Ll/ob4;->p:Ll/uje;

    .line 44
    .line 45
    invoke-virtual {v1}, Ll/uje;->g()V

    .line 46
    .line 47
    .line 48
    iput-object v0, p0, Ll/ob4;->p:Ll/uje;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 49
    .line 50
    goto :goto_1

    .line 51
    :catchall_1
    move-exception v0

    .line 52
    goto :goto_2

    .line 53
    :cond_1
    :goto_1
    monitor-exit p0

    .line 54
    return-void

    .line 55
    :goto_2
    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 56
    throw v0
.end method

.method public static synthetic R0(Ll/ob4;)Ll/p3m;
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

.method public static synthetic S0(Ll/ob4;Landroid/os/Message;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ob4;->w1(Landroid/os/Message;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private S1([BLcom/immomo/components/interfaces/IProcessOutput;)V
    .locals 3

    .line 1
    if-eqz p1, :cond_2

    .line 2
    .line 3
    array-length v0, p1

    .line 4
    iget v1, p0, Ll/ob4;->r:I

    .line 5
    .line 6
    mul-int/lit8 v1, v1, 0x3

    .line 7
    .line 8
    shr-int/lit8 v1, v1, 0x1

    .line 9
    .line 10
    if-lt v0, v1, :cond_2

    .line 11
    .line 12
    iget-object v0, p0, Ll/ob4;->g:Ll/v5c;

    .line 13
    .line 14
    if-nez v0, :cond_0

    .line 15
    .line 16
    goto :goto_2

    .line 17
    :cond_0
    iget-object v0, p0, Ll/ob4;->H:Ljava/lang/Object;

    .line 18
    .line 19
    monitor-enter v0

    .line 20
    :try_start_0
    iget-object v1, p0, Ll/ob4;->P:Ljava/lang/Boolean;

    .line 21
    .line 22
    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 23
    .line 24
    .line 25
    move-result v1

    .line 26
    if-eqz v1, :cond_1

    .line 27
    .line 28
    iget-object v1, p0, Ll/ob4;->I:Ll/ia4;

    .line 29
    .line 30
    if-eqz v1, :cond_1

    .line 31
    .line 32
    invoke-virtual {v1}, Ll/ia4;->d()Ll/ypl;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    if-eqz v1, :cond_1

    .line 37
    .line 38
    iget-object v1, p0, Ll/ob4;->g:Ll/v5c;

    .line 39
    .line 40
    iget-object v2, p0, Ll/ob4;->I:Ll/ia4;

    .line 41
    .line 42
    invoke-virtual {v2}, Ll/ia4;->d()Ll/ypl;

    .line 43
    .line 44
    .line 45
    move-result-object v2

    .line 46
    invoke-interface {v2}, Ll/ypl;->m()I

    .line 47
    .line 48
    .line 49
    move-result v2

    .line 50
    invoke-virtual {v1, v2}, Ll/klc0;->x0(I)V

    .line 51
    .line 52
    .line 53
    iget-object v1, p0, Ll/ob4;->g:Ll/v5c;

    .line 54
    .line 55
    iget-object v2, p0, Ll/ob4;->I:Ll/ia4;

    .line 56
    .line 57
    invoke-virtual {v2}, Ll/ia4;->d()Ll/ypl;

    .line 58
    .line 59
    .line 60
    move-result-object v2

    .line 61
    invoke-interface {v2}, Ll/ypl;->i()Z

    .line 62
    .line 63
    .line 64
    move-result v2

    .line 65
    invoke-virtual {v1, v2}, Ll/klc0;->J0(Z)V

    .line 66
    .line 67
    .line 68
    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 69
    .line 70
    iput-object v1, p0, Ll/ob4;->P:Ljava/lang/Boolean;

    .line 71
    .line 72
    goto :goto_0

    .line 73
    :catchall_0
    move-exception p0

    .line 74
    goto :goto_1

    .line 75
    :cond_1
    :goto_0
    iget-object v1, p0, Ll/ob4;->j0:Ljava/util/LinkedList;

    .line 76
    .line 77
    invoke-virtual {v1, p2}, Ljava/util/LinkedList;->addLast(Ljava/lang/Object;)V

    .line 78
    .line 79
    .line 80
    iget-object p2, p0, Ll/ob4;->g:Ll/v5c;

    .line 81
    .line 82
    iget p0, p0, Ll/ob4;->r:I

    .line 83
    .line 84
    invoke-virtual {p2, p1, p0}, Ll/v5c;->r1([BI)V

    .line 85
    .line 86
    .line 87
    monitor-exit v0

    .line 88
    return-void

    .line 89
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 90
    throw p0

    .line 91
    :cond_2
    :goto_2
    return-void
.end method

.method public static synthetic T0(Ll/ob4;)Ll/qow;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ob4;->d0:Ll/qow;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic U0(Ll/ob4;)I
    .locals 0

    .line 1
    iget p0, p0, Ll/ob4;->c0:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic V0(Ll/ob4;)Ll/omq0$a;
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/ob4;->m1()Ll/omq0$a;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic W0(Ll/ob4;)Landroid/graphics/SurfaceTexture;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ob4;->o:Landroid/graphics/SurfaceTexture;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic X0(Ll/ob4;)Ll/apw;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ob4;->a0:Ll/apw;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic Y0(Ll/ob4;)I
    .locals 0

    .line 1
    iget p0, p0, Ll/ob4;->b0:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic Z0(Ll/ob4;II)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Ll/ob4;->o1(II)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic a(Ll/ob4;)Ll/qpw;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ob4;->e0:Ll/qpw;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic a1(Ll/ob4;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/ob4;->w:Z

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic b1(Ll/ob4;Z)Z
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/ob4;->w:Z

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic c1(Ll/ob4;)Ll/v5c;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ob4;->g:Ll/v5c;

    .line 2
    .line 3
    return-object p0
.end method

.method private d1(Lcom/immomo/components/interfaces/IProcessOutput;)V
    .locals 0

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    goto :goto_0

    .line 4
    :cond_0
    iget-object p0, p0, Ll/ob4;->i0:Ll/cvf;

    .line 5
    .line 6
    if-eqz p0, :cond_1

    .line 7
    .line 8
    invoke-virtual {p0, p1}, Ll/cvf;->a(Lcom/immomo/components/interfaces/IProcessOutput;)V

    .line 9
    .line 10
    .line 11
    :cond_1
    :goto_0
    return-void
.end method

.method private e1()V
    .locals 7

    .line 1
    iget-object v0, p0, Ll/ob4;->s:Lcom/immomo/moment/mediautils/l;

    .line 2
    .line 3
    const-string v1, "CameraPreviewManager"

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 9
    .line 10
    .line 11
    move-result-wide v3

    .line 12
    iget-object v0, p0, Ll/ob4;->s:Lcom/immomo/moment/mediautils/l;

    .line 13
    .line 14
    invoke-virtual {v0}, Lcom/immomo/moment/mediautils/l;->n()V

    .line 15
    .line 16
    .line 17
    new-instance v0, Ljava/lang/StringBuilder;

    .line 18
    .line 19
    const-string v5, "stopEncoding cost:"

    .line 20
    .line 21
    invoke-direct {v0, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 25
    .line 26
    .line 27
    move-result-wide v5

    .line 28
    sub-long/2addr v5, v3

    .line 29
    invoke-virtual {v0, v5, v6}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 30
    .line 31
    .line 32
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    invoke-static {v1, v0}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    iput-object v2, p0, Ll/ob4;->s:Lcom/immomo/moment/mediautils/l;

    .line 40
    .line 41
    :cond_0
    iget-object v0, p0, Ll/ob4;->t:Lcom/immomo/moment/mediautils/l;

    .line 42
    .line 43
    if-eqz v0, :cond_1

    .line 44
    .line 45
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 46
    .line 47
    .line 48
    move-result-wide v3

    .line 49
    iget-object v0, p0, Ll/ob4;->t:Lcom/immomo/moment/mediautils/l;

    .line 50
    .line 51
    invoke-virtual {v0}, Lcom/immomo/moment/mediautils/l;->n()V

    .line 52
    .line 53
    .line 54
    new-instance v0, Ljava/lang/StringBuilder;

    .line 55
    .line 56
    const-string v5, "stopEncoding origin cost:"

    .line 57
    .line 58
    invoke-direct {v0, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 59
    .line 60
    .line 61
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 62
    .line 63
    .line 64
    move-result-wide v5

    .line 65
    sub-long/2addr v5, v3

    .line 66
    invoke-virtual {v0, v5, v6}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 67
    .line 68
    .line 69
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 70
    .line 71
    .line 72
    move-result-object v0

    .line 73
    invoke-static {v1, v0}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 74
    .line 75
    .line 76
    iput-object v2, p0, Ll/ob4;->t:Lcom/immomo/moment/mediautils/l;

    .line 77
    .line 78
    :cond_1
    iget-object v0, p0, Ll/ob4;->A:Landroid/view/Surface;

    .line 79
    .line 80
    if-eqz v0, :cond_2

    .line 81
    .line 82
    invoke-virtual {v0}, Landroid/view/Surface;->release()V

    .line 83
    .line 84
    .line 85
    iput-object v2, p0, Ll/ob4;->A:Landroid/view/Surface;

    .line 86
    .line 87
    :cond_2
    iget-object v0, p0, Ll/ob4;->B:Landroid/view/Surface;

    .line 88
    .line 89
    if-eqz v0, :cond_3

    .line 90
    .line 91
    invoke-virtual {v0}, Landroid/view/Surface;->release()V

    .line 92
    .line 93
    .line 94
    iput-object v2, p0, Ll/ob4;->B:Landroid/view/Surface;

    .line 95
    .line 96
    :cond_3
    const/4 v0, 0x0

    .line 97
    iput-boolean v0, p0, Ll/ob4;->n:Z

    .line 98
    .line 99
    iput-boolean v0, p0, Ll/ob4;->V:Z

    .line 100
    .line 101
    const-string p0, "media"

    .line 102
    .line 103
    const-string v0, "Handle stop recording finished !"

    .line 104
    .line 105
    invoke-static {p0, v0}, Lcom/cosmos/mdlog/MDLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 106
    .line 107
    .line 108
    return-void
.end method

.method public static synthetic f(Ll/ob4;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/ob4;->B1()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private f1()V
    .locals 17

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    iget v1, v0, Ll/ob4;->g0:I

    .line 4
    .line 5
    iget v2, v0, Ll/ob4;->h0:I

    .line 6
    .line 7
    iget-object v3, v0, Ll/ob4;->h:Ll/sow;

    .line 8
    .line 9
    iget v4, v3, Ll/sow;->s:I

    .line 10
    .line 11
    iget v5, v3, Ll/sow;->u:I

    .line 12
    .line 13
    iget v6, v3, Ll/sow;->t:I

    .line 14
    .line 15
    iget v7, v3, Ll/sow;->q:I

    .line 16
    .line 17
    iget v8, v3, Ll/sow;->R:F

    .line 18
    .line 19
    iget v10, v3, Ll/sow;->C:I

    .line 20
    .line 21
    iget v12, v3, Ll/sow;->E:I

    .line 22
    .line 23
    iget v13, v3, Ll/sow;->F:I

    .line 24
    .line 25
    iget v14, v3, Ll/sow;->D:I

    .line 26
    .line 27
    iget v9, v3, Ll/sow;->J:I

    .line 28
    .line 29
    iget-boolean v3, v3, Ll/sow;->U:Z

    .line 30
    .line 31
    if-nez v9, :cond_0

    .line 32
    .line 33
    if-nez v4, :cond_2

    .line 34
    .line 35
    const/16 v4, 0x1e

    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_0
    iget v4, v0, Ll/ob4;->C:I

    .line 39
    .line 40
    const/16 v11, 0xa

    .line 41
    .line 42
    if-lt v4, v11, :cond_1

    .line 43
    .line 44
    goto :goto_0

    .line 45
    :cond_1
    move v4, v11

    .line 46
    :cond_2
    :goto_0
    invoke-direct {v0, v1, v2, v4, v5}, Ll/ob4;->M1(IIII)V

    .line 47
    .line 48
    .line 49
    new-instance v11, Ljava/lang/StringBuilder;

    .line 50
    .line 51
    const-string v15, "create media encoder videoWidth = "

    .line 52
    .line 53
    invoke-direct {v11, v15}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 54
    .line 55
    .line 56
    invoke-virtual {v11, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 57
    .line 58
    .line 59
    const-string v15, " videoHeight = "

    .line 60
    .line 61
    invoke-virtual {v11, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 62
    .line 63
    .line 64
    invoke-virtual {v11, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 65
    .line 66
    .line 67
    const-string v15, " videoFps = "

    .line 68
    .line 69
    invoke-virtual {v11, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 70
    .line 71
    .line 72
    invoke-virtual {v11, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 73
    .line 74
    .line 75
    const-string v15, " videoBitrate = "

    .line 76
    .line 77
    invoke-virtual {v11, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 78
    .line 79
    .line 80
    invoke-virtual {v11, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 81
    .line 82
    .line 83
    const-string v15, " videoGopSize = "

    .line 84
    .line 85
    invoke-virtual {v11, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 86
    .line 87
    .line 88
    invoke-virtual {v11, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 89
    .line 90
    .line 91
    const-string v15, " videoRotation = "

    .line 92
    .line 93
    invoke-virtual {v11, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 94
    .line 95
    .line 96
    invoke-virtual {v11, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 97
    .line 98
    .line 99
    const-string v15, " recordSpeed "

    .line 100
    .line 101
    invoke-virtual {v11, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 102
    .line 103
    .line 104
    invoke-virtual {v11, v8}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 105
    .line 106
    .line 107
    const-string v15, " audioSampleRate = "

    .line 108
    .line 109
    invoke-virtual {v11, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 110
    .line 111
    .line 112
    invoke-virtual {v11, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 113
    .line 114
    .line 115
    const-string v15, " audioBits = 16 audioChannels = "

    .line 116
    .line 117
    invoke-virtual {v11, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 118
    .line 119
    .line 120
    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 121
    .line 122
    .line 123
    const-string v15, " audioBitrate = "

    .line 124
    .line 125
    invoke-virtual {v11, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 126
    .line 127
    .line 128
    invoke-virtual {v11, v13}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 129
    .line 130
    .line 131
    const-string v15, " audioBufferSize = "

    .line 132
    .line 133
    invoke-virtual {v11, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 134
    .line 135
    .line 136
    invoke-virtual {v11, v14}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 137
    .line 138
    .line 139
    const-string v15, " encoderGopMode = "

    .line 140
    .line 141
    invoke-virtual {v11, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 142
    .line 143
    .line 144
    invoke-virtual {v11, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 145
    .line 146
    .line 147
    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 148
    .line 149
    .line 150
    move-result-object v9

    .line 151
    const-string v15, "media"

    .line 152
    .line 153
    invoke-static {v15, v9}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 154
    .line 155
    .line 156
    new-instance v9, Lcom/immomo/moment/mediautils/l;

    .line 157
    .line 158
    invoke-direct {v9}, Lcom/immomo/moment/mediautils/l;-><init>()V

    .line 159
    .line 160
    .line 161
    iput-object v9, v0, Ll/ob4;->s:Lcom/immomo/moment/mediautils/l;

    .line 162
    .line 163
    iget-object v11, v0, Ll/ob4;->i:Ljava/lang/String;

    .line 164
    .line 165
    invoke-virtual {v9, v11}, Lcom/immomo/moment/mediautils/l;->N(Ljava/lang/String;)V

    .line 166
    .line 167
    .line 168
    iget-object v9, v0, Ll/ob4;->s:Lcom/immomo/moment/mediautils/l;

    .line 169
    .line 170
    invoke-virtual {v9, v8}, Lcom/immomo/moment/mediautils/l;->P(F)V

    .line 171
    .line 172
    .line 173
    iget-object v9, v0, Ll/ob4;->s:Lcom/immomo/moment/mediautils/l;

    .line 174
    .line 175
    if-eqz v9, :cond_3

    .line 176
    .line 177
    new-instance v11, Ll/ob4$h;

    .line 178
    .line 179
    invoke-direct {v11, v0}, Ll/ob4$h;-><init>(Ll/ob4;)V

    .line 180
    .line 181
    .line 182
    invoke-virtual {v9, v11}, Lcom/immomo/moment/mediautils/l;->M(Ll/spw;)V

    .line 183
    .line 184
    .line 185
    :cond_3
    iget-object v9, v0, Ll/ob4;->j:Ljava/lang/String;

    .line 186
    .line 187
    if-eqz v9, :cond_4

    .line 188
    .line 189
    new-instance v9, Lcom/immomo/moment/mediautils/l;

    .line 190
    .line 191
    invoke-direct {v9}, Lcom/immomo/moment/mediautils/l;-><init>()V

    .line 192
    .line 193
    .line 194
    iput-object v9, v0, Ll/ob4;->t:Lcom/immomo/moment/mediautils/l;

    .line 195
    .line 196
    iget-object v11, v0, Ll/ob4;->j:Ljava/lang/String;

    .line 197
    .line 198
    invoke-virtual {v9, v11}, Lcom/immomo/moment/mediautils/l;->N(Ljava/lang/String;)V

    .line 199
    .line 200
    .line 201
    iget-object v9, v0, Ll/ob4;->t:Lcom/immomo/moment/mediautils/l;

    .line 202
    .line 203
    invoke-virtual {v9, v8}, Lcom/immomo/moment/mediautils/l;->P(F)V

    .line 204
    .line 205
    .line 206
    iget-object v9, v0, Ll/ob4;->t:Lcom/immomo/moment/mediautils/l;

    .line 207
    .line 208
    if-eqz v9, :cond_4

    .line 209
    .line 210
    new-instance v11, Ll/ob4$i;

    .line 211
    .line 212
    invoke-direct {v11, v0}, Ll/ob4$i;-><init>(Ll/ob4;)V

    .line 213
    .line 214
    .line 215
    invoke-virtual {v9, v11}, Lcom/immomo/moment/mediautils/l;->M(Ll/spw;)V

    .line 216
    .line 217
    .line 218
    :cond_4
    iput v8, v0, Ll/ob4;->k:F

    .line 219
    .line 220
    new-instance v8, Ll/ed1;

    .line 221
    .line 222
    invoke-direct {v8}, Ll/ed1;-><init>()V

    .line 223
    .line 224
    .line 225
    iput-object v8, v0, Ll/ob4;->x:Ll/ed1;

    .line 226
    .line 227
    const/16 v11, 0x10

    .line 228
    .line 229
    invoke-virtual {v8, v10, v11, v12}, Ll/ed1;->d(III)V

    .line 230
    .line 231
    .line 232
    iget-object v8, v0, Ll/ob4;->x:Ll/ed1;

    .line 233
    .line 234
    invoke-virtual {v8}, Ll/ed1;->a()Z

    .line 235
    .line 236
    .line 237
    move v8, v3

    .line 238
    move v3, v2

    .line 239
    move v2, v1

    .line 240
    iget-object v1, v0, Ll/ob4;->s:Lcom/immomo/moment/mediautils/l;

    .line 241
    .line 242
    move v9, v8

    .line 243
    sget v8, Lcom/immomo/moment/mediautils/l;->U:I

    .line 244
    .line 245
    invoke-virtual/range {v1 .. v9}, Lcom/immomo/moment/mediautils/l;->S(IIIIIIIZ)V

    .line 246
    .line 247
    .line 248
    move v1, v2

    .line 249
    move v2, v3

    .line 250
    move v3, v4

    .line 251
    move v4, v5

    .line 252
    move v5, v6

    .line 253
    move v6, v7

    .line 254
    move/from16 v16, v9

    .line 255
    .line 256
    iget-object v7, v0, Ll/ob4;->d0:Ll/qow;

    .line 257
    .line 258
    invoke-virtual {v7}, Ll/qow;->i()Z

    .line 259
    .line 260
    .line 261
    move-result v7

    .line 262
    if-nez v7, :cond_5

    .line 263
    .line 264
    iget-object v9, v0, Ll/ob4;->s:Lcom/immomo/moment/mediautils/l;

    .line 265
    .line 266
    invoke-virtual/range {v9 .. v14}, Lcom/immomo/moment/mediautils/l;->K(IIIII)V

    .line 267
    .line 268
    .line 269
    :cond_5
    move v7, v10

    .line 270
    move v8, v11

    .line 271
    move v9, v12

    .line 272
    move v10, v13

    .line 273
    move v11, v14

    .line 274
    invoke-direct/range {v0 .. v11}, Ll/ob4;->G1(IIIIIIIIIII)V

    .line 275
    .line 276
    .line 277
    move v12, v9

    .line 278
    move v13, v10

    .line 279
    move v14, v11

    .line 280
    move-object v9, v0

    .line 281
    move v10, v7

    .line 282
    move v11, v8

    .line 283
    iget-object v0, v9, Ll/ob4;->s:Lcom/immomo/moment/mediautils/l;

    .line 284
    .line 285
    invoke-virtual {v0}, Lcom/immomo/moment/mediautils/l;->m()Z

    .line 286
    .line 287
    .line 288
    move-result v0

    .line 289
    const/4 v7, 0x0

    .line 290
    if-nez v0, :cond_6

    .line 291
    .line 292
    const-string v0, "Start encoding error !"

    .line 293
    .line 294
    invoke-static {v15, v0}, Lcom/cosmos/mdlog/MDLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 295
    .line 296
    .line 297
    iget-object v0, v9, Ll/ob4;->s:Lcom/immomo/moment/mediautils/l;

    .line 298
    .line 299
    invoke-virtual {v0}, Lcom/immomo/moment/mediautils/l;->n()V

    .line 300
    .line 301
    .line 302
    iput-object v7, v9, Ll/ob4;->s:Lcom/immomo/moment/mediautils/l;

    .line 303
    .line 304
    return-void

    .line 305
    :cond_6
    iget-object v0, v9, Ll/ob4;->t:Lcom/immomo/moment/mediautils/l;

    .line 306
    .line 307
    move-object v8, v7

    .line 308
    if-eqz v0, :cond_9

    .line 309
    .line 310
    sget v7, Lcom/immomo/moment/mediautils/l;->U:I

    .line 311
    .line 312
    move/from16 v8, v16

    .line 313
    .line 314
    invoke-virtual/range {v0 .. v8}, Lcom/immomo/moment/mediautils/l;->S(IIIIIIIZ)V

    .line 315
    .line 316
    .line 317
    iget-object v0, v9, Ll/ob4;->d0:Ll/qow;

    .line 318
    .line 319
    invoke-virtual {v0}, Ll/qow;->i()Z

    .line 320
    .line 321
    .line 322
    move-result v0

    .line 323
    if-nez v0, :cond_7

    .line 324
    .line 325
    move-object v0, v9

    .line 326
    iget-object v9, v0, Ll/ob4;->t:Lcom/immomo/moment/mediautils/l;

    .line 327
    .line 328
    invoke-virtual/range {v9 .. v14}, Lcom/immomo/moment/mediautils/l;->K(IIIII)V

    .line 329
    .line 330
    .line 331
    goto :goto_1

    .line 332
    :cond_7
    move-object v0, v9

    .line 333
    :goto_1
    iget-object v1, v0, Ll/ob4;->t:Lcom/immomo/moment/mediautils/l;

    .line 334
    .line 335
    invoke-virtual {v1}, Lcom/immomo/moment/mediautils/l;->m()Z

    .line 336
    .line 337
    .line 338
    move-result v1

    .line 339
    if-nez v1, :cond_8

    .line 340
    .line 341
    const-string v1, "Start origin encoding error !"

    .line 342
    .line 343
    invoke-static {v15, v1}, Lcom/cosmos/mdlog/MDLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 344
    .line 345
    .line 346
    iget-object v1, v0, Ll/ob4;->t:Lcom/immomo/moment/mediautils/l;

    .line 347
    .line 348
    invoke-virtual {v1}, Lcom/immomo/moment/mediautils/l;->n()V

    .line 349
    .line 350
    .line 351
    const/4 v8, 0x0

    .line 352
    iput-object v8, v0, Ll/ob4;->t:Lcom/immomo/moment/mediautils/l;

    .line 353
    .line 354
    goto :goto_2

    .line 355
    :cond_8
    const/4 v8, 0x0

    .line 356
    goto :goto_2

    .line 357
    :cond_9
    move-object v0, v9

    .line 358
    :goto_2
    iget-object v1, v0, Ll/ob4;->s:Lcom/immomo/moment/mediautils/l;

    .line 359
    .line 360
    invoke-virtual {v1}, Lcom/immomo/moment/mediautils/l;->H()Landroid/view/Surface;

    .line 361
    .line 362
    .line 363
    move-result-object v1

    .line 364
    iput-object v1, v0, Ll/ob4;->A:Landroid/view/Surface;

    .line 365
    .line 366
    iget-object v1, v0, Ll/ob4;->t:Lcom/immomo/moment/mediautils/l;

    .line 367
    .line 368
    if-eqz v1, :cond_a

    .line 369
    .line 370
    invoke-virtual {v1}, Lcom/immomo/moment/mediautils/l;->H()Landroid/view/Surface;

    .line 371
    .line 372
    .line 373
    move-result-object v7

    .line 374
    goto :goto_3

    .line 375
    :cond_a
    move-object v7, v8

    .line 376
    :goto_3
    iput-object v7, v0, Ll/ob4;->B:Landroid/view/Surface;

    .line 377
    .line 378
    iget-object v1, v0, Ll/ob4;->u:Ll/pc1;

    .line 379
    .line 380
    if-eqz v1, :cond_b

    .line 381
    .line 382
    new-instance v2, Ll/ob4$k;

    .line 383
    .line 384
    invoke-direct {v2, v0}, Ll/ob4$k;-><init>(Ll/ob4;)V

    .line 385
    .line 386
    .line 387
    invoke-virtual {v1, v2}, Ll/pc1;->k(Ll/pc1$b;)V

    .line 388
    .line 389
    .line 390
    :cond_b
    const/4 v1, 0x1

    .line 391
    iput-boolean v1, v0, Ll/ob4;->n:Z

    .line 392
    .line 393
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    .line 394
    .line 395
    .line 396
    move-result-wide v1

    .line 397
    iput-wide v1, v0, Ll/ob4;->l:J

    .line 398
    .line 399
    return-void
.end method

.method public static synthetic g(Ll/ob4;)I
    .locals 0

    .line 1
    iget p0, p0, Ll/ob4;->X:I

    .line 2
    .line 3
    return p0
.end method

.method private declared-synchronized g1()V
    .locals 4

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    invoke-direct {p0}, Ll/ob4;->Q1()V

    .line 3
    .line 4
    .line 5
    iget-object v0, p0, Ll/ob4;->p:Ll/uje;

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    new-instance v0, Ll/uje;

    .line 10
    .line 11
    invoke-direct {v0}, Ll/uje;-><init>()V

    .line 12
    .line 13
    .line 14
    iput-object v0, p0, Ll/ob4;->p:Ll/uje;

    .line 15
    .line 16
    invoke-virtual {v0}, Ll/uje;->a()V

    .line 17
    .line 18
    .line 19
    goto :goto_0

    .line 20
    :catchall_0
    move-exception v0

    .line 21
    goto :goto_1

    .line 22
    :cond_0
    :goto_0
    iget-object v0, p0, Ll/ob4;->o:Landroid/graphics/SurfaceTexture;

    .line 23
    .line 24
    if-nez v0, :cond_1

    .line 25
    .line 26
    iget-object v0, p0, Ll/ob4;->p:Ll/uje;

    .line 27
    .line 28
    invoke-virtual {v0}, Ll/uje;->f()Z

    .line 29
    .line 30
    .line 31
    const/4 v0, 0x1

    .line 32
    new-array v1, v0, [I

    .line 33
    .line 34
    const/4 v2, 0x0

    .line 35
    invoke-static {v0, v1, v2}, Landroid/opengl/GLES20;->glGenTextures(I[II)V

    .line 36
    .line 37
    .line 38
    aget v0, v1, v2

    .line 39
    .line 40
    const v1, 0x8d65

    .line 41
    .line 42
    .line 43
    invoke-static {v1, v0}, Landroid/opengl/GLES20;->glBindTexture(II)V

    .line 44
    .line 45
    .line 46
    const/16 v1, 0x2801

    .line 47
    .line 48
    const/high16 v2, 0x46180000    # 9728.0f

    .line 49
    .line 50
    const/16 v3, 0xde1

    .line 51
    .line 52
    invoke-static {v3, v1, v2}, Landroid/opengl/GLES20;->glTexParameterf(IIF)V

    .line 53
    .line 54
    .line 55
    const/16 v1, 0x2800

    .line 56
    .line 57
    const v2, 0x46180400    # 9729.0f

    .line 58
    .line 59
    .line 60
    invoke-static {v3, v1, v2}, Landroid/opengl/GLES20;->glTexParameterf(IIF)V

    .line 61
    .line 62
    .line 63
    const/16 v1, 0x2802

    .line 64
    .line 65
    const v2, 0x812f

    .line 66
    .line 67
    .line 68
    invoke-static {v3, v1, v2}, Landroid/opengl/GLES20;->glTexParameteri(III)V

    .line 69
    .line 70
    .line 71
    const/16 v1, 0x2803

    .line 72
    .line 73
    invoke-static {v3, v1, v2}, Landroid/opengl/GLES20;->glTexParameteri(III)V

    .line 74
    .line 75
    .line 76
    new-instance v1, Landroid/graphics/SurfaceTexture;

    .line 77
    .line 78
    invoke-direct {v1, v0}, Landroid/graphics/SurfaceTexture;-><init>(I)V

    .line 79
    .line 80
    .line 81
    iput-object v1, p0, Ll/ob4;->o:Landroid/graphics/SurfaceTexture;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 82
    .line 83
    :cond_1
    monitor-exit p0

    .line 84
    return-void

    .line 85
    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 86
    throw v0
.end method

.method public static synthetic h(Ll/ob4;I)I
    .locals 0

    .line 1
    iput p1, p0, Ll/ob4;->X:I

    .line 2
    .line 3
    return p1
.end method

.method private h1()V
    .locals 6

    .line 1
    const-string v0, "media"

    .line 2
    .line 3
    const-string v1, "Begining to  create media encoder !"

    .line 4
    .line 5
    invoke-static {v0, v1}, Lcom/cosmos/mdlog/MDLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-boolean v2, p0, Ll/ob4;->n:Z

    .line 9
    .line 10
    if-eqz v2, :cond_0

    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    invoke-static {v0, v1}, Lcom/cosmos/mdlog/MDLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    invoke-direct {p0}, Ll/ob4;->I1()V

    .line 17
    .line 18
    .line 19
    iget-object v1, p0, Ll/ob4;->u:Ll/pc1;

    .line 20
    .line 21
    const-string v2, "["

    .line 22
    .line 23
    const/4 v3, 0x0

    .line 24
    if-eqz v1, :cond_1

    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_1
    iget-object v1, p0, Ll/ob4;->d0:Ll/qow;

    .line 28
    .line 29
    invoke-virtual {v1}, Ll/qow;->i()Z

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    if-nez v1, :cond_3

    .line 34
    .line 35
    const/16 v1, -0x12e

    .line 36
    .line 37
    invoke-direct {p0, v1, v3}, Ll/ob4;->o1(II)V

    .line 38
    .line 39
    .line 40
    iget-object v1, p0, Ll/ob4;->a0:Ll/apw;

    .line 41
    .line 42
    if-eqz v1, :cond_2

    .line 43
    .line 44
    iget v3, p0, Ll/ob4;->b0:I

    .line 45
    .line 46
    add-int/lit16 v3, v3, 0x3f9

    .line 47
    .line 48
    const-string v4, "AudioRecord is null !!!"

    .line 49
    .line 50
    invoke-interface {v1, v3, v4}, Ll/apw;->onError(ILjava/lang/String;)V

    .line 51
    .line 52
    .line 53
    :cond_2
    new-instance v1, Ljava/lang/StringBuilder;

    .line 54
    .line 55
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 56
    .line 57
    .line 58
    iget p0, p0, Ll/ob4;->b0:I

    .line 59
    .line 60
    add-int/lit16 p0, p0, 0x3fa

    .line 61
    .line 62
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 63
    .line 64
    .line 65
    const-string p0, "]AudioRecord is null !!!"

    .line 66
    .line 67
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 68
    .line 69
    .line 70
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 71
    .line 72
    .line 73
    move-result-object p0

    .line 74
    invoke-static {v0, p0}, Lcom/cosmos/mdlog/MDLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 75
    .line 76
    .line 77
    return-void

    .line 78
    :cond_3
    :goto_0
    :try_start_0
    invoke-direct {p0}, Ll/ob4;->f1()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 79
    .line 80
    .line 81
    iget-object v1, p0, Ll/ob4;->A:Landroid/view/Surface;

    .line 82
    .line 83
    if-eqz v1, :cond_5

    .line 84
    .line 85
    iget-object v1, p0, Ll/ob4;->d0:Ll/qow;

    .line 86
    .line 87
    invoke-virtual {v1}, Ll/qow;->l()Z

    .line 88
    .line 89
    .line 90
    move-result v1

    .line 91
    iget-object v2, p0, Ll/ob4;->g:Ll/v5c;

    .line 92
    .line 93
    if-eqz v1, :cond_4

    .line 94
    .line 95
    iget-object v1, p0, Ll/ob4;->A:Landroid/view/Surface;

    .line 96
    .line 97
    invoke-virtual {v2, v1}, Ll/v5c;->b1(Ljava/lang/Object;)V

    .line 98
    .line 99
    .line 100
    iget-object v1, p0, Ll/ob4;->g:Ll/v5c;

    .line 101
    .line 102
    iget-object v2, p0, Ll/ob4;->A:Landroid/view/Surface;

    .line 103
    .line 104
    new-instance v3, Ll/crf0;

    .line 105
    .line 106
    iget v4, p0, Ll/ob4;->g0:I

    .line 107
    .line 108
    iget v5, p0, Ll/ob4;->h0:I

    .line 109
    .line 110
    invoke-direct {v3, v4, v5}, Ll/crf0;-><init>(II)V

    .line 111
    .line 112
    .line 113
    invoke-virtual {v1, v2, v3}, Ll/eli0;->y0(Ljava/lang/Object;Ll/crf0;)V

    .line 114
    .line 115
    .line 116
    goto :goto_1

    .line 117
    :cond_4
    iget-object v1, p0, Ll/ob4;->A:Landroid/view/Surface;

    .line 118
    .line 119
    iget v3, p0, Ll/ob4;->g0:I

    .line 120
    .line 121
    iget v4, p0, Ll/ob4;->h0:I

    .line 122
    .line 123
    invoke-virtual {v2, v1, v3, v4}, Ll/v5c;->L0(Ljava/lang/Object;II)V

    .line 124
    .line 125
    .line 126
    :cond_5
    :goto_1
    iget-object v1, p0, Ll/ob4;->B:Landroid/view/Surface;

    .line 127
    .line 128
    if-eqz v1, :cond_6

    .line 129
    .line 130
    iget-object v2, p0, Ll/ob4;->g:Ll/v5c;

    .line 131
    .line 132
    iget v3, p0, Ll/ob4;->g0:I

    .line 133
    .line 134
    iget p0, p0, Ll/ob4;->h0:I

    .line 135
    .line 136
    invoke-virtual {v2, v1, v3, p0}, Ll/v5c;->M0(Ljava/lang/Object;II)V

    .line 137
    .line 138
    .line 139
    :cond_6
    const-string p0, "Create media encoder is done !"

    .line 140
    .line 141
    invoke-static {v0, p0}, Lcom/cosmos/mdlog/MDLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 142
    .line 143
    .line 144
    return-void

    .line 145
    :catch_0
    move-exception v1

    .line 146
    const/4 v4, 0x3

    .line 147
    invoke-direct {p0, v4, v3}, Ll/ob4;->o1(II)V

    .line 148
    .line 149
    .line 150
    iget-object v3, p0, Ll/ob4;->a0:Ll/apw;

    .line 151
    .line 152
    if-eqz v3, :cond_7

    .line 153
    .line 154
    iget-object v3, p0, Ll/ob4;->a0:Ll/apw;

    .line 155
    .line 156
    iget v4, p0, Ll/ob4;->b0:I

    .line 157
    .line 158
    add-int/lit16 v4, v4, 0x3f9

    .line 159
    .line 160
    const-string v5, "create encoder failed !!!"

    .line 161
    .line 162
    invoke-interface {v3, v4, v5}, Ll/apw;->onError(ILjava/lang/String;)V

    .line 163
    .line 164
    .line 165
    :cond_7
    new-instance v3, Ljava/lang/StringBuilder;

    .line 166
    .line 167
    invoke-direct {v3, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 168
    .line 169
    .line 170
    iget p0, p0, Ll/ob4;->b0:I

    .line 171
    .line 172
    add-int/lit16 p0, p0, 0x3f9

    .line 173
    .line 174
    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 175
    .line 176
    .line 177
    const-string p0, "]create encoder failed !!!"

    .line 178
    .line 179
    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 180
    .line 181
    .line 182
    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 183
    .line 184
    .line 185
    move-result-object p0

    .line 186
    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 187
    .line 188
    .line 189
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 190
    .line 191
    .line 192
    move-result-object p0

    .line 193
    invoke-static {v0, p0}, Lcom/cosmos/mdlog/MDLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 194
    .line 195
    .line 196
    return-void
.end method

.method public static synthetic i(Ll/ob4;)I
    .locals 2

    .line 1
    iget v0, p0, Ll/ob4;->X:I

    .line 2
    .line 3
    add-int/lit8 v1, v0, 0x1

    .line 4
    .line 5
    iput v1, p0, Ll/ob4;->X:I

    .line 6
    .line 7
    return v0
.end method

.method private i1()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ob4;->q:Landroid/os/Looper;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Landroid/os/Handler;

    .line 6
    .line 7
    iget-object v1, p0, Ll/ob4;->q:Landroid/os/Looper;

    .line 8
    .line 9
    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 10
    .line 11
    .line 12
    new-instance v1, Ll/ob4$e;

    .line 13
    .line 14
    invoke-direct {v1, p0}, Ll/ob4$e;-><init>(Ll/ob4;)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 18
    .line 19
    .line 20
    :cond_0
    return-void
.end method

.method public static synthetic j(Ll/ob4;)J
    .locals 2

    .line 1
    iget-wide v0, p0, Ll/ob4;->Y:J

    .line 2
    .line 3
    return-wide v0
.end method

.method private j1(ILl/qow;)Z
    .locals 6

    .line 1
    const-string v0, "media"

    .line 2
    .line 3
    const/16 v1, -0x12f

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    :try_start_0
    const-string v3, "The cameraPreviewManager switchCamera !!!"

    .line 7
    .line 8
    invoke-static {v0, v3}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    iget-object v3, p0, Ll/ob4;->I:Ll/ia4;

    .line 12
    .line 13
    if-eqz v3, :cond_0

    .line 14
    .line 15
    invoke-virtual {v3, p1, p2}, Ll/ia4;->s(ILl/qow;)V

    .line 16
    .line 17
    .line 18
    goto :goto_0

    .line 19
    :catch_0
    move-exception p1

    .line 20
    goto/16 :goto_1

    .line 21
    .line 22
    :cond_0
    :goto_0
    invoke-virtual {p0}, Ll/ob4;->R1()Ll/crf0;

    .line 23
    .line 24
    .line 25
    iget-object p1, p0, Ll/ob4;->g:Ll/v5c;

    .line 26
    .line 27
    iget-object p2, p0, Ll/ob4;->R:Ljava/lang/Object;

    .line 28
    .line 29
    new-instance v3, Ll/crf0;

    .line 30
    .line 31
    iget-object v4, p0, Ll/ob4;->h:Ll/sow;

    .line 32
    .line 33
    iget v5, v4, Ll/sow;->o:I

    .line 34
    .line 35
    iget v4, v4, Ll/sow;->p:I

    .line 36
    .line 37
    invoke-direct {v3, v5, v4}, Ll/crf0;-><init>(II)V

    .line 38
    .line 39
    .line 40
    invoke-virtual {p1, p2, v3}, Ll/eli0;->y0(Ljava/lang/Object;Ll/crf0;)V

    .line 41
    .line 42
    .line 43
    iget-object p1, p0, Ll/ob4;->g:Ll/v5c;

    .line 44
    .line 45
    new-instance p2, Ll/crf0;

    .line 46
    .line 47
    iget-object v3, p0, Ll/ob4;->h:Ll/sow;

    .line 48
    .line 49
    invoke-virtual {v3}, Ll/sow;->d()I

    .line 50
    .line 51
    .line 52
    move-result v3

    .line 53
    iget-object v4, p0, Ll/ob4;->h:Ll/sow;

    .line 54
    .line 55
    invoke-virtual {v4}, Ll/sow;->c()I

    .line 56
    .line 57
    .line 58
    move-result v4

    .line 59
    invoke-direct {p2, v3, v4}, Ll/crf0;-><init>(II)V

    .line 60
    .line 61
    .line 62
    invoke-virtual {p1, p2}, Ll/qt2;->R(Ljava/lang/Object;)V

    .line 63
    .line 64
    .line 65
    iget-object p1, p0, Ll/ob4;->g:Ll/v5c;

    .line 66
    .line 67
    invoke-direct {p0}, Ll/ob4;->m1()Ll/omq0$a;

    .line 68
    .line 69
    .line 70
    move-result-object p2

    .line 71
    invoke-virtual {p1, p2}, Ll/qt2;->C(Ljava/lang/Object;)V

    .line 72
    .line 73
    .line 74
    iget-object p1, p0, Ll/ob4;->I:Ll/ia4;

    .line 75
    .line 76
    if-eqz p1, :cond_1

    .line 77
    .line 78
    invoke-virtual {p1}, Ll/ia4;->d()Ll/ypl;

    .line 79
    .line 80
    .line 81
    move-result-object p1

    .line 82
    if-eqz p1, :cond_1

    .line 83
    .line 84
    iget-object p2, p0, Ll/ob4;->g:Ll/v5c;

    .line 85
    .line 86
    invoke-interface {p1}, Ll/ypl;->m()I

    .line 87
    .line 88
    .line 89
    move-result v3

    .line 90
    invoke-virtual {p2, v3}, Ll/klc0;->x0(I)V

    .line 91
    .line 92
    .line 93
    iget-object p2, p0, Ll/ob4;->g:Ll/v5c;

    .line 94
    .line 95
    invoke-interface {p1}, Ll/ypl;->i()Z

    .line 96
    .line 97
    .line 98
    move-result p1

    .line 99
    invoke-virtual {p2, p1}, Ll/klc0;->J0(Z)V

    .line 100
    .line 101
    .line 102
    :cond_1
    iget-object p1, p0, Ll/ob4;->h:Ll/sow;

    .line 103
    .line 104
    invoke-virtual {p1}, Ll/sow;->b()I

    .line 105
    .line 106
    .line 107
    move-result p1

    .line 108
    iput p1, p0, Ll/ob4;->r:I

    .line 109
    .line 110
    iget-object p1, p0, Ll/ob4;->I:Ll/ia4;

    .line 111
    .line 112
    iget-object p2, p0, Ll/ob4;->o:Landroid/graphics/SurfaceTexture;

    .line 113
    .line 114
    invoke-virtual {p1, p2}, Ll/ia4;->q(Landroid/graphics/SurfaceTexture;)Z

    .line 115
    .line 116
    .line 117
    move-result p1

    .line 118
    if-nez p1, :cond_2

    .line 119
    .line 120
    invoke-direct {p0, v1, v2}, Ll/ob4;->o1(II)V

    .line 121
    .line 122
    .line 123
    const-string p1, "The startPreview failed when switchCamera !!!"

    .line 124
    .line 125
    invoke-static {v0, p1}, Lcom/cosmos/mdlog/MDLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 126
    .line 127
    .line 128
    return v2

    .line 129
    :cond_2
    iget-object p1, p0, Ll/ob4;->i0:Ll/cvf;

    .line 130
    .line 131
    if-eqz p1, :cond_3

    .line 132
    .line 133
    invoke-virtual {p1, v2}, Ll/cvf;->c(Z)V

    .line 134
    .line 135
    .line 136
    :cond_3
    iget-object p1, p0, Ll/ob4;->i0:Ll/cvf;

    .line 137
    .line 138
    if-eqz p1, :cond_4

    .line 139
    .line 140
    invoke-virtual {p0}, Ll/ob4;->e()Z

    .line 141
    .line 142
    .line 143
    move-result p2

    .line 144
    invoke-virtual {p1, p2}, Ll/cvf;->b(Z)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 145
    .line 146
    .line 147
    :cond_4
    sget-object p1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 148
    .line 149
    iput-object p1, p0, Ll/ob4;->P:Ljava/lang/Boolean;

    .line 150
    .line 151
    const/4 p0, 0x1

    .line 152
    return p0

    .line 153
    :goto_1
    new-instance p2, Ljava/lang/StringBuilder;

    .line 154
    .line 155
    const-string v3, "switchCamera is failed because of "

    .line 156
    .line 157
    invoke-direct {p2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 158
    .line 159
    .line 160
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 161
    .line 162
    .line 163
    move-result-object p1

    .line 164
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 165
    .line 166
    .line 167
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 168
    .line 169
    .line 170
    move-result-object p1

    .line 171
    invoke-static {v0, p1}, Lcom/cosmos/mdlog/MDLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 172
    .line 173
    .line 174
    invoke-direct {p0, v1, v2}, Ll/ob4;->o1(II)V

    .line 175
    .line 176
    .line 177
    return v2
.end method

.method private k1(J)V
    .locals 10

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    cmp-long v2, p1, v0

    .line 4
    .line 5
    if-lez v2, :cond_3

    .line 6
    .line 7
    iget-wide v2, p0, Ll/ob4;->v0:J

    .line 8
    .line 9
    cmp-long v2, v2, v0

    .line 10
    .line 11
    if-lez v2, :cond_3

    .line 12
    .line 13
    iget-wide v2, p0, Ll/ob4;->u0:J

    .line 14
    .line 15
    cmp-long v2, v2, v0

    .line 16
    .line 17
    if-lez v2, :cond_3

    .line 18
    .line 19
    iget-wide v2, p0, Ll/ob4;->x0:J

    .line 20
    .line 21
    cmp-long v2, v2, v0

    .line 22
    .line 23
    if-lez v2, :cond_3

    .line 24
    .line 25
    invoke-static {}, Lcom/immomo/moment/util/datadot/RecorderDataDotUtils;->getInstance()Lcom/immomo/moment/util/datadot/RecorderDataDotUtils;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    sget-object v3, Lcom/momo/xengine/mestatistics/ReportType;->DURATION:Lcom/momo/xengine/mestatistics/ReportType;

    .line 30
    .line 31
    const-string v4, "sdk-camera-usage_duration"

    .line 32
    .line 33
    invoke-virtual {v2, v4, p1, p2, v3}, Lcom/immomo/moment/util/datadot/RecorderDataDotUtils;->report(Ljava/lang/String;JLcom/momo/xengine/mestatistics/ReportType;)V

    .line 34
    .line 35
    .line 36
    iget-wide p1, p0, Ll/ob4;->t0:J

    .line 37
    .line 38
    sget-object v4, Lcom/momo/xengine/mestatistics/ReportType;->COUNT:Lcom/momo/xengine/mestatistics/ReportType;

    .line 39
    .line 40
    const-string v5, "sdk-camera-drop_frame"

    .line 41
    .line 42
    invoke-virtual {v2, v5, p1, p2, v4}, Lcom/immomo/moment/util/datadot/RecorderDataDotUtils;->report(Ljava/lang/String;JLcom/momo/xengine/mestatistics/ReportType;)V

    .line 43
    .line 44
    .line 45
    iget p1, p0, Ll/ob4;->w0:I

    .line 46
    .line 47
    const/16 p2, 0x2d0

    .line 48
    .line 49
    if-ne p1, p2, :cond_0

    .line 50
    .line 51
    iget-wide p1, p0, Ll/ob4;->u0:J

    .line 52
    .line 53
    iget-wide v4, p0, Ll/ob4;->v0:J

    .line 54
    .line 55
    div-long/2addr p1, v4

    .line 56
    const-string v4, "sdk-camera-720p_cv_avg"

    .line 57
    .line 58
    invoke-virtual {v2, v4, p1, p2, v3}, Lcom/immomo/moment/util/datadot/RecorderDataDotUtils;->report(Ljava/lang/String;JLcom/momo/xengine/mestatistics/ReportType;)V

    .line 59
    .line 60
    .line 61
    goto :goto_0

    .line 62
    :cond_0
    const/16 p2, 0x438

    .line 63
    .line 64
    if-ne p1, p2, :cond_1

    .line 65
    .line 66
    iget-wide p1, p0, Ll/ob4;->u0:J

    .line 67
    .line 68
    iget-wide v4, p0, Ll/ob4;->v0:J

    .line 69
    .line 70
    div-long/2addr p1, v4

    .line 71
    const-string v4, "sdk-camera-1080p_cv_avg"

    .line 72
    .line 73
    invoke-virtual {v2, v4, p1, p2, v3}, Lcom/immomo/moment/util/datadot/RecorderDataDotUtils;->report(Ljava/lang/String;JLcom/momo/xengine/mestatistics/ReportType;)V

    .line 74
    .line 75
    .line 76
    :cond_1
    :goto_0
    const-string p1, "sdk-camera-start_time"

    .line 77
    .line 78
    iget-wide v4, p0, Ll/ob4;->x0:J

    .line 79
    .line 80
    invoke-virtual {v2, p1, v4, v5, v3}, Lcom/immomo/moment/util/datadot/RecorderDataDotUtils;->report(Ljava/lang/String;JLcom/momo/xengine/mestatistics/ReportType;)V

    .line 81
    .line 82
    .line 83
    iget-wide p1, p0, Ll/ob4;->y0:J

    .line 84
    .line 85
    cmp-long v4, p1, v0

    .line 86
    .line 87
    if-lez v4, :cond_2

    .line 88
    .line 89
    iget-wide v4, p0, Ll/ob4;->z0:J

    .line 90
    .line 91
    const-wide/16 v6, 0x4

    .line 92
    .line 93
    sub-long v8, v4, v6

    .line 94
    .line 95
    cmp-long p0, v8, v0

    .line 96
    .line 97
    if-lez p0, :cond_2

    .line 98
    .line 99
    sub-long/2addr v4, v6

    .line 100
    div-long/2addr p1, v4

    .line 101
    const-string p0, "sdk-camera-render_avg"

    .line 102
    .line 103
    invoke-virtual {v2, p0, p1, p2, v3}, Lcom/immomo/moment/util/datadot/RecorderDataDotUtils;->report(Ljava/lang/String;JLcom/momo/xengine/mestatistics/ReportType;)V

    .line 104
    .line 105
    .line 106
    :cond_2
    invoke-virtual {v2}, Lcom/immomo/moment/util/datadot/RecorderDataDotUtils;->flush()V

    .line 107
    .line 108
    .line 109
    :cond_3
    return-void
.end method

.method public static synthetic m(Ll/ob4;J)J
    .locals 0

    .line 1
    iput-wide p1, p0, Ll/ob4;->Y:J

    .line 2
    .line 3
    return-wide p1
.end method

.method private m1()Ll/omq0$a;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ob4;->h:Ll/sow;

    .line 2
    .line 3
    iget-boolean v0, v0, Ll/sow;->g0:Z

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    new-instance v0, Ll/omq0$a;

    .line 8
    .line 9
    invoke-direct {v0}, Ll/omq0$a;-><init>()V

    .line 10
    .line 11
    .line 12
    iget-object p0, p0, Ll/ob4;->h:Ll/sow;

    .line 13
    .line 14
    iget v1, p0, Ll/sow;->d:I

    .line 15
    .line 16
    iput v1, v0, Ll/omq0$a;->a:I

    .line 17
    .line 18
    iget v1, p0, Ll/sow;->e:I

    .line 19
    .line 20
    iput v1, v0, Ll/omq0$a;->b:I

    .line 21
    .line 22
    iget v1, p0, Ll/sow;->f:I

    .line 23
    .line 24
    iput v1, v0, Ll/omq0$a;->c:I

    .line 25
    .line 26
    iget v1, p0, Ll/sow;->g:I

    .line 27
    .line 28
    iput v1, v0, Ll/omq0$a;->d:I

    .line 29
    .line 30
    iget v1, p0, Ll/sow;->b:I

    .line 31
    .line 32
    iput v1, v0, Ll/omq0$a;->e:I

    .line 33
    .line 34
    iget p0, p0, Ll/sow;->c:I

    .line 35
    .line 36
    iput p0, v0, Ll/omq0$a;->f:I

    .line 37
    .line 38
    return-object v0

    .line 39
    :cond_0
    new-instance v0, Ll/omq0$a;

    .line 40
    .line 41
    invoke-direct {v0}, Ll/omq0$a;-><init>()V

    .line 42
    .line 43
    .line 44
    iget-object p0, p0, Ll/ob4;->h:Ll/sow;

    .line 45
    .line 46
    iget v1, p0, Ll/sow;->b:I

    .line 47
    .line 48
    iput v1, v0, Ll/omq0$a;->e:I

    .line 49
    .line 50
    iget p0, p0, Ll/sow;->c:I

    .line 51
    .line 52
    iput p0, v0, Ll/omq0$a;->f:I

    .line 53
    .line 54
    return-object v0
.end method

.method public static synthetic n(Ll/ob4;)Ll/sow;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ob4;->h:Ll/sow;

    .line 2
    .line 3
    return-object p0
.end method

.method private n1()V
    .locals 8

    .line 1
    iget-wide v0, p0, Ll/ob4;->O:J

    .line 2
    .line 3
    invoke-virtual {p0, v0, v1, v0, v1}, Ll/ob4;->l1(JJ)V

    .line 4
    .line 5
    .line 6
    iget-wide v0, p0, Ll/ob4;->p0:J

    .line 7
    .line 8
    const-wide/16 v2, 0x0

    .line 9
    .line 10
    cmp-long v0, v0, v2

    .line 11
    .line 12
    if-nez v0, :cond_0

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 16
    .line 17
    .line 18
    move-result-wide v0

    .line 19
    iget-wide v2, p0, Ll/ob4;->p0:J

    .line 20
    .line 21
    sub-long v2, v0, v2

    .line 22
    .line 23
    :goto_0
    const-wide/16 v0, 0xc8

    .line 24
    .line 25
    cmp-long v0, v2, v0

    .line 26
    .line 27
    const-wide/16 v4, 0x1

    .line 28
    .line 29
    if-lez v0, :cond_1

    .line 30
    .line 31
    iget-wide v0, p0, Ll/ob4;->t0:J

    .line 32
    .line 33
    add-long/2addr v0, v4

    .line 34
    iput-wide v0, p0, Ll/ob4;->t0:J

    .line 35
    .line 36
    :cond_1
    iget-wide v0, p0, Ll/ob4;->z0:J

    .line 37
    .line 38
    const-wide/16 v6, 0x3

    .line 39
    .line 40
    cmp-long v6, v0, v6

    .line 41
    .line 42
    if-lez v6, :cond_2

    .line 43
    .line 44
    iget-wide v6, p0, Ll/ob4;->y0:J

    .line 45
    .line 46
    add-long/2addr v6, v2

    .line 47
    iput-wide v6, p0, Ll/ob4;->y0:J

    .line 48
    .line 49
    :cond_2
    add-long/2addr v0, v4

    .line 50
    iput-wide v0, p0, Ll/ob4;->z0:J

    .line 51
    .line 52
    iget-object v0, p0, Ll/ob4;->g:Ll/v5c;

    .line 53
    .line 54
    if-eqz v0, :cond_4

    .line 55
    .line 56
    iget-boolean v0, p0, Ll/ob4;->J:Z

    .line 57
    .line 58
    if-nez v0, :cond_3

    .line 59
    .line 60
    const/4 v0, 0x1

    .line 61
    iput-boolean v0, p0, Ll/ob4;->J:Z

    .line 62
    .line 63
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 64
    .line 65
    .line 66
    move-result-wide v0

    .line 67
    iget-wide v2, p0, Ll/ob4;->s0:J

    .line 68
    .line 69
    sub-long/2addr v0, v2

    .line 70
    iput-wide v0, p0, Ll/ob4;->x0:J

    .line 71
    .line 72
    iget-object v0, p0, Ll/ob4;->y:Ll/epw;

    .line 73
    .line 74
    if-eqz v0, :cond_3

    .line 75
    .line 76
    invoke-interface {v0}, Ll/epw;->onFirstFrameRendered()V

    .line 77
    .line 78
    .line 79
    :cond_3
    iget-object v0, p0, Ll/ob4;->z:Ll/xow;

    .line 80
    .line 81
    if-eqz v0, :cond_4

    .line 82
    .line 83
    invoke-interface {v0}, Ll/xow;->a()V

    .line 84
    .line 85
    .line 86
    const/4 v0, 0x0

    .line 87
    iput-object v0, p0, Ll/ob4;->z:Ll/xow;

    .line 88
    .line 89
    :cond_4
    return-void
.end method

.method public static synthetic o(Ll/ob4;[B)Lcom/immomo/components/interfaces/IProcessOutput;
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ob4;->C1([B)Lcom/immomo/components/interfaces/IProcessOutput;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method private o1(II)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ob4;->v:Ll/bpw;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1, p2}, Ll/bpw;->onError(II)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public static synthetic p(Ll/ob4;[BLcom/immomo/components/interfaces/IProcessOutput;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Ll/ob4;->S1([BLcom/immomo/components/interfaces/IProcessOutput;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private p1()V
    .locals 2

    .line 1
    const-string v0, "media"

    .line 2
    .line 3
    const-string v1, "The CameraPreviewManager release !!!"

    .line 4
    .line 5
    invoke-static {v0, v1}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-boolean v0, p0, Ll/ob4;->m:Z

    .line 9
    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    invoke-virtual {p0}, Ll/ob4;->O1()V

    .line 13
    .line 14
    .line 15
    :cond_0
    iget-boolean v0, p0, Ll/ob4;->n:Z

    .line 16
    .line 17
    if-eqz v0, :cond_1

    .line 18
    .line 19
    const/4 v0, 0x1

    .line 20
    invoke-direct {p0, v0}, Ll/ob4;->P1(Z)Lcom/immomo/moment/model/VideoFragment;

    .line 21
    .line 22
    .line 23
    :cond_1
    invoke-direct {p0}, Ll/ob4;->i1()V

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, Ll/ob4;->u:Ll/pc1;

    .line 27
    .line 28
    const/4 v1, 0x0

    .line 29
    if-eqz v0, :cond_2

    .line 30
    .line 31
    invoke-virtual {v0}, Ll/pc1;->m()V

    .line 32
    .line 33
    .line 34
    iget-object v0, p0, Ll/ob4;->u:Ll/pc1;

    .line 35
    .line 36
    invoke-virtual {v0}, Ll/pc1;->i()V

    .line 37
    .line 38
    .line 39
    iput-object v1, p0, Ll/ob4;->u:Ll/pc1;

    .line 40
    .line 41
    :cond_2
    iget-object v0, p0, Ll/ob4;->y:Ll/epw;

    .line 42
    .line 43
    if-eqz v0, :cond_3

    .line 44
    .line 45
    iput-object v1, p0, Ll/ob4;->y:Ll/epw;

    .line 46
    .line 47
    :cond_3
    iget-object v0, p0, Ll/ob4;->z:Ll/xow;

    .line 48
    .line 49
    if-eqz v0, :cond_4

    .line 50
    .line 51
    iput-object v1, p0, Ll/ob4;->z:Ll/xow;

    .line 52
    .line 53
    :cond_4
    iget-object v0, p0, Ll/ob4;->D0:Ll/rpr;

    .line 54
    .line 55
    if-eqz v0, :cond_5

    .line 56
    .line 57
    iput-object v1, p0, Ll/ob4;->D0:Ll/rpr;

    .line 58
    .line 59
    :cond_5
    iget-object v0, p0, Ll/ob4;->E0:Ll/spr;

    .line 60
    .line 61
    if-eqz v0, :cond_6

    .line 62
    .line 63
    iput-object v1, p0, Ll/ob4;->E0:Ll/spr;

    .line 64
    .line 65
    :cond_6
    iget-object v0, p0, Ll/ob4;->F0:Ll/ppr;

    .line 66
    .line 67
    if-eqz v0, :cond_7

    .line 68
    .line 69
    iput-object v1, p0, Ll/ob4;->F0:Ll/ppr;

    .line 70
    .line 71
    :cond_7
    iget-object v0, p0, Ll/ob4;->C0:Ll/upr;

    .line 72
    .line 73
    if-eqz v0, :cond_8

    .line 74
    .line 75
    iput-object v1, p0, Ll/ob4;->C0:Ll/upr;

    .line 76
    .line 77
    :cond_8
    iget-object v0, p0, Ll/ob4;->g:Ll/v5c;

    .line 78
    .line 79
    if-eqz v0, :cond_9

    .line 80
    .line 81
    iput-object v1, p0, Ll/ob4;->g:Ll/v5c;

    .line 82
    .line 83
    :cond_9
    iget-object v0, p0, Ll/ob4;->f0:Ll/c3i0;

    .line 84
    .line 85
    invoke-virtual {v0}, Ll/c3i0;->b()V

    .line 86
    .line 87
    .line 88
    const/4 v0, 0x0

    .line 89
    iput-boolean v0, p0, Ll/ob4;->m:Z

    .line 90
    .line 91
    iput-object v1, p0, Ll/ob4;->d0:Ll/qow;

    .line 92
    .line 93
    iput v0, p0, Ll/ob4;->c0:I

    .line 94
    .line 95
    return-void
.end method

.method public static synthetic q(Ll/ob4;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/ob4;->G:Z

    .line 2
    .line 3
    return p0
.end method

.method private q1(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ob4;->f0:Ll/c3i0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/c3i0;->d()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic r(Ll/ob4;Lcom/immomo/components/interfaces/IProcessOutput;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ob4;->d1(Lcom/immomo/components/interfaces/IProcessOutput;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private r1(Ljava/lang/Object;)V
    .locals 6

    .line 1
    const-string v0, "The camera startPreview failed !!!"

    .line 2
    .line 3
    const-string v1, "media"

    .line 4
    .line 5
    iget-object v2, p0, Ll/ob4;->g:Ll/v5c;

    .line 6
    .line 7
    if-eqz v2, :cond_5

    .line 8
    .line 9
    if-eqz p1, :cond_5

    .line 10
    .line 11
    iget-boolean v2, p0, Ll/ob4;->m:Z

    .line 12
    .line 13
    if-nez v2, :cond_5

    .line 14
    .line 15
    iget-object v2, p0, Ll/ob4;->I:Ll/ia4;

    .line 16
    .line 17
    if-eqz v2, :cond_5

    .line 18
    .line 19
    iget-boolean v2, p0, Ll/ob4;->m:Z

    .line 20
    .line 21
    if-eqz v2, :cond_0

    .line 22
    .line 23
    goto/16 :goto_1

    .line 24
    .line 25
    :cond_0
    iput-object p1, p0, Ll/ob4;->R:Ljava/lang/Object;

    .line 26
    .line 27
    invoke-virtual {p0}, Ll/ob4;->R1()Ll/crf0;

    .line 28
    .line 29
    .line 30
    iget-object v2, p0, Ll/ob4;->g:Ll/v5c;

    .line 31
    .line 32
    iget-object v3, p0, Ll/ob4;->h:Ll/sow;

    .line 33
    .line 34
    iget-boolean v3, v3, Ll/sow;->g0:Z

    .line 35
    .line 36
    invoke-virtual {v2, p1, v3}, Ll/v5c;->N0(Ljava/lang/Object;Z)V

    .line 37
    .line 38
    .line 39
    iget-object v2, p0, Ll/ob4;->g:Ll/v5c;

    .line 40
    .line 41
    new-instance v3, Ll/crf0;

    .line 42
    .line 43
    iget-object v4, p0, Ll/ob4;->h:Ll/sow;

    .line 44
    .line 45
    iget v5, v4, Ll/sow;->o:I

    .line 46
    .line 47
    iget v4, v4, Ll/sow;->p:I

    .line 48
    .line 49
    invoke-direct {v3, v5, v4}, Ll/crf0;-><init>(II)V

    .line 50
    .line 51
    .line 52
    invoke-virtual {v2, p1, v3}, Ll/eli0;->y0(Ljava/lang/Object;Ll/crf0;)V

    .line 53
    .line 54
    .line 55
    iget-object p1, p0, Ll/ob4;->g:Ll/v5c;

    .line 56
    .line 57
    invoke-virtual {p1}, Ll/qt2;->N()V

    .line 58
    .line 59
    .line 60
    iget-object p1, p0, Ll/ob4;->g:Ll/v5c;

    .line 61
    .line 62
    new-instance v2, Ll/crf0;

    .line 63
    .line 64
    iget-object v3, p0, Ll/ob4;->h:Ll/sow;

    .line 65
    .line 66
    invoke-virtual {v3}, Ll/sow;->d()I

    .line 67
    .line 68
    .line 69
    move-result v3

    .line 70
    iget-object v4, p0, Ll/ob4;->h:Ll/sow;

    .line 71
    .line 72
    invoke-virtual {v4}, Ll/sow;->c()I

    .line 73
    .line 74
    .line 75
    move-result v4

    .line 76
    invoke-direct {v2, v3, v4}, Ll/crf0;-><init>(II)V

    .line 77
    .line 78
    .line 79
    invoke-virtual {p1, v2}, Ll/qt2;->R(Ljava/lang/Object;)V

    .line 80
    .line 81
    .line 82
    iget-object p1, p0, Ll/ob4;->g:Ll/v5c;

    .line 83
    .line 84
    invoke-direct {p0}, Ll/ob4;->m1()Ll/omq0$a;

    .line 85
    .line 86
    .line 87
    move-result-object v2

    .line 88
    invoke-virtual {p1, v2}, Ll/qt2;->C(Ljava/lang/Object;)V

    .line 89
    .line 90
    .line 91
    invoke-direct {p0}, Ll/ob4;->F1()V

    .line 92
    .line 93
    .line 94
    iget-object p1, p0, Ll/ob4;->I:Ll/ia4;

    .line 95
    .line 96
    invoke-virtual {p1}, Ll/ia4;->d()Ll/ypl;

    .line 97
    .line 98
    .line 99
    move-result-object p1

    .line 100
    if-eqz p1, :cond_1

    .line 101
    .line 102
    iget-object v2, p0, Ll/ob4;->g:Ll/v5c;

    .line 103
    .line 104
    invoke-interface {p1}, Ll/ypl;->m()I

    .line 105
    .line 106
    .line 107
    move-result v3

    .line 108
    invoke-virtual {v2, v3}, Ll/klc0;->x0(I)V

    .line 109
    .line 110
    .line 111
    iget-object v2, p0, Ll/ob4;->g:Ll/v5c;

    .line 112
    .line 113
    invoke-interface {p1}, Ll/ypl;->i()Z

    .line 114
    .line 115
    .line 116
    move-result p1

    .line 117
    invoke-virtual {v2, p1}, Ll/klc0;->J0(Z)V

    .line 118
    .line 119
    .line 120
    :cond_1
    iget-object p1, p0, Ll/ob4;->Q:Ll/kt2;

    .line 121
    .line 122
    if-eqz p1, :cond_2

    .line 123
    .line 124
    iget-object v2, p0, Ll/ob4;->g:Ll/v5c;

    .line 125
    .line 126
    invoke-virtual {v2, p1}, Ll/qt2;->S(Ljava/lang/Object;)V

    .line 127
    .line 128
    .line 129
    :cond_2
    iget-object p1, p0, Ll/ob4;->h:Ll/sow;

    .line 130
    .line 131
    invoke-virtual {p1}, Ll/sow;->b()I

    .line 132
    .line 133
    .line 134
    move-result p1

    .line 135
    iput p1, p0, Ll/ob4;->r:I

    .line 136
    .line 137
    const/4 p1, 0x0

    .line 138
    :try_start_0
    iget-object v2, p0, Ll/ob4;->I:Ll/ia4;

    .line 139
    .line 140
    invoke-virtual {v2}, Ll/ia4;->d()Ll/ypl;

    .line 141
    .line 142
    .line 143
    move-result-object v2

    .line 144
    iget-object v3, p0, Ll/ob4;->o:Landroid/graphics/SurfaceTexture;

    .line 145
    .line 146
    iget-object v4, p0, Ll/ob4;->p:Ll/uje;

    .line 147
    .line 148
    invoke-interface {v2, v3, v4}, Ll/ypl;->o(Landroid/graphics/SurfaceTexture;Ll/uje;)Z

    .line 149
    .line 150
    .line 151
    move-result v2
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 152
    goto :goto_0

    .line 153
    :catch_0
    move-exception v2

    .line 154
    new-instance v3, Ljava/lang/StringBuilder;

    .line 155
    .line 156
    invoke-direct {v3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 157
    .line 158
    .line 159
    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 160
    .line 161
    .line 162
    move-result-object v2

    .line 163
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 164
    .line 165
    .line 166
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 167
    .line 168
    .line 169
    move-result-object v2

    .line 170
    invoke-static {v1, v2}, Lcom/cosmos/mdlog/MDLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 171
    .line 172
    .line 173
    move v2, p1

    .line 174
    :goto_0
    if-nez v2, :cond_3

    .line 175
    .line 176
    const/16 v2, -0x12f

    .line 177
    .line 178
    invoke-direct {p0, v2, p1}, Ll/ob4;->o1(II)V

    .line 179
    .line 180
    .line 181
    invoke-static {v1, v0}, Lcom/cosmos/mdlog/MDLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 182
    .line 183
    .line 184
    return-void

    .line 185
    :cond_3
    iget-object p1, p0, Ll/ob4;->d0:Ll/qow;

    .line 186
    .line 187
    invoke-virtual {p1}, Ll/qow;->i()Z

    .line 188
    .line 189
    .line 190
    move-result p1

    .line 191
    if-nez p1, :cond_4

    .line 192
    .line 193
    invoke-direct {p0}, Ll/ob4;->y1()V

    .line 194
    .line 195
    .line 196
    :cond_4
    invoke-static {}, Lcom/immomo/moment/util/datadot/RecorderDataDotUtils;->getInstance()Lcom/immomo/moment/util/datadot/RecorderDataDotUtils;

    .line 197
    .line 198
    .line 199
    move-result-object p1

    .line 200
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 201
    .line 202
    .line 203
    move-result-wide v0

    .line 204
    sget-object v2, Lcom/momo/xengine/mestatistics/ReportType;->COUNT:Lcom/momo/xengine/mestatistics/ReportType;

    .line 205
    .line 206
    const-string v3, "sdk-camera-use-time"

    .line 207
    .line 208
    invoke-virtual {p1, v3, v0, v1, v2}, Lcom/immomo/moment/util/datadot/RecorderDataDotUtils;->realTimeReport(Ljava/lang/String;JLcom/momo/xengine/mestatistics/ReportType;)V

    .line 209
    .line 210
    .line 211
    const/4 p1, 0x1

    .line 212
    iput-boolean p1, p0, Ll/ob4;->m:Z

    .line 213
    .line 214
    :cond_5
    :goto_1
    return-void
.end method

.method public static synthetic s(Ll/ob4;)Z
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/ob4;->D1()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method private s1()V
    .locals 1

    .line 1
    new-instance v0, Ll/ob4$g;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/ob4$g;-><init>(Ll/ob4;)V

    .line 4
    .line 5
    .line 6
    const/4 p0, 0x2

    .line 7
    invoke-static {p0, v0}, Ll/lyi0;->d(ILjava/lang/Runnable;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public static synthetic t(Ll/ob4;)J
    .locals 2

    .line 1
    iget-wide v0, p0, Ll/ob4;->N:J

    .line 2
    .line 3
    return-wide v0
.end method

.method private t1()V
    .locals 2

    .line 1
    const-string v0, "media"

    .line 2
    .line 3
    const-string v1, "The CameraPreviewManager stopPreview !!!"

    .line 4
    .line 5
    invoke-static {v0, v1}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-boolean v0, p0, Ll/ob4;->m:Z

    .line 9
    .line 10
    if-nez v0, :cond_0

    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    iget-object v0, p0, Ll/ob4;->I:Ll/ia4;

    .line 14
    .line 15
    if-eqz v0, :cond_1

    .line 16
    .line 17
    invoke-virtual {v0}, Ll/ia4;->r()V

    .line 18
    .line 19
    .line 20
    :cond_1
    iget-object v0, p0, Ll/ob4;->u:Ll/pc1;

    .line 21
    .line 22
    if-eqz v0, :cond_2

    .line 23
    .line 24
    invoke-virtual {v0}, Ll/pc1;->m()V

    .line 25
    .line 26
    .line 27
    iget-object v0, p0, Ll/ob4;->u:Ll/pc1;

    .line 28
    .line 29
    invoke-virtual {v0}, Ll/pc1;->i()V

    .line 30
    .line 31
    .line 32
    const/4 v0, 0x0

    .line 33
    iput-object v0, p0, Ll/ob4;->u:Ll/pc1;

    .line 34
    .line 35
    :cond_2
    const-wide/16 v0, 0x0

    .line 36
    .line 37
    iput-wide v0, p0, Ll/ob4;->t0:J

    .line 38
    .line 39
    iput-wide v0, p0, Ll/ob4;->v0:J

    .line 40
    .line 41
    iput-wide v0, p0, Ll/ob4;->y0:J

    .line 42
    .line 43
    iput-wide v0, p0, Ll/ob4;->z0:J

    .line 44
    .line 45
    const/4 v0, 0x0

    .line 46
    iput v0, p0, Ll/ob4;->W:I

    .line 47
    .line 48
    iput-boolean v0, p0, Ll/ob4;->m:Z

    .line 49
    .line 50
    iput-boolean v0, p0, Ll/ob4;->J:Z

    .line 51
    .line 52
    return-void
.end method

.method public static synthetic u(Ll/ob4;J)J
    .locals 0

    .line 1
    iput-wide p1, p0, Ll/ob4;->N:J

    .line 2
    .line 3
    return-wide p1
.end method

.method private u1()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ob4;->u:Ll/pc1;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    invoke-virtual {v0, v1}, Ll/pc1;->k(Ll/pc1$b;)V

    .line 7
    .line 8
    .line 9
    :cond_0
    iget-object v0, p0, Ll/ob4;->x:Ll/ed1;

    .line 10
    .line 11
    if-eqz v0, :cond_1

    .line 12
    .line 13
    invoke-virtual {v0}, Ll/ed1;->f()V

    .line 14
    .line 15
    .line 16
    iput-object v1, p0, Ll/ob4;->x:Ll/ed1;

    .line 17
    .line 18
    :cond_1
    const-string v0, "CameraPreviewManager"

    .line 19
    .line 20
    const-string v1, "codec stop"

    .line 21
    .line 22
    invoke-static {v0, v1}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    invoke-direct {p0}, Ll/ob4;->e1()V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public static synthetic v(Ll/ob4;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/ob4;->o0:Z

    .line 2
    .line 3
    return p0
.end method

.method private v1(Ll/crf0;Ll/xow;)V
    .locals 10

    .line 1
    iget-object v0, p0, Ll/ob4;->I:Ll/ia4;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const/16 v2, -0x12f

    .line 5
    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    invoke-direct {p0, v2, v1}, Ll/ob4;->o1(II)V

    .line 9
    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    invoke-virtual {p1}, Ll/crf0;->b()I

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    invoke-virtual {p1}, Ll/crf0;->a()I

    .line 17
    .line 18
    .line 19
    move-result v3

    .line 20
    new-instance v4, Ljava/lang/StringBuilder;

    .line 21
    .line 22
    const-string v5, "targetWidth = "

    .line 23
    .line 24
    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    const-string v5, " targetHeight = "

    .line 31
    .line 32
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object v4

    .line 42
    const-string v5, "media"

    .line 43
    .line 44
    invoke-static {v5, v4}, Lcom/cosmos/mdlog/MDLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 45
    .line 46
    .line 47
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 48
    .line 49
    .line 50
    move-result-wide v6

    .line 51
    iget-object v4, p0, Ll/ob4;->h:Ll/sow;

    .line 52
    .line 53
    iput v0, v4, Ll/sow;->b:I

    .line 54
    .line 55
    iput v3, v4, Ll/sow;->c:I

    .line 56
    .line 57
    iget-object v0, p0, Ll/ob4;->d0:Ll/qow;

    .line 58
    .line 59
    invoke-virtual {v0, p1}, Ll/qow;->R(Ll/crf0;)V

    .line 60
    .line 61
    .line 62
    iget-object p1, p0, Ll/ob4;->I:Ll/ia4;

    .line 63
    .line 64
    iget v0, p0, Ll/ob4;->c0:I

    .line 65
    .line 66
    iget-object v3, p0, Ll/ob4;->d0:Ll/qow;

    .line 67
    .line 68
    invoke-virtual {p1, v0, v3}, Ll/ia4;->j(ILl/qow;)Z

    .line 69
    .line 70
    .line 71
    new-instance p1, Ljava/lang/StringBuilder;

    .line 72
    .line 73
    const-string v0, "Reset camera cost time "

    .line 74
    .line 75
    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 76
    .line 77
    .line 78
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 79
    .line 80
    .line 81
    move-result-wide v3

    .line 82
    sub-long/2addr v3, v6

    .line 83
    invoke-virtual {p1, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 84
    .line 85
    .line 86
    const-string v0, " ms"

    .line 87
    .line 88
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 89
    .line 90
    .line 91
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 92
    .line 93
    .line 94
    move-result-object p1

    .line 95
    invoke-static {v5, p1}, Lcom/cosmos/mdlog/MDLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 96
    .line 97
    .line 98
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 99
    .line 100
    .line 101
    move-result-wide v3

    .line 102
    iget-object p1, p0, Ll/ob4;->h:Ll/sow;

    .line 103
    .line 104
    iget v6, p1, Ll/sow;->b:I

    .line 105
    .line 106
    iput v6, p0, Ll/ob4;->m0:I

    .line 107
    .line 108
    iget p1, p1, Ll/sow;->c:I

    .line 109
    .line 110
    iput p1, p0, Ll/ob4;->n0:I

    .line 111
    .line 112
    invoke-virtual {p0}, Ll/ob4;->R1()Ll/crf0;

    .line 113
    .line 114
    .line 115
    iget-object p1, p0, Ll/ob4;->g:Ll/v5c;

    .line 116
    .line 117
    iget-object v6, p0, Ll/ob4;->R:Ljava/lang/Object;

    .line 118
    .line 119
    new-instance v7, Ll/crf0;

    .line 120
    .line 121
    iget-object v8, p0, Ll/ob4;->h:Ll/sow;

    .line 122
    .line 123
    iget v9, v8, Ll/sow;->o:I

    .line 124
    .line 125
    iget v8, v8, Ll/sow;->p:I

    .line 126
    .line 127
    invoke-direct {v7, v9, v8}, Ll/crf0;-><init>(II)V

    .line 128
    .line 129
    .line 130
    invoke-virtual {p1, v6, v7}, Ll/eli0;->y0(Ljava/lang/Object;Ll/crf0;)V

    .line 131
    .line 132
    .line 133
    iget-object p1, p0, Ll/ob4;->g:Ll/v5c;

    .line 134
    .line 135
    new-instance v6, Ll/crf0;

    .line 136
    .line 137
    iget-object v7, p0, Ll/ob4;->h:Ll/sow;

    .line 138
    .line 139
    invoke-virtual {v7}, Ll/sow;->d()I

    .line 140
    .line 141
    .line 142
    move-result v7

    .line 143
    iget-object v8, p0, Ll/ob4;->h:Ll/sow;

    .line 144
    .line 145
    invoke-virtual {v8}, Ll/sow;->c()I

    .line 146
    .line 147
    .line 148
    move-result v8

    .line 149
    invoke-direct {v6, v7, v8}, Ll/crf0;-><init>(II)V

    .line 150
    .line 151
    .line 152
    invoke-virtual {p1, v6}, Ll/qt2;->R(Ljava/lang/Object;)V

    .line 153
    .line 154
    .line 155
    iget-object p1, p0, Ll/ob4;->g:Ll/v5c;

    .line 156
    .line 157
    invoke-direct {p0}, Ll/ob4;->m1()Ll/omq0$a;

    .line 158
    .line 159
    .line 160
    move-result-object v6

    .line 161
    invoke-virtual {p1, v6}, Ll/qt2;->C(Ljava/lang/Object;)V

    .line 162
    .line 163
    .line 164
    iget-object p1, p0, Ll/ob4;->I:Ll/ia4;

    .line 165
    .line 166
    invoke-virtual {p1}, Ll/ia4;->d()Ll/ypl;

    .line 167
    .line 168
    .line 169
    move-result-object p1

    .line 170
    if-eqz p1, :cond_1

    .line 171
    .line 172
    iget-object v6, p0, Ll/ob4;->g:Ll/v5c;

    .line 173
    .line 174
    invoke-interface {p1}, Ll/ypl;->m()I

    .line 175
    .line 176
    .line 177
    move-result v7

    .line 178
    invoke-virtual {v6, v7}, Ll/klc0;->x0(I)V

    .line 179
    .line 180
    .line 181
    iget-object v6, p0, Ll/ob4;->g:Ll/v5c;

    .line 182
    .line 183
    invoke-interface {p1}, Ll/ypl;->i()Z

    .line 184
    .line 185
    .line 186
    move-result p1

    .line 187
    invoke-virtual {v6, p1}, Ll/klc0;->J0(Z)V

    .line 188
    .line 189
    .line 190
    :cond_1
    iget-object p1, p0, Ll/ob4;->h:Ll/sow;

    .line 191
    .line 192
    invoke-virtual {p1}, Ll/sow;->b()I

    .line 193
    .line 194
    .line 195
    move-result p1

    .line 196
    iput p1, p0, Ll/ob4;->r:I

    .line 197
    .line 198
    iget-object p1, p0, Ll/ob4;->I:Ll/ia4;

    .line 199
    .line 200
    iget-object v6, p0, Ll/ob4;->o:Landroid/graphics/SurfaceTexture;

    .line 201
    .line 202
    invoke-virtual {p1, v6}, Ll/ia4;->q(Landroid/graphics/SurfaceTexture;)Z

    .line 203
    .line 204
    .line 205
    move-result p1

    .line 206
    if-nez p1, :cond_2

    .line 207
    .line 208
    invoke-direct {p0, v2, v1}, Ll/ob4;->o1(II)V

    .line 209
    .line 210
    .line 211
    return-void

    .line 212
    :cond_2
    new-instance p1, Ljava/lang/StringBuilder;

    .line 213
    .line 214
    const-string v1, "StartPreview  camera cost "

    .line 215
    .line 216
    invoke-direct {p1, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 217
    .line 218
    .line 219
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 220
    .line 221
    .line 222
    move-result-wide v1

    .line 223
    sub-long/2addr v1, v3

    .line 224
    invoke-virtual {p1, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 225
    .line 226
    .line 227
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 228
    .line 229
    .line 230
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 231
    .line 232
    .line 233
    move-result-object p1

    .line 234
    invoke-static {v5, p1}, Lcom/cosmos/mdlog/MDLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 235
    .line 236
    .line 237
    iget-object p1, p0, Ll/ob4;->g:Ll/v5c;

    .line 238
    .line 239
    if-eqz p1, :cond_3

    .line 240
    .line 241
    iget-object p1, p0, Ll/ob4;->j0:Ljava/util/LinkedList;

    .line 242
    .line 243
    invoke-virtual {p1}, Ljava/util/LinkedList;->clear()V

    .line 244
    .line 245
    .line 246
    :cond_3
    iput-object p2, p0, Ll/ob4;->z:Ll/xow;

    .line 247
    .line 248
    return-void
.end method

.method public static synthetic w(Ll/ob4;)J
    .locals 2

    .line 1
    iget-wide v0, p0, Ll/ob4;->p0:J

    .line 2
    .line 3
    return-wide v0
.end method

.method private w1(Landroid/os/Message;)V
    .locals 1

    .line 1
    iget p1, p1, Landroid/os/Message;->arg1:I

    .line 2
    .line 3
    if-eqz p1, :cond_1

    .line 4
    .line 5
    const/4 v0, 0x2

    .line 6
    if-eq p1, v0, :cond_0

    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    invoke-direct {p0}, Ll/ob4;->K1()V

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :cond_1
    invoke-direct {p0}, Ll/ob4;->L1()V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public static synthetic x0(Ll/ob4;J)J
    .locals 0

    .line 1
    iput-wide p1, p0, Ll/ob4;->p0:J

    .line 2
    .line 3
    return-wide p1
.end method

.method private x1(Ll/sow;)V
    .locals 4

    .line 1
    const-string v0, "nv21RenThr"

    .line 2
    .line 3
    iget-object v1, p0, Ll/ob4;->f:Landroid/opengl/EGLContext;

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/v5c;->P0(Ljava/lang/String;Landroid/opengl/EGLContext;)Ll/v5c;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Ll/ob4;->g:Ll/v5c;

    .line 10
    .line 11
    new-instance v1, Ll/ob4$n;

    .line 12
    .line 13
    invoke-direct {v1, p0}, Ll/ob4$n;-><init>(Ll/ob4;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, v1}, Ll/v5c;->j1(Ll/zow;)V

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Ll/ob4;->g:Ll/v5c;

    .line 20
    .line 21
    iget v1, p1, Ll/sow;->c0:I

    .line 22
    .line 23
    const/4 v2, 0x0

    .line 24
    const/4 v3, 0x1

    .line 25
    if-ne v1, v3, :cond_0

    .line 26
    .line 27
    move v1, v3

    .line 28
    goto :goto_0

    .line 29
    :cond_0
    move v1, v2

    .line 30
    :goto_0
    invoke-virtual {v0, v1}, Ll/v5c;->n1(Z)V

    .line 31
    .line 32
    .line 33
    new-instance v0, Ljava/lang/StringBuilder;

    .line 34
    .line 35
    const-string v1, "Is FixedFrameRate? "

    .line 36
    .line 37
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    iget v1, p1, Ll/sow;->c0:I

    .line 41
    .line 42
    if-ne v1, v3, :cond_1

    .line 43
    .line 44
    goto :goto_1

    .line 45
    :cond_1
    move v3, v2

    .line 46
    :goto_1
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 47
    .line 48
    .line 49
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    const-string v1, "CameraPreviewManager"

    .line 54
    .line 55
    invoke-static {v1, v0}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 56
    .line 57
    .line 58
    iget-boolean v0, p1, Ll/sow;->f0:Z

    .line 59
    .line 60
    iput-boolean v0, p0, Ll/ob4;->k0:Z

    .line 61
    .line 62
    new-instance v0, Ljava/lang/StringBuilder;

    .line 63
    .line 64
    const-string v3, "CodecStopAsync: "

    .line 65
    .line 66
    invoke-direct {v0, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 67
    .line 68
    .line 69
    iget-boolean v3, p1, Ll/sow;->f0:Z

    .line 70
    .line 71
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 72
    .line 73
    .line 74
    const-string v3, " isFaceSegment:"

    .line 75
    .line 76
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 77
    .line 78
    .line 79
    iget-boolean v3, p1, Ll/sow;->d0:Z

    .line 80
    .line 81
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 82
    .line 83
    .line 84
    const-string v3, " isGetBeautyScore:"

    .line 85
    .line 86
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 87
    .line 88
    .line 89
    iget-boolean v3, p1, Ll/sow;->e0:Z

    .line 90
    .line 91
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 92
    .line 93
    .line 94
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 95
    .line 96
    .line 97
    move-result-object v0

    .line 98
    invoke-static {v1, v0}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 99
    .line 100
    .line 101
    iget-object v0, p0, Ll/ob4;->g:Ll/v5c;

    .line 102
    .line 103
    iget-object v1, p0, Ll/ob4;->E0:Ll/spr;

    .line 104
    .line 105
    invoke-virtual {v0, v1}, Ll/qt2;->V(Ll/spr;)V

    .line 106
    .line 107
    .line 108
    iget-object v0, p0, Ll/ob4;->g:Ll/v5c;

    .line 109
    .line 110
    iget-object v1, p0, Ll/ob4;->D0:Ll/rpr;

    .line 111
    .line 112
    invoke-virtual {v0, v1}, Ll/eli0;->u0(Ll/rpr;)V

    .line 113
    .line 114
    .line 115
    iget-object v0, p0, Ll/ob4;->g:Ll/v5c;

    .line 116
    .line 117
    iget-object v1, p0, Ll/ob4;->C0:Ll/upr;

    .line 118
    .line 119
    invoke-virtual {v0, v1}, Ll/v5c;->o1(Ll/upr;)V

    .line 120
    .line 121
    .line 122
    iget-object v0, p0, Ll/ob4;->g:Ll/v5c;

    .line 123
    .line 124
    iget-object v1, p0, Ll/ob4;->F0:Ll/ppr;

    .line 125
    .line 126
    invoke-virtual {v0, v1}, Ll/v5c;->i1(Ll/ppr;)V

    .line 127
    .line 128
    .line 129
    iget-object v0, p0, Ll/ob4;->g:Ll/v5c;

    .line 130
    .line 131
    iget-object v1, p0, Ll/ob4;->e0:Ll/qpw;

    .line 132
    .line 133
    invoke-virtual {v0, v1}, Ll/v5c;->l1(Ll/qpw;)V

    .line 134
    .line 135
    .line 136
    iget-object v0, p0, Ll/ob4;->g:Ll/v5c;

    .line 137
    .line 138
    iget-object v1, p0, Ll/ob4;->A0:Ll/ppw;

    .line 139
    .line 140
    invoke-virtual {v0, v1}, Ll/v5c;->m1(Ll/ppw;)V

    .line 141
    .line 142
    .line 143
    iget-object v0, p0, Ll/ob4;->g:Ll/v5c;

    .line 144
    .line 145
    iget-object v1, p0, Ll/ob4;->B0:Ll/tpr;

    .line 146
    .line 147
    invoke-virtual {v0, v1}, Ll/eli0;->z0(Ll/tpr;)V

    .line 148
    .line 149
    .line 150
    iput-object p1, p0, Ll/ob4;->h:Ll/sow;

    .line 151
    .line 152
    new-instance v0, Ll/ia4;

    .line 153
    .line 154
    invoke-direct {v0, p1}, Ll/ia4;-><init>(Ll/sow;)V

    .line 155
    .line 156
    .line 157
    iput-object v0, p0, Ll/ob4;->I:Ll/ia4;

    .line 158
    .line 159
    invoke-static {}, Ll/lrw;->j()Ll/lrw;

    .line 160
    .line 161
    .line 162
    move-result-object p1

    .line 163
    invoke-virtual {p1}, Ll/lrw;->e()Ll/p3m;

    .line 164
    .line 165
    .line 166
    new-instance p1, Ll/cvf;

    .line 167
    .line 168
    iget-object v0, p0, Ll/ob4;->I:Ll/ia4;

    .line 169
    .line 170
    invoke-direct {p1, v0}, Ll/cvf;-><init>(Ll/ypl$b;)V

    .line 171
    .line 172
    .line 173
    iput-object p1, p0, Ll/ob4;->i0:Ll/cvf;

    .line 174
    .line 175
    iput-boolean v2, p0, Ll/ob4;->n:Z

    .line 176
    .line 177
    iput-boolean v2, p0, Ll/ob4;->m:Z

    .line 178
    .line 179
    return-void
.end method

.method public static synthetic y0(Ll/ob4;J)J
    .locals 0

    .line 1
    iput-wide p1, p0, Ll/ob4;->q0:J

    .line 2
    .line 3
    return-wide p1
.end method

.method private y1()V
    .locals 5

    .line 1
    iget-object v0, p0, Ll/ob4;->h:Ll/sow;

    .line 2
    .line 3
    iget v1, v0, Ll/sow;->C:I

    .line 4
    .line 5
    iget v2, v0, Ll/sow;->E:I

    .line 6
    .line 7
    iget v0, v0, Ll/sow;->D:I

    .line 8
    .line 9
    new-instance v3, Ll/pc1;

    .line 10
    .line 11
    invoke-direct {v3}, Ll/pc1;-><init>()V

    .line 12
    .line 13
    .line 14
    iput-object v3, p0, Ll/ob4;->u:Ll/pc1;

    .line 15
    .line 16
    const/16 v4, 0x10

    .line 17
    .line 18
    invoke-virtual {v3, v1, v4, v2, v0}, Ll/pc1;->h(IIII)Z

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Ll/ob4;->u:Ll/pc1;

    .line 22
    .line 23
    if-eqz v0, :cond_0

    .line 24
    .line 25
    new-instance v1, Ll/ob4$f;

    .line 26
    .line 27
    invoke-direct {v1, p0}, Ll/ob4$f;-><init>(Ll/ob4;)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {v0, v1}, Ll/pc1;->j(Ll/spw;)V

    .line 31
    .line 32
    .line 33
    :cond_0
    return-void
.end method

.method public static synthetic z0(Ll/ob4;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/ob4;->n1()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private z1(ILl/qow;)Z
    .locals 3

    .line 1
    const-string v0, "CameraPreviewManager prepare!!!"

    .line 2
    .line 3
    const-string v1, "media"

    .line 4
    .line 5
    invoke-static {v1, v0}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ll/ob4;->g:Ll/v5c;

    .line 9
    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    new-instance v2, Ll/ob4$p;

    .line 13
    .line 14
    invoke-direct {v2, p0}, Ll/ob4$p;-><init>(Ll/ob4;)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {v0, v2}, Ll/eli0;->t0(Ll/spw;)V

    .line 18
    .line 19
    .line 20
    :cond_0
    iget-object v0, p0, Ll/ob4;->I:Ll/ia4;

    .line 21
    .line 22
    if-eqz v0, :cond_1

    .line 23
    .line 24
    new-instance v2, Ll/ob4$q;

    .line 25
    .line 26
    invoke-direct {v2, p0}, Ll/ob4$q;-><init>(Ll/ob4;)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {v0, v2}, Ll/ia4;->m(Ll/spw;)V

    .line 30
    .line 31
    .line 32
    :cond_1
    iput p1, p0, Ll/ob4;->c0:I

    .line 33
    .line 34
    iput-object p2, p0, Ll/ob4;->d0:Ll/qow;

    .line 35
    .line 36
    iget-object v0, p0, Ll/ob4;->h:Ll/sow;

    .line 37
    .line 38
    iget-boolean v0, v0, Ll/sow;->T:Z

    .line 39
    .line 40
    if-eqz v0, :cond_2

    .line 41
    .line 42
    const-string v0, "The camera type is camera2"

    .line 43
    .line 44
    invoke-static {v1, v0}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 45
    .line 46
    .line 47
    iget-object v0, p0, Ll/ob4;->I:Ll/ia4;

    .line 48
    .line 49
    new-instance v2, Ll/ob4$r;

    .line 50
    .line 51
    invoke-direct {v2, p0}, Ll/ob4$r;-><init>(Ll/ob4;)V

    .line 52
    .line 53
    .line 54
    invoke-virtual {v0, v2}, Ll/ia4;->n(Ll/diw$h;)V

    .line 55
    .line 56
    .line 57
    :cond_2
    iget-object v0, p0, Ll/ob4;->I:Ll/ia4;

    .line 58
    .line 59
    new-instance v2, Ll/ob4$s;

    .line 60
    .line 61
    invoke-direct {v2, p0}, Ll/ob4$s;-><init>(Ll/ob4;)V

    .line 62
    .line 63
    .line 64
    invoke-virtual {v0, v2}, Ll/ia4;->o(Landroid/hardware/Camera$ErrorCallback;)V

    .line 65
    .line 66
    .line 67
    invoke-direct {p0}, Ll/ob4;->g1()V

    .line 68
    .line 69
    .line 70
    iget-object v0, p0, Ll/ob4;->I:Ll/ia4;

    .line 71
    .line 72
    invoke-virtual {v0, p1, p2}, Ll/ia4;->h(ILl/qow;)Z

    .line 73
    .line 74
    .line 75
    move-result p1

    .line 76
    if-nez p1, :cond_3

    .line 77
    .line 78
    const-string p0, "Camera prepare failed !!!"

    .line 79
    .line 80
    invoke-static {v1, p0}, Lcom/cosmos/mdlog/MDLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 81
    .line 82
    .line 83
    const/4 p0, 0x0

    .line 84
    return p0

    .line 85
    :cond_3
    iget-object p1, p0, Ll/ob4;->h:Ll/sow;

    .line 86
    .line 87
    iget p2, p1, Ll/sow;->b:I

    .line 88
    .line 89
    iput p2, p0, Ll/ob4;->m0:I

    .line 90
    .line 91
    iget p1, p1, Ll/sow;->c:I

    .line 92
    .line 93
    iput p1, p0, Ll/ob4;->n0:I

    .line 94
    .line 95
    iget-object p1, p0, Ll/ob4;->I:Ll/ia4;

    .line 96
    .line 97
    new-instance p2, Ll/ob4$t;

    .line 98
    .line 99
    invoke-direct {p2, p0}, Ll/ob4$t;-><init>(Ll/ob4;)V

    .line 100
    .line 101
    .line 102
    invoke-virtual {p1, p2}, Ll/ia4;->l(Ll/ia4$b;)V

    .line 103
    .line 104
    .line 105
    iget-object p1, p0, Ll/ob4;->I:Ll/ia4;

    .line 106
    .line 107
    if-eqz p1, :cond_4

    .line 108
    .line 109
    invoke-virtual {p1}, Ll/ia4;->d()Ll/ypl;

    .line 110
    .line 111
    .line 112
    move-result-object p1

    .line 113
    if-eqz p1, :cond_4

    .line 114
    .line 115
    iget-object p1, p0, Ll/ob4;->I:Ll/ia4;

    .line 116
    .line 117
    invoke-virtual {p1}, Ll/ia4;->d()Ll/ypl;

    .line 118
    .line 119
    .line 120
    move-result-object p1

    .line 121
    invoke-interface {p1}, Ll/ypl;->m()I

    .line 122
    .line 123
    .line 124
    move-result p1

    .line 125
    goto :goto_0

    .line 126
    :cond_4
    const/16 p1, 0x5a

    .line 127
    .line 128
    :goto_0
    new-instance p2, Ll/crf0;

    .line 129
    .line 130
    iget-object v0, p0, Ll/ob4;->h:Ll/sow;

    .line 131
    .line 132
    iget v1, v0, Ll/sow;->b:I

    .line 133
    .line 134
    iget v0, v0, Ll/sow;->c:I

    .line 135
    .line 136
    invoke-direct {p2, v1, v0}, Ll/crf0;-><init>(II)V

    .line 137
    .line 138
    .line 139
    new-instance v0, Ll/crf0;

    .line 140
    .line 141
    iget-object v1, p0, Ll/ob4;->h:Ll/sow;

    .line 142
    .line 143
    iget v2, v1, Ll/sow;->o:I

    .line 144
    .line 145
    iget v1, v1, Ll/sow;->p:I

    .line 146
    .line 147
    invoke-direct {v0, v2, v1}, Ll/crf0;-><init>(II)V

    .line 148
    .line 149
    .line 150
    invoke-static {p2, v0, p1}, Ll/ad4;->e(Ll/crf0;Ll/crf0;I)Ll/crf0;

    .line 151
    .line 152
    .line 153
    move-result-object p2

    .line 154
    iget-object v0, p0, Ll/ob4;->h:Ll/sow;

    .line 155
    .line 156
    invoke-virtual {p2}, Ll/crf0;->b()I

    .line 157
    .line 158
    .line 159
    move-result v1

    .line 160
    iput v1, v0, Ll/sow;->m:I

    .line 161
    .line 162
    iget-object v0, p0, Ll/ob4;->h:Ll/sow;

    .line 163
    .line 164
    invoke-virtual {p2}, Ll/crf0;->a()I

    .line 165
    .line 166
    .line 167
    move-result p2

    .line 168
    iput p2, v0, Ll/sow;->n:I

    .line 169
    .line 170
    iget-object p2, p0, Ll/ob4;->h:Ll/sow;

    .line 171
    .line 172
    iput p1, p2, Ll/sow;->r:I

    .line 173
    .line 174
    iget p1, p2, Ll/sow;->h:I

    .line 175
    .line 176
    iput p1, p0, Ll/ob4;->g0:I

    .line 177
    .line 178
    iget p1, p2, Ll/sow;->i:I

    .line 179
    .line 180
    iput p1, p0, Ll/ob4;->h0:I

    .line 181
    .line 182
    iget-object p1, p0, Ll/ob4;->i0:Ll/cvf;

    .line 183
    .line 184
    if-eqz p1, :cond_5

    .line 185
    .line 186
    invoke-virtual {p0}, Ll/ob4;->e()Z

    .line 187
    .line 188
    .line 189
    move-result p0

    .line 190
    invoke-virtual {p1, p0}, Ll/cvf;->b(Z)V

    .line 191
    .line 192
    .line 193
    :cond_5
    const/4 p0, 0x1

    .line 194
    return p0
.end method


# virtual methods
.method public A(ILl/qow;)Z
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Ll/ob4;->j1(ILl/qow;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public B(Ll/c5g0$a;)V
    .locals 0

    .line 1
    return-void
.end method

.method public C(ILl/qow;)Z
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iput-object v0, p0, Ll/ob4;->q:Landroid/os/Looper;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-direct {p0, p1, p2}, Ll/ob4;->z1(ILl/qow;)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0

    .line 14
    :cond_0
    const-string p0, "Should create Looper in your thread, we need loop to create and release egl info"

    .line 15
    .line 16
    invoke-static {p0}, Ll/brq0;->a(Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    const/4 p0, 0x0

    .line 20
    return p0
.end method

.method public D(Ll/epw;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/ob4;->y:Ll/epw;

    .line 2
    .line 3
    return-void
.end method

.method public E(Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ob4;->I:Ll/ia4;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/ia4;->d()Ll/ypl;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-eqz v0, :cond_1

    .line 10
    .line 11
    iget-object p0, p0, Ll/ob4;->I:Ll/ia4;

    .line 12
    .line 13
    const-string v0, "on"

    .line 14
    .line 15
    if-ne p1, v0, :cond_0

    .line 16
    .line 17
    invoke-virtual {p0}, Ll/ia4;->d()Ll/ypl;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    const-string p1, "torch"

    .line 22
    .line 23
    invoke-interface {p0, p1}, Ll/ypl;->E(Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    invoke-static {}, Lcom/immomo/moment/datadot/DataDotUtils;->getInstance()Lcom/immomo/moment/datadot/DataDotUtils;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    invoke-virtual {p0}, Lcom/immomo/moment/datadot/DataDotUtils;->getRecoderDataDotInfo()Lcom/immomo/moment/datadot/RecoderDataDotInfo;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    const/4 p1, 0x1

    .line 35
    invoke-virtual {p0, p1}, Lcom/immomo/moment/datadot/RecoderDataDotInfo;->setCameraUseFlash(Z)V

    .line 36
    .line 37
    .line 38
    return-void

    .line 39
    :cond_0
    invoke-virtual {p0}, Ll/ia4;->d()Ll/ypl;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    invoke-interface {p0, p1}, Ll/ypl;->E(Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    :cond_1
    return-void
.end method

.method public E1([B)[B
    .locals 2

    .line 1
    iget-boolean v0, p0, Ll/ob4;->E:Z

    .line 2
    .line 3
    iget-object v1, p0, Ll/ob4;->F:[B

    .line 4
    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    if-nez v1, :cond_0

    .line 8
    .line 9
    array-length v0, p1

    .line 10
    invoke-static {p1, v0}, Ljava/util/Arrays;->copyOf([BI)[B

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    iput-object p1, p0, Ll/ob4;->F:[B

    .line 15
    .line 16
    :cond_0
    iget-object p0, p0, Ll/ob4;->F:[B

    .line 17
    .line 18
    return-object p0

    .line 19
    :cond_1
    if-eqz v1, :cond_2

    .line 20
    .line 21
    const/4 v0, 0x0

    .line 22
    iput-object v0, p0, Ll/ob4;->F:[B

    .line 23
    .line 24
    :cond_2
    return-object p1
.end method

.method public F()Z
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ob4;->I:Ll/ia4;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/ia4;->d()Ll/ypl;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Ll/ob4;->I:Ll/ia4;

    .line 12
    .line 13
    invoke-virtual {p0}, Ll/ia4;->d()Ll/ypl;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-interface {p0}, Ll/ypl;->F()Z

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    return p0

    .line 22
    :cond_0
    const/4 p0, 0x0

    .line 23
    return p0
.end method

.method public G(Ll/hpw;)V
    .locals 0

    .line 1
    return-void
.end method

.method public H(Ll/wjm0;)V
    .locals 0

    .line 1
    return-void
.end method

.method public I(Ll/npw;)V
    .locals 0

    .line 1
    return-void
.end method

.method public J(I)V
    .locals 0

    .line 1
    return-void
.end method

.method public J1(Ll/crf0;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ob4;->g:Ll/v5c;

    .line 2
    .line 3
    iget-object p0, p0, Ll/ob4;->R:Ljava/lang/Object;

    .line 4
    .line 5
    invoke-virtual {v0, p0, p1}, Ll/eli0;->y0(Ljava/lang/Object;Ll/crf0;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public declared-synchronized K(Z)V
    .locals 2

    .line 1
    const-string v0, "The recoder use the background music "

    .line 2
    .line 3
    monitor-enter p0

    .line 4
    :try_start_0
    iput-boolean p1, p0, Ll/ob4;->V:Z

    .line 5
    .line 6
    invoke-static {}, Lcom/immomo/moment/datadot/DataDotUtils;->getInstance()Lcom/immomo/moment/datadot/DataDotUtils;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    invoke-virtual {p1}, Lcom/immomo/moment/datadot/DataDotUtils;->getRecoderDataDotInfo()Lcom/immomo/moment/datadot/RecoderDataDotInfo;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    iget-boolean v1, p0, Ll/ob4;->V:Z

    .line 15
    .line 16
    invoke-virtual {p1, v1}, Lcom/immomo/moment/datadot/RecoderDataDotInfo;->setCameraUseBgMusic(Z)V

    .line 17
    .line 18
    .line 19
    const-string p1, "media"

    .line 20
    .line 21
    new-instance v1, Ljava/lang/StringBuilder;

    .line 22
    .line 23
    invoke-direct {v1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    iget-boolean v0, p0, Ll/ob4;->V:Z

    .line 27
    .line 28
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    invoke-static {p1, v0}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 36
    .line 37
    .line 38
    monitor-exit p0

    .line 39
    return-void

    .line 40
    :catchall_0
    move-exception p1

    .line 41
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 42
    throw p1
.end method

.method public L(Ll/la1;)V
    .locals 0

    .line 1
    return-void
.end method

.method public declared-synchronized M(Ll/npw;)Lcom/immomo/moment/model/VideoFragment;
    .locals 0

    .line 1
    monitor-enter p0

    .line 2
    if-nez p1, :cond_0

    .line 3
    .line 4
    const/4 p1, 0x1

    .line 5
    goto :goto_0

    .line 6
    :cond_0
    const/4 p1, 0x0

    .line 7
    :goto_0
    :try_start_0
    invoke-direct {p0, p1}, Ll/ob4;->P1(Z)Lcom/immomo/moment/model/VideoFragment;

    .line 8
    .line 9
    .line 10
    move-result-object p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 11
    monitor-exit p0

    .line 12
    return-object p1

    .line 13
    :catchall_0
    move-exception p1

    .line 14
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 15
    throw p1
.end method

.method public declared-synchronized N(Ll/mpw;)V
    .locals 5

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    invoke-static {}, Lcom/immomo/moment/util/datadot/RecorderDataDotUtils;->getInstance()Lcom/immomo/moment/util/datadot/RecorderDataDotUtils;

    .line 3
    .line 4
    .line 5
    move-result-object v0

    .line 6
    const-string v1, "sdk-camera-engine-record-video"

    .line 7
    .line 8
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 9
    .line 10
    .line 11
    move-result-wide v2

    .line 12
    sget-object v4, Lcom/momo/xengine/mestatistics/ReportType;->COUNT:Lcom/momo/xengine/mestatistics/ReportType;

    .line 13
    .line 14
    invoke-virtual {v0, v1, v2, v3, v4}, Lcom/immomo/moment/util/datadot/RecorderDataDotUtils;->realTimeReport(Ljava/lang/String;JLcom/momo/xengine/mestatistics/ReportType;)V

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Ll/ob4;->d0:Ll/qow;

    .line 18
    .line 19
    invoke-virtual {v0}, Ll/qow;->i()Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-nez v0, :cond_0

    .line 24
    .line 25
    iget-object v0, p0, Ll/ob4;->u:Ll/pc1;

    .line 26
    .line 27
    if-eqz v0, :cond_0

    .line 28
    .line 29
    invoke-virtual {v0}, Ll/pc1;->l()V

    .line 30
    .line 31
    .line 32
    goto :goto_0

    .line 33
    :catchall_0
    move-exception p1

    .line 34
    goto :goto_2

    .line 35
    :cond_0
    :goto_0
    if-nez p1, :cond_1

    .line 36
    .line 37
    const-string p1, "media"

    .line 38
    .line 39
    const-string v0, "Calling startRecording with sync "

    .line 40
    .line 41
    invoke-static {p1, v0}, Lcom/cosmos/mdlog/MDLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    invoke-direct {p0}, Ll/ob4;->h1()V

    .line 45
    .line 46
    .line 47
    goto :goto_1

    .line 48
    :cond_1
    const-string p1, "media"

    .line 49
    .line 50
    const-string v0, "Calling startRecording with async "

    .line 51
    .line 52
    invoke-static {p1, v0}, Lcom/cosmos/mdlog/MDLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 53
    .line 54
    .line 55
    iget-object p1, p0, Ll/ob4;->g:Ll/v5c;

    .line 56
    .line 57
    if-eqz p1, :cond_2

    .line 58
    .line 59
    invoke-virtual {p1}, Ll/qt2;->M()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 60
    .line 61
    .line 62
    :cond_2
    :goto_1
    monitor-exit p0

    .line 63
    return-void

    .line 64
    :goto_2
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 65
    throw p1
.end method

.method public N1()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ob4;->I:Ll/ia4;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/ia4;->i()V

    .line 6
    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    iput-object v0, p0, Ll/ob4;->I:Ll/ia4;

    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method public O(Ll/cu10$e;)V
    .locals 0

    .line 1
    return-void
.end method

.method public declared-synchronized O1()V
    .locals 1

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Ll/ob4;->g:Ll/v5c;

    .line 3
    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    invoke-virtual {v0}, Ll/eli0;->P()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 7
    .line 8
    .line 9
    goto :goto_0

    .line 10
    :catchall_0
    move-exception v0

    .line 11
    goto :goto_1

    .line 12
    :cond_0
    :goto_0
    monitor-exit p0

    .line 13
    return-void

    .line 14
    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 15
    throw v0
.end method

.method public P(Z)V
    .locals 1

    .line 1
    iput-boolean p1, p0, Ll/ob4;->G:Z

    .line 2
    .line 3
    new-instance p0, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    const-string v0, "Use adjust light "

    .line 6
    .line 7
    invoke-direct {p0, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    const-string p1, "media"

    .line 18
    .line 19
    invoke-static {p1, p0}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public Q(Ll/mpw;)V
    .locals 0

    .line 1
    return-void
.end method

.method public declared-synchronized R(Ljava/lang/Object;)V
    .locals 2

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 3
    .line 4
    .line 5
    move-result-wide v0

    .line 6
    iput-wide v0, p0, Ll/ob4;->s0:J

    .line 7
    .line 8
    iget-object v0, p0, Ll/ob4;->g:Ll/v5c;

    .line 9
    .line 10
    invoke-virtual {v0, p1}, Ll/qt2;->L(Ljava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 11
    .line 12
    .line 13
    monitor-exit p0

    .line 14
    return-void

    .line 15
    :catchall_0
    move-exception p1

    .line 16
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 17
    throw p1
.end method

.method public R1()Ll/crf0;
    .locals 5

    .line 1
    iget-object v0, p0, Ll/ob4;->I:Ll/ia4;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/ia4;->d()Ll/ypl;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Ll/ob4;->I:Ll/ia4;

    .line 10
    .line 11
    iget-object v1, p0, Ll/ob4;->h:Ll/sow;

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ll/ia4;->e(Ll/sow;)V

    .line 14
    .line 15
    .line 16
    :cond_0
    new-instance v0, Ll/crf0;

    .line 17
    .line 18
    iget v1, p0, Ll/ob4;->m0:I

    .line 19
    .line 20
    iget v2, p0, Ll/ob4;->n0:I

    .line 21
    .line 22
    invoke-direct {v0, v1, v2}, Ll/crf0;-><init>(II)V

    .line 23
    .line 24
    .line 25
    iget-object v1, p0, Ll/ob4;->I:Ll/ia4;

    .line 26
    .line 27
    invoke-virtual {v1}, Ll/ia4;->d()Ll/ypl;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    invoke-interface {v1}, Ll/ypl;->m()I

    .line 32
    .line 33
    .line 34
    move-result v1

    .line 35
    new-instance v2, Ll/crf0;

    .line 36
    .line 37
    iget-object v3, p0, Ll/ob4;->h:Ll/sow;

    .line 38
    .line 39
    iget v4, v3, Ll/sow;->o:I

    .line 40
    .line 41
    iget v3, v3, Ll/sow;->p:I

    .line 42
    .line 43
    invoke-direct {v2, v4, v3}, Ll/crf0;-><init>(II)V

    .line 44
    .line 45
    .line 46
    const/4 v3, 0x0

    .line 47
    invoke-static {v0, v1, v2, v3}, Ll/ad4;->f(Ll/crf0;ILl/crf0;Z)Ll/crf0;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    iget-object v1, p0, Ll/ob4;->h:Ll/sow;

    .line 52
    .line 53
    invoke-virtual {v0}, Ll/crf0;->b()I

    .line 54
    .line 55
    .line 56
    move-result v2

    .line 57
    iput v2, v1, Ll/sow;->m:I

    .line 58
    .line 59
    iget-object v1, p0, Ll/ob4;->h:Ll/sow;

    .line 60
    .line 61
    invoke-virtual {v0}, Ll/crf0;->a()I

    .line 62
    .line 63
    .line 64
    move-result v2

    .line 65
    iput v2, v1, Ll/sow;->n:I

    .line 66
    .line 67
    invoke-direct {p0}, Ll/ob4;->A1()V

    .line 68
    .line 69
    .line 70
    return-object v0
.end method

.method public S(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/ob4;->j:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public T(Ll/gpw;)V
    .locals 0

    .line 1
    return-void
.end method

.method public U(Ljava/lang/String;ZIIIIZ)V
    .locals 9

    .line 1
    invoke-static {}, Lcom/immomo/moment/util/datadot/RecorderDataDotUtils;->getInstance()Lcom/immomo/moment/util/datadot/RecorderDataDotUtils;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 6
    .line 7
    .line 8
    move-result-wide v1

    .line 9
    sget-object v3, Lcom/momo/xengine/mestatistics/ReportType;->COUNT:Lcom/momo/xengine/mestatistics/ReportType;

    .line 10
    .line 11
    const-string v4, "sdk-camera-engine-take-photo"

    .line 12
    .line 13
    invoke-virtual {v0, v4, v1, v2, v3}, Lcom/immomo/moment/util/datadot/RecorderDataDotUtils;->realTimeReport(Ljava/lang/String;JLcom/momo/xengine/mestatistics/ReportType;)V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Ll/ob4;->f0:Ll/c3i0;

    .line 17
    .line 18
    invoke-virtual {v0, p1}, Ll/c3i0;->h(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Ll/ob4;->f0:Ll/c3i0;

    .line 22
    .line 23
    invoke-virtual {v0, p2}, Ll/c3i0;->i(Z)V

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, Ll/ob4;->f0:Ll/c3i0;

    .line 27
    .line 28
    iget-object v1, p0, Ll/ob4;->e0:Ll/qpw;

    .line 29
    .line 30
    invoke-virtual {v0, v1}, Ll/c3i0;->j(Ll/qpw;)V

    .line 31
    .line 32
    .line 33
    if-eqz p2, :cond_1

    .line 34
    .line 35
    iget-object p2, p0, Ll/ob4;->I:Ll/ia4;

    .line 36
    .line 37
    if-eqz p2, :cond_0

    .line 38
    .line 39
    invoke-virtual {p2}, Ll/ia4;->d()Ll/ypl;

    .line 40
    .line 41
    .line 42
    move-result-object p2

    .line 43
    if-eqz p2, :cond_0

    .line 44
    .line 45
    iget-object p2, p0, Ll/ob4;->I:Ll/ia4;

    .line 46
    .line 47
    invoke-virtual {p2}, Ll/ia4;->d()Ll/ypl;

    .line 48
    .line 49
    .line 50
    move-result-object p2

    .line 51
    invoke-interface {p2, p1}, Ll/ypl;->t(Ljava/lang/String;)V

    .line 52
    .line 53
    .line 54
    :cond_0
    iget-object p2, p0, Ll/ob4;->g:Ll/v5c;

    .line 55
    .line 56
    iget-object v0, p0, Ll/ob4;->A0:Ll/ppw;

    .line 57
    .line 58
    invoke-virtual {p2, v0}, Ll/v5c;->m1(Ll/ppw;)V

    .line 59
    .line 60
    .line 61
    goto :goto_0

    .line 62
    :cond_1
    iget-object p2, p0, Ll/ob4;->g:Ll/v5c;

    .line 63
    .line 64
    const/4 v0, 0x0

    .line 65
    invoke-virtual {p2, v0}, Ll/v5c;->m1(Ll/ppw;)V

    .line 66
    .line 67
    .line 68
    iget-object p2, p0, Ll/ob4;->g:Ll/v5c;

    .line 69
    .line 70
    iget-object v0, p0, Ll/ob4;->e0:Ll/qpw;

    .line 71
    .line 72
    invoke-virtual {p2, v0}, Ll/v5c;->l1(Ll/qpw;)V

    .line 73
    .line 74
    .line 75
    :goto_0
    iget-object v1, p0, Ll/ob4;->g:Ll/v5c;

    .line 76
    .line 77
    if-eqz v1, :cond_3

    .line 78
    .line 79
    iget-object p2, p0, Ll/ob4;->h:Ll/sow;

    .line 80
    .line 81
    if-eqz p2, :cond_3

    .line 82
    .line 83
    iget-boolean v0, p2, Ll/sow;->U:Z

    .line 84
    .line 85
    if-nez v0, :cond_2

    .line 86
    .line 87
    const/4 p2, 0x0

    .line 88
    :goto_1
    move-object v2, p1

    .line 89
    move v3, p2

    .line 90
    move v4, p3

    .line 91
    move v5, p4

    .line 92
    move v6, p5

    .line 93
    move v7, p6

    .line 94
    move/from16 v8, p7

    .line 95
    .line 96
    goto :goto_2

    .line 97
    :cond_2
    iget p2, p2, Ll/sow;->q:I

    .line 98
    .line 99
    goto :goto_1

    .line 100
    :goto_2
    invoke-virtual/range {v1 .. v8}, Ll/v5c;->q1(Ljava/lang/String;IIIIIZ)V

    .line 101
    .line 102
    .line 103
    invoke-static {}, Lcom/immomo/moment/datadot/DataDotUtils;->getInstance()Lcom/immomo/moment/datadot/DataDotUtils;

    .line 104
    .line 105
    .line 106
    move-result-object p2

    .line 107
    invoke-virtual {p2}, Lcom/immomo/moment/datadot/DataDotUtils;->getRecoderDataDotInfo()Lcom/immomo/moment/datadot/RecoderDataDotInfo;

    .line 108
    .line 109
    .line 110
    move-result-object p2

    .line 111
    const/4 p3, 0x1

    .line 112
    invoke-virtual {p2, p3}, Lcom/immomo/moment/datadot/RecoderDataDotInfo;->setCameraTakePhoto(Z)V

    .line 113
    .line 114
    .line 115
    invoke-direct {p0}, Ll/ob4;->H1()V

    .line 116
    .line 117
    .line 118
    new-instance p2, Ljava/lang/StringBuilder;

    .line 119
    .line 120
    const-string p3, "The picture path is "

    .line 121
    .line 122
    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 123
    .line 124
    .line 125
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 126
    .line 127
    .line 128
    const-string p1, " the video rotation is "

    .line 129
    .line 130
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 131
    .line 132
    .line 133
    iget-object p0, p0, Ll/ob4;->h:Ll/sow;

    .line 134
    .line 135
    iget p0, p0, Ll/sow;->q:I

    .line 136
    .line 137
    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 138
    .line 139
    .line 140
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 141
    .line 142
    .line 143
    move-result-object p0

    .line 144
    const-string p1, "media"

    .line 145
    .line 146
    invoke-static {p1, p0}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 147
    .line 148
    .line 149
    :cond_3
    return-void
.end method

.method public V(Ll/bvb;)V
    .locals 0

    .line 1
    return-void
.end method

.method public W(Ll/wow;)V
    .locals 0

    .line 1
    return-void
.end method

.method public X()Z
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ob4;->I:Ll/ia4;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/ia4;->d()Ll/ypl;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Ll/ob4;->I:Ll/ia4;

    .line 12
    .line 13
    invoke-virtual {p0}, Ll/ia4;->d()Ll/ypl;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-interface {p0}, Ll/ypl;->v()Z

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    return p0

    .line 22
    :cond_0
    const/4 p0, 0x0

    .line 23
    return p0
.end method

.method public Y()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ob4;->i:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public Z(Ll/fpw;)V
    .locals 0

    .line 1
    return-void
.end method

.method public a0()V
    .locals 0

    .line 1
    return-void
.end method

.method public b(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ob4;->I:Ll/ia4;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/ia4;->d()Ll/ypl;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Ll/ob4;->I:Ll/ia4;

    .line 12
    .line 13
    invoke-virtual {p0}, Ll/ia4;->d()Ll/ypl;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-interface {p0, p1}, Ll/ypl;->b(I)V

    .line 18
    .line 19
    .line 20
    :cond_0
    return-void
.end method

.method public b0(Z)V
    .locals 0

    .line 1
    return-void
.end method

.method public c()I
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ob4;->I:Ll/ia4;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/ia4;->d()Ll/ypl;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Ll/ob4;->I:Ll/ia4;

    .line 12
    .line 13
    invoke-virtual {p0}, Ll/ia4;->d()Ll/ypl;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-interface {p0}, Ll/ypl;->c()I

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    return p0

    .line 22
    :cond_0
    const/4 p0, 0x0

    .line 23
    return p0
.end method

.method public c0(Z)V
    .locals 0

    .line 1
    return-void
.end method

.method public d()I
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ob4;->I:Ll/ia4;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/ia4;->d()Ll/ypl;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Ll/ob4;->I:Ll/ia4;

    .line 12
    .line 13
    invoke-virtual {p0}, Ll/ia4;->d()Ll/ypl;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-interface {p0}, Ll/ypl;->d()I

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    return p0

    .line 22
    :cond_0
    const/4 p0, 0x0

    .line 23
    return p0
.end method

.method public d0(Z)V
    .locals 0

    .line 1
    return-void
.end method

.method public e()Z
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ob4;->I:Ll/ia4;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/ia4;->d()Ll/ypl;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    iget-object p0, p0, Ll/ob4;->I:Ll/ia4;

    .line 13
    .line 14
    invoke-virtual {p0}, Ll/ia4;->d()Ll/ypl;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    invoke-interface {p0}, Ll/ypl;->i()Z

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    return p0

    .line 23
    :cond_1
    :goto_0
    const/4 p0, 0x0

    .line 24
    return p0
.end method

.method public e0(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/ob4;->l0:Z

    .line 2
    .line 3
    return-void
.end method

.method public f0(Ll/dpw;)V
    .locals 0

    .line 1
    return-void
.end method

.method public g0(Ljava/util/HashMap;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .line 1
    return-void
.end method

.method public h0()V
    .locals 1

    .line 1
    iget-boolean v0, p0, Ll/ob4;->o0:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    const/4 v0, 0x0

    .line 7
    iput-boolean v0, p0, Ll/ob4;->o0:Z

    .line 8
    .line 9
    iget-object p0, p0, Ll/ob4;->g:Ll/v5c;

    .line 10
    .line 11
    invoke-virtual {p0, v0}, Ll/v5c;->d1(I)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public i0()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/ob4;->o0:Z

    .line 2
    .line 3
    return p0
.end method

.method public j0(F)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ob4;->h:Ll/sow;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iput p1, v0, Ll/sow;->R:F

    .line 6
    .line 7
    new-instance p1, Ljava/lang/StringBuilder;

    .line 8
    .line 9
    const-string v0, "The recoder speed is "

    .line 10
    .line 11
    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    iget-object p0, p0, Ll/ob4;->h:Ll/sow;

    .line 15
    .line 16
    iget p0, p0, Ll/sow;->R:F

    .line 17
    .line 18
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    const-string p1, "media"

    .line 26
    .line 27
    invoke-static {p1, p0}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    :cond_0
    return-void
.end method

.method public k(Landroid/graphics/Rect;Landroid/hardware/Camera$AutoFocusCallback;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ob4;->I:Ll/ia4;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2}, Ll/ia4;->c(Landroid/graphics/Rect;Landroid/hardware/Camera$AutoFocusCallback;)V

    .line 6
    .line 7
    .line 8
    invoke-static {}, Lcom/immomo/moment/datadot/DataDotUtils;->getInstance()Lcom/immomo/moment/datadot/DataDotUtils;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-virtual {p0}, Lcom/immomo/moment/datadot/DataDotUtils;->getRecoderDataDotInfo()Lcom/immomo/moment/datadot/RecoderDataDotInfo;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    const/4 p2, 0x1

    .line 17
    invoke-virtual {p0, p2}, Lcom/immomo/moment/datadot/RecoderDataDotInfo;->setCameraUseFocus(Z)V

    .line 18
    .line 19
    .line 20
    new-instance p0, Ljava/lang/StringBuilder;

    .line 21
    .line 22
    const-string p2, "The focus rect is rect.left = "

    .line 23
    .line 24
    invoke-direct {p0, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    iget p2, p1, Landroid/graphics/Rect;->left:I

    .line 28
    .line 29
    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 30
    .line 31
    .line 32
    const-string p2, " rect.top = "

    .line 33
    .line 34
    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 35
    .line 36
    .line 37
    iget p2, p1, Landroid/graphics/Rect;->top:I

    .line 38
    .line 39
    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 40
    .line 41
    .line 42
    const-string p2, " rect.right = "

    .line 43
    .line 44
    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 45
    .line 46
    .line 47
    iget p2, p1, Landroid/graphics/Rect;->right:I

    .line 48
    .line 49
    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 50
    .line 51
    .line 52
    const-string p2, " rect.bottom = "

    .line 53
    .line 54
    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 55
    .line 56
    .line 57
    iget p1, p1, Landroid/graphics/Rect;->bottom:I

    .line 58
    .line 59
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 60
    .line 61
    .line 62
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object p0

    .line 66
    const-string p1, "media"

    .line 67
    .line 68
    invoke-static {p1, p0}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 69
    .line 70
    .line 71
    :cond_0
    return-void
.end method

.method public k0(Z)V
    .locals 0

    .line 1
    return-void
.end method

.method public l(Ll/ypl$f;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ob4;->I:Ll/ia4;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/ia4;->p(Ll/ypl$f;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public l0(Ll/qpw;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/ob4;->e0:Ll/qpw;

    .line 2
    .line 3
    return-void
.end method

.method public l1(JJ)V
    .locals 0

    .line 1
    iget-wide p1, p0, Ll/ob4;->L:J

    .line 2
    .line 3
    const-wide/16 p3, 0x0

    .line 4
    .line 5
    cmp-long p1, p1, p3

    .line 6
    .line 7
    if-nez p1, :cond_0

    .line 8
    .line 9
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 10
    .line 11
    .line 12
    move-result-wide p1

    .line 13
    iput-wide p1, p0, Ll/ob4;->L:J

    .line 14
    .line 15
    :cond_0
    iget p1, p0, Ll/ob4;->M:I

    .line 16
    .line 17
    add-int/lit8 p1, p1, 0x1

    .line 18
    .line 19
    iput p1, p0, Ll/ob4;->M:I

    .line 20
    .line 21
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 22
    .line 23
    .line 24
    move-result-wide p1

    .line 25
    iget-wide p3, p0, Ll/ob4;->L:J

    .line 26
    .line 27
    sub-long/2addr p1, p3

    .line 28
    const-wide/16 p3, 0x3e8

    .line 29
    .line 30
    cmp-long p1, p1, p3

    .line 31
    .line 32
    if-lez p1, :cond_1

    .line 33
    .line 34
    iget p1, p0, Ll/ob4;->M:I

    .line 35
    .line 36
    iput p1, p0, Ll/ob4;->C:I

    .line 37
    .line 38
    const/4 p1, 0x0

    .line 39
    iput p1, p0, Ll/ob4;->M:I

    .line 40
    .line 41
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 42
    .line 43
    .line 44
    move-result-wide p1

    .line 45
    iput-wide p1, p0, Ll/ob4;->L:J

    .line 46
    .line 47
    :cond_1
    return-void
.end method

.method public m0(Ll/apw;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/ob4;->a0:Ll/apw;

    .line 2
    .line 3
    return-void
.end method

.method public n0(Ll/opw;)V
    .locals 0

    .line 1
    return-void
.end method

.method public o0(Ll/cpw;)V
    .locals 0

    .line 1
    return-void
.end method

.method public p0(Ljava/lang/String;)V
    .locals 0

    .line 1
    return-void
.end method

.method public q0(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/ob4;->i:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public r0(Ljava/lang/String;)V
    .locals 0

    .line 1
    return-void
.end method

.method public declared-synchronized release()V
    .locals 1

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    invoke-virtual {p0}, Ll/ob4;->N1()V

    .line 3
    .line 4
    .line 5
    iget-object v0, p0, Ll/ob4;->g:Ll/v5c;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {v0}, Ll/eli0;->G()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 10
    .line 11
    .line 12
    goto :goto_0

    .line 13
    :catchall_0
    move-exception v0

    .line 14
    goto :goto_1

    .line 15
    :cond_0
    :goto_0
    monitor-exit p0

    .line 16
    return-void

    .line 17
    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 18
    throw v0
.end method

.method public s0()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public t0(Ll/fpw;)V
    .locals 0

    .line 1
    return-void
.end method

.method public u0(Ll/yow;)V
    .locals 0

    .line 1
    return-void
.end method

.method public declared-synchronized v0(Ll/kt2;)V
    .locals 1

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iput-object p1, p0, Ll/ob4;->Q:Ll/kt2;

    .line 3
    .line 4
    iget-object v0, p0, Ll/ob4;->g:Ll/v5c;

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    invoke-virtual {v0, p1}, Ll/qt2;->S(Ljava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 9
    .line 10
    .line 11
    goto :goto_0

    .line 12
    :catchall_0
    move-exception p1

    .line 13
    goto :goto_1

    .line 14
    :cond_0
    :goto_0
    monitor-exit p0

    .line 15
    return-void

    .line 16
    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 17
    throw p1
.end method

.method public w0(Landroid/content/Context;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ob4;->I:Ll/ia4;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/ia4;->k(Landroid/content/Context;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public x(II)Ll/crf0;
    .locals 5

    .line 1
    iget-object v0, p0, Ll/ob4;->I:Ll/ia4;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/ia4;->d()Ll/ypl;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Ll/ob4;->I:Ll/ia4;

    .line 10
    .line 11
    iget-object v1, p0, Ll/ob4;->h:Ll/sow;

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ll/ia4;->e(Ll/sow;)V

    .line 14
    .line 15
    .line 16
    :cond_0
    new-instance v0, Ll/crf0;

    .line 17
    .line 18
    invoke-direct {v0, p1, p2}, Ll/crf0;-><init>(II)V

    .line 19
    .line 20
    .line 21
    iget-object v1, p0, Ll/ob4;->I:Ll/ia4;

    .line 22
    .line 23
    invoke-virtual {v1}, Ll/ia4;->d()Ll/ypl;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    invoke-interface {v1}, Ll/ypl;->m()I

    .line 28
    .line 29
    .line 30
    move-result v1

    .line 31
    new-instance v2, Ll/crf0;

    .line 32
    .line 33
    iget-object v3, p0, Ll/ob4;->h:Ll/sow;

    .line 34
    .line 35
    iget v4, v3, Ll/sow;->o:I

    .line 36
    .line 37
    iget v3, v3, Ll/sow;->p:I

    .line 38
    .line 39
    invoke-direct {v2, v4, v3}, Ll/crf0;-><init>(II)V

    .line 40
    .line 41
    .line 42
    const/4 v3, 0x0

    .line 43
    invoke-static {v0, v1, v2, v3}, Ll/ad4;->f(Ll/crf0;ILl/crf0;Z)Ll/crf0;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    iget-object v1, p0, Ll/ob4;->h:Ll/sow;

    .line 48
    .line 49
    invoke-virtual {v0}, Ll/crf0;->b()I

    .line 50
    .line 51
    .line 52
    move-result v2

    .line 53
    iput v2, v1, Ll/sow;->m:I

    .line 54
    .line 55
    iget-object v1, p0, Ll/ob4;->h:Ll/sow;

    .line 56
    .line 57
    invoke-virtual {v0}, Ll/crf0;->a()I

    .line 58
    .line 59
    .line 60
    move-result v2

    .line 61
    iput v2, v1, Ll/sow;->n:I

    .line 62
    .line 63
    invoke-direct {p0}, Ll/ob4;->A1()V

    .line 64
    .line 65
    .line 66
    new-instance v1, Ll/crf0;

    .line 67
    .line 68
    invoke-direct {v1, p1, p2}, Ll/crf0;-><init>(II)V

    .line 69
    .line 70
    .line 71
    invoke-virtual {p0, v1}, Ll/ob4;->J1(Ll/crf0;)V

    .line 72
    .line 73
    .line 74
    return-object v0
.end method

.method public y()Z
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ob4;->I:Ll/ia4;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/ia4;->d()Ll/ypl;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Ll/ob4;->I:Ll/ia4;

    .line 12
    .line 13
    invoke-virtual {p0}, Ll/ia4;->d()Ll/ypl;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-interface {p0}, Ll/ypl;->y()Z

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    return p0

    .line 22
    :cond_0
    const/4 p0, 0x0

    .line 23
    return p0
.end method

.method public z(Ll/bpw;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/ob4;->v:Ll/bpw;

    .line 2
    .line 3
    return-void
.end method

.class public Ll/s410;
.super Ll/grx;
.source "SourceFile"

# interfaces
.implements Ll/g220;
.implements Lcom/immomo/mediacore/strinf/NotifyCenter;
.implements Ll/fb1;
.implements Ll/wyl;
.implements Ll/o410$f;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/s410$d;,
        Ll/s410$b;,
        Ll/s410$e;,
        Ll/s410$c;
    }
.end annotation


# instance fields
.field private A1:I

.field private A2:Z

.field private B1:I

.field private volatile B2:Z

.field private C1:I

.field private C2:J

.field private D1:I

.field private D2:J

.field private E1:Z

.field private final E2:Ljava/util/regex/Pattern;

.field private F1:Z

.field private final F2:Ljava/util/regex/Pattern;

.field private G1:Z

.field private final G2:Ljava/util/regex/Pattern;

.field private H1:Z

.field private H2:J

.field private I1:Z

.field private I2:Ljava/lang/String;

.field private J1:Ll/q210$a;

.field private J2:I

.field public K1:Ll/fb1;

.field public K2:Landroid/os/HandlerThread;

.field private L1:Ll/kod0;

.field public L2:Ll/s410$c;

.field protected M1:J

.field public M2:Lcom/immomo/medialog/util/LimitedQueue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/immomo/medialog/util/LimitedQueue<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field protected N1:J

.field private N2:I

.field private O1:Z

.field private O2:I

.field private P1:J

.field private Q1:J

.field private R1:J

.field private S1:J

.field private T1:Ll/rp1;

.field private U1:J

.field private V1:J

.field private W1:[I

.field private X1:I

.field private Y1:Lcom/immomo/medialog/util/LimitedQueue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/immomo/medialog/util/LimitedQueue<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private Z1:Ll/lob0;

.field private a2:Landroid/os/Handler;

.field private b2:Ll/p4k0;

.field private c2:I

.field private d2:I

.field private e2:J

.field private f2:J

.field private g2:J

.field private h2:Z

.field private i2:I

.field private j2:J

.field private k2:J

.field l1:Lcom/immomo/mediacore/sink/IjkWriter;

.field private l2:J

.field private m1:J

.field private m2:Z

.field private n1:J

.field private n2:Ljava/util/LinkedList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedList<",
            "Ll/s410$b;",
            ">;"
        }
    .end annotation
.end field

.field private o1:Ljava/nio/ByteBuffer;

.field private o2:Ljava/util/LinkedList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedList<",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation
.end field

.field p1:Z

.field private p2:I

.field private q1:I

.field private q2:J

.field private r1:Ljava/lang/String;

.field private r2:J

.field private s1:Ljava/lang/String;

.field private s2:J

.field private t1:J

.field private t2:J

.field private u1:J

.field private u2:J

.field private v1:J

.field private v2:J

.field private w1:J

.field private w2:Z

.field private x1:J

.field private x2:J

.field private y1:J

.field private y2:I

.field private z1:I

.field private z2:Ll/s410$d;


# direct methods
.method public constructor <init>(Landroid/content/Context;Ll/q210$a;)V
    .locals 6

    .line 1
    invoke-direct {p0, p1}, Ll/grx;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const-wide/16 v0, 0x0

    .line 5
    .line 6
    iput-wide v0, p0, Ll/s410;->m1:J

    .line 7
    .line 8
    iput-wide v0, p0, Ll/s410;->n1:J

    .line 9
    .line 10
    const/4 p1, 0x0

    .line 11
    iput-boolean p1, p0, Ll/s410;->p1:Z

    .line 12
    .line 13
    iput-wide v0, p0, Ll/s410;->t1:J

    .line 14
    .line 15
    iput-wide v0, p0, Ll/s410;->u1:J

    .line 16
    .line 17
    iput-wide v0, p0, Ll/s410;->v1:J

    .line 18
    .line 19
    iput-wide v0, p0, Ll/s410;->w1:J

    .line 20
    .line 21
    iput-wide v0, p0, Ll/s410;->x1:J

    .line 22
    .line 23
    iput-wide v0, p0, Ll/s410;->y1:J

    .line 24
    .line 25
    iput p1, p0, Ll/s410;->z1:I

    .line 26
    .line 27
    iput p1, p0, Ll/s410;->A1:I

    .line 28
    .line 29
    iput p1, p0, Ll/s410;->B1:I

    .line 30
    .line 31
    iput p1, p0, Ll/s410;->C1:I

    .line 32
    .line 33
    iput p1, p0, Ll/s410;->D1:I

    .line 34
    .line 35
    iput-boolean p1, p0, Ll/s410;->E1:Z

    .line 36
    .line 37
    iput-boolean p1, p0, Ll/s410;->F1:Z

    .line 38
    .line 39
    iput-boolean p1, p0, Ll/s410;->G1:Z

    .line 40
    .line 41
    iput-boolean p1, p0, Ll/s410;->H1:Z

    .line 42
    .line 43
    iput-boolean p1, p0, Ll/s410;->I1:Z

    .line 44
    .line 45
    const/4 v2, 0x0

    .line 46
    iput-object v2, p0, Ll/s410;->K1:Ll/fb1;

    .line 47
    .line 48
    iput-wide v0, p0, Ll/s410;->M1:J

    .line 49
    .line 50
    iput-wide v0, p0, Ll/s410;->N1:J

    .line 51
    .line 52
    iput-boolean p1, p0, Ll/s410;->O1:Z

    .line 53
    .line 54
    iput-wide v0, p0, Ll/s410;->P1:J

    .line 55
    .line 56
    const-wide/16 v2, -0x82

    .line 57
    .line 58
    iput-wide v2, p0, Ll/s410;->Q1:J

    .line 59
    .line 60
    const-wide/16 v2, -0x1

    .line 61
    .line 62
    iput-wide v2, p0, Ll/s410;->R1:J

    .line 63
    .line 64
    iput-wide v2, p0, Ll/s410;->S1:J

    .line 65
    .line 66
    iput-wide v2, p0, Ll/s410;->U1:J

    .line 67
    .line 68
    iput-wide v0, p0, Ll/s410;->V1:J

    .line 69
    .line 70
    iput p1, p0, Ll/s410;->X1:I

    .line 71
    .line 72
    new-instance v4, Landroid/os/Handler;

    .line 73
    .line 74
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 75
    .line 76
    .line 77
    move-result-object v5

    .line 78
    invoke-direct {v4, v5}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 79
    .line 80
    .line 81
    iput-object v4, p0, Ll/s410;->a2:Landroid/os/Handler;

    .line 82
    .line 83
    iput p1, p0, Ll/s410;->c2:I

    .line 84
    .line 85
    iput p1, p0, Ll/s410;->d2:I

    .line 86
    .line 87
    iput-wide v0, p0, Ll/s410;->e2:J

    .line 88
    .line 89
    iput-wide v0, p0, Ll/s410;->f2:J

    .line 90
    .line 91
    iput-wide v0, p0, Ll/s410;->g2:J

    .line 92
    .line 93
    iput-boolean p1, p0, Ll/s410;->h2:Z

    .line 94
    .line 95
    iput p1, p0, Ll/s410;->i2:I

    .line 96
    .line 97
    iput-wide v2, p0, Ll/s410;->j2:J

    .line 98
    .line 99
    iput-wide v0, p0, Ll/s410;->k2:J

    .line 100
    .line 101
    iput-wide v0, p0, Ll/s410;->l2:J

    .line 102
    .line 103
    iput-boolean p1, p0, Ll/s410;->m2:Z

    .line 104
    .line 105
    new-instance v4, Ljava/util/LinkedList;

    .line 106
    .line 107
    invoke-direct {v4}, Ljava/util/LinkedList;-><init>()V

    .line 108
    .line 109
    .line 110
    iput-object v4, p0, Ll/s410;->n2:Ljava/util/LinkedList;

    .line 111
    .line 112
    new-instance v4, Ljava/util/LinkedList;

    .line 113
    .line 114
    invoke-direct {v4}, Ljava/util/LinkedList;-><init>()V

    .line 115
    .line 116
    .line 117
    iput-object v4, p0, Ll/s410;->o2:Ljava/util/LinkedList;

    .line 118
    .line 119
    iput p1, p0, Ll/s410;->p2:I

    .line 120
    .line 121
    iput-wide v2, p0, Ll/s410;->q2:J

    .line 122
    .line 123
    iput-wide v0, p0, Ll/s410;->r2:J

    .line 124
    .line 125
    iput-wide v0, p0, Ll/s410;->s2:J

    .line 126
    .line 127
    iput-wide v0, p0, Ll/s410;->t2:J

    .line 128
    .line 129
    iput-wide v0, p0, Ll/s410;->u2:J

    .line 130
    .line 131
    iput-wide v0, p0, Ll/s410;->v2:J

    .line 132
    .line 133
    iput-boolean p1, p0, Ll/s410;->w2:Z

    .line 134
    .line 135
    iput-wide v2, p0, Ll/s410;->x2:J

    .line 136
    .line 137
    const/4 v2, 0x6

    .line 138
    iput v2, p0, Ll/s410;->y2:I

    .line 139
    .line 140
    new-instance v2, Ll/s410$d;

    .line 141
    .line 142
    invoke-direct {v2, p0}, Ll/s410$d;-><init>(Ll/s410;)V

    .line 143
    .line 144
    .line 145
    iput-object v2, p0, Ll/s410;->z2:Ll/s410$d;

    .line 146
    .line 147
    iput-boolean p1, p0, Ll/s410;->A2:Z

    .line 148
    .line 149
    iput-boolean p1, p0, Ll/s410;->B2:Z

    .line 150
    .line 151
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 152
    .line 153
    .line 154
    move-result-wide v2

    .line 155
    iput-wide v2, p0, Ll/s410;->C2:J

    .line 156
    .line 157
    iput-wide v0, p0, Ll/s410;->D2:J

    .line 158
    .line 159
    const-string v2, "^rtmp://(?:\\[([0-9a-fA-F:]+)\\]|([^/:]+))(:(\\d+))*/([^/]+)(/(.*))*$"

    .line 160
    .line 161
    invoke-static {v2}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    .line 162
    .line 163
    .line 164
    move-result-object v2

    .line 165
    iput-object v2, p0, Ll/s410;->E2:Ljava/util/regex/Pattern;

    .line 166
    .line 167
    const-string v2, "^((25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$"

    .line 168
    .line 169
    invoke-static {v2}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    .line 170
    .line 171
    .line 172
    move-result-object v2

    .line 173
    iput-object v2, p0, Ll/s410;->F2:Ljava/util/regex/Pattern;

    .line 174
    .line 175
    const-string v2, "^([0-9a-fA-F]{1,4}:){7}[0-9a-fA-F]{1,4}$|^(([0-9a-fA-F]{1,4}:)*[0-9a-fA-F]{1,4})?::(([0-9a-fA-F]{1,4}:)*[0-9a-fA-F]{1,4})?$"

    .line 176
    .line 177
    invoke-static {v2}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    .line 178
    .line 179
    .line 180
    move-result-object v2

    .line 181
    iput-object v2, p0, Ll/s410;->G2:Ljava/util/regex/Pattern;

    .line 182
    .line 183
    iput-wide v0, p0, Ll/s410;->H2:J

    .line 184
    .line 185
    const-string v0, "0,-1,-1"

    .line 186
    .line 187
    iput-object v0, p0, Ll/s410;->I2:Ljava/lang/String;

    .line 188
    .line 189
    iput p1, p0, Ll/s410;->J2:I

    .line 190
    .line 191
    new-instance v0, Lcom/immomo/medialog/util/LimitedQueue;

    .line 192
    .line 193
    const/4 v1, 0x5

    .line 194
    invoke-direct {v0, v1}, Lcom/immomo/medialog/util/LimitedQueue;-><init>(I)V

    .line 195
    .line 196
    .line 197
    iput-object v0, p0, Ll/s410;->M2:Lcom/immomo/medialog/util/LimitedQueue;

    .line 198
    .line 199
    iput p1, p0, Ll/s410;->N2:I

    .line 200
    .line 201
    iput p1, p0, Ll/s410;->O2:I

    .line 202
    .line 203
    iput-object p2, p0, Ll/s410;->J1:Ll/q210$a;

    .line 204
    .line 205
    iget-object p1, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 206
    .line 207
    const-wide/16 v0, 0x100

    .line 208
    .line 209
    iput-wide v0, p1, Ll/wvx;->d:J

    .line 210
    .line 211
    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    .line 212
    .line 213
    .line 214
    move-result p0

    .line 215
    invoke-static {p0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 216
    .line 217
    .line 218
    move-result-object p0

    .line 219
    iput-object p0, p1, Ll/wvx;->e1:Ljava/lang/String;

    .line 220
    .line 221
    return-void
.end method

.method public static synthetic A3(Ll/s410;)Ll/uow;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->s:Ll/uow;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic B3(Ll/s410;)Ll/uow;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->s:Ll/uow;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic C3(Ll/s410;)Ll/uow;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->s:Ll/uow;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic D3(Ll/s410;)Ll/uow;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->s:Ll/uow;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic E3(Ll/s410;)Ll/uow;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->s:Ll/uow;

    .line 2
    .line 3
    return-object p0
.end method

.method private static E4(Ljava/lang/String;)Ljava/util/Map;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 4
    .line 5
    .line 6
    if-eqz p0, :cond_3

    .line 7
    .line 8
    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    if-eqz v1, :cond_0

    .line 13
    .line 14
    goto :goto_1

    .line 15
    :cond_0
    const/16 v1, 0x3f

    .line 16
    .line 17
    invoke-virtual {p0, v1}, Ljava/lang/String;->indexOf(I)I

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    const/4 v2, -0x1

    .line 22
    if-ne v1, v2, :cond_1

    .line 23
    .line 24
    goto :goto_1

    .line 25
    :cond_1
    add-int/lit8 v1, v1, 0x1

    .line 26
    .line 27
    invoke-virtual {p0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    const-string v1, "&"

    .line 32
    .line 33
    invoke-virtual {p0, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    array-length v1, p0

    .line 38
    const/4 v2, 0x0

    .line 39
    move v3, v2

    .line 40
    :goto_0
    if-ge v3, v1, :cond_3

    .line 41
    .line 42
    aget-object v4, p0, v3

    .line 43
    .line 44
    const-string v5, "="

    .line 45
    .line 46
    invoke-virtual {v4, v5}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    .line 47
    .line 48
    .line 49
    move-result v5

    .line 50
    if-lez v5, :cond_2

    .line 51
    .line 52
    invoke-virtual {v4, v2, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object v6

    .line 56
    const-string v7, "UTF-8"

    .line 57
    .line 58
    invoke-static {v6, v7}, Ljava/net/URLDecoder;->decode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object v6

    .line 62
    add-int/lit8 v5, v5, 0x1

    .line 63
    .line 64
    invoke-virtual {v4, v5}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object v4

    .line 68
    invoke-static {v4, v7}, Ljava/net/URLDecoder;->decode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    move-result-object v4

    .line 72
    invoke-interface {v0, v6, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 73
    .line 74
    .line 75
    :cond_2
    add-int/lit8 v3, v3, 0x1

    .line 76
    .line 77
    goto :goto_0

    .line 78
    :cond_3
    :goto_1
    return-object v0
.end method

.method public static synthetic F3(Ll/s410;)Ll/uow;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->s:Ll/uow;

    .line 2
    .line 3
    return-object p0
.end method

.method private F4()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/s410;->K2:Landroid/os/HandlerThread;

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    new-instance v0, Landroid/os/HandlerThread;

    .line 6
    .line 7
    const-string v1, "PushDetailThread"

    .line 8
    .line 9
    invoke-direct {v0, v1}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    iput-object v0, p0, Ll/s410;->K2:Landroid/os/HandlerThread;

    .line 13
    .line 14
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Ll/s410;->L2:Ll/s410$c;

    .line 18
    .line 19
    if-nez v0, :cond_0

    .line 20
    .line 21
    new-instance v0, Ll/s410$c;

    .line 22
    .line 23
    iget-object v1, p0, Ll/s410;->K2:Landroid/os/HandlerThread;

    .line 24
    .line 25
    invoke-virtual {v1}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    invoke-direct {v0, p0, v1}, Ll/s410$c;-><init>(Ll/s410;Landroid/os/Looper;)V

    .line 30
    .line 31
    .line 32
    iput-object v0, p0, Ll/s410;->L2:Ll/s410$c;

    .line 33
    .line 34
    const/16 v1, 0xca

    .line 35
    .line 36
    const-wide/16 v2, 0x3e8

    .line 37
    .line 38
    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    .line 39
    .line 40
    .line 41
    :cond_0
    new-instance v0, Ll/lob0;

    .line 42
    .line 43
    const/4 v1, 0x5

    .line 44
    invoke-direct {v0, v1}, Ll/lob0;-><init>(I)V

    .line 45
    .line 46
    .line 47
    iput-object v0, p0, Ll/s410;->Z1:Ll/lob0;

    .line 48
    .line 49
    :cond_1
    return-void
.end method

.method public static synthetic G3(Ll/s410;)Ll/uow;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->s:Ll/uow;

    .line 2
    .line 3
    return-object p0
.end method

.method private G4(Z)Z
    .locals 16

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    iget-object v1, v0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->s:Ll/uow;

    .line 4
    .line 5
    iget-wide v2, v1, Ll/uow;->J0:J

    .line 6
    .line 7
    const-wide/16 v4, 0x0

    .line 8
    .line 9
    cmp-long v6, v2, v4

    .line 10
    .line 11
    if-lez v6, :cond_0

    .line 12
    .line 13
    iget-wide v6, v1, Ll/uow;->K0:J

    .line 14
    .line 15
    cmp-long v8, v6, v4

    .line 16
    .line 17
    if-lez v8, :cond_0

    .line 18
    .line 19
    cmp-long v2, v2, v6

    .line 20
    .line 21
    if-ltz v2, :cond_1

    .line 22
    .line 23
    :cond_0
    const-wide/16 v2, 0x7d0

    .line 24
    .line 25
    iput-wide v2, v1, Ll/uow;->J0:J

    .line 26
    .line 27
    const-wide/16 v2, 0x1388

    .line 28
    .line 29
    iput-wide v2, v1, Ll/uow;->K0:J

    .line 30
    .line 31
    :cond_1
    iget-object v1, v0, Ll/s410;->l1:Lcom/immomo/mediacore/sink/IjkWriter;

    .line 32
    .line 33
    if-eqz v1, :cond_2

    .line 34
    .line 35
    const/16 v2, 0x4e27

    .line 36
    .line 37
    invoke-virtual {v1, v2, v4, v5}, Lcom/immomo/mediacore/sink/IjkWriter;->getPropertyLong(IJ)J

    .line 38
    .line 39
    .line 40
    move-result-wide v1

    .line 41
    iget-object v3, v0, Ll/s410;->l1:Lcom/immomo/mediacore/sink/IjkWriter;

    .line 42
    .line 43
    const/16 v6, 0x4e28

    .line 44
    .line 45
    invoke-virtual {v3, v6, v4, v5}, Lcom/immomo/mediacore/sink/IjkWriter;->getPropertyLong(IJ)J

    .line 46
    .line 47
    .line 48
    move-result-wide v4

    .line 49
    move-wide v14, v4

    .line 50
    move-wide v4, v1

    .line 51
    move-wide v1, v14

    .line 52
    goto :goto_0

    .line 53
    :cond_2
    move-wide v1, v4

    .line 54
    :goto_0
    iget-object v3, v0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->s:Ll/uow;

    .line 55
    .line 56
    iget-wide v6, v3, Ll/uow;->J0:J

    .line 57
    .line 58
    iget-wide v8, v3, Ll/uow;->K0:J

    .line 59
    .line 60
    iget-boolean v10, v0, Ll/s410;->h2:Z

    .line 61
    .line 62
    const/4 v11, 0x0

    .line 63
    const-wide/16 v12, 0x17

    .line 64
    .line 65
    if-eqz v10, :cond_4

    .line 66
    .line 67
    cmp-long v3, v4, v6

    .line 68
    .line 69
    if-lez v3, :cond_3

    .line 70
    .line 71
    mul-long/2addr v1, v12

    .line 72
    cmp-long v1, v1, v6

    .line 73
    .line 74
    if-gtz v1, :cond_7

    .line 75
    .line 76
    :cond_3
    if-eqz p1, :cond_7

    .line 77
    .line 78
    iput-boolean v11, v0, Ll/s410;->h2:Z

    .line 79
    .line 80
    invoke-direct {v0, v11}, Ll/s410;->n4(Z)V

    .line 81
    .line 82
    .line 83
    iget-object v1, v0, Ll/s410;->J1:Ll/q210$a;

    .line 84
    .line 85
    const/16 v2, 0x300d

    .line 86
    .line 87
    invoke-interface {v1, v2, v11, v11, v0}, Ll/q210$a;->g(IIILjava/lang/Object;)V

    .line 88
    .line 89
    .line 90
    goto :goto_3

    .line 91
    :cond_4
    cmp-long v4, v4, v8

    .line 92
    .line 93
    const/4 v5, 0x1

    .line 94
    if-ltz v4, :cond_5

    .line 95
    .line 96
    mul-long/2addr v1, v12

    .line 97
    cmp-long v1, v1, v8

    .line 98
    .line 99
    if-ltz v1, :cond_5

    .line 100
    .line 101
    move v1, v5

    .line 102
    goto :goto_1

    .line 103
    :cond_5
    move v1, v11

    .line 104
    :goto_1
    iget-boolean v2, v3, Ll/uow;->I0:Z

    .line 105
    .line 106
    if-eqz v2, :cond_6

    .line 107
    .line 108
    if-eqz v1, :cond_6

    .line 109
    .line 110
    move v1, v5

    .line 111
    goto :goto_2

    .line 112
    :cond_6
    move v1, v11

    .line 113
    :goto_2
    iput-boolean v1, v0, Ll/s410;->h2:Z

    .line 114
    .line 115
    if-eqz v1, :cond_7

    .line 116
    .line 117
    iput v11, v0, Ll/s410;->i2:I

    .line 118
    .line 119
    invoke-direct {v0, v5}, Ll/s410;->n4(Z)V

    .line 120
    .line 121
    .line 122
    iget-object v1, v0, Ll/s410;->J1:Ll/q210$a;

    .line 123
    .line 124
    const/16 v2, 0x300c

    .line 125
    .line 126
    invoke-interface {v1, v2, v11, v11, v0}, Ll/q210$a;->g(IIILjava/lang/Object;)V

    .line 127
    .line 128
    .line 129
    :cond_7
    :goto_3
    iget-boolean v0, v0, Ll/s410;->h2:Z

    .line 130
    .line 131
    return v0
.end method

.method public static synthetic H3(Ll/s410;)Ll/uow;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->s:Ll/uow;

    .line 2
    .line 3
    return-object p0
.end method

.method private H4()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/s410;->L2:Ll/s410$c;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v1, p0, Ll/s410;->K2:Landroid/os/HandlerThread;

    .line 6
    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    const/4 v1, 0x0

    .line 10
    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Ll/s410;->K2:Landroid/os/HandlerThread;

    .line 14
    .line 15
    invoke-virtual {v0}, Landroid/os/HandlerThread;->quit()Z

    .line 16
    .line 17
    .line 18
    iput-object v1, p0, Ll/s410;->L2:Ll/s410$c;

    .line 19
    .line 20
    iput-object v1, p0, Ll/s410;->K2:Landroid/os/HandlerThread;

    .line 21
    .line 22
    :cond_0
    return-void
.end method

.method public static synthetic I3(Ll/s410;)Ll/uow;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->s:Ll/uow;

    .line 2
    .line 3
    return-object p0
.end method

.method private I4(IJ)V
    .locals 4

    .line 1
    iget-wide v0, p0, Ll/s410;->H2:J

    .line 2
    .line 3
    const-wide/16 v2, 0x0

    .line 4
    .line 5
    cmp-long p1, v0, v2

    .line 6
    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    cmp-long p1, p2, v0

    .line 10
    .line 11
    if-lez p1, :cond_0

    .line 12
    .line 13
    iget-object p1, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 14
    .line 15
    sub-long v0, p2, v0

    .line 16
    .line 17
    iput-wide v0, p1, Ll/wvx;->R:J

    .line 18
    .line 19
    :cond_0
    iput-wide p2, p0, Ll/s410;->H2:J

    .line 20
    .line 21
    return-void
.end method

.method public static synthetic J3(Ll/s410;)Ll/uow;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->s:Ll/uow;

    .line 2
    .line 3
    return-object p0
.end method

.method private J4(JI)V
    .locals 5

    .line 1
    invoke-virtual {p0}, Ll/s410;->g0()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    iget-wide v2, p0, Ll/s410;->V1:J

    .line 6
    .line 7
    sub-long v2, v0, v2

    .line 8
    .line 9
    long-to-float v2, v2

    .line 10
    long-to-float p1, p1

    .line 11
    const/high16 p2, 0x447a0000    # 1000.0f

    .line 12
    .line 13
    div-float/2addr p1, p2

    .line 14
    div-float/2addr v2, p1

    .line 15
    float-to-long p1, v2

    .line 16
    const-wide/16 v2, 0x8

    .line 17
    .line 18
    mul-long/2addr p1, v2

    .line 19
    iget-object v2, p0, Ll/s410;->W1:[I

    .line 20
    .line 21
    array-length v3, v2

    .line 22
    if-nez v3, :cond_0

    .line 23
    .line 24
    return-void

    .line 25
    :cond_0
    iget v3, p0, Ll/s410;->X1:I

    .line 26
    .line 27
    array-length v4, v2

    .line 28
    if-lt v3, v4, :cond_1

    .line 29
    .line 30
    const/4 v3, 0x0

    .line 31
    iput v3, p0, Ll/s410;->X1:I

    .line 32
    .line 33
    :cond_1
    iget v3, p0, Ll/s410;->X1:I

    .line 34
    .line 35
    long-to-int p1, p1

    .line 36
    aput p1, v2, v3

    .line 37
    .line 38
    iget-object p1, p0, Ll/s410;->Y1:Lcom/immomo/medialog/util/LimitedQueue;

    .line 39
    .line 40
    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 41
    .line 42
    .line 43
    move-result-object p2

    .line 44
    invoke-virtual {p1, p2}, Lcom/immomo/medialog/util/LimitedQueue;->add(Ljava/lang/Object;)Z

    .line 45
    .line 46
    .line 47
    iget p1, p0, Ll/s410;->X1:I

    .line 48
    .line 49
    add-int/lit8 p1, p1, 0x1

    .line 50
    .line 51
    iput p1, p0, Ll/s410;->X1:I

    .line 52
    .line 53
    iput-wide v0, p0, Ll/s410;->V1:J

    .line 54
    .line 55
    return-void
.end method

.method public static synthetic K3(Ll/s410;)Ll/uow;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->s:Ll/uow;

    .line 2
    .line 3
    return-object p0
.end method

.method private K4(Z)V
    .locals 16

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    iget-object v1, v0, Ll/s410;->n2:Ljava/util/LinkedList;

    .line 4
    .line 5
    invoke-virtual {v1}, Ljava/util/LinkedList;->size()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    if-lez v1, :cond_4

    .line 10
    .line 11
    iget-object v1, v0, Ll/s410;->o2:Ljava/util/LinkedList;

    .line 12
    .line 13
    invoke-virtual {v1}, Ljava/util/LinkedList;->size()I

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    if-lez v1, :cond_4

    .line 18
    .line 19
    const/4 v1, 0x0

    .line 20
    move v2, v1

    .line 21
    :goto_0
    iget-object v3, v0, Ll/s410;->n2:Ljava/util/LinkedList;

    .line 22
    .line 23
    invoke-virtual {v3}, Ljava/util/LinkedList;->size()I

    .line 24
    .line 25
    .line 26
    move-result v3

    .line 27
    if-ge v2, v3, :cond_3

    .line 28
    .line 29
    iget-object v3, v0, Ll/s410;->n2:Ljava/util/LinkedList;

    .line 30
    .line 31
    invoke-virtual {v3, v2}, Ljava/util/LinkedList;->get(I)Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    move-result-object v3

    .line 35
    check-cast v3, Ll/s410$b;

    .line 36
    .line 37
    iget v4, v3, Ll/s410$b;->d:I

    .line 38
    .line 39
    if-eqz v4, :cond_1

    .line 40
    .line 41
    const/4 v5, 0x5

    .line 42
    if-ne v4, v5, :cond_0

    .line 43
    .line 44
    goto :goto_1

    .line 45
    :cond_0
    iget-object v4, v0, Ll/s410;->o2:Ljava/util/LinkedList;

    .line 46
    .line 47
    invoke-virtual {v4}, Ljava/util/LinkedList;->removeFirst()Ljava/lang/Object;

    .line 48
    .line 49
    .line 50
    move-result-object v4

    .line 51
    check-cast v4, Ljava/lang/Long;

    .line 52
    .line 53
    invoke-virtual {v4}, Ljava/lang/Long;->longValue()J

    .line 54
    .line 55
    .line 56
    move-result-wide v4

    .line 57
    iput-wide v4, v3, Ll/s410$b;->b:J

    .line 58
    .line 59
    goto :goto_2

    .line 60
    :cond_1
    :goto_1
    iget-object v4, v0, Ll/s410;->o2:Ljava/util/LinkedList;

    .line 61
    .line 62
    invoke-virtual {v4}, Ljava/util/LinkedList;->removeLast()Ljava/lang/Object;

    .line 63
    .line 64
    .line 65
    move-result-object v4

    .line 66
    check-cast v4, Ljava/lang/Long;

    .line 67
    .line 68
    invoke-virtual {v4}, Ljava/lang/Long;->longValue()J

    .line 69
    .line 70
    .line 71
    move-result-wide v4

    .line 72
    iput-wide v4, v3, Ll/s410$b;->b:J

    .line 73
    .line 74
    :goto_2
    iget-wide v4, v3, Ll/s410$b;->c:J

    .line 75
    .line 76
    iget-wide v6, v0, Ll/s410;->Q1:J

    .line 77
    .line 78
    add-long v9, v4, v6

    .line 79
    .line 80
    iget-wide v4, v3, Ll/s410$b;->b:J

    .line 81
    .line 82
    sub-long v6, v9, v4

    .line 83
    .line 84
    iget-wide v11, v0, Ll/s410;->P1:J

    .line 85
    .line 86
    cmp-long v6, v6, v11

    .line 87
    .line 88
    if-lez v6, :cond_2

    .line 89
    .line 90
    sub-long v4, v9, v4

    .line 91
    .line 92
    iput-wide v4, v0, Ll/s410;->P1:J

    .line 93
    .line 94
    :cond_2
    new-instance v4, Ljava/lang/StringBuilder;

    .line 95
    .line 96
    const-string v5, "writeSampleData 1: src dts:"

    .line 97
    .line 98
    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 99
    .line 100
    .line 101
    invoke-virtual {v4, v9, v10}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 102
    .line 103
    .line 104
    const-string v5, ", pts:"

    .line 105
    .line 106
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 107
    .line 108
    .line 109
    iget-wide v5, v3, Ll/s410$b;->b:J

    .line 110
    .line 111
    iget-wide v7, v0, Ll/s410;->P1:J

    .line 112
    .line 113
    add-long/2addr v5, v7

    .line 114
    invoke-virtual {v4, v5, v6}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 115
    .line 116
    .line 117
    const-string v5, ", deltaDts:"

    .line 118
    .line 119
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 120
    .line 121
    .line 122
    iget-wide v5, v0, Ll/s410;->Q1:J

    .line 123
    .line 124
    invoke-virtual {v4, v5, v6}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 125
    .line 126
    .line 127
    const-string v5, ",diffdts: "

    .line 128
    .line 129
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 130
    .line 131
    .line 132
    iget-wide v5, v0, Ll/s410;->P1:J

    .line 133
    .line 134
    invoke-virtual {v4, v5, v6}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 135
    .line 136
    .line 137
    const-string v5, ", frame Type: BP"

    .line 138
    .line 139
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 140
    .line 141
    .line 142
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 143
    .line 144
    .line 145
    move-result-object v4

    .line 146
    const-string v5, "huohl"

    .line 147
    .line 148
    invoke-static {v5, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 149
    .line 150
    .line 151
    iget-object v4, v3, Ll/s410$b;->a:Ljava/nio/ByteBuffer;

    .line 152
    .line 153
    invoke-virtual {v4}, Ljava/nio/Buffer;->limit()I

    .line 154
    .line 155
    .line 156
    move-result v5

    .line 157
    invoke-virtual {v0, v4, v5, v1}, Ll/grx;->B2(Ljava/nio/ByteBuffer;IZ)Ljava/nio/ByteBuffer;

    .line 158
    .line 159
    .line 160
    move-result-object v13

    .line 161
    invoke-virtual {v13}, Ljava/nio/ByteBuffer;->flip()Ljava/nio/Buffer;

    .line 162
    .line 163
    .line 164
    iget-object v8, v0, Ll/s410;->l1:Lcom/immomo/mediacore/sink/IjkWriter;

    .line 165
    .line 166
    iget-wide v3, v3, Ll/s410$b;->b:J

    .line 167
    .line 168
    iget-wide v5, v0, Ll/s410;->P1:J

    .line 169
    .line 170
    add-long v11, v3, v5

    .line 171
    .line 172
    invoke-virtual {v13}, Ljava/nio/Buffer;->limit()I

    .line 173
    .line 174
    .line 175
    move-result v14

    .line 176
    move/from16 v15, p1

    .line 177
    .line 178
    invoke-virtual/range {v8 .. v15}, Lcom/immomo/mediacore/sink/IjkWriter;->writeVideoPacket2(JJLjava/nio/ByteBuffer;IZ)V

    .line 179
    .line 180
    .line 181
    iget-wide v3, v0, Ll/s410;->t1:J

    .line 182
    .line 183
    invoke-virtual {v13}, Ljava/nio/Buffer;->limit()I

    .line 184
    .line 185
    .line 186
    move-result v5

    .line 187
    int-to-long v5, v5

    .line 188
    add-long/2addr v3, v5

    .line 189
    iput-wide v3, v0, Ll/s410;->t1:J

    .line 190
    .line 191
    iget-wide v3, v0, Ll/s410;->v1:J

    .line 192
    .line 193
    const-wide/16 v5, 0x1

    .line 194
    .line 195
    add-long/2addr v3, v5

    .line 196
    iput-wide v3, v0, Ll/s410;->v1:J

    .line 197
    .line 198
    add-int/lit8 v2, v2, 0x1

    .line 199
    .line 200
    goto/16 :goto_0

    .line 201
    .line 202
    :cond_3
    iget-object v1, v0, Ll/s410;->o2:Ljava/util/LinkedList;

    .line 203
    .line 204
    invoke-virtual {v1}, Ljava/util/LinkedList;->clear()V

    .line 205
    .line 206
    .line 207
    iget-object v0, v0, Ll/s410;->n2:Ljava/util/LinkedList;

    .line 208
    .line 209
    invoke-virtual {v0}, Ljava/util/LinkedList;->clear()V

    .line 210
    .line 211
    .line 212
    :cond_4
    return-void
.end method

.method public static synthetic L3(Ll/s410;)Ll/uow;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->s:Ll/uow;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic M3(Ll/s410;)Ll/uow;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->s:Ll/uow;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic N3(Ll/s410;)Ll/uow;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->s:Ll/uow;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic O3(Ll/s410;)I
    .locals 0

    .line 1
    iget p0, p0, Ll/s410;->N2:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic P3(Ll/s410;I)I
    .locals 0

    .line 1
    iput p1, p0, Ll/s410;->N2:I

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic Q3(Ll/s410;)I
    .locals 0

    .line 1
    iget p0, p0, Ll/s410;->O2:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic R3(Ll/s410;I)I
    .locals 0

    .line 1
    iput p1, p0, Ll/s410;->O2:I

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic S3(Ll/s410;)Ll/lob0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/s410;->Z1:Ll/lob0;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic T3(Ll/s410;)Ll/uow;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->s:Ll/uow;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic U2(Ll/s410;)Ll/uow;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->s:Ll/uow;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic U3(Ll/s410;II)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Ll/s410;->w4(II)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic V2(Ll/s410;I)I
    .locals 0

    .line 1
    iput p1, p0, Ll/s410;->c2:I

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic V3(Ll/s410;)Ll/uow;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->s:Ll/uow;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic W2(Ll/s410;I)I
    .locals 0

    .line 1
    iput p1, p0, Ll/s410;->d2:I

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic W3(Ll/s410;)Ll/uow;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->s:Ll/uow;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic X2(Ll/s410;)Ll/wvx;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic Y2(Ll/s410;)Ll/uow;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->s:Ll/uow;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic Z2(Ll/s410;)Ll/uow;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->s:Ll/uow;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic a3(Ll/s410;)Ll/uow;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->s:Ll/uow;

    .line 2
    .line 3
    return-object p0
.end method

.method private a4(Ll/uow;)I
    .locals 3

    .line 1
    invoke-static {}, Ll/csx;->R()Ll/csx;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ll/csx;->Z0()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-nez p0, :cond_1

    .line 10
    .line 11
    invoke-static {}, Ll/csx;->R()Ll/csx;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-virtual {p0}, Ll/csx;->D0()Ljava/util/List;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    :cond_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-eqz v0, :cond_2

    .line 28
    .line 29
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    check-cast v0, Ll/csx$b;

    .line 34
    .line 35
    iget v1, p1, Ll/tow;->m:I

    .line 36
    .line 37
    invoke-virtual {v0}, Ll/csx$b;->g()I

    .line 38
    .line 39
    .line 40
    move-result v2

    .line 41
    if-ne v1, v2, :cond_0

    .line 42
    .line 43
    iget v1, p1, Ll/tow;->n:I

    .line 44
    .line 45
    invoke-virtual {v0}, Ll/csx$b;->f()I

    .line 46
    .line 47
    .line 48
    move-result v2

    .line 49
    if-ne v1, v2, :cond_0

    .line 50
    .line 51
    invoke-virtual {v0}, Ll/csx$b;->b()Ljava/lang/Integer;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 56
    .line 57
    .line 58
    move-result p0

    .line 59
    return p0

    .line 60
    :cond_1
    invoke-static {}, Ll/b7y;->c()Ll/b7y;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    const-string v0, "isAdaptSizeListEmpty is null"

    .line 65
    .line 66
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    invoke-virtual {p0, v0}, Ll/b7y;->g([Ljava/lang/Object;)V

    .line 71
    .line 72
    .line 73
    :cond_2
    iget p0, p1, Ll/tow;->H:I

    .line 74
    .line 75
    return p0
.end method

.method public static synthetic b3(Ll/s410;)[I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/s410;->W1:[I

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic c3(Ll/s410;)Ll/uow;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->s:Ll/uow;

    .line 2
    .line 3
    return-object p0
.end method

.method private c4()Ljava/lang/String;
    .locals 4

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "["

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v1, p0, Ll/s410;->M2:Lcom/immomo/medialog/util/LimitedQueue;

    .line 9
    .line 10
    invoke-virtual {v1}, Ljava/util/AbstractCollection;->iterator()Ljava/util/Iterator;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    const/4 v2, 0x0

    .line 15
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 16
    .line 17
    .line 18
    move-result v3

    .line 19
    if-eqz v3, :cond_1

    .line 20
    .line 21
    if-eqz v2, :cond_0

    .line 22
    .line 23
    const-string v3, ","

    .line 24
    .line 25
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object v3

    .line 32
    filled-new-array {v3}, [Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    move-result-object v3

    .line 36
    invoke-direct {p0, v3}, Ll/s410;->p4([Ljava/lang/Object;)Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object v3

    .line 40
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    add-int/lit8 v2, v2, 0x1

    .line 44
    .line 45
    goto :goto_0

    .line 46
    :cond_1
    const-string p0, "]"

    .line 47
    .line 48
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 49
    .line 50
    .line 51
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    return-object p0
.end method

.method public static synthetic d3(Ll/s410;Ll/uow;)I
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/s410;->a4(Ll/uow;)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method private d4()Z
    .locals 1

    .line 1
    iget-object p0, p0, Ll/s410;->l1:Lcom/immomo/mediacore/sink/IjkWriter;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/immomo/mediacore/sink/IjkWriter;->getAdapt()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    const/4 v0, 0x1

    .line 10
    if-ne p0, v0, :cond_0

    .line 11
    .line 12
    return v0

    .line 13
    :cond_0
    const/4 p0, 0x0

    .line 14
    return p0
.end method

.method public static synthetic e3(Ll/s410;)J
    .locals 2

    .line 1
    iget-wide v0, p0, Ll/s410;->u2:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public static synthetic f3(Ll/s410;)Ll/uow;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->s:Ll/uow;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic g3(Ll/s410;J)J
    .locals 0

    .line 1
    iput-wide p1, p0, Ll/s410;->u2:J

    .line 2
    .line 3
    return-wide p1
.end method

.method public static synthetic h3(Ll/s410;)Ll/uow;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->s:Ll/uow;

    .line 2
    .line 3
    return-object p0
.end method

.method private h4(II)Ljava/lang/String;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public static synthetic i3(Ll/s410;)J
    .locals 2

    .line 1
    iget-wide v0, p0, Ll/s410;->v2:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public static synthetic j3(Ll/s410;J)J
    .locals 0

    .line 1
    iput-wide p1, p0, Ll/s410;->v2:J

    .line 2
    .line 3
    return-wide p1
.end method

.method public static synthetic k3(Ll/s410;)J
    .locals 4

    .line 1
    iget-wide v0, p0, Ll/s410;->v2:J

    .line 2
    .line 3
    const-wide/16 v2, 0x1

    .line 4
    .line 5
    add-long/2addr v2, v0

    .line 6
    iput-wide v2, p0, Ll/s410;->v2:J

    .line 7
    .line 8
    return-wide v0
.end method

.method private k4()Ljava/lang/String;
    .locals 3

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "["

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Ll/s410;->Y1:Lcom/immomo/medialog/util/LimitedQueue;

    .line 9
    .line 10
    invoke-virtual {p0}, Ljava/util/AbstractCollection;->iterator()Ljava/util/Iterator;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    const/4 v1, 0x0

    .line 15
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 16
    .line 17
    .line 18
    move-result v2

    .line 19
    if-eqz v2, :cond_1

    .line 20
    .line 21
    if-eqz v1, :cond_0

    .line 22
    .line 23
    const-string v2, ","

    .line 24
    .line 25
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    :cond_0
    const-string v2, "("

    .line 29
    .line 30
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object v2

    .line 37
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 38
    .line 39
    .line 40
    const-string v2, ")"

    .line 41
    .line 42
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 43
    .line 44
    .line 45
    add-int/lit8 v1, v1, 0x1

    .line 46
    .line 47
    goto :goto_0

    .line 48
    :cond_1
    const-string p0, "]"

    .line 49
    .line 50
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 51
    .line 52
    .line 53
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    return-object p0
.end method

.method public static synthetic l3(Ll/s410;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/s410;->w2:Z

    .line 2
    .line 3
    return p0
.end method

.method private l4(Ljava/lang/String;)V
    .locals 3

    .line 1
    const-string v0, "handleMtagFromUrl"

    .line 2
    .line 3
    const-string v1, "mtag="

    .line 4
    .line 5
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result v2

    .line 9
    if-eqz v2, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    :try_start_0
    invoke-static {p1}, Ll/s410;->E4(Ljava/lang/String;)Ljava/util/Map;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    const-string v2, "mtag"

    .line 17
    .line 18
    invoke-interface {p1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    check-cast p1, Ljava/lang/String;

    .line 23
    .line 24
    if-eqz p1, :cond_1

    .line 25
    .line 26
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 27
    .line 28
    .line 29
    move-result v2

    .line 30
    if-nez v2, :cond_1

    .line 31
    .line 32
    invoke-virtual {p0, p1}, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->m2(Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    iget-object v2, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->I:Ll/evx;

    .line 36
    .line 37
    invoke-virtual {v1, p1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    filled-new-array {v0, p1}, [Ljava/lang/Object;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    invoke-virtual {v2, p1}, Ll/evx;->l([Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 46
    .line 47
    .line 48
    return-void

    .line 49
    :catch_0
    move-exception p1

    .line 50
    goto :goto_1

    .line 51
    :cond_1
    :goto_0
    return-void

    .line 52
    :goto_1
    iget-object p0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->I:Ll/evx;

    .line 53
    .line 54
    new-instance v1, Ljava/lang/StringBuilder;

    .line 55
    .line 56
    const-string v2, "parse failed: "

    .line 57
    .line 58
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 59
    .line 60
    .line 61
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 62
    .line 63
    .line 64
    move-result-object p1

    .line 65
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 66
    .line 67
    .line 68
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    move-result-object p1

    .line 72
    filled-new-array {v0, p1}, [Ljava/lang/Object;

    .line 73
    .line 74
    .line 75
    move-result-object p1

    .line 76
    invoke-virtual {p0, p1}, Ll/evx;->l([Ljava/lang/Object;)V

    .line 77
    .line 78
    .line 79
    return-void
.end method

.method public static synthetic m3(Ll/s410;)Ll/wvx;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 2
    .line 3
    return-object p0
.end method

.method private m4(Ljava/lang/String;)Z
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    if-eqz p1, :cond_3

    .line 3
    .line 4
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 5
    .line 6
    .line 7
    move-result v1

    .line 8
    if-eqz v1, :cond_0

    .line 9
    .line 10
    goto :goto_1

    .line 11
    :cond_0
    iget-object v1, p0, Ll/s410;->F2:Ljava/util/regex/Pattern;

    .line 12
    .line 13
    invoke-virtual {v1, p1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-virtual {v1}, Ljava/util/regex/Matcher;->matches()Z

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    if-nez v1, :cond_2

    .line 22
    .line 23
    iget-object p0, p0, Ll/s410;->G2:Ljava/util/regex/Pattern;

    .line 24
    .line 25
    invoke-virtual {p0, p1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    invoke-virtual {p0}, Ljava/util/regex/Matcher;->matches()Z

    .line 30
    .line 31
    .line 32
    move-result p0

    .line 33
    if-eqz p0, :cond_1

    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_1
    return v0

    .line 37
    :cond_2
    :goto_0
    const/4 p0, 0x1

    .line 38
    return p0

    .line 39
    :cond_3
    :goto_1
    return v0
.end method

.method public static synthetic n3(Ll/s410;)Ll/uow;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->s:Ll/uow;

    .line 2
    .line 3
    return-object p0
.end method

.method private n4(Z)V
    .locals 11

    .line 1
    invoke-virtual {p0}, Ll/s410;->J0()J

    .line 2
    .line 3
    .line 4
    move-result-wide v1

    .line 5
    invoke-virtual {p0}, Ll/s410;->X0()J

    .line 6
    .line 7
    .line 8
    move-result-wide v3

    .line 9
    invoke-virtual {p0}, Ll/s410;->u1()J

    .line 10
    .line 11
    .line 12
    move-result-wide v5

    .line 13
    invoke-virtual {p0}, Ll/s410;->D0()J

    .line 14
    .line 15
    .line 16
    move-result-wide v7

    .line 17
    if-eqz p1, :cond_0

    .line 18
    .line 19
    iget-object v0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->I:Ll/evx;

    .line 20
    .line 21
    invoke-virtual/range {v0 .. v8}, Ll/evx;->y(JJJJ)V

    .line 22
    .line 23
    .line 24
    return-void

    .line 25
    :cond_0
    invoke-virtual {p0}, Ll/s410;->b4()I

    .line 26
    .line 27
    .line 28
    move-result p1

    .line 29
    int-to-long v9, p1

    .line 30
    iget-object v0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->I:Ll/evx;

    .line 31
    .line 32
    invoke-virtual/range {v0 .. v10}, Ll/evx;->z(JJJJJ)V

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public static synthetic o3(Ll/s410;)Ll/uow;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->s:Ll/uow;

    .line 2
    .line 3
    return-object p0
.end method

.method private o4(II)V
    .locals 31

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    move/from16 v2, p2

    .line 5
    .line 6
    if-ne v2, v1, :cond_0

    .line 7
    .line 8
    const-string v1, "downshift"

    .line 9
    .line 10
    :goto_0
    move-object v12, v1

    .line 11
    goto :goto_1

    .line 12
    :cond_0
    if-nez p1, :cond_1

    .line 13
    .line 14
    const-string v1, "up"

    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_1
    const-string v1, "down"

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :goto_1
    invoke-virtual {v0}, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->Z1()Ll/uow;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    iget v1, v1, Ll/tow;->m:I

    .line 25
    .line 26
    invoke-virtual {v0}, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->Z1()Ll/uow;

    .line 27
    .line 28
    .line 29
    move-result-object v2

    .line 30
    iget v2, v2, Ll/tow;->n:I

    .line 31
    .line 32
    invoke-virtual {v0}, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->Z1()Ll/uow;

    .line 33
    .line 34
    .line 35
    move-result-object v3

    .line 36
    iget v3, v3, Ll/tow;->H:I

    .line 37
    .line 38
    invoke-virtual {v0}, Ll/s410;->Y0()I

    .line 39
    .line 40
    .line 41
    move-result v4

    .line 42
    mul-int/lit16 v4, v4, 0x3e8

    .line 43
    .line 44
    iget-object v5, v0, Ll/s410;->z2:Ll/s410$d;

    .line 45
    .line 46
    invoke-static {v5}, Ll/s410$d;->b(Ll/s410$d;)I

    .line 47
    .line 48
    .line 49
    move-result v5

    .line 50
    invoke-virtual {v0}, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->Z1()Ll/uow;

    .line 51
    .line 52
    .line 53
    move-result-object v6

    .line 54
    iget v6, v6, Ll/uow;->E0:I

    .line 55
    .line 56
    invoke-static {}, Ll/csx;->R()Ll/csx;

    .line 57
    .line 58
    .line 59
    move-result-object v7

    .line 60
    invoke-virtual {v7}, Ll/csx;->z()I

    .line 61
    .line 62
    .line 63
    move-result v25

    .line 64
    invoke-static {}, Ll/csx;->R()Ll/csx;

    .line 65
    .line 66
    .line 67
    move-result-object v7

    .line 68
    invoke-virtual {v7}, Ll/csx;->v()I

    .line 69
    .line 70
    .line 71
    move-result v26

    .line 72
    invoke-static {}, Ll/csx;->R()Ll/csx;

    .line 73
    .line 74
    .line 75
    move-result-object v7

    .line 76
    invoke-virtual {v7}, Ll/csx;->s0()I

    .line 77
    .line 78
    .line 79
    move-result v27

    .line 80
    invoke-static {}, Ll/csx;->R()Ll/csx;

    .line 81
    .line 82
    .line 83
    move-result-object v7

    .line 84
    invoke-virtual {v7}, Ll/csx;->A()I

    .line 85
    .line 86
    .line 87
    move-result v28

    .line 88
    iget-object v7, v0, Ll/s410;->Z1:Ll/lob0;

    .line 89
    .line 90
    if-nez v7, :cond_2

    .line 91
    .line 92
    const-string v7, ""

    .line 93
    .line 94
    :goto_2
    move-object/from16 v30, v7

    .line 95
    .line 96
    goto :goto_3

    .line 97
    :cond_2
    invoke-virtual {v7}, Ll/lob0;->a()Ljava/lang/String;

    .line 98
    .line 99
    .line 100
    move-result-object v7

    .line 101
    goto :goto_2

    .line 102
    :goto_3
    invoke-direct {v0}, Ll/s410;->k4()Ljava/lang/String;

    .line 103
    .line 104
    .line 105
    move-result-object v29

    .line 106
    iget-object v0, v0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->I:Ll/evx;

    .line 107
    .line 108
    int-to-long v13, v1

    .line 109
    int-to-long v1, v2

    .line 110
    int-to-long v7, v3

    .line 111
    int-to-long v3, v4

    .line 112
    int-to-long v9, v5

    .line 113
    int-to-long v5, v6

    .line 114
    move-wide/from16 v19, v3

    .line 115
    .line 116
    const/4 v3, 0x0

    .line 117
    move-wide/from16 v23, v5

    .line 118
    .line 119
    const-wide/16 v4, 0x0

    .line 120
    .line 121
    move-wide/from16 v17, v7

    .line 122
    .line 123
    const-wide/16 v6, 0x0

    .line 124
    .line 125
    move-wide/from16 v21, v9

    .line 126
    .line 127
    const-wide/16 v8, 0x0

    .line 128
    .line 129
    const-wide/16 v10, 0x0

    .line 130
    .line 131
    move-wide v15, v1

    .line 132
    move-object v2, v0

    .line 133
    invoke-virtual/range {v2 .. v30}, Ll/evx;->A(ZJJJJLjava/lang/String;JJJJJJIIIILjava/lang/String;Ljava/lang/String;)V

    .line 134
    .line 135
    .line 136
    return-void
.end method

.method public static synthetic p3(Ll/s410;)Ll/uow;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->s:Ll/uow;

    .line 2
    .line 3
    return-object p0
.end method

.method private varargs p4([Ljava/lang/Object;)Ljava/lang/String;
    .locals 2

    .line 1
    new-instance p0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v0, "("

    .line 4
    .line 5
    invoke-direct {p0, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    if-eqz p1, :cond_1

    .line 9
    .line 10
    const/4 v0, 0x0

    .line 11
    :goto_0
    array-length v1, p1

    .line 12
    if-ge v0, v1, :cond_1

    .line 13
    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    const-string v1, ","

    .line 17
    .line 18
    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    :cond_0
    aget-object v1, p1, v0

    .line 22
    .line 23
    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    add-int/lit8 v0, v0, 0x1

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_1
    const-string p1, ")"

    .line 30
    .line 31
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    return-object p0
.end method

.method public static synthetic q3(Ll/s410;)Ll/uow;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->s:Ll/uow;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic r3(Ll/s410;)Ll/uow;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->s:Ll/uow;

    .line 2
    .line 3
    return-object p0
.end method

.method private r4()V
    .locals 18

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    invoke-static {}, Ll/csx;->R()Ll/csx;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-virtual {v1}, Ll/csx;->f0()Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    const-wide/16 v2, 0x3

    .line 12
    .line 13
    const-wide/16 v4, 0x0

    .line 14
    .line 15
    if-eqz v1, :cond_d

    .line 16
    .line 17
    iget-object v1, v0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->s:Ll/uow;

    .line 18
    .line 19
    iget v1, v1, Ll/tow;->F:I

    .line 20
    .line 21
    mul-int/lit8 v1, v1, 0x1e

    .line 22
    .line 23
    int-to-long v6, v1

    .line 24
    iget-wide v8, v0, Ll/s410;->v1:J

    .line 25
    .line 26
    cmp-long v1, v6, v8

    .line 27
    .line 28
    if-gtz v1, :cond_d

    .line 29
    .line 30
    iget-boolean v1, v0, Ll/s410;->H1:Z

    .line 31
    .line 32
    if-nez v1, :cond_d

    .line 33
    .line 34
    iget-object v1, v0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 35
    .line 36
    iget-wide v6, v1, Ll/wvx;->g1:J

    .line 37
    .line 38
    cmp-long v1, v6, v2

    .line 39
    .line 40
    if-ltz v1, :cond_0

    .line 41
    .line 42
    goto/16 :goto_3

    .line 43
    .line 44
    :cond_0
    iget-wide v1, v0, Ll/s410;->q2:J

    .line 45
    .line 46
    const-wide/16 v6, -0x1

    .line 47
    .line 48
    cmp-long v1, v1, v6

    .line 49
    .line 50
    if-nez v1, :cond_1

    .line 51
    .line 52
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 53
    .line 54
    .line 55
    move-result-wide v1

    .line 56
    iput-wide v1, v0, Ll/s410;->q2:J

    .line 57
    .line 58
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 59
    .line 60
    .line 61
    move-result-wide v1

    .line 62
    iput-wide v1, v0, Ll/s410;->x2:J

    .line 63
    .line 64
    :cond_1
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 65
    .line 66
    .line 67
    move-result-wide v1

    .line 68
    iget-wide v8, v0, Ll/s410;->q2:J

    .line 69
    .line 70
    sub-long/2addr v1, v8

    .line 71
    cmp-long v3, v1, v4

    .line 72
    .line 73
    const/4 v8, 0x1

    .line 74
    const/4 v9, 0x0

    .line 75
    if-lez v3, :cond_c

    .line 76
    .line 77
    invoke-static {}, Ll/csx;->R()Ll/csx;

    .line 78
    .line 79
    .line 80
    move-result-object v3

    .line 81
    invoke-virtual {v3}, Ll/csx;->z()I

    .line 82
    .line 83
    .line 84
    move-result v3

    .line 85
    int-to-long v10, v3

    .line 86
    cmp-long v3, v1, v10

    .line 87
    .line 88
    if-ltz v3, :cond_c

    .line 89
    .line 90
    iget-object v3, v0, Ll/s410;->l1:Lcom/immomo/mediacore/sink/IjkWriter;

    .line 91
    .line 92
    if-eqz v3, :cond_2

    .line 93
    .line 94
    const/16 v6, 0x4e28

    .line 95
    .line 96
    invoke-virtual {v3, v6, v4, v5}, Lcom/immomo/mediacore/sink/IjkWriter;->getPropertyLong(IJ)J

    .line 97
    .line 98
    .line 99
    move-result-wide v6

    .line 100
    iget-object v3, v0, Ll/s410;->l1:Lcom/immomo/mediacore/sink/IjkWriter;

    .line 101
    .line 102
    const/16 v10, 0x4e25

    .line 103
    .line 104
    invoke-virtual {v3, v10, v4, v5}, Lcom/immomo/mediacore/sink/IjkWriter;->getPropertyLong(IJ)J

    .line 105
    .line 106
    .line 107
    :cond_2
    invoke-static {}, Ll/csx;->R()Ll/csx;

    .line 108
    .line 109
    .line 110
    move-result-object v3

    .line 111
    invoke-virtual {v3}, Ll/csx;->v()I

    .line 112
    .line 113
    .line 114
    move-result v3

    .line 115
    const-wide/16 v10, 0x17

    .line 116
    .line 117
    mul-long/2addr v6, v10

    .line 118
    int-to-long v10, v3

    .line 119
    cmp-long v3, v6, v10

    .line 120
    .line 121
    if-ltz v3, :cond_3

    .line 122
    .line 123
    move v3, v8

    .line 124
    goto :goto_0

    .line 125
    :cond_3
    move v3, v9

    .line 126
    :goto_0
    invoke-static {}, Ll/csx;->R()Ll/csx;

    .line 127
    .line 128
    .line 129
    move-result-object v10

    .line 130
    invoke-virtual {v10}, Ll/csx;->s0()I

    .line 131
    .line 132
    .line 133
    move-result v10

    .line 134
    invoke-static {}, Ll/csx;->R()Ll/csx;

    .line 135
    .line 136
    .line 137
    move-result-object v11

    .line 138
    invoke-virtual {v11}, Ll/csx;->A()I

    .line 139
    .line 140
    .line 141
    move-result v11

    .line 142
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 143
    .line 144
    .line 145
    move-result-wide v12

    .line 146
    iput-wide v12, v0, Ll/s410;->q2:J

    .line 147
    .line 148
    int-to-long v11, v11

    .line 149
    cmp-long v11, v6, v11

    .line 150
    .line 151
    if-lez v11, :cond_4

    .line 152
    .line 153
    iget-wide v14, v0, Ll/s410;->t2:J

    .line 154
    .line 155
    cmp-long v11, v6, v14

    .line 156
    .line 157
    if-gtz v11, :cond_5

    .line 158
    .line 159
    :cond_4
    if-eqz v3, :cond_6

    .line 160
    .line 161
    :cond_5
    iget-wide v14, v0, Ll/s410;->s2:J

    .line 162
    .line 163
    const-wide/16 v16, 0x1

    .line 164
    .line 165
    add-long v12, v14, v16

    .line 166
    .line 167
    iput-wide v12, v0, Ll/s410;->s2:J

    .line 168
    .line 169
    if-eqz v3, :cond_7

    .line 170
    .line 171
    const-wide/16 v11, 0x2

    .line 172
    .line 173
    add-long/2addr v14, v11

    .line 174
    iput-wide v14, v0, Ll/s410;->s2:J

    .line 175
    .line 176
    goto :goto_1

    .line 177
    :cond_6
    const-wide/16 v16, 0x1

    .line 178
    .line 179
    iput-wide v4, v0, Ll/s410;->s2:J

    .line 180
    .line 181
    :cond_7
    :goto_1
    long-to-int v3, v6

    .line 182
    invoke-direct {v0, v1, v2, v3}, Ll/s410;->J4(JI)V

    .line 183
    .line 184
    .line 185
    iget-wide v1, v0, Ll/s410;->s2:J

    .line 186
    .line 187
    invoke-static {}, Ll/csx;->R()Ll/csx;

    .line 188
    .line 189
    .line 190
    move-result-object v3

    .line 191
    invoke-virtual {v3}, Ll/csx;->U()I

    .line 192
    .line 193
    .line 194
    move-result v3

    .line 195
    int-to-long v11, v3

    .line 196
    cmp-long v1, v1, v11

    .line 197
    .line 198
    if-lez v1, :cond_8

    .line 199
    .line 200
    invoke-static {}, Ll/csx;->R()Ll/csx;

    .line 201
    .line 202
    .line 203
    move-result-object v1

    .line 204
    invoke-virtual {v1}, Ll/csx;->U()I

    .line 205
    .line 206
    .line 207
    move-result v1

    .line 208
    int-to-long v1, v1

    .line 209
    iput-wide v1, v0, Ll/s410;->s2:J

    .line 210
    .line 211
    :cond_8
    iput-wide v6, v0, Ll/s410;->t2:J

    .line 212
    .line 213
    int-to-long v1, v10

    .line 214
    cmp-long v1, v6, v1

    .line 215
    .line 216
    if-gtz v1, :cond_9

    .line 217
    .line 218
    iget-wide v1, v0, Ll/s410;->u2:J

    .line 219
    .line 220
    add-long v1, v1, v16

    .line 221
    .line 222
    iput-wide v1, v0, Ll/s410;->u2:J

    .line 223
    .line 224
    goto :goto_2

    .line 225
    :cond_9
    iput-wide v4, v0, Ll/s410;->u2:J

    .line 226
    .line 227
    :goto_2
    iget-boolean v1, v0, Ll/s410;->w2:Z

    .line 228
    .line 229
    if-nez v1, :cond_b

    .line 230
    .line 231
    iget-wide v1, v0, Ll/s410;->s2:J

    .line 232
    .line 233
    cmp-long v3, v1, v4

    .line 234
    .line 235
    if-eqz v3, :cond_b

    .line 236
    .line 237
    invoke-static {}, Ll/csx;->R()Ll/csx;

    .line 238
    .line 239
    .line 240
    move-result-object v3

    .line 241
    invoke-virtual {v3}, Ll/csx;->U()I

    .line 242
    .line 243
    .line 244
    move-result v3

    .line 245
    int-to-long v6, v3

    .line 246
    rem-long/2addr v1, v6

    .line 247
    cmp-long v1, v1, v4

    .line 248
    .line 249
    if-nez v1, :cond_b

    .line 250
    .line 251
    iget-object v1, v0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->s:Ll/uow;

    .line 252
    .line 253
    invoke-virtual {v1}, Ll/uow;->c()Z

    .line 254
    .line 255
    .line 256
    move-result v1

    .line 257
    if-eqz v1, :cond_a

    .line 258
    .line 259
    iget-object v1, v0, Ll/s410;->J1:Ll/q210$a;

    .line 260
    .line 261
    const/16 v2, 0x300b

    .line 262
    .line 263
    invoke-interface {v1, v2, v9, v9, v0}, Ll/q210$a;->g(IIILjava/lang/Object;)V

    .line 264
    .line 265
    .line 266
    const-string v1, "newBitrate"

    .line 267
    .line 268
    const-string v2, "MOMO_FILTER_INFO "

    .line 269
    .line 270
    invoke-static {v1, v2}, Ll/t9c;->a(Ljava/lang/String;Ljava/lang/String;)I

    .line 271
    .line 272
    .line 273
    :cond_a
    iget-object v1, v0, Ll/s410;->z2:Ll/s410$d;

    .line 274
    .line 275
    invoke-direct {v0}, Ll/s410;->d4()Z

    .line 276
    .line 277
    .line 278
    move-result v2

    .line 279
    invoke-virtual {v1, v8, v2}, Ll/s410$d;->c(IZ)V

    .line 280
    .line 281
    .line 282
    iput-wide v4, v0, Ll/s410;->s2:J

    .line 283
    .line 284
    :cond_b
    invoke-static {}, Ll/csx;->R()Ll/csx;

    .line 285
    .line 286
    .line 287
    move-result-object v1

    .line 288
    invoke-virtual {v1}, Ll/csx;->V()I

    .line 289
    .line 290
    .line 291
    move-result v1

    .line 292
    int-to-long v1, v1

    .line 293
    iget-wide v6, v0, Ll/s410;->v2:J

    .line 294
    .line 295
    mul-long/2addr v1, v6

    .line 296
    cmp-long v3, v6, v4

    .line 297
    .line 298
    if-eqz v3, :cond_c

    .line 299
    .line 300
    iget-wide v6, v0, Ll/s410;->u2:J

    .line 301
    .line 302
    cmp-long v3, v6, v4

    .line 303
    .line 304
    if-eqz v3, :cond_c

    .line 305
    .line 306
    rem-long/2addr v6, v1

    .line 307
    cmp-long v1, v6, v4

    .line 308
    .line 309
    if-nez v1, :cond_c

    .line 310
    .line 311
    iget-object v1, v0, Ll/s410;->z2:Ll/s410$d;

    .line 312
    .line 313
    invoke-direct {v0}, Ll/s410;->d4()Z

    .line 314
    .line 315
    .line 316
    move-result v2

    .line 317
    invoke-virtual {v1, v9, v2}, Ll/s410$d;->c(IZ)V

    .line 318
    .line 319
    .line 320
    :cond_c
    iget-boolean v1, v0, Ll/s410;->w2:Z

    .line 321
    .line 322
    if-eqz v1, :cond_f

    .line 323
    .line 324
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 325
    .line 326
    .line 327
    move-result-wide v1

    .line 328
    iget-wide v6, v0, Ll/s410;->x2:J

    .line 329
    .line 330
    sub-long/2addr v1, v6

    .line 331
    const-wide/16 v6, 0x3e8

    .line 332
    .line 333
    div-long/2addr v1, v6

    .line 334
    iget-object v3, v0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->s:Ll/uow;

    .line 335
    .line 336
    iget-wide v6, v3, Ll/uow;->L0:J

    .line 337
    .line 338
    cmp-long v3, v1, v4

    .line 339
    .line 340
    if-lez v3, :cond_f

    .line 341
    .line 342
    const-wide/16 v6, 0xa

    .line 343
    .line 344
    rem-long v6, v1, v6

    .line 345
    .line 346
    cmp-long v3, v6, v4

    .line 347
    .line 348
    if-nez v3, :cond_f

    .line 349
    .line 350
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 351
    .line 352
    .line 353
    move-result-wide v3

    .line 354
    iput-wide v3, v0, Ll/s410;->x2:J

    .line 355
    .line 356
    new-instance v3, Ljava/lang/StringBuilder;

    .line 357
    .line 358
    const-string v4, "ab "

    .line 359
    .line 360
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 361
    .line 362
    .line 363
    invoke-virtual {v3, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 364
    .line 365
    .line 366
    const-string v1, "/"

    .line 367
    .line 368
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 369
    .line 370
    .line 371
    invoke-static {}, Ll/csx;->R()Ll/csx;

    .line 372
    .line 373
    .line 374
    move-result-object v2

    .line 375
    invoke-virtual {v2}, Ll/csx;->M0()Z

    .line 376
    .line 377
    .line 378
    move-result v2

    .line 379
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 380
    .line 381
    .line 382
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 383
    .line 384
    .line 385
    invoke-static {}, Ll/csx;->R()Ll/csx;

    .line 386
    .line 387
    .line 388
    move-result-object v2

    .line 389
    invoke-virtual {v2}, Ll/csx;->l()I

    .line 390
    .line 391
    .line 392
    move-result v2

    .line 393
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 394
    .line 395
    .line 396
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 397
    .line 398
    .line 399
    invoke-static {}, Ll/csx;->R()Ll/csx;

    .line 400
    .line 401
    .line 402
    move-result-object v2

    .line 403
    invoke-virtual {v2}, Ll/csx;->m()I

    .line 404
    .line 405
    .line 406
    move-result v2

    .line 407
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 408
    .line 409
    .line 410
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 411
    .line 412
    .line 413
    invoke-static {}, Ll/csx;->R()Ll/csx;

    .line 414
    .line 415
    .line 416
    move-result-object v2

    .line 417
    invoke-virtual {v2}, Ll/csx;->n()I

    .line 418
    .line 419
    .line 420
    move-result v2

    .line 421
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 422
    .line 423
    .line 424
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 425
    .line 426
    .line 427
    iget-object v1, v0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->s:Ll/uow;

    .line 428
    .line 429
    iget-boolean v1, v1, Ll/uow;->M0:Z

    .line 430
    .line 431
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 432
    .line 433
    .line 434
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 435
    .line 436
    .line 437
    move-result-object v1

    .line 438
    const-string v2, "jzheng"

    .line 439
    .line 440
    invoke-static {v2, v1}, Ll/t9c;->a(Ljava/lang/String;Ljava/lang/String;)I

    .line 441
    .line 442
    .line 443
    iget-object v1, v0, Ll/s410;->z2:Ll/s410$d;

    .line 444
    .line 445
    invoke-direct {v0}, Ll/s410;->d4()Z

    .line 446
    .line 447
    .line 448
    move-result v2

    .line 449
    invoke-virtual {v1, v8, v2}, Ll/s410$d;->c(IZ)V

    .line 450
    .line 451
    .line 452
    iget-object v1, v0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->s:Ll/uow;

    .line 453
    .line 454
    iget v1, v1, Ll/tow;->H:I

    .line 455
    .line 456
    invoke-static {}, Ll/csx;->R()Ll/csx;

    .line 457
    .line 458
    .line 459
    move-result-object v2

    .line 460
    invoke-virtual {v2}, Ll/csx;->l()I

    .line 461
    .line 462
    .line 463
    move-result v2

    .line 464
    sub-int/2addr v1, v2

    .line 465
    invoke-static {}, Ll/csx;->R()Ll/csx;

    .line 466
    .line 467
    .line 468
    move-result-object v2

    .line 469
    invoke-virtual {v2}, Ll/csx;->m()I

    .line 470
    .line 471
    .line 472
    move-result v2

    .line 473
    if-ge v1, v2, :cond_f

    .line 474
    .line 475
    iput-boolean v9, v0, Ll/s410;->w2:Z

    .line 476
    .line 477
    return-void

    .line 478
    :cond_d
    :goto_3
    iget-boolean v1, v0, Ll/s410;->H1:Z

    .line 479
    .line 480
    if-eqz v1, :cond_e

    .line 481
    .line 482
    iget-wide v6, v0, Ll/s410;->v1:J

    .line 483
    .line 484
    const-wide/16 v8, 0x1e

    .line 485
    .line 486
    rem-long/2addr v6, v8

    .line 487
    cmp-long v1, v6, v4

    .line 488
    .line 489
    if-nez v1, :cond_e

    .line 490
    .line 491
    iget-object v1, v0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->I:Ll/evx;

    .line 492
    .line 493
    new-instance v6, Ljava/lang/StringBuilder;

    .line 494
    .line 495
    const-string v7, "mReplaceStreamMode:"

    .line 496
    .line 497
    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 498
    .line 499
    .line 500
    iget-boolean v7, v0, Ll/s410;->H1:Z

    .line 501
    .line 502
    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 503
    .line 504
    .line 505
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 506
    .line 507
    .line 508
    move-result-object v6

    .line 509
    const-string v7, "DynamicScaling"

    .line 510
    .line 511
    invoke-virtual {v1, v7, v6}, Ll/evx;->k(Ljava/lang/String;Ljava/lang/String;)V

    .line 512
    .line 513
    .line 514
    :cond_e
    iget-object v1, v0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 515
    .line 516
    iget-wide v6, v1, Ll/wvx;->g1:J

    .line 517
    .line 518
    cmp-long v1, v6, v2

    .line 519
    .line 520
    if-ltz v1, :cond_f

    .line 521
    .line 522
    iget-wide v1, v0, Ll/s410;->v1:J

    .line 523
    .line 524
    const-wide/16 v6, 0x4b

    .line 525
    .line 526
    rem-long/2addr v1, v6

    .line 527
    cmp-long v1, v1, v4

    .line 528
    .line 529
    if-nez v1, :cond_f

    .line 530
    .line 531
    iget-object v0, v0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->I:Ll/evx;

    .line 532
    .line 533
    const-string v1, "netSpeedCheck"

    .line 534
    .line 535
    const-string v2, "sendSize0cnt >= 3"

    .line 536
    .line 537
    invoke-virtual {v0, v1, v2}, Ll/evx;->k(Ljava/lang/String;Ljava/lang/String;)V

    .line 538
    .line 539
    .line 540
    :cond_f
    return-void
.end method

.method public static synthetic s3(Ll/s410;)Ll/uow;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->s:Ll/uow;

    .line 2
    .line 3
    return-object p0
.end method

.method private s4()V
    .locals 6

    .line 1
    iget-wide v0, p0, Ll/s410;->x2:J

    .line 2
    .line 3
    const-wide/16 v2, -0x1

    .line 4
    .line 5
    cmp-long v0, v0, v2

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 10
    .line 11
    .line 12
    move-result-wide v0

    .line 13
    iput-wide v0, p0, Ll/s410;->x2:J

    .line 14
    .line 15
    :cond_0
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 16
    .line 17
    .line 18
    move-result-wide v0

    .line 19
    iget-wide v2, p0, Ll/s410;->x2:J

    .line 20
    .line 21
    sub-long/2addr v0, v2

    .line 22
    const-wide/16 v2, 0x3e8

    .line 23
    .line 24
    div-long/2addr v0, v2

    .line 25
    const-wide/16 v2, 0x0

    .line 26
    .line 27
    cmp-long v4, v0, v2

    .line 28
    .line 29
    if-lez v4, :cond_1

    .line 30
    .line 31
    const-wide/16 v4, 0xa

    .line 32
    .line 33
    rem-long v4, v0, v4

    .line 34
    .line 35
    cmp-long v2, v4, v2

    .line 36
    .line 37
    if-nez v2, :cond_1

    .line 38
    .line 39
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 40
    .line 41
    .line 42
    move-result-wide v2

    .line 43
    iput-wide v2, p0, Ll/s410;->x2:J

    .line 44
    .line 45
    new-instance v2, Ljava/lang/StringBuilder;

    .line 46
    .line 47
    const-string v3, "ab "

    .line 48
    .line 49
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 50
    .line 51
    .line 52
    invoke-virtual {v2, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 53
    .line 54
    .line 55
    const-string v0, "/"

    .line 56
    .line 57
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 58
    .line 59
    .line 60
    invoke-static {}, Ll/csx;->R()Ll/csx;

    .line 61
    .line 62
    .line 63
    move-result-object v1

    .line 64
    invoke-virtual {v1}, Ll/csx;->M0()Z

    .line 65
    .line 66
    .line 67
    move-result v1

    .line 68
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 69
    .line 70
    .line 71
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 72
    .line 73
    .line 74
    invoke-static {}, Ll/csx;->R()Ll/csx;

    .line 75
    .line 76
    .line 77
    move-result-object v1

    .line 78
    invoke-virtual {v1}, Ll/csx;->l()I

    .line 79
    .line 80
    .line 81
    move-result v1

    .line 82
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 83
    .line 84
    .line 85
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 86
    .line 87
    .line 88
    invoke-static {}, Ll/csx;->R()Ll/csx;

    .line 89
    .line 90
    .line 91
    move-result-object v1

    .line 92
    invoke-virtual {v1}, Ll/csx;->m()I

    .line 93
    .line 94
    .line 95
    move-result v1

    .line 96
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 97
    .line 98
    .line 99
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 100
    .line 101
    .line 102
    invoke-static {}, Ll/csx;->R()Ll/csx;

    .line 103
    .line 104
    .line 105
    move-result-object v1

    .line 106
    invoke-virtual {v1}, Ll/csx;->n()I

    .line 107
    .line 108
    .line 109
    move-result v1

    .line 110
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 111
    .line 112
    .line 113
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 114
    .line 115
    .line 116
    iget-object v0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->s:Ll/uow;

    .line 117
    .line 118
    iget-boolean v0, v0, Ll/uow;->M0:Z

    .line 119
    .line 120
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 121
    .line 122
    .line 123
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 124
    .line 125
    .line 126
    move-result-object v0

    .line 127
    const-string v1, "newBitrate"

    .line 128
    .line 129
    invoke-static {v1, v0}, Ll/t9c;->a(Ljava/lang/String;Ljava/lang/String;)I

    .line 130
    .line 131
    .line 132
    iget-object p0, p0, Ll/s410;->z2:Ll/s410$d;

    .line 133
    .line 134
    invoke-static {p0}, Ll/s410$d;->a(Ll/s410$d;)V

    .line 135
    .line 136
    .line 137
    :cond_1
    return-void
.end method

.method public static synthetic t3(Ll/s410;I)I
    .locals 0

    .line 1
    iput p1, p0, Ll/s410;->J2:I

    .line 2
    .line 3
    return p1
.end method

.method private t4(Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    iget-object p0, p0, Ll/s410;->E2:Ljava/util/regex/Pattern;

    .line 10
    .line 11
    invoke-virtual {p0, p1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    if-eqz p0, :cond_1

    .line 16
    .line 17
    invoke-virtual {p0}, Ljava/util/regex/Matcher;->matches()Z

    .line 18
    .line 19
    .line 20
    move-result p1

    .line 21
    if-eqz p1, :cond_1

    .line 22
    .line 23
    const/4 p1, 0x1

    .line 24
    invoke-virtual {p0, p1}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    const/4 v0, 0x2

    .line 29
    invoke-virtual {p0, v0}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    if-eqz p1, :cond_0

    .line 34
    .line 35
    return-object p1

    .line 36
    :cond_0
    return-object p0

    .line 37
    :cond_1
    const/4 p0, 0x0

    .line 38
    return-object p0
.end method

.method public static synthetic u3(Ll/s410;)Ll/uow;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->s:Ll/uow;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic v3(Ll/s410;)Ll/uow;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->s:Ll/uow;

    .line 2
    .line 3
    return-object p0
.end method

.method private v4(I)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->s:Ll/uow;

    .line 2
    .line 3
    iget-boolean v0, v0, Ll/uow;->X0:Z

    .line 4
    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    iget-object v0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->I:Ll/evx;

    .line 8
    .line 9
    new-instance v1, Ljava/lang/StringBuilder;

    .line 10
    .line 11
    const-string v2, "local merge net error"

    .line 12
    .line 13
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    const-string v2, ",handler:"

    .line 20
    .line 21
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    iget-object v2, p0, Ll/s410;->L1:Ll/kod0;

    .line 25
    .line 26
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    const-string v2, "postNerworkErrorMessage"

    .line 34
    .line 35
    filled-new-array {v2, v1}, [Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    invoke-virtual {v0, v1}, Ll/evx;->l([Ljava/lang/Object;)V

    .line 40
    .line 41
    .line 42
    iget-object v0, p0, Ll/s410;->L1:Ll/kod0;

    .line 43
    .line 44
    if-eqz v0, :cond_0

    .line 45
    .line 46
    iget-object p0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->s:Ll/uow;

    .line 47
    .line 48
    iget-object p0, p0, Ll/uow;->v0:Ljava/lang/String;

    .line 49
    .line 50
    invoke-virtual {v0, p0, p1}, Ll/kod0;->p(Ljava/lang/String;I)V

    .line 51
    .line 52
    .line 53
    :cond_0
    return-void

    .line 54
    :cond_1
    iget-object v0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 55
    .line 56
    int-to-long v1, p1

    .line 57
    iput-wide v1, v0, Ll/wvx;->y0:J

    .line 58
    .line 59
    iget-object v0, p0, Ll/s410;->J1:Ll/q210$a;

    .line 60
    .line 61
    const/4 v1, 0x0

    .line 62
    const/16 v2, 0x3101

    .line 63
    .line 64
    invoke-interface {v0, v2, p1, v1, p0}, Ll/q210$a;->g(IIILjava/lang/Object;)V

    .line 65
    .line 66
    .line 67
    sget-object v0, Lcom/momo/pipline/MomoInterface/MomoCodec$MomoCodecState;->WAIT:Lcom/momo/pipline/MomoInterface/MomoCodec$MomoCodecState;

    .line 68
    .line 69
    iput-object v0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->J:Lcom/momo/pipline/MomoInterface/MomoCodec$MomoCodecState;

    .line 70
    .line 71
    invoke-virtual {p0, v2, p1}, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->e2(II)V

    .line 72
    .line 73
    .line 74
    return-void
.end method

.method public static synthetic w3(Ll/s410;)Ll/uow;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->s:Ll/uow;

    .line 2
    .line 3
    return-object p0
.end method

.method private w4(II)V
    .locals 2

    .line 1
    invoke-direct {p0, p1, p2}, Ll/s410;->o4(II)V

    .line 2
    .line 3
    .line 4
    iget-object p2, p0, Ll/s410;->J1:Ll/q210$a;

    .line 5
    .line 6
    const/16 v0, 0x300e

    .line 7
    .line 8
    const/4 v1, 0x0

    .line 9
    invoke-interface {p2, v0, p1, v1, p0}, Ll/q210$a;->g(IIILjava/lang/Object;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public static synthetic x3(Ll/s410;)Ll/uow;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->s:Ll/uow;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic y3(Ll/s410;)Ll/uow;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->s:Ll/uow;

    .line 2
    .line 3
    return-object p0
.end method

.method private y4()V
    .locals 11

    .line 1
    iget-object v0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->J:Lcom/momo/pipline/MomoInterface/MomoCodec$MomoCodecState;

    .line 2
    .line 3
    sget-object v1, Lcom/momo/pipline/MomoInterface/MomoCodec$MomoCodecState;->WAIT:Lcom/momo/pipline/MomoInterface/MomoCodec$MomoCodecState;

    .line 4
    .line 5
    if-ne v0, v1, :cond_0

    .line 6
    .line 7
    goto/16 :goto_2

    .line 8
    .line 9
    :cond_0
    iget-boolean v0, p0, Ll/s410;->m2:Z

    .line 10
    .line 11
    if-eqz v0, :cond_1

    .line 12
    .line 13
    const/4 v0, 0x4

    .line 14
    goto :goto_0

    .line 15
    :cond_1
    const/4 v0, 0x2

    .line 16
    :goto_0
    iget-wide v2, p0, Ll/s410;->j2:J

    .line 17
    .line 18
    const-wide/16 v4, -0x1

    .line 19
    .line 20
    cmp-long v2, v2, v4

    .line 21
    .line 22
    if-nez v2, :cond_2

    .line 23
    .line 24
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 25
    .line 26
    .line 27
    move-result-wide v2

    .line 28
    iput-wide v2, p0, Ll/s410;->j2:J

    .line 29
    .line 30
    :cond_2
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 31
    .line 32
    .line 33
    move-result-wide v2

    .line 34
    iget-wide v4, p0, Ll/s410;->j2:J

    .line 35
    .line 36
    sub-long/2addr v2, v4

    .line 37
    const-wide/16 v4, 0x3e8

    .line 38
    .line 39
    div-long/2addr v2, v4

    .line 40
    const-wide/16 v4, 0x0

    .line 41
    .line 42
    cmp-long v6, v2, v4

    .line 43
    .line 44
    if-lez v6, :cond_5

    .line 45
    .line 46
    int-to-long v6, v0

    .line 47
    rem-long/2addr v2, v6

    .line 48
    cmp-long v0, v2, v4

    .line 49
    .line 50
    if-nez v0, :cond_5

    .line 51
    .line 52
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 53
    .line 54
    .line 55
    move-result-wide v2

    .line 56
    iput-wide v2, p0, Ll/s410;->j2:J

    .line 57
    .line 58
    invoke-virtual {p0}, Ll/s410;->g0()J

    .line 59
    .line 60
    .line 61
    move-result-wide v2

    .line 62
    new-instance v0, Ljava/lang/StringBuilder;

    .line 63
    .line 64
    const-string v6, "from "

    .line 65
    .line 66
    invoke-direct {v0, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 67
    .line 68
    .line 69
    iget-wide v6, p0, Ll/s410;->k2:J

    .line 70
    .line 71
    invoke-virtual {v0, v6, v7}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 72
    .line 73
    .line 74
    const-string v6, " to "

    .line 75
    .line 76
    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 77
    .line 78
    .line 79
    invoke-virtual {v0, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 80
    .line 81
    .line 82
    const-string v6, " diff "

    .line 83
    .line 84
    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 85
    .line 86
    .line 87
    iget-wide v6, p0, Ll/s410;->k2:J

    .line 88
    .line 89
    sub-long v6, v2, v6

    .line 90
    .line 91
    invoke-virtual {v0, v6, v7}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 92
    .line 93
    .line 94
    const-string v6, " cnt "

    .line 95
    .line 96
    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 97
    .line 98
    .line 99
    iget-wide v6, p0, Ll/s410;->l2:J

    .line 100
    .line 101
    invoke-virtual {v0, v6, v7}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 102
    .line 103
    .line 104
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 105
    .line 106
    .line 107
    move-result-object v0

    .line 108
    const-string v6, "zhangjj"

    .line 109
    .line 110
    invoke-static {v6, v0}, Ll/t9c;->a(Ljava/lang/String;Ljava/lang/String;)I

    .line 111
    .line 112
    .line 113
    iget-boolean v0, p0, Ll/s410;->m2:Z

    .line 114
    .line 115
    const-wide/16 v7, 0x1

    .line 116
    .line 117
    if-eqz v0, :cond_3

    .line 118
    .line 119
    move-wide v2, v7

    .line 120
    :cond_3
    iget-wide v9, p0, Ll/s410;->k2:J

    .line 121
    .line 122
    cmp-long v0, v9, v2

    .line 123
    .line 124
    if-eqz v0, :cond_4

    .line 125
    .line 126
    iput-wide v2, p0, Ll/s410;->k2:J

    .line 127
    .line 128
    iput-wide v4, p0, Ll/s410;->l2:J

    .line 129
    .line 130
    goto :goto_1

    .line 131
    :cond_4
    iget-wide v2, p0, Ll/s410;->l2:J

    .line 132
    .line 133
    add-long/2addr v2, v7

    .line 134
    iput-wide v2, p0, Ll/s410;->l2:J

    .line 135
    .line 136
    :goto_1
    iget-wide v2, p0, Ll/s410;->l2:J

    .line 137
    .line 138
    const-wide/16 v7, 0x5

    .line 139
    .line 140
    cmp-long v0, v2, v7

    .line 141
    .line 142
    if-nez v0, :cond_5

    .line 143
    .line 144
    iput-wide v4, p0, Ll/s410;->l2:J

    .line 145
    .line 146
    new-instance v0, Ljava/lang/StringBuilder;

    .line 147
    .line 148
    const-string v2, "get msg Error "

    .line 149
    .line 150
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 151
    .line 152
    .line 153
    iget-object v2, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->J:Lcom/momo/pipline/MomoInterface/MomoCodec$MomoCodecState;

    .line 154
    .line 155
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 156
    .line 157
    .line 158
    const-string v2, "/-304/14"

    .line 159
    .line 160
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 161
    .line 162
    .line 163
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 164
    .line 165
    .line 166
    move-result-object v0

    .line 167
    invoke-static {v6, v0}, Ll/t9c;->a(Ljava/lang/String;Ljava/lang/String;)I

    .line 168
    .line 169
    .line 170
    iget-object v0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->J:Lcom/momo/pipline/MomoInterface/MomoCodec$MomoCodecState;

    .line 171
    .line 172
    if-eq v0, v1, :cond_5

    .line 173
    .line 174
    iget-boolean v0, p0, Ll/s410;->H1:Z

    .line 175
    .line 176
    if-nez v0, :cond_5

    .line 177
    .line 178
    iput-object v1, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->J:Lcom/momo/pipline/MomoInterface/MomoCodec$MomoCodecState;

    .line 179
    .line 180
    iget-object v0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->I:Ll/evx;

    .line 181
    .line 182
    const-string v1, "MediaError"

    .line 183
    .line 184
    const-string v2, "14 sendsize 0 line 923"

    .line 185
    .line 186
    filled-new-array {v1, v2}, [Ljava/lang/Object;

    .line 187
    .line 188
    .line 189
    move-result-object v1

    .line 190
    invoke-virtual {v0, v1}, Ll/evx;->l([Ljava/lang/Object;)V

    .line 191
    .line 192
    .line 193
    const/16 v0, 0xe

    .line 194
    .line 195
    invoke-direct {p0, v0}, Ll/s410;->v4(I)V

    .line 196
    .line 197
    .line 198
    :cond_5
    :goto_2
    return-void
.end method

.method public static synthetic z3(Ll/s410;)Ll/uow;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->s:Ll/uow;

    .line 2
    .line 3
    return-object p0
.end method


# virtual methods
.method public A()V
    .locals 0

    .line 1
    return-void
.end method

.method public A0()I
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/s410;->k0()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public A4(I)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->I:Ll/evx;

    .line 2
    .line 3
    const-string v1, "setBusinessType"

    .line 4
    .line 5
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 6
    .line 7
    .line 8
    move-result-object v2

    .line 9
    filled-new-array {v1, v2}, [Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-virtual {v0, v1}, Ll/evx;->l([Ljava/lang/Object;)V

    .line 14
    .line 15
    .line 16
    iget-object p0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 17
    .line 18
    int-to-long v0, p1

    .line 19
    iput-wide v0, p0, Ll/wvx;->s:J

    .line 20
    .line 21
    return-void
.end method

.method public B1(ILjava/nio/ByteBuffer;Landroid/media/MediaCodec$BufferInfo;)Z
    .locals 28
    .annotation build Landroidx/annotation/RequiresApi;
        api = 0x10
    .end annotation

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
    move-object/from16 v3, p3

    .line 8
    .line 9
    iget-boolean v4, v0, Ll/s410;->p1:Z

    .line 10
    .line 11
    const/4 v5, 0x1

    .line 12
    if-nez v4, :cond_0

    .line 13
    .line 14
    return v5

    .line 15
    :cond_0
    invoke-direct {v0}, Ll/s410;->y4()V

    .line 16
    .line 17
    .line 18
    iget-boolean v4, v0, Ll/s410;->A2:Z

    .line 19
    .line 20
    if-eqz v4, :cond_1

    .line 21
    .line 22
    invoke-direct {v0}, Ll/s410;->s4()V

    .line 23
    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_1
    invoke-direct {v0}, Ll/s410;->r4()V

    .line 27
    .line 28
    .line 29
    :goto_0
    iget v4, v3, Landroid/media/MediaCodec$BufferInfo;->size:I

    .line 30
    .line 31
    invoke-virtual {v2}, Ljava/nio/Buffer;->limit()I

    .line 32
    .line 33
    .line 34
    move-result v6

    .line 35
    const/4 v7, 0x0

    .line 36
    if-eq v4, v6, :cond_3

    .line 37
    .line 38
    invoke-virtual {v2, v7}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 39
    .line 40
    .line 41
    iget v4, v3, Landroid/media/MediaCodec$BufferInfo;->size:I

    .line 42
    .line 43
    invoke-static {v4}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    .line 44
    .line 45
    .line 46
    move-result-object v4

    .line 47
    if-eqz v4, :cond_2

    .line 48
    .line 49
    invoke-virtual {v4}, Ljava/nio/ByteBuffer;->clear()Ljava/nio/Buffer;

    .line 50
    .line 51
    .line 52
    invoke-virtual {v4, v7}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 53
    .line 54
    .line 55
    invoke-virtual {v4}, Ljava/nio/ByteBuffer;->array()[B

    .line 56
    .line 57
    .line 58
    move-result-object v6

    .line 59
    iget v8, v3, Landroid/media/MediaCodec$BufferInfo;->offset:I

    .line 60
    .line 61
    iget v9, v3, Landroid/media/MediaCodec$BufferInfo;->size:I

    .line 62
    .line 63
    invoke-virtual {v2, v6, v8, v9}, Ljava/nio/ByteBuffer;->get([BII)Ljava/nio/ByteBuffer;

    .line 64
    .line 65
    .line 66
    :cond_2
    move-object v13, v4

    .line 67
    goto :goto_1

    .line 68
    :cond_3
    move-object v13, v2

    .line 69
    :goto_1
    iget-object v4, v0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->s:Ll/uow;

    .line 70
    .line 71
    iget-boolean v4, v4, Ll/tow;->b0:Z

    .line 72
    .line 73
    if-nez v4, :cond_17

    .line 74
    .line 75
    iget-boolean v4, v0, Ll/s410;->h2:Z

    .line 76
    .line 77
    const/4 v6, 0x2

    .line 78
    if-eqz v4, :cond_4

    .line 79
    .line 80
    if-ne v1, v6, :cond_4

    .line 81
    .line 82
    iget v4, v3, Landroid/media/MediaCodec$BufferInfo;->size:I

    .line 83
    .line 84
    invoke-virtual {v0, v2, v4}, Ll/grx;->I2(Ljava/nio/ByteBuffer;I)Z

    .line 85
    .line 86
    .line 87
    move-result v4

    .line 88
    if-eqz v4, :cond_4

    .line 89
    .line 90
    move v4, v5

    .line 91
    goto :goto_2

    .line 92
    :cond_4
    move v4, v7

    .line 93
    :goto_2
    invoke-direct {v0, v4}, Ll/s410;->G4(Z)Z

    .line 94
    .line 95
    .line 96
    move-result v4

    .line 97
    if-eqz v4, :cond_6

    .line 98
    .line 99
    if-ne v1, v6, :cond_5

    .line 100
    .line 101
    iget v1, v0, Ll/s410;->i2:I

    .line 102
    .line 103
    add-int/2addr v1, v5

    .line 104
    iput v1, v0, Ll/s410;->i2:I

    .line 105
    .line 106
    iget-wide v1, v0, Ll/s410;->t1:J

    .line 107
    .line 108
    iget v3, v3, Landroid/media/MediaCodec$BufferInfo;->size:I

    .line 109
    .line 110
    int-to-long v3, v3

    .line 111
    add-long/2addr v1, v3

    .line 112
    iput-wide v1, v0, Ll/s410;->t1:J

    .line 113
    .line 114
    goto :goto_3

    .line 115
    :cond_5
    iget-wide v1, v0, Ll/s410;->u1:J

    .line 116
    .line 117
    iget v3, v3, Landroid/media/MediaCodec$BufferInfo;->size:I

    .line 118
    .line 119
    int-to-long v3, v3

    .line 120
    add-long/2addr v1, v3

    .line 121
    iput-wide v1, v0, Ll/s410;->u1:J

    .line 122
    .line 123
    :goto_3
    return v5

    .line 124
    :cond_6
    const-wide/16 v8, 0x1

    .line 125
    .line 126
    const-wide/16 v10, 0x3e8

    .line 127
    .line 128
    const-wide/16 v14, 0x0

    .line 129
    .line 130
    if-ne v1, v5, :cond_9

    .line 131
    .line 132
    iget-wide v1, v0, Ll/s410;->m1:J

    .line 133
    .line 134
    cmp-long v1, v1, v14

    .line 135
    .line 136
    if-nez v1, :cond_7

    .line 137
    .line 138
    iget-wide v1, v3, Landroid/media/MediaCodec$BufferInfo;->presentationTimeUs:J

    .line 139
    .line 140
    iput-wide v1, v0, Ll/s410;->m1:J

    .line 141
    .line 142
    :cond_7
    iget-wide v1, v3, Landroid/media/MediaCodec$BufferInfo;->presentationTimeUs:J

    .line 143
    .line 144
    iget-wide v6, v0, Ll/s410;->m1:J

    .line 145
    .line 146
    sub-long/2addr v1, v6

    .line 147
    iget-wide v6, v0, Ll/s410;->M1:J

    .line 148
    .line 149
    sub-long/2addr v1, v6

    .line 150
    div-long/2addr v1, v10

    .line 151
    iget-wide v6, v0, Ll/s410;->u1:J

    .line 152
    .line 153
    iget v4, v3, Landroid/media/MediaCodec$BufferInfo;->size:I

    .line 154
    .line 155
    iget v10, v3, Landroid/media/MediaCodec$BufferInfo;->offset:I

    .line 156
    .line 157
    sub-int/2addr v4, v10

    .line 158
    int-to-long v10, v4

    .line 159
    add-long/2addr v6, v10

    .line 160
    iput-wide v6, v0, Ll/s410;->u1:J

    .line 161
    .line 162
    iget-wide v6, v0, Ll/s410;->w1:J

    .line 163
    .line 164
    add-long/2addr v6, v8

    .line 165
    iput-wide v6, v0, Ll/s410;->w1:J

    .line 166
    .line 167
    iget-wide v6, v0, Ll/s410;->y1:J

    .line 168
    .line 169
    cmp-long v4, v6, v14

    .line 170
    .line 171
    if-nez v4, :cond_8

    .line 172
    .line 173
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 174
    .line 175
    .line 176
    move-result-wide v6

    .line 177
    iput-wide v6, v0, Ll/s410;->y1:J

    .line 178
    .line 179
    :cond_8
    iget-object v10, v0, Ll/s410;->l1:Lcom/immomo/mediacore/sink/IjkWriter;

    .line 180
    .line 181
    if-eqz v10, :cond_16

    .line 182
    .line 183
    iget-wide v6, v0, Ll/s410;->P1:J

    .line 184
    .line 185
    add-long v11, v1, v6

    .line 186
    .line 187
    iget v14, v3, Landroid/media/MediaCodec$BufferInfo;->size:I

    .line 188
    .line 189
    const/4 v15, 0x0

    .line 190
    invoke-virtual/range {v10 .. v15}, Lcom/immomo/mediacore/sink/IjkWriter;->writeAudioPacket(JLjava/nio/ByteBuffer;II)V

    .line 191
    .line 192
    .line 193
    goto/16 :goto_7

    .line 194
    .line 195
    :cond_9
    if-ne v1, v6, :cond_16

    .line 196
    .line 197
    move-wide/from16 v16, v8

    .line 198
    .line 199
    iget-wide v8, v0, Ll/s410;->n1:J

    .line 200
    .line 201
    cmp-long v1, v8, v14

    .line 202
    .line 203
    if-nez v1, :cond_a

    .line 204
    .line 205
    iget-wide v8, v3, Landroid/media/MediaCodec$BufferInfo;->presentationTimeUs:J

    .line 206
    .line 207
    iput-wide v8, v0, Ll/s410;->n1:J

    .line 208
    .line 209
    :cond_a
    :try_start_0
    iget-wide v8, v3, Landroid/media/MediaCodec$BufferInfo;->presentationTimeUs:J

    .line 210
    .line 211
    move-wide/from16 v18, v10

    .line 212
    .line 213
    iget-wide v10, v0, Ll/s410;->n1:J

    .line 214
    .line 215
    sub-long/2addr v8, v10

    .line 216
    iget-wide v10, v0, Ll/s410;->M1:J

    .line 217
    .line 218
    sub-long/2addr v8, v10

    .line 219
    div-long v8, v8, v18

    .line 220
    .line 221
    iget-wide v10, v0, Ll/s410;->R1:J

    .line 222
    .line 223
    cmp-long v1, v10, v14

    .line 224
    .line 225
    if-gez v1, :cond_b

    .line 226
    .line 227
    iput-wide v8, v0, Ll/s410;->R1:J

    .line 228
    .line 229
    :cond_b
    iget-object v1, v0, Ll/s410;->T1:Ll/rp1;

    .line 230
    .line 231
    invoke-virtual {v1, v8, v9}, Ll/rp1;->a(J)J

    .line 232
    .line 233
    .line 234
    move-result-wide v10

    .line 235
    move-wide/from16 v20, v14

    .line 236
    .line 237
    iget-wide v14, v0, Ll/s410;->R1:J

    .line 238
    .line 239
    sub-long v22, v8, v14

    .line 240
    .line 241
    const-wide/16 v24, 0x50

    .line 242
    .line 243
    cmp-long v1, v22, v24

    .line 244
    .line 245
    if-lez v1, :cond_c

    .line 246
    .line 247
    add-long/2addr v14, v10

    .line 248
    goto :goto_4

    .line 249
    :cond_c
    move-wide v14, v8

    .line 250
    :goto_4
    iget-wide v10, v0, Ll/s410;->S1:J

    .line 251
    .line 252
    cmp-long v1, v10, v20

    .line 253
    .line 254
    if-gez v1, :cond_d

    .line 255
    .line 256
    iput-wide v14, v0, Ll/s410;->S1:J

    .line 257
    .line 258
    :cond_d
    iput-wide v8, v0, Ll/s410;->R1:J

    .line 259
    .line 260
    iput-wide v14, v0, Ll/s410;->S1:J

    .line 261
    .line 262
    invoke-static {}, Ll/csx;->R()Ll/csx;

    .line 263
    .line 264
    .line 265
    move-result-object v1

    .line 266
    invoke-virtual {v1}, Ll/csx;->L()I

    .line 267
    .line 268
    .line 269
    move-result v1

    .line 270
    if-ne v1, v5, :cond_14

    .line 271
    .line 272
    invoke-virtual {v2, v7}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 273
    .line 274
    .line 275
    iget v1, v3, Landroid/media/MediaCodec$BufferInfo;->size:I

    .line 276
    .line 277
    new-array v1, v1, [B

    .line 278
    .line 279
    invoke-virtual {v2, v1}, Ljava/nio/ByteBuffer;->get([B)Ljava/nio/ByteBuffer;

    .line 280
    .line 281
    .line 282
    invoke-virtual {v2, v7}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 283
    .line 284
    .line 285
    iget v2, v3, Landroid/media/MediaCodec$BufferInfo;->size:I

    .line 286
    .line 287
    invoke-static {v1, v2}, Lcom/immomo/mediabase/Nalu;->getNaluType([BI)I

    .line 288
    .line 289
    .line 290
    move-result v1

    .line 291
    if-eq v1, v6, :cond_12

    .line 292
    .line 293
    const/4 v2, 0x7

    .line 294
    if-ne v1, v2, :cond_e

    .line 295
    .line 296
    goto/16 :goto_6

    .line 297
    .line 298
    :cond_e
    const/4 v2, 0x0

    .line 299
    if-eqz v1, :cond_11

    .line 300
    .line 301
    const/4 v3, 0x5

    .line 302
    if-ne v1, v3, :cond_f

    .line 303
    .line 304
    goto :goto_5

    .line 305
    :cond_f
    if-eq v1, v5, :cond_10

    .line 306
    .line 307
    const/4 v3, 0x6

    .line 308
    if-ne v1, v3, :cond_16

    .line 309
    .line 310
    :cond_10
    invoke-virtual {v13}, Ljava/nio/Buffer;->limit()I

    .line 311
    .line 312
    .line 313
    move-result v3

    .line 314
    invoke-static {v3}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    .line 315
    .line 316
    .line 317
    move-result-object v3

    .line 318
    invoke-virtual {v13, v7}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 319
    .line 320
    .line 321
    invoke-virtual {v3, v13}, Ljava/nio/ByteBuffer;->put(Ljava/nio/ByteBuffer;)Ljava/nio/ByteBuffer;

    .line 322
    .line 323
    .line 324
    invoke-virtual {v3}, Ljava/nio/ByteBuffer;->flip()Ljava/nio/Buffer;

    .line 325
    .line 326
    .line 327
    new-instance v4, Ll/s410$b;

    .line 328
    .line 329
    invoke-direct {v4, v0, v2}, Ll/s410$b;-><init>(Ll/s410;Ll/s410$a;)V

    .line 330
    .line 331
    .line 332
    iput-object v3, v4, Ll/s410$b;->a:Ljava/nio/ByteBuffer;

    .line 333
    .line 334
    iput-wide v14, v4, Ll/s410$b;->c:J

    .line 335
    .line 336
    move-wide/from16 v2, v20

    .line 337
    .line 338
    iput-wide v2, v4, Ll/s410$b;->b:J

    .line 339
    .line 340
    iput v1, v4, Ll/s410$b;->d:I

    .line 341
    .line 342
    iget v1, v0, Ll/s410;->p2:I

    .line 343
    .line 344
    int-to-long v1, v1

    .line 345
    iput-wide v1, v4, Ll/s410$b;->e:J

    .line 346
    .line 347
    iget-object v1, v0, Ll/s410;->n2:Ljava/util/LinkedList;

    .line 348
    .line 349
    invoke-virtual {v1, v4}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    .line 350
    .line 351
    .line 352
    iget-object v0, v0, Ll/s410;->o2:Ljava/util/LinkedList;

    .line 353
    .line 354
    iget-wide v1, v4, Ll/s410$b;->c:J

    .line 355
    .line 356
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 357
    .line 358
    .line 359
    move-result-object v1

    .line 360
    invoke-virtual {v0, v1}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    .line 361
    .line 362
    .line 363
    goto/16 :goto_7

    .line 364
    .line 365
    :cond_11
    :goto_5
    invoke-virtual {v13}, Ljava/nio/Buffer;->limit()I

    .line 366
    .line 367
    .line 368
    move-result v3

    .line 369
    invoke-static {v3}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    .line 370
    .line 371
    .line 372
    move-result-object v3

    .line 373
    invoke-virtual {v13, v7}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 374
    .line 375
    .line 376
    invoke-virtual {v3, v13}, Ljava/nio/ByteBuffer;->put(Ljava/nio/ByteBuffer;)Ljava/nio/ByteBuffer;

    .line 377
    .line 378
    .line 379
    invoke-virtual {v3}, Ljava/nio/ByteBuffer;->flip()Ljava/nio/Buffer;

    .line 380
    .line 381
    .line 382
    new-instance v4, Ll/s410$b;

    .line 383
    .line 384
    invoke-direct {v4, v0, v2}, Ll/s410$b;-><init>(Ll/s410;Ll/s410$a;)V

    .line 385
    .line 386
    .line 387
    iput-object v3, v4, Ll/s410$b;->a:Ljava/nio/ByteBuffer;

    .line 388
    .line 389
    iput-wide v14, v4, Ll/s410$b;->c:J

    .line 390
    .line 391
    iput-wide v14, v4, Ll/s410$b;->b:J

    .line 392
    .line 393
    iput v1, v4, Ll/s410$b;->d:I

    .line 394
    .line 395
    iget v1, v0, Ll/s410;->p2:I

    .line 396
    .line 397
    int-to-long v1, v1

    .line 398
    iput-wide v1, v4, Ll/s410$b;->e:J

    .line 399
    .line 400
    invoke-direct {v0, v7}, Ll/s410;->K4(Z)V

    .line 401
    .line 402
    .line 403
    iget-object v1, v0, Ll/s410;->n2:Ljava/util/LinkedList;

    .line 404
    .line 405
    invoke-virtual {v1, v4}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    .line 406
    .line 407
    .line 408
    iget-object v0, v0, Ll/s410;->o2:Ljava/util/LinkedList;

    .line 409
    .line 410
    iget-wide v1, v4, Ll/s410$b;->c:J

    .line 411
    .line 412
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 413
    .line 414
    .line 415
    move-result-object v1

    .line 416
    invoke-virtual {v0, v1}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    .line 417
    .line 418
    .line 419
    goto/16 :goto_7

    .line 420
    .line 421
    :cond_12
    :goto_6
    iget-object v1, v0, Ll/s410;->l1:Lcom/immomo/mediacore/sink/IjkWriter;

    .line 422
    .line 423
    if-eqz v1, :cond_13

    .line 424
    .line 425
    iget v1, v3, Landroid/media/MediaCodec$BufferInfo;->size:I

    .line 426
    .line 427
    invoke-virtual {v0, v13, v1, v5}, Ll/grx;->B2(Ljava/nio/ByteBuffer;IZ)Ljava/nio/ByteBuffer;

    .line 428
    .line 429
    .line 430
    move-result-object v23

    .line 431
    invoke-direct {v0, v5}, Ll/s410;->K4(Z)V

    .line 432
    .line 433
    .line 434
    iget-object v1, v0, Ll/s410;->l1:Lcom/immomo/mediacore/sink/IjkWriter;

    .line 435
    .line 436
    iget-wide v8, v0, Ll/s410;->Q1:J

    .line 437
    .line 438
    add-long v19, v14, v8

    .line 439
    .line 440
    iget-wide v8, v0, Ll/s410;->P1:J

    .line 441
    .line 442
    add-long v21, v14, v8

    .line 443
    .line 444
    invoke-virtual/range {v23 .. v23}, Ljava/nio/Buffer;->limit()I

    .line 445
    .line 446
    .line 447
    move-result v24

    .line 448
    const/16 v25, 0x1

    .line 449
    .line 450
    move-object/from16 v18, v1

    .line 451
    .line 452
    invoke-virtual/range {v18 .. v25}, Lcom/immomo/mediacore/sink/IjkWriter;->writeVideoPacket2(JJLjava/nio/ByteBuffer;IZ)V

    .line 453
    .line 454
    .line 455
    iget-wide v1, v0, Ll/s410;->t1:J

    .line 456
    .line 457
    iget v4, v3, Landroid/media/MediaCodec$BufferInfo;->size:I

    .line 458
    .line 459
    iget v3, v3, Landroid/media/MediaCodec$BufferInfo;->offset:I

    .line 460
    .line 461
    sub-int/2addr v4, v3

    .line 462
    int-to-long v3, v4

    .line 463
    add-long/2addr v1, v3

    .line 464
    iput-wide v1, v0, Ll/s410;->t1:J

    .line 465
    .line 466
    iget-wide v1, v0, Ll/s410;->v1:J

    .line 467
    .line 468
    add-long v1, v1, v16

    .line 469
    .line 470
    iput-wide v1, v0, Ll/s410;->v1:J

    .line 471
    .line 472
    :cond_13
    invoke-direct {v0, v7, v14, v15}, Ll/s410;->I4(IJ)V

    .line 473
    .line 474
    .line 475
    goto :goto_7

    .line 476
    :cond_14
    iget-wide v1, v3, Landroid/media/MediaCodec$BufferInfo;->presentationTimeUs:J

    .line 477
    .line 478
    iget-wide v8, v0, Ll/s410;->n1:J

    .line 479
    .line 480
    sub-long/2addr v1, v8

    .line 481
    iget-wide v8, v0, Ll/s410;->M1:J

    .line 482
    .line 483
    sub-long/2addr v1, v8

    .line 484
    div-long v23, v1, v18

    .line 485
    .line 486
    iget v1, v3, Landroid/media/MediaCodec$BufferInfo;->size:I

    .line 487
    .line 488
    invoke-virtual {v0, v13, v1}, Ll/grx;->I2(Ljava/nio/ByteBuffer;I)Z

    .line 489
    .line 490
    .line 491
    move-result v1

    .line 492
    iget v2, v3, Landroid/media/MediaCodec$BufferInfo;->size:I

    .line 493
    .line 494
    invoke-virtual {v0, v13, v2, v1}, Ll/grx;->B2(Ljava/nio/ByteBuffer;IZ)Ljava/nio/ByteBuffer;

    .line 495
    .line 496
    .line 497
    move-result-object v25

    .line 498
    iget-wide v8, v0, Ll/s410;->t1:J

    .line 499
    .line 500
    iget v2, v3, Landroid/media/MediaCodec$BufferInfo;->size:I

    .line 501
    .line 502
    iget v3, v3, Landroid/media/MediaCodec$BufferInfo;->offset:I

    .line 503
    .line 504
    sub-int/2addr v2, v3

    .line 505
    int-to-long v2, v2

    .line 506
    add-long/2addr v8, v2

    .line 507
    iput-wide v8, v0, Ll/s410;->t1:J

    .line 508
    .line 509
    iget-wide v2, v0, Ll/s410;->v1:J

    .line 510
    .line 511
    add-long v2, v2, v16

    .line 512
    .line 513
    iput-wide v2, v0, Ll/s410;->v1:J

    .line 514
    .line 515
    iget-wide v2, v0, Ll/s410;->x1:J

    .line 516
    .line 517
    const-wide/16 v20, 0x0

    .line 518
    .line 519
    cmp-long v2, v2, v20

    .line 520
    .line 521
    if-nez v2, :cond_15

    .line 522
    .line 523
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 524
    .line 525
    .line 526
    move-result-wide v2

    .line 527
    iput-wide v2, v0, Ll/s410;->x1:J

    .line 528
    .line 529
    :cond_15
    iget-object v2, v0, Ll/s410;->l1:Lcom/immomo/mediacore/sink/IjkWriter;

    .line 530
    .line 531
    if-eqz v2, :cond_16

    .line 532
    .line 533
    invoke-virtual/range {v25 .. v25}, Ljava/nio/Buffer;->limit()I

    .line 534
    .line 535
    .line 536
    move-result v26

    .line 537
    move/from16 v27, v1

    .line 538
    .line 539
    move-object/from16 v22, v2

    .line 540
    .line 541
    invoke-virtual/range {v22 .. v27}, Lcom/immomo/mediacore/sink/IjkWriter;->writeVideoPacket(JLjava/nio/ByteBuffer;IZ)V

    .line 542
    .line 543
    .line 544
    move-wide/from16 v1, v23

    .line 545
    .line 546
    if-eqz v27, :cond_16

    .line 547
    .line 548
    invoke-direct {v0, v7, v1, v2}, Ll/s410;->I4(IJ)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 549
    .line 550
    .line 551
    :catch_0
    :cond_16
    :goto_7
    return v5

    .line 552
    :cond_17
    invoke-virtual {v0, v13}, Ll/s410;->K0(Ljava/nio/ByteBuffer;)Z

    .line 553
    .line 554
    .line 555
    return v5
.end method

.method public B4(Z)V
    .locals 4

    .line 1
    iput-boolean p1, p0, Ll/s410;->H1:Z

    .line 2
    .line 3
    iget-object v0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->I:Ll/evx;

    .line 4
    .line 5
    new-instance v1, Ljava/lang/StringBuilder;

    .line 6
    .line 7
    const-string v2, "setReplaceStream"

    .line 8
    .line 9
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    filled-new-array {v1}, [Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-virtual {v0, v1}, Ll/evx;->l([Ljava/lang/Object;)V

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, Ll/s410;->l1:Lcom/immomo/mediacore/sink/IjkWriter;

    .line 27
    .line 28
    if-eqz v0, :cond_1

    .line 29
    .line 30
    if-eqz p1, :cond_0

    .line 31
    .line 32
    const-wide/16 v1, 0x1

    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_0
    const-wide/16 v1, 0x0

    .line 36
    .line 37
    :goto_0
    const/16 v3, 0x7531

    .line 38
    .line 39
    invoke-virtual {v0, v3, v1, v2}, Lcom/immomo/mediacore/sink/IjkWriter;->setPropertyLong(IJ)V

    .line 40
    .line 41
    .line 42
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    new-instance v1, Ljava/lang/StringBuilder;

    .line 47
    .line 48
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 49
    .line 50
    .line 51
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    invoke-virtual {p0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 60
    .line 61
    .line 62
    const-string p0, "setReplaceStream:"

    .line 63
    .line 64
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 65
    .line 66
    .line 67
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 68
    .line 69
    .line 70
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 71
    .line 72
    .line 73
    move-result-object p0

    .line 74
    const-string p1, "Pipeline_Flow_pip->MOMO"

    .line 75
    .line 76
    invoke-virtual {v0, p1, p0}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 77
    .line 78
    .line 79
    :cond_1
    return-void
.end method

.method public C(Ll/oxd0;)Ll/oxd0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/s410;->K1:Ll/fb1;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1}, Ll/fb1;->C(Ll/oxd0;)Ll/oxd0;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return-object p0
.end method

.method public C0()V
    .locals 0

    .line 1
    return-void
.end method

.method public C1(Ljava/lang/String;)V
    .locals 0

    .line 1
    return-void
.end method

.method public C4(Z)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->I:Ll/evx;

    .line 2
    .line 3
    new-instance v1, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    const-string v2, "setReplaceStreamFix:"

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
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    filled-new-array {v1}, [Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    invoke-virtual {v0, v1}, Ll/evx;->l([Ljava/lang/Object;)V

    .line 22
    .line 23
    .line 24
    iput-boolean p1, p0, Ll/s410;->I1:Z

    .line 25
    .line 26
    return-void
.end method

.method public D0()J
    .locals 3

    .line 1
    iget-object p0, p0, Ll/s410;->l1:Lcom/immomo/mediacore/sink/IjkWriter;

    .line 2
    .line 3
    const-wide/16 v0, 0x0

    .line 4
    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    const/16 v2, 0x4e28

    .line 8
    .line 9
    invoke-virtual {p0, v2, v0, v1}, Lcom/immomo/mediacore/sink/IjkWriter;->getPropertyLong(IJ)J

    .line 10
    .line 11
    .line 12
    move-result-wide v0

    .line 13
    :cond_0
    return-wide v0
.end method

.method public D1()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 2
    .line 3
    iget-object p0, p0, Ll/wvx;->x:Ljava/lang/String;

    .line 4
    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    return-object p0

    .line 8
    :cond_0
    const-string p0, ""

    .line 9
    .line 10
    return-object p0
.end method

.method public D4(ILjava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    iput p1, p0, Ll/s410;->q1:I

    .line 2
    .line 3
    iput-object p2, p0, Ll/s410;->r1:Ljava/lang/String;

    .line 4
    .line 5
    iput-object p3, p0, Ll/s410;->s1:Ljava/lang/String;

    .line 6
    .line 7
    return-void
.end method

.method public E0(Ll/wzl;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->F:Ll/wzl;

    .line 2
    .line 3
    return-void
.end method

.method public E2()Ll/g220;
    .locals 0

    .line 1
    return-object p0
.end method

.method public F0()I
    .locals 0

    .line 1
    iget p0, p0, Ll/s410;->C1:I

    .line 2
    .line 3
    return p0
.end method

.method public F1()J
    .locals 2

    .line 1
    iget-object p0, p0, Ll/s410;->l1:Lcom/immomo/mediacore/sink/IjkWriter;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    :try_start_0
    invoke-virtual {p0}, Lcom/immomo/mediacore/sink/IjkWriter;->getWriteByte()J

    .line 6
    .line 7
    .line 8
    move-result-wide v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Error; {:try_start_0 .. :try_end_0} :catch_0

    .line 9
    return-wide v0

    .line 10
    :catch_0
    move-exception p0

    .line 11
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 12
    .line 13
    .line 14
    goto :goto_0

    .line 15
    :catch_1
    move-exception p0

    .line 16
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 17
    .line 18
    .line 19
    :cond_0
    :goto_0
    const-wide/16 v0, 0x0

    .line 20
    .line 21
    return-wide v0
.end method

.method public G0()J
    .locals 2

    .line 1
    iget-object p0, p0, Ll/s410;->l1:Lcom/immomo/mediacore/sink/IjkWriter;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/immomo/mediacore/sink/IjkWriter;->getVideoCacheSize()J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    return-wide v0

    .line 10
    :cond_0
    const-wide/16 v0, 0x0

    .line 11
    .line 12
    return-wide v0
.end method

.method public G2()Ll/nsx;
    .locals 1

    .line 1
    new-instance v0, Ll/osx;

    .line 2
    .line 3
    iget-object p0, p0, Ll/s410;->J1:Ll/q210$a;

    .line 4
    .line 5
    invoke-direct {v0, p0}, Ll/osx;-><init>(Ll/q210$a;)V

    .line 6
    .line 7
    .line 8
    return-object v0
.end method

.method public H0(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/s410;->E1:Z

    .line 2
    .line 3
    return-void
.end method

.method public H1(I)V
    .locals 0

    .line 1
    return-void
.end method

.method public J0()J
    .locals 4

    .line 1
    iget-object p0, p0, Ll/s410;->l1:Lcom/immomo/mediacore/sink/IjkWriter;

    .line 2
    .line 3
    const-wide/16 v0, 0x0

    .line 4
    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    const/16 v2, 0x4e28

    .line 8
    .line 9
    invoke-virtual {p0, v2, v0, v1}, Lcom/immomo/mediacore/sink/IjkWriter;->getPropertyLong(IJ)J

    .line 10
    .line 11
    .line 12
    move-result-wide v0

    .line 13
    const-wide/16 v2, 0x17

    .line 14
    .line 15
    mul-long/2addr v0, v2

    .line 16
    :cond_0
    return-wide v0
.end method

.method public K0(Ljava/nio/ByteBuffer;)Z
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-virtual {p0, p1, v0}, Ll/s410;->L4(Ljava/nio/ByteBuffer;I)Z

    .line 3
    .line 4
    .line 5
    move-result p0

    .line 6
    return p0
.end method

.method public K1(Ll/oxd0;)V
    .locals 4

    .line 1
    iget-wide v0, p0, Ll/s410;->v1:J

    .line 2
    .line 3
    const-wide/16 v2, 0x0

    .line 4
    .line 5
    cmp-long v0, v0, v2

    .line 6
    .line 7
    if-gtz v0, :cond_1

    .line 8
    .line 9
    iget-boolean v0, p0, Ll/grx;->Z:Z

    .line 10
    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    return-void

    .line 15
    :cond_1
    :goto_0
    iget v0, p0, Ll/s410;->A1:I

    .line 16
    .line 17
    add-int/lit8 v0, v0, 0x1

    .line 18
    .line 19
    iput v0, p0, Ll/s410;->A1:I

    .line 20
    .line 21
    iget-object v0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->K:Ll/l6m;

    .line 22
    .line 23
    if-eqz v0, :cond_2

    .line 24
    .line 25
    check-cast v0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;

    .line 26
    .line 27
    invoke-virtual {v0, p1}, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->C(Ll/oxd0;)Ll/oxd0;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    :cond_2
    invoke-super {p0, p1}, Ll/grx;->K1(Ll/oxd0;)V

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public L0()J
    .locals 2

    .line 1
    iget-object p0, p0, Ll/s410;->l1:Lcom/immomo/mediacore/sink/IjkWriter;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/immomo/mediacore/sink/IjkWriter;->getAVDiff()J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    return-wide v0

    .line 10
    :cond_0
    const-wide/16 v0, 0x0

    .line 11
    .line 12
    return-wide v0
.end method

.method public L1()J
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/s410;->Z3()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    return-wide v0
.end method

.method public L4(Ljava/nio/ByteBuffer;I)Z
    .locals 3

    .line 1
    iget-boolean v0, p0, Ll/s410;->h2:Z

    .line 2
    .line 3
    const/4 v1, 0x2

    .line 4
    const/4 v2, 0x1

    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    if-ne p2, v1, :cond_1

    .line 8
    .line 9
    invoke-virtual {p1}, Ljava/nio/Buffer;->limit()I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    invoke-virtual {p0, p1, v0}, Ll/grx;->I2(Ljava/nio/ByteBuffer;I)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-nez v0, :cond_0

    .line 18
    .line 19
    invoke-virtual {p1}, Ljava/nio/Buffer;->limit()I

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    invoke-virtual {p0, p1, v0}, Ll/grx;->J2(Ljava/nio/ByteBuffer;I)Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-eqz v0, :cond_1

    .line 28
    .line 29
    :cond_0
    move v0, v2

    .line 30
    goto :goto_0

    .line 31
    :cond_1
    const/4 v0, 0x0

    .line 32
    :goto_0
    invoke-direct {p0, v0}, Ll/s410;->G4(Z)Z

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    if-eqz v0, :cond_2

    .line 37
    .line 38
    return v2

    .line 39
    :cond_2
    if-ne p2, v1, :cond_3

    .line 40
    .line 41
    invoke-virtual {p0, p1}, Ll/s410;->N4(Ljava/nio/ByteBuffer;)Z

    .line 42
    .line 43
    .line 44
    goto :goto_1

    .line 45
    :cond_3
    invoke-virtual {p0, p1}, Ll/s410;->M4(Ljava/nio/ByteBuffer;)Z

    .line 46
    .line 47
    .line 48
    :goto_1
    invoke-direct {p0}, Ll/s410;->r4()V

    .line 49
    .line 50
    .line 51
    return v2
.end method

.method public M0()I
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 2
    .line 3
    iget-wide v0, p0, Ll/wvx;->i:J

    .line 4
    .line 5
    long-to-int p0, v0

    .line 6
    return p0
.end method

.method public M1()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/hej;->M1()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    const-string v0, "MomoSurfaceFilter"

    .line 9
    .line 10
    const-string v1, "rendFrameBufferToCodec"

    .line 11
    .line 12
    invoke-virtual {p0, v0, v1}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public M4(Ljava/nio/ByteBuffer;)Z
    .locals 14

    .line 1
    iget-boolean v0, p0, Ll/s410;->p1:Z

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
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    new-instance v2, Ljava/lang/StringBuilder;

    .line 12
    .line 13
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 17
    .line 18
    .line 19
    move-result-object v3

    .line 20
    invoke-virtual {v3}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v3

    .line 24
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    const-string v3, " writeSoftAudioSample:"

    .line 28
    .line 29
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 30
    .line 31
    .line 32
    invoke-virtual {p1}, Ljava/nio/Buffer;->limit()I

    .line 33
    .line 34
    .line 35
    move-result v3

    .line 36
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 37
    .line 38
    .line 39
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object v2

    .line 43
    const-string v3, "Pipeline_Flow_pip->MOMO"

    .line 44
    .line 45
    invoke-virtual {v0, v3, v2}, Ll/oq70;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    iget-wide v2, p0, Ll/s410;->m1:J

    .line 49
    .line 50
    const-wide/16 v4, 0x0

    .line 51
    .line 52
    cmp-long v0, v2, v4

    .line 53
    .line 54
    if-nez v0, :cond_1

    .line 55
    .line 56
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 57
    .line 58
    .line 59
    move-result-wide v2

    .line 60
    iput-wide v2, p0, Ll/s410;->m1:J

    .line 61
    .line 62
    :cond_1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 63
    .line 64
    .line 65
    move-result-wide v2

    .line 66
    iget-wide v6, p0, Ll/s410;->m1:J

    .line 67
    .line 68
    sub-long v9, v2, v6

    .line 69
    .line 70
    iget-wide v2, p0, Ll/s410;->u1:J

    .line 71
    .line 72
    invoke-virtual {p1}, Ljava/nio/Buffer;->limit()I

    .line 73
    .line 74
    .line 75
    move-result v0

    .line 76
    int-to-long v6, v0

    .line 77
    add-long/2addr v2, v6

    .line 78
    iput-wide v2, p0, Ll/s410;->u1:J

    .line 79
    .line 80
    iget-wide v2, p0, Ll/s410;->w1:J

    .line 81
    .line 82
    const-wide/16 v6, 0x1

    .line 83
    .line 84
    add-long/2addr v2, v6

    .line 85
    iput-wide v2, p0, Ll/s410;->w1:J

    .line 86
    .line 87
    iget-wide v2, p0, Ll/s410;->y1:J

    .line 88
    .line 89
    cmp-long v0, v2, v4

    .line 90
    .line 91
    if-nez v0, :cond_2

    .line 92
    .line 93
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 94
    .line 95
    .line 96
    move-result-wide v2

    .line 97
    iput-wide v2, p0, Ll/s410;->y1:J

    .line 98
    .line 99
    :cond_2
    iget-object v8, p0, Ll/s410;->l1:Lcom/immomo/mediacore/sink/IjkWriter;

    .line 100
    .line 101
    if-eqz v8, :cond_3

    .line 102
    .line 103
    invoke-virtual {p1}, Ljava/nio/Buffer;->limit()I

    .line 104
    .line 105
    .line 106
    move-result v12

    .line 107
    const/4 v13, 0x0

    .line 108
    move-object v11, p1

    .line 109
    invoke-virtual/range {v8 .. v13}, Lcom/immomo/mediacore/sink/IjkWriter;->writeAudioPacket(JLjava/nio/ByteBuffer;II)V

    .line 110
    .line 111
    .line 112
    :cond_3
    return v1
.end method

.method public N0()J
    .locals 2

    .line 1
    iget-object v0, p0, Ll/s410;->l1:Lcom/immomo/mediacore/sink/IjkWriter;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/immomo/mediacore/sink/IjkWriter;->getTxbytes()J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    return-wide v0

    .line 10
    :cond_0
    iget-object p0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 11
    .line 12
    iget-wide v0, p0, Ll/wvx;->B:J

    .line 13
    .line 14
    return-wide v0
.end method

.method public N1()I
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public N4(Ljava/nio/ByteBuffer;)Z
    .locals 10

    .line 1
    iget-boolean v0, p0, Ll/s410;->p1:Z

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
    invoke-virtual {p1}, Ljava/nio/Buffer;->limit()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    invoke-virtual {p0, p1, v0}, Ll/grx;->I2(Ljava/nio/ByteBuffer;I)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    invoke-virtual {p1}, Ljava/nio/Buffer;->limit()I

    .line 16
    .line 17
    .line 18
    move-result v2

    .line 19
    const/4 v3, 0x0

    .line 20
    invoke-virtual {p0, p1, v2, v0, v3}, Ll/grx;->A2(Ljava/nio/ByteBuffer;IZI)Ljava/nio/ByteBuffer;

    .line 21
    .line 22
    .line 23
    move-result-object v7

    .line 24
    iget-wide v4, p0, Ll/s410;->t1:J

    .line 25
    .line 26
    invoke-virtual {p1}, Ljava/nio/Buffer;->capacity()I

    .line 27
    .line 28
    .line 29
    move-result v2

    .line 30
    int-to-long v8, v2

    .line 31
    add-long/2addr v4, v8

    .line 32
    iput-wide v4, p0, Ll/s410;->t1:J

    .line 33
    .line 34
    iget-wide v4, p0, Ll/s410;->v1:J

    .line 35
    .line 36
    const-wide/16 v8, 0x1

    .line 37
    .line 38
    add-long/2addr v4, v8

    .line 39
    iput-wide v4, p0, Ll/s410;->v1:J

    .line 40
    .line 41
    iget-wide v4, p0, Ll/s410;->x1:J

    .line 42
    .line 43
    const-wide/16 v8, 0x0

    .line 44
    .line 45
    cmp-long v2, v4, v8

    .line 46
    .line 47
    if-nez v2, :cond_1

    .line 48
    .line 49
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 50
    .line 51
    .line 52
    move-result-wide v4

    .line 53
    iput-wide v4, p0, Ll/s410;->x1:J

    .line 54
    .line 55
    :cond_1
    iget-wide v4, p0, Ll/s410;->n1:J

    .line 56
    .line 57
    cmp-long v2, v4, v8

    .line 58
    .line 59
    if-nez v2, :cond_2

    .line 60
    .line 61
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 62
    .line 63
    .line 64
    move-result-wide v4

    .line 65
    iput-wide v4, p0, Ll/s410;->n1:J

    .line 66
    .line 67
    :cond_2
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 68
    .line 69
    .line 70
    move-result-wide v4

    .line 71
    iget-wide v8, p0, Ll/s410;->n1:J

    .line 72
    .line 73
    sub-long v5, v4, v8

    .line 74
    .line 75
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 76
    .line 77
    .line 78
    move-result-object v2

    .line 79
    new-instance v4, Ljava/lang/StringBuilder;

    .line 80
    .line 81
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 82
    .line 83
    .line 84
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 85
    .line 86
    .line 87
    move-result-object v8

    .line 88
    invoke-virtual {v8}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 89
    .line 90
    .line 91
    move-result-object v8

    .line 92
    invoke-virtual {v4, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 93
    .line 94
    .line 95
    const-string v8, " writeSoftVideoSample:"

    .line 96
    .line 97
    invoke-virtual {v4, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 98
    .line 99
    .line 100
    invoke-virtual {p1}, Ljava/nio/Buffer;->limit()I

    .line 101
    .line 102
    .line 103
    move-result v8

    .line 104
    invoke-virtual {v4, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 105
    .line 106
    .line 107
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 108
    .line 109
    .line 110
    move-result-object v4

    .line 111
    const-string v8, "Pipeline_Flow_pip->MOMO"

    .line 112
    .line 113
    invoke-virtual {v2, v8, v4}, Ll/oq70;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 114
    .line 115
    .line 116
    invoke-virtual {p1}, Ljava/nio/Buffer;->limit()I

    .line 117
    .line 118
    .line 119
    move-result v2

    .line 120
    invoke-virtual {p0, p1, v2}, Ll/grx;->J2(Ljava/nio/ByteBuffer;I)Z

    .line 121
    .line 122
    .line 123
    move-result p1

    .line 124
    or-int/2addr p1, v0

    .line 125
    iget-object v4, p0, Ll/s410;->l1:Lcom/immomo/mediacore/sink/IjkWriter;

    .line 126
    .line 127
    if-eqz p1, :cond_4

    .line 128
    .line 129
    if-eqz v4, :cond_3

    .line 130
    .line 131
    invoke-virtual {v7}, Ljava/nio/Buffer;->limit()I

    .line 132
    .line 133
    .line 134
    move-result v8

    .line 135
    const/4 v9, 0x5

    .line 136
    invoke-virtual/range {v4 .. v9}, Lcom/immomo/mediacore/sink/SinkBase;->writeVideoPacket(JLjava/nio/ByteBuffer;II)V

    .line 137
    .line 138
    .line 139
    :cond_3
    invoke-direct {p0, v3, v5, v6}, Ll/s410;->I4(IJ)V

    .line 140
    .line 141
    .line 142
    goto :goto_0

    .line 143
    :cond_4
    if-eqz v4, :cond_5

    .line 144
    .line 145
    invoke-virtual {v7}, Ljava/nio/Buffer;->limit()I

    .line 146
    .line 147
    .line 148
    move-result v8

    .line 149
    const/4 v9, 0x1

    .line 150
    invoke-virtual/range {v4 .. v9}, Lcom/immomo/mediacore/sink/SinkBase;->writeVideoPacket(JLjava/nio/ByteBuffer;II)V

    .line 151
    .line 152
    .line 153
    :cond_5
    :goto_0
    return v1
.end method

.method public O0()J
    .locals 3

    .line 1
    iget-boolean v0, p0, Ll/grx;->Y0:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Ll/s410;->l1:Lcom/immomo/mediacore/sink/IjkWriter;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    const/16 p0, 0x4e2a

    .line 10
    .line 11
    const-wide/16 v1, 0x0

    .line 12
    .line 13
    invoke-virtual {v0, p0, v1, v2}, Lcom/immomo/mediacore/sink/IjkWriter;->getPropertyLong(IJ)J

    .line 14
    .line 15
    .line 16
    move-result-wide v0

    .line 17
    return-wide v0

    .line 18
    :cond_0
    iget-wide v0, p0, Ll/s410;->u1:J

    .line 19
    .line 20
    return-wide v0
.end method

.method public O1()V
    .locals 3

    .line 1
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "Pipeline_Flow_pip->MOMO"

    .line 6
    .line 7
    const-string v2, "startMuxing !##########################"

    .line 8
    .line 9
    invoke-virtual {v0, v1, v2}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    const/4 v0, 0x1

    .line 13
    iput-boolean v0, p0, Ll/grx;->X0:Z

    .line 14
    .line 15
    return-void
.end method

.method public P0(Ll/g510;IIII)V
    .locals 0

    .line 1
    iput p5, p0, Ll/s410;->B1:I

    .line 2
    .line 3
    iput p3, p0, Ll/s410;->C1:I

    .line 4
    .line 5
    iput p4, p0, Ll/s410;->D1:I

    .line 6
    .line 7
    return-void
.end method

.method public P2(I)V
    .locals 2
    .annotation build Landroidx/annotation/RequiresApi;
        api = 0x13
    .end annotation

    .line 1
    iget-object v0, p0, Ll/s410;->l1:Lcom/immomo/mediacore/sink/IjkWriter;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v1, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->s:Ll/uow;

    .line 6
    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    iget v1, v1, Ll/tow;->H:I

    .line 10
    .line 11
    invoke-virtual {v0, v1}, Lcom/immomo/mediacore/sink/IjkWriter;->setVideoEncodingBitRate(I)V

    .line 12
    .line 13
    .line 14
    :cond_0
    invoke-super {p0, p1}, Ll/grx;->P2(I)V

    .line 15
    .line 16
    .line 17
    iget-object p0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->F:Ll/wzl;

    .line 18
    .line 19
    if-eqz p0, :cond_1

    .line 20
    .line 21
    invoke-interface {p0, p1}, Ll/wzl;->t0(I)V

    .line 22
    .line 23
    .line 24
    :cond_1
    return-void
.end method

.method public Q0()I
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public R0(Ll/uow;Landroid/opengl/EGLContext;)V
    .locals 10
    .annotation build Landroidx/annotation/RequiresApi;
        api = 0x12
    .end annotation

    .line 1
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "Momo startRecord !##########################"

    .line 6
    .line 7
    const-string v2, "Pipeline_Flow_pip->MOMO"

    .line 8
    .line 9
    invoke-virtual {v0, v2, v1}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->I:Ll/evx;

    .line 13
    .line 14
    const-string v1, "momoPusher"

    .line 15
    .line 16
    const-string v3, "startRecord"

    .line 17
    .line 18
    filled-new-array {v1, v3}, [Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    invoke-virtual {v0, v1}, Ll/evx;->l([Ljava/lang/Object;)V

    .line 23
    .line 24
    .line 25
    iget-boolean v0, p0, Ll/grx;->X0:Z

    .line 26
    .line 27
    if-eqz v0, :cond_0

    .line 28
    .line 29
    return-void

    .line 30
    :cond_0
    iget-object v0, p0, Ll/s410;->T1:Ll/rp1;

    .line 31
    .line 32
    if-nez v0, :cond_1

    .line 33
    .line 34
    new-instance v0, Ll/rp1;

    .line 35
    .line 36
    invoke-direct {v0}, Ll/rp1;-><init>()V

    .line 37
    .line 38
    .line 39
    iput-object v0, p0, Ll/s410;->T1:Ll/rp1;

    .line 40
    .line 41
    :cond_1
    iget-object v0, p0, Ll/s410;->l1:Lcom/immomo/mediacore/sink/IjkWriter;

    .line 42
    .line 43
    const/4 v1, 0x0

    .line 44
    const-wide/16 v3, 0x0

    .line 45
    .line 46
    const/4 v5, 0x1

    .line 47
    if-nez v0, :cond_7

    .line 48
    .line 49
    if-eqz p1, :cond_7

    .line 50
    .line 51
    new-instance v0, Lcom/immomo/mediacore/sink/IjkWriter;

    .line 52
    .line 53
    invoke-direct {v0, p0, v1}, Lcom/immomo/mediacore/sink/IjkWriter;-><init>(Lcom/immomo/mediacore/strinf/NotifyCenter;Z)V

    .line 54
    .line 55
    .line 56
    iput-object v0, p0, Ll/s410;->l1:Lcom/immomo/mediacore/sink/IjkWriter;

    .line 57
    .line 58
    iput-wide v3, p0, Ll/s410;->e2:J

    .line 59
    .line 60
    iput-wide v3, p0, Ll/s410;->f2:J

    .line 61
    .line 62
    iput-wide v3, p0, Ll/s410;->g2:J

    .line 63
    .line 64
    invoke-virtual {v0, v5}, Lcom/immomo/mediacore/sink/IjkWriter;->setAudioSource(I)V

    .line 65
    .line 66
    .line 67
    iget-object v0, p0, Ll/s410;->l1:Lcom/immomo/mediacore/sink/IjkWriter;

    .line 68
    .line 69
    const/4 v6, 0x3

    .line 70
    invoke-virtual {v0, v6}, Lcom/immomo/mediacore/sink/IjkWriter;->setAudioEncoder(I)V

    .line 71
    .line 72
    .line 73
    iget-object v0, p0, Ll/s410;->l1:Lcom/immomo/mediacore/sink/IjkWriter;

    .line 74
    .line 75
    invoke-virtual {v0, v1}, Lcom/immomo/mediacore/sink/IjkWriter;->setBitRateAdaptEnable(I)V

    .line 76
    .line 77
    .line 78
    iget-object v0, p0, Ll/s410;->l1:Lcom/immomo/mediacore/sink/IjkWriter;

    .line 79
    .line 80
    iget v6, p1, Ll/tow;->P:I

    .line 81
    .line 82
    invoke-virtual {v0, v6}, Lcom/immomo/mediacore/sink/IjkWriter;->setAudioSamplingRate(I)V

    .line 83
    .line 84
    .line 85
    iget-object v0, p0, Ll/s410;->l1:Lcom/immomo/mediacore/sink/IjkWriter;

    .line 86
    .line 87
    iget v6, p1, Ll/tow;->S:I

    .line 88
    .line 89
    invoke-virtual {v0, v6}, Lcom/immomo/mediacore/sink/IjkWriter;->setAudioEncodingBitRate(I)V

    .line 90
    .line 91
    .line 92
    iget-boolean v0, p0, Ll/grx;->Z:Z

    .line 93
    .line 94
    if-nez v0, :cond_3

    .line 95
    .line 96
    iget-object v0, p0, Ll/s410;->l1:Lcom/immomo/mediacore/sink/IjkWriter;

    .line 97
    .line 98
    invoke-virtual {v0, v5}, Lcom/immomo/mediacore/sink/IjkWriter;->setVideoSource(I)V

    .line 99
    .line 100
    .line 101
    iget-boolean v0, p1, Ll/uow;->H0:Z

    .line 102
    .line 103
    iget-object v6, p0, Ll/s410;->l1:Lcom/immomo/mediacore/sink/IjkWriter;

    .line 104
    .line 105
    if-eqz v0, :cond_2

    .line 106
    .line 107
    const/4 v0, 0x5

    .line 108
    invoke-virtual {v6, v0}, Lcom/immomo/mediacore/sink/IjkWriter;->setVideoEncoder(I)V

    .line 109
    .line 110
    .line 111
    goto :goto_0

    .line 112
    :cond_2
    const/4 v0, 0x2

    .line 113
    invoke-virtual {v6, v0}, Lcom/immomo/mediacore/sink/IjkWriter;->setVideoEncoder(I)V

    .line 114
    .line 115
    .line 116
    :goto_0
    iget-object v0, p0, Ll/s410;->l1:Lcom/immomo/mediacore/sink/IjkWriter;

    .line 117
    .line 118
    iget v6, p1, Ll/tow;->m:I

    .line 119
    .line 120
    iget v7, p1, Ll/tow;->n:I

    .line 121
    .line 122
    invoke-virtual {v0, v6, v7}, Lcom/immomo/mediacore/sink/IjkWriter;->setVideoSize(II)V

    .line 123
    .line 124
    .line 125
    iget-object v0, p0, Ll/s410;->l1:Lcom/immomo/mediacore/sink/IjkWriter;

    .line 126
    .line 127
    iget v6, p1, Ll/tow;->H:I

    .line 128
    .line 129
    invoke-virtual {v0, v6}, Lcom/immomo/mediacore/sink/IjkWriter;->setVideoEncodingBitRate(I)V

    .line 130
    .line 131
    .line 132
    iget-object v0, p0, Ll/s410;->l1:Lcom/immomo/mediacore/sink/IjkWriter;

    .line 133
    .line 134
    const/16 v6, 0x14

    .line 135
    .line 136
    invoke-virtual {v0, v6}, Lcom/immomo/mediacore/sink/IjkWriter;->setVideoFrameRate(I)V

    .line 137
    .line 138
    .line 139
    :cond_3
    iget-object v0, p1, Ll/uow;->A0:Lcom/momo/pipline/MomoInterface/MomoPipeline$DecodeType;

    .line 140
    .line 141
    sget-object v6, Lcom/momo/pipline/MomoInterface/MomoPipeline$DecodeType;->SOFT_DECODE:Lcom/momo/pipline/MomoInterface/MomoPipeline$DecodeType;

    .line 142
    .line 143
    if-ne v0, v6, :cond_4

    .line 144
    .line 145
    iput-boolean v1, p0, Ll/grx;->Y0:Z

    .line 146
    .line 147
    :cond_4
    iget-object v0, p0, Ll/s410;->l1:Lcom/immomo/mediacore/sink/IjkWriter;

    .line 148
    .line 149
    const/16 v6, 0x7530

    .line 150
    .line 151
    invoke-virtual {v0, v6, v3, v4}, Lcom/immomo/mediacore/sink/IjkWriter;->setPropertyLong(IJ)V

    .line 152
    .line 153
    .line 154
    iget-object v0, p0, Ll/s410;->s1:Ljava/lang/String;

    .line 155
    .line 156
    iget-object v6, p0, Ll/s410;->l1:Lcom/immomo/mediacore/sink/IjkWriter;

    .line 157
    .line 158
    if-eqz v0, :cond_5

    .line 159
    .line 160
    iget v7, p0, Ll/s410;->q1:I

    .line 161
    .line 162
    iget-object v8, p0, Ll/s410;->r1:Ljava/lang/String;

    .line 163
    .line 164
    invoke-virtual {v6, v7, v8, v0}, Lcom/immomo/mediacore/sink/IjkWriter;->setStreamerInOutAndType(ILjava/lang/String;Ljava/lang/String;)V

    .line 165
    .line 166
    .line 167
    iget-object v0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 168
    .line 169
    iget-object v6, p0, Ll/s410;->s1:Ljava/lang/String;

    .line 170
    .line 171
    iput-object v6, v0, Ll/wvx;->x:Ljava/lang/String;

    .line 172
    .line 173
    goto :goto_1

    .line 174
    :cond_5
    const/4 v0, 0x0

    .line 175
    iget-object v7, p1, Ll/uow;->v0:Ljava/lang/String;

    .line 176
    .line 177
    const/16 v8, 0xa

    .line 178
    .line 179
    invoke-virtual {v6, v8, v0, v7}, Lcom/immomo/mediacore/sink/IjkWriter;->setStreamerInOutAndType(ILjava/lang/String;Ljava/lang/String;)V

    .line 180
    .line 181
    .line 182
    iget-object v0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 183
    .line 184
    iget-object v6, p1, Ll/uow;->v0:Ljava/lang/String;

    .line 185
    .line 186
    iput-object v6, v0, Ll/wvx;->x:Ljava/lang/String;

    .line 187
    .line 188
    :goto_1
    iget-object v0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 189
    .line 190
    iget-object v0, v0, Ll/wvx;->x:Ljava/lang/String;

    .line 191
    .line 192
    invoke-direct {p0, v0}, Ll/s410;->l4(Ljava/lang/String;)V

    .line 193
    .line 194
    .line 195
    iget-object v0, p1, Ll/uow;->w0:Ll/p4k0;

    .line 196
    .line 197
    iput-object v0, p0, Ll/s410;->b2:Ll/p4k0;

    .line 198
    .line 199
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 200
    .line 201
    .line 202
    move-result-object v0

    .line 203
    new-instance v6, Ljava/lang/StringBuilder;

    .line 204
    .line 205
    const-string v7, "startRecord    "

    .line 206
    .line 207
    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 208
    .line 209
    .line 210
    iget-object v7, p1, Ll/uow;->v0:Ljava/lang/String;

    .line 211
    .line 212
    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 213
    .line 214
    .line 215
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 216
    .line 217
    .line 218
    move-result-object v6

    .line 219
    invoke-virtual {v0, v2, v6}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 220
    .line 221
    .line 222
    iget-object v0, p0, Ll/s410;->l1:Lcom/immomo/mediacore/sink/IjkWriter;

    .line 223
    .line 224
    invoke-virtual {v0}, Lcom/immomo/mediacore/sink/IjkWriter;->prepare()Z

    .line 225
    .line 226
    .line 227
    move-result v0

    .line 228
    iget-object v6, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 229
    .line 230
    iget-object v7, p0, Ll/s410;->l1:Lcom/immomo/mediacore/sink/IjkWriter;

    .line 231
    .line 232
    invoke-virtual {v7}, Lcom/immomo/mediacore/sink/IjkWriter;->getOutputUrl()Ljava/lang/String;

    .line 233
    .line 234
    .line 235
    move-result-object v7

    .line 236
    iput-object v7, v6, Ll/wvx;->x:Ljava/lang/String;

    .line 237
    .line 238
    iget-object v6, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 239
    .line 240
    iget-boolean v7, p1, Ll/uow;->H0:Z

    .line 241
    .line 242
    if-eqz v7, :cond_6

    .line 243
    .line 244
    const-wide/16 v7, 0x2

    .line 245
    .line 246
    goto :goto_2

    .line 247
    :cond_6
    move-wide v7, v3

    .line 248
    :goto_2
    iput-wide v7, v6, Ll/wvx;->g:J

    .line 249
    .line 250
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 251
    .line 252
    .line 253
    move-result-object v6

    .line 254
    new-instance v7, Ljava/lang/StringBuilder;

    .line 255
    .line 256
    const-string v8, "startRecord end!!!!!    "

    .line 257
    .line 258
    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 259
    .line 260
    .line 261
    iget-object v8, p1, Ll/uow;->v0:Ljava/lang/String;

    .line 262
    .line 263
    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 264
    .line 265
    .line 266
    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 267
    .line 268
    .line 269
    move-result-object v7

    .line 270
    invoke-virtual {v6, v2, v7}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 271
    .line 272
    .line 273
    iget v6, p1, Ll/tow;->m:I

    .line 274
    .line 275
    iput v6, p0, Ll/s410;->c2:I

    .line 276
    .line 277
    iget v6, p1, Ll/tow;->n:I

    .line 278
    .line 279
    iput v6, p0, Ll/s410;->d2:I

    .line 280
    .line 281
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 282
    .line 283
    .line 284
    move-result-object v6

    .line 285
    new-instance v7, Ljava/lang/StringBuilder;

    .line 286
    .line 287
    const-string v8, "videoWidth:"

    .line 288
    .line 289
    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 290
    .line 291
    .line 292
    iget v8, p1, Ll/tow;->s:I

    .line 293
    .line 294
    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 295
    .line 296
    .line 297
    const-string v8, ",videoHeight:"

    .line 298
    .line 299
    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 300
    .line 301
    .line 302
    iget v8, p1, Ll/tow;->t:I

    .line 303
    .line 304
    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 305
    .line 306
    .line 307
    const-string v8, ",visualWidth:"

    .line 308
    .line 309
    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 310
    .line 311
    .line 312
    iget v8, p1, Ll/tow;->u:I

    .line 313
    .line 314
    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 315
    .line 316
    .line 317
    const-string v8, ",visualHeight:"

    .line 318
    .line 319
    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 320
    .line 321
    .line 322
    iget v8, p1, Ll/tow;->v:I

    .line 323
    .line 324
    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 325
    .line 326
    .line 327
    const-string v8, ",encodeWidth:"

    .line 328
    .line 329
    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 330
    .line 331
    .line 332
    iget v8, p1, Ll/tow;->m:I

    .line 333
    .line 334
    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 335
    .line 336
    .line 337
    const-string v8, ",encodeHeight:"

    .line 338
    .line 339
    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 340
    .line 341
    .line 342
    iget v8, p1, Ll/tow;->n:I

    .line 343
    .line 344
    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 345
    .line 346
    .line 347
    const-string v8, ",videoBitrate:"

    .line 348
    .line 349
    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 350
    .line 351
    .line 352
    iget v8, p1, Ll/tow;->H:I

    .line 353
    .line 354
    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 355
    .line 356
    .line 357
    const-string v8, ",audioBitrate:"

    .line 358
    .line 359
    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 360
    .line 361
    .line 362
    iget v8, p1, Ll/tow;->S:I

    .line 363
    .line 364
    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 365
    .line 366
    .line 367
    const-string v8, ",videoFPS:"

    .line 368
    .line 369
    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 370
    .line 371
    .line 372
    iget v8, p1, Ll/tow;->F:I

    .line 373
    .line 374
    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 375
    .line 376
    .line 377
    const-string v8, ",codecFPS:"

    .line 378
    .line 379
    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 380
    .line 381
    .line 382
    iget v8, p1, Ll/uow;->E0:I

    .line 383
    .line 384
    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 385
    .line 386
    .line 387
    const-string v8, ",isHard:"

    .line 388
    .line 389
    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 390
    .line 391
    .line 392
    iget-object v8, p1, Ll/uow;->A0:Lcom/momo/pipline/MomoInterface/MomoPipeline$DecodeType;

    .line 393
    .line 394
    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 395
    .line 396
    .line 397
    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 398
    .line 399
    .line 400
    move-result-object v7

    .line 401
    invoke-virtual {v6, v2, v7}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 402
    .line 403
    .line 404
    goto :goto_3

    .line 405
    :cond_7
    move v0, v5

    .line 406
    :goto_3
    iget-object v6, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 407
    .line 408
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 409
    .line 410
    .line 411
    move-result-wide v7

    .line 412
    iput-wide v7, v6, Ll/wvx;->a:J

    .line 413
    .line 414
    iget-object v6, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 415
    .line 416
    const-string v7, "nonConf"

    .line 417
    .line 418
    iput-object v7, v6, Ll/wvx;->B0:Ljava/lang/String;

    .line 419
    .line 420
    iget-object v6, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 421
    .line 422
    iget-boolean v7, p1, Ll/tow;->b0:Z

    .line 423
    .line 424
    if-eqz v7, :cond_8

    .line 425
    .line 426
    const-wide/16 v3, 0x1

    .line 427
    .line 428
    :cond_8
    iput-wide v3, v6, Ll/wvx;->b1:J

    .line 429
    .line 430
    iget v3, p1, Ll/tow;->H:I

    .line 431
    .line 432
    int-to-long v3, v3

    .line 433
    iput-wide v3, v6, Ll/wvx;->F0:J

    .line 434
    .line 435
    iget v3, p1, Ll/tow;->S:I

    .line 436
    .line 437
    int-to-long v3, v3

    .line 438
    iput-wide v3, v6, Ll/wvx;->C0:J

    .line 439
    .line 440
    if-eqz v0, :cond_9

    .line 441
    .line 442
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 443
    .line 444
    .line 445
    move-result-object v0

    .line 446
    new-instance v3, Ljava/lang/StringBuilder;

    .line 447
    .line 448
    const-string v4, "startRecord eglContext start!!!!!    "

    .line 449
    .line 450
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 451
    .line 452
    .line 453
    iget-object v4, p1, Ll/uow;->v0:Ljava/lang/String;

    .line 454
    .line 455
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 456
    .line 457
    .line 458
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 459
    .line 460
    .line 461
    move-result-object v3

    .line 462
    invoke-virtual {v0, v2, v3}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 463
    .line 464
    .line 465
    invoke-super {p0, p1, p2}, Ll/grx;->R0(Ll/uow;Landroid/opengl/EGLContext;)V

    .line 466
    .line 467
    .line 468
    invoke-static {}, Ll/yt0;->g()Ll/yt0;

    .line 469
    .line 470
    .line 471
    move-result-object p2

    .line 472
    invoke-virtual {p0}, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->W1()Landroid/content/Context;

    .line 473
    .line 474
    .line 475
    move-result-object v0

    .line 476
    sget v3, Ll/yt0;->e:I

    .line 477
    .line 478
    invoke-virtual {p2, v0, v3}, Ll/yt0;->p(Landroid/content/Context;I)V

    .line 479
    .line 480
    .line 481
    iget-object p2, p0, Ll/s410;->l1:Lcom/immomo/mediacore/sink/IjkWriter;

    .line 482
    .line 483
    if-eqz p2, :cond_9

    .line 484
    .line 485
    iget-object v0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 486
    .line 487
    invoke-virtual {p2}, Lcom/immomo/mediacore/sink/IjkWriter;->getServerIpAddr()Ljava/lang/String;

    .line 488
    .line 489
    .line 490
    move-result-object p2

    .line 491
    iput-object p2, v0, Ll/wvx;->Z:Ljava/lang/String;

    .line 492
    .line 493
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 494
    .line 495
    .line 496
    move-result-object p2

    .line 497
    new-instance v0, Ljava/lang/StringBuilder;

    .line 498
    .line 499
    const-string v3, "startRecord eglContext end!!!!!    "

    .line 500
    .line 501
    invoke-direct {v0, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 502
    .line 503
    .line 504
    iget-object v3, p1, Ll/uow;->v0:Ljava/lang/String;

    .line 505
    .line 506
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 507
    .line 508
    .line 509
    const-string v3, " ip "

    .line 510
    .line 511
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 512
    .line 513
    .line 514
    iget-object v3, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 515
    .line 516
    iget-object v3, v3, Ll/wvx;->Z:Ljava/lang/String;

    .line 517
    .line 518
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 519
    .line 520
    .line 521
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 522
    .line 523
    .line 524
    move-result-object v0

    .line 525
    invoke-virtual {p2, v2, v0}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 526
    .line 527
    .line 528
    :cond_9
    iget-object p2, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->I:Ll/evx;

    .line 529
    .line 530
    new-instance v0, Ljava/lang/StringBuilder;

    .line 531
    .line 532
    const-string v2, "startRecord, pushDrop "

    .line 533
    .line 534
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 535
    .line 536
    .line 537
    invoke-static {}, Ll/csx;->R()Ll/csx;

    .line 538
    .line 539
    .line 540
    move-result-object v2

    .line 541
    invoke-virtual {v2}, Ll/csx;->R0()Z

    .line 542
    .line 543
    .line 544
    move-result v2

    .line 545
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 546
    .line 547
    .line 548
    const-string v2, ",flv :"

    .line 549
    .line 550
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 551
    .line 552
    .line 553
    invoke-static {}, Ll/csx;->R()Ll/csx;

    .line 554
    .line 555
    .line 556
    move-result-object v2

    .line 557
    invoke-virtual {v2}, Ll/csx;->K0()Z

    .line 558
    .line 559
    .line 560
    move-result v2

    .line 561
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 562
    .line 563
    .line 564
    const-string v2, ",high:"

    .line 565
    .line 566
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 567
    .line 568
    .line 569
    invoke-static {}, Ll/csx;->R()Ll/csx;

    .line 570
    .line 571
    .line 572
    move-result-object v2

    .line 573
    invoke-virtual {v2}, Ll/csx;->c0()I

    .line 574
    .line 575
    .line 576
    move-result v2

    .line 577
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 578
    .line 579
    .line 580
    const-string v2, ",base:"

    .line 581
    .line 582
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 583
    .line 584
    .line 585
    invoke-static {}, Ll/csx;->R()Ll/csx;

    .line 586
    .line 587
    .line 588
    move-result-object v2

    .line 589
    invoke-virtual {v2}, Ll/csx;->b0()I

    .line 590
    .line 591
    .line 592
    move-result v2

    .line 593
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 594
    .line 595
    .line 596
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 597
    .line 598
    .line 599
    move-result-object v0

    .line 600
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 601
    .line 602
    .line 603
    move-result-object v0

    .line 604
    invoke-virtual {p2, v0}, Ll/evx;->l([Ljava/lang/Object;)V

    .line 605
    .line 606
    .line 607
    new-instance p2, Ljava/lang/StringBuilder;

    .line 608
    .line 609
    const-string v0, "startRecord mPolicyDropFrameEnable ["

    .line 610
    .line 611
    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 612
    .line 613
    .line 614
    iget-boolean v0, p1, Ll/uow;->I0:Z

    .line 615
    .line 616
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 617
    .line 618
    .line 619
    const-string v0, ","

    .line 620
    .line 621
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 622
    .line 623
    .line 624
    iget-wide v2, p1, Ll/uow;->J0:J

    .line 625
    .line 626
    invoke-virtual {p2, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 627
    .line 628
    .line 629
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 630
    .line 631
    .line 632
    iget-wide v2, p1, Ll/uow;->K0:J

    .line 633
    .line 634
    invoke-virtual {p2, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 635
    .line 636
    .line 637
    const-string v0, "] vds "

    .line 638
    .line 639
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 640
    .line 641
    .line 642
    iget-boolean v0, p1, Ll/uow;->M0:Z

    .line 643
    .line 644
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 645
    .line 646
    .line 647
    const-string v0, "/"

    .line 648
    .line 649
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 650
    .line 651
    .line 652
    iget v0, p1, Ll/uow;->N0:I

    .line 653
    .line 654
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 655
    .line 656
    .line 657
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 658
    .line 659
    .line 660
    move-result-object p2

    .line 661
    const-string v0, "zhangjj"

    .line 662
    .line 663
    invoke-static {v0, p2}, Ll/t9c;->a(Ljava/lang/String;Ljava/lang/String;)I

    .line 664
    .line 665
    .line 666
    invoke-static {}, Ll/csx;->R()Ll/csx;

    .line 667
    .line 668
    .line 669
    move-result-object p2

    .line 670
    invoke-virtual {p2}, Ll/csx;->R0()Z

    .line 671
    .line 672
    .line 673
    move-result p2

    .line 674
    if-eqz p2, :cond_a

    .line 675
    .line 676
    iput-boolean v1, p1, Ll/uow;->I0:Z

    .line 677
    .line 678
    iget-object p2, p0, Ll/s410;->l1:Lcom/immomo/mediacore/sink/IjkWriter;

    .line 679
    .line 680
    invoke-static {}, Ll/csx;->R()Ll/csx;

    .line 681
    .line 682
    .line 683
    move-result-object v0

    .line 684
    invoke-virtual {v0}, Ll/csx;->c0()I

    .line 685
    .line 686
    .line 687
    move-result v0

    .line 688
    invoke-static {}, Ll/csx;->R()Ll/csx;

    .line 689
    .line 690
    .line 691
    move-result-object v1

    .line 692
    invoke-virtual {v1}, Ll/csx;->b0()I

    .line 693
    .line 694
    .line 695
    move-result v1

    .line 696
    invoke-virtual {p2, v5, v0, v1}, Lcom/immomo/mediacore/sink/IjkWriter;->setDropCache(III)V

    .line 697
    .line 698
    .line 699
    :cond_a
    iget-object p2, p0, Ll/s410;->l1:Lcom/immomo/mediacore/sink/IjkWriter;

    .line 700
    .line 701
    if-eqz p2, :cond_b

    .line 702
    .line 703
    invoke-static {}, Ll/csx;->R()Ll/csx;

    .line 704
    .line 705
    .line 706
    move-result-object p2

    .line 707
    invoke-virtual {p2}, Ll/csx;->e()I

    .line 708
    .line 709
    .line 710
    move-result p2

    .line 711
    iget-object v0, p0, Ll/s410;->l1:Lcom/immomo/mediacore/sink/IjkWriter;

    .line 712
    .line 713
    const/16 v1, 0x7532

    .line 714
    .line 715
    int-to-long v2, p2

    .line 716
    invoke-virtual {v0, v1, v2, v3}, Lcom/immomo/mediacore/sink/IjkWriter;->setPropertyLong(IJ)V

    .line 717
    .line 718
    .line 719
    invoke-static {}, Ll/csx;->R()Ll/csx;

    .line 720
    .line 721
    .line 722
    move-result-object p2

    .line 723
    invoke-virtual {p2}, Ll/csx;->K0()Z

    .line 724
    .line 725
    .line 726
    move-result p2

    .line 727
    iget-object v0, p0, Ll/s410;->l1:Lcom/immomo/mediacore/sink/IjkWriter;

    .line 728
    .line 729
    const/16 v1, 0x7533

    .line 730
    .line 731
    int-to-long v2, p2

    .line 732
    invoke-virtual {v0, v1, v2, v3}, Lcom/immomo/mediacore/sink/IjkWriter;->setPropertyLong(IJ)V

    .line 733
    .line 734
    .line 735
    :cond_b
    invoke-static {}, Ll/csx;->R()Ll/csx;

    .line 736
    .line 737
    .line 738
    move-result-object p2

    .line 739
    invoke-virtual {p2}, Ll/csx;->j()I

    .line 740
    .line 741
    .line 742
    move-result p2

    .line 743
    invoke-static {}, Ll/csx;->R()Ll/csx;

    .line 744
    .line 745
    .line 746
    move-result-object v0

    .line 747
    invoke-virtual {v0}, Ll/csx;->z()I

    .line 748
    .line 749
    .line 750
    move-result v0

    .line 751
    div-int/2addr p2, v0

    .line 752
    new-array p2, p2, [I

    .line 753
    .line 754
    iput-object p2, p0, Ll/s410;->W1:[I

    .line 755
    .line 756
    new-instance p2, Lcom/immomo/medialog/util/LimitedQueue;

    .line 757
    .line 758
    invoke-static {}, Ll/csx;->R()Ll/csx;

    .line 759
    .line 760
    .line 761
    move-result-object v0

    .line 762
    invoke-virtual {v0}, Ll/csx;->j()I

    .line 763
    .line 764
    .line 765
    move-result v0

    .line 766
    invoke-static {}, Ll/csx;->R()Ll/csx;

    .line 767
    .line 768
    .line 769
    move-result-object v1

    .line 770
    invoke-virtual {v1}, Ll/csx;->z()I

    .line 771
    .line 772
    .line 773
    move-result v1

    .line 774
    div-int/2addr v0, v1

    .line 775
    invoke-direct {p2, v0}, Lcom/immomo/medialog/util/LimitedQueue;-><init>(I)V

    .line 776
    .line 777
    .line 778
    iput-object p2, p0, Ll/s410;->Y1:Lcom/immomo/medialog/util/LimitedQueue;

    .line 779
    .line 780
    invoke-static {}, Ll/csx;->R()Ll/csx;

    .line 781
    .line 782
    .line 783
    move-result-object p2

    .line 784
    invoke-static {}, Ll/csx;->R()Ll/csx;

    .line 785
    .line 786
    .line 787
    move-result-object v0

    .line 788
    invoke-virtual {v0}, Ll/csx;->P0()Z

    .line 789
    .line 790
    .line 791
    move-result v0

    .line 792
    invoke-virtual {p2, v0}, Ll/csx;->C1(I)V

    .line 793
    .line 794
    .line 795
    iget-object p2, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->I:Ll/evx;

    .line 796
    .line 797
    iget-boolean v0, p1, Ll/uow;->I0:Z

    .line 798
    .line 799
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 800
    .line 801
    .line 802
    move-result-object v2

    .line 803
    iget-wide v0, p1, Ll/uow;->J0:J

    .line 804
    .line 805
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 806
    .line 807
    .line 808
    move-result-object v3

    .line 809
    iget-wide v0, p1, Ll/uow;->K0:J

    .line 810
    .line 811
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 812
    .line 813
    .line 814
    move-result-object v4

    .line 815
    invoke-static {}, Ll/csx;->R()Ll/csx;

    .line 816
    .line 817
    .line 818
    move-result-object v0

    .line 819
    invoke-virtual {v0}, Ll/csx;->R0()Z

    .line 820
    .line 821
    .line 822
    move-result v0

    .line 823
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 824
    .line 825
    .line 826
    move-result-object v5

    .line 827
    invoke-static {}, Ll/csx;->R()Ll/csx;

    .line 828
    .line 829
    .line 830
    move-result-object v0

    .line 831
    invoke-virtual {v0}, Ll/csx;->c0()I

    .line 832
    .line 833
    .line 834
    move-result v0

    .line 835
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 836
    .line 837
    .line 838
    move-result-object v6

    .line 839
    invoke-static {}, Ll/csx;->R()Ll/csx;

    .line 840
    .line 841
    .line 842
    move-result-object v0

    .line 843
    invoke-virtual {v0}, Ll/csx;->b0()I

    .line 844
    .line 845
    .line 846
    move-result v0

    .line 847
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 848
    .line 849
    .line 850
    move-result-object v7

    .line 851
    invoke-static {}, Ll/csx;->R()Ll/csx;

    .line 852
    .line 853
    .line 854
    move-result-object v0

    .line 855
    invoke-virtual {v0}, Ll/csx;->P0()Z

    .line 856
    .line 857
    .line 858
    move-result v0

    .line 859
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 860
    .line 861
    .line 862
    move-result-object v8

    .line 863
    iget-object v0, p0, Ll/s410;->s1:Ljava/lang/String;

    .line 864
    .line 865
    if-eqz v0, :cond_c

    .line 866
    .line 867
    :goto_4
    move-object v9, v0

    .line 868
    goto :goto_5

    .line 869
    :cond_c
    iget-object v0, p1, Ll/uow;->v0:Ljava/lang/String;

    .line 870
    .line 871
    goto :goto_4

    .line 872
    :goto_5
    const-string v1, "mrCoreParameters"

    .line 873
    .line 874
    filled-new-array/range {v1 .. v9}, [Ljava/lang/Object;

    .line 875
    .line 876
    .line 877
    move-result-object p1

    .line 878
    invoke-virtual {p2, p1}, Ll/evx;->l([Ljava/lang/Object;)V

    .line 879
    .line 880
    .line 881
    invoke-direct {p0}, Ll/s410;->F4()V

    .line 882
    .line 883
    .line 884
    return-void
.end method

.method public T0()I
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 2
    .line 3
    iget-wide v0, p0, Ll/wvx;->Q:J

    .line 4
    .line 5
    long-to-int p0, v0

    .line 6
    return p0
.end method

.method public V0()J
    .locals 3

    .line 1
    iget-object p0, p0, Ll/s410;->l1:Lcom/immomo/mediacore/sink/IjkWriter;

    .line 2
    .line 3
    const-wide/16 v0, 0x0

    .line 4
    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    const/16 v2, 0x4e22

    .line 8
    .line 9
    invoke-virtual {p0, v2, v0, v1}, Lcom/immomo/mediacore/sink/IjkWriter;->getPropertyLong(IJ)J

    .line 10
    .line 11
    .line 12
    move-result-wide v0

    .line 13
    :cond_0
    return-wide v0
.end method

.method public W(Ljava/nio/ByteBuffer;)V
    .locals 0

    .line 1
    return-void
.end method

.method public W0()I
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public X0()J
    .locals 3

    .line 1
    iget-object p0, p0, Ll/s410;->l1:Lcom/immomo/mediacore/sink/IjkWriter;

    .line 2
    .line 3
    const-wide/16 v0, 0x0

    .line 4
    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    const/16 v2, 0x4e25

    .line 8
    .line 9
    invoke-virtual {p0, v2, v0, v1}, Lcom/immomo/mediacore/sink/IjkWriter;->getPropertyLong(IJ)J

    .line 10
    .line 11
    .line 12
    move-result-wide v0

    .line 13
    :cond_0
    return-wide v0
.end method

.method public X3()J
    .locals 3

    .line 1
    iget-object p0, p0, Ll/s410;->l1:Lcom/immomo/mediacore/sink/IjkWriter;

    .line 2
    .line 3
    const-wide/16 v0, 0x0

    .line 4
    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    const/16 v2, 0x4e36

    .line 8
    .line 9
    :try_start_0
    invoke-virtual {p0, v2, v0, v1}, Lcom/immomo/mediacore/sink/IjkWriter;->getPropertyLong(IJ)J

    .line 10
    .line 11
    .line 12
    move-result-wide v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Error; {:try_start_0 .. :try_end_0} :catch_0

    .line 13
    return-wide v0

    .line 14
    :catch_0
    move-exception p0

    .line 15
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 16
    .line 17
    .line 18
    goto :goto_0

    .line 19
    :catch_1
    move-exception p0

    .line 20
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 21
    .line 22
    .line 23
    :cond_0
    :goto_0
    return-wide v0
.end method

.method public Y(Ll/g510;Ll/uow;)V
    .locals 7

    .line 1
    invoke-super {p0, p1, p2}, Ll/grx;->Y(Ll/g510;Ll/uow;)V

    .line 2
    .line 3
    .line 4
    if-nez p2, :cond_0

    .line 5
    .line 6
    goto :goto_0

    .line 7
    :cond_0
    iget p1, p2, Ll/tow;->m:I

    .line 8
    .line 9
    iget v0, p2, Ll/tow;->n:I

    .line 10
    .line 11
    iget-object v1, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->I:Ll/evx;

    .line 12
    .line 13
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 18
    .line 19
    .line 20
    move-result-object v3

    .line 21
    iget v4, p2, Ll/tow;->H:I

    .line 22
    .line 23
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 24
    .line 25
    .line 26
    move-result-object v4

    .line 27
    iget v5, p2, Ll/tow;->F:I

    .line 28
    .line 29
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 30
    .line 31
    .line 32
    move-result-object v5

    .line 33
    const-string v6, "resetCodec"

    .line 34
    .line 35
    filled-new-array {v6, v2, v3, v4, v5}, [Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    move-result-object v2

    .line 39
    invoke-virtual {v1, v2}, Ll/evx;->l([Ljava/lang/Object;)V

    .line 40
    .line 41
    .line 42
    iget-object v1, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 43
    .line 44
    iget v2, p2, Ll/tow;->H:I

    .line 45
    .line 46
    int-to-long v2, v2

    .line 47
    iput-wide v2, v1, Ll/wvx;->F0:J

    .line 48
    .line 49
    iget-object v1, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->I:Ll/evx;

    .line 50
    .line 51
    const-string v4, "resetCodec videoBitrateSetByuser"

    .line 52
    .line 53
    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 54
    .line 55
    .line 56
    move-result-object v2

    .line 57
    filled-new-array {v4, v2}, [Ljava/lang/Object;

    .line 58
    .line 59
    .line 60
    move-result-object v2

    .line 61
    invoke-virtual {v1, v2}, Ll/evx;->l([Ljava/lang/Object;)V

    .line 62
    .line 63
    .line 64
    iget-boolean v1, p2, Ll/uow;->F0:Z

    .line 65
    .line 66
    if-eqz v1, :cond_1

    .line 67
    .line 68
    iget p1, p2, Ll/tow;->n:I

    .line 69
    .line 70
    iget v0, p2, Ll/tow;->m:I

    .line 71
    .line 72
    :cond_1
    iget-object p2, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->s:Ll/uow;

    .line 73
    .line 74
    iget v1, p2, Ll/tow;->m:I

    .line 75
    .line 76
    iput v1, p0, Ll/s410;->c2:I

    .line 77
    .line 78
    iget p2, p2, Ll/tow;->n:I

    .line 79
    .line 80
    iput p2, p0, Ll/s410;->d2:I

    .line 81
    .line 82
    iget-object p2, p0, Ll/s410;->z2:Ll/s410$d;

    .line 83
    .line 84
    invoke-virtual {p2}, Ll/s410$d;->d()V

    .line 85
    .line 86
    .line 87
    iget-object p0, p0, Ll/s410;->l1:Lcom/immomo/mediacore/sink/IjkWriter;

    .line 88
    .line 89
    if-eqz p0, :cond_2

    .line 90
    .line 91
    invoke-virtual {p0, p1, v0}, Lcom/immomo/mediacore/sink/IjkWriter;->setVideoSize(II)V

    .line 92
    .line 93
    .line 94
    :cond_2
    :goto_0
    return-void
.end method

.method public Y0()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/s410;->l1:Lcom/immomo/mediacore/sink/IjkWriter;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/immomo/mediacore/sink/IjkWriter;->getVideoBitRate()I

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

.method public Y3()J
    .locals 2

    .line 1
    iget-object p0, p0, Ll/s410;->l1:Lcom/immomo/mediacore/sink/IjkWriter;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/immomo/mediacore/sink/IjkWriter;->getAudioWritedDPackets()J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    return-wide v0

    .line 10
    :cond_0
    const-wide/16 v0, 0x0

    .line 11
    .line 12
    return-wide v0
.end method

.method public Z3()J
    .locals 2

    .line 1
    iget-object p0, p0, Ll/s410;->l1:Lcom/immomo/mediacore/sink/IjkWriter;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/immomo/mediacore/sink/IjkWriter;->getAverageSendBitRateB()J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    return-wide v0

    .line 10
    :cond_0
    const-wide/16 v0, 0x0

    .line 11
    .line 12
    return-wide v0
.end method

.method public a0()J
    .locals 2

    .line 1
    iget p0, p0, Ll/s410;->z1:I

    .line 2
    .line 3
    int-to-long v0, p0

    .line 4
    return-wide v0
.end method

.method public b0()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/s410;->f()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public b1()J
    .locals 4

    .line 1
    iget-boolean v0, p0, Ll/grx;->Y0:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Ll/s410;->l1:Lcom/immomo/mediacore/sink/IjkWriter;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    const/16 p0, 0x4e2d

    .line 10
    .line 11
    const-wide/16 v1, 0x0

    .line 12
    .line 13
    invoke-virtual {v0, p0, v1, v2}, Lcom/immomo/mediacore/sink/IjkWriter;->getPropertyLong(IJ)J

    .line 14
    .line 15
    .line 16
    move-result-wide v0

    .line 17
    return-wide v0

    .line 18
    :cond_0
    iget-wide v0, p0, Ll/s410;->v1:J

    .line 19
    .line 20
    invoke-virtual {p0}, Ll/s410;->b4()I

    .line 21
    .line 22
    .line 23
    move-result p0

    .line 24
    int-to-long v2, p0

    .line 25
    add-long/2addr v0, v2

    .line 26
    return-wide v0
.end method

.method public b4()I
    .locals 0

    .line 1
    iget p0, p0, Ll/s410;->i2:I

    .line 2
    .line 3
    return p0
.end method

.method public c0()J
    .locals 2

    .line 1
    iget-object p0, p0, Ll/s410;->l1:Lcom/immomo/mediacore/sink/IjkWriter;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/immomo/mediacore/sink/IjkWriter;->getAudioCacheSize()J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    return-wide v0

    .line 10
    :cond_0
    const-wide/16 v0, 0x0

    .line 11
    .line 12
    return-wide v0
.end method

.method public c2()V
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->I:Ll/evx;

    .line 2
    .line 3
    const-string v1, "logPushStart"

    .line 4
    .line 5
    filled-new-array {v1}, [Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-virtual {v0, v1}, Ll/evx;->l([Ljava/lang/Object;)V

    .line 10
    .line 11
    .line 12
    const/4 v0, 0x0

    .line 13
    iput-boolean v0, p0, Ll/s410;->B2:Z

    .line 14
    .line 15
    iget-object v1, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 16
    .line 17
    invoke-virtual {p0}, Ll/s410;->getServerIpAddr()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    iput-object v2, v1, Ll/wvx;->Z:Ljava/lang/String;

    .line 22
    .line 23
    iget-object v1, p0, Ll/s410;->l1:Lcom/immomo/mediacore/sink/IjkWriter;

    .line 24
    .line 25
    if-eqz v1, :cond_0

    .line 26
    .line 27
    iget-object v2, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 28
    .line 29
    const/16 v3, 0x4e22

    .line 30
    .line 31
    const-wide/16 v4, 0x0

    .line 32
    .line 33
    invoke-virtual {v1, v3, v4, v5}, Lcom/immomo/mediacore/sink/IjkWriter;->getPropertyLong(IJ)J

    .line 34
    .line 35
    .line 36
    move-result-wide v3

    .line 37
    iput-wide v3, v2, Ll/wvx;->u0:J

    .line 38
    .line 39
    :cond_0
    iget-object v1, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 40
    .line 41
    invoke-virtual {p0}, Ll/s410;->r0()J

    .line 42
    .line 43
    .line 44
    move-result-wide v2

    .line 45
    iput-wide v2, v1, Ll/wvx;->v0:J

    .line 46
    .line 47
    iget-object v1, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 48
    .line 49
    invoke-virtual {p0}, Ll/s410;->l1()J

    .line 50
    .line 51
    .line 52
    move-result-wide v2

    .line 53
    iput-wide v2, v1, Ll/wvx;->w0:J

    .line 54
    .line 55
    iget-object v1, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 56
    .line 57
    invoke-virtual {p0}, Ll/s410;->u0()J

    .line 58
    .line 59
    .line 60
    move-result-wide v2

    .line 61
    iput-wide v2, v1, Ll/wvx;->x0:J

    .line 62
    .line 63
    iget-object v1, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 64
    .line 65
    invoke-virtual {p0}, Ll/s410;->getVideoWidth()I

    .line 66
    .line 67
    .line 68
    move-result v2

    .line 69
    int-to-long v2, v2

    .line 70
    iput-wide v2, v1, Ll/wvx;->v:J

    .line 71
    .line 72
    iget-object v1, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 73
    .line 74
    invoke-virtual {p0}, Ll/s410;->k0()I

    .line 75
    .line 76
    .line 77
    move-result v2

    .line 78
    int-to-long v2, v2

    .line 79
    iput-wide v2, v1, Ll/wvx;->w:J

    .line 80
    .line 81
    iget-object v1, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 82
    .line 83
    invoke-virtual {p0}, Ll/s410;->p1()I

    .line 84
    .line 85
    .line 86
    move-result v2

    .line 87
    int-to-long v2, v2

    .line 88
    iput-wide v2, v1, Ll/wvx;->z:J

    .line 89
    .line 90
    iget-object v1, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 91
    .line 92
    invoke-virtual {p0}, Ll/s410;->A0()I

    .line 93
    .line 94
    .line 95
    move-result v2

    .line 96
    int-to-long v2, v2

    .line 97
    iput-wide v2, v1, Ll/wvx;->A:J

    .line 98
    .line 99
    iget-object v1, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 100
    .line 101
    iput v0, v1, Ll/wvx;->s0:I

    .line 102
    .line 103
    iget-object v0, p0, Ll/s410;->b2:Ll/p4k0;

    .line 104
    .line 105
    if-eqz v0, :cond_1

    .line 106
    .line 107
    invoke-virtual {v0}, Ll/p4k0;->a()I

    .line 108
    .line 109
    .line 110
    move-result v0

    .line 111
    iput v0, v1, Ll/wvx;->t0:I

    .line 112
    .line 113
    :cond_1
    invoke-super {p0}, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->c2()V

    .line 114
    .line 115
    .line 116
    return-void
.end method

.method public d1()V
    .locals 11

    .line 1
    iget-object v0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 2
    .line 3
    iget-wide v0, v0, Ll/wvx;->g1:J

    .line 4
    .line 5
    const-wide/16 v2, 0x3

    .line 6
    .line 7
    cmp-long v0, v0, v2

    .line 8
    .line 9
    if-ltz v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->I:Ll/evx;

    .line 12
    .line 13
    new-instance v1, Ljava/lang/StringBuilder;

    .line 14
    .line 15
    const-string v2, "mediaLogsValOfPush.sendSize0cnt "

    .line 16
    .line 17
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    iget-object p0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 21
    .line 22
    iget-wide v2, p0, Ll/wvx;->g1:J

    .line 23
    .line 24
    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    const-string p0, ", not send push watch"

    .line 28
    .line 29
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 30
    .line 31
    .line 32
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    filled-new-array {p0}, [Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    invoke-virtual {v0, p0}, Ll/evx;->l([Ljava/lang/Object;)V

    .line 41
    .line 42
    .line 43
    return-void

    .line 44
    :cond_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 45
    .line 46
    .line 47
    move-result-wide v0

    .line 48
    invoke-virtual {p0}, Ll/s410;->o0()J

    .line 49
    .line 50
    .line 51
    move-result-wide v4

    .line 52
    iget-object v6, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 53
    .line 54
    invoke-virtual {p0}, Ll/s410;->x1()J

    .line 55
    .line 56
    .line 57
    move-result-wide v7

    .line 58
    iput-wide v7, v6, Ll/wvx;->D:J

    .line 59
    .line 60
    iget-object v6, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 61
    .line 62
    invoke-virtual {p0}, Ll/s410;->u1()J

    .line 63
    .line 64
    .line 65
    move-result-wide v7

    .line 66
    iput-wide v7, v6, Ll/wvx;->Q0:J

    .line 67
    .line 68
    iget-object v6, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 69
    .line 70
    invoke-virtual {p0}, Ll/s410;->O0()J

    .line 71
    .line 72
    .line 73
    move-result-wide v7

    .line 74
    iput-wide v7, v6, Ll/wvx;->F:J

    .line 75
    .line 76
    iget-object v6, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 77
    .line 78
    invoke-virtual {p0}, Ll/s410;->q1()J

    .line 79
    .line 80
    .line 81
    move-result-wide v7

    .line 82
    iput-wide v7, v6, Ll/wvx;->G:J

    .line 83
    .line 84
    iget-object v6, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 85
    .line 86
    invoke-virtual {p0}, Ll/s410;->b1()J

    .line 87
    .line 88
    .line 89
    move-result-wide v7

    .line 90
    iput-wide v7, v6, Ll/wvx;->H:J

    .line 91
    .line 92
    iget-object v6, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 93
    .line 94
    invoke-virtual {p0}, Ll/s410;->c0()J

    .line 95
    .line 96
    .line 97
    move-result-wide v7

    .line 98
    iput-wide v7, v6, Ll/wvx;->N0:J

    .line 99
    .line 100
    iget-object v6, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 101
    .line 102
    invoke-virtual {p0}, Ll/s410;->G0()J

    .line 103
    .line 104
    .line 105
    move-result-wide v7

    .line 106
    iput-wide v7, v6, Ll/wvx;->O0:J

    .line 107
    .line 108
    iget-object v6, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 109
    .line 110
    invoke-virtual {p0}, Ll/s410;->n0()J

    .line 111
    .line 112
    .line 113
    move-result-wide v7

    .line 114
    iput-wide v7, v6, Ll/wvx;->P0:J

    .line 115
    .line 116
    iget-object v6, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 117
    .line 118
    invoke-virtual {p0}, Ll/s410;->g0()J

    .line 119
    .line 120
    .line 121
    move-result-wide v7

    .line 122
    iput-wide v7, v6, Ll/wvx;->R0:J

    .line 123
    .line 124
    iget-object v6, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 125
    .line 126
    invoke-virtual {p0}, Ll/s410;->Y3()J

    .line 127
    .line 128
    .line 129
    move-result-wide v7

    .line 130
    iput-wide v7, v6, Ll/wvx;->b0:J

    .line 131
    .line 132
    iget-object v6, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 133
    .line 134
    invoke-virtual {p0}, Ll/s410;->F1()J

    .line 135
    .line 136
    .line 137
    move-result-wide v7

    .line 138
    iput-wide v7, v6, Ll/wvx;->B:J

    .line 139
    .line 140
    iget-object v6, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 141
    .line 142
    invoke-virtual {p0}, Ll/s410;->n1()I

    .line 143
    .line 144
    .line 145
    move-result v7

    .line 146
    int-to-long v7, v7

    .line 147
    iput-wide v7, v6, Ll/wvx;->U0:J

    .line 148
    .line 149
    iget-object v6, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 150
    .line 151
    invoke-virtual {p0}, Ll/s410;->F0()I

    .line 152
    .line 153
    .line 154
    move-result v7

    .line 155
    int-to-long v7, v7

    .line 156
    iput-wide v7, v6, Ll/wvx;->V0:J

    .line 157
    .line 158
    iget-object v6, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 159
    .line 160
    invoke-virtual {p0}, Ll/s410;->L0()J

    .line 161
    .line 162
    .line 163
    move-result-wide v7

    .line 164
    iput-wide v7, v6, Ll/wvx;->W0:J

    .line 165
    .line 166
    iget-object v6, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 167
    .line 168
    iget-wide v7, p0, Ll/s410;->D2:J

    .line 169
    .line 170
    sub-long v7, v4, v7

    .line 171
    .line 172
    iget-wide v9, p0, Ll/s410;->C2:J

    .line 173
    .line 174
    sub-long v9, v0, v9

    .line 175
    .line 176
    sub-long/2addr v7, v9

    .line 177
    iput-wide v7, v6, Ll/wvx;->X0:J

    .line 178
    .line 179
    iput-wide v4, p0, Ll/s410;->D2:J

    .line 180
    .line 181
    iput-wide v0, p0, Ll/s410;->C2:J

    .line 182
    .line 183
    invoke-virtual {p0}, Ll/s410;->J0()J

    .line 184
    .line 185
    .line 186
    move-result-wide v0

    .line 187
    iput-wide v0, v6, Ll/wvx;->Y0:J

    .line 188
    .line 189
    iget-object v0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 190
    .line 191
    invoke-virtual {p0}, Ll/s410;->w1()Ljava/lang/String;

    .line 192
    .line 193
    .line 194
    move-result-object v1

    .line 195
    iput-object v1, v0, Ll/wvx;->N:Ljava/lang/String;

    .line 196
    .line 197
    iget-object v0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 198
    .line 199
    invoke-virtual {p0}, Ll/s410;->h1()I

    .line 200
    .line 201
    .line 202
    move-result v1

    .line 203
    int-to-long v4, v1

    .line 204
    iput-wide v4, v0, Ll/wvx;->O:J

    .line 205
    .line 206
    iget-object v0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 207
    .line 208
    invoke-virtual {p0}, Ll/s410;->Y0()I

    .line 209
    .line 210
    .line 211
    move-result v1

    .line 212
    int-to-long v4, v1

    .line 213
    iput-wide v4, v0, Ll/wvx;->P:J

    .line 214
    .line 215
    iget-object v0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 216
    .line 217
    invoke-virtual {p0}, Ll/s410;->m0()I

    .line 218
    .line 219
    .line 220
    move-result v1

    .line 221
    int-to-long v4, v1

    .line 222
    iput-wide v4, v0, Ll/wvx;->Q:J

    .line 223
    .line 224
    iget-object v0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 225
    .line 226
    invoke-virtual {p0}, Ll/s410;->getVideoWidth()I

    .line 227
    .line 228
    .line 229
    move-result v1

    .line 230
    int-to-long v4, v1

    .line 231
    iput-wide v4, v0, Ll/wvx;->v:J

    .line 232
    .line 233
    iget-object v0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 234
    .line 235
    invoke-virtual {p0}, Ll/s410;->k0()I

    .line 236
    .line 237
    .line 238
    move-result v1

    .line 239
    int-to-long v4, v1

    .line 240
    iput-wide v4, v0, Ll/wvx;->w:J

    .line 241
    .line 242
    iget-object v0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 243
    .line 244
    const-string v1, "[(0)]"

    .line 245
    .line 246
    iput-object v1, v0, Ll/wvx;->r:Ljava/lang/String;

    .line 247
    .line 248
    invoke-virtual {p0}, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->Z1()Ll/uow;

    .line 249
    .line 250
    .line 251
    move-result-object v1

    .line 252
    iget v1, v1, Ll/tow;->w:I

    .line 253
    .line 254
    int-to-long v4, v1

    .line 255
    iput-wide v4, v0, Ll/wvx;->S:J

    .line 256
    .line 257
    iget-object v0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 258
    .line 259
    invoke-virtual {p0}, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->Z1()Ll/uow;

    .line 260
    .line 261
    .line 262
    move-result-object v1

    .line 263
    iget v1, v1, Ll/tow;->x:I

    .line 264
    .line 265
    int-to-long v4, v1

    .line 266
    iput-wide v4, v0, Ll/wvx;->T:J

    .line 267
    .line 268
    iget-object v0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 269
    .line 270
    invoke-virtual {p0}, Ll/s410;->j4()J

    .line 271
    .line 272
    .line 273
    move-result-wide v4

    .line 274
    iput-wide v4, v0, Ll/wvx;->J0:J

    .line 275
    .line 276
    iget-object v0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 277
    .line 278
    invoke-virtual {p0}, Ll/s410;->X3()J

    .line 279
    .line 280
    .line 281
    move-result-wide v4

    .line 282
    iput-wide v4, v0, Ll/wvx;->I0:J

    .line 283
    .line 284
    iget-object v0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 285
    .line 286
    invoke-virtual {p0}, Ll/s410;->i4()J

    .line 287
    .line 288
    .line 289
    move-result-wide v4

    .line 290
    iput-wide v4, v0, Ll/wvx;->d0:J

    .line 291
    .line 292
    iget-object v0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 293
    .line 294
    invoke-direct {p0}, Ll/s410;->c4()Ljava/lang/String;

    .line 295
    .line 296
    .line 297
    move-result-object v1

    .line 298
    iput-object v1, v0, Ll/wvx;->i1:Ljava/lang/String;

    .line 299
    .line 300
    iget-object v0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 301
    .line 302
    invoke-static {}, Ll/csx;->R()Ll/csx;

    .line 303
    .line 304
    .line 305
    move-result-object v1

    .line 306
    invoke-virtual {v1}, Ll/csx;->f0()Z

    .line 307
    .line 308
    .line 309
    move-result v1

    .line 310
    iput v1, v0, Ll/wvx;->j1:I

    .line 311
    .line 312
    iget-object v0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 313
    .line 314
    invoke-static {}, Ll/u6y;->F()Ll/u6y;

    .line 315
    .line 316
    .line 317
    move-result-object v1

    .line 318
    invoke-virtual {v1}, Ll/u6y;->a()Landroid/util/Size;

    .line 319
    .line 320
    .line 321
    move-result-object v1

    .line 322
    invoke-virtual {v1}, Landroid/util/Size;->getWidth()I

    .line 323
    .line 324
    .line 325
    move-result v1

    .line 326
    iput v1, v0, Ll/wvx;->l1:I

    .line 327
    .line 328
    iget-object v0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 329
    .line 330
    invoke-static {}, Ll/u6y;->F()Ll/u6y;

    .line 331
    .line 332
    .line 333
    move-result-object v1

    .line 334
    invoke-virtual {v1}, Ll/u6y;->a()Landroid/util/Size;

    .line 335
    .line 336
    .line 337
    move-result-object v1

    .line 338
    invoke-virtual {v1}, Landroid/util/Size;->getHeight()I

    .line 339
    .line 340
    .line 341
    move-result v1

    .line 342
    iput v1, v0, Ll/wvx;->m1:I

    .line 343
    .line 344
    iget-object v0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 345
    .line 346
    invoke-static {}, Ll/u6y;->F()Ll/u6y;

    .line 347
    .line 348
    .line 349
    move-result-object v1

    .line 350
    invoke-virtual {v1}, Ll/u6y;->w()Ljava/lang/String;

    .line 351
    .line 352
    .line 353
    move-result-object v1

    .line 354
    iput-object v1, v0, Ll/wvx;->n1:Ljava/lang/String;

    .line 355
    .line 356
    iget-object v0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->I:Ll/evx;

    .line 357
    .line 358
    invoke-virtual {v0}, Ll/evx;->G()V

    .line 359
    .line 360
    .line 361
    iget-object v0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 362
    .line 363
    iget-wide v0, v0, Ll/wvx;->g1:J

    .line 364
    .line 365
    cmp-long v0, v0, v2

    .line 366
    .line 367
    if-nez v0, :cond_1

    .line 368
    .line 369
    iget-object v0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->J:Lcom/momo/pipline/MomoInterface/MomoCodec$MomoCodecState;

    .line 370
    .line 371
    sget-object v1, Lcom/momo/pipline/MomoInterface/MomoCodec$MomoCodecState;->WAIT:Lcom/momo/pipline/MomoInterface/MomoCodec$MomoCodecState;

    .line 372
    .line 373
    if-eq v0, v1, :cond_1

    .line 374
    .line 375
    iget-object v0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->I:Ll/evx;

    .line 376
    .line 377
    const-string v1, "MediaError"

    .line 378
    .line 379
    const-string v2, "14 sendsize 0 line 1778"

    .line 380
    .line 381
    filled-new-array {v1, v2}, [Ljava/lang/Object;

    .line 382
    .line 383
    .line 384
    move-result-object v1

    .line 385
    invoke-virtual {v0, v1}, Ll/evx;->l([Ljava/lang/Object;)V

    .line 386
    .line 387
    .line 388
    const/16 v0, 0xe

    .line 389
    .line 390
    invoke-direct {p0, v0}, Ll/s410;->v4(I)V

    .line 391
    .line 392
    .line 393
    :cond_1
    return-void
.end method

.method public d2()V
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->I:Ll/evx;

    .line 2
    .line 3
    const-string v1, "momopusher logPushStop"

    .line 4
    .line 5
    filled-new-array {v1}, [Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-virtual {v0, v1}, Ll/evx;->l([Ljava/lang/Object;)V

    .line 10
    .line 11
    .line 12
    iget-boolean v0, p0, Ll/s410;->B2:Z

    .line 13
    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    return-void

    .line 17
    :cond_0
    const/4 v0, 0x1

    .line 18
    iput-boolean v0, p0, Ll/s410;->B2:Z

    .line 19
    .line 20
    iget-boolean v0, p0, Ll/s410;->O1:Z

    .line 21
    .line 22
    const-wide/16 v1, 0x0

    .line 23
    .line 24
    if-eqz v0, :cond_1

    .line 25
    .line 26
    const/4 v0, 0x0

    .line 27
    iput-boolean v0, p0, Ll/s410;->O1:Z

    .line 28
    .line 29
    iget-object v0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->I:Ll/evx;

    .line 30
    .line 31
    invoke-virtual {v0, v1, v2}, Ll/evx;->x(J)V

    .line 32
    .line 33
    .line 34
    :cond_1
    iget-object v0, p0, Ll/s410;->l1:Lcom/immomo/mediacore/sink/IjkWriter;

    .line 35
    .line 36
    if-eqz v0, :cond_2

    .line 37
    .line 38
    iget-object v3, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 39
    .line 40
    invoke-virtual {v0}, Lcom/immomo/mediacore/sink/IjkWriter;->getTxbytes()J

    .line 41
    .line 42
    .line 43
    move-result-wide v4

    .line 44
    iput-wide v4, v3, Ll/wvx;->B:J

    .line 45
    .line 46
    :cond_2
    iget-object v0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 47
    .line 48
    iget-wide v3, v0, Ll/wvx;->z0:J

    .line 49
    .line 50
    cmp-long v1, v3, v1

    .line 51
    .line 52
    if-eqz v1, :cond_3

    .line 53
    .line 54
    iput-wide v3, v0, Ll/wvx;->y0:J

    .line 55
    .line 56
    :cond_3
    invoke-virtual {p0}, Ll/s410;->getServerIpAddr()Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object v1

    .line 60
    iput-object v1, v0, Ll/wvx;->Z:Ljava/lang/String;

    .line 61
    .line 62
    iget-object v0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 63
    .line 64
    iget-boolean v1, v0, Ll/wvx;->b:Z

    .line 65
    .line 66
    if-eqz v1, :cond_4

    .line 67
    .line 68
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 69
    .line 70
    .line 71
    move-result-wide v1

    .line 72
    iget-object v3, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 73
    .line 74
    iget-wide v3, v3, Ll/wvx;->a:J

    .line 75
    .line 76
    sub-long/2addr v1, v3

    .line 77
    iput-wide v1, v0, Ll/wvx;->h:J

    .line 78
    .line 79
    :cond_4
    iget-object v0, p0, Ll/s410;->b2:Ll/p4k0;

    .line 80
    .line 81
    if-eqz v0, :cond_5

    .line 82
    .line 83
    iget-object v1, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 84
    .line 85
    invoke-virtual {v0}, Ll/p4k0;->a()I

    .line 86
    .line 87
    .line 88
    move-result v0

    .line 89
    iput v0, v1, Ll/wvx;->t0:I

    .line 90
    .line 91
    :cond_5
    invoke-super {p0}, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->d2()V

    .line 92
    .line 93
    .line 94
    return-void
.end method

.method public e1(Ll/l6m;)V
    .locals 2
    .param p1    # Ll/l6m;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    instance-of v0, p1, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    invoke-super {p0, p1}, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->e1(Ll/l6m;)V

    .line 6
    .line 7
    .line 8
    iget-object p1, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->K:Ll/l6m;

    .line 9
    .line 10
    if-eqz p1, :cond_0

    .line 11
    .line 12
    check-cast p1, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;

    .line 13
    .line 14
    new-instance v0, Ll/s410$e;

    .line 15
    .line 16
    const/4 v1, 0x0

    .line 17
    invoke-direct {v0, p0, v1}, Ll/s410$e;-><init>(Ll/s410;Ll/s410$a;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p1, v0}, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->J2(Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper$i;)V

    .line 21
    .line 22
    .line 23
    :cond_0
    return-void

    .line 24
    :cond_1
    new-instance p0, Ljava/security/InvalidParameterException;

    .line 25
    .line 26
    const-string p1, "ISurroundMusic must implement by ExtAudioWrapper"

    .line 27
    .line 28
    invoke-direct {p0, p1}, Ljava/security/InvalidParameterException;-><init>(Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    throw p0
.end method

.method public e4()I
    .locals 2

    .line 1
    iget-wide v0, p0, Ll/s410;->e2:J

    .line 2
    .line 3
    long-to-int p0, v0

    .line 4
    return p0
.end method

.method public f()V
    .locals 8

    .line 1
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    const-string v2, " stopRecord"

    .line 14
    .line 15
    invoke-virtual {v1, v2}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    const-string v2, "Pipeline_Flow_pip->MOMO"

    .line 20
    .line 21
    invoke-virtual {v0, v2, v1}, Ll/oq70;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    iget-object v0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->I:Ll/evx;

    .line 25
    .line 26
    const-string v1, "momopusher stopRecord"

    .line 27
    .line 28
    filled-new-array {v1}, [Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    invoke-virtual {v0, v1}, Ll/evx;->l([Ljava/lang/Object;)V

    .line 33
    .line 34
    .line 35
    invoke-super {p0}, Ll/grx;->f()V

    .line 36
    .line 37
    .line 38
    const/4 v0, 0x0

    .line 39
    iput-boolean v0, p0, Ll/s410;->p1:Z

    .line 40
    .line 41
    iget-object v1, p0, Ll/s410;->l1:Lcom/immomo/mediacore/sink/IjkWriter;

    .line 42
    .line 43
    const/4 v2, 0x0

    .line 44
    if-eqz v1, :cond_0

    .line 45
    .line 46
    const/16 v3, 0x4e31

    .line 47
    .line 48
    const-wide/16 v4, 0x0

    .line 49
    .line 50
    invoke-virtual {v1, v3, v4, v5}, Lcom/immomo/mediacore/sink/IjkWriter;->getPropertyLong(IJ)J

    .line 51
    .line 52
    .line 53
    move-result-wide v6

    .line 54
    iput-wide v6, p0, Ll/s410;->e2:J

    .line 55
    .line 56
    iget-object v1, p0, Ll/s410;->l1:Lcom/immomo/mediacore/sink/IjkWriter;

    .line 57
    .line 58
    const/16 v3, 0x4e32

    .line 59
    .line 60
    invoke-virtual {v1, v3, v4, v5}, Lcom/immomo/mediacore/sink/IjkWriter;->getPropertyLong(IJ)J

    .line 61
    .line 62
    .line 63
    move-result-wide v6

    .line 64
    iput-wide v6, p0, Ll/s410;->f2:J

    .line 65
    .line 66
    iget-object v1, p0, Ll/s410;->l1:Lcom/immomo/mediacore/sink/IjkWriter;

    .line 67
    .line 68
    const/16 v3, 0x4e33

    .line 69
    .line 70
    invoke-virtual {v1, v3, v4, v5}, Lcom/immomo/mediacore/sink/IjkWriter;->getPropertyLong(IJ)J

    .line 71
    .line 72
    .line 73
    move-result-wide v3

    .line 74
    iput-wide v3, p0, Ll/s410;->g2:J

    .line 75
    .line 76
    iget-object v1, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 77
    .line 78
    iget-object v3, p0, Ll/s410;->l1:Lcom/immomo/mediacore/sink/IjkWriter;

    .line 79
    .line 80
    invoke-virtual {v3}, Lcom/immomo/mediacore/sink/IjkWriter;->getTxbytes()J

    .line 81
    .line 82
    .line 83
    move-result-wide v3

    .line 84
    iput-wide v3, v1, Ll/wvx;->B:J

    .line 85
    .line 86
    iget-object v1, p0, Ll/s410;->l1:Lcom/immomo/mediacore/sink/IjkWriter;

    .line 87
    .line 88
    invoke-virtual {v1}, Lcom/immomo/mediacore/sink/IjkWriter;->stopRecording()V

    .line 89
    .line 90
    .line 91
    invoke-static {}, Ll/b7y;->c()Ll/b7y;

    .line 92
    .line 93
    .line 94
    move-result-object v1

    .line 95
    new-instance v3, Ljava/lang/StringBuilder;

    .line 96
    .line 97
    const-string v4, "enable_sync_streamreplace stopPsuh syncStreamRelace:"

    .line 98
    .line 99
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 100
    .line 101
    .line 102
    iget-boolean v4, p0, Ll/s410;->I1:Z

    .line 103
    .line 104
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 105
    .line 106
    .line 107
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 108
    .line 109
    .line 110
    move-result-object v3

    .line 111
    filled-new-array {v3}, [Ljava/lang/Object;

    .line 112
    .line 113
    .line 114
    move-result-object v3

    .line 115
    invoke-virtual {v1, v3}, Ll/b7y;->g([Ljava/lang/Object;)V

    .line 116
    .line 117
    .line 118
    iget-boolean v1, p0, Ll/s410;->I1:Z

    .line 119
    .line 120
    invoke-virtual {p0, v1}, Ll/s410;->B4(Z)V

    .line 121
    .line 122
    .line 123
    iget-object v1, p0, Ll/s410;->l1:Lcom/immomo/mediacore/sink/IjkWriter;

    .line 124
    .line 125
    invoke-virtual {v1}, Lcom/immomo/mediacore/sink/IjkWriter;->release()V

    .line 126
    .line 127
    .line 128
    iput-object v2, p0, Ll/s410;->l1:Lcom/immomo/mediacore/sink/IjkWriter;

    .line 129
    .line 130
    :cond_0
    invoke-virtual {p0}, Ll/s410;->k1()V

    .line 131
    .line 132
    .line 133
    invoke-direct {p0}, Ll/s410;->H4()V

    .line 134
    .line 135
    .line 136
    invoke-virtual {p0}, Ll/s410;->d2()V

    .line 137
    .line 138
    .line 139
    invoke-super {p0}, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->p2()V

    .line 140
    .line 141
    .line 142
    iget-object v1, p0, Ll/s410;->a2:Landroid/os/Handler;

    .line 143
    .line 144
    if-eqz v1, :cond_1

    .line 145
    .line 146
    invoke-virtual {v1, v2}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 147
    .line 148
    .line 149
    :cond_1
    invoke-static {}, Ll/yt0;->g()Ll/yt0;

    .line 150
    .line 151
    .line 152
    move-result-object v1

    .line 153
    sget v2, Ll/yt0;->e:I

    .line 154
    .line 155
    invoke-virtual {v1, v2}, Ll/yt0;->q(I)V

    .line 156
    .line 157
    .line 158
    iget-object v1, p0, Ll/s410;->J1:Ll/q210$a;

    .line 159
    .line 160
    const/16 v2, 0x3001

    .line 161
    .line 162
    invoke-interface {v1, v2, v0, v0, p0}, Ll/q210$a;->g(IIILjava/lang/Object;)V

    .line 163
    .line 164
    .line 165
    return-void
.end method

.method public f0(Ljava/nio/ByteBuffer;J)V
    .locals 0

    .line 1
    return-void
.end method

.method public f4()I
    .locals 2

    .line 1
    iget-wide v0, p0, Ll/s410;->g2:J

    .line 2
    .line 3
    long-to-int p0, v0

    .line 4
    return p0
.end method

.method public g0()J
    .locals 2

    .line 1
    iget-object p0, p0, Ll/s410;->l1:Lcom/immomo/mediacore/sink/IjkWriter;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    :try_start_0
    invoke-virtual {p0}, Lcom/immomo/mediacore/sink/IjkWriter;->getRtmpSendSize()J

    .line 6
    .line 7
    .line 8
    move-result-wide v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Error; {:try_start_0 .. :try_end_0} :catch_0

    .line 9
    return-wide v0

    .line 10
    :catch_0
    move-exception p0

    .line 11
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 12
    .line 13
    .line 14
    goto :goto_0

    .line 15
    :catch_1
    move-exception p0

    .line 16
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 17
    .line 18
    .line 19
    :cond_0
    :goto_0
    const-wide/16 v0, 0x0

    .line 20
    .line 21
    return-wide v0
.end method

.method public g1(IILjava/lang/Object;)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Ll/s410;->h4(II)Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public g4()I
    .locals 2

    .line 1
    iget-wide v0, p0, Ll/s410;->f2:J

    .line 2
    .line 3
    long-to-int p0, v0

    .line 4
    return p0
.end method

.method public getFilter()Lcom/momo/pipline/codec/MediaBaseCodecFilter;
    .locals 0

    .line 1
    return-object p0
.end method

.method public getPreviewScale()Landroid/graphics/PointF;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public getPreviewZoom()F
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public getRoomType()I
    .locals 0

    .line 1
    const/4 p0, -0x1

    .line 2
    return p0
.end method

.method public getServerIpAddr()Ljava/lang/String;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/s410;->l1:Lcom/immomo/mediacore/sink/IjkWriter;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/immomo/mediacore/sink/IjkWriter;->getServerIpAddr()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Ll/s410;->l1:Lcom/immomo/mediacore/sink/IjkWriter;

    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/immomo/mediacore/sink/IjkWriter;->getServerIpAddr()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0

    .line 18
    :cond_0
    iget-object v0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 19
    .line 20
    iget-object v0, v0, Ll/wvx;->Z:Ljava/lang/String;

    .line 21
    .line 22
    const-string v1, "0.0.0.0"

    .line 23
    .line 24
    if-eqz v0, :cond_1

    .line 25
    .line 26
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    if-nez v0, :cond_1

    .line 31
    .line 32
    iget-object p0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 33
    .line 34
    iget-object p0, p0, Ll/wvx;->Z:Ljava/lang/String;

    .line 35
    .line 36
    return-object p0

    .line 37
    :cond_1
    invoke-virtual {p0}, Ll/s410;->D1()Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    invoke-direct {p0, v0}, Ll/s410;->t4(Ljava/lang/String;)Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    if-eqz v0, :cond_2

    .line 46
    .line 47
    invoke-direct {p0, v0}, Ll/s410;->m4(Ljava/lang/String;)Z

    .line 48
    .line 49
    .line 50
    move-result p0

    .line 51
    if-eqz p0, :cond_2

    .line 52
    .line 53
    return-object v0

    .line 54
    :cond_2
    return-object v1
.end method

.method public getStreamerCaptureType(I)I
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public getStreamerType()I
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public getVideoQuality()Lcom/immomo/mediacore/strinf/VideoQuality;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public getVideoWidth()I
    .locals 1

    .line 1
    iget v0, p0, Ll/s410;->c2:I

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return v0

    .line 6
    :cond_0
    iget-object p0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->s:Ll/uow;

    .line 7
    .line 8
    if-eqz p0, :cond_1

    .line 9
    .line 10
    iget p0, p0, Ll/tow;->m:I

    .line 11
    .line 12
    return p0

    .line 13
    :cond_1
    const/4 p0, 0x0

    .line 14
    return p0
.end method

.method public getWriter()Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/s410;->l1:Lcom/immomo/mediacore/sink/IjkWriter;

    .line 2
    .line 3
    return-object p0
.end method

.method public h0()I
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public h1()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/s410;->l1:Lcom/immomo/mediacore/sink/IjkWriter;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/immomo/mediacore/sink/IjkWriter;->getAudioBitRate()I

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

.method public i4()J
    .locals 3

    .line 1
    iget-object p0, p0, Ll/s410;->l1:Lcom/immomo/mediacore/sink/IjkWriter;

    .line 2
    .line 3
    const-wide/16 v0, 0x0

    .line 4
    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    const/16 v2, 0x4e37

    .line 8
    .line 9
    :try_start_0
    invoke-virtual {p0, v2, v0, v1}, Lcom/immomo/mediacore/sink/IjkWriter;->getPropertyLong(IJ)J

    .line 10
    .line 11
    .line 12
    move-result-wide v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Error; {:try_start_0 .. :try_end_0} :catch_0

    .line 13
    return-wide v0

    .line 14
    :catch_0
    move-exception p0

    .line 15
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 16
    .line 17
    .line 18
    goto :goto_0

    .line 19
    :catch_1
    move-exception p0

    .line 20
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 21
    .line 22
    .line 23
    :cond_0
    :goto_0
    return-wide v0
.end method

.method public isStarting()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/grx;->X0:Z

    .line 2
    .line 3
    return p0
.end method

.method public j1(IILjava/lang/Object;)J
    .locals 0

    .line 1
    const-wide/16 p0, 0x0

    .line 2
    .line 3
    return-wide p0
.end method

.method public j4()J
    .locals 3

    .line 1
    iget-object p0, p0, Ll/s410;->l1:Lcom/immomo/mediacore/sink/IjkWriter;

    .line 2
    .line 3
    const-wide/16 v0, 0x0

    .line 4
    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    const/16 v2, 0x4e35

    .line 8
    .line 9
    :try_start_0
    invoke-virtual {p0, v2, v0, v1}, Lcom/immomo/mediacore/sink/IjkWriter;->getPropertyLong(IJ)J

    .line 10
    .line 11
    .line 12
    move-result-wide v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Error; {:try_start_0 .. :try_end_0} :catch_0

    .line 13
    return-wide v0

    .line 14
    :catch_0
    move-exception p0

    .line 15
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 16
    .line 17
    .line 18
    goto :goto_0

    .line 19
    :catch_1
    move-exception p0

    .line 20
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 21
    .line 22
    .line 23
    :cond_0
    :goto_0
    return-wide v0
.end method

.method public k0()I
    .locals 1

    .line 1
    iget v0, p0, Ll/s410;->d2:I

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return v0

    .line 6
    :cond_0
    iget-object p0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->s:Ll/uow;

    .line 7
    .line 8
    if-eqz p0, :cond_1

    .line 9
    .line 10
    iget p0, p0, Ll/tow;->n:I

    .line 11
    .line 12
    return p0

    .line 13
    :cond_1
    const/4 p0, 0x0

    .line 14
    return p0
.end method

.method public k1()V
    .locals 3

    .line 1
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "Pipeline_Flow_pip->MOMO"

    .line 6
    .line 7
    const-string v2, "stopMuxing !##########################"

    .line 8
    .line 9
    invoke-virtual {v0, v1, v2}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    const/4 v0, 0x0

    .line 13
    iput-boolean v0, p0, Ll/grx;->X0:Z

    .line 14
    .line 15
    return-void
.end method

.method public l0(Ll/uow;Landroid/opengl/EGLContext;)V
    .locals 0

    .line 1
    return-void
.end method

.method public l1()J
    .locals 7

    .line 1
    iget-object v0, p0, Ll/s410;->l1:Lcom/immomo/mediacore/sink/IjkWriter;

    .line 2
    .line 3
    const-wide/16 v1, 0x0

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    return-wide v1

    .line 8
    :cond_0
    iget-boolean v3, p0, Ll/grx;->Y0:Z

    .line 9
    .line 10
    if-eqz v3, :cond_2

    .line 11
    .line 12
    iget-wide v3, p0, Ll/s410;->x1:J

    .line 13
    .line 14
    iget-object p0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 15
    .line 16
    iget-wide v5, p0, Ll/wvx;->a:J

    .line 17
    .line 18
    :cond_1
    :goto_0
    sub-long/2addr v3, v5

    .line 19
    goto :goto_1

    .line 20
    :cond_2
    const/16 v3, 0x4e2f

    .line 21
    .line 22
    invoke-virtual {v0, v3, v1, v2}, Lcom/immomo/mediacore/sink/IjkWriter;->getPropertyLong(IJ)J

    .line 23
    .line 24
    .line 25
    move-result-wide v3

    .line 26
    iget-object v0, p0, Ll/s410;->l1:Lcom/immomo/mediacore/sink/IjkWriter;

    .line 27
    .line 28
    const/16 v5, 0x4e20

    .line 29
    .line 30
    invoke-virtual {v0, v5, v1, v2}, Lcom/immomo/mediacore/sink/IjkWriter;->getPropertyLong(IJ)J

    .line 31
    .line 32
    .line 33
    move-result-wide v5

    .line 34
    cmp-long v0, v3, v1

    .line 35
    .line 36
    if-eqz v0, :cond_3

    .line 37
    .line 38
    cmp-long v0, v5, v1

    .line 39
    .line 40
    if-nez v0, :cond_1

    .line 41
    .line 42
    :cond_3
    iget-wide v3, p0, Ll/s410;->x1:J

    .line 43
    .line 44
    iget-object p0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 45
    .line 46
    iget-wide v5, p0, Ll/wvx;->a:J

    .line 47
    .line 48
    goto :goto_0

    .line 49
    :goto_1
    cmp-long p0, v3, v1

    .line 50
    .line 51
    if-gez p0, :cond_4

    .line 52
    .line 53
    return-wide v1

    .line 54
    :cond_4
    return-wide v3
.end method

.method public m0()I
    .locals 0

    .line 1
    iget p0, p0, Ll/s410;->B1:I

    .line 2
    .line 3
    return p0
.end method

.method public n0()J
    .locals 2

    .line 1
    iget-object p0, p0, Ll/s410;->l1:Lcom/immomo/mediacore/sink/IjkWriter;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/immomo/mediacore/sink/IjkWriter;->getVideoPacketCache()J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    return-wide v0

    .line 10
    :cond_0
    const-wide/16 v0, 0x0

    .line 11
    .line 12
    return-wide v0
.end method

.method public n1()I
    .locals 0

    .line 1
    iget p0, p0, Ll/s410;->D1:I

    .line 2
    .line 3
    return p0
.end method

.method public notify(IIILjava/lang/Object;)V
    .locals 19

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
    const/4 v4, 0x1

    .line 10
    const-string v5, "Pipeline_Flow_pip->MOMO"

    .line 11
    .line 12
    if-eqz v1, :cond_5

    .line 13
    .line 14
    const/16 v6, 0x12c

    .line 15
    .line 16
    if-eq v1, v6, :cond_3

    .line 17
    .line 18
    const/16 v6, 0xc8

    .line 19
    .line 20
    if-eq v1, v6, :cond_2

    .line 21
    .line 22
    const/16 v6, 0xc9

    .line 23
    .line 24
    if-eq v1, v6, :cond_1

    .line 25
    .line 26
    packed-switch v1, :pswitch_data_0

    .line 27
    .line 28
    .line 29
    goto/16 :goto_0

    .line 30
    .line 31
    :pswitch_0
    shr-int/lit8 v6, v2, 0x10

    .line 32
    .line 33
    const v7, 0xffff

    .line 34
    .line 35
    .line 36
    and-int/2addr v6, v7

    .line 37
    int-to-short v6, v6

    .line 38
    and-int/2addr v2, v7

    .line 39
    int-to-short v2, v2

    .line 40
    shr-int/lit8 v8, v3, 0x10

    .line 41
    .line 42
    and-int/2addr v8, v7

    .line 43
    int-to-short v8, v8

    .line 44
    and-int/2addr v3, v7

    .line 45
    int-to-short v3, v3

    .line 46
    mul-int/lit8 v7, v6, 0x17

    .line 47
    .line 48
    mul-int/lit8 v9, v2, 0x17

    .line 49
    .line 50
    iget-object v10, v0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->I:Ll/evx;

    .line 51
    .line 52
    int-to-long v11, v7

    .line 53
    int-to-long v13, v9

    .line 54
    sub-int/2addr v6, v2

    .line 55
    int-to-long v6, v6

    .line 56
    sub-int/2addr v8, v3

    .line 57
    int-to-long v2, v8

    .line 58
    move-wide/from16 v17, v2

    .line 59
    .line 60
    move-wide v15, v6

    .line 61
    invoke-virtual/range {v10 .. v18}, Ll/evx;->v(JJJJ)V

    .line 62
    .line 63
    .line 64
    goto/16 :goto_0

    .line 65
    .line 66
    :pswitch_1
    iget-object v6, v0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->I:Ll/evx;

    .line 67
    .line 68
    const-string v7, "PUBLISHED"

    .line 69
    .line 70
    filled-new-array {v7}, [Ljava/lang/Object;

    .line 71
    .line 72
    .line 73
    move-result-object v7

    .line 74
    invoke-virtual {v6, v7}, Ll/evx;->l([Ljava/lang/Object;)V

    .line 75
    .line 76
    .line 77
    iget-object v6, v0, Ll/s410;->J1:Ll/q210$a;

    .line 78
    .line 79
    const/16 v7, 0x3011

    .line 80
    .line 81
    invoke-interface {v6, v7, v2, v3, v0}, Ll/q210$a;->g(IIILjava/lang/Object;)V

    .line 82
    .line 83
    .line 84
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 85
    .line 86
    .line 87
    move-result-object v2

    .line 88
    const-string v3, "IJK \u63a8\u6d41\u5668 \u62a5\u544a\uff1a MOMO_PUBLISHED, \u6b64\u65f6 IJK \u5df2\u7ecf\u63a8\u6d41 5 \u79d2\u949f \u63a8\u6d41\u6210\u529f\uff0c\u6b64\u65f6\u5e94\u8be5\u7ed3\u675f\u8fde\u9ea6\u63a8\u6d41"

    .line 89
    .line 90
    invoke-virtual {v2, v5, v3}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 91
    .line 92
    .line 93
    goto/16 :goto_0

    .line 94
    .line 95
    :pswitch_2
    iget-object v6, v0, Ll/s410;->J1:Ll/q210$a;

    .line 96
    .line 97
    const/16 v7, 0x3006

    .line 98
    .line 99
    invoke-interface {v6, v7, v2, v3, v0}, Ll/q210$a;->g(IIILjava/lang/Object;)V

    .line 100
    .line 101
    .line 102
    goto/16 :goto_0

    .line 103
    .line 104
    :pswitch_3
    iget-object v6, v0, Ll/s410;->J1:Ll/q210$a;

    .line 105
    .line 106
    const/16 v7, 0x3005

    .line 107
    .line 108
    invoke-interface {v6, v7, v2, v3, v0}, Ll/q210$a;->g(IIILjava/lang/Object;)V

    .line 109
    .line 110
    .line 111
    goto/16 :goto_0

    .line 112
    .line 113
    :pswitch_4
    const/4 v6, 0x0

    .line 114
    iput-boolean v6, v0, Ll/s410;->O1:Z

    .line 115
    .line 116
    iget-object v6, v0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->I:Ll/evx;

    .line 117
    .line 118
    int-to-long v7, v2

    .line 119
    invoke-virtual {v6, v7, v8}, Ll/evx;->x(J)V

    .line 120
    .line 121
    .line 122
    iget-object v6, v0, Ll/s410;->J1:Ll/q210$a;

    .line 123
    .line 124
    const/16 v7, 0x3008

    .line 125
    .line 126
    invoke-interface {v6, v7, v2, v3, v0}, Ll/q210$a;->g(IIILjava/lang/Object;)V

    .line 127
    .line 128
    .line 129
    goto/16 :goto_0

    .line 130
    .line 131
    :pswitch_5
    iget-object v6, v0, Ll/s410;->J1:Ll/q210$a;

    .line 132
    .line 133
    const/16 v7, 0x3009

    .line 134
    .line 135
    invoke-interface {v6, v7, v2, v3, v0}, Ll/q210$a;->g(IIILjava/lang/Object;)V

    .line 136
    .line 137
    .line 138
    goto/16 :goto_0

    .line 139
    .line 140
    :pswitch_6
    iput-boolean v4, v0, Ll/s410;->O1:Z

    .line 141
    .line 142
    iget-object v6, v0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->I:Ll/evx;

    .line 143
    .line 144
    int-to-long v7, v2

    .line 145
    invoke-virtual {v6, v7, v8}, Ll/evx;->w(J)V

    .line 146
    .line 147
    .line 148
    iget-object v6, v0, Ll/s410;->J1:Ll/q210$a;

    .line 149
    .line 150
    const/16 v7, 0x3007

    .line 151
    .line 152
    invoke-interface {v6, v7, v2, v3, v0}, Ll/q210$a;->g(IIILjava/lang/Object;)V

    .line 153
    .line 154
    .line 155
    goto/16 :goto_0

    .line 156
    .line 157
    :pswitch_7
    iget-object v6, v0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->I:Ll/evx;

    .line 158
    .line 159
    const-string v7, "PUBLISHING"

    .line 160
    .line 161
    filled-new-array {v7}, [Ljava/lang/Object;

    .line 162
    .line 163
    .line 164
    move-result-object v7

    .line 165
    invoke-virtual {v6, v7}, Ll/evx;->l([Ljava/lang/Object;)V

    .line 166
    .line 167
    .line 168
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 169
    .line 170
    .line 171
    move-result-object v6

    .line 172
    const-string v7, " MEDIA_RECORDER_PUBLISHING"

    .line 173
    .line 174
    invoke-virtual {v6, v5, v7}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 175
    .line 176
    .line 177
    iget-object v6, v0, Ll/s410;->J1:Ll/q210$a;

    .line 178
    .line 179
    const/16 v7, 0x3004

    .line 180
    .line 181
    invoke-interface {v6, v7, v2, v3, v0}, Ll/q210$a;->g(IIILjava/lang/Object;)V

    .line 182
    .line 183
    .line 184
    invoke-virtual {v0}, Ll/s410;->c2()V

    .line 185
    .line 186
    .line 187
    invoke-virtual {v0}, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->b2()V

    .line 188
    .line 189
    .line 190
    iget-object v2, v0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 191
    .line 192
    iget-wide v6, v2, Ll/wvx;->c:J

    .line 193
    .line 194
    const-wide/16 v8, 0x0

    .line 195
    .line 196
    cmp-long v3, v6, v8

    .line 197
    .line 198
    if-nez v3, :cond_0

    .line 199
    .line 200
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 201
    .line 202
    .line 203
    move-result-wide v6

    .line 204
    iput-wide v6, v2, Ll/wvx;->c:J

    .line 205
    .line 206
    :cond_0
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 207
    .line 208
    .line 209
    move-result-object v2

    .line 210
    const-string v3, "IJK \u63a8\u6d41\u5668 \u62a5\u544a\uff1a MOMO_PUBLISHING, \u6b64\u65f6\u8fdb\u5165\u53cc\u63a8\u6a21\u5f0f"

    .line 211
    .line 212
    invoke-virtual {v2, v5, v3}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 213
    .line 214
    .line 215
    goto/16 :goto_0

    .line 216
    .line 217
    :pswitch_8
    iget-object v6, v0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->I:Ll/evx;

    .line 218
    .line 219
    const-string v7, "STOPED"

    .line 220
    .line 221
    filled-new-array {v7}, [Ljava/lang/Object;

    .line 222
    .line 223
    .line 224
    move-result-object v7

    .line 225
    invoke-virtual {v6, v7}, Ll/evx;->l([Ljava/lang/Object;)V

    .line 226
    .line 227
    .line 228
    invoke-virtual {v0}, Ll/s410;->d2()V

    .line 229
    .line 230
    .line 231
    sget-object v6, Lcom/momo/pipline/MomoInterface/MomoCodec$MomoCodecState;->STOP:Lcom/momo/pipline/MomoInterface/MomoCodec$MomoCodecState;

    .line 232
    .line 233
    iput-object v6, v0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->J:Lcom/momo/pipline/MomoInterface/MomoCodec$MomoCodecState;

    .line 234
    .line 235
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 236
    .line 237
    .line 238
    move-result-object v6

    .line 239
    const-string v7, " MEDIA_RECORDER_STOPED"

    .line 240
    .line 241
    invoke-virtual {v6, v5, v7}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 242
    .line 243
    .line 244
    iget-object v6, v0, Ll/s410;->J1:Ll/q210$a;

    .line 245
    .line 246
    const/16 v7, 0x3001

    .line 247
    .line 248
    invoke-interface {v6, v7, v2, v3, v0}, Ll/q210$a;->g(IIILjava/lang/Object;)V

    .line 249
    .line 250
    .line 251
    goto/16 :goto_0

    .line 252
    .line 253
    :pswitch_9
    iget-object v6, v0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->I:Ll/evx;

    .line 254
    .line 255
    const-string v7, "PREPARED"

    .line 256
    .line 257
    filled-new-array {v7}, [Ljava/lang/Object;

    .line 258
    .line 259
    .line 260
    move-result-object v7

    .line 261
    invoke-virtual {v6, v7}, Ll/evx;->l([Ljava/lang/Object;)V

    .line 262
    .line 263
    .line 264
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 265
    .line 266
    .line 267
    move-result-object v6

    .line 268
    const-string v7, " MEDIA_RECORDER_PREPARED"

    .line 269
    .line 270
    invoke-virtual {v6, v5, v7}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 271
    .line 272
    .line 273
    iget-object v6, v0, Ll/s410;->J1:Ll/q210$a;

    .line 274
    .line 275
    const/16 v7, 0x3000

    .line 276
    .line 277
    invoke-interface {v6, v7, v2, v3, v0}, Ll/q210$a;->g(IIILjava/lang/Object;)V

    .line 278
    .line 279
    .line 280
    sget-object v2, Lcom/momo/pipline/MomoInterface/MomoCodec$MomoCodecState;->START:Lcom/momo/pipline/MomoInterface/MomoCodec$MomoCodecState;

    .line 281
    .line 282
    iput-object v2, v0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->J:Lcom/momo/pipline/MomoInterface/MomoCodec$MomoCodecState;

    .line 283
    .line 284
    iget-object v2, v0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 285
    .line 286
    iput-boolean v4, v2, Ll/wvx;->b:Z

    .line 287
    .line 288
    goto/16 :goto_0

    .line 289
    .line 290
    :cond_1
    iget-object v6, v0, Ll/s410;->J1:Ll/q210$a;

    .line 291
    .line 292
    const/16 v7, 0x300a

    .line 293
    .line 294
    invoke-interface {v6, v7, v2, v3, v0}, Ll/q210$a;->g(IIILjava/lang/Object;)V

    .line 295
    .line 296
    .line 297
    goto/16 :goto_0

    .line 298
    .line 299
    :cond_2
    iget-object v6, v0, Ll/s410;->J1:Ll/q210$a;

    .line 300
    .line 301
    const/16 v7, 0x3003

    .line 302
    .line 303
    invoke-interface {v6, v7, v2, v3, v0}, Ll/q210$a;->g(IIILjava/lang/Object;)V

    .line 304
    .line 305
    .line 306
    goto/16 :goto_0

    .line 307
    .line 308
    :cond_3
    new-instance v6, Ljava/lang/StringBuilder;

    .line 309
    .line 310
    const-string v7, "get msg Error "

    .line 311
    .line 312
    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 313
    .line 314
    .line 315
    iget-object v7, v0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->J:Lcom/momo/pipline/MomoInterface/MomoCodec$MomoCodecState;

    .line 316
    .line 317
    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 318
    .line 319
    .line 320
    const-string v7, "/"

    .line 321
    .line 322
    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 323
    .line 324
    .line 325
    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 326
    .line 327
    .line 328
    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 329
    .line 330
    .line 331
    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 332
    .line 333
    .line 334
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 335
    .line 336
    .line 337
    move-result-object v6

    .line 338
    const-string v7, "zhangjj"

    .line 339
    .line 340
    invoke-static {v7, v6}, Ll/t9c;->a(Ljava/lang/String;Ljava/lang/String;)I

    .line 341
    .line 342
    .line 343
    iget-object v6, v0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->I:Ll/evx;

    .line 344
    .line 345
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 346
    .line 347
    .line 348
    move-result-object v7

    .line 349
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 350
    .line 351
    .line 352
    move-result-object v8

    .line 353
    new-instance v9, Ljava/lang/StringBuilder;

    .line 354
    .line 355
    const-string v10, "state:"

    .line 356
    .line 357
    invoke-direct {v9, v10}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 358
    .line 359
    .line 360
    iget-object v11, v0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->J:Lcom/momo/pipline/MomoInterface/MomoCodec$MomoCodecState;

    .line 361
    .line 362
    invoke-virtual {v9, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 363
    .line 364
    .line 365
    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 366
    .line 367
    .line 368
    move-result-object v9

    .line 369
    const-string v11, "MEDIA_ERROR"

    .line 370
    .line 371
    filled-new-array {v11, v7, v8, v9}, [Ljava/lang/Object;

    .line 372
    .line 373
    .line 374
    move-result-object v7

    .line 375
    invoke-virtual {v6, v7}, Ll/evx;->l([Ljava/lang/Object;)V

    .line 376
    .line 377
    .line 378
    iget-object v6, v0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->J:Lcom/momo/pipline/MomoInterface/MomoCodec$MomoCodecState;

    .line 379
    .line 380
    sget-object v7, Lcom/momo/pipline/MomoInterface/MomoCodec$MomoCodecState;->WAIT:Lcom/momo/pipline/MomoInterface/MomoCodec$MomoCodecState;

    .line 381
    .line 382
    if-eq v6, v7, :cond_6

    .line 383
    .line 384
    iput-object v7, v0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->J:Lcom/momo/pipline/MomoInterface/MomoCodec$MomoCodecState;

    .line 385
    .line 386
    const/16 v6, -0x130

    .line 387
    .line 388
    if-ne v2, v6, :cond_4

    .line 389
    .line 390
    invoke-direct {v0, v3}, Ll/s410;->v4(I)V

    .line 391
    .line 392
    .line 393
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 394
    .line 395
    .line 396
    move-result-object v2

    .line 397
    const-string v3, " MOMO_ERROR_NETWORK "

    .line 398
    .line 399
    invoke-virtual {v2, v5, v3}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 400
    .line 401
    .line 402
    goto :goto_0

    .line 403
    :cond_4
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 404
    .line 405
    .line 406
    move-result-object v6

    .line 407
    const-string v7, " MOMO_ERROR_SYSTEM "

    .line 408
    .line 409
    invoke-virtual {v6, v5, v7}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 410
    .line 411
    .line 412
    iget-object v6, v0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->I:Ll/evx;

    .line 413
    .line 414
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 415
    .line 416
    .line 417
    move-result-object v7

    .line 418
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 419
    .line 420
    .line 421
    move-result-object v8

    .line 422
    new-instance v9, Ljava/lang/StringBuilder;

    .line 423
    .line 424
    invoke-direct {v9, v10}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 425
    .line 426
    .line 427
    iget-object v10, v0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->J:Lcom/momo/pipline/MomoInterface/MomoCodec$MomoCodecState;

    .line 428
    .line 429
    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 430
    .line 431
    .line 432
    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 433
    .line 434
    .line 435
    move-result-object v9

    .line 436
    const-string v10, "onPusherError"

    .line 437
    .line 438
    filled-new-array {v10, v7, v8, v9}, [Ljava/lang/Object;

    .line 439
    .line 440
    .line 441
    move-result-object v7

    .line 442
    invoke-virtual {v6, v7}, Ll/evx;->l([Ljava/lang/Object;)V

    .line 443
    .line 444
    .line 445
    iget-object v6, v0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 446
    .line 447
    int-to-long v7, v3

    .line 448
    iput-wide v7, v6, Ll/wvx;->y0:J

    .line 449
    .line 450
    iget-object v6, v0, Ll/s410;->J1:Ll/q210$a;

    .line 451
    .line 452
    const/16 v7, 0x3100

    .line 453
    .line 454
    invoke-interface {v6, v7, v2, v3, v0}, Ll/q210$a;->g(IIILjava/lang/Object;)V

    .line 455
    .line 456
    .line 457
    invoke-virtual {v0, v7, v2}, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->e2(II)V

    .line 458
    .line 459
    .line 460
    goto :goto_0

    .line 461
    :cond_5
    iget-object v6, v0, Ll/s410;->J1:Ll/q210$a;

    .line 462
    .line 463
    const/16 v7, 0x3002

    .line 464
    .line 465
    invoke-interface {v6, v7, v2, v3, v0}, Ll/q210$a;->g(IIILjava/lang/Object;)V

    .line 466
    .line 467
    .line 468
    :cond_6
    :goto_0
    const/16 v2, 0x64

    .line 469
    .line 470
    if-ne v1, v2, :cond_b

    .line 471
    .line 472
    iget-object v1, v0, Ll/s410;->l1:Lcom/immomo/mediacore/sink/IjkWriter;

    .line 473
    .line 474
    if-eqz v1, :cond_b

    .line 475
    .line 476
    invoke-virtual {v1}, Lcom/immomo/mediacore/sink/IjkWriter;->notifyPrepared()V

    .line 477
    .line 478
    .line 479
    iget-object v1, v0, Ll/grx;->U0:Ljava/nio/ByteBuffer;

    .line 480
    .line 481
    const-string v2, ";isReadyToWrite:"

    .line 482
    .line 483
    if-eqz v1, :cond_7

    .line 484
    .line 485
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 486
    .line 487
    .line 488
    move-result-object v1

    .line 489
    new-instance v3, Ljava/lang/StringBuilder;

    .line 490
    .line 491
    const-string v6, "start Record writeAudioExtradata: mAudioHeader len "

    .line 492
    .line 493
    invoke-direct {v3, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 494
    .line 495
    .line 496
    iget-object v6, v0, Ll/grx;->U0:Ljava/nio/ByteBuffer;

    .line 497
    .line 498
    invoke-virtual {v6}, Ljava/nio/Buffer;->limit()I

    .line 499
    .line 500
    .line 501
    move-result v6

    .line 502
    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 503
    .line 504
    .line 505
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 506
    .line 507
    .line 508
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 509
    .line 510
    .line 511
    move-result-object v3

    .line 512
    invoke-virtual {v1, v5, v3}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 513
    .line 514
    .line 515
    iget-object v1, v0, Ll/s410;->l1:Lcom/immomo/mediacore/sink/IjkWriter;

    .line 516
    .line 517
    iget-object v3, v0, Ll/grx;->U0:Ljava/nio/ByteBuffer;

    .line 518
    .line 519
    invoke-virtual {v3}, Ljava/nio/Buffer;->limit()I

    .line 520
    .line 521
    .line 522
    move-result v6

    .line 523
    int-to-long v6, v6

    .line 524
    invoke-virtual {v1, v3, v6, v7}, Lcom/immomo/mediacore/sink/IjkWriter;->writeAudioExtradata(Ljava/nio/ByteBuffer;J)V

    .line 525
    .line 526
    .line 527
    goto :goto_1

    .line 528
    :cond_7
    iget-object v1, v0, Ll/grx;->V0:Ljava/nio/ByteBuffer;

    .line 529
    .line 530
    if-eqz v1, :cond_8

    .line 531
    .line 532
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 533
    .line 534
    .line 535
    move-result-object v1

    .line 536
    new-instance v3, Ljava/lang/StringBuilder;

    .line 537
    .line 538
    const-string v6, "start Record writeAudioExtradata: mSoftAudioHeader len "

    .line 539
    .line 540
    invoke-direct {v3, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 541
    .line 542
    .line 543
    iget-object v6, v0, Ll/grx;->V0:Ljava/nio/ByteBuffer;

    .line 544
    .line 545
    invoke-virtual {v6}, Ljava/nio/Buffer;->limit()I

    .line 546
    .line 547
    .line 548
    move-result v6

    .line 549
    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 550
    .line 551
    .line 552
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 553
    .line 554
    .line 555
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 556
    .line 557
    .line 558
    move-result-object v3

    .line 559
    invoke-virtual {v1, v5, v3}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 560
    .line 561
    .line 562
    iget-object v1, v0, Ll/s410;->l1:Lcom/immomo/mediacore/sink/IjkWriter;

    .line 563
    .line 564
    iget-object v3, v0, Ll/grx;->V0:Ljava/nio/ByteBuffer;

    .line 565
    .line 566
    invoke-virtual {v3}, Ljava/nio/Buffer;->limit()I

    .line 567
    .line 568
    .line 569
    move-result v6

    .line 570
    int-to-long v6, v6

    .line 571
    invoke-virtual {v1, v3, v6, v7}, Lcom/immomo/mediacore/sink/IjkWriter;->writeAudioExtradata(Ljava/nio/ByteBuffer;J)V

    .line 572
    .line 573
    .line 574
    :cond_8
    :goto_1
    iget-object v1, v0, Ll/s410;->o1:Ljava/nio/ByteBuffer;

    .line 575
    .line 576
    if-eqz v1, :cond_9

    .line 577
    .line 578
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 579
    .line 580
    .line 581
    move-result-object v1

    .line 582
    new-instance v3, Ljava/lang/StringBuilder;

    .line 583
    .line 584
    const-string v6, "start Record writeVideoExtradata: mVideoExtraData len "

    .line 585
    .line 586
    invoke-direct {v3, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 587
    .line 588
    .line 589
    iget-object v6, v0, Ll/s410;->o1:Ljava/nio/ByteBuffer;

    .line 590
    .line 591
    invoke-virtual {v6}, Ljava/nio/Buffer;->limit()I

    .line 592
    .line 593
    .line 594
    move-result v6

    .line 595
    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 596
    .line 597
    .line 598
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 599
    .line 600
    .line 601
    iget-boolean v2, v0, Ll/s410;->p1:Z

    .line 602
    .line 603
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 604
    .line 605
    .line 606
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 607
    .line 608
    .line 609
    move-result-object v2

    .line 610
    invoke-virtual {v1, v5, v2}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 611
    .line 612
    .line 613
    iget-object v1, v0, Ll/s410;->l1:Lcom/immomo/mediacore/sink/IjkWriter;

    .line 614
    .line 615
    iget-object v2, v0, Ll/s410;->o1:Ljava/nio/ByteBuffer;

    .line 616
    .line 617
    invoke-virtual {v2}, Ljava/nio/Buffer;->limit()I

    .line 618
    .line 619
    .line 620
    move-result v3

    .line 621
    int-to-long v5, v3

    .line 622
    invoke-virtual {v1, v2, v5, v6}, Lcom/immomo/mediacore/sink/IjkWriter;->writeVideoExtradata(Ljava/nio/ByteBuffer;J)V

    .line 623
    .line 624
    .line 625
    goto :goto_2

    .line 626
    :cond_9
    iget-object v1, v0, Ll/grx;->W0:Ljava/nio/ByteBuffer;

    .line 627
    .line 628
    if-eqz v1, :cond_a

    .line 629
    .line 630
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 631
    .line 632
    .line 633
    move-result-object v1

    .line 634
    new-instance v3, Ljava/lang/StringBuilder;

    .line 635
    .line 636
    const-string v6, "start Record writeVideoExtradata: mSoftVideoHeader len "

    .line 637
    .line 638
    invoke-direct {v3, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 639
    .line 640
    .line 641
    iget-object v6, v0, Ll/grx;->W0:Ljava/nio/ByteBuffer;

    .line 642
    .line 643
    invoke-virtual {v6}, Ljava/nio/Buffer;->limit()I

    .line 644
    .line 645
    .line 646
    move-result v6

    .line 647
    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 648
    .line 649
    .line 650
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 651
    .line 652
    .line 653
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 654
    .line 655
    .line 656
    move-result-object v2

    .line 657
    invoke-virtual {v1, v5, v2}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 658
    .line 659
    .line 660
    iget-object v1, v0, Ll/s410;->l1:Lcom/immomo/mediacore/sink/IjkWriter;

    .line 661
    .line 662
    iget-object v2, v0, Ll/grx;->W0:Ljava/nio/ByteBuffer;

    .line 663
    .line 664
    invoke-virtual {v2}, Ljava/nio/Buffer;->limit()I

    .line 665
    .line 666
    .line 667
    move-result v3

    .line 668
    int-to-long v5, v3

    .line 669
    invoke-virtual {v1, v2, v5, v6}, Lcom/immomo/mediacore/sink/IjkWriter;->writeVideoExtradata(Ljava/nio/ByteBuffer;J)V

    .line 670
    .line 671
    .line 672
    :cond_a
    :goto_2
    iput-boolean v4, v0, Ll/s410;->p1:Z

    .line 673
    .line 674
    :cond_b
    return-void

    :pswitch_data_0
    .packed-switch 0x64
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

.method public notifyAdjustAef(IZ)V
    .locals 0

    .line 1
    return-void
.end method

.method public notifyAdjustEQ(IZ)V
    .locals 0

    .line 1
    return-void
.end method

.method public notifyAdjustEf(II)V
    .locals 0

    .line 1
    return-void
.end method

.method public notifyAdjustTune(IZ)V
    .locals 0

    .line 1
    return-void
.end method

.method public notifyEffectReset()V
    .locals 0

    .line 1
    return-void
.end method

.method public notifyEffectSet(IIF)V
    .locals 0

    .line 1
    return-void
.end method

.method public notifyEnableExtralAudio(Z)V
    .locals 0

    .line 1
    return-void
.end method

.method public notifyExtralAudioLoss()V
    .locals 0

    .line 1
    return-void
.end method

.method public notifyExtralAudioReady()V
    .locals 0

    .line 1
    return-void
.end method

.method public notifyRecording()V
    .locals 2

    .line 1
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const-string v0, "Pipeline_Flow_pip->MOMO"

    .line 6
    .line 7
    const-string v1, "notifyRecording !##########################"

    .line 8
    .line 9
    invoke-virtual {p0, v0, v1}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public notifyResumeRecording()V
    .locals 0

    .line 1
    return-void
.end method

.method public notifyUpdateResolution()V
    .locals 0

    .line 1
    return-void
.end method

.method public o()V
    .locals 0

    .line 1
    return-void
.end method

.method public o0()J
    .locals 2

    .line 1
    iget-object p0, p0, Ll/s410;->l1:Lcom/immomo/mediacore/sink/IjkWriter;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/immomo/mediacore/sink/IjkWriter;->getVideoPts()J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    return-wide v0

    .line 10
    :cond_0
    const-wide/16 v0, 0x0

    .line 11
    .line 12
    return-wide v0
.end method

.method public o1(Ljava/nio/ByteBuffer;)Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public onDrawFrame()V
    .locals 1

    .line 1
    invoke-super {p0}, Ll/wej;->onDrawFrame()V

    .line 2
    .line 3
    .line 4
    iget v0, p0, Ll/s410;->z1:I

    .line 5
    .line 6
    add-int/lit8 v0, v0, 0x1

    .line 7
    .line 8
    iput v0, p0, Ll/s410;->z1:I

    .line 9
    .line 10
    return-void
.end method

.method public p(Ljava/lang/String;I)V
    .locals 0

    .line 1
    return-void
.end method

.method public p0(Ljava/nio/ByteBuffer;)Z
    .locals 1

    .line 1
    const/4 v0, 0x2

    .line 2
    invoke-virtual {p0, p1, v0}, Ll/s410;->L4(Ljava/nio/ByteBuffer;I)Z

    .line 3
    .line 4
    .line 5
    move-result p0

    .line 6
    return p0
.end method

.method public p1()I
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/s410;->getVideoWidth()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public q1()J
    .locals 3

    .line 1
    iget-boolean v0, p0, Ll/grx;->Y0:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Ll/s410;->l1:Lcom/immomo/mediacore/sink/IjkWriter;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    const/16 p0, 0x4e2c

    .line 10
    .line 11
    const-wide/16 v1, 0x0

    .line 12
    .line 13
    invoke-virtual {v0, p0, v1, v2}, Lcom/immomo/mediacore/sink/IjkWriter;->getPropertyLong(IJ)J

    .line 14
    .line 15
    .line 16
    move-result-wide v0

    .line 17
    return-wide v0

    .line 18
    :cond_0
    iget-wide v0, p0, Ll/s410;->t1:J

    .line 19
    .line 20
    return-wide v0
.end method

.method public q4(Z)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    const-wide/16 v1, 0x1

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    const-wide/16 v1, 0x0

    .line 9
    .line 10
    :goto_0
    iput-wide v1, v0, Ll/wvx;->V:J

    .line 11
    .line 12
    iget-object p0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->I:Ll/evx;

    .line 13
    .line 14
    const-string v0, "muteLocalAudioStream"

    .line 15
    .line 16
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    filled-new-array {v0, p1}, [Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    invoke-virtual {p0, p1}, Ll/evx;->l([Ljava/lang/Object;)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public r0()J
    .locals 7

    .line 1
    iget-object v0, p0, Ll/s410;->l1:Lcom/immomo/mediacore/sink/IjkWriter;

    .line 2
    .line 3
    const-wide/16 v1, 0x0

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    return-wide v1

    .line 8
    :cond_0
    iget-boolean v3, p0, Ll/grx;->Y0:Z

    .line 9
    .line 10
    if-eqz v3, :cond_2

    .line 11
    .line 12
    iget-wide v3, p0, Ll/s410;->y1:J

    .line 13
    .line 14
    iget-object p0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 15
    .line 16
    iget-wide v5, p0, Ll/wvx;->a:J

    .line 17
    .line 18
    :cond_1
    :goto_0
    sub-long/2addr v3, v5

    .line 19
    goto :goto_1

    .line 20
    :cond_2
    const/16 v3, 0x4e30

    .line 21
    .line 22
    invoke-virtual {v0, v3, v1, v2}, Lcom/immomo/mediacore/sink/IjkWriter;->getPropertyLong(IJ)J

    .line 23
    .line 24
    .line 25
    move-result-wide v3

    .line 26
    iget-object v0, p0, Ll/s410;->l1:Lcom/immomo/mediacore/sink/IjkWriter;

    .line 27
    .line 28
    const/16 v5, 0x4e20

    .line 29
    .line 30
    invoke-virtual {v0, v5, v1, v2}, Lcom/immomo/mediacore/sink/IjkWriter;->getPropertyLong(IJ)J

    .line 31
    .line 32
    .line 33
    move-result-wide v5

    .line 34
    cmp-long v0, v3, v1

    .line 35
    .line 36
    if-eqz v0, :cond_3

    .line 37
    .line 38
    cmp-long v0, v5, v1

    .line 39
    .line 40
    if-nez v0, :cond_1

    .line 41
    .line 42
    :cond_3
    iget-wide v3, p0, Ll/s410;->y1:J

    .line 43
    .line 44
    iget-object p0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 45
    .line 46
    iget-wide v5, p0, Ll/wvx;->a:J

    .line 47
    .line 48
    goto :goto_0

    .line 49
    :goto_1
    cmp-long p0, v3, v1

    .line 50
    .line 51
    if-gez p0, :cond_4

    .line 52
    .line 53
    return-wide v1

    .line 54
    :cond_4
    return-wide v3
.end method

.method public s0()I
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    iget-wide v0, p0, Ll/wvx;->Y:J

    .line 6
    .line 7
    long-to-int p0, v0

    .line 8
    return p0

    .line 9
    :cond_0
    const/4 p0, 0x0

    .line 10
    return p0
.end method

.method public setSourceSucess()V
    .locals 0

    .line 1
    return-void
.end method

.method public setStreamerCaptureType(II)V
    .locals 0

    .line 1
    return-void
.end method

.method public startSurroundMusic(Ljava/lang/String;IJ)V
    .locals 0

    .line 1
    return-void
.end method

.method public stopSurroundMusic()V
    .locals 0

    .line 1
    return-void
.end method

.method public t1(Ljava/nio/ByteBuffer;J)Z
    .locals 3

    .line 1
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ljava/lang/StringBuilder;

    .line 6
    .line 7
    const-string v2, "  writeAudioExtradata: len "

    .line 8
    .line 9
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {v1, p2, p3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    const-string v2, ";isReadyToWrite:"

    .line 16
    .line 17
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    iget-boolean v2, p0, Ll/s410;->p1:Z

    .line 21
    .line 22
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    const-string v2, "Pipeline_Flow_pip->MOMO"

    .line 30
    .line 31
    invoke-virtual {v0, v2, v1}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    iget-boolean v0, p0, Ll/s410;->p1:Z

    .line 35
    .line 36
    if-nez v0, :cond_0

    .line 37
    .line 38
    iput-object p1, p0, Ll/grx;->V0:Ljava/nio/ByteBuffer;

    .line 39
    .line 40
    const/4 p0, 0x0

    .line 41
    return p0

    .line 42
    :cond_0
    iget-object p0, p0, Ll/s410;->l1:Lcom/immomo/mediacore/sink/IjkWriter;

    .line 43
    .line 44
    if-eqz p0, :cond_1

    .line 45
    .line 46
    invoke-virtual {p0, p1, p2, p3}, Lcom/immomo/mediacore/sink/IjkWriter;->writeAudioExtradata(Ljava/nio/ByteBuffer;J)V

    .line 47
    .line 48
    .line 49
    :cond_1
    const/4 p0, 0x1

    .line 50
    return p0
.end method

.method public u0()J
    .locals 3

    .line 1
    iget-object p0, p0, Ll/s410;->l1:Lcom/immomo/mediacore/sink/IjkWriter;

    .line 2
    .line 3
    const-wide/16 v0, 0x0

    .line 4
    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    const/16 v2, 0x4e23

    .line 8
    .line 9
    invoke-virtual {p0, v2, v0, v1}, Lcom/immomo/mediacore/sink/IjkWriter;->getPropertyLong(IJ)J

    .line 10
    .line 11
    .line 12
    move-result-wide v0

    .line 13
    :cond_0
    return-wide v0
.end method

.method public u1()J
    .locals 3

    .line 1
    iget-object p0, p0, Ll/s410;->l1:Lcom/immomo/mediacore/sink/IjkWriter;

    .line 2
    .line 3
    const-wide/16 v0, 0x0

    .line 4
    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    const/16 v2, 0x4e27

    .line 8
    .line 9
    invoke-virtual {p0, v2, v0, v1}, Lcom/immomo/mediacore/sink/IjkWriter;->getPropertyLong(IJ)J

    .line 10
    .line 11
    .line 12
    move-result-wide v0

    .line 13
    :cond_0
    return-wide v0
.end method

.method public u4()V
    .locals 4

    .line 1
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    const-wide/16 v2, 0x3e8

    .line 6
    .line 7
    div-long/2addr v0, v2

    .line 8
    iput-wide v0, p0, Ll/s410;->N1:J

    .line 9
    .line 10
    return-void
.end method

.method public w1()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "M"

    .line 2
    .line 3
    return-object p0
.end method

.method public x0(Landroid/media/MediaFormat;I)I
    .locals 5
    .annotation build Landroidx/annotation/RequiresApi;
        api = 0x10
    .end annotation

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/grx;->K2(Landroid/media/MediaFormat;I)I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    new-instance v1, Ljava/lang/StringBuilder;

    .line 10
    .line 11
    const-string v2, "addMediaTrack"

    .line 12
    .line 13
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object p2

    .line 23
    const-string v1, "Pipeline_Flow_pip->MOMO"

    .line 24
    .line 25
    invoke-virtual {v0, v1, p2}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    const/4 p2, 0x1

    .line 29
    const-string v0, ";isReadyToWrite:"

    .line 30
    .line 31
    if-ne p1, p2, :cond_1

    .line 32
    .line 33
    iget-object p2, p0, Ll/grx;->U0:Ljava/nio/ByteBuffer;

    .line 34
    .line 35
    if-eqz p2, :cond_9

    .line 36
    .line 37
    invoke-virtual {p2}, Ljava/nio/ByteBuffer;->rewind()Ljava/nio/Buffer;

    .line 38
    .line 39
    .line 40
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 41
    .line 42
    .line 43
    move-result-object p2

    .line 44
    new-instance v2, Ljava/lang/StringBuilder;

    .line 45
    .line 46
    const-string v3, "  writeAudioExtradata: len "

    .line 47
    .line 48
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 49
    .line 50
    .line 51
    iget-object v3, p0, Ll/grx;->U0:Ljava/nio/ByteBuffer;

    .line 52
    .line 53
    invoke-virtual {v3}, Ljava/nio/Buffer;->limit()I

    .line 54
    .line 55
    .line 56
    move-result v3

    .line 57
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 58
    .line 59
    .line 60
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 61
    .line 62
    .line 63
    iget-boolean v0, p0, Ll/s410;->p1:Z

    .line 64
    .line 65
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 66
    .line 67
    .line 68
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    invoke-virtual {p2, v1, v0}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 73
    .line 74
    .line 75
    iget-boolean p2, p0, Ll/s410;->p1:Z

    .line 76
    .line 77
    if-eqz p2, :cond_0

    .line 78
    .line 79
    iget-object p2, p0, Ll/s410;->l1:Lcom/immomo/mediacore/sink/IjkWriter;

    .line 80
    .line 81
    if-eqz p2, :cond_0

    .line 82
    .line 83
    iget-object v0, p0, Ll/grx;->U0:Ljava/nio/ByteBuffer;

    .line 84
    .line 85
    invoke-virtual {v0}, Ljava/nio/Buffer;->limit()I

    .line 86
    .line 87
    .line 88
    move-result v1

    .line 89
    int-to-long v1, v1

    .line 90
    invoke-virtual {p2, v0, v1, v2}, Lcom/immomo/mediacore/sink/IjkWriter;->writeAudioExtradata(Ljava/nio/ByteBuffer;J)V

    .line 91
    .line 92
    .line 93
    :cond_0
    iget-object p0, p0, Ll/grx;->U0:Ljava/nio/ByteBuffer;

    .line 94
    .line 95
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->rewind()Ljava/nio/Buffer;

    .line 96
    .line 97
    .line 98
    return p1

    .line 99
    :cond_1
    const/4 p2, 0x2

    .line 100
    if-ne p1, p2, :cond_9

    .line 101
    .line 102
    iget-object p2, p0, Ll/grx;->R0:Ljava/nio/ByteBuffer;

    .line 103
    .line 104
    const/4 v2, 0x0

    .line 105
    if-eqz p2, :cond_2

    .line 106
    .line 107
    invoke-virtual {p2}, Ljava/nio/Buffer;->limit()I

    .line 108
    .line 109
    .line 110
    move-result p2

    .line 111
    goto :goto_0

    .line 112
    :cond_2
    move p2, v2

    .line 113
    :goto_0
    iget-object v3, p0, Ll/grx;->Q0:Ljava/nio/ByteBuffer;

    .line 114
    .line 115
    if-eqz v3, :cond_3

    .line 116
    .line 117
    invoke-virtual {v3}, Ljava/nio/Buffer;->limit()I

    .line 118
    .line 119
    .line 120
    move-result v3

    .line 121
    goto :goto_1

    .line 122
    :cond_3
    move v3, v2

    .line 123
    :goto_1
    iget-object v4, p0, Ll/grx;->P0:Ljava/nio/ByteBuffer;

    .line 124
    .line 125
    if-eqz v4, :cond_4

    .line 126
    .line 127
    invoke-virtual {v4}, Ljava/nio/Buffer;->limit()I

    .line 128
    .line 129
    .line 130
    move-result v4

    .line 131
    goto :goto_2

    .line 132
    :cond_4
    move v4, v2

    .line 133
    :goto_2
    add-int/2addr v4, v3

    .line 134
    add-int/2addr v4, p2

    .line 135
    if-eqz v4, :cond_9

    .line 136
    .line 137
    iget-object p2, p0, Ll/s410;->o1:Ljava/nio/ByteBuffer;

    .line 138
    .line 139
    if-eqz p2, :cond_5

    .line 140
    .line 141
    invoke-virtual {p2}, Ljava/nio/ByteBuffer;->clear()Ljava/nio/Buffer;

    .line 142
    .line 143
    .line 144
    const/4 p2, 0x0

    .line 145
    iput-object p2, p0, Ll/s410;->o1:Ljava/nio/ByteBuffer;

    .line 146
    .line 147
    :cond_5
    invoke-static {v4}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    .line 148
    .line 149
    .line 150
    move-result-object p2

    .line 151
    iput-object p2, p0, Ll/s410;->o1:Ljava/nio/ByteBuffer;

    .line 152
    .line 153
    if-eqz p2, :cond_8

    .line 154
    .line 155
    invoke-virtual {p2}, Ljava/nio/ByteBuffer;->rewind()Ljava/nio/Buffer;

    .line 156
    .line 157
    .line 158
    iget-object p2, p0, Ll/s410;->o1:Ljava/nio/ByteBuffer;

    .line 159
    .line 160
    invoke-virtual {p2, v2}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 161
    .line 162
    .line 163
    iget-object p2, p0, Ll/grx;->R0:Ljava/nio/ByteBuffer;

    .line 164
    .line 165
    if-eqz p2, :cond_6

    .line 166
    .line 167
    invoke-virtual {p2}, Ljava/nio/ByteBuffer;->rewind()Ljava/nio/Buffer;

    .line 168
    .line 169
    .line 170
    iget-object p2, p0, Ll/s410;->o1:Ljava/nio/ByteBuffer;

    .line 171
    .line 172
    iget-object v2, p0, Ll/grx;->R0:Ljava/nio/ByteBuffer;

    .line 173
    .line 174
    invoke-virtual {v2}, Ljava/nio/ByteBuffer;->array()[B

    .line 175
    .line 176
    .line 177
    move-result-object v2

    .line 178
    invoke-virtual {p2, v2}, Ljava/nio/ByteBuffer;->put([B)Ljava/nio/ByteBuffer;

    .line 179
    .line 180
    .line 181
    iget-object p2, p0, Ll/grx;->R0:Ljava/nio/ByteBuffer;

    .line 182
    .line 183
    invoke-virtual {p2}, Ljava/nio/ByteBuffer;->rewind()Ljava/nio/Buffer;

    .line 184
    .line 185
    .line 186
    goto :goto_3

    .line 187
    :cond_6
    iget-object p2, p0, Ll/grx;->Q0:Ljava/nio/ByteBuffer;

    .line 188
    .line 189
    if-eqz p2, :cond_7

    .line 190
    .line 191
    iget-object p2, p0, Ll/grx;->P0:Ljava/nio/ByteBuffer;

    .line 192
    .line 193
    if-eqz p2, :cond_7

    .line 194
    .line 195
    invoke-virtual {p2}, Ljava/nio/ByteBuffer;->rewind()Ljava/nio/Buffer;

    .line 196
    .line 197
    .line 198
    iget-object p2, p0, Ll/grx;->Q0:Ljava/nio/ByteBuffer;

    .line 199
    .line 200
    invoke-virtual {p2}, Ljava/nio/ByteBuffer;->rewind()Ljava/nio/Buffer;

    .line 201
    .line 202
    .line 203
    iget-object p2, p0, Ll/s410;->o1:Ljava/nio/ByteBuffer;

    .line 204
    .line 205
    iget-object v2, p0, Ll/grx;->Q0:Ljava/nio/ByteBuffer;

    .line 206
    .line 207
    invoke-virtual {v2}, Ljava/nio/ByteBuffer;->array()[B

    .line 208
    .line 209
    .line 210
    move-result-object v2

    .line 211
    invoke-virtual {p2, v2}, Ljava/nio/ByteBuffer;->put([B)Ljava/nio/ByteBuffer;

    .line 212
    .line 213
    .line 214
    iget-object p2, p0, Ll/s410;->o1:Ljava/nio/ByteBuffer;

    .line 215
    .line 216
    iget-object v2, p0, Ll/grx;->P0:Ljava/nio/ByteBuffer;

    .line 217
    .line 218
    invoke-virtual {v2}, Ljava/nio/ByteBuffer;->array()[B

    .line 219
    .line 220
    .line 221
    move-result-object v2

    .line 222
    invoke-virtual {p2, v2}, Ljava/nio/ByteBuffer;->put([B)Ljava/nio/ByteBuffer;

    .line 223
    .line 224
    .line 225
    iget-object p2, p0, Ll/grx;->P0:Ljava/nio/ByteBuffer;

    .line 226
    .line 227
    invoke-virtual {p2}, Ljava/nio/ByteBuffer;->rewind()Ljava/nio/Buffer;

    .line 228
    .line 229
    .line 230
    iget-object p2, p0, Ll/grx;->Q0:Ljava/nio/ByteBuffer;

    .line 231
    .line 232
    invoke-virtual {p2}, Ljava/nio/ByteBuffer;->rewind()Ljava/nio/Buffer;

    .line 233
    .line 234
    .line 235
    :cond_7
    :goto_3
    iget-object p2, p0, Ll/s410;->o1:Ljava/nio/ByteBuffer;

    .line 236
    .line 237
    invoke-virtual {p2}, Ljava/nio/ByteBuffer;->rewind()Ljava/nio/Buffer;

    .line 238
    .line 239
    .line 240
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 241
    .line 242
    .line 243
    move-result-object p2

    .line 244
    new-instance v2, Ljava/lang/StringBuilder;

    .line 245
    .line 246
    const-string v3, "  writeVideoExtradata: len "

    .line 247
    .line 248
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 249
    .line 250
    .line 251
    iget-object v3, p0, Ll/s410;->o1:Ljava/nio/ByteBuffer;

    .line 252
    .line 253
    invoke-virtual {v3}, Ljava/nio/Buffer;->limit()I

    .line 254
    .line 255
    .line 256
    move-result v3

    .line 257
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 258
    .line 259
    .line 260
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 261
    .line 262
    .line 263
    iget-boolean v0, p0, Ll/s410;->p1:Z

    .line 264
    .line 265
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 266
    .line 267
    .line 268
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 269
    .line 270
    .line 271
    move-result-object v0

    .line 272
    invoke-virtual {p2, v1, v0}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 273
    .line 274
    .line 275
    :cond_8
    iget-boolean p2, p0, Ll/s410;->p1:Z

    .line 276
    .line 277
    if-eqz p2, :cond_9

    .line 278
    .line 279
    iget-object p2, p0, Ll/s410;->l1:Lcom/immomo/mediacore/sink/IjkWriter;

    .line 280
    .line 281
    if-eqz p2, :cond_9

    .line 282
    .line 283
    iget-object p0, p0, Ll/s410;->o1:Ljava/nio/ByteBuffer;

    .line 284
    .line 285
    if-eqz p0, :cond_9

    .line 286
    .line 287
    invoke-virtual {p0}, Ljava/nio/Buffer;->limit()I

    .line 288
    .line 289
    .line 290
    move-result v0

    .line 291
    int-to-long v0, v0

    .line 292
    invoke-virtual {p2, p0, v0, v1}, Lcom/immomo/mediacore/sink/IjkWriter;->writeVideoExtradata(Ljava/nio/ByteBuffer;J)V

    .line 293
    .line 294
    .line 295
    :cond_9
    return p1
.end method

.method public x1()J
    .locals 2

    .line 1
    iget p0, p0, Ll/s410;->A1:I

    .line 2
    .line 3
    mul-int/lit16 p0, p0, 0x400

    .line 4
    .line 5
    int-to-long v0, p0

    .line 6
    return-wide v0
.end method

.method public x4()V
    .locals 8

    .line 1
    iget-wide v0, p0, Ll/s410;->N1:J

    .line 2
    .line 3
    const-wide/16 v2, 0x0

    .line 4
    .line 5
    cmp-long v0, v0, v2

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-wide v0, p0, Ll/s410;->M1:J

    .line 10
    .line 11
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    .line 12
    .line 13
    .line 14
    move-result-wide v4

    .line 15
    const-wide/16 v6, 0x3e8

    .line 16
    .line 17
    div-long/2addr v4, v6

    .line 18
    iget-wide v6, p0, Ll/s410;->N1:J

    .line 19
    .line 20
    sub-long/2addr v4, v6

    .line 21
    add-long/2addr v0, v4

    .line 22
    iput-wide v0, p0, Ll/s410;->M1:J

    .line 23
    .line 24
    iput-wide v2, p0, Ll/s410;->N1:J

    .line 25
    .line 26
    :cond_0
    return-void
.end method

.method public y(II)V
    .locals 0

    .line 1
    return-void
.end method

.method public z0(Ljava/nio/ByteBuffer;J)Z
    .locals 3

    .line 1
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ljava/lang/StringBuilder;

    .line 6
    .line 7
    const-string v2, "  writeVideoExtradata: len "

    .line 8
    .line 9
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {v1, p2, p3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    const-string v2, ";isReadyToWrite:"

    .line 16
    .line 17
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    iget-boolean v2, p0, Ll/s410;->p1:Z

    .line 21
    .line 22
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    const-string v2, "Pipeline_Flow_pip->MOMO"

    .line 30
    .line 31
    invoke-virtual {v0, v2, v1}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    iget-boolean v0, p0, Ll/s410;->p1:Z

    .line 35
    .line 36
    if-nez v0, :cond_0

    .line 37
    .line 38
    iput-object p1, p0, Ll/grx;->W0:Ljava/nio/ByteBuffer;

    .line 39
    .line 40
    const/4 p0, 0x0

    .line 41
    return p0

    .line 42
    :cond_0
    iget-object p0, p0, Ll/s410;->l1:Lcom/immomo/mediacore/sink/IjkWriter;

    .line 43
    .line 44
    if-eqz p0, :cond_1

    .line 45
    .line 46
    invoke-virtual {p0, p1, p2, p3}, Lcom/immomo/mediacore/sink/IjkWriter;->writeVideoExtradata(Ljava/nio/ByteBuffer;J)V

    .line 47
    .line 48
    .line 49
    :cond_1
    const/4 p0, 0x1

    .line 50
    return p0
.end method

.method public z4(I)V
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 2
    .line 3
    int-to-long v0, p1

    .line 4
    iput-wide v0, p0, Ll/wvx;->i:J

    .line 5
    .line 6
    return-void
.end method

.class public Lcom/immomo/momomediaext/MMLiveEngine;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/immomo/momomediaext/MMLiveEngine$d0;,
        Lcom/immomo/momomediaext/MMLiveEngine$MMLiveEngineType;
    }
.end annotation


# static fields
.field private static final v0:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private A:Ll/a320;

.field private B:Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLiveAudioProfile;

.field private C:Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLiveAudioScenario;

.field private D:Ljava/lang/String;

.field private E:Lcom/immomo/momomediaext/MomoMediaConstants$BEAUTY_TYPE;

.field private F:Ljava/lang/String;

.field private G:Z

.field private H:Z

.field private I:Z

.field private J:Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;

.field private K:I

.field private L:Lcom/immomo/momomediaext/utils/MMLiveTranscoding;

.field private M:Lcom/immomo/momomediaext/utils/MMLiveVideoEncoderConfig;

.field private N:Ljava/lang/Object;

.field private O:Ll/lvl;

.field private P:Z

.field private Q:Ll/zmw;

.field private R:Lcom/immomo/momomediaext/MomoMediaConstants$MMLiveSimulcastStreamMode;

.field private S:Ll/hnw;

.field private T:Lcom/immomo/momomediaext/MomoMediaConstants$MMLiveSimulcastStreamType;

.field private U:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private V:Z

.field private W:Lcom/immomo/mediacore/coninf/MRtcChannelHandler;

.field private X:Lcom/immomo/mediacore/coninf/MRtcTokenWillExpireHander;

.field private Y:Lcom/immomo/mediacore/coninf/MRtcReceiveSeiHandler;

.field private Z:Ll/wpw;

.field private a:Z

.field private a0:Lcom/immomo/mediacore/coninf/MRtcAudioHandler;

.field private b:F

.field private b0:Lcom/immomo/mediacore/coninf/MRtcPusherHandler;

.field private c:F

.field private c0:Ltv/danmaku/ijk/media/player/OnPlayerStateCallback;

.field private d:F

.field private d0:Ll/gb1;

.field private e:Ljava/lang/String;

.field private e0:Ll/gb1;

.field private f:J

.field private f0:Ll/gb1;

.field private g:Z

.field private g0:Lcom/momo/pub/MomoPipelineModuleRegister$a;

.field private h:Z

.field private h0:Lcom/momo/pub/MomoPipelineModuleRegister$c;

.field private i:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Landroid/content/Context;",
            ">;"
        }
    .end annotation
.end field

.field private i0:Lcom/momo/pub/MomoPipelineModuleRegister$b;

.field private j:Lcom/immomo/momomediaext/utils/MMLiveUserConfig;

.field private j0:Ll/h410$e;

.field private k:Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;

.field private k0:Ll/kod0;

.field private l:Ll/ror;

.field private l0:Ll/yuf;

.field private m:Lcom/momo/pub/MomoPipelineModuleRegister;

.field private m0:Lcom/immomo/mediacore/coninf/MRtcEventHandler;

.field private n:Lcom/immomo/momomediaext/MMLiveSource;

.field private n0:Ll/gkl0;

.field private o:Ll/gnw;

.field private o0:Ll/ebl0;

.field private p:Lcom/immomo/momomediaext/a;

.field private p0:Ll/gbl0;

.field private q:Landroid/os/Handler;

.field private q0:Ll/fb1;

.field private r:Lcom/immomo/momomediaext/utils/MMLiveRoomParams;

.field private r0:Ll/ib4$l;

.field private s:Ll/enw;

.field private s0:Ll/f5m;

.field private t:Z

.field t0:Ll/fpf0;

.field private u:Z

.field private u0:Ll/l6m$a;

.field private v:Z

.field private w:Z

.field private x:Z

.field private y:Z

.field private z:Ljava/util/Timer;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/immomo/momomediaext/MMLiveEngine;->v0:Ljava/util/ArrayList;

    .line 7
    .line 8
    return-void
.end method

.method public constructor <init>(Lcom/immomo/momomediaext/utils/MMLiveUserConfig;Landroid/content/Context;)V
    .locals 18
    .param p2    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    const/4 v2, 0x0

    .line 9
    iput-boolean v2, v0, Lcom/immomo/momomediaext/MMLiveEngine;->a:Z

    .line 10
    .line 11
    const/high16 v3, 0x3f800000    # 1.0f

    .line 12
    .line 13
    iput v3, v0, Lcom/immomo/momomediaext/MMLiveEngine;->b:F

    .line 14
    .line 15
    iput v3, v0, Lcom/immomo/momomediaext/MMLiveEngine;->c:F

    .line 16
    .line 17
    iput v3, v0, Lcom/immomo/momomediaext/MMLiveEngine;->d:F

    .line 18
    .line 19
    const-wide/16 v3, 0x0

    .line 20
    .line 21
    iput-wide v3, v0, Lcom/immomo/momomediaext/MMLiveEngine;->f:J

    .line 22
    .line 23
    iput-boolean v2, v0, Lcom/immomo/momomediaext/MMLiveEngine;->g:Z

    .line 24
    .line 25
    iput-boolean v2, v0, Lcom/immomo/momomediaext/MMLiveEngine;->h:Z

    .line 26
    .line 27
    new-instance v5, Lcom/immomo/momomediaext/utils/MMLiveUserConfig;

    .line 28
    .line 29
    const-string v11, "100"

    .line 30
    .line 31
    const/4 v12, 0x1

    .line 32
    const-string v6, "0"

    .line 33
    .line 34
    const-string v7, "0"

    .line 35
    .line 36
    const-string v8, "0"

    .line 37
    .line 38
    const-string v9, "0"

    .line 39
    .line 40
    const-string v10, "0"

    .line 41
    .line 42
    invoke-direct/range {v5 .. v12}, Lcom/immomo/momomediaext/utils/MMLiveUserConfig;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)V

    .line 43
    .line 44
    .line 45
    iput-object v5, v0, Lcom/immomo/momomediaext/MMLiveEngine;->j:Lcom/immomo/momomediaext/utils/MMLiveUserConfig;

    .line 46
    .line 47
    iput-boolean v2, v0, Lcom/immomo/momomediaext/MMLiveEngine;->t:Z

    .line 48
    .line 49
    iput-boolean v2, v0, Lcom/immomo/momomediaext/MMLiveEngine;->u:Z

    .line 50
    .line 51
    const/4 v3, 0x1

    .line 52
    iput-boolean v3, v0, Lcom/immomo/momomediaext/MMLiveEngine;->v:Z

    .line 53
    .line 54
    iput-boolean v3, v0, Lcom/immomo/momomediaext/MMLiveEngine;->w:Z

    .line 55
    .line 56
    iput-boolean v2, v0, Lcom/immomo/momomediaext/MMLiveEngine;->x:Z

    .line 57
    .line 58
    iput-boolean v2, v0, Lcom/immomo/momomediaext/MMLiveEngine;->y:Z

    .line 59
    .line 60
    sget-object v4, Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLiveAudioProfile;->MMLiveAudioProfileNone:Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLiveAudioProfile;

    .line 61
    .line 62
    iput-object v4, v0, Lcom/immomo/momomediaext/MMLiveEngine;->B:Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLiveAudioProfile;

    .line 63
    .line 64
    sget-object v4, Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLiveAudioScenario;->MMLiveAudioScenarioNone:Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLiveAudioScenario;

    .line 65
    .line 66
    iput-object v4, v0, Lcom/immomo/momomediaext/MMLiveEngine;->C:Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLiveAudioScenario;

    .line 67
    .line 68
    const-string v4, ""

    .line 69
    .line 70
    iput-object v4, v0, Lcom/immomo/momomediaext/MMLiveEngine;->D:Ljava/lang/String;

    .line 71
    .line 72
    sget-object v5, Lcom/immomo/momomediaext/MomoMediaConstants$BEAUTY_TYPE;->BEAUTY_TYPE_DOKI:Lcom/immomo/momomediaext/MomoMediaConstants$BEAUTY_TYPE;

    .line 73
    .line 74
    iput-object v5, v0, Lcom/immomo/momomediaext/MMLiveEngine;->E:Lcom/immomo/momomediaext/MomoMediaConstants$BEAUTY_TYPE;

    .line 75
    .line 76
    iput-object v4, v0, Lcom/immomo/momomediaext/MMLiveEngine;->F:Ljava/lang/String;

    .line 77
    .line 78
    iput-boolean v2, v0, Lcom/immomo/momomediaext/MMLiveEngine;->G:Z

    .line 79
    .line 80
    iput-boolean v2, v0, Lcom/immomo/momomediaext/MMLiveEngine;->H:Z

    .line 81
    .line 82
    iput-boolean v2, v0, Lcom/immomo/momomediaext/MMLiveEngine;->I:Z

    .line 83
    .line 84
    sget-object v5, Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;->MMLiveTypeDefault:Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;

    .line 85
    .line 86
    iput-object v5, v0, Lcom/immomo/momomediaext/MMLiveEngine;->J:Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;

    .line 87
    .line 88
    iput v2, v0, Lcom/immomo/momomediaext/MMLiveEngine;->K:I

    .line 89
    .line 90
    new-instance v5, Lcom/immomo/momomediaext/utils/MMLiveVideoEncoderConfig;

    .line 91
    .line 92
    invoke-direct {v5}, Lcom/immomo/momomediaext/utils/MMLiveVideoEncoderConfig;-><init>()V

    .line 93
    .line 94
    .line 95
    iput-object v5, v0, Lcom/immomo/momomediaext/MMLiveEngine;->M:Lcom/immomo/momomediaext/utils/MMLiveVideoEncoderConfig;

    .line 96
    .line 97
    new-instance v5, Ljava/lang/Object;

    .line 98
    .line 99
    invoke-direct {v5}, Ljava/lang/Object;-><init>()V

    .line 100
    .line 101
    .line 102
    iput-object v5, v0, Lcom/immomo/momomediaext/MMLiveEngine;->N:Ljava/lang/Object;

    .line 103
    .line 104
    const/4 v5, 0x0

    .line 105
    iput-object v5, v0, Lcom/immomo/momomediaext/MMLiveEngine;->O:Ll/lvl;

    .line 106
    .line 107
    iput-boolean v2, v0, Lcom/immomo/momomediaext/MMLiveEngine;->P:Z

    .line 108
    .line 109
    sget-object v6, Lcom/immomo/momomediaext/MomoMediaConstants$MMLiveSimulcastStreamMode;->NO_SET:Lcom/immomo/momomediaext/MomoMediaConstants$MMLiveSimulcastStreamMode;

    .line 110
    .line 111
    iput-object v6, v0, Lcom/immomo/momomediaext/MMLiveEngine;->R:Lcom/immomo/momomediaext/MomoMediaConstants$MMLiveSimulcastStreamMode;

    .line 112
    .line 113
    sget-object v6, Lcom/immomo/momomediaext/MomoMediaConstants$MMLiveSimulcastStreamType;->DEFAULT:Lcom/immomo/momomediaext/MomoMediaConstants$MMLiveSimulcastStreamType;

    .line 114
    .line 115
    iput-object v6, v0, Lcom/immomo/momomediaext/MMLiveEngine;->T:Lcom/immomo/momomediaext/MomoMediaConstants$MMLiveSimulcastStreamType;

    .line 116
    .line 117
    new-instance v6, Ljava/util/ArrayList;

    .line 118
    .line 119
    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    .line 120
    .line 121
    .line 122
    iput-object v6, v0, Lcom/immomo/momomediaext/MMLiveEngine;->U:Ljava/util/List;

    .line 123
    .line 124
    iput-boolean v2, v0, Lcom/immomo/momomediaext/MMLiveEngine;->V:Z

    .line 125
    .line 126
    new-instance v6, Lcom/immomo/momomediaext/MMLiveEngine$x;

    .line 127
    .line 128
    invoke-direct {v6, v0}, Lcom/immomo/momomediaext/MMLiveEngine$x;-><init>(Lcom/immomo/momomediaext/MMLiveEngine;)V

    .line 129
    .line 130
    .line 131
    iput-object v6, v0, Lcom/immomo/momomediaext/MMLiveEngine;->W:Lcom/immomo/mediacore/coninf/MRtcChannelHandler;

    .line 132
    .line 133
    new-instance v6, Lcom/immomo/momomediaext/MMLiveEngine$y;

    .line 134
    .line 135
    invoke-direct {v6, v0}, Lcom/immomo/momomediaext/MMLiveEngine$y;-><init>(Lcom/immomo/momomediaext/MMLiveEngine;)V

    .line 136
    .line 137
    .line 138
    iput-object v6, v0, Lcom/immomo/momomediaext/MMLiveEngine;->X:Lcom/immomo/mediacore/coninf/MRtcTokenWillExpireHander;

    .line 139
    .line 140
    new-instance v6, Lcom/immomo/momomediaext/MMLiveEngine$z;

    .line 141
    .line 142
    invoke-direct {v6, v0}, Lcom/immomo/momomediaext/MMLiveEngine$z;-><init>(Lcom/immomo/momomediaext/MMLiveEngine;)V

    .line 143
    .line 144
    .line 145
    iput-object v6, v0, Lcom/immomo/momomediaext/MMLiveEngine;->Y:Lcom/immomo/mediacore/coninf/MRtcReceiveSeiHandler;

    .line 146
    .line 147
    new-instance v6, Lcom/immomo/momomediaext/MMLiveEngine$a0;

    .line 148
    .line 149
    invoke-direct {v6, v0}, Lcom/immomo/momomediaext/MMLiveEngine$a0;-><init>(Lcom/immomo/momomediaext/MMLiveEngine;)V

    .line 150
    .line 151
    .line 152
    iput-object v6, v0, Lcom/immomo/momomediaext/MMLiveEngine;->Z:Ll/wpw;

    .line 153
    .line 154
    new-instance v6, Lcom/immomo/momomediaext/MMLiveEngine$b0;

    .line 155
    .line 156
    invoke-direct {v6, v0}, Lcom/immomo/momomediaext/MMLiveEngine$b0;-><init>(Lcom/immomo/momomediaext/MMLiveEngine;)V

    .line 157
    .line 158
    .line 159
    iput-object v6, v0, Lcom/immomo/momomediaext/MMLiveEngine;->a0:Lcom/immomo/mediacore/coninf/MRtcAudioHandler;

    .line 160
    .line 161
    new-instance v6, Lcom/immomo/momomediaext/MMLiveEngine$c0;

    .line 162
    .line 163
    invoke-direct {v6, v0}, Lcom/immomo/momomediaext/MMLiveEngine$c0;-><init>(Lcom/immomo/momomediaext/MMLiveEngine;)V

    .line 164
    .line 165
    .line 166
    iput-object v6, v0, Lcom/immomo/momomediaext/MMLiveEngine;->b0:Lcom/immomo/mediacore/coninf/MRtcPusherHandler;

    .line 167
    .line 168
    new-instance v6, Lcom/immomo/momomediaext/MMLiveEngine$d;

    .line 169
    .line 170
    invoke-direct {v6, v0}, Lcom/immomo/momomediaext/MMLiveEngine$d;-><init>(Lcom/immomo/momomediaext/MMLiveEngine;)V

    .line 171
    .line 172
    .line 173
    iput-object v6, v0, Lcom/immomo/momomediaext/MMLiveEngine;->c0:Ltv/danmaku/ijk/media/player/OnPlayerStateCallback;

    .line 174
    .line 175
    new-instance v6, Lcom/immomo/momomediaext/MMLiveEngine$e;

    .line 176
    .line 177
    invoke-direct {v6, v0}, Lcom/immomo/momomediaext/MMLiveEngine$e;-><init>(Lcom/immomo/momomediaext/MMLiveEngine;)V

    .line 178
    .line 179
    .line 180
    iput-object v6, v0, Lcom/immomo/momomediaext/MMLiveEngine;->d0:Ll/gb1;

    .line 181
    .line 182
    new-instance v6, Lcom/immomo/momomediaext/MMLiveEngine$f;

    .line 183
    .line 184
    invoke-direct {v6, v0}, Lcom/immomo/momomediaext/MMLiveEngine$f;-><init>(Lcom/immomo/momomediaext/MMLiveEngine;)V

    .line 185
    .line 186
    .line 187
    iput-object v6, v0, Lcom/immomo/momomediaext/MMLiveEngine;->e0:Ll/gb1;

    .line 188
    .line 189
    new-instance v6, Lcom/immomo/momomediaext/MMLiveEngine$g;

    .line 190
    .line 191
    invoke-direct {v6, v0}, Lcom/immomo/momomediaext/MMLiveEngine$g;-><init>(Lcom/immomo/momomediaext/MMLiveEngine;)V

    .line 192
    .line 193
    .line 194
    iput-object v6, v0, Lcom/immomo/momomediaext/MMLiveEngine;->f0:Ll/gb1;

    .line 195
    .line 196
    new-instance v6, Lcom/immomo/momomediaext/MMLiveEngine$h;

    .line 197
    .line 198
    invoke-direct {v6, v0}, Lcom/immomo/momomediaext/MMLiveEngine$h;-><init>(Lcom/immomo/momomediaext/MMLiveEngine;)V

    .line 199
    .line 200
    .line 201
    iput-object v6, v0, Lcom/immomo/momomediaext/MMLiveEngine;->g0:Lcom/momo/pub/MomoPipelineModuleRegister$a;

    .line 202
    .line 203
    new-instance v6, Lcom/immomo/momomediaext/MMLiveEngine$i;

    .line 204
    .line 205
    invoke-direct {v6, v0}, Lcom/immomo/momomediaext/MMLiveEngine$i;-><init>(Lcom/immomo/momomediaext/MMLiveEngine;)V

    .line 206
    .line 207
    .line 208
    iput-object v6, v0, Lcom/immomo/momomediaext/MMLiveEngine;->h0:Lcom/momo/pub/MomoPipelineModuleRegister$c;

    .line 209
    .line 210
    new-instance v6, Lcom/immomo/momomediaext/MMLiveEngine$j;

    .line 211
    .line 212
    invoke-direct {v6, v0}, Lcom/immomo/momomediaext/MMLiveEngine$j;-><init>(Lcom/immomo/momomediaext/MMLiveEngine;)V

    .line 213
    .line 214
    .line 215
    iput-object v6, v0, Lcom/immomo/momomediaext/MMLiveEngine;->i0:Lcom/momo/pub/MomoPipelineModuleRegister$b;

    .line 216
    .line 217
    new-instance v6, Lcom/immomo/momomediaext/MMLiveEngine$m;

    .line 218
    .line 219
    invoke-direct {v6, v0}, Lcom/immomo/momomediaext/MMLiveEngine$m;-><init>(Lcom/immomo/momomediaext/MMLiveEngine;)V

    .line 220
    .line 221
    .line 222
    iput-object v6, v0, Lcom/immomo/momomediaext/MMLiveEngine;->j0:Ll/h410$e;

    .line 223
    .line 224
    new-instance v6, Lcom/immomo/momomediaext/MMLiveEngine$n;

    .line 225
    .line 226
    invoke-direct {v6, v0}, Lcom/immomo/momomediaext/MMLiveEngine$n;-><init>(Lcom/immomo/momomediaext/MMLiveEngine;)V

    .line 227
    .line 228
    .line 229
    iput-object v6, v0, Lcom/immomo/momomediaext/MMLiveEngine;->k0:Ll/kod0;

    .line 230
    .line 231
    new-instance v6, Lcom/immomo/momomediaext/MMLiveEngine$o;

    .line 232
    .line 233
    invoke-direct {v6, v0}, Lcom/immomo/momomediaext/MMLiveEngine$o;-><init>(Lcom/immomo/momomediaext/MMLiveEngine;)V

    .line 234
    .line 235
    .line 236
    iput-object v6, v0, Lcom/immomo/momomediaext/MMLiveEngine;->l0:Ll/yuf;

    .line 237
    .line 238
    new-instance v6, Lcom/immomo/momomediaext/MMLiveEngine$p;

    .line 239
    .line 240
    invoke-direct {v6, v0}, Lcom/immomo/momomediaext/MMLiveEngine$p;-><init>(Lcom/immomo/momomediaext/MMLiveEngine;)V

    .line 241
    .line 242
    .line 243
    iput-object v6, v0, Lcom/immomo/momomediaext/MMLiveEngine;->m0:Lcom/immomo/mediacore/coninf/MRtcEventHandler;

    .line 244
    .line 245
    iput-object v5, v0, Lcom/immomo/momomediaext/MMLiveEngine;->n0:Ll/gkl0;

    .line 246
    .line 247
    iput-object v5, v0, Lcom/immomo/momomediaext/MMLiveEngine;->o0:Ll/ebl0;

    .line 248
    .line 249
    iput-object v5, v0, Lcom/immomo/momomediaext/MMLiveEngine;->p0:Ll/gbl0;

    .line 250
    .line 251
    new-instance v6, Lcom/immomo/momomediaext/MMLiveEngine$q;

    .line 252
    .line 253
    invoke-direct {v6, v0}, Lcom/immomo/momomediaext/MMLiveEngine$q;-><init>(Lcom/immomo/momomediaext/MMLiveEngine;)V

    .line 254
    .line 255
    .line 256
    iput-object v6, v0, Lcom/immomo/momomediaext/MMLiveEngine;->q0:Ll/fb1;

    .line 257
    .line 258
    new-instance v6, Lcom/immomo/momomediaext/MMLiveEngine$r;

    .line 259
    .line 260
    invoke-direct {v6, v0}, Lcom/immomo/momomediaext/MMLiveEngine$r;-><init>(Lcom/immomo/momomediaext/MMLiveEngine;)V

    .line 261
    .line 262
    .line 263
    iput-object v6, v0, Lcom/immomo/momomediaext/MMLiveEngine;->r0:Ll/ib4$l;

    .line 264
    .line 265
    new-instance v6, Lcom/immomo/momomediaext/MMLiveEngine$s;

    .line 266
    .line 267
    invoke-direct {v6, v0}, Lcom/immomo/momomediaext/MMLiveEngine$s;-><init>(Lcom/immomo/momomediaext/MMLiveEngine;)V

    .line 268
    .line 269
    .line 270
    iput-object v6, v0, Lcom/immomo/momomediaext/MMLiveEngine;->s0:Ll/f5m;

    .line 271
    .line 272
    iput-object v5, v0, Lcom/immomo/momomediaext/MMLiveEngine;->t0:Ll/fpf0;

    .line 273
    .line 274
    new-instance v5, Lcom/immomo/momomediaext/MMLiveEngine$u;

    .line 275
    .line 276
    invoke-direct {v5, v0}, Lcom/immomo/momomediaext/MMLiveEngine$u;-><init>(Lcom/immomo/momomediaext/MMLiveEngine;)V

    .line 277
    .line 278
    .line 279
    iput-object v5, v0, Lcom/immomo/momomediaext/MMLiveEngine;->u0:Ll/l6m$a;

    .line 280
    .line 281
    if-eqz v1, :cond_0

    .line 282
    .line 283
    iput-object v1, v0, Lcom/immomo/momomediaext/MMLiveEngine;->j:Lcom/immomo/momomediaext/utils/MMLiveUserConfig;

    .line 284
    .line 285
    goto :goto_0

    .line 286
    :cond_0
    new-instance v6, Lcom/immomo/momomediaext/utils/MMLiveUserConfig;

    .line 287
    .line 288
    const-string v12, "100"

    .line 289
    .line 290
    const/4 v13, 0x1

    .line 291
    const-string v7, "0"

    .line 292
    .line 293
    const-string v8, "0"

    .line 294
    .line 295
    const-string v9, "0"

    .line 296
    .line 297
    const-string v10, "0"

    .line 298
    .line 299
    const-string v11, "0"

    .line 300
    .line 301
    invoke-direct/range {v6 .. v13}, Lcom/immomo/momomediaext/utils/MMLiveUserConfig;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)V

    .line 302
    .line 303
    .line 304
    iput-object v6, v0, Lcom/immomo/momomediaext/MMLiveEngine;->j:Lcom/immomo/momomediaext/utils/MMLiveUserConfig;

    .line 305
    .line 306
    :goto_0
    new-instance v5, Ljava/lang/ref/WeakReference;

    .line 307
    .line 308
    move-object/from16 v6, p2

    .line 309
    .line 310
    invoke-direct {v5, v6}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    .line 311
    .line 312
    .line 313
    iput-object v5, v0, Lcom/immomo/momomediaext/MMLiveEngine;->i:Ljava/lang/ref/WeakReference;

    .line 314
    .line 315
    invoke-virtual {v6}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 316
    .line 317
    .line 318
    move-result-object v5

    .line 319
    invoke-static {v5}, Ll/l26;->a(Landroid/content/Context;)V

    .line 320
    .line 321
    .line 322
    invoke-virtual {v6}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 323
    .line 324
    .line 325
    move-result-object v5

    .line 326
    invoke-static {v5}, Lcom/momo/xeengine/XEnginePreferences;->setApplicationContext(Landroid/content/Context;)V

    .line 327
    .line 328
    .line 329
    new-instance v5, Lcom/immomo/momomediaext/utils/MMLiveRoomParams;

    .line 330
    .line 331
    invoke-direct {v5}, Lcom/immomo/momomediaext/utils/MMLiveRoomParams;-><init>()V

    .line 332
    .line 333
    .line 334
    iput-object v5, v0, Lcom/immomo/momomediaext/MMLiveEngine;->r:Lcom/immomo/momomediaext/utils/MMLiveRoomParams;

    .line 335
    .line 336
    new-instance v5, Lcom/immomo/momomediaext/MMLiveEngine$d0;

    .line 337
    .line 338
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 339
    .line 340
    .line 341
    move-result-object v7

    .line 342
    invoke-direct {v5, v0, v7}, Lcom/immomo/momomediaext/MMLiveEngine$d0;-><init>(Lcom/immomo/momomediaext/MMLiveEngine;Landroid/os/Looper;)V

    .line 343
    .line 344
    .line 345
    iput-object v5, v0, Lcom/immomo/momomediaext/MMLiveEngine;->q:Landroid/os/Handler;

    .line 346
    .line 347
    invoke-virtual {v0}, Lcom/immomo/momomediaext/MMLiveEngine;->G()V

    .line 348
    .line 349
    .line 350
    new-instance v5, Ll/brx;

    .line 351
    .line 352
    invoke-direct {v5}, Ll/brx;-><init>()V

    .line 353
    .line 354
    .line 355
    iget-object v7, v0, Lcom/immomo/momomediaext/MMLiveEngine;->j:Lcom/immomo/momomediaext/utils/MMLiveUserConfig;

    .line 356
    .line 357
    invoke-virtual {v7}, Lcom/immomo/momomediaext/utils/MMLiveUserConfig;->getAppid()Ljava/lang/String;

    .line 358
    .line 359
    .line 360
    move-result-object v7

    .line 361
    invoke-virtual {v5, v7}, Ll/brx;->o(Ljava/lang/String;)V

    .line 362
    .line 363
    .line 364
    iget-object v7, v0, Lcom/immomo/momomediaext/MMLiveEngine;->j:Lcom/immomo/momomediaext/utils/MMLiveUserConfig;

    .line 365
    .line 366
    invoke-virtual {v7}, Lcom/immomo/momomediaext/utils/MMLiveUserConfig;->getMomoid()Ljava/lang/String;

    .line 367
    .line 368
    .line 369
    move-result-object v7

    .line 370
    invoke-virtual {v5, v7}, Ll/brx;->u(Ljava/lang/String;)V

    .line 371
    .line 372
    .line 373
    iget-object v7, v0, Lcom/immomo/momomediaext/MMLiveEngine;->j:Lcom/immomo/momomediaext/utils/MMLiveUserConfig;

    .line 374
    .line 375
    invoke-virtual {v7}, Lcom/immomo/momomediaext/utils/MMLiveUserConfig;->getRoomid()Ljava/lang/String;

    .line 376
    .line 377
    .line 378
    move-result-object v7

    .line 379
    invoke-virtual {v5, v7}, Ll/brx;->s(Ljava/lang/String;)V

    .line 380
    .line 381
    .line 382
    iget-object v7, v0, Lcom/immomo/momomediaext/MMLiveEngine;->j:Lcom/immomo/momomediaext/utils/MMLiveUserConfig;

    .line 383
    .line 384
    invoke-virtual {v7}, Lcom/immomo/momomediaext/utils/MMLiveUserConfig;->getSecret()Ljava/lang/String;

    .line 385
    .line 386
    .line 387
    move-result-object v7

    .line 388
    invoke-virtual {v5, v7}, Ll/brx;->t(Ljava/lang/String;)V

    .line 389
    .line 390
    .line 391
    iget-object v7, v0, Lcom/immomo/momomediaext/MMLiveEngine;->j:Lcom/immomo/momomediaext/utils/MMLiveUserConfig;

    .line 392
    .line 393
    invoke-virtual {v7}, Lcom/immomo/momomediaext/utils/MMLiveUserConfig;->getAppVersion()Ljava/lang/String;

    .line 394
    .line 395
    .line 396
    move-result-object v7

    .line 397
    invoke-virtual {v5, v7}, Ll/brx;->n(Ljava/lang/String;)V

    .line 398
    .line 399
    .line 400
    iget-object v7, v0, Lcom/immomo/momomediaext/MMLiveEngine;->j:Lcom/immomo/momomediaext/utils/MMLiveUserConfig;

    .line 401
    .line 402
    invoke-virtual {v7}, Lcom/immomo/momomediaext/utils/MMLiveUserConfig;->getAppPatch()Ljava/lang/String;

    .line 403
    .line 404
    .line 405
    move-result-object v7

    .line 406
    invoke-virtual {v5, v7}, Ll/brx;->q(Ljava/lang/String;)V

    .line 407
    .line 408
    .line 409
    invoke-virtual {v6}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 410
    .line 411
    .line 412
    move-result-object v7

    .line 413
    invoke-static {v7, v5}, Ll/d410;->n(Landroid/content/Context;Ll/brx;)Lcom/momo/pub/MomoPipelineModuleRegister;

    .line 414
    .line 415
    .line 416
    move-result-object v5

    .line 417
    iput-object v5, v0, Lcom/immomo/momomediaext/MMLiveEngine;->m:Lcom/momo/pub/MomoPipelineModuleRegister;

    .line 418
    .line 419
    invoke-static {}, Ll/b7y;->c()Ll/b7y;

    .line 420
    .line 421
    .line 422
    move-result-object v5

    .line 423
    iget-object v7, v0, Lcom/immomo/momomediaext/MMLiveEngine;->j:Lcom/immomo/momomediaext/utils/MMLiveUserConfig;

    .line 424
    .line 425
    invoke-virtual {v7}, Lcom/immomo/momomediaext/utils/MMLiveUserConfig;->getAppid()Ljava/lang/String;

    .line 426
    .line 427
    .line 428
    move-result-object v7

    .line 429
    iget-object v8, v0, Lcom/immomo/momomediaext/MMLiveEngine;->j:Lcom/immomo/momomediaext/utils/MMLiveUserConfig;

    .line 430
    .line 431
    invoke-virtual {v8}, Lcom/immomo/momomediaext/utils/MMLiveUserConfig;->getSecret()Ljava/lang/String;

    .line 432
    .line 433
    .line 434
    move-result-object v8

    .line 435
    invoke-virtual {v5, v7, v8}, Ll/b7y;->o(Ljava/lang/String;Ljava/lang/String;)V

    .line 436
    .line 437
    .line 438
    invoke-static {}, Ll/b7y;->c()Ll/b7y;

    .line 439
    .line 440
    .line 441
    move-result-object v5

    .line 442
    invoke-static {}, Ll/arx;->d()Ll/arx;

    .line 443
    .line 444
    .line 445
    move-result-object v7

    .line 446
    iget-object v8, v0, Lcom/immomo/momomediaext/MMLiveEngine;->j:Lcom/immomo/momomediaext/utils/MMLiveUserConfig;

    .line 447
    .line 448
    invoke-virtual {v8}, Lcom/immomo/momomediaext/utils/MMLiveUserConfig;->getAppid()Ljava/lang/String;

    .line 449
    .line 450
    .line 451
    move-result-object v8

    .line 452
    invoke-virtual {v7, v8}, Ll/arx;->g(Ljava/lang/String;)Ljava/lang/String;

    .line 453
    .line 454
    .line 455
    move-result-object v7

    .line 456
    invoke-virtual {v5, v7}, Ll/b7y;->m(Ljava/lang/String;)V

    .line 457
    .line 458
    .line 459
    invoke-static {}, Ll/b7y;->c()Ll/b7y;

    .line 460
    .line 461
    .line 462
    move-result-object v5

    .line 463
    iget-object v7, v0, Lcom/immomo/momomediaext/MMLiveEngine;->j:Lcom/immomo/momomediaext/utils/MMLiveUserConfig;

    .line 464
    .line 465
    invoke-virtual {v7}, Lcom/immomo/momomediaext/utils/MMLiveUserConfig;->getMomoid()Ljava/lang/String;

    .line 466
    .line 467
    .line 468
    move-result-object v7

    .line 469
    invoke-virtual {v5, v7}, Ll/b7y;->n(Ljava/lang/String;)V

    .line 470
    .line 471
    .line 472
    invoke-static {}, Ll/b7y;->c()Ll/b7y;

    .line 473
    .line 474
    .line 475
    move-result-object v5

    .line 476
    iget-object v7, v0, Lcom/immomo/momomediaext/MMLiveEngine;->j:Lcom/immomo/momomediaext/utils/MMLiveUserConfig;

    .line 477
    .line 478
    invoke-virtual {v7}, Lcom/immomo/momomediaext/utils/MMLiveUserConfig;->getRoomid()Ljava/lang/String;

    .line 479
    .line 480
    .line 481
    move-result-object v7

    .line 482
    invoke-virtual {v5, v7}, Ll/b7y;->l(Ljava/lang/String;)V

    .line 483
    .line 484
    .line 485
    invoke-static {}, Ll/arx;->d()Ll/arx;

    .line 486
    .line 487
    .line 488
    move-result-object v5

    .line 489
    iget-object v7, v0, Lcom/immomo/momomediaext/MMLiveEngine;->j:Lcom/immomo/momomediaext/utils/MMLiveUserConfig;

    .line 490
    .line 491
    invoke-virtual {v7}, Lcom/immomo/momomediaext/utils/MMLiveUserConfig;->getAppid()Ljava/lang/String;

    .line 492
    .line 493
    .line 494
    move-result-object v7

    .line 495
    invoke-virtual {v5, v7}, Ll/arx;->h(Ljava/lang/String;)Ll/arx$d;

    .line 496
    .line 497
    .line 498
    move-result-object v5

    .line 499
    if-eqz v5, :cond_2

    .line 500
    .line 501
    iget-object v5, v5, Ll/arx$d;->e:Ll/bsx;

    .line 502
    .line 503
    if-eqz v5, :cond_2

    .line 504
    .line 505
    iget-object v7, v0, Lcom/immomo/momomediaext/MMLiveEngine;->l:Ll/ror;

    .line 506
    .line 507
    iget v5, v5, Ll/bsx;->X:I

    .line 508
    .line 509
    if-ne v5, v3, :cond_1

    .line 510
    .line 511
    move v2, v3

    .line 512
    :cond_1
    iput-boolean v2, v7, Ll/tow;->g0:Z

    .line 513
    .line 514
    :cond_2
    iget-object v2, v0, Lcom/immomo/momomediaext/MMLiveEngine;->m:Lcom/momo/pub/MomoPipelineModuleRegister;

    .line 515
    .line 516
    iget-object v5, v0, Lcom/immomo/momomediaext/MMLiveEngine;->l:Ll/ror;

    .line 517
    .line 518
    invoke-interface {v2, v5}, Lcom/momo/pub/MomoPipelineModuleRegister;->y(Ll/ror;)V

    .line 519
    .line 520
    .line 521
    invoke-static {}, Ll/arx;->d()Ll/arx;

    .line 522
    .line 523
    .line 524
    move-result-object v2

    .line 525
    invoke-static {}, Ll/y310;->a()Ljava/lang/String;

    .line 526
    .line 527
    .line 528
    move-result-object v5

    .line 529
    invoke-virtual {v2, v5}, Ll/arx;->o(Ljava/lang/String;)V

    .line 530
    .line 531
    .line 532
    new-instance v2, Lcom/immomo/momomediaext/MMLiveSource;

    .line 533
    .line 534
    iget-object v5, v0, Lcom/immomo/momomediaext/MMLiveEngine;->m:Lcom/momo/pub/MomoPipelineModuleRegister;

    .line 535
    .line 536
    invoke-virtual {v6}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 537
    .line 538
    .line 539
    move-result-object v6

    .line 540
    iget-object v7, v0, Lcom/immomo/momomediaext/MMLiveEngine;->j:Lcom/immomo/momomediaext/utils/MMLiveUserConfig;

    .line 541
    .line 542
    invoke-direct {v2, v5, v6, v7}, Lcom/immomo/momomediaext/MMLiveSource;-><init>(Lcom/momo/pub/MomoPipelineModuleRegister;Landroid/content/Context;Lcom/immomo/momomediaext/utils/MMLiveUserConfig;)V

    .line 543
    .line 544
    .line 545
    iput-object v2, v0, Lcom/immomo/momomediaext/MMLiveEngine;->n:Lcom/immomo/momomediaext/MMLiveSource;

    .line 546
    .line 547
    new-instance v5, Lcom/immomo/momomediaext/MMLiveEngine$k;

    .line 548
    .line 549
    invoke-direct {v5, v0}, Lcom/immomo/momomediaext/MMLiveEngine$k;-><init>(Lcom/immomo/momomediaext/MMLiveEngine;)V

    .line 550
    .line 551
    .line 552
    invoke-virtual {v2, v5}, Lcom/immomo/momomediaext/MMLiveSource;->P(Ll/aul;)V

    .line 553
    .line 554
    .line 555
    iget-object v2, v0, Lcom/immomo/momomediaext/MMLiveEngine;->n:Lcom/immomo/momomediaext/MMLiveSource;

    .line 556
    .line 557
    new-instance v5, Lcom/immomo/momomediaext/MMLiveEngine$l;

    .line 558
    .line 559
    invoke-direct {v5, v0}, Lcom/immomo/momomediaext/MMLiveEngine$l;-><init>(Lcom/immomo/momomediaext/MMLiveEngine;)V

    .line 560
    .line 561
    .line 562
    invoke-virtual {v2, v5}, Lcom/immomo/momomediaext/MMLiveSource;->I(Ll/ytl;)V

    .line 563
    .line 564
    .line 565
    invoke-static {}, Ll/csx;->R()Ll/csx;

    .line 566
    .line 567
    .line 568
    move-result-object v2

    .line 569
    invoke-virtual {v2, v3}, Ll/csx;->s1(Z)V

    .line 570
    .line 571
    .line 572
    iget-object v2, v0, Lcom/immomo/momomediaext/MMLiveEngine;->m:Lcom/momo/pub/MomoPipelineModuleRegister;

    .line 573
    .line 574
    iget-object v5, v0, Lcom/immomo/momomediaext/MMLiveEngine;->g0:Lcom/momo/pub/MomoPipelineModuleRegister$a;

    .line 575
    .line 576
    invoke-interface {v2, v5}, Lcom/momo/pub/MomoPipelineModuleRegister;->e(Lcom/momo/pub/MomoPipelineModuleRegister$a;)V

    .line 577
    .line 578
    .line 579
    iget-object v2, v0, Lcom/immomo/momomediaext/MMLiveEngine;->m:Lcom/momo/pub/MomoPipelineModuleRegister;

    .line 580
    .line 581
    iget-object v5, v0, Lcom/immomo/momomediaext/MMLiveEngine;->i0:Lcom/momo/pub/MomoPipelineModuleRegister$b;

    .line 582
    .line 583
    invoke-interface {v2, v5}, Lcom/momo/pub/MomoPipelineModuleRegister;->A(Lcom/momo/pub/MomoPipelineModuleRegister$b;)V

    .line 584
    .line 585
    .line 586
    iget-object v2, v0, Lcom/immomo/momomediaext/MMLiveEngine;->m:Lcom/momo/pub/MomoPipelineModuleRegister;

    .line 587
    .line 588
    iget-object v5, v0, Lcom/immomo/momomediaext/MMLiveEngine;->j0:Ll/h410$e;

    .line 589
    .line 590
    invoke-interface {v2, v5}, Lcom/momo/pub/MomoPipelineModuleRegister;->g(Ll/h410$e;)V

    .line 591
    .line 592
    .line 593
    iget-object v2, v0, Lcom/immomo/momomediaext/MMLiveEngine;->m:Lcom/momo/pub/MomoPipelineModuleRegister;

    .line 594
    .line 595
    iget-object v5, v0, Lcom/immomo/momomediaext/MMLiveEngine;->h0:Lcom/momo/pub/MomoPipelineModuleRegister$c;

    .line 596
    .line 597
    invoke-interface {v2, v5}, Lcom/momo/pub/MomoPipelineModuleRegister;->f(Lcom/momo/pub/MomoPipelineModuleRegister$c;)V

    .line 598
    .line 599
    .line 600
    iget-object v2, v0, Lcom/immomo/momomediaext/MMLiveEngine;->n:Lcom/immomo/momomediaext/MMLiveSource;

    .line 601
    .line 602
    iget-boolean v5, v0, Lcom/immomo/momomediaext/MMLiveEngine;->I:Z

    .line 603
    .line 604
    invoke-virtual {v2, v5}, Lcom/immomo/momomediaext/MMLiveSource;->B(Z)V

    .line 605
    .line 606
    .line 607
    iget-object v2, v0, Lcom/immomo/momomediaext/MMLiveEngine;->n:Lcom/immomo/momomediaext/MMLiveSource;

    .line 608
    .line 609
    iget-object v5, v0, Lcom/immomo/momomediaext/MMLiveEngine;->l0:Ll/yuf;

    .line 610
    .line 611
    invoke-virtual {v2, v5}, Lcom/immomo/momomediaext/MMLiveSource;->R(Ll/yuf;)V

    .line 612
    .line 613
    .line 614
    invoke-static {}, Ll/arx;->d()Ll/arx;

    .line 615
    .line 616
    .line 617
    move-result-object v2

    .line 618
    iget-object v5, v0, Lcom/immomo/momomediaext/MMLiveEngine;->j:Lcom/immomo/momomediaext/utils/MMLiveUserConfig;

    .line 619
    .line 620
    invoke-virtual {v5}, Lcom/immomo/momomediaext/utils/MMLiveUserConfig;->getAppid()Ljava/lang/String;

    .line 621
    .line 622
    .line 623
    move-result-object v5

    .line 624
    invoke-virtual {v2, v5}, Ll/arx;->h(Ljava/lang/String;)Ll/arx$d;

    .line 625
    .line 626
    .line 627
    move-result-object v2

    .line 628
    if-eqz v2, :cond_3

    .line 629
    .line 630
    iget-object v5, v2, Ll/arx$d;->e:Ll/bsx;

    .line 631
    .line 632
    if-eqz v5, :cond_3

    .line 633
    .line 634
    invoke-static {}, Ll/vnk0;->a()Ll/vnk0;

    .line 635
    .line 636
    .line 637
    move-result-object v5

    .line 638
    iget-object v6, v2, Ll/arx$d;->e:Ll/bsx;

    .line 639
    .line 640
    invoke-virtual {v5, v6}, Ll/vnk0;->e(Ll/bsx;)V

    .line 641
    .line 642
    .line 643
    :cond_3
    if-eqz v2, :cond_4

    .line 644
    .line 645
    new-instance v7, Ll/a320;

    .line 646
    .line 647
    iget-object v2, v0, Lcom/immomo/momomediaext/MMLiveEngine;->j:Lcom/immomo/momomediaext/utils/MMLiveUserConfig;

    .line 648
    .line 649
    invoke-virtual {v2}, Lcom/immomo/momomediaext/utils/MMLiveUserConfig;->getAppid()Ljava/lang/String;

    .line 650
    .line 651
    .line 652
    move-result-object v8

    .line 653
    iget-object v2, v0, Lcom/immomo/momomediaext/MMLiveEngine;->j:Lcom/immomo/momomediaext/utils/MMLiveUserConfig;

    .line 654
    .line 655
    invoke-virtual {v2}, Lcom/immomo/momomediaext/utils/MMLiveUserConfig;->getSecret()Ljava/lang/String;

    .line 656
    .line 657
    .line 658
    move-result-object v9

    .line 659
    iget-object v2, v0, Lcom/immomo/momomediaext/MMLiveEngine;->j:Lcom/immomo/momomediaext/utils/MMLiveUserConfig;

    .line 660
    .line 661
    invoke-virtual {v2}, Lcom/immomo/momomediaext/utils/MMLiveUserConfig;->getMomoid()Ljava/lang/String;

    .line 662
    .line 663
    .line 664
    move-result-object v10

    .line 665
    iget-object v2, v0, Lcom/immomo/momomediaext/MMLiveEngine;->j:Lcom/immomo/momomediaext/utils/MMLiveUserConfig;

    .line 666
    .line 667
    invoke-virtual {v2}, Lcom/immomo/momomediaext/utils/MMLiveUserConfig;->getRoomid()Ljava/lang/String;

    .line 668
    .line 669
    .line 670
    move-result-object v11

    .line 671
    invoke-static {}, Ll/arx;->d()Ll/arx;

    .line 672
    .line 673
    .line 674
    move-result-object v2

    .line 675
    iget-object v5, v0, Lcom/immomo/momomediaext/MMLiveEngine;->j:Lcom/immomo/momomediaext/utils/MMLiveUserConfig;

    .line 676
    .line 677
    invoke-virtual {v5}, Lcom/immomo/momomediaext/utils/MMLiveUserConfig;->getAppid()Ljava/lang/String;

    .line 678
    .line 679
    .line 680
    move-result-object v5

    .line 681
    invoke-virtual {v2, v5}, Ll/arx;->g(Ljava/lang/String;)Ljava/lang/String;

    .line 682
    .line 683
    .line 684
    move-result-object v14

    .line 685
    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    .line 686
    .line 687
    .line 688
    move-result v2

    .line 689
    invoke-static {v2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 690
    .line 691
    .line 692
    move-result-object v16

    .line 693
    const-string v17, ""

    .line 694
    .line 695
    const-string v12, ""

    .line 696
    .line 697
    const-string v13, ""

    .line 698
    .line 699
    const-string v15, ""

    .line 700
    .line 701
    invoke-direct/range {v7 .. v17}, Ll/a320;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 702
    .line 703
    .line 704
    iput-object v7, v0, Lcom/immomo/momomediaext/MMLiveEngine;->A:Ll/a320;

    .line 705
    .line 706
    goto :goto_1

    .line 707
    :cond_4
    invoke-static {}, Ll/b7y;->c()Ll/b7y;

    .line 708
    .line 709
    .line 710
    move-result-object v2

    .line 711
    const-string v5, "MMLiveEning constr userConfig1 == null, not create MyHttpMediaLogsUpload"

    .line 712
    .line 713
    filled-new-array {v5}, [Ljava/lang/Object;

    .line 714
    .line 715
    .line 716
    move-result-object v5

    .line 717
    invoke-virtual {v2, v5}, Ll/b7y;->g([Ljava/lang/Object;)V

    .line 718
    .line 719
    .line 720
    :goto_1
    iget-object v2, v0, Lcom/immomo/momomediaext/MMLiveEngine;->z:Ljava/util/Timer;

    .line 721
    .line 722
    if-nez v2, :cond_5

    .line 723
    .line 724
    new-instance v5, Ljava/util/Timer;

    .line 725
    .line 726
    invoke-direct {v5}, Ljava/util/Timer;-><init>()V

    .line 727
    .line 728
    .line 729
    iput-object v5, v0, Lcom/immomo/momomediaext/MMLiveEngine;->z:Ljava/util/Timer;

    .line 730
    .line 731
    new-instance v6, Lcom/immomo/momomediaext/MMLiveEngine$w;

    .line 732
    .line 733
    invoke-direct {v6, v0}, Lcom/immomo/momomediaext/MMLiveEngine$w;-><init>(Lcom/immomo/momomediaext/MMLiveEngine;)V

    .line 734
    .line 735
    .line 736
    const-wide/16 v7, 0xc8

    .line 737
    .line 738
    const-wide/16 v9, 0x2710

    .line 739
    .line 740
    invoke-virtual/range {v5 .. v10}, Ljava/util/Timer;->scheduleAtFixedRate(Ljava/util/TimerTask;JJ)V

    .line 741
    .line 742
    .line 743
    :cond_5
    invoke-static {}, Ll/csx;->R()Ll/csx;

    .line 744
    .line 745
    .line 746
    move-result-object v0

    .line 747
    invoke-virtual {v0, v3}, Ll/csx;->C1(I)V

    .line 748
    .line 749
    .line 750
    if-nez v1, :cond_6

    .line 751
    .line 752
    goto :goto_2

    .line 753
    :cond_6
    invoke-virtual {v1}, Lcom/immomo/momomediaext/utils/MMLiveUserConfig;->toString()Ljava/lang/String;

    .line 754
    .line 755
    .line 756
    move-result-object v4

    .line 757
    :goto_2
    const-string v0, "MMLiveEngine"

    .line 758
    .line 759
    filled-new-array {v0, v4}, [Ljava/lang/Object;

    .line 760
    .line 761
    .line 762
    move-result-object v0

    .line 763
    invoke-static {v0}, Lcom/immomo/momomediaext/MMLiveEngine;->M([Ljava/lang/Object;)V

    .line 764
    .line 765
    .line 766
    return-void
.end method

.method private E0(Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;Ljava/lang/String;)I
    .locals 4

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    const-string v0, ""

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    invoke-virtual {p1}, Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;->toString()Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    :goto_0
    const-string v1, "startPush"

    .line 11
    .line 12
    filled-new-array {v1, v0}, [Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-static {v0}, Lcom/immomo/momomediaext/MMLiveEngine;->M([Ljava/lang/Object;)V

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Lcom/immomo/momomediaext/MMLiveEngine;->o:Ll/gnw;

    .line 20
    .line 21
    if-eqz v0, :cond_1

    .line 22
    .line 23
    invoke-virtual {v0}, Ll/gnw;->n()V

    .line 24
    .line 25
    .line 26
    const/4 v0, 0x0

    .line 27
    iput-object v0, p0, Lcom/immomo/momomediaext/MMLiveEngine;->o:Ll/gnw;

    .line 28
    .line 29
    :cond_1
    iput-object p1, p0, Lcom/immomo/momomediaext/MMLiveEngine;->k:Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;

    .line 30
    .line 31
    new-instance v0, Ll/gnw;

    .line 32
    .line 33
    iget-object v1, p0, Lcom/immomo/momomediaext/MMLiveEngine;->m:Lcom/momo/pub/MomoPipelineModuleRegister;

    .line 34
    .line 35
    iget-object v2, p0, Lcom/immomo/momomediaext/MMLiveEngine;->j:Lcom/immomo/momomediaext/utils/MMLiveUserConfig;

    .line 36
    .line 37
    invoke-direct {v0, v1, v2}, Ll/gnw;-><init>(Lcom/momo/pub/MomoPipelineModuleRegister;Lcom/immomo/momomediaext/utils/MMLiveUserConfig;)V

    .line 38
    .line 39
    .line 40
    iput-object v0, p0, Lcom/immomo/momomediaext/MMLiveEngine;->o:Ll/gnw;

    .line 41
    .line 42
    iget-object v0, p0, Lcom/immomo/momomediaext/MMLiveEngine;->r:Lcom/immomo/momomediaext/utils/MMLiveRoomParams;

    .line 43
    .line 44
    if-nez v0, :cond_2

    .line 45
    .line 46
    new-instance v0, Lcom/immomo/momomediaext/utils/MMLiveRoomParams;

    .line 47
    .line 48
    invoke-direct {v0}, Lcom/immomo/momomediaext/utils/MMLiveRoomParams;-><init>()V

    .line 49
    .line 50
    .line 51
    iput-object v0, p0, Lcom/immomo/momomediaext/MMLiveEngine;->r:Lcom/immomo/momomediaext/utils/MMLiveRoomParams;

    .line 52
    .line 53
    :cond_2
    iget-object v0, p0, Lcom/immomo/momomediaext/MMLiveEngine;->r:Lcom/immomo/momomediaext/utils/MMLiveRoomParams;

    .line 54
    .line 55
    sget-object v1, Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;->MMLiveTypeConfNONE:Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;

    .line 56
    .line 57
    iput-object v1, v0, Lcom/immomo/momomediaext/utils/MMLiveRoomParams;->linkType:Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;

    .line 58
    .line 59
    iput-object v1, p0, Lcom/immomo/momomediaext/MMLiveEngine;->J:Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;

    .line 60
    .line 61
    const/4 v0, 0x0

    .line 62
    iput-boolean v0, p0, Lcom/immomo/momomediaext/MMLiveEngine;->V:Z

    .line 63
    .line 64
    iget-object v1, p0, Lcom/immomo/momomediaext/MMLiveEngine;->n:Lcom/immomo/momomediaext/MMLiveSource;

    .line 65
    .line 66
    iget-object v2, p0, Lcom/immomo/momomediaext/MMLiveEngine;->k:Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;

    .line 67
    .line 68
    iget v3, v2, Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;->encodeWidth:I

    .line 69
    .line 70
    iget v2, v2, Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;->encodeHeight:I

    .line 71
    .line 72
    invoke-virtual {v1, v3, v2}, Lcom/immomo/momomediaext/MMLiveSource;->O(II)V

    .line 73
    .line 74
    .line 75
    iget-object v1, p0, Lcom/immomo/momomediaext/MMLiveEngine;->p:Lcom/immomo/momomediaext/a;

    .line 76
    .line 77
    const/4 v2, 0x1

    .line 78
    if-eqz v1, :cond_3

    .line 79
    .line 80
    invoke-virtual {v1, v2}, Lcom/immomo/momomediaext/a;->x(Z)V

    .line 81
    .line 82
    .line 83
    :cond_3
    iget-object v1, p0, Lcom/immomo/momomediaext/MMLiveEngine;->t0:Ll/fpf0;

    .line 84
    .line 85
    if-eqz v1, :cond_4

    .line 86
    .line 87
    iget-object v3, p0, Lcom/immomo/momomediaext/MMLiveEngine;->o:Ll/gnw;

    .line 88
    .line 89
    invoke-virtual {v3, v1}, Ll/gnw;->i(Ll/fpf0;)V

    .line 90
    .line 91
    .line 92
    :cond_4
    iget-object v1, p0, Lcom/immomo/momomediaext/MMLiveEngine;->o:Ll/gnw;

    .line 93
    .line 94
    if-eqz v1, :cond_7

    .line 95
    .line 96
    iget-object v1, p0, Lcom/immomo/momomediaext/MMLiveEngine;->p:Lcom/immomo/momomediaext/a;

    .line 97
    .line 98
    if-eqz v1, :cond_5

    .line 99
    .line 100
    invoke-virtual {v1, v0}, Lcom/immomo/momomediaext/a;->j(Z)V

    .line 101
    .line 102
    .line 103
    :cond_5
    iget-boolean v1, p0, Lcom/immomo/momomediaext/MMLiveEngine;->t:Z

    .line 104
    .line 105
    invoke-virtual {p0, v1}, Lcom/immomo/momomediaext/MMLiveEngine;->i0(Z)V

    .line 106
    .line 107
    .line 108
    iget v1, p0, Lcom/immomo/momomediaext/MMLiveEngine;->K:I

    .line 109
    .line 110
    if-eqz v1, :cond_6

    .line 111
    .line 112
    iget-object v3, p0, Lcom/immomo/momomediaext/MMLiveEngine;->o:Ll/gnw;

    .line 113
    .line 114
    invoke-virtual {v3, v1}, Ll/gnw;->h(I)V

    .line 115
    .line 116
    .line 117
    :cond_6
    iget-object v1, p0, Lcom/immomo/momomediaext/MMLiveEngine;->o:Ll/gnw;

    .line 118
    .line 119
    iget-object v3, p0, Lcom/immomo/momomediaext/MMLiveEngine;->q0:Ll/fb1;

    .line 120
    .line 121
    invoke-virtual {v1, v3}, Ll/gnw;->k(Ll/fb1;)V

    .line 122
    .line 123
    .line 124
    invoke-direct {p0, p1}, Lcom/immomo/momomediaext/MMLiveEngine;->u(Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;)V

    .line 125
    .line 126
    .line 127
    iget-object v1, p0, Lcom/immomo/momomediaext/MMLiveEngine;->o:Ll/gnw;

    .line 128
    .line 129
    invoke-virtual {v1, p1, p2}, Ll/gnw;->l(Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;Ljava/lang/String;)V

    .line 130
    .line 131
    .line 132
    iget-object p1, p0, Lcom/immomo/momomediaext/MMLiveEngine;->n:Lcom/immomo/momomediaext/MMLiveSource;

    .line 133
    .line 134
    invoke-virtual {p1}, Lcom/immomo/momomediaext/MMLiveSource;->u()Lcom/momo/piplinemomoext/input/audio/a;

    .line 135
    .line 136
    .line 137
    move-result-object p1

    .line 138
    invoke-interface {p1, v0}, Lcom/momo/piplinemomoext/input/audio/a;->l(I)V

    .line 139
    .line 140
    .line 141
    iget-object p1, p0, Lcom/immomo/momomediaext/MMLiveEngine;->o:Ll/gnw;

    .line 142
    .line 143
    iget-object p2, p0, Lcom/immomo/momomediaext/MMLiveEngine;->a0:Lcom/immomo/mediacore/coninf/MRtcAudioHandler;

    .line 144
    .line 145
    invoke-virtual {p1, p2}, Ll/gnw;->a(Lcom/immomo/mediacore/coninf/MRtcAudioHandler;)V

    .line 146
    .line 147
    .line 148
    :cond_7
    iget-boolean p1, p0, Lcom/immomo/momomediaext/MMLiveEngine;->u:Z

    .line 149
    .line 150
    if-eqz p1, :cond_8

    .line 151
    .line 152
    invoke-virtual {p0, v2}, Lcom/immomo/momomediaext/MMLiveEngine;->x0(Z)V

    .line 153
    .line 154
    .line 155
    :cond_8
    return v0
.end method

.method private H()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/immomo/momomediaext/MMLiveEngine;->r:Lcom/immomo/momomediaext/utils/MMLiveRoomParams;

    .line 2
    .line 3
    if-eqz v0, :cond_2

    .line 4
    .line 5
    iget-object v0, v0, Lcom/immomo/momomediaext/utils/MMLiveRoomParams;->renderViewType:Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMRenderViewType;

    .line 6
    .line 7
    sget-object v1, Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMRenderViewType;->SurfaceViewOut:Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMRenderViewType;

    .line 8
    .line 9
    if-ne v0, v1, :cond_0

    .line 10
    .line 11
    new-instance v0, Lcom/immomo/momomediaext/MMLiveEngine$a;

    .line 12
    .line 13
    invoke-direct {v0, p0}, Lcom/immomo/momomediaext/MMLiveEngine$a;-><init>(Lcom/immomo/momomediaext/MMLiveEngine;)V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Lcom/immomo/momomediaext/MMLiveEngine;->o0:Ll/ebl0;

    .line 17
    .line 18
    return-void

    .line 19
    :cond_0
    sget-object v1, Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMRenderViewType;->TextureViewOut:Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMRenderViewType;

    .line 20
    .line 21
    if-ne v0, v1, :cond_1

    .line 22
    .line 23
    new-instance v0, Lcom/immomo/momomediaext/MMLiveEngine$b;

    .line 24
    .line 25
    invoke-direct {v0, p0}, Lcom/immomo/momomediaext/MMLiveEngine$b;-><init>(Lcom/immomo/momomediaext/MMLiveEngine;)V

    .line 26
    .line 27
    .line 28
    iput-object v0, p0, Lcom/immomo/momomediaext/MMLiveEngine;->p0:Ll/gbl0;

    .line 29
    .line 30
    return-void

    .line 31
    :cond_1
    sget-object v1, Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMRenderViewType;->SurfaceTextureOut:Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMRenderViewType;

    .line 32
    .line 33
    if-ne v0, v1, :cond_2

    .line 34
    .line 35
    new-instance v0, Lcom/immomo/momomediaext/MMLiveEngine$c;

    .line 36
    .line 37
    invoke-direct {v0, p0}, Lcom/immomo/momomediaext/MMLiveEngine$c;-><init>(Lcom/immomo/momomediaext/MMLiveEngine;)V

    .line 38
    .line 39
    .line 40
    iput-object v0, p0, Lcom/immomo/momomediaext/MMLiveEngine;->n0:Ll/gkl0;

    .line 41
    .line 42
    :cond_2
    return-void
.end method

.method private I()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/momomediaext/MMLiveEngine;->p:Lcom/immomo/momomediaext/a;

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

.method private J()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/momomediaext/MMLiveEngine;->o:Ll/gnw;

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

.method private L0(III)I
    .locals 1

    .line 1
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 6
    .line 7
    .line 8
    move-result-object p3

    .line 9
    const-string v0, "transWhatCode"

    .line 10
    .line 11
    filled-new-array {v0, p0, p3}, [Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-static {p0}, Lcom/immomo/momomediaext/MMLiveEngine;->M([Ljava/lang/Object;)V

    .line 16
    .line 17
    .line 18
    const/16 p0, 0x5100

    .line 19
    .line 20
    if-ne p0, p1, :cond_1

    .line 21
    .line 22
    if-nez p2, :cond_0

    .line 23
    .line 24
    const/4 p0, 0x5

    .line 25
    return p0

    .line 26
    :cond_0
    const/4 p0, 0x4

    .line 27
    return p0

    .line 28
    :cond_1
    const/16 p0, 0x1100

    .line 29
    .line 30
    if-eq p0, p1, :cond_8

    .line 31
    .line 32
    if-eq p0, p1, :cond_8

    .line 33
    .line 34
    const/16 p0, 0x1101

    .line 35
    .line 36
    if-eq p0, p1, :cond_8

    .line 37
    .line 38
    if-eq p0, p1, :cond_8

    .line 39
    .line 40
    const/16 p0, 0x2100

    .line 41
    .line 42
    if-eq p0, p1, :cond_8

    .line 43
    .line 44
    const/16 p0, 0x2101

    .line 45
    .line 46
    if-ne p0, p1, :cond_2

    .line 47
    .line 48
    goto :goto_1

    .line 49
    :cond_2
    and-int/lit16 p0, p1, 0x101

    .line 50
    .line 51
    const/16 p3, 0x101

    .line 52
    .line 53
    if-ne p0, p3, :cond_7

    .line 54
    .line 55
    const/16 p0, 0x3101

    .line 56
    .line 57
    const/4 p3, 0x1

    .line 58
    if-ne p1, p0, :cond_6

    .line 59
    .line 60
    const/16 p0, 0xb

    .line 61
    .line 62
    if-eq p2, p3, :cond_5

    .line 63
    .line 64
    if-ne p2, p0, :cond_3

    .line 65
    .line 66
    goto :goto_0

    .line 67
    :cond_3
    const/16 p0, 0xc

    .line 68
    .line 69
    if-eq p2, p0, :cond_5

    .line 70
    .line 71
    const/16 p1, 0xd

    .line 72
    .line 73
    if-ne p2, p1, :cond_4

    .line 74
    .line 75
    goto :goto_0

    .line 76
    :cond_4
    const/16 p0, 0xe

    .line 77
    .line 78
    if-ne p2, p0, :cond_6

    .line 79
    .line 80
    :cond_5
    :goto_0
    return p0

    .line 81
    :cond_6
    return p3

    .line 82
    :cond_7
    return p1

    .line 83
    :cond_8
    :goto_1
    const/16 p0, 0xa

    .line 84
    .line 85
    if-ne p2, p0, :cond_9

    .line 86
    .line 87
    const/16 p0, 0x32c

    .line 88
    .line 89
    return p0

    .line 90
    :cond_9
    return p2
.end method

.method private static varargs M([Ljava/lang/Object;)V
    .locals 4

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance v1, Ljava/text/SimpleDateFormat;

    .line 7
    .line 8
    const-string v2, "HH:mm:ss.SSS"

    .line 9
    .line 10
    sget-object v3, Ljava/util/Locale;->CHINA:Ljava/util/Locale;

    .line 11
    .line 12
    invoke-direct {v1, v2, v3}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    .line 13
    .line 14
    .line 15
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 16
    .line 17
    .line 18
    move-result-wide v2

    .line 19
    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 20
    .line 21
    .line 22
    move-result-object v2

    .line 23
    invoke-virtual {v1, v2}, Ljava/text/Format;->format(Ljava/lang/Object;)Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    new-instance v2, Ljava/lang/StringBuilder;

    .line 28
    .line 29
    const-string v3, "{"

    .line 30
    .line 31
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 35
    .line 36
    .line 37
    const-string v1, ","

    .line 38
    .line 39
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 40
    .line 41
    .line 42
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 47
    .line 48
    .line 49
    if-eqz p0, :cond_1

    .line 50
    .line 51
    const/4 v1, 0x0

    .line 52
    :goto_0
    array-length v2, p0

    .line 53
    if-ge v1, v2, :cond_1

    .line 54
    .line 55
    if-eqz v1, :cond_0

    .line 56
    .line 57
    const-string v2, ","

    .line 58
    .line 59
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 60
    .line 61
    .line 62
    :cond_0
    aget-object v2, p0, v1

    .line 63
    .line 64
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 65
    .line 66
    .line 67
    add-int/lit8 v1, v1, 0x1

    .line 68
    .line 69
    goto :goto_0

    .line 70
    :cond_1
    const-string p0, "}"

    .line 71
    .line 72
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 73
    .line 74
    .line 75
    sget-object p0, Lcom/immomo/momomediaext/MMLiveEngine;->v0:Ljava/util/ArrayList;

    .line 76
    .line 77
    monitor-enter p0

    .line 78
    :try_start_0
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    .line 79
    .line 80
    .line 81
    move-result v1

    .line 82
    const/16 v2, 0x12c

    .line 83
    .line 84
    if-ge v1, v2, :cond_2

    .line 85
    .line 86
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 87
    .line 88
    .line 89
    move-result-object v0

    .line 90
    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 91
    .line 92
    .line 93
    goto :goto_1

    .line 94
    :catchall_0
    move-exception v0

    .line 95
    goto :goto_2

    .line 96
    :cond_2
    :goto_1
    monitor-exit p0

    .line 97
    return-void

    .line 98
    :goto_2
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 99
    throw v0
.end method

.method public static synthetic a(Lcom/immomo/momomediaext/MMLiveEngine;)Landroid/os/Handler;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/momomediaext/MMLiveEngine;->q:Landroid/os/Handler;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic b([Ljava/lang/Object;)V
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/immomo/momomediaext/MMLiveEngine;->M([Ljava/lang/Object;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic c(Lcom/immomo/momomediaext/MMLiveEngine;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/momomediaext/MMLiveEngine;->N:Ljava/lang/Object;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic d(Lcom/immomo/momomediaext/MMLiveEngine;)Lcom/momo/pub/MomoPipelineModuleRegister;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/momomediaext/MMLiveEngine;->m:Lcom/momo/pub/MomoPipelineModuleRegister;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic e(Lcom/immomo/momomediaext/MMLiveEngine;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/immomo/momomediaext/MMLiveEngine;->u:Z

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic f(Lcom/immomo/momomediaext/MMLiveEngine;)Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/momomediaext/MMLiveEngine;->J:Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic g(Lcom/immomo/momomediaext/MMLiveEngine;)Lcom/immomo/momomediaext/utils/MMLiveUserConfig;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/momomediaext/MMLiveEngine;->j:Lcom/immomo/momomediaext/utils/MMLiveUserConfig;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic h(Lcom/immomo/momomediaext/MMLiveEngine;)Lcom/immomo/momomediaext/utils/MMLiveRoomParams;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/momomediaext/MMLiveEngine;->r:Lcom/immomo/momomediaext/utils/MMLiveRoomParams;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic i(Lcom/immomo/momomediaext/MMLiveEngine;)Ll/enw;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/momomediaext/MMLiveEngine;->s:Ll/enw;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic j(Lcom/immomo/momomediaext/MMLiveEngine;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/immomo/momomediaext/MMLiveEngine;->x()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic k(Lcom/immomo/momomediaext/MMLiveEngine;)Ll/gnw;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/momomediaext/MMLiveEngine;->o:Ll/gnw;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic l(Lcom/immomo/momomediaext/MMLiveEngine;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/immomo/momomediaext/MMLiveEngine;->V:Z

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic m(Lcom/immomo/momomediaext/MMLiveEngine;Z)Z
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/immomo/momomediaext/MMLiveEngine;->V:Z

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic n(Lcom/immomo/momomediaext/MMLiveEngine;III)I
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Lcom/immomo/momomediaext/MMLiveEngine;->L0(III)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public static synthetic o(Lcom/immomo/momomediaext/MMLiveEngine;)Lcom/immomo/momomediaext/a;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/momomediaext/MMLiveEngine;->p:Lcom/immomo/momomediaext/a;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic p(Lcom/immomo/momomediaext/MMLiveEngine;Lcom/immomo/momomediaext/a;)Lcom/immomo/momomediaext/a;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/momomediaext/MMLiveEngine;->p:Lcom/immomo/momomediaext/a;

    .line 2
    .line 3
    return-object p1
.end method

.method public static synthetic q(Lcom/immomo/momomediaext/MMLiveEngine;)Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/momomediaext/MMLiveEngine;->k:Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;

    .line 2
    .line 3
    return-object p0
.end method

.method private u(Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/immomo/momomediaext/MMLiveEngine;->M:Lcom/immomo/momomediaext/utils/MMLiveVideoEncoderConfig;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    iget v0, p1, Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;->encodeWidth:I

    .line 6
    .line 7
    iput v0, p0, Lcom/immomo/momomediaext/utils/MMLiveVideoEncoderConfig;->encodeWidth:I

    .line 8
    .line 9
    iget v0, p1, Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;->encodeHeight:I

    .line 10
    .line 11
    iput v0, p0, Lcom/immomo/momomediaext/utils/MMLiveVideoEncoderConfig;->encodeHeight:I

    .line 12
    .line 13
    iget v0, p1, Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;->videoBitRate:I

    .line 14
    .line 15
    iput v0, p0, Lcom/immomo/momomediaext/utils/MMLiveVideoEncoderConfig;->videoBitRate:I

    .line 16
    .line 17
    iget p1, p1, Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;->videoFPS:I

    .line 18
    .line 19
    iput p1, p0, Lcom/immomo/momomediaext/utils/MMLiveVideoEncoderConfig;->videoFPS:I

    .line 20
    .line 21
    :cond_0
    return-void
.end method

.method private x()V
    .locals 6

    .line 1
    const-string v0, "MMLiveEngine"

    .line 2
    .line 3
    const-string v1, "flushMediaLogs"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/esx;->d(Ljava/lang/String;Ljava/lang/Object;)I

    .line 6
    .line 7
    .line 8
    sget-object v0, Lcom/immomo/momomediaext/MMLiveEngine;->v0:Ljava/util/ArrayList;

    .line 9
    .line 10
    monitor-enter v0

    .line 11
    :try_start_0
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    if-lez v1, :cond_1

    .line 16
    .line 17
    new-instance v1, Ljava/lang/StringBuilder;

    .line 18
    .line 19
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 20
    .line 21
    .line 22
    const/4 v2, 0x0

    .line 23
    :goto_0
    sget-object v3, Lcom/immomo/momomediaext/MMLiveEngine;->v0:Ljava/util/ArrayList;

    .line 24
    .line 25
    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    .line 26
    .line 27
    .line 28
    move-result v4

    .line 29
    if-ge v2, v4, :cond_0

    .line 30
    .line 31
    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    move-result-object v3

    .line 35
    check-cast v3, Ljava/lang/String;

    .line 36
    .line 37
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 38
    .line 39
    .line 40
    add-int/lit8 v2, v2, 0x1

    .line 41
    .line 42
    goto :goto_0

    .line 43
    :catchall_0
    move-exception p0

    .line 44
    goto :goto_4

    .line 45
    :cond_0
    invoke-virtual {v3}, Ljava/util/ArrayList;->clear()V

    .line 46
    .line 47
    .line 48
    goto :goto_1

    .line 49
    :cond_1
    const/4 v1, 0x0

    .line 50
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 51
    monitor-enter p0

    .line 52
    if-eqz v1, :cond_2

    .line 53
    .line 54
    :try_start_1
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->length()I

    .line 55
    .line 56
    .line 57
    move-result v0

    .line 58
    if-lez v0, :cond_2

    .line 59
    .line 60
    iget-object v0, p0, Lcom/immomo/momomediaext/MMLiveEngine;->A:Ll/a320;

    .line 61
    .line 62
    if-eqz v0, :cond_2

    .line 63
    .line 64
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 65
    .line 66
    .line 67
    move-result-wide v2

    .line 68
    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    const-string v2, "traceLog"

    .line 73
    .line 74
    new-instance v3, Ljava/lang/StringBuilder;

    .line 75
    .line 76
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 77
    .line 78
    .line 79
    const-string v4, "["

    .line 80
    .line 81
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 82
    .line 83
    .line 84
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 85
    .line 86
    .line 87
    move-result-object v1

    .line 88
    const-string v4, "]"

    .line 89
    .line 90
    const-string v5, ")"

    .line 91
    .line 92
    invoke-virtual {v1, v4, v5}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    .line 93
    .line 94
    .line 95
    move-result-object v1

    .line 96
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 97
    .line 98
    .line 99
    const-string v1, "]"

    .line 100
    .line 101
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 102
    .line 103
    .line 104
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 105
    .line 106
    .line 107
    move-result-object v1

    .line 108
    filled-new-array {v0, v2, v1}, [Ljava/lang/Object;

    .line 109
    .line 110
    .line 111
    move-result-object v0

    .line 112
    invoke-static {v0}, Ll/fvx;->w([Ljava/lang/Object;)Ljava/lang/String;

    .line 113
    .line 114
    .line 115
    move-result-object v0

    .line 116
    iget-object v1, p0, Lcom/immomo/momomediaext/MMLiveEngine;->A:Ll/a320;

    .line 117
    .line 118
    const-string v2, "nonConf"

    .line 119
    .line 120
    const-string v3, "v2.mediaLogs"

    .line 121
    .line 122
    invoke-virtual {v1, v2, v3, v0}, Ll/a320;->a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 123
    .line 124
    .line 125
    goto :goto_2

    .line 126
    :catchall_1
    move-exception v0

    .line 127
    goto :goto_3

    .line 128
    :cond_2
    :goto_2
    monitor-exit p0

    .line 129
    return-void

    .line 130
    :goto_3
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 131
    throw v0

    .line 132
    :goto_4
    :try_start_2
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 133
    throw p0
.end method


# virtual methods
.method public A()Ll/zmw;
    .locals 2
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/immomo/momomediaext/MMLiveEngine;->Q:Ll/zmw;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Lcom/immomo/momomediaext/MMLiveEngine;->n:Lcom/immomo/momomediaext/MMLiveSource;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {v0}, Lcom/immomo/momomediaext/MMLiveSource;->s()Ll/fql;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    iget-object v0, p0, Lcom/immomo/momomediaext/MMLiveEngine;->Q:Ll/zmw;

    .line 16
    .line 17
    iget-object v1, p0, Lcom/immomo/momomediaext/MMLiveEngine;->n:Lcom/immomo/momomediaext/MMLiveSource;

    .line 18
    .line 19
    invoke-virtual {v1}, Lcom/immomo/momomediaext/MMLiveSource;->s()Ll/fql;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-interface {v1}, Ll/fql;->c()I

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    invoke-virtual {v0, v1}, Ll/zmw;->K(I)Ll/zmw;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    iget-object v1, p0, Lcom/immomo/momomediaext/MMLiveEngine;->n:Lcom/immomo/momomediaext/MMLiveSource;

    .line 32
    .line 33
    invoke-virtual {v1}, Lcom/immomo/momomediaext/MMLiveSource;->s()Ll/fql;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    invoke-interface {v1}, Ll/fql;->d()I

    .line 38
    .line 39
    .line 40
    move-result v1

    .line 41
    invoke-virtual {v0, v1}, Ll/zmw;->A(I)Ll/zmw;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    iget-object v1, p0, Lcom/immomo/momomediaext/MMLiveEngine;->n:Lcom/immomo/momomediaext/MMLiveSource;

    .line 46
    .line 47
    invoke-virtual {v1}, Lcom/immomo/momomediaext/MMLiveSource;->s()Ll/fql;

    .line 48
    .line 49
    .line 50
    move-result-object v1

    .line 51
    invoke-interface {v1}, Ll/fql;->h()I

    .line 52
    .line 53
    .line 54
    move-result v1

    .line 55
    invoke-virtual {v0, v1}, Ll/zmw;->J(I)Ll/zmw;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    iget-object v1, p0, Lcom/immomo/momomediaext/MMLiveEngine;->n:Lcom/immomo/momomediaext/MMLiveSource;

    .line 60
    .line 61
    invoke-virtual {v1}, Lcom/immomo/momomediaext/MMLiveSource;->s()Ll/fql;

    .line 62
    .line 63
    .line 64
    move-result-object v1

    .line 65
    invoke-interface {v1}, Ll/fql;->g()I

    .line 66
    .line 67
    .line 68
    move-result v1

    .line 69
    invoke-virtual {v0, v1}, Ll/zmw;->L(I)Ll/zmw;

    .line 70
    .line 71
    .line 72
    :cond_0
    iget-object p0, p0, Lcom/immomo/momomediaext/MMLiveEngine;->Q:Ll/zmw;

    .line 73
    .line 74
    invoke-static {p0}, Ll/ww5;->b(Ll/zmw;)Ll/zmw;

    .line 75
    .line 76
    .line 77
    move-result-object p0

    .line 78
    return-object p0
.end method

.method public A0(Ljava/lang/String;)V
    .locals 2

    .line 1
    iput-object p1, p0, Lcom/immomo/momomediaext/MMLiveEngine;->D:Ljava/lang/String;

    .line 2
    .line 3
    new-instance v0, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    const-string v1, "setVideoMixerBackgroundImgUrl url:"

    .line 6
    .line 7
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-static {v0}, Lcom/immomo/momomediaext/MMLiveEngine;->M([Ljava/lang/Object;)V

    .line 22
    .line 23
    .line 24
    iget-object p0, p0, Lcom/immomo/momomediaext/MMLiveEngine;->p:Lcom/immomo/momomediaext/a;

    .line 25
    .line 26
    if-eqz p0, :cond_0

    .line 27
    .line 28
    invoke-virtual {p0, p1}, Lcom/immomo/momomediaext/a;->Y(Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    :cond_0
    return-void
.end method

.method public B()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/immomo/momomediaext/MMLiveEngine;->d:F

    .line 2
    .line 3
    return p0
.end method

.method public B0(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/momomediaext/MMLiveEngine;->n:Lcom/immomo/momomediaext/MMLiveSource;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/immomo/momomediaext/MMLiveSource;->a0(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public C()Ll/mob0;
    .locals 2

    .line 1
    invoke-direct {p0}, Lcom/immomo/momomediaext/MMLiveEngine;->I()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Lcom/immomo/momomediaext/MMLiveEngine;->p:Lcom/immomo/momomediaext/a;

    .line 8
    .line 9
    invoke-virtual {v0}, Lcom/immomo/momomediaext/a;->o()Ll/mob0;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    goto :goto_0

    .line 14
    :cond_0
    const/4 v0, 0x0

    .line 15
    :goto_0
    invoke-direct {p0}, Lcom/immomo/momomediaext/MMLiveEngine;->J()Z

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    if-eqz v1, :cond_1

    .line 20
    .line 21
    iget-object p0, p0, Lcom/immomo/momomediaext/MMLiveEngine;->o:Ll/gnw;

    .line 22
    .line 23
    invoke-virtual {p0}, Ll/gnw;->d()Ll/mob0;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    return-object p0

    .line 28
    :cond_1
    return-object v0
.end method

.method public C0(Ll/zmw;)V
    .locals 4

    .line 1
    const-string v0, "startCamera"

    .line 2
    .line 3
    if-nez p1, :cond_0

    .line 4
    .line 5
    const-string p0, "MMLiveCameraConfiguration is NULL"

    .line 6
    .line 7
    filled-new-array {v0, p0}, [Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-static {p0}, Lcom/immomo/momomediaext/MMLiveEngine;->M([Ljava/lang/Object;)V

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    iget-object v1, p0, Lcom/immomo/momomediaext/MMLiveEngine;->n:Lcom/immomo/momomediaext/MMLiveSource;

    .line 16
    .line 17
    if-eqz v1, :cond_1

    .line 18
    .line 19
    invoke-virtual {v1}, Lcom/immomo/momomediaext/MMLiveSource;->w()Z

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    if-eqz v1, :cond_1

    .line 24
    .line 25
    const-string v1, "camera is already start"

    .line 26
    .line 27
    filled-new-array {v0, v1}, [Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    invoke-static {v0}, Lcom/immomo/momomediaext/MMLiveEngine;->M([Ljava/lang/Object;)V

    .line 32
    .line 33
    .line 34
    iget-object v0, p0, Lcom/immomo/momomediaext/MMLiveEngine;->m:Lcom/momo/pub/MomoPipelineModuleRegister;

    .line 35
    .line 36
    invoke-interface {v0}, Lcom/momo/pub/MomoPipelineModuleRegister;->getParameters()Ll/ror;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    iget-object v1, p0, Lcom/immomo/momomediaext/MMLiveEngine;->n:Lcom/immomo/momomediaext/MMLiveSource;

    .line 41
    .line 42
    iget v2, v0, Ll/tow;->m:I

    .line 43
    .line 44
    iget v0, v0, Ll/tow;->n:I

    .line 45
    .line 46
    invoke-virtual {v1, v2, v0}, Lcom/immomo/momomediaext/MMLiveSource;->O(II)V

    .line 47
    .line 48
    .line 49
    iget-object p0, p0, Lcom/immomo/momomediaext/MMLiveEngine;->n:Lcom/immomo/momomediaext/MMLiveSource;

    .line 50
    .line 51
    invoke-virtual {p1}, Ll/zmw;->d()I

    .line 52
    .line 53
    .line 54
    move-result v0

    .line 55
    invoke-virtual {p1}, Ll/zmw;->q()Ljava/lang/Object;

    .line 56
    .line 57
    .line 58
    move-result-object p1

    .line 59
    invoke-virtual {p0, v0, p1}, Lcom/immomo/momomediaext/MMLiveSource;->b0(ILjava/lang/Object;)I

    .line 60
    .line 61
    .line 62
    return-void

    .line 63
    :cond_1
    new-instance v1, Ljava/lang/StringBuilder;

    .line 64
    .line 65
    const-string v2, "cameraID: "

    .line 66
    .line 67
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 68
    .line 69
    .line 70
    invoke-virtual {p1}, Ll/zmw;->d()I

    .line 71
    .line 72
    .line 73
    move-result v2

    .line 74
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 75
    .line 76
    .line 77
    const-string v2, " cameraWidth: "

    .line 78
    .line 79
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 80
    .line 81
    .line 82
    invoke-virtual {p1}, Ll/zmw;->e()I

    .line 83
    .line 84
    .line 85
    move-result v2

    .line 86
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 87
    .line 88
    .line 89
    const-string v2, " cameraHeight: "

    .line 90
    .line 91
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 92
    .line 93
    .line 94
    invoke-virtual {p1}, Ll/zmw;->c()I

    .line 95
    .line 96
    .line 97
    move-result v2

    .line 98
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 99
    .line 100
    .line 101
    const-string v2, " cameraFPS: "

    .line 102
    .line 103
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 104
    .line 105
    .line 106
    invoke-virtual {p1}, Ll/zmw;->b()I

    .line 107
    .line 108
    .line 109
    move-result v2

    .line 110
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 111
    .line 112
    .line 113
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 114
    .line 115
    .line 116
    move-result-object v1

    .line 117
    filled-new-array {v0, v1}, [Ljava/lang/Object;

    .line 118
    .line 119
    .line 120
    move-result-object v0

    .line 121
    invoke-static {v0}, Lcom/immomo/momomediaext/MMLiveEngine;->M([Ljava/lang/Object;)V

    .line 122
    .line 123
    .line 124
    iget-object v0, p0, Lcom/immomo/momomediaext/MMLiveEngine;->l:Ll/ror;

    .line 125
    .line 126
    if-eqz v0, :cond_2

    .line 127
    .line 128
    invoke-virtual {p1}, Ll/zmw;->e()I

    .line 129
    .line 130
    .line 131
    move-result v1

    .line 132
    iput v1, v0, Ll/tow;->w:I

    .line 133
    .line 134
    iget-object v0, p0, Lcom/immomo/momomediaext/MMLiveEngine;->l:Ll/ror;

    .line 135
    .line 136
    invoke-virtual {p1}, Ll/zmw;->c()I

    .line 137
    .line 138
    .line 139
    move-result v1

    .line 140
    iput v1, v0, Ll/tow;->x:I

    .line 141
    .line 142
    :cond_2
    iget-object v0, p0, Lcom/immomo/momomediaext/MMLiveEngine;->n:Lcom/immomo/momomediaext/MMLiveSource;

    .line 143
    .line 144
    if-eqz v0, :cond_3

    .line 145
    .line 146
    iget-object v0, p0, Lcom/immomo/momomediaext/MMLiveEngine;->m:Lcom/momo/pub/MomoPipelineModuleRegister;

    .line 147
    .line 148
    invoke-interface {v0}, Lcom/momo/pub/MomoPipelineModuleRegister;->getParameters()Ll/ror;

    .line 149
    .line 150
    .line 151
    move-result-object v0

    .line 152
    iget-object v1, p0, Lcom/immomo/momomediaext/MMLiveEngine;->n:Lcom/immomo/momomediaext/MMLiveSource;

    .line 153
    .line 154
    invoke-virtual {p1}, Ll/zmw;->e()I

    .line 155
    .line 156
    .line 157
    move-result v2

    .line 158
    invoke-virtual {p1}, Ll/zmw;->c()I

    .line 159
    .line 160
    .line 161
    move-result v3

    .line 162
    invoke-virtual {v1, v2, v3}, Lcom/immomo/momomediaext/MMLiveSource;->N(II)V

    .line 163
    .line 164
    .line 165
    iget-object v1, p0, Lcom/immomo/momomediaext/MMLiveEngine;->n:Lcom/immomo/momomediaext/MMLiveSource;

    .line 166
    .line 167
    iget v2, v0, Ll/tow;->m:I

    .line 168
    .line 169
    iget v0, v0, Ll/tow;->n:I

    .line 170
    .line 171
    invoke-virtual {v1, v2, v0}, Lcom/immomo/momomediaext/MMLiveSource;->O(II)V

    .line 172
    .line 173
    .line 174
    iget-object v0, p0, Lcom/immomo/momomediaext/MMLiveEngine;->n:Lcom/immomo/momomediaext/MMLiveSource;

    .line 175
    .line 176
    invoke-virtual {p1}, Ll/zmw;->b()I

    .line 177
    .line 178
    .line 179
    move-result v1

    .line 180
    invoke-virtual {v0, v1}, Lcom/immomo/momomediaext/MMLiveSource;->L(I)V

    .line 181
    .line 182
    .line 183
    iget-object v0, p0, Lcom/immomo/momomediaext/MMLiveEngine;->n:Lcom/immomo/momomediaext/MMLiveSource;

    .line 184
    .line 185
    invoke-virtual {p1}, Ll/zmw;->d()I

    .line 186
    .line 187
    .line 188
    move-result v1

    .line 189
    invoke-virtual {p1}, Ll/zmw;->q()Ljava/lang/Object;

    .line 190
    .line 191
    .line 192
    move-result-object v2

    .line 193
    invoke-virtual {v0, v1, v2}, Lcom/immomo/momomediaext/MMLiveSource;->b0(ILjava/lang/Object;)I

    .line 194
    .line 195
    .line 196
    :cond_3
    invoke-virtual {p0, p1}, Lcom/immomo/momomediaext/MMLiveEngine;->O0(Ll/zmw;)V

    .line 197
    .line 198
    .line 199
    return-void
.end method

.method public D(Ll/c4m;)Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;
    .locals 1

    .line 1
    sget-object p0, Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;->MMLiveTypeDefault:Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;

    .line 2
    .line 3
    if-nez p1, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    instance-of v0, p1, Ll/t410;

    .line 7
    .line 8
    if-eqz v0, :cond_1

    .line 9
    .line 10
    sget-object p0, Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;->MMLiveTypeConfNONE:Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;

    .line 11
    .line 12
    return-object p0

    .line 13
    :cond_1
    instance-of v0, p1, Ll/uc0;

    .line 14
    .line 15
    if-eqz v0, :cond_2

    .line 16
    .line 17
    sget-object p0, Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;->MMLiveTypeConfAG:Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;

    .line 18
    .line 19
    return-object p0

    .line 20
    :cond_2
    instance-of v0, p1, Ll/xmj0;

    .line 21
    .line 22
    if-eqz v0, :cond_3

    .line 23
    .line 24
    sget-object p0, Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;->MMLiveTypeConfTX:Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;

    .line 25
    .line 26
    return-object p0

    .line 27
    :cond_3
    instance-of v0, p1, Ll/ce00;

    .line 28
    .line 29
    if-eqz v0, :cond_4

    .line 30
    .line 31
    sget-object p0, Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;->MMLiveTypeConfMM:Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;

    .line 32
    .line 33
    return-object p0

    .line 34
    :cond_4
    instance-of p1, p1, Ll/ymp0;

    .line 35
    .line 36
    if-eqz p1, :cond_5

    .line 37
    .line 38
    sget-object p0, Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;->MMLiveTypeConfVolc:Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;

    .line 39
    .line 40
    :cond_5
    :goto_0
    return-object p0
.end method

.method public D0(Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;)I
    .locals 1

    .line 1
    iget-object v0, p1, Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;->sei:Ljava/lang/String;

    .line 2
    .line 3
    invoke-direct {p0, p1, v0}, Lcom/immomo/momomediaext/MMLiveEngine;->E0(Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;Ljava/lang/String;)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public E()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/immomo/momomediaext/MMLiveEngine;->b:F

    .line 2
    .line 3
    return p0
.end method

.method public F()Lcom/immomo/momomediaext/utils/MMLiveVideoEncoderConfig;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/momomediaext/MMLiveEngine;->M:Lcom/immomo/momomediaext/utils/MMLiveVideoEncoderConfig;

    .line 2
    .line 3
    return-object p0
.end method

.method public F0()V
    .locals 1

    .line 1
    const-string v0, "stopAllEffect"

    .line 2
    .line 3
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Lcom/immomo/momomediaext/MMLiveEngine;->M([Ljava/lang/Object;)V

    .line 8
    .line 9
    .line 10
    iget-object p0, p0, Lcom/immomo/momomediaext/MMLiveEngine;->n:Lcom/immomo/momomediaext/MMLiveSource;

    .line 11
    .line 12
    if-eqz p0, :cond_0

    .line 13
    .line 14
    invoke-virtual {p0}, Lcom/immomo/momomediaext/MMLiveSource;->c0()V

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public G()V
    .locals 2

    .line 1
    new-instance v0, Ll/ror;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/ror;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Lcom/immomo/momomediaext/MMLiveEngine;->l:Ll/ror;

    .line 7
    .line 8
    const/4 p0, 0x1

    .line 9
    iput-boolean p0, v0, Ll/uow;->G0:Z

    .line 10
    .line 11
    const p0, 0xfa00

    .line 12
    .line 13
    .line 14
    iput p0, v0, Ll/tow;->S:I

    .line 15
    .line 16
    const/4 p0, 0x2

    .line 17
    iput p0, v0, Ll/tow;->R:I

    .line 18
    .line 19
    const p0, 0xac44

    .line 20
    .line 21
    .line 22
    iput p0, v0, Ll/tow;->P:I

    .line 23
    .line 24
    const/16 p0, 0x168

    .line 25
    .line 26
    iput p0, v0, Ll/tow;->m:I

    .line 27
    .line 28
    const/16 v1, 0x280

    .line 29
    .line 30
    iput v1, v0, Ll/tow;->n:I

    .line 31
    .line 32
    iput p0, v0, Ll/tow;->k:I

    .line 33
    .line 34
    iput v1, v0, Ll/tow;->l:I

    .line 35
    .line 36
    iput p0, v0, Ll/tow;->u:I

    .line 37
    .line 38
    iput v1, v0, Ll/tow;->v:I

    .line 39
    .line 40
    iput p0, v0, Ll/tow;->e:I

    .line 41
    .line 42
    iput v1, v0, Ll/tow;->f:I

    .line 43
    .line 44
    const p0, 0x124f80

    .line 45
    .line 46
    .line 47
    iput p0, v0, Ll/tow;->H:I

    .line 48
    .line 49
    const/16 p0, 0x14

    .line 50
    .line 51
    iput p0, v0, Ll/uow;->D0:I

    .line 52
    .line 53
    const/16 p0, 0xf

    .line 54
    .line 55
    iput p0, v0, Ll/uow;->E0:I

    .line 56
    .line 57
    return-void
.end method

.method public G0()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/immomo/momomediaext/MMLiveEngine;->n:Lcom/immomo/momomediaext/MMLiveSource;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    const-string v0, "MMLiveEngine"

    .line 6
    .line 7
    const-string v1, "stopPreview"

    .line 8
    .line 9
    filled-new-array {v0, v1}, [Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-static {v0}, Lcom/immomo/momomediaext/MMLiveEngine;->M([Ljava/lang/Object;)V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Lcom/immomo/momomediaext/MMLiveEngine;->n:Lcom/immomo/momomediaext/MMLiveSource;

    .line 17
    .line 18
    invoke-virtual {v0}, Lcom/immomo/momomediaext/MMLiveSource;->f0()V

    .line 19
    .line 20
    .line 21
    const/4 v0, 0x0

    .line 22
    iput-object v0, p0, Lcom/immomo/momomediaext/MMLiveEngine;->Q:Ll/zmw;

    .line 23
    .line 24
    :cond_0
    return-void
.end method

.method public H0(I)V
    .locals 2

    .line 1
    const-string v0, "stopEffect"

    .line 2
    .line 3
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    filled-new-array {v0, v1}, [Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-static {v0}, Lcom/immomo/momomediaext/MMLiveEngine;->M([Ljava/lang/Object;)V

    .line 12
    .line 13
    .line 14
    iget-object p0, p0, Lcom/immomo/momomediaext/MMLiveEngine;->n:Lcom/immomo/momomediaext/MMLiveSource;

    .line 15
    .line 16
    if-eqz p0, :cond_0

    .line 17
    .line 18
    invoke-virtual {p0, p1}, Lcom/immomo/momomediaext/MMLiveSource;->d0(I)V

    .line 19
    .line 20
    .line 21
    :cond_0
    return-void
.end method

.method public I0()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/immomo/momomediaext/MMLiveEngine;->o:Ll/gnw;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/gnw;->o()V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object p0, p0, Lcom/immomo/momomediaext/MMLiveEngine;->p:Lcom/immomo/momomediaext/a;

    .line 9
    .line 10
    if-eqz p0, :cond_1

    .line 11
    .line 12
    invoke-virtual {p0}, Lcom/immomo/momomediaext/a;->a0()V

    .line 13
    .line 14
    .line 15
    :cond_1
    return-void
.end method

.method public J0()V
    .locals 3

    .line 1
    const-string v0, "stopPush"

    .line 2
    .line 3
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Lcom/immomo/momomediaext/MMLiveEngine;->M([Ljava/lang/Object;)V

    .line 8
    .line 9
    .line 10
    invoke-static {}, Ll/csx;->R()Ll/csx;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {v0}, Ll/csx;->c()Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    const/4 v1, 0x0

    .line 19
    const/4 v2, 0x0

    .line 20
    if-eqz v0, :cond_2

    .line 21
    .line 22
    iget-object v0, p0, Lcom/immomo/momomediaext/MMLiveEngine;->o:Ll/gnw;

    .line 23
    .line 24
    if-eqz v0, :cond_0

    .line 25
    .line 26
    invoke-virtual {v0, v2}, Ll/gnw;->c(Z)V

    .line 27
    .line 28
    .line 29
    iget-object v0, p0, Lcom/immomo/momomediaext/MMLiveEngine;->o:Ll/gnw;

    .line 30
    .line 31
    invoke-virtual {v0}, Ll/gnw;->n()V

    .line 32
    .line 33
    .line 34
    iput-object v1, p0, Lcom/immomo/momomediaext/MMLiveEngine;->o:Ll/gnw;

    .line 35
    .line 36
    :cond_0
    iget-boolean v0, p0, Lcom/immomo/momomediaext/MMLiveEngine;->u:Z

    .line 37
    .line 38
    if-eqz v0, :cond_6

    .line 39
    .line 40
    iget-object v0, p0, Lcom/immomo/momomediaext/MMLiveEngine;->p:Lcom/immomo/momomediaext/a;

    .line 41
    .line 42
    if-eqz v0, :cond_1

    .line 43
    .line 44
    invoke-virtual {v0, v2}, Lcom/immomo/momomediaext/a;->k(Z)V

    .line 45
    .line 46
    .line 47
    :cond_1
    iput-boolean v2, p0, Lcom/immomo/momomediaext/MMLiveEngine;->u:Z

    .line 48
    .line 49
    goto :goto_0

    .line 50
    :cond_2
    iget-boolean v0, p0, Lcom/immomo/momomediaext/MMLiveEngine;->u:Z

    .line 51
    .line 52
    if-eqz v0, :cond_5

    .line 53
    .line 54
    iget-object v0, p0, Lcom/immomo/momomediaext/MMLiveEngine;->o:Ll/gnw;

    .line 55
    .line 56
    if-eqz v0, :cond_3

    .line 57
    .line 58
    invoke-virtual {v0, v2}, Ll/gnw;->b(Z)V

    .line 59
    .line 60
    .line 61
    :cond_3
    iget-object v0, p0, Lcom/immomo/momomediaext/MMLiveEngine;->p:Lcom/immomo/momomediaext/a;

    .line 62
    .line 63
    if-eqz v0, :cond_4

    .line 64
    .line 65
    invoke-virtual {v0, v2}, Lcom/immomo/momomediaext/a;->k(Z)V

    .line 66
    .line 67
    .line 68
    :cond_4
    iput-boolean v2, p0, Lcom/immomo/momomediaext/MMLiveEngine;->u:Z

    .line 69
    .line 70
    :cond_5
    iget-object v0, p0, Lcom/immomo/momomediaext/MMLiveEngine;->o:Ll/gnw;

    .line 71
    .line 72
    if-eqz v0, :cond_6

    .line 73
    .line 74
    invoke-virtual {v0}, Ll/gnw;->n()V

    .line 75
    .line 76
    .line 77
    iput-object v1, p0, Lcom/immomo/momomediaext/MMLiveEngine;->o:Ll/gnw;

    .line 78
    .line 79
    :cond_6
    :goto_0
    iput-boolean v2, p0, Lcom/immomo/momomediaext/MMLiveEngine;->V:Z

    .line 80
    .line 81
    invoke-direct {p0}, Lcom/immomo/momomediaext/MMLiveEngine;->I()Z

    .line 82
    .line 83
    .line 84
    move-result v0

    .line 85
    if-nez v0, :cond_7

    .line 86
    .line 87
    sget-object v0, Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;->MMLiveTypeDefault:Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;

    .line 88
    .line 89
    iput-object v0, p0, Lcom/immomo/momomediaext/MMLiveEngine;->J:Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;

    .line 90
    .line 91
    :cond_7
    iget-object p0, p0, Lcom/immomo/momomediaext/MMLiveEngine;->n:Lcom/immomo/momomediaext/MMLiveSource;

    .line 92
    .line 93
    if-eqz p0, :cond_8

    .line 94
    .line 95
    invoke-virtual {p0, v2}, Lcom/immomo/momomediaext/MMLiveSource;->Y(Z)V

    .line 96
    .line 97
    .line 98
    :cond_8
    return-void
.end method

.method public K(Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;)Z
    .locals 0

    .line 1
    sget-object p0, Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;->MMLiveTypeConfAG:Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;

    .line 2
    .line 3
    if-eq p1, p0, :cond_1

    .line 4
    .line 5
    sget-object p0, Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;->MMLiveTypeConfTX:Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;

    .line 6
    .line 7
    if-eq p1, p0, :cond_1

    .line 8
    .line 9
    sget-object p0, Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;->MMLiveTypeConfVolc:Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;

    .line 10
    .line 11
    if-ne p1, p0, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    const/4 p0, 0x0

    .line 15
    return p0

    .line 16
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 17
    return p0
.end method

.method public K0()I
    .locals 2

    .line 1
    const-string v0, "switchCamera"

    .line 2
    .line 3
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Lcom/immomo/momomediaext/MMLiveEngine;->M([Ljava/lang/Object;)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Lcom/immomo/momomediaext/MMLiveEngine;->n:Lcom/immomo/momomediaext/MMLiveSource;

    .line 11
    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    invoke-virtual {v0}, Lcom/immomo/momomediaext/MMLiveSource;->g0()I

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    iget-object v1, p0, Lcom/immomo/momomediaext/MMLiveEngine;->Q:Ll/zmw;

    .line 19
    .line 20
    invoke-static {v0, v1}, Ll/ww5;->a(ILl/zmw;)Ll/zmw;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    iput-object v0, p0, Lcom/immomo/momomediaext/MMLiveEngine;->Q:Ll/zmw;

    .line 25
    .line 26
    :cond_0
    iget-object p0, p0, Lcom/immomo/momomediaext/MMLiveEngine;->Q:Ll/zmw;

    .line 27
    .line 28
    if-eqz p0, :cond_1

    .line 29
    .line 30
    invoke-virtual {p0}, Ll/zmw;->d()I

    .line 31
    .line 32
    .line 33
    move-result p0

    .line 34
    return p0

    .line 35
    :cond_1
    const/4 p0, 0x1

    .line 36
    return p0
.end method

.method public L()V
    .locals 2

    .line 1
    const-string v0, "leaveRoom"

    .line 2
    .line 3
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Lcom/immomo/momomediaext/MMLiveEngine;->M([Ljava/lang/Object;)V

    .line 8
    .line 9
    .line 10
    iget-boolean v0, p0, Lcom/immomo/momomediaext/MMLiveEngine;->u:Z

    .line 11
    .line 12
    const/4 v1, 0x0

    .line 13
    if-eqz v0, :cond_1

    .line 14
    .line 15
    iget-object v0, p0, Lcom/immomo/momomediaext/MMLiveEngine;->o:Ll/gnw;

    .line 16
    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    invoke-virtual {v0, v1}, Ll/gnw;->b(Z)V

    .line 20
    .line 21
    .line 22
    :cond_0
    iget-object v0, p0, Lcom/immomo/momomediaext/MMLiveEngine;->p:Lcom/immomo/momomediaext/a;

    .line 23
    .line 24
    if-eqz v0, :cond_1

    .line 25
    .line 26
    invoke-virtual {v0, v1}, Lcom/immomo/momomediaext/a;->k(Z)V

    .line 27
    .line 28
    .line 29
    :cond_1
    iget-object v0, p0, Lcom/immomo/momomediaext/MMLiveEngine;->p:Lcom/immomo/momomediaext/a;

    .line 30
    .line 31
    if-eqz v0, :cond_2

    .line 32
    .line 33
    invoke-virtual {v0}, Lcom/immomo/momomediaext/a;->r()V

    .line 34
    .line 35
    .line 36
    const/4 v0, 0x0

    .line 37
    iput-object v0, p0, Lcom/immomo/momomediaext/MMLiveEngine;->p:Lcom/immomo/momomediaext/a;

    .line 38
    .line 39
    :cond_2
    iput-boolean v1, p0, Lcom/immomo/momomediaext/MMLiveEngine;->u:Z

    .line 40
    .line 41
    invoke-direct {p0}, Lcom/immomo/momomediaext/MMLiveEngine;->J()Z

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    if-nez v0, :cond_3

    .line 46
    .line 47
    sget-object v0, Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;->MMLiveTypeDefault:Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;

    .line 48
    .line 49
    iput-object v0, p0, Lcom/immomo/momomediaext/MMLiveEngine;->J:Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;

    .line 50
    .line 51
    :cond_3
    return-void
.end method

.method public M0(Ljava/lang/String;)I
    .locals 1

    .line 1
    const-string v0, "unaccrossOtherRoom"

    .line 2
    .line 3
    filled-new-array {v0, p1}, [Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Lcom/immomo/momomediaext/MMLiveEngine;->M([Ljava/lang/Object;)V

    .line 8
    .line 9
    .line 10
    iget-object p0, p0, Lcom/immomo/momomediaext/MMLiveEngine;->p:Lcom/immomo/momomediaext/a;

    .line 11
    .line 12
    if-eqz p0, :cond_0

    .line 13
    .line 14
    invoke-virtual {p0, p1}, Lcom/immomo/momomediaext/a;->b0(Ljava/lang/String;)I

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    return p0

    .line 19
    :cond_0
    const/4 p0, -0x1

    .line 20
    return p0
.end method

.method public N()J
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/immomo/momomediaext/MMLiveEngine;->p:Lcom/immomo/momomediaext/a;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Lcom/immomo/momomediaext/MMLiveEngine;->J:Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;

    .line 6
    .line 7
    invoke-virtual {p0, v0}, Lcom/immomo/momomediaext/MMLiveEngine;->K(Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    iget-object p0, p0, Lcom/immomo/momomediaext/MMLiveEngine;->p:Lcom/immomo/momomediaext/a;

    .line 14
    .line 15
    invoke-virtual {p0}, Lcom/immomo/momomediaext/a;->q()J

    .line 16
    .line 17
    .line 18
    move-result-wide v0

    .line 19
    return-wide v0

    .line 20
    :cond_0
    iget-object p0, p0, Lcom/immomo/momomediaext/MMLiveEngine;->n:Lcom/immomo/momomediaext/MMLiveSource;

    .line 21
    .line 22
    if-eqz p0, :cond_1

    .line 23
    .line 24
    invoke-virtual {p0}, Lcom/immomo/momomediaext/MMLiveSource;->z()J

    .line 25
    .line 26
    .line 27
    move-result-wide v0

    .line 28
    return-wide v0

    .line 29
    :cond_1
    const-wide/16 v0, 0x0

    .line 30
    .line 31
    return-wide v0
.end method

.method public N0(Ljava/lang/String;Ljava/lang/String;F)Z
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "updateBeautyValue id:"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    const-string v1, ", key:"

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    const-string v1, ", value:"

    .line 20
    .line 21
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    invoke-static {v0}, Lcom/immomo/momomediaext/MMLiveEngine;->M([Ljava/lang/Object;)V

    .line 36
    .line 37
    .line 38
    iget-object p0, p0, Lcom/immomo/momomediaext/MMLiveEngine;->n:Lcom/immomo/momomediaext/MMLiveSource;

    .line 39
    .line 40
    if-eqz p0, :cond_0

    .line 41
    .line 42
    invoke-virtual {p0, p1, p2, p3}, Lcom/immomo/momomediaext/MMLiveSource;->h0(Ljava/lang/String;Ljava/lang/String;F)Z

    .line 43
    .line 44
    .line 45
    move-result p0

    .line 46
    return p0

    .line 47
    :cond_0
    const/4 p0, 0x0

    .line 48
    return p0
.end method

.method public O()J
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/immomo/momomediaext/MMLiveEngine;->p:Lcom/immomo/momomediaext/a;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Lcom/immomo/momomediaext/MMLiveEngine;->J:Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;

    .line 6
    .line 7
    invoke-virtual {p0, v0}, Lcom/immomo/momomediaext/MMLiveEngine;->K(Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    iget-object p0, p0, Lcom/immomo/momomediaext/MMLiveEngine;->p:Lcom/immomo/momomediaext/a;

    .line 14
    .line 15
    invoke-virtual {p0}, Lcom/immomo/momomediaext/a;->p()J

    .line 16
    .line 17
    .line 18
    move-result-wide v0

    .line 19
    return-wide v0

    .line 20
    :cond_0
    iget-object p0, p0, Lcom/immomo/momomediaext/MMLiveEngine;->n:Lcom/immomo/momomediaext/MMLiveSource;

    .line 21
    .line 22
    if-eqz p0, :cond_1

    .line 23
    .line 24
    invoke-virtual {p0}, Lcom/immomo/momomediaext/MMLiveSource;->A()J

    .line 25
    .line 26
    .line 27
    move-result-wide v0

    .line 28
    return-wide v0

    .line 29
    :cond_1
    const-wide/16 v0, 0x0

    .line 30
    .line 31
    return-wide v0
.end method

.method public O0(Ll/zmw;)V
    .locals 3
    .param p1    # Ll/zmw;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iget-object v0, p0, Lcom/immomo/momomediaext/MMLiveEngine;->n:Lcom/immomo/momomediaext/MMLiveSource;

    .line 2
    .line 3
    const-string v1, "MMLiveEngine"

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    const-string p0, "updateCameraConfiguration mLiveSource: null"

    .line 8
    .line 9
    filled-new-array {v1, p0}, [Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-static {p0}, Lcom/immomo/momomediaext/MMLiveEngine;->M([Ljava/lang/Object;)V

    .line 14
    .line 15
    .line 16
    return-void

    .line 17
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    .line 18
    .line 19
    const-string v2, "updateCameraConfiguration previewWidth: "

    .line 20
    .line 21
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {p1}, Ll/zmw;->n()I

    .line 25
    .line 26
    .line 27
    move-result v2

    .line 28
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    const-string v2, " previewHeight: "

    .line 32
    .line 33
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    invoke-virtual {p1}, Ll/zmw;->m()I

    .line 37
    .line 38
    .line 39
    move-result v2

    .line 40
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    const-string v2, " enableCameraRawData: "

    .line 44
    .line 45
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    invoke-virtual {p1}, Ll/zmw;->t()Z

    .line 49
    .line 50
    .line 51
    move-result v2

    .line 52
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 53
    .line 54
    .line 55
    const-string v2, " warpType: "

    .line 56
    .line 57
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 58
    .line 59
    .line 60
    invoke-virtual {p1}, Ll/zmw;->r()I

    .line 61
    .line 62
    .line 63
    move-result v2

    .line 64
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 65
    .line 66
    .line 67
    const-string v2, " videoRotation: "

    .line 68
    .line 69
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 70
    .line 71
    .line 72
    invoke-virtual {p1}, Ll/zmw;->p()I

    .line 73
    .line 74
    .line 75
    move-result v2

    .line 76
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 77
    .line 78
    .line 79
    const-string v2, " enableFilterScale: "

    .line 80
    .line 81
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 82
    .line 83
    .line 84
    invoke-virtual {p1}, Ll/zmw;->v()Z

    .line 85
    .line 86
    .line 87
    move-result v2

    .line 88
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 89
    .line 90
    .line 91
    const-string v2, " enableBlinkDetect: "

    .line 92
    .line 93
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 94
    .line 95
    .line 96
    invoke-virtual {p1}, Ll/zmw;->s()Z

    .line 97
    .line 98
    .line 99
    move-result v2

    .line 100
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 101
    .line 102
    .line 103
    const-string v2, " enableFaceExpressionDetect: "

    .line 104
    .line 105
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 106
    .line 107
    .line 108
    invoke-virtual {p1}, Ll/zmw;->u()Z

    .line 109
    .line 110
    .line 111
    move-result v2

    .line 112
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 113
    .line 114
    .line 115
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 116
    .line 117
    .line 118
    move-result-object v0

    .line 119
    filled-new-array {v1, v0}, [Ljava/lang/Object;

    .line 120
    .line 121
    .line 122
    move-result-object v0

    .line 123
    invoke-static {v0}, Lcom/immomo/momomediaext/MMLiveEngine;->M([Ljava/lang/Object;)V

    .line 124
    .line 125
    .line 126
    iget-object v0, p0, Lcom/immomo/momomediaext/MMLiveEngine;->Q:Ll/zmw;

    .line 127
    .line 128
    if-eqz v0, :cond_1

    .line 129
    .line 130
    invoke-virtual {p1}, Ll/zmw;->n()I

    .line 131
    .line 132
    .line 133
    move-result v0

    .line 134
    if-eqz v0, :cond_5

    .line 135
    .line 136
    invoke-virtual {p1}, Ll/zmw;->m()I

    .line 137
    .line 138
    .line 139
    move-result v0

    .line 140
    if-eqz v0, :cond_5

    .line 141
    .line 142
    :cond_1
    iget-object v0, p0, Lcom/immomo/momomediaext/MMLiveEngine;->l:Ll/ror;

    .line 143
    .line 144
    if-eqz v0, :cond_2

    .line 145
    .line 146
    invoke-virtual {p1}, Ll/zmw;->n()I

    .line 147
    .line 148
    .line 149
    move-result v1

    .line 150
    iput v1, v0, Ll/tow;->u:I

    .line 151
    .line 152
    iget-object v0, p0, Lcom/immomo/momomediaext/MMLiveEngine;->l:Ll/ror;

    .line 153
    .line 154
    invoke-virtual {p1}, Ll/zmw;->m()I

    .line 155
    .line 156
    .line 157
    move-result v1

    .line 158
    iput v1, v0, Ll/tow;->v:I

    .line 159
    .line 160
    :cond_2
    iget-object v0, p0, Lcom/immomo/momomediaext/MMLiveEngine;->O:Ll/lvl;

    .line 161
    .line 162
    if-nez v0, :cond_3

    .line 163
    .line 164
    iget-object v0, p0, Lcom/immomo/momomediaext/MMLiveEngine;->n:Lcom/immomo/momomediaext/MMLiveSource;

    .line 165
    .line 166
    invoke-virtual {v0}, Lcom/immomo/momomediaext/MMLiveSource;->H()V

    .line 167
    .line 168
    .line 169
    :cond_3
    iget-object v0, p0, Lcom/immomo/momomediaext/MMLiveEngine;->n:Lcom/immomo/momomediaext/MMLiveSource;

    .line 170
    .line 171
    if-eqz v0, :cond_4

    .line 172
    .line 173
    invoke-virtual {p1}, Ll/zmw;->n()I

    .line 174
    .line 175
    .line 176
    move-result v0

    .line 177
    if-eqz v0, :cond_4

    .line 178
    .line 179
    invoke-virtual {p1}, Ll/zmw;->m()I

    .line 180
    .line 181
    .line 182
    move-result v0

    .line 183
    if-eqz v0, :cond_4

    .line 184
    .line 185
    iget-object v0, p0, Lcom/immomo/momomediaext/MMLiveEngine;->n:Lcom/immomo/momomediaext/MMLiveSource;

    .line 186
    .line 187
    invoke-virtual {p1}, Ll/zmw;->n()I

    .line 188
    .line 189
    .line 190
    move-result v1

    .line 191
    invoke-virtual {p1}, Ll/zmw;->m()I

    .line 192
    .line 193
    .line 194
    move-result v2

    .line 195
    invoke-virtual {v0, v1, v2}, Lcom/immomo/momomediaext/MMLiveSource;->W(II)V

    .line 196
    .line 197
    .line 198
    :cond_4
    iget-object v0, p0, Lcom/immomo/momomediaext/MMLiveEngine;->Q:Ll/zmw;

    .line 199
    .line 200
    if-eqz v0, :cond_5

    .line 201
    .line 202
    invoke-virtual {p1}, Ll/zmw;->n()I

    .line 203
    .line 204
    .line 205
    move-result v1

    .line 206
    invoke-virtual {p1}, Ll/zmw;->m()I

    .line 207
    .line 208
    .line 209
    move-result v2

    .line 210
    invoke-virtual {v0, v1, v2}, Ll/zmw;->M(II)Ll/zmw;

    .line 211
    .line 212
    .line 213
    :cond_5
    iget-object v0, p0, Lcom/immomo/momomediaext/MMLiveEngine;->Q:Ll/zmw;

    .line 214
    .line 215
    if-eqz v0, :cond_7

    .line 216
    .line 217
    invoke-virtual {p1}, Ll/zmw;->f()I

    .line 218
    .line 219
    .line 220
    move-result v0

    .line 221
    iget-object v1, p0, Lcom/immomo/momomediaext/MMLiveEngine;->Q:Ll/zmw;

    .line 222
    .line 223
    invoke-virtual {v1}, Ll/zmw;->f()I

    .line 224
    .line 225
    .line 226
    move-result v1

    .line 227
    if-eq v0, v1, :cond_7

    .line 228
    .line 229
    iget-object v0, p0, Lcom/immomo/momomediaext/MMLiveEngine;->n:Lcom/immomo/momomediaext/MMLiveSource;

    .line 230
    .line 231
    if-eqz v0, :cond_6

    .line 232
    .line 233
    invoke-virtual {v0}, Lcom/immomo/momomediaext/MMLiveSource;->s()Ll/fql;

    .line 234
    .line 235
    .line 236
    move-result-object v0

    .line 237
    if-eqz v0, :cond_6

    .line 238
    .line 239
    iget-object v0, p0, Lcom/immomo/momomediaext/MMLiveEngine;->n:Lcom/immomo/momomediaext/MMLiveSource;

    .line 240
    .line 241
    invoke-virtual {v0}, Lcom/immomo/momomediaext/MMLiveSource;->s()Ll/fql;

    .line 242
    .line 243
    .line 244
    move-result-object v0

    .line 245
    invoke-virtual {p1}, Ll/zmw;->f()I

    .line 246
    .line 247
    .line 248
    move-result v1

    .line 249
    invoke-interface {v0, v1}, Ll/fql;->b(I)V

    .line 250
    .line 251
    .line 252
    :cond_6
    iget-object v0, p0, Lcom/immomo/momomediaext/MMLiveEngine;->Q:Ll/zmw;

    .line 253
    .line 254
    if-eqz v0, :cond_7

    .line 255
    .line 256
    invoke-virtual {p1}, Ll/zmw;->f()I

    .line 257
    .line 258
    .line 259
    move-result v1

    .line 260
    invoke-virtual {v0, v1}, Ll/zmw;->A(I)Ll/zmw;

    .line 261
    .line 262
    .line 263
    :cond_7
    iget-object v0, p0, Lcom/immomo/momomediaext/MMLiveEngine;->Q:Ll/zmw;

    .line 264
    .line 265
    if-eqz v0, :cond_9

    .line 266
    .line 267
    invoke-virtual {p1}, Ll/zmw;->a()I

    .line 268
    .line 269
    .line 270
    move-result v0

    .line 271
    iget-object v1, p0, Lcom/immomo/momomediaext/MMLiveEngine;->Q:Ll/zmw;

    .line 272
    .line 273
    invoke-virtual {v1}, Ll/zmw;->a()I

    .line 274
    .line 275
    .line 276
    move-result v1

    .line 277
    if-eq v0, v1, :cond_9

    .line 278
    .line 279
    iget-object v0, p0, Lcom/immomo/momomediaext/MMLiveEngine;->n:Lcom/immomo/momomediaext/MMLiveSource;

    .line 280
    .line 281
    if-eqz v0, :cond_8

    .line 282
    .line 283
    invoke-virtual {v0}, Lcom/immomo/momomediaext/MMLiveSource;->s()Ll/fql;

    .line 284
    .line 285
    .line 286
    move-result-object v0

    .line 287
    if-eqz v0, :cond_8

    .line 288
    .line 289
    iget-object v0, p0, Lcom/immomo/momomediaext/MMLiveEngine;->n:Lcom/immomo/momomediaext/MMLiveSource;

    .line 290
    .line 291
    invoke-virtual {v0}, Lcom/immomo/momomediaext/MMLiveSource;->s()Ll/fql;

    .line 292
    .line 293
    .line 294
    move-result-object v0

    .line 295
    invoke-virtual {p1}, Ll/zmw;->a()I

    .line 296
    .line 297
    .line 298
    move-result v1

    .line 299
    invoke-interface {v0, v1}, Ll/fql;->m(I)V

    .line 300
    .line 301
    .line 302
    :cond_8
    iget-object v0, p0, Lcom/immomo/momomediaext/MMLiveEngine;->Q:Ll/zmw;

    .line 303
    .line 304
    if-eqz v0, :cond_9

    .line 305
    .line 306
    invoke-virtual {p1}, Ll/zmw;->a()I

    .line 307
    .line 308
    .line 309
    move-result v1

    .line 310
    invoke-virtual {v0, v1}, Ll/zmw;->x(I)Ll/zmw;

    .line 311
    .line 312
    .line 313
    :cond_9
    iget-object v0, p0, Lcom/immomo/momomediaext/MMLiveEngine;->Q:Ll/zmw;

    .line 314
    .line 315
    if-eqz v0, :cond_b

    .line 316
    .line 317
    invoke-virtual {p1}, Ll/zmw;->g()I

    .line 318
    .line 319
    .line 320
    move-result v0

    .line 321
    iget-object v1, p0, Lcom/immomo/momomediaext/MMLiveEngine;->Q:Ll/zmw;

    .line 322
    .line 323
    invoke-virtual {v1}, Ll/zmw;->g()I

    .line 324
    .line 325
    .line 326
    move-result v1

    .line 327
    if-eq v0, v1, :cond_b

    .line 328
    .line 329
    iget-object v0, p0, Lcom/immomo/momomediaext/MMLiveEngine;->n:Lcom/immomo/momomediaext/MMLiveSource;

    .line 330
    .line 331
    if-eqz v0, :cond_a

    .line 332
    .line 333
    invoke-virtual {v0}, Lcom/immomo/momomediaext/MMLiveSource;->s()Ll/fql;

    .line 334
    .line 335
    .line 336
    move-result-object v0

    .line 337
    if-eqz v0, :cond_a

    .line 338
    .line 339
    iget-object v0, p0, Lcom/immomo/momomediaext/MMLiveEngine;->n:Lcom/immomo/momomediaext/MMLiveSource;

    .line 340
    .line 341
    invoke-virtual {v0}, Lcom/immomo/momomediaext/MMLiveSource;->s()Ll/fql;

    .line 342
    .line 343
    .line 344
    move-result-object v0

    .line 345
    invoke-virtual {p1}, Ll/zmw;->g()I

    .line 346
    .line 347
    .line 348
    move-result v1

    .line 349
    invoke-interface {v0, v1}, Ll/fql;->setExposureCompensation(I)V

    .line 350
    .line 351
    .line 352
    :cond_a
    iget-object v0, p0, Lcom/immomo/momomediaext/MMLiveEngine;->Q:Ll/zmw;

    .line 353
    .line 354
    if-eqz v0, :cond_b

    .line 355
    .line 356
    invoke-virtual {p1}, Ll/zmw;->g()I

    .line 357
    .line 358
    .line 359
    move-result v1

    .line 360
    invoke-virtual {v0, v1}, Ll/zmw;->G(I)Ll/zmw;

    .line 361
    .line 362
    .line 363
    :cond_b
    iget-object v0, p0, Lcom/immomo/momomediaext/MMLiveEngine;->Q:Ll/zmw;

    .line 364
    .line 365
    if-eqz v0, :cond_e

    .line 366
    .line 367
    invoke-virtual {p1}, Ll/zmw;->t()Z

    .line 368
    .line 369
    .line 370
    move-result v0

    .line 371
    iget-object v1, p0, Lcom/immomo/momomediaext/MMLiveEngine;->Q:Ll/zmw;

    .line 372
    .line 373
    invoke-virtual {v1}, Ll/zmw;->t()Z

    .line 374
    .line 375
    .line 376
    move-result v1

    .line 377
    if-eq v0, v1, :cond_e

    .line 378
    .line 379
    iget-object v0, p0, Lcom/immomo/momomediaext/MMLiveEngine;->n:Lcom/immomo/momomediaext/MMLiveSource;

    .line 380
    .line 381
    if-eqz v0, :cond_d

    .line 382
    .line 383
    invoke-virtual {v0}, Lcom/immomo/momomediaext/MMLiveSource;->s()Ll/fql;

    .line 384
    .line 385
    .line 386
    move-result-object v0

    .line 387
    if-eqz v0, :cond_d

    .line 388
    .line 389
    iget-object v0, p0, Lcom/immomo/momomediaext/MMLiveEngine;->n:Lcom/immomo/momomediaext/MMLiveSource;

    .line 390
    .line 391
    invoke-virtual {p1}, Ll/zmw;->t()Z

    .line 392
    .line 393
    .line 394
    move-result v1

    .line 395
    if-eqz v1, :cond_c

    .line 396
    .line 397
    iget-object v1, p0, Lcom/immomo/momomediaext/MMLiveEngine;->r0:Ll/ib4$l;

    .line 398
    .line 399
    goto :goto_0

    .line 400
    :cond_c
    const/4 v1, 0x0

    .line 401
    :goto_0
    invoke-virtual {v0, v1}, Lcom/immomo/momomediaext/MMLiveSource;->M(Ll/ib4$l;)V

    .line 402
    .line 403
    .line 404
    :cond_d
    iget-object v0, p0, Lcom/immomo/momomediaext/MMLiveEngine;->Q:Ll/zmw;

    .line 405
    .line 406
    if-eqz v0, :cond_e

    .line 407
    .line 408
    invoke-virtual {p1}, Ll/zmw;->t()Z

    .line 409
    .line 410
    .line 411
    move-result v1

    .line 412
    invoke-virtual {v0, v1}, Ll/zmw;->C(Z)Ll/zmw;

    .line 413
    .line 414
    .line 415
    :cond_e
    iget-object v0, p0, Lcom/immomo/momomediaext/MMLiveEngine;->Q:Ll/zmw;

    .line 416
    .line 417
    if-eqz v0, :cond_10

    .line 418
    .line 419
    invoke-virtual {p1}, Ll/zmw;->r()I

    .line 420
    .line 421
    .line 422
    move-result v0

    .line 423
    iget-object v1, p0, Lcom/immomo/momomediaext/MMLiveEngine;->Q:Ll/zmw;

    .line 424
    .line 425
    invoke-virtual {v1}, Ll/zmw;->r()I

    .line 426
    .line 427
    .line 428
    move-result v1

    .line 429
    if-eq v0, v1, :cond_10

    .line 430
    .line 431
    iget-object v0, p0, Lcom/immomo/momomediaext/MMLiveEngine;->n:Lcom/immomo/momomediaext/MMLiveSource;

    .line 432
    .line 433
    if-eqz v0, :cond_f

    .line 434
    .line 435
    invoke-virtual {p1}, Ll/zmw;->r()I

    .line 436
    .line 437
    .line 438
    move-result v1

    .line 439
    invoke-virtual {v0, v1}, Lcom/immomo/momomediaext/MMLiveSource;->Z(I)V

    .line 440
    .line 441
    .line 442
    :cond_f
    iget-object v0, p0, Lcom/immomo/momomediaext/MMLiveEngine;->Q:Ll/zmw;

    .line 443
    .line 444
    if-eqz v0, :cond_10

    .line 445
    .line 446
    invoke-virtual {p1}, Ll/zmw;->r()I

    .line 447
    .line 448
    .line 449
    move-result v1

    .line 450
    invoke-virtual {v0, v1}, Ll/zmw;->P(I)Ll/zmw;

    .line 451
    .line 452
    .line 453
    :cond_10
    iget-object v0, p0, Lcom/immomo/momomediaext/MMLiveEngine;->Q:Ll/zmw;

    .line 454
    .line 455
    if-eqz v0, :cond_12

    .line 456
    .line 457
    invoke-virtual {p1}, Ll/zmw;->p()I

    .line 458
    .line 459
    .line 460
    move-result v0

    .line 461
    iget-object v1, p0, Lcom/immomo/momomediaext/MMLiveEngine;->Q:Ll/zmw;

    .line 462
    .line 463
    invoke-virtual {v1}, Ll/zmw;->p()I

    .line 464
    .line 465
    .line 466
    move-result v1

    .line 467
    if-eq v0, v1, :cond_12

    .line 468
    .line 469
    iget-object v0, p0, Lcom/immomo/momomediaext/MMLiveEngine;->n:Lcom/immomo/momomediaext/MMLiveSource;

    .line 470
    .line 471
    if-eqz v0, :cond_11

    .line 472
    .line 473
    invoke-virtual {p1}, Ll/zmw;->p()I

    .line 474
    .line 475
    .line 476
    move-result v1

    .line 477
    invoke-virtual {v0, v1}, Lcom/immomo/momomediaext/MMLiveSource;->X(I)V

    .line 478
    .line 479
    .line 480
    :cond_11
    iget-object v0, p0, Lcom/immomo/momomediaext/MMLiveEngine;->Q:Ll/zmw;

    .line 481
    .line 482
    if-eqz v0, :cond_12

    .line 483
    .line 484
    invoke-virtual {p1}, Ll/zmw;->p()I

    .line 485
    .line 486
    .line 487
    move-result v1

    .line 488
    invoke-virtual {v0, v1}, Ll/zmw;->O(I)Ll/zmw;

    .line 489
    .line 490
    .line 491
    :cond_12
    iget-object v0, p0, Lcom/immomo/momomediaext/MMLiveEngine;->Q:Ll/zmw;

    .line 492
    .line 493
    if-eqz v0, :cond_14

    .line 494
    .line 495
    invoke-virtual {p1}, Ll/zmw;->v()Z

    .line 496
    .line 497
    .line 498
    move-result v0

    .line 499
    iget-object v1, p0, Lcom/immomo/momomediaext/MMLiveEngine;->Q:Ll/zmw;

    .line 500
    .line 501
    invoke-virtual {v1}, Ll/zmw;->v()Z

    .line 502
    .line 503
    .line 504
    move-result v1

    .line 505
    if-eq v0, v1, :cond_14

    .line 506
    .line 507
    iget-object v0, p0, Lcom/immomo/momomediaext/MMLiveEngine;->n:Lcom/immomo/momomediaext/MMLiveSource;

    .line 508
    .line 509
    if-eqz v0, :cond_13

    .line 510
    .line 511
    invoke-virtual {p1}, Ll/zmw;->v()Z

    .line 512
    .line 513
    .line 514
    move-result v1

    .line 515
    invoke-virtual {v0, v1}, Lcom/immomo/momomediaext/MMLiveSource;->T(Z)V

    .line 516
    .line 517
    .line 518
    :cond_13
    iget-object v0, p0, Lcom/immomo/momomediaext/MMLiveEngine;->Q:Ll/zmw;

    .line 519
    .line 520
    if-eqz v0, :cond_14

    .line 521
    .line 522
    invoke-virtual {p1}, Ll/zmw;->v()Z

    .line 523
    .line 524
    .line 525
    move-result v1

    .line 526
    invoke-virtual {v0, v1}, Ll/zmw;->E(Z)Ll/zmw;

    .line 527
    .line 528
    .line 529
    :cond_14
    iget-object v0, p0, Lcom/immomo/momomediaext/MMLiveEngine;->Q:Ll/zmw;

    .line 530
    .line 531
    if-eqz v0, :cond_16

    .line 532
    .line 533
    invoke-virtual {p1}, Ll/zmw;->s()Z

    .line 534
    .line 535
    .line 536
    move-result v0

    .line 537
    iget-object v1, p0, Lcom/immomo/momomediaext/MMLiveEngine;->Q:Ll/zmw;

    .line 538
    .line 539
    invoke-virtual {v1}, Ll/zmw;->s()Z

    .line 540
    .line 541
    .line 542
    move-result v1

    .line 543
    if-eq v0, v1, :cond_16

    .line 544
    .line 545
    iget-object v0, p0, Lcom/immomo/momomediaext/MMLiveEngine;->n:Lcom/immomo/momomediaext/MMLiveSource;

    .line 546
    .line 547
    if-eqz v0, :cond_15

    .line 548
    .line 549
    invoke-virtual {p1}, Ll/zmw;->s()Z

    .line 550
    .line 551
    .line 552
    move-result v1

    .line 553
    invoke-virtual {v0, v1}, Lcom/immomo/momomediaext/MMLiveSource;->K(Z)V

    .line 554
    .line 555
    .line 556
    :cond_15
    iget-object v0, p0, Lcom/immomo/momomediaext/MMLiveEngine;->Q:Ll/zmw;

    .line 557
    .line 558
    if-eqz v0, :cond_16

    .line 559
    .line 560
    invoke-virtual {p1}, Ll/zmw;->s()Z

    .line 561
    .line 562
    .line 563
    move-result v1

    .line 564
    invoke-virtual {v0, v1}, Ll/zmw;->B(Z)Ll/zmw;

    .line 565
    .line 566
    .line 567
    :cond_16
    iget-object v0, p0, Lcom/immomo/momomediaext/MMLiveEngine;->Q:Ll/zmw;

    .line 568
    .line 569
    if-eqz v0, :cond_18

    .line 570
    .line 571
    invoke-virtual {p1}, Ll/zmw;->u()Z

    .line 572
    .line 573
    .line 574
    move-result v0

    .line 575
    iget-object v1, p0, Lcom/immomo/momomediaext/MMLiveEngine;->Q:Ll/zmw;

    .line 576
    .line 577
    invoke-virtual {v1}, Ll/zmw;->u()Z

    .line 578
    .line 579
    .line 580
    move-result v1

    .line 581
    if-eq v0, v1, :cond_18

    .line 582
    .line 583
    iget-object v0, p0, Lcom/immomo/momomediaext/MMLiveEngine;->n:Lcom/immomo/momomediaext/MMLiveSource;

    .line 584
    .line 585
    if-eqz v0, :cond_17

    .line 586
    .line 587
    invoke-virtual {p1}, Ll/zmw;->u()Z

    .line 588
    .line 589
    .line 590
    move-result v1

    .line 591
    invoke-virtual {v0, v1}, Lcom/immomo/momomediaext/MMLiveSource;->Q(Z)V

    .line 592
    .line 593
    .line 594
    :cond_17
    iget-object v0, p0, Lcom/immomo/momomediaext/MMLiveEngine;->Q:Ll/zmw;

    .line 595
    .line 596
    if-eqz v0, :cond_18

    .line 597
    .line 598
    invoke-virtual {p1}, Ll/zmw;->u()Z

    .line 599
    .line 600
    .line 601
    move-result v1

    .line 602
    invoke-virtual {v0, v1}, Ll/zmw;->D(Z)Ll/zmw;

    .line 603
    .line 604
    .line 605
    :cond_18
    iget-object v0, p0, Lcom/immomo/momomediaext/MMLiveEngine;->Q:Ll/zmw;

    .line 606
    .line 607
    if-eqz v0, :cond_1a

    .line 608
    .line 609
    invoke-virtual {p1}, Ll/zmw;->h()I

    .line 610
    .line 611
    .line 612
    move-result v0

    .line 613
    iget-object v1, p0, Lcom/immomo/momomediaext/MMLiveEngine;->Q:Ll/zmw;

    .line 614
    .line 615
    invoke-virtual {v1}, Ll/zmw;->h()I

    .line 616
    .line 617
    .line 618
    move-result v1

    .line 619
    if-eq v0, v1, :cond_1a

    .line 620
    .line 621
    iget-object v0, p0, Lcom/immomo/momomediaext/MMLiveEngine;->n:Lcom/immomo/momomediaext/MMLiveSource;

    .line 622
    .line 623
    if-eqz v0, :cond_19

    .line 624
    .line 625
    invoke-virtual {v0}, Lcom/immomo/momomediaext/MMLiveSource;->t()Ll/esl;

    .line 626
    .line 627
    .line 628
    move-result-object v0

    .line 629
    if-eqz v0, :cond_19

    .line 630
    .line 631
    iget-object v0, p0, Lcom/immomo/momomediaext/MMLiveEngine;->n:Lcom/immomo/momomediaext/MMLiveSource;

    .line 632
    .line 633
    invoke-virtual {v0}, Lcom/immomo/momomediaext/MMLiveSource;->t()Ll/esl;

    .line 634
    .line 635
    .line 636
    move-result-object v0

    .line 637
    invoke-virtual {p1}, Ll/zmw;->h()I

    .line 638
    .line 639
    .line 640
    move-result v1

    .line 641
    invoke-interface {v0, v1}, Ll/esl;->s(I)V

    .line 642
    .line 643
    .line 644
    :cond_19
    iget-object v0, p0, Lcom/immomo/momomediaext/MMLiveEngine;->Q:Ll/zmw;

    .line 645
    .line 646
    if-eqz v0, :cond_1a

    .line 647
    .line 648
    invoke-virtual {p1}, Ll/zmw;->h()I

    .line 649
    .line 650
    .line 651
    move-result v1

    .line 652
    invoke-virtual {v0, v1}, Ll/zmw;->H(I)Ll/zmw;

    .line 653
    .line 654
    .line 655
    :cond_1a
    iget-object v0, p0, Lcom/immomo/momomediaext/MMLiveEngine;->Q:Ll/zmw;

    .line 656
    .line 657
    if-eqz v0, :cond_1c

    .line 658
    .line 659
    invoke-virtual {p1}, Ll/zmw;->w()Z

    .line 660
    .line 661
    .line 662
    move-result v0

    .line 663
    iget-object v1, p0, Lcom/immomo/momomediaext/MMLiveEngine;->Q:Ll/zmw;

    .line 664
    .line 665
    invoke-virtual {v1}, Ll/zmw;->w()Z

    .line 666
    .line 667
    .line 668
    move-result v1

    .line 669
    if-eq v0, v1, :cond_1c

    .line 670
    .line 671
    iget-object v0, p0, Lcom/immomo/momomediaext/MMLiveEngine;->n:Lcom/immomo/momomediaext/MMLiveSource;

    .line 672
    .line 673
    if-eqz v0, :cond_1b

    .line 674
    .line 675
    invoke-virtual {v0}, Lcom/immomo/momomediaext/MMLiveSource;->t()Ll/esl;

    .line 676
    .line 677
    .line 678
    move-result-object v0

    .line 679
    if-eqz v0, :cond_1b

    .line 680
    .line 681
    iget-object v0, p0, Lcom/immomo/momomediaext/MMLiveEngine;->n:Lcom/immomo/momomediaext/MMLiveSource;

    .line 682
    .line 683
    invoke-virtual {v0}, Lcom/immomo/momomediaext/MMLiveSource;->t()Ll/esl;

    .line 684
    .line 685
    .line 686
    move-result-object v0

    .line 687
    invoke-virtual {p1}, Ll/zmw;->w()Z

    .line 688
    .line 689
    .line 690
    move-result v1

    .line 691
    invoke-interface {v0, v1}, Ll/esl;->j(Z)V

    .line 692
    .line 693
    .line 694
    :cond_1b
    iget-object v0, p0, Lcom/immomo/momomediaext/MMLiveEngine;->Q:Ll/zmw;

    .line 695
    .line 696
    if-eqz v0, :cond_1c

    .line 697
    .line 698
    invoke-virtual {p1}, Ll/zmw;->w()Z

    .line 699
    .line 700
    .line 701
    move-result v1

    .line 702
    invoke-virtual {v0, v1}, Ll/zmw;->F(Z)Ll/zmw;

    .line 703
    .line 704
    .line 705
    :cond_1c
    iget-object v0, p0, Lcom/immomo/momomediaext/MMLiveEngine;->Q:Ll/zmw;

    .line 706
    .line 707
    if-eqz v0, :cond_1e

    .line 708
    .line 709
    invoke-virtual {p1}, Ll/zmw;->i()I

    .line 710
    .line 711
    .line 712
    move-result v0

    .line 713
    iget-object v1, p0, Lcom/immomo/momomediaext/MMLiveEngine;->Q:Ll/zmw;

    .line 714
    .line 715
    invoke-virtual {v1}, Ll/zmw;->i()I

    .line 716
    .line 717
    .line 718
    move-result v1

    .line 719
    if-eq v0, v1, :cond_1e

    .line 720
    .line 721
    iget-object v0, p0, Lcom/immomo/momomediaext/MMLiveEngine;->n:Lcom/immomo/momomediaext/MMLiveSource;

    .line 722
    .line 723
    if-eqz v0, :cond_1d

    .line 724
    .line 725
    invoke-virtual {v0}, Lcom/immomo/momomediaext/MMLiveSource;->t()Ll/esl;

    .line 726
    .line 727
    .line 728
    move-result-object v0

    .line 729
    if-eqz v0, :cond_1d

    .line 730
    .line 731
    iget-object v0, p0, Lcom/immomo/momomediaext/MMLiveEngine;->n:Lcom/immomo/momomediaext/MMLiveSource;

    .line 732
    .line 733
    invoke-virtual {v0}, Lcom/immomo/momomediaext/MMLiveSource;->t()Ll/esl;

    .line 734
    .line 735
    .line 736
    move-result-object v0

    .line 737
    invoke-virtual {p1}, Ll/zmw;->i()I

    .line 738
    .line 739
    .line 740
    move-result v1

    .line 741
    invoke-interface {v0, v1}, Ll/esl;->u(I)V

    .line 742
    .line 743
    .line 744
    :cond_1d
    iget-object v0, p0, Lcom/immomo/momomediaext/MMLiveEngine;->Q:Ll/zmw;

    .line 745
    .line 746
    if-eqz v0, :cond_1e

    .line 747
    .line 748
    invoke-virtual {p1}, Ll/zmw;->i()I

    .line 749
    .line 750
    .line 751
    move-result v1

    .line 752
    invoke-virtual {v0, v1}, Ll/zmw;->I(I)Ll/zmw;

    .line 753
    .line 754
    .line 755
    :cond_1e
    iget-object v0, p0, Lcom/immomo/momomediaext/MMLiveEngine;->Q:Ll/zmw;

    .line 756
    .line 757
    if-eqz v0, :cond_20

    .line 758
    .line 759
    invoke-virtual {p1}, Ll/zmw;->o()I

    .line 760
    .line 761
    .line 762
    move-result v0

    .line 763
    iget-object v1, p0, Lcom/immomo/momomediaext/MMLiveEngine;->Q:Ll/zmw;

    .line 764
    .line 765
    invoke-virtual {v1}, Ll/zmw;->o()I

    .line 766
    .line 767
    .line 768
    move-result v1

    .line 769
    if-eq v0, v1, :cond_20

    .line 770
    .line 771
    iget-object v0, p0, Lcom/immomo/momomediaext/MMLiveEngine;->n:Lcom/immomo/momomediaext/MMLiveSource;

    .line 772
    .line 773
    if-eqz v0, :cond_1f

    .line 774
    .line 775
    invoke-virtual {v0}, Lcom/immomo/momomediaext/MMLiveSource;->s()Ll/fql;

    .line 776
    .line 777
    .line 778
    move-result-object v0

    .line 779
    if-eqz v0, :cond_1f

    .line 780
    .line 781
    iget-object v0, p0, Lcom/immomo/momomediaext/MMLiveEngine;->n:Lcom/immomo/momomediaext/MMLiveSource;

    .line 782
    .line 783
    invoke-virtual {v0}, Lcom/immomo/momomediaext/MMLiveSource;->s()Ll/fql;

    .line 784
    .line 785
    .line 786
    move-result-object v0

    .line 787
    invoke-virtual {p1}, Ll/zmw;->o()I

    .line 788
    .line 789
    .line 790
    move-result v1

    .line 791
    invoke-interface {v0, v1}, Ll/fql;->n(I)V

    .line 792
    .line 793
    .line 794
    :cond_1f
    iget-object v0, p0, Lcom/immomo/momomediaext/MMLiveEngine;->Q:Ll/zmw;

    .line 795
    .line 796
    if-eqz v0, :cond_20

    .line 797
    .line 798
    invoke-virtual {p1}, Ll/zmw;->o()I

    .line 799
    .line 800
    .line 801
    move-result v1

    .line 802
    invoke-virtual {v0, v1}, Ll/zmw;->N(I)Ll/zmw;

    .line 803
    .line 804
    .line 805
    :cond_20
    iget-object v0, p0, Lcom/immomo/momomediaext/MMLiveEngine;->Q:Ll/zmw;

    .line 806
    .line 807
    if-eqz v0, :cond_21

    .line 808
    .line 809
    invoke-virtual {p1}, Ll/zmw;->e()I

    .line 810
    .line 811
    .line 812
    move-result v0

    .line 813
    if-eqz v0, :cond_21

    .line 814
    .line 815
    invoke-virtual {p1}, Ll/zmw;->c()I

    .line 816
    .line 817
    .line 818
    move-result v0

    .line 819
    if-eqz v0, :cond_21

    .line 820
    .line 821
    invoke-virtual {p1}, Ll/zmw;->e()I

    .line 822
    .line 823
    .line 824
    move-result v0

    .line 825
    iget-object v1, p0, Lcom/immomo/momomediaext/MMLiveEngine;->Q:Ll/zmw;

    .line 826
    .line 827
    invoke-virtual {v1}, Ll/zmw;->e()I

    .line 828
    .line 829
    .line 830
    move-result v1

    .line 831
    if-eq v0, v1, :cond_21

    .line 832
    .line 833
    invoke-virtual {p1}, Ll/zmw;->c()I

    .line 834
    .line 835
    .line 836
    move-result v0

    .line 837
    iget-object v1, p0, Lcom/immomo/momomediaext/MMLiveEngine;->Q:Ll/zmw;

    .line 838
    .line 839
    invoke-virtual {v1}, Ll/zmw;->c()I

    .line 840
    .line 841
    .line 842
    move-result v1

    .line 843
    if-eq v0, v1, :cond_21

    .line 844
    .line 845
    iget-object v0, p0, Lcom/immomo/momomediaext/MMLiveEngine;->Q:Ll/zmw;

    .line 846
    .line 847
    invoke-virtual {p1}, Ll/zmw;->e()I

    .line 848
    .line 849
    .line 850
    move-result v1

    .line 851
    invoke-virtual {p1}, Ll/zmw;->c()I

    .line 852
    .line 853
    .line 854
    move-result v2

    .line 855
    invoke-virtual {v0, v1, v2}, Ll/zmw;->z(II)Ll/zmw;

    .line 856
    .line 857
    .line 858
    :cond_21
    iget-object v0, p0, Lcom/immomo/momomediaext/MMLiveEngine;->Q:Ll/zmw;

    .line 859
    .line 860
    if-eqz v0, :cond_22

    .line 861
    .line 862
    invoke-virtual {p1}, Ll/zmw;->b()I

    .line 863
    .line 864
    .line 865
    move-result v0

    .line 866
    if-eqz v0, :cond_22

    .line 867
    .line 868
    invoke-virtual {p1}, Ll/zmw;->b()I

    .line 869
    .line 870
    .line 871
    move-result v0

    .line 872
    iget-object v1, p0, Lcom/immomo/momomediaext/MMLiveEngine;->Q:Ll/zmw;

    .line 873
    .line 874
    invoke-virtual {v1}, Ll/zmw;->b()I

    .line 875
    .line 876
    .line 877
    move-result v1

    .line 878
    if-eq v0, v1, :cond_22

    .line 879
    .line 880
    iget-object v0, p0, Lcom/immomo/momomediaext/MMLiveEngine;->Q:Ll/zmw;

    .line 881
    .line 882
    invoke-virtual {p1}, Ll/zmw;->b()I

    .line 883
    .line 884
    .line 885
    move-result v1

    .line 886
    invoke-virtual {v0, v1}, Ll/zmw;->y(I)Ll/zmw;

    .line 887
    .line 888
    .line 889
    :cond_22
    iget-object v0, p0, Lcom/immomo/momomediaext/MMLiveEngine;->Q:Ll/zmw;

    .line 890
    .line 891
    if-nez v0, :cond_23

    .line 892
    .line 893
    invoke-static {p1}, Ll/ww5;->b(Ll/zmw;)Ll/zmw;

    .line 894
    .line 895
    .line 896
    move-result-object p1

    .line 897
    iput-object p1, p0, Lcom/immomo/momomediaext/MMLiveEngine;->Q:Ll/zmw;

    .line 898
    .line 899
    :cond_23
    return-void
.end method

.method public P()V
    .locals 1

    .line 1
    const-string v0, "pauseMusic"

    .line 2
    .line 3
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Lcom/immomo/momomediaext/MMLiveEngine;->M([Ljava/lang/Object;)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Lcom/immomo/momomediaext/MMLiveEngine;->o:Ll/gnw;

    .line 11
    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    invoke-virtual {v0}, Ll/gnw;->g()V

    .line 15
    .line 16
    .line 17
    :cond_0
    iget-object p0, p0, Lcom/immomo/momomediaext/MMLiveEngine;->p:Lcom/immomo/momomediaext/a;

    .line 18
    .line 19
    if-eqz p0, :cond_1

    .line 20
    .line 21
    invoke-virtual {p0}, Lcom/immomo/momomediaext/a;->s()V

    .line 22
    .line 23
    .line 24
    :cond_1
    return-void
.end method

.method public P0(Ljava/lang/String;)V
    .locals 1

    .line 1
    const-string v0, "updateChannelKey"

    .line 2
    .line 3
    filled-new-array {v0, p1}, [Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Lcom/immomo/momomediaext/MMLiveEngine;->M([Ljava/lang/Object;)V

    .line 8
    .line 9
    .line 10
    iget-object p0, p0, Lcom/immomo/momomediaext/MMLiveEngine;->p:Lcom/immomo/momomediaext/a;

    .line 11
    .line 12
    if-eqz p0, :cond_0

    .line 13
    .line 14
    invoke-virtual {p0, p1}, Lcom/immomo/momomediaext/a;->c0(Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public Q(ILjava/lang/String;IDDZ)V
    .locals 10

    .line 1
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 2
    .line 3
    .line 4
    move-result-object v1

    .line 5
    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 6
    .line 7
    .line 8
    move-result-object v3

    .line 9
    invoke-static {p4, p5}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 10
    .line 11
    .line 12
    move-result-object v4

    .line 13
    invoke-static/range {p6 .. p7}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 14
    .line 15
    .line 16
    move-result-object v5

    .line 17
    invoke-static/range {p8 .. p8}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 18
    .line 19
    .line 20
    move-result-object v6

    .line 21
    const-string v0, "playEffect"

    .line 22
    .line 23
    move-object v2, p2

    .line 24
    filled-new-array/range {v0 .. v6}, [Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    invoke-static {v0}, Lcom/immomo/momomediaext/MMLiveEngine;->M([Ljava/lang/Object;)V

    .line 29
    .line 30
    .line 31
    iget-object v1, p0, Lcom/immomo/momomediaext/MMLiveEngine;->p:Lcom/immomo/momomediaext/a;

    .line 32
    .line 33
    if-eqz v1, :cond_0

    .line 34
    .line 35
    move v2, p1

    .line 36
    move-object v3, p2

    .line 37
    move v4, p3

    .line 38
    move-wide v5, p4

    .line 39
    move-wide/from16 v7, p6

    .line 40
    .line 41
    move/from16 v9, p8

    .line 42
    .line 43
    invoke-virtual/range {v1 .. v9}, Lcom/immomo/momomediaext/a;->t(ILjava/lang/String;IDDZ)Z

    .line 44
    .line 45
    .line 46
    :cond_0
    return-void
.end method

.method public Q0(Ljava/lang/String;Ljava/lang/String;F)Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/momomediaext/MMLiveEngine;->n:Lcom/immomo/momomediaext/MMLiveSource;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2, p3}, Lcom/immomo/momomediaext/MMLiveSource;->i0(Ljava/lang/String;Ljava/lang/String;F)Z

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

.method public R(Lcom/immomo/momomediaext/utils/MMLivePlayMusicConfig;)V
    .locals 4

    .line 1
    iget-object v0, p1, Lcom/immomo/momomediaext/utils/MMLivePlayMusicConfig;->musicUrl:Ljava/lang/String;

    .line 2
    .line 3
    new-instance v1, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    const-string v2, "loopback"

    .line 6
    .line 7
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    iget-object v2, p1, Lcom/immomo/momomediaext/utils/MMLivePlayMusicConfig;->playMusicType:Lcom/immomo/momomediaext/utils/MMLivePlayMusicConfig$MMLivePlayMusicType;

    .line 11
    .line 12
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    new-instance v2, Ljava/lang/StringBuilder;

    .line 20
    .line 21
    const-string v3, "repeatCount:"

    .line 22
    .line 23
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    iget v3, p1, Lcom/immomo/momomediaext/utils/MMLivePlayMusicConfig;->repeatCount:I

    .line 27
    .line 28
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v2

    .line 35
    const-string v3, "MMLiveEngine playMusic"

    .line 36
    .line 37
    filled-new-array {v3, v0, v1, v2}, [Ljava/lang/Object;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    invoke-static {v0}, Lcom/immomo/momomediaext/MMLiveEngine;->M([Ljava/lang/Object;)V

    .line 42
    .line 43
    .line 44
    iget-object v0, p0, Lcom/immomo/momomediaext/MMLiveEngine;->o:Ll/gnw;

    .line 45
    .line 46
    if-eqz v0, :cond_0

    .line 47
    .line 48
    iget-object v1, p1, Lcom/immomo/momomediaext/utils/MMLivePlayMusicConfig;->musicUrl:Ljava/lang/String;

    .line 49
    .line 50
    invoke-virtual {v0, v1}, Ll/gnw;->m(Ljava/lang/String;)V

    .line 51
    .line 52
    .line 53
    :cond_0
    iget-object p0, p0, Lcom/immomo/momomediaext/MMLiveEngine;->p:Lcom/immomo/momomediaext/a;

    .line 54
    .line 55
    if-eqz p0, :cond_2

    .line 56
    .line 57
    iget-object v0, p1, Lcom/immomo/momomediaext/utils/MMLivePlayMusicConfig;->playMusicType:Lcom/immomo/momomediaext/utils/MMLivePlayMusicConfig$MMLivePlayMusicType;

    .line 58
    .line 59
    sget-object v1, Lcom/immomo/momomediaext/utils/MMLivePlayMusicConfig$MMLivePlayMusicType;->MMLivePlayMusicTypePlayout:Lcom/immomo/momomediaext/utils/MMLivePlayMusicConfig$MMLivePlayMusicType;

    .line 60
    .line 61
    if-ne v0, v1, :cond_1

    .line 62
    .line 63
    const/4 v0, 0x1

    .line 64
    goto :goto_0

    .line 65
    :cond_1
    const/4 v0, 0x0

    .line 66
    :goto_0
    iget-object v1, p1, Lcom/immomo/momomediaext/utils/MMLivePlayMusicConfig;->musicUrl:Ljava/lang/String;

    .line 67
    .line 68
    iget p1, p1, Lcom/immomo/momomediaext/utils/MMLivePlayMusicConfig;->repeatCount:I

    .line 69
    .line 70
    invoke-virtual {p0, v1, v0, p1}, Lcom/immomo/momomediaext/a;->Z(Ljava/lang/String;ZI)V

    .line 71
    .line 72
    .line 73
    :cond_2
    return-void
.end method

.method public S()V
    .locals 3

    .line 1
    const-string v0, "release"

    .line 2
    .line 3
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Lcom/immomo/momomediaext/MMLiveEngine;->M([Ljava/lang/Object;)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Lcom/immomo/momomediaext/MMLiveEngine;->n:Lcom/immomo/momomediaext/MMLiveSource;

    .line 11
    .line 12
    const/4 v1, 0x0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    invoke-virtual {v0}, Lcom/immomo/momomediaext/MMLiveSource;->C()V

    .line 16
    .line 17
    .line 18
    iput-object v1, p0, Lcom/immomo/momomediaext/MMLiveEngine;->n:Lcom/immomo/momomediaext/MMLiveSource;

    .line 19
    .line 20
    :cond_0
    iget-object v0, p0, Lcom/immomo/momomediaext/MMLiveEngine;->o:Ll/gnw;

    .line 21
    .line 22
    if-eqz v0, :cond_1

    .line 23
    .line 24
    invoke-virtual {v0}, Ll/gnw;->n()V

    .line 25
    .line 26
    .line 27
    iput-object v1, p0, Lcom/immomo/momomediaext/MMLiveEngine;->o:Ll/gnw;

    .line 28
    .line 29
    :cond_1
    iget-object v0, p0, Lcom/immomo/momomediaext/MMLiveEngine;->p:Lcom/immomo/momomediaext/a;

    .line 30
    .line 31
    if-eqz v0, :cond_2

    .line 32
    .line 33
    invoke-virtual {v0}, Lcom/immomo/momomediaext/a;->r()V

    .line 34
    .line 35
    .line 36
    iput-object v1, p0, Lcom/immomo/momomediaext/MMLiveEngine;->p:Lcom/immomo/momomediaext/a;

    .line 37
    .line 38
    :cond_2
    iget-object v0, p0, Lcom/immomo/momomediaext/MMLiveEngine;->N:Ljava/lang/Object;

    .line 39
    .line 40
    monitor-enter v0

    .line 41
    :try_start_0
    iget-object v2, p0, Lcom/immomo/momomediaext/MMLiveEngine;->m:Lcom/momo/pub/MomoPipelineModuleRegister;

    .line 42
    .line 43
    if-eqz v2, :cond_3

    .line 44
    .line 45
    invoke-interface {v2}, Lcom/momo/pub/MomoPipelineModuleRegister;->t()V

    .line 46
    .line 47
    .line 48
    iput-object v1, p0, Lcom/immomo/momomediaext/MMLiveEngine;->m:Lcom/momo/pub/MomoPipelineModuleRegister;

    .line 49
    .line 50
    goto :goto_0

    .line 51
    :catchall_0
    move-exception p0

    .line 52
    goto :goto_3

    .line 53
    :cond_3
    :goto_0
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 54
    iget-object v0, p0, Lcom/immomo/momomediaext/MMLiveEngine;->i:Ljava/lang/ref/WeakReference;

    .line 55
    .line 56
    if-eqz v0, :cond_4

    .line 57
    .line 58
    invoke-virtual {v0}, Ljava/lang/ref/Reference;->clear()V

    .line 59
    .line 60
    .line 61
    iput-object v1, p0, Lcom/immomo/momomediaext/MMLiveEngine;->i:Ljava/lang/ref/WeakReference;

    .line 62
    .line 63
    :cond_4
    iget-object v0, p0, Lcom/immomo/momomediaext/MMLiveEngine;->z:Ljava/util/Timer;

    .line 64
    .line 65
    if-eqz v0, :cond_5

    .line 66
    .line 67
    invoke-direct {p0}, Lcom/immomo/momomediaext/MMLiveEngine;->x()V

    .line 68
    .line 69
    .line 70
    const-string v0, "MMLiveEngine"

    .line 71
    .line 72
    const-string v2, "traceLogTimer release."

    .line 73
    .line 74
    invoke-static {v0, v2}, Ll/esx;->a(Ljava/lang/String;Ljava/lang/String;)I

    .line 75
    .line 76
    .line 77
    iget-object v0, p0, Lcom/immomo/momomediaext/MMLiveEngine;->z:Ljava/util/Timer;

    .line 78
    .line 79
    invoke-virtual {v0}, Ljava/util/Timer;->cancel()V

    .line 80
    .line 81
    .line 82
    iput-object v1, p0, Lcom/immomo/momomediaext/MMLiveEngine;->z:Ljava/util/Timer;

    .line 83
    .line 84
    :cond_5
    monitor-enter p0

    .line 85
    :try_start_1
    iget-object v0, p0, Lcom/immomo/momomediaext/MMLiveEngine;->A:Ll/a320;

    .line 86
    .line 87
    if-eqz v0, :cond_6

    .line 88
    .line 89
    iput-object v1, p0, Lcom/immomo/momomediaext/MMLiveEngine;->A:Ll/a320;

    .line 90
    .line 91
    goto :goto_1

    .line 92
    :catchall_1
    move-exception v0

    .line 93
    goto :goto_2

    .line 94
    :cond_6
    :goto_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 95
    iget-object v0, p0, Lcom/immomo/momomediaext/MMLiveEngine;->q:Landroid/os/Handler;

    .line 96
    .line 97
    if-eqz v0, :cond_7

    .line 98
    .line 99
    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 100
    .line 101
    .line 102
    iput-object v1, p0, Lcom/immomo/momomediaext/MMLiveEngine;->q:Landroid/os/Handler;

    .line 103
    .line 104
    :cond_7
    return-void

    .line 105
    :goto_2
    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 106
    throw v0

    .line 107
    :goto_3
    :try_start_3
    monitor-exit v0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 108
    throw p0
.end method

.method public T(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/momomediaext/MMLiveEngine;->n:Lcom/immomo/momomediaext/MMLiveSource;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/immomo/momomediaext/MMLiveSource;->D(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public U(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/momomediaext/MMLiveEngine;->n:Lcom/immomo/momomediaext/MMLiveSource;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2}, Lcom/immomo/momomediaext/MMLiveSource;->E(Ljava/lang/String;Ljava/lang/String;)Z

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

.method public V(Lcom/momo/mcamera/mask/MaskModel;)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "remove3DSticker\uff1a"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-static {v0}, Lcom/immomo/momomediaext/MMLiveEngine;->M([Ljava/lang/Object;)V

    .line 20
    .line 21
    .line 22
    iget-object p0, p0, Lcom/immomo/momomediaext/MMLiveEngine;->n:Lcom/immomo/momomediaext/MMLiveSource;

    .line 23
    .line 24
    if-eqz p0, :cond_0

    .line 25
    .line 26
    invoke-virtual {p0, p1}, Lcom/immomo/momomediaext/MMLiveSource;->F(Lcom/momo/mcamera/mask/MaskModel;)V

    .line 27
    .line 28
    .line 29
    :cond_0
    return-void
.end method

.method public W()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/momomediaext/MMLiveEngine;->n:Lcom/immomo/momomediaext/MMLiveSource;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/immomo/momomediaext/MMLiveSource;->G()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public X()V
    .locals 1

    .line 1
    const-string v0, "resumeMusic"

    .line 2
    .line 3
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Lcom/immomo/momomediaext/MMLiveEngine;->M([Ljava/lang/Object;)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Lcom/immomo/momomediaext/MMLiveEngine;->o:Ll/gnw;

    .line 11
    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    invoke-virtual {v0}, Ll/gnw;->g()V

    .line 15
    .line 16
    .line 17
    :cond_0
    iget-object p0, p0, Lcom/immomo/momomediaext/MMLiveEngine;->p:Lcom/immomo/momomediaext/a;

    .line 18
    .line 19
    if-eqz p0, :cond_1

    .line 20
    .line 21
    invoke-virtual {p0}, Lcom/immomo/momomediaext/a;->u()V

    .line 22
    .line 23
    .line 24
    :cond_1
    return-void
.end method

.method public Y(I)I
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "selectAudioIndex:"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-static {v0}, Lcom/immomo/momomediaext/MMLiveEngine;->M([Ljava/lang/Object;)V

    .line 20
    .line 21
    .line 22
    invoke-direct {p0}, Lcom/immomo/momomediaext/MMLiveEngine;->I()Z

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    if-eqz v0, :cond_0

    .line 27
    .line 28
    iget-object p0, p0, Lcom/immomo/momomediaext/MMLiveEngine;->p:Lcom/immomo/momomediaext/a;

    .line 29
    .line 30
    invoke-virtual {p0, p1}, Lcom/immomo/momomediaext/a;->v(I)I

    .line 31
    .line 32
    .line 33
    move-result p0

    .line 34
    return p0

    .line 35
    :cond_0
    const/4 p0, -0x1

    .line 36
    return p0
.end method

.method public Z([B)I
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/immomo/momomediaext/MMLiveEngine;->I()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Lcom/immomo/momomediaext/MMLiveEngine;->p:Lcom/immomo/momomediaext/a;

    .line 8
    .line 9
    invoke-virtual {p0, p1}, Lcom/immomo/momomediaext/a;->w([B)I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0

    .line 14
    :cond_0
    const/4 p0, -0x1

    .line 15
    return p0
.end method

.method public a0(Z)V
    .locals 2

    .line 1
    const-string v0, "setAllRemoteAudioMute"

    .line 2
    .line 3
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    filled-new-array {v0, v1}, [Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-static {v0}, Lcom/immomo/momomediaext/MMLiveEngine;->M([Ljava/lang/Object;)V

    .line 12
    .line 13
    .line 14
    iget-object p0, p0, Lcom/immomo/momomediaext/MMLiveEngine;->p:Lcom/immomo/momomediaext/a;

    .line 15
    .line 16
    if-eqz p0, :cond_0

    .line 17
    .line 18
    invoke-virtual {p0, p1}, Lcom/immomo/momomediaext/a;->x(Z)V

    .line 19
    .line 20
    .line 21
    :cond_0
    return-void
.end method

.method public b0(Z)V
    .locals 2

    .line 1
    const-string v0, "setAllRemoteVideoMute"

    .line 2
    .line 3
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    filled-new-array {v0, v1}, [Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-static {v0}, Lcom/immomo/momomediaext/MMLiveEngine;->M([Ljava/lang/Object;)V

    .line 12
    .line 13
    .line 14
    iget-object p0, p0, Lcom/immomo/momomediaext/MMLiveEngine;->p:Lcom/immomo/momomediaext/a;

    .line 15
    .line 16
    if-eqz p0, :cond_0

    .line 17
    .line 18
    invoke-virtual {p0, p1}, Lcom/immomo/momomediaext/a;->y(Z)V

    .line 19
    .line 20
    .line 21
    :cond_0
    return-void
.end method

.method public c0(Lcom/immomo/momomediaext/MomoMediaConstants$MMLiveAudioEffectPreset;)I
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "setAudioEffectPreset:"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-static {v0}, Lcom/immomo/momomediaext/MMLiveEngine;->M([Ljava/lang/Object;)V

    .line 20
    .line 21
    .line 22
    invoke-direct {p0}, Lcom/immomo/momomediaext/MMLiveEngine;->I()Z

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    if-eqz v0, :cond_0

    .line 27
    .line 28
    iget-object p0, p0, Lcom/immomo/momomediaext/MMLiveEngine;->p:Lcom/immomo/momomediaext/a;

    .line 29
    .line 30
    invoke-virtual {p1}, Lcom/immomo/momomediaext/MomoMediaConstants$MMLiveAudioEffectPreset;->getValue()I

    .line 31
    .line 32
    .line 33
    move-result p1

    .line 34
    invoke-virtual {p0, p1}, Lcom/immomo/momomediaext/a;->z(I)I

    .line 35
    .line 36
    .line 37
    move-result p0

    .line 38
    return p0

    .line 39
    :cond_0
    const/4 p0, -0x1

    .line 40
    return p0
.end method

.method public d0(Lcom/immomo/momomediaext/MomoMediaConstants$MMLiveAudioMixingDualMonoMode;)I
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "setAudioMixingDualMonoMode:"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-static {v0}, Lcom/immomo/momomediaext/MMLiveEngine;->M([Ljava/lang/Object;)V

    .line 20
    .line 21
    .line 22
    invoke-direct {p0}, Lcom/immomo/momomediaext/MMLiveEngine;->I()Z

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    if-eqz v0, :cond_0

    .line 27
    .line 28
    iget-object p0, p0, Lcom/immomo/momomediaext/MMLiveEngine;->p:Lcom/immomo/momomediaext/a;

    .line 29
    .line 30
    invoke-virtual {p1}, Lcom/immomo/momomediaext/MomoMediaConstants$MMLiveAudioMixingDualMonoMode;->getValue()I

    .line 31
    .line 32
    .line 33
    move-result p1

    .line 34
    invoke-virtual {p0, p1}, Lcom/immomo/momomediaext/a;->A(I)I

    .line 35
    .line 36
    .line 37
    move-result p0

    .line 38
    return p0

    .line 39
    :cond_0
    const/4 p0, -0x1

    .line 40
    return p0
.end method

.method public e0(Lcom/immomo/momomediaext/MomoMediaConstants$BEAUTY_TYPE;)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "setBeautyType:"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-static {v0}, Lcom/immomo/momomediaext/MMLiveEngine;->M([Ljava/lang/Object;)V

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Lcom/immomo/momomediaext/MMLiveEngine;->n:Lcom/immomo/momomediaext/MMLiveSource;

    .line 23
    .line 24
    if-eqz v0, :cond_0

    .line 25
    .line 26
    invoke-virtual {v0, p1}, Lcom/immomo/momomediaext/MMLiveSource;->J(Lcom/immomo/momomediaext/MomoMediaConstants$BEAUTY_TYPE;)V

    .line 27
    .line 28
    .line 29
    iput-object p1, p0, Lcom/immomo/momomediaext/MMLiveEngine;->E:Lcom/immomo/momomediaext/MomoMediaConstants$BEAUTY_TYPE;

    .line 30
    .line 31
    :cond_0
    return-void
.end method

.method public f0(Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLiveClientRole;)I
    .locals 1

    .line 1
    const-string v0, "setClientRole"

    .line 2
    .line 3
    filled-new-array {v0, p1}, [Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Lcom/immomo/momomediaext/MMLiveEngine;->M([Ljava/lang/Object;)V

    .line 8
    .line 9
    .line 10
    iget-object p0, p0, Lcom/immomo/momomediaext/MMLiveEngine;->p:Lcom/immomo/momomediaext/a;

    .line 11
    .line 12
    if-eqz p0, :cond_0

    .line 13
    .line 14
    invoke-virtual {p0, p1}, Lcom/immomo/momomediaext/a;->B(Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLiveClientRole;)I

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    return p0

    .line 19
    :cond_0
    const/4 p0, -0x1

    .line 20
    return p0
.end method

.method public g0(Z)V
    .locals 2

    .line 1
    const-string v0, "setEnableAudio"

    .line 2
    .line 3
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    filled-new-array {v0, v1}, [Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-static {v0}, Lcom/immomo/momomediaext/MMLiveEngine;->M([Ljava/lang/Object;)V

    .line 12
    .line 13
    .line 14
    iput-boolean p1, p0, Lcom/immomo/momomediaext/MMLiveEngine;->w:Z

    .line 15
    .line 16
    iget-object p0, p0, Lcom/immomo/momomediaext/MMLiveEngine;->p:Lcom/immomo/momomediaext/a;

    .line 17
    .line 18
    if-eqz p0, :cond_0

    .line 19
    .line 20
    invoke-virtual {p0, p1}, Lcom/immomo/momomediaext/a;->D(Z)V

    .line 21
    .line 22
    .line 23
    :cond_0
    return-void
.end method

.method public h0(Lcom/immomo/momomediaext/utils/MMLiveAudioVolumeConfig;)V
    .locals 4

    .line 1
    iget v0, p1, Lcom/immomo/momomediaext/utils/MMLiveAudioVolumeConfig;->interval:I

    .line 2
    .line 3
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget v1, p1, Lcom/immomo/momomediaext/utils/MMLiveAudioVolumeConfig;->smooth:I

    .line 8
    .line 9
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    iget v2, p1, Lcom/immomo/momomediaext/utils/MMLiveAudioVolumeConfig;->report_vad:I

    .line 14
    .line 15
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    const-string v3, "enableAudioVolumeIndication"

    .line 20
    .line 21
    filled-new-array {v3, v0, v1, v2}, [Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-static {v0}, Lcom/immomo/momomediaext/MMLiveEngine;->M([Ljava/lang/Object;)V

    .line 26
    .line 27
    .line 28
    iget-object p0, p0, Lcom/immomo/momomediaext/MMLiveEngine;->p:Lcom/immomo/momomediaext/a;

    .line 29
    .line 30
    if-eqz p0, :cond_0

    .line 31
    .line 32
    iget v0, p1, Lcom/immomo/momomediaext/utils/MMLiveAudioVolumeConfig;->interval:I

    .line 33
    .line 34
    iget v1, p1, Lcom/immomo/momomediaext/utils/MMLiveAudioVolumeConfig;->smooth:I

    .line 35
    .line 36
    iget p1, p1, Lcom/immomo/momomediaext/utils/MMLiveAudioVolumeConfig;->report_vad:I

    .line 37
    .line 38
    invoke-virtual {p0, v0, v1, p1}, Lcom/immomo/momomediaext/a;->h(III)V

    .line 39
    .line 40
    .line 41
    :cond_0
    return-void
.end method

.method public i0(Z)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "enableInEarMonitoring:"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-static {v0}, Lcom/immomo/momomediaext/MMLiveEngine;->M([Ljava/lang/Object;)V

    .line 20
    .line 21
    .line 22
    iput-boolean p1, p0, Lcom/immomo/momomediaext/MMLiveEngine;->t:Z

    .line 23
    .line 24
    invoke-direct {p0}, Lcom/immomo/momomediaext/MMLiveEngine;->I()Z

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    if-eqz v0, :cond_0

    .line 29
    .line 30
    iget-object v0, p0, Lcom/immomo/momomediaext/MMLiveEngine;->J:Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;

    .line 31
    .line 32
    invoke-virtual {p0, v0}, Lcom/immomo/momomediaext/MMLiveEngine;->K(Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;)Z

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    if-eqz v0, :cond_0

    .line 37
    .line 38
    iget-object p0, p0, Lcom/immomo/momomediaext/MMLiveEngine;->p:Lcom/immomo/momomediaext/a;

    .line 39
    .line 40
    invoke-virtual {p0, p1}, Lcom/immomo/momomediaext/a;->j(Z)V

    .line 41
    .line 42
    .line 43
    return-void

    .line 44
    :cond_0
    iget-object p0, p0, Lcom/immomo/momomediaext/MMLiveEngine;->n:Lcom/immomo/momomediaext/MMLiveSource;

    .line 45
    .line 46
    if-eqz p0, :cond_1

    .line 47
    .line 48
    invoke-virtual {p0, p1}, Lcom/immomo/momomediaext/MMLiveSource;->Y(Z)V

    .line 49
    .line 50
    .line 51
    :cond_1
    return-void
.end method

.method public j0(Z)V
    .locals 2

    .line 1
    const-string v0, "setEnableSpeakerphone"

    .line 2
    .line 3
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    filled-new-array {v0, v1}, [Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-static {v0}, Lcom/immomo/momomediaext/MMLiveEngine;->M([Ljava/lang/Object;)V

    .line 12
    .line 13
    .line 14
    iget-object p0, p0, Lcom/immomo/momomediaext/MMLiveEngine;->p:Lcom/immomo/momomediaext/a;

    .line 15
    .line 16
    if-eqz p0, :cond_0

    .line 17
    .line 18
    invoke-virtual {p0, p1}, Lcom/immomo/momomediaext/a;->E(Z)V

    .line 19
    .line 20
    .line 21
    :cond_0
    return-void
.end method

.method public k0(Z)V
    .locals 2

    .line 1
    const-string v0, "enableStreamReplace"

    .line 2
    .line 3
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    filled-new-array {v0, v1}, [Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-static {v0}, Lcom/immomo/momomediaext/MMLiveEngine;->M([Ljava/lang/Object;)V

    .line 12
    .line 13
    .line 14
    iput-boolean p1, p0, Lcom/immomo/momomediaext/MMLiveEngine;->u:Z

    .line 15
    .line 16
    return-void
.end method

.method public l0(Z)V
    .locals 2

    .line 1
    const-string v0, "setEnableVideo"

    .line 2
    .line 3
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    filled-new-array {v0, v1}, [Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-static {v0}, Lcom/immomo/momomediaext/MMLiveEngine;->M([Ljava/lang/Object;)V

    .line 12
    .line 13
    .line 14
    iput-boolean p1, p0, Lcom/immomo/momomediaext/MMLiveEngine;->v:Z

    .line 15
    .line 16
    iget-object p0, p0, Lcom/immomo/momomediaext/MMLiveEngine;->p:Lcom/immomo/momomediaext/a;

    .line 17
    .line 18
    if-eqz p0, :cond_0

    .line 19
    .line 20
    invoke-virtual {p0, p1}, Lcom/immomo/momomediaext/a;->F(Z)V

    .line 21
    .line 22
    .line 23
    :cond_0
    return-void
.end method

.method public m0(F)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/momomediaext/MMLiveEngine;->n:Lcom/immomo/momomediaext/MMLiveSource;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/immomo/momomediaext/MMLiveSource;->S(F)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public n0(Lcom/immomo/momomediaext/utils/MMLiveTranscoding;)V
    .locals 1

    .line 1
    const-string v0, "setLiveTranscoding V2"

    .line 2
    .line 3
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Lcom/immomo/momomediaext/MMLiveEngine;->M([Ljava/lang/Object;)V

    .line 8
    .line 9
    .line 10
    iput-object p1, p0, Lcom/immomo/momomediaext/MMLiveEngine;->L:Lcom/immomo/momomediaext/utils/MMLiveTranscoding;

    .line 11
    .line 12
    iget-object p0, p0, Lcom/immomo/momomediaext/MMLiveEngine;->p:Lcom/immomo/momomediaext/a;

    .line 13
    .line 14
    if-eqz p0, :cond_0

    .line 15
    .line 16
    invoke-virtual {p0, p1}, Lcom/immomo/momomediaext/a;->H(Lcom/immomo/momomediaext/utils/MMLiveTranscoding;)V

    .line 17
    .line 18
    .line 19
    :cond_0
    return-void
.end method

.method public o0(Z)V
    .locals 2

    .line 1
    const-string v0, "setLocalAudioMute"

    .line 2
    .line 3
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    filled-new-array {v0, v1}, [Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-static {v0}, Lcom/immomo/momomediaext/MMLiveEngine;->M([Ljava/lang/Object;)V

    .line 12
    .line 13
    .line 14
    iput-boolean p1, p0, Lcom/immomo/momomediaext/MMLiveEngine;->y:Z

    .line 15
    .line 16
    iget-object v0, p0, Lcom/immomo/momomediaext/MMLiveEngine;->p:Lcom/immomo/momomediaext/a;

    .line 17
    .line 18
    if-eqz v0, :cond_0

    .line 19
    .line 20
    invoke-virtual {v0, p1}, Lcom/immomo/momomediaext/a;->I(Z)V

    .line 21
    .line 22
    .line 23
    :cond_0
    iget-object p0, p0, Lcom/immomo/momomediaext/MMLiveEngine;->o:Ll/gnw;

    .line 24
    .line 25
    if-eqz p0, :cond_1

    .line 26
    .line 27
    invoke-virtual {p0, p1}, Ll/gnw;->j(Z)V

    .line 28
    .line 29
    .line 30
    :cond_1
    return-void
.end method

.method public p0(Z)V
    .locals 2

    .line 1
    const-string v0, "setLocalVideoMute"

    .line 2
    .line 3
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    filled-new-array {v0, v1}, [Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-static {v0}, Lcom/immomo/momomediaext/MMLiveEngine;->M([Ljava/lang/Object;)V

    .line 12
    .line 13
    .line 14
    iput-boolean p1, p0, Lcom/immomo/momomediaext/MMLiveEngine;->x:Z

    .line 15
    .line 16
    iget-object p0, p0, Lcom/immomo/momomediaext/MMLiveEngine;->p:Lcom/immomo/momomediaext/a;

    .line 17
    .line 18
    if-eqz p0, :cond_0

    .line 19
    .line 20
    invoke-virtual {p0, p1}, Lcom/immomo/momomediaext/a;->K(Z)V

    .line 21
    .line 22
    .line 23
    :cond_0
    return-void
.end method

.method public q0(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/momomediaext/MMLiveEngine;->n:Lcom/immomo/momomediaext/MMLiveSource;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/immomo/momomediaext/MMLiveSource;->U(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public r(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I
    .locals 1

    .line 1
    const-string v0, "accrossOtherRoom"

    .line 2
    .line 3
    filled-new-array {v0, p1, p2, p3}, [Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Lcom/immomo/momomediaext/MMLiveEngine;->M([Ljava/lang/Object;)V

    .line 8
    .line 9
    .line 10
    iget-object p0, p0, Lcom/immomo/momomediaext/MMLiveEngine;->p:Lcom/immomo/momomediaext/a;

    .line 11
    .line 12
    if-eqz p0, :cond_0

    .line 13
    .line 14
    invoke-virtual {p0, p1, p2, p3}, Lcom/immomo/momomediaext/a;->a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    return p0

    .line 19
    :cond_0
    const/4 p0, -0x1

    .line 20
    return p0
.end method

.method public r0(F)V
    .locals 2

    .line 1
    const-string v0, "MMLiveEngine setMusicVolume"

    .line 2
    .line 3
    invoke-static {p1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    filled-new-array {v0, v1}, [Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-static {v0}, Lcom/immomo/momomediaext/MMLiveEngine;->M([Ljava/lang/Object;)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Lcom/immomo/momomediaext/MMLiveEngine;->n:Lcom/immomo/momomediaext/MMLiveSource;

    .line 15
    .line 16
    if-eqz v0, :cond_0

    .line 17
    .line 18
    invoke-virtual {v0, p1}, Lcom/immomo/momomediaext/MMLiveSource;->V(F)V

    .line 19
    .line 20
    .line 21
    :cond_0
    iput p1, p0, Lcom/immomo/momomediaext/MMLiveEngine;->d:F

    .line 22
    .line 23
    iget-object p0, p0, Lcom/immomo/momomediaext/MMLiveEngine;->p:Lcom/immomo/momomediaext/a;

    .line 24
    .line 25
    if-eqz p0, :cond_1

    .line 26
    .line 27
    const/high16 v0, 0x42c80000    # 100.0f

    .line 28
    .line 29
    mul-float/2addr p1, v0

    .line 30
    float-to-int p1, p1

    .line 31
    invoke-virtual {p0, p1}, Lcom/immomo/momomediaext/a;->M(I)V

    .line 32
    .line 33
    .line 34
    :cond_1
    return-void
.end method

.method public s(Ljava/lang/String;Lcom/momo/mcamera/mask/MaskModel;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/momomediaext/MMLiveEngine;->n:Lcom/immomo/momomediaext/MMLiveSource;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2}, Lcom/immomo/momomediaext/MMLiveSource;->p(Ljava/lang/String;Lcom/momo/mcamera/mask/MaskModel;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public s0(Ljava/lang/String;)V
    .locals 1

    .line 1
    const-string v0, "MMLiveEngine setParameters"

    .line 2
    .line 3
    filled-new-array {v0, p1}, [Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Lcom/immomo/momomediaext/MMLiveEngine;->M([Ljava/lang/Object;)V

    .line 8
    .line 9
    .line 10
    const-string v0, "setParameters"

    .line 11
    .line 12
    filled-new-array {v0, p1}, [Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-static {v0}, Lcom/immomo/momomediaext/MMLiveEngine;->M([Ljava/lang/Object;)V

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Lcom/immomo/momomediaext/MMLiveEngine;->p:Lcom/immomo/momomediaext/a;

    .line 20
    .line 21
    if-eqz v0, :cond_0

    .line 22
    .line 23
    invoke-virtual {v0, p1}, Lcom/immomo/momomediaext/a;->P(Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    return-void

    .line 27
    :cond_0
    iget-object p0, p0, Lcom/immomo/momomediaext/MMLiveEngine;->U:Ljava/util/List;

    .line 28
    .line 29
    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public t(Lcom/momo/mcamera/mask/MaskModel;)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "add3DSticker\uff1a"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-static {v0}, Lcom/immomo/momomediaext/MMLiveEngine;->M([Ljava/lang/Object;)V

    .line 20
    .line 21
    .line 22
    iget-object p0, p0, Lcom/immomo/momomediaext/MMLiveEngine;->n:Lcom/immomo/momomediaext/MMLiveSource;

    .line 23
    .line 24
    if-eqz p0, :cond_0

    .line 25
    .line 26
    invoke-virtual {p0, p1}, Lcom/immomo/momomediaext/MMLiveSource;->q(Lcom/momo/mcamera/mask/MaskModel;)V

    .line 27
    .line 28
    .line 29
    :cond_0
    return-void
.end method

.method public t0(Ll/enw;)V
    .locals 3

    .line 1
    iput-object p1, p0, Lcom/immomo/momomediaext/MMLiveEngine;->s:Ll/enw;

    .line 2
    .line 3
    iget-object p1, p0, Lcom/immomo/momomediaext/MMLiveEngine;->p:Lcom/immomo/momomediaext/a;

    .line 4
    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Lcom/immomo/momomediaext/MMLiveEngine;->m0:Lcom/immomo/mediacore/coninf/MRtcEventHandler;

    .line 8
    .line 9
    iget-object v1, p0, Lcom/immomo/momomediaext/MMLiveEngine;->o0:Ll/ebl0;

    .line 10
    .line 11
    iget-object v2, p0, Lcom/immomo/momomediaext/MMLiveEngine;->n0:Ll/gkl0;

    .line 12
    .line 13
    invoke-virtual {p1, v0, v1, v2}, Lcom/immomo/momomediaext/a;->W(Lcom/immomo/mediacore/coninf/MRtcEventHandler;Ll/ebl0;Ll/gkl0;)V

    .line 14
    .line 15
    .line 16
    iget-object p1, p0, Lcom/immomo/momomediaext/MMLiveEngine;->p:Lcom/immomo/momomediaext/a;

    .line 17
    .line 18
    iget-object p0, p0, Lcom/immomo/momomediaext/MMLiveEngine;->k0:Ll/kod0;

    .line 19
    .line 20
    invoke-virtual {p1, p0}, Lcom/immomo/momomediaext/a;->V(Ll/kod0;)V

    .line 21
    .line 22
    .line 23
    :cond_0
    return-void
.end method

.method public u0(F)V
    .locals 2

    .line 1
    iput p1, p0, Lcom/immomo/momomediaext/MMLiveEngine;->b:F

    .line 2
    .line 3
    new-instance v0, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    const-string v1, "setRecordVolume volume:"

    .line 6
    .line 7
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-static {v0}, Lcom/immomo/momomediaext/MMLiveEngine;->M([Ljava/lang/Object;)V

    .line 22
    .line 23
    .line 24
    iget-object p0, p0, Lcom/immomo/momomediaext/MMLiveEngine;->p:Lcom/immomo/momomediaext/a;

    .line 25
    .line 26
    if-eqz p0, :cond_0

    .line 27
    .line 28
    invoke-virtual {p0, p1}, Lcom/immomo/momomediaext/a;->L(F)V

    .line 29
    .line 30
    .line 31
    :cond_0
    return-void
.end method

.method public v(Z)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "enablePusherStatisticWatch"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-static {v0}, Lcom/immomo/momomediaext/MMLiveEngine;->M([Ljava/lang/Object;)V

    .line 20
    .line 21
    .line 22
    if-eqz p1, :cond_0

    .line 23
    .line 24
    new-instance p1, Lcom/immomo/momomediaext/MMLiveEngine$t;

    .line 25
    .line 26
    invoke-direct {p1, p0}, Lcom/immomo/momomediaext/MMLiveEngine$t;-><init>(Lcom/immomo/momomediaext/MMLiveEngine;)V

    .line 27
    .line 28
    .line 29
    iput-object p1, p0, Lcom/immomo/momomediaext/MMLiveEngine;->t0:Ll/fpf0;

    .line 30
    .line 31
    return-void

    .line 32
    :cond_0
    const/4 p1, 0x0

    .line 33
    iput-object p1, p0, Lcom/immomo/momomediaext/MMLiveEngine;->t0:Ll/fpf0;

    .line 34
    .line 35
    return-void
.end method

.method public v0(IZ)V
    .locals 3

    .line 1
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {p2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    const-string v2, "setRemoteAudioStreamMute"

    .line 10
    .line 11
    filled-new-array {v2, v0, v1}, [Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-static {v0}, Lcom/immomo/momomediaext/MMLiveEngine;->M([Ljava/lang/Object;)V

    .line 16
    .line 17
    .line 18
    :try_start_0
    iget-object v0, p0, Lcom/immomo/momomediaext/MMLiveEngine;->r:Lcom/immomo/momomediaext/utils/MMLiveRoomParams;

    .line 19
    .line 20
    if-eqz v0, :cond_0

    .line 21
    .line 22
    iget-object v0, v0, Lcom/immomo/momomediaext/utils/MMLiveRoomParams;->userId:Ljava/lang/String;

    .line 23
    .line 24
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    if-ne v0, p1, :cond_0

    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_0
    iget-object p0, p0, Lcom/immomo/momomediaext/MMLiveEngine;->p:Lcom/immomo/momomediaext/a;

    .line 36
    .line 37
    if-eqz p0, :cond_1

    .line 38
    .line 39
    invoke-virtual {p0, p1, p2}, Lcom/immomo/momomediaext/a;->R(IZ)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 40
    .line 41
    .line 42
    :catch_0
    :cond_1
    :goto_0
    return-void
.end method

.method public w(Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;Lcom/immomo/momomediaext/utils/MMLiveRoomParams;Lcom/immomo/momomediaext/utils/MMLiveTranscoding;)I
    .locals 8

    .line 1
    const-string v0, ""

    .line 2
    .line 3
    if-nez p1, :cond_0

    .line 4
    .line 5
    move-object v1, v0

    .line 6
    goto :goto_0

    .line 7
    :cond_0
    invoke-virtual {p1}, Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;->toString()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    :goto_0
    if-nez p2, :cond_1

    .line 12
    .line 13
    goto :goto_1

    .line 14
    :cond_1
    invoke-virtual {p2}, Lcom/immomo/momomediaext/utils/MMLiveRoomParams;->toString()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    :goto_1
    if-nez p3, :cond_2

    .line 19
    .line 20
    const-string v2, "transcodeing is null"

    .line 21
    .line 22
    goto :goto_2

    .line 23
    :cond_2
    new-instance v2, Ljava/lang/StringBuilder;

    .line 24
    .line 25
    const-string v3, "transcodeing:"

    .line 26
    .line 27
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {p3}, Lcom/immomo/momomediaext/utils/MMLiveTranscoding;->toString2()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v3

    .line 34
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 35
    .line 36
    .line 37
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v2

    .line 41
    :goto_2
    const-string v3, "enterRoom"

    .line 42
    .line 43
    filled-new-array {v3, v1, v0, v2}, [Ljava/lang/Object;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    invoke-static {v0}, Lcom/immomo/momomediaext/MMLiveEngine;->M([Ljava/lang/Object;)V

    .line 48
    .line 49
    .line 50
    iget-boolean v0, p2, Lcom/immomo/momomediaext/utils/MMLiveRoomParams;->onlyAudio:Z

    .line 51
    .line 52
    const/4 v1, 0x0

    .line 53
    const/4 v2, 0x1

    .line 54
    if-eqz v0, :cond_3

    .line 55
    .line 56
    invoke-virtual {p0, v2}, Lcom/immomo/momomediaext/MMLiveEngine;->p0(Z)V

    .line 57
    .line 58
    .line 59
    invoke-virtual {p0, v1}, Lcom/immomo/momomediaext/MMLiveEngine;->l0(Z)V

    .line 60
    .line 61
    .line 62
    :cond_3
    iput-object p3, p0, Lcom/immomo/momomediaext/MMLiveEngine;->L:Lcom/immomo/momomediaext/utils/MMLiveTranscoding;

    .line 63
    .line 64
    iput-object p1, p0, Lcom/immomo/momomediaext/MMLiveEngine;->k:Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;

    .line 65
    .line 66
    iput-object p2, p0, Lcom/immomo/momomediaext/MMLiveEngine;->r:Lcom/immomo/momomediaext/utils/MMLiveRoomParams;

    .line 67
    .line 68
    iget-object v0, p0, Lcom/immomo/momomediaext/MMLiveEngine;->p:Lcom/immomo/momomediaext/a;

    .line 69
    .line 70
    if-eqz v0, :cond_4

    .line 71
    .line 72
    const-string v0, "rtc not null , leaveRoom first"

    .line 73
    .line 74
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 75
    .line 76
    .line 77
    move-result-object v0

    .line 78
    invoke-static {v0}, Lcom/immomo/momomediaext/MMLiveEngine;->M([Ljava/lang/Object;)V

    .line 79
    .line 80
    .line 81
    iget-object v0, p0, Lcom/immomo/momomediaext/MMLiveEngine;->p:Lcom/immomo/momomediaext/a;

    .line 82
    .line 83
    invoke-virtual {v0}, Lcom/immomo/momomediaext/a;->r()V

    .line 84
    .line 85
    .line 86
    const/4 v0, 0x0

    .line 87
    iput-object v0, p0, Lcom/immomo/momomediaext/MMLiveEngine;->p:Lcom/immomo/momomediaext/a;

    .line 88
    .line 89
    :cond_4
    iget-object v0, p0, Lcom/immomo/momomediaext/MMLiveEngine;->r:Lcom/immomo/momomediaext/utils/MMLiveRoomParams;

    .line 90
    .line 91
    iget-object v0, v0, Lcom/immomo/momomediaext/utils/MMLiveRoomParams;->linkType:Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;

    .line 92
    .line 93
    sget-object v4, Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;->MMLiveTypeConfWL:Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;

    .line 94
    .line 95
    const/4 v5, -0x2

    .line 96
    const/16 v6, 0x64

    .line 97
    .line 98
    if-eq v0, v4, :cond_11

    .line 99
    .line 100
    sget-object v4, Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;->MMLiveTypeConfTX:Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;

    .line 101
    .line 102
    if-eq v0, v4, :cond_11

    .line 103
    .line 104
    sget-object v4, Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;->MMLiveTypeConfMM:Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;

    .line 105
    .line 106
    if-ne v0, v4, :cond_5

    .line 107
    .line 108
    goto/16 :goto_6

    .line 109
    .line 110
    :cond_5
    sget-object v3, Lcom/immomo/momomediaext/MMLiveEngine$v;->a:[I

    .line 111
    .line 112
    invoke-virtual {v0}, Ljava/lang/Enum;->ordinal()I

    .line 113
    .line 114
    .line 115
    move-result v0

    .line 116
    aget v0, v3, v0

    .line 117
    .line 118
    if-eq v0, v2, :cond_6

    .line 119
    .line 120
    const/4 v3, 0x2

    .line 121
    if-eq v0, v3, :cond_6

    .line 122
    .line 123
    goto :goto_3

    .line 124
    :cond_6
    new-instance v0, Lcom/immomo/momomediaext/a;

    .line 125
    .line 126
    iget-object v3, p0, Lcom/immomo/momomediaext/MMLiveEngine;->m:Lcom/momo/pub/MomoPipelineModuleRegister;

    .line 127
    .line 128
    iget-object v4, p0, Lcom/immomo/momomediaext/MMLiveEngine;->j:Lcom/immomo/momomediaext/utils/MMLiveUserConfig;

    .line 129
    .line 130
    iget-object v7, p0, Lcom/immomo/momomediaext/MMLiveEngine;->r:Lcom/immomo/momomediaext/utils/MMLiveRoomParams;

    .line 131
    .line 132
    iget-object v7, v7, Lcom/immomo/momomediaext/utils/MMLiveRoomParams;->linkType:Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;

    .line 133
    .line 134
    invoke-direct {v0, v3, v4, v7}, Lcom/immomo/momomediaext/a;-><init>(Lcom/momo/pub/MomoPipelineModuleRegister;Lcom/immomo/momomediaext/utils/MMLiveUserConfig;Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;)V

    .line 135
    .line 136
    .line 137
    iput-object v0, p0, Lcom/immomo/momomediaext/MMLiveEngine;->p:Lcom/immomo/momomediaext/a;

    .line 138
    .line 139
    :goto_3
    iget-object v0, p0, Lcom/immomo/momomediaext/MMLiveEngine;->r:Lcom/immomo/momomediaext/utils/MMLiveRoomParams;

    .line 140
    .line 141
    iget-object v0, v0, Lcom/immomo/momomediaext/utils/MMLiveRoomParams;->linkType:Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;

    .line 142
    .line 143
    iput-object v0, p0, Lcom/immomo/momomediaext/MMLiveEngine;->J:Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;

    .line 144
    .line 145
    invoke-direct {p0}, Lcom/immomo/momomediaext/MMLiveEngine;->H()V

    .line 146
    .line 147
    .line 148
    const v0, 0xf4241

    .line 149
    .line 150
    .line 151
    :try_start_0
    iget-object v3, p0, Lcom/immomo/momomediaext/MMLiveEngine;->p:Lcom/immomo/momomediaext/a;

    .line 152
    .line 153
    if-eqz v3, :cond_e

    .line 154
    .line 155
    iget-object v3, p0, Lcom/immomo/momomediaext/MMLiveEngine;->n:Lcom/immomo/momomediaext/MMLiveSource;

    .line 156
    .line 157
    if-eqz v3, :cond_7

    .line 158
    .line 159
    invoke-virtual {v3, v1}, Lcom/immomo/momomediaext/MMLiveSource;->Y(Z)V

    .line 160
    .line 161
    .line 162
    :cond_7
    iget-object v3, p0, Lcom/immomo/momomediaext/MMLiveEngine;->p:Lcom/immomo/momomediaext/a;

    .line 163
    .line 164
    iget-object v4, p0, Lcom/immomo/momomediaext/MMLiveEngine;->W:Lcom/immomo/mediacore/coninf/MRtcChannelHandler;

    .line 165
    .line 166
    invoke-virtual {v3, v4}, Lcom/immomo/momomediaext/a;->c(Lcom/immomo/mediacore/coninf/MRtcChannelHandler;)V

    .line 167
    .line 168
    .line 169
    iget-object v3, p0, Lcom/immomo/momomediaext/MMLiveEngine;->p:Lcom/immomo/momomediaext/a;

    .line 170
    .line 171
    iget-object v4, p0, Lcom/immomo/momomediaext/MMLiveEngine;->X:Lcom/immomo/mediacore/coninf/MRtcTokenWillExpireHander;

    .line 172
    .line 173
    invoke-virtual {v3, v4}, Lcom/immomo/momomediaext/a;->f(Lcom/immomo/mediacore/coninf/MRtcTokenWillExpireHander;)V

    .line 174
    .line 175
    .line 176
    iget-object v3, p0, Lcom/immomo/momomediaext/MMLiveEngine;->p:Lcom/immomo/momomediaext/a;

    .line 177
    .line 178
    iget-object v4, p0, Lcom/immomo/momomediaext/MMLiveEngine;->Y:Lcom/immomo/mediacore/coninf/MRtcReceiveSeiHandler;

    .line 179
    .line 180
    invoke-virtual {v3, v4}, Lcom/immomo/momomediaext/a;->g(Lcom/immomo/mediacore/coninf/MRtcReceiveSeiHandler;)V

    .line 181
    .line 182
    .line 183
    iget-object v3, p0, Lcom/immomo/momomediaext/MMLiveEngine;->p:Lcom/immomo/momomediaext/a;

    .line 184
    .line 185
    iget-object v4, p0, Lcom/immomo/momomediaext/MMLiveEngine;->b0:Lcom/immomo/mediacore/coninf/MRtcPusherHandler;

    .line 186
    .line 187
    invoke-virtual {v3, v4}, Lcom/immomo/momomediaext/a;->e(Lcom/immomo/mediacore/coninf/MRtcPusherHandler;)V

    .line 188
    .line 189
    .line 190
    iget-object v3, p0, Lcom/immomo/momomediaext/MMLiveEngine;->p:Lcom/immomo/momomediaext/a;

    .line 191
    .line 192
    iget-object v4, p0, Lcom/immomo/momomediaext/MMLiveEngine;->a0:Lcom/immomo/mediacore/coninf/MRtcAudioHandler;

    .line 193
    .line 194
    invoke-virtual {v3, v4}, Lcom/immomo/momomediaext/a;->b(Lcom/immomo/mediacore/coninf/MRtcAudioHandler;)V

    .line 195
    .line 196
    .line 197
    iget-object v3, p0, Lcom/immomo/momomediaext/MMLiveEngine;->p:Lcom/immomo/momomediaext/a;

    .line 198
    .line 199
    iget-object v4, p0, Lcom/immomo/momomediaext/MMLiveEngine;->m0:Lcom/immomo/mediacore/coninf/MRtcEventHandler;

    .line 200
    .line 201
    iget-object v5, p0, Lcom/immomo/momomediaext/MMLiveEngine;->o0:Ll/ebl0;

    .line 202
    .line 203
    iget-object v6, p0, Lcom/immomo/momomediaext/MMLiveEngine;->n0:Ll/gkl0;

    .line 204
    .line 205
    invoke-virtual {v3, v4, v5, v6}, Lcom/immomo/momomediaext/a;->W(Lcom/immomo/mediacore/coninf/MRtcEventHandler;Ll/ebl0;Ll/gkl0;)V

    .line 206
    .line 207
    .line 208
    iget-object v3, p0, Lcom/immomo/momomediaext/MMLiveEngine;->p:Lcom/immomo/momomediaext/a;

    .line 209
    .line 210
    iget-object v4, p0, Lcom/immomo/momomediaext/MMLiveEngine;->p0:Ll/gbl0;

    .line 211
    .line 212
    invoke-virtual {v3, v4}, Lcom/immomo/momomediaext/a;->X(Ll/gbl0;)V

    .line 213
    .line 214
    .line 215
    iget-object v3, p0, Lcom/immomo/momomediaext/MMLiveEngine;->p:Lcom/immomo/momomediaext/a;

    .line 216
    .line 217
    iget-object v4, p0, Lcom/immomo/momomediaext/MMLiveEngine;->k0:Ll/kod0;

    .line 218
    .line 219
    invoke-virtual {v3, v4}, Lcom/immomo/momomediaext/a;->V(Ll/kod0;)V

    .line 220
    .line 221
    .line 222
    iget-boolean v3, p0, Lcom/immomo/momomediaext/MMLiveEngine;->t:Z

    .line 223
    .line 224
    invoke-virtual {p0, v3}, Lcom/immomo/momomediaext/MMLiveEngine;->i0(Z)V

    .line 225
    .line 226
    .line 227
    iget-object v3, p0, Lcom/immomo/momomediaext/MMLiveEngine;->p:Lcom/immomo/momomediaext/a;

    .line 228
    .line 229
    iget-boolean v4, p0, Lcom/immomo/momomediaext/MMLiveEngine;->v:Z

    .line 230
    .line 231
    invoke-virtual {v3, v4}, Lcom/immomo/momomediaext/a;->F(Z)V

    .line 232
    .line 233
    .line 234
    iget-object v3, p0, Lcom/immomo/momomediaext/MMLiveEngine;->p:Lcom/immomo/momomediaext/a;

    .line 235
    .line 236
    iget-boolean v4, p0, Lcom/immomo/momomediaext/MMLiveEngine;->w:Z

    .line 237
    .line 238
    invoke-virtual {v3, v4}, Lcom/immomo/momomediaext/a;->D(Z)V

    .line 239
    .line 240
    .line 241
    iget-object v3, p0, Lcom/immomo/momomediaext/MMLiveEngine;->p:Lcom/immomo/momomediaext/a;

    .line 242
    .line 243
    iget-boolean v4, p0, Lcom/immomo/momomediaext/MMLiveEngine;->x:Z

    .line 244
    .line 245
    invoke-virtual {v3, v4}, Lcom/immomo/momomediaext/a;->K(Z)V

    .line 246
    .line 247
    .line 248
    iget-object v3, p0, Lcom/immomo/momomediaext/MMLiveEngine;->p:Lcom/immomo/momomediaext/a;

    .line 249
    .line 250
    iget-boolean v4, p0, Lcom/immomo/momomediaext/MMLiveEngine;->y:Z

    .line 251
    .line 252
    invoke-virtual {v3, v4}, Lcom/immomo/momomediaext/a;->I(Z)V

    .line 253
    .line 254
    .line 255
    iget-object v3, p0, Lcom/immomo/momomediaext/MMLiveEngine;->n:Lcom/immomo/momomediaext/MMLiveSource;

    .line 256
    .line 257
    if-eqz v3, :cond_8

    .line 258
    .line 259
    iget-object v4, p0, Lcom/immomo/momomediaext/MMLiveEngine;->k:Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;

    .line 260
    .line 261
    iget v5, v4, Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;->encodeWidth:I

    .line 262
    .line 263
    iget v4, v4, Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;->encodeHeight:I

    .line 264
    .line 265
    invoke-virtual {v3, v5, v4}, Lcom/immomo/momomediaext/MMLiveSource;->O(II)V

    .line 266
    .line 267
    .line 268
    :cond_8
    iget-object v3, p2, Lcom/immomo/momomediaext/utils/MMLiveRoomParams;->audioProfile:Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLiveAudioProfile;

    .line 269
    .line 270
    iput-object v3, p0, Lcom/immomo/momomediaext/MMLiveEngine;->B:Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLiveAudioProfile;

    .line 271
    .line 272
    iget-object p2, p2, Lcom/immomo/momomediaext/utils/MMLiveRoomParams;->audioScenario:Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLiveAudioScenario;

    .line 273
    .line 274
    iput-object p2, p0, Lcom/immomo/momomediaext/MMLiveEngine;->C:Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLiveAudioScenario;

    .line 275
    .line 276
    iget-object p2, p0, Lcom/immomo/momomediaext/MMLiveEngine;->p:Lcom/immomo/momomediaext/a;

    .line 277
    .line 278
    iget-object v3, p0, Lcom/immomo/momomediaext/MMLiveEngine;->t0:Ll/fpf0;

    .line 279
    .line 280
    invoke-virtual {p2, v3}, Lcom/immomo/momomediaext/a;->G(Ll/fpf0;)V

    .line 281
    .line 282
    .line 283
    iget-object p2, p0, Lcom/immomo/momomediaext/MMLiveEngine;->p:Lcom/immomo/momomediaext/a;

    .line 284
    .line 285
    iget-object v3, p0, Lcom/immomo/momomediaext/MMLiveEngine;->D:Ljava/lang/String;

    .line 286
    .line 287
    invoke-virtual {p2, v3}, Lcom/immomo/momomediaext/a;->Y(Ljava/lang/String;)V

    .line 288
    .line 289
    .line 290
    iget-object p2, p0, Lcom/immomo/momomediaext/MMLiveEngine;->p:Lcom/immomo/momomediaext/a;

    .line 291
    .line 292
    iget-boolean v3, p0, Lcom/immomo/momomediaext/MMLiveEngine;->G:Z

    .line 293
    .line 294
    iget-object v4, p0, Lcom/immomo/momomediaext/MMLiveEngine;->F:Ljava/lang/String;

    .line 295
    .line 296
    invoke-virtual {p2, v3, v4}, Lcom/immomo/momomediaext/a;->i(ZLjava/lang/String;)V

    .line 297
    .line 298
    .line 299
    iget-object p2, p0, Lcom/immomo/momomediaext/MMLiveEngine;->p:Lcom/immomo/momomediaext/a;

    .line 300
    .line 301
    iget-boolean v3, p0, Lcom/immomo/momomediaext/MMLiveEngine;->H:Z

    .line 302
    .line 303
    invoke-virtual {p2, v3}, Lcom/immomo/momomediaext/a;->l(Z)V

    .line 304
    .line 305
    .line 306
    iget-object p2, p0, Lcom/immomo/momomediaext/MMLiveEngine;->p:Lcom/immomo/momomediaext/a;

    .line 307
    .line 308
    iget-object v3, p0, Lcom/immomo/momomediaext/MMLiveEngine;->Z:Ll/wpw;

    .line 309
    .line 310
    invoke-virtual {p2, v3}, Lcom/immomo/momomediaext/a;->d(Ll/wpw;)V

    .line 311
    .line 312
    .line 313
    iget-object p2, p0, Lcom/immomo/momomediaext/MMLiveEngine;->e:Ljava/lang/String;

    .line 314
    .line 315
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 316
    .line 317
    .line 318
    move-result p2

    .line 319
    if-nez p2, :cond_9

    .line 320
    .line 321
    iget-object p2, p0, Lcom/immomo/momomediaext/MMLiveEngine;->p:Lcom/immomo/momomediaext/a;

    .line 322
    .line 323
    iget-object v3, p0, Lcom/immomo/momomediaext/MMLiveEngine;->e:Ljava/lang/String;

    .line 324
    .line 325
    invoke-virtual {p2, v3}, Lcom/immomo/momomediaext/a;->J(Ljava/lang/String;)V

    .line 326
    .line 327
    .line 328
    :cond_9
    iget-object p2, p0, Lcom/immomo/momomediaext/MMLiveEngine;->p:Lcom/immomo/momomediaext/a;

    .line 329
    .line 330
    iget-object v3, p0, Lcom/immomo/momomediaext/MMLiveEngine;->q0:Ll/fb1;

    .line 331
    .line 332
    invoke-virtual {p2, v3}, Lcom/immomo/momomediaext/a;->O(Ll/fb1;)V

    .line 333
    .line 334
    .line 335
    iget-object p2, p0, Lcom/immomo/momomediaext/MMLiveEngine;->p:Lcom/immomo/momomediaext/a;

    .line 336
    .line 337
    iget-wide v3, p0, Lcom/immomo/momomediaext/MMLiveEngine;->f:J

    .line 338
    .line 339
    invoke-virtual {p2, v3, v4}, Lcom/immomo/momomediaext/a;->N(J)V

    .line 340
    .line 341
    .line 342
    iget-object p2, p0, Lcom/immomo/momomediaext/MMLiveEngine;->p:Lcom/immomo/momomediaext/a;

    .line 343
    .line 344
    iget-object v3, p0, Lcom/immomo/momomediaext/MMLiveEngine;->r:Lcom/immomo/momomediaext/utils/MMLiveRoomParams;

    .line 345
    .line 346
    iget-boolean v3, v3, Lcom/immomo/momomediaext/utils/MMLiveRoomParams;->enableFullTimeMode:Z

    .line 347
    .line 348
    invoke-virtual {p2, v3}, Lcom/immomo/momomediaext/a;->U(Z)V

    .line 349
    .line 350
    .line 351
    iget-object p2, p0, Lcom/immomo/momomediaext/MMLiveEngine;->R:Lcom/immomo/momomediaext/MomoMediaConstants$MMLiveSimulcastStreamMode;

    .line 352
    .line 353
    sget-object v3, Lcom/immomo/momomediaext/MomoMediaConstants$MMLiveSimulcastStreamMode;->NO_SET:Lcom/immomo/momomediaext/MomoMediaConstants$MMLiveSimulcastStreamMode;

    .line 354
    .line 355
    if-eq p2, v3, :cond_a

    .line 356
    .line 357
    iget-object v3, p0, Lcom/immomo/momomediaext/MMLiveEngine;->S:Ll/hnw;

    .line 358
    .line 359
    if-eqz v3, :cond_a

    .line 360
    .line 361
    iget-object v3, p0, Lcom/immomo/momomediaext/MMLiveEngine;->p:Lcom/immomo/momomediaext/a;

    .line 362
    .line 363
    invoke-virtual {p2}, Lcom/immomo/momomediaext/MomoMediaConstants$MMLiveSimulcastStreamMode;->getValue()I

    .line 364
    .line 365
    .line 366
    move-result p2

    .line 367
    iget-object v4, p0, Lcom/immomo/momomediaext/MMLiveEngine;->S:Ll/hnw;

    .line 368
    .line 369
    invoke-virtual {v3, p2, v4}, Lcom/immomo/momomediaext/a;->C(ILl/hnw;)I

    .line 370
    .line 371
    .line 372
    :cond_a
    iget-object p2, p0, Lcom/immomo/momomediaext/MMLiveEngine;->T:Lcom/immomo/momomediaext/MomoMediaConstants$MMLiveSimulcastStreamType;

    .line 373
    .line 374
    sget-object v3, Lcom/immomo/momomediaext/MomoMediaConstants$MMLiveSimulcastStreamType;->DEFAULT:Lcom/immomo/momomediaext/MomoMediaConstants$MMLiveSimulcastStreamType;

    .line 375
    .line 376
    if-eq p2, v3, :cond_b

    .line 377
    .line 378
    iget-object v3, p0, Lcom/immomo/momomediaext/MMLiveEngine;->p:Lcom/immomo/momomediaext/a;

    .line 379
    .line 380
    invoke-virtual {p2}, Lcom/immomo/momomediaext/MomoMediaConstants$MMLiveSimulcastStreamType;->getValue()I

    .line 381
    .line 382
    .line 383
    move-result p2

    .line 384
    invoke-virtual {v3, p2}, Lcom/immomo/momomediaext/a;->S(I)I

    .line 385
    .line 386
    .line 387
    :cond_b
    iget-object p2, p0, Lcom/immomo/momomediaext/MMLiveEngine;->U:Ljava/util/List;

    .line 388
    .line 389
    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 390
    .line 391
    .line 392
    move-result-object p2

    .line 393
    :goto_4
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    .line 394
    .line 395
    .line 396
    move-result v3

    .line 397
    if-eqz v3, :cond_c

    .line 398
    .line 399
    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 400
    .line 401
    .line 402
    move-result-object v3

    .line 403
    check-cast v3, Ljava/lang/String;

    .line 404
    .line 405
    iget-object v4, p0, Lcom/immomo/momomediaext/MMLiveEngine;->p:Lcom/immomo/momomediaext/a;

    .line 406
    .line 407
    invoke-virtual {v4, v3}, Lcom/immomo/momomediaext/a;->P(Ljava/lang/String;)V

    .line 408
    .line 409
    .line 410
    goto :goto_4

    .line 411
    :cond_c
    invoke-direct {p0, p1}, Lcom/immomo/momomediaext/MMLiveEngine;->u(Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;)V

    .line 412
    .line 413
    .line 414
    iget-object p2, p0, Lcom/immomo/momomediaext/MMLiveEngine;->p:Lcom/immomo/momomediaext/a;

    .line 415
    .line 416
    iget-object v3, p0, Lcom/immomo/momomediaext/MMLiveEngine;->r:Lcom/immomo/momomediaext/utils/MMLiveRoomParams;

    .line 417
    .line 418
    invoke-virtual {p2, p1, v3, p3}, Lcom/immomo/momomediaext/a;->m(Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;Lcom/immomo/momomediaext/utils/MMLiveRoomParams;Lcom/immomo/momomediaext/utils/MMLiveTranscoding;)I

    .line 419
    .line 420
    .line 421
    move-result v1

    .line 422
    iget-object p2, p0, Lcom/immomo/momomediaext/MMLiveEngine;->n:Lcom/immomo/momomediaext/MMLiveSource;

    .line 423
    .line 424
    if-eqz p2, :cond_d

    .line 425
    .line 426
    invoke-virtual {p2}, Lcom/immomo/momomediaext/MMLiveSource;->u()Lcom/momo/piplinemomoext/input/audio/a;

    .line 427
    .line 428
    .line 429
    move-result-object p2

    .line 430
    invoke-interface {p2, v2}, Lcom/momo/piplinemomoext/input/audio/a;->l(I)V

    .line 431
    .line 432
    .line 433
    :cond_d
    invoke-static {}, Ll/b7y;->c()Ll/b7y;

    .line 434
    .line 435
    .line 436
    move-result-object p2

    .line 437
    iget p1, p1, Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;->businessType:I

    .line 438
    .line 439
    invoke-virtual {p2, p1}, Ll/b7y;->j(I)V

    .line 440
    .line 441
    .line 442
    goto :goto_5

    .line 443
    :cond_e
    iget-object p1, p0, Lcom/immomo/momomediaext/MMLiveEngine;->s:Ll/enw;

    .line 444
    .line 445
    if-eqz p1, :cond_f

    .line 446
    .line 447
    iget-object p2, p0, Lcom/immomo/momomediaext/MMLiveEngine;->r:Lcom/immomo/momomediaext/utils/MMLiveRoomParams;

    .line 448
    .line 449
    iget-object p2, p2, Lcom/immomo/momomediaext/utils/MMLiveRoomParams;->linkType:Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;

    .line 450
    .line 451
    new-instance p3, Lcom/immomo/momomediaext/utils/MMLiveErrorInfo;

    .line 452
    .line 453
    invoke-static {p2, v0, v6}, Ll/kg60;->a(Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;II)Ljava/lang/String;

    .line 454
    .line 455
    .line 456
    move-result-object v3

    .line 457
    invoke-direct {p3, v0, v6, v3}, Lcom/immomo/momomediaext/utils/MMLiveErrorInfo;-><init>(IILjava/lang/String;)V

    .line 458
    .line 459
    .line 460
    invoke-virtual {p1, p2, p3}, Ll/enw;->o(Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;Lcom/immomo/momomediaext/utils/MMLiveErrorInfo;)V
    :try_end_0
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_0} :catch_0

    .line 461
    .line 462
    .line 463
    move v1, v5

    .line 464
    goto :goto_5

    .line 465
    :catch_0
    iget-object p1, p0, Lcom/immomo/momomediaext/MMLiveEngine;->s:Ll/enw;

    .line 466
    .line 467
    if-eqz p1, :cond_f

    .line 468
    .line 469
    iget-object p2, p0, Lcom/immomo/momomediaext/MMLiveEngine;->r:Lcom/immomo/momomediaext/utils/MMLiveRoomParams;

    .line 470
    .line 471
    iget-object p2, p2, Lcom/immomo/momomediaext/utils/MMLiveRoomParams;->linkType:Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;

    .line 472
    .line 473
    new-instance p3, Lcom/immomo/momomediaext/utils/MMLiveErrorInfo;

    .line 474
    .line 475
    const/16 v3, 0x65

    .line 476
    .line 477
    invoke-static {p2, v0, v3}, Ll/kg60;->a(Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;II)Ljava/lang/String;

    .line 478
    .line 479
    .line 480
    move-result-object v4

    .line 481
    invoke-direct {p3, v0, v3, v4}, Lcom/immomo/momomediaext/utils/MMLiveErrorInfo;-><init>(IILjava/lang/String;)V

    .line 482
    .line 483
    .line 484
    invoke-virtual {p1, p2, p3}, Ll/enw;->o(Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;Lcom/immomo/momomediaext/utils/MMLiveErrorInfo;)V

    .line 485
    .line 486
    .line 487
    :cond_f
    :goto_5
    iget-boolean p1, p0, Lcom/immomo/momomediaext/MMLiveEngine;->u:Z

    .line 488
    .line 489
    if-eqz p1, :cond_10

    .line 490
    .line 491
    invoke-virtual {p0, v2}, Lcom/immomo/momomediaext/MMLiveEngine;->x0(Z)V

    .line 492
    .line 493
    .line 494
    :cond_10
    return v1

    .line 495
    :cond_11
    :goto_6
    iget-object p1, p0, Lcom/immomo/momomediaext/MMLiveEngine;->s:Ll/enw;

    .line 496
    .line 497
    if-eqz p1, :cond_12

    .line 498
    .line 499
    new-instance p2, Lcom/immomo/momomediaext/utils/MMLiveErrorInfo;

    .line 500
    .line 501
    const/16 p3, 0x32d

    .line 502
    .line 503
    invoke-static {v0, p3, v6}, Ll/kg60;->a(Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;II)Ljava/lang/String;

    .line 504
    .line 505
    .line 506
    move-result-object v1

    .line 507
    invoke-direct {p2, p3, v6, v1}, Lcom/immomo/momomediaext/utils/MMLiveErrorInfo;-><init>(IILjava/lang/String;)V

    .line 508
    .line 509
    .line 510
    invoke-virtual {p1, v0, p2}, Ll/enw;->o(Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;Lcom/immomo/momomediaext/utils/MMLiveErrorInfo;)V

    .line 511
    .line 512
    .line 513
    :cond_12
    invoke-static {}, Ll/b7y;->c()Ll/b7y;

    .line 514
    .line 515
    .line 516
    move-result-object p1

    .line 517
    iget-object p0, p0, Lcom/immomo/momomediaext/MMLiveEngine;->r:Lcom/immomo/momomediaext/utils/MMLiveRoomParams;

    .line 518
    .line 519
    iget-object p0, p0, Lcom/immomo/momomediaext/utils/MMLiveRoomParams;->linkType:Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;

    .line 520
    .line 521
    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 522
    .line 523
    .line 524
    move-result-object p0

    .line 525
    const-string p2, "linkType"

    .line 526
    .line 527
    invoke-virtual {p1, v3, p2, p0}, Ll/b7y;->f(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 528
    .line 529
    .line 530
    return v5
.end method

.method public w0(Ljava/lang/String;)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "setRestartWithURL:"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const-string v1, "MMLiveEngine"

    .line 16
    .line 17
    filled-new-array {v1, v0}, [Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-static {v0}, Lcom/immomo/momomediaext/MMLiveEngine;->M([Ljava/lang/Object;)V

    .line 22
    .line 23
    .line 24
    invoke-direct {p0}, Lcom/immomo/momomediaext/MMLiveEngine;->I()Z

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    if-eqz v0, :cond_0

    .line 29
    .line 30
    iget-object p0, p0, Lcom/immomo/momomediaext/MMLiveEngine;->p:Lcom/immomo/momomediaext/a;

    .line 31
    .line 32
    invoke-virtual {p0, p1}, Lcom/immomo/momomediaext/a;->T(Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    :cond_0
    return-void
.end method

.method public x0(Z)V
    .locals 2

    .line 1
    const-string v0, "setStreamReplaceMode"

    .line 2
    .line 3
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    filled-new-array {v0, v1}, [Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-static {v0}, Lcom/immomo/momomediaext/MMLiveEngine;->M([Ljava/lang/Object;)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Lcom/immomo/momomediaext/MMLiveEngine;->o:Ll/gnw;

    .line 15
    .line 16
    if-eqz v0, :cond_0

    .line 17
    .line 18
    invoke-virtual {v0, p1}, Ll/gnw;->b(Z)V

    .line 19
    .line 20
    .line 21
    :cond_0
    iget-object p0, p0, Lcom/immomo/momomediaext/MMLiveEngine;->p:Lcom/immomo/momomediaext/a;

    .line 22
    .line 23
    if-eqz p0, :cond_1

    .line 24
    .line 25
    invoke-virtual {p0, p1}, Lcom/immomo/momomediaext/a;->k(Z)V

    .line 26
    .line 27
    .line 28
    :cond_1
    return-void
.end method

.method public y()I
    .locals 1

    .line 1
    const-string v0, "getAudioTrackCount"

    .line 2
    .line 3
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Lcom/immomo/momomediaext/MMLiveEngine;->M([Ljava/lang/Object;)V

    .line 8
    .line 9
    .line 10
    invoke-direct {p0}, Lcom/immomo/momomediaext/MMLiveEngine;->I()Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    iget-object p0, p0, Lcom/immomo/momomediaext/MMLiveEngine;->p:Lcom/immomo/momomediaext/a;

    .line 17
    .line 18
    invoke-virtual {p0}, Lcom/immomo/momomediaext/a;->n()I

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    return p0

    .line 23
    :cond_0
    const/4 p0, -0x1

    .line 24
    return p0
.end method

.method public y0(Lcom/immomo/momomediaext/utils/MMLiveUserConfig;)V
    .locals 2

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    const-string v0, ""

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    invoke-virtual {p1}, Lcom/immomo/momomediaext/utils/MMLiveUserConfig;->toString()Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    :goto_0
    const-string v1, "setUserConfig"

    .line 11
    .line 12
    filled-new-array {v1, v0}, [Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-static {v0}, Lcom/immomo/momomediaext/MMLiveEngine;->M([Ljava/lang/Object;)V

    .line 17
    .line 18
    .line 19
    if-eqz p1, :cond_1

    .line 20
    .line 21
    iput-object p1, p0, Lcom/immomo/momomediaext/MMLiveEngine;->j:Lcom/immomo/momomediaext/utils/MMLiveUserConfig;

    .line 22
    .line 23
    :cond_1
    return-void
.end method

.method public z()Ll/kpl;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/momomediaext/MMLiveEngine;->n:Lcom/immomo/momomediaext/MMLiveSource;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/immomo/momomediaext/MMLiveSource;->r()Ll/kpl;

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

.method public z0(Lcom/immomo/momomediaext/utils/MMLiveVideoEncoderConfig;)V
    .locals 6

    .line 1
    iget v0, p1, Lcom/immomo/momomediaext/utils/MMLiveVideoEncoderConfig;->encodeWidth:I

    .line 2
    .line 3
    div-int/lit8 v0, v0, 0x2

    .line 4
    .line 5
    mul-int/lit8 v0, v0, 0x2

    .line 6
    .line 7
    iget v1, p1, Lcom/immomo/momomediaext/utils/MMLiveVideoEncoderConfig;->encodeHeight:I

    .line 8
    .line 9
    div-int/lit8 v1, v1, 0x2

    .line 10
    .line 11
    mul-int/lit8 v1, v1, 0x2

    .line 12
    .line 13
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 18
    .line 19
    .line 20
    move-result-object v3

    .line 21
    iget v4, p1, Lcom/immomo/momomediaext/utils/MMLiveVideoEncoderConfig;->videoBitRate:I

    .line 22
    .line 23
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 24
    .line 25
    .line 26
    move-result-object v4

    .line 27
    const-string v5, "setVideoEncoderConfig"

    .line 28
    .line 29
    filled-new-array {v5, v2, v3, v4}, [Ljava/lang/Object;

    .line 30
    .line 31
    .line 32
    move-result-object v2

    .line 33
    invoke-static {v2}, Lcom/immomo/momomediaext/MMLiveEngine;->M([Ljava/lang/Object;)V

    .line 34
    .line 35
    .line 36
    iget-object v2, p0, Lcom/immomo/momomediaext/MMLiveEngine;->M:Lcom/immomo/momomediaext/utils/MMLiveVideoEncoderConfig;

    .line 37
    .line 38
    iget v3, p1, Lcom/immomo/momomediaext/utils/MMLiveVideoEncoderConfig;->encodeWidth:I

    .line 39
    .line 40
    iput v3, v2, Lcom/immomo/momomediaext/utils/MMLiveVideoEncoderConfig;->encodeWidth:I

    .line 41
    .line 42
    iget v3, p1, Lcom/immomo/momomediaext/utils/MMLiveVideoEncoderConfig;->encodeHeight:I

    .line 43
    .line 44
    iput v3, v2, Lcom/immomo/momomediaext/utils/MMLiveVideoEncoderConfig;->encodeHeight:I

    .line 45
    .line 46
    iget v3, p1, Lcom/immomo/momomediaext/utils/MMLiveVideoEncoderConfig;->videoFPS:I

    .line 47
    .line 48
    iput v3, v2, Lcom/immomo/momomediaext/utils/MMLiveVideoEncoderConfig;->videoFPS:I

    .line 49
    .line 50
    iget v3, p1, Lcom/immomo/momomediaext/utils/MMLiveVideoEncoderConfig;->videoBitRate:I

    .line 51
    .line 52
    iput v3, v2, Lcom/immomo/momomediaext/utils/MMLiveVideoEncoderConfig;->videoBitRate:I

    .line 53
    .line 54
    iget-object v2, p0, Lcom/immomo/momomediaext/MMLiveEngine;->m:Lcom/momo/pub/MomoPipelineModuleRegister;

    .line 55
    .line 56
    if-eqz v2, :cond_3

    .line 57
    .line 58
    invoke-interface {v2}, Lcom/momo/pub/MomoPipelineModuleRegister;->getParameters()Ll/ror;

    .line 59
    .line 60
    .line 61
    move-result-object v2

    .line 62
    iput v0, v2, Ll/tow;->m:I

    .line 63
    .line 64
    iget-object v2, p0, Lcom/immomo/momomediaext/MMLiveEngine;->m:Lcom/momo/pub/MomoPipelineModuleRegister;

    .line 65
    .line 66
    invoke-interface {v2}, Lcom/momo/pub/MomoPipelineModuleRegister;->getParameters()Ll/ror;

    .line 67
    .line 68
    .line 69
    move-result-object v2

    .line 70
    iput v0, v2, Ll/tow;->m:I

    .line 71
    .line 72
    iput v1, v2, Ll/tow;->n:I

    .line 73
    .line 74
    iget v3, p1, Lcom/immomo/momomediaext/utils/MMLiveVideoEncoderConfig;->videoBitRate:I

    .line 75
    .line 76
    iput v3, v2, Ll/tow;->H:I

    .line 77
    .line 78
    iget p1, p1, Lcom/immomo/momomediaext/utils/MMLiveVideoEncoderConfig;->videoFPS:I

    .line 79
    .line 80
    iput p1, v2, Ll/uow;->S0:I

    .line 81
    .line 82
    iget-object p1, p0, Lcom/immomo/momomediaext/MMLiveEngine;->n:Lcom/immomo/momomediaext/MMLiveSource;

    .line 83
    .line 84
    if-eqz p1, :cond_0

    .line 85
    .line 86
    invoke-virtual {p1, v0, v1}, Lcom/immomo/momomediaext/MMLiveSource;->O(II)V

    .line 87
    .line 88
    .line 89
    :cond_0
    iget-object p1, p0, Lcom/immomo/momomediaext/MMLiveEngine;->O:Ll/lvl;

    .line 90
    .line 91
    if-eqz p1, :cond_1

    .line 92
    .line 93
    iget-object p1, p0, Lcom/immomo/momomediaext/MMLiveEngine;->m:Lcom/momo/pub/MomoPipelineModuleRegister;

    .line 94
    .line 95
    invoke-interface {p1, v2}, Lcom/momo/pub/MomoPipelineModuleRegister;->c(Ll/uow;)V

    .line 96
    .line 97
    .line 98
    iget-object p1, p0, Lcom/immomo/momomediaext/MMLiveEngine;->m:Lcom/momo/pub/MomoPipelineModuleRegister;

    .line 99
    .line 100
    iget-boolean p0, p0, Lcom/immomo/momomediaext/MMLiveEngine;->g:Z

    .line 101
    .line 102
    invoke-interface {p1, v2, p0}, Lcom/momo/pub/MomoPipelineModuleRegister;->h(Ll/ror;Z)V

    .line 103
    .line 104
    .line 105
    return-void

    .line 106
    :cond_1
    iget-object p1, p0, Lcom/immomo/momomediaext/MMLiveEngine;->J:Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;

    .line 107
    .line 108
    invoke-virtual {p0, p1}, Lcom/immomo/momomediaext/MMLiveEngine;->K(Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;)Z

    .line 109
    .line 110
    .line 111
    move-result p1

    .line 112
    iget-object p0, p0, Lcom/immomo/momomediaext/MMLiveEngine;->m:Lcom/momo/pub/MomoPipelineModuleRegister;

    .line 113
    .line 114
    if-eqz p1, :cond_2

    .line 115
    .line 116
    invoke-interface {p0, v2}, Lcom/momo/pub/MomoPipelineModuleRegister;->p(Ll/ror;)V

    .line 117
    .line 118
    .line 119
    return-void

    .line 120
    :cond_2
    invoke-interface {p0, v2}, Lcom/momo/pub/MomoPipelineModuleRegister;->b(Ll/uow;)V

    .line 121
    .line 122
    .line 123
    :cond_3
    return-void
.end method

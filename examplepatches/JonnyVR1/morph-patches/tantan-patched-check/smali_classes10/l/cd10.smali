.class public Ll/cd10;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static A:Ljava/lang/String; = null

.field public static B:Ljava/lang/String; = null

.field public static C:Ljava/lang/String; = null

.field public static D:Ljava/lang/String; = null

.field public static E:Ljava/lang/String; = null

.field public static F:Ljava/lang/String; = null

.field public static G:Ljava/lang/String; = null

.field public static H:Ljava/lang/String; = null

.field public static I:Ljava/lang/String; = null

.field public static J:Ljava/lang/String; = null

.field public static K:Ljava/lang/String; = null

.field public static L:Ljava/lang/String; = null

.field public static M:Ljava/lang/String; = null

.field public static N:Ljava/lang/String; = null

.field public static O:Ljava/lang/String; = null

.field public static P:Ljava/lang/String; = null

.field public static Q:Ljava/lang/String; = null

.field public static R:Ljava/lang/String; = null

.field public static S:Ljava/lang/String; = null

.field public static T:Ljava/lang/String; = null

.field public static U:Ljava/lang/String; = null

.field public static V:Ljava/lang/String; = null

.field public static W:Ljava/lang/String; = null

.field public static X:Ljava/lang/String; = null

.field public static a:Ljava/lang/String; = "multiCall"

.field public static final b:I

.field public static c:Ljava/lang/String;

.field public static d:Ljava/lang/String;

.field public static e:Ljava/lang/String;

.field public static f:Ljava/lang/String;

.field public static g:Ljava/lang/String;

.field public static h:Ljava/lang/String;

.field public static i:Ljava/lang/String;

.field public static j:Ljava/lang/String;

.field public static k:Ljava/lang/String;

.field public static l:Ljava/lang/String;

.field public static m:Ljava/lang/String;

.field public static n:Ljava/lang/String;

.field public static o:Ljava/lang/String;

.field public static p:Ljava/lang/String;

.field public static q:Ljava/lang/String;

.field public static r:Ljava/lang/String;

.field public static s:Ljava/lang/String;

.field public static t:Ljava/lang/String;

.field public static u:Ljava/lang/String;

.field public static v:Ljava/lang/String;

.field public static w:Ljava/lang/String;

.field public static x:Ljava/lang/String;

.field public static y:Ljava/lang/String;

.field public static z:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 1
    const/high16 v0, 0x43340000    # 180.0f

    .line 2
    .line 3
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    sput v0, Ll/cd10;->b:I

    .line 8
    .line 9
    const-string v0, "multiCall"

    .line 10
    .line 11
    sput-object v0, Ll/cd10;->c:Ljava/lang/String;

    .line 12
    .line 13
    const-string v0, "owner"

    .line 14
    .line 15
    sput-object v0, Ll/cd10;->d:Ljava/lang/String;

    .line 16
    .line 17
    const-string v0, "anchor"

    .line 18
    .line 19
    sput-object v0, Ll/cd10;->e:Ljava/lang/String;

    .line 20
    .line 21
    const-string v1, "audience"

    .line 22
    .line 23
    sput-object v1, Ll/cd10;->f:Ljava/lang/String;

    .line 24
    .line 25
    const-string v2, "not_caller_in_owner_room"

    .line 26
    .line 27
    sput-object v2, Ll/cd10;->g:Ljava/lang/String;

    .line 28
    .line 29
    const-string v2, "not_caller_out_owner_room"

    .line 30
    .line 31
    sput-object v2, Ll/cd10;->h:Ljava/lang/String;

    .line 32
    .line 33
    const-string v2, "video"

    .line 34
    .line 35
    sput-object v2, Ll/cd10;->i:Ljava/lang/String;

    .line 36
    .line 37
    const-string v2, "voice"

    .line 38
    .line 39
    sput-object v2, Ll/cd10;->j:Ljava/lang/String;

    .line 40
    .line 41
    const-string v2, "invite"

    .line 42
    .line 43
    sput-object v2, Ll/cd10;->k:Ljava/lang/String;

    .line 44
    .line 45
    const-string v3, "apply"

    .line 46
    .line 47
    sput-object v3, Ll/cd10;->l:Ljava/lang/String;

    .line 48
    .line 49
    const-string v3, "created"

    .line 50
    .line 51
    sput-object v3, Ll/cd10;->m:Ljava/lang/String;

    .line 52
    .line 53
    const-string v3, "connecting"

    .line 54
    .line 55
    sput-object v3, Ll/cd10;->n:Ljava/lang/String;

    .line 56
    .line 57
    const-string v3, "on-going"

    .line 58
    .line 59
    sput-object v3, Ll/cd10;->o:Ljava/lang/String;

    .line 60
    .line 61
    const-string v3, "hang-up"

    .line 62
    .line 63
    sput-object v3, Ll/cd10;->p:Ljava/lang/String;

    .line 64
    .line 65
    const-string v3, "not-invited"

    .line 66
    .line 67
    sput-object v3, Ll/cd10;->q:Ljava/lang/String;

    .line 68
    .line 69
    const-string v3, "invited"

    .line 70
    .line 71
    sput-object v3, Ll/cd10;->r:Ljava/lang/String;

    .line 72
    .line 73
    const-string v3, "accepted"

    .line 74
    .line 75
    sput-object v3, Ll/cd10;->s:Ljava/lang/String;

    .line 76
    .line 77
    const-string v3, "ended"

    .line 78
    .line 79
    sput-object v3, Ll/cd10;->t:Ljava/lang/String;

    .line 80
    .line 81
    const-string v3, "profile"

    .line 82
    .line 83
    sput-object v3, Ll/cd10;->u:Ljava/lang/String;

    .line 84
    .line 85
    const-string v3, "invitePanel"

    .line 86
    .line 87
    sput-object v3, Ll/cd10;->v:Ljava/lang/String;

    .line 88
    .line 89
    const-string v3, "message"

    .line 90
    .line 91
    sput-object v3, Ll/cd10;->w:Ljava/lang/String;

    .line 92
    .line 93
    const-string v3, "applyPanel"

    .line 94
    .line 95
    sput-object v3, Ll/cd10;->x:Ljava/lang/String;

    .line 96
    .line 97
    const-string v3, "reject"

    .line 98
    .line 99
    sput-object v3, Ll/cd10;->y:Ljava/lang/String;

    .line 100
    .line 101
    sput-object v2, Ll/cd10;->z:Ljava/lang/String;

    .line 102
    .line 103
    const-string v2, "accept"

    .line 104
    .line 105
    sput-object v2, Ll/cd10;->A:Ljava/lang/String;

    .line 106
    .line 107
    const-string v2, "timeout"

    .line 108
    .line 109
    sput-object v2, Ll/cd10;->B:Ljava/lang/String;

    .line 110
    .line 111
    sput-object v0, Ll/cd10;->C:Ljava/lang/String;

    .line 112
    .line 113
    sput-object v1, Ll/cd10;->D:Ljava/lang/String;

    .line 114
    .line 115
    const-string v0, "friend"

    .line 116
    .line 117
    sput-object v0, Ll/cd10;->E:Ljava/lang/String;

    .line 118
    .line 119
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallMessage$Type;->apply:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallMessage$Type;

    .line 120
    .line 121
    invoke-virtual {v0}, Ljava/lang/Enum;->name()Ljava/lang/String;

    .line 122
    .line 123
    .line 124
    move-result-object v0

    .line 125
    sput-object v0, Ll/cd10;->F:Ljava/lang/String;

    .line 126
    .line 127
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallMessage$Type;->cancel:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallMessage$Type;

    .line 128
    .line 129
    invoke-virtual {v0}, Ljava/lang/Enum;->name()Ljava/lang/String;

    .line 130
    .line 131
    .line 132
    move-result-object v0

    .line 133
    sput-object v0, Ll/cd10;->G:Ljava/lang/String;

    .line 134
    .line 135
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallMessage$Type;->approve:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallMessage$Type;

    .line 136
    .line 137
    invoke-virtual {v0}, Ljava/lang/Enum;->name()Ljava/lang/String;

    .line 138
    .line 139
    .line 140
    move-result-object v0

    .line 141
    sput-object v0, Ll/cd10;->H:Ljava/lang/String;

    .line 142
    .line 143
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallMessage$Type;->success:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallMessage$Type;

    .line 144
    .line 145
    invoke-virtual {v0}, Ljava/lang/Enum;->name()Ljava/lang/String;

    .line 146
    .line 147
    .line 148
    move-result-object v0

    .line 149
    sput-object v0, Ll/cd10;->I:Ljava/lang/String;

    .line 150
    .line 151
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallMessage$Type;->hangUp:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallMessage$Type;

    .line 152
    .line 153
    invoke-virtual {v0}, Ljava/lang/Enum;->name()Ljava/lang/String;

    .line 154
    .line 155
    .line 156
    move-result-object v0

    .line 157
    sput-object v0, Ll/cd10;->J:Ljava/lang/String;

    .line 158
    .line 159
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallMessage$Type;->goAway:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallMessage$Type;

    .line 160
    .line 161
    invoke-virtual {v0}, Ljava/lang/Enum;->name()Ljava/lang/String;

    .line 162
    .line 163
    .line 164
    move-result-object v0

    .line 165
    sput-object v0, Ll/cd10;->K:Ljava/lang/String;

    .line 166
    .line 167
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallMessage$Type;->comeBack:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallMessage$Type;

    .line 168
    .line 169
    invoke-virtual {v0}, Ljava/lang/Enum;->name()Ljava/lang/String;

    .line 170
    .line 171
    .line 172
    move-result-object v0

    .line 173
    sput-object v0, Ll/cd10;->L:Ljava/lang/String;

    .line 174
    .line 175
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallMessage$Type;->switchToVideo:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallMessage$Type;

    .line 176
    .line 177
    invoke-virtual {v0}, Ljava/lang/Enum;->name()Ljava/lang/String;

    .line 178
    .line 179
    .line 180
    move-result-object v0

    .line 181
    sput-object v0, Ll/cd10;->M:Ljava/lang/String;

    .line 182
    .line 183
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallMessage$Type;->mute:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallMessage$Type;

    .line 184
    .line 185
    invoke-virtual {v0}, Ljava/lang/Enum;->name()Ljava/lang/String;

    .line 186
    .line 187
    .line 188
    move-result-object v0

    .line 189
    sput-object v0, Ll/cd10;->N:Ljava/lang/String;

    .line 190
    .line 191
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallMessage$Type;->unMute:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallMessage$Type;

    .line 192
    .line 193
    invoke-virtual {v0}, Ljava/lang/Enum;->name()Ljava/lang/String;

    .line 194
    .line 195
    .line 196
    move-result-object v0

    .line 197
    sput-object v0, Ll/cd10;->O:Ljava/lang/String;

    .line 198
    .line 199
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallMessage$Type;->inviteSwitchToVideo:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallMessage$Type;

    .line 200
    .line 201
    invoke-virtual {v0}, Ljava/lang/Enum;->name()Ljava/lang/String;

    .line 202
    .line 203
    .line 204
    move-result-object v0

    .line 205
    sput-object v0, Ll/cd10;->P:Ljava/lang/String;

    .line 206
    .line 207
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallMessage$Type;->rejectSwitchToVideo:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallMessage$Type;

    .line 208
    .line 209
    invoke-virtual {v0}, Ljava/lang/Enum;->name()Ljava/lang/String;

    .line 210
    .line 211
    .line 212
    move-result-object v0

    .line 213
    sput-object v0, Ll/cd10;->Q:Ljava/lang/String;

    .line 214
    .line 215
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallMessage$Type;->pushSuccess:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallMessage$Type;

    .line 216
    .line 217
    invoke-virtual {v0}, Ljava/lang/Enum;->name()Ljava/lang/String;

    .line 218
    .line 219
    .line 220
    move-result-object v0

    .line 221
    sput-object v0, Ll/cd10;->R:Ljava/lang/String;

    .line 222
    .line 223
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallMessage$Type;->switchToLeadRole:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallMessage$Type;

    .line 224
    .line 225
    invoke-virtual {v0}, Ljava/lang/Enum;->name()Ljava/lang/String;

    .line 226
    .line 227
    .line 228
    move-result-object v0

    .line 229
    sput-object v0, Ll/cd10;->S:Ljava/lang/String;

    .line 230
    .line 231
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallMessage$Type;->cancelLeadRole:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallMessage$Type;

    .line 232
    .line 233
    invoke-virtual {v0}, Ljava/lang/Enum;->name()Ljava/lang/String;

    .line 234
    .line 235
    .line 236
    move-result-object v0

    .line 237
    sput-object v0, Ll/cd10;->T:Ljava/lang/String;

    .line 238
    .line 239
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallMessage$Type;->updatePosition:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallMessage$Type;

    .line 240
    .line 241
    invoke-virtual {v0}, Ljava/lang/Enum;->name()Ljava/lang/String;

    .line 242
    .line 243
    .line 244
    move-result-object v0

    .line 245
    sput-object v0, Ll/cd10;->U:Ljava/lang/String;

    .line 246
    .line 247
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallMessage$Type;->cdnFail:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallMessage$Type;

    .line 248
    .line 249
    invoke-virtual {v0}, Ljava/lang/Enum;->name()Ljava/lang/String;

    .line 250
    .line 251
    .line 252
    move-result-object v0

    .line 253
    sput-object v0, Ll/cd10;->V:Ljava/lang/String;

    .line 254
    .line 255
    const-string v0, "multi-call-start-refresh-stream-address"

    .line 256
    .line 257
    sput-object v0, Ll/cd10;->W:Ljava/lang/String;

    .line 258
    .line 259
    const-string v0, "multi-call-stop-refresh-stream-address"

    .line 260
    .line 261
    sput-object v0, Ll/cd10;->X:Ljava/lang/String;

    .line 262
    .line 263
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static a(Z)I
    .locals 1

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    sget p0, Ll/cd10;->b:I

    .line 4
    .line 5
    return p0

    .line 6
    :cond_0
    const/high16 p0, 0x43180000    # 152.0f

    .line 7
    .line 8
    invoke-static {p0}, Ll/qa00;->d(F)I

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    invoke-static {}, Ll/bnl0;->F0()I

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    add-int/2addr p0, v0

    .line 17
    return p0
.end method

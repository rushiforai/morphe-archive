.class public Ll/jyi;
.super Ll/qct;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/jyi$a;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/qct<",
        "Ll/oo2;",
        ">;"
    }
.end annotation


# instance fields
.field public A:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ll/jyi$a;",
            ">;"
        }
    .end annotation
.end field

.field public B:Ll/jyi$a;

.field public C:Ll/jyi$a;

.field public D:Ll/jyi$a;

.field public i:Ljava/lang/String;

.field public j:Ll/jxd0;

.field public k:Ll/vxd0;

.field public l:Ll/vxd0;

.field public m:Ll/vxd0;

.field public n:Ll/byd0;

.field public o:Ll/byd0;

.field public p:Ll/byd0;

.field public q:Ll/byd0;

.field public r:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ll/jyi$a;",
            ">;"
        }
    .end annotation
.end field

.field public s:J

.field public t:Z

.field public u:I

.field public v:J

.field public w:D

.field public x:D

.field public y:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ll/jyi$a;",
            ">;"
        }
    .end annotation
.end field

.field public z:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ll/jyi$a;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ll/dum;)V
    .locals 3

    .line 1
    invoke-direct {p0, p1}, Ll/qct;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    sget-object p1, Ll/zrv;->a:Ll/wrv;

    .line 5
    .line 6
    invoke-virtual {p1}, Ll/wrv;->D0()Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    iput-object p1, p0, Ll/jyi;->i:Ljava/lang/String;

    .line 11
    .line 12
    new-instance p1, Ll/jxd0;

    .line 13
    .line 14
    new-instance v0, Ljava/lang/StringBuilder;

    .line 15
    .line 16
    const-string v1, "need_show_follow_anchor_bubble"

    .line 17
    .line 18
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    iget-object v1, p0, Ll/jyi;->i:Ljava/lang/String;

    .line 22
    .line 23
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 31
    .line 32
    invoke-direct {p1, v0, v1}, Ll/jxd0;-><init>(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 33
    .line 34
    .line 35
    iput-object p1, p0, Ll/jyi;->j:Ll/jxd0;

    .line 36
    .line 37
    new-instance p1, Ll/vxd0;

    .line 38
    .line 39
    new-instance v0, Ljava/lang/StringBuilder;

    .line 40
    .line 41
    const-string v1, "follow_guide_count_chat"

    .line 42
    .line 43
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    iget-object v1, p0, Ll/jyi;->i:Ljava/lang/String;

    .line 47
    .line 48
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 49
    .line 50
    .line 51
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    const/4 v1, 0x0

    .line 56
    invoke-direct {p1, v0, v1}, Ll/vxd0;-><init>(Ljava/lang/String;I)V

    .line 57
    .line 58
    .line 59
    iput-object p1, p0, Ll/jyi;->k:Ll/vxd0;

    .line 60
    .line 61
    new-instance p1, Ll/vxd0;

    .line 62
    .line 63
    new-instance v0, Ljava/lang/StringBuilder;

    .line 64
    .line 65
    const-string v2, "follow_guide_count_bubble"

    .line 66
    .line 67
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 68
    .line 69
    .line 70
    iget-object v2, p0, Ll/jyi;->i:Ljava/lang/String;

    .line 71
    .line 72
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 73
    .line 74
    .line 75
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 76
    .line 77
    .line 78
    move-result-object v0

    .line 79
    invoke-direct {p1, v0, v1}, Ll/vxd0;-><init>(Ljava/lang/String;I)V

    .line 80
    .line 81
    .line 82
    iput-object p1, p0, Ll/jyi;->l:Ll/vxd0;

    .line 83
    .line 84
    new-instance p1, Ll/vxd0;

    .line 85
    .line 86
    new-instance v0, Ljava/lang/StringBuilder;

    .line 87
    .line 88
    const-string v2, "follow_guide_count_menu"

    .line 89
    .line 90
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 91
    .line 92
    .line 93
    iget-object v2, p0, Ll/jyi;->i:Ljava/lang/String;

    .line 94
    .line 95
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 96
    .line 97
    .line 98
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 99
    .line 100
    .line 101
    move-result-object v0

    .line 102
    invoke-direct {p1, v0, v1}, Ll/vxd0;-><init>(Ljava/lang/String;I)V

    .line 103
    .line 104
    .line 105
    iput-object p1, p0, Ll/jyi;->m:Ll/vxd0;

    .line 106
    .line 107
    new-instance p1, Ll/byd0;

    .line 108
    .line 109
    new-instance v0, Ljava/lang/StringBuilder;

    .line 110
    .line 111
    const-string v1, "follow_guide_last_time"

    .line 112
    .line 113
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 114
    .line 115
    .line 116
    iget-object v1, p0, Ll/jyi;->i:Ljava/lang/String;

    .line 117
    .line 118
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 119
    .line 120
    .line 121
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 122
    .line 123
    .line 124
    move-result-object v0

    .line 125
    const-wide/16 v1, 0x0

    .line 126
    .line 127
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 128
    .line 129
    .line 130
    move-result-object v1

    .line 131
    invoke-direct {p1, v0, v1}, Ll/byd0;-><init>(Ljava/lang/String;Ljava/lang/Long;)V

    .line 132
    .line 133
    .line 134
    iput-object p1, p0, Ll/jyi;->n:Ll/byd0;

    .line 135
    .line 136
    new-instance p1, Ll/byd0;

    .line 137
    .line 138
    new-instance v0, Ljava/lang/StringBuilder;

    .line 139
    .line 140
    const-string v2, "follow_guide_last_bubble_time"

    .line 141
    .line 142
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 143
    .line 144
    .line 145
    iget-object v2, p0, Ll/jyi;->i:Ljava/lang/String;

    .line 146
    .line 147
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 148
    .line 149
    .line 150
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 151
    .line 152
    .line 153
    move-result-object v0

    .line 154
    invoke-direct {p1, v0, v1}, Ll/byd0;-><init>(Ljava/lang/String;Ljava/lang/Long;)V

    .line 155
    .line 156
    .line 157
    iput-object p1, p0, Ll/jyi;->o:Ll/byd0;

    .line 158
    .line 159
    new-instance p1, Ll/byd0;

    .line 160
    .line 161
    new-instance v0, Ljava/lang/StringBuilder;

    .line 162
    .line 163
    const-string v2, "follow_guide_last_bottom_menu_time"

    .line 164
    .line 165
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 166
    .line 167
    .line 168
    iget-object v2, p0, Ll/jyi;->i:Ljava/lang/String;

    .line 169
    .line 170
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 171
    .line 172
    .line 173
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 174
    .line 175
    .line 176
    move-result-object v0

    .line 177
    invoke-direct {p1, v0, v1}, Ll/byd0;-><init>(Ljava/lang/String;Ljava/lang/Long;)V

    .line 178
    .line 179
    .line 180
    iput-object p1, p0, Ll/jyi;->p:Ll/byd0;

    .line 181
    .line 182
    new-instance p1, Ll/byd0;

    .line 183
    .line 184
    new-instance v0, Ljava/lang/StringBuilder;

    .line 185
    .line 186
    const-string v2, "follow_guide_last_chat_time"

    .line 187
    .line 188
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 189
    .line 190
    .line 191
    iget-object v2, p0, Ll/jyi;->i:Ljava/lang/String;

    .line 192
    .line 193
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 194
    .line 195
    .line 196
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 197
    .line 198
    .line 199
    move-result-object v0

    .line 200
    invoke-direct {p1, v0, v1}, Ll/byd0;-><init>(Ljava/lang/String;Ljava/lang/Long;)V

    .line 201
    .line 202
    .line 203
    iput-object p1, p0, Ll/jyi;->q:Ll/byd0;

    .line 204
    .line 205
    new-instance p1, Ljava/util/ArrayList;

    .line 206
    .line 207
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 208
    .line 209
    .line 210
    iput-object p1, p0, Ll/jyi;->r:Ljava/util/ArrayList;

    .line 211
    .line 212
    new-instance p1, Ljava/util/ArrayList;

    .line 213
    .line 214
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 215
    .line 216
    .line 217
    iput-object p1, p0, Ll/jyi;->y:Ljava/util/ArrayList;

    .line 218
    .line 219
    new-instance p1, Ljava/util/ArrayList;

    .line 220
    .line 221
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 222
    .line 223
    .line 224
    iput-object p1, p0, Ll/jyi;->z:Ljava/util/ArrayList;

    .line 225
    .line 226
    new-instance p1, Ljava/util/ArrayList;

    .line 227
    .line 228
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 229
    .line 230
    .line 231
    iput-object p1, p0, Ll/jyi;->A:Ljava/util/ArrayList;

    .line 232
    .line 233
    return-void
.end method

.method public static synthetic J3(Ljava/lang/StringBuilder;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 2
    .line 3
    .line 4
    const-string p1, ","

    .line 5
    .line 6
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public static synthetic K3(Ll/jyi;Ll/vxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/jyi;->t4(Ll/vxj0;)V

    return-void
.end method

.method public static synthetic L3(Ll/jyi;Ljava/lang/Long;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/jyi;->v4(Ljava/lang/Long;)V

    return-void
.end method

.method public static synthetic M3(Lcom/p1/mobile/putong/live/base/data/BLiveLeaderBoards;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveLeaderBoards;->owner:Ljava/lang/String;

    .line 2
    .line 3
    sget-object v0, Ll/zrv;->a:Ll/wrv;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/wrv;->D0()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-static {p0, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0
.end method

.method public static synthetic N3(Ll/jyi;Ljava/lang/Long;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/jyi;->p4(Ljava/lang/Long;)V

    return-void
.end method

.method public static synthetic O3(Ll/jyi;Ljava/lang/Long;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/jyi;->s4(Ljava/lang/Long;)V

    return-void
.end method

.method public static synthetic P3(Ll/jyi;Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveFollowConditions;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/jyi;->o4(Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveFollowConditions;Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic R3(Ll/jyi;Ll/jyi$a;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/jyi;->r4(Ll/jyi$a;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic S3(Ll/jyi;Ll/woe0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/jyi;->u4(Ll/woe0;)V

    return-void
.end method

.method public static synthetic T3(Ll/jyi;Lcom/p1/mobile/putong/live/livingroom/archi/message/event/KeyboardEventData;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/jyi;->z4(Lcom/p1/mobile/putong/live/livingroom/archi/message/event/KeyboardEventData;)V

    return-void
.end method

.method public static synthetic U3(Lcom/p1/mobile/putong/live/base/data/BLiveLeaderBoards;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveLeaderBoards;->owner:Ljava/lang/String;

    .line 2
    .line 3
    sget-object v0, Ll/zrv;->a:Ll/wrv;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/wrv;->D0()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-static {p0, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0
.end method

.method public static synthetic V3(Ll/jyi$a;Ll/jyi$a;)I
    .locals 0

    .line 1
    iget p0, p0, Ll/jyi$a;->a:I

    .line 2
    .line 3
    iget p1, p1, Ll/jyi$a;->a:I

    .line 4
    .line 5
    sub-int/2addr p0, p1

    .line 6
    return p0
.end method

.method public static synthetic W3(Ll/jyi;Ll/hcr;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/jyi;->y4(Ll/hcr;)V

    return-void
.end method

.method public static synthetic X3(Ll/jyi;Ljava/lang/Long;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/jyi;->w4(Ljava/lang/Long;)V

    return-void
.end method

.method public static synthetic Y3(Ll/jyi;J)Z
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/jyi;->i4(J)Z

    move-result p0

    return p0
.end method

.method public static synthetic Z3(Ll/jyi$a;Ll/jyi$a;)Ljava/lang/Boolean;
    .locals 2

    .line 1
    iget-object v0, p1, Ll/jyi$a;->b:Ljava/lang/String;

    .line 2
    .line 3
    iget-object v1, p0, Ll/jyi$a;->b:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object p1, p1, Ll/jyi$a;->c:Ljava/lang/String;

    .line 12
    .line 13
    iget-object p0, p0, Ll/jyi$a;->c:Ljava/lang/String;

    .line 14
    .line 15
    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    if-eqz p0, :cond_0

    .line 20
    .line 21
    const/4 p0, 0x1

    .line 22
    goto :goto_0

    .line 23
    :cond_0
    const/4 p0, 0x0

    .line 24
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    return-object p0
.end method

.method public static synthetic a4(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic b4(Ll/jyi;Ll/jyi$a;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/jyi;->q4(Ll/jyi$a;)V

    return-void
.end method

.method public static synthetic c4(Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic d4(Ll/jyi;Ll/vxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/jyi;->A4(Ll/vxj0;)V

    return-void
.end method

.method public static synthetic e4(Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;->type:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {}, Ll/zrv;->k()Ll/vwt;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Ll/vwt;->J3()Lcom/p1/mobile/putong/live/base/data/BLiveFollowRateBubbleV2;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveFollowRateBubbleV2;->type:Ljava/lang/String;

    .line 12
    .line 13
    invoke-static {p0, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    return-object p0
.end method

.method public static synthetic f4(Ll/jyi;Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveControlMessage;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/jyi;->x4(Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveControlMessage;)V

    return-void
.end method


# virtual methods
.method public final synthetic A4(Ll/vxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/jyi;->D4()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final B4(Ljava/lang/String;)Ljava/util/ArrayList;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance p0, Ljava/util/ArrayList;

    .line 2
    .line 3
    const-string v0, ","

    .line 4
    .line 5
    invoke-virtual {p1, v0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-static {p1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    invoke-direct {p0, p1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 14
    .line 15
    .line 16
    new-instance p1, Ll/yxi;

    .line 17
    .line 18
    invoke-direct {p1}, Ll/yxi;-><init>()V

    .line 19
    .line 20
    .line 21
    invoke-static {p0, p1}, Ll/jyb;->d0(Ljava/util/List;Ll/qcj;)I

    .line 22
    .line 23
    .line 24
    return-object p0
.end method

.method public C4()V
    .locals 2

    .line 1
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    iput-wide v0, p0, Ll/jyi;->s:J

    .line 6
    .line 7
    return-void
.end method

.method public D4()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/jyi;->A:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

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
    iget v0, p0, Ll/jyi;->u:I

    .line 11
    .line 12
    add-int/lit8 v0, v0, 0x1

    .line 13
    .line 14
    iput v0, p0, Ll/jyi;->u:I

    .line 15
    .line 16
    iget-object v0, p0, Ll/jyi;->A:Ljava/util/ArrayList;

    .line 17
    .line 18
    const/4 v1, 0x0

    .line 19
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    check-cast v0, Ll/jyi$a;

    .line 24
    .line 25
    iget v1, p0, Ll/jyi;->u:I

    .line 26
    .line 27
    iget v2, v0, Ll/jyi$a;->a:I

    .line 28
    .line 29
    if-lt v1, v2, :cond_1

    .line 30
    .line 31
    iget-object v1, p0, Ll/jyi;->A:Ljava/util/ArrayList;

    .line 32
    .line 33
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 34
    .line 35
    .line 36
    invoke-virtual {p0, v0}, Ll/jyi;->l4(Ll/jyi$a;)V

    .line 37
    .line 38
    .line 39
    :cond_1
    :goto_0
    return-void
.end method

.method public final E4(Ljava/lang/String;)V
    .locals 4

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLivePostEvent;->new_()Lcom/p1/mobile/putong/live/base/data/BLivePostEvent;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iput-object p1, v0, Lcom/p1/mobile/putong/live/base/data/BLivePostEvent;->eventName:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-virtual {v1}, Ll/vp20;->j()Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->anchor:Lcom/p1/mobile/putong/live/base/data/BLiveOwner;

    .line 16
    .line 17
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveOwner;->id:Ljava/lang/String;

    .line 18
    .line 19
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLivePostEvent;->anchorId:Ljava/lang/String;

    .line 20
    .line 21
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveFollowConditions;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveFollowConditions;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    iget-wide v2, p0, Ll/jyi;->v:J

    .line 26
    .line 27
    invoke-static {v2, v3}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v2

    .line 31
    iput-object v2, v1, Lcom/p1/mobile/putong/live/base/data/BLiveFollowConditions;->watchTime:Ljava/lang/String;

    .line 32
    .line 33
    iget v2, p0, Ll/jyi;->u:I

    .line 34
    .line 35
    invoke-static {v2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object v2

    .line 39
    iput-object v2, v1, Lcom/p1/mobile/putong/live/base/data/BLiveFollowConditions;->msgCount:Ljava/lang/String;

    .line 40
    .line 41
    iget-wide v2, p0, Ll/jyi;->x:D

    .line 42
    .line 43
    invoke-static {v2, v3}, Ljava/lang/String;->valueOf(D)Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    iput-object p0, v1, Lcom/p1/mobile/putong/live/base/data/BLiveFollowConditions;->rewardPoint:Ljava/lang/String;

    .line 48
    .line 49
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLivePostEvent;->eventInfo:Lcom/p1/mobile/putong/live/base/data/BLiveFollowConditions;

    .line 50
    .line 51
    invoke-static {}, Ll/eb20;->b()Z

    .line 52
    .line 53
    .line 54
    move-result p0

    .line 55
    if-eqz p0, :cond_0

    .line 56
    .line 57
    invoke-static {}, Ll/eb20;->a()Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    iput-object p0, v0, Lcom/p1/mobile/putong/live/base/data/BLivePostEvent;->fakeId:Ljava/lang/String;

    .line 62
    .line 63
    :cond_0
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;->D7(Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLivePostEvent;)Lrx/c;

    .line 64
    .line 65
    .line 66
    move-result-object p0

    .line 67
    new-instance p1, Ll/zxi;

    .line 68
    .line 69
    invoke-direct {p1}, Ll/zxi;-><init>()V

    .line 70
    .line 71
    .line 72
    new-instance v0, Ll/ayi;

    .line 73
    .line 74
    invoke-direct {v0}, Ll/ayi;-><init>()V

    .line 75
    .line 76
    .line 77
    invoke-static {p1, v0}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 78
    .line 79
    .line 80
    move-result-object p1

    .line 81
    invoke-virtual {p0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 82
    .line 83
    .line 84
    return-void
.end method

.method public F4()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/jyi;->j:Ll/jxd0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ljava/lang/Boolean;

    .line 8
    .line 9
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    iget-object p0, p0, Ll/jyi;->j:Ll/jxd0;

    .line 16
    .line 17
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 18
    .line 19
    invoke-virtual {p0, v0}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    :cond_0
    return-void
.end method

.method public final g4(Ll/jyi$a;)V
    .locals 2

    .line 1
    invoke-virtual {p0, p1}, Ll/jyi;->k4(Ll/jyi$a;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    iget-object v0, p0, Ll/jyi;->r:Ljava/util/ArrayList;

    .line 9
    .line 10
    new-instance v1, Ll/rxi;

    .line 11
    .line 12
    invoke-direct {v1, p1}, Ll/rxi;-><init>(Ll/jyi$a;)V

    .line 13
    .line 14
    .line 15
    invoke-static {v0, v1}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    check-cast v0, Ll/jyi$a;

    .line 20
    .line 21
    if-eqz v0, :cond_1

    .line 22
    .line 23
    :goto_0
    return-void

    .line 24
    :cond_1
    iget-object p0, p0, Ll/jyi;->r:Ljava/util/ArrayList;

    .line 25
    .line 26
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public final h4(Ljava/util/List;Lcom/p1/mobile/putong/live/base/data/BLiveFollowConditions;Ljava/lang/String;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;",
            "Lcom/p1/mobile/putong/live/base/data/BLiveFollowConditions;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/wxi;

    .line 2
    .line 3
    invoke-direct {v0, p0, p3, p2}, Ll/wxi;-><init>(Ll/jyi;Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveFollowConditions;)V

    .line 4
    .line 5
    .line 6
    invoke-static {p1, v0}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final i4(J)Z
    .locals 4

    .line 1
    iget-object p1, p0, Ll/jyi;->r:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {p1}, Ljava/util/ArrayList;->isEmpty()Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-nez p1, :cond_0

    .line 8
    .line 9
    iget-boolean p1, p0, Ll/jyi;->t:Z

    .line 10
    .line 11
    if-nez p1, :cond_0

    .line 12
    .line 13
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    invoke-virtual {p1}, Ll/oo2;->R0()Z

    .line 18
    .line 19
    .line 20
    move-result p1

    .line 21
    if-nez p1, :cond_0

    .line 22
    .line 23
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 24
    .line 25
    .line 26
    move-result-wide p1

    .line 27
    iget-wide v0, p0, Ll/jyi;->s:J

    .line 28
    .line 29
    sub-long/2addr p1, v0

    .line 30
    invoke-static {}, Ll/zrv;->k()Ll/vwt;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    invoke-virtual {v0}, Ll/vwt;->I3()J

    .line 35
    .line 36
    .line 37
    move-result-wide v0

    .line 38
    const-wide/16 v2, 0x3e8

    .line 39
    .line 40
    mul-long/2addr v0, v2

    .line 41
    cmp-long p1, p1, v0

    .line 42
    .line 43
    if-lez p1, :cond_0

    .line 44
    .line 45
    invoke-virtual {p0}, Ll/xzs;->K2()Ll/t8s;

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    sget-object p2, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/LiveDialogEnum;->FAST_RECHARGE:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/LiveDialogEnum;

    .line 50
    .line 51
    sget-object v0, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/LiveDialogEnum;->GIFT:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/LiveDialogEnum;

    .line 52
    .line 53
    sget-object v1, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/LiveDialogEnum;->MEMBER:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/LiveDialogEnum;

    .line 54
    .line 55
    sget-object v2, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/LiveDialogEnum;->USER_CARD:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/LiveDialogEnum;

    .line 56
    .line 57
    sget-object v3, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/LiveDialogEnum;->WEBVIEW:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/LiveDialogEnum;

    .line 58
    .line 59
    filled-new-array {p2, v0, v1, v2, v3}, [Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/LiveDialogEnum;

    .line 60
    .line 61
    .line 62
    move-result-object p2

    .line 63
    invoke-virtual {p1, p2}, Ll/t8s;->l([Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/LiveDialogEnum;)Z

    .line 64
    .line 65
    .line 66
    move-result p1

    .line 67
    if-nez p1, :cond_0

    .line 68
    .line 69
    new-instance p1, Ll/xcd0;

    .line 70
    .line 71
    const/16 p2, 0x834

    .line 72
    .line 73
    invoke-direct {p1, p2}, Ll/xcd0;-><init>(I)V

    .line 74
    .line 75
    .line 76
    invoke-virtual {p0, p1}, Ll/i6t;->F3(Ll/hk2;)Ljava/lang/Object;

    .line 77
    .line 78
    .line 79
    move-result-object p1

    .line 80
    check-cast p1, Ljava/lang/Boolean;

    .line 81
    .line 82
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 83
    .line 84
    .line 85
    move-result p1

    .line 86
    if-nez p1, :cond_0

    .line 87
    .line 88
    new-instance p1, Ll/pxj;

    .line 89
    .line 90
    invoke-direct {p1, p2}, Ll/pxj;-><init>(I)V

    .line 91
    .line 92
    .line 93
    invoke-virtual {p0, p1}, Ll/i6t;->F3(Ll/hk2;)Ljava/lang/Object;

    .line 94
    .line 95
    .line 96
    move-result-object p0

    .line 97
    check-cast p0, Ljava/lang/Boolean;

    .line 98
    .line 99
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 100
    .line 101
    .line 102
    move-result p0

    .line 103
    if-nez p0, :cond_0

    .line 104
    .line 105
    const/4 p0, 0x1

    .line 106
    return p0

    .line 107
    :cond_0
    const/4 p0, 0x0

    .line 108
    return p0
.end method

.method public final j4()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/jyi;->j:Ll/jxd0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ljava/lang/Boolean;

    .line 8
    .line 9
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    iget-object v0, p0, Ll/jyi;->B:Ll/jyi$a;

    .line 16
    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    const/4 v1, 0x3

    .line 24
    sget-object v2, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    .line 25
    .line 26
    invoke-virtual {v0, v1, v2}, Ll/oo2;->j2(ILjava/util/concurrent/TimeUnit;)Lrx/c;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    invoke-virtual {p0, v0}, Ll/i6t;->H3(Lrx/c;)Lrx/c;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    const/4 v1, 0x1

    .line 35
    invoke-virtual {v0, v1}, Lrx/c;->take(I)Lrx/c;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    new-instance v1, Ll/nxi;

    .line 40
    .line 41
    invoke-direct {v1, p0}, Ll/nxi;-><init>(Ll/jyi;)V

    .line 42
    .line 43
    .line 44
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 49
    .line 50
    .line 51
    :cond_0
    return-void
.end method

.method public final k4(Ll/jyi$a;)Z
    .locals 13

    .line 1
    iget-object v0, p1, Ll/jyi$a;->b:Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    const/4 v2, 0x2

    .line 11
    const/4 v3, 0x1

    .line 12
    const/4 v4, 0x0

    .line 13
    const/4 v5, -0x1

    .line 14
    sparse-switch v1, :sswitch_data_0

    .line 15
    .line 16
    .line 17
    :goto_0
    move v0, v5

    .line 18
    goto :goto_1

    .line 19
    :sswitch_0
    const-string v1, "action_bubble"

    .line 20
    .line 21
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-nez v0, :cond_0

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_0
    move v0, v2

    .line 29
    goto :goto_1

    .line 30
    :sswitch_1
    const-string v1, "action_bottom_menu"

    .line 31
    .line 32
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    if-nez v0, :cond_1

    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_1
    move v0, v3

    .line 40
    goto :goto_1

    .line 41
    :sswitch_2
    const-string v1, "action_chat_message"

    .line 42
    .line 43
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    if-nez v0, :cond_2

    .line 48
    .line 49
    goto :goto_0

    .line 50
    :cond_2
    move v0, v4

    .line 51
    :goto_1
    const/4 v1, 0x0

    .line 52
    packed-switch v0, :pswitch_data_0

    .line 53
    .line 54
    .line 55
    const/16 v0, 0xbb8

    .line 56
    .line 57
    move v8, v0

    .line 58
    move-object v0, v1

    .line 59
    move-object v7, v0

    .line 60
    move v6, v4

    .line 61
    goto :goto_2

    .line 62
    :pswitch_0
    iget-object v0, p0, Ll/jyi;->l:Ll/vxd0;

    .line 63
    .line 64
    invoke-static {}, Ll/zrv;->k()Ll/vwt;

    .line 65
    .line 66
    .line 67
    move-result-object v6

    .line 68
    invoke-virtual {v6}, Ll/vwt;->J3()Lcom/p1/mobile/putong/live/base/data/BLiveFollowRateBubbleV2;

    .line 69
    .line 70
    .line 71
    move-result-object v6

    .line 72
    iget v6, v6, Lcom/p1/mobile/putong/live/base/data/BLiveFollowRateBubbleV2;->maxShowCount:I

    .line 73
    .line 74
    iget-object v7, p0, Ll/jyi;->o:Ll/byd0;

    .line 75
    .line 76
    invoke-static {}, Ll/zrv;->k()Ll/vwt;

    .line 77
    .line 78
    .line 79
    move-result-object v8

    .line 80
    invoke-virtual {v8}, Ll/vwt;->J3()Lcom/p1/mobile/putong/live/base/data/BLiveFollowRateBubbleV2;

    .line 81
    .line 82
    .line 83
    move-result-object v8

    .line 84
    iget v8, v8, Lcom/p1/mobile/putong/live/base/data/BLiveFollowRateBubbleV2;->minEventInterval:I

    .line 85
    .line 86
    goto :goto_2

    .line 87
    :pswitch_1
    iget-object v0, p0, Ll/jyi;->m:Ll/vxd0;

    .line 88
    .line 89
    invoke-static {}, Ll/zrv;->k()Ll/vwt;

    .line 90
    .line 91
    .line 92
    move-result-object v6

    .line 93
    invoke-virtual {v6}, Ll/vwt;->O3()Lcom/p1/mobile/putong/live/base/data/BLiveFollowRatePopupV2;

    .line 94
    .line 95
    .line 96
    move-result-object v6

    .line 97
    iget v6, v6, Lcom/p1/mobile/putong/live/base/data/BLiveFollowRatePopupV2;->maxShowCount:I

    .line 98
    .line 99
    iget-object v7, p0, Ll/jyi;->p:Ll/byd0;

    .line 100
    .line 101
    invoke-static {}, Ll/zrv;->k()Ll/vwt;

    .line 102
    .line 103
    .line 104
    move-result-object v8

    .line 105
    invoke-virtual {v8}, Ll/vwt;->O3()Lcom/p1/mobile/putong/live/base/data/BLiveFollowRatePopupV2;

    .line 106
    .line 107
    .line 108
    move-result-object v8

    .line 109
    iget v8, v8, Lcom/p1/mobile/putong/live/base/data/BLiveFollowRatePopupV2;->minEventInterval:I

    .line 110
    .line 111
    goto :goto_2

    .line 112
    :pswitch_2
    iget-object v0, p0, Ll/jyi;->k:Ll/vxd0;

    .line 113
    .line 114
    invoke-static {}, Ll/zrv;->k()Ll/vwt;

    .line 115
    .line 116
    .line 117
    move-result-object v6

    .line 118
    invoke-virtual {v6}, Ll/vwt;->K3()Lcom/p1/mobile/putong/live/base/data/BLiveFollowRateChatV2;

    .line 119
    .line 120
    .line 121
    move-result-object v6

    .line 122
    iget v6, v6, Lcom/p1/mobile/putong/live/base/data/BLiveFollowRateChatV2;->maxShowCount:I

    .line 123
    .line 124
    iget-object v7, p0, Ll/jyi;->q:Ll/byd0;

    .line 125
    .line 126
    move v8, v4

    .line 127
    :goto_2
    iget-object v9, p1, Ll/jyi$a;->c:Ljava/lang/String;

    .line 128
    .line 129
    invoke-virtual {v9}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 130
    .line 131
    .line 132
    invoke-virtual {v9}, Ljava/lang/String;->hashCode()I

    .line 133
    .line 134
    .line 135
    move-result v10

    .line 136
    sparse-switch v10, :sswitch_data_1

    .line 137
    .line 138
    .line 139
    :goto_3
    move v2, v5

    .line 140
    goto :goto_4

    .line 141
    :sswitch_3
    const-string v2, "otherFollowAnchor"

    .line 142
    .line 143
    invoke-virtual {v9, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 144
    .line 145
    .line 146
    move-result v2

    .line 147
    if-nez v2, :cond_3

    .line 148
    .line 149
    goto :goto_3

    .line 150
    :cond_3
    const/4 v2, 0x5

    .line 151
    goto :goto_4

    .line 152
    :sswitch_4
    const-string v2, "rewardPoint"

    .line 153
    .line 154
    invoke-virtual {v9, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 155
    .line 156
    .line 157
    move-result v2

    .line 158
    if-nez v2, :cond_4

    .line 159
    .line 160
    goto :goto_3

    .line 161
    :cond_4
    const/4 v2, 0x4

    .line 162
    goto :goto_4

    .line 163
    :sswitch_5
    const-string v2, "start"

    .line 164
    .line 165
    invoke-virtual {v9, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 166
    .line 167
    .line 168
    move-result v2

    .line 169
    if-nez v2, :cond_5

    .line 170
    .line 171
    goto :goto_3

    .line 172
    :cond_5
    const/4 v2, 0x3

    .line 173
    goto :goto_4

    .line 174
    :sswitch_6
    const-string v10, "chat"

    .line 175
    .line 176
    invoke-virtual {v9, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 177
    .line 178
    .line 179
    move-result v9

    .line 180
    if-nez v9, :cond_8

    .line 181
    .line 182
    goto :goto_3

    .line 183
    :sswitch_7
    const-string v2, "watchTime"

    .line 184
    .line 185
    invoke-virtual {v9, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 186
    .line 187
    .line 188
    move-result v2

    .line 189
    if-nez v2, :cond_6

    .line 190
    .line 191
    goto :goto_3

    .line 192
    :cond_6
    move v2, v3

    .line 193
    goto :goto_4

    .line 194
    :sswitch_8
    const-string v2, "followByAnchor"

    .line 195
    .line 196
    invoke-virtual {v9, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 197
    .line 198
    .line 199
    move-result v2

    .line 200
    if-nez v2, :cond_7

    .line 201
    .line 202
    goto :goto_3

    .line 203
    :cond_7
    move v2, v4

    .line 204
    :cond_8
    :goto_4
    const-string v5, ""

    .line 205
    .line 206
    packed-switch v2, :pswitch_data_1

    .line 207
    .line 208
    .line 209
    goto/16 :goto_5

    .line 210
    .line 211
    :pswitch_3
    new-instance v1, Ll/wyd0;

    .line 212
    .line 213
    new-instance v2, Ljava/lang/StringBuilder;

    .line 214
    .line 215
    const-string v9, "follow_guide_anchor_other_follow"

    .line 216
    .line 217
    invoke-direct {v2, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 218
    .line 219
    .line 220
    iget p1, p1, Ll/jyi$a;->a:I

    .line 221
    .line 222
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 223
    .line 224
    .line 225
    iget-object p1, p0, Ll/jyi;->i:Ljava/lang/String;

    .line 226
    .line 227
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 228
    .line 229
    .line 230
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 231
    .line 232
    .line 233
    move-result-object p1

    .line 234
    invoke-direct {v1, p1, v5}, Ll/wyd0;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 235
    .line 236
    .line 237
    goto/16 :goto_5

    .line 238
    .line 239
    :pswitch_4
    new-instance v1, Ll/wyd0;

    .line 240
    .line 241
    new-instance v2, Ljava/lang/StringBuilder;

    .line 242
    .line 243
    const-string v9, "follow_guide_anchor_reward_point"

    .line 244
    .line 245
    invoke-direct {v2, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 246
    .line 247
    .line 248
    iget p1, p1, Ll/jyi$a;->a:I

    .line 249
    .line 250
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 251
    .line 252
    .line 253
    iget-object p1, p0, Ll/jyi;->i:Ljava/lang/String;

    .line 254
    .line 255
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 256
    .line 257
    .line 258
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 259
    .line 260
    .line 261
    move-result-object p1

    .line 262
    invoke-direct {v1, p1, v5}, Ll/wyd0;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 263
    .line 264
    .line 265
    goto :goto_5

    .line 266
    :pswitch_5
    new-instance v1, Ll/wyd0;

    .line 267
    .line 268
    new-instance v2, Ljava/lang/StringBuilder;

    .line 269
    .line 270
    const-string v9, "follow_guide_anchor_first_enter"

    .line 271
    .line 272
    invoke-direct {v2, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 273
    .line 274
    .line 275
    iget p1, p1, Ll/jyi$a;->a:I

    .line 276
    .line 277
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 278
    .line 279
    .line 280
    iget-object p1, p0, Ll/jyi;->i:Ljava/lang/String;

    .line 281
    .line 282
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 283
    .line 284
    .line 285
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 286
    .line 287
    .line 288
    move-result-object p1

    .line 289
    invoke-direct {v1, p1, v5}, Ll/wyd0;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 290
    .line 291
    .line 292
    goto :goto_5

    .line 293
    :pswitch_6
    new-instance v1, Ll/wyd0;

    .line 294
    .line 295
    new-instance v2, Ljava/lang/StringBuilder;

    .line 296
    .line 297
    const-string v9, "follow_guide_anchor_chat_count"

    .line 298
    .line 299
    invoke-direct {v2, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 300
    .line 301
    .line 302
    iget p1, p1, Ll/jyi$a;->a:I

    .line 303
    .line 304
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 305
    .line 306
    .line 307
    iget-object p1, p0, Ll/jyi;->i:Ljava/lang/String;

    .line 308
    .line 309
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 310
    .line 311
    .line 312
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 313
    .line 314
    .line 315
    move-result-object p1

    .line 316
    invoke-direct {v1, p1, v5}, Ll/wyd0;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 317
    .line 318
    .line 319
    goto :goto_5

    .line 320
    :pswitch_7
    new-instance v1, Ll/wyd0;

    .line 321
    .line 322
    new-instance v2, Ljava/lang/StringBuilder;

    .line 323
    .line 324
    const-string v9, "follow_guide_anchor_watch_time"

    .line 325
    .line 326
    invoke-direct {v2, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 327
    .line 328
    .line 329
    iget p1, p1, Ll/jyi$a;->a:I

    .line 330
    .line 331
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 332
    .line 333
    .line 334
    iget-object p1, p0, Ll/jyi;->i:Ljava/lang/String;

    .line 335
    .line 336
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 337
    .line 338
    .line 339
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 340
    .line 341
    .line 342
    move-result-object p1

    .line 343
    invoke-direct {v1, p1, v5}, Ll/wyd0;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 344
    .line 345
    .line 346
    goto :goto_5

    .line 347
    :pswitch_8
    new-instance v1, Ll/wyd0;

    .line 348
    .line 349
    new-instance v2, Ljava/lang/StringBuilder;

    .line 350
    .line 351
    const-string v9, "follow_guide_anchor_follow_by_anchor"

    .line 352
    .line 353
    invoke-direct {v2, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 354
    .line 355
    .line 356
    iget p1, p1, Ll/jyi$a;->a:I

    .line 357
    .line 358
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 359
    .line 360
    .line 361
    iget-object p1, p0, Ll/jyi;->i:Ljava/lang/String;

    .line 362
    .line 363
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 364
    .line 365
    .line 366
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 367
    .line 368
    .line 369
    move-result-object p1

    .line 370
    invoke-direct {v1, p1, v5}, Ll/wyd0;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 371
    .line 372
    .line 373
    :goto_5
    if-eqz v1, :cond_11

    .line 374
    .line 375
    if-eqz v0, :cond_11

    .line 376
    .line 377
    if-nez v7, :cond_9

    .line 378
    .line 379
    goto/16 :goto_6

    .line 380
    .line 381
    :cond_9
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 382
    .line 383
    .line 384
    move-result-wide v9

    .line 385
    invoke-virtual {v7}, Ll/azd0;->get()Ljava/lang/Object;

    .line 386
    .line 387
    .line 388
    move-result-object p1

    .line 389
    check-cast p1, Ljava/lang/Long;

    .line 390
    .line 391
    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    .line 392
    .line 393
    .line 394
    move-result-wide v11

    .line 395
    sub-long/2addr v9, v11

    .line 396
    mul-int/lit16 v8, v8, 0x3e8

    .line 397
    .line 398
    int-to-long v11, v8

    .line 399
    cmp-long p1, v9, v11

    .line 400
    .line 401
    if-gez p1, :cond_a

    .line 402
    .line 403
    return v3

    .line 404
    :cond_a
    iget-object p1, p0, Ll/jyi;->n:Ll/byd0;

    .line 405
    .line 406
    invoke-virtual {p1}, Ll/azd0;->get()Ljava/lang/Object;

    .line 407
    .line 408
    .line 409
    move-result-object p1

    .line 410
    check-cast p1, Ljava/lang/Long;

    .line 411
    .line 412
    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    .line 413
    .line 414
    .line 415
    move-result-wide v8

    .line 416
    invoke-static {v8, v9}, Ll/pzi0;->D(J)Z

    .line 417
    .line 418
    .line 419
    move-result p1

    .line 420
    if-nez p1, :cond_b

    .line 421
    .line 422
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 423
    .line 424
    .line 425
    move-result-object p1

    .line 426
    invoke-virtual {v0, p1}, Ll/vxd0;->put(Ljava/lang/Object;)Z

    .line 427
    .line 428
    .line 429
    :cond_b
    invoke-virtual {v1}, Ll/azd0;->get()Ljava/lang/Object;

    .line 430
    .line 431
    .line 432
    move-result-object p1

    .line 433
    check-cast p1, Ljava/lang/String;

    .line 434
    .line 435
    invoke-virtual {p0, p1}, Ll/jyi;->B4(Ljava/lang/String;)Ljava/util/ArrayList;

    .line 436
    .line 437
    .line 438
    move-result-object p1

    .line 439
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 440
    .line 441
    .line 442
    move-result-object v2

    .line 443
    invoke-virtual {v2}, Ll/oo2;->l0()Lcom/p1/mobile/putong/data/User;

    .line 444
    .line 445
    .line 446
    move-result-object v2

    .line 447
    if-nez v2, :cond_c

    .line 448
    .line 449
    return v3

    .line 450
    :cond_c
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 451
    .line 452
    .line 453
    move-result-object v2

    .line 454
    invoke-virtual {v2}, Ll/oo2;->l0()Lcom/p1/mobile/putong/data/User;

    .line 455
    .line 456
    .line 457
    move-result-object v2

    .line 458
    iget-object v2, v2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 459
    .line 460
    invoke-virtual {p1, v2}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    .line 461
    .line 462
    .line 463
    move-result v2

    .line 464
    invoke-static {}, Ll/zrv;->k()Ll/vwt;

    .line 465
    .line 466
    .line 467
    move-result-object v5

    .line 468
    invoke-virtual {v5}, Ll/vwt;->M3()Lcom/p1/mobile/putong/live/base/data/BLiveFollowRateConfigV2;

    .line 469
    .line 470
    .line 471
    move-result-object v5

    .line 472
    iget v5, v5, Lcom/p1/mobile/putong/live/base/data/BLiveFollowRateConfigV2;->noRepeatAnchorCount:I

    .line 473
    .line 474
    if-le v5, v3, :cond_e

    .line 475
    .line 476
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    .line 477
    .line 478
    .line 479
    move-result v8

    .line 480
    sub-int/2addr v5, v3

    .line 481
    if-lt v8, v5, :cond_d

    .line 482
    .line 483
    invoke-virtual {p1, v4}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 484
    .line 485
    .line 486
    :cond_d
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 487
    .line 488
    .line 489
    move-result-object v5

    .line 490
    invoke-virtual {v5}, Ll/oo2;->l0()Lcom/p1/mobile/putong/data/User;

    .line 491
    .line 492
    .line 493
    move-result-object v5

    .line 494
    iget-object v5, v5, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 495
    .line 496
    invoke-virtual {p1, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 497
    .line 498
    .line 499
    new-instance v5, Ljava/lang/StringBuilder;

    .line 500
    .line 501
    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    .line 502
    .line 503
    .line 504
    new-instance v8, Ll/vxi;

    .line 505
    .line 506
    invoke-direct {v8, v5}, Ll/vxi;-><init>(Ljava/lang/StringBuilder;)V

    .line 507
    .line 508
    .line 509
    invoke-static {p1, v8}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 510
    .line 511
    .line 512
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 513
    .line 514
    .line 515
    move-result-object p1

    .line 516
    invoke-virtual {v1, p1}, Ll/wyd0;->put(Ljava/lang/Object;)Z

    .line 517
    .line 518
    .line 519
    :cond_e
    if-eqz v2, :cond_f

    .line 520
    .line 521
    return v3

    .line 522
    :cond_f
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 523
    .line 524
    .line 525
    move-result-object p1

    .line 526
    check-cast p1, Ljava/lang/Integer;

    .line 527
    .line 528
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 529
    .line 530
    .line 531
    move-result p1

    .line 532
    if-lt p1, v6, :cond_10

    .line 533
    .line 534
    return v3

    .line 535
    :cond_10
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 536
    .line 537
    .line 538
    move-result-object p1

    .line 539
    check-cast p1, Ljava/lang/Integer;

    .line 540
    .line 541
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 542
    .line 543
    .line 544
    move-result p1

    .line 545
    add-int/2addr p1, v3

    .line 546
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 547
    .line 548
    .line 549
    move-result-object p1

    .line 550
    invoke-virtual {v0, p1}, Ll/vxd0;->put(Ljava/lang/Object;)Z

    .line 551
    .line 552
    .line 553
    iget-object p0, p0, Ll/jyi;->n:Ll/byd0;

    .line 554
    .line 555
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 556
    .line 557
    .line 558
    move-result-wide v0

    .line 559
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 560
    .line 561
    .line 562
    move-result-object p1

    .line 563
    invoke-virtual {p0, p1}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 564
    .line 565
    .line 566
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 567
    .line 568
    .line 569
    move-result-wide p0

    .line 570
    invoke-static {p0, p1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 571
    .line 572
    .line 573
    move-result-object p0

    .line 574
    invoke-virtual {v7, p0}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 575
    .line 576
    .line 577
    return v4

    .line 578
    :cond_11
    :goto_6
    return v3

    .line 579
    :sswitch_data_0
    .sparse-switch
        -0x7b3e6a77 -> :sswitch_2
        -0x1fdced96 -> :sswitch_1
        0x3ecfeab5 -> :sswitch_0
    .end sparse-switch

    .line 580
    .line 581
    .line 582
    .line 583
    .line 584
    .line 585
    .line 586
    .line 587
    .line 588
    .line 589
    .line 590
    .line 591
    .line 592
    .line 593
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch

    .line 594
    .line 595
    .line 596
    .line 597
    .line 598
    .line 599
    .line 600
    .line 601
    .line 602
    .line 603
    :sswitch_data_1
    .sparse-switch
        -0x71b5c343 -> :sswitch_8
        -0x10ba73c4 -> :sswitch_7
        0x2e9358 -> :sswitch_6
        0x68ac462 -> :sswitch_5
        0x34b93ba1 -> :sswitch_4
        0x60235cf6 -> :sswitch_3
    .end sparse-switch

    .line 604
    .line 605
    .line 606
    .line 607
    .line 608
    .line 609
    .line 610
    .line 611
    .line 612
    .line 613
    .line 614
    .line 615
    .line 616
    .line 617
    .line 618
    .line 619
    .line 620
    .line 621
    .line 622
    .line 623
    .line 624
    .line 625
    .line 626
    .line 627
    .line 628
    .line 629
    :pswitch_data_1
    .packed-switch 0x0
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
    .end packed-switch
.end method

.method public final l4(Ll/jyi$a;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/xzs;->L2()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {v0}, Ll/oo2;->R0()Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-eqz v0, :cond_1

    .line 17
    .line 18
    :goto_0
    return-void

    .line 19
    :cond_1
    invoke-virtual {p0, p1}, Ll/jyi;->g4(Ll/jyi$a;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public final m4(Ljava/util/ArrayList;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Ll/jyi$a;",
            ">;)V"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/sxi;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/sxi;-><init>(Ll/jyi;)V

    .line 4
    .line 5
    .line 6
    invoke-static {p1, v0}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final n4()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/jyi;->y:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/jyi;->z:Ljava/util/ArrayList;

    .line 7
    .line 8
    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Ll/jyi;->A:Ljava/util/ArrayList;

    .line 12
    .line 13
    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 14
    .line 15
    .line 16
    invoke-static {}, Ll/zrv;->k()Ll/vwt;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-virtual {v0}, Ll/vwt;->M3()Lcom/p1/mobile/putong/live/base/data/BLiveFollowRateConfigV2;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    iget-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveFollowRateConfigV2;->bubble:Lcom/p1/mobile/putong/live/base/data/BLiveFollowRateBubbleV2;

    .line 25
    .line 26
    iget-object v2, v1, Lcom/p1/mobile/putong/live/base/data/BLiveFollowRateBubbleV2;->triggerEvents:Ljava/util/List;

    .line 27
    .line 28
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveFollowRateBubbleV2;->conditions:Lcom/p1/mobile/putong/live/base/data/BLiveFollowConditions;

    .line 29
    .line 30
    const-string v3, "action_bubble"

    .line 31
    .line 32
    invoke-virtual {p0, v2, v1, v3}, Ll/jyi;->h4(Ljava/util/List;Lcom/p1/mobile/putong/live/base/data/BLiveFollowConditions;Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    iget-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveFollowRateConfigV2;->popup:Lcom/p1/mobile/putong/live/base/data/BLiveFollowRatePopupV2;

    .line 36
    .line 37
    iget-object v2, v1, Lcom/p1/mobile/putong/live/base/data/BLiveFollowRatePopupV2;->triggerEvents:Ljava/util/List;

    .line 38
    .line 39
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveFollowRatePopupV2;->conditions:Lcom/p1/mobile/putong/live/base/data/BLiveFollowConditions;

    .line 40
    .line 41
    const-string v3, "action_bottom_menu"

    .line 42
    .line 43
    invoke-virtual {p0, v2, v1, v3}, Ll/jyi;->h4(Ljava/util/List;Lcom/p1/mobile/putong/live/base/data/BLiveFollowConditions;Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveFollowRateConfigV2;->chat:Lcom/p1/mobile/putong/live/base/data/BLiveFollowRateChatV2;

    .line 47
    .line 48
    iget-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveFollowRateChatV2;->triggerEvents:Ljava/util/List;

    .line 49
    .line 50
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveFollowRateChatV2;->conditions:Lcom/p1/mobile/putong/live/base/data/BLiveFollowConditions;

    .line 51
    .line 52
    const-string v2, "action_chat_message"

    .line 53
    .line 54
    invoke-virtual {p0, v1, v0, v2}, Ll/jyi;->h4(Ljava/util/List;Lcom/p1/mobile/putong/live/base/data/BLiveFollowConditions;Ljava/lang/String;)V

    .line 55
    .line 56
    .line 57
    new-instance v0, Ll/oxi;

    .line 58
    .line 59
    invoke-direct {v0}, Ll/oxi;-><init>()V

    .line 60
    .line 61
    .line 62
    iget-object v1, p0, Ll/jyi;->y:Ljava/util/ArrayList;

    .line 63
    .line 64
    invoke-static {v1, v0}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 65
    .line 66
    .line 67
    iget-object v1, p0, Ll/jyi;->z:Ljava/util/ArrayList;

    .line 68
    .line 69
    invoke-static {v1, v0}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 70
    .line 71
    .line 72
    iget-object p0, p0, Ll/jyi;->A:Ljava/util/ArrayList;

    .line 73
    .line 74
    invoke-static {p0, v0}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 75
    .line 76
    .line 77
    return-void
.end method

.method public final synthetic o4(Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveFollowConditions;Ljava/lang/String;)V
    .locals 3

    .line 1
    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p3}, Ljava/lang/String;->hashCode()I

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    const/4 v1, 0x0

    .line 9
    const/4 v2, -0x1

    .line 10
    sparse-switch v0, :sswitch_data_0

    .line 11
    .line 12
    .line 13
    goto :goto_0

    .line 14
    :sswitch_0
    const-string v0, "otherFollowAnchor"

    .line 15
    .line 16
    invoke-virtual {p3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-nez v0, :cond_0

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    const/4 v2, 0x5

    .line 24
    goto :goto_0

    .line 25
    :sswitch_1
    const-string v0, "rewardPoint"

    .line 26
    .line 27
    invoke-virtual {p3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-nez v0, :cond_1

    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_1
    const/4 v2, 0x4

    .line 35
    goto :goto_0

    .line 36
    :sswitch_2
    const-string v0, "start"

    .line 37
    .line 38
    invoke-virtual {p3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    if-nez v0, :cond_2

    .line 43
    .line 44
    goto :goto_0

    .line 45
    :cond_2
    const/4 v2, 0x3

    .line 46
    goto :goto_0

    .line 47
    :sswitch_3
    const-string v0, "chat"

    .line 48
    .line 49
    invoke-virtual {p3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 50
    .line 51
    .line 52
    move-result v0

    .line 53
    if-nez v0, :cond_3

    .line 54
    .line 55
    goto :goto_0

    .line 56
    :cond_3
    const/4 v2, 0x2

    .line 57
    goto :goto_0

    .line 58
    :sswitch_4
    const-string v0, "watchTime"

    .line 59
    .line 60
    invoke-virtual {p3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 61
    .line 62
    .line 63
    move-result v0

    .line 64
    if-nez v0, :cond_4

    .line 65
    .line 66
    goto :goto_0

    .line 67
    :cond_4
    const/4 v2, 0x1

    .line 68
    goto :goto_0

    .line 69
    :sswitch_5
    const-string v0, "followByAnchor"

    .line 70
    .line 71
    invoke-virtual {p3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 72
    .line 73
    .line 74
    move-result v0

    .line 75
    if-nez v0, :cond_5

    .line 76
    .line 77
    goto :goto_0

    .line 78
    :cond_5
    move v2, v1

    .line 79
    :goto_0
    packed-switch v2, :pswitch_data_0

    .line 80
    .line 81
    .line 82
    return-void

    .line 83
    :pswitch_0
    new-instance p2, Ll/jyi$a;

    .line 84
    .line 85
    invoke-direct {p2, p1, v1, p3}, Ll/jyi$a;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 86
    .line 87
    .line 88
    iput-object p2, p0, Ll/jyi;->D:Ll/jyi$a;

    .line 89
    .line 90
    return-void

    .line 91
    :pswitch_1
    iget-object p0, p0, Ll/jyi;->z:Ljava/util/ArrayList;

    .line 92
    .line 93
    new-instance v0, Ll/jyi$a;

    .line 94
    .line 95
    iget-object p2, p2, Lcom/p1/mobile/putong/live/base/data/BLiveFollowConditions;->rewardPoint:Ljava/lang/String;

    .line 96
    .line 97
    invoke-static {p2}, Ll/xau;->C(Ljava/lang/String;)I

    .line 98
    .line 99
    .line 100
    move-result p2

    .line 101
    invoke-direct {v0, p1, p2, p3}, Ll/jyi$a;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 102
    .line 103
    .line 104
    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 105
    .line 106
    .line 107
    return-void

    .line 108
    :pswitch_2
    new-instance p2, Ll/jyi$a;

    .line 109
    .line 110
    invoke-direct {p2, p1, v1, p3}, Ll/jyi$a;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 111
    .line 112
    .line 113
    iput-object p2, p0, Ll/jyi;->B:Ll/jyi$a;

    .line 114
    .line 115
    return-void

    .line 116
    :pswitch_3
    iget-object p0, p0, Ll/jyi;->A:Ljava/util/ArrayList;

    .line 117
    .line 118
    new-instance v0, Ll/jyi$a;

    .line 119
    .line 120
    iget-object p2, p2, Lcom/p1/mobile/putong/live/base/data/BLiveFollowConditions;->msgCount:Ljava/lang/String;

    .line 121
    .line 122
    invoke-static {p2}, Ll/xau;->C(Ljava/lang/String;)I

    .line 123
    .line 124
    .line 125
    move-result p2

    .line 126
    invoke-direct {v0, p1, p2, p3}, Ll/jyi$a;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 127
    .line 128
    .line 129
    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 130
    .line 131
    .line 132
    return-void

    .line 133
    :pswitch_4
    iget-object p0, p0, Ll/jyi;->y:Ljava/util/ArrayList;

    .line 134
    .line 135
    new-instance v0, Ll/jyi$a;

    .line 136
    .line 137
    iget-object p2, p2, Lcom/p1/mobile/putong/live/base/data/BLiveFollowConditions;->watchTime:Ljava/lang/String;

    .line 138
    .line 139
    invoke-static {p2}, Ll/xau;->C(Ljava/lang/String;)I

    .line 140
    .line 141
    .line 142
    move-result p2

    .line 143
    invoke-direct {v0, p1, p2, p3}, Ll/jyi$a;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 144
    .line 145
    .line 146
    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 147
    .line 148
    .line 149
    return-void

    .line 150
    :pswitch_5
    new-instance p2, Ll/jyi$a;

    .line 151
    .line 152
    invoke-direct {p2, p1, v1, p3}, Ll/jyi$a;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 153
    .line 154
    .line 155
    iput-object p2, p0, Ll/jyi;->C:Ll/jyi$a;

    .line 156
    .line 157
    return-void

    .line 158
    nop

    .line 159
    :sswitch_data_0
    .sparse-switch
        -0x71b5c343 -> :sswitch_5
        -0x10ba73c4 -> :sswitch_4
        0x2e9358 -> :sswitch_3
        0x68ac462 -> :sswitch_2
        0x34b93ba1 -> :sswitch_1
        0x60235cf6 -> :sswitch_0
    .end sparse-switch

    .line 160
    .line 161
    .line 162
    .line 163
    .line 164
    .line 165
    .line 166
    .line 167
    .line 168
    .line 169
    .line 170
    .line 171
    .line 172
    .line 173
    .line 174
    .line 175
    .line 176
    .line 177
    .line 178
    .line 179
    .line 180
    .line 181
    .line 182
    .line 183
    .line 184
    .line 185
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public final synthetic p4(Ljava/lang/Long;)V
    .locals 0

    .line 1
    iget-object p1, p0, Ll/jyi;->B:Ll/jyi$a;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/jyi;->l4(Ll/jyi$a;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic q4(Ll/jyi$a;)V
    .locals 3

    .line 1
    iget-object v0, p1, Ll/jyi$a;->b:Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    const/4 v2, -0x1

    .line 11
    sparse-switch v1, :sswitch_data_0

    .line 12
    .line 13
    .line 14
    goto :goto_0

    .line 15
    :sswitch_0
    const-string v1, "action_bubble"

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-nez v0, :cond_0

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_0
    const/4 v2, 0x2

    .line 25
    goto :goto_0

    .line 26
    :sswitch_1
    const-string v1, "action_bottom_menu"

    .line 27
    .line 28
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    if-nez v0, :cond_1

    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_1
    const/4 v2, 0x1

    .line 36
    goto :goto_0

    .line 37
    :sswitch_2
    const-string v1, "action_chat_message"

    .line 38
    .line 39
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    if-nez v0, :cond_2

    .line 44
    .line 45
    goto :goto_0

    .line 46
    :cond_2
    const/4 v2, 0x0

    .line 47
    :goto_0
    const-string v0, "start"

    .line 48
    .line 49
    packed-switch v2, :pswitch_data_0

    .line 50
    .line 51
    .line 52
    goto/16 :goto_1

    .line 53
    .line 54
    :pswitch_0
    sget-object p1, Ll/htd0;->b:Ll/htd0;

    .line 55
    .line 56
    invoke-static {p1}, Ll/zrv;->l(Ll/htd0;)Ljava/lang/Object;

    .line 57
    .line 58
    .line 59
    move-result-object p1

    .line 60
    check-cast p1, Ll/jfv;

    .line 61
    .line 62
    invoke-virtual {p1}, Ll/jfv;->e()Lcom/p1/mobile/putong/live/base/data/BLiveMonetizationConfig;

    .line 63
    .line 64
    .line 65
    move-result-object p1

    .line 66
    if-nez p1, :cond_3

    .line 67
    .line 68
    goto :goto_1

    .line 69
    :cond_3
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMonetizationConfig;->bubbleConfigs:Ljava/util/List;

    .line 70
    .line 71
    new-instance v0, Ll/uxi;

    .line 72
    .line 73
    invoke-direct {v0}, Ll/uxi;-><init>()V

    .line 74
    .line 75
    .line 76
    invoke-static {p1, v0}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 77
    .line 78
    .line 79
    move-result-object p1

    .line 80
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;

    .line 81
    .line 82
    if-nez p1, :cond_4

    .line 83
    .line 84
    goto :goto_1

    .line 85
    :cond_4
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 86
    .line 87
    .line 88
    move-result-object p0

    .line 89
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->AvatarEvent:Lcom/tantan/live/eventbus/LiveEventBus$AvatarEvent;

    .line 90
    .line 91
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$AvatarEvent;->showFollowNewUserAnim()Ll/v3f$c;

    .line 92
    .line 93
    .line 94
    move-result-object p0

    .line 95
    invoke-virtual {p0}, Ll/v3f$c;->p()V

    .line 96
    .line 97
    .line 98
    return-void

    .line 99
    :pswitch_1
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 100
    .line 101
    .line 102
    move-result-object v1

    .line 103
    iget-object v1, v1, Lcom/tantan/live/eventbus/LiveEventBus;->FollowDialogEvent:Lcom/tantan/live/eventbus/LiveEventBus$FollowDialogEvent;

    .line 104
    .line 105
    invoke-virtual {v1}, Lcom/tantan/live/eventbus/LiveEventBus$FollowDialogEvent;->show()Ll/v3f$d;

    .line 106
    .line 107
    .line 108
    move-result-object v1

    .line 109
    invoke-static {}, Ll/zrv;->k()Ll/vwt;

    .line 110
    .line 111
    .line 112
    move-result-object v2

    .line 113
    invoke-virtual {v2}, Ll/vwt;->O3()Lcom/p1/mobile/putong/live/base/data/BLiveFollowRatePopupV2;

    .line 114
    .line 115
    .line 116
    move-result-object v2

    .line 117
    invoke-virtual {v1, v2}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 118
    .line 119
    .line 120
    iget-object p1, p1, Ll/jyi$a;->c:Ljava/lang/String;

    .line 121
    .line 122
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 123
    .line 124
    .line 125
    move-result p1

    .line 126
    if-eqz p1, :cond_5

    .line 127
    .line 128
    iget-object p1, p0, Ll/jyi;->j:Ll/jxd0;

    .line 129
    .line 130
    invoke-virtual {p1}, Ll/azd0;->get()Ljava/lang/Object;

    .line 131
    .line 132
    .line 133
    move-result-object p1

    .line 134
    check-cast p1, Ljava/lang/Boolean;

    .line 135
    .line 136
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 137
    .line 138
    .line 139
    move-result p1

    .line 140
    if-eqz p1, :cond_5

    .line 141
    .line 142
    iget-object p0, p0, Ll/jyi;->j:Ll/jxd0;

    .line 143
    .line 144
    sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 145
    .line 146
    invoke-virtual {p0, p1}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 147
    .line 148
    .line 149
    return-void

    .line 150
    :pswitch_2
    iget-object v1, p1, Ll/jyi$a;->c:Ljava/lang/String;

    .line 151
    .line 152
    invoke-virtual {p0, v1}, Ll/jyi;->E4(Ljava/lang/String;)V

    .line 153
    .line 154
    .line 155
    iget-object p1, p1, Ll/jyi$a;->c:Ljava/lang/String;

    .line 156
    .line 157
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 158
    .line 159
    .line 160
    move-result p1

    .line 161
    if-eqz p1, :cond_5

    .line 162
    .line 163
    iget-object p1, p0, Ll/jyi;->j:Ll/jxd0;

    .line 164
    .line 165
    invoke-virtual {p1}, Ll/azd0;->get()Ljava/lang/Object;

    .line 166
    .line 167
    .line 168
    move-result-object p1

    .line 169
    check-cast p1, Ljava/lang/Boolean;

    .line 170
    .line 171
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 172
    .line 173
    .line 174
    move-result p1

    .line 175
    if-eqz p1, :cond_5

    .line 176
    .line 177
    iget-object p0, p0, Ll/jyi;->j:Ll/jxd0;

    .line 178
    .line 179
    sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 180
    .line 181
    invoke-virtual {p0, p1}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 182
    .line 183
    .line 184
    :cond_5
    :goto_1
    return-void

    .line 185
    :sswitch_data_0
    .sparse-switch
        -0x7b3e6a77 -> :sswitch_2
        -0x1fdced96 -> :sswitch_1
        0x3ecfeab5 -> :sswitch_0
    .end sparse-switch

    .line 186
    .line 187
    .line 188
    .line 189
    .line 190
    .line 191
    .line 192
    .line 193
    .line 194
    .line 195
    .line 196
    .line 197
    .line 198
    .line 199
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public final synthetic r4(Ll/jyi$a;)Ljava/lang/Boolean;
    .locals 2

    .line 1
    iget-wide v0, p0, Ll/jyi;->v:J

    .line 2
    .line 3
    iget p0, p1, Ll/jyi$a;->a:I

    .line 4
    .line 5
    int-to-long p0, p0

    .line 6
    cmp-long p0, v0, p0

    .line 7
    .line 8
    if-ltz p0, :cond_0

    .line 9
    .line 10
    const/4 p0, 0x1

    .line 11
    goto :goto_0

    .line 12
    :cond_0
    const/4 p0, 0x0

    .line 13
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0
.end method

.method public final synthetic s4(Ljava/lang/Long;)V
    .locals 4

    .line 1
    iget-wide v0, p0, Ll/jyi;->v:J

    .line 2
    .line 3
    const-wide/16 v2, 0x1

    .line 4
    .line 5
    add-long/2addr v0, v2

    .line 6
    iput-wide v0, p0, Ll/jyi;->v:J

    .line 7
    .line 8
    iget-object p1, p0, Ll/jyi;->y:Ljava/util/ArrayList;

    .line 9
    .line 10
    new-instance v0, Ll/txi;

    .line 11
    .line 12
    invoke-direct {v0, p0}, Ll/txi;-><init>(Ll/jyi;)V

    .line 13
    .line 14
    .line 15
    invoke-static {p1, v0}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    check-cast p1, Ll/jyi$a;

    .line 20
    .line 21
    if-eqz p1, :cond_0

    .line 22
    .line 23
    invoke-virtual {p0, p1}, Ll/jyi;->l4(Ll/jyi$a;)V

    .line 24
    .line 25
    .line 26
    iget-object p0, p0, Ll/jyi;->y:Ljava/util/ArrayList;

    .line 27
    .line 28
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 29
    .line 30
    .line 31
    :cond_0
    return-void
.end method

.method public t()V
    .locals 4

    .line 1
    invoke-super {p0}, Ll/l6t;->t()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Ll/zrv;->k()Ll/vwt;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-virtual {v0}, Ll/vwt;->N3()Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-nez v0, :cond_0

    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    const-wide/16 v0, 0x0

    .line 16
    .line 17
    iput-wide v0, p0, Ll/jyi;->v:J

    .line 18
    .line 19
    const-wide/high16 v2, -0x4010000000000000L    # -1.0

    .line 20
    .line 21
    iput-wide v2, p0, Ll/jyi;->w:D

    .line 22
    .line 23
    iget-object v2, p0, Ll/jyi;->r:Ljava/util/ArrayList;

    .line 24
    .line 25
    invoke-virtual {v2}, Ljava/util/ArrayList;->clear()V

    .line 26
    .line 27
    .line 28
    iput-wide v0, p0, Ll/jyi;->s:J

    .line 29
    .line 30
    const/4 v0, 0x0

    .line 31
    iput-boolean v0, p0, Ll/jyi;->t:Z

    .line 32
    .line 33
    iput v0, p0, Ll/jyi;->u:I

    .line 34
    .line 35
    iget-object v0, p0, Ll/jyi;->y:Ljava/util/ArrayList;

    .line 36
    .line 37
    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 38
    .line 39
    .line 40
    iget-object v0, p0, Ll/jyi;->z:Ljava/util/ArrayList;

    .line 41
    .line 42
    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 43
    .line 44
    .line 45
    iget-object v0, p0, Ll/jyi;->A:Ljava/util/ArrayList;

    .line 46
    .line 47
    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 48
    .line 49
    .line 50
    invoke-virtual {p0}, Ll/jyi;->n4()V

    .line 51
    .line 52
    .line 53
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    const/4 v1, 0x1

    .line 58
    sget-object v2, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    .line 59
    .line 60
    invoke-virtual {v0, v1, v2}, Ll/oo2;->j2(ILjava/util/concurrent/TimeUnit;)Lrx/c;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    invoke-virtual {p0, v0}, Ll/i6t;->H3(Lrx/c;)Lrx/c;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    new-instance v1, Ll/mxi;

    .line 69
    .line 70
    invoke-direct {v1, p0}, Ll/mxi;-><init>(Ll/jyi;)V

    .line 71
    .line 72
    .line 73
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 74
    .line 75
    .line 76
    move-result-object v1

    .line 77
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 78
    .line 79
    .line 80
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 81
    .line 82
    .line 83
    move-result-object v0

    .line 84
    invoke-virtual {v0, v2}, Ll/oo2;->k2(Ljava/util/concurrent/TimeUnit;)Lrx/c;

    .line 85
    .line 86
    .line 87
    move-result-object v0

    .line 88
    invoke-virtual {p0, v0}, Ll/i6t;->H3(Lrx/c;)Lrx/c;

    .line 89
    .line 90
    .line 91
    move-result-object v0

    .line 92
    new-instance v1, Ll/xxi;

    .line 93
    .line 94
    invoke-direct {v1, p0}, Ll/xxi;-><init>(Ll/jyi;)V

    .line 95
    .line 96
    .line 97
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 98
    .line 99
    .line 100
    move-result-object v0

    .line 101
    new-instance v1, Ll/byi;

    .line 102
    .line 103
    invoke-direct {v1, p0}, Ll/byi;-><init>(Ll/jyi;)V

    .line 104
    .line 105
    .line 106
    invoke-virtual {v0, v1}, Lrx/c;->doOnNext(Ll/y20;)Lrx/c;

    .line 107
    .line 108
    .line 109
    move-result-object v0

    .line 110
    new-instance v1, Ll/cyi;

    .line 111
    .line 112
    invoke-direct {v1, p0}, Ll/cyi;-><init>(Ll/jyi;)V

    .line 113
    .line 114
    .line 115
    invoke-virtual {v0, v1}, Lrx/c;->doOnNext(Ll/y20;)Lrx/c;

    .line 116
    .line 117
    .line 118
    move-result-object v0

    .line 119
    invoke-static {}, Ll/dhw;->c()Ll/t9t;

    .line 120
    .line 121
    .line 122
    move-result-object v1

    .line 123
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 124
    .line 125
    .line 126
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 127
    .line 128
    .line 129
    move-result-object v0

    .line 130
    invoke-virtual {v0}, Ll/oo2;->n1()Lrx/c;

    .line 131
    .line 132
    .line 133
    move-result-object v0

    .line 134
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 135
    .line 136
    .line 137
    move-result-object v0

    .line 138
    new-instance v1, Ll/dyi;

    .line 139
    .line 140
    invoke-direct {v1, p0}, Ll/dyi;-><init>(Ll/jyi;)V

    .line 141
    .line 142
    .line 143
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 144
    .line 145
    .line 146
    move-result-object v1

    .line 147
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 148
    .line 149
    .line 150
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 151
    .line 152
    .line 153
    move-result-object v0

    .line 154
    invoke-virtual {v0}, Ll/oo2;->m1()Lrx/c;

    .line 155
    .line 156
    .line 157
    move-result-object v0

    .line 158
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 159
    .line 160
    .line 161
    move-result-object v0

    .line 162
    new-instance v1, Ll/eyi;

    .line 163
    .line 164
    invoke-direct {v1, p0}, Ll/eyi;-><init>(Ll/jyi;)V

    .line 165
    .line 166
    .line 167
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 168
    .line 169
    .line 170
    move-result-object v1

    .line 171
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 172
    .line 173
    .line 174
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 175
    .line 176
    .line 177
    move-result-object v0

    .line 178
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->KeyboardEvent:Lcom/tantan/live/eventbus/LiveEventBus$KeyboardEvent;

    .line 179
    .line 180
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$KeyboardEvent;->show()Ll/v3f$d;

    .line 181
    .line 182
    .line 183
    move-result-object v0

    .line 184
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 185
    .line 186
    .line 187
    move-result-object v0

    .line 188
    check-cast v0, Lrx/c;

    .line 189
    .line 190
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 191
    .line 192
    .line 193
    move-result-object v0

    .line 194
    new-instance v1, Ll/fyi;

    .line 195
    .line 196
    invoke-direct {v1, p0}, Ll/fyi;-><init>(Ll/jyi;)V

    .line 197
    .line 198
    .line 199
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 200
    .line 201
    .line 202
    move-result-object v1

    .line 203
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 204
    .line 205
    .line 206
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 207
    .line 208
    .line 209
    move-result-object v0

    .line 210
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->FollowGuideEvent:Lcom/tantan/live/eventbus/LiveEventBus$FollowGuideEvent;

    .line 211
    .line 212
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$FollowGuideEvent;->onChatSendMessage()Ll/v3f$c;

    .line 213
    .line 214
    .line 215
    move-result-object v0

    .line 216
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 217
    .line 218
    .line 219
    move-result-object v0

    .line 220
    check-cast v0, Lrx/c;

    .line 221
    .line 222
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 223
    .line 224
    .line 225
    move-result-object v0

    .line 226
    new-instance v1, Ll/gyi;

    .line 227
    .line 228
    invoke-direct {v1, p0}, Ll/gyi;-><init>(Ll/jyi;)V

    .line 229
    .line 230
    .line 231
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 232
    .line 233
    .line 234
    move-result-object v1

    .line 235
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 236
    .line 237
    .line 238
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 239
    .line 240
    .line 241
    move-result-object v0

    .line 242
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->FollowGuideEvent:Lcom/tantan/live/eventbus/LiveEventBus$FollowGuideEvent;

    .line 243
    .line 244
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$FollowGuideEvent;->onBubbleShow()Ll/v3f$c;

    .line 245
    .line 246
    .line 247
    move-result-object v0

    .line 248
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 249
    .line 250
    .line 251
    move-result-object v0

    .line 252
    check-cast v0, Lrx/c;

    .line 253
    .line 254
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 255
    .line 256
    .line 257
    move-result-object v0

    .line 258
    new-instance v1, Ll/hyi;

    .line 259
    .line 260
    invoke-direct {v1, p0}, Ll/hyi;-><init>(Ll/jyi;)V

    .line 261
    .line 262
    .line 263
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 264
    .line 265
    .line 266
    move-result-object v1

    .line 267
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 268
    .line 269
    .line 270
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 271
    .line 272
    .line 273
    move-result-object v0

    .line 274
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->SendGiftEventGroup:Lcom/tantan/live/eventbus/LiveEventBus$SendGiftEventGroup;

    .line 275
    .line 276
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$SendGiftEventGroup;->sendGiftSuccess()Ll/v3f$d;

    .line 277
    .line 278
    .line 279
    move-result-object v0

    .line 280
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 281
    .line 282
    .line 283
    move-result-object v0

    .line 284
    check-cast v0, Lrx/c;

    .line 285
    .line 286
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 287
    .line 288
    .line 289
    move-result-object v0

    .line 290
    new-instance v1, Ll/iyi;

    .line 291
    .line 292
    invoke-direct {v1, p0}, Ll/iyi;-><init>(Ll/jyi;)V

    .line 293
    .line 294
    .line 295
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 296
    .line 297
    .line 298
    move-result-object v1

    .line 299
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 300
    .line 301
    .line 302
    invoke-virtual {p0}, Ll/jyi;->j4()V

    .line 303
    .line 304
    .line 305
    return-void
.end method

.method public final synthetic t4(Ll/vxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/jyi;->F4()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic u4(Ll/woe0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/jyi;->C4()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic v4(Ljava/lang/Long;)V
    .locals 0

    .line 1
    iget-object p1, p0, Ll/jyi;->r:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/jyi;->m4(Ljava/util/ArrayList;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic w4(Ljava/lang/Long;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jyi;->r:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/util/ArrayList;->clear()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic x4(Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveControlMessage;)V
    .locals 1

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveControlMessage;->type:Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 4
    .line 5
    .line 6
    const-string v0, "follow"

    .line 7
    .line 8
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-nez v0, :cond_1

    .line 13
    .line 14
    const-string v0, "anchor_follow"

    .line 15
    .line 16
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    move-result p1

    .line 20
    if-nez p1, :cond_0

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    iget-object p1, p0, Ll/jyi;->C:Ll/jyi$a;

    .line 24
    .line 25
    if-eqz p1, :cond_2

    .line 26
    .line 27
    invoke-virtual {p0, p1}, Ll/jyi;->l4(Ll/jyi$a;)V

    .line 28
    .line 29
    .line 30
    return-void

    .line 31
    :cond_1
    iget-object p1, p0, Ll/jyi;->D:Ll/jyi$a;

    .line 32
    .line 33
    if-eqz p1, :cond_2

    .line 34
    .line 35
    invoke-virtual {p0, p1}, Ll/jyi;->l4(Ll/jyi$a;)V

    .line 36
    .line 37
    .line 38
    :cond_2
    :goto_0
    return-void
.end method

.method public final synthetic y4(Ll/hcr;)V
    .locals 9

    .line 1
    iget-object v0, p0, Ll/jyi;->z:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    goto/16 :goto_2

    .line 10
    .line 11
    :cond_0
    invoke-virtual {p1}, Ll/hcr;->d()Ljava/util/ArrayList;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    new-instance v0, Ll/pxi;

    .line 16
    .line 17
    invoke-direct {v0}, Ll/pxi;-><init>()V

    .line 18
    .line 19
    .line 20
    invoke-static {p1, v0}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveLeaderBoards;

    .line 25
    .line 26
    iget-wide v0, p0, Ll/jyi;->w:D

    .line 27
    .line 28
    const-wide/high16 v2, -0x4010000000000000L    # -1.0

    .line 29
    .line 30
    cmpl-double v0, v0, v2

    .line 31
    .line 32
    const-wide/16 v1, 0x0

    .line 33
    .line 34
    if-nez v0, :cond_3

    .line 35
    .line 36
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    invoke-virtual {v0}, Ll/oo2;->d2()Ll/hcr;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    if-nez v0, :cond_1

    .line 45
    .line 46
    const/4 v0, 0x0

    .line 47
    goto :goto_0

    .line 48
    :cond_1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    invoke-virtual {v0}, Ll/oo2;->d2()Ll/hcr;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    invoke-virtual {v0}, Ll/hcr;->d()Ljava/util/ArrayList;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    new-instance v3, Ll/qxi;

    .line 61
    .line 62
    invoke-direct {v3}, Ll/qxi;-><init>()V

    .line 63
    .line 64
    .line 65
    invoke-static {v0, v3}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    check-cast v0, Lcom/p1/mobile/putong/live/base/data/BLiveLeaderBoards;

    .line 70
    .line 71
    :goto_0
    if-nez v0, :cond_2

    .line 72
    .line 73
    move-wide v3, v1

    .line 74
    goto :goto_1

    .line 75
    :cond_2
    iget-wide v3, v0, Lcom/p1/mobile/putong/live/base/data/BLiveLeaderBoards;->amount:D

    .line 76
    .line 77
    :goto_1
    iput-wide v3, p0, Ll/jyi;->w:D

    .line 78
    .line 79
    :cond_3
    iget-object v0, p0, Ll/jyi;->z:Ljava/util/ArrayList;

    .line 80
    .line 81
    const/4 v3, 0x0

    .line 82
    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 83
    .line 84
    .line 85
    move-result-object v0

    .line 86
    check-cast v0, Ll/jyi$a;

    .line 87
    .line 88
    iget v3, v0, Ll/jyi$a;->a:I

    .line 89
    .line 90
    int-to-double v3, v3

    .line 91
    cmpl-double v1, v3, v1

    .line 92
    .line 93
    if-lez v1, :cond_4

    .line 94
    .line 95
    if-eqz p1, :cond_4

    .line 96
    .line 97
    iget-wide v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveLeaderBoards;->amount:D

    .line 98
    .line 99
    iget-wide v5, p0, Ll/jyi;->w:D

    .line 100
    .line 101
    sub-double v7, v1, v5

    .line 102
    .line 103
    cmpl-double p1, v7, v3

    .line 104
    .line 105
    if-ltz p1, :cond_4

    .line 106
    .line 107
    iget-wide v3, p0, Ll/jyi;->x:D

    .line 108
    .line 109
    sub-double v7, v1, v5

    .line 110
    .line 111
    cmpl-double p1, v3, v7

    .line 112
    .line 113
    if-eqz p1, :cond_4

    .line 114
    .line 115
    sub-double/2addr v1, v5

    .line 116
    iput-wide v1, p0, Ll/jyi;->x:D

    .line 117
    .line 118
    iget-object p1, p0, Ll/jyi;->z:Ljava/util/ArrayList;

    .line 119
    .line 120
    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 121
    .line 122
    .line 123
    invoke-virtual {p0, v0}, Ll/jyi;->l4(Ll/jyi$a;)V

    .line 124
    .line 125
    .line 126
    :cond_4
    :goto_2
    return-void
.end method

.method public final synthetic z4(Lcom/p1/mobile/putong/live/livingroom/archi/message/event/KeyboardEventData;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/archi/message/event/KeyboardEventData;->b()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    iput-boolean p1, p0, Ll/jyi;->t:Z

    .line 6
    .line 7
    return-void
.end method

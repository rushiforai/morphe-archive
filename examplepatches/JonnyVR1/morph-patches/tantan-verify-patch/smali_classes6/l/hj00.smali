.class public Ll/hj00;
.super Ll/ar2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/ar2<",
        "Ll/nk00;",
        ">;"
    }
.end annotation


# static fields
.field public static K:Ll/byd0;


# instance fields
.field public A:Ljava/lang/String;

.field public B:Z

.field public C:Z

.field public D:Ll/wyd0;

.field public E:Ll/byd0;

.field public F:Ll/vxd0;

.field public G:Z

.field public H:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public I:Lcom/p1/mobile/putong/data/StickerInfo;

.field public J:Z

.field public a:Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailFrag;

.field public b:Lcom/p1/mobile/android/app/Act;

.field public c:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ll/y20<",
            "Ljava/lang/Boolean;",
            ">;>;"
        }
    .end annotation
.end field

.field public d:Ll/n570;

.field public e:Lcom/p1/mobile/putong/feed/data/Moment;

.field public f:Lcom/p1/mobile/putong/feed/data/RawFeed;

.field public g:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/MomentMessage;",
            ">;"
        }
    .end annotation
.end field

.field public h:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/StickerInfo;",
            ">;"
        }
    .end annotation
.end field

.field public i:Lcom/p1/mobile/putong/data/Links;

.field public j:Ljava/lang/String;

.field public k:Ljava/lang/String;

.field public l:Lcom/p1/mobile/putong/feed/data/MomentMessage;

.field public m:Ljava/lang/String;

.field public n:Ljava/lang/String;

.field public o:Ljava/lang/String;

.field public p:Ljava/lang/String;

.field public q:Z

.field public r:I

.field public s:Z

.field public t:Z

.field public u:Z

.field public final v:Ljava/lang/String;

.field public w:Z

.field public x:Z

.field public y:Ljava/lang/String;

.field public z:Z


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 1
    new-instance v0, Ll/byd0;

    .line 2
    .line 3
    new-instance v1, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    const-string v2, "change_greet_selection_box_last_time_"

    .line 6
    .line 7
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->F()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 11
    .line 12
    .line 13
    move-result-object v2

    .line 14
    invoke-interface {v2}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v2

    .line 18
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    const-wide/16 v2, 0x0

    .line 26
    .line 27
    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 28
    .line 29
    .line 30
    move-result-object v2

    .line 31
    invoke-direct {v0, v1, v2}, Ll/byd0;-><init>(Ljava/lang/String;Ljava/lang/Long;)V

    .line 32
    .line 33
    .line 34
    sput-object v0, Ll/hj00;->K:Ll/byd0;

    .line 35
    .line 36
    return-void
.end method

.method public constructor <init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailFrag;)V
    .locals 6

    .line 1
    invoke-direct {p0, p1}, Ll/ar2;-><init>(Ll/ner;)V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/hj00;->c:Ljava/util/List;

    .line 10
    .line 11
    new-instance v0, Ljava/util/LinkedList;

    .line 12
    .line 13
    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Ll/hj00;->g:Ljava/util/List;

    .line 17
    .line 18
    new-instance v0, Ljava/util/LinkedList;

    .line 19
    .line 20
    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    .line 21
    .line 22
    .line 23
    iput-object v0, p0, Ll/hj00;->h:Ljava/util/List;

    .line 24
    .line 25
    const-string v0, ""

    .line 26
    .line 27
    iput-object v0, p0, Ll/hj00;->n:Ljava/lang/String;

    .line 28
    .line 29
    const/4 v1, 0x0

    .line 30
    iput v1, p0, Ll/hj00;->r:I

    .line 31
    .line 32
    const/4 v2, 0x1

    .line 33
    iput-boolean v2, p0, Ll/hj00;->t:Z

    .line 34
    .line 35
    iput-boolean v1, p0, Ll/hj00;->u:Z

    .line 36
    .line 37
    new-instance v3, Ll/wyd0;

    .line 38
    .line 39
    new-instance v4, Ljava/lang/StringBuilder;

    .line 40
    .line 41
    const-string v5, "show_tips_moment_ids_"

    .line 42
    .line 43
    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->F()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 47
    .line 48
    .line 49
    move-result-object v5

    .line 50
    invoke-interface {v5}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object v5

    .line 54
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 55
    .line 56
    .line 57
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object v4

    .line 61
    invoke-direct {v3, v4, v0}, Ll/wyd0;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 62
    .line 63
    .line 64
    iput-object v3, p0, Ll/hj00;->D:Ll/wyd0;

    .line 65
    .line 66
    new-instance v0, Ll/byd0;

    .line 67
    .line 68
    new-instance v3, Ljava/lang/StringBuilder;

    .line 69
    .line 70
    const-string v4, "show_tips_last_time_"

    .line 71
    .line 72
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 73
    .line 74
    .line 75
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->F()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 76
    .line 77
    .line 78
    move-result-object v4

    .line 79
    invoke-interface {v4}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 80
    .line 81
    .line 82
    move-result-object v4

    .line 83
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 84
    .line 85
    .line 86
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 87
    .line 88
    .line 89
    move-result-object v3

    .line 90
    const-wide/16 v4, 0x0

    .line 91
    .line 92
    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 93
    .line 94
    .line 95
    move-result-object v4

    .line 96
    invoke-direct {v0, v3, v4}, Ll/byd0;-><init>(Ljava/lang/String;Ljava/lang/Long;)V

    .line 97
    .line 98
    .line 99
    iput-object v0, p0, Ll/hj00;->E:Ll/byd0;

    .line 100
    .line 101
    new-instance v0, Ll/vxd0;

    .line 102
    .line 103
    new-instance v3, Ljava/lang/StringBuilder;

    .line 104
    .line 105
    const-string v4, "show_tips_last_count_"

    .line 106
    .line 107
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 108
    .line 109
    .line 110
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->F()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 111
    .line 112
    .line 113
    move-result-object v4

    .line 114
    invoke-interface {v4}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 115
    .line 116
    .line 117
    move-result-object v4

    .line 118
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 119
    .line 120
    .line 121
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 122
    .line 123
    .line 124
    move-result-object v3

    .line 125
    invoke-direct {v0, v3, v1}, Ll/vxd0;-><init>(Ljava/lang/String;I)V

    .line 126
    .line 127
    .line 128
    iput-object v0, p0, Ll/hj00;->F:Ll/vxd0;

    .line 129
    .line 130
    new-instance v0, Ljava/util/ArrayList;

    .line 131
    .line 132
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 133
    .line 134
    .line 135
    iput-object v0, p0, Ll/hj00;->H:Ljava/util/List;

    .line 136
    .line 137
    const/4 v0, 0x0

    .line 138
    iput-object v0, p0, Ll/hj00;->I:Lcom/p1/mobile/putong/data/StickerInfo;

    .line 139
    .line 140
    iput-boolean v1, p0, Ll/hj00;->J:Z

    .line 141
    .line 142
    iput-object p1, p0, Ll/hj00;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailFrag;

    .line 143
    .line 144
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 145
    .line 146
    .line 147
    move-result-object v0

    .line 148
    iput-object v0, p0, Ll/hj00;->b:Lcom/p1/mobile/android/app/Act;

    .line 149
    .line 150
    invoke-virtual {p1}, Landroidx/fragment/app/Fragment;->getArguments()Landroid/os/Bundle;

    .line 151
    .line 152
    .line 153
    move-result-object v0

    .line 154
    const-string v3, "from"

    .line 155
    .line 156
    invoke-virtual {v0, v3}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 157
    .line 158
    .line 159
    move-result-object v3

    .line 160
    iput-object v3, p0, Ll/hj00;->j:Ljava/lang/String;

    .line 161
    .line 162
    const-string v3, "enterPage"

    .line 163
    .line 164
    invoke-virtual {v0, v3}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 165
    .line 166
    .line 167
    move-result-object v3

    .line 168
    iput-object v3, p0, Ll/hj00;->k:Ljava/lang/String;

    .line 169
    .line 170
    const-string v3, "momentId"

    .line 171
    .line 172
    invoke-virtual {v0, v3}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 173
    .line 174
    .line 175
    move-result-object v3

    .line 176
    iput-object v3, p0, Ll/hj00;->o:Ljava/lang/String;

    .line 177
    .line 178
    const-string v3, "autoPlay"

    .line 179
    .line 180
    invoke-virtual {v0, v3, v2}, Landroid/os/BaseBundle;->getBoolean(Ljava/lang/String;Z)Z

    .line 181
    .line 182
    .line 183
    move-result v2

    .line 184
    iput-boolean v2, p0, Ll/hj00;->t:Z

    .line 185
    .line 186
    const-string v2, "momentOwner"

    .line 187
    .line 188
    invoke-virtual {v0, v2}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 189
    .line 190
    .line 191
    move-result-object v2

    .line 192
    iput-object v2, p0, Ll/hj00;->p:Ljava/lang/String;

    .line 193
    .line 194
    const-string v2, "isHideComment"

    .line 195
    .line 196
    invoke-virtual {v0, v2, v1}, Landroid/os/BaseBundle;->getBoolean(Ljava/lang/String;Z)Z

    .line 197
    .line 198
    .line 199
    move-result v2

    .line 200
    iput-boolean v2, p0, Ll/hj00;->q:Z

    .line 201
    .line 202
    const-string v2, "initMediaIndex"

    .line 203
    .line 204
    invoke-virtual {v0, v2, v1}, Landroid/os/BaseBundle;->getInt(Ljava/lang/String;I)I

    .line 205
    .line 206
    .line 207
    move-result v2

    .line 208
    iput v2, p0, Ll/hj00;->r:I

    .line 209
    .line 210
    const-string v2, "canGreeting"

    .line 211
    .line 212
    invoke-virtual {v0, v2, v1}, Landroid/os/BaseBundle;->getBoolean(Ljava/lang/String;Z)Z

    .line 213
    .line 214
    .line 215
    move-result v2

    .line 216
    iput-boolean v2, p0, Ll/hj00;->w:Z

    .line 217
    .line 218
    invoke-virtual {p1}, Landroidx/fragment/app/Fragment;->getArguments()Landroid/os/Bundle;

    .line 219
    .line 220
    .line 221
    move-result-object p1

    .line 222
    const-string v2, "start_home_card"

    .line 223
    .line 224
    invoke-virtual {p1, v2}, Landroid/os/BaseBundle;->getBoolean(Ljava/lang/String;)Z

    .line 225
    .line 226
    .line 227
    move-result p1

    .line 228
    iput-boolean p1, p0, Ll/hj00;->x:Z

    .line 229
    .line 230
    const-string p1, "momentValue"

    .line 231
    .line 232
    invoke-virtual {v0, p1}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 233
    .line 234
    .line 235
    move-result-object p1

    .line 236
    iput-object p1, p0, Ll/hj00;->v:Ljava/lang/String;

    .line 237
    .line 238
    const-string p1, "msg_id"

    .line 239
    .line 240
    invoke-virtual {v0, p1}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 241
    .line 242
    .line 243
    move-result-object p1

    .line 244
    iput-object p1, p0, Ll/hj00;->y:Ljava/lang/String;

    .line 245
    .line 246
    const-string p1, "showInput"

    .line 247
    .line 248
    invoke-virtual {v0, p1, v1}, Landroid/os/BaseBundle;->getBoolean(Ljava/lang/String;Z)Z

    .line 249
    .line 250
    .line 251
    move-result p1

    .line 252
    iput-boolean p1, p0, Ll/hj00;->z:Z

    .line 253
    .line 254
    const-string p1, "rawFeed"

    .line 255
    .line 256
    invoke-virtual {v0, p1}, Landroid/os/Bundle;->getSerializable(Ljava/lang/String;)Ljava/io/Serializable;

    .line 257
    .line 258
    .line 259
    move-result-object p1

    .line 260
    instance-of v1, p1, Lcom/p1/mobile/putong/feed/data/RawFeed;

    .line 261
    .line 262
    if-eqz v1, :cond_0

    .line 263
    .line 264
    check-cast p1, Lcom/p1/mobile/putong/feed/data/RawFeed;

    .line 265
    .line 266
    iput-object p1, p0, Ll/hj00;->f:Lcom/p1/mobile/putong/feed/data/RawFeed;

    .line 267
    .line 268
    :cond_0
    const-string p1, "clickedMsgId"

    .line 269
    .line 270
    invoke-virtual {v0, p1}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 271
    .line 272
    .line 273
    move-result-object p1

    .line 274
    iput-object p1, p0, Ll/hj00;->A:Ljava/lang/String;

    .line 275
    .line 276
    return-void
.end method

.method public static synthetic A0(Lcom/p1/mobile/putong/feed/data/MomentMessage;Lcom/p1/mobile/putong/feed/data/MomentMessage;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/common/data/CopyObject;->id:Ljava/lang/String;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/tantanapp/common/data/CopyObject;->id:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public static synthetic C0(Lcom/p1/mobile/putong/feed/data/MomentMessage;Lcom/p1/mobile/putong/feed/data/MomentMessage;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/common/data/CopyObject;->id:Ljava/lang/String;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/tantanapp/common/data/CopyObject;->id:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public static synthetic D0(Ll/hj00;Lcom/p1/mobile/putong/feed/data/MomentMessage;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/hj00;->j1(Lcom/p1/mobile/putong/feed/data/MomentMessage;Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic E0(Ll/hj00;Ljava/lang/String;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/hj00;->V0(Ljava/lang/String;Ljava/lang/Boolean;)V

    return-void
.end method

.method public static synthetic F0(Ll/hj00;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/hj00;->f1()V

    return-void
.end method

.method private I1(Ljava/util/List;)Ljava/util/List;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/MomentMessage;",
            ">;)",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/MomentMessage;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ll/hj00;->e:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 7
    .line 8
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/Moment;->messages:Lcom/p1/mobile/putong/data/PartialIdList;

    .line 9
    .line 10
    iget-object p0, p0, Lcom/p1/mobile/putong/data/PartialIdList;->ids:Ljava/util/List;

    .line 11
    .line 12
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    :cond_0
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    if-eqz v1, :cond_1

    .line 21
    .line 22
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    check-cast v1, Ljava/lang/String;

    .line 27
    .line 28
    new-instance v2, Ll/pi00;

    .line 29
    .line 30
    invoke-direct {v2, v1}, Ll/pi00;-><init>(Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    invoke-static {p1, v2}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    check-cast v1, Lcom/p1/mobile/putong/feed/data/MomentMessage;

    .line 38
    .line 39
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 40
    .line 41
    .line 42
    move-result v2

    .line 43
    if-eqz v2, :cond_0

    .line 44
    .line 45
    invoke-interface {p1, v1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 46
    .line 47
    .line 48
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 49
    .line 50
    .line 51
    goto :goto_0

    .line 52
    :cond_1
    invoke-interface {v0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 53
    .line 54
    .line 55
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    :goto_1
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 60
    .line 61
    .line 62
    move-result p1

    .line 63
    if-eqz p1, :cond_2

    .line 64
    .line 65
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 66
    .line 67
    .line 68
    move-result-object p1

    .line 69
    check-cast p1, Lcom/p1/mobile/putong/feed/data/MomentMessage;

    .line 70
    .line 71
    const/4 v1, 0x0

    .line 72
    iput-boolean v1, p1, Lcom/p1/mobile/putong/feed/data/MomentMessage;->isNewComment:Z

    .line 73
    .line 74
    goto :goto_1

    .line 75
    :cond_2
    return-object v0
.end method

.method private J1(Lcom/p1/mobile/putong/feed/data/Moment;Lcom/p1/mobile/putong/data/Music;)V
    .locals 1

    .line 1
    if-eqz p2, :cond_1

    .line 2
    .line 3
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/Moment;->media:Ljava/util/List;

    .line 4
    .line 5
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-nez p0, :cond_1

    .line 10
    .line 11
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/Moment;->media:Ljava/util/List;

    .line 12
    .line 13
    const/4 v0, 0x0

    .line 14
    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    instance-of p0, p0, Lcom/p1/mobile/putong/data/Video;

    .line 19
    .line 20
    if-nez p0, :cond_0

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/Moment;->media:Ljava/util/List;

    .line 24
    .line 25
    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    check-cast p0, Lcom/p1/mobile/putong/data/Video;

    .line 30
    .line 31
    iput-object p2, p0, Lcom/p1/mobile/putong/data/Video;->music:Lcom/p1/mobile/putong/data/Music;

    .line 32
    .line 33
    :cond_1
    :goto_0
    return-void
.end method

.method private L0()Ljava/lang/String;
    .locals 5

    .line 1
    iget-object v0, p0, Ll/hj00;->e:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 2
    .line 3
    iget-object v1, p0, Ll/hj00;->d:Ll/n570;

    .line 4
    .line 5
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->F()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 6
    .line 7
    .line 8
    move-result-object v2

    .line 9
    invoke-interface {v2}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    invoke-virtual {v1, v2}, Ll/n570;->m(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    iget-object v1, v1, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 18
    .line 19
    invoke-static {v0, v1}, Ll/at0;->a(Lcom/p1/mobile/putong/feed/data/Moment;Ljava/lang/String;)Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    iget-object v1, p0, Ll/hj00;->d:Ll/n570;

    .line 24
    .line 25
    iget-object v2, p0, Ll/hj00;->m:Ljava/lang/String;

    .line 26
    .line 27
    invoke-virtual {v1, v2}, Ll/n570;->m(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    iget-object v2, p0, Ll/hj00;->e:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 32
    .line 33
    if-nez v1, :cond_0

    .line 34
    .line 35
    const-string v1, ""

    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_0
    iget-object v1, v1, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 39
    .line 40
    :goto_0
    invoke-static {v2, v1}, Ll/at0;->a(Lcom/p1/mobile/putong/feed/data/Moment;Ljava/lang/String;)Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    iget-object v2, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 45
    .line 46
    check-cast v2, Ll/nk00;

    .line 47
    .line 48
    iget-object v2, v2, Ll/nk00;->p:Lcom/p1/mobile/putong/newui/view/MessageInputEditView;

    .line 49
    .line 50
    invoke-virtual {v2}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    .line 51
    .line 52
    .line 53
    move-result-object v2

    .line 54
    invoke-virtual {p0}, Ll/hj00;->P0()F

    .line 55
    .line 56
    .line 57
    move-result v3

    .line 58
    new-instance v4, Ll/ni00;

    .line 59
    .line 60
    invoke-direct {v4, p0}, Ll/ni00;-><init>(Ll/hj00;)V

    .line 61
    .line 62
    .line 63
    invoke-static {v2, v3, v0, v1, v4}, Ll/h9i;->g(Landroid/graphics/Paint;FLjava/lang/String;Ljava/lang/String;Ll/rcj;)Ljava/util/List;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    const/4 v1, 0x0

    .line 68
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 69
    .line 70
    .line 71
    move-result-object v1

    .line 72
    check-cast v1, Ljava/lang/String;

    .line 73
    .line 74
    const/4 v2, 0x1

    .line 75
    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 76
    .line 77
    .line 78
    move-result-object v0

    .line 79
    check-cast v0, Ljava/lang/String;

    .line 80
    .line 81
    invoke-direct {p0, v1, v0}, Ll/hj00;->N0(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 82
    .line 83
    .line 84
    move-result-object p0

    .line 85
    return-object p0
.end method

.method private N0(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 7
    .line 8
    .line 9
    iget-object p0, p0, Ll/hj00;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailFrag;

    .line 10
    .line 11
    sget p1, Lcom/p1/mobile/putong/feed/R$string;->a3:I

    .line 12
    .line 13
    invoke-virtual {p0, p1}, Landroidx/fragment/app/Fragment;->getString(I)Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    const-string p0, ": "

    .line 24
    .line 25
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    return-object p0
.end method

.method private Q0(Ljava/lang/String;)V
    .locals 2

    .line 1
    sget-object v0, Ll/uqb0;->Z:Ll/a4j;

    .line 2
    .line 3
    const-string v1, "p_user_passive_show_nearby"

    .line 4
    .line 5
    invoke-virtual {v0, p1, v1}, Ll/a4j;->Q(Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    new-instance v1, Ll/ui00;

    .line 10
    .line 11
    invoke-direct {v1, p0, p1}, Ll/ui00;-><init>(Ll/hj00;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    new-instance p0, Ll/vi00;

    .line 15
    .line 16
    invoke-direct {p0}, Ll/vi00;-><init>()V

    .line 17
    .line 18
    .line 19
    invoke-static {v1, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method private synthetic W0(Lcom/p1/mobile/android/app/c;)V
    .locals 9

    .line 1
    sget-object v0, Lcom/p1/mobile/android/app/c;->i:Lcom/p1/mobile/android/app/c;

    .line 2
    .line 3
    if-ne p1, v0, :cond_3

    .line 4
    .line 5
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 6
    .line 7
    check-cast p1, Ll/nk00;

    .line 8
    .line 9
    invoke-virtual {p1}, Ll/nk00;->g0()Z

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    if-eqz p1, :cond_4

    .line 14
    .line 15
    iget-object p1, p0, Ll/hj00;->e:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 16
    .line 17
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result p1

    .line 21
    if-eqz p1, :cond_0

    .line 22
    .line 23
    iget-object p1, p0, Ll/hj00;->e:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 24
    .line 25
    iget-boolean p1, p1, Lcom/p1/mobile/putong/feed/data/Moment;->shareMyVote:Z

    .line 26
    .line 27
    if-eqz p1, :cond_0

    .line 28
    .line 29
    const-string p1, "1"

    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_0
    const-string p1, "0"

    .line 33
    .line 34
    :goto_0
    const-string v0, "qa_optional"

    .line 35
    .line 36
    invoke-static {v0, p1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    iget-object p1, p0, Ll/hj00;->e:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 41
    .line 42
    if-eqz p1, :cond_2

    .line 43
    .line 44
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/Moment;->topics:Ljava/util/List;

    .line 45
    .line 46
    if-eqz p1, :cond_2

    .line 47
    .line 48
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 49
    .line 50
    .line 51
    move-result p1

    .line 52
    if-nez p1, :cond_1

    .line 53
    .line 54
    goto :goto_1

    .line 55
    :cond_1
    iget-object p1, p0, Ll/hj00;->e:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 56
    .line 57
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/Moment;->topics:Ljava/util/List;

    .line 58
    .line 59
    const/4 v0, 0x0

    .line 60
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 61
    .line 62
    .line 63
    move-result-object p1

    .line 64
    check-cast p1, Lcom/p1/mobile/putong/data/TopicMomentIdBox;

    .line 65
    .line 66
    iget-object p1, p1, Lcom/p1/mobile/putong/data/TopicMomentIdBox;->id:Ljava/lang/String;

    .line 67
    .line 68
    goto :goto_2

    .line 69
    :cond_2
    :goto_1
    const-string p1, ""

    .line 70
    .line 71
    :goto_2
    const-string v0, "topic_id"

    .line 72
    .line 73
    invoke-static {v0, p1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 74
    .line 75
    .line 76
    move-result-object v2

    .line 77
    const-string p1, "moment_id"

    .line 78
    .line 79
    iget-object v0, p0, Ll/hj00;->o:Ljava/lang/String;

    .line 80
    .line 81
    invoke-static {p1, v0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 82
    .line 83
    .line 84
    move-result-object v3

    .line 85
    const-string p1, "owner_id"

    .line 86
    .line 87
    iget-object v0, p0, Ll/hj00;->p:Ljava/lang/String;

    .line 88
    .line 89
    invoke-static {p1, v0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 90
    .line 91
    .line 92
    move-result-object v4

    .line 93
    iget-object p1, p0, Ll/hj00;->e:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 94
    .line 95
    invoke-static {p1}, Ll/ksg;->G(Lcom/p1/mobile/putong/feed/data/Moment;)J

    .line 96
    .line 97
    .line 98
    move-result-wide v5

    .line 99
    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 100
    .line 101
    .line 102
    move-result-object p1

    .line 103
    const-string v0, "moment_distance"

    .line 104
    .line 105
    invoke-static {v0, p1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 106
    .line 107
    .line 108
    move-result-object v5

    .line 109
    iget-object p1, p0, Ll/hj00;->e:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 110
    .line 111
    invoke-static {p1}, Ll/ksg;->F(Lcom/p1/mobile/putong/feed/data/Moment;)J

    .line 112
    .line 113
    .line 114
    move-result-wide v6

    .line 115
    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 116
    .line 117
    .line 118
    move-result-object p1

    .line 119
    const-string v0, "moment_create_time"

    .line 120
    .line 121
    invoke-static {v0, p1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 122
    .line 123
    .line 124
    move-result-object v6

    .line 125
    sget-object p1, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 126
    .line 127
    iget-object v0, p0, Ll/hj00;->p:Ljava/lang/String;

    .line 128
    .line 129
    invoke-virtual {p1, v0}, Ll/jka;->e8(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 130
    .line 131
    .line 132
    move-result-object p1

    .line 133
    invoke-static {p1}, Ll/ksg;->S(Lcom/p1/mobile/putong/data/User;)J

    .line 134
    .line 135
    .line 136
    move-result-wide v7

    .line 137
    invoke-static {v7, v8}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 138
    .line 139
    .line 140
    move-result-object p1

    .line 141
    const-string v0, "owner_active_time"

    .line 142
    .line 143
    invoke-static {v0, p1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 144
    .line 145
    .line 146
    move-result-object v7

    .line 147
    invoke-static {}, Ll/er60;->w()Ll/er60;

    .line 148
    .line 149
    .line 150
    move-result-object p1

    .line 151
    iget-object p0, p0, Ll/hj00;->e:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 152
    .line 153
    invoke-virtual {p1, p0}, Ll/er60;->y(Lcom/p1/mobile/putong/feed/data/Moment;)Ljava/lang/String;

    .line 154
    .line 155
    .line 156
    move-result-object p0

    .line 157
    const-string p1, "moment_type"

    .line 158
    .line 159
    invoke-static {p1, p0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 160
    .line 161
    .line 162
    move-result-object v8

    .line 163
    filled-new-array/range {v1 .. v8}, [Ll/pf60;

    .line 164
    .line 165
    .line 166
    move-result-object p0

    .line 167
    const-string p1, "e_moment"

    .line 168
    .line 169
    const-string v0, "p_user_moment_interactions_details_view"

    .line 170
    .line 171
    invoke-static {p1, v0, p0}, Ll/tfj0;->e(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 172
    .line 173
    .line 174
    return-void

    .line 175
    :cond_3
    sget-object v0, Lcom/p1/mobile/android/app/c;->m:Lcom/p1/mobile/android/app/c;

    .line 176
    .line 177
    if-ne p1, v0, :cond_4

    .line 178
    .line 179
    const/4 p1, 0x0

    .line 180
    iput-object p1, p0, Ll/hj00;->c:Ljava/util/List;

    .line 181
    .line 182
    :cond_4
    return-void
.end method

.method private synthetic X0(Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    iput-boolean p1, p0, Ll/hj00;->G:Z

    .line 6
    .line 7
    invoke-static {}, Ll/cmg;->G()Z

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    if-eqz p1, :cond_0

    .line 12
    .line 13
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 14
    .line 15
    check-cast p0, Ll/nk00;

    .line 16
    .line 17
    invoke-virtual {p0}, Ll/nk00;->e1()V

    .line 18
    .line 19
    .line 20
    :cond_0
    return-void
.end method

.method private synthetic Y0(Landroid/os/Bundle;)V
    .locals 2

    .line 1
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p1, Ll/nk00;

    .line 4
    .line 5
    invoke-virtual {p1}, Ll/nk00;->c0()V

    .line 6
    .line 7
    .line 8
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 9
    .line 10
    check-cast p1, Ll/nk00;

    .line 11
    .line 12
    invoke-virtual {p1}, Ll/nk00;->P()V

    .line 13
    .line 14
    .line 15
    iget-object p1, p0, Ll/hj00;->d:Ll/n570;

    .line 16
    .line 17
    invoke-virtual {p1}, Ll/n570;->o()V

    .line 18
    .line 19
    .line 20
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 21
    .line 22
    check-cast p1, Ll/nk00;

    .line 23
    .line 24
    iget-object v0, p0, Ll/hj00;->d:Ll/n570;

    .line 25
    .line 26
    invoke-virtual {p1, v0}, Ll/nk00;->Y(Ll/n570;)V

    .line 27
    .line 28
    .line 29
    iget-object p1, p0, Ll/hj00;->y:Ljava/lang/String;

    .line 30
    .line 31
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 32
    .line 33
    .line 34
    move-result p1

    .line 35
    if-nez p1, :cond_0

    .line 36
    .line 37
    iget-object p1, p0, Ll/hj00;->y:Ljava/lang/String;

    .line 38
    .line 39
    const-string v0, "0"

    .line 40
    .line 41
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 42
    .line 43
    .line 44
    move-result p1

    .line 45
    if-nez p1, :cond_0

    .line 46
    .line 47
    iget-object p1, p0, Ll/hj00;->d:Ll/n570;

    .line 48
    .line 49
    check-cast p1, Ll/ib70;

    .line 50
    .line 51
    iget-object v0, p0, Ll/hj00;->y:Ljava/lang/String;

    .line 52
    .line 53
    invoke-virtual {p1, v0}, Ll/ib70;->Q(Ljava/lang/String;)V

    .line 54
    .line 55
    .line 56
    :cond_0
    invoke-static {}, Ll/cmg;->H()Z

    .line 57
    .line 58
    .line 59
    move-result p1

    .line 60
    if-nez p1, :cond_2

    .line 61
    .line 62
    invoke-static {}, Ll/cmg;->G()Z

    .line 63
    .line 64
    .line 65
    move-result p1

    .line 66
    if-eqz p1, :cond_1

    .line 67
    .line 68
    goto :goto_0

    .line 69
    :cond_1
    return-void

    .line 70
    :cond_2
    :goto_0
    iget-object p1, p0, Ll/hj00;->b:Lcom/p1/mobile/android/app/Act;

    .line 71
    .line 72
    iget-object v0, p0, Ll/hj00;->p:Ljava/lang/String;

    .line 73
    .line 74
    new-instance v1, Ll/bj00;

    .line 75
    .line 76
    invoke-direct {v1, p0}, Ll/bj00;-><init>(Ll/hj00;)V

    .line 77
    .line 78
    .line 79
    invoke-static {p1, v0, v1}, Ll/ksg;->B(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ll/y20;)V

    .line 80
    .line 81
    .line 82
    return-void
.end method

.method private synthetic a1()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/nk00;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/nk00;->Q()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic e0(Ll/hj00;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Ll/hj00;->N0(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic f0(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic g0(Ll/hj00;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/hj00;->X0(Ljava/lang/Boolean;)V

    return-void
.end method

.method public static synthetic h0(Ll/hj00;Lcom/p1/mobile/putong/feed/data/MomentMessage;Ll/x20;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/hj00;->l1(Lcom/p1/mobile/putong/feed/data/MomentMessage;Ll/x20;)V

    return-void
.end method

.method public static synthetic i0(Ll/hj00;Ll/x20;Lcom/p1/mobile/putong/feed/data/MomentMessage;Lcom/p1/mobile/putong/feed/data/MomentMessage;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/hj00;->i1(Ll/x20;Lcom/p1/mobile/putong/feed/data/MomentMessage;Lcom/p1/mobile/putong/feed/data/MomentMessage;)V

    return-void
.end method

.method public static synthetic j0(Ll/hj00;Lcom/p1/mobile/putong/feed/data/MomentMessage;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/hj00;->d1(Lcom/p1/mobile/putong/feed/data/MomentMessage;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic k0(Ljava/lang/String;Lcom/p1/mobile/putong/feed/data/MomentMessage;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/tantanapp/common/data/CopyObject;->id:Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public static synthetic l0(Ll/hj00;Ljava/lang/String;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/hj00;->b1(Ljava/lang/String;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic m0(Ll/hj00;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/hj00;->g1()V

    return-void
.end method

.method public static synthetic n0(Ll/hj00;Lcom/p1/mobile/putong/feed/data/MomentMessage;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/hj00;->c1(Lcom/p1/mobile/putong/feed/data/MomentMessage;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic o0(Lcom/p1/mobile/putong/feed/data/MomentMessage;Lcom/p1/mobile/putong/feed/data/MomentMessage;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/common/data/CopyObject;->id:Ljava/lang/String;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/tantanapp/common/data/CopyObject;->id:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public static synthetic p0(Ll/hj00;Lcom/p1/mobile/android/app/c;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/hj00;->W0(Lcom/p1/mobile/android/app/c;)V

    return-void
.end method

.method public static synthetic q0(Ll/hj00;Ljava/lang/String;Lcom/p1/mobile/putong/feed/data/MomentMessage;Ll/x20;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/hj00;->h1(Ljava/lang/String;Lcom/p1/mobile/putong/feed/data/MomentMessage;Ll/x20;)V

    return-void
.end method

.method public static synthetic r0(Ll/hj00;Lcom/p1/mobile/putong/feed/data/MomentMessage;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/hj00;->e1(Lcom/p1/mobile/putong/feed/data/MomentMessage;)V

    return-void
.end method

.method public static synthetic s0(Ll/hj00;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/hj00;->m1(Ljava/lang/Boolean;)V

    return-void
.end method

.method public static synthetic t0(Ll/hj00;Ljava/lang/String;Ljava/lang/String;Ll/x20;Lcom/p1/mobile/putong/data/StickerInfo;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/hj00;->k1(Ljava/lang/String;Ljava/lang/String;Ll/x20;Lcom/p1/mobile/putong/data/StickerInfo;)V

    return-void
.end method

.method private t1(Lcom/p1/mobile/putong/feed/data/Moment;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/nk00;

    .line 4
    .line 5
    invoke-virtual {p1}, Lcom/p1/mobile/putong/feed/data/Moment;->status()Lcom/p1/mobile/putong/data/LocalStatus;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    const-string v2, "normal"

    .line 10
    .line 11
    invoke-static {v1, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    const/4 v2, 0x1

    .line 16
    xor-int/2addr v1, v2

    .line 17
    invoke-virtual {v0, v1}, Ll/nk00;->W0(Z)V

    .line 18
    .line 19
    .line 20
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/Moment;->media:Ljava/util/List;

    .line 21
    .line 22
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    if-nez v0, :cond_0

    .line 27
    .line 28
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/Moment;->media:Ljava/util/List;

    .line 29
    .line 30
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    if-ne v0, v2, :cond_0

    .line 35
    .line 36
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/Moment;->media:Ljava/util/List;

    .line 37
    .line 38
    const/4 v1, 0x0

    .line 39
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    instance-of v0, v0, Lcom/p1/mobile/putong/data/Video;

    .line 44
    .line 45
    if-eqz v0, :cond_0

    .line 46
    .line 47
    iget-boolean v0, p0, Ll/hj00;->t:Z

    .line 48
    .line 49
    if-eqz v0, :cond_0

    .line 50
    .line 51
    iput-boolean v2, p0, Ll/hj00;->t:Z

    .line 52
    .line 53
    :cond_0
    new-instance v0, Ljava/util/HashMap;

    .line 54
    .line 55
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 56
    .line 57
    .line 58
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 59
    .line 60
    iget v1, p0, Ll/hj00;->r:I

    .line 61
    .line 62
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 63
    .line 64
    .line 65
    move-result-object v1

    .line 66
    invoke-virtual {v0, p1, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 67
    .line 68
    .line 69
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 70
    .line 71
    check-cast p1, Ll/nk00;

    .line 72
    .line 73
    iget-object v0, p0, Ll/hj00;->d:Ll/n570;

    .line 74
    .line 75
    iget-object p0, p0, Ll/hj00;->j:Ljava/lang/String;

    .line 76
    .line 77
    invoke-virtual {p1, v0, p0}, Ll/nk00;->X0(Ll/n570;Ljava/lang/String;)V

    .line 78
    .line 79
    .line 80
    return-void
.end method

.method public static synthetic u0(Ll/hj00;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/hj00;->a1()V

    return-void
.end method

.method public static synthetic x0(Ll/hj00;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/hj00;->Y0(Landroid/os/Bundle;)V

    return-void
.end method

.method public static synthetic y0(Lcom/p1/mobile/putong/data/StickerInfo;Lcom/p1/mobile/putong/data/StickerInfo;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public static synthetic z0(Lcom/p1/mobile/putong/feed/data/MomentMessage;Lcom/p1/mobile/putong/feed/data/MomentMessage;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/common/data/CopyObject;->id:Ljava/lang/String;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/tantanapp/common/data/CopyObject;->id:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method


# virtual methods
.method public final B1(Lcom/p1/mobile/putong/feed/data/MomentMessage;ZLjava/lang/Throwable;Ljava/lang/String;)V
    .locals 11

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/feed/data/MomentMessage;->isChildComment()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iget-object v1, p1, Lcom/p1/mobile/putong/feed/data/MomentMessage;->messageType:Lcom/p1/mobile/putong/feed/data/MomentMessageType;

    .line 6
    .line 7
    const-string v2, "sticker"

    .line 8
    .line 9
    invoke-static {v1, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    if-eqz v1, :cond_0

    .line 14
    .line 15
    const-string p1, "gif"

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/MomentMessage;->messageType:Lcom/p1/mobile/putong/feed/data/MomentMessageType;

    .line 19
    .line 20
    const-string v1, "picture"

    .line 21
    .line 22
    invoke-static {p1, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 23
    .line 24
    .line 25
    move-result p1

    .line 26
    if-eqz p1, :cond_1

    .line 27
    .line 28
    move-object p1, v1

    .line 29
    goto :goto_0

    .line 30
    :cond_1
    const-string p1, "text"

    .line 31
    .line 32
    :goto_0
    iget-object v1, p0, Ll/hj00;->e:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 33
    .line 34
    iget-object v1, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 35
    .line 36
    const-string v2, "moment_id"

    .line 37
    .line 38
    invoke-static {v2, v1}, Ll/tfj0$a;->g(Ljava/lang/String;Ljava/lang/String;)Ll/tfj0$a;

    .line 39
    .line 40
    .line 41
    move-result-object v3

    .line 42
    iget-object p0, p0, Ll/hj00;->e:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 43
    .line 44
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/Moment;->owner:Ljava/lang/String;

    .line 45
    .line 46
    const-string v1, "owner_id"

    .line 47
    .line 48
    invoke-static {v1, p0}, Ll/tfj0$a;->g(Ljava/lang/String;Ljava/lang/String;)Ll/tfj0$a;

    .line 49
    .line 50
    .line 51
    move-result-object v4

    .line 52
    const-string p0, "comment_id"

    .line 53
    .line 54
    invoke-static {p0, p4}, Ll/tfj0$a;->g(Ljava/lang/String;Ljava/lang/String;)Ll/tfj0$a;

    .line 55
    .line 56
    .line 57
    move-result-object v5

    .line 58
    const-string p0, "comment_type"

    .line 59
    .line 60
    invoke-static {p0, p1}, Ll/tfj0$a;->g(Ljava/lang/String;Ljava/lang/String;)Ll/tfj0$a;

    .line 61
    .line 62
    .line 63
    move-result-object v6

    .line 64
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->F()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 65
    .line 66
    .line 67
    move-result-object p0

    .line 68
    invoke-interface {p0}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    move-result-object p0

    .line 72
    const-string p1, "comment_user_id"

    .line 73
    .line 74
    invoke-static {p1, p0}, Ll/tfj0$a;->g(Ljava/lang/String;Ljava/lang/String;)Ll/tfj0$a;

    .line 75
    .line 76
    .line 77
    move-result-object v7

    .line 78
    if-eqz p2, :cond_2

    .line 79
    .line 80
    const-string p0, "success"

    .line 81
    .line 82
    goto :goto_1

    .line 83
    :cond_2
    const-string p0, "fail"

    .line 84
    .line 85
    :goto_1
    const-string p1, "comment_state"

    .line 86
    .line 87
    invoke-static {p1, p0}, Ll/tfj0$a;->g(Ljava/lang/String;Ljava/lang/String;)Ll/tfj0$a;

    .line 88
    .line 89
    .line 90
    move-result-object v8

    .line 91
    if-eqz v0, :cond_3

    .line 92
    .line 93
    const-string p0, "reply"

    .line 94
    .line 95
    goto :goto_2

    .line 96
    :cond_3
    const-string p0, "comment"

    .line 97
    .line 98
    :goto_2
    const-string p1, "comment_detail"

    .line 99
    .line 100
    invoke-static {p1, p0}, Ll/tfj0$a;->g(Ljava/lang/String;Ljava/lang/String;)Ll/tfj0$a;

    .line 101
    .line 102
    .line 103
    move-result-object v9

    .line 104
    if-nez p3, :cond_4

    .line 105
    .line 106
    const/4 p0, 0x0

    .line 107
    :goto_3
    move-object v10, p0

    .line 108
    goto :goto_4

    .line 109
    :cond_4
    const-string p0, "error"

    .line 110
    .line 111
    invoke-virtual {p3}, Ljava/lang/Throwable;->toString()Ljava/lang/String;

    .line 112
    .line 113
    .line 114
    move-result-object p1

    .line 115
    invoke-static {p0, p1}, Ll/tfj0$a;->g(Ljava/lang/String;Ljava/lang/String;)Ll/tfj0$a;

    .line 116
    .line 117
    .line 118
    move-result-object p0

    .line 119
    goto :goto_3

    .line 120
    :goto_4
    filled-new-array/range {v3 .. v10}, [Ll/tfj0$a;

    .line 121
    .line 122
    .line 123
    move-result-object p0

    .line 124
    const-string p1, "e_comment_send"

    .line 125
    .line 126
    const-string p2, "p_user_moment_interactions_details_view"

    .line 127
    .line 128
    invoke-static {p1, p2, p0}, Ll/tfj0;->f(Ljava/lang/String;Ljava/lang/String;[Ll/tfj0$a;)V

    .line 129
    .line 130
    .line 131
    return-void
.end method

.method public C1(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 8

    .line 1
    iget-boolean v0, p0, Ll/hj00;->J:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ljava/lang/StringBuilder;

    .line 6
    .line 7
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string p2, "\u3010\u56fe\u7247\u8bc4\u8bba\u3011"

    .line 14
    .line 15
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object p2

    .line 22
    :cond_0
    move-object v2, p2

    .line 23
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->H()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    const-string p2, "comment_forward"

    .line 28
    .line 29
    invoke-static {p2}, Lcom/p1/mobile/putong/data/Channel;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/Channel;

    .line 30
    .line 31
    .line 32
    move-result-object v6

    .line 33
    new-instance v7, Ll/ri00;

    .line 34
    .line 35
    invoke-direct {v7, p0}, Ll/ri00;-><init>(Ll/hj00;)V

    .line 36
    .line 37
    .line 38
    move-object v5, p3

    .line 39
    move-object v1, p1

    .line 40
    move-object v3, p3

    .line 41
    move-object v4, p4

    .line 42
    invoke-interface/range {v0 .. v7}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->Vk(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/data/Channel;Ll/y20;)V

    .line 43
    .line 44
    .line 45
    return-void
.end method

.method public D1(Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/hj00;->H:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/hj00;->H:Ljava/util/List;

    .line 10
    .line 11
    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public E1(Lcom/p1/mobile/putong/feed/data/MomentMessage;Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    sget p1, Lcom/p1/mobile/putong/feed/R$string;->X2:I

    .line 12
    .line 13
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0

    .line 18
    :cond_0
    iput-object p1, p0, Ll/hj00;->l:Lcom/p1/mobile/putong/feed/data/MomentMessage;

    .line 19
    .line 20
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/MomentMessage;->owner:Ljava/lang/String;

    .line 21
    .line 22
    iput-object p1, p0, Ll/hj00;->m:Ljava/lang/String;

    .line 23
    .line 24
    iput-object p2, p0, Ll/hj00;->n:Ljava/lang/String;

    .line 25
    .line 26
    invoke-direct {p0}, Ll/hj00;->L0()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    return-object p0
.end method

.method public F1()Z
    .locals 4

    .line 1
    sget-object p0, Ll/hj00;->K:Ll/byd0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ljava/lang/Long;

    .line 8
    .line 9
    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    .line 10
    .line 11
    .line 12
    move-result-wide v0

    .line 13
    const-wide/16 v2, 0x0

    .line 14
    .line 15
    cmp-long p0, v0, v2

    .line 16
    .line 17
    if-eqz p0, :cond_0

    .line 18
    .line 19
    sget-object p0, Ll/hj00;->K:Ll/byd0;

    .line 20
    .line 21
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    check-cast p0, Ljava/lang/Long;

    .line 26
    .line 27
    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    .line 28
    .line 29
    .line 30
    move-result-wide v0

    .line 31
    invoke-static {}, Ll/pzi0;->o()J

    .line 32
    .line 33
    .line 34
    move-result-wide v2

    .line 35
    invoke-static {v0, v1, v2, v3}, Ll/p6i;->l(JJ)Z

    .line 36
    .line 37
    .line 38
    move-result p0

    .line 39
    if-eqz p0, :cond_0

    .line 40
    .line 41
    const/4 p0, 0x1

    .line 42
    return p0

    .line 43
    :cond_0
    const/4 p0, 0x0

    .line 44
    return p0
.end method

.method public G0(Ll/y20;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/y20<",
            "Ljava/lang/Boolean;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/hj00;->c:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public H0()Z
    .locals 3

    .line 1
    iget-object v0, p0, Ll/hj00;->e:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_2

    .line 8
    .line 9
    sget-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 10
    .line 11
    iget-object v1, p0, Ll/hj00;->e:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 12
    .line 13
    iget-object v1, v1, Lcom/p1/mobile/putong/feed/data/Moment;->owner:Ljava/lang/String;

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ll/jka;->e8(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    iget-object p0, p0, Ll/hj00;->e:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 20
    .line 21
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/Moment;->owner:Ljava/lang/String;

    .line 22
    .line 23
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->F()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    invoke-interface {v1}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    move-result p0

    .line 35
    const/4 v1, 0x0

    .line 36
    if-eqz p0, :cond_0

    .line 37
    .line 38
    return v1

    .line 39
    :cond_0
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 40
    .line 41
    .line 42
    move-result p0

    .line 43
    if-eqz p0, :cond_2

    .line 44
    .line 45
    iget-object p0, v0, Lcom/p1/mobile/putong/data/User;->localFollowship:Lcom/p1/mobile/putong/data/Followship;

    .line 46
    .line 47
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 48
    .line 49
    .line 50
    move-result p0

    .line 51
    if-eqz p0, :cond_2

    .line 52
    .line 53
    iget-object p0, v0, Lcom/p1/mobile/putong/data/User;->localFollowship:Lcom/p1/mobile/putong/data/Followship;

    .line 54
    .line 55
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Followship;->state:Lcom/p1/mobile/putong/data/FollowshipStatus;

    .line 56
    .line 57
    const-string v2, "matched"

    .line 58
    .line 59
    invoke-static {p0, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 60
    .line 61
    .line 62
    move-result p0

    .line 63
    if-nez p0, :cond_1

    .line 64
    .line 65
    iget-object p0, v0, Lcom/p1/mobile/putong/data/User;->localFollowship:Lcom/p1/mobile/putong/data/Followship;

    .line 66
    .line 67
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Followship;->state:Lcom/p1/mobile/putong/data/FollowshipStatus;

    .line 68
    .line 69
    const-string v0, "following"

    .line 70
    .line 71
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 72
    .line 73
    .line 74
    move-result p0

    .line 75
    if-eqz p0, :cond_2

    .line 76
    .line 77
    :cond_1
    return v1

    .line 78
    :cond_2
    const/4 p0, 0x1

    .line 79
    return p0
.end method

.method public H1(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/MomentMessage;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/hj00;->g:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ll/hj00;->g:Ljava/util/List;

    .line 7
    .line 8
    invoke-interface {p0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public I0()Z
    .locals 7

    .line 1
    invoke-static {}, Ll/cmg;->Y()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    return v1

    .line 9
    :cond_0
    invoke-virtual {p0}, Ll/hj00;->H0()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-nez v0, :cond_1

    .line 14
    .line 15
    return v1

    .line 16
    :cond_1
    invoke-virtual {p0}, Ll/hj00;->U0()Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    const/4 v2, 0x1

    .line 21
    if-eqz v0, :cond_2

    .line 22
    .line 23
    return v2

    .line 24
    :cond_2
    iget-object v0, p0, Ll/hj00;->F:Ll/vxd0;

    .line 25
    .line 26
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    check-cast v0, Ljava/lang/Integer;

    .line 31
    .line 32
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    const/4 v3, 0x3

    .line 37
    if-ne v0, v3, :cond_3

    .line 38
    .line 39
    return v1

    .line 40
    :cond_3
    iget-object v0, p0, Ll/hj00;->D:Ll/wyd0;

    .line 41
    .line 42
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    check-cast v0, Ljava/lang/String;

    .line 47
    .line 48
    const-string v3, ","

    .line 49
    .line 50
    invoke-virtual {v0, v3}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    array-length v3, v0

    .line 55
    move v4, v1

    .line 56
    :goto_0
    if-ge v4, v3, :cond_5

    .line 57
    .line 58
    aget-object v5, v0, v4

    .line 59
    .line 60
    iget-object v6, p0, Ll/hj00;->o:Ljava/lang/String;

    .line 61
    .line 62
    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 63
    .line 64
    .line 65
    move-result v5

    .line 66
    if-eqz v5, :cond_4

    .line 67
    .line 68
    return v1

    .line 69
    :cond_4
    add-int/lit8 v4, v4, 0x1

    .line 70
    .line 71
    goto :goto_0

    .line 72
    :cond_5
    return v2
.end method

.method public final J0()V
    .locals 4

    .line 1
    iget-boolean v0, p0, Ll/hj00;->B:Z

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    iget-object v0, p0, Ll/hj00;->e:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 6
    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/data/Moment;->media:Ljava/util/List;

    .line 10
    .line 11
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    goto :goto_1

    .line 18
    :cond_0
    iget-object v0, p0, Ll/hj00;->c:Ljava/util/List;

    .line 19
    .line 20
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    if-eqz v0, :cond_1

    .line 25
    .line 26
    const/4 v0, 0x1

    .line 27
    iput-boolean v0, p0, Ll/hj00;->B:Z

    .line 28
    .line 29
    iput-boolean v0, p0, Ll/hj00;->C:Z

    .line 30
    .line 31
    iget-object v0, p0, Ll/hj00;->c:Ljava/util/List;

    .line 32
    .line 33
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 38
    .line 39
    .line 40
    move-result v1

    .line 41
    if-eqz v1, :cond_1

    .line 42
    .line 43
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 44
    .line 45
    .line 46
    move-result-object v1

    .line 47
    check-cast v1, Ll/y20;

    .line 48
    .line 49
    iget-object v2, p0, Ll/hj00;->e:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 50
    .line 51
    iget-object v2, v2, Lcom/p1/mobile/putong/feed/data/Moment;->media:Ljava/util/List;

    .line 52
    .line 53
    const/4 v3, 0x0

    .line 54
    invoke-interface {v2, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 55
    .line 56
    .line 57
    move-result-object v2

    .line 58
    instance-of v2, v2, Lcom/p1/mobile/putong/data/Video;

    .line 59
    .line 60
    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 61
    .line 62
    .line 63
    move-result-object v2

    .line 64
    invoke-interface {v1, v2}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 65
    .line 66
    .line 67
    goto :goto_0

    .line 68
    :cond_1
    :goto_1
    return-void
.end method

.method public L1()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/hj00;->o:Ljava/lang/String;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    invoke-virtual {p0}, Ll/hj00;->U0()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    const/4 v1, 0x1

    .line 11
    if-eqz v0, :cond_1

    .line 12
    .line 13
    iget-object v0, p0, Ll/hj00;->E:Ll/byd0;

    .line 14
    .line 15
    invoke-static {}, Ll/pzi0;->o()J

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
    invoke-virtual {v0, v2}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, Ll/hj00;->F:Ll/vxd0;

    .line 27
    .line 28
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    invoke-virtual {v0, v1}, Ll/vxd0;->put(Ljava/lang/Object;)Z

    .line 33
    .line 34
    .line 35
    iget-object v0, p0, Ll/hj00;->D:Ll/wyd0;

    .line 36
    .line 37
    iget-object p0, p0, Ll/hj00;->o:Ljava/lang/String;

    .line 38
    .line 39
    invoke-virtual {v0, p0}, Ll/wyd0;->put(Ljava/lang/Object;)Z

    .line 40
    .line 41
    .line 42
    return-void

    .line 43
    :cond_1
    iget-object v0, p0, Ll/hj00;->F:Ll/vxd0;

    .line 44
    .line 45
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    check-cast v0, Ljava/lang/Integer;

    .line 50
    .line 51
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 52
    .line 53
    .line 54
    move-result v0

    .line 55
    iget-object v2, p0, Ll/hj00;->F:Ll/vxd0;

    .line 56
    .line 57
    add-int/2addr v0, v1

    .line 58
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    invoke-virtual {v2, v0}, Ll/vxd0;->put(Ljava/lang/Object;)Z

    .line 63
    .line 64
    .line 65
    iget-object v0, p0, Ll/hj00;->D:Ll/wyd0;

    .line 66
    .line 67
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    check-cast v0, Ljava/lang/String;

    .line 72
    .line 73
    new-instance v1, Ljava/lang/StringBuilder;

    .line 74
    .line 75
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 76
    .line 77
    .line 78
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 79
    .line 80
    .line 81
    const-string v0, ","

    .line 82
    .line 83
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 84
    .line 85
    .line 86
    iget-object v0, p0, Ll/hj00;->o:Ljava/lang/String;

    .line 87
    .line 88
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 89
    .line 90
    .line 91
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 92
    .line 93
    .line 94
    move-result-object v0

    .line 95
    iget-object p0, p0, Ll/hj00;->D:Ll/wyd0;

    .line 96
    .line 97
    invoke-virtual {p0, v0}, Ll/wyd0;->put(Ljava/lang/Object;)Z

    .line 98
    .line 99
    .line 100
    return-void
.end method

.method public O0()Lcom/p1/mobile/putong/feed/data/Moment;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/hj00;->d:Ll/n570;

    .line 2
    .line 3
    iget-object p0, p0, Ll/hj00;->o:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {v0, p0}, Ll/n570;->y(Ljava/lang/String;)Lcom/p1/mobile/putong/feed/data/Moment;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public P0()F
    .locals 1

    .line 1
    const/high16 v0, 0x41c00000    # 24.0f

    .line 2
    .line 3
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 8
    .line 9
    check-cast p0, Ll/nk00;

    .line 10
    .line 11
    iget-object p0, p0, Ll/nk00;->r:Landroid/widget/TextView;

    .line 12
    .line 13
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredWidth()I

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    add-int/2addr v0, p0

    .line 18
    int-to-float p0, v0

    .line 19
    return p0
.end method

.method public R0()V
    .locals 6

    .line 1
    new-instance v0, Ll/ib70;

    .line 2
    .line 3
    iget-object v1, p0, Ll/hj00;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailFrag;

    .line 4
    .line 5
    iget-object v2, p0, Ll/hj00;->p:Ljava/lang/String;

    .line 6
    .line 7
    iget-object v3, p0, Ll/hj00;->o:Ljava/lang/String;

    .line 8
    .line 9
    iget-boolean v4, p0, Ll/hj00;->q:Z

    .line 10
    .line 11
    iget-object v5, p0, Ll/hj00;->j:Ljava/lang/String;

    .line 12
    .line 13
    invoke-direct/range {v0 .. v5}, Ll/ib70;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailFrag;Ljava/lang/String;Ljava/lang/String;ZLjava/lang/String;)V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Ll/hj00;->d:Ll/n570;

    .line 17
    .line 18
    iget-object v1, p0, Ll/hj00;->o:Ljava/lang/String;

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Ll/n570;->y(Ljava/lang/String;)Lcom/p1/mobile/putong/feed/data/Moment;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    iput-object v0, p0, Ll/hj00;->e:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 25
    .line 26
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    if-eqz v0, :cond_0

    .line 31
    .line 32
    iget-object v0, p0, Ll/hj00;->e:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 33
    .line 34
    iget-object v1, p0, Ll/hj00;->v:Ljava/lang/String;

    .line 35
    .line 36
    iput-object v1, v0, Lcom/p1/mobile/putong/feed/data/Moment;->momentValue:Ljava/lang/String;

    .line 37
    .line 38
    :cond_0
    iget-object v0, p0, Ll/hj00;->e:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 39
    .line 40
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 41
    .line 42
    .line 43
    move-result v0

    .line 44
    if-eqz v0, :cond_1

    .line 45
    .line 46
    iget-object v0, p0, Ll/hj00;->e:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 47
    .line 48
    invoke-direct {p0, v0}, Ll/hj00;->t1(Lcom/p1/mobile/putong/feed/data/Moment;)V

    .line 49
    .line 50
    .line 51
    :cond_1
    return-void
.end method

.method public S0()Z
    .locals 2

    .line 1
    sget-object v0, Ll/ksg;->i:Ljava/util/List;

    .line 2
    .line 3
    new-instance v1, Ll/aj00;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/aj00;-><init>(Ll/hj00;)V

    .line 6
    .line 7
    .line 8
    invoke-static {v0, v1}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-eqz v0, :cond_0

    .line 17
    .line 18
    const/4 v0, 0x0

    .line 19
    iput-boolean v0, p0, Ll/hj00;->G:Z

    .line 20
    .line 21
    return v0

    .line 22
    :cond_0
    iget-boolean p0, p0, Ll/hj00;->G:Z

    .line 23
    .line 24
    return p0
.end method

.method public final U0()Z
    .locals 4

    .line 1
    iget-object v0, p0, Ll/hj00;->E:Ll/byd0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ljava/lang/Long;

    .line 8
    .line 9
    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    .line 10
    .line 11
    .line 12
    move-result-wide v0

    .line 13
    const-wide/16 v2, 0x0

    .line 14
    .line 15
    cmp-long v0, v0, v2

    .line 16
    .line 17
    if-eqz v0, :cond_1

    .line 18
    .line 19
    iget-object p0, p0, Ll/hj00;->E:Ll/byd0;

    .line 20
    .line 21
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    check-cast p0, Ljava/lang/Long;

    .line 26
    .line 27
    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    .line 28
    .line 29
    .line 30
    move-result-wide v0

    .line 31
    invoke-static {}, Ll/pzi0;->o()J

    .line 32
    .line 33
    .line 34
    move-result-wide v2

    .line 35
    invoke-static {v0, v1, v2, v3}, Ll/p6i;->l(JJ)Z

    .line 36
    .line 37
    .line 38
    move-result p0

    .line 39
    if-nez p0, :cond_0

    .line 40
    .line 41
    goto :goto_0

    .line 42
    :cond_0
    const/4 p0, 0x0

    .line 43
    return p0

    .line 44
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 45
    return p0
.end method

.method public final synthetic V0(Ljava/lang/String;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    .line 2
    .line 3
    .line 4
    move-result p2

    .line 5
    if-eqz p2, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-static {p0, p1}, Ll/k3h;->J0(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public a0()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/ar2;->lifecycle()Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ll/ii00;

    .line 6
    .line 7
    invoke-direct {v1, p0}, Ll/ii00;-><init>(Ll/hj00;)V

    .line 8
    .line 9
    .line 10
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 15
    .line 16
    .line 17
    new-instance v0, Ll/ti00;

    .line 18
    .line 19
    invoke-direct {v0, p0}, Ll/ti00;-><init>(Ll/hj00;)V

    .line 20
    .line 21
    .line 22
    new-instance v1, Ll/zi00;

    .line 23
    .line 24
    invoke-direct {v1, p0}, Ll/zi00;-><init>(Ll/hj00;)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {p0, v0, v1}, Ll/ar2;->creates(Ll/y20;Ll/x20;)V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public final synthetic b1(Ljava/lang/String;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/hj00;->p:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {p1, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public final synthetic c1(Lcom/p1/mobile/putong/feed/data/MomentMessage;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/hj00;->g:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    xor-int/lit8 p0, p0, 0x1

    .line 8
    .line 9
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public final synthetic d1(Lcom/p1/mobile/putong/feed/data/MomentMessage;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/hj00;->A:Ljava/lang/String;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/tantanapp/common/data/CopyObject;->id:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public final synthetic e1(Lcom/p1/mobile/putong/feed/data/MomentMessage;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/nk00;

    .line 4
    .line 5
    iget-object p0, p0, Ll/hj00;->A:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {v0, p1, p0}, Ll/nk00;->h1(Lcom/p1/mobile/putong/feed/data/MomentMessage;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final synthetic f1()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/nk00;

    .line 4
    .line 5
    sget v0, Ll/qa00;->Q:I

    .line 6
    .line 7
    invoke-virtual {p0, v0}, Ll/nk00;->Y0(I)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final synthetic g1()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/nk00;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/nk00;->f1()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic h1(Ljava/lang/String;Lcom/p1/mobile/putong/feed/data/MomentMessage;Ll/x20;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/hj00;->d:Ll/n570;

    .line 2
    .line 3
    invoke-virtual {v0, p1, p2}, Ll/n570;->i(Ljava/lang/String;Lcom/p1/mobile/putong/feed/data/MomentMessage;)Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-virtual {p0, p1}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    new-instance v0, Ll/xi00;

    .line 12
    .line 13
    invoke-direct {v0, p0, p3, p2}, Ll/xi00;-><init>(Ll/hj00;Ll/x20;Lcom/p1/mobile/putong/feed/data/MomentMessage;)V

    .line 14
    .line 15
    .line 16
    new-instance p3, Ll/yi00;

    .line 17
    .line 18
    invoke-direct {p3, p0, p2}, Ll/yi00;-><init>(Ll/hj00;Lcom/p1/mobile/putong/feed/data/MomentMessage;)V

    .line 19
    .line 20
    .line 21
    invoke-static {v0, p3}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public final synthetic i1(Ll/x20;Lcom/p1/mobile/putong/feed/data/MomentMessage;Lcom/p1/mobile/putong/feed/data/MomentMessage;)V
    .locals 1

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-interface {p1}, Ll/x20;->call()V

    .line 8
    .line 9
    .line 10
    :cond_0
    const/4 p1, 0x0

    .line 11
    iput-object p1, p0, Ll/hj00;->m:Ljava/lang/String;

    .line 12
    .line 13
    iput-object p1, p0, Ll/hj00;->l:Lcom/p1/mobile/putong/feed/data/MomentMessage;

    .line 14
    .line 15
    iget-object v0, p0, Ll/hj00;->e:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 16
    .line 17
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-eqz v0, :cond_1

    .line 22
    .line 23
    const/4 v0, 0x1

    .line 24
    iget-object p3, p3, Lcom/tantanapp/common/data/CopyObject;->id:Ljava/lang/String;

    .line 25
    .line 26
    invoke-virtual {p0, p2, v0, p1, p3}, Ll/hj00;->B1(Lcom/p1/mobile/putong/feed/data/MomentMessage;ZLjava/lang/Throwable;Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    :cond_1
    return-void
.end method

.method public final synthetic j1(Lcom/p1/mobile/putong/feed/data/MomentMessage;Ljava/lang/Throwable;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/hj00;->e:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    const-string v1, ""

    .line 11
    .line 12
    invoke-virtual {p0, p1, v0, p2, v1}, Ll/hj00;->B1(Lcom/p1/mobile/putong/feed/data/MomentMessage;ZLjava/lang/Throwable;Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    :cond_0
    invoke-virtual {p1}, Lcom/p1/mobile/putong/feed/data/MomentMessage;->isChildComment()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_1

    .line 20
    .line 21
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 22
    .line 23
    check-cast v0, Ll/nk00;

    .line 24
    .line 25
    invoke-virtual {v0, p1}, Ll/nk00;->R(Lcom/p1/mobile/putong/feed/data/MomentMessage;)V

    .line 26
    .line 27
    .line 28
    :cond_1
    iget-object v0, p0, Ll/hj00;->g:Ljava/util/List;

    .line 29
    .line 30
    invoke-interface {v0, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    if-eqz v0, :cond_2

    .line 35
    .line 36
    iget-object v0, p0, Ll/hj00;->g:Ljava/util/List;

    .line 37
    .line 38
    invoke-interface {v0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 39
    .line 40
    .line 41
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 42
    .line 43
    check-cast p1, Ll/nk00;

    .line 44
    .line 45
    iget-object p0, p0, Ll/hj00;->g:Ljava/util/List;

    .line 46
    .line 47
    invoke-virtual {p1, p0}, Ll/nk00;->O0(Ljava/util/List;)V

    .line 48
    .line 49
    .line 50
    :cond_2
    sget-object p0, Lcom/p1/mobile/android/app/App;->d:Lcom/p1/mobile/android/app/App;

    .line 51
    .line 52
    invoke-virtual {p0, p2}, Lcom/p1/mobile/android/app/App;->k(Ljava/lang/Throwable;)V

    .line 53
    .line 54
    .line 55
    invoke-static {p2}, Ll/i4h;->e(Ljava/lang/Throwable;)V

    .line 56
    .line 57
    .line 58
    return-void
.end method

.method public final synthetic k1(Ljava/lang/String;Ljava/lang/String;Ll/x20;Lcom/p1/mobile/putong/data/StickerInfo;)V
    .locals 1

    .line 1
    iget-object v0, p4, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

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
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/hj00;->z1(Ljava/lang/String;Ljava/lang/String;Ll/x20;Ljava/lang/Object;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public final synthetic l1(Lcom/p1/mobile/putong/feed/data/MomentMessage;Ll/x20;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/hj00;->p:Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {p0, v0, p1, p2}, Ll/hj00;->v1(Ljava/lang/String;Lcom/p1/mobile/putong/feed/data/MomentMessage;Ll/x20;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic m1(Ljava/lang/Boolean;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_2

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-static {v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0}, Landroid/app/Activity;->isDestroyed()Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-nez v0, :cond_2

    .line 19
    .line 20
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-static {v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->isFinishing()Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-eqz v0, :cond_0

    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_0
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 35
    .line 36
    .line 37
    move-result p1

    .line 38
    if-eqz p1, :cond_2

    .line 39
    .line 40
    iget-object p1, p0, Ll/hj00;->p:Ljava/lang/String;

    .line 41
    .line 42
    const/4 v0, 0x0

    .line 43
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;->l5(Ljava/lang/String;Z)V

    .line 44
    .line 45
    .line 46
    iget-object p1, p0, Ll/hj00;->e:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 47
    .line 48
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 49
    .line 50
    .line 51
    move-result p1

    .line 52
    if-eqz p1, :cond_1

    .line 53
    .line 54
    iget-object p1, p0, Ll/hj00;->e:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 55
    .line 56
    iput-boolean v0, p1, Lcom/p1/mobile/putong/feed/data/Moment;->showGreetView:Z

    .line 57
    .line 58
    :cond_1
    iput-boolean v0, p0, Ll/hj00;->G:Z

    .line 59
    .line 60
    sget-object p1, Ll/ksg;->i:Ljava/util/List;

    .line 61
    .line 62
    iget-object p0, p0, Ll/hj00;->p:Ljava/lang/String;

    .line 63
    .line 64
    invoke-interface {p1, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 65
    .line 66
    .line 67
    :cond_2
    :goto_0
    return-void
.end method

.method public n1()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/nk00;

    .line 4
    .line 5
    iget-object v1, p0, Ll/hj00;->g:Ljava/util/List;

    .line 6
    .line 7
    iget-object p0, p0, Ll/hj00;->h:Ljava/util/List;

    .line 8
    .line 9
    invoke-virtual {v0, v1, p0}, Ll/nk00;->P0(Ljava/util/List;Ljava/util/List;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public o1(Lcom/p1/mobile/putong/feed/data/MomentMessage;)V
    .locals 2

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/MomentMessage;->moment:Ljava/lang/String;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    iget-object v1, p0, Ll/hj00;->o:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_1

    .line 12
    .line 13
    iget-object v0, p0, Ll/hj00;->g:Ljava/util/List;

    .line 14
    .line 15
    new-instance v1, Ll/mi00;

    .line 16
    .line 17
    invoke-direct {v1, p1}, Ll/mi00;-><init>(Lcom/p1/mobile/putong/feed/data/MomentMessage;)V

    .line 18
    .line 19
    .line 20
    invoke-static {v0, v1}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    check-cast v0, Lcom/p1/mobile/putong/feed/data/MomentMessage;

    .line 25
    .line 26
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 27
    .line 28
    .line 29
    move-result v1

    .line 30
    if-eqz v1, :cond_0

    .line 31
    .line 32
    iget-object v1, p0, Ll/hj00;->g:Ljava/util/List;

    .line 33
    .line 34
    invoke-interface {v1, v0}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 35
    .line 36
    .line 37
    :cond_0
    const/4 v0, 0x1

    .line 38
    iput-boolean v0, p1, Lcom/p1/mobile/putong/feed/data/MomentMessage;->isNewComment:Z

    .line 39
    .line 40
    iget-object v0, p0, Ll/hj00;->g:Ljava/util/List;

    .line 41
    .line 42
    const/4 v1, 0x0

    .line 43
    invoke-interface {v0, v1, p1}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 44
    .line 45
    .line 46
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 47
    .line 48
    check-cast p1, Ll/nk00;

    .line 49
    .line 50
    iget-object v0, p0, Ll/hj00;->g:Ljava/util/List;

    .line 51
    .line 52
    iget-object p0, p0, Ll/hj00;->h:Ljava/util/List;

    .line 53
    .line 54
    invoke-virtual {p1, v0, p0}, Ll/nk00;->P0(Ljava/util/List;Ljava/util/List;)V

    .line 55
    .line 56
    .line 57
    :cond_1
    return-void
.end method

.method public p1(Lcom/p1/mobile/putong/feed/data/MomentMessage;)V
    .locals 2

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/MomentMessage;->moment:Ljava/lang/String;

    .line 2
    .line 3
    iget-object v1, p0, Ll/hj00;->o:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_1

    .line 10
    .line 11
    iget-object v0, p0, Ll/hj00;->g:Ljava/util/List;

    .line 12
    .line 13
    new-instance v1, Ll/cj00;

    .line 14
    .line 15
    invoke-direct {v1, p1}, Ll/cj00;-><init>(Lcom/p1/mobile/putong/feed/data/MomentMessage;)V

    .line 16
    .line 17
    .line 18
    invoke-static {v0, v1}, Ll/jyb;->G(Ljava/util/List;Ll/qcj;)I

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    const/4 v1, -0x1

    .line 23
    if-eq v0, v1, :cond_0

    .line 24
    .line 25
    iget-object v1, p0, Ll/hj00;->g:Ljava/util/List;

    .line 26
    .line 27
    invoke-interface {v1, v0}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 31
    .line 32
    check-cast v0, Ll/nk00;

    .line 33
    .line 34
    invoke-virtual {v0, p1}, Ll/nk00;->S0(Lcom/p1/mobile/putong/feed/data/MomentMessage;)V

    .line 35
    .line 36
    .line 37
    :cond_0
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 38
    .line 39
    check-cast p1, Ll/nk00;

    .line 40
    .line 41
    iget-object p0, p0, Ll/hj00;->g:Ljava/util/List;

    .line 42
    .line 43
    invoke-virtual {p1, p0}, Ll/nk00;->O0(Ljava/util/List;)V

    .line 44
    .line 45
    .line 46
    :cond_1
    return-void
.end method

.method public q1(Ll/bkj0;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/bkj0<",
            "Lcom/p1/mobile/putong/data/Links;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/MomentMessage;",
            ">;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/StickerInfo;",
            ">;>;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p1, Ll/bkj0;->a:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Lcom/p1/mobile/putong/data/Links;

    .line 4
    .line 5
    iput-object v0, p0, Ll/hj00;->i:Lcom/p1/mobile/putong/data/Links;

    .line 6
    .line 7
    iget-object v0, p1, Ll/bkj0;->b:Ljava/lang/Object;

    .line 8
    .line 9
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_1

    .line 14
    .line 15
    iget-object v0, p0, Ll/hj00;->g:Ljava/util/List;

    .line 16
    .line 17
    iget-object v1, p1, Ll/bkj0;->b:Ljava/lang/Object;

    .line 18
    .line 19
    check-cast v1, Ljava/util/Collection;

    .line 20
    .line 21
    new-instance v2, Ll/oi00;

    .line 22
    .line 23
    invoke-direct {v2, p0}, Ll/oi00;-><init>(Ll/hj00;)V

    .line 24
    .line 25
    .line 26
    invoke-static {v1, v2}, Ll/jyb;->n(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    invoke-interface {v0, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 31
    .line 32
    .line 33
    iget-object v0, p1, Ll/bkj0;->c:Ljava/lang/Object;

    .line 34
    .line 35
    check-cast v0, Ljava/util/Collection;

    .line 36
    .line 37
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    if-nez v0, :cond_0

    .line 42
    .line 43
    iget-object v0, p0, Ll/hj00;->h:Ljava/util/List;

    .line 44
    .line 45
    iget-object p1, p1, Ll/bkj0;->c:Ljava/lang/Object;

    .line 46
    .line 47
    check-cast p1, Ljava/util/Collection;

    .line 48
    .line 49
    invoke-interface {v0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 50
    .line 51
    .line 52
    :cond_0
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 53
    .line 54
    check-cast p1, Ll/nk00;

    .line 55
    .line 56
    iget-object v0, p0, Ll/hj00;->g:Ljava/util/List;

    .line 57
    .line 58
    iget-object p0, p0, Ll/hj00;->h:Ljava/util/List;

    .line 59
    .line 60
    invoke-virtual {p1, v0, p0}, Ll/nk00;->P0(Ljava/util/List;Ljava/util/List;)V

    .line 61
    .line 62
    .line 63
    :cond_1
    return-void
.end method

.method public r1(Ll/pf60;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/pf60<",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/StickerInfo;",
            ">;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/MomentMessage;",
            ">;>;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p1, Ll/pf60;->b:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Ljava/util/Collection;

    .line 4
    .line 5
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    .line 13
    .line 14
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 15
    .line 16
    .line 17
    iget-object v1, p1, Ll/pf60;->b:Ljava/lang/Object;

    .line 18
    .line 19
    check-cast v1, Ljava/util/List;

    .line 20
    .line 21
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    :cond_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 26
    .line 27
    .line 28
    move-result v2

    .line 29
    const/4 v3, 0x0

    .line 30
    if-eqz v2, :cond_3

    .line 31
    .line 32
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    move-result-object v2

    .line 36
    check-cast v2, Lcom/p1/mobile/putong/feed/data/MomentMessage;

    .line 37
    .line 38
    invoke-virtual {v2}, Lcom/p1/mobile/putong/feed/data/MomentMessage;->isChildComment()Z

    .line 39
    .line 40
    .line 41
    move-result v4

    .line 42
    if-nez v4, :cond_1

    .line 43
    .line 44
    iget-object v1, p0, Ll/hj00;->g:Ljava/util/List;

    .line 45
    .line 46
    invoke-static {v1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 47
    .line 48
    .line 49
    move-result v1

    .line 50
    iget-object v4, p0, Ll/hj00;->g:Ljava/util/List;

    .line 51
    .line 52
    if-eqz v1, :cond_2

    .line 53
    .line 54
    invoke-interface {v4, v3, v2}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 55
    .line 56
    .line 57
    iget-object v1, p1, Ll/pf60;->b:Ljava/lang/Object;

    .line 58
    .line 59
    check-cast v1, Ljava/util/List;

    .line 60
    .line 61
    invoke-interface {v1, v2}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 62
    .line 63
    .line 64
    goto :goto_0

    .line 65
    :cond_2
    new-instance v0, Ll/dj00;

    .line 66
    .line 67
    invoke-direct {v0, v2}, Ll/dj00;-><init>(Lcom/p1/mobile/putong/feed/data/MomentMessage;)V

    .line 68
    .line 69
    .line 70
    invoke-static {v4, v0}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 71
    .line 72
    .line 73
    move-result-object v0

    .line 74
    check-cast v0, Lcom/p1/mobile/putong/feed/data/MomentMessage;

    .line 75
    .line 76
    iget-object v1, p0, Ll/hj00;->g:Ljava/util/List;

    .line 77
    .line 78
    invoke-interface {v1, v0}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 79
    .line 80
    .line 81
    iget-object v0, p0, Ll/hj00;->g:Ljava/util/List;

    .line 82
    .line 83
    invoke-interface {v0, v3, v2}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 84
    .line 85
    .line 86
    iget-object v0, p1, Ll/pf60;->b:Ljava/lang/Object;

    .line 87
    .line 88
    check-cast v0, Ljava/util/List;

    .line 89
    .line 90
    invoke-interface {v0, v2}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 91
    .line 92
    .line 93
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 94
    .line 95
    check-cast v0, Ll/nk00;

    .line 96
    .line 97
    iget-object v1, v2, Lcom/tantanapp/common/data/CopyObject;->id:Ljava/lang/String;

    .line 98
    .line 99
    invoke-virtual {v0, v1}, Ll/nk00;->U(Ljava/lang/String;)Ljava/util/List;

    .line 100
    .line 101
    .line 102
    move-result-object v0

    .line 103
    :cond_3
    :goto_0
    if-nez v0, :cond_4

    .line 104
    .line 105
    goto :goto_1

    .line 106
    :cond_4
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 107
    .line 108
    .line 109
    move-result v3

    .line 110
    :goto_1
    add-int/lit8 v3, v3, -0x1

    .line 111
    .line 112
    :goto_2
    if-ltz v3, :cond_5

    .line 113
    .line 114
    invoke-interface {v0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 115
    .line 116
    .line 117
    move-result-object v1

    .line 118
    check-cast v1, Lcom/p1/mobile/putong/feed/data/MomentMessage;

    .line 119
    .line 120
    iget-object v2, p0, Ll/hj00;->g:Ljava/util/List;

    .line 121
    .line 122
    invoke-interface {v2, v1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 123
    .line 124
    .line 125
    iget-object v2, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 126
    .line 127
    check-cast v2, Ll/nk00;

    .line 128
    .line 129
    invoke-virtual {v2, v1}, Ll/nk00;->S0(Lcom/p1/mobile/putong/feed/data/MomentMessage;)V

    .line 130
    .line 131
    .line 132
    add-int/lit8 v3, v3, -0x1

    .line 133
    .line 134
    goto :goto_2

    .line 135
    :cond_5
    iget-object v0, p0, Ll/hj00;->g:Ljava/util/List;

    .line 136
    .line 137
    iget-object v1, p1, Ll/pf60;->b:Ljava/lang/Object;

    .line 138
    .line 139
    check-cast v1, Ljava/util/Collection;

    .line 140
    .line 141
    invoke-interface {v0, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 142
    .line 143
    .line 144
    iget-object v0, p0, Ll/hj00;->y:Ljava/lang/String;

    .line 145
    .line 146
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 147
    .line 148
    .line 149
    move-result v0

    .line 150
    if-nez v0, :cond_6

    .line 151
    .line 152
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 153
    .line 154
    check-cast v0, Ll/nk00;

    .line 155
    .line 156
    iget-object v1, p1, Ll/pf60;->b:Ljava/lang/Object;

    .line 157
    .line 158
    check-cast v1, Ljava/util/List;

    .line 159
    .line 160
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 161
    .line 162
    .line 163
    move-result v1

    .line 164
    add-int/lit8 v1, v1, 0x1

    .line 165
    .line 166
    invoke-virtual {v0, v1}, Ll/nk00;->Z0(I)V

    .line 167
    .line 168
    .line 169
    :cond_6
    iget-object v0, p0, Ll/hj00;->h:Ljava/util/List;

    .line 170
    .line 171
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 172
    .line 173
    .line 174
    move-result v0

    .line 175
    iget-object v1, p1, Ll/pf60;->a:Ljava/lang/Object;

    .line 176
    .line 177
    if-nez v0, :cond_8

    .line 178
    .line 179
    check-cast v1, Ljava/util/Collection;

    .line 180
    .line 181
    invoke-static {v1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 182
    .line 183
    .line 184
    move-result v0

    .line 185
    if-nez v0, :cond_9

    .line 186
    .line 187
    iget-object p1, p1, Ll/pf60;->a:Ljava/lang/Object;

    .line 188
    .line 189
    check-cast p1, Ljava/util/List;

    .line 190
    .line 191
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 192
    .line 193
    .line 194
    move-result-object p1

    .line 195
    :goto_3
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 196
    .line 197
    .line 198
    move-result v0

    .line 199
    if-eqz v0, :cond_9

    .line 200
    .line 201
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 202
    .line 203
    .line 204
    move-result-object v0

    .line 205
    check-cast v0, Lcom/p1/mobile/putong/data/StickerInfo;

    .line 206
    .line 207
    iget-object v1, p0, Ll/hj00;->h:Ljava/util/List;

    .line 208
    .line 209
    new-instance v2, Ll/ej00;

    .line 210
    .line 211
    invoke-direct {v2, v0}, Ll/ej00;-><init>(Lcom/p1/mobile/putong/data/StickerInfo;)V

    .line 212
    .line 213
    .line 214
    invoke-static {v1, v2}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 215
    .line 216
    .line 217
    move-result-object v1

    .line 218
    check-cast v1, Lcom/p1/mobile/putong/data/StickerInfo;

    .line 219
    .line 220
    if-eqz v1, :cond_7

    .line 221
    .line 222
    iget-object v2, p0, Ll/hj00;->h:Ljava/util/List;

    .line 223
    .line 224
    invoke-interface {v2, v1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 225
    .line 226
    .line 227
    :cond_7
    iget-object v1, p0, Ll/hj00;->h:Ljava/util/List;

    .line 228
    .line 229
    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 230
    .line 231
    .line 232
    goto :goto_3

    .line 233
    :cond_8
    check-cast v1, Ljava/util/Collection;

    .line 234
    .line 235
    invoke-static {v1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 236
    .line 237
    .line 238
    move-result v0

    .line 239
    if-nez v0, :cond_9

    .line 240
    .line 241
    iget-object v0, p0, Ll/hj00;->h:Ljava/util/List;

    .line 242
    .line 243
    iget-object p1, p1, Ll/pf60;->a:Ljava/lang/Object;

    .line 244
    .line 245
    check-cast p1, Ljava/util/Collection;

    .line 246
    .line 247
    invoke-interface {v0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 248
    .line 249
    .line 250
    :cond_9
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 251
    .line 252
    check-cast p1, Ll/nk00;

    .line 253
    .line 254
    iget-object v0, p0, Ll/hj00;->g:Ljava/util/List;

    .line 255
    .line 256
    iget-object p0, p0, Ll/hj00;->h:Ljava/util/List;

    .line 257
    .line 258
    invoke-virtual {p1, v0, p0}, Ll/nk00;->P0(Ljava/util/List;Ljava/util/List;)V

    .line 259
    .line 260
    .line 261
    return-void
.end method

.method public s1(Ll/bkj0;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/bkj0<",
            "Lcom/p1/mobile/putong/feed/data/Moment;",
            "Ll/pf60<",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/StickerInfo;",
            ">;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/MomentMessage;",
            ">;>;",
            "Ll/pf60<",
            "Lcom/p1/mobile/putong/data/Music;",
            "Lcom/p1/mobile/putong/feed/data/RawFeed;",
            ">;>;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/nk00;

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Ll/nk00;->U0(Ll/bkj0;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    goto/16 :goto_2

    .line 12
    .line 13
    :cond_0
    iget-object v0, p1, Ll/bkj0;->c:Ljava/lang/Object;

    .line 14
    .line 15
    move-object v1, v0

    .line 16
    check-cast v1, Ll/pf60;

    .line 17
    .line 18
    iget-object v1, v1, Ll/pf60;->b:Ljava/lang/Object;

    .line 19
    .line 20
    if-eqz v1, :cond_1

    .line 21
    .line 22
    move-object v1, v0

    .line 23
    check-cast v1, Ll/pf60;

    .line 24
    .line 25
    iget-object v1, v1, Ll/pf60;->b:Ljava/lang/Object;

    .line 26
    .line 27
    check-cast v1, Lcom/p1/mobile/putong/feed/data/RawFeed;

    .line 28
    .line 29
    iput-object v1, p0, Ll/hj00;->f:Lcom/p1/mobile/putong/feed/data/RawFeed;

    .line 30
    .line 31
    :cond_1
    iget-object v1, p0, Ll/hj00;->e:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 32
    .line 33
    if-nez v1, :cond_2

    .line 34
    .line 35
    iget-object v0, p1, Ll/bkj0;->a:Ljava/lang/Object;

    .line 36
    .line 37
    move-object v1, v0

    .line 38
    check-cast v1, Lcom/p1/mobile/putong/feed/data/Moment;

    .line 39
    .line 40
    iput-object v1, p0, Ll/hj00;->e:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 41
    .line 42
    iget-object v1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 43
    .line 44
    check-cast v1, Ll/nk00;

    .line 45
    .line 46
    check-cast v0, Lcom/p1/mobile/putong/feed/data/Moment;

    .line 47
    .line 48
    invoke-virtual {v1, v0}, Ll/nk00;->R0(Lcom/p1/mobile/putong/feed/data/Moment;)V

    .line 49
    .line 50
    .line 51
    iget-object v0, p0, Ll/hj00;->e:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 52
    .line 53
    iget-object v1, p1, Ll/bkj0;->c:Ljava/lang/Object;

    .line 54
    .line 55
    check-cast v1, Ll/pf60;

    .line 56
    .line 57
    iget-object v1, v1, Ll/pf60;->a:Ljava/lang/Object;

    .line 58
    .line 59
    check-cast v1, Lcom/p1/mobile/putong/data/Music;

    .line 60
    .line 61
    invoke-direct {p0, v0, v1}, Ll/hj00;->J1(Lcom/p1/mobile/putong/feed/data/Moment;Lcom/p1/mobile/putong/data/Music;)V

    .line 62
    .line 63
    .line 64
    iget-object v0, p0, Ll/hj00;->e:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 65
    .line 66
    invoke-direct {p0, v0}, Ll/hj00;->t1(Lcom/p1/mobile/putong/feed/data/Moment;)V

    .line 67
    .line 68
    .line 69
    goto :goto_0

    .line 70
    :cond_2
    check-cast v0, Ll/pf60;

    .line 71
    .line 72
    iget-object v0, v0, Ll/pf60;->a:Ljava/lang/Object;

    .line 73
    .line 74
    check-cast v0, Lcom/p1/mobile/putong/data/Music;

    .line 75
    .line 76
    invoke-direct {p0, v1, v0}, Ll/hj00;->J1(Lcom/p1/mobile/putong/feed/data/Moment;Lcom/p1/mobile/putong/data/Music;)V

    .line 77
    .line 78
    .line 79
    iget-object v0, p1, Ll/bkj0;->a:Ljava/lang/Object;

    .line 80
    .line 81
    move-object v1, v0

    .line 82
    check-cast v1, Lcom/p1/mobile/putong/feed/data/Moment;

    .line 83
    .line 84
    iput-object v1, p0, Ll/hj00;->e:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 85
    .line 86
    iget-object v1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 87
    .line 88
    check-cast v1, Ll/nk00;

    .line 89
    .line 90
    check-cast v0, Lcom/p1/mobile/putong/feed/data/Moment;

    .line 91
    .line 92
    invoke-virtual {v1, v0}, Ll/nk00;->R0(Lcom/p1/mobile/putong/feed/data/Moment;)V

    .line 93
    .line 94
    .line 95
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 96
    .line 97
    check-cast v0, Ll/nk00;

    .line 98
    .line 99
    iget-object v1, p0, Ll/hj00;->d:Ll/n570;

    .line 100
    .line 101
    iget-object v2, p0, Ll/hj00;->j:Ljava/lang/String;

    .line 102
    .line 103
    invoke-virtual {v0, v1, v2}, Ll/nk00;->X0(Ll/n570;Ljava/lang/String;)V

    .line 104
    .line 105
    .line 106
    :goto_0
    iget-object v0, p1, Ll/bkj0;->a:Ljava/lang/Object;

    .line 107
    .line 108
    move-object v1, v0

    .line 109
    check-cast v1, Lcom/p1/mobile/putong/feed/data/Moment;

    .line 110
    .line 111
    iget-object v1, v1, Lcom/p1/mobile/putong/feed/data/Moment;->messages:Lcom/p1/mobile/putong/data/PartialIdList;

    .line 112
    .line 113
    iget-object v1, v1, Lcom/p1/mobile/putong/data/PartialIdList;->links:Lcom/p1/mobile/putong/data/Links;

    .line 114
    .line 115
    iput-object v1, p0, Ll/hj00;->i:Lcom/p1/mobile/putong/data/Links;

    .line 116
    .line 117
    iget-object v1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 118
    .line 119
    check-cast v1, Ll/nk00;

    .line 120
    .line 121
    check-cast v0, Lcom/p1/mobile/putong/feed/data/Moment;

    .line 122
    .line 123
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/data/Moment;->messages:Lcom/p1/mobile/putong/data/PartialIdList;

    .line 124
    .line 125
    iget-object v0, v0, Lcom/p1/mobile/putong/data/PartialIdList;->links:Lcom/p1/mobile/putong/data/Links;

    .line 126
    .line 127
    invoke-virtual {v1, v0}, Ll/nk00;->Q0(Lcom/p1/mobile/putong/data/Links;)V

    .line 128
    .line 129
    .line 130
    iget-object v0, p0, Ll/hj00;->g:Ljava/util/List;

    .line 131
    .line 132
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 133
    .line 134
    .line 135
    move-result v0

    .line 136
    if-nez v0, :cond_4

    .line 137
    .line 138
    iget-object v0, p1, Ll/bkj0;->b:Ljava/lang/Object;

    .line 139
    .line 140
    check-cast v0, Ll/pf60;

    .line 141
    .line 142
    iget-object v0, v0, Ll/pf60;->b:Ljava/lang/Object;

    .line 143
    .line 144
    check-cast v0, Ljava/util/List;

    .line 145
    .line 146
    invoke-direct {p0, v0}, Ll/hj00;->I1(Ljava/util/List;)Ljava/util/List;

    .line 147
    .line 148
    .line 149
    move-result-object v0

    .line 150
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 151
    .line 152
    .line 153
    move-result-object v0

    .line 154
    :cond_3
    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 155
    .line 156
    .line 157
    move-result v1

    .line 158
    if-eqz v1, :cond_5

    .line 159
    .line 160
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 161
    .line 162
    .line 163
    move-result-object v1

    .line 164
    check-cast v1, Lcom/p1/mobile/putong/feed/data/MomentMessage;

    .line 165
    .line 166
    iget-object v2, p0, Ll/hj00;->g:Ljava/util/List;

    .line 167
    .line 168
    new-instance v3, Ll/fj00;

    .line 169
    .line 170
    invoke-direct {v3, v1}, Ll/fj00;-><init>(Lcom/p1/mobile/putong/feed/data/MomentMessage;)V

    .line 171
    .line 172
    .line 173
    invoke-static {v2, v3}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 174
    .line 175
    .line 176
    move-result-object v2

    .line 177
    if-nez v2, :cond_3

    .line 178
    .line 179
    iget-object v2, p0, Ll/hj00;->g:Ljava/util/List;

    .line 180
    .line 181
    invoke-interface {v2, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 182
    .line 183
    .line 184
    goto :goto_1

    .line 185
    :cond_4
    iget-object v0, p0, Ll/hj00;->g:Ljava/util/List;

    .line 186
    .line 187
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 188
    .line 189
    .line 190
    iget-object v0, p0, Ll/hj00;->g:Ljava/util/List;

    .line 191
    .line 192
    iget-object v1, p1, Ll/bkj0;->b:Ljava/lang/Object;

    .line 193
    .line 194
    check-cast v1, Ll/pf60;

    .line 195
    .line 196
    iget-object v1, v1, Ll/pf60;->b:Ljava/lang/Object;

    .line 197
    .line 198
    check-cast v1, Ljava/util/List;

    .line 199
    .line 200
    invoke-direct {p0, v1}, Ll/hj00;->I1(Ljava/util/List;)Ljava/util/List;

    .line 201
    .line 202
    .line 203
    move-result-object v1

    .line 204
    invoke-interface {v0, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 205
    .line 206
    .line 207
    :cond_5
    iget-object v0, p1, Ll/bkj0;->b:Ljava/lang/Object;

    .line 208
    .line 209
    check-cast v0, Ll/pf60;

    .line 210
    .line 211
    iget-object v0, v0, Ll/pf60;->a:Ljava/lang/Object;

    .line 212
    .line 213
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 214
    .line 215
    .line 216
    move-result v0

    .line 217
    if-eqz v0, :cond_6

    .line 218
    .line 219
    iget-object v0, p0, Ll/hj00;->h:Ljava/util/List;

    .line 220
    .line 221
    iget-object v1, p1, Ll/bkj0;->b:Ljava/lang/Object;

    .line 222
    .line 223
    check-cast v1, Ll/pf60;

    .line 224
    .line 225
    iget-object v1, v1, Ll/pf60;->a:Ljava/lang/Object;

    .line 226
    .line 227
    check-cast v1, Ljava/util/Collection;

    .line 228
    .line 229
    invoke-interface {v0, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 230
    .line 231
    .line 232
    :cond_6
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 233
    .line 234
    check-cast v0, Ll/nk00;

    .line 235
    .line 236
    iget-object v1, p0, Ll/hj00;->g:Ljava/util/List;

    .line 237
    .line 238
    iget-object v2, p0, Ll/hj00;->h:Ljava/util/List;

    .line 239
    .line 240
    invoke-virtual {v0, v1, v2}, Ll/nk00;->P0(Ljava/util/List;Ljava/util/List;)V

    .line 241
    .line 242
    .line 243
    iget-object v0, p1, Ll/bkj0;->c:Ljava/lang/Object;

    .line 244
    .line 245
    check-cast v0, Ll/pf60;

    .line 246
    .line 247
    iget-object v0, v0, Ll/pf60;->b:Ljava/lang/Object;

    .line 248
    .line 249
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 250
    .line 251
    .line 252
    move-result v0

    .line 253
    if-eqz v0, :cond_7

    .line 254
    .line 255
    iget-object p1, p1, Ll/bkj0;->c:Ljava/lang/Object;

    .line 256
    .line 257
    check-cast p1, Ll/pf60;

    .line 258
    .line 259
    iget-object p1, p1, Ll/pf60;->b:Ljava/lang/Object;

    .line 260
    .line 261
    check-cast p1, Lcom/p1/mobile/putong/feed/data/RawFeed;

    .line 262
    .line 263
    iget-boolean p1, p1, Lcom/p1/mobile/putong/feed/data/RawFeed;->canGreeting:Z

    .line 264
    .line 265
    iput-boolean p1, p0, Ll/hj00;->w:Z

    .line 266
    .line 267
    :cond_7
    invoke-virtual {p0}, Ll/hj00;->J0()V

    .line 268
    .line 269
    .line 270
    iget-object p1, p0, Ll/hj00;->A:Ljava/lang/String;

    .line 271
    .line 272
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 273
    .line 274
    .line 275
    move-result p1

    .line 276
    const-wide/16 v0, 0x14

    .line 277
    .line 278
    if-nez p1, :cond_9

    .line 279
    .line 280
    iget-object p1, p0, Ll/hj00;->g:Ljava/util/List;

    .line 281
    .line 282
    new-instance v2, Ll/gj00;

    .line 283
    .line 284
    invoke-direct {v2, p0}, Ll/gj00;-><init>(Ll/hj00;)V

    .line 285
    .line 286
    .line 287
    invoke-static {p1, v2}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 288
    .line 289
    .line 290
    move-result-object p1

    .line 291
    check-cast p1, Lcom/p1/mobile/putong/feed/data/MomentMessage;

    .line 292
    .line 293
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 294
    .line 295
    .line 296
    move-result v2

    .line 297
    if-eqz v2, :cond_8

    .line 298
    .line 299
    iget-object v2, p0, Ll/hj00;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailFrag;

    .line 300
    .line 301
    new-instance v3, Ll/ji00;

    .line 302
    .line 303
    invoke-direct {v3, p0, p1}, Ll/ji00;-><init>(Ll/hj00;Lcom/p1/mobile/putong/feed/data/MomentMessage;)V

    .line 304
    .line 305
    .line 306
    invoke-static {v2, v3, v0, v1}, Ll/l51;->I(Lcom/p1/mobile/android/app/Frag;Ljava/lang/Runnable;J)V

    .line 307
    .line 308
    .line 309
    iget-object p1, p0, Ll/hj00;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailFrag;

    .line 310
    .line 311
    new-instance v0, Ll/ki00;

    .line 312
    .line 313
    invoke-direct {v0, p0}, Ll/ki00;-><init>(Ll/hj00;)V

    .line 314
    .line 315
    .line 316
    const-wide/16 v1, 0x1f4

    .line 317
    .line 318
    invoke-static {p1, v0, v1, v2}, Ll/l51;->I(Lcom/p1/mobile/android/app/Frag;Ljava/lang/Runnable;J)V

    .line 319
    .line 320
    .line 321
    return-void

    .line 322
    :cond_8
    const-string p0, "\u8bc4\u8bba\u5df2\u5220\u9664"

    .line 323
    .line 324
    invoke-static {p0}, Ll/r1j0;->g(Ljava/lang/String;)V

    .line 325
    .line 326
    .line 327
    return-void

    .line 328
    :cond_9
    iget-boolean p1, p0, Ll/hj00;->z:Z

    .line 329
    .line 330
    if-eqz p1, :cond_a

    .line 331
    .line 332
    iget-object p1, p0, Ll/hj00;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailFrag;

    .line 333
    .line 334
    new-instance v2, Ll/li00;

    .line 335
    .line 336
    invoke-direct {v2, p0}, Ll/li00;-><init>(Ll/hj00;)V

    .line 337
    .line 338
    .line 339
    invoke-static {p1, v2, v0, v1}, Ll/l51;->I(Lcom/p1/mobile/android/app/Frag;Ljava/lang/Runnable;J)V

    .line 340
    .line 341
    .line 342
    :cond_a
    :goto_2
    return-void
.end method

.method public u1()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/nk00;

    .line 4
    .line 5
    iget-object v1, p0, Ll/hj00;->d:Ll/n570;

    .line 6
    .line 7
    iget-object p0, p0, Ll/hj00;->j:Ljava/lang/String;

    .line 8
    .line 9
    invoke-virtual {v0, v1, p0}, Ll/nk00;->X0(Ll/n570;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public v1(Ljava/lang/String;Lcom/p1/mobile/putong/feed/data/MomentMessage;Ll/x20;)V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/hj00;->b:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    iget-object v1, p2, Lcom/p1/mobile/putong/feed/data/MomentMessage;->value:Ljava/lang/String;

    .line 4
    .line 5
    const-string v2, "comment"

    .line 6
    .line 7
    invoke-static {v2}, Lcom/p1/mobile/putong/data/DetectCategoryType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/DetectCategoryType;

    .line 8
    .line 9
    .line 10
    move-result-object v2

    .line 11
    new-instance v5, Ll/wi00;

    .line 12
    .line 13
    invoke-direct {v5, p0, p1, p2, p3}, Ll/wi00;-><init>(Ll/hj00;Ljava/lang/String;Lcom/p1/mobile/putong/feed/data/MomentMessage;Ll/x20;)V

    .line 14
    .line 15
    .line 16
    const-string v3, "comment"

    .line 17
    .line 18
    const-string v4, "p_user_moment_interactions_details_view"

    .line 19
    .line 20
    invoke-static/range {v0 .. v5}, Ll/ksg;->o(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/data/DetectCategoryType;Ljava/lang/String;Ljava/lang/String;Ll/x20;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public x1(Ljava/lang/String;Ljava/lang/String;Ll/x20;)V
    .locals 4

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->H()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 6
    .line 7
    check-cast v1, Ll/nk00;

    .line 8
    .line 9
    iget-object v1, v1, Ll/nk00;->S:Landroid/view/View;

    .line 10
    .line 11
    invoke-interface {v0, v1}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->qh(Landroid/view/View;)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    instance-of v1, v0, Lcom/p1/mobile/putong/data/StickerInfo;

    .line 16
    .line 17
    if-eqz v1, :cond_0

    .line 18
    .line 19
    move-object v1, v0

    .line 20
    check-cast v1, Lcom/p1/mobile/putong/data/StickerInfo;

    .line 21
    .line 22
    iget-object v2, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 23
    .line 24
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 25
    .line 26
    .line 27
    move-result v2

    .line 28
    if-eqz v2, :cond_0

    .line 29
    .line 30
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->H()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    iget-object v2, p0, Ll/hj00;->b:Lcom/p1/mobile/android/app/Act;

    .line 35
    .line 36
    new-instance v3, Ll/qi00;

    .line 37
    .line 38
    invoke-direct {v3, p0, p1, p2, p3}, Ll/qi00;-><init>(Ll/hj00;Ljava/lang/String;Ljava/lang/String;Ll/x20;)V

    .line 39
    .line 40
    .line 41
    invoke-interface {v0, v2, v1, v3}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->Fc(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/StickerInfo;Ll/y20;)V

    .line 42
    .line 43
    .line 44
    return-void

    .line 45
    :cond_0
    invoke-virtual {p0, p1, p2, p3, v0}, Ll/hj00;->z1(Ljava/lang/String;Ljava/lang/String;Ll/x20;Ljava/lang/Object;)V

    .line 46
    .line 47
    .line 48
    return-void
.end method

.method public z1(Ljava/lang/String;Ljava/lang/String;Ll/x20;Ljava/lang/Object;)V
    .locals 3

    .line 1
    new-instance p4, Lcom/p1/mobile/putong/feed/data/MomentMessage;

    .line 2
    .line 3
    invoke-direct {p4}, Lcom/p1/mobile/putong/feed/data/MomentMessage;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object p1, p4, Lcom/p1/mobile/putong/feed/data/MomentMessage;->value:Ljava/lang/String;

    .line 7
    .line 8
    iget-object p1, p0, Ll/hj00;->o:Ljava/lang/String;

    .line 9
    .line 10
    iput-object p1, p4, Lcom/p1/mobile/putong/feed/data/MomentMessage;->moment:Ljava/lang/String;

    .line 11
    .line 12
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->F()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    invoke-interface {p1}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    iput-object p1, p4, Lcom/p1/mobile/putong/feed/data/MomentMessage;->owner:Ljava/lang/String;

    .line 21
    .line 22
    iget-object p1, p0, Ll/hj00;->m:Ljava/lang/String;

    .line 23
    .line 24
    iput-object p1, p4, Lcom/p1/mobile/putong/feed/data/MomentMessage;->api_only_otherUser:Ljava/lang/String;

    .line 25
    .line 26
    invoke-static {}, Ll/er60;->w()Ll/er60;

    .line 27
    .line 28
    .line 29
    iget-object p1, p0, Ll/hj00;->j:Ljava/lang/String;

    .line 30
    .line 31
    invoke-static {p1}, Ll/er60;->D(Ljava/lang/String;)Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    iput-object p1, p4, Lcom/p1/mobile/putong/feed/data/MomentMessage;->momentShowFromType:Ljava/lang/String;

    .line 36
    .line 37
    invoke-static {}, Lcom/p1/mobile/putong/feed/data/CommentInfo;->new_()Lcom/p1/mobile/putong/feed/data/CommentInfo;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    iget-object v0, p0, Ll/hj00;->n:Ljava/lang/String;

    .line 42
    .line 43
    iput-object v0, p1, Lcom/p1/mobile/putong/feed/data/CommentInfo;->parentMessageId:Ljava/lang/String;

    .line 44
    .line 45
    iget-object v0, p0, Ll/hj00;->l:Lcom/p1/mobile/putong/feed/data/MomentMessage;

    .line 46
    .line 47
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 48
    .line 49
    .line 50
    move-result v0

    .line 51
    if-eqz v0, :cond_0

    .line 52
    .line 53
    iget-object v0, p0, Ll/hj00;->l:Lcom/p1/mobile/putong/feed/data/MomentMessage;

    .line 54
    .line 55
    iget-object v0, v0, Lcom/tantanapp/common/data/CopyObject;->id:Ljava/lang/String;

    .line 56
    .line 57
    iput-object v0, p1, Lcom/p1/mobile/putong/feed/data/CommentInfo;->replyMessageId:Ljava/lang/String;

    .line 58
    .line 59
    :cond_0
    const-string v0, ""

    .line 60
    .line 61
    iput-object v0, p0, Ll/hj00;->n:Ljava/lang/String;

    .line 62
    .line 63
    iput-object p1, p4, Lcom/p1/mobile/putong/feed/data/MomentMessage;->commentInfo:Lcom/p1/mobile/putong/feed/data/CommentInfo;

    .line 64
    .line 65
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/CommentInfo;->parentMessageId:Ljava/lang/String;

    .line 66
    .line 67
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 68
    .line 69
    .line 70
    move-result p1

    .line 71
    if-nez p1, :cond_1

    .line 72
    .line 73
    iget-object p1, p0, Ll/hj00;->l:Lcom/p1/mobile/putong/feed/data/MomentMessage;

    .line 74
    .line 75
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 76
    .line 77
    .line 78
    move-result p1

    .line 79
    if-eqz p1, :cond_1

    .line 80
    .line 81
    iget-object p1, p0, Ll/hj00;->l:Lcom/p1/mobile/putong/feed/data/MomentMessage;

    .line 82
    .line 83
    iget-object p1, p1, Lcom/tantanapp/common/data/CopyObject;->id:Ljava/lang/String;

    .line 84
    .line 85
    iput-object p1, p4, Lcom/p1/mobile/putong/feed/data/MomentMessage;->replyCommentId:Ljava/lang/String;

    .line 86
    .line 87
    :cond_1
    iget-object p1, p0, Ll/hj00;->H:Ljava/util/List;

    .line 88
    .line 89
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 90
    .line 91
    .line 92
    move-result p1

    .line 93
    const/4 v1, 0x0

    .line 94
    if-nez p1, :cond_2

    .line 95
    .line 96
    move p1, v1

    .line 97
    :goto_0
    iget-object v2, p0, Ll/hj00;->H:Ljava/util/List;

    .line 98
    .line 99
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 100
    .line 101
    .line 102
    move-result v2

    .line 103
    if-ge p1, v2, :cond_2

    .line 104
    .line 105
    iget-object v2, p0, Ll/hj00;->H:Ljava/util/List;

    .line 106
    .line 107
    invoke-interface {v2, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 108
    .line 109
    .line 110
    move-result-object v2

    .line 111
    check-cast v2, Ljava/lang/CharSequence;

    .line 112
    .line 113
    invoke-virtual {p2, v2, v0}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    .line 114
    .line 115
    .line 116
    move-result-object p2

    .line 117
    add-int/lit8 p1, p1, 0x1

    .line 118
    .line 119
    goto :goto_0

    .line 120
    :cond_2
    const/4 p1, 0x0

    .line 121
    iput-object p1, p0, Ll/hj00;->I:Lcom/p1/mobile/putong/data/StickerInfo;

    .line 122
    .line 123
    iput-boolean v1, p0, Ll/hj00;->J:Z

    .line 124
    .line 125
    iget-object p1, p0, Ll/hj00;->H:Ljava/util/List;

    .line 126
    .line 127
    invoke-interface {p1}, Ljava/util/List;->clear()V

    .line 128
    .line 129
    .line 130
    sget-object p1, Ll/uqb0;->Z:Ll/a4j;

    .line 131
    .line 132
    invoke-virtual {p1, p2}, Ll/a4j;->K(Ljava/lang/String;)Z

    .line 133
    .line 134
    .line 135
    move-result p1

    .line 136
    if-eqz p1, :cond_3

    .line 137
    .line 138
    iget-object p1, p0, Ll/hj00;->b:Lcom/p1/mobile/android/app/Act;

    .line 139
    .line 140
    new-instance p2, Ll/si00;

    .line 141
    .line 142
    invoke-direct {p2, p0, p4, p3}, Ll/si00;-><init>(Ll/hj00;Lcom/p1/mobile/putong/feed/data/MomentMessage;Ll/x20;)V

    .line 143
    .line 144
    .line 145
    invoke-static {p1, p2, v1}, Ll/k3h;->A0(Lcom/p1/mobile/android/app/Act;Ll/x20;Z)V

    .line 146
    .line 147
    .line 148
    return-void

    .line 149
    :cond_3
    iget-object p1, p0, Ll/hj00;->p:Ljava/lang/String;

    .line 150
    .line 151
    invoke-virtual {p0, p1, p4, p3}, Ll/hj00;->v1(Ljava/lang/String;Lcom/p1/mobile/putong/feed/data/MomentMessage;Ll/x20;)V

    .line 152
    .line 153
    .line 154
    invoke-direct {p0, p2}, Ll/hj00;->Q0(Ljava/lang/String;)V

    .line 155
    .line 156
    .line 157
    return-void
.end method

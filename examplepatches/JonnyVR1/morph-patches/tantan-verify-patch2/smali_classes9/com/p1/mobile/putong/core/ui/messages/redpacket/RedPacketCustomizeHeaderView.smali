.class public Lcom/p1/mobile/putong/core/ui/messages/redpacket/RedPacketCustomizeHeaderView;
.super Landroid/widget/RelativeLayout;
.source "SourceFile"


# instance fields
.field public a:Landroid/widget/LinearLayout;

.field public b:Lv/VDraweeView;

.field public c:Lv/VText;

.field public d:Lv/VImage;

.field public e:Lv/VText;

.field public f:Landroid/widget/LinearLayout;

.field public g:Lv/VText;

.field public h:Lv/VText;

.field public i:Lv/VText;

.field public j:Landroid/view/View;

.field public k:Lv/VText;

.field public l:Landroid/view/View;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 5
    invoke-direct {p0, p1, p2}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 6
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static synthetic a(Ll/ztc0;Landroid/view/View;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/ztc0;->P()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    const-string v0, "groupchat_id"

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/ztc0;->y()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-static {v0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    filled-new-array {v0}, [Ll/pf60;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    const-string v1, "e_send_red_packet_again"

    .line 20
    .line 21
    invoke-static {v1, p1, v0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {p0}, Ll/ztc0;->u()Lcom/p1/mobile/putong/core/ui/messages/redpacket/RedPacketRecordAct;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    invoke-virtual {p0}, Ll/ztc0;->y()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/core/ui/messages/redpacket/SendRedPacketAct;->a2(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)Landroid/content/Intent;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    invoke-virtual {p0}, Ll/ztc0;->u()Lcom/p1/mobile/putong/core/ui/messages/redpacket/RedPacketRecordAct;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    invoke-virtual {p0, p1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 41
    .line 42
    .line 43
    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/core/ui/messages/redpacket/RedPacketCustomizeHeaderView;ZLcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/messages/redpacket/RedPacketCustomizeHeaderView;->e(ZLcom/p1/mobile/putong/data/User;)V

    return-void
.end method


# virtual methods
.method public final c(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/tsc0;->a(Lcom/p1/mobile/putong/core/ui/messages/redpacket/RedPacketCustomizeHeaderView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public d()Lcom/p1/mobile/putong/app/PutongAct;
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Lcom/p1/mobile/putong/app/PutongAct;

    .line 6
    .line 7
    return-object p0
.end method

.method public final synthetic e(ZLcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    sget-object p1, Ll/uqb0;->G:Ll/fsb0;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/redpacket/RedPacketCustomizeHeaderView;->b:Lv/VDraweeView;

    .line 6
    .line 7
    const-string p2, "https://auto.tancdn.com/v1/images/eyJpZCI6IlVLWVo3Q0lEWk9LVFVHVVJHNktEM1pIVzNEVFJVRiIsInciOjcyMCwiaCI6NzIwLCJkIjowLCJtdCI6ImltYWdlL2pwZWcifQ.png"

    .line 8
    .line 9
    invoke-virtual {p1, p0, p2}, Ll/fsb0;->Z0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    if-eqz p1, :cond_1

    .line 18
    .line 19
    sget-object p1, Ll/uqb0;->G:Ll/fsb0;

    .line 20
    .line 21
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/redpacket/RedPacketCustomizeHeaderView;->b:Lv/VDraweeView;

    .line 22
    .line 23
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 24
    .line 25
    .line 26
    move-result-object p2

    .line 27
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 28
    .line 29
    .line 30
    move-result-object p2

    .line 31
    invoke-virtual {p1, p0, p2}, Ll/fsb0;->Q0(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;)V

    .line 32
    .line 33
    .line 34
    return-void

    .line 35
    :cond_1
    sget-object p1, Ll/uqb0;->G:Ll/fsb0;

    .line 36
    .line 37
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/redpacket/RedPacketCustomizeHeaderView;->b:Lv/VDraweeView;

    .line 38
    .line 39
    sget p2, Ll/ibc0;->I0:I

    .line 40
    .line 41
    invoke-virtual {p1, p0, p2}, Ll/fsb0;->Y0(Lcom/facebook/drawee/view/SimpleDraweeView;I)V

    .line 42
    .line 43
    .line 44
    return-void
.end method

.method public f(Lcom/p1/mobile/putong/core/data/ReceiveRecords;ZLcom/p1/mobile/putong/core/data/RedPacket;Ll/ztc0;Ljava/util/List;Ll/qsc0;J)V
    .locals 20
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/core/data/ReceiveRecords;",
            "Z",
            "Lcom/p1/mobile/putong/core/data/RedPacket;",
            "Ll/ztc0;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/ReceiveRecords;",
            ">;",
            "Ll/qsc0;",
            "J)V"
        }
    .end annotation

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    move-object/from16 v2, p3

    .line 6
    .line 7
    move-object/from16 v3, p5

    .line 8
    .line 9
    sget-object v4, Ll/uqb0;->G:Ll/fsb0;

    .line 10
    .line 11
    iget-object v5, v0, Lcom/p1/mobile/putong/core/ui/messages/redpacket/RedPacketCustomizeHeaderView;->b:Lv/VDraweeView;

    .line 12
    .line 13
    sget v6, Ll/ibc0;->I0:I

    .line 14
    .line 15
    invoke-virtual {v4, v5, v6}, Ll/fsb0;->Y0(Lcom/facebook/drawee/view/SimpleDraweeView;I)V

    .line 16
    .line 17
    .line 18
    iget-object v4, v0, Lcom/p1/mobile/putong/core/ui/messages/redpacket/RedPacketCustomizeHeaderView;->g:Lv/VText;

    .line 19
    .line 20
    invoke-virtual {v4}, Landroid/widget/TextView;->getTypeface()Landroid/graphics/Typeface;

    .line 21
    .line 22
    .line 23
    move-result-object v5

    .line 24
    const/4 v6, 0x1

    .line 25
    invoke-virtual {v4, v5, v6}, Landroidx/appcompat/widget/AppCompatTextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 26
    .line 27
    .line 28
    iget-object v4, v0, Lcom/p1/mobile/putong/core/ui/messages/redpacket/RedPacketCustomizeHeaderView;->h:Lv/VText;

    .line 29
    .line 30
    invoke-virtual {v4}, Landroid/widget/TextView;->getTypeface()Landroid/graphics/Typeface;

    .line 31
    .line 32
    .line 33
    move-result-object v5

    .line 34
    invoke-virtual {v4, v5, v6}, Landroidx/appcompat/widget/AppCompatTextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/messages/redpacket/RedPacketCustomizeHeaderView;->d()Lcom/p1/mobile/putong/app/PutongAct;

    .line 38
    .line 39
    .line 40
    move-result-object v4

    .line 41
    sget-object v5, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 42
    .line 43
    iget-object v5, v5, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 44
    .line 45
    iget-object v7, v1, Lcom/p1/mobile/putong/core/data/ReceiveRecords;->userId:Ljava/lang/String;

    .line 46
    .line 47
    invoke-virtual {v5, v7}, Ll/dkb;->Ma(Ljava/lang/String;)Lrx/c;

    .line 48
    .line 49
    .line 50
    move-result-object v5

    .line 51
    move-object/from16 v7, p6

    .line 52
    .line 53
    invoke-virtual {v7, v4, v5}, Ll/jic0;->c(Ll/ner;Lrx/c;)Lrx/c;

    .line 54
    .line 55
    .line 56
    move-result-object v4

    .line 57
    new-instance v5, Ll/rsc0;

    .line 58
    .line 59
    move/from16 v7, p2

    .line 60
    .line 61
    invoke-direct {v5, v0, v7}, Ll/rsc0;-><init>(Lcom/p1/mobile/putong/core/ui/messages/redpacket/RedPacketCustomizeHeaderView;Z)V

    .line 62
    .line 63
    .line 64
    invoke-static {v5}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 65
    .line 66
    .line 67
    move-result-object v5

    .line 68
    invoke-virtual {v4, v5}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 69
    .line 70
    .line 71
    iget-object v4, v0, Lcom/p1/mobile/putong/core/ui/messages/redpacket/RedPacketCustomizeHeaderView;->c:Lv/VText;

    .line 72
    .line 73
    new-instance v5, Ljava/lang/StringBuilder;

    .line 74
    .line 75
    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    .line 76
    .line 77
    .line 78
    iget-object v7, v1, Lcom/p1/mobile/putong/core/data/ReceiveRecords;->name:Ljava/lang/String;

    .line 79
    .line 80
    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 81
    .line 82
    .line 83
    const-string v7, "\u7684\u7ea2\u5305"

    .line 84
    .line 85
    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 86
    .line 87
    .line 88
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 89
    .line 90
    .line 91
    move-result-object v5

    .line 92
    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 93
    .line 94
    .line 95
    iget-object v4, v0, Lcom/p1/mobile/putong/core/ui/messages/redpacket/RedPacketCustomizeHeaderView;->g:Lv/VText;

    .line 96
    .line 97
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/ReceiveRecords;->amount:Ljava/lang/String;

    .line 98
    .line 99
    invoke-virtual {v4, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 100
    .line 101
    .line 102
    iget-object v1, v0, Lcom/p1/mobile/putong/core/ui/messages/redpacket/RedPacketCustomizeHeaderView;->e:Lv/VText;

    .line 103
    .line 104
    iget-object v4, v2, Lcom/p1/mobile/putong/core/data/RedPacket;->showInfo:Lcom/p1/mobile/putong/core/data/RedPacketInfo;

    .line 105
    .line 106
    iget-object v4, v4, Lcom/p1/mobile/putong/core/data/RedPacketInfo;->title:Ljava/lang/String;

    .line 107
    .line 108
    invoke-virtual {v1, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 109
    .line 110
    .line 111
    iget-object v1, v0, Lcom/p1/mobile/putong/core/ui/messages/redpacket/RedPacketCustomizeHeaderView;->d:Lv/VImage;

    .line 112
    .line 113
    iget-object v4, v2, Lcom/p1/mobile/putong/core/data/RedPacket;->splitType:Ljava/lang/String;

    .line 114
    .line 115
    const-string v5, "random"

    .line 116
    .line 117
    invoke-static {v4, v5}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 118
    .line 119
    .line 120
    move-result v4

    .line 121
    invoke-static {v1, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 122
    .line 123
    .line 124
    iget-object v1, v2, Lcom/p1/mobile/putong/core/data/RedPacket;->myInfo:Lcom/p1/mobile/putong/core/data/RedPacketMyInfo;

    .line 125
    .line 126
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/RedPacketMyInfo;->amount:Ljava/lang/String;

    .line 127
    .line 128
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 129
    .line 130
    .line 131
    move-result v1

    .line 132
    const/16 v4, 0x8

    .line 133
    .line 134
    if-eqz v1, :cond_0

    .line 135
    .line 136
    iget-object v1, v0, Lcom/p1/mobile/putong/core/ui/messages/redpacket/RedPacketCustomizeHeaderView;->g:Lv/VText;

    .line 137
    .line 138
    invoke-virtual {v1, v4}, Landroid/view/View;->setVisibility(I)V

    .line 139
    .line 140
    .line 141
    iget-object v1, v0, Lcom/p1/mobile/putong/core/ui/messages/redpacket/RedPacketCustomizeHeaderView;->h:Lv/VText;

    .line 142
    .line 143
    invoke-virtual {v1, v4}, Landroid/view/View;->setVisibility(I)V

    .line 144
    .line 145
    .line 146
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 147
    .line 148
    .line 149
    move-result-object v1

    .line 150
    invoke-interface {v1}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 151
    .line 152
    .line 153
    move-result-object v1

    .line 154
    iget-object v7, v2, Lcom/p1/mobile/putong/core/data/RedPacket;->owner:Lcom/p1/mobile/putong/core/data/RedPacketOwner;

    .line 155
    .line 156
    iget-object v7, v7, Lcom/p1/mobile/putong/core/data/RedPacketOwner;->ownerId:Ljava/lang/String;

    .line 157
    .line 158
    invoke-static {v1, v7}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 159
    .line 160
    .line 161
    move-result v1

    .line 162
    const-string v7, "\u88ab\u62a2\u5149"

    .line 163
    .line 164
    const-string v8, "\u5df2\u9886\u53d6"

    .line 165
    .line 166
    const-string v9, "\u9886\u53d6\u6210\u529f\uff0c\u9884\u8ba124\u5c0f\u65f6\u5185\u5230\u8d26\u652f\u4ed8\u5b9d\u8d26\u6237"

    .line 167
    .line 168
    const-string v10, "\u4e2a\u7ea2\u5305\u5171"

    .line 169
    .line 170
    const-string v11, "/"

    .line 171
    .line 172
    const-string v12, "\u5143"

    .line 173
    .line 174
    if-eqz v1, :cond_e

    .line 175
    .line 176
    iget-wide v13, v2, Lcom/p1/mobile/putong/core/data/RedPacket;->expireTime:J

    .line 177
    .line 178
    const-wide/16 v15, 0x3e8

    .line 179
    .line 180
    mul-long/2addr v13, v15

    .line 181
    sget-object v1, Ll/uqb0;->H:Lcom/p1/mobile/putong/api/api/Network;

    .line 182
    .line 183
    invoke-virtual {v1}, Lcom/p1/mobile/putong/api/api/Network;->guessedCurrentServerTime()J

    .line 184
    .line 185
    .line 186
    move-result-wide v17

    .line 187
    cmp-long v1, v13, v17

    .line 188
    .line 189
    if-gez v1, :cond_1

    .line 190
    .line 191
    iget v1, v2, Lcom/p1/mobile/putong/core/data/RedPacket;->quantity:I

    .line 192
    .line 193
    iget v13, v2, Lcom/p1/mobile/putong/core/data/RedPacket;->assignQuantity:I

    .line 194
    .line 195
    if-le v1, v13, :cond_1

    .line 196
    .line 197
    iget-object v1, v0, Lcom/p1/mobile/putong/core/ui/messages/redpacket/RedPacketCustomizeHeaderView;->i:Lv/VText;

    .line 198
    .line 199
    const-string v4, "48\u5c0f\u65f6\u672a\u9886\u53d6\u5b8c\uff0c\u5c06\u9000\u56de\u652f\u4ed8\u5b9d\u8d26\u6237"

    .line 200
    .line 201
    invoke-virtual {v1, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 202
    .line 203
    .line 204
    goto :goto_0

    .line 205
    :cond_1
    iget-wide v13, v2, Lcom/p1/mobile/putong/core/data/RedPacket;->expireTime:J

    .line 206
    .line 207
    mul-long/2addr v13, v15

    .line 208
    sget-object v1, Ll/uqb0;->H:Lcom/p1/mobile/putong/api/api/Network;

    .line 209
    .line 210
    invoke-virtual {v1}, Lcom/p1/mobile/putong/api/api/Network;->guessedCurrentServerTime()J

    .line 211
    .line 212
    .line 213
    move-result-wide v17

    .line 214
    cmp-long v1, v13, v17

    .line 215
    .line 216
    if-lez v1, :cond_2

    .line 217
    .line 218
    iget v1, v2, Lcom/p1/mobile/putong/core/data/RedPacket;->quantity:I

    .line 219
    .line 220
    iget v13, v2, Lcom/p1/mobile/putong/core/data/RedPacket;->assignQuantity:I

    .line 221
    .line 222
    if-le v1, v13, :cond_2

    .line 223
    .line 224
    invoke-virtual/range {p4 .. p4}, Ll/ztc0;->P()Ljava/lang/String;

    .line 225
    .line 226
    .line 227
    move-result-object v1

    .line 228
    const-string v4, "groupchat_id"

    .line 229
    .line 230
    invoke-virtual/range {p4 .. p4}, Ll/ztc0;->y()Ljava/lang/String;

    .line 231
    .line 232
    .line 233
    move-result-object v9

    .line 234
    invoke-static {v4, v9}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 235
    .line 236
    .line 237
    move-result-object v4

    .line 238
    filled-new-array {v4}, [Ll/pf60;

    .line 239
    .line 240
    .line 241
    move-result-object v4

    .line 242
    const-string v9, "e_send_red_packet_again"

    .line 243
    .line 244
    invoke-static {v9, v1, v4}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 245
    .line 246
    .line 247
    iget-object v1, v0, Lcom/p1/mobile/putong/core/ui/messages/redpacket/RedPacketCustomizeHeaderView;->i:Lv/VText;

    .line 248
    .line 249
    const-string v4, "\u7ee7\u7eed\u53d1\u9001\u6b64\u7ea2\u5305"

    .line 250
    .line 251
    invoke-virtual {v1, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 252
    .line 253
    .line 254
    iget-object v1, v0, Lcom/p1/mobile/putong/core/ui/messages/redpacket/RedPacketCustomizeHeaderView;->i:Lv/VText;

    .line 255
    .line 256
    new-instance v4, Ll/ssc0;

    .line 257
    .line 258
    move-object/from16 v9, p4

    .line 259
    .line 260
    invoke-direct {v4, v9}, Ll/ssc0;-><init>(Ll/ztc0;)V

    .line 261
    .line 262
    .line 263
    invoke-static {v1, v4}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 264
    .line 265
    .line 266
    goto :goto_0

    .line 267
    :cond_2
    iget v1, v2, Lcom/p1/mobile/putong/core/data/RedPacket;->quantity:I

    .line 268
    .line 269
    iget v13, v2, Lcom/p1/mobile/putong/core/data/RedPacket;->assignQuantity:I

    .line 270
    .line 271
    if-gt v1, v13, :cond_4

    .line 272
    .line 273
    iget-object v1, v2, Lcom/p1/mobile/putong/core/data/RedPacket;->myInfo:Lcom/p1/mobile/putong/core/data/RedPacketMyInfo;

    .line 274
    .line 275
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/RedPacketMyInfo;->amount:Ljava/lang/String;

    .line 276
    .line 277
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 278
    .line 279
    .line 280
    move-result v1

    .line 281
    iget-object v13, v0, Lcom/p1/mobile/putong/core/ui/messages/redpacket/RedPacketCustomizeHeaderView;->i:Lv/VText;

    .line 282
    .line 283
    if-nez v1, :cond_3

    .line 284
    .line 285
    invoke-virtual {v13, v9}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 286
    .line 287
    .line 288
    goto :goto_0

    .line 289
    :cond_3
    invoke-virtual {v13, v4}, Landroid/view/View;->setVisibility(I)V

    .line 290
    .line 291
    .line 292
    :cond_4
    :goto_0
    iget-wide v13, v2, Lcom/p1/mobile/putong/core/data/RedPacket;->expireTime:J

    .line 293
    .line 294
    mul-long/2addr v13, v15

    .line 295
    sget-object v1, Ll/uqb0;->H:Lcom/p1/mobile/putong/api/api/Network;

    .line 296
    .line 297
    invoke-virtual {v1}, Lcom/p1/mobile/putong/api/api/Network;->guessedCurrentServerTime()J

    .line 298
    .line 299
    .line 300
    move-result-wide v17

    .line 301
    cmp-long v1, v13, v17

    .line 302
    .line 303
    const-string v4, "\u4e2a\uff0c\u5171"

    .line 304
    .line 305
    const-string v9, "average"

    .line 306
    .line 307
    if-ltz v1, :cond_6

    .line 308
    .line 309
    iget v1, v2, Lcom/p1/mobile/putong/core/data/RedPacket;->quantity:I

    .line 310
    .line 311
    iget v13, v2, Lcom/p1/mobile/putong/core/data/RedPacket;->assignQuantity:I

    .line 312
    .line 313
    if-le v1, v13, :cond_6

    .line 314
    .line 315
    iget-object v1, v2, Lcom/p1/mobile/putong/core/data/RedPacket;->splitType:Ljava/lang/String;

    .line 316
    .line 317
    invoke-static {v1, v5}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 318
    .line 319
    .line 320
    move-result v1

    .line 321
    if-nez v1, :cond_5

    .line 322
    .line 323
    iget-object v1, v2, Lcom/p1/mobile/putong/core/data/RedPacket;->splitType:Ljava/lang/String;

    .line 324
    .line 325
    invoke-static {v1, v9}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 326
    .line 327
    .line 328
    move-result v1

    .line 329
    if-eqz v1, :cond_6

    .line 330
    .line 331
    iget v1, v2, Lcom/p1/mobile/putong/core/data/RedPacket;->quantity:I

    .line 332
    .line 333
    if-le v1, v6, :cond_6

    .line 334
    .line 335
    :cond_5
    iget-object v1, v0, Lcom/p1/mobile/putong/core/ui/messages/redpacket/RedPacketCustomizeHeaderView;->k:Lv/VText;

    .line 336
    .line 337
    new-instance v3, Ljava/lang/StringBuilder;

    .line 338
    .line 339
    invoke-direct {v3, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 340
    .line 341
    .line 342
    iget v5, v2, Lcom/p1/mobile/putong/core/data/RedPacket;->assignQuantity:I

    .line 343
    .line 344
    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 345
    .line 346
    .line 347
    invoke-virtual {v3, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 348
    .line 349
    .line 350
    iget v5, v2, Lcom/p1/mobile/putong/core/data/RedPacket;->quantity:I

    .line 351
    .line 352
    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 353
    .line 354
    .line 355
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 356
    .line 357
    .line 358
    iget-object v4, v2, Lcom/p1/mobile/putong/core/data/RedPacket;->assignAmount:Ljava/lang/String;

    .line 359
    .line 360
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 361
    .line 362
    .line 363
    invoke-virtual {v3, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 364
    .line 365
    .line 366
    iget-object v4, v2, Lcom/p1/mobile/putong/core/data/RedPacket;->totalAmount:Ljava/lang/String;

    .line 367
    .line 368
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 369
    .line 370
    .line 371
    invoke-virtual {v3, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 372
    .line 373
    .line 374
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 375
    .line 376
    .line 377
    move-result-object v3

    .line 378
    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 379
    .line 380
    .line 381
    goto/16 :goto_1

    .line 382
    .line 383
    :cond_6
    iget-wide v13, v2, Lcom/p1/mobile/putong/core/data/RedPacket;->expireTime:J

    .line 384
    .line 385
    mul-long/2addr v13, v15

    .line 386
    sget-object v1, Ll/uqb0;->H:Lcom/p1/mobile/putong/api/api/Network;

    .line 387
    .line 388
    invoke-virtual {v1}, Lcom/p1/mobile/putong/api/api/Network;->guessedCurrentServerTime()J

    .line 389
    .line 390
    .line 391
    move-result-wide v17

    .line 392
    cmp-long v1, v13, v17

    .line 393
    .line 394
    if-gez v1, :cond_8

    .line 395
    .line 396
    iget v1, v2, Lcom/p1/mobile/putong/core/data/RedPacket;->quantity:I

    .line 397
    .line 398
    iget v8, v2, Lcom/p1/mobile/putong/core/data/RedPacket;->assignQuantity:I

    .line 399
    .line 400
    if-le v1, v8, :cond_8

    .line 401
    .line 402
    iget-object v1, v2, Lcom/p1/mobile/putong/core/data/RedPacket;->splitType:Ljava/lang/String;

    .line 403
    .line 404
    invoke-static {v1, v5}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 405
    .line 406
    .line 407
    move-result v1

    .line 408
    if-nez v1, :cond_7

    .line 409
    .line 410
    iget-object v1, v2, Lcom/p1/mobile/putong/core/data/RedPacket;->splitType:Ljava/lang/String;

    .line 411
    .line 412
    invoke-static {v1, v9}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 413
    .line 414
    .line 415
    move-result v1

    .line 416
    if-eqz v1, :cond_8

    .line 417
    .line 418
    iget v1, v2, Lcom/p1/mobile/putong/core/data/RedPacket;->quantity:I

    .line 419
    .line 420
    if-le v1, v6, :cond_8

    .line 421
    .line 422
    :cond_7
    iget-object v1, v0, Lcom/p1/mobile/putong/core/ui/messages/redpacket/RedPacketCustomizeHeaderView;->k:Lv/VText;

    .line 423
    .line 424
    new-instance v3, Ljava/lang/StringBuilder;

    .line 425
    .line 426
    const-string v5, "\u7ea2\u5305\u5df2\u8fc7\u671f\u3002\u5df2\u9886\u53d6"

    .line 427
    .line 428
    invoke-direct {v3, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 429
    .line 430
    .line 431
    iget v5, v2, Lcom/p1/mobile/putong/core/data/RedPacket;->assignQuantity:I

    .line 432
    .line 433
    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 434
    .line 435
    .line 436
    invoke-virtual {v3, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 437
    .line 438
    .line 439
    iget v5, v2, Lcom/p1/mobile/putong/core/data/RedPacket;->quantity:I

    .line 440
    .line 441
    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 442
    .line 443
    .line 444
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 445
    .line 446
    .line 447
    iget-object v4, v2, Lcom/p1/mobile/putong/core/data/RedPacket;->assignAmount:Ljava/lang/String;

    .line 448
    .line 449
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 450
    .line 451
    .line 452
    invoke-virtual {v3, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 453
    .line 454
    .line 455
    iget-object v4, v2, Lcom/p1/mobile/putong/core/data/RedPacket;->totalAmount:Ljava/lang/String;

    .line 456
    .line 457
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 458
    .line 459
    .line 460
    invoke-virtual {v3, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 461
    .line 462
    .line 463
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 464
    .line 465
    .line 466
    move-result-object v3

    .line 467
    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 468
    .line 469
    .line 470
    goto/16 :goto_1

    .line 471
    .line 472
    :cond_8
    iget-object v1, v2, Lcom/p1/mobile/putong/core/data/RedPacket;->splitType:Ljava/lang/String;

    .line 473
    .line 474
    invoke-static {v1, v9}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 475
    .line 476
    .line 477
    move-result v1

    .line 478
    if-eqz v1, :cond_9

    .line 479
    .line 480
    iget v1, v2, Lcom/p1/mobile/putong/core/data/RedPacket;->quantity:I

    .line 481
    .line 482
    if-ne v1, v6, :cond_9

    .line 483
    .line 484
    iget-wide v13, v2, Lcom/p1/mobile/putong/core/data/RedPacket;->expireTime:J

    .line 485
    .line 486
    mul-long/2addr v13, v15

    .line 487
    sget-object v1, Ll/uqb0;->H:Lcom/p1/mobile/putong/api/api/Network;

    .line 488
    .line 489
    invoke-virtual {v1}, Lcom/p1/mobile/putong/api/api/Network;->guessedCurrentServerTime()J

    .line 490
    .line 491
    .line 492
    move-result-wide v17

    .line 493
    cmp-long v1, v13, v17

    .line 494
    .line 495
    if-ltz v1, :cond_9

    .line 496
    .line 497
    iget v1, v2, Lcom/p1/mobile/putong/core/data/RedPacket;->quantity:I

    .line 498
    .line 499
    iget v4, v2, Lcom/p1/mobile/putong/core/data/RedPacket;->assignQuantity:I

    .line 500
    .line 501
    if-le v1, v4, :cond_9

    .line 502
    .line 503
    iget-object v1, v0, Lcom/p1/mobile/putong/core/ui/messages/redpacket/RedPacketCustomizeHeaderView;->k:Lv/VText;

    .line 504
    .line 505
    new-instance v3, Ljava/lang/StringBuilder;

    .line 506
    .line 507
    const-string v4, "\u7ea2\u5305\u91d1\u989d"

    .line 508
    .line 509
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 510
    .line 511
    .line 512
    iget-object v4, v2, Lcom/p1/mobile/putong/core/data/RedPacket;->totalAmount:Ljava/lang/String;

    .line 513
    .line 514
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 515
    .line 516
    .line 517
    const-string v4, "\u5143\uff0c\u7b49\u5f85\u9886\u53d6"

    .line 518
    .line 519
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 520
    .line 521
    .line 522
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 523
    .line 524
    .line 525
    move-result-object v3

    .line 526
    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 527
    .line 528
    .line 529
    goto/16 :goto_1

    .line 530
    .line 531
    :cond_9
    iget-object v1, v2, Lcom/p1/mobile/putong/core/data/RedPacket;->splitType:Ljava/lang/String;

    .line 532
    .line 533
    invoke-static {v1, v9}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 534
    .line 535
    .line 536
    move-result v1

    .line 537
    if-eqz v1, :cond_a

    .line 538
    .line 539
    iget v1, v2, Lcom/p1/mobile/putong/core/data/RedPacket;->quantity:I

    .line 540
    .line 541
    if-ne v1, v6, :cond_a

    .line 542
    .line 543
    iget-wide v13, v2, Lcom/p1/mobile/putong/core/data/RedPacket;->expireTime:J

    .line 544
    .line 545
    mul-long/2addr v13, v15

    .line 546
    sget-object v1, Ll/uqb0;->H:Lcom/p1/mobile/putong/api/api/Network;

    .line 547
    .line 548
    invoke-virtual {v1}, Lcom/p1/mobile/putong/api/api/Network;->guessedCurrentServerTime()J

    .line 549
    .line 550
    .line 551
    move-result-wide v17

    .line 552
    cmp-long v1, v13, v17

    .line 553
    .line 554
    if-gez v1, :cond_a

    .line 555
    .line 556
    iget v1, v2, Lcom/p1/mobile/putong/core/data/RedPacket;->quantity:I

    .line 557
    .line 558
    iget v4, v2, Lcom/p1/mobile/putong/core/data/RedPacket;->assignQuantity:I

    .line 559
    .line 560
    if-le v1, v4, :cond_a

    .line 561
    .line 562
    iget-object v1, v0, Lcom/p1/mobile/putong/core/ui/messages/redpacket/RedPacketCustomizeHeaderView;->k:Lv/VText;

    .line 563
    .line 564
    new-instance v3, Ljava/lang/StringBuilder;

    .line 565
    .line 566
    const-string v4, "\u7ea2\u5305\u5df2\u8fc7\u671f\u3002\u7ea2\u5305\u91d1\u989d"

    .line 567
    .line 568
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 569
    .line 570
    .line 571
    iget-object v4, v2, Lcom/p1/mobile/putong/core/data/RedPacket;->totalAmount:Ljava/lang/String;

    .line 572
    .line 573
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 574
    .line 575
    .line 576
    const-string v4, "\u5143\uff0c\u5c06\u9000\u56de\u652f\u4ed8\u5b9d\u8d26\u6237"

    .line 577
    .line 578
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 579
    .line 580
    .line 581
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 582
    .line 583
    .line 584
    move-result-object v3

    .line 585
    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 586
    .line 587
    .line 588
    goto/16 :goto_1

    .line 589
    .line 590
    :cond_a
    iget-object v1, v2, Lcom/p1/mobile/putong/core/data/RedPacket;->splitType:Ljava/lang/String;

    .line 591
    .line 592
    invoke-static {v1, v5}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 593
    .line 594
    .line 595
    move-result v1

    .line 596
    if-eqz v1, :cond_b

    .line 597
    .line 598
    iget v1, v2, Lcom/p1/mobile/putong/core/data/RedPacket;->quantity:I

    .line 599
    .line 600
    iget v4, v2, Lcom/p1/mobile/putong/core/data/RedPacket;->assignQuantity:I

    .line 601
    .line 602
    if-gt v1, v4, :cond_b

    .line 603
    .line 604
    iget-object v1, v0, Lcom/p1/mobile/putong/core/ui/messages/redpacket/RedPacketCustomizeHeaderView;->k:Lv/VText;

    .line 605
    .line 606
    new-instance v4, Ljava/lang/StringBuilder;

    .line 607
    .line 608
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 609
    .line 610
    .line 611
    iget v5, v2, Lcom/p1/mobile/putong/core/data/RedPacket;->quantity:I

    .line 612
    .line 613
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 614
    .line 615
    .line 616
    invoke-virtual {v4, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 617
    .line 618
    .line 619
    iget-object v5, v2, Lcom/p1/mobile/putong/core/data/RedPacket;->totalAmount:Ljava/lang/String;

    .line 620
    .line 621
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 622
    .line 623
    .line 624
    const-string v5, "\u5143\uff0c"

    .line 625
    .line 626
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 627
    .line 628
    .line 629
    invoke-interface {v3, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 630
    .line 631
    .line 632
    move-result-object v3

    .line 633
    check-cast v3, Lcom/p1/mobile/putong/core/data/ReceiveRecords;

    .line 634
    .line 635
    iget-wide v13, v3, Lcom/p1/mobile/putong/core/data/ReceiveRecords;->createTime:J

    .line 636
    .line 637
    const/4 v15, 0x0

    .line 638
    iget-wide v5, v2, Lcom/p1/mobile/putong/core/data/RedPacket;->createTime:J

    .line 639
    .line 640
    move-wide/from16 v18, p7

    .line 641
    .line 642
    move-wide/from16 v16, v5

    .line 643
    .line 644
    invoke-static/range {v13 .. v19}, Ll/duc0;->a(JZJJ)Ljava/lang/String;

    .line 645
    .line 646
    .line 647
    move-result-object v3

    .line 648
    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 649
    .line 650
    .line 651
    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 652
    .line 653
    .line 654
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 655
    .line 656
    .line 657
    move-result-object v3

    .line 658
    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 659
    .line 660
    .line 661
    goto/16 :goto_1

    .line 662
    .line 663
    :cond_b
    iget-object v1, v2, Lcom/p1/mobile/putong/core/data/RedPacket;->splitType:Ljava/lang/String;

    .line 664
    .line 665
    invoke-static {v1, v9}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 666
    .line 667
    .line 668
    move-result v1

    .line 669
    if-eqz v1, :cond_c

    .line 670
    .line 671
    iget-wide v3, v2, Lcom/p1/mobile/putong/core/data/RedPacket;->expireTime:J

    .line 672
    .line 673
    mul-long/2addr v3, v15

    .line 674
    sget-object v1, Ll/uqb0;->H:Lcom/p1/mobile/putong/api/api/Network;

    .line 675
    .line 676
    invoke-virtual {v1}, Lcom/p1/mobile/putong/api/api/Network;->guessedCurrentServerTime()J

    .line 677
    .line 678
    .line 679
    move-result-wide v5

    .line 680
    cmp-long v1, v3, v5

    .line 681
    .line 682
    if-ltz v1, :cond_c

    .line 683
    .line 684
    iget v1, v2, Lcom/p1/mobile/putong/core/data/RedPacket;->quantity:I

    .line 685
    .line 686
    iget v3, v2, Lcom/p1/mobile/putong/core/data/RedPacket;->assignQuantity:I

    .line 687
    .line 688
    if-gt v1, v3, :cond_c

    .line 689
    .line 690
    iget-object v1, v0, Lcom/p1/mobile/putong/core/ui/messages/redpacket/RedPacketCustomizeHeaderView;->k:Lv/VText;

    .line 691
    .line 692
    new-instance v3, Ljava/lang/StringBuilder;

    .line 693
    .line 694
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 695
    .line 696
    .line 697
    iget v4, v2, Lcom/p1/mobile/putong/core/data/RedPacket;->quantity:I

    .line 698
    .line 699
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 700
    .line 701
    .line 702
    invoke-virtual {v3, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 703
    .line 704
    .line 705
    iget-object v4, v2, Lcom/p1/mobile/putong/core/data/RedPacket;->totalAmount:Ljava/lang/String;

    .line 706
    .line 707
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 708
    .line 709
    .line 710
    invoke-virtual {v3, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 711
    .line 712
    .line 713
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 714
    .line 715
    .line 716
    move-result-object v3

    .line 717
    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 718
    .line 719
    .line 720
    goto/16 :goto_1

    .line 721
    .line 722
    :cond_c
    iget-object v1, v2, Lcom/p1/mobile/putong/core/data/RedPacket;->splitType:Ljava/lang/String;

    .line 723
    .line 724
    invoke-static {v1, v9}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 725
    .line 726
    .line 727
    move-result v1

    .line 728
    if-eqz v1, :cond_d

    .line 729
    .line 730
    iget-wide v3, v2, Lcom/p1/mobile/putong/core/data/RedPacket;->expireTime:J

    .line 731
    .line 732
    mul-long/2addr v3, v15

    .line 733
    sget-object v1, Ll/uqb0;->H:Lcom/p1/mobile/putong/api/api/Network;

    .line 734
    .line 735
    invoke-virtual {v1}, Lcom/p1/mobile/putong/api/api/Network;->guessedCurrentServerTime()J

    .line 736
    .line 737
    .line 738
    move-result-wide v5

    .line 739
    cmp-long v1, v3, v5

    .line 740
    .line 741
    if-gez v1, :cond_d

    .line 742
    .line 743
    iget v1, v2, Lcom/p1/mobile/putong/core/data/RedPacket;->quantity:I

    .line 744
    .line 745
    iget v3, v2, Lcom/p1/mobile/putong/core/data/RedPacket;->assignQuantity:I

    .line 746
    .line 747
    if-gt v1, v3, :cond_d

    .line 748
    .line 749
    iget-object v1, v0, Lcom/p1/mobile/putong/core/ui/messages/redpacket/RedPacketCustomizeHeaderView;->k:Lv/VText;

    .line 750
    .line 751
    new-instance v3, Ljava/lang/StringBuilder;

    .line 752
    .line 753
    const-string v4, "\u7ea2\u5305\u5df2\u8fc7\u671f\u3002"

    .line 754
    .line 755
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 756
    .line 757
    .line 758
    iget v4, v2, Lcom/p1/mobile/putong/core/data/RedPacket;->quantity:I

    .line 759
    .line 760
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 761
    .line 762
    .line 763
    invoke-virtual {v3, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 764
    .line 765
    .line 766
    iget-object v4, v2, Lcom/p1/mobile/putong/core/data/RedPacket;->totalAmount:Ljava/lang/String;

    .line 767
    .line 768
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 769
    .line 770
    .line 771
    invoke-virtual {v3, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 772
    .line 773
    .line 774
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 775
    .line 776
    .line 777
    move-result-object v3

    .line 778
    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 779
    .line 780
    .line 781
    goto/16 :goto_1

    .line 782
    .line 783
    :cond_d
    iget-object v1, v0, Lcom/p1/mobile/putong/core/ui/messages/redpacket/RedPacketCustomizeHeaderView;->k:Lv/VText;

    .line 784
    .line 785
    new-instance v3, Ljava/lang/StringBuilder;

    .line 786
    .line 787
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 788
    .line 789
    .line 790
    iget v4, v2, Lcom/p1/mobile/putong/core/data/RedPacket;->quantity:I

    .line 791
    .line 792
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 793
    .line 794
    .line 795
    invoke-virtual {v3, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 796
    .line 797
    .line 798
    iget-object v4, v2, Lcom/p1/mobile/putong/core/data/RedPacket;->totalAmount:Ljava/lang/String;

    .line 799
    .line 800
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 801
    .line 802
    .line 803
    invoke-virtual {v3, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 804
    .line 805
    .line 806
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 807
    .line 808
    .line 809
    move-result-object v3

    .line 810
    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 811
    .line 812
    .line 813
    goto :goto_1

    .line 814
    :cond_e
    iget-object v1, v2, Lcom/p1/mobile/putong/core/data/RedPacket;->myInfo:Lcom/p1/mobile/putong/core/data/RedPacketMyInfo;

    .line 815
    .line 816
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/RedPacketMyInfo;->amount:Ljava/lang/String;

    .line 817
    .line 818
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 819
    .line 820
    .line 821
    move-result v1

    .line 822
    if-nez v1, :cond_f

    .line 823
    .line 824
    iget-object v1, v0, Lcom/p1/mobile/putong/core/ui/messages/redpacket/RedPacketCustomizeHeaderView;->i:Lv/VText;

    .line 825
    .line 826
    invoke-virtual {v1, v9}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 827
    .line 828
    .line 829
    :cond_f
    iget v1, v2, Lcom/p1/mobile/putong/core/data/RedPacket;->quantity:I

    .line 830
    .line 831
    iget v4, v2, Lcom/p1/mobile/putong/core/data/RedPacket;->assignQuantity:I

    .line 832
    .line 833
    iget-object v5, v0, Lcom/p1/mobile/putong/core/ui/messages/redpacket/RedPacketCustomizeHeaderView;->k:Lv/VText;

    .line 834
    .line 835
    if-gt v1, v4, :cond_10

    .line 836
    .line 837
    new-instance v1, Ljava/lang/StringBuilder;

    .line 838
    .line 839
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 840
    .line 841
    .line 842
    iget v4, v2, Lcom/p1/mobile/putong/core/data/RedPacket;->quantity:I

    .line 843
    .line 844
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 845
    .line 846
    .line 847
    const-string v4, "\u4e2a\u7ea2\u5305\uff0c"

    .line 848
    .line 849
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 850
    .line 851
    .line 852
    invoke-interface {v3, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 853
    .line 854
    .line 855
    move-result-object v3

    .line 856
    check-cast v3, Lcom/p1/mobile/putong/core/data/ReceiveRecords;

    .line 857
    .line 858
    iget-wide v13, v3, Lcom/p1/mobile/putong/core/data/ReceiveRecords;->createTime:J

    .line 859
    .line 860
    const/4 v15, 0x0

    .line 861
    iget-wide v3, v2, Lcom/p1/mobile/putong/core/data/RedPacket;->createTime:J

    .line 862
    .line 863
    move-wide/from16 v18, p7

    .line 864
    .line 865
    move-wide/from16 v16, v3

    .line 866
    .line 867
    invoke-static/range {v13 .. v19}, Ll/duc0;->a(JZJJ)Ljava/lang/String;

    .line 868
    .line 869
    .line 870
    move-result-object v3

    .line 871
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 872
    .line 873
    .line 874
    invoke-virtual {v1, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 875
    .line 876
    .line 877
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 878
    .line 879
    .line 880
    move-result-object v1

    .line 881
    invoke-virtual {v5, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 882
    .line 883
    .line 884
    goto :goto_1

    .line 885
    :cond_10
    new-instance v1, Ljava/lang/StringBuilder;

    .line 886
    .line 887
    invoke-direct {v1, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 888
    .line 889
    .line 890
    iget v3, v2, Lcom/p1/mobile/putong/core/data/RedPacket;->assignQuantity:I

    .line 891
    .line 892
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 893
    .line 894
    .line 895
    invoke-virtual {v1, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 896
    .line 897
    .line 898
    iget v3, v2, Lcom/p1/mobile/putong/core/data/RedPacket;->quantity:I

    .line 899
    .line 900
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 901
    .line 902
    .line 903
    const-string v3, "\u4e2a"

    .line 904
    .line 905
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 906
    .line 907
    .line 908
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 909
    .line 910
    .line 911
    move-result-object v1

    .line 912
    invoke-virtual {v5, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 913
    .line 914
    .line 915
    :goto_1
    iget-object v1, v0, Lcom/p1/mobile/putong/core/ui/messages/redpacket/RedPacketCustomizeHeaderView;->k:Lv/VText;

    .line 916
    .line 917
    invoke-virtual {v1}, Landroidx/appcompat/widget/AppCompatTextView;->getText()Ljava/lang/CharSequence;

    .line 918
    .line 919
    .line 920
    move-result-object v1

    .line 921
    invoke-interface {v1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 922
    .line 923
    .line 924
    move-result-object v1

    .line 925
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 926
    .line 927
    .line 928
    move-result v1

    .line 929
    if-eqz v1, :cond_11

    .line 930
    .line 931
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/messages/redpacket/RedPacketCustomizeHeaderView;->k:Lv/VText;

    .line 932
    .line 933
    new-instance v1, Ljava/lang/StringBuilder;

    .line 934
    .line 935
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 936
    .line 937
    .line 938
    iget v3, v2, Lcom/p1/mobile/putong/core/data/RedPacket;->quantity:I

    .line 939
    .line 940
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 941
    .line 942
    .line 943
    invoke-virtual {v1, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 944
    .line 945
    .line 946
    iget-object v2, v2, Lcom/p1/mobile/putong/core/data/RedPacket;->totalAmount:Ljava/lang/String;

    .line 947
    .line 948
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 949
    .line 950
    .line 951
    invoke-virtual {v1, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 952
    .line 953
    .line 954
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 955
    .line 956
    .line 957
    move-result-object v1

    .line 958
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 959
    .line 960
    .line 961
    :cond_11
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/ui/messages/redpacket/RedPacketCustomizeHeaderView;->c(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

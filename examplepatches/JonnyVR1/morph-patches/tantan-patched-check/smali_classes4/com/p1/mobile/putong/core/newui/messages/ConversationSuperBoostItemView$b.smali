.class public Lcom/p1/mobile/putong/core/newui/messages/ConversationSuperBoostItemView$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/newui/messages/ConversationSuperBoostItemView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "b"
.end annotation


# instance fields
.field public final a:Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;

.field public final b:I

.field public final synthetic c:Lcom/p1/mobile/putong/core/newui/messages/ConversationSuperBoostItemView;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationSuperBoostItemView;Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;I)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationSuperBoostItemView$b;->c:Lcom/p1/mobile/putong/core/newui/messages/ConversationSuperBoostItemView;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object p2, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationSuperBoostItemView$b;->a:Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;

    .line 7
    .line 8
    iput p3, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationSuperBoostItemView$b;->b:I

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 6

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationSuperBoostItemView$b;->a:Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;

    .line 2
    .line 3
    iget v0, p1, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;->a:I

    .line 4
    .line 5
    const/16 v1, 0xb

    .line 6
    .line 7
    const/4 v2, 0x1

    .line 8
    if-ne v0, v1, :cond_1

    .line 9
    .line 10
    iget p1, p1, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;->m:I

    .line 11
    .line 12
    if-ne p1, v2, :cond_0

    .line 13
    .line 14
    invoke-static {}, Ll/zsb;->f()Ll/zsb;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationSuperBoostItemView$b;->c:Lcom/p1/mobile/putong/core/newui/messages/ConversationSuperBoostItemView;

    .line 19
    .line 20
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationSuperBoostItemView;->y0()Lcom/p1/mobile/putong/app/PutongAct;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    invoke-virtual {p1, p0}, Ll/zsb;->l(Lcom/p1/mobile/android/app/Act;)V

    .line 25
    .line 26
    .line 27
    return-void

    .line 28
    :cond_0
    invoke-static {}, Ll/zsb;->f()Ll/zsb;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationSuperBoostItemView$b;->c:Lcom/p1/mobile/putong/core/newui/messages/ConversationSuperBoostItemView;

    .line 33
    .line 34
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationSuperBoostItemView;->y0()Lcom/p1/mobile/putong/app/PutongAct;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    invoke-virtual {p1, p0}, Ll/zsb;->d(Lcom/p1/mobile/android/app/Act;)V

    .line 39
    .line 40
    .line 41
    return-void

    .line 42
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationSuperBoostItemView$b;->c:Lcom/p1/mobile/putong/core/newui/messages/ConversationSuperBoostItemView;

    .line 43
    .line 44
    iget v1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationSuperBoostItemView$b;->b:I

    .line 45
    .line 46
    invoke-static {v0, v2, p1, v1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationSuperBoostItemView;->t0(Lcom/p1/mobile/putong/core/newui/messages/ConversationSuperBoostItemView;ZLcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;I)V

    .line 47
    .line 48
    .line 49
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationSuperBoostItemView$b;->c:Lcom/p1/mobile/putong/core/newui/messages/ConversationSuperBoostItemView;

    .line 50
    .line 51
    iget-object p1, p1, Lcom/p1/mobile/putong/core/newui/messages/ConversationSuperBoostItemView;->n:Lcom/p1/mobile/putong/data/User;

    .line 52
    .line 53
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 54
    .line 55
    const-string v0, "show_user_id"

    .line 56
    .line 57
    invoke-static {v0, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 58
    .line 59
    .line 60
    move-result-object p1

    .line 61
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    invoke-interface {v0}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    const-string v1, "tap_user_id"

    .line 70
    .line 71
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    filled-new-array {p1, v0}, [Ll/pf60;

    .line 76
    .line 77
    .line 78
    move-result-object p1

    .line 79
    const-string v0, "e_messages_rec_flow"

    .line 80
    .line 81
    const-string v1, "p_messages_view"

    .line 82
    .line 83
    invoke-static {v0, v1, p1}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 84
    .line 85
    .line 86
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationSuperBoostItemView$b;->c:Lcom/p1/mobile/putong/core/newui/messages/ConversationSuperBoostItemView;

    .line 87
    .line 88
    invoke-static {p1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationSuperBoostItemView;->i0(Lcom/p1/mobile/putong/core/newui/messages/ConversationSuperBoostItemView;)Lcom/p1/mobile/putong/core/data/SpotLightLiveInfo;

    .line 89
    .line 90
    .line 91
    move-result-object p1

    .line 92
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 93
    .line 94
    .line 95
    move-result p1

    .line 96
    if-eqz p1, :cond_3

    .line 97
    .line 98
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationSuperBoostItemView$b;->c:Lcom/p1/mobile/putong/core/newui/messages/ConversationSuperBoostItemView;

    .line 99
    .line 100
    invoke-static {p1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationSuperBoostItemView;->i0(Lcom/p1/mobile/putong/core/newui/messages/ConversationSuperBoostItemView;)Lcom/p1/mobile/putong/core/data/SpotLightLiveInfo;

    .line 101
    .line 102
    .line 103
    move-result-object p1

    .line 104
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/SpotLightLiveInfo;->id:Ljava/lang/String;

    .line 105
    .line 106
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 107
    .line 108
    .line 109
    move-result p1

    .line 110
    if-nez p1, :cond_3

    .line 111
    .line 112
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationSuperBoostItemView$b;->c:Lcom/p1/mobile/putong/core/newui/messages/ConversationSuperBoostItemView;

    .line 113
    .line 114
    invoke-static {p1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationSuperBoostItemView;->i0(Lcom/p1/mobile/putong/core/newui/messages/ConversationSuperBoostItemView;)Lcom/p1/mobile/putong/core/data/SpotLightLiveInfo;

    .line 115
    .line 116
    .line 117
    move-result-object p1

    .line 118
    iget p1, p1, Lcom/p1/mobile/putong/core/data/SpotLightLiveInfo;->liveType:I

    .line 119
    .line 120
    if-nez p1, :cond_2

    .line 121
    .line 122
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->Q()Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;

    .line 123
    .line 124
    .line 125
    move-result-object p1

    .line 126
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationSuperBoostItemView$b;->c:Lcom/p1/mobile/putong/core/newui/messages/ConversationSuperBoostItemView;

    .line 127
    .line 128
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationSuperBoostItemView;->y0()Lcom/p1/mobile/putong/app/PutongAct;

    .line 129
    .line 130
    .line 131
    move-result-object v0

    .line 132
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationSuperBoostItemView$b;->c:Lcom/p1/mobile/putong/core/newui/messages/ConversationSuperBoostItemView;

    .line 133
    .line 134
    invoke-static {v1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationSuperBoostItemView;->i0(Lcom/p1/mobile/putong/core/newui/messages/ConversationSuperBoostItemView;)Lcom/p1/mobile/putong/core/data/SpotLightLiveInfo;

    .line 135
    .line 136
    .line 137
    move-result-object v1

    .line 138
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/SpotLightLiveInfo;->id:Ljava/lang/String;

    .line 139
    .line 140
    const-string v2, "conversation"

    .line 141
    .line 142
    const/4 v3, 0x0

    .line 143
    invoke-interface {p1, v0, v1, v2, v3}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;->startAudienceLive(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 144
    .line 145
    .line 146
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationSuperBoostItemView$b;->c:Lcom/p1/mobile/putong/core/newui/messages/ConversationSuperBoostItemView;

    .line 147
    .line 148
    invoke-static {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationSuperBoostItemView;->i0(Lcom/p1/mobile/putong/core/newui/messages/ConversationSuperBoostItemView;)Lcom/p1/mobile/putong/core/data/SpotLightLiveInfo;

    .line 149
    .line 150
    .line 151
    move-result-object p1

    .line 152
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationSuperBoostItemView;->u0(Lcom/p1/mobile/putong/core/newui/messages/ConversationSuperBoostItemView;Lcom/p1/mobile/putong/core/data/SpotLightLiveInfo;)V

    .line 153
    .line 154
    .line 155
    return-void

    .line 156
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationSuperBoostItemView$b;->c:Lcom/p1/mobile/putong/core/newui/messages/ConversationSuperBoostItemView;

    .line 157
    .line 158
    invoke-static {p1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationSuperBoostItemView;->i0(Lcom/p1/mobile/putong/core/newui/messages/ConversationSuperBoostItemView;)Lcom/p1/mobile/putong/core/data/SpotLightLiveInfo;

    .line 159
    .line 160
    .line 161
    move-result-object p1

    .line 162
    iget p1, p1, Lcom/p1/mobile/putong/core/data/SpotLightLiveInfo;->liveType:I

    .line 163
    .line 164
    if-ne p1, v2, :cond_5

    .line 165
    .line 166
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->Q()Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;

    .line 167
    .line 168
    .line 169
    move-result-object p1

    .line 170
    invoke-interface {p1}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;->M6()Ll/ftn0;

    .line 171
    .line 172
    .line 173
    move-result-object v0

    .line 174
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationSuperBoostItemView$b;->c:Lcom/p1/mobile/putong/core/newui/messages/ConversationSuperBoostItemView;

    .line 175
    .line 176
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationSuperBoostItemView;->y0()Lcom/p1/mobile/putong/app/PutongAct;

    .line 177
    .line 178
    .line 179
    move-result-object v1

    .line 180
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationSuperBoostItemView$b;->c:Lcom/p1/mobile/putong/core/newui/messages/ConversationSuperBoostItemView;

    .line 181
    .line 182
    invoke-static {p1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationSuperBoostItemView;->i0(Lcom/p1/mobile/putong/core/newui/messages/ConversationSuperBoostItemView;)Lcom/p1/mobile/putong/core/data/SpotLightLiveInfo;

    .line 183
    .line 184
    .line 185
    move-result-object p1

    .line 186
    iget-object v2, p1, Lcom/p1/mobile/putong/core/data/SpotLightLiveInfo;->id:Ljava/lang/String;

    .line 187
    .line 188
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationSuperBoostItemView$b;->c:Lcom/p1/mobile/putong/core/newui/messages/ConversationSuperBoostItemView;

    .line 189
    .line 190
    invoke-static {p1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationSuperBoostItemView;->i0(Lcom/p1/mobile/putong/core/newui/messages/ConversationSuperBoostItemView;)Lcom/p1/mobile/putong/core/data/SpotLightLiveInfo;

    .line 191
    .line 192
    .line 193
    move-result-object p1

    .line 194
    iget-object v4, p1, Lcom/p1/mobile/putong/core/data/SpotLightLiveInfo;->anchorId:Ljava/lang/String;

    .line 195
    .line 196
    const/4 v5, 0x0

    .line 197
    const-string v3, "conversation"

    .line 198
    .line 199
    invoke-interface/range {v0 .. v5}, Ll/ftn0;->p(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 200
    .line 201
    .line 202
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationSuperBoostItemView$b;->c:Lcom/p1/mobile/putong/core/newui/messages/ConversationSuperBoostItemView;

    .line 203
    .line 204
    invoke-static {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationSuperBoostItemView;->i0(Lcom/p1/mobile/putong/core/newui/messages/ConversationSuperBoostItemView;)Lcom/p1/mobile/putong/core/data/SpotLightLiveInfo;

    .line 205
    .line 206
    .line 207
    move-result-object p1

    .line 208
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationSuperBoostItemView;->v0(Lcom/p1/mobile/putong/core/newui/messages/ConversationSuperBoostItemView;Lcom/p1/mobile/putong/core/data/SpotLightLiveInfo;)V

    .line 209
    .line 210
    .line 211
    return-void

    .line 212
    :cond_3
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationSuperBoostItemView$b;->a:Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;

    .line 213
    .line 214
    iget p1, p1, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;->a:I

    .line 215
    .line 216
    const/16 v0, 0xd

    .line 217
    .line 218
    if-ne p1, v0, :cond_4

    .line 219
    .line 220
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 221
    .line 222
    .line 223
    move-result-object p1

    .line 224
    invoke-virtual {p1}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 225
    .line 226
    .line 227
    move-result-object p1

    .line 228
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationSuperBoostItemView$b;->c:Lcom/p1/mobile/putong/core/newui/messages/ConversationSuperBoostItemView;

    .line 229
    .line 230
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationSuperBoostItemView;->y0()Lcom/p1/mobile/putong/app/PutongAct;

    .line 231
    .line 232
    .line 233
    move-result-object p0

    .line 234
    const-string v0, "message"

    .line 235
    .line 236
    invoke-interface {p1, p0, v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->l1(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 237
    .line 238
    .line 239
    return-void

    .line 240
    :cond_4
    const/16 v0, 0xc

    .line 241
    .line 242
    if-ne p1, v0, :cond_5

    .line 243
    .line 244
    invoke-static {}, Ll/zsb;->f()Ll/zsb;

    .line 245
    .line 246
    .line 247
    move-result-object p1

    .line 248
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationSuperBoostItemView$b;->c:Lcom/p1/mobile/putong/core/newui/messages/ConversationSuperBoostItemView;

    .line 249
    .line 250
    iget-object v0, v0, Lcom/p1/mobile/putong/core/newui/messages/ConversationSuperBoostItemView;->n:Lcom/p1/mobile/putong/data/User;

    .line 251
    .line 252
    invoke-virtual {p1, v0}, Ll/zsb;->k(Lcom/p1/mobile/putong/data/User;)V

    .line 253
    .line 254
    .line 255
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationSuperBoostItemView$b;->c:Lcom/p1/mobile/putong/core/newui/messages/ConversationSuperBoostItemView;

    .line 256
    .line 257
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationSuperBoostItemView;->y0()Lcom/p1/mobile/putong/app/PutongAct;

    .line 258
    .line 259
    .line 260
    move-result-object p1

    .line 261
    new-instance v0, Landroid/content/Intent;

    .line 262
    .line 263
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationSuperBoostItemView$b;->c:Lcom/p1/mobile/putong/core/newui/messages/ConversationSuperBoostItemView;

    .line 264
    .line 265
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationSuperBoostItemView;->y0()Lcom/p1/mobile/putong/app/PutongAct;

    .line 266
    .line 267
    .line 268
    move-result-object p0

    .line 269
    const-class v1, Lcom/p1/mobile/putong/core/newui/messages/ConversationBoostDetailAct;

    .line 270
    .line 271
    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 272
    .line 273
    .line 274
    invoke-virtual {p1, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 275
    .line 276
    .line 277
    :cond_5
    return-void
.end method

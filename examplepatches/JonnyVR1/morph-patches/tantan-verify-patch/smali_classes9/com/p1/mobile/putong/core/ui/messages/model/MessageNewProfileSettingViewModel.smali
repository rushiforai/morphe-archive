.class public Lcom/p1/mobile/putong/core/ui/messages/model/MessageNewProfileSettingViewModel;
.super Ll/iq2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/core/ui/messages/model/MessageNewProfileSettingViewModel$Type;,
        Lcom/p1/mobile/putong/core/ui/messages/model/MessageNewProfileSettingViewModel$b;
    }
.end annotation


# instance fields
.field public c:Lcom/p1/mobile/putong/core/ui/messages/model/MessageNewProfileSettingViewModel$b;

.field public d:Lcom/p1/mobile/putong/core/ui/messages/model/view/MessageNewProfileSettingHead;

.field public e:Lcom/p1/mobile/putong/core/ui/messages/model/MessageNewProfileSettingViewModel$Type;

.field public f:Z

.field public g:Ll/w30;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/messages/MessageProfileSettingAct;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/iq2;-><init>(Lcom/p1/mobile/putong/core/ui/messages/MessageProfileSettingAct;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/model/MessageNewProfileSettingViewModel;->e:Lcom/p1/mobile/putong/core/ui/messages/model/MessageNewProfileSettingViewModel$Type;

    .line 6
    .line 7
    const/4 p1, 0x0

    .line 8
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/messages/model/MessageNewProfileSettingViewModel;->f:Z

    .line 9
    .line 10
    return-void
.end method

.method public static synthetic q(Lcom/p1/mobile/putong/core/ui/messages/model/MessageNewProfileSettingViewModel;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/ui/messages/model/MessageNewProfileSettingViewModel$Type;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/messages/model/MessageNewProfileSettingViewModel;->w(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/ui/messages/model/MessageNewProfileSettingViewModel$Type;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic s(Lcom/p1/mobile/putong/core/ui/messages/model/MessageNewProfileSettingViewModel;Lcom/p1/mobile/putong/core/ui/messages/model/MessageNewProfileSettingViewModel$Type;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/model/MessageNewProfileSettingViewModel;->x(Lcom/p1/mobile/putong/core/ui/messages/model/MessageNewProfileSettingViewModel$Type;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static bridge synthetic u(Lcom/p1/mobile/putong/core/ui/messages/model/MessageNewProfileSettingViewModel;)Lcom/p1/mobile/putong/core/ui/messages/model/view/MessageNewProfileSettingHead;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/MessageNewProfileSettingViewModel;->d:Lcom/p1/mobile/putong/core/ui/messages/model/view/MessageNewProfileSettingHead;

    return-object p0
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/iq2;->a:Lcom/p1/mobile/putong/core/ui/messages/MessageProfileSettingAct;

    .line 2
    .line 3
    return-object p0
.end method

.method public b(Ll/f400;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Ll/iq2;->b(Ll/f400;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public d(Lcom/p1/mobile/putong/data/User;I)V
    .locals 5

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 4
    .line 5
    iget-object v1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/api/g;->Xe(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/Conversation;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    new-instance v1, Ljava/util/ArrayList;

    .line 12
    .line 13
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 14
    .line 15
    .line 16
    sget-object v2, Lcom/p1/mobile/putong/core/ui/messages/model/MessageNewProfileSettingViewModel$Type;->head:Lcom/p1/mobile/putong/core/ui/messages/model/MessageNewProfileSettingViewModel$Type;

    .line 17
    .line 18
    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 19
    .line 20
    .line 21
    sget-object v2, Lcom/p1/mobile/putong/core/ui/messages/model/MessageNewProfileSettingViewModel$Type;->line:Lcom/p1/mobile/putong/core/ui/messages/model/MessageNewProfileSettingViewModel$Type;

    .line 22
    .line 23
    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 27
    .line 28
    .line 29
    move-result-object v3

    .line 30
    invoke-virtual {v3}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 31
    .line 32
    .line 33
    move-result-object v3

    .line 34
    invoke-interface {v3}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->l()Z

    .line 35
    .line 36
    .line 37
    move-result v3

    .line 38
    if-eqz v3, :cond_0

    .line 39
    .line 40
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isTeamAccount()Z

    .line 41
    .line 42
    .line 43
    move-result v3

    .line 44
    if-nez v3, :cond_0

    .line 45
    .line 46
    iget-object v3, p0, Ll/iq2;->b:Ll/f400;

    .line 47
    .line 48
    invoke-virtual {v3}, Ll/f400;->C0()Z

    .line 49
    .line 50
    .line 51
    move-result v3

    .line 52
    if-nez v3, :cond_0

    .line 53
    .line 54
    sget-object v3, Lcom/p1/mobile/putong/core/ui/messages/model/MessageNewProfileSettingViewModel$Type;->nick_name:Lcom/p1/mobile/putong/core/ui/messages/model/MessageNewProfileSettingViewModel$Type;

    .line 55
    .line 56
    invoke-interface {v1, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 57
    .line 58
    .line 59
    :cond_0
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 60
    .line 61
    .line 62
    move-result-object v3

    .line 63
    invoke-virtual {v3}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 64
    .line 65
    .line 66
    move-result-object v3

    .line 67
    invoke-interface {v3}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->W8()Z

    .line 68
    .line 69
    .line 70
    move-result v3

    .line 71
    if-eqz v3, :cond_1

    .line 72
    .line 73
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 74
    .line 75
    .line 76
    move-result v3

    .line 77
    if-eqz v3, :cond_1

    .line 78
    .line 79
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/data/Conversation;->doubleDefault()Z

    .line 80
    .line 81
    .line 82
    move-result v3

    .line 83
    if-eqz v3, :cond_1

    .line 84
    .line 85
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isTeamAccount()Z

    .line 86
    .line 87
    .line 88
    move-result v3

    .line 89
    if-nez v3, :cond_1

    .line 90
    .line 91
    sget-object v3, Lcom/p1/mobile/putong/core/ui/messages/model/MessageNewProfileSettingViewModel$Type;->chat_fire:Lcom/p1/mobile/putong/core/ui/messages/model/MessageNewProfileSettingViewModel$Type;

    .line 92
    .line 93
    invoke-interface {v1, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 94
    .line 95
    .line 96
    iget-object v3, p0, Ll/iq2;->a:Lcom/p1/mobile/putong/core/ui/messages/MessageProfileSettingAct;

    .line 97
    .line 98
    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/ui/messages/MessageProfileSettingAct;->pageId()Ljava/lang/String;

    .line 99
    .line 100
    .line 101
    move-result-object v3

    .line 102
    const-string v4, "e_spark_setting"

    .line 103
    .line 104
    invoke-static {v4, v3}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 105
    .line 106
    .line 107
    :cond_1
    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 108
    .line 109
    .line 110
    invoke-static {}, Ll/h39;->U()Z

    .line 111
    .line 112
    .line 113
    move-result v3

    .line 114
    if-eqz v3, :cond_2

    .line 115
    .line 116
    sget-object v3, Lcom/p1/mobile/putong/core/ui/messages/model/MessageNewProfileSettingViewModel$Type;->search_chat_history:Lcom/p1/mobile/putong/core/ui/messages/model/MessageNewProfileSettingViewModel$Type;

    .line 117
    .line 118
    invoke-interface {v1, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 119
    .line 120
    .line 121
    iget-object v3, p0, Ll/iq2;->a:Lcom/p1/mobile/putong/core/ui/messages/MessageProfileSettingAct;

    .line 122
    .line 123
    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/ui/messages/MessageProfileSettingAct;->pageId()Ljava/lang/String;

    .line 124
    .line 125
    .line 126
    move-result-object v3

    .line 127
    const-string v4, "e_search_chat_history"

    .line 128
    .line 129
    invoke-static {v4, v3}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 130
    .line 131
    .line 132
    :cond_2
    invoke-virtual {p0, p1, v0}, Ll/iq2;->c(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/data/Conversation;)Z

    .line 133
    .line 134
    .line 135
    move-result v3

    .line 136
    if-nez v3, :cond_3

    .line 137
    .line 138
    invoke-virtual {p0, p1}, Ll/iq2;->f(Lcom/p1/mobile/putong/data/User;)Z

    .line 139
    .line 140
    .line 141
    move-result v3

    .line 142
    if-nez v3, :cond_3

    .line 143
    .line 144
    invoke-static {v0, p1}, Ll/br5;->o(Lcom/p1/mobile/putong/core/data/Conversation;Lcom/p1/mobile/putong/data/User;)Z

    .line 145
    .line 146
    .line 147
    move-result v3

    .line 148
    if-nez v3, :cond_3

    .line 149
    .line 150
    sget-object v3, Lcom/p1/mobile/putong/core/ui/messages/model/MessageNewProfileSettingViewModel$Type;->clear_chat_history:Lcom/p1/mobile/putong/core/ui/messages/model/MessageNewProfileSettingViewModel$Type;

    .line 151
    .line 152
    invoke-interface {v1, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 153
    .line 154
    .line 155
    :cond_3
    iget-object v3, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 156
    .line 157
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 158
    .line 159
    .line 160
    move-result-object v4

    .line 161
    invoke-interface {v4}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 162
    .line 163
    .line 164
    move-result-object v4

    .line 165
    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 166
    .line 167
    .line 168
    move-result v3

    .line 169
    if-nez v3, :cond_4

    .line 170
    .line 171
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isTeamAccount()Z

    .line 172
    .line 173
    .line 174
    move-result v3

    .line 175
    if-nez v3, :cond_4

    .line 176
    .line 177
    const/4 v3, 0x1

    .line 178
    goto :goto_0

    .line 179
    :cond_4
    const/4 v3, 0x0

    .line 180
    :goto_0
    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 181
    .line 182
    .line 183
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 184
    .line 185
    .line 186
    move-result-object v4

    .line 187
    invoke-virtual {v4}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 188
    .line 189
    .line 190
    move-result-object v4

    .line 191
    invoke-interface {v4}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->l()Z

    .line 192
    .line 193
    .line 194
    move-result v4

    .line 195
    if-eqz v4, :cond_5

    .line 196
    .line 197
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isTeamAccount()Z

    .line 198
    .line 199
    .line 200
    move-result v4

    .line 201
    if-nez v4, :cond_5

    .line 202
    .line 203
    iget-object v4, p0, Ll/iq2;->b:Ll/f400;

    .line 204
    .line 205
    invoke-virtual {v4}, Ll/f400;->C0()Z

    .line 206
    .line 207
    .line 208
    move-result v4

    .line 209
    if-nez v4, :cond_5

    .line 210
    .line 211
    sget-object v4, Lcom/p1/mobile/putong/core/ui/messages/model/MessageNewProfileSettingViewModel$Type;->chat_background:Lcom/p1/mobile/putong/core/ui/messages/model/MessageNewProfileSettingViewModel$Type;

    .line 212
    .line 213
    invoke-interface {v1, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 214
    .line 215
    .line 216
    :cond_5
    sget-object v4, Lcom/p1/mobile/putong/core/CoreModule;->o:Ll/gta;

    .line 217
    .line 218
    invoke-virtual {v4}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 219
    .line 220
    .line 221
    move-result-object v4

    .line 222
    invoke-interface {v4}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->D()Z

    .line 223
    .line 224
    .line 225
    move-result v4

    .line 226
    if-eqz v4, :cond_6

    .line 227
    .line 228
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isTeamAccount()Z

    .line 229
    .line 230
    .line 231
    move-result v4

    .line 232
    if-nez v4, :cond_6

    .line 233
    .line 234
    iget-object v4, p0, Ll/iq2;->b:Ll/f400;

    .line 235
    .line 236
    invoke-virtual {v4}, Ll/f400;->C0()Z

    .line 237
    .line 238
    .line 239
    move-result v4

    .line 240
    if-nez v4, :cond_6

    .line 241
    .line 242
    sget-object v4, Lcom/p1/mobile/putong/core/ui/messages/model/MessageNewProfileSettingViewModel$Type;->set_clap:Lcom/p1/mobile/putong/core/ui/messages/model/MessageNewProfileSettingViewModel$Type;

    .line 243
    .line 244
    invoke-interface {v1, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 245
    .line 246
    .line 247
    :cond_6
    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 248
    .line 249
    .line 250
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 251
    .line 252
    .line 253
    move-result-object v2

    .line 254
    invoke-interface {v2, p1}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->isMatchedByRelationship(Lcom/p1/mobile/putong/data/User;)Z

    .line 255
    .line 256
    .line 257
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->unilateralBlock()Z

    .line 258
    .line 259
    .line 260
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 261
    .line 262
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 263
    .line 264
    .line 265
    move-result v2

    .line 266
    if-eqz v2, :cond_7

    .line 267
    .line 268
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 269
    .line 270
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 271
    .line 272
    iget-object v4, p0, Ll/iq2;->b:Ll/f400;

    .line 273
    .line 274
    invoke-virtual {v4}, Ll/f400;->x0()Ljava/lang/String;

    .line 275
    .line 276
    .line 277
    move-result-object v4

    .line 278
    invoke-virtual {v2, v4}, Lcom/p1/mobile/putong/core/api/g;->Xe(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/Conversation;

    .line 279
    .line 280
    .line 281
    :cond_7
    invoke-virtual {p0, p1, v0}, Ll/iq2;->c(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/data/Conversation;)Z

    .line 282
    .line 283
    .line 284
    move-result v2

    .line 285
    if-nez v2, :cond_8

    .line 286
    .line 287
    if-eqz v3, :cond_8

    .line 288
    .line 289
    sget-object v2, Lcom/p1/mobile/putong/core/ui/messages/model/MessageNewProfileSettingViewModel$Type;->un_match:Lcom/p1/mobile/putong/core/ui/messages/model/MessageNewProfileSettingViewModel$Type;

    .line 290
    .line 291
    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 292
    .line 293
    .line 294
    :cond_8
    if-eqz v3, :cond_9

    .line 295
    .line 296
    sget-object v2, Lcom/p1/mobile/putong/core/ui/messages/model/MessageNewProfileSettingViewModel$Type;->report:Lcom/p1/mobile/putong/core/ui/messages/model/MessageNewProfileSettingViewModel$Type;

    .line 297
    .line 298
    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 299
    .line 300
    .line 301
    :cond_9
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 302
    .line 303
    .line 304
    move-result v2

    .line 305
    if-eqz v2, :cond_a

    .line 306
    .line 307
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/data/Conversation;->isSeeUpgradedConv()Z

    .line 308
    .line 309
    .line 310
    move-result v0

    .line 311
    if-eqz v0, :cond_a

    .line 312
    .line 313
    new-instance v0, Ll/w100;

    .line 314
    .line 315
    invoke-direct {v0, p0}, Ll/w100;-><init>(Lcom/p1/mobile/putong/core/ui/messages/model/MessageNewProfileSettingViewModel;)V

    .line 316
    .line 317
    .line 318
    invoke-static {v1, v0}, Ll/jyb;->d0(Ljava/util/List;Ll/qcj;)I

    .line 319
    .line 320
    .line 321
    :cond_a
    invoke-virtual {p0, p1, v1}, Lcom/p1/mobile/putong/core/ui/messages/model/MessageNewProfileSettingViewModel;->v(Lcom/p1/mobile/putong/data/User;Ljava/util/List;)V

    .line 322
    .line 323
    .line 324
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/MessageNewProfileSettingViewModel;->c:Lcom/p1/mobile/putong/core/ui/messages/model/MessageNewProfileSettingViewModel$b;

    .line 325
    .line 326
    invoke-virtual {p0, p1, p2, v1}, Lcom/p1/mobile/putong/core/ui/messages/model/MessageNewProfileSettingViewModel$b;->H(Lcom/p1/mobile/putong/data/User;ILjava/util/List;)V

    .line 327
    .line 328
    .line 329
    return-void
.end method

.method public destroy()V
    .locals 0

    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/f400;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/model/MessageNewProfileSettingViewModel;->b(Ll/f400;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 3

    .line 1
    new-instance v0, Lv/VRecyclerView;

    .line 2
    .line 3
    invoke-virtual {p1}, Landroid/view/LayoutInflater;->getContext()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-direct {v0, p1}, Lv/VRecyclerView;-><init>(Landroid/content/Context;)V

    .line 8
    .line 9
    .line 10
    new-instance p1, Landroid/view/ViewGroup$LayoutParams;

    .line 11
    .line 12
    const/4 v1, -0x1

    .line 13
    invoke-direct {p1, v1, v1}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, p1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 17
    .line 18
    .line 19
    new-instance p1, Lcom/p1/mobile/putong/core/ui/messages/model/MessageNewProfileSettingViewModel$a;

    .line 20
    .line 21
    invoke-direct {p1, p0}, Lcom/p1/mobile/putong/core/ui/messages/model/MessageNewProfileSettingViewModel$a;-><init>(Lcom/p1/mobile/putong/core/ui/messages/model/MessageNewProfileSettingViewModel;)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {v0, p1}, Landroidx/recyclerview/widget/RecyclerView;->addItemDecoration(Landroidx/recyclerview/widget/RecyclerView$n;)V

    .line 25
    .line 26
    .line 27
    new-instance p1, Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 28
    .line 29
    iget-object v1, p0, Ll/iq2;->a:Lcom/p1/mobile/putong/core/ui/messages/MessageProfileSettingAct;

    .line 30
    .line 31
    invoke-direct {p1, v1}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>(Landroid/content/Context;)V

    .line 32
    .line 33
    .line 34
    const/4 v1, 0x1

    .line 35
    invoke-virtual {p1, v1}, Landroidx/recyclerview/widget/LinearLayoutManager;->setOrientation(I)V

    .line 36
    .line 37
    .line 38
    invoke-virtual {v0, p1}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$o;)V

    .line 39
    .line 40
    .line 41
    iget-object p1, p0, Ll/iq2;->a:Lcom/p1/mobile/putong/core/ui/messages/MessageProfileSettingAct;

    .line 42
    .line 43
    invoke-virtual {p1}, Lcom/p1/mobile/putong/app/PutongAct;->inflater()Landroid/view/LayoutInflater;

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    sget v1, Ll/qec0;->A2:I

    .line 48
    .line 49
    const/4 v2, 0x0

    .line 50
    invoke-virtual {p1, v1, p2, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 51
    .line 52
    .line 53
    move-result-object p1

    .line 54
    check-cast p1, Lcom/p1/mobile/putong/core/ui/messages/model/view/MessageNewProfileSettingHead;

    .line 55
    .line 56
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/model/MessageNewProfileSettingViewModel;->d:Lcom/p1/mobile/putong/core/ui/messages/model/view/MessageNewProfileSettingHead;

    .line 57
    .line 58
    new-instance p1, Lcom/p1/mobile/putong/core/ui/messages/model/MessageNewProfileSettingViewModel$b;

    .line 59
    .line 60
    invoke-direct {p1, p0}, Lcom/p1/mobile/putong/core/ui/messages/model/MessageNewProfileSettingViewModel$b;-><init>(Lcom/p1/mobile/putong/core/ui/messages/model/MessageNewProfileSettingViewModel;)V

    .line 61
    .line 62
    .line 63
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/model/MessageNewProfileSettingViewModel;->c:Lcom/p1/mobile/putong/core/ui/messages/model/MessageNewProfileSettingViewModel$b;

    .line 64
    .line 65
    invoke-virtual {v0, p1}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 66
    .line 67
    .line 68
    return-object v0
.end method

.method public j()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/MessageNewProfileSettingViewModel;->c:Lcom/p1/mobile/putong/core/ui/messages/model/MessageNewProfileSettingViewModel$b;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public k(Lcom/p1/mobile/putong/data/User;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/MessageNewProfileSettingViewModel;->d:Lcom/p1/mobile/putong/core/ui/messages/model/view/MessageNewProfileSettingHead;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/MessageNewProfileSettingViewModel;->d:Lcom/p1/mobile/putong/core/ui/messages/model/view/MessageNewProfileSettingHead;

    .line 10
    .line 11
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/model/view/MessageNewProfileSettingHead;->z(Lcom/p1/mobile/putong/data/User;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public l(Z)V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/MessageNewProfileSettingViewModel;->c:Lcom/p1/mobile/putong/core/ui/messages/model/MessageNewProfileSettingViewModel$b;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    goto :goto_1

    .line 6
    :cond_0
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/messages/model/MessageNewProfileSettingViewModel$b;->G()Ljava/util/List;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    if-nez v1, :cond_2

    .line 15
    .line 16
    sget-object v1, Lcom/p1/mobile/putong/core/ui/messages/model/MessageNewProfileSettingViewModel$Type;->un_match:Lcom/p1/mobile/putong/core/ui/messages/model/MessageNewProfileSettingViewModel$Type;

    .line 17
    .line 18
    if-eqz p1, :cond_1

    .line 19
    .line 20
    invoke-static {}, Ll/h39;->P()Z

    .line 21
    .line 22
    .line 23
    move-result v2

    .line 24
    if-nez v2, :cond_1

    .line 25
    .line 26
    const-string v2, "\u7184\u706d\u4fe1\u53f7"

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_1
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 30
    .line 31
    .line 32
    move-result-object v2

    .line 33
    sget v3, Lcom/p1/mobile/putong/core/message/R$string;->w5:I

    .line 34
    .line 35
    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object v2

    .line 39
    :goto_0
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/core/ui/messages/model/MessageNewProfileSettingViewModel$Type;->setDes(Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    if-eqz p1, :cond_2

    .line 43
    .line 44
    sget-object p1, Lcom/p1/mobile/putong/core/ui/messages/model/MessageNewProfileSettingViewModel$Type;->clear_chat_history:Lcom/p1/mobile/putong/core/ui/messages/model/MessageNewProfileSettingViewModel$Type;

    .line 45
    .line 46
    invoke-interface {v0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 47
    .line 48
    .line 49
    sget-object p1, Lcom/p1/mobile/putong/core/ui/messages/model/MessageNewProfileSettingViewModel$Type;->set_clap:Lcom/p1/mobile/putong/core/ui/messages/model/MessageNewProfileSettingViewModel$Type;

    .line 50
    .line 51
    invoke-interface {v0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 52
    .line 53
    .line 54
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/MessageNewProfileSettingViewModel;->c:Lcom/p1/mobile/putong/core/ui/messages/model/MessageNewProfileSettingViewModel$b;

    .line 55
    .line 56
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 57
    .line 58
    .line 59
    :cond_2
    :goto_1
    return-void
.end method

.method public p(Z)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/MessageNewProfileSettingViewModel;->c:Lcom/p1/mobile/putong/core/ui/messages/model/MessageNewProfileSettingViewModel$b;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    goto :goto_1

    .line 6
    :cond_0
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/messages/model/MessageNewProfileSettingViewModel$b;->G()Ljava/util/List;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    if-nez v1, :cond_2

    .line 15
    .line 16
    sget-object v1, Lcom/p1/mobile/putong/core/ui/messages/model/MessageNewProfileSettingViewModel$Type;->add_black_list:Lcom/p1/mobile/putong/core/ui/messages/model/MessageNewProfileSettingViewModel$Type;

    .line 17
    .line 18
    invoke-interface {v0, v1}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-ltz v0, :cond_2

    .line 23
    .line 24
    if-eqz p1, :cond_1

    .line 25
    .line 26
    sget-object p1, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 27
    .line 28
    sget v2, Lcom/p1/mobile/putong/core/message/R$string;->k2:I

    .line 29
    .line 30
    invoke-virtual {p1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    goto :goto_0

    .line 35
    :cond_1
    sget-object p1, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 36
    .line 37
    sget v2, Lcom/p1/mobile/putong/core/message/R$string;->H2:I

    .line 38
    .line 39
    invoke-virtual {p1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    :goto_0
    invoke-virtual {v1, p1}, Lcom/p1/mobile/putong/core/ui/messages/model/MessageNewProfileSettingViewModel$Type;->setDes(Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/MessageNewProfileSettingViewModel;->c:Lcom/p1/mobile/putong/core/ui/messages/model/MessageNewProfileSettingViewModel$b;

    .line 47
    .line 48
    invoke-virtual {p0, v0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyItemChanged(I)V

    .line 49
    .line 50
    .line 51
    :cond_2
    :goto_1
    return-void
.end method

.method public final v(Lcom/p1/mobile/putong/data/User;Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/data/User;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/ui/messages/model/MessageNewProfileSettingViewModel$Type;",
            ">;)V"
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/MessageNewProfileSettingViewModel;->f:Z

    .line 3
    .line 4
    new-instance v0, Ll/x100;

    .line 5
    .line 6
    invoke-direct {v0, p0, p1}, Ll/x100;-><init>(Lcom/p1/mobile/putong/core/ui/messages/model/MessageNewProfileSettingViewModel;Lcom/p1/mobile/putong/data/User;)V

    .line 7
    .line 8
    .line 9
    invoke-static {p2, v0}, Ll/jyb;->d0(Ljava/util/List;Ll/qcj;)I

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final synthetic w(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/ui/messages/model/MessageNewProfileSettingViewModel$Type;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/MessageNewProfileSettingViewModel;->f:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isTeamAccount()Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    sget-object p1, Lcom/p1/mobile/putong/core/ui/messages/model/MessageNewProfileSettingViewModel$Type;->line:Lcom/p1/mobile/putong/core/ui/messages/model/MessageNewProfileSettingViewModel$Type;

    .line 12
    .line 13
    if-ne p2, p1, :cond_0

    .line 14
    .line 15
    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 16
    .line 17
    return-object p0

    .line 18
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/model/MessageNewProfileSettingViewModel;->e:Lcom/p1/mobile/putong/core/ui/messages/model/MessageNewProfileSettingViewModel$Type;

    .line 19
    .line 20
    sget-object v0, Lcom/p1/mobile/putong/core/ui/messages/model/MessageNewProfileSettingViewModel$Type;->line:Lcom/p1/mobile/putong/core/ui/messages/model/MessageNewProfileSettingViewModel$Type;

    .line 21
    .line 22
    if-ne p1, v0, :cond_1

    .line 23
    .line 24
    if-ne p2, v0, :cond_1

    .line 25
    .line 26
    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 27
    .line 28
    return-object p0

    .line 29
    :cond_1
    if-ne p2, v0, :cond_2

    .line 30
    .line 31
    const/4 p1, 0x1

    .line 32
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/messages/model/MessageNewProfileSettingViewModel;->f:Z

    .line 33
    .line 34
    :cond_2
    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/model/MessageNewProfileSettingViewModel;->e:Lcom/p1/mobile/putong/core/ui/messages/model/MessageNewProfileSettingViewModel$Type;

    .line 35
    .line 36
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 37
    .line 38
    return-object p0
.end method

.method public final synthetic x(Lcom/p1/mobile/putong/core/ui/messages/model/MessageNewProfileSettingViewModel$Type;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/ui/messages/model/MessageNewProfileSettingViewModel$Type;->head:Lcom/p1/mobile/putong/core/ui/messages/model/MessageNewProfileSettingViewModel$Type;

    .line 2
    .line 3
    if-eq p1, v0, :cond_0

    .line 4
    .line 5
    sget-object v0, Lcom/p1/mobile/putong/core/ui/messages/model/MessageNewProfileSettingViewModel$Type;->line:Lcom/p1/mobile/putong/core/ui/messages/model/MessageNewProfileSettingViewModel$Type;

    .line 6
    .line 7
    if-eq p1, v0, :cond_0

    .line 8
    .line 9
    sget-object v0, Lcom/p1/mobile/putong/core/ui/messages/model/MessageNewProfileSettingViewModel$Type;->nick_name:Lcom/p1/mobile/putong/core/ui/messages/model/MessageNewProfileSettingViewModel$Type;

    .line 10
    .line 11
    if-eq p1, v0, :cond_0

    .line 12
    .line 13
    sget-object v0, Lcom/p1/mobile/putong/core/ui/messages/model/MessageNewProfileSettingViewModel$Type;->chat_background:Lcom/p1/mobile/putong/core/ui/messages/model/MessageNewProfileSettingViewModel$Type;

    .line 14
    .line 15
    if-eq p1, v0, :cond_0

    .line 16
    .line 17
    sget-object v0, Lcom/p1/mobile/putong/core/ui/messages/model/MessageNewProfileSettingViewModel$Type;->mini_widget_clap:Lcom/p1/mobile/putong/core/ui/messages/model/MessageNewProfileSettingViewModel$Type;

    .line 18
    .line 19
    if-eq p1, v0, :cond_0

    .line 20
    .line 21
    sget-object v0, Lcom/p1/mobile/putong/core/ui/messages/model/MessageNewProfileSettingViewModel$Type;->report:Lcom/p1/mobile/putong/core/ui/messages/model/MessageNewProfileSettingViewModel$Type;

    .line 22
    .line 23
    if-eq p1, v0, :cond_0

    .line 24
    .line 25
    const/4 v0, 0x1

    .line 26
    goto :goto_0

    .line 27
    :cond_0
    const/4 v0, 0x0

    .line 28
    :goto_0
    if-nez v0, :cond_1

    .line 29
    .line 30
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/model/MessageNewProfileSettingViewModel;->e:Lcom/p1/mobile/putong/core/ui/messages/model/MessageNewProfileSettingViewModel$Type;

    .line 31
    .line 32
    :cond_1
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    return-object p0
.end method

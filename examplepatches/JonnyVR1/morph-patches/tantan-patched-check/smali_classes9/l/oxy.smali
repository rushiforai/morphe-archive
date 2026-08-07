.class public Ll/oxy;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/rdz;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/rdz<",
        "Lcom/p1/mobile/putong/data/User;",
        "Ll/yxz;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Landroid/widget/FrameLayout;

.field public b:Lv/VProgressBar;

.field public c:Landroid/widget/FrameLayout;

.field public d:Landroid/widget/LinearLayout;

.field public e:Landroid/widget/LinearLayout;

.field public f:Landroid/widget/LinearLayout;

.field public g:Landroid/widget/LinearLayout;

.field public h:Lv/VText;

.field public i:Lv/VText;

.field public j:Landroid/widget/LinearLayout;

.field public k:Lv/VDraweeView;

.field public l:Landroid/widget/LinearLayout;

.field public m:Landroid/widget/FrameLayout;

.field public n:Lv/VDraweeView;

.field public o:Lv/VText;

.field public p:Lv/VText;

.field public q:Landroid/view/View;

.field public r:Ll/clz;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/clz<",
            "Lcom/p1/mobile/putong/data/User;",
            "Ll/yxz;",
            ">;"
        }
    .end annotation
.end field

.field public s:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

.field public t:Ll/iwl;

.field public u:Lcom/p1/mobile/putong/data/User;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic l(Ll/oxy;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/oxy;->s(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic m(Ll/oxy;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/oxy;->r(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic n(Ll/oxy;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/oxy;->q(Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public b(Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;Ll/iwl;Ll/clz;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;",
            "Ll/iwl;",
            "Ll/clz<",
            "Lcom/p1/mobile/putong/data/User;",
            "Ll/yxz;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p3, p0, Ll/oxy;->r:Ll/clz;

    .line 2
    .line 3
    iput-object p1, p0, Ll/oxy;->s:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 4
    .line 5
    iput-object p2, p0, Ll/oxy;->t:Ll/iwl;

    .line 6
    .line 7
    invoke-static {p1}, Ll/p9r;->a(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    invoke-interface {p2}, Ll/iwl;->getRealView()Landroid/view/ViewGroup;

    .line 12
    .line 13
    .line 14
    move-result-object p2

    .line 15
    invoke-virtual {p0, p1, p2}, Ll/oxy;->o(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    iput-object p1, p0, Ll/oxy;->q:Landroid/view/View;

    .line 20
    .line 21
    iget-object p1, p0, Ll/oxy;->l:Landroid/widget/LinearLayout;

    .line 22
    .line 23
    new-instance p2, Ll/lxy;

    .line 24
    .line 25
    invoke-direct {p2, p0}, Ll/lxy;-><init>(Ll/oxy;)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {p1, p2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 29
    .line 30
    .line 31
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    invoke-virtual {p1}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    invoke-interface {p1}, Ll/r97;->D()Z

    .line 40
    .line 41
    .line 42
    move-result p1

    .line 43
    if-eqz p1, :cond_0

    .line 44
    .line 45
    invoke-virtual {p3}, Ll/clz;->r3()Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    invoke-static {p1}, Lcom/p1/mobile/putong/data/User;->isTeamAccount(Ljava/lang/String;)Z

    .line 50
    .line 51
    .line 52
    move-result p1

    .line 53
    if-nez p1, :cond_0

    .line 54
    .line 55
    iget-object p1, p0, Ll/oxy;->k:Lv/VDraweeView;

    .line 56
    .line 57
    new-instance p2, Ll/oxy$a;

    .line 58
    .line 59
    invoke-direct {p2, p0, p3}, Ll/oxy$a;-><init>(Ll/oxy;Ll/clz;)V

    .line 60
    .line 61
    .line 62
    new-instance p3, Ll/mxy;

    .line 63
    .line 64
    invoke-direct {p3, p0}, Ll/mxy;-><init>(Ll/oxy;)V

    .line 65
    .line 66
    .line 67
    invoke-static {p1, p2, p3}, Lcom/p1/mobile/putong/core/ui/messages/b;->r(Landroid/view/View;Lcom/p1/mobile/putong/core/ui/messages/b$c;Landroid/view/View$OnClickListener;)V

    .line 68
    .line 69
    .line 70
    :cond_0
    iget-object p1, p0, Ll/oxy;->k:Lv/VDraweeView;

    .line 71
    .line 72
    new-instance p2, Ll/nxy;

    .line 73
    .line 74
    invoke-direct {p2, p0}, Ll/nxy;-><init>(Ll/oxy;)V

    .line 75
    .line 76
    .line 77
    invoke-static {p1, p2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 78
    .line 79
    .line 80
    return-void
.end method

.method public e()V
    .locals 0

    .line 1
    return-void
.end method

.method public g()Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/oxy;->q:Landroid/view/View;

    .line 2
    .line 3
    return-object p0
.end method

.method public h(Ll/vg60;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/vg60<",
            "Lcom/p1/mobile/putong/core/data/Message;",
            ">;)V"
        }
    .end annotation

    .line 1
    return-void
.end method

.method public j()V
    .locals 0

    .line 1
    return-void
.end method

.method public k()V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/oxy;->r:Ll/clz;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/clz;->q3()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lcom/p1/mobile/putong/data/User;

    .line 8
    .line 9
    iput-object v0, p0, Ll/oxy;->u:Lcom/p1/mobile/putong/data/User;

    .line 10
    .line 11
    iget-object v0, p0, Ll/oxy;->g:Landroid/widget/LinearLayout;

    .line 12
    .line 13
    const/4 v1, 0x0

    .line 14
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Ll/oxy;->h:Lv/VText;

    .line 18
    .line 19
    const/4 v2, 0x2

    .line 20
    invoke-static {v2}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 21
    .line 22
    .line 23
    move-result-object v2

    .line 24
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 25
    .line 26
    .line 27
    iget-object v0, p0, Ll/oxy;->h:Lv/VText;

    .line 28
    .line 29
    const-string v2, "#999999"

    .line 30
    .line 31
    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 32
    .line 33
    .line 34
    move-result v3

    .line 35
    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setTextColor(I)V

    .line 36
    .line 37
    .line 38
    iget-object v0, p0, Ll/oxy;->i:Lv/VText;

    .line 39
    .line 40
    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 41
    .line 42
    .line 43
    move-result v2

    .line 44
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 45
    .line 46
    .line 47
    iget-object v0, p0, Ll/oxy;->g:Landroid/widget/LinearLayout;

    .line 48
    .line 49
    iget-object v2, p0, Ll/oxy;->s:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 50
    .line 51
    sget v3, Ll/ibc0;->Q4:I

    .line 52
    .line 53
    invoke-virtual {v2, v3}, Landroid/content/Context;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 54
    .line 55
    .line 56
    move-result-object v2

    .line 57
    invoke-virtual {v0, v2}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 58
    .line 59
    .line 60
    iget-object v0, p0, Ll/oxy;->r:Ll/clz;

    .line 61
    .line 62
    invoke-virtual {v0}, Ll/j3z;->e0()Ll/mzl;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    invoke-interface {v0}, Ll/mzl;->l()Ll/clz;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    invoke-virtual {v0}, Ll/clz;->t7()Ll/qzz;

    .line 71
    .line 72
    .line 73
    move-result-object v0

    .line 74
    check-cast v0, Ll/yxz;

    .line 75
    .line 76
    iget-boolean v0, v0, Ll/yxz;->M1:Z

    .line 77
    .line 78
    if-eqz v0, :cond_0

    .line 79
    .line 80
    iget-object v0, p0, Ll/oxy;->g:Landroid/widget/LinearLayout;

    .line 81
    .line 82
    iget-object v2, p0, Ll/oxy;->s:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 83
    .line 84
    sget v3, Ll/ibc0;->R4:I

    .line 85
    .line 86
    invoke-virtual {v2, v3}, Landroid/content/Context;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 87
    .line 88
    .line 89
    move-result-object v2

    .line 90
    invoke-virtual {v0, v2}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 91
    .line 92
    .line 93
    iget-object v0, p0, Ll/oxy;->h:Lv/VText;

    .line 94
    .line 95
    const-string v2, "#222222"

    .line 96
    .line 97
    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 98
    .line 99
    .line 100
    move-result v3

    .line 101
    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setTextColor(I)V

    .line 102
    .line 103
    .line 104
    iget-object v0, p0, Ll/oxy;->i:Lv/VText;

    .line 105
    .line 106
    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 107
    .line 108
    .line 109
    move-result v2

    .line 110
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 111
    .line 112
    .line 113
    :cond_0
    iget-object v0, p0, Ll/oxy;->o:Lv/VText;

    .line 114
    .line 115
    invoke-virtual {v0}, Landroid/widget/TextView;->getTypeface()Landroid/graphics/Typeface;

    .line 116
    .line 117
    .line 118
    move-result-object v2

    .line 119
    const/4 v3, 0x1

    .line 120
    invoke-virtual {v0, v2, v3}, Landroidx/appcompat/widget/AppCompatTextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 121
    .line 122
    .line 123
    iget-object v0, p0, Ll/oxy;->u:Lcom/p1/mobile/putong/data/User;

    .line 124
    .line 125
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 126
    .line 127
    .line 128
    move-result v0

    .line 129
    if-eqz v0, :cond_1

    .line 130
    .line 131
    iget-object v0, p0, Ll/oxy;->u:Lcom/p1/mobile/putong/data/User;

    .line 132
    .line 133
    iget-boolean v2, v0, Lcom/p1/mobile/putong/data/User;->inactivated:Z

    .line 134
    .line 135
    if-nez v2, :cond_1

    .line 136
    .line 137
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->status:Ljava/util/List;

    .line 138
    .line 139
    const-string v2, "RISK_TAG_CHAT_PROFILE_PICTURE_HIDDEN"

    .line 140
    .line 141
    invoke-static {v2}, Lcom/p1/mobile/putong/data/UserStatus;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/UserStatus;

    .line 142
    .line 143
    .line 144
    move-result-object v2

    .line 145
    invoke-interface {v0, v2}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 146
    .line 147
    .line 148
    move-result v0

    .line 149
    if-eqz v0, :cond_2

    .line 150
    .line 151
    :cond_1
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 152
    .line 153
    iget-object v2, p0, Ll/oxy;->n:Lv/VDraweeView;

    .line 154
    .line 155
    sget v3, Ll/ibc0;->k1:I

    .line 156
    .line 157
    invoke-virtual {v0, v2, v3}, Ll/fsb0;->Y0(Lcom/facebook/drawee/view/SimpleDraweeView;I)V

    .line 158
    .line 159
    .line 160
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 161
    .line 162
    iget-object v2, p0, Ll/oxy;->k:Lv/VDraweeView;

    .line 163
    .line 164
    sget v3, Ll/ibc0;->k1:I

    .line 165
    .line 166
    invoke-virtual {v0, v2, v3}, Ll/fsb0;->Y0(Lcom/facebook/drawee/view/SimpleDraweeView;I)V

    .line 167
    .line 168
    .line 169
    iget-object v0, p0, Ll/oxy;->u:Lcom/p1/mobile/putong/data/User;

    .line 170
    .line 171
    invoke-virtual {p0, v0}, Ll/oxy;->t(Lcom/p1/mobile/putong/data/User;)V

    .line 172
    .line 173
    .line 174
    iget-object v0, p0, Ll/oxy;->r:Ll/clz;

    .line 175
    .line 176
    invoke-virtual {v0}, Ll/j3z;->e0()Ll/mzl;

    .line 177
    .line 178
    .line 179
    move-result-object v0

    .line 180
    invoke-interface {v0}, Ll/mzl;->F()Ll/ruy;

    .line 181
    .line 182
    .line 183
    move-result-object v0

    .line 184
    iget-object v2, p0, Ll/oxy;->u:Lcom/p1/mobile/putong/data/User;

    .line 185
    .line 186
    invoke-virtual {v0, v2}, Ll/ruy;->x0(Lcom/p1/mobile/putong/data/User;)V

    .line 187
    .line 188
    .line 189
    :cond_2
    iget-object v0, p0, Ll/oxy;->r:Ll/clz;

    .line 190
    .line 191
    invoke-virtual {v0}, Ll/clz;->j3()Lcom/p1/mobile/putong/core/data/Conversation;

    .line 192
    .line 193
    .line 194
    move-result-object v0

    .line 195
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 196
    .line 197
    .line 198
    move-result v2

    .line 199
    iget-object v3, p0, Ll/oxy;->h:Lv/VText;

    .line 200
    .line 201
    if-eqz v2, :cond_3

    .line 202
    .line 203
    iget-wide v4, v0, Lcom/p1/mobile/putong/core/data/Conversation;->createdTime:D

    .line 204
    .line 205
    invoke-static {v4, v5}, Ll/pzi0;->G(D)Ljava/lang/String;

    .line 206
    .line 207
    .line 208
    move-result-object v2

    .line 209
    invoke-virtual {v3, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 210
    .line 211
    .line 212
    goto :goto_0

    .line 213
    :cond_3
    sget-object v2, Ll/uqb0;->H:Lcom/p1/mobile/putong/api/api/Network;

    .line 214
    .line 215
    invoke-virtual {v2}, Lcom/p1/mobile/putong/api/api/Network;->guessedCurrentServerTime()J

    .line 216
    .line 217
    .line 218
    move-result-wide v4

    .line 219
    long-to-double v4, v4

    .line 220
    invoke-static {v4, v5}, Ll/pzi0;->G(D)Ljava/lang/String;

    .line 221
    .line 222
    .line 223
    move-result-object v2

    .line 224
    invoke-virtual {v3, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 225
    .line 226
    .line 227
    :goto_0
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 228
    .line 229
    .line 230
    move-result v2

    .line 231
    if-eqz v2, :cond_5

    .line 232
    .line 233
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 234
    .line 235
    .line 236
    move-result-object v2

    .line 237
    invoke-virtual {v2}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 238
    .line 239
    .line 240
    move-result-object v2

    .line 241
    invoke-interface {v2}, Ll/r97;->x()Z

    .line 242
    .line 243
    .line 244
    move-result v2

    .line 245
    if-eqz v2, :cond_5

    .line 246
    .line 247
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/Conversation;->status:Lcom/p1/mobile/putong/data/ConversationStatus;

    .line 248
    .line 249
    const-string v2, "dismissed"

    .line 250
    .line 251
    invoke-static {v0, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 252
    .line 253
    .line 254
    move-result v0

    .line 255
    if-eqz v0, :cond_5

    .line 256
    .line 257
    iget-object v0, p0, Ll/oxy;->u:Lcom/p1/mobile/putong/data/User;

    .line 258
    .line 259
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 260
    .line 261
    .line 262
    move-result v0

    .line 263
    if-eqz v0, :cond_5

    .line 264
    .line 265
    iget-object v0, p0, Ll/oxy;->p:Lv/VText;

    .line 266
    .line 267
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 268
    .line 269
    .line 270
    iget-object v0, p0, Ll/oxy;->p:Lv/VText;

    .line 271
    .line 272
    iget-object p0, p0, Ll/oxy;->u:Lcom/p1/mobile/putong/data/User;

    .line 273
    .line 274
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 275
    .line 276
    .line 277
    move-result p0

    .line 278
    if-eqz p0, :cond_4

    .line 279
    .line 280
    sget p0, Lcom/p1/mobile/putong/core/message/R$string;->t2:I

    .line 281
    .line 282
    goto :goto_1

    .line 283
    :cond_4
    sget p0, Lcom/p1/mobile/putong/core/message/R$string;->s2:I

    .line 284
    .line 285
    :goto_1
    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setText(I)V

    .line 286
    .line 287
    .line 288
    :cond_5
    return-void
.end method

.method public o(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/pxy;->b(Ll/oxy;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final p()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/oxy;->u:Lcom/p1/mobile/putong/data/User;

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
    iget-object p0, p0, Ll/oxy;->u:Lcom/p1/mobile/putong/data/User;

    .line 10
    .line 11
    iget-boolean v0, p0, Lcom/p1/mobile/putong/data/User;->inactivated:Z

    .line 12
    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->status:Ljava/util/List;

    .line 17
    .line 18
    const-string v0, "RISK_TAG_CHAT_PROFILE_PICTURE_HIDDEN"

    .line 19
    .line 20
    invoke-static {v0}, Lcom/p1/mobile/putong/data/UserStatus;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/UserStatus;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-interface {p0, v0}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 25
    .line 26
    .line 27
    move-result p0

    .line 28
    if-eqz p0, :cond_1

    .line 29
    .line 30
    const-string p0, "\u5bf9\u65b9\u8d26\u53f7\u5f02\u5e38"

    .line 31
    .line 32
    invoke-static {p0}, Ll/o1j0;->j(Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    :cond_1
    return-void

    .line 36
    :cond_2
    :goto_0
    const-string p0, "\u5bf9\u65b9\u5df2\u6ce8\u9500"

    .line 37
    .line 38
    invoke-static {p0}, Ll/o1j0;->j(Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method public final synthetic q(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/oxy;->p()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic r(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/oxy;->p()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic s(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/oxy;->p()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final t(Lcom/p1/mobile/putong/data/User;)V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    iget-object v1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Ll/dkb;->y7(Ljava/lang/String;)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    if-nez v1, :cond_0

    .line 16
    .line 17
    iget-object p0, p0, Ll/oxy;->o:Lv/VText;

    .line 18
    .line 19
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 20
    .line 21
    .line 22
    return-void

    .line 23
    :cond_0
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-eqz v0, :cond_3

    .line 28
    .line 29
    iget-boolean v0, p1, Lcom/p1/mobile/putong/data/User;->inactivated:Z

    .line 30
    .line 31
    if-eqz v0, :cond_1

    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_1
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->status:Ljava/util/List;

    .line 35
    .line 36
    const-string v0, "RISK_TAG_CHAT_PROFILE_PICTURE_HIDDEN"

    .line 37
    .line 38
    invoke-static {v0}, Lcom/p1/mobile/putong/data/UserStatus;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/UserStatus;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    invoke-interface {p1, v0}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 43
    .line 44
    .line 45
    move-result p1

    .line 46
    if-eqz p1, :cond_2

    .line 47
    .line 48
    iget-object p0, p0, Ll/oxy;->o:Lv/VText;

    .line 49
    .line 50
    const-string p1, "\u6635\u79f0\u5df2\u91cd\u7f6e"

    .line 51
    .line 52
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 53
    .line 54
    .line 55
    :cond_2
    return-void

    .line 56
    :cond_3
    :goto_0
    iget-object p0, p0, Ll/oxy;->o:Lv/VText;

    .line 57
    .line 58
    const-string p1, "\u5df2\u6ce8\u9500"

    .line 59
    .line 60
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 61
    .line 62
    .line 63
    return-void
.end method

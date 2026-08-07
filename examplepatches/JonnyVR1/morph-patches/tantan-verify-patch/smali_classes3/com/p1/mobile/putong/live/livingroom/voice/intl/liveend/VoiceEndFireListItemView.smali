.class public Lcom/p1/mobile/putong/live/livingroom/voice/intl/liveend/VoiceEndFireListItemView;
.super Landroid/widget/RelativeLayout;
.source "SourceFile"


# instance fields
.field public a:Lv/VDraweeView;

.field public b:Landroid/widget/TextView;

.field public c:Landroid/widget/TextView;

.field public d:Landroid/widget/TextView;

.field public e:Ll/ayn0;

.field public f:Ll/nsv;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/nsv<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;"
        }
    .end annotation
.end field

.field public g:Ll/th0;

.field public h:Z

.field public i:Ljava/lang/String;

.field public j:Landroid/graphics/drawable/Drawable;

.field public k:Ljava/lang/String;


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

.method public static synthetic a(Lcom/p1/mobile/putong/data/User;)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/Picture$ImageUri;->formatted()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/live/livingroom/voice/intl/liveend/VoiceEndFireListItemView;Ljava/lang/String;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/liveend/VoiceEndFireListItemView;->k(Ljava/lang/String;Ljava/lang/Boolean;)V

    return-void
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/live/livingroom/voice/intl/liveend/VoiceEndFireListItemView;Ljava/lang/String;Ljava/lang/String;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/liveend/VoiceEndFireListItemView;->j(Ljava/lang/String;Ljava/lang/String;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic d(Ll/ayn0;Ll/nsv;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ayn0;->I0(Ll/nsv;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic e(Ll/ayn0;Ll/nsv;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ayn0;->I0(Ll/nsv;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic f(Lcom/p1/mobile/putong/live/livingroom/voice/intl/liveend/VoiceEndFireListItemView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/liveend/VoiceEndFireListItemView;->m(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic g(Lcom/p1/mobile/putong/live/livingroom/voice/intl/liveend/VoiceEndFireListItemView;Ljava/lang/String;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/liveend/VoiceEndFireListItemView;->l(Ljava/lang/String;Landroid/view/View;)V

    return-void
.end method

.method private setFollowAction(Ljava/lang/String;)V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/liveend/VoiceEndFireListItemView;->e:Ll/ayn0;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/liveend/VoiceEndFireListItemView;->f:Ll/nsv;

    .line 4
    .line 5
    iget-boolean v2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/liveend/VoiceEndFireListItemView;->h:Z

    .line 6
    .line 7
    new-instance v3, Ll/kdn0;

    .line 8
    .line 9
    invoke-direct {v3, p0, p1}, Ll/kdn0;-><init>(Lcom/p1/mobile/putong/live/livingroom/voice/intl/liveend/VoiceEndFireListItemView;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    const-string p0, ""

    .line 13
    .line 14
    invoke-virtual {v0, v1, p0, v2, v3}, Ll/ayn0;->L0(Ll/nsv;Ljava/lang/String;ZLl/y20;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method private setListBtnStyleParam(Ljava/lang/String;)V
    .locals 6

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Ljava/lang/String;->hashCode()I

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    const-string v1, "followMatched"

    .line 9
    .line 10
    const-string v2, "following"

    .line 11
    .line 12
    const-string v3, "followed"

    .line 13
    .line 14
    const-string v4, "unfollow"

    .line 15
    .line 16
    const/4 v5, -0x1

    .line 17
    sparse-switch v0, :sswitch_data_0

    .line 18
    .line 19
    .line 20
    goto :goto_0

    .line 21
    :sswitch_0
    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 22
    .line 23
    .line 24
    move-result p1

    .line 25
    if-nez p1, :cond_0

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_0
    const/4 v5, 0x3

    .line 29
    goto :goto_0

    .line 30
    :sswitch_1
    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 31
    .line 32
    .line 33
    move-result p1

    .line 34
    if-nez p1, :cond_1

    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_1
    const/4 v5, 0x2

    .line 38
    goto :goto_0

    .line 39
    :sswitch_2
    invoke-virtual {p1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 40
    .line 41
    .line 42
    move-result p1

    .line 43
    if-nez p1, :cond_2

    .line 44
    .line 45
    goto :goto_0

    .line 46
    :cond_2
    const/4 v5, 0x1

    .line 47
    goto :goto_0

    .line 48
    :sswitch_3
    invoke-virtual {p1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 49
    .line 50
    .line 51
    move-result p1

    .line 52
    if-nez p1, :cond_3

    .line 53
    .line 54
    goto :goto_0

    .line 55
    :cond_3
    const/4 v5, 0x0

    .line 56
    :goto_0
    const-string p1, "\u559c\u6b22"

    .line 57
    .line 58
    packed-switch v5, :pswitch_data_0

    .line 59
    .line 60
    .line 61
    const-string p1, ""

    .line 62
    .line 63
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/liveend/VoiceEndFireListItemView;->i:Ljava/lang/String;

    .line 64
    .line 65
    const/4 v0, 0x0

    .line 66
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/liveend/VoiceEndFireListItemView;->j:Landroid/graphics/drawable/Drawable;

    .line 67
    .line 68
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/liveend/VoiceEndFireListItemView;->k:Ljava/lang/String;

    .line 69
    .line 70
    goto/16 :goto_1

    .line 71
    .line 72
    :pswitch_0
    iput-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/liveend/VoiceEndFireListItemView;->k:Ljava/lang/String;

    .line 73
    .line 74
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 75
    .line 76
    .line 77
    move-result-object p1

    .line 78
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->Xh:I

    .line 79
    .line 80
    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 81
    .line 82
    .line 83
    move-result-object p1

    .line 84
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/liveend/VoiceEndFireListItemView;->i:Ljava/lang/String;

    .line 85
    .line 86
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/liveend/VoiceEndFireListItemView;->e:Ll/ayn0;

    .line 87
    .line 88
    if-eqz p1, :cond_4

    .line 89
    .line 90
    invoke-virtual {p1}, Ll/ayn0;->z0()Z

    .line 91
    .line 92
    .line 93
    move-result p1

    .line 94
    if-eqz p1, :cond_4

    .line 95
    .line 96
    const-string p1, "\u76f8\u4e92\u559c\u6b22"

    .line 97
    .line 98
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/liveend/VoiceEndFireListItemView;->i:Ljava/lang/String;

    .line 99
    .line 100
    :cond_4
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 101
    .line 102
    .line 103
    move-result-object p1

    .line 104
    sget v0, Ll/obc0;->V0:I

    .line 105
    .line 106
    invoke-virtual {p1, v0}, Landroid/content/Context;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 107
    .line 108
    .line 109
    move-result-object p1

    .line 110
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/liveend/VoiceEndFireListItemView;->j:Landroid/graphics/drawable/Drawable;

    .line 111
    .line 112
    goto/16 :goto_1

    .line 113
    .line 114
    :pswitch_1
    iput-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/liveend/VoiceEndFireListItemView;->k:Ljava/lang/String;

    .line 115
    .line 116
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 117
    .line 118
    .line 119
    move-result-object p1

    .line 120
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->o:I

    .line 121
    .line 122
    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 123
    .line 124
    .line 125
    move-result-object p1

    .line 126
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/liveend/VoiceEndFireListItemView;->i:Ljava/lang/String;

    .line 127
    .line 128
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/liveend/VoiceEndFireListItemView;->e:Ll/ayn0;

    .line 129
    .line 130
    if-eqz p1, :cond_5

    .line 131
    .line 132
    invoke-virtual {p1}, Ll/ayn0;->z0()Z

    .line 133
    .line 134
    .line 135
    move-result p1

    .line 136
    if-eqz p1, :cond_5

    .line 137
    .line 138
    const-string p1, "\u5df2\u559c\u6b22"

    .line 139
    .line 140
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/liveend/VoiceEndFireListItemView;->i:Ljava/lang/String;

    .line 141
    .line 142
    :cond_5
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 143
    .line 144
    .line 145
    move-result-object p1

    .line 146
    sget v0, Ll/obc0;->V0:I

    .line 147
    .line 148
    invoke-virtual {p1, v0}, Landroid/content/Context;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 149
    .line 150
    .line 151
    move-result-object p1

    .line 152
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/liveend/VoiceEndFireListItemView;->j:Landroid/graphics/drawable/Drawable;

    .line 153
    .line 154
    goto :goto_1

    .line 155
    :pswitch_2
    iput-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/liveend/VoiceEndFireListItemView;->k:Ljava/lang/String;

    .line 156
    .line 157
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 158
    .line 159
    .line 160
    move-result-object v0

    .line 161
    sget v1, Lcom/p1/mobile/putong/live/livingroom/R$string;->Bg:I

    .line 162
    .line 163
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 164
    .line 165
    .line 166
    move-result-object v0

    .line 167
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/liveend/VoiceEndFireListItemView;->i:Ljava/lang/String;

    .line 168
    .line 169
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/liveend/VoiceEndFireListItemView;->e:Ll/ayn0;

    .line 170
    .line 171
    if-eqz v0, :cond_6

    .line 172
    .line 173
    invoke-virtual {v0}, Ll/ayn0;->z0()Z

    .line 174
    .line 175
    .line 176
    move-result v0

    .line 177
    if-eqz v0, :cond_6

    .line 178
    .line 179
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/liveend/VoiceEndFireListItemView;->i:Ljava/lang/String;

    .line 180
    .line 181
    :cond_6
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 182
    .line 183
    .line 184
    move-result-object p1

    .line 185
    sget v0, Ll/obc0;->p0:I

    .line 186
    .line 187
    invoke-virtual {p1, v0}, Landroid/content/Context;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 188
    .line 189
    .line 190
    move-result-object p1

    .line 191
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/liveend/VoiceEndFireListItemView;->j:Landroid/graphics/drawable/Drawable;

    .line 192
    .line 193
    goto :goto_1

    .line 194
    :pswitch_3
    iput-object v4, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/liveend/VoiceEndFireListItemView;->k:Ljava/lang/String;

    .line 195
    .line 196
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 197
    .line 198
    .line 199
    move-result-object v0

    .line 200
    sget v1, Lcom/p1/mobile/putong/live/livingroom/R$string;->D4:I

    .line 201
    .line 202
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 203
    .line 204
    .line 205
    move-result-object v0

    .line 206
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/liveend/VoiceEndFireListItemView;->i:Ljava/lang/String;

    .line 207
    .line 208
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/liveend/VoiceEndFireListItemView;->e:Ll/ayn0;

    .line 209
    .line 210
    if-eqz v0, :cond_7

    .line 211
    .line 212
    invoke-virtual {v0}, Ll/ayn0;->z0()Z

    .line 213
    .line 214
    .line 215
    move-result v0

    .line 216
    if-eqz v0, :cond_7

    .line 217
    .line 218
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/liveend/VoiceEndFireListItemView;->i:Ljava/lang/String;

    .line 219
    .line 220
    :cond_7
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 221
    .line 222
    .line 223
    move-result-object p1

    .line 224
    sget v0, Ll/obc0;->p0:I

    .line 225
    .line 226
    invoke-virtual {p1, v0}, Landroid/content/Context;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 227
    .line 228
    .line 229
    move-result-object p1

    .line 230
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/liveend/VoiceEndFireListItemView;->j:Landroid/graphics/drawable/Drawable;

    .line 231
    .line 232
    :goto_1
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/liveend/VoiceEndFireListItemView;->k:Ljava/lang/String;

    .line 233
    .line 234
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/liveend/VoiceEndFireListItemView;->i:Ljava/lang/String;

    .line 235
    .line 236
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/liveend/VoiceEndFireListItemView;->j:Landroid/graphics/drawable/Drawable;

    .line 237
    .line 238
    invoke-virtual {p0, p1, v0, v1}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/liveend/VoiceEndFireListItemView;->n(Ljava/lang/String;Ljava/lang/String;Landroid/graphics/drawable/Drawable;)V

    .line 239
    .line 240
    .line 241
    return-void

    .line 242
    nop

    .line 243
    :sswitch_data_0
    .sparse-switch
        -0x16cbcc76 -> :sswitch_3
        0x11fd2010 -> :sswitch_2
        0x2da6f291 -> :sswitch_1
        0x66618c33 -> :sswitch_0
    .end sparse-switch

    .line 244
    .line 245
    .line 246
    .line 247
    .line 248
    .line 249
    .line 250
    .line 251
    .line 252
    .line 253
    .line 254
    .line 255
    .line 256
    .line 257
    .line 258
    .line 259
    .line 260
    .line 261
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method


# virtual methods
.method public final h(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/rdn0;->a(Lcom/p1/mobile/putong/live/livingroom/voice/intl/liveend/VoiceEndFireListItemView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final i(Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    const-string p0, "likeMatched"

    .line 5
    .line 6
    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    if-nez p0, :cond_1

    .line 11
    .line 12
    const-string p0, "liking"

    .line 13
    .line 14
    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    if-nez p0, :cond_0

    .line 19
    .line 20
    const-string p0, "unfollow"

    .line 21
    .line 22
    return-object p0

    .line 23
    :cond_0
    const-string p0, "followed"

    .line 24
    .line 25
    return-object p0

    .line 26
    :cond_1
    const-string p0, "followMatched"

    .line 27
    .line 28
    return-object p0
.end method

.method public final synthetic j(Ljava/lang/String;Ljava/lang/String;Landroid/view/View;)V
    .locals 8

    .line 1
    iget-object p3, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/liveend/VoiceEndFireListItemView;->d:Landroid/widget/TextView;

    .line 2
    .line 3
    invoke-virtual {p3}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p3

    .line 7
    invoke-virtual {p3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p3

    .line 11
    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 12
    .line 13
    .line 14
    invoke-virtual {p3}, Ljava/lang/String;->hashCode()I

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    const-string v1, "followMatched"

    .line 19
    .line 20
    const-string v2, "following"

    .line 21
    .line 22
    const-string v3, "followed"

    .line 23
    .line 24
    const-string v4, "unfollow"

    .line 25
    .line 26
    const/4 v5, 0x1

    .line 27
    const/4 v6, 0x0

    .line 28
    const/4 v7, -0x1

    .line 29
    sparse-switch v0, :sswitch_data_0

    .line 30
    .line 31
    .line 32
    goto :goto_0

    .line 33
    :sswitch_0
    invoke-virtual {p3, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 34
    .line 35
    .line 36
    move-result p3

    .line 37
    if-nez p3, :cond_0

    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_0
    const/4 v7, 0x3

    .line 41
    goto :goto_0

    .line 42
    :sswitch_1
    invoke-virtual {p3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 43
    .line 44
    .line 45
    move-result p3

    .line 46
    if-nez p3, :cond_1

    .line 47
    .line 48
    goto :goto_0

    .line 49
    :cond_1
    const/4 v7, 0x2

    .line 50
    goto :goto_0

    .line 51
    :sswitch_2
    invoke-virtual {p3, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 52
    .line 53
    .line 54
    move-result p3

    .line 55
    if-nez p3, :cond_2

    .line 56
    .line 57
    goto :goto_0

    .line 58
    :cond_2
    move v7, v5

    .line 59
    goto :goto_0

    .line 60
    :sswitch_3
    invoke-virtual {p3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 61
    .line 62
    .line 63
    move-result p3

    .line 64
    if-nez p3, :cond_3

    .line 65
    .line 66
    goto :goto_0

    .line 67
    :cond_3
    move v7, v6

    .line 68
    :goto_0
    packed-switch v7, :pswitch_data_0

    .line 69
    .line 70
    .line 71
    goto :goto_1

    .line 72
    :pswitch_0
    iput-boolean v6, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/liveend/VoiceEndFireListItemView;->h:Z

    .line 73
    .line 74
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/liveend/VoiceEndFireListItemView;->p(Ljava/lang/String;)V

    .line 75
    .line 76
    .line 77
    goto :goto_1

    .line 78
    :pswitch_1
    iput-boolean v6, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/liveend/VoiceEndFireListItemView;->h:Z

    .line 79
    .line 80
    invoke-virtual {p0, v2}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/liveend/VoiceEndFireListItemView;->p(Ljava/lang/String;)V

    .line 81
    .line 82
    .line 83
    goto :goto_1

    .line 84
    :pswitch_2
    iput-boolean v5, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/liveend/VoiceEndFireListItemView;->h:Z

    .line 85
    .line 86
    invoke-direct {p0, v3}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/liveend/VoiceEndFireListItemView;->setFollowAction(Ljava/lang/String;)V

    .line 87
    .line 88
    .line 89
    goto :goto_1

    .line 90
    :pswitch_3
    iput-boolean v5, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/liveend/VoiceEndFireListItemView;->h:Z

    .line 91
    .line 92
    invoke-direct {p0, v4}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/liveend/VoiceEndFireListItemView;->setFollowAction(Ljava/lang/String;)V

    .line 93
    .line 94
    .line 95
    :goto_1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/liveend/VoiceEndFireListItemView;->q(Ljava/lang/String;Ljava/lang/String;)V

    .line 96
    .line 97
    .line 98
    return-void

    .line 99
    :sswitch_data_0
    .sparse-switch
        -0x16cbcc76 -> :sswitch_3
        0x11fd2010 -> :sswitch_2
        0x2da6f291 -> :sswitch_1
        0x66618c33 -> :sswitch_0
    .end sparse-switch

    .line 100
    .line 101
    .line 102
    .line 103
    .line 104
    .line 105
    .line 106
    .line 107
    .line 108
    .line 109
    .line 110
    .line 111
    .line 112
    .line 113
    .line 114
    .line 115
    .line 116
    .line 117
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public final synthetic k(Ljava/lang/String;Ljava/lang/Boolean;)V
    .locals 5

    .line 1
    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    .line 2
    .line 3
    .line 4
    move-result p2

    .line 5
    if-eqz p2, :cond_4

    .line 6
    .line 7
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 8
    .line 9
    .line 10
    invoke-virtual {p1}, Ljava/lang/String;->hashCode()I

    .line 11
    .line 12
    .line 13
    move-result p2

    .line 14
    const-string v0, "followMatched"

    .line 15
    .line 16
    const-string v1, "following"

    .line 17
    .line 18
    const-string v2, "followed"

    .line 19
    .line 20
    const-string v3, "unfollow"

    .line 21
    .line 22
    const/4 v4, -0x1

    .line 23
    sparse-switch p2, :sswitch_data_0

    .line 24
    .line 25
    .line 26
    goto :goto_0

    .line 27
    :sswitch_0
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    move-result p1

    .line 31
    if-nez p1, :cond_0

    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_0
    const/4 v4, 0x3

    .line 35
    goto :goto_0

    .line 36
    :sswitch_1
    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 37
    .line 38
    .line 39
    move-result p1

    .line 40
    if-nez p1, :cond_1

    .line 41
    .line 42
    goto :goto_0

    .line 43
    :cond_1
    const/4 v4, 0x2

    .line 44
    goto :goto_0

    .line 45
    :sswitch_2
    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 46
    .line 47
    .line 48
    move-result p1

    .line 49
    if-nez p1, :cond_2

    .line 50
    .line 51
    goto :goto_0

    .line 52
    :cond_2
    const/4 v4, 0x1

    .line 53
    goto :goto_0

    .line 54
    :sswitch_3
    invoke-virtual {p1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 55
    .line 56
    .line 57
    move-result p1

    .line 58
    if-nez p1, :cond_3

    .line 59
    .line 60
    goto :goto_0

    .line 61
    :cond_3
    const/4 v4, 0x0

    .line 62
    :goto_0
    packed-switch v4, :pswitch_data_0

    .line 63
    .line 64
    .line 65
    return-void

    .line 66
    :pswitch_0
    invoke-direct {p0, v2}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/liveend/VoiceEndFireListItemView;->setListBtnStyleParam(Ljava/lang/String;)V

    .line 67
    .line 68
    .line 69
    return-void

    .line 70
    :pswitch_1
    invoke-direct {p0, v3}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/liveend/VoiceEndFireListItemView;->setListBtnStyleParam(Ljava/lang/String;)V

    .line 71
    .line 72
    .line 73
    return-void

    .line 74
    :pswitch_2
    invoke-direct {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/liveend/VoiceEndFireListItemView;->setListBtnStyleParam(Ljava/lang/String;)V

    .line 75
    .line 76
    .line 77
    return-void

    .line 78
    :pswitch_3
    invoke-direct {p0, v1}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/liveend/VoiceEndFireListItemView;->setListBtnStyleParam(Ljava/lang/String;)V

    .line 79
    .line 80
    .line 81
    return-void

    .line 82
    :cond_4
    sget p0, Lcom/p1/mobile/putong/live/livingroom/R$string;->G9:I

    .line 83
    .line 84
    invoke-static {p0}, Ll/r1j0;->f(I)V

    .line 85
    .line 86
    .line 87
    return-void

    .line 88
    nop

    .line 89
    :sswitch_data_0
    .sparse-switch
        -0x16cbcc76 -> :sswitch_3
        0x11fd2010 -> :sswitch_2
        0x2da6f291 -> :sswitch_1
        0x66618c33 -> :sswitch_0
    .end sparse-switch

    .line 90
    .line 91
    .line 92
    .line 93
    .line 94
    .line 95
    .line 96
    .line 97
    .line 98
    .line 99
    .line 100
    .line 101
    .line 102
    .line 103
    .line 104
    .line 105
    .line 106
    .line 107
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public final synthetic l(Ljava/lang/String;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/liveend/VoiceEndFireListItemView;->setFollowAction(Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic m(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/liveend/VoiceEndFireListItemView;->g:Ll/th0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/th0;->c()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final n(Ljava/lang/String;Ljava/lang/String;Landroid/graphics/drawable/Drawable;)V
    .locals 1

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_1

    .line 6
    .line 7
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_1

    .line 12
    .line 13
    if-nez p3, :cond_0

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/liveend/VoiceEndFireListItemView;->d:Landroid/widget/TextView;

    .line 17
    .line 18
    invoke-virtual {v0, p1}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 19
    .line 20
    .line 21
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/liveend/VoiceEndFireListItemView;->d:Landroid/widget/TextView;

    .line 22
    .line 23
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 24
    .line 25
    .line 26
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/liveend/VoiceEndFireListItemView;->d:Landroid/widget/TextView;

    .line 27
    .line 28
    invoke-virtual {p1, p3}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 29
    .line 30
    .line 31
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/liveend/VoiceEndFireListItemView;->d:Landroid/widget/TextView;

    .line 32
    .line 33
    const/4 p1, 0x1

    .line 34
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 35
    .line 36
    .line 37
    return-void

    .line 38
    :cond_1
    :goto_0
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/liveend/VoiceEndFireListItemView;->d:Landroid/widget/TextView;

    .line 39
    .line 40
    const/4 p1, 0x0

    .line 41
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 42
    .line 43
    .line 44
    return-void
.end method

.method public o(Ll/ayn0;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceEndSparkRanking;Ll/nsv;Ljava/lang/String;Ljava/lang/String;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/ayn0;",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceEndSparkRanking;",
            "Ll/nsv<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/liveend/VoiceEndFireListItemView;->e:Ll/ayn0;

    .line 2
    .line 3
    iput-object p3, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/liveend/VoiceEndFireListItemView;->f:Ll/nsv;

    .line 4
    .line 5
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/liveend/VoiceEndFireListItemView;->a:Lv/VDraweeView;

    .line 6
    .line 7
    new-instance v1, Ll/ldn0;

    .line 8
    .line 9
    invoke-direct {v1}, Ll/ldn0;-><init>()V

    .line 10
    .line 11
    .line 12
    invoke-static {v0, p3, v1}, Ll/ql3;->c(Lcom/facebook/drawee/view/SimpleDraweeView;Ll/nsv;Ll/qcj;)V

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/liveend/VoiceEndFireListItemView;->b:Landroid/widget/TextView;

    .line 16
    .line 17
    iget-object v1, p3, Ll/nsv;->a:Ljava/lang/Object;

    .line 18
    .line 19
    check-cast v1, Lcom/p1/mobile/putong/data/User;

    .line 20
    .line 21
    iget-object v1, v1, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 22
    .line 23
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/liveend/VoiceEndFireListItemView;->c:Landroid/widget/TextView;

    .line 27
    .line 28
    sget v1, Lcom/p1/mobile/putong/live/livingroom/R$string;->rf:I

    .line 29
    .line 30
    iget-wide v2, p2, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceEndSparkRanking;->accompanyDuration:D

    .line 31
    .line 32
    const-wide/high16 v4, 0x404e000000000000L    # 60.0

    .line 33
    .line 34
    div-double/2addr v2, v4

    .line 35
    double-to-int v2, v2

    .line 36
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 37
    .line 38
    .line 39
    move-result-object v2

    .line 40
    invoke-static {v1, v2}, Ll/xau;->u(ILjava/lang/Object;)Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 45
    .line 46
    .line 47
    invoke-virtual {p1}, Ll/ayn0;->z0()Z

    .line 48
    .line 49
    .line 50
    move-result v0

    .line 51
    if-eqz v0, :cond_0

    .line 52
    .line 53
    iget-object p2, p2, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceEndSparkRanking;->relationState:Ljava/lang/String;

    .line 54
    .line 55
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/liveend/VoiceEndFireListItemView;->i(Ljava/lang/String;)Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object p2

    .line 59
    invoke-direct {p0, p2}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/liveend/VoiceEndFireListItemView;->setListBtnStyleParam(Ljava/lang/String;)V

    .line 60
    .line 61
    .line 62
    goto :goto_0

    .line 63
    :cond_0
    iget-object p2, p2, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceEndSparkRanking;->followRelation:Ljava/lang/String;

    .line 64
    .line 65
    invoke-direct {p0, p2}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/liveend/VoiceEndFireListItemView;->setListBtnStyleParam(Ljava/lang/String;)V

    .line 66
    .line 67
    .line 68
    :goto_0
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/liveend/VoiceEndFireListItemView;->a:Lv/VDraweeView;

    .line 69
    .line 70
    new-instance v0, Ll/mdn0;

    .line 71
    .line 72
    invoke-direct {v0, p1, p3}, Ll/mdn0;-><init>(Ll/ayn0;Ll/nsv;)V

    .line 73
    .line 74
    .line 75
    invoke-virtual {p2, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 76
    .line 77
    .line 78
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/liveend/VoiceEndFireListItemView;->b:Landroid/widget/TextView;

    .line 79
    .line 80
    new-instance v0, Ll/ndn0;

    .line 81
    .line 82
    invoke-direct {v0, p1, p3}, Ll/ndn0;-><init>(Ll/ayn0;Ll/nsv;)V

    .line 83
    .line 84
    .line 85
    invoke-virtual {p2, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 86
    .line 87
    .line 88
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/liveend/VoiceEndFireListItemView;->d:Landroid/widget/TextView;

    .line 89
    .line 90
    new-instance p2, Ll/odn0;

    .line 91
    .line 92
    invoke-direct {p2, p0, p4, p5}, Ll/odn0;-><init>(Lcom/p1/mobile/putong/live/livingroom/voice/intl/liveend/VoiceEndFireListItemView;Ljava/lang/String;Ljava/lang/String;)V

    .line 93
    .line 94
    .line 95
    invoke-virtual {p1, p2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 96
    .line 97
    .line 98
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/liveend/VoiceEndFireListItemView;->h(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final p(Ljava/lang/String;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/liveend/VoiceEndFireListItemView;->e:Ll/ayn0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/ayn0;->z0()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/liveend/VoiceEndFireListItemView;->setFollowAction(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    new-instance v0, Ll/th0$a;

    .line 14
    .line 15
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/liveend/VoiceEndFireListItemView;->e:Ll/ayn0;

    .line 16
    .line 17
    invoke-virtual {v1}, Ll/ayn0;->act()Lcom/p1/mobile/android/app/Act;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    invoke-direct {v0, v1}, Ll/th0$a;-><init>(Landroid/content/Context;)V

    .line 22
    .line 23
    .line 24
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/liveend/VoiceEndFireListItemView;->e:Ll/ayn0;

    .line 25
    .line 26
    invoke-virtual {v1}, Ll/ayn0;->act()Lcom/p1/mobile/android/app/Act;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    invoke-virtual {v1}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    sget v2, Lcom/p1/mobile/putong/live/livingroom/R$string;->Ag:I

    .line 35
    .line 36
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    invoke-virtual {v0, v1}, Ll/th0$a;->j(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    sget v2, Lcom/p1/mobile/putong/live/livingroom/R$string;->d:I

    .line 45
    .line 46
    invoke-virtual {v1, v2}, Ll/th0$a;->q(I)Ll/th0$a;

    .line 47
    .line 48
    .line 49
    move-result-object v1

    .line 50
    sget v2, Ll/n9c0;->d:I

    .line 51
    .line 52
    invoke-virtual {v1, v2}, Ll/th0$a;->p(I)Ll/th0$a;

    .line 53
    .line 54
    .line 55
    move-result-object v1

    .line 56
    new-instance v2, Ll/pdn0;

    .line 57
    .line 58
    invoke-direct {v2, p0, p1}, Ll/pdn0;-><init>(Lcom/p1/mobile/putong/live/livingroom/voice/intl/liveend/VoiceEndFireListItemView;Ljava/lang/String;)V

    .line 59
    .line 60
    .line 61
    invoke-virtual {v1, v2}, Ll/th0$a;->o(Landroid/view/View$OnClickListener;)Ll/th0$a;

    .line 62
    .line 63
    .line 64
    move-result-object p1

    .line 65
    sget v1, Lcom/p1/mobile/putong/live/livingroom/R$string;->a:I

    .line 66
    .line 67
    invoke-virtual {p1, v1}, Ll/th0$a;->e(I)Ll/th0$a;

    .line 68
    .line 69
    .line 70
    move-result-object p1

    .line 71
    new-instance v1, Ll/qdn0;

    .line 72
    .line 73
    invoke-direct {v1, p0}, Ll/qdn0;-><init>(Lcom/p1/mobile/putong/live/livingroom/voice/intl/liveend/VoiceEndFireListItemView;)V

    .line 74
    .line 75
    .line 76
    invoke-virtual {p1, v1}, Ll/th0$a;->c(Landroid/view/View$OnClickListener;)Ll/th0$a;

    .line 77
    .line 78
    .line 79
    invoke-virtual {v0}, Ll/th0$a;->a()Ll/th0;

    .line 80
    .line 81
    .line 82
    move-result-object p1

    .line 83
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/liveend/VoiceEndFireListItemView;->g:Ll/th0;

    .line 84
    .line 85
    invoke-virtual {p1}, Ll/th0;->g()V

    .line 86
    .line 87
    .line 88
    return-void
.end method

.method public final q(Ljava/lang/String;Ljava/lang/String;)V
    .locals 8

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/liveend/VoiceEndFireListItemView;->e:Ll/ayn0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/ayn0;->z0()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const-string v1, "receiver_user_id"

    .line 8
    .line 9
    const-string v2, "liveStatus"

    .line 10
    .line 11
    const-string v3, "live_audio_end"

    .line 12
    .line 13
    const-string v4, "liveFollow_from"

    .line 14
    .line 15
    const-string v5, "liveId"

    .line 16
    .line 17
    const-string v6, "anchorId"

    .line 18
    .line 19
    const-string v7, "p_anchor_live_end"

    .line 20
    .line 21
    if-eqz v0, :cond_0

    .line 22
    .line 23
    invoke-static {v6, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    invoke-static {v5, p2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 28
    .line 29
    .line 30
    move-result-object p2

    .line 31
    invoke-static {v4, v3}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    const-string v3, "off"

    .line 36
    .line 37
    invoke-static {v2, v3}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 38
    .line 39
    .line 40
    move-result-object v2

    .line 41
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/liveend/VoiceEndFireListItemView;->f:Ll/nsv;

    .line 42
    .line 43
    iget-object p0, p0, Ll/nsv;->a:Ljava/lang/Object;

    .line 44
    .line 45
    check-cast p0, Lcom/p1/mobile/putong/data/User;

    .line 46
    .line 47
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 48
    .line 49
    invoke-static {v1, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    filled-new-array {p1, p2, v0, v2, p0}, [Ll/pf60;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    const-string p1, "e_audio_anonymous_follow"

    .line 58
    .line 59
    invoke-static {p1, v7, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 60
    .line 61
    .line 62
    return-void

    .line 63
    :cond_0
    invoke-static {v6, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 64
    .line 65
    .line 66
    move-result-object p1

    .line 67
    invoke-static {v5, p2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 68
    .line 69
    .line 70
    move-result-object p2

    .line 71
    invoke-static {v4, v3}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    const-string v3, "endLive"

    .line 76
    .line 77
    invoke-static {v2, v3}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 78
    .line 79
    .line 80
    move-result-object v2

    .line 81
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/liveend/VoiceEndFireListItemView;->f:Ll/nsv;

    .line 82
    .line 83
    iget-object p0, p0, Ll/nsv;->a:Ljava/lang/Object;

    .line 84
    .line 85
    check-cast p0, Lcom/p1/mobile/putong/data/User;

    .line 86
    .line 87
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 88
    .line 89
    invoke-static {v1, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 90
    .line 91
    .line 92
    move-result-object p0

    .line 93
    filled-new-array {p1, p2, v0, v2, p0}, [Ll/pf60;

    .line 94
    .line 95
    .line 96
    move-result-object p0

    .line 97
    const-string p1, "e_follow"

    .line 98
    .line 99
    invoke-static {p1, v7, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 100
    .line 101
    .line 102
    return-void
.end method

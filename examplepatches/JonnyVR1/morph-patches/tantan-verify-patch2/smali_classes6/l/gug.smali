.class public Ll/gug;
.super Ll/mug;
.source "SourceFile"


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;Ll/hug;Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVideoView;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Ll/mug;-><init>(Lcom/p1/mobile/android/app/Act;Ll/hug;Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVideoView;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic p(Ll/gug;Ljava/util/HashMap;Lcom/p1/mobile/putong/feed/data/Moment;Z)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/gug;->q(Ljava/util/HashMap;Lcom/p1/mobile/putong/feed/data/Moment;Z)V

    return-void
.end method


# virtual methods
.method public l(ILcom/p1/mobile/putong/feed/data/Moment;Ljava/util/HashMap;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Lcom/p1/mobile/putong/feed/data/Moment;",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/Boolean;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object p1, p0, Ll/mug;->i:Lv/VText;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-virtual {p0, p1, v0}, Ll/mug;->d(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object p1, p0, Ll/mug;->h:Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;

    .line 8
    .line 9
    iget-object v1, p2, Lcom/p1/mobile/putong/feed/data/Moment;->value:Ljava/lang/String;

    .line 10
    .line 11
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    const/4 v2, 0x1

    .line 16
    xor-int/2addr v1, v2

    .line 17
    invoke-virtual {p0, p1, v1}, Ll/mug;->d(Landroid/view/View;Z)V

    .line 18
    .line 19
    .line 20
    iget-object p1, p0, Ll/mug;->h:Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;

    .line 21
    .line 22
    iget-object v1, p2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 23
    .line 24
    invoke-virtual {p3, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    if-nez v1, :cond_0

    .line 29
    .line 30
    move v1, v0

    .line 31
    goto :goto_0

    .line 32
    :cond_0
    iget-object v1, p2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 33
    .line 34
    invoke-virtual {p3, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    check-cast v1, Ljava/lang/Boolean;

    .line 39
    .line 40
    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 41
    .line 42
    .line 43
    move-result v1

    .line 44
    :goto_0
    invoke-virtual {p1, v1}, Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;->L(Z)Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;

    .line 45
    .line 46
    .line 47
    move-result-object p1

    .line 48
    new-instance v1, Ll/fug;

    .line 49
    .line 50
    invoke-direct {v1, p0, p3, p2}, Ll/fug;-><init>(Ll/gug;Ljava/util/HashMap;Lcom/p1/mobile/putong/feed/data/Moment;)V

    .line 51
    .line 52
    .line 53
    invoke-virtual {p1, v1}, Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;->Q(Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer$e;)Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;

    .line 54
    .line 55
    .line 56
    move-result-object p1

    .line 57
    iget-object p3, p2, Lcom/p1/mobile/putong/feed/data/Moment;->value:Ljava/lang/String;

    .line 58
    .line 59
    invoke-virtual {p1, p3}, Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;->M(Ljava/lang/CharSequence;)Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;

    .line 60
    .line 61
    .line 62
    iget-object p1, p0, Ll/mug;->p:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 63
    .line 64
    iget-boolean p3, p2, Lcom/p1/mobile/putong/feed/data/Moment;->isLive:Z

    .line 65
    .line 66
    if-eqz p3, :cond_1

    .line 67
    .line 68
    iget-object p3, p2, Lcom/p1/mobile/putong/feed/data/Moment;->live:Lcom/p1/mobile/putong/data/Live;

    .line 69
    .line 70
    invoke-static {p3}, Ll/rtg;->a(Lcom/p1/mobile/putong/data/Live;)Z

    .line 71
    .line 72
    .line 73
    move-result p3

    .line 74
    if-eqz p3, :cond_1

    .line 75
    .line 76
    move p3, v2

    .line 77
    goto :goto_1

    .line 78
    :cond_1
    move p3, v0

    .line 79
    :goto_1
    invoke-virtual {p0, p1, p3}, Ll/mug;->d(Landroid/view/View;Z)V

    .line 80
    .line 81
    .line 82
    iget-object p1, p0, Ll/mug;->s:Lcom/tantanapp/media/ttmediaeffect/anim/AnimEffectPlayer;

    .line 83
    .line 84
    new-instance p3, Ll/gug$a;

    .line 85
    .line 86
    invoke-direct {p3, p0}, Ll/gug$a;-><init>(Ll/gug;)V

    .line 87
    .line 88
    .line 89
    const-string v1, "feed_live_room_icon.svga"

    .line 90
    .line 91
    const/4 v3, -0x1

    .line 92
    invoke-virtual {p1, v1, v3, p3, v2}, Lcom/tantanapp/media/ttmediaeffect/anim/AnimEffectPlayer;->loadAnimWithListener(Ljava/lang/String;ILcom/tantanapp/media/ttmediaeffect/anim/AnimListener;Z)V

    .line 93
    .line 94
    .line 95
    iget-boolean p1, p2, Lcom/p1/mobile/putong/feed/data/Moment;->isLive:Z

    .line 96
    .line 97
    if-eqz p1, :cond_3

    .line 98
    .line 99
    iget-object p1, p2, Lcom/p1/mobile/putong/feed/data/Moment;->live:Lcom/p1/mobile/putong/data/Live;

    .line 100
    .line 101
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Live;->specialLabels:Ljava/util/List;

    .line 102
    .line 103
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 104
    .line 105
    .line 106
    move-result p1

    .line 107
    if-nez p1, :cond_3

    .line 108
    .line 109
    iget-object p1, p2, Lcom/p1/mobile/putong/feed/data/Moment;->live:Lcom/p1/mobile/putong/data/Live;

    .line 110
    .line 111
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Live;->specialLabels:Ljava/util/List;

    .line 112
    .line 113
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 114
    .line 115
    .line 116
    move-result-object p1

    .line 117
    check-cast p1, Lcom/p1/mobile/putong/data/LiveSpecialLabel;

    .line 118
    .line 119
    iget-object p1, p1, Lcom/p1/mobile/putong/data/LiveSpecialLabel;->value:Ljava/lang/String;

    .line 120
    .line 121
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 122
    .line 123
    .line 124
    move-result p3

    .line 125
    iget-object v1, p0, Ll/mug;->r:Lv/VText;

    .line 126
    .line 127
    if-nez p3, :cond_2

    .line 128
    .line 129
    invoke-virtual {v1, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 130
    .line 131
    .line 132
    goto :goto_2

    .line 133
    :cond_2
    const-string p1, "\u76f4\u64ad\u4e2d"

    .line 134
    .line 135
    invoke-virtual {v1, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 136
    .line 137
    .line 138
    :cond_3
    :goto_2
    iget-object p1, p0, Ll/mug;->d:Landroid/widget/LinearLayout;

    .line 139
    .line 140
    invoke-virtual {p0, p1, v0}, Ll/mug;->d(Landroid/view/View;Z)V

    .line 141
    .line 142
    .line 143
    iget-object p1, p0, Ll/mug;->t:Lv/VImage;

    .line 144
    .line 145
    invoke-static {p2, p1}, Ll/rtg;->f(Lcom/p1/mobile/putong/feed/data/Moment;Landroid/view/View;)V

    .line 146
    .line 147
    .line 148
    iget-boolean p1, p2, Lcom/p1/mobile/putong/feed/data/Moment;->isLive:Z

    .line 149
    .line 150
    if-eqz p1, :cond_6

    .line 151
    .line 152
    iget-object p1, p2, Lcom/p1/mobile/putong/feed/data/Moment;->live:Lcom/p1/mobile/putong/data/Live;

    .line 153
    .line 154
    iget-object p3, p1, Lcom/p1/mobile/putong/data/Live;->videoCapture:Lcom/p1/mobile/putong/data/Media;

    .line 155
    .line 156
    instance-of v0, p3, Lcom/p1/mobile/putong/data/Video;

    .line 157
    .line 158
    if-eqz v0, :cond_6

    .line 159
    .line 160
    check-cast p3, Lcom/p1/mobile/putong/data/Video;

    .line 161
    .line 162
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Live;->snapshot:Lcom/p1/mobile/putong/data/Media;

    .line 163
    .line 164
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 165
    .line 166
    .line 167
    move-result p1

    .line 168
    if-eqz p1, :cond_4

    .line 169
    .line 170
    iget-object p1, p2, Lcom/p1/mobile/putong/feed/data/Moment;->live:Lcom/p1/mobile/putong/data/Live;

    .line 171
    .line 172
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Live;->snapshot:Lcom/p1/mobile/putong/data/Media;

    .line 173
    .line 174
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/Media;->cover()Lcom/p1/mobile/putong/data/Picture;

    .line 175
    .line 176
    .line 177
    move-result-object p1

    .line 178
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 179
    .line 180
    .line 181
    move-result p1

    .line 182
    if-eqz p1, :cond_4

    .line 183
    .line 184
    iget-object p1, p2, Lcom/p1/mobile/putong/feed/data/Moment;->live:Lcom/p1/mobile/putong/data/Live;

    .line 185
    .line 186
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Live;->snapshot:Lcom/p1/mobile/putong/data/Media;

    .line 187
    .line 188
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/Media;->cover()Lcom/p1/mobile/putong/data/Picture;

    .line 189
    .line 190
    .line 191
    move-result-object p1

    .line 192
    goto :goto_3

    .line 193
    :cond_4
    iget-object p1, p2, Lcom/p1/mobile/putong/feed/data/Moment;->liveRoom:Lcom/p1/mobile/putong/data/Room;

    .line 194
    .line 195
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 196
    .line 197
    .line 198
    move-result p1

    .line 199
    if-eqz p1, :cond_5

    .line 200
    .line 201
    iget-object p1, p2, Lcom/p1/mobile/putong/feed/data/Moment;->liveRoom:Lcom/p1/mobile/putong/data/Room;

    .line 202
    .line 203
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Room;->cover:Lcom/p1/mobile/putong/data/RoomCover;

    .line 204
    .line 205
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 206
    .line 207
    .line 208
    move-result p1

    .line 209
    if-eqz p1, :cond_5

    .line 210
    .line 211
    iget-object p1, p2, Lcom/p1/mobile/putong/feed/data/Moment;->liveRoom:Lcom/p1/mobile/putong/data/Room;

    .line 212
    .line 213
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Room;->cover:Lcom/p1/mobile/putong/data/RoomCover;

    .line 214
    .line 215
    iget-object p1, p1, Lcom/p1/mobile/putong/data/RoomCover;->media:Lcom/p1/mobile/putong/data/Picture;

    .line 216
    .line 217
    goto :goto_3

    .line 218
    :cond_5
    const/4 p1, 0x0

    .line 219
    :goto_3
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 220
    .line 221
    .line 222
    move-result v0

    .line 223
    if-eqz v0, :cond_6

    .line 224
    .line 225
    invoke-virtual {p0, p3, p1}, Ll/mug;->k(Lcom/p1/mobile/putong/data/Video;Lcom/p1/mobile/putong/data/Picture;)V

    .line 226
    .line 227
    .line 228
    return-void

    .line 229
    :cond_6
    iget-object p1, p2, Lcom/p1/mobile/putong/feed/data/Moment;->live:Lcom/p1/mobile/putong/data/Live;

    .line 230
    .line 231
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Live;->snapshot:Lcom/p1/mobile/putong/data/Media;

    .line 232
    .line 233
    if-nez p1, :cond_7

    .line 234
    .line 235
    goto :goto_4

    .line 236
    :cond_7
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/Media;->cover()Lcom/p1/mobile/putong/data/Picture;

    .line 237
    .line 238
    .line 239
    move-result-object p1

    .line 240
    if-nez p1, :cond_8

    .line 241
    .line 242
    :goto_4
    return-void

    .line 243
    :cond_8
    iget-object p2, p2, Lcom/p1/mobile/putong/feed/data/Moment;->live:Lcom/p1/mobile/putong/data/Live;

    .line 244
    .line 245
    iget-object p2, p2, Lcom/p1/mobile/putong/data/Live;->snapshot:Lcom/p1/mobile/putong/data/Media;

    .line 246
    .line 247
    check-cast p2, Lcom/p1/mobile/putong/data/Video;

    .line 248
    .line 249
    invoke-virtual {p0, p2, p1}, Ll/mug;->j(Lcom/p1/mobile/putong/data/Video;Lcom/p1/mobile/putong/data/Picture;)V

    .line 250
    .line 251
    .line 252
    return-void
.end method

.method public final synthetic q(Ljava/util/HashMap;Lcom/p1/mobile/putong/feed/data/Moment;Z)V
    .locals 1

    .line 1
    iget-object p2, p2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {p3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {p1, p2, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    iget-object p0, p0, Ll/mug;->x:Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVideoView;

    .line 11
    .line 12
    invoke-virtual {p0, p3}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->k0(Z)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

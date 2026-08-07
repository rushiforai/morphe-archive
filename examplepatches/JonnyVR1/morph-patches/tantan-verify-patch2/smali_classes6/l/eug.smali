.class public Ll/eug;
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


# virtual methods
.method public l(ILcom/p1/mobile/putong/feed/data/Moment;Ljava/util/HashMap;)V
    .locals 3
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
    invoke-super {p0, p1, p2, p3}, Ll/mug;->l(ILcom/p1/mobile/putong/feed/data/Moment;Ljava/util/HashMap;)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Ll/mug;->i:Lv/VText;

    .line 5
    .line 6
    const/4 p3, 0x0

    .line 7
    invoke-virtual {p0, p1, p3}, Ll/mug;->d(Landroid/view/View;Z)V

    .line 8
    .line 9
    .line 10
    iget-object p1, p0, Ll/mug;->d:Landroid/widget/LinearLayout;

    .line 11
    .line 12
    invoke-virtual {p0, p1, p3}, Ll/mug;->d(Landroid/view/View;Z)V

    .line 13
    .line 14
    .line 15
    iget-object p1, p0, Ll/mug;->o:Lv/VText;

    .line 16
    .line 17
    invoke-virtual {p0, p1, p3}, Ll/mug;->d(Landroid/view/View;Z)V

    .line 18
    .line 19
    .line 20
    iget-object p1, p0, Ll/mug;->p:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 21
    .line 22
    iget-boolean v0, p2, Lcom/p1/mobile/putong/feed/data/Moment;->isLive:Z

    .line 23
    .line 24
    const/4 v1, 0x1

    .line 25
    if-eqz v0, :cond_0

    .line 26
    .line 27
    iget-object v0, p2, Lcom/p1/mobile/putong/feed/data/Moment;->live:Lcom/p1/mobile/putong/data/Live;

    .line 28
    .line 29
    invoke-static {v0}, Ll/rtg;->a(Lcom/p1/mobile/putong/data/Live;)Z

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    if-eqz v0, :cond_0

    .line 34
    .line 35
    invoke-static {}, Ll/j4h;->d()Z

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    if-eqz v0, :cond_0

    .line 40
    .line 41
    move v0, v1

    .line 42
    goto :goto_0

    .line 43
    :cond_0
    move v0, p3

    .line 44
    :goto_0
    invoke-virtual {p0, p1, v0}, Ll/mug;->d(Landroid/view/View;Z)V

    .line 45
    .line 46
    .line 47
    invoke-static {}, Ll/j4h;->d()Z

    .line 48
    .line 49
    .line 50
    move-result p1

    .line 51
    if-eqz p1, :cond_1

    .line 52
    .line 53
    iget-object p1, p0, Ll/mug;->t:Lv/VImage;

    .line 54
    .line 55
    invoke-virtual {p0, p1, p3}, Ll/mug;->d(Landroid/view/View;Z)V

    .line 56
    .line 57
    .line 58
    :cond_1
    iget-object p1, p0, Ll/mug;->s:Lcom/tantanapp/media/ttmediaeffect/anim/AnimEffectPlayer;

    .line 59
    .line 60
    invoke-virtual {p1}, Lcom/immomo/svgaplayer/SVGAImageView;->stopAnimation()V

    .line 61
    .line 62
    .line 63
    iget-boolean p1, p2, Lcom/p1/mobile/putong/feed/data/Moment;->isLive:Z

    .line 64
    .line 65
    if-eqz p1, :cond_3

    .line 66
    .line 67
    iget-object p1, p2, Lcom/p1/mobile/putong/feed/data/Moment;->live:Lcom/p1/mobile/putong/data/Live;

    .line 68
    .line 69
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Live;->specialLabels:Ljava/util/List;

    .line 70
    .line 71
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 72
    .line 73
    .line 74
    move-result p1

    .line 75
    if-nez p1, :cond_3

    .line 76
    .line 77
    iget-object p1, p2, Lcom/p1/mobile/putong/feed/data/Moment;->live:Lcom/p1/mobile/putong/data/Live;

    .line 78
    .line 79
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Live;->specialLabels:Ljava/util/List;

    .line 80
    .line 81
    invoke-interface {p1, p3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 82
    .line 83
    .line 84
    move-result-object p1

    .line 85
    check-cast p1, Lcom/p1/mobile/putong/data/LiveSpecialLabel;

    .line 86
    .line 87
    iget-object p1, p1, Lcom/p1/mobile/putong/data/LiveSpecialLabel;->value:Ljava/lang/String;

    .line 88
    .line 89
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 90
    .line 91
    .line 92
    move-result v0

    .line 93
    iget-object v2, p0, Ll/mug;->r:Lv/VText;

    .line 94
    .line 95
    if-nez v0, :cond_2

    .line 96
    .line 97
    invoke-virtual {v2, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 98
    .line 99
    .line 100
    goto :goto_1

    .line 101
    :cond_2
    const-string p1, "\u76f4\u64ad\u4e2d"

    .line 102
    .line 103
    invoke-virtual {v2, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 104
    .line 105
    .line 106
    :cond_3
    :goto_1
    iget-boolean p1, p2, Lcom/p1/mobile/putong/feed/data/Moment;->isLive:Z

    .line 107
    .line 108
    if-eqz p1, :cond_6

    .line 109
    .line 110
    iget-object p1, p2, Lcom/p1/mobile/putong/feed/data/Moment;->live:Lcom/p1/mobile/putong/data/Live;

    .line 111
    .line 112
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Live;->videoCapture:Lcom/p1/mobile/putong/data/Media;

    .line 113
    .line 114
    instance-of p1, p1, Lcom/p1/mobile/putong/data/Video;

    .line 115
    .line 116
    if-eqz p1, :cond_6

    .line 117
    .line 118
    invoke-static {}, Ll/j4h;->d()Z

    .line 119
    .line 120
    .line 121
    move-result p1

    .line 122
    if-eqz p1, :cond_6

    .line 123
    .line 124
    iget-object p1, p2, Lcom/p1/mobile/putong/feed/data/Moment;->live:Lcom/p1/mobile/putong/data/Live;

    .line 125
    .line 126
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Live;->videoCapture:Lcom/p1/mobile/putong/data/Media;

    .line 127
    .line 128
    check-cast v0, Lcom/p1/mobile/putong/data/Video;

    .line 129
    .line 130
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Live;->snapshot:Lcom/p1/mobile/putong/data/Media;

    .line 131
    .line 132
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 133
    .line 134
    .line 135
    move-result p1

    .line 136
    if-eqz p1, :cond_4

    .line 137
    .line 138
    iget-object p1, p2, Lcom/p1/mobile/putong/feed/data/Moment;->live:Lcom/p1/mobile/putong/data/Live;

    .line 139
    .line 140
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Live;->snapshot:Lcom/p1/mobile/putong/data/Media;

    .line 141
    .line 142
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/Media;->cover()Lcom/p1/mobile/putong/data/Picture;

    .line 143
    .line 144
    .line 145
    move-result-object p1

    .line 146
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 147
    .line 148
    .line 149
    move-result p1

    .line 150
    if-eqz p1, :cond_4

    .line 151
    .line 152
    iget-object p1, p2, Lcom/p1/mobile/putong/feed/data/Moment;->live:Lcom/p1/mobile/putong/data/Live;

    .line 153
    .line 154
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Live;->snapshot:Lcom/p1/mobile/putong/data/Media;

    .line 155
    .line 156
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/Media;->cover()Lcom/p1/mobile/putong/data/Picture;

    .line 157
    .line 158
    .line 159
    move-result-object p1

    .line 160
    goto :goto_2

    .line 161
    :cond_4
    iget-object p1, p2, Lcom/p1/mobile/putong/feed/data/Moment;->liveRoom:Lcom/p1/mobile/putong/data/Room;

    .line 162
    .line 163
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 164
    .line 165
    .line 166
    move-result p1

    .line 167
    if-eqz p1, :cond_5

    .line 168
    .line 169
    iget-object p1, p2, Lcom/p1/mobile/putong/feed/data/Moment;->liveRoom:Lcom/p1/mobile/putong/data/Room;

    .line 170
    .line 171
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Room;->cover:Lcom/p1/mobile/putong/data/RoomCover;

    .line 172
    .line 173
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 174
    .line 175
    .line 176
    move-result p1

    .line 177
    if-eqz p1, :cond_5

    .line 178
    .line 179
    iget-object p1, p2, Lcom/p1/mobile/putong/feed/data/Moment;->liveRoom:Lcom/p1/mobile/putong/data/Room;

    .line 180
    .line 181
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Room;->cover:Lcom/p1/mobile/putong/data/RoomCover;

    .line 182
    .line 183
    iget-object p1, p1, Lcom/p1/mobile/putong/data/RoomCover;->media:Lcom/p1/mobile/putong/data/Picture;

    .line 184
    .line 185
    goto :goto_2

    .line 186
    :cond_5
    const/4 p1, 0x0

    .line 187
    :goto_2
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 188
    .line 189
    .line 190
    move-result v2

    .line 191
    if-eqz v2, :cond_6

    .line 192
    .line 193
    invoke-virtual {p0, v0, p1}, Ll/mug;->k(Lcom/p1/mobile/putong/data/Video;Lcom/p1/mobile/putong/data/Picture;)V

    .line 194
    .line 195
    .line 196
    return-void

    .line 197
    :cond_6
    iget-object p1, p2, Lcom/p1/mobile/putong/feed/data/Moment;->media:Ljava/util/List;

    .line 198
    .line 199
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 200
    .line 201
    .line 202
    move-result p2

    .line 203
    if-eq p2, v1, :cond_7

    .line 204
    .line 205
    goto :goto_3

    .line 206
    :cond_7
    invoke-interface {p1, p3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 207
    .line 208
    .line 209
    move-result-object p1

    .line 210
    check-cast p1, Lcom/p1/mobile/putong/data/Media;

    .line 211
    .line 212
    instance-of p2, p1, Lcom/p1/mobile/putong/data/Video;

    .line 213
    .line 214
    if-nez p2, :cond_8

    .line 215
    .line 216
    goto :goto_3

    .line 217
    :cond_8
    check-cast p1, Lcom/p1/mobile/putong/data/Video;

    .line 218
    .line 219
    iget-object p2, p1, Lcom/p1/mobile/putong/data/Video;->cover:Lcom/p1/mobile/putong/data/Picture;

    .line 220
    .line 221
    if-nez p2, :cond_9

    .line 222
    .line 223
    :goto_3
    return-void

    .line 224
    :cond_9
    invoke-virtual {p0, p1, p2}, Ll/mug;->j(Lcom/p1/mobile/putong/data/Video;Lcom/p1/mobile/putong/data/Picture;)V

    .line 225
    .line 226
    .line 227
    return-void
.end method

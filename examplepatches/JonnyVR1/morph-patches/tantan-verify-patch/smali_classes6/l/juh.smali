.class public Ll/juh;
.super Ljava/lang/Object;
.source "SourceFile"


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

.method public static a(Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomView;Landroid/view/View;)V
    .locals 7

    .line 1
    check-cast p1, Landroid/view/ViewGroup;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 5
    .line 6
    .line 7
    move-result-object v1

    .line 8
    check-cast v1, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomTitleTagsView;

    .line 9
    .line 10
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomView;->d:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomTitleTagsView;

    .line 11
    .line 12
    const/4 v1, 0x1

    .line 13
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    check-cast v2, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomTopicView;

    .line 18
    .line 19
    iput-object v2, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomView;->e:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomTopicView;

    .line 20
    .line 21
    const/4 v2, 0x2

    .line 22
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 23
    .line 24
    .line 25
    move-result-object v3

    .line 26
    check-cast v3, Landroid/widget/LinearLayout;

    .line 27
    .line 28
    iput-object v3, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomView;->f:Landroid/widget/LinearLayout;

    .line 29
    .line 30
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 31
    .line 32
    .line 33
    move-result-object v3

    .line 34
    check-cast v3, Landroid/view/ViewGroup;

    .line 35
    .line 36
    invoke-virtual {v3, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 37
    .line 38
    .line 39
    move-result-object v3

    .line 40
    check-cast v3, Landroid/widget/ImageView;

    .line 41
    .line 42
    iput-object v3, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomView;->g:Landroid/widget/ImageView;

    .line 43
    .line 44
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 45
    .line 46
    .line 47
    move-result-object v3

    .line 48
    check-cast v3, Landroid/view/ViewGroup;

    .line 49
    .line 50
    invoke-virtual {v3, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 51
    .line 52
    .line 53
    move-result-object v3

    .line 54
    check-cast v3, Landroid/view/ViewGroup;

    .line 55
    .line 56
    invoke-virtual {v3, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 57
    .line 58
    .line 59
    move-result-object v3

    .line 60
    check-cast v3, Landroid/widget/ImageView;

    .line 61
    .line 62
    iput-object v3, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomView;->h:Landroid/widget/ImageView;

    .line 63
    .line 64
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 65
    .line 66
    .line 67
    move-result-object v3

    .line 68
    check-cast v3, Landroid/view/ViewGroup;

    .line 69
    .line 70
    invoke-virtual {v3, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 71
    .line 72
    .line 73
    move-result-object v3

    .line 74
    check-cast v3, Landroid/view/ViewGroup;

    .line 75
    .line 76
    invoke-virtual {v3, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 77
    .line 78
    .line 79
    move-result-object v3

    .line 80
    check-cast v3, Lcom/p1/mobile/putong/feed/newui/photoalbum/redpointview/FeedRedDotView;

    .line 81
    .line 82
    iput-object v3, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomView;->i:Lcom/p1/mobile/putong/feed/newui/photoalbum/redpointview/FeedRedDotView;

    .line 83
    .line 84
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 85
    .line 86
    .line 87
    move-result-object v3

    .line 88
    check-cast v3, Landroid/view/ViewGroup;

    .line 89
    .line 90
    invoke-virtual {v3, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 91
    .line 92
    .line 93
    move-result-object v3

    .line 94
    check-cast v3, Lv/VImage;

    .line 95
    .line 96
    iput-object v3, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomView;->j:Lv/VImage;

    .line 97
    .line 98
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 99
    .line 100
    .line 101
    move-result-object v3

    .line 102
    check-cast v3, Landroid/view/ViewGroup;

    .line 103
    .line 104
    const/4 v4, 0x3

    .line 105
    invoke-virtual {v3, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 106
    .line 107
    .line 108
    move-result-object v3

    .line 109
    check-cast v3, Landroid/widget/ImageView;

    .line 110
    .line 111
    iput-object v3, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomView;->k:Landroid/widget/ImageView;

    .line 112
    .line 113
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 114
    .line 115
    .line 116
    move-result-object v3

    .line 117
    check-cast v3, Landroid/view/ViewGroup;

    .line 118
    .line 119
    const/4 v5, 0x4

    .line 120
    invoke-virtual {v3, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 121
    .line 122
    .line 123
    move-result-object v3

    .line 124
    check-cast v3, Landroid/widget/ImageView;

    .line 125
    .line 126
    iput-object v3, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomView;->l:Landroid/widget/ImageView;

    .line 127
    .line 128
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 129
    .line 130
    .line 131
    move-result-object v3

    .line 132
    check-cast v3, Landroid/view/ViewGroup;

    .line 133
    .line 134
    const/4 v6, 0x5

    .line 135
    invoke-virtual {v3, v6}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 136
    .line 137
    .line 138
    move-result-object v3

    .line 139
    check-cast v3, Landroid/widget/ImageView;

    .line 140
    .line 141
    iput-object v3, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomView;->m:Landroid/widget/ImageView;

    .line 142
    .line 143
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 144
    .line 145
    .line 146
    move-result-object v2

    .line 147
    check-cast v2, Landroid/view/ViewGroup;

    .line 148
    .line 149
    const/4 v3, 0x6

    .line 150
    invoke-virtual {v2, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 151
    .line 152
    .line 153
    move-result-object v2

    .line 154
    check-cast v2, Lv/VText;

    .line 155
    .line 156
    iput-object v2, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomView;->n:Lv/VText;

    .line 157
    .line 158
    invoke-virtual {p1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 159
    .line 160
    .line 161
    move-result-object v2

    .line 162
    check-cast v2, Landroid/widget/FrameLayout;

    .line 163
    .line 164
    iput-object v2, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomView;->o:Landroid/widget/FrameLayout;

    .line 165
    .line 166
    invoke-virtual {p1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 167
    .line 168
    .line 169
    move-result-object v2

    .line 170
    check-cast v2, Landroid/view/ViewGroup;

    .line 171
    .line 172
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 173
    .line 174
    .line 175
    move-result-object v2

    .line 176
    check-cast v2, Landroid/widget/FrameLayout;

    .line 177
    .line 178
    iput-object v2, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomView;->p:Landroid/widget/FrameLayout;

    .line 179
    .line 180
    invoke-virtual {p1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 181
    .line 182
    .line 183
    move-result-object v2

    .line 184
    check-cast v2, Landroid/view/ViewGroup;

    .line 185
    .line 186
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 187
    .line 188
    .line 189
    move-result-object v2

    .line 190
    check-cast v2, Landroid/view/ViewGroup;

    .line 191
    .line 192
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 193
    .line 194
    .line 195
    move-result-object v2

    .line 196
    check-cast v2, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomAlbumView;

    .line 197
    .line 198
    iput-object v2, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomView;->q:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomAlbumView;

    .line 199
    .line 200
    invoke-virtual {p1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 201
    .line 202
    .line 203
    move-result-object v2

    .line 204
    check-cast v2, Landroid/view/ViewGroup;

    .line 205
    .line 206
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 207
    .line 208
    .line 209
    move-result-object v0

    .line 210
    check-cast v0, Landroid/view/ViewGroup;

    .line 211
    .line 212
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 213
    .line 214
    .line 215
    move-result-object v0

    .line 216
    check-cast v0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomAudioView;

    .line 217
    .line 218
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomView;->r:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomAudioView;

    .line 219
    .line 220
    invoke-virtual {p1, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 221
    .line 222
    .line 223
    move-result-object p1

    .line 224
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomView;->s:Landroid/view/View;

    .line 225
    .line 226
    return-void
.end method

.method public static b(Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomView;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 2

    .line 1
    sget v0, Ll/tec0;->w2:I

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {p1, v0, p2, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    invoke-static {p0, p1}, Ll/juh;->a(Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomView;Landroid/view/View;)V

    .line 9
    .line 10
    .line 11
    return-object p1
.end method

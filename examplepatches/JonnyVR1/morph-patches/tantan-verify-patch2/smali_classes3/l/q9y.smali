.class public Ll/q9y;
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

.method public static a(Lcom/p1/mobile/putong/core/newui/newmeet/feed/MeetFeedBaseItemView;Landroid/view/View;)V
    .locals 6

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
    check-cast v1, Lcom/tantan/library/svga/SVGAnimationView;

    .line 9
    .line 10
    iput-object v1, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/MeetFeedBaseItemView;->d:Lcom/tantan/library/svga/SVGAnimationView;

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
    check-cast v2, Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;

    .line 18
    .line 19
    iput-object v2, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/MeetFeedBaseItemView;->e:Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;

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
    check-cast v3, Lv/VLinear_FillerMeasure;

    .line 27
    .line 28
    iput-object v3, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/MeetFeedBaseItemView;->f:Lv/VLinear_FillerMeasure;

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
    check-cast v3, Lv/VText;

    .line 41
    .line 42
    iput-object v3, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/MeetFeedBaseItemView;->g:Lv/VText;

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
    check-cast v3, Landroidx/legacy/widget/Space;

    .line 55
    .line 56
    iput-object v3, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/MeetFeedBaseItemView;->h:Landroidx/legacy/widget/Space;

    .line 57
    .line 58
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 59
    .line 60
    .line 61
    move-result-object v3

    .line 62
    check-cast v3, Landroid/view/ViewGroup;

    .line 63
    .line 64
    invoke-virtual {v3, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 65
    .line 66
    .line 67
    move-result-object v3

    .line 68
    check-cast v3, Lv/VImage;

    .line 69
    .line 70
    iput-object v3, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/MeetFeedBaseItemView;->i:Lv/VImage;

    .line 71
    .line 72
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 73
    .line 74
    .line 75
    move-result-object v3

    .line 76
    check-cast v3, Landroid/view/ViewGroup;

    .line 77
    .line 78
    const/4 v4, 0x3

    .line 79
    invoke-virtual {v3, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 80
    .line 81
    .line 82
    move-result-object v3

    .line 83
    check-cast v3, Landroidx/legacy/widget/Space;

    .line 84
    .line 85
    iput-object v3, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/MeetFeedBaseItemView;->j:Landroidx/legacy/widget/Space;

    .line 86
    .line 87
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 88
    .line 89
    .line 90
    move-result-object v3

    .line 91
    check-cast v3, Landroid/view/ViewGroup;

    .line 92
    .line 93
    const/4 v5, 0x4

    .line 94
    invoke-virtual {v3, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 95
    .line 96
    .line 97
    move-result-object v3

    .line 98
    check-cast v3, Lcom/p1/mobile/putong/newui/view/ODiamondTagLabel;

    .line 99
    .line 100
    iput-object v3, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/MeetFeedBaseItemView;->k:Lcom/p1/mobile/putong/newui/view/ODiamondTagLabel;

    .line 101
    .line 102
    invoke-virtual {p1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 103
    .line 104
    .line 105
    move-result-object v3

    .line 106
    check-cast v3, Lv/VText;

    .line 107
    .line 108
    iput-object v3, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/MeetFeedBaseItemView;->l:Lv/VText;

    .line 109
    .line 110
    invoke-virtual {p1, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 111
    .line 112
    .line 113
    move-result-object v3

    .line 114
    check-cast v3, Landroid/widget/LinearLayout;

    .line 115
    .line 116
    iput-object v3, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/MeetFeedBaseItemView;->m:Landroid/widget/LinearLayout;

    .line 117
    .line 118
    invoke-virtual {p1, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 119
    .line 120
    .line 121
    move-result-object v3

    .line 122
    check-cast v3, Landroid/view/ViewGroup;

    .line 123
    .line 124
    invoke-virtual {v3, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 125
    .line 126
    .line 127
    move-result-object v3

    .line 128
    check-cast v3, Lv/VFrame_Shadow;

    .line 129
    .line 130
    iput-object v3, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/MeetFeedBaseItemView;->n:Lv/VFrame_Shadow;

    .line 131
    .line 132
    invoke-virtual {p1, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 133
    .line 134
    .line 135
    move-result-object v3

    .line 136
    check-cast v3, Landroid/view/ViewGroup;

    .line 137
    .line 138
    invoke-virtual {v3, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 139
    .line 140
    .line 141
    move-result-object v3

    .line 142
    check-cast v3, Landroid/view/ViewGroup;

    .line 143
    .line 144
    invoke-virtual {v3, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 145
    .line 146
    .line 147
    move-result-object v3

    .line 148
    check-cast v3, Landroid/widget/ImageView;

    .line 149
    .line 150
    iput-object v3, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/MeetFeedBaseItemView;->o:Landroid/widget/ImageView;

    .line 151
    .line 152
    invoke-virtual {p1, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 153
    .line 154
    .line 155
    move-result-object v3

    .line 156
    check-cast v3, Landroid/view/ViewGroup;

    .line 157
    .line 158
    invoke-virtual {v3, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 159
    .line 160
    .line 161
    move-result-object v1

    .line 162
    check-cast v1, Landroid/widget/ImageView;

    .line 163
    .line 164
    iput-object v1, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/MeetFeedBaseItemView;->p:Landroid/widget/ImageView;

    .line 165
    .line 166
    invoke-virtual {p1, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 167
    .line 168
    .line 169
    move-result-object v1

    .line 170
    check-cast v1, Landroid/view/ViewGroup;

    .line 171
    .line 172
    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 173
    .line 174
    .line 175
    move-result-object v1

    .line 176
    check-cast v1, Lv/VFrame_Shadow;

    .line 177
    .line 178
    iput-object v1, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/MeetFeedBaseItemView;->q:Lv/VFrame_Shadow;

    .line 179
    .line 180
    invoke-virtual {p1, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 181
    .line 182
    .line 183
    move-result-object v1

    .line 184
    check-cast v1, Landroid/view/ViewGroup;

    .line 185
    .line 186
    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 187
    .line 188
    .line 189
    move-result-object v1

    .line 190
    check-cast v1, Landroid/view/ViewGroup;

    .line 191
    .line 192
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 193
    .line 194
    .line 195
    move-result-object v0

    .line 196
    check-cast v0, Landroid/widget/TextView;

    .line 197
    .line 198
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/MeetFeedBaseItemView;->r:Landroid/widget/TextView;

    .line 199
    .line 200
    const/4 v0, 0x5

    .line 201
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 202
    .line 203
    .line 204
    move-result-object v0

    .line 205
    check-cast v0, Landroid/widget/FrameLayout;

    .line 206
    .line 207
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/MeetFeedBaseItemView;->s:Landroid/widget/FrameLayout;

    .line 208
    .line 209
    const/4 v0, 0x6

    .line 210
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 211
    .line 212
    .line 213
    move-result-object v0

    .line 214
    check-cast v0, Landroid/widget/TextView;

    .line 215
    .line 216
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/MeetFeedBaseItemView;->t:Landroid/widget/TextView;

    .line 217
    .line 218
    const/4 v0, 0x7

    .line 219
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 220
    .line 221
    .line 222
    move-result-object v0

    .line 223
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/MeetFeedBaseItemView;->u:Landroid/view/View;

    .line 224
    .line 225
    const/16 v0, 0x8

    .line 226
    .line 227
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 228
    .line 229
    .line 230
    move-result-object v0

    .line 231
    check-cast v0, Landroid/widget/LinearLayout;

    .line 232
    .line 233
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/MeetFeedBaseItemView;->v:Landroid/widget/LinearLayout;

    .line 234
    .line 235
    const/16 v0, 0x9

    .line 236
    .line 237
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 238
    .line 239
    .line 240
    move-result-object p1

    .line 241
    check-cast p1, Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;

    .line 242
    .line 243
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/MeetFeedBaseItemView;->w:Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;

    .line 244
    .line 245
    return-void
.end method

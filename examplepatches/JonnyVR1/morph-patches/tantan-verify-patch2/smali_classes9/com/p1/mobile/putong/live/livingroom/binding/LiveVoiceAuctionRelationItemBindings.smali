.class public Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceAuctionRelationItemBindings;
.super Landroid/widget/LinearLayout;
.source "SourceFile"


# instance fields
.field public a:Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/dialog/relationlist/view/LiveVoiceAuctionRelationListItem;

.field public b:Lv/VText;

.field public c:Lv/VDraweeView;

.field public d:Lv/VDraweeView;

.field public e:Lv/VDraweeView;

.field public f:Lv/VDraweeView;

.field public g:Lv/VText;

.field public h:Lv/VDraweeView;

.field public i:Lv/VText;

.field public j:Lv/VText;

.field public k:Lv/VText;

.field public l:Lv/VText;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 5
    invoke-direct {p0, p1, p2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 6
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method


# virtual methods
.method public a(Landroid/view/ViewGroup;)V
    .locals 6

    .line 1
    move-object v0, p1

    .line 2
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/dialog/relationlist/view/LiveVoiceAuctionRelationListItem;

    .line 3
    .line 4
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceAuctionRelationItemBindings;->a:Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/dialog/relationlist/view/LiveVoiceAuctionRelationListItem;

    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    check-cast v1, Lv/VText;

    .line 12
    .line 13
    iput-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceAuctionRelationItemBindings;->b:Lv/VText;

    .line 14
    .line 15
    if-nez v1, :cond_0

    .line 16
    .line 17
    const-string v1, "_rank"

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    const/4 v1, 0x0

    .line 21
    :goto_0
    const/4 v2, 0x1

    .line 22
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 23
    .line 24
    .line 25
    move-result-object v3

    .line 26
    check-cast v3, Landroid/view/ViewGroup;

    .line 27
    .line 28
    invoke-virtual {v3, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 29
    .line 30
    .line 31
    move-result-object v3

    .line 32
    check-cast v3, Lv/VDraweeView;

    .line 33
    .line 34
    iput-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceAuctionRelationItemBindings;->c:Lv/VDraweeView;

    .line 35
    .line 36
    if-nez v3, :cond_1

    .line 37
    .line 38
    const-string v1, "_avatar_view"

    .line 39
    .line 40
    :cond_1
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 41
    .line 42
    .line 43
    move-result-object v3

    .line 44
    check-cast v3, Landroid/view/ViewGroup;

    .line 45
    .line 46
    invoke-virtual {v3, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 47
    .line 48
    .line 49
    move-result-object v3

    .line 50
    check-cast v3, Lv/VDraweeView;

    .line 51
    .line 52
    iput-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceAuctionRelationItemBindings;->d:Lv/VDraweeView;

    .line 53
    .line 54
    if-nez v3, :cond_2

    .line 55
    .line 56
    const-string v1, "_avatar_view_other"

    .line 57
    .line 58
    :cond_2
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 59
    .line 60
    .line 61
    move-result-object v3

    .line 62
    check-cast v3, Landroid/view/ViewGroup;

    .line 63
    .line 64
    const/4 v4, 0x2

    .line 65
    invoke-virtual {v3, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 66
    .line 67
    .line 68
    move-result-object v3

    .line 69
    check-cast v3, Lv/VDraweeView;

    .line 70
    .line 71
    iput-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceAuctionRelationItemBindings;->e:Lv/VDraweeView;

    .line 72
    .line 73
    if-nez v3, :cond_3

    .line 74
    .line 75
    const-string v1, "_avatar_tag_view"

    .line 76
    .line 77
    :cond_3
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 78
    .line 79
    .line 80
    move-result-object v3

    .line 81
    check-cast v3, Landroid/view/ViewGroup;

    .line 82
    .line 83
    const/4 v5, 0x3

    .line 84
    invoke-virtual {v3, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 85
    .line 86
    .line 87
    move-result-object v3

    .line 88
    check-cast v3, Lv/VDraweeView;

    .line 89
    .line 90
    iput-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceAuctionRelationItemBindings;->f:Lv/VDraweeView;

    .line 91
    .line 92
    if-nez v3, :cond_4

    .line 93
    .line 94
    const-string v1, "_avatar_tag_view_other"

    .line 95
    .line 96
    :cond_4
    invoke-virtual {p1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 97
    .line 98
    .line 99
    move-result-object v3

    .line 100
    check-cast v3, Landroid/view/ViewGroup;

    .line 101
    .line 102
    invoke-virtual {v3, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 103
    .line 104
    .line 105
    move-result-object v3

    .line 106
    check-cast v3, Lv/VText;

    .line 107
    .line 108
    iput-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceAuctionRelationItemBindings;->g:Lv/VText;

    .line 109
    .line 110
    if-nez v3, :cond_5

    .line 111
    .line 112
    const-string v1, "_name"

    .line 113
    .line 114
    :cond_5
    invoke-virtual {p1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 115
    .line 116
    .line 117
    move-result-object v3

    .line 118
    check-cast v3, Landroid/view/ViewGroup;

    .line 119
    .line 120
    invoke-virtual {v3, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 121
    .line 122
    .line 123
    move-result-object v3

    .line 124
    check-cast v3, Landroid/view/ViewGroup;

    .line 125
    .line 126
    invoke-virtual {v3, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 127
    .line 128
    .line 129
    move-result-object v3

    .line 130
    check-cast v3, Lv/VDraweeView;

    .line 131
    .line 132
    iput-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceAuctionRelationItemBindings;->h:Lv/VDraweeView;

    .line 133
    .line 134
    if-nez v3, :cond_6

    .line 135
    .line 136
    const-string v1, "_relation_img"

    .line 137
    .line 138
    :cond_6
    invoke-virtual {p1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 139
    .line 140
    .line 141
    move-result-object v3

    .line 142
    check-cast v3, Landroid/view/ViewGroup;

    .line 143
    .line 144
    invoke-virtual {v3, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 145
    .line 146
    .line 147
    move-result-object v3

    .line 148
    check-cast v3, Landroid/view/ViewGroup;

    .line 149
    .line 150
    invoke-virtual {v3, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 151
    .line 152
    .line 153
    move-result-object v3

    .line 154
    check-cast v3, Lv/VText;

    .line 155
    .line 156
    iput-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceAuctionRelationItemBindings;->i:Lv/VText;

    .line 157
    .line 158
    if-nez v3, :cond_7

    .line 159
    .line 160
    const-string v1, "_relation"

    .line 161
    .line 162
    :cond_7
    invoke-virtual {p1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 163
    .line 164
    .line 165
    move-result-object v3

    .line 166
    check-cast v3, Landroid/view/ViewGroup;

    .line 167
    .line 168
    invoke-virtual {v3, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 169
    .line 170
    .line 171
    move-result-object v3

    .line 172
    check-cast v3, Landroid/view/ViewGroup;

    .line 173
    .line 174
    invoke-virtual {v3, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 175
    .line 176
    .line 177
    move-result-object v3

    .line 178
    check-cast v3, Lv/VText;

    .line 179
    .line 180
    iput-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceAuctionRelationItemBindings;->j:Lv/VText;

    .line 181
    .line 182
    if-nez v3, :cond_8

    .line 183
    .line 184
    const-string v1, "_user_worth"

    .line 185
    .line 186
    :cond_8
    invoke-virtual {p1, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 187
    .line 188
    .line 189
    move-result-object v3

    .line 190
    check-cast v3, Landroid/view/ViewGroup;

    .line 191
    .line 192
    invoke-virtual {v3, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 193
    .line 194
    .line 195
    move-result-object v0

    .line 196
    check-cast v0, Lv/VText;

    .line 197
    .line 198
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceAuctionRelationItemBindings;->k:Lv/VText;

    .line 199
    .line 200
    if-nez v0, :cond_9

    .line 201
    .line 202
    const-string v1, "_level"

    .line 203
    .line 204
    :cond_9
    invoke-virtual {p1, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 205
    .line 206
    .line 207
    move-result-object p1

    .line 208
    check-cast p1, Landroid/view/ViewGroup;

    .line 209
    .line 210
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 211
    .line 212
    .line 213
    move-result-object p1

    .line 214
    check-cast p1, Lv/VText;

    .line 215
    .line 216
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceAuctionRelationItemBindings;->l:Lv/VText;

    .line 217
    .line 218
    if-nez p1, :cond_a

    .line 219
    .line 220
    const-string v1, "_validity_period"

    .line 221
    .line 222
    :cond_a
    if-nez v1, :cond_b

    .line 223
    .line 224
    return-void

    .line 225
    :cond_b
    const-string p0, "Missing required view with ID:"

    .line 226
    .line 227
    invoke-virtual {p0, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 228
    .line 229
    .line 230
    move-result-object p0

    .line 231
    invoke-static {p0}, Ll/mnd0;->a(Ljava/lang/String;)V

    .line 232
    .line 233
    .line 234
    return-void
.end method

.method public getRoot()Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/dialog/relationlist/view/LiveVoiceAuctionRelationListItem;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceAuctionRelationItemBindings;->a:Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/dialog/relationlist/view/LiveVoiceAuctionRelationListItem;

    .line 2
    .line 3
    return-object p0
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceAuctionRelationItemBindings;->a(Landroid/view/ViewGroup;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

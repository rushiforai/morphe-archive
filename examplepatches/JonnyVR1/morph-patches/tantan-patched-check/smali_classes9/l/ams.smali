.class public Ll/ams;
.super Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/BaseDialogHolder;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<P:",
        "Ll/hj2;",
        "T:",
        "Ljava/lang/Object;",
        ">",
        "Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/BaseDialogHolder<",
        "TP;TT;>;"
    }
.end annotation


# instance fields
.field public e:Landroidx/constraintlayout/widget/ConstraintLayout;

.field public f:Landroidx/constraintlayout/widget/ConstraintLayout;

.field public g:Lv/VDraweeView;

.field public h:Lv/VDraweeView;

.field public i:Lv/VText;

.field public j:Lv/VDraweeView;

.field public k:Lv/VText;

.field public l:Lcom/p1/mobile/putong/live/livingroom/increment/gift/suit/view/GiftSuitItemView;

.field public m:Lcom/p1/mobile/putong/live/livingroom/increment/gift/suit/view/GiftSuitItemView;

.field public n:Lcom/p1/mobile/putong/live/livingroom/increment/gift/suit/view/GiftSuitItemView;

.field public o:Lv/VDraweeView;

.field public p:Lv/VDraweeView;

.field public q:Landroid/view/View;

.field public r:Lcom/p1/mobile/putong/live/base/view/EmptyView;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/BaseDialogHolder;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 2

    .line 1
    sget v0, Ll/yec0;->D1:I

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
    move-object p2, p1

    .line 9
    check-cast p2, Landroid/view/ViewGroup;

    .line 10
    .line 11
    invoke-virtual {p0, p2}, Ll/ams;->u(Landroid/view/ViewGroup;)V

    .line 12
    .line 13
    .line 14
    return-object p1
.end method

.method public u(Landroid/view/ViewGroup;)V
    .locals 6

    .line 1
    move-object v0, p1

    .line 2
    check-cast v0, Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 3
    .line 4
    iput-object v0, p0, Ll/ams;->e:Landroidx/constraintlayout/widget/ConstraintLayout;

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
    check-cast v1, Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 12
    .line 13
    iput-object v1, p0, Ll/ams;->f:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 14
    .line 15
    if-nez v1, :cond_0

    .line 16
    .line 17
    const-string v1, "_content"

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    const/4 v1, 0x0

    .line 21
    :goto_0
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    check-cast v2, Landroid/view/ViewGroup;

    .line 26
    .line 27
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 28
    .line 29
    .line 30
    move-result-object v2

    .line 31
    check-cast v2, Lv/VDraweeView;

    .line 32
    .line 33
    iput-object v2, p0, Ll/ams;->g:Lv/VDraweeView;

    .line 34
    .line 35
    if-nez v2, :cond_1

    .line 36
    .line 37
    const-string v1, "_rules"

    .line 38
    .line 39
    :cond_1
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 40
    .line 41
    .line 42
    move-result-object v2

    .line 43
    check-cast v2, Landroid/view/ViewGroup;

    .line 44
    .line 45
    const/4 v3, 0x1

    .line 46
    invoke-virtual {v2, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 47
    .line 48
    .line 49
    move-result-object v2

    .line 50
    check-cast v2, Lv/VDraweeView;

    .line 51
    .line 52
    iput-object v2, p0, Ll/ams;->h:Lv/VDraweeView;

    .line 53
    .line 54
    if-nez v2, :cond_2

    .line 55
    .line 56
    const-string v1, "_count_down_bg"

    .line 57
    .line 58
    :cond_2
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 59
    .line 60
    .line 61
    move-result-object v2

    .line 62
    check-cast v2, Landroid/view/ViewGroup;

    .line 63
    .line 64
    const/4 v4, 0x2

    .line 65
    invoke-virtual {v2, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 66
    .line 67
    .line 68
    move-result-object v2

    .line 69
    check-cast v2, Lv/VText;

    .line 70
    .line 71
    iput-object v2, p0, Ll/ams;->i:Lv/VText;

    .line 72
    .line 73
    if-nez v2, :cond_3

    .line 74
    .line 75
    const-string v1, "_count_down"

    .line 76
    .line 77
    :cond_3
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 78
    .line 79
    .line 80
    move-result-object v2

    .line 81
    check-cast v2, Landroid/view/ViewGroup;

    .line 82
    .line 83
    const/4 v5, 0x3

    .line 84
    invoke-virtual {v2, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 85
    .line 86
    .line 87
    move-result-object v2

    .line 88
    check-cast v2, Lv/VDraweeView;

    .line 89
    .line 90
    iput-object v2, p0, Ll/ams;->j:Lv/VDraweeView;

    .line 91
    .line 92
    if-nez v2, :cond_4

    .line 93
    .line 94
    const-string v1, "_suit_hint_bg"

    .line 95
    .line 96
    :cond_4
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 97
    .line 98
    .line 99
    move-result-object v2

    .line 100
    check-cast v2, Landroid/view/ViewGroup;

    .line 101
    .line 102
    const/4 v5, 0x4

    .line 103
    invoke-virtual {v2, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 104
    .line 105
    .line 106
    move-result-object v2

    .line 107
    check-cast v2, Lv/VText;

    .line 108
    .line 109
    iput-object v2, p0, Ll/ams;->k:Lv/VText;

    .line 110
    .line 111
    if-nez v2, :cond_5

    .line 112
    .line 113
    const-string v1, "_suit_hint"

    .line 114
    .line 115
    :cond_5
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 116
    .line 117
    .line 118
    move-result-object v2

    .line 119
    check-cast v2, Landroid/view/ViewGroup;

    .line 120
    .line 121
    const/4 v5, 0x5

    .line 122
    invoke-virtual {v2, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 123
    .line 124
    .line 125
    move-result-object v2

    .line 126
    check-cast v2, Lcom/p1/mobile/putong/live/livingroom/increment/gift/suit/view/GiftSuitItemView;

    .line 127
    .line 128
    iput-object v2, p0, Ll/ams;->l:Lcom/p1/mobile/putong/live/livingroom/increment/gift/suit/view/GiftSuitItemView;

    .line 129
    .line 130
    if-nez v2, :cond_6

    .line 131
    .line 132
    const-string v1, "_suit_item_1"

    .line 133
    .line 134
    :cond_6
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 135
    .line 136
    .line 137
    move-result-object v2

    .line 138
    check-cast v2, Landroid/view/ViewGroup;

    .line 139
    .line 140
    const/4 v5, 0x6

    .line 141
    invoke-virtual {v2, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 142
    .line 143
    .line 144
    move-result-object v2

    .line 145
    check-cast v2, Lcom/p1/mobile/putong/live/livingroom/increment/gift/suit/view/GiftSuitItemView;

    .line 146
    .line 147
    iput-object v2, p0, Ll/ams;->m:Lcom/p1/mobile/putong/live/livingroom/increment/gift/suit/view/GiftSuitItemView;

    .line 148
    .line 149
    if-nez v2, :cond_7

    .line 150
    .line 151
    const-string v1, "_suit_item_2"

    .line 152
    .line 153
    :cond_7
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 154
    .line 155
    .line 156
    move-result-object v2

    .line 157
    check-cast v2, Landroid/view/ViewGroup;

    .line 158
    .line 159
    const/4 v5, 0x7

    .line 160
    invoke-virtual {v2, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 161
    .line 162
    .line 163
    move-result-object v2

    .line 164
    check-cast v2, Lcom/p1/mobile/putong/live/livingroom/increment/gift/suit/view/GiftSuitItemView;

    .line 165
    .line 166
    iput-object v2, p0, Ll/ams;->n:Lcom/p1/mobile/putong/live/livingroom/increment/gift/suit/view/GiftSuitItemView;

    .line 167
    .line 168
    if-nez v2, :cond_8

    .line 169
    .line 170
    const-string v1, "_suit_item_3"

    .line 171
    .line 172
    :cond_8
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 173
    .line 174
    .line 175
    move-result-object v2

    .line 176
    check-cast v2, Landroid/view/ViewGroup;

    .line 177
    .line 178
    const/16 v5, 0x8

    .line 179
    .line 180
    invoke-virtual {v2, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 181
    .line 182
    .line 183
    move-result-object v2

    .line 184
    check-cast v2, Lv/VDraweeView;

    .line 185
    .line 186
    iput-object v2, p0, Ll/ams;->o:Lv/VDraweeView;

    .line 187
    .line 188
    if-nez v2, :cond_9

    .line 189
    .line 190
    const-string v1, "_reward_bg"

    .line 191
    .line 192
    :cond_9
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 193
    .line 194
    .line 195
    move-result-object v0

    .line 196
    check-cast v0, Landroid/view/ViewGroup;

    .line 197
    .line 198
    const/16 v2, 0x9

    .line 199
    .line 200
    invoke-virtual {v0, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 201
    .line 202
    .line 203
    move-result-object v0

    .line 204
    check-cast v0, Lv/VDraweeView;

    .line 205
    .line 206
    iput-object v0, p0, Ll/ams;->p:Lv/VDraweeView;

    .line 207
    .line 208
    if-nez v0, :cond_a

    .line 209
    .line 210
    const-string v1, "_reward_icon"

    .line 211
    .line 212
    :cond_a
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 213
    .line 214
    .line 215
    move-result-object v0

    .line 216
    iput-object v0, p0, Ll/ams;->q:Landroid/view/View;

    .line 217
    .line 218
    if-nez v0, :cond_b

    .line 219
    .line 220
    const-string v1, "_safe_area_view"

    .line 221
    .line 222
    :cond_b
    invoke-virtual {p1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 223
    .line 224
    .line 225
    move-result-object p1

    .line 226
    check-cast p1, Lcom/p1/mobile/putong/live/base/view/EmptyView;

    .line 227
    .line 228
    iput-object p1, p0, Ll/ams;->r:Lcom/p1/mobile/putong/live/base/view/EmptyView;

    .line 229
    .line 230
    if-nez p1, :cond_c

    .line 231
    .line 232
    const-string v1, "_empty"

    .line 233
    .line 234
    :cond_c
    if-nez v1, :cond_d

    .line 235
    .line 236
    return-void

    .line 237
    :cond_d
    const-string p0, "Missing required view with ID:"

    .line 238
    .line 239
    invoke-virtual {p0, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 240
    .line 241
    .line 242
    move-result-object p0

    .line 243
    invoke-static {p0}, Ll/mnd0;->a(Ljava/lang/String;)V

    .line 244
    .line 245
    .line 246
    return-void
.end method

.method public v()Landroidx/constraintlayout/widget/ConstraintLayout;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ams;->e:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 2
    .line 3
    return-object p0
.end method

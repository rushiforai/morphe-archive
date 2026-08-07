.class public Ll/w7t;
.super Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/BaseDialogHolder;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<P:",
        "Ll/hj2;",
        ">",
        "Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/BaseDialogHolder<",
        "TP;",
        "Ljava/lang/String;",
        ">;"
    }
.end annotation


# instance fields
.field public e:Lv/VLinear;

.field public f:Landroid/widget/LinearLayout;

.field public g:Lv/VDraweeView;

.field public h:Landroid/widget/TextView;

.field public i:Landroid/widget/TextView;

.field public j:Landroid/widget/TextView;

.field public k:Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/CallManageItemView;

.field public l:Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/CallManageItemView;

.field public m:Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/CallManageItemView;

.field public n:Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/CallManageItemView;

.field public o:Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/CallManageItemView;

.field public p:Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/CallManageItemView;

.field public q:Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/CallManageItemView;

.field public r:Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/CallManageItemView;

.field public s:Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/CallManageItemView;


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
    sget v0, Ll/yec0;->s4:I

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
    invoke-virtual {p0, p2}, Ll/w7t;->u(Landroid/view/ViewGroup;)V

    .line 12
    .line 13
    .line 14
    return-object p1
.end method

.method public u(Landroid/view/ViewGroup;)V
    .locals 4

    .line 1
    move-object v0, p1

    .line 2
    check-cast v0, Lv/VLinear;

    .line 3
    .line 4
    iput-object v0, p0, Ll/w7t;->e:Lv/VLinear;

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
    check-cast v1, Landroid/widget/LinearLayout;

    .line 12
    .line 13
    iput-object v1, p0, Ll/w7t;->f:Landroid/widget/LinearLayout;

    .line 14
    .line 15
    if-nez v1, :cond_0

    .line 16
    .line 17
    const-string v1, "_ll_user_desc"

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
    iput-object v2, p0, Ll/w7t;->g:Lv/VDraweeView;

    .line 34
    .line 35
    if-nez v2, :cond_1

    .line 36
    .line 37
    const-string v1, "_ll_user_desc_avatar"

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
    check-cast v2, Landroid/view/ViewGroup;

    .line 51
    .line 52
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 53
    .line 54
    .line 55
    move-result-object v2

    .line 56
    check-cast v2, Landroid/widget/TextView;

    .line 57
    .line 58
    iput-object v2, p0, Ll/w7t;->h:Landroid/widget/TextView;

    .line 59
    .line 60
    if-nez v2, :cond_2

    .line 61
    .line 62
    const-string v1, "_ll_user_desc_tv_name"

    .line 63
    .line 64
    :cond_2
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 65
    .line 66
    .line 67
    move-result-object v2

    .line 68
    check-cast v2, Landroid/view/ViewGroup;

    .line 69
    .line 70
    invoke-virtual {v2, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 71
    .line 72
    .line 73
    move-result-object v2

    .line 74
    check-cast v2, Landroid/view/ViewGroup;

    .line 75
    .line 76
    invoke-virtual {v2, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 77
    .line 78
    .line 79
    move-result-object v2

    .line 80
    check-cast v2, Landroid/view/ViewGroup;

    .line 81
    .line 82
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 83
    .line 84
    .line 85
    move-result-object v2

    .line 86
    check-cast v2, Landroid/widget/TextView;

    .line 87
    .line 88
    iput-object v2, p0, Ll/w7t;->i:Landroid/widget/TextView;

    .line 89
    .line 90
    if-nez v2, :cond_3

    .line 91
    .line 92
    const-string v1, "_ll_user_desc_unit"

    .line 93
    .line 94
    :cond_3
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 95
    .line 96
    .line 97
    move-result-object v0

    .line 98
    check-cast v0, Landroid/view/ViewGroup;

    .line 99
    .line 100
    invoke-virtual {v0, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 101
    .line 102
    .line 103
    move-result-object v0

    .line 104
    check-cast v0, Landroid/view/ViewGroup;

    .line 105
    .line 106
    invoke-virtual {v0, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 107
    .line 108
    .line 109
    move-result-object v0

    .line 110
    check-cast v0, Landroid/view/ViewGroup;

    .line 111
    .line 112
    invoke-virtual {v0, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 113
    .line 114
    .line 115
    move-result-object v0

    .line 116
    check-cast v0, Landroid/widget/TextView;

    .line 117
    .line 118
    iput-object v0, p0, Ll/w7t;->j:Landroid/widget/TextView;

    .line 119
    .line 120
    if-nez v0, :cond_4

    .line 121
    .line 122
    const-string v1, "_ll_user_desc_tv_heart"

    .line 123
    .line 124
    :cond_4
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 125
    .line 126
    .line 127
    move-result-object v0

    .line 128
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/CallManageItemView;

    .line 129
    .line 130
    iput-object v0, p0, Ll/w7t;->k:Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/CallManageItemView;

    .line 131
    .line 132
    if-nez v0, :cond_5

    .line 133
    .line 134
    const-string v1, "_send_gift"

    .line 135
    .line 136
    :cond_5
    const/4 v0, 0x2

    .line 137
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 138
    .line 139
    .line 140
    move-result-object v0

    .line 141
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/CallManageItemView;

    .line 142
    .line 143
    iput-object v0, p0, Ll/w7t;->l:Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/CallManageItemView;

    .line 144
    .line 145
    if-nez v0, :cond_6

    .line 146
    .line 147
    const-string v1, "_mute"

    .line 148
    .line 149
    :cond_6
    const/4 v0, 0x3

    .line 150
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 151
    .line 152
    .line 153
    move-result-object v0

    .line 154
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/CallManageItemView;

    .line 155
    .line 156
    iput-object v0, p0, Ll/w7t;->m:Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/CallManageItemView;

    .line 157
    .line 158
    if-nez v0, :cond_7

    .line 159
    .line 160
    const-string v1, "_lead_role"

    .line 161
    .line 162
    :cond_7
    const/4 v0, 0x4

    .line 163
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 164
    .line 165
    .line 166
    move-result-object v0

    .line 167
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/CallManageItemView;

    .line 168
    .line 169
    iput-object v0, p0, Ll/w7t;->n:Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/CallManageItemView;

    .line 170
    .line 171
    if-nez v0, :cond_8

    .line 172
    .line 173
    const-string v1, "_beauty"

    .line 174
    .line 175
    :cond_8
    const/4 v0, 0x5

    .line 176
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 177
    .line 178
    .line 179
    move-result-object v0

    .line 180
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/CallManageItemView;

    .line 181
    .line 182
    iput-object v0, p0, Ll/w7t;->o:Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/CallManageItemView;

    .line 183
    .line 184
    if-nez v0, :cond_9

    .line 185
    .line 186
    const-string v1, "_switch_camera"

    .line 187
    .line 188
    :cond_9
    const/4 v0, 0x6

    .line 189
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 190
    .line 191
    .line 192
    move-result-object v0

    .line 193
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/CallManageItemView;

    .line 194
    .line 195
    iput-object v0, p0, Ll/w7t;->p:Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/CallManageItemView;

    .line 196
    .line 197
    if-nez v0, :cond_a

    .line 198
    .line 199
    const-string v1, "_switch_video_call"

    .line 200
    .line 201
    :cond_a
    const/4 v0, 0x7

    .line 202
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 203
    .line 204
    .line 205
    move-result-object v0

    .line 206
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/CallManageItemView;

    .line 207
    .line 208
    iput-object v0, p0, Ll/w7t;->q:Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/CallManageItemView;

    .line 209
    .line 210
    if-nez v0, :cond_b

    .line 211
    .line 212
    const-string v1, "_invite_video_call"

    .line 213
    .line 214
    :cond_b
    const/16 v0, 0x8

    .line 215
    .line 216
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 217
    .line 218
    .line 219
    move-result-object v0

    .line 220
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/CallManageItemView;

    .line 221
    .line 222
    iput-object v0, p0, Ll/w7t;->r:Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/CallManageItemView;

    .line 223
    .line 224
    if-nez v0, :cond_c

    .line 225
    .line 226
    const-string v1, "_call_fans"

    .line 227
    .line 228
    :cond_c
    const/16 v0, 0x9

    .line 229
    .line 230
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 231
    .line 232
    .line 233
    move-result-object p1

    .line 234
    check-cast p1, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/CallManageItemView;

    .line 235
    .line 236
    iput-object p1, p0, Ll/w7t;->s:Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/CallManageItemView;

    .line 237
    .line 238
    if-nez p1, :cond_d

    .line 239
    .line 240
    const-string v1, "_end"

    .line 241
    .line 242
    :cond_d
    if-nez v1, :cond_e

    .line 243
    .line 244
    return-void

    .line 245
    :cond_e
    const-string p0, "Missing required view with ID:"

    .line 246
    .line 247
    invoke-virtual {p0, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 248
    .line 249
    .line 250
    move-result-object p0

    .line 251
    invoke-static {p0}, Ll/mnd0;->a(Ljava/lang/String;)V

    .line 252
    .line 253
    .line 254
    return-void
.end method

.class public Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceCallAuctionViewBindings;
.super Landroid/widget/FrameLayout;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T::",
        "Ll/k3m;",
        ">",
        "Landroid/widget/FrameLayout;",
        "Ll/iam<",
        "TT;>;"
    }
.end annotation


# instance fields
.field public A:Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonAnimMaskAvatarView;

.field public B:Landroid/widget/TextView;

.field public C:Lv/VText;

.field public D:Lv/VDraweeView;

.field public E:Landroid/widget/TextView;

.field public E0:Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;

.field public F:Lv/VText;

.field public F0:Lv/VText;

.field public G:Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/view/LevelView;

.field public G0:Lv/VText;

.field public H:Landroidx/constraintlayout/widget/ConstraintLayout;

.field public H0:Landroid/widget/TextView;

.field public I:Lv/VDraweeView;

.field public I0:Lv/VLinear;

.field public J:Lv/VText;

.field public J0:Lv/VText;

.field public K:Lv/VText;

.field public K0:Lv/VText;

.field public L:Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;

.field public M:Lv/VText;

.field public N:Lv/VText;

.field public O:Landroidx/constraintlayout/widget/ConstraintLayout;

.field public P:Lv/VDraweeView;

.field public Q:Lv/VText;

.field public R:Lv/VText;

.field public S:Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;

.field public T:Lv/VText;

.field public U:Lv/VText;

.field public V:Landroidx/constraintlayout/widget/ConstraintLayout;

.field public W:Lv/VDraweeView;

.field public a:Ll/k3m;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TT;"
        }
    .end annotation
.end field

.field public b:Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/view/LiveVoiceCallAuctionView;

.field public c:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

.field public d:Lcom/p1/mobile/putong/live/livingroom/virtual/virtualmotion/creator/functionpanel/collapse/LiveVirtualVoicePanelCollapseView;

.field public e:Landroidx/constraintlayout/widget/ConstraintLayout;

.field public f:Landroidx/constraintlayout/widget/Group;

.field public g:Landroidx/constraintlayout/widget/Group;

.field public h:Landroidx/constraintlayout/widget/Group;

.field public i:Landroidx/constraintlayout/widget/Guideline;

.field public j:Lv/VText;

.field public k:Lv/VText;

.field public k0:Lv/VText;

.field public l:Lv/VLinear;

.field public m:Lv/VDraweeView;

.field public n:Landroid/widget/TextView;

.field public o:Lv/VDraweeView;

.field public p:Landroid/widget/TextView;

.field public p0:Lv/VText;

.field public q:Lv/VText;

.field public r:Lv/VDraweeView;

.field public s:Lv/VDraweeView;

.field public t:Landroid/widget/TextView;

.field public u:Lv/VText;

.field public v:Lv/VDraweeView;

.field public w:Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/view/VoiceAuctionAvatarView;

.field public x:Lv/VDraweeView;

.field public y:Lv/VDraweeView;

.field public z:Lv/VDraweeView;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 5
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 6
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceCallAuctionViewBindings;->getRoot()Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/view/LiveVoiceCallAuctionView;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public a(Landroid/view/ViewGroup;)V
    .locals 8

    .line 1
    move-object v0, p1

    .line 2
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/view/LiveVoiceCallAuctionView;

    .line 3
    .line 4
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceCallAuctionViewBindings;->b:Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/view/LiveVoiceCallAuctionView;

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
    check-cast v1, Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 12
    .line 13
    iput-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceCallAuctionViewBindings;->c:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 14
    .line 15
    if-nez v1, :cond_0

    .line 16
    .line 17
    const-string v1, "_panel_bg"

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
    check-cast v3, Lcom/p1/mobile/putong/live/livingroom/virtual/virtualmotion/creator/functionpanel/collapse/LiveVirtualVoicePanelCollapseView;

    .line 27
    .line 28
    iput-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceCallAuctionViewBindings;->d:Lcom/p1/mobile/putong/live/livingroom/virtual/virtualmotion/creator/functionpanel/collapse/LiveVirtualVoicePanelCollapseView;

    .line 29
    .line 30
    if-nez v3, :cond_1

    .line 31
    .line 32
    const-string v1, "_collapse_view"

    .line 33
    .line 34
    :cond_1
    const/4 v3, 0x2

    .line 35
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 36
    .line 37
    .line 38
    move-result-object v4

    .line 39
    check-cast v4, Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 40
    .line 41
    iput-object v4, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceCallAuctionViewBindings;->e:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 42
    .line 43
    if-nez v4, :cond_2

    .line 44
    .line 45
    const-string v1, "_content"

    .line 46
    .line 47
    :cond_2
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 48
    .line 49
    .line 50
    move-result-object v4

    .line 51
    check-cast v4, Landroid/view/ViewGroup;

    .line 52
    .line 53
    invoke-virtual {v4, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 54
    .line 55
    .line 56
    move-result-object v4

    .line 57
    check-cast v4, Landroidx/constraintlayout/widget/Group;

    .line 58
    .line 59
    iput-object v4, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceCallAuctionViewBindings;->f:Landroidx/constraintlayout/widget/Group;

    .line 60
    .line 61
    if-nez v4, :cond_3

    .line 62
    .line 63
    const-string v1, "_final_group"

    .line 64
    .line 65
    :cond_3
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 66
    .line 67
    .line 68
    move-result-object v4

    .line 69
    check-cast v4, Landroid/view/ViewGroup;

    .line 70
    .line 71
    invoke-virtual {v4, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 72
    .line 73
    .line 74
    move-result-object v4

    .line 75
    check-cast v4, Landroidx/constraintlayout/widget/Group;

    .line 76
    .line 77
    iput-object v4, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceCallAuctionViewBindings;->g:Landroidx/constraintlayout/widget/Group;

    .line 78
    .line 79
    if-nez v4, :cond_4

    .line 80
    .line 81
    const-string v1, "_ongoing_auctioneer_group"

    .line 82
    .line 83
    :cond_4
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 84
    .line 85
    .line 86
    move-result-object v4

    .line 87
    check-cast v4, Landroid/view/ViewGroup;

    .line 88
    .line 89
    invoke-virtual {v4, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 90
    .line 91
    .line 92
    move-result-object v4

    .line 93
    check-cast v4, Landroidx/constraintlayout/widget/Group;

    .line 94
    .line 95
    iput-object v4, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceCallAuctionViewBindings;->h:Landroidx/constraintlayout/widget/Group;

    .line 96
    .line 97
    if-nez v4, :cond_5

    .line 98
    .line 99
    const-string v1, "_ongoing_group"

    .line 100
    .line 101
    :cond_5
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 102
    .line 103
    .line 104
    move-result-object v4

    .line 105
    check-cast v4, Landroid/view/ViewGroup;

    .line 106
    .line 107
    const/4 v5, 0x3

    .line 108
    invoke-virtual {v4, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 109
    .line 110
    .line 111
    move-result-object v4

    .line 112
    check-cast v4, Landroidx/constraintlayout/widget/Guideline;

    .line 113
    .line 114
    iput-object v4, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceCallAuctionViewBindings;->i:Landroidx/constraintlayout/widget/Guideline;

    .line 115
    .line 116
    if-nez v4, :cond_6

    .line 117
    .line 118
    const-string v1, "_top_baseline"

    .line 119
    .line 120
    :cond_6
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 121
    .line 122
    .line 123
    move-result-object v4

    .line 124
    check-cast v4, Landroid/view/ViewGroup;

    .line 125
    .line 126
    const/4 v6, 0x4

    .line 127
    invoke-virtual {v4, v6}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 128
    .line 129
    .line 130
    move-result-object v4

    .line 131
    check-cast v4, Lv/VText;

    .line 132
    .line 133
    iput-object v4, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceCallAuctionViewBindings;->j:Lv/VText;

    .line 134
    .line 135
    if-nez v4, :cond_7

    .line 136
    .line 137
    const-string v1, "_live_bidder_start"

    .line 138
    .line 139
    :cond_7
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 140
    .line 141
    .line 142
    move-result-object v4

    .line 143
    check-cast v4, Landroid/view/ViewGroup;

    .line 144
    .line 145
    const/4 v7, 0x5

    .line 146
    invoke-virtual {v4, v7}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 147
    .line 148
    .line 149
    move-result-object v4

    .line 150
    check-cast v4, Lv/VText;

    .line 151
    .line 152
    iput-object v4, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceCallAuctionViewBindings;->k:Lv/VText;

    .line 153
    .line 154
    if-nez v4, :cond_8

    .line 155
    .line 156
    const-string v1, "_auction_step_action"

    .line 157
    .line 158
    :cond_8
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 159
    .line 160
    .line 161
    move-result-object v4

    .line 162
    check-cast v4, Landroid/view/ViewGroup;

    .line 163
    .line 164
    const/4 v7, 0x6

    .line 165
    invoke-virtual {v4, v7}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 166
    .line 167
    .line 168
    move-result-object v4

    .line 169
    check-cast v4, Lv/VLinear;

    .line 170
    .line 171
    iput-object v4, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceCallAuctionViewBindings;->l:Lv/VLinear;

    .line 172
    .line 173
    if-nez v4, :cond_9

    .line 174
    .line 175
    const-string v1, "_live_final_relation_layout"

    .line 176
    .line 177
    :cond_9
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 178
    .line 179
    .line 180
    move-result-object v4

    .line 181
    check-cast v4, Landroid/view/ViewGroup;

    .line 182
    .line 183
    invoke-virtual {v4, v7}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 184
    .line 185
    .line 186
    move-result-object v4

    .line 187
    check-cast v4, Landroid/view/ViewGroup;

    .line 188
    .line 189
    invoke-virtual {v4, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 190
    .line 191
    .line 192
    move-result-object v4

    .line 193
    check-cast v4, Lv/VDraweeView;

    .line 194
    .line 195
    iput-object v4, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceCallAuctionViewBindings;->m:Lv/VDraweeView;

    .line 196
    .line 197
    if-nez v4, :cond_a

    .line 198
    .line 199
    const-string v1, "_live_final_relation_layout_final_relation_img"

    .line 200
    .line 201
    :cond_a
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 202
    .line 203
    .line 204
    move-result-object v4

    .line 205
    check-cast v4, Landroid/view/ViewGroup;

    .line 206
    .line 207
    invoke-virtual {v4, v7}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 208
    .line 209
    .line 210
    move-result-object v4

    .line 211
    check-cast v4, Landroid/view/ViewGroup;

    .line 212
    .line 213
    invoke-virtual {v4, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 214
    .line 215
    .line 216
    move-result-object v4

    .line 217
    check-cast v4, Landroid/widget/TextView;

    .line 218
    .line 219
    iput-object v4, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceCallAuctionViewBindings;->n:Landroid/widget/TextView;

    .line 220
    .line 221
    if-nez v4, :cond_b

    .line 222
    .line 223
    const-string v1, "_live_final_relation_layout_final_relation_name"

    .line 224
    .line 225
    :cond_b
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 226
    .line 227
    .line 228
    move-result-object v4

    .line 229
    check-cast v4, Landroid/view/ViewGroup;

    .line 230
    .line 231
    const/4 v7, 0x7

    .line 232
    invoke-virtual {v4, v7}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 233
    .line 234
    .line 235
    move-result-object v4

    .line 236
    check-cast v4, Lv/VDraweeView;

    .line 237
    .line 238
    iput-object v4, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceCallAuctionViewBindings;->o:Lv/VDraweeView;

    .line 239
    .line 240
    if-nez v4, :cond_c

    .line 241
    .line 242
    const-string v1, "_live_final_bidder_avatar"

    .line 243
    .line 244
    :cond_c
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 245
    .line 246
    .line 247
    move-result-object v4

    .line 248
    check-cast v4, Landroid/view/ViewGroup;

    .line 249
    .line 250
    const/16 v7, 0x8

    .line 251
    .line 252
    invoke-virtual {v4, v7}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 253
    .line 254
    .line 255
    move-result-object v4

    .line 256
    check-cast v4, Landroid/widget/TextView;

    .line 257
    .line 258
    iput-object v4, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceCallAuctionViewBindings;->p:Landroid/widget/TextView;

    .line 259
    .line 260
    if-nez v4, :cond_d

    .line 261
    .line 262
    const-string v1, "_live_final_bidder_name"

    .line 263
    .line 264
    :cond_d
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 265
    .line 266
    .line 267
    move-result-object v4

    .line 268
    check-cast v4, Landroid/view/ViewGroup;

    .line 269
    .line 270
    const/16 v7, 0x9

    .line 271
    .line 272
    invoke-virtual {v4, v7}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 273
    .line 274
    .line 275
    move-result-object v4

    .line 276
    check-cast v4, Lv/VText;

    .line 277
    .line 278
    iput-object v4, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceCallAuctionViewBindings;->q:Lv/VText;

    .line 279
    .line 280
    if-nez v4, :cond_e

    .line 281
    .line 282
    const-string v1, "_live_final_bidder_value"

    .line 283
    .line 284
    :cond_e
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 285
    .line 286
    .line 287
    move-result-object v4

    .line 288
    check-cast v4, Landroid/view/ViewGroup;

    .line 289
    .line 290
    const/16 v7, 0xa

    .line 291
    .line 292
    invoke-virtual {v4, v7}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 293
    .line 294
    .line 295
    move-result-object v4

    .line 296
    check-cast v4, Lv/VDraweeView;

    .line 297
    .line 298
    iput-object v4, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceCallAuctionViewBindings;->r:Lv/VDraweeView;

    .line 299
    .line 300
    if-nez v4, :cond_f

    .line 301
    .line 302
    const-string v1, "_live_final_bidder_tag"

    .line 303
    .line 304
    :cond_f
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 305
    .line 306
    .line 307
    move-result-object v4

    .line 308
    check-cast v4, Landroid/view/ViewGroup;

    .line 309
    .line 310
    const/16 v7, 0xb

    .line 311
    .line 312
    invoke-virtual {v4, v7}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 313
    .line 314
    .line 315
    move-result-object v4

    .line 316
    check-cast v4, Lv/VDraweeView;

    .line 317
    .line 318
    iput-object v4, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceCallAuctionViewBindings;->s:Lv/VDraweeView;

    .line 319
    .line 320
    if-nez v4, :cond_10

    .line 321
    .line 322
    const-string v1, "_live_final_auctioneer_avatar"

    .line 323
    .line 324
    :cond_10
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 325
    .line 326
    .line 327
    move-result-object v4

    .line 328
    check-cast v4, Landroid/view/ViewGroup;

    .line 329
    .line 330
    const/16 v7, 0xc

    .line 331
    .line 332
    invoke-virtual {v4, v7}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 333
    .line 334
    .line 335
    move-result-object v4

    .line 336
    check-cast v4, Landroid/widget/TextView;

    .line 337
    .line 338
    iput-object v4, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceCallAuctionViewBindings;->t:Landroid/widget/TextView;

    .line 339
    .line 340
    if-nez v4, :cond_11

    .line 341
    .line 342
    const-string v1, "_live_final_auctioneer_name"

    .line 343
    .line 344
    :cond_11
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 345
    .line 346
    .line 347
    move-result-object v4

    .line 348
    check-cast v4, Landroid/view/ViewGroup;

    .line 349
    .line 350
    const/16 v7, 0xd

    .line 351
    .line 352
    invoke-virtual {v4, v7}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 353
    .line 354
    .line 355
    move-result-object v4

    .line 356
    check-cast v4, Lv/VText;

    .line 357
    .line 358
    iput-object v4, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceCallAuctionViewBindings;->u:Lv/VText;

    .line 359
    .line 360
    if-nez v4, :cond_12

    .line 361
    .line 362
    const-string v1, "_live_final_auctioneer_value"

    .line 363
    .line 364
    :cond_12
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 365
    .line 366
    .line 367
    move-result-object v4

    .line 368
    check-cast v4, Landroid/view/ViewGroup;

    .line 369
    .line 370
    const/16 v7, 0xe

    .line 371
    .line 372
    invoke-virtual {v4, v7}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 373
    .line 374
    .line 375
    move-result-object v4

    .line 376
    check-cast v4, Lv/VDraweeView;

    .line 377
    .line 378
    iput-object v4, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceCallAuctionViewBindings;->v:Lv/VDraweeView;

    .line 379
    .line 380
    if-nez v4, :cond_13

    .line 381
    .line 382
    const-string v1, "_live_final_auctioneer_tag"

    .line 383
    .line 384
    :cond_13
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 385
    .line 386
    .line 387
    move-result-object v4

    .line 388
    check-cast v4, Landroid/view/ViewGroup;

    .line 389
    .line 390
    const/16 v7, 0xf

    .line 391
    .line 392
    invoke-virtual {v4, v7}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 393
    .line 394
    .line 395
    move-result-object v4

    .line 396
    check-cast v4, Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/view/VoiceAuctionAvatarView;

    .line 397
    .line 398
    iput-object v4, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceCallAuctionViewBindings;->w:Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/view/VoiceAuctionAvatarView;

    .line 399
    .line 400
    if-nez v4, :cond_14

    .line 401
    .line 402
    const-string v1, "_live_auctioneer_avatar"

    .line 403
    .line 404
    :cond_14
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 405
    .line 406
    .line 407
    move-result-object v4

    .line 408
    check-cast v4, Landroid/view/ViewGroup;

    .line 409
    .line 410
    invoke-virtual {v4, v7}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 411
    .line 412
    .line 413
    move-result-object v4

    .line 414
    check-cast v4, Landroid/view/ViewGroup;

    .line 415
    .line 416
    invoke-virtual {v4, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 417
    .line 418
    .line 419
    move-result-object v4

    .line 420
    check-cast v4, Lv/VDraweeView;

    .line 421
    .line 422
    iput-object v4, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceCallAuctionViewBindings;->x:Lv/VDraweeView;

    .line 423
    .line 424
    if-nez v4, :cond_15

    .line 425
    .line 426
    const-string v1, "_avatar_3"

    .line 427
    .line 428
    :cond_15
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 429
    .line 430
    .line 431
    move-result-object v4

    .line 432
    check-cast v4, Landroid/view/ViewGroup;

    .line 433
    .line 434
    invoke-virtual {v4, v7}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 435
    .line 436
    .line 437
    move-result-object v4

    .line 438
    check-cast v4, Landroid/view/ViewGroup;

    .line 439
    .line 440
    invoke-virtual {v4, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 441
    .line 442
    .line 443
    move-result-object v4

    .line 444
    check-cast v4, Lv/VDraweeView;

    .line 445
    .line 446
    iput-object v4, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceCallAuctionViewBindings;->y:Lv/VDraweeView;

    .line 447
    .line 448
    if-nez v4, :cond_16

    .line 449
    .line 450
    const-string v1, "_avatar_2"

    .line 451
    .line 452
    :cond_16
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 453
    .line 454
    .line 455
    move-result-object v4

    .line 456
    check-cast v4, Landroid/view/ViewGroup;

    .line 457
    .line 458
    invoke-virtual {v4, v7}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 459
    .line 460
    .line 461
    move-result-object v4

    .line 462
    check-cast v4, Landroid/view/ViewGroup;

    .line 463
    .line 464
    invoke-virtual {v4, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 465
    .line 466
    .line 467
    move-result-object v4

    .line 468
    check-cast v4, Lv/VDraweeView;

    .line 469
    .line 470
    iput-object v4, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceCallAuctionViewBindings;->z:Lv/VDraweeView;

    .line 471
    .line 472
    if-nez v4, :cond_17

    .line 473
    .line 474
    const-string v1, "_avatar_1"

    .line 475
    .line 476
    :cond_17
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 477
    .line 478
    .line 479
    move-result-object v4

    .line 480
    check-cast v4, Landroid/view/ViewGroup;

    .line 481
    .line 482
    const/16 v7, 0x10

    .line 483
    .line 484
    invoke-virtual {v4, v7}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 485
    .line 486
    .line 487
    move-result-object v4

    .line 488
    check-cast v4, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonAnimMaskAvatarView;

    .line 489
    .line 490
    iput-object v4, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceCallAuctionViewBindings;->A:Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonAnimMaskAvatarView;

    .line 491
    .line 492
    if-nez v4, :cond_18

    .line 493
    .line 494
    const-string v1, "_virtual_avatar_view"

    .line 495
    .line 496
    :cond_18
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 497
    .line 498
    .line 499
    move-result-object v4

    .line 500
    check-cast v4, Landroid/view/ViewGroup;

    .line 501
    .line 502
    const/16 v7, 0x11

    .line 503
    .line 504
    invoke-virtual {v4, v7}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 505
    .line 506
    .line 507
    move-result-object v4

    .line 508
    check-cast v4, Landroid/widget/TextView;

    .line 509
    .line 510
    iput-object v4, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceCallAuctionViewBindings;->B:Landroid/widget/TextView;

    .line 511
    .line 512
    if-nez v4, :cond_19

    .line 513
    .line 514
    const-string v1, "_live_auctioneer_name"

    .line 515
    .line 516
    :cond_19
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 517
    .line 518
    .line 519
    move-result-object v4

    .line 520
    check-cast v4, Landroid/view/ViewGroup;

    .line 521
    .line 522
    const/16 v7, 0x12

    .line 523
    .line 524
    invoke-virtual {v4, v7}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 525
    .line 526
    .line 527
    move-result-object v4

    .line 528
    check-cast v4, Lv/VText;

    .line 529
    .line 530
    iput-object v4, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceCallAuctionViewBindings;->C:Lv/VText;

    .line 531
    .line 532
    if-nez v4, :cond_1a

    .line 533
    .line 534
    const-string v1, "_live_auctioneer_value"

    .line 535
    .line 536
    :cond_1a
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 537
    .line 538
    .line 539
    move-result-object v4

    .line 540
    check-cast v4, Landroid/view/ViewGroup;

    .line 541
    .line 542
    const/16 v7, 0x13

    .line 543
    .line 544
    invoke-virtual {v4, v7}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 545
    .line 546
    .line 547
    move-result-object v4

    .line 548
    check-cast v4, Lv/VDraweeView;

    .line 549
    .line 550
    iput-object v4, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceCallAuctionViewBindings;->D:Lv/VDraweeView;

    .line 551
    .line 552
    if-nez v4, :cond_1b

    .line 553
    .line 554
    const-string v1, "_live_relation_img"

    .line 555
    .line 556
    :cond_1b
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 557
    .line 558
    .line 559
    move-result-object v4

    .line 560
    check-cast v4, Landroid/view/ViewGroup;

    .line 561
    .line 562
    const/16 v7, 0x14

    .line 563
    .line 564
    invoke-virtual {v4, v7}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 565
    .line 566
    .line 567
    move-result-object v4

    .line 568
    check-cast v4, Landroid/widget/TextView;

    .line 569
    .line 570
    iput-object v4, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceCallAuctionViewBindings;->E:Landroid/widget/TextView;

    .line 571
    .line 572
    if-nez v4, :cond_1c

    .line 573
    .line 574
    const-string v1, "_live_relation_name"

    .line 575
    .line 576
    :cond_1c
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 577
    .line 578
    .line 579
    move-result-object v4

    .line 580
    check-cast v4, Landroid/view/ViewGroup;

    .line 581
    .line 582
    const/16 v7, 0x15

    .line 583
    .line 584
    invoke-virtual {v4, v7}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 585
    .line 586
    .line 587
    move-result-object v4

    .line 588
    check-cast v4, Lv/VText;

    .line 589
    .line 590
    iput-object v4, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceCallAuctionViewBindings;->F:Lv/VText;

    .line 591
    .line 592
    if-nez v4, :cond_1d

    .line 593
    .line 594
    const-string v1, "_live_relation_tip"

    .line 595
    .line 596
    :cond_1d
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 597
    .line 598
    .line 599
    move-result-object v4

    .line 600
    check-cast v4, Landroid/view/ViewGroup;

    .line 601
    .line 602
    const/16 v7, 0x16

    .line 603
    .line 604
    invoke-virtual {v4, v7}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 605
    .line 606
    .line 607
    move-result-object v4

    .line 608
    check-cast v4, Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/view/LevelView;

    .line 609
    .line 610
    iput-object v4, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceCallAuctionViewBindings;->G:Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/view/LevelView;

    .line 611
    .line 612
    if-nez v4, :cond_1e

    .line 613
    .line 614
    const-string v1, "_auctioneer_level"

    .line 615
    .line 616
    :cond_1e
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 617
    .line 618
    .line 619
    move-result-object v4

    .line 620
    check-cast v4, Landroid/view/ViewGroup;

    .line 621
    .line 622
    const/16 v7, 0x17

    .line 623
    .line 624
    invoke-virtual {v4, v7}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 625
    .line 626
    .line 627
    move-result-object v4

    .line 628
    check-cast v4, Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 629
    .line 630
    iput-object v4, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceCallAuctionViewBindings;->H:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 631
    .line 632
    if-nez v4, :cond_1f

    .line 633
    .line 634
    const-string v1, "_live_bidder_order_1"

    .line 635
    .line 636
    :cond_1f
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 637
    .line 638
    .line 639
    move-result-object v4

    .line 640
    check-cast v4, Landroid/view/ViewGroup;

    .line 641
    .line 642
    invoke-virtual {v4, v7}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 643
    .line 644
    .line 645
    move-result-object v4

    .line 646
    check-cast v4, Landroid/view/ViewGroup;

    .line 647
    .line 648
    invoke-virtual {v4, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 649
    .line 650
    .line 651
    move-result-object v4

    .line 652
    check-cast v4, Lv/VDraweeView;

    .line 653
    .line 654
    iput-object v4, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceCallAuctionViewBindings;->I:Lv/VDraweeView;

    .line 655
    .line 656
    if-nez v4, :cond_20

    .line 657
    .line 658
    const-string v1, "_live_bidder_order_1_bidder_bg"

    .line 659
    .line 660
    :cond_20
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 661
    .line 662
    .line 663
    move-result-object v4

    .line 664
    check-cast v4, Landroid/view/ViewGroup;

    .line 665
    .line 666
    invoke-virtual {v4, v7}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 667
    .line 668
    .line 669
    move-result-object v4

    .line 670
    check-cast v4, Landroid/view/ViewGroup;

    .line 671
    .line 672
    invoke-virtual {v4, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 673
    .line 674
    .line 675
    move-result-object v4

    .line 676
    check-cast v4, Lv/VText;

    .line 677
    .line 678
    iput-object v4, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceCallAuctionViewBindings;->J:Lv/VText;

    .line 679
    .line 680
    if-nez v4, :cond_21

    .line 681
    .line 682
    const-string v1, "_live_bidder_order_1_bidder_price"

    .line 683
    .line 684
    :cond_21
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 685
    .line 686
    .line 687
    move-result-object v4

    .line 688
    check-cast v4, Landroid/view/ViewGroup;

    .line 689
    .line 690
    invoke-virtual {v4, v7}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 691
    .line 692
    .line 693
    move-result-object v4

    .line 694
    check-cast v4, Landroid/view/ViewGroup;

    .line 695
    .line 696
    invoke-virtual {v4, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 697
    .line 698
    .line 699
    move-result-object v4

    .line 700
    check-cast v4, Lv/VText;

    .line 701
    .line 702
    iput-object v4, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceCallAuctionViewBindings;->K:Lv/VText;

    .line 703
    .line 704
    if-nez v4, :cond_22

    .line 705
    .line 706
    const-string v1, "_live_bidder_order_1_bidder_empty_order"

    .line 707
    .line 708
    :cond_22
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 709
    .line 710
    .line 711
    move-result-object v4

    .line 712
    check-cast v4, Landroid/view/ViewGroup;

    .line 713
    .line 714
    invoke-virtual {v4, v7}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 715
    .line 716
    .line 717
    move-result-object v4

    .line 718
    check-cast v4, Landroid/view/ViewGroup;

    .line 719
    .line 720
    invoke-virtual {v4, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 721
    .line 722
    .line 723
    move-result-object v4

    .line 724
    check-cast v4, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;

    .line 725
    .line 726
    iput-object v4, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceCallAuctionViewBindings;->L:Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;

    .line 727
    .line 728
    if-nez v4, :cond_23

    .line 729
    .line 730
    const-string v1, "_live_bidder_order_1_bidder_avatar"

    .line 731
    .line 732
    :cond_23
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 733
    .line 734
    .line 735
    move-result-object v4

    .line 736
    check-cast v4, Landroid/view/ViewGroup;

    .line 737
    .line 738
    invoke-virtual {v4, v7}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 739
    .line 740
    .line 741
    move-result-object v4

    .line 742
    check-cast v4, Landroid/view/ViewGroup;

    .line 743
    .line 744
    invoke-virtual {v4, v6}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 745
    .line 746
    .line 747
    move-result-object v4

    .line 748
    check-cast v4, Landroid/view/ViewGroup;

    .line 749
    .line 750
    invoke-virtual {v4, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 751
    .line 752
    .line 753
    move-result-object v4

    .line 754
    check-cast v4, Lv/VText;

    .line 755
    .line 756
    iput-object v4, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceCallAuctionViewBindings;->M:Lv/VText;

    .line 757
    .line 758
    if-nez v4, :cond_24

    .line 759
    .line 760
    const-string v1, "_live_bidder_order_1_bidder_order"

    .line 761
    .line 762
    :cond_24
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 763
    .line 764
    .line 765
    move-result-object v4

    .line 766
    check-cast v4, Landroid/view/ViewGroup;

    .line 767
    .line 768
    invoke-virtual {v4, v7}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 769
    .line 770
    .line 771
    move-result-object v4

    .line 772
    check-cast v4, Landroid/view/ViewGroup;

    .line 773
    .line 774
    invoke-virtual {v4, v6}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 775
    .line 776
    .line 777
    move-result-object v4

    .line 778
    check-cast v4, Landroid/view/ViewGroup;

    .line 779
    .line 780
    invoke-virtual {v4, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 781
    .line 782
    .line 783
    move-result-object v4

    .line 784
    check-cast v4, Lv/VText;

    .line 785
    .line 786
    iput-object v4, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceCallAuctionViewBindings;->N:Lv/VText;

    .line 787
    .line 788
    if-nez v4, :cond_25

    .line 789
    .line 790
    const-string v1, "_live_bidder_order_1_bidder_name"

    .line 791
    .line 792
    :cond_25
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 793
    .line 794
    .line 795
    move-result-object v4

    .line 796
    check-cast v4, Landroid/view/ViewGroup;

    .line 797
    .line 798
    const/16 v7, 0x18

    .line 799
    .line 800
    invoke-virtual {v4, v7}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 801
    .line 802
    .line 803
    move-result-object v4

    .line 804
    check-cast v4, Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 805
    .line 806
    iput-object v4, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceCallAuctionViewBindings;->O:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 807
    .line 808
    if-nez v4, :cond_26

    .line 809
    .line 810
    const-string v1, "_live_bidder_order_2"

    .line 811
    .line 812
    :cond_26
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 813
    .line 814
    .line 815
    move-result-object v4

    .line 816
    check-cast v4, Landroid/view/ViewGroup;

    .line 817
    .line 818
    invoke-virtual {v4, v7}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 819
    .line 820
    .line 821
    move-result-object v4

    .line 822
    check-cast v4, Landroid/view/ViewGroup;

    .line 823
    .line 824
    invoke-virtual {v4, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 825
    .line 826
    .line 827
    move-result-object v4

    .line 828
    check-cast v4, Lv/VDraweeView;

    .line 829
    .line 830
    iput-object v4, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceCallAuctionViewBindings;->P:Lv/VDraweeView;

    .line 831
    .line 832
    if-nez v4, :cond_27

    .line 833
    .line 834
    const-string v1, "_live_bidder_order_2_bidder_bg"

    .line 835
    .line 836
    :cond_27
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 837
    .line 838
    .line 839
    move-result-object v4

    .line 840
    check-cast v4, Landroid/view/ViewGroup;

    .line 841
    .line 842
    invoke-virtual {v4, v7}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 843
    .line 844
    .line 845
    move-result-object v4

    .line 846
    check-cast v4, Landroid/view/ViewGroup;

    .line 847
    .line 848
    invoke-virtual {v4, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 849
    .line 850
    .line 851
    move-result-object v4

    .line 852
    check-cast v4, Lv/VText;

    .line 853
    .line 854
    iput-object v4, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceCallAuctionViewBindings;->Q:Lv/VText;

    .line 855
    .line 856
    if-nez v4, :cond_28

    .line 857
    .line 858
    const-string v1, "_live_bidder_order_2_bidder_price"

    .line 859
    .line 860
    :cond_28
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 861
    .line 862
    .line 863
    move-result-object v4

    .line 864
    check-cast v4, Landroid/view/ViewGroup;

    .line 865
    .line 866
    invoke-virtual {v4, v7}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 867
    .line 868
    .line 869
    move-result-object v4

    .line 870
    check-cast v4, Landroid/view/ViewGroup;

    .line 871
    .line 872
    invoke-virtual {v4, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 873
    .line 874
    .line 875
    move-result-object v4

    .line 876
    check-cast v4, Lv/VText;

    .line 877
    .line 878
    iput-object v4, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceCallAuctionViewBindings;->R:Lv/VText;

    .line 879
    .line 880
    if-nez v4, :cond_29

    .line 881
    .line 882
    const-string v1, "_live_bidder_order_2_bidder_empty_order"

    .line 883
    .line 884
    :cond_29
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 885
    .line 886
    .line 887
    move-result-object v4

    .line 888
    check-cast v4, Landroid/view/ViewGroup;

    .line 889
    .line 890
    invoke-virtual {v4, v7}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 891
    .line 892
    .line 893
    move-result-object v4

    .line 894
    check-cast v4, Landroid/view/ViewGroup;

    .line 895
    .line 896
    invoke-virtual {v4, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 897
    .line 898
    .line 899
    move-result-object v4

    .line 900
    check-cast v4, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;

    .line 901
    .line 902
    iput-object v4, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceCallAuctionViewBindings;->S:Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;

    .line 903
    .line 904
    if-nez v4, :cond_2a

    .line 905
    .line 906
    const-string v1, "_live_bidder_order_2_bidder_avatar"

    .line 907
    .line 908
    :cond_2a
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 909
    .line 910
    .line 911
    move-result-object v4

    .line 912
    check-cast v4, Landroid/view/ViewGroup;

    .line 913
    .line 914
    invoke-virtual {v4, v7}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 915
    .line 916
    .line 917
    move-result-object v4

    .line 918
    check-cast v4, Landroid/view/ViewGroup;

    .line 919
    .line 920
    invoke-virtual {v4, v6}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 921
    .line 922
    .line 923
    move-result-object v4

    .line 924
    check-cast v4, Landroid/view/ViewGroup;

    .line 925
    .line 926
    invoke-virtual {v4, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 927
    .line 928
    .line 929
    move-result-object v4

    .line 930
    check-cast v4, Lv/VText;

    .line 931
    .line 932
    iput-object v4, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceCallAuctionViewBindings;->T:Lv/VText;

    .line 933
    .line 934
    if-nez v4, :cond_2b

    .line 935
    .line 936
    const-string v1, "_live_bidder_order_2_bidder_order"

    .line 937
    .line 938
    :cond_2b
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 939
    .line 940
    .line 941
    move-result-object v4

    .line 942
    check-cast v4, Landroid/view/ViewGroup;

    .line 943
    .line 944
    invoke-virtual {v4, v7}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 945
    .line 946
    .line 947
    move-result-object v4

    .line 948
    check-cast v4, Landroid/view/ViewGroup;

    .line 949
    .line 950
    invoke-virtual {v4, v6}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 951
    .line 952
    .line 953
    move-result-object v4

    .line 954
    check-cast v4, Landroid/view/ViewGroup;

    .line 955
    .line 956
    invoke-virtual {v4, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 957
    .line 958
    .line 959
    move-result-object v4

    .line 960
    check-cast v4, Lv/VText;

    .line 961
    .line 962
    iput-object v4, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceCallAuctionViewBindings;->U:Lv/VText;

    .line 963
    .line 964
    if-nez v4, :cond_2c

    .line 965
    .line 966
    const-string v1, "_live_bidder_order_2_bidder_name"

    .line 967
    .line 968
    :cond_2c
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 969
    .line 970
    .line 971
    move-result-object v4

    .line 972
    check-cast v4, Landroid/view/ViewGroup;

    .line 973
    .line 974
    const/16 v7, 0x19

    .line 975
    .line 976
    invoke-virtual {v4, v7}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 977
    .line 978
    .line 979
    move-result-object v4

    .line 980
    check-cast v4, Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 981
    .line 982
    iput-object v4, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceCallAuctionViewBindings;->V:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 983
    .line 984
    if-nez v4, :cond_2d

    .line 985
    .line 986
    const-string v1, "_live_bidder_order_3"

    .line 987
    .line 988
    :cond_2d
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 989
    .line 990
    .line 991
    move-result-object v4

    .line 992
    check-cast v4, Landroid/view/ViewGroup;

    .line 993
    .line 994
    invoke-virtual {v4, v7}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 995
    .line 996
    .line 997
    move-result-object v4

    .line 998
    check-cast v4, Landroid/view/ViewGroup;

    .line 999
    .line 1000
    invoke-virtual {v4, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1001
    .line 1002
    .line 1003
    move-result-object v4

    .line 1004
    check-cast v4, Lv/VDraweeView;

    .line 1005
    .line 1006
    iput-object v4, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceCallAuctionViewBindings;->W:Lv/VDraweeView;

    .line 1007
    .line 1008
    if-nez v4, :cond_2e

    .line 1009
    .line 1010
    const-string v1, "_live_bidder_order_3_bidder_bg"

    .line 1011
    .line 1012
    :cond_2e
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1013
    .line 1014
    .line 1015
    move-result-object v4

    .line 1016
    check-cast v4, Landroid/view/ViewGroup;

    .line 1017
    .line 1018
    invoke-virtual {v4, v7}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1019
    .line 1020
    .line 1021
    move-result-object v4

    .line 1022
    check-cast v4, Landroid/view/ViewGroup;

    .line 1023
    .line 1024
    invoke-virtual {v4, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1025
    .line 1026
    .line 1027
    move-result-object v4

    .line 1028
    check-cast v4, Lv/VText;

    .line 1029
    .line 1030
    iput-object v4, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceCallAuctionViewBindings;->k0:Lv/VText;

    .line 1031
    .line 1032
    if-nez v4, :cond_2f

    .line 1033
    .line 1034
    const-string v1, "_live_bidder_order_3_bidder_price"

    .line 1035
    .line 1036
    :cond_2f
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1037
    .line 1038
    .line 1039
    move-result-object v4

    .line 1040
    check-cast v4, Landroid/view/ViewGroup;

    .line 1041
    .line 1042
    invoke-virtual {v4, v7}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1043
    .line 1044
    .line 1045
    move-result-object v4

    .line 1046
    check-cast v4, Landroid/view/ViewGroup;

    .line 1047
    .line 1048
    invoke-virtual {v4, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1049
    .line 1050
    .line 1051
    move-result-object v4

    .line 1052
    check-cast v4, Lv/VText;

    .line 1053
    .line 1054
    iput-object v4, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceCallAuctionViewBindings;->p0:Lv/VText;

    .line 1055
    .line 1056
    if-nez v4, :cond_30

    .line 1057
    .line 1058
    const-string v1, "_live_bidder_order_3_bidder_empty_order"

    .line 1059
    .line 1060
    :cond_30
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1061
    .line 1062
    .line 1063
    move-result-object v4

    .line 1064
    check-cast v4, Landroid/view/ViewGroup;

    .line 1065
    .line 1066
    invoke-virtual {v4, v7}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1067
    .line 1068
    .line 1069
    move-result-object v4

    .line 1070
    check-cast v4, Landroid/view/ViewGroup;

    .line 1071
    .line 1072
    invoke-virtual {v4, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1073
    .line 1074
    .line 1075
    move-result-object v4

    .line 1076
    check-cast v4, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;

    .line 1077
    .line 1078
    iput-object v4, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceCallAuctionViewBindings;->E0:Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;

    .line 1079
    .line 1080
    if-nez v4, :cond_31

    .line 1081
    .line 1082
    const-string v1, "_live_bidder_order_3_bidder_avatar"

    .line 1083
    .line 1084
    :cond_31
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1085
    .line 1086
    .line 1087
    move-result-object v4

    .line 1088
    check-cast v4, Landroid/view/ViewGroup;

    .line 1089
    .line 1090
    invoke-virtual {v4, v7}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1091
    .line 1092
    .line 1093
    move-result-object v4

    .line 1094
    check-cast v4, Landroid/view/ViewGroup;

    .line 1095
    .line 1096
    invoke-virtual {v4, v6}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1097
    .line 1098
    .line 1099
    move-result-object v4

    .line 1100
    check-cast v4, Landroid/view/ViewGroup;

    .line 1101
    .line 1102
    invoke-virtual {v4, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1103
    .line 1104
    .line 1105
    move-result-object v4

    .line 1106
    check-cast v4, Lv/VText;

    .line 1107
    .line 1108
    iput-object v4, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceCallAuctionViewBindings;->F0:Lv/VText;

    .line 1109
    .line 1110
    if-nez v4, :cond_32

    .line 1111
    .line 1112
    const-string v1, "_live_bidder_order_3_bidder_order"

    .line 1113
    .line 1114
    :cond_32
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1115
    .line 1116
    .line 1117
    move-result-object v4

    .line 1118
    check-cast v4, Landroid/view/ViewGroup;

    .line 1119
    .line 1120
    invoke-virtual {v4, v7}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1121
    .line 1122
    .line 1123
    move-result-object v4

    .line 1124
    check-cast v4, Landroid/view/ViewGroup;

    .line 1125
    .line 1126
    invoke-virtual {v4, v6}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1127
    .line 1128
    .line 1129
    move-result-object v4

    .line 1130
    check-cast v4, Landroid/view/ViewGroup;

    .line 1131
    .line 1132
    invoke-virtual {v4, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1133
    .line 1134
    .line 1135
    move-result-object v4

    .line 1136
    check-cast v4, Lv/VText;

    .line 1137
    .line 1138
    iput-object v4, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceCallAuctionViewBindings;->G0:Lv/VText;

    .line 1139
    .line 1140
    if-nez v4, :cond_33

    .line 1141
    .line 1142
    const-string v1, "_live_bidder_order_3_bidder_name"

    .line 1143
    .line 1144
    :cond_33
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1145
    .line 1146
    .line 1147
    move-result-object v4

    .line 1148
    check-cast v4, Landroid/view/ViewGroup;

    .line 1149
    .line 1150
    const/16 v5, 0x1a

    .line 1151
    .line 1152
    invoke-virtual {v4, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1153
    .line 1154
    .line 1155
    move-result-object v4

    .line 1156
    check-cast v4, Landroid/widget/TextView;

    .line 1157
    .line 1158
    iput-object v4, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceCallAuctionViewBindings;->H0:Landroid/widget/TextView;

    .line 1159
    .line 1160
    if-nez v4, :cond_34

    .line 1161
    .line 1162
    const-string v1, "_live_auction_gap"

    .line 1163
    .line 1164
    :cond_34
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1165
    .line 1166
    .line 1167
    move-result-object v4

    .line 1168
    check-cast v4, Landroid/view/ViewGroup;

    .line 1169
    .line 1170
    const/16 v5, 0x1b

    .line 1171
    .line 1172
    invoke-virtual {v4, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1173
    .line 1174
    .line 1175
    move-result-object v4

    .line 1176
    check-cast v4, Lv/VLinear;

    .line 1177
    .line 1178
    iput-object v4, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceCallAuctionViewBindings;->I0:Lv/VLinear;

    .line 1179
    .line 1180
    if-nez v4, :cond_35

    .line 1181
    .line 1182
    const-string v1, "_live_bless_end_layout"

    .line 1183
    .line 1184
    :cond_35
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1185
    .line 1186
    .line 1187
    move-result-object v4

    .line 1188
    check-cast v4, Landroid/view/ViewGroup;

    .line 1189
    .line 1190
    invoke-virtual {v4, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1191
    .line 1192
    .line 1193
    move-result-object v4

    .line 1194
    check-cast v4, Landroid/view/ViewGroup;

    .line 1195
    .line 1196
    invoke-virtual {v4, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1197
    .line 1198
    .line 1199
    move-result-object v0

    .line 1200
    check-cast v0, Lv/VText;

    .line 1201
    .line 1202
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceCallAuctionViewBindings;->J0:Lv/VText;

    .line 1203
    .line 1204
    if-nez v0, :cond_36

    .line 1205
    .line 1206
    const-string v1, "_live_bless_end_layout_live_auction_end"

    .line 1207
    .line 1208
    :cond_36
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1209
    .line 1210
    .line 1211
    move-result-object p1

    .line 1212
    check-cast p1, Landroid/view/ViewGroup;

    .line 1213
    .line 1214
    invoke-virtual {p1, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1215
    .line 1216
    .line 1217
    move-result-object p1

    .line 1218
    check-cast p1, Landroid/view/ViewGroup;

    .line 1219
    .line 1220
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1221
    .line 1222
    .line 1223
    move-result-object p1

    .line 1224
    check-cast p1, Lv/VText;

    .line 1225
    .line 1226
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceCallAuctionViewBindings;->K0:Lv/VText;

    .line 1227
    .line 1228
    if-nez p1, :cond_37

    .line 1229
    .line 1230
    const-string v1, "_live_bless_end_layout_live_bless_start"

    .line 1231
    .line 1232
    :cond_37
    if-nez v1, :cond_38

    .line 1233
    .line 1234
    return-void

    .line 1235
    :cond_38
    const-string p0, "Missing required view with ID:"

    .line 1236
    .line 1237
    invoke-virtual {p0, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 1238
    .line 1239
    .line 1240
    move-result-object p0

    .line 1241
    invoke-static {p0}, Ll/mnd0;->a(Ljava/lang/String;)V

    .line 1242
    .line 1243
    .line 1244
    return-void
.end method

.method public destroy()V
    .locals 0

    return-void
.end method

.method public getRoot()Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/view/LiveVoiceCallAuctionView;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceCallAuctionViewBindings;->b:Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/view/LiveVoiceCallAuctionView;

    .line 2
    .line 3
    return-object p0
.end method

.method public i1(Ll/k3m;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceCallAuctionViewBindings;->a:Ll/k3m;

    .line 2
    .line 3
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 2

    .line 1
    sget v0, Ll/yec0;->V7:I

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
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceCallAuctionViewBindings;->a(Landroid/view/ViewGroup;)V

    .line 12
    .line 13
    .line 14
    return-object p1
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceCallAuctionViewBindings;->a(Landroid/view/ViewGroup;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

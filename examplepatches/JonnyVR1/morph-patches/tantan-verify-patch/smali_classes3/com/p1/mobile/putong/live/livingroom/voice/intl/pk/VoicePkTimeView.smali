.class public Lcom/p1/mobile/putong/live/livingroom/voice/intl/pk/VoicePkTimeView;
.super Landroidx/constraintlayout/widget/ConstraintLayout;
.source "SourceFile"


# instance fields
.field public d:Lcom/tantan/library/svga/SVGAnimationView;

.field public e:Lv/VImage;

.field public f:Lv/VImage;

.field public g:Lv/VText;

.field public h:Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftlayer/LiveStrokeTextView;

.field public i:Lv/VImage;

.field public j:Landroid/animation/Animator;

.field public k:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field public final l:Lcom/tantan/library/svga/AnimListener;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/pk/VoicePkTimeView;->k:Ljava/util/List;

    .line 10
    .line 11
    new-instance p1, Lcom/p1/mobile/putong/live/livingroom/voice/intl/pk/VoicePkTimeView$a;

    .line 12
    .line 13
    invoke-direct {p1, p0}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/pk/VoicePkTimeView$a;-><init>(Lcom/p1/mobile/putong/live/livingroom/voice/intl/pk/VoicePkTimeView;)V

    .line 14
    .line 15
    .line 16
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/pk/VoicePkTimeView;->l:Lcom/tantan/library/svga/AnimListener;

    .line 17
    .line 18
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 19
    invoke-direct {p0, p1, p2}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 20
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/pk/VoicePkTimeView;->k:Ljava/util/List;

    .line 21
    new-instance p1, Lcom/p1/mobile/putong/live/livingroom/voice/intl/pk/VoicePkTimeView$a;

    invoke-direct {p1, p0}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/pk/VoicePkTimeView$a;-><init>(Lcom/p1/mobile/putong/live/livingroom/voice/intl/pk/VoicePkTimeView;)V

    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/pk/VoicePkTimeView;->l:Lcom/tantan/library/svga/AnimListener;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 22
    invoke-direct {p0, p1, p2, p3}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 23
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/pk/VoicePkTimeView;->k:Ljava/util/List;

    .line 24
    new-instance p1, Lcom/p1/mobile/putong/live/livingroom/voice/intl/pk/VoicePkTimeView$a;

    invoke-direct {p1, p0}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/pk/VoicePkTimeView$a;-><init>(Lcom/p1/mobile/putong/live/livingroom/voice/intl/pk/VoicePkTimeView;)V

    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/pk/VoicePkTimeView;->l:Lcom/tantan/library/svga/AnimListener;

    return-void
.end method


# virtual methods
.method public final h0(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/cho0;->a(Lcom/p1/mobile/putong/live/livingroom/voice/intl/pk/VoicePkTimeView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public i0(Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkInfo;)V
    .locals 8

    .line 1
    iget-wide v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkInfo;->endMill:J

    .line 2
    .line 3
    invoke-static {}, Ll/pzi0;->o()J

    .line 4
    .line 5
    .line 6
    move-result-wide v2

    .line 7
    sub-long/2addr v0, v2

    .line 8
    const-wide/16 v2, 0x3e8

    .line 9
    .line 10
    div-long/2addr v0, v2

    .line 11
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/pk/VoicePkTimeView;->j:Landroid/animation/Animator;

    .line 12
    .line 13
    invoke-static {v2}, Ll/it0;->B(Landroid/animation/Animator;)V

    .line 14
    .line 15
    .line 16
    iget-boolean v2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkInfo;->enable:Z

    .line 17
    .line 18
    const/4 v3, 0x0

    .line 19
    if-eqz v2, :cond_5

    .line 20
    .line 21
    iget-wide v4, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkInfo;->endMill:J

    .line 22
    .line 23
    const-wide/16 v6, 0x0

    .line 24
    .line 25
    cmp-long p1, v4, v6

    .line 26
    .line 27
    if-ltz p1, :cond_5

    .line 28
    .line 29
    cmp-long p1, v0, v6

    .line 30
    .line 31
    if-gtz p1, :cond_0

    .line 32
    .line 33
    goto/16 :goto_1

    .line 34
    .line 35
    :cond_0
    const/4 p1, 0x1

    .line 36
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 37
    .line 38
    .line 39
    const-wide/16 v4, 0x1e

    .line 40
    .line 41
    cmp-long v2, v0, v4

    .line 42
    .line 43
    if-lez v2, :cond_1

    .line 44
    .line 45
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/pk/VoicePkTimeView;->g:Lv/VText;

    .line 46
    .line 47
    invoke-static {v0, v1}, Ll/kdu;->Z(J)Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    invoke-virtual {v2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 52
    .line 53
    .line 54
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/pk/VoicePkTimeView;->g:Lv/VText;

    .line 55
    .line 56
    invoke-static {v0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 57
    .line 58
    .line 59
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/pk/VoicePkTimeView;->h:Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftlayer/LiveStrokeTextView;

    .line 60
    .line 61
    invoke-static {v0, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 62
    .line 63
    .line 64
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/pk/VoicePkTimeView;->i:Lv/VImage;

    .line 65
    .line 66
    invoke-static {v0, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 67
    .line 68
    .line 69
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/pk/VoicePkTimeView;->d:Lcom/tantan/library/svga/SVGAnimationView;

    .line 70
    .line 71
    invoke-static {v0, v3}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 72
    .line 73
    .line 74
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/pk/VoicePkTimeView;->e:Lv/VImage;

    .line 75
    .line 76
    invoke-static {v0, p1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 77
    .line 78
    .line 79
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/pk/VoicePkTimeView;->d:Lcom/tantan/library/svga/SVGAnimationView;

    .line 80
    .line 81
    invoke-virtual {p0, p1}, Lcom/tantan/library/svga/SVGAnimationView;->stopAnimation(Z)V

    .line 82
    .line 83
    .line 84
    return-void

    .line 85
    :cond_1
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/pk/VoicePkTimeView;->d:Lcom/tantan/library/svga/SVGAnimationView;

    .line 86
    .line 87
    invoke-static {v2, p1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 88
    .line 89
    .line 90
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/pk/VoicePkTimeView;->d:Lcom/tantan/library/svga/SVGAnimationView;

    .line 91
    .line 92
    invoke-virtual {v2}, Lcom/tantan/library/svga/SVGAnimationView;->isAnimating()Z

    .line 93
    .line 94
    .line 95
    move-result v2

    .line 96
    if-nez v2, :cond_2

    .line 97
    .line 98
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 99
    .line 100
    .line 101
    move-result-object v2

    .line 102
    invoke-static {v2}, Lcom/tantan/library/svga/SVGALoader;->with(Landroid/content/Context;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 103
    .line 104
    .line 105
    move-result-object v2

    .line 106
    const-string v4, "https://fe-static.tancdn.com/v1/raw/f041a549-e2fa-4b16-8acf-ed41b3d6a85a14.svga"

    .line 107
    .line 108
    invoke-virtual {v2, v4}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->from(Ljava/lang/String;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 109
    .line 110
    .line 111
    move-result-object v2

    .line 112
    invoke-virtual {v2, p1}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->autoPlay(Z)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 113
    .line 114
    .line 115
    move-result-object v2

    .line 116
    iget-object v4, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/pk/VoicePkTimeView;->l:Lcom/tantan/library/svga/AnimListener;

    .line 117
    .line 118
    invoke-virtual {v2, v4}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->animListener(Lcom/tantan/library/svga/AnimListener;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 119
    .line 120
    .line 121
    move-result-object v2

    .line 122
    const/4 v4, -0x1

    .line 123
    invoke-virtual {v2, v4}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->repeatCount(I)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 124
    .line 125
    .line 126
    move-result-object v2

    .line 127
    iget-object v4, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/pk/VoicePkTimeView;->d:Lcom/tantan/library/svga/SVGAnimationView;

    .line 128
    .line 129
    invoke-virtual {v2, v4}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->into(Lcom/tantan/library/svga/SVGAnimationView;)V

    .line 130
    .line 131
    .line 132
    goto :goto_0

    .line 133
    :cond_2
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/pk/VoicePkTimeView;->e:Lv/VImage;

    .line 134
    .line 135
    invoke-static {v2, v3}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 136
    .line 137
    .line 138
    :goto_0
    const-wide/16 v4, 0x5

    .line 139
    .line 140
    cmp-long v2, v0, v4

    .line 141
    .line 142
    if-lez v2, :cond_3

    .line 143
    .line 144
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/pk/VoicePkTimeView;->g:Lv/VText;

    .line 145
    .line 146
    invoke-static {v2, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 147
    .line 148
    .line 149
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/pk/VoicePkTimeView;->h:Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftlayer/LiveStrokeTextView;

    .line 150
    .line 151
    invoke-static {v2, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 152
    .line 153
    .line 154
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/pk/VoicePkTimeView;->i:Lv/VImage;

    .line 155
    .line 156
    invoke-static {p1, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 157
    .line 158
    .line 159
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/pk/VoicePkTimeView;->h:Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftlayer/LiveStrokeTextView;

    .line 160
    .line 161
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/pk/VoicePkTimeView;->j0(Landroid/view/View;)V

    .line 162
    .line 163
    .line 164
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/pk/VoicePkTimeView;->h:Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftlayer/LiveStrokeTextView;

    .line 165
    .line 166
    invoke-static {v0, v1}, Ll/kdu;->R(J)Ljava/lang/String;

    .line 167
    .line 168
    .line 169
    move-result-object p1

    .line 170
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 171
    .line 172
    .line 173
    return-void

    .line 174
    :cond_3
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/pk/VoicePkTimeView;->i:Lv/VImage;

    .line 175
    .line 176
    invoke-virtual {p0, v2}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/pk/VoicePkTimeView;->j0(Landroid/view/View;)V

    .line 177
    .line 178
    .line 179
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/pk/VoicePkTimeView;->g:Lv/VText;

    .line 180
    .line 181
    invoke-static {v2, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 182
    .line 183
    .line 184
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/pk/VoicePkTimeView;->h:Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftlayer/LiveStrokeTextView;

    .line 185
    .line 186
    invoke-static {v2, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 187
    .line 188
    .line 189
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/pk/VoicePkTimeView;->i:Lv/VImage;

    .line 190
    .line 191
    invoke-static {v2, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 192
    .line 193
    .line 194
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/pk/VoicePkTimeView;->k:Ljava/util/List;

    .line 195
    .line 196
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 197
    .line 198
    .line 199
    move-result p1

    .line 200
    int-to-long v2, p1

    .line 201
    cmp-long p1, v0, v2

    .line 202
    .line 203
    if-gtz p1, :cond_4

    .line 204
    .line 205
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/pk/VoicePkTimeView;->i:Lv/VImage;

    .line 206
    .line 207
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/pk/VoicePkTimeView;->k:Ljava/util/List;

    .line 208
    .line 209
    const-wide/16 v2, 0x1

    .line 210
    .line 211
    sub-long/2addr v0, v2

    .line 212
    long-to-int v0, v0

    .line 213
    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 214
    .line 215
    .line 216
    move-result-object p0

    .line 217
    check-cast p0, Ljava/lang/Integer;

    .line 218
    .line 219
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 220
    .line 221
    .line 222
    move-result p0

    .line 223
    invoke-virtual {p1, p0}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 224
    .line 225
    .line 226
    :cond_4
    return-void

    .line 227
    :cond_5
    :goto_1
    invoke-static {p0, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 228
    .line 229
    .line 230
    return-void
.end method

.method public final j0(Landroid/view/View;)V
    .locals 3

    .line 1
    const/4 v0, 0x2

    .line 2
    new-array v0, v0, [F

    .line 3
    .line 4
    fill-array-data v0, :array_0

    .line 5
    .line 6
    .line 7
    sget-object v1, Landroid/view/View;->ALPHA:Landroid/util/Property;

    .line 8
    .line 9
    invoke-static {p1, v1, v0}, Ll/gt0;->n(Landroid/view/View;Landroid/util/Property;[F)Landroid/animation/Animator;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    const-wide/16 v1, 0xc8

    .line 14
    .line 15
    invoke-virtual {v0, v1, v2}, Landroid/animation/Animator;->setDuration(J)Landroid/animation/Animator;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    sget-object v1, Ll/gt0;->i:Landroid/util/Property;

    .line 20
    .line 21
    const/4 v2, 0x3

    .line 22
    new-array v2, v2, [F

    .line 23
    .line 24
    fill-array-data v2, :array_1

    .line 25
    .line 26
    .line 27
    invoke-static {p1, v1, v2}, Ll/gt0;->n(Landroid/view/View;Landroid/util/Property;[F)Landroid/animation/Animator;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    const-wide/16 v1, 0x190

    .line 32
    .line 33
    invoke-virtual {p1, v1, v2}, Landroid/animation/Animator;->setDuration(J)Landroid/animation/Animator;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    filled-new-array {v0, p1}, [Landroid/animation/Animator;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    invoke-static {p1}, Ll/gt0;->z([Landroid/animation/Animator;)Landroid/animation/Animator;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/pk/VoicePkTimeView;->j:Landroid/animation/Animator;

    .line 46
    .line 47
    invoke-virtual {p1}, Landroid/animation/Animator;->start()V

    .line 48
    .line 49
    .line 50
    return-void

    .line 51
    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data

    .line 52
    .line 53
    .line 54
    .line 55
    .line 56
    .line 57
    .line 58
    .line 59
    :array_1
    .array-data 4
        0x3fc00000    # 1.5f
        0x3f666666    # 0.9f
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public onFinishInflate()V
    .locals 2

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/pk/VoicePkTimeView;->h0(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/pk/VoicePkTimeView;->h:Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftlayer/LiveStrokeTextView;

    .line 8
    .line 9
    const-string v1, "#925737"

    .line 10
    .line 11
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftlayer/LiveStrokeTextView;->setStrokeColor(I)V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/pk/VoicePkTimeView;->h:Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftlayer/LiveStrokeTextView;

    .line 19
    .line 20
    const/high16 v1, 0x40000000    # 2.0f

    .line 21
    .line 22
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 23
    .line 24
    .line 25
    move-result v1

    .line 26
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftlayer/LiveStrokeTextView;->setStrokeWidth(I)V

    .line 27
    .line 28
    .line 29
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/pk/VoicePkTimeView;->h:Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftlayer/LiveStrokeTextView;

    .line 30
    .line 31
    const/16 v1, 0xb

    .line 32
    .line 33
    invoke-static {v1}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 38
    .line 39
    .line 40
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/pk/VoicePkTimeView;->k:Ljava/util/List;

    .line 41
    .line 42
    sget v1, Ll/obc0;->Y9:I

    .line 43
    .line 44
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 45
    .line 46
    .line 47
    move-result-object v1

    .line 48
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 49
    .line 50
    .line 51
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/pk/VoicePkTimeView;->k:Ljava/util/List;

    .line 52
    .line 53
    sget v1, Ll/obc0;->Z9:I

    .line 54
    .line 55
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 56
    .line 57
    .line 58
    move-result-object v1

    .line 59
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 60
    .line 61
    .line 62
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/pk/VoicePkTimeView;->k:Ljava/util/List;

    .line 63
    .line 64
    sget v1, Ll/obc0;->aa:I

    .line 65
    .line 66
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 67
    .line 68
    .line 69
    move-result-object v1

    .line 70
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 71
    .line 72
    .line 73
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/pk/VoicePkTimeView;->k:Ljava/util/List;

    .line 74
    .line 75
    sget v1, Ll/obc0;->ba:I

    .line 76
    .line 77
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 78
    .line 79
    .line 80
    move-result-object v1

    .line 81
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 82
    .line 83
    .line 84
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/pk/VoicePkTimeView;->k:Ljava/util/List;

    .line 85
    .line 86
    sget v0, Ll/obc0;->ca:I

    .line 87
    .line 88
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 89
    .line 90
    .line 91
    move-result-object v0

    .line 92
    invoke-interface {p0, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 93
    .line 94
    .line 95
    return-void
.end method

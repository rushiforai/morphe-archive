.class public Lcom/p1/mobile/putong/live/external/intl/music/MusicPlaylistItemView;
.super Landroidx/constraintlayout/widget/ConstraintLayout;
.source "SourceFile"


# instance fields
.field public d:Landroid/widget/TextView;

.field public e:Lv/VDraweeView;

.field public f:Landroid/widget/TextView;

.field public g:Lv/VImage;

.field public h:Landroid/view/View;

.field public i:Landroid/widget/TextView;

.field public j:Lcom/tantan/library/svga/SVGAnimationView;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 5
    invoke-direct {p0, p1, p2}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 6
    invoke-direct {p0, p1, p2, p3}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static bridge synthetic h0(Lcom/p1/mobile/putong/live/external/intl/music/MusicPlaylistItemView;)Lcom/tantan/library/svga/SVGAnimationView;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/intl/music/MusicPlaylistItemView;->j:Lcom/tantan/library/svga/SVGAnimationView;

    return-object p0
.end method


# virtual methods
.method public i0(ILcom/p1/mobile/putong/live/livingroom/voice/intl/play/IntlMusicBean;ZZLandroid/view/View$OnClickListener;Landroid/view/View$OnClickListener;)V
    .locals 5

    .line 1
    iget-object v0, p2, Lcom/p1/mobile/putong/live/livingroom/voice/intl/play/IntlMusicBean;->filePath:Ljava/lang/String;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/intl/music/MusicPlaylistItemView;->e:Lv/VDraweeView;

    .line 4
    .line 5
    sget v2, Ll/nbc0;->H:I

    .line 6
    .line 7
    invoke-static {v0, v1, v2}, Ll/m120;->a(Ljava/lang/String;Landroid/widget/ImageView;I)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/music/MusicPlaylistItemView;->d:Landroid/widget/TextView;

    .line 11
    .line 12
    iget-object v1, p2, Lcom/p1/mobile/putong/live/livingroom/voice/intl/play/IntlMusicBean;->title:Ljava/lang/String;

    .line 13
    .line 14
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/music/MusicPlaylistItemView;->f:Landroid/widget/TextView;

    .line 18
    .line 19
    iget-wide v1, p2, Lcom/p1/mobile/putong/live/livingroom/voice/intl/play/IntlMusicBean;->duration:J

    .line 20
    .line 21
    const-wide/16 v3, 0x3e8

    .line 22
    .line 23
    div-long/2addr v1, v3

    .line 24
    invoke-static {v1, v2}, Ll/kdu;->Z(J)Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 29
    .line 30
    .line 31
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/music/MusicPlaylistItemView;->g:Lv/VImage;

    .line 32
    .line 33
    const/4 v1, 0x0

    .line 34
    const/4 v2, 0x1

    .line 35
    if-nez p3, :cond_0

    .line 36
    .line 37
    if-eqz p1, :cond_0

    .line 38
    .line 39
    move v3, v2

    .line 40
    goto :goto_0

    .line 41
    :cond_0
    move v3, v1

    .line 42
    :goto_0
    invoke-static {v0, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 43
    .line 44
    .line 45
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/music/MusicPlaylistItemView;->g:Lv/VImage;

    .line 46
    .line 47
    invoke-static {v0, p5}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 48
    .line 49
    .line 50
    iget-object p5, p0, Lcom/p1/mobile/putong/live/external/intl/music/MusicPlaylistItemView;->h:Landroid/view/View;

    .line 51
    .line 52
    invoke-static {p5, p6}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 53
    .line 54
    .line 55
    iget-object p5, p0, Lcom/p1/mobile/putong/live/external/intl/music/MusicPlaylistItemView;->h:Landroid/view/View;

    .line 56
    .line 57
    invoke-virtual {p5, p4}, Landroid/view/View;->setSelected(Z)V

    .line 58
    .line 59
    .line 60
    iget-object p4, p0, Lcom/p1/mobile/putong/live/external/intl/music/MusicPlaylistItemView;->i:Landroid/widget/TextView;

    .line 61
    .line 62
    iget-object p5, p2, Lcom/p1/mobile/putong/live/livingroom/voice/intl/play/IntlMusicBean;->author:Ljava/lang/String;

    .line 63
    .line 64
    invoke-virtual {p4, p5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 65
    .line 66
    .line 67
    if-eqz p3, :cond_1

    .line 68
    .line 69
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/intl/music/MusicPlaylistItemView;->g:Lv/VImage;

    .line 70
    .line 71
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 72
    .line 73
    .line 74
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/intl/music/MusicPlaylistItemView;->h:Landroid/view/View;

    .line 75
    .line 76
    invoke-static {p1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 77
    .line 78
    .line 79
    goto :goto_2

    .line 80
    :cond_1
    iget-object p3, p0, Lcom/p1/mobile/putong/live/external/intl/music/MusicPlaylistItemView;->h:Landroid/view/View;

    .line 81
    .line 82
    invoke-static {p3, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 83
    .line 84
    .line 85
    iget-object p3, p0, Lcom/p1/mobile/putong/live/external/intl/music/MusicPlaylistItemView;->g:Lv/VImage;

    .line 86
    .line 87
    if-eqz p1, :cond_2

    .line 88
    .line 89
    move p1, v2

    .line 90
    goto :goto_1

    .line 91
    :cond_2
    move p1, v1

    .line 92
    :goto_1
    invoke-static {p3, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 93
    .line 94
    .line 95
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/intl/music/MusicPlaylistItemView;->g:Lv/VImage;

    .line 96
    .line 97
    sget p3, Ll/nbc0;->Q:I

    .line 98
    .line 99
    invoke-virtual {p1, p3}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 100
    .line 101
    .line 102
    :goto_2
    invoke-virtual {p2}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/play/IntlMusicBean;->isPlaying()Z

    .line 103
    .line 104
    .line 105
    move-result p1

    .line 106
    const/4 p3, -0x1

    .line 107
    const-string p4, "https://fe-static.tancdn.com/v1/raw/63a64560-95e9-444b-8252-cf3436101be414"

    .line 108
    .line 109
    if-eqz p1, :cond_3

    .line 110
    .line 111
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/intl/music/MusicPlaylistItemView;->j:Lcom/tantan/library/svga/SVGAnimationView;

    .line 112
    .line 113
    invoke-virtual {p1, v2}, Lcom/tantan/library/svga/SVGAnimationView;->stopAnimation(Z)V

    .line 114
    .line 115
    .line 116
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 117
    .line 118
    .line 119
    move-result-object p1

    .line 120
    invoke-static {p1}, Lcom/tantan/library/svga/SVGALoader;->with(Landroid/content/Context;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 121
    .line 122
    .line 123
    move-result-object p1

    .line 124
    invoke-virtual {p1, p4}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->from(Ljava/lang/String;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 125
    .line 126
    .line 127
    move-result-object p1

    .line 128
    invoke-virtual {p1, v2}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->autoPlay(Z)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 129
    .line 130
    .line 131
    move-result-object p1

    .line 132
    invoke-virtual {p1, p3}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->repeatCount(I)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 133
    .line 134
    .line 135
    move-result-object p1

    .line 136
    iget-object p2, p0, Lcom/p1/mobile/putong/live/external/intl/music/MusicPlaylistItemView;->j:Lcom/tantan/library/svga/SVGAnimationView;

    .line 137
    .line 138
    invoke-virtual {p1, p2}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->into(Lcom/tantan/library/svga/SVGAnimationView;)V

    .line 139
    .line 140
    .line 141
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/intl/music/MusicPlaylistItemView;->j:Lcom/tantan/library/svga/SVGAnimationView;

    .line 142
    .line 143
    invoke-static {p0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 144
    .line 145
    .line 146
    return-void

    .line 147
    :cond_3
    invoke-virtual {p2}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/play/IntlMusicBean;->isPaused()Z

    .line 148
    .line 149
    .line 150
    move-result p1

    .line 151
    iget-object p2, p0, Lcom/p1/mobile/putong/live/external/intl/music/MusicPlaylistItemView;->j:Lcom/tantan/library/svga/SVGAnimationView;

    .line 152
    .line 153
    if-eqz p1, :cond_5

    .line 154
    .line 155
    invoke-virtual {p2}, Lcom/tantan/library/svga/SVGAnimationView;->isAnimating()Z

    .line 156
    .line 157
    .line 158
    move-result p1

    .line 159
    if-eqz p1, :cond_4

    .line 160
    .line 161
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/intl/music/MusicPlaylistItemView;->j:Lcom/tantan/library/svga/SVGAnimationView;

    .line 162
    .line 163
    invoke-virtual {p1}, Lcom/tantan/library/svga/SVGAnimationView;->pauseAnimation()V

    .line 164
    .line 165
    .line 166
    goto :goto_3

    .line 167
    :cond_4
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 168
    .line 169
    .line 170
    move-result-object p1

    .line 171
    invoke-static {p1}, Lcom/tantan/library/svga/SVGALoader;->with(Landroid/content/Context;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 172
    .line 173
    .line 174
    move-result-object p1

    .line 175
    invoke-virtual {p1, p4}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->from(Ljava/lang/String;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 176
    .line 177
    .line 178
    move-result-object p1

    .line 179
    invoke-virtual {p1, v2}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->autoPlay(Z)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 180
    .line 181
    .line 182
    move-result-object p1

    .line 183
    invoke-virtual {p1, p3}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->repeatCount(I)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 184
    .line 185
    .line 186
    move-result-object p1

    .line 187
    new-instance p2, Lcom/p1/mobile/putong/live/external/intl/music/MusicPlaylistItemView$a;

    .line 188
    .line 189
    invoke-direct {p2, p0}, Lcom/p1/mobile/putong/live/external/intl/music/MusicPlaylistItemView$a;-><init>(Lcom/p1/mobile/putong/live/external/intl/music/MusicPlaylistItemView;)V

    .line 190
    .line 191
    .line 192
    invoke-virtual {p1, p2}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->animListener(Lcom/tantan/library/svga/AnimListener;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 193
    .line 194
    .line 195
    move-result-object p1

    .line 196
    iget-object p2, p0, Lcom/p1/mobile/putong/live/external/intl/music/MusicPlaylistItemView;->j:Lcom/tantan/library/svga/SVGAnimationView;

    .line 197
    .line 198
    invoke-virtual {p1, p2}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->into(Lcom/tantan/library/svga/SVGAnimationView;)V

    .line 199
    .line 200
    .line 201
    :goto_3
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/intl/music/MusicPlaylistItemView;->j:Lcom/tantan/library/svga/SVGAnimationView;

    .line 202
    .line 203
    invoke-static {p0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 204
    .line 205
    .line 206
    return-void

    .line 207
    :cond_5
    invoke-virtual {p2, v2}, Lcom/tantan/library/svga/SVGAnimationView;->stopAnimation(Z)V

    .line 208
    .line 209
    .line 210
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/intl/music/MusicPlaylistItemView;->j:Lcom/tantan/library/svga/SVGAnimationView;

    .line 211
    .line 212
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 213
    .line 214
    .line 215
    return-void
.end method

.method public onFinishInflate()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    sget v0, Ll/ldc0;->Q0:I

    .line 5
    .line 6
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    check-cast v0, Landroid/widget/TextView;

    .line 11
    .line 12
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/music/MusicPlaylistItemView;->d:Landroid/widget/TextView;

    .line 13
    .line 14
    sget v0, Ll/ldc0;->P:I

    .line 15
    .line 16
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    check-cast v0, Lv/VDraweeView;

    .line 21
    .line 22
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/music/MusicPlaylistItemView;->e:Lv/VDraweeView;

    .line 23
    .line 24
    sget v0, Ll/ldc0;->M0:I

    .line 25
    .line 26
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    check-cast v0, Landroid/widget/TextView;

    .line 31
    .line 32
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/music/MusicPlaylistItemView;->f:Landroid/widget/TextView;

    .line 33
    .line 34
    sget v0, Ll/ldc0;->T1:I

    .line 35
    .line 36
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    check-cast v0, Lv/VImage;

    .line 41
    .line 42
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/music/MusicPlaylistItemView;->g:Lv/VImage;

    .line 43
    .line 44
    sget v0, Ll/ldc0;->x1:I

    .line 45
    .line 46
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/music/MusicPlaylistItemView;->h:Landroid/view/View;

    .line 51
    .line 52
    sget v0, Ll/ldc0;->K0:I

    .line 53
    .line 54
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    check-cast v0, Landroid/widget/TextView;

    .line 59
    .line 60
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/music/MusicPlaylistItemView;->i:Landroid/widget/TextView;

    .line 61
    .line 62
    sget v0, Ll/ldc0;->i:I

    .line 63
    .line 64
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    check-cast v0, Lcom/tantan/library/svga/SVGAnimationView;

    .line 69
    .line 70
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/music/MusicPlaylistItemView;->j:Lcom/tantan/library/svga/SVGAnimationView;

    .line 71
    .line 72
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/intl/music/MusicPlaylistItemView;->e:Lv/VDraweeView;

    .line 73
    .line 74
    const/high16 v0, 0x41000000    # 8.0f

    .line 75
    .line 76
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 77
    .line 78
    .line 79
    move-result v0

    .line 80
    invoke-static {p0, v0}, Ll/qnp0;->d1(Landroid/view/View;I)V

    .line 81
    .line 82
    .line 83
    return-void
.end method

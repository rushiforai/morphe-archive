.class public Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvAlreadyChooseSongItem;
.super Landroidx/constraintlayout/widget/ConstraintLayout;
.source "SourceFile"


# instance fields
.field public d:Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvAlreadyChooseSongItem;

.field public e:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

.field public f:Lv/VText;

.field public g:Lv/VDraweeView;

.field public h:Lv/VText;

.field public i:Lv/VDraweeView;

.field public j:Lv/VText;

.field public k:Lv/VImage;

.field public l:Lv/VImage;


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

.method public static synthetic h0(ILl/y20;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKTVOrder;Landroid/view/View;)V
    .locals 0

    .line 1
    if-nez p0, :cond_0

    .line 2
    .line 3
    new-instance p0, Landroid/util/Pair;

    .line 4
    .line 5
    const/4 p3, 0x1

    .line 6
    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 7
    .line 8
    .line 9
    move-result-object p3

    .line 10
    invoke-direct {p0, p3, p2}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 11
    .line 12
    .line 13
    invoke-interface {p1, p0}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 14
    .line 15
    .line 16
    return-void

    .line 17
    :cond_0
    new-instance p0, Landroid/util/Pair;

    .line 18
    .line 19
    const/4 p3, 0x2

    .line 20
    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 21
    .line 22
    .line 23
    move-result-object p3

    .line 24
    invoke-direct {p0, p3, p2}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 25
    .line 26
    .line 27
    invoke-interface {p1, p0}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public static synthetic i0(Ll/y20;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKTVOrder;Landroid/view/View;)V
    .locals 1

    .line 1
    new-instance p2, Landroid/util/Pair;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-direct {p2, v0, p1}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 9
    .line 10
    .line 11
    invoke-interface {p0, p2}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public final j0(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/j2r;->a(Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvAlreadyChooseSongItem;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public k0(Ll/y20;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKTVOrder;IZZ)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/y20<",
            "Landroid/util/Pair<",
            "Ljava/lang/Integer;",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKTVOrder;",
            ">;>;",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKTVOrder;",
            "IZZ)V"
        }
    .end annotation

    .line 1
    if-eqz p2, :cond_9

    .line 2
    .line 3
    iget-object v0, p2, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKTVOrder;->song:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKTVSong;

    .line 4
    .line 5
    if-eqz v0, :cond_9

    .line 6
    .line 7
    iget-object v0, p2, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKTVOrder;->mask:Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 8
    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    goto/16 :goto_4

    .line 12
    .line 13
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvAlreadyChooseSongItem;->e:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 14
    .line 15
    const/16 v1, 0x8

    .line 16
    .line 17
    const/4 v2, 0x0

    .line 18
    if-nez p3, :cond_5

    .line 19
    .line 20
    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvAlreadyChooseSongItem;->f:Lv/VText;

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 26
    .line 27
    .line 28
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvAlreadyChooseSongItem;->e:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 29
    .line 30
    const/4 v3, -0x1

    .line 31
    const/4 v4, 0x0

    .line 32
    const-string v5, "https://auto.tancdn.com/v1/raw/cb34326a-c938-4bc5-baaa-31c014cffabe11.pdf"

    .line 33
    .line 34
    invoke-virtual {v0, v5, v3, v4}, Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;->l(Ljava/lang/String;ILl/wo0;)V

    .line 35
    .line 36
    .line 37
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvAlreadyChooseSongItem;->l:Lv/VImage;

    .line 38
    .line 39
    sget v3, Ll/obc0;->D9:I

    .line 40
    .line 41
    invoke-virtual {v0, v3}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 42
    .line 43
    .line 44
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvAlreadyChooseSongItem;->k:Lv/VImage;

    .line 45
    .line 46
    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 47
    .line 48
    .line 49
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvAlreadyChooseSongItem;->l:Lv/VImage;

    .line 50
    .line 51
    if-nez p5, :cond_2

    .line 52
    .line 53
    if-eqz p4, :cond_1

    .line 54
    .line 55
    goto :goto_0

    .line 56
    :cond_1
    move v3, v1

    .line 57
    goto :goto_1

    .line 58
    :cond_2
    :goto_0
    move v3, v2

    .line 59
    :goto_1
    invoke-virtual {v0, v3}, Landroid/view/View;->setVisibility(I)V

    .line 60
    .line 61
    .line 62
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvAlreadyChooseSongItem;->k:Lv/VImage;

    .line 63
    .line 64
    if-nez p5, :cond_3

    .line 65
    .line 66
    if-eqz p4, :cond_4

    .line 67
    .line 68
    :cond_3
    move v1, v2

    .line 69
    :cond_4
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 70
    .line 71
    .line 72
    goto :goto_2

    .line 73
    :cond_5
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 74
    .line 75
    .line 76
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvAlreadyChooseSongItem;->f:Lv/VText;

    .line 77
    .line 78
    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 79
    .line 80
    .line 81
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvAlreadyChooseSongItem;->f:Lv/VText;

    .line 82
    .line 83
    add-int/lit8 v3, p3, 0x1

    .line 84
    .line 85
    invoke-static {v3}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 86
    .line 87
    .line 88
    move-result-object v3

    .line 89
    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 90
    .line 91
    .line 92
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvAlreadyChooseSongItem;->l:Lv/VImage;

    .line 93
    .line 94
    sget v3, Ll/obc0;->ya:I

    .line 95
    .line 96
    invoke-virtual {v0, v3}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 97
    .line 98
    .line 99
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvAlreadyChooseSongItem;->k:Lv/VImage;

    .line 100
    .line 101
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 102
    .line 103
    .line 104
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvAlreadyChooseSongItem;->l:Lv/VImage;

    .line 105
    .line 106
    if-nez p4, :cond_6

    .line 107
    .line 108
    if-eqz p5, :cond_7

    .line 109
    .line 110
    :cond_6
    move v1, v2

    .line 111
    :cond_7
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 112
    .line 113
    .line 114
    :goto_2
    iget-object p4, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvAlreadyChooseSongItem;->k:Lv/VImage;

    .line 115
    .line 116
    sget-object p5, Ll/qd80;->m:Ljava/lang/String;

    .line 117
    .line 118
    iget-object v0, p2, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKTVOrder;->status:Ljava/lang/String;

    .line 119
    .line 120
    invoke-virtual {p5, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 121
    .line 122
    .line 123
    move-result p5

    .line 124
    if-eqz p5, :cond_8

    .line 125
    .line 126
    sget p5, Ll/obc0;->F9:I

    .line 127
    .line 128
    goto :goto_3

    .line 129
    :cond_8
    sget p5, Ll/obc0;->E9:I

    .line 130
    .line 131
    :goto_3
    invoke-virtual {p4, p5}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 132
    .line 133
    .line 134
    iget-object p4, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvAlreadyChooseSongItem;->g:Lv/VDraweeView;

    .line 135
    .line 136
    iget-object p5, p2, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKTVOrder;->song:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKTVSong;

    .line 137
    .line 138
    iget-object p5, p5, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKTVSong;->cover:Ljava/lang/String;

    .line 139
    .line 140
    sget v0, Ll/qa00;->D:I

    .line 141
    .line 142
    const-string v1, "context_single_room"

    .line 143
    .line 144
    invoke-static {v1, p4, p5, v0}, Ll/izs;->t(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;I)V

    .line 145
    .line 146
    .line 147
    iget-object p4, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvAlreadyChooseSongItem;->h:Lv/VText;

    .line 148
    .line 149
    iget-object p5, p2, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKTVOrder;->song:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKTVSong;

    .line 150
    .line 151
    iget-object p5, p5, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKTVSong;->title:Ljava/lang/String;

    .line 152
    .line 153
    invoke-virtual {p4, p5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 154
    .line 155
    .line 156
    iget-object p4, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvAlreadyChooseSongItem;->i:Lv/VDraweeView;

    .line 157
    .line 158
    iget-object p5, p2, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKTVOrder;->mask:Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 159
    .line 160
    iget-object p5, p5, Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;->avatar:Ljava/lang/String;

    .line 161
    .line 162
    invoke-static {v1, p4, p5, v0}, Ll/izs;->t(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;I)V

    .line 163
    .line 164
    .line 165
    iget-object p4, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvAlreadyChooseSongItem;->j:Lv/VText;

    .line 166
    .line 167
    iget-object p5, p2, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKTVOrder;->mask:Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 168
    .line 169
    iget-object p5, p5, Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;->name:Ljava/lang/String;

    .line 170
    .line 171
    invoke-virtual {p4, p5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 172
    .line 173
    .line 174
    iget-object p4, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvAlreadyChooseSongItem;->k:Lv/VImage;

    .line 175
    .line 176
    new-instance p5, Ll/h2r;

    .line 177
    .line 178
    invoke-direct {p5, p1, p2}, Ll/h2r;-><init>(Ll/y20;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKTVOrder;)V

    .line 179
    .line 180
    .line 181
    invoke-static {p4, p5}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 182
    .line 183
    .line 184
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvAlreadyChooseSongItem;->l:Lv/VImage;

    .line 185
    .line 186
    new-instance p4, Ll/i2r;

    .line 187
    .line 188
    invoke-direct {p4, p3, p1, p2}, Ll/i2r;-><init>(ILl/y20;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKTVOrder;)V

    .line 189
    .line 190
    .line 191
    invoke-static {p0, p4}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 192
    .line 193
    .line 194
    :cond_9
    :goto_4
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvAlreadyChooseSongItem;->j0(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

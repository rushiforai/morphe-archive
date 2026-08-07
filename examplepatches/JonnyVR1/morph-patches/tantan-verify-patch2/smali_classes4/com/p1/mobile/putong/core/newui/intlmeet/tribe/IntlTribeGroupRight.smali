.class public Lcom/p1/mobile/putong/core/newui/intlmeet/tribe/IntlTribeGroupRight;
.super Lv/VFrame;
.source "SourceFile"


# instance fields
.field public a:Lv/VDraweeView;

.field public b:Lv/VImage;

.field public c:Lv/VLinear;

.field public d:Lv/VText_NoTopPadding;

.field public e:Lv/AutoVDraweeView;

.field public f:Lv/AutoVDraweeView;

.field public g:Lv/AutoVDraweeView;

.field public h:Lv/VText_NoTopPadding;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lv/VFrame;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 5
    invoke-direct {p0, p1, p2}, Lv/VFrame;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 6
    invoke-direct {p0, p1, p2, p3}, Lv/VFrame;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method


# virtual methods
.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/newui/intlmeet/tribe/IntlTribeGroupRight;->p(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final p(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/dgp;->a(Lcom/p1/mobile/putong/core/newui/intlmeet/tribe/IntlTribeGroupRight;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public s(Lcom/p1/mobile/putong/core/data/TribeSubsetContent;Ll/ojo;II)V
    .locals 3

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    goto/16 :goto_3

    .line 4
    .line 5
    :cond_0
    const/4 v0, 0x1

    .line 6
    new-array v1, v0, [Landroid/view/View;

    .line 7
    .line 8
    const/4 v2, 0x0

    .line 9
    aput-object p0, v1, v2

    .line 10
    .line 11
    invoke-static {p3, v1}, Ll/bnl0;->D0(I[Landroid/view/View;)V

    .line 12
    .line 13
    .line 14
    invoke-static {p0, p4}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 15
    .line 16
    .line 17
    sget-object p3, Ll/uqb0;->G:Ll/fsb0;

    .line 18
    .line 19
    iget-object p4, p0, Lcom/p1/mobile/putong/core/newui/intlmeet/tribe/IntlTribeGroupRight;->a:Lv/VDraweeView;

    .line 20
    .line 21
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/TribeSubsetContent;->coverUrl:Ljava/lang/String;

    .line 22
    .line 23
    invoke-virtual {p3, p4, v1}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    iget-object p3, p1, Lcom/p1/mobile/putong/core/data/TribeSubsetContent;->profilePhoto:Ljava/util/List;

    .line 27
    .line 28
    const/4 p4, 0x2

    .line 29
    if-eqz p3, :cond_3

    .line 30
    .line 31
    invoke-interface {p3}, Ljava/util/List;->isEmpty()Z

    .line 32
    .line 33
    .line 34
    move-result p3

    .line 35
    if-nez p3, :cond_3

    .line 36
    .line 37
    iget-object p3, p1, Lcom/p1/mobile/putong/core/data/TribeSubsetContent;->profilePhoto:Ljava/util/List;

    .line 38
    .line 39
    invoke-interface {p3}, Ljava/util/List;->size()I

    .line 40
    .line 41
    .line 42
    move-result p3

    .line 43
    if-lez p3, :cond_1

    .line 44
    .line 45
    iget-object p3, p0, Lcom/p1/mobile/putong/core/newui/intlmeet/tribe/IntlTribeGroupRight;->e:Lv/AutoVDraweeView;

    .line 46
    .line 47
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/TribeSubsetContent;->profilePhoto:Ljava/util/List;

    .line 48
    .line 49
    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 50
    .line 51
    .line 52
    move-result-object v1

    .line 53
    check-cast v1, Ljava/lang/String;

    .line 54
    .line 55
    invoke-virtual {p3, v1}, Lv/AutoVDraweeView;->setImageUrl(Ljava/lang/String;)V

    .line 56
    .line 57
    .line 58
    :cond_1
    iget-object p3, p1, Lcom/p1/mobile/putong/core/data/TribeSubsetContent;->profilePhoto:Ljava/util/List;

    .line 59
    .line 60
    invoke-interface {p3}, Ljava/util/List;->size()I

    .line 61
    .line 62
    .line 63
    move-result p3

    .line 64
    if-le p3, v0, :cond_2

    .line 65
    .line 66
    iget-object p3, p0, Lcom/p1/mobile/putong/core/newui/intlmeet/tribe/IntlTribeGroupRight;->g:Lv/AutoVDraweeView;

    .line 67
    .line 68
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/TribeSubsetContent;->profilePhoto:Ljava/util/List;

    .line 69
    .line 70
    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 71
    .line 72
    .line 73
    move-result-object v1

    .line 74
    check-cast v1, Ljava/lang/String;

    .line 75
    .line 76
    invoke-virtual {p3, v1}, Lv/AutoVDraweeView;->setImageUrl(Ljava/lang/String;)V

    .line 77
    .line 78
    .line 79
    :cond_2
    iget-object p3, p1, Lcom/p1/mobile/putong/core/data/TribeSubsetContent;->profilePhoto:Ljava/util/List;

    .line 80
    .line 81
    invoke-interface {p3}, Ljava/util/List;->size()I

    .line 82
    .line 83
    .line 84
    move-result p3

    .line 85
    if-le p3, p4, :cond_3

    .line 86
    .line 87
    iget-object p3, p0, Lcom/p1/mobile/putong/core/newui/intlmeet/tribe/IntlTribeGroupRight;->f:Lv/AutoVDraweeView;

    .line 88
    .line 89
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/TribeSubsetContent;->profilePhoto:Ljava/util/List;

    .line 90
    .line 91
    invoke-interface {v1, p4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 92
    .line 93
    .line 94
    move-result-object v1

    .line 95
    check-cast v1, Ljava/lang/String;

    .line 96
    .line 97
    invoke-virtual {p3, v1}, Lv/AutoVDraweeView;->setImageUrl(Ljava/lang/String;)V

    .line 98
    .line 99
    .line 100
    :cond_3
    iget-object p3, p0, Lcom/p1/mobile/putong/core/newui/intlmeet/tribe/IntlTribeGroupRight;->h:Lv/VText_NoTopPadding;

    .line 101
    .line 102
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/TribeSubsetContent;->title:Ljava/lang/String;

    .line 103
    .line 104
    invoke-virtual {p3, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 105
    .line 106
    .line 107
    iget-object p3, p0, Lcom/p1/mobile/putong/core/newui/intlmeet/tribe/IntlTribeGroupRight;->d:Lv/VText_NoTopPadding;

    .line 108
    .line 109
    iget v1, p1, Lcom/p1/mobile/putong/core/data/TribeSubsetContent;->currentLikeMe:I

    .line 110
    .line 111
    invoke-virtual {p2, v1, v0}, Ll/ojo;->t0(IZ)Ljava/lang/String;

    .line 112
    .line 113
    .line 114
    move-result-object p2

    .line 115
    invoke-virtual {p3, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 116
    .line 117
    .line 118
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/intlmeet/tribe/IntlTribeGroupRight;->c:Lv/VLinear;

    .line 119
    .line 120
    iget p3, p1, Lcom/p1/mobile/putong/core/data/TribeSubsetContent;->currentLikeMe:I

    .line 121
    .line 122
    if-lez p3, :cond_4

    .line 123
    .line 124
    move p3, v0

    .line 125
    goto :goto_0

    .line 126
    :cond_4
    move p3, v2

    .line 127
    :goto_0
    invoke-static {p2, p3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 128
    .line 129
    .line 130
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/TribeSubsetContent;->subType:Ljava/lang/String;

    .line 131
    .line 132
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 133
    .line 134
    .line 135
    invoke-virtual {p1}, Ljava/lang/String;->hashCode()I

    .line 136
    .line 137
    .line 138
    move-result p2

    .line 139
    const/4 p3, -0x1

    .line 140
    sparse-switch p2, :sswitch_data_0

    .line 141
    .line 142
    .line 143
    :goto_1
    move v0, p3

    .line 144
    goto :goto_2

    .line 145
    :sswitch_0
    const-string p2, "new"

    .line 146
    .line 147
    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 148
    .line 149
    .line 150
    move-result p1

    .line 151
    if-nez p1, :cond_5

    .line 152
    .line 153
    goto :goto_1

    .line 154
    :cond_5
    move v0, p4

    .line 155
    goto :goto_2

    .line 156
    :sswitch_1
    const-string p2, "online"

    .line 157
    .line 158
    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 159
    .line 160
    .line 161
    move-result p1

    .line 162
    if-nez p1, :cond_7

    .line 163
    .line 164
    goto :goto_1

    .line 165
    :sswitch_2
    const-string p2, "certified"

    .line 166
    .line 167
    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 168
    .line 169
    .line 170
    move-result p1

    .line 171
    if-nez p1, :cond_6

    .line 172
    .line 173
    goto :goto_1

    .line 174
    :cond_6
    move v0, v2

    .line 175
    :cond_7
    :goto_2
    packed-switch v0, :pswitch_data_0

    .line 176
    .line 177
    .line 178
    :goto_3
    return-void

    .line 179
    :pswitch_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/intlmeet/tribe/IntlTribeGroupRight;->b:Lv/VImage;

    .line 180
    .line 181
    sget p1, Ll/gbc0;->c0:I

    .line 182
    .line 183
    invoke-virtual {p0, p1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 184
    .line 185
    .line 186
    return-void

    .line 187
    :pswitch_1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/intlmeet/tribe/IntlTribeGroupRight;->b:Lv/VImage;

    .line 188
    .line 189
    sget p1, Ll/gbc0;->b0:I

    .line 190
    .line 191
    invoke-virtual {p0, p1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 192
    .line 193
    .line 194
    return-void

    .line 195
    :pswitch_2
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/intlmeet/tribe/IntlTribeGroupRight;->b:Lv/VImage;

    .line 196
    .line 197
    sget p1, Ll/gbc0;->X:I

    .line 198
    .line 199
    invoke-virtual {p0, p1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 200
    .line 201
    .line 202
    return-void

    .line 203
    :sswitch_data_0
    .sparse-switch
        -0x53423b19 -> :sswitch_2
        -0x3c5549ad -> :sswitch_1
        0x1a9a0 -> :sswitch_0
    .end sparse-switch

    .line 204
    .line 205
    .line 206
    .line 207
    .line 208
    .line 209
    .line 210
    .line 211
    .line 212
    .line 213
    .line 214
    .line 215
    .line 216
    .line 217
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

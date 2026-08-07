.class public Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/SidesSlipItemView;
.super Lv/VLinear;
.source "SourceFile"


# instance fields
.field public c:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/SidesSlipItemView;

.field public d:Landroid/view/View;

.field public e:Landroid/widget/LinearLayout;

.field public f:Lv/VDraweeView;

.field public g:Lv/VText;

.field public h:Lv/VOnlineIndicator;

.field public i:Lv/VText;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lv/VLinear;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 5
    invoke-direct {p0, p1, p2}, Lv/VLinear;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 6
    invoke-direct {p0, p1, p2, p3}, Lv/VLinear;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method


# virtual methods
.method public final P(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/z9f0;->a(Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/SidesSlipItemView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public Q(ZLcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipItemData;I)V
    .locals 8

    .line 1
    const-string v0, "\u5206\u4eab"

    .line 2
    .line 3
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipItemData;->getTitle()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    invoke-static {}, Ll/gra;->M2()Z

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    const/4 v2, 0x1

    .line 16
    const/4 v3, 0x0

    .line 17
    if-eqz v1, :cond_0

    .line 18
    .line 19
    invoke-static {}, Ll/pzi0;->o()J

    .line 20
    .line 21
    .line 22
    move-result-wide v4

    .line 23
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 24
    .line 25
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->k2:Ll/j7b;

    .line 26
    .line 27
    iget-object v1, v1, Ll/j7b;->R:Ll/byd0;

    .line 28
    .line 29
    invoke-virtual {v1}, Ll/azd0;->get()Ljava/lang/Object;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    check-cast v1, Ljava/lang/Long;

    .line 34
    .line 35
    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    .line 36
    .line 37
    .line 38
    move-result-wide v6

    .line 39
    cmp-long v1, v4, v6

    .line 40
    .line 41
    if-ltz v1, :cond_1

    .line 42
    .line 43
    :cond_0
    invoke-static {}, Ll/pzi0;->o()J

    .line 44
    .line 45
    .line 46
    move-result-wide v4

    .line 47
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 48
    .line 49
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->k2:Ll/j7b;

    .line 50
    .line 51
    iget-object v1, v1, Ll/j7b;->Y:Ll/byd0;

    .line 52
    .line 53
    invoke-virtual {v1}, Ll/azd0;->get()Ljava/lang/Object;

    .line 54
    .line 55
    .line 56
    move-result-object v1

    .line 57
    check-cast v1, Ljava/lang/Long;

    .line 58
    .line 59
    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    .line 60
    .line 61
    .line 62
    move-result-wide v6

    .line 63
    cmp-long v1, v4, v6

    .line 64
    .line 65
    if-gez v1, :cond_2

    .line 66
    .line 67
    :cond_1
    move v1, v2

    .line 68
    goto :goto_0

    .line 69
    :cond_2
    move v1, v3

    .line 70
    :goto_0
    if-eqz p1, :cond_5

    .line 71
    .line 72
    invoke-static {}, Ll/gra;->o2()Z

    .line 73
    .line 74
    .line 75
    move-result p1

    .line 76
    if-nez p1, :cond_5

    .line 77
    .line 78
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/SidesSlipItemView;->d:Landroid/view/View;

    .line 79
    .line 80
    if-nez v0, :cond_4

    .line 81
    .line 82
    const/4 v0, 0x4

    .line 83
    if-ne p3, v0, :cond_3

    .line 84
    .line 85
    goto :goto_1

    .line 86
    :cond_3
    move v2, v3

    .line 87
    :cond_4
    :goto_1
    invoke-static {p1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 88
    .line 89
    .line 90
    goto :goto_5

    .line 91
    :cond_5
    if-nez v1, :cond_9

    .line 92
    .line 93
    invoke-static {}, Ll/gra;->o2()Z

    .line 94
    .line 95
    .line 96
    move-result p1

    .line 97
    if-eqz p1, :cond_6

    .line 98
    .line 99
    goto :goto_3

    .line 100
    :cond_6
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/SidesSlipItemView;->d:Landroid/view/View;

    .line 101
    .line 102
    if-nez v0, :cond_8

    .line 103
    .line 104
    const/4 v0, 0x2

    .line 105
    if-ne p3, v0, :cond_7

    .line 106
    .line 107
    goto :goto_2

    .line 108
    :cond_7
    move v2, v3

    .line 109
    :cond_8
    :goto_2
    invoke-static {p1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 110
    .line 111
    .line 112
    goto :goto_5

    .line 113
    :cond_9
    :goto_3
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/SidesSlipItemView;->d:Landroid/view/View;

    .line 114
    .line 115
    if-nez v0, :cond_b

    .line 116
    .line 117
    const/4 v0, 0x3

    .line 118
    if-ne p3, v0, :cond_a

    .line 119
    .line 120
    goto :goto_4

    .line 121
    :cond_a
    move v2, v3

    .line 122
    :cond_b
    :goto_4
    invoke-static {p1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 123
    .line 124
    .line 125
    :goto_5
    const-string p1, "online"

    .line 126
    .line 127
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipItemData;->getType()Ljava/lang/String;

    .line 128
    .line 129
    .line 130
    move-result-object v0

    .line 131
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 132
    .line 133
    .line 134
    move-result p1

    .line 135
    if-eqz p1, :cond_c

    .line 136
    .line 137
    sget-object p1, Ll/uqb0;->G:Ll/fsb0;

    .line 138
    .line 139
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/SidesSlipItemView;->f:Lv/VDraweeView;

    .line 140
    .line 141
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipItemData;->getIconUrl()Ljava/lang/String;

    .line 142
    .line 143
    .line 144
    move-result-object v1

    .line 145
    invoke-virtual {p1, v0, v1}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 146
    .line 147
    .line 148
    goto :goto_6

    .line 149
    :cond_c
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/SidesSlipItemView;->f:Lv/VDraweeView;

    .line 150
    .line 151
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipItemData;->getNativeIcon()I

    .line 152
    .line 153
    .line 154
    move-result v0

    .line 155
    invoke-virtual {p1, v0}, Lcom/facebook/drawee/view/SimpleDraweeView;->setImageResource(I)V

    .line 156
    .line 157
    .line 158
    :goto_6
    invoke-static {}, Ll/gra;->z()Z

    .line 159
    .line 160
    .line 161
    move-result p1

    .line 162
    if-eqz p1, :cond_e

    .line 163
    .line 164
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/SidesSlipItemView;->g:Lv/VText;

    .line 165
    .line 166
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 167
    .line 168
    .line 169
    move-result-object v0

    .line 170
    sget v1, Ll/c9c0;->x:I

    .line 171
    .line 172
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getColor(I)I

    .line 173
    .line 174
    .line 175
    move-result v0

    .line 176
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 177
    .line 178
    .line 179
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/SidesSlipItemView;->e:Landroid/widget/LinearLayout;

    .line 180
    .line 181
    if-nez p3, :cond_d

    .line 182
    .line 183
    sget p3, Ll/qa00;->h:I

    .line 184
    .line 185
    invoke-static {p1, p3}, Ll/bnl0;->f0(Landroid/view/View;I)V

    .line 186
    .line 187
    .line 188
    goto :goto_7

    .line 189
    :cond_d
    sget p3, Ll/qa00;->i:I

    .line 190
    .line 191
    invoke-static {p1, p3}, Ll/bnl0;->f0(Landroid/view/View;I)V

    .line 192
    .line 193
    .line 194
    :cond_e
    :goto_7
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/SidesSlipItemView;->g:Lv/VText;

    .line 195
    .line 196
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipItemData;->getTitle()Ljava/lang/String;

    .line 197
    .line 198
    .line 199
    move-result-object p3

    .line 200
    invoke-virtual {p1, p3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 201
    .line 202
    .line 203
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/SidesSlipItemView;->h:Lv/VOnlineIndicator;

    .line 204
    .line 205
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipItemData;->getShowDot()Ljava/lang/Boolean;

    .line 206
    .line 207
    .line 208
    move-result-object p3

    .line 209
    invoke-virtual {p3}, Ljava/lang/Boolean;->booleanValue()Z

    .line 210
    .line 211
    .line 212
    move-result p3

    .line 213
    invoke-static {p1, p3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 214
    .line 215
    .line 216
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/SidesSlipItemView;->i:Lv/VText;

    .line 217
    .line 218
    invoke-static {p1, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 219
    .line 220
    .line 221
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipItemData;->getTitle()Ljava/lang/String;

    .line 222
    .line 223
    .line 224
    move-result-object p1

    .line 225
    const-string p2, "\u60ca\u559c\u793c\u76d2"

    .line 226
    .line 227
    invoke-static {p1, p2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 228
    .line 229
    .line 230
    move-result p1

    .line 231
    if-eqz p1, :cond_f

    .line 232
    .line 233
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/SidesSlipItemView;->i:Lv/VText;

    .line 234
    .line 235
    invoke-static {p0}, Ll/j7b;->r3(Lv/VText;)V

    .line 236
    .line 237
    .line 238
    :cond_f
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/SidesSlipItemView;->P(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

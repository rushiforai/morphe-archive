.class public Lcom/p1/mobile/putong/core/newui/messages/expirence/view/ItemFinishedChallengeView;
.super Landroid/widget/RelativeLayout;
.source "SourceFile"


# instance fields
.field public a:Lcom/p1/mobile/putong/core/newui/messages/expirence/view/ItemFinishedChallengeView;

.field public b:Landroid/widget/RelativeLayout;

.field public c:Lv/VDraweeView;

.field public d:Lv/VText;

.field public e:Lv/VText;

.field public f:Lv/VText;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 5
    invoke-direct {p0, p1, p2}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 6
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .locals 0

    .line 7
    invoke-direct {p0, p1, p2, p3, p4}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/core/newui/messages/expirence/view/ItemFinishedChallengeView;Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/android/app/Act;Landroid/view/View;)Z
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/newui/messages/expirence/view/ItemFinishedChallengeView;->e(Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/android/app/Act;Landroid/view/View;)Z

    move-result p0

    return p0
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/core/newui/messages/expirence/view/ItemFinishedChallengeView;Lcom/p1/mobile/putong/core/data/ChallengeMsg;Ll/n100;Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual/range {p0 .. p5}, Lcom/p1/mobile/putong/core/newui/messages/expirence/view/ItemFinishedChallengeView;->d(Lcom/p1/mobile/putong/core/data/ChallengeMsg;Ll/n100;Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public final c(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/q5q;->a(Lcom/p1/mobile/putong/core/newui/messages/expirence/view/ItemFinishedChallengeView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic d(Lcom/p1/mobile/putong/core/data/ChallengeMsg;Ll/n100;Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Landroid/view/View;)V
    .locals 3

    .line 1
    iget-object p5, p1, Lcom/p1/mobile/putong/core/data/ChallengeMsg;->source:Ljava/lang/String;

    .line 2
    .line 3
    const-string v0, "murderMystery"

    .line 4
    .line 5
    invoke-static {p5, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result p5

    .line 9
    const/4 v0, 0x0

    .line 10
    if-eqz p5, :cond_0

    .line 11
    .line 12
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/ChallengeMsg;->eventlog:Ljava/lang/String;

    .line 13
    .line 14
    invoke-virtual {p0, v0, p1, p2}, Lcom/p1/mobile/putong/core/newui/messages/expirence/view/ItemFinishedChallengeView;->g(ZLjava/lang/String;Ll/n100;)V

    .line 15
    .line 16
    .line 17
    return-void

    .line 18
    :cond_0
    iget-object p5, p1, Lcom/p1/mobile/putong/core/data/ChallengeMsg;->link:Ljava/lang/String;

    .line 19
    .line 20
    invoke-static {p5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 21
    .line 22
    .line 23
    move-result p5

    .line 24
    if-eqz p5, :cond_1

    .line 25
    .line 26
    return-void

    .line 27
    :cond_1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 28
    .line 29
    .line 30
    move-result-object p5

    .line 31
    invoke-virtual {p5}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 32
    .line 33
    .line 34
    move-result-object p5

    .line 35
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/ChallengeMsg;->link:Ljava/lang/String;

    .line 36
    .line 37
    iget-object p4, p4, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 38
    .line 39
    const-string v2, "conversation"

    .line 40
    .line 41
    invoke-interface {p5, p3, v1, p4, v2}, Ll/r97;->d5(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/ChallengeMsg;->eventlog:Ljava/lang/String;

    .line 45
    .line 46
    invoke-virtual {p0, v0, p1, p2}, Lcom/p1/mobile/putong/core/newui/messages/expirence/view/ItemFinishedChallengeView;->h(ZLjava/lang/String;Ll/n100;)V

    .line 47
    .line 48
    .line 49
    return-void
.end method

.method public final synthetic e(Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/android/app/Act;Landroid/view/View;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/expirence/view/ItemFinishedChallengeView;->b:Landroid/widget/RelativeLayout;

    .line 2
    .line 3
    invoke-static {p1, p0, p2}, Ll/snc0;->i(Lcom/p1/mobile/putong/core/data/Message;Landroid/view/View;Lcom/p1/mobile/android/app/Act;)V

    .line 4
    .line 5
    .line 6
    const/4 p0, 0x1

    .line 7
    return p0
.end method

.method public f(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/data/User;Ll/n100;)V
    .locals 9

    .line 1
    iget-object v0, p2, Lcom/p1/mobile/putong/core/data/Message;->msgData:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/p1/mobile/putong/core/data/ChallengeMsgList;->parse(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/ChallengeMsgList;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-virtual {v1}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-interface {v1, v0, p2}, Ll/r97;->y5(Lcom/p1/mobile/putong/core/data/ChallengeMsgList;Lcom/p1/mobile/putong/core/data/Message;)Lcom/p1/mobile/putong/core/data/ChallengeMsg;

    .line 16
    .line 17
    .line 18
    move-result-object v4

    .line 19
    invoke-static {v4}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-nez v0, :cond_0

    .line 24
    .line 25
    goto/16 :goto_3

    .line 26
    .line 27
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/expirence/view/ItemFinishedChallengeView;->a:Lcom/p1/mobile/putong/core/newui/messages/expirence/view/ItemFinishedChallengeView;

    .line 28
    .line 29
    sget v1, Ll/qa00;->q:I

    .line 30
    .line 31
    invoke-static {v0, v1}, Ll/bnl0;->c0(Landroid/view/View;I)V

    .line 32
    .line 33
    .line 34
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/expirence/view/ItemFinishedChallengeView;->d:Lv/VText;

    .line 35
    .line 36
    const/high16 v1, 0x41700000    # 15.0f

    .line 37
    .line 38
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextSize(F)V

    .line 39
    .line 40
    .line 41
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/expirence/view/ItemFinishedChallengeView;->d:Lv/VText;

    .line 42
    .line 43
    iget-object v1, v4, Lcom/p1/mobile/putong/core/data/ChallengeMsg;->title:Ljava/lang/String;

    .line 44
    .line 45
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 46
    .line 47
    .line 48
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/expirence/view/ItemFinishedChallengeView;->e:Lv/VText;

    .line 49
    .line 50
    iget-object v1, v4, Lcom/p1/mobile/putong/core/data/ChallengeMsg;->subTitle:Ljava/lang/String;

    .line 51
    .line 52
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 53
    .line 54
    .line 55
    iget-object v0, v4, Lcom/p1/mobile/putong/core/data/ChallengeMsg;->buttonText:Ljava/lang/String;

    .line 56
    .line 57
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 58
    .line 59
    .line 60
    move-result v0

    .line 61
    const/4 v1, 0x0

    .line 62
    const/high16 v2, 0x40e00000    # 7.0f

    .line 63
    .line 64
    const/4 v8, 0x1

    .line 65
    if-nez v0, :cond_1

    .line 66
    .line 67
    iget-object v0, v4, Lcom/p1/mobile/putong/core/data/ChallengeMsg;->type:Ljava/lang/String;

    .line 68
    .line 69
    const-string v3, "stripes"

    .line 70
    .line 71
    invoke-static {v0, v3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 72
    .line 73
    .line 74
    move-result v0

    .line 75
    if-eqz v0, :cond_1

    .line 76
    .line 77
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/expirence/view/ItemFinishedChallengeView;->f:Lv/VText;

    .line 78
    .line 79
    iget-object v3, v4, Lcom/p1/mobile/putong/core/data/ChallengeMsg;->buttonText:Ljava/lang/String;

    .line 80
    .line 81
    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 82
    .line 83
    .line 84
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/expirence/view/ItemFinishedChallengeView;->f:Lv/VText;

    .line 85
    .line 86
    invoke-virtual {v0, v8}, Landroid/widget/TextView;->setIncludeFontPadding(Z)V

    .line 87
    .line 88
    .line 89
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/expirence/view/ItemFinishedChallengeView;->f:Lv/VText;

    .line 90
    .line 91
    sget v3, Ll/qa00;->j:I

    .line 92
    .line 93
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 94
    .line 95
    .line 96
    move-result v5

    .line 97
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 98
    .line 99
    .line 100
    move-result v6

    .line 101
    invoke-virtual {v0, v3, v5, v3, v6}, Landroid/view/View;->setPadding(IIII)V

    .line 102
    .line 103
    .line 104
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/expirence/view/ItemFinishedChallengeView;->f:Lv/VText;

    .line 105
    .line 106
    invoke-virtual {v0, v1, v8}, Landroidx/appcompat/widget/AppCompatTextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 107
    .line 108
    .line 109
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/expirence/view/ItemFinishedChallengeView;->f:Lv/VText;

    .line 110
    .line 111
    invoke-static {v0, v8}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 112
    .line 113
    .line 114
    goto :goto_0

    .line 115
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/expirence/view/ItemFinishedChallengeView;->f:Lv/VText;

    .line 116
    .line 117
    const/4 v3, 0x0

    .line 118
    invoke-static {v0, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 119
    .line 120
    .line 121
    :goto_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/expirence/view/ItemFinishedChallengeView;->e:Lv/VText;

    .line 122
    .line 123
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 124
    .line 125
    .line 126
    move-result v2

    .line 127
    invoke-static {v0, v2}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 128
    .line 129
    .line 130
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/expirence/view/ItemFinishedChallengeView;->d:Lv/VText;

    .line 131
    .line 132
    invoke-virtual {v0, v1, v8}, Landroidx/appcompat/widget/AppCompatTextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 133
    .line 134
    .line 135
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 136
    .line 137
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/expirence/view/ItemFinishedChallengeView;->c:Lv/VDraweeView;

    .line 138
    .line 139
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 140
    .line 141
    .line 142
    move-result-object v2

    .line 143
    invoke-virtual {v2}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 144
    .line 145
    .line 146
    move-result-object v2

    .line 147
    invoke-interface {v2}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->I4()Z

    .line 148
    .line 149
    .line 150
    move-result v2

    .line 151
    if-eqz v2, :cond_2

    .line 152
    .line 153
    sget v2, Ll/ibc0;->T5:I

    .line 154
    .line 155
    goto :goto_1

    .line 156
    :cond_2
    sget v2, Ll/ibc0;->S5:I

    .line 157
    .line 158
    :goto_1
    invoke-virtual {v0, v1, v2}, Ll/fsb0;->Y0(Lcom/facebook/drawee/view/SimpleDraweeView;I)V

    .line 159
    .line 160
    .line 161
    iget-object v0, v4, Lcom/p1/mobile/putong/core/data/ChallengeMsg;->picUrl:Ljava/lang/String;

    .line 162
    .line 163
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 164
    .line 165
    .line 166
    move-result v0

    .line 167
    if-nez v0, :cond_3

    .line 168
    .line 169
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 170
    .line 171
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/expirence/view/ItemFinishedChallengeView;->c:Lv/VDraweeView;

    .line 172
    .line 173
    iget-object v2, v4, Lcom/p1/mobile/putong/core/data/ChallengeMsg;->picUrl:Ljava/lang/String;

    .line 174
    .line 175
    invoke-virtual {v0, v1, v2}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 176
    .line 177
    .line 178
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/expirence/view/ItemFinishedChallengeView;->b:Landroid/widget/RelativeLayout;

    .line 179
    .line 180
    new-instance v2, Ll/o5q;

    .line 181
    .line 182
    move-object v3, p0

    .line 183
    move-object v6, p1

    .line 184
    move-object v7, p3

    .line 185
    move-object v5, p4

    .line 186
    invoke-direct/range {v2 .. v7}, Ll/o5q;-><init>(Lcom/p1/mobile/putong/core/newui/messages/expirence/view/ItemFinishedChallengeView;Lcom/p1/mobile/putong/core/data/ChallengeMsg;Ll/n100;Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;)V

    .line 187
    .line 188
    .line 189
    invoke-static {v0, v2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 190
    .line 191
    .line 192
    iget-object p0, v4, Lcom/p1/mobile/putong/core/data/ChallengeMsg;->source:Ljava/lang/String;

    .line 193
    .line 194
    const-string p1, "murderMystery"

    .line 195
    .line 196
    invoke-static {p0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 197
    .line 198
    .line 199
    move-result p0

    .line 200
    iget-object p1, v4, Lcom/p1/mobile/putong/core/data/ChallengeMsg;->eventlog:Ljava/lang/String;

    .line 201
    .line 202
    if-eqz p0, :cond_4

    .line 203
    .line 204
    invoke-virtual {v3, v8, p1, v5}, Lcom/p1/mobile/putong/core/newui/messages/expirence/view/ItemFinishedChallengeView;->g(ZLjava/lang/String;Ll/n100;)V

    .line 205
    .line 206
    .line 207
    goto :goto_2

    .line 208
    :cond_4
    invoke-virtual {v3, v8, p1, v5}, Lcom/p1/mobile/putong/core/newui/messages/expirence/view/ItemFinishedChallengeView;->h(ZLjava/lang/String;Ll/n100;)V

    .line 209
    .line 210
    .line 211
    :goto_2
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/data/Message;->isMe()Z

    .line 212
    .line 213
    .line 214
    move-result p0

    .line 215
    if-eqz p0, :cond_5

    .line 216
    .line 217
    iget-object p0, v3, Lcom/p1/mobile/putong/core/newui/messages/expirence/view/ItemFinishedChallengeView;->b:Landroid/widget/RelativeLayout;

    .line 218
    .line 219
    new-instance p1, Ll/p5q;

    .line 220
    .line 221
    invoke-direct {p1, v3, p2, v6}, Ll/p5q;-><init>(Lcom/p1/mobile/putong/core/newui/messages/expirence/view/ItemFinishedChallengeView;Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/android/app/Act;)V

    .line 222
    .line 223
    .line 224
    invoke-virtual {p0, p1}, Landroid/view/View;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 225
    .line 226
    .line 227
    :cond_5
    :goto_3
    return-void
.end method

.method public final g(ZLjava/lang/String;Ll/n100;)V
    .locals 0

    .line 1
    const-string p0, "p_chat_view"

    .line 2
    .line 3
    if-eqz p1, :cond_1

    .line 4
    .line 5
    invoke-virtual {p3, p2}, Ll/n100;->a(Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    invoke-virtual {p3, p2}, Ll/n100;->b(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    invoke-static {p2, p0}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    return-void

    .line 19
    :cond_1
    invoke-static {p2, p0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public final h(ZLjava/lang/String;Ll/n100;)V
    .locals 3

    .line 1
    const-string p0, "in_harmony_test_string"

    .line 2
    .line 3
    const-string v0, "p_chat_view"

    .line 4
    .line 5
    const-string v1, "e_in_harmony_test_entrance1_messege_card"

    .line 6
    .line 7
    if-eqz p1, :cond_1

    .line 8
    .line 9
    const-string p1, "FINISH_CHALLENGE_MV_KEY"

    .line 10
    .line 11
    invoke-virtual {p3, p1}, Ll/n100;->a(Ljava/lang/String;)Z

    .line 12
    .line 13
    .line 14
    move-result v2

    .line 15
    if-eqz v2, :cond_0

    .line 16
    .line 17
    return-void

    .line 18
    :cond_0
    invoke-virtual {p3, p1}, Ll/n100;->b(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    invoke-static {p0, p2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    filled-new-array {p0}, [Ll/pf60;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    invoke-static {v1, v0, p0}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 30
    .line 31
    .line 32
    return-void

    .line 33
    :cond_1
    invoke-static {p0, p2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    filled-new-array {p0}, [Ll/pf60;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    invoke-static {v1, v0, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 42
    .line 43
    .line 44
    return-void
.end method

.method public onFinishInflate()V
    .locals 4

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/newui/messages/expirence/view/ItemFinishedChallengeView;->c(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->I4()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    sget v0, Ll/qa00;->z:I

    .line 22
    .line 23
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/expirence/view/ItemFinishedChallengeView;->c:Lv/VDraweeView;

    .line 24
    .line 25
    const/4 v2, 0x1

    .line 26
    new-array v2, v2, [Landroid/view/View;

    .line 27
    .line 28
    const/4 v3, 0x0

    .line 29
    aput-object v1, v2, v3

    .line 30
    .line 31
    invoke-static {v0, v2}, Ll/bnl0;->D0(I[Landroid/view/View;)V

    .line 32
    .line 33
    .line 34
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/expirence/view/ItemFinishedChallengeView;->c:Lv/VDraweeView;

    .line 35
    .line 36
    invoke-static {v1, v0}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 37
    .line 38
    .line 39
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/expirence/view/ItemFinishedChallengeView;->c:Lv/VDraweeView;

    .line 40
    .line 41
    sget v1, Ll/ibc0;->T5:I

    .line 42
    .line 43
    invoke-static {v0, v1}, Ll/bnl0;->N(Landroid/widget/ImageView;I)V

    .line 44
    .line 45
    .line 46
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/expirence/view/ItemFinishedChallengeView;->d:Lv/VText;

    .line 47
    .line 48
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 49
    .line 50
    .line 51
    move-result-object v1

    .line 52
    sget v2, Ll/g9c0;->g:I

    .line 53
    .line 54
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    .line 55
    .line 56
    .line 57
    move-result v1

    .line 58
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 59
    .line 60
    .line 61
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/expirence/view/ItemFinishedChallengeView;->e:Lv/VText;

    .line 62
    .line 63
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 64
    .line 65
    .line 66
    move-result-object v1

    .line 67
    sget v2, Ll/g9c0;->i:I

    .line 68
    .line 69
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    .line 70
    .line 71
    .line 72
    move-result v1

    .line 73
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 74
    .line 75
    .line 76
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/expirence/view/ItemFinishedChallengeView;->f:Lv/VText;

    .line 77
    .line 78
    sget v0, Ll/ibc0;->t:I

    .line 79
    .line 80
    invoke-virtual {p0, v0}, Landroidx/appcompat/widget/AppCompatTextView;->setBackgroundResource(I)V

    .line 81
    .line 82
    .line 83
    :cond_0
    return-void
.end method

.class public Ll/r4n0;
.super Ll/l4n0;
.source "SourceFile"


# instance fields
.field public final p:Ll/k4n0;


# direct methods
.method public constructor <init>(Ll/k4n0;Landroid/view/View;Lcom/p1/mobile/putong/data/PushMessage;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p2, p3, p4}, Ll/l4n0;-><init>(Landroid/view/View;Lcom/p1/mobile/putong/data/PushMessage;I)V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/r4n0;->p:Ll/k4n0;

    .line 5
    .line 6
    return-void
.end method

.method public static synthetic d(Ll/r4n0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/r4n0;->h(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic e(Ll/r4n0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/r4n0;->g(Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public c()V
    .locals 9

    .line 1
    iget-object v0, p0, Ll/l4n0;->c:Lcom/p1/mobile/putong/data/PushMessage;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/data/PushMessage;->messageCustom:Lcom/p1/mobile/putong/data/PushMessageCustom;

    .line 4
    .line 5
    if-eqz v0, :cond_5

    .line 6
    .line 7
    iget-object v1, p0, Ll/l4n0;->e:Lv/VDraweeView;

    .line 8
    .line 9
    sget v2, Ll/nbc0;->k1:I

    .line 10
    .line 11
    invoke-virtual {v1, v2}, Lcom/facebook/drawee/view/SimpleDraweeView;->setActualImageResource(I)V

    .line 12
    .line 13
    .line 14
    iget-object v1, p0, Ll/l4n0;->f:Landroid/widget/TextView;

    .line 15
    .line 16
    const-string v2, "\u804a\u5929\u5ba4"

    .line 17
    .line 18
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 19
    .line 20
    .line 21
    iget-object v1, p0, Ll/l4n0;->g:Lv/VText;

    .line 22
    .line 23
    iget-object v2, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->text:Ljava/lang/String;

    .line 24
    .line 25
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 26
    .line 27
    .line 28
    iget-object v1, p0, Ll/l4n0;->m:Lv/VText;

    .line 29
    .line 30
    iget-object v2, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->content:Ljava/lang/String;

    .line 31
    .line 32
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 33
    .line 34
    .line 35
    iget-object v1, p0, Ll/l4n0;->h:Lv/VDraweeView;

    .line 36
    .line 37
    iget-object v2, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->image:Ljava/lang/String;

    .line 38
    .line 39
    const-string v3, "context_livingAct"

    .line 40
    .line 41
    invoke-static {v3, v1, v2}, Ll/izs;->s(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    iget-object v1, p0, Ll/l4n0;->i:Landroid/widget/TextView;

    .line 45
    .line 46
    iget-object v2, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->title:Ljava/lang/String;

    .line 47
    .line 48
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 49
    .line 50
    .line 51
    iget-object v1, p0, Ll/l4n0;->l:Lv/VText;

    .line 52
    .line 53
    const-string v2, "\u5728\u7ebf"

    .line 54
    .line 55
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 56
    .line 57
    .line 58
    iget-object v1, p0, Ll/l4n0;->j:Lv/VImage;

    .line 59
    .line 60
    const/4 v2, 0x4

    .line 61
    invoke-virtual {v1, v2}, Landroid/view/View;->setVisibility(I)V

    .line 62
    .line 63
    .line 64
    iget-object v1, p0, Ll/l4n0;->k:Lv/VText;

    .line 65
    .line 66
    iget-object v2, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->ext:Ljava/lang/String;

    .line 67
    .line 68
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 69
    .line 70
    .line 71
    iget-object v1, p0, Ll/l4n0;->n:Landroid/widget/TextView;

    .line 72
    .line 73
    iget-object v2, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->buttonText:Ljava/lang/String;

    .line 74
    .line 75
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 76
    .line 77
    .line 78
    iget-object v1, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->state:Ljava/lang/String;

    .line 79
    .line 80
    const/4 v2, 0x0

    .line 81
    if-eqz v1, :cond_4

    .line 82
    .line 83
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 84
    .line 85
    .line 86
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 87
    .line 88
    .line 89
    move-result v3

    .line 90
    const/4 v4, -0x1

    .line 91
    sparse-switch v3, :sswitch_data_0

    .line 92
    .line 93
    .line 94
    goto :goto_0

    .line 95
    :sswitch_0
    const-string v3, "following"

    .line 96
    .line 97
    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 98
    .line 99
    .line 100
    move-result v1

    .line 101
    if-nez v1, :cond_0

    .line 102
    .line 103
    goto :goto_0

    .line 104
    :cond_0
    const/4 v4, 0x3

    .line 105
    goto :goto_0

    .line 106
    :sswitch_1
    const-string v3, "liked"

    .line 107
    .line 108
    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 109
    .line 110
    .line 111
    move-result v1

    .line 112
    if-nez v1, :cond_1

    .line 113
    .line 114
    goto :goto_0

    .line 115
    :cond_1
    const/4 v4, 0x2

    .line 116
    goto :goto_0

    .line 117
    :sswitch_2
    const-string v3, "friends"

    .line 118
    .line 119
    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 120
    .line 121
    .line 122
    move-result v1

    .line 123
    if-nez v1, :cond_2

    .line 124
    .line 125
    goto :goto_0

    .line 126
    :cond_2
    const/4 v4, 0x1

    .line 127
    goto :goto_0

    .line 128
    :sswitch_3
    const-string v3, "super_like"

    .line 129
    .line 130
    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 131
    .line 132
    .line 133
    move-result v1

    .line 134
    if-nez v1, :cond_3

    .line 135
    .line 136
    goto :goto_0

    .line 137
    :cond_3
    move v4, v2

    .line 138
    :goto_0
    packed-switch v4, :pswitch_data_0

    .line 139
    .line 140
    .line 141
    move v1, v2

    .line 142
    goto :goto_1

    .line 143
    :pswitch_0
    sget v1, Ll/nbc0;->x1:I

    .line 144
    .line 145
    goto :goto_1

    .line 146
    :pswitch_1
    sget v1, Ll/nbc0;->z1:I

    .line 147
    .line 148
    goto :goto_1

    .line 149
    :pswitch_2
    sget v1, Ll/nbc0;->y1:I

    .line 150
    .line 151
    goto :goto_1

    .line 152
    :pswitch_3
    sget v1, Ll/nbc0;->A1:I

    .line 153
    .line 154
    :goto_1
    iget-object v3, p0, Ll/l4n0;->o:Lv/VText;

    .line 155
    .line 156
    invoke-virtual {v3, v1, v2, v2, v2}, Landroidx/appcompat/widget/AppCompatTextView;->setCompoundDrawablesWithIntrinsicBounds(IIII)V

    .line 157
    .line 158
    .line 159
    :cond_4
    iget-object v1, p0, Ll/l4n0;->o:Lv/VText;

    .line 160
    .line 161
    invoke-virtual {v1, v2}, Landroid/view/View;->setVisibility(I)V

    .line 162
    .line 163
    .line 164
    iget-object v1, p0, Ll/l4n0;->o:Lv/VText;

    .line 165
    .line 166
    iget-object v2, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->subTitle:Ljava/lang/String;

    .line 167
    .line 168
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 169
    .line 170
    .line 171
    iget-object v1, p0, Ll/l4n0;->n:Landroid/widget/TextView;

    .line 172
    .line 173
    new-instance v2, Ll/p4n0;

    .line 174
    .line 175
    invoke-direct {v2, p0}, Ll/p4n0;-><init>(Ll/r4n0;)V

    .line 176
    .line 177
    .line 178
    invoke-static {v1, v2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 179
    .line 180
    .line 181
    iget-object v1, p0, Ll/l4n0;->d:Landroid/view/View;

    .line 182
    .line 183
    new-instance v2, Ll/q4n0;

    .line 184
    .line 185
    invoke-direct {v2, p0}, Ll/q4n0;-><init>(Ll/r4n0;)V

    .line 186
    .line 187
    .line 188
    invoke-static {v1, v2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 189
    .line 190
    .line 191
    :cond_5
    iget-object v3, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->liveId:Ljava/lang/String;

    .line 192
    .line 193
    iget-object v4, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->userId:Ljava/lang/String;

    .line 194
    .line 195
    iget-object p0, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->otherID:Ljava/lang/String;

    .line 196
    .line 197
    invoke-virtual {v4, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 198
    .line 199
    .line 200
    move-result v6

    .line 201
    const/4 v7, 0x0

    .line 202
    iget-object v8, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->source:Ljava/lang/String;

    .line 203
    .line 204
    const-string v5, "NA"

    .line 205
    .line 206
    invoke-static/range {v3 .. v8}, Ll/s4n0;->c(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZZLjava/lang/String;)V

    .line 207
    .line 208
    .line 209
    return-void

    .line 210
    nop

    .line 211
    :sswitch_data_0
    .sparse-switch
        -0x666c9225 -> :sswitch_3
        -0x23c4b66b -> :sswitch_2
        0x62343ad -> :sswitch_1
        0x2da6f291 -> :sswitch_0
    .end sparse-switch

    .line 212
    .line 213
    .line 214
    .line 215
    .line 216
    .line 217
    .line 218
    .line 219
    .line 220
    .line 221
    .line 222
    .line 223
    .line 224
    .line 225
    .line 226
    .line 227
    .line 228
    .line 229
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public final f()V
    .locals 10

    .line 1
    iget-object v0, p0, Ll/l4n0;->c:Lcom/p1/mobile/putong/data/PushMessage;

    .line 2
    .line 3
    iget-object v1, v0, Lcom/p1/mobile/putong/data/PushMessage;->messageCustom:Lcom/p1/mobile/putong/data/PushMessageCustom;

    .line 4
    .line 5
    iget-object v0, v0, Lcom/p1/mobile/putong/data/PushMessage;->link:Ljava/lang/String;

    .line 6
    .line 7
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_3

    .line 12
    .line 13
    iget-object v0, p0, Ll/l4n0;->n:Landroid/widget/TextView;

    .line 14
    .line 15
    if-eqz v0, :cond_3

    .line 16
    .line 17
    if-eqz v1, :cond_3

    .line 18
    .line 19
    iget-object v0, p0, Ll/l4n0;->c:Lcom/p1/mobile/putong/data/PushMessage;

    .line 20
    .line 21
    iget-object v0, v0, Lcom/p1/mobile/putong/data/PushMessage;->link:Ljava/lang/String;

    .line 22
    .line 23
    if-eqz v0, :cond_0

    .line 24
    .line 25
    const-string v2, "source="

    .line 26
    .line 27
    invoke-virtual {v0, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-nez v0, :cond_0

    .line 32
    .line 33
    iget-object v0, p0, Ll/l4n0;->c:Lcom/p1/mobile/putong/data/PushMessage;

    .line 34
    .line 35
    new-instance v2, Ljava/lang/StringBuilder;

    .line 36
    .line 37
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 38
    .line 39
    .line 40
    iget-object v3, p0, Ll/l4n0;->c:Lcom/p1/mobile/putong/data/PushMessage;

    .line 41
    .line 42
    iget-object v3, v3, Lcom/p1/mobile/putong/data/PushMessage;->link:Ljava/lang/String;

    .line 43
    .line 44
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 45
    .line 46
    .line 47
    const-string v3, "&source=start-push"

    .line 48
    .line 49
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 50
    .line 51
    .line 52
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object v2

    .line 56
    iput-object v2, v0, Lcom/p1/mobile/putong/data/PushMessage;->link:Ljava/lang/String;

    .line 57
    .line 58
    :cond_0
    iget-object v0, p0, Ll/l4n0;->c:Lcom/p1/mobile/putong/data/PushMessage;

    .line 59
    .line 60
    iget-object v0, v0, Lcom/p1/mobile/putong/data/PushMessage;->link:Ljava/lang/String;

    .line 61
    .line 62
    if-eqz v0, :cond_1

    .line 63
    .line 64
    const-string v2, "liveMode=virtualAvatar"

    .line 65
    .line 66
    invoke-virtual {v0, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 67
    .line 68
    .line 69
    move-result v0

    .line 70
    if-nez v0, :cond_1

    .line 71
    .line 72
    iget-object v0, p0, Ll/l4n0;->c:Lcom/p1/mobile/putong/data/PushMessage;

    .line 73
    .line 74
    new-instance v2, Ljava/lang/StringBuilder;

    .line 75
    .line 76
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 77
    .line 78
    .line 79
    iget-object v3, p0, Ll/l4n0;->c:Lcom/p1/mobile/putong/data/PushMessage;

    .line 80
    .line 81
    iget-object v3, v3, Lcom/p1/mobile/putong/data/PushMessage;->link:Ljava/lang/String;

    .line 82
    .line 83
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 84
    .line 85
    .line 86
    const-string v3, "&liveMode=virtualAvatar"

    .line 87
    .line 88
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 89
    .line 90
    .line 91
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 92
    .line 93
    .line 94
    move-result-object v2

    .line 95
    iput-object v2, v0, Lcom/p1/mobile/putong/data/PushMessage;->link:Ljava/lang/String;

    .line 96
    .line 97
    :cond_1
    iget-object v0, p0, Ll/l4n0;->c:Lcom/p1/mobile/putong/data/PushMessage;

    .line 98
    .line 99
    iget-object v0, v0, Lcom/p1/mobile/putong/data/PushMessage;->link:Ljava/lang/String;

    .line 100
    .line 101
    if-eqz v0, :cond_2

    .line 102
    .line 103
    const-string v2, "from="

    .line 104
    .line 105
    invoke-virtual {v0, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 106
    .line 107
    .line 108
    move-result v0

    .line 109
    if-nez v0, :cond_2

    .line 110
    .line 111
    iget-object v0, p0, Ll/l4n0;->c:Lcom/p1/mobile/putong/data/PushMessage;

    .line 112
    .line 113
    new-instance v2, Ljava/lang/StringBuilder;

    .line 114
    .line 115
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 116
    .line 117
    .line 118
    iget-object v3, p0, Ll/l4n0;->c:Lcom/p1/mobile/putong/data/PushMessage;

    .line 119
    .line 120
    iget-object v3, v3, Lcom/p1/mobile/putong/data/PushMessage;->link:Ljava/lang/String;

    .line 121
    .line 122
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 123
    .line 124
    .line 125
    const-string v3, "&from=from_in_app_push"

    .line 126
    .line 127
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 128
    .line 129
    .line 130
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 131
    .line 132
    .line 133
    move-result-object v2

    .line 134
    iput-object v2, v0, Lcom/p1/mobile/putong/data/PushMessage;->link:Ljava/lang/String;

    .line 135
    .line 136
    :cond_2
    iget-object v0, p0, Ll/r4n0;->p:Ll/k4n0;

    .line 137
    .line 138
    const/4 v2, 0x0

    .line 139
    invoke-virtual {v0, v2}, Ll/k4n0;->b(I)V

    .line 140
    .line 141
    .line 142
    iget-object v0, p0, Ll/l4n0;->n:Landroid/widget/TextView;

    .line 143
    .line 144
    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 145
    .line 146
    .line 147
    move-result-object v0

    .line 148
    iget-object v2, p0, Ll/l4n0;->c:Lcom/p1/mobile/putong/data/PushMessage;

    .line 149
    .line 150
    iget-object v2, v2, Lcom/p1/mobile/putong/data/PushMessage;->link:Ljava/lang/String;

    .line 151
    .line 152
    invoke-static {v0, v2}, Ll/s4n0;->a(Landroid/content/Context;Ljava/lang/String;)V

    .line 153
    .line 154
    .line 155
    iget-object v3, v1, Lcom/p1/mobile/putong/data/PushMessageCustom;->liveId:Ljava/lang/String;

    .line 156
    .line 157
    iget-object v4, v1, Lcom/p1/mobile/putong/data/PushMessageCustom;->userId:Ljava/lang/String;

    .line 158
    .line 159
    iget-object v0, v1, Lcom/p1/mobile/putong/data/PushMessageCustom;->otherID:Ljava/lang/String;

    .line 160
    .line 161
    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 162
    .line 163
    .line 164
    move-result v6

    .line 165
    iget v8, p0, Ll/l4n0;->a:I

    .line 166
    .line 167
    iget-object v9, v1, Lcom/p1/mobile/putong/data/PushMessageCustom;->source:Ljava/lang/String;

    .line 168
    .line 169
    const-string v5, "NA"

    .line 170
    .line 171
    const/4 v7, 0x0

    .line 172
    invoke-static/range {v3 .. v9}, Ll/s4n0;->b(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZZILjava/lang/String;)V

    .line 173
    .line 174
    .line 175
    :cond_3
    return-void
.end method

.method public final synthetic g(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/r4n0;->f()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic h(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/r4n0;->f()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.class public Lcom/p1/mobile/putong/core/ui/messages/ItemVoiceCall;
.super Landroid/widget/LinearLayout;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/putong/core/ui/messages/a;


# instance fields
.field public a:Landroid/widget/TextView;

.field public b:Landroid/widget/ImageView;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 5
    invoke-direct {p0, p1, p2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 6
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/core/ui/messages/ItemVoiceCall;Lcom/p1/mobile/putong/core/data/Message;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/messages/ItemVoiceCall;->b(Lcom/p1/mobile/putong/core/data/Message;Landroid/view/View;)V

    return-void
.end method

.method private synthetic b(Lcom/p1/mobile/putong/core/data/Message;Landroid/view/View;)V
    .locals 2

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    invoke-virtual {p2}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 6
    .line 7
    .line 8
    move-result-object p2

    .line 9
    invoke-interface {p2}, Ll/r97;->v()Z

    .line 10
    .line 11
    .line 12
    move-result p2

    .line 13
    if-eqz p2, :cond_0

    .line 14
    .line 15
    invoke-static {p0}, Ll/bnl0;->E(Landroid/view/View;)Landroid/app/Activity;

    .line 16
    .line 17
    .line 18
    move-result-object p2

    .line 19
    instance-of v0, p2, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 20
    .line 21
    if-eqz v0, :cond_0

    .line 22
    .line 23
    check-cast p2, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 24
    .line 25
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->l()Ll/clz;

    .line 26
    .line 27
    .line 28
    move-result-object p2

    .line 29
    invoke-virtual {p2}, Ll/clz;->r3()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object p2

    .line 33
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    invoke-virtual {v0}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    invoke-interface {v0, p2}, Ll/r97;->T5(Ljava/lang/String;)Z

    .line 42
    .line 43
    .line 44
    move-result p2

    .line 45
    if-eqz p2, :cond_0

    .line 46
    .line 47
    return-void

    .line 48
    :cond_0
    const/4 p2, 0x0

    .line 49
    new-array p2, p2, [Ll/sfj0$a;

    .line 50
    .line 51
    const-string v0, "e_voice_call_pop"

    .line 52
    .line 53
    const-string v1, "p_chat_view"

    .line 54
    .line 55
    invoke-static {v0, v1, p2}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 56
    .line 57
    .line 58
    invoke-static {}, Ll/qzm0;->h()Ll/qzm0;

    .line 59
    .line 60
    .line 61
    move-result-object p2

    .line 62
    const-string v0, "voice_entry_message_item"

    .line 63
    .line 64
    invoke-virtual {p2, v0}, Ll/qzm0;->o(Ljava/lang/String;)V

    .line 65
    .line 66
    .line 67
    invoke-static {}, Ll/xzm0;->p()Ll/xzm0;

    .line 68
    .line 69
    .line 70
    move-result-object p2

    .line 71
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 72
    .line 73
    .line 74
    move-result-object p0

    .line 75
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/Message;->cid:Ljava/lang/String;

    .line 76
    .line 77
    const-string v0, ""

    .line 78
    .line 79
    invoke-virtual {p2, p0, p1, v0}, Ll/xzm0;->h(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    .line 80
    .line 81
    .line 82
    return-void
.end method


# virtual methods
.method public A(Lcom/p1/mobile/putong/core/data/Message;)V
    .locals 4

    .line 1
    new-instance v0, Ll/tjq;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Ll/tjq;-><init>(Lcom/p1/mobile/putong/core/ui/messages/ItemVoiceCall;Lcom/p1/mobile/putong/core/data/Message;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 7
    .line 8
    .line 9
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Message;->additionalData:Lcom/p1/mobile/putong/core/data/MessageAdditionalData;

    .line 10
    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    goto :goto_1

    .line 14
    :cond_0
    const-string v1, "unknown_"

    .line 15
    .line 16
    invoke-static {v1}, Lcom/p1/mobile/putong/core/data/VoiceCallStatus;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/VoiceCallStatus;

    .line 17
    .line 18
    .line 19
    iget-object v1, v0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->status:Ljava/lang/String;

    .line 20
    .line 21
    invoke-static {v1}, Lcom/p1/mobile/putong/core/data/VoiceCallStatus;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/VoiceCallStatus;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 30
    .line 31
    .line 32
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 33
    .line 34
    .line 35
    move-result v2

    .line 36
    const/4 v3, -0x1

    .line 37
    sparse-switch v2, :sswitch_data_0

    .line 38
    .line 39
    .line 40
    goto :goto_0

    .line 41
    :sswitch_0
    const-string v2, "busy"

    .line 42
    .line 43
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 44
    .line 45
    .line 46
    move-result v1

    .line 47
    if-nez v1, :cond_1

    .line 48
    .line 49
    goto :goto_0

    .line 50
    :cond_1
    const/4 v3, 0x4

    .line 51
    goto :goto_0

    .line 52
    :sswitch_1
    const-string v2, "notAnswered"

    .line 53
    .line 54
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 55
    .line 56
    .line 57
    move-result v1

    .line 58
    if-nez v1, :cond_2

    .line 59
    .line 60
    goto :goto_0

    .line 61
    :cond_2
    const/4 v3, 0x3

    .line 62
    goto :goto_0

    .line 63
    :sswitch_2
    const-string v2, "canceled"

    .line 64
    .line 65
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 66
    .line 67
    .line 68
    move-result v1

    .line 69
    if-nez v1, :cond_3

    .line 70
    .line 71
    goto :goto_0

    .line 72
    :cond_3
    const/4 v3, 0x2

    .line 73
    goto :goto_0

    .line 74
    :sswitch_3
    const-string v2, "rejected"

    .line 75
    .line 76
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 77
    .line 78
    .line 79
    move-result v1

    .line 80
    if-nez v1, :cond_4

    .line 81
    .line 82
    goto :goto_0

    .line 83
    :cond_4
    const/4 v3, 0x1

    .line 84
    goto :goto_0

    .line 85
    :sswitch_4
    const-string v2, "finished"

    .line 86
    .line 87
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 88
    .line 89
    .line 90
    move-result v1

    .line 91
    if-nez v1, :cond_5

    .line 92
    .line 93
    goto :goto_0

    .line 94
    :cond_5
    const/4 v3, 0x0

    .line 95
    :goto_0
    packed-switch v3, :pswitch_data_0

    .line 96
    .line 97
    .line 98
    :goto_1
    return-void

    .line 99
    :pswitch_0
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/data/Message;->isCaller()Z

    .line 100
    .line 101
    .line 102
    move-result p1

    .line 103
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemVoiceCall;->a:Landroid/widget/TextView;

    .line 104
    .line 105
    if-eqz p1, :cond_6

    .line 106
    .line 107
    sget p1, Lcom/p1/mobile/putong/core/message/R$string;->Q6:I

    .line 108
    .line 109
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(I)V

    .line 110
    .line 111
    .line 112
    return-void

    .line 113
    :cond_6
    sget p1, Lcom/p1/mobile/putong/core/message/R$string;->P6:I

    .line 114
    .line 115
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(I)V

    .line 116
    .line 117
    .line 118
    return-void

    .line 119
    :pswitch_1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/data/Message;->isCaller()Z

    .line 120
    .line 121
    .line 122
    move-result p1

    .line 123
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemVoiceCall;->a:Landroid/widget/TextView;

    .line 124
    .line 125
    if-eqz p1, :cond_7

    .line 126
    .line 127
    sget p1, Lcom/p1/mobile/putong/core/message/R$string;->N6:I

    .line 128
    .line 129
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(I)V

    .line 130
    .line 131
    .line 132
    return-void

    .line 133
    :cond_7
    sget p1, Lcom/p1/mobile/putong/core/message/R$string;->P6:I

    .line 134
    .line 135
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(I)V

    .line 136
    .line 137
    .line 138
    return-void

    .line 139
    :pswitch_2
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/data/Message;->isCaller()Z

    .line 140
    .line 141
    .line 142
    move-result p1

    .line 143
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemVoiceCall;->a:Landroid/widget/TextView;

    .line 144
    .line 145
    if-eqz p1, :cond_8

    .line 146
    .line 147
    sget p1, Lcom/p1/mobile/putong/core/message/R$string;->R6:I

    .line 148
    .line 149
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(I)V

    .line 150
    .line 151
    .line 152
    return-void

    .line 153
    :cond_8
    sget p1, Lcom/p1/mobile/putong/core/message/R$string;->S6:I

    .line 154
    .line 155
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(I)V

    .line 156
    .line 157
    .line 158
    return-void

    .line 159
    :pswitch_3
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemVoiceCall;->a:Landroid/widget/TextView;

    .line 160
    .line 161
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 162
    .line 163
    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 164
    .line 165
    .line 166
    move-result-object v1

    .line 167
    sget v2, Lcom/p1/mobile/putong/core/message/R$string;->O6:I

    .line 168
    .line 169
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 170
    .line 171
    .line 172
    move-result-object v1

    .line 173
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->duration:Ljava/lang/String;

    .line 174
    .line 175
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/messages/ItemVoiceCall;->c(Ljava/lang/String;)J

    .line 176
    .line 177
    .line 178
    move-result-wide v2

    .line 179
    invoke-static {v2, v3}, Ll/w1n0;->b(J)Ljava/lang/String;

    .line 180
    .line 181
    .line 182
    move-result-object p0

    .line 183
    filled-new-array {p0}, [Ljava/lang/Object;

    .line 184
    .line 185
    .line 186
    move-result-object p0

    .line 187
    invoke-static {v1, p0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 188
    .line 189
    .line 190
    move-result-object p0

    .line 191
    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 192
    .line 193
    .line 194
    return-void

    .line 195
    :sswitch_data_0
    .sparse-switch
        -0x28273f8e -> :sswitch_4
        -0x2444eb82 -> :sswitch_3
        -0x7577b67 -> :sswitch_2
        -0x4cd1f30 -> :sswitch_1
        0x2e51f9 -> :sswitch_0
    .end sparse-switch

    .line 196
    .line 197
    .line 198
    .line 199
    .line 200
    .line 201
    .line 202
    .line 203
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
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public J()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ll/ovb0<",
            "Ljava/lang/String;",
            "Ljava/lang/Runnable;",
            "Ljava/lang/Integer;",
            "Ljava/lang/Void;",
            ">;>;"
        }
    .end annotation

    .line 1
    const/4 p0, 0x0

    return-object p0
.end method

.method public final c(Ljava/lang/String;)J
    .locals 2

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    const-wide/16 v0, 0x0

    .line 6
    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    return-wide v0

    .line 10
    :cond_0
    :try_start_0
    invoke-static {p1}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    .line 11
    .line 12
    .line 13
    move-result-wide p0
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    .line 14
    return-wide p0

    .line 15
    :catch_0
    return-wide v0
.end method

.method public m(IZLcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;)V
    .locals 0

    .line 1
    return-void
.end method

.method public onFinishInflate()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    sget v0, Ll/edc0;->O4:I

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
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemVoiceCall;->a:Landroid/widget/TextView;

    .line 13
    .line 14
    sget v0, Ll/edc0;->o1:I

    .line 15
    .line 16
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    check-cast v0, Landroid/widget/ImageView;

    .line 21
    .line 22
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemVoiceCall;->b:Landroid/widget/ImageView;

    .line 23
    .line 24
    return-void
.end method

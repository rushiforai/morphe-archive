.class public Lcom/p1/mobile/putong/core/ui/messages/ItemFeedbackReason;
.super Landroid/widget/LinearLayout;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/putong/core/ui/messages/a;
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public a:Lcom/p1/mobile/putong/core/ui/messages/ItemFeedbackReason;

.field public b:Lcom/p1/mobile/putong/core/ui/messages/ItemText;

.field public c:Lcom/p1/mobile/putong/core/ui/messages/ItemText;

.field public d:Lv/VLinear;

.field public e:Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;

.field public f:Lcom/p1/mobile/putong/core/data/Message;

.field public g:Lcom/p1/mobile/putong/core/data/MessageFeedbackStatus;

.field public h:Z


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

.method public static synthetic a(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    const-string p0, "\u7f51\u7edc\u9519\u8bef"

    .line 2
    .line 3
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/core/ui/messages/ItemFeedbackReason;Lcom/p1/mobile/putong/core/data/MessageFeedbackAnswers;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/messages/ItemFeedbackReason;->g(Lcom/p1/mobile/putong/core/data/MessageFeedbackAnswers;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/core/ui/messages/ItemFeedbackReason;Landroid/view/View;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/messages/ItemFeedbackReason;->f(Landroid/view/View;Ljava/lang/Boolean;)V

    return-void
.end method


# virtual methods
.method public A(Lcom/p1/mobile/putong/core/data/Message;)V
    .locals 6

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemFeedbackReason;->f:Lcom/p1/mobile/putong/core/data/Message;

    .line 2
    .line 3
    :try_start_0
    sget-object v0, Lcom/p1/mobile/putong/core/data/MessageFeedbackStatus;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 4
    .line 5
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Message;->msgData:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Ljava/lang/String;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Lcom/p1/mobile/putong/core/data/MessageFeedbackStatus;

    .line 12
    .line 13
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemFeedbackReason;->g:Lcom/p1/mobile/putong/core/data/MessageFeedbackStatus;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 14
    .line 15
    :catch_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemFeedbackReason;->g:Lcom/p1/mobile/putong/core/data/MessageFeedbackStatus;

    .line 16
    .line 17
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-nez v0, :cond_0

    .line 22
    .line 23
    return-void

    .line 24
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemFeedbackReason;->g:Lcom/p1/mobile/putong/core/data/MessageFeedbackStatus;

    .line 25
    .line 26
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/MessageFeedbackStatus;->question:Lcom/p1/mobile/putong/core/data/MessageFeedbackQuestion;

    .line 27
    .line 28
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/MessageFeedbackQuestion;->answer:Ljava/lang/String;

    .line 29
    .line 30
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    const/4 v1, 0x1

    .line 35
    xor-int/2addr v0, v1

    .line 36
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemFeedbackReason;->h:Z

    .line 37
    .line 38
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemFeedbackReason;->b:Lcom/p1/mobile/putong/core/ui/messages/ItemText;

    .line 39
    .line 40
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemFeedbackReason;->g:Lcom/p1/mobile/putong/core/data/MessageFeedbackStatus;

    .line 41
    .line 42
    iget-object v2, v2, Lcom/p1/mobile/putong/core/data/MessageFeedbackStatus;->question:Lcom/p1/mobile/putong/core/data/MessageFeedbackQuestion;

    .line 43
    .line 44
    iget-object v2, v2, Lcom/p1/mobile/putong/core/data/MessageFeedbackQuestion;->text:Ljava/lang/String;

    .line 45
    .line 46
    invoke-virtual {v0, v2, p1}, Lcom/p1/mobile/putong/core/ui/messages/ItemText;->D(Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Message;)V

    .line 47
    .line 48
    .line 49
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemFeedbackReason;->g:Lcom/p1/mobile/putong/core/data/MessageFeedbackStatus;

    .line 50
    .line 51
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/MessageFeedbackStatus;->question:Lcom/p1/mobile/putong/core/data/MessageFeedbackQuestion;

    .line 52
    .line 53
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/MessageFeedbackQuestion;->answers:Ljava/util/List;

    .line 54
    .line 55
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 56
    .line 57
    .line 58
    move-result v0

    .line 59
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemFeedbackReason;->d:Lv/VLinear;

    .line 60
    .line 61
    if-lez v0, :cond_5

    .line 62
    .line 63
    const/4 v0, 0x0

    .line 64
    invoke-virtual {v2, v0}, Landroid/view/View;->setVisibility(I)V

    .line 65
    .line 66
    .line 67
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 68
    .line 69
    .line 70
    move-result-object v2

    .line 71
    invoke-virtual {v2}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 72
    .line 73
    .line 74
    move-result-object v2

    .line 75
    invoke-interface {v2}, Ll/r97;->G1()Z

    .line 76
    .line 77
    .line 78
    move-result v2

    .line 79
    if-eqz v2, :cond_1

    .line 80
    .line 81
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/Message;->owner:Ljava/lang/String;

    .line 82
    .line 83
    invoke-static {p1}, Lcom/p1/mobile/putong/data/User;->isTeamAccount(Ljava/lang/String;)Z

    .line 84
    .line 85
    .line 86
    move-result p1

    .line 87
    if-nez p1, :cond_1

    .line 88
    .line 89
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemFeedbackReason;->d:Lv/VLinear;

    .line 90
    .line 91
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 92
    .line 93
    .line 94
    move-result-object p1

    .line 95
    check-cast p1, Landroid/widget/LinearLayout$LayoutParams;

    .line 96
    .line 97
    const/4 v2, -0x1

    .line 98
    iput v2, p1, Landroid/widget/LinearLayout$LayoutParams;->width:I

    .line 99
    .line 100
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemFeedbackReason;->d:Lv/VLinear;

    .line 101
    .line 102
    invoke-virtual {v2, p1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 103
    .line 104
    .line 105
    :cond_1
    :goto_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemFeedbackReason;->g:Lcom/p1/mobile/putong/core/data/MessageFeedbackStatus;

    .line 106
    .line 107
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/MessageFeedbackStatus;->question:Lcom/p1/mobile/putong/core/data/MessageFeedbackQuestion;

    .line 108
    .line 109
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/MessageFeedbackQuestion;->answers:Ljava/util/List;

    .line 110
    .line 111
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 112
    .line 113
    .line 114
    move-result p1

    .line 115
    if-ge v0, p1, :cond_6

    .line 116
    .line 117
    add-int/lit8 p1, v0, 0x1

    .line 118
    .line 119
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemFeedbackReason;->d:Lv/VLinear;

    .line 120
    .line 121
    invoke-virtual {v2}, Landroid/view/ViewGroup;->getChildCount()I

    .line 122
    .line 123
    .line 124
    move-result v2

    .line 125
    if-le p1, v2, :cond_2

    .line 126
    .line 127
    goto :goto_2

    .line 128
    :cond_2
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemFeedbackReason;->d:Lv/VLinear;

    .line 129
    .line 130
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 131
    .line 132
    .line 133
    move-result-object v2

    .line 134
    check-cast v2, Lcom/p1/mobile/putong/core/ui/messages/FeedbackAnswerView;

    .line 135
    .line 136
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/ui/messages/FeedbackAnswerView;->getPaint()Landroid/text/TextPaint;

    .line 137
    .line 138
    .line 139
    move-result-object v3

    .line 140
    invoke-virtual {v3, v1}, Landroid/graphics/Paint;->setFakeBoldText(Z)V

    .line 141
    .line 142
    .line 143
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemFeedbackReason;->g:Lcom/p1/mobile/putong/core/data/MessageFeedbackStatus;

    .line 144
    .line 145
    iget-object v3, v3, Lcom/p1/mobile/putong/core/data/MessageFeedbackStatus;->question:Lcom/p1/mobile/putong/core/data/MessageFeedbackQuestion;

    .line 146
    .line 147
    iget-object v3, v3, Lcom/p1/mobile/putong/core/data/MessageFeedbackQuestion;->answers:Ljava/util/List;

    .line 148
    .line 149
    invoke-interface {v3, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 150
    .line 151
    .line 152
    move-result-object v0

    .line 153
    check-cast v0, Lcom/p1/mobile/putong/core/data/MessageFeedbackAnswers;

    .line 154
    .line 155
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/ui/messages/FeedbackAnswerView;->getText()Ljava/lang/String;

    .line 156
    .line 157
    .line 158
    move-result-object v3

    .line 159
    invoke-static {v3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 160
    .line 161
    .line 162
    move-result-object v3

    .line 163
    iget-object v4, v0, Lcom/p1/mobile/putong/core/data/MessageFeedbackAnswers;->value:Ljava/lang/String;

    .line 164
    .line 165
    invoke-virtual {v2, v4}, Lcom/p1/mobile/putong/core/ui/messages/FeedbackAnswerView;->setText(Ljava/lang/String;)V

    .line 166
    .line 167
    .line 168
    iget-object v4, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemFeedbackReason;->g:Lcom/p1/mobile/putong/core/data/MessageFeedbackStatus;

    .line 169
    .line 170
    iget-object v4, v4, Lcom/p1/mobile/putong/core/data/MessageFeedbackStatus;->question:Lcom/p1/mobile/putong/core/data/MessageFeedbackQuestion;

    .line 171
    .line 172
    iget-object v4, v4, Lcom/p1/mobile/putong/core/data/MessageFeedbackQuestion;->answer:Ljava/lang/String;

    .line 173
    .line 174
    iget-object v5, v0, Lcom/p1/mobile/putong/core/data/MessageFeedbackAnswers;->id:Ljava/lang/String;

    .line 175
    .line 176
    invoke-static {v4, v5}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 177
    .line 178
    .line 179
    move-result v4

    .line 180
    if-eqz v4, :cond_3

    .line 181
    .line 182
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 183
    .line 184
    .line 185
    move-result-object v4

    .line 186
    sget v5, Ll/g9c0;->y:I

    .line 187
    .line 188
    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getColor(I)I

    .line 189
    .line 190
    .line 191
    move-result v4

    .line 192
    goto :goto_1

    .line 193
    :cond_3
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 194
    .line 195
    .line 196
    move-result-object v4

    .line 197
    sget v5, Ll/g9c0;->M:I

    .line 198
    .line 199
    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getColor(I)I

    .line 200
    .line 201
    .line 202
    move-result v4

    .line 203
    :goto_1
    invoke-virtual {v2, v4}, Lcom/p1/mobile/putong/core/ui/messages/FeedbackAnswerView;->setTextColor(I)V

    .line 204
    .line 205
    .line 206
    invoke-virtual {v2, v0}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 207
    .line 208
    .line 209
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/MessageFeedbackAnswers;->value:Ljava/lang/String;

    .line 210
    .line 211
    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 212
    .line 213
    .line 214
    move-result v0

    .line 215
    if-nez v0, :cond_4

    .line 216
    .line 217
    invoke-virtual {v2}, Landroid/view/View;->requestLayout()V

    .line 218
    .line 219
    .line 220
    :cond_4
    move v0, p1

    .line 221
    goto :goto_0

    .line 222
    :cond_5
    const/16 v0, 0x8

    .line 223
    .line 224
    invoke-virtual {v2, v0}, Landroid/view/View;->setVisibility(I)V

    .line 225
    .line 226
    .line 227
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/data/Message;->isOtherUser()Z

    .line 228
    .line 229
    .line 230
    move-result p1

    .line 231
    if-eqz p1, :cond_6

    .line 232
    .line 233
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemFeedbackReason;->e:Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;

    .line 234
    .line 235
    check-cast p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageLeft;

    .line 236
    .line 237
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageLeft;->M:Lv/VDraweeView;

    .line 238
    .line 239
    const/4 p1, 0x0

    .line 240
    invoke-virtual {p0, p1}, Landroid/view/View;->setTranslationY(F)V

    .line 241
    .line 242
    .line 243
    :cond_6
    :goto_2
    const-string p0, "donot_content_reason"

    .line 244
    .line 245
    const-string p1, ""

    .line 246
    .line 247
    invoke-static {p0, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 248
    .line 249
    .line 250
    move-result-object p0

    .line 251
    filled-new-array {p0}, [Ll/pf60;

    .line 252
    .line 253
    .line 254
    move-result-object p0

    .line 255
    const-string p1, "e_assistant_service_feedback_reason"

    .line 256
    .line 257
    const-string v0, "p_chat_view"

    .line 258
    .line 259
    invoke-static {p1, v0, p0}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 260
    .line 261
    .line 262
    return-void
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

.method public final d(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/m5q;->a(Lcom/p1/mobile/putong/core/ui/messages/ItemFeedbackReason;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public e()Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 6
    .line 7
    return-object p0
.end method

.method public final synthetic f(Landroid/view/View;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    .line 2
    .line 3
    .line 4
    move-result p2

    .line 5
    if-eqz p2, :cond_0

    .line 6
    .line 7
    const/4 p2, 0x1

    .line 8
    iput-boolean p2, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemFeedbackReason;->h:Z

    .line 9
    .line 10
    check-cast p1, Lcom/p1/mobile/putong/core/ui/messages/FeedbackAnswerView;

    .line 11
    .line 12
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    sget p2, Ll/g9c0;->y:I

    .line 17
    .line 18
    invoke-virtual {p0, p2}, Landroid/content/res/Resources;->getColor(I)I

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/core/ui/messages/FeedbackAnswerView;->setTextColor(I)V

    .line 23
    .line 24
    .line 25
    :cond_0
    return-void
.end method

.method public final synthetic g(Lcom/p1/mobile/putong/core/data/MessageFeedbackAnswers;Landroid/view/View;)V
    .locals 7

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemFeedbackReason;->e()Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->l()Ll/clz;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    iget-object v6, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemFeedbackReason;->f:Lcom/p1/mobile/putong/core/data/Message;

    .line 10
    .line 11
    iget-object v2, v6, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 12
    .line 13
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemFeedbackReason;->g:Lcom/p1/mobile/putong/core/data/MessageFeedbackStatus;

    .line 14
    .line 15
    iget-object v3, v0, Lcom/p1/mobile/putong/core/data/MessageFeedbackStatus;->feedback_id:Ljava/lang/String;

    .line 16
    .line 17
    iget-object v4, v0, Lcom/p1/mobile/putong/core/data/MessageFeedbackStatus;->feedback_category:Ljava/lang/String;

    .line 18
    .line 19
    iget-object v5, p1, Lcom/p1/mobile/putong/core/data/MessageFeedbackAnswers;->id:Ljava/lang/String;

    .line 20
    .line 21
    invoke-virtual/range {v1 .. v6}, Ll/clz;->f3(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Message;)Lrx/c;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    new-instance v0, Ll/k5q;

    .line 26
    .line 27
    invoke-direct {v0, p0, p2}, Ll/k5q;-><init>(Lcom/p1/mobile/putong/core/ui/messages/ItemFeedbackReason;Landroid/view/View;)V

    .line 28
    .line 29
    .line 30
    new-instance p0, Ll/l5q;

    .line 31
    .line 32
    invoke-direct {p0}, Ll/l5q;-><init>()V

    .line 33
    .line 34
    .line 35
    invoke-static {v0, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 40
    .line 41
    .line 42
    return-void
.end method

.method public m(IZLcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;)V
    .locals 4

    .line 1
    iput-object p3, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemFeedbackReason;->e:Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;

    .line 2
    .line 3
    const/4 p2, 0x0

    .line 4
    move p3, p2

    .line 5
    :goto_0
    if-ge p3, p1, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemFeedbackReason;->d:Lv/VLinear;

    .line 8
    .line 9
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-static {v1}, Ll/p9r;->a(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    sget v2, Ll/qec0;->Z2:I

    .line 18
    .line 19
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemFeedbackReason;->d:Lv/VLinear;

    .line 20
    .line 21
    invoke-virtual {v1, v2, v3, p2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 26
    .line 27
    .line 28
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemFeedbackReason;->d:Lv/VLinear;

    .line 29
    .line 30
    invoke-virtual {v0, p3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 35
    .line 36
    .line 37
    add-int/lit8 p3, p3, 0x1

    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_0
    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemFeedbackReason;->h:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    check-cast v0, Lcom/p1/mobile/putong/core/data/MessageFeedbackAnswers;

    .line 11
    .line 12
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    if-nez v1, :cond_1

    .line 17
    .line 18
    :goto_0
    return-void

    .line 19
    :cond_1
    new-instance v1, Ll/j5q;

    .line 20
    .line 21
    invoke-direct {v1, p0, v0, p1}, Ll/j5q;-><init>(Lcom/p1/mobile/putong/core/ui/messages/ItemFeedbackReason;Lcom/p1/mobile/putong/core/data/MessageFeedbackAnswers;Landroid/view/View;)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemFeedbackReason;->e()Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->l()Ll/clz;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    invoke-virtual {p0}, Ll/clz;->t7()Ll/qzz;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    invoke-virtual {p0, v1}, Ll/qzz;->y1(Ljava/lang/Runnable;)V

    .line 37
    .line 38
    .line 39
    const-string p0, "donot_content_reason"

    .line 40
    .line 41
    iget-object p1, v0, Lcom/p1/mobile/putong/core/data/MessageFeedbackAnswers;->value:Ljava/lang/String;

    .line 42
    .line 43
    invoke-static {p0, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    filled-new-array {p0}, [Ll/pf60;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    const-string p1, "e_assistant_service_feedback_reason"

    .line 52
    .line 53
    const-string v0, "p_chat_view"

    .line 54
    .line 55
    invoke-static {p1, v0, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 56
    .line 57
    .line 58
    return-void
.end method

.method public onFinishInflate()V
    .locals 2

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemFeedbackReason;->d(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemFeedbackReason;->b:Lcom/p1/mobile/putong/core/ui/messages/ItemText;

    .line 8
    .line 9
    const/4 v1, 0x0

    .line 10
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemFeedbackReason;->d:Lv/VLinear;

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 16
    .line 17
    .line 18
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemFeedbackReason;->b:Lcom/p1/mobile/putong/core/ui/messages/ItemText;

    .line 19
    .line 20
    invoke-virtual {p0}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    const/4 v0, 0x1

    .line 25
    invoke-virtual {p0, v0}, Landroid/graphics/Paint;->setFakeBoldText(Z)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

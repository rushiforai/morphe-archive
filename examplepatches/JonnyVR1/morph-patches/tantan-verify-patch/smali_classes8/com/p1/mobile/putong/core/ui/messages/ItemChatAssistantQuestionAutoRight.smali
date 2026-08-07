.class public Lcom/p1/mobile/putong/core/ui/messages/ItemChatAssistantQuestionAutoRight;
.super Lv/VRelative;
.source "SourceFile"


# instance fields
.field public d:Landroid/view/View;

.field public e:Landroid/widget/TextView;

.field public f:Landroid/widget/TextView;

.field public g:Landroid/widget/ImageView;

.field public h:Landroid/widget/ImageView;

.field public i:Lcom/p1/mobile/putong/core/data/ChatAssistantQuestion;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lv/VRelative;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 5
    invoke-direct {p0, p1, p2}, Lv/VRelative;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 6
    invoke-direct {p0, p1, p2, p3}, Lv/VRelative;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static synthetic p(Lcom/p1/mobile/putong/core/ui/messages/ItemChatAssistantQuestionAutoRight;Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/ui/messages/ItemChatAssistantQuestionAutoRight;->q(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public B()V
    .locals 2

    .line 1
    const/4 p0, 0x0

    .line 2
    new-array p0, p0, [Ll/sfj0$a;

    .line 3
    .line 4
    const-string v0, "e_chat_question_auto_send"

    .line 5
    .line 6
    const-string v1, "p_chat_view"

    .line 7
    .line 8
    invoke-static {v0, v1, p0}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public H(Lcom/p1/mobile/putong/core/data/Message;)V
    .locals 3

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Message;->msgData:Ljava/lang/String;

    .line 2
    .line 3
    :try_start_0
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    if-nez v1, :cond_0

    .line 8
    .line 9
    sget-object v1, Lcom/p1/mobile/putong/core/data/ChatAssistantQuestion;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 10
    .line 11
    iget-object v2, p1, Lcom/p1/mobile/putong/core/data/Message;->msgData:Ljava/lang/String;

    .line 12
    .line 13
    invoke-virtual {v1, v2}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Ljava/lang/String;)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    check-cast v1, Lcom/p1/mobile/putong/core/data/ChatAssistantQuestion;

    .line 18
    .line 19
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemChatAssistantQuestionAutoRight;->i:Lcom/p1/mobile/putong/core/data/ChatAssistantQuestion;

    .line 20
    .line 21
    :cond_0
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemChatAssistantQuestionAutoRight;->i:Lcom/p1/mobile/putong/core/data/ChatAssistantQuestion;

    .line 22
    .line 23
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    if-eqz v1, :cond_1

    .line 28
    .line 29
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemChatAssistantQuestionAutoRight;->i:Lcom/p1/mobile/putong/core/data/ChatAssistantQuestion;

    .line 30
    .line 31
    iget-object v0, v1, Lcom/p1/mobile/putong/core/data/ChatAssistantQuestion;->type:Ljava/lang/String;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 32
    .line 33
    :catch_0
    :cond_1
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 34
    .line 35
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 36
    .line 37
    iget-object v2, p1, Lcom/p1/mobile/putong/core/data/Message;->cid:Ljava/lang/String;

    .line 38
    .line 39
    invoke-virtual {v1, v2}, Ll/dkb;->Pa(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 44
    .line 45
    .line 46
    move-result v2

    .line 47
    if-eqz v2, :cond_3

    .line 48
    .line 49
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemChatAssistantQuestionAutoRight;->e:Landroid/widget/TextView;

    .line 50
    .line 51
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 52
    .line 53
    .line 54
    move-result v1

    .line 55
    if-eqz v1, :cond_2

    .line 56
    .line 57
    const-string v1, "\u5979"

    .line 58
    .line 59
    goto :goto_0

    .line 60
    :cond_2
    const-string v1, "\u4ed6"

    .line 61
    .line 62
    :goto_0
    filled-new-array {v1}, [Ljava/lang/Object;

    .line 63
    .line 64
    .line 65
    move-result-object v1

    .line 66
    const-string v2, "\u5411%s\u63d0\u4e86\u4e00\u4e2a\u4f60\u611f\u5174\u8da3\u7684\u95ee\u9898"

    .line 67
    .line 68
    invoke-static {v2, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    move-result-object v1

    .line 72
    invoke-virtual {p0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 73
    .line 74
    .line 75
    :cond_3
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Message;->value:Ljava/lang/String;

    .line 76
    .line 77
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 78
    .line 79
    .line 80
    move-result p0

    .line 81
    const-string v1, ""

    .line 82
    .line 83
    if-eqz p0, :cond_4

    .line 84
    .line 85
    goto :goto_1

    .line 86
    :cond_4
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Message;->value:Ljava/lang/String;

    .line 87
    .line 88
    const-string p1, "\u4f60\u597d\u5440\uff0c\u95ee\u4e2a\u95ee\u9898\uff5e\n"

    .line 89
    .line 90
    invoke-virtual {p0, p1, v1}, Ljava/lang/String;->replaceFirst(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 91
    .line 92
    .line 93
    move-result-object v1

    .line 94
    :goto_1
    const-string p0, "chat_question_content"

    .line 95
    .line 96
    invoke-static {p0, v1}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 97
    .line 98
    .line 99
    move-result-object p0

    .line 100
    const-string p1, "chat_question_send_side"

    .line 101
    .line 102
    const-string v1, "from"

    .line 103
    .line 104
    invoke-static {p1, v1}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 105
    .line 106
    .line 107
    move-result-object p1

    .line 108
    const-string v1, "chat_question_type"

    .line 109
    .line 110
    invoke-static {v1, v0}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 111
    .line 112
    .line 113
    move-result-object v0

    .line 114
    filled-new-array {p0, p1, v0}, [Ll/sfj0$a;

    .line 115
    .line 116
    .line 117
    move-result-object p0

    .line 118
    const-string p1, "e_chat_question_auto_send"

    .line 119
    .line 120
    const-string v0, "p_chat_view"

    .line 121
    .line 122
    invoke-static {p1, v0, p0}, Ll/sfj0;->h(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 123
    .line 124
    .line 125
    return-void
.end method

.method public onFinishInflate()V
    .locals 4

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    sget v0, Ll/edc0;->k1:I

    .line 5
    .line 6
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    check-cast v0, Landroid/widget/ImageView;

    .line 11
    .line 12
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemChatAssistantQuestionAutoRight;->h:Landroid/widget/ImageView;

    .line 13
    .line 14
    sget v0, Ll/edc0;->A3:I

    .line 15
    .line 16
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    check-cast v0, Landroid/widget/TextView;

    .line 21
    .line 22
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemChatAssistantQuestionAutoRight;->e:Landroid/widget/TextView;

    .line 23
    .line 24
    sget v0, Ll/edc0;->z3:I

    .line 25
    .line 26
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemChatAssistantQuestionAutoRight;->d:Landroid/view/View;

    .line 31
    .line 32
    sget v0, Ll/edc0;->y3:I

    .line 33
    .line 34
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    check-cast v0, Landroid/widget/TextView;

    .line 39
    .line 40
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemChatAssistantQuestionAutoRight;->f:Landroid/widget/TextView;

    .line 41
    .line 42
    sget v0, Ll/edc0;->E0:I

    .line 43
    .line 44
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    check-cast v0, Landroid/widget/ImageView;

    .line 49
    .line 50
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemChatAssistantQuestionAutoRight;->g:Landroid/widget/ImageView;

    .line 51
    .line 52
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemChatAssistantQuestionAutoRight;->e:Landroid/widget/TextView;

    .line 53
    .line 54
    const/4 v1, 0x3

    .line 55
    invoke-static {v1}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 56
    .line 57
    .line 58
    move-result-object v2

    .line 59
    const/4 v3, 0x1

    .line 60
    invoke-virtual {v0, v2, v3}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 61
    .line 62
    .line 63
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemChatAssistantQuestionAutoRight;->f:Landroid/widget/TextView;

    .line 64
    .line 65
    invoke-static {v1}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 66
    .line 67
    .line 68
    move-result-object v1

    .line 69
    invoke-virtual {v0, v1, v3}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 70
    .line 71
    .line 72
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 73
    .line 74
    .line 75
    move-result-object v0

    .line 76
    invoke-virtual {v0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->I4()Z

    .line 81
    .line 82
    .line 83
    move-result v0

    .line 84
    if-eqz v0, :cond_0

    .line 85
    .line 86
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemChatAssistantQuestionAutoRight;->h:Landroid/widget/ImageView;

    .line 87
    .line 88
    sget v1, Ll/ibc0;->X1:I

    .line 89
    .line 90
    invoke-static {v0, v1}, Ll/bnl0;->N(Landroid/widget/ImageView;I)V

    .line 91
    .line 92
    .line 93
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemChatAssistantQuestionAutoRight;->g:Landroid/widget/ImageView;

    .line 94
    .line 95
    sget v1, Ll/ibc0;->W1:I

    .line 96
    .line 97
    invoke-static {v0, v1}, Ll/bnl0;->N(Landroid/widget/ImageView;I)V

    .line 98
    .line 99
    .line 100
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemChatAssistantQuestionAutoRight;->e:Landroid/widget/TextView;

    .line 101
    .line 102
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 103
    .line 104
    .line 105
    move-result-object v1

    .line 106
    sget v2, Ll/g9c0;->i:I

    .line 107
    .line 108
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    .line 109
    .line 110
    .line 111
    move-result v1

    .line 112
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 113
    .line 114
    .line 115
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemChatAssistantQuestionAutoRight;->f:Landroid/widget/TextView;

    .line 116
    .line 117
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 118
    .line 119
    .line 120
    move-result-object p0

    .line 121
    sget v1, Ll/g9c0;->g:I

    .line 122
    .line 123
    invoke-virtual {p0, v1}, Landroid/content/res/Resources;->getColor(I)I

    .line 124
    .line 125
    .line 126
    move-result p0

    .line 127
    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 128
    .line 129
    .line 130
    :cond_0
    return-void
.end method

.method public final synthetic q(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemChatAssistantQuestionAutoRight;->B()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    invoke-virtual {p0}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-interface {p0, p1, p2}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->A9(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public z(Lcom/p1/mobile/android/app/Act;Ll/pol;Lcom/p1/mobile/putong/core/data/Message;Ll/n100;)V
    .locals 0

    .line 1
    iget-object p2, p3, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {p4, p2}, Ll/n100;->a(Ljava/lang/String;)Z

    .line 4
    .line 5
    .line 6
    move-result p2

    .line 7
    if-nez p2, :cond_0

    .line 8
    .line 9
    iget-object p2, p3, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 10
    .line 11
    invoke-virtual {p4, p2}, Ll/n100;->b(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0, p3}, Lcom/p1/mobile/putong/core/ui/messages/ItemChatAssistantQuestionAutoRight;->H(Lcom/p1/mobile/putong/core/data/Message;)V

    .line 15
    .line 16
    .line 17
    :cond_0
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemChatAssistantQuestionAutoRight;->f:Landroid/widget/TextView;

    .line 18
    .line 19
    iget-object p3, p3, Lcom/p1/mobile/putong/core/data/Message;->value:Ljava/lang/String;

    .line 20
    .line 21
    invoke-virtual {p2, p3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 22
    .line 23
    .line 24
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemChatAssistantQuestionAutoRight;->g:Landroid/widget/ImageView;

    .line 25
    .line 26
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 27
    .line 28
    .line 29
    move-result-object p3

    .line 30
    invoke-virtual {p3}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 31
    .line 32
    .line 33
    move-result-object p3

    .line 34
    invoke-interface {p3}, Ll/r97;->v5()Z

    .line 35
    .line 36
    .line 37
    move-result p3

    .line 38
    invoke-static {p2, p3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 39
    .line 40
    .line 41
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemChatAssistantQuestionAutoRight;->i:Lcom/p1/mobile/putong/core/data/ChatAssistantQuestion;

    .line 42
    .line 43
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 44
    .line 45
    .line 46
    move-result p2

    .line 47
    if-eqz p2, :cond_1

    .line 48
    .line 49
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemChatAssistantQuestionAutoRight;->i:Lcom/p1/mobile/putong/core/data/ChatAssistantQuestion;

    .line 50
    .line 51
    iget p2, p2, Lcom/p1/mobile/putong/core/data/ChatAssistantQuestion;->questionId:I

    .line 52
    .line 53
    invoke-static {p2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object p2

    .line 57
    goto :goto_0

    .line 58
    :cond_1
    const-string p2, ""

    .line 59
    .line 60
    :goto_0
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 61
    .line 62
    .line 63
    move-result-object p3

    .line 64
    invoke-virtual {p3}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 65
    .line 66
    .line 67
    move-result-object p3

    .line 68
    invoke-interface {p3}, Ll/r97;->v5()Z

    .line 69
    .line 70
    .line 71
    move-result p3

    .line 72
    iget-object p4, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemChatAssistantQuestionAutoRight;->d:Landroid/view/View;

    .line 73
    .line 74
    if-eqz p3, :cond_2

    .line 75
    .line 76
    new-instance p3, Ll/t3q;

    .line 77
    .line 78
    invoke-direct {p3, p0, p1, p2}, Ll/t3q;-><init>(Lcom/p1/mobile/putong/core/ui/messages/ItemChatAssistantQuestionAutoRight;Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 79
    .line 80
    .line 81
    invoke-static {p4, p3}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 82
    .line 83
    .line 84
    return-void

    .line 85
    :cond_2
    const/4 p0, 0x0

    .line 86
    invoke-static {p4, p0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 87
    .line 88
    .line 89
    return-void
.end method

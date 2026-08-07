.class public Lcom/p1/mobile/putong/core/ui/messages/ItemChatAssistantQuestion;
.super Lv/VRelative;
.source "SourceFile"


# instance fields
.field public d:Lv/VImage;

.field public e:Lv/VText;

.field public f:Lv/VLinear;

.field public g:Lv/VText;

.field public h:Lv/VImage;

.field public i:Lv/VLinear;

.field public j:Lv/VText;

.field public k:Lv/VImage;

.field public l:Lcom/p1/mobile/android/app/Act;

.field public m:Lcom/p1/mobile/putong/core/data/Message;


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

.method public static synthetic B(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    const-string p0, "\u53d1\u9001\u5931\u8d25\uff0c\u8bf7\u91cd\u8bd5"

    .line 2
    .line 3
    invoke-static {p0}, Ll/r1j0;->g(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private synthetic L(Lcom/p1/mobile/putong/core/data/Message;Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/Message;->additionalData:Lcom/p1/mobile/putong/core/data/MessageAdditionalData;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->chatAssistantQuestions:Ljava/util/List;

    .line 4
    .line 5
    const/4 p2, 0x0

    .line 6
    invoke-interface {p1, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    check-cast p1, Lcom/p1/mobile/putong/core/data/ChatAssistantQuestion;

    .line 11
    .line 12
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/ItemChatAssistantQuestion;->O(Lcom/p1/mobile/putong/core/data/ChatAssistantQuestion;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method private synthetic M(Lcom/p1/mobile/putong/core/data/Message;Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/Message;->additionalData:Lcom/p1/mobile/putong/core/data/MessageAdditionalData;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->chatAssistantQuestions:Ljava/util/List;

    .line 4
    .line 5
    const/4 p2, 0x1

    .line 6
    invoke-interface {p1, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    check-cast p1, Lcom/p1/mobile/putong/core/data/ChatAssistantQuestion;

    .line 11
    .line 12
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/ItemChatAssistantQuestion;->O(Lcom/p1/mobile/putong/core/data/ChatAssistantQuestion;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public static synthetic p(Lcom/p1/mobile/putong/core/ui/messages/ItemChatAssistantQuestion;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/ItemChatAssistantQuestion;->I(Ll/uxj0;)V

    return-void
.end method

.method public static synthetic q(Lcom/p1/mobile/putong/core/ui/messages/ItemChatAssistantQuestion;Lcom/p1/mobile/putong/core/data/Message;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/messages/ItemChatAssistantQuestion;->M(Lcom/p1/mobile/putong/core/data/Message;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic z(Lcom/p1/mobile/putong/core/ui/messages/ItemChatAssistantQuestion;Lcom/p1/mobile/putong/core/data/Message;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/messages/ItemChatAssistantQuestion;->L(Lcom/p1/mobile/putong/core/data/Message;Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public final H(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/u3q;->a(Lcom/p1/mobile/putong/core/ui/messages/ItemChatAssistantQuestion;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic I(Ll/uxj0;)V
    .locals 0

    .line 1
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemChatAssistantQuestion;->m:Lcom/p1/mobile/putong/core/data/Message;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Message;->cid:Ljava/lang/String;

    .line 8
    .line 9
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/core/api/g;->Cf(Ljava/lang/String;)Lrx/c;

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final O(Lcom/p1/mobile/putong/core/data/ChatAssistantQuestion;)V
    .locals 2

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/ItemChatAssistantQuestion;->Q(Lcom/p1/mobile/putong/core/data/ChatAssistantQuestion;)V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Lcom/p1/mobile/putong/core/data/ChatAssistantQuestionPostBody;->new_()Lcom/p1/mobile/putong/core/data/ChatAssistantQuestionPostBody;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-static {}, Lcom/p1/mobile/putong/core/data/ChatAssistantQuestionSelected;->new_()Lcom/p1/mobile/putong/core/data/ChatAssistantQuestionSelected;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    iget p1, p1, Lcom/p1/mobile/putong/core/data/ChatAssistantQuestion;->questionId:I

    .line 13
    .line 14
    iput p1, v1, Lcom/p1/mobile/putong/core/data/ChatAssistantQuestionSelected;->questionId:I

    .line 15
    .line 16
    const/4 p1, 0x1

    .line 17
    iput-boolean p1, v1, Lcom/p1/mobile/putong/core/data/ChatAssistantQuestionSelected;->send:Z

    .line 18
    .line 19
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemChatAssistantQuestion;->m:Lcom/p1/mobile/putong/core/data/Message;

    .line 20
    .line 21
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/Message;->cid:Ljava/lang/String;

    .line 22
    .line 23
    iput-object p1, v1, Lcom/p1/mobile/putong/core/data/ChatAssistantQuestionSelected;->otherUserId:Ljava/lang/String;

    .line 24
    .line 25
    const-string p1, "inner"

    .line 26
    .line 27
    iput-object p1, v1, Lcom/p1/mobile/putong/core/data/ChatAssistantQuestionSelected;->category:Ljava/lang/String;

    .line 28
    .line 29
    iget-object p1, v0, Lcom/p1/mobile/putong/core/data/ChatAssistantQuestionPostBody;->chatAssistantQuestions:Ljava/util/List;

    .line 30
    .line 31
    invoke-interface {p1, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 35
    .line 36
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->U1:Ll/fg7;

    .line 37
    .line 38
    invoke-virtual {p1, v0}, Ll/fg7;->g3(Lcom/p1/mobile/putong/core/data/ChatAssistantQuestionPostBody;)Lrx/c;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    new-instance v0, Ll/r3q;

    .line 43
    .line 44
    invoke-direct {v0, p0}, Ll/r3q;-><init>(Lcom/p1/mobile/putong/core/ui/messages/ItemChatAssistantQuestion;)V

    .line 45
    .line 46
    .line 47
    new-instance p0, Ll/s3q;

    .line 48
    .line 49
    invoke-direct {p0}, Ll/s3q;-><init>()V

    .line 50
    .line 51
    .line 52
    invoke-static {v0, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 57
    .line 58
    .line 59
    return-void
.end method

.method public P(Lcom/p1/mobile/android/app/Act;Ll/pol;Lcom/p1/mobile/putong/core/data/Message;Ll/n100;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemChatAssistantQuestion;->l:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    iput-object p3, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemChatAssistantQuestion;->m:Lcom/p1/mobile/putong/core/data/Message;

    .line 4
    .line 5
    iget-object p1, p3, Lcom/p1/mobile/putong/core/data/Message;->additionalData:Lcom/p1/mobile/putong/core/data/MessageAdditionalData;

    .line 6
    .line 7
    if-eqz p1, :cond_2

    .line 8
    .line 9
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->chatAssistantQuestions:Ljava/util/List;

    .line 10
    .line 11
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    if-nez p1, :cond_2

    .line 16
    .line 17
    iget-object p1, p3, Lcom/p1/mobile/putong/core/data/Message;->additionalData:Lcom/p1/mobile/putong/core/data/MessageAdditionalData;

    .line 18
    .line 19
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->chatAssistantQuestions:Ljava/util/List;

    .line 20
    .line 21
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 22
    .line 23
    .line 24
    move-result p1

    .line 25
    const/4 p2, 0x2

    .line 26
    if-ge p1, p2, :cond_0

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_0
    iget-object p1, p3, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 30
    .line 31
    invoke-virtual {p4, p1}, Ll/n100;->a(Ljava/lang/String;)Z

    .line 32
    .line 33
    .line 34
    move-result p1

    .line 35
    if-nez p1, :cond_1

    .line 36
    .line 37
    iget-object p1, p3, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 38
    .line 39
    invoke-virtual {p4, p1}, Ll/n100;->b(Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    iget-object p1, p3, Lcom/p1/mobile/putong/core/data/Message;->additionalData:Lcom/p1/mobile/putong/core/data/MessageAdditionalData;

    .line 43
    .line 44
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->chatAssistantQuestions:Ljava/util/List;

    .line 45
    .line 46
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/ItemChatAssistantQuestion;->R(Ljava/util/List;)V

    .line 47
    .line 48
    .line 49
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemChatAssistantQuestion;->g:Lv/VText;

    .line 50
    .line 51
    iget-object p2, p3, Lcom/p1/mobile/putong/core/data/Message;->additionalData:Lcom/p1/mobile/putong/core/data/MessageAdditionalData;

    .line 52
    .line 53
    iget-object p2, p2, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->chatAssistantQuestions:Ljava/util/List;

    .line 54
    .line 55
    const/4 p4, 0x0

    .line 56
    invoke-interface {p2, p4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 57
    .line 58
    .line 59
    move-result-object p2

    .line 60
    check-cast p2, Lcom/p1/mobile/putong/core/data/ChatAssistantQuestion;

    .line 61
    .line 62
    iget-object p2, p2, Lcom/p1/mobile/putong/core/data/ChatAssistantQuestion;->question:Ljava/lang/String;

    .line 63
    .line 64
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 65
    .line 66
    .line 67
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemChatAssistantQuestion;->j:Lv/VText;

    .line 68
    .line 69
    iget-object p2, p3, Lcom/p1/mobile/putong/core/data/Message;->additionalData:Lcom/p1/mobile/putong/core/data/MessageAdditionalData;

    .line 70
    .line 71
    iget-object p2, p2, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->chatAssistantQuestions:Ljava/util/List;

    .line 72
    .line 73
    const/4 p4, 0x1

    .line 74
    invoke-interface {p2, p4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 75
    .line 76
    .line 77
    move-result-object p2

    .line 78
    check-cast p2, Lcom/p1/mobile/putong/core/data/ChatAssistantQuestion;

    .line 79
    .line 80
    iget-object p2, p2, Lcom/p1/mobile/putong/core/data/ChatAssistantQuestion;->question:Ljava/lang/String;

    .line 81
    .line 82
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 83
    .line 84
    .line 85
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemChatAssistantQuestion;->f:Lv/VLinear;

    .line 86
    .line 87
    new-instance p2, Ll/p3q;

    .line 88
    .line 89
    invoke-direct {p2, p0, p3}, Ll/p3q;-><init>(Lcom/p1/mobile/putong/core/ui/messages/ItemChatAssistantQuestion;Lcom/p1/mobile/putong/core/data/Message;)V

    .line 90
    .line 91
    .line 92
    invoke-static {p1, p2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 93
    .line 94
    .line 95
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemChatAssistantQuestion;->i:Lv/VLinear;

    .line 96
    .line 97
    new-instance p2, Ll/q3q;

    .line 98
    .line 99
    invoke-direct {p2, p0, p3}, Ll/q3q;-><init>(Lcom/p1/mobile/putong/core/ui/messages/ItemChatAssistantQuestion;Lcom/p1/mobile/putong/core/data/Message;)V

    .line 100
    .line 101
    .line 102
    invoke-static {p1, p2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 103
    .line 104
    .line 105
    :cond_2
    :goto_0
    return-void
.end method

.method public Q(Lcom/p1/mobile/putong/core/data/ChatAssistantQuestion;)V
    .locals 1

    .line 1
    const-string p0, "chat_question_content"

    .line 2
    .line 3
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/ChatAssistantQuestion;->question:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {p0, v0}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    const-string v0, "chat_question_type"

    .line 10
    .line 11
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/ChatAssistantQuestion;->type:Ljava/lang/String;

    .line 12
    .line 13
    invoke-static {v0, p1}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    filled-new-array {p0, p1}, [Ll/sfj0$a;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    const-string p1, "e_send_chat_question_guidance"

    .line 22
    .line 23
    const-string v0, "p_chat_view"

    .line 24
    .line 25
    invoke-static {p1, v0, p0}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public R(Ljava/util/List;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/ChatAssistantQuestion;",
            ">;)V"
        }
    .end annotation

    .line 1
    new-instance p0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance v0, Ljava/util/ArrayList;

    .line 7
    .line 8
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 9
    .line 10
    .line 11
    const/4 v1, 0x0

    .line 12
    :goto_0
    const/4 v2, 0x2

    .line 13
    if-ge v1, v2, :cond_0

    .line 14
    .line 15
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    check-cast v2, Lcom/p1/mobile/putong/core/data/ChatAssistantQuestion;

    .line 20
    .line 21
    iget-object v2, v2, Lcom/p1/mobile/putong/core/data/ChatAssistantQuestion;->question:Ljava/lang/String;

    .line 22
    .line 23
    invoke-interface {p0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object v2

    .line 30
    check-cast v2, Lcom/p1/mobile/putong/core/data/ChatAssistantQuestion;

    .line 31
    .line 32
    iget-object v2, v2, Lcom/p1/mobile/putong/core/data/ChatAssistantQuestion;->type:Ljava/lang/String;

    .line 33
    .line 34
    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 35
    .line 36
    .line 37
    add-int/lit8 v1, v1, 0x1

    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_0
    const-string p1, ","

    .line 41
    .line 42
    invoke-static {p1, p0}, Ll/du4;->a(Ljava/lang/CharSequence;Ljava/lang/Iterable;)Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    invoke-static {p1, v0}, Ll/du4;->a(Ljava/lang/CharSequence;Ljava/lang/Iterable;)Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object p1

    .line 50
    const-string v0, "chat_question_content"

    .line 51
    .line 52
    invoke-static {v0, p0}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    const-string v0, "chat_question_type"

    .line 57
    .line 58
    invoke-static {v0, p1}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 59
    .line 60
    .line 61
    move-result-object p1

    .line 62
    filled-new-array {p0, p1}, [Ll/sfj0$a;

    .line 63
    .line 64
    .line 65
    move-result-object p0

    .line 66
    const-string p1, "e_send_chat_question_guidance"

    .line 67
    .line 68
    const-string v0, "p_chat_view"

    .line 69
    .line 70
    invoke-static {p1, v0, p0}, Ll/sfj0;->h(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 71
    .line 72
    .line 73
    return-void
.end method

.method public onFinishInflate()V
    .locals 4

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemChatAssistantQuestion;->H(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemChatAssistantQuestion;->e:Lv/VText;

    .line 8
    .line 9
    const/4 v1, 0x3

    .line 10
    invoke-static {v1}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 11
    .line 12
    .line 13
    move-result-object v2

    .line 14
    const/4 v3, 0x1

    .line 15
    invoke-virtual {v0, v2, v3}, Landroidx/appcompat/widget/AppCompatTextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemChatAssistantQuestion;->g:Lv/VText;

    .line 19
    .line 20
    invoke-static {v1}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 21
    .line 22
    .line 23
    move-result-object v2

    .line 24
    invoke-virtual {v0, v2, v3}, Landroidx/appcompat/widget/AppCompatTextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 25
    .line 26
    .line 27
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemChatAssistantQuestion;->j:Lv/VText;

    .line 28
    .line 29
    invoke-static {v1}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    invoke-virtual {v0, v1, v3}, Landroidx/appcompat/widget/AppCompatTextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 34
    .line 35
    .line 36
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    invoke-virtual {v0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->I4()Z

    .line 45
    .line 46
    .line 47
    move-result v0

    .line 48
    if-eqz v0, :cond_0

    .line 49
    .line 50
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemChatAssistantQuestion;->d:Lv/VImage;

    .line 51
    .line 52
    sget v1, Ll/ibc0;->X1:I

    .line 53
    .line 54
    invoke-static {v0, v1}, Ll/bnl0;->N(Landroid/widget/ImageView;I)V

    .line 55
    .line 56
    .line 57
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemChatAssistantQuestion;->h:Lv/VImage;

    .line 58
    .line 59
    sget v1, Ll/ibc0;->Q1:I

    .line 60
    .line 61
    invoke-static {v0, v1}, Ll/bnl0;->N(Landroid/widget/ImageView;I)V

    .line 62
    .line 63
    .line 64
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemChatAssistantQuestion;->k:Lv/VImage;

    .line 65
    .line 66
    sget v1, Ll/ibc0;->Q1:I

    .line 67
    .line 68
    invoke-static {v0, v1}, Ll/bnl0;->N(Landroid/widget/ImageView;I)V

    .line 69
    .line 70
    .line 71
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemChatAssistantQuestion;->e:Lv/VText;

    .line 72
    .line 73
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 74
    .line 75
    .line 76
    move-result-object v1

    .line 77
    sget v2, Ll/g9c0;->i:I

    .line 78
    .line 79
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    .line 80
    .line 81
    .line 82
    move-result v1

    .line 83
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 84
    .line 85
    .line 86
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemChatAssistantQuestion;->g:Lv/VText;

    .line 87
    .line 88
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 89
    .line 90
    .line 91
    move-result-object v1

    .line 92
    sget v2, Ll/g9c0;->g:I

    .line 93
    .line 94
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    .line 95
    .line 96
    .line 97
    move-result v1

    .line 98
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 99
    .line 100
    .line 101
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemChatAssistantQuestion;->j:Lv/VText;

    .line 102
    .line 103
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 104
    .line 105
    .line 106
    move-result-object p0

    .line 107
    sget v1, Ll/g9c0;->g:I

    .line 108
    .line 109
    invoke-virtual {p0, v1}, Landroid/content/res/Resources;->getColor(I)I

    .line 110
    .line 111
    .line 112
    move-result p0

    .line 113
    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 114
    .line 115
    .line 116
    :cond_0
    return-void
.end method

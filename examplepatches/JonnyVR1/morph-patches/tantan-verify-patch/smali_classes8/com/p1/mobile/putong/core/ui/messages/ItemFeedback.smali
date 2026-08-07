.class public Lcom/p1/mobile/putong/core/ui/messages/ItemFeedback;
.super Landroid/widget/LinearLayout;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/putong/core/ui/messages/a;


# instance fields
.field public a:Lcom/p1/mobile/putong/core/ui/messages/ItemFeedback;

.field public b:Lcom/p1/mobile/putong/core/ui/messages/ItemText;

.field public c:Lcom/p1/mobile/putong/core/ui/messages/ItemText;

.field public d:Lv/VText;

.field public e:Lv/VText;

.field public f:Lcom/p1/mobile/putong/core/data/Message;

.field public g:Lcom/p1/mobile/putong/core/data/MessageFeedbackStatus;

.field public h:Z

.field public i:Ljava/lang/String;

.field public j:Ljava/lang/String;


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

.method public static synthetic a(Lcom/p1/mobile/putong/core/ui/messages/ItemFeedback;Landroid/view/View;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/messages/ItemFeedback;->g(Landroid/view/View;Ljava/lang/Boolean;)V

    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/core/ui/messages/ItemFeedback;ILandroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/messages/ItemFeedback;->i(ILandroid/view/View;)V

    return-void
.end method

.method public static synthetic c(Ljava/lang/Throwable;)V
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

.method public static synthetic d(Lcom/p1/mobile/putong/core/ui/messages/ItemFeedback;ILandroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/messages/ItemFeedback;->h(ILandroid/view/View;)V

    return-void
.end method


# virtual methods
.method public A(Lcom/p1/mobile/putong/core/data/Message;)V
    .locals 2

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemFeedback;->f:Lcom/p1/mobile/putong/core/data/Message;

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
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemFeedback;->g:Lcom/p1/mobile/putong/core/data/MessageFeedbackStatus;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 14
    .line 15
    :catch_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemFeedback;->g:Lcom/p1/mobile/putong/core/data/MessageFeedbackStatus;

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
    goto :goto_1

    .line 24
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemFeedback;->g:Lcom/p1/mobile/putong/core/data/MessageFeedbackStatus;

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
    xor-int/lit8 v0, v0, 0x1

    .line 35
    .line 36
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemFeedback;->h:Z

    .line 37
    .line 38
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemFeedback;->g:Lcom/p1/mobile/putong/core/data/MessageFeedbackStatus;

    .line 39
    .line 40
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/MessageFeedbackStatus;->feedback_category:Ljava/lang/String;

    .line 41
    .line 42
    const-string v1, "solved"

    .line 43
    .line 44
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 45
    .line 46
    .line 47
    move-result v0

    .line 48
    if-eqz v0, :cond_1

    .line 49
    .line 50
    const-string v0, "e_assistant_service_feedback_solved"

    .line 51
    .line 52
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemFeedback;->i:Ljava/lang/String;

    .line 53
    .line 54
    const-string v0, "if_solved"

    .line 55
    .line 56
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemFeedback;->j:Ljava/lang/String;

    .line 57
    .line 58
    goto :goto_0

    .line 59
    :cond_1
    const-string v0, "e_assistant_service_feedback_content"

    .line 60
    .line 61
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemFeedback;->i:Ljava/lang/String;

    .line 62
    .line 63
    const-string v0, "if_content"

    .line 64
    .line 65
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemFeedback;->j:Ljava/lang/String;

    .line 66
    .line 67
    :goto_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemFeedback;->n()V

    .line 68
    .line 69
    .line 70
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemFeedback;->l()V

    .line 71
    .line 72
    .line 73
    iget-object v0, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 74
    .line 75
    invoke-static {v0}, Ll/k900;->d(Ljava/lang/String;)Z

    .line 76
    .line 77
    .line 78
    move-result v0

    .line 79
    if-nez v0, :cond_2

    .line 80
    .line 81
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 82
    .line 83
    invoke-static {p1}, Ll/k900;->a(Ljava/lang/String;)V

    .line 84
    .line 85
    .line 86
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemFeedback;->i:Ljava/lang/String;

    .line 87
    .line 88
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemFeedback;->j:Ljava/lang/String;

    .line 89
    .line 90
    const-string v0, ""

    .line 91
    .line 92
    invoke-static {p0, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 93
    .line 94
    .line 95
    move-result-object p0

    .line 96
    filled-new-array {p0}, [Ll/pf60;

    .line 97
    .line 98
    .line 99
    move-result-object p0

    .line 100
    const-string v0, "p_chat_view"

    .line 101
    .line 102
    invoke-static {p1, v0, p0}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 103
    .line 104
    .line 105
    :cond_2
    :goto_1
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

.method public final e(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/n5q;->a(Lcom/p1/mobile/putong/core/ui/messages/ItemFeedback;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public f()Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;
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

.method public final synthetic g(Landroid/view/View;Ljava/lang/Boolean;)V
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
    iput-boolean p2, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemFeedback;->h:Z

    .line 9
    .line 10
    check-cast p1, Landroid/widget/TextView;

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
    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 23
    .line 24
    .line 25
    :cond_0
    return-void
.end method

.method public final synthetic h(ILandroid/view/View;)V
    .locals 7

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemFeedback;->f()Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

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
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemFeedback;->f:Lcom/p1/mobile/putong/core/data/Message;

    .line 10
    .line 11
    iget-object v2, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 12
    .line 13
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemFeedback;->g:Lcom/p1/mobile/putong/core/data/MessageFeedbackStatus;

    .line 14
    .line 15
    iget-object v3, v0, Lcom/p1/mobile/putong/core/data/MessageFeedbackStatus;->feedback_id:Ljava/lang/String;

    .line 16
    .line 17
    iget-object v4, v0, Lcom/p1/mobile/putong/core/data/MessageFeedbackStatus;->feedback_category:Ljava/lang/String;

    .line 18
    .line 19
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/MessageFeedbackStatus;->question:Lcom/p1/mobile/putong/core/data/MessageFeedbackQuestion;

    .line 20
    .line 21
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/MessageFeedbackQuestion;->answers:Ljava/util/List;

    .line 22
    .line 23
    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    check-cast p1, Lcom/p1/mobile/putong/core/data/MessageFeedbackAnswers;

    .line 28
    .line 29
    iget-object v5, p1, Lcom/p1/mobile/putong/core/data/MessageFeedbackAnswers;->id:Ljava/lang/String;

    .line 30
    .line 31
    iget-object v6, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemFeedback;->f:Lcom/p1/mobile/putong/core/data/Message;

    .line 32
    .line 33
    invoke-virtual/range {v1 .. v6}, Ll/clz;->f3(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Message;)Lrx/c;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    new-instance v0, Ll/h5q;

    .line 38
    .line 39
    invoke-direct {v0, p0, p2}, Ll/h5q;-><init>(Lcom/p1/mobile/putong/core/ui/messages/ItemFeedback;Landroid/view/View;)V

    .line 40
    .line 41
    .line 42
    new-instance p0, Ll/i5q;

    .line 43
    .line 44
    invoke-direct {p0}, Ll/i5q;-><init>()V

    .line 45
    .line 46
    .line 47
    invoke-static {v0, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 52
    .line 53
    .line 54
    return-void
.end method

.method public final synthetic i(ILandroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p2, p1}, Lcom/p1/mobile/putong/core/ui/messages/ItemFeedback;->j(Landroid/view/View;I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final j(Landroid/view/View;I)V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemFeedback;->h:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    new-instance v0, Ll/g5q;

    .line 7
    .line 8
    invoke-direct {v0, p0, p2, p1}, Ll/g5q;-><init>(Lcom/p1/mobile/putong/core/ui/messages/ItemFeedback;ILandroid/view/View;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemFeedback;->f()Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->l()Ll/clz;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    invoke-virtual {p1}, Ll/clz;->t7()Ll/qzz;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    invoke-virtual {p1, v0}, Ll/qzz;->y1(Ljava/lang/Runnable;)V

    .line 24
    .line 25
    .line 26
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemFeedback;->i:Ljava/lang/String;

    .line 27
    .line 28
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemFeedback;->j:Ljava/lang/String;

    .line 29
    .line 30
    if-nez p2, :cond_1

    .line 31
    .line 32
    const-string p2, "yes"

    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_1
    const-string p2, "no"

    .line 36
    .line 37
    :goto_0
    invoke-static {p0, p2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    filled-new-array {p0}, [Ll/pf60;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    const-string p2, "p_chat_view"

    .line 46
    .line 47
    invoke-static {p1, p2, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 48
    .line 49
    .line 50
    return-void
.end method

.method public final k(Lv/VText;ILjava/lang/String;)V
    .locals 3

    .line 1
    add-int/lit8 v0, p2, 0x1

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemFeedback;->g:Lcom/p1/mobile/putong/core/data/MessageFeedbackStatus;

    .line 4
    .line 5
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/MessageFeedbackStatus;->question:Lcom/p1/mobile/putong/core/data/MessageFeedbackQuestion;

    .line 6
    .line 7
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/MessageFeedbackQuestion;->answers:Ljava/util/List;

    .line 8
    .line 9
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    if-le v0, v1, :cond_0

    .line 14
    .line 15
    return-void

    .line 16
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemFeedback;->g:Lcom/p1/mobile/putong/core/data/MessageFeedbackStatus;

    .line 17
    .line 18
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/MessageFeedbackStatus;->question:Lcom/p1/mobile/putong/core/data/MessageFeedbackQuestion;

    .line 19
    .line 20
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/MessageFeedbackQuestion;->answers:Ljava/util/List;

    .line 21
    .line 22
    invoke-interface {v0, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    check-cast v0, Lcom/p1/mobile/putong/core/data/MessageFeedbackAnswers;

    .line 27
    .line 28
    invoke-virtual {p1}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    const/4 v2, 0x1

    .line 33
    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setFakeBoldText(Z)V

    .line 34
    .line 35
    .line 36
    iget-object v1, v0, Lcom/p1/mobile/putong/core/data/MessageFeedbackAnswers;->id:Ljava/lang/String;

    .line 37
    .line 38
    invoke-static {v1, p3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 39
    .line 40
    .line 41
    move-result p3

    .line 42
    if-eqz p3, :cond_1

    .line 43
    .line 44
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 45
    .line 46
    .line 47
    move-result-object p3

    .line 48
    sget v1, Ll/g9c0;->y:I

    .line 49
    .line 50
    invoke-virtual {p3, v1}, Landroid/content/res/Resources;->getColor(I)I

    .line 51
    .line 52
    .line 53
    move-result p3

    .line 54
    goto :goto_0

    .line 55
    :cond_1
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 56
    .line 57
    .line 58
    move-result-object p3

    .line 59
    sget v1, Ll/g9c0;->M:I

    .line 60
    .line 61
    invoke-virtual {p3, v1}, Landroid/content/res/Resources;->getColor(I)I

    .line 62
    .line 63
    .line 64
    move-result p3

    .line 65
    :goto_0
    invoke-virtual {p1, p3}, Landroid/widget/TextView;->setTextColor(I)V

    .line 66
    .line 67
    .line 68
    iget-object p3, v0, Lcom/p1/mobile/putong/core/data/MessageFeedbackAnswers;->value:Ljava/lang/String;

    .line 69
    .line 70
    invoke-static {p1, p3}, Ll/bnl0;->H0(Landroid/widget/TextView;Ljava/lang/String;)Z

    .line 71
    .line 72
    .line 73
    new-instance p3, Ll/f5q;

    .line 74
    .line 75
    invoke-direct {p3, p0, p2}, Ll/f5q;-><init>(Lcom/p1/mobile/putong/core/ui/messages/ItemFeedback;I)V

    .line 76
    .line 77
    .line 78
    invoke-static {p1, p3}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 79
    .line 80
    .line 81
    return-void
.end method

.method public final l()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemFeedback;->d:Lv/VText;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemFeedback;->g:Lcom/p1/mobile/putong/core/data/MessageFeedbackStatus;

    .line 4
    .line 5
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/MessageFeedbackStatus;->question:Lcom/p1/mobile/putong/core/data/MessageFeedbackQuestion;

    .line 6
    .line 7
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/MessageFeedbackQuestion;->answer:Ljava/lang/String;

    .line 8
    .line 9
    const/4 v2, 0x0

    .line 10
    invoke-virtual {p0, v0, v2, v1}, Lcom/p1/mobile/putong/core/ui/messages/ItemFeedback;->k(Lv/VText;ILjava/lang/String;)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemFeedback;->e:Lv/VText;

    .line 14
    .line 15
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemFeedback;->g:Lcom/p1/mobile/putong/core/data/MessageFeedbackStatus;

    .line 16
    .line 17
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/MessageFeedbackStatus;->question:Lcom/p1/mobile/putong/core/data/MessageFeedbackQuestion;

    .line 18
    .line 19
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/MessageFeedbackQuestion;->answer:Ljava/lang/String;

    .line 20
    .line 21
    const/4 v2, 0x1

    .line 22
    invoke-virtual {p0, v0, v2, v1}, Lcom/p1/mobile/putong/core/ui/messages/ItemFeedback;->k(Lv/VText;ILjava/lang/String;)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public m(IZLcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;)V
    .locals 0

    .line 1
    return-void
.end method

.method public final n()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemFeedback;->b:Lcom/p1/mobile/putong/core/ui/messages/ItemText;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemFeedback;->g:Lcom/p1/mobile/putong/core/data/MessageFeedbackStatus;

    .line 4
    .line 5
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/MessageFeedbackStatus;->question:Lcom/p1/mobile/putong/core/data/MessageFeedbackQuestion;

    .line 6
    .line 7
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/MessageFeedbackQuestion;->text:Ljava/lang/String;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemFeedback;->f:Lcom/p1/mobile/putong/core/data/Message;

    .line 10
    .line 11
    invoke-virtual {v0, v1, p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemText;->D(Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Message;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public onFinishInflate()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemFeedback;->e(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemFeedback;->b:Lcom/p1/mobile/putong/core/ui/messages/ItemText;

    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    invoke-virtual {p0, v0}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

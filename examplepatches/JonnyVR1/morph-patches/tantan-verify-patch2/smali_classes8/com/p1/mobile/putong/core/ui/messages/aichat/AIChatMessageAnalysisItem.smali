.class public Lcom/p1/mobile/putong/core/ui/messages/aichat/AIChatMessageAnalysisItem;
.super Landroid/widget/RelativeLayout;
.source "SourceFile"


# instance fields
.field public a:Landroid/widget/RelativeLayout;

.field public b:Landroid/widget/ImageView;

.field public c:Landroid/widget/TextView;

.field public d:Lcom/p1/mobile/putong/core/ui/messages/aichat/TextTypeView;

.field public e:Lcom/tantan/library/svga/SVGAnimationView;

.field public f:Lv/VLinear;

.field public g:Lv/VLinear;

.field public h:Lv/VLinear;

.field public i:Lcom/p1/mobile/putong/core/data/AiChatMessageExtraInfo;

.field public j:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

.field public k:Lcom/p1/mobile/putong/core/data/Message;


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

.method public static synthetic a(Lcom/p1/mobile/putong/core/ui/messages/aichat/AIChatMessageAnalysisItem;Lcom/p1/mobile/putong/data/Envelope;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/aichat/AIChatMessageAnalysisItem;->j(Lcom/p1/mobile/putong/data/Envelope;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/core/ui/messages/aichat/AIChatMessageAnalysisItem;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/aichat/AIChatMessageAnalysisItem;->m(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/core/ui/messages/aichat/AIChatMessageAnalysisItem;Lcom/p1/mobile/putong/core/data/Message;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/aichat/AIChatMessageAnalysisItem;->k(Lcom/p1/mobile/putong/core/data/Message;)V

    return-void
.end method

.method public static synthetic d(Lcom/p1/mobile/putong/core/ui/messages/aichat/AIChatMessageAnalysisItem;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/aichat/AIChatMessageAnalysisItem;->l(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic e(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    sget p0, Lcom/p1/mobile/putong/core/message/R$string;->B2:I

    .line 2
    .line 3
    invoke-static {p0}, Ll/r1j0;->a(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic f()V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->x2:Ll/cv6;

    .line 4
    .line 5
    const-string v1, ""

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Ll/cv6;->u3(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final g(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/b0;->a(Lcom/p1/mobile/putong/core/ui/messages/aichat/AIChatMessageAnalysisItem;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final h(Z)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/aichat/AIChatMessageAnalysisItem;->j:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 7
    .line 8
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->x2:Ll/cv6;

    .line 9
    .line 10
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/aichat/AIChatMessageAnalysisItem;->k:Lcom/p1/mobile/putong/core/data/Message;

    .line 11
    .line 12
    iget-object v2, v2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 13
    .line 14
    invoke-virtual {v1, v2, p1}, Ll/cv6;->l3(Ljava/lang/String;Z)Lrx/c;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    invoke-virtual {v0, p1}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    new-instance v0, Ll/x;

    .line 23
    .line 24
    invoke-direct {v0, p0}, Ll/x;-><init>(Lcom/p1/mobile/putong/core/ui/messages/aichat/AIChatMessageAnalysisItem;)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {p1, v0}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    new-instance v0, Ll/y;

    .line 32
    .line 33
    invoke-direct {v0, p0}, Ll/y;-><init>(Lcom/p1/mobile/putong/core/ui/messages/aichat/AIChatMessageAnalysisItem;)V

    .line 34
    .line 35
    .line 36
    new-instance p0, Ll/z;

    .line 37
    .line 38
    invoke-direct {p0}, Ll/z;-><init>()V

    .line 39
    .line 40
    .line 41
    invoke-static {v0, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 46
    .line 47
    .line 48
    return-void
.end method

.method public i()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/aichat/AIChatMessageAnalysisItem;->h:Lv/VLinear;

    .line 2
    .line 3
    new-instance v1, Ll/v;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/v;-><init>(Lcom/p1/mobile/putong/core/ui/messages/aichat/AIChatMessageAnalysisItem;)V

    .line 6
    .line 7
    .line 8
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/aichat/AIChatMessageAnalysisItem;->g:Lv/VLinear;

    .line 12
    .line 13
    new-instance v1, Ll/w;

    .line 14
    .line 15
    invoke-direct {v1, p0}, Ll/w;-><init>(Lcom/p1/mobile/putong/core/ui/messages/aichat/AIChatMessageAnalysisItem;)V

    .line 16
    .line 17
    .line 18
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-static {v0}, Lcom/tantan/library/svga/SVGALoader;->with(Landroid/content/Context;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    const-string v1, "https://fe-static.tancdn.com/v1/raw/0c2db6c3-0413-4e94-a64e-33a31fa835a214.svga"

    .line 30
    .line 31
    invoke-virtual {v0, v1}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->from(Ljava/lang/String;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    const/4 v1, -0x1

    .line 36
    invoke-virtual {v0, v1}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->repeatCount(I)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    const/4 v1, 0x0

    .line 41
    invoke-virtual {v0, v1}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->autoPlay(Z)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/aichat/AIChatMessageAnalysisItem;->e:Lcom/tantan/library/svga/SVGAnimationView;

    .line 46
    .line 47
    invoke-virtual {v0, p0}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->into(Lcom/tantan/library/svga/SVGAnimationView;)V

    .line 48
    .line 49
    .line 50
    return-void
.end method

.method public final synthetic j(Lcom/p1/mobile/putong/data/Envelope;)Lrx/c;
    .locals 2

    .line 1
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/aichat/AIChatMessageAnalysisItem;->k:Lcom/p1/mobile/putong/core/data/Message;

    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->cid:Ljava/lang/String;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 10
    .line 11
    const/4 v1, 0x1

    .line 12
    invoke-virtual {p1, v0, p0, v1}, Lcom/p1/mobile/putong/core/api/g;->Ln(Ljava/lang/String;Ljava/lang/String;Z)Lrx/c;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    return-object p0
.end method

.method public final synthetic k(Lcom/p1/mobile/putong/core/data/Message;)V
    .locals 0

    .line 1
    const-string p1, "\u610f\u89c1\u5df2\u6536\u5230\uff0c\u8c22\u8c22\uff01"

    .line 2
    .line 3
    invoke-static {p1}, Ll/r1j0;->g(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/aichat/AIChatMessageAnalysisItem;->f:Lv/VLinear;

    .line 7
    .line 8
    const/4 p1, 0x0

    .line 9
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final synthetic l(Landroid/view/View;)V
    .locals 3

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/aichat/AIChatMessageAnalysisItem;->i:Lcom/p1/mobile/putong/core/data/AiChatMessageExtraInfo;

    .line 2
    .line 3
    if-nez p1, :cond_0

    .line 4
    .line 5
    const-string p1, ""

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/AiChatMessageExtraInfo;->response_uuid:Ljava/lang/String;

    .line 9
    .line 10
    :goto_0
    const-string v0, "response_uuid"

    .line 11
    .line 12
    invoke-static {v0, p1}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    const-string v0, "action_type_ai"

    .line 17
    .line 18
    const-string v1, "good"

    .line 19
    .line 20
    invoke-static {v0, v1}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/aichat/AIChatMessageAnalysisItem;->k:Lcom/p1/mobile/putong/core/data/Message;

    .line 25
    .line 26
    iget-object v1, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 27
    .line 28
    const-string v2, "ai_msg_id"

    .line 29
    .line 30
    invoke-static {v2, v1}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    filled-new-array {p1, v0, v1}, [Ll/sfj0$a;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    const-string v0, "e_ai_chat_analysis_effect"

    .line 39
    .line 40
    const-string v1, "p_chat_view"

    .line 41
    .line 42
    invoke-static {v0, v1, p1}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 43
    .line 44
    .line 45
    const/4 p1, 0x1

    .line 46
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/aichat/AIChatMessageAnalysisItem;->h(Z)V

    .line 47
    .line 48
    .line 49
    return-void
.end method

.method public final synthetic m(Landroid/view/View;)V
    .locals 3

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/aichat/AIChatMessageAnalysisItem;->i:Lcom/p1/mobile/putong/core/data/AiChatMessageExtraInfo;

    .line 2
    .line 3
    if-nez p1, :cond_0

    .line 4
    .line 5
    const-string p1, ""

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/AiChatMessageExtraInfo;->response_uuid:Ljava/lang/String;

    .line 9
    .line 10
    :goto_0
    const-string v0, "response_uuid"

    .line 11
    .line 12
    invoke-static {v0, p1}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    const-string v0, "action_type_ai"

    .line 17
    .line 18
    const-string v1, "bad"

    .line 19
    .line 20
    invoke-static {v0, v1}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/aichat/AIChatMessageAnalysisItem;->k:Lcom/p1/mobile/putong/core/data/Message;

    .line 25
    .line 26
    iget-object v1, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 27
    .line 28
    const-string v2, "ai_msg_id"

    .line 29
    .line 30
    invoke-static {v2, v1}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    filled-new-array {p1, v0, v1}, [Ll/sfj0$a;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    const-string v0, "e_ai_chat_analysis_effect"

    .line 39
    .line 40
    const-string v1, "p_chat_view"

    .line 41
    .line 42
    invoke-static {v0, v1, p1}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 43
    .line 44
    .line 45
    const/4 p1, 0x0

    .line 46
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/aichat/AIChatMessageAnalysisItem;->h(Z)V

    .line 47
    .line 48
    .line 49
    return-void
.end method

.method public n(Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;Lcom/p1/mobile/putong/core/data/Message;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/aichat/AIChatMessageAnalysisItem;->j:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/aichat/AIChatMessageAnalysisItem;->k:Lcom/p1/mobile/putong/core/data/Message;

    .line 4
    .line 5
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/data/Message;->getAiChatMessageExtraInfo()Lcom/p1/mobile/putong/core/data/AiChatMessageExtraInfo;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/aichat/AIChatMessageAnalysisItem;->i:Lcom/p1/mobile/putong/core/data/AiChatMessageExtraInfo;

    .line 10
    .line 11
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    if-eqz p1, :cond_3

    .line 16
    .line 17
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/aichat/AIChatMessageAnalysisItem;->i:Lcom/p1/mobile/putong/core/data/AiChatMessageExtraInfo;

    .line 18
    .line 19
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/AiChatMessageExtraInfo;->scene:Ljava/lang/String;

    .line 20
    .line 21
    const-string p2, "compatibility"

    .line 22
    .line 23
    invoke-static {p1, p2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 24
    .line 25
    .line 26
    move-result p1

    .line 27
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/aichat/AIChatMessageAnalysisItem;->c:Landroid/widget/TextView;

    .line 28
    .line 29
    if-eqz p1, :cond_0

    .line 30
    .line 31
    const-string p1, "\u5e2e\u4f60\u770b\u770b\u4e0e\u5bf9\u65b9\u7684\u5339\u914d\u5ea6"

    .line 32
    .line 33
    invoke-virtual {p2, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 34
    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_0
    const-string p1, "\u5e2e\u4f60\u770b\u770b\u5bf9\u65b9\u5728\u60f3\u4ec0\u4e48\uff1f"

    .line 38
    .line 39
    invoke-virtual {p2, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 40
    .line 41
    .line 42
    :goto_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/aichat/AIChatMessageAnalysisItem;->i:Lcom/p1/mobile/putong/core/data/AiChatMessageExtraInfo;

    .line 43
    .line 44
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/AiChatMessageExtraInfo;->status:Lcom/p1/mobile/putong/core/data/AIMessageStatus;

    .line 45
    .line 46
    const-string p2, "pending"

    .line 47
    .line 48
    invoke-static {p1, p2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 49
    .line 50
    .line 51
    move-result p1

    .line 52
    if-eqz p1, :cond_1

    .line 53
    .line 54
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/aichat/AIChatMessageAnalysisItem;->q()V

    .line 55
    .line 56
    .line 57
    return-void

    .line 58
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/aichat/AIChatMessageAnalysisItem;->i:Lcom/p1/mobile/putong/core/data/AiChatMessageExtraInfo;

    .line 59
    .line 60
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/AiChatMessageExtraInfo;->status:Lcom/p1/mobile/putong/core/data/AIMessageStatus;

    .line 61
    .line 62
    const-string p2, "success"

    .line 63
    .line 64
    invoke-static {p1, p2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 65
    .line 66
    .line 67
    move-result p1

    .line 68
    if-eqz p1, :cond_2

    .line 69
    .line 70
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/aichat/AIChatMessageAnalysisItem;->i:Lcom/p1/mobile/putong/core/data/AiChatMessageExtraInfo;

    .line 71
    .line 72
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/AiChatMessageExtraInfo;->content:Ljava/lang/String;

    .line 73
    .line 74
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 75
    .line 76
    .line 77
    move-result p1

    .line 78
    if-nez p1, :cond_2

    .line 79
    .line 80
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/aichat/AIChatMessageAnalysisItem;->o()V

    .line 81
    .line 82
    .line 83
    return-void

    .line 84
    :cond_2
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/aichat/AIChatMessageAnalysisItem;->p()V

    .line 85
    .line 86
    .line 87
    return-void

    .line 88
    :cond_3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/aichat/AIChatMessageAnalysisItem;->p()V

    .line 89
    .line 90
    .line 91
    return-void
.end method

.method public final o()V
    .locals 7

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/aichat/AIChatMessageAnalysisItem;->i:Lcom/p1/mobile/putong/core/data/AiChatMessageExtraInfo;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/AiChatMessageExtraInfo;->response_uuid:Ljava/lang/String;

    .line 4
    .line 5
    const-string v1, "response_uuid"

    .line 6
    .line 7
    invoke-static {v1, v0}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    const-string v2, "is_success_ai"

    .line 12
    .line 13
    const-string v3, "true"

    .line 14
    .line 15
    invoke-static {v2, v3}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/messages/aichat/AIChatMessageAnalysisItem;->k:Lcom/p1/mobile/putong/core/data/Message;

    .line 20
    .line 21
    iget-object v3, v3, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 22
    .line 23
    const-string v4, "ai_msg_id"

    .line 24
    .line 25
    invoke-static {v4, v3}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 26
    .line 27
    .line 28
    move-result-object v3

    .line 29
    filled-new-array {v0, v2, v3}, [Ll/sfj0$a;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    const-string v2, "e_ai_chat_analysis_result"

    .line 34
    .line 35
    const-string v3, "p_chat_view"

    .line 36
    .line 37
    invoke-static {v2, v3, v0}, Ll/sfj0;->h(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 38
    .line 39
    .line 40
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/aichat/AIChatMessageAnalysisItem;->e:Lcom/tantan/library/svga/SVGAnimationView;

    .line 41
    .line 42
    const/4 v2, 0x1

    .line 43
    invoke-virtual {v0, v2}, Lcom/tantan/library/svga/SVGAnimationView;->stopAnimation(Z)V

    .line 44
    .line 45
    .line 46
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/aichat/AIChatMessageAnalysisItem;->e:Lcom/tantan/library/svga/SVGAnimationView;

    .line 47
    .line 48
    const/4 v5, 0x0

    .line 49
    invoke-static {v0, v5}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 50
    .line 51
    .line 52
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/aichat/AIChatMessageAnalysisItem;->k:Lcom/p1/mobile/putong/core/data/Message;

    .line 53
    .line 54
    iget-object v0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 55
    .line 56
    sget-object v6, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 57
    .line 58
    iget-object v6, v6, Lcom/p1/mobile/putong/core/api/c;->x2:Ll/cv6;

    .line 59
    .line 60
    invoke-virtual {v6}, Ll/cv6;->o3()Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object v6

    .line 64
    invoke-static {v0, v6}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 65
    .line 66
    .line 67
    move-result v0

    .line 68
    iget-object v6, p0, Lcom/p1/mobile/putong/core/ui/messages/aichat/AIChatMessageAnalysisItem;->d:Lcom/p1/mobile/putong/core/ui/messages/aichat/TextTypeView;

    .line 69
    .line 70
    if-eqz v0, :cond_0

    .line 71
    .line 72
    new-instance v0, Ll/a0;

    .line 73
    .line 74
    invoke-direct {v0}, Ll/a0;-><init>()V

    .line 75
    .line 76
    .line 77
    invoke-virtual {v6, v0}, Lcom/p1/mobile/putong/core/ui/messages/aichat/TextTypeView;->setListener(Lcom/p1/mobile/putong/core/ui/messages/aichat/TextTypeView$b;)V

    .line 78
    .line 79
    .line 80
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/aichat/AIChatMessageAnalysisItem;->d:Lcom/p1/mobile/putong/core/ui/messages/aichat/TextTypeView;

    .line 81
    .line 82
    iget-object v6, p0, Lcom/p1/mobile/putong/core/ui/messages/aichat/AIChatMessageAnalysisItem;->i:Lcom/p1/mobile/putong/core/data/AiChatMessageExtraInfo;

    .line 83
    .line 84
    iget-object v6, v6, Lcom/p1/mobile/putong/core/data/AiChatMessageExtraInfo;->content:Ljava/lang/String;

    .line 85
    .line 86
    invoke-virtual {v0, v6}, Lcom/p1/mobile/putong/core/ui/messages/aichat/TextTypeView;->setTextAnim(Ljava/lang/String;)V

    .line 87
    .line 88
    .line 89
    goto :goto_0

    .line 90
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/aichat/AIChatMessageAnalysisItem;->i:Lcom/p1/mobile/putong/core/data/AiChatMessageExtraInfo;

    .line 91
    .line 92
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/AiChatMessageExtraInfo;->content:Ljava/lang/String;

    .line 93
    .line 94
    invoke-virtual {v6, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 95
    .line 96
    .line 97
    :goto_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/aichat/AIChatMessageAnalysisItem;->i:Lcom/p1/mobile/putong/core/data/AiChatMessageExtraInfo;

    .line 98
    .line 99
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/AiChatMessageExtraInfo;->feedback:Lcom/p1/mobile/putong/core/data/AIMessageFeedback;

    .line 100
    .line 101
    const-string v6, "unknown_"

    .line 102
    .line 103
    invoke-static {v0, v6}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 104
    .line 105
    .line 106
    move-result v0

    .line 107
    iget-object v6, p0, Lcom/p1/mobile/putong/core/ui/messages/aichat/AIChatMessageAnalysisItem;->f:Lv/VLinear;

    .line 108
    .line 109
    if-eqz v0, :cond_1

    .line 110
    .line 111
    invoke-static {v6, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 112
    .line 113
    .line 114
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/aichat/AIChatMessageAnalysisItem;->i:Lcom/p1/mobile/putong/core/data/AiChatMessageExtraInfo;

    .line 115
    .line 116
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/AiChatMessageExtraInfo;->response_uuid:Ljava/lang/String;

    .line 117
    .line 118
    invoke-static {v1, v0}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 119
    .line 120
    .line 121
    move-result-object v0

    .line 122
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/aichat/AIChatMessageAnalysisItem;->k:Lcom/p1/mobile/putong/core/data/Message;

    .line 123
    .line 124
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 125
    .line 126
    invoke-static {v4, p0}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 127
    .line 128
    .line 129
    move-result-object p0

    .line 130
    filled-new-array {v0, p0}, [Ll/sfj0$a;

    .line 131
    .line 132
    .line 133
    move-result-object p0

    .line 134
    const-string v0, "e_ai_chat_analysis_effect"

    .line 135
    .line 136
    invoke-static {v0, v3, p0}, Ll/sfj0;->h(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 137
    .line 138
    .line 139
    return-void

    .line 140
    :cond_1
    invoke-static {v6, v5}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 141
    .line 142
    .line 143
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/ui/messages/aichat/AIChatMessageAnalysisItem;->g(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/aichat/AIChatMessageAnalysisItem;->i()V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final p()V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/aichat/AIChatMessageAnalysisItem;->i:Lcom/p1/mobile/putong/core/data/AiChatMessageExtraInfo;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/aichat/AIChatMessageAnalysisItem;->i:Lcom/p1/mobile/putong/core/data/AiChatMessageExtraInfo;

    .line 10
    .line 11
    iget-object v1, v0, Lcom/p1/mobile/putong/core/data/AiChatMessageExtraInfo;->content:Ljava/lang/String;

    .line 12
    .line 13
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/AiChatMessageExtraInfo;->response_uuid:Ljava/lang/String;

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    const-string v1, ""

    .line 17
    .line 18
    move-object v0, v1

    .line 19
    :goto_0
    const-string v2, "response_uuid"

    .line 20
    .line 21
    invoke-static {v2, v0}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    const-string v2, "is_success_ai"

    .line 26
    .line 27
    const-string v3, "false"

    .line 28
    .line 29
    invoke-static {v2, v3}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 30
    .line 31
    .line 32
    move-result-object v2

    .line 33
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/messages/aichat/AIChatMessageAnalysisItem;->k:Lcom/p1/mobile/putong/core/data/Message;

    .line 34
    .line 35
    iget-object v3, v3, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 36
    .line 37
    const-string v4, "ai_msg_id"

    .line 38
    .line 39
    invoke-static {v4, v3}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 40
    .line 41
    .line 42
    move-result-object v3

    .line 43
    filled-new-array {v0, v2, v3}, [Ll/sfj0$a;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    const-string v2, "e_ai_chat_analysis_result"

    .line 48
    .line 49
    const-string v3, "p_chat_view"

    .line 50
    .line 51
    invoke-static {v2, v3, v0}, Ll/sfj0;->h(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 52
    .line 53
    .line 54
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/aichat/AIChatMessageAnalysisItem;->f:Lv/VLinear;

    .line 55
    .line 56
    const/4 v2, 0x0

    .line 57
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 58
    .line 59
    .line 60
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/aichat/AIChatMessageAnalysisItem;->e:Lcom/tantan/library/svga/SVGAnimationView;

    .line 61
    .line 62
    const/4 v3, 0x1

    .line 63
    invoke-virtual {v0, v3}, Lcom/tantan/library/svga/SVGAnimationView;->stopAnimation(Z)V

    .line 64
    .line 65
    .line 66
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/aichat/AIChatMessageAnalysisItem;->e:Lcom/tantan/library/svga/SVGAnimationView;

    .line 67
    .line 68
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 69
    .line 70
    .line 71
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 72
    .line 73
    .line 74
    move-result v0

    .line 75
    if-eqz v0, :cond_1

    .line 76
    .line 77
    const-string v1, "\u52a0\u8f7d\u5931\u8d25\uff0c\u8bf7\u7a0d\u540e\u91cd\u8bd5"

    .line 78
    .line 79
    :cond_1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/aichat/AIChatMessageAnalysisItem;->d:Lcom/p1/mobile/putong/core/ui/messages/aichat/TextTypeView;

    .line 80
    .line 81
    invoke-virtual {p0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 82
    .line 83
    .line 84
    return-void
.end method

.method public final q()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/aichat/AIChatMessageAnalysisItem;->f:Lv/VLinear;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/aichat/AIChatMessageAnalysisItem;->e:Lcom/tantan/library/svga/SVGAnimationView;

    .line 8
    .line 9
    const/4 v1, 0x1

    .line 10
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/aichat/AIChatMessageAnalysisItem;->e:Lcom/tantan/library/svga/SVGAnimationView;

    .line 14
    .line 15
    invoke-virtual {v0}, Lcom/tantan/library/svga/SVGAnimationView;->startAnimation()V

    .line 16
    .line 17
    .line 18
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/aichat/AIChatMessageAnalysisItem;->d:Lcom/p1/mobile/putong/core/ui/messages/aichat/TextTypeView;

    .line 19
    .line 20
    const-string v0, ""

    .line 21
    .line 22
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

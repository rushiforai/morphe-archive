.class public Lcom/p1/mobile/putong/core/ui/messages/ItemAiChatGuideMessage;
.super Landroid/widget/RelativeLayout;
.source "SourceFile"


# instance fields
.field public a:Lcom/p1/mobile/putong/core/ui/messages/ItemAiChatGuideMessage;

.field public b:Landroid/widget/ImageView;

.field public c:Landroid/widget/ImageView;

.field public d:Landroid/widget/TextView;

.field public e:Landroid/widget/TextView;

.field public f:Landroid/widget/TextView;

.field public g:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

.field public h:Ljava/lang/String;

.field public i:Ljava/lang/String;

.field public j:Ll/kcg0;

.field public final k:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const-string p1, "guide_type_analyze"

    .line 5
    .line 6
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemAiChatGuideMessage;->h:Ljava/lang/String;

    .line 7
    .line 8
    const-string p1, ""

    .line 9
    .line 10
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemAiChatGuideMessage;->i:Ljava/lang/String;

    .line 11
    .line 12
    const/16 p1, 0x3a98

    .line 13
    .line 14
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemAiChatGuideMessage;->k:I

    .line 15
    .line 16
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 17
    invoke-direct {p0, p1, p2}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 18
    const-string p1, "guide_type_analyze"

    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemAiChatGuideMessage;->h:Ljava/lang/String;

    .line 19
    const-string p1, ""

    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemAiChatGuideMessage;->i:Ljava/lang/String;

    const/16 p1, 0x3a98

    .line 20
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemAiChatGuideMessage;->k:I

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 21
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 22
    const-string p1, "guide_type_analyze"

    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemAiChatGuideMessage;->h:Ljava/lang/String;

    .line 23
    const-string p1, ""

    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemAiChatGuideMessage;->i:Ljava/lang/String;

    const/16 p1, 0x3a98

    .line 24
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemAiChatGuideMessage;->k:I

    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/core/ui/messages/ItemAiChatGuideMessage;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/ItemAiChatGuideMessage;->l(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/core/ui/messages/ItemAiChatGuideMessage;Lcom/p1/mobile/putong/core/data/AIChatAnalysis;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/ItemAiChatGuideMessage;->k(Lcom/p1/mobile/putong/core/data/AIChatAnalysis;)V

    return-void
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/core/ui/messages/ItemAiChatGuideMessage;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/ItemAiChatGuideMessage;->r(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic d(Lcom/p1/mobile/putong/core/ui/messages/ItemAiChatGuideMessage;Ljava/lang/Long;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/ItemAiChatGuideMessage;->o(Ljava/lang/Long;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic e(Lcom/p1/mobile/putong/core/ui/messages/ItemAiChatGuideMessage;Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/messages/ItemAiChatGuideMessage;->n(Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic f(Lcom/p1/mobile/putong/core/ui/messages/ItemAiChatGuideMessage;Ljava/lang/String;Ljava/lang/Long;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/messages/ItemAiChatGuideMessage;->p(Ljava/lang/String;Ljava/lang/Long;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic g(Lcom/p1/mobile/putong/core/ui/messages/ItemAiChatGuideMessage;JLcom/p1/mobile/putong/core/data/Message;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/ui/messages/ItemAiChatGuideMessage;->q(JLcom/p1/mobile/putong/core/data/Message;)V

    return-void
.end method

.method public static synthetic h(Lcom/p1/mobile/putong/core/ui/messages/ItemAiChatGuideMessage;Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/messages/ItemAiChatGuideMessage;->m(Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public final i(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/i2q;->a(Lcom/p1/mobile/putong/core/ui/messages/ItemAiChatGuideMessage;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final j()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemAiChatGuideMessage;->g:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->l()Ll/clz;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Ll/clz;->r3()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemAiChatGuideMessage;->g:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 12
    .line 13
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 14
    .line 15
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->x2:Ll/cv6;

    .line 16
    .line 17
    invoke-virtual {v2, v0}, Ll/cv6;->m3(Ljava/lang/String;)Lrx/c;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-virtual {v1, v0}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    new-instance v1, Ll/c2q;

    .line 26
    .line 27
    invoke-direct {v1, p0}, Ll/c2q;-><init>(Lcom/p1/mobile/putong/core/ui/messages/ItemAiChatGuideMessage;)V

    .line 28
    .line 29
    .line 30
    new-instance v2, Ll/d2q;

    .line 31
    .line 32
    invoke-direct {v2, p0}, Ll/d2q;-><init>(Lcom/p1/mobile/putong/core/ui/messages/ItemAiChatGuideMessage;)V

    .line 33
    .line 34
    .line 35
    invoke-static {v1, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 40
    .line 41
    .line 42
    return-void
.end method

.method public final synthetic k(Lcom/p1/mobile/putong/core/data/AIChatAnalysis;)V
    .locals 5

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/AIChatAnalysis;->messageId:Ljava/lang/String;

    .line 2
    .line 3
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemAiChatGuideMessage;->i:Ljava/lang/String;

    .line 4
    .line 5
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 6
    .line 7
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 8
    .line 9
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemAiChatGuideMessage;->g:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 10
    .line 11
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->l()Ll/clz;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    iget-object v1, v1, Ll/clz;->c:Ljava/lang/String;

    .line 16
    .line 17
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemAiChatGuideMessage;->i:Ljava/lang/String;

    .line 18
    .line 19
    const/4 v3, 0x0

    .line 20
    iget-object v4, p1, Lcom/p1/mobile/putong/core/data/AIChatAnalysis;->scene:Ljava/lang/String;

    .line 21
    .line 22
    invoke-virtual {v0, v1, v2, v3, v4}, Lcom/p1/mobile/putong/core/api/g;->Mn(Ljava/lang/String;Ljava/lang/String;ZLjava/lang/String;)Lrx/c;

    .line 23
    .line 24
    .line 25
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemAiChatGuideMessage;->g:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 26
    .line 27
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->y2()Ll/qzz;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    invoke-virtual {v0}, Ll/qzz;->Z1()V

    .line 32
    .line 33
    .line 34
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/AIChatAnalysis;->scene:Ljava/lang/String;

    .line 35
    .line 36
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/ItemAiChatGuideMessage;->v(Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public final synthetic l(Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    const-string v0, ""

    .line 2
    .line 3
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemAiChatGuideMessage;->i:Ljava/lang/String;

    .line 4
    .line 5
    instance-of p0, p1, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;

    .line 6
    .line 7
    if-eqz p0, :cond_3

    .line 8
    .line 9
    check-cast p1, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;

    .line 10
    .line 11
    iget p0, p1, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;->subCode:I

    .line 12
    .line 13
    const p1, 0x9c41

    .line 14
    .line 15
    .line 16
    if-ne p0, p1, :cond_0

    .line 17
    .line 18
    const-string p0, "\u4eca\u65e5\u6b21\u6570\u5df2\u7528\u5b8c\uff0c\u660e\u5929\u518d\u6765\u8bd5\u8bd5\u5427\uff01"

    .line 19
    .line 20
    invoke-static {p0}, Ll/r1j0;->g(Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    return-void

    .line 24
    :cond_0
    const p1, 0x9c42

    .line 25
    .line 26
    .line 27
    if-ne p0, p1, :cond_1

    .line 28
    .line 29
    const-string p0, "\u6b63\u5728\u52aa\u529b\u751f\u6210\u4e2d\uff0c\u8bf7\u7a0d\u5019\u7247\u523b\u54e6\uff01"

    .line 30
    .line 31
    invoke-static {p0}, Ll/r1j0;->g(Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    return-void

    .line 35
    :cond_1
    const p1, 0x9c43

    .line 36
    .line 37
    .line 38
    if-ne p0, p1, :cond_2

    .line 39
    .line 40
    const-string p0, "\u804a\u5929\u81f3\u5c11\u5f97\u6765\u56de\u4e00\u8f6e\uff0c\u624d\u80fd\u5e2e\u4f60\u5206\u6790\u54e6\uff01"

    .line 41
    .line 42
    invoke-static {p0}, Ll/r1j0;->g(Ljava/lang/String;)V

    .line 43
    .line 44
    .line 45
    return-void

    .line 46
    :cond_2
    sget p0, Lcom/p1/mobile/putong/core/message/R$string;->B2:I

    .line 47
    .line 48
    invoke-static {p0}, Ll/r1j0;->f(I)V

    .line 49
    .line 50
    .line 51
    return-void

    .line 52
    :cond_3
    sget p0, Lcom/p1/mobile/putong/core/message/R$string;->B2:I

    .line 53
    .line 54
    invoke-static {p0}, Ll/r1j0;->a(I)V

    .line 55
    .line 56
    .line 57
    return-void
.end method

.method public final synthetic m(Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;Landroid/view/View;)V
    .locals 1

    .line 1
    const-string p2, "start"

    .line 2
    .line 3
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/core/ui/messages/ItemAiChatGuideMessage;->t(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 7
    .line 8
    iget-object p2, p2, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 9
    .line 10
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->l()Ll/clz;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {v0}, Ll/clz;->i3()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-virtual {p2, v0}, Lcom/p1/mobile/putong/core/api/g;->Kf(Ljava/lang/String;)Lrx/c;

    .line 19
    .line 20
    .line 21
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemAiChatGuideMessage;->h:Ljava/lang/String;

    .line 22
    .line 23
    const-string v0, "guide_type_analyze"

    .line 24
    .line 25
    invoke-static {p2, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 26
    .line 27
    .line 28
    move-result p2

    .line 29
    const-string v0, "\u5f53\u524d\u65e0\u53ef\u7528\u6b21\u6570"

    .line 30
    .line 31
    if-eqz p2, :cond_1

    .line 32
    .line 33
    invoke-static {}, Ll/joa;->k3()I

    .line 34
    .line 35
    .line 36
    move-result p1

    .line 37
    if-gtz p1, :cond_0

    .line 38
    .line 39
    invoke-static {v0}, Ll/r1j0;->g(Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    return-void

    .line 43
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemAiChatGuideMessage;->j()V

    .line 44
    .line 45
    .line 46
    return-void

    .line 47
    :cond_1
    invoke-static {}, Ll/joa;->l3()I

    .line 48
    .line 49
    .line 50
    move-result p0

    .line 51
    if-gtz p0, :cond_2

    .line 52
    .line 53
    invoke-static {v0}, Ll/r1j0;->g(Ljava/lang/String;)V

    .line 54
    .line 55
    .line 56
    return-void

    .line 57
    :cond_2
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->e2()V

    .line 58
    .line 59
    .line 60
    return-void
.end method

.method public final synthetic n(Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;Landroid/view/View;)V
    .locals 0

    .line 1
    const-string p2, "close"

    .line 2
    .line 3
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/core/ui/messages/ItemAiChatGuideMessage;->t(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 7
    .line 8
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 9
    .line 10
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->l()Ll/clz;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    invoke-virtual {p1}, Ll/clz;->i3()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/api/g;->Kf(Ljava/lang/String;)Lrx/c;

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public final synthetic o(Ljava/lang/Long;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemAiChatGuideMessage;->i:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemAiChatGuideMessage;->i(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final synthetic p(Ljava/lang/String;Ljava/lang/Long;)Lrx/c;
    .locals 2

    .line 1
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p2, p2, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 4
    .line 5
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemAiChatGuideMessage;->g:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 6
    .line 7
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->l()Ll/clz;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iget-object v0, v0, Ll/clz;->c:Ljava/lang/String;

    .line 12
    .line 13
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemAiChatGuideMessage;->i:Ljava/lang/String;

    .line 14
    .line 15
    const/4 v1, 0x1

    .line 16
    invoke-virtual {p2, v0, p0, v1, p1}, Lcom/p1/mobile/putong/core/api/g;->Mn(Ljava/lang/String;Ljava/lang/String;ZLjava/lang/String;)Lrx/c;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    return-object p0
.end method

.method public final synthetic q(JLcom/p1/mobile/putong/core/data/Message;)V
    .locals 4

    .line 1
    invoke-virtual {p3}, Lcom/p1/mobile/putong/core/data/Message;->getAiChatMessageExtraInfo()Lcom/p1/mobile/putong/core/data/AiChatMessageExtraInfo;

    .line 2
    .line 3
    .line 4
    move-result-object p3

    .line 5
    invoke-static {p3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    const/4 v1, 0x0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    iget-object p3, p3, Lcom/p1/mobile/putong/core/data/AiChatMessageExtraInfo;->status:Lcom/p1/mobile/putong/core/data/AIMessageStatus;

    .line 13
    .line 14
    const-string v0, "pending"

    .line 15
    .line 16
    invoke-static {p3, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 17
    .line 18
    .line 19
    move-result p3

    .line 20
    if-nez p3, :cond_1

    .line 21
    .line 22
    :cond_0
    sget-object p3, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 23
    .line 24
    iget-object p3, p3, Lcom/p1/mobile/putong/core/api/c;->C0:Ll/joa;

    .line 25
    .line 26
    invoke-virtual {p3}, Ll/joa;->v4()Lrx/c;

    .line 27
    .line 28
    .line 29
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemAiChatGuideMessage;->i:Ljava/lang/String;

    .line 30
    .line 31
    :cond_1
    iget-object p3, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemAiChatGuideMessage;->g:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 32
    .line 33
    invoke-virtual {p3}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->y2()Ll/qzz;

    .line 34
    .line 35
    .line 36
    move-result-object p3

    .line 37
    invoke-virtual {p3}, Ll/qzz;->Z1()V

    .line 38
    .line 39
    .line 40
    invoke-static {}, Ll/pzi0;->o()J

    .line 41
    .line 42
    .line 43
    move-result-wide v2

    .line 44
    sub-long/2addr v2, p1

    .line 45
    const-wide/16 p1, 0x3a98

    .line 46
    .line 47
    cmp-long p1, v2, p1

    .line 48
    .line 49
    if-lez p1, :cond_2

    .line 50
    .line 51
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemAiChatGuideMessage;->j:Ll/kcg0;

    .line 52
    .line 53
    invoke-static {p1}, Ll/bsj0;->U(Ll/kcg0;)V

    .line 54
    .line 55
    .line 56
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemAiChatGuideMessage;->i:Ljava/lang/String;

    .line 57
    .line 58
    :cond_2
    return-void
.end method

.method public final synthetic r(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemAiChatGuideMessage;->j:Ll/kcg0;

    .line 2
    .line 3
    invoke-static {p1}, Ll/bsj0;->U(Ll/kcg0;)V

    .line 4
    .line 5
    .line 6
    const/4 p1, 0x0

    .line 7
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemAiChatGuideMessage;->i:Ljava/lang/String;

    .line 8
    .line 9
    return-void
.end method

.method public s(Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;Lcom/p1/mobile/putong/core/data/Message;)V
    .locals 1

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemAiChatGuideMessage;->g:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 2
    .line 3
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    iget-object v0, p2, Lcom/p1/mobile/putong/core/data/Message;->additionalData:Lcom/p1/mobile/putong/core/data/MessageAdditionalData;

    .line 11
    .line 12
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-eqz v0, :cond_1

    .line 17
    .line 18
    iget-object v0, p2, Lcom/p1/mobile/putong/core/data/Message;->additionalData:Lcom/p1/mobile/putong/core/data/MessageAdditionalData;

    .line 19
    .line 20
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->aiChatGuideType:Ljava/lang/String;

    .line 21
    .line 22
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    if-eqz v0, :cond_1

    .line 27
    .line 28
    iget-object p2, p2, Lcom/p1/mobile/putong/core/data/Message;->additionalData:Lcom/p1/mobile/putong/core/data/MessageAdditionalData;

    .line 29
    .line 30
    iget-object p2, p2, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->aiChatGuideType:Ljava/lang/String;

    .line 31
    .line 32
    const-string v0, "guide_type_analyze"

    .line 33
    .line 34
    invoke-static {p2, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 35
    .line 36
    .line 37
    move-result p2

    .line 38
    if-eqz p2, :cond_1

    .line 39
    .line 40
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemAiChatGuideMessage;->h:Ljava/lang/String;

    .line 41
    .line 42
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemAiChatGuideMessage;->b:Landroid/widget/ImageView;

    .line 43
    .line 44
    sget v0, Ll/ibc0;->T1:I

    .line 45
    .line 46
    invoke-virtual {p2, v0}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 47
    .line 48
    .line 49
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemAiChatGuideMessage;->d:Landroid/widget/TextView;

    .line 50
    .line 51
    const-string v0, "\u60c5\u611f\u5206\u6790"

    .line 52
    .line 53
    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 54
    .line 55
    .line 56
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemAiChatGuideMessage;->e:Landroid/widget/TextView;

    .line 57
    .line 58
    const-string v0, "\u5e2e\u4f60\u770b\u770b\u5bf9\u65b9\u5728\u60f3\u4ec0\u4e48\uff1f"

    .line 59
    .line 60
    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 61
    .line 62
    .line 63
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemAiChatGuideMessage;->f:Landroid/widget/TextView;

    .line 64
    .line 65
    const-string v0, "\u7acb\u5373\u5206\u6790"

    .line 66
    .line 67
    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 68
    .line 69
    .line 70
    goto :goto_0

    .line 71
    :cond_1
    const-string p2, "guide_type_answer"

    .line 72
    .line 73
    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemAiChatGuideMessage;->h:Ljava/lang/String;

    .line 74
    .line 75
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemAiChatGuideMessage;->b:Landroid/widget/ImageView;

    .line 76
    .line 77
    sget v0, Ll/ibc0;->U1:I

    .line 78
    .line 79
    invoke-virtual {p2, v0}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 80
    .line 81
    .line 82
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemAiChatGuideMessage;->d:Landroid/widget/TextView;

    .line 83
    .line 84
    const-string v0, "\u667a\u80fd\u8bdd\u672f"

    .line 85
    .line 86
    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 87
    .line 88
    .line 89
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemAiChatGuideMessage;->e:Landroid/widget/TextView;

    .line 90
    .line 91
    const-string v0, "\u5982\u4f55\u56de\u590d\u80fd\u8ba9\u5bf9\u65b9\u6ee1\u610f\uff1f"

    .line 92
    .line 93
    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 94
    .line 95
    .line 96
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemAiChatGuideMessage;->f:Landroid/widget/TextView;

    .line 97
    .line 98
    const-string v0, "\u7acb\u5373\u751f\u6210"

    .line 99
    .line 100
    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 101
    .line 102
    .line 103
    :goto_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemAiChatGuideMessage;->u()V

    .line 104
    .line 105
    .line 106
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemAiChatGuideMessage;->f:Landroid/widget/TextView;

    .line 107
    .line 108
    new-instance v0, Ll/a2q;

    .line 109
    .line 110
    invoke-direct {v0, p0, p1}, Ll/a2q;-><init>(Lcom/p1/mobile/putong/core/ui/messages/ItemAiChatGuideMessage;Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;)V

    .line 111
    .line 112
    .line 113
    invoke-static {p2, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 114
    .line 115
    .line 116
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemAiChatGuideMessage;->c:Landroid/widget/ImageView;

    .line 117
    .line 118
    new-instance v0, Ll/b2q;

    .line 119
    .line 120
    invoke-direct {v0, p0, p1}, Ll/b2q;-><init>(Lcom/p1/mobile/putong/core/ui/messages/ItemAiChatGuideMessage;Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;)V

    .line 121
    .line 122
    .line 123
    invoke-static {p2, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 124
    .line 125
    .line 126
    return-void
.end method

.method public t(Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemAiChatGuideMessage;->h:Ljava/lang/String;

    .line 2
    .line 3
    const-string v0, "guide_type_answer"

    .line 4
    .line 5
    invoke-static {p0, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    const-string p0, "smart_scripts"

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    const-string p0, "chat_analysis"

    .line 15
    .line 16
    :goto_0
    const-string v0, "guide_type_ai"

    .line 17
    .line 18
    invoke-static {v0, p0}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    const-string v0, "click_type_ai"

    .line 23
    .line 24
    invoke-static {v0, p1}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    filled-new-array {p0, p1}, [Ll/sfj0$a;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    const-string p1, "e_ai_guide"

    .line 33
    .line 34
    const-string v0, "p_chat_view"

    .line 35
    .line 36
    invoke-static {p1, v0, p0}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public final u()V
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemAiChatGuideMessage;->h:Ljava/lang/String;

    .line 2
    .line 3
    const-string v0, "guide_type_answer"

    .line 4
    .line 5
    invoke-static {p0, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    const-string p0, "smart_scripts"

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    const-string p0, "chat_analysis"

    .line 15
    .line 16
    :goto_0
    const-string v0, "guide_type_ai"

    .line 17
    .line 18
    invoke-static {v0, p0}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    filled-new-array {p0}, [Ll/sfj0$a;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    const-string v0, "e_ai_guide"

    .line 27
    .line 28
    const-string v1, "p_chat_view"

    .line 29
    .line 30
    invoke-static {v0, v1, p0}, Ll/sfj0;->h(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method public final v(Ljava/lang/String;)V
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemAiChatGuideMessage;->j:Ll/kcg0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/bsj0;->U(Ll/kcg0;)V

    .line 4
    .line 5
    .line 6
    invoke-static {}, Ll/pzi0;->o()J

    .line 7
    .line 8
    .line 9
    move-result-wide v0

    .line 10
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemAiChatGuideMessage;->g:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 11
    .line 12
    const-wide/16 v3, 0x2

    .line 13
    .line 14
    sget-object v5, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    .line 15
    .line 16
    invoke-static {v3, v4, v3, v4, v5}, Lrx/c;->interval(JJLjava/util/concurrent/TimeUnit;)Lrx/c;

    .line 17
    .line 18
    .line 19
    move-result-object v3

    .line 20
    invoke-virtual {v2, v3}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 21
    .line 22
    .line 23
    move-result-object v2

    .line 24
    invoke-virtual {v2}, Lrx/c;->onBackpressureLatest()Lrx/c;

    .line 25
    .line 26
    .line 27
    move-result-object v2

    .line 28
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 29
    .line 30
    .line 31
    move-result-object v3

    .line 32
    invoke-virtual {v2, v3}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 33
    .line 34
    .line 35
    move-result-object v2

    .line 36
    new-instance v3, Ll/e2q;

    .line 37
    .line 38
    invoke-direct {v3, p0}, Ll/e2q;-><init>(Lcom/p1/mobile/putong/core/ui/messages/ItemAiChatGuideMessage;)V

    .line 39
    .line 40
    .line 41
    invoke-virtual {v2, v3}, Lrx/c;->takeUntil(Ll/qcj;)Lrx/c;

    .line 42
    .line 43
    .line 44
    move-result-object v2

    .line 45
    new-instance v3, Ll/f2q;

    .line 46
    .line 47
    invoke-direct {v3, p0, p1}, Ll/f2q;-><init>(Lcom/p1/mobile/putong/core/ui/messages/ItemAiChatGuideMessage;Ljava/lang/String;)V

    .line 48
    .line 49
    .line 50
    invoke-virtual {v2, v3}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 51
    .line 52
    .line 53
    move-result-object p1

    .line 54
    new-instance v2, Ll/g2q;

    .line 55
    .line 56
    invoke-direct {v2, p0, v0, v1}, Ll/g2q;-><init>(Lcom/p1/mobile/putong/core/ui/messages/ItemAiChatGuideMessage;J)V

    .line 57
    .line 58
    .line 59
    new-instance v0, Ll/h2q;

    .line 60
    .line 61
    invoke-direct {v0, p0}, Ll/h2q;-><init>(Lcom/p1/mobile/putong/core/ui/messages/ItemAiChatGuideMessage;)V

    .line 62
    .line 63
    .line 64
    invoke-static {v2, v0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    invoke-virtual {p1, v0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 69
    .line 70
    .line 71
    move-result-object p1

    .line 72
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemAiChatGuideMessage;->j:Ll/kcg0;

    .line 73
    .line 74
    return-void
.end method

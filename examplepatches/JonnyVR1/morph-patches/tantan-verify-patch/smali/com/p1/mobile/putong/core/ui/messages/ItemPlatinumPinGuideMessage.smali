.class public Lcom/p1/mobile/putong/core/ui/messages/ItemPlatinumPinGuideMessage;
.super Landroid/widget/LinearLayout;
.source "SourceFile"


# instance fields
.field public a:Landroid/widget/TextView;

.field public b:Landroid/widget/TextView;

.field public c:Landroid/widget/TextView;

.field public d:Landroid/widget/ImageView;


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
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 5
    invoke-direct {p0, p1, p2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 6
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/android/app/Act;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    const-string p0, "\u5979"

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    const-string p0, "\u4ed6"

    .line 11
    .line 12
    :goto_0
    filled-new-array {p0}, [Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    const-string p2, "\u5df2\u6210\u4e3a%s\u7684\u7f6e\u9876\u804a\u5929"

    .line 17
    .line 18
    invoke-static {p2, p0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    check-cast p1, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 26
    .line 27
    iget-object p0, p1, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->f:Ll/clz;

    .line 28
    .line 29
    invoke-virtual {p0}, Ll/clz;->H6()V

    .line 30
    .line 31
    .line 32
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 33
    .line 34
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->C0:Ll/joa;

    .line 35
    .line 36
    invoke-virtual {p0}, Ll/joa;->y4()Lrx/c;

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public static synthetic b(Ljava/lang/Throwable;)V
    .locals 2

    .line 1
    instance-of v0, p0, Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    check-cast p0, Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;

    .line 6
    .line 7
    iget v0, p0, Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;->code:I

    .line 8
    .line 9
    const v1, 0x9dcf

    .line 10
    .line 11
    .line 12
    if-ne v0, v1, :cond_0

    .line 13
    .line 14
    iget-object p0, p0, Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;->message:Ljava/lang/String;

    .line 15
    .line 16
    invoke-static {p0}, Ll/r1j0;->g(Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    return-void

    .line 20
    :cond_0
    const-string p0, "\u8bbe\u7f6e\u5931\u8d25\uff0c\u8bf7\u7a0d\u540e\u518d\u8bd5"

    .line 21
    .line 22
    invoke-static {p0}, Ll/r1j0;->g(Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public static synthetic c(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/Conversation;Landroid/view/View;)V
    .locals 4

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->pageId()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    const-string v0, "button_type"

    .line 6
    .line 7
    const-string v1, "close"

    .line 8
    .line 9
    invoke-static {v0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    filled-new-array {v0}, [Ll/pf60;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    const-string v1, "e_platinum_top_chat"

    .line 18
    .line 19
    invoke-static {v1, p2, v0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 20
    .line 21
    .line 22
    check-cast p0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 23
    .line 24
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->f:Ll/clz;

    .line 25
    .line 26
    invoke-virtual {p0}, Ll/clz;->H6()V

    .line 27
    .line 28
    .line 29
    sget-object p0, Lcom/p1/mobile/putong/core/newui/messages/util/ConversationCounterTypeSp;->platinumChatPinGuideLastCloseTime:Lcom/p1/mobile/putong/core/newui/messages/util/ConversationCounterTypeSp;

    .line 30
    .line 31
    iget-object p2, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 32
    .line 33
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/core/newui/messages/util/ConversationCounterTypeSp;->get(Ljava/lang/String;)I

    .line 34
    .line 35
    .line 36
    move-result p2

    .line 37
    int-to-long v0, p2

    .line 38
    const-wide/16 v2, 0x3e8

    .line 39
    .line 40
    mul-long/2addr v0, v2

    .line 41
    invoke-static {v0, v1}, Ll/pzi0;->D(J)Z

    .line 42
    .line 43
    .line 44
    move-result p2

    .line 45
    if-nez p2, :cond_0

    .line 46
    .line 47
    sget-object p2, Lcom/p1/mobile/putong/core/newui/messages/util/ConversationCounterTypeSp;->platinumChatPinGuideCloseCount:Lcom/p1/mobile/putong/core/newui/messages/util/ConversationCounterTypeSp;

    .line 48
    .line 49
    iget-object v0, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 50
    .line 51
    const/4 v1, 0x1

    .line 52
    invoke-virtual {p2, v0, v1}, Lcom/p1/mobile/putong/core/newui/messages/util/ConversationCounterTypeSp;->set(Ljava/lang/String;I)V

    .line 53
    .line 54
    .line 55
    goto :goto_0

    .line 56
    :cond_0
    sget-object p2, Lcom/p1/mobile/putong/core/newui/messages/util/ConversationCounterTypeSp;->platinumChatPinGuideCloseCount:Lcom/p1/mobile/putong/core/newui/messages/util/ConversationCounterTypeSp;

    .line 57
    .line 58
    iget-object v0, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 59
    .line 60
    invoke-virtual {p2, v0}, Lcom/p1/mobile/putong/core/newui/messages/util/ConversationCounterTypeSp;->set(Ljava/lang/String;)V

    .line 61
    .line 62
    .line 63
    :goto_0
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 64
    .line 65
    invoke-static {}, Ll/pzi0;->o()J

    .line 66
    .line 67
    .line 68
    move-result-wide v0

    .line 69
    div-long/2addr v0, v2

    .line 70
    long-to-int p2, v0

    .line 71
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/newui/messages/util/ConversationCounterTypeSp;->set(Ljava/lang/String;I)V

    .line 72
    .line 73
    .line 74
    return-void
.end method

.method public static synthetic d(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Landroid/view/View;)V
    .locals 6

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->pageId()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    const-string v0, "button_type"

    .line 6
    .line 7
    const-string v1, "open"

    .line 8
    .line 9
    invoke-static {v0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    filled-new-array {v0}, [Ll/pf60;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    const-string v1, "e_platinum_top_chat"

    .line 18
    .line 19
    invoke-static {v1, p2, v0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 20
    .line 21
    .line 22
    invoke-static {}, Ll/joa;->I3()Z

    .line 23
    .line 24
    .line 25
    move-result p2

    .line 26
    if-nez p2, :cond_0

    .line 27
    .line 28
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    invoke-virtual {p1}, Ll/j49;->g()Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    sget-object v3, Lcom/p1/mobile/putong/core/data/Privilege;->top_chat:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 37
    .line 38
    const/4 v4, 0x0

    .line 39
    const/4 v5, 0x0

    .line 40
    const-string v2, "p_chat_view,e_platinum_top_chat,click"

    .line 41
    .line 42
    move-object v1, p0

    .line 43
    invoke-interface/range {v0 .. v5}, Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;->Ds(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Privilege;Ll/y20;Ll/x20;)V

    .line 44
    .line 45
    .line 46
    return-void

    .line 47
    :cond_0
    move-object v1, p0

    .line 48
    invoke-static {}, Ll/joa;->w4()I

    .line 49
    .line 50
    .line 51
    move-result p0

    .line 52
    if-gtz p0, :cond_1

    .line 53
    .line 54
    const-string p0, "\u7279\u6743\u6b21\u6570\u5df2\u7528\u5b8c"

    .line 55
    .line 56
    invoke-static {p0}, Ll/r1j0;->g(Ljava/lang/String;)V

    .line 57
    .line 58
    .line 59
    return-void

    .line 60
    :cond_1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 61
    .line 62
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e2:Ll/pla;

    .line 63
    .line 64
    iget-object p2, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 65
    .line 66
    const/4 v0, 0x1

    .line 67
    invoke-virtual {p0, p2, v0}, Ll/pla;->w3(Ljava/lang/String;Z)Lrx/c;

    .line 68
    .line 69
    .line 70
    move-result-object p0

    .line 71
    invoke-virtual {v1, p0}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 72
    .line 73
    .line 74
    move-result-object p0

    .line 75
    new-instance p2, Ll/feq;

    .line 76
    .line 77
    invoke-direct {p2, p1, v1}, Ll/feq;-><init>(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/android/app/Act;)V

    .line 78
    .line 79
    .line 80
    new-instance p1, Ll/geq;

    .line 81
    .line 82
    invoke-direct {p1}, Ll/geq;-><init>()V

    .line 83
    .line 84
    .line 85
    invoke-static {p2, p1}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 86
    .line 87
    .line 88
    move-result-object p1

    .line 89
    invoke-virtual {p0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 90
    .line 91
    .line 92
    return-void
.end method


# virtual methods
.method public final e(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/heq;->a(Lcom/p1/mobile/putong/core/ui/messages/ItemPlatinumPinGuideMessage;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public f(Lcom/p1/mobile/android/app/Act;Ll/pol;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/data/Conversation;)V
    .locals 2

    .line 1
    instance-of p2, p1, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 2
    .line 3
    if-nez p2, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemPlatinumPinGuideMessage;->a:Landroid/widget/TextView;

    .line 7
    .line 8
    invoke-virtual {p3}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-eqz v0, :cond_1

    .line 13
    .line 14
    const-string v0, "\u5979"

    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_1
    const-string v0, "\u4ed6"

    .line 18
    .line 19
    :goto_0
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    const-string v1, "\u6210\u4e3a%s\u7684\u7f6e\u9876\u804a\u5929"

    .line 24
    .line 25
    invoke-static {v1, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 30
    .line 31
    .line 32
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemPlatinumPinGuideMessage;->c:Landroid/widget/TextView;

    .line 33
    .line 34
    new-instance v0, Ll/deq;

    .line 35
    .line 36
    invoke-direct {v0, p1, p3}, Ll/deq;-><init>(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;)V

    .line 37
    .line 38
    .line 39
    invoke-static {p2, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 40
    .line 41
    .line 42
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemPlatinumPinGuideMessage;->d:Landroid/widget/ImageView;

    .line 43
    .line 44
    new-instance p2, Ll/eeq;

    .line 45
    .line 46
    invoke-direct {p2, p1, p4}, Ll/eeq;-><init>(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/Conversation;)V

    .line 47
    .line 48
    .line 49
    invoke-static {p0, p2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 50
    .line 51
    .line 52
    return-void
.end method

.method public onFinishInflate()V
    .locals 3

    return-void

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemPlatinumPinGuideMessage;->e(Landroid/view/View;)V

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
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemPlatinumPinGuideMessage;->a:Landroid/widget/TextView;

    .line 22
    .line 23
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    sget v2, Ll/g9c0;->g:I

    .line 28
    .line 29
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 34
    .line 35
    .line 36
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemPlatinumPinGuideMessage;->b:Landroid/widget/TextView;

    .line 37
    .line 38
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    sget v1, Ll/g9c0;->i:I

    .line 43
    .line 44
    invoke-virtual {p0, v1}, Landroid/content/res/Resources;->getColor(I)I

    .line 45
    .line 46
    .line 47
    move-result p0

    .line 48
    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 49
    .line 50
    .line 51
    :cond_0
    return-void
.end method

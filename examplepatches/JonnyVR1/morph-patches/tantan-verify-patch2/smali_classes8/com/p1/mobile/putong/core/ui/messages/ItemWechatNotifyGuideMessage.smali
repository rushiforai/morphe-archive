.class public Lcom/p1/mobile/putong/core/ui/messages/ItemWechatNotifyGuideMessage;
.super Landroid/widget/LinearLayout;
.source "SourceFile"


# instance fields
.field public a:Landroid/widget/TextView;

.field public b:Landroid/widget/TextView;

.field public c:Landroid/widget/TextView;


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

.method public static synthetic a(Lcom/p1/mobile/android/app/Act;Landroid/view/View;)V
    .locals 1

    .line 1
    const-string p1, "e_open_wechat_notification"

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->pageId()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-static {p1, p0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 11
    .line 12
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 13
    .line 14
    iget-object p0, p0, Ll/dkb;->K1:Lrx/subjects/a;

    .line 15
    .line 16
    invoke-virtual {p0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    check-cast p0, Lcom/google/common/base/Optional;

    .line 21
    .line 22
    if-eqz p0, :cond_0

    .line 23
    .line 24
    invoke-virtual {p0}, Lcom/google/common/base/Optional;->isPresent()Z

    .line 25
    .line 26
    .line 27
    move-result p1

    .line 28
    if-eqz p1, :cond_0

    .line 29
    .line 30
    invoke-virtual {p0}, Lcom/google/common/base/Optional;->get()Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    check-cast p0, Lcom/p1/mobile/putong/core/data/WechatNotifySetting;

    .line 35
    .line 36
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/WechatNotifySetting;->wechatLaunch:Lcom/p1/mobile/putong/core/data/WechatMicroProgramLaunchInfo;

    .line 37
    .line 38
    if-eqz p0, :cond_0

    .line 39
    .line 40
    sget-object p1, Ll/c70;->INSTANCE:Ll/c70;

    .line 41
    .line 42
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/WechatMicroProgramLaunchInfo;->userName:Ljava/lang/String;

    .line 43
    .line 44
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/WechatMicroProgramLaunchInfo;->path:Ljava/lang/String;

    .line 45
    .line 46
    invoke-virtual {p1, v0, p0}, Ll/c70;->a(Ljava/lang/String;Ljava/lang/String;)Z

    .line 47
    .line 48
    .line 49
    :cond_0
    return-void
.end method


# virtual methods
.method public final b(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/zjq;->a(Lcom/p1/mobile/putong/core/ui/messages/ItemWechatNotifyGuideMessage;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public c(Lcom/p1/mobile/android/app/Act;Ll/pol;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/data/Conversation;)V
    .locals 0

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
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemWechatNotifyGuideMessage;->b:Landroid/widget/TextView;

    .line 7
    .line 8
    invoke-virtual {p3}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 9
    .line 10
    .line 11
    move-result p3

    .line 12
    if-eqz p3, :cond_1

    .line 13
    .line 14
    const-string p3, "\u5979"

    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_1
    const-string p3, "\u4ed6"

    .line 18
    .line 19
    :goto_0
    filled-new-array {p3}, [Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object p3

    .line 23
    const-string p4, "\u4e0d\u9519\u8fc7%s\u56de\u590d\u7684\u6d88\u606f"

    .line 24
    .line 25
    invoke-static {p4, p3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object p3

    .line 29
    invoke-virtual {p2, p3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 30
    .line 31
    .line 32
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemWechatNotifyGuideMessage;->c:Landroid/widget/TextView;

    .line 33
    .line 34
    new-instance p2, Ll/yjq;

    .line 35
    .line 36
    invoke-direct {p2, p1}, Ll/yjq;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 37
    .line 38
    .line 39
    invoke-static {p0, p2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 40
    .line 41
    .line 42
    return-void
.end method

.method public onFinishInflate()V
    .locals 3

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemWechatNotifyGuideMessage;->b(Landroid/view/View;)V

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
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemWechatNotifyGuideMessage;->a:Landroid/widget/TextView;

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
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemWechatNotifyGuideMessage;->b:Landroid/widget/TextView;

    .line 37
    .line 38
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    sget v2, Ll/g9c0;->i:I

    .line 43
    .line 44
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    .line 45
    .line 46
    .line 47
    move-result v1

    .line 48
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 49
    .line 50
    .line 51
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemWechatNotifyGuideMessage;->c:Landroid/widget/TextView;

    .line 52
    .line 53
    sget v0, Ll/ibc0;->t:I

    .line 54
    .line 55
    invoke-virtual {p0, v0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 56
    .line 57
    .line 58
    :cond_0
    return-void
.end method

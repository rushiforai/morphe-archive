.class public Lcom/p1/mobile/putong/core/ui/messages/ItemMessageFakeLockItem;
.super Lv/VFrame;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/putong/core/ui/messages/a;


# instance fields
.field public a:Lcom/p1/mobile/putong/core/ui/messages/ItemText;

.field public b:Lv/VImage;

.field public c:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lv/VFrame;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 5
    invoke-direct {p0, p1, p2}, Lv/VFrame;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 6
    invoke-direct {p0, p1, p2, p3}, Lv/VFrame;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method private getAct()Lcom/p1/mobile/android/app/Act;
    .locals 0

    .line 1
    invoke-static {p0}, Ll/bnl0;->E(Landroid/view/View;)Landroid/app/Activity;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    return-object p0
.end method

.method private getSafeSourceFrom()Ljava/lang/String;
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageFakeLockItem;->getAct()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    instance-of v0, v0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 6
    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageFakeLockItem;->getAct()Lcom/p1/mobile/android/app/Act;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 14
    .line 15
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->f:Ll/clz;

    .line 16
    .line 17
    invoke-virtual {p0}, Ll/clz;->j3()Lcom/p1/mobile/putong/core/data/Conversation;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-eqz v0, :cond_1

    .line 26
    .line 27
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/Conversation;->isFakeHeartbeatConv()Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-eqz v0, :cond_0

    .line 32
    .line 33
    const-string p0, "love_signal"

    .line 34
    .line 35
    return-object p0

    .line 36
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/Conversation;->isFakeQuickChatConv()Z

    .line 37
    .line 38
    .line 39
    move-result p0

    .line 40
    if-eqz p0, :cond_1

    .line 41
    .line 42
    const-string p0, "quickchat"

    .line 43
    .line 44
    return-object p0

    .line 45
    :cond_1
    const-string p0, ""

    .line 46
    .line 47
    return-object p0
.end method

.method public static synthetic p(Lcom/p1/mobile/putong/core/ui/messages/ItemMessageFakeLockItem;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageFakeLockItem;->u(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic s(Lcom/p1/mobile/putong/core/ui/messages/ItemMessageFakeLockItem;Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageFakeLockItem;->v(Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/data/User;)V

    return-void
.end method

.method private synthetic u(Landroid/view/View;)V
    .locals 2

    .line 1
    const-string p1, "source_from"

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageFakeLockItem;->getSafeSourceFrom()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {p1, v0}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    filled-new-array {p1}, [Ll/sfj0$a;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    const-string v0, "e_im_fake_to_good"

    .line 16
    .line 17
    const-string v1, "p_chat_view"

    .line 18
    .line 19
    invoke-static {v0, v1, p1}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 20
    .line 21
    .line 22
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    invoke-virtual {p1}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageFakeLockItem;->getAct()Lcom/p1/mobile/android/app/Act;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    invoke-interface {p1, p0}, Ll/r97;->D1(Lcom/p1/mobile/android/app/Act;)V

    .line 35
    .line 36
    .line 37
    return-void
.end method


# virtual methods
.method public A(Lcom/p1/mobile/putong/core/data/Message;)V
    .locals 0

    .line 1
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

.method public U(Ll/pol;Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/core/ui/messages/a$a;)V
    .locals 1

    .line 1
    const/4 p3, 0x0

    .line 2
    invoke-static {p0, p3}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 3
    .line 4
    .line 5
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageFakeLockItem;->getAct()Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    .line 8
    move-result-object p3

    .line 9
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 10
    .line 11
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 12
    .line 13
    invoke-virtual {v0}, Ll/dkb;->o9()Lrx/c;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-interface {p1, p3, v0}, Ll/pol;->c(Ll/ner;Lrx/c;)Lrx/c;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    new-instance p3, Ll/o9q;

    .line 22
    .line 23
    invoke-direct {p3, p0, p2}, Ll/o9q;-><init>(Lcom/p1/mobile/putong/core/ui/messages/ItemMessageFakeLockItem;Lcom/p1/mobile/putong/core/data/Message;)V

    .line 24
    .line 25
    .line 26
    invoke-static {p3}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 31
    .line 32
    .line 33
    return-void
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
    sget v0, Ll/edc0;->Y1:I

    .line 5
    .line 6
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    check-cast v0, Lcom/p1/mobile/putong/core/ui/messages/ItemText;

    .line 11
    .line 12
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageFakeLockItem;->a:Lcom/p1/mobile/putong/core/ui/messages/ItemText;

    .line 13
    .line 14
    sget v0, Ll/edc0;->X1:I

    .line 15
    .line 16
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    check-cast v0, Lv/VImage;

    .line 21
    .line 22
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageFakeLockItem;->b:Lv/VImage;

    .line 23
    .line 24
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageFakeLockItem;->a:Lcom/p1/mobile/putong/core/ui/messages/ItemText;

    .line 25
    .line 26
    invoke-virtual {v0}, Landroid/widget/TextView;->getCurrentTextColor()I

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageFakeLockItem;->c:I

    .line 31
    .line 32
    return-void
.end method

.method public final synthetic v(Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/data/User;)V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-static {p0, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 3
    .line 4
    .line 5
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageFakeLockItem;->b:Lv/VImage;

    .line 6
    .line 7
    const/4 v1, 0x1

    .line 8
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/User;->isRiskAuditAvatar()Z

    .line 12
    .line 13
    .line 14
    move-result p2

    .line 15
    const v0, -0x181e3

    .line 16
    .line 17
    .line 18
    if-eqz p2, :cond_0

    .line 19
    .line 20
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageFakeLockItem;->a:Lcom/p1/mobile/putong/core/ui/messages/ItemText;

    .line 21
    .line 22
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 23
    .line 24
    .line 25
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageFakeLockItem;->a:Lcom/p1/mobile/putong/core/ui/messages/ItemText;

    .line 26
    .line 27
    const-string p1, "\u8d44\u6599\u5ba1\u6838\u4e2d"

    .line 28
    .line 29
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 30
    .line 31
    .line 32
    return-void

    .line 33
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 34
    .line 35
    .line 36
    move-result-object p2

    .line 37
    invoke-virtual {p2}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 38
    .line 39
    .line 40
    move-result-object p2

    .line 41
    invoke-interface {p2}, Ll/r97;->S0()Z

    .line 42
    .line 43
    .line 44
    move-result p2

    .line 45
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageFakeLockItem;->a:Lcom/p1/mobile/putong/core/ui/messages/ItemText;

    .line 46
    .line 47
    if-eqz p2, :cond_1

    .line 48
    .line 49
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 50
    .line 51
    .line 52
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageFakeLockItem;->a:Lcom/p1/mobile/putong/core/ui/messages/ItemText;

    .line 53
    .line 54
    const-string p2, "\u70b9\u51fb\u4e0a\u4f20\u5934\u50cf\u540e\u89e3\u9501"

    .line 55
    .line 56
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 57
    .line 58
    .line 59
    new-instance p1, Ll/p9q;

    .line 60
    .line 61
    invoke-direct {p1, p0}, Ll/p9q;-><init>(Lcom/p1/mobile/putong/core/ui/messages/ItemMessageFakeLockItem;)V

    .line 62
    .line 63
    .line 64
    invoke-static {p0, p1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 65
    .line 66
    .line 67
    return-void

    .line 68
    :cond_1
    iget p2, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageFakeLockItem;->c:I

    .line 69
    .line 70
    invoke-virtual {v1, p2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 71
    .line 72
    .line 73
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageFakeLockItem;->a:Lcom/p1/mobile/putong/core/ui/messages/ItemText;

    .line 74
    .line 75
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/Message;->value:Ljava/lang/String;

    .line 76
    .line 77
    invoke-virtual {p2, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 78
    .line 79
    .line 80
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageFakeLockItem;->b:Lv/VImage;

    .line 81
    .line 82
    const/4 p1, 0x0

    .line 83
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 84
    .line 85
    .line 86
    return-void
.end method

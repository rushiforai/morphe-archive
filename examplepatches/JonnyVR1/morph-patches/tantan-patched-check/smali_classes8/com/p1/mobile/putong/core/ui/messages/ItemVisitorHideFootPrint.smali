.class public Lcom/p1/mobile/putong/core/ui/messages/ItemVisitorHideFootPrint;
.super Landroid/widget/LinearLayout;
.source "SourceFile"


# instance fields
.field public a:Landroid/widget/TextView;

.field public b:Landroid/widget/TextView;

.field public c:Landroid/widget/TextView;

.field public d:Landroid/widget/ImageView;

.field public e:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x1

    .line 5
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemVisitorHideFootPrint;->e:Z

    .line 6
    .line 7
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 8
    invoke-direct {p0, p1, p2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 p1, 0x1

    .line 9
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemVisitorHideFootPrint;->e:Z

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 10
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p1, 0x1

    .line 11
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemVisitorHideFootPrint;->e:Z

    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/Conversation;Landroid/view/View;)V
    .locals 4

    .line 1
    check-cast p0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->f:Ll/clz;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/clz;->I6()V

    .line 6
    .line 7
    .line 8
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-virtual {p0}, Ll/j49;->e()Lcom/p1/mobile/putong/core/biz/service/CoreMemberInnerService;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-interface {p0}, Lcom/p1/mobile/putong/core/biz/service/CoreMemberInnerService;->Se()I

    .line 17
    .line 18
    .line 19
    move-result p0

    .line 20
    sget-object p2, Lcom/p1/mobile/putong/core/newui/messages/util/ConversationCounterTypeSp;->oDiamondVisitorHideFootPrintShowCount:Lcom/p1/mobile/putong/core/newui/messages/util/ConversationCounterTypeSp;

    .line 21
    .line 22
    iget-object v0, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 23
    .line 24
    invoke-virtual {p2, v0, p0}, Lcom/p1/mobile/putong/core/newui/messages/util/ConversationCounterTypeSp;->set(Ljava/lang/String;I)V

    .line 25
    .line 26
    .line 27
    sget-object p0, Lcom/p1/mobile/putong/core/newui/messages/util/ConversationCounterTypeSp;->oDiamondVisitorHideFootPrintLastCloseMills:Lcom/p1/mobile/putong/core/newui/messages/util/ConversationCounterTypeSp;

    .line 28
    .line 29
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 30
    .line 31
    invoke-static {}, Ll/pzi0;->o()J

    .line 32
    .line 33
    .line 34
    move-result-wide v0

    .line 35
    const-wide/16 v2, 0x3e8

    .line 36
    .line 37
    div-long/2addr v0, v2

    .line 38
    long-to-int p2, v0

    .line 39
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/newui/messages/util/ConversationCounterTypeSp;->set(Ljava/lang/String;I)V

    .line 40
    .line 41
    .line 42
    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/core/ui/messages/ItemVisitorHideFootPrint;Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/data/User;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/p1/mobile/putong/core/ui/messages/ItemVisitorHideFootPrint;->i(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/data/User;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/data/User;Ll/pf60;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p1, p1, Ll/pf60;->a:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast p1, Ljava/lang/CharSequence;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 6
    .line 7
    invoke-static {p1, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public static synthetic d(Lcom/p1/mobile/putong/core/ui/messages/ItemVisitorHideFootPrint;Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/data/User;Ll/pf60;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/ui/messages/ItemVisitorHideFootPrint;->g(Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/data/User;Ll/pf60;)V

    return-void
.end method

.method public static synthetic e(Lcom/p1/mobile/putong/core/ui/messages/ItemVisitorHideFootPrint;Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/data/User;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/ui/messages/ItemVisitorHideFootPrint;->h(Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/data/User;Ljava/lang/Boolean;)V

    return-void
.end method


# virtual methods
.method public final f(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/sjq;->a(Lcom/p1/mobile/putong/core/ui/messages/ItemVisitorHideFootPrint;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic g(Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/data/User;Ll/pf60;)V
    .locals 0

    .line 1
    iget-object p3, p3, Ll/pf60;->b:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast p3, Ljava/lang/Boolean;

    .line 4
    .line 5
    invoke-virtual {p3}, Ljava/lang/Boolean;->booleanValue()Z

    .line 6
    .line 7
    .line 8
    move-result p3

    .line 9
    iput-boolean p3, p1, Lcom/p1/mobile/putong/core/data/Message;->localMyVisitorHidden:Z

    .line 10
    .line 11
    invoke-virtual {p0, p3, p2, p1}, Lcom/p1/mobile/putong/core/ui/messages/ItemVisitorHideFootPrint;->k(ZLcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/data/Message;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public final synthetic h(Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/data/User;Ljava/lang/Boolean;)V
    .locals 1

    .line 1
    invoke-virtual {p3}, Ljava/lang/Boolean;->booleanValue()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iput-boolean v0, p1, Lcom/p1/mobile/putong/core/data/Message;->localMyVisitorHidden:Z

    .line 6
    .line 7
    invoke-virtual {p3}, Ljava/lang/Boolean;->booleanValue()Z

    .line 8
    .line 9
    .line 10
    move-result p3

    .line 11
    invoke-virtual {p0, p3, p2, p1}, Lcom/p1/mobile/putong/core/ui/messages/ItemVisitorHideFootPrint;->k(ZLcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/data/Message;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public final synthetic i(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/data/User;Landroid/view/View;)V
    .locals 6

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->pageId()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p4

    .line 5
    iget-boolean v0, p2, Lcom/p1/mobile/putong/core/data/Message;->localMyVisitorHidden:Z

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    const-string v0, "open"

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    const-string v0, "close"

    .line 13
    .line 14
    :goto_0
    const-string v1, "button_type"

    .line 15
    .line 16
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    filled-new-array {v0}, [Ll/pf60;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    const-string v1, "e_hide_records_chat"

    .line 25
    .line 26
    invoke-static {v1, p4, v0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 27
    .line 28
    .line 29
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 30
    .line 31
    .line 32
    move-result-object p4

    .line 33
    invoke-virtual {p4}, Ll/j49;->e()Lcom/p1/mobile/putong/core/biz/service/CoreMemberInnerService;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    iget-boolean p4, p2, Lcom/p1/mobile/putong/core/data/Message;->localMyVisitorHidden:Z

    .line 38
    .line 39
    xor-int/lit8 v3, p4, 0x1

    .line 40
    .line 41
    new-instance v4, Ll/rjq;

    .line 42
    .line 43
    invoke-direct {v4, p0, p2, p3}, Ll/rjq;-><init>(Lcom/p1/mobile/putong/core/ui/messages/ItemVisitorHideFootPrint;Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/data/User;)V

    .line 44
    .line 45
    .line 46
    const-string v5, "p_chat,hide_records"

    .line 47
    .line 48
    move-object v1, p1

    .line 49
    move-object v2, p3

    .line 50
    invoke-interface/range {v0 .. v5}, Lcom/p1/mobile/putong/core/biz/service/CoreMemberInnerService;->vr(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;ZLl/y20;Ljava/lang/String;)V

    .line 51
    .line 52
    .line 53
    return-void
.end method

.method public j(Lcom/p1/mobile/android/app/Act;Ll/g900;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/data/Conversation;Lcom/p1/mobile/putong/core/data/Message;)V
    .locals 4

    .line 1
    instance-of v0, p1, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemVisitorHideFootPrint;->e:Z

    .line 7
    .line 8
    const/4 v1, 0x0

    .line 9
    if-eqz v0, :cond_2

    .line 10
    .line 11
    iput-boolean v1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemVisitorHideFootPrint;->e:Z

    .line 12
    .line 13
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->pageId()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    iget-boolean v2, p5, Lcom/p1/mobile/putong/core/data/Message;->localMyVisitorHidden:Z

    .line 18
    .line 19
    if-eqz v2, :cond_1

    .line 20
    .line 21
    const-string v2, "open"

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_1
    const-string v2, "close"

    .line 25
    .line 26
    :goto_0
    const-string v3, "button_type"

    .line 27
    .line 28
    invoke-static {v3, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 29
    .line 30
    .line 31
    move-result-object v2

    .line 32
    filled-new-array {v2}, [Ll/pf60;

    .line 33
    .line 34
    .line 35
    move-result-object v2

    .line 36
    const-string v3, "e_hide_records_chat"

    .line 37
    .line 38
    invoke-static {v3, v0, v2}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 39
    .line 40
    .line 41
    :cond_2
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 42
    .line 43
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->n2:Ll/enb;

    .line 44
    .line 45
    invoke-virtual {v0}, Ll/enb;->c4()Lrx/c;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    invoke-virtual {p2, p1, v0, v1}, Ll/l900;->g(Ll/ner;Lrx/c;Z)Lrx/c;

    .line 50
    .line 51
    .line 52
    move-result-object p2

    .line 53
    new-instance v0, Ll/njq;

    .line 54
    .line 55
    invoke-direct {v0, p3}, Ll/njq;-><init>(Lcom/p1/mobile/putong/data/User;)V

    .line 56
    .line 57
    .line 58
    invoke-virtual {p2, v0}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 59
    .line 60
    .line 61
    move-result-object p2

    .line 62
    invoke-virtual {p2}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 63
    .line 64
    .line 65
    move-result-object p2

    .line 66
    new-instance v0, Ll/ojq;

    .line 67
    .line 68
    invoke-direct {v0, p0, p5, p3}, Ll/ojq;-><init>(Lcom/p1/mobile/putong/core/ui/messages/ItemVisitorHideFootPrint;Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/data/User;)V

    .line 69
    .line 70
    .line 71
    invoke-static {v0}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    invoke-virtual {p2, v0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 76
    .line 77
    .line 78
    iget-boolean p2, p5, Lcom/p1/mobile/putong/core/data/Message;->localMyVisitorHidden:Z

    .line 79
    .line 80
    invoke-virtual {p0, p2, p3, p5}, Lcom/p1/mobile/putong/core/ui/messages/ItemVisitorHideFootPrint;->k(ZLcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/data/Message;)V

    .line 81
    .line 82
    .line 83
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemVisitorHideFootPrint;->c:Landroid/widget/TextView;

    .line 84
    .line 85
    new-instance v0, Ll/pjq;

    .line 86
    .line 87
    invoke-direct {v0, p0, p1, p5, p3}, Ll/pjq;-><init>(Lcom/p1/mobile/putong/core/ui/messages/ItemVisitorHideFootPrint;Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/data/User;)V

    .line 88
    .line 89
    .line 90
    invoke-static {p2, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 91
    .line 92
    .line 93
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemVisitorHideFootPrint;->d:Landroid/widget/ImageView;

    .line 94
    .line 95
    new-instance p2, Ll/qjq;

    .line 96
    .line 97
    invoke-direct {p2, p1, p4}, Ll/qjq;-><init>(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/Conversation;)V

    .line 98
    .line 99
    .line 100
    invoke-static {p0, p2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 101
    .line 102
    .line 103
    return-void
.end method

.method public final k(ZLcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/data/Message;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemVisitorHideFootPrint;->a:Landroid/widget/TextView;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    const-string p1, "\u5df2\u9690\u85cf\u8bbf\u95ee\u8db3\u8ff9"

    .line 6
    .line 7
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 8
    .line 9
    .line 10
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemVisitorHideFootPrint;->b:Landroid/widget/TextView;

    .line 11
    .line 12
    const-string p2, "\u662f\u5426\u6062\u590d\u8bbf\u95ee\u8db3\u8ff9\uff1f"

    .line 13
    .line 14
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 15
    .line 16
    .line 17
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemVisitorHideFootPrint;->c:Landroid/widget/TextView;

    .line 18
    .line 19
    const-string p1, "\u6062\u590d\u8db3\u8ff9"

    .line 20
    .line 21
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 22
    .line 23
    .line 24
    return-void

    .line 25
    :cond_0
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 26
    .line 27
    .line 28
    move-result p1

    .line 29
    if-eqz p1, :cond_1

    .line 30
    .line 31
    const-string p1, "\u5979"

    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_1
    const-string p1, "\u4ed6"

    .line 35
    .line 36
    :goto_0
    iget p2, p3, Lcom/p1/mobile/putong/core/data/Message;->localMyVisitorCount:I

    .line 37
    .line 38
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 39
    .line 40
    .line 41
    move-result-object p2

    .line 42
    filled-new-array {p1, p2}, [Ljava/lang/Object;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    const-string p2, "\u8fd1\u671f\u4f60\u8bbf\u95ee\u8fc7%1$s%2$s\u6b21"

    .line 47
    .line 48
    invoke-static {p2, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 53
    .line 54
    .line 55
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemVisitorHideFootPrint;->b:Landroid/widget/TextView;

    .line 56
    .line 57
    const-string p2, "\u662f\u5426\u9690\u85cf\u8bbf\u95ee\u8db3\u8ff9\uff1f"

    .line 58
    .line 59
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 60
    .line 61
    .line 62
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemVisitorHideFootPrint;->c:Landroid/widget/TextView;

    .line 63
    .line 64
    const-string p1, "\u9690\u85cf\u8db3\u8ff9"

    .line 65
    .line 66
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 67
    .line 68
    .line 69
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemVisitorHideFootPrint;->f(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

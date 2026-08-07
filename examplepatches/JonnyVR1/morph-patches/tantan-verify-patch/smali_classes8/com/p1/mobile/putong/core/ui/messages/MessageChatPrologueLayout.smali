.class public Lcom/p1/mobile/putong/core/ui/messages/MessageChatPrologueLayout;
.super Lv/VLinear;
.source "SourceFile"


# instance fields
.field public c:Lcom/p1/mobile/putong/core/ui/VText_Medium;

.field public d:Lv/VImage;

.field public e:Lcom/p1/mobile/putong/core/ui/VText_Medium;

.field public f:Lv/VImage;

.field public g:Lv/VLinear;

.field public h:Ll/jxd0;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 2

    .line 1
    invoke-direct {p0, p1}, Lv/VLinear;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Ll/jxd0;

    .line 5
    .line 6
    new-instance v0, Ljava/lang/StringBuilder;

    .line 7
    .line 8
    const-string v1, "PrologueLayoutAutoSelect"

    .line 9
    .line 10
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-interface {v1}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 29
    .line 30
    invoke-direct {p1, v0, v1}, Ll/jxd0;-><init>(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 31
    .line 32
    .line 33
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/MessageChatPrologueLayout;->h:Ll/jxd0;

    .line 34
    .line 35
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    .line 36
    invoke-direct {p0, p1, p2}, Lv/VLinear;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 37
    new-instance p1, Ll/jxd0;

    new-instance p2, Ljava/lang/StringBuilder;

    const-string v0, "PrologueLayoutAutoSelect"

    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 38
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    move-result-object v0

    invoke-interface {v0}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-direct {p1, p2, v0}, Ll/jxd0;-><init>(Ljava/lang/String;Ljava/lang/Boolean;)V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/MessageChatPrologueLayout;->h:Ll/jxd0;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 39
    invoke-direct {p0, p1, p2, p3}, Lv/VLinear;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 40
    new-instance p1, Ll/jxd0;

    new-instance p2, Ljava/lang/StringBuilder;

    const-string p3, "PrologueLayoutAutoSelect"

    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 41
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    move-result-object p3

    invoke-interface {p3}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    sget-object p3, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-direct {p1, p2, p3}, Ll/jxd0;-><init>(Ljava/lang/String;Ljava/lang/Boolean;)V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/MessageChatPrologueLayout;->h:Ll/jxd0;

    return-void
.end method

.method public static synthetic P(Lcom/p1/mobile/putong/core/ui/messages/MessageChatPrologueLayout;Ljava/lang/String;Ll/yxz;Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;Ljava/util/List;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual/range {p0 .. p5}, Lcom/p1/mobile/putong/core/ui/messages/MessageChatPrologueLayout;->Y(Ljava/lang/String;Ll/yxz;Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;Ljava/util/List;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic Q(Lcom/p1/mobile/putong/core/ui/messages/MessageChatPrologueLayout;Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;Ljava/lang/String;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/ui/messages/MessageChatPrologueLayout;->X(Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;Ljava/lang/String;Ljava/util/List;)V

    return-void
.end method

.method public static synthetic R(Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->f:Ll/clz;

    .line 2
    .line 3
    check-cast p0, Ll/tvz;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/tvz;->Dg()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic S(Lcom/p1/mobile/putong/core/ui/messages/MessageChatPrologueLayout;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/MessageChatPrologueLayout;->Z(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic T(Lcom/p1/mobile/putong/core/ui/messages/MessageChatPrologueLayout;Ljava/lang/String;Ll/yxz;Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/p1/mobile/putong/core/ui/messages/MessageChatPrologueLayout;->W(Ljava/lang/String;Ll/yxz;Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;Landroid/view/View;)V

    return-void
.end method

.method private synthetic Z(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/MessageChatPrologueLayout;->g:Lv/VLinear;

    .line 2
    .line 3
    invoke-static {p1}, Ll/bsj0;->T(Landroid/view/ViewGroup;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/MessageChatPrologueLayout;->h:Ll/jxd0;

    .line 8
    .line 9
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    invoke-virtual {p0, p1}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    return-void
.end method


# virtual methods
.method public final V(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/w4z;->a(Lcom/p1/mobile/putong/core/ui/messages/MessageChatPrologueLayout;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic W(Ljava/lang/String;Ll/yxz;Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/MessageChatPrologueLayout;->b0(Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    new-instance p0, Ll/u4z;

    .line 5
    .line 6
    invoke-direct {p0, p3}, Ll/u4z;-><init>(Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;)V

    .line 7
    .line 8
    .line 9
    const/4 p1, 0x1

    .line 10
    invoke-virtual {p2, p1, p0}, Ll/yxz;->Q1(ZLjava/lang/Runnable;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p3}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->pageId()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    const-string p1, "shortcut_type"

    .line 18
    .line 19
    const-string p2, "prologue"

    .line 20
    .line 21
    invoke-static {p1, p2}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    filled-new-array {p1}, [Ll/pf60;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    const-string p2, "e_close_click"

    .line 30
    .line 31
    invoke-static {p2, p0, p1}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public final synthetic X(Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;Ljava/lang/String;Ljava/util/List;)V
    .locals 6

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    iget-object v1, p1, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->f:Ll/clz;

    .line 6
    .line 7
    iget-object v1, v1, Ll/clz;->c:Ljava/lang/String;

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Ll/dkb;->oa(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/MessageChatPrologueLayout;->g:Lv/VLinear;

    .line 14
    .line 15
    invoke-static {p0}, Ll/bsj0;->u(Landroid/view/ViewGroup;)Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->pageId()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    const-string v2, "opening_guidance_showtime"

    .line 24
    .line 25
    invoke-static {v2, p2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 26
    .line 27
    .line 28
    move-result-object p2

    .line 29
    const/4 v2, 0x0

    .line 30
    invoke-interface {p3, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    move-result-object v3

    .line 34
    check-cast v3, Lcom/p1/mobile/putong/core/data/Prologue;

    .line 35
    .line 36
    iget-object v3, v3, Lcom/p1/mobile/putong/core/data/Prologue;->value:Ljava/lang/String;

    .line 37
    .line 38
    const-string v4, "opening_content"

    .line 39
    .line 40
    invoke-static {v4, v3}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 41
    .line 42
    .line 43
    move-result-object v3

    .line 44
    const-string v4, "opening_is_saved"

    .line 45
    .line 46
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 47
    .line 48
    .line 49
    move-result-object v5

    .line 50
    invoke-static {v4, v5}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 51
    .line 52
    .line 53
    move-result-object v4

    .line 54
    filled-new-array {p2, v3, v4}, [Ll/pf60;

    .line 55
    .line 56
    .line 57
    move-result-object p2

    .line 58
    const-string v3, "e_send_opening_guidance"

    .line 59
    .line 60
    invoke-static {v3, v1, p2}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 61
    .line 62
    .line 63
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 64
    .line 65
    .line 66
    move-result p2

    .line 67
    if-eqz p2, :cond_0

    .line 68
    .line 69
    invoke-static {}, Lcom/p1/mobile/putong/core/data/Message;->new_()Lcom/p1/mobile/putong/core/data/Message;

    .line 70
    .line 71
    .line 72
    move-result-object p2

    .line 73
    const-string v0, "prologue"

    .line 74
    .line 75
    invoke-static {v0}, Lcom/p1/mobile/putong/core/data/MessageType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/MessageType;

    .line 76
    .line 77
    .line 78
    move-result-object v0

    .line 79
    iput-object v0, p2, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 80
    .line 81
    invoke-interface {p3, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 82
    .line 83
    .line 84
    move-result-object v0

    .line 85
    check-cast v0, Lcom/p1/mobile/putong/core/data/Prologue;

    .line 86
    .line 87
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/Prologue;->value:Ljava/lang/String;

    .line 88
    .line 89
    iput-object v0, p2, Lcom/p1/mobile/putong/core/data/Message;->value:Ljava/lang/String;

    .line 90
    .line 91
    invoke-static {}, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->new_()Lcom/p1/mobile/putong/core/data/MessageAdditionalData;

    .line 92
    .line 93
    .line 94
    move-result-object v0

    .line 95
    iput-object v0, p2, Lcom/p1/mobile/putong/core/data/Message;->additionalData:Lcom/p1/mobile/putong/core/data/MessageAdditionalData;

    .line 96
    .line 97
    invoke-static {}, Lcom/p1/mobile/putong/core/data/PrologueMessageAdditional;->new_()Lcom/p1/mobile/putong/core/data/PrologueMessageAdditional;

    .line 98
    .line 99
    .line 100
    move-result-object v1

    .line 101
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->prologue:Lcom/p1/mobile/putong/core/data/PrologueMessageAdditional;

    .line 102
    .line 103
    iget-object v0, p2, Lcom/p1/mobile/putong/core/data/Message;->additionalData:Lcom/p1/mobile/putong/core/data/MessageAdditionalData;

    .line 104
    .line 105
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->prologue:Lcom/p1/mobile/putong/core/data/PrologueMessageAdditional;

    .line 106
    .line 107
    iput-boolean p0, v0, Lcom/p1/mobile/putong/core/data/PrologueMessageAdditional;->autoSend:Z

    .line 108
    .line 109
    invoke-interface {p3, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 110
    .line 111
    .line 112
    move-result-object p0

    .line 113
    check-cast p0, Lcom/p1/mobile/putong/core/data/Prologue;

    .line 114
    .line 115
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Prologue;->category:Ljava/lang/String;

    .line 116
    .line 117
    iput-object p0, v0, Lcom/p1/mobile/putong/core/data/PrologueMessageAdditional;->category:Ljava/lang/String;

    .line 118
    .line 119
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 120
    .line 121
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 122
    .line 123
    iget-object p3, p1, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->f:Ll/clz;

    .line 124
    .line 125
    invoke-virtual {p3}, Ll/clz;->r3()Ljava/lang/String;

    .line 126
    .line 127
    .line 128
    move-result-object p3

    .line 129
    const/4 v0, 0x0

    .line 130
    invoke-virtual {p0, p3, p2, v0}, Lcom/p1/mobile/putong/core/api/g;->Dn(Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/core/data/Sticker;)Lrx/c;

    .line 131
    .line 132
    .line 133
    :cond_0
    iget-object p0, p1, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->f:Ll/clz;

    .line 134
    .line 135
    check-cast p0, Ll/tvz;

    .line 136
    .line 137
    invoke-virtual {p0}, Ll/tvz;->Dg()V

    .line 138
    .line 139
    .line 140
    return-void
.end method

.method public final synthetic Y(Ljava/lang/String;Ll/yxz;Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;Ljava/util/List;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/MessageChatPrologueLayout;->a0(Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    new-instance p5, Ll/v4z;

    .line 5
    .line 6
    invoke-direct {p5, p0, p3, p1, p4}, Ll/v4z;-><init>(Lcom/p1/mobile/putong/core/ui/messages/MessageChatPrologueLayout;Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;Ljava/lang/String;Ljava/util/List;)V

    .line 7
    .line 8
    .line 9
    const/4 p0, 0x1

    .line 10
    invoke-virtual {p2, p0, p5}, Ll/yxz;->Q1(ZLjava/lang/Runnable;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public final a0(Ljava/lang/String;)V
    .locals 0

    .line 1
    const-string p0, "sayhi"

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 12
    .line 13
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/g;->J1:Ll/vxd0;

    .line 14
    .line 15
    invoke-virtual {p0}, Ll/vxd0;->clear()Z

    .line 16
    .line 17
    .line 18
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 19
    .line 20
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 21
    .line 22
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/g;->I1:Ll/byd0;

    .line 23
    .line 24
    invoke-virtual {p0}, Ll/byd0;->clear()Z

    .line 25
    .line 26
    .line 27
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 28
    .line 29
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 30
    .line 31
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/g;->H1:Ll/vxd0;

    .line 32
    .line 33
    invoke-virtual {p0}, Ll/vxd0;->clear()Z

    .line 34
    .line 35
    .line 36
    return-void

    .line 37
    :cond_0
    const-string p0, "no_reply"

    .line 38
    .line 39
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 40
    .line 41
    .line 42
    move-result p0

    .line 43
    if-eqz p0, :cond_1

    .line 44
    .line 45
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 46
    .line 47
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 48
    .line 49
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/g;->N1:Ll/vxd0;

    .line 50
    .line 51
    invoke-virtual {p0}, Ll/vxd0;->clear()Z

    .line 52
    .line 53
    .line 54
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 55
    .line 56
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 57
    .line 58
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/g;->M1:Ll/byd0;

    .line 59
    .line 60
    invoke-virtual {p0}, Ll/byd0;->clear()Z

    .line 61
    .line 62
    .line 63
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 64
    .line 65
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 66
    .line 67
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/g;->L1:Ll/vxd0;

    .line 68
    .line 69
    invoke-virtual {p0}, Ll/vxd0;->clear()Z

    .line 70
    .line 71
    .line 72
    :cond_1
    return-void
.end method

.method public final b0(Ljava/lang/String;)V
    .locals 2

    .line 1
    const-string p0, "sayhi"

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 12
    .line 13
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/g;->K1:Ll/byd0;

    .line 14
    .line 15
    invoke-static {}, Ll/pzi0;->o()J

    .line 16
    .line 17
    .line 18
    move-result-wide v0

    .line 19
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    invoke-virtual {p0, p1}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    return-void

    .line 27
    :cond_0
    const-string p0, "no_reply"

    .line 28
    .line 29
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 30
    .line 31
    .line 32
    move-result p0

    .line 33
    if-eqz p0, :cond_1

    .line 34
    .line 35
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 36
    .line 37
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 38
    .line 39
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/g;->O1:Ll/byd0;

    .line 40
    .line 41
    invoke-static {}, Ll/pzi0;->o()J

    .line 42
    .line 43
    .line 44
    move-result-wide v0

    .line 45
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    invoke-virtual {p0, p1}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 50
    .line 51
    .line 52
    :cond_1
    return-void
.end method

.method public final c0(Ljava/lang/String;)V
    .locals 3

    .line 1
    const/4 p0, 0x1

    .line 2
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 3
    .line 4
    .line 5
    move-result-object v0

    .line 6
    const-string v1, "sayhi"

    .line 7
    .line 8
    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    if-eqz v1, :cond_1

    .line 13
    .line 14
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 15
    .line 16
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 17
    .line 18
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/g;->I1:Ll/byd0;

    .line 19
    .line 20
    invoke-virtual {p1}, Ll/azd0;->get()Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    check-cast p1, Ljava/lang/Long;

    .line 25
    .line 26
    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    .line 27
    .line 28
    .line 29
    move-result-wide v1

    .line 30
    invoke-static {v1, v2}, Ll/pzi0;->D(J)Z

    .line 31
    .line 32
    .line 33
    move-result p1

    .line 34
    if-nez p1, :cond_0

    .line 35
    .line 36
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 37
    .line 38
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 39
    .line 40
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/g;->J1:Ll/vxd0;

    .line 41
    .line 42
    invoke-virtual {p1, p0}, Ll/vxd0;->a(I)V

    .line 43
    .line 44
    .line 45
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 46
    .line 47
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 48
    .line 49
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/g;->I1:Ll/byd0;

    .line 50
    .line 51
    invoke-static {}, Ll/pzi0;->o()J

    .line 52
    .line 53
    .line 54
    move-result-wide v1

    .line 55
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 56
    .line 57
    .line 58
    move-result-object p1

    .line 59
    invoke-virtual {p0, p1}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 60
    .line 61
    .line 62
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 63
    .line 64
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 65
    .line 66
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/g;->H1:Ll/vxd0;

    .line 67
    .line 68
    invoke-virtual {p0, v0}, Ll/vxd0;->put(Ljava/lang/Object;)Z

    .line 69
    .line 70
    .line 71
    return-void

    .line 72
    :cond_0
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 73
    .line 74
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 75
    .line 76
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/g;->H1:Ll/vxd0;

    .line 77
    .line 78
    invoke-virtual {p1, p0}, Ll/vxd0;->a(I)V

    .line 79
    .line 80
    .line 81
    return-void

    .line 82
    :cond_1
    const-string v1, "no_reply"

    .line 83
    .line 84
    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 85
    .line 86
    .line 87
    move-result p1

    .line 88
    if-eqz p1, :cond_3

    .line 89
    .line 90
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 91
    .line 92
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 93
    .line 94
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/g;->M1:Ll/byd0;

    .line 95
    .line 96
    invoke-virtual {p1}, Ll/azd0;->get()Ljava/lang/Object;

    .line 97
    .line 98
    .line 99
    move-result-object p1

    .line 100
    check-cast p1, Ljava/lang/Long;

    .line 101
    .line 102
    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    .line 103
    .line 104
    .line 105
    move-result-wide v1

    .line 106
    invoke-static {v1, v2}, Ll/pzi0;->D(J)Z

    .line 107
    .line 108
    .line 109
    move-result p1

    .line 110
    if-nez p1, :cond_2

    .line 111
    .line 112
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 113
    .line 114
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 115
    .line 116
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/g;->N1:Ll/vxd0;

    .line 117
    .line 118
    invoke-virtual {p1, p0}, Ll/vxd0;->a(I)V

    .line 119
    .line 120
    .line 121
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 122
    .line 123
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 124
    .line 125
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/g;->M1:Ll/byd0;

    .line 126
    .line 127
    invoke-static {}, Ll/pzi0;->o()J

    .line 128
    .line 129
    .line 130
    move-result-wide v1

    .line 131
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 132
    .line 133
    .line 134
    move-result-object p1

    .line 135
    invoke-virtual {p0, p1}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 136
    .line 137
    .line 138
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 139
    .line 140
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 141
    .line 142
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/g;->L1:Ll/vxd0;

    .line 143
    .line 144
    invoke-virtual {p0, v0}, Ll/vxd0;->put(Ljava/lang/Object;)Z

    .line 145
    .line 146
    .line 147
    return-void

    .line 148
    :cond_2
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 149
    .line 150
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 151
    .line 152
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/g;->L1:Ll/vxd0;

    .line 153
    .line 154
    invoke-virtual {p1, p0}, Ll/vxd0;->a(I)V

    .line 155
    .line 156
    .line 157
    :cond_3
    return-void
.end method

.method public d0(Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;Ljava/util/List;Ll/yxz;Ljava/lang/String;)V
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/Prologue;",
            ">;",
            "Ll/yxz;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-virtual {p0, p4}, Lcom/p1/mobile/putong/core/ui/messages/MessageChatPrologueLayout;->c0(Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/MessageChatPrologueLayout;->d:Lv/VImage;

    .line 5
    .line 6
    new-instance v1, Ll/r4z;

    .line 7
    .line 8
    invoke-direct {v1, p0, p4, p3, p1}, Ll/r4z;-><init>(Lcom/p1/mobile/putong/core/ui/messages/MessageChatPrologueLayout;Ljava/lang/String;Ll/yxz;Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;)V

    .line 9
    .line 10
    .line 11
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/MessageChatPrologueLayout;->f:Lv/VImage;

    .line 15
    .line 16
    new-instance v1, Ll/s4z;

    .line 17
    .line 18
    move-object v2, p0

    .line 19
    move-object v5, p1

    .line 20
    move-object v6, p2

    .line 21
    move-object v4, p3

    .line 22
    move-object v3, p4

    .line 23
    invoke-direct/range {v1 .. v6}, Ll/s4z;-><init>(Lcom/p1/mobile/putong/core/ui/messages/MessageChatPrologueLayout;Ljava/lang/String;Ll/yxz;Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;Ljava/util/List;)V

    .line 24
    .line 25
    .line 26
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 27
    .line 28
    .line 29
    iget-object p0, v2, Lcom/p1/mobile/putong/core/ui/messages/MessageChatPrologueLayout;->g:Lv/VLinear;

    .line 30
    .line 31
    new-instance p1, Ll/t4z;

    .line 32
    .line 33
    invoke-direct {p1, v2}, Ll/t4z;-><init>(Lcom/p1/mobile/putong/core/ui/messages/MessageChatPrologueLayout;)V

    .line 34
    .line 35
    .line 36
    invoke-static {p0, p1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 37
    .line 38
    .line 39
    iget-object p0, v2, Lcom/p1/mobile/putong/core/ui/messages/MessageChatPrologueLayout;->g:Lv/VLinear;

    .line 40
    .line 41
    iget-object p1, v2, Lcom/p1/mobile/putong/core/ui/messages/MessageChatPrologueLayout;->h:Ll/jxd0;

    .line 42
    .line 43
    invoke-virtual {p1}, Ll/azd0;->get()Ljava/lang/Object;

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    check-cast p1, Ljava/lang/Boolean;

    .line 48
    .line 49
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 50
    .line 51
    .line 52
    move-result p1

    .line 53
    invoke-static {p0, p1}, Ll/bsj0;->t(Landroid/view/ViewGroup;Z)Z

    .line 54
    .line 55
    .line 56
    iget-object p0, v2, Lcom/p1/mobile/putong/core/ui/messages/MessageChatPrologueLayout;->e:Lcom/p1/mobile/putong/core/ui/VText_Medium;

    .line 57
    .line 58
    const/4 p1, 0x0

    .line 59
    invoke-interface {v6, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 60
    .line 61
    .line 62
    move-result-object p1

    .line 63
    check-cast p1, Lcom/p1/mobile/putong/core/data/Prologue;

    .line 64
    .line 65
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/Prologue;->value:Ljava/lang/String;

    .line 66
    .line 67
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 68
    .line 69
    .line 70
    const-string p0, "no_reply"

    .line 71
    .line 72
    invoke-virtual {p0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 73
    .line 74
    .line 75
    move-result p0

    .line 76
    iget-object p1, v2, Lcom/p1/mobile/putong/core/ui/messages/MessageChatPrologueLayout;->c:Lcom/p1/mobile/putong/core/ui/VText_Medium;

    .line 77
    .line 78
    if-eqz p0, :cond_0

    .line 79
    .line 80
    const-string p0, "\u771f\u8bda\u5730\u4ecb\u7ecd\u81ea\u5df1\uff0c\u66f4\u5bb9\u6613\u5f97\u5230\u56de\u590d"

    .line 81
    .line 82
    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 83
    .line 84
    .line 85
    return-void

    .line 86
    :cond_0
    const-string p0, "\u6839\u636e\u4f60\u7684\u8d44\u6599\uff0c\u4e3a\u4f60\u5b9a\u5236\u4e86\u5f00\u573a\u767d"

    .line 87
    .line 88
    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 89
    .line 90
    .line 91
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/ui/messages/MessageChatPrologueLayout;->V(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

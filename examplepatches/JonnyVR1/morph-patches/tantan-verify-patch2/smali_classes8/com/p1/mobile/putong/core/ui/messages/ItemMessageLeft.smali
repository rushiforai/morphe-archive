.class public Lcom/p1/mobile/putong/core/ui/messages/ItemMessageLeft;
.super Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public E0:Lv/VLinear;

.field public F0:Lv/VText;

.field public G0:Lcom/p1/mobile/putong/core/ui/view/GradientBgButton;

.field public H0:Lcom/p1/mobile/putong/data/User;

.field public I0:Ll/pol;

.field public J0:Lcom/p1/mobile/putong/core/data/Message;

.field public K0:Landroid/view/View$OnLongClickListener;

.field public L:Landroid/widget/FrameLayout;

.field public M:Lv/VDraweeView;

.field public N:Lv/VImage;

.field public O:Landroid/widget/FrameLayout;

.field public P:Lv/VDraweeView;

.field public Q:Lv/VDraweeView;

.field public R:Lv/VText;

.field public S:Landroid/widget/FrameLayout;

.field public T:Landroid/widget/FrameLayout;

.field public U:Lv/VText;

.field public V:Lv/VText;

.field public W:Lv/VText;

.field public k0:Lv/VText;

.field public p0:Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageLeft$a;

    .line 5
    .line 6
    invoke-direct {p1, p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageLeft$a;-><init>(Lcom/p1/mobile/putong/core/ui/messages/ItemMessageLeft;)V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageLeft;->K0:Landroid/view/View$OnLongClickListener;

    .line 10
    .line 11
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 12
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 13
    new-instance p1, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageLeft$a;

    invoke-direct {p1, p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageLeft$a;-><init>(Lcom/p1/mobile/putong/core/ui/messages/ItemMessageLeft;)V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageLeft;->K0:Landroid/view/View$OnLongClickListener;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 14
    invoke-direct {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 15
    new-instance p1, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageLeft$a;

    invoke-direct {p1, p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageLeft$a;-><init>(Lcom/p1/mobile/putong/core/ui/messages/ItemMessageLeft;)V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageLeft;->K0:Landroid/view/View$OnLongClickListener;

    return-void
.end method

.method public static synthetic C0(Lcom/p1/mobile/putong/core/ui/messages/ItemMessageLeft;Lcom/p1/mobile/putong/core/data/ChatGroup;Landroid/util/Pair;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageLeft;->O0(Lcom/p1/mobile/putong/core/data/ChatGroup;Landroid/util/Pair;)V

    return-void
.end method

.method public static synthetic D0(Lcom/p1/mobile/putong/core/ui/messages/ItemMessageLeft;Lcom/p1/mobile/putong/core/data/Conversation;Ll/bkj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageLeft;->Q0(Lcom/p1/mobile/putong/core/data/Conversation;Ll/bkj0;)V

    return-void
.end method

.method public static synthetic E0(Lcom/p1/mobile/putong/core/ui/messages/ItemMessageLeft;Lcom/p1/mobile/putong/data/BubbleInfo;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageLeft;->U0(Lcom/p1/mobile/putong/data/BubbleInfo;)V

    return-void
.end method

.method public static synthetic F0(Lcom/p1/mobile/putong/core/ui/messages/ItemMessageLeft;Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageLeft;->R0(Lcom/p1/mobile/putong/data/User;)V

    return-void
.end method

.method public static synthetic G0(Lcom/p1/mobile/putong/core/data/Conversation;)Lcom/p1/mobile/putong/core/data/ConversationType;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Conversation;->subtype:Lcom/p1/mobile/putong/core/data/ConversationType;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic H0(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic I0(Lcom/p1/mobile/putong/core/ui/messages/ItemMessageLeft;Lcom/p1/mobile/putong/core/data/Message;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageLeft;->T0(Lcom/p1/mobile/putong/core/data/Message;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic J0(Lcom/p1/mobile/putong/core/ui/messages/ItemMessageLeft;Ll/pf60;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageLeft;->S0(Ll/pf60;)V

    return-void
.end method

.method public static synthetic K0(Lcom/p1/mobile/putong/core/ui/messages/ItemMessageLeft;Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageLeft;->P0(Lcom/p1/mobile/putong/data/User;)V

    return-void
.end method

.method public static synthetic L0(Lcom/p1/mobile/putong/core/ui/messages/ItemMessageLeft;Ljava/lang/String;Ll/clz;Lcom/p1/mobile/putong/core/data/ChatGroupMember;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageLeft;->N0(Ljava/lang/String;Ll/clz;Lcom/p1/mobile/putong/core/data/ChatGroupMember;)V

    return-void
.end method

.method public static bridge synthetic M0(Lcom/p1/mobile/putong/core/ui/messages/ItemMessageLeft;)Lcom/p1/mobile/putong/core/data/Message;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageLeft;->J0:Lcom/p1/mobile/putong/core/data/Message;

    return-object p0
.end method


# virtual methods
.method public final synthetic N0(Ljava/lang/String;Ll/clz;Lcom/p1/mobile/putong/core/data/ChatGroupMember;)V
    .locals 1

    .line 1
    invoke-static {p3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object p3, p3, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->status:Lcom/p1/mobile/putong/core/data/ChatGroupMemberStatus;

    .line 8
    .line 9
    const-string v0, "exited"

    .line 10
    .line 11
    invoke-static {p3, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 12
    .line 13
    .line 14
    move-result p3

    .line 15
    if-eqz p3, :cond_0

    .line 16
    .line 17
    sget p0, Lcom/p1/mobile/putong/core/message/R$string;->Z:I

    .line 18
    .line 19
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 20
    .line 21
    .line 22
    return-void

    .line 23
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->K()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 24
    .line 25
    .line 26
    move-result-object p3

    .line 27
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageLeft;->J0:Lcom/p1/mobile/putong/core/data/Message;

    .line 28
    .line 29
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/Message;->owner:Ljava/lang/String;

    .line 30
    .line 31
    invoke-interface {p3, v0}, Ll/qhk0;->getUserById(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 32
    .line 33
    .line 34
    move-result-object p3

    .line 35
    invoke-static {p3}, Ll/mgk;->d(Lcom/p1/mobile/putong/data/User;)Z

    .line 36
    .line 37
    .line 38
    move-result p3

    .line 39
    if-eqz p3, :cond_1

    .line 40
    .line 41
    return-void

    .line 42
    :cond_1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->H()Lcom/p1/mobile/android/app/Act;

    .line 43
    .line 44
    .line 45
    move-result-object p3

    .line 46
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageLeft;->J0:Lcom/p1/mobile/putong/core/data/Message;

    .line 47
    .line 48
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/Message;->owner:Ljava/lang/String;

    .line 49
    .line 50
    invoke-static {p3, v0, p1}, Ll/jek;->e(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 51
    .line 52
    .line 53
    move-result-object p1

    .line 54
    const-string p3, "from_group_id"

    .line 55
    .line 56
    invoke-virtual {p2}, Ll/clz;->r3()Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object p2

    .line 60
    invoke-virtual {p1, p3, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 61
    .line 62
    .line 63
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->H()Lcom/p1/mobile/android/app/Act;

    .line 64
    .line 65
    .line 66
    move-result-object p0

    .line 67
    invoke-virtual {p0, p1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 68
    .line 69
    .line 70
    return-void
.end method

.method public final synthetic O0(Lcom/p1/mobile/putong/core/data/ChatGroup;Landroid/util/Pair;)V
    .locals 3

    .line 1
    iget-object v0, p2, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Lcom/p1/mobile/putong/data/User;

    .line 4
    .line 5
    iget-object p2, p2, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 6
    .line 7
    check-cast p2, Lcom/p1/mobile/putong/core/data/ChatGroupMember;

    .line 8
    .line 9
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    const/4 v2, 0x1

    .line 14
    if-eqz v1, :cond_0

    .line 15
    .line 16
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->groupMemberName()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    if-nez v1, :cond_0

    .line 25
    .line 26
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageLeft;->V:Lv/VText;

    .line 27
    .line 28
    invoke-static {v1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 29
    .line 30
    .line 31
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageLeft;->V:Lv/VText;

    .line 32
    .line 33
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->groupMemberName()Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object p2

    .line 37
    invoke-static {p2}, Ll/jek;->o(Ljava/lang/String;)Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object p2

    .line 41
    invoke-virtual {v1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 42
    .line 43
    .line 44
    :cond_0
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 45
    .line 46
    .line 47
    move-result p2

    .line 48
    if-eqz p2, :cond_1

    .line 49
    .line 50
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isBanedOrInactivated()Z

    .line 51
    .line 52
    .line 53
    move-result p2

    .line 54
    if-eqz p2, :cond_1

    .line 55
    .line 56
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageLeft;->V:Lv/VText;

    .line 57
    .line 58
    iget-object v1, v0, Lcom/p1/mobile/putong/data/User;->publicId:Ljava/lang/String;

    .line 59
    .line 60
    invoke-virtual {p2, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 61
    .line 62
    .line 63
    :cond_1
    invoke-static {p1}, Ll/jek;->s(Lcom/p1/mobile/putong/core/data/ChatGroup;)Z

    .line 64
    .line 65
    .line 66
    move-result p1

    .line 67
    if-eqz p1, :cond_3

    .line 68
    .line 69
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 70
    .line 71
    .line 72
    move-result p1

    .line 73
    if-eqz p1, :cond_2

    .line 74
    .line 75
    sget-object p1, Ll/uqb0;->G:Ll/fsb0;

    .line 76
    .line 77
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageLeft;->M:Lv/VDraweeView;

    .line 78
    .line 79
    invoke-static {v0}, Ll/jek;->k(Lcom/p1/mobile/putong/data/User;)Ljava/lang/String;

    .line 80
    .line 81
    .line 82
    move-result-object v0

    .line 83
    invoke-virtual {p1, p2, v0}, Ll/fsb0;->Z0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 84
    .line 85
    .line 86
    goto :goto_0

    .line 87
    :cond_2
    sget-object p1, Ll/uqb0;->G:Ll/fsb0;

    .line 88
    .line 89
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageLeft;->M:Lv/VDraweeView;

    .line 90
    .line 91
    sget v0, Ll/ibc0;->I0:I

    .line 92
    .line 93
    invoke-virtual {p1, p2, v0}, Ll/fsb0;->Y0(Lcom/facebook/drawee/view/SimpleDraweeView;I)V

    .line 94
    .line 95
    .line 96
    goto :goto_0

    .line 97
    :cond_3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 98
    .line 99
    .line 100
    move-result p1

    .line 101
    if-eqz p1, :cond_5

    .line 102
    .line 103
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isBanedOrInactivated()Z

    .line 104
    .line 105
    .line 106
    move-result p1

    .line 107
    if-eqz p1, :cond_4

    .line 108
    .line 109
    sget-object p1, Ll/uqb0;->G:Ll/fsb0;

    .line 110
    .line 111
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageLeft;->M:Lv/VDraweeView;

    .line 112
    .line 113
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->l:Ll/j49;

    .line 114
    .line 115
    invoke-virtual {v0}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 116
    .line 117
    .line 118
    move-result-object v0

    .line 119
    invoke-interface {v0}, Ll/r97;->T0()I

    .line 120
    .line 121
    .line 122
    move-result v0

    .line 123
    invoke-virtual {p1, p2, v0}, Ll/fsb0;->Y0(Lcom/facebook/drawee/view/SimpleDraweeView;I)V

    .line 124
    .line 125
    .line 126
    goto :goto_0

    .line 127
    :cond_4
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageLeft;->p0:Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;

    .line 128
    .line 129
    const/4 p2, 0x0

    .line 130
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;->setShowSVipFrame(Z)V

    .line 131
    .line 132
    .line 133
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageLeft;->p0:Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;

    .line 134
    .line 135
    const-string v1, "p_chat_view"

    .line 136
    .line 137
    invoke-virtual {p1, p2, v1}, Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;->E0(ZLjava/lang/String;)V

    .line 138
    .line 139
    .line 140
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageLeft;->p0:Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;

    .line 141
    .line 142
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;->t0(Lcom/p1/mobile/putong/data/User;)V

    .line 143
    .line 144
    .line 145
    goto :goto_0

    .line 146
    :cond_5
    sget-object p1, Ll/uqb0;->G:Ll/fsb0;

    .line 147
    .line 148
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageLeft;->M:Lv/VDraweeView;

    .line 149
    .line 150
    sget v0, Ll/ibc0;->I0:I

    .line 151
    .line 152
    invoke-virtual {p1, p2, v0}, Ll/fsb0;->Y0(Lcom/facebook/drawee/view/SimpleDraweeView;I)V

    .line 153
    .line 154
    .line 155
    :goto_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageLeft;->V:Lv/VText;

    .line 156
    .line 157
    invoke-static {p0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 158
    .line 159
    .line 160
    return-void
.end method

.method public final synthetic P0(Lcom/p1/mobile/putong/data/User;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->H()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    check-cast v0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 6
    .line 7
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->E2()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageLeft;->N:Lv/VImage;

    .line 14
    .line 15
    const/4 v1, 0x0

    .line 16
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageLeft;->G0:Lcom/p1/mobile/putong/core/ui/view/GradientBgButton;

    .line 20
    .line 21
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 22
    .line 23
    .line 24
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageLeft;->G0:Lcom/p1/mobile/putong/core/ui/view/GradientBgButton;

    .line 25
    .line 26
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 27
    .line 28
    .line 29
    :cond_0
    iget-boolean v0, p1, Lcom/p1/mobile/putong/data/User;->inactivated:Z

    .line 30
    .line 31
    if-eqz v0, :cond_1

    .line 32
    .line 33
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageLeft;->p0:Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;

    .line 34
    .line 35
    sget p1, Ll/ibc0;->h:I

    .line 36
    .line 37
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;->z0(I)V

    .line 38
    .line 39
    .line 40
    return-void

    .line 41
    :cond_1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->V()Z

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageLeft;->p0:Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;

    .line 46
    .line 47
    if-eqz v0, :cond_2

    .line 48
    .line 49
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->getAnonymousUrl()Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object p1

    .line 53
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;->B0(Ljava/lang/String;)V

    .line 54
    .line 55
    .line 56
    return-void

    .line 57
    :cond_2
    invoke-static {p1}, Ll/ux6;->a(Lcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/putong/data/Picture;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;->v0(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/Picture$ImageUri;)V

    .line 66
    .line 67
    .line 68
    return-void
.end method

.method public final synthetic Q0(Lcom/p1/mobile/putong/core/data/Conversation;Ll/bkj0;)V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageLeft;->G0:Lcom/p1/mobile/putong/core/ui/view/GradientBgButton;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p2, Ll/bkj0;->c:Ljava/lang/Object;

    .line 8
    .line 9
    check-cast v0, Lcom/p1/mobile/putong/core/data/ConversationType;

    .line 10
    .line 11
    const-string v2, "soulmate"

    .line 12
    .line 13
    invoke-static {v0, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_1

    .line 18
    .line 19
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageLeft;->H0:Lcom/p1/mobile/putong/data/User;

    .line 20
    .line 21
    iget-boolean p1, p1, Lcom/p1/mobile/putong/data/User;->inactivated:Z

    .line 22
    .line 23
    if-eqz p1, :cond_0

    .line 24
    .line 25
    sget-object p1, Ll/uqb0;->G:Ll/fsb0;

    .line 26
    .line 27
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageLeft;->M:Lv/VDraweeView;

    .line 28
    .line 29
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 30
    .line 31
    .line 32
    move-result-object p2

    .line 33
    invoke-virtual {p2}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 34
    .line 35
    .line 36
    move-result-object p2

    .line 37
    invoke-interface {p2}, Ll/r97;->T0()I

    .line 38
    .line 39
    .line 40
    move-result p2

    .line 41
    invoke-virtual {p1, p0, p2}, Ll/fsb0;->Y0(Lcom/facebook/drawee/view/SimpleDraweeView;I)V

    .line 42
    .line 43
    .line 44
    return-void

    .line 45
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageLeft;->M:Lv/VDraweeView;

    .line 46
    .line 47
    iget-object p1, p2, Ll/bkj0;->a:Ljava/lang/Object;

    .line 48
    .line 49
    check-cast p1, Lcom/p1/mobile/putong/data/User;

    .line 50
    .line 51
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->soulSettings:Lcom/p1/mobile/putong/data/UserSoulSettings;

    .line 52
    .line 53
    iget-object p1, p1, Lcom/p1/mobile/putong/data/UserSoulSettings;->picture:Lcom/p1/mobile/putong/data/SoulHead;

    .line 54
    .line 55
    iget-object p1, p1, Lcom/p1/mobile/putong/data/SoulHead;->url:Ljava/lang/String;

    .line 56
    .line 57
    invoke-virtual {p0, p1}, Lcom/facebook/drawee/view/SimpleDraweeView;->setImageURI(Ljava/lang/String;)V

    .line 58
    .line 59
    .line 60
    return-void

    .line 61
    :cond_1
    iget-object v0, p2, Ll/bkj0;->a:Ljava/lang/Object;

    .line 62
    .line 63
    check-cast v0, Lcom/p1/mobile/putong/data/User;

    .line 64
    .line 65
    iget-object p2, p2, Ll/bkj0;->b:Ljava/lang/Object;

    .line 66
    .line 67
    check-cast p2, Ll/pf60;

    .line 68
    .line 69
    iget-object p2, p2, Ll/pf60;->a:Ljava/lang/Object;

    .line 70
    .line 71
    check-cast p2, Ljava/lang/Integer;

    .line 72
    .line 73
    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    .line 74
    .line 75
    .line 76
    move-result p2

    .line 77
    iget-boolean v2, v0, Lcom/p1/mobile/putong/data/User;->inactivated:Z

    .line 78
    .line 79
    if-eqz v2, :cond_2

    .line 80
    .line 81
    sget-object p1, Ll/uqb0;->G:Ll/fsb0;

    .line 82
    .line 83
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageLeft;->M:Lv/VDraweeView;

    .line 84
    .line 85
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 86
    .line 87
    .line 88
    move-result-object v0

    .line 89
    invoke-virtual {v0}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 90
    .line 91
    .line 92
    move-result-object v0

    .line 93
    invoke-interface {v0}, Ll/r97;->T0()I

    .line 94
    .line 95
    .line 96
    move-result v0

    .line 97
    invoke-virtual {p1, p2, v0}, Ll/fsb0;->Y0(Lcom/facebook/drawee/view/SimpleDraweeView;I)V

    .line 98
    .line 99
    .line 100
    goto/16 :goto_1

    .line 101
    .line 102
    :cond_2
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->V()Z

    .line 103
    .line 104
    .line 105
    move-result v2

    .line 106
    if-eqz v2, :cond_3

    .line 107
    .line 108
    sget-object p1, Ll/uqb0;->G:Ll/fsb0;

    .line 109
    .line 110
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageLeft;->M:Lv/VDraweeView;

    .line 111
    .line 112
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->getAnonymousUrl()Ljava/lang/String;

    .line 113
    .line 114
    .line 115
    move-result-object v0

    .line 116
    invoke-virtual {p1, p2, v0}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 117
    .line 118
    .line 119
    goto/16 :goto_1

    .line 120
    .line 121
    :cond_3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->onlineMatchLocked()Z

    .line 122
    .line 123
    .line 124
    move-result v2

    .line 125
    const/16 v3, 0x64

    .line 126
    .line 127
    if-eqz v2, :cond_5

    .line 128
    .line 129
    if-eq p2, v3, :cond_5

    .line 130
    .line 131
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 132
    .line 133
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 134
    .line 135
    invoke-virtual {v2}, Ll/dkb;->na()Lcom/p1/mobile/putong/data/User;

    .line 136
    .line 137
    .line 138
    move-result-object v2

    .line 139
    invoke-virtual {p1, v2}, Lcom/p1/mobile/putong/core/data/Conversation;->isQuickChatClearAvatar(Lcom/p1/mobile/putong/data/User;)Z

    .line 140
    .line 141
    .line 142
    move-result p1

    .line 143
    if-eqz p1, :cond_4

    .line 144
    .line 145
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageLeft;->p0:Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;

    .line 146
    .line 147
    invoke-static {v0}, Ll/ux6;->a(Lcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/putong/data/Picture;

    .line 148
    .line 149
    .line 150
    move-result-object p2

    .line 151
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 152
    .line 153
    .line 154
    move-result-object p2

    .line 155
    invoke-virtual {p1, v0, p2}, Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;->v0(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/Picture$ImageUri;)V

    .line 156
    .line 157
    .line 158
    goto :goto_0

    .line 159
    :cond_4
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 160
    .line 161
    .line 162
    move-result-object p1

    .line 163
    invoke-virtual {p1}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 164
    .line 165
    .line 166
    move-result-object p1

    .line 167
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageLeft;->M:Lv/VDraweeView;

    .line 168
    .line 169
    invoke-static {v0}, Ll/ux6;->a(Lcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/putong/data/Picture;

    .line 170
    .line 171
    .line 172
    move-result-object v0

    .line 173
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 174
    .line 175
    .line 176
    move-result-object v0

    .line 177
    invoke-interface {p1, v2, v0, p2}, Ll/r97;->y2(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;I)V

    .line 178
    .line 179
    .line 180
    goto :goto_0

    .line 181
    :cond_5
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 182
    .line 183
    .line 184
    move-result-object v2

    .line 185
    invoke-virtual {v2}, Ll/j49;->b()Lcom/p1/mobile/putong/core/buzz/service/CoreBuzzInnerService;

    .line 186
    .line 187
    .line 188
    move-result-object v2

    .line 189
    invoke-interface {v2}, Lcom/p1/mobile/putong/core/buzz/service/CoreBuzzInnerService;->Yg()Z

    .line 190
    .line 191
    .line 192
    move-result v2

    .line 193
    if-eqz v2, :cond_6

    .line 194
    .line 195
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isLoveBuzz()Z

    .line 196
    .line 197
    .line 198
    move-result v2

    .line 199
    if-eqz v2, :cond_6

    .line 200
    .line 201
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 202
    .line 203
    .line 204
    move-result-object v2

    .line 205
    invoke-virtual {v2}, Ll/j49;->b()Lcom/p1/mobile/putong/core/buzz/service/CoreBuzzInnerService;

    .line 206
    .line 207
    .line 208
    move-result-object v2

    .line 209
    invoke-interface {v2, p1}, Lcom/p1/mobile/putong/core/buzz/service/CoreBuzzInnerService;->Wr(Lcom/p1/mobile/putong/core/data/Conversation;)Z

    .line 210
    .line 211
    .line 212
    move-result p1

    .line 213
    if-nez p1, :cond_6

    .line 214
    .line 215
    if-eq p2, v3, :cond_6

    .line 216
    .line 217
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 218
    .line 219
    .line 220
    move-result-object p1

    .line 221
    invoke-virtual {p1}, Ll/j49;->b()Lcom/p1/mobile/putong/core/buzz/service/CoreBuzzInnerService;

    .line 222
    .line 223
    .line 224
    move-result-object p1

    .line 225
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageLeft;->M:Lv/VDraweeView;

    .line 226
    .line 227
    invoke-static {v0}, Ll/ux6;->a(Lcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/putong/data/Picture;

    .line 228
    .line 229
    .line 230
    move-result-object v0

    .line 231
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 232
    .line 233
    .line 234
    move-result-object v0

    .line 235
    invoke-interface {p1, v2, v0, p2}, Lcom/p1/mobile/putong/core/buzz/service/CoreBuzzInnerService;->xp(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;I)V

    .line 236
    .line 237
    .line 238
    :goto_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageLeft;->p0:Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;

    .line 239
    .line 240
    invoke-virtual {p1, v1}, Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;->G0(Z)V

    .line 241
    .line 242
    .line 243
    goto :goto_1

    .line 244
    :cond_6
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageLeft;->p0:Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;

    .line 245
    .line 246
    invoke-static {v0}, Ll/ux6;->a(Lcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/putong/data/Picture;

    .line 247
    .line 248
    .line 249
    move-result-object p2

    .line 250
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 251
    .line 252
    .line 253
    move-result-object p2

    .line 254
    invoke-virtual {p1, v0, p2}, Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;->v0(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/Picture$ImageUri;)V

    .line 255
    .line 256
    .line 257
    :goto_1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageLeft;->N:Lv/VImage;

    .line 258
    .line 259
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 260
    .line 261
    .line 262
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageLeft;->G0:Lcom/p1/mobile/putong/core/ui/view/GradientBgButton;

    .line 263
    .line 264
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 265
    .line 266
    .line 267
    return-void
.end method

.method public final synthetic R0(Lcom/p1/mobile/putong/data/User;)V
    .locals 3

    .line 1
    iget-boolean v0, p1, Lcom/p1/mobile/putong/data/User;->inactivated:Z

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    sget-object p1, Ll/uqb0;->G:Ll/fsb0;

    .line 7
    .line 8
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageLeft;->M:Lv/VDraweeView;

    .line 9
    .line 10
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 11
    .line 12
    .line 13
    move-result-object v2

    .line 14
    invoke-virtual {v2}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 15
    .line 16
    .line 17
    move-result-object v2

    .line 18
    invoke-interface {v2}, Ll/r97;->T0()I

    .line 19
    .line 20
    .line 21
    move-result v2

    .line 22
    invoke-virtual {p1, v0, v2}, Ll/fsb0;->Y0(Lcom/facebook/drawee/view/SimpleDraweeView;I)V

    .line 23
    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->V()Z

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    if-eqz v0, :cond_1

    .line 31
    .line 32
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 33
    .line 34
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageLeft;->M:Lv/VDraweeView;

    .line 35
    .line 36
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->getAnonymousUrl()Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    invoke-virtual {v0, v2, p1}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    :goto_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageLeft;->p0:Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;

    .line 44
    .line 45
    invoke-virtual {p1, v1}, Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;->G0(Z)V

    .line 46
    .line 47
    .line 48
    goto :goto_1

    .line 49
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageLeft;->p0:Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;

    .line 50
    .line 51
    invoke-static {p1}, Ll/ux6;->a(Lcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/putong/data/Picture;

    .line 52
    .line 53
    .line 54
    move-result-object v2

    .line 55
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 56
    .line 57
    .line 58
    move-result-object v2

    .line 59
    invoke-virtual {v0, p1, v2}, Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;->v0(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/Picture$ImageUri;)V

    .line 60
    .line 61
    .line 62
    :goto_1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageLeft;->N:Lv/VImage;

    .line 63
    .line 64
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 65
    .line 66
    .line 67
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageLeft;->G0:Lcom/p1/mobile/putong/core/ui/view/GradientBgButton;

    .line 68
    .line 69
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 70
    .line 71
    .line 72
    return-void
.end method

.method public final synthetic S0(Ll/pf60;)V
    .locals 3

    .line 1
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageLeft;->P:Lv/VDraweeView;

    .line 4
    .line 5
    iget-object v2, p1, Ll/pf60;->a:Ljava/lang/Object;

    .line 6
    .line 7
    check-cast v2, Lcom/p1/mobile/putong/data/User;

    .line 8
    .line 9
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    invoke-virtual {v0, v1, v2}, Ll/fsb0;->Q0(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;)V

    .line 18
    .line 19
    .line 20
    iget-object p1, p1, Ll/pf60;->b:Ljava/lang/Object;

    .line 21
    .line 22
    if-eqz p1, :cond_1

    .line 23
    .line 24
    move-object v0, p1

    .line 25
    check-cast v0, Lcom/p1/mobile/putong/data/User;

    .line 26
    .line 27
    iget-boolean v0, v0, Lcom/p1/mobile/putong/data/User;->inactivated:Z

    .line 28
    .line 29
    if-eqz v0, :cond_0

    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_0
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 33
    .line 34
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageLeft;->Q:Lv/VDraweeView;

    .line 35
    .line 36
    check-cast p1, Lcom/p1/mobile/putong/data/User;

    .line 37
    .line 38
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    invoke-virtual {v0, p0, p1}, Ll/fsb0;->Q0(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;)V

    .line 47
    .line 48
    .line 49
    return-void

    .line 50
    :cond_1
    :goto_0
    sget-object p1, Ll/uqb0;->G:Ll/fsb0;

    .line 51
    .line 52
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageLeft;->Q:Lv/VDraweeView;

    .line 53
    .line 54
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    invoke-virtual {v0}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    invoke-interface {v0}, Ll/r97;->T0()I

    .line 63
    .line 64
    .line 65
    move-result v0

    .line 66
    invoke-virtual {p1, p0, v0}, Ll/fsb0;->Y0(Lcom/facebook/drawee/view/SimpleDraweeView;I)V

    .line 67
    .line 68
    .line 69
    return-void
.end method

.method public final synthetic T0(Lcom/p1/mobile/putong/core/data/Message;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->H()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result p2

    .line 9
    if-eqz p2, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->X()Z

    .line 12
    .line 13
    .line 14
    move-result p2

    .line 15
    if-eqz p2, :cond_0

    .line 16
    .line 17
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->H()Lcom/p1/mobile/android/app/Act;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    check-cast p0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 22
    .line 23
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->R2(Lcom/p1/mobile/putong/core/data/Message;)V

    .line 24
    .line 25
    .line 26
    :cond_0
    return-void
.end method

.method public final synthetic U0(Lcom/p1/mobile/putong/data/BubbleInfo;)V
    .locals 1

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->W(Lcom/p1/mobile/putong/data/BubbleInfo;)Z

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    if-eqz p1, :cond_0

    .line 12
    .line 13
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageLeft;->L:Landroid/widget/FrameLayout;

    .line 14
    .line 15
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    sget v0, Ll/eac0;->d:I

    .line 20
    .line 21
    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getDimension(I)F

    .line 22
    .line 23
    .line 24
    move-result p0

    .line 25
    float-to-int p0, p0

    .line 26
    invoke-static {p1, p0}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 27
    .line 28
    .line 29
    return-void

    .line 30
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageLeft;->L:Landroid/widget/FrameLayout;

    .line 31
    .line 32
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    sget v0, Ll/eac0;->e:I

    .line 37
    .line 38
    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getDimension(I)F

    .line 39
    .line 40
    .line 41
    move-result p0

    .line 42
    float-to-int p0, p0

    .line 43
    invoke-static {p1, p0}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 44
    .line 45
    .line 46
    return-void
.end method

.method public final V0(Ll/pol;Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageLeft;->E0:Lv/VLinear;

    .line 2
    .line 3
    const/4 p1, 0x0

    .line 4
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public W0()V
    .locals 4

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-interface {v0}, Ll/r97;->D()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageLeft;->S:Landroid/widget/FrameLayout;

    .line 16
    .line 17
    invoke-virtual {v0}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageLeft;->M:Lv/VDraweeView;

    .line 21
    .line 22
    const/4 v1, 0x0

    .line 23
    invoke-virtual {v0, v1}, Landroid/view/View;->setRotation(F)V

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageLeft;->J0:Lcom/p1/mobile/putong/core/data/Message;

    .line 27
    .line 28
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    if-eqz v0, :cond_0

    .line 33
    .line 34
    invoke-static {}, Ll/w600;->h()Ll/w600;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageLeft;->J0:Lcom/p1/mobile/putong/core/data/Message;

    .line 39
    .line 40
    iget-object v2, v1, Lcom/p1/mobile/putong/core/data/Message;->owner:Ljava/lang/String;

    .line 41
    .line 42
    iget-object v1, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 43
    .line 44
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageLeft;->S:Landroid/widget/FrameLayout;

    .line 45
    .line 46
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageLeft;->M:Lv/VDraweeView;

    .line 47
    .line 48
    invoke-virtual {v0, v2, v1, v3, p0}, Ll/w600;->p(Ljava/lang/String;Ljava/lang/String;Landroid/widget/FrameLayout;Landroid/view/View;)V

    .line 49
    .line 50
    .line 51
    :cond_0
    return-void
.end method

.method public f(Lcom/p1/mobile/putong/data/User;Ljava/lang/String;Lcom/p1/mobile/putong/data/LocalStatus;)V
    .locals 2

    .line 1
    invoke-super {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/ui/messages/ItemBase;->f(Lcom/p1/mobile/putong/data/User;Ljava/lang/String;Lcom/p1/mobile/putong/data/LocalStatus;)V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageLeft;->H0:Lcom/p1/mobile/putong/data/User;

    .line 5
    .line 6
    iget-object p3, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageLeft;->p0:Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;

    .line 7
    .line 8
    const-string v0, "p_chat_view"

    .line 9
    .line 10
    const/4 v1, 0x0

    .line 11
    invoke-virtual {p3, v1, v0}, Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;->E0(ZLjava/lang/String;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->V()Z

    .line 15
    .line 16
    .line 17
    move-result p3

    .line 18
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageLeft;->p0:Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;

    .line 19
    .line 20
    if-eqz p3, :cond_0

    .line 21
    .line 22
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->getAnonymousUrl()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;->B0(Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_0
    invoke-static {p1}, Ll/ux6;->a(Lcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/putong/data/Picture;

    .line 31
    .line 32
    .line 33
    move-result-object p3

    .line 34
    invoke-virtual {p3}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 35
    .line 36
    .line 37
    move-result-object p3

    .line 38
    invoke-virtual {v0, p1, p3}, Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;->v0(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/Picture$ImageUri;)V

    .line 39
    .line 40
    .line 41
    :goto_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageLeft;->N:Lv/VImage;

    .line 42
    .line 43
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 44
    .line 45
    .line 46
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageLeft;->G0:Lcom/p1/mobile/putong/core/ui/view/GradientBgButton;

    .line 47
    .line 48
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 49
    .line 50
    .line 51
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->v:Lcom/p1/mobile/putong/core/ui/messages/a;

    .line 52
    .line 53
    instance-of p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemHeartConfession;

    .line 54
    .line 55
    if-eqz p1, :cond_1

    .line 56
    .line 57
    check-cast p0, Lcom/p1/mobile/putong/core/ui/messages/ItemHeartConfession;

    .line 58
    .line 59
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/core/ui/messages/ItemHeartConfession;->b(Ljava/lang/String;)V

    .line 60
    .line 61
    .line 62
    :cond_1
    return-void
.end method

.method public g(Ll/pol;Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/core/data/Message;)V
    .locals 6

    .line 1
    invoke-super {p0, p1, p2, p3, p4}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->g(Ll/pol;Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/core/data/Message;)V

    .line 2
    .line 3
    .line 4
    const/high16 p3, 0x40c00000    # 6.0f

    .line 5
    .line 6
    invoke-static {p3}, Ll/qa00;->d(F)I

    .line 7
    .line 8
    .line 9
    move-result p3

    .line 10
    int-to-float p3, p3

    .line 11
    invoke-virtual {p0, p3}, Landroid/view/View;->setPivotX(F)V

    .line 12
    .line 13
    .line 14
    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageLeft;->J0:Lcom/p1/mobile/putong/core/data/Message;

    .line 15
    .line 16
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageLeft;->I0:Ll/pol;

    .line 17
    .line 18
    iget-object p3, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageLeft;->p0:Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;

    .line 19
    .line 20
    const-string v0, "p_chat_view"

    .line 21
    .line 22
    const/4 v1, 0x0

    .line 23
    invoke-virtual {p3, v1, v0}, Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;->E0(ZLjava/lang/String;)V

    .line 24
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
    invoke-interface {p3}, Ll/r97;->E()Z

    .line 35
    .line 36
    .line 37
    move-result p3

    .line 38
    if-eqz p3, :cond_3

    .line 39
    .line 40
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->X()Z

    .line 41
    .line 42
    .line 43
    move-result p3

    .line 44
    if-eqz p3, :cond_3

    .line 45
    .line 46
    iget-object p3, p2, Lcom/p1/mobile/putong/core/data/Message;->channel:Lcom/p1/mobile/putong/core/data/MessageChannel;

    .line 47
    .line 48
    const-string v0, "group"

    .line 49
    .line 50
    invoke-static {p3, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 51
    .line 52
    .line 53
    move-result p3

    .line 54
    if-eqz p3, :cond_3

    .line 55
    .line 56
    iget-object p3, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageLeft;->p0:Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;

    .line 57
    .line 58
    invoke-virtual {p3, v1}, Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;->G0(Z)V

    .line 59
    .line 60
    .line 61
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 62
    .line 63
    .line 64
    move-result-object p3

    .line 65
    invoke-virtual {p3}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 66
    .line 67
    .line 68
    move-result-object p3

    .line 69
    invoke-interface {p3}, Ll/r97;->Q()Z

    .line 70
    .line 71
    .line 72
    move-result p3

    .line 73
    if-nez p3, :cond_0

    .line 74
    .line 75
    iget-object p3, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageLeft;->V:Lv/VText;

    .line 76
    .line 77
    const/4 p4, 0x4

    .line 78
    invoke-virtual {p3, p4}, Landroid/view/View;->setVisibility(I)V

    .line 79
    .line 80
    .line 81
    :cond_0
    iget-object p3, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageLeft;->M:Lv/VDraweeView;

    .line 82
    .line 83
    invoke-virtual {p3}, Lcom/facebook/drawee/view/DraweeView;->getHierarchy()Ll/mde;

    .line 84
    .line 85
    .line 86
    move-result-object p3

    .line 87
    check-cast p3, Ll/wlj;

    .line 88
    .line 89
    invoke-static {p3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 90
    .line 91
    .line 92
    move-result p4

    .line 93
    if-eqz p4, :cond_1

    .line 94
    .line 95
    sget p4, Ll/ibc0;->I0:I

    .line 96
    .line 97
    invoke-virtual {p3, p4}, Ll/wlj;->D(I)V

    .line 98
    .line 99
    .line 100
    sget p4, Ll/ibc0;->I0:I

    .line 101
    .line 102
    invoke-virtual {p3, p4}, Ll/wlj;->z(I)V

    .line 103
    .line 104
    .line 105
    :cond_1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->H()Lcom/p1/mobile/android/app/Act;

    .line 106
    .line 107
    .line 108
    move-result-object p3

    .line 109
    check-cast p3, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 110
    .line 111
    iget-object p3, p3, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->f:Ll/clz;

    .line 112
    .line 113
    invoke-virtual {p3}, Ll/clz;->r3()Ljava/lang/String;

    .line 114
    .line 115
    .line 116
    move-result-object p4

    .line 117
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 118
    .line 119
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->g0:Lcom/p1/mobile/putong/core/api/e;

    .line 120
    .line 121
    invoke-virtual {v0, p4}, Lcom/p1/mobile/putong/core/api/e;->s6(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/ChatGroup;

    .line 122
    .line 123
    .line 124
    move-result-object p4

    .line 125
    invoke-static {p4}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 126
    .line 127
    .line 128
    move-result v0

    .line 129
    if-eqz v0, :cond_2

    .line 130
    .line 131
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->H()Lcom/p1/mobile/android/app/Act;

    .line 132
    .line 133
    .line 134
    move-result-object v0

    .line 135
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 136
    .line 137
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 138
    .line 139
    iget-object v2, p2, Lcom/p1/mobile/putong/core/data/Message;->owner:Ljava/lang/String;

    .line 140
    .line 141
    invoke-virtual {v1, v2}, Ll/dkb;->Ma(Ljava/lang/String;)Lrx/c;

    .line 142
    .line 143
    .line 144
    move-result-object v1

    .line 145
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 146
    .line 147
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->g0:Lcom/p1/mobile/putong/core/api/e;

    .line 148
    .line 149
    invoke-virtual {p3}, Ll/clz;->r3()Ljava/lang/String;

    .line 150
    .line 151
    .line 152
    move-result-object p3

    .line 153
    iget-object p2, p2, Lcom/p1/mobile/putong/core/data/Message;->owner:Ljava/lang/String;

    .line 154
    .line 155
    invoke-virtual {v2, p3, p2}, Lcom/p1/mobile/putong/core/api/e;->T6(Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 156
    .line 157
    .line 158
    move-result-object p2

    .line 159
    new-instance p3, Ll/u9q;

    .line 160
    .line 161
    invoke-direct {p3}, Ll/u9q;-><init>()V

    .line 162
    .line 163
    .line 164
    invoke-static {v1, p2, p3}, Lrx/c;->combineLatest(Lrx/c;Lrx/c;Ll/rcj;)Lrx/c;

    .line 165
    .line 166
    .line 167
    move-result-object p2

    .line 168
    invoke-interface {p1, v0, p2}, Ll/pol;->c(Ll/ner;Lrx/c;)Lrx/c;

    .line 169
    .line 170
    .line 171
    move-result-object p1

    .line 172
    new-instance p2, Ll/x9q;

    .line 173
    .line 174
    invoke-direct {p2, p0, p4}, Ll/x9q;-><init>(Lcom/p1/mobile/putong/core/ui/messages/ItemMessageLeft;Lcom/p1/mobile/putong/core/data/ChatGroup;)V

    .line 175
    .line 176
    .line 177
    invoke-static {p2}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 178
    .line 179
    .line 180
    move-result-object p0

    .line 181
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 182
    .line 183
    .line 184
    :cond_2
    return-void

    .line 185
    :cond_3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageLeft;->W0()V

    .line 186
    .line 187
    .line 188
    iget-object p3, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageLeft;->I0:Ll/pol;

    .line 189
    .line 190
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 191
    .line 192
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 193
    .line 194
    iget-object v2, p2, Lcom/p1/mobile/putong/core/data/Message;->owner:Ljava/lang/String;

    .line 195
    .line 196
    invoke-virtual {v0, v2}, Ll/dkb;->Pa(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 197
    .line 198
    .line 199
    move-result-object v0

    .line 200
    invoke-virtual {p0, p3, p2, v0}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageLeft;->V0(Ll/pol;Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/data/User;)V

    .line 201
    .line 202
    .line 203
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->X()Z

    .line 204
    .line 205
    .line 206
    move-result p3

    .line 207
    if-eqz p3, :cond_7

    .line 208
    .line 209
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 210
    .line 211
    .line 212
    move-result-object p3

    .line 213
    invoke-virtual {p3}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 214
    .line 215
    .line 216
    move-result-object p3

    .line 217
    invoke-interface {p3}, Ll/r97;->c()Z

    .line 218
    .line 219
    .line 220
    move-result p3

    .line 221
    if-nez p3, :cond_4

    .line 222
    .line 223
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 224
    .line 225
    .line 226
    move-result-object p3

    .line 227
    invoke-virtual {p3}, Ll/j49;->b()Lcom/p1/mobile/putong/core/buzz/service/CoreBuzzInnerService;

    .line 228
    .line 229
    .line 230
    move-result-object p3

    .line 231
    invoke-interface {p3}, Lcom/p1/mobile/putong/core/buzz/service/CoreBuzzInnerService;->Yg()Z

    .line 232
    .line 233
    .line 234
    move-result p3

    .line 235
    if-eqz p3, :cond_7

    .line 236
    .line 237
    :cond_4
    sget-object p3, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 238
    .line 239
    iget-object p3, p3, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 240
    .line 241
    iget-object v0, p2, Lcom/p1/mobile/putong/core/data/Message;->owner:Ljava/lang/String;

    .line 242
    .line 243
    invoke-virtual {p3, v0}, Lcom/p1/mobile/putong/core/api/g;->Xe(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/Conversation;

    .line 244
    .line 245
    .line 246
    move-result-object p3

    .line 247
    if-nez p3, :cond_5

    .line 248
    .line 249
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->H()Lcom/p1/mobile/android/app/Act;

    .line 250
    .line 251
    .line 252
    move-result-object p3

    .line 253
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 254
    .line 255
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 256
    .line 257
    iget-object v2, p2, Lcom/p1/mobile/putong/core/data/Message;->owner:Ljava/lang/String;

    .line 258
    .line 259
    invoke-virtual {v0, v2}, Ll/dkb;->Ka(Ljava/lang/String;)Lrx/c;

    .line 260
    .line 261
    .line 262
    move-result-object v0

    .line 263
    invoke-interface {p1, p3, v0}, Ll/pol;->c(Ll/ner;Lrx/c;)Lrx/c;

    .line 264
    .line 265
    .line 266
    move-result-object p3

    .line 267
    new-instance v0, Ll/y9q;

    .line 268
    .line 269
    invoke-direct {v0, p0}, Ll/y9q;-><init>(Lcom/p1/mobile/putong/core/ui/messages/ItemMessageLeft;)V

    .line 270
    .line 271
    .line 272
    invoke-static {v0}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 273
    .line 274
    .line 275
    move-result-object v0

    .line 276
    invoke-virtual {p3, v0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 277
    .line 278
    .line 279
    goto/16 :goto_1

    .line 280
    .line 281
    :cond_5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->H()Lcom/p1/mobile/android/app/Act;

    .line 282
    .line 283
    .line 284
    move-result-object v0

    .line 285
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 286
    .line 287
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 288
    .line 289
    iget-object v3, p2, Lcom/p1/mobile/putong/core/data/Message;->owner:Ljava/lang/String;

    .line 290
    .line 291
    invoke-virtual {v2, v3}, Ll/dkb;->Ka(Ljava/lang/String;)Lrx/c;

    .line 292
    .line 293
    .line 294
    move-result-object v2

    .line 295
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 296
    .line 297
    .line 298
    move-result-object v3

    .line 299
    invoke-virtual {v3}, Ll/j49;->b()Lcom/p1/mobile/putong/core/buzz/service/CoreBuzzInnerService;

    .line 300
    .line 301
    .line 302
    move-result-object v3

    .line 303
    invoke-interface {v3}, Lcom/p1/mobile/putong/core/buzz/service/CoreBuzzInnerService;->Yg()Z

    .line 304
    .line 305
    .line 306
    move-result v3

    .line 307
    if-eqz v3, :cond_6

    .line 308
    .line 309
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 310
    .line 311
    .line 312
    move-result-object v3

    .line 313
    invoke-virtual {v3}, Ll/j49;->b()Lcom/p1/mobile/putong/core/buzz/service/CoreBuzzInnerService;

    .line 314
    .line 315
    .line 316
    move-result-object v3

    .line 317
    iget-object v4, p2, Lcom/p1/mobile/putong/core/data/Message;->owner:Ljava/lang/String;

    .line 318
    .line 319
    invoke-interface {v3, p3, v4}, Lcom/p1/mobile/putong/core/buzz/service/CoreBuzzInnerService;->vg(Lcom/p1/mobile/putong/core/data/Conversation;Ljava/lang/String;)Lrx/c;

    .line 320
    .line 321
    .line 322
    move-result-object v3

    .line 323
    goto :goto_0

    .line 324
    :cond_6
    sget-object v3, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 325
    .line 326
    iget-object v3, v3, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 327
    .line 328
    iget-object v4, p2, Lcom/p1/mobile/putong/core/data/Message;->owner:Ljava/lang/String;

    .line 329
    .line 330
    invoke-virtual {v3, v4}, Lcom/p1/mobile/putong/core/api/g;->mo(Ljava/lang/String;)Lrx/c;

    .line 331
    .line 332
    .line 333
    move-result-object v3

    .line 334
    :goto_0
    sget-object v4, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 335
    .line 336
    iget-object v4, v4, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 337
    .line 338
    iget-object v5, p2, Lcom/p1/mobile/putong/core/data/Message;->cid:Ljava/lang/String;

    .line 339
    .line 340
    invoke-virtual {v4, v5}, Lcom/p1/mobile/putong/core/api/g;->Ne(Ljava/lang/String;)Lrx/c;

    .line 341
    .line 342
    .line 343
    move-result-object v4

    .line 344
    new-instance v5, Ll/z9q;

    .line 345
    .line 346
    invoke-direct {v5}, Ll/z9q;-><init>()V

    .line 347
    .line 348
    .line 349
    invoke-virtual {v4, v5}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 350
    .line 351
    .line 352
    move-result-object v4

    .line 353
    invoke-virtual {v4}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 354
    .line 355
    .line 356
    move-result-object v4

    .line 357
    new-instance v5, Ll/aaq;

    .line 358
    .line 359
    invoke-direct {v5}, Ll/aaq;-><init>()V

    .line 360
    .line 361
    .line 362
    invoke-static {v2, v3, v4, v5}, Ll/psd0;->s(Lrx/c;Lrx/c;Lrx/c;Ll/scj;)Lrx/c;

    .line 363
    .line 364
    .line 365
    move-result-object v2

    .line 366
    invoke-interface {p1, v0, v2}, Ll/pol;->c(Ll/ner;Lrx/c;)Lrx/c;

    .line 367
    .line 368
    .line 369
    move-result-object v0

    .line 370
    new-instance v2, Ll/baq;

    .line 371
    .line 372
    invoke-direct {v2, p0, p3}, Ll/baq;-><init>(Lcom/p1/mobile/putong/core/ui/messages/ItemMessageLeft;Lcom/p1/mobile/putong/core/data/Conversation;)V

    .line 373
    .line 374
    .line 375
    invoke-static {v2}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 376
    .line 377
    .line 378
    move-result-object p3

    .line 379
    invoke-virtual {v0, p3}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 380
    .line 381
    .line 382
    goto :goto_1

    .line 383
    :cond_7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->H()Lcom/p1/mobile/android/app/Act;

    .line 384
    .line 385
    .line 386
    move-result-object p3

    .line 387
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 388
    .line 389
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 390
    .line 391
    iget-object v2, p2, Lcom/p1/mobile/putong/core/data/Message;->owner:Ljava/lang/String;

    .line 392
    .line 393
    invoke-virtual {v0, v2}, Ll/dkb;->Ka(Ljava/lang/String;)Lrx/c;

    .line 394
    .line 395
    .line 396
    move-result-object v0

    .line 397
    invoke-interface {p1, p3, v0}, Ll/pol;->c(Ll/ner;Lrx/c;)Lrx/c;

    .line 398
    .line 399
    .line 400
    move-result-object p3

    .line 401
    new-instance v0, Ll/caq;

    .line 402
    .line 403
    invoke-direct {v0, p0}, Ll/caq;-><init>(Lcom/p1/mobile/putong/core/ui/messages/ItemMessageLeft;)V

    .line 404
    .line 405
    .line 406
    invoke-static {v0}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 407
    .line 408
    .line 409
    move-result-object v0

    .line 410
    invoke-virtual {p3, v0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 411
    .line 412
    .line 413
    :goto_1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 414
    .line 415
    .line 416
    move-result-object p3

    .line 417
    invoke-virtual {p3}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 418
    .line 419
    .line 420
    move-result-object p3

    .line 421
    invoke-interface {p3}, Ll/r97;->B()Z

    .line 422
    .line 423
    .line 424
    move-result p3

    .line 425
    const/4 v0, 0x1

    .line 426
    if-eqz p3, :cond_8

    .line 427
    .line 428
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 429
    .line 430
    .line 431
    move-result-object p3

    .line 432
    invoke-virtual {p3}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 433
    .line 434
    .line 435
    move-result-object p3

    .line 436
    iget-object v2, p2, Lcom/p1/mobile/putong/core/data/Message;->cid:Ljava/lang/String;

    .line 437
    .line 438
    invoke-interface {p3, v2}, Ll/r97;->Q4(Ljava/lang/String;)Z

    .line 439
    .line 440
    .line 441
    move-result p3

    .line 442
    if-eqz p3, :cond_8

    .line 443
    .line 444
    iget-object p3, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->v:Lcom/p1/mobile/putong/core/ui/messages/a;

    .line 445
    .line 446
    instance-of p3, p3, Lcom/p1/mobile/putong/core/ui/messages/ItemHeartConfession;

    .line 447
    .line 448
    if-eqz p3, :cond_8

    .line 449
    .line 450
    iget-object p3, p2, Lcom/p1/mobile/putong/core/data/Message;->cid:Ljava/lang/String;

    .line 451
    .line 452
    invoke-static {p3}, Ll/hcp;->c(Ljava/lang/String;)Z

    .line 453
    .line 454
    .line 455
    move-result p3

    .line 456
    if-nez p3, :cond_8

    .line 457
    .line 458
    iget-object p3, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageLeft;->O:Landroid/widget/FrameLayout;

    .line 459
    .line 460
    invoke-static {p3, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 461
    .line 462
    .line 463
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->H()Lcom/p1/mobile/android/app/Act;

    .line 464
    .line 465
    .line 466
    move-result-object p3

    .line 467
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 468
    .line 469
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 470
    .line 471
    invoke-virtual {v2}, Ll/dkb;->o9()Lrx/c;

    .line 472
    .line 473
    .line 474
    move-result-object v2

    .line 475
    sget-object v3, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 476
    .line 477
    iget-object v3, v3, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 478
    .line 479
    iget-object v4, p2, Lcom/p1/mobile/putong/core/data/Message;->cid:Ljava/lang/String;

    .line 480
    .line 481
    invoke-virtual {v3, v4}, Ll/dkb;->Ka(Ljava/lang/String;)Lrx/c;

    .line 482
    .line 483
    .line 484
    move-result-object v3

    .line 485
    new-instance v4, Ll/r9q;

    .line 486
    .line 487
    invoke-direct {v4}, Ll/r9q;-><init>()V

    .line 488
    .line 489
    .line 490
    invoke-static {v2, v3, v4}, Ll/psd0;->r(Lrx/c;Lrx/c;Ll/rcj;)Lrx/c;

    .line 491
    .line 492
    .line 493
    move-result-object v2

    .line 494
    invoke-interface {p1, p3, v2}, Ll/pol;->c(Ll/ner;Lrx/c;)Lrx/c;

    .line 495
    .line 496
    .line 497
    move-result-object p3

    .line 498
    new-instance v2, Ll/s9q;

    .line 499
    .line 500
    invoke-direct {v2, p0}, Ll/s9q;-><init>(Lcom/p1/mobile/putong/core/ui/messages/ItemMessageLeft;)V

    .line 501
    .line 502
    .line 503
    invoke-static {v2}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 504
    .line 505
    .line 506
    move-result-object v2

    .line 507
    invoke-virtual {p3, v2}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 508
    .line 509
    .line 510
    goto :goto_2

    .line 511
    :cond_8
    iget-object p3, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageLeft;->O:Landroid/widget/FrameLayout;

    .line 512
    .line 513
    invoke-static {p3, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 514
    .line 515
    .line 516
    :goto_2
    invoke-static {}, Ll/o3z;->g()Ll/o3z;

    .line 517
    .line 518
    .line 519
    move-result-object p3

    .line 520
    invoke-virtual {p3, p2, p4}, Ll/o3z;->n(Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/core/data/Message;)Z

    .line 521
    .line 522
    .line 523
    move-result p3

    .line 524
    iget-object p4, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageLeft;->T:Landroid/widget/FrameLayout;

    .line 525
    .line 526
    if-eqz p3, :cond_9

    .line 527
    .line 528
    invoke-static {p4, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 529
    .line 530
    .line 531
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->H()Lcom/p1/mobile/android/app/Act;

    .line 532
    .line 533
    .line 534
    move-result-object p3

    .line 535
    iget-object p4, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageLeft;->U:Lv/VText;

    .line 536
    .line 537
    iget-object v1, p2, Lcom/p1/mobile/putong/core/data/Message;->cid:Ljava/lang/String;

    .line 538
    .line 539
    invoke-static {p3, p4, v1}, Ll/o3z;->l(Landroid/content/Context;Lv/VText;Ljava/lang/String;)V

    .line 540
    .line 541
    .line 542
    goto :goto_3

    .line 543
    :cond_9
    invoke-static {p4, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 544
    .line 545
    .line 546
    :goto_3
    iget-object p3, p2, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 547
    .line 548
    const-string p4, "chat_gift"

    .line 549
    .line 550
    invoke-static {p3, p4}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 551
    .line 552
    .line 553
    move-result p3

    .line 554
    if-eqz p3, :cond_a

    .line 555
    .line 556
    iget-object p3, p2, Lcom/p1/mobile/putong/core/data/Message;->additionalData:Lcom/p1/mobile/putong/core/data/MessageAdditionalData;

    .line 557
    .line 558
    invoke-static {p3}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 559
    .line 560
    .line 561
    move-result p3

    .line 562
    if-eqz p3, :cond_a

    .line 563
    .line 564
    iget-object p3, p2, Lcom/p1/mobile/putong/core/data/Message;->additionalData:Lcom/p1/mobile/putong/core/data/MessageAdditionalData;

    .line 565
    .line 566
    iget-object p3, p3, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->chatGiftInfo:Lcom/p1/mobile/putong/core/data/ChatGiftInfo;

    .line 567
    .line 568
    invoke-static {p3}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 569
    .line 570
    .line 571
    move-result p3

    .line 572
    if-eqz p3, :cond_a

    .line 573
    .line 574
    iget-object p3, p2, Lcom/p1/mobile/putong/core/data/Message;->additionalData:Lcom/p1/mobile/putong/core/data/MessageAdditionalData;

    .line 575
    .line 576
    iget-object p3, p3, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->chatGiftInfo:Lcom/p1/mobile/putong/core/data/ChatGiftInfo;

    .line 577
    .line 578
    iget-object p3, p3, Lcom/p1/mobile/putong/core/data/ChatGiftInfo;->id:Ljava/lang/String;

    .line 579
    .line 580
    sget-object p4, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 581
    .line 582
    iget-object p4, p4, Lcom/p1/mobile/putong/core/api/c;->f1:Ll/lu8;

    .line 583
    .line 584
    invoke-virtual {p4, p3}, Ll/lu8;->R3(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/CoreGiftInfo;

    .line 585
    .line 586
    .line 587
    :cond_a
    iget-object p3, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageLeft;->T:Landroid/widget/FrameLayout;

    .line 588
    .line 589
    new-instance p4, Ll/t9q;

    .line 590
    .line 591
    invoke-direct {p4, p0, p2}, Ll/t9q;-><init>(Lcom/p1/mobile/putong/core/ui/messages/ItemMessageLeft;Lcom/p1/mobile/putong/core/data/Message;)V

    .line 592
    .line 593
    .line 594
    invoke-static {p3, p4}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 595
    .line 596
    .line 597
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->x0(Lcom/p1/mobile/putong/core/data/Message;)V

    .line 598
    .line 599
    .line 600
    iget-object p3, p2, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 601
    .line 602
    const-string p4, "state_comment"

    .line 603
    .line 604
    invoke-static {p3, p4}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 605
    .line 606
    .line 607
    move-result p3

    .line 608
    if-nez p3, :cond_d

    .line 609
    .line 610
    iget-object p3, p2, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 611
    .line 612
    const-string p4, "state_like"

    .line 613
    .line 614
    invoke-static {p3, p4}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 615
    .line 616
    .line 617
    move-result p3

    .line 618
    if-eqz p3, :cond_b

    .line 619
    .line 620
    goto :goto_4

    .line 621
    :cond_b
    iget-object p1, p2, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 622
    .line 623
    const-string p2, "literature"

    .line 624
    .line 625
    invoke-static {p1, p2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 626
    .line 627
    .line 628
    move-result p1

    .line 629
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageLeft;->L:Landroid/widget/FrameLayout;

    .line 630
    .line 631
    if-eqz p1, :cond_c

    .line 632
    .line 633
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 634
    .line 635
    .line 636
    move-result-object p0

    .line 637
    sget p1, Ll/eac0;->f:I

    .line 638
    .line 639
    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getDimension(I)F

    .line 640
    .line 641
    .line 642
    move-result p0

    .line 643
    float-to-int p0, p0

    .line 644
    invoke-static {p2, p0}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 645
    .line 646
    .line 647
    return-void

    .line 648
    :cond_c
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 649
    .line 650
    .line 651
    move-result-object p0

    .line 652
    sget p1, Ll/eac0;->c:I

    .line 653
    .line 654
    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getDimension(I)F

    .line 655
    .line 656
    .line 657
    move-result p0

    .line 658
    float-to-int p0, p0

    .line 659
    invoke-static {p2, p0}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 660
    .line 661
    .line 662
    return-void

    .line 663
    :cond_d
    :goto_4
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 664
    .line 665
    .line 666
    move-result-object p3

    .line 667
    check-cast p3, Lcom/p1/mobile/android/app/Act;

    .line 668
    .line 669
    sget-object p4, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 670
    .line 671
    iget-object p4, p4, Lcom/p1/mobile/putong/core/api/c;->q1:Lcom/p1/mobile/putong/core/api/i;

    .line 672
    .line 673
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/data/Message;->isMe()Z

    .line 674
    .line 675
    .line 676
    move-result v1

    .line 677
    if-eqz v1, :cond_e

    .line 678
    .line 679
    iget-object v1, p2, Lcom/p1/mobile/putong/core/data/Message;->cid:Ljava/lang/String;

    .line 680
    .line 681
    goto :goto_5

    .line 682
    :cond_e
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 683
    .line 684
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 685
    .line 686
    invoke-virtual {v1}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 687
    .line 688
    .line 689
    move-result-object v1

    .line 690
    iget-object v1, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 691
    .line 692
    :goto_5
    iget-object p2, p2, Lcom/p1/mobile/putong/core/data/Message;->referenceMsgId:Ljava/lang/String;

    .line 693
    .line 694
    invoke-virtual {p4, v1, p2}, Lcom/p1/mobile/putong/core/api/i;->v3(Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 695
    .line 696
    .line 697
    move-result-object p2

    .line 698
    invoke-virtual {p2, v0}, Lrx/c;->take(I)Lrx/c;

    .line 699
    .line 700
    .line 701
    move-result-object p2

    .line 702
    invoke-interface {p1, p3, p2}, Ll/pol;->c(Ll/ner;Lrx/c;)Lrx/c;

    .line 703
    .line 704
    .line 705
    move-result-object p1

    .line 706
    new-instance p2, Ll/v9q;

    .line 707
    .line 708
    invoke-direct {p2, p0}, Ll/v9q;-><init>(Lcom/p1/mobile/putong/core/ui/messages/ItemMessageLeft;)V

    .line 709
    .line 710
    .line 711
    new-instance p0, Ll/w9q;

    .line 712
    .line 713
    invoke-direct {p0}, Ll/w9q;-><init>()V

    .line 714
    .line 715
    .line 716
    invoke-static {p2, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 717
    .line 718
    .line 719
    move-result-object p0

    .line 720
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 721
    .line 722
    .line 723
    return-void
.end method

.method public getMessageId()Ljava/lang/String;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageLeft;->J0:Lcom/p1/mobile/putong/core/data/Message;

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
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageLeft;->J0:Lcom/p1/mobile/putong/core/data/Message;

    .line 10
    .line 11
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 12
    .line 13
    return-object p0

    .line 14
    :cond_0
    const-string p0, ""

    .line 15
    .line 16
    return-object p0
.end method

.method public onClick(Landroid/view/View;)V
    .locals 5

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->X()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-nez p1, :cond_1

    .line 6
    .line 7
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->l:Ll/j49;

    .line 8
    .line 9
    invoke-virtual {p1}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->H()Lcom/p1/mobile/android/app/Act;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-interface {p1, v0}, Ll/r97;->t4(Lcom/p1/mobile/android/app/Act;)Z

    .line 18
    .line 19
    .line 20
    move-result p1

    .line 21
    if-eqz p1, :cond_0

    .line 22
    .line 23
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageLeft;->J0:Lcom/p1/mobile/putong/core/data/Message;

    .line 24
    .line 25
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/Message;->owner:Ljava/lang/String;

    .line 26
    .line 27
    const-string v0, "user_id"

    .line 28
    .line 29
    invoke-static {v0, p1}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    filled-new-array {p1}, [Ll/sfj0$a;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    const-string v0, "e_kankan_chat_head"

    .line 38
    .line 39
    const-string v1, "p_kankan_chat_popup"

    .line 40
    .line 41
    invoke-static {v0, v1, p1}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 42
    .line 43
    .line 44
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 45
    .line 46
    .line 47
    move-result-object p1

    .line 48
    invoke-virtual {p1}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->H()Lcom/p1/mobile/android/app/Act;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageLeft;->J0:Lcom/p1/mobile/putong/core/data/Message;

    .line 57
    .line 58
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Message;->owner:Ljava/lang/String;

    .line 59
    .line 60
    const-string v1, "from_greet_act"

    .line 61
    .line 62
    invoke-interface {p1, v0, v1, p0}, Ll/r97;->a4(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;)V

    .line 63
    .line 64
    .line 65
    :cond_0
    return-void

    .line 66
    :cond_1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->H()Lcom/p1/mobile/android/app/Act;

    .line 67
    .line 68
    .line 69
    move-result-object p1

    .line 70
    check-cast p1, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 71
    .line 72
    iget-object p1, p1, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->f:Ll/clz;

    .line 73
    .line 74
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->H()Lcom/p1/mobile/android/app/Act;

    .line 75
    .line 76
    .line 77
    move-result-object v0

    .line 78
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->pageId()Ljava/lang/String;

    .line 79
    .line 80
    .line 81
    move-result-object v0

    .line 82
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageLeft;->J0:Lcom/p1/mobile/putong/core/data/Message;

    .line 83
    .line 84
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/Message;->owner:Ljava/lang/String;

    .line 85
    .line 86
    const-string v2, "click_user_id"

    .line 87
    .line 88
    invoke-static {v2, v1}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 89
    .line 90
    .line 91
    move-result-object v1

    .line 92
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 93
    .line 94
    .line 95
    move-result-object v2

    .line 96
    invoke-interface {v2}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 97
    .line 98
    .line 99
    move-result-object v2

    .line 100
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageLeft;->J0:Lcom/p1/mobile/putong/core/data/Message;

    .line 101
    .line 102
    iget-object v3, v3, Lcom/p1/mobile/putong/core/data/Message;->owner:Ljava/lang/String;

    .line 103
    .line 104
    invoke-static {v2, v3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 105
    .line 106
    .line 107
    move-result v2

    .line 108
    invoke-static {v2}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    .line 109
    .line 110
    .line 111
    move-result-object v2

    .line 112
    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 113
    .line 114
    .line 115
    move-result-object v2

    .line 116
    const-string v3, "is_self_avatar"

    .line 117
    .line 118
    invoke-static {v3, v2}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 119
    .line 120
    .line 121
    move-result-object v2

    .line 122
    filled-new-array {v1, v2}, [Ll/sfj0$a;

    .line 123
    .line 124
    .line 125
    move-result-object v1

    .line 126
    const-string v2, "e_chat_avatar"

    .line 127
    .line 128
    invoke-static {v2, v0, v1}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 129
    .line 130
    .line 131
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageLeft;->J0:Lcom/p1/mobile/putong/core/data/Message;

    .line 132
    .line 133
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 134
    .line 135
    .line 136
    move-result v0

    .line 137
    if-eqz v0, :cond_3

    .line 138
    .line 139
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageLeft;->J0:Lcom/p1/mobile/putong/core/data/Message;

    .line 140
    .line 141
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/Message;->channel:Lcom/p1/mobile/putong/core/data/MessageChannel;

    .line 142
    .line 143
    const-string v1, "group"

    .line 144
    .line 145
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 146
    .line 147
    .line 148
    move-result v0

    .line 149
    if-eqz v0, :cond_3

    .line 150
    .line 151
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 152
    .line 153
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->g0:Lcom/p1/mobile/putong/core/api/e;

    .line 154
    .line 155
    invoke-virtual {p1}, Ll/clz;->r3()Ljava/lang/String;

    .line 156
    .line 157
    .line 158
    move-result-object v1

    .line 159
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/api/e;->s6(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/ChatGroup;

    .line 160
    .line 161
    .line 162
    move-result-object v0

    .line 163
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 164
    .line 165
    .line 166
    move-result v1

    .line 167
    if-eqz v1, :cond_2

    .line 168
    .line 169
    invoke-static {v0}, Ll/jek;->s(Lcom/p1/mobile/putong/core/data/ChatGroup;)Z

    .line 170
    .line 171
    .line 172
    move-result v0

    .line 173
    if-eqz v0, :cond_2

    .line 174
    .line 175
    const-string v0, "chat_group_anonymity"

    .line 176
    .line 177
    goto :goto_0

    .line 178
    :cond_2
    const-string v0, "chat_group"

    .line 179
    .line 180
    goto :goto_0

    .line 181
    :cond_3
    const-string v0, "messages_thumbnail_left"

    .line 182
    .line 183
    :goto_0
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 184
    .line 185
    .line 186
    move-result-object v1

    .line 187
    invoke-virtual {v1}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 188
    .line 189
    .line 190
    move-result-object v1

    .line 191
    invoke-interface {v1}, Ll/r97;->E()Z

    .line 192
    .line 193
    .line 194
    move-result v1

    .line 195
    if-eqz v1, :cond_6

    .line 196
    .line 197
    invoke-virtual {p1}, Ll/clz;->e4()Z

    .line 198
    .line 199
    .line 200
    move-result v1

    .line 201
    if-eqz v1, :cond_6

    .line 202
    .line 203
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 204
    .line 205
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->g0:Lcom/p1/mobile/putong/core/api/e;

    .line 206
    .line 207
    invoke-virtual {p1}, Ll/clz;->r3()Ljava/lang/String;

    .line 208
    .line 209
    .line 210
    move-result-object v2

    .line 211
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/core/api/e;->s6(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/ChatGroup;

    .line 212
    .line 213
    .line 214
    move-result-object v1

    .line 215
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 216
    .line 217
    .line 218
    move-result v2

    .line 219
    if-eqz v2, :cond_4

    .line 220
    .line 221
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/ChatGroup;->status:Lcom/p1/mobile/putong/core/data/ChatGroupStatus;

    .line 222
    .line 223
    const-string v2, "disbanded"

    .line 224
    .line 225
    invoke-static {v1, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 226
    .line 227
    .line 228
    move-result v1

    .line 229
    if-eqz v1, :cond_4

    .line 230
    .line 231
    sget p0, Lcom/p1/mobile/putong/core/message/R$string;->i0:I

    .line 232
    .line 233
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 234
    .line 235
    .line 236
    return-void

    .line 237
    :cond_4
    invoke-virtual {p1}, Ll/clz;->j3()Lcom/p1/mobile/putong/core/data/Conversation;

    .line 238
    .line 239
    .line 240
    move-result-object v1

    .line 241
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 242
    .line 243
    .line 244
    move-result v2

    .line 245
    if-eqz v2, :cond_5

    .line 246
    .line 247
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/Conversation;->status:Lcom/p1/mobile/putong/data/ConversationStatus;

    .line 248
    .line 249
    const-string v2, "blocked"

    .line 250
    .line 251
    invoke-static {v1, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 252
    .line 253
    .line 254
    move-result v1

    .line 255
    if-eqz v1, :cond_5

    .line 256
    .line 257
    sget p0, Lcom/p1/mobile/putong/core/message/R$string;->Z:I

    .line 258
    .line 259
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 260
    .line 261
    .line 262
    return-void

    .line 263
    :cond_5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->H()Lcom/p1/mobile/android/app/Act;

    .line 264
    .line 265
    .line 266
    move-result-object v1

    .line 267
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 268
    .line 269
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->g0:Lcom/p1/mobile/putong/core/api/e;

    .line 270
    .line 271
    invoke-virtual {p1}, Ll/clz;->r3()Ljava/lang/String;

    .line 272
    .line 273
    .line 274
    move-result-object v3

    .line 275
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 276
    .line 277
    .line 278
    move-result-object v4

    .line 279
    invoke-interface {v4}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 280
    .line 281
    .line 282
    move-result-object v4

    .line 283
    invoke-virtual {v2, v3, v4}, Lcom/p1/mobile/putong/core/api/e;->T6(Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 284
    .line 285
    .line 286
    move-result-object v2

    .line 287
    invoke-virtual {v1, v2}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 288
    .line 289
    .line 290
    move-result-object v1

    .line 291
    const/4 v2, 0x1

    .line 292
    invoke-virtual {v1, v2}, Lrx/c;->take(I)Lrx/c;

    .line 293
    .line 294
    .line 295
    move-result-object v1

    .line 296
    new-instance v2, Ll/q9q;

    .line 297
    .line 298
    invoke-direct {v2, p0, v0, p1}, Ll/q9q;-><init>(Lcom/p1/mobile/putong/core/ui/messages/ItemMessageLeft;Ljava/lang/String;Ll/clz;)V

    .line 299
    .line 300
    .line 301
    invoke-static {v2}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 302
    .line 303
    .line 304
    move-result-object p0

    .line 305
    invoke-virtual {v1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 306
    .line 307
    .line 308
    return-void

    .line 309
    :cond_6
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageLeft;->J0:Lcom/p1/mobile/putong/core/data/Message;

    .line 310
    .line 311
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Message;->owner:Ljava/lang/String;

    .line 312
    .line 313
    invoke-virtual {p1, v0, p0}, Ll/clz;->w6(Ljava/lang/String;Ljava/lang/String;)V

    .line 314
    .line 315
    .line 316
    return-void
.end method

.method public onFinishInflate()V
    .locals 4

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    sget v0, Ll/edc0;->u3:I

    .line 5
    .line 6
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    check-cast v0, Landroid/widget/FrameLayout;

    .line 11
    .line 12
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageLeft;->L:Landroid/widget/FrameLayout;

    .line 13
    .line 14
    sget v0, Ll/edc0;->t3:I

    .line 15
    .line 16
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    check-cast v0, Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;

    .line 21
    .line 22
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageLeft;->p0:Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;

    .line 23
    .line 24
    invoke-virtual {v0}, Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;->get_pic()Lv/VDraweeView;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageLeft;->M:Lv/VDraweeView;

    .line 29
    .line 30
    sget v0, Ll/edc0;->r5:I

    .line 31
    .line 32
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    check-cast v0, Lv/VImage;

    .line 37
    .line 38
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageLeft;->N:Lv/VImage;

    .line 39
    .line 40
    sget v0, Ll/edc0;->B4:I

    .line 41
    .line 42
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    check-cast v0, Landroid/widget/FrameLayout;

    .line 47
    .line 48
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageLeft;->S:Landroid/widget/FrameLayout;

    .line 49
    .line 50
    sget v0, Ll/edc0;->c2:I

    .line 51
    .line 52
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    check-cast v0, Lcom/p1/mobile/putong/core/ui/view/GradientBgButton;

    .line 57
    .line 58
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageLeft;->G0:Lcom/p1/mobile/putong/core/ui/view/GradientBgButton;

    .line 59
    .line 60
    sget v0, Ll/edc0;->p5:I

    .line 61
    .line 62
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    check-cast v0, Lv/VText;

    .line 67
    .line 68
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageLeft;->V:Lv/VText;

    .line 69
    .line 70
    sget v0, Ll/edc0;->S0:I

    .line 71
    .line 72
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 73
    .line 74
    .line 75
    move-result-object v0

    .line 76
    check-cast v0, Lv/VText;

    .line 77
    .line 78
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageLeft;->W:Lv/VText;

    .line 79
    .line 80
    sget v0, Ll/edc0;->X0:I

    .line 81
    .line 82
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 83
    .line 84
    .line 85
    move-result-object v0

    .line 86
    check-cast v0, Lv/VText;

    .line 87
    .line 88
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageLeft;->k0:Lv/VText;

    .line 89
    .line 90
    sget v0, Ll/edc0;->a2:I

    .line 91
    .line 92
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 93
    .line 94
    .line 95
    move-result-object v0

    .line 96
    check-cast v0, Lv/VLinear;

    .line 97
    .line 98
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageLeft;->E0:Lv/VLinear;

    .line 99
    .line 100
    sget v0, Ll/edc0;->b2:I

    .line 101
    .line 102
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 103
    .line 104
    .line 105
    move-result-object v0

    .line 106
    check-cast v0, Lv/VText;

    .line 107
    .line 108
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageLeft;->F0:Lv/VText;

    .line 109
    .line 110
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 111
    .line 112
    .line 113
    move-result-object v0

    .line 114
    invoke-virtual {v0}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 115
    .line 116
    .line 117
    move-result-object v0

    .line 118
    invoke-interface {v0}, Ll/r97;->D()Z

    .line 119
    .line 120
    .line 121
    move-result v0

    .line 122
    if-eqz v0, :cond_0

    .line 123
    .line 124
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->O()Z

    .line 125
    .line 126
    .line 127
    move-result v0

    .line 128
    if-eqz v0, :cond_0

    .line 129
    .line 130
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageLeft;->M:Lv/VDraweeView;

    .line 131
    .line 132
    new-instance v1, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageLeft$b;

    .line 133
    .line 134
    invoke-direct {v1, p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageLeft$b;-><init>(Lcom/p1/mobile/putong/core/ui/messages/ItemMessageLeft;)V

    .line 135
    .line 136
    .line 137
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageLeft;->K0:Landroid/view/View$OnLongClickListener;

    .line 138
    .line 139
    const/4 v3, 0x0

    .line 140
    invoke-static {v0, v1, p0, v2, v3}, Lcom/p1/mobile/putong/core/ui/messages/b;->s(Landroid/view/View;Lcom/p1/mobile/putong/core/ui/messages/b$c;Landroid/view/View$OnClickListener;Landroid/view/View$OnLongClickListener;Ljava/lang/Runnable;)V

    .line 141
    .line 142
    .line 143
    goto :goto_0

    .line 144
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageLeft;->M:Lv/VDraweeView;

    .line 145
    .line 146
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageLeft;->K0:Landroid/view/View$OnLongClickListener;

    .line 147
    .line 148
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 149
    .line 150
    .line 151
    :goto_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageLeft;->M:Lv/VDraweeView;

    .line 152
    .line 153
    invoke-static {v0, p0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 154
    .line 155
    .line 156
    sget v0, Ll/edc0;->I1:I

    .line 157
    .line 158
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 159
    .line 160
    .line 161
    move-result-object v0

    .line 162
    check-cast v0, Landroid/widget/FrameLayout;

    .line 163
    .line 164
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageLeft;->O:Landroid/widget/FrameLayout;

    .line 165
    .line 166
    sget v1, Ll/edc0;->i0:I

    .line 167
    .line 168
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 169
    .line 170
    .line 171
    move-result-object v0

    .line 172
    check-cast v0, Lv/VDraweeView;

    .line 173
    .line 174
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageLeft;->P:Lv/VDraweeView;

    .line 175
    .line 176
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageLeft;->O:Landroid/widget/FrameLayout;

    .line 177
    .line 178
    sget v1, Ll/edc0;->j0:I

    .line 179
    .line 180
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 181
    .line 182
    .line 183
    move-result-object v0

    .line 184
    check-cast v0, Lv/VDraweeView;

    .line 185
    .line 186
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageLeft;->Q:Lv/VDraweeView;

    .line 187
    .line 188
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageLeft;->O:Landroid/widget/FrameLayout;

    .line 189
    .line 190
    sget v1, Ll/edc0;->k0:I

    .line 191
    .line 192
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 193
    .line 194
    .line 195
    move-result-object v0

    .line 196
    check-cast v0, Lv/VText;

    .line 197
    .line 198
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageLeft;->R:Lv/VText;

    .line 199
    .line 200
    sget v0, Ll/edc0;->H1:I

    .line 201
    .line 202
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 203
    .line 204
    .line 205
    move-result-object v0

    .line 206
    check-cast v0, Landroid/widget/FrameLayout;

    .line 207
    .line 208
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageLeft;->T:Landroid/widget/FrameLayout;

    .line 209
    .line 210
    sget v0, Ll/edc0;->y:I

    .line 211
    .line 212
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 213
    .line 214
    .line 215
    move-result-object v0

    .line 216
    check-cast v0, Lv/VText;

    .line 217
    .line 218
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageLeft;->U:Lv/VText;

    .line 219
    .line 220
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 221
    .line 222
    .line 223
    move-result-object v0

    .line 224
    invoke-virtual {v0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 225
    .line 226
    .line 227
    move-result-object v0

    .line 228
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->I4()Z

    .line 229
    .line 230
    .line 231
    move-result v0

    .line 232
    if-eqz v0, :cond_1

    .line 233
    .line 234
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageLeft;->W:Lv/VText;

    .line 235
    .line 236
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 237
    .line 238
    .line 239
    move-result-object v1

    .line 240
    sget v2, Ll/g9c0;->i:I

    .line 241
    .line 242
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    .line 243
    .line 244
    .line 245
    move-result v1

    .line 246
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 247
    .line 248
    .line 249
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageLeft;->U:Lv/VText;

    .line 250
    .line 251
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 252
    .line 253
    .line 254
    move-result-object v1

    .line 255
    sget v2, Ll/g9c0;->i:I

    .line 256
    .line 257
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    .line 258
    .line 259
    .line 260
    move-result v1

    .line 261
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 262
    .line 263
    .line 264
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageLeft;->k0:Lv/VText;

    .line 265
    .line 266
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 267
    .line 268
    .line 269
    move-result-object v1

    .line 270
    sget v2, Ll/g9c0;->i:I

    .line 271
    .line 272
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    .line 273
    .line 274
    .line 275
    move-result v1

    .line 276
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 277
    .line 278
    .line 279
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageLeft;->R:Lv/VText;

    .line 280
    .line 281
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 282
    .line 283
    .line 284
    move-result-object p0

    .line 285
    sget v1, Ll/g9c0;->i:I

    .line 286
    .line 287
    invoke-virtual {p0, v1}, Landroid/content/res/Resources;->getColor(I)I

    .line 288
    .line 289
    .line 290
    move-result p0

    .line 291
    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 292
    .line 293
    .line 294
    :cond_1
    return-void
.end method

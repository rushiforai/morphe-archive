.class public Lcom/p1/mobile/putong/core/ui/main/ConversationView;
.super Landroid/widget/LinearLayout;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;
.implements Landroid/view/View$OnLongClickListener;


# instance fields
.field public a:Lcom/p1/mobile/putong/core/ui/main/ConversationView;

.field public b:Lv/VDraweeView;

.field public c:Landroid/widget/ImageView;

.field public d:Lv/TickerView;

.field public e:Landroid/widget/ImageView;

.field public f:Landroid/widget/ImageView;

.field public g:Landroid/widget/ImageView;

.field public h:Landroid/widget/ImageView;

.field public i:Lcom/p1/mobile/putong/core/ui/view/GradientBgButton;

.field public j:Lv/VDraweeView;

.field public k:Lv/VText;

.field public l:Lv/VText;

.field public m:Landroid/widget/ImageView;

.field public n:Landroid/widget/ImageView;

.field public o:Lv/VText;

.field public p:Lv/VText;

.field public q:Lcom/p1/mobile/putong/core/data/Conversation;

.field public r:Lcom/p1/mobile/putong/data/User;

.field public s:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public t:I

.field public u:I

.field public v:I

.field public w:Z

.field public x:Z

.field public y:Z

.field public z:Ll/ft5;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, -0x2

    .line 5
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/main/ConversationView;->v:I

    .line 6
    .line 7
    new-instance p1, Ll/ft5;

    .line 8
    .line 9
    invoke-direct {p1}, Ll/ft5;-><init>()V

    .line 10
    .line 11
    .line 12
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/main/ConversationView;->z:Ll/ft5;

    .line 13
    .line 14
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 15
    invoke-direct {p0, p1, p2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 p1, -0x2

    .line 16
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/main/ConversationView;->v:I

    .line 17
    new-instance p1, Ll/ft5;

    invoke-direct {p1}, Ll/ft5;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/main/ConversationView;->z:Ll/ft5;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 18
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p1, -0x2

    .line 19
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/main/ConversationView;->v:I

    .line 20
    new-instance p1, Ll/ft5;

    invoke-direct {p1}, Ll/ft5;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/main/ConversationView;->z:Ll/ft5;

    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/data/User;Ll/vg60;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/data/Conversation;Ll/pf60;)Ll/pf60;
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    new-instance p1, Ll/bkj0;

    .line 6
    .line 7
    invoke-direct {p1, p2, p3, p4}, Ll/bkj0;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 8
    .line 9
    .line 10
    invoke-static {p0, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    return-object p0
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/core/ui/main/ConversationView;Ll/pf60;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/main/ConversationView;->i(Ll/pf60;)V

    return-void
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/core/ui/main/ConversationView;Lcom/p1/mobile/android/app/Dialog;Landroid/view/View;ILjava/lang/CharSequence;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/p1/mobile/putong/core/ui/main/ConversationView;->h(Lcom/p1/mobile/android/app/Dialog;Landroid/view/View;ILjava/lang/CharSequence;)V

    return-void
.end method

.method public static g(Lcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/putong/data/Picture$ImageUri;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public static k(Lcom/p1/mobile/putong/core/data/Conversation;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Conversation;->otherUser:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {v0, p0}, Ll/dkb;->Pa(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 18
    .line 19
    invoke-static {p0}, Lcom/p1/mobile/putong/core/ui/main/ConversationView;->g(Lcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-virtual {v0, p0}, Ll/fsb0;->z0(Lcom/p1/mobile/putong/data/Picture$ImageUri;)V

    .line 24
    .line 25
    .line 26
    :cond_0
    return-void
.end method

.method private setMessageText(I)V
    .locals 1
    .param p1    # I
        .annotation build Landroidx/annotation/StringRes;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/main/ConversationView;->e()Lcom/p1/mobile/putong/app/PutongAct;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0, p1}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/main/ConversationView;->setMessageText(Ljava/lang/CharSequence;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method private setMessageText(Ljava/lang/CharSequence;)V
    .locals 0

    .line 13
    invoke-static {p1}, Ll/hxj0;->c(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object p1

    .line 14
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/main/ConversationView;->o:Lv/VText;

    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method


# virtual methods
.method public final d(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/tm6;->a(Lcom/p1/mobile/putong/core/ui/main/ConversationView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public e()Lcom/p1/mobile/putong/app/PutongAct;
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Lcom/p1/mobile/putong/app/PutongAct;

    .line 6
    .line 7
    return-object p0
.end method

.method public final f(Lcom/p1/mobile/putong/data/User;)Z
    .locals 1

    .line 1
    iget-object p0, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-interface {v0}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    const/4 v0, 0x0

    .line 16
    if-nez p0, :cond_1

    .line 17
    .line 18
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isTeamAccount()Z

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    if-eqz p0, :cond_0

    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_0
    iget-object p0, p1, Lcom/p1/mobile/putong/data/User;->localRelationship:Lcom/p1/mobile/putong/data/Relationship;

    .line 26
    .line 27
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    move-result p0

    .line 31
    if-eqz p0, :cond_1

    .line 32
    .line 33
    iget-object p0, p1, Lcom/p1/mobile/putong/data/User;->localRelationship:Lcom/p1/mobile/putong/data/Relationship;

    .line 34
    .line 35
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Relationship;->status:Ljava/util/List;

    .line 36
    .line 37
    const-string p1, "boostBadge"

    .line 38
    .line 39
    invoke-static {p1}, Lcom/p1/mobile/putong/data/MatchFrom;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/MatchFrom;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    invoke-interface {p0, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 44
    .line 45
    .line 46
    move-result p0

    .line 47
    if-eqz p0, :cond_1

    .line 48
    .line 49
    const/4 p0, 0x1

    .line 50
    return p0

    .line 51
    :cond_1
    :goto_0
    return v0
.end method

.method public final synthetic h(Lcom/p1/mobile/android/app/Dialog;Landroid/view/View;ILjava/lang/CharSequence;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/main/ConversationView;->e()Lcom/p1/mobile/putong/app/PutongAct;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    sget p2, Lcom/p1/mobile/putong/core/message/R$string;->v6:I

    .line 6
    .line 7
    invoke-virtual {p1, p2}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    invoke-virtual {p4, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    if-eqz p1, :cond_1

    .line 16
    .line 17
    const-string p1, "e_match_list_set_nickname"

    .line 18
    .line 19
    const-string p2, "p_messages_view"

    .line 20
    .line 21
    invoke-static {p1, p2}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 25
    .line 26
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 27
    .line 28
    invoke-virtual {p1}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isVIP()Z

    .line 33
    .line 34
    .line 35
    move-result p1

    .line 36
    if-eqz p1, :cond_0

    .line 37
    .line 38
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/main/ConversationView;->e()Lcom/p1/mobile/putong/app/PutongAct;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/main/ConversationView;->e()Lcom/p1/mobile/putong/app/PutongAct;

    .line 43
    .line 44
    .line 45
    move-result-object p2

    .line 46
    sget-object p3, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 47
    .line 48
    iget-object p3, p3, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 49
    .line 50
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/main/ConversationView;->q:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 51
    .line 52
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Conversation;->otherUser:Ljava/lang/String;

    .line 53
    .line 54
    invoke-virtual {p3, p0}, Ll/dkb;->Pa(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 55
    .line 56
    .line 57
    move-result-object p0

    .line 58
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 59
    .line 60
    invoke-static {p2, p0}, Lcom/p1/mobile/putong/core/newui/messages/SetNicknameAct;->Z1(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    invoke-virtual {p1, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 65
    .line 66
    .line 67
    return-void

    .line 68
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 69
    .line 70
    .line 71
    move-result-object p1

    .line 72
    invoke-virtual {p1}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 73
    .line 74
    .line 75
    move-result-object p1

    .line 76
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/main/ConversationView;->e()Lcom/p1/mobile/putong/app/PutongAct;

    .line 77
    .line 78
    .line 79
    move-result-object p0

    .line 80
    const-string p2, "p_messages_view,e_match_list_set_nickname,click"

    .line 81
    .line 82
    sget-object p3, Lcom/p1/mobile/putong/core/data/Privilege;->vip_membership_remark_gp:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 83
    .line 84
    invoke-interface {p1, p0, p2, p3}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->i6(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Privilege;)V

    .line 85
    .line 86
    .line 87
    return-void

    .line 88
    :cond_1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/main/ConversationView;->e()Lcom/p1/mobile/putong/app/PutongAct;

    .line 89
    .line 90
    .line 91
    move-result-object p1

    .line 92
    sget p2, Lcom/p1/mobile/putong/core/message/R$string;->w5:I

    .line 93
    .line 94
    invoke-virtual {p1, p2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 95
    .line 96
    .line 97
    move-result-object p1

    .line 98
    invoke-virtual {p4, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 99
    .line 100
    .line 101
    move-result p1

    .line 102
    if-eqz p1, :cond_3

    .line 103
    .line 104
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 105
    .line 106
    .line 107
    move-result-object p1

    .line 108
    invoke-virtual {p1}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 109
    .line 110
    .line 111
    move-result-object p1

    .line 112
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/main/ConversationView;->e()Lcom/p1/mobile/putong/app/PutongAct;

    .line 113
    .line 114
    .line 115
    move-result-object p2

    .line 116
    iget-object p3, p0, Lcom/p1/mobile/putong/core/ui/main/ConversationView;->q:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 117
    .line 118
    iget-object p3, p3, Lcom/p1/mobile/putong/core/data/Conversation;->otherUser:Ljava/lang/String;

    .line 119
    .line 120
    iget p0, p0, Lcom/p1/mobile/putong/core/ui/main/ConversationView;->t:I

    .line 121
    .line 122
    if-nez p0, :cond_2

    .line 123
    .line 124
    const-string p0, "message_allmatch"

    .line 125
    .line 126
    goto :goto_0

    .line 127
    :cond_2
    const-string p0, "chat_list"

    .line 128
    .line 129
    :goto_0
    invoke-interface {p1, p2, p3, p0}, Ll/r97;->Y5(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;)V

    .line 130
    .line 131
    .line 132
    return-void

    .line 133
    :cond_3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/main/ConversationView;->e()Lcom/p1/mobile/putong/app/PutongAct;

    .line 134
    .line 135
    .line 136
    move-result-object p1

    .line 137
    sget p2, Lcom/p1/mobile/putong/core/message/R$string;->v5:I

    .line 138
    .line 139
    invoke-virtual {p1, p2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 140
    .line 141
    .line 142
    move-result-object p1

    .line 143
    invoke-virtual {p4, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 144
    .line 145
    .line 146
    move-result p1

    .line 147
    if-eqz p1, :cond_4

    .line 148
    .line 149
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 150
    .line 151
    .line 152
    move-result-object p1

    .line 153
    invoke-virtual {p1}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 154
    .line 155
    .line 156
    move-result-object p1

    .line 157
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/main/ConversationView;->e()Lcom/p1/mobile/putong/app/PutongAct;

    .line 158
    .line 159
    .line 160
    move-result-object p2

    .line 161
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/main/ConversationView;->q:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 162
    .line 163
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Conversation;->otherUser:Ljava/lang/String;

    .line 164
    .line 165
    const/4 p3, 0x0

    .line 166
    invoke-interface {p1, p2, p0, p3, p3}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->eo(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ll/x20;Ll/x20;)V

    .line 167
    .line 168
    .line 169
    :cond_4
    return-void
.end method

.method public final synthetic i(Ll/pf60;)V
    .locals 9

    .line 1
    iget-object v0, p1, Ll/pf60;->a:Ljava/lang/Object;

    .line 2
    .line 3
    move-object v1, v0

    .line 4
    check-cast v1, Ll/pf60;

    .line 5
    .line 6
    iget-object v1, v1, Ll/pf60;->a:Ljava/lang/Object;

    .line 7
    .line 8
    check-cast v1, Lcom/p1/mobile/putong/data/User;

    .line 9
    .line 10
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/main/ConversationView;->r:Lcom/p1/mobile/putong/data/User;

    .line 11
    .line 12
    check-cast v0, Ll/pf60;

    .line 13
    .line 14
    iget-object v0, v0, Ll/pf60;->b:Ljava/lang/Object;

    .line 15
    .line 16
    check-cast v0, Ll/vg60;

    .line 17
    .line 18
    iget-object v0, v0, Ll/vg60;->a:Ljava/util/List;

    .line 19
    .line 20
    iget-object v2, p1, Ll/pf60;->b:Ljava/lang/Object;

    .line 21
    .line 22
    move-object v3, v2

    .line 23
    check-cast v3, Ll/bkj0;

    .line 24
    .line 25
    iget-object v3, v3, Ll/bkj0;->a:Ljava/lang/Object;

    .line 26
    .line 27
    check-cast v3, Lcom/p1/mobile/putong/data/User;

    .line 28
    .line 29
    check-cast v2, Ll/bkj0;

    .line 30
    .line 31
    iget-object v2, v2, Ll/bkj0;->b:Ljava/lang/Object;

    .line 32
    .line 33
    check-cast v2, Lcom/p1/mobile/putong/core/data/Conversation;

    .line 34
    .line 35
    iget-object v2, v2, Lcom/p1/mobile/putong/core/data/Conversation;->reminder:Lcom/p1/mobile/putong/core/data/Reminder;

    .line 36
    .line 37
    invoke-virtual {p0, v0, v1, v3, v2}, Lcom/p1/mobile/putong/core/ui/main/ConversationView;->l(Ljava/util/List;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/data/Reminder;)V

    .line 38
    .line 39
    .line 40
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/main/ConversationView;->m:Landroid/widget/ImageView;

    .line 41
    .line 42
    const/4 v2, 0x0

    .line 43
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 44
    .line 45
    .line 46
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/main/ConversationView;->l:Lv/VText;

    .line 47
    .line 48
    invoke-static {v0, v2}, Ll/bnl0;->e0(Landroid/view/View;I)V

    .line 49
    .line 50
    .line 51
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/main/ConversationView;->l:Lv/VText;

    .line 52
    .line 53
    iget-object v3, v1, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 54
    .line 55
    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 56
    .line 57
    .line 58
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 59
    .line 60
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 61
    .line 62
    iget-object v3, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 63
    .line 64
    invoke-virtual {v0, v3}, Ll/dkb;->y7(Ljava/lang/String;)Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 69
    .line 70
    .line 71
    move-result v3

    .line 72
    if-nez v3, :cond_0

    .line 73
    .line 74
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/main/ConversationView;->l:Lv/VText;

    .line 75
    .line 76
    invoke-virtual {v3, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 77
    .line 78
    .line 79
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/main/ConversationView;->l:Lv/VText;

    .line 80
    .line 81
    invoke-virtual {v0}, Landroid/view/View;->requestLayout()V

    .line 82
    .line 83
    .line 84
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/main/ConversationView;->j:Lv/VDraweeView;

    .line 85
    .line 86
    const/16 v3, 0x8

    .line 87
    .line 88
    invoke-virtual {v0, v3}, Landroid/view/View;->setVisibility(I)V

    .line 89
    .line 90
    .line 91
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 92
    .line 93
    .line 94
    move-result-object v0

    .line 95
    invoke-virtual {v0}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 96
    .line 97
    .line 98
    move-result-object v0

    .line 99
    invoke-interface {v0}, Ll/r97;->c()Z

    .line 100
    .line 101
    .line 102
    move-result v0

    .line 103
    const/4 v4, 0x1

    .line 104
    if-eqz v0, :cond_2

    .line 105
    .line 106
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/User;->onlineMatchLocked()Z

    .line 107
    .line 108
    .line 109
    move-result v0

    .line 110
    if-eqz v0, :cond_2

    .line 111
    .line 112
    iget-object p1, p1, Ll/pf60;->b:Ljava/lang/Object;

    .line 113
    .line 114
    check-cast p1, Ll/bkj0;

    .line 115
    .line 116
    iget-object p1, p1, Ll/bkj0;->c:Ljava/lang/Object;

    .line 117
    .line 118
    check-cast p1, Ll/pf60;

    .line 119
    .line 120
    iget-object p1, p1, Ll/pf60;->a:Ljava/lang/Object;

    .line 121
    .line 122
    check-cast p1, Ljava/lang/Integer;

    .line 123
    .line 124
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 125
    .line 126
    .line 127
    move-result p1

    .line 128
    const/16 v0, 0x64

    .line 129
    .line 130
    if-ne p1, v0, :cond_1

    .line 131
    .line 132
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/main/ConversationView;->k:Lv/VText;

    .line 133
    .line 134
    invoke-static {p1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 135
    .line 136
    .line 137
    sget-object p1, Ll/uqb0;->G:Ll/fsb0;

    .line 138
    .line 139
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/main/ConversationView;->b:Lv/VDraweeView;

    .line 140
    .line 141
    invoke-static {v1}, Lcom/p1/mobile/putong/core/ui/main/ConversationView;->g(Lcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 142
    .line 143
    .line 144
    move-result-object v5

    .line 145
    invoke-virtual {p1, v0, v5}, Ll/fsb0;->Q0(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;)V

    .line 146
    .line 147
    .line 148
    goto :goto_0

    .line 149
    :cond_1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 150
    .line 151
    .line 152
    move-result-object v0

    .line 153
    invoke-virtual {v0}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 154
    .line 155
    .line 156
    move-result-object v0

    .line 157
    invoke-interface {v0, p1}, Ll/r97;->r5(I)Ll/pf60;

    .line 158
    .line 159
    .line 160
    move-result-object v0

    .line 161
    sget-object v5, Ll/uqb0;->G:Ll/fsb0;

    .line 162
    .line 163
    iget-object v6, p0, Lcom/p1/mobile/putong/core/ui/main/ConversationView;->b:Lv/VDraweeView;

    .line 164
    .line 165
    invoke-static {v1}, Lcom/p1/mobile/putong/core/ui/main/ConversationView;->g(Lcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 166
    .line 167
    .line 168
    move-result-object v7

    .line 169
    invoke-virtual {v7}, Lcom/p1/mobile/putong/data/Picture$ImageUri;->formatted()Ljava/lang/String;

    .line 170
    .line 171
    .line 172
    move-result-object v7

    .line 173
    iget-object v8, v0, Ll/pf60;->a:Ljava/lang/Object;

    .line 174
    .line 175
    check-cast v8, Ljava/lang/Integer;

    .line 176
    .line 177
    invoke-virtual {v8}, Ljava/lang/Integer;->intValue()I

    .line 178
    .line 179
    .line 180
    move-result v8

    .line 181
    iget-object v0, v0, Ll/pf60;->b:Ljava/lang/Object;

    .line 182
    .line 183
    check-cast v0, Ljava/lang/Integer;

    .line 184
    .line 185
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 186
    .line 187
    .line 188
    move-result v0

    .line 189
    invoke-virtual {v5, v6, v7, v8, v0}, Ll/fsb0;->O(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;II)V

    .line 190
    .line 191
    .line 192
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/main/ConversationView;->k:Lv/VText;

    .line 193
    .line 194
    invoke-static {v0, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 195
    .line 196
    .line 197
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/main/ConversationView;->k:Lv/VText;

    .line 198
    .line 199
    new-instance v5, Ljava/lang/StringBuilder;

    .line 200
    .line 201
    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    .line 202
    .line 203
    .line 204
    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 205
    .line 206
    .line 207
    const-string p1, "%"

    .line 208
    .line 209
    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 210
    .line 211
    .line 212
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 213
    .line 214
    .line 215
    move-result-object p1

    .line 216
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 217
    .line 218
    .line 219
    goto :goto_0

    .line 220
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/main/ConversationView;->k:Lv/VText;

    .line 221
    .line 222
    invoke-static {p1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 223
    .line 224
    .line 225
    sget-object p1, Ll/uqb0;->G:Ll/fsb0;

    .line 226
    .line 227
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/main/ConversationView;->b:Lv/VDraweeView;

    .line 228
    .line 229
    invoke-static {v1}, Lcom/p1/mobile/putong/core/ui/main/ConversationView;->g(Lcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 230
    .line 231
    .line 232
    move-result-object v5

    .line 233
    invoke-virtual {p1, v0, v5}, Ll/fsb0;->Q0(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;)V

    .line 234
    .line 235
    .line 236
    :goto_0
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 237
    .line 238
    .line 239
    move-result-object p1

    .line 240
    invoke-virtual {p1}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 241
    .line 242
    .line 243
    move-result-object p1

    .line 244
    invoke-interface {p1}, Ll/r97;->c()Z

    .line 245
    .line 246
    .line 247
    move-result p1

    .line 248
    const/4 v0, 0x0

    .line 249
    if-eqz p1, :cond_3

    .line 250
    .line 251
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/User;->onlineMatch()Z

    .line 252
    .line 253
    .line 254
    move-result p1

    .line 255
    if-eqz p1, :cond_3

    .line 256
    .line 257
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/main/ConversationView;->i:Lcom/p1/mobile/putong/core/ui/view/GradientBgButton;

    .line 258
    .line 259
    invoke-virtual {p1, v2}, Landroid/view/View;->setVisibility(I)V

    .line 260
    .line 261
    .line 262
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/main/ConversationView;->i:Lcom/p1/mobile/putong/core/ui/view/GradientBgButton;

    .line 263
    .line 264
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/core/ui/view/ShadowButton;->setBordersize(F)V

    .line 265
    .line 266
    .line 267
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/main/ConversationView;->i:Lcom/p1/mobile/putong/core/ui/view/GradientBgButton;

    .line 268
    .line 269
    invoke-virtual {p1, v4}, Lcom/p1/mobile/putong/core/ui/view/GradientBgButton;->setEmpty(Z)V

    .line 270
    .line 271
    .line 272
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/main/ConversationView;->i:Lcom/p1/mobile/putong/core/ui/view/GradientBgButton;

    .line 273
    .line 274
    invoke-virtual {p1, v2}, Lcom/p1/mobile/putong/core/ui/view/GradientBgButton;->setButtonColorAngle(I)V

    .line 275
    .line 276
    .line 277
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/main/ConversationView;->i:Lcom/p1/mobile/putong/core/ui/view/GradientBgButton;

    .line 278
    .line 279
    sget p1, Ll/ibc0;->e7:I

    .line 280
    .line 281
    invoke-virtual {p0, p1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 282
    .line 283
    .line 284
    return-void

    .line 285
    :cond_3
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/User;->unilateralBlock()Z

    .line 286
    .line 287
    .line 288
    move-result p1

    .line 289
    const/high16 v5, 0x3fc00000    # 1.5f

    .line 290
    .line 291
    if-eqz p1, :cond_5

    .line 292
    .line 293
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/User;->isPicVerificationVerified()Z

    .line 294
    .line 295
    .line 296
    move-result p1

    .line 297
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/main/ConversationView;->i:Lcom/p1/mobile/putong/core/ui/view/GradientBgButton;

    .line 298
    .line 299
    if-eqz p1, :cond_4

    .line 300
    .line 301
    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 302
    .line 303
    .line 304
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/main/ConversationView;->i:Lcom/p1/mobile/putong/core/ui/view/GradientBgButton;

    .line 305
    .line 306
    invoke-static {v5}, Ll/qa00;->d(F)I

    .line 307
    .line 308
    .line 309
    move-result v0

    .line 310
    int-to-float v0, v0

    .line 311
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/core/ui/view/ShadowButton;->setBordersize(F)V

    .line 312
    .line 313
    .line 314
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/main/ConversationView;->i:Lcom/p1/mobile/putong/core/ui/view/GradientBgButton;

    .line 315
    .line 316
    invoke-virtual {p1, v2}, Lcom/p1/mobile/putong/core/ui/view/GradientBgButton;->setEmpty(Z)V

    .line 317
    .line 318
    .line 319
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/main/ConversationView;->i:Lcom/p1/mobile/putong/core/ui/view/GradientBgButton;

    .line 320
    .line 321
    invoke-virtual {p1, v2}, Lcom/p1/mobile/putong/core/ui/view/GradientBgButton;->setButtonColorAngle(I)V

    .line 322
    .line 323
    .line 324
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/main/ConversationView;->i:Lcom/p1/mobile/putong/core/ui/view/GradientBgButton;

    .line 325
    .line 326
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 327
    .line 328
    .line 329
    move-result-object v0

    .line 330
    sget v1, Ll/ibc0;->d7:I

    .line 331
    .line 332
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 333
    .line 334
    .line 335
    move-result-object v0

    .line 336
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/core/ui/view/ShadowButton;->setIcon(Landroid/graphics/drawable/Drawable;)V

    .line 337
    .line 338
    .line 339
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/main/ConversationView;->i:Lcom/p1/mobile/putong/core/ui/view/GradientBgButton;

    .line 340
    .line 341
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/main/ConversationView;->e()Lcom/p1/mobile/putong/app/PutongAct;

    .line 342
    .line 343
    .line 344
    move-result-object v0

    .line 345
    sget v1, Ll/g9c0;->Q:I

    .line 346
    .line 347
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->color(I)I

    .line 348
    .line 349
    .line 350
    move-result v0

    .line 351
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/core/ui/view/GradientBgButton;->setButtonColorStart(I)V

    .line 352
    .line 353
    .line 354
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/main/ConversationView;->i:Lcom/p1/mobile/putong/core/ui/view/GradientBgButton;

    .line 355
    .line 356
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/main/ConversationView;->e()Lcom/p1/mobile/putong/app/PutongAct;

    .line 357
    .line 358
    .line 359
    move-result-object v0

    .line 360
    sget v1, Ll/g9c0;->P:I

    .line 361
    .line 362
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->color(I)I

    .line 363
    .line 364
    .line 365
    move-result v0

    .line 366
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/core/ui/view/GradientBgButton;->setButtonColorEnd(I)V

    .line 367
    .line 368
    .line 369
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/main/ConversationView;->i:Lcom/p1/mobile/putong/core/ui/view/GradientBgButton;

    .line 370
    .line 371
    invoke-virtual {p0, v2}, Landroid/view/View;->setBackgroundResource(I)V

    .line 372
    .line 373
    .line 374
    return-void

    .line 375
    :cond_4
    invoke-virtual {v0, v3}, Landroid/view/View;->setVisibility(I)V

    .line 376
    .line 377
    .line 378
    return-void

    .line 379
    :cond_5
    iget-object p1, v1, Lcom/p1/mobile/putong/data/User;->localRelationship:Lcom/p1/mobile/putong/data/Relationship;

    .line 380
    .line 381
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 382
    .line 383
    .line 384
    move-result p1

    .line 385
    if-eqz p1, :cond_6

    .line 386
    .line 387
    iget-object p1, v1, Lcom/p1/mobile/putong/data/User;->localRelationship:Lcom/p1/mobile/putong/data/Relationship;

    .line 388
    .line 389
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Relationship;->status:Ljava/util/List;

    .line 390
    .line 391
    const-string v3, "picks"

    .line 392
    .line 393
    invoke-static {v3}, Lcom/p1/mobile/putong/data/MatchFrom;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/MatchFrom;

    .line 394
    .line 395
    .line 396
    move-result-object v3

    .line 397
    invoke-interface {p1, v3}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 398
    .line 399
    .line 400
    move-result p1

    .line 401
    if-eqz p1, :cond_6

    .line 402
    .line 403
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/main/ConversationView;->i:Lcom/p1/mobile/putong/core/ui/view/GradientBgButton;

    .line 404
    .line 405
    invoke-virtual {p1, v2}, Landroid/view/View;->setVisibility(I)V

    .line 406
    .line 407
    .line 408
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/main/ConversationView;->i:Lcom/p1/mobile/putong/core/ui/view/GradientBgButton;

    .line 409
    .line 410
    invoke-static {v5}, Ll/qa00;->d(F)I

    .line 411
    .line 412
    .line 413
    move-result v0

    .line 414
    int-to-float v0, v0

    .line 415
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/core/ui/view/ShadowButton;->setBordersize(F)V

    .line 416
    .line 417
    .line 418
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/main/ConversationView;->i:Lcom/p1/mobile/putong/core/ui/view/GradientBgButton;

    .line 419
    .line 420
    invoke-virtual {p1, v2}, Lcom/p1/mobile/putong/core/ui/view/GradientBgButton;->setEmpty(Z)V

    .line 421
    .line 422
    .line 423
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/main/ConversationView;->i:Lcom/p1/mobile/putong/core/ui/view/GradientBgButton;

    .line 424
    .line 425
    invoke-virtual {p1, v2}, Lcom/p1/mobile/putong/core/ui/view/GradientBgButton;->setButtonColorAngle(I)V

    .line 426
    .line 427
    .line 428
    sget p1, Ll/ibc0;->M7:I

    .line 429
    .line 430
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/main/ConversationView;->e()Lcom/p1/mobile/putong/app/PutongAct;

    .line 431
    .line 432
    .line 433
    move-result-object v0

    .line 434
    sget v1, Ll/g9c0;->O:I

    .line 435
    .line 436
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->color(I)I

    .line 437
    .line 438
    .line 439
    move-result v0

    .line 440
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/main/ConversationView;->e()Lcom/p1/mobile/putong/app/PutongAct;

    .line 441
    .line 442
    .line 443
    move-result-object v1

    .line 444
    sget v3, Ll/g9c0;->O:I

    .line 445
    .line 446
    invoke-virtual {v1, v3}, Lcom/p1/mobile/android/app/Act;->color(I)I

    .line 447
    .line 448
    .line 449
    move-result v1

    .line 450
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/main/ConversationView;->i:Lcom/p1/mobile/putong/core/ui/view/GradientBgButton;

    .line 451
    .line 452
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 453
    .line 454
    .line 455
    move-result-object v4

    .line 456
    invoke-virtual {v4, p1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 457
    .line 458
    .line 459
    move-result-object p1

    .line 460
    invoke-virtual {v3, p1}, Lcom/p1/mobile/putong/core/ui/view/ShadowButton;->setIcon(Landroid/graphics/drawable/Drawable;)V

    .line 461
    .line 462
    .line 463
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/main/ConversationView;->i:Lcom/p1/mobile/putong/core/ui/view/GradientBgButton;

    .line 464
    .line 465
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/core/ui/view/GradientBgButton;->setButtonColorStart(I)V

    .line 466
    .line 467
    .line 468
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/main/ConversationView;->i:Lcom/p1/mobile/putong/core/ui/view/GradientBgButton;

    .line 469
    .line 470
    invoke-virtual {p1, v1}, Lcom/p1/mobile/putong/core/ui/view/GradientBgButton;->setButtonColorEnd(I)V

    .line 471
    .line 472
    .line 473
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/main/ConversationView;->i:Lcom/p1/mobile/putong/core/ui/view/GradientBgButton;

    .line 474
    .line 475
    invoke-virtual {p0, v2}, Landroid/view/View;->setBackgroundResource(I)V

    .line 476
    .line 477
    .line 478
    return-void

    .line 479
    :cond_6
    iget-object p1, v1, Lcom/p1/mobile/putong/data/User;->localRelationship:Lcom/p1/mobile/putong/data/Relationship;

    .line 480
    .line 481
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 482
    .line 483
    .line 484
    move-result p1

    .line 485
    if-eqz p1, :cond_7

    .line 486
    .line 487
    iget-object p1, v1, Lcom/p1/mobile/putong/data/User;->localRelationship:Lcom/p1/mobile/putong/data/Relationship;

    .line 488
    .line 489
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Relationship;->status:Ljava/util/List;

    .line 490
    .line 491
    const-string v3, "superLiked"

    .line 492
    .line 493
    invoke-static {v3}, Lcom/p1/mobile/putong/data/MatchFrom;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/MatchFrom;

    .line 494
    .line 495
    .line 496
    move-result-object v3

    .line 497
    invoke-interface {p1, v3}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 498
    .line 499
    .line 500
    move-result p1

    .line 501
    if-eqz p1, :cond_7

    .line 502
    .line 503
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/main/ConversationView;->i:Lcom/p1/mobile/putong/core/ui/view/GradientBgButton;

    .line 504
    .line 505
    invoke-virtual {p1, v2}, Landroid/view/View;->setVisibility(I)V

    .line 506
    .line 507
    .line 508
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/main/ConversationView;->i:Lcom/p1/mobile/putong/core/ui/view/GradientBgButton;

    .line 509
    .line 510
    invoke-static {v5}, Ll/qa00;->d(F)I

    .line 511
    .line 512
    .line 513
    move-result v0

    .line 514
    int-to-float v0, v0

    .line 515
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/core/ui/view/ShadowButton;->setBordersize(F)V

    .line 516
    .line 517
    .line 518
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/main/ConversationView;->i:Lcom/p1/mobile/putong/core/ui/view/GradientBgButton;

    .line 519
    .line 520
    invoke-virtual {p1, v2}, Lcom/p1/mobile/putong/core/ui/view/GradientBgButton;->setEmpty(Z)V

    .line 521
    .line 522
    .line 523
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/main/ConversationView;->i:Lcom/p1/mobile/putong/core/ui/view/GradientBgButton;

    .line 524
    .line 525
    invoke-virtual {p1, v2}, Lcom/p1/mobile/putong/core/ui/view/GradientBgButton;->setButtonColorAngle(I)V

    .line 526
    .line 527
    .line 528
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/main/ConversationView;->i:Lcom/p1/mobile/putong/core/ui/view/GradientBgButton;

    .line 529
    .line 530
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 531
    .line 532
    .line 533
    move-result-object v0

    .line 534
    sget v1, Ll/ibc0;->F6:I

    .line 535
    .line 536
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 537
    .line 538
    .line 539
    move-result-object v0

    .line 540
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/core/ui/view/ShadowButton;->setIcon(Landroid/graphics/drawable/Drawable;)V

    .line 541
    .line 542
    .line 543
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/main/ConversationView;->i:Lcom/p1/mobile/putong/core/ui/view/GradientBgButton;

    .line 544
    .line 545
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/main/ConversationView;->e()Lcom/p1/mobile/putong/app/PutongAct;

    .line 546
    .line 547
    .line 548
    move-result-object v0

    .line 549
    sget v1, Ll/g9c0;->Q:I

    .line 550
    .line 551
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->color(I)I

    .line 552
    .line 553
    .line 554
    move-result v0

    .line 555
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/core/ui/view/GradientBgButton;->setButtonColorStart(I)V

    .line 556
    .line 557
    .line 558
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/main/ConversationView;->i:Lcom/p1/mobile/putong/core/ui/view/GradientBgButton;

    .line 559
    .line 560
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/main/ConversationView;->e()Lcom/p1/mobile/putong/app/PutongAct;

    .line 561
    .line 562
    .line 563
    move-result-object v0

    .line 564
    sget v1, Ll/g9c0;->P:I

    .line 565
    .line 566
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->color(I)I

    .line 567
    .line 568
    .line 569
    move-result v0

    .line 570
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/core/ui/view/GradientBgButton;->setButtonColorEnd(I)V

    .line 571
    .line 572
    .line 573
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/main/ConversationView;->i:Lcom/p1/mobile/putong/core/ui/view/GradientBgButton;

    .line 574
    .line 575
    invoke-virtual {p0, v2}, Landroid/view/View;->setBackgroundResource(I)V

    .line 576
    .line 577
    .line 578
    return-void

    .line 579
    :cond_7
    iget-object p1, v1, Lcom/p1/mobile/putong/data/User;->localRelationship:Lcom/p1/mobile/putong/data/Relationship;

    .line 580
    .line 581
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 582
    .line 583
    .line 584
    move-result p1

    .line 585
    if-eqz p1, :cond_8

    .line 586
    .line 587
    iget-object p1, v1, Lcom/p1/mobile/putong/data/User;->localRelationship:Lcom/p1/mobile/putong/data/Relationship;

    .line 588
    .line 589
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Relationship;->status:Ljava/util/List;

    .line 590
    .line 591
    const-string v3, "xmasActivity"

    .line 592
    .line 593
    invoke-static {v3}, Lcom/p1/mobile/putong/data/MatchFrom;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/MatchFrom;

    .line 594
    .line 595
    .line 596
    move-result-object v3

    .line 597
    invoke-interface {p1, v3}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 598
    .line 599
    .line 600
    move-result p1

    .line 601
    if-eqz p1, :cond_8

    .line 602
    .line 603
    sget-object p1, Ll/uqb0;->H:Lcom/p1/mobile/putong/api/api/Network;

    .line 604
    .line 605
    invoke-virtual {p1}, Lcom/p1/mobile/putong/api/api/Network;->isChristmasEventEnabled()Z

    .line 606
    .line 607
    .line 608
    move-result p1

    .line 609
    if-eqz p1, :cond_8

    .line 610
    .line 611
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/main/ConversationView;->i:Lcom/p1/mobile/putong/core/ui/view/GradientBgButton;

    .line 612
    .line 613
    invoke-virtual {p1, v2}, Landroid/view/View;->setVisibility(I)V

    .line 614
    .line 615
    .line 616
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/main/ConversationView;->i:Lcom/p1/mobile/putong/core/ui/view/GradientBgButton;

    .line 617
    .line 618
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/core/ui/view/ShadowButton;->setBordersize(F)V

    .line 619
    .line 620
    .line 621
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/main/ConversationView;->i:Lcom/p1/mobile/putong/core/ui/view/GradientBgButton;

    .line 622
    .line 623
    invoke-virtual {p1, v4}, Lcom/p1/mobile/putong/core/ui/view/GradientBgButton;->setEmpty(Z)V

    .line 624
    .line 625
    .line 626
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/main/ConversationView;->i:Lcom/p1/mobile/putong/core/ui/view/GradientBgButton;

    .line 627
    .line 628
    sget p1, Ll/ibc0;->c:I

    .line 629
    .line 630
    invoke-virtual {p0, p1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 631
    .line 632
    .line 633
    return-void

    .line 634
    :cond_8
    iget-object p1, v1, Lcom/p1/mobile/putong/data/User;->localRelationship:Lcom/p1/mobile/putong/data/Relationship;

    .line 635
    .line 636
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 637
    .line 638
    .line 639
    move-result p1

    .line 640
    if-eqz p1, :cond_9

    .line 641
    .line 642
    iget-object p1, v1, Lcom/p1/mobile/putong/data/User;->localRelationship:Lcom/p1/mobile/putong/data/Relationship;

    .line 643
    .line 644
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Relationship;->status:Ljava/util/List;

    .line 645
    .line 646
    const-string v3, "boosted"

    .line 647
    .line 648
    invoke-static {v3}, Lcom/p1/mobile/putong/data/MatchFrom;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/MatchFrom;

    .line 649
    .line 650
    .line 651
    move-result-object v3

    .line 652
    invoke-interface {p1, v3}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 653
    .line 654
    .line 655
    move-result p1

    .line 656
    if-eqz p1, :cond_9

    .line 657
    .line 658
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/main/ConversationView;->i:Lcom/p1/mobile/putong/core/ui/view/GradientBgButton;

    .line 659
    .line 660
    invoke-virtual {p1, v2}, Landroid/view/View;->setVisibility(I)V

    .line 661
    .line 662
    .line 663
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/main/ConversationView;->i:Lcom/p1/mobile/putong/core/ui/view/GradientBgButton;

    .line 664
    .line 665
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/core/ui/view/ShadowButton;->setBordersize(F)V

    .line 666
    .line 667
    .line 668
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/main/ConversationView;->i:Lcom/p1/mobile/putong/core/ui/view/GradientBgButton;

    .line 669
    .line 670
    invoke-virtual {p1, v4}, Lcom/p1/mobile/putong/core/ui/view/GradientBgButton;->setEmpty(Z)V

    .line 671
    .line 672
    .line 673
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/main/ConversationView;->i:Lcom/p1/mobile/putong/core/ui/view/GradientBgButton;

    .line 674
    .line 675
    invoke-virtual {p1, v2}, Lcom/p1/mobile/putong/core/ui/view/GradientBgButton;->setButtonColorAngle(I)V

    .line 676
    .line 677
    .line 678
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/main/ConversationView;->i:Lcom/p1/mobile/putong/core/ui/view/GradientBgButton;

    .line 679
    .line 680
    sget p1, Ll/ibc0;->a:I

    .line 681
    .line 682
    invoke-virtual {p0, p1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 683
    .line 684
    .line 685
    return-void

    .line 686
    :cond_9
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/core/ui/main/ConversationView;->f(Lcom/p1/mobile/putong/data/User;)Z

    .line 687
    .line 688
    .line 689
    move-result p1

    .line 690
    if-eqz p1, :cond_a

    .line 691
    .line 692
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/main/ConversationView;->i:Lcom/p1/mobile/putong/core/ui/view/GradientBgButton;

    .line 693
    .line 694
    invoke-virtual {p1, v2}, Landroid/view/View;->setVisibility(I)V

    .line 695
    .line 696
    .line 697
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/main/ConversationView;->i:Lcom/p1/mobile/putong/core/ui/view/GradientBgButton;

    .line 698
    .line 699
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/core/ui/view/ShadowButton;->setBordersize(F)V

    .line 700
    .line 701
    .line 702
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/main/ConversationView;->i:Lcom/p1/mobile/putong/core/ui/view/GradientBgButton;

    .line 703
    .line 704
    invoke-virtual {p1, v4}, Lcom/p1/mobile/putong/core/ui/view/GradientBgButton;->setEmpty(Z)V

    .line 705
    .line 706
    .line 707
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/main/ConversationView;->i:Lcom/p1/mobile/putong/core/ui/view/GradientBgButton;

    .line 708
    .line 709
    invoke-virtual {p1, v2}, Lcom/p1/mobile/putong/core/ui/view/GradientBgButton;->setButtonColorAngle(I)V

    .line 710
    .line 711
    .line 712
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/main/ConversationView;->i:Lcom/p1/mobile/putong/core/ui/view/GradientBgButton;

    .line 713
    .line 714
    sget p1, Ll/ibc0;->f7:I

    .line 715
    .line 716
    invoke-virtual {p0, p1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 717
    .line 718
    .line 719
    return-void

    .line 720
    :cond_a
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/User;->isPicVerificationVerified()Z

    .line 721
    .line 722
    .line 723
    move-result p1

    .line 724
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/main/ConversationView;->i:Lcom/p1/mobile/putong/core/ui/view/GradientBgButton;

    .line 725
    .line 726
    if-eqz p1, :cond_b

    .line 727
    .line 728
    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 729
    .line 730
    .line 731
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/main/ConversationView;->i:Lcom/p1/mobile/putong/core/ui/view/GradientBgButton;

    .line 732
    .line 733
    invoke-static {v5}, Ll/qa00;->d(F)I

    .line 734
    .line 735
    .line 736
    move-result v0

    .line 737
    int-to-float v0, v0

    .line 738
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/core/ui/view/ShadowButton;->setBordersize(F)V

    .line 739
    .line 740
    .line 741
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/main/ConversationView;->i:Lcom/p1/mobile/putong/core/ui/view/GradientBgButton;

    .line 742
    .line 743
    invoke-virtual {p1, v2}, Lcom/p1/mobile/putong/core/ui/view/GradientBgButton;->setEmpty(Z)V

    .line 744
    .line 745
    .line 746
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/main/ConversationView;->i:Lcom/p1/mobile/putong/core/ui/view/GradientBgButton;

    .line 747
    .line 748
    invoke-virtual {p1, v2}, Lcom/p1/mobile/putong/core/ui/view/GradientBgButton;->setButtonColorAngle(I)V

    .line 749
    .line 750
    .line 751
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/main/ConversationView;->i:Lcom/p1/mobile/putong/core/ui/view/GradientBgButton;

    .line 752
    .line 753
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 754
    .line 755
    .line 756
    move-result-object v0

    .line 757
    sget v1, Ll/ibc0;->d7:I

    .line 758
    .line 759
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 760
    .line 761
    .line 762
    move-result-object v0

    .line 763
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/core/ui/view/ShadowButton;->setIcon(Landroid/graphics/drawable/Drawable;)V

    .line 764
    .line 765
    .line 766
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/main/ConversationView;->i:Lcom/p1/mobile/putong/core/ui/view/GradientBgButton;

    .line 767
    .line 768
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/main/ConversationView;->e()Lcom/p1/mobile/putong/app/PutongAct;

    .line 769
    .line 770
    .line 771
    move-result-object v0

    .line 772
    sget v1, Ll/g9c0;->Q:I

    .line 773
    .line 774
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->color(I)I

    .line 775
    .line 776
    .line 777
    move-result v0

    .line 778
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/core/ui/view/GradientBgButton;->setButtonColorStart(I)V

    .line 779
    .line 780
    .line 781
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/main/ConversationView;->i:Lcom/p1/mobile/putong/core/ui/view/GradientBgButton;

    .line 782
    .line 783
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/main/ConversationView;->e()Lcom/p1/mobile/putong/app/PutongAct;

    .line 784
    .line 785
    .line 786
    move-result-object v0

    .line 787
    sget v1, Ll/g9c0;->P:I

    .line 788
    .line 789
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->color(I)I

    .line 790
    .line 791
    .line 792
    move-result v0

    .line 793
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/core/ui/view/GradientBgButton;->setButtonColorEnd(I)V

    .line 794
    .line 795
    .line 796
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/main/ConversationView;->i:Lcom/p1/mobile/putong/core/ui/view/GradientBgButton;

    .line 797
    .line 798
    invoke-virtual {p0, v2}, Landroid/view/View;->setBackgroundResource(I)V

    .line 799
    .line 800
    .line 801
    return-void

    .line 802
    :cond_b
    invoke-virtual {v0, v2}, Landroid/view/View;->setBackgroundResource(I)V

    .line 803
    .line 804
    .line 805
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/main/ConversationView;->i:Lcom/p1/mobile/putong/core/ui/view/GradientBgButton;

    .line 806
    .line 807
    invoke-virtual {p1, v4}, Lcom/p1/mobile/putong/core/ui/view/GradientBgButton;->setEmpty(Z)V

    .line 808
    .line 809
    .line 810
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/main/ConversationView;->i:Lcom/p1/mobile/putong/core/ui/view/GradientBgButton;

    .line 811
    .line 812
    const/4 p1, 0x4

    .line 813
    invoke-virtual {p0, p1}, Landroid/view/View;->setVisibility(I)V

    .line 814
    .line 815
    .line 816
    return-void
.end method

.method public j(Ll/jic0;Lcom/p1/mobile/putong/core/data/Conversation;ZLl/y20;II)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/jic0<",
            "Lcom/p1/mobile/putong/core/data/Conversation;",
            ">;",
            "Lcom/p1/mobile/putong/core/data/Conversation;",
            "Z",
            "Ll/y20<",
            "Ljava/lang/String;",
            ">;II)V"
        }
    .end annotation

    .line 1
    iput p6, p0, Lcom/p1/mobile/putong/core/ui/main/ConversationView;->u:I

    .line 2
    .line 3
    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/main/ConversationView;->q:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 4
    .line 5
    iput-object p4, p0, Lcom/p1/mobile/putong/core/ui/main/ConversationView;->s:Ll/y20;

    .line 6
    .line 7
    iput p5, p0, Lcom/p1/mobile/putong/core/ui/main/ConversationView;->t:I

    .line 8
    .line 9
    iget-object p4, p0, Lcom/p1/mobile/putong/core/ui/main/ConversationView;->m:Landroid/widget/ImageView;

    .line 10
    .line 11
    const/16 p5, 0x8

    .line 12
    .line 13
    invoke-virtual {p4, p5}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 14
    .line 15
    .line 16
    iget-object p4, p0, Lcom/p1/mobile/putong/core/ui/main/ConversationView;->i:Lcom/p1/mobile/putong/core/ui/view/GradientBgButton;

    .line 17
    .line 18
    invoke-virtual {p4, p5}, Landroid/view/View;->setVisibility(I)V

    .line 19
    .line 20
    .line 21
    iget-object p4, p0, Lcom/p1/mobile/putong/core/ui/main/ConversationView;->j:Lv/VDraweeView;

    .line 22
    .line 23
    invoke-virtual {p4, p5}, Landroid/view/View;->setVisibility(I)V

    .line 24
    .line 25
    .line 26
    iget-object p4, p0, Lcom/p1/mobile/putong/core/ui/main/ConversationView;->n:Landroid/widget/ImageView;

    .line 27
    .line 28
    invoke-virtual {p4, p5}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 29
    .line 30
    .line 31
    if-eqz p3, :cond_0

    .line 32
    .line 33
    iget-object p3, p0, Lcom/p1/mobile/putong/core/ui/main/ConversationView;->b:Lv/VDraweeView;

    .line 34
    .line 35
    invoke-virtual {p3, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 36
    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_0
    iget-object p3, p0, Lcom/p1/mobile/putong/core/ui/main/ConversationView;->l:Lv/VText;

    .line 40
    .line 41
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/main/ConversationView;->e()Lcom/p1/mobile/putong/app/PutongAct;

    .line 42
    .line 43
    .line 44
    move-result-object p4

    .line 45
    sget p5, Ll/g9c0;->V:I

    .line 46
    .line 47
    invoke-virtual {p4, p5}, Lcom/p1/mobile/android/app/Act;->color(I)I

    .line 48
    .line 49
    .line 50
    move-result p4

    .line 51
    invoke-virtual {p3, p4}, Landroid/widget/TextView;->setTextColor(I)V

    .line 52
    .line 53
    .line 54
    :goto_0
    const/4 p3, -0x1

    .line 55
    iput p3, p0, Lcom/p1/mobile/putong/core/ui/main/ConversationView;->v:I

    .line 56
    .line 57
    const/4 p4, 0x1

    .line 58
    iput-boolean p4, p0, Lcom/p1/mobile/putong/core/ui/main/ConversationView;->x:Z

    .line 59
    .line 60
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/main/ConversationView;->e()Lcom/p1/mobile/putong/app/PutongAct;

    .line 61
    .line 62
    .line 63
    move-result-object p4

    .line 64
    sget-object p5, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 65
    .line 66
    iget-object p5, p5, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 67
    .line 68
    iget-object p6, p2, Lcom/p1/mobile/putong/core/data/Conversation;->otherUser:Ljava/lang/String;

    .line 69
    .line 70
    invoke-virtual {p5, p6}, Ll/dkb;->Ka(Ljava/lang/String;)Lrx/c;

    .line 71
    .line 72
    .line 73
    move-result-object v0

    .line 74
    sget-object p5, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 75
    .line 76
    iget-object p5, p5, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 77
    .line 78
    iget-object p6, p0, Lcom/p1/mobile/putong/core/ui/main/ConversationView;->q:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 79
    .line 80
    iget-object p6, p6, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 81
    .line 82
    invoke-virtual {p5, p6}, Lcom/p1/mobile/putong/core/api/g;->Tn(Ljava/lang/String;)Lrx/c;

    .line 83
    .line 84
    .line 85
    move-result-object v1

    .line 86
    sget-object p5, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 87
    .line 88
    iget-object p5, p5, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 89
    .line 90
    invoke-virtual {p5}, Ll/dkb;->o9()Lrx/c;

    .line 91
    .line 92
    .line 93
    move-result-object v2

    .line 94
    sget-object p5, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 95
    .line 96
    iget-object p5, p5, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 97
    .line 98
    iget-object p2, p2, Lcom/p1/mobile/putong/core/data/Conversation;->otherUser:Ljava/lang/String;

    .line 99
    .line 100
    invoke-virtual {p5, p2}, Lcom/p1/mobile/putong/core/api/g;->Ne(Ljava/lang/String;)Lrx/c;

    .line 101
    .line 102
    .line 103
    move-result-object v3

    .line 104
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 105
    .line 106
    .line 107
    move-result-object p2

    .line 108
    invoke-virtual {p2}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 109
    .line 110
    .line 111
    move-result-object p2

    .line 112
    invoke-interface {p2}, Ll/r97;->c()Z

    .line 113
    .line 114
    .line 115
    move-result p2

    .line 116
    if-eqz p2, :cond_1

    .line 117
    .line 118
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 119
    .line 120
    iget-object p2, p2, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 121
    .line 122
    iget-object p3, p0, Lcom/p1/mobile/putong/core/ui/main/ConversationView;->q:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 123
    .line 124
    iget-object p3, p3, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 125
    .line 126
    invoke-virtual {p2, p3}, Lcom/p1/mobile/putong/core/api/g;->mo(Ljava/lang/String;)Lrx/c;

    .line 127
    .line 128
    .line 129
    move-result-object p2

    .line 130
    :goto_1
    move-object v4, p2

    .line 131
    goto :goto_2

    .line 132
    :cond_1
    new-instance p2, Ll/pf60;

    .line 133
    .line 134
    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 135
    .line 136
    .line 137
    move-result-object p3

    .line 138
    sget-object p5, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 139
    .line 140
    invoke-direct {p2, p3, p5}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 141
    .line 142
    .line 143
    invoke-static {p2}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 144
    .line 145
    .line 146
    move-result-object p2

    .line 147
    goto :goto_1

    .line 148
    :goto_2
    new-instance v5, Ll/rm6;

    .line 149
    .line 150
    invoke-direct {v5}, Ll/rm6;-><init>()V

    .line 151
    .line 152
    .line 153
    invoke-static/range {v0 .. v5}, Ll/psd0;->u(Lrx/c;Lrx/c;Lrx/c;Lrx/c;Lrx/c;Ll/ucj;)Lrx/c;

    .line 154
    .line 155
    .line 156
    move-result-object p2

    .line 157
    invoke-virtual {p1, p4, p2}, Ll/jic0;->c(Ll/ner;Lrx/c;)Lrx/c;

    .line 158
    .line 159
    .line 160
    move-result-object p1

    .line 161
    new-instance p2, Ll/sm6;

    .line 162
    .line 163
    invoke-direct {p2, p0}, Ll/sm6;-><init>(Lcom/p1/mobile/putong/core/ui/main/ConversationView;)V

    .line 164
    .line 165
    .line 166
    invoke-static {p2}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 167
    .line 168
    .line 169
    move-result-object p0

    .line 170
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 171
    .line 172
    .line 173
    return-void
.end method

.method public l(Ljava/util/List;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/data/Reminder;)V
    .locals 16
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/Message;",
            ">;",
            "Lcom/p1/mobile/putong/data/User;",
            "Lcom/p1/mobile/putong/data/User;",
            "Lcom/p1/mobile/putong/core/data/Reminder;",
            ")V"
        }
    .end annotation

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p2

    .line 4
    .line 5
    move-object/from16 v2, p4

    .line 6
    .line 7
    const/4 v3, 0x1

    .line 8
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 9
    .line 10
    .line 11
    move-result-object v4

    .line 12
    invoke-static/range {p1 .. p1}, Ll/jyb;->F(Ljava/util/List;)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object v5

    .line 16
    check-cast v5, Lcom/p1/mobile/putong/core/data/Message;

    .line 17
    .line 18
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 19
    .line 20
    .line 21
    move-result v6

    .line 22
    const/4 v7, 0x0

    .line 23
    if-eqz v6, :cond_0

    .line 24
    .line 25
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 26
    .line 27
    .line 28
    move-result-object v6

    .line 29
    iget-object v8, v2, Lcom/p1/mobile/putong/core/data/Reminder;->moment:Ljava/lang/String;

    .line 30
    .line 31
    sget-object v9, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 32
    .line 33
    invoke-interface {v6, v8, v9}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->Mh(Ljava/lang/String;Lcom/tantanapp/common/data/JsonAdapter;)Lcom/tantanapp/common/data/ValueObject;

    .line 34
    .line 35
    .line 36
    move-result-object v6

    .line 37
    check-cast v6, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;

    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_0
    move-object v6, v7

    .line 41
    :goto_0
    invoke-static {v5}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 42
    .line 43
    .line 44
    move-result v8

    .line 45
    const/16 v9, 0x8

    .line 46
    .line 47
    const/4 v10, 0x0

    .line 48
    if-eqz v8, :cond_2

    .line 49
    .line 50
    invoke-virtual {v5}, Lcom/p1/mobile/putong/core/data/Message;->status()Lcom/p1/mobile/putong/data/LocalStatus;

    .line 51
    .line 52
    .line 53
    move-result-object v8

    .line 54
    const-string v11, "failed"

    .line 55
    .line 56
    invoke-static {v8, v11}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 57
    .line 58
    .line 59
    move-result v8

    .line 60
    if-eqz v8, :cond_2

    .line 61
    .line 62
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/User;->unilateralBlock()Z

    .line 63
    .line 64
    .line 65
    move-result v8

    .line 66
    iget-object v11, v0, Lcom/p1/mobile/putong/core/ui/main/ConversationView;->n:Landroid/widget/ImageView;

    .line 67
    .line 68
    if-eqz v8, :cond_1

    .line 69
    .line 70
    invoke-virtual {v11, v9}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 71
    .line 72
    .line 73
    goto :goto_1

    .line 74
    :cond_1
    invoke-virtual {v11, v10}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 75
    .line 76
    .line 77
    iget-object v8, v0, Lcom/p1/mobile/putong/core/ui/main/ConversationView;->n:Landroid/widget/ImageView;

    .line 78
    .line 79
    sget v9, Ll/ibc0;->b0:I

    .line 80
    .line 81
    invoke-virtual {v8, v9}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 82
    .line 83
    .line 84
    goto :goto_1

    .line 85
    :cond_2
    iget-object v8, v0, Lcom/p1/mobile/putong/core/ui/main/ConversationView;->q:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 86
    .line 87
    iget-object v8, v8, Lcom/p1/mobile/putong/core/data/Conversation;->read:Ljava/lang/Boolean;

    .line 88
    .line 89
    invoke-virtual {v8}, Ljava/lang/Boolean;->booleanValue()Z

    .line 90
    .line 91
    .line 92
    move-result v8

    .line 93
    iget-object v11, v0, Lcom/p1/mobile/putong/core/ui/main/ConversationView;->n:Landroid/widget/ImageView;

    .line 94
    .line 95
    if-nez v8, :cond_3

    .line 96
    .line 97
    invoke-virtual {v11, v10}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 98
    .line 99
    .line 100
    iget-object v8, v0, Lcom/p1/mobile/putong/core/ui/main/ConversationView;->n:Landroid/widget/ImageView;

    .line 101
    .line 102
    sget v9, Ll/ibc0;->i7:I

    .line 103
    .line 104
    invoke-virtual {v8, v9}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 105
    .line 106
    .line 107
    goto :goto_1

    .line 108
    :cond_3
    invoke-virtual {v11, v9}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 109
    .line 110
    .line 111
    :goto_1
    invoke-static {v6}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 112
    .line 113
    .line 114
    move-result v8

    .line 115
    const-string v9, "female"

    .line 116
    .line 117
    const-string v11, " "

    .line 118
    .line 119
    if-eqz v8, :cond_10

    .line 120
    .line 121
    if-eqz v5, :cond_4

    .line 122
    .line 123
    iget-wide v12, v5, Lcom/p1/mobile/putong/core/data/Message;->createdTime:D

    .line 124
    .line 125
    iget-wide v14, v2, Lcom/p1/mobile/putong/core/data/Reminder;->createdTime:D

    .line 126
    .line 127
    cmpg-double v8, v12, v14

    .line 128
    .line 129
    if-gez v8, :cond_10

    .line 130
    .line 131
    :cond_4
    iget-object v1, v1, Lcom/p1/mobile/putong/data/User;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 132
    .line 133
    invoke-static {v1, v9}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 134
    .line 135
    .line 136
    move-result v1

    .line 137
    iget-object v5, v2, Lcom/p1/mobile/putong/core/data/Reminder;->reference:Lcom/p1/mobile/putong/core/data/ReminderReference;

    .line 138
    .line 139
    iget-object v5, v5, Lcom/p1/mobile/putong/core/data/ReminderReference;->action:Lcom/p1/mobile/putong/core/data/ReminderAction;

    .line 140
    .line 141
    const-string v7, "avatar"

    .line 142
    .line 143
    invoke-static {v5, v7}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 144
    .line 145
    .line 146
    move-result v5

    .line 147
    if-eqz v5, :cond_6

    .line 148
    .line 149
    new-instance v3, Ljava/lang/StringBuilder;

    .line 150
    .line 151
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 152
    .line 153
    .line 154
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/main/ConversationView;->e()Lcom/p1/mobile/putong/app/PutongAct;

    .line 155
    .line 156
    .line 157
    move-result-object v4

    .line 158
    sget v6, Lcom/p1/mobile/putong/core/message/R$string;->l5:I

    .line 159
    .line 160
    invoke-virtual {v4, v6}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 161
    .line 162
    .line 163
    move-result-object v4

    .line 164
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 165
    .line 166
    .line 167
    invoke-virtual {v3, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 168
    .line 169
    .line 170
    if-eqz v1, :cond_5

    .line 171
    .line 172
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/main/ConversationView;->e()Lcom/p1/mobile/putong/app/PutongAct;

    .line 173
    .line 174
    .line 175
    move-result-object v1

    .line 176
    sget v4, Lcom/p1/mobile/putong/core/message/R$string;->f5:I

    .line 177
    .line 178
    invoke-virtual {v1, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 179
    .line 180
    .line 181
    move-result-object v1

    .line 182
    goto :goto_2

    .line 183
    :cond_5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/main/ConversationView;->e()Lcom/p1/mobile/putong/app/PutongAct;

    .line 184
    .line 185
    .line 186
    move-result-object v1

    .line 187
    sget v4, Lcom/p1/mobile/putong/core/message/R$string;->g5:I

    .line 188
    .line 189
    invoke-virtual {v1, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 190
    .line 191
    .line 192
    move-result-object v1

    .line 193
    :goto_2
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 194
    .line 195
    .line 196
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 197
    .line 198
    .line 199
    move-result-object v1

    .line 200
    goto/16 :goto_5

    .line 201
    .line 202
    :cond_6
    iget-object v7, v6, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->value:Ljava/lang/String;

    .line 203
    .line 204
    invoke-static {v7}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 205
    .line 206
    .line 207
    move-result v7

    .line 208
    if-nez v7, :cond_7

    .line 209
    .line 210
    new-instance v1, Ljava/lang/StringBuilder;

    .line 211
    .line 212
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 213
    .line 214
    .line 215
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/main/ConversationView;->e()Lcom/p1/mobile/putong/app/PutongAct;

    .line 216
    .line 217
    .line 218
    move-result-object v3

    .line 219
    sget v4, Lcom/p1/mobile/putong/core/message/R$string;->e5:I

    .line 220
    .line 221
    invoke-virtual {v3, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 222
    .line 223
    .line 224
    move-result-object v3

    .line 225
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 226
    .line 227
    .line 228
    invoke-virtual {v1, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 229
    .line 230
    .line 231
    iget-object v3, v6, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->value:Ljava/lang/String;

    .line 232
    .line 233
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 234
    .line 235
    .line 236
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 237
    .line 238
    .line 239
    move-result-object v1

    .line 240
    goto/16 :goto_5

    .line 241
    .line 242
    :cond_7
    iget-object v7, v6, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->media:Ljava/util/List;

    .line 243
    .line 244
    invoke-static {v7}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 245
    .line 246
    .line 247
    move-result v7

    .line 248
    if-eqz v7, :cond_9

    .line 249
    .line 250
    iget-object v7, v6, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->media:Ljava/util/List;

    .line 251
    .line 252
    invoke-interface {v7}, Ljava/util/List;->size()I

    .line 253
    .line 254
    .line 255
    move-result v7

    .line 256
    if-lez v7, :cond_9

    .line 257
    .line 258
    iget-object v7, v6, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->media:Ljava/util/List;

    .line 259
    .line 260
    invoke-interface {v7, v10}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 261
    .line 262
    .line 263
    move-result-object v7

    .line 264
    instance-of v7, v7, Lcom/p1/mobile/putong/data/Video;

    .line 265
    .line 266
    if-eqz v7, :cond_9

    .line 267
    .line 268
    new-instance v3, Ljava/lang/StringBuilder;

    .line 269
    .line 270
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 271
    .line 272
    .line 273
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/main/ConversationView;->e()Lcom/p1/mobile/putong/app/PutongAct;

    .line 274
    .line 275
    .line 276
    move-result-object v6

    .line 277
    sget v7, Lcom/p1/mobile/putong/core/message/R$string;->e5:I

    .line 278
    .line 279
    invoke-virtual {v6, v7}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 280
    .line 281
    .line 282
    move-result-object v6

    .line 283
    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 284
    .line 285
    .line 286
    invoke-virtual {v3, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 287
    .line 288
    .line 289
    if-eqz v1, :cond_8

    .line 290
    .line 291
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/main/ConversationView;->e()Lcom/p1/mobile/putong/app/PutongAct;

    .line 292
    .line 293
    .line 294
    move-result-object v1

    .line 295
    sget v6, Lcom/p1/mobile/putong/core/message/R$string;->m5:I

    .line 296
    .line 297
    filled-new-array {v4}, [Ljava/lang/Object;

    .line 298
    .line 299
    .line 300
    move-result-object v4

    .line 301
    invoke-virtual {v1, v6, v4}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 302
    .line 303
    .line 304
    move-result-object v1

    .line 305
    goto :goto_3

    .line 306
    :cond_8
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/main/ConversationView;->e()Lcom/p1/mobile/putong/app/PutongAct;

    .line 307
    .line 308
    .line 309
    move-result-object v1

    .line 310
    sget v6, Lcom/p1/mobile/putong/core/message/R$string;->n5:I

    .line 311
    .line 312
    filled-new-array {v4}, [Ljava/lang/Object;

    .line 313
    .line 314
    .line 315
    move-result-object v4

    .line 316
    invoke-virtual {v1, v6, v4}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 317
    .line 318
    .line 319
    move-result-object v1

    .line 320
    :goto_3
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 321
    .line 322
    .line 323
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 324
    .line 325
    .line 326
    move-result-object v1

    .line 327
    goto :goto_5

    .line 328
    :cond_9
    iget-object v4, v6, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->media:Ljava/util/List;

    .line 329
    .line 330
    if-eqz v4, :cond_a

    .line 331
    .line 332
    invoke-interface {v4}, Ljava/util/List;->size()I

    .line 333
    .line 334
    .line 335
    move-result v10

    .line 336
    :cond_a
    new-instance v4, Ljava/lang/StringBuilder;

    .line 337
    .line 338
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 339
    .line 340
    .line 341
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/main/ConversationView;->e()Lcom/p1/mobile/putong/app/PutongAct;

    .line 342
    .line 343
    .line 344
    move-result-object v6

    .line 345
    sget v7, Lcom/p1/mobile/putong/core/message/R$string;->e5:I

    .line 346
    .line 347
    invoke-virtual {v6, v7}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 348
    .line 349
    .line 350
    move-result-object v6

    .line 351
    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 352
    .line 353
    .line 354
    invoke-virtual {v4, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 355
    .line 356
    .line 357
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/main/ConversationView;->e()Lcom/p1/mobile/putong/app/PutongAct;

    .line 358
    .line 359
    .line 360
    move-result-object v6

    .line 361
    if-le v10, v3, :cond_c

    .line 362
    .line 363
    if-eqz v1, :cond_b

    .line 364
    .line 365
    sget v1, Lcom/p1/mobile/putong/core/message/R$string;->h5:I

    .line 366
    .line 367
    goto :goto_4

    .line 368
    :cond_b
    sget v1, Lcom/p1/mobile/putong/core/message/R$string;->i5:I

    .line 369
    .line 370
    goto :goto_4

    .line 371
    :cond_c
    if-eqz v1, :cond_d

    .line 372
    .line 373
    sget v1, Lcom/p1/mobile/putong/core/message/R$string;->j5:I

    .line 374
    .line 375
    goto :goto_4

    .line 376
    :cond_d
    sget v1, Lcom/p1/mobile/putong/core/message/R$string;->k5:I

    .line 377
    .line 378
    :goto_4
    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 379
    .line 380
    .line 381
    move-result-object v3

    .line 382
    filled-new-array {v3}, [Ljava/lang/Object;

    .line 383
    .line 384
    .line 385
    move-result-object v3

    .line 386
    invoke-virtual {v6, v1, v3}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 387
    .line 388
    .line 389
    move-result-object v1

    .line 390
    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 391
    .line 392
    .line 393
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 394
    .line 395
    .line 396
    move-result-object v1

    .line 397
    :goto_5
    iget-boolean v2, v2, Lcom/p1/mobile/putong/core/data/Reminder;->read:Z

    .line 398
    .line 399
    if-eqz v2, :cond_e

    .line 400
    .line 401
    goto :goto_7

    .line 402
    :cond_e
    invoke-interface {v1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 403
    .line 404
    .line 405
    move-result-object v1

    .line 406
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/main/ConversationView;->e()Lcom/p1/mobile/putong/app/PutongAct;

    .line 407
    .line 408
    .line 409
    move-result-object v2

    .line 410
    if-eqz v5, :cond_f

    .line 411
    .line 412
    sget v3, Lcom/p1/mobile/putong/core/message/R$string;->l5:I

    .line 413
    .line 414
    goto :goto_6

    .line 415
    :cond_f
    sget v3, Lcom/p1/mobile/putong/core/message/R$string;->e5:I

    .line 416
    .line 417
    :goto_6
    invoke-virtual {v2, v3}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 418
    .line 419
    .line 420
    move-result-object v2

    .line 421
    filled-new-array {v2}, [Ljava/lang/String;

    .line 422
    .line 423
    .line 424
    move-result-object v2

    .line 425
    invoke-static {v2}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 426
    .line 427
    .line 428
    move-result-object v2

    .line 429
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/main/ConversationView;->e()Lcom/p1/mobile/putong/app/PutongAct;

    .line 430
    .line 431
    .line 432
    move-result-object v3

    .line 433
    sget v4, Ll/g9c0;->N:I

    .line 434
    .line 435
    invoke-virtual {v3, v4}, Lcom/p1/mobile/android/app/Act;->color(I)I

    .line 436
    .line 437
    .line 438
    move-result v3

    .line 439
    const/4 v4, 0x3

    .line 440
    invoke-static {v4}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 441
    .line 442
    .line 443
    move-result-object v4

    .line 444
    invoke-static {v1, v2, v3, v4}, Ll/q8g0;->b0(Ljava/lang/String;Ljava/util/ArrayList;ILandroid/graphics/Typeface;)Landroid/text/SpannableStringBuilder;

    .line 445
    .line 446
    .line 447
    move-result-object v1

    .line 448
    :goto_7
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/ui/main/ConversationView;->setMessageText(Ljava/lang/CharSequence;)V

    .line 449
    .line 450
    .line 451
    return-void

    .line 452
    :cond_10
    invoke-static {v5}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 453
    .line 454
    .line 455
    move-result v2

    .line 456
    if-eqz v2, :cond_13

    .line 457
    .line 458
    invoke-virtual {v5}, Lcom/p1/mobile/putong/core/data/Message;->isOtherUser()Z

    .line 459
    .line 460
    .line 461
    move-result v2

    .line 462
    if-eqz v2, :cond_12

    .line 463
    .line 464
    iget-wide v2, v5, Lcom/p1/mobile/putong/core/data/Message;->createdTime:D

    .line 465
    .line 466
    iget-object v4, v0, Lcom/p1/mobile/putong/core/ui/main/ConversationView;->q:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 467
    .line 468
    iget-wide v10, v4, Lcom/p1/mobile/putong/core/data/Conversation;->localBotheringTime:D

    .line 469
    .line 470
    invoke-static {v10, v11}, Ljava/lang/Math;->abs(D)D

    .line 471
    .line 472
    .line 473
    move-result-wide v10

    .line 474
    cmpl-double v2, v2, v10

    .line 475
    .line 476
    if-nez v2, :cond_12

    .line 477
    .line 478
    iget-object v1, v1, Lcom/p1/mobile/putong/data/User;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 479
    .line 480
    const-string v2, "male"

    .line 481
    .line 482
    invoke-static {v1, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 483
    .line 484
    .line 485
    move-result v1

    .line 486
    if-eqz v1, :cond_12

    .line 487
    .line 488
    move-object/from16 v1, p3

    .line 489
    .line 490
    iget-object v1, v1, Lcom/p1/mobile/putong/data/User;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 491
    .line 492
    invoke-static {v1, v9}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 493
    .line 494
    .line 495
    move-result v1

    .line 496
    if-eqz v1, :cond_12

    .line 497
    .line 498
    new-instance v1, Ljava/lang/StringBuilder;

    .line 499
    .line 500
    const-string v2, "\u2190 "

    .line 501
    .line 502
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 503
    .line 504
    .line 505
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/main/ConversationView;->e()Lcom/p1/mobile/putong/app/PutongAct;

    .line 506
    .line 507
    .line 508
    move-result-object v2

    .line 509
    iget-object v3, v0, Lcom/p1/mobile/putong/core/ui/main/ConversationView;->q:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 510
    .line 511
    iget-wide v3, v3, Lcom/p1/mobile/putong/core/data/Conversation;->localBotheringTime:D

    .line 512
    .line 513
    const-wide/16 v8, 0x0

    .line 514
    .line 515
    cmpg-double v3, v3, v8

    .line 516
    .line 517
    if-gez v3, :cond_11

    .line 518
    .line 519
    sget v3, Lcom/p1/mobile/putong/core/message/R$string;->x4:I

    .line 520
    .line 521
    goto :goto_8

    .line 522
    :cond_11
    sget v3, Lcom/p1/mobile/putong/core/message/R$string;->y4:I

    .line 523
    .line 524
    :goto_8
    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 525
    .line 526
    .line 527
    move-result-object v2

    .line 528
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 529
    .line 530
    .line 531
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 532
    .line 533
    .line 534
    move-result-object v1

    .line 535
    invoke-static {v1}, Ll/hmj0;->c(Ljava/lang/String;)Landroid/text/Spannable;

    .line 536
    .line 537
    .line 538
    move-result-object v1

    .line 539
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/ui/main/ConversationView;->setMessageText(Ljava/lang/CharSequence;)V

    .line 540
    .line 541
    .line 542
    goto/16 :goto_9

    .line 543
    .line 544
    :cond_12
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 545
    .line 546
    .line 547
    move-result-object v1

    .line 548
    invoke-virtual {v1}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 549
    .line 550
    .line 551
    move-result-object v1

    .line 552
    invoke-interface {v1, v5, v7}, Ll/r97;->M0(Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/core/data/Conversation;)Ljava/lang/CharSequence;

    .line 553
    .line 554
    .line 555
    move-result-object v7

    .line 556
    goto/16 :goto_9

    .line 557
    .line 558
    :cond_13
    iget-object v2, v0, Lcom/p1/mobile/putong/core/ui/main/ConversationView;->q:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 559
    .line 560
    invoke-static {v2}, Ll/pm6;->d(Lcom/p1/mobile/putong/core/data/Conversation;)Z

    .line 561
    .line 562
    .line 563
    move-result v2

    .line 564
    if-eqz v2, :cond_14

    .line 565
    .line 566
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/main/ConversationView;->e()Lcom/p1/mobile/putong/app/PutongAct;

    .line 567
    .line 568
    .line 569
    move-result-object v1

    .line 570
    sget v2, Lcom/p1/mobile/putong/core/message/R$string;->S3:I

    .line 571
    .line 572
    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 573
    .line 574
    .line 575
    move-result-object v1

    .line 576
    new-instance v2, Ljava/lang/StringBuilder;

    .line 577
    .line 578
    invoke-direct {v2, v11}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 579
    .line 580
    .line 581
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/main/ConversationView;->e()Lcom/p1/mobile/putong/app/PutongAct;

    .line 582
    .line 583
    .line 584
    move-result-object v3

    .line 585
    sget v4, Lcom/p1/mobile/putong/core/message/R$string;->p4:I

    .line 586
    .line 587
    iget-object v6, v0, Lcom/p1/mobile/putong/core/ui/main/ConversationView;->q:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 588
    .line 589
    iget-wide v6, v6, Lcom/p1/mobile/putong/core/data/Conversation;->createdTime:D

    .line 590
    .line 591
    invoke-static {v6, v7}, Ll/pzi0;->G(D)Ljava/lang/String;

    .line 592
    .line 593
    .line 594
    move-result-object v6

    .line 595
    filled-new-array {v6}, [Ljava/lang/Object;

    .line 596
    .line 597
    .line 598
    move-result-object v6

    .line 599
    invoke-virtual {v3, v4, v6}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 600
    .line 601
    .line 602
    move-result-object v3

    .line 603
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 604
    .line 605
    .line 606
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 607
    .line 608
    .line 609
    move-result-object v2

    .line 610
    const-string v3, "#9D55E5"

    .line 611
    .line 612
    invoke-static {v3}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 613
    .line 614
    .line 615
    move-result v3

    .line 616
    const-string v4, "#66000000"

    .line 617
    .line 618
    invoke-static {v4}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 619
    .line 620
    .line 621
    move-result v4

    .line 622
    invoke-static {v1, v2, v3, v4}, Ll/c17;->v0(Ljava/lang/String;Ljava/lang/CharSequence;II)Ljava/lang/CharSequence;

    .line 623
    .line 624
    .line 625
    move-result-object v7

    .line 626
    goto :goto_9

    .line 627
    :cond_14
    iget-object v2, v0, Lcom/p1/mobile/putong/core/ui/main/ConversationView;->q:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 628
    .line 629
    invoke-static {v2}, Ll/pm6;->f(Lcom/p1/mobile/putong/core/data/Conversation;)Z

    .line 630
    .line 631
    .line 632
    move-result v2

    .line 633
    if-eqz v2, :cond_15

    .line 634
    .line 635
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/main/ConversationView;->e()Lcom/p1/mobile/putong/app/PutongAct;

    .line 636
    .line 637
    .line 638
    move-result-object v1

    .line 639
    sget v2, Lcom/p1/mobile/putong/core/message/R$string;->N3:I

    .line 640
    .line 641
    iget-object v3, v0, Lcom/p1/mobile/putong/core/ui/main/ConversationView;->q:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 642
    .line 643
    iget-wide v3, v3, Lcom/p1/mobile/putong/core/data/Conversation;->createdTime:D

    .line 644
    .line 645
    invoke-static {v3, v4}, Ll/pzi0;->G(D)Ljava/lang/String;

    .line 646
    .line 647
    .line 648
    move-result-object v3

    .line 649
    filled-new-array {v3}, [Ljava/lang/Object;

    .line 650
    .line 651
    .line 652
    move-result-object v3

    .line 653
    invoke-virtual {v1, v2, v3}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 654
    .line 655
    .line 656
    move-result-object v7

    .line 657
    goto :goto_9

    .line 658
    :cond_15
    iget-object v2, v1, Lcom/p1/mobile/putong/data/User;->localRelationship:Lcom/p1/mobile/putong/data/Relationship;

    .line 659
    .line 660
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 661
    .line 662
    .line 663
    move-result v2

    .line 664
    if-eqz v2, :cond_16

    .line 665
    .line 666
    iget-object v1, v1, Lcom/p1/mobile/putong/data/User;->localRelationship:Lcom/p1/mobile/putong/data/Relationship;

    .line 667
    .line 668
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Relationship;->status:Ljava/util/List;

    .line 669
    .line 670
    const-string v2, "superLiked"

    .line 671
    .line 672
    invoke-static {v2}, Lcom/p1/mobile/putong/data/MatchFrom;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/MatchFrom;

    .line 673
    .line 674
    .line 675
    move-result-object v2

    .line 676
    invoke-interface {v1, v2}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 677
    .line 678
    .line 679
    move-result v1

    .line 680
    if-eqz v1, :cond_16

    .line 681
    .line 682
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/main/ConversationView;->e()Lcom/p1/mobile/putong/app/PutongAct;

    .line 683
    .line 684
    .line 685
    move-result-object v1

    .line 686
    sget v2, Lcom/p1/mobile/putong/core/message/R$string;->p4:I

    .line 687
    .line 688
    iget-object v3, v0, Lcom/p1/mobile/putong/core/ui/main/ConversationView;->q:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 689
    .line 690
    iget-wide v3, v3, Lcom/p1/mobile/putong/core/data/Conversation;->createdTime:D

    .line 691
    .line 692
    invoke-static {v3, v4}, Ll/pzi0;->G(D)Ljava/lang/String;

    .line 693
    .line 694
    .line 695
    move-result-object v3

    .line 696
    filled-new-array {v3}, [Ljava/lang/Object;

    .line 697
    .line 698
    .line 699
    move-result-object v3

    .line 700
    invoke-virtual {v1, v2, v3}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 701
    .line 702
    .line 703
    move-result-object v7

    .line 704
    :cond_16
    :goto_9
    iget-object v1, v0, Lcom/p1/mobile/putong/core/ui/main/ConversationView;->o:Lv/VText;

    .line 705
    .line 706
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/main/ConversationView;->e()Lcom/p1/mobile/putong/app/PutongAct;

    .line 707
    .line 708
    .line 709
    move-result-object v2

    .line 710
    sget v3, Ll/g9c0;->X:I

    .line 711
    .line 712
    invoke-virtual {v2, v3}, Lcom/p1/mobile/android/app/Act;->color(I)I

    .line 713
    .line 714
    .line 715
    move-result v2

    .line 716
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 717
    .line 718
    .line 719
    invoke-static {v5}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 720
    .line 721
    .line 722
    move-result v1

    .line 723
    if-eqz v1, :cond_17

    .line 724
    .line 725
    iget-object v1, v5, Lcom/p1/mobile/putong/core/data/Message;->sticker:Ljava/lang/String;

    .line 726
    .line 727
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 728
    .line 729
    .line 730
    move-result v1

    .line 731
    if-eqz v1, :cond_17

    .line 732
    .line 733
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/main/ConversationView;->o:Lv/VText;

    .line 734
    .line 735
    invoke-virtual {v0, v7}, Lv/VText;->setTextWithoutEmoticonify(Ljava/lang/CharSequence;)V

    .line 736
    .line 737
    .line 738
    return-void

    .line 739
    :cond_17
    invoke-static {v5}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 740
    .line 741
    .line 742
    move-result v1

    .line 743
    if-eqz v1, :cond_19

    .line 744
    .line 745
    sget-object v1, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->LOCAL_ID_INVALID:Ljava/lang/String;

    .line 746
    .line 747
    iget-object v2, v5, Lcom/p1/mobile/putong/core/data/Message;->moment:Ljava/lang/String;

    .line 748
    .line 749
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 750
    .line 751
    .line 752
    move-result v1

    .line 753
    if-nez v1, :cond_18

    .line 754
    .line 755
    sget-object v1, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->LOCAL_ID_INVALID:Ljava/lang/String;

    .line 756
    .line 757
    iget-object v2, v5, Lcom/p1/mobile/putong/core/data/Message;->likeOfMoment:Ljava/lang/String;

    .line 758
    .line 759
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 760
    .line 761
    .line 762
    move-result v1

    .line 763
    if-eqz v1, :cond_19

    .line 764
    .line 765
    :cond_18
    sget v1, Lcom/p1/mobile/putong/core/message/R$string;->s4:I

    .line 766
    .line 767
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/ui/main/ConversationView;->setMessageText(I)V

    .line 768
    .line 769
    .line 770
    return-void

    .line 771
    :cond_19
    invoke-static {v7}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 772
    .line 773
    .line 774
    move-result v1

    .line 775
    if-eqz v1, :cond_1a

    .line 776
    .line 777
    invoke-direct {v0, v7}, Lcom/p1/mobile/putong/core/ui/main/ConversationView;->setMessageText(Ljava/lang/CharSequence;)V

    .line 778
    .line 779
    .line 780
    :cond_1a
    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/main/ConversationView;->q:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-nez v0, :cond_2

    .line 5
    .line 6
    new-instance v0, Ljava/lang/Throwable;

    .line 7
    .line 8
    new-instance v2, Ljava/lang/StringBuilder;

    .line 9
    .line 10
    const-string v3, "CV onClick  localId="

    .line 11
    .line 12
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    iget v3, p0, Lcom/p1/mobile/putong/core/ui/main/ConversationView;->v:I

    .line 16
    .line 17
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    const-string v3, " page="

    .line 21
    .line 22
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    iget v3, p0, Lcom/p1/mobile/putong/core/ui/main/ConversationView;->t:I

    .line 26
    .line 27
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    const-string v3, " position="

    .line 31
    .line 32
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    iget v3, p0, Lcom/p1/mobile/putong/core/ui/main/ConversationView;->u:I

    .line 36
    .line 37
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 38
    .line 39
    .line 40
    const-string v3, " renderLocal="

    .line 41
    .line 42
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 43
    .line 44
    .line 45
    iget-boolean v3, p0, Lcom/p1/mobile/putong/core/ui/main/ConversationView;->w:Z

    .line 46
    .line 47
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 48
    .line 49
    .line 50
    const-string v3, " rendCons="

    .line 51
    .line 52
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 53
    .line 54
    .line 55
    iget-boolean v3, p0, Lcom/p1/mobile/putong/core/ui/main/ConversationView;->x:Z

    .line 56
    .line 57
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 58
    .line 59
    .line 60
    const-string v3, " myid="

    .line 61
    .line 62
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 63
    .line 64
    .line 65
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 66
    .line 67
    .line 68
    move-result-object v3

    .line 69
    invoke-interface {v3}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 70
    .line 71
    .line 72
    move-result-object v3

    .line 73
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 74
    .line 75
    .line 76
    const-string v3, " title="

    .line 77
    .line 78
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 79
    .line 80
    .line 81
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/main/ConversationView;->l:Lv/VText;

    .line 82
    .line 83
    if-eqz v3, :cond_0

    .line 84
    .line 85
    invoke-virtual {v3}, Landroidx/appcompat/widget/AppCompatTextView;->getText()Ljava/lang/CharSequence;

    .line 86
    .line 87
    .line 88
    move-result-object v3

    .line 89
    goto :goto_0

    .line 90
    :cond_0
    const-string v3, "null"

    .line 91
    .line 92
    :goto_0
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 93
    .line 94
    .line 95
    const-string v3, " view="

    .line 96
    .line 97
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 98
    .line 99
    .line 100
    if-ne p1, p0, :cond_1

    .line 101
    .line 102
    const/4 v1, 0x1

    .line 103
    :cond_1
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 104
    .line 105
    .line 106
    const-string p1, " adapterIsNull = "

    .line 107
    .line 108
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 109
    .line 110
    .line 111
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/ui/main/ConversationView;->y:Z

    .line 112
    .line 113
    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 114
    .line 115
    .line 116
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 117
    .line 118
    .line 119
    move-result-object p0

    .line 120
    invoke-direct {v0, p0}, Ljava/lang/Throwable;-><init>(Ljava/lang/String;)V

    .line 121
    .line 122
    .line 123
    invoke-static {v0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 124
    .line 125
    .line 126
    return-void

    .line 127
    :cond_2
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/main/ConversationView;->b:Lv/VDraweeView;

    .line 128
    .line 129
    if-ne p1, v2, :cond_3

    .line 130
    .line 131
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->K()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 132
    .line 133
    .line 134
    move-result-object p1

    .line 135
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/main/ConversationView;->e()Lcom/p1/mobile/putong/app/PutongAct;

    .line 136
    .line 137
    .line 138
    move-result-object v0

    .line 139
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/main/ConversationView;->q:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 140
    .line 141
    iget-object v2, v2, Lcom/p1/mobile/putong/core/data/Conversation;->otherUser:Ljava/lang/String;

    .line 142
    .line 143
    const-string v3, "conversation_view"

    .line 144
    .line 145
    invoke-interface {p1, v0, v2, v3, v1}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->Ar(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Z)Landroid/content/Intent;

    .line 146
    .line 147
    .line 148
    move-result-object p1

    .line 149
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/main/ConversationView;->e()Lcom/p1/mobile/putong/app/PutongAct;

    .line 150
    .line 151
    .line 152
    move-result-object p0

    .line 153
    invoke-virtual {p0, p1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 154
    .line 155
    .line 156
    return-void

    .line 157
    :cond_3
    if-ne p1, p0, :cond_5

    .line 158
    .line 159
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/main/ConversationView;->s:Ll/y20;

    .line 160
    .line 161
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/Conversation;->otherUser:Ljava/lang/String;

    .line 162
    .line 163
    invoke-interface {p1, v0}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 164
    .line 165
    .line 166
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/main/ConversationView;->n:Landroid/widget/ImageView;

    .line 167
    .line 168
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 169
    .line 170
    .line 171
    move-result p1

    .line 172
    const-string v0, "p_messages_view"

    .line 173
    .line 174
    const-string v1, "e_red_dot_message_chat"

    .line 175
    .line 176
    if-eqz p1, :cond_4

    .line 177
    .line 178
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/main/ConversationView;->n:Landroid/widget/ImageView;

    .line 179
    .line 180
    invoke-static {p1}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 181
    .line 182
    .line 183
    move-result p1

    .line 184
    if-eqz p1, :cond_4

    .line 185
    .line 186
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/main/ConversationView;->q:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 187
    .line 188
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Conversation;->read:Ljava/lang/Boolean;

    .line 189
    .line 190
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 191
    .line 192
    .line 193
    move-result p0

    .line 194
    if-nez p0, :cond_4

    .line 195
    .line 196
    const-string p0, "message_list_page"

    .line 197
    .line 198
    const-string p1, "tips"

    .line 199
    .line 200
    const-string v2, "red_dot"

    .line 201
    .line 202
    const-string v3, "red_dot_normal"

    .line 203
    .line 204
    const-string v4, "chat_bar"

    .line 205
    .line 206
    invoke-static {v2, v3, v4, p0, p1}, Ll/i6e;->c(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/util/Map;

    .line 207
    .line 208
    .line 209
    move-result-object p0

    .line 210
    invoke-static {v1, v0, p0}, Ll/i4g0;->s(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    .line 211
    .line 212
    .line 213
    return-void

    .line 214
    :cond_4
    invoke-static {}, Ll/i6e;->d()Ljava/util/Map;

    .line 215
    .line 216
    .line 217
    move-result-object p0

    .line 218
    invoke-static {v1, v0, p0}, Ll/i4g0;->s(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    .line 219
    .line 220
    .line 221
    :cond_5
    return-void
.end method

.method public onDetachedFromWindow()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onDetachedFromWindow()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/main/ConversationView;->z:Ll/ft5;

    .line 5
    .line 6
    invoke-virtual {p0}, Ll/ft5;->c()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public onFinishInflate()V
    .locals 2

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/ui/main/ConversationView;->d(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0, p0}, Landroid/view/View;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 11
    .line 12
    .line 13
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/main/ConversationView;->l:Lv/VText;

    .line 14
    .line 15
    const/4 v0, 0x2

    .line 16
    const/high16 v1, 0x41800000    # 16.0f

    .line 17
    .line 18
    invoke-virtual {p0, v0, v1}, Landroidx/appcompat/widget/AppCompatTextView;->setTextSize(IF)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public onLongClick(Landroid/view/View;)Z
    .locals 5

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/main/ConversationView;->q:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    const/4 v0, 0x0

    .line 8
    if-eqz p1, :cond_2

    .line 9
    .line 10
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 11
    .line 12
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 13
    .line 14
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/main/ConversationView;->q:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 15
    .line 16
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/Conversation;->otherUser:Ljava/lang/String;

    .line 17
    .line 18
    invoke-virtual {p1, v1}, Ll/dkb;->Pa(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 23
    .line 24
    .line 25
    move-result p1

    .line 26
    if-eqz p1, :cond_2

    .line 27
    .line 28
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/main/ConversationView;->e()Lcom/p1/mobile/putong/app/PutongAct;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/main/ConversationView;->e()Lcom/p1/mobile/putong/app/PutongAct;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    sget v2, Lcom/p1/mobile/putong/core/message/R$string;->v6:I

    .line 37
    .line 38
    invoke-virtual {v1, v2}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    invoke-static {p1, v1}, Ll/f810;->a(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)Ljava/lang/CharSequence;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/main/ConversationView;->e()Lcom/p1/mobile/putong/app/PutongAct;

    .line 47
    .line 48
    .line 49
    move-result-object v1

    .line 50
    sget v2, Lcom/p1/mobile/putong/core/message/R$string;->w5:I

    .line 51
    .line 52
    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object v1

    .line 56
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/main/ConversationView;->e()Lcom/p1/mobile/putong/app/PutongAct;

    .line 57
    .line 58
    .line 59
    move-result-object v2

    .line 60
    sget v3, Lcom/p1/mobile/putong/core/message/R$string;->v5:I

    .line 61
    .line 62
    invoke-virtual {v2, v3}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object v2

    .line 66
    const/4 v3, 0x3

    .line 67
    new-array v3, v3, [Ljava/lang/CharSequence;

    .line 68
    .line 69
    aput-object p1, v3, v0

    .line 70
    .line 71
    const/4 p1, 0x1

    .line 72
    aput-object v1, v3, p1

    .line 73
    .line 74
    const/4 v1, 0x2

    .line 75
    aput-object v2, v3, v1

    .line 76
    .line 77
    invoke-static {v3}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 78
    .line 79
    .line 80
    move-result-object v2

    .line 81
    const-string v3, "e_match_list_set_nickname"

    .line 82
    .line 83
    const-string v4, "p_messages_view"

    .line 84
    .line 85
    invoke-static {v3, v4}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 86
    .line 87
    .line 88
    sget-object v3, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 89
    .line 90
    iget-object v3, v3, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 91
    .line 92
    iget-object v4, p0, Lcom/p1/mobile/putong/core/ui/main/ConversationView;->q:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 93
    .line 94
    iget-object v4, v4, Lcom/p1/mobile/putong/core/data/Conversation;->otherUser:Ljava/lang/String;

    .line 95
    .line 96
    invoke-virtual {v3, v4}, Ll/dkb;->Pa(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 97
    .line 98
    .line 99
    move-result-object v3

    .line 100
    invoke-virtual {v3}, Lcom/p1/mobile/putong/data/User;->isTeamAccount()Z

    .line 101
    .line 102
    .line 103
    move-result v3

    .line 104
    if-eqz v3, :cond_0

    .line 105
    .line 106
    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 107
    .line 108
    .line 109
    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 110
    .line 111
    .line 112
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 113
    .line 114
    .line 115
    move-result-object v0

    .line 116
    invoke-virtual {v0}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 117
    .line 118
    .line 119
    move-result-object v0

    .line 120
    invoke-interface {v0}, Ll/r97;->c()Z

    .line 121
    .line 122
    .line 123
    move-result v0

    .line 124
    if-eqz v0, :cond_1

    .line 125
    .line 126
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 127
    .line 128
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 129
    .line 130
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/main/ConversationView;->q:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 131
    .line 132
    iget-object v3, v3, Lcom/p1/mobile/putong/core/data/Conversation;->otherUser:Ljava/lang/String;

    .line 133
    .line 134
    invoke-virtual {v0, v3}, Ll/dkb;->Pa(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 135
    .line 136
    .line 137
    move-result-object v0

    .line 138
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->onlineMatchLocked()Z

    .line 139
    .line 140
    .line 141
    move-result v0

    .line 142
    if-eqz v0, :cond_1

    .line 143
    .line 144
    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 145
    .line 146
    .line 147
    :cond_1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/main/ConversationView;->e()Lcom/p1/mobile/putong/app/PutongAct;

    .line 148
    .line 149
    .line 150
    move-result-object v0

    .line 151
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->dialog()Lcom/p1/mobile/android/app/Dialog$e;

    .line 152
    .line 153
    .line 154
    move-result-object v0

    .line 155
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    .line 156
    .line 157
    .line 158
    move-result v1

    .line 159
    new-array v1, v1, [Ljava/lang/CharSequence;

    .line 160
    .line 161
    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 162
    .line 163
    .line 164
    move-result-object v1

    .line 165
    check-cast v1, [Ljava/lang/CharSequence;

    .line 166
    .line 167
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Dialog$e;->f0([Ljava/lang/CharSequence;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 168
    .line 169
    .line 170
    move-result-object v0

    .line 171
    new-instance v1, Ll/qm6;

    .line 172
    .line 173
    invoke-direct {v1, p0}, Ll/qm6;-><init>(Lcom/p1/mobile/putong/core/ui/main/ConversationView;)V

    .line 174
    .line 175
    .line 176
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Dialog$e;->g0(Lcom/p1/mobile/android/app/Dialog$g;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 177
    .line 178
    .line 179
    move-result-object p0

    .line 180
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Dialog$e;->z0()Lcom/p1/mobile/android/app/Dialog;

    .line 181
    .line 182
    .line 183
    return p1

    .line 184
    :cond_2
    return v0
.end method

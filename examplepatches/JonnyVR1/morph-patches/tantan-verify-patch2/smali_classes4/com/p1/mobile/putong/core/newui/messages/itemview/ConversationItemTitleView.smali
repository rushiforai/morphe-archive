.class public Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemTitleView;
.super Landroid/widget/LinearLayout;
.source "SourceFile"

# interfaces
.implements Ll/orl;


# instance fields
.field public a:Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemTitleView;

.field public b:Lv/VText;

.field public c:Lv/VDraweeView;

.field public d:Landroid/widget/LinearLayout;

.field public e:Lv/VImage;

.field public f:Lv/VImage;

.field public g:Lcom/p1/mobile/putong/newui/view/ODiamondTagLabel;

.field public h:Lv/VImage;

.field public i:Lv/VImage;

.field public j:Lv/VText;

.field public k:Lv/VImage;

.field public l:Lv/VImage;

.field public m:Lv/VText;

.field public n:Ll/sj6;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
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
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 6
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method private setCloseFriendIcon(Ll/sj6;)V
    .locals 3

    .line 1
    invoke-static {}, Ll/gra;->P()Lcom/p1/mobile/putong/core/data/ChatRoundsDisplayedExternallyConfig;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-eqz v0, :cond_2

    .line 7
    .line 8
    iget-boolean v0, v0, Lcom/p1/mobile/putong/core/data/ChatRoundsDisplayedExternallyConfig;->enabled:Z

    .line 9
    .line 10
    if-nez v0, :cond_0

    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_0
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemTitleView;->n:Ll/sj6;

    .line 14
    .line 15
    iget-object v0, p1, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 16
    .line 17
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-eqz v0, :cond_1

    .line 22
    .line 23
    iget-object v0, p1, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 24
    .line 25
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 26
    .line 27
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-eqz v0, :cond_1

    .line 32
    .line 33
    iget-object v0, p1, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 34
    .line 35
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 36
    .line 37
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->chatMM:Lcom/p1/mobile/putong/core/data/ChatMM;

    .line 38
    .line 39
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    if-eqz v0, :cond_1

    .line 44
    .line 45
    iget-object p1, p1, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 46
    .line 47
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 48
    .line 49
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->chatMM:Lcom/p1/mobile/putong/core/data/ChatMM;

    .line 50
    .line 51
    iget-boolean v2, v0, Lcom/p1/mobile/putong/core/data/ChatMM;->partnerSwitch:Z

    .line 52
    .line 53
    if-eqz v2, :cond_1

    .line 54
    .line 55
    iget v0, v0, Lcom/p1/mobile/putong/core/data/ChatMM;->level:I

    .line 56
    .line 57
    const/4 v2, 0x2

    .line 58
    if-le v0, v2, :cond_1

    .line 59
    .line 60
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/data/Conversation;->doubleDefault()Z

    .line 61
    .line 62
    .line 63
    move-result p1

    .line 64
    if-eqz p1, :cond_1

    .line 65
    .line 66
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemTitleView;->k:Lv/VImage;

    .line 67
    .line 68
    const/4 p1, 0x1

    .line 69
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 70
    .line 71
    .line 72
    return-void

    .line 73
    :cond_1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemTitleView;->k:Lv/VImage;

    .line 74
    .line 75
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 76
    .line 77
    .line 78
    return-void

    .line 79
    :cond_2
    :goto_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemTitleView;->k:Lv/VImage;

    .line 80
    .line 81
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 82
    .line 83
    .line 84
    return-void
.end method

.method private setComplimentTagIcon(Ll/sj6;)V
    .locals 0

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    iget-object p1, p1, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 4
    .line 5
    if-nez p1, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    invoke-static {p1}, Ll/br5;->s(Lcom/p1/mobile/putong/core/data/Conversation;)Z

    .line 9
    .line 10
    .line 11
    move-result p1

    .line 12
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemTitleView;->l:Lv/VImage;

    .line 13
    .line 14
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 15
    .line 16
    .line 17
    return-void

    .line 18
    :cond_1
    :goto_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemTitleView;->l:Lv/VImage;

    .line 19
    .line 20
    const/4 p1, 0x0

    .line 21
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method private setOldWelcomeGreet(Lcom/p1/mobile/putong/core/data/Conversation;)V
    .locals 1

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemTitleView;->m:Lv/VText;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemTitleView;->b:Lv/VText;

    .line 8
    .line 9
    const-string p1, "\u6211\u7684\u62db\u547c"

    .line 10
    .line 11
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public static synthetic u(Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemTitleView;Lcom/p1/mobile/putong/core/api/c0$b;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemTitleView;->M0(Lcom/p1/mobile/putong/core/api/c0$b;)V

    return-void
.end method


# virtual methods
.method public A(Ll/sj6;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemTitleView;->n:Ll/sj6;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemTitleView;->m:Lv/VText;

    .line 4
    .line 5
    const/4 p1, 0x0

    .line 6
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final B(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/oc6;->a(Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemTitleView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public G0(Ll/sj6;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemTitleView;->n:Ll/sj6;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemTitleView;->b:Lv/VText;

    .line 4
    .line 5
    iget-object p1, p1, Ll/sj6;->c:Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    invoke-static {p1}, Ll/gra;->c0(Lcom/p1/mobile/putong/data/User;)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public J(Ll/sj6;)V
    .locals 3

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemTitleView;->n:Ll/sj6;

    .line 2
    .line 3
    iget-object v0, p1, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 4
    .line 5
    iget-object v0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 6
    .line 7
    const-string v1, "fake_conversation_anonymous_greeting"

    .line 8
    .line 9
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    invoke-static {}, Ll/mn40;->b()Z

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    if-eqz v1, :cond_0

    .line 20
    .line 21
    iget-object p1, p1, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 22
    .line 23
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemTitleView;->setOldWelcomeGreet(Lcom/p1/mobile/putong/core/data/Conversation;)V

    .line 24
    .line 25
    .line 26
    return-void

    .line 27
    :cond_0
    if-eqz v0, :cond_1

    .line 28
    .line 29
    const-string v0, "\u804a\u5929\u5ba4\u6d88\u606f"

    .line 30
    .line 31
    goto :goto_1

    .line 32
    :cond_1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->o:Ll/gta;

    .line 33
    .line 34
    invoke-virtual {v0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->I5()Z

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    if-nez v0, :cond_4

    .line 43
    .line 44
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->jj()Z

    .line 53
    .line 54
    .line 55
    move-result v0

    .line 56
    if-eqz v0, :cond_2

    .line 57
    .line 58
    goto :goto_0

    .line 59
    :cond_2
    invoke-static {}, Ll/gra;->I2()Z

    .line 60
    .line 61
    .line 62
    move-result v0

    .line 63
    if-eqz v0, :cond_3

    .line 64
    .line 65
    iget-object v0, p1, Ll/sj6;->x:Lcom/p1/mobile/android/app/Act;

    .line 66
    .line 67
    sget v1, Lcom/p1/mobile/putong/core/R$string;->c5:I

    .line 68
    .line 69
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 70
    .line 71
    .line 72
    move-result-object v0

    .line 73
    goto :goto_1

    .line 74
    :cond_3
    const-string v0, ""

    .line 75
    .line 76
    goto :goto_1

    .line 77
    :cond_4
    :goto_0
    const-string v0, "\u6211\u7684\u544a\u767d"

    .line 78
    .line 79
    :goto_1
    invoke-static {}, Ll/d79;->U()Z

    .line 80
    .line 81
    .line 82
    move-result v1

    .line 83
    if-eqz v1, :cond_5

    .line 84
    .line 85
    iget-object v0, p1, Ll/sj6;->x:Lcom/p1/mobile/android/app/Act;

    .line 86
    .line 87
    sget v1, Lcom/p1/mobile/putong/core/R$string;->eh:I

    .line 88
    .line 89
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 90
    .line 91
    .line 92
    move-result-object v0

    .line 93
    :cond_5
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemTitleView;->b:Lv/VText;

    .line 94
    .line 95
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 96
    .line 97
    .line 98
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemTitleView;->m:Lv/VText;

    .line 99
    .line 100
    const/4 v1, 0x1

    .line 101
    invoke-static {v0, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 102
    .line 103
    .line 104
    invoke-static {}, Ll/gra;->z()Z

    .line 105
    .line 106
    .line 107
    move-result v0

    .line 108
    if-eqz v0, :cond_6

    .line 109
    .line 110
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemTitleView;->b:Lv/VText;

    .line 111
    .line 112
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemTitleView;->m:Lv/VText;

    .line 113
    .line 114
    invoke-static {v0, v1}, Ll/ue6;->k0(Landroid/widget/TextView;Landroid/widget/TextView;)V

    .line 115
    .line 116
    .line 117
    goto :goto_2

    .line 118
    :cond_6
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemTitleView;->m:Lv/VText;

    .line 119
    .line 120
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 121
    .line 122
    .line 123
    move-result-object v1

    .line 124
    sget v2, Ll/c9c0;->g0:I

    .line 125
    .line 126
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    .line 127
    .line 128
    .line 129
    move-result v1

    .line 130
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 131
    .line 132
    .line 133
    :goto_2
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemTitleView;->m:Lv/VText;

    .line 134
    .line 135
    iget-object p1, p1, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 136
    .line 137
    iget-wide v0, p1, Lcom/p1/mobile/putong/core/data/Conversation;->latestTime:D

    .line 138
    .line 139
    invoke-static {v0, v1}, Ll/pzi0;->G(D)Ljava/lang/String;

    .line 140
    .line 141
    .line 142
    move-result-object p1

    .line 143
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 144
    .line 145
    .line 146
    return-void
.end method

.method public final synthetic M0(Lcom/p1/mobile/putong/core/api/c0$b;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemTitleView;->e1()Z

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public P(Ll/sj6;)V
    .locals 4

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemTitleView;->n:Ll/sj6;

    .line 2
    .line 3
    iget-wide v0, p1, Ll/sj6;->G:D

    .line 4
    .line 5
    invoke-static {v0, v1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemTitleView;->m:Lv/VText;

    .line 14
    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    iget-wide v2, p1, Ll/sj6;->G:D

    .line 18
    .line 19
    invoke-static {v2, v3}, Ll/pzi0;->G(D)Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    invoke-virtual {v1, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 24
    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_0
    const-string p1, ""

    .line 28
    .line 29
    invoke-virtual {v1, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 30
    .line 31
    .line 32
    :goto_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemTitleView;->i1()V

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public Q0(Ll/sj6;)V
    .locals 9

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemTitleView;->n:Ll/sj6;

    .line 2
    .line 3
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemTitleView;->m:Lv/VText;

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    invoke-virtual {v0, v1, v1, v1, v1}, Landroidx/appcompat/widget/AppCompatTextView;->setCompoundDrawables(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 7
    .line 8
    .line 9
    invoke-static {}, Ll/gra;->l()Lcom/p1/mobile/putong/core/data/CollapsibleConversationConfig;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iget-boolean v0, v0, Lcom/p1/mobile/putong/core/data/CollapsibleConversationConfig;->enabled:Z

    .line 14
    .line 15
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemTitleView;->m:Lv/VText;

    .line 16
    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    iget-object v0, p1, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 20
    .line 21
    iget-wide v2, v0, Lcom/p1/mobile/putong/core/data/Conversation;->latestTime:D

    .line 22
    .line 23
    invoke-static {v2, v3}, Ll/pzi0;->G(D)Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 28
    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_0
    iget-object v0, p1, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 32
    .line 33
    iget-wide v2, v0, Lcom/p1/mobile/putong/core/data/Conversation;->latestTime:D

    .line 34
    .line 35
    invoke-static {v2, v3}, Ll/pzi0;->G(D)Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 40
    .line 41
    .line 42
    :goto_0
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 43
    .line 44
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 45
    .line 46
    iget-object v1, p1, Ll/sj6;->b:Lcom/p1/mobile/putong/data/User;

    .line 47
    .line 48
    iget-object v2, p1, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 49
    .line 50
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/putong/core/api/g;->bo(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/data/Conversation;)Z

    .line 51
    .line 52
    .line 53
    move-result v0

    .line 54
    const/4 v1, 0x1

    .line 55
    if-eqz v0, :cond_1

    .line 56
    .line 57
    iget-object v0, p1, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 58
    .line 59
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 60
    .line 61
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->tag:Lcom/p1/mobile/putong/core/data/ConversationAdditionalTag;

    .line 62
    .line 63
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/ConversationAdditionalTag;->type:Lcom/p1/mobile/putong/core/data/ConversationAdditionalTagType;

    .line 64
    .line 65
    const-string v2, "birthday"

    .line 66
    .line 67
    invoke-static {v0, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 68
    .line 69
    .line 70
    move-result v0

    .line 71
    if-eqz v0, :cond_1

    .line 72
    .line 73
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemTitleView;->f:Lv/VImage;

    .line 74
    .line 75
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 76
    .line 77
    .line 78
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemTitleView;->f:Lv/VImage;

    .line 79
    .line 80
    sget v2, Ll/dbc0;->of:I

    .line 81
    .line 82
    invoke-virtual {v0, v2}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 83
    .line 84
    .line 85
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemTitleView;->m:Lv/VText;

    .line 86
    .line 87
    invoke-static {v0, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 88
    .line 89
    .line 90
    iget-object v0, p1, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 91
    .line 92
    invoke-interface {p0, v0}, Ll/ue6;->i0(Lcom/p1/mobile/putong/core/data/Conversation;)Z

    .line 93
    .line 94
    .line 95
    move-result v0

    .line 96
    const/4 v2, 0x0

    .line 97
    const-wide/16 v3, 0x0

    .line 98
    .line 99
    if-eqz v0, :cond_3

    .line 100
    .line 101
    :try_start_0
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 102
    .line 103
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 104
    .line 105
    iget-object v0, v0, Ll/dkb;->u3:Ll/wyd0;

    .line 106
    .line 107
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 108
    .line 109
    .line 110
    move-result-object v0

    .line 111
    check-cast v0, Ljava/lang/String;

    .line 112
    .line 113
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 114
    .line 115
    .line 116
    move-result v5

    .line 117
    if-nez v5, :cond_2

    .line 118
    .line 119
    new-instance v5, Lorg/json/JSONObject;

    .line 120
    .line 121
    invoke-direct {v5, v0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 122
    .line 123
    .line 124
    goto :goto_1

    .line 125
    :cond_2
    new-instance v5, Lorg/json/JSONObject;

    .line 126
    .line 127
    invoke-direct {v5}, Lorg/json/JSONObject;-><init>()V

    .line 128
    .line 129
    .line 130
    :goto_1
    iget-object v6, p1, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 131
    .line 132
    iget-object v6, v6, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 133
    .line 134
    invoke-virtual {v5, v6, v3, v4}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;J)J

    .line 135
    .line 136
    .line 137
    move-result-wide v5

    .line 138
    iget-object v7, p1, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 139
    .line 140
    iget-object v7, v7, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 141
    .line 142
    invoke-interface {p0, v7, v0}, Ll/ue6;->b0(Ljava/lang/String;Ljava/lang/String;)Z

    .line 143
    .line 144
    .line 145
    move-result v0

    .line 146
    if-eqz v0, :cond_3

    .line 147
    .line 148
    cmp-long v0, v5, v3

    .line 149
    .line 150
    if-lez v0, :cond_3

    .line 151
    .line 152
    invoke-static {}, Ll/pzi0;->o()J

    .line 153
    .line 154
    .line 155
    move-result-wide v7

    .line 156
    cmp-long v0, v7, v5

    .line 157
    .line 158
    if-gez v0, :cond_3

    .line 159
    .line 160
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 161
    .line 162
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 163
    .line 164
    iget-object v0, v0, Ll/dkb;->p3:Ll/xyd0;

    .line 165
    .line 166
    invoke-virtual {v0}, Ll/dyd0;->get()Ljava/lang/Object;

    .line 167
    .line 168
    .line 169
    move-result-object v0

    .line 170
    check-cast v0, Ljava/util/HashSet;

    .line 171
    .line 172
    sget-object v5, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 173
    .line 174
    iget-object v5, v5, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 175
    .line 176
    iget-object v5, v5, Ll/dkb;->q3:Ll/xyd0;

    .line 177
    .line 178
    invoke-virtual {v5}, Ll/dyd0;->get()Ljava/lang/Object;

    .line 179
    .line 180
    .line 181
    move-result-object v5

    .line 182
    check-cast v5, Ljava/util/HashSet;

    .line 183
    .line 184
    iget-object v6, p1, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 185
    .line 186
    iget-object v6, v6, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 187
    .line 188
    invoke-virtual {v0, v6}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    .line 189
    .line 190
    .line 191
    move-result v0

    .line 192
    if-eqz v0, :cond_3

    .line 193
    .line 194
    iget-object v0, p1, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 195
    .line 196
    iget-object v0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 197
    .line 198
    invoke-virtual {v5, v0}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    .line 199
    .line 200
    .line 201
    move-result v0

    .line 202
    if-nez v0, :cond_3

    .line 203
    .line 204
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemTitleView;->m:Lv/VText;

    .line 205
    .line 206
    invoke-static {v0, v2}, Ll/bnl0;->M0(Landroid/view/View;Z)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 207
    .line 208
    .line 209
    :catch_0
    :cond_3
    invoke-static {}, Ll/gra;->z()Z

    .line 210
    .line 211
    .line 212
    move-result v0

    .line 213
    if-eqz v0, :cond_4

    .line 214
    .line 215
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemTitleView;->b:Lv/VText;

    .line 216
    .line 217
    iget-object v5, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemTitleView;->m:Lv/VText;

    .line 218
    .line 219
    invoke-static {v0, v5}, Ll/ue6;->k0(Landroid/widget/TextView;Landroid/widget/TextView;)V

    .line 220
    .line 221
    .line 222
    goto :goto_2

    .line 223
    :cond_4
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemTitleView;->m:Lv/VText;

    .line 224
    .line 225
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 226
    .line 227
    .line 228
    move-result-object v5

    .line 229
    sget v6, Ll/c9c0;->g0:I

    .line 230
    .line 231
    invoke-virtual {v5, v6}, Landroid/content/res/Resources;->getColor(I)I

    .line 232
    .line 233
    .line 234
    move-result v5

    .line 235
    invoke-virtual {v0, v5}, Landroid/widget/TextView;->setTextColor(I)V

    .line 236
    .line 237
    .line 238
    :goto_2
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemTitleView;->e:Lv/VImage;

    .line 239
    .line 240
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 241
    .line 242
    .line 243
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemTitleView;->setComplimentTagIcon(Ll/sj6;)V

    .line 244
    .line 245
    .line 246
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemTitleView;->d:Landroid/widget/LinearLayout;

    .line 247
    .line 248
    iget-object v5, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemTitleView;->l:Lv/VImage;

    .line 249
    .line 250
    invoke-static {v5}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 251
    .line 252
    .line 253
    move-result v5

    .line 254
    invoke-static {v0, v5}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 255
    .line 256
    .line 257
    iget-object v0, p1, Ll/sj6;->y:Ljava/lang/String;

    .line 258
    .line 259
    iget-object v5, p1, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 260
    .line 261
    iget-object v5, v5, Lcom/p1/mobile/putong/core/data/Conversation;->convType:Ljava/lang/String;

    .line 262
    .line 263
    invoke-virtual {p0, v0, v5}, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemTitleView;->h1(Ljava/lang/String;Ljava/lang/String;)V

    .line 264
    .line 265
    .line 266
    iget-object v0, p1, Ll/sj6;->b:Lcom/p1/mobile/putong/data/User;

    .line 267
    .line 268
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemTitleView;->d1(Lcom/p1/mobile/putong/data/User;)V

    .line 269
    .line 270
    .line 271
    iget-object v0, p1, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 272
    .line 273
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 274
    .line 275
    .line 276
    move-result v0

    .line 277
    if-eqz v0, :cond_5

    .line 278
    .line 279
    iget-object v0, p1, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 280
    .line 281
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/Conversation;->convType:Ljava/lang/String;

    .line 282
    .line 283
    const-string v5, "intlSeeChatRequest"

    .line 284
    .line 285
    invoke-static {v0, v5}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 286
    .line 287
    .line 288
    move-result v0

    .line 289
    if-eqz v0, :cond_5

    .line 290
    .line 291
    iget-object p1, p1, Ll/sj6;->b:Lcom/p1/mobile/putong/data/User;

    .line 292
    .line 293
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemTitleView;->b1(Lcom/p1/mobile/putong/data/User;)V

    .line 294
    .line 295
    .line 296
    return-void

    .line 297
    :cond_5
    invoke-static {}, Ll/d79;->e0()Z

    .line 298
    .line 299
    .line 300
    move-result v0

    .line 301
    if-eqz v0, :cond_9

    .line 302
    .line 303
    iget-object v0, p1, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 304
    .line 305
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 306
    .line 307
    .line 308
    move-result v0

    .line 309
    if-eqz v0, :cond_9

    .line 310
    .line 311
    iget-object v0, p1, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 312
    .line 313
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/Conversation;->convType:Ljava/lang/String;

    .line 314
    .line 315
    const-string v5, "lovebuzz"

    .line 316
    .line 317
    invoke-virtual {v5, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 318
    .line 319
    .line 320
    move-result v0

    .line 321
    if-eqz v0, :cond_9

    .line 322
    .line 323
    iget-object v0, p1, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 324
    .line 325
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/Conversation;->property:Lcom/p1/mobile/putong/core/data/ConversationProperty;

    .line 326
    .line 327
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 328
    .line 329
    .line 330
    move-result v0

    .line 331
    if-eqz v0, :cond_6

    .line 332
    .line 333
    iget-object v0, p1, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 334
    .line 335
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/Conversation;->property:Lcom/p1/mobile/putong/core/data/ConversationProperty;

    .line 336
    .line 337
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/ConversationProperty;->intl_love_buzz:Lcom/p1/mobile/putong/core/data/ConversationLoveBuzz;

    .line 338
    .line 339
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 340
    .line 341
    .line 342
    move-result v0

    .line 343
    if-eqz v0, :cond_6

    .line 344
    .line 345
    iget-object v0, p1, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 346
    .line 347
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/Conversation;->property:Lcom/p1/mobile/putong/core/data/ConversationProperty;

    .line 348
    .line 349
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/ConversationProperty;->intl_love_buzz:Lcom/p1/mobile/putong/core/data/ConversationLoveBuzz;

    .line 350
    .line 351
    iget-wide v3, v0, Lcom/p1/mobile/putong/core/data/ConversationLoveBuzz;->expire:J

    .line 352
    .line 353
    :cond_6
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 354
    .line 355
    .line 356
    move-result-object v0

    .line 357
    invoke-virtual {v0}, Ll/j49;->b()Lcom/p1/mobile/putong/core/buzz/service/CoreBuzzInnerService;

    .line 358
    .line 359
    .line 360
    move-result-object v0

    .line 361
    iget-object v5, p1, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 362
    .line 363
    invoke-interface {v0, v5}, Lcom/p1/mobile/putong/core/buzz/service/CoreBuzzInnerService;->zo(Lcom/p1/mobile/putong/core/data/Conversation;)Z

    .line 364
    .line 365
    .line 366
    move-result v0

    .line 367
    const/16 v5, 0x64

    .line 368
    .line 369
    if-nez v0, :cond_7

    .line 370
    .line 371
    iget v0, p1, Ll/sj6;->A:I

    .line 372
    .line 373
    goto :goto_3

    .line 374
    :cond_7
    move v0, v5

    .line 375
    :goto_3
    iget-object v6, p1, Ll/sj6;->b:Lcom/p1/mobile/putong/data/User;

    .line 376
    .line 377
    invoke-virtual {v6}, Lcom/p1/mobile/putong/data/User;->unilateralBlock()Z

    .line 378
    .line 379
    .line 380
    move-result v6

    .line 381
    if-nez v6, :cond_8

    .line 382
    .line 383
    if-ge v0, v5, :cond_8

    .line 384
    .line 385
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemTitleView;->m:Lv/VText;

    .line 386
    .line 387
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 388
    .line 389
    .line 390
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 391
    .line 392
    .line 393
    move-result-object v0

    .line 394
    invoke-virtual {v0}, Ll/j49;->b()Lcom/p1/mobile/putong/core/buzz/service/CoreBuzzInnerService;

    .line 395
    .line 396
    .line 397
    move-result-object v0

    .line 398
    iget-object v1, p1, Ll/sj6;->x:Lcom/p1/mobile/android/app/Act;

    .line 399
    .line 400
    iget-object v5, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemTitleView;->m:Lv/VText;

    .line 401
    .line 402
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 403
    .line 404
    .line 405
    move-result-object v6

    .line 406
    invoke-virtual {v6}, Ll/j49;->b()Lcom/p1/mobile/putong/core/buzz/service/CoreBuzzInnerService;

    .line 407
    .line 408
    .line 409
    move-result-object v6

    .line 410
    invoke-interface {v6, v3, v4}, Lcom/p1/mobile/putong/core/buzz/service/CoreBuzzInnerService;->Uq(J)Ljava/lang/String;

    .line 411
    .line 412
    .line 413
    move-result-object v3

    .line 414
    invoke-interface {v0, v1, v5, v3}, Lcom/p1/mobile/putong/core/buzz/service/CoreBuzzInnerService;->mf(Landroid/content/Context;Lv/VText;Ljava/lang/String;)V

    .line 415
    .line 416
    .line 417
    goto :goto_4

    .line 418
    :cond_8
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->l:Ll/j49;

    .line 419
    .line 420
    invoke-virtual {v0}, Ll/j49;->b()Lcom/p1/mobile/putong/core/buzz/service/CoreBuzzInnerService;

    .line 421
    .line 422
    .line 423
    move-result-object v0

    .line 424
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemTitleView;->m:Lv/VText;

    .line 425
    .line 426
    iget-object v3, p1, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 427
    .line 428
    iget-wide v3, v3, Lcom/p1/mobile/putong/core/data/Conversation;->latestTime:D

    .line 429
    .line 430
    invoke-static {v3, v4}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 431
    .line 432
    .line 433
    move-result-object v3

    .line 434
    invoke-interface {v0, v1, v3}, Lcom/p1/mobile/putong/core/buzz/service/CoreBuzzInnerService;->Dj(Lv/VText;Ljava/lang/Double;)V

    .line 435
    .line 436
    .line 437
    :cond_9
    :goto_4
    iget-object v0, p1, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 438
    .line 439
    invoke-interface {p0, v0}, Ll/ue6;->j(Lcom/p1/mobile/putong/core/data/Conversation;)Z

    .line 440
    .line 441
    .line 442
    move-result v0

    .line 443
    if-nez v0, :cond_a

    .line 444
    .line 445
    iget-object v0, p1, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 446
    .line 447
    invoke-interface {p0, v0}, Ll/ue6;->Z0(Lcom/p1/mobile/putong/core/data/Conversation;)Z

    .line 448
    .line 449
    .line 450
    move-result v0

    .line 451
    if-nez v0, :cond_a

    .line 452
    .line 453
    goto :goto_5

    .line 454
    :cond_a
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemTitleView;->m:Lv/VText;

    .line 455
    .line 456
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 457
    .line 458
    .line 459
    :goto_5
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemTitleView;->f1(Ll/sj6;)V

    .line 460
    .line 461
    .line 462
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemTitleView;->c1(Ll/sj6;)V

    .line 463
    .line 464
    .line 465
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemTitleView;->g1(Ll/sj6;)V

    .line 466
    .line 467
    .line 468
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemTitleView;->i1()V

    .line 469
    .line 470
    .line 471
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemTitleView;->y0()V

    .line 472
    .line 473
    .line 474
    return-void
.end method

.method public U(Ll/sj6;)V
    .locals 2
    .param p1    # Ll/sj6;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemTitleView;->b:Lv/VText;

    .line 2
    .line 3
    const-string v1, "\u60f3\u7ed3\u5a5a\u6d88\u606f"

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemTitleView;->m:Lv/VText;

    .line 9
    .line 10
    iget-object p1, p1, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 11
    .line 12
    iget-wide v0, p1, Lcom/p1/mobile/putong/core/data/Conversation;->latestTime:D

    .line 13
    .line 14
    invoke-static {v0, v1}, Ll/pzi0;->G(D)Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public X0(Ll/sj6;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemTitleView;->b:Lv/VText;

    .line 2
    .line 3
    const-string v1, "\u57ce\u5e02\u5c01\u9762 \u597d\u53cb\u7533\u8bf7"

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemTitleView;->m:Lv/VText;

    .line 9
    .line 10
    iget-object p1, p1, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 11
    .line 12
    iget-wide v0, p1, Lcom/p1/mobile/putong/core/data/Conversation;->latestTime:D

    .line 13
    .line 14
    invoke-static {v0, v1}, Ll/pzi0;->G(D)Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public b1(Lcom/p1/mobile/putong/data/User;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemTitleView;->b:Lv/VText;

    .line 2
    .line 3
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->location:Lcom/p1/mobile/putong/data/Location;

    .line 9
    .line 10
    iget-wide v0, v0, Lcom/p1/mobile/putong/data/Location;->updatedTime:D

    .line 11
    .line 12
    invoke-static {v0, v1}, Ll/r8n;->i(D)Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    const/4 v1, 0x1

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemTitleView;->m:Lv/VText;

    .line 20
    .line 21
    sget v0, Lcom/p1/mobile/putong/core/R$string;->Ml:I

    .line 22
    .line 23
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(I)V

    .line 24
    .line 25
    .line 26
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemTitleView;->m:Lv/VText;

    .line 27
    .line 28
    const-string v0, "#00c853"

    .line 29
    .line 30
    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 35
    .line 36
    .line 37
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemTitleView;->m:Lv/VText;

    .line 38
    .line 39
    const/4 v0, 0x3

    .line 40
    invoke-static {v0}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 45
    .line 46
    .line 47
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemTitleView;->n:Ll/sj6;

    .line 48
    .line 49
    const-string v0, "online"

    .line 50
    .line 51
    iput-object v0, p1, Ll/sj6;->i:Ljava/lang/String;

    .line 52
    .line 53
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemTitleView;->m:Lv/VText;

    .line 54
    .line 55
    invoke-static {p0, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 56
    .line 57
    .line 58
    return-void

    .line 59
    :cond_0
    invoke-static {}, Ll/r8n;->f()Ll/r8n;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    iget-object v2, p1, Lcom/p1/mobile/putong/data/User;->location:Lcom/p1/mobile/putong/data/Location;

    .line 64
    .line 65
    iget v2, v2, Lcom/p1/mobile/putong/data/Location;->distance:I

    .line 66
    .line 67
    invoke-virtual {v0, v2}, Ll/r8n;->j(I)Z

    .line 68
    .line 69
    .line 70
    move-result v0

    .line 71
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemTitleView;->m:Lv/VText;

    .line 72
    .line 73
    if-eqz v0, :cond_1

    .line 74
    .line 75
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->location:Lcom/p1/mobile/putong/data/Location;

    .line 76
    .line 77
    iget p1, p1, Lcom/p1/mobile/putong/data/Location;->distance:I

    .line 78
    .line 79
    invoke-interface {p0, p1}, Ll/ue6;->H0(I)Ljava/lang/String;

    .line 80
    .line 81
    .line 82
    move-result-object p1

    .line 83
    invoke-virtual {v2, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 84
    .line 85
    .line 86
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemTitleView;->m:Lv/VText;

    .line 87
    .line 88
    const-string v0, "#f8ae1d"

    .line 89
    .line 90
    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 91
    .line 92
    .line 93
    move-result v0

    .line 94
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 95
    .line 96
    .line 97
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemTitleView;->n:Ll/sj6;

    .line 98
    .line 99
    const-string v0, "nearby"

    .line 100
    .line 101
    iput-object v0, p1, Ll/sj6;->i:Ljava/lang/String;

    .line 102
    .line 103
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemTitleView;->m:Lv/VText;

    .line 104
    .line 105
    invoke-static {p0, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 106
    .line 107
    .line 108
    return-void

    .line 109
    :cond_1
    const/4 p1, 0x0

    .line 110
    invoke-static {v2, p1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 111
    .line 112
    .line 113
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemTitleView;->n:Ll/sj6;

    .line 114
    .line 115
    const-string p1, "normal"

    .line 116
    .line 117
    iput-object p1, p0, Ll/sj6;->i:Ljava/lang/String;

    .line 118
    .line 119
    return-void
.end method

.method public final c1(Ll/sj6;)V
    .locals 0

    .line 1
    invoke-interface {p0, p1}, Ll/ue6;->q(Ll/sj6;)Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemTitleView;->m:Lv/VText;

    .line 8
    .line 9
    const/4 p1, 0x0

    .line 10
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 11
    .line 12
    .line 13
    :cond_0
    return-void
.end method

.method public d(Ll/sj6;)V
    .locals 3

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemTitleView;->n:Ll/sj6;

    .line 2
    .line 3
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemTitleView;->b:Lv/VText;

    .line 4
    .line 5
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    sget v2, Ll/c9c0;->Q1:I

    .line 14
    .line 15
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 20
    .line 21
    .line 22
    iget-object v0, p1, Ll/sj6;->b:Lcom/p1/mobile/putong/data/User;

    .line 23
    .line 24
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    if-eqz v0, :cond_0

    .line 29
    .line 30
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemTitleView;->b:Lv/VText;

    .line 31
    .line 32
    iget-object v1, p1, Ll/sj6;->b:Lcom/p1/mobile/putong/data/User;

    .line 33
    .line 34
    iget-object v1, v1, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 35
    .line 36
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 37
    .line 38
    .line 39
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemTitleView;->m:Lv/VText;

    .line 40
    .line 41
    iget-object p1, p1, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 42
    .line 43
    iget-wide v0, p1, Lcom/p1/mobile/putong/core/data/Conversation;->latestTime:D

    .line 44
    .line 45
    invoke-static {v0, v1}, Ll/pzi0;->G(D)Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 50
    .line 51
    .line 52
    return-void
.end method

.method public d0(Ll/sj6;)V
    .locals 4

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemTitleView;->n:Ll/sj6;

    .line 2
    .line 3
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemTitleView;->b:Lv/VText;

    .line 4
    .line 5
    iget-object v1, p1, Ll/sj6;->x:Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    sget v2, Ll/c9c0;->Q1:I

    .line 8
    .line 9
    invoke-virtual {v1, v2}, Lcom/p1/mobile/android/app/Act;->color(I)I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemTitleView;->b:Lv/VText;

    .line 17
    .line 18
    iget-object v1, p1, Ll/sj6;->b:Lcom/p1/mobile/putong/data/User;

    .line 19
    .line 20
    iget-object v1, v1, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 21
    .line 22
    iget-object v2, p1, Ll/sj6;->y:Ljava/lang/String;

    .line 23
    .line 24
    const/4 v3, 0x1

    .line 25
    invoke-interface {p0, v1, v2, v3}, Ll/ue6;->D0(Ljava/lang/String;Ljava/lang/String;Z)Ljava/lang/CharSequence;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 30
    .line 31
    .line 32
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 33
    .line 34
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 35
    .line 36
    iget-object v1, p1, Ll/sj6;->b:Lcom/p1/mobile/putong/data/User;

    .line 37
    .line 38
    iget-object v1, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 39
    .line 40
    invoke-virtual {v0, v1}, Ll/dkb;->y7(Ljava/lang/String;)Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 45
    .line 46
    .line 47
    move-result v1

    .line 48
    if-nez v1, :cond_0

    .line 49
    .line 50
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemTitleView;->b:Lv/VText;

    .line 51
    .line 52
    iget-object p1, p1, Ll/sj6;->y:Ljava/lang/String;

    .line 53
    .line 54
    invoke-interface {p0, v0, p1, v3}, Ll/ue6;->D0(Ljava/lang/String;Ljava/lang/String;Z)Ljava/lang/CharSequence;

    .line 55
    .line 56
    .line 57
    move-result-object p1

    .line 58
    invoke-virtual {v1, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 59
    .line 60
    .line 61
    goto :goto_1

    .line 62
    :cond_0
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 63
    .line 64
    .line 65
    move-result v0

    .line 66
    if-eqz v0, :cond_3

    .line 67
    .line 68
    invoke-static {}, Ll/gra;->t1()Z

    .line 69
    .line 70
    .line 71
    move-result v0

    .line 72
    if-eqz v0, :cond_3

    .line 73
    .line 74
    iget-object v0, p1, Ll/sj6;->b:Lcom/p1/mobile/putong/data/User;

    .line 75
    .line 76
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 77
    .line 78
    .line 79
    move-result v0

    .line 80
    if-eqz v0, :cond_2

    .line 81
    .line 82
    iget-object p1, p1, Ll/sj6;->b:Lcom/p1/mobile/putong/data/User;

    .line 83
    .line 84
    iget-boolean v0, p1, Lcom/p1/mobile/putong/data/User;->inactivated:Z

    .line 85
    .line 86
    if-eqz v0, :cond_1

    .line 87
    .line 88
    goto :goto_0

    .line 89
    :cond_1
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->status:Ljava/util/List;

    .line 90
    .line 91
    const-string v0, "RISK_TAG_CHAT_PROFILE_PICTURE_HIDDEN"

    .line 92
    .line 93
    invoke-static {v0}, Lcom/p1/mobile/putong/data/UserStatus;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/UserStatus;

    .line 94
    .line 95
    .line 96
    move-result-object v0

    .line 97
    invoke-interface {p1, v0}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 98
    .line 99
    .line 100
    move-result p1

    .line 101
    if-eqz p1, :cond_3

    .line 102
    .line 103
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemTitleView;->b:Lv/VText;

    .line 104
    .line 105
    const-string v0, "\u6635\u79f0\u5df2\u91cd\u7f6e"

    .line 106
    .line 107
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 108
    .line 109
    .line 110
    goto :goto_1

    .line 111
    :cond_2
    :goto_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemTitleView;->b:Lv/VText;

    .line 112
    .line 113
    const-string v0, "\u5df2\u6ce8\u9500"

    .line 114
    .line 115
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 116
    .line 117
    .line 118
    :cond_3
    :goto_1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemTitleView;->b:Lv/VText;

    .line 119
    .line 120
    invoke-virtual {p1}, Landroid/view/View;->requestLayout()V

    .line 121
    .line 122
    .line 123
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemTitleView;->h:Lv/VImage;

    .line 124
    .line 125
    const/4 v0, 0x0

    .line 126
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 127
    .line 128
    .line 129
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemTitleView;->g:Lcom/p1/mobile/putong/newui/view/ODiamondTagLabel;

    .line 130
    .line 131
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 132
    .line 133
    .line 134
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemTitleView;->d:Landroid/widget/LinearLayout;

    .line 135
    .line 136
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 137
    .line 138
    .line 139
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemTitleView;->i1()V

    .line 140
    .line 141
    .line 142
    return-void
.end method

.method public final d1(Lcom/p1/mobile/putong/data/User;)V
    .locals 4

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 4
    .line 5
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Extensions;->interest:Lcom/p1/mobile/putong/data/Interest;

    .line 6
    .line 7
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Interest;->emoji:Ljava/util/List;

    .line 8
    .line 9
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemTitleView;->c:Lv/VDraweeView;

    .line 14
    .line 15
    const/4 v2, 0x0

    .line 16
    if-nez v0, :cond_0

    .line 17
    .line 18
    invoke-static {v1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 19
    .line 20
    .line 21
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 22
    .line 23
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemTitleView;->c:Lv/VDraweeView;

    .line 24
    .line 25
    new-instance v1, Ljava/lang/StringBuilder;

    .line 26
    .line 27
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 28
    .line 29
    .line 30
    sget-object v3, Ll/uqb0;->X:Ll/hj5;

    .line 31
    .line 32
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 33
    .line 34
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 35
    .line 36
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Extensions;->interest:Lcom/p1/mobile/putong/data/Interest;

    .line 37
    .line 38
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Interest;->emoji:Ljava/util/List;

    .line 39
    .line 40
    invoke-interface {p1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    check-cast p1, Ljava/lang/String;

    .line 45
    .line 46
    invoke-virtual {v3, p1}, Ll/hj5;->n(Ljava/lang/String;)Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object p1

    .line 50
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 51
    .line 52
    .line 53
    const-string p1, ".png"

    .line 54
    .line 55
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object p1

    .line 62
    invoke-virtual {v0, p0, p1}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 63
    .line 64
    .line 65
    return-void

    .line 66
    :cond_0
    invoke-static {v1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 67
    .line 68
    .line 69
    return-void
.end method

.method public e(Ll/sj6;)V
    .locals 4

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemTitleView;->n:Ll/sj6;

    .line 2
    .line 3
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemTitleView;->b:Lv/VText;

    .line 4
    .line 5
    iget-object v1, p1, Ll/sj6;->B:Lcom/p1/mobile/putong/core/data/ChatGroup;

    .line 6
    .line 7
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/ChatGroup;->name:Ljava/lang/String;

    .line 8
    .line 9
    iget-object v2, p1, Ll/sj6;->y:Ljava/lang/String;

    .line 10
    .line 11
    const/4 v3, 0x1

    .line 12
    invoke-interface {p0, v1, v2, v3}, Ll/ue6;->D0(Ljava/lang/String;Ljava/lang/String;Z)Ljava/lang/CharSequence;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemTitleView;->m:Lv/VText;

    .line 20
    .line 21
    invoke-static {v0, v3}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 22
    .line 23
    .line 24
    invoke-static {}, Ll/gra;->z()Z

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    if-eqz v0, :cond_0

    .line 29
    .line 30
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemTitleView;->b:Lv/VText;

    .line 31
    .line 32
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemTitleView;->m:Lv/VText;

    .line 33
    .line 34
    invoke-static {v0, v1}, Ll/ue6;->k0(Landroid/widget/TextView;Landroid/widget/TextView;)V

    .line 35
    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemTitleView;->m:Lv/VText;

    .line 39
    .line 40
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    sget v2, Ll/c9c0;->g0:I

    .line 45
    .line 46
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    .line 47
    .line 48
    .line 49
    move-result v1

    .line 50
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 51
    .line 52
    .line 53
    :goto_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemTitleView;->m:Lv/VText;

    .line 54
    .line 55
    iget-object v1, p1, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 56
    .line 57
    iget-wide v1, v1, Lcom/p1/mobile/putong/core/data/Conversation;->latestTime:D

    .line 58
    .line 59
    invoke-static {v1, v2}, Ll/pzi0;->G(D)Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object v1

    .line 63
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 64
    .line 65
    .line 66
    iget-boolean v0, p1, Ll/sj6;->u:Z

    .line 67
    .line 68
    if-eqz v0, :cond_1

    .line 69
    .line 70
    iget-object v0, p1, Ll/sj6;->w:Lcom/p1/mobile/putong/data/User;

    .line 71
    .line 72
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 73
    .line 74
    .line 75
    move-result v0

    .line 76
    if-eqz v0, :cond_1

    .line 77
    .line 78
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemTitleView;->b:Lv/VText;

    .line 79
    .line 80
    iget-object p1, p1, Ll/sj6;->w:Lcom/p1/mobile/putong/data/User;

    .line 81
    .line 82
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 83
    .line 84
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 85
    .line 86
    .line 87
    :cond_1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemTitleView;->y0()V

    .line 88
    .line 89
    .line 90
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemTitleView;->i1()V

    .line 91
    .line 92
    .line 93
    return-void
.end method

.method public final e1()Z
    .locals 12

    .line 1
    sget-object v0, Ll/for;->INSTANCE:Ll/for;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/for;->e()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-static {}, Ll/pzi0;->o()J

    .line 8
    .line 9
    .line 10
    move-result-wide v2

    .line 11
    const-string v4, "trialing"

    .line 12
    .line 13
    invoke-virtual {v4, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result v4

    .line 17
    const/4 v5, 0x1

    .line 18
    const/4 v6, 0x0

    .line 19
    if-eqz v4, :cond_1

    .line 20
    .line 21
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemTitleView;->j:Lv/VText;

    .line 22
    .line 23
    sget v1, Ll/dbc0;->M5:I

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/AppCompatTextView;->setBackgroundResource(I)V

    .line 26
    .line 27
    .line 28
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemTitleView;->j:Lv/VText;

    .line 29
    .line 30
    const/4 v1, -0x1

    .line 31
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 32
    .line 33
    .line 34
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 35
    .line 36
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->B2:Ll/sk9;

    .line 37
    .line 38
    invoke-virtual {v0}, Ll/sk9;->m3()J

    .line 39
    .line 40
    .line 41
    move-result-wide v0

    .line 42
    cmp-long v4, v0, v2

    .line 43
    .line 44
    if-lez v4, :cond_0

    .line 45
    .line 46
    sget-object v4, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 47
    .line 48
    iget-object v4, v4, Lcom/p1/mobile/putong/core/api/c;->t1:Lcom/p1/mobile/putong/core/api/c0;

    .line 49
    .line 50
    sub-long/2addr v0, v2

    .line 51
    invoke-virtual {v4, v0, v1}, Lcom/p1/mobile/putong/core/api/c0;->k(J)Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    goto :goto_0

    .line 56
    :cond_0
    const-string v0, "00:00:00"

    .line 57
    .line 58
    :goto_0
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemTitleView;->j:Lv/VText;

    .line 59
    .line 60
    const-string v2, "%s\u540e\u5931\u6548"

    .line 61
    .line 62
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    invoke-static {v2, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 71
    .line 72
    .line 73
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemTitleView;->j:Lv/VText;

    .line 74
    .line 75
    invoke-static {p0, v5}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 76
    .line 77
    .line 78
    return v6

    .line 79
    :cond_1
    const-string v4, "trialEnd"

    .line 80
    .line 81
    invoke-virtual {v4, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 82
    .line 83
    .line 84
    move-result v7

    .line 85
    if-nez v7, :cond_3

    .line 86
    .line 87
    const-string v7, "waiting"

    .line 88
    .line 89
    invoke-virtual {v7, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 90
    .line 91
    .line 92
    move-result v7

    .line 93
    if-nez v7, :cond_3

    .line 94
    .line 95
    const-string v7, "expired"

    .line 96
    .line 97
    invoke-virtual {v7, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 98
    .line 99
    .line 100
    move-result v7

    .line 101
    if-eqz v7, :cond_2

    .line 102
    .line 103
    goto :goto_1

    .line 104
    :cond_2
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemTitleView;->j:Lv/VText;

    .line 105
    .line 106
    invoke-static {p0, v6}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 107
    .line 108
    .line 109
    return v6

    .line 110
    :cond_3
    :goto_1
    sget-object v6, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 111
    .line 112
    iget-object v6, v6, Lcom/p1/mobile/putong/core/api/c;->B2:Ll/sk9;

    .line 113
    .line 114
    invoke-virtual {v6}, Ll/sk9;->m3()J

    .line 115
    .line 116
    .line 117
    move-result-wide v6

    .line 118
    const-wide/16 v8, 0x0

    .line 119
    .line 120
    cmp-long v8, v6, v8

    .line 121
    .line 122
    if-gtz v8, :cond_4

    .line 123
    .line 124
    invoke-virtual {v4, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 125
    .line 126
    .line 127
    move-result v1

    .line 128
    if-eqz v1, :cond_4

    .line 129
    .line 130
    invoke-static {}, Ll/joa;->t3()J

    .line 131
    .line 132
    .line 133
    move-result-wide v6

    .line 134
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 135
    .line 136
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->Q1:Lcom/p1/mobile/putong/core/api/t;

    .line 137
    .line 138
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/t;->R:Lcom/p1/mobile/putong/core/api/t$a;

    .line 139
    .line 140
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/api/t$a;->F()J

    .line 141
    .line 142
    .line 143
    move-result-wide v8

    .line 144
    const-wide/16 v10, 0x3e8

    .line 145
    .line 146
    mul-long/2addr v8, v10

    .line 147
    add-long/2addr v6, v8

    .line 148
    :cond_4
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemTitleView;->j:Lv/VText;

    .line 149
    .line 150
    sget v4, Ll/dbc0;->L5:I

    .line 151
    .line 152
    invoke-virtual {v1, v4}, Landroidx/appcompat/widget/AppCompatTextView;->setBackgroundResource(I)V

    .line 153
    .line 154
    .line 155
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemTitleView;->j:Lv/VText;

    .line 156
    .line 157
    sget-object v4, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 158
    .line 159
    invoke-virtual {v4}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 160
    .line 161
    .line 162
    move-result-object v4

    .line 163
    sget v8, Ll/c9c0;->E:I

    .line 164
    .line 165
    invoke-virtual {v4, v8}, Landroid/content/res/Resources;->getColor(I)I

    .line 166
    .line 167
    .line 168
    move-result v4

    .line 169
    invoke-virtual {v1, v4}, Landroid/widget/TextView;->setTextColor(I)V

    .line 170
    .line 171
    .line 172
    cmp-long v1, v6, v2

    .line 173
    .line 174
    if-lez v1, :cond_5

    .line 175
    .line 176
    sub-long/2addr v6, v2

    .line 177
    invoke-virtual {v0, v6, v7}, Ll/for;->c(J)Ljava/lang/String;

    .line 178
    .line 179
    .line 180
    move-result-object v0

    .line 181
    goto :goto_2

    .line 182
    :cond_5
    const-string v0, "0\u5206\u949f"

    .line 183
    .line 184
    :goto_2
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemTitleView;->j:Lv/VText;

    .line 185
    .line 186
    const-string v2, "%s\u5185\u53ef\u6062\u590d"

    .line 187
    .line 188
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 189
    .line 190
    .line 191
    move-result-object v0

    .line 192
    invoke-static {v2, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 193
    .line 194
    .line 195
    move-result-object v0

    .line 196
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 197
    .line 198
    .line 199
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemTitleView;->j:Lv/VText;

    .line 200
    .line 201
    invoke-static {p0, v5}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 202
    .line 203
    .line 204
    return v5
.end method

.method public f1(Ll/sj6;)V
    .locals 6
    .param p1    # Ll/sj6;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iget-object v0, p1, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 2
    .line 3
    invoke-interface {p0, v0}, Ll/ue6;->p0(Lcom/p1/mobile/putong/core/data/Conversation;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_2

    .line 8
    .line 9
    iget-object v0, p1, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 10
    .line 11
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/Conversation;->property:Lcom/p1/mobile/putong/core/data/ConversationProperty;

    .line 12
    .line 13
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/ConversationProperty;->conversationTag:Lcom/p1/mobile/putong/core/data/ConversationTag;

    .line 14
    .line 15
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/ConversationTag;->suggestText:Ljava/lang/String;

    .line 16
    .line 17
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-eqz v0, :cond_0

    .line 22
    .line 23
    iget-object v0, p1, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 24
    .line 25
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/Conversation;->property:Lcom/p1/mobile/putong/core/data/ConversationProperty;

    .line 26
    .line 27
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/ConversationProperty;->conversationTag:Lcom/p1/mobile/putong/core/data/ConversationTag;

    .line 28
    .line 29
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/ConversationTag;->emoji:Ljava/lang/String;

    .line 30
    .line 31
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    if-nez v0, :cond_2

    .line 36
    .line 37
    :cond_0
    iget-object v0, p1, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 38
    .line 39
    iget v1, v0, Lcom/p1/mobile/putong/core/data/Conversation;->unreadMessages:I

    .line 40
    .line 41
    if-gtz v1, :cond_2

    .line 42
    .line 43
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/Conversation;->property:Lcom/p1/mobile/putong/core/data/ConversationProperty;

    .line 44
    .line 45
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/ConversationProperty;->conversationTag:Lcom/p1/mobile/putong/core/data/ConversationTag;

    .line 46
    .line 47
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/ConversationTag;->suggestExpireTime:Ljava/lang/String;

    .line 48
    .line 49
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 50
    .line 51
    .line 52
    move-result v0

    .line 53
    if-nez v0, :cond_1

    .line 54
    .line 55
    iget-object v0, p1, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 56
    .line 57
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/Conversation;->property:Lcom/p1/mobile/putong/core/data/ConversationProperty;

    .line 58
    .line 59
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/ConversationProperty;->conversationTag:Lcom/p1/mobile/putong/core/data/ConversationTag;

    .line 60
    .line 61
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/ConversationTag;->suggestExpireTime:Ljava/lang/String;

    .line 62
    .line 63
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 64
    .line 65
    .line 66
    move-result v0

    .line 67
    if-nez v0, :cond_2

    .line 68
    .line 69
    invoke-static {}, Ll/pzi0;->o()J

    .line 70
    .line 71
    .line 72
    move-result-wide v0

    .line 73
    iget-object p1, p1, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 74
    .line 75
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/Conversation;->property:Lcom/p1/mobile/putong/core/data/ConversationProperty;

    .line 76
    .line 77
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/ConversationProperty;->conversationTag:Lcom/p1/mobile/putong/core/data/ConversationTag;

    .line 78
    .line 79
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/ConversationTag;->suggestExpireTime:Ljava/lang/String;

    .line 80
    .line 81
    invoke-static {p1}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    .line 82
    .line 83
    .line 84
    move-result-wide v2

    .line 85
    const-wide/16 v4, 0x3e8

    .line 86
    .line 87
    mul-long/2addr v2, v4

    .line 88
    cmp-long p1, v0, v2

    .line 89
    .line 90
    if-gez p1, :cond_2

    .line 91
    .line 92
    :cond_1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemTitleView;->m:Lv/VText;

    .line 93
    .line 94
    const/4 p1, 0x0

    .line 95
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 96
    .line 97
    .line 98
    :cond_2
    return-void
.end method

.method public final g1(Ll/sj6;)V
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
    iget-object v0, p1, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 8
    .line 9
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    iget-object p1, p1, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 16
    .line 17
    iget v0, p1, Lcom/p1/mobile/putong/core/data/Conversation;->unreadMessages:I

    .line 18
    .line 19
    if-nez v0, :cond_0

    .line 20
    .line 21
    invoke-static {p1}, Ll/evf0;->a(Lcom/p1/mobile/putong/core/data/Conversation;)Z

    .line 22
    .line 23
    .line 24
    move-result p1

    .line 25
    if-eqz p1, :cond_0

    .line 26
    .line 27
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemTitleView;->m:Lv/VText;

    .line 28
    .line 29
    const/4 p1, 0x0

    .line 30
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 31
    .line 32
    .line 33
    :cond_0
    return-void
.end method

.method public bridge synthetic getUserLiveLabelHashMap()Ljava/util/HashMap;
    .locals 0

    .line 1
    invoke-super {p0}, Ll/ue6;->getUserLiveLabelHashMap()Ljava/util/HashMap;

    move-result-object p0

    return-object p0
.end method

.method public h0(Ll/sj6;)V
    .locals 2

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemTitleView;->n:Ll/sj6;

    .line 2
    .line 3
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemTitleView;->b:Lv/VText;

    .line 4
    .line 5
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    sget v1, Ll/c9c0;->Q1:I

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getColor(I)I

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 20
    .line 21
    .line 22
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemTitleView;->b:Lv/VText;

    .line 23
    .line 24
    sget p1, Lcom/p1/mobile/putong/core/R$string;->Pa:I

    .line 25
    .line 26
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(I)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public final h1(Ljava/lang/String;Ljava/lang/String;)V
    .locals 3

    .line 1
    const-string v0, "conversation_intl_fake"

    .line 2
    .line 3
    invoke-static {v0, p2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result p2

    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemTitleView;->b:Lv/VText;

    .line 8
    .line 9
    const/4 v1, 0x1

    .line 10
    if-eqz p2, :cond_0

    .line 11
    .line 12
    new-instance p2, Ljava/lang/StringBuilder;

    .line 13
    .line 14
    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    .line 15
    .line 16
    .line 17
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemTitleView;->n:Ll/sj6;

    .line 18
    .line 19
    iget-object v2, v2, Ll/sj6;->b:Lcom/p1/mobile/putong/data/User;

    .line 20
    .line 21
    iget-object v2, v2, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 22
    .line 23
    invoke-virtual {p2, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    const-string v2, " "

    .line 27
    .line 28
    invoke-virtual {p2, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemTitleView;->n:Ll/sj6;

    .line 32
    .line 33
    iget-object v2, v2, Ll/sj6;->b:Lcom/p1/mobile/putong/data/User;

    .line 34
    .line 35
    iget-object v2, v2, Lcom/p1/mobile/putong/data/User;->location:Lcom/p1/mobile/putong/data/Location;

    .line 36
    .line 37
    iget v2, v2, Lcom/p1/mobile/putong/data/Location;->distance:I

    .line 38
    .line 39
    invoke-static {v2, v1}, Ll/q8g0;->p(IZ)Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object v2

    .line 43
    invoke-virtual {p2, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 44
    .line 45
    .line 46
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object p2

    .line 50
    invoke-interface {p0, p2, p1, v1}, Ll/ue6;->D0(Ljava/lang/String;Ljava/lang/String;Z)Ljava/lang/CharSequence;

    .line 51
    .line 52
    .line 53
    move-result-object p2

    .line 54
    invoke-virtual {v0, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 55
    .line 56
    .line 57
    goto :goto_0

    .line 58
    :cond_0
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemTitleView;->n:Ll/sj6;

    .line 59
    .line 60
    iget-object p2, p2, Ll/sj6;->b:Lcom/p1/mobile/putong/data/User;

    .line 61
    .line 62
    iget-object p2, p2, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 63
    .line 64
    invoke-interface {p0, p2, p1, v1}, Ll/ue6;->D0(Ljava/lang/String;Ljava/lang/String;Z)Ljava/lang/CharSequence;

    .line 65
    .line 66
    .line 67
    move-result-object p2

    .line 68
    invoke-virtual {v0, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 69
    .line 70
    .line 71
    :goto_0
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 72
    .line 73
    iget-object p2, p2, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 74
    .line 75
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemTitleView;->n:Ll/sj6;

    .line 76
    .line 77
    iget-object v0, v0, Ll/sj6;->b:Lcom/p1/mobile/putong/data/User;

    .line 78
    .line 79
    iget-object v0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 80
    .line 81
    invoke-virtual {p2, v0}, Ll/dkb;->y7(Ljava/lang/String;)Ljava/lang/String;

    .line 82
    .line 83
    .line 84
    move-result-object p2

    .line 85
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 86
    .line 87
    .line 88
    move-result v0

    .line 89
    if-nez v0, :cond_1

    .line 90
    .line 91
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemTitleView;->b:Lv/VText;

    .line 92
    .line 93
    invoke-interface {p0, p2, p1, v1}, Ll/ue6;->D0(Ljava/lang/String;Ljava/lang/String;Z)Ljava/lang/CharSequence;

    .line 94
    .line 95
    .line 96
    move-result-object p0

    .line 97
    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 98
    .line 99
    .line 100
    return-void

    .line 101
    :cond_1
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 102
    .line 103
    .line 104
    move-result p1

    .line 105
    if-eqz p1, :cond_4

    .line 106
    .line 107
    invoke-static {}, Ll/gra;->t1()Z

    .line 108
    .line 109
    .line 110
    move-result p1

    .line 111
    if-eqz p1, :cond_4

    .line 112
    .line 113
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemTitleView;->n:Ll/sj6;

    .line 114
    .line 115
    iget-object p1, p1, Ll/sj6;->b:Lcom/p1/mobile/putong/data/User;

    .line 116
    .line 117
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 118
    .line 119
    .line 120
    move-result p1

    .line 121
    if-eqz p1, :cond_3

    .line 122
    .line 123
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemTitleView;->n:Ll/sj6;

    .line 124
    .line 125
    iget-object p1, p1, Ll/sj6;->b:Lcom/p1/mobile/putong/data/User;

    .line 126
    .line 127
    iget-boolean p2, p1, Lcom/p1/mobile/putong/data/User;->inactivated:Z

    .line 128
    .line 129
    if-eqz p2, :cond_2

    .line 130
    .line 131
    goto :goto_1

    .line 132
    :cond_2
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->status:Ljava/util/List;

    .line 133
    .line 134
    const-string p2, "RISK_TAG_CHAT_PROFILE_PICTURE_HIDDEN"

    .line 135
    .line 136
    invoke-static {p2}, Lcom/p1/mobile/putong/data/UserStatus;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/UserStatus;

    .line 137
    .line 138
    .line 139
    move-result-object p2

    .line 140
    invoke-interface {p1, p2}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 141
    .line 142
    .line 143
    move-result p1

    .line 144
    if-eqz p1, :cond_4

    .line 145
    .line 146
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemTitleView;->b:Lv/VText;

    .line 147
    .line 148
    const-string p1, "\u6635\u79f0\u5df2\u91cd\u7f6e"

    .line 149
    .line 150
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 151
    .line 152
    .line 153
    return-void

    .line 154
    :cond_3
    :goto_1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemTitleView;->b:Lv/VText;

    .line 155
    .line 156
    const-string p1, "\u5df2\u6ce8\u9500"

    .line 157
    .line 158
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 159
    .line 160
    .line 161
    :cond_4
    return-void
.end method

.method public i1()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemTitleView;->n:Ll/sj6;

    .line 2
    .line 3
    iget-boolean v1, v0, Ll/sj6;->o:Z

    .line 4
    .line 5
    if-nez v1, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    iget-boolean v0, v0, Ll/sj6;->u:Z

    .line 9
    .line 10
    if-eqz v0, :cond_1

    .line 11
    .line 12
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-interface {v0}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemTitleView;->n:Ll/sj6;

    .line 21
    .line 22
    iget-object v1, v1, Ll/sj6;->r:Ljava/lang/String;

    .line 23
    .line 24
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    if-eqz v0, :cond_1

    .line 29
    .line 30
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 31
    .line 32
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 33
    .line 34
    invoke-virtual {v0}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemTitleView;->b:Lv/VText;

    .line 39
    .line 40
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 41
    .line 42
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 43
    .line 44
    .line 45
    :cond_1
    :goto_0
    return-void
.end method

.method public m(Ll/sj6;)V
    .locals 1

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemTitleView;->n:Ll/sj6;

    .line 2
    .line 3
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemTitleView;->d:Landroid/widget/LinearLayout;

    .line 4
    .line 5
    const/16 v0, 0x8

    .line 6
    .line 7
    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 8
    .line 9
    .line 10
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemTitleView;->m:Lv/VText;

    .line 11
    .line 12
    const/4 v0, 0x0

    .line 13
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 14
    .line 15
    .line 16
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemTitleView;->b:Lv/VText;

    .line 17
    .line 18
    const/4 p1, 0x0

    .line 19
    invoke-virtual {p0, p1, p1, p1, p1}, Landroidx/appcompat/widget/AppCompatTextView;->setCompoundDrawables(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public m0(Ll/sj6;)V
    .locals 5

    .line 1
    iget-object v0, p1, Ll/sj6;->P:Ljava/util/List;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemTitleView;->b:Lv/VText;

    .line 4
    .line 5
    const/4 v2, 0x1

    .line 6
    invoke-static {v2}, Landroid/graphics/Typeface;->defaultFromStyle(I)Landroid/graphics/Typeface;

    .line 7
    .line 8
    .line 9
    move-result-object v3

    .line 10
    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 11
    .line 12
    .line 13
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    const-string v3, "%s\u4e2a\u597d\u53cb\u5f85\u6062\u590d"

    .line 30
    .line 31
    invoke-static {v1, v3, v0}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemTitleView;->b:Lv/VText;

    .line 36
    .line 37
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 38
    .line 39
    .line 40
    move-result-object v3

    .line 41
    sget v4, Ll/c9c0;->I:I

    .line 42
    .line 43
    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getColor(I)I

    .line 44
    .line 45
    .line 46
    move-result v3

    .line 47
    const/4 v4, 0x3

    .line 48
    invoke-static {v4}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 49
    .line 50
    .line 51
    move-result-object v4

    .line 52
    invoke-static {v0, v3, v4}, Ll/q8g0;->N(Ljava/lang/String;ILandroid/graphics/Typeface;)Landroid/text/SpannableStringBuilder;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 57
    .line 58
    .line 59
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemTitleView;->e1()Z

    .line 60
    .line 61
    .line 62
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemTitleView;->e:Lv/VImage;

    .line 63
    .line 64
    const/4 v1, 0x0

    .line 65
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 66
    .line 67
    .line 68
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemTitleView;->m:Lv/VText;

    .line 69
    .line 70
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 71
    .line 72
    .line 73
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemTitleView;->d:Landroid/widget/LinearLayout;

    .line 74
    .line 75
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 76
    .line 77
    .line 78
    new-instance v0, Ljava/lang/StringBuilder;

    .line 79
    .line 80
    const-string v1, "countdown_item_limited_trial_see"

    .line 81
    .line 82
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 83
    .line 84
    .line 85
    iget-object v1, p1, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 86
    .line 87
    iget-object v1, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 88
    .line 89
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 90
    .line 91
    .line 92
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 93
    .line 94
    .line 95
    move-result-object v0

    .line 96
    iget-object p1, p1, Ll/sj6;->d:Ll/pol;

    .line 97
    .line 98
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 99
    .line 100
    .line 101
    move-result-object v1

    .line 102
    check-cast v1, Lcom/p1/mobile/android/app/Act;

    .line 103
    .line 104
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 105
    .line 106
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->t1:Lcom/p1/mobile/putong/core/api/c0;

    .line 107
    .line 108
    invoke-virtual {v2, v0}, Lcom/p1/mobile/putong/core/api/c0;->n(Ljava/lang/String;)Lrx/c;

    .line 109
    .line 110
    .line 111
    move-result-object v0

    .line 112
    invoke-interface {p1, v1, v0}, Ll/pol;->c(Ll/ner;Lrx/c;)Lrx/c;

    .line 113
    .line 114
    .line 115
    move-result-object p1

    .line 116
    new-instance v0, Ll/nc6;

    .line 117
    .line 118
    invoke-direct {v0, p0}, Ll/nc6;-><init>(Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemTitleView;)V

    .line 119
    .line 120
    .line 121
    invoke-static {v0}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 122
    .line 123
    .line 124
    move-result-object p0

    .line 125
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 126
    .line 127
    .line 128
    return-void
.end method

.method public onFinishInflate()V
    .locals 2

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemTitleView;->B(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemTitleView;->b:Lv/VText;

    .line 8
    .line 9
    const/high16 v1, 0x40000000    # 2.0f

    .line 10
    .line 11
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    invoke-static {v0, v1}, Ll/bnl0;->c0(Landroid/view/View;I)V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemTitleView;->b:Lv/VText;

    .line 19
    .line 20
    sget-object v1, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    .line 21
    .line 22
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 23
    .line 24
    .line 25
    invoke-static {}, Ll/gra;->z()Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-eqz v0, :cond_0

    .line 30
    .line 31
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemTitleView;->b:Lv/VText;

    .line 32
    .line 33
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemTitleView;->m:Lv/VText;

    .line 34
    .line 35
    invoke-static {v0, p0}, Ll/ue6;->k0(Landroid/widget/TextView;Landroid/widget/TextView;)V

    .line 36
    .line 37
    .line 38
    :cond_0
    return-void
.end method

.method public bridge synthetic setPicPercent(F)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Ll/nrl;->setPicPercent(F)V

    return-void
.end method

.method public t0(Ll/sj6;)V
    .locals 4

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemTitleView;->n:Ll/sj6;

    .line 2
    .line 3
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemTitleView;->d:Landroid/widget/LinearLayout;

    .line 4
    .line 5
    const/16 v1, 0x8

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemTitleView;->j:Lv/VText;

    .line 11
    .line 12
    const/4 v1, 0x0

    .line 13
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemTitleView;->f:Lv/VImage;

    .line 17
    .line 18
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemTitleView;->b:Lv/VText;

    .line 22
    .line 23
    iget-object v2, p1, Ll/sj6;->x:Lcom/p1/mobile/android/app/Act;

    .line 24
    .line 25
    sget v3, Ll/c9c0;->Q1:I

    .line 26
    .line 27
    invoke-virtual {v2, v3}, Lcom/p1/mobile/android/app/Act;->color(I)I

    .line 28
    .line 29
    .line 30
    move-result v2

    .line 31
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 32
    .line 33
    .line 34
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemTitleView;->b:Lv/VText;

    .line 35
    .line 36
    const/4 v2, 0x0

    .line 37
    invoke-virtual {v0, v2, v2, v2, v2}, Landroidx/appcompat/widget/AppCompatTextView;->setCompoundDrawables(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 38
    .line 39
    .line 40
    iget-boolean v0, p1, Ll/sj6;->v:Z

    .line 41
    .line 42
    if-eqz v0, :cond_1

    .line 43
    .line 44
    iget-object v0, p1, Ll/sj6;->b:Lcom/p1/mobile/putong/data/User;

    .line 45
    .line 46
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 47
    .line 48
    .line 49
    move-result v0

    .line 50
    if-eqz v0, :cond_1

    .line 51
    .line 52
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemTitleView;->m:Lv/VText;

    .line 53
    .line 54
    invoke-static {v0, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 55
    .line 56
    .line 57
    iget-object v0, p1, Ll/sj6;->b:Lcom/p1/mobile/putong/data/User;

    .line 58
    .line 59
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isBanedOrInactivated()Z

    .line 60
    .line 61
    .line 62
    move-result v0

    .line 63
    if-eqz v0, :cond_0

    .line 64
    .line 65
    goto :goto_0

    .line 66
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemTitleView;->b:Lv/VText;

    .line 67
    .line 68
    iget-object p1, p1, Ll/sj6;->b:Lcom/p1/mobile/putong/data/User;

    .line 69
    .line 70
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 71
    .line 72
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 73
    .line 74
    .line 75
    return-void

    .line 76
    :cond_1
    invoke-interface {p0, p1}, Ll/ue6;->n0(Ll/sj6;)Z

    .line 77
    .line 78
    .line 79
    move-result v0

    .line 80
    if-eqz v0, :cond_2

    .line 81
    .line 82
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 83
    .line 84
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 85
    .line 86
    iget-object v0, v0, Ll/dkb;->p3:Ll/xyd0;

    .line 87
    .line 88
    invoke-virtual {v0}, Ll/dyd0;->get()Ljava/lang/Object;

    .line 89
    .line 90
    .line 91
    move-result-object v0

    .line 92
    check-cast v0, Ljava/util/HashSet;

    .line 93
    .line 94
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 95
    .line 96
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 97
    .line 98
    iget-object v2, v2, Ll/dkb;->q3:Ll/xyd0;

    .line 99
    .line 100
    invoke-virtual {v2}, Ll/dyd0;->get()Ljava/lang/Object;

    .line 101
    .line 102
    .line 103
    move-result-object v2

    .line 104
    check-cast v2, Ljava/util/HashSet;

    .line 105
    .line 106
    iget-object v3, p1, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 107
    .line 108
    iget-object v3, v3, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 109
    .line 110
    invoke-virtual {v0, v3}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    .line 111
    .line 112
    .line 113
    move-result v0

    .line 114
    if-eqz v0, :cond_2

    .line 115
    .line 116
    iget-object v0, p1, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 117
    .line 118
    iget-object v0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 119
    .line 120
    invoke-virtual {v2, v0}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    .line 121
    .line 122
    .line 123
    move-result v0

    .line 124
    if-nez v0, :cond_2

    .line 125
    .line 126
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemTitleView;->m:Lv/VText;

    .line 127
    .line 128
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 129
    .line 130
    .line 131
    :cond_2
    iget-object p1, p1, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 132
    .line 133
    invoke-interface {p0, p1}, Ll/ue6;->Z0(Lcom/p1/mobile/putong/core/data/Conversation;)Z

    .line 134
    .line 135
    .line 136
    move-result p1

    .line 137
    if-eqz p1, :cond_3

    .line 138
    .line 139
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemTitleView;->m:Lv/VText;

    .line 140
    .line 141
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 142
    .line 143
    .line 144
    :cond_3
    :goto_0
    return-void
.end method

.method public y0()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemTitleView;->n:Ll/sj6;

    .line 2
    .line 3
    iget-object v0, v0, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 4
    .line 5
    invoke-interface {p0, v0}, Ll/ue6;->Y(Lcom/p1/mobile/putong/core/data/Conversation;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemTitleView;->m:Lv/VText;

    .line 13
    .line 14
    const/4 v0, 0x0

    .line 15
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public z0(Lcom/p1/mobile/putong/core/data/Conversation;Lcom/p1/mobile/putong/data/User;Ll/sj6;)V
    .locals 0

    .line 1
    iput-object p3, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemTitleView;->n:Ll/sj6;

    .line 2
    .line 3
    iget-object p1, p3, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 4
    .line 5
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    iget-object p1, p3, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 12
    .line 13
    iget-boolean p1, p1, Lcom/p1/mobile/putong/core/data/Conversation;->localEverHasMessage:Z

    .line 14
    .line 15
    if-eqz p1, :cond_0

    .line 16
    .line 17
    return-void

    .line 18
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemTitleView;->b:Lv/VText;

    .line 19
    .line 20
    sget p1, Lcom/p1/mobile/putong/core/R$string;->ij:I

    .line 21
    .line 22
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(I)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.class public Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadBackUserTipLayout;
.super Lv/VRelative;
.source "SourceFile"


# instance fields
.field public d:Lv/VImage;

.field public e:Landroid/view/View;

.field public f:Lv/VDraweeView;

.field public g:Landroid/view/View;

.field public h:Lv/VDraweeView;

.field public i:Landroid/widget/TextView;

.field public j:Landroid/widget/TextView;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lv/VRelative;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 5
    invoke-direct {p0, p1, p2}, Lv/VRelative;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 6
    invoke-direct {p0, p1, p2, p3}, Lv/VRelative;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static synthetic p(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/GrowthMesInfo;Landroid/view/View;)V
    .locals 7

    .line 1
    const-string p2, "e_message_recall_event"

    .line 2
    .line 3
    const-string v0, "p_messages_view"

    .line 4
    .line 5
    invoke-static {p2, v0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/GrowthMesInfo;->link:Ljava/lang/String;

    .line 9
    .line 10
    const/4 v5, 0x1

    .line 11
    const/4 v6, 0x0

    .line 12
    const-string v2, ""

    .line 13
    .line 14
    const/4 v4, 0x1

    .line 15
    move-object v1, p0

    .line 16
    invoke-static/range {v1 .. v6}, Lcom/p1/mobile/putong/ui/webview/mk/MkWebViewAct;->d2(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;ZZLandroid/os/ResultReceiver;)Landroid/content/Intent;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    const-string p1, "hideNotch"

    .line 21
    .line 22
    const/4 p2, 0x1

    .line 23
    invoke-virtual {p0, p1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 24
    .line 25
    .line 26
    invoke-virtual {v1, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 27
    .line 28
    .line 29
    return-void
.end method


# virtual methods
.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadBackUserTipLayout;->q(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final q(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/j86;->a(Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadBackUserTipLayout;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public z(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;)V
    .locals 5

    return-void

    .line 1
    iget-object p2, p2, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;->B:Lcom/p1/mobile/putong/core/data/GrowthMesInfo;

    .line 2
    .line 3
    if-nez p2, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    const-string v0, "e_message_recall_event"

    .line 7
    .line 8
    const-string v1, "p_messages_view"

    .line 9
    .line 10
    invoke-static {v0, v1}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p2, Lcom/p1/mobile/putong/core/data/GrowthMesInfo;->mesUsers:Ljava/util/List;

    .line 14
    .line 15
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    const/4 v2, 0x0

    .line 20
    if-nez v1, :cond_3

    .line 21
    .line 22
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 23
    .line 24
    .line 25
    move-result v1

    .line 26
    const/4 v3, 0x2

    .line 27
    const/4 v4, 0x1

    .line 28
    if-lt v1, v3, :cond_1

    .line 29
    .line 30
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadBackUserTipLayout;->e:Landroid/view/View;

    .line 31
    .line 32
    invoke-static {v1, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 33
    .line 34
    .line 35
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadBackUserTipLayout;->f:Lv/VDraweeView;

    .line 36
    .line 37
    invoke-static {v1, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 38
    .line 39
    .line 40
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadBackUserTipLayout;->g:Landroid/view/View;

    .line 41
    .line 42
    invoke-static {v1, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 43
    .line 44
    .line 45
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadBackUserTipLayout;->h:Lv/VDraweeView;

    .line 46
    .line 47
    invoke-static {v1, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 48
    .line 49
    .line 50
    sget-object v1, Ll/uqb0;->G:Ll/fsb0;

    .line 51
    .line 52
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadBackUserTipLayout;->h:Lv/VDraweeView;

    .line 53
    .line 54
    invoke-interface {v0, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 55
    .line 56
    .line 57
    move-result-object v4

    .line 58
    check-cast v4, Lcom/p1/mobile/putong/core/data/GrowthMesUser;

    .line 59
    .line 60
    iget-object v4, v4, Lcom/p1/mobile/putong/core/data/GrowthMesUser;->avatar:Ljava/lang/String;

    .line 61
    .line 62
    invoke-virtual {v1, v3, v4}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 63
    .line 64
    .line 65
    goto :goto_0

    .line 66
    :cond_1
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 67
    .line 68
    .line 69
    move-result v1

    .line 70
    if-ne v1, v4, :cond_2

    .line 71
    .line 72
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadBackUserTipLayout;->f:Lv/VDraweeView;

    .line 73
    .line 74
    invoke-static {v1, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 75
    .line 76
    .line 77
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadBackUserTipLayout;->e:Landroid/view/View;

    .line 78
    .line 79
    invoke-static {v1, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 80
    .line 81
    .line 82
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadBackUserTipLayout;->h:Lv/VDraweeView;

    .line 83
    .line 84
    invoke-static {v1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 85
    .line 86
    .line 87
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadBackUserTipLayout;->g:Landroid/view/View;

    .line 88
    .line 89
    invoke-static {v1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 90
    .line 91
    .line 92
    :cond_2
    :goto_0
    sget-object v1, Ll/uqb0;->G:Ll/fsb0;

    .line 93
    .line 94
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadBackUserTipLayout;->f:Lv/VDraweeView;

    .line 95
    .line 96
    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 97
    .line 98
    .line 99
    move-result-object v0

    .line 100
    check-cast v0, Lcom/p1/mobile/putong/core/data/GrowthMesUser;

    .line 101
    .line 102
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/GrowthMesUser;->avatar:Ljava/lang/String;

    .line 103
    .line 104
    invoke-virtual {v1, v3, v0}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 105
    .line 106
    .line 107
    :cond_3
    iget-object v0, p2, Lcom/p1/mobile/putong/core/data/GrowthMesInfo;->title:Ljava/lang/String;

    .line 108
    .line 109
    iget-object v1, p2, Lcom/p1/mobile/putong/core/data/GrowthMesInfo;->content:Ljava/lang/String;

    .line 110
    .line 111
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadBackUserTipLayout;->i:Landroid/widget/TextView;

    .line 112
    .line 113
    invoke-virtual {v3, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 114
    .line 115
    .line 116
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadBackUserTipLayout;->i:Landroid/widget/TextView;

    .line 117
    .line 118
    const/4 v3, 0x3

    .line 119
    invoke-static {v3}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 120
    .line 121
    .line 122
    move-result-object v3

    .line 123
    invoke-virtual {v0, v3, v2}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 124
    .line 125
    .line 126
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadBackUserTipLayout;->j:Landroid/widget/TextView;

    .line 127
    .line 128
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 129
    .line 130
    .line 131
    new-instance v0, Ll/i86;

    .line 132
    .line 133
    invoke-direct {v0, p1, p2}, Ll/i86;-><init>(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/GrowthMesInfo;)V

    .line 134
    .line 135
    .line 136
    invoke-static {p0, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 137
    .line 138
    .line 139
    return-void
.end method

.class public Lcom/p1/mobile/putong/core/ui/dlg/views/OnlineMatchDlgView;
.super Lv/VLinear;
.source "SourceFile"


# instance fields
.field public c:Lv/VText;

.field public d:Lv/VText;

.field public e:Lv/VLinear;

.field public f:Lcom/p1/mobile/putong/core/ui/dlg/views/OnlineMatchDlgItemView;

.field public g:Lcom/p1/mobile/putong/core/ui/dlg/views/OnlineMatchDlgItemView;

.field public h:Lcom/p1/mobile/putong/core/ui/dlg/views/OnlineMatchDlgItemView;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, p1, v0}, Lcom/p1/mobile/putong/core/ui/dlg/views/OnlineMatchDlgView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    .line 6
    invoke-direct {p0, p1, p2, v0}, Lcom/p1/mobile/putong/core/ui/dlg/views/OnlineMatchDlgView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 7
    invoke-direct {p0, p1, p2, p3}, Lv/VLinear;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static synthetic P(Ll/z20;Ljava/util/List;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 3
    .line 4
    .line 5
    move-result-object p1

    .line 6
    check-cast p1, Lcom/p1/mobile/putong/core/data/RecentConversation;

    .line 7
    .line 8
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/RecentConversation;->otherUserID:Ljava/lang/String;

    .line 9
    .line 10
    const/4 v0, 0x1

    .line 11
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-interface {p0, p1, v0}, Ll/z20;->call(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public static synthetic Q(Lcom/p1/mobile/putong/core/ui/dlg/views/OnlineMatchDlgView;Ll/x20;Ljava/lang/String;Ljava/lang/Integer;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/ui/dlg/views/OnlineMatchDlgView;->V(Ll/x20;Ljava/lang/String;Ljava/lang/Integer;)V

    return-void
.end method

.method public static synthetic R(Ll/z20;Ljava/util/List;)V
    .locals 1

    .line 1
    const/4 v0, 0x2

    .line 2
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 3
    .line 4
    .line 5
    move-result-object p1

    .line 6
    check-cast p1, Lcom/p1/mobile/putong/core/data/RecentConversation;

    .line 7
    .line 8
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/RecentConversation;->otherUserID:Ljava/lang/String;

    .line 9
    .line 10
    const/4 v0, 0x3

    .line 11
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-interface {p0, p1, v0}, Ll/z20;->call(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public static synthetic S(Ll/z20;Ljava/util/List;)V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 3
    .line 4
    .line 5
    move-result-object p1

    .line 6
    check-cast p1, Lcom/p1/mobile/putong/core/data/RecentConversation;

    .line 7
    .line 8
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/RecentConversation;->otherUserID:Ljava/lang/String;

    .line 9
    .line 10
    const/4 v0, 0x2

    .line 11
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-interface {p0, p1, v0}, Ll/z20;->call(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method private act()Lcom/p1/mobile/android/app/Act;
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

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


# virtual methods
.method public final T(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/ps50;->a(Lcom/p1/mobile/putong/core/ui/dlg/views/OnlineMatchDlgView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic V(Ll/x20;Ljava/lang/String;Ljava/lang/Integer;)V
    .locals 3

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/dlg/views/OnlineMatchDlgView;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/dlg/views/OnlineMatchDlgView;->act()Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    const/4 v1, 0x0

    .line 10
    const/16 v2, 0x1e

    .line 11
    .line 12
    invoke-static {p0, p2, v1, v1, v2}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->l2(Landroid/content/Context;Ljava/lang/String;ZZI)Landroid/content/Intent;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-virtual {v0, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 17
    .line 18
    .line 19
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 20
    .line 21
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 22
    .line 23
    invoke-virtual {p0, p2}, Ll/dkb;->Pa(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    const-string v0, "which_number"

    .line 28
    .line 29
    invoke-static {v0, p3}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 30
    .line 31
    .line 32
    move-result-object p3

    .line 33
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->onlineMatch()Z

    .line 34
    .line 35
    .line 36
    move-result p0

    .line 37
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    const-string v0, "again_is_quickchat"

    .line 42
    .line 43
    invoke-static {v0, p0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    const-string v0, "other_user_id"

    .line 48
    .line 49
    invoke-static {v0, p2}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 50
    .line 51
    .line 52
    move-result-object p2

    .line 53
    filled-new-array {p3, p0, p2}, [Ll/pf60;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    const-string p2, "e_quickchat_again_popup_choose"

    .line 58
    .line 59
    const-string p3, "p_quickchat_again_popup"

    .line 60
    .line 61
    invoke-static {p2, p3, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 62
    .line 63
    .line 64
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 65
    .line 66
    .line 67
    move-result p0

    .line 68
    if-eqz p0, :cond_0

    .line 69
    .line 70
    invoke-interface {p1}, Ll/x20;->call()V

    .line 71
    .line 72
    .line 73
    :cond_0
    return-void
.end method

.method public W(Ljava/lang/String;Ljava/lang/String;Ljava/util/List;Ll/x20;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/RecentConversation;",
            ">;",
            "Ll/x20;",
            ")V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/dlg/views/OnlineMatchDlgView;->c:Lv/VText;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 4
    .line 5
    .line 6
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/dlg/views/OnlineMatchDlgView;->d:Lv/VText;

    .line 7
    .line 8
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 9
    .line 10
    .line 11
    new-instance p1, Ll/ls50;

    .line 12
    .line 13
    invoke-direct {p1, p0, p4}, Ll/ls50;-><init>(Lcom/p1/mobile/putong/core/ui/dlg/views/OnlineMatchDlgView;Ll/x20;)V

    .line 14
    .line 15
    .line 16
    invoke-interface {p3}, Ljava/util/List;->size()I

    .line 17
    .line 18
    .line 19
    move-result p2

    .line 20
    const/4 p4, 0x3

    .line 21
    if-lt p2, p4, :cond_1

    .line 22
    .line 23
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/dlg/views/OnlineMatchDlgView;->e:Lv/VLinear;

    .line 24
    .line 25
    invoke-virtual {p2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 26
    .line 27
    .line 28
    move-result-object p2

    .line 29
    instance-of p4, p2, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 30
    .line 31
    if-eqz p4, :cond_0

    .line 32
    .line 33
    move-object p4, p2

    .line 34
    check-cast p4, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 35
    .line 36
    sget v0, Ll/qa00;->m:I

    .line 37
    .line 38
    iput v0, p4, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    .line 39
    .line 40
    iput v0, p4, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    .line 41
    .line 42
    :cond_0
    iget-object p4, p0, Lcom/p1/mobile/putong/core/ui/dlg/views/OnlineMatchDlgView;->e:Lv/VLinear;

    .line 43
    .line 44
    invoke-virtual {p4, p2}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 45
    .line 46
    .line 47
    :cond_1
    invoke-interface {p3}, Ljava/util/List;->size()I

    .line 48
    .line 49
    .line 50
    move-result p2

    .line 51
    const/4 p4, 0x0

    .line 52
    if-lez p2, :cond_2

    .line 53
    .line 54
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/dlg/views/OnlineMatchDlgView;->f:Lcom/p1/mobile/putong/core/ui/dlg/views/OnlineMatchDlgItemView;

    .line 55
    .line 56
    invoke-interface {p3, p4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    check-cast v0, Lcom/p1/mobile/putong/core/data/RecentConversation;

    .line 61
    .line 62
    new-instance v1, Ll/ms50;

    .line 63
    .line 64
    invoke-direct {v1, p1, p3}, Ll/ms50;-><init>(Ll/z20;Ljava/util/List;)V

    .line 65
    .line 66
    .line 67
    invoke-virtual {p2, v0, v1}, Lcom/p1/mobile/putong/core/ui/dlg/views/OnlineMatchDlgItemView;->V(Lcom/p1/mobile/putong/core/data/RecentConversation;Ll/x20;)V

    .line 68
    .line 69
    .line 70
    :cond_2
    invoke-interface {p3}, Ljava/util/List;->size()I

    .line 71
    .line 72
    .line 73
    move-result p2

    .line 74
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/dlg/views/OnlineMatchDlgView;->g:Lcom/p1/mobile/putong/core/ui/dlg/views/OnlineMatchDlgItemView;

    .line 75
    .line 76
    const/4 v1, 0x1

    .line 77
    if-le p2, v1, :cond_3

    .line 78
    .line 79
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 80
    .line 81
    .line 82
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/dlg/views/OnlineMatchDlgView;->g:Lcom/p1/mobile/putong/core/ui/dlg/views/OnlineMatchDlgItemView;

    .line 83
    .line 84
    invoke-interface {p3, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 85
    .line 86
    .line 87
    move-result-object v0

    .line 88
    check-cast v0, Lcom/p1/mobile/putong/core/data/RecentConversation;

    .line 89
    .line 90
    new-instance v2, Ll/ns50;

    .line 91
    .line 92
    invoke-direct {v2, p1, p3}, Ll/ns50;-><init>(Ll/z20;Ljava/util/List;)V

    .line 93
    .line 94
    .line 95
    invoke-virtual {p2, v0, v2}, Lcom/p1/mobile/putong/core/ui/dlg/views/OnlineMatchDlgItemView;->V(Lcom/p1/mobile/putong/core/data/RecentConversation;Ll/x20;)V

    .line 96
    .line 97
    .line 98
    goto :goto_0

    .line 99
    :cond_3
    invoke-static {v0, p4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 100
    .line 101
    .line 102
    :goto_0
    invoke-interface {p3}, Ljava/util/List;->size()I

    .line 103
    .line 104
    .line 105
    move-result p2

    .line 106
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/dlg/views/OnlineMatchDlgView;->h:Lcom/p1/mobile/putong/core/ui/dlg/views/OnlineMatchDlgItemView;

    .line 107
    .line 108
    const/4 v2, 0x2

    .line 109
    if-le p2, v2, :cond_4

    .line 110
    .line 111
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 112
    .line 113
    .line 114
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/dlg/views/OnlineMatchDlgView;->h:Lcom/p1/mobile/putong/core/ui/dlg/views/OnlineMatchDlgItemView;

    .line 115
    .line 116
    invoke-interface {p3, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 117
    .line 118
    .line 119
    move-result-object p2

    .line 120
    check-cast p2, Lcom/p1/mobile/putong/core/data/RecentConversation;

    .line 121
    .line 122
    new-instance p4, Ll/os50;

    .line 123
    .line 124
    invoke-direct {p4, p1, p3}, Ll/os50;-><init>(Ll/z20;Ljava/util/List;)V

    .line 125
    .line 126
    .line 127
    invoke-virtual {p0, p2, p4}, Lcom/p1/mobile/putong/core/ui/dlg/views/OnlineMatchDlgItemView;->V(Lcom/p1/mobile/putong/core/data/RecentConversation;Ll/x20;)V

    .line 128
    .line 129
    .line 130
    return-void

    .line 131
    :cond_4
    invoke-static {v0, p4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 132
    .line 133
    .line 134
    return-void
.end method

.method public onFinishInflate()V
    .locals 2

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/ui/dlg/views/OnlineMatchDlgView;->T(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/dlg/views/OnlineMatchDlgView;->c:Lv/VText;

    .line 8
    .line 9
    const/4 v0, 0x3

    .line 10
    invoke-static {v0}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    const/4 v1, 0x1

    .line 15
    invoke-virtual {p0, v0, v1}, Landroidx/appcompat/widget/AppCompatTextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public setTitle(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/dlg/views/OnlineMatchDlgView;->c:Lv/VText;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

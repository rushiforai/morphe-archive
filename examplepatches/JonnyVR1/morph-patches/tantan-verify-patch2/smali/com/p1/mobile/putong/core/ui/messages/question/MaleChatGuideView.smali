.class public Lcom/p1/mobile/putong/core/ui/messages/question/MaleChatGuideView;
.super Landroid/widget/LinearLayout;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/core/ui/messages/question/MaleChatGuideView$b;
    }
.end annotation


# instance fields
.field public a:Lv/VDraweeView;

.field public b:Lv/VImage;

.field public c:Lcom/p1/mobile/putong/core/ui/view/GradientBgButton;

.field public d:Landroid/widget/LinearLayout;

.field public e:Lv/VText;

.field public f:Lv/VLinear;

.field public g:Lv/VText;

.field public h:Lv/VText;

.field public i:Lv/VLinear;

.field public j:Lv/VText;

.field public k:Lv/VText;

.field public l:Lv/VLinear;

.field public m:Lv/VText;

.field public n:Lv/VText;


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

.method public static synthetic a(Lcom/p1/mobile/putong/core/ui/messages/question/MaleChatGuideView$b;Ljava/util/List;Landroid/view/View;)V
    .locals 1

    .line 1
    const/4 p2, 0x1

    .line 2
    invoke-interface {p1, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 3
    .line 4
    .line 5
    move-result-object v0

    .line 6
    check-cast v0, Lcom/p1/mobile/putong/core/data/IceBreakingQuestion;

    .line 7
    .line 8
    invoke-interface {p0, v0}, Lcom/p1/mobile/putong/core/ui/messages/question/MaleChatGuideView$b;->a(Lcom/p1/mobile/putong/core/data/IceBreakingQuestion;)V

    .line 9
    .line 10
    .line 11
    invoke-interface {p1, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    check-cast p0, Lcom/p1/mobile/putong/core/data/IceBreakingQuestion;

    .line 16
    .line 17
    const-string p1, "2"

    .line 18
    .line 19
    invoke-static {p1, p0}, Ll/fv4;->b(Ljava/lang/String;Lcom/p1/mobile/putong/core/data/IceBreakingQuestion;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public static synthetic b(Ll/n4z;Ljava/lang/String;Landroid/view/View;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/n4z;->pageId()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-interface {v0}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-static {v0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    invoke-static {p1}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    const-string v0, "is_self_avatar"

    .line 22
    .line 23
    invoke-static {v0, p1}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    filled-new-array {p1}, [Ll/sfj0$a;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    const-string v0, "e_chat_avatar"

    .line 32
    .line 33
    invoke-static {v0, p2, p1}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 34
    .line 35
    .line 36
    const-string p1, "messages_thumbnail_left"

    .line 37
    .line 38
    invoke-virtual {p0, p1}, Ll/n4z;->C0(Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/core/ui/messages/question/MaleChatGuideView;Ll/n4z;Ll/y20;Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/ui/messages/question/MaleChatGuideView;->h(Ll/n4z;Ll/y20;Lcom/p1/mobile/putong/data/User;)V

    return-void
.end method

.method public static synthetic d(Lcom/p1/mobile/putong/core/ui/messages/question/MaleChatGuideView$b;Ljava/util/List;Landroid/view/View;)V
    .locals 1

    .line 1
    const/4 p2, 0x2

    .line 2
    invoke-interface {p1, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 3
    .line 4
    .line 5
    move-result-object v0

    .line 6
    check-cast v0, Lcom/p1/mobile/putong/core/data/IceBreakingQuestion;

    .line 7
    .line 8
    invoke-interface {p0, v0}, Lcom/p1/mobile/putong/core/ui/messages/question/MaleChatGuideView$b;->a(Lcom/p1/mobile/putong/core/data/IceBreakingQuestion;)V

    .line 9
    .line 10
    .line 11
    invoke-interface {p1, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    check-cast p0, Lcom/p1/mobile/putong/core/data/IceBreakingQuestion;

    .line 16
    .line 17
    const-string p1, "3"

    .line 18
    .line 19
    invoke-static {p1, p0}, Ll/fv4;->b(Ljava/lang/String;Lcom/p1/mobile/putong/core/data/IceBreakingQuestion;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public static synthetic e(Ll/n4z;Ljava/lang/String;Landroid/view/View;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/n4z;->pageId()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-interface {v0}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-static {v0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    invoke-static {p1}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    const-string v0, "is_self_avatar"

    .line 22
    .line 23
    invoke-static {v0, p1}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    filled-new-array {p1}, [Ll/sfj0$a;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    const-string v0, "e_chat_avatar"

    .line 32
    .line 33
    invoke-static {v0, p2, p1}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 34
    .line 35
    .line 36
    const-string p1, "messages_thumbnail_left"

    .line 37
    .line 38
    invoke-virtual {p0, p1}, Ll/n4z;->C0(Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method public static synthetic f(Lcom/p1/mobile/putong/core/ui/messages/question/MaleChatGuideView$b;Ljava/util/List;Landroid/view/View;)V
    .locals 1

    .line 1
    const/4 p2, 0x0

    .line 2
    invoke-interface {p1, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 3
    .line 4
    .line 5
    move-result-object v0

    .line 6
    check-cast v0, Lcom/p1/mobile/putong/core/data/IceBreakingQuestion;

    .line 7
    .line 8
    invoke-interface {p0, v0}, Lcom/p1/mobile/putong/core/ui/messages/question/MaleChatGuideView$b;->a(Lcom/p1/mobile/putong/core/data/IceBreakingQuestion;)V

    .line 9
    .line 10
    .line 11
    invoke-interface {p1, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    check-cast p0, Lcom/p1/mobile/putong/core/data/IceBreakingQuestion;

    .line 16
    .line 17
    const-string p1, "1"

    .line 18
    .line 19
    invoke-static {p1, p0}, Ll/fv4;->b(Ljava/lang/String;Lcom/p1/mobile/putong/core/data/IceBreakingQuestion;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method


# virtual methods
.method public final g(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/buw;->a(Lcom/p1/mobile/putong/core/ui/messages/question/MaleChatGuideView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic h(Ll/n4z;Ll/y20;Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/ui/messages/question/MaleChatGuideView;->l(Ll/n4z;Ll/y20;Lcom/p1/mobile/putong/data/User;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public i(Ljava/util/List;Lcom/p1/mobile/putong/core/ui/messages/question/MaleChatGuideView$b;)V
    .locals 5
    .param p2    # Lcom/p1/mobile/putong/core/ui/messages/question/MaleChatGuideView$b;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/IceBreakingQuestion;",
            ">;",
            "Lcom/p1/mobile/putong/core/ui/messages/question/MaleChatGuideView$b;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 9
    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    const/4 v0, 0x1

    .line 13
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 14
    .line 15
    .line 16
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/question/MaleChatGuideView;->f:Lv/VLinear;

    .line 17
    .line 18
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 19
    .line 20
    .line 21
    move-result v3

    .line 22
    if-lez v3, :cond_1

    .line 23
    .line 24
    move v3, v0

    .line 25
    goto :goto_0

    .line 26
    :cond_1
    move v3, v1

    .line 27
    :goto_0
    invoke-static {v2, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 28
    .line 29
    .line 30
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/question/MaleChatGuideView;->i:Lv/VLinear;

    .line 31
    .line 32
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 33
    .line 34
    .line 35
    move-result v3

    .line 36
    if-le v3, v0, :cond_2

    .line 37
    .line 38
    move v3, v0

    .line 39
    goto :goto_1

    .line 40
    :cond_2
    move v3, v1

    .line 41
    :goto_1
    invoke-static {v2, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 42
    .line 43
    .line 44
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/question/MaleChatGuideView;->l:Lv/VLinear;

    .line 45
    .line 46
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 47
    .line 48
    .line 49
    move-result v3

    .line 50
    const/4 v4, 0x2

    .line 51
    if-le v3, v4, :cond_3

    .line 52
    .line 53
    move v3, v0

    .line 54
    goto :goto_2

    .line 55
    :cond_3
    move v3, v1

    .line 56
    :goto_2
    invoke-static {v2, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 57
    .line 58
    .line 59
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 60
    .line 61
    .line 62
    move-result v2

    .line 63
    if-lez v2, :cond_4

    .line 64
    .line 65
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/question/MaleChatGuideView;->g:Lv/VText;

    .line 66
    .line 67
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 68
    .line 69
    .line 70
    move-result-object v1

    .line 71
    check-cast v1, Lcom/p1/mobile/putong/core/data/IceBreakingQuestion;

    .line 72
    .line 73
    invoke-virtual {p0, v2, v1}, Lcom/p1/mobile/putong/core/ui/messages/question/MaleChatGuideView;->j(Lv/VText;Lcom/p1/mobile/putong/core/data/IceBreakingQuestion;)V

    .line 74
    .line 75
    .line 76
    :cond_4
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 77
    .line 78
    .line 79
    move-result v1

    .line 80
    if-le v1, v0, :cond_5

    .line 81
    .line 82
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/question/MaleChatGuideView;->j:Lv/VText;

    .line 83
    .line 84
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 85
    .line 86
    .line 87
    move-result-object v0

    .line 88
    check-cast v0, Lcom/p1/mobile/putong/core/data/IceBreakingQuestion;

    .line 89
    .line 90
    invoke-virtual {p0, v1, v0}, Lcom/p1/mobile/putong/core/ui/messages/question/MaleChatGuideView;->j(Lv/VText;Lcom/p1/mobile/putong/core/data/IceBreakingQuestion;)V

    .line 91
    .line 92
    .line 93
    :cond_5
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 94
    .line 95
    .line 96
    move-result v0

    .line 97
    if-le v0, v4, :cond_6

    .line 98
    .line 99
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/question/MaleChatGuideView;->m:Lv/VText;

    .line 100
    .line 101
    invoke-interface {p1, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 102
    .line 103
    .line 104
    move-result-object v1

    .line 105
    check-cast v1, Lcom/p1/mobile/putong/core/data/IceBreakingQuestion;

    .line 106
    .line 107
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/core/ui/messages/question/MaleChatGuideView;->j(Lv/VText;Lcom/p1/mobile/putong/core/data/IceBreakingQuestion;)V

    .line 108
    .line 109
    .line 110
    :cond_6
    invoke-static {p1}, Ll/fv4;->a(Ljava/util/List;)V

    .line 111
    .line 112
    .line 113
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/question/MaleChatGuideView;->h:Lv/VText;

    .line 114
    .line 115
    new-instance v1, Ll/vtw;

    .line 116
    .line 117
    invoke-direct {v1, p2, p1}, Ll/vtw;-><init>(Lcom/p1/mobile/putong/core/ui/messages/question/MaleChatGuideView$b;Ljava/util/List;)V

    .line 118
    .line 119
    .line 120
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 121
    .line 122
    .line 123
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/question/MaleChatGuideView;->k:Lv/VText;

    .line 124
    .line 125
    new-instance v1, Ll/wtw;

    .line 126
    .line 127
    invoke-direct {v1, p2, p1}, Ll/wtw;-><init>(Lcom/p1/mobile/putong/core/ui/messages/question/MaleChatGuideView$b;Ljava/util/List;)V

    .line 128
    .line 129
    .line 130
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 131
    .line 132
    .line 133
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/question/MaleChatGuideView;->n:Lv/VText;

    .line 134
    .line 135
    new-instance v0, Ll/xtw;

    .line 136
    .line 137
    invoke-direct {v0, p2, p1}, Ll/xtw;-><init>(Lcom/p1/mobile/putong/core/ui/messages/question/MaleChatGuideView$b;Ljava/util/List;)V

    .line 138
    .line 139
    .line 140
    invoke-static {p0, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 141
    .line 142
    .line 143
    return-void
.end method

.method public final j(Lv/VText;Lcom/p1/mobile/putong/core/data/IceBreakingQuestion;)V
    .locals 0

    .line 1
    iget-object p0, p2, Lcom/p1/mobile/putong/core/data/IceBreakingQuestion;->content:Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public k(Ll/n4z;Ll/y20;Ljava/lang/String;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/n4z;",
            "Ll/y20<",
            "Lv/VDraweeView;",
            ">;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

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
    invoke-virtual {p1}, Ll/n4z;->p0()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-static {v0}, Lcom/p1/mobile/putong/data/User;->isTeamAccount(Ljava/lang/String;)Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-nez v0, :cond_0

    .line 24
    .line 25
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/question/MaleChatGuideView;->a:Lv/VDraweeView;

    .line 26
    .line 27
    new-instance v1, Lcom/p1/mobile/putong/core/ui/messages/question/MaleChatGuideView$a;

    .line 28
    .line 29
    invoke-direct {v1, p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/question/MaleChatGuideView$a;-><init>(Lcom/p1/mobile/putong/core/ui/messages/question/MaleChatGuideView;Ll/n4z;)V

    .line 30
    .line 31
    .line 32
    new-instance v2, Ll/ytw;

    .line 33
    .line 34
    invoke-direct {v2, p1, p3}, Ll/ytw;-><init>(Ll/n4z;Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    invoke-static {v0, v1, v2}, Lcom/p1/mobile/putong/core/ui/messages/b;->r(Landroid/view/View;Lcom/p1/mobile/putong/core/ui/messages/b$c;Landroid/view/View$OnClickListener;)V

    .line 38
    .line 39
    .line 40
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/question/MaleChatGuideView;->a:Lv/VDraweeView;

    .line 41
    .line 42
    new-instance v1, Ll/ztw;

    .line 43
    .line 44
    invoke-direct {v1, p1, p3}, Ll/ztw;-><init>(Ll/n4z;Ljava/lang/String;)V

    .line 45
    .line 46
    .line 47
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 48
    .line 49
    .line 50
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 51
    .line 52
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 53
    .line 54
    invoke-virtual {v0, p3}, Ll/dkb;->Ka(Ljava/lang/String;)Lrx/c;

    .line 55
    .line 56
    .line 57
    move-result-object p3

    .line 58
    invoke-virtual {p1, p3}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 59
    .line 60
    .line 61
    move-result-object p3

    .line 62
    new-instance v0, Ll/auw;

    .line 63
    .line 64
    invoke-direct {v0, p0, p1, p2}, Ll/auw;-><init>(Lcom/p1/mobile/putong/core/ui/messages/question/MaleChatGuideView;Ll/n4z;Ll/y20;)V

    .line 65
    .line 66
    .line 67
    invoke-static {v0}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 68
    .line 69
    .line 70
    move-result-object p0

    .line 71
    invoke-virtual {p3, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 72
    .line 73
    .line 74
    return-void
.end method

.method public final l(Ll/n4z;Ll/y20;Lcom/p1/mobile/putong/data/User;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/n4z;",
            "Ll/y20<",
            "Lv/VDraweeView;",
            ">;",
            "Lcom/p1/mobile/putong/data/User;",
            ")V"
        }
    .end annotation

    .line 1
    if-eqz p2, :cond_0

    .line 2
    .line 3
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/question/MaleChatGuideView;->a:Lv/VDraweeView;

    .line 4
    .line 5
    invoke-interface {p2, v0}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    sget-object p2, Ll/uqb0;->G:Ll/fsb0;

    .line 9
    .line 10
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/question/MaleChatGuideView;->a:Lv/VDraweeView;

    .line 11
    .line 12
    invoke-virtual {p3}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    invoke-virtual {p2, v0, v1}, Ll/fsb0;->Q0(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;)V

    .line 21
    .line 22
    .line 23
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/question/MaleChatGuideView;->b:Lv/VImage;

    .line 24
    .line 25
    const/4 v0, 0x0

    .line 26
    invoke-static {p2, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 27
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
    invoke-interface {p2}, Ll/r97;->G1()Z

    .line 38
    .line 39
    .line 40
    move-result p2

    .line 41
    if-eqz p2, :cond_1

    .line 42
    .line 43
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/question/MaleChatGuideView;->c:Lcom/p1/mobile/putong/core/ui/view/GradientBgButton;

    .line 44
    .line 45
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 46
    .line 47
    .line 48
    return-void

    .line 49
    :cond_1
    invoke-virtual {p1}, Ll/n4z;->q0()Ll/mzl;

    .line 50
    .line 51
    .line 52
    move-result-object p1

    .line 53
    invoke-interface {p1}, Ll/mzl;->F()Ll/ruy;

    .line 54
    .line 55
    .line 56
    move-result-object p1

    .line 57
    invoke-virtual {p1}, Ll/ruy;->y0()Ll/vuy;

    .line 58
    .line 59
    .line 60
    move-result-object p1

    .line 61
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/question/MaleChatGuideView;->c:Lcom/p1/mobile/putong/core/ui/view/GradientBgButton;

    .line 62
    .line 63
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/question/MaleChatGuideView;->b:Lv/VImage;

    .line 64
    .line 65
    invoke-virtual {p1, p2, p0, p3}, Ll/vuy;->j(Lcom/p1/mobile/putong/core/ui/view/GradientBgButton;Lv/VImage;Lcom/p1/mobile/putong/data/User;)V

    .line 66
    .line 67
    .line 68
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    return-void

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/ui/messages/question/MaleChatGuideView;->g(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

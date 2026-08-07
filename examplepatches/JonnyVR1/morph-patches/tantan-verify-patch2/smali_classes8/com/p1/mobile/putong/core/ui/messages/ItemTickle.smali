.class public Lcom/p1/mobile/putong/core/ui/messages/ItemTickle;
.super Landroid/widget/FrameLayout;
.source "SourceFile"


# instance fields
.field public a:Lv/VText;

.field public b:Lv/VText;

.field public c:Landroid/view/View;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

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
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

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
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/core/data/Conversation;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Conversation;->otherUser:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/core/ui/messages/ItemTickle;Ll/bkj0;Ll/bkj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/messages/ItemTickle;->g(Ll/bkj0;Ll/bkj0;)V

    return-void
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/core/ui/messages/ItemTickle;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/ItemTickle;->i(Ljava/lang/Boolean;)V

    return-void
.end method

.method public static synthetic d(Lcom/p1/mobile/putong/core/ui/messages/ItemTickle;Lcom/p1/mobile/putong/data/User;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/messages/ItemTickle;->h(Lcom/p1/mobile/putong/data/User;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic e(Ll/bkj0;Ljava/lang/String;)Lrx/c;
    .locals 3

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    iget-object v1, p0, Ll/bkj0;->a:Ljava/lang/Object;

    .line 6
    .line 7
    check-cast v1, Ljava/lang/String;

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Ll/dkb;->Ma(Ljava/lang/String;)Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    new-instance v1, Ll/td;

    .line 14
    .line 15
    invoke-direct {v1}, Ll/td;-><init>()V

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 23
    .line 24
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->g0:Lcom/p1/mobile/putong/core/api/e;

    .line 25
    .line 26
    iget-object v2, p0, Ll/bkj0;->a:Ljava/lang/Object;

    .line 27
    .line 28
    check-cast v2, Ljava/lang/String;

    .line 29
    .line 30
    invoke-virtual {v1, p1, v2}, Lcom/p1/mobile/putong/core/api/e;->T6(Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    new-instance v2, Ll/hh7;

    .line 35
    .line 36
    invoke-direct {v2}, Ll/hh7;-><init>()V

    .line 37
    .line 38
    .line 39
    invoke-virtual {v1, v2}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 44
    .line 45
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->g0:Lcom/p1/mobile/putong/core/api/e;

    .line 46
    .line 47
    iget-object p0, p0, Ll/bkj0;->b:Ljava/lang/Object;

    .line 48
    .line 49
    check-cast p0, Ljava/lang/String;

    .line 50
    .line 51
    invoke-virtual {v2, p1, p0}, Lcom/p1/mobile/putong/core/api/e;->T6(Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    new-instance p1, Ll/hh7;

    .line 56
    .line 57
    invoke-direct {p1}, Ll/hh7;-><init>()V

    .line 58
    .line 59
    .line 60
    invoke-virtual {p0, p1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    new-instance p1, Ll/ijq;

    .line 65
    .line 66
    invoke-direct {p1}, Ll/ijq;-><init>()V

    .line 67
    .line 68
    .line 69
    invoke-static {v0, v1, p0, p1}, Ll/psd0;->s(Lrx/c;Lrx/c;Lrx/c;Ll/scj;)Lrx/c;

    .line 70
    .line 71
    .line 72
    move-result-object p0

    .line 73
    return-object p0
.end method


# virtual methods
.method public f()Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 6
    .line 7
    return-object p0
.end method

.method public final synthetic g(Ll/bkj0;Ll/bkj0;)V
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemTickle;->a:Lv/VText;

    .line 2
    .line 3
    iget-object v0, p2, Ll/bkj0;->a:Ljava/lang/Object;

    .line 4
    .line 5
    check-cast v0, Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    iget-object v1, p2, Ll/bkj0;->b:Ljava/lang/Object;

    .line 8
    .line 9
    check-cast v1, Lcom/p1/mobile/putong/core/data/ChatGroupMember;

    .line 10
    .line 11
    iget-object p2, p2, Ll/bkj0;->c:Ljava/lang/Object;

    .line 12
    .line 13
    check-cast p2, Lcom/p1/mobile/putong/core/data/ChatGroupMember;

    .line 14
    .line 15
    iget-object p1, p1, Ll/bkj0;->c:Ljava/lang/Object;

    .line 16
    .line 17
    check-cast p1, Ljava/lang/String;

    .line 18
    .line 19
    invoke-static {v0, v1, p2, p1}, Lcom/p1/mobile/putong/core/ui/messages/b;->g(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/data/ChatGroupMember;Lcom/p1/mobile/putong/core/data/ChatGroupMember;Ljava/lang/String;)Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public final synthetic h(Lcom/p1/mobile/putong/data/User;Landroid/view/View;)V
    .locals 2

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    invoke-virtual {p2}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 6
    .line 7
    .line 8
    move-result-object p2

    .line 9
    invoke-interface {p2}, Ll/r97;->G1()Z

    .line 10
    .line 11
    .line 12
    move-result p2

    .line 13
    if-eqz p2, :cond_1

    .line 14
    .line 15
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result p2

    .line 19
    if-eqz p2, :cond_0

    .line 20
    .line 21
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isAccountCancellation()Z

    .line 22
    .line 23
    .line 24
    move-result p1

    .line 25
    if-eqz p1, :cond_0

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemTickle;->f()Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemTickle;->f()Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 33
    .line 34
    .line 35
    move-result-object p2

    .line 36
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemTickle;->f()Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->f:Ll/clz;

    .line 41
    .line 42
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemTickle;->f()Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    iget-object v1, v1, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->f:Ll/clz;

    .line 47
    .line 48
    invoke-virtual {v1}, Ll/clz;->r3()Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object v1

    .line 52
    invoke-virtual {v0, v1}, Ll/clz;->k4(Ljava/lang/String;)Z

    .line 53
    .line 54
    .line 55
    move-result v0

    .line 56
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemTickle;->f()Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 57
    .line 58
    .line 59
    move-result-object p0

    .line 60
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->f:Ll/clz;

    .line 61
    .line 62
    invoke-virtual {p0}, Ll/clz;->r3()Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object p0

    .line 66
    invoke-static {p2, v0, p0}, Lcom/p1/mobile/putong/core/ui/messages/MessageProfileSettingAct;->Z1(Lcom/p1/mobile/android/app/Act;ZLjava/lang/String;)Landroid/content/Intent;

    .line 67
    .line 68
    .line 69
    move-result-object p0

    .line 70
    invoke-virtual {p1, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 71
    .line 72
    .line 73
    return-void

    .line 74
    :cond_1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemTickle;->f()Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 75
    .line 76
    .line 77
    move-result-object p0

    .line 78
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->toolbar()Landroidx/appcompat/widget/Toolbar;

    .line 79
    .line 80
    .line 81
    move-result-object p0

    .line 82
    if-nez p0, :cond_2

    .line 83
    .line 84
    :goto_0
    return-void

    .line 85
    :cond_2
    invoke-virtual {p0}, Landroidx/appcompat/widget/Toolbar;->showOverflowMenu()Z

    .line 86
    .line 87
    .line 88
    return-void
.end method

.method public final synthetic i(Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemTickle;->b:Lv/VText;

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

.method public j(Ll/g900;Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/data/User;)V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemTickle;->c:Landroid/view/View;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemTickle;->b:Lv/VText;

    .line 8
    .line 9
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    sget v3, Ll/g9c0;->H:I

    .line 14
    .line 15
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getColor(I)I

    .line 16
    .line 17
    .line 18
    move-result v2

    .line 19
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemTickle;->a:Lv/VText;

    .line 23
    .line 24
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 25
    .line 26
    .line 27
    move-result-object v2

    .line 28
    sget v3, Ll/g9c0;->G:I

    .line 29
    .line 30
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getColor(I)I

    .line 31
    .line 32
    .line 33
    move-result v2

    .line 34
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 35
    .line 36
    .line 37
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemTickle;->b:Lv/VText;

    .line 38
    .line 39
    const/4 v2, 0x0

    .line 40
    invoke-virtual {v0, v2}, Landroid/view/View;->setBackgroundColor(I)V

    .line 41
    .line 42
    .line 43
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemTickle;->a:Lv/VText;

    .line 44
    .line 45
    invoke-virtual {v0, v2}, Landroid/view/View;->setBackgroundColor(I)V

    .line 46
    .line 47
    .line 48
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    check-cast v0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 53
    .line 54
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->f:Ll/clz;

    .line 55
    .line 56
    invoke-virtual {v0}, Ll/clz;->t7()Ll/qzz;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    instance-of v0, v0, Ll/yxz;

    .line 61
    .line 62
    if-eqz v0, :cond_0

    .line 63
    .line 64
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    check-cast v0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 69
    .line 70
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->f:Ll/clz;

    .line 71
    .line 72
    invoke-virtual {v0}, Ll/clz;->t7()Ll/qzz;

    .line 73
    .line 74
    .line 75
    move-result-object v0

    .line 76
    check-cast v0, Ll/yxz;

    .line 77
    .line 78
    iget-boolean v0, v0, Ll/yxz;->M1:Z

    .line 79
    .line 80
    if-eqz v0, :cond_0

    .line 81
    .line 82
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemTickle;->b:Lv/VText;

    .line 83
    .line 84
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 85
    .line 86
    .line 87
    move-result-object v3

    .line 88
    sget v4, Ll/ibc0;->R4:I

    .line 89
    .line 90
    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 91
    .line 92
    .line 93
    move-result-object v3

    .line 94
    invoke-virtual {v0, v3}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 95
    .line 96
    .line 97
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemTickle;->b:Lv/VText;

    .line 98
    .line 99
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 100
    .line 101
    .line 102
    move-result-object v3

    .line 103
    sget v4, Ll/g9c0;->a0:I

    .line 104
    .line 105
    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getColor(I)I

    .line 106
    .line 107
    .line 108
    move-result v3

    .line 109
    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setTextColor(I)V

    .line 110
    .line 111
    .line 112
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemTickle;->a:Lv/VText;

    .line 113
    .line 114
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 115
    .line 116
    .line 117
    move-result-object v3

    .line 118
    sget v4, Ll/ibc0;->R4:I

    .line 119
    .line 120
    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 121
    .line 122
    .line 123
    move-result-object v3

    .line 124
    invoke-virtual {v0, v3}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 125
    .line 126
    .line 127
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemTickle;->a:Lv/VText;

    .line 128
    .line 129
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 130
    .line 131
    .line 132
    move-result-object v3

    .line 133
    sget v4, Ll/g9c0;->a0:I

    .line 134
    .line 135
    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getColor(I)I

    .line 136
    .line 137
    .line 138
    move-result v3

    .line 139
    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setTextColor(I)V

    .line 140
    .line 141
    .line 142
    :cond_0
    iget-object v0, p2, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 143
    .line 144
    const-string v3, "tickle"

    .line 145
    .line 146
    invoke-static {v0, v3}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 147
    .line 148
    .line 149
    move-result v0

    .line 150
    if-eqz v0, :cond_5

    .line 151
    .line 152
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/data/Message;->isLocal()Z

    .line 153
    .line 154
    .line 155
    move-result v0

    .line 156
    if-eqz v0, :cond_1

    .line 157
    .line 158
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemTickle;->c:Landroid/view/View;

    .line 159
    .line 160
    invoke-static {p0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 161
    .line 162
    .line 163
    return-void

    .line 164
    :cond_1
    iget-object v0, p2, Lcom/p1/mobile/putong/core/data/Message;->channel:Lcom/p1/mobile/putong/core/data/MessageChannel;

    .line 165
    .line 166
    const-string v2, "group"

    .line 167
    .line 168
    invoke-static {v0, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 169
    .line 170
    .line 171
    move-result v0

    .line 172
    if-eqz v0, :cond_3

    .line 173
    .line 174
    invoke-static {p2}, Lcom/p1/mobile/putong/core/ui/messages/b;->o(Lcom/p1/mobile/putong/core/data/Message;)Ll/bkj0;

    .line 175
    .line 176
    .line 177
    move-result-object v0

    .line 178
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 179
    .line 180
    .line 181
    move-result v2

    .line 182
    if-eqz v2, :cond_2

    .line 183
    .line 184
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemTickle;->f()Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 185
    .line 186
    .line 187
    move-result-object v2

    .line 188
    sget-object v3, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 189
    .line 190
    iget-object v3, v3, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 191
    .line 192
    iget-object v4, p2, Lcom/p1/mobile/putong/core/data/Message;->cid:Ljava/lang/String;

    .line 193
    .line 194
    invoke-virtual {v3, v4}, Lcom/p1/mobile/putong/core/api/g;->Ne(Ljava/lang/String;)Lrx/c;

    .line 195
    .line 196
    .line 197
    move-result-object v3

    .line 198
    new-instance v4, Ll/sb8;

    .line 199
    .line 200
    invoke-direct {v4}, Ll/sb8;-><init>()V

    .line 201
    .line 202
    .line 203
    invoke-virtual {v3, v4}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 204
    .line 205
    .line 206
    move-result-object v3

    .line 207
    invoke-virtual {v3, v1}, Lrx/c;->take(I)Lrx/c;

    .line 208
    .line 209
    .line 210
    move-result-object v3

    .line 211
    new-instance v4, Ll/djq;

    .line 212
    .line 213
    invoke-direct {v4}, Ll/djq;-><init>()V

    .line 214
    .line 215
    .line 216
    invoke-virtual {v3, v4}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 217
    .line 218
    .line 219
    move-result-object v3

    .line 220
    new-instance v4, Ll/ejq;

    .line 221
    .line 222
    invoke-direct {v4, v0}, Ll/ejq;-><init>(Ll/bkj0;)V

    .line 223
    .line 224
    .line 225
    invoke-virtual {v3, v4}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 226
    .line 227
    .line 228
    move-result-object v3

    .line 229
    invoke-virtual {p1, v2, v3}, Ll/l900;->c(Ll/ner;Lrx/c;)Lrx/c;

    .line 230
    .line 231
    .line 232
    move-result-object v2

    .line 233
    invoke-virtual {v2, v1}, Lrx/c;->take(I)Lrx/c;

    .line 234
    .line 235
    .line 236
    move-result-object v1

    .line 237
    new-instance v2, Ll/fjq;

    .line 238
    .line 239
    invoke-direct {v2, p0, v0}, Ll/fjq;-><init>(Lcom/p1/mobile/putong/core/ui/messages/ItemTickle;Ll/bkj0;)V

    .line 240
    .line 241
    .line 242
    invoke-static {v2}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 243
    .line 244
    .line 245
    move-result-object v0

    .line 246
    invoke-virtual {v1, v0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 247
    .line 248
    .line 249
    goto :goto_0

    .line 250
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemTickle;->a:Lv/VText;

    .line 251
    .line 252
    const-string v1, ""

    .line 253
    .line 254
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 255
    .line 256
    .line 257
    goto :goto_0

    .line 258
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemTickle;->a:Lv/VText;

    .line 259
    .line 260
    invoke-static {p2}, Lcom/p1/mobile/putong/core/ui/messages/b;->h(Lcom/p1/mobile/putong/core/data/Message;)Ljava/lang/String;

    .line 261
    .line 262
    .line 263
    move-result-object v1

    .line 264
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 265
    .line 266
    .line 267
    :goto_0
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/core/ui/messages/ItemTickle;->k(Lcom/p1/mobile/putong/core/data/Message;)Z

    .line 268
    .line 269
    .line 270
    move-result v0

    .line 271
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemTickle;->b:Lv/VText;

    .line 272
    .line 273
    invoke-static {v1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 274
    .line 275
    .line 276
    if-eqz v0, :cond_9

    .line 277
    .line 278
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 279
    .line 280
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 281
    .line 282
    iget-object v0, v0, Ll/dkb;->e1:Ll/jxd0;

    .line 283
    .line 284
    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 285
    .line 286
    invoke-virtual {v0, v1}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 287
    .line 288
    .line 289
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 290
    .line 291
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 292
    .line 293
    iget-object v0, v0, Ll/dkb;->f1:Ll/wyd0;

    .line 294
    .line 295
    iget-object p2, p2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 296
    .line 297
    invoke-virtual {v0, p2}, Ll/wyd0;->put(Ljava/lang/Object;)Z

    .line 298
    .line 299
    .line 300
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 301
    .line 302
    .line 303
    move-result-object p2

    .line 304
    sget v0, Lcom/p1/mobile/putong/core/message/R$string;->R0:I

    .line 305
    .line 306
    invoke-virtual {p2, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 307
    .line 308
    .line 309
    move-result-object p2

    .line 310
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 311
    .line 312
    .line 313
    move-result-object v0

    .line 314
    sget v1, Lcom/p1/mobile/putong/core/message/R$string;->S0:I

    .line 315
    .line 316
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 317
    .line 318
    .line 319
    move-result-object v0

    .line 320
    new-instance v1, Ljava/lang/StringBuilder;

    .line 321
    .line 322
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 323
    .line 324
    .line 325
    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 326
    .line 327
    .line 328
    const-string p2, " "

    .line 329
    .line 330
    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 331
    .line 332
    .line 333
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 334
    .line 335
    .line 336
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 337
    .line 338
    .line 339
    move-result-object p2

    .line 340
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemTickle;->b:Lv/VText;

    .line 341
    .line 342
    invoke-static {v0}, Ll/jyb;->M(Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 343
    .line 344
    .line 345
    move-result-object v0

    .line 346
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 347
    .line 348
    .line 349
    move-result-object v2

    .line 350
    invoke-virtual {v2}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 351
    .line 352
    .line 353
    move-result-object v2

    .line 354
    invoke-interface {v2}, Ll/r97;->G1()Z

    .line 355
    .line 356
    .line 357
    move-result v2

    .line 358
    if-eqz v2, :cond_4

    .line 359
    .line 360
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 361
    .line 362
    .line 363
    move-result-object v2

    .line 364
    sget v3, Ll/g9c0;->D:I

    .line 365
    .line 366
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getColor(I)I

    .line 367
    .line 368
    .line 369
    move-result v2

    .line 370
    goto :goto_1

    .line 371
    :cond_4
    const-string v2, "#006DF7"

    .line 372
    .line 373
    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 374
    .line 375
    .line 376
    move-result v2

    .line 377
    :goto_1
    const/4 v3, 0x3

    .line 378
    invoke-static {v3}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 379
    .line 380
    .line 381
    move-result-object v3

    .line 382
    invoke-static {p2, v0, v2, v3}, Ll/q8g0;->b0(Ljava/lang/String;Ljava/util/ArrayList;ILandroid/graphics/Typeface;)Landroid/text/SpannableStringBuilder;

    .line 383
    .line 384
    .line 385
    move-result-object p2

    .line 386
    invoke-virtual {v1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 387
    .line 388
    .line 389
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemTickle;->b:Lv/VText;

    .line 390
    .line 391
    new-instance v0, Ll/gjq;

    .line 392
    .line 393
    invoke-direct {v0, p0, p3}, Ll/gjq;-><init>(Lcom/p1/mobile/putong/core/ui/messages/ItemTickle;Lcom/p1/mobile/putong/data/User;)V

    .line 394
    .line 395
    .line 396
    invoke-static {p2, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 397
    .line 398
    .line 399
    goto :goto_3

    .line 400
    :cond_5
    iget-object p3, p2, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 401
    .line 402
    const-string v0, "local_tickle_tip"

    .line 403
    .line 404
    invoke-static {p3, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 405
    .line 406
    .line 407
    move-result p3

    .line 408
    if-eqz p3, :cond_8

    .line 409
    .line 410
    sget-object p3, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 411
    .line 412
    iget-object p3, p3, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 413
    .line 414
    iget-object p2, p2, Lcom/p1/mobile/putong/core/data/Message;->cid:Ljava/lang/String;

    .line 415
    .line 416
    invoke-virtual {p3, p2}, Ll/dkb;->Pa(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 417
    .line 418
    .line 419
    move-result-object p2

    .line 420
    if-eqz p2, :cond_7

    .line 421
    .line 422
    iget-object p3, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemTickle;->a:Lv/VText;

    .line 423
    .line 424
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 425
    .line 426
    .line 427
    move-result p2

    .line 428
    if-eqz p2, :cond_6

    .line 429
    .line 430
    sget p2, Lcom/p1/mobile/putong/core/message/R$string;->P0:I

    .line 431
    .line 432
    goto :goto_2

    .line 433
    :cond_6
    sget p2, Lcom/p1/mobile/putong/core/message/R$string;->Q0:I

    .line 434
    .line 435
    :goto_2
    invoke-virtual {p3, p2}, Landroid/widget/TextView;->setText(I)V

    .line 436
    .line 437
    .line 438
    :cond_7
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemTickle;->b:Lv/VText;

    .line 439
    .line 440
    invoke-static {p2, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 441
    .line 442
    .line 443
    goto :goto_3

    .line 444
    :cond_8
    iget-object p2, p2, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 445
    .line 446
    const-string p3, "local_create_chat_group"

    .line 447
    .line 448
    invoke-static {p2, p3}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 449
    .line 450
    .line 451
    move-result p2

    .line 452
    if-eqz p2, :cond_9

    .line 453
    .line 454
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemTickle;->a:Lv/VText;

    .line 455
    .line 456
    sget p3, Lcom/p1/mobile/putong/core/message/R$string;->Q2:I

    .line 457
    .line 458
    invoke-virtual {p2, p3}, Landroid/widget/TextView;->setText(I)V

    .line 459
    .line 460
    .line 461
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemTickle;->b:Lv/VText;

    .line 462
    .line 463
    invoke-static {p2, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 464
    .line 465
    .line 466
    :cond_9
    :goto_3
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemTickle;->b:Lv/VText;

    .line 467
    .line 468
    invoke-static {p2}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 469
    .line 470
    .line 471
    move-result p2

    .line 472
    if-eqz p2, :cond_a

    .line 473
    .line 474
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemTickle;->f()Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 475
    .line 476
    .line 477
    move-result-object p2

    .line 478
    sget-object p3, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 479
    .line 480
    iget-object p3, p3, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 481
    .line 482
    iget-object p3, p3, Ll/dkb;->d1:Ll/jxd0;

    .line 483
    .line 484
    invoke-virtual {p3}, Ll/hxd0;->obs()Lrx/c;

    .line 485
    .line 486
    .line 487
    move-result-object p3

    .line 488
    invoke-virtual {p3}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 489
    .line 490
    .line 491
    move-result-object p3

    .line 492
    invoke-virtual {p1, p2, p3}, Ll/l900;->c(Ll/ner;Lrx/c;)Lrx/c;

    .line 493
    .line 494
    .line 495
    move-result-object p1

    .line 496
    new-instance p2, Ll/hjq;

    .line 497
    .line 498
    invoke-direct {p2, p0}, Ll/hjq;-><init>(Lcom/p1/mobile/putong/core/ui/messages/ItemTickle;)V

    .line 499
    .line 500
    .line 501
    invoke-static {p2}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 502
    .line 503
    .line 504
    move-result-object p0

    .line 505
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 506
    .line 507
    .line 508
    :cond_a
    return-void
.end method

.method public final k(Lcom/p1/mobile/putong/core/data/Message;)Z
    .locals 2

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-interface {p0}, Ll/r97;->D()Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    const/4 v0, 0x0

    .line 14
    if-nez p0, :cond_0

    .line 15
    .line 16
    return v0

    .line 17
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-virtual {p0}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-interface {p0}, Ll/r97;->E()Z

    .line 26
    .line 27
    .line 28
    move-result p0

    .line 29
    if-eqz p0, :cond_1

    .line 30
    .line 31
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/data/Message;->isGroupMessage()Z

    .line 32
    .line 33
    .line 34
    move-result p0

    .line 35
    if-eqz p0, :cond_1

    .line 36
    .line 37
    return v0

    .line 38
    :cond_1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 39
    .line 40
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 41
    .line 42
    invoke-virtual {p0}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 47
    .line 48
    .line 49
    move-result p0

    .line 50
    if-eqz p0, :cond_4

    .line 51
    .line 52
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/data/Message;->isLocal()Z

    .line 53
    .line 54
    .line 55
    move-result p0

    .line 56
    if-nez p0, :cond_4

    .line 57
    .line 58
    iget-object p0, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 59
    .line 60
    const-string v1, "fake_id_"

    .line 61
    .line 62
    invoke-virtual {p0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 63
    .line 64
    .line 65
    move-result p0

    .line 66
    if-nez p0, :cond_4

    .line 67
    .line 68
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 69
    .line 70
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 71
    .line 72
    iget-object p0, p0, Ll/dkb;->d1:Ll/jxd0;

    .line 73
    .line 74
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 75
    .line 76
    .line 77
    move-result-object p0

    .line 78
    check-cast p0, Ljava/lang/Boolean;

    .line 79
    .line 80
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 81
    .line 82
    .line 83
    move-result p0

    .line 84
    if-nez p0, :cond_4

    .line 85
    .line 86
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 87
    .line 88
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->b1:Ll/xab;

    .line 89
    .line 90
    iget-object p0, p0, Ll/xab;->R:Ll/jxd0;

    .line 91
    .line 92
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 93
    .line 94
    .line 95
    move-result-object p0

    .line 96
    check-cast p0, Ljava/lang/Boolean;

    .line 97
    .line 98
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 99
    .line 100
    .line 101
    move-result p0

    .line 102
    if-nez p0, :cond_4

    .line 103
    .line 104
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 105
    .line 106
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 107
    .line 108
    iget-object p0, p0, Ll/dkb;->e1:Ll/jxd0;

    .line 109
    .line 110
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 111
    .line 112
    .line 113
    move-result-object p0

    .line 114
    check-cast p0, Ljava/lang/Boolean;

    .line 115
    .line 116
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 117
    .line 118
    .line 119
    move-result p0

    .line 120
    if-eqz p0, :cond_3

    .line 121
    .line 122
    iget-object p0, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 123
    .line 124
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 125
    .line 126
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 127
    .line 128
    iget-object p1, p1, Ll/dkb;->f1:Ll/wyd0;

    .line 129
    .line 130
    invoke-virtual {p1}, Ll/azd0;->get()Ljava/lang/Object;

    .line 131
    .line 132
    .line 133
    move-result-object p1

    .line 134
    check-cast p1, Ljava/lang/CharSequence;

    .line 135
    .line 136
    invoke-static {p0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 137
    .line 138
    .line 139
    move-result p0

    .line 140
    if-eqz p0, :cond_2

    .line 141
    .line 142
    goto :goto_0

    .line 143
    :cond_2
    return v0

    .line 144
    :cond_3
    :goto_0
    const/4 p0, 0x1

    .line 145
    return p0

    .line 146
    :cond_4
    return v0
.end method

.method public onFinishInflate()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    sget v0, Ll/edc0;->E4:I

    .line 5
    .line 6
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    check-cast v0, Lv/VText;

    .line 11
    .line 12
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemTickle;->a:Lv/VText;

    .line 13
    .line 14
    sget v0, Ll/edc0;->D4:I

    .line 15
    .line 16
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    check-cast v0, Lv/VText;

    .line 21
    .line 22
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemTickle;->b:Lv/VText;

    .line 23
    .line 24
    sget v0, Ll/edc0;->C4:I

    .line 25
    .line 26
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemTickle;->c:Landroid/view/View;

    .line 31
    .line 32
    return-void
.end method

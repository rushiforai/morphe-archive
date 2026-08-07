.class public Lcom/p1/mobile/putong/core/newui/messages/BaseConversationRecommendItemView$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnLongClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/newui/messages/BaseConversationRecommendItemView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "a"
.end annotation


# instance fields
.field public final a:Lcom/p1/mobile/putong/data/User;

.field public final b:Landroid/content/Context;

.field public final c:Ll/pf60;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/pf60<",
            "Ljava/lang/Integer;",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public final d:Lcom/p1/mobile/putong/core/data/Conversation;

.field public final e:Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$b;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$b;Landroid/content/Context;Ll/pf60;Lcom/p1/mobile/putong/core/data/Conversation;Lcom/p1/mobile/putong/data/User;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$b;",
            "Landroid/content/Context;",
            "Ll/pf60<",
            "Ljava/lang/Integer;",
            "Ljava/lang/Boolean;",
            ">;",
            "Lcom/p1/mobile/putong/core/data/Conversation;",
            "Lcom/p1/mobile/putong/data/User;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p5, p0, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationRecommendItemView$a;->a:Lcom/p1/mobile/putong/data/User;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationRecommendItemView$a;->b:Landroid/content/Context;

    .line 7
    .line 8
    iput-object p3, p0, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationRecommendItemView$a;->c:Ll/pf60;

    .line 9
    .line 10
    iput-object p4, p0, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationRecommendItemView$a;->d:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 11
    .line 12
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationRecommendItemView$a;->e:Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$b;

    .line 13
    .line 14
    return-void
.end method

.method public static synthetic a(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/core/newui/messages/BaseConversationRecommendItemView$a;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationRecommendItemView$a;->e(Ll/uxj0;)V

    return-void
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/core/newui/messages/BaseConversationRecommendItemView$a;Ljava/lang/String;Ljava/lang/String;[Ll/w30;Lv/VListCell;Lv/VListCell$a;I)V
    .locals 0

    .line 1
    invoke-virtual/range {p0 .. p6}, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationRecommendItemView$a;->f(Ljava/lang/String;Ljava/lang/String;[Ll/w30;Lv/VListCell;Lv/VListCell$a;I)V

    return-void
.end method

.method public static synthetic d([Ll/w30;Landroid/view/View;)V
    .locals 0

    .line 1
    const/4 p1, 0x0

    .line 2
    aget-object p0, p0, p1

    .line 3
    .line 4
    invoke-virtual {p0}, Ll/w30;->b()V

    .line 5
    .line 6
    .line 7
    return-void
.end method


# virtual methods
.method public final synthetic e(Ll/uxj0;)V
    .locals 1

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationRecommendItemView$a;->e:Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$b;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationRecommendItemView$a;->a:Lcom/p1/mobile/putong/data/User;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    invoke-virtual {p1, p0, v0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$b;->O(Ljava/lang/String;Z)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final synthetic f(Ljava/lang/String;Ljava/lang/String;[Ll/w30;Lv/VListCell;Lv/VListCell$a;I)V
    .locals 1

    .line 1
    iget-object p4, p5, Lv/VListCell$a;->a:Ljava/lang/CharSequence;

    .line 2
    .line 3
    invoke-interface {p4}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p4

    .line 7
    invoke-static {p4, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    const-string p5, "p_messages_view"

    .line 12
    .line 13
    const/4 p6, 0x0

    .line 14
    if-eqz p1, :cond_0

    .line 15
    .line 16
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationRecommendItemView$a;->e:Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$b;

    .line 17
    .line 18
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$b;->K()Lcom/p1/mobile/android/app/Act;

    .line 19
    .line 20
    .line 21
    move-result-object p2

    .line 22
    sget-object p4, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 23
    .line 24
    iget-object p4, p4, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 25
    .line 26
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationRecommendItemView$a;->a:Lcom/p1/mobile/putong/data/User;

    .line 27
    .line 28
    iget-object v0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 29
    .line 30
    invoke-virtual {p4, v0}, Lcom/p1/mobile/putong/core/api/g;->op(Ljava/lang/String;)Lrx/c;

    .line 31
    .line 32
    .line 33
    move-result-object p4

    .line 34
    invoke-virtual {p1, p2, p4}, Ll/jic0;->c(Ll/ner;Lrx/c;)Lrx/c;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    new-instance p2, Ll/wi2;

    .line 39
    .line 40
    invoke-direct {p2, p0}, Ll/wi2;-><init>(Lcom/p1/mobile/putong/core/newui/messages/BaseConversationRecommendItemView$a;)V

    .line 41
    .line 42
    .line 43
    new-instance p0, Ll/xi2;

    .line 44
    .line 45
    invoke-direct {p0}, Ll/xi2;-><init>()V

    .line 46
    .line 47
    .line 48
    invoke-static {p2, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 53
    .line 54
    .line 55
    const-string p0, "e_hide_chat_rec"

    .line 56
    .line 57
    invoke-static {p0, p5}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 58
    .line 59
    .line 60
    goto :goto_1

    .line 61
    :cond_0
    invoke-static {p4, p2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 62
    .line 63
    .line 64
    move-result p1

    .line 65
    if-eqz p1, :cond_3

    .line 66
    .line 67
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationRecommendItemView$a;->d:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 68
    .line 69
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 70
    .line 71
    .line 72
    move-result p1

    .line 73
    if-eqz p1, :cond_1

    .line 74
    .line 75
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationRecommendItemView$a;->d:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 76
    .line 77
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/data/Conversation;->isAnonymous()Z

    .line 78
    .line 79
    .line 80
    move-result p1

    .line 81
    if-eqz p1, :cond_1

    .line 82
    .line 83
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->K()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 84
    .line 85
    .line 86
    move-result-object p1

    .line 87
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationRecommendItemView$a;->b:Landroid/content/Context;

    .line 88
    .line 89
    check-cast p2, Lcom/p1/mobile/android/app/Act;

    .line 90
    .line 91
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationRecommendItemView$a;->a:Lcom/p1/mobile/putong/data/User;

    .line 92
    .line 93
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 94
    .line 95
    invoke-interface {p1, p2, p0}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->Hp(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 96
    .line 97
    .line 98
    goto :goto_0

    .line 99
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationRecommendItemView$a;->d:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 100
    .line 101
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 102
    .line 103
    .line 104
    move-result p1

    .line 105
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationRecommendItemView$a;->b:Landroid/content/Context;

    .line 106
    .line 107
    if-eqz p1, :cond_2

    .line 108
    .line 109
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationRecommendItemView$a;->a:Lcom/p1/mobile/putong/data/User;

    .line 110
    .line 111
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 112
    .line 113
    const-string p1, "conversation_view"

    .line 114
    .line 115
    invoke-static {p2, p0, p1, p6}, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->o2(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Z)Landroid/content/Intent;

    .line 116
    .line 117
    .line 118
    move-result-object p0

    .line 119
    invoke-virtual {p2, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 120
    .line 121
    .line 122
    goto :goto_0

    .line 123
    :cond_2
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationRecommendItemView$a;->a:Lcom/p1/mobile/putong/data/User;

    .line 124
    .line 125
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 126
    .line 127
    const-string p1, "from_recommend_like"

    .line 128
    .line 129
    invoke-static {p2, p0, p1, p6}, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->o2(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Z)Landroid/content/Intent;

    .line 130
    .line 131
    .line 132
    move-result-object p0

    .line 133
    invoke-virtual {p2, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 134
    .line 135
    .line 136
    :goto_0
    const-string p0, "e_check_profile"

    .line 137
    .line 138
    invoke-static {p0, p5}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 139
    .line 140
    .line 141
    :cond_3
    :goto_1
    aget-object p0, p3, p6

    .line 142
    .line 143
    invoke-virtual {p0}, Ll/w30;->b()V

    .line 144
    .line 145
    .line 146
    return-void
.end method

.method public onLongClick(Landroid/view/View;)Z
    .locals 7

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationRecommendItemView$a;->a:Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    if-nez p1, :cond_0

    .line 5
    .line 6
    return v0

    .line 7
    :cond_0
    new-array p1, v0, [Ll/w30;

    .line 8
    .line 9
    new-instance v1, Ljava/util/ArrayList;

    .line 10
    .line 11
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 12
    .line 13
    .line 14
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationRecommendItemView$a;->b:Landroid/content/Context;

    .line 15
    .line 16
    sget v3, Lcom/p1/mobile/putong/core/R$string;->vh:I

    .line 17
    .line 18
    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v2

    .line 22
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationRecommendItemView$a;->b:Landroid/content/Context;

    .line 23
    .line 24
    sget v4, Lcom/p1/mobile/putong/core/R$string;->ch:I

    .line 25
    .line 26
    invoke-virtual {v3, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v3

    .line 30
    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 31
    .line 32
    .line 33
    invoke-interface {v1, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 34
    .line 35
    .line 36
    new-instance v4, Ll/w30$b;

    .line 37
    .line 38
    iget-object v5, p0, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationRecommendItemView$a;->b:Landroid/content/Context;

    .line 39
    .line 40
    invoke-direct {v4, v5}, Ll/w30$b;-><init>(Landroid/content/Context;)V

    .line 41
    .line 42
    .line 43
    iget-object v5, p0, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationRecommendItemView$a;->b:Landroid/content/Context;

    .line 44
    .line 45
    invoke-virtual {v5}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 46
    .line 47
    .line 48
    move-result-object v5

    .line 49
    sget v6, Lcom/p1/mobile/putong/core/R$string;->c:I

    .line 50
    .line 51
    invoke-virtual {v5, v6}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object v5

    .line 55
    invoke-virtual {v4, v5}, Ll/w30$b;->I(Ljava/lang/CharSequence;)Ll/w30$b;

    .line 56
    .line 57
    .line 58
    move-result-object v5

    .line 59
    new-instance v6, Ll/ui2;

    .line 60
    .line 61
    invoke-direct {v6, p1}, Ll/ui2;-><init>([Ll/w30;)V

    .line 62
    .line 63
    .line 64
    invoke-virtual {v5, v6}, Ll/w30$b;->U(Landroid/view/View$OnClickListener;)Ll/w30$b;

    .line 65
    .line 66
    .line 67
    move-result-object v5

    .line 68
    invoke-virtual {v5, v1}, Ll/w30$b;->Q(Ljava/util/List;)Ll/w30$b;

    .line 69
    .line 70
    .line 71
    move-result-object v1

    .line 72
    const/4 v5, 0x3

    .line 73
    invoke-static {v5}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 74
    .line 75
    .line 76
    move-result-object v5

    .line 77
    invoke-virtual {v1, v5}, Ll/w30$b;->P(Landroid/graphics/Typeface;)Ll/w30$b;

    .line 78
    .line 79
    .line 80
    move-result-object v1

    .line 81
    new-instance v5, Ll/vi2;

    .line 82
    .line 83
    invoke-direct {v5, p0, v2, v3, p1}, Ll/vi2;-><init>(Lcom/p1/mobile/putong/core/newui/messages/BaseConversationRecommendItemView$a;Ljava/lang/String;Ljava/lang/String;[Ll/w30;)V

    .line 84
    .line 85
    .line 86
    invoke-virtual {v1, v5}, Ll/w30$b;->V(Ll/w30$d;)Ll/w30$b;

    .line 87
    .line 88
    .line 89
    invoke-virtual {v4}, Ll/w30$b;->F()Ll/w30;

    .line 90
    .line 91
    .line 92
    move-result-object v1

    .line 93
    const/4 v2, 0x0

    .line 94
    aput-object v1, p1, v2

    .line 95
    .line 96
    invoke-virtual {v1}, Ll/w30;->f()V

    .line 97
    .line 98
    .line 99
    aget-object p1, p1, v2

    .line 100
    .line 101
    invoke-virtual {p1}, Ll/w30;->c()Landroid/view/View;

    .line 102
    .line 103
    .line 104
    move-result-object p1

    .line 105
    if-nez p1, :cond_1

    .line 106
    .line 107
    return v0

    .line 108
    :cond_1
    sget v1, Ll/adc0;->d5:I

    .line 109
    .line 110
    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 111
    .line 112
    .line 113
    move-result-object p1

    .line 114
    check-cast p1, Lv/VLinear;

    .line 115
    .line 116
    if-nez p1, :cond_2

    .line 117
    .line 118
    return v0

    .line 119
    :cond_2
    invoke-virtual {p1}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 120
    .line 121
    .line 122
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 123
    .line 124
    .line 125
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationRecommendItemView$a;->b:Landroid/content/Context;

    .line 126
    .line 127
    invoke-static {v1}, Ll/p9r;->a(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 128
    .line 129
    .line 130
    move-result-object v1

    .line 131
    sget v3, Ll/kec0;->Pb:I

    .line 132
    .line 133
    invoke-virtual {v1, v3, p1, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 134
    .line 135
    .line 136
    invoke-virtual {p1, v2, v2, v2, v2}, Landroid/view/View;->setPadding(IIII)V

    .line 137
    .line 138
    .line 139
    sget v1, Ll/adc0;->N5:I

    .line 140
    .line 141
    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 142
    .line 143
    .line 144
    move-result-object p1

    .line 145
    check-cast p1, Lv/VDraweeView;

    .line 146
    .line 147
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationRecommendItemView$a;->d:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 148
    .line 149
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 150
    .line 151
    .line 152
    move-result v1

    .line 153
    if-eqz v1, :cond_3

    .line 154
    .line 155
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationRecommendItemView$a;->d:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 156
    .line 157
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/Conversation;->isAnonymous()Z

    .line 158
    .line 159
    .line 160
    move-result v1

    .line 161
    if-eqz v1, :cond_3

    .line 162
    .line 163
    sget-object v1, Ll/uqb0;->G:Ll/fsb0;

    .line 164
    .line 165
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationRecommendItemView$a;->a:Lcom/p1/mobile/putong/data/User;

    .line 166
    .line 167
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/User;->getAnonymousUrl()Ljava/lang/String;

    .line 168
    .line 169
    .line 170
    move-result-object v2

    .line 171
    invoke-virtual {v1, p1, v2}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 172
    .line 173
    .line 174
    goto :goto_0

    .line 175
    :cond_3
    sget-object v1, Ll/uqb0;->G:Ll/fsb0;

    .line 176
    .line 177
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationRecommendItemView$a;->a:Lcom/p1/mobile/putong/data/User;

    .line 178
    .line 179
    invoke-static {v2}, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationRecommendItemView;->B(Lcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 180
    .line 181
    .line 182
    move-result-object v2

    .line 183
    invoke-virtual {v1, p1, v2}, Ll/fsb0;->Q0(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;)V

    .line 184
    .line 185
    .line 186
    :goto_0
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationRecommendItemView$a;->a:Lcom/p1/mobile/putong/data/User;

    .line 187
    .line 188
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/User;->isBannedNew()Z

    .line 189
    .line 190
    .line 191
    move-result v1

    .line 192
    if-nez v1, :cond_4

    .line 193
    .line 194
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationRecommendItemView$a;->a:Lcom/p1/mobile/putong/data/User;

    .line 195
    .line 196
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->isAccountCancellation()Z

    .line 197
    .line 198
    .line 199
    move-result p0

    .line 200
    if-eqz p0, :cond_5

    .line 201
    .line 202
    :cond_4
    sget-object p0, Ll/uqb0;->G:Ll/fsb0;

    .line 203
    .line 204
    sget v1, Ll/dbc0;->i0:I

    .line 205
    .line 206
    invoke-virtual {p0, p1, v1}, Ll/fsb0;->Y0(Lcom/facebook/drawee/view/SimpleDraweeView;I)V

    .line 207
    .line 208
    .line 209
    :cond_5
    const-string p0, "e_hide_chat_rec"

    .line 210
    .line 211
    const-string p1, "p_messages_view"

    .line 212
    .line 213
    invoke-static {p0, p1}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 214
    .line 215
    .line 216
    const-string p0, "e_check_profile"

    .line 217
    .line 218
    invoke-static {p0, p1}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 219
    .line 220
    .line 221
    return v0
.end method

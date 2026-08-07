.class public Lcom/p1/mobile/putong/core/newui/messages/ConversationFoldView;
.super Lv/VLinear;
.source "SourceFile"


# instance fields
.field public c:Landroid/widget/FrameLayout;

.field public d:Landroid/widget/TextView;

.field public e:Landroid/widget/ImageView;

.field public f:Lcom/p1/mobile/putong/core/newui/messages/ConversationWeakenView;

.field public g:Ll/kcg0;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lv/VLinear;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 5
    invoke-direct {p0, p1, p2}, Lv/VLinear;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 6
    invoke-direct {p0, p1, p2, p3}, Lv/VLinear;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static synthetic P(Landroid/view/View;)V
    .locals 2

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/g;->Qp()V

    .line 6
    .line 7
    .line 8
    invoke-static {}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;->z2()V

    .line 9
    .line 10
    .line 11
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 12
    .line 13
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 14
    .line 15
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/g;->bg()Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    const-string v0, "fold_type"

    .line 24
    .line 25
    invoke-static {v0, p0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    filled-new-array {p0}, [Ll/pf60;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    const-string v0, "e_old_messages_fold"

    .line 34
    .line 35
    const-string v1, "p_messages_view"

    .line 36
    .line 37
    invoke-static {v0, v1, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method public static synthetic Q(Lcom/p1/mobile/putong/core/newui/messages/ConversationFoldView;Ll/u46;Lcom/p1/mobile/putong/core/data/Conversation;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/newui/messages/ConversationFoldView;->S(Ll/u46;Lcom/p1/mobile/putong/core/data/Conversation;)V

    return-void
.end method


# virtual methods
.method public final R(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/z76;->a(Lcom/p1/mobile/putong/core/newui/messages/ConversationFoldView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic S(Ll/u46;Lcom/p1/mobile/putong/core/data/Conversation;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationFoldView;->f:Lcom/p1/mobile/putong/core/newui/messages/ConversationWeakenView;

    .line 2
    .line 3
    if-eqz p2, :cond_0

    .line 4
    .line 5
    const/4 p2, 0x1

    .line 6
    invoke-static {v0, p2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 7
    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationFoldView;->f:Lcom/p1/mobile/putong/core/newui/messages/ConversationWeakenView;

    .line 10
    .line 11
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationWeakenView;->e0(Ll/u46;)V

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    const/4 p0, 0x0

    .line 16
    invoke-static {v0, p0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public T(Lcom/p1/mobile/android/app/Act;Ll/u46;)V
    .locals 5

    return-void

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationFoldView;->c:Landroid/widget/FrameLayout;

    .line 2
    .line 3
    new-instance v1, Ll/x76;

    .line 4
    .line 5
    invoke-direct {v1}, Ll/x76;-><init>()V

    .line 6
    .line 7
    .line 8
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 9
    .line 10
    .line 11
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 12
    .line 13
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 14
    .line 15
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/g;->bg()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    const-string v1, "fold_type"

    .line 24
    .line 25
    invoke-static {v1, v0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    filled-new-array {v0}, [Ll/pf60;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    const-string v1, "e_old_messages_fold"

    .line 34
    .line 35
    const-string v2, "p_messages_view"

    .line 36
    .line 37
    invoke-static {v1, v2, v0}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 38
    .line 39
    .line 40
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 41
    .line 42
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 43
    .line 44
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/g;->bg()Z

    .line 45
    .line 46
    .line 47
    move-result v0

    .line 48
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationFoldView;->e:Landroid/widget/ImageView;

    .line 49
    .line 50
    if-eqz v0, :cond_0

    .line 51
    .line 52
    sget v2, Ll/dbc0;->aq:I

    .line 53
    .line 54
    goto :goto_0

    .line 55
    :cond_0
    sget v2, Ll/dbc0;->bq:I

    .line 56
    .line 57
    :goto_0
    invoke-virtual {v1, v2}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 58
    .line 59
    .line 60
    invoke-static {}, Ll/gra;->l()Lcom/p1/mobile/putong/core/data/CollapsibleConversationConfig;

    .line 61
    .line 62
    .line 63
    move-result-object v1

    .line 64
    iget-boolean v1, v1, Lcom/p1/mobile/putong/core/data/CollapsibleConversationConfig;->enabled:Z

    .line 65
    .line 66
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationFoldView;->d:Landroid/widget/TextView;

    .line 67
    .line 68
    if-eqz v1, :cond_1

    .line 69
    .line 70
    const-string v1, "\u66f4\u591a\u65e9\u671f\u6d88\u606f"

    .line 71
    .line 72
    invoke-virtual {v2, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 73
    .line 74
    .line 75
    goto :goto_1

    .line 76
    :cond_1
    sget-object v1, Ljava/util/Locale;->CHINESE:Ljava/util/Locale;

    .line 77
    .line 78
    invoke-static {}, Ll/gra;->k()Lcom/p1/mobile/putong/core/data/CollapsibleConversationConfig;

    .line 79
    .line 80
    .line 81
    move-result-object v3

    .line 82
    iget v3, v3, Lcom/p1/mobile/putong/core/data/CollapsibleConversationConfig;->ignorable_unread_msg_days:I

    .line 83
    .line 84
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 85
    .line 86
    .line 87
    move-result-object v3

    .line 88
    filled-new-array {v3}, [Ljava/lang/Object;

    .line 89
    .line 90
    .line 91
    move-result-object v3

    .line 92
    const-string v4, "%d\u65e5\u524d\u7684\u6d88\u606f"

    .line 93
    .line 94
    invoke-static {v1, v4, v3}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 95
    .line 96
    .line 97
    move-result-object v1

    .line 98
    invoke-virtual {v2, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 99
    .line 100
    .line 101
    :goto_1
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationFoldView;->d:Landroid/widget/TextView;

    .line 102
    .line 103
    const/4 v2, 0x3

    .line 104
    invoke-static {v2}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 105
    .line 106
    .line 107
    move-result-object v2

    .line 108
    const/4 v3, 0x1

    .line 109
    invoke-virtual {v1, v2, v3}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 110
    .line 111
    .line 112
    invoke-static {}, Ll/gra;->k()Lcom/p1/mobile/putong/core/data/CollapsibleConversationConfig;

    .line 113
    .line 114
    .line 115
    move-result-object v1

    .line 116
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationFoldView;->f:Lcom/p1/mobile/putong/core/newui/messages/ConversationWeakenView;

    .line 117
    .line 118
    const/4 v3, 0x0

    .line 119
    invoke-static {v2, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 120
    .line 121
    .line 122
    invoke-static {}, Ll/gra;->l()Lcom/p1/mobile/putong/core/data/CollapsibleConversationConfig;

    .line 123
    .line 124
    .line 125
    move-result-object v2

    .line 126
    iget-boolean v2, v2, Lcom/p1/mobile/putong/core/data/CollapsibleConversationConfig;->enabled:Z

    .line 127
    .line 128
    if-eqz v2, :cond_2

    .line 129
    .line 130
    goto :goto_2

    .line 131
    :cond_2
    if-nez v0, :cond_3

    .line 132
    .line 133
    iget v0, v1, Lcom/p1/mobile/putong/core/data/CollapsibleConversationConfig;->ignorable_unread_msg_days:I

    .line 134
    .line 135
    iget v1, v1, Lcom/p1/mobile/putong/core/data/CollapsibleConversationConfig;->ignore_msg_days:I

    .line 136
    .line 137
    if-ne v0, v1, :cond_3

    .line 138
    .line 139
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationFoldView;->g:Ll/kcg0;

    .line 140
    .line 141
    invoke-static {v0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 142
    .line 143
    .line 144
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 145
    .line 146
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 147
    .line 148
    const-string v1, "fake_conversation_weaken_conversation"

    .line 149
    .line 150
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/api/g;->Ue(Ljava/lang/String;)Lrx/c;

    .line 151
    .line 152
    .line 153
    move-result-object v0

    .line 154
    invoke-interface {p2, p1, v0}, Ll/pol;->c(Ll/ner;Lrx/c;)Lrx/c;

    .line 155
    .line 156
    .line 157
    move-result-object p1

    .line 158
    new-instance v0, Ll/y76;

    .line 159
    .line 160
    invoke-direct {v0, p0, p2}, Ll/y76;-><init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationFoldView;Ll/u46;)V

    .line 161
    .line 162
    .line 163
    invoke-static {v0}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 164
    .line 165
    .line 166
    move-result-object p2

    .line 167
    invoke-virtual {p1, p2}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 168
    .line 169
    .line 170
    move-result-object p1

    .line 171
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationFoldView;->g:Ll/kcg0;

    .line 172
    .line 173
    :cond_3
    :goto_2
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationFoldView;->R(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.class public Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemGroupSubTitleView;
.super Landroid/widget/LinearLayout;
.source "SourceFile"

# interfaces
.implements Ll/orl;


# instance fields
.field public a:Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemGroupSubTitleView;

.field public b:Lv/VText;

.field public c:Lv/VImage;

.field public d:Landroid/view/View;

.field public e:Lv/VText;

.field public f:Ll/sj6;


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

.method public static synthetic u(Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemGroupSubTitleView;Ll/sj6;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemGroupSubTitleView;->M0(Ll/sj6;)V

    return-void
.end method


# virtual methods
.method public final B(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/ea6;->a(Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemGroupSubTitleView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic M0(Ll/sj6;)V
    .locals 2

    .line 1
    iget-object v0, p1, Ll/sj6;->B:Lcom/p1/mobile/putong/core/data/ChatGroup;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/ChatGroup;->ownerUserId:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->K()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-interface {v1}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->me_()Lcom/p1/mobile/putong/data/User;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    iget-object v1, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-nez v0, :cond_0

    .line 20
    .line 21
    const/4 v0, 0x0

    .line 22
    invoke-interface {p0, p1, v0}, Ll/ue6;->H(Ll/sj6;Z)Z

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    if-eqz v0, :cond_0

    .line 27
    .line 28
    invoke-static {}, Lcom/p1/mobile/putong/data/User;->new_()Lcom/p1/mobile/putong/data/User;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    iget-object v1, p1, Ll/sj6;->B:Lcom/p1/mobile/putong/core/data/ChatGroup;

    .line 33
    .line 34
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/ChatGroup;->ownerUserId:Ljava/lang/String;

    .line 35
    .line 36
    iput-object v1, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 37
    .line 38
    iput-object v0, p1, Ll/sj6;->b:Lcom/p1/mobile/putong/data/User;

    .line 39
    .line 40
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemGroupSubTitleView;->b1()V

    .line 41
    .line 42
    .line 43
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemGroupSubTitleView;->y0()V

    .line 44
    .line 45
    .line 46
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemGroupSubTitleView;->d1()V

    .line 47
    .line 48
    .line 49
    return-void
.end method

.method public Q0(Ll/sj6;)V
    .locals 1

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemGroupSubTitleView;->f:Ll/sj6;

    .line 2
    .line 3
    iget-object v0, p1, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 4
    .line 5
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object p1, p1, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 12
    .line 13
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/Conversation;->convType:Ljava/lang/String;

    .line 14
    .line 15
    const-string v0, "intlSeeChatRequest"

    .line 16
    .line 17
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 18
    .line 19
    .line 20
    move-result p1

    .line 21
    if-eqz p1, :cond_0

    .line 22
    .line 23
    return-void

    .line 24
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemGroupSubTitleView;->y0()V

    .line 25
    .line 26
    .line 27
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemGroupSubTitleView;->d1()V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public final b1()V
    .locals 9

    .line 1
    invoke-static {}, Ll/gra;->a2()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemGroupSubTitleView;->f:Ll/sj6;

    .line 6
    .line 7
    const/4 v2, 0x1

    .line 8
    const/4 v3, 0x0

    .line 9
    if-eqz v0, :cond_1

    .line 10
    .line 11
    iget-boolean v0, v1, Ll/sj6;->e:Z

    .line 12
    .line 13
    invoke-interface {p0, v0}, Ll/ue6;->V0(Z)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    invoke-interface {p0, v1, v0}, Ll/ue6;->a0(Ll/sj6;Z)Lcom/p1/mobile/putong/data/UserLiveLabel;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-static {}, Ll/vq8;->b()Z

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    if-eqz v1, :cond_0

    .line 26
    .line 27
    invoke-static {}, Ll/gra;->a2()Z

    .line 28
    .line 29
    .line 30
    move-result v1

    .line 31
    if-eqz v1, :cond_0

    .line 32
    .line 33
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemGroupSubTitleView;->f:Ll/sj6;

    .line 34
    .line 35
    iget-object v1, v1, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 36
    .line 37
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/Conversation;->status:Lcom/p1/mobile/putong/data/ConversationStatus;

    .line 38
    .line 39
    const-string v4, "default"

    .line 40
    .line 41
    invoke-static {v1, v4}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 42
    .line 43
    .line 44
    move-result v1

    .line 45
    if-eqz v1, :cond_0

    .line 46
    .line 47
    if-eqz v0, :cond_0

    .line 48
    .line 49
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemGroupSubTitleView;->f:Ll/sj6;

    .line 50
    .line 51
    invoke-interface {p0, v1, v0}, Ll/ue6;->P0(Ll/sj6;Lcom/p1/mobile/putong/data/UserLiveLabel;)Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object v1

    .line 55
    const-string v4, "onVoice"

    .line 56
    .line 57
    iget-object v0, v0, Lcom/p1/mobile/putong/data/UserLiveLabel;->liveState:Ljava/lang/String;

    .line 58
    .line 59
    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 60
    .line 61
    .line 62
    move-result v0

    .line 63
    if-eqz v0, :cond_2

    .line 64
    .line 65
    move v0, v2

    .line 66
    goto :goto_1

    .line 67
    :cond_0
    const-string v1, ""

    .line 68
    .line 69
    goto :goto_0

    .line 70
    :cond_1
    iget-boolean v0, v1, Ll/sj6;->e:Z

    .line 71
    .line 72
    invoke-interface {p0, v1, v3, v0}, Ll/ue6;->O0(Ll/sj6;ZZ)Ljava/lang/String;

    .line 73
    .line 74
    .line 75
    move-result-object v1

    .line 76
    :cond_2
    :goto_0
    move v0, v3

    .line 77
    :goto_1
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 78
    .line 79
    .line 80
    move-result v4

    .line 81
    if-nez v4, :cond_6

    .line 82
    .line 83
    if-eqz v0, :cond_3

    .line 84
    .line 85
    const-string v0, "#35D3FF"

    .line 86
    .line 87
    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 88
    .line 89
    .line 90
    move-result v0

    .line 91
    goto :goto_2

    .line 92
    :cond_3
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 93
    .line 94
    .line 95
    move-result-object v0

    .line 96
    sget v4, Lcom/p1/mobile/putong/core/R$string;->xh:I

    .line 97
    .line 98
    invoke-virtual {v0, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 99
    .line 100
    .line 101
    move-result-object v0

    .line 102
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 103
    .line 104
    .line 105
    move-result v0

    .line 106
    const-string v4, "#ff5eea"

    .line 107
    .line 108
    if-eqz v0, :cond_4

    .line 109
    .line 110
    invoke-static {v4}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 111
    .line 112
    .line 113
    move-result v0

    .line 114
    goto :goto_2

    .line 115
    :cond_4
    invoke-static {v4}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 116
    .line 117
    .line 118
    move-result v0

    .line 119
    :goto_2
    new-instance v4, Landroid/text/SpannableStringBuilder;

    .line 120
    .line 121
    invoke-direct {v4}, Landroid/text/SpannableStringBuilder;-><init>()V

    .line 122
    .line 123
    .line 124
    new-instance v5, Landroid/text/SpannableString;

    .line 125
    .line 126
    invoke-direct {v5, v1}, Landroid/text/SpannableString;-><init>(Ljava/lang/CharSequence;)V

    .line 127
    .line 128
    .line 129
    new-instance v6, Landroid/text/style/ForegroundColorSpan;

    .line 130
    .line 131
    invoke-direct {v6, v0}, Landroid/text/style/ForegroundColorSpan;-><init>(I)V

    .line 132
    .line 133
    .line 134
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    .line 135
    .line 136
    .line 137
    move-result v7

    .line 138
    const/16 v8, 0x21

    .line 139
    .line 140
    invoke-virtual {v5, v6, v3, v7, v8}, Landroid/text/SpannableString;->setSpan(Ljava/lang/Object;III)V

    .line 141
    .line 142
    .line 143
    new-instance v6, Landroid/text/style/StyleSpan;

    .line 144
    .line 145
    invoke-direct {v6, v2}, Landroid/text/style/StyleSpan;-><init>(I)V

    .line 146
    .line 147
    .line 148
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    .line 149
    .line 150
    .line 151
    move-result v1

    .line 152
    invoke-virtual {v5, v6, v3, v1, v8}, Landroid/text/SpannableString;->setSpan(Ljava/lang/Object;III)V

    .line 153
    .line 154
    .line 155
    invoke-virtual {v4, v5}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 156
    .line 157
    .line 158
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemGroupSubTitleView;->b:Lv/VText;

    .line 159
    .line 160
    invoke-virtual {v1}, Landroidx/appcompat/widget/AppCompatTextView;->getText()Ljava/lang/CharSequence;

    .line 161
    .line 162
    .line 163
    move-result-object v1

    .line 164
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 165
    .line 166
    .line 167
    move-result v2

    .line 168
    if-nez v2, :cond_5

    .line 169
    .line 170
    new-instance v2, Landroid/text/SpannableString;

    .line 171
    .line 172
    const-string v5, " \u00b7 "

    .line 173
    .line 174
    invoke-direct {v2, v5}, Landroid/text/SpannableString;-><init>(Ljava/lang/CharSequence;)V

    .line 175
    .line 176
    .line 177
    new-instance v5, Landroid/text/style/ForegroundColorSpan;

    .line 178
    .line 179
    invoke-direct {v5, v0}, Landroid/text/style/ForegroundColorSpan;-><init>(I)V

    .line 180
    .line 181
    .line 182
    const/4 v0, 0x3

    .line 183
    invoke-virtual {v2, v5, v3, v0, v8}, Landroid/text/SpannableString;->setSpan(Ljava/lang/Object;III)V

    .line 184
    .line 185
    .line 186
    invoke-virtual {v4, v2}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 187
    .line 188
    .line 189
    invoke-virtual {v4, v1}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 190
    .line 191
    .line 192
    :cond_5
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemGroupSubTitleView;->b:Lv/VText;

    .line 193
    .line 194
    invoke-virtual {p0, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 195
    .line 196
    .line 197
    :cond_6
    return-void
.end method

.method public final c1()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemGroupSubTitleView;->e:Lv/VText;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public d1()V
    .locals 9

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemGroupSubTitleView;->f:Ll/sj6;

    .line 2
    .line 3
    iget-boolean v1, v0, Ll/sj6;->o:Z

    .line 4
    .line 5
    if-nez v1, :cond_0

    .line 6
    .line 7
    goto :goto_2

    .line 8
    :cond_0
    iget-object v0, v0, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 9
    .line 10
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    const/4 v1, 0x0

    .line 15
    if-eqz v0, :cond_1

    .line 16
    .line 17
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemGroupSubTitleView;->f:Ll/sj6;

    .line 18
    .line 19
    iget-object v0, v0, Ll/sj6;->p:Ljava/lang/String;

    .line 20
    .line 21
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-nez v0, :cond_1

    .line 26
    .line 27
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemGroupSubTitleView;->f:Ll/sj6;

    .line 28
    .line 29
    iget-object v0, v0, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 30
    .line 31
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/Conversation;->convType:Ljava/lang/String;

    .line 32
    .line 33
    const-string v2, "group"

    .line 34
    .line 35
    invoke-static {v2, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    if-eqz v0, :cond_1

    .line 40
    .line 41
    const/4 v0, 0x1

    .line 42
    goto :goto_0

    .line 43
    :cond_1
    move v0, v1

    .line 44
    :goto_0
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemGroupSubTitleView;->b:Lv/VText;

    .line 45
    .line 46
    invoke-static {v2, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 47
    .line 48
    .line 49
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemGroupSubTitleView;->a:Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemGroupSubTitleView;

    .line 50
    .line 51
    invoke-static {v2, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 52
    .line 53
    .line 54
    if-eqz v0, :cond_3

    .line 55
    .line 56
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemGroupSubTitleView;->b:Lv/VText;

    .line 57
    .line 58
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemGroupSubTitleView;->f:Ll/sj6;

    .line 59
    .line 60
    iget-object v0, v0, Ll/sj6;->q:Ljava/lang/String;

    .line 61
    .line 62
    invoke-static {v0}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 67
    .line 68
    .line 69
    move-result-object v4

    .line 70
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemGroupSubTitleView;->f:Ll/sj6;

    .line 71
    .line 72
    iget-object v5, v0, Ll/sj6;->t:Ljava/lang/String;

    .line 73
    .line 74
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 75
    .line 76
    .line 77
    move-result-object v0

    .line 78
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 79
    .line 80
    .line 81
    move-result-object v0

    .line 82
    sget v2, Ll/c9c0;->I:I

    .line 83
    .line 84
    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getColor(I)I

    .line 85
    .line 86
    .line 87
    move-result v6

    .line 88
    const/4 v7, 0x1

    .line 89
    const/4 v8, 0x1

    .line 90
    invoke-static/range {v3 .. v8}, Ll/qte;->b(Landroid/widget/TextView;Ljava/lang/String;Ljava/lang/String;IZZ)V

    .line 91
    .line 92
    .line 93
    move v0, v1

    .line 94
    :goto_1
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemGroupSubTitleView;->a:Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemGroupSubTitleView;

    .line 95
    .line 96
    invoke-virtual {v2}, Landroid/view/ViewGroup;->getChildCount()I

    .line 97
    .line 98
    .line 99
    move-result v2

    .line 100
    if-ge v0, v2, :cond_3

    .line 101
    .line 102
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemGroupSubTitleView;->a:Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemGroupSubTitleView;

    .line 103
    .line 104
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 105
    .line 106
    .line 107
    move-result-object v2

    .line 108
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemGroupSubTitleView;->b:Lv/VText;

    .line 109
    .line 110
    if-eq v2, v3, :cond_2

    .line 111
    .line 112
    invoke-static {v2, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 113
    .line 114
    .line 115
    :cond_2
    add-int/lit8 v0, v0, 0x1

    .line 116
    .line 117
    goto :goto_1

    .line 118
    :cond_3
    :goto_2
    return-void
.end method

.method public e(Ll/sj6;)V
    .locals 10

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemGroupSubTitleView;->f:Ll/sj6;

    .line 2
    .line 3
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemGroupSubTitleView;->c:Lv/VImage;

    .line 4
    .line 5
    iget-object v1, p1, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 6
    .line 7
    iget-boolean v1, v1, Lcom/p1/mobile/putong/core/data/Conversation;->muted:Z

    .line 8
    .line 9
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemGroupSubTitleView;->b:Lv/VText;

    .line 13
    .line 14
    const-string v1, ""

    .line 15
    .line 16
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemGroupSubTitleView;->a:Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemGroupSubTitleView;

    .line 20
    .line 21
    const/4 v1, 0x1

    .line 22
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 23
    .line 24
    .line 25
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemGroupSubTitleView;->b:Lv/VText;

    .line 26
    .line 27
    invoke-interface {p0, p1}, Ll/ue6;->p(Ll/sj6;)Lcom/p1/mobile/putong/core/data/Message;

    .line 28
    .line 29
    .line 30
    move-result-object v3

    .line 31
    iget-object v4, p1, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 32
    .line 33
    iget-boolean v5, v4, Lcom/p1/mobile/putong/core/data/Conversation;->muted:Z

    .line 34
    .line 35
    iget-object v6, p1, Ll/sj6;->d:Ll/pol;

    .line 36
    .line 37
    iget-object v7, p1, Ll/sj6;->x:Lcom/p1/mobile/android/app/Act;

    .line 38
    .line 39
    iget-object v8, p1, Ll/sj6;->C:[Ll/kcg0;

    .line 40
    .line 41
    new-instance v9, Ll/da6;

    .line 42
    .line 43
    invoke-direct {v9, p0, p1}, Ll/da6;-><init>(Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemGroupSubTitleView;Ll/sj6;)V

    .line 44
    .line 45
    .line 46
    invoke-static/range {v2 .. v9}, Ll/ihk;->h(Landroid/widget/TextView;Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/core/data/Conversation;ZLl/pol;Lcom/p1/mobile/android/app/Act;[Ll/kcg0;Ll/x20;)V

    .line 47
    .line 48
    .line 49
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemGroupSubTitleView;->c1()V

    .line 50
    .line 51
    .line 52
    return-void
.end method

.method public bridge synthetic getUserLiveLabelHashMap()Ljava/util/HashMap;
    .locals 0

    .line 1
    invoke-super {p0}, Ll/ue6;->getUserLiveLabelHashMap()Ljava/util/HashMap;

    move-result-object p0

    return-object p0
.end method

.method public m(Ll/sj6;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemGroupSubTitleView;->f:Ll/sj6;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemGroupSubTitleView;->e:Lv/VText;

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

.method public onFinishInflate()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemGroupSubTitleView;->B(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    invoke-static {}, Ll/gra;->z()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemGroupSubTitleView;->b:Lv/VText;

    .line 14
    .line 15
    invoke-static {p0}, Ll/ue6;->e0(Landroid/widget/TextView;)V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public bridge synthetic setPicPercent(F)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Ll/nrl;->setPicPercent(F)V

    return-void
.end method

.method public y0()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemGroupSubTitleView;->f:Ll/sj6;

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
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemGroupSubTitleView;->a:Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemGroupSubTitleView;

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

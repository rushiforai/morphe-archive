.class public Lcom/p1/mobile/putong/core/newui/messages/addressbook/ConversationAddressBookGroupView;
.super Landroid/widget/LinearLayout;
.source "SourceFile"


# instance fields
.field public a:Lv/VFrame;

.field public b:Lcom/p1/mobile/putong/ui/MultipleChatIconView;

.field public c:Lv/VDraweeView;

.field public d:Lv/VText;

.field public e:Lv/VText;

.field public f:Lv/VText;


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

    .line 5
    invoke-direct {p0, p1, p2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 6
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/core/newui/messages/addressbook/ConversationAddressBookGroupView;Lcom/p1/mobile/putong/core/newui/messages/addressbook/ConversationAddressBookGroupFrag$a;Lcom/p1/mobile/putong/core/data/Conversation;Lcom/p1/mobile/putong/core/data/ChatGroup;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/newui/messages/addressbook/ConversationAddressBookGroupView;->f(Lcom/p1/mobile/putong/core/newui/messages/addressbook/ConversationAddressBookGroupFrag$a;Lcom/p1/mobile/putong/core/data/Conversation;Lcom/p1/mobile/putong/core/data/ChatGroup;)V

    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/core/newui/messages/addressbook/ConversationAddressBookGroupView;Lcom/p1/mobile/putong/core/newui/messages/addressbook/ConversationAddressBookGroupFrag$a;Lcom/p1/mobile/putong/core/data/ChatGroup;[Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Conversation;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual/range {p0 .. p5}, Lcom/p1/mobile/putong/core/newui/messages/addressbook/ConversationAddressBookGroupView;->e(Lcom/p1/mobile/putong/core/newui/messages/addressbook/ConversationAddressBookGroupFrag$a;Lcom/p1/mobile/putong/core/data/ChatGroup;[Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Conversation;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/core/newui/messages/addressbook/ConversationAddressBookGroupView;Lcom/p1/mobile/putong/core/newui/messages/addressbook/ConversationAddressBookGroupFrag$a;Lcom/p1/mobile/putong/core/data/Conversation;Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/p1/mobile/putong/core/newui/messages/addressbook/ConversationAddressBookGroupView;->g(Lcom/p1/mobile/putong/core/newui/messages/addressbook/ConversationAddressBookGroupFrag$a;Lcom/p1/mobile/putong/core/data/Conversation;Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public final d(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/e56;->a(Lcom/p1/mobile/putong/core/newui/messages/addressbook/ConversationAddressBookGroupView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic e(Lcom/p1/mobile/putong/core/newui/messages/addressbook/ConversationAddressBookGroupFrag$a;Lcom/p1/mobile/putong/core/data/ChatGroup;[Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Conversation;Landroid/view/View;)V
    .locals 7

    .line 1
    invoke-static {}, Ll/gra;->P2()Z

    .line 2
    .line 3
    .line 4
    move-result p5

    .line 5
    if-eqz p5, :cond_0

    .line 6
    .line 7
    invoke-static {}, Ll/i46;->c()Ll/i46;

    .line 8
    .line 9
    .line 10
    move-result-object p5

    .line 11
    invoke-virtual {p5}, Ll/i46;->a()V

    .line 12
    .line 13
    .line 14
    invoke-static {}, Ll/i46;->c()Ll/i46;

    .line 15
    .line 16
    .line 17
    move-result-object p5

    .line 18
    iget-object p5, p5, Ll/i46;->a:Lrx/subjects/a;

    .line 19
    .line 20
    const/4 v0, 0x0

    .line 21
    invoke-virtual {p5, v0}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 22
    .line 23
    .line 24
    :cond_0
    invoke-virtual {p1}, Ll/mi2;->J()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    const-string p5, "group_name"

    .line 29
    .line 30
    iget-object v0, p2, Lcom/p1/mobile/putong/core/data/ChatGroup;->name:Ljava/lang/String;

    .line 31
    .line 32
    invoke-static {p5, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 33
    .line 34
    .line 35
    move-result-object p5

    .line 36
    const-string v0, "groupchat_id"

    .line 37
    .line 38
    iget-object p2, p2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 39
    .line 40
    invoke-static {v0, p2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 41
    .line 42
    .line 43
    move-result-object p2

    .line 44
    const/4 v0, 0x0

    .line 45
    aget-object p3, p3, v0

    .line 46
    .line 47
    const-string v0, "user_group_title"

    .line 48
    .line 49
    invoke-static {v0, p3}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 50
    .line 51
    .line 52
    move-result-object p3

    .line 53
    filled-new-array {p5, p2, p3}, [Ll/pf60;

    .line 54
    .line 55
    .line 56
    move-result-object p2

    .line 57
    const-string p3, "e_contacts_one_of_groups"

    .line 58
    .line 59
    invoke-static {p3, p1, p2}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 60
    .line 61
    .line 62
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 63
    .line 64
    .line 65
    move-result-object p1

    .line 66
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    iget-object v1, p4, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 71
    .line 72
    const-string v5, ""

    .line 73
    .line 74
    const/4 v6, 0x0

    .line 75
    const/4 v2, 0x0

    .line 76
    const/4 v3, 0x0

    .line 77
    const/16 v4, 0x1d

    .line 78
    .line 79
    invoke-static/range {v0 .. v6}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->N2(Landroid/content/Context;Ljava/lang/String;ZZILjava/lang/String;Z)Landroid/content/Intent;

    .line 80
    .line 81
    .line 82
    move-result-object p0

    .line 83
    invoke-virtual {p1, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 84
    .line 85
    .line 86
    return-void
.end method

.method public final synthetic f(Lcom/p1/mobile/putong/core/newui/messages/addressbook/ConversationAddressBookGroupFrag$a;Lcom/p1/mobile/putong/core/data/Conversation;Lcom/p1/mobile/putong/core/data/ChatGroup;)V
    .locals 9

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/addressbook/ConversationAddressBookGroupView;->d:Lv/VText;

    .line 2
    .line 3
    iget-object v1, p3, Lcom/p1/mobile/putong/core/data/ChatGroup;->name:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/addressbook/ConversationAddressBookGroupView;->d:Lv/VText;

    .line 9
    .line 10
    sget-object v1, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;

    .line 11
    .line 12
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/addressbook/ConversationAddressBookGroupView;->d:Lv/VText;

    .line 16
    .line 17
    invoke-virtual {v0}, Landroid/widget/TextView;->setSingleLine()V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/addressbook/ConversationAddressBookGroupView;->d:Lv/VText;

    .line 21
    .line 22
    invoke-virtual {v0}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    const/4 v1, 0x1

    .line 27
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setFakeBoldText(Z)V

    .line 28
    .line 29
    .line 30
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/addressbook/ConversationAddressBookGroupView;->f:Lv/VText;

    .line 31
    .line 32
    iget-object v2, p3, Lcom/p1/mobile/putong/core/data/ChatGroup;->description:Ljava/lang/String;

    .line 33
    .line 34
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 35
    .line 36
    .line 37
    iget-object v0, p3, Lcom/p1/mobile/putong/core/data/ChatGroup;->avatars:Ljava/util/List;

    .line 38
    .line 39
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    const/4 v2, 0x0

    .line 44
    if-eqz v0, :cond_0

    .line 45
    .line 46
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 47
    .line 48
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/messages/addressbook/ConversationAddressBookGroupView;->c:Lv/VDraweeView;

    .line 49
    .line 50
    sget v4, Ll/dbc0;->m8:I

    .line 51
    .line 52
    invoke-virtual {v0, v3, v4}, Ll/fsb0;->Y0(Lcom/facebook/drawee/view/SimpleDraweeView;I)V

    .line 53
    .line 54
    .line 55
    goto :goto_0

    .line 56
    :cond_0
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 57
    .line 58
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/messages/addressbook/ConversationAddressBookGroupView;->c:Lv/VDraweeView;

    .line 59
    .line 60
    iget-object v4, p3, Lcom/p1/mobile/putong/core/data/ChatGroup;->avatars:Ljava/util/List;

    .line 61
    .line 62
    invoke-interface {v4, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 63
    .line 64
    .line 65
    move-result-object v4

    .line 66
    check-cast v4, Lcom/p1/mobile/putong/data/Picture;

    .line 67
    .line 68
    invoke-virtual {v4}, Lcom/p1/mobile/putong/data/Media;->cover()Lcom/p1/mobile/putong/data/Picture;

    .line 69
    .line 70
    .line 71
    move-result-object v4

    .line 72
    invoke-virtual {v4}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 73
    .line 74
    .line 75
    move-result-object v4

    .line 76
    invoke-virtual {v4}, Lcom/p1/mobile/putong/data/Picture$ImageUri;->formatted()Ljava/lang/String;

    .line 77
    .line 78
    .line 79
    move-result-object v4

    .line 80
    invoke-virtual {v0, v3, v4}, Ll/fsb0;->Z0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 81
    .line 82
    .line 83
    :goto_0
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 84
    .line 85
    .line 86
    move-result-object v0

    .line 87
    invoke-interface {v0}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 88
    .line 89
    .line 90
    move-result-object v0

    .line 91
    new-array v7, v1, [Ljava/lang/String;

    .line 92
    .line 93
    iget-object v3, p3, Lcom/p1/mobile/putong/core/data/ChatGroup;->ownerUserId:Ljava/lang/String;

    .line 94
    .line 95
    invoke-static {v3, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 96
    .line 97
    .line 98
    move-result v3

    .line 99
    if-eqz v3, :cond_1

    .line 100
    .line 101
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/addressbook/ConversationAddressBookGroupView;->e:Lv/VText;

    .line 102
    .line 103
    const-string v3, "\u7fa4\u4e3b"

    .line 104
    .line 105
    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 106
    .line 107
    .line 108
    const-string v0, "1"

    .line 109
    .line 110
    aput-object v0, v7, v2

    .line 111
    .line 112
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/addressbook/ConversationAddressBookGroupView;->e:Lv/VText;

    .line 113
    .line 114
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 115
    .line 116
    .line 117
    goto :goto_1

    .line 118
    :cond_1
    iget-object v3, p3, Lcom/p1/mobile/putong/core/data/ChatGroup;->adminUserIds:Ljava/util/List;

    .line 119
    .line 120
    invoke-static {v3}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 121
    .line 122
    .line 123
    move-result v3

    .line 124
    if-nez v3, :cond_2

    .line 125
    .line 126
    iget-object v3, p3, Lcom/p1/mobile/putong/core/data/ChatGroup;->adminUserIds:Ljava/util/List;

    .line 127
    .line 128
    invoke-interface {v3, v0}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 129
    .line 130
    .line 131
    move-result v0

    .line 132
    if-eqz v0, :cond_2

    .line 133
    .line 134
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/addressbook/ConversationAddressBookGroupView;->e:Lv/VText;

    .line 135
    .line 136
    const-string v3, "\u7ba1\u7406\u5458"

    .line 137
    .line 138
    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 139
    .line 140
    .line 141
    const-string v0, "2"

    .line 142
    .line 143
    aput-object v0, v7, v2

    .line 144
    .line 145
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/addressbook/ConversationAddressBookGroupView;->e:Lv/VText;

    .line 146
    .line 147
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 148
    .line 149
    .line 150
    goto :goto_1

    .line 151
    :cond_2
    const-string v0, "0"

    .line 152
    .line 153
    aput-object v0, v7, v2

    .line 154
    .line 155
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/addressbook/ConversationAddressBookGroupView;->e:Lv/VText;

    .line 156
    .line 157
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 158
    .line 159
    .line 160
    :goto_1
    invoke-virtual {p1}, Ll/mi2;->J()Ljava/lang/String;

    .line 161
    .line 162
    .line 163
    move-result-object v0

    .line 164
    const-string v1, "group_name"

    .line 165
    .line 166
    iget-object v3, p3, Lcom/p1/mobile/putong/core/data/ChatGroup;->name:Ljava/lang/String;

    .line 167
    .line 168
    invoke-static {v1, v3}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 169
    .line 170
    .line 171
    move-result-object v1

    .line 172
    const-string v3, "groupchat_id"

    .line 173
    .line 174
    iget-object v4, p3, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 175
    .line 176
    invoke-static {v3, v4}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 177
    .line 178
    .line 179
    move-result-object v3

    .line 180
    const-string v4, "user_group_title"

    .line 181
    .line 182
    aget-object v2, v7, v2

    .line 183
    .line 184
    invoke-static {v4, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 185
    .line 186
    .line 187
    move-result-object v2

    .line 188
    filled-new-array {v1, v3, v2}, [Ll/pf60;

    .line 189
    .line 190
    .line 191
    move-result-object v1

    .line 192
    const-string v2, "e_contacts_one_of_groups"

    .line 193
    .line 194
    invoke-static {v2, v0, v1}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 195
    .line 196
    .line 197
    new-instance v3, Ll/d56;

    .line 198
    .line 199
    move-object v4, p0

    .line 200
    move-object v5, p1

    .line 201
    move-object v8, p2

    .line 202
    move-object v6, p3

    .line 203
    invoke-direct/range {v3 .. v8}, Ll/d56;-><init>(Lcom/p1/mobile/putong/core/newui/messages/addressbook/ConversationAddressBookGroupView;Lcom/p1/mobile/putong/core/newui/messages/addressbook/ConversationAddressBookGroupFrag$a;Lcom/p1/mobile/putong/core/data/ChatGroup;[Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Conversation;)V

    .line 204
    .line 205
    .line 206
    invoke-static {v4, v3}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 207
    .line 208
    .line 209
    return-void
.end method

.method public final synthetic g(Lcom/p1/mobile/putong/core/newui/messages/addressbook/ConversationAddressBookGroupFrag$a;Lcom/p1/mobile/putong/core/data/Conversation;Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;Landroid/view/View;)V
    .locals 6

    .line 1
    invoke-virtual {p1}, Ll/mi2;->J()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    const-string p4, "group_name"

    .line 6
    .line 7
    iget-object p2, p2, Lcom/p1/mobile/putong/core/data/Conversation;->localExtraInfo:Ljava/lang/String;

    .line 8
    .line 9
    invoke-static {p4, p2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 10
    .line 11
    .line 12
    move-result-object p2

    .line 13
    const-string p4, "groupchat_id"

    .line 14
    .line 15
    const-string v0, ""

    .line 16
    .line 17
    invoke-static {p4, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 18
    .line 19
    .line 20
    move-result-object p4

    .line 21
    const-string v1, "user_group_title"

    .line 22
    .line 23
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    filled-new-array {p2, p4, v0}, [Ll/pf60;

    .line 28
    .line 29
    .line 30
    move-result-object p2

    .line 31
    const-string p4, "e_contacts_one_of_groups"

    .line 32
    .line 33
    invoke-static {p4, p1, p2}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 34
    .line 35
    .line 36
    iget-object p1, p3, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;->cellInfo:Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemInfo;

    .line 37
    .line 38
    iget-boolean p1, p1, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemInfo;->isDissolved:Z

    .line 39
    .line 40
    if-eqz p1, :cond_0

    .line 41
    .line 42
    new-instance p1, Ll/th0$a;

    .line 43
    .line 44
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    invoke-direct {p1, p0}, Ll/th0$a;-><init>(Landroid/content/Context;)V

    .line 49
    .line 50
    .line 51
    iget-object p0, p3, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;->cellInfo:Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemInfo;

    .line 52
    .line 53
    iget-object p0, p0, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemInfo;->dissolveReason:Ljava/lang/String;

    .line 54
    .line 55
    invoke-virtual {p1, p0}, Ll/th0$a;->j(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    const-string p1, "\u786e\u8ba4"

    .line 60
    .line 61
    invoke-virtual {p0, p1}, Ll/th0$a;->r(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 62
    .line 63
    .line 64
    move-result-object p0

    .line 65
    invoke-virtual {p0}, Ll/th0$a;->a()Ll/th0;

    .line 66
    .line 67
    .line 68
    move-result-object p0

    .line 69
    invoke-virtual {p0}, Ll/th0;->g()V

    .line 70
    .line 71
    .line 72
    return-void

    .line 73
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->Q()Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;

    .line 74
    .line 75
    .line 76
    move-result-object p1

    .line 77
    invoke-interface {p1}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;->M6()Ll/ftn0;

    .line 78
    .line 79
    .line 80
    move-result-object v0

    .line 81
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 82
    .line 83
    .line 84
    move-result-object v1

    .line 85
    iget-object p0, p3, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;->roomInfo:Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemRoom;

    .line 86
    .line 87
    iget-object v2, p0, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemRoom;->liveId:Ljava/lang/String;

    .line 88
    .line 89
    const-string v4, ""

    .line 90
    .line 91
    const/4 v5, 0x0

    .line 92
    const-string v3, "default"

    .line 93
    .line 94
    invoke-interface/range {v0 .. v5}, Ll/ftn0;->p(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 95
    .line 96
    .line 97
    return-void
.end method

.method public h(Lcom/p1/mobile/putong/core/newui/messages/addressbook/ConversationAddressBookGroupFrag$a;Lcom/p1/mobile/putong/core/data/Conversation;)V
    .locals 2

    .line 1
    iget-object v0, p2, Lcom/p1/mobile/putong/core/data/Conversation;->convType:Ljava/lang/String;

    .line 2
    .line 3
    const-string v1, "virtualvoice"

    .line 4
    .line 5
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/newui/messages/addressbook/ConversationAddressBookGroupView;->j(Lcom/p1/mobile/putong/core/newui/messages/addressbook/ConversationAddressBookGroupFrag$a;Lcom/p1/mobile/putong/core/data/Conversation;)V

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/newui/messages/addressbook/ConversationAddressBookGroupView;->i(Lcom/p1/mobile/putong/core/newui/messages/addressbook/ConversationAddressBookGroupFrag$a;Lcom/p1/mobile/putong/core/data/Conversation;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public final i(Lcom/p1/mobile/putong/core/newui/messages/addressbook/ConversationAddressBookGroupFrag$a;Lcom/p1/mobile/putong/core/data/Conversation;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/addressbook/ConversationAddressBookGroupView;->b:Lcom/p1/mobile/putong/ui/MultipleChatIconView;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/addressbook/ConversationAddressBookGroupView;->c:Lv/VDraweeView;

    .line 8
    .line 9
    const/4 v1, 0x1

    .line 10
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    check-cast v0, Lcom/p1/mobile/android/app/Act;

    .line 18
    .line 19
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 20
    .line 21
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->g0:Lcom/p1/mobile/putong/core/api/e;

    .line 22
    .line 23
    iget-object v2, p2, Lcom/p1/mobile/putong/core/data/Conversation;->otherUser:Ljava/lang/String;

    .line 24
    .line 25
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/core/api/e;->o6(Ljava/lang/String;)Lrx/c;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    invoke-virtual {p1, v0, v1}, Ll/jic0;->c(Ll/ner;Lrx/c;)Lrx/c;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    new-instance v1, Ll/c56;

    .line 34
    .line 35
    invoke-direct {v1, p0, p1, p2}, Ll/c56;-><init>(Lcom/p1/mobile/putong/core/newui/messages/addressbook/ConversationAddressBookGroupView;Lcom/p1/mobile/putong/core/newui/messages/addressbook/ConversationAddressBookGroupFrag$a;Lcom/p1/mobile/putong/core/data/Conversation;)V

    .line 36
    .line 37
    .line 38
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 43
    .line 44
    .line 45
    return-void
.end method

.method public final j(Lcom/p1/mobile/putong/core/newui/messages/addressbook/ConversationAddressBookGroupFrag$a;Lcom/p1/mobile/putong/core/data/Conversation;)V
    .locals 6

    .line 1
    if-eqz p2, :cond_3

    .line 2
    .line 3
    iget-object v0, p2, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    goto/16 :goto_1

    .line 8
    .line 9
    :cond_0
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->liveVirtualVoice:Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;

    .line 10
    .line 11
    if-nez v0, :cond_1

    .line 12
    .line 13
    goto/16 :goto_1

    .line 14
    .line 15
    :cond_1
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/addressbook/ConversationAddressBookGroupView;->d:Lv/VText;

    .line 16
    .line 17
    iget-object v2, p2, Lcom/p1/mobile/putong/core/data/Conversation;->localExtraInfo:Ljava/lang/String;

    .line 18
    .line 19
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 20
    .line 21
    .line 22
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/addressbook/ConversationAddressBookGroupView;->d:Lv/VText;

    .line 23
    .line 24
    invoke-virtual {v1}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    const/4 v2, 0x1

    .line 29
    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setFakeBoldText(Z)V

    .line 30
    .line 31
    .line 32
    iget-object v1, v0, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;->chatInfo:Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemChat;

    .line 33
    .line 34
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 35
    .line 36
    .line 37
    move-result v1

    .line 38
    const-string v3, ""

    .line 39
    .line 40
    if-eqz v1, :cond_2

    .line 41
    .line 42
    iget-object v1, v0, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;->chatInfo:Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemChat;

    .line 43
    .line 44
    iget-object v1, v1, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemChat;->commonMsg:Ljava/lang/String;

    .line 45
    .line 46
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 47
    .line 48
    .line 49
    move-result v1

    .line 50
    if-nez v1, :cond_2

    .line 51
    .line 52
    iget-object v1, v0, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;->chatInfo:Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemChat;

    .line 53
    .line 54
    iget-object v1, v1, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemChat;->commonMsg:Ljava/lang/String;

    .line 55
    .line 56
    goto :goto_0

    .line 57
    :cond_2
    move-object v1, v3

    .line 58
    :goto_0
    iget-object v4, p0, Lcom/p1/mobile/putong/core/newui/messages/addressbook/ConversationAddressBookGroupView;->f:Lv/VText;

    .line 59
    .line 60
    invoke-virtual {v4, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 61
    .line 62
    .line 63
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/addressbook/ConversationAddressBookGroupView;->b:Lcom/p1/mobile/putong/ui/MultipleChatIconView;

    .line 64
    .line 65
    const/high16 v4, 0x425c0000    # 55.0f

    .line 66
    .line 67
    invoke-virtual {v1, v4}, Lcom/p1/mobile/putong/ui/MultipleChatIconView;->setRadius(F)V

    .line 68
    .line 69
    .line 70
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/addressbook/ConversationAddressBookGroupView;->b:Lcom/p1/mobile/putong/ui/MultipleChatIconView;

    .line 71
    .line 72
    iget-object v4, v0, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;->roomInfo:Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemRoom;

    .line 73
    .line 74
    iget-object v4, v4, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemRoom;->avatars:Ljava/util/List;

    .line 75
    .line 76
    const/4 v5, 0x0

    .line 77
    invoke-virtual {v1, v4, v5}, Lcom/p1/mobile/putong/ui/MultipleChatIconView;->p0(Ljava/util/List;Z)V

    .line 78
    .line 79
    .line 80
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/addressbook/ConversationAddressBookGroupView;->b:Lcom/p1/mobile/putong/ui/MultipleChatIconView;

    .line 81
    .line 82
    invoke-static {v1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 83
    .line 84
    .line 85
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/addressbook/ConversationAddressBookGroupView;->c:Lv/VDraweeView;

    .line 86
    .line 87
    invoke-static {v1, v5}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 88
    .line 89
    .line 90
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/addressbook/ConversationAddressBookGroupView;->e:Lv/VText;

    .line 91
    .line 92
    invoke-static {v1, v5}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 93
    .line 94
    .line 95
    invoke-virtual {p1}, Ll/mi2;->J()Ljava/lang/String;

    .line 96
    .line 97
    .line 98
    move-result-object v1

    .line 99
    const-string v2, "group_name"

    .line 100
    .line 101
    iget-object v4, p2, Lcom/p1/mobile/putong/core/data/Conversation;->localExtraInfo:Ljava/lang/String;

    .line 102
    .line 103
    invoke-static {v2, v4}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 104
    .line 105
    .line 106
    move-result-object v2

    .line 107
    const-string v4, "groupchat_id"

    .line 108
    .line 109
    invoke-static {v4, v3}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 110
    .line 111
    .line 112
    move-result-object v4

    .line 113
    const-string v5, "user_group_title"

    .line 114
    .line 115
    invoke-static {v5, v3}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 116
    .line 117
    .line 118
    move-result-object v3

    .line 119
    filled-new-array {v2, v4, v3}, [Ll/pf60;

    .line 120
    .line 121
    .line 122
    move-result-object v2

    .line 123
    const-string v3, "e_contacts_one_of_groups"

    .line 124
    .line 125
    invoke-static {v3, v1, v2}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 126
    .line 127
    .line 128
    new-instance v1, Ll/b56;

    .line 129
    .line 130
    invoke-direct {v1, p0, p1, p2, v0}, Ll/b56;-><init>(Lcom/p1/mobile/putong/core/newui/messages/addressbook/ConversationAddressBookGroupView;Lcom/p1/mobile/putong/core/newui/messages/addressbook/ConversationAddressBookGroupFrag$a;Lcom/p1/mobile/putong/core/data/Conversation;Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;)V

    .line 131
    .line 132
    .line 133
    invoke-static {p0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 134
    .line 135
    .line 136
    :cond_3
    :goto_1
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/newui/messages/addressbook/ConversationAddressBookGroupView;->d(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

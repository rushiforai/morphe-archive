.class public Lcom/p1/mobile/putong/core/ui/messages/group/GroupSetMemberItemView;
.super Landroid/widget/LinearLayout;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/core/ui/messages/group/GroupSetMemberItemView$a;
    }
.end annotation


# instance fields
.field public a:Lv/VFrame_Squared;

.field public b:Lv/VDraweeView;

.field public c:Lv/VText;

.field public d:Lv/VText;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, p1, v0}, Lcom/p1/mobile/putong/core/ui/messages/group/GroupSetMemberItemView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    const/4 v0, 0x0

    .line 6
    invoke-direct {p0, p1, p2, v0}, Lcom/p1/mobile/putong/core/ui/messages/group/GroupSetMemberItemView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 7
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static bridge synthetic a(Lcom/p1/mobile/putong/core/ui/messages/group/GroupSetMemberItemView;Lv/VFrame_Squared;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/group/GroupSetMemberItemView;->a:Lv/VFrame_Squared;

    return-void
.end method

.method public static bridge synthetic b(Lcom/p1/mobile/putong/core/ui/messages/group/GroupSetMemberItemView;Lv/VText;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/group/GroupSetMemberItemView;->c:Lv/VText;

    return-void
.end method

.method public static bridge synthetic c(Lcom/p1/mobile/putong/core/ui/messages/group/GroupSetMemberItemView;Lv/VDraweeView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/group/GroupSetMemberItemView;->b:Lv/VDraweeView;

    return-void
.end method

.method public static bridge synthetic d(Lcom/p1/mobile/putong/core/ui/messages/group/GroupSetMemberItemView;Lv/VText;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/group/GroupSetMemberItemView;->d:Lv/VText;

    return-void
.end method


# virtual methods
.method public final e(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/group/GroupSetMemberItemView$a;->a(Lcom/p1/mobile/putong/core/ui/messages/group/GroupSetMemberItemView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public f(Lcom/p1/mobile/putong/core/data/ChatGroup;Lcom/p1/mobile/putong/core/data/ChatGroupMember;ZZ)V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    if-nez p4, :cond_9

    .line 3
    .line 4
    if-nez p2, :cond_0

    .line 5
    .line 6
    goto/16 :goto_3

    .line 7
    .line 8
    :cond_0
    iget-object p4, p0, Lcom/p1/mobile/putong/core/ui/messages/group/GroupSetMemberItemView;->c:Lv/VText;

    .line 9
    .line 10
    const/4 v1, 0x1

    .line 11
    invoke-static {p4, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 12
    .line 13
    .line 14
    iget-object p4, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->ownerUserId:Ljava/lang/String;

    .line 15
    .line 16
    iget-object v1, p2, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->userId:Ljava/lang/String;

    .line 17
    .line 18
    invoke-static {p4, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 19
    .line 20
    .line 21
    move-result p4

    .line 22
    if-eqz p4, :cond_1

    .line 23
    .line 24
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/group/GroupSetMemberItemView;->c:Lv/VText;

    .line 25
    .line 26
    sget p4, Lcom/p1/mobile/putong/core/message/R$string;->P:I

    .line 27
    .line 28
    invoke-virtual {p1, p4}, Landroid/widget/TextView;->setText(I)V

    .line 29
    .line 30
    .line 31
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/group/GroupSetMemberItemView;->c:Lv/VText;

    .line 32
    .line 33
    sget p4, Ll/ibc0;->z0:I

    .line 34
    .line 35
    invoke-virtual {p1, p4}, Landroidx/appcompat/widget/AppCompatTextView;->setBackgroundResource(I)V

    .line 36
    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_1
    iget-object p4, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->adminUserIds:Ljava/util/List;

    .line 40
    .line 41
    invoke-static {p4}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 42
    .line 43
    .line 44
    move-result p4

    .line 45
    if-nez p4, :cond_2

    .line 46
    .line 47
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->adminUserIds:Ljava/util/List;

    .line 48
    .line 49
    iget-object p4, p2, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->userId:Ljava/lang/String;

    .line 50
    .line 51
    invoke-interface {p1, p4}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 52
    .line 53
    .line 54
    move-result p1

    .line 55
    if-eqz p1, :cond_2

    .line 56
    .line 57
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/group/GroupSetMemberItemView;->c:Lv/VText;

    .line 58
    .line 59
    sget p4, Lcom/p1/mobile/putong/core/message/R$string;->S:I

    .line 60
    .line 61
    invoke-virtual {p1, p4}, Landroid/widget/TextView;->setText(I)V

    .line 62
    .line 63
    .line 64
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/group/GroupSetMemberItemView;->c:Lv/VText;

    .line 65
    .line 66
    sget p4, Ll/ibc0;->y0:I

    .line 67
    .line 68
    invoke-virtual {p1, p4}, Landroidx/appcompat/widget/AppCompatTextView;->setBackgroundResource(I)V

    .line 69
    .line 70
    .line 71
    goto :goto_0

    .line 72
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/group/GroupSetMemberItemView;->c:Lv/VText;

    .line 73
    .line 74
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 75
    .line 76
    .line 77
    :goto_0
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->K()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 78
    .line 79
    .line 80
    move-result-object p1

    .line 81
    iget-object p4, p2, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->userId:Ljava/lang/String;

    .line 82
    .line 83
    invoke-interface {p1, p4}, Ll/qhk0;->getUserById(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 84
    .line 85
    .line 86
    move-result-object p1

    .line 87
    if-eqz p3, :cond_3

    .line 88
    .line 89
    sget-object p3, Ll/uqb0;->G:Ll/fsb0;

    .line 90
    .line 91
    iget-object p4, p0, Lcom/p1/mobile/putong/core/ui/messages/group/GroupSetMemberItemView;->b:Lv/VDraweeView;

    .line 92
    .line 93
    invoke-static {p2}, Ll/jek;->j(Lcom/p1/mobile/putong/core/data/ChatGroupMember;)Ljava/lang/String;

    .line 94
    .line 95
    .line 96
    move-result-object v0

    .line 97
    invoke-virtual {p3, p4, v0}, Ll/fsb0;->Z0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 98
    .line 99
    .line 100
    goto :goto_2

    .line 101
    :cond_3
    iget-object p3, p2, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->avatar:Ljava/lang/String;

    .line 102
    .line 103
    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 104
    .line 105
    .line 106
    move-result p3

    .line 107
    if-nez p3, :cond_7

    .line 108
    .line 109
    iget-object p3, p2, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->userId:Ljava/lang/String;

    .line 110
    .line 111
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 112
    .line 113
    .line 114
    move-result-object p4

    .line 115
    invoke-interface {p4}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 116
    .line 117
    .line 118
    move-result-object p4

    .line 119
    invoke-static {p3, p4}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 120
    .line 121
    .line 122
    move-result p3

    .line 123
    if-eqz p3, :cond_5

    .line 124
    .line 125
    sget-object p3, Ll/uqb0;->G:Ll/fsb0;

    .line 126
    .line 127
    iget-object p4, p0, Lcom/p1/mobile/putong/core/ui/messages/group/GroupSetMemberItemView;->b:Lv/VDraweeView;

    .line 128
    .line 129
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 130
    .line 131
    .line 132
    move-result v1

    .line 133
    if-eqz v1, :cond_4

    .line 134
    .line 135
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 136
    .line 137
    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 138
    .line 139
    .line 140
    move-result-object v0

    .line 141
    check-cast v0, Lcom/p1/mobile/putong/data/Media;

    .line 142
    .line 143
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 144
    .line 145
    goto :goto_1

    .line 146
    :cond_4
    iget-object v0, p2, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->avatar:Ljava/lang/String;

    .line 147
    .line 148
    :goto_1
    invoke-virtual {p3, p4, v0}, Ll/fsb0;->Z0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 149
    .line 150
    .line 151
    goto :goto_2

    .line 152
    :cond_5
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 153
    .line 154
    .line 155
    move-result p3

    .line 156
    if-eqz p3, :cond_6

    .line 157
    .line 158
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isBanedOrInactivated()Z

    .line 159
    .line 160
    .line 161
    move-result p3

    .line 162
    if-eqz p3, :cond_6

    .line 163
    .line 164
    sget-object p3, Ll/uqb0;->G:Ll/fsb0;

    .line 165
    .line 166
    iget-object p4, p0, Lcom/p1/mobile/putong/core/ui/messages/group/GroupSetMemberItemView;->b:Lv/VDraweeView;

    .line 167
    .line 168
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 169
    .line 170
    .line 171
    move-result-object v0

    .line 172
    invoke-virtual {v0}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 173
    .line 174
    .line 175
    move-result-object v0

    .line 176
    invoke-interface {v0}, Ll/r97;->T0()I

    .line 177
    .line 178
    .line 179
    move-result v0

    .line 180
    invoke-virtual {p3, p4, v0}, Ll/fsb0;->Y0(Lcom/facebook/drawee/view/SimpleDraweeView;I)V

    .line 181
    .line 182
    .line 183
    goto :goto_2

    .line 184
    :cond_6
    sget-object p3, Ll/uqb0;->G:Ll/fsb0;

    .line 185
    .line 186
    iget-object p4, p0, Lcom/p1/mobile/putong/core/ui/messages/group/GroupSetMemberItemView;->b:Lv/VDraweeView;

    .line 187
    .line 188
    iget-object v0, p2, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->avatar:Ljava/lang/String;

    .line 189
    .line 190
    invoke-virtual {p3, p4, v0}, Ll/fsb0;->Z0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 191
    .line 192
    .line 193
    :cond_7
    :goto_2
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 194
    .line 195
    .line 196
    move-result p3

    .line 197
    if-eqz p3, :cond_8

    .line 198
    .line 199
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isMe()Z

    .line 200
    .line 201
    .line 202
    move-result p3

    .line 203
    if-nez p3, :cond_8

    .line 204
    .line 205
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isBanedOrInactivated()Z

    .line 206
    .line 207
    .line 208
    move-result p3

    .line 209
    if-eqz p3, :cond_8

    .line 210
    .line 211
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/group/GroupSetMemberItemView;->d:Lv/VText;

    .line 212
    .line 213
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->publicId:Ljava/lang/String;

    .line 214
    .line 215
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 216
    .line 217
    .line 218
    return-void

    .line 219
    :cond_8
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/group/GroupSetMemberItemView;->d:Lv/VText;

    .line 220
    .line 221
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->groupMemberName()Ljava/lang/String;

    .line 222
    .line 223
    .line 224
    move-result-object p1

    .line 225
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 226
    .line 227
    .line 228
    return-void

    .line 229
    :cond_9
    :goto_3
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/group/GroupSetMemberItemView;->c:Lv/VText;

    .line 230
    .line 231
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 232
    .line 233
    .line 234
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/group/GroupSetMemberItemView;->b:Lv/VDraweeView;

    .line 235
    .line 236
    sget p2, Ll/ibc0;->x0:I

    .line 237
    .line 238
    invoke-virtual {p1, p2}, Lcom/facebook/drawee/view/SimpleDraweeView;->setImageResource(I)V

    .line 239
    .line 240
    .line 241
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/group/GroupSetMemberItemView;->d:Lv/VText;

    .line 242
    .line 243
    sget p1, Lcom/p1/mobile/putong/core/message/R$string;->G:I

    .line 244
    .line 245
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(I)V

    .line 246
    .line 247
    .line 248
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/ui/messages/group/GroupSetMemberItemView;->e(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

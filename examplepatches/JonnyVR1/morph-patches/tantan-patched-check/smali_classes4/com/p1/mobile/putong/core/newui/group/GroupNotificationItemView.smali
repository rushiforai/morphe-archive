.class public Lcom/p1/mobile/putong/core/newui/group/GroupNotificationItemView;
.super Landroid/widget/FrameLayout;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/core/newui/group/GroupNotificationItemView$a;
    }
.end annotation


# instance fields
.field public a:Lcom/p1/mobile/putong/core/ui/messages/view/GroupMemberAvatarFrame;

.field public b:Lv/VDraweeView;

.field public c:Lv/VText;

.field public d:Lv/VText;

.field public e:Lv/VText;

.field public f:Lv/VText;

.field public g:Lv/VText;

.field public h:Lv/VButton;

.field public i:Lv/VButton;


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

.method public static synthetic a(Ll/yik;Lcom/p1/mobile/putong/core/data/GroupNotification;Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p2, p1, Lcom/p1/mobile/putong/core/data/GroupNotification;->chatGroupData:Lcom/p1/mobile/putong/core/data/ChatGroup;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/GroupNotification;->userData:Lcom/p1/mobile/putong/data/User;

    .line 4
    .line 5
    invoke-virtual {p0, p2, p1}, Ll/yik;->q0(Lcom/p1/mobile/putong/core/data/ChatGroup;Lcom/p1/mobile/putong/data/User;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic b(Ll/yik;Lcom/p1/mobile/putong/core/data/GroupNotification;Landroid/view/View;)V
    .locals 0

    .line 1
    const-string p2, "approved"

    .line 2
    .line 3
    invoke-static {p2}, Lcom/p1/mobile/putong/core/data/GroupApplyStatus;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/GroupApplyStatus;

    .line 4
    .line 5
    .line 6
    move-result-object p2

    .line 7
    invoke-virtual {p0, p1, p2}, Ll/yik;->A0(Lcom/p1/mobile/putong/core/data/GroupNotification;Lcom/p1/mobile/putong/core/data/GroupApplyStatus;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public static synthetic c(Landroid/view/View;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic d(Ll/yik;Lcom/p1/mobile/putong/core/data/GroupNotification;Landroid/view/View;)V
    .locals 0

    .line 1
    const-string p2, "rejected"

    .line 2
    .line 3
    invoke-static {p2}, Lcom/p1/mobile/putong/core/data/GroupApplyStatus;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/GroupApplyStatus;

    .line 4
    .line 5
    .line 6
    move-result-object p2

    .line 7
    invoke-virtual {p0, p1, p2}, Ll/yik;->A0(Lcom/p1/mobile/putong/core/data/GroupNotification;Lcom/p1/mobile/putong/core/data/GroupApplyStatus;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public static synthetic e(Landroid/view/View;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static bridge synthetic f(Lcom/p1/mobile/putong/core/newui/group/GroupNotificationItemView;Lv/VText;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/group/GroupNotificationItemView;->d:Lv/VText;

    return-void
.end method

.method public static bridge synthetic g(Lcom/p1/mobile/putong/core/newui/group/GroupNotificationItemView;Lv/VButton;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/group/GroupNotificationItemView;->i:Lv/VButton;

    return-void
.end method

.method public static bridge synthetic h(Lcom/p1/mobile/putong/core/newui/group/GroupNotificationItemView;Lv/VText;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/group/GroupNotificationItemView;->e:Lv/VText;

    return-void
.end method

.method public static bridge synthetic i(Lcom/p1/mobile/putong/core/newui/group/GroupNotificationItemView;Lcom/p1/mobile/putong/core/ui/messages/view/GroupMemberAvatarFrame;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/group/GroupNotificationItemView;->a:Lcom/p1/mobile/putong/core/ui/messages/view/GroupMemberAvatarFrame;

    return-void
.end method

.method public static bridge synthetic j(Lcom/p1/mobile/putong/core/newui/group/GroupNotificationItemView;Lv/VDraweeView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/group/GroupNotificationItemView;->b:Lv/VDraweeView;

    return-void
.end method

.method public static bridge synthetic k(Lcom/p1/mobile/putong/core/newui/group/GroupNotificationItemView;Lv/VText;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/group/GroupNotificationItemView;->f:Lv/VText;

    return-void
.end method

.method public static bridge synthetic l(Lcom/p1/mobile/putong/core/newui/group/GroupNotificationItemView;Lv/VText;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/group/GroupNotificationItemView;->g:Lv/VText;

    return-void
.end method

.method public static bridge synthetic m(Lcom/p1/mobile/putong/core/newui/group/GroupNotificationItemView;Lv/VButton;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/group/GroupNotificationItemView;->h:Lv/VButton;

    return-void
.end method

.method public static bridge synthetic n(Lcom/p1/mobile/putong/core/newui/group/GroupNotificationItemView;Lv/VText;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/group/GroupNotificationItemView;->c:Lv/VText;

    return-void
.end method


# virtual methods
.method public final o(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/core/newui/group/GroupNotificationItemView$a;->a(Lcom/p1/mobile/putong/core/newui/group/GroupNotificationItemView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/newui/group/GroupNotificationItemView;->o(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public p(Lcom/p1/mobile/putong/core/data/GroupNotification;Ll/yik;)V
    .locals 8

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/GroupNotification;->userData:Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/group/GroupNotificationItemView;->a:Lcom/p1/mobile/putong/core/ui/messages/view/GroupMemberAvatarFrame;

    .line 7
    .line 8
    new-instance v1, Ll/hik;

    .line 9
    .line 10
    invoke-direct {v1, p2, p1}, Ll/hik;-><init>(Ll/yik;Lcom/p1/mobile/putong/core/data/GroupNotification;)V

    .line 11
    .line 12
    .line 13
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 14
    .line 15
    .line 16
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/GroupNotification;->chatGroupData:Lcom/p1/mobile/putong/core/data/ChatGroup;

    .line 17
    .line 18
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    const/4 v1, 0x0

    .line 23
    if-eqz v0, :cond_1

    .line 24
    .line 25
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/GroupNotification;->userData:Lcom/p1/mobile/putong/data/User;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/GroupNotification;->chatGroupData:Lcom/p1/mobile/putong/core/data/ChatGroup;

    .line 34
    .line 35
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/ChatGroup;->groupType:Lcom/p1/mobile/putong/core/data/ChatGroupType;

    .line 36
    .line 37
    const-string v2, "anonymous"

    .line 38
    .line 39
    invoke-static {v0, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    if-eqz v0, :cond_1

    .line 44
    .line 45
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 46
    .line 47
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/group/GroupNotificationItemView;->b:Lv/VDraweeView;

    .line 48
    .line 49
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/GroupNotification;->userData:Lcom/p1/mobile/putong/data/User;

    .line 50
    .line 51
    invoke-static {v3}, Ll/jek;->k(Lcom/p1/mobile/putong/data/User;)Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object v3

    .line 55
    invoke-virtual {v0, v2, v3}, Ll/fsb0;->Z0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 56
    .line 57
    .line 58
    goto :goto_0

    .line 59
    :cond_1
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/GroupNotification;->userData:Lcom/p1/mobile/putong/data/User;

    .line 60
    .line 61
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 62
    .line 63
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    check-cast v0, Lcom/p1/mobile/putong/data/Media;

    .line 68
    .line 69
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Media;->cover()Lcom/p1/mobile/putong/data/Picture;

    .line 70
    .line 71
    .line 72
    move-result-object v0

    .line 73
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 74
    .line 75
    .line 76
    move-result-object v0

    .line 77
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Picture$ImageUri;->formatted()Ljava/lang/String;

    .line 78
    .line 79
    .line 80
    move-result-object v0

    .line 81
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 82
    .line 83
    .line 84
    move-result v0

    .line 85
    if-nez v0, :cond_2

    .line 86
    .line 87
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 88
    .line 89
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/group/GroupNotificationItemView;->b:Lv/VDraweeView;

    .line 90
    .line 91
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/GroupNotification;->userData:Lcom/p1/mobile/putong/data/User;

    .line 92
    .line 93
    iget-object v3, v3, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 94
    .line 95
    invoke-interface {v3, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 96
    .line 97
    .line 98
    move-result-object v3

    .line 99
    check-cast v3, Lcom/p1/mobile/putong/data/Media;

    .line 100
    .line 101
    invoke-virtual {v3}, Lcom/p1/mobile/putong/data/Media;->cover()Lcom/p1/mobile/putong/data/Picture;

    .line 102
    .line 103
    .line 104
    move-result-object v3

    .line 105
    invoke-virtual {v3}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 106
    .line 107
    .line 108
    move-result-object v3

    .line 109
    invoke-virtual {v3}, Lcom/p1/mobile/putong/data/Picture$ImageUri;->formatted()Ljava/lang/String;

    .line 110
    .line 111
    .line 112
    move-result-object v3

    .line 113
    invoke-virtual {v0, v2, v3}, Ll/fsb0;->Z0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 114
    .line 115
    .line 116
    goto :goto_0

    .line 117
    :cond_2
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 118
    .line 119
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/group/GroupNotificationItemView;->b:Lv/VDraweeView;

    .line 120
    .line 121
    sget v3, Ll/ibc0;->I0:I

    .line 122
    .line 123
    invoke-virtual {v0, v2, v3}, Ll/fsb0;->Y0(Lcom/facebook/drawee/view/SimpleDraweeView;I)V

    .line 124
    .line 125
    .line 126
    :goto_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/group/GroupNotificationItemView;->c:Lv/VText;

    .line 127
    .line 128
    iget-object v2, p1, Lcom/p1/mobile/putong/core/data/GroupNotification;->userData:Lcom/p1/mobile/putong/data/User;

    .line 129
    .line 130
    iget-object v2, v2, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 131
    .line 132
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 133
    .line 134
    .line 135
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/group/GroupNotificationItemView;->c:Lv/VText;

    .line 136
    .line 137
    invoke-virtual {v0}, Landroid/view/View;->requestLayout()V

    .line 138
    .line 139
    .line 140
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 141
    .line 142
    .line 143
    move-result-object v0

    .line 144
    invoke-virtual {v0}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 145
    .line 146
    .line 147
    move-result-object v2

    .line 148
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/group/GroupNotificationItemView;->d:Lv/VText;

    .line 149
    .line 150
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/GroupNotification;->userData:Lcom/p1/mobile/putong/data/User;

    .line 151
    .line 152
    iget-object v4, v0, Lcom/p1/mobile/putong/data/User;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 153
    .line 154
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->age:Ljava/lang/Integer;

    .line 155
    .line 156
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 157
    .line 158
    .line 159
    move-result v5

    .line 160
    const/4 v6, 0x0

    .line 161
    iget-object v7, p1, Lcom/p1/mobile/putong/core/data/GroupNotification;->userData:Lcom/p1/mobile/putong/data/User;

    .line 162
    .line 163
    invoke-interface/range {v2 .. v7}, Ll/r97;->X0(Landroid/widget/TextView;Lcom/p1/mobile/putong/data/Gender;IZLcom/p1/mobile/putong/data/User;)V

    .line 164
    .line 165
    .line 166
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/group/GroupNotificationItemView;->e:Lv/VText;

    .line 167
    .line 168
    sget-object v2, Ll/pzi0;->c:Ljava/text/SimpleDateFormat;

    .line 169
    .line 170
    iget-wide v3, p1, Lcom/p1/mobile/putong/core/data/GroupNotification;->createdTime:D

    .line 171
    .line 172
    invoke-static {v3, v4}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 173
    .line 174
    .line 175
    move-result-object v3

    .line 176
    invoke-virtual {v2, v3}, Ljava/text/Format;->format(Ljava/lang/Object;)Ljava/lang/String;

    .line 177
    .line 178
    .line 179
    move-result-object v2

    .line 180
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 181
    .line 182
    .line 183
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/group/GroupNotificationItemView;->f:Lv/VText;

    .line 184
    .line 185
    iget-object v2, p1, Lcom/p1/mobile/putong/core/data/GroupNotification;->chatGroupData:Lcom/p1/mobile/putong/core/data/ChatGroup;

    .line 186
    .line 187
    iget-object v2, v2, Lcom/p1/mobile/putong/core/data/ChatGroup;->name:Ljava/lang/String;

    .line 188
    .line 189
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 190
    .line 191
    .line 192
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/GroupNotification;->groupApplyData:Lcom/p1/mobile/putong/core/data/GroupApply;

    .line 193
    .line 194
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 195
    .line 196
    .line 197
    move-result v0

    .line 198
    if-eqz v0, :cond_3

    .line 199
    .line 200
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/GroupNotification;->groupApplyData:Lcom/p1/mobile/putong/core/data/GroupApply;

    .line 201
    .line 202
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/GroupApply;->reason:Ljava/lang/String;

    .line 203
    .line 204
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 205
    .line 206
    .line 207
    move-result v0

    .line 208
    if-nez v0, :cond_3

    .line 209
    .line 210
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/group/GroupNotificationItemView;->g:Lv/VText;

    .line 211
    .line 212
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 213
    .line 214
    .line 215
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/group/GroupNotificationItemView;->g:Lv/VText;

    .line 216
    .line 217
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/GroupNotification;->groupApplyData:Lcom/p1/mobile/putong/core/data/GroupApply;

    .line 218
    .line 219
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/GroupApply;->reason:Ljava/lang/String;

    .line 220
    .line 221
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 222
    .line 223
    .line 224
    goto :goto_1

    .line 225
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/group/GroupNotificationItemView;->g:Lv/VText;

    .line 226
    .line 227
    const/16 v1, 0x8

    .line 228
    .line 229
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 230
    .line 231
    .line 232
    :goto_1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/newui/group/GroupNotificationItemView;->q(Lcom/p1/mobile/putong/core/data/GroupNotification;Ll/yik;)V

    .line 233
    .line 234
    .line 235
    return-void
.end method

.method public q(Lcom/p1/mobile/putong/core/data/GroupNotification;Ll/yik;)V
    .locals 5

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/GroupNotification;->groupApplyData:Lcom/p1/mobile/putong/core/data/GroupApply;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    goto :goto_1

    .line 10
    :cond_0
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/GroupNotification;->groupApplyData:Lcom/p1/mobile/putong/core/data/GroupApply;

    .line 11
    .line 12
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/GroupApply;->status:Lcom/p1/mobile/putong/core/data/GroupApplyStatus;

    .line 13
    .line 14
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 19
    .line 20
    .line 21
    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    const/4 v2, 0x1

    .line 26
    const/4 v3, 0x0

    .line 27
    const/4 v4, -0x1

    .line 28
    sparse-switch v1, :sswitch_data_0

    .line 29
    .line 30
    .line 31
    goto :goto_0

    .line 32
    :sswitch_0
    const-string v1, "default"

    .line 33
    .line 34
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 35
    .line 36
    .line 37
    move-result v0

    .line 38
    if-nez v0, :cond_1

    .line 39
    .line 40
    goto :goto_0

    .line 41
    :cond_1
    const/4 v4, 0x2

    .line 42
    goto :goto_0

    .line 43
    :sswitch_1
    const-string v1, "approved"

    .line 44
    .line 45
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    if-nez v0, :cond_2

    .line 50
    .line 51
    goto :goto_0

    .line 52
    :cond_2
    move v4, v2

    .line 53
    goto :goto_0

    .line 54
    :sswitch_2
    const-string v1, "rejected"

    .line 55
    .line 56
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 57
    .line 58
    .line 59
    move-result v0

    .line 60
    if-nez v0, :cond_3

    .line 61
    .line 62
    goto :goto_0

    .line 63
    :cond_3
    move v4, v3

    .line 64
    :goto_0
    const/16 v0, 0x8

    .line 65
    .line 66
    packed-switch v4, :pswitch_data_0

    .line 67
    .line 68
    .line 69
    :goto_1
    return-void

    .line 70
    :pswitch_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/group/GroupNotificationItemView;->i:Lv/VButton;

    .line 71
    .line 72
    invoke-virtual {v0, v3}, Landroid/view/View;->setVisibility(I)V

    .line 73
    .line 74
    .line 75
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/group/GroupNotificationItemView;->i:Lv/VButton;

    .line 76
    .line 77
    invoke-virtual {v0, v3}, Landroid/view/View;->setSelected(Z)V

    .line 78
    .line 79
    .line 80
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/group/GroupNotificationItemView;->i:Lv/VButton;

    .line 81
    .line 82
    sget v1, Lcom/p1/mobile/putong/core/message/R$string;->c0:I

    .line 83
    .line 84
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    .line 85
    .line 86
    .line 87
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/group/GroupNotificationItemView;->i:Lv/VButton;

    .line 88
    .line 89
    new-instance v1, Ll/iik;

    .line 90
    .line 91
    invoke-direct {v1, p2, p1}, Ll/iik;-><init>(Ll/yik;Lcom/p1/mobile/putong/core/data/GroupNotification;)V

    .line 92
    .line 93
    .line 94
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 95
    .line 96
    .line 97
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/group/GroupNotificationItemView;->h:Lv/VButton;

    .line 98
    .line 99
    invoke-virtual {v0, v3}, Landroid/view/View;->setVisibility(I)V

    .line 100
    .line 101
    .line 102
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/group/GroupNotificationItemView;->h:Lv/VButton;

    .line 103
    .line 104
    invoke-virtual {v0, v3}, Landroid/view/View;->setSelected(Z)V

    .line 105
    .line 106
    .line 107
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/group/GroupNotificationItemView;->h:Lv/VButton;

    .line 108
    .line 109
    sget v1, Lcom/p1/mobile/putong/core/message/R$string;->e0:I

    .line 110
    .line 111
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    .line 112
    .line 113
    .line 114
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/group/GroupNotificationItemView;->h:Lv/VButton;

    .line 115
    .line 116
    new-instance v0, Ll/jik;

    .line 117
    .line 118
    invoke-direct {v0, p2, p1}, Ll/jik;-><init>(Ll/yik;Lcom/p1/mobile/putong/core/data/GroupNotification;)V

    .line 119
    .line 120
    .line 121
    invoke-static {p0, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 122
    .line 123
    .line 124
    return-void

    .line 125
    :pswitch_1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/group/GroupNotificationItemView;->i:Lv/VButton;

    .line 126
    .line 127
    invoke-virtual {p1, v3}, Landroid/view/View;->setVisibility(I)V

    .line 128
    .line 129
    .line 130
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/group/GroupNotificationItemView;->i:Lv/VButton;

    .line 131
    .line 132
    invoke-virtual {p1, v2}, Landroid/view/View;->setSelected(Z)V

    .line 133
    .line 134
    .line 135
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/group/GroupNotificationItemView;->i:Lv/VButton;

    .line 136
    .line 137
    sget p2, Lcom/p1/mobile/putong/core/message/R$string;->d0:I

    .line 138
    .line 139
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(I)V

    .line 140
    .line 141
    .line 142
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/group/GroupNotificationItemView;->i:Lv/VButton;

    .line 143
    .line 144
    new-instance p2, Ll/kik;

    .line 145
    .line 146
    invoke-direct {p2}, Ll/kik;-><init>()V

    .line 147
    .line 148
    .line 149
    invoke-static {p1, p2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 150
    .line 151
    .line 152
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/group/GroupNotificationItemView;->h:Lv/VButton;

    .line 153
    .line 154
    invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V

    .line 155
    .line 156
    .line 157
    return-void

    .line 158
    :pswitch_2
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/group/GroupNotificationItemView;->i:Lv/VButton;

    .line 159
    .line 160
    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 161
    .line 162
    .line 163
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/group/GroupNotificationItemView;->h:Lv/VButton;

    .line 164
    .line 165
    invoke-virtual {p1, v3}, Landroid/view/View;->setVisibility(I)V

    .line 166
    .line 167
    .line 168
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/group/GroupNotificationItemView;->h:Lv/VButton;

    .line 169
    .line 170
    invoke-virtual {p1, v2}, Landroid/view/View;->setSelected(Z)V

    .line 171
    .line 172
    .line 173
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/group/GroupNotificationItemView;->h:Lv/VButton;

    .line 174
    .line 175
    sget p2, Lcom/p1/mobile/putong/core/message/R$string;->f0:I

    .line 176
    .line 177
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(I)V

    .line 178
    .line 179
    .line 180
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/group/GroupNotificationItemView;->h:Lv/VButton;

    .line 181
    .line 182
    new-instance p1, Ll/lik;

    .line 183
    .line 184
    invoke-direct {p1}, Ll/lik;-><init>()V

    .line 185
    .line 186
    .line 187
    invoke-static {p0, p1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 188
    .line 189
    .line 190
    return-void

    .line 191
    :sswitch_data_0
    .sparse-switch
        -0x2444eb82 -> :sswitch_2
        0x46a566b7 -> :sswitch_1
        0x5c13d641 -> :sswitch_0
    .end sparse-switch

    .line 192
    .line 193
    .line 194
    .line 195
    .line 196
    .line 197
    .line 198
    .line 199
    .line 200
    .line 201
    .line 202
    .line 203
    .line 204
    .line 205
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

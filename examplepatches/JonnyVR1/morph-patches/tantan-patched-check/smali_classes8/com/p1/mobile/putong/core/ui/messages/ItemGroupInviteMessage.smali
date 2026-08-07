.class public Lcom/p1/mobile/putong/core/ui/messages/ItemGroupInviteMessage;
.super Lv/VRelative;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/putong/core/ui/messages/a;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/core/ui/messages/ItemGroupInviteMessage$a;
    }
.end annotation


# instance fields
.field public d:Lcom/p1/mobile/putong/core/ui/messages/ItemGroupInviteMessage;

.field public e:Lv/VDraweeView;

.field public f:Lv/VText;

.field public g:Lv/VText;

.field public h:Lv/VLinear;

.field public i:Lv/VText;

.field public j:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lv/VRelative;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemGroupInviteMessage;->j:Z

    .line 6
    .line 7
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 8
    invoke-direct {p0, p1, p2}, Lv/VRelative;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 p1, 0x0

    .line 9
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemGroupInviteMessage;->j:Z

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 10
    invoke-direct {p0, p1, p2, p3}, Lv/VRelative;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p1, 0x0

    .line 11
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemGroupInviteMessage;->j:Z

    return-void
.end method

.method public static bridge synthetic B(Lcom/p1/mobile/putong/core/ui/messages/ItemGroupInviteMessage;Lv/VLinear;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemGroupInviteMessage;->h:Lv/VLinear;

    return-void
.end method

.method public static bridge synthetic H(Lcom/p1/mobile/putong/core/ui/messages/ItemGroupInviteMessage;Lv/VDraweeView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemGroupInviteMessage;->e:Lv/VDraweeView;

    return-void
.end method

.method public static bridge synthetic I(Lcom/p1/mobile/putong/core/ui/messages/ItemGroupInviteMessage;Lv/VText;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemGroupInviteMessage;->g:Lv/VText;

    return-void
.end method

.method public static bridge synthetic L(Lcom/p1/mobile/putong/core/ui/messages/ItemGroupInviteMessage;Lv/VText;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemGroupInviteMessage;->f:Lv/VText;

    return-void
.end method

.method private synthetic P(Lcom/p1/mobile/putong/core/data/Message;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/ItemGroupInviteMessage;->O(Lcom/p1/mobile/putong/core/data/Message;)V

    .line 2
    .line 3
    .line 4
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

.method public static synthetic p(Lcom/p1/mobile/putong/core/ui/messages/ItemGroupInviteMessage;Lcom/p1/mobile/putong/core/data/Message;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/messages/ItemGroupInviteMessage;->P(Lcom/p1/mobile/putong/core/data/Message;Landroid/view/View;)V

    return-void
.end method

.method public static bridge synthetic q(Lcom/p1/mobile/putong/core/ui/messages/ItemGroupInviteMessage;Lcom/p1/mobile/putong/core/ui/messages/ItemGroupInviteMessage;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemGroupInviteMessage;->d:Lcom/p1/mobile/putong/core/ui/messages/ItemGroupInviteMessage;

    return-void
.end method

.method public static bridge synthetic z(Lcom/p1/mobile/putong/core/ui/messages/ItemGroupInviteMessage;Lv/VText;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemGroupInviteMessage;->i:Lv/VText;

    return-void
.end method


# virtual methods
.method public A(Lcom/p1/mobile/putong/core/data/Message;)V
    .locals 5

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Message;->additionalData:Lcom/p1/mobile/putong/core/data/MessageAdditionalData;

    .line 2
    .line 3
    if-eqz v0, :cond_5

    .line 4
    .line 5
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->groupInvitation:Lcom/p1/mobile/putong/core/data/GroupInvitation;

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    goto/16 :goto_1

    .line 10
    .line 11
    :cond_0
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/GroupInvitation;->button:Lcom/p1/mobile/putong/core/data/Button;

    .line 12
    .line 13
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/Button;->title:Ljava/lang/String;

    .line 14
    .line 15
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    const/4 v2, 0x0

    .line 20
    if-nez v1, :cond_1

    .line 21
    .line 22
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Message;->owner:Ljava/lang/String;

    .line 23
    .line 24
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 25
    .line 26
    .line 27
    move-result-object v3

    .line 28
    invoke-interface {v3}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object v3

    .line 32
    invoke-static {v1, v3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 33
    .line 34
    .line 35
    move-result v1

    .line 36
    if-nez v1, :cond_1

    .line 37
    .line 38
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemGroupInviteMessage;->h:Lv/VLinear;

    .line 39
    .line 40
    const/4 v3, 0x1

    .line 41
    invoke-static {v1, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 42
    .line 43
    .line 44
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemGroupInviteMessage;->i:Lv/VText;

    .line 45
    .line 46
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 47
    .line 48
    .line 49
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemGroupInviteMessage;->d:Lcom/p1/mobile/putong/core/ui/messages/ItemGroupInviteMessage;

    .line 50
    .line 51
    new-instance v1, Ll/j6q;

    .line 52
    .line 53
    invoke-direct {v1, p0, p1}, Ll/j6q;-><init>(Lcom/p1/mobile/putong/core/ui/messages/ItemGroupInviteMessage;Lcom/p1/mobile/putong/core/data/Message;)V

    .line 54
    .line 55
    .line 56
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 57
    .line 58
    .line 59
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Message;->additionalData:Lcom/p1/mobile/putong/core/data/MessageAdditionalData;

    .line 60
    .line 61
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->groupInvitation:Lcom/p1/mobile/putong/core/data/GroupInvitation;

    .line 62
    .line 63
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/GroupInvitation;->target:Lcom/p1/mobile/putong/core/data/Target;

    .line 64
    .line 65
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/Target;->id:Ljava/lang/String;

    .line 66
    .line 67
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemGroupInviteMessage;->j:Z

    .line 68
    .line 69
    if-nez v1, :cond_2

    .line 70
    .line 71
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 72
    .line 73
    .line 74
    move-result-object v1

    .line 75
    check-cast v1, Lcom/p1/mobile/android/app/Act;

    .line 76
    .line 77
    invoke-virtual {v1}, Lcom/p1/mobile/android/app/Act;->pageId()Ljava/lang/String;

    .line 78
    .line 79
    .line 80
    move-result-object v1

    .line 81
    const-string v4, "groupchat_id"

    .line 82
    .line 83
    invoke-static {v4, v0}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 84
    .line 85
    .line 86
    move-result-object v0

    .line 87
    filled-new-array {v0}, [Ll/sfj0$a;

    .line 88
    .line 89
    .line 90
    move-result-object v0

    .line 91
    const-string v4, "e_group_chat_invite_card"

    .line 92
    .line 93
    invoke-static {v4, v1, v0}, Ll/sfj0;->h(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 94
    .line 95
    .line 96
    iput-boolean v3, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemGroupInviteMessage;->j:Z

    .line 97
    .line 98
    goto :goto_0

    .line 99
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemGroupInviteMessage;->h:Lv/VLinear;

    .line 100
    .line 101
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 102
    .line 103
    .line 104
    :cond_2
    :goto_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemGroupInviteMessage;->f:Lv/VText;

    .line 105
    .line 106
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Message;->additionalData:Lcom/p1/mobile/putong/core/data/MessageAdditionalData;

    .line 107
    .line 108
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->groupInvitation:Lcom/p1/mobile/putong/core/data/GroupInvitation;

    .line 109
    .line 110
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/GroupInvitation;->title:Ljava/lang/String;

    .line 111
    .line 112
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 113
    .line 114
    .line 115
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemGroupInviteMessage;->g:Lv/VText;

    .line 116
    .line 117
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Message;->additionalData:Lcom/p1/mobile/putong/core/data/MessageAdditionalData;

    .line 118
    .line 119
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->groupInvitation:Lcom/p1/mobile/putong/core/data/GroupInvitation;

    .line 120
    .line 121
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/GroupInvitation;->subTitle:Ljava/lang/String;

    .line 122
    .line 123
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 124
    .line 125
    .line 126
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Message;->media:Ljava/util/List;

    .line 127
    .line 128
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 129
    .line 130
    .line 131
    move-result v0

    .line 132
    if-nez v0, :cond_4

    .line 133
    .line 134
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/Message;->media:Ljava/util/List;

    .line 135
    .line 136
    invoke-interface {p1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 137
    .line 138
    .line 139
    move-result-object p1

    .line 140
    check-cast p1, Lcom/p1/mobile/putong/data/Media;

    .line 141
    .line 142
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/Media;->cover()Lcom/p1/mobile/putong/data/Picture;

    .line 143
    .line 144
    .line 145
    move-result-object p1

    .line 146
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 147
    .line 148
    .line 149
    move-result v0

    .line 150
    if-eqz v0, :cond_3

    .line 151
    .line 152
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 153
    .line 154
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemGroupInviteMessage;->e:Lv/VDraweeView;

    .line 155
    .line 156
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 157
    .line 158
    .line 159
    move-result-object p1

    .line 160
    invoke-virtual {v0, p0, p1}, Ll/fsb0;->Q0(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;)V

    .line 161
    .line 162
    .line 163
    return-void

    .line 164
    :cond_3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemGroupInviteMessage;->e:Lv/VDraweeView;

    .line 165
    .line 166
    sget p1, Ll/ibc0;->b:I

    .line 167
    .line 168
    invoke-virtual {p0, p1}, Lcom/facebook/drawee/view/SimpleDraweeView;->setImageResource(I)V

    .line 169
    .line 170
    .line 171
    return-void

    .line 172
    :cond_4
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemGroupInviteMessage;->e:Lv/VDraweeView;

    .line 173
    .line 174
    sget p1, Ll/ibc0;->b:I

    .line 175
    .line 176
    invoke-virtual {p0, p1}, Lcom/facebook/drawee/view/SimpleDraweeView;->setImageResource(I)V

    .line 177
    .line 178
    .line 179
    :cond_5
    :goto_1
    return-void
.end method

.method public J()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ll/ovb0<",
            "Ljava/lang/String;",
            "Ljava/lang/Runnable;",
            "Ljava/lang/Integer;",
            "Ljava/lang/Void;",
            ">;>;"
        }
    .end annotation

    .line 1
    const/4 p0, 0x0

    return-object p0
.end method

.method public final M(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/ItemGroupInviteMessage$a;->a(Lcom/p1/mobile/putong/core/ui/messages/ItemGroupInviteMessage;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final O(Lcom/p1/mobile/putong/core/data/Message;)V
    .locals 3

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Message;->additionalData:Lcom/p1/mobile/putong/core/data/MessageAdditionalData;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->groupInvitation:Lcom/p1/mobile/putong/core/data/GroupInvitation;

    .line 7
    .line 8
    if-nez v0, :cond_1

    .line 9
    .line 10
    goto :goto_0

    .line 11
    :cond_1
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/GroupInvitation;->target:Lcom/p1/mobile/putong/core/data/Target;

    .line 12
    .line 13
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/Target;->type:Ljava/lang/String;

    .line 14
    .line 15
    const-string v1, "chatGroups"

    .line 16
    .line 17
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-nez v0, :cond_2

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_2
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/Message;->additionalData:Lcom/p1/mobile/putong/core/data/MessageAdditionalData;

    .line 25
    .line 26
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->groupInvitation:Lcom/p1/mobile/putong/core/data/GroupInvitation;

    .line 27
    .line 28
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/GroupInvitation;->target:Lcom/p1/mobile/putong/core/data/Target;

    .line 29
    .line 30
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/Target;->id:Ljava/lang/String;

    .line 31
    .line 32
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    check-cast v0, Lcom/p1/mobile/android/app/Act;

    .line 37
    .line 38
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->pageId()Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    const-string v1, "groupchat_id"

    .line 43
    .line 44
    invoke-static {v1, p1}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 45
    .line 46
    .line 47
    move-result-object v1

    .line 48
    filled-new-array {v1}, [Ll/sfj0$a;

    .line 49
    .line 50
    .line 51
    move-result-object v1

    .line 52
    const-string v2, "e_group_chat_invite_card"

    .line 53
    .line 54
    invoke-static {v2, v0, v1}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 55
    .line 56
    .line 57
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 58
    .line 59
    .line 60
    move-result v0

    .line 61
    if-eqz v0, :cond_3

    .line 62
    .line 63
    :goto_0
    return-void

    .line 64
    :cond_3
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->K()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    invoke-interface {v0}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->me_()Lcom/p1/mobile/putong/data/User;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isBanned()Z

    .line 73
    .line 74
    .line 75
    move-result v0

    .line 76
    if-eqz v0, :cond_4

    .line 77
    .line 78
    sget p0, Lcom/p1/mobile/putong/core/message/R$string;->H0:I

    .line 79
    .line 80
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 81
    .line 82
    .line 83
    return-void

    .line 84
    :cond_4
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemGroupInviteMessage;->act()Lcom/p1/mobile/android/app/Act;

    .line 85
    .line 86
    .line 87
    move-result-object p0

    .line 88
    const-string v0, ""

    .line 89
    .line 90
    const-string v1, "invitation"

    .line 91
    .line 92
    invoke-static {p0, p1, v0, v1}, Ll/jek;->t(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 93
    .line 94
    .line 95
    return-void
.end method

.method public m(IZLcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;)V
    .locals 0

    .line 1
    return-void
.end method

.method public onFinishInflate()V
    .locals 3

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemGroupInviteMessage;->M(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemGroupInviteMessage;->f:Lv/VText;

    .line 8
    .line 9
    invoke-virtual {v0}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    const/4 v1, 0x1

    .line 14
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setFakeBoldText(Z)V

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemGroupInviteMessage;->i:Lv/VText;

    .line 18
    .line 19
    invoke-virtual {v0}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setFakeBoldText(Z)V

    .line 24
    .line 25
    .line 26
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    invoke-virtual {v0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->I4()Z

    .line 35
    .line 36
    .line 37
    move-result v0

    .line 38
    if-eqz v0, :cond_0

    .line 39
    .line 40
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemGroupInviteMessage;->f:Lv/VText;

    .line 41
    .line 42
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    sget v2, Ll/g9c0;->g:I

    .line 47
    .line 48
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    .line 49
    .line 50
    .line 51
    move-result v1

    .line 52
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 53
    .line 54
    .line 55
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemGroupInviteMessage;->g:Lv/VText;

    .line 56
    .line 57
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 58
    .line 59
    .line 60
    move-result-object v1

    .line 61
    sget v2, Ll/g9c0;->i:I

    .line 62
    .line 63
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    .line 64
    .line 65
    .line 66
    move-result v1

    .line 67
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 68
    .line 69
    .line 70
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemGroupInviteMessage;->i:Lv/VText;

    .line 71
    .line 72
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 73
    .line 74
    .line 75
    move-result-object p0

    .line 76
    sget v1, Ll/g9c0;->j:I

    .line 77
    .line 78
    invoke-virtual {p0, v1}, Landroid/content/res/Resources;->getColor(I)I

    .line 79
    .line 80
    .line 81
    move-result p0

    .line 82
    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 83
    .line 84
    .line 85
    :cond_0
    return-void
.end method

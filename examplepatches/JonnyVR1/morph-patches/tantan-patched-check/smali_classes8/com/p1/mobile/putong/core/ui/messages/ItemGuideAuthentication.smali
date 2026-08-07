.class public Lcom/p1/mobile/putong/core/ui/messages/ItemGuideAuthentication;
.super Landroid/widget/FrameLayout;
.source "SourceFile"


# instance fields
.field public a:Lcom/p1/mobile/putong/core/ui/messages/ItemGuideAuthentication;

.field public b:Lv/VLinear;

.field public c:Lv/VImage;

.field public d:Lv/VText;

.field public e:Lv/VText;

.field public f:Landroid/widget/FrameLayout;

.field public g:Lv/VText;

.field public h:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemGuideAuthentication;->h:Z

    .line 6
    .line 7
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 8
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 p1, 0x0

    .line 9
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemGuideAuthentication;->h:Z

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 10
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p1, 0x0

    .line 11
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemGuideAuthentication;->h:Z

    return-void
.end method

.method public static d(Ll/n100;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/User;Ljava/lang/String;)V
    .locals 3

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "ITEM_GUIDE_AUTHENTICATION"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v2, p2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 9
    .line 10
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    iget-object v2, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 14
    .line 15
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-virtual {p0, v0}, Ll/n100;->a(Ljava/lang/String;)Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-eqz v0, :cond_0

    .line 30
    .line 31
    return-void

    .line 32
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    .line 33
    .line 34
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    iget-object v1, p2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 38
    .line 39
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 40
    .line 41
    .line 42
    iget-object v1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 43
    .line 44
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 45
    .line 46
    .line 47
    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 48
    .line 49
    .line 50
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    invoke-virtual {p0, v0}, Ll/n100;->b(Ljava/lang/String;)V

    .line 55
    .line 56
    .line 57
    const-string p0, "userid"

    .line 58
    .line 59
    iget-object p2, p2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 60
    .line 61
    invoke-static {p0, p2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 62
    .line 63
    .line 64
    move-result-object p0

    .line 65
    const-string p2, "moments_user_id"

    .line 66
    .line 67
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 68
    .line 69
    invoke-static {p2, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 70
    .line 71
    .line 72
    move-result-object p1

    .line 73
    const-string p2, "invite_to_verify_button_status"

    .line 74
    .line 75
    invoke-static {p2, p3}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 76
    .line 77
    .line 78
    move-result-object p2

    .line 79
    filled-new-array {p0, p1, p2}, [Ll/pf60;

    .line 80
    .line 81
    .line 82
    move-result-object p0

    .line 83
    const-string p1, "e_ask_to_invite_other_verify"

    .line 84
    .line 85
    const-string p2, "p_chat_view"

    .line 86
    .line 87
    invoke-static {p1, p2, p0}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 88
    .line 89
    .line 90
    return-void
.end method


# virtual methods
.method public final a(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/k6q;->a(Lcom/p1/mobile/putong/core/ui/messages/ItemGuideAuthentication;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public b()Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;
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

.method public c(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/data/Message;Ll/g900;Ll/n100;)V
    .locals 6

    .line 1
    if-eqz p1, :cond_3

    .line 2
    .line 3
    if-nez p4, :cond_0

    .line 4
    .line 5
    goto/16 :goto_2

    .line 6
    .line 7
    :cond_0
    iget-object p2, p2, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 8
    .line 9
    const-string v0, "local_invitation_for_authentication"

    .line 10
    .line 11
    invoke-static {p2, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 12
    .line 13
    .line 14
    move-result p2

    .line 15
    if-eqz p2, :cond_3

    .line 16
    .line 17
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 18
    .line 19
    iget-object p2, p2, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 20
    .line 21
    invoke-virtual {p2}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 22
    .line 23
    .line 24
    move-result-object v3

    .line 25
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemGuideAuthentication;->d:Lv/VText;

    .line 26
    .line 27
    const-string v0, "\u8ba9\u76f8\u5904\u66f4\u5b89\u5fc3"

    .line 28
    .line 29
    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 30
    .line 31
    .line 32
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemGuideAuthentication;->e:Lv/VText;

    .line 33
    .line 34
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->getPronoun()Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    const-string v1, "\u5bf9\u65b9\u6682\u672a\u5b8c\u6210\u8ba4\u8bc1\uff0c\u53ef\u4ee5\u9080\u8bf7%s\u5b8c\u6210\u771f\u4eba\u8ba4\u8bc1\uff0c\u8ba9\u804a\u5929\u66f4\u5b89\u5fc3"

    .line 43
    .line 44
    invoke-static {v1, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 49
    .line 50
    .line 51
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isPicVerificationVerified()Z

    .line 52
    .line 53
    .line 54
    move-result p2

    .line 55
    const-string v0, "#33000000"

    .line 56
    .line 57
    if-eqz p2, :cond_1

    .line 58
    .line 59
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemGuideAuthentication;->g:Lv/VText;

    .line 60
    .line 61
    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 62
    .line 63
    .line 64
    move-result p3

    .line 65
    invoke-virtual {p2, p3}, Landroid/widget/TextView;->setTextColor(I)V

    .line 66
    .line 67
    .line 68
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemGuideAuthentication;->g:Lv/VText;

    .line 69
    .line 70
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->getPronoun()Ljava/lang/String;

    .line 71
    .line 72
    .line 73
    move-result-object p2

    .line 74
    filled-new-array {p2}, [Ljava/lang/Object;

    .line 75
    .line 76
    .line 77
    move-result-object p2

    .line 78
    const-string p3, "%s\u5df2\u5b8c\u6210\u8ba4\u8bc1"

    .line 79
    .line 80
    invoke-static {p3, p2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 81
    .line 82
    .line 83
    move-result-object p2

    .line 84
    invoke-virtual {p0, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 85
    .line 86
    .line 87
    const-string p0, "done_verification"

    .line 88
    .line 89
    :goto_0
    move-object v2, p1

    .line 90
    goto :goto_1

    .line 91
    :cond_1
    sget-object p2, Lcom/p1/mobile/putong/core/newui/messages/util/ConversationCounterTypeSp;->InviationForAuthenticationTime:Lcom/p1/mobile/putong/core/newui/messages/util/ConversationCounterTypeSp;

    .line 92
    .line 93
    iget-object v1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 94
    .line 95
    invoke-virtual {p2, v1}, Lcom/p1/mobile/putong/core/newui/messages/util/ConversationCounterTypeSp;->getLong(Ljava/lang/String;)J

    .line 96
    .line 97
    .line 98
    move-result-wide v1

    .line 99
    const-wide/16 v4, 0x0

    .line 100
    .line 101
    cmp-long p2, v1, v4

    .line 102
    .line 103
    if-lez p2, :cond_2

    .line 104
    .line 105
    invoke-static {}, Ll/pzi0;->o()J

    .line 106
    .line 107
    .line 108
    move-result-wide v4

    .line 109
    sub-long/2addr v4, v1

    .line 110
    const-wide/32 v1, 0xf731400

    .line 111
    .line 112
    .line 113
    cmp-long p2, v4, v1

    .line 114
    .line 115
    if-gez p2, :cond_2

    .line 116
    .line 117
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemGuideAuthentication;->g:Lv/VText;

    .line 118
    .line 119
    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 120
    .line 121
    .line 122
    move-result p3

    .line 123
    invoke-virtual {p2, p3}, Landroid/widget/TextView;->setTextColor(I)V

    .line 124
    .line 125
    .line 126
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemGuideAuthentication;->g:Lv/VText;

    .line 127
    .line 128
    const-string p2, "\u9080\u8bf7\u5df2\u53d1\u9001"

    .line 129
    .line 130
    invoke-virtual {p0, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 131
    .line 132
    .line 133
    const-string p0, "sent_invitation"

    .line 134
    .line 135
    goto :goto_0

    .line 136
    :cond_2
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemGuideAuthentication;->g:Lv/VText;

    .line 137
    .line 138
    const-string v0, "#FE7E1D"

    .line 139
    .line 140
    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 141
    .line 142
    .line 143
    move-result v0

    .line 144
    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 145
    .line 146
    .line 147
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemGuideAuthentication;->g:Lv/VText;

    .line 148
    .line 149
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->getPronoun()Ljava/lang/String;

    .line 150
    .line 151
    .line 152
    move-result-object v0

    .line 153
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 154
    .line 155
    .line 156
    move-result-object v0

    .line 157
    const-string v1, "\u9080\u8bf7%s\u53bb\u8ba4\u8bc1"

    .line 158
    .line 159
    invoke-static {v1, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 160
    .line 161
    .line 162
    move-result-object v0

    .line 163
    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 164
    .line 165
    .line 166
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemGuideAuthentication;->g:Lv/VText;

    .line 167
    .line 168
    new-instance v0, Lcom/p1/mobile/putong/core/ui/messages/ItemGuideAuthentication$a;

    .line 169
    .line 170
    const-string v4, "able_to_invite"

    .line 171
    .line 172
    move-object v1, p0

    .line 173
    move-object v2, p1

    .line 174
    move-object v5, p3

    .line 175
    invoke-direct/range {v0 .. v5}, Lcom/p1/mobile/putong/core/ui/messages/ItemGuideAuthentication$a;-><init>(Lcom/p1/mobile/putong/core/ui/messages/ItemGuideAuthentication;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/User;Ljava/lang/String;Ll/g900;)V

    .line 176
    .line 177
    .line 178
    invoke-static {p2, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 179
    .line 180
    .line 181
    move-object p0, v4

    .line 182
    :goto_1
    invoke-static {p4, v2, v3, p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemGuideAuthentication;->d(Ll/n100;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/User;Ljava/lang/String;)V

    .line 183
    .line 184
    .line 185
    :cond_3
    :goto_2
    return-void
.end method

.method public onFinishInflate()V
    .locals 3

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemGuideAuthentication;->a(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->I4()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemGuideAuthentication;->c:Lv/VImage;

    .line 22
    .line 23
    sget v1, Ll/ibc0;->p2:I

    .line 24
    .line 25
    invoke-static {v0, v1}, Ll/bnl0;->N(Landroid/widget/ImageView;I)V

    .line 26
    .line 27
    .line 28
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemGuideAuthentication;->d:Lv/VText;

    .line 29
    .line 30
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    sget v2, Ll/g9c0;->g:I

    .line 35
    .line 36
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    .line 37
    .line 38
    .line 39
    move-result v1

    .line 40
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 41
    .line 42
    .line 43
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemGuideAuthentication;->e:Lv/VText;

    .line 44
    .line 45
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 46
    .line 47
    .line 48
    move-result-object v1

    .line 49
    sget v2, Ll/g9c0;->i:I

    .line 50
    .line 51
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    .line 52
    .line 53
    .line 54
    move-result v1

    .line 55
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 56
    .line 57
    .line 58
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemGuideAuthentication;->g:Lv/VText;

    .line 59
    .line 60
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    sget v1, Ll/g9c0;->j:I

    .line 65
    .line 66
    invoke-virtual {p0, v1}, Landroid/content/res/Resources;->getColor(I)I

    .line 67
    .line 68
    .line 69
    move-result p0

    .line 70
    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 71
    .line 72
    .line 73
    :cond_0
    return-void
.end method

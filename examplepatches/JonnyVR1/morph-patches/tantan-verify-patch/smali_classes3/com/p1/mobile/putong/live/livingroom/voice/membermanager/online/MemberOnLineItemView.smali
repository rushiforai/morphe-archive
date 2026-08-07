.class public Lcom/p1/mobile/putong/live/livingroom/voice/membermanager/online/MemberOnLineItemView;
.super Landroidx/constraintlayout/widget/ConstraintLayout;
.source "SourceFile"


# instance fields
.field public d:Lcom/p1/mobile/putong/live/livingroom/voice/membermanager/online/MemberOnLineItemView;

.field public e:Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonAnimMaskAvatarView;

.field public f:Lcom/p1/mobile/putong/live/livingroom/royal/LiveGradientTextView;

.field public g:Landroid/view/View;

.field public h:Lv/VText;

.field public i:Lv/VDraweeView;

.field public j:Lv/VDraweeView;

.field public k:Lv/VText;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 5
    invoke-direct {p0, p1, p2}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 6
    invoke-direct {p0, p1, p2, p3}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static synthetic h0(Ll/nsv;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;Ll/y20;Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p3, p0, Ll/nsv;->a:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast p3, Lcom/p1/mobile/putong/live/base/data/BLiveMember;

    .line 4
    .line 5
    iget-object p3, p3, Lcom/p1/mobile/putong/live/base/data/BLiveMember;->inviteStatus:Ljava/lang/String;

    .line 6
    .line 7
    const-string v0, "invited"

    .line 8
    .line 9
    invoke-virtual {v0, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result p3

    .line 13
    if-eqz p3, :cond_0

    .line 14
    .line 15
    invoke-static {p1}, Ll/guk0;->h(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)Z

    .line 16
    .line 17
    .line 18
    move-result p1

    .line 19
    if-nez p1, :cond_0

    .line 20
    .line 21
    return-void

    .line 22
    :cond_0
    invoke-interface {p2, p0}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public static synthetic i0(Ll/y20;Lcom/p1/mobile/putong/data/User;Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final j0(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/jky;->a(Lcom/p1/mobile/putong/live/livingroom/voice/membermanager/online/MemberOnLineItemView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public k0(Ljava/lang/String;)V
    .locals 3

    .line 1
    invoke-static {p1}, Ll/i9o0;->n(Ljava/lang/String;)Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/membermanager/online/MemberOnLineItemView;->h:Lv/VText;

    .line 10
    .line 11
    if-nez v1, :cond_0

    .line 12
    .line 13
    const/4 v1, 0x1

    .line 14
    invoke-static {v2, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 15
    .line 16
    .line 17
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/membermanager/online/MemberOnLineItemView;->h:Lv/VText;

    .line 18
    .line 19
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 20
    .line 21
    .line 22
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/membermanager/online/MemberOnLineItemView;->h:Lv/VText;

    .line 23
    .line 24
    invoke-static {p1}, Ll/i9o0;->m(Ljava/lang/String;)I

    .line 25
    .line 26
    .line 27
    move-result p1

    .line 28
    invoke-virtual {p0, p1}, Landroidx/appcompat/widget/AppCompatTextView;->setBackgroundResource(I)V

    .line 29
    .line 30
    .line 31
    return-void

    .line 32
    :cond_0
    const/4 p0, 0x0

    .line 33
    invoke-static {v2, p0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public l0(Ljava/lang/Boolean;Ljava/lang/String;Ll/y20;Ll/y20;Ll/nsv;Ljava/lang/String;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Boolean;",
            "Ljava/lang/String;",
            "Ll/y20<",
            "Ljava/lang/String;",
            ">;",
            "Ll/y20<",
            "Ll/nsv<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveMember;",
            ">;>;",
            "Ll/nsv<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveMember;",
            ">;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-virtual {p5}, Ll/nsv;->h()Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p5}, Ll/nsv;->i()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    goto :goto_1

    .line 12
    :cond_0
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/membermanager/online/MemberOnLineItemView;->f:Lcom/p1/mobile/putong/live/livingroom/royal/LiveGradientTextView;

    .line 13
    .line 14
    iget-object v3, v0, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 15
    .line 16
    const-string v4, "#ccffffff"

    .line 17
    .line 18
    invoke-static {v4}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 19
    .line 20
    .line 21
    move-result v4

    .line 22
    iget-object v5, p5, Ll/nsv;->a:Ljava/lang/Object;

    .line 23
    .line 24
    check-cast v5, Lcom/p1/mobile/putong/live/base/data/BLiveMember;

    .line 25
    .line 26
    iget-object v5, v5, Lcom/p1/mobile/putong/live/base/data/BLiveMember;->userNameGradientColors:Ljava/util/List;

    .line 27
    .line 28
    invoke-static {v2, v3, v4, v5}, Ll/und0;->b(Landroid/widget/TextView;Ljava/lang/CharSequence;ILjava/util/List;)V

    .line 29
    .line 30
    .line 31
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/membermanager/online/MemberOnLineItemView;->g:Landroid/view/View;

    .line 32
    .line 33
    iget-object v3, v0, Lcom/p1/mobile/putong/data/User;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 34
    .line 35
    invoke-virtual {v3}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object v3

    .line 39
    const-string v4, "male"

    .line 40
    .line 41
    invoke-static {v3, v4}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 42
    .line 43
    .line 44
    move-result v3

    .line 45
    if-eqz v3, :cond_1

    .line 46
    .line 47
    sget v3, Ll/obc0;->G8:I

    .line 48
    .line 49
    goto :goto_0

    .line 50
    :cond_1
    sget v3, Ll/obc0;->E8:I

    .line 51
    .line 52
    :goto_0
    invoke-static {v3}, Ll/n3d0;->b(I)Landroid/graphics/drawable/Drawable;

    .line 53
    .line 54
    .line 55
    move-result-object v3

    .line 56
    invoke-virtual {v2, v3}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 57
    .line 58
    .line 59
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/membermanager/online/MemberOnLineItemView;->e:Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonAnimMaskAvatarView;

    .line 60
    .line 61
    new-instance v3, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonAnimMaskAvatarView$a;

    .line 62
    .line 63
    invoke-direct {v3}, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonAnimMaskAvatarView$a;-><init>()V

    .line 64
    .line 65
    .line 66
    sget v4, Ll/qa00;->y:I

    .line 67
    .line 68
    invoke-virtual {v3, v4}, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonAnimMaskAvatarView$a;->e(I)Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonAnimMaskAvatarView$a;

    .line 69
    .line 70
    .line 71
    move-result-object v3

    .line 72
    invoke-static {p5}, Ll/l6o0;->c(Ll/nsv;)Ll/l6o0;

    .line 73
    .line 74
    .line 75
    move-result-object v4

    .line 76
    iget-object v4, v4, Ll/l6o0;->b:Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 77
    .line 78
    invoke-virtual {v3, v4}, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonAnimMaskAvatarView$a;->f(Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;)Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonAnimMaskAvatarView$a;

    .line 79
    .line 80
    .line 81
    move-result-object v3

    .line 82
    invoke-virtual {v3}, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonAnimMaskAvatarView$a;->a()Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonAnimMaskAvatarView$b;

    .line 83
    .line 84
    .line 85
    move-result-object v3

    .line 86
    invoke-virtual {v2, v3}, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonAnimMaskAvatarView;->setMaskAvatarData(Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonAnimMaskAvatarView$b;)V

    .line 87
    .line 88
    .line 89
    iget-object v2, p5, Ll/nsv;->a:Ljava/lang/Object;

    .line 90
    .line 91
    if-nez v2, :cond_2

    .line 92
    .line 93
    :goto_1
    return-void

    .line 94
    :cond_2
    check-cast v2, Lcom/p1/mobile/putong/live/base/data/BLiveMember;

    .line 95
    .line 96
    iget-object v2, v2, Lcom/p1/mobile/putong/live/base/data/BLiveMember;->identity:Ljava/lang/String;

    .line 97
    .line 98
    invoke-virtual {p0, v2}, Lcom/p1/mobile/putong/live/livingroom/voice/membermanager/online/MemberOnLineItemView;->k0(Ljava/lang/String;)V

    .line 99
    .line 100
    .line 101
    invoke-virtual {p0, p1, p2, p5, v1}, Lcom/p1/mobile/putong/live/livingroom/voice/membermanager/online/MemberOnLineItemView;->m0(Ljava/lang/Boolean;Ljava/lang/String;Ll/nsv;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V

    .line 102
    .line 103
    .line 104
    new-instance p1, Ll/hky;

    .line 105
    .line 106
    invoke-direct {p1, p3, v0}, Ll/hky;-><init>(Ll/y20;Lcom/p1/mobile/putong/data/User;)V

    .line 107
    .line 108
    .line 109
    invoke-static {p0, p1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 110
    .line 111
    .line 112
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/membermanager/online/MemberOnLineItemView;->k:Lv/VText;

    .line 113
    .line 114
    new-instance p2, Ll/iky;

    .line 115
    .line 116
    invoke-direct {p2, p5, v1, p4}, Ll/iky;-><init>(Ll/nsv;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;Ll/y20;)V

    .line 117
    .line 118
    .line 119
    invoke-static {p1, p2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 120
    .line 121
    .line 122
    iget-object p1, v0, Lcom/p1/mobile/putong/data/User;->hierarchy:Lcom/p1/mobile/putong/data/LiveUserLevel;

    .line 123
    .line 124
    const/4 p2, 0x1

    .line 125
    const/4 p3, 0x0

    .line 126
    if-eqz p1, :cond_4

    .line 127
    .line 128
    iget-wide p4, p1, Lcom/p1/mobile/putong/data/LiveUserLevel;->grade:J

    .line 129
    .line 130
    const-wide/16 v1, 0x0

    .line 131
    .line 132
    cmp-long p1, p4, v1

    .line 133
    .line 134
    if-lez p1, :cond_4

    .line 135
    .line 136
    sget-object p1, Ll/htd0;->c:Ll/htd0;

    .line 137
    .line 138
    invoke-static {p1}, Ll/zrv;->l(Ll/htd0;)Ljava/lang/Object;

    .line 139
    .line 140
    .line 141
    move-result-object p1

    .line 142
    check-cast p1, Ll/hiv;

    .line 143
    .line 144
    iget-object p4, v0, Lcom/p1/mobile/putong/data/User;->hierarchy:Lcom/p1/mobile/putong/data/LiveUserLevel;

    .line 145
    .line 146
    iget-wide p4, p4, Lcom/p1/mobile/putong/data/LiveUserLevel;->grade:J

    .line 147
    .line 148
    invoke-virtual {p1, p4, p5}, Ll/hiv;->v(J)Lcom/p1/mobile/putong/live/base/data/BLiveUserLevel;

    .line 149
    .line 150
    .line 151
    move-result-object p1

    .line 152
    iget-object p4, p0, Lcom/p1/mobile/putong/live/livingroom/voice/membermanager/online/MemberOnLineItemView;->i:Lv/VDraweeView;

    .line 153
    .line 154
    if-eqz p1, :cond_3

    .line 155
    .line 156
    invoke-static {p4, p2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 157
    .line 158
    .line 159
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUserLevel;->backendUrl:Ljava/lang/String;

    .line 160
    .line 161
    iget-object p4, p0, Lcom/p1/mobile/putong/live/livingroom/voice/membermanager/online/MemberOnLineItemView;->i:Lv/VDraweeView;

    .line 162
    .line 163
    sget p5, Ll/i0k;->a:I

    .line 164
    .line 165
    invoke-static {p1, p4, p5}, Ll/i0k;->c(Ljava/lang/String;Lv/VDraweeView;I)V

    .line 166
    .line 167
    .line 168
    goto :goto_2

    .line 169
    :cond_3
    invoke-static {p4, p3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 170
    .line 171
    .line 172
    goto :goto_2

    .line 173
    :cond_4
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/membermanager/online/MemberOnLineItemView;->i:Lv/VDraweeView;

    .line 174
    .line 175
    invoke-static {p1, p3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 176
    .line 177
    .line 178
    :goto_2
    invoke-static {p6}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 179
    .line 180
    .line 181
    move-result p1

    .line 182
    iget-object p4, p0, Lcom/p1/mobile/putong/live/livingroom/voice/membermanager/online/MemberOnLineItemView;->j:Lv/VDraweeView;

    .line 183
    .line 184
    if-nez p1, :cond_5

    .line 185
    .line 186
    invoke-static {p4, p2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 187
    .line 188
    .line 189
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/membermanager/online/MemberOnLineItemView;->j:Lv/VDraweeView;

    .line 190
    .line 191
    sget p1, Ll/i0k;->a:I

    .line 192
    .line 193
    invoke-static {p6, p0, p1}, Ll/i0k;->c(Ljava/lang/String;Lv/VDraweeView;I)V

    .line 194
    .line 195
    .line 196
    return-void

    .line 197
    :cond_5
    invoke-static {p4, p3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 198
    .line 199
    .line 200
    return-void
.end method

.method public final m0(Ljava/lang/Boolean;Ljava/lang/String;Ll/nsv;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Boolean;",
            "Ljava/lang/String;",
            "Ll/nsv<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveMember;",
            ">;",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;",
            ")V"
        }
    .end annotation

    .line 1
    sget-object v0, Ll/zrv;->a:Ll/wrv;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/wrv;->D0()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const/4 v1, 0x0

    .line 8
    if-eqz p4, :cond_1

    .line 9
    .line 10
    iget-object v2, p4, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->user:Ljava/lang/String;

    .line 11
    .line 12
    iget-object v3, p4, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->anchor:Ljava/lang/String;

    .line 13
    .line 14
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 15
    .line 16
    .line 17
    move-result v4

    .line 18
    if-nez v4, :cond_0

    .line 19
    .line 20
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 21
    .line 22
    .line 23
    move-result v4

    .line 24
    if-nez v4, :cond_0

    .line 25
    .line 26
    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 27
    .line 28
    .line 29
    move-result v2

    .line 30
    if-eqz v2, :cond_0

    .line 31
    .line 32
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/membermanager/online/MemberOnLineItemView;->k:Lv/VText;

    .line 33
    .line 34
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 35
    .line 36
    .line 37
    return-void

    .line 38
    :cond_0
    iget-object v2, p3, Ll/nsv;->a:Ljava/lang/Object;

    .line 39
    .line 40
    check-cast v2, Lcom/p1/mobile/putong/live/base/data/BLiveMember;

    .line 41
    .line 42
    iget-boolean v2, v2, Lcom/p1/mobile/putong/live/base/data/BLiveMember;->isManager:Z

    .line 43
    .line 44
    if-eqz v2, :cond_1

    .line 45
    .line 46
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 47
    .line 48
    .line 49
    move-result v2

    .line 50
    if-nez v2, :cond_1

    .line 51
    .line 52
    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 53
    .line 54
    .line 55
    move-result v2

    .line 56
    if-nez v2, :cond_1

    .line 57
    .line 58
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/membermanager/online/MemberOnLineItemView;->k:Lv/VText;

    .line 59
    .line 60
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 61
    .line 62
    .line 63
    return-void

    .line 64
    :cond_1
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 65
    .line 66
    .line 67
    move-result v2

    .line 68
    if-nez v2, :cond_2

    .line 69
    .line 70
    iget-object v2, p3, Ll/nsv;->a:Ljava/lang/Object;

    .line 71
    .line 72
    check-cast v2, Lcom/p1/mobile/putong/live/base/data/BLiveMember;

    .line 73
    .line 74
    iget-object v2, v2, Lcom/p1/mobile/putong/live/base/data/BLiveMember;->reference:Ljava/lang/String;

    .line 75
    .line 76
    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 77
    .line 78
    .line 79
    move-result v0

    .line 80
    if-eqz v0, :cond_2

    .line 81
    .line 82
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/membermanager/online/MemberOnLineItemView;->k:Lv/VText;

    .line 83
    .line 84
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 85
    .line 86
    .line 87
    return-void

    .line 88
    :cond_2
    invoke-static {p4}, Ll/guk0;->h(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)Z

    .line 89
    .line 90
    .line 91
    move-result p4

    .line 92
    if-eqz p4, :cond_3

    .line 93
    .line 94
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/membermanager/online/MemberOnLineItemView;->k:Lv/VText;

    .line 95
    .line 96
    sget p3, Ll/obc0;->U0:I

    .line 97
    .line 98
    invoke-virtual {p2, p3}, Landroidx/appcompat/widget/AppCompatTextView;->setBackgroundResource(I)V

    .line 99
    .line 100
    .line 101
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/membermanager/online/MemberOnLineItemView;->k:Lv/VText;

    .line 102
    .line 103
    const-string p3, "#CCffffff"

    .line 104
    .line 105
    invoke-static {p3}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 106
    .line 107
    .line 108
    move-result p3

    .line 109
    invoke-virtual {p2, p3}, Landroid/widget/TextView;->setTextColor(I)V

    .line 110
    .line 111
    .line 112
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/membermanager/online/MemberOnLineItemView;->k:Lv/VText;

    .line 113
    .line 114
    sget p3, Lcom/p1/mobile/putong/live/livingroom/R$string;->Ki:I

    .line 115
    .line 116
    invoke-static {p3}, Ll/xau;->t(I)Ljava/lang/String;

    .line 117
    .line 118
    .line 119
    move-result-object p3

    .line 120
    invoke-virtual {p2, p3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 121
    .line 122
    .line 123
    goto :goto_1

    .line 124
    :cond_3
    iget-object p3, p3, Ll/nsv;->a:Ljava/lang/Object;

    .line 125
    .line 126
    check-cast p3, Lcom/p1/mobile/putong/live/base/data/BLiveMember;

    .line 127
    .line 128
    iget-object p3, p3, Lcom/p1/mobile/putong/live/base/data/BLiveMember;->inviteStatus:Ljava/lang/String;

    .line 129
    .line 130
    const-string p4, "invited"

    .line 131
    .line 132
    invoke-virtual {p4, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 133
    .line 134
    .line 135
    move-result p3

    .line 136
    iget-object p4, p0, Lcom/p1/mobile/putong/live/livingroom/voice/membermanager/online/MemberOnLineItemView;->k:Lv/VText;

    .line 137
    .line 138
    if-eqz p3, :cond_4

    .line 139
    .line 140
    sget p2, Ll/obc0;->U0:I

    .line 141
    .line 142
    invoke-virtual {p4, p2}, Landroidx/appcompat/widget/AppCompatTextView;->setBackgroundResource(I)V

    .line 143
    .line 144
    .line 145
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/membermanager/online/MemberOnLineItemView;->k:Lv/VText;

    .line 146
    .line 147
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 148
    .line 149
    .line 150
    move-result-object p3

    .line 151
    sget p4, Ll/n9c0;->j1:I

    .line 152
    .line 153
    invoke-static {p3, p4}, Ll/j26;->c(Landroid/content/Context;I)I

    .line 154
    .line 155
    .line 156
    move-result p3

    .line 157
    invoke-virtual {p2, p3}, Landroid/widget/TextView;->setTextColor(I)V

    .line 158
    .line 159
    .line 160
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/membermanager/online/MemberOnLineItemView;->k:Lv/VText;

    .line 161
    .line 162
    sget p3, Lcom/p1/mobile/putong/live/livingroom/R$string;->Gh:I

    .line 163
    .line 164
    invoke-static {p3}, Ll/xau;->t(I)Ljava/lang/String;

    .line 165
    .line 166
    .line 167
    move-result-object p3

    .line 168
    invoke-virtual {p2, p3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 169
    .line 170
    .line 171
    goto :goto_1

    .line 172
    :cond_4
    sget p3, Ll/obc0;->o0:I

    .line 173
    .line 174
    invoke-virtual {p4, p3}, Landroidx/appcompat/widget/AppCompatTextView;->setBackgroundResource(I)V

    .line 175
    .line 176
    .line 177
    iget-object p3, p0, Lcom/p1/mobile/putong/live/livingroom/voice/membermanager/online/MemberOnLineItemView;->k:Lv/VText;

    .line 178
    .line 179
    sget p4, Ll/n9c0;->e1:I

    .line 180
    .line 181
    invoke-static {p4}, Ll/n3d0;->a(I)I

    .line 182
    .line 183
    .line 184
    move-result p4

    .line 185
    invoke-virtual {p3, p4}, Landroid/widget/TextView;->setTextColor(I)V

    .line 186
    .line 187
    .line 188
    iget-object p3, p0, Lcom/p1/mobile/putong/live/livingroom/voice/membermanager/online/MemberOnLineItemView;->k:Lv/VText;

    .line 189
    .line 190
    invoke-static {p2}, Ll/y6s;->c(Ljava/lang/String;)Z

    .line 191
    .line 192
    .line 193
    move-result p2

    .line 194
    if-eqz p2, :cond_5

    .line 195
    .line 196
    const-string p2, "\u9080\u4e3a\u5609\u5bbe"

    .line 197
    .line 198
    goto :goto_0

    .line 199
    :cond_5
    const-string p2, "\u9080\u8bf7\u4e0a\u9ea6"

    .line 200
    .line 201
    :goto_0
    invoke-virtual {p3, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 202
    .line 203
    .line 204
    :goto_1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/membermanager/online/MemberOnLineItemView;->k:Lv/VText;

    .line 205
    .line 206
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 207
    .line 208
    .line 209
    move-result p1

    .line 210
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 211
    .line 212
    .line 213
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/livingroom/voice/membermanager/online/MemberOnLineItemView;->j0(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

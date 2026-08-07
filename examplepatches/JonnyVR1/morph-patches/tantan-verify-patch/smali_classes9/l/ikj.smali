.class public Ll/ikj;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/yjj;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Lcom/p1/mobile/putong/core/ui/VText_Default_Bold;

.field public b:Landroid/widget/TextView;

.field public c:Lcom/p1/mobile/putong/core/ui/profile/views/EditProfileItemTextView;

.field public d:Lcom/p1/mobile/putong/core/ui/profile/views/EditProfileItemTextView;

.field public e:Lcom/p1/mobile/putong/core/ui/profile/views/EditProfileItemTextView;

.field public f:Lcom/p1/mobile/putong/core/ui/profile/views/EditProfileItemTextView;

.field public g:Lv/VLinear;

.field public h:Lv/VLinear;

.field public i:Lv/VImage;

.field public j:Lv/VLinear;

.field public k:Lcom/p1/mobile/putong/core/ui/profile/views/EditProfileGameImageView;

.field public l:Lcom/p1/mobile/putong/core/ui/profile/views/EditProfileGameImageView;

.field public m:Lcom/p1/mobile/putong/core/ui/profile/views/EditProfileGameImageView;

.field public n:Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopActionLayout;

.field public o:Lv/VButton;

.field public final p:Lcom/p1/mobile/android/app/Act;

.field public final q:Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopGameCpFrag;

.field public r:Ll/yjj;

.field public s:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public t:Lcom/p1/mobile/putong/data/User;

.field public u:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/ui/profile/views/EditProfileGameImageView;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopGameCpFrag;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/ikj;->q:Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopGameCpFrag;

    .line 5
    .line 6
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    iput-object p1, p0, Ll/ikj;->p:Lcom/p1/mobile/android/app/Act;

    .line 11
    .line 12
    return-void
.end method

.method private synthetic B(Landroid/view/View;)V
    .locals 0

    .line 1
    sget-object p1, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;->GAME_VOICE:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/ikj;->u(Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic a(Ll/ikj;Lcom/p1/mobile/putong/core/ui/profile/views/EditProfileGameImageView;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ikj;->v(Lcom/p1/mobile/putong/core/ui/profile/views/EditProfileGameImageView;)V

    return-void
.end method

.method public static synthetic b(Ll/ikj;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ikj;->B(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic c(Ll/ikj;Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;Ljava/util/List;IILandroid/content/Intent;)Z
    .locals 0

    .line 1
    invoke-virtual/range {p0 .. p5}, Ll/ikj;->x(Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;Ljava/util/List;IILandroid/content/Intent;)Z

    move-result p0

    return p0
.end method

.method public static synthetic d(Ll/ikj;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ikj;->C(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic e(Ll/ikj;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ikj;->z(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic f(Ll/ikj;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ikj;->w(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic i(Ll/ikj;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ikj;->A(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic j(Ll/ikj;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ikj;->y(Landroid/view/View;)V

    return-void
.end method

.method public static bridge synthetic k(Ll/ikj;)Ljava/util/List;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ikj;->s:Ljava/util/List;

    return-object p0
.end method

.method public static bridge synthetic l(Ll/ikj;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ikj;->H(Ljava/util/List;)V

    return-void
.end method

.method private r()V
    .locals 6

    .line 1
    invoke-static {}, Ll/bnl0;->y0()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/high16 v1, 0x42c80000    # 100.0f

    .line 6
    .line 7
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    sub-int/2addr v0, v1

    .line 12
    const/4 v1, 0x3

    .line 13
    div-int/2addr v0, v1

    .line 14
    iget-object v2, p0, Ll/ikj;->k:Lcom/p1/mobile/putong/core/ui/profile/views/EditProfileGameImageView;

    .line 15
    .line 16
    iget-object v3, p0, Ll/ikj;->l:Lcom/p1/mobile/putong/core/ui/profile/views/EditProfileGameImageView;

    .line 17
    .line 18
    iget-object v4, p0, Ll/ikj;->m:Lcom/p1/mobile/putong/core/ui/profile/views/EditProfileGameImageView;

    .line 19
    .line 20
    new-array v1, v1, [Landroid/view/View;

    .line 21
    .line 22
    const/4 v5, 0x0

    .line 23
    aput-object v2, v1, v5

    .line 24
    .line 25
    const/4 v2, 0x1

    .line 26
    aput-object v3, v1, v2

    .line 27
    .line 28
    const/4 v3, 0x2

    .line 29
    aput-object v4, v1, v3

    .line 30
    .line 31
    invoke-static {v0, v1}, Ll/bnl0;->D0(I[Landroid/view/View;)V

    .line 32
    .line 33
    .line 34
    iget-object v1, p0, Ll/ikj;->k:Lcom/p1/mobile/putong/core/ui/profile/views/EditProfileGameImageView;

    .line 35
    .line 36
    invoke-static {v1, v0}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 37
    .line 38
    .line 39
    iget-object v1, p0, Ll/ikj;->l:Lcom/p1/mobile/putong/core/ui/profile/views/EditProfileGameImageView;

    .line 40
    .line 41
    invoke-static {v1, v0}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 42
    .line 43
    .line 44
    iget-object v1, p0, Ll/ikj;->m:Lcom/p1/mobile/putong/core/ui/profile/views/EditProfileGameImageView;

    .line 45
    .line 46
    invoke-static {v1, v0}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 47
    .line 48
    .line 49
    iget-object v0, p0, Ll/ikj;->k:Lcom/p1/mobile/putong/core/ui/profile/views/EditProfileGameImageView;

    .line 50
    .line 51
    iget-object v1, p0, Ll/ikj;->l:Lcom/p1/mobile/putong/core/ui/profile/views/EditProfileGameImageView;

    .line 52
    .line 53
    iget-object v3, p0, Ll/ikj;->m:Lcom/p1/mobile/putong/core/ui/profile/views/EditProfileGameImageView;

    .line 54
    .line 55
    filled-new-array {v0, v1, v3}, [Lcom/p1/mobile/putong/core/ui/profile/views/EditProfileGameImageView;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    invoke-static {v0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    iput-object v0, p0, Ll/ikj;->u:Ljava/util/List;

    .line 64
    .line 65
    new-instance v1, Ll/akj;

    .line 66
    .line 67
    invoke-direct {v1, p0}, Ll/akj;-><init>(Ll/ikj;)V

    .line 68
    .line 69
    .line 70
    invoke-static {v0, v1}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 71
    .line 72
    .line 73
    iget-object v0, p0, Ll/ikj;->c:Lcom/p1/mobile/putong/core/ui/profile/views/EditProfileItemTextView;

    .line 74
    .line 75
    const-string v1, "\u6e38\u620f\u540d\u79f0"

    .line 76
    .line 77
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/profile/views/EditProfileItemTextView;->setTitle(Ljava/lang/String;)V

    .line 78
    .line 79
    .line 80
    iget-object v0, p0, Ll/ikj;->d:Lcom/p1/mobile/putong/core/ui/profile/views/EditProfileItemTextView;

    .line 81
    .line 82
    const-string v1, "\u60f3\u627e\u4eba\u4e00\u8d77"

    .line 83
    .line 84
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/profile/views/EditProfileItemTextView;->setTitle(Ljava/lang/String;)V

    .line 85
    .line 86
    .line 87
    iget-object v0, p0, Ll/ikj;->e:Lcom/p1/mobile/putong/core/ui/profile/views/EditProfileItemTextView;

    .line 88
    .line 89
    const-string v1, "\u6bb5\u4f4d"

    .line 90
    .line 91
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/profile/views/EditProfileItemTextView;->setTitle(Ljava/lang/String;)V

    .line 92
    .line 93
    .line 94
    iget-object v0, p0, Ll/ikj;->f:Lcom/p1/mobile/putong/core/ui/profile/views/EditProfileItemTextView;

    .line 95
    .line 96
    const-string v1, "\u5f00\u9ea6"

    .line 97
    .line 98
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/profile/views/EditProfileItemTextView;->setTitle(Ljava/lang/String;)V

    .line 99
    .line 100
    .line 101
    invoke-virtual {p0}, Ll/ikj;->act()Lcom/p1/mobile/android/app/Act;

    .line 102
    .line 103
    .line 104
    move-result-object v0

    .line 105
    instance-of v0, v0, Lcom/p1/mobile/putong/core/ui/profile/loop/ProfileInfoLoopEditAct;

    .line 106
    .line 107
    if-nez v0, :cond_0

    .line 108
    .line 109
    iget-object v0, p0, Ll/ikj;->c:Lcom/p1/mobile/putong/core/ui/profile/views/EditProfileItemTextView;

    .line 110
    .line 111
    invoke-virtual {v0, v2}, Lcom/p1/mobile/putong/core/ui/profile/views/EditProfileItemTextView;->setRequired(Z)V

    .line 112
    .line 113
    .line 114
    iget-object v0, p0, Ll/ikj;->d:Lcom/p1/mobile/putong/core/ui/profile/views/EditProfileItemTextView;

    .line 115
    .line 116
    invoke-virtual {v0, v2}, Lcom/p1/mobile/putong/core/ui/profile/views/EditProfileItemTextView;->setRequired(Z)V

    .line 117
    .line 118
    .line 119
    :cond_0
    invoke-virtual {p0}, Ll/ikj;->act()Lcom/p1/mobile/android/app/Act;

    .line 120
    .line 121
    .line 122
    move-result-object v0

    .line 123
    instance-of v0, v0, Lcom/p1/mobile/putong/core/ui/profile/loop/ProfileInfoLoopEditAct;

    .line 124
    .line 125
    iget-object v1, p0, Ll/ikj;->n:Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopActionLayout;

    .line 126
    .line 127
    if-eqz v0, :cond_1

    .line 128
    .line 129
    invoke-static {v1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 130
    .line 131
    .line 132
    iget-object v0, p0, Ll/ikj;->n:Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopActionLayout;

    .line 133
    .line 134
    iget-object v1, p0, Ll/ikj;->q:Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopGameCpFrag;

    .line 135
    .line 136
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopActionLayout;->l(Ll/bqa0;)V

    .line 137
    .line 138
    .line 139
    iget-object v0, p0, Ll/ikj;->c:Lcom/p1/mobile/putong/core/ui/profile/views/EditProfileItemTextView;

    .line 140
    .line 141
    invoke-static {v0, v5}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 142
    .line 143
    .line 144
    iget-object v0, p0, Ll/ikj;->b:Landroid/widget/TextView;

    .line 145
    .line 146
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 147
    .line 148
    .line 149
    iget-object v0, p0, Ll/ikj;->o:Lv/VButton;

    .line 150
    .line 151
    invoke-static {v0, v5}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 152
    .line 153
    .line 154
    invoke-virtual {p0}, Ll/ikj;->act()Lcom/p1/mobile/android/app/Act;

    .line 155
    .line 156
    .line 157
    move-result-object v0

    .line 158
    check-cast v0, Lcom/p1/mobile/putong/core/ui/profile/loop/ProfileInfoLoopEditAct;

    .line 159
    .line 160
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/profile/loop/ProfileInfoLoopEditAct;->b2()Lcom/p1/mobile/putong/core/ui/profile/loop/a;

    .line 161
    .line 162
    .line 163
    move-result-object v0

    .line 164
    iget-object p0, p0, Ll/ikj;->q:Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopGameCpFrag;

    .line 165
    .line 166
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/core/ui/profile/loop/a;->W0(Ll/bqa0;)V

    .line 167
    .line 168
    .line 169
    return-void

    .line 170
    :cond_1
    invoke-static {v1, v5}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 171
    .line 172
    .line 173
    iget-object v0, p0, Ll/ikj;->b:Landroid/widget/TextView;

    .line 174
    .line 175
    invoke-static {v0, v5}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 176
    .line 177
    .line 178
    iget-object v0, p0, Ll/ikj;->o:Lv/VButton;

    .line 179
    .line 180
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 181
    .line 182
    .line 183
    iget-object v0, p0, Ll/ikj;->o:Lv/VButton;

    .line 184
    .line 185
    new-instance v1, Ll/bkj;

    .line 186
    .line 187
    invoke-direct {v1, p0}, Ll/bkj;-><init>(Ll/ikj;)V

    .line 188
    .line 189
    .line 190
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 191
    .line 192
    .line 193
    return-void
.end method

.method private synthetic w(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ikj;->E()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic z(Landroid/view/View;)V
    .locals 0

    .line 1
    sget-object p1, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;->GAME_TOGETHER:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/ikj;->u(Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final synthetic A(Landroid/view/View;)V
    .locals 0

    .line 1
    sget-object p1, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;->GAME_LEVEL:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/ikj;->u(Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic C(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p1, p0, Ll/ikj;->s:Ljava/util/List;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    iget-object p1, p0, Ll/ikj;->s:Ljava/util/List;

    .line 10
    .line 11
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    const/4 v0, 0x3

    .line 16
    if-ge p1, v0, :cond_0

    .line 17
    .line 18
    iget-object p0, p0, Ll/ikj;->k:Lcom/p1/mobile/putong/core/ui/profile/views/EditProfileGameImageView;

    .line 19
    .line 20
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/views/EditProfileGameImageView;->Q()V

    .line 21
    .line 22
    .line 23
    :cond_0
    return-void
.end method

.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/ikj;->p:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    return-object p0
.end method

.method public E()V
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/ikj;->q()Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 6
    .line 7
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 8
    .line 9
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Extensions;->game:Lcom/p1/mobile/putong/data/ExtensionGame;

    .line 10
    .line 11
    iget-object v0, v0, Lcom/p1/mobile/putong/data/ExtensionGame;->name:Ljava/util/List;

    .line 12
    .line 13
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    invoke-virtual {p0}, Ll/ikj;->q()Lcom/p1/mobile/putong/data/User;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    iget-object v1, v1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 22
    .line 23
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 24
    .line 25
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Extensions;->game:Lcom/p1/mobile/putong/data/ExtensionGame;

    .line 26
    .line 27
    iget-object v1, v1, Lcom/p1/mobile/putong/data/ExtensionGame;->together:Ljava/util/List;

    .line 28
    .line 29
    invoke-static {v1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    if-nez v0, :cond_1

    .line 34
    .line 35
    if-nez v1, :cond_1

    .line 36
    .line 37
    iget-object v2, p0, Ll/ikj;->r:Ll/yjj;

    .line 38
    .line 39
    invoke-virtual {v2}, Ll/yjj;->i0()V

    .line 40
    .line 41
    .line 42
    iget-object v2, p0, Ll/ikj;->q:Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopGameCpFrag;

    .line 43
    .line 44
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/ui/profile/loop/base/ProfileEditLoopBaseFrag;->pageId()Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object v2

    .line 48
    if-nez v0, :cond_0

    .line 49
    .line 50
    if-nez v1, :cond_0

    .line 51
    .line 52
    const/4 v0, 0x1

    .line 53
    goto :goto_0

    .line 54
    :cond_0
    const/4 v0, 0x0

    .line 55
    :goto_0
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    const-string v1, "is_succeed"

    .line 60
    .line 61
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    filled-new-array {v0}, [Ll/pf60;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    const-string v1, "e_game_info_submit"

    .line 70
    .line 71
    invoke-static {v1, v2, v0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 72
    .line 73
    .line 74
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 75
    .line 76
    .line 77
    move-result-object v0

    .line 78
    invoke-virtual {v0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 79
    .line 80
    .line 81
    move-result-object v0

    .line 82
    iget-object p0, p0, Ll/ikj;->t:Lcom/p1/mobile/putong/data/User;

    .line 83
    .line 84
    invoke-interface {v0, p0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->xc(Lcom/p1/mobile/putong/data/User;)V

    .line 85
    .line 86
    .line 87
    return-void

    .line 88
    :cond_1
    if-eqz v0, :cond_2

    .line 89
    .line 90
    if-eqz v1, :cond_2

    .line 91
    .line 92
    iget-object p0, p0, Ll/ikj;->p:Lcom/p1/mobile/android/app/Act;

    .line 93
    .line 94
    const-string v0, "\u8bf7\u586b\u5199\u6e38\u620f\u540d\u79f0\u3001\u60f3\u627e\u4eba\u4e00\u8d77"

    .line 95
    .line 96
    invoke-static {p0, v0}, Ll/o1j0;->F(Landroid/app/Activity;Ljava/lang/String;)V

    .line 97
    .line 98
    .line 99
    return-void

    .line 100
    :cond_2
    iget-object p0, p0, Ll/ikj;->p:Lcom/p1/mobile/android/app/Act;

    .line 101
    .line 102
    if-eqz v0, :cond_3

    .line 103
    .line 104
    const-string v0, "\u8bf7\u586b\u5199\u6e38\u620f\u540d\u79f0"

    .line 105
    .line 106
    invoke-static {p0, v0}, Ll/o1j0;->F(Landroid/app/Activity;Ljava/lang/String;)V

    .line 107
    .line 108
    .line 109
    return-void

    .line 110
    :cond_3
    const-string v0, "\u8bf7\u586b\u5199\u60f3\u627e\u4eba\u4e00\u8d77"

    .line 111
    .line 112
    invoke-static {p0, v0}, Ll/o1j0;->F(Landroid/app/Activity;Ljava/lang/String;)V

    .line 113
    .line 114
    .line 115
    return-void
.end method

.method public F()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ikj;->t:Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {v0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    iget-object v1, p0, Ll/ikj;->t:Lcom/p1/mobile/putong/data/User;

    .line 18
    .line 19
    invoke-interface {v0, v1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->xc(Lcom/p1/mobile/putong/data/User;)V

    .line 20
    .line 21
    .line 22
    :cond_0
    iget-object p0, p0, Ll/ikj;->q:Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopGameCpFrag;

    .line 23
    .line 24
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/loop/base/ProfileEditLoopBaseFrag;->pageId()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    const-string v0, "is_succeed"

    .line 29
    .line 30
    const-string v1, ""

    .line 31
    .line 32
    invoke-static {v0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    filled-new-array {v0}, [Ll/pf60;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    const-string v1, "e_game_info_submit"

    .line 41
    .line 42
    invoke-static {v1, p0, v0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 43
    .line 44
    .line 45
    return-void
.end method

.method public G(Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;)V"
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 3
    .line 4
    .line 5
    move-result-object p1

    .line 6
    check-cast p1, Lcom/p1/mobile/putong/data/Media;

    .line 7
    .line 8
    instance-of v0, p1, Lcom/p1/mobile/putong/data/Picture;

    .line 9
    .line 10
    if-eqz v0, :cond_1

    .line 11
    .line 12
    check-cast p1, Lcom/p1/mobile/putong/data/Picture;

    .line 13
    .line 14
    iget-object p0, p0, Ll/ikj;->u:Ljava/util/List;

    .line 15
    .line 16
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    :cond_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    if-eqz v0, :cond_1

    .line 25
    .line 26
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    check-cast v0, Lcom/p1/mobile/putong/core/ui/profile/views/EditProfileGameImageView;

    .line 31
    .line 32
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/profile/views/EditProfileGameImageView;->getImageUrl()Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 37
    .line 38
    .line 39
    move-result v1

    .line 40
    if-eqz v1, :cond_0

    .line 41
    .line 42
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/core/ui/profile/views/EditProfileGameImageView;->O(Lcom/p1/mobile/putong/data/Picture;)V

    .line 43
    .line 44
    .line 45
    :cond_1
    return-void
.end method

.method public final H(Ljava/util/List;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Ll/td8;->q0(Ljava/util/List;)Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iput-object p1, p0, Ll/ikj;->s:Ljava/util/List;

    .line 6
    .line 7
    const/4 p1, 0x0

    .line 8
    :goto_0
    const/4 v0, 0x3

    .line 9
    if-ge p1, v0, :cond_2

    .line 10
    .line 11
    iget-object v0, p0, Ll/ikj;->s:Ljava/util/List;

    .line 12
    .line 13
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-ge p1, v0, :cond_0

    .line 18
    .line 19
    iget-object v0, p0, Ll/ikj;->s:Ljava/util/List;

    .line 20
    .line 21
    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    check-cast v0, Ljava/lang/String;

    .line 26
    .line 27
    goto :goto_1

    .line 28
    :cond_0
    const/4 v0, 0x0

    .line 29
    :goto_1
    iget-object v1, p0, Ll/ikj;->u:Ljava/util/List;

    .line 30
    .line 31
    invoke-interface {v1, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    check-cast v1, Lcom/p1/mobile/putong/core/ui/profile/views/EditProfileGameImageView;

    .line 36
    .line 37
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/profile/views/EditProfileGameImageView;->getImageUrl()Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v2

    .line 41
    invoke-static {v2, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 42
    .line 43
    .line 44
    move-result v2

    .line 45
    if-nez v2, :cond_1

    .line 46
    .line 47
    invoke-virtual {v1, v0}, Lcom/p1/mobile/putong/core/ui/profile/views/EditProfileGameImageView;->P(Ljava/lang/String;)V

    .line 48
    .line 49
    .line 50
    :cond_1
    add-int/lit8 p1, p1, 0x1

    .line 51
    .line 52
    goto :goto_0

    .line 53
    :cond_2
    invoke-virtual {p0}, Ll/ikj;->q()Lcom/p1/mobile/putong/data/User;

    .line 54
    .line 55
    .line 56
    move-result-object p1

    .line 57
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 58
    .line 59
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 60
    .line 61
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Extensions;->game:Lcom/p1/mobile/putong/data/ExtensionGame;

    .line 62
    .line 63
    iget-object p0, p0, Ll/ikj;->s:Ljava/util/List;

    .line 64
    .line 65
    iput-object p0, p1, Lcom/p1/mobile/putong/data/ExtensionGame;->screenshot:Ljava/util/List;

    .line 66
    .line 67
    return-void
.end method

.method public I()V
    .locals 3

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Ll/ikj;->s:Ljava/util/List;

    .line 7
    .line 8
    iget-object v0, p0, Ll/ikj;->c:Lcom/p1/mobile/putong/core/ui/profile/views/EditProfileItemTextView;

    .line 9
    .line 10
    invoke-virtual {p0}, Ll/ikj;->q()Lcom/p1/mobile/putong/data/User;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    iget-object v1, v1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 15
    .line 16
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 17
    .line 18
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Extensions;->game:Lcom/p1/mobile/putong/data/ExtensionGame;

    .line 19
    .line 20
    iget-object v1, v1, Lcom/p1/mobile/putong/data/ExtensionGame;->name:Ljava/util/List;

    .line 21
    .line 22
    const-string v2, "\u3001"

    .line 23
    .line 24
    invoke-static {v2, v1}, Ll/du4;->a(Ljava/lang/CharSequence;Ljava/lang/Iterable;)Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/profile/views/EditProfileItemTextView;->setValue(Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    iget-object v0, p0, Ll/ikj;->d:Lcom/p1/mobile/putong/core/ui/profile/views/EditProfileItemTextView;

    .line 32
    .line 33
    invoke-virtual {p0}, Ll/ikj;->q()Lcom/p1/mobile/putong/data/User;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    iget-object v1, v1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 38
    .line 39
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 40
    .line 41
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Extensions;->game:Lcom/p1/mobile/putong/data/ExtensionGame;

    .line 42
    .line 43
    iget-object v1, v1, Lcom/p1/mobile/putong/data/ExtensionGame;->together:Ljava/util/List;

    .line 44
    .line 45
    invoke-static {v2, v1}, Ll/du4;->a(Ljava/lang/CharSequence;Ljava/lang/Iterable;)Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object v1

    .line 49
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/profile/views/EditProfileItemTextView;->setValue(Ljava/lang/String;)V

    .line 50
    .line 51
    .line 52
    iget-object v0, p0, Ll/ikj;->e:Lcom/p1/mobile/putong/core/ui/profile/views/EditProfileItemTextView;

    .line 53
    .line 54
    invoke-virtual {p0}, Ll/ikj;->q()Lcom/p1/mobile/putong/data/User;

    .line 55
    .line 56
    .line 57
    move-result-object v1

    .line 58
    iget-object v1, v1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 59
    .line 60
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 61
    .line 62
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Extensions;->game:Lcom/p1/mobile/putong/data/ExtensionGame;

    .line 63
    .line 64
    iget-object v1, v1, Lcom/p1/mobile/putong/data/ExtensionGame;->level:Ljava/util/List;

    .line 65
    .line 66
    invoke-static {v1}, Ll/td8;->t0(Ljava/util/List;)Ljava/lang/Object;

    .line 67
    .line 68
    .line 69
    move-result-object v1

    .line 70
    check-cast v1, Ljava/lang/String;

    .line 71
    .line 72
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/profile/views/EditProfileItemTextView;->setValue(Ljava/lang/String;)V

    .line 73
    .line 74
    .line 75
    iget-object v0, p0, Ll/ikj;->f:Lcom/p1/mobile/putong/core/ui/profile/views/EditProfileItemTextView;

    .line 76
    .line 77
    invoke-virtual {p0}, Ll/ikj;->q()Lcom/p1/mobile/putong/data/User;

    .line 78
    .line 79
    .line 80
    move-result-object v1

    .line 81
    iget-object v1, v1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 82
    .line 83
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 84
    .line 85
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Extensions;->game:Lcom/p1/mobile/putong/data/ExtensionGame;

    .line 86
    .line 87
    iget-object v1, v1, Lcom/p1/mobile/putong/data/ExtensionGame;->voice:Ljava/util/List;

    .line 88
    .line 89
    invoke-static {v1}, Ll/td8;->t0(Ljava/util/List;)Ljava/lang/Object;

    .line 90
    .line 91
    .line 92
    move-result-object v1

    .line 93
    check-cast v1, Ljava/lang/String;

    .line 94
    .line 95
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/profile/views/EditProfileItemTextView;->setValue(Ljava/lang/String;)V

    .line 96
    .line 97
    .line 98
    invoke-virtual {p0}, Ll/ikj;->q()Lcom/p1/mobile/putong/data/User;

    .line 99
    .line 100
    .line 101
    move-result-object v0

    .line 102
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 103
    .line 104
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 105
    .line 106
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Extensions;->game:Lcom/p1/mobile/putong/data/ExtensionGame;

    .line 107
    .line 108
    iget-object v0, v0, Lcom/p1/mobile/putong/data/ExtensionGame;->screenshot:Ljava/util/List;

    .line 109
    .line 110
    invoke-virtual {p0, v0}, Ll/ikj;->H(Ljava/util/List;)V

    .line 111
    .line 112
    .line 113
    iget-object v0, p0, Ll/ikj;->c:Lcom/p1/mobile/putong/core/ui/profile/views/EditProfileItemTextView;

    .line 114
    .line 115
    new-instance v1, Ll/ckj;

    .line 116
    .line 117
    invoke-direct {v1, p0}, Ll/ckj;-><init>(Ll/ikj;)V

    .line 118
    .line 119
    .line 120
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 121
    .line 122
    .line 123
    iget-object v0, p0, Ll/ikj;->d:Lcom/p1/mobile/putong/core/ui/profile/views/EditProfileItemTextView;

    .line 124
    .line 125
    new-instance v1, Ll/dkj;

    .line 126
    .line 127
    invoke-direct {v1, p0}, Ll/dkj;-><init>(Ll/ikj;)V

    .line 128
    .line 129
    .line 130
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 131
    .line 132
    .line 133
    iget-object v0, p0, Ll/ikj;->e:Lcom/p1/mobile/putong/core/ui/profile/views/EditProfileItemTextView;

    .line 134
    .line 135
    new-instance v1, Ll/ekj;

    .line 136
    .line 137
    invoke-direct {v1, p0}, Ll/ekj;-><init>(Ll/ikj;)V

    .line 138
    .line 139
    .line 140
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 141
    .line 142
    .line 143
    iget-object v0, p0, Ll/ikj;->f:Lcom/p1/mobile/putong/core/ui/profile/views/EditProfileItemTextView;

    .line 144
    .line 145
    new-instance v1, Ll/fkj;

    .line 146
    .line 147
    invoke-direct {v1, p0}, Ll/fkj;-><init>(Ll/ikj;)V

    .line 148
    .line 149
    .line 150
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 151
    .line 152
    .line 153
    iget-object v0, p0, Ll/ikj;->h:Lv/VLinear;

    .line 154
    .line 155
    new-instance v1, Ll/gkj;

    .line 156
    .line 157
    invoke-direct {v1, p0}, Ll/gkj;-><init>(Ll/ikj;)V

    .line 158
    .line 159
    .line 160
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 161
    .line 162
    .line 163
    iget-object v0, p0, Ll/ikj;->n:Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopActionLayout;

    .line 164
    .line 165
    invoke-static {v0}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 166
    .line 167
    .line 168
    move-result v0

    .line 169
    if-eqz v0, :cond_0

    .line 170
    .line 171
    iget-object v0, p0, Ll/ikj;->n:Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopActionLayout;

    .line 172
    .line 173
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopActionLayout;->k()V

    .line 174
    .line 175
    .line 176
    :cond_0
    invoke-static {}, Ll/xra;->f()Z

    .line 177
    .line 178
    .line 179
    move-result v0

    .line 180
    if-eqz v0, :cond_1

    .line 181
    .line 182
    iget-object v0, p0, Ll/ikj;->q:Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopGameCpFrag;

    .line 183
    .line 184
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/profile/loop/base/ProfileEditLoopBaseFrag;->U4()Z

    .line 185
    .line 186
    .line 187
    move-result v0

    .line 188
    if-eqz v0, :cond_1

    .line 189
    .line 190
    iget-object v0, p0, Ll/ikj;->q:Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopGameCpFrag;

    .line 191
    .line 192
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/profile/loop/base/ProfileEditLoopBaseFrag;->z:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

    .line 193
    .line 194
    invoke-static {v0}, Ll/tr90;->m(Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;)Ljava/lang/String;

    .line 195
    .line 196
    .line 197
    move-result-object v0

    .line 198
    iget-object v1, p0, Ll/ikj;->a:Lcom/p1/mobile/putong/core/ui/VText_Default_Bold;

    .line 199
    .line 200
    const/4 v2, 0x0

    .line 201
    invoke-static {v1, v2}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 202
    .line 203
    .line 204
    iget-object v1, p0, Ll/ikj;->b:Landroid/widget/TextView;

    .line 205
    .line 206
    const/high16 v2, 0x40e00000    # 7.0f

    .line 207
    .line 208
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 209
    .line 210
    .line 211
    move-result v2

    .line 212
    invoke-static {v1, v2}, Ll/bnl0;->U(Landroid/view/View;I)V

    .line 213
    .line 214
    .line 215
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 216
    .line 217
    .line 218
    move-result v1

    .line 219
    if-nez v1, :cond_1

    .line 220
    .line 221
    iget-object v1, p0, Ll/ikj;->b:Landroid/widget/TextView;

    .line 222
    .line 223
    const/4 v2, 0x1

    .line 224
    invoke-static {v1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 225
    .line 226
    .line 227
    iget-object v1, p0, Ll/ikj;->b:Landroid/widget/TextView;

    .line 228
    .line 229
    const/high16 v2, 0x41700000    # 15.0f

    .line 230
    .line 231
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTextSize(F)V

    .line 232
    .line 233
    .line 234
    iget-object v1, p0, Ll/ikj;->b:Landroid/widget/TextView;

    .line 235
    .line 236
    const-string v2, "#a9a9a9"

    .line 237
    .line 238
    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 239
    .line 240
    .line 241
    move-result v2

    .line 242
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 243
    .line 244
    .line 245
    iget-object p0, p0, Ll/ikj;->b:Landroid/widget/TextView;

    .line 246
    .line 247
    const-string v1, "\u9884\u8ba1\u7b26\u5408%s\u4eba\u7684\u7406\u60f3\u578b"

    .line 248
    .line 249
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 250
    .line 251
    .line 252
    move-result-object v0

    .line 253
    invoke-static {v1, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 254
    .line 255
    .line 256
    move-result-object v0

    .line 257
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 258
    .line 259
    .line 260
    :cond_1
    return-void
.end method

.method public final J(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/data/User;",
            "Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    new-instance p0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {p0, p3}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 4
    .line 5
    .line 6
    sget-object p3, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;->GAME_NAME:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

    .line 7
    .line 8
    if-ne p2, p3, :cond_0

    .line 9
    .line 10
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 11
    .line 12
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 13
    .line 14
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Extensions;->game:Lcom/p1/mobile/putong/data/ExtensionGame;

    .line 15
    .line 16
    iput-object p0, p1, Lcom/p1/mobile/putong/data/ExtensionGame;->name:Ljava/util/List;

    .line 17
    .line 18
    return-void

    .line 19
    :cond_0
    sget-object p3, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;->GAME_TOGETHER:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

    .line 20
    .line 21
    if-ne p2, p3, :cond_1

    .line 22
    .line 23
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 24
    .line 25
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 26
    .line 27
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Extensions;->game:Lcom/p1/mobile/putong/data/ExtensionGame;

    .line 28
    .line 29
    iput-object p0, p1, Lcom/p1/mobile/putong/data/ExtensionGame;->together:Ljava/util/List;

    .line 30
    .line 31
    return-void

    .line 32
    :cond_1
    sget-object p3, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;->GAME_LEVEL:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

    .line 33
    .line 34
    if-ne p2, p3, :cond_2

    .line 35
    .line 36
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 37
    .line 38
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 39
    .line 40
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Extensions;->game:Lcom/p1/mobile/putong/data/ExtensionGame;

    .line 41
    .line 42
    iput-object p0, p1, Lcom/p1/mobile/putong/data/ExtensionGame;->level:Ljava/util/List;

    .line 43
    .line 44
    return-void

    .line 45
    :cond_2
    sget-object p3, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;->GAME_VOICE:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

    .line 46
    .line 47
    if-ne p2, p3, :cond_3

    .line 48
    .line 49
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 50
    .line 51
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 52
    .line 53
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Extensions;->game:Lcom/p1/mobile/putong/data/ExtensionGame;

    .line 54
    .line 55
    iput-object p0, p1, Lcom/p1/mobile/putong/data/ExtensionGame;->voice:Ljava/util/List;

    .line 56
    .line 57
    :cond_3
    return-void
.end method

.method public act()Lcom/p1/mobile/android/app/Act;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/ikj;->p:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    return-object p0
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/yjj;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/ikj;->n(Ll/yjj;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/ikj;->m(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-direct {p0}, Ll/ikj;->r()V

    .line 6
    .line 7
    .line 8
    return-object p1
.end method

.method public m(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/jkj;->b(Ll/ikj;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public n(Ll/yjj;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/ikj;->r:Ll/yjj;

    .line 2
    .line 3
    return-void
.end method

.method public p()Z
    .locals 5

    .line 1
    invoke-virtual {p0}, Ll/ikj;->q()Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 6
    .line 7
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 8
    .line 9
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Extensions;->game:Lcom/p1/mobile/putong/data/ExtensionGame;

    .line 10
    .line 11
    const/4 v1, 0x0

    .line 12
    if-nez v0, :cond_0

    .line 13
    .line 14
    return v1

    .line 15
    :cond_0
    invoke-virtual {p0}, Ll/ikj;->q()Lcom/p1/mobile/putong/data/User;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 20
    .line 21
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 22
    .line 23
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Extensions;->game:Lcom/p1/mobile/putong/data/ExtensionGame;

    .line 24
    .line 25
    iget-object v0, v0, Lcom/p1/mobile/putong/data/ExtensionGame;->name:Ljava/util/List;

    .line 26
    .line 27
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    invoke-virtual {p0}, Ll/ikj;->q()Lcom/p1/mobile/putong/data/User;

    .line 32
    .line 33
    .line 34
    move-result-object v2

    .line 35
    iget-object v2, v2, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 36
    .line 37
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 38
    .line 39
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Extensions;->game:Lcom/p1/mobile/putong/data/ExtensionGame;

    .line 40
    .line 41
    iget-object v2, v2, Lcom/p1/mobile/putong/data/ExtensionGame;->together:Ljava/util/List;

    .line 42
    .line 43
    invoke-static {v2}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 44
    .line 45
    .line 46
    move-result v2

    .line 47
    invoke-virtual {p0}, Ll/ikj;->q()Lcom/p1/mobile/putong/data/User;

    .line 48
    .line 49
    .line 50
    move-result-object v3

    .line 51
    iget-object v3, v3, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 52
    .line 53
    iget-object v3, v3, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 54
    .line 55
    iget-object v3, v3, Lcom/p1/mobile/putong/data/Extensions;->game:Lcom/p1/mobile/putong/data/ExtensionGame;

    .line 56
    .line 57
    iget-object v3, v3, Lcom/p1/mobile/putong/data/ExtensionGame;->level:Ljava/util/List;

    .line 58
    .line 59
    invoke-static {v3}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 60
    .line 61
    .line 62
    move-result v3

    .line 63
    invoke-virtual {p0}, Ll/ikj;->q()Lcom/p1/mobile/putong/data/User;

    .line 64
    .line 65
    .line 66
    move-result-object v4

    .line 67
    iget-object v4, v4, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 68
    .line 69
    iget-object v4, v4, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 70
    .line 71
    iget-object v4, v4, Lcom/p1/mobile/putong/data/Extensions;->game:Lcom/p1/mobile/putong/data/ExtensionGame;

    .line 72
    .line 73
    iget-object v4, v4, Lcom/p1/mobile/putong/data/ExtensionGame;->voice:Ljava/util/List;

    .line 74
    .line 75
    invoke-static {v4}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 76
    .line 77
    .line 78
    move-result v4

    .line 79
    invoke-virtual {p0}, Ll/ikj;->q()Lcom/p1/mobile/putong/data/User;

    .line 80
    .line 81
    .line 82
    move-result-object p0

    .line 83
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 84
    .line 85
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 86
    .line 87
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Extensions;->game:Lcom/p1/mobile/putong/data/ExtensionGame;

    .line 88
    .line 89
    iget-object p0, p0, Lcom/p1/mobile/putong/data/ExtensionGame;->screenshot:Ljava/util/List;

    .line 90
    .line 91
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 92
    .line 93
    .line 94
    move-result p0

    .line 95
    if-eqz v0, :cond_2

    .line 96
    .line 97
    if-eqz v2, :cond_2

    .line 98
    .line 99
    if-eqz v3, :cond_2

    .line 100
    .line 101
    if-eqz v4, :cond_2

    .line 102
    .line 103
    if-nez p0, :cond_1

    .line 104
    .line 105
    goto :goto_0

    .line 106
    :cond_1
    return v1

    .line 107
    :cond_2
    :goto_0
    const/4 p0, 0x1

    .line 108
    return p0
.end method

.method public q()Lcom/p1/mobile/putong/data/User;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ikj;->t:Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/ikj;->act()Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    instance-of v0, v0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopFragAct;

    .line 10
    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {v0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->Uc()Lcom/p1/mobile/putong/data/User;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    iput-object v0, p0, Ll/ikj;->t:Lcom/p1/mobile/putong/data/User;

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_0
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    invoke-virtual {v0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->Uc()Lcom/p1/mobile/putong/data/User;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->clone()Lcom/p1/mobile/putong/data/User;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    iput-object v0, p0, Ll/ikj;->t:Lcom/p1/mobile/putong/data/User;

    .line 45
    .line 46
    :cond_1
    :goto_0
    iget-object p0, p0, Ll/ikj;->t:Lcom/p1/mobile/putong/data/User;

    .line 47
    .line 48
    return-object p0
.end method

.method public final s(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;)Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/data/User;",
            "Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;",
            ")",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;->GAME_NAME:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

    .line 2
    .line 3
    if-ne p2, p0, :cond_0

    .line 4
    .line 5
    iget-object p0, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Extensions;->game:Lcom/p1/mobile/putong/data/ExtensionGame;

    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/data/ExtensionGame;->name:Ljava/util/List;

    .line 12
    .line 13
    return-object p0

    .line 14
    :cond_0
    sget-object p0, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;->GAME_TOGETHER:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

    .line 15
    .line 16
    if-ne p2, p0, :cond_1

    .line 17
    .line 18
    iget-object p0, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 19
    .line 20
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 21
    .line 22
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Extensions;->game:Lcom/p1/mobile/putong/data/ExtensionGame;

    .line 23
    .line 24
    iget-object p0, p0, Lcom/p1/mobile/putong/data/ExtensionGame;->together:Ljava/util/List;

    .line 25
    .line 26
    return-object p0

    .line 27
    :cond_1
    sget-object p0, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;->GAME_LEVEL:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

    .line 28
    .line 29
    if-ne p2, p0, :cond_2

    .line 30
    .line 31
    iget-object p0, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 32
    .line 33
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 34
    .line 35
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Extensions;->game:Lcom/p1/mobile/putong/data/ExtensionGame;

    .line 36
    .line 37
    iget-object p0, p0, Lcom/p1/mobile/putong/data/ExtensionGame;->level:Ljava/util/List;

    .line 38
    .line 39
    return-object p0

    .line 40
    :cond_2
    sget-object p0, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;->GAME_VOICE:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

    .line 41
    .line 42
    if-ne p2, p0, :cond_3

    .line 43
    .line 44
    iget-object p0, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 45
    .line 46
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 47
    .line 48
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Extensions;->game:Lcom/p1/mobile/putong/data/ExtensionGame;

    .line 49
    .line 50
    iget-object p0, p0, Lcom/p1/mobile/putong/data/ExtensionGame;->voice:Ljava/util/List;

    .line 51
    .line 52
    return-object p0

    .line 53
    :cond_3
    const/4 p0, 0x0

    .line 54
    return-object p0
.end method

.method public final u(Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;)V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/ikj;->p:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    sget-object v1, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopFragmentFactory$LoopCreateEntryType;->ENTRY_MOMENT_GAME:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopFragmentFactory$LoopCreateEntryType;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/ikj;->q()Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    .line 8
    move-result-object v2

    .line 9
    invoke-static {v0, v1, p1, v2}, Lcom/p1/mobile/putong/core/ui/profile/loop/ProfileInfoLoopEditAct;->Y1(Landroid/content/Context;Lcom/p1/mobile/putong/core/ui/profile/loop/LoopFragmentFactory$LoopCreateEntryType;Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;Lcom/p1/mobile/putong/data/User;)Landroid/content/Intent;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {p0}, Ll/ikj;->q()Lcom/p1/mobile/putong/data/User;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-virtual {p0, v1, p1}, Ll/ikj;->s(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;)Ljava/util/List;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    if-nez v1, :cond_0

    .line 22
    .line 23
    return-void

    .line 24
    :cond_0
    iget-object v2, p0, Ll/ikj;->p:Lcom/p1/mobile/android/app/Act;

    .line 25
    .line 26
    new-instance v3, Ll/hkj;

    .line 27
    .line 28
    invoke-direct {v3, p0, p1, v1}, Ll/hkj;-><init>(Ll/ikj;Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;Ljava/util/List;)V

    .line 29
    .line 30
    .line 31
    const/16 p1, 0xdac

    .line 32
    .line 33
    invoke-virtual {v2, p1, v0, v3}, Lcom/p1/mobile/android/app/Act;->startActivityForResult(ILandroid/content/Intent;Lcom/p1/mobile/android/app/a$a;)V

    .line 34
    .line 35
    .line 36
    iget-object p0, p0, Ll/ikj;->p:Lcom/p1/mobile/android/app/Act;

    .line 37
    .line 38
    sget p1, Ll/z7c0;->h:I

    .line 39
    .line 40
    const/4 v0, 0x0

    .line 41
    invoke-virtual {p0, p1, v0}, Landroid/app/Activity;->overridePendingTransition(II)V

    .line 42
    .line 43
    .line 44
    return-void
.end method

.method public final synthetic v(Lcom/p1/mobile/putong/core/ui/profile/views/EditProfileGameImageView;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ikj;->p:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    new-instance v1, Ll/ikj$a;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/ikj$a;-><init>(Ll/ikj;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/core/ui/profile/views/EditProfileGameImageView;->G(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/ui/profile/views/EditProfileGameImageView$b;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final synthetic x(Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;Ljava/util/List;IILandroid/content/Intent;)Z
    .locals 1

    .line 1
    const/16 v0, 0xdac

    .line 2
    .line 3
    if-ne p3, v0, :cond_1

    .line 4
    .line 5
    const/4 p3, -0x1

    .line 6
    if-ne p4, p3, :cond_1

    .line 7
    .line 8
    invoke-static {p5}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    move-result p3

    .line 12
    if-eqz p3, :cond_1

    .line 13
    .line 14
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 15
    .line 16
    .line 17
    move-result-object p3

    .line 18
    invoke-virtual {p3}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 19
    .line 20
    .line 21
    move-result-object p3

    .line 22
    invoke-interface {p3}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->Uc()Lcom/p1/mobile/putong/data/User;

    .line 23
    .line 24
    .line 25
    move-result-object p3

    .line 26
    invoke-virtual {p0, p3, p1}, Ll/ikj;->s(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;)Ljava/util/List;

    .line 27
    .line 28
    .line 29
    move-result-object p4

    .line 30
    invoke-virtual {p0}, Ll/ikj;->q()Lcom/p1/mobile/putong/data/User;

    .line 31
    .line 32
    .line 33
    move-result-object p5

    .line 34
    invoke-virtual {p0, p5, p1, p4}, Ll/ikj;->J(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;Ljava/util/List;)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {p0}, Ll/ikj;->act()Lcom/p1/mobile/android/app/Act;

    .line 38
    .line 39
    .line 40
    move-result-object p4

    .line 41
    instance-of p4, p4, Lcom/p1/mobile/putong/core/ui/profile/loop/ProfileInfoLoopEditAct;

    .line 42
    .line 43
    if-eqz p4, :cond_0

    .line 44
    .line 45
    invoke-virtual {p0, p3, p1, p2}, Ll/ikj;->J(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;Ljava/util/List;)V

    .line 46
    .line 47
    .line 48
    :cond_0
    invoke-virtual {p0}, Ll/ikj;->I()V

    .line 49
    .line 50
    .line 51
    :cond_1
    const/4 p0, 0x0

    .line 52
    return p0
.end method

.method public final synthetic y(Landroid/view/View;)V
    .locals 0

    .line 1
    sget-object p1, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;->GAME_NAME:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/ikj;->u(Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.class public Ll/a1x;
.super Ll/hzw;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/hzw<",
        "Ll/y0x;",
        ">;"
    }
.end annotation


# instance fields
.field public c:Lv/VScroll;

.field public d:Lv/VText;

.field public e:Lv/VText;

.field public f:Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemView;

.field public g:Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemView;

.field public h:Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemView;

.field public i:Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemView;

.field public j:Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemView;

.field public k:Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemView;

.field public l:Lv/VLinear;

.field public m:Lv/VEditText;

.field public n:Landroid/widget/TextView;

.field public o:Lv/VLinear;

.field public p:Ll/y0x;

.field public q:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ll/oyl;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/ui/marry/profile/loop/base/MarryEditProfileBaseMvpFrag;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Ll/hzw;-><init>(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/ui/marry/profile/loop/base/MarryEditProfileBaseMvpFrag;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic j(Ll/a1x;Ll/oyl;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Ll/a1x;->p(Ll/oyl;Landroid/view/View;)V

    return-void
.end method

.method public static bridge synthetic k(Ll/a1x;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/a1x;->s(Ljava/lang/String;)V

    return-void
.end method

.method private synthetic p(Ll/oyl;Landroid/view/View;)V
    .locals 6

    .line 1
    invoke-virtual {p0}, Ll/hzw;->a()Lcom/p1/mobile/putong/core/ui/marry/profile/loop/MarryEditProfileSeriesAct;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    invoke-virtual {p0}, Ll/hzw;->a()Lcom/p1/mobile/putong/core/ui/marry/profile/loop/MarryEditProfileSeriesAct;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-object p0, p0, Ll/a1x;->p:Ll/y0x;

    .line 10
    .line 11
    iget-object v1, p0, Ll/y0x;->a:Lcom/p1/mobile/putong/data/User;

    .line 12
    .line 13
    invoke-interface {p1}, Ll/oyl;->getItemType()Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    filled-new-array {p0}, [Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-static {p0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    const/4 v4, 0x0

    .line 26
    const/4 v5, 0x1

    .line 27
    const/4 v3, 0x0

    .line 28
    invoke-static/range {v0 .. v5}, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/MarryEditProfileSeriesAct;->Z1(Landroid/content/Context;Lcom/p1/mobile/putong/data/User;Ljava/util/ArrayList;ZZZ)Landroid/content/Intent;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    const/16 p1, 0x138a

    .line 33
    .line 34
    invoke-virtual {p2, p0, p1}, Landroidx/activity/ComponentActivity;->startActivityForResult(Landroid/content/Intent;I)V

    .line 35
    .line 36
    .line 37
    return-void
.end method


# virtual methods
.method public b(Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;Lcom/p1/mobile/putong/data/User;)Z
    .locals 0

    .line 1
    iget-object p1, p0, Ll/a1x;->m:Lv/VEditText;

    .line 2
    .line 3
    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    if-eqz p1, :cond_0

    .line 12
    .line 13
    iget-object p0, p0, Ll/a1x;->m:Lv/VEditText;

    .line 14
    .line 15
    invoke-virtual {p0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-interface {p0}, Ljava/lang/CharSequence;->length()I

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    const/16 p1, 0x14

    .line 24
    .line 25
    if-ge p0, p1, :cond_0

    .line 26
    .line 27
    const-string p0, "\u8bf7\u81f3\u5c11\u586b\u519920\u4e2a\u5b57"

    .line 28
    .line 29
    invoke-static {p0}, Ll/r1j0;->g(Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    const/4 p0, 0x0

    .line 33
    return p0

    .line 34
    :cond_0
    const/4 p0, 0x1

    .line 35
    return p0
.end method

.method public c(Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;)Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    return p0
.end method

.method public e(Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;Lcom/p1/mobile/putong/data/User;)V
    .locals 1

    .line 1
    iget-object p1, p2, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 4
    .line 5
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Extensions;->marriage:Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;

    .line 6
    .line 7
    iget-object p2, p0, Ll/a1x;->p:Ll/y0x;

    .line 8
    .line 9
    iget-object p2, p2, Ll/y0x;->a:Lcom/p1/mobile/putong/data/User;

    .line 10
    .line 11
    iget-object p2, p2, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 12
    .line 13
    iget-object p2, p2, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 14
    .line 15
    iget-object p2, p2, Lcom/p1/mobile/putong/data/Extensions;->marriage:Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;

    .line 16
    .line 17
    iget-object v0, p2, Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;->mateStatus:Ljava/util/List;

    .line 18
    .line 19
    iput-object v0, p1, Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;->mateStatus:Ljava/util/List;

    .line 20
    .line 21
    iget-object v0, p2, Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;->mateQualification:Ljava/util/List;

    .line 22
    .line 23
    iput-object v0, p1, Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;->mateQualification:Ljava/util/List;

    .line 24
    .line 25
    iget-object v0, p2, Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;->mateIncome:Ljava/util/List;

    .line 26
    .line 27
    iput-object v0, p1, Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;->mateIncome:Ljava/util/List;

    .line 28
    .line 29
    iget-object v0, p2, Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;->mateAddress:Ljava/util/List;

    .line 30
    .line 31
    iput-object v0, p1, Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;->mateAddress:Ljava/util/List;

    .line 32
    .line 33
    iget-object v0, p2, Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;->mateAge:Ljava/util/List;

    .line 34
    .line 35
    iput-object v0, p1, Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;->mateAge:Ljava/util/List;

    .line 36
    .line 37
    iget-object p2, p2, Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;->mateHeight:Ljava/util/List;

    .line 38
    .line 39
    iput-object p2, p1, Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;->mateHeight:Ljava/util/List;

    .line 40
    .line 41
    iget-object p0, p0, Ll/a1x;->m:Lv/VEditText;

    .line 42
    .line 43
    invoke-virtual {p0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    filled-new-array {p0}, [Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    invoke-static {p0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 60
    .line 61
    .line 62
    move-result-object p0

    .line 63
    iput-object p0, p1, Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;->mateDescription:Ljava/util/List;

    .line 64
    .line 65
    return-void
.end method

.method public i(Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;Lcom/p1/mobile/putong/data/User;)V
    .locals 5

    .line 1
    iget-object p1, p0, Ll/a1x;->d:Lv/VText;

    .line 2
    .line 3
    const/4 v0, 0x3

    .line 4
    invoke-static {v0}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    const/4 v1, 0x1

    .line 9
    invoke-virtual {p1, v0, v1}, Landroidx/appcompat/widget/AppCompatTextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 10
    .line 11
    .line 12
    iget-object p1, p0, Ll/a1x;->e:Lv/VText;

    .line 13
    .line 14
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    const-string v2, "\u5979"

    .line 19
    .line 20
    const-string v3, "\u4ed6"

    .line 21
    .line 22
    if-eqz v0, :cond_0

    .line 23
    .line 24
    move-object v0, v3

    .line 25
    goto :goto_0

    .line 26
    :cond_0
    move-object v0, v2

    .line 27
    :goto_0
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    const-string v4, "\u5173\u4e8e\u7406\u60f3\u4f34\u4fa3\uff0c\u6211\u5e0c\u671b%s...\n(\u9884\u671f\u8fc7\u9ad8\uff0c\u53ef\u80fd\u65e0\u6cd5\u5339\u914d\u5230\u5408\u9002\u7684\u4eba)"

    .line 32
    .line 33
    invoke-static {v4, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 38
    .line 39
    .line 40
    iget-object p1, p0, Ll/a1x;->m:Lv/VEditText;

    .line 41
    .line 42
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 43
    .line 44
    .line 45
    move-result p2

    .line 46
    if-eqz p2, :cond_1

    .line 47
    .line 48
    move-object v2, v3

    .line 49
    :cond_1
    filled-new-array {v2}, [Ljava/lang/Object;

    .line 50
    .line 51
    .line 52
    move-result-object p2

    .line 53
    const-string v0, "\u6211\u5e0c\u671b%s..."

    .line 54
    .line 55
    invoke-static {v0, p2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object p2

    .line 59
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setHint(Ljava/lang/CharSequence;)V

    .line 60
    .line 61
    .line 62
    new-instance p1, Ljava/util/ArrayList;

    .line 63
    .line 64
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 65
    .line 66
    .line 67
    iput-object p1, p0, Ll/a1x;->q:Ljava/util/List;

    .line 68
    .line 69
    iget-object p2, p0, Ll/a1x;->f:Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemView;

    .line 70
    .line 71
    sget-object v0, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;->MATE_STATUS:Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;

    .line 72
    .line 73
    invoke-virtual {p2, v0}, Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemView;->h0(Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;)Ll/oyl;

    .line 74
    .line 75
    .line 76
    move-result-object p2

    .line 77
    invoke-interface {p1, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 78
    .line 79
    .line 80
    iget-object p1, p0, Ll/a1x;->q:Ljava/util/List;

    .line 81
    .line 82
    iget-object p2, p0, Ll/a1x;->g:Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemView;

    .line 83
    .line 84
    sget-object v0, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;->MATE_AGE:Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;

    .line 85
    .line 86
    invoke-virtual {p2, v0}, Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemView;->h0(Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;)Ll/oyl;

    .line 87
    .line 88
    .line 89
    move-result-object p2

    .line 90
    invoke-interface {p1, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 91
    .line 92
    .line 93
    iget-object p1, p0, Ll/a1x;->q:Ljava/util/List;

    .line 94
    .line 95
    iget-object p2, p0, Ll/a1x;->h:Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemView;

    .line 96
    .line 97
    sget-object v0, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;->MATE_QUALIFICATIONS:Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;

    .line 98
    .line 99
    invoke-virtual {p2, v0}, Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemView;->h0(Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;)Ll/oyl;

    .line 100
    .line 101
    .line 102
    move-result-object p2

    .line 103
    invoke-interface {p1, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 104
    .line 105
    .line 106
    iget-object p1, p0, Ll/a1x;->q:Ljava/util/List;

    .line 107
    .line 108
    iget-object p2, p0, Ll/a1x;->i:Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemView;

    .line 109
    .line 110
    sget-object v0, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;->MATE_HEIGHT:Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;

    .line 111
    .line 112
    invoke-virtual {p2, v0}, Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemView;->h0(Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;)Ll/oyl;

    .line 113
    .line 114
    .line 115
    move-result-object p2

    .line 116
    invoke-interface {p1, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 117
    .line 118
    .line 119
    iget-object p1, p0, Ll/a1x;->q:Ljava/util/List;

    .line 120
    .line 121
    iget-object p2, p0, Ll/a1x;->j:Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemView;

    .line 122
    .line 123
    sget-object v0, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;->MATE_INCOME:Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;

    .line 124
    .line 125
    invoke-virtual {p2, v0}, Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemView;->h0(Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;)Ll/oyl;

    .line 126
    .line 127
    .line 128
    move-result-object p2

    .line 129
    invoke-interface {p1, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 130
    .line 131
    .line 132
    iget-object p1, p0, Ll/a1x;->q:Ljava/util/List;

    .line 133
    .line 134
    iget-object p2, p0, Ll/a1x;->k:Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemView;

    .line 135
    .line 136
    sget-object v0, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;->MATE_ADDRESS:Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;

    .line 137
    .line 138
    invoke-virtual {p2, v0}, Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemView;->h0(Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;)Ll/oyl;

    .line 139
    .line 140
    .line 141
    move-result-object p2

    .line 142
    invoke-interface {p1, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 143
    .line 144
    .line 145
    iget-object p1, p0, Ll/a1x;->q:Ljava/util/List;

    .line 146
    .line 147
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 148
    .line 149
    .line 150
    move-result-object p1

    .line 151
    :cond_2
    :goto_1
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 152
    .line 153
    .line 154
    move-result p2

    .line 155
    if-eqz p2, :cond_3

    .line 156
    .line 157
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 158
    .line 159
    .line 160
    move-result-object p2

    .line 161
    check-cast p2, Ll/oyl;

    .line 162
    .line 163
    invoke-interface {p2}, Ll/oyl;->f()Z

    .line 164
    .line 165
    .line 166
    move-result v0

    .line 167
    if-eqz v0, :cond_2

    .line 168
    .line 169
    invoke-interface {p2}, Ll/oyl;->getClickView()Landroid/view/View;

    .line 170
    .line 171
    .line 172
    move-result-object v0

    .line 173
    new-instance v2, Ll/z0x;

    .line 174
    .line 175
    invoke-direct {v2, p0, p2}, Ll/z0x;-><init>(Ll/a1x;Ll/oyl;)V

    .line 176
    .line 177
    .line 178
    invoke-static {v0, v2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 179
    .line 180
    .line 181
    goto :goto_1

    .line 182
    :cond_3
    iget-object p1, p0, Ll/a1x;->c:Lv/VScroll;

    .line 183
    .line 184
    new-instance p2, Ll/a1x$a;

    .line 185
    .line 186
    invoke-direct {p2, p0}, Ll/a1x$a;-><init>(Ll/a1x;)V

    .line 187
    .line 188
    .line 189
    invoke-static {p1, p2}, Ll/ltf0;->c(Landroid/view/View;Ll/ltf0$a;)V

    .line 190
    .line 191
    .line 192
    iget-object p1, p0, Ll/a1x;->m:Lv/VEditText;

    .line 193
    .line 194
    new-instance p2, Ll/a1x$b;

    .line 195
    .line 196
    invoke-direct {p2, p0}, Ll/a1x$b;-><init>(Ll/a1x;)V

    .line 197
    .line 198
    .line 199
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 200
    .line 201
    .line 202
    iget-object p1, p0, Ll/a1x;->p:Ll/y0x;

    .line 203
    .line 204
    iget-object p1, p1, Ll/y0x;->a:Lcom/p1/mobile/putong/data/User;

    .line 205
    .line 206
    invoke-virtual {p0, v1, p1}, Ll/a1x;->q(ZLcom/p1/mobile/putong/data/User;)V

    .line 207
    .line 208
    .line 209
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/y0x;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/a1x;->m(Ll/y0x;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/a1x;->l(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public l(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/b1x;->b(Ll/a1x;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public m(Ll/y0x;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/a1x;->p:Ll/y0x;

    .line 2
    .line 3
    return-void
.end method

.method public n()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/a1x;->m:Lv/VEditText;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public q(ZLcom/p1/mobile/putong/data/User;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/a1x;->q:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    if-eqz v1, :cond_0

    .line 12
    .line 13
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    check-cast v1, Ll/oyl;

    .line 18
    .line 19
    invoke-interface {v1, p2}, Ll/oyl;->d(Lcom/p1/mobile/putong/data/User;)V

    .line 20
    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    if-eqz p1, :cond_1

    .line 24
    .line 25
    iget-object p1, p0, Ll/a1x;->m:Lv/VEditText;

    .line 26
    .line 27
    iget-object v0, p2, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 28
    .line 29
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 30
    .line 31
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Extensions;->marriage:Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;

    .line 32
    .line 33
    iget-object v0, v0, Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;->mateDescription:Ljava/util/List;

    .line 34
    .line 35
    const/4 v1, 0x0

    .line 36
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    check-cast v0, Ljava/lang/CharSequence;

    .line 41
    .line 42
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 43
    .line 44
    .line 45
    iget-object p1, p0, Ll/a1x;->m:Lv/VEditText;

    .line 46
    .line 47
    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    invoke-interface {v0}, Ljava/lang/CharSequence;->length()I

    .line 52
    .line 53
    .line 54
    move-result v0

    .line 55
    invoke-virtual {p1, v0}, Landroid/widget/EditText;->setSelection(I)V

    .line 56
    .line 57
    .line 58
    iget-object p1, p2, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 59
    .line 60
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 61
    .line 62
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Extensions;->marriage:Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;

    .line 63
    .line 64
    iget-object p1, p1, Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;->mateDescription:Ljava/util/List;

    .line 65
    .line 66
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 67
    .line 68
    .line 69
    move-result-object p1

    .line 70
    check-cast p1, Ljava/lang/String;

    .line 71
    .line 72
    invoke-virtual {p0, p1}, Ll/a1x;->s(Ljava/lang/String;)V

    .line 73
    .line 74
    .line 75
    :cond_1
    return-void
.end method

.method public final s(Ljava/lang/String;)V
    .locals 0

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    const-string p1, ""

    .line 4
    .line 5
    :cond_0
    iget-object p0, p0, Ll/a1x;->n:Landroid/widget/TextView;

    .line 6
    .line 7
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    rsub-int p1, p1, 0x12c

    .line 12
    .line 13
    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

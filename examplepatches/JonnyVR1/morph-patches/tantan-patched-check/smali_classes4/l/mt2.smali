.class public Ll/mt2;
.super Ll/f6l;
.source "SourceFile"


# instance fields
.field public f:Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedBasicInfoRootLayout;

.field public g:Lv/VLinear;

.field public h:Lcom/p1/mobile/putong/core/ui/VText_Medium;

.field public i:Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/f6l;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public B(Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;Lcom/p1/mobile/putong/data/User;III)V
    .locals 0

    .line 1
    new-instance p1, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, p2}, Ll/mt2;->I(Lcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/putong/core/data/LabelData;

    .line 7
    .line 8
    .line 9
    move-result-object p3

    .line 10
    invoke-static {p3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 11
    .line 12
    .line 13
    move-result p4

    .line 14
    if-eqz p4, :cond_0

    .line 15
    .line 16
    invoke-interface {p1, p3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    :cond_0
    invoke-virtual {p0, p2}, Ll/mt2;->H(Lcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/putong/core/data/LabelData;

    .line 20
    .line 21
    .line 22
    move-result-object p3

    .line 23
    invoke-static {p3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    move-result p4

    .line 27
    if-eqz p4, :cond_1

    .line 28
    .line 29
    invoke-interface {p1, p3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 30
    .line 31
    .line 32
    :cond_1
    invoke-virtual {p0, p2}, Ll/mt2;->M(Lcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/putong/core/data/LabelData;

    .line 33
    .line 34
    .line 35
    move-result-object p3

    .line 36
    invoke-static {p3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 37
    .line 38
    .line 39
    move-result p4

    .line 40
    if-eqz p4, :cond_2

    .line 41
    .line 42
    invoke-interface {p1, p3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 43
    .line 44
    .line 45
    :cond_2
    invoke-virtual {p0, p2}, Ll/mt2;->E(Lcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/putong/core/data/LabelData;

    .line 46
    .line 47
    .line 48
    move-result-object p3

    .line 49
    invoke-static {p3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 50
    .line 51
    .line 52
    move-result p4

    .line 53
    if-eqz p4, :cond_3

    .line 54
    .line 55
    invoke-interface {p1, p3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 56
    .line 57
    .line 58
    :cond_3
    invoke-virtual {p0, p2}, Ll/mt2;->Q(Lcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/putong/core/data/LabelData;

    .line 59
    .line 60
    .line 61
    move-result-object p3

    .line 62
    invoke-static {p3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 63
    .line 64
    .line 65
    move-result p4

    .line 66
    if-eqz p4, :cond_4

    .line 67
    .line 68
    invoke-interface {p1, p3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 69
    .line 70
    .line 71
    :cond_4
    invoke-virtual {p0, p2}, Ll/mt2;->N(Lcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/putong/core/data/LabelData;

    .line 72
    .line 73
    .line 74
    move-result-object p3

    .line 75
    invoke-static {p3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 76
    .line 77
    .line 78
    move-result p4

    .line 79
    if-eqz p4, :cond_5

    .line 80
    .line 81
    invoke-interface {p1, p3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 82
    .line 83
    .line 84
    goto :goto_0

    .line 85
    :cond_5
    invoke-virtual {p0, p2}, Ll/mt2;->L(Lcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/putong/core/data/LabelData;

    .line 86
    .line 87
    .line 88
    move-result-object p3

    .line 89
    invoke-static {p3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 90
    .line 91
    .line 92
    move-result p4

    .line 93
    if-eqz p4, :cond_6

    .line 94
    .line 95
    invoke-interface {p1, p3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 96
    .line 97
    .line 98
    :cond_6
    :goto_0
    invoke-virtual {p0, p2}, Ll/mt2;->F(Lcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/putong/core/data/LabelData;

    .line 99
    .line 100
    .line 101
    move-result-object p3

    .line 102
    invoke-static {p3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 103
    .line 104
    .line 105
    move-result p4

    .line 106
    if-eqz p4, :cond_7

    .line 107
    .line 108
    invoke-interface {p1, p3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 109
    .line 110
    .line 111
    :cond_7
    invoke-virtual {p0, p2}, Ll/mt2;->G(Lcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/putong/core/data/LabelData;

    .line 112
    .line 113
    .line 114
    move-result-object p3

    .line 115
    invoke-static {p3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 116
    .line 117
    .line 118
    move-result p4

    .line 119
    if-eqz p4, :cond_8

    .line 120
    .line 121
    invoke-interface {p1, p3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 122
    .line 123
    .line 124
    :cond_8
    invoke-virtual {p0, p2}, Ll/mt2;->P(Lcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/putong/core/data/LabelData;

    .line 125
    .line 126
    .line 127
    move-result-object p3

    .line 128
    invoke-static {p3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 129
    .line 130
    .line 131
    move-result p4

    .line 132
    if-eqz p4, :cond_9

    .line 133
    .line 134
    invoke-interface {p1, p3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 135
    .line 136
    .line 137
    :cond_9
    invoke-virtual {p0, p2}, Ll/mt2;->K(Lcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/putong/core/data/LabelData;

    .line 138
    .line 139
    .line 140
    move-result-object p3

    .line 141
    invoke-static {p3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 142
    .line 143
    .line 144
    move-result p4

    .line 145
    if-eqz p4, :cond_a

    .line 146
    .line 147
    invoke-interface {p1, p3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 148
    .line 149
    .line 150
    :cond_a
    invoke-virtual {p0, p2}, Ll/mt2;->J(Lcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/putong/core/data/LabelData;

    .line 151
    .line 152
    .line 153
    move-result-object p2

    .line 154
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 155
    .line 156
    .line 157
    move-result p3

    .line 158
    if-eqz p3, :cond_b

    .line 159
    .line 160
    invoke-interface {p1, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 161
    .line 162
    .line 163
    :cond_b
    iget-object p2, p0, Ll/mt2;->i:Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView;

    .line 164
    .line 165
    invoke-virtual {p2, p1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView;->d(Ljava/util/List;)V

    .line 166
    .line 167
    .line 168
    invoke-virtual {p0}, Ll/dmf;->m()Landroid/view/View;

    .line 169
    .line 170
    .line 171
    move-result-object p0

    .line 172
    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    .line 173
    .line 174
    .line 175
    move-result p1

    .line 176
    xor-int/lit8 p1, p1, 0x1

    .line 177
    .line 178
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 179
    .line 180
    .line 181
    return-void
.end method

.method public final D(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/nt2;->a(Ll/mt2;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public E(Lcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/putong/core/data/LabelData;
    .locals 2

    .line 1
    invoke-static {}, Ll/r43;->b()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    iget-object p0, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Extensions;->physical:Lcom/p1/mobile/putong/data/Physical;

    .line 12
    .line 13
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Physical;->bloodType:Ljava/util/List;

    .line 14
    .line 15
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    if-nez p0, :cond_0

    .line 20
    .line 21
    iget-object p0, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 22
    .line 23
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 24
    .line 25
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Extensions;->physical:Lcom/p1/mobile/putong/data/Physical;

    .line 26
    .line 27
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Physical;->bloodType:Ljava/util/List;

    .line 28
    .line 29
    const/4 v0, 0x0

    .line 30
    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    check-cast p0, Lcom/p1/mobile/putong/data/BloodType;

    .line 35
    .line 36
    const-string v1, "unknown_"

    .line 37
    .line 38
    invoke-static {p0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 39
    .line 40
    .line 41
    move-result p0

    .line 42
    if-nez p0, :cond_0

    .line 43
    .line 44
    invoke-static {}, Lcom/p1/mobile/putong/core/data/LabelData;->new_()Lcom/p1/mobile/putong/core/data/LabelData;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 49
    .line 50
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 51
    .line 52
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Extensions;->physical:Lcom/p1/mobile/putong/data/Physical;

    .line 53
    .line 54
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Physical;->bloodType:Ljava/util/List;

    .line 55
    .line 56
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 57
    .line 58
    .line 59
    move-result-object p1

    .line 60
    check-cast p1, Lcom/p1/mobile/putong/data/BloodType;

    .line 61
    .line 62
    invoke-static {p1}, Ll/r43;->a(Lcom/p1/mobile/putong/data/BloodType;)Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object p1

    .line 66
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/LabelData;->name:Ljava/lang/String;

    .line 67
    .line 68
    sget p1, Ll/dbc0;->It:I

    .line 69
    .line 70
    iput p1, p0, Lcom/p1/mobile/putong/core/data/LabelData;->iconDrawableRes:I

    .line 71
    .line 72
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/data/LabelData;->highlight:Z

    .line 73
    .line 74
    return-object p0

    .line 75
    :cond_0
    const/4 p0, 0x0

    .line 76
    return-object p0
.end method

.method public F(Lcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/putong/core/data/LabelData;
    .locals 1

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 2
    .line 3
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Profile;->studies:Lcom/p1/mobile/putong/data/Studies;

    .line 4
    .line 5
    iget-boolean v0, v0, Lcom/p1/mobile/putong/data/Studies;->active:Z

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Profile;->work:Lcom/p1/mobile/putong/data/Work;

    .line 10
    .line 11
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Work;->company:Ljava/lang/String;

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    const-string p1, ""

    .line 15
    .line 16
    :goto_0
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-nez v0, :cond_2

    .line 21
    .line 22
    invoke-virtual {p0, p1}, Ll/mt2;->R(Ljava/lang/String;)Z

    .line 23
    .line 24
    .line 25
    move-result p0

    .line 26
    if-nez p0, :cond_1

    .line 27
    .line 28
    goto :goto_1

    .line 29
    :cond_1
    invoke-static {}, Lcom/p1/mobile/putong/core/data/LabelData;->new_()Lcom/p1/mobile/putong/core/data/LabelData;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/LabelData;->name:Ljava/lang/String;

    .line 34
    .line 35
    sget p1, Ll/dbc0;->Jt:I

    .line 36
    .line 37
    iput p1, p0, Lcom/p1/mobile/putong/core/data/LabelData;->iconDrawableRes:I

    .line 38
    .line 39
    const/4 p1, 0x0

    .line 40
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/data/LabelData;->highlight:Z

    .line 41
    .line 42
    return-object p0

    .line 43
    :cond_2
    :goto_1
    const/4 p0, 0x0

    .line 44
    return-object p0
.end method

.method public G(Lcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/putong/core/data/LabelData;
    .locals 2

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Profile;->studies:Lcom/p1/mobile/putong/data/Studies;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Studies;->qualification:Lcom/p1/mobile/putong/data/QualificationType;

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    const-string v1, "unknown_"

    .line 12
    .line 13
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_1

    .line 18
    .line 19
    :cond_0
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 20
    .line 21
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Profile;->school:Ljava/lang/String;

    .line 22
    .line 23
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-nez v0, :cond_2

    .line 28
    .line 29
    :cond_1
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 30
    .line 31
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Profile;->studies:Lcom/p1/mobile/putong/data/Studies;

    .line 32
    .line 33
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Studies;->qualification:Lcom/p1/mobile/putong/data/QualificationType;

    .line 34
    .line 35
    invoke-virtual {p0, p1}, Ll/mt2;->O(Lcom/p1/mobile/putong/data/QualificationType;)Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 40
    .line 41
    .line 42
    move-result p1

    .line 43
    if-nez p1, :cond_2

    .line 44
    .line 45
    invoke-static {}, Lcom/p1/mobile/putong/core/data/LabelData;->new_()Lcom/p1/mobile/putong/core/data/LabelData;

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/LabelData;->name:Ljava/lang/String;

    .line 50
    .line 51
    sget p0, Ll/dbc0;->St:I

    .line 52
    .line 53
    iput p0, p1, Lcom/p1/mobile/putong/core/data/LabelData;->iconDrawableRes:I

    .line 54
    .line 55
    const/4 p0, 0x0

    .line 56
    iput-boolean p0, p1, Lcom/p1/mobile/putong/core/data/LabelData;->highlight:Z

    .line 57
    .line 58
    return-object p1

    .line 59
    :cond_2
    const/4 p0, 0x0

    .line 60
    return-object p0
.end method

.method public H(Lcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/putong/core/data/LabelData;
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/ab/IntlCountryCodeController;->j()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    iget-object p0, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    .line 12
    .line 13
    iget-object p0, p0, Lcom/p1/mobile/putong/data/ProfileExtensionBasic;->ethnicity:Ljava/util/List;

    .line 14
    .line 15
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    if-nez p0, :cond_0

    .line 20
    .line 21
    invoke-static {}, Lcom/p1/mobile/putong/core/data/LabelData;->new_()Lcom/p1/mobile/putong/core/data/LabelData;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    sget-object v0, Ll/rpa0;->INSTANCE:Ll/rpa0;

    .line 26
    .line 27
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 28
    .line 29
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 30
    .line 31
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    .line 32
    .line 33
    iget-object p1, p1, Lcom/p1/mobile/putong/data/ProfileExtensionBasic;->ethnicity:Ljava/util/List;

    .line 34
    .line 35
    invoke-virtual {v0, p1}, Ll/rpa0;->d(Ljava/util/List;)Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/LabelData;->name:Ljava/lang/String;

    .line 40
    .line 41
    sget p1, Ll/dbc0;->Kt:I

    .line 42
    .line 43
    iput p1, p0, Lcom/p1/mobile/putong/core/data/LabelData;->iconDrawableRes:I

    .line 44
    .line 45
    const/4 p1, 0x0

    .line 46
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/data/LabelData;->highlight:Z

    .line 47
    .line 48
    return-object p0

    .line 49
    :cond_0
    const/4 p0, 0x0

    .line 50
    return-object p0
.end method

.method public I(Lcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/putong/core/data/LabelData;
    .locals 3
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    if-nez p0, :cond_0

    .line 5
    .line 6
    return-object v0

    .line 7
    :cond_0
    sget-object v1, Ll/uqb0;->b0:Ll/sre0;

    .line 8
    .line 9
    iget-object v1, v1, Ll/sre0;->a:Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/Settings;->getSettingGroup()Lcom/p1/mobile/putong/data/SettingGroups;

    .line 12
    .line 13
    .line 14
    move-result-object v2

    .line 15
    invoke-interface {v1, v2}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->rq(Lcom/p1/mobile/putong/data/SettingGroups;)Z

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    if-nez v1, :cond_1

    .line 20
    .line 21
    return-object v0

    .line 22
    :cond_1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/Settings;->getSettingGroup()Lcom/p1/mobile/putong/data/SettingGroups;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    iget-object p0, p0, Lcom/p1/mobile/putong/data/SettingGroups;->gender:Lcom/p1/mobile/putong/data/IntlMoreGender;

    .line 27
    .line 28
    if-eqz p0, :cond_a

    .line 29
    .line 30
    iget-object v2, p0, Lcom/p1/mobile/putong/data/IntlMoreGender;->showOnProfile:Ljava/lang/Boolean;

    .line 31
    .line 32
    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    .line 33
    .line 34
    .line 35
    move-result v2

    .line 36
    if-nez v2, :cond_2

    .line 37
    .line 38
    goto :goto_3

    .line 39
    :cond_2
    iget-object v2, p0, Lcom/p1/mobile/putong/data/IntlMoreGender;->newGender:Lcom/p1/mobile/putong/data/IntlGender;

    .line 40
    .line 41
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 42
    .line 43
    if-eqz v1, :cond_3

    .line 44
    .line 45
    if-nez v2, :cond_4

    .line 46
    .line 47
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object p1

    .line 51
    invoke-static {p1}, Lcom/p1/mobile/putong/data/IntlGender;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/IntlGender;

    .line 52
    .line 53
    .line 54
    move-result-object v2

    .line 55
    goto :goto_0

    .line 56
    :cond_3
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object p1

    .line 60
    invoke-static {p1}, Lcom/p1/mobile/putong/data/IntlGender;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/IntlGender;

    .line 61
    .line 62
    .line 63
    move-result-object v2

    .line 64
    :cond_4
    :goto_0
    if-eqz v1, :cond_5

    .line 65
    .line 66
    iget-object p0, p0, Lcom/p1/mobile/putong/data/IntlMoreGender;->subGender:Ljava/lang/String;

    .line 67
    .line 68
    goto :goto_1

    .line 69
    :cond_5
    move-object p0, v0

    .line 70
    :goto_1
    if-nez p0, :cond_6

    .line 71
    .line 72
    const-string p0, ""

    .line 73
    .line 74
    :cond_6
    sget-object p1, Ll/uqb0;->b0:Ll/sre0;

    .line 75
    .line 76
    iget-object p1, p1, Ll/sre0;->a:Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 77
    .line 78
    invoke-interface {p1, v2, p0}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->Lr(Lcom/p1/mobile/putong/data/IntlGender;Ljava/lang/String;)Ljava/lang/String;

    .line 79
    .line 80
    .line 81
    move-result-object p0

    .line 82
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 83
    .line 84
    .line 85
    move-result p1

    .line 86
    if-eqz p1, :cond_7

    .line 87
    .line 88
    return-object v0

    .line 89
    :cond_7
    invoke-static {}, Lcom/p1/mobile/putong/core/data/LabelData;->new_()Lcom/p1/mobile/putong/core/data/LabelData;

    .line 90
    .line 91
    .line 92
    move-result-object p1

    .line 93
    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/LabelData;->name:Ljava/lang/String;

    .line 94
    .line 95
    sget p0, Ll/dbc0;->Lt:I

    .line 96
    .line 97
    const-string v0, "male"

    .line 98
    .line 99
    invoke-static {v0}, Lcom/p1/mobile/putong/data/IntlGender;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/IntlGender;

    .line 100
    .line 101
    .line 102
    move-result-object v0

    .line 103
    invoke-virtual {v2, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Ljava/lang/Object;)Z

    .line 104
    .line 105
    .line 106
    move-result v0

    .line 107
    if-eqz v0, :cond_8

    .line 108
    .line 109
    sget p0, Ll/dbc0;->Nt:I

    .line 110
    .line 111
    goto :goto_2

    .line 112
    :cond_8
    const-string v0, "female"

    .line 113
    .line 114
    invoke-static {v0}, Lcom/p1/mobile/putong/data/IntlGender;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/IntlGender;

    .line 115
    .line 116
    .line 117
    move-result-object v0

    .line 118
    invoke-virtual {v2, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Ljava/lang/Object;)Z

    .line 119
    .line 120
    .line 121
    move-result v0

    .line 122
    if-eqz v0, :cond_9

    .line 123
    .line 124
    sget p0, Ll/dbc0;->Mt:I

    .line 125
    .line 126
    :cond_9
    :goto_2
    iput p0, p1, Lcom/p1/mobile/putong/core/data/LabelData;->iconDrawableRes:I

    .line 127
    .line 128
    const/4 p0, 0x0

    .line 129
    iput-boolean p0, p1, Lcom/p1/mobile/putong/core/data/LabelData;->highlight:Z

    .line 130
    .line 131
    return-object p1

    .line 132
    :cond_a
    :goto_3
    return-object v0
.end method

.method public J(Lcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/putong/core/data/LabelData;
    .locals 3

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Profile;->hangouts:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_1

    .line 10
    .line 11
    invoke-virtual {p0, p1}, Ll/mt2;->R(Ljava/lang/String;)Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    if-nez p0, :cond_0

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/core/data/LabelData;->new_()Lcom/p1/mobile/putong/core/data/LabelData;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    new-instance v0, Ljava/lang/StringBuilder;

    .line 23
    .line 24
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 25
    .line 26
    .line 27
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 28
    .line 29
    sget v2, Lcom/p1/mobile/putong/core/R$string;->Uf:I

    .line 30
    .line 31
    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    const-string v1, " "

    .line 39
    .line 40
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 44
    .line 45
    .line 46
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object p1

    .line 50
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/LabelData;->name:Ljava/lang/String;

    .line 51
    .line 52
    sget p1, Ll/dbc0;->Ot:I

    .line 53
    .line 54
    iput p1, p0, Lcom/p1/mobile/putong/core/data/LabelData;->iconDrawableRes:I

    .line 55
    .line 56
    const/4 p1, 0x0

    .line 57
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/data/LabelData;->highlight:Z

    .line 58
    .line 59
    return-object p0

    .line 60
    :cond_1
    :goto_0
    const/4 p0, 0x0

    .line 61
    return-object p0
.end method

.method public K(Lcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/putong/core/data/LabelData;
    .locals 1

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Profile;->hometown:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_1

    .line 10
    .line 11
    invoke-virtual {p0, p1}, Ll/mt2;->R(Ljava/lang/String;)Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    if-nez p0, :cond_0

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/core/data/LabelData;->new_()Lcom/p1/mobile/putong/core/data/LabelData;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/LabelData;->name:Ljava/lang/String;

    .line 23
    .line 24
    sget p1, Ll/dbc0;->Pt:I

    .line 25
    .line 26
    iput p1, p0, Lcom/p1/mobile/putong/core/data/LabelData;->iconDrawableRes:I

    .line 27
    .line 28
    const/4 p1, 0x0

    .line 29
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/data/LabelData;->highlight:Z

    .line 30
    .line 31
    return-object p0

    .line 32
    :cond_1
    :goto_0
    const/4 p0, 0x0

    .line 33
    return-object p0
.end method

.method public L(Lcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/putong/core/data/LabelData;
    .locals 2

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Profile;->work:Lcom/p1/mobile/putong/data/Work;

    .line 4
    .line 5
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Work;->industry:Ljava/lang/String;

    .line 6
    .line 7
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Work;->department:Ljava/lang/String;

    .line 8
    .line 9
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    if-nez v1, :cond_0

    .line 14
    .line 15
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    if-nez v1, :cond_0

    .line 20
    .line 21
    new-instance v1, Ljava/lang/StringBuilder;

    .line 22
    .line 23
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 24
    .line 25
    .line 26
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    const-string v0, "\u00b7"

    .line 30
    .line 31
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 35
    .line 36
    .line 37
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    goto :goto_0

    .line 42
    :cond_0
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 43
    .line 44
    .line 45
    move-result v1

    .line 46
    if-nez v1, :cond_1

    .line 47
    .line 48
    goto :goto_0

    .line 49
    :cond_1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 50
    .line 51
    .line 52
    move-result v0

    .line 53
    if-nez v0, :cond_2

    .line 54
    .line 55
    move-object v0, p1

    .line 56
    goto :goto_0

    .line 57
    :cond_2
    const-string v0, ""

    .line 58
    .line 59
    :goto_0
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 60
    .line 61
    .line 62
    move-result p1

    .line 63
    if-nez p1, :cond_4

    .line 64
    .line 65
    invoke-virtual {p0, v0}, Ll/mt2;->R(Ljava/lang/String;)Z

    .line 66
    .line 67
    .line 68
    move-result p0

    .line 69
    if-nez p0, :cond_3

    .line 70
    .line 71
    goto :goto_1

    .line 72
    :cond_3
    invoke-static {}, Lcom/p1/mobile/putong/core/data/LabelData;->new_()Lcom/p1/mobile/putong/core/data/LabelData;

    .line 73
    .line 74
    .line 75
    move-result-object p0

    .line 76
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/LabelData;->name:Ljava/lang/String;

    .line 77
    .line 78
    sget p1, Ll/dbc0;->Qt:I

    .line 79
    .line 80
    iput p1, p0, Lcom/p1/mobile/putong/core/data/LabelData;->iconDrawableRes:I

    .line 81
    .line 82
    const/4 p1, 0x0

    .line 83
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/data/LabelData;->highlight:Z

    .line 84
    .line 85
    return-object p0

    .line 86
    :cond_4
    :goto_1
    const/4 p0, 0x0

    .line 87
    return-object p0
.end method

.method public M(Lcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/putong/core/data/LabelData;
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/ab/IntlCountryCodeController;->j()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    iget-object p0, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    .line 12
    .line 13
    iget-object p0, p0, Lcom/p1/mobile/putong/data/ProfileExtensionBasic;->language:Ljava/util/List;

    .line 14
    .line 15
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    if-nez p0, :cond_0

    .line 20
    .line 21
    invoke-static {}, Lcom/p1/mobile/putong/core/data/LabelData;->new_()Lcom/p1/mobile/putong/core/data/LabelData;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    sget-object v0, Ll/rpa0;->INSTANCE:Ll/rpa0;

    .line 26
    .line 27
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 28
    .line 29
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 30
    .line 31
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    .line 32
    .line 33
    iget-object p1, p1, Lcom/p1/mobile/putong/data/ProfileExtensionBasic;->language:Ljava/util/List;

    .line 34
    .line 35
    invoke-virtual {v0, p1}, Ll/rpa0;->e(Ljava/util/List;)Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/LabelData;->name:Ljava/lang/String;

    .line 40
    .line 41
    sget p1, Ll/dbc0;->Rt:I

    .line 42
    .line 43
    iput p1, p0, Lcom/p1/mobile/putong/core/data/LabelData;->iconDrawableRes:I

    .line 44
    .line 45
    const/4 p1, 0x0

    .line 46
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/data/LabelData;->highlight:Z

    .line 47
    .line 48
    return-object p0

    .line 49
    :cond_0
    const/4 p0, 0x0

    .line 50
    return-object p0
.end method

.method public N(Lcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/putong/core/data/LabelData;
    .locals 3
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Profile;->studies:Lcom/p1/mobile/putong/data/Studies;

    .line 4
    .line 5
    iget-boolean v0, p1, Lcom/p1/mobile/putong/data/Studies;->active:Z

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x0

    .line 10
    return-object p0

    .line 11
    :cond_0
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Studies;->major:Ljava/lang/String;

    .line 12
    .line 13
    invoke-static {}, Lcom/p1/mobile/putong/core/data/LabelData;->new_()Lcom/p1/mobile/putong/core/data/LabelData;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 18
    .line 19
    sget v2, Lcom/p1/mobile/putong/core/R$string;->tl:I

    .line 20
    .line 21
    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/LabelData;->name:Ljava/lang/String;

    .line 26
    .line 27
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 28
    .line 29
    .line 30
    move-result v1

    .line 31
    if-nez v1, :cond_1

    .line 32
    .line 33
    invoke-virtual {p0, p1}, Ll/mt2;->R(Ljava/lang/String;)Z

    .line 34
    .line 35
    .line 36
    move-result p0

    .line 37
    if-eqz p0, :cond_1

    .line 38
    .line 39
    new-instance p0, Ljava/lang/StringBuilder;

    .line 40
    .line 41
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 42
    .line 43
    .line 44
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 45
    .line 46
    sget v2, Lcom/p1/mobile/putong/core/R$string;->tl:I

    .line 47
    .line 48
    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object v1

    .line 52
    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 53
    .line 54
    .line 55
    const-string v1, "\u00b7"

    .line 56
    .line 57
    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 58
    .line 59
    .line 60
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 61
    .line 62
    .line 63
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 64
    .line 65
    .line 66
    move-result-object p0

    .line 67
    iput-object p0, v0, Lcom/p1/mobile/putong/core/data/LabelData;->name:Ljava/lang/String;

    .line 68
    .line 69
    :cond_1
    sget p0, Ll/dbc0;->Qt:I

    .line 70
    .line 71
    iput p0, v0, Lcom/p1/mobile/putong/core/data/LabelData;->iconDrawableRes:I

    .line 72
    .line 73
    const/4 p0, 0x0

    .line 74
    iput-boolean p0, v0, Lcom/p1/mobile/putong/core/data/LabelData;->highlight:Z

    .line 75
    .line 76
    return-object v0
.end method

.method public O(Lcom/p1/mobile/putong/data/QualificationType;)Ljava/lang/String;
    .locals 1

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Ljava/lang/String;->hashCode()I

    .line 9
    .line 10
    .line 11
    move-result p1

    .line 12
    const/4 v0, -0x1

    .line 13
    sparse-switch p1, :sswitch_data_0

    .line 14
    .line 15
    .line 16
    goto :goto_0

    .line 17
    :sswitch_0
    const-string p1, "DOCTOR"

    .line 18
    .line 19
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    if-nez p0, :cond_0

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    const/4 v0, 0x4

    .line 27
    goto :goto_0

    .line 28
    :sswitch_1
    const-string p1, "HIGH_SCHOOL"

    .line 29
    .line 30
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 31
    .line 32
    .line 33
    move-result p0

    .line 34
    if-nez p0, :cond_1

    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_1
    const/4 v0, 0x3

    .line 38
    goto :goto_0

    .line 39
    :sswitch_2
    const-string p1, "unknown_"

    .line 40
    .line 41
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 42
    .line 43
    .line 44
    move-result p0

    .line 45
    if-nez p0, :cond_2

    .line 46
    .line 47
    goto :goto_0

    .line 48
    :cond_2
    const/4 v0, 0x2

    .line 49
    goto :goto_0

    .line 50
    :sswitch_3
    const-string p1, "BACHELOR"

    .line 51
    .line 52
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 53
    .line 54
    .line 55
    move-result p0

    .line 56
    if-nez p0, :cond_3

    .line 57
    .line 58
    goto :goto_0

    .line 59
    :cond_3
    const/4 v0, 0x1

    .line 60
    goto :goto_0

    .line 61
    :sswitch_4
    const-string p1, "MASTER"

    .line 62
    .line 63
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 64
    .line 65
    .line 66
    move-result p0

    .line 67
    if-nez p0, :cond_4

    .line 68
    .line 69
    goto :goto_0

    .line 70
    :cond_4
    const/4 v0, 0x0

    .line 71
    :goto_0
    packed-switch v0, :pswitch_data_0

    .line 72
    .line 73
    .line 74
    sget-object p0, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 75
    .line 76
    sget p1, Lcom/p1/mobile/putong/core/R$string;->Kb:I

    .line 77
    .line 78
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 79
    .line 80
    .line 81
    move-result-object p0

    .line 82
    return-object p0

    .line 83
    :pswitch_0
    sget-object p0, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 84
    .line 85
    sget p1, Lcom/p1/mobile/putong/core/R$string;->Lb:I

    .line 86
    .line 87
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 88
    .line 89
    .line 90
    move-result-object p0

    .line 91
    return-object p0

    .line 92
    :pswitch_1
    sget-object p0, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 93
    .line 94
    sget p1, Lcom/p1/mobile/putong/core/R$string;->Ib:I

    .line 95
    .line 96
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 97
    .line 98
    .line 99
    move-result-object p0

    .line 100
    return-object p0

    .line 101
    :pswitch_2
    const-string p0, ""

    .line 102
    .line 103
    return-object p0

    .line 104
    :pswitch_3
    sget-object p0, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 105
    .line 106
    sget p1, Lcom/p1/mobile/putong/core/R$string;->Hb:I

    .line 107
    .line 108
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 109
    .line 110
    .line 111
    move-result-object p0

    .line 112
    return-object p0

    .line 113
    :pswitch_4
    sget-object p0, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 114
    .line 115
    sget p1, Lcom/p1/mobile/putong/core/R$string;->Jb:I

    .line 116
    .line 117
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 118
    .line 119
    .line 120
    move-result-object p0

    .line 121
    return-object p0

    .line 122
    nop

    .line 123
    :sswitch_data_0
    .sparse-switch
        -0x78dfe19e -> :sswitch_4
        -0x53119052 -> :sswitch_3
        -0xe5022ab -> :sswitch_2
        0x12773cb1 -> :sswitch_1
        0x7882851f -> :sswitch_0
    .end sparse-switch

    .line 124
    .line 125
    .line 126
    .line 127
    .line 128
    .line 129
    .line 130
    .line 131
    .line 132
    .line 133
    .line 134
    .line 135
    .line 136
    .line 137
    .line 138
    .line 139
    .line 140
    .line 141
    .line 142
    .line 143
    .line 144
    .line 145
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public P(Lcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/putong/core/data/LabelData;
    .locals 1
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Profile;->studies:Lcom/p1/mobile/putong/data/Studies;

    .line 4
    .line 5
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Studies;->school:Ljava/lang/String;

    .line 6
    .line 7
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_1

    .line 12
    .line 13
    invoke-virtual {p0, p1}, Ll/mt2;->R(Ljava/lang/String;)Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    if-nez p0, :cond_0

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/core/data/LabelData;->new_()Lcom/p1/mobile/putong/core/data/LabelData;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/LabelData;->name:Ljava/lang/String;

    .line 25
    .line 26
    sget p1, Ll/dbc0;->Tt:I

    .line 27
    .line 28
    iput p1, p0, Lcom/p1/mobile/putong/core/data/LabelData;->iconDrawableRes:I

    .line 29
    .line 30
    const/4 p1, 0x0

    .line 31
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/data/LabelData;->highlight:Z

    .line 32
    .line 33
    return-object p0

    .line 34
    :cond_1
    :goto_0
    const/4 p0, 0x0

    .line 35
    return-object p0
.end method

.method public Q(Lcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/putong/core/data/LabelData;
    .locals 4

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Profile;->zodiac:Lcom/p1/mobile/putong/data/ProfileZodiac;

    .line 4
    .line 5
    invoke-static {p0}, Ll/q8g0;->j0(Lcom/p1/mobile/putong/data/ProfileZodiac;)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    const/4 v0, 0x0

    .line 14
    if-nez p0, :cond_e

    .line 15
    .line 16
    invoke-static {}, Ll/r43;->b()Z

    .line 17
    .line 18
    .line 19
    move-result p0

    .line 20
    if-eqz p0, :cond_0

    .line 21
    .line 22
    goto/16 :goto_3

    .line 23
    .line 24
    :cond_0
    sget-object p0, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 25
    .line 26
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 27
    .line 28
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Profile;->zodiac:Lcom/p1/mobile/putong/data/ProfileZodiac;

    .line 29
    .line 30
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 35
    .line 36
    .line 37
    invoke-virtual {p1}, Ljava/lang/String;->hashCode()I

    .line 38
    .line 39
    .line 40
    move-result v1

    .line 41
    const/4 v2, 0x0

    .line 42
    const/4 v3, -0x1

    .line 43
    sparse-switch v1, :sswitch_data_0

    .line 44
    .line 45
    .line 46
    :goto_0
    move p1, v3

    .line 47
    goto/16 :goto_1

    .line 48
    .line 49
    :sswitch_0
    const-string v1, "sagittarius"

    .line 50
    .line 51
    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 52
    .line 53
    .line 54
    move-result p1

    .line 55
    if-nez p1, :cond_1

    .line 56
    .line 57
    goto :goto_0

    .line 58
    :cond_1
    const/16 p1, 0xb

    .line 59
    .line 60
    goto/16 :goto_1

    .line 61
    .line 62
    :sswitch_1
    const-string v1, "scorpio"

    .line 63
    .line 64
    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 65
    .line 66
    .line 67
    move-result p1

    .line 68
    if-nez p1, :cond_2

    .line 69
    .line 70
    goto :goto_0

    .line 71
    :cond_2
    const/16 p1, 0xa

    .line 72
    .line 73
    goto/16 :goto_1

    .line 74
    .line 75
    :sswitch_2
    const-string v1, "virgo"

    .line 76
    .line 77
    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 78
    .line 79
    .line 80
    move-result p1

    .line 81
    if-nez p1, :cond_3

    .line 82
    .line 83
    goto :goto_0

    .line 84
    :cond_3
    const/16 p1, 0x9

    .line 85
    .line 86
    goto/16 :goto_1

    .line 87
    .line 88
    :sswitch_3
    const-string v1, "libra"

    .line 89
    .line 90
    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 91
    .line 92
    .line 93
    move-result p1

    .line 94
    if-nez p1, :cond_4

    .line 95
    .line 96
    goto :goto_0

    .line 97
    :cond_4
    const/16 p1, 0x8

    .line 98
    .line 99
    goto/16 :goto_1

    .line 100
    .line 101
    :sswitch_4
    const-string v1, "aries"

    .line 102
    .line 103
    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 104
    .line 105
    .line 106
    move-result p1

    .line 107
    if-nez p1, :cond_5

    .line 108
    .line 109
    goto :goto_0

    .line 110
    :cond_5
    const/4 p1, 0x7

    .line 111
    goto :goto_1

    .line 112
    :sswitch_5
    const-string v1, "leo"

    .line 113
    .line 114
    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 115
    .line 116
    .line 117
    move-result p1

    .line 118
    if-nez p1, :cond_6

    .line 119
    .line 120
    goto :goto_0

    .line 121
    :cond_6
    const/4 p1, 0x6

    .line 122
    goto :goto_1

    .line 123
    :sswitch_6
    const-string v1, "taurus"

    .line 124
    .line 125
    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 126
    .line 127
    .line 128
    move-result p1

    .line 129
    if-nez p1, :cond_7

    .line 130
    .line 131
    goto :goto_0

    .line 132
    :cond_7
    const/4 p1, 0x5

    .line 133
    goto :goto_1

    .line 134
    :sswitch_7
    const-string v1, "pisces"

    .line 135
    .line 136
    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 137
    .line 138
    .line 139
    move-result p1

    .line 140
    if-nez p1, :cond_8

    .line 141
    .line 142
    goto :goto_0

    .line 143
    :cond_8
    const/4 p1, 0x4

    .line 144
    goto :goto_1

    .line 145
    :sswitch_8
    const-string v1, "gemini"

    .line 146
    .line 147
    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 148
    .line 149
    .line 150
    move-result p1

    .line 151
    if-nez p1, :cond_9

    .line 152
    .line 153
    goto :goto_0

    .line 154
    :cond_9
    const/4 p1, 0x3

    .line 155
    goto :goto_1

    .line 156
    :sswitch_9
    const-string v1, "cancer"

    .line 157
    .line 158
    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 159
    .line 160
    .line 161
    move-result p1

    .line 162
    if-nez p1, :cond_a

    .line 163
    .line 164
    goto :goto_0

    .line 165
    :cond_a
    const/4 p1, 0x2

    .line 166
    goto :goto_1

    .line 167
    :sswitch_a
    const-string v1, "capricorn"

    .line 168
    .line 169
    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 170
    .line 171
    .line 172
    move-result p1

    .line 173
    if-nez p1, :cond_b

    .line 174
    .line 175
    goto/16 :goto_0

    .line 176
    .line 177
    :cond_b
    const/4 p1, 0x1

    .line 178
    goto :goto_1

    .line 179
    :sswitch_b
    const-string v1, "aquarius"

    .line 180
    .line 181
    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 182
    .line 183
    .line 184
    move-result p1

    .line 185
    if-nez p1, :cond_c

    .line 186
    .line 187
    goto/16 :goto_0

    .line 188
    .line 189
    :cond_c
    move p1, v2

    .line 190
    :goto_1
    packed-switch p1, :pswitch_data_0

    .line 191
    .line 192
    .line 193
    move v1, v2

    .line 194
    move p1, v3

    .line 195
    goto :goto_2

    .line 196
    :pswitch_0
    sget p1, Lcom/p1/mobile/putong/common/R$string;->s3:I

    .line 197
    .line 198
    sget v1, Ll/dbc0;->l4:I

    .line 199
    .line 200
    goto :goto_2

    .line 201
    :pswitch_1
    sget p1, Lcom/p1/mobile/putong/common/R$string;->t3:I

    .line 202
    .line 203
    sget v1, Ll/dbc0;->k4:I

    .line 204
    .line 205
    goto :goto_2

    .line 206
    :pswitch_2
    sget p1, Lcom/p1/mobile/putong/common/R$string;->w3:I

    .line 207
    .line 208
    sget v1, Ll/dbc0;->u4:I

    .line 209
    .line 210
    goto :goto_2

    .line 211
    :pswitch_3
    sget p1, Lcom/p1/mobile/putong/common/R$string;->q3:I

    .line 212
    .line 213
    sget v1, Ll/dbc0;->v4:I

    .line 214
    .line 215
    goto :goto_2

    .line 216
    :pswitch_4
    sget p1, Lcom/p1/mobile/putong/common/R$string;->l3:I

    .line 217
    .line 218
    sget v1, Ll/dbc0;->p4:I

    .line 219
    .line 220
    goto :goto_2

    .line 221
    :pswitch_5
    sget p1, Lcom/p1/mobile/putong/common/R$string;->p3:I

    .line 222
    .line 223
    sget v1, Ll/dbc0;->t4:I

    .line 224
    .line 225
    goto :goto_2

    .line 226
    :pswitch_6
    sget p1, Lcom/p1/mobile/putong/common/R$string;->u3:I

    .line 227
    .line 228
    sget v1, Ll/dbc0;->q4:I

    .line 229
    .line 230
    goto :goto_2

    .line 231
    :pswitch_7
    sget p1, Lcom/p1/mobile/putong/common/R$string;->r3:I

    .line 232
    .line 233
    sget v1, Ll/dbc0;->r4:I

    .line 234
    .line 235
    goto :goto_2

    .line 236
    :pswitch_8
    sget p1, Lcom/p1/mobile/putong/common/R$string;->o3:I

    .line 237
    .line 238
    sget v1, Ll/dbc0;->o4:I

    .line 239
    .line 240
    goto :goto_2

    .line 241
    :pswitch_9
    sget p1, Lcom/p1/mobile/putong/common/R$string;->m3:I

    .line 242
    .line 243
    sget v1, Ll/dbc0;->s4:I

    .line 244
    .line 245
    goto :goto_2

    .line 246
    :pswitch_a
    sget p1, Lcom/p1/mobile/putong/common/R$string;->n3:I

    .line 247
    .line 248
    sget v1, Ll/dbc0;->m4:I

    .line 249
    .line 250
    goto :goto_2

    .line 251
    :pswitch_b
    sget p1, Lcom/p1/mobile/putong/common/R$string;->k3:I

    .line 252
    .line 253
    sget v1, Ll/dbc0;->n4:I

    .line 254
    .line 255
    :goto_2
    if-ne p1, v3, :cond_d

    .line 256
    .line 257
    return-object v0

    .line 258
    :cond_d
    invoke-static {}, Lcom/p1/mobile/putong/core/data/LabelData;->new_()Lcom/p1/mobile/putong/core/data/LabelData;

    .line 259
    .line 260
    .line 261
    move-result-object v0

    .line 262
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 263
    .line 264
    .line 265
    move-result-object p0

    .line 266
    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 267
    .line 268
    .line 269
    move-result-object p0

    .line 270
    iput-object p0, v0, Lcom/p1/mobile/putong/core/data/LabelData;->name:Ljava/lang/String;

    .line 271
    .line 272
    iput v1, v0, Lcom/p1/mobile/putong/core/data/LabelData;->iconDrawableRes:I

    .line 273
    .line 274
    iput-boolean v2, v0, Lcom/p1/mobile/putong/core/data/LabelData;->highlight:Z

    .line 275
    .line 276
    :cond_e
    :goto_3
    return-object v0

    .line 277
    :sswitch_data_0
    .sparse-switch
        -0x7cda842f -> :sswitch_b
        -0x5ffe5b4f -> :sswitch_a
        -0x5185d180 -> :sswitch_9
        -0x4a7a6dcb -> :sswitch_8
        -0x3ae3cf89 -> :sswitch_7
        -0x34800618 -> :sswitch_6
        0x1a216 -> :sswitch_5
        0x58c5106 -> :sswitch_4
        0x6232374 -> :sswitch_3
        0x6b04947 -> :sswitch_2
        0x72ae1883 -> :sswitch_1
        0x79458ec6 -> :sswitch_0
    .end sparse-switch

    .line 278
    .line 279
    .line 280
    .line 281
    .line 282
    .line 283
    .line 284
    .line 285
    .line 286
    .line 287
    .line 288
    .line 289
    .line 290
    .line 291
    .line 292
    .line 293
    .line 294
    .line 295
    .line 296
    .line 297
    .line 298
    .line 299
    .line 300
    .line 301
    .line 302
    .line 303
    .line 304
    .line 305
    .line 306
    .line 307
    .line 308
    .line 309
    .line 310
    .line 311
    .line 312
    .line 313
    .line 314
    .line 315
    .line 316
    .line 317
    .line 318
    .line 319
    .line 320
    .line 321
    .line 322
    .line 323
    .line 324
    .line 325
    .line 326
    .line 327
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public R(Ljava/lang/String;)Z
    .locals 1

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 2
    .line 3
    sget v0, Lcom/p1/mobile/putong/core/R$string;->Zj:I

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-static {p1, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-nez p0, :cond_1

    .line 14
    .line 15
    const-string p0, "Temporarily not revealed"

    .line 16
    .line 17
    invoke-static {p1, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    if-nez p0, :cond_1

    .line 22
    .line 23
    const-string p0, "\u66ab\u4e0d\u900f\u9732"

    .line 24
    .line 25
    invoke-static {p1, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 26
    .line 27
    .line 28
    move-result p0

    .line 29
    if-nez p0, :cond_1

    .line 30
    .line 31
    const-string p0, "\u6682\u4e0d\u900f\u9732"

    .line 32
    .line 33
    invoke-static {p1, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 34
    .line 35
    .line 36
    move-result p0

    .line 37
    if-nez p0, :cond_1

    .line 38
    .line 39
    const-string p0, "\u4e0d\u9650"

    .line 40
    .line 41
    invoke-static {p1, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 42
    .line 43
    .line 44
    move-result p0

    .line 45
    if-nez p0, :cond_1

    .line 46
    .line 47
    const-string p0, "\u6682\u65e0"

    .line 48
    .line 49
    invoke-static {p1, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 50
    .line 51
    .line 52
    move-result p0

    .line 53
    if-eqz p0, :cond_0

    .line 54
    .line 55
    goto :goto_0

    .line 56
    :cond_0
    const/4 p0, 0x1

    .line 57
    return p0

    .line 58
    :cond_1
    :goto_0
    const/4 p0, 0x0

    .line 59
    return p0
.end method

.method public g(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Ll/dmf;->g(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p1}, Ll/mt2;->D(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    iget-object p0, p0, Ll/mt2;->i:Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView;

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView;->f()V

    .line 10
    .line 11
    .line 12
    return-void
.end method

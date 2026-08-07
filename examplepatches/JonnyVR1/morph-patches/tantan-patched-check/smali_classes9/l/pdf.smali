.class public Ll/pdf;
.super Lcom/p1/mobile/putong/core/ui/profile/exp/item/c;
.source "SourceFile"


# instance fields
.field public A:Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;

.field public B:Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;

.field public u:Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;

.field public v:Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;

.field public w:Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;

.field public x:Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;

.field public y:Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;

.field public z:Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;


# direct methods
.method public constructor <init>(Ll/t3m;Ll/ner;)V
    .locals 0
    .param p1    # Ll/t3m;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/profile/exp/item/c;-><init>(Ll/t3m;Ll/ner;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic S(Ll/pdf;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/pdf;->f0()V

    return-void
.end method

.method public static synthetic T(Ll/pdf;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/pdf;->k0()V

    return-void
.end method

.method public static synthetic U(Ll/pdf;Z)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/pdf;->i0(Z)V

    return-void
.end method

.method public static synthetic V(Ll/pdf;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/pdf;->j0()V

    return-void
.end method

.method public static synthetic W(Ll/pdf;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/pdf;->d0()V

    return-void
.end method

.method public static synthetic X(Ll/pdf;Z)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/pdf;->g0(Z)V

    return-void
.end method

.method public static synthetic Y(Ll/pdf;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/pdf;->e0()V

    return-void
.end method

.method public static synthetic Z(Ll/pdf;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/pdf;->h0()V

    return-void
.end method

.method public static a0(Lcom/p1/mobile/putong/data/Profile;)Ljava/lang/String;
    .locals 6

    .line 1
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const-string v1, ""

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    return-object v1

    .line 10
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    .line 11
    .line 12
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 13
    .line 14
    .line 15
    iget-object v2, p0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 16
    .line 17
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    .line 18
    .line 19
    iget-object v2, v2, Lcom/p1/mobile/putong/data/ProfileExtensionBasic;->country:Ljava/util/List;

    .line 20
    .line 21
    invoke-static {v2}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 22
    .line 23
    .line 24
    move-result v2

    .line 25
    const/4 v3, 0x0

    .line 26
    if-eqz v2, :cond_1

    .line 27
    .line 28
    move-object v2, v1

    .line 29
    goto :goto_0

    .line 30
    :cond_1
    iget-object v2, p0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 31
    .line 32
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    .line 33
    .line 34
    iget-object v2, v2, Lcom/p1/mobile/putong/data/ProfileExtensionBasic;->country:Ljava/util/List;

    .line 35
    .line 36
    invoke-interface {v2, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    move-result-object v2

    .line 40
    check-cast v2, Ljava/lang/String;

    .line 41
    .line 42
    :goto_0
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 43
    .line 44
    .line 45
    move-result v4

    .line 46
    if-nez v4, :cond_2

    .line 47
    .line 48
    const-string v4, "\u4e2d\u56fd"

    .line 49
    .line 50
    invoke-virtual {v4, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 51
    .line 52
    .line 53
    move-result v4

    .line 54
    if-nez v4, :cond_2

    .line 55
    .line 56
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 57
    .line 58
    .line 59
    :cond_2
    iget-object v2, p0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 60
    .line 61
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    .line 62
    .line 63
    iget-object v2, v2, Lcom/p1/mobile/putong/data/ProfileExtensionBasic;->province:Ljava/util/List;

    .line 64
    .line 65
    invoke-static {v2}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 66
    .line 67
    .line 68
    move-result v2

    .line 69
    if-eqz v2, :cond_3

    .line 70
    .line 71
    move-object v2, v1

    .line 72
    goto :goto_1

    .line 73
    :cond_3
    iget-object v2, p0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 74
    .line 75
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    .line 76
    .line 77
    iget-object v2, v2, Lcom/p1/mobile/putong/data/ProfileExtensionBasic;->province:Ljava/util/List;

    .line 78
    .line 79
    invoke-interface {v2, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 80
    .line 81
    .line 82
    move-result-object v2

    .line 83
    check-cast v2, Ljava/lang/String;

    .line 84
    .line 85
    :goto_1
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 86
    .line 87
    .line 88
    move-result v4

    .line 89
    const-string v5, "\u00b7"

    .line 90
    .line 91
    if-nez v4, :cond_5

    .line 92
    .line 93
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 94
    .line 95
    .line 96
    move-result-object v4

    .line 97
    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 98
    .line 99
    .line 100
    move-result v4

    .line 101
    if-nez v4, :cond_4

    .line 102
    .line 103
    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 104
    .line 105
    .line 106
    :cond_4
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 107
    .line 108
    .line 109
    :cond_5
    iget-object v2, p0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 110
    .line 111
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    .line 112
    .line 113
    iget-object v2, v2, Lcom/p1/mobile/putong/data/ProfileExtensionBasic;->city:Ljava/util/List;

    .line 114
    .line 115
    invoke-static {v2}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 116
    .line 117
    .line 118
    move-result v2

    .line 119
    if-eqz v2, :cond_6

    .line 120
    .line 121
    goto :goto_2

    .line 122
    :cond_6
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 123
    .line 124
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    .line 125
    .line 126
    iget-object p0, p0, Lcom/p1/mobile/putong/data/ProfileExtensionBasic;->city:Ljava/util/List;

    .line 127
    .line 128
    invoke-interface {p0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 129
    .line 130
    .line 131
    move-result-object p0

    .line 132
    move-object v1, p0

    .line 133
    check-cast v1, Ljava/lang/String;

    .line 134
    .line 135
    :goto_2
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 136
    .line 137
    .line 138
    move-result p0

    .line 139
    if-nez p0, :cond_7

    .line 140
    .line 141
    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 142
    .line 143
    .line 144
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 145
    .line 146
    .line 147
    :cond_7
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 148
    .line 149
    .line 150
    move-result-object p0

    .line 151
    return-object p0
.end method

.method private synthetic d0()V
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    new-array v0, v0, [Ll/sfj0$a;

    .line 3
    .line 4
    const-string v1, "e_edit_profile_dating_purpose"

    .line 5
    .line 6
    const-string v2, "p_edit_profile_view"

    .line 7
    .line 8
    invoke-static {v1, v2, v0}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/exp/item/a;->i()Lcom/p1/mobile/android/app/Frag;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    new-instance v0, Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputFriendPurpose;

    .line 16
    .line 17
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputFriendPurpose;-><init>()V

    .line 18
    .line 19
    .line 20
    invoke-static {p0, v0}, Ll/ljf;->c(Lcom/p1/mobile/android/app/Frag;Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputType;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method private synthetic e0()V
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    new-array v0, v0, [Ll/sfj0$a;

    .line 3
    .line 4
    const-string v1, "e_edit_profile_education_degree"

    .line 5
    .line 6
    const-string v2, "p_edit_profile_view"

    .line 7
    .line 8
    invoke-static {v1, v2, v0}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/exp/item/a;->i()Lcom/p1/mobile/android/app/Frag;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    new-instance v0, Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputQualification;

    .line 16
    .line 17
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputQualification;-><init>()V

    .line 18
    .line 19
    .line 20
    invoke-static {p0, v0}, Ll/ljf;->c(Lcom/p1/mobile/android/app/Frag;Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputType;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method private synthetic f0()V
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    new-array v0, v0, [Ll/sfj0$a;

    .line 3
    .line 4
    const-string v1, "e_edit_profile_height"

    .line 5
    .line 6
    const-string v2, "p_edit_profile_view"

    .line 7
    .line 8
    invoke-static {v1, v2, v0}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/exp/item/a;->i()Lcom/p1/mobile/android/app/Frag;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    new-instance v0, Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputHeight;

    .line 16
    .line 17
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputHeight;-><init>()V

    .line 18
    .line 19
    .line 20
    invoke-static {p0, v0}, Ll/ljf;->c(Lcom/p1/mobile/android/app/Frag;Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputType;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method private synthetic g0(Z)V
    .locals 0

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    const-string p0, "\u5ba1\u6838\u4e2d\uff0c\u8bf7\u7a0d\u540e\u64cd\u4f5c\u3002"

    .line 4
    .line 5
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/exp/item/a;->i()Lcom/p1/mobile/android/app/Frag;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    new-instance p1, Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputProfession;

    .line 14
    .line 15
    invoke-direct {p1}, Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputProfession;-><init>()V

    .line 16
    .line 17
    .line 18
    invoke-static {p0, p1}, Ll/ljf;->c(Lcom/p1/mobile/android/app/Frag;Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputType;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method


# virtual methods
.method public final b0(Lcom/p1/mobile/putong/data/Profile;)Ljava/lang/String;
    .locals 1

    .line 1
    invoke-static {p1}, Ll/pdf;->a0(Lcom/p1/mobile/putong/data/Profile;)Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Profile;->hometown:Ljava/lang/String;

    .line 12
    .line 13
    :cond_0
    return-object p0
.end method

.method public c0(I)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/exp/item/a;->x()Ll/t3m;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-interface {p0}, Ll/nol;->act()Landroid/app/Activity;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    check-cast p0, Lcom/p1/mobile/android/app/Act;

    .line 10
    .line 11
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public final synthetic h0()V
    .locals 3

    .line 1
    const-string v0, "edit_profile_my_info_name"

    .line 2
    .line 3
    const-string v1, "company"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    filled-new-array {v0}, [Ll/sfj0$a;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    const-string v1, "e_edit_profile_my_info"

    .line 14
    .line 15
    const-string v2, "p_edit_profile_view"

    .line 16
    .line 17
    invoke-static {v1, v2, v0}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/exp/item/a;->i()Lcom/p1/mobile/android/app/Frag;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    new-instance v0, Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputCompany;

    .line 25
    .line 26
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputCompany;-><init>()V

    .line 27
    .line 28
    .line 29
    invoke-static {p0, v0}, Ll/ljf;->c(Lcom/p1/mobile/android/app/Frag;Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputType;)V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public final synthetic i0(Z)V
    .locals 2

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    const-string p0, "\u5ba1\u6838\u4e2d\uff0c\u8bf7\u7a0d\u540e\u64cd\u4f5c\u3002"

    .line 4
    .line 5
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/exp/item/a;->x()Ll/t3m;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    invoke-interface {p1}, Ll/t3m;->i2()Lcom/p1/mobile/putong/data/User;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 18
    .line 19
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Profile;->studies:Lcom/p1/mobile/putong/data/Studies;

    .line 20
    .line 21
    iget-boolean p1, p1, Lcom/p1/mobile/putong/data/Studies;->verified:Z

    .line 22
    .line 23
    if-eqz p1, :cond_1

    .line 24
    .line 25
    const-string p1, "edit_profile_my_info_name"

    .line 26
    .line 27
    const-string v0, "school"

    .line 28
    .line 29
    invoke-static {p1, v0}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    filled-new-array {p1}, [Ll/sfj0$a;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    const-string v0, "e_edit_profile_my_info"

    .line 38
    .line 39
    const-string v1, "p_edit_profile_view"

    .line 40
    .line 41
    invoke-static {v0, v1, p1}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 42
    .line 43
    .line 44
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/exp/item/a;->x()Ll/t3m;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    invoke-interface {p0}, Ll/t3m;->J1()Lcom/p1/mobile/putong/app/PutongFrag;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    invoke-static {p0}, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopFragmentFactory;->G(Lcom/p1/mobile/android/app/Frag;)V

    .line 53
    .line 54
    .line 55
    return-void

    .line 56
    :cond_1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/exp/item/a;->i()Lcom/p1/mobile/android/app/Frag;

    .line 57
    .line 58
    .line 59
    move-result-object p0

    .line 60
    new-instance p1, Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputSchoolNew;

    .line 61
    .line 62
    invoke-direct {p1}, Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputSchoolNew;-><init>()V

    .line 63
    .line 64
    .line 65
    invoke-static {p0, p1}, Ll/ljf;->c(Lcom/p1/mobile/android/app/Frag;Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputType;)V

    .line 66
    .line 67
    .line 68
    return-void
.end method

.method public final synthetic j0()V
    .locals 3

    .line 1
    const-string v0, "edit_profile_my_info_name"

    .line 2
    .line 3
    const-string v1, "hometown"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    filled-new-array {v0}, [Ll/sfj0$a;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    const-string v1, "e_edit_profile_my_info"

    .line 14
    .line 15
    const-string v2, "p_edit_profile_view"

    .line 16
    .line 17
    invoke-static {v1, v2, v0}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/exp/item/a;->i()Lcom/p1/mobile/android/app/Frag;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    new-instance v0, Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputHomeTown;

    .line 25
    .line 26
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputHomeTown;-><init>()V

    .line 27
    .line 28
    .line 29
    invoke-static {p0, v0}, Ll/ljf;->c(Lcom/p1/mobile/android/app/Frag;Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputType;)V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public final synthetic k0()V
    .locals 3

    .line 1
    const-string v0, "edit_profile_my_info_name"

    .line 2
    .line 3
    const-string v1, "hangouts"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    filled-new-array {v0}, [Ll/sfj0$a;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    const-string v1, "e_edit_profile_my_info"

    .line 14
    .line 15
    const-string v2, "p_edit_profile_view"

    .line 16
    .line 17
    invoke-static {v1, v2, v0}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/exp/item/a;->i()Lcom/p1/mobile/android/app/Frag;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    new-instance v0, Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputHangouts;

    .line 25
    .line 26
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputHangouts;-><init>()V

    .line 27
    .line 28
    .line 29
    invoke-static {p0, v0}, Ll/ljf;->c(Lcom/p1/mobile/android/app/Frag;Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputType;)V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public l0(Lcom/p1/mobile/putong/data/User;)V
    .locals 9

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 4
    .line 5
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    .line 6
    .line 7
    iget-object v0, v0, Lcom/p1/mobile/putong/data/ProfileExtensionBasic;->friendPurpose:Ljava/util/List;

    .line 8
    .line 9
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    const/4 v2, 0x0

    .line 14
    const-string v3, ""

    .line 15
    .line 16
    if-nez v1, :cond_0

    .line 17
    .line 18
    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    check-cast v0, Lcom/p1/mobile/putong/data/Purpose;

    .line 23
    .line 24
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    invoke-static {v0}, Ll/baj;->T(Ljava/lang/String;)Ll/bkj0;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    iget-object v0, v0, Ll/bkj0;->a:Ljava/lang/Object;

    .line 33
    .line 34
    check-cast v0, Ljava/lang/String;

    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_0
    move-object v0, v3

    .line 38
    :goto_0
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 39
    .line 40
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 41
    .line 42
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Extensions;->physical:Lcom/p1/mobile/putong/data/Physical;

    .line 43
    .line 44
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Physical;->height:Ljava/util/List;

    .line 45
    .line 46
    invoke-static {v1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 47
    .line 48
    .line 49
    move-result v4

    .line 50
    if-nez v4, :cond_1

    .line 51
    .line 52
    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 53
    .line 54
    .line 55
    move-result-object v4

    .line 56
    check-cast v4, Ljava/lang/CharSequence;

    .line 57
    .line 58
    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 59
    .line 60
    .line 61
    move-result v4

    .line 62
    if-nez v4, :cond_1

    .line 63
    .line 64
    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 65
    .line 66
    .line 67
    move-result-object v4

    .line 68
    check-cast v4, Ljava/lang/String;

    .line 69
    .line 70
    invoke-static {v4}, Ll/tr90;->v(Ljava/lang/String;)Z

    .line 71
    .line 72
    .line 73
    move-result v4

    .line 74
    if-nez v4, :cond_1

    .line 75
    .line 76
    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 77
    .line 78
    .line 79
    move-result-object v1

    .line 80
    check-cast v1, Ljava/lang/String;

    .line 81
    .line 82
    new-instance v4, Ljava/lang/StringBuilder;

    .line 83
    .line 84
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 85
    .line 86
    .line 87
    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 88
    .line 89
    .line 90
    const-string v1, "cm"

    .line 91
    .line 92
    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 93
    .line 94
    .line 95
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 96
    .line 97
    .line 98
    move-result-object v1

    .line 99
    goto :goto_1

    .line 100
    :cond_1
    move-object v1, v3

    .line 101
    :goto_1
    iget-object v4, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 102
    .line 103
    iget-object v5, v4, Lcom/p1/mobile/putong/data/Profile;->studies:Lcom/p1/mobile/putong/data/Studies;

    .line 104
    .line 105
    iget-boolean v5, v5, Lcom/p1/mobile/putong/data/Studies;->active:Z

    .line 106
    .line 107
    iget-object v6, p0, Ll/pdf;->x:Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;

    .line 108
    .line 109
    if-eqz v5, :cond_2

    .line 110
    .line 111
    invoke-static {v6, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 112
    .line 113
    .line 114
    iget-object v5, p0, Ll/pdf;->x:Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;

    .line 115
    .line 116
    invoke-virtual {v5}, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;->getDividerView()Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditDividerView;

    .line 117
    .line 118
    .line 119
    move-result-object v5

    .line 120
    invoke-static {v5, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 121
    .line 122
    .line 123
    const-string v5, "\u5b66\u751f"

    .line 124
    .line 125
    move-object v6, v3

    .line 126
    goto/16 :goto_3

    .line 127
    .line 128
    :cond_2
    const/4 v5, 0x1

    .line 129
    invoke-static {v6, v5}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 130
    .line 131
    .line 132
    iget-object v6, p0, Ll/pdf;->x:Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;

    .line 133
    .line 134
    invoke-virtual {v6}, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;->getDividerView()Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditDividerView;

    .line 135
    .line 136
    .line 137
    move-result-object v6

    .line 138
    invoke-static {v6, v5}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 139
    .line 140
    .line 141
    iget-object v5, v4, Lcom/p1/mobile/putong/data/Profile;->work:Lcom/p1/mobile/putong/data/Work;

    .line 142
    .line 143
    iget-object v5, v5, Lcom/p1/mobile/putong/data/Work;->industry:Ljava/lang/String;

    .line 144
    .line 145
    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 146
    .line 147
    .line 148
    move-result v5

    .line 149
    iget-object v6, v4, Lcom/p1/mobile/putong/data/Profile;->work:Lcom/p1/mobile/putong/data/Work;

    .line 150
    .line 151
    if-eqz v5, :cond_3

    .line 152
    .line 153
    iget-object v5, v6, Lcom/p1/mobile/putong/data/Work;->department:Ljava/lang/String;

    .line 154
    .line 155
    goto :goto_2

    .line 156
    :cond_3
    iget-object v5, v6, Lcom/p1/mobile/putong/data/Work;->industry:Ljava/lang/String;

    .line 157
    .line 158
    const-string v6, "\u5176\u4ed6"

    .line 159
    .line 160
    invoke-static {v5, v6}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 161
    .line 162
    .line 163
    move-result v5

    .line 164
    const-string v7, "\u5176\u5b83"

    .line 165
    .line 166
    if-nez v5, :cond_4

    .line 167
    .line 168
    iget-object v5, v4, Lcom/p1/mobile/putong/data/Profile;->work:Lcom/p1/mobile/putong/data/Work;

    .line 169
    .line 170
    iget-object v5, v5, Lcom/p1/mobile/putong/data/Work;->industry:Ljava/lang/String;

    .line 171
    .line 172
    invoke-static {v5, v7}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 173
    .line 174
    .line 175
    move-result v5

    .line 176
    if-eqz v5, :cond_6

    .line 177
    .line 178
    :cond_4
    iget-object v5, v4, Lcom/p1/mobile/putong/data/Profile;->work:Lcom/p1/mobile/putong/data/Work;

    .line 179
    .line 180
    iget-object v5, v5, Lcom/p1/mobile/putong/data/Work;->department:Ljava/lang/String;

    .line 181
    .line 182
    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 183
    .line 184
    .line 185
    move-result v5

    .line 186
    if-nez v5, :cond_6

    .line 187
    .line 188
    iget-object v5, v4, Lcom/p1/mobile/putong/data/Profile;->work:Lcom/p1/mobile/putong/data/Work;

    .line 189
    .line 190
    iget-object v5, v5, Lcom/p1/mobile/putong/data/Work;->department:Ljava/lang/String;

    .line 191
    .line 192
    invoke-static {v5, v6}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 193
    .line 194
    .line 195
    move-result v5

    .line 196
    if-nez v5, :cond_5

    .line 197
    .line 198
    iget-object v5, v4, Lcom/p1/mobile/putong/data/Profile;->work:Lcom/p1/mobile/putong/data/Work;

    .line 199
    .line 200
    iget-object v5, v5, Lcom/p1/mobile/putong/data/Work;->department:Ljava/lang/String;

    .line 201
    .line 202
    invoke-static {v5, v7}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 203
    .line 204
    .line 205
    move-result v5

    .line 206
    if-eqz v5, :cond_6

    .line 207
    .line 208
    :cond_5
    move-object v5, v6

    .line 209
    goto :goto_2

    .line 210
    :cond_6
    iget-object v5, v4, Lcom/p1/mobile/putong/data/Profile;->work:Lcom/p1/mobile/putong/data/Work;

    .line 211
    .line 212
    iget-object v5, v5, Lcom/p1/mobile/putong/data/Work;->department:Ljava/lang/String;

    .line 213
    .line 214
    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 215
    .line 216
    .line 217
    move-result v5

    .line 218
    iget-object v6, v4, Lcom/p1/mobile/putong/data/Profile;->work:Lcom/p1/mobile/putong/data/Work;

    .line 219
    .line 220
    if-eqz v5, :cond_7

    .line 221
    .line 222
    iget-object v5, v6, Lcom/p1/mobile/putong/data/Work;->industry:Ljava/lang/String;

    .line 223
    .line 224
    goto :goto_2

    .line 225
    :cond_7
    new-instance v5, Ljava/lang/StringBuilder;

    .line 226
    .line 227
    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    .line 228
    .line 229
    .line 230
    iget-object v6, v6, Lcom/p1/mobile/putong/data/Work;->industry:Ljava/lang/String;

    .line 231
    .line 232
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 233
    .line 234
    .line 235
    const-string v6, "\u00b7"

    .line 236
    .line 237
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 238
    .line 239
    .line 240
    iget-object v6, v4, Lcom/p1/mobile/putong/data/Profile;->work:Lcom/p1/mobile/putong/data/Work;

    .line 241
    .line 242
    iget-object v6, v6, Lcom/p1/mobile/putong/data/Work;->department:Ljava/lang/String;

    .line 243
    .line 244
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 245
    .line 246
    .line 247
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 248
    .line 249
    .line 250
    move-result-object v5

    .line 251
    :goto_2
    iget-object v6, v4, Lcom/p1/mobile/putong/data/Profile;->work:Lcom/p1/mobile/putong/data/Work;

    .line 252
    .line 253
    iget-object v6, v6, Lcom/p1/mobile/putong/data/Work;->company:Ljava/lang/String;

    .line 254
    .line 255
    :goto_3
    iget-object v7, v4, Lcom/p1/mobile/putong/data/Profile;->studies:Lcom/p1/mobile/putong/data/Studies;

    .line 256
    .line 257
    iget-object v7, v7, Lcom/p1/mobile/putong/data/Studies;->school:Ljava/lang/String;

    .line 258
    .line 259
    iget-object v8, p1, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 260
    .line 261
    invoke-static {v8}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 262
    .line 263
    .line 264
    move-result v8

    .line 265
    if-eqz v8, :cond_8

    .line 266
    .line 267
    iget-object v8, p1, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 268
    .line 269
    invoke-virtual {v8}, Lcom/p1/mobile/putong/data/Settings;->hideSchoolName()Z

    .line 270
    .line 271
    .line 272
    move-result v8

    .line 273
    if-eqz v8, :cond_8

    .line 274
    .line 275
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/exp/item/a;->x()Ll/t3m;

    .line 276
    .line 277
    .line 278
    move-result-object v8

    .line 279
    invoke-interface {v8}, Ll/t3m;->P1()Z

    .line 280
    .line 281
    .line 282
    move-result v8

    .line 283
    if-eqz v8, :cond_8

    .line 284
    .line 285
    new-instance v7, Ljava/lang/StringBuilder;

    .line 286
    .line 287
    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    .line 288
    .line 289
    .line 290
    iget-object v8, v4, Lcom/p1/mobile/putong/data/Profile;->studies:Lcom/p1/mobile/putong/data/Studies;

    .line 291
    .line 292
    iget-object v8, v8, Lcom/p1/mobile/putong/data/Studies;->school:Ljava/lang/String;

    .line 293
    .line 294
    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 295
    .line 296
    .line 297
    const-string v8, "("

    .line 298
    .line 299
    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 300
    .line 301
    .line 302
    sget v8, Lcom/p1/mobile/putong/core/R$string;->C0:I

    .line 303
    .line 304
    invoke-virtual {p0, v8}, Ll/pdf;->c0(I)Ljava/lang/String;

    .line 305
    .line 306
    .line 307
    move-result-object v8

    .line 308
    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 309
    .line 310
    .line 311
    const-string v8, ")"

    .line 312
    .line 313
    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 314
    .line 315
    .line 316
    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 317
    .line 318
    .line 319
    move-result-object v7

    .line 320
    :cond_8
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 321
    .line 322
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 323
    .line 324
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    .line 325
    .line 326
    iget-object p1, p1, Lcom/p1/mobile/putong/data/ProfileExtensionBasic;->qualification:Ljava/util/List;

    .line 327
    .line 328
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 329
    .line 330
    .line 331
    move-result v8

    .line 332
    if-nez v8, :cond_9

    .line 333
    .line 334
    invoke-interface {p1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 335
    .line 336
    .line 337
    move-result-object v8

    .line 338
    check-cast v8, Ljava/lang/CharSequence;

    .line 339
    .line 340
    invoke-static {v8}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 341
    .line 342
    .line 343
    move-result v8

    .line 344
    if-nez v8, :cond_9

    .line 345
    .line 346
    invoke-interface {p1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 347
    .line 348
    .line 349
    move-result-object v8

    .line 350
    check-cast v8, Ljava/lang/String;

    .line 351
    .line 352
    invoke-static {v8}, Ll/tr90;->v(Ljava/lang/String;)Z

    .line 353
    .line 354
    .line 355
    move-result v8

    .line 356
    if-nez v8, :cond_9

    .line 357
    .line 358
    invoke-interface {p1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 359
    .line 360
    .line 361
    move-result-object p1

    .line 362
    check-cast p1, Ljava/lang/String;

    .line 363
    .line 364
    invoke-static {p1}, Ll/baj;->W(Ljava/lang/String;)Ljava/lang/String;

    .line 365
    .line 366
    .line 367
    move-result-object v3

    .line 368
    :cond_9
    iget-object p1, p0, Ll/pdf;->u:Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;

    .line 369
    .line 370
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/core/ui/profile/exp/item/c;->Q(Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;Ljava/lang/String;)V

    .line 371
    .line 372
    .line 373
    iget-object p1, p0, Ll/pdf;->v:Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;

    .line 374
    .line 375
    invoke-virtual {p0, p1, v1}, Lcom/p1/mobile/putong/core/ui/profile/exp/item/c;->Q(Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;Ljava/lang/String;)V

    .line 376
    .line 377
    .line 378
    iget-object p1, p0, Ll/pdf;->w:Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;

    .line 379
    .line 380
    invoke-virtual {p0, p1, v5}, Lcom/p1/mobile/putong/core/ui/profile/exp/item/c;->Q(Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;Ljava/lang/String;)V

    .line 381
    .line 382
    .line 383
    iget-object p1, p0, Ll/pdf;->x:Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;

    .line 384
    .line 385
    invoke-virtual {p0, p1, v6}, Lcom/p1/mobile/putong/core/ui/profile/exp/item/c;->Q(Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;Ljava/lang/String;)V

    .line 386
    .line 387
    .line 388
    iget-object p1, p0, Ll/pdf;->z:Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;

    .line 389
    .line 390
    invoke-virtual {p0, p1, v7}, Lcom/p1/mobile/putong/core/ui/profile/exp/item/c;->Q(Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;Ljava/lang/String;)V

    .line 391
    .line 392
    .line 393
    iget-object p1, p0, Ll/pdf;->y:Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;

    .line 394
    .line 395
    invoke-virtual {p0, p1, v3}, Lcom/p1/mobile/putong/core/ui/profile/exp/item/c;->Q(Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;Ljava/lang/String;)V

    .line 396
    .line 397
    .line 398
    iget-object p1, p0, Ll/pdf;->A:Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;

    .line 399
    .line 400
    invoke-virtual {p0, v4}, Ll/pdf;->b0(Lcom/p1/mobile/putong/data/Profile;)Ljava/lang/String;

    .line 401
    .line 402
    .line 403
    move-result-object v0

    .line 404
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/core/ui/profile/exp/item/c;->Q(Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;Ljava/lang/String;)V

    .line 405
    .line 406
    .line 407
    iget-object p1, p0, Ll/pdf;->B:Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;

    .line 408
    .line 409
    iget-object v0, v4, Lcom/p1/mobile/putong/data/Profile;->hangouts:Ljava/lang/String;

    .line 410
    .line 411
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/core/ui/profile/exp/item/c;->Q(Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;Ljava/lang/String;)V

    .line 412
    .line 413
    .line 414
    return-void
.end method

.method public m()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "\u6211\u7684\u4fe1\u606f"

    .line 2
    .line 3
    return-object p0
.end method

.method public n()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "info"

    .line 2
    .line 3
    return-object p0
.end method

.method public q(Landroid/view/View;)V
    .locals 3

    .line 1
    invoke-super {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/exp/item/a;->q(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 5
    .line 6
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 7
    .line 8
    invoke-virtual {p1}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 13
    .line 14
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    const/4 v1, 0x1

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 22
    .line 23
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Settings;->verification:Lcom/p1/mobile/putong/data/Verification;

    .line 24
    .line 25
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-eqz v0, :cond_0

    .line 30
    .line 31
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 32
    .line 33
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Settings;->verification:Lcom/p1/mobile/putong/data/Verification;

    .line 34
    .line 35
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Verification;->studies:Lcom/p1/mobile/putong/data/StudentVerification;

    .line 36
    .line 37
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    if-eqz v0, :cond_0

    .line 42
    .line 43
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 44
    .line 45
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Settings;->verification:Lcom/p1/mobile/putong/data/Verification;

    .line 46
    .line 47
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Verification;->studies:Lcom/p1/mobile/putong/data/StudentVerification;

    .line 48
    .line 49
    iget-object p1, p1, Lcom/p1/mobile/putong/data/StudentVerification;->status:Lcom/p1/mobile/putong/data/StudentVerificationStatus;

    .line 50
    .line 51
    const-string v0, "pending"

    .line 52
    .line 53
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 54
    .line 55
    .line 56
    move-result p1

    .line 57
    if-eqz p1, :cond_0

    .line 58
    .line 59
    const/4 p1, 0x0

    .line 60
    goto :goto_0

    .line 61
    :cond_0
    move p1, v1

    .line 62
    :goto_0
    iget-object v0, p0, Ll/pdf;->u:Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;

    .line 63
    .line 64
    new-instance v2, Ll/hdf;

    .line 65
    .line 66
    invoke-direct {v2, p0}, Ll/hdf;-><init>(Ll/pdf;)V

    .line 67
    .line 68
    .line 69
    invoke-virtual {p0, v0, v2, v1}, Lcom/p1/mobile/putong/core/ui/profile/exp/item/a;->v(Landroid/view/View;Ll/x20;Z)V

    .line 70
    .line 71
    .line 72
    iget-object v0, p0, Ll/pdf;->y:Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;

    .line 73
    .line 74
    new-instance v2, Ll/idf;

    .line 75
    .line 76
    invoke-direct {v2, p0}, Ll/idf;-><init>(Ll/pdf;)V

    .line 77
    .line 78
    .line 79
    invoke-virtual {p0, v0, v2, v1}, Lcom/p1/mobile/putong/core/ui/profile/exp/item/a;->v(Landroid/view/View;Ll/x20;Z)V

    .line 80
    .line 81
    .line 82
    iget-object v0, p0, Ll/pdf;->v:Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;

    .line 83
    .line 84
    new-instance v2, Ll/jdf;

    .line 85
    .line 86
    invoke-direct {v2, p0}, Ll/jdf;-><init>(Ll/pdf;)V

    .line 87
    .line 88
    .line 89
    invoke-virtual {p0, v0, v2, v1}, Lcom/p1/mobile/putong/core/ui/profile/exp/item/a;->v(Landroid/view/View;Ll/x20;Z)V

    .line 90
    .line 91
    .line 92
    iget-object v0, p0, Ll/pdf;->w:Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;

    .line 93
    .line 94
    new-instance v2, Ll/kdf;

    .line 95
    .line 96
    invoke-direct {v2, p0, p1}, Ll/kdf;-><init>(Ll/pdf;Z)V

    .line 97
    .line 98
    .line 99
    invoke-virtual {p0, v0, v2, v1}, Lcom/p1/mobile/putong/core/ui/profile/exp/item/a;->v(Landroid/view/View;Ll/x20;Z)V

    .line 100
    .line 101
    .line 102
    iget-object v0, p0, Ll/pdf;->x:Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;

    .line 103
    .line 104
    new-instance v2, Ll/ldf;

    .line 105
    .line 106
    invoke-direct {v2, p0}, Ll/ldf;-><init>(Ll/pdf;)V

    .line 107
    .line 108
    .line 109
    invoke-virtual {p0, v0, v2, v1}, Lcom/p1/mobile/putong/core/ui/profile/exp/item/a;->v(Landroid/view/View;Ll/x20;Z)V

    .line 110
    .line 111
    .line 112
    iget-object v0, p0, Ll/pdf;->z:Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;

    .line 113
    .line 114
    new-instance v2, Ll/mdf;

    .line 115
    .line 116
    invoke-direct {v2, p0, p1}, Ll/mdf;-><init>(Ll/pdf;Z)V

    .line 117
    .line 118
    .line 119
    invoke-virtual {p0, v0, v2, v1}, Lcom/p1/mobile/putong/core/ui/profile/exp/item/a;->v(Landroid/view/View;Ll/x20;Z)V

    .line 120
    .line 121
    .line 122
    iget-object p1, p0, Ll/pdf;->A:Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;

    .line 123
    .line 124
    new-instance v0, Ll/ndf;

    .line 125
    .line 126
    invoke-direct {v0, p0}, Ll/ndf;-><init>(Ll/pdf;)V

    .line 127
    .line 128
    .line 129
    invoke-virtual {p0, p1, v0, v1}, Lcom/p1/mobile/putong/core/ui/profile/exp/item/a;->v(Landroid/view/View;Ll/x20;Z)V

    .line 130
    .line 131
    .line 132
    iget-object p1, p0, Ll/pdf;->B:Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;

    .line 133
    .line 134
    new-instance v0, Ll/odf;

    .line 135
    .line 136
    invoke-direct {v0, p0}, Ll/odf;-><init>(Ll/pdf;)V

    .line 137
    .line 138
    .line 139
    invoke-virtual {p0, p1, v0, v1}, Lcom/p1/mobile/putong/core/ui/profile/exp/item/a;->v(Landroid/view/View;Ll/x20;Z)V

    .line 140
    .line 141
    .line 142
    return-void
.end method

.method public y(Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 3
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;

    .line 2
    .line 3
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;-><init>(Landroid/content/Context;)V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Ll/pdf;->u:Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;

    .line 11
    .line 12
    const-string v1, "\u4ea4\u53cb\u76ee\u7684"

    .line 13
    .line 14
    sget v2, Ll/dbc0;->At:I

    .line 15
    .line 16
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;->d(Ljava/lang/String;I)V

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Ll/pdf;->u:Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;

    .line 20
    .line 21
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;->getDividerView()Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditDividerView;

    .line 22
    .line 23
    .line 24
    new-instance v0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;

    .line 25
    .line 26
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;-><init>(Landroid/content/Context;)V

    .line 31
    .line 32
    .line 33
    iput-object v0, p0, Ll/pdf;->v:Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;

    .line 34
    .line 35
    const-string v1, "\u8eab\u9ad8"

    .line 36
    .line 37
    sget v2, Ll/dbc0;->nt:I

    .line 38
    .line 39
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;->d(Ljava/lang/String;I)V

    .line 40
    .line 41
    .line 42
    new-instance v0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;

    .line 43
    .line 44
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 45
    .line 46
    .line 47
    move-result-object v1

    .line 48
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;-><init>(Landroid/content/Context;)V

    .line 49
    .line 50
    .line 51
    iput-object v0, p0, Ll/pdf;->w:Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;

    .line 52
    .line 53
    const-string v1, "\u804c\u4e1a"

    .line 54
    .line 55
    sget v2, Ll/dbc0;->pt:I

    .line 56
    .line 57
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;->d(Ljava/lang/String;I)V

    .line 58
    .line 59
    .line 60
    new-instance v0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;

    .line 61
    .line 62
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 63
    .line 64
    .line 65
    move-result-object v1

    .line 66
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;-><init>(Landroid/content/Context;)V

    .line 67
    .line 68
    .line 69
    iput-object v0, p0, Ll/pdf;->x:Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;

    .line 70
    .line 71
    const-string v1, "\u516c\u53f8"

    .line 72
    .line 73
    sget v2, Ll/dbc0;->ct:I

    .line 74
    .line 75
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;->d(Ljava/lang/String;I)V

    .line 76
    .line 77
    .line 78
    new-instance v0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;

    .line 79
    .line 80
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 81
    .line 82
    .line 83
    move-result-object v1

    .line 84
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;-><init>(Landroid/content/Context;)V

    .line 85
    .line 86
    .line 87
    iput-object v0, p0, Ll/pdf;->y:Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;

    .line 88
    .line 89
    const-string v1, "\u5b66\u5386"

    .line 90
    .line 91
    sget v2, Ll/dbc0;->Bt:I

    .line 92
    .line 93
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;->d(Ljava/lang/String;I)V

    .line 94
    .line 95
    .line 96
    new-instance v0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;

    .line 97
    .line 98
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 99
    .line 100
    .line 101
    move-result-object v1

    .line 102
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;-><init>(Landroid/content/Context;)V

    .line 103
    .line 104
    .line 105
    iput-object v0, p0, Ll/pdf;->z:Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;

    .line 106
    .line 107
    const-string v1, "\u5b66\u6821"

    .line 108
    .line 109
    sget v2, Ll/dbc0;->Ct:I

    .line 110
    .line 111
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;->d(Ljava/lang/String;I)V

    .line 112
    .line 113
    .line 114
    new-instance v0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;

    .line 115
    .line 116
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 117
    .line 118
    .line 119
    move-result-object v1

    .line 120
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;-><init>(Landroid/content/Context;)V

    .line 121
    .line 122
    .line 123
    iput-object v0, p0, Ll/pdf;->A:Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;

    .line 124
    .line 125
    const-string v1, "\u5bb6\u4e61"

    .line 126
    .line 127
    sget v2, Ll/dbc0;->ot:I

    .line 128
    .line 129
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;->d(Ljava/lang/String;I)V

    .line 130
    .line 131
    .line 132
    new-instance v0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;

    .line 133
    .line 134
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 135
    .line 136
    .line 137
    move-result-object v1

    .line 138
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;-><init>(Landroid/content/Context;)V

    .line 139
    .line 140
    .line 141
    iput-object v0, p0, Ll/pdf;->B:Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;

    .line 142
    .line 143
    const-string v1, "\u7ecf\u5e38\u51fa\u6ca1"

    .line 144
    .line 145
    sget v2, Ll/dbc0;->mt:I

    .line 146
    .line 147
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;->d(Ljava/lang/String;I)V

    .line 148
    .line 149
    .line 150
    new-instance v0, Landroid/widget/LinearLayout;

    .line 151
    .line 152
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 153
    .line 154
    .line 155
    move-result-object p1

    .line 156
    invoke-direct {v0, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 157
    .line 158
    .line 159
    const/4 p1, 0x1

    .line 160
    invoke-virtual {v0, p1}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 161
    .line 162
    .line 163
    iget-object p1, p0, Ll/pdf;->u:Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;

    .line 164
    .line 165
    invoke-virtual {v0, p1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 166
    .line 167
    .line 168
    iget-object p1, p0, Ll/pdf;->u:Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;

    .line 169
    .line 170
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;->getDividerView()Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditDividerView;

    .line 171
    .line 172
    .line 173
    move-result-object p1

    .line 174
    invoke-virtual {v0, p1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 175
    .line 176
    .line 177
    iget-object p1, p0, Ll/pdf;->v:Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;

    .line 178
    .line 179
    invoke-virtual {v0, p1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 180
    .line 181
    .line 182
    iget-object p1, p0, Ll/pdf;->v:Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;

    .line 183
    .line 184
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;->getDividerView()Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditDividerView;

    .line 185
    .line 186
    .line 187
    move-result-object p1

    .line 188
    invoke-virtual {v0, p1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 189
    .line 190
    .line 191
    iget-object p1, p0, Ll/pdf;->w:Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;

    .line 192
    .line 193
    invoke-virtual {v0, p1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 194
    .line 195
    .line 196
    iget-object p1, p0, Ll/pdf;->w:Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;

    .line 197
    .line 198
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;->getDividerView()Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditDividerView;

    .line 199
    .line 200
    .line 201
    move-result-object p1

    .line 202
    invoke-virtual {v0, p1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 203
    .line 204
    .line 205
    iget-object p1, p0, Ll/pdf;->x:Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;

    .line 206
    .line 207
    invoke-virtual {v0, p1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 208
    .line 209
    .line 210
    iget-object p1, p0, Ll/pdf;->x:Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;

    .line 211
    .line 212
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;->getDividerView()Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditDividerView;

    .line 213
    .line 214
    .line 215
    move-result-object p1

    .line 216
    invoke-virtual {v0, p1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 217
    .line 218
    .line 219
    iget-object p1, p0, Ll/pdf;->z:Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;

    .line 220
    .line 221
    invoke-virtual {v0, p1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 222
    .line 223
    .line 224
    iget-object p1, p0, Ll/pdf;->z:Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;

    .line 225
    .line 226
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;->getDividerView()Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditDividerView;

    .line 227
    .line 228
    .line 229
    move-result-object p1

    .line 230
    invoke-virtual {v0, p1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 231
    .line 232
    .line 233
    iget-object p1, p0, Ll/pdf;->y:Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;

    .line 234
    .line 235
    invoke-virtual {v0, p1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 236
    .line 237
    .line 238
    iget-object p1, p0, Ll/pdf;->y:Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;

    .line 239
    .line 240
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;->getDividerView()Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditDividerView;

    .line 241
    .line 242
    .line 243
    move-result-object p1

    .line 244
    invoke-virtual {v0, p1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 245
    .line 246
    .line 247
    iget-object p1, p0, Ll/pdf;->A:Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;

    .line 248
    .line 249
    invoke-virtual {v0, p1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 250
    .line 251
    .line 252
    iget-object p1, p0, Ll/pdf;->A:Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;

    .line 253
    .line 254
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;->getDividerView()Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditDividerView;

    .line 255
    .line 256
    .line 257
    move-result-object p1

    .line 258
    invoke-virtual {v0, p1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 259
    .line 260
    .line 261
    iget-object p0, p0, Ll/pdf;->B:Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;

    .line 262
    .line 263
    invoke-virtual {v0, p0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 264
    .line 265
    .line 266
    return-object v0
.end method

.method public z()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/exp/item/a;->x()Ll/t3m;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0}, Ll/t3m;->i2()Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {p0, v0}, Ll/pdf;->l0(Lcom/p1/mobile/putong/data/User;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

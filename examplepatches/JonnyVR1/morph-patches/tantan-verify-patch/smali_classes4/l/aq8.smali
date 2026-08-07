.class public Ll/aq8;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static a:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public static b:Z

.field public static c:Ll/byd0;
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "SV_USE_DUP_ID"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 1
    new-instance v0, Ll/byd0;

    .line 2
    .line 3
    const-wide/16 v1, 0x0

    .line 4
    .line 5
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    const-string v2, "lost_location_notify_dlg"

    .line 10
    .line 11
    invoke-direct {v0, v2, v1}, Ll/byd0;-><init>(Ljava/lang/String;Ljava/lang/Long;)V

    .line 12
    .line 13
    .line 14
    sput-object v0, Ll/aq8;->c:Ll/byd0;

    .line 15
    .line 16
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static bridge synthetic a()Ll/byd0;
    .locals 1

    .line 1
    sget-object v0, Ll/aq8;->c:Ll/byd0;

    return-object v0
.end method

.method public static bridge synthetic b()Ljava/util/ArrayList;
    .locals 1

    .line 1
    sget-object v0, Ll/aq8;->a:Ljava/util/ArrayList;

    return-object v0
.end method

.method public static bridge synthetic c()Ljava/lang/String;
    .locals 1

    .line 1
    invoke-static {}, Ll/aq8;->m()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static bridge synthetic d()Ljava/util/List;
    .locals 1

    .line 1
    invoke-static {}, Ll/aq8;->n()Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public static bridge synthetic e()I
    .locals 1

    .line 1
    invoke-static {}, Ll/aq8;->o()I

    move-result v0

    return v0
.end method

.method public static bridge synthetic f()I
    .locals 1

    .line 1
    invoke-static {}, Ll/aq8;->p()I

    move-result v0

    return v0
.end method

.method public static bridge synthetic g()I
    .locals 1

    .line 1
    invoke-static {}, Ll/aq8;->q()I

    move-result v0

    return v0
.end method

.method public static bridge synthetic h()Z
    .locals 1

    .line 1
    invoke-static {}, Ll/aq8;->r()Z

    move-result v0

    return v0
.end method

.method public static bridge synthetic i()Z
    .locals 1

    .line 1
    invoke-static {}, Ll/aq8;->s()Z

    move-result v0

    return v0
.end method

.method public static bridge synthetic j()Z
    .locals 1

    .line 1
    invoke-static {}, Ll/aq8;->t()Z

    move-result v0

    return v0
.end method

.method public static bridge synthetic k()Z
    .locals 1

    .line 1
    invoke-static {}, Ll/aq8;->u()Z

    move-result v0

    return v0
.end method

.method public static bridge synthetic l()V
    .locals 0

    .line 1
    invoke-static {}, Ll/aq8;->w()V

    return-void
.end method

.method public static m()Ljava/lang/String;
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->B0:Lcom/p1/mobile/putong/core/api/d0;

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/d0;->k4()Lcom/p1/mobile/putong/core/data/VerificationCenter;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    if-eqz v1, :cond_0

    .line 14
    .line 15
    iget-object v1, v0, Lcom/p1/mobile/putong/core/data/VerificationCenter;->idCard:Lcom/p1/mobile/putong/core/data/IdCardVerificationInfo;

    .line 16
    .line 17
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    if-eqz v1, :cond_0

    .line 22
    .line 23
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/VerificationCenter;->idCard:Lcom/p1/mobile/putong/core/data/IdCardVerificationInfo;

    .line 24
    .line 25
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/IdCardVerificationInfo;->status:Lcom/p1/mobile/putong/data/StudentVerificationStatus;

    .line 26
    .line 27
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    return-object v0

    .line 32
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 33
    .line 34
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 35
    .line 36
    invoke-virtual {v0}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isIdCardVerified()Z

    .line 41
    .line 42
    .line 43
    move-result v0

    .line 44
    if-eqz v0, :cond_1

    .line 45
    .line 46
    const-string v0, "verified"

    .line 47
    .line 48
    return-object v0

    .line 49
    :cond_1
    const-string v0, "unknown_"

    .line 50
    .line 51
    return-object v0
.end method

.method public static n()Ljava/util/List;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 7
    .line 8
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 9
    .line 10
    invoke-virtual {v1}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 15
    .line 16
    .line 17
    move-result v2

    .line 18
    if-eqz v2, :cond_9

    .line 19
    .line 20
    iget-object v2, v1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 21
    .line 22
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 23
    .line 24
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    .line 25
    .line 26
    iget-object v2, v2, Lcom/p1/mobile/putong/data/ProfileExtensionBasic;->hobby:Ljava/util/List;

    .line 27
    .line 28
    invoke-static {v2}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 29
    .line 30
    .line 31
    move-result v2

    .line 32
    if-nez v2, :cond_0

    .line 33
    .line 34
    const-string v2, "profile_hobby"

    .line 35
    .line 36
    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 37
    .line 38
    .line 39
    :cond_0
    iget-object v2, v1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 40
    .line 41
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 42
    .line 43
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    .line 44
    .line 45
    iget-object v2, v2, Lcom/p1/mobile/putong/data/ProfileExtensionBasic;->together:Ljava/util/List;

    .line 46
    .line 47
    invoke-static {v2}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 48
    .line 49
    .line 50
    move-result v2

    .line 51
    if-nez v2, :cond_1

    .line 52
    .line 53
    const-string v2, "profile_look_for_someone"

    .line 54
    .line 55
    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 56
    .line 57
    .line 58
    :cond_1
    iget-object v2, v1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 59
    .line 60
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 61
    .line 62
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    .line 63
    .line 64
    iget-object v2, v2, Lcom/p1/mobile/putong/data/ProfileExtensionBasic;->recent:Ljava/util/List;

    .line 65
    .line 66
    invoke-static {v2}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 67
    .line 68
    .line 69
    move-result v2

    .line 70
    if-nez v2, :cond_2

    .line 71
    .line 72
    const-string v2, "profile_recent_location"

    .line 73
    .line 74
    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 75
    .line 76
    .line 77
    :cond_2
    iget-object v2, v1, Lcom/p1/mobile/putong/data/User;->description:Ljava/lang/String;

    .line 78
    .line 79
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 80
    .line 81
    .line 82
    move-result v2

    .line 83
    if-nez v2, :cond_3

    .line 84
    .line 85
    const-string v2, "profile_about_me"

    .line 86
    .line 87
    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 88
    .line 89
    .line 90
    :cond_3
    iget-object v2, v1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 91
    .line 92
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Profile;->hometown:Ljava/lang/String;

    .line 93
    .line 94
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 95
    .line 96
    .line 97
    move-result v2

    .line 98
    if-nez v2, :cond_4

    .line 99
    .line 100
    const-string v2, "profile_come_from"

    .line 101
    .line 102
    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 103
    .line 104
    .line 105
    :cond_4
    iget-object v2, v1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 106
    .line 107
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Profile;->work:Lcom/p1/mobile/putong/data/Work;

    .line 108
    .line 109
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Work;->industry:Ljava/lang/String;

    .line 110
    .line 111
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 112
    .line 113
    .line 114
    move-result v2

    .line 115
    if-nez v2, :cond_5

    .line 116
    .line 117
    const-string v2, "profile_industry"

    .line 118
    .line 119
    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 120
    .line 121
    .line 122
    :cond_5
    iget-object v2, v1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 123
    .line 124
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Profile;->work:Lcom/p1/mobile/putong/data/Work;

    .line 125
    .line 126
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Work;->department:Ljava/lang/String;

    .line 127
    .line 128
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 129
    .line 130
    .line 131
    move-result v2

    .line 132
    if-nez v2, :cond_6

    .line 133
    .line 134
    const-string v2, "profile_job_field"

    .line 135
    .line 136
    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 137
    .line 138
    .line 139
    :cond_6
    iget-object v2, v1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 140
    .line 141
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Profile;->work:Lcom/p1/mobile/putong/data/Work;

    .line 142
    .line 143
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Work;->company:Ljava/lang/String;

    .line 144
    .line 145
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 146
    .line 147
    .line 148
    move-result v2

    .line 149
    if-nez v2, :cond_7

    .line 150
    .line 151
    const-string v2, "profile_company"

    .line 152
    .line 153
    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 154
    .line 155
    .line 156
    :cond_7
    iget-object v2, v1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 157
    .line 158
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Profile;->studies:Lcom/p1/mobile/putong/data/Studies;

    .line 159
    .line 160
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Studies;->school:Ljava/lang/String;

    .line 161
    .line 162
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 163
    .line 164
    .line 165
    move-result v2

    .line 166
    if-nez v2, :cond_8

    .line 167
    .line 168
    const-string v2, "profile_school"

    .line 169
    .line 170
    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 171
    .line 172
    .line 173
    :cond_8
    iget-object v1, v1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 174
    .line 175
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->studies:Lcom/p1/mobile/putong/data/Studies;

    .line 176
    .line 177
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Studies;->major:Ljava/lang/String;

    .line 178
    .line 179
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 180
    .line 181
    .line 182
    move-result v1

    .line 183
    if-nez v1, :cond_9

    .line 184
    .line 185
    const-string v1, "profile_major"

    .line 186
    .line 187
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 188
    .line 189
    .line 190
    :cond_9
    return-object v0
.end method

.method public static o()I
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-eqz v0, :cond_1

    .line 10
    .line 11
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 12
    .line 13
    if-eqz v0, :cond_1

    .line 14
    .line 15
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Profile;->tags:Ljava/util/List;

    .line 16
    .line 17
    if-nez v0, :cond_0

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    return v0

    .line 25
    :cond_1
    :goto_0
    const/4 v0, 0x0

    .line 26
    return v0
.end method

.method public static p()I
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-eqz v0, :cond_1

    .line 10
    .line 11
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 12
    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    return v0

    .line 21
    :cond_1
    :goto_0
    const/4 v0, 0x0

    .line 22
    return v0
.end method

.method public static q()I
    .locals 2

    .line 1
    invoke-static {}, Ll/pk50;->j()Ll/pk50;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/pk50;->f()Ll/rj50;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    sget-object v1, Lcom/p1/mobile/putong/core/oms/OmsDialog;->p_verification_merge_popup:Lcom/p1/mobile/putong/core/oms/OmsDialog;

    .line 10
    .line 11
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/oms/OmsDialog;->getIdentifier()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-virtual {v0, v1}, Ll/rj50;->P(Ljava/lang/String;)Lcom/p1/mobile/putong/data/DialogShowInfo;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    iget v0, v0, Lcom/p1/mobile/putong/data/DialogShowInfo;->totalShownCount:I

    .line 20
    .line 21
    return v0
.end method

.method public static r()Z
    .locals 1

    .line 1
    sget-boolean v0, Ll/aq8;->b:Z

    .line 2
    .line 3
    return v0
.end method

.method public static s()Z
    .locals 4

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const/4 v1, 0x0

    .line 10
    if-nez v0, :cond_0

    .line 11
    .line 12
    return v1

    .line 13
    :cond_0
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 14
    .line 15
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->B0:Lcom/p1/mobile/putong/core/api/d0;

    .line 16
    .line 17
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/api/d0;->k4()Lcom/p1/mobile/putong/core/data/VerificationCenter;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isIdCardVerified()Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-nez v0, :cond_2

    .line 26
    .line 27
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-eqz v0, :cond_1

    .line 32
    .line 33
    iget-object v0, v2, Lcom/p1/mobile/putong/core/data/VerificationCenter;->idCard:Lcom/p1/mobile/putong/core/data/IdCardVerificationInfo;

    .line 34
    .line 35
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    if-eqz v0, :cond_1

    .line 40
    .line 41
    iget-object v0, v2, Lcom/p1/mobile/putong/core/data/VerificationCenter;->idCard:Lcom/p1/mobile/putong/core/data/IdCardVerificationInfo;

    .line 42
    .line 43
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/IdCardVerificationInfo;->status:Lcom/p1/mobile/putong/data/StudentVerificationStatus;

    .line 44
    .line 45
    const-string v3, "pending"

    .line 46
    .line 47
    invoke-static {v0, v3}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 48
    .line 49
    .line 50
    move-result v0

    .line 51
    if-nez v0, :cond_2

    .line 52
    .line 53
    iget-object v0, v2, Lcom/p1/mobile/putong/core/data/VerificationCenter;->idCard:Lcom/p1/mobile/putong/core/data/IdCardVerificationInfo;

    .line 54
    .line 55
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/IdCardVerificationInfo;->status:Lcom/p1/mobile/putong/data/StudentVerificationStatus;

    .line 56
    .line 57
    const-string v2, "verified"

    .line 58
    .line 59
    invoke-static {v0, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 60
    .line 61
    .line 62
    move-result v0

    .line 63
    if-eqz v0, :cond_1

    .line 64
    .line 65
    goto :goto_0

    .line 66
    :cond_1
    const/4 v0, 0x1

    .line 67
    return v0

    .line 68
    :cond_2
    :goto_0
    return v1
.end method

.method public static t()Z
    .locals 4

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const/4 v1, 0x0

    .line 10
    if-nez v0, :cond_0

    .line 11
    .line 12
    return v1

    .line 13
    :cond_0
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 14
    .line 15
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->B0:Lcom/p1/mobile/putong/core/api/d0;

    .line 16
    .line 17
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/api/d0;->k4()Lcom/p1/mobile/putong/core/data/VerificationCenter;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isPicVerificationVerified()Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-nez v0, :cond_2

    .line 26
    .line 27
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-eqz v0, :cond_1

    .line 32
    .line 33
    iget-object v0, v2, Lcom/p1/mobile/putong/core/data/VerificationCenter;->picVerificationInfo:Lcom/p1/mobile/putong/core/data/PicVerificationInfo;

    .line 34
    .line 35
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    if-eqz v0, :cond_1

    .line 40
    .line 41
    iget-object v0, v2, Lcom/p1/mobile/putong/core/data/VerificationCenter;->picVerificationInfo:Lcom/p1/mobile/putong/core/data/PicVerificationInfo;

    .line 42
    .line 43
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/PicVerificationInfo;->status:Lcom/p1/mobile/putong/data/StudentVerificationStatus;

    .line 44
    .line 45
    const-string v3, "pending"

    .line 46
    .line 47
    invoke-static {v0, v3}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 48
    .line 49
    .line 50
    move-result v0

    .line 51
    if-nez v0, :cond_2

    .line 52
    .line 53
    iget-object v0, v2, Lcom/p1/mobile/putong/core/data/VerificationCenter;->picVerificationInfo:Lcom/p1/mobile/putong/core/data/PicVerificationInfo;

    .line 54
    .line 55
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/PicVerificationInfo;->status:Lcom/p1/mobile/putong/data/StudentVerificationStatus;

    .line 56
    .line 57
    const-string v2, "verified"

    .line 58
    .line 59
    invoke-static {v0, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 60
    .line 61
    .line 62
    move-result v0

    .line 63
    if-eqz v0, :cond_1

    .line 64
    .line 65
    goto :goto_0

    .line 66
    :cond_1
    const/4 v0, 0x1

    .line 67
    return v0

    .line 68
    :cond_2
    :goto_0
    return v1
.end method

.method public static u()Z
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/c;->o3()Lcom/p1/mobile/putong/data/Counter;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Counter;->likersLimit:Lcom/p1/mobile/putong/data/LikersLimit;

    .line 10
    .line 11
    iget v0, v0, Lcom/p1/mobile/putong/data/LikersLimit;->remaining:I

    .line 12
    .line 13
    if-lez v0, :cond_0

    .line 14
    .line 15
    const/4 v0, 0x1

    .line 16
    return v0

    .line 17
    :cond_0
    const/4 v0, 0x0

    .line 18
    return v0
.end method

.method public static v()V
    .locals 35

    .line 1
    const/4 v0, 0x0

    .line 2
    sput-object v0, Ll/aq8;->a:Ljava/util/ArrayList;

    .line 3
    .line 4
    sget-object v0, Ll/uqb0;->i0:Ll/z1f;

    .line 5
    .line 6
    new-instance v1, Ll/aq8$k;

    .line 7
    .line 8
    invoke-direct {v1}, Ll/aq8$k;-><init>()V

    .line 9
    .line 10
    .line 11
    new-instance v2, Ll/aq8$v;

    .line 12
    .line 13
    invoke-direct {v2}, Ll/aq8$v;-><init>()V

    .line 14
    .line 15
    .line 16
    new-instance v3, Ll/aq8$z;

    .line 17
    .line 18
    invoke-direct {v3}, Ll/aq8$z;-><init>()V

    .line 19
    .line 20
    .line 21
    new-instance v4, Ll/aq8$a0;

    .line 22
    .line 23
    invoke-direct {v4}, Ll/aq8$a0;-><init>()V

    .line 24
    .line 25
    .line 26
    new-instance v5, Ll/aq8$b0;

    .line 27
    .line 28
    invoke-direct {v5}, Ll/aq8$b0;-><init>()V

    .line 29
    .line 30
    .line 31
    new-instance v6, Ll/aq8$c0;

    .line 32
    .line 33
    invoke-direct {v6}, Ll/aq8$c0;-><init>()V

    .line 34
    .line 35
    .line 36
    new-instance v7, Ll/aq8$d0;

    .line 37
    .line 38
    invoke-direct {v7}, Ll/aq8$d0;-><init>()V

    .line 39
    .line 40
    .line 41
    new-instance v8, Ll/aq8$e0;

    .line 42
    .line 43
    invoke-direct {v8}, Ll/aq8$e0;-><init>()V

    .line 44
    .line 45
    .line 46
    new-instance v9, Ll/aq8$f0;

    .line 47
    .line 48
    invoke-direct {v9}, Ll/aq8$f0;-><init>()V

    .line 49
    .line 50
    .line 51
    new-instance v10, Ll/aq8$a;

    .line 52
    .line 53
    invoke-direct {v10}, Ll/aq8$a;-><init>()V

    .line 54
    .line 55
    .line 56
    new-instance v11, Ll/aq8$b;

    .line 57
    .line 58
    invoke-direct {v11}, Ll/aq8$b;-><init>()V

    .line 59
    .line 60
    .line 61
    new-instance v12, Ll/aq8$c;

    .line 62
    .line 63
    invoke-direct {v12}, Ll/aq8$c;-><init>()V

    .line 64
    .line 65
    .line 66
    new-instance v13, Ll/aq8$d;

    .line 67
    .line 68
    invoke-direct {v13}, Ll/aq8$d;-><init>()V

    .line 69
    .line 70
    .line 71
    new-instance v14, Ll/aq8$e;

    .line 72
    .line 73
    invoke-direct {v14}, Ll/aq8$e;-><init>()V

    .line 74
    .line 75
    .line 76
    new-instance v15, Ll/aq8$f;

    .line 77
    .line 78
    invoke-direct {v15}, Ll/aq8$f;-><init>()V

    .line 79
    .line 80
    .line 81
    new-instance v16, Ll/aq8$g;

    .line 82
    .line 83
    invoke-direct/range {v16 .. v16}, Ll/aq8$g;-><init>()V

    .line 84
    .line 85
    .line 86
    new-instance v17, Ll/aq8$h;

    .line 87
    .line 88
    invoke-direct/range {v17 .. v17}, Ll/aq8$h;-><init>()V

    .line 89
    .line 90
    .line 91
    new-instance v18, Ll/aq8$i;

    .line 92
    .line 93
    invoke-direct/range {v18 .. v18}, Ll/aq8$i;-><init>()V

    .line 94
    .line 95
    .line 96
    new-instance v19, Ll/aq8$j;

    .line 97
    .line 98
    invoke-direct/range {v19 .. v19}, Ll/aq8$j;-><init>()V

    .line 99
    .line 100
    .line 101
    new-instance v20, Ll/aq8$l;

    .line 102
    .line 103
    invoke-direct/range {v20 .. v20}, Ll/aq8$l;-><init>()V

    .line 104
    .line 105
    .line 106
    new-instance v21, Ll/aq8$m;

    .line 107
    .line 108
    invoke-direct/range {v21 .. v21}, Ll/aq8$m;-><init>()V

    .line 109
    .line 110
    .line 111
    new-instance v22, Ll/aq8$n;

    .line 112
    .line 113
    invoke-direct/range {v22 .. v22}, Ll/aq8$n;-><init>()V

    .line 114
    .line 115
    .line 116
    new-instance v23, Ll/aq8$o;

    .line 117
    .line 118
    invoke-direct/range {v23 .. v23}, Ll/aq8$o;-><init>()V

    .line 119
    .line 120
    .line 121
    new-instance v24, Ll/aq8$p;

    .line 122
    .line 123
    invoke-direct/range {v24 .. v24}, Ll/aq8$p;-><init>()V

    .line 124
    .line 125
    .line 126
    new-instance v25, Ll/aq8$q;

    .line 127
    .line 128
    invoke-direct/range {v25 .. v25}, Ll/aq8$q;-><init>()V

    .line 129
    .line 130
    .line 131
    new-instance v26, Ll/aq8$r;

    .line 132
    .line 133
    invoke-direct/range {v26 .. v26}, Ll/aq8$r;-><init>()V

    .line 134
    .line 135
    .line 136
    new-instance v27, Ll/aq8$s;

    .line 137
    .line 138
    invoke-direct/range {v27 .. v27}, Ll/aq8$s;-><init>()V

    .line 139
    .line 140
    .line 141
    new-instance v28, Ll/aq8$t;

    .line 142
    .line 143
    invoke-direct/range {v28 .. v28}, Ll/aq8$t;-><init>()V

    .line 144
    .line 145
    .line 146
    new-instance v29, Ll/aq8$u;

    .line 147
    .line 148
    invoke-direct/range {v29 .. v29}, Ll/aq8$u;-><init>()V

    .line 149
    .line 150
    .line 151
    new-instance v30, Ll/aq8$w;

    .line 152
    .line 153
    invoke-direct/range {v30 .. v30}, Ll/aq8$w;-><init>()V

    .line 154
    .line 155
    .line 156
    new-instance v31, Ll/aq8$x;

    .line 157
    .line 158
    invoke-direct/range {v31 .. v31}, Ll/aq8$x;-><init>()V

    .line 159
    .line 160
    .line 161
    new-instance v32, Ll/aq8$y;

    .line 162
    .line 163
    invoke-direct/range {v32 .. v32}, Ll/aq8$y;-><init>()V

    .line 164
    .line 165
    .line 166
    move-object/from16 v33, v1

    .line 167
    .line 168
    const/16 v1, 0x20

    .line 169
    .line 170
    new-array v1, v1, [Ll/m1l0;

    .line 171
    .line 172
    const/16 v34, 0x0

    .line 173
    .line 174
    aput-object v33, v1, v34

    .line 175
    .line 176
    const/16 v33, 0x1

    .line 177
    .line 178
    aput-object v2, v1, v33

    .line 179
    .line 180
    const/4 v2, 0x2

    .line 181
    aput-object v3, v1, v2

    .line 182
    .line 183
    const/4 v2, 0x3

    .line 184
    aput-object v4, v1, v2

    .line 185
    .line 186
    const/4 v2, 0x4

    .line 187
    aput-object v5, v1, v2

    .line 188
    .line 189
    const/4 v2, 0x5

    .line 190
    aput-object v6, v1, v2

    .line 191
    .line 192
    const/4 v2, 0x6

    .line 193
    aput-object v7, v1, v2

    .line 194
    .line 195
    const/4 v2, 0x7

    .line 196
    aput-object v8, v1, v2

    .line 197
    .line 198
    const/16 v2, 0x8

    .line 199
    .line 200
    aput-object v9, v1, v2

    .line 201
    .line 202
    const/16 v2, 0x9

    .line 203
    .line 204
    aput-object v10, v1, v2

    .line 205
    .line 206
    const/16 v2, 0xa

    .line 207
    .line 208
    aput-object v11, v1, v2

    .line 209
    .line 210
    const/16 v2, 0xb

    .line 211
    .line 212
    aput-object v12, v1, v2

    .line 213
    .line 214
    const/16 v2, 0xc

    .line 215
    .line 216
    aput-object v13, v1, v2

    .line 217
    .line 218
    const/16 v2, 0xd

    .line 219
    .line 220
    aput-object v14, v1, v2

    .line 221
    .line 222
    const/16 v2, 0xe

    .line 223
    .line 224
    aput-object v15, v1, v2

    .line 225
    .line 226
    const/16 v2, 0xf

    .line 227
    .line 228
    aput-object v16, v1, v2

    .line 229
    .line 230
    const/16 v2, 0x10

    .line 231
    .line 232
    aput-object v17, v1, v2

    .line 233
    .line 234
    const/16 v2, 0x11

    .line 235
    .line 236
    aput-object v18, v1, v2

    .line 237
    .line 238
    const/16 v2, 0x12

    .line 239
    .line 240
    aput-object v19, v1, v2

    .line 241
    .line 242
    const/16 v2, 0x13

    .line 243
    .line 244
    aput-object v20, v1, v2

    .line 245
    .line 246
    const/16 v2, 0x14

    .line 247
    .line 248
    aput-object v21, v1, v2

    .line 249
    .line 250
    const/16 v2, 0x15

    .line 251
    .line 252
    aput-object v22, v1, v2

    .line 253
    .line 254
    const/16 v2, 0x16

    .line 255
    .line 256
    aput-object v23, v1, v2

    .line 257
    .line 258
    const/16 v2, 0x17

    .line 259
    .line 260
    aput-object v24, v1, v2

    .line 261
    .line 262
    const/16 v2, 0x18

    .line 263
    .line 264
    aput-object v25, v1, v2

    .line 265
    .line 266
    const/16 v2, 0x19

    .line 267
    .line 268
    aput-object v26, v1, v2

    .line 269
    .line 270
    const/16 v2, 0x1a

    .line 271
    .line 272
    aput-object v27, v1, v2

    .line 273
    .line 274
    const/16 v2, 0x1b

    .line 275
    .line 276
    aput-object v28, v1, v2

    .line 277
    .line 278
    const/16 v2, 0x1c

    .line 279
    .line 280
    aput-object v29, v1, v2

    .line 281
    .line 282
    const/16 v2, 0x1d

    .line 283
    .line 284
    aput-object v30, v1, v2

    .line 285
    .line 286
    const/16 v2, 0x1e

    .line 287
    .line 288
    aput-object v31, v1, v2

    .line 289
    .line 290
    const/16 v2, 0x1f

    .line 291
    .line 292
    aput-object v32, v1, v2

    .line 293
    .line 294
    invoke-virtual {v0, v1}, Ll/z1f;->e([Ll/m1l0;)V

    .line 295
    .line 296
    .line 297
    return-void
.end method

.method public static w()V
    .locals 5

    .line 1
    sget-object v0, Ll/aq8;->a:Ljava/util/ArrayList;

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    new-instance v0, Ljava/util/ArrayList;

    .line 6
    .line 7
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 8
    .line 9
    .line 10
    sput-object v0, Ll/aq8;->a:Ljava/util/ArrayList;

    .line 11
    .line 12
    invoke-static {}, Lcom/p1/mobile/putong/api/ABManager;->g()Ljava/util/Set;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    if-eqz v1, :cond_1

    .line 21
    .line 22
    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 27
    .line 28
    .line 29
    move-result v1

    .line 30
    if-eqz v1, :cond_1

    .line 31
    .line 32
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    check-cast v1, Ljava/lang/String;

    .line 37
    .line 38
    if-eqz v1, :cond_0

    .line 39
    .line 40
    sget-object v2, Ll/aq8;->a:Ljava/util/ArrayList;

    .line 41
    .line 42
    new-instance v3, Ljava/lang/StringBuilder;

    .line 43
    .line 44
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 45
    .line 46
    .line 47
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 48
    .line 49
    .line 50
    const-string v4, ":"

    .line 51
    .line 52
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 53
    .line 54
    .line 55
    invoke-static {v1}, Lcom/p1/mobile/putong/api/ABManager;->i0(Ljava/lang/String;)Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object v1

    .line 59
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 60
    .line 61
    .line 62
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object v1

    .line 66
    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 67
    .line 68
    .line 69
    goto :goto_0

    .line 70
    :cond_1
    return-void
.end method

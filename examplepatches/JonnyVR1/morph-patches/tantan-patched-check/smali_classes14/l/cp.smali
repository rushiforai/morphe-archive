.class public Ll/cp;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final a:[Lcom/p1/mobile/putong/data/StepSignupStage;

.field public static b:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/StepSignupStage;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 1
    const-string v0, "gender-saved"

    .line 2
    .line 3
    invoke-static {v0}, Lcom/p1/mobile/putong/data/StepSignupStage;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/StepSignupStage;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-string v1, "birth-saved"

    .line 8
    .line 9
    invoke-static {v1}, Lcom/p1/mobile/putong/data/StepSignupStage;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/StepSignupStage;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    const-string v2, "name-saved"

    .line 14
    .line 15
    invoke-static {v2}, Lcom/p1/mobile/putong/data/StepSignupStage;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/StepSignupStage;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    const-string v3, "picture-saved"

    .line 20
    .line 21
    invoke-static {v3}, Lcom/p1/mobile/putong/data/StepSignupStage;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/StepSignupStage;

    .line 22
    .line 23
    .line 24
    move-result-object v3

    .line 25
    filled-new-array {v0, v1, v2, v3}, [Lcom/p1/mobile/putong/data/StepSignupStage;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    sput-object v0, Ll/cp;->a:[Lcom/p1/mobile/putong/data/StepSignupStage;

    .line 30
    .line 31
    new-instance v0, Ljava/util/ArrayList;

    .line 32
    .line 33
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 34
    .line 35
    .line 36
    sput-object v0, Ll/cp;->b:Ljava/util/List;

    .line 37
    .line 38
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

.method public static a()I
    .locals 6

    .line 1
    invoke-static {}, Ll/ike;->h()Ll/ike;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v0, v0, Ll/ike;->b:Ll/xyd0;

    .line 6
    .line 7
    invoke-virtual {v0}, Ll/dyd0;->get()Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Ljava/util/HashSet;

    .line 12
    .line 13
    invoke-virtual {v0}, Ljava/util/HashSet;->size()I

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    const/4 v2, 0x0

    .line 18
    if-nez v1, :cond_0

    .line 19
    .line 20
    return v2

    .line 21
    :cond_0
    new-instance v1, Ll/ydf0;

    .line 22
    .line 23
    invoke-direct {v1}, Ll/ydf0;-><init>()V

    .line 24
    .line 25
    .line 26
    invoke-static {v0, v1}, Ll/jyb;->Q(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    sget-object v1, Ll/cp;->a:[Lcom/p1/mobile/putong/data/StepSignupStage;

    .line 31
    .line 32
    array-length v3, v1

    .line 33
    move v4, v2

    .line 34
    :goto_0
    if-ge v2, v3, :cond_2

    .line 35
    .line 36
    aget-object v5, v1, v2

    .line 37
    .line 38
    invoke-interface {v0, v5}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 39
    .line 40
    .line 41
    move-result v5

    .line 42
    if-eqz v5, :cond_1

    .line 43
    .line 44
    add-int/lit8 v4, v4, 0x1

    .line 45
    .line 46
    :cond_1
    add-int/lit8 v2, v2, 0x1

    .line 47
    .line 48
    goto :goto_0

    .line 49
    :cond_2
    return v4
.end method

.method public static b(Ljava/util/List;)Lcom/p1/mobile/putong/data/StepSignupStage;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/StepSignupStage;",
            ">;)",
            "Lcom/p1/mobile/putong/data/StepSignupStage;"
        }
    .end annotation

    .line 1
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-static {}, Ll/cp;->c()Ljava/util/List;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    const/4 v0, 0x0

    .line 12
    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    check-cast p0, Lcom/p1/mobile/putong/data/StepSignupStage;

    .line 17
    .line 18
    return-object p0

    .line 19
    :cond_0
    invoke-static {}, Ll/cp;->c()Ljava/util/List;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    :cond_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 28
    .line 29
    .line 30
    move-result v1

    .line 31
    if-eqz v1, :cond_2

    .line 32
    .line 33
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    check-cast v1, Lcom/p1/mobile/putong/data/StepSignupStage;

    .line 38
    .line 39
    invoke-interface {p0, v1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 40
    .line 41
    .line 42
    move-result v2

    .line 43
    if-nez v2, :cond_1

    .line 44
    .line 45
    return-object v1

    .line 46
    :cond_2
    const/4 p0, 0x0

    .line 47
    return-object p0
.end method

.method public static c()Ljava/util/List;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/StepSignupStage;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object v0, Ll/cp;->b:Ljava/util/List;

    .line 2
    .line 3
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const-string v1, "google-email-saved"

    .line 8
    .line 9
    if-nez v0, :cond_1

    .line 10
    .line 11
    sget-object v0, Ll/awi0;->b:Ll/jxd0;

    .line 12
    .line 13
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    check-cast v0, Ljava/lang/Boolean;

    .line 18
    .line 19
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-eqz v0, :cond_0

    .line 24
    .line 25
    sget-object v0, Ll/cp;->b:Ljava/util/List;

    .line 26
    .line 27
    invoke-static {v1}, Lcom/p1/mobile/putong/data/StepSignupStage;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/StepSignupStage;

    .line 28
    .line 29
    .line 30
    move-result-object v2

    .line 31
    invoke-interface {v0, v2}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    if-nez v0, :cond_0

    .line 36
    .line 37
    sget-object v0, Ll/cp;->b:Ljava/util/List;

    .line 38
    .line 39
    const/4 v2, 0x0

    .line 40
    invoke-static {v1}, Lcom/p1/mobile/putong/data/StepSignupStage;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/StepSignupStage;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    invoke-interface {v0, v2, v1}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 45
    .line 46
    .line 47
    :cond_0
    sget-object v0, Ll/cp;->b:Ljava/util/List;

    .line 48
    .line 49
    return-object v0

    .line 50
    :cond_1
    sget-object v0, Ll/awi0;->b:Ll/jxd0;

    .line 51
    .line 52
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    check-cast v0, Ljava/lang/Boolean;

    .line 57
    .line 58
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 59
    .line 60
    .line 61
    move-result v0

    .line 62
    if-eqz v0, :cond_2

    .line 63
    .line 64
    sget-object v0, Ll/cp;->b:Ljava/util/List;

    .line 65
    .line 66
    invoke-static {v1}, Lcom/p1/mobile/putong/data/StepSignupStage;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/StepSignupStage;

    .line 67
    .line 68
    .line 69
    move-result-object v1

    .line 70
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 71
    .line 72
    .line 73
    :cond_2
    sget-object v0, Ll/cp;->b:Ljava/util/List;

    .line 74
    .line 75
    const-string v1, "gender-saved"

    .line 76
    .line 77
    invoke-static {v1}, Lcom/p1/mobile/putong/data/StepSignupStage;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/StepSignupStage;

    .line 78
    .line 79
    .line 80
    move-result-object v1

    .line 81
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 82
    .line 83
    .line 84
    sget-object v0, Ll/cp;->b:Ljava/util/List;

    .line 85
    .line 86
    const-string v1, "birth-saved"

    .line 87
    .line 88
    invoke-static {v1}, Lcom/p1/mobile/putong/data/StepSignupStage;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/StepSignupStage;

    .line 89
    .line 90
    .line 91
    move-result-object v1

    .line 92
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 93
    .line 94
    .line 95
    sget-object v0, Ll/cp;->b:Ljava/util/List;

    .line 96
    .line 97
    const-string v1, "name-saved"

    .line 98
    .line 99
    invoke-static {v1}, Lcom/p1/mobile/putong/data/StepSignupStage;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/StepSignupStage;

    .line 100
    .line 101
    .line 102
    move-result-object v1

    .line 103
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 104
    .line 105
    .line 106
    sget-object v0, Ll/cp;->b:Ljava/util/List;

    .line 107
    .line 108
    const-string v1, "intlFriendPurpose-saved"

    .line 109
    .line 110
    invoke-static {v1}, Lcom/p1/mobile/putong/data/StepSignupStage;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/StepSignupStage;

    .line 111
    .line 112
    .line 113
    move-result-object v1

    .line 114
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 115
    .line 116
    .line 117
    invoke-static {}, Lcom/p1/mobile/putong/ab/IntlCountryCodeController;->j()Z

    .line 118
    .line 119
    .line 120
    move-result v0

    .line 121
    if-eqz v0, :cond_3

    .line 122
    .line 123
    sget-object v0, Ll/cp;->b:Ljava/util/List;

    .line 124
    .line 125
    const-string v1, "ethnicity-saved"

    .line 126
    .line 127
    invoke-static {v1}, Lcom/p1/mobile/putong/data/StepSignupStage;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/StepSignupStage;

    .line 128
    .line 129
    .line 130
    move-result-object v1

    .line 131
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 132
    .line 133
    .line 134
    sget-object v0, Ll/cp;->b:Ljava/util/List;

    .line 135
    .line 136
    const-string v1, "language-saved"

    .line 137
    .line 138
    invoke-static {v1}, Lcom/p1/mobile/putong/data/StepSignupStage;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/StepSignupStage;

    .line 139
    .line 140
    .line 141
    move-result-object v1

    .line 142
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 143
    .line 144
    .line 145
    :cond_3
    sget-object v0, Ll/cp;->b:Ljava/util/List;

    .line 146
    .line 147
    const-string v1, "picture-saved"

    .line 148
    .line 149
    invoke-static {v1}, Lcom/p1/mobile/putong/data/StepSignupStage;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/StepSignupStage;

    .line 150
    .line 151
    .line 152
    move-result-object v1

    .line 153
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 154
    .line 155
    .line 156
    sget-object v0, Ll/cp;->b:Ljava/util/List;

    .line 157
    .line 158
    return-object v0
.end method

.method public static d(Lcom/p1/mobile/putong/data/User;)Z
    .locals 2

    .line 1
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x1

    .line 6
    if-eqz v0, :cond_1

    .line 7
    .line 8
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 9
    .line 10
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-eqz v0, :cond_1

    .line 15
    .line 16
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 17
    .line 18
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Settings;->phoneNumber:Lcom/p1/mobile/putong/data/PhoneNumber;

    .line 19
    .line 20
    iget-object v0, v0, Lcom/p1/mobile/putong/data/PhoneNumber;->number:Ljava/lang/String;

    .line 21
    .line 22
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    if-eqz v0, :cond_0

    .line 27
    .line 28
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 29
    .line 30
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Settings;->linkedPhoneNumber:Lcom/p1/mobile/putong/data/PhoneNumber;

    .line 31
    .line 32
    iget-object p0, p0, Lcom/p1/mobile/putong/data/PhoneNumber;->number:Ljava/lang/String;

    .line 33
    .line 34
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 35
    .line 36
    .line 37
    move-result p0

    .line 38
    if-nez p0, :cond_1

    .line 39
    .line 40
    :cond_0
    move p0, v1

    .line 41
    goto :goto_0

    .line 42
    :cond_1
    const/4 p0, 0x0

    .line 43
    :goto_0
    xor-int/2addr p0, v1

    .line 44
    return p0
.end method

.method public static e(Lcom/p1/mobile/android/app/Act;)Landroid/content/Intent;
    .locals 1

    .line 1
    invoke-static {}, Ll/ike;->h()Ll/ike;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v0, v0, Ll/ike;->a:Ll/wyd0;

    .line 6
    .line 7
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Ljava/lang/String;

    .line 12
    .line 13
    invoke-static {p0, v0}, Ll/cp;->f(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)Landroid/content/Intent;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0
.end method

.method public static f(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)Landroid/content/Intent;
    .locals 2

    .line 1
    invoke-static {p1}, Lcom/p1/mobile/putong/data/SignupStage;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/SignupStage;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-static {}, Ll/ike;->h()Ll/ike;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-object v0, v0, Ll/ike;->b:Ll/xyd0;

    .line 10
    .line 11
    invoke-virtual {v0}, Ll/dyd0;->get()Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    check-cast v0, Ljava/util/Collection;

    .line 16
    .line 17
    new-instance v1, Ll/ydf0;

    .line 18
    .line 19
    invoke-direct {v1}, Ll/ydf0;-><init>()V

    .line 20
    .line 21
    .line 22
    invoke-static {v0, v1}, Ll/jyb;->Q(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-static {p0, v0, p1}, Ll/cp;->g(Lcom/p1/mobile/android/app/Act;Ljava/util/List;Lcom/p1/mobile/putong/data/SignupStage;)Landroid/content/Intent;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    return-object p0
.end method

.method public static g(Lcom/p1/mobile/android/app/Act;Ljava/util/List;Lcom/p1/mobile/putong/data/SignupStage;)Landroid/content/Intent;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/StepSignupStage;",
            ">;",
            "Lcom/p1/mobile/putong/data/SignupStage;",
            ")",
            "Landroid/content/Intent;"
        }
    .end annotation

    .line 1
    const-string v0, "account"

    .line 2
    .line 3
    sget-object v1, Lcom/tantanapp/common/utils/CrashHelper$ReportLevel;->p9:Lcom/tantanapp/common/utils/CrashHelper$ReportLevel;

    .line 4
    .line 5
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/utils/NullChecker;->c(Ljava/lang/Object;Ljava/lang/String;Lcom/tantanapp/common/utils/CrashHelper$ReportLevel;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    invoke-static {}, Ll/ike;->h()Ll/ike;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    invoke-virtual {p1}, Ll/ike;->m()V

    .line 16
    .line 17
    .line 18
    invoke-static {p0}, Lcom/p1/mobile/putong/ui/splash/SplashProxyAct;->l(Landroid/content/Context;)Landroid/content/Intent;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    return-object p0

    .line 23
    :cond_0
    const-string v0, "finished"

    .line 24
    .line 25
    invoke-static {p2, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    const/4 v1, 0x1

    .line 30
    const/4 v2, 0x0

    .line 31
    if-eqz v0, :cond_1

    .line 32
    .line 33
    invoke-static {}, Lcom/p1/mobile/putong/account/AccountModule;->H()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    invoke-interface {p1, p0, v2, v1}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->newMainActClearStack(Landroid/content/Context;ZZ)Landroid/content/Intent;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    return-object p0

    .line 42
    :cond_1
    const-string v0, "unknown_"

    .line 43
    .line 44
    invoke-static {p2, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 45
    .line 46
    .line 47
    move-result p2

    .line 48
    if-nez p2, :cond_8

    .line 49
    .line 50
    invoke-static {p1}, Ll/cp;->i(Ljava/util/List;)Lcom/p1/mobile/putong/data/StepSignupStage;

    .line 51
    .line 52
    .line 53
    move-result-object p1

    .line 54
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 55
    .line 56
    .line 57
    move-result p2

    .line 58
    if-eqz p2, :cond_7

    .line 59
    .line 60
    const-string p2, "picture-saved"

    .line 61
    .line 62
    invoke-static {p1, p2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 63
    .line 64
    .line 65
    move-result p2

    .line 66
    if-eqz p2, :cond_2

    .line 67
    .line 68
    invoke-static {p0}, Lcom/p1/mobile/putong/account/ui/accountnew/SignUpProfileImageAct;->X1(Landroid/content/Context;)Landroid/content/Intent;

    .line 69
    .line 70
    .line 71
    move-result-object p0

    .line 72
    return-object p0

    .line 73
    :cond_2
    const-string p2, "google-email-saved"

    .line 74
    .line 75
    invoke-static {p1, p2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 76
    .line 77
    .line 78
    move-result p2

    .line 79
    if-eqz p2, :cond_3

    .line 80
    .line 81
    const-string p1, "bind-email"

    .line 82
    .line 83
    invoke-static {p1}, Lcom/p1/mobile/putong/data/VerifyReason;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/VerifyReason;

    .line 84
    .line 85
    .line 86
    move-result-object p1

    .line 87
    const-string p2, "google_login_verify_email"

    .line 88
    .line 89
    invoke-static {p0, p1, p2}, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/act/EmailLoginOptAct;->Z1(Landroid/content/Context;Lcom/p1/mobile/putong/data/VerifyReason;Ljava/lang/String;)Landroid/content/Intent;

    .line 90
    .line 91
    .line 92
    move-result-object p0

    .line 93
    return-object p0

    .line 94
    :cond_3
    const-string p2, "intlFriendPurpose-saved"

    .line 95
    .line 96
    invoke-static {p1, p2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 97
    .line 98
    .line 99
    move-result p2

    .line 100
    if-eqz p2, :cond_4

    .line 101
    .line 102
    sget-object p1, Lcom/p1/mobile/putong/account/ui/accountnew/intlsignup/intlfirendpurpose/SignUpIntlFriendPurposeAct;->Companion:Lcom/p1/mobile/putong/account/ui/accountnew/intlsignup/intlfirendpurpose/SignUpIntlFriendPurposeAct$a;

    .line 103
    .line 104
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/account/ui/accountnew/intlsignup/intlfirendpurpose/SignUpIntlFriendPurposeAct$a;->a(Landroid/content/Context;)Landroid/content/Intent;

    .line 105
    .line 106
    .line 107
    move-result-object p0

    .line 108
    return-object p0

    .line 109
    :cond_4
    const-string p2, "ethnicity-saved"

    .line 110
    .line 111
    invoke-static {p1, p2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 112
    .line 113
    .line 114
    move-result p2

    .line 115
    if-eqz p2, :cond_5

    .line 116
    .line 117
    sget-object p1, Lcom/p1/mobile/putong/account/ui/accountnew/intlsignup/SignUpIntlEthnicityLanguageAct;->Companion:Lcom/p1/mobile/putong/account/ui/accountnew/intlsignup/SignUpIntlEthnicityLanguageAct$a;

    .line 118
    .line 119
    invoke-virtual {p1, p0, v2}, Lcom/p1/mobile/putong/account/ui/accountnew/intlsignup/SignUpIntlEthnicityLanguageAct$a;->a(Landroid/content/Context;Z)Landroid/content/Intent;

    .line 120
    .line 121
    .line 122
    move-result-object p0

    .line 123
    return-object p0

    .line 124
    :cond_5
    const-string p2, "language-saved"

    .line 125
    .line 126
    invoke-static {p1, p2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 127
    .line 128
    .line 129
    move-result p1

    .line 130
    if-eqz p1, :cond_6

    .line 131
    .line 132
    sget-object p1, Lcom/p1/mobile/putong/account/ui/accountnew/intlsignup/SignUpIntlEthnicityLanguageAct;->Companion:Lcom/p1/mobile/putong/account/ui/accountnew/intlsignup/SignUpIntlEthnicityLanguageAct$a;

    .line 133
    .line 134
    invoke-virtual {p1, p0, v1}, Lcom/p1/mobile/putong/account/ui/accountnew/intlsignup/SignUpIntlEthnicityLanguageAct$a;->a(Landroid/content/Context;Z)Landroid/content/Intent;

    .line 135
    .line 136
    .line 137
    move-result-object p0

    .line 138
    return-object p0

    .line 139
    :cond_6
    invoke-static {p0}, Lcom/p1/mobile/putong/account/ui/accountnew/SignUpDetailsNewAct;->a2(Landroid/content/Context;)Landroid/content/Intent;

    .line 140
    .line 141
    .line 142
    move-result-object p0

    .line 143
    return-object p0

    .line 144
    :cond_7
    invoke-static {}, Ll/ike;->h()Ll/ike;

    .line 145
    .line 146
    .line 147
    move-result-object p1

    .line 148
    invoke-virtual {p1}, Ll/ike;->m()V

    .line 149
    .line 150
    .line 151
    invoke-static {p0}, Lcom/p1/mobile/putong/ui/splash/SplashProxyAct;->l(Landroid/content/Context;)Landroid/content/Intent;

    .line 152
    .line 153
    .line 154
    move-result-object p0

    .line 155
    return-object p0

    .line 156
    :cond_8
    invoke-static {}, Ll/ike;->h()Ll/ike;

    .line 157
    .line 158
    .line 159
    move-result-object p1

    .line 160
    invoke-virtual {p1}, Ll/ike;->m()V

    .line 161
    .line 162
    .line 163
    invoke-static {p0}, Lcom/p1/mobile/putong/ui/splash/SplashProxyAct;->l(Landroid/content/Context;)Landroid/content/Intent;

    .line 164
    .line 165
    .line 166
    move-result-object p0

    .line 167
    return-object p0
.end method

.method public static h()Lcom/p1/mobile/putong/data/StepSignupStage;
    .locals 2

    .line 1
    invoke-static {}, Ll/ike;->h()Ll/ike;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v0, v0, Ll/ike;->b:Ll/xyd0;

    .line 6
    .line 7
    invoke-virtual {v0}, Ll/dyd0;->get()Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Ljava/util/HashSet;

    .line 12
    .line 13
    new-instance v1, Ll/ydf0;

    .line 14
    .line 15
    invoke-direct {v1}, Ll/ydf0;-><init>()V

    .line 16
    .line 17
    .line 18
    invoke-static {v0, v1}, Ll/jyb;->Q(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-static {v0}, Ll/cp;->i(Ljava/util/List;)Lcom/p1/mobile/putong/data/StepSignupStage;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    return-object v0
.end method

.method public static i(Ljava/util/List;)Lcom/p1/mobile/putong/data/StepSignupStage;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/StepSignupStage;",
            ">;)",
            "Lcom/p1/mobile/putong/data/StepSignupStage;"
        }
    .end annotation

    .line 1
    invoke-static {p0}, Ll/cp;->b(Ljava/util/List;)Lcom/p1/mobile/putong/data/StepSignupStage;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static j(JLjava/util/List;)I
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)I"
        }
    .end annotation

    .line 1
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-interface {p2}, Ljava/util/List;->size()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    const/4 v1, 0x1

    .line 12
    if-le v0, v1, :cond_0

    .line 13
    .line 14
    invoke-interface {p2}, Ljava/util/List;->size()I

    .line 15
    .line 16
    .line 17
    move-result p2

    .line 18
    int-to-long v0, p2

    .line 19
    mul-long/2addr p0, v0

    .line 20
    const-wide/16 v0, 0x3e8

    .line 21
    .line 22
    div-long/2addr p0, v0

    .line 23
    long-to-int p0, p0

    .line 24
    add-int/lit8 p0, p0, 0x3

    .line 25
    .line 26
    return p0

    .line 27
    :cond_0
    const/4 p0, 0x0

    .line 28
    return p0
.end method

.method public static k(Landroid/content/Context;Lcom/p1/mobile/putong/data/SignUpData;)Landroid/content/Intent;
    .locals 2

    .line 1
    invoke-static {}, Ll/cp;->h()Lcom/p1/mobile/putong/data/StepSignupStage;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "intlFriendPurpose-saved"

    .line 6
    .line 7
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    if-eqz v1, :cond_0

    .line 12
    .line 13
    sget-object p1, Lcom/p1/mobile/putong/account/ui/accountnew/intlsignup/intlfirendpurpose/SignUpIntlFriendPurposeAct;->Companion:Lcom/p1/mobile/putong/account/ui/accountnew/intlsignup/intlfirendpurpose/SignUpIntlFriendPurposeAct$a;

    .line 14
    .line 15
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/account/ui/accountnew/intlsignup/intlfirendpurpose/SignUpIntlFriendPurposeAct$a;->a(Landroid/content/Context;)Landroid/content/Intent;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    return-object p0

    .line 20
    :cond_0
    const-string v1, "google-email-saved"

    .line 21
    .line 22
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 23
    .line 24
    .line 25
    move-result v1

    .line 26
    if-eqz v1, :cond_1

    .line 27
    .line 28
    const-string p1, "bind-email"

    .line 29
    .line 30
    invoke-static {p1}, Lcom/p1/mobile/putong/data/VerifyReason;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/VerifyReason;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    const-string v0, "google_login_verify_email"

    .line 35
    .line 36
    invoke-static {p0, p1, v0}, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/act/EmailLoginOptAct;->Z1(Landroid/content/Context;Lcom/p1/mobile/putong/data/VerifyReason;Ljava/lang/String;)Landroid/content/Intent;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    return-object p0

    .line 41
    :cond_1
    const-string v1, "ethnicity-saved"

    .line 42
    .line 43
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 44
    .line 45
    .line 46
    move-result v1

    .line 47
    if-eqz v1, :cond_2

    .line 48
    .line 49
    sget-object v0, Lcom/p1/mobile/putong/account/ui/accountnew/intlsignup/SignUpIntlEthnicityLanguageAct;->Companion:Lcom/p1/mobile/putong/account/ui/accountnew/intlsignup/SignUpIntlEthnicityLanguageAct$a;

    .line 50
    .line 51
    const/4 v1, 0x0

    .line 52
    invoke-virtual {v0, p0, v1, p1}, Lcom/p1/mobile/putong/account/ui/accountnew/intlsignup/SignUpIntlEthnicityLanguageAct$a;->b(Landroid/content/Context;ZLcom/p1/mobile/putong/data/SignUpData;)Landroid/content/Intent;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    return-object p0

    .line 57
    :cond_2
    const-string v1, "language-saved"

    .line 58
    .line 59
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 60
    .line 61
    .line 62
    move-result v0

    .line 63
    if-eqz v0, :cond_3

    .line 64
    .line 65
    sget-object v0, Lcom/p1/mobile/putong/account/ui/accountnew/intlsignup/SignUpIntlEthnicityLanguageAct;->Companion:Lcom/p1/mobile/putong/account/ui/accountnew/intlsignup/SignUpIntlEthnicityLanguageAct$a;

    .line 66
    .line 67
    const/4 v1, 0x1

    .line 68
    invoke-virtual {v0, p0, v1, p1}, Lcom/p1/mobile/putong/account/ui/accountnew/intlsignup/SignUpIntlEthnicityLanguageAct$a;->b(Landroid/content/Context;ZLcom/p1/mobile/putong/data/SignUpData;)Landroid/content/Intent;

    .line 69
    .line 70
    .line 71
    move-result-object p0

    .line 72
    return-object p0

    .line 73
    :cond_3
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/account/ui/accountnew/SignUpProfileImageAct;->Y1(Landroid/content/Context;Lcom/p1/mobile/putong/data/SignUpData;)Landroid/content/Intent;

    .line 74
    .line 75
    .line 76
    move-result-object p0

    .line 77
    return-object p0
.end method

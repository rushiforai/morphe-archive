.class public interface abstract Ll/ue6;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public static synthetic B0(Lcom/p1/mobile/putong/core/data/SwitchConvNextConfig;Lcom/p1/mobile/putong/core/data/Conversation;)Ljava/lang/Boolean;
    .locals 5

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 4
    .line 5
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/core/api/g;->Um(Ljava/lang/String;)Ljava/util/List;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 18
    .line 19
    return-object p0

    .line 20
    :cond_0
    invoke-static {}, Ll/pzi0;->o()J

    .line 21
    .line 22
    .line 23
    move-result-wide v0

    .line 24
    long-to-double v0, v0

    .line 25
    const/4 v2, 0x0

    .line 26
    invoke-interface {p1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    check-cast p1, Lcom/p1/mobile/putong/core/data/Message;

    .line 31
    .line 32
    iget-wide v3, p1, Lcom/p1/mobile/putong/core/data/Message;->createdTime:D

    .line 33
    .line 34
    sub-double/2addr v0, v3

    .line 35
    iget p0, p0, Lcom/p1/mobile/putong/core/data/SwitchConvNextConfig;->exp_limit_hours:I

    .line 36
    .line 37
    int-to-long p0, p0

    .line 38
    sget-object v3, Ljava/util/concurrent/TimeUnit;->HOURS:Ljava/util/concurrent/TimeUnit;

    .line 39
    .line 40
    invoke-virtual {v3, p0, p1}, Ljava/util/concurrent/TimeUnit;->toMillis(J)J

    .line 41
    .line 42
    .line 43
    move-result-wide p0

    .line 44
    long-to-double p0, p0

    .line 45
    cmpg-double p0, v0, p0

    .line 46
    .line 47
    if-gez p0, :cond_1

    .line 48
    .line 49
    const-wide/16 p0, 0x0

    .line 50
    .line 51
    cmpl-double p0, v0, p0

    .line 52
    .line 53
    if-lez p0, :cond_1

    .line 54
    .line 55
    const/4 v2, 0x1

    .line 56
    :cond_1
    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 57
    .line 58
    .line 59
    move-result-object p0

    .line 60
    return-object p0
.end method

.method public static C(Ljava/lang/String;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static C0(Lcom/p1/mobile/putong/core/data/Conversation;)Z
    .locals 2

    .line 1
    invoke-static {}, Ll/d79;->U()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    invoke-static {}, Ll/gra;->I2()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_1

    .line 12
    .line 13
    :cond_0
    iget-object v0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 14
    .line 15
    const-string v1, "fake_conversation_greeting"

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
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 24
    .line 25
    const-string v0, "fake_conversation_anonymous_greeting"

    .line 26
    .line 27
    invoke-static {p0, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 28
    .line 29
    .line 30
    move-result p0

    .line 31
    if-eqz p0, :cond_1

    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_1
    const/4 p0, 0x0

    .line 35
    return p0

    .line 36
    :cond_2
    :goto_0
    const/4 p0, 0x1

    .line 37
    return p0
.end method

.method public static G(Lcom/p1/mobile/android/app/Act;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    sget v0, Ll/kec0;->D1:I

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    invoke-virtual {p0, v0, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method

.method public static synthetic L(Lcom/p1/mobile/putong/core/data/Conversation;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic N(Lcom/p1/mobile/putong/core/data/Conversation;)Ljava/lang/Boolean;
    .locals 7

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/core/api/g;->Um(Ljava/lang/String;)Ljava/util/List;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 18
    .line 19
    return-object p0

    .line 20
    :cond_0
    const/4 v0, 0x0

    .line 21
    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    check-cast p0, Lcom/p1/mobile/putong/core/data/Message;

    .line 26
    .line 27
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 28
    .line 29
    const-string v2, "default"

    .line 30
    .line 31
    invoke-static {v1, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 32
    .line 33
    .line 34
    move-result v1

    .line 35
    const/4 v2, 0x1

    .line 36
    if-nez v1, :cond_2

    .line 37
    .line 38
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 39
    .line 40
    const-string v3, "text"

    .line 41
    .line 42
    invoke-static {v1, v3}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 43
    .line 44
    .line 45
    move-result v1

    .line 46
    if-nez v1, :cond_2

    .line 47
    .line 48
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 49
    .line 50
    const-string v3, "video"

    .line 51
    .line 52
    invoke-static {v1, v3}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 53
    .line 54
    .line 55
    move-result v1

    .line 56
    if-nez v1, :cond_2

    .line 57
    .line 58
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 59
    .line 60
    const-string v3, "audio"

    .line 61
    .line 62
    invoke-static {v1, v3}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 63
    .line 64
    .line 65
    move-result v1

    .line 66
    if-nez v1, :cond_2

    .line 67
    .line 68
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 69
    .line 70
    const-string v3, "picture"

    .line 71
    .line 72
    invoke-static {v1, v3}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 73
    .line 74
    .line 75
    move-result v1

    .line 76
    if-eqz v1, :cond_1

    .line 77
    .line 78
    goto :goto_0

    .line 79
    :cond_1
    move v1, v0

    .line 80
    goto :goto_1

    .line 81
    :cond_2
    :goto_0
    move v1, v2

    .line 82
    :goto_1
    invoke-static {}, Ll/pzi0;->o()J

    .line 83
    .line 84
    .line 85
    move-result-wide v3

    .line 86
    long-to-double v3, v3

    .line 87
    iget-wide v5, p0, Lcom/p1/mobile/putong/core/data/Message;->createdTime:D

    .line 88
    .line 89
    sub-double/2addr v3, v5

    .line 90
    const-wide v5, 0x41aee62800000000L    # 2.592E8

    .line 91
    .line 92
    .line 93
    .line 94
    .line 95
    cmpg-double v5, v3, v5

    .line 96
    .line 97
    if-gez v5, :cond_3

    .line 98
    .line 99
    const-wide/16 v5, 0x0

    .line 100
    .line 101
    cmpl-double v3, v3, v5

    .line 102
    .line 103
    if-lez v3, :cond_3

    .line 104
    .line 105
    move v3, v2

    .line 106
    goto :goto_2

    .line 107
    :cond_3
    move v3, v0

    .line 108
    :goto_2
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Message;->owner:Ljava/lang/String;

    .line 109
    .line 110
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 111
    .line 112
    .line 113
    move-result-object v4

    .line 114
    invoke-interface {v4}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 115
    .line 116
    .line 117
    move-result-object v4

    .line 118
    invoke-static {p0, v4}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 119
    .line 120
    .line 121
    move-result p0

    .line 122
    if-eqz v1, :cond_4

    .line 123
    .line 124
    if-eqz v3, :cond_4

    .line 125
    .line 126
    if-nez p0, :cond_4

    .line 127
    .line 128
    move v0, v2

    .line 129
    :cond_4
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 130
    .line 131
    .line 132
    move-result-object p0

    .line 133
    return-object p0
.end method

.method public static synthetic W0(Lcom/p1/mobile/putong/core/data/Conversation;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public static Z(Lcom/p1/mobile/android/app/Act;Landroid/view/ViewGroup;Z)Landroid/view/View;
    .locals 1

    .line 1
    if-eqz p0, :cond_2

    .line 2
    .line 3
    if-nez p1, :cond_0

    .line 4
    .line 5
    goto :goto_1

    .line 6
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    if-eqz p2, :cond_1

    .line 11
    .line 12
    sget p2, Ll/kec0;->E1:I

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_1
    sget p2, Ll/kec0;->me:I

    .line 16
    .line 17
    :goto_0
    const/4 v0, 0x0

    .line 18
    invoke-virtual {p0, p2, p1, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    return-object p0

    .line 23
    :cond_2
    :goto_1
    new-instance p1, Landroid/view/View;

    .line 24
    .line 25
    invoke-direct {p1, p0}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 26
    .line 27
    .line 28
    return-object p1
.end method

.method public static a(Lcom/p1/mobile/android/app/Act;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-static {p0, p1, v0}, Ll/ue6;->Z(Lcom/p1/mobile/android/app/Act;Landroid/view/ViewGroup;Z)Landroid/view/View;

    .line 3
    .line 4
    .line 5
    move-result-object p0

    .line 6
    return-object p0
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/core/data/ChatHeat;)Ll/pf60;
    .locals 1

    .line 1
    const-string v0, ""

    .line 2
    .line 3
    invoke-static {p0, v0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public static e0(Landroid/widget/TextView;)V
    .locals 1

    .line 1
    const/high16 v0, 0x41600000    # 14.0f

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setTextSize(F)V

    .line 4
    .line 5
    .line 6
    sget v0, Ll/sj6;->T:I

    .line 7
    .line 8
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public static synthetic f0(Lcom/p1/mobile/putong/core/data/SwitchConvNextConfig;Lcom/p1/mobile/putong/core/data/Conversation;)Ljava/lang/Boolean;
    .locals 5

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 4
    .line 5
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/core/api/g;->Um(Ljava/lang/String;)Ljava/util/List;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 18
    .line 19
    return-object p0

    .line 20
    :cond_0
    invoke-static {}, Ll/pzi0;->o()J

    .line 21
    .line 22
    .line 23
    move-result-wide v0

    .line 24
    long-to-double v0, v0

    .line 25
    const/4 v2, 0x0

    .line 26
    invoke-interface {p1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    check-cast p1, Lcom/p1/mobile/putong/core/data/Message;

    .line 31
    .line 32
    iget-wide v3, p1, Lcom/p1/mobile/putong/core/data/Message;->createdTime:D

    .line 33
    .line 34
    sub-double/2addr v0, v3

    .line 35
    iget p0, p0, Lcom/p1/mobile/putong/core/data/SwitchConvNextConfig;->exp_limit_hours:I

    .line 36
    .line 37
    int-to-long p0, p0

    .line 38
    sget-object v3, Ljava/util/concurrent/TimeUnit;->HOURS:Ljava/util/concurrent/TimeUnit;

    .line 39
    .line 40
    invoke-virtual {v3, p0, p1}, Ljava/util/concurrent/TimeUnit;->toMillis(J)J

    .line 41
    .line 42
    .line 43
    move-result-wide p0

    .line 44
    long-to-double p0, p0

    .line 45
    cmpg-double p0, v0, p0

    .line 46
    .line 47
    if-gez p0, :cond_1

    .line 48
    .line 49
    const-wide/16 p0, 0x0

    .line 50
    .line 51
    cmpl-double p0, v0, p0

    .line 52
    .line 53
    if-lez p0, :cond_1

    .line 54
    .line 55
    const/4 v2, 0x1

    .line 56
    :cond_1
    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 57
    .line 58
    .line 59
    move-result-object p0

    .line 60
    return-object p0
.end method

.method public static synthetic i(Ll/ue6;Ljava/lang/String;Lcom/p1/mobile/putong/core/api/c0$c;Ll/pf60;)V
    .locals 0

    .line 1
    invoke-interface {p0, p1, p2, p3}, Ll/ue6;->g0(Ljava/lang/String;Lcom/p1/mobile/putong/core/api/c0$c;Ll/pf60;)V

    return-void
.end method

.method public static synthetic j0(Lcom/p1/mobile/putong/core/data/Conversation;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 8
    .line 9
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    invoke-static {}, Ll/i46;->c()Ll/i46;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-virtual {v0, p0}, Ll/i46;->i(Lcom/p1/mobile/putong/core/data/Conversation;)V

    .line 20
    .line 21
    .line 22
    :cond_0
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    if-eqz v0, :cond_1

    .line 27
    .line 28
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 29
    .line 30
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 31
    .line 32
    .line 33
    move-result p0

    .line 34
    if-nez p0, :cond_1

    .line 35
    .line 36
    const/4 p0, 0x1

    .line 37
    goto :goto_0

    .line 38
    :cond_1
    const/4 p0, 0x0

    .line 39
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    return-object p0
.end method

.method public static k0(Landroid/widget/TextView;Landroid/widget/TextView;)V
    .locals 1

    .line 1
    const/high16 v0, 0x41800000    # 16.0f

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setTextSize(F)V

    .line 4
    .line 5
    .line 6
    const/high16 v0, -0x1000000

    .line 7
    .line 8
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 9
    .line 10
    .line 11
    const/high16 p0, 0x41400000    # 12.0f

    .line 12
    .line 13
    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setTextSize(F)V

    .line 14
    .line 15
    .line 16
    sget p0, Ll/sj6;->S:I

    .line 17
    .line 18
    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public static o(Lcom/p1/mobile/putong/core/data/Conversation;)Z
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    if-eqz p0, :cond_1

    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/Conversation;->isFakeOneSideConv()Z

    .line 5
    .line 6
    .line 7
    move-result v1

    .line 8
    if-nez v1, :cond_0

    .line 9
    .line 10
    goto :goto_0

    .line 11
    :cond_0
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 12
    .line 13
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 14
    .line 15
    invoke-virtual {v1}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/User;->isSVIP()Z

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    if-nez v1, :cond_1

    .line 24
    .line 25
    iget v1, p0, Lcom/p1/mobile/putong/core/data/Conversation;->mm:I

    .line 26
    .line 27
    if-gtz v1, :cond_1

    .line 28
    .line 29
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/Conversation;->isOtherStatusInvalid()Z

    .line 30
    .line 31
    .line 32
    move-result p0

    .line 33
    if-nez p0, :cond_1

    .line 34
    .line 35
    const/4 p0, 0x1

    .line 36
    return p0

    .line 37
    :cond_1
    :goto_0
    return v0
.end method

.method public static synthetic q0(Lcom/p1/mobile/putong/core/data/Message;)Ljava/lang/Boolean;
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 2
    .line 3
    const-string v1, "common_tip"

    .line 4
    .line 5
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->extData:Lcom/p1/mobile/putong/core/data/MessageExtData;

    .line 12
    .line 13
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->extData:Lcom/p1/mobile/putong/core/data/MessageExtData;

    .line 20
    .line 21
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/MessageExtData;->extra:Ljava/lang/String;

    .line 22
    .line 23
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-nez v0, :cond_0

    .line 28
    .line 29
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->extData:Lcom/p1/mobile/putong/core/data/MessageExtData;

    .line 30
    .line 31
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/MessageExtData;->extra:Ljava/lang/String;

    .line 32
    .line 33
    const-string v2, "pat"

    .line 34
    .line 35
    invoke-static {v0, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    if-eqz v0, :cond_0

    .line 40
    .line 41
    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 42
    .line 43
    return-object p0

    .line 44
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 45
    .line 46
    const-string v2, "chat_assistant_question"

    .line 47
    .line 48
    invoke-static {v0, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 49
    .line 50
    .line 51
    move-result v0

    .line 52
    if-eqz v0, :cond_1

    .line 53
    .line 54
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/Message;->isMe()Z

    .line 55
    .line 56
    .line 57
    move-result v0

    .line 58
    if-eqz v0, :cond_1

    .line 59
    .line 60
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->extData:Lcom/p1/mobile/putong/core/data/MessageExtData;

    .line 61
    .line 62
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 63
    .line 64
    .line 65
    move-result v0

    .line 66
    if-eqz v0, :cond_1

    .line 67
    .line 68
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->extData:Lcom/p1/mobile/putong/core/data/MessageExtData;

    .line 69
    .line 70
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/MessageExtData;->extra:Ljava/lang/String;

    .line 71
    .line 72
    const-string v2, "system"

    .line 73
    .line 74
    invoke-static {v0, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 75
    .line 76
    .line 77
    move-result v0

    .line 78
    if-eqz v0, :cond_1

    .line 79
    .line 80
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 81
    .line 82
    return-object p0

    .line 83
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 84
    .line 85
    const-string v2, "common_tip_box_v2"

    .line 86
    .line 87
    invoke-static {v0, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 88
    .line 89
    .line 90
    move-result v0

    .line 91
    if-eqz v0, :cond_2

    .line 92
    .line 93
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->additionalData:Lcom/p1/mobile/putong/core/data/MessageAdditionalData;

    .line 94
    .line 95
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 96
    .line 97
    .line 98
    move-result v0

    .line 99
    if-eqz v0, :cond_2

    .line 100
    .line 101
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->additionalData:Lcom/p1/mobile/putong/core/data/MessageAdditionalData;

    .line 102
    .line 103
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->commonTipBox:Lcom/p1/mobile/putong/core/data/CommonTipBox;

    .line 104
    .line 105
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 106
    .line 107
    .line 108
    move-result v0

    .line 109
    if-eqz v0, :cond_2

    .line 110
    .line 111
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->additionalData:Lcom/p1/mobile/putong/core/data/MessageAdditionalData;

    .line 112
    .line 113
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->commonTipBox:Lcom/p1/mobile/putong/core/data/CommonTipBox;

    .line 114
    .line 115
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/CommonTipBox;->type:Ljava/lang/String;

    .line 116
    .line 117
    const-string v3, "verify"

    .line 118
    .line 119
    invoke-static {v0, v3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 120
    .line 121
    .line 122
    move-result v0

    .line 123
    if-eqz v0, :cond_2

    .line 124
    .line 125
    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 126
    .line 127
    return-object p0

    .line 128
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 129
    .line 130
    const-string v3, "tantan_verify_toast"

    .line 131
    .line 132
    invoke-static {v0, v3}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 133
    .line 134
    .line 135
    move-result v0

    .line 136
    if-nez v0, :cond_3

    .line 137
    .line 138
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 139
    .line 140
    const-string v3, "local_greeting_match_success"

    .line 141
    .line 142
    invoke-static {v0, v3}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 143
    .line 144
    .line 145
    move-result v0

    .line 146
    if-nez v0, :cond_3

    .line 147
    .line 148
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 149
    .line 150
    const-string v3, "local_countdown_like_success"

    .line 151
    .line 152
    invoke-static {v0, v3}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 153
    .line 154
    .line 155
    move-result v0

    .line 156
    if-nez v0, :cond_3

    .line 157
    .line 158
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 159
    .line 160
    const-string v3, "local_countdown_like_notify"

    .line 161
    .line 162
    invoke-static {v0, v3}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 163
    .line 164
    .line 165
    move-result v0

    .line 166
    if-nez v0, :cond_3

    .line 167
    .line 168
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 169
    .line 170
    const-string v3, "local_chat_greeting_tip"

    .line 171
    .line 172
    invoke-static {v0, v3}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 173
    .line 174
    .line 175
    move-result v0

    .line 176
    if-nez v0, :cond_3

    .line 177
    .line 178
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 179
    .line 180
    const-string v3, "live_vip_greet"

    .line 181
    .line 182
    invoke-static {v0, v3}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 183
    .line 184
    .line 185
    move-result v0

    .line 186
    if-nez v0, :cond_3

    .line 187
    .line 188
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 189
    .line 190
    const-string v3, "local_tickle_tip"

    .line 191
    .line 192
    invoke-static {v0, v3}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 193
    .line 194
    .line 195
    move-result v0

    .line 196
    if-nez v0, :cond_3

    .line 197
    .line 198
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 199
    .line 200
    const-string v3, "soul_test_guide"

    .line 201
    .line 202
    invoke-static {v0, v3}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 203
    .line 204
    .line 205
    move-result v0

    .line 206
    if-nez v0, :cond_3

    .line 207
    .line 208
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 209
    .line 210
    const-string v3, "local_friend_comment_toast"

    .line 211
    .line 212
    invoke-static {v0, v3}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 213
    .line 214
    .line 215
    move-result v0

    .line 216
    if-nez v0, :cond_3

    .line 217
    .line 218
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 219
    .line 220
    const-string v3, "local_real_shot_tips"

    .line 221
    .line 222
    invoke-static {v0, v3}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 223
    .line 224
    .line 225
    move-result v0

    .line 226
    if-nez v0, :cond_3

    .line 227
    .line 228
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 229
    .line 230
    const-string v3, "local_chat_inc_temp_warn"

    .line 231
    .line 232
    invoke-static {v0, v3}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 233
    .line 234
    .line 235
    move-result v0

    .line 236
    if-nez v0, :cond_3

    .line 237
    .line 238
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 239
    .line 240
    const-string v4, "christmas_match"

    .line 241
    .line 242
    invoke-static {v0, v4}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 243
    .line 244
    .line 245
    move-result v0

    .line 246
    if-nez v0, :cond_3

    .line 247
    .line 248
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 249
    .line 250
    const-string v4, "local_normal_tips"

    .line 251
    .line 252
    invoke-static {v0, v4}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 253
    .line 254
    .line 255
    move-result v0

    .line 256
    if-nez v0, :cond_3

    .line 257
    .line 258
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 259
    .line 260
    invoke-static {v0, v3}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 261
    .line 262
    .line 263
    move-result v0

    .line 264
    if-nez v0, :cond_3

    .line 265
    .line 266
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 267
    .line 268
    const-string v3, "heartbeat_notify"

    .line 269
    .line 270
    invoke-static {v0, v3}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 271
    .line 272
    .line 273
    move-result v0

    .line 274
    if-nez v0, :cond_3

    .line 275
    .line 276
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 277
    .line 278
    const-string v3, "heartbeat_waiting_response"

    .line 279
    .line 280
    invoke-static {v0, v3}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 281
    .line 282
    .line 283
    move-result v0

    .line 284
    if-nez v0, :cond_3

    .line 285
    .line 286
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 287
    .line 288
    const-string v3, "heartbeat_success"

    .line 289
    .line 290
    invoke-static {v0, v3}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 291
    .line 292
    .line 293
    move-result v0

    .line 294
    if-nez v0, :cond_3

    .line 295
    .line 296
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 297
    .line 298
    const-string v3, "local_user_moment_message"

    .line 299
    .line 300
    invoke-static {v0, v3}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 301
    .line 302
    .line 303
    move-result v0

    .line 304
    if-nez v0, :cond_3

    .line 305
    .line 306
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 307
    .line 308
    const-string v3, "local_break_ice"

    .line 309
    .line 310
    invoke-static {v0, v3}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 311
    .line 312
    .line 313
    move-result v0

    .line 314
    if-nez v0, :cond_3

    .line 315
    .line 316
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 317
    .line 318
    const-string v3, "wanwan_tip"

    .line 319
    .line 320
    invoke-static {v0, v3}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 321
    .line 322
    .line 323
    move-result v0

    .line 324
    if-nez v0, :cond_3

    .line 325
    .line 326
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 327
    .line 328
    const-string v3, "local_push_switch"

    .line 329
    .line 330
    invoke-static {v0, v3}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 331
    .line 332
    .line 333
    move-result v0

    .line 334
    if-nez v0, :cond_3

    .line 335
    .line 336
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 337
    .line 338
    const-string v3, "local_push_switch_plus"

    .line 339
    .line 340
    invoke-static {v0, v3}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 341
    .line 342
    .line 343
    move-result v0

    .line 344
    if-nez v0, :cond_3

    .line 345
    .line 346
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 347
    .line 348
    const-string v3, "local_chanllenge_tips"

    .line 349
    .line 350
    invoke-static {v0, v3}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 351
    .line 352
    .line 353
    move-result v0

    .line 354
    if-nez v0, :cond_3

    .line 355
    .line 356
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 357
    .line 358
    const-string v3, "tag_guide"

    .line 359
    .line 360
    invoke-static {v0, v3}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 361
    .line 362
    .line 363
    move-result v0

    .line 364
    if-nez v0, :cond_3

    .line 365
    .line 366
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 367
    .line 368
    const-string v3, "tacit_test"

    .line 369
    .line 370
    invoke-static {v0, v3}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 371
    .line 372
    .line 373
    move-result v0

    .line 374
    if-nez v0, :cond_3

    .line 375
    .line 376
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 377
    .line 378
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 379
    .line 380
    .line 381
    move-result v0

    .line 382
    if-nez v0, :cond_3

    .line 383
    .line 384
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 385
    .line 386
    const-string v1, "local_moment_post_guide"

    .line 387
    .line 388
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 389
    .line 390
    .line 391
    move-result v0

    .line 392
    if-nez v0, :cond_3

    .line 393
    .line 394
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 395
    .line 396
    const-string v3, "local_love_buzz_break_ice"

    .line 397
    .line 398
    invoke-static {v0, v3}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 399
    .line 400
    .line 401
    move-result v0

    .line 402
    if-nez v0, :cond_3

    .line 403
    .line 404
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 405
    .line 406
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 407
    .line 408
    .line 409
    move-result v0

    .line 410
    if-nez v0, :cond_3

    .line 411
    .line 412
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 413
    .line 414
    const-string v1, "local_add_tags_guide"

    .line 415
    .line 416
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 417
    .line 418
    .line 419
    move-result v0

    .line 420
    if-nez v0, :cond_3

    .line 421
    .line 422
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 423
    .line 424
    const-string v1, "local_add_artwork_guide"

    .line 425
    .line 426
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 427
    .line 428
    .line 429
    move-result v0

    .line 430
    if-nez v0, :cond_3

    .line 431
    .line 432
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 433
    .line 434
    const-string v1, "local_send_artwork_text"

    .line 435
    .line 436
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 437
    .line 438
    .line 439
    move-result v0

    .line 440
    if-nez v0, :cond_3

    .line 441
    .line 442
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 443
    .line 444
    const-string v1, "local_send_tags_text"

    .line 445
    .line 446
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 447
    .line 448
    .line 449
    move-result v0

    .line 450
    if-nez v0, :cond_3

    .line 451
    .line 452
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 453
    .line 454
    const-string v1, "local_match_ice_break"

    .line 455
    .line 456
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 457
    .line 458
    .line 459
    move-result v0

    .line 460
    if-nez v0, :cond_3

    .line 461
    .line 462
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 463
    .line 464
    const-string v1, "local_chat_assistant_question_new"

    .line 465
    .line 466
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 467
    .line 468
    .line 469
    move-result v0

    .line 470
    if-nez v0, :cond_3

    .line 471
    .line 472
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 473
    .line 474
    const-string v1, "local_friend_active_remind_female"

    .line 475
    .line 476
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 477
    .line 478
    .line 479
    move-result v0

    .line 480
    if-nez v0, :cond_3

    .line 481
    .line 482
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 483
    .line 484
    const-string v1, "female_unreply_reminder"

    .line 485
    .line 486
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 487
    .line 488
    .line 489
    move-result v0

    .line 490
    if-nez v0, :cond_3

    .line 491
    .line 492
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 493
    .line 494
    const-string v1, "local_ai_p2p_chat_guide"

    .line 495
    .line 496
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 497
    .line 498
    .line 499
    move-result v0

    .line 500
    if-nez v0, :cond_3

    .line 501
    .line 502
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 503
    .line 504
    const-string v1, "local_heart_beat_lock_tip"

    .line 505
    .line 506
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 507
    .line 508
    .line 509
    move-result v0

    .line 510
    if-nez v0, :cond_3

    .line 511
    .line 512
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 513
    .line 514
    const-string v1, "harass_alert"

    .line 515
    .line 516
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 517
    .line 518
    .line 519
    move-result v0

    .line 520
    if-nez v0, :cond_3

    .line 521
    .line 522
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 523
    .line 524
    const-string v1, "continuous_chat_tip"

    .line 525
    .line 526
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 527
    .line 528
    .line 529
    move-result v0

    .line 530
    if-nez v0, :cond_3

    .line 531
    .line 532
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 533
    .line 534
    const-string v1, "local_birthday_tip"

    .line 535
    .line 536
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 537
    .line 538
    .line 539
    move-result v0

    .line 540
    if-nez v0, :cond_3

    .line 541
    .line 542
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 543
    .line 544
    const-string v1, "system_reminder"

    .line 545
    .line 546
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 547
    .line 548
    .line 549
    move-result v0

    .line 550
    if-nez v0, :cond_3

    .line 551
    .line 552
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 553
    .line 554
    const-string v1, "local_platinum_pin_guide"

    .line 555
    .line 556
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 557
    .line 558
    .line 559
    move-result v0

    .line 560
    if-nez v0, :cond_3

    .line 561
    .line 562
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 563
    .line 564
    const-string v1, "local_wechat_notify_guide"

    .line 565
    .line 566
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 567
    .line 568
    .line 569
    move-result v0

    .line 570
    if-nez v0, :cond_3

    .line 571
    .line 572
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 573
    .line 574
    const-string v1, "local_long_time_no_see"

    .line 575
    .line 576
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 577
    .line 578
    .line 579
    move-result v0

    .line 580
    if-nez v0, :cond_3

    .line 581
    .line 582
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 583
    .line 584
    const-string v1, "local_pic_cert_guide"

    .line 585
    .line 586
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 587
    .line 588
    .line 589
    move-result v0

    .line 590
    if-nez v0, :cond_3

    .line 591
    .line 592
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 593
    .line 594
    const-string v1, "local_blindbox_guide"

    .line 595
    .line 596
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 597
    .line 598
    .line 599
    move-result v0

    .line 600
    if-nez v0, :cond_3

    .line 601
    .line 602
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 603
    .line 604
    const-string v1, "local_visitor_hide_footprint"

    .line 605
    .line 606
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 607
    .line 608
    .line 609
    move-result v0

    .line 610
    if-nez v0, :cond_3

    .line 611
    .line 612
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 613
    .line 614
    const-string v1, "common_tip_box"

    .line 615
    .line 616
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 617
    .line 618
    .line 619
    move-result v0

    .line 620
    if-nez v0, :cond_3

    .line 621
    .line 622
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 623
    .line 624
    const-string v1, "local_intl_prompt_message_type"

    .line 625
    .line 626
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 627
    .line 628
    .line 629
    move-result v0

    .line 630
    if-nez v0, :cond_3

    .line 631
    .line 632
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 633
    .line 634
    const-string v1, "local_ux_questionnaire"

    .line 635
    .line 636
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 637
    .line 638
    .line 639
    move-result v0

    .line 640
    if-nez v0, :cond_3

    .line 641
    .line 642
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 643
    .line 644
    const-string v1, "local_ux_questionnaire_tip"

    .line 645
    .line 646
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 647
    .line 648
    .line 649
    move-result v0

    .line 650
    if-nez v0, :cond_3

    .line 651
    .line 652
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 653
    .line 654
    const-string v1, "local_ideal_enquiry"

    .line 655
    .line 656
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 657
    .line 658
    .line 659
    move-result v0

    .line 660
    if-nez v0, :cond_3

    .line 661
    .line 662
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 663
    .line 664
    const-string v1, "local_love_letter_guide"

    .line 665
    .line 666
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 667
    .line 668
    .line 669
    move-result v0

    .line 670
    if-nez v0, :cond_3

    .line 671
    .line 672
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 673
    .line 674
    const-string v1, "local_o_diamond_visitor_guide"

    .line 675
    .line 676
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 677
    .line 678
    .line 679
    move-result v0

    .line 680
    if-nez v0, :cond_3

    .line 681
    .line 682
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 683
    .line 684
    const-string v1, "local_invitation_for_authentication"

    .line 685
    .line 686
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 687
    .line 688
    .line 689
    move-result v0

    .line 690
    if-nez v0, :cond_3

    .line 691
    .line 692
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 693
    .line 694
    invoke-static {v0, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 695
    .line 696
    .line 697
    move-result v0

    .line 698
    if-nez v0, :cond_3

    .line 699
    .line 700
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 701
    .line 702
    const-string v1, "mm_task"

    .line 703
    .line 704
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 705
    .line 706
    .line 707
    move-result v0

    .line 708
    if-nez v0, :cond_3

    .line 709
    .line 710
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 711
    .line 712
    const-string v1, "local_intl_read_receipts_guide"

    .line 713
    .line 714
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 715
    .line 716
    .line 717
    move-result v0

    .line 718
    if-nez v0, :cond_3

    .line 719
    .line 720
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 721
    .line 722
    const-string v0, "local_pin_chat_normal_guide"

    .line 723
    .line 724
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 725
    .line 726
    .line 727
    move-result p0

    .line 728
    if-nez p0, :cond_3

    .line 729
    .line 730
    const/4 p0, 0x1

    .line 731
    goto :goto_0

    .line 732
    :cond_3
    const/4 p0, 0x0

    .line 733
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 734
    .line 735
    .line 736
    move-result-object p0

    .line 737
    return-object p0
.end method

.method public static s0(Lcom/p1/mobile/putong/core/data/Conversation;)Z
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/Conversation;->lowPayOneSideConv()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Conversation;->read:Ljava/lang/Boolean;

    .line 8
    .line 9
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-nez p0, :cond_0

    .line 14
    .line 15
    const/4 p0, 0x1

    .line 16
    return p0

    .line 17
    :cond_0
    const/4 p0, 0x0

    .line 18
    return p0
.end method

.method public static t(Ljava/util/List;Lcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/putong/core/data/Message;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/Message;",
            ">;",
            "Lcom/p1/mobile/putong/data/User;",
            ")",
            "Lcom/p1/mobile/putong/core/data/Message;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/te6;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/te6;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    const/4 v2, 0x0

    .line 11
    if-eqz v1, :cond_3

    .line 12
    .line 13
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 18
    .line 19
    .line 20
    move-result-object v3

    .line 21
    const/4 v4, -0x1

    .line 22
    move-object v5, v2

    .line 23
    :cond_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    .line 24
    .line 25
    .line 26
    move-result v6

    .line 27
    if-nez v6, :cond_1

    .line 28
    .line 29
    return-object v2

    .line 30
    :cond_1
    add-int/lit8 v4, v4, 0x1

    .line 31
    .line 32
    :try_start_0
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    move-result-object v6

    .line 36
    check-cast v6, Lcom/p1/mobile/putong/core/data/Message;
    :try_end_0
    .catch Ljava/util/NoSuchElementException; {:try_start_0 .. :try_end_0} :catch_0

    .line 37
    .line 38
    move-object v5, v6

    .line 39
    goto :goto_1

    .line 40
    :catch_0
    new-instance v6, Ljava/lang/StringBuilder;

    .line 41
    .line 42
    const-string v7, "ConversationItemView NoSuchElementException currentThread = "

    .line 43
    .line 44
    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 45
    .line 46
    .line 47
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    .line 48
    .line 49
    .line 50
    move-result-object v7

    .line 51
    invoke-virtual {v7}, Ljava/lang/Thread;->getName()Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object v7

    .line 55
    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    const-string v7, ",  userId = "

    .line 59
    .line 60
    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 61
    .line 62
    .line 63
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 64
    .line 65
    .line 66
    move-result v7

    .line 67
    if-eqz v7, :cond_2

    .line 68
    .line 69
    iget-object v7, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 70
    .line 71
    goto :goto_0

    .line 72
    :cond_2
    const-string v7, "null"

    .line 73
    .line 74
    :goto_0
    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 75
    .line 76
    .line 77
    const-string v7, ",  oldSize = "

    .line 78
    .line 79
    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 80
    .line 81
    .line 82
    invoke-virtual {v6, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 83
    .line 84
    .line 85
    const-string v7, ",  currentSize = "

    .line 86
    .line 87
    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 88
    .line 89
    .line 90
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 91
    .line 92
    .line 93
    move-result v7

    .line 94
    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 95
    .line 96
    .line 97
    const-string v7, ",  index = "

    .line 98
    .line 99
    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 100
    .line 101
    .line 102
    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 103
    .line 104
    .line 105
    const-string v7, ",  list = "

    .line 106
    .line 107
    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 108
    .line 109
    .line 110
    invoke-virtual {v6, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 111
    .line 112
    .line 113
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 114
    .line 115
    .line 116
    move-result-object v6

    .line 117
    new-instance v7, Ljava/util/NoSuchElementException;

    .line 118
    .line 119
    invoke-direct {v7, v6}, Ljava/util/NoSuchElementException;-><init>(Ljava/lang/String;)V

    .line 120
    .line 121
    .line 122
    invoke-static {v7}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 123
    .line 124
    .line 125
    :goto_1
    invoke-interface {v0, v5}, Ll/qcj;->call(Ljava/lang/Object;)Ljava/lang/Object;

    .line 126
    .line 127
    .line 128
    move-result-object v6

    .line 129
    check-cast v6, Ljava/lang/Boolean;

    .line 130
    .line 131
    invoke-virtual {v6}, Ljava/lang/Boolean;->booleanValue()Z

    .line 132
    .line 133
    .line 134
    move-result v6

    .line 135
    if-eqz v6, :cond_0

    .line 136
    .line 137
    return-object v5

    .line 138
    :cond_3
    return-object v2
.end method

.method public static varargs v(I[Landroid/view/View;)V
    .locals 1

    .line 1
    invoke-static {p1}, Lrx/c;->from([Ljava/lang/Object;)Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    new-instance v0, Ll/le6;

    .line 6
    .line 7
    invoke-direct {v0, p0}, Ll/le6;-><init>(I)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p1, v0}, Lrx/c;->doOnNext(Ll/y20;)Lrx/c;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    invoke-virtual {p0}, Lrx/c;->subscribe()Ll/kcg0;

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public static synthetic v0(ILandroid/view/View;)V
    .locals 3

    .line 1
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    new-instance v0, Landroid/view/ViewGroup$LayoutParams;

    .line 8
    .line 9
    invoke-virtual {p1}, Landroid/view/View;->getWidth()I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    .line 14
    .line 15
    .line 16
    move-result v2

    .line 17
    invoke-direct {v0, v1, v2}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    .line 18
    .line 19
    .line 20
    :cond_0
    iput p0, v0, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 21
    .line 22
    iput p0, v0, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 23
    .line 24
    invoke-virtual {p1, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public static synthetic w0(Ll/ue6;Ll/sj6;)V
    .locals 0

    .line 1
    invoke-interface {p0, p1}, Ll/ue6;->K(Ll/sj6;)V

    return-void
.end method

.method public static synthetic z(Lcom/p1/mobile/putong/core/data/Conversation;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 8
    .line 9
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    invoke-static {}, Ll/i46;->c()Ll/i46;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-virtual {v0, p0}, Ll/i46;->i(Lcom/p1/mobile/putong/core/data/Conversation;)V

    .line 20
    .line 21
    .line 22
    :cond_0
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    if-eqz v0, :cond_1

    .line 27
    .line 28
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 29
    .line 30
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 31
    .line 32
    .line 33
    move-result p0

    .line 34
    if-nez p0, :cond_1

    .line 35
    .line 36
    const/4 p0, 0x1

    .line 37
    goto :goto_0

    .line 38
    :cond_1
    const/4 p0, 0x0

    .line 39
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    return-object p0
.end method


# virtual methods
.method public A0(Lcom/p1/mobile/putong/core/data/Conversation;)Z
    .locals 2

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Conversation;->property:Lcom/p1/mobile/putong/core/data/ConversationProperty;

    .line 8
    .line 9
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Conversation;->property:Lcom/p1/mobile/putong/core/data/ConversationProperty;

    .line 16
    .line 17
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/ConversationProperty;->loveScript:Lcom/p1/mobile/putong/core/data/LoveScript;

    .line 18
    .line 19
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    if-eqz p0, :cond_0

    .line 24
    .line 25
    const-string p0, "lovescript"

    .line 26
    .line 27
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Conversation;->convType:Ljava/lang/String;

    .line 28
    .line 29
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 30
    .line 31
    .line 32
    move-result p0

    .line 33
    if-eqz p0, :cond_0

    .line 34
    .line 35
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Conversation;->property:Lcom/p1/mobile/putong/core/data/ConversationProperty;

    .line 36
    .line 37
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/ConversationProperty;->loveScript:Lcom/p1/mobile/putong/core/data/LoveScript;

    .line 38
    .line 39
    iget-wide p0, p0, Lcom/p1/mobile/putong/core/data/LoveScript;->expireTime:J

    .line 40
    .line 41
    const-wide/16 v0, 0x0

    .line 42
    .line 43
    cmp-long p0, p0, v0

    .line 44
    .line 45
    if-eqz p0, :cond_0

    .line 46
    .line 47
    const/4 p0, 0x1

    .line 48
    return p0

    .line 49
    :cond_0
    const/4 p0, 0x0

    .line 50
    return p0
.end method

.method public D(Ll/sj6;)Z
    .locals 1

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    const/4 v0, 0x0

    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    iget-object p0, p1, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 9
    .line 10
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    if-eqz p0, :cond_0

    .line 15
    .line 16
    iget-object p0, p1, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 17
    .line 18
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Conversation;->status:Lcom/p1/mobile/putong/data/ConversationStatus;

    .line 19
    .line 20
    const-string p1, "invisible"

    .line 21
    .line 22
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 23
    .line 24
    .line 25
    :cond_0
    return v0
.end method

.method public D0(Ljava/lang/String;Ljava/lang/String;Z)Ljava/lang/CharSequence;
    .locals 2

    .line 1
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    return-object p1

    .line 8
    :cond_0
    new-instance p0, Landroid/text/SpannableStringBuilder;

    .line 9
    .line 10
    invoke-direct {p0, p1}, Landroid/text/SpannableStringBuilder;-><init>(Ljava/lang/CharSequence;)V

    .line 11
    .line 12
    .line 13
    if-eqz p3, :cond_1

    .line 14
    .line 15
    invoke-virtual {p1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    invoke-virtual {p2}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object p3

    .line 23
    invoke-virtual {p1, p3}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    .line 24
    .line 25
    .line 26
    move-result p1

    .line 27
    goto :goto_0

    .line 28
    :cond_1
    invoke-virtual {p1, p2}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    .line 29
    .line 30
    .line 31
    move-result p1

    .line 32
    :goto_0
    const/4 p3, -0x1

    .line 33
    if-eq p1, p3, :cond_2

    .line 34
    .line 35
    new-instance p3, Landroid/text/style/ForegroundColorSpan;

    .line 36
    .line 37
    sget-object v0, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 38
    .line 39
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    sget v1, Ll/c9c0;->I:I

    .line 44
    .line 45
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getColor(I)I

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    invoke-direct {p3, v0}, Landroid/text/style/ForegroundColorSpan;-><init>(I)V

    .line 50
    .line 51
    .line 52
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    .line 53
    .line 54
    .line 55
    move-result p2

    .line 56
    add-int/2addr p2, p1

    .line 57
    const/16 v0, 0x21

    .line 58
    .line 59
    invoke-virtual {p0, p3, p1, p2, v0}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 60
    .line 61
    .line 62
    :cond_2
    return-object p0
.end method

.method public E0(Ll/sj6;Ljava/lang/String;Lcom/p1/mobile/putong/data/UserLiveLabel;)V
    .locals 21

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    move-object/from16 v2, p3

    .line 6
    .line 7
    sget-object v3, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 8
    .line 9
    iget-object v3, v3, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 10
    .line 11
    iget-boolean v4, v1, Ll/sj6;->e:Z

    .line 12
    .line 13
    invoke-interface {v0, v4}, Ll/ue6;->V0(Z)Z

    .line 14
    .line 15
    .line 16
    move-result v4

    .line 17
    invoke-virtual {v3, v4}, Lcom/p1/mobile/putong/core/api/g;->dg(Z)Ljava/util/List;

    .line 18
    .line 19
    .line 20
    move-result-object v3

    .line 21
    iget-object v4, v1, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 22
    .line 23
    invoke-interface {v3, v4}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    .line 24
    .line 25
    .line 26
    move-result v3

    .line 27
    const-string v4, "onLive"

    .line 28
    .line 29
    iget-object v5, v2, Lcom/p1/mobile/putong/data/UserLiveLabel;->liveState:Ljava/lang/String;

    .line 30
    .line 31
    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    move-result v4

    .line 35
    const-string v5, "e_live_room_enter"

    .line 36
    .line 37
    const/4 v6, 0x0

    .line 38
    if-eqz v4, :cond_1

    .line 39
    .line 40
    :cond_0
    move-object/from16 v17, v6

    .line 41
    .line 42
    move-object/from16 v18, v17

    .line 43
    .line 44
    move-object/from16 v19, v18

    .line 45
    .line 46
    move-object/from16 v20, v19

    .line 47
    .line 48
    goto :goto_0

    .line 49
    :cond_1
    const-string v4, "onVoice"

    .line 50
    .line 51
    iget-object v7, v2, Lcom/p1/mobile/putong/data/UserLiveLabel;->liveState:Ljava/lang/String;

    .line 52
    .line 53
    invoke-virtual {v4, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 54
    .line 55
    .line 56
    move-result v4

    .line 57
    if-eqz v4, :cond_0

    .line 58
    .line 59
    const-string v4, "profile_user_id"

    .line 60
    .line 61
    iget-object v5, v2, Lcom/p1/mobile/putong/data/UserLiveLabel;->userId:Ljava/lang/String;

    .line 62
    .line 63
    invoke-static {v4, v5}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 64
    .line 65
    .line 66
    move-result-object v6

    .line 67
    const-string v4, "topic_id"

    .line 68
    .line 69
    iget-object v5, v2, Lcom/p1/mobile/putong/data/UserLiveLabel;->voiceRoomTopicId:Ljava/lang/String;

    .line 70
    .line 71
    invoke-static {v4, v5}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 72
    .line 73
    .line 74
    move-result-object v4

    .line 75
    const-string v5, "audio_card_type"

    .line 76
    .line 77
    const-string v7, "message_list"

    .line 78
    .line 79
    invoke-static {v5, v7}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 80
    .line 81
    .line 82
    move-result-object v5

    .line 83
    const-string v7, "audio_room_type"

    .line 84
    .line 85
    const-string v8, "normal_audio"

    .line 86
    .line 87
    invoke-static {v7, v8}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 88
    .line 89
    .line 90
    move-result-object v7

    .line 91
    const-string v8, "e_live_audio_room_enter"

    .line 92
    .line 93
    move-object/from16 v18, v4

    .line 94
    .line 95
    move-object/from16 v19, v5

    .line 96
    .line 97
    move-object/from16 v17, v6

    .line 98
    .line 99
    move-object/from16 v20, v7

    .line 100
    .line 101
    move-object v5, v8

    .line 102
    :goto_0
    const-string v4, "anchorId"

    .line 103
    .line 104
    iget-object v6, v2, Lcom/p1/mobile/putong/data/UserLiveLabel;->anchorId:Ljava/lang/String;

    .line 105
    .line 106
    invoke-static {v4, v6}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 107
    .line 108
    .line 109
    move-result-object v6

    .line 110
    const/4 v4, -0x1

    .line 111
    if-eq v3, v4, :cond_2

    .line 112
    .line 113
    add-int/lit8 v3, v3, 0x1

    .line 114
    .line 115
    :cond_2
    const-string v4, "index"

    .line 116
    .line 117
    invoke-static {v4, v3}, Ll/sfj0$a;->f(Ljava/lang/String;I)Ll/sfj0$a;

    .line 118
    .line 119
    .line 120
    move-result-object v7

    .line 121
    const-string v3, "liveId"

    .line 122
    .line 123
    iget-object v4, v2, Lcom/p1/mobile/putong/data/UserLiveLabel;->liveId:Ljava/lang/String;

    .line 124
    .line 125
    invoke-static {v3, v4}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 126
    .line 127
    .line 128
    move-result-object v8

    .line 129
    const-string v3, "liveRecommendCategory"

    .line 130
    .line 131
    const-string v4, "NA"

    .line 132
    .line 133
    invoke-static {v3, v4}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 134
    .line 135
    .line 136
    move-result-object v9

    .line 137
    const-string v3, "17"

    .line 138
    .line 139
    move-object/from16 v10, p2

    .line 140
    .line 141
    invoke-static {v3, v10}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 142
    .line 143
    .line 144
    move-result v3

    .line 145
    if-eqz v3, :cond_3

    .line 146
    .line 147
    const-string v1, "fanbasegroupchat_photo"

    .line 148
    .line 149
    goto :goto_1

    .line 150
    :cond_3
    iget-boolean v1, v1, Ll/sj6;->e:Z

    .line 151
    .line 152
    invoke-interface {v0, v1}, Ll/ue6;->V0(Z)Z

    .line 153
    .line 154
    .line 155
    move-result v1

    .line 156
    if-eqz v1, :cond_4

    .line 157
    .line 158
    const-string v1, "match_photo"

    .line 159
    .line 160
    goto :goto_1

    .line 161
    :cond_4
    const-string v1, "chat_photo"

    .line 162
    .line 163
    :goto_1
    const-string v3, "module"

    .line 164
    .line 165
    invoke-static {v3, v1}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 166
    .line 167
    .line 168
    move-result-object v10

    .line 169
    const-string v1, "right_recommend_type"

    .line 170
    .line 171
    invoke-static {v1, v4}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 172
    .line 173
    .line 174
    move-result-object v11

    .line 175
    const-string v1, "show_label"

    .line 176
    .line 177
    iget-object v3, v2, Lcom/p1/mobile/putong/data/UserLiveLabel;->iconTitle:Ljava/lang/String;

    .line 178
    .line 179
    invoke-static {v1, v3}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 180
    .line 181
    .line 182
    move-result-object v12

    .line 183
    const-string v1, "trace_id"

    .line 184
    .line 185
    const-string v3, ""

    .line 186
    .line 187
    invoke-static {v1, v3}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 188
    .line 189
    .line 190
    move-result-object v13

    .line 191
    const-string v1, "live_status"

    .line 192
    .line 193
    const-string v3, "on"

    .line 194
    .line 195
    invoke-static {v1, v3}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 196
    .line 197
    .line 198
    move-result-object v14

    .line 199
    const-string v1, "window_type"

    .line 200
    .line 201
    const-string v3, "null"

    .line 202
    .line 203
    invoke-static {v1, v3}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 204
    .line 205
    .line 206
    move-result-object v15

    .line 207
    const-string v1, "live_room_live_type"

    .line 208
    .line 209
    invoke-interface {v0, v2}, Ll/ue6;->Y0(Lcom/p1/mobile/putong/data/UserLiveLabel;)Ljava/lang/String;

    .line 210
    .line 211
    .line 212
    move-result-object v0

    .line 213
    invoke-static {v1, v0}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 214
    .line 215
    .line 216
    move-result-object v16

    .line 217
    filled-new-array/range {v6 .. v20}, [Ll/sfj0$a;

    .line 218
    .line 219
    .line 220
    move-result-object v0

    .line 221
    const-string v1, "p_messages_view"

    .line 222
    .line 223
    invoke-static {v5, v1, v0}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 224
    .line 225
    .line 226
    return-void
.end method

.method public F(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ll/u46;Lcom/p1/mobile/putong/core/api/c0$c;)V
    .locals 3

    .line 1
    invoke-static {}, Ll/gra;->H3()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 9
    .line 10
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->t1:Lcom/p1/mobile/putong/core/api/c0;

    .line 11
    .line 12
    new-instance v1, Ljava/lang/StringBuilder;

    .line 13
    .line 14
    const-string v2, "exclusive_tag_"

    .line 15
    .line 16
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/api/c0;->u(Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 30
    .line 31
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->M1:Ll/cn7;

    .line 32
    .line 33
    invoke-virtual {v0, p2}, Ll/cn7;->s3(Ljava/lang/String;)Lrx/c;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    invoke-virtual {v0}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    new-instance v1, Ll/je6;

    .line 42
    .line 43
    invoke-direct {v1}, Ll/je6;-><init>()V

    .line 44
    .line 45
    .line 46
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    invoke-interface {p3, p1, v0}, Ll/pol;->c(Ll/ner;Lrx/c;)Lrx/c;

    .line 51
    .line 52
    .line 53
    move-result-object p1

    .line 54
    new-instance p3, Ll/ke6;

    .line 55
    .line 56
    invoke-direct {p3, p0, p2, p4}, Ll/ke6;-><init>(Ll/ue6;Ljava/lang/String;Lcom/p1/mobile/putong/core/api/c0$c;)V

    .line 57
    .line 58
    .line 59
    invoke-static {p3}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 60
    .line 61
    .line 62
    move-result-object p0

    .line 63
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 64
    .line 65
    .line 66
    return-void
.end method

.method public H(Ll/sj6;Z)Z
    .locals 3

    .line 1
    iget-object v0, p1, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_4

    .line 5
    .line 6
    iget-object v0, p1, Ll/sj6;->b:Lcom/p1/mobile/putong/data/User;

    .line 7
    .line 8
    if-nez v0, :cond_0

    .line 9
    .line 10
    goto :goto_1

    .line 11
    :cond_0
    iget-boolean v0, p1, Ll/sj6;->e:Z

    .line 12
    .line 13
    invoke-interface {p0, v0}, Ll/ue6;->V0(Z)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    invoke-static {}, Ll/gra;->a2()Z

    .line 18
    .line 19
    .line 20
    move-result v2

    .line 21
    if-eqz v2, :cond_2

    .line 22
    .line 23
    invoke-interface {p0, p1, v0}, Ll/ue6;->a0(Ll/sj6;Z)Lcom/p1/mobile/putong/data/UserLiveLabel;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    invoke-static {}, Ll/vq8;->b()Z

    .line 28
    .line 29
    .line 30
    move-result v2

    .line 31
    if-eqz v2, :cond_1

    .line 32
    .line 33
    invoke-static {}, Ll/gra;->a2()Z

    .line 34
    .line 35
    .line 36
    move-result v2

    .line 37
    if-eqz v2, :cond_1

    .line 38
    .line 39
    if-nez p2, :cond_1

    .line 40
    .line 41
    iget-object p2, p1, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 42
    .line 43
    iget-object p2, p2, Lcom/p1/mobile/putong/core/data/Conversation;->status:Lcom/p1/mobile/putong/data/ConversationStatus;

    .line 44
    .line 45
    const-string v2, "default"

    .line 46
    .line 47
    invoke-static {p2, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 48
    .line 49
    .line 50
    move-result p2

    .line 51
    if-eqz p2, :cond_1

    .line 52
    .line 53
    if-eqz v0, :cond_1

    .line 54
    .line 55
    invoke-interface {p0, p1, v0}, Ll/ue6;->P0(Ll/sj6;Lcom/p1/mobile/putong/data/UserLiveLabel;)Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    goto :goto_0

    .line 60
    :cond_1
    const-string p0, ""

    .line 61
    .line 62
    goto :goto_0

    .line 63
    :cond_2
    invoke-interface {p0, p1, p2, v0}, Ll/ue6;->O0(Ll/sj6;ZZ)Ljava/lang/String;

    .line 64
    .line 65
    .line 66
    move-result-object p0

    .line 67
    :goto_0
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 68
    .line 69
    .line 70
    move-result p0

    .line 71
    if-eqz p0, :cond_3

    .line 72
    .line 73
    return v1

    .line 74
    :cond_3
    const/4 p0, 0x1

    .line 75
    return p0

    .line 76
    :cond_4
    :goto_1
    return v1
.end method

.method public H0(I)Ljava/lang/String;
    .locals 5

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/ab/IntlCountryCodeController;->f()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_4

    .line 6
    .line 7
    int-to-double p0, p1

    .line 8
    const-wide v0, 0x400a3f2901561662L    # 3.28083993

    .line 9
    .line 10
    .line 11
    .line 12
    .line 13
    mul-double/2addr p0, v0

    .line 14
    const-wide v0, 0x408f400000000000L    # 1000.0

    .line 15
    .line 16
    .line 17
    .line 18
    .line 19
    cmpg-double v0, p0, v0

    .line 20
    .line 21
    const-string v1, "1 "

    .line 22
    .line 23
    if-gez v0, :cond_0

    .line 24
    .line 25
    new-instance p0, Ljava/lang/StringBuilder;

    .line 26
    .line 27
    invoke-direct {p0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 31
    .line 32
    sget v0, Lcom/p1/mobile/putong/core/R$string;->lj:I

    .line 33
    .line 34
    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 39
    .line 40
    .line 41
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    return-object p0

    .line 46
    :cond_0
    const-wide v2, 0x3f28d2dfb65e7658L    # 1.8939E-4

    .line 47
    .line 48
    .line 49
    .line 50
    .line 51
    mul-double/2addr p0, v2

    .line 52
    const-wide/high16 v2, 0x4000000000000000L    # 2.0

    .line 53
    .line 54
    cmpl-double v0, p0, v2

    .line 55
    .line 56
    if-ltz v0, :cond_1

    .line 57
    .line 58
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 59
    .line 60
    sget v1, Lcom/p1/mobile/putong/core/R$string;->L1:I

    .line 61
    .line 62
    sget-object v2, Ll/q8g0;->c:Ljava/text/DecimalFormat;

    .line 63
    .line 64
    invoke-virtual {v2, p0, p1}, Ljava/text/NumberFormat;->format(D)Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object p0

    .line 68
    filled-new-array {p0}, [Ljava/lang/Object;

    .line 69
    .line 70
    .line 71
    move-result-object p0

    .line 72
    invoke-virtual {v0, v1, p0}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 73
    .line 74
    .line 75
    move-result-object p0

    .line 76
    return-object p0

    .line 77
    :cond_1
    const-wide/high16 v2, 0x3ff0000000000000L    # 1.0

    .line 78
    .line 79
    cmpl-double v0, p0, v2

    .line 80
    .line 81
    if-nez v0, :cond_2

    .line 82
    .line 83
    new-instance v0, Ljava/lang/StringBuilder;

    .line 84
    .line 85
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 86
    .line 87
    .line 88
    sget-object v1, Ll/q8g0;->c:Ljava/text/DecimalFormat;

    .line 89
    .line 90
    invoke-virtual {v1, p0, p1}, Ljava/text/NumberFormat;->format(D)Ljava/lang/String;

    .line 91
    .line 92
    .line 93
    move-result-object p0

    .line 94
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 95
    .line 96
    .line 97
    const-string p0, " "

    .line 98
    .line 99
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 100
    .line 101
    .line 102
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 103
    .line 104
    sget p1, Lcom/p1/mobile/putong/core/R$string;->lj:I

    .line 105
    .line 106
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 107
    .line 108
    .line 109
    move-result-object p0

    .line 110
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 111
    .line 112
    .line 113
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 114
    .line 115
    .line 116
    move-result-object p0

    .line 117
    return-object p0

    .line 118
    :cond_2
    cmpg-double v0, p0, v2

    .line 119
    .line 120
    if-gtz v0, :cond_3

    .line 121
    .line 122
    new-instance p0, Ljava/lang/StringBuilder;

    .line 123
    .line 124
    invoke-direct {p0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 125
    .line 126
    .line 127
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 128
    .line 129
    sget v0, Lcom/p1/mobile/putong/core/R$string;->lj:I

    .line 130
    .line 131
    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 132
    .line 133
    .line 134
    move-result-object p1

    .line 135
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 136
    .line 137
    .line 138
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 139
    .line 140
    .line 141
    move-result-object p0

    .line 142
    return-object p0

    .line 143
    :cond_3
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 144
    .line 145
    sget v1, Lcom/p1/mobile/putong/core/R$string;->L1:I

    .line 146
    .line 147
    sget-object v2, Ll/q8g0;->b:Ljava/text/DecimalFormat;

    .line 148
    .line 149
    invoke-virtual {v2, p0, p1}, Ljava/text/NumberFormat;->format(D)Ljava/lang/String;

    .line 150
    .line 151
    .line 152
    move-result-object p0

    .line 153
    filled-new-array {p0}, [Ljava/lang/Object;

    .line 154
    .line 155
    .line 156
    move-result-object p0

    .line 157
    invoke-virtual {v0, v1, p0}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 158
    .line 159
    .line 160
    move-result-object p0

    .line 161
    return-object p0

    .line 162
    :cond_4
    const/16 p0, 0x3e8

    .line 163
    .line 164
    if-ge p1, p0, :cond_5

    .line 165
    .line 166
    new-instance p0, Ljava/lang/StringBuilder;

    .line 167
    .line 168
    const-string p1, "1"

    .line 169
    .line 170
    invoke-direct {p0, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 171
    .line 172
    .line 173
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 174
    .line 175
    sget v0, Lcom/p1/mobile/putong/core/R$string;->sh:I

    .line 176
    .line 177
    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 178
    .line 179
    .line 180
    move-result-object p1

    .line 181
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 182
    .line 183
    .line 184
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 185
    .line 186
    .line 187
    move-result-object p0

    .line 188
    return-object p0

    .line 189
    :cond_5
    const/16 p0, 0x2710

    .line 190
    .line 191
    const/high16 v0, 0x447a0000    # 1000.0f

    .line 192
    .line 193
    if-ge p1, p0, :cond_6

    .line 194
    .line 195
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 196
    .line 197
    sget v1, Lcom/p1/mobile/putong/core/R$string;->K1:I

    .line 198
    .line 199
    sget-object v2, Ll/q8g0;->b:Ljava/text/DecimalFormat;

    .line 200
    .line 201
    int-to-float p1, p1

    .line 202
    div-float/2addr p1, v0

    .line 203
    float-to-double v3, p1

    .line 204
    invoke-virtual {v2, v3, v4}, Ljava/text/NumberFormat;->format(D)Ljava/lang/String;

    .line 205
    .line 206
    .line 207
    move-result-object p1

    .line 208
    filled-new-array {p1}, [Ljava/lang/Object;

    .line 209
    .line 210
    .line 211
    move-result-object p1

    .line 212
    invoke-virtual {p0, v1, p1}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 213
    .line 214
    .line 215
    move-result-object p0

    .line 216
    return-object p0

    .line 217
    :cond_6
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 218
    .line 219
    sget v1, Lcom/p1/mobile/putong/core/R$string;->K1:I

    .line 220
    .line 221
    sget-object v2, Ll/q8g0;->c:Ljava/text/DecimalFormat;

    .line 222
    .line 223
    int-to-float p1, p1

    .line 224
    div-float/2addr p1, v0

    .line 225
    float-to-double v3, p1

    .line 226
    invoke-virtual {v2, v3, v4}, Ljava/text/NumberFormat;->format(D)Ljava/lang/String;

    .line 227
    .line 228
    .line 229
    move-result-object p1

    .line 230
    filled-new-array {p1}, [Ljava/lang/Object;

    .line 231
    .line 232
    .line 233
    move-result-object p1

    .line 234
    invoke-virtual {p0, v1, p1}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 235
    .line 236
    .line 237
    move-result-object p0

    .line 238
    return-object p0
.end method

.method public I(Ll/sj6;Landroid/widget/TextView;ZZ)V
    .locals 2

    .line 1
    invoke-virtual {p2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    check-cast v0, Landroid/widget/FrameLayout$LayoutParams;

    .line 6
    .line 7
    const/4 v1, 0x1

    .line 8
    if-eqz p3, :cond_0

    .line 9
    .line 10
    sget p0, Ll/qa00;->j:I

    .line 11
    .line 12
    iput p0, v0, Landroid/widget/FrameLayout$LayoutParams;->width:I

    .line 13
    .line 14
    iput p0, v0, Landroid/widget/FrameLayout$LayoutParams;->height:I

    .line 15
    .line 16
    sget p1, Ll/qa00;->a:I

    .line 17
    .line 18
    iput p1, v0, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 19
    .line 20
    invoke-virtual {p2, p0}, Landroid/widget/TextView;->setMinWidth(I)V

    .line 21
    .line 22
    .line 23
    const-string p0, ""

    .line 24
    .line 25
    invoke-virtual {p2, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 26
    .line 27
    .line 28
    sget p0, Ll/dbc0;->Y5:I

    .line 29
    .line 30
    invoke-virtual {p2, p0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {p2, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 34
    .line 35
    .line 36
    invoke-static {p2, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 37
    .line 38
    .line 39
    return-void

    .line 40
    :cond_0
    if-eqz p4, :cond_2

    .line 41
    .line 42
    const/4 p3, -0x2

    .line 43
    iput p3, v0, Landroid/widget/FrameLayout$LayoutParams;->width:I

    .line 44
    .line 45
    sget p3, Ll/qa00;->q:I

    .line 46
    .line 47
    iput p3, v0, Landroid/widget/FrameLayout$LayoutParams;->height:I

    .line 48
    .line 49
    sget p4, Ll/qa00;->e:I

    .line 50
    .line 51
    neg-int p4, p4

    .line 52
    iput p4, v0, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 53
    .line 54
    invoke-virtual {p2, p3}, Landroid/widget/TextView;->setMinWidth(I)V

    .line 55
    .line 56
    .line 57
    iget-object p3, p1, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 58
    .line 59
    iget p4, p3, Lcom/p1/mobile/putong/core/data/Conversation;->unreadMessages:I

    .line 60
    .line 61
    invoke-interface {p0, p3}, Ll/ue6;->M(Lcom/p1/mobile/putong/core/data/Conversation;)I

    .line 62
    .line 63
    .line 64
    move-result p0

    .line 65
    add-int/2addr p4, p0

    .line 66
    invoke-static {p4}, Ll/a9g0;->f(I)Ljava/lang/String;

    .line 67
    .line 68
    .line 69
    move-result-object p0

    .line 70
    invoke-virtual {p2, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 71
    .line 72
    .line 73
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 74
    .line 75
    .line 76
    move-result-object p0

    .line 77
    invoke-virtual {p0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 78
    .line 79
    .line 80
    move-result-object p0

    .line 81
    invoke-interface {p0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->sa()Z

    .line 82
    .line 83
    .line 84
    move-result p0

    .line 85
    if-eqz p0, :cond_1

    .line 86
    .line 87
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 88
    .line 89
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 90
    .line 91
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/g;->Me()Ll/mm6;

    .line 92
    .line 93
    .line 94
    move-result-object p0

    .line 95
    iget-object p0, p0, Ll/mm6;->V:Lcom/tantanapp/common/data/orm/Filter;

    .line 96
    .line 97
    iget-object p1, p1, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 98
    .line 99
    invoke-virtual {p0, p1}, Lcom/tantanapp/common/data/orm/Filter;->filter(Ljava/lang/Object;)Z

    .line 100
    .line 101
    .line 102
    move-result p0

    .line 103
    :cond_1
    sget p0, Ll/dbc0;->V5:I

    .line 104
    .line 105
    invoke-virtual {p2, p0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 106
    .line 107
    .line 108
    invoke-virtual {p2, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 109
    .line 110
    .line 111
    invoke-static {p2, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 112
    .line 113
    .line 114
    :cond_2
    return-void
.end method

.method public I0(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/data/Conversation;)Ljava/lang/String;
    .locals 2

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/api/g;->bo(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/data/Conversation;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    const-string v0, ""

    .line 10
    .line 11
    if-nez p0, :cond_0

    .line 12
    .line 13
    return-object v0

    .line 14
    :cond_0
    iget-object p0, p2, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 15
    .line 16
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->tag:Lcom/p1/mobile/putong/core/data/ConversationAdditionalTag;

    .line 17
    .line 18
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditionalTag;->type:Lcom/p1/mobile/putong/core/data/ConversationAdditionalTagType;

    .line 19
    .line 20
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 25
    .line 26
    .line 27
    invoke-virtual {p0}, Ljava/lang/String;->hashCode()I

    .line 28
    .line 29
    .line 30
    move-result p2

    .line 31
    const/4 v1, -0x1

    .line 32
    sparse-switch p2, :sswitch_data_0

    .line 33
    .line 34
    .line 35
    goto :goto_0

    .line 36
    :sswitch_0
    const-string p2, "newuser"

    .line 37
    .line 38
    invoke-virtual {p0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 39
    .line 40
    .line 41
    move-result p0

    .line 42
    if-nez p0, :cond_1

    .line 43
    .line 44
    goto :goto_0

    .line 45
    :cond_1
    const/4 v1, 0x2

    .line 46
    goto :goto_0

    .line 47
    :sswitch_1
    const-string p2, "birthday"

    .line 48
    .line 49
    invoke-virtual {p0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 50
    .line 51
    .line 52
    move-result p0

    .line 53
    if-nez p0, :cond_2

    .line 54
    .line 55
    goto :goto_0

    .line 56
    :cond_2
    const/4 v1, 0x1

    .line 57
    goto :goto_0

    .line 58
    :sswitch_2
    const-string p2, "oneside"

    .line 59
    .line 60
    invoke-virtual {p0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 61
    .line 62
    .line 63
    move-result p0

    .line 64
    if-nez p0, :cond_3

    .line 65
    .line 66
    goto :goto_0

    .line 67
    :cond_3
    const/4 v1, 0x0

    .line 68
    :goto_0
    packed-switch v1, :pswitch_data_0

    .line 69
    .line 70
    .line 71
    goto :goto_2

    .line 72
    :pswitch_0
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 73
    .line 74
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->N0:Lcom/p1/mobile/putong/core/api/f;

    .line 75
    .line 76
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/api/f;->j3(Lcom/p1/mobile/putong/data/User;)Z

    .line 77
    .line 78
    .line 79
    move-result p0

    .line 80
    if-eqz p0, :cond_4

    .line 81
    .line 82
    goto :goto_2

    .line 83
    :cond_4
    const-string v0, "\u521d\u6765\u4e4d\u5230"

    .line 84
    .line 85
    goto :goto_2

    .line 86
    :pswitch_1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 87
    .line 88
    .line 89
    move-result p0

    .line 90
    if-eqz p0, :cond_5

    .line 91
    .line 92
    const-string p0, "\u5979"

    .line 93
    .line 94
    goto :goto_1

    .line 95
    :cond_5
    const-string p0, "\u4ed6"

    .line 96
    .line 97
    :goto_1
    filled-new-array {p0}, [Ljava/lang/Object;

    .line 98
    .line 99
    .line 100
    move-result-object p0

    .line 101
    const-string p2, "%s\u4eca\u5929\u751f\u65e5"

    .line 102
    .line 103
    invoke-static {p2, p0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 104
    .line 105
    .line 106
    move-result-object v0

    .line 107
    goto :goto_2

    .line 108
    :pswitch_2
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 109
    .line 110
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->N0:Lcom/p1/mobile/putong/core/api/f;

    .line 111
    .line 112
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/api/f;->j3(Lcom/p1/mobile/putong/data/User;)Z

    .line 113
    .line 114
    .line 115
    move-result p0

    .line 116
    if-eqz p0, :cond_6

    .line 117
    .line 118
    goto :goto_2

    .line 119
    :cond_6
    const-string v0, "\u7b49\u4f60\u56de\u5e94"

    .line 120
    .line 121
    :goto_2
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 122
    .line 123
    .line 124
    move-result p0

    .line 125
    if-nez p0, :cond_7

    .line 126
    .line 127
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 128
    .line 129
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 130
    .line 131
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/g;->k2:Ljava/util/Set;

    .line 132
    .line 133
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 134
    .line 135
    invoke-interface {p0, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 136
    .line 137
    .line 138
    :cond_7
    return-object v0

    .line 139
    :sswitch_data_0
    .sparse-switch
        -0x4eb21743 -> :sswitch_2
        0x3fbd627d -> :sswitch_1
        0x6e0ac56b -> :sswitch_0
    .end sparse-switch

    .line 140
    .line 141
    .line 142
    .line 143
    .line 144
    .line 145
    .line 146
    .line 147
    .line 148
    .line 149
    .line 150
    .line 151
    .line 152
    .line 153
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public J0(Ljava/lang/String;JJLcom/p1/mobile/putong/core/api/c0$c;)V
    .locals 2

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/core/api/c0$a;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/api/c0$a;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance v0, Ljava/lang/StringBuilder;

    .line 7
    .line 8
    const-string v1, "exclusive_tag_"

    .line 9
    .line 10
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/api/c0$a;->g(Ljava/lang/String;)Lcom/p1/mobile/putong/core/api/c0$a;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    invoke-virtual {p1, p6}, Lcom/p1/mobile/putong/core/api/c0$a;->d(Lcom/p1/mobile/putong/core/api/c0$c;)Lcom/p1/mobile/putong/core/api/c0$a;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    const/4 p6, 0x1

    .line 29
    invoke-virtual {p1, p6}, Lcom/p1/mobile/putong/core/api/c0$a;->b(Z)Lcom/p1/mobile/putong/core/api/c0$a;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    const-wide/16 v0, 0x1

    .line 34
    .line 35
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/core/api/c0$a;->h(J)Lcom/p1/mobile/putong/core/api/c0$a;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    invoke-virtual {p1, p2, p3}, Lcom/p1/mobile/putong/core/api/c0$a;->c(J)Lcom/p1/mobile/putong/core/api/c0$a;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    invoke-virtual {p1, p4, p5}, Lcom/p1/mobile/putong/core/api/c0$a;->f(J)Lcom/p1/mobile/putong/core/api/c0$a;

    .line 44
    .line 45
    .line 46
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 47
    .line 48
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->t1:Lcom/p1/mobile/putong/core/api/c0;

    .line 49
    .line 50
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/core/api/c0;->r(Lcom/p1/mobile/putong/core/api/c0$a;)Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    return-void
.end method

.method public synthetic K(Ll/sj6;)V
    .locals 1

    .line 1
    invoke-static {}, Ll/gra;->Q2()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-interface {p0, p1}, Ll/ue6;->V(Ll/sj6;)V

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    invoke-static {}, Ll/gra;->R2()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_1

    .line 16
    .line 17
    invoke-interface {p0, p1}, Ll/ue6;->R(Ll/sj6;)V

    .line 18
    .line 19
    .line 20
    :cond_1
    return-void
.end method

.method public L0(Ll/sj6;Lcom/p1/mobile/putong/core/data/Message;)Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public M(Lcom/p1/mobile/putong/core/data/Conversation;)I
    .locals 0

    .line 1
    invoke-interface {p0, p1}, Ll/ue6;->T0(Lcom/p1/mobile/putong/core/data/Conversation;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x1

    .line 8
    return p0

    .line 9
    :cond_0
    const/4 p0, 0x0

    .line 10
    return p0
.end method

.method public N0(Lcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/putong/data/Picture$ImageUri;
    .locals 0

    .line 1
    invoke-static {p1}, Ll/vx6;->b(Lcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/putong/data/Picture;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public O0(Ll/sj6;ZZ)Ljava/lang/String;
    .locals 2

    .line 1
    invoke-interface {p0}, Ll/ue6;->getUserLiveLabelHashMap()Ljava/util/HashMap;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object v0, p1, Ll/sj6;->b:Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    iget-object v0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 8
    .line 9
    invoke-virtual {p0, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Lcom/p1/mobile/putong/data/UserLiveLabel;

    .line 14
    .line 15
    invoke-static {}, Ll/vq8;->b()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    const-string v1, ""

    .line 20
    .line 21
    if-eqz v0, :cond_3

    .line 22
    .line 23
    if-eqz p3, :cond_3

    .line 24
    .line 25
    if-nez p2, :cond_3

    .line 26
    .line 27
    iget-object p2, p1, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 28
    .line 29
    iget-object p2, p2, Lcom/p1/mobile/putong/core/data/Conversation;->status:Lcom/p1/mobile/putong/data/ConversationStatus;

    .line 30
    .line 31
    const-string p3, "default"

    .line 32
    .line 33
    invoke-static {p2, p3}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 34
    .line 35
    .line 36
    move-result p2

    .line 37
    if-eqz p2, :cond_3

    .line 38
    .line 39
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 40
    .line 41
    .line 42
    move-result p2

    .line 43
    if-eqz p2, :cond_3

    .line 44
    .line 45
    iget-boolean p2, p0, Lcom/p1/mobile/putong/data/UserLiveLabel;->ongoingCall:Z

    .line 46
    .line 47
    if-eqz p2, :cond_1

    .line 48
    .line 49
    iget-object p1, p0, Lcom/p1/mobile/putong/data/UserLiveLabel;->iconTitle:Ljava/lang/String;

    .line 50
    .line 51
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 52
    .line 53
    .line 54
    move-result p1

    .line 55
    if-eqz p1, :cond_0

    .line 56
    .line 57
    const-string p0, "\u591a\u4eba\u8fde\u7ebf"

    .line 58
    .line 59
    return-object p0

    .line 60
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/data/UserLiveLabel;->iconTitle:Ljava/lang/String;

    .line 61
    .line 62
    return-object p0

    .line 63
    :cond_1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/UserLiveLabel;->isMultiCallGoing()Z

    .line 64
    .line 65
    .line 66
    move-result p2

    .line 67
    if-eqz p2, :cond_3

    .line 68
    .line 69
    iget-object p2, p0, Lcom/p1/mobile/putong/data/UserLiveLabel;->iconTitle:Ljava/lang/String;

    .line 70
    .line 71
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 72
    .line 73
    .line 74
    move-result p2

    .line 75
    if-eqz p2, :cond_2

    .line 76
    .line 77
    iget-object p0, p1, Ll/sj6;->x:Lcom/p1/mobile/android/app/Act;

    .line 78
    .line 79
    sget p1, Lcom/p1/mobile/putong/core/R$string;->zh:I

    .line 80
    .line 81
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 82
    .line 83
    .line 84
    move-result-object p0

    .line 85
    return-object p0

    .line 86
    :cond_2
    iget-object p0, p0, Lcom/p1/mobile/putong/data/UserLiveLabel;->iconTitle:Ljava/lang/String;

    .line 87
    .line 88
    return-object p0

    .line 89
    :cond_3
    return-object v1
.end method

.method public P0(Ll/sj6;Lcom/p1/mobile/putong/data/UserLiveLabel;)Ljava/lang/String;
    .locals 1

    .line 1
    iget-boolean p0, p2, Lcom/p1/mobile/putong/data/UserLiveLabel;->ongoingCall:Z

    .line 2
    .line 3
    if-eqz p0, :cond_1

    .line 4
    .line 5
    iget-object p0, p2, Lcom/p1/mobile/putong/data/UserLiveLabel;->iconTitle:Ljava/lang/String;

    .line 6
    .line 7
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    const-string p0, "\u591a\u4eba\u8fde\u7ebf"

    .line 14
    .line 15
    return-object p0

    .line 16
    :cond_0
    iget-object p0, p2, Lcom/p1/mobile/putong/data/UserLiveLabel;->iconTitle:Ljava/lang/String;

    .line 17
    .line 18
    return-object p0

    .line 19
    :cond_1
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/UserLiveLabel;->isMultiCallGoing()Z

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    iget-object v0, p2, Lcom/p1/mobile/putong/data/UserLiveLabel;->iconTitle:Ljava/lang/String;

    .line 24
    .line 25
    if-eqz p0, :cond_3

    .line 26
    .line 27
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 28
    .line 29
    .line 30
    move-result p0

    .line 31
    if-eqz p0, :cond_2

    .line 32
    .line 33
    iget-object p0, p1, Ll/sj6;->x:Lcom/p1/mobile/android/app/Act;

    .line 34
    .line 35
    sget p1, Lcom/p1/mobile/putong/core/R$string;->zh:I

    .line 36
    .line 37
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    return-object p0

    .line 42
    :cond_2
    iget-object p0, p2, Lcom/p1/mobile/putong/data/UserLiveLabel;->iconTitle:Ljava/lang/String;

    .line 43
    .line 44
    return-object p0

    .line 45
    :cond_3
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 46
    .line 47
    .line 48
    move-result p0

    .line 49
    if-eqz p0, :cond_4

    .line 50
    .line 51
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->Q()Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    invoke-interface {p0}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;->getLiveCardText()Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    return-object p0

    .line 60
    :cond_4
    iget-object p0, p2, Lcom/p1/mobile/putong/data/UserLiveLabel;->iconTitle:Ljava/lang/String;

    .line 61
    .line 62
    return-object p0
.end method

.method public Q(Ll/sj6;Lcom/p1/mobile/putong/data/UserLiveLabel;)V
    .locals 1

    .line 1
    const-string v0, ""

    .line 2
    .line 3
    invoke-interface {p0, p1, v0, p2}, Ll/ue6;->E0(Ll/sj6;Ljava/lang/String;Lcom/p1/mobile/putong/data/UserLiveLabel;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public R(Ll/sj6;)V
    .locals 2

    .line 1
    iget-object p0, p1, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 2
    .line 3
    if-eqz p0, :cond_3

    .line 4
    .line 5
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Conversation;->read:Ljava/lang/Boolean;

    .line 6
    .line 7
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    if-eqz p1, :cond_3

    .line 12
    .line 13
    iget p1, p0, Lcom/p1/mobile/putong/core/data/Conversation;->unreadMessages:I

    .line 14
    .line 15
    if-gtz p1, :cond_3

    .line 16
    .line 17
    iget-object p1, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 18
    .line 19
    const-string v0, "fake_conversation"

    .line 20
    .line 21
    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 22
    .line 23
    .line 24
    move-result p1

    .line 25
    if-eqz p1, :cond_0

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_0
    invoke-static {}, Ll/gra;->h1()Lcom/p1/mobile/putong/core/data/SwitchConvNextConfig;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 33
    .line 34
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 35
    .line 36
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/g;->hq()Ljava/util/List;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    new-instance v1, Ll/me6;

    .line 41
    .line 42
    invoke-direct {v1}, Ll/me6;-><init>()V

    .line 43
    .line 44
    .line 45
    invoke-static {v0, v1}, Ll/jyb;->n(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    new-instance v1, Ll/ne6;

    .line 50
    .line 51
    invoke-direct {v1, p1}, Ll/ne6;-><init>(Lcom/p1/mobile/putong/core/data/SwitchConvNextConfig;)V

    .line 52
    .line 53
    .line 54
    invoke-static {v0, v1}, Ll/jyb;->f(Ljava/util/List;Ll/qcj;)I

    .line 55
    .line 56
    .line 57
    move-result v0

    .line 58
    iget p1, p1, Lcom/p1/mobile/putong/core/data/SwitchConvNextConfig;->exp_limit_count:I

    .line 59
    .line 60
    if-lt v0, p1, :cond_1

    .line 61
    .line 62
    goto :goto_0

    .line 63
    :cond_1
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 64
    .line 65
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 66
    .line 67
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/api/g;->Uo()Ljava/util/List;

    .line 68
    .line 69
    .line 70
    move-result-object p1

    .line 71
    new-instance v0, Ll/oe6;

    .line 72
    .line 73
    invoke-direct {v0}, Ll/oe6;-><init>()V

    .line 74
    .line 75
    .line 76
    invoke-static {p1, v0}, Ll/jyb;->n(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 77
    .line 78
    .line 79
    move-result-object p1

    .line 80
    new-instance v0, Ll/pe6;

    .line 81
    .line 82
    invoke-direct {v0}, Ll/pe6;-><init>()V

    .line 83
    .line 84
    .line 85
    invoke-static {p1, v0}, Ll/jyb;->Q(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 86
    .line 87
    .line 88
    move-result-object p1

    .line 89
    invoke-static {}, Ll/i46;->c()Ll/i46;

    .line 90
    .line 91
    .line 92
    move-result-object v0

    .line 93
    invoke-virtual {v0, p1}, Ll/i46;->j(Ljava/util/List;)V

    .line 94
    .line 95
    .line 96
    invoke-static {}, Ll/i46;->c()Ll/i46;

    .line 97
    .line 98
    .line 99
    move-result-object p1

    .line 100
    iget-object v0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 101
    .line 102
    invoke-virtual {p1, v0}, Ll/i46;->d(Ljava/lang/String;)Z

    .line 103
    .line 104
    .line 105
    move-result p1

    .line 106
    if-eqz p1, :cond_2

    .line 107
    .line 108
    invoke-static {}, Ll/i46;->c()Ll/i46;

    .line 109
    .line 110
    .line 111
    move-result-object p1

    .line 112
    iget-object p1, p1, Ll/i46;->a:Lrx/subjects/a;

    .line 113
    .line 114
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 115
    .line 116
    invoke-virtual {p1, p0}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 117
    .line 118
    .line 119
    return-void

    .line 120
    :cond_2
    invoke-static {}, Ll/i46;->c()Ll/i46;

    .line 121
    .line 122
    .line 123
    move-result-object p0

    .line 124
    invoke-virtual {p0}, Ll/i46;->a()V

    .line 125
    .line 126
    .line 127
    :cond_3
    :goto_0
    return-void
.end method

.method public R0(Ljava/util/List;Lcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/putong/core/data/Message;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/Message;",
            ">;",
            "Lcom/p1/mobile/putong/data/User;",
            ")",
            "Lcom/p1/mobile/putong/core/data/Message;"
        }
    .end annotation

    .line 1
    invoke-static {p1, p2}, Ll/ue6;->t(Ljava/util/List;Lcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/putong/core/data/Message;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public S(Lcom/p1/mobile/putong/core/data/Conversation;)Z
    .locals 0

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Conversation;->property:Lcom/p1/mobile/putong/core/data/ConversationProperty;

    .line 8
    .line 9
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Conversation;->property:Lcom/p1/mobile/putong/core/data/ConversationProperty;

    .line 16
    .line 17
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/ConversationProperty;->conversationTag:Lcom/p1/mobile/putong/core/data/ConversationTag;

    .line 18
    .line 19
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    if-eqz p0, :cond_0

    .line 24
    .line 25
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Conversation;->property:Lcom/p1/mobile/putong/core/data/ConversationProperty;

    .line 26
    .line 27
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/ConversationProperty;->conversationTag:Lcom/p1/mobile/putong/core/data/ConversationTag;

    .line 28
    .line 29
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/data/ConversationTag;->showInList:Z

    .line 30
    .line 31
    if-eqz p0, :cond_0

    .line 32
    .line 33
    iget p0, p1, Lcom/p1/mobile/putong/core/data/Conversation;->userMessageCount:I

    .line 34
    .line 35
    if-nez p0, :cond_0

    .line 36
    .line 37
    iget-boolean p0, p1, Lcom/p1/mobile/putong/core/data/Conversation;->localHasMessage:Z

    .line 38
    .line 39
    if-nez p0, :cond_0

    .line 40
    .line 41
    const/4 p0, 0x1

    .line 42
    return p0

    .line 43
    :cond_0
    const/4 p0, 0x0

    .line 44
    return p0
.end method

.method public S0(Ll/sj6;)V
    .locals 11

    .line 1
    iget-object v0, p1, Ll/sj6;->b:Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    iget-object v1, p1, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 4
    .line 5
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v2

    .line 9
    if-eqz v2, :cond_10

    .line 10
    .line 11
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result v2

    .line 15
    if-eqz v2, :cond_10

    .line 16
    .line 17
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result v2

    .line 21
    const-string v3, ""

    .line 22
    .line 23
    if-eqz v2, :cond_0

    .line 24
    .line 25
    iget-object v2, v1, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 26
    .line 27
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    move-result v2

    .line 31
    if-eqz v2, :cond_0

    .line 32
    .line 33
    iget-object v2, v1, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 34
    .line 35
    iget-object v2, v2, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->tag:Lcom/p1/mobile/putong/core/data/ConversationAdditionalTag;

    .line 36
    .line 37
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 38
    .line 39
    .line 40
    move-result v2

    .line 41
    if-eqz v2, :cond_0

    .line 42
    .line 43
    iget-object v2, v1, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 44
    .line 45
    iget-object v2, v2, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->tag:Lcom/p1/mobile/putong/core/data/ConversationAdditionalTag;

    .line 46
    .line 47
    iget-object v2, v2, Lcom/p1/mobile/putong/core/data/ConversationAdditionalTag;->type:Lcom/p1/mobile/putong/core/data/ConversationAdditionalTagType;

    .line 48
    .line 49
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 50
    .line 51
    .line 52
    move-result v2

    .line 53
    if-eqz v2, :cond_0

    .line 54
    .line 55
    iget-object v2, v1, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 56
    .line 57
    iget-object v2, v2, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->tag:Lcom/p1/mobile/putong/core/data/ConversationAdditionalTag;

    .line 58
    .line 59
    iget-object v2, v2, Lcom/p1/mobile/putong/core/data/ConversationAdditionalTag;->type:Lcom/p1/mobile/putong/core/data/ConversationAdditionalTagType;

    .line 60
    .line 61
    const-string v4, "unknown_"

    .line 62
    .line 63
    invoke-static {v2, v4}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 64
    .line 65
    .line 66
    move-result v2

    .line 67
    if-nez v2, :cond_0

    .line 68
    .line 69
    iget-object v2, v1, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 70
    .line 71
    iget-object v2, v2, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->tag:Lcom/p1/mobile/putong/core/data/ConversationAdditionalTag;

    .line 72
    .line 73
    iget-object v2, v2, Lcom/p1/mobile/putong/core/data/ConversationAdditionalTag;->type:Lcom/p1/mobile/putong/core/data/ConversationAdditionalTagType;

    .line 74
    .line 75
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 76
    .line 77
    .line 78
    move-result-object v2

    .line 79
    goto :goto_0

    .line 80
    :cond_0
    move-object v2, v3

    .line 81
    :goto_0
    invoke-static {}, Lcom/p1/mobile/putong/core/data/OptiMVParams;->new_()Lcom/p1/mobile/putong/core/data/OptiMVParams;

    .line 82
    .line 83
    .line 84
    move-result-object v4

    .line 85
    iget-object v5, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 86
    .line 87
    iput-object v5, v4, Lcom/p1/mobile/putong/core/data/OptiMVParams;->curUserId:Ljava/lang/String;

    .line 88
    .line 89
    iget-object v5, v0, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 90
    .line 91
    iput-object v5, v4, Lcom/p1/mobile/putong/core/data/OptiMVParams;->name:Ljava/lang/String;

    .line 92
    .line 93
    iget-wide v5, v1, Lcom/p1/mobile/putong/core/data/Conversation;->createdTime:D

    .line 94
    .line 95
    iput-wide v5, v4, Lcom/p1/mobile/putong/core/data/OptiMVParams;->createTime:D

    .line 96
    .line 97
    new-instance v5, Ljava/lang/StringBuilder;

    .line 98
    .line 99
    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    .line 100
    .line 101
    .line 102
    iget v6, p1, Ll/sj6;->g:I

    .line 103
    .line 104
    iget v7, p1, Ll/sj6;->h:I

    .line 105
    .line 106
    sub-int/2addr v6, v7

    .line 107
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 108
    .line 109
    .line 110
    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 111
    .line 112
    .line 113
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 114
    .line 115
    .line 116
    move-result-object v3

    .line 117
    iput-object v3, v4, Lcom/p1/mobile/putong/core/data/OptiMVParams;->newMatchRank:Ljava/lang/String;

    .line 118
    .line 119
    iget-object v3, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 120
    .line 121
    iput-object v3, v4, Lcom/p1/mobile/putong/core/data/OptiMVParams;->momentsUserId:Ljava/lang/String;

    .line 122
    .line 123
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/Conversation;->isFakeHeartbeatConv()Z

    .line 124
    .line 125
    .line 126
    move-result v3

    .line 127
    const/4 v5, 0x1

    .line 128
    const/4 v6, 0x0

    .line 129
    if-nez v3, :cond_2

    .line 130
    .line 131
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/Conversation;->isFakeQuickChatConv()Z

    .line 132
    .line 133
    .line 134
    move-result v3

    .line 135
    if-eqz v3, :cond_1

    .line 136
    .line 137
    goto :goto_1

    .line 138
    :cond_1
    move v3, v6

    .line 139
    goto :goto_2

    .line 140
    :cond_2
    :goto_1
    move v3, v5

    .line 141
    :goto_2
    iput-boolean v3, v4, Lcom/p1/mobile/putong/core/data/OptiMVParams;->is_fake:Z

    .line 142
    .line 143
    sget-object v3, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 144
    .line 145
    iget-object v3, v3, Lcom/p1/mobile/putong/core/api/c;->N0:Lcom/p1/mobile/putong/core/api/f;

    .line 146
    .line 147
    invoke-virtual {v3, v0}, Lcom/p1/mobile/putong/core/api/f;->j3(Lcom/p1/mobile/putong/data/User;)Z

    .line 148
    .line 149
    .line 150
    move-result v0

    .line 151
    const-string v3, "0"

    .line 152
    .line 153
    const-string v7, "1"

    .line 154
    .line 155
    if-eqz v0, :cond_3

    .line 156
    .line 157
    move-object v0, v7

    .line 158
    goto :goto_3

    .line 159
    :cond_3
    move-object v0, v3

    .line 160
    :goto_3
    iput-object v0, v4, Lcom/p1/mobile/putong/core/data/OptiMVParams;->isOnline:Ljava/lang/String;

    .line 161
    .line 162
    invoke-interface {p0, v1}, Ll/ue6;->S(Lcom/p1/mobile/putong/core/data/Conversation;)Z

    .line 163
    .line 164
    .line 165
    move-result v0

    .line 166
    if-eqz v0, :cond_4

    .line 167
    .line 168
    move-object v0, v3

    .line 169
    goto :goto_4

    .line 170
    :cond_4
    move-object v0, v7

    .line 171
    :goto_4
    iput-object v0, v4, Lcom/p1/mobile/putong/core/data/OptiMVParams;->newMsgPageModule:Ljava/lang/String;

    .line 172
    .line 173
    iget-object v0, p1, Ll/sj6;->K:Ljava/lang/String;

    .line 174
    .line 175
    iput-object v0, v4, Lcom/p1/mobile/putong/core/data/OptiMVParams;->isOnliveAnchor:Ljava/lang/String;

    .line 176
    .line 177
    iget-object v0, v1, Lcom/p1/mobile/putong/core/data/Conversation;->read:Ljava/lang/Boolean;

    .line 178
    .line 179
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 180
    .line 181
    .line 182
    move-result v0

    .line 183
    if-eqz v0, :cond_5

    .line 184
    .line 185
    move-object v0, v3

    .line 186
    goto :goto_5

    .line 187
    :cond_5
    move-object v0, v7

    .line 188
    :goto_5
    iput-object v0, v4, Lcom/p1/mobile/putong/core/data/OptiMVParams;->isRedDot:Ljava/lang/String;

    .line 189
    .line 190
    iput-object v3, v4, Lcom/p1/mobile/putong/core/data/OptiMVParams;->isNewMoment:Ljava/lang/String;

    .line 191
    .line 192
    iget-object v0, v1, Lcom/p1/mobile/putong/core/data/Conversation;->otherUser:Ljava/lang/String;

    .line 193
    .line 194
    iput-object v0, v4, Lcom/p1/mobile/putong/core/data/OptiMVParams;->otherUid:Ljava/lang/String;

    .line 195
    .line 196
    iget v0, v1, Lcom/p1/mobile/putong/core/data/Conversation;->unreadMessages:I

    .line 197
    .line 198
    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 199
    .line 200
    .line 201
    move-result-object v0

    .line 202
    iput-object v0, v4, Lcom/p1/mobile/putong/core/data/OptiMVParams;->redDotNum:Ljava/lang/String;

    .line 203
    .line 204
    invoke-static {v1}, Ll/om6;->a(Lcom/p1/mobile/putong/core/data/Conversation;)Ljava/lang/String;

    .line 205
    .line 206
    .line 207
    move-result-object v0

    .line 208
    iput-object v0, v4, Lcom/p1/mobile/putong/core/data/OptiMVParams;->messagecCellType:Ljava/lang/String;

    .line 209
    .line 210
    invoke-static {}, Ll/n46;->g()Ll/n46;

    .line 211
    .line 212
    .line 213
    move-result-object v0

    .line 214
    iget-object v3, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 215
    .line 216
    invoke-virtual {v0, v3}, Ll/n46;->o(Ljava/lang/String;)Z

    .line 217
    .line 218
    .line 219
    move-result v0

    .line 220
    if-eqz v0, :cond_6

    .line 221
    .line 222
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/Conversation;->hasRemoveLabel()Z

    .line 223
    .line 224
    .line 225
    move-result v0

    .line 226
    if-nez v0, :cond_6

    .line 227
    .line 228
    const-string v0, "longtimenosee"

    .line 229
    .line 230
    iput-object v0, v4, Lcom/p1/mobile/putong/core/data/OptiMVParams;->user_tag:Ljava/lang/String;

    .line 231
    .line 232
    goto :goto_6

    .line 233
    :cond_6
    iput-object v2, v4, Lcom/p1/mobile/putong/core/data/OptiMVParams;->user_tag:Ljava/lang/String;

    .line 234
    .line 235
    :goto_6
    iget-object v0, p1, Ll/sj6;->M:Ljava/lang/String;

    .line 236
    .line 237
    iput-object v0, v4, Lcom/p1/mobile/putong/core/data/OptiMVParams;->day_number:Ljava/lang/String;

    .line 238
    .line 239
    iget-object v0, p1, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 240
    .line 241
    invoke-interface {p0, v0}, Ll/ue6;->Z0(Lcom/p1/mobile/putong/core/data/Conversation;)Z

    .line 242
    .line 243
    .line 244
    move-result v0

    .line 245
    if-eqz v0, :cond_7

    .line 246
    .line 247
    iget-object v0, p1, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 248
    .line 249
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/data/Conversation;->hasRemoveLabel()Z

    .line 250
    .line 251
    .line 252
    move-result v0

    .line 253
    if-nez v0, :cond_7

    .line 254
    .line 255
    iget-object v0, p1, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 256
    .line 257
    iget v0, v0, Lcom/p1/mobile/putong/core/data/Conversation;->unreadMessages:I

    .line 258
    .line 259
    if-nez v0, :cond_7

    .line 260
    .line 261
    new-instance v0, Ljava/lang/StringBuilder;

    .line 262
    .line 263
    const-string v2, "1,"

    .line 264
    .line 265
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 266
    .line 267
    .line 268
    invoke-static {}, Ll/n46;->g()Ll/n46;

    .line 269
    .line 270
    .line 271
    move-result-object v2

    .line 272
    iget-object v3, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 273
    .line 274
    invoke-virtual {v2, v3, v5}, Ll/n46;->j(Ljava/lang/String;Z)Ljava/lang/String;

    .line 275
    .line 276
    .line 277
    move-result-object v2

    .line 278
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 279
    .line 280
    .line 281
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 282
    .line 283
    .line 284
    move-result-object v0

    .line 285
    iput-object v0, v4, Lcom/p1/mobile/putong/core/data/OptiMVParams;->chat_guide:Ljava/lang/String;

    .line 286
    .line 287
    :cond_7
    invoke-static {v1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->R1(Lcom/p1/mobile/putong/core/data/Conversation;)Z

    .line 288
    .line 289
    .line 290
    move-result v0

    .line 291
    if-eqz v0, :cond_8

    .line 292
    .line 293
    iput-object v7, v4, Lcom/p1/mobile/putong/core/data/OptiMVParams;->love_letter:Ljava/lang/String;

    .line 294
    .line 295
    :cond_8
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/Conversation;->hasReSwipeConvIceBreak()Z

    .line 296
    .line 297
    .line 298
    move-result v0

    .line 299
    if-eqz v0, :cond_9

    .line 300
    .line 301
    const-string v0, "break_ice"

    .line 302
    .line 303
    goto :goto_7

    .line 304
    :cond_9
    const-string v0, "unbreak_ice"

    .line 305
    .line 306
    :goto_7
    iput-object v0, v4, Lcom/p1/mobile/putong/core/data/OptiMVParams;->pairing_type:Ljava/lang/String;

    .line 307
    .line 308
    iput-boolean v6, v4, Lcom/p1/mobile/putong/core/data/OptiMVParams;->chat_game_show:Z

    .line 309
    .line 310
    iget-object v0, p1, Ll/sj6;->L:Ljava/lang/String;

    .line 311
    .line 312
    iput-object v0, v4, Lcom/p1/mobile/putong/core/data/OptiMVParams;->equipment_type:Ljava/lang/String;

    .line 313
    .line 314
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 315
    .line 316
    .line 317
    move-result-object v0

    .line 318
    invoke-virtual {v0}, Ll/j49;->g()Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;

    .line 319
    .line 320
    .line 321
    move-result-object v0

    .line 322
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;->b8()Z

    .line 323
    .line 324
    .line 325
    move-result v0

    .line 326
    if-eqz v0, :cond_a

    .line 327
    .line 328
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/Conversation;->isPlatinumTop()Z

    .line 329
    .line 330
    .line 331
    move-result v0

    .line 332
    if-eqz v0, :cond_a

    .line 333
    .line 334
    goto :goto_8

    .line 335
    :cond_a
    move v5, v6

    .line 336
    :goto_8
    iput-boolean v5, v4, Lcom/p1/mobile/putong/core/data/OptiMVParams;->is_platinum_top_chat:Z

    .line 337
    .line 338
    invoke-interface {p0, p1}, Ll/ue6;->q(Ll/sj6;)Z

    .line 339
    .line 340
    .line 341
    move-result v0

    .line 342
    if-eqz v0, :cond_b

    .line 343
    .line 344
    const-string p0, "gotoreply"

    .line 345
    .line 346
    iput-object p0, v4, Lcom/p1/mobile/putong/core/data/OptiMVParams;->guide_type:Ljava/lang/String;

    .line 347
    .line 348
    goto :goto_9

    .line 349
    :cond_b
    iget-object v0, p1, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 350
    .line 351
    invoke-interface {p0, v0}, Ll/ue6;->p0(Lcom/p1/mobile/putong/core/data/Conversation;)Z

    .line 352
    .line 353
    .line 354
    move-result p0

    .line 355
    if-eqz p0, :cond_e

    .line 356
    .line 357
    iget-object p0, p1, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 358
    .line 359
    iget v0, p0, Lcom/p1/mobile/putong/core/data/Conversation;->unreadMessages:I

    .line 360
    .line 361
    if-gtz v0, :cond_e

    .line 362
    .line 363
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Conversation;->property:Lcom/p1/mobile/putong/core/data/ConversationProperty;

    .line 364
    .line 365
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/ConversationProperty;->conversationTag:Lcom/p1/mobile/putong/core/data/ConversationTag;

    .line 366
    .line 367
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/ConversationTag;->suggestExpireTime:Ljava/lang/String;

    .line 368
    .line 369
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 370
    .line 371
    .line 372
    move-result p0

    .line 373
    if-nez p0, :cond_c

    .line 374
    .line 375
    iget-object p0, p1, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 376
    .line 377
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Conversation;->property:Lcom/p1/mobile/putong/core/data/ConversationProperty;

    .line 378
    .line 379
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/ConversationProperty;->conversationTag:Lcom/p1/mobile/putong/core/data/ConversationTag;

    .line 380
    .line 381
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/ConversationTag;->suggestExpireTime:Ljava/lang/String;

    .line 382
    .line 383
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 384
    .line 385
    .line 386
    move-result p0

    .line 387
    if-nez p0, :cond_e

    .line 388
    .line 389
    invoke-static {}, Ll/pzi0;->o()J

    .line 390
    .line 391
    .line 392
    move-result-wide v2

    .line 393
    iget-object p0, p1, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 394
    .line 395
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Conversation;->property:Lcom/p1/mobile/putong/core/data/ConversationProperty;

    .line 396
    .line 397
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/ConversationProperty;->conversationTag:Lcom/p1/mobile/putong/core/data/ConversationTag;

    .line 398
    .line 399
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/ConversationTag;->suggestExpireTime:Ljava/lang/String;

    .line 400
    .line 401
    invoke-static {p0}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    .line 402
    .line 403
    .line 404
    move-result-wide v7

    .line 405
    const-wide/16 v9, 0x3e8

    .line 406
    .line 407
    mul-long/2addr v7, v9

    .line 408
    cmp-long p0, v2, v7

    .line 409
    .line 410
    if-gez p0, :cond_e

    .line 411
    .line 412
    :cond_c
    iget-object p0, p1, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 413
    .line 414
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Conversation;->property:Lcom/p1/mobile/putong/core/data/ConversationProperty;

    .line 415
    .line 416
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/ConversationProperty;->conversationTag:Lcom/p1/mobile/putong/core/data/ConversationTag;

    .line 417
    .line 418
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/ConversationTag;->emoji:Ljava/lang/String;

    .line 419
    .line 420
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 421
    .line 422
    .line 423
    move-result p0

    .line 424
    if-nez p0, :cond_d

    .line 425
    .line 426
    const-string p0, "emoji"

    .line 427
    .line 428
    iput-object p0, v4, Lcom/p1/mobile/putong/core/data/OptiMVParams;->guide_type:Ljava/lang/String;

    .line 429
    .line 430
    goto :goto_9

    .line 431
    :cond_d
    iget-object p0, p1, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 432
    .line 433
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Conversation;->property:Lcom/p1/mobile/putong/core/data/ConversationProperty;

    .line 434
    .line 435
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/ConversationProperty;->conversationTag:Lcom/p1/mobile/putong/core/data/ConversationTag;

    .line 436
    .line 437
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/ConversationTag;->suggestText:Ljava/lang/String;

    .line 438
    .line 439
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 440
    .line 441
    .line 442
    move-result p0

    .line 443
    if-nez p0, :cond_e

    .line 444
    .line 445
    const-string p0, "startchat"

    .line 446
    .line 447
    iput-object p0, v4, Lcom/p1/mobile/putong/core/data/OptiMVParams;->guide_type:Ljava/lang/String;

    .line 448
    .line 449
    :cond_e
    :goto_9
    invoke-static {}, Ll/gra;->P()Lcom/p1/mobile/putong/core/data/ChatRoundsDisplayedExternallyConfig;

    .line 450
    .line 451
    .line 452
    move-result-object p0

    .line 453
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 454
    .line 455
    .line 456
    move-result p1

    .line 457
    if-eqz p1, :cond_f

    .line 458
    .line 459
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/data/ChatRoundsDisplayedExternallyConfig;->enabled:Z

    .line 460
    .line 461
    if-eqz p0, :cond_f

    .line 462
    .line 463
    invoke-static {v1}, Ll/om6;->e(Lcom/p1/mobile/putong/core/data/Conversation;)I

    .line 464
    .line 465
    .line 466
    move-result p0

    .line 467
    iput p0, v4, Lcom/p1/mobile/putong/core/data/OptiMVParams;->spark_level:I

    .line 468
    .line 469
    invoke-static {v1}, Ll/om6;->d(Lcom/p1/mobile/putong/core/data/Conversation;)I

    .line 470
    .line 471
    .line 472
    move-result p0

    .line 473
    iput p0, v4, Lcom/p1/mobile/putong/core/data/OptiMVParams;->message_pairs:I

    .line 474
    .line 475
    invoke-static {v1}, Ll/om6;->b(Lcom/p1/mobile/putong/core/data/Conversation;)I

    .line 476
    .line 477
    .line 478
    move-result p0

    .line 479
    iput p0, v4, Lcom/p1/mobile/putong/core/data/OptiMVParams;->is_close_friend:I

    .line 480
    .line 481
    invoke-static {v1}, Ll/om6;->c(Lcom/p1/mobile/putong/core/data/Conversation;)I

    .line 482
    .line 483
    .line 484
    move-result p0

    .line 485
    iput p0, v4, Lcom/p1/mobile/putong/core/data/OptiMVParams;->is_top_recommend:I

    .line 486
    .line 487
    :cond_f
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 488
    .line 489
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 490
    .line 491
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/g;->R:Ll/p560;

    .line 492
    .line 493
    invoke-virtual {p0, v4}, Ll/p560;->b(Lcom/p1/mobile/putong/core/data/OptiMVParams;)V

    .line 494
    .line 495
    .line 496
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 497
    .line 498
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 499
    .line 500
    iget-object p1, p0, Lcom/p1/mobile/putong/core/api/g;->R:Ll/p560;

    .line 501
    .line 502
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/g;->S:Ll/yk30;

    .line 503
    .line 504
    invoke-virtual {p1, p0, v6}, Ll/p560;->e(Ll/w1m;Z)V

    .line 505
    .line 506
    .line 507
    :cond_10
    return-void
.end method

.method public T(Lcom/p1/mobile/putong/core/data/Conversation;)Z
    .locals 0

    .line 1
    invoke-static {}, Ll/gra;->r1()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    invoke-static {}, Ll/n46;->g()Ll/n46;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 18
    .line 19
    invoke-virtual {p0, p1}, Ll/n46;->o(Ljava/lang/String;)Z

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    if-eqz p0, :cond_0

    .line 24
    .line 25
    const/4 p0, 0x1

    .line 26
    return p0

    .line 27
    :cond_0
    const/4 p0, 0x0

    .line 28
    return p0
.end method

.method public T0(Lcom/p1/mobile/putong/core/data/Conversation;)Z
    .locals 1

    .line 1
    invoke-static {}, Ll/n46;->g()Ll/n46;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/n46;->n()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    iget v0, p1, Lcom/p1/mobile/putong/core/data/Conversation;->unreadMessages:I

    .line 18
    .line 19
    if-nez v0, :cond_0

    .line 20
    .line 21
    invoke-interface {p0, p1}, Ll/ue6;->T(Lcom/p1/mobile/putong/core/data/Conversation;)Z

    .line 22
    .line 23
    .line 24
    move-result p0

    .line 25
    if-eqz p0, :cond_0

    .line 26
    .line 27
    const/4 p0, 0x1

    .line 28
    return p0

    .line 29
    :cond_0
    const/4 p0, 0x0

    .line 30
    return p0
.end method

.method public U0(Ll/sj6;)Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public V(Ll/sj6;)V
    .locals 2

    .line 1
    iget-object p0, p1, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 2
    .line 3
    if-eqz p0, :cond_3

    .line 4
    .line 5
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Conversation;->read:Ljava/lang/Boolean;

    .line 6
    .line 7
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    if-nez p1, :cond_3

    .line 12
    .line 13
    iget p1, p0, Lcom/p1/mobile/putong/core/data/Conversation;->unreadMessages:I

    .line 14
    .line 15
    if-eqz p1, :cond_3

    .line 16
    .line 17
    iget-object p1, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 18
    .line 19
    const-string v0, "fake_conversation"

    .line 20
    .line 21
    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 22
    .line 23
    .line 24
    move-result p1

    .line 25
    if-eqz p1, :cond_0

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_0
    invoke-static {}, Ll/gra;->h1()Lcom/p1/mobile/putong/core/data/SwitchConvNextConfig;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 33
    .line 34
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 35
    .line 36
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/g;->hq()Ljava/util/List;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    new-instance v1, Ll/qe6;

    .line 41
    .line 42
    invoke-direct {v1}, Ll/qe6;-><init>()V

    .line 43
    .line 44
    .line 45
    invoke-static {v0, v1}, Ll/jyb;->n(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    new-instance v1, Ll/re6;

    .line 50
    .line 51
    invoke-direct {v1, p1}, Ll/re6;-><init>(Lcom/p1/mobile/putong/core/data/SwitchConvNextConfig;)V

    .line 52
    .line 53
    .line 54
    invoke-static {v0, v1}, Ll/jyb;->f(Ljava/util/List;Ll/qcj;)I

    .line 55
    .line 56
    .line 57
    move-result v1

    .line 58
    iget p1, p1, Lcom/p1/mobile/putong/core/data/SwitchConvNextConfig;->exp_limit_count:I

    .line 59
    .line 60
    if-ge v1, p1, :cond_1

    .line 61
    .line 62
    goto :goto_0

    .line 63
    :cond_1
    new-instance p1, Ll/se6;

    .line 64
    .line 65
    invoke-direct {p1}, Ll/se6;-><init>()V

    .line 66
    .line 67
    .line 68
    invoke-static {v0, p1}, Ll/jyb;->Q(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 69
    .line 70
    .line 71
    move-result-object p1

    .line 72
    invoke-static {}, Ll/i46;->c()Ll/i46;

    .line 73
    .line 74
    .line 75
    move-result-object v0

    .line 76
    invoke-virtual {v0, p1}, Ll/i46;->j(Ljava/util/List;)V

    .line 77
    .line 78
    .line 79
    invoke-static {}, Ll/i46;->c()Ll/i46;

    .line 80
    .line 81
    .line 82
    move-result-object p1

    .line 83
    iget-object v0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 84
    .line 85
    invoke-virtual {p1, v0}, Ll/i46;->d(Ljava/lang/String;)Z

    .line 86
    .line 87
    .line 88
    move-result p1

    .line 89
    if-eqz p1, :cond_2

    .line 90
    .line 91
    invoke-static {}, Ll/i46;->c()Ll/i46;

    .line 92
    .line 93
    .line 94
    move-result-object p1

    .line 95
    iget-object p1, p1, Ll/i46;->a:Lrx/subjects/a;

    .line 96
    .line 97
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 98
    .line 99
    invoke-virtual {p1, p0}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 100
    .line 101
    .line 102
    return-void

    .line 103
    :cond_2
    invoke-static {}, Ll/i46;->c()Ll/i46;

    .line 104
    .line 105
    .line 106
    move-result-object p0

    .line 107
    invoke-virtual {p0}, Ll/i46;->a()V

    .line 108
    .line 109
    .line 110
    :cond_3
    :goto_0
    return-void
.end method

.method public V0(Z)Z
    .locals 0

    .line 1
    invoke-static {}, Ll/gra;->a2()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-nez p0, :cond_0

    .line 6
    .line 7
    return p1

    .line 8
    :cond_0
    const/4 p0, 0x0

    .line 9
    return p0
.end method

.method public W(Ll/pol;)Z
    .locals 0

    .line 1
    instance-of p0, p1, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    check-cast p1, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;

    .line 6
    .line 7
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;->E()Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    const/4 p0, 0x1

    .line 14
    return p0

    .line 15
    :cond_0
    const/4 p0, 0x0

    .line 16
    return p0
.end method

.method public X(Lcom/p1/mobile/putong/core/data/Conversation;)Z
    .locals 2

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ll/j49;->g()Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-interface {p0}, Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;->b8()Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    if-eqz p0, :cond_0

    .line 20
    .line 21
    iget p0, p1, Lcom/p1/mobile/putong/core/data/Conversation;->level:I

    .line 22
    .line 23
    const/16 v0, 0x5a

    .line 24
    .line 25
    if-ne p0, v0, :cond_0

    .line 26
    .line 27
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 28
    .line 29
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 30
    .line 31
    .line 32
    move-result p0

    .line 33
    if-eqz p0, :cond_0

    .line 34
    .line 35
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 36
    .line 37
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->pinChat:Lcom/p1/mobile/putong/core/data/PlatinumPinChat;

    .line 38
    .line 39
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 40
    .line 41
    .line 42
    move-result p0

    .line 43
    if-eqz p0, :cond_0

    .line 44
    .line 45
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 46
    .line 47
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->pinChat:Lcom/p1/mobile/putong/core/data/PlatinumPinChat;

    .line 48
    .line 49
    iget-boolean p1, p0, Lcom/p1/mobile/putong/core/data/PlatinumPinChat;->pin:Z

    .line 50
    .line 51
    if-eqz p1, :cond_0

    .line 52
    .line 53
    iget-wide p0, p0, Lcom/p1/mobile/putong/core/data/PlatinumPinChat;->expireTime:D

    .line 54
    .line 55
    invoke-static {}, Ll/pzi0;->o()J

    .line 56
    .line 57
    .line 58
    move-result-wide v0

    .line 59
    long-to-double v0, v0

    .line 60
    cmpl-double p0, p0, v0

    .line 61
    .line 62
    if-lez p0, :cond_0

    .line 63
    .line 64
    const/4 p0, 0x1

    .line 65
    return p0

    .line 66
    :cond_0
    const/4 p0, 0x0

    .line 67
    return p0
.end method

.method public Y(Lcom/p1/mobile/putong/core/data/Conversation;)Z
    .locals 1

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_1

    .line 6
    .line 7
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Conversation;->status:Lcom/p1/mobile/putong/data/ConversationStatus;

    .line 8
    .line 9
    const-string v0, "removed"

    .line 10
    .line 11
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    if-nez p0, :cond_0

    .line 16
    .line 17
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Conversation;->status:Lcom/p1/mobile/putong/data/ConversationStatus;

    .line 18
    .line 19
    const-string p1, "invisible"

    .line 20
    .line 21
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 22
    .line 23
    .line 24
    move-result p0

    .line 25
    if-eqz p0, :cond_1

    .line 26
    .line 27
    :cond_0
    const/4 p0, 0x1

    .line 28
    return p0

    .line 29
    :cond_1
    const/4 p0, 0x0

    .line 30
    return p0
.end method

.method public Y0(Lcom/p1/mobile/putong/data/UserLiveLabel;)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->Q()Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p1, p1, Lcom/p1/mobile/putong/data/UserLiveLabel;->multiCallInfo:Lcom/p1/mobile/putong/data/LiveMultiCallInfoInLabel;

    .line 6
    .line 7
    iget-object p1, p1, Lcom/p1/mobile/putong/data/LiveMultiCallInfoInLabel;->role:Ljava/lang/String;

    .line 8
    .line 9
    invoke-interface {p0, p1}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;->Dr(Ljava/lang/String;)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public Z0(Lcom/p1/mobile/putong/core/data/Conversation;)Z
    .locals 1

    .line 1
    invoke-static {}, Ll/n46;->g()Ll/n46;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/n46;->l()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-interface {p0, p1}, Ll/ue6;->T(Lcom/p1/mobile/putong/core/data/Conversation;)Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    if-eqz p0, :cond_0

    .line 16
    .line 17
    const/4 p0, 0x1

    .line 18
    return p0

    .line 19
    :cond_0
    const/4 p0, 0x0

    .line 20
    return p0
.end method

.method public a0(Ll/sj6;Z)Lcom/p1/mobile/putong/data/UserLiveLabel;
    .locals 3
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 4
    .line 5
    invoke-virtual {v0, p2}, Lcom/p1/mobile/putong/core/api/g;->vg(Z)Ljava/util/HashSet;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-object v1, p1, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 10
    .line 11
    iget-object v1, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    const/4 v1, 0x0

    .line 18
    if-eqz v0, :cond_2

    .line 19
    .line 20
    iget-object v0, p1, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 21
    .line 22
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/Conversation;->convType:Ljava/lang/String;

    .line 23
    .line 24
    const-string v2, "group"

    .line 25
    .line 26
    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    if-eqz v0, :cond_1

    .line 31
    .line 32
    iget-object v0, p1, Ll/sj6;->b:Lcom/p1/mobile/putong/data/User;

    .line 33
    .line 34
    iget-object v0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 35
    .line 36
    invoke-interface {p0, p2, v0}, Ll/ue6;->y(ZLjava/lang/String;)Lcom/p1/mobile/putong/data/UserLiveLabel;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 41
    .line 42
    .line 43
    move-result p2

    .line 44
    if-eqz p2, :cond_0

    .line 45
    .line 46
    iget-object p1, p1, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 47
    .line 48
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/Conversation;->otherUser:Ljava/lang/String;

    .line 49
    .line 50
    iget-object p2, p0, Lcom/p1/mobile/putong/data/UserLiveLabel;->groupId:Ljava/lang/String;

    .line 51
    .line 52
    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 53
    .line 54
    .line 55
    move-result p1

    .line 56
    if-nez p1, :cond_0

    .line 57
    .line 58
    return-object v1

    .line 59
    :cond_0
    return-object p0

    .line 60
    :cond_1
    iget-object p1, p1, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 61
    .line 62
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 63
    .line 64
    invoke-interface {p0, p2, p1}, Ll/ue6;->y(ZLjava/lang/String;)Lcom/p1/mobile/putong/data/UserLiveLabel;

    .line 65
    .line 66
    .line 67
    move-result-object p0

    .line 68
    return-object p0

    .line 69
    :cond_2
    return-object v1
.end method

.method public a1(Ll/sj6;)Lcom/p1/mobile/putong/data/UserLiveLabel;
    .locals 3
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    iget-boolean v0, p1, Ll/sj6;->e:Z

    .line 2
    .line 3
    invoke-interface {p0, v0}, Ll/ue6;->V0(Z)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 8
    .line 9
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 10
    .line 11
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/core/api/g;->vg(Z)Ljava/util/HashSet;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iget-object v1, p1, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 16
    .line 17
    iget-object v1, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 18
    .line 19
    invoke-virtual {v0, v1}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    const/4 v1, 0x0

    .line 24
    if-eqz v0, :cond_3

    .line 25
    .line 26
    iget-object v0, p1, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 27
    .line 28
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/Conversation;->convType:Ljava/lang/String;

    .line 29
    .line 30
    const-string v2, "group"

    .line 31
    .line 32
    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    if-eqz v0, :cond_2

    .line 37
    .line 38
    iget-object v0, p1, Ll/sj6;->b:Lcom/p1/mobile/putong/data/User;

    .line 39
    .line 40
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 41
    .line 42
    .line 43
    move-result v0

    .line 44
    if-eqz v0, :cond_0

    .line 45
    .line 46
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 47
    .line 48
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 49
    .line 50
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/core/api/g;->zg(Z)Ljava/util/LinkedHashMap;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    iget-object v0, p1, Ll/sj6;->b:Lcom/p1/mobile/putong/data/User;

    .line 55
    .line 56
    iget-object v0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 57
    .line 58
    invoke-virtual {p0, v0}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    check-cast p0, Lcom/p1/mobile/putong/data/UserLiveLabel;

    .line 63
    .line 64
    goto :goto_0

    .line 65
    :cond_0
    move-object p0, v1

    .line 66
    :goto_0
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 67
    .line 68
    .line 69
    move-result v0

    .line 70
    if-eqz v0, :cond_1

    .line 71
    .line 72
    iget-object p1, p1, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 73
    .line 74
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/Conversation;->otherUser:Ljava/lang/String;

    .line 75
    .line 76
    iget-object v0, p0, Lcom/p1/mobile/putong/data/UserLiveLabel;->groupId:Ljava/lang/String;

    .line 77
    .line 78
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 79
    .line 80
    .line 81
    move-result p1

    .line 82
    if-nez p1, :cond_1

    .line 83
    .line 84
    return-object v1

    .line 85
    :cond_1
    return-object p0

    .line 86
    :cond_2
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 87
    .line 88
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 89
    .line 90
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/core/api/g;->zg(Z)Ljava/util/LinkedHashMap;

    .line 91
    .line 92
    .line 93
    move-result-object p0

    .line 94
    iget-object p1, p1, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 95
    .line 96
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 97
    .line 98
    invoke-virtual {p0, p1}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 99
    .line 100
    .line 101
    move-result-object p0

    .line 102
    check-cast p0, Lcom/p1/mobile/putong/data/UserLiveLabel;

    .line 103
    .line 104
    return-object p0

    .line 105
    :cond_3
    return-object v1
.end method

.method public b(Ljava/util/List;Ll/y20;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ll/orl;",
            ">;",
            "Ll/y20<",
            "Ll/orl;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    goto :goto_1

    .line 8
    :cond_0
    const/4 p0, 0x0

    .line 9
    :goto_0
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-ge p0, v0, :cond_1

    .line 14
    .line 15
    invoke-interface {p1, p0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    check-cast v0, Ll/orl;

    .line 20
    .line 21
    invoke-interface {p2, v0}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 22
    .line 23
    .line 24
    add-int/lit8 p0, p0, 0x1

    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_1
    :goto_1
    return-void
.end method

.method public b0(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 9

    .line 1
    invoke-static {}, Ll/pzi0;->o()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/dkb;->na()Lcom/p1/mobile/putong/data/User;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 14
    .line 15
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 16
    .line 17
    invoke-virtual {v2, p1}, Ll/dkb;->oa(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 22
    .line 23
    .line 24
    move-result v3

    .line 25
    if-eqz v3, :cond_3

    .line 26
    .line 27
    iget-wide v3, p0, Lcom/p1/mobile/putong/data/User;->createdTime:D

    .line 28
    .line 29
    double-to-long v5, v3

    .line 30
    sub-long v5, v0, v5

    .line 31
    .line 32
    const-wide/32 v7, 0x5265c00

    .line 33
    .line 34
    .line 35
    cmp-long p0, v5, v7

    .line 36
    .line 37
    const/4 v5, 0x1

    .line 38
    if-gez p0, :cond_0

    .line 39
    .line 40
    return v5

    .line 41
    :cond_0
    double-to-long v3, v3

    .line 42
    sub-long v3, v0, v3

    .line 43
    .line 44
    cmp-long p0, v3, v7

    .line 45
    .line 46
    if-lez p0, :cond_3

    .line 47
    .line 48
    iget-wide v3, v2, Lcom/p1/mobile/putong/data/User;->createdTime:D

    .line 49
    .line 50
    double-to-long v3, v3

    .line 51
    sub-long/2addr v0, v3

    .line 52
    cmp-long p0, v0, v7

    .line 53
    .line 54
    if-gez p0, :cond_3

    .line 55
    .line 56
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 57
    .line 58
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 59
    .line 60
    iget-object p0, p0, Ll/dkb;->p3:Ll/xyd0;

    .line 61
    .line 62
    invoke-virtual {p0}, Ll/dyd0;->get()Ljava/lang/Object;

    .line 63
    .line 64
    .line 65
    move-result-object p0

    .line 66
    check-cast p0, Ljava/util/HashSet;

    .line 67
    .line 68
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 69
    .line 70
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 71
    .line 72
    iget-object v0, v0, Ll/dkb;->r3:Ll/vxd0;

    .line 73
    .line 74
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 75
    .line 76
    .line 77
    move-result-object v0

    .line 78
    check-cast v0, Ljava/lang/Integer;

    .line 79
    .line 80
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 81
    .line 82
    .line 83
    move-result v0

    .line 84
    const/4 v1, 0x2

    .line 85
    if-ge v0, v1, :cond_2

    .line 86
    .line 87
    invoke-virtual {p0}, Ljava/util/HashSet;->size()I

    .line 88
    .line 89
    .line 90
    move-result v0

    .line 91
    if-ge v0, v1, :cond_2

    .line 92
    .line 93
    invoke-virtual {p0, p1}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    .line 94
    .line 95
    .line 96
    move-result v0

    .line 97
    if-nez v0, :cond_2

    .line 98
    .line 99
    :try_start_0
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 100
    .line 101
    .line 102
    move-result v0

    .line 103
    if-nez v0, :cond_1

    .line 104
    .line 105
    new-instance v0, Lorg/json/JSONObject;

    .line 106
    .line 107
    invoke-direct {v0, p2}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 108
    .line 109
    .line 110
    goto :goto_0

    .line 111
    :cond_1
    new-instance v0, Lorg/json/JSONObject;

    .line 112
    .line 113
    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 114
    .line 115
    .line 116
    :goto_0
    iget-wide v1, v2, Lcom/p1/mobile/putong/data/User;->createdTime:D

    .line 117
    .line 118
    double-to-long v1, v1

    .line 119
    add-long/2addr v1, v7

    .line 120
    invoke-virtual {v0, p1, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    .line 121
    .line 122
    .line 123
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 124
    .line 125
    iget-object p2, p2, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 126
    .line 127
    iget-object p2, p2, Ll/dkb;->u3:Ll/wyd0;

    .line 128
    .line 129
    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 130
    .line 131
    .line 132
    move-result-object v0

    .line 133
    invoke-virtual {p2, v0}, Ll/wyd0;->put(Ljava/lang/Object;)Z

    .line 134
    .line 135
    .line 136
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 137
    .line 138
    iget-object p2, p2, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 139
    .line 140
    iget-object p2, p2, Ll/dkb;->r3:Ll/vxd0;

    .line 141
    .line 142
    invoke-virtual {p2}, Ll/azd0;->get()Ljava/lang/Object;

    .line 143
    .line 144
    .line 145
    move-result-object v0

    .line 146
    check-cast v0, Ljava/lang/Integer;

    .line 147
    .line 148
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 149
    .line 150
    .line 151
    move-result v0

    .line 152
    add-int/2addr v0, v5

    .line 153
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 154
    .line 155
    .line 156
    move-result-object v0

    .line 157
    invoke-virtual {p2, v0}, Ll/vxd0;->put(Ljava/lang/Object;)Z

    .line 158
    .line 159
    .line 160
    invoke-virtual {p0, p1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 161
    .line 162
    .line 163
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 164
    .line 165
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 166
    .line 167
    iget-object p1, p1, Ll/dkb;->p3:Ll/xyd0;

    .line 168
    .line 169
    invoke-virtual {p1, p0}, Ll/dyd0;->put(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 170
    .line 171
    .line 172
    :catch_0
    :cond_2
    return v5

    .line 173
    :cond_3
    const/4 p0, 0x0

    .line 174
    return p0
.end method

.method public c0(Ll/sj6;)Z
    .locals 0

    .line 1
    iget-boolean p0, p1, Ll/sj6;->u:Z

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    iget-object p0, p1, Ll/sj6;->r:Ljava/lang/String;

    .line 6
    .line 7
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    invoke-interface {p1}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    invoke-static {p0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    if-eqz p0, :cond_0

    .line 20
    .line 21
    const/4 p0, 0x1

    .line 22
    return p0

    .line 23
    :cond_0
    const/4 p0, 0x0

    .line 24
    return p0
.end method

.method public f(Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/data/Conversation;)Z
    .locals 1

    .line 1
    invoke-interface {p0, p3}, Ll/ue6;->T0(Lcom/p1/mobile/putong/core/data/Conversation;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/data/Message;->status()Lcom/p1/mobile/putong/data/LocalStatus;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    const-string v0, "failed"

    .line 16
    .line 17
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 18
    .line 19
    .line 20
    move-result p1

    .line 21
    if-eqz p1, :cond_0

    .line 22
    .line 23
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    move-result p1

    .line 27
    if-eqz p1, :cond_0

    .line 28
    .line 29
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/User;->unilateralBlock()Z

    .line 30
    .line 31
    .line 32
    move-result p1

    .line 33
    if-eqz p1, :cond_1

    .line 34
    .line 35
    :cond_0
    invoke-static {p3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 36
    .line 37
    .line 38
    move-result p1

    .line 39
    if-eqz p1, :cond_1

    .line 40
    .line 41
    iget p1, p3, Lcom/p1/mobile/putong/core/data/Conversation;->unreadMessages:I

    .line 42
    .line 43
    if-gtz p1, :cond_2

    .line 44
    .line 45
    :cond_1
    if-eqz p0, :cond_3

    .line 46
    .line 47
    :cond_2
    const/4 p0, 0x1

    .line 48
    return p0

    .line 49
    :cond_3
    const/4 p0, 0x0

    .line 50
    return p0
.end method

.method public g(Ll/pol;)Ljava/lang/String;
    .locals 0

    .line 1
    instance-of p0, p1, Ll/u46;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    check-cast p1, Ll/u46;

    .line 7
    .line 8
    invoke-interface {p1}, Ll/u46;->o()I

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    if-eqz p0, :cond_7

    .line 13
    .line 14
    const/4 p1, 0x1

    .line 15
    if-eq p0, p1, :cond_6

    .line 16
    .line 17
    const/4 p1, 0x2

    .line 18
    if-eq p0, p1, :cond_5

    .line 19
    .line 20
    const/4 p1, 0x4

    .line 21
    if-eq p0, p1, :cond_4

    .line 22
    .line 23
    const/4 p1, 0x6

    .line 24
    if-eq p0, p1, :cond_3

    .line 25
    .line 26
    const/4 p1, 0x7

    .line 27
    if-eq p0, p1, :cond_2

    .line 28
    .line 29
    const/16 p1, 0x8

    .line 30
    .line 31
    if-eq p0, p1, :cond_1

    .line 32
    .line 33
    :goto_0
    const-string p0, ""

    .line 34
    .line 35
    return-object p0

    .line 36
    :cond_1
    const-string p0, "hide"

    .line 37
    .line 38
    return-object p0

    .line 39
    :cond_2
    const-string p0, "deleted"

    .line 40
    .line 41
    return-object p0

    .line 42
    :cond_3
    const-string p0, "group"

    .line 43
    .line 44
    return-object p0

    .line 45
    :cond_4
    const-string p0, "lifted"

    .line 46
    .line 47
    return-object p0

    .line 48
    :cond_5
    const-string p0, "online"

    .line 49
    .line 50
    return-object p0

    .line 51
    :cond_6
    const-string p0, "unread"

    .line 52
    .line 53
    return-object p0

    .line 54
    :cond_7
    const-string p0, "all"

    .line 55
    .line 56
    return-object p0
.end method

.method public synthetic g0(Ljava/lang/String;Lcom/p1/mobile/putong/core/api/c0$c;Ll/pf60;)V
    .locals 17

    .line 1
    move-object/from16 v0, p3

    .line 2
    .line 3
    iget-object v1, v0, Ll/pf60;->a:Ljava/lang/Object;

    .line 4
    .line 5
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    if-eqz v1, :cond_0

    .line 10
    .line 11
    invoke-static {}, Ll/pzi0;->o()J

    .line 12
    .line 13
    .line 14
    move-result-wide v1

    .line 15
    long-to-double v1, v1

    .line 16
    iget-object v3, v0, Ll/pf60;->a:Ljava/lang/Object;

    .line 17
    .line 18
    check-cast v3, Lcom/p1/mobile/putong/core/data/ChatHeat;

    .line 19
    .line 20
    iget-wide v3, v3, Lcom/p1/mobile/putong/core/data/ChatHeat;->exclusiveChatStartTime:D

    .line 21
    .line 22
    cmpl-double v1, v1, v3

    .line 23
    .line 24
    if-ltz v1, :cond_0

    .line 25
    .line 26
    invoke-static {}, Ll/pzi0;->o()J

    .line 27
    .line 28
    .line 29
    move-result-wide v1

    .line 30
    long-to-double v1, v1

    .line 31
    iget-object v3, v0, Ll/pf60;->a:Ljava/lang/Object;

    .line 32
    .line 33
    move-object v4, v3

    .line 34
    check-cast v4, Lcom/p1/mobile/putong/core/data/ChatHeat;

    .line 35
    .line 36
    iget-wide v4, v4, Lcom/p1/mobile/putong/core/data/ChatHeat;->exclusiveChatEndTime:D

    .line 37
    .line 38
    cmpg-double v1, v1, v4

    .line 39
    .line 40
    if-gtz v1, :cond_0

    .line 41
    .line 42
    move-object v0, v3

    .line 43
    check-cast v0, Lcom/p1/mobile/putong/core/data/ChatHeat;

    .line 44
    .line 45
    iget-wide v0, v0, Lcom/p1/mobile/putong/core/data/ChatHeat;->exclusiveChatStartTime:D

    .line 46
    .line 47
    double-to-long v6, v0

    .line 48
    check-cast v3, Lcom/p1/mobile/putong/core/data/ChatHeat;

    .line 49
    .line 50
    iget-wide v0, v3, Lcom/p1/mobile/putong/core/data/ChatHeat;->exclusiveChatEndTime:D

    .line 51
    .line 52
    double-to-long v8, v0

    .line 53
    move-object/from16 v4, p0

    .line 54
    .line 55
    move-object/from16 v5, p1

    .line 56
    .line 57
    move-object/from16 v10, p2

    .line 58
    .line 59
    invoke-interface/range {v4 .. v10}, Ll/ue6;->J0(Ljava/lang/String;JJLcom/p1/mobile/putong/core/api/c0$c;)V

    .line 60
    .line 61
    .line 62
    return-void

    .line 63
    :cond_0
    iget-object v1, v0, Ll/pf60;->a:Ljava/lang/Object;

    .line 64
    .line 65
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 66
    .line 67
    .line 68
    move-result v1

    .line 69
    if-eqz v1, :cond_1

    .line 70
    .line 71
    invoke-static {}, Ll/pzi0;->o()J

    .line 72
    .line 73
    .line 74
    move-result-wide v1

    .line 75
    long-to-double v1, v1

    .line 76
    iget-object v3, v0, Ll/pf60;->a:Ljava/lang/Object;

    .line 77
    .line 78
    check-cast v3, Lcom/p1/mobile/putong/core/data/ChatHeat;

    .line 79
    .line 80
    iget-wide v3, v3, Lcom/p1/mobile/putong/core/data/ChatHeat;->exclusiveChatInviteTime:D

    .line 81
    .line 82
    cmpl-double v1, v1, v3

    .line 83
    .line 84
    if-ltz v1, :cond_1

    .line 85
    .line 86
    invoke-static {}, Ll/pzi0;->o()J

    .line 87
    .line 88
    .line 89
    move-result-wide v1

    .line 90
    long-to-double v1, v1

    .line 91
    iget-object v0, v0, Ll/pf60;->a:Ljava/lang/Object;

    .line 92
    .line 93
    move-object v3, v0

    .line 94
    check-cast v3, Lcom/p1/mobile/putong/core/data/ChatHeat;

    .line 95
    .line 96
    iget-wide v3, v3, Lcom/p1/mobile/putong/core/data/ChatHeat;->exclusiveChatInviteExpireTime:D

    .line 97
    .line 98
    cmpg-double v1, v1, v3

    .line 99
    .line 100
    if-gtz v1, :cond_1

    .line 101
    .line 102
    move-object v1, v0

    .line 103
    check-cast v1, Lcom/p1/mobile/putong/core/data/ChatHeat;

    .line 104
    .line 105
    iget-wide v1, v1, Lcom/p1/mobile/putong/core/data/ChatHeat;->exclusiveChatStartTime:D

    .line 106
    .line 107
    double-to-long v1, v1

    .line 108
    const-wide/16 v3, 0x0

    .line 109
    .line 110
    cmp-long v1, v1, v3

    .line 111
    .line 112
    if-gtz v1, :cond_1

    .line 113
    .line 114
    move-object v1, v0

    .line 115
    check-cast v1, Lcom/p1/mobile/putong/core/data/ChatHeat;

    .line 116
    .line 117
    iget-wide v1, v1, Lcom/p1/mobile/putong/core/data/ChatHeat;->exclusiveChatInviteTime:D

    .line 118
    .line 119
    double-to-long v12, v1

    .line 120
    check-cast v0, Lcom/p1/mobile/putong/core/data/ChatHeat;

    .line 121
    .line 122
    iget-wide v0, v0, Lcom/p1/mobile/putong/core/data/ChatHeat;->exclusiveChatInviteExpireTime:D

    .line 123
    .line 124
    double-to-long v14, v0

    .line 125
    move-object/from16 v10, p0

    .line 126
    .line 127
    move-object/from16 v11, p1

    .line 128
    .line 129
    move-object/from16 v16, p2

    .line 130
    .line 131
    invoke-interface/range {v10 .. v16}, Ll/ue6;->J0(Ljava/lang/String;JJLcom/p1/mobile/putong/core/api/c0$c;)V

    .line 132
    .line 133
    .line 134
    :cond_1
    return-void
.end method

.method public getUserLiveLabelHashMap()Ljava/util/HashMap;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Lcom/p1/mobile/putong/data/UserLiveLabel;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/g;->B2:Lrx/subjects/a;

    .line 6
    .line 7
    invoke-virtual {p0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    check-cast p0, Ljava/util/HashMap;

    .line 12
    .line 13
    if-nez p0, :cond_0

    .line 14
    .line 15
    new-instance p0, Ljava/util/HashMap;

    .line 16
    .line 17
    invoke-direct {p0}, Ljava/util/HashMap;-><init>()V

    .line 18
    .line 19
    .line 20
    :cond_0
    return-object p0
.end method

.method public h()V
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/g;->He()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public i0(Lcom/p1/mobile/putong/core/data/Conversation;)Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public j(Lcom/p1/mobile/putong/core/data/Conversation;)Z
    .locals 0

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/data/Conversation;->isLimitMatch()Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    const/4 p0, 0x1

    .line 14
    return p0

    .line 15
    :cond_0
    const/4 p0, 0x0

    .line 16
    return p0
.end method

.method public k(Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    goto :goto_0

    .line 4
    :cond_0
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isBannedNew()Z

    .line 5
    .line 6
    .line 7
    move-result p0

    .line 8
    if-eqz p0, :cond_1

    .line 9
    .line 10
    const-string p0, "\u5bf9\u65b9\u8d26\u53f7\u5f02\u5e38"

    .line 11
    .line 12
    invoke-static {p0}, Ll/r1j0;->g(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    return-void

    .line 16
    :cond_1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isDelIn()Z

    .line 17
    .line 18
    .line 19
    move-result p0

    .line 20
    if-eqz p0, :cond_2

    .line 21
    .line 22
    const-string p0, "\u6211\u6682\u65f6\u79bb\u5f00\u51e0\u5929~"

    .line 23
    .line 24
    invoke-static {p0}, Ll/r1j0;->g(Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    return-void

    .line 28
    :cond_2
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isDelOut()Z

    .line 29
    .line 30
    .line 31
    move-result p0

    .line 32
    if-eqz p0, :cond_3

    .line 33
    .line 34
    const-string p0, "\u5bf9\u65b9\u5df2\u6ce8\u9500"

    .line 35
    .line 36
    invoke-static {p0}, Ll/r1j0;->g(Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    :cond_3
    :goto_0
    return-void
.end method

.method public l(Lcom/p1/mobile/putong/core/data/Conversation;)Z
    .locals 1

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Conversation;->property:Lcom/p1/mobile/putong/core/data/ConversationProperty;

    .line 8
    .line 9
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Conversation;->property:Lcom/p1/mobile/putong/core/data/ConversationProperty;

    .line 16
    .line 17
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/ConversationProperty;->conversationTag:Lcom/p1/mobile/putong/core/data/ConversationTag;

    .line 18
    .line 19
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    if-eqz p0, :cond_0

    .line 24
    .line 25
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Conversation;->property:Lcom/p1/mobile/putong/core/data/ConversationProperty;

    .line 26
    .line 27
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/ConversationProperty;->conversationTag:Lcom/p1/mobile/putong/core/data/ConversationTag;

    .line 28
    .line 29
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/data/ConversationTag;->showInList:Z

    .line 30
    .line 31
    if-eqz p0, :cond_0

    .line 32
    .line 33
    iget p0, p1, Lcom/p1/mobile/putong/core/data/Conversation;->userMessageCount:I

    .line 34
    .line 35
    const/4 v0, 0x1

    .line 36
    if-ne p0, v0, :cond_0

    .line 37
    .line 38
    iget p0, p1, Lcom/p1/mobile/putong/core/data/Conversation;->mm:I

    .line 39
    .line 40
    if-nez p0, :cond_0

    .line 41
    .line 42
    return v0

    .line 43
    :cond_0
    const/4 p0, 0x0

    .line 44
    return p0
.end method

.method public n(Lcom/p1/mobile/putong/core/data/Conversation;)Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public n0(Ll/sj6;)Z
    .locals 6

    .line 1
    iget-object v0, p1, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 2
    .line 3
    invoke-interface {p0, v0}, Ll/ue6;->i0(Lcom/p1/mobile/putong/core/data/Conversation;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x0

    .line 8
    if-eqz v0, :cond_1

    .line 9
    .line 10
    :try_start_0
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 11
    .line 12
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 13
    .line 14
    iget-object v0, v0, Ll/dkb;->u3:Ll/wyd0;

    .line 15
    .line 16
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    check-cast v0, Ljava/lang/String;

    .line 21
    .line 22
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 23
    .line 24
    .line 25
    move-result v2

    .line 26
    if-nez v2, :cond_0

    .line 27
    .line 28
    new-instance v2, Lorg/json/JSONObject;

    .line 29
    .line 30
    invoke-direct {v2, v0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_0
    new-instance v2, Lorg/json/JSONObject;

    .line 35
    .line 36
    invoke-direct {v2}, Lorg/json/JSONObject;-><init>()V

    .line 37
    .line 38
    .line 39
    :goto_0
    iget-object v3, p1, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 40
    .line 41
    iget-object v3, v3, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 42
    .line 43
    const-wide/16 v4, 0x0

    .line 44
    .line 45
    invoke-virtual {v2, v3, v4, v5}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;J)J

    .line 46
    .line 47
    .line 48
    move-result-wide v2

    .line 49
    iget-object p1, p1, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 50
    .line 51
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 52
    .line 53
    invoke-interface {p0, p1, v0}, Ll/ue6;->b0(Ljava/lang/String;Ljava/lang/String;)Z

    .line 54
    .line 55
    .line 56
    move-result p0

    .line 57
    if-eqz p0, :cond_1

    .line 58
    .line 59
    cmp-long p0, v2, v4

    .line 60
    .line 61
    if-eqz p0, :cond_1

    .line 62
    .line 63
    invoke-static {}, Ll/pzi0;->o()J

    .line 64
    .line 65
    .line 66
    move-result-wide p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 67
    cmp-long p0, p0, v2

    .line 68
    .line 69
    if-gez p0, :cond_1

    .line 70
    .line 71
    const/4 p0, 0x1

    .line 72
    return p0

    .line 73
    :catch_0
    :cond_1
    return v1
.end method

.method public o0(Ll/sj6;Lcom/p1/mobile/putong/core/data/Message;)Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public p(Ll/sj6;)Lcom/p1/mobile/putong/core/data/Message;
    .locals 0

    .line 1
    invoke-virtual {p1}, Ll/sj6;->a()Lcom/p1/mobile/putong/core/data/Message;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public p0(Lcom/p1/mobile/putong/core/data/Conversation;)Z
    .locals 1

    .line 1
    invoke-interface {p0, p1}, Ll/ue6;->S(Lcom/p1/mobile/putong/core/data/Conversation;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    invoke-interface {p0, p1}, Ll/ue6;->l(Lcom/p1/mobile/putong/core/data/Conversation;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-eqz p0, :cond_1

    .line 12
    .line 13
    :cond_0
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Conversation;->status:Lcom/p1/mobile/putong/data/ConversationStatus;

    .line 14
    .line 15
    const-string v0, "default"

    .line 16
    .line 17
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    if-nez p0, :cond_2

    .line 22
    .line 23
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Conversation;->status:Lcom/p1/mobile/putong/data/ConversationStatus;

    .line 24
    .line 25
    const-string p1, "blocked"

    .line 26
    .line 27
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 28
    .line 29
    .line 30
    move-result p0

    .line 31
    if-eqz p0, :cond_1

    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_1
    const/4 p0, 0x0

    .line 35
    return p0

    .line 36
    :cond_2
    :goto_0
    const/4 p0, 0x1

    .line 37
    return p0
.end method

.method public q(Ll/sj6;)Z
    .locals 4

    .line 1
    invoke-static {}, Ll/gra;->G1()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p1, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 8
    .line 9
    iget-object v0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 10
    .line 11
    invoke-static {v0}, Lcom/p1/mobile/putong/data/User;->isTeamAccount(Ljava/lang/String;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-nez v0, :cond_0

    .line 16
    .line 17
    iget-object v0, p1, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 18
    .line 19
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/Conversation;->convType:Ljava/lang/String;

    .line 20
    .line 21
    const-string v1, "default"

    .line 22
    .line 23
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-eqz v0, :cond_0

    .line 28
    .line 29
    iget-object v0, p1, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 30
    .line 31
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/Conversation;->status:Lcom/p1/mobile/putong/data/ConversationStatus;

    .line 32
    .line 33
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    if-eqz v0, :cond_0

    .line 38
    .line 39
    iget-object v0, p1, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 40
    .line 41
    iget v1, v0, Lcom/p1/mobile/putong/core/data/Conversation;->unreadMessages:I

    .line 42
    .line 43
    if-nez v1, :cond_0

    .line 44
    .line 45
    iget v0, v0, Lcom/p1/mobile/putong/core/data/Conversation;->mm:I

    .line 46
    .line 47
    invoke-static {}, Ll/gra;->R()I

    .line 48
    .line 49
    .line 50
    move-result v1

    .line 51
    if-gt v0, v1, :cond_0

    .line 52
    .line 53
    invoke-interface {p0, p1}, Ll/ue6;->p(Ll/sj6;)Lcom/p1/mobile/putong/core/data/Message;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    if-eqz v0, :cond_0

    .line 58
    .line 59
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/data/Message;->isMe()Z

    .line 60
    .line 61
    .line 62
    move-result v1

    .line 63
    if-nez v1, :cond_0

    .line 64
    .line 65
    iget-object v1, p1, Ll/sj6;->b:Lcom/p1/mobile/putong/data/User;

    .line 66
    .line 67
    iget-object p1, p1, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 68
    .line 69
    invoke-interface {p0, v0, v1, p1}, Ll/ue6;->f(Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/data/Conversation;)Z

    .line 70
    .line 71
    .line 72
    move-result p0

    .line 73
    if-nez p0, :cond_0

    .line 74
    .line 75
    invoke-static {}, Ll/pzi0;->o()J

    .line 76
    .line 77
    .line 78
    move-result-wide p0

    .line 79
    long-to-double p0, p0

    .line 80
    iget-wide v0, v0, Lcom/p1/mobile/putong/core/data/Message;->createdTime:D

    .line 81
    .line 82
    sub-double/2addr p0, v0

    .line 83
    invoke-static {}, Ll/gra;->T()I

    .line 84
    .line 85
    .line 86
    move-result v0

    .line 87
    int-to-long v0, v0

    .line 88
    const-wide/32 v2, 0x5265c00

    .line 89
    .line 90
    .line 91
    mul-long/2addr v0, v2

    .line 92
    long-to-double v0, v0

    .line 93
    cmpg-double p0, p0, v0

    .line 94
    .line 95
    if-gez p0, :cond_0

    .line 96
    .line 97
    const/4 p0, 0x1

    .line 98
    return p0

    .line 99
    :cond_0
    const/4 p0, 0x0

    .line 100
    return p0
.end method

.method public r0(Ll/sj6;)Ljava/lang/String;
    .locals 2
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 4
    .line 5
    iget-boolean v1, p1, Ll/sj6;->e:Z

    .line 6
    .line 7
    invoke-interface {p0, v1}, Ll/ue6;->V0(Z)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/core/api/g;->vg(Z)Ljava/util/HashSet;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    iget-object v0, p1, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 16
    .line 17
    iget-object v0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 18
    .line 19
    invoke-virtual {p0, v0}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    if-eqz p0, :cond_0

    .line 24
    .line 25
    iget-object p0, p1, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 26
    .line 27
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Conversation;->convType:Ljava/lang/String;

    .line 28
    .line 29
    const-string v0, "group"

    .line 30
    .line 31
    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    move-result p0

    .line 35
    if-eqz p0, :cond_0

    .line 36
    .line 37
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 38
    .line 39
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->g0:Lcom/p1/mobile/putong/core/api/e;

    .line 40
    .line 41
    iget-object p1, p1, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 42
    .line 43
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/Conversation;->otherUser:Ljava/lang/String;

    .line 44
    .line 45
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/api/e;->s6(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/ChatGroup;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 50
    .line 51
    .line 52
    move-result p1

    .line 53
    if-eqz p1, :cond_0

    .line 54
    .line 55
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->avatars:Ljava/util/List;

    .line 56
    .line 57
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 58
    .line 59
    .line 60
    move-result p1

    .line 61
    if-nez p1, :cond_0

    .line 62
    .line 63
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->avatars:Ljava/util/List;

    .line 64
    .line 65
    const/4 v0, 0x0

    .line 66
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 67
    .line 68
    .line 69
    move-result-object p1

    .line 70
    check-cast p1, Lcom/p1/mobile/putong/data/Picture;

    .line 71
    .line 72
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/Media;->cover()Lcom/p1/mobile/putong/data/Picture;

    .line 73
    .line 74
    .line 75
    move-result-object p1

    .line 76
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 77
    .line 78
    .line 79
    move-result p1

    .line 80
    if-eqz p1, :cond_0

    .line 81
    .line 82
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->avatars:Ljava/util/List;

    .line 83
    .line 84
    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 85
    .line 86
    .line 87
    move-result-object p0

    .line 88
    check-cast p0, Lcom/p1/mobile/putong/data/Picture;

    .line 89
    .line 90
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/Media;->cover()Lcom/p1/mobile/putong/data/Picture;

    .line 91
    .line 92
    .line 93
    move-result-object p0

    .line 94
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 95
    .line 96
    .line 97
    move-result-object p0

    .line 98
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/Picture$ImageUri;->formatted()Ljava/lang/String;

    .line 99
    .line 100
    .line 101
    move-result-object p0

    .line 102
    return-object p0

    .line 103
    :cond_0
    const-string p0, ""

    .line 104
    .line 105
    return-object p0
.end method

.method public s(Lcom/p1/mobile/putong/core/data/Message;)Z
    .locals 0

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/data/Message;->isMe()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-nez p0, :cond_1

    .line 6
    .line 7
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Message;->additionalData:Lcom/p1/mobile/putong/core/data/MessageAdditionalData;

    .line 8
    .line 9
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Message;->additionalData:Lcom/p1/mobile/putong/core/data/MessageAdditionalData;

    .line 16
    .line 17
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->exchangePicture:Lcom/p1/mobile/putong/core/data/ExchangePicture;

    .line 18
    .line 19
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    if-eqz p0, :cond_0

    .line 24
    .line 25
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Message;->additionalData:Lcom/p1/mobile/putong/core/data/MessageAdditionalData;

    .line 26
    .line 27
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->exchangePicture:Lcom/p1/mobile/putong/core/data/ExchangePicture;

    .line 28
    .line 29
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/ExchangePicture;->status:Ljava/lang/String;

    .line 30
    .line 31
    sget-object p1, Lcom/p1/mobile/putong/core/data/ExchangePicture;->finished:Ljava/lang/String;

    .line 32
    .line 33
    invoke-static {p0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 34
    .line 35
    .line 36
    move-result p0

    .line 37
    if-eqz p0, :cond_0

    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_0
    const/4 p0, 0x0

    .line 41
    return p0

    .line 42
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 43
    return p0
.end method

.method public u0(Ll/sj6;Lcom/p1/mobile/putong/core/data/Message;)Z
    .locals 1

    .line 1
    iget-object v0, p1, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 2
    .line 3
    invoke-interface {p0, v0}, Ll/ue6;->T(Lcom/p1/mobile/putong/core/data/Conversation;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    iget-object p0, p1, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/Conversation;->hasRemoveLabel()Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    if-nez p0, :cond_0

    .line 16
    .line 17
    invoke-static {}, Ll/xbj;->d()Ll/z6m;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-interface {p0, p1, p2}, Ll/z6m;->a(Ll/sj6;Lcom/p1/mobile/putong/core/data/Message;)Z

    .line 22
    .line 23
    .line 24
    move-result p0

    .line 25
    if-nez p0, :cond_0

    .line 26
    .line 27
    const/4 p0, 0x1

    .line 28
    return p0

    .line 29
    :cond_0
    const/4 p0, 0x0

    .line 30
    return p0
.end method

.method public w(Ll/sj6;)V
    .locals 1

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/g;->B2:Lrx/subjects/a;

    .line 6
    .line 7
    invoke-virtual {p0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    check-cast p0, Ljava/util/HashMap;

    .line 12
    .line 13
    if-nez p0, :cond_0

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    iget-object p1, p1, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 17
    .line 18
    if-nez p1, :cond_1

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_1
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/Conversation;->otherUser:Ljava/lang/String;

    .line 22
    .line 23
    invoke-virtual {p0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    check-cast p0, Lcom/p1/mobile/putong/data/UserLiveLabel;

    .line 28
    .line 29
    if-eqz p0, :cond_3

    .line 30
    .line 31
    iget-boolean p0, p0, Lcom/p1/mobile/putong/data/UserLiveLabel;->ongoingCall:Z

    .line 32
    .line 33
    if-nez p0, :cond_2

    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_2
    const/4 p0, 0x0

    .line 37
    new-array p0, p0, [Ll/sfj0$a;

    .line 38
    .line 39
    const-string p1, "e_live_call_label"

    .line 40
    .line 41
    const-string v0, "p_messages_view"

    .line 42
    .line 43
    invoke-static {p1, v0, p0}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 44
    .line 45
    .line 46
    :cond_3
    :goto_0
    return-void
.end method

.method public x(Ll/sj6;)Z
    .locals 0

    .line 1
    iget-object p0, p1, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Conversation;->property:Lcom/p1/mobile/putong/core/data/ConversationProperty;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/ConversationProperty;->intl_chat_source:Lcom/p1/mobile/putong/core/data/IntlChatSource;

    .line 6
    .line 7
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    iget-object p0, p1, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 14
    .line 15
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Conversation;->property:Lcom/p1/mobile/putong/core/data/ConversationProperty;

    .line 16
    .line 17
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/ConversationProperty;->intl_chat_source:Lcom/p1/mobile/putong/core/data/IntlChatSource;

    .line 18
    .line 19
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/IntlChatSource;->source:Ljava/lang/String;

    .line 20
    .line 21
    const-string p1, "spotLight"

    .line 22
    .line 23
    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    move-result p0

    .line 27
    if-eqz p0, :cond_0

    .line 28
    .line 29
    const/4 p0, 0x1

    .line 30
    return p0

    .line 31
    :cond_0
    const/4 p0, 0x0

    .line 32
    return p0
.end method

.method public x0(Ll/sj6;)V
    .locals 4

    .line 1
    iget-object v0, p1, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const-string v1, "p_messages_view"

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p1, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 12
    .line 13
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/data/Conversation;->isHeartbeatConv()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    iget-object v0, p1, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 20
    .line 21
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/data/Conversation;->isFakeHeartbeatConv()Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    const-string v2, "is_fake"

    .line 26
    .line 27
    invoke-static {v2, v0}, Ll/sfj0$a;->i(Ljava/lang/String;Z)Ll/sfj0$a;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    iget-object v2, p1, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 32
    .line 33
    iget-object v2, v2, Lcom/p1/mobile/putong/core/data/Conversation;->otherUser:Ljava/lang/String;

    .line 34
    .line 35
    const-string v3, "moments_user_id"

    .line 36
    .line 37
    invoke-static {v3, v2}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 38
    .line 39
    .line 40
    move-result-object v2

    .line 41
    filled-new-array {v0, v2}, [Ll/sfj0$a;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    const-string v2, "e_heart_signal_conversation"

    .line 46
    .line 47
    invoke-static {v2, v1, v0}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 48
    .line 49
    .line 50
    :cond_0
    iget-object v0, p1, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 51
    .line 52
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 53
    .line 54
    .line 55
    move-result v0

    .line 56
    if-eqz v0, :cond_1

    .line 57
    .line 58
    invoke-static {}, Ll/eu4;->b()Ll/eu4;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    iget-object v2, p1, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 63
    .line 64
    invoke-virtual {v0, v2}, Ll/eu4;->f(Lcom/p1/mobile/putong/core/data/Conversation;)Z

    .line 65
    .line 66
    .line 67
    move-result v0

    .line 68
    if-eqz v0, :cond_1

    .line 69
    .line 70
    const/4 v0, 0x0

    .line 71
    new-array v0, v0, [Ll/sfj0$a;

    .line 72
    .line 73
    const-string v2, "e_answer_question_tip"

    .line 74
    .line 75
    invoke-static {v2, v1, v0}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 76
    .line 77
    .line 78
    :cond_1
    invoke-static {}, Ll/gra;->P2()Z

    .line 79
    .line 80
    .line 81
    move-result v0

    .line 82
    if-eqz v0, :cond_2

    .line 83
    .line 84
    invoke-static {}, Ll/i46;->c()Ll/i46;

    .line 85
    .line 86
    .line 87
    move-result-object v0

    .line 88
    invoke-virtual {v0}, Ll/i46;->a()V

    .line 89
    .line 90
    .line 91
    invoke-static {}, Ll/i46;->c()Ll/i46;

    .line 92
    .line 93
    .line 94
    move-result-object v0

    .line 95
    iget-object v0, v0, Ll/i46;->a:Lrx/subjects/a;

    .line 96
    .line 97
    const/4 v1, 0x0

    .line 98
    invoke-virtual {v0, v1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 99
    .line 100
    .line 101
    new-instance v0, Ll/ie6;

    .line 102
    .line 103
    invoke-direct {v0, p0, p1}, Ll/ie6;-><init>(Ll/ue6;Ll/sj6;)V

    .line 104
    .line 105
    .line 106
    invoke-static {v0}, Ll/l51;->y(Ljava/lang/Runnable;)V

    .line 107
    .line 108
    .line 109
    :cond_2
    return-void
.end method

.method public y(ZLjava/lang/String;)Lcom/p1/mobile/putong/data/UserLiveLabel;
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/api/g;->zg(Z)Ljava/util/LinkedHashMap;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    if-eqz p0, :cond_1

    .line 10
    .line 11
    invoke-virtual {p0}, Ljava/util/AbstractMap;->isEmpty()Z

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    if-eqz p1, :cond_0

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    invoke-virtual {p0, p2}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    check-cast p0, Lcom/p1/mobile/putong/data/UserLiveLabel;

    .line 23
    .line 24
    return-object p0

    .line 25
    :cond_1
    :goto_0
    const/4 p0, 0x0

    .line 26
    return-object p0
.end method

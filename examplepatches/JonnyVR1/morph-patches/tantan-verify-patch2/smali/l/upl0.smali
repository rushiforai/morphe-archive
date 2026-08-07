.class public Ll/upl0;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static a:J


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    const-wide/32 v0, 0x19bfcc00

    .line 2
    .line 3
    .line 4
    sput-wide v0, Ll/upl0;->a:J

    .line 5
    .line 6
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

.method public static a(J)J
    .locals 2

    .line 1
    const-wide/32 v0, 0x5265c00

    .line 2
    .line 3
    .line 4
    div-long/2addr p0, v0

    .line 5
    const-wide/16 v0, 0x1

    .line 6
    .line 7
    add-long/2addr p0, v0

    .line 8
    return-wide p0
.end method

.method public static b(Lcom/p1/mobile/android/app/Act;)Ljava/lang/String;
    .locals 14

    .line 1
    sget v0, Lcom/p1/mobile/putong/core/R$string;->Pn:I

    .line 2
    .line 3
    sget v1, Lcom/p1/mobile/putong/core/R$string;->Rn:I

    .line 4
    .line 5
    sget v2, Lcom/p1/mobile/putong/core/R$string;->Sn:I

    .line 6
    .line 7
    sget v3, Lcom/p1/mobile/putong/core/R$string;->Qn:I

    .line 8
    .line 9
    sget v4, Lcom/p1/mobile/putong/core/R$string;->Nn:I

    .line 10
    .line 11
    sget v5, Lcom/p1/mobile/putong/core/R$string;->On:I

    .line 12
    .line 13
    invoke-static {}, Ll/d79;->j0()Z

    .line 14
    .line 15
    .line 16
    move-result v6

    .line 17
    if-eqz v6, :cond_0

    .line 18
    .line 19
    sget v0, Lcom/p1/mobile/putong/core/R$string;->cc:I

    .line 20
    .line 21
    sget v1, Lcom/p1/mobile/putong/core/R$string;->ec:I

    .line 22
    .line 23
    sget v3, Lcom/p1/mobile/putong/core/R$string;->dc:I

    .line 24
    .line 25
    sget v4, Lcom/p1/mobile/putong/core/R$string;->fc:I

    .line 26
    .line 27
    move v2, v1

    .line 28
    move v5, v4

    .line 29
    :cond_0
    sget-object v6, Ll/uqb0;->H:Lcom/p1/mobile/putong/api/api/Network;

    .line 30
    .line 31
    invoke-virtual {v6}, Lcom/p1/mobile/putong/api/api/Network;->guessedCurrentServerTime()J

    .line 32
    .line 33
    .line 34
    move-result-wide v6

    .line 35
    invoke-static {}, Ll/rbb0;->g()J

    .line 36
    .line 37
    .line 38
    move-result-wide v8

    .line 39
    const-wide/16 v10, 0x0

    .line 40
    .line 41
    cmp-long v12, v8, v10

    .line 42
    .line 43
    if-nez v12, :cond_1

    .line 44
    .line 45
    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    return-object p0

    .line 50
    :cond_1
    sub-long v12, v8, v6

    .line 51
    .line 52
    cmp-long v0, v12, v10

    .line 53
    .line 54
    const-wide/16 v10, 0x1

    .line 55
    .line 56
    if-ltz v0, :cond_4

    .line 57
    .line 58
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->K()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    invoke-interface {v0}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->me_()Lcom/p1/mobile/putong/data/User;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isSVIP()Z

    .line 67
    .line 68
    .line 69
    move-result v0

    .line 70
    if-nez v0, :cond_3

    .line 71
    .line 72
    sget-wide v4, Ll/upl0;->a:J

    .line 73
    .line 74
    cmp-long v0, v4, v12

    .line 75
    .line 76
    if-lez v0, :cond_3

    .line 77
    .line 78
    invoke-static {v12, v13}, Ll/upl0;->a(J)J

    .line 79
    .line 80
    .line 81
    move-result-wide v3

    .line 82
    cmp-long v0, v3, v10

    .line 83
    .line 84
    if-lez v0, :cond_2

    .line 85
    .line 86
    move v1, v2

    .line 87
    :cond_2
    new-instance v0, Ljava/lang/StringBuilder;

    .line 88
    .line 89
    const-string v2, ""

    .line 90
    .line 91
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 92
    .line 93
    .line 94
    invoke-virtual {v0, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 95
    .line 96
    .line 97
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 98
    .line 99
    .line 100
    move-result-object v0

    .line 101
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 102
    .line 103
    .line 104
    move-result-object v0

    .line 105
    invoke-virtual {p0, v1, v0}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 106
    .line 107
    .line 108
    move-result-object p0

    .line 109
    return-object p0

    .line 110
    :cond_3
    sget-object v0, Ll/pzi0;->d:Ljava/text/SimpleDateFormat;

    .line 111
    .line 112
    new-instance v1, Ljava/util/Date;

    .line 113
    .line 114
    invoke-direct {v1, v8, v9}, Ljava/util/Date;-><init>(J)V

    .line 115
    .line 116
    .line 117
    invoke-virtual {v0, v1}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    .line 118
    .line 119
    .line 120
    move-result-object v0

    .line 121
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 122
    .line 123
    .line 124
    move-result-object v0

    .line 125
    invoke-virtual {p0, v3, v0}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 126
    .line 127
    .line 128
    move-result-object p0

    .line 129
    return-object p0

    .line 130
    :cond_4
    sub-long/2addr v6, v8

    .line 131
    invoke-static {v6, v7}, Ll/upl0;->a(J)J

    .line 132
    .line 133
    .line 134
    move-result-wide v0

    .line 135
    cmp-long v2, v0, v10

    .line 136
    .line 137
    if-lez v2, :cond_5

    .line 138
    .line 139
    move v4, v5

    .line 140
    :cond_5
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 141
    .line 142
    .line 143
    move-result-object v0

    .line 144
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 145
    .line 146
    .line 147
    move-result-object v0

    .line 148
    invoke-virtual {p0, v4, v0}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 149
    .line 150
    .line 151
    move-result-object p0

    .line 152
    return-object p0
.end method

.method public static c(Lcom/p1/mobile/android/app/Act;)Ljava/lang/String;
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
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->getVipToExpireTimeInMill()J

    .line 10
    .line 11
    .line 12
    move-result-wide v1

    .line 13
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isVIP()Z

    .line 14
    .line 15
    .line 16
    move-result v3

    .line 17
    if-eqz v3, :cond_0

    .line 18
    .line 19
    sget-object p0, Ll/pzi0;->d:Ljava/text/SimpleDateFormat;

    .line 20
    .line 21
    new-instance v1, Ljava/util/Date;

    .line 22
    .line 23
    const-string v2, "vip"

    .line 24
    .line 25
    invoke-static {v2}, Lcom/p1/mobile/putong/data/MembershipType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/MembershipType;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    invoke-virtual {v0, v2}, Lcom/p1/mobile/putong/data/User;->getMembershipExpireTime(Lcom/p1/mobile/putong/data/MembershipType;)J

    .line 30
    .line 31
    .line 32
    move-result-wide v2

    .line 33
    invoke-direct {v1, v2, v3}, Ljava/util/Date;-><init>(J)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {p0, v1}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 41
    .line 42
    sget v1, Lcom/p1/mobile/putong/core/R$string;->gt:I

    .line 43
    .line 44
    filled-new-array {p0}, [Ljava/lang/Object;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    invoke-virtual {v0, v1, p0}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    return-object p0

    .line 53
    :cond_0
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isVIPUsed()Z

    .line 54
    .line 55
    .line 56
    move-result v0

    .line 57
    if-nez v0, :cond_1

    .line 58
    .line 59
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 60
    .line 61
    sget v0, Lcom/p1/mobile/putong/core/R$string;->kt:I

    .line 62
    .line 63
    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 64
    .line 65
    .line 66
    move-result-object p0

    .line 67
    return-object p0

    .line 68
    :cond_1
    neg-long v0, v1

    .line 69
    invoke-static {v0, v1}, Ll/upl0;->a(J)J

    .line 70
    .line 71
    .line 72
    move-result-wide v0

    .line 73
    const-wide/16 v2, 0x1

    .line 74
    .line 75
    cmp-long v2, v0, v2

    .line 76
    .line 77
    if-lez v2, :cond_2

    .line 78
    .line 79
    sget v2, Lcom/p1/mobile/putong/core/R$string;->jt:I

    .line 80
    .line 81
    goto :goto_0

    .line 82
    :cond_2
    sget v2, Lcom/p1/mobile/putong/core/R$string;->ht:I

    .line 83
    .line 84
    :goto_0
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 85
    .line 86
    .line 87
    move-result-object v0

    .line 88
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 89
    .line 90
    .line 91
    move-result-object v0

    .line 92
    invoke-virtual {p0, v2, v0}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 93
    .line 94
    .line 95
    move-result-object p0

    .line 96
    return-object p0
.end method

.method public static d(Lcom/p1/mobile/putong/core/data/UserPrivilege;)Ljava/lang/String;
    .locals 15

    if-eqz p0, :cond_0

    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/UserPrivilege;->content:Lcom/p1/mobile/putong/core/data/UserPrivilegeContent;

    if-eqz v0, :cond_0

    iget-wide v1, v0, Lcom/p1/mobile/putong/core/data/UserPrivilegeContent;->expiredTime:J

    const-wide/16 v3, 0x0

    cmp-long v5, v1, v3

    if-nez v5, :cond_0

    const-wide v1, 0x66700f60000L

    iput-wide v1, v0, Lcom/p1/mobile/putong/core/data/UserPrivilegeContent;->expiredTime:J

    .line 1
    :cond_0
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_14

    .line 6
    .line 7
    sget-object v0, Ll/uqb0;->H:Lcom/p1/mobile/putong/api/api/Network;

    .line 8
    .line 9
    invoke-virtual {v0}, Lcom/p1/mobile/putong/api/api/Network;->guessedCurrentServerTime()J

    .line 10
    .line 11
    .line 12
    move-result-wide v0

    .line 13
    iget-object v2, p0, Lcom/p1/mobile/putong/core/data/UserPrivilege;->content:Lcom/p1/mobile/putong/core/data/UserPrivilegeContent;

    .line 14
    .line 15
    iget-wide v2, v2, Lcom/p1/mobile/putong/core/data/UserPrivilegeContent;->expiredTime:J

    .line 16
    .line 17
    const-wide/16 v4, 0x0

    .line 18
    .line 19
    cmp-long v6, v2, v4

    .line 20
    .line 21
    const-string v7, "ultraPremium"

    .line 22
    .line 23
    const-string v8, "youthVip"

    .line 24
    .line 25
    const-string v9, "femaleVip"

    .line 26
    .line 27
    const-string v10, "platinum"

    .line 28
    .line 29
    const-string v11, "oDiamond"

    .line 30
    .line 31
    const-string v12, "svip"

    .line 32
    .line 33
    if-nez v6, :cond_6

    .line 34
    .line 35
    iget-object v6, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 36
    .line 37
    invoke-virtual {v12, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 38
    .line 39
    .line 40
    move-result v6

    .line 41
    if-eqz v6, :cond_1

    .line 42
    .line 43
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 44
    .line 45
    sget v0, Lcom/p1/mobile/putong/core/R$string;->C2:I

    .line 46
    .line 47
    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    return-object p0

    .line 52
    :cond_1
    iget-object v6, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 53
    .line 54
    invoke-virtual {v11, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 55
    .line 56
    .line 57
    move-result v6

    .line 58
    if-eqz v6, :cond_2

    .line 59
    .line 60
    const-string p0, "\u6682\u672a\u6fc0\u6d3b\u9ed1\u91d1\u4f1a\u5458"

    .line 61
    .line 62
    return-object p0

    .line 63
    :cond_2
    iget-object v6, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 64
    .line 65
    invoke-virtual {v10, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 66
    .line 67
    .line 68
    move-result v6

    .line 69
    if-eqz v6, :cond_3

    .line 70
    .line 71
    const-string p0, "\u6682\u672a\u6fc0\u6d3b\u767d\u91d1\u4f1a\u5458"

    .line 72
    .line 73
    return-object p0

    .line 74
    :cond_3
    iget-object v6, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 75
    .line 76
    invoke-virtual {v9, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 77
    .line 78
    .line 79
    move-result v6

    .line 80
    if-eqz v6, :cond_4

    .line 81
    .line 82
    const-string p0, "\u6682\u672a\u6fc0\u6d3b\u5979\u4e13\u4eab\u4f1a\u5458"

    .line 83
    .line 84
    return-object p0

    .line 85
    :cond_4
    iget-object v6, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 86
    .line 87
    invoke-virtual {v8, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 88
    .line 89
    .line 90
    move-result v6

    .line 91
    if-eqz v6, :cond_5

    .line 92
    .line 93
    const-string p0, "\u6682\u672a\u6fc0\u6d3b\u9752\u6625\u4e13\u4eab\u4f1a\u5458"

    .line 94
    .line 95
    return-object p0

    .line 96
    :cond_5
    iget-object v6, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 97
    .line 98
    invoke-virtual {v7, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 99
    .line 100
    .line 101
    move-result v6

    .line 102
    if-eqz v6, :cond_6

    .line 103
    .line 104
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 105
    .line 106
    sget v0, Lcom/p1/mobile/putong/core/R$string;->Hg:I

    .line 107
    .line 108
    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 109
    .line 110
    .line 111
    move-result-object p0

    .line 112
    return-object p0

    .line 113
    :cond_6
    sub-long v13, v2, v0

    .line 114
    .line 115
    cmp-long v4, v13, v4

    .line 116
    .line 117
    iget-object v5, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 118
    .line 119
    const/4 v6, 0x0

    .line 120
    if-ltz v4, :cond_d

    .line 121
    .line 122
    invoke-virtual {v12, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 123
    .line 124
    .line 125
    move-result v0

    .line 126
    if-eqz v0, :cond_7

    .line 127
    .line 128
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 129
    .line 130
    sget v0, Lcom/p1/mobile/putong/core/R$string;->u3:I

    .line 131
    .line 132
    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 133
    .line 134
    .line 135
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 136
    .line 137
    sget v0, Lcom/p1/mobile/putong/core/R$string;->D2:I

    .line 138
    .line 139
    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 140
    .line 141
    .line 142
    move-result-object v6

    .line 143
    goto :goto_0

    .line 144
    :cond_7
    iget-object v0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 145
    .line 146
    invoke-virtual {v11, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 147
    .line 148
    .line 149
    move-result v0

    .line 150
    if-eqz v0, :cond_8

    .line 151
    .line 152
    const-string v6, "\u9ed1\u91d1\u4f1a\u5458(%s\u5230\u671f)"

    .line 153
    .line 154
    goto :goto_0

    .line 155
    :cond_8
    iget-object v0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 156
    .line 157
    invoke-virtual {v10, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 158
    .line 159
    .line 160
    move-result v0

    .line 161
    if-eqz v0, :cond_9

    .line 162
    .line 163
    const-string v6, "\u767d\u91d1\u4f1a\u5458(%s\u5230\u671f)"

    .line 164
    .line 165
    goto :goto_0

    .line 166
    :cond_9
    iget-object v0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 167
    .line 168
    invoke-virtual {v9, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 169
    .line 170
    .line 171
    move-result v0

    .line 172
    if-eqz v0, :cond_a

    .line 173
    .line 174
    const-string v6, "\u5979\u4e13\u4eab\u4f1a\u5458(%s\u5230\u671f)"

    .line 175
    .line 176
    goto :goto_0

    .line 177
    :cond_a
    iget-object v0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 178
    .line 179
    invoke-virtual {v8, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 180
    .line 181
    .line 182
    move-result v0

    .line 183
    if-eqz v0, :cond_b

    .line 184
    .line 185
    const-string v6, "\u9752\u6625\u4e13\u4eab\u4f1a\u5458(%s\u5230\u671f)"

    .line 186
    .line 187
    goto :goto_0

    .line 188
    :cond_b
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 189
    .line 190
    invoke-virtual {v7, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 191
    .line 192
    .line 193
    move-result p0

    .line 194
    if-eqz p0, :cond_c

    .line 195
    .line 196
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 197
    .line 198
    sget v0, Lcom/p1/mobile/putong/core/R$string;->Fg:I

    .line 199
    .line 200
    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 201
    .line 202
    .line 203
    move-result-object v6

    .line 204
    :cond_c
    :goto_0
    invoke-static {v6}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 205
    .line 206
    .line 207
    move-result p0

    .line 208
    if-nez p0, :cond_14

    .line 209
    .line 210
    sget-object p0, Ll/pzi0;->d:Ljava/text/SimpleDateFormat;

    .line 211
    .line 212
    new-instance v0, Ljava/util/Date;

    .line 213
    .line 214
    invoke-direct {v0, v2, v3}, Ljava/util/Date;-><init>(J)V

    .line 215
    .line 216
    .line 217
    invoke-virtual {p0, v0}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    .line 218
    .line 219
    .line 220
    move-result-object p0

    .line 221
    filled-new-array {p0}, [Ljava/lang/Object;

    .line 222
    .line 223
    .line 224
    move-result-object p0

    .line 225
    invoke-static {v6, p0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 226
    .line 227
    .line 228
    move-result-object p0

    .line 229
    return-object p0

    .line 230
    :cond_d
    invoke-virtual {v12, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 231
    .line 232
    .line 233
    move-result v4

    .line 234
    if-eqz v4, :cond_e

    .line 235
    .line 236
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 237
    .line 238
    sget v4, Lcom/p1/mobile/putong/core/R$string;->t3:I

    .line 239
    .line 240
    invoke-virtual {p0, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 241
    .line 242
    .line 243
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 244
    .line 245
    sget v4, Lcom/p1/mobile/putong/core/R$string;->B2:I

    .line 246
    .line 247
    invoke-virtual {p0, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 248
    .line 249
    .line 250
    move-result-object v6

    .line 251
    goto :goto_1

    .line 252
    :cond_e
    iget-object v4, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 253
    .line 254
    invoke-virtual {v11, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 255
    .line 256
    .line 257
    move-result v4

    .line 258
    if-eqz v4, :cond_f

    .line 259
    .line 260
    const-string v6, "\u9ed1\u91d1\u4f1a\u5458\u5df2\u8fc7\u671f%s\u5929"

    .line 261
    .line 262
    goto :goto_1

    .line 263
    :cond_f
    iget-object v4, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 264
    .line 265
    invoke-virtual {v10, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 266
    .line 267
    .line 268
    move-result v4

    .line 269
    if-eqz v4, :cond_10

    .line 270
    .line 271
    const-string v6, "\u767d\u91d1\u4f1a\u5458\u5df2\u8fc7\u671f%s\u5929"

    .line 272
    .line 273
    goto :goto_1

    .line 274
    :cond_10
    iget-object v4, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 275
    .line 276
    invoke-virtual {v9, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 277
    .line 278
    .line 279
    move-result v4

    .line 280
    if-eqz v4, :cond_11

    .line 281
    .line 282
    const-string v6, "\u5979\u4e13\u4eab\u4f1a\u5458\u5df2\u8fc7\u671f%s\u5929"

    .line 283
    .line 284
    goto :goto_1

    .line 285
    :cond_11
    iget-object v4, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 286
    .line 287
    invoke-virtual {v8, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 288
    .line 289
    .line 290
    move-result v4

    .line 291
    if-eqz v4, :cond_12

    .line 292
    .line 293
    const-string v6, "\u9752\u6625\u4e13\u4eab\u4f1a\u5458\u5df2\u8fc7\u671f%s\u5929"

    .line 294
    .line 295
    goto :goto_1

    .line 296
    :cond_12
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 297
    .line 298
    invoke-virtual {v7, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 299
    .line 300
    .line 301
    move-result p0

    .line 302
    if-eqz p0, :cond_13

    .line 303
    .line 304
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 305
    .line 306
    sget v4, Lcom/p1/mobile/putong/core/R$string;->Gg:I

    .line 307
    .line 308
    invoke-virtual {p0, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 309
    .line 310
    .line 311
    move-result-object v6

    .line 312
    :cond_13
    :goto_1
    invoke-static {v6}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 313
    .line 314
    .line 315
    move-result p0

    .line 316
    if-nez p0, :cond_14

    .line 317
    .line 318
    sub-long/2addr v0, v2

    .line 319
    invoke-static {v0, v1}, Ll/upl0;->a(J)J

    .line 320
    .line 321
    .line 322
    move-result-wide v0

    .line 323
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 324
    .line 325
    .line 326
    move-result-object p0

    .line 327
    filled-new-array {p0}, [Ljava/lang/Object;

    .line 328
    .line 329
    .line 330
    move-result-object p0

    .line 331
    invoke-static {v6, p0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 332
    .line 333
    .line 334
    move-result-object p0

    .line 335
    return-object p0

    .line 336
    :cond_14
    const-string p0, ""

    .line 337
    .line 338
    return-object p0
.end method

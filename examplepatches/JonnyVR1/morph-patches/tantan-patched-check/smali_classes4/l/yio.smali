.class public Ll/yio;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/yio$a;
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static a(Ljava/lang/String;)Z
    .locals 3

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->v0:Ll/l99;

    .line 4
    .line 5
    iget-object v0, v0, Ll/l99;->X:Ljava/util/List;

    .line 6
    .line 7
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    const/4 v1, 0x0

    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    return v1

    .line 15
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 16
    .line 17
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->v0:Ll/l99;

    .line 18
    .line 19
    iget-object v0, v0, Ll/l99;->X:Ljava/util/List;

    .line 20
    .line 21
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    :cond_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 26
    .line 27
    .line 28
    move-result v2

    .line 29
    if-eqz v2, :cond_2

    .line 30
    .line 31
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    move-result-object v2

    .line 35
    check-cast v2, Lcom/p1/mobile/putong/core/data/SuperlikeByCount;

    .line 36
    .line 37
    iget-object v2, v2, Lcom/p1/mobile/putong/core/data/SuperlikeByCount;->id:Ljava/lang/String;

    .line 38
    .line 39
    invoke-static {v2, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 40
    .line 41
    .line 42
    move-result v2

    .line 43
    if-eqz v2, :cond_1

    .line 44
    .line 45
    const/4 p0, 0x1

    .line 46
    return p0

    .line 47
    :cond_2
    return v1
.end method

.method public static b(Lcom/p1/mobile/putong/data/User;)Ll/yio$a;
    .locals 10

    .line 1
    invoke-static {}, Ll/pzi0;->o()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    iget-object v2, p0, Lcom/p1/mobile/putong/data/User;->location:Lcom/p1/mobile/putong/data/Location;

    .line 6
    .line 7
    iget-wide v3, v2, Lcom/p1/mobile/putong/data/Location;->updatedTime:D

    .line 8
    .line 9
    double-to-long v5, v3

    .line 10
    sub-long/2addr v0, v5

    .line 11
    const-wide/16 v5, 0x3e8

    .line 12
    .line 13
    div-long/2addr v0, v5

    .line 14
    iget v2, v2, Lcom/p1/mobile/putong/data/Location;->distance:I

    .line 15
    .line 16
    const/16 v5, 0x32c8

    .line 17
    .line 18
    const/4 v6, 0x1

    .line 19
    const/4 v7, 0x0

    .line 20
    if-gt v2, v5, :cond_0

    .line 21
    .line 22
    invoke-static {v2, v7, v6}, Ll/q8g0;->s(IZZ)Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    goto :goto_2

    .line 27
    :cond_0
    const-wide/32 v8, 0x15180

    .line 28
    .line 29
    .line 30
    cmp-long v2, v0, v8

    .line 31
    .line 32
    if-gez v2, :cond_1

    .line 33
    .line 34
    invoke-static {v3, v4, v6}, Ll/pzi0;->J(DZ)Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    goto :goto_2

    .line 39
    :cond_1
    iget-object v2, p0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 40
    .line 41
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 42
    .line 43
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    .line 44
    .line 45
    iget-object v2, v2, Lcom/p1/mobile/putong/data/ProfileExtensionBasic;->intlFriendPurposeV2:Ljava/util/List;

    .line 46
    .line 47
    invoke-static {v2}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 48
    .line 49
    .line 50
    move-result v3

    .line 51
    if-nez v3, :cond_2

    .line 52
    .line 53
    sget-object v3, Ll/lhn;->INSTANCE:Ll/lhn;

    .line 54
    .line 55
    invoke-interface {v2, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 56
    .line 57
    .line 58
    move-result-object v2

    .line 59
    check-cast v2, Ljava/lang/String;

    .line 60
    .line 61
    invoke-virtual {v3, v2}, Ll/lhn;->a(Ljava/lang/String;)Ll/lhn$a;

    .line 62
    .line 63
    .line 64
    move-result-object v2

    .line 65
    if-eqz v2, :cond_2

    .line 66
    .line 67
    sget-object v3, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 68
    .line 69
    invoke-virtual {v2}, Ll/lhn$a;->d()I

    .line 70
    .line 71
    .line 72
    move-result v2

    .line 73
    invoke-virtual {v3, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 74
    .line 75
    .line 76
    move-result-object v2

    .line 77
    sget v7, Ll/gbc0;->S:I

    .line 78
    .line 79
    goto :goto_0

    .line 80
    :cond_2
    const/4 v2, 0x0

    .line 81
    :goto_0
    if-nez v2, :cond_3

    .line 82
    .line 83
    const-wide/32 v3, 0x69780

    .line 84
    .line 85
    .line 86
    cmp-long v0, v0, v3

    .line 87
    .line 88
    if-gtz v0, :cond_3

    .line 89
    .line 90
    sget-object v0, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 91
    .line 92
    sget v1, Lcom/p1/mobile/putong/core/member/R$string;->c1:I

    .line 93
    .line 94
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 95
    .line 96
    .line 97
    move-result-object v0

    .line 98
    goto :goto_1

    .line 99
    :cond_3
    move-object v0, v2

    .line 100
    :goto_1
    if-nez v0, :cond_4

    .line 101
    .line 102
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->location:Lcom/p1/mobile/putong/data/Location;

    .line 103
    .line 104
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/Location;->clone()Lcom/p1/mobile/putong/data/Location;

    .line 105
    .line 106
    .line 107
    move-result-object p0

    .line 108
    invoke-static {p0, v6, v6}, Ll/q8g0;->r(Lcom/p1/mobile/putong/data/Location;ZZ)Ljava/lang/String;

    .line 109
    .line 110
    .line 111
    move-result-object p0

    .line 112
    goto :goto_2

    .line 113
    :cond_4
    move-object p0, v0

    .line 114
    :goto_2
    sget-object v0, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 115
    .line 116
    sget v1, Lcom/p1/mobile/putong/core/member/R$string;->M:I

    .line 117
    .line 118
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 119
    .line 120
    .line 121
    move-result-object v0

    .line 122
    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 123
    .line 124
    .line 125
    move-result v0

    .line 126
    if-nez v0, :cond_5

    .line 127
    .line 128
    sget-object v0, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 129
    .line 130
    sget v1, Lcom/p1/mobile/putong/core/member/R$string;->c1:I

    .line 131
    .line 132
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 133
    .line 134
    .line 135
    move-result-object v0

    .line 136
    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 137
    .line 138
    .line 139
    move-result v0

    .line 140
    if-eqz v0, :cond_6

    .line 141
    .line 142
    :cond_5
    sget v7, Ll/gbc0;->L:I

    .line 143
    .line 144
    :cond_6
    new-instance v0, Ll/yio$a;

    .line 145
    .line 146
    invoke-direct {v0, p0, v7}, Ll/yio$a;-><init>(Ljava/lang/String;I)V

    .line 147
    .line 148
    .line 149
    return-object v0
.end method

.method public static c(Lcom/p1/mobile/putong/data/User;)Ljava/lang/String;
    .locals 7

    .line 1
    invoke-static {}, Ll/pzi0;->o()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    iget-object v2, p0, Lcom/p1/mobile/putong/data/User;->location:Lcom/p1/mobile/putong/data/Location;

    .line 6
    .line 7
    iget-wide v3, v2, Lcom/p1/mobile/putong/data/Location;->updatedTime:D

    .line 8
    .line 9
    double-to-long v3, v3

    .line 10
    sub-long/2addr v0, v3

    .line 11
    const-wide/16 v3, 0x3e8

    .line 12
    .line 13
    div-long/2addr v0, v3

    .line 14
    iget v2, v2, Lcom/p1/mobile/putong/data/Location;->distance:I

    .line 15
    .line 16
    const/16 v3, 0x32c8

    .line 17
    .line 18
    const-string v4, "distance_tag"

    .line 19
    .line 20
    if-gt v2, v3, :cond_0

    .line 21
    .line 22
    return-object v4

    .line 23
    :cond_0
    const-wide/32 v2, 0x15180

    .line 24
    .line 25
    .line 26
    cmp-long v2, v0, v2

    .line 27
    .line 28
    const-string v3, "active_tag"

    .line 29
    .line 30
    if-gez v2, :cond_1

    .line 31
    .line 32
    return-object v3

    .line 33
    :cond_1
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 34
    .line 35
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 36
    .line 37
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    .line 38
    .line 39
    iget-object p0, p0, Lcom/p1/mobile/putong/data/ProfileExtensionBasic;->intlFriendPurposeV2:Ljava/util/List;

    .line 40
    .line 41
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 42
    .line 43
    .line 44
    move-result v2

    .line 45
    if-nez v2, :cond_2

    .line 46
    .line 47
    sget-object v2, Ll/lhn;->INSTANCE:Ll/lhn;

    .line 48
    .line 49
    const/4 v5, 0x0

    .line 50
    invoke-interface {p0, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    check-cast p0, Ljava/lang/String;

    .line 55
    .line 56
    invoke-virtual {v2, p0}, Ll/lhn;->a(Ljava/lang/String;)Ll/lhn$a;

    .line 57
    .line 58
    .line 59
    move-result-object p0

    .line 60
    if-eqz p0, :cond_2

    .line 61
    .line 62
    const-string p0, "purpose_tag"

    .line 63
    .line 64
    return-object p0

    .line 65
    :cond_2
    const-wide/32 v5, 0x69780

    .line 66
    .line 67
    .line 68
    cmp-long p0, v0, v5

    .line 69
    .line 70
    if-gtz p0, :cond_3

    .line 71
    .line 72
    return-object v3

    .line 73
    :cond_3
    return-object v4
.end method

.class public Ll/g7k0;
.super Ljava/lang/Object;
.source "SourceFile"


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

.method public static a(Landroid/content/Context;Ll/nsv;Z)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ll/nsv<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;Z)V"
        }
    .end annotation

    .line 1
    const-string v4, ""

    .line 2
    .line 3
    const/4 v5, 0x0

    .line 4
    const/4 v3, 0x0

    .line 5
    move-object v0, p0

    .line 6
    move-object v1, p1

    .line 7
    move v2, p2

    .line 8
    invoke-static/range {v0 .. v5}, Ll/g7k0;->b(Landroid/content/Context;Ll/nsv;ZZLjava/lang/String;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public static b(Landroid/content/Context;Ll/nsv;ZZLjava/lang/String;Ljava/lang/String;)V
    .locals 15
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ll/nsv<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;ZZ",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 1
    move-object/from16 v0, p1

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-eqz p3, :cond_0

    .line 5
    .line 6
    sget-object v2, Ll/zrv;->a:Ll/wrv;

    .line 7
    .line 8
    iget-object v0, v0, Ll/nsv;->a:Ljava/lang/Object;

    .line 9
    .line 10
    move-object v4, v0

    .line 11
    check-cast v4, Lcom/p1/mobile/putong/data/User;

    .line 12
    .line 13
    check-cast v0, Lcom/p1/mobile/putong/data/User;

    .line 14
    .line 15
    iget-object v5, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 16
    .line 17
    xor-int/lit8 v7, p2, 0x1

    .line 18
    .line 19
    move-object v3, p0

    .line 20
    move-object/from16 v6, p4

    .line 21
    .line 22
    move-object/from16 v8, p5

    .line 23
    .line 24
    invoke-virtual/range {v2 .. v8}, Ll/wrv;->B0(Landroid/content/Context;Lcom/p1/mobile/putong/data/User;Ljava/lang/String;Ljava/lang/String;ZLjava/lang/String;)V

    .line 25
    .line 26
    .line 27
    return-void

    .line 28
    :cond_0
    iget-object v2, v0, Ll/nsv;->a:Ljava/lang/Object;

    .line 29
    .line 30
    move-object v3, v2

    .line 31
    check-cast v3, Lcom/p1/mobile/putong/data/User;

    .line 32
    .line 33
    iget-object v3, v3, Lcom/p1/mobile/putong/data/User;->localFollowship:Lcom/p1/mobile/putong/data/Followship;

    .line 34
    .line 35
    check-cast v2, Lcom/p1/mobile/putong/data/User;

    .line 36
    .line 37
    iget-object v2, v2, Lcom/p1/mobile/putong/data/User;->localRelationship:Lcom/p1/mobile/putong/data/Relationship;

    .line 38
    .line 39
    const/4 v4, 0x0

    .line 40
    const-string v5, "matched"

    .line 41
    .line 42
    if-eqz v2, :cond_1

    .line 43
    .line 44
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Relationship;->state:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 45
    .line 46
    invoke-static {v2, v5}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 47
    .line 48
    .line 49
    move-result v2

    .line 50
    if-eqz v2, :cond_1

    .line 51
    .line 52
    move v2, v1

    .line 53
    goto :goto_0

    .line 54
    :cond_1
    move v2, v4

    .line 55
    :goto_0
    if-eqz v3, :cond_3

    .line 56
    .line 57
    iget-object v6, v3, Lcom/p1/mobile/putong/data/Followship;->state:Lcom/p1/mobile/putong/data/FollowshipStatus;

    .line 58
    .line 59
    const-string v7, "following"

    .line 60
    .line 61
    invoke-static {v6, v7}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 62
    .line 63
    .line 64
    move-result v6

    .line 65
    if-nez v6, :cond_2

    .line 66
    .line 67
    iget-object v6, v3, Lcom/p1/mobile/putong/data/Followship;->state:Lcom/p1/mobile/putong/data/FollowshipStatus;

    .line 68
    .line 69
    const-string v7, "followed"

    .line 70
    .line 71
    invoke-static {v6, v7}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 72
    .line 73
    .line 74
    move-result v6

    .line 75
    if-nez v6, :cond_2

    .line 76
    .line 77
    iget-object v3, v3, Lcom/p1/mobile/putong/data/Followship;->state:Lcom/p1/mobile/putong/data/FollowshipStatus;

    .line 78
    .line 79
    invoke-static {v3, v5}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 80
    .line 81
    .line 82
    move-result v3

    .line 83
    if-eqz v3, :cond_3

    .line 84
    .line 85
    :cond_2
    move v4, v1

    .line 86
    :cond_3
    if-nez v2, :cond_6

    .line 87
    .line 88
    if-eqz v4, :cond_4

    .line 89
    .line 90
    goto :goto_2

    .line 91
    :cond_4
    if-eqz p2, :cond_6

    .line 92
    .line 93
    sget-object v2, Ll/zrv;->a:Ll/wrv;

    .line 94
    .line 95
    invoke-virtual {v2}, Ll/wrv;->D0()Ljava/lang/String;

    .line 96
    .line 97
    .line 98
    move-result-object v2

    .line 99
    iget-object v3, v0, Ll/nsv;->a:Ljava/lang/Object;

    .line 100
    .line 101
    check-cast v3, Lcom/p1/mobile/putong/data/User;

    .line 102
    .line 103
    iget-object v3, v3, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 104
    .line 105
    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 106
    .line 107
    .line 108
    move-result v2

    .line 109
    if-eqz v2, :cond_5

    .line 110
    .line 111
    goto :goto_2

    .line 112
    :cond_5
    const-string v2, "live_profile_voice_mask_mode"

    .line 113
    .line 114
    :goto_1
    move-object v12, v2

    .line 115
    goto :goto_3

    .line 116
    :cond_6
    :goto_2
    const-string v2, "live_user_card"

    .line 117
    .line 118
    goto :goto_1

    .line 119
    :goto_3
    sget-object v8, Ll/zrv;->a:Ll/wrv;

    .line 120
    .line 121
    iget-object v0, v0, Ll/nsv;->a:Ljava/lang/Object;

    .line 122
    .line 123
    move-object v10, v0

    .line 124
    check-cast v10, Lcom/p1/mobile/putong/data/User;

    .line 125
    .line 126
    check-cast v0, Lcom/p1/mobile/putong/data/User;

    .line 127
    .line 128
    iget-object v11, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 129
    .line 130
    xor-int/lit8 v13, p2, 0x1

    .line 131
    .line 132
    move-object v9, p0

    .line 133
    move-object/from16 v14, p5

    .line 134
    .line 135
    invoke-virtual/range {v8 .. v14}, Ll/wrv;->B0(Landroid/content/Context;Lcom/p1/mobile/putong/data/User;Ljava/lang/String;Ljava/lang/String;ZLjava/lang/String;)V

    .line 136
    .line 137
    .line 138
    return-void
.end method

.method public static c(Landroid/content/Context;Ll/vak0;Ljava/lang/String;ZLjava/lang/String;)V
    .locals 6

    .line 1
    iget-object v1, p1, Ll/vak0;->c:Ll/nsv;

    .line 2
    .line 3
    const/4 v3, 0x0

    .line 4
    const-string v4, ""

    .line 5
    .line 6
    move-object v0, p0

    .line 7
    move v2, p3

    .line 8
    move-object v5, p4

    .line 9
    invoke-static/range {v0 .. v5}, Ll/g7k0;->b(Landroid/content/Context;Ll/nsv;ZZLjava/lang/String;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public static d(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    .line 1
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    new-instance v0, Ljava/lang/StringBuilder;

    .line 14
    .line 15
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    const-string p0, ":"

    .line 22
    .line 23
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    return-object p0

    .line 34
    :cond_0
    const/4 p0, 0x0

    .line 35
    return-object p0
.end method

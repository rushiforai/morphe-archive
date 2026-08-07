.class public Ll/evo0;
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

.method public static a(Ljava/lang/String;I)Ljava/lang/String;
    .locals 1

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 7
    .line 8
    .line 9
    const-string p0, "_index_"

    .line 10
    .line 11
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    return-object p0
.end method

.method public static b(ILjava/lang/String;)V
    .locals 3

    .line 1
    new-instance v0, Ll/pf60;

    .line 2
    .line 3
    const-string v1, "audio_tab_id"

    .line 4
    .line 5
    const-string v2, "0"

    .line 6
    .line 7
    invoke-direct {v0, v1, v2}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 8
    .line 9
    .line 10
    new-instance v1, Ll/pf60;

    .line 11
    .line 12
    const-string v2, "entrance_type"

    .line 13
    .line 14
    invoke-static {p1, p0}, Ll/evo0;->a(Ljava/lang/String;I)Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    invoke-direct {v1, v2, p0}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 19
    .line 20
    .line 21
    filled-new-array {v0, v1}, [Ll/pf60;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    const-string p1, "e_start_audio_room_entrance"

    .line 26
    .line 27
    const-string v0, "p_audio_explore_recommend"

    .line 28
    .line 29
    invoke-static {p1, v0, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public static c()V
    .locals 4

    .line 1
    new-instance v0, Ll/pf60;

    .line 2
    .line 3
    const-string v1, "audio_tab_id"

    .line 4
    .line 5
    const-string v2, ""

    .line 6
    .line 7
    invoke-direct {v0, v1, v2}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 8
    .line 9
    .line 10
    new-instance v1, Ll/pf60;

    .line 11
    .line 12
    const-string v2, "entrance_type"

    .line 13
    .line 14
    const-string v3, "top_right"

    .line 15
    .line 16
    invoke-direct {v1, v2, v3}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 17
    .line 18
    .line 19
    filled-new-array {v0, v1}, [Ll/pf60;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    const-string v1, "e_start_audio_room_entrance"

    .line 24
    .line 25
    const-string v2, "p_audio_explore_recommend"

    .line 26
    .line 27
    invoke-static {v1, v2, v0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public static d()V
    .locals 4

    .line 1
    new-instance v0, Ll/pf60;

    .line 2
    .line 3
    const-string v1, "audio_tab_id"

    .line 4
    .line 5
    const-string v2, ""

    .line 6
    .line 7
    invoke-direct {v0, v1, v2}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 8
    .line 9
    .line 10
    new-instance v1, Ll/pf60;

    .line 11
    .line 12
    const-string v2, "entrance_type"

    .line 13
    .line 14
    const-string v3, "top_right"

    .line 15
    .line 16
    invoke-direct {v1, v2, v3}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 17
    .line 18
    .line 19
    filled-new-array {v0, v1}, [Ll/pf60;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    const-string v1, "e_start_audio_room_entrance"

    .line 24
    .line 25
    const-string v2, "p_audio_explore_recommend"

    .line 26
    .line 27
    invoke-static {v1, v2, v0}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public static e(Lcom/p1/mobile/putong/live/base/data/BLiveMemberActivityData;ZI)V
    .locals 12

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveMemberActivityData;->relationStatus:Ljava/lang/String;

    .line 2
    .line 3
    const-string v1, "match"

    .line 4
    .line 5
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_3

    .line 10
    .line 11
    const-string v0, "all"

    .line 12
    .line 13
    iget-object v2, p0, Lcom/p1/mobile/putong/live/base/data/BLiveMemberActivityData;->relationStatus:Ljava/lang/String;

    .line 14
    .line 15
    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    const-string v0, "follow"

    .line 23
    .line 24
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveMemberActivityData;->relationStatus:Ljava/lang/String;

    .line 25
    .line 26
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    if-eqz v0, :cond_1

    .line 31
    .line 32
    const-string v1, "follow_anchor"

    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_1
    const-string v0, "likeother"

    .line 36
    .line 37
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveMemberActivityData;->relationStatus:Ljava/lang/String;

    .line 38
    .line 39
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    if-eqz v0, :cond_2

    .line 44
    .line 45
    const-string v1, "like"

    .line 46
    .line 47
    goto :goto_0

    .line 48
    :cond_2
    const-string v1, "may_interest"

    .line 49
    .line 50
    :cond_3
    :goto_0
    sget-object v0, Ll/itd0;->b:Ll/itd0;

    .line 51
    .line 52
    invoke-static {v0}, Ll/tbs;->m(Ll/itd0;)Ljava/lang/Object;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    check-cast v0, Ll/fk3;

    .line 57
    .line 58
    invoke-virtual {v0}, Ll/fk3;->u()Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    new-instance v2, Ll/q4f;

    .line 63
    .line 64
    invoke-direct {v2}, Ll/q4f;-><init>()V

    .line 65
    .line 66
    .line 67
    const-string v3, "e_live_audio_room_enter"

    .line 68
    .line 69
    iput-object v3, v2, Ll/q4f;->s:Ljava/lang/String;

    .line 70
    .line 71
    if-eqz p1, :cond_4

    .line 72
    .line 73
    sget-object p1, Lcom/tantanapp/foxstatistics/entity/EventNameEnum;->MODULE_CLICK:Lcom/tantanapp/foxstatistics/entity/EventNameEnum;

    .line 74
    .line 75
    goto :goto_1

    .line 76
    :cond_4
    sget-object p1, Lcom/tantanapp/foxstatistics/entity/EventNameEnum;->MODULE_VIEW:Lcom/tantanapp/foxstatistics/entity/EventNameEnum;

    .line 77
    .line 78
    :goto_1
    iput-object p1, v2, Ll/q4f;->d:Lcom/tantanapp/foxstatistics/entity/EventNameEnum;

    .line 79
    .line 80
    const-string p1, "p_audio_follow"

    .line 81
    .line 82
    iput-object p1, v2, Ll/q4f;->n:Ljava/lang/String;

    .line 83
    .line 84
    new-instance v3, Ll/pf60;

    .line 85
    .line 86
    const-string p1, "anchorId"

    .line 87
    .line 88
    iget-object v4, p0, Lcom/p1/mobile/putong/live/base/data/BLiveMemberActivityData;->userId:Ljava/lang/String;

    .line 89
    .line 90
    invoke-direct {v3, p1, v4}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 91
    .line 92
    .line 93
    new-instance v4, Ll/pf60;

    .line 94
    .line 95
    const-string p1, "audio_card_type"

    .line 96
    .line 97
    const-string v5, "follow_entrance"

    .line 98
    .line 99
    invoke-direct {v4, p1, v5}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 100
    .line 101
    .line 102
    new-instance v5, Ll/pf60;

    .line 103
    .line 104
    const-string p1, "audio_room_type"

    .line 105
    .line 106
    const-string v6, "normal_audio"

    .line 107
    .line 108
    invoke-direct {v5, p1, v6}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 109
    .line 110
    .line 111
    new-instance v6, Ll/pf60;

    .line 112
    .line 113
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 114
    .line 115
    .line 116
    move-result p1

    .line 117
    const-string v7, "NA"

    .line 118
    .line 119
    if-eqz p1, :cond_5

    .line 120
    .line 121
    move-object p1, v7

    .line 122
    goto :goto_2

    .line 123
    :cond_5
    move-object p1, v0

    .line 124
    :goto_2
    const-string v8, "audio_tab_id"

    .line 125
    .line 126
    invoke-direct {v6, v8, p1}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 127
    .line 128
    .line 129
    move-object p1, v7

    .line 130
    new-instance v7, Ll/pf60;

    .line 131
    .line 132
    const-string v8, "index"

    .line 133
    .line 134
    invoke-static {p2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 135
    .line 136
    .line 137
    move-result-object p2

    .line 138
    invoke-direct {v7, v8, p2}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 139
    .line 140
    .line 141
    new-instance v8, Ll/pf60;

    .line 142
    .line 143
    const-string p2, "liveId"

    .line 144
    .line 145
    iget-object v9, p0, Lcom/p1/mobile/putong/live/base/data/BLiveMemberActivityData;->voiceLiveId:Ljava/lang/String;

    .line 146
    .line 147
    invoke-direct {v8, p2, v9}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 148
    .line 149
    .line 150
    new-instance v9, Ll/pf60;

    .line 151
    .line 152
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 153
    .line 154
    .line 155
    move-result p2

    .line 156
    if-eqz p2, :cond_6

    .line 157
    .line 158
    move-object v0, p1

    .line 159
    :cond_6
    const-string p1, "topic_id"

    .line 160
    .line 161
    invoke-direct {v9, p1, v0}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 162
    .line 163
    .line 164
    new-instance v10, Ll/pf60;

    .line 165
    .line 166
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveMemberActivityData;->status:Ljava/lang/String;

    .line 167
    .line 168
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 169
    .line 170
    .line 171
    move-result p0

    .line 172
    xor-int/lit8 p0, p0, 0x1

    .line 173
    .line 174
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 175
    .line 176
    .line 177
    move-result-object p0

    .line 178
    const-string p1, "is_audio_continue"

    .line 179
    .line 180
    invoke-direct {v10, p1, p0}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 181
    .line 182
    .line 183
    new-instance v11, Ll/pf60;

    .line 184
    .line 185
    const-string p0, "anchor_type"

    .line 186
    .line 187
    invoke-direct {v11, p0, v1}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 188
    .line 189
    .line 190
    filled-new-array/range {v3 .. v11}, [Ll/pf60;

    .line 191
    .line 192
    .line 193
    move-result-object p0

    .line 194
    invoke-static {v2, p0}, Ll/i4g0;->o(Ll/q4f;[Ll/pf60;)V

    .line 195
    .line 196
    .line 197
    return-void
.end method

.method public static f(Ll/j0v;ZZZ)V
    .locals 10

    .line 1
    if-nez p0, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    invoke-virtual {p0}, Ll/j0v;->e()I

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    const/4 v1, 0x1

    .line 9
    if-nez v0, :cond_1

    .line 10
    .line 11
    const-string v0, "unread_msg"

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_1
    if-ne v0, v1, :cond_2

    .line 15
    .line 16
    const-string v0, "have_audio_available"

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_2
    const-string v0, "no_audio_ available"

    .line 20
    .line 21
    :goto_0
    invoke-virtual {p0}, Ll/j0v;->f()I

    .line 22
    .line 23
    .line 24
    move-result v2

    .line 25
    const-string v3, "dot"

    .line 26
    .line 27
    const-string v4, "red_dot_small"

    .line 28
    .line 29
    const-string v5, "NA"

    .line 30
    .line 31
    if-lez v2, :cond_3

    .line 32
    .line 33
    invoke-virtual {p0}, Ll/j0v;->h()Z

    .line 34
    .line 35
    .line 36
    move-result v2

    .line 37
    if-eqz v2, :cond_5

    .line 38
    .line 39
    const-string v4, "red_dot_figure"

    .line 40
    .line 41
    goto :goto_1

    .line 42
    :cond_3
    invoke-virtual {p0}, Ll/j0v;->d()Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object v2

    .line 46
    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 47
    .line 48
    .line 49
    move-result v2

    .line 50
    if-eqz v2, :cond_4

    .line 51
    .line 52
    goto :goto_1

    .line 53
    :cond_4
    move-object v4, v5

    .line 54
    :cond_5
    :goto_1
    sget-object v2, Ll/itd0;->b:Ll/itd0;

    .line 55
    .line 56
    invoke-static {v2}, Ll/tbs;->m(Ll/itd0;)Ljava/lang/Object;

    .line 57
    .line 58
    .line 59
    move-result-object v2

    .line 60
    check-cast v2, Ll/fk3;

    .line 61
    .line 62
    invoke-virtual {v2}, Ll/fk3;->u()Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object v2

    .line 66
    new-instance v6, Ll/q4f;

    .line 67
    .line 68
    invoke-direct {v6}, Ll/q4f;-><init>()V

    .line 69
    .line 70
    .line 71
    const-string v7, "e_audio_follow"

    .line 72
    .line 73
    iput-object v7, v6, Ll/q4f;->s:Ljava/lang/String;

    .line 74
    .line 75
    if-eqz p1, :cond_6

    .line 76
    .line 77
    sget-object v7, Lcom/tantanapp/foxstatistics/entity/EventNameEnum;->MODULE_CLICK:Lcom/tantanapp/foxstatistics/entity/EventNameEnum;

    .line 78
    .line 79
    goto :goto_2

    .line 80
    :cond_6
    sget-object v7, Lcom/tantanapp/foxstatistics/entity/EventNameEnum;->MODULE_VIEW:Lcom/tantanapp/foxstatistics/entity/EventNameEnum;

    .line 81
    .line 82
    :goto_2
    iput-object v7, v6, Ll/q4f;->d:Lcom/tantanapp/foxstatistics/entity/EventNameEnum;

    .line 83
    .line 84
    const-string v7, "p_audio_explore_recommend"

    .line 85
    .line 86
    iput-object v7, v6, Ll/q4f;->n:Ljava/lang/String;

    .line 87
    .line 88
    new-instance v7, Ljava/util/ArrayList;

    .line 89
    .line 90
    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    .line 91
    .line 92
    .line 93
    new-instance v8, Ll/pf60;

    .line 94
    .line 95
    const-string v9, "status"

    .line 96
    .line 97
    invoke-direct {v8, v9, v0}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 98
    .line 99
    .line 100
    invoke-virtual {v7, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 101
    .line 102
    .line 103
    new-instance v0, Ll/pf60;

    .line 104
    .line 105
    invoke-virtual {p0}, Ll/j0v;->f()I

    .line 106
    .line 107
    .line 108
    move-result v8

    .line 109
    if-gtz v8, :cond_8

    .line 110
    .line 111
    invoke-virtual {p0}, Ll/j0v;->d()Ljava/lang/String;

    .line 112
    .line 113
    .line 114
    move-result-object v8

    .line 115
    invoke-virtual {v3, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 116
    .line 117
    .line 118
    move-result v3

    .line 119
    if-eqz v3, :cond_7

    .line 120
    .line 121
    goto :goto_3

    .line 122
    :cond_7
    const/4 v1, 0x0

    .line 123
    :cond_8
    :goto_3
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 124
    .line 125
    .line 126
    move-result-object v1

    .line 127
    const-string v3, "is_show_red_dot"

    .line 128
    .line 129
    invoke-direct {v0, v3, v1}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 130
    .line 131
    .line 132
    invoke-virtual {v7, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 133
    .line 134
    .line 135
    new-instance v0, Ll/pf60;

    .line 136
    .line 137
    const-string v1, "tooltips_type_ui"

    .line 138
    .line 139
    invoke-direct {v0, v1, v4}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 140
    .line 141
    .line 142
    invoke-virtual {v7, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 143
    .line 144
    .line 145
    new-instance v0, Ll/pf60;

    .line 146
    .line 147
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 148
    .line 149
    .line 150
    move-result v1

    .line 151
    if-eqz v1, :cond_9

    .line 152
    .line 153
    move-object v2, v5

    .line 154
    :cond_9
    const-string v1, "audio_tab_id"

    .line 155
    .line 156
    invoke-direct {v0, v1, v2}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 157
    .line 158
    .line 159
    invoke-virtual {v7, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 160
    .line 161
    .line 162
    new-instance v0, Ll/pf60;

    .line 163
    .line 164
    invoke-virtual {p0}, Ll/j0v;->f()I

    .line 165
    .line 166
    .line 167
    move-result v1

    .line 168
    if-lez v1, :cond_a

    .line 169
    .line 170
    invoke-virtual {p0}, Ll/j0v;->h()Z

    .line 171
    .line 172
    .line 173
    move-result v1

    .line 174
    if-eqz v1, :cond_a

    .line 175
    .line 176
    invoke-virtual {p0}, Ll/j0v;->f()I

    .line 177
    .line 178
    .line 179
    move-result p0

    .line 180
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 181
    .line 182
    .line 183
    move-result-object v5

    .line 184
    :cond_a
    const-string p0, "red_dot_num"

    .line 185
    .line 186
    invoke-direct {v0, p0, v5}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 187
    .line 188
    .line 189
    invoke-virtual {v7, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 190
    .line 191
    .line 192
    if-eqz p1, :cond_d

    .line 193
    .line 194
    new-instance p0, Ll/pf60;

    .line 195
    .line 196
    if-eqz p2, :cond_b

    .line 197
    .line 198
    const-string p1, "light"

    .line 199
    .line 200
    goto :goto_4

    .line 201
    :cond_b
    const-string p1, "normal"

    .line 202
    .line 203
    :goto_4
    const-string p2, "button_ui_status"

    .line 204
    .line 205
    invoke-direct {p0, p2, p1}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 206
    .line 207
    .line 208
    invoke-virtual {v7, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 209
    .line 210
    .line 211
    new-instance p0, Ll/pf60;

    .line 212
    .line 213
    if-eqz p3, :cond_c

    .line 214
    .line 215
    const-string p1, "clear"

    .line 216
    .line 217
    goto :goto_5

    .line 218
    :cond_c
    const-string p1, "enter"

    .line 219
    .line 220
    :goto_5
    const-string p2, "type"

    .line 221
    .line 222
    invoke-direct {p0, p2, p1}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 223
    .line 224
    .line 225
    invoke-virtual {v7, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 226
    .line 227
    .line 228
    :cond_d
    invoke-virtual {v7}, Ljava/util/ArrayList;->size()I

    .line 229
    .line 230
    .line 231
    move-result p0

    .line 232
    new-array p0, p0, [Ll/pf60;

    .line 233
    .line 234
    invoke-virtual {v7, p0}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 235
    .line 236
    .line 237
    move-result-object p0

    .line 238
    check-cast p0, [Ll/pf60;

    .line 239
    .line 240
    invoke-static {v6, p0}, Ll/i4g0;->o(Ll/q4f;[Ll/pf60;)V

    .line 241
    .line 242
    .line 243
    return-void
.end method

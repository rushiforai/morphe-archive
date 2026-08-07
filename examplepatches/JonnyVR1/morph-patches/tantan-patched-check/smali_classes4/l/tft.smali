.class public Ll/tft;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public static a(ZI)Ljava/lang/String;
    .locals 1

    .line 1
    const-string v0, "red_dot_normal"

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    return-object v0

    .line 6
    :cond_0
    if-lez p1, :cond_1

    .line 7
    .line 8
    const-string p0, "red_dot_figure"

    .line 9
    .line 10
    return-object p0

    .line 11
    :cond_1
    return-object v0
.end method

.method public static b(Ljava/lang/String;IIII)V
    .locals 13

    .line 1
    const-string v1, "NA"

    .line 2
    .line 3
    sget-object v0, Ll/uqb0;->b0:Ll/sre0;

    .line 4
    .line 5
    iget-object v0, v0, Ll/sre0;->c:Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;

    .line 6
    .line 7
    invoke-interface {v0}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;->Ok()Z

    .line 8
    .line 9
    .line 10
    move-result v2

    .line 11
    new-instance v3, Lorg/json/JSONObject;

    .line 12
    .line 13
    invoke-direct {v3}, Lorg/json/JSONObject;-><init>()V

    .line 14
    .line 15
    .line 16
    :try_start_0
    const-string v0, "audio_red_dot_num "

    .line 17
    .line 18
    if-lez p2, :cond_0

    .line 19
    .line 20
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 21
    .line 22
    .line 23
    move-result-object v4

    .line 24
    goto :goto_0

    .line 25
    :catch_0
    move-exception v0

    .line 26
    goto :goto_3

    .line 27
    :cond_0
    move-object v4, v1

    .line 28
    :goto_0
    invoke-virtual {v3, v0, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 29
    .line 30
    .line 31
    const-string v0, "live_red_dot_num "

    .line 32
    .line 33
    if-lez p3, :cond_1

    .line 34
    .line 35
    invoke-static/range {p3 .. p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 36
    .line 37
    .line 38
    move-result-object v4

    .line 39
    goto :goto_1

    .line 40
    :cond_1
    move-object v4, v1

    .line 41
    :goto_1
    invoke-virtual {v3, v0, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 42
    .line 43
    .line 44
    const-string v0, "video_room_red_dot_num "

    .line 45
    .line 46
    if-lez p4, :cond_2

    .line 47
    .line 48
    invoke-static/range {p4 .. p4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 49
    .line 50
    .line 51
    move-result-object v4

    .line 52
    goto :goto_2

    .line 53
    :cond_2
    move-object v4, v1

    .line 54
    :goto_2
    invoke-virtual {v3, v0, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 55
    .line 56
    .line 57
    goto :goto_4

    .line 58
    :goto_3
    invoke-static {v0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 59
    .line 60
    .line 61
    :goto_4
    if-eqz v2, :cond_3

    .line 62
    .line 63
    const/4 v0, 0x0

    .line 64
    goto :goto_5

    .line 65
    :cond_3
    const-string v0, "e_red_dot_bubble_live"

    .line 66
    .line 67
    :goto_5
    const-string v4, "red_dot_relation_child"

    .line 68
    .line 69
    invoke-static {v4, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 70
    .line 71
    .line 72
    move-result-object v5

    .line 73
    const-string v0, "tooltips_type"

    .line 74
    .line 75
    const-string v4, "red_dot"

    .line 76
    .line 77
    invoke-static {v0, v4}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 78
    .line 79
    .line 80
    move-result-object v6

    .line 81
    const-string v0, "tooltips_type_ui"

    .line 82
    .line 83
    invoke-static {v2, p1}, Ll/tft;->a(ZI)Ljava/lang/String;

    .line 84
    .line 85
    .line 86
    move-result-object v4

    .line 87
    invoke-static {v0, v4}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 88
    .line 89
    .line 90
    move-result-object v7

    .line 91
    if-eqz v2, :cond_4

    .line 92
    .line 93
    const-string v0, "live_icon"

    .line 94
    .line 95
    goto :goto_6

    .line 96
    :cond_4
    const-string v0, "bubble_live_followed"

    .line 97
    .line 98
    :goto_6
    const-string v4, "tooltips_trigger_module"

    .line 99
    .line 100
    invoke-static {v4, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 101
    .line 102
    .line 103
    move-result-object v8

    .line 104
    if-eqz v2, :cond_5

    .line 105
    .line 106
    const-string v0, "swipe_page"

    .line 107
    .line 108
    goto :goto_7

    .line 109
    :cond_5
    const-string v0, "live_explore"

    .line 110
    .line 111
    :goto_7
    const-string v2, "tooltips_trigger_page"

    .line 112
    .line 113
    invoke-static {v2, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 114
    .line 115
    .line 116
    move-result-object v9

    .line 117
    const-string v0, "red_dot_state"

    .line 118
    .line 119
    const-string v2, "on"

    .line 120
    .line 121
    invoke-static {v0, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 122
    .line 123
    .line 124
    move-result-object v10

    .line 125
    if-lez p1, :cond_6

    .line 126
    .line 127
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 128
    .line 129
    .line 130
    move-result-object v1

    .line 131
    :cond_6
    const-string p1, "red_dot_num"

    .line 132
    .line 133
    invoke-static {p1, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 134
    .line 135
    .line 136
    move-result-object v11

    .line 137
    const-string p1, "tooltips_trigger_reason"

    .line 138
    .line 139
    invoke-virtual {v3}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 140
    .line 141
    .line 142
    move-result-object v0

    .line 143
    invoke-static {p1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 144
    .line 145
    .line 146
    move-result-object v12

    .line 147
    filled-new-array/range {v5 .. v12}, [Ll/pf60;

    .line 148
    .line 149
    .line 150
    move-result-object p1

    .line 151
    const-string v0, "e_red_dot_entertainment_icon"

    .line 152
    .line 153
    invoke-static {v0, p0, p1}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 154
    .line 155
    .line 156
    return-void
.end method

.method public static c(Ljava/lang/String;IIII)V
    .locals 13

    .line 1
    const-string v1, "NA"

    .line 2
    .line 3
    sget-object v0, Ll/uqb0;->b0:Ll/sre0;

    .line 4
    .line 5
    iget-object v0, v0, Ll/sre0;->c:Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;

    .line 6
    .line 7
    invoke-interface {v0}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;->Ok()Z

    .line 8
    .line 9
    .line 10
    move-result v2

    .line 11
    new-instance v3, Lorg/json/JSONObject;

    .line 12
    .line 13
    invoke-direct {v3}, Lorg/json/JSONObject;-><init>()V

    .line 14
    .line 15
    .line 16
    :try_start_0
    const-string v0, "audio_red_dot_num "

    .line 17
    .line 18
    if-lez p2, :cond_0

    .line 19
    .line 20
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 21
    .line 22
    .line 23
    move-result-object v4

    .line 24
    goto :goto_0

    .line 25
    :catch_0
    move-exception v0

    .line 26
    goto :goto_3

    .line 27
    :cond_0
    move-object v4, v1

    .line 28
    :goto_0
    invoke-virtual {v3, v0, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 29
    .line 30
    .line 31
    const-string v0, "live_red_dot_num "

    .line 32
    .line 33
    if-lez p3, :cond_1

    .line 34
    .line 35
    invoke-static/range {p3 .. p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 36
    .line 37
    .line 38
    move-result-object v4

    .line 39
    goto :goto_1

    .line 40
    :cond_1
    move-object v4, v1

    .line 41
    :goto_1
    invoke-virtual {v3, v0, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 42
    .line 43
    .line 44
    const-string v0, "video_room_red_dot_num "

    .line 45
    .line 46
    if-lez p4, :cond_2

    .line 47
    .line 48
    invoke-static/range {p4 .. p4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 49
    .line 50
    .line 51
    move-result-object v4

    .line 52
    goto :goto_2

    .line 53
    :cond_2
    move-object v4, v1

    .line 54
    :goto_2
    invoke-virtual {v3, v0, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 55
    .line 56
    .line 57
    goto :goto_4

    .line 58
    :goto_3
    invoke-static {v0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 59
    .line 60
    .line 61
    :goto_4
    if-eqz v2, :cond_3

    .line 62
    .line 63
    const/4 v0, 0x0

    .line 64
    goto :goto_5

    .line 65
    :cond_3
    const-string v0, "e_red_dot_bubble_live"

    .line 66
    .line 67
    :goto_5
    const-string v4, "red_dot_relation_child"

    .line 68
    .line 69
    invoke-static {v4, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 70
    .line 71
    .line 72
    move-result-object v5

    .line 73
    const-string v0, "tooltips_type"

    .line 74
    .line 75
    const-string v4, "red_dot"

    .line 76
    .line 77
    invoke-static {v0, v4}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 78
    .line 79
    .line 80
    move-result-object v6

    .line 81
    const-string v0, "tooltips_type_ui"

    .line 82
    .line 83
    invoke-static {v2, p1}, Ll/tft;->a(ZI)Ljava/lang/String;

    .line 84
    .line 85
    .line 86
    move-result-object v4

    .line 87
    invoke-static {v0, v4}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 88
    .line 89
    .line 90
    move-result-object v7

    .line 91
    if-eqz v2, :cond_4

    .line 92
    .line 93
    const-string v0, "live_icon"

    .line 94
    .line 95
    goto :goto_6

    .line 96
    :cond_4
    const-string v0, "bubble_live_followed"

    .line 97
    .line 98
    :goto_6
    const-string v4, "tooltips_trigger_module"

    .line 99
    .line 100
    invoke-static {v4, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 101
    .line 102
    .line 103
    move-result-object v8

    .line 104
    if-eqz v2, :cond_5

    .line 105
    .line 106
    const-string v0, "swipe_page"

    .line 107
    .line 108
    goto :goto_7

    .line 109
    :cond_5
    const-string v0, "live_explore"

    .line 110
    .line 111
    :goto_7
    const-string v2, "tooltips_trigger_page"

    .line 112
    .line 113
    invoke-static {v2, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 114
    .line 115
    .line 116
    move-result-object v9

    .line 117
    const-string v0, "red_dot_state"

    .line 118
    .line 119
    const-string v2, "on"

    .line 120
    .line 121
    invoke-static {v0, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 122
    .line 123
    .line 124
    move-result-object v10

    .line 125
    if-lez p1, :cond_6

    .line 126
    .line 127
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 128
    .line 129
    .line 130
    move-result-object v1

    .line 131
    :cond_6
    const-string p1, "red_dot_num"

    .line 132
    .line 133
    invoke-static {p1, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 134
    .line 135
    .line 136
    move-result-object v11

    .line 137
    const-string p1, "tooltips_trigger_reason"

    .line 138
    .line 139
    invoke-virtual {v3}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 140
    .line 141
    .line 142
    move-result-object v0

    .line 143
    invoke-static {p1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 144
    .line 145
    .line 146
    move-result-object v12

    .line 147
    filled-new-array/range {v5 .. v12}, [Ll/pf60;

    .line 148
    .line 149
    .line 150
    move-result-object p1

    .line 151
    const-string v0, "e_red_dot_entertainment_icon"

    .line 152
    .line 153
    invoke-static {v0, p0, p1}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 154
    .line 155
    .line 156
    return-void
.end method

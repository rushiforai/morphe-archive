.class public Ll/amd0;
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

.method public static a(Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;)V
    .locals 4

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    goto/16 :goto_4

    .line 4
    .line 5
    :cond_0
    new-instance v0, Lorg/json/JSONObject;

    .line 6
    .line 7
    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 8
    .line 9
    .line 10
    :try_start_0
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->anchor:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLiveAnchor;

    .line 11
    .line 12
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLiveAnchor;->location:Lcom/p1/mobile/putong/data/Location;

    .line 13
    .line 14
    invoke-static {v1}, Ll/xau;->x(Lcom/p1/mobile/putong/data/Location;)Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    if-eqz v1, :cond_2

    .line 19
    .line 20
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveTrackShowLabel;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveTrackShowLabel;

    .line 21
    .line 22
    .line 23
    move-result-object v2

    .line 24
    iput-object v1, v2, Lcom/p1/mobile/putong/live/base/data/BLiveTrackShowLabel;->distance:Ljava/lang/String;

    .line 25
    .line 26
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->room:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLiveRoom;

    .line 27
    .line 28
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLiveRoom;->title:Ljava/lang/String;

    .line 29
    .line 30
    iput-object v1, v2, Lcom/p1/mobile/putong/live/base/data/BLiveTrackShowLabel;->room_name:Ljava/lang/String;

    .line 31
    .line 32
    iget v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->memberCount:I

    .line 33
    .line 34
    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    iput-object v1, v2, Lcom/p1/mobile/putong/live/base/data/BLiveTrackShowLabel;->viewer:Ljava/lang/String;

    .line 39
    .line 40
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->specialLabel:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLabel;

    .line 41
    .line 42
    if-nez v1, :cond_1

    .line 43
    .line 44
    const-string v1, ""

    .line 45
    .line 46
    goto :goto_0

    .line 47
    :catch_0
    move-exception v1

    .line 48
    goto :goto_1

    .line 49
    :cond_1
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLabel;->value:Ljava/lang/String;

    .line 50
    .line 51
    :goto_0
    iput-object v1, v2, Lcom/p1/mobile/putong/live/base/data/BLiveTrackShowLabel;->label_name:Ljava/lang/String;

    .line 52
    .line 53
    const-string v1, "distance"

    .line 54
    .line 55
    iget-object v3, v2, Lcom/p1/mobile/putong/live/base/data/BLiveTrackShowLabel;->distance:Ljava/lang/String;

    .line 56
    .line 57
    invoke-virtual {v0, v1, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 58
    .line 59
    .line 60
    const-string v1, "room_name"

    .line 61
    .line 62
    iget-object v3, v2, Lcom/p1/mobile/putong/live/base/data/BLiveTrackShowLabel;->room_name:Ljava/lang/String;

    .line 63
    .line 64
    invoke-virtual {v0, v1, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 65
    .line 66
    .line 67
    const-string v1, "label_name"

    .line 68
    .line 69
    iget-object v3, v2, Lcom/p1/mobile/putong/live/base/data/BLiveTrackShowLabel;->label_name:Ljava/lang/String;

    .line 70
    .line 71
    invoke-virtual {v0, v1, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 72
    .line 73
    .line 74
    const-string v1, "viewer"

    .line 75
    .line 76
    iget-object v2, v2, Lcom/p1/mobile/putong/live/base/data/BLiveTrackShowLabel;->viewer:Ljava/lang/String;

    .line 77
    .line 78
    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 79
    .line 80
    .line 81
    goto :goto_2

    .line 82
    :goto_1
    invoke-static {v1}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 83
    .line 84
    .line 85
    invoke-static {v1}, Ll/wu80;->b(Ljava/lang/Exception;)V

    .line 86
    .line 87
    .line 88
    :cond_2
    :goto_2
    invoke-static {}, Ll/kfd0;->x()Ll/kfd0$a;

    .line 89
    .line 90
    .line 91
    move-result-object v1

    .line 92
    invoke-virtual {v1, p1}, Ll/kfd0$a;->c(Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;)Ll/kfd0$a;

    .line 93
    .line 94
    .line 95
    move-result-object v1

    .line 96
    const/4 v2, 0x1

    .line 97
    invoke-virtual {v1, v2}, Ll/kfd0$a;->l(I)Ll/kfd0$a;

    .line 98
    .line 99
    .line 100
    move-result-object v1

    .line 101
    const-string v2, "page"

    .line 102
    .line 103
    invoke-virtual {v1, v2}, Ll/kfd0$a;->w(Ljava/lang/String;)Ll/kfd0$a;

    .line 104
    .line 105
    .line 106
    move-result-object v1

    .line 107
    invoke-virtual {v1, v0}, Ll/kfd0$a;->A(Ljava/lang/Object;)Ll/kfd0$a;

    .line 108
    .line 109
    .line 110
    move-result-object v0

    .line 111
    const-string v1, "0"

    .line 112
    .line 113
    invoke-virtual {v0, v1}, Ll/kfd0$a;->p(Ljava/lang/String;)Ll/kfd0$a;

    .line 114
    .line 115
    .line 116
    move-result-object v0

    .line 117
    const/4 v1, 0x0

    .line 118
    invoke-virtual {v0, v1}, Ll/kfd0$a;->o(Z)Ll/kfd0$a;

    .line 119
    .line 120
    .line 121
    move-result-object v0

    .line 122
    invoke-virtual {v0}, Ll/kfd0$a;->a()Ll/kfd0;

    .line 123
    .line 124
    .line 125
    move-result-object v0

    .line 126
    new-instance v1, Ljava/util/HashMap;

    .line 127
    .line 128
    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 129
    .line 130
    .line 131
    const-string v2, "module"

    .line 132
    .line 133
    const-string v3, "no_action_toast"

    .line 134
    .line 135
    invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 136
    .line 137
    .line 138
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->redPacketIds:Ljava/util/List;

    .line 139
    .line 140
    if-eqz p1, :cond_4

    .line 141
    .line 142
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 143
    .line 144
    .line 145
    move-result p1

    .line 146
    if-eqz p1, :cond_3

    .line 147
    .line 148
    const-string p1, "true"

    .line 149
    .line 150
    goto :goto_3

    .line 151
    :cond_3
    const-string p1, "false"

    .line 152
    .line 153
    :goto_3
    const-string v2, "redpacket_icon"

    .line 154
    .line 155
    invoke-virtual {v1, v2, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 156
    .line 157
    .line 158
    :cond_4
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 159
    .line 160
    .line 161
    move-result p1

    .line 162
    if-nez p1, :cond_5

    .line 163
    .line 164
    invoke-virtual {v0, v1}, Ll/kfd0;->w(Ljava/util/Map;)Ljava/util/Map;

    .line 165
    .line 166
    .line 167
    move-result-object p1

    .line 168
    invoke-static {p0, p1}, Ll/bfu;->e(Ljava/lang/String;Ljava/util/Map;)V

    .line 169
    .line 170
    .line 171
    :cond_5
    :goto_4
    return-void
.end method

.method public static b(Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;)V
    .locals 4

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    goto/16 :goto_4

    .line 4
    .line 5
    :cond_0
    new-instance v0, Lorg/json/JSONObject;

    .line 6
    .line 7
    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 8
    .line 9
    .line 10
    :try_start_0
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->anchor:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLiveAnchor;

    .line 11
    .line 12
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLiveAnchor;->location:Lcom/p1/mobile/putong/data/Location;

    .line 13
    .line 14
    invoke-static {v1}, Ll/xau;->x(Lcom/p1/mobile/putong/data/Location;)Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    if-eqz v1, :cond_2

    .line 19
    .line 20
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveTrackShowLabel;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveTrackShowLabel;

    .line 21
    .line 22
    .line 23
    move-result-object v2

    .line 24
    iput-object v1, v2, Lcom/p1/mobile/putong/live/base/data/BLiveTrackShowLabel;->distance:Ljava/lang/String;

    .line 25
    .line 26
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->room:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLiveRoom;

    .line 27
    .line 28
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLiveRoom;->title:Ljava/lang/String;

    .line 29
    .line 30
    iput-object v1, v2, Lcom/p1/mobile/putong/live/base/data/BLiveTrackShowLabel;->room_name:Ljava/lang/String;

    .line 31
    .line 32
    iget v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->memberCount:I

    .line 33
    .line 34
    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    iput-object v1, v2, Lcom/p1/mobile/putong/live/base/data/BLiveTrackShowLabel;->viewer:Ljava/lang/String;

    .line 39
    .line 40
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->specialLabel:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLabel;

    .line 41
    .line 42
    if-nez v1, :cond_1

    .line 43
    .line 44
    const-string v1, ""

    .line 45
    .line 46
    goto :goto_0

    .line 47
    :catch_0
    move-exception v1

    .line 48
    goto :goto_1

    .line 49
    :cond_1
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLabel;->value:Ljava/lang/String;

    .line 50
    .line 51
    :goto_0
    iput-object v1, v2, Lcom/p1/mobile/putong/live/base/data/BLiveTrackShowLabel;->label_name:Ljava/lang/String;

    .line 52
    .line 53
    const-string v1, "distance"

    .line 54
    .line 55
    iget-object v3, v2, Lcom/p1/mobile/putong/live/base/data/BLiveTrackShowLabel;->distance:Ljava/lang/String;

    .line 56
    .line 57
    invoke-virtual {v0, v1, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 58
    .line 59
    .line 60
    const-string v1, "room_name"

    .line 61
    .line 62
    iget-object v3, v2, Lcom/p1/mobile/putong/live/base/data/BLiveTrackShowLabel;->room_name:Ljava/lang/String;

    .line 63
    .line 64
    invoke-virtual {v0, v1, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 65
    .line 66
    .line 67
    const-string v1, "label_name"

    .line 68
    .line 69
    iget-object v3, v2, Lcom/p1/mobile/putong/live/base/data/BLiveTrackShowLabel;->label_name:Ljava/lang/String;

    .line 70
    .line 71
    invoke-virtual {v0, v1, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 72
    .line 73
    .line 74
    const-string v1, "viewer"

    .line 75
    .line 76
    iget-object v2, v2, Lcom/p1/mobile/putong/live/base/data/BLiveTrackShowLabel;->viewer:Ljava/lang/String;

    .line 77
    .line 78
    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 79
    .line 80
    .line 81
    goto :goto_2

    .line 82
    :goto_1
    invoke-static {v1}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 83
    .line 84
    .line 85
    invoke-static {v1}, Ll/wu80;->b(Ljava/lang/Exception;)V

    .line 86
    .line 87
    .line 88
    :cond_2
    :goto_2
    invoke-static {}, Ll/kfd0;->x()Ll/kfd0$a;

    .line 89
    .line 90
    .line 91
    move-result-object v1

    .line 92
    invoke-virtual {v1, p1}, Ll/kfd0$a;->c(Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;)Ll/kfd0$a;

    .line 93
    .line 94
    .line 95
    move-result-object v1

    .line 96
    const/4 v2, 0x1

    .line 97
    invoke-virtual {v1, v2}, Ll/kfd0$a;->l(I)Ll/kfd0$a;

    .line 98
    .line 99
    .line 100
    move-result-object v1

    .line 101
    const-string v2, "page"

    .line 102
    .line 103
    invoke-virtual {v1, v2}, Ll/kfd0$a;->w(Ljava/lang/String;)Ll/kfd0$a;

    .line 104
    .line 105
    .line 106
    move-result-object v1

    .line 107
    invoke-virtual {v1, v0}, Ll/kfd0$a;->A(Ljava/lang/Object;)Ll/kfd0$a;

    .line 108
    .line 109
    .line 110
    move-result-object v0

    .line 111
    const-string v1, "0"

    .line 112
    .line 113
    invoke-virtual {v0, v1}, Ll/kfd0$a;->p(Ljava/lang/String;)Ll/kfd0$a;

    .line 114
    .line 115
    .line 116
    move-result-object v0

    .line 117
    const/4 v1, 0x0

    .line 118
    invoke-virtual {v0, v1}, Ll/kfd0$a;->o(Z)Ll/kfd0$a;

    .line 119
    .line 120
    .line 121
    move-result-object v0

    .line 122
    invoke-virtual {v0}, Ll/kfd0$a;->a()Ll/kfd0;

    .line 123
    .line 124
    .line 125
    move-result-object v0

    .line 126
    new-instance v1, Ljava/util/HashMap;

    .line 127
    .line 128
    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 129
    .line 130
    .line 131
    const-string v2, "module"

    .line 132
    .line 133
    const-string v3, "no_action_toast"

    .line 134
    .line 135
    invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 136
    .line 137
    .line 138
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->redPacketIds:Ljava/util/List;

    .line 139
    .line 140
    if-eqz p1, :cond_4

    .line 141
    .line 142
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 143
    .line 144
    .line 145
    move-result p1

    .line 146
    if-eqz p1, :cond_3

    .line 147
    .line 148
    const-string p1, "true"

    .line 149
    .line 150
    goto :goto_3

    .line 151
    :cond_3
    const-string p1, "false"

    .line 152
    .line 153
    :goto_3
    const-string v2, "redpacket_icon"

    .line 154
    .line 155
    invoke-virtual {v1, v2, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 156
    .line 157
    .line 158
    :cond_4
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 159
    .line 160
    .line 161
    move-result p1

    .line 162
    if-nez p1, :cond_5

    .line 163
    .line 164
    invoke-virtual {v0, v1}, Ll/kfd0;->w(Ljava/util/Map;)Ljava/util/Map;

    .line 165
    .line 166
    .line 167
    move-result-object p1

    .line 168
    invoke-static {p0, p1}, Ll/bfu;->f(Ljava/lang/String;Ljava/util/Map;)V

    .line 169
    .line 170
    .line 171
    :cond_5
    :goto_4
    return-void
.end method

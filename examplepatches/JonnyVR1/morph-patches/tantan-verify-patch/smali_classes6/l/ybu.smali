.class public Ll/ybu;
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

.method public static a(I)Ll/r6s;
    .locals 1

    .line 1
    new-instance v0, Ll/r6s;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/r6s;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0, p0}, Ll/r6s;->r(I)V

    .line 7
    .line 8
    .line 9
    return-object v0
.end method

.method public static b(ILl/byu;Ljava/lang/String;)V
    .locals 5

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/base/apibean/LiveGoAction;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/apibean/LiveGoAction;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/live/base/apibean/LiveGoAction;->setType(I)V

    .line 7
    .line 8
    .line 9
    new-instance v1, Ljava/util/HashMap;

    .line 10
    .line 11
    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 12
    .line 13
    .line 14
    const/4 v2, 0x4

    .line 15
    const-string v3, "source"

    .line 16
    .line 17
    if-ne p0, v2, :cond_0

    .line 18
    .line 19
    iget-object p0, p1, Ll/byu;->live:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;

    .line 20
    .line 21
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->room:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLiveRoom;

    .line 22
    .line 23
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLiveRoom;->id:Ljava/lang/String;

    .line 24
    .line 25
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/live/base/apibean/LiveGoAction;->setGoData(Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    const-string p0, "suggested"

    .line 29
    .line 30
    invoke-virtual {v1, v3, p0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_0
    iget-object p0, p1, Ll/byu;->live:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;

    .line 35
    .line 36
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->id:Ljava/lang/String;

    .line 37
    .line 38
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/live/base/apibean/LiveGoAction;->setGoData(Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    iget-object p0, p1, Ll/byu;->live:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;

    .line 42
    .line 43
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->streamFlvUrl:Ljava/lang/String;

    .line 44
    .line 45
    const-string v2, "pullFlv"

    .line 46
    .line 47
    invoke-virtual {v1, v2, p0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 48
    .line 49
    .line 50
    iget-object p0, p1, Ll/byu;->live:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;

    .line 51
    .line 52
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->streamFlvUrlIpv6:Ljava/lang/String;

    .line 53
    .line 54
    const-string v2, "pullFlvIpv6"

    .line 55
    .line 56
    invoke-virtual {v1, v2, p0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 57
    .line 58
    .line 59
    iget-object p0, p1, Ll/byu;->live:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;

    .line 60
    .line 61
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->callback:Ljava/lang/String;

    .line 62
    .line 63
    const-string v2, "callback"

    .line 64
    .line 65
    invoke-virtual {v1, v2, p0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 66
    .line 67
    .line 68
    new-instance p0, Ljava/lang/StringBuilder;

    .line 69
    .line 70
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 71
    .line 72
    .line 73
    iget-object v2, p1, Ll/byu;->live:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;

    .line 74
    .line 75
    iget-object v2, v2, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->streamCdnInfo:Lcom/p1/mobile/putong/live/base/data/BLiveStreamCdnInfo;

    .line 76
    .line 77
    iget v2, v2, Lcom/p1/mobile/putong/live/base/data/BLiveStreamCdnInfo;->provider:I

    .line 78
    .line 79
    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 80
    .line 81
    .line 82
    const-string v2, ""

    .line 83
    .line 84
    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 85
    .line 86
    .line 87
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 88
    .line 89
    .line 90
    move-result-object p0

    .line 91
    const-string v4, "provider"

    .line 92
    .line 93
    invoke-virtual {v1, v4, p0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 94
    .line 95
    .line 96
    new-instance p0, Ljava/lang/StringBuilder;

    .line 97
    .line 98
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 99
    .line 100
    .line 101
    iget-object v4, p1, Ll/byu;->live:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;

    .line 102
    .line 103
    iget-object v4, v4, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->streamCdnInfo:Lcom/p1/mobile/putong/live/base/data/BLiveStreamCdnInfo;

    .line 104
    .line 105
    iget v4, v4, Lcom/p1/mobile/putong/live/base/data/BLiveStreamCdnInfo;->businessType:I

    .line 106
    .line 107
    invoke-virtual {p0, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 108
    .line 109
    .line 110
    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 111
    .line 112
    .line 113
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 114
    .line 115
    .line 116
    move-result-object p0

    .line 117
    const-string v2, "businessType"

    .line 118
    .line 119
    invoke-virtual {v1, v2, p0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 120
    .line 121
    .line 122
    iget-object p0, p1, Ll/byu;->live:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;

    .line 123
    .line 124
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->room:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLiveRoom;

    .line 125
    .line 126
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLiveRoom;->id:Ljava/lang/String;

    .line 127
    .line 128
    const-string v2, "roomId"

    .line 129
    .line 130
    invoke-virtual {v1, v2, p0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 131
    .line 132
    .line 133
    iget-object p0, p1, Ll/byu;->live:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;

    .line 134
    .line 135
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->liveMode:Ljava/lang/String;

    .line 136
    .line 137
    const-string v2, "liveMode"

    .line 138
    .line 139
    invoke-virtual {v1, v2, p0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 140
    .line 141
    .line 142
    invoke-virtual {v1, v3, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 143
    .line 144
    .line 145
    iget-object p0, p1, Ll/byu;->live:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;

    .line 146
    .line 147
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->getRecommendCategory()Ljava/lang/String;

    .line 148
    .line 149
    .line 150
    move-result-object p0

    .line 151
    const-string p2, "category"

    .line 152
    .line 153
    invoke-virtual {v1, p2, p0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 154
    .line 155
    .line 156
    :goto_0
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/base/apibean/LiveGoAction;->setGoExtra(Ljava/util/Map;)V

    .line 157
    .line 158
    .line 159
    iput-object v0, p1, Ll/byu;->localGoAction:Lcom/p1/mobile/putong/live/base/apibean/LiveGoAction;

    .line 160
    .line 161
    return-void
.end method

.method public static c(Ll/byu;ILjava/lang/String;)V
    .locals 7

    .line 1
    new-instance p1, Lorg/json/JSONObject;

    .line 2
    .line 3
    invoke-direct {p1}, Lorg/json/JSONObject;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/byu;->live:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;

    .line 7
    .line 8
    invoke-static {v0}, Ll/ybu;->d(Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;)Lcom/p1/mobile/putong/live/base/data/BLiveTrackShowLabel;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    const-string v1, "0"

    .line 13
    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    :try_start_0
    const-string v2, "distance"

    .line 17
    .line 18
    iget-object v3, v0, Lcom/p1/mobile/putong/live/base/data/BLiveTrackShowLabel;->distance:Ljava/lang/String;

    .line 19
    .line 20
    invoke-virtual {p1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 21
    .line 22
    .line 23
    const-string v2, "room_name"

    .line 24
    .line 25
    iget-object v3, v0, Lcom/p1/mobile/putong/live/base/data/BLiveTrackShowLabel;->room_name:Ljava/lang/String;

    .line 26
    .line 27
    invoke-virtual {p1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 28
    .line 29
    .line 30
    const-string v2, "label_name"

    .line 31
    .line 32
    iget-object v3, v0, Lcom/p1/mobile/putong/live/base/data/BLiveTrackShowLabel;->label_name:Ljava/lang/String;

    .line 33
    .line 34
    invoke-virtual {p1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 35
    .line 36
    .line 37
    const-string v2, "viewer"

    .line 38
    .line 39
    iget-object v3, v0, Lcom/p1/mobile/putong/live/base/data/BLiveTrackShowLabel;->viewer:Ljava/lang/String;

    .line 40
    .line 41
    invoke-virtual {p1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 42
    .line 43
    .line 44
    const-string v2, "label_name_top"

    .line 45
    .line 46
    iget-object v3, v0, Lcom/p1/mobile/putong/live/base/data/BLiveTrackShowLabel;->label_name_top:Ljava/lang/String;

    .line 47
    .line 48
    invoke-virtual {p1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 49
    .line 50
    .line 51
    const-string v2, "label_name_sp"

    .line 52
    .line 53
    iget-object v3, v0, Lcom/p1/mobile/putong/live/base/data/BLiveTrackShowLabel;->label_name_sp:Ljava/lang/String;

    .line 54
    .line 55
    invoke-virtual {p1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 56
    .line 57
    .line 58
    const-string v2, "label_name_tool"

    .line 59
    .line 60
    iget-object v3, v0, Lcom/p1/mobile/putong/live/base/data/BLiveTrackShowLabel;->label_name_tool:Ljava/lang/String;

    .line 61
    .line 62
    invoke-virtual {p1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 63
    .line 64
    .line 65
    const-string v2, "state_label"

    .line 66
    .line 67
    iget-object v3, v0, Lcom/p1/mobile/putong/live/base/data/BLiveTrackShowLabel;->state_label:Ljava/lang/String;

    .line 68
    .line 69
    invoke-virtual {p1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 70
    .line 71
    .line 72
    const-string v2, "label_name_custom"

    .line 73
    .line 74
    iget-object v3, v0, Lcom/p1/mobile/putong/live/base/data/BLiveTrackShowLabel;->label_name_custom:Ljava/lang/String;

    .line 75
    .line 76
    invoke-virtual {p1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 77
    .line 78
    .line 79
    const-string v2, "label_name_fixed"

    .line 80
    .line 81
    iget-object v3, v0, Lcom/p1/mobile/putong/live/base/data/BLiveTrackShowLabel;->label_name_fixed:Ljava/lang/String;

    .line 82
    .line 83
    invoke-virtual {p1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 84
    .line 85
    .line 86
    iget-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveTrackShowLabel;->have_red_packet:Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 87
    .line 88
    goto :goto_0

    .line 89
    :catch_0
    move-exception v0

    .line 90
    invoke-static {v0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 91
    .line 92
    .line 93
    invoke-static {v0}, Ll/wu80;->b(Ljava/lang/Exception;)V

    .line 94
    .line 95
    .line 96
    :cond_0
    :goto_0
    iget-object v0, p0, Ll/byu;->live:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;

    .line 97
    .line 98
    const-string v2, "off"

    .line 99
    .line 100
    const-string v3, "stopped"

    .line 101
    .line 102
    if-eqz v0, :cond_3

    .line 103
    .line 104
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->state:Ljava/lang/String;

    .line 105
    .line 106
    invoke-static {v0, v3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 107
    .line 108
    .line 109
    move-result v0

    .line 110
    if-eqz v0, :cond_1

    .line 111
    .line 112
    move-object v0, v2

    .line 113
    goto :goto_1

    .line 114
    :cond_1
    iget-object v0, p0, Ll/byu;->live:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;

    .line 115
    .line 116
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->multiCallInfo:Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallInfo;

    .line 117
    .line 118
    if-eqz v0, :cond_2

    .line 119
    .line 120
    iget-boolean v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallInfo;->onGoing:Z

    .line 121
    .line 122
    if-eqz v0, :cond_2

    .line 123
    .line 124
    const-string v0, "video_live"

    .line 125
    .line 126
    goto :goto_1

    .line 127
    :cond_2
    const-string v0, "common_live"

    .line 128
    .line 129
    goto :goto_1

    .line 130
    :cond_3
    const-string v0, "NA"

    .line 131
    .line 132
    :goto_1
    new-instance v4, Lcom/p1/mobile/putong/live/base/apibean/LiveCardTrackData;

    .line 133
    .line 134
    invoke-direct {v4}, Lcom/p1/mobile/putong/live/base/apibean/LiveCardTrackData;-><init>()V

    .line 135
    .line 136
    .line 137
    invoke-virtual {v4, p2}, Lcom/p1/mobile/putong/live/base/apibean/LiveCardTrackData;->setPageId(Ljava/lang/String;)V

    .line 138
    .line 139
    .line 140
    const-string p2, "e_live_room_enter"

    .line 141
    .line 142
    invoke-virtual {v4, p2}, Lcom/p1/mobile/putong/live/base/apibean/LiveCardTrackData;->setModuleId(Ljava/lang/String;)V

    .line 143
    .line 144
    .line 145
    const-string p2, "right_recommend_type"

    .line 146
    .line 147
    const-string v5, ""

    .line 148
    .line 149
    invoke-virtual {v4, p2, v5}, Ljava/util/AbstractMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 150
    .line 151
    .line 152
    const-string p2, "trace_id"

    .line 153
    .line 154
    invoke-virtual {v4, p2, v5}, Ljava/util/AbstractMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 155
    .line 156
    .line 157
    iget-object p2, p0, Ll/byu;->live:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;

    .line 158
    .line 159
    invoke-virtual {p2}, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->getRecommendCategory()Ljava/lang/String;

    .line 160
    .line 161
    .line 162
    move-result-object p2

    .line 163
    const-string v6, "liveRecommendCategory"

    .line 164
    .line 165
    invoke-virtual {v4, v6, p2}, Ljava/util/AbstractMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 166
    .line 167
    .line 168
    const-string p2, "module"

    .line 169
    .line 170
    const-string v6, "page"

    .line 171
    .line 172
    invoke-virtual {v4, p2, v6}, Ljava/util/AbstractMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 173
    .line 174
    .line 175
    const-string p2, "live_room_live_type"

    .line 176
    .line 177
    invoke-virtual {v4, p2, v0}, Ljava/util/AbstractMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 178
    .line 179
    .line 180
    const-string p2, "window_type"

    .line 181
    .line 182
    invoke-virtual {v4, p2, v5}, Ljava/util/AbstractMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 183
    .line 184
    .line 185
    const-string p2, "index"

    .line 186
    .line 187
    invoke-virtual {v4, p2, v5}, Ljava/util/AbstractMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 188
    .line 189
    .line 190
    iget-object p2, p0, Ll/byu;->live:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;

    .line 191
    .line 192
    iget-object p2, p2, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->anchor:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLiveAnchor;

    .line 193
    .line 194
    iget-object p2, p2, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLiveAnchor;->id:Ljava/lang/String;

    .line 195
    .line 196
    const-string v0, "anchorId"

    .line 197
    .line 198
    invoke-virtual {v4, v0, p2}, Ljava/util/AbstractMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 199
    .line 200
    .line 201
    iget-object p2, p0, Ll/byu;->live:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;

    .line 202
    .line 203
    iget-object p2, p2, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->id:Ljava/lang/String;

    .line 204
    .line 205
    const-string v0, "liveId"

    .line 206
    .line 207
    invoke-virtual {v4, v0, p2}, Ljava/util/AbstractMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 208
    .line 209
    .line 210
    const-string p2, "from"

    .line 211
    .line 212
    invoke-virtual {v4, p2, v5}, Ljava/util/AbstractMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 213
    .line 214
    .line 215
    const-string p2, "redpacket_icon"

    .line 216
    .line 217
    invoke-virtual {v4, p2, v1}, Ljava/util/AbstractMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 218
    .line 219
    .line 220
    iget-object p2, p0, Ll/byu;->live:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;

    .line 221
    .line 222
    iget-object p2, p2, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->state:Ljava/lang/String;

    .line 223
    .line 224
    invoke-static {p2, v3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 225
    .line 226
    .line 227
    move-result p2

    .line 228
    if-eqz p2, :cond_4

    .line 229
    .line 230
    goto :goto_2

    .line 231
    :cond_4
    const-string v2, "on"

    .line 232
    .line 233
    :goto_2
    const-string p2, "live_status"

    .line 234
    .line 235
    invoke-virtual {v4, p2, v2}, Ljava/util/AbstractMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 236
    .line 237
    .line 238
    const-string p2, "show_label"

    .line 239
    .line 240
    invoke-virtual {v4, p2, p1}, Ljava/util/AbstractMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 241
    .line 242
    .line 243
    invoke-virtual {p0, v4}, Ll/byu;->c(Lcom/p1/mobile/putong/live/base/apibean/LiveCardTrackData;)V

    .line 244
    .line 245
    .line 246
    return-void
.end method

.method public static d(Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;)Lcom/p1/mobile/putong/live/base/data/BLiveTrackShowLabel;
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->anchor:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLiveAnchor;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLiveAnchor;->location:Lcom/p1/mobile/putong/data/Location;

    .line 4
    .line 5
    invoke-static {v0}, Ll/xau;->x(Lcom/p1/mobile/putong/data/Location;)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    return-object p0

    .line 13
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveTrackShowLabel;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveTrackShowLabel;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    iput-object v0, v1, Lcom/p1/mobile/putong/live/base/data/BLiveTrackShowLabel;->distance:Ljava/lang/String;

    .line 18
    .line 19
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->room:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLiveRoom;

    .line 20
    .line 21
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLiveRoom;->title:Ljava/lang/String;

    .line 22
    .line 23
    iput-object v0, v1, Lcom/p1/mobile/putong/live/base/data/BLiveTrackShowLabel;->room_name:Ljava/lang/String;

    .line 24
    .line 25
    iget v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->memberCount:I

    .line 26
    .line 27
    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    iput-object v0, v1, Lcom/p1/mobile/putong/live/base/data/BLiveTrackShowLabel;->viewer:Ljava/lang/String;

    .line 32
    .line 33
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->specialLabel:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLabel;

    .line 34
    .line 35
    if-nez v0, :cond_1

    .line 36
    .line 37
    const-string v0, ""

    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_1
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLabel;->value:Ljava/lang/String;

    .line 41
    .line 42
    :goto_0
    iput-object v0, v1, Lcom/p1/mobile/putong/live/base/data/BLiveTrackShowLabel;->label_name:Ljava/lang/String;

    .line 43
    .line 44
    const-string v0, "0"

    .line 45
    .line 46
    iput-object v0, v1, Lcom/p1/mobile/putong/live/base/data/BLiveTrackShowLabel;->have_red_packet:Ljava/lang/String;

    .line 47
    .line 48
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->coverLabelsV2:Ljava/util/List;

    .line 49
    .line 50
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 51
    .line 52
    .line 53
    move-result v0

    .line 54
    if-nez v0, :cond_6

    .line 55
    .line 56
    const/4 v0, 0x0

    .line 57
    move v2, v0

    .line 58
    :goto_1
    iget-object v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->coverLabelsV2:Ljava/util/List;

    .line 59
    .line 60
    invoke-interface {v3}, Ljava/util/List;->size()I

    .line 61
    .line 62
    .line 63
    move-result v3

    .line 64
    iget-object v4, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->coverLabelsV2:Ljava/util/List;

    .line 65
    .line 66
    if-ge v2, v3, :cond_5

    .line 67
    .line 68
    invoke-interface {v4, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 69
    .line 70
    .line 71
    move-result-object v3

    .line 72
    check-cast v3, Lcom/p1/mobile/putong/live/base/data/BLiveCoverLabel;

    .line 73
    .line 74
    iget-object v3, v3, Lcom/p1/mobile/putong/live/base/data/BLiveCoverLabel;->type:Ljava/lang/String;

    .line 75
    .line 76
    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 77
    .line 78
    .line 79
    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    .line 80
    .line 81
    .line 82
    move-result v4

    .line 83
    const/4 v5, -0x1

    .line 84
    packed-switch v4, :pswitch_data_0

    .line 85
    .line 86
    .line 87
    goto :goto_2

    .line 88
    :pswitch_0
    const-string v4, "C"

    .line 89
    .line 90
    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 91
    .line 92
    .line 93
    move-result v3

    .line 94
    if-nez v3, :cond_2

    .line 95
    .line 96
    goto :goto_2

    .line 97
    :cond_2
    const/4 v5, 0x2

    .line 98
    goto :goto_2

    .line 99
    :pswitch_1
    const-string v4, "B"

    .line 100
    .line 101
    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 102
    .line 103
    .line 104
    move-result v3

    .line 105
    if-nez v3, :cond_3

    .line 106
    .line 107
    goto :goto_2

    .line 108
    :cond_3
    const/4 v5, 0x1

    .line 109
    goto :goto_2

    .line 110
    :pswitch_2
    const-string v4, "A"

    .line 111
    .line 112
    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 113
    .line 114
    .line 115
    move-result v3

    .line 116
    if-nez v3, :cond_4

    .line 117
    .line 118
    goto :goto_2

    .line 119
    :cond_4
    move v5, v0

    .line 120
    :goto_2
    packed-switch v5, :pswitch_data_1

    .line 121
    .line 122
    .line 123
    goto :goto_3

    .line 124
    :pswitch_3
    iget-object v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->coverLabelsV2:Ljava/util/List;

    .line 125
    .line 126
    invoke-interface {v3, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 127
    .line 128
    .line 129
    move-result-object v3

    .line 130
    check-cast v3, Lcom/p1/mobile/putong/live/base/data/BLiveCoverLabel;

    .line 131
    .line 132
    iget-object v3, v3, Lcom/p1/mobile/putong/live/base/data/BLiveCoverLabel;->name:Ljava/lang/String;

    .line 133
    .line 134
    iput-object v3, v1, Lcom/p1/mobile/putong/live/base/data/BLiveTrackShowLabel;->label_name_fixed:Ljava/lang/String;

    .line 135
    .line 136
    goto :goto_3

    .line 137
    :pswitch_4
    iget-object v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->coverLabelsV2:Ljava/util/List;

    .line 138
    .line 139
    invoke-interface {v3, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 140
    .line 141
    .line 142
    move-result-object v3

    .line 143
    check-cast v3, Lcom/p1/mobile/putong/live/base/data/BLiveCoverLabel;

    .line 144
    .line 145
    iget-object v3, v3, Lcom/p1/mobile/putong/live/base/data/BLiveCoverLabel;->name:Ljava/lang/String;

    .line 146
    .line 147
    iput-object v3, v1, Lcom/p1/mobile/putong/live/base/data/BLiveTrackShowLabel;->label_name_custom:Ljava/lang/String;

    .line 148
    .line 149
    goto :goto_3

    .line 150
    :pswitch_5
    iget-object v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->coverLabelsV2:Ljava/util/List;

    .line 151
    .line 152
    invoke-interface {v3, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 153
    .line 154
    .line 155
    move-result-object v3

    .line 156
    check-cast v3, Lcom/p1/mobile/putong/live/base/data/BLiveCoverLabel;

    .line 157
    .line 158
    iget-object v3, v3, Lcom/p1/mobile/putong/live/base/data/BLiveCoverLabel;->name:Ljava/lang/String;

    .line 159
    .line 160
    iput-object v3, v1, Lcom/p1/mobile/putong/live/base/data/BLiveTrackShowLabel;->label_name:Ljava/lang/String;

    .line 161
    .line 162
    :goto_3
    add-int/lit8 v2, v2, 0x1

    .line 163
    .line 164
    goto :goto_1

    .line 165
    :cond_5
    invoke-static {v4}, Lcom/p1/mobile/putong/live/base/view/LiveNewOptLabelView;->B(Ljava/util/List;)Ljava/lang/String;

    .line 166
    .line 167
    .line 168
    move-result-object p0

    .line 169
    iput-object p0, v1, Lcom/p1/mobile/putong/live/base/data/BLiveTrackShowLabel;->have_red_packet:Ljava/lang/String;

    .line 170
    .line 171
    :cond_6
    return-object v1

    .line 172
    nop

    .line 173
    :pswitch_data_0
    .packed-switch 0x41
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch

    .line 174
    .line 175
    .line 176
    .line 177
    .line 178
    .line 179
    .line 180
    .line 181
    .line 182
    .line 183
    :pswitch_data_1
    .packed-switch 0x0
        :pswitch_5
        :pswitch_4
        :pswitch_3
    .end packed-switch
.end method

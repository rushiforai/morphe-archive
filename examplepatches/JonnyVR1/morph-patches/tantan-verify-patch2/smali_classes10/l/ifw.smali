.class public Ll/ifw;
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

.method public static a(Landroid/content/Context;Lcom/p1/mobile/putong/live/base/data/BLiveLovePlanet;Ljava/util/HashMap;)Ll/w2m;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Lcom/p1/mobile/putong/live/base/data/BLiveLovePlanet;",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ll/w2m;",
            ">;)",
            "Ll/w2m;"
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    if-eqz p1, :cond_2

    .line 3
    .line 4
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveLovePlanet;->stage:Lcom/p1/mobile/putong/live/base/data/LovePlanetStage;

    .line 5
    .line 6
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    const-string v2, "unknown_"

    .line 11
    .line 12
    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    if-nez v1, :cond_2

    .line 17
    .line 18
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveLovePlanet;->stage:Lcom/p1/mobile/putong/live/base/data/LovePlanetStage;

    .line 19
    .line 20
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    const-string v2, "prepare"

    .line 25
    .line 26
    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 27
    .line 28
    .line 29
    move-result v1

    .line 30
    if-nez v1, :cond_2

    .line 31
    .line 32
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveLovePlanet;->stage:Lcom/p1/mobile/putong/live/base/data/LovePlanetStage;

    .line 33
    .line 34
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    const-string v2, "introduction"

    .line 39
    .line 40
    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 41
    .line 42
    .line 43
    move-result v1

    .line 44
    if-nez v1, :cond_2

    .line 45
    .line 46
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveLovePlanet;->stage:Lcom/p1/mobile/putong/live/base/data/LovePlanetStage;

    .line 47
    .line 48
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object v1

    .line 52
    const-string v2, "choice"

    .line 53
    .line 54
    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 55
    .line 56
    .line 57
    move-result v1

    .line 58
    if-eqz v1, :cond_0

    .line 59
    .line 60
    goto :goto_0

    .line 61
    :cond_0
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveLovePlanet;->teamInfos:Ljava/util/List;

    .line 62
    .line 63
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 64
    .line 65
    .line 66
    move-result v1

    .line 67
    if-eqz v1, :cond_1

    .line 68
    .line 69
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveLovePlanet;->teamInfos:Ljava/util/List;

    .line 70
    .line 71
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 72
    .line 73
    .line 74
    move-result p1

    .line 75
    const/4 v1, 0x2

    .line 76
    if-ne p1, v1, :cond_1

    .line 77
    .line 78
    const-string p1, "stage_team_two"

    .line 79
    .line 80
    invoke-virtual {p2, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 81
    .line 82
    .line 83
    move-result-object v1

    .line 84
    check-cast v1, Ll/w2m;

    .line 85
    .line 86
    if-nez v1, :cond_3

    .line 87
    .line 88
    invoke-static {p0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 89
    .line 90
    .line 91
    move-result-object p0

    .line 92
    sget v1, Ll/yec0;->Ua:I

    .line 93
    .line 94
    invoke-virtual {p0, v1, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 95
    .line 96
    .line 97
    move-result-object p0

    .line 98
    move-object v1, p0

    .line 99
    check-cast v1, Ll/w2m;

    .line 100
    .line 101
    goto :goto_1

    .line 102
    :cond_1
    const-string p1, "stage_team_other"

    .line 103
    .line 104
    invoke-virtual {p2, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 105
    .line 106
    .line 107
    move-result-object v1

    .line 108
    check-cast v1, Ll/w2m;

    .line 109
    .line 110
    if-nez v1, :cond_3

    .line 111
    .line 112
    invoke-static {p0}, Ll/p9r;->a(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 113
    .line 114
    .line 115
    move-result-object p0

    .line 116
    sget v1, Ll/yec0;->Ta:I

    .line 117
    .line 118
    invoke-virtual {p0, v1, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 119
    .line 120
    .line 121
    move-result-object p0

    .line 122
    move-object v1, p0

    .line 123
    check-cast v1, Ll/w2m;

    .line 124
    .line 125
    goto :goto_1

    .line 126
    :cond_2
    :goto_0
    const-string p1, "stage_before_team"

    .line 127
    .line 128
    invoke-virtual {p2, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 129
    .line 130
    .line 131
    move-result-object v1

    .line 132
    check-cast v1, Ll/w2m;

    .line 133
    .line 134
    if-nez v1, :cond_3

    .line 135
    .line 136
    invoke-static {p0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 137
    .line 138
    .line 139
    move-result-object p0

    .line 140
    sget v1, Ll/yec0;->Sa:I

    .line 141
    .line 142
    invoke-virtual {p0, v1, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 143
    .line 144
    .line 145
    move-result-object p0

    .line 146
    move-object v1, p0

    .line 147
    check-cast v1, Ll/w2m;

    .line 148
    .line 149
    :cond_3
    :goto_1
    invoke-virtual {p2, p1, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 150
    .line 151
    .line 152
    return-object v1
.end method

.method public static b(Lcom/p1/mobile/putong/live/base/data/BLiveLovePlanet;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;Lcom/p1/mobile/putong/live/base/data/BLiveLovePlanetPlayerInfo;)Ljava/lang/String;
    .locals 7

    .line 1
    const-string v0, "\u52a0\u5165\u6e38\u620f"

    .line 2
    .line 3
    const-string v1, "\u5df2\u7533\u8bf7"

    .line 4
    .line 5
    const-string v2, ""

    .line 6
    .line 7
    if-nez p0, :cond_2

    .line 8
    .line 9
    invoke-static {p1}, Ll/guk0;->m(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    return-object v1

    .line 16
    :cond_0
    invoke-static {p1}, Ll/guk0;->h(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)Z

    .line 17
    .line 18
    .line 19
    move-result p0

    .line 20
    if-eqz p0, :cond_1

    .line 21
    .line 22
    return-object v2

    .line 23
    :cond_1
    return-object v0

    .line 24
    :cond_2
    sget-object v3, Ll/zrv;->a:Ll/wrv;

    .line 25
    .line 26
    invoke-virtual {v3}, Ll/wrv;->D0()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v3

    .line 30
    iget-object v4, p0, Lcom/p1/mobile/putong/live/base/data/BLiveLovePlanet;->stage:Lcom/p1/mobile/putong/live/base/data/LovePlanetStage;

    .line 31
    .line 32
    invoke-virtual {v4}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object v4

    .line 36
    const-string v5, "prepare"

    .line 37
    .line 38
    invoke-virtual {v5, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 39
    .line 40
    .line 41
    move-result v5

    .line 42
    if-nez v5, :cond_4

    .line 43
    .line 44
    const-string v5, "unknown_"

    .line 45
    .line 46
    invoke-virtual {v5, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 47
    .line 48
    .line 49
    move-result v5

    .line 50
    if-eqz v5, :cond_3

    .line 51
    .line 52
    goto :goto_0

    .line 53
    :cond_3
    const/4 v5, 0x0

    .line 54
    goto :goto_1

    .line 55
    :cond_4
    :goto_0
    const/4 v5, 0x1

    .line 56
    :goto_1
    iget-object v6, p0, Lcom/p1/mobile/putong/live/base/data/BLiveLovePlanet;->host:Lcom/p1/mobile/putong/live/base/data/BLiveLovePlanetPlayerInfo;

    .line 57
    .line 58
    invoke-static {v6}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 59
    .line 60
    .line 61
    move-result v6

    .line 62
    if-eqz v6, :cond_a

    .line 63
    .line 64
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveLovePlanet;->host:Lcom/p1/mobile/putong/live/base/data/BLiveLovePlanetPlayerInfo;

    .line 65
    .line 66
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveLovePlanetPlayerInfo;->userId:Ljava/lang/String;

    .line 67
    .line 68
    invoke-static {p0, v3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 69
    .line 70
    .line 71
    move-result p0

    .line 72
    if-eqz p0, :cond_a

    .line 73
    .line 74
    if-eqz v5, :cond_5

    .line 75
    .line 76
    const-string p0, "\u5f00\u59cb\u6e38\u620f"

    .line 77
    .line 78
    return-object p0

    .line 79
    :cond_5
    const-string p0, "introduction"

    .line 80
    .line 81
    invoke-virtual {p0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 82
    .line 83
    .line 84
    move-result p0

    .line 85
    const-string p1, "\u4e0b\u4e00\u73af\u8282"

    .line 86
    .line 87
    if-eqz p0, :cond_6

    .line 88
    .line 89
    return-object p1

    .line 90
    :cond_6
    const-string p0, "choice"

    .line 91
    .line 92
    invoke-virtual {p0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 93
    .line 94
    .line 95
    move-result p0

    .line 96
    if-eqz p0, :cond_7

    .line 97
    .line 98
    return-object p1

    .line 99
    :cond_7
    const-string p0, "result"

    .line 100
    .line 101
    invoke-virtual {p0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 102
    .line 103
    .line 104
    move-result p0

    .line 105
    if-eqz p0, :cond_8

    .line 106
    .line 107
    return-object p1

    .line 108
    :cond_8
    const-string p0, "trip"

    .line 109
    .line 110
    invoke-virtual {p0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 111
    .line 112
    .line 113
    move-result p0

    .line 114
    if-eqz p0, :cond_9

    .line 115
    .line 116
    return-object v2

    .line 117
    :cond_9
    const/4 p0, 0x0

    .line 118
    return-object p0

    .line 119
    :cond_a
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 120
    .line 121
    .line 122
    move-result p0

    .line 123
    if-eqz p0, :cond_b

    .line 124
    .line 125
    iget-boolean p0, p2, Lcom/p1/mobile/putong/live/base/data/BLiveLovePlanetPlayerInfo;->isLeave:Z

    .line 126
    .line 127
    if-nez p0, :cond_b

    .line 128
    .line 129
    return-object v2

    .line 130
    :cond_b
    invoke-static {p1}, Ll/guk0;->m(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)Z

    .line 131
    .line 132
    .line 133
    move-result p0

    .line 134
    if-eqz p0, :cond_c

    .line 135
    .line 136
    return-object v1

    .line 137
    :cond_c
    invoke-static {p1}, Ll/guk0;->h(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)Z

    .line 138
    .line 139
    .line 140
    move-result p0

    .line 141
    if-eqz p0, :cond_d

    .line 142
    .line 143
    return-object v2

    .line 144
    :cond_d
    return-object v0
.end method

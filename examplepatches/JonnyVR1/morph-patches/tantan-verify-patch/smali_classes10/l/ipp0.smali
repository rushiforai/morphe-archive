.class public Ll/ipp0;
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

.method public static a(Ll/oo2;Ljava/lang/String;Ljava/lang/String;JLjava/lang/String;Ljava/lang/String;)V
    .locals 16

    .line 1
    move-object/from16 v0, p1

    .line 2
    .line 3
    move-object/from16 v1, p2

    .line 4
    .line 5
    if-eqz p0, :cond_2

    .line 6
    .line 7
    invoke-virtual/range {p0 .. p0}, Ll/vp20;->m()Ll/jsv;

    .line 8
    .line 9
    .line 10
    move-result-object v2

    .line 11
    invoke-virtual {v2}, Ll/jsv;->k()Z

    .line 12
    .line 13
    .line 14
    move-result v2

    .line 15
    if-nez v2, :cond_0

    .line 16
    .line 17
    goto/16 :goto_1

    .line 18
    .line 19
    :cond_0
    invoke-virtual/range {p0 .. p0}, Ll/oo2;->l0()Lcom/p1/mobile/putong/data/User;

    .line 20
    .line 21
    .line 22
    move-result-object v2

    .line 23
    const-string v3, ""

    .line 24
    .line 25
    if-nez v2, :cond_1

    .line 26
    .line 27
    move-object v2, v3

    .line 28
    goto :goto_0

    .line 29
    :cond_1
    iget-object v2, v2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 30
    .line 31
    :goto_0
    invoke-virtual/range {p0 .. p0}, Ll/vp20;->o()Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v4

    .line 35
    invoke-virtual/range {p0 .. p0}, Ll/vp20;->k()Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object v5

    .line 39
    new-instance v6, Ljava/lang/StringBuilder;

    .line 40
    .line 41
    const-string v7, "liveRoomStyle:"

    .line 42
    .line 43
    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 47
    .line 48
    .line 49
    const-string v7, " liveRoomDurationType:"

    .line 50
    .line 51
    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 52
    .line 53
    .line 54
    invoke-virtual {v6, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 55
    .line 56
    .line 57
    const-string v7, " liveDuration:"

    .line 58
    .line 59
    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 60
    .line 61
    .line 62
    move-wide/from16 v7, p3

    .line 63
    .line 64
    invoke-virtual {v6, v7, v8}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 65
    .line 66
    .line 67
    const-string v9, " anchorId:"

    .line 68
    .line 69
    invoke-virtual {v6, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 70
    .line 71
    .line 72
    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 73
    .line 74
    .line 75
    const-string v9, " roomId:"

    .line 76
    .line 77
    invoke-virtual {v6, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 78
    .line 79
    .line 80
    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 81
    .line 82
    .line 83
    const-string v9, " liveId:"

    .line 84
    .line 85
    invoke-virtual {v6, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 86
    .line 87
    .line 88
    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 89
    .line 90
    .line 91
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 92
    .line 93
    .line 94
    move-result-object v6

    .line 95
    const-string v9, "[live]watchTime"

    .line 96
    .line 97
    invoke-static {v9, v6}, Ll/fhw;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 98
    .line 99
    .line 100
    const-string v6, "liveroomstyle"

    .line 101
    .line 102
    invoke-static {v6, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 103
    .line 104
    .line 105
    move-result-object v0

    .line 106
    const-string v6, "liveroom_durationtype"

    .line 107
    .line 108
    invoke-static {v6, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 109
    .line 110
    .line 111
    move-result-object v1

    .line 112
    const-string v6, "anchorId"

    .line 113
    .line 114
    invoke-static {v6, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 115
    .line 116
    .line 117
    move-result-object v9

    .line 118
    const-string v2, "roomId"

    .line 119
    .line 120
    invoke-static {v2, v4}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 121
    .line 122
    .line 123
    move-result-object v10

    .line 124
    const-string v2, "liveId"

    .line 125
    .line 126
    invoke-static {v2, v5}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 127
    .line 128
    .line 129
    move-result-object v11

    .line 130
    const-string v2, "liveduration"

    .line 131
    .line 132
    invoke-static {v7, v8}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    .line 133
    .line 134
    .line 135
    move-result-object v4

    .line 136
    invoke-static {v2, v4}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 137
    .line 138
    .line 139
    move-result-object v12

    .line 140
    const-string v2, "liveRecommendCategory"

    .line 141
    .line 142
    move-object/from16 v4, p5

    .line 143
    .line 144
    invoke-static {v2, v4}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 145
    .line 146
    .line 147
    move-result-object v13

    .line 148
    const-string v2, "live_outside_source"

    .line 149
    .line 150
    move-object/from16 v4, p6

    .line 151
    .line 152
    invoke-static {v2, v4}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 153
    .line 154
    .line 155
    move-result-object v14

    .line 156
    const-string v2, "live_in_source"

    .line 157
    .line 158
    invoke-virtual/range {p0 .. p0}, Ll/oo2;->o0()Ljava/lang/String;

    .line 159
    .line 160
    .line 161
    move-result-object v4

    .line 162
    invoke-static {v2, v4}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 163
    .line 164
    .line 165
    move-result-object v15

    .line 166
    move-object v7, v0

    .line 167
    move-object v8, v1

    .line 168
    filled-new-array/range {v7 .. v15}, [Ll/pf60;

    .line 169
    .line 170
    .line 171
    move-result-object v0

    .line 172
    const-string v1, "e_liveduration"

    .line 173
    .line 174
    invoke-static {v1, v3, v0}, Ll/i4g0;->B(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 175
    .line 176
    .line 177
    :cond_2
    :goto_1
    return-void
.end method

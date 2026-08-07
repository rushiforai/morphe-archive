.class public Ll/el50;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 1
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

.method public static synthetic a(Ll/zpq;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/zpq;->k()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static b(Ljava/util/List;)I
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/OMSLocationType;",
            ">;)I"
        }
    .end annotation

    .line 1
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, -0x1

    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    return v1

    .line 9
    :cond_0
    const/4 v0, 0x0

    .line 10
    move v2, v0

    .line 11
    :goto_0
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 12
    .line 13
    .line 14
    move-result v3

    .line 15
    if-ge v2, v3, :cond_2

    .line 16
    .line 17
    if-nez v2, :cond_1

    .line 18
    .line 19
    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    check-cast v1, Lcom/p1/mobile/putong/data/OMSLocationType;

    .line 24
    .line 25
    invoke-static {v1}, Ll/el50;->c(Lcom/p1/mobile/putong/data/OMSLocationType;)I

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    goto :goto_1

    .line 30
    :cond_1
    invoke-interface {p0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    move-result-object v3

    .line 34
    check-cast v3, Lcom/p1/mobile/putong/data/OMSLocationType;

    .line 35
    .line 36
    invoke-static {v3}, Ll/el50;->c(Lcom/p1/mobile/putong/data/OMSLocationType;)I

    .line 37
    .line 38
    .line 39
    move-result v3

    .line 40
    or-int/2addr v1, v3

    .line 41
    :goto_1
    add-int/lit8 v2, v2, 0x1

    .line 42
    .line 43
    goto :goto_0

    .line 44
    :cond_2
    return v1
.end method

.method public static c(Lcom/p1/mobile/putong/data/OMSLocationType;)I
    .locals 3

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Ljava/lang/String;->hashCode()I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    const/4 v1, 0x1

    .line 13
    const/4 v2, -0x1

    .line 14
    sparse-switch v0, :sswitch_data_0

    .line 15
    .line 16
    .line 17
    :goto_0
    move p0, v2

    .line 18
    goto :goto_1

    .line 19
    :sswitch_0
    const-string v0, "g_center"

    .line 20
    .line 21
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 22
    .line 23
    .line 24
    move-result p0

    .line 25
    if-nez p0, :cond_0

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_0
    const/4 p0, 0x6

    .line 29
    goto :goto_1

    .line 30
    :sswitch_1
    const-string v0, "g_bottom"

    .line 31
    .line 32
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 33
    .line 34
    .line 35
    move-result p0

    .line 36
    if-nez p0, :cond_1

    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_1
    const/4 p0, 0x5

    .line 40
    goto :goto_1

    .line 41
    :sswitch_2
    const-string v0, "g_center_vertical"

    .line 42
    .line 43
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 44
    .line 45
    .line 46
    move-result p0

    .line 47
    if-nez p0, :cond_2

    .line 48
    .line 49
    goto :goto_0

    .line 50
    :cond_2
    const/4 p0, 0x4

    .line 51
    goto :goto_1

    .line 52
    :sswitch_3
    const-string v0, "g_top"

    .line 53
    .line 54
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 55
    .line 56
    .line 57
    move-result p0

    .line 58
    if-nez p0, :cond_3

    .line 59
    .line 60
    goto :goto_0

    .line 61
    :cond_3
    const/4 p0, 0x3

    .line 62
    goto :goto_1

    .line 63
    :sswitch_4
    const-string v0, "g_end"

    .line 64
    .line 65
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 66
    .line 67
    .line 68
    move-result p0

    .line 69
    if-nez p0, :cond_4

    .line 70
    .line 71
    goto :goto_0

    .line 72
    :cond_4
    const/4 p0, 0x2

    .line 73
    goto :goto_1

    .line 74
    :sswitch_5
    const-string v0, "g_start"

    .line 75
    .line 76
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 77
    .line 78
    .line 79
    move-result p0

    .line 80
    if-nez p0, :cond_5

    .line 81
    .line 82
    goto :goto_0

    .line 83
    :cond_5
    move p0, v1

    .line 84
    goto :goto_1

    .line 85
    :sswitch_6
    const-string v0, "g_center_horizontal"

    .line 86
    .line 87
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 88
    .line 89
    .line 90
    move-result p0

    .line 91
    if-nez p0, :cond_6

    .line 92
    .line 93
    goto :goto_0

    .line 94
    :cond_6
    const/4 p0, 0x0

    .line 95
    :goto_1
    packed-switch p0, :pswitch_data_0

    .line 96
    .line 97
    .line 98
    return v2

    .line 99
    :pswitch_0
    const/16 p0, 0x11

    .line 100
    .line 101
    return p0

    .line 102
    :pswitch_1
    const/16 p0, 0x50

    .line 103
    .line 104
    return p0

    .line 105
    :pswitch_2
    const/16 p0, 0x10

    .line 106
    .line 107
    return p0

    .line 108
    :pswitch_3
    const/16 p0, 0x30

    .line 109
    .line 110
    return p0

    .line 111
    :pswitch_4
    const p0, 0x800005

    .line 112
    .line 113
    .line 114
    return p0

    .line 115
    :pswitch_5
    const p0, 0x800003

    .line 116
    .line 117
    .line 118
    return p0

    .line 119
    :pswitch_6
    return v1

    .line 120
    nop

    .line 121
    :sswitch_data_0
    .sparse-switch
        -0xeea438a -> :sswitch_6
        -0xeb70176 -> :sswitch_5
        0x5d82d03 -> :sswitch_4
        0x5d8657d -> :sswitch_3
        0x14b08448 -> :sswitch_2
        0x1a96a503 -> :sswitch_1
        0x1bbbd72d -> :sswitch_0
    .end sparse-switch

    .line 122
    .line 123
    .line 124
    .line 125
    .line 126
    .line 127
    .line 128
    .line 129
    .line 130
    .line 131
    .line 132
    .line 133
    .line 134
    .line 135
    .line 136
    .line 137
    .line 138
    .line 139
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
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public static d(Lcom/p1/mobile/putong/data/OMSImageScaleType;)Ll/h1e0;
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Ljava/lang/String;->hashCode()I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    const/4 v1, -0x1

    .line 13
    sparse-switch v0, :sswitch_data_0

    .line 14
    .line 15
    .line 16
    goto/16 :goto_0

    .line 17
    .line 18
    :sswitch_0
    const-string v0, "center_crop"

    .line 19
    .line 20
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 21
    .line 22
    .line 23
    move-result p0

    .line 24
    if-nez p0, :cond_0

    .line 25
    .line 26
    goto/16 :goto_0

    .line 27
    .line 28
    :cond_0
    const/16 v1, 0x8

    .line 29
    .line 30
    goto/16 :goto_0

    .line 31
    .line 32
    :sswitch_1
    const-string v0, "fit_start"

    .line 33
    .line 34
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 35
    .line 36
    .line 37
    move-result p0

    .line 38
    if-nez p0, :cond_1

    .line 39
    .line 40
    goto :goto_0

    .line 41
    :cond_1
    const/4 v1, 0x7

    .line 42
    goto :goto_0

    .line 43
    :sswitch_2
    const-string v0, "fit_bottom_start"

    .line 44
    .line 45
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 46
    .line 47
    .line 48
    move-result p0

    .line 49
    if-nez p0, :cond_2

    .line 50
    .line 51
    goto :goto_0

    .line 52
    :cond_2
    const/4 v1, 0x6

    .line 53
    goto :goto_0

    .line 54
    :sswitch_3
    const-string v0, "center_inside"

    .line 55
    .line 56
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 57
    .line 58
    .line 59
    move-result p0

    .line 60
    if-nez p0, :cond_3

    .line 61
    .line 62
    goto :goto_0

    .line 63
    :cond_3
    const/4 v1, 0x5

    .line 64
    goto :goto_0

    .line 65
    :sswitch_4
    const-string v0, "fit_end"

    .line 66
    .line 67
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 68
    .line 69
    .line 70
    move-result p0

    .line 71
    if-nez p0, :cond_4

    .line 72
    .line 73
    goto :goto_0

    .line 74
    :cond_4
    const/4 v1, 0x4

    .line 75
    goto :goto_0

    .line 76
    :sswitch_5
    const-string v0, "focus_crop"

    .line 77
    .line 78
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 79
    .line 80
    .line 81
    move-result p0

    .line 82
    if-nez p0, :cond_5

    .line 83
    .line 84
    goto :goto_0

    .line 85
    :cond_5
    const/4 v1, 0x3

    .line 86
    goto :goto_0

    .line 87
    :sswitch_6
    const-string v0, "fit_xy"

    .line 88
    .line 89
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 90
    .line 91
    .line 92
    move-result p0

    .line 93
    if-nez p0, :cond_6

    .line 94
    .line 95
    goto :goto_0

    .line 96
    :cond_6
    const/4 v1, 0x2

    .line 97
    goto :goto_0

    .line 98
    :sswitch_7
    const-string v0, "center"

    .line 99
    .line 100
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 101
    .line 102
    .line 103
    move-result p0

    .line 104
    if-nez p0, :cond_7

    .line 105
    .line 106
    goto :goto_0

    .line 107
    :cond_7
    const/4 v1, 0x1

    .line 108
    goto :goto_0

    .line 109
    :sswitch_8
    const-string v0, "fit_center"

    .line 110
    .line 111
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 112
    .line 113
    .line 114
    move-result p0

    .line 115
    if-nez p0, :cond_8

    .line 116
    .line 117
    goto :goto_0

    .line 118
    :cond_8
    const/4 v1, 0x0

    .line 119
    :goto_0
    packed-switch v1, :pswitch_data_0

    .line 120
    .line 121
    .line 122
    sget-object p0, Ll/h1e0;->i:Ll/h1e0;

    .line 123
    .line 124
    return-object p0

    .line 125
    :pswitch_0
    sget-object p0, Ll/h1e0;->i:Ll/h1e0;

    .line 126
    .line 127
    return-object p0

    .line 128
    :pswitch_1
    sget-object p0, Ll/h1e0;->d:Ll/h1e0;

    .line 129
    .line 130
    return-object p0

    .line 131
    :pswitch_2
    sget-object p0, Ll/h1e0;->k:Ll/h1e0;

    .line 132
    .line 133
    return-object p0

    .line 134
    :pswitch_3
    sget-object p0, Ll/h1e0;->h:Ll/h1e0;

    .line 135
    .line 136
    return-object p0

    .line 137
    :pswitch_4
    sget-object p0, Ll/h1e0;->f:Ll/h1e0;

    .line 138
    .line 139
    return-object p0

    .line 140
    :pswitch_5
    sget-object p0, Ll/h1e0;->j:Ll/h1e0;

    .line 141
    .line 142
    return-object p0

    .line 143
    :pswitch_6
    sget-object p0, Ll/h1e0;->a:Ll/h1e0;

    .line 144
    .line 145
    return-object p0

    .line 146
    :pswitch_7
    sget-object p0, Ll/h1e0;->g:Ll/h1e0;

    .line 147
    .line 148
    return-object p0

    .line 149
    :pswitch_8
    sget-object p0, Ll/h1e0;->e:Ll/h1e0;

    .line 150
    .line 151
    return-object p0

    .line 152
    nop

    .line 153
    :sswitch_data_0
    .sparse-switch
        -0x788047bd -> :sswitch_8
        -0x514d33ab -> :sswitch_7
        -0x4bf3de11 -> :sswitch_6
        -0x3e1c9a69 -> :sswitch_5
        -0x32882c53 -> :sswitch_4
        0xd746726 -> :sswitch_3
        0x3100f6bc -> :sswitch_2
        0x4f99a2b4 -> :sswitch_1
        0x63a2143a -> :sswitch_0
    .end sparse-switch

    .line 154
    .line 155
    .line 156
    .line 157
    .line 158
    .line 159
    .line 160
    .line 161
    .line 162
    .line 163
    .line 164
    .line 165
    .line 166
    .line 167
    .line 168
    .line 169
    .line 170
    .line 171
    .line 172
    .line 173
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
    .line 184
    .line 185
    .line 186
    .line 187
    .line 188
    .line 189
    .line 190
    .line 191
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public static e(Lcom/p1/mobile/putong/data/OMSLocationType;)I
    .locals 24

    .line 1
    invoke-virtual/range {p0 .. p0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    const/16 v2, 0x14

    .line 13
    .line 14
    const/16 v3, 0x13

    .line 15
    .line 16
    const/16 v4, 0x12

    .line 17
    .line 18
    const/16 v5, 0x11

    .line 19
    .line 20
    const/16 v6, 0x10

    .line 21
    .line 22
    const/16 v7, 0xf

    .line 23
    .line 24
    const/16 v8, 0xe

    .line 25
    .line 26
    const/16 v9, 0xd

    .line 27
    .line 28
    const/16 v10, 0xc

    .line 29
    .line 30
    const/16 v11, 0xb

    .line 31
    .line 32
    const/16 v12, 0xa

    .line 33
    .line 34
    const/16 v13, 0x9

    .line 35
    .line 36
    const/16 v14, 0x8

    .line 37
    .line 38
    const/4 v15, 0x7

    .line 39
    const/16 v16, 0x6

    .line 40
    .line 41
    const/16 v17, 0x5

    .line 42
    .line 43
    const/16 v18, 0x4

    .line 44
    .line 45
    const/16 v19, 0x3

    .line 46
    .line 47
    const/16 v20, 0x2

    .line 48
    .line 49
    const/16 v21, 0x1

    .line 50
    .line 51
    const/16 v22, 0x0

    .line 52
    .line 53
    const/16 v23, -0x1

    .line 54
    .line 55
    sparse-switch v1, :sswitch_data_0

    .line 56
    .line 57
    .line 58
    :goto_0
    move/from16 v0, v23

    .line 59
    .line 60
    goto/16 :goto_1

    .line 61
    .line 62
    :sswitch_0
    const-string v1, "r_right_of"

    .line 63
    .line 64
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 65
    .line 66
    .line 67
    move-result v0

    .line 68
    if-nez v0, :cond_0

    .line 69
    .line 70
    goto :goto_0

    .line 71
    :cond_0
    const/16 v0, 0x15

    .line 72
    .line 73
    goto/16 :goto_1

    .line 74
    .line 75
    :sswitch_1
    const-string v1, "r_align_left"

    .line 76
    .line 77
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 78
    .line 79
    .line 80
    move-result v0

    .line 81
    if-nez v0, :cond_1

    .line 82
    .line 83
    goto :goto_0

    .line 84
    :cond_1
    move v0, v2

    .line 85
    goto/16 :goto_1

    .line 86
    .line 87
    :sswitch_2
    const-string v1, "r_align_top"

    .line 88
    .line 89
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 90
    .line 91
    .line 92
    move-result v0

    .line 93
    if-nez v0, :cond_2

    .line 94
    .line 95
    goto :goto_0

    .line 96
    :cond_2
    move v0, v3

    .line 97
    goto/16 :goto_1

    .line 98
    .line 99
    :sswitch_3
    const-string v1, "r_align_end"

    .line 100
    .line 101
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 102
    .line 103
    .line 104
    move-result v0

    .line 105
    if-nez v0, :cond_3

    .line 106
    .line 107
    goto :goto_0

    .line 108
    :cond_3
    move v0, v4

    .line 109
    goto/16 :goto_1

    .line 110
    .line 111
    :sswitch_4
    const-string v1, "r_below"

    .line 112
    .line 113
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 114
    .line 115
    .line 116
    move-result v0

    .line 117
    if-nez v0, :cond_4

    .line 118
    .line 119
    goto :goto_0

    .line 120
    :cond_4
    move v0, v5

    .line 121
    goto/16 :goto_1

    .line 122
    .line 123
    :sswitch_5
    const-string v1, "r_above"

    .line 124
    .line 125
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 126
    .line 127
    .line 128
    move-result v0

    .line 129
    if-nez v0, :cond_5

    .line 130
    .line 131
    goto :goto_0

    .line 132
    :cond_5
    move v0, v6

    .line 133
    goto/16 :goto_1

    .line 134
    .line 135
    :sswitch_6
    const-string v1, "r_center_in_parent"

    .line 136
    .line 137
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 138
    .line 139
    .line 140
    move-result v0

    .line 141
    if-nez v0, :cond_6

    .line 142
    .line 143
    goto :goto_0

    .line 144
    :cond_6
    move v0, v7

    .line 145
    goto/16 :goto_1

    .line 146
    .line 147
    :sswitch_7
    const-string v1, "r_start_of"

    .line 148
    .line 149
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 150
    .line 151
    .line 152
    move-result v0

    .line 153
    if-nez v0, :cond_7

    .line 154
    .line 155
    goto :goto_0

    .line 156
    :cond_7
    move v0, v8

    .line 157
    goto/16 :goto_1

    .line 158
    .line 159
    :sswitch_8
    const-string v1, "r_align_parent_top"

    .line 160
    .line 161
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 162
    .line 163
    .line 164
    move-result v0

    .line 165
    if-nez v0, :cond_8

    .line 166
    .line 167
    goto :goto_0

    .line 168
    :cond_8
    move v0, v9

    .line 169
    goto/16 :goto_1

    .line 170
    .line 171
    :sswitch_9
    const-string v1, "r_align_parent_end"

    .line 172
    .line 173
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 174
    .line 175
    .line 176
    move-result v0

    .line 177
    if-nez v0, :cond_9

    .line 178
    .line 179
    goto :goto_0

    .line 180
    :cond_9
    move v0, v10

    .line 181
    goto/16 :goto_1

    .line 182
    .line 183
    :sswitch_a
    const-string v1, "r_center_horizontal"

    .line 184
    .line 185
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 186
    .line 187
    .line 188
    move-result v0

    .line 189
    if-nez v0, :cond_a

    .line 190
    .line 191
    goto/16 :goto_0

    .line 192
    .line 193
    :cond_a
    move v0, v11

    .line 194
    goto/16 :goto_1

    .line 195
    .line 196
    :sswitch_b
    const-string v1, "r_align_parent_bottom"

    .line 197
    .line 198
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 199
    .line 200
    .line 201
    move-result v0

    .line 202
    if-nez v0, :cond_b

    .line 203
    .line 204
    goto/16 :goto_0

    .line 205
    .line 206
    :cond_b
    move v0, v12

    .line 207
    goto/16 :goto_1

    .line 208
    .line 209
    :sswitch_c
    const-string v1, "r_align_baseline"

    .line 210
    .line 211
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 212
    .line 213
    .line 214
    move-result v0

    .line 215
    if-nez v0, :cond_c

    .line 216
    .line 217
    goto/16 :goto_0

    .line 218
    .line 219
    :cond_c
    move v0, v13

    .line 220
    goto/16 :goto_1

    .line 221
    .line 222
    :sswitch_d
    const-string v1, "r_align_bottom"

    .line 223
    .line 224
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 225
    .line 226
    .line 227
    move-result v0

    .line 228
    if-nez v0, :cond_d

    .line 229
    .line 230
    goto/16 :goto_0

    .line 231
    .line 232
    :cond_d
    move v0, v14

    .line 233
    goto/16 :goto_1

    .line 234
    .line 235
    :sswitch_e
    const-string v1, "r_left_of"

    .line 236
    .line 237
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 238
    .line 239
    .line 240
    move-result v0

    .line 241
    if-nez v0, :cond_e

    .line 242
    .line 243
    goto/16 :goto_0

    .line 244
    .line 245
    :cond_e
    move v0, v15

    .line 246
    goto :goto_1

    .line 247
    :sswitch_f
    const-string v1, "r_end_of"

    .line 248
    .line 249
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 250
    .line 251
    .line 252
    move-result v0

    .line 253
    if-nez v0, :cond_f

    .line 254
    .line 255
    goto/16 :goto_0

    .line 256
    .line 257
    :cond_f
    move/from16 v0, v16

    .line 258
    .line 259
    goto :goto_1

    .line 260
    :sswitch_10
    const-string v1, "r_align_parent_left"

    .line 261
    .line 262
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 263
    .line 264
    .line 265
    move-result v0

    .line 266
    if-nez v0, :cond_10

    .line 267
    .line 268
    goto/16 :goto_0

    .line 269
    .line 270
    :cond_10
    move/from16 v0, v17

    .line 271
    .line 272
    goto :goto_1

    .line 273
    :sswitch_11
    const-string v1, "r_center_vertical"

    .line 274
    .line 275
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 276
    .line 277
    .line 278
    move-result v0

    .line 279
    if-nez v0, :cond_11

    .line 280
    .line 281
    goto/16 :goto_0

    .line 282
    .line 283
    :cond_11
    move/from16 v0, v18

    .line 284
    .line 285
    goto :goto_1

    .line 286
    :sswitch_12
    const-string v1, "r_align_parent_start"

    .line 287
    .line 288
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 289
    .line 290
    .line 291
    move-result v0

    .line 292
    if-nez v0, :cond_12

    .line 293
    .line 294
    goto/16 :goto_0

    .line 295
    .line 296
    :cond_12
    move/from16 v0, v19

    .line 297
    .line 298
    goto :goto_1

    .line 299
    :sswitch_13
    const-string v1, "r_align_parent_right"

    .line 300
    .line 301
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 302
    .line 303
    .line 304
    move-result v0

    .line 305
    if-nez v0, :cond_13

    .line 306
    .line 307
    goto/16 :goto_0

    .line 308
    .line 309
    :cond_13
    move/from16 v0, v20

    .line 310
    .line 311
    goto :goto_1

    .line 312
    :sswitch_14
    const-string v1, "r_align_start"

    .line 313
    .line 314
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 315
    .line 316
    .line 317
    move-result v0

    .line 318
    if-nez v0, :cond_14

    .line 319
    .line 320
    goto/16 :goto_0

    .line 321
    .line 322
    :cond_14
    move/from16 v0, v21

    .line 323
    .line 324
    goto :goto_1

    .line 325
    :sswitch_15
    const-string v1, "r_align_right"

    .line 326
    .line 327
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 328
    .line 329
    .line 330
    move-result v0

    .line 331
    if-nez v0, :cond_15

    .line 332
    .line 333
    goto/16 :goto_0

    .line 334
    .line 335
    :cond_15
    move/from16 v0, v22

    .line 336
    .line 337
    :goto_1
    packed-switch v0, :pswitch_data_0

    .line 338
    .line 339
    .line 340
    return v23

    .line 341
    :pswitch_0
    return v21

    .line 342
    :pswitch_1
    return v17

    .line 343
    :pswitch_2
    return v16

    .line 344
    :pswitch_3
    return v3

    .line 345
    :pswitch_4
    return v19

    .line 346
    :pswitch_5
    return v20

    .line 347
    :pswitch_6
    return v9

    .line 348
    :pswitch_7
    return v6

    .line 349
    :pswitch_8
    return v12

    .line 350
    :pswitch_9
    const/16 v0, 0x15

    .line 351
    .line 352
    return v0

    .line 353
    :pswitch_a
    return v8

    .line 354
    :pswitch_b
    return v10

    .line 355
    :pswitch_c
    return v18

    .line 356
    :pswitch_d
    return v14

    .line 357
    :pswitch_e
    return v22

    .line 358
    :pswitch_f
    return v5

    .line 359
    :pswitch_10
    return v13

    .line 360
    :pswitch_11
    return v7

    .line 361
    :pswitch_12
    return v2

    .line 362
    :pswitch_13
    return v11

    .line 363
    :pswitch_14
    return v4

    .line 364
    :pswitch_15
    return v15

    .line 365
    :sswitch_data_0
    .sparse-switch
        -0x75eb17eb -> :sswitch_15
        -0x75d815a5 -> :sswitch_14
        -0x74ff99d2 -> :sswitch_13
        -0x74ec978c -> :sswitch_12
        -0x7402f1ad -> :sswitch_11
        -0x6f23ce4b -> :sswitch_10
        -0x69b38fd8 -> :sswitch_f
        -0x69a8e9be -> :sswitch_e
        -0x626accae -> :sswitch_d
        -0x5a0b2e54 -> :sswitch_c
        -0x45e687a7 -> :sswitch_b
        -0x3898103f -> :sswitch_a
        -0xbd7f693 -> :sswitch_9
        -0xbd7be19 -> :sswitch_8
        0x1c964c01 -> :sswitch_7
        0x1ec209c7 -> :sswitch_6
        0x3627e990 -> :sswitch_5
        0x36375224 -> :sswitch_4
        0x5e71d914 -> :sswitch_3
        0x5e72118e -> :sswitch_2
        0x6fcc56ee -> :sswitch_1
        0x7880bc07 -> :sswitch_0
    .end sparse-switch

    .line 366
    .line 367
    .line 368
    .line 369
    .line 370
    .line 371
    .line 372
    .line 373
    .line 374
    .line 375
    .line 376
    .line 377
    .line 378
    .line 379
    .line 380
    .line 381
    .line 382
    .line 383
    .line 384
    .line 385
    .line 386
    .line 387
    .line 388
    .line 389
    .line 390
    .line 391
    .line 392
    .line 393
    .line 394
    .line 395
    .line 396
    .line 397
    .line 398
    .line 399
    .line 400
    .line 401
    .line 402
    .line 403
    .line 404
    .line 405
    .line 406
    .line 407
    .line 408
    .line 409
    .line 410
    .line 411
    .line 412
    .line 413
    .line 414
    .line 415
    .line 416
    .line 417
    .line 418
    .line 419
    .line 420
    .line 421
    .line 422
    .line 423
    .line 424
    .line 425
    .line 426
    .line 427
    .line 428
    .line 429
    .line 430
    .line 431
    .line 432
    .line 433
    .line 434
    .line 435
    .line 436
    .line 437
    .line 438
    .line 439
    .line 440
    .line 441
    .line 442
    .line 443
    .line 444
    .line 445
    .line 446
    .line 447
    .line 448
    .line 449
    .line 450
    .line 451
    .line 452
    .line 453
    .line 454
    .line 455
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_15
        :pswitch_14
        :pswitch_13
        :pswitch_12
        :pswitch_11
        :pswitch_10
        :pswitch_f
        :pswitch_e
        :pswitch_d
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public static f(Ljava/lang/String;Ljava/util/Map;)Ljava/lang/String;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    new-instance v1, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    const-string v2, "/oms/me/resources/"

    .line 6
    .line 7
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-static {p0}, Ll/xi5;->i(Ljava/lang/String;)Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-direct {v0, p0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 25
    .line 26
    .line 27
    move-result p0

    .line 28
    if-eqz p0, :cond_1

    .line 29
    .line 30
    invoke-interface {p1}, Ljava/util/Map;->keySet()Ljava/util/Set;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    invoke-interface {p0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    const/4 v1, 0x1

    .line 39
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 40
    .line 41
    .line 42
    move-result v2

    .line 43
    if-eqz v2, :cond_1

    .line 44
    .line 45
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 46
    .line 47
    .line 48
    move-result-object v2

    .line 49
    check-cast v2, Ljava/lang/String;

    .line 50
    .line 51
    if-eqz v1, :cond_0

    .line 52
    .line 53
    const-string v1, "?"

    .line 54
    .line 55
    goto :goto_1

    .line 56
    :cond_0
    const-string v1, "&"

    .line 57
    .line 58
    :goto_1
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 59
    .line 60
    .line 61
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 62
    .line 63
    .line 64
    const-string v1, "="

    .line 65
    .line 66
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 67
    .line 68
    .line 69
    invoke-interface {p1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 70
    .line 71
    .line 72
    move-result-object v1

    .line 73
    check-cast v1, Ljava/lang/String;

    .line 74
    .line 75
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 76
    .line 77
    .line 78
    const/4 v1, 0x0

    .line 79
    goto :goto_0

    .line 80
    :cond_1
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 81
    .line 82
    .line 83
    move-result-object p0

    .line 84
    return-object p0
.end method

.method public static g(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_3

    .line 6
    .line 7
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    goto :goto_1

    .line 14
    :cond_0
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-eqz v0, :cond_2

    .line 19
    .line 20
    invoke-interface {p2}, Ljava/util/Map;->size()I

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    if-lez v0, :cond_2

    .line 25
    .line 26
    invoke-interface {p2}, Ljava/util/Map;->size()I

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    new-array v0, v0, [Ll/pf60;

    .line 31
    .line 32
    invoke-interface {p2}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    .line 33
    .line 34
    .line 35
    move-result-object p2

    .line 36
    invoke-interface {p2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 37
    .line 38
    .line 39
    move-result-object p2

    .line 40
    const/4 v1, 0x0

    .line 41
    :goto_0
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    .line 42
    .line 43
    .line 44
    move-result v2

    .line 45
    if-eqz v2, :cond_1

    .line 46
    .line 47
    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 48
    .line 49
    .line 50
    move-result-object v2

    .line 51
    check-cast v2, Ljava/util/Map$Entry;

    .line 52
    .line 53
    new-instance v3, Ll/pf60;

    .line 54
    .line 55
    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 56
    .line 57
    .line 58
    move-result-object v4

    .line 59
    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 60
    .line 61
    .line 62
    move-result-object v2

    .line 63
    check-cast v2, Ljava/lang/String;

    .line 64
    .line 65
    invoke-static {v2}, Ll/dsi0;->g(Ljava/lang/String;)Ljava/lang/String;

    .line 66
    .line 67
    .line 68
    move-result-object v2

    .line 69
    invoke-direct {v3, v4, v2}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 70
    .line 71
    .line 72
    aput-object v3, v0, v1

    .line 73
    .line 74
    add-int/lit8 v1, v1, 0x1

    .line 75
    .line 76
    goto :goto_0

    .line 77
    :cond_1
    invoke-static {p0, p1, v0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 78
    .line 79
    .line 80
    return-void

    .line 81
    :cond_2
    invoke-static {p0, p1}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 82
    .line 83
    .line 84
    :cond_3
    :goto_1
    return-void
.end method

.method public static h(Lcom/p1/mobile/putong/app/PutongAct;Lcom/p1/mobile/putong/data/OMSDialogInfo;Ljava/lang/String;Z)V
    .locals 11

    .line 1
    invoke-virtual {p0}, Landroid/content/ContextWrapper;->getBaseContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    sget v1, Ll/jec0;->v:I

    .line 10
    .line 11
    const/4 v2, 0x0

    .line 12
    const/4 v3, 0x0

    .line 13
    invoke-virtual {v0, v1, v2, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    sget v1, Ll/ycc0;->H0:I

    .line 18
    .line 19
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    check-cast v1, Lcom/p1/mobile/putong/app/web/WebViewX;

    .line 24
    .line 25
    invoke-virtual {v1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    check-cast v2, Landroid/widget/FrameLayout$LayoutParams;

    .line 30
    .line 31
    iget-object v3, p1, Lcom/p1/mobile/putong/data/OMSDialogInfo;->content:Lcom/p1/mobile/putong/data/OMSDialogContent;

    .line 32
    .line 33
    iget-object v3, v3, Lcom/p1/mobile/putong/data/OMSDialogContent;->web:Lcom/p1/mobile/putong/data/OMSWebDialogResource;

    .line 34
    .line 35
    iget-object v3, v3, Lcom/p1/mobile/putong/data/OMSWebDialogResource;->width:Lcom/p1/mobile/putong/data/OMSWebDialogPerimeter;

    .line 36
    .line 37
    iget-object v3, v3, Lcom/p1/mobile/putong/data/OMSWebDialogPerimeter;->type:Lcom/p1/mobile/putong/data/OMSWebPerimeterType;

    .line 38
    .line 39
    const-string v4, "absolute"

    .line 40
    .line 41
    invoke-static {v3, v4}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 42
    .line 43
    .line 44
    move-result v3

    .line 45
    if-eqz v3, :cond_0

    .line 46
    .line 47
    iget-object v3, p1, Lcom/p1/mobile/putong/data/OMSDialogInfo;->content:Lcom/p1/mobile/putong/data/OMSDialogContent;

    .line 48
    .line 49
    iget-object v3, v3, Lcom/p1/mobile/putong/data/OMSDialogContent;->web:Lcom/p1/mobile/putong/data/OMSWebDialogResource;

    .line 50
    .line 51
    iget-object v3, v3, Lcom/p1/mobile/putong/data/OMSWebDialogResource;->width:Lcom/p1/mobile/putong/data/OMSWebDialogPerimeter;

    .line 52
    .line 53
    iget-wide v5, v3, Lcom/p1/mobile/putong/data/OMSWebDialogPerimeter;->value:D

    .line 54
    .line 55
    double-to-float v3, v5

    .line 56
    invoke-static {v3}, Ll/bnl0;->w(F)I

    .line 57
    .line 58
    .line 59
    move-result v3

    .line 60
    goto :goto_0

    .line 61
    :cond_0
    invoke-static {}, Ll/bnl0;->y0()I

    .line 62
    .line 63
    .line 64
    move-result v3

    .line 65
    int-to-double v5, v3

    .line 66
    iget-object v3, p1, Lcom/p1/mobile/putong/data/OMSDialogInfo;->content:Lcom/p1/mobile/putong/data/OMSDialogContent;

    .line 67
    .line 68
    iget-object v3, v3, Lcom/p1/mobile/putong/data/OMSDialogContent;->web:Lcom/p1/mobile/putong/data/OMSWebDialogResource;

    .line 69
    .line 70
    iget-object v3, v3, Lcom/p1/mobile/putong/data/OMSWebDialogResource;->width:Lcom/p1/mobile/putong/data/OMSWebDialogPerimeter;

    .line 71
    .line 72
    iget-wide v7, v3, Lcom/p1/mobile/putong/data/OMSWebDialogPerimeter;->value:D

    .line 73
    .line 74
    mul-double/2addr v5, v7

    .line 75
    double-to-int v3, v5

    .line 76
    :goto_0
    iput v3, v2, Landroid/widget/FrameLayout$LayoutParams;->width:I

    .line 77
    .line 78
    iget-object v3, p1, Lcom/p1/mobile/putong/data/OMSDialogInfo;->content:Lcom/p1/mobile/putong/data/OMSDialogContent;

    .line 79
    .line 80
    iget-object v3, v3, Lcom/p1/mobile/putong/data/OMSDialogContent;->web:Lcom/p1/mobile/putong/data/OMSWebDialogResource;

    .line 81
    .line 82
    iget-object v3, v3, Lcom/p1/mobile/putong/data/OMSWebDialogResource;->height:Lcom/p1/mobile/putong/data/OMSWebDialogPerimeter;

    .line 83
    .line 84
    iget-object v3, v3, Lcom/p1/mobile/putong/data/OMSWebDialogPerimeter;->type:Lcom/p1/mobile/putong/data/OMSWebPerimeterType;

    .line 85
    .line 86
    invoke-static {v3, v4}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 87
    .line 88
    .line 89
    move-result v3

    .line 90
    if-eqz v3, :cond_1

    .line 91
    .line 92
    iget-object v3, p1, Lcom/p1/mobile/putong/data/OMSDialogInfo;->content:Lcom/p1/mobile/putong/data/OMSDialogContent;

    .line 93
    .line 94
    iget-object v3, v3, Lcom/p1/mobile/putong/data/OMSDialogContent;->web:Lcom/p1/mobile/putong/data/OMSWebDialogResource;

    .line 95
    .line 96
    iget-object v3, v3, Lcom/p1/mobile/putong/data/OMSWebDialogResource;->height:Lcom/p1/mobile/putong/data/OMSWebDialogPerimeter;

    .line 97
    .line 98
    iget-wide v3, v3, Lcom/p1/mobile/putong/data/OMSWebDialogPerimeter;->value:D

    .line 99
    .line 100
    double-to-float v3, v3

    .line 101
    invoke-static {v3}, Ll/bnl0;->w(F)I

    .line 102
    .line 103
    .line 104
    move-result v3

    .line 105
    goto :goto_1

    .line 106
    :cond_1
    invoke-static {}, Ll/bnl0;->w0()I

    .line 107
    .line 108
    .line 109
    move-result v3

    .line 110
    int-to-double v3, v3

    .line 111
    iget-object v5, p1, Lcom/p1/mobile/putong/data/OMSDialogInfo;->content:Lcom/p1/mobile/putong/data/OMSDialogContent;

    .line 112
    .line 113
    iget-object v5, v5, Lcom/p1/mobile/putong/data/OMSDialogContent;->web:Lcom/p1/mobile/putong/data/OMSWebDialogResource;

    .line 114
    .line 115
    iget-object v5, v5, Lcom/p1/mobile/putong/data/OMSWebDialogResource;->height:Lcom/p1/mobile/putong/data/OMSWebDialogPerimeter;

    .line 116
    .line 117
    iget-wide v5, v5, Lcom/p1/mobile/putong/data/OMSWebDialogPerimeter;->value:D

    .line 118
    .line 119
    mul-double/2addr v3, v5

    .line 120
    double-to-int v3, v3

    .line 121
    :goto_1
    iput v3, v2, Landroid/widget/FrameLayout$LayoutParams;->height:I

    .line 122
    .line 123
    iget v10, v2, Landroid/widget/FrameLayout$LayoutParams;->width:I

    .line 124
    .line 125
    invoke-virtual {v1, v2}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 126
    .line 127
    .line 128
    new-instance v2, Ll/zpq;

    .line 129
    .line 130
    invoke-direct {v2, p0, p2, v1}, Ll/zpq;-><init>(Lcom/p1/mobile/putong/app/PutongAct;Ljava/lang/String;Lcom/p1/mobile/putong/app/web/WebViewX;)V

    .line 131
    .line 132
    .line 133
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->dialog()Lcom/p1/mobile/android/app/Dialog$e;

    .line 134
    .line 135
    .line 136
    move-result-object p2

    .line 137
    invoke-virtual {p2}, Lcom/p1/mobile/android/app/Dialog$e;->u()Lcom/p1/mobile/android/app/Dialog$e;

    .line 138
    .line 139
    .line 140
    move-result-object p2

    .line 141
    invoke-virtual {p2, v0}, Lcom/p1/mobile/android/app/Dialog$e;->O(Landroid/view/View;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 142
    .line 143
    .line 144
    move-result-object p2

    .line 145
    iget-boolean v0, p1, Lcom/p1/mobile/putong/data/OMSDialogInfo;->cancelAble:Z

    .line 146
    .line 147
    invoke-virtual {p2, v0}, Lcom/p1/mobile/android/app/Dialog$e;->B(Z)Lcom/p1/mobile/android/app/Dialog$e;

    .line 148
    .line 149
    .line 150
    move-result-object p2

    .line 151
    new-instance v0, Ll/dl50;

    .line 152
    .line 153
    invoke-direct {v0, v2}, Ll/dl50;-><init>(Ll/zpq;)V

    .line 154
    .line 155
    .line 156
    invoke-virtual {p2, v0}, Lcom/p1/mobile/android/app/Dialog$e;->V(Landroid/content/DialogInterface$OnDismissListener;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 157
    .line 158
    .line 159
    move-result-object p2

    .line 160
    invoke-virtual {p2}, Lcom/p1/mobile/android/app/Dialog$e;->z()Lcom/p1/mobile/android/app/Dialog;

    .line 161
    .line 162
    .line 163
    move-result-object v6

    .line 164
    sget p2, Ll/ycc0;->I0:I

    .line 165
    .line 166
    invoke-virtual {v1, p2, v6}, Landroid/view/View;->setTag(ILjava/lang/Object;)V

    .line 167
    .line 168
    .line 169
    const-string p2, "tantan"

    .line 170
    .line 171
    invoke-virtual {v1, v2, p2}, Landroid/webkit/WebView;->addJavascriptInterface(Ljava/lang/Object;Ljava/lang/String;)V

    .line 172
    .line 173
    .line 174
    iget-object p2, p1, Lcom/p1/mobile/putong/data/OMSDialogInfo;->content:Lcom/p1/mobile/putong/data/OMSDialogContent;

    .line 175
    .line 176
    iget-object p2, p2, Lcom/p1/mobile/putong/data/OMSDialogContent;->web:Lcom/p1/mobile/putong/data/OMSWebDialogResource;

    .line 177
    .line 178
    iget-object p2, p2, Lcom/p1/mobile/putong/data/OMSWebDialogResource;->url:Ljava/lang/String;

    .line 179
    .line 180
    invoke-virtual {v1, p2}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;)V

    .line 181
    .line 182
    .line 183
    new-instance v4, Ll/el50$a;

    .line 184
    .line 185
    move-object v7, p0

    .line 186
    move-object v5, p0

    .line 187
    move-object v9, p1

    .line 188
    move v8, p3

    .line 189
    invoke-direct/range {v4 .. v10}, Ll/el50$a;-><init>(Landroid/content/Context;Lcom/p1/mobile/android/app/Dialog;Lcom/p1/mobile/putong/app/PutongAct;ZLcom/p1/mobile/putong/data/OMSDialogInfo;I)V

    .line 190
    .line 191
    .line 192
    invoke-virtual {v1, v4}, Lcom/p1/mobile/putong/app/web/WebViewX;->setWebViewClientX(Lcom/p1/mobile/putong/app/web/WebViewClientX;)V

    .line 193
    .line 194
    .line 195
    return-void
.end method

.class public Ll/bgm;
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

.method public static a(Lcom/p1/mobile/putong/core/data/LiteraturesComments;Lcom/p1/mobile/putong/core/data/LiteraturesComments;)Ljava/lang/String;
    .locals 9

    .line 1
    const/4 v0, 0x2

    .line 2
    const-string v1, "watched"

    .line 3
    .line 4
    const/4 v2, 0x1

    .line 5
    const-string v3, "watching"

    .line 6
    .line 7
    const/4 v4, 0x0

    .line 8
    const-string v5, "to_watch"

    .line 9
    .line 10
    const/4 v6, -0x1

    .line 11
    const-string v7, ""

    .line 12
    .line 13
    if-eqz p1, :cond_3

    .line 14
    .line 15
    if-eqz p0, :cond_3

    .line 16
    .line 17
    iget-object v8, p1, Lcom/p1/mobile/putong/core/data/LiteraturesComments;->interestLevel:Ljava/lang/String;

    .line 18
    .line 19
    invoke-static {v8}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 20
    .line 21
    .line 22
    move-result v8

    .line 23
    if-nez v8, :cond_3

    .line 24
    .line 25
    iget-object v8, p0, Lcom/p1/mobile/putong/core/data/LiteraturesComments;->interestLevel:Ljava/lang/String;

    .line 26
    .line 27
    invoke-static {v8}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 28
    .line 29
    .line 30
    move-result v8

    .line 31
    if-nez v8, :cond_3

    .line 32
    .line 33
    iget-object v8, p0, Lcom/p1/mobile/putong/core/data/LiteraturesComments;->interestLevel:Ljava/lang/String;

    .line 34
    .line 35
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/LiteraturesComments;->interestLevel:Ljava/lang/String;

    .line 36
    .line 37
    invoke-virtual {v8, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 38
    .line 39
    .line 40
    move-result p1

    .line 41
    if-eqz p1, :cond_3

    .line 42
    .line 43
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/LiteraturesComments;->interestLevel:Ljava/lang/String;

    .line 44
    .line 45
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 46
    .line 47
    .line 48
    invoke-virtual {p0}, Ljava/lang/String;->hashCode()I

    .line 49
    .line 50
    .line 51
    move-result p1

    .line 52
    sparse-switch p1, :sswitch_data_0

    .line 53
    .line 54
    .line 55
    :goto_0
    move v0, v6

    .line 56
    goto :goto_1

    .line 57
    :sswitch_0
    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 58
    .line 59
    .line 60
    move-result p0

    .line 61
    if-nez p0, :cond_2

    .line 62
    .line 63
    goto :goto_0

    .line 64
    :sswitch_1
    invoke-virtual {p0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 65
    .line 66
    .line 67
    move-result p0

    .line 68
    if-nez p0, :cond_0

    .line 69
    .line 70
    goto :goto_0

    .line 71
    :cond_0
    move v0, v2

    .line 72
    goto :goto_1

    .line 73
    :sswitch_2
    invoke-virtual {p0, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 74
    .line 75
    .line 76
    move-result p0

    .line 77
    if-nez p0, :cond_1

    .line 78
    .line 79
    goto :goto_0

    .line 80
    :cond_1
    move v0, v4

    .line 81
    :cond_2
    :goto_1
    packed-switch v0, :pswitch_data_0

    .line 82
    .line 83
    .line 84
    return-object v7

    .line 85
    :pswitch_0
    const-string p0, "both_watched"

    .line 86
    .line 87
    return-object p0

    .line 88
    :pswitch_1
    const-string p0, "both_watching"

    .line 89
    .line 90
    return-object p0

    .line 91
    :pswitch_2
    const-string p0, "both_wish"

    .line 92
    .line 93
    return-object p0

    .line 94
    :cond_3
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 95
    .line 96
    .line 97
    move-result p1

    .line 98
    if-eqz p1, :cond_7

    .line 99
    .line 100
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/LiteraturesComments;->interestLevel:Ljava/lang/String;

    .line 101
    .line 102
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 103
    .line 104
    .line 105
    invoke-virtual {p0}, Ljava/lang/String;->hashCode()I

    .line 106
    .line 107
    .line 108
    move-result p1

    .line 109
    sparse-switch p1, :sswitch_data_1

    .line 110
    .line 111
    .line 112
    :goto_2
    move v0, v6

    .line 113
    goto :goto_3

    .line 114
    :sswitch_3
    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 115
    .line 116
    .line 117
    move-result p0

    .line 118
    if-nez p0, :cond_6

    .line 119
    .line 120
    goto :goto_2

    .line 121
    :sswitch_4
    invoke-virtual {p0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 122
    .line 123
    .line 124
    move-result p0

    .line 125
    if-nez p0, :cond_4

    .line 126
    .line 127
    goto :goto_2

    .line 128
    :cond_4
    move v0, v2

    .line 129
    goto :goto_3

    .line 130
    :sswitch_5
    invoke-virtual {p0, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 131
    .line 132
    .line 133
    move-result p0

    .line 134
    if-nez p0, :cond_5

    .line 135
    .line 136
    goto :goto_2

    .line 137
    :cond_5
    move v0, v4

    .line 138
    :cond_6
    :goto_3
    packed-switch v0, :pswitch_data_1

    .line 139
    .line 140
    .line 141
    return-object v7

    .line 142
    :pswitch_3
    const-string p0, "single_watched"

    .line 143
    .line 144
    return-object p0

    .line 145
    :pswitch_4
    const-string p0, "single_watching"

    .line 146
    .line 147
    return-object p0

    .line 148
    :pswitch_5
    const-string p0, "single_wish"

    .line 149
    .line 150
    return-object p0

    .line 151
    :cond_7
    return-object v7

    .line 152
    nop

    .line 153
    :sswitch_data_0
    .sparse-switch
        -0x554cd1f5 -> :sswitch_2
        0x207e6cb3 -> :sswitch_1
        0x431cd9ae -> :sswitch_0
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
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch

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
    :sswitch_data_1
    .sparse-switch
        -0x554cd1f5 -> :sswitch_5
        0x207e6cb3 -> :sswitch_4
        0x431cd9ae -> :sswitch_3
    .end sparse-switch

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
    :pswitch_data_1
    .packed-switch 0x0
        :pswitch_5
        :pswitch_4
        :pswitch_3
    .end packed-switch
.end method

.method public static b(Lcom/p1/mobile/putong/core/data/Literatures;)Ljava/lang/String;
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Literatures;->category:Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    const-string v2, "movie"

    .line 11
    .line 12
    const-string v3, "book"

    .line 13
    .line 14
    const/4 v4, -0x1

    .line 15
    sparse-switch v1, :sswitch_data_0

    .line 16
    .line 17
    .line 18
    goto :goto_0

    .line 19
    :sswitch_0
    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-nez v0, :cond_0

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    const/4 v4, 0x2

    .line 27
    goto :goto_0

    .line 28
    :sswitch_1
    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    if-nez v0, :cond_1

    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_1
    const/4 v4, 0x1

    .line 36
    goto :goto_0

    .line 37
    :sswitch_2
    const-string v1, "teleplay"

    .line 38
    .line 39
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    if-nez v0, :cond_2

    .line 44
    .line 45
    goto :goto_0

    .line 46
    :cond_2
    const/4 v4, 0x0

    .line 47
    :goto_0
    packed-switch v4, :pswitch_data_0

    .line 48
    .line 49
    .line 50
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Literatures;->category:Ljava/lang/String;

    .line 51
    .line 52
    return-object p0

    .line 53
    :pswitch_0
    return-object v2

    .line 54
    :pswitch_1
    return-object v3

    .line 55
    :pswitch_2
    const-string p0, "tv_show"

    .line 56
    .line 57
    return-object p0

    .line 58
    nop

    .line 59
    :sswitch_data_0
    .sparse-switch
        -0x51131622 -> :sswitch_2
        0x2e3ae9 -> :sswitch_1
        0x6343f30 -> :sswitch_0
    .end sparse-switch

    .line 60
    .line 61
    .line 62
    .line 63
    .line 64
    .line 65
    .line 66
    .line 67
    .line 68
    .line 69
    .line 70
    .line 71
    .line 72
    .line 73
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public static c(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/Literatures;
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
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 8
    .line 9
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 10
    .line 11
    invoke-virtual {v0, p0}, Ll/dkb;->h7(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/Literatures;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0

    .line 16
    :cond_0
    const/4 p0, 0x0

    .line 17
    return-object p0
.end method

.method public static d(Ljava/lang/String;Ljava/lang/String;)Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/LiteraturesComments;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    invoke-virtual {v0, p0, p1}, Ll/dkb;->O9(Ljava/lang/String;Ljava/lang/String;)Ljava/util/List;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public static e(Ljava/lang/String;)Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/LiteraturesComments;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-static {v0, p0}, Ll/bgm;->d(Ljava/lang/String;Ljava/lang/String;)Ljava/util/List;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

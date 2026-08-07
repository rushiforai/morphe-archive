.class public Ll/m9e0;
.super Ll/o5e0;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/o5e0;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public c(Ll/abe0;Ll/z20;)Landroid/content/Intent;
    .locals 14
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/abe0;",
            "Ll/z20<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)",
            "Landroid/content/Intent;"
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Ll/abe0;->f()Ljava/util/Map;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const-string v0, "userId"

    .line 6
    .line 7
    invoke-interface {p0, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    move-object v1, p0

    .line 12
    check-cast v1, Ljava/lang/String;

    .line 13
    .line 14
    invoke-virtual {p1}, Ll/abe0;->f()Ljava/util/Map;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    const-string v0, "follow"

    .line 19
    .line 20
    invoke-interface {p0, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    check-cast p0, Ljava/lang/CharSequence;

    .line 25
    .line 26
    const-string v0, "1"

    .line 27
    .line 28
    invoke-static {p0, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 29
    .line 30
    .line 31
    move-result v11

    .line 32
    invoke-virtual {p1}, Ll/abe0;->f()Ljava/util/Map;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    const-string v0, "query"

    .line 37
    .line 38
    invoke-interface {p0, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    check-cast p0, Ljava/lang/CharSequence;

    .line 43
    .line 44
    const-string v0, "christmas"

    .line 45
    .line 46
    invoke-static {p0, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 47
    .line 48
    .line 49
    move-result p0

    .line 50
    invoke-virtual {p1}, Ll/abe0;->f()Ljava/util/Map;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    const-string v2, "shouldHideToolbarButton"

    .line 55
    .line 56
    invoke-interface {v0, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    check-cast v0, Ljava/lang/CharSequence;

    .line 61
    .line 62
    const-string v2, "true"

    .line 63
    .line 64
    invoke-static {v0, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 65
    .line 66
    .line 67
    invoke-virtual {p1}, Ll/abe0;->f()Ljava/util/Map;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    const-string v2, "reason"

    .line 72
    .line 73
    invoke-interface {v0, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 74
    .line 75
    .line 76
    move-result-object v0

    .line 77
    check-cast v0, Ljava/lang/String;

    .line 78
    .line 79
    invoke-virtual {p1}, Ll/abe0;->f()Ljava/util/Map;

    .line 80
    .line 81
    .line 82
    move-result-object v2

    .line 83
    const-string v3, "tag"

    .line 84
    .line 85
    invoke-interface {v2, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 86
    .line 87
    .line 88
    move-result-object v2

    .line 89
    check-cast v2, Ljava/lang/String;

    .line 90
    .line 91
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 92
    .line 93
    .line 94
    move-result v3

    .line 95
    const-string v4, "unknown_"

    .line 96
    .line 97
    const/4 v5, 0x0

    .line 98
    if-nez v3, :cond_2

    .line 99
    .line 100
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 101
    .line 102
    .line 103
    move-result v3

    .line 104
    if-nez v3, :cond_2

    .line 105
    .line 106
    invoke-static {v1}, Ll/xwa;->C(Ljava/lang/String;)Z

    .line 107
    .line 108
    .line 109
    move-result p0

    .line 110
    if-nez p0, :cond_0

    .line 111
    .line 112
    return-object v5

    .line 113
    :cond_0
    :try_start_0
    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 114
    .line 115
    .line 116
    move-result p0
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    .line 117
    :goto_0
    move v12, p0

    .line 118
    goto :goto_1

    .line 119
    :catch_0
    const/4 p0, 0x0

    .line 120
    goto :goto_0

    .line 121
    :goto_1
    invoke-virtual {p1}, Ll/abe0;->b()Landroid/content/Context;

    .line 122
    .line 123
    .line 124
    move-result-object v0

    .line 125
    invoke-static {v4}, Lcom/p1/mobile/putong/data/RelationshipStatus;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 126
    .line 127
    .line 128
    move-result-object v6

    .line 129
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 130
    .line 131
    .line 132
    move-result p0

    .line 133
    if-nez p0, :cond_1

    .line 134
    .line 135
    :goto_2
    move-object v13, v2

    .line 136
    goto :goto_3

    .line 137
    :cond_1
    const-string v2, ""

    .line 138
    .line 139
    goto :goto_2

    .line 140
    :goto_3
    const-string v2, "push_like"

    .line 141
    .line 142
    const/4 v3, 0x1

    .line 143
    const/4 v4, 0x0

    .line 144
    const/4 v5, 0x0

    .line 145
    const/16 v7, 0x111

    .line 146
    .line 147
    const/4 v8, 0x0

    .line 148
    const/4 v9, 0x1

    .line 149
    const/4 v10, 0x0

    .line 150
    const/4 v11, 0x0

    .line 151
    invoke-static/range {v0 .. v13}, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->y2(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;ZZZLcom/p1/mobile/putong/data/RelationshipStatus;IZZZZILjava/lang/String;)Landroid/content/Intent;

    .line 152
    .line 153
    .line 154
    move-result-object p0

    .line 155
    return-object p0

    .line 156
    :cond_2
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 157
    .line 158
    .line 159
    move-result v0

    .line 160
    if-nez v0, :cond_4

    .line 161
    .line 162
    if-eqz p0, :cond_3

    .line 163
    .line 164
    const-string p0, "from_christmas"

    .line 165
    .line 166
    :goto_4
    move-object v2, p0

    .line 167
    goto :goto_5

    .line 168
    :cond_3
    const-string p0, "team_account"

    .line 169
    .line 170
    goto :goto_4

    .line 171
    :goto_5
    invoke-virtual {p1}, Ll/abe0;->b()Landroid/content/Context;

    .line 172
    .line 173
    .line 174
    move-result-object v0

    .line 175
    invoke-static {v4}, Lcom/p1/mobile/putong/data/RelationshipStatus;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 176
    .line 177
    .line 178
    move-result-object v6

    .line 179
    const/4 v9, 0x1

    .line 180
    const/4 v10, 0x0

    .line 181
    const/4 v3, 0x0

    .line 182
    const/4 v4, 0x0

    .line 183
    const/4 v5, 0x0

    .line 184
    const/16 v7, 0x111

    .line 185
    .line 186
    const/4 v8, 0x0

    .line 187
    invoke-static/range {v0 .. v11}, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->w2(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;ZZZLcom/p1/mobile/putong/data/RelationshipStatus;IZZZZ)Landroid/content/Intent;

    .line 188
    .line 189
    .line 190
    move-result-object p0

    .line 191
    return-object p0

    .line 192
    :cond_4
    return-object v5
.end method

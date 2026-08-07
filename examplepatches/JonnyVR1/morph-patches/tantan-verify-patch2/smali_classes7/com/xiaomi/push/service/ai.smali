.class public Lcom/xiaomi/push/service/ai;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public static a(Lcom/xiaomi/push/service/ah;Lcom/xiaomi/push/gl;)I
    .locals 2

    .line 163
    sget-object v0, Lcom/xiaomi/push/service/ai$1;->a:[I

    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    move-result v1

    aget v0, v0, v1

    const/4 v1, 0x1

    if-eq v0, v1, :cond_0

    const/4 v1, 0x0

    .line 164
    :cond_0
    invoke-virtual {p0, p1, v1}, Lcom/xiaomi/push/service/ah;->a(Lcom/xiaomi/push/gl;I)I

    move-result p0

    return p0
.end method

.method private static a(Ljava/util/List;Z)Ljava/util/List;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/xiaomi/push/gq;",
            ">;Z)",
            "Ljava/util/List<",
            "Landroid/util/Pair<",
            "Ljava/lang/Integer;",
            "Ljava/lang/Object;",
            ">;>;"
        }
    .end annotation

    .line 1
    invoke-static {p0}, Ll/q6r0;->a(Ljava/util/Collection;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    return-object v1

    .line 9
    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    .line 10
    .line 11
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 12
    .line 13
    .line 14
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 19
    .line 20
    .line 21
    move-result v2

    .line 22
    if-eqz v2, :cond_7

    .line 23
    .line 24
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object v2

    .line 28
    check-cast v2, Lcom/xiaomi/push/gq;

    .line 29
    .line 30
    invoke-virtual {v2}, Lcom/xiaomi/push/gq;->a()I

    .line 31
    .line 32
    .line 33
    move-result v3

    .line 34
    invoke-virtual {v2}, Lcom/xiaomi/push/gq;->b()I

    .line 35
    .line 36
    .line 37
    move-result v4

    .line 38
    invoke-static {v4}, Lcom/xiaomi/push/gm;->a(I)Lcom/xiaomi/push/gm;

    .line 39
    .line 40
    .line 41
    move-result-object v4

    .line 42
    if-nez v4, :cond_1

    .line 43
    .line 44
    goto :goto_0

    .line 45
    :cond_1
    if-eqz p1, :cond_2

    .line 46
    .line 47
    iget-boolean v5, v2, Lcom/xiaomi/push/gq;->a:Z

    .line 48
    .line 49
    if-eqz v5, :cond_2

    .line 50
    .line 51
    new-instance v2, Landroid/util/Pair;

    .line 52
    .line 53
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 54
    .line 55
    .line 56
    move-result-object v3

    .line 57
    invoke-direct {v2, v3, v1}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 58
    .line 59
    .line 60
    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 61
    .line 62
    .line 63
    goto :goto_0

    .line 64
    :cond_2
    sget-object v5, Lcom/xiaomi/push/service/ai$1;->b:[I

    .line 65
    .line 66
    invoke-virtual {v4}, Ljava/lang/Enum;->ordinal()I

    .line 67
    .line 68
    .line 69
    move-result v4

    .line 70
    aget v4, v5, v4

    .line 71
    .line 72
    const/4 v5, 0x1

    .line 73
    if-eq v4, v5, :cond_6

    .line 74
    .line 75
    const/4 v5, 0x2

    .line 76
    if-eq v4, v5, :cond_5

    .line 77
    .line 78
    const/4 v5, 0x3

    .line 79
    if-eq v4, v5, :cond_4

    .line 80
    .line 81
    const/4 v5, 0x4

    .line 82
    if-eq v4, v5, :cond_3

    .line 83
    .line 84
    move-object v4, v1

    .line 85
    goto :goto_1

    .line 86
    :cond_3
    new-instance v4, Landroid/util/Pair;

    .line 87
    .line 88
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 89
    .line 90
    .line 91
    move-result-object v3

    .line 92
    invoke-virtual {v2}, Lcom/xiaomi/push/gq;->g()Z

    .line 93
    .line 94
    .line 95
    move-result v2

    .line 96
    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 97
    .line 98
    .line 99
    move-result-object v2

    .line 100
    invoke-direct {v4, v3, v2}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 101
    .line 102
    .line 103
    goto :goto_1

    .line 104
    :cond_4
    new-instance v4, Landroid/util/Pair;

    .line 105
    .line 106
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 107
    .line 108
    .line 109
    move-result-object v3

    .line 110
    invoke-virtual {v2}, Lcom/xiaomi/push/gq;->a()Ljava/lang/String;

    .line 111
    .line 112
    .line 113
    move-result-object v2

    .line 114
    invoke-direct {v4, v3, v2}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 115
    .line 116
    .line 117
    goto :goto_1

    .line 118
    :cond_5
    new-instance v4, Landroid/util/Pair;

    .line 119
    .line 120
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 121
    .line 122
    .line 123
    move-result-object v3

    .line 124
    invoke-virtual {v2}, Lcom/xiaomi/push/gq;->a()J

    .line 125
    .line 126
    .line 127
    move-result-wide v5

    .line 128
    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 129
    .line 130
    .line 131
    move-result-object v2

    .line 132
    invoke-direct {v4, v3, v2}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 133
    .line 134
    .line 135
    goto :goto_1

    .line 136
    :cond_6
    new-instance v4, Landroid/util/Pair;

    .line 137
    .line 138
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 139
    .line 140
    .line 141
    move-result-object v3

    .line 142
    invoke-virtual {v2}, Lcom/xiaomi/push/gq;->c()I

    .line 143
    .line 144
    .line 145
    move-result v2

    .line 146
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 147
    .line 148
    .line 149
    move-result-object v2

    .line 150
    invoke-direct {v4, v3, v2}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 151
    .line 152
    .line 153
    :goto_1
    invoke-interface {v0, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 154
    .line 155
    .line 156
    goto/16 :goto_0

    .line 157
    .line 158
    :cond_7
    return-object v0
.end method

.method public static a(Lcom/xiaomi/push/service/ah;Lcom/xiaomi/push/hc;)V
    .locals 2

    .line 159
    const-string v0, "-->updateCustomConfigs(): onlineConfig="

    const-string v1, ", configMessage="

    filled-new-array {v0, p0, v1, p1}, [Ljava/lang/Object;

    move-result-object v0

    const-string v1, "OnlineConfigHelper"

    invoke-static {v1, v0}, Ll/ouq0;->y(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 160
    invoke-virtual {p1}, Lcom/xiaomi/push/hc;->a()Ljava/util/List;

    move-result-object p1

    const/4 v0, 0x1

    invoke-static {p1, v0}, Lcom/xiaomi/push/service/ai;->a(Ljava/util/List;Z)Ljava/util/List;

    move-result-object p1

    .line 161
    invoke-virtual {p0, p1}, Lcom/xiaomi/push/service/ah;->a(Ljava/util/List;)V

    .line 162
    invoke-virtual {p0}, Lcom/xiaomi/push/service/ah;->b()V

    return-void
.end method

.method public static a(Lcom/xiaomi/push/service/ah;Lcom/xiaomi/push/hd;)V
    .locals 6

    .line 165
    const-string v0, "-->updateNormalConfigs(): onlineConfig="

    const-string v1, ", configMessage="

    filled-new-array {v0, p0, v1, p1}, [Ljava/lang/Object;

    move-result-object v0

    const-string v1, "OnlineConfigHelper"

    invoke-static {v1, v0}, Ll/ouq0;->y(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 166
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 167
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 168
    invoke-virtual {p1}, Lcom/xiaomi/push/hd;->a()Ljava/util/List;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_0
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/xiaomi/push/go;

    .line 169
    new-instance v3, Landroid/util/Pair;

    invoke-virtual {v2}, Lcom/xiaomi/push/go;->a()Lcom/xiaomi/push/gl;

    move-result-object v4

    invoke-virtual {v2}, Lcom/xiaomi/push/go;->a()I

    move-result v5

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-direct {v3, v4, v5}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 170
    iget-object v2, v2, Lcom/xiaomi/push/go;->a:Ljava/util/List;

    const/4 v3, 0x0

    invoke-static {v2, v3}, Lcom/xiaomi/push/service/ai;->a(Ljava/util/List;Z)Ljava/util/List;

    move-result-object v2

    .line 171
    invoke-static {v2}, Ll/q6r0;->a(Ljava/util/Collection;)Z

    move-result v3

    if-nez v3, :cond_0

    .line 172
    invoke-interface {v1, v2}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    goto :goto_0

    .line 173
    :cond_1
    invoke-virtual {p0, v0, v1}, Lcom/xiaomi/push/service/ah;->a(Ljava/util/List;Ljava/util/List;)V

    .line 174
    invoke-virtual {p0}, Lcom/xiaomi/push/service/ah;->b()V

    return-void
.end method

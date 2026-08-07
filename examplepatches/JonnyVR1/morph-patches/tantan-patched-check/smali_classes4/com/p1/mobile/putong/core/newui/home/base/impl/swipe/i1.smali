.class public Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/i1;
.super Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/a;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/a;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public bridge synthetic a(Ll/e2m;)Ljava/lang/Object;
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/i1;->p(Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;)Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public bridge synthetic b(Ll/e2m;)Z
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/i1;->q(Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public p(Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;)Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;
    .locals 0

    .line 1
    const/4 p0, 0x0

    return-object p0
.end method

.method public q(Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;)Z
    .locals 9

    .line 1
    invoke-static {}, Ll/yti0;->b()Ll/yti0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ll/yti0;->f()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    const/4 v0, 0x0

    .line 10
    if-nez p0, :cond_0

    .line 11
    .line 12
    return v0

    .line 13
    :cond_0
    invoke-static {}, Ll/yti0;->b()Ll/yti0;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    if-nez v1, :cond_1

    .line 22
    .line 23
    return v0

    .line 24
    :cond_1
    invoke-virtual {p0}, Ll/yti0;->a()Lcom/p1/mobile/putong/data/OMSThemeInfo;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 29
    .line 30
    .line 31
    move-result v1

    .line 32
    if-nez v1, :cond_2

    .line 33
    .line 34
    return v0

    .line 35
    :cond_2
    iget-object v1, p0, Lcom/p1/mobile/putong/data/OMSThemeInfo;->countdownView:Lcom/p1/mobile/putong/data/OMSThemeCountdownInfo;

    .line 36
    .line 37
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 38
    .line 39
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->z0:Ll/uab;

    .line 40
    .line 41
    iget-object v2, v2, Ll/uab;->Y:Ll/jxd0;

    .line 42
    .line 43
    invoke-static {}, Ll/yti0;->b()Ll/yti0;

    .line 44
    .line 45
    .line 46
    move-result-object v3

    .line 47
    invoke-virtual {v3}, Ll/yti0;->f()Z

    .line 48
    .line 49
    .line 50
    move-result v3

    .line 51
    if-eqz v3, :cond_4

    .line 52
    .line 53
    invoke-static {}, Ll/pzi0;->o()J

    .line 54
    .line 55
    .line 56
    move-result-wide v3

    .line 57
    iget-wide v5, v1, Lcom/p1/mobile/putong/data/OMSThemeCountdownInfo;->startMs:J

    .line 58
    .line 59
    sub-long/2addr v3, v5

    .line 60
    iget-object v1, p0, Lcom/p1/mobile/putong/data/OMSThemeInfo;->bubbleOpen:Lcom/p1/mobile/putong/data/OMSThemeBubbleOpenInfo;

    .line 61
    .line 62
    iget v1, v1, Lcom/p1/mobile/putong/data/OMSThemeBubbleOpenInfo;->day:I

    .line 63
    .line 64
    int-to-long v5, v1

    .line 65
    const-wide/32 v7, 0x5265c00

    .line 66
    .line 67
    .line 68
    mul-long/2addr v5, v7

    .line 69
    cmp-long v1, v3, v5

    .line 70
    .line 71
    if-ltz v1, :cond_4

    .line 72
    .line 73
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 74
    .line 75
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->z0:Ll/uab;

    .line 76
    .line 77
    iget-object v1, v1, Ll/uab;->U:Ll/wyd0;

    .line 78
    .line 79
    invoke-virtual {v1}, Ll/azd0;->get()Ljava/lang/Object;

    .line 80
    .line 81
    .line 82
    move-result-object v3

    .line 83
    check-cast v3, Ljava/lang/String;

    .line 84
    .line 85
    const-string v4, "_"

    .line 86
    .line 87
    invoke-virtual {v3, v4}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    .line 88
    .line 89
    .line 90
    move-result-object v3

    .line 91
    array-length v5, v3

    .line 92
    const/4 v6, 0x2

    .line 93
    if-ne v5, v6, :cond_4

    .line 94
    .line 95
    const/4 v5, 0x1

    .line 96
    aget-object v6, v3, v5

    .line 97
    .line 98
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    .line 99
    .line 100
    .line 101
    move-result-object v6

    .line 102
    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    .line 103
    .line 104
    .line 105
    move-result v6

    .line 106
    aget-object v3, v3, v0

    .line 107
    .line 108
    invoke-static {v3}, Ljava/lang/Long;->valueOf(Ljava/lang/String;)Ljava/lang/Long;

    .line 109
    .line 110
    .line 111
    move-result-object v3

    .line 112
    invoke-virtual {v3}, Ljava/lang/Long;->longValue()J

    .line 113
    .line 114
    .line 115
    move-result-wide v7

    .line 116
    invoke-static {v7, v8}, Ll/pzi0;->D(J)Z

    .line 117
    .line 118
    .line 119
    move-result v3

    .line 120
    if-eqz v3, :cond_3

    .line 121
    .line 122
    add-int/2addr v5, v6

    .line 123
    :cond_3
    new-instance v3, Ljava/lang/StringBuilder;

    .line 124
    .line 125
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 126
    .line 127
    .line 128
    invoke-static {}, Ll/pzi0;->o()J

    .line 129
    .line 130
    .line 131
    move-result-wide v6

    .line 132
    invoke-virtual {v3, v6, v7}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 133
    .line 134
    .line 135
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 136
    .line 137
    .line 138
    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 139
    .line 140
    .line 141
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 142
    .line 143
    .line 144
    move-result-object v3

    .line 145
    invoke-virtual {v1, v3}, Ll/wyd0;->put(Ljava/lang/Object;)Z

    .line 146
    .line 147
    .line 148
    iget-object v1, p0, Lcom/p1/mobile/putong/data/OMSThemeInfo;->bubbleOpen:Lcom/p1/mobile/putong/data/OMSThemeBubbleOpenInfo;

    .line 149
    .line 150
    iget v1, v1, Lcom/p1/mobile/putong/data/OMSThemeBubbleOpenInfo;->swipeCnt:I

    .line 151
    .line 152
    if-ne v5, v1, :cond_4

    .line 153
    .line 154
    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 155
    .line 156
    invoke-virtual {v2, v1}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 157
    .line 158
    .line 159
    iget-object p1, p1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->b:Lcom/p1/mobile/putong/core/newui/home/b;

    .line 160
    .line 161
    iget-object v1, p0, Lcom/p1/mobile/putong/data/OMSThemeInfo;->bubbleOpen:Lcom/p1/mobile/putong/data/OMSThemeBubbleOpenInfo;

    .line 162
    .line 163
    iget-object v2, v1, Lcom/p1/mobile/putong/data/OMSThemeBubbleOpenInfo;->txt:Ljava/lang/String;

    .line 164
    .line 165
    iget-object v1, v1, Lcom/p1/mobile/putong/data/OMSThemeBubbleOpenInfo;->color:Ljava/lang/String;

    .line 166
    .line 167
    const-string v3, "#FFFFFF"

    .line 168
    .line 169
    invoke-static {v1, v3}, Ll/yti0;->n(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 170
    .line 171
    .line 172
    move-result-object v1

    .line 173
    iget-object p0, p0, Lcom/p1/mobile/putong/data/OMSThemeInfo;->bubbleOpen:Lcom/p1/mobile/putong/data/OMSThemeBubbleOpenInfo;

    .line 174
    .line 175
    iget-object p0, p0, Lcom/p1/mobile/putong/data/OMSThemeBubbleOpenInfo;->bgColor:Ljava/lang/String;

    .line 176
    .line 177
    const-string v3, "#FE7E1D"

    .line 178
    .line 179
    invoke-static {p0, v3}, Ll/yti0;->n(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 180
    .line 181
    .line 182
    move-result-object p0

    .line 183
    invoke-virtual {p1, v2, v1, p0}, Lcom/p1/mobile/putong/core/newui/home/b;->z6(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 184
    .line 185
    .line 186
    :cond_4
    return v0
.end method

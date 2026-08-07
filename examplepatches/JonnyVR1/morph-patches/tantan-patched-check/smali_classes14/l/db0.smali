.class public Ll/db0;
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

.method public static a(Lcom/p1/mobile/putong/core/data/SwipeDirection;Lcom/p1/mobile/putong/data/OMSAdCardInfo;)V
    .locals 6

    .line 1
    invoke-static {}, Ll/pf7;->g()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_3

    .line 6
    .line 7
    iget-object v0, p1, Lcom/p1/mobile/putong/data/OMSAdCardInfo;->identifier:Ljava/lang/String;

    .line 8
    .line 9
    const-string v1, "guideNewUserCompleteMaterial"

    .line 10
    .line 11
    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_3

    .line 16
    .line 17
    sget-object v0, Lcom/p1/mobile/putong/core/data/SwipeDirection;->RIGHT:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 18
    .line 19
    if-eq p0, v0, :cond_0

    .line 20
    .line 21
    sget-object v0, Lcom/p1/mobile/putong/core/data/SwipeDirection;->UP:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 22
    .line 23
    if-ne p0, v0, :cond_3

    .line 24
    .line 25
    :cond_0
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 26
    .line 27
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 28
    .line 29
    iget-object p0, p0, Ll/dkb;->Q1:Ll/byd0;

    .line 30
    .line 31
    invoke-static {}, Ll/pzi0;->o()J

    .line 32
    .line 33
    .line 34
    move-result-wide v0

    .line 35
    invoke-static {}, Ll/pf7;->b()I

    .line 36
    .line 37
    .line 38
    move-result v2

    .line 39
    const v3, 0x15180

    .line 40
    .line 41
    .line 42
    mul-int/2addr v2, v3

    .line 43
    int-to-long v2, v2

    .line 44
    const-wide/16 v4, 0x3e8

    .line 45
    .line 46
    mul-long/2addr v2, v4

    .line 47
    add-long/2addr v0, v2

    .line 48
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    invoke-virtual {p0, v0}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 53
    .line 54
    .line 55
    iget-object p0, p1, Lcom/p1/mobile/putong/data/OMSAdCardInfo;->content:Lcom/p1/mobile/putong/data/OMSAdCardContent;

    .line 56
    .line 57
    iget-object p0, p0, Lcom/p1/mobile/putong/data/OMSAdCardContent;->omsCard:Lcom/p1/mobile/putong/data/OmsCard;

    .line 58
    .line 59
    iget-object p0, p0, Lcom/p1/mobile/putong/data/OmsCard;->action:Lcom/p1/mobile/putong/data/Action;

    .line 60
    .line 61
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Action;->deeplink:Ljava/lang/String;

    .line 62
    .line 63
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 64
    .line 65
    .line 66
    move-result p0

    .line 67
    if-nez p0, :cond_1

    .line 68
    .line 69
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 70
    .line 71
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 72
    .line 73
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/g;->V0:Ll/wyd0;

    .line 74
    .line 75
    iget-object v0, p1, Lcom/p1/mobile/putong/data/OMSAdCardInfo;->content:Lcom/p1/mobile/putong/data/OMSAdCardContent;

    .line 76
    .line 77
    iget-object v0, v0, Lcom/p1/mobile/putong/data/OMSAdCardContent;->omsCard:Lcom/p1/mobile/putong/data/OmsCard;

    .line 78
    .line 79
    iget-object v0, v0, Lcom/p1/mobile/putong/data/OmsCard;->action:Lcom/p1/mobile/putong/data/Action;

    .line 80
    .line 81
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Action;->deeplink:Ljava/lang/String;

    .line 82
    .line 83
    invoke-virtual {p0, v0}, Ll/wyd0;->put(Ljava/lang/Object;)Z

    .line 84
    .line 85
    .line 86
    :cond_1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/OMSAdCardInfo;->content:Lcom/p1/mobile/putong/data/OMSAdCardContent;

    .line 87
    .line 88
    iget-object p0, p0, Lcom/p1/mobile/putong/data/OMSAdCardContent;->omsCard:Lcom/p1/mobile/putong/data/OmsCard;

    .line 89
    .line 90
    iget-object p0, p0, Lcom/p1/mobile/putong/data/OmsCard;->title:Ljava/lang/String;

    .line 91
    .line 92
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 93
    .line 94
    .line 95
    move-result p0

    .line 96
    const/4 v0, 0x0

    .line 97
    if-nez p0, :cond_2

    .line 98
    .line 99
    iget-object p0, p1, Lcom/p1/mobile/putong/data/OMSAdCardInfo;->content:Lcom/p1/mobile/putong/data/OMSAdCardContent;

    .line 100
    .line 101
    iget-object p0, p0, Lcom/p1/mobile/putong/data/OMSAdCardContent;->omsCard:Lcom/p1/mobile/putong/data/OmsCard;

    .line 102
    .line 103
    iget-object p0, p0, Lcom/p1/mobile/putong/data/OmsCard;->title:Ljava/lang/String;

    .line 104
    .line 105
    const-string v1, " "

    .line 106
    .line 107
    invoke-virtual {p0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 108
    .line 109
    .line 110
    move-result p0

    .line 111
    if-eqz p0, :cond_2

    .line 112
    .line 113
    iget-object p0, p1, Lcom/p1/mobile/putong/data/OMSAdCardInfo;->content:Lcom/p1/mobile/putong/data/OMSAdCardContent;

    .line 114
    .line 115
    iget-object p0, p0, Lcom/p1/mobile/putong/data/OMSAdCardContent;->omsCard:Lcom/p1/mobile/putong/data/OmsCard;

    .line 116
    .line 117
    iget-object p0, p0, Lcom/p1/mobile/putong/data/OmsCard;->title:Ljava/lang/String;

    .line 118
    .line 119
    invoke-virtual {p0, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    .line 120
    .line 121
    .line 122
    move-result-object p0

    .line 123
    aget-object p0, p0, v0

    .line 124
    .line 125
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 126
    .line 127
    .line 128
    move-result p0

    .line 129
    if-nez p0, :cond_2

    .line 130
    .line 131
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 132
    .line 133
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 134
    .line 135
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/g;->T0:Ll/wyd0;

    .line 136
    .line 137
    iget-object v2, p1, Lcom/p1/mobile/putong/data/OMSAdCardInfo;->content:Lcom/p1/mobile/putong/data/OMSAdCardContent;

    .line 138
    .line 139
    iget-object v2, v2, Lcom/p1/mobile/putong/data/OMSAdCardContent;->omsCard:Lcom/p1/mobile/putong/data/OmsCard;

    .line 140
    .line 141
    iget-object v2, v2, Lcom/p1/mobile/putong/data/OmsCard;->title:Ljava/lang/String;

    .line 142
    .line 143
    invoke-virtual {v2, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    .line 144
    .line 145
    .line 146
    move-result-object v1

    .line 147
    aget-object v1, v1, v0

    .line 148
    .line 149
    invoke-virtual {p0, v1}, Ll/wyd0;->put(Ljava/lang/Object;)Z

    .line 150
    .line 151
    .line 152
    :cond_2
    iget-object p0, p1, Lcom/p1/mobile/putong/data/OMSAdCardInfo;->content:Lcom/p1/mobile/putong/data/OMSAdCardContent;

    .line 153
    .line 154
    iget-object p0, p0, Lcom/p1/mobile/putong/data/OMSAdCardContent;->omsCard:Lcom/p1/mobile/putong/data/OmsCard;

    .line 155
    .line 156
    iget-object p0, p0, Lcom/p1/mobile/putong/data/OmsCard;->icons:Ljava/util/List;

    .line 157
    .line 158
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 159
    .line 160
    .line 161
    move-result p0

    .line 162
    if-nez p0, :cond_3

    .line 163
    .line 164
    iget-object p0, p1, Lcom/p1/mobile/putong/data/OMSAdCardInfo;->content:Lcom/p1/mobile/putong/data/OMSAdCardContent;

    .line 165
    .line 166
    iget-object p0, p0, Lcom/p1/mobile/putong/data/OMSAdCardContent;->omsCard:Lcom/p1/mobile/putong/data/OmsCard;

    .line 167
    .line 168
    iget-object p0, p0, Lcom/p1/mobile/putong/data/OmsCard;->icons:Ljava/util/List;

    .line 169
    .line 170
    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 171
    .line 172
    .line 173
    move-result-object p0

    .line 174
    check-cast p0, Ljava/lang/CharSequence;

    .line 175
    .line 176
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 177
    .line 178
    .line 179
    move-result p0

    .line 180
    if-nez p0, :cond_3

    .line 181
    .line 182
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 183
    .line 184
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 185
    .line 186
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/g;->S0:Ll/wyd0;

    .line 187
    .line 188
    iget-object p1, p1, Lcom/p1/mobile/putong/data/OMSAdCardInfo;->content:Lcom/p1/mobile/putong/data/OMSAdCardContent;

    .line 189
    .line 190
    iget-object p1, p1, Lcom/p1/mobile/putong/data/OMSAdCardContent;->omsCard:Lcom/p1/mobile/putong/data/OmsCard;

    .line 191
    .line 192
    iget-object p1, p1, Lcom/p1/mobile/putong/data/OmsCard;->icons:Ljava/util/List;

    .line 193
    .line 194
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 195
    .line 196
    .line 197
    move-result-object p1

    .line 198
    check-cast p1, Ljava/lang/String;

    .line 199
    .line 200
    invoke-virtual {p0, p1}, Ll/wyd0;->put(Ljava/lang/Object;)Z

    .line 201
    .line 202
    .line 203
    :cond_3
    return-void
.end method

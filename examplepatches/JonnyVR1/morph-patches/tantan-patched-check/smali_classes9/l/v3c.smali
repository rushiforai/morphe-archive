.class public Ll/v3c;
.super Ll/zh2;
.source "SourceFile"


# instance fields
.field public d:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ll/zh2;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Ll/v3c;->d:Z

    .line 6
    .line 7
    return-void
.end method


# virtual methods
.method public e(Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;Ljava/util/List;Ll/pf60;)Ljava/util/List;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;",
            ">;",
            "Ll/pf60<",
            "Ljava/lang/Integer;",
            "Ljava/lang/Integer;",
            ">;)",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;",
            ">;"
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Ll/v3c;->d:Z

    .line 3
    .line 4
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;->isDanmuFoldMessage()Z

    .line 5
    .line 6
    .line 7
    move-result v1

    .line 8
    if-nez v1, :cond_0

    .line 9
    .line 10
    goto/16 :goto_4

    .line 11
    .line 12
    :cond_0
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;->isUserOwnMessage()Z

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    if-eqz v1, :cond_1

    .line 17
    .line 18
    goto/16 :goto_4

    .line 19
    .line 20
    :cond_1
    if-eqz p3, :cond_c

    .line 21
    .line 22
    invoke-static {p2}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 23
    .line 24
    .line 25
    move-result v1

    .line 26
    if-eqz v1, :cond_2

    .line 27
    .line 28
    goto/16 :goto_4

    .line 29
    .line 30
    :cond_2
    iget-object v1, p1, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;->messageContent:Ljava/lang/String;

    .line 31
    .line 32
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 33
    .line 34
    .line 35
    move-result v1

    .line 36
    if-nez v1, :cond_c

    .line 37
    .line 38
    iget-object v1, p1, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;->messageContent:Ljava/lang/String;

    .line 39
    .line 40
    const-string v2, "\u4e3a\u4e3b\u64ad\u6253call"

    .line 41
    .line 42
    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 43
    .line 44
    .line 45
    move-result v1

    .line 46
    if-nez v1, :cond_3

    .line 47
    .line 48
    goto/16 :goto_4

    .line 49
    .line 50
    :cond_3
    iget-object v1, p3, Ll/pf60;->a:Ljava/lang/Object;

    .line 51
    .line 52
    if-nez v1, :cond_4

    .line 53
    .line 54
    move v1, v0

    .line 55
    goto :goto_0

    .line 56
    :cond_4
    check-cast v1, Ljava/lang/Integer;

    .line 57
    .line 58
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 59
    .line 60
    .line 61
    move-result v1

    .line 62
    :goto_0
    iget-object p3, p3, Ll/pf60;->b:Ljava/lang/Object;

    .line 63
    .line 64
    if-nez p3, :cond_5

    .line 65
    .line 66
    goto :goto_1

    .line 67
    :cond_5
    check-cast p3, Ljava/lang/Integer;

    .line 68
    .line 69
    invoke-virtual {p3}, Ljava/lang/Integer;->intValue()I

    .line 70
    .line 71
    .line 72
    move-result v0

    .line 73
    :goto_1
    if-gtz v1, :cond_6

    .line 74
    .line 75
    if-lez v0, :cond_c

    .line 76
    .line 77
    :cond_6
    if-ltz v1, :cond_c

    .line 78
    .line 79
    if-gez v0, :cond_7

    .line 80
    .line 81
    goto/16 :goto_4

    .line 82
    .line 83
    :cond_7
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;->getMessageType()Ljava/lang/String;

    .line 84
    .line 85
    .line 86
    move-result-object p3

    .line 87
    invoke-interface {p2}, Ljava/util/List;->size()I

    .line 88
    .line 89
    .line 90
    move-result v3

    .line 91
    if-le v3, v0, :cond_c

    .line 92
    .line 93
    if-gt v3, v1, :cond_8

    .line 94
    .line 95
    goto :goto_4

    .line 96
    :cond_8
    :goto_2
    if-lt v0, v1, :cond_a

    .line 97
    .line 98
    invoke-interface {p2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 99
    .line 100
    .line 101
    move-result-object v4

    .line 102
    check-cast v4, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;

    .line 103
    .line 104
    invoke-virtual {v4, p3}, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;->isMatchTargetMessageType(Ljava/lang/String;)Z

    .line 105
    .line 106
    .line 107
    move-result v5

    .line 108
    if-eqz v5, :cond_9

    .line 109
    .line 110
    invoke-virtual {v4}, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;->isUserOwnMessage()Z

    .line 111
    .line 112
    .line 113
    move-result v5

    .line 114
    if-nez v5, :cond_9

    .line 115
    .line 116
    iget-object v5, v4, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;->messageContent:Ljava/lang/String;

    .line 117
    .line 118
    invoke-static {v2, v5}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 119
    .line 120
    .line 121
    move-result v5

    .line 122
    if-eqz v5, :cond_9

    .line 123
    .line 124
    goto :goto_3

    .line 125
    :cond_9
    add-int/lit8 v0, v0, -0x1

    .line 126
    .line 127
    goto :goto_2

    .line 128
    :cond_a
    const/4 v0, -0x1

    .line 129
    const/4 v4, 0x0

    .line 130
    :goto_3
    invoke-static {v4}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 131
    .line 132
    .line 133
    move-result v1

    .line 134
    const/4 v4, 0x1

    .line 135
    if-eqz v1, :cond_b

    .line 136
    .line 137
    invoke-interface {p2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 138
    .line 139
    .line 140
    move-result-object p3

    .line 141
    check-cast p3, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;

    .line 142
    .line 143
    iget-object p3, p3, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;->layoutId:Ljava/lang/String;

    .line 144
    .line 145
    invoke-virtual {p1, p3}, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;->setLayoutId(Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;

    .line 146
    .line 147
    .line 148
    invoke-interface {p2, v0}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 149
    .line 150
    .line 151
    invoke-interface {p2, v0, p1}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 152
    .line 153
    .line 154
    iput-boolean v4, p0, Ll/v3c;->d:Z

    .line 155
    .line 156
    return-object p2

    .line 157
    :cond_b
    sub-int/2addr v3, v4

    .line 158
    invoke-interface {p2, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 159
    .line 160
    .line 161
    move-result-object v0

    .line 162
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;

    .line 163
    .line 164
    invoke-virtual {v0, p3}, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;->isMatchTargetMessageType(Ljava/lang/String;)Z

    .line 165
    .line 166
    .line 167
    move-result p3

    .line 168
    if-eqz p3, :cond_c

    .line 169
    .line 170
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;->isUserOwnMessage()Z

    .line 171
    .line 172
    .line 173
    move-result p3

    .line 174
    if-nez p3, :cond_c

    .line 175
    .line 176
    iget-object p3, v0, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;->messageContent:Ljava/lang/String;

    .line 177
    .line 178
    invoke-static {v2, p3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 179
    .line 180
    .line 181
    move-result p3

    .line 182
    if-eqz p3, :cond_c

    .line 183
    .line 184
    invoke-interface {p2, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 185
    .line 186
    .line 187
    move-result-object p3

    .line 188
    check-cast p3, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;

    .line 189
    .line 190
    iget-object p3, p3, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;->layoutId:Ljava/lang/String;

    .line 191
    .line 192
    invoke-virtual {p1, p3}, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;->setLayoutId(Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;

    .line 193
    .line 194
    .line 195
    invoke-interface {p2, v3}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 196
    .line 197
    .line 198
    invoke-interface {p2, v3, p1}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 199
    .line 200
    .line 201
    iput-boolean v4, p0, Ll/v3c;->d:Z

    .line 202
    .line 203
    :cond_c
    :goto_4
    return-object p2
.end method

.method public f()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/v3c;->d:Z

    .line 2
    .line 3
    return p0
.end method

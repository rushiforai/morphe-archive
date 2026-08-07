.class public Ll/b5f0;
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
    iput-boolean v0, p0, Ll/b5f0;->d:Z

    .line 6
    .line 7
    return-void
.end method


# virtual methods
.method public e(Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;Ljava/util/List;Ll/pf60;)Ljava/util/List;
    .locals 5
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
    iput-boolean v0, p0, Ll/b5f0;->d:Z

    .line 3
    .line 4
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;->isShootGameFoldMessage()Z

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
    if-eqz p3, :cond_b

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
    iget-object v1, p3, Ll/pf60;->a:Ljava/lang/Object;

    .line 31
    .line 32
    if-nez v1, :cond_3

    .line 33
    .line 34
    move v1, v0

    .line 35
    goto :goto_0

    .line 36
    :cond_3
    check-cast v1, Ljava/lang/Integer;

    .line 37
    .line 38
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 39
    .line 40
    .line 41
    move-result v1

    .line 42
    :goto_0
    iget-object p3, p3, Ll/pf60;->b:Ljava/lang/Object;

    .line 43
    .line 44
    if-nez p3, :cond_4

    .line 45
    .line 46
    goto :goto_1

    .line 47
    :cond_4
    check-cast p3, Ljava/lang/Integer;

    .line 48
    .line 49
    invoke-virtual {p3}, Ljava/lang/Integer;->intValue()I

    .line 50
    .line 51
    .line 52
    move-result v0

    .line 53
    :goto_1
    if-gtz v1, :cond_5

    .line 54
    .line 55
    if-lez v0, :cond_b

    .line 56
    .line 57
    :cond_5
    if-ltz v1, :cond_b

    .line 58
    .line 59
    if-gez v0, :cond_6

    .line 60
    .line 61
    goto :goto_4

    .line 62
    :cond_6
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;->getMessageType()Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object p3

    .line 66
    invoke-interface {p2}, Ljava/util/List;->size()I

    .line 67
    .line 68
    .line 69
    move-result v2

    .line 70
    if-le v2, v0, :cond_b

    .line 71
    .line 72
    if-gt v2, v1, :cond_7

    .line 73
    .line 74
    goto :goto_4

    .line 75
    :cond_7
    :goto_2
    if-lt v0, v1, :cond_9

    .line 76
    .line 77
    invoke-interface {p2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 78
    .line 79
    .line 80
    move-result-object v3

    .line 81
    check-cast v3, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;

    .line 82
    .line 83
    invoke-virtual {v3, p3}, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;->isMatchTargetMessageType(Ljava/lang/String;)Z

    .line 84
    .line 85
    .line 86
    move-result v4

    .line 87
    if-eqz v4, :cond_8

    .line 88
    .line 89
    invoke-virtual {v3}, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;->isUserOwnMessage()Z

    .line 90
    .line 91
    .line 92
    move-result v4

    .line 93
    if-nez v4, :cond_8

    .line 94
    .line 95
    goto :goto_3

    .line 96
    :cond_8
    add-int/lit8 v0, v0, -0x1

    .line 97
    .line 98
    goto :goto_2

    .line 99
    :cond_9
    const/4 v0, -0x1

    .line 100
    const/4 v3, 0x0

    .line 101
    :goto_3
    invoke-static {v3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 102
    .line 103
    .line 104
    move-result v1

    .line 105
    const/4 v3, 0x1

    .line 106
    if-eqz v1, :cond_a

    .line 107
    .line 108
    invoke-interface {p2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 109
    .line 110
    .line 111
    move-result-object p3

    .line 112
    check-cast p3, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;

    .line 113
    .line 114
    iget-object p3, p3, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;->layoutId:Ljava/lang/String;

    .line 115
    .line 116
    invoke-virtual {p1, p3}, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;->setLayoutId(Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;

    .line 117
    .line 118
    .line 119
    invoke-interface {p2, v0}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 120
    .line 121
    .line 122
    invoke-interface {p2, v0, p1}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 123
    .line 124
    .line 125
    iput-boolean v3, p0, Ll/b5f0;->d:Z

    .line 126
    .line 127
    return-object p2

    .line 128
    :cond_a
    sub-int/2addr v2, v3

    .line 129
    invoke-interface {p2, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 130
    .line 131
    .line 132
    move-result-object v0

    .line 133
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;

    .line 134
    .line 135
    invoke-virtual {v0, p3}, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;->isMatchTargetMessageType(Ljava/lang/String;)Z

    .line 136
    .line 137
    .line 138
    move-result p3

    .line 139
    if-eqz p3, :cond_b

    .line 140
    .line 141
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;->isUserOwnMessage()Z

    .line 142
    .line 143
    .line 144
    move-result p3

    .line 145
    if-nez p3, :cond_b

    .line 146
    .line 147
    invoke-interface {p2, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 148
    .line 149
    .line 150
    move-result-object p3

    .line 151
    check-cast p3, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;

    .line 152
    .line 153
    iget-object p3, p3, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;->layoutId:Ljava/lang/String;

    .line 154
    .line 155
    invoke-virtual {p1, p3}, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;->setLayoutId(Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;

    .line 156
    .line 157
    .line 158
    invoke-interface {p2, v2}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 159
    .line 160
    .line 161
    invoke-interface {p2, v2, p1}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 162
    .line 163
    .line 164
    iput-boolean v3, p0, Ll/b5f0;->d:Z

    .line 165
    .line 166
    :cond_b
    :goto_4
    return-object p2
.end method

.method public f()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/b5f0;->d:Z

    .line 2
    .line 3
    return p0
.end method

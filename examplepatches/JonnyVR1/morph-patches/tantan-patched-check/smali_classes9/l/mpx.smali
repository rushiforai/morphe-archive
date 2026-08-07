.class public Ll/mpx;
.super Ll/yr2;
.source "SourceFile"


# instance fields
.field public a:Ll/x7g;

.field public final b:Lcom/google/gson/Gson;


# direct methods
.method public constructor <init>(Ll/x7g;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ll/yr2;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lcom/google/gson/Gson;

    .line 5
    .line 6
    invoke-direct {v0}, Lcom/google/gson/Gson;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/mpx;->b:Lcom/google/gson/Gson;

    .line 10
    .line 11
    iput-object p1, p0, Ll/mpx;->a:Ll/x7g;

    .line 12
    .line 13
    return-void
.end method

.method public static synthetic g(Ll/mpx;Ljava/util/List;Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;Ll/cm0;Lcom/p1/mobile/putong/live/base/data/BLiveTemplateItem;Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$Medal;)V
    .locals 0

    .line 1
    invoke-virtual/range {p0 .. p5}, Ll/mpx;->q(Ljava/util/List;Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;Ll/cm0;Lcom/p1/mobile/putong/live/base/data/BLiveTemplateItem;Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$Medal;)V

    return-void
.end method


# virtual methods
.method public b(Lcom/p1/mobile/putong/live/base/data/BLiveTemplateItem;Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;Ll/hzc0;)Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/live/base/data/BLiveTemplateItem;",
            "Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;",
            "Ll/hzc0;",
            ")",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p2, p3, Ll/hzc0;->d:Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessage;

    .line 2
    .line 3
    if-eqz p2, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p2, p1}, Ll/mpx;->n(Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessage;Lcom/p1/mobile/putong/live/base/data/BLiveTemplateItem;)Ljava/util/List;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    new-array p0, p0, [Ljava/lang/String;

    .line 12
    .line 13
    invoke-static {p0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0
.end method

.method public f(Ll/suf0;Lcom/p1/mobile/putong/live/base/data/BLiveTemplateItem;Ljava/util/List;Ll/hzc0;)V
    .locals 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/suf0;",
            "Lcom/p1/mobile/putong/live/base/data/BLiveTemplateItem;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;",
            "Ll/hzc0;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-interface {p3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 2
    .line 3
    .line 4
    move-result-object p3

    .line 5
    :goto_0
    invoke-interface {p3}, Ljava/util/Iterator;->hasNext()Z

    .line 6
    .line 7
    .line 8
    move-result p4

    .line 9
    if-eqz p4, :cond_5

    .line 10
    .line 11
    invoke-interface {p3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object p4

    .line 15
    check-cast p4, Ljava/lang/String;

    .line 16
    .line 17
    const-string v0, "fanbaseSplit:#"

    .line 18
    .line 19
    invoke-virtual {p4, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    const/4 v1, 0x1

    .line 24
    const-string v2, "Split:#"

    .line 25
    .line 26
    const/4 v3, 0x0

    .line 27
    if-eqz v0, :cond_0

    .line 28
    .line 29
    invoke-virtual {p4, v2}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object p4

    .line 33
    aget-object v0, p4, v1

    .line 34
    .line 35
    iget-object v1, p0, Ll/mpx;->b:Lcom/google/gson/Gson;

    .line 36
    .line 37
    const-class v2, Ll/fbg;

    .line 38
    .line 39
    invoke-virtual {v1, v0, v2}, Lcom/google/gson/Gson;->fromJson(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    move-object v8, v0

    .line 44
    check-cast v8, Ll/fbg;

    .line 45
    .line 46
    iget-object v5, p1, Ll/suf0;->a:Landroid/text/SpannableStringBuilder;

    .line 47
    .line 48
    aget-object v6, p4, v3

    .line 49
    .line 50
    iget v7, p1, Ll/suf0;->b:I

    .line 51
    .line 52
    iget-object v9, p1, Ll/suf0;->c:Ljava/lang/Object;

    .line 53
    .line 54
    iget v10, p2, Lcom/p1/mobile/putong/live/base/data/BLiveTemplateItem;->size:I

    .line 55
    .line 56
    move-object v4, p0

    .line 57
    invoke-virtual/range {v4 .. v10}, Ll/mpx;->s(Landroid/text/SpannableStringBuilder;Ljava/lang/String;ILl/fbg;Ljava/lang/Object;I)Ljava/lang/Object;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    iput-object p0, p1, Ll/suf0;->c:Ljava/lang/Object;

    .line 62
    .line 63
    iget p0, p1, Ll/suf0;->b:I

    .line 64
    .line 65
    aget-object p4, p4, v3

    .line 66
    .line 67
    invoke-virtual {p4}, Ljava/lang/String;->length()I

    .line 68
    .line 69
    .line 70
    move-result p4

    .line 71
    add-int/2addr p0, p4

    .line 72
    iput p0, p1, Ll/suf0;->b:I

    .line 73
    .line 74
    goto :goto_1

    .line 75
    :cond_0
    move-object v4, p0

    .line 76
    const-string p0, "familySplit:#"

    .line 77
    .line 78
    invoke-virtual {p4, p0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 79
    .line 80
    .line 81
    move-result p0

    .line 82
    if-eqz p0, :cond_1

    .line 83
    .line 84
    invoke-virtual {v4, p1, p2, p4}, Ll/mpx;->r(Ll/suf0;Lcom/p1/mobile/putong/live/base/data/BLiveTemplateItem;Ljava/lang/String;)V

    .line 85
    .line 86
    .line 87
    goto :goto_1

    .line 88
    :cond_1
    const-string p0, "voiceFanBaseSplit:#"

    .line 89
    .line 90
    invoke-virtual {p4, p0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 91
    .line 92
    .line 93
    move-result p0

    .line 94
    if-eqz p0, :cond_2

    .line 95
    .line 96
    invoke-virtual {v4, p1, p2, p4}, Ll/mpx;->u(Ll/suf0;Lcom/p1/mobile/putong/live/base/data/BLiveTemplateItem;Ljava/lang/String;)V

    .line 97
    .line 98
    .line 99
    goto :goto_1

    .line 100
    :cond_2
    const-string p0, "royalSplit:#"

    .line 101
    .line 102
    invoke-virtual {p4, p0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 103
    .line 104
    .line 105
    move-result p0

    .line 106
    if-eqz p0, :cond_3

    .line 107
    .line 108
    invoke-virtual {p4, v2}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    .line 109
    .line 110
    .line 111
    move-result-object p0

    .line 112
    iget-object v5, p1, Ll/suf0;->a:Landroid/text/SpannableStringBuilder;

    .line 113
    .line 114
    aget-object v6, p0, v3

    .line 115
    .line 116
    iget v7, p1, Ll/suf0;->b:I

    .line 117
    .line 118
    aget-object v8, p0, v1

    .line 119
    .line 120
    iget-object v9, p1, Ll/suf0;->c:Ljava/lang/Object;

    .line 121
    .line 122
    iget v10, p2, Lcom/p1/mobile/putong/live/base/data/BLiveTemplateItem;->size:I

    .line 123
    .line 124
    invoke-virtual/range {v4 .. v10}, Ll/mpx;->l(Landroid/text/SpannableStringBuilder;Ljava/lang/String;ILjava/lang/String;Ljava/lang/Object;I)Ljava/lang/Object;

    .line 125
    .line 126
    .line 127
    move-result-object p4

    .line 128
    iput-object p4, p1, Ll/suf0;->c:Ljava/lang/Object;

    .line 129
    .line 130
    iget p4, p1, Ll/suf0;->b:I

    .line 131
    .line 132
    aget-object p0, p0, v3

    .line 133
    .line 134
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    .line 135
    .line 136
    .line 137
    move-result p0

    .line 138
    add-int/2addr p4, p0

    .line 139
    iput p4, p1, Ll/suf0;->b:I

    .line 140
    .line 141
    goto :goto_1

    .line 142
    :cond_3
    const-string p0, "medalDesc"

    .line 143
    .line 144
    iget-object v0, p2, Lcom/p1/mobile/putong/live/base/data/BLiveTemplateItem;->scene:Ljava/lang/String;

    .line 145
    .line 146
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 147
    .line 148
    .line 149
    move-result p0

    .line 150
    if-eqz p0, :cond_4

    .line 151
    .line 152
    iget-object p0, p1, Ll/suf0;->c:Ljava/lang/Object;

    .line 153
    .line 154
    invoke-virtual {v4, p1, p2, p4, p0}, Ll/mpx;->t(Ll/suf0;Lcom/p1/mobile/putong/live/base/data/BLiveTemplateItem;Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    .line 155
    .line 156
    .line 157
    move-result-object p0

    .line 158
    iput-object p0, p1, Ll/suf0;->c:Ljava/lang/Object;

    .line 159
    .line 160
    goto :goto_1

    .line 161
    :cond_4
    invoke-virtual {v4, p1, p2, p4}, Ll/yr2;->d(Ll/suf0;Lcom/p1/mobile/putong/live/base/data/BLiveTemplateItem;Ljava/lang/String;)V

    .line 162
    .line 163
    .line 164
    :goto_1
    move-object p0, v4

    .line 165
    goto/16 :goto_0

    .line 166
    .line 167
    :cond_5
    return-void
.end method

.method public getType()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "medal"

    .line 2
    .line 3
    return-object p0
.end method

.method public final h(Ljava/util/List;Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$Medal;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;",
            "Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$Medal;",
            ")V"
        }
    .end annotation

    .line 1
    sget-object v0, Ll/htd0;->c:Ll/htd0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/zrv;->l(Ll/htd0;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ll/hiv;

    .line 8
    .line 9
    invoke-virtual {v0}, Ll/hiv;->k()Landroid/util/SparseArray;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    if-eqz v0, :cond_1

    .line 14
    .line 15
    invoke-virtual {p2}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$Medal;->getFamilyGrade()J

    .line 16
    .line 17
    .line 18
    move-result-wide v1

    .line 19
    long-to-int v1, v1

    .line 20
    invoke-virtual {v0, v1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    if-nez v1, :cond_0

    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_0
    invoke-virtual {p2}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$Medal;->getFamilyGrade()J

    .line 28
    .line 29
    .line 30
    move-result-wide v1

    .line 31
    long-to-int v1, v1

    .line 32
    invoke-virtual {v0, v1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    check-cast v0, Lcom/p1/mobile/putong/live/base/data/BLiveIntlVoiceMedal;

    .line 37
    .line 38
    invoke-static {}, Ll/nxp$a;->n()Ll/nxp$a;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    iget-object v2, v0, Lcom/p1/mobile/putong/live/base/data/BLiveIntlVoiceMedal;->borderColor:Ljava/lang/String;

    .line 43
    .line 44
    invoke-virtual {v1, v2}, Ll/nxp$a;->p(Ljava/lang/String;)Ll/nxp$a;

    .line 45
    .line 46
    .line 47
    move-result-object v1

    .line 48
    iget-object v2, v0, Lcom/p1/mobile/putong/live/base/data/BLiveIntlVoiceMedal;->endColor:Ljava/lang/String;

    .line 49
    .line 50
    invoke-virtual {v1, v2}, Ll/nxp$a;->q(Ljava/lang/String;)Ll/nxp$a;

    .line 51
    .line 52
    .line 53
    move-result-object v1

    .line 54
    const-string v2, "family"

    .line 55
    .line 56
    invoke-virtual {v1, v2}, Ll/nxp$a;->y(Ljava/lang/String;)Ll/nxp$a;

    .line 57
    .line 58
    .line 59
    move-result-object v1

    .line 60
    iget-object v2, v0, Lcom/p1/mobile/putong/live/base/data/BLiveIntlVoiceMedal;->startColor:Ljava/lang/String;

    .line 61
    .line 62
    invoke-virtual {v1, v2}, Ll/nxp$a;->x(Ljava/lang/String;)Ll/nxp$a;

    .line 63
    .line 64
    .line 65
    move-result-object v1

    .line 66
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveIntlVoiceMedal;->icon:Ljava/lang/String;

    .line 67
    .line 68
    invoke-virtual {v1, v0}, Ll/nxp$a;->u(Ljava/lang/String;)Ll/nxp$a;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    invoke-virtual {p2}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$Medal;->getFamilyText()Ljava/lang/String;

    .line 73
    .line 74
    .line 75
    move-result-object v1

    .line 76
    invoke-virtual {v0, v1}, Ll/nxp$a;->z(Ljava/lang/String;)Ll/nxp$a;

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    invoke-virtual {p2}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$Medal;->getFamilyLight()Z

    .line 81
    .line 82
    .line 83
    move-result v1

    .line 84
    invoke-virtual {v0, v1}, Ll/nxp$a;->v(Z)Ll/nxp$a;

    .line 85
    .line 86
    .line 87
    move-result-object v0

    .line 88
    invoke-virtual {p2}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$Medal;->getFamilyGrade()J

    .line 89
    .line 90
    .line 91
    move-result-wide v1

    .line 92
    long-to-int p2, v1

    .line 93
    invoke-virtual {v0, p2}, Ll/nxp$a;->s(I)Ll/nxp$a;

    .line 94
    .line 95
    .line 96
    move-result-object p2

    .line 97
    invoke-virtual {p2}, Ll/nxp$a;->m()Ll/nxp;

    .line 98
    .line 99
    .line 100
    move-result-object p2

    .line 101
    new-instance v0, Ljava/lang/StringBuilder;

    .line 102
    .line 103
    const-string v1, "familySplit:#"

    .line 104
    .line 105
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 106
    .line 107
    .line 108
    iget-object p0, p0, Ll/mpx;->b:Lcom/google/gson/Gson;

    .line 109
    .line 110
    invoke-virtual {p0, p2}, Lcom/google/gson/Gson;->toJson(Ljava/lang/Object;)Ljava/lang/String;

    .line 111
    .line 112
    .line 113
    move-result-object p0

    .line 114
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 115
    .line 116
    .line 117
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 118
    .line 119
    .line 120
    move-result-object p0

    .line 121
    invoke-interface {p1, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 122
    .line 123
    .line 124
    :cond_1
    :goto_0
    return-void
.end method

.method public final i(Ll/cm0;Ljava/util/List;Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$Medal;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/cm0;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;",
            "Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$Medal;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-static {}, Ll/zrv;->k()Ll/vwt;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/vwt;->P6()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_1

    .line 10
    .line 11
    if-eqz p1, :cond_1

    .line 12
    .line 13
    iget-object v0, p1, Ll/cm0;->b:Lcom/p1/mobile/putong/live/base/data/BLiveCommonViewConfig;

    .line 14
    .line 15
    if-nez v0, :cond_0

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    invoke-virtual {p3}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$Medal;->getFanbaseGrade()J

    .line 19
    .line 20
    .line 21
    move-result-wide v0

    .line 22
    long-to-int p3, v0

    .line 23
    invoke-static {}, Ll/fbg;->a()Ll/fbg$a;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    iget-object v1, p1, Ll/cm0;->b:Lcom/p1/mobile/putong/live/base/data/BLiveCommonViewConfig;

    .line 28
    .line 29
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveCommonViewConfig;->color:Ljava/lang/String;

    .line 30
    .line 31
    invoke-virtual {v0, v1}, Ll/fbg$a;->b(Ljava/lang/String;)Ll/fbg$a;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    invoke-virtual {v0, p3}, Ll/fbg$a;->c(I)Ll/fbg$a;

    .line 36
    .line 37
    .line 38
    move-result-object p3

    .line 39
    iget-object v0, p1, Ll/cm0;->a:Ljava/lang/String;

    .line 40
    .line 41
    invoke-virtual {p3, v0}, Ll/fbg$a;->f(Ljava/lang/String;)Ll/fbg$a;

    .line 42
    .line 43
    .line 44
    move-result-object p3

    .line 45
    iget-object v0, p1, Ll/cm0;->b:Lcom/p1/mobile/putong/live/base/data/BLiveCommonViewConfig;

    .line 46
    .line 47
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveCommonViewConfig;->icon:Ljava/lang/String;

    .line 48
    .line 49
    invoke-virtual {p3, v0}, Ll/fbg$a;->d(Ljava/lang/String;)Ll/fbg$a;

    .line 50
    .line 51
    .line 52
    move-result-object p3

    .line 53
    iget-object p1, p1, Ll/cm0;->b:Lcom/p1/mobile/putong/live/base/data/BLiveCommonViewConfig;

    .line 54
    .line 55
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveCommonViewConfig;->text:Ljava/lang/String;

    .line 56
    .line 57
    invoke-virtual {p3, p1}, Ll/fbg$a;->e(Ljava/lang/String;)Ll/fbg$a;

    .line 58
    .line 59
    .line 60
    move-result-object p1

    .line 61
    invoke-virtual {p1}, Ll/fbg$a;->a()Ll/fbg;

    .line 62
    .line 63
    .line 64
    move-result-object p1

    .line 65
    new-instance p3, Ljava/lang/StringBuilder;

    .line 66
    .line 67
    const-string v0, "fanbaseSplit:#"

    .line 68
    .line 69
    invoke-direct {p3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 70
    .line 71
    .line 72
    iget-object p0, p0, Ll/mpx;->b:Lcom/google/gson/Gson;

    .line 73
    .line 74
    invoke-virtual {p0, p1}, Lcom/google/gson/Gson;->toJson(Ljava/lang/Object;)Ljava/lang/String;

    .line 75
    .line 76
    .line 77
    move-result-object p0

    .line 78
    invoke-virtual {p3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 79
    .line 80
    .line 81
    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 82
    .line 83
    .line 84
    move-result-object p0

    .line 85
    invoke-interface {p2, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 86
    .line 87
    .line 88
    :cond_1
    :goto_0
    return-void
.end method

.method public final j(Ljava/util/List;Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$Medal;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;",
            "Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$Medal;",
            ")V"
        }
    .end annotation

    .line 1
    sget-object v0, Ll/htd0;->c:Ll/htd0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/zrv;->l(Ll/htd0;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ll/hiv;

    .line 8
    .line 9
    invoke-virtual {p2}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$Medal;->getVoiceFanbaseGrade()J

    .line 10
    .line 11
    .line 12
    move-result-wide v1

    .line 13
    long-to-int v1, v1

    .line 14
    invoke-virtual {v0, v1}, Ll/hiv;->n(I)Lcom/p1/mobile/putong/live/base/data/BLiveIntlVoiceMedal;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    if-nez v0, :cond_0

    .line 19
    .line 20
    return-void

    .line 21
    :cond_0
    invoke-static {}, Ll/nxp$a;->n()Ll/nxp$a;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    const-string v2, "voiceFanBase"

    .line 26
    .line 27
    invoke-virtual {v1, v2}, Ll/nxp$a;->y(Ljava/lang/String;)Ll/nxp$a;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    invoke-virtual {p2}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$Medal;->getVoiceFanbaseGrade()J

    .line 32
    .line 33
    .line 34
    move-result-wide v2

    .line 35
    long-to-int v2, v2

    .line 36
    invoke-virtual {v1, v2}, Ll/nxp$a;->s(I)Ll/nxp$a;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    invoke-virtual {p2}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$Medal;->getVoiceFanbaseText()Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object v2

    .line 44
    invoke-virtual {v1, v2}, Ll/nxp$a;->z(Ljava/lang/String;)Ll/nxp$a;

    .line 45
    .line 46
    .line 47
    move-result-object v1

    .line 48
    invoke-virtual {p2}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$Medal;->getVoiceFanbaseColor()Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object p2

    .line 52
    invoke-virtual {v1, p2}, Ll/nxp$a;->w(Ljava/lang/String;)Ll/nxp$a;

    .line 53
    .line 54
    .line 55
    move-result-object p2

    .line 56
    iget-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveIntlVoiceMedal;->icon:Ljava/lang/String;

    .line 57
    .line 58
    invoke-virtual {p2, v1}, Ll/nxp$a;->u(Ljava/lang/String;)Ll/nxp$a;

    .line 59
    .line 60
    .line 61
    move-result-object p2

    .line 62
    iget-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveIntlVoiceMedal;->startColor:Ljava/lang/String;

    .line 63
    .line 64
    invoke-virtual {p2, v1}, Ll/nxp$a;->x(Ljava/lang/String;)Ll/nxp$a;

    .line 65
    .line 66
    .line 67
    move-result-object p2

    .line 68
    iget-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveIntlVoiceMedal;->endColor:Ljava/lang/String;

    .line 69
    .line 70
    invoke-virtual {p2, v1}, Ll/nxp$a;->q(Ljava/lang/String;)Ll/nxp$a;

    .line 71
    .line 72
    .line 73
    move-result-object p2

    .line 74
    iget-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveIntlVoiceMedal;->borderStartColor:Ljava/lang/String;

    .line 75
    .line 76
    invoke-virtual {p2, v1}, Ll/nxp$a;->p(Ljava/lang/String;)Ll/nxp$a;

    .line 77
    .line 78
    .line 79
    move-result-object p2

    .line 80
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveIntlVoiceMedal;->borderEndColor:Ljava/lang/String;

    .line 81
    .line 82
    invoke-virtual {p2, v0}, Ll/nxp$a;->o(Ljava/lang/String;)Ll/nxp$a;

    .line 83
    .line 84
    .line 85
    move-result-object p2

    .line 86
    const/high16 v0, 0x41a00000    # 20.0f

    .line 87
    .line 88
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 89
    .line 90
    .line 91
    move-result v0

    .line 92
    invoke-virtual {p2, v0}, Ll/nxp$a;->t(I)Ll/nxp$a;

    .line 93
    .line 94
    .line 95
    move-result-object p2

    .line 96
    invoke-virtual {p2}, Ll/nxp$a;->m()Ll/nxp;

    .line 97
    .line 98
    .line 99
    move-result-object p2

    .line 100
    new-instance v0, Ljava/lang/StringBuilder;

    .line 101
    .line 102
    const-string v1, "voiceFanBaseSplit:#"

    .line 103
    .line 104
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 105
    .line 106
    .line 107
    iget-object p0, p0, Ll/mpx;->b:Lcom/google/gson/Gson;

    .line 108
    .line 109
    invoke-virtual {p0, p2}, Lcom/google/gson/Gson;->toJson(Ljava/lang/Object;)Ljava/lang/String;

    .line 110
    .line 111
    .line 112
    move-result-object p0

    .line 113
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 114
    .line 115
    .line 116
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 117
    .line 118
    .line 119
    move-result-object p0

    .line 120
    invoke-interface {p1, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 121
    .line 122
    .line 123
    return-void
.end method

.method public final k(Landroid/text/SpannableStringBuilder;Ljava/lang/String;ILl/nxp;Ljava/lang/Object;I)Ljava/lang/Object;
    .locals 1

    .line 1
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-nez p0, :cond_0

    .line 6
    .line 7
    return-object p5

    .line 8
    :cond_0
    invoke-virtual {p1, p2}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 9
    .line 10
    .line 11
    new-instance p0, Ll/t5g;

    .line 12
    .line 13
    sget-object v0, Ll/zrv;->e:Landroid/app/Application;

    .line 14
    .line 15
    invoke-direct {p0, v0, p4, p6}, Ll/t5g;-><init>(Landroid/content/Context;Ll/nxp;I)V

    .line 16
    .line 17
    .line 18
    if-eqz p5, :cond_1

    .line 19
    .line 20
    const/4 p4, 0x4

    .line 21
    invoke-virtual {p0, p4}, Ll/sce;->g(I)V

    .line 22
    .line 23
    .line 24
    :cond_1
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    .line 25
    .line 26
    .line 27
    move-result p2

    .line 28
    add-int/2addr p2, p3

    .line 29
    const/16 p4, 0x21

    .line 30
    .line 31
    invoke-virtual {p1, p0, p3, p2, p4}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 32
    .line 33
    .line 34
    return-object p0
.end method

.method public final l(Landroid/text/SpannableStringBuilder;Ljava/lang/String;ILjava/lang/String;Ljava/lang/Object;I)Ljava/lang/Object;
    .locals 1

    .line 1
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-nez p0, :cond_0

    .line 6
    .line 7
    return-object p5

    .line 8
    :cond_0
    invoke-virtual {p1, p2}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 9
    .line 10
    .line 11
    new-instance p0, Ll/rnd0;

    .line 12
    .line 13
    sget-object v0, Ll/zrv;->e:Landroid/app/Application;

    .line 14
    .line 15
    invoke-direct {p0, v0, p4, p6}, Ll/rnd0;-><init>(Landroid/content/Context;Ljava/lang/String;I)V

    .line 16
    .line 17
    .line 18
    if-eqz p5, :cond_1

    .line 19
    .line 20
    const/4 p4, 0x4

    .line 21
    invoke-virtual {p0, p4}, Ll/sce;->g(I)V

    .line 22
    .line 23
    .line 24
    :cond_1
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    .line 25
    .line 26
    .line 27
    move-result p2

    .line 28
    add-int/2addr p2, p3

    .line 29
    const/16 p4, 0x21

    .line 30
    .line 31
    invoke-virtual {p1, p0, p3, p2, p4}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 32
    .line 33
    .line 34
    return-object p0
.end method

.method public final m(Landroid/text/SpannableStringBuilder;Ljava/lang/String;ILl/nxp;Ljava/lang/Object;I)Ljava/lang/Object;
    .locals 1

    .line 1
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-nez p0, :cond_0

    .line 6
    .line 7
    return-object p5

    .line 8
    :cond_0
    invoke-virtual {p1, p2}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 9
    .line 10
    .line 11
    new-instance p0, Ll/ben0;

    .line 12
    .line 13
    sget-object v0, Ll/zrv;->e:Landroid/app/Application;

    .line 14
    .line 15
    invoke-direct {p0, v0, p4, p6}, Ll/ben0;-><init>(Landroid/content/Context;Ll/nxp;I)V

    .line 16
    .line 17
    .line 18
    if-eqz p5, :cond_1

    .line 19
    .line 20
    const/4 p4, 0x4

    .line 21
    invoke-virtual {p0, p4}, Ll/sce;->g(I)V

    .line 22
    .line 23
    .line 24
    :cond_1
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    .line 25
    .line 26
    .line 27
    move-result p2

    .line 28
    add-int/2addr p2, p3

    .line 29
    const/16 p4, 0x21

    .line 30
    .line 31
    invoke-virtual {p1, p0, p3, p2, p4}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 32
    .line 33
    .line 34
    return-object p0
.end method

.method public final n(Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessage;Lcom/p1/mobile/putong/live/base/data/BLiveTemplateItem;)Ljava/util/List;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessage;",
            "Lcom/p1/mobile/putong/live/base/data/BLiveTemplateItem;",
            ")",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessage;->getMedal()Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;

    .line 2
    .line 3
    .line 4
    move-result-object v3

    .line 5
    if-nez v3, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x0

    .line 8
    new-array p0, p0, [Ljava/lang/String;

    .line 9
    .line 10
    invoke-static {p0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    return-object p0

    .line 15
    :cond_0
    iget-object p1, p0, Ll/mpx;->a:Ll/x7g;

    .line 16
    .line 17
    invoke-virtual {p1}, Ll/x7g;->A()Ll/cm0;

    .line 18
    .line 19
    .line 20
    move-result-object v4

    .line 21
    invoke-virtual {v3}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;->getSingleRoomMedalsList()Ljava/util/List;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    invoke-virtual {v3}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;->getMultiRoomMedalsList()Ljava/util/List;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-static {p1, v0}, Ll/jlk0;->e(Ljava/util/List;Ljava/util/List;)Ljava/util/List;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    new-instance v2, Ljava/util/ArrayList;

    .line 34
    .line 35
    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 36
    .line 37
    .line 38
    new-instance v0, Ll/lpx;

    .line 39
    .line 40
    move-object v1, p0

    .line 41
    move-object v5, p2

    .line 42
    invoke-direct/range {v0 .. v5}, Ll/lpx;-><init>(Ll/mpx;Ljava/util/List;Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;Ll/cm0;Lcom/p1/mobile/putong/live/base/data/BLiveTemplateItem;)V

    .line 43
    .line 44
    .line 45
    invoke-static {p1, v0}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 46
    .line 47
    .line 48
    return-object v2
.end method

.method public final o(Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$Medal;)Z
    .locals 4

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$Medal;->getFamilyGrade()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    const-wide/16 v2, 0x0

    .line 6
    .line 7
    cmp-long p0, v0, v2

    .line 8
    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$Medal;->getFamilyText()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    if-nez p0, :cond_0

    .line 20
    .line 21
    const/4 p0, 0x1

    .line 22
    return p0

    .line 23
    :cond_0
    const/4 p0, 0x0

    .line 24
    return p0
.end method

.method public final p(Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$Medal;)Z
    .locals 4

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$Medal;->getVoiceFanbaseGrade()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    const-wide/16 v2, 0x0

    .line 6
    .line 7
    cmp-long p0, v0, v2

    .line 8
    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$Medal;->getVoiceFanbaseText()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    if-nez p0, :cond_0

    .line 20
    .line 21
    const/4 p0, 0x1

    .line 22
    return p0

    .line 23
    :cond_0
    const/4 p0, 0x0

    .line 24
    return p0
.end method

.method public final synthetic q(Ljava/util/List;Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;Ll/cm0;Lcom/p1/mobile/putong/live/base/data/BLiveTemplateItem;Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$Medal;)V
    .locals 3

    .line 1
    invoke-virtual {p0, p5}, Ll/mpx;->o(Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$Medal;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0, p1, p5}, Ll/mpx;->h(Ljava/util/List;Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$Medal;)V

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    invoke-virtual {p0, p5}, Ll/mpx;->p(Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$Medal;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_1

    .line 16
    .line 17
    invoke-virtual {p0, p1, p5}, Ll/mpx;->j(Ljava/util/List;Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$Medal;)V

    .line 18
    .line 19
    .line 20
    return-void

    .line 21
    :cond_1
    sget-object v0, Ll/htd0;->c:Ll/htd0;

    .line 22
    .line 23
    invoke-static {v0}, Ll/zrv;->l(Ll/htd0;)Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    check-cast v0, Ll/hiv;

    .line 28
    .line 29
    invoke-virtual {p5}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$Medal;->getId()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    const-string v2, "live"

    .line 34
    .line 35
    invoke-virtual {p2}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;->getVersion()Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object p2

    .line 39
    invoke-virtual {v0, v1, v2, p2}, Ll/hiv;->t(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveMedal;

    .line 40
    .line 41
    .line 42
    move-result-object p2

    .line 43
    if-eqz p2, :cond_5

    .line 44
    .line 45
    invoke-virtual {p2}, Lcom/p1/mobile/putong/live/base/data/BLiveMedal;->isFanbaseMedal()Z

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    if-eqz v0, :cond_2

    .line 50
    .line 51
    invoke-virtual {p0, p3, p1, p5}, Ll/mpx;->i(Ll/cm0;Ljava/util/List;Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$Medal;)V

    .line 52
    .line 53
    .line 54
    return-void

    .line 55
    :cond_2
    const-string p0, "medalDesc"

    .line 56
    .line 57
    iget-object p3, p4, Lcom/p1/mobile/putong/live/base/data/BLiveTemplateItem;->scene:Ljava/lang/String;

    .line 58
    .line 59
    invoke-virtual {p0, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 60
    .line 61
    .line 62
    move-result p0

    .line 63
    if-eqz p0, :cond_3

    .line 64
    .line 65
    new-instance p0, Ljava/lang/StringBuilder;

    .line 66
    .line 67
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 68
    .line 69
    .line 70
    iget-object p3, p2, Lcom/p1/mobile/putong/live/base/data/BLiveMedal;->url:Ljava/lang/String;

    .line 71
    .line 72
    invoke-virtual {p0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 73
    .line 74
    .line 75
    const-string p3, "voiceMedal"

    .line 76
    .line 77
    invoke-virtual {p0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 78
    .line 79
    .line 80
    iget-object p2, p2, Lcom/p1/mobile/putong/live/base/data/BLiveMedal;->jumpUrl:Ljava/lang/String;

    .line 81
    .line 82
    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 83
    .line 84
    .line 85
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 86
    .line 87
    .line 88
    move-result-object p0

    .line 89
    invoke-interface {p1, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 90
    .line 91
    .line 92
    return-void

    .line 93
    :cond_3
    iget-object p0, p2, Lcom/p1/mobile/putong/live/base/data/BLiveMedal;->dynamicUrl:Ljava/lang/String;

    .line 94
    .line 95
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 96
    .line 97
    .line 98
    move-result p0

    .line 99
    if-nez p0, :cond_4

    .line 100
    .line 101
    iget-object p0, p2, Lcom/p1/mobile/putong/live/base/data/BLiveMedal;->dynamicUrl:Ljava/lang/String;

    .line 102
    .line 103
    const-string p3, "webp"

    .line 104
    .line 105
    invoke-virtual {p0, p3}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    .line 106
    .line 107
    .line 108
    move-result p0

    .line 109
    if-eqz p0, :cond_4

    .line 110
    .line 111
    new-instance p0, Ljava/lang/StringBuilder;

    .line 112
    .line 113
    const-string p3, "royalSplit:#"

    .line 114
    .line 115
    invoke-direct {p0, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 116
    .line 117
    .line 118
    iget-object p2, p2, Lcom/p1/mobile/putong/live/base/data/BLiveMedal;->dynamicUrl:Ljava/lang/String;

    .line 119
    .line 120
    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 121
    .line 122
    .line 123
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 124
    .line 125
    .line 126
    move-result-object p0

    .line 127
    invoke-interface {p1, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 128
    .line 129
    .line 130
    return-void

    .line 131
    :cond_4
    iget-object p0, p2, Lcom/p1/mobile/putong/live/base/data/BLiveMedal;->url:Ljava/lang/String;

    .line 132
    .line 133
    invoke-interface {p1, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 134
    .line 135
    .line 136
    :cond_5
    return-void
.end method

.method public final r(Ll/suf0;Lcom/p1/mobile/putong/live/base/data/BLiveTemplateItem;Ljava/lang/String;)V
    .locals 8

    .line 1
    const-string v0, "Split:#"

    .line 2
    .line 3
    invoke-virtual {p3, v0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p3

    .line 7
    const/4 v0, 0x1

    .line 8
    aget-object v0, p3, v0

    .line 9
    .line 10
    iget-object v1, p0, Ll/mpx;->b:Lcom/google/gson/Gson;

    .line 11
    .line 12
    const-class v2, Ll/nxp;

    .line 13
    .line 14
    invoke-virtual {v1, v0, v2}, Lcom/google/gson/Gson;->fromJson(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    move-object v5, v0

    .line 19
    check-cast v5, Ll/nxp;

    .line 20
    .line 21
    iget-object v2, p1, Ll/suf0;->a:Landroid/text/SpannableStringBuilder;

    .line 22
    .line 23
    const/4 v0, 0x0

    .line 24
    aget-object v3, p3, v0

    .line 25
    .line 26
    iget v4, p1, Ll/suf0;->b:I

    .line 27
    .line 28
    iget-object v6, p1, Ll/suf0;->c:Ljava/lang/Object;

    .line 29
    .line 30
    iget v7, p2, Lcom/p1/mobile/putong/live/base/data/BLiveTemplateItem;->size:I

    .line 31
    .line 32
    move-object v1, p0

    .line 33
    invoke-virtual/range {v1 .. v7}, Ll/mpx;->k(Landroid/text/SpannableStringBuilder;Ljava/lang/String;ILl/nxp;Ljava/lang/Object;I)Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    iput-object p0, p1, Ll/suf0;->c:Ljava/lang/Object;

    .line 38
    .line 39
    iget p0, p1, Ll/suf0;->b:I

    .line 40
    .line 41
    aget-object p2, p3, v0

    .line 42
    .line 43
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    .line 44
    .line 45
    .line 46
    move-result p2

    .line 47
    add-int/2addr p0, p2

    .line 48
    iput p0, p1, Ll/suf0;->b:I

    .line 49
    .line 50
    return-void
.end method

.method public final s(Landroid/text/SpannableStringBuilder;Ljava/lang/String;ILl/fbg;Ljava/lang/Object;I)Ljava/lang/Object;
    .locals 1

    .line 1
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-nez p0, :cond_0

    .line 6
    .line 7
    return-object p5

    .line 8
    :cond_0
    invoke-virtual {p1, p2}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 9
    .line 10
    .line 11
    new-instance p0, Ll/z5g;

    .line 12
    .line 13
    sget-object v0, Ll/zrv;->e:Landroid/app/Application;

    .line 14
    .line 15
    invoke-direct {p0, v0, p4, p6}, Ll/z5g;-><init>(Landroid/content/Context;Ll/fbg;I)V

    .line 16
    .line 17
    .line 18
    if-eqz p5, :cond_1

    .line 19
    .line 20
    const/4 p4, 0x4

    .line 21
    invoke-virtual {p0, p4}, Ll/sce;->g(I)V

    .line 22
    .line 23
    .line 24
    :cond_1
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    .line 25
    .line 26
    .line 27
    move-result p2

    .line 28
    add-int/2addr p2, p3

    .line 29
    const/16 p4, 0x21

    .line 30
    .line 31
    invoke-virtual {p1, p0, p3, p2, p4}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 32
    .line 33
    .line 34
    return-object p0
.end method

.method public final t(Ll/suf0;Lcom/p1/mobile/putong/live/base/data/BLiveTemplateItem;Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 5

    .line 1
    invoke-virtual {p3}, Ljava/lang/String;->length()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-nez p0, :cond_0

    .line 6
    .line 7
    return-object p4

    .line 8
    :cond_0
    const-string p0, "voiceMedal"

    .line 9
    .line 10
    invoke-virtual {p3, p0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    array-length p3, p0

    .line 15
    const/4 v0, 0x0

    .line 16
    if-lez p3, :cond_3

    .line 17
    .line 18
    iget-object p3, p1, Ll/suf0;->a:Landroid/text/SpannableStringBuilder;

    .line 19
    .line 20
    const/4 v1, 0x0

    .line 21
    aget-object v2, p0, v1

    .line 22
    .line 23
    invoke-virtual {p3, v2}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 24
    .line 25
    .line 26
    new-instance p3, Ll/hi20;

    .line 27
    .line 28
    sget-object v2, Ll/zrv;->e:Landroid/app/Application;

    .line 29
    .line 30
    aget-object v3, p0, v1

    .line 31
    .line 32
    iget v4, p2, Lcom/p1/mobile/putong/live/base/data/BLiveTemplateItem;->size:I

    .line 33
    .line 34
    invoke-direct {p3, v2, v3, v4}, Ll/hi20;-><init>(Landroid/content/Context;Ljava/lang/String;I)V

    .line 35
    .line 36
    .line 37
    if-eqz p4, :cond_1

    .line 38
    .line 39
    const/4 p4, 0x4

    .line 40
    invoke-virtual {p3, p4}, Ll/sce;->g(I)V

    .line 41
    .line 42
    .line 43
    :cond_1
    new-instance p4, Ll/a5s;

    .line 44
    .line 45
    iget-object p2, p2, Lcom/p1/mobile/putong/live/base/data/BLiveTemplateItem;->scene:Ljava/lang/String;

    .line 46
    .line 47
    invoke-direct {p4, p2, v0}, Ll/a5s;-><init>(Ljava/lang/String;Ll/brl;)V

    .line 48
    .line 49
    .line 50
    array-length p2, p0

    .line 51
    const/4 v0, 0x1

    .line 52
    if-le p2, v0, :cond_2

    .line 53
    .line 54
    aget-object p2, p0, v0

    .line 55
    .line 56
    invoke-virtual {p4, p2}, Ll/a5s;->g(Ljava/lang/String;)V

    .line 57
    .line 58
    .line 59
    :cond_2
    :try_start_0
    iget-object p2, p1, Ll/suf0;->a:Landroid/text/SpannableStringBuilder;

    .line 60
    .line 61
    iget v0, p1, Ll/suf0;->b:I

    .line 62
    .line 63
    aget-object v2, p0, v1

    .line 64
    .line 65
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    .line 66
    .line 67
    .line 68
    move-result v2

    .line 69
    add-int/2addr v2, v0

    .line 70
    const/16 v3, 0x21

    .line 71
    .line 72
    invoke-virtual {p2, p4, v0, v2, v3}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 73
    .line 74
    .line 75
    iget-object p2, p1, Ll/suf0;->a:Landroid/text/SpannableStringBuilder;

    .line 76
    .line 77
    iget p4, p1, Ll/suf0;->b:I

    .line 78
    .line 79
    aget-object v0, p0, v1

    .line 80
    .line 81
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    .line 82
    .line 83
    .line 84
    move-result v0

    .line 85
    add-int/2addr v0, p4

    .line 86
    invoke-virtual {p2, p3, p4, v0, v3}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 87
    .line 88
    .line 89
    iget p2, p1, Ll/suf0;->b:I

    .line 90
    .line 91
    aget-object p4, p0, v1

    .line 92
    .line 93
    invoke-virtual {p4}, Ljava/lang/String;->length()I

    .line 94
    .line 95
    .line 96
    move-result p4

    .line 97
    add-int/2addr p2, p4

    .line 98
    iput p2, p1, Ll/suf0;->b:I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 99
    .line 100
    goto :goto_0

    .line 101
    :catch_0
    move-exception p1

    .line 102
    invoke-static {p1}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 103
    .line 104
    .line 105
    aget-object p0, p0, v1

    .line 106
    .line 107
    :goto_0
    return-object p3

    .line 108
    :cond_3
    return-object v0
.end method

.method public final u(Ll/suf0;Lcom/p1/mobile/putong/live/base/data/BLiveTemplateItem;Ljava/lang/String;)V
    .locals 8

    .line 1
    const-string v0, "Split:#"

    .line 2
    .line 3
    invoke-virtual {p3, v0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p3

    .line 7
    const/4 v0, 0x1

    .line 8
    aget-object v0, p3, v0

    .line 9
    .line 10
    iget-object v1, p0, Ll/mpx;->b:Lcom/google/gson/Gson;

    .line 11
    .line 12
    const-class v2, Ll/nxp;

    .line 13
    .line 14
    invoke-virtual {v1, v0, v2}, Lcom/google/gson/Gson;->fromJson(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    move-object v5, v0

    .line 19
    check-cast v5, Ll/nxp;

    .line 20
    .line 21
    iget-object v2, p1, Ll/suf0;->a:Landroid/text/SpannableStringBuilder;

    .line 22
    .line 23
    const/4 v0, 0x0

    .line 24
    aget-object v3, p3, v0

    .line 25
    .line 26
    iget v4, p1, Ll/suf0;->b:I

    .line 27
    .line 28
    iget-object v6, p1, Ll/suf0;->c:Ljava/lang/Object;

    .line 29
    .line 30
    iget v7, p2, Lcom/p1/mobile/putong/live/base/data/BLiveTemplateItem;->size:I

    .line 31
    .line 32
    move-object v1, p0

    .line 33
    invoke-virtual/range {v1 .. v7}, Ll/mpx;->m(Landroid/text/SpannableStringBuilder;Ljava/lang/String;ILl/nxp;Ljava/lang/Object;I)Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    iput-object p0, p1, Ll/suf0;->c:Ljava/lang/Object;

    .line 38
    .line 39
    iget p0, p1, Ll/suf0;->b:I

    .line 40
    .line 41
    aget-object p2, p3, v0

    .line 42
    .line 43
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    .line 44
    .line 45
    .line 46
    move-result p2

    .line 47
    add-int/2addr p0, p2

    .line 48
    iput p0, p1, Ll/suf0;->b:I

    .line 49
    .line 50
    return-void
.end method

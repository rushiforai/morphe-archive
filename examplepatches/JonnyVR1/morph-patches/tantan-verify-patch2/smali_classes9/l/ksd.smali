.class public Ll/ksd;
.super Ll/yr2;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/yr2;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public b(Lcom/p1/mobile/putong/live/base/data/BLiveTemplateItem;Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;Ll/hzc0;)Ljava/util/List;
    .locals 1
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
    iget p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveTemplateItem;->index:I

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    if-gtz p0, :cond_0

    .line 5
    .line 6
    new-array p0, v0, [Ljava/lang/String;

    .line 7
    .line 8
    invoke-static {p0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0

    .line 13
    :cond_0
    if-eqz p3, :cond_1

    .line 14
    .line 15
    iget-object p0, p3, Ll/hzc0;->d:Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessage;

    .line 16
    .line 17
    if-eqz p0, :cond_1

    .line 18
    .line 19
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessage;->getTemplate()Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;->getFieldsCount()I

    .line 24
    .line 25
    .line 26
    move-result p0

    .line 27
    iget p2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveTemplateItem;->index:I

    .line 28
    .line 29
    add-int/lit8 p2, p2, -0x1

    .line 30
    .line 31
    if-le p0, p2, :cond_2

    .line 32
    .line 33
    iget-object p0, p3, Ll/hzc0;->d:Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessage;

    .line 34
    .line 35
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessage;->getTemplate()Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    iget p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveTemplateItem;->index:I

    .line 40
    .line 41
    add-int/lit8 p1, p1, -0x1

    .line 42
    .line 43
    invoke-virtual {p0, p1}, Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;->getFields(I)Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    filled-new-array {p0}, [Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    invoke-static {p0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    return-object p0

    .line 56
    :cond_1
    if-eqz p2, :cond_2

    .line 57
    .line 58
    invoke-virtual {p2}, Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;->getFieldsCount()I

    .line 59
    .line 60
    .line 61
    move-result p0

    .line 62
    iget p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveTemplateItem;->index:I

    .line 63
    .line 64
    add-int/lit8 p3, p1, -0x1

    .line 65
    .line 66
    if-le p0, p3, :cond_2

    .line 67
    .line 68
    add-int/lit8 p1, p1, -0x1

    .line 69
    .line 70
    invoke-virtual {p2, p1}, Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;->getFields(I)Ljava/lang/String;

    .line 71
    .line 72
    .line 73
    move-result-object p0

    .line 74
    filled-new-array {p0}, [Ljava/lang/String;

    .line 75
    .line 76
    .line 77
    move-result-object p0

    .line 78
    invoke-static {p0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 79
    .line 80
    .line 81
    move-result-object p0

    .line 82
    return-object p0

    .line 83
    :cond_2
    new-array p0, v0, [Ljava/lang/String;

    .line 84
    .line 85
    invoke-static {p0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 86
    .line 87
    .line 88
    move-result-object p0

    .line 89
    return-object p0
.end method

.method public f(Ll/suf0;Lcom/p1/mobile/putong/live/base/data/BLiveTemplateItem;Ljava/util/List;Ll/hzc0;)V
    .locals 5
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
    const/4 p0, 0x0

    .line 2
    invoke-interface {p3, p0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 3
    .line 4
    .line 5
    move-result-object p3

    .line 6
    check-cast p3, Ljava/lang/String;

    .line 7
    .line 8
    invoke-static {}, Landroid/text/BidiFormatter;->getInstance()Landroid/text/BidiFormatter;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {v0, p3}, Landroid/text/BidiFormatter;->isRtl(Ljava/lang/String;)Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-eqz v0, :cond_0

    .line 17
    .line 18
    invoke-static {p0}, Landroid/text/BidiFormatter;->getInstance(Z)Landroid/text/BidiFormatter;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    sget-object v1, Landroid/text/TextDirectionHeuristics;->RTL:Landroid/text/TextDirectionHeuristic;

    .line 23
    .line 24
    invoke-virtual {v0, p3, v1}, Landroid/text/BidiFormatter;->unicodeWrap(Ljava/lang/String;Landroid/text/TextDirectionHeuristic;)Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object p3

    .line 28
    :cond_0
    iget-object v0, p1, Ll/suf0;->a:Landroid/text/SpannableStringBuilder;

    .line 29
    .line 30
    invoke-virtual {v0, p3}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 31
    .line 32
    .line 33
    iget-object v0, p1, Ll/suf0;->c:Ljava/lang/Object;

    .line 34
    .line 35
    instance-of v0, v0, Ll/zql;

    .line 36
    .line 37
    if-eqz v0, :cond_2

    .line 38
    .line 39
    invoke-virtual {p4}, Ll/hzc0;->b()Z

    .line 40
    .line 41
    .line 42
    move-result p4

    .line 43
    iget-object v0, p1, Ll/suf0;->c:Ljava/lang/Object;

    .line 44
    .line 45
    if-eqz p4, :cond_1

    .line 46
    .line 47
    check-cast v0, Ll/zql;

    .line 48
    .line 49
    const/16 p4, 0x8

    .line 50
    .line 51
    invoke-interface {v0, p4}, Ll/zql;->a(I)V

    .line 52
    .line 53
    .line 54
    goto :goto_0

    .line 55
    :cond_1
    check-cast v0, Ll/zql;

    .line 56
    .line 57
    const/4 p4, 0x4

    .line 58
    invoke-interface {v0, p4}, Ll/zql;->a(I)V

    .line 59
    .line 60
    .line 61
    :cond_2
    :goto_0
    sget-object p4, Ll/e810;->b:Ljava/lang/Object;

    .line 62
    .line 63
    iput-object p4, p1, Ll/suf0;->c:Ljava/lang/Object;

    .line 64
    .line 65
    iget-object p4, p2, Lcom/p1/mobile/putong/live/base/data/BLiveTemplateItem;->gradientColors:Ljava/util/List;

    .line 66
    .line 67
    invoke-static {p4}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 68
    .line 69
    .line 70
    move-result p4

    .line 71
    const/4 v0, 0x1

    .line 72
    const/16 v1, 0x21

    .line 73
    .line 74
    const-string v2, "#"

    .line 75
    .line 76
    const-string v3, "x"

    .line 77
    .line 78
    if-nez p4, :cond_3

    .line 79
    .line 80
    iget-object p4, p2, Lcom/p1/mobile/putong/live/base/data/BLiveTemplateItem;->gradientColors:Ljava/util/List;

    .line 81
    .line 82
    invoke-interface {p4}, Ljava/util/List;->size()I

    .line 83
    .line 84
    .line 85
    move-result p4

    .line 86
    const/4 v4, 0x2

    .line 87
    if-lt p4, v4, :cond_3

    .line 88
    .line 89
    iget-object p4, p2, Lcom/p1/mobile/putong/live/base/data/BLiveTemplateItem;->gradientColors:Ljava/util/List;

    .line 90
    .line 91
    invoke-interface {p4, p0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 92
    .line 93
    .line 94
    move-result-object p0

    .line 95
    check-cast p0, Ljava/lang/String;

    .line 96
    .line 97
    invoke-virtual {p0, v3, v2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    .line 98
    .line 99
    .line 100
    move-result-object p0

    .line 101
    const/4 p4, -0x1

    .line 102
    invoke-static {p0, p4}, Ll/n3d0;->h(Ljava/lang/String;I)I

    .line 103
    .line 104
    .line 105
    move-result p0

    .line 106
    iget-object v4, p2, Lcom/p1/mobile/putong/live/base/data/BLiveTemplateItem;->gradientColors:Ljava/util/List;

    .line 107
    .line 108
    invoke-interface {v4, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 109
    .line 110
    .line 111
    move-result-object v4

    .line 112
    check-cast v4, Ljava/lang/String;

    .line 113
    .line 114
    invoke-virtual {v4, v3, v2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    .line 115
    .line 116
    .line 117
    move-result-object v2

    .line 118
    invoke-static {v2, p4}, Ll/n3d0;->h(Ljava/lang/String;I)I

    .line 119
    .line 120
    .line 121
    move-result p4

    .line 122
    new-instance v2, Ll/kor;

    .line 123
    .line 124
    invoke-direct {v2, p0, p4}, Ll/kor;-><init>(II)V

    .line 125
    .line 126
    .line 127
    iget-object p0, p1, Ll/suf0;->a:Landroid/text/SpannableStringBuilder;

    .line 128
    .line 129
    iget p4, p1, Ll/suf0;->b:I

    .line 130
    .line 131
    invoke-virtual {p3}, Ljava/lang/String;->length()I

    .line 132
    .line 133
    .line 134
    move-result v3

    .line 135
    add-int/2addr v3, p4

    .line 136
    invoke-virtual {p0, v2, p4, v3, v1}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 137
    .line 138
    .line 139
    goto :goto_1

    .line 140
    :cond_3
    iget-object p0, p2, Lcom/p1/mobile/putong/live/base/data/BLiveTemplateItem;->color:Ljava/lang/String;

    .line 141
    .line 142
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 143
    .line 144
    .line 145
    move-result p0

    .line 146
    if-nez p0, :cond_4

    .line 147
    .line 148
    new-instance p0, Landroid/text/style/ForegroundColorSpan;

    .line 149
    .line 150
    iget-object p4, p2, Lcom/p1/mobile/putong/live/base/data/BLiveTemplateItem;->color:Ljava/lang/String;

    .line 151
    .line 152
    invoke-virtual {p4, v3, v2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    .line 153
    .line 154
    .line 155
    move-result-object p4

    .line 156
    invoke-static {p4}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 157
    .line 158
    .line 159
    move-result p4

    .line 160
    invoke-direct {p0, p4}, Landroid/text/style/ForegroundColorSpan;-><init>(I)V

    .line 161
    .line 162
    .line 163
    iget-object p4, p1, Ll/suf0;->a:Landroid/text/SpannableStringBuilder;

    .line 164
    .line 165
    iget v2, p1, Ll/suf0;->b:I

    .line 166
    .line 167
    invoke-virtual {p3}, Ljava/lang/String;->length()I

    .line 168
    .line 169
    .line 170
    move-result v3

    .line 171
    add-int/2addr v3, v2

    .line 172
    invoke-virtual {p4, p0, v2, v3, v1}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 173
    .line 174
    .line 175
    :cond_4
    :goto_1
    iget p0, p2, Lcom/p1/mobile/putong/live/base/data/BLiveTemplateItem;->size:I

    .line 176
    .line 177
    if-eqz p0, :cond_5

    .line 178
    .line 179
    iget-object p0, p1, Ll/suf0;->a:Landroid/text/SpannableStringBuilder;

    .line 180
    .line 181
    new-instance p4, Landroid/text/style/AbsoluteSizeSpan;

    .line 182
    .line 183
    iget p2, p2, Lcom/p1/mobile/putong/live/base/data/BLiveTemplateItem;->size:I

    .line 184
    .line 185
    invoke-direct {p4, p2, v0}, Landroid/text/style/AbsoluteSizeSpan;-><init>(IZ)V

    .line 186
    .line 187
    .line 188
    iget p2, p1, Ll/suf0;->b:I

    .line 189
    .line 190
    invoke-virtual {p3}, Ljava/lang/String;->length()I

    .line 191
    .line 192
    .line 193
    move-result v0

    .line 194
    add-int/2addr v0, p2

    .line 195
    invoke-virtual {p0, p4, p2, v0, v1}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 196
    .line 197
    .line 198
    :cond_5
    iget p0, p1, Ll/suf0;->b:I

    .line 199
    .line 200
    invoke-virtual {p3}, Ljava/lang/String;->length()I

    .line 201
    .line 202
    .line 203
    move-result p2

    .line 204
    add-int/2addr p0, p2

    .line 205
    iput p0, p1, Ll/suf0;->b:I

    .line 206
    .line 207
    return-void
.end method

.method public getType()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "default"

    .line 2
    .line 3
    return-object p0
.end method

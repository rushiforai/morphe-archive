.class public Ll/mgw;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Landroid/text/StaticLayout;

.field public b:Landroid/text/StaticLayout;

.field public c:[Landroid/graphics/Rect;

.field public d:[Landroid/graphics/Rect;

.field public e:[Landroid/graphics/Rect;

.field public f:Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/bean/LrcBean;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/bean/LrcBean;Landroid/text/TextPaint;I)V
    .locals 0
    .param p2    # Landroid/text/TextPaint;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/mgw;->f:Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/bean/LrcBean;

    .line 5
    .line 6
    const/4 p1, 0x0

    .line 7
    invoke-virtual {p0, p1, p2, p3}, Ll/mgw;->e(Landroid/text/TextPaint;Landroid/text/TextPaint;I)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public constructor <init>(Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/bean/LrcBean;Landroid/text/TextPaint;Landroid/text/TextPaint;I)V
    .locals 0
    .param p2    # Landroid/text/TextPaint;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p3    # Landroid/text/TextPaint;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 12
    iput-object p1, p0, Ll/mgw;->f:Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/bean/LrcBean;

    .line 13
    invoke-virtual {p0, p2, p3, p4}, Ll/mgw;->e(Landroid/text/TextPaint;Landroid/text/TextPaint;I)V

    return-void
.end method


# virtual methods
.method public a(Landroid/graphics/Canvas;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/mgw;->a:Landroid/text/StaticLayout;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Landroid/text/Layout;->draw(Landroid/graphics/Canvas;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public b(Landroid/graphics/Canvas;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/mgw;->b:Landroid/text/StaticLayout;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Landroid/text/Layout;->draw(Landroid/graphics/Canvas;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public c(J)[Landroid/graphics/Rect;
    .locals 10

    .line 1
    iget-object v0, p0, Ll/mgw;->f:Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/bean/LrcBean;

    .line 2
    .line 3
    if-eqz v0, :cond_9

    .line 4
    .line 5
    iget-object v0, v0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/bean/LrcBean;->tones:Ljava/util/List;

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    goto/16 :goto_5

    .line 10
    .line 11
    :cond_0
    const/4 v1, 0x0

    .line 12
    move v2, v1

    .line 13
    move v3, v2

    .line 14
    :goto_0
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 15
    .line 16
    .line 17
    move-result v4

    .line 18
    const/4 v5, 0x0

    .line 19
    if-ge v2, v4, :cond_6

    .line 20
    .line 21
    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object v4

    .line 25
    check-cast v4, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/bean/LrcBean$Tone;

    .line 26
    .line 27
    iget-wide v6, v4, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/bean/LrcBean$Tone;->end:J

    .line 28
    .line 29
    cmp-long v6, p1, v6

    .line 30
    .line 31
    const/4 v7, 0x1

    .line 32
    if-ltz v6, :cond_3

    .line 33
    .line 34
    iget-object v3, p0, Ll/mgw;->b:Landroid/text/StaticLayout;

    .line 35
    .line 36
    invoke-virtual {v3}, Landroid/text/StaticLayout;->getLineCount()I

    .line 37
    .line 38
    .line 39
    move-result v3

    .line 40
    if-ne v3, v7, :cond_2

    .line 41
    .line 42
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 43
    .line 44
    .line 45
    move-result v3

    .line 46
    sub-int/2addr v3, v7

    .line 47
    if-ne v2, v3, :cond_1

    .line 48
    .line 49
    iget-object v3, p0, Ll/mgw;->e:[Landroid/graphics/Rect;

    .line 50
    .line 51
    aget-object v3, v3, v1

    .line 52
    .line 53
    invoke-virtual {v3}, Landroid/graphics/Rect;->width()I

    .line 54
    .line 55
    .line 56
    move-result v3

    .line 57
    goto :goto_1

    .line 58
    :cond_1
    iget-object v3, p0, Ll/mgw;->d:[Landroid/graphics/Rect;

    .line 59
    .line 60
    aget-object v3, v3, v2

    .line 61
    .line 62
    invoke-virtual {v3}, Landroid/graphics/Rect;->width()I

    .line 63
    .line 64
    .line 65
    move-result v3

    .line 66
    goto :goto_1

    .line 67
    :cond_2
    iget-object v3, p0, Ll/mgw;->d:[Landroid/graphics/Rect;

    .line 68
    .line 69
    aget-object v3, v3, v2

    .line 70
    .line 71
    invoke-virtual {v3}, Landroid/graphics/Rect;->width()I

    .line 72
    .line 73
    .line 74
    move-result v3

    .line 75
    :goto_1
    add-int/lit8 v2, v2, 0x1

    .line 76
    .line 77
    goto :goto_0

    .line 78
    :cond_3
    iget-object v0, p0, Ll/mgw;->d:[Landroid/graphics/Rect;

    .line 79
    .line 80
    if-nez v2, :cond_4

    .line 81
    .line 82
    aget-object v0, v0, v2

    .line 83
    .line 84
    invoke-virtual {v0}, Landroid/graphics/Rect;->width()I

    .line 85
    .line 86
    .line 87
    move-result v0

    .line 88
    goto :goto_2

    .line 89
    :cond_4
    aget-object v0, v0, v2

    .line 90
    .line 91
    invoke-virtual {v0}, Landroid/graphics/Rect;->width()I

    .line 92
    .line 93
    .line 94
    move-result v0

    .line 95
    iget-object v6, p0, Ll/mgw;->d:[Landroid/graphics/Rect;

    .line 96
    .line 97
    sub-int/2addr v2, v7

    .line 98
    aget-object v2, v6, v2

    .line 99
    .line 100
    invoke-virtual {v2}, Landroid/graphics/Rect;->width()I

    .line 101
    .line 102
    .line 103
    move-result v2

    .line 104
    sub-int/2addr v0, v2

    .line 105
    :goto_2
    iget-wide v6, v4, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/bean/LrcBean$Tone;->begin:J

    .line 106
    .line 107
    sub-long/2addr p1, v6

    .line 108
    long-to-float p1, p1

    .line 109
    iget-wide v8, v4, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/bean/LrcBean$Tone;->end:J

    .line 110
    .line 111
    sub-long/2addr v8, v6

    .line 112
    long-to-float p2, v8

    .line 113
    div-float/2addr p1, p2

    .line 114
    int-to-float p2, v0

    .line 115
    cmpl-float v0, p1, v5

    .line 116
    .line 117
    if-lez v0, :cond_5

    .line 118
    .line 119
    move v5, p1

    .line 120
    :cond_5
    mul-float/2addr v5, p2

    .line 121
    :cond_6
    int-to-float p1, v3

    .line 122
    add-float/2addr p1, v5

    .line 123
    float-to-int p1, p1

    .line 124
    move p2, v1

    .line 125
    :goto_3
    iget-object v0, p0, Ll/mgw;->b:Landroid/text/StaticLayout;

    .line 126
    .line 127
    invoke-virtual {v0}, Landroid/text/StaticLayout;->getLineCount()I

    .line 128
    .line 129
    .line 130
    move-result v0

    .line 131
    if-ge p2, v0, :cond_8

    .line 132
    .line 133
    iget-object v0, p0, Ll/mgw;->e:[Landroid/graphics/Rect;

    .line 134
    .line 135
    aget-object v0, v0, p2

    .line 136
    .line 137
    invoke-virtual {v0}, Landroid/graphics/Rect;->width()I

    .line 138
    .line 139
    .line 140
    move-result v0

    .line 141
    iget-object v2, p0, Ll/mgw;->c:[Landroid/graphics/Rect;

    .line 142
    .line 143
    aget-object v2, v2, p2

    .line 144
    .line 145
    iget-object v3, p0, Ll/mgw;->e:[Landroid/graphics/Rect;

    .line 146
    .line 147
    aget-object v3, v3, p2

    .line 148
    .line 149
    iget v4, v3, Landroid/graphics/Rect;->left:I

    .line 150
    .line 151
    iput v4, v2, Landroid/graphics/Rect;->left:I

    .line 152
    .line 153
    iget v3, v3, Landroid/graphics/Rect;->right:I

    .line 154
    .line 155
    iput v3, v2, Landroid/graphics/Rect;->right:I

    .line 156
    .line 157
    if-le v0, p1, :cond_7

    .line 158
    .line 159
    add-int/2addr v4, p1

    .line 160
    iput v4, v2, Landroid/graphics/Rect;->right:I

    .line 161
    .line 162
    move p1, v1

    .line 163
    goto :goto_4

    .line 164
    :cond_7
    sub-int/2addr p1, v0

    .line 165
    :goto_4
    add-int/lit8 p2, p2, 0x1

    .line 166
    .line 167
    goto :goto_3

    .line 168
    :cond_8
    iget-object p0, p0, Ll/mgw;->c:[Landroid/graphics/Rect;

    .line 169
    .line 170
    return-object p0

    .line 171
    :cond_9
    :goto_5
    const/4 p0, 0x0

    .line 172
    return-object p0
.end method

.method public d()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/mgw;->a:Landroid/text/StaticLayout;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    return p0

    .line 7
    :cond_0
    invoke-virtual {p0}, Landroid/text/Layout;->getHeight()I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public final e(Landroid/text/TextPaint;Landroid/text/TextPaint;I)V
    .locals 9
    .param p1    # Landroid/text/TextPaint;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p2    # Landroid/text/TextPaint;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    sget-object v4, Landroid/text/Layout$Alignment;->ALIGN_CENTER:Landroid/text/Layout$Alignment;

    .line 2
    .line 3
    new-instance v0, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 6
    .line 7
    .line 8
    iget-object v1, p0, Ll/mgw;->f:Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/bean/LrcBean;

    .line 9
    .line 10
    if-eqz v1, :cond_4

    .line 11
    .line 12
    iget-object v1, v1, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/bean/LrcBean;->tones:Ljava/util/List;

    .line 13
    .line 14
    if-nez v1, :cond_0

    .line 15
    .line 16
    goto/16 :goto_3

    .line 17
    .line 18
    :cond_0
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 19
    .line 20
    .line 21
    move-result v2

    .line 22
    new-array v2, v2, [Landroid/graphics/Rect;

    .line 23
    .line 24
    iput-object v2, p0, Ll/mgw;->d:[Landroid/graphics/Rect;

    .line 25
    .line 26
    const/4 v8, 0x0

    .line 27
    move v2, v8

    .line 28
    :goto_0
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 29
    .line 30
    .line 31
    move-result v3

    .line 32
    if-ge v2, v3, :cond_2

    .line 33
    .line 34
    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 35
    .line 36
    .line 37
    move-result-object v3

    .line 38
    check-cast v3, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/bean/LrcBean$Tone;

    .line 39
    .line 40
    new-instance v5, Landroid/graphics/Rect;

    .line 41
    .line 42
    invoke-direct {v5}, Landroid/graphics/Rect;-><init>()V

    .line 43
    .line 44
    .line 45
    iget-object v6, p0, Ll/mgw;->d:[Landroid/graphics/Rect;

    .line 46
    .line 47
    aput-object v5, v6, v2

    .line 48
    .line 49
    iget-object v6, v3, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/bean/LrcBean$Tone;->word:Ljava/lang/String;

    .line 50
    .line 51
    iget-object v3, v3, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/bean/LrcBean$Tone;->lang:Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/bean/LrcBean$Lang;

    .line 52
    .line 53
    sget-object v7, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/bean/LrcBean$Lang;->Chinese:Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/bean/LrcBean$Lang;

    .line 54
    .line 55
    if-eq v3, v7, :cond_1

    .line 56
    .line 57
    new-instance v3, Ljava/lang/StringBuilder;

    .line 58
    .line 59
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 60
    .line 61
    .line 62
    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 63
    .line 64
    .line 65
    const-string v6, " "

    .line 66
    .line 67
    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 68
    .line 69
    .line 70
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 71
    .line 72
    .line 73
    move-result-object v6

    .line 74
    :cond_1
    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 75
    .line 76
    .line 77
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 78
    .line 79
    .line 80
    move-result-object v3

    .line 81
    invoke-virtual {v3}, Ljava/lang/String;->length()I

    .line 82
    .line 83
    .line 84
    move-result v6

    .line 85
    invoke-virtual {p2, v3, v8, v6, v5}, Landroid/graphics/Paint;->getTextBounds(Ljava/lang/String;IILandroid/graphics/Rect;)V

    .line 86
    .line 87
    .line 88
    add-int/lit8 v2, v2, 0x1

    .line 89
    .line 90
    goto :goto_0

    .line 91
    :cond_2
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 92
    .line 93
    .line 94
    move-result-object v1

    .line 95
    if-eqz p1, :cond_3

    .line 96
    .line 97
    new-instance v0, Landroid/text/StaticLayout;

    .line 98
    .line 99
    const/4 v6, 0x0

    .line 100
    const/4 v7, 0x0

    .line 101
    const/high16 v5, 0x3f800000    # 1.0f

    .line 102
    .line 103
    move-object v2, p1

    .line 104
    move v3, p3

    .line 105
    invoke-direct/range {v0 .. v7}, Landroid/text/StaticLayout;-><init>(Ljava/lang/CharSequence;Landroid/text/TextPaint;ILandroid/text/Layout$Alignment;FFZ)V

    .line 106
    .line 107
    .line 108
    iput-object v0, p0, Ll/mgw;->b:Landroid/text/StaticLayout;

    .line 109
    .line 110
    goto :goto_1

    .line 111
    :cond_3
    move v3, p3

    .line 112
    :goto_1
    new-instance v0, Landroid/text/StaticLayout;

    .line 113
    .line 114
    const/4 v6, 0x0

    .line 115
    const/4 v7, 0x0

    .line 116
    const/high16 v5, 0x3f800000    # 1.0f

    .line 117
    .line 118
    move-object v2, p2

    .line 119
    invoke-direct/range {v0 .. v7}, Landroid/text/StaticLayout;-><init>(Ljava/lang/CharSequence;Landroid/text/TextPaint;ILandroid/text/Layout$Alignment;FFZ)V

    .line 120
    .line 121
    .line 122
    iput-object v0, p0, Ll/mgw;->a:Landroid/text/StaticLayout;

    .line 123
    .line 124
    invoke-virtual {v0}, Landroid/text/StaticLayout;->getLineCount()I

    .line 125
    .line 126
    .line 127
    move-result p1

    .line 128
    new-array p2, p1, [Landroid/graphics/Rect;

    .line 129
    .line 130
    iput-object p2, p0, Ll/mgw;->e:[Landroid/graphics/Rect;

    .line 131
    .line 132
    new-array p2, p1, [Landroid/graphics/Rect;

    .line 133
    .line 134
    iput-object p2, p0, Ll/mgw;->c:[Landroid/graphics/Rect;

    .line 135
    .line 136
    :goto_2
    if-ge v8, p1, :cond_4

    .line 137
    .line 138
    new-instance p2, Landroid/graphics/Rect;

    .line 139
    .line 140
    invoke-direct {p2}, Landroid/graphics/Rect;-><init>()V

    .line 141
    .line 142
    .line 143
    iget-object p3, p0, Ll/mgw;->a:Landroid/text/StaticLayout;

    .line 144
    .line 145
    invoke-virtual {p3, v8, p2}, Landroid/text/Layout;->getLineBounds(ILandroid/graphics/Rect;)I

    .line 146
    .line 147
    .line 148
    iget-object p3, p0, Ll/mgw;->a:Landroid/text/StaticLayout;

    .line 149
    .line 150
    invoke-virtual {p3, v8}, Landroid/text/Layout;->getLineLeft(I)F

    .line 151
    .line 152
    .line 153
    move-result p3

    .line 154
    float-to-int p3, p3

    .line 155
    iput p3, p2, Landroid/graphics/Rect;->left:I

    .line 156
    .line 157
    iget-object p3, p0, Ll/mgw;->a:Landroid/text/StaticLayout;

    .line 158
    .line 159
    invoke-virtual {p3, v8}, Landroid/text/Layout;->getLineRight(I)F

    .line 160
    .line 161
    .line 162
    move-result p3

    .line 163
    float-to-int p3, p3

    .line 164
    iput p3, p2, Landroid/graphics/Rect;->right:I

    .line 165
    .line 166
    iget-object p3, p0, Ll/mgw;->e:[Landroid/graphics/Rect;

    .line 167
    .line 168
    aput-object p2, p3, v8

    .line 169
    .line 170
    iget-object p3, p0, Ll/mgw;->c:[Landroid/graphics/Rect;

    .line 171
    .line 172
    new-instance v0, Landroid/graphics/Rect;

    .line 173
    .line 174
    invoke-direct {v0, p2}, Landroid/graphics/Rect;-><init>(Landroid/graphics/Rect;)V

    .line 175
    .line 176
    .line 177
    aput-object v0, p3, v8

    .line 178
    .line 179
    add-int/lit8 v8, v8, 0x1

    .line 180
    .line 181
    goto :goto_2

    .line 182
    :cond_4
    :goto_3
    return-void
.end method

.class public Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaMediaItemView;
.super Landroid/widget/FrameLayout;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public a:Lv/VDraweeView;

.field public b:Landroid/widget/ImageView;

.field public c:Lv/VText;

.field public d:Landroid/view/View;

.field public e:Lcom/p1/mobile/putong/feed/newui/mediapicker/MarkView;

.field public f:Lcom/p1/mobile/putong/data/Media;

.field public g:I

.field public h:Lcom/p1/mobile/putong/ui/mediapicker/MediaPickerBaseAct$a;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 5
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 6
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method


# virtual methods
.method public final a(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/wwm;->a(Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaMediaItemView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final b(F)Ljava/lang/String;
    .locals 1

    .line 1
    new-instance p0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const/high16 v0, 0x447a0000    # 1000.0f

    .line 7
    .line 8
    div-float/2addr p1, v0

    .line 9
    float-to-int p1, p1

    .line 10
    const/16 v0, 0x3c

    .line 11
    .line 12
    if-lt p1, v0, :cond_0

    .line 13
    .line 14
    div-int/lit8 v0, p1, 0x3c

    .line 15
    .line 16
    rem-int/lit8 p1, p1, 0x3c

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_0
    const/4 v0, 0x0

    .line 20
    :goto_0
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    const-string v0, ":"

    .line 24
    .line 25
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    const/16 v0, 0xa

    .line 29
    .line 30
    if-ge p1, v0, :cond_1

    .line 31
    .line 32
    const-string v0, "0"

    .line 33
    .line 34
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 35
    .line 36
    .line 37
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 38
    .line 39
    .line 40
    goto :goto_1

    .line 41
    :cond_1
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 42
    .line 43
    .line 44
    :goto_1
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    return-object p0
.end method

.method public c(Lcom/p1/mobile/putong/data/Media;IZLcom/p1/mobile/putong/ui/mediapicker/MediaPickerBaseAct$a;)V
    .locals 6

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaMediaItemView;->f:Lcom/p1/mobile/putong/data/Media;

    .line 2
    .line 3
    iput p2, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaMediaItemView;->g:I

    .line 4
    .line 5
    iput-object p4, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaMediaItemView;->h:Lcom/p1/mobile/putong/ui/mediapicker/MediaPickerBaseAct$a;

    .line 6
    .line 7
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 8
    .line 9
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaMediaItemView;->a:Lv/VDraweeView;

    .line 10
    .line 11
    iget-object v2, p1, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 12
    .line 13
    invoke-virtual {v0, v1, v2}, Ll/fsb0;->m0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    invoke-interface {p4}, Lcom/p1/mobile/putong/ui/mediapicker/MediaPickerBaseAct$a;->H()I

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaMediaItemView;->d:Landroid/view/View;

    .line 21
    .line 22
    const/16 v2, 0x8

    .line 23
    .line 24
    const/4 v3, 0x0

    .line 25
    if-ne v0, p2, :cond_0

    .line 26
    .line 27
    invoke-virtual {v1, v3}, Landroid/view/View;->setVisibility(I)V

    .line 28
    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_0
    invoke-virtual {v1, v2}, Landroid/view/View;->setVisibility(I)V

    .line 32
    .line 33
    .line 34
    :goto_0
    const/4 v0, 0x1

    .line 35
    if-nez p3, :cond_2

    .line 36
    .line 37
    invoke-interface {p4}, Lcom/p1/mobile/putong/ui/mediapicker/MediaPickerBaseAct$a;->H()I

    .line 38
    .line 39
    .line 40
    move-result p3

    .line 41
    iget-object p4, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaMediaItemView;->e:Lcom/p1/mobile/putong/feed/newui/mediapicker/MarkView;

    .line 42
    .line 43
    if-ne p3, p2, :cond_1

    .line 44
    .line 45
    invoke-virtual {p4, v3}, Landroid/view/View;->setVisibility(I)V

    .line 46
    .line 47
    .line 48
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaMediaItemView;->e:Lcom/p1/mobile/putong/feed/newui/mediapicker/MarkView;

    .line 49
    .line 50
    invoke-virtual {p2, v0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/MarkView;->setChecked(Z)V

    .line 51
    .line 52
    .line 53
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaMediaItemView;->e:Lcom/p1/mobile/putong/feed/newui/mediapicker/MarkView;

    .line 54
    .line 55
    invoke-virtual {p2, v3}, Lcom/p1/mobile/putong/feed/newui/mediapicker/MarkView;->setSelectPosition(I)V

    .line 56
    .line 57
    .line 58
    goto :goto_1

    .line 59
    :cond_1
    const/4 p2, 0x4

    .line 60
    invoke-virtual {p4, p2}, Landroid/view/View;->setVisibility(I)V

    .line 61
    .line 62
    .line 63
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaMediaItemView;->e:Lcom/p1/mobile/putong/feed/newui/mediapicker/MarkView;

    .line 64
    .line 65
    invoke-virtual {p2, v3}, Lcom/p1/mobile/putong/feed/newui/mediapicker/MarkView;->setChecked(Z)V

    .line 66
    .line 67
    .line 68
    goto :goto_1

    .line 69
    :cond_2
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaMediaItemView;->e:Lcom/p1/mobile/putong/feed/newui/mediapicker/MarkView;

    .line 70
    .line 71
    invoke-virtual {p2, v3}, Landroid/view/View;->setVisibility(I)V

    .line 72
    .line 73
    .line 74
    invoke-interface {p4}, Lcom/p1/mobile/putong/ui/mediapicker/MediaPickerBaseAct$a;->x()Ljava/util/Map;

    .line 75
    .line 76
    .line 77
    move-result-object p2

    .line 78
    iget-object p3, p1, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 79
    .line 80
    invoke-interface {p2, p3}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    .line 81
    .line 82
    .line 83
    move-result p2

    .line 84
    iget-object p3, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaMediaItemView;->e:Lcom/p1/mobile/putong/feed/newui/mediapicker/MarkView;

    .line 85
    .line 86
    if-eqz p2, :cond_3

    .line 87
    .line 88
    invoke-virtual {p3, v0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/MarkView;->setChecked(Z)V

    .line 89
    .line 90
    .line 91
    new-instance p2, Ljava/util/ArrayList;

    .line 92
    .line 93
    invoke-interface {p4}, Lcom/p1/mobile/putong/ui/mediapicker/MediaPickerBaseAct$a;->x()Ljava/util/Map;

    .line 94
    .line 95
    .line 96
    move-result-object p3

    .line 97
    invoke-interface {p3}, Ljava/util/Map;->keySet()Ljava/util/Set;

    .line 98
    .line 99
    .line 100
    move-result-object p3

    .line 101
    invoke-direct {p2, p3}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 102
    .line 103
    .line 104
    iget-object p3, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaMediaItemView;->f:Lcom/p1/mobile/putong/data/Media;

    .line 105
    .line 106
    iget-object p3, p3, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 107
    .line 108
    invoke-virtual {p2, p3}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    .line 109
    .line 110
    .line 111
    move-result p2

    .line 112
    add-int/2addr p2, v0

    .line 113
    iget-object p3, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaMediaItemView;->e:Lcom/p1/mobile/putong/feed/newui/mediapicker/MarkView;

    .line 114
    .line 115
    invoke-virtual {p3, p2}, Lcom/p1/mobile/putong/feed/newui/mediapicker/MarkView;->setSelectPosition(I)V

    .line 116
    .line 117
    .line 118
    goto :goto_1

    .line 119
    :cond_3
    invoke-virtual {p3, v3}, Lcom/p1/mobile/putong/feed/newui/mediapicker/MarkView;->setChecked(Z)V

    .line 120
    .line 121
    .line 122
    :goto_1
    instance-of p2, p1, Lcom/p1/mobile/putong/data/Video;

    .line 123
    .line 124
    if-eqz p2, :cond_7

    .line 125
    .line 126
    move-object p2, p1

    .line 127
    check-cast p2, Lcom/p1/mobile/putong/data/Video;

    .line 128
    .line 129
    iget p3, p2, Lcom/p1/mobile/putong/data/Video;->duration:F

    .line 130
    .line 131
    const/4 p4, 0x0

    .line 132
    cmpl-float p3, p3, p4

    .line 133
    .line 134
    if-nez p3, :cond_5

    .line 135
    .line 136
    new-instance p3, Landroid/media/MediaMetadataRetriever;

    .line 137
    .line 138
    invoke-direct {p3}, Landroid/media/MediaMetadataRetriever;-><init>()V

    .line 139
    .line 140
    .line 141
    :try_start_0
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 142
    .line 143
    invoke-static {v0}, Ll/oki;->z(Ljava/lang/String;)Ljava/lang/String;

    .line 144
    .line 145
    .line 146
    move-result-object v0

    .line 147
    invoke-virtual {p3, v0}, Landroid/media/MediaMetadataRetriever;->setDataSource(Ljava/lang/String;)V

    .line 148
    .line 149
    .line 150
    const/16 v0, 0x9

    .line 151
    .line 152
    invoke-virtual {p3, v0}, Landroid/media/MediaMetadataRetriever;->extractMetadata(I)Ljava/lang/String;

    .line 153
    .line 154
    .line 155
    move-result-object v0

    .line 156
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 157
    .line 158
    .line 159
    move-result v1

    .line 160
    if-nez v1, :cond_4

    .line 161
    .line 162
    move-object v1, p1

    .line 163
    check-cast v1, Lcom/p1/mobile/putong/data/Video;

    .line 164
    .line 165
    invoke-static {v0}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    .line 166
    .line 167
    .line 168
    move-result-wide v4

    .line 169
    long-to-float v0, v4

    .line 170
    iput v0, v1, Lcom/p1/mobile/putong/data/Video;->duration:F
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 171
    .line 172
    goto :goto_2

    .line 173
    :catchall_0
    move-exception p0

    .line 174
    goto :goto_4

    .line 175
    :catch_0
    move-exception v0

    .line 176
    goto :goto_3

    .line 177
    :cond_4
    :goto_2
    :try_start_1
    invoke-virtual {p3}, Landroid/media/MediaMetadataRetriever;->release()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_2

    .line 178
    .line 179
    .line 180
    goto :goto_5

    .line 181
    :goto_3
    :try_start_2
    invoke-static {v0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 182
    .line 183
    .line 184
    check-cast p1, Lcom/p1/mobile/putong/data/Video;

    .line 185
    .line 186
    const/high16 v0, -0x40800000    # -1.0f

    .line 187
    .line 188
    iput v0, p1, Lcom/p1/mobile/putong/data/Video;->duration:F
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 189
    .line 190
    goto :goto_2

    .line 191
    :goto_4
    :try_start_3
    invoke-virtual {p3}, Landroid/media/MediaMetadataRetriever;->release()V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_1

    .line 192
    .line 193
    .line 194
    :catch_1
    throw p0

    .line 195
    :catch_2
    :cond_5
    :goto_5
    iget p1, p2, Lcom/p1/mobile/putong/data/Video;->duration:F

    .line 196
    .line 197
    cmpl-float p2, p1, p4

    .line 198
    .line 199
    iget-object p3, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaMediaItemView;->c:Lv/VText;

    .line 200
    .line 201
    if-ltz p2, :cond_6

    .line 202
    .line 203
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaMediaItemView;->b(F)Ljava/lang/String;

    .line 204
    .line 205
    .line 206
    move-result-object p1

    .line 207
    invoke-virtual {p3, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 208
    .line 209
    .line 210
    goto :goto_6

    .line 211
    :cond_6
    sget p1, Lcom/p1/mobile/putong/feed/R$string;->p5:I

    .line 212
    .line 213
    invoke-virtual {p3, p1}, Landroid/widget/TextView;->setText(I)V

    .line 214
    .line 215
    .line 216
    :goto_6
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaMediaItemView;->c:Lv/VText;

    .line 217
    .line 218
    invoke-virtual {p0, v3}, Landroid/view/View;->setVisibility(I)V

    .line 219
    .line 220
    .line 221
    return-void

    .line 222
    :cond_7
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaMediaItemView;->c:Lv/VText;

    .line 223
    .line 224
    invoke-virtual {p0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 225
    .line 226
    .line 227
    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaMediaItemView;->h:Lcom/p1/mobile/putong/ui/mediapicker/MediaPickerBaseAct$a;

    .line 2
    .line 3
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaMediaItemView;->f:Lcom/p1/mobile/putong/data/Media;

    .line 4
    .line 5
    iget p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaMediaItemView;->g:I

    .line 6
    .line 7
    invoke-interface {p1, v0, p0}, Lcom/p1/mobile/putong/ui/mediapicker/MediaPickerBaseAct$a;->y(Lcom/p1/mobile/putong/data/Media;I)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaMediaItemView;->a(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public onMeasure(II)V
    .locals 0

    .line 1
    invoke-static {p1, p2}, Ll/psh0;->a(II)I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    invoke-super {p0, p1, p1}, Landroid/widget/FrameLayout;->onMeasure(II)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

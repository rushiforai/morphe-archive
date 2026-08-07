.class Lcom/tencent/rtmp/ui/TXCloudVideoView$2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/ScaleGestureDetector$OnScaleGestureListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/tencent/rtmp/ui/TXCloudVideoView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/tencent/rtmp/ui/TXCloudVideoView;


# direct methods
.method public constructor <init>(Lcom/tencent/rtmp/ui/TXCloudVideoView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/rtmp/ui/TXCloudVideoView$2;->a:Lcom/tencent/rtmp/ui/TXCloudVideoView;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onScale(Landroid/view/ScaleGestureDetector;)Z
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/tencent/rtmp/ui/TXCloudVideoView$2;->a:Lcom/tencent/rtmp/ui/TXCloudVideoView;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tencent/rtmp/ui/TXCloudVideoView;->access$400(Lcom/tencent/rtmp/ui/TXCloudVideoView;)Lcom/tencent/liteav/k;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const/4 v1, 0x0

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    iget-object v0, p0, Lcom/tencent/rtmp/ui/TXCloudVideoView$2;->a:Lcom/tencent/rtmp/ui/TXCloudVideoView;

    .line 11
    .line 12
    invoke-static {v0}, Lcom/tencent/rtmp/ui/TXCloudVideoView;->access$400(Lcom/tencent/rtmp/ui/TXCloudVideoView;)Lcom/tencent/liteav/k;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-interface {v0}, Lcom/tencent/liteav/k;->e()I

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    goto :goto_0

    .line 21
    :cond_0
    move v0, v1

    .line 22
    :goto_0
    if-lez v0, :cond_9

    .line 23
    .line 24
    invoke-virtual {p1}, Landroid/view/ScaleGestureDetector;->getScaleFactor()F

    .line 25
    .line 26
    .line 27
    move-result p1

    .line 28
    const/high16 v2, 0x3f800000    # 1.0f

    .line 29
    .line 30
    cmpl-float v3, p1, v2

    .line 31
    .line 32
    const v4, 0x3e4ccccd    # 0.2f

    .line 33
    .line 34
    .line 35
    if-lez v3, :cond_1

    .line 36
    .line 37
    int-to-float p1, v0

    .line 38
    div-float/2addr v4, p1

    .line 39
    iget-object p1, p0, Lcom/tencent/rtmp/ui/TXCloudVideoView$2;->a:Lcom/tencent/rtmp/ui/TXCloudVideoView;

    .line 40
    .line 41
    invoke-static {p1}, Lcom/tencent/rtmp/ui/TXCloudVideoView;->access$500(Lcom/tencent/rtmp/ui/TXCloudVideoView;)I

    .line 42
    .line 43
    .line 44
    move-result p1

    .line 45
    sub-int p1, v0, p1

    .line 46
    .line 47
    int-to-float p1, p1

    .line 48
    mul-float/2addr v4, p1

    .line 49
    add-float p1, v4, v2

    .line 50
    .line 51
    const v3, 0x3f8ccccd    # 1.1f

    .line 52
    .line 53
    .line 54
    cmpg-float v4, p1, v3

    .line 55
    .line 56
    if-gtz v4, :cond_2

    .line 57
    .line 58
    :goto_1
    move p1, v3

    .line 59
    goto :goto_2

    .line 60
    :cond_1
    cmpg-float v3, p1, v2

    .line 61
    .line 62
    if-gez v3, :cond_2

    .line 63
    .line 64
    int-to-float p1, v0

    .line 65
    div-float/2addr v4, p1

    .line 66
    iget-object p1, p0, Lcom/tencent/rtmp/ui/TXCloudVideoView$2;->a:Lcom/tencent/rtmp/ui/TXCloudVideoView;

    .line 67
    .line 68
    invoke-static {p1}, Lcom/tencent/rtmp/ui/TXCloudVideoView;->access$500(Lcom/tencent/rtmp/ui/TXCloudVideoView;)I

    .line 69
    .line 70
    .line 71
    move-result p1

    .line 72
    int-to-float p1, p1

    .line 73
    mul-float/2addr v4, p1

    .line 74
    sub-float p1, v2, v4

    .line 75
    .line 76
    const v3, 0x3f666666    # 0.9f

    .line 77
    .line 78
    .line 79
    cmpl-float v4, p1, v3

    .line 80
    .line 81
    if-ltz v4, :cond_2

    .line 82
    .line 83
    goto :goto_1

    .line 84
    :cond_2
    :goto_2
    iget-object v3, p0, Lcom/tencent/rtmp/ui/TXCloudVideoView$2;->a:Lcom/tencent/rtmp/ui/TXCloudVideoView;

    .line 85
    .line 86
    invoke-static {v3}, Lcom/tencent/rtmp/ui/TXCloudVideoView;->access$500(Lcom/tencent/rtmp/ui/TXCloudVideoView;)I

    .line 87
    .line 88
    .line 89
    move-result v3

    .line 90
    int-to-float v3, v3

    .line 91
    mul-float/2addr v3, p1

    .line 92
    invoke-static {v3}, Ljava/lang/Math;->round(F)I

    .line 93
    .line 94
    .line 95
    move-result v3

    .line 96
    iget-object v4, p0, Lcom/tencent/rtmp/ui/TXCloudVideoView$2;->a:Lcom/tencent/rtmp/ui/TXCloudVideoView;

    .line 97
    .line 98
    invoke-static {v4}, Lcom/tencent/rtmp/ui/TXCloudVideoView;->access$500(Lcom/tencent/rtmp/ui/TXCloudVideoView;)I

    .line 99
    .line 100
    .line 101
    move-result v4

    .line 102
    if-ne v3, v4, :cond_4

    .line 103
    .line 104
    cmpl-float v4, p1, v2

    .line 105
    .line 106
    if-lez v4, :cond_3

    .line 107
    .line 108
    add-int/lit8 v3, v3, 0x1

    .line 109
    .line 110
    goto :goto_3

    .line 111
    :cond_3
    cmpg-float v4, p1, v2

    .line 112
    .line 113
    if-gez v4, :cond_4

    .line 114
    .line 115
    add-int/lit8 v3, v3, -0x1

    .line 116
    .line 117
    :cond_4
    :goto_3
    if-lt v3, v0, :cond_5

    .line 118
    .line 119
    goto :goto_4

    .line 120
    :cond_5
    move v0, v3

    .line 121
    :goto_4
    const/4 v3, 0x1

    .line 122
    if-gt v0, v3, :cond_6

    .line 123
    .line 124
    move v0, v3

    .line 125
    :cond_6
    cmpl-float v3, p1, v2

    .line 126
    .line 127
    if-lez v3, :cond_7

    .line 128
    .line 129
    iget-object p1, p0, Lcom/tencent/rtmp/ui/TXCloudVideoView$2;->a:Lcom/tencent/rtmp/ui/TXCloudVideoView;

    .line 130
    .line 131
    invoke-static {p1}, Lcom/tencent/rtmp/ui/TXCloudVideoView;->access$500(Lcom/tencent/rtmp/ui/TXCloudVideoView;)I

    .line 132
    .line 133
    .line 134
    move-result p1

    .line 135
    if-ge v0, p1, :cond_8

    .line 136
    .line 137
    iget-object p1, p0, Lcom/tencent/rtmp/ui/TXCloudVideoView$2;->a:Lcom/tencent/rtmp/ui/TXCloudVideoView;

    .line 138
    .line 139
    invoke-static {p1}, Lcom/tencent/rtmp/ui/TXCloudVideoView;->access$500(Lcom/tencent/rtmp/ui/TXCloudVideoView;)I

    .line 140
    .line 141
    .line 142
    move-result v0

    .line 143
    goto :goto_5

    .line 144
    :cond_7
    cmpg-float p1, p1, v2

    .line 145
    .line 146
    if-gez p1, :cond_8

    .line 147
    .line 148
    iget-object p1, p0, Lcom/tencent/rtmp/ui/TXCloudVideoView$2;->a:Lcom/tencent/rtmp/ui/TXCloudVideoView;

    .line 149
    .line 150
    invoke-static {p1}, Lcom/tencent/rtmp/ui/TXCloudVideoView;->access$500(Lcom/tencent/rtmp/ui/TXCloudVideoView;)I

    .line 151
    .line 152
    .line 153
    move-result p1

    .line 154
    if-le v0, p1, :cond_8

    .line 155
    .line 156
    iget-object p1, p0, Lcom/tencent/rtmp/ui/TXCloudVideoView$2;->a:Lcom/tencent/rtmp/ui/TXCloudVideoView;

    .line 157
    .line 158
    invoke-static {p1}, Lcom/tencent/rtmp/ui/TXCloudVideoView;->access$500(Lcom/tencent/rtmp/ui/TXCloudVideoView;)I

    .line 159
    .line 160
    .line 161
    move-result v0

    .line 162
    :cond_8
    :goto_5
    iget-object p1, p0, Lcom/tencent/rtmp/ui/TXCloudVideoView$2;->a:Lcom/tencent/rtmp/ui/TXCloudVideoView;

    .line 163
    .line 164
    invoke-static {p1, v0}, Lcom/tencent/rtmp/ui/TXCloudVideoView;->access$502(Lcom/tencent/rtmp/ui/TXCloudVideoView;I)I

    .line 165
    .line 166
    .line 167
    iget-object p1, p0, Lcom/tencent/rtmp/ui/TXCloudVideoView$2;->a:Lcom/tencent/rtmp/ui/TXCloudVideoView;

    .line 168
    .line 169
    invoke-static {p1}, Lcom/tencent/rtmp/ui/TXCloudVideoView;->access$400(Lcom/tencent/rtmp/ui/TXCloudVideoView;)Lcom/tencent/liteav/k;

    .line 170
    .line 171
    .line 172
    move-result-object p1

    .line 173
    if-eqz p1, :cond_9

    .line 174
    .line 175
    iget-object p1, p0, Lcom/tencent/rtmp/ui/TXCloudVideoView$2;->a:Lcom/tencent/rtmp/ui/TXCloudVideoView;

    .line 176
    .line 177
    invoke-static {p1}, Lcom/tencent/rtmp/ui/TXCloudVideoView;->access$400(Lcom/tencent/rtmp/ui/TXCloudVideoView;)Lcom/tencent/liteav/k;

    .line 178
    .line 179
    .line 180
    move-result-object p1

    .line 181
    iget-object p0, p0, Lcom/tencent/rtmp/ui/TXCloudVideoView$2;->a:Lcom/tencent/rtmp/ui/TXCloudVideoView;

    .line 182
    .line 183
    invoke-static {p0}, Lcom/tencent/rtmp/ui/TXCloudVideoView;->access$500(Lcom/tencent/rtmp/ui/TXCloudVideoView;)I

    .line 184
    .line 185
    .line 186
    move-result p0

    .line 187
    invoke-interface {p1, p0}, Lcom/tencent/liteav/k;->a(I)Z

    .line 188
    .line 189
    .line 190
    :cond_9
    return v1
.end method

.method public onScaleBegin(Landroid/view/ScaleGestureDetector;)Z
    .locals 0

    const/4 p0, 0x1

    return p0
.end method

.method public onScaleEnd(Landroid/view/ScaleGestureDetector;)V
    .locals 0

    return-void
.end method

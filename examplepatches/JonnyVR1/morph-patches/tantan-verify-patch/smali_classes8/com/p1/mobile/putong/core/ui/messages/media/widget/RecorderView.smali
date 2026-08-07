.class public Lcom/p1/mobile/putong/core/ui/messages/media/widget/RecorderView;
.super Landroid/widget/ImageView;
.source "SourceFile"


# annotations
.annotation build Landroid/annotation/SuppressLint;
    value = {
        "AppCompatCustomView"
    }
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/core/ui/messages/media/widget/RecorderView$StatusInfo;
    }
.end annotation


# instance fields
.field public a:Ll/xqc0;

.field public b:Lcom/p1/mobile/putong/core/ui/messages/media/widget/RecorderView$StatusInfo;

.field public c:J

.field public d:J

.field public e:J

.field public f:Ljava/lang/Runnable;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 2

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const-wide/16 v0, 0x0

    .line 5
    .line 6
    iput-wide v0, p0, Lcom/p1/mobile/putong/core/ui/messages/media/widget/RecorderView;->c:J

    .line 7
    .line 8
    iput-wide v0, p0, Lcom/p1/mobile/putong/core/ui/messages/media/widget/RecorderView;->d:J

    .line 9
    .line 10
    new-instance p1, Lcom/p1/mobile/putong/core/ui/messages/media/widget/RecorderView$a;

    .line 11
    .line 12
    invoke-direct {p1, p0}, Lcom/p1/mobile/putong/core/ui/messages/media/widget/RecorderView$a;-><init>(Lcom/p1/mobile/putong/core/ui/messages/media/widget/RecorderView;)V

    .line 13
    .line 14
    .line 15
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/media/widget/RecorderView;->f:Ljava/lang/Runnable;

    .line 16
    .line 17
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 18
    invoke-direct {p0, p1, p2}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const-wide/16 p1, 0x0

    .line 19
    iput-wide p1, p0, Lcom/p1/mobile/putong/core/ui/messages/media/widget/RecorderView;->c:J

    .line 20
    iput-wide p1, p0, Lcom/p1/mobile/putong/core/ui/messages/media/widget/RecorderView;->d:J

    .line 21
    new-instance p1, Lcom/p1/mobile/putong/core/ui/messages/media/widget/RecorderView$a;

    invoke-direct {p1, p0}, Lcom/p1/mobile/putong/core/ui/messages/media/widget/RecorderView$a;-><init>(Lcom/p1/mobile/putong/core/ui/messages/media/widget/RecorderView;)V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/media/widget/RecorderView;->f:Ljava/lang/Runnable;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 22
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const-wide/16 p1, 0x0

    .line 23
    iput-wide p1, p0, Lcom/p1/mobile/putong/core/ui/messages/media/widget/RecorderView;->c:J

    .line 24
    iput-wide p1, p0, Lcom/p1/mobile/putong/core/ui/messages/media/widget/RecorderView;->d:J

    .line 25
    new-instance p1, Lcom/p1/mobile/putong/core/ui/messages/media/widget/RecorderView$a;

    invoke-direct {p1, p0}, Lcom/p1/mobile/putong/core/ui/messages/media/widget/RecorderView$a;-><init>(Lcom/p1/mobile/putong/core/ui/messages/media/widget/RecorderView;)V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/media/widget/RecorderView;->f:Ljava/lang/Runnable;

    return-void
.end method

.method public static bridge synthetic a(Lcom/p1/mobile/putong/core/ui/messages/media/widget/RecorderView;)Ll/xqc0;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/media/widget/RecorderView;->a:Ll/xqc0;

    return-object p0
.end method


# virtual methods
.method public b(Landroid/view/View;)Landroid/graphics/RectF;
    .locals 6

    .line 1
    const/4 p0, 0x2

    .line 2
    new-array p0, p0, [I

    .line 3
    .line 4
    invoke-virtual {p1, p0}, Landroid/view/View;->getLocationOnScreen([I)V

    .line 5
    .line 6
    .line 7
    new-instance v0, Landroid/graphics/RectF;

    .line 8
    .line 9
    const/4 v1, 0x0

    .line 10
    aget v1, p0, v1

    .line 11
    .line 12
    int-to-float v2, v1

    .line 13
    const/4 v3, 0x1

    .line 14
    aget v4, p0, v3

    .line 15
    .line 16
    int-to-float v4, v4

    .line 17
    invoke-virtual {p1}, Landroid/view/View;->getWidth()I

    .line 18
    .line 19
    .line 20
    move-result v5

    .line 21
    add-int/2addr v1, v5

    .line 22
    int-to-float v1, v1

    .line 23
    aget p0, p0, v3

    .line 24
    .line 25
    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    .line 26
    .line 27
    .line 28
    move-result p1

    .line 29
    add-int/2addr p0, p1

    .line 30
    int-to-float p0, p0

    .line 31
    invoke-direct {v0, v2, v4, v1, p0}, Landroid/graphics/RectF;-><init>(FFFF)V

    .line 32
    .line 33
    .line 34
    return-object v0
.end method

.method public final c(Landroid/view/MotionEvent;)Z
    .locals 4

    .line 1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x1

    .line 6
    if-eqz v0, :cond_2

    .line 7
    .line 8
    if-eq v0, v1, :cond_0

    .line 9
    .line 10
    goto :goto_0

    .line 11
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/media/widget/RecorderView;->a:Ll/xqc0;

    .line 12
    .line 13
    if-eqz v0, :cond_1

    .line 14
    .line 15
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/media/widget/RecorderView;->b:Lcom/p1/mobile/putong/core/ui/messages/media/widget/RecorderView$StatusInfo;

    .line 16
    .line 17
    if-eqz v0, :cond_1

    .line 18
    .line 19
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawX()F

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    float-to-int v0, v0

    .line 24
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawY()F

    .line 25
    .line 26
    .line 27
    move-result v1

    .line 28
    float-to-int v1, v1

    .line 29
    invoke-virtual {p0, p0, v0, v1}, Lcom/p1/mobile/putong/core/ui/messages/media/widget/RecorderView;->d(Landroid/view/View;II)Z

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    if-eqz v0, :cond_1

    .line 34
    .line 35
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 36
    .line 37
    .line 38
    move-result-wide v0

    .line 39
    iget-wide v2, p0, Lcom/p1/mobile/putong/core/ui/messages/media/widget/RecorderView;->c:J

    .line 40
    .line 41
    sub-long/2addr v0, v2

    .line 42
    const-wide/16 v2, 0x12c

    .line 43
    .line 44
    cmp-long v0, v0, v2

    .line 45
    .line 46
    if-gez v0, :cond_1

    .line 47
    .line 48
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/media/widget/RecorderView;->a:Ll/xqc0;

    .line 49
    .line 50
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/media/widget/RecorderView;->b:Lcom/p1/mobile/putong/core/ui/messages/media/widget/RecorderView$StatusInfo;

    .line 51
    .line 52
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/messages/media/widget/RecorderView$StatusInfo;->getPath()Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object v1

    .line 56
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/media/widget/RecorderView;->b:Lcom/p1/mobile/putong/core/ui/messages/media/widget/RecorderView$StatusInfo;

    .line 57
    .line 58
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/ui/messages/media/widget/RecorderView$StatusInfo;->isPhoto()Z

    .line 59
    .line 60
    .line 61
    move-result v2

    .line 62
    invoke-interface {v0, v1, v2}, Ll/xqc0;->b(Ljava/lang/String;Z)V

    .line 63
    .line 64
    .line 65
    :cond_1
    :goto_0
    invoke-super {p0, p1}, Landroid/view/View;->onTouchEvent(Landroid/view/MotionEvent;)Z

    .line 66
    .line 67
    .line 68
    move-result p0

    .line 69
    return p0

    .line 70
    :cond_2
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 71
    .line 72
    .line 73
    move-result-wide v2

    .line 74
    iput-wide v2, p0, Lcom/p1/mobile/putong/core/ui/messages/media/widget/RecorderView;->c:J

    .line 75
    .line 76
    return v1
.end method

.method public d(Landroid/view/View;II)Z
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/media/widget/RecorderView;->b(Landroid/view/View;)Landroid/graphics/RectF;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget p0, p0, Landroid/graphics/RectF;->top:F

    .line 6
    .line 7
    int-to-float p1, p3

    .line 8
    cmpg-float p0, p0, p1

    .line 9
    .line 10
    if-gez p0, :cond_0

    .line 11
    .line 12
    const/4 p0, 0x1

    .line 13
    return p0

    .line 14
    :cond_0
    const/4 p0, 0x0

    .line 15
    return p0
.end method

.method public getStatusInfo()Lcom/p1/mobile/putong/core/ui/messages/media/widget/RecorderView$StatusInfo;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/media/widget/RecorderView;->b:Lcom/p1/mobile/putong/core/ui/messages/media/widget/RecorderView$StatusInfo;

    .line 2
    .line 3
    return-object p0
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 7

    .line 1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const-wide/16 v1, 0x12c

    .line 6
    .line 7
    if-nez v0, :cond_1

    .line 8
    .line 9
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 10
    .line 11
    .line 12
    move-result-wide v3

    .line 13
    iget-wide v5, p0, Lcom/p1/mobile/putong/core/ui/messages/media/widget/RecorderView;->d:J

    .line 14
    .line 15
    sub-long/2addr v3, v5

    .line 16
    cmp-long v0, v3, v1

    .line 17
    .line 18
    if-gez v0, :cond_0

    .line 19
    .line 20
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 21
    .line 22
    .line 23
    move-result-wide v0

    .line 24
    iput-wide v0, p0, Lcom/p1/mobile/putong/core/ui/messages/media/widget/RecorderView;->d:J

    .line 25
    .line 26
    const/4 p0, 0x0

    .line 27
    return p0

    .line 28
    :cond_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 29
    .line 30
    .line 31
    move-result-wide v3

    .line 32
    iput-wide v3, p0, Lcom/p1/mobile/putong/core/ui/messages/media/widget/RecorderView;->d:J

    .line 33
    .line 34
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/media/widget/RecorderView;->b:Lcom/p1/mobile/putong/core/ui/messages/media/widget/RecorderView$StatusInfo;

    .line 35
    .line 36
    if-eqz v0, :cond_2

    .line 37
    .line 38
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/media/widget/RecorderView;->c(Landroid/view/MotionEvent;)Z

    .line 39
    .line 40
    .line 41
    move-result p0

    .line 42
    return p0

    .line 43
    :cond_2
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    const/4 v3, 0x1

    .line 48
    if-nez v0, :cond_5

    .line 49
    .line 50
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 51
    .line 52
    .line 53
    move-result-wide v4

    .line 54
    iput-wide v4, p0, Lcom/p1/mobile/putong/core/ui/messages/media/widget/RecorderView;->e:J

    .line 55
    .line 56
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/media/widget/RecorderView;->a:Ll/xqc0;

    .line 57
    .line 58
    if-eqz v0, :cond_4

    .line 59
    .line 60
    invoke-interface {v0}, Ll/xqc0;->c()Z

    .line 61
    .line 62
    .line 63
    move-result v0

    .line 64
    if-eqz v0, :cond_3

    .line 65
    .line 66
    invoke-super {p0, p1}, Landroid/view/View;->onTouchEvent(Landroid/view/MotionEvent;)Z

    .line 67
    .line 68
    .line 69
    move-result p0

    .line 70
    return p0

    .line 71
    :cond_3
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/media/widget/RecorderView;->f:Ljava/lang/Runnable;

    .line 72
    .line 73
    invoke-virtual {p0, p1, v1, v2}, Landroid/view/View;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 74
    .line 75
    .line 76
    :cond_4
    return v3

    .line 77
    :cond_5
    const/4 v4, 0x2

    .line 78
    if-ne v0, v4, :cond_7

    .line 79
    .line 80
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawX()F

    .line 81
    .line 82
    .line 83
    move-result v0

    .line 84
    float-to-int v0, v0

    .line 85
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawY()F

    .line 86
    .line 87
    .line 88
    move-result v1

    .line 89
    float-to-int v1, v1

    .line 90
    invoke-virtual {p0, p0, v0, v1}, Lcom/p1/mobile/putong/core/ui/messages/media/widget/RecorderView;->d(Landroid/view/View;II)Z

    .line 91
    .line 92
    .line 93
    move-result v0

    .line 94
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/media/widget/RecorderView;->a:Ll/xqc0;

    .line 95
    .line 96
    if-nez v0, :cond_6

    .line 97
    .line 98
    if-eqz v1, :cond_c

    .line 99
    .line 100
    invoke-interface {v1}, Ll/xqc0;->e()V

    .line 101
    .line 102
    .line 103
    goto :goto_1

    .line 104
    :cond_6
    if-eqz v1, :cond_c

    .line 105
    .line 106
    invoke-interface {v1}, Ll/xqc0;->f()V

    .line 107
    .line 108
    .line 109
    goto :goto_1

    .line 110
    :cond_7
    if-eq v0, v3, :cond_8

    .line 111
    .line 112
    const/4 v3, 0x3

    .line 113
    if-ne v0, v3, :cond_c

    .line 114
    .line 115
    :cond_8
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 116
    .line 117
    .line 118
    move-result-wide v3

    .line 119
    iget-wide v5, p0, Lcom/p1/mobile/putong/core/ui/messages/media/widget/RecorderView;->e:J

    .line 120
    .line 121
    sub-long/2addr v3, v5

    .line 122
    cmp-long v0, v3, v1

    .line 123
    .line 124
    if-gtz v0, :cond_9

    .line 125
    .line 126
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/media/widget/RecorderView;->a:Ll/xqc0;

    .line 127
    .line 128
    if-eqz v0, :cond_b

    .line 129
    .line 130
    invoke-interface {v0}, Ll/xqc0;->g()V

    .line 131
    .line 132
    .line 133
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/media/widget/RecorderView;->f:Ljava/lang/Runnable;

    .line 134
    .line 135
    invoke-virtual {p0, v0}, Landroid/view/View;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 136
    .line 137
    .line 138
    goto :goto_0

    .line 139
    :cond_9
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawX()F

    .line 140
    .line 141
    .line 142
    move-result v0

    .line 143
    float-to-int v0, v0

    .line 144
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawY()F

    .line 145
    .line 146
    .line 147
    move-result v1

    .line 148
    float-to-int v1, v1

    .line 149
    invoke-virtual {p0, p0, v0, v1}, Lcom/p1/mobile/putong/core/ui/messages/media/widget/RecorderView;->d(Landroid/view/View;II)Z

    .line 150
    .line 151
    .line 152
    move-result v0

    .line 153
    if-eqz v0, :cond_a

    .line 154
    .line 155
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/media/widget/RecorderView;->a:Ll/xqc0;

    .line 156
    .line 157
    if-eqz v0, :cond_b

    .line 158
    .line 159
    invoke-interface {v0}, Ll/xqc0;->d()V

    .line 160
    .line 161
    .line 162
    goto :goto_0

    .line 163
    :cond_a
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawX()F

    .line 164
    .line 165
    .line 166
    move-result v0

    .line 167
    float-to-int v0, v0

    .line 168
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawY()F

    .line 169
    .line 170
    .line 171
    move-result v1

    .line 172
    float-to-int v1, v1

    .line 173
    invoke-virtual {p0, p0, v0, v1}, Lcom/p1/mobile/putong/core/ui/messages/media/widget/RecorderView;->d(Landroid/view/View;II)Z

    .line 174
    .line 175
    .line 176
    move-result v0

    .line 177
    if-nez v0, :cond_b

    .line 178
    .line 179
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/media/widget/RecorderView;->a:Ll/xqc0;

    .line 180
    .line 181
    if-eqz v0, :cond_b

    .line 182
    .line 183
    invoke-interface {v0}, Ll/xqc0;->onCancel()V

    .line 184
    .line 185
    .line 186
    :cond_b
    :goto_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/media/widget/RecorderView;->a:Ll/xqc0;

    .line 187
    .line 188
    if-eqz v0, :cond_c

    .line 189
    .line 190
    invoke-interface {v0}, Ll/xqc0;->a()V

    .line 191
    .line 192
    .line 193
    :cond_c
    :goto_1
    invoke-super {p0, p1}, Landroid/view/View;->onTouchEvent(Landroid/view/MotionEvent;)Z

    .line 194
    .line 195
    .line 196
    move-result p0

    .line 197
    return p0
.end method

.method public setRecorderCallback(Ll/xqc0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/media/widget/RecorderView;->a:Ll/xqc0;

    .line 2
    .line 3
    return-void
.end method

.method public setStatusInfo(Lcom/p1/mobile/putong/core/ui/messages/media/widget/RecorderView$StatusInfo;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/media/widget/RecorderView;->b:Lcom/p1/mobile/putong/core/ui/messages/media/widget/RecorderView$StatusInfo;

    .line 2
    .line 3
    return-void
.end method

.class public Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView$a;
.super Landroid/view/GestureDetector$SimpleOnGestureListener;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;->m()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView$a;->a:Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;

    .line 2
    .line 3
    invoke-direct {p0}, Landroid/view/GestureDetector$SimpleOnGestureListener;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onDown(Landroid/view/MotionEvent;)Z
    .locals 4

    .line 1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView$a;->a:Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;

    .line 6
    .line 7
    invoke-static {v0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;->a(Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;)I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    add-int/lit8 v0, v0, -0x14

    .line 12
    .line 13
    int-to-float v0, v0

    .line 14
    cmpl-float v0, p1, v0

    .line 15
    .line 16
    const/4 v1, 0x1

    .line 17
    const/4 v2, 0x0

    .line 18
    if-lez v0, :cond_0

    .line 19
    .line 20
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView$a;->a:Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;

    .line 21
    .line 22
    invoke-static {v0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;->a(Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;)I

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView$a;->a:Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;

    .line 27
    .line 28
    invoke-static {v3}, Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;->d(Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;)I

    .line 29
    .line 30
    .line 31
    move-result v3

    .line 32
    add-int/2addr v0, v3

    .line 33
    add-int/lit8 v0, v0, 0x14

    .line 34
    .line 35
    int-to-float v0, v0

    .line 36
    cmpg-float v0, p1, v0

    .line 37
    .line 38
    if-gez v0, :cond_0

    .line 39
    .line 40
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView$a;->a:Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;

    .line 41
    .line 42
    iput-boolean v2, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;->s:Z

    .line 43
    .line 44
    invoke-static {p0, v1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;->k(Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;Z)V

    .line 45
    .line 46
    .line 47
    return v1

    .line 48
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView$a;->a:Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;

    .line 49
    .line 50
    invoke-static {v0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;->b(Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;)I

    .line 51
    .line 52
    .line 53
    move-result v0

    .line 54
    add-int/lit8 v0, v0, 0x14

    .line 55
    .line 56
    int-to-float v0, v0

    .line 57
    cmpg-float v0, p1, v0

    .line 58
    .line 59
    if-gez v0, :cond_1

    .line 60
    .line 61
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView$a;->a:Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;

    .line 62
    .line 63
    invoke-static {v0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;->b(Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;)I

    .line 64
    .line 65
    .line 66
    move-result v0

    .line 67
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView$a;->a:Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;

    .line 68
    .line 69
    invoke-static {v3}, Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;->d(Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;)I

    .line 70
    .line 71
    .line 72
    move-result v3

    .line 73
    sub-int/2addr v0, v3

    .line 74
    add-int/lit8 v0, v0, -0x14

    .line 75
    .line 76
    int-to-float v0, v0

    .line 77
    cmpl-float p1, p1, v0

    .line 78
    .line 79
    if-lez p1, :cond_1

    .line 80
    .line 81
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView$a;->a:Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;

    .line 82
    .line 83
    iput-boolean v2, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;->s:Z

    .line 84
    .line 85
    invoke-static {p0, v2}, Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;->k(Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;Z)V

    .line 86
    .line 87
    .line 88
    return v1

    .line 89
    :cond_1
    return v2
.end method

.method public onScroll(Landroid/view/MotionEvent;Landroid/view/MotionEvent;FF)Z
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView$a;->a:Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;->c(Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView$a;->a:Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;

    .line 8
    .line 9
    if-eqz p1, :cond_3

    .line 10
    .line 11
    invoke-static {p2}, Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;->a(Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;)I

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    float-to-int p3, p3

    .line 16
    sub-int/2addr p1, p3

    .line 17
    invoke-static {p2, p1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;->i(Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;I)V

    .line 18
    .line 19
    .line 20
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView$a;->a:Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;

    .line 21
    .line 22
    invoke-static {p1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;->a(Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;)I

    .line 23
    .line 24
    .line 25
    move-result p1

    .line 26
    if-gez p1, :cond_0

    .line 27
    .line 28
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView$a;->a:Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;

    .line 29
    .line 30
    const/4 p2, 0x0

    .line 31
    invoke-static {p1, p2}, Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;->i(Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;I)V

    .line 32
    .line 33
    .line 34
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView$a;->a:Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;

    .line 35
    .line 36
    invoke-static {p1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;->a(Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;)I

    .line 37
    .line 38
    .line 39
    move-result p1

    .line 40
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView$a;->a:Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;

    .line 41
    .line 42
    invoke-static {p2}, Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;->b(Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;)I

    .line 43
    .line 44
    .line 45
    move-result p2

    .line 46
    iget-object p3, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView$a;->a:Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;

    .line 47
    .line 48
    invoke-static {p3}, Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;->e(Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;)I

    .line 49
    .line 50
    .line 51
    move-result p3

    .line 52
    sub-int/2addr p2, p3

    .line 53
    iget-object p3, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView$a;->a:Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;

    .line 54
    .line 55
    if-ge p1, p2, :cond_1

    .line 56
    .line 57
    invoke-static {p3}, Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;->b(Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;)I

    .line 58
    .line 59
    .line 60
    move-result p1

    .line 61
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView$a;->a:Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;

    .line 62
    .line 63
    invoke-static {p2}, Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;->e(Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;)I

    .line 64
    .line 65
    .line 66
    move-result p2

    .line 67
    sub-int/2addr p1, p2

    .line 68
    invoke-static {p3, p1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;->i(Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;I)V

    .line 69
    .line 70
    .line 71
    goto/16 :goto_0

    .line 72
    .line 73
    :cond_1
    invoke-static {p3}, Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;->a(Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;)I

    .line 74
    .line 75
    .line 76
    move-result p1

    .line 77
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView$a;->a:Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;

    .line 78
    .line 79
    invoke-static {p2}, Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;->b(Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;)I

    .line 80
    .line 81
    .line 82
    move-result p2

    .line 83
    iget-object p3, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView$a;->a:Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;

    .line 84
    .line 85
    invoke-static {p3}, Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;->h(Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;)I

    .line 86
    .line 87
    .line 88
    move-result p3

    .line 89
    sub-int/2addr p2, p3

    .line 90
    iget-object p3, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView$a;->a:Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;

    .line 91
    .line 92
    if-ge p1, p2, :cond_2

    .line 93
    .line 94
    invoke-static {p3}, Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;->b(Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;)I

    .line 95
    .line 96
    .line 97
    move-result p1

    .line 98
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView$a;->a:Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;

    .line 99
    .line 100
    invoke-static {p2}, Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;->h(Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;)I

    .line 101
    .line 102
    .line 103
    move-result p2

    .line 104
    sub-int/2addr p1, p2

    .line 105
    invoke-static {p3, p1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;->i(Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;I)V

    .line 106
    .line 107
    .line 108
    goto/16 :goto_0

    .line 109
    .line 110
    :cond_2
    invoke-static {p3}, Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;->a(Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;)I

    .line 111
    .line 112
    .line 113
    move-result p1

    .line 114
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView$a;->a:Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;

    .line 115
    .line 116
    invoke-static {p2}, Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;->b(Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;)I

    .line 117
    .line 118
    .line 119
    move-result p2

    .line 120
    iget-object p3, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView$a;->a:Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;

    .line 121
    .line 122
    invoke-static {p3}, Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;->g(Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;)I

    .line 123
    .line 124
    .line 125
    move-result p3

    .line 126
    sub-int/2addr p2, p3

    .line 127
    if-le p1, p2, :cond_6

    .line 128
    .line 129
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView$a;->a:Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;

    .line 130
    .line 131
    invoke-static {p1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;->b(Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;)I

    .line 132
    .line 133
    .line 134
    move-result p2

    .line 135
    iget-object p3, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView$a;->a:Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;

    .line 136
    .line 137
    invoke-static {p3}, Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;->g(Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;)I

    .line 138
    .line 139
    .line 140
    move-result p3

    .line 141
    sub-int/2addr p2, p3

    .line 142
    invoke-static {p1, p2}, Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;->i(Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;I)V

    .line 143
    .line 144
    .line 145
    goto :goto_0

    .line 146
    :cond_3
    invoke-static {p2}, Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;->b(Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;)I

    .line 147
    .line 148
    .line 149
    move-result p1

    .line 150
    float-to-int p3, p3

    .line 151
    sub-int/2addr p1, p3

    .line 152
    invoke-static {p2, p1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;->j(Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;I)V

    .line 153
    .line 154
    .line 155
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView$a;->a:Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;

    .line 156
    .line 157
    invoke-static {p1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;->b(Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;)I

    .line 158
    .line 159
    .line 160
    move-result p1

    .line 161
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView$a;->a:Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;

    .line 162
    .line 163
    invoke-static {p2}, Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;->f(Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;)I

    .line 164
    .line 165
    .line 166
    move-result p2

    .line 167
    if-le p1, p2, :cond_4

    .line 168
    .line 169
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView$a;->a:Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;

    .line 170
    .line 171
    invoke-static {p1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;->f(Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;)I

    .line 172
    .line 173
    .line 174
    move-result p2

    .line 175
    invoke-static {p1, p2}, Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;->j(Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;I)V

    .line 176
    .line 177
    .line 178
    :cond_4
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView$a;->a:Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;

    .line 179
    .line 180
    invoke-static {p1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;->b(Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;)I

    .line 181
    .line 182
    .line 183
    move-result p1

    .line 184
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView$a;->a:Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;

    .line 185
    .line 186
    invoke-static {p2}, Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;->a(Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;)I

    .line 187
    .line 188
    .line 189
    move-result p2

    .line 190
    iget-object p3, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView$a;->a:Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;

    .line 191
    .line 192
    invoke-static {p3}, Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;->e(Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;)I

    .line 193
    .line 194
    .line 195
    move-result p3

    .line 196
    add-int/2addr p2, p3

    .line 197
    iget-object p3, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView$a;->a:Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;

    .line 198
    .line 199
    if-le p1, p2, :cond_5

    .line 200
    .line 201
    invoke-static {p3}, Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;->a(Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;)I

    .line 202
    .line 203
    .line 204
    move-result p1

    .line 205
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView$a;->a:Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;

    .line 206
    .line 207
    invoke-static {p2}, Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;->e(Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;)I

    .line 208
    .line 209
    .line 210
    move-result p2

    .line 211
    add-int/2addr p1, p2

    .line 212
    invoke-static {p3, p1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;->j(Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;I)V

    .line 213
    .line 214
    .line 215
    goto :goto_0

    .line 216
    :cond_5
    invoke-static {p3}, Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;->b(Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;)I

    .line 217
    .line 218
    .line 219
    move-result p1

    .line 220
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView$a;->a:Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;

    .line 221
    .line 222
    invoke-static {p2}, Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;->a(Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;)I

    .line 223
    .line 224
    .line 225
    move-result p2

    .line 226
    iget-object p3, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView$a;->a:Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;

    .line 227
    .line 228
    invoke-static {p3}, Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;->g(Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;)I

    .line 229
    .line 230
    .line 231
    move-result p3

    .line 232
    add-int/2addr p2, p3

    .line 233
    if-ge p1, p2, :cond_6

    .line 234
    .line 235
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView$a;->a:Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;

    .line 236
    .line 237
    invoke-static {p1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;->a(Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;)I

    .line 238
    .line 239
    .line 240
    move-result p2

    .line 241
    iget-object p3, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView$a;->a:Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;

    .line 242
    .line 243
    invoke-static {p3}, Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;->g(Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;)I

    .line 244
    .line 245
    .line 246
    move-result p3

    .line 247
    add-int/2addr p2, p3

    .line 248
    invoke-static {p1, p2}, Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;->j(Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;I)V

    .line 249
    .line 250
    .line 251
    :cond_6
    :goto_0
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView$a;->a:Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;

    .line 252
    .line 253
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;->x:Ll/a30;

    .line 254
    .line 255
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 256
    .line 257
    .line 258
    move-result p1

    .line 259
    if-eqz p1, :cond_7

    .line 260
    .line 261
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView$a;->a:Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;

    .line 262
    .line 263
    iget-object p2, p1, Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;->x:Ll/a30;

    .line 264
    .line 265
    invoke-static {p1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;->a(Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;)I

    .line 266
    .line 267
    .line 268
    move-result p1

    .line 269
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 270
    .line 271
    .line 272
    move-result-object p1

    .line 273
    iget-object p3, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView$a;->a:Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;

    .line 274
    .line 275
    invoke-static {p3}, Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;->b(Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;)I

    .line 276
    .line 277
    .line 278
    move-result p3

    .line 279
    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 280
    .line 281
    .line 282
    move-result-object p3

    .line 283
    sget-object p4, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 284
    .line 285
    invoke-interface {p2, p1, p3, p4}, Ll/a30;->a(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 286
    .line 287
    .line 288
    :cond_7
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView$a;->a:Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;

    .line 289
    .line 290
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 291
    .line 292
    .line 293
    const/4 p0, 0x1

    .line 294
    return p0
.end method

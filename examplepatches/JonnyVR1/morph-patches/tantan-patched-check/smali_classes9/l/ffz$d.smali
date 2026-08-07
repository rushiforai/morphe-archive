.class public Ll/ffz$d;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/bm50;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/ffz;->T(IIZI)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public a:Landroid/graphics/PointF;

.field public b:Z

.field public final synthetic c:Ll/qzz;

.field public final synthetic d:Ll/ffz;


# direct methods
.method public constructor <init>(Ll/ffz;Ll/qzz;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/ffz$d;->d:Ll/ffz;

    .line 2
    .line 3
    iput-object p2, p0, Ll/ffz$d;->c:Ll/qzz;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    const/4 p1, 0x0

    .line 9
    iput-object p1, p0, Ll/ffz$d;->a:Landroid/graphics/PointF;

    .line 10
    .line 11
    const/4 p1, 0x0

    .line 12
    iput-boolean p1, p0, Ll/ffz$d;->b:Z

    .line 13
    .line 14
    return-void
.end method

.method public static synthetic a(Ll/ffz$d;Landroid/graphics/Rect;Landroid/view/MotionEvent;Landroid/view/View;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/ffz$d;->b(Landroid/graphics/Rect;Landroid/view/MotionEvent;Landroid/view/View;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public final synthetic b(Landroid/graphics/Rect;Landroid/view/MotionEvent;Landroid/view/View;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ffz$d;->d:Ll/ffz;

    .line 2
    .line 3
    iget-object v0, v0, Ll/ffz;->a:Landroid/graphics/Rect;

    .line 4
    .line 5
    invoke-static {p3, p1, v0}, Ll/bnl0;->H(Landroid/view/View;Landroid/graphics/Rect;Landroid/graphics/Rect;)V

    .line 6
    .line 7
    .line 8
    instance-of p1, p3, Landroid/widget/ListView;

    .line 9
    .line 10
    if-nez p1, :cond_1

    .line 11
    .line 12
    invoke-virtual {p3}, Landroid/view/View;->isClickable()Z

    .line 13
    .line 14
    .line 15
    move-result p1

    .line 16
    if-nez p1, :cond_0

    .line 17
    .line 18
    invoke-virtual {p3}, Landroid/view/View;->isLongClickable()Z

    .line 19
    .line 20
    .line 21
    move-result p1

    .line 22
    if-eqz p1, :cond_1

    .line 23
    .line 24
    iget-boolean p1, p0, Ll/ffz$d;->b:Z

    .line 25
    .line 26
    if-eqz p1, :cond_1

    .line 27
    .line 28
    :cond_0
    iget-object p0, p0, Ll/ffz$d;->d:Ll/ffz;

    .line 29
    .line 30
    iget-object p0, p0, Ll/ffz;->a:Landroid/graphics/Rect;

    .line 31
    .line 32
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getRawX()F

    .line 33
    .line 34
    .line 35
    move-result p1

    .line 36
    float-to-int p1, p1

    .line 37
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getRawY()F

    .line 38
    .line 39
    .line 40
    move-result p2

    .line 41
    float-to-int p2, p2

    .line 42
    invoke-virtual {p0, p1, p2}, Landroid/graphics/Rect;->contains(II)Z

    .line 43
    .line 44
    .line 45
    move-result p0

    .line 46
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    return-object p0

    .line 51
    :cond_1
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 52
    .line 53
    return-object p0
.end method

.method public dispatchTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 8

    .line 1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    new-instance v0, Landroid/graphics/PointF;

    .line 9
    .line 10
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    .line 11
    .line 12
    .line 13
    move-result v2

    .line 14
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 15
    .line 16
    .line 17
    move-result p1

    .line 18
    invoke-direct {v0, v2, p1}, Landroid/graphics/PointF;-><init>(FF)V

    .line 19
    .line 20
    .line 21
    iput-object v0, p0, Ll/ffz$d;->a:Landroid/graphics/PointF;

    .line 22
    .line 23
    goto/16 :goto_2

    .line 24
    .line 25
    :cond_0
    iget-object v0, p0, Ll/ffz$d;->a:Landroid/graphics/PointF;

    .line 26
    .line 27
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    const/4 v2, -0x1

    .line 32
    const/4 v3, 0x1

    .line 33
    if-eqz v0, :cond_1

    .line 34
    .line 35
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    if-eq v0, v3, :cond_1

    .line 40
    .line 41
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    const/4 v4, 0x3

    .line 46
    if-eq v0, v4, :cond_1

    .line 47
    .line 48
    new-instance v0, Landroid/graphics/RectF;

    .line 49
    .line 50
    iget-object v3, p0, Ll/ffz$d;->a:Landroid/graphics/PointF;

    .line 51
    .line 52
    iget v4, v3, Landroid/graphics/PointF;->x:F

    .line 53
    .line 54
    iget v3, v3, Landroid/graphics/PointF;->y:F

    .line 55
    .line 56
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    .line 57
    .line 58
    .line 59
    move-result v5

    .line 60
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 61
    .line 62
    .line 63
    move-result p1

    .line 64
    invoke-direct {v0, v4, v3, v5, p1}, Landroid/graphics/RectF;-><init>(FFFF)V

    .line 65
    .line 66
    .line 67
    invoke-virtual {v0}, Landroid/graphics/RectF;->width()F

    .line 68
    .line 69
    .line 70
    move-result p1

    .line 71
    invoke-virtual {v0}, Landroid/graphics/RectF;->width()F

    .line 72
    .line 73
    .line 74
    move-result v3

    .line 75
    mul-float/2addr p1, v3

    .line 76
    invoke-virtual {v0}, Landroid/graphics/RectF;->height()F

    .line 77
    .line 78
    .line 79
    move-result v3

    .line 80
    invoke-virtual {v0}, Landroid/graphics/RectF;->height()F

    .line 81
    .line 82
    .line 83
    move-result v0

    .line 84
    mul-float/2addr v3, v0

    .line 85
    add-float/2addr p1, v3

    .line 86
    float-to-double v3, p1

    .line 87
    invoke-static {v3, v4}, Ljava/lang/Math;->sqrt(D)D

    .line 88
    .line 89
    .line 90
    move-result-wide v3

    .line 91
    double-to-float p1, v3

    .line 92
    const/high16 v0, 0x40800000    # 4.0f

    .line 93
    .line 94
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 95
    .line 96
    .line 97
    move-result v0

    .line 98
    int-to-float v0, v0

    .line 99
    cmpl-float p1, p1, v0

    .line 100
    .line 101
    if-lez p1, :cond_3

    .line 102
    .line 103
    iget-object p1, p0, Ll/ffz$d;->d:Ll/ffz;

    .line 104
    .line 105
    invoke-virtual {p1, v1, v2}, Ll/ffz;->k(II)V

    .line 106
    .line 107
    .line 108
    iget-object p0, p0, Ll/ffz$d;->d:Ll/ffz;

    .line 109
    .line 110
    invoke-static {p0}, Ll/ffz;->B(Ll/ffz;)Ll/vez;

    .line 111
    .line 112
    .line 113
    move-result-object p0

    .line 114
    invoke-virtual {p0}, Ll/j3z;->e0()Ll/mzl;

    .line 115
    .line 116
    .line 117
    move-result-object p0

    .line 118
    invoke-interface {p0}, Ll/mzl;->l()Ll/clz;

    .line 119
    .line 120
    .line 121
    move-result-object p0

    .line 122
    invoke-virtual {p0}, Ll/clz;->t7()Ll/qzz;

    .line 123
    .line 124
    .line 125
    move-result-object p0

    .line 126
    invoke-virtual {p0, v1}, Ll/qzz;->y0(Z)V

    .line 127
    .line 128
    .line 129
    goto :goto_2

    .line 130
    :cond_1
    iget-object v0, p0, Ll/ffz$d;->a:Landroid/graphics/PointF;

    .line 131
    .line 132
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 133
    .line 134
    .line 135
    move-result v0

    .line 136
    if-eqz v0, :cond_3

    .line 137
    .line 138
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 139
    .line 140
    .line 141
    move-result v0

    .line 142
    if-ne v0, v3, :cond_3

    .line 143
    .line 144
    :try_start_0
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getEventTime()J

    .line 145
    .line 146
    .line 147
    move-result-wide v4

    .line 148
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getDownTime()J

    .line 149
    .line 150
    .line 151
    move-result-wide v6

    .line 152
    sub-long/2addr v4, v6

    .line 153
    invoke-static {}, Landroid/view/ViewConfiguration;->getLongPressTimeout()I

    .line 154
    .line 155
    .line 156
    move-result v0

    .line 157
    int-to-long v6, v0

    .line 158
    cmp-long v0, v4, v6

    .line 159
    .line 160
    if-ltz v0, :cond_2

    .line 161
    .line 162
    goto :goto_0

    .line 163
    :cond_2
    move v3, v1

    .line 164
    :goto_0
    iput-boolean v3, p0, Ll/ffz$d;->b:Z

    .line 165
    .line 166
    new-instance v0, Landroid/graphics/Rect;

    .line 167
    .line 168
    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    .line 169
    .line 170
    .line 171
    iget-object v3, p0, Ll/ffz$d;->c:Ll/qzz;

    .line 172
    .line 173
    iget-object v3, v3, Ll/qzz;->T:Lcom/p1/mobile/putong/core/ui/messages/view/MessageLayout;

    .line 174
    .line 175
    invoke-virtual {v3, v0}, Landroid/view/View;->getWindowVisibleDisplayFrame(Landroid/graphics/Rect;)V

    .line 176
    .line 177
    .line 178
    iget-object v3, p0, Ll/ffz$d;->c:Ll/qzz;

    .line 179
    .line 180
    iget-object v3, v3, Ll/qzz;->T:Lcom/p1/mobile/putong/core/ui/messages/view/MessageLayout;

    .line 181
    .line 182
    new-instance v4, Ll/gfz;

    .line 183
    .line 184
    invoke-direct {v4, p0, v0, p1}, Ll/gfz;-><init>(Ll/ffz$d;Landroid/graphics/Rect;Landroid/view/MotionEvent;)V

    .line 185
    .line 186
    .line 187
    invoke-static {v3, v4}, Ll/bnl0;->q(Landroid/view/ViewGroup;Ll/qcj;)Landroid/view/View;

    .line 188
    .line 189
    .line 190
    move-result-object p1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 191
    goto :goto_1

    .line 192
    :catch_0
    move-exception p1

    .line 193
    new-instance v0, Ljava/lang/Exception;

    .line 194
    .line 195
    new-instance v3, Ljava/lang/StringBuilder;

    .line 196
    .line 197
    const-string v4, "MessagesAct _list_child dispatchTouchEvent:"

    .line 198
    .line 199
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 200
    .line 201
    .line 202
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 203
    .line 204
    .line 205
    move-result-object v4

    .line 206
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 207
    .line 208
    .line 209
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 210
    .line 211
    .line 212
    move-result-object v3

    .line 213
    invoke-direct {v0, v3, p1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 214
    .line 215
    .line 216
    invoke-static {v0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 217
    .line 218
    .line 219
    const/4 p1, 0x0

    .line 220
    :goto_1
    if-nez p1, :cond_3

    .line 221
    .line 222
    iget-object p0, p0, Ll/ffz$d;->d:Ll/ffz;

    .line 223
    .line 224
    invoke-virtual {p0, v1, v2}, Ll/ffz;->k(II)V

    .line 225
    .line 226
    .line 227
    :cond_3
    :goto_2
    return v1
.end method

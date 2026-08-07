.class public Lcom/p1/mobile/putong/core/ui/profile/VReorderCards$a;
.super Landroid/view/GestureDetector$SimpleOnGestureListener;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public a:J

.field public final synthetic b:Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;)V
    .locals 2

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards$a;->b:Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;

    .line 2
    .line 3
    invoke-direct {p0}, Landroid/view/GestureDetector$SimpleOnGestureListener;-><init>()V

    .line 4
    .line 5
    .line 6
    const-wide/16 v0, 0x0

    .line 7
    .line 8
    iput-wide v0, p0, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards$a;->a:J

    .line 9
    .line 10
    return-void
.end method

.method public static synthetic a(Landroid/view/View;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0}, Landroid/view/View;->setPressed(Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method


# virtual methods
.method public onScroll(Landroid/view/MotionEvent;Landroid/view/MotionEvent;FF)Z
    .locals 3

    .line 1
    iget-object p3, p0, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards$a;->b:Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;

    .line 2
    .line 3
    iget-object p4, p3, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->b:Ll/jzk0;

    .line 4
    .line 5
    if-eqz p4, :cond_9

    .line 6
    .line 7
    iget-object p4, p4, Ll/jzk0;->g:Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;

    .line 8
    .line 9
    iget-boolean v0, p4, Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;->a:Z

    .line 10
    .line 11
    if-nez v0, :cond_1

    .line 12
    .line 13
    iget-boolean p0, p3, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->l:Z

    .line 14
    .line 15
    if-nez p0, :cond_0

    .line 16
    .line 17
    iget-boolean p0, p3, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->m:Z

    .line 18
    .line 19
    if-eqz p0, :cond_9

    .line 20
    .line 21
    :cond_0
    invoke-virtual {p4, p1}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;->A(Landroid/view/MotionEvent;)V

    .line 22
    .line 23
    .line 24
    goto/16 :goto_2

    .line 25
    .line 26
    :cond_1
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getX()F

    .line 27
    .line 28
    .line 29
    move-result p1

    .line 30
    float-to-int p1, p1

    .line 31
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getY()F

    .line 32
    .line 33
    .line 34
    move-result p2

    .line 35
    float-to-int p2, p2

    .line 36
    iget-object p3, p0, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards$a;->b:Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;

    .line 37
    .line 38
    iget-object p3, p3, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->b:Ll/jzk0;

    .line 39
    .line 40
    invoke-virtual {p3, p1, p2}, Ll/jzk0;->d(II)Z

    .line 41
    .line 42
    .line 43
    move-result p3

    .line 44
    if-nez p3, :cond_8

    .line 45
    .line 46
    iget-object p3, p0, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards$a;->b:Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;

    .line 47
    .line 48
    invoke-virtual {p3, p1, p2}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->k(II)Ll/jzk0;

    .line 49
    .line 50
    .line 51
    move-result-object p3

    .line 52
    if-eqz p3, :cond_8

    .line 53
    .line 54
    iget-object p4, p3, Ll/jzk0;->g:Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;

    .line 55
    .line 56
    iget-boolean v0, p4, Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;->b:Z

    .line 57
    .line 58
    if-nez v0, :cond_8

    .line 59
    .line 60
    iget-boolean v0, p4, Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;->n:Z

    .line 61
    .line 62
    if-eqz v0, :cond_7

    .line 63
    .line 64
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards$a;->b:Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;

    .line 65
    .line 66
    iget-object p2, p1, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->b:Ll/jzk0;

    .line 67
    .line 68
    iput-object p3, p1, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->b:Ll/jzk0;

    .line 69
    .line 70
    new-instance p1, Ljava/util/ArrayList;

    .line 71
    .line 72
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 73
    .line 74
    .line 75
    const/4 p4, 0x0

    .line 76
    move v0, p4

    .line 77
    :goto_0
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards$a;->b:Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;

    .line 78
    .line 79
    iget v1, v1, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->d:I

    .line 80
    .line 81
    if-ge v0, v1, :cond_5

    .line 82
    .line 83
    iget v1, p2, Ll/jzk0;->e:I

    .line 84
    .line 85
    iget v2, p3, Ll/jzk0;->e:I

    .line 86
    .line 87
    if-le v1, v2, :cond_2

    .line 88
    .line 89
    if-ne v0, v2, :cond_2

    .line 90
    .line 91
    iget-object v1, p2, Ll/jzk0;->g:Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;

    .line 92
    .line 93
    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 94
    .line 95
    .line 96
    :cond_2
    iget v1, p2, Ll/jzk0;->e:I

    .line 97
    .line 98
    if-eq v0, v1, :cond_3

    .line 99
    .line 100
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards$a;->b:Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;

    .line 101
    .line 102
    iget-object v1, v1, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->p:[Ll/jzk0;

    .line 103
    .line 104
    aget-object v1, v1, v0

    .line 105
    .line 106
    iget-object v1, v1, Ll/jzk0;->g:Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;

    .line 107
    .line 108
    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 109
    .line 110
    .line 111
    :cond_3
    iget v1, p2, Ll/jzk0;->e:I

    .line 112
    .line 113
    iget v2, p3, Ll/jzk0;->e:I

    .line 114
    .line 115
    if-ge v1, v2, :cond_4

    .line 116
    .line 117
    if-ne v0, v2, :cond_4

    .line 118
    .line 119
    iget-object v1, p2, Ll/jzk0;->g:Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;

    .line 120
    .line 121
    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 122
    .line 123
    .line 124
    :cond_4
    add-int/lit8 v0, v0, 0x1

    .line 125
    .line 126
    goto :goto_0

    .line 127
    :cond_5
    :goto_1
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards$a;->b:Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;

    .line 128
    .line 129
    iget p3, p2, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->d:I

    .line 130
    .line 131
    if-ge p4, p3, :cond_9

    .line 132
    .line 133
    iget-object p2, p2, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->p:[Ll/jzk0;

    .line 134
    .line 135
    aget-object p2, p2, p4

    .line 136
    .line 137
    invoke-virtual {p1, p4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 138
    .line 139
    .line 140
    move-result-object p3

    .line 141
    check-cast p3, Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;

    .line 142
    .line 143
    invoke-virtual {p2, p3}, Ll/jzk0;->f(Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;)V

    .line 144
    .line 145
    .line 146
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards$a;->b:Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;

    .line 147
    .line 148
    iget-object p2, p2, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->p:[Ll/jzk0;

    .line 149
    .line 150
    aget-object p2, p2, p4

    .line 151
    .line 152
    iget-object p2, p2, Ll/jzk0;->g:Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;

    .line 153
    .line 154
    iget-boolean p3, p2, Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;->a:Z

    .line 155
    .line 156
    if-nez p3, :cond_6

    .line 157
    .line 158
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;->g()V

    .line 159
    .line 160
    .line 161
    :cond_6
    add-int/lit8 p4, p4, 0x1

    .line 162
    .line 163
    goto :goto_1

    .line 164
    :cond_7
    iget-boolean p3, p4, Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;->p:Z

    .line 165
    .line 166
    if-eqz p3, :cond_8

    .line 167
    .line 168
    iget-object p3, p0, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards$a;->b:Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;

    .line 169
    .line 170
    invoke-static {p3}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->e(Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;)Ljava/lang/Runnable;

    .line 171
    .line 172
    .line 173
    move-result-object p3

    .line 174
    invoke-static {p3}, Ll/l51;->J(Ljava/lang/Runnable;)V

    .line 175
    .line 176
    .line 177
    iget-object p3, p0, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards$a;->b:Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;

    .line 178
    .line 179
    invoke-virtual {p3}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 180
    .line 181
    .line 182
    move-result-object p3

    .line 183
    iget-object p4, p0, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards$a;->b:Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;

    .line 184
    .line 185
    invoke-static {p4}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->e(Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;)Ljava/lang/Runnable;

    .line 186
    .line 187
    .line 188
    move-result-object p4

    .line 189
    invoke-static {}, Landroid/view/ViewConfiguration;->getLongPressTimeout()I

    .line 190
    .line 191
    .line 192
    move-result v0

    .line 193
    int-to-long v0, v0

    .line 194
    invoke-static {p3, p4, v0, v1}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 195
    .line 196
    .line 197
    :cond_8
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards$a;->b:Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;

    .line 198
    .line 199
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->b:Ll/jzk0;

    .line 200
    .line 201
    iget-object p0, p0, Ll/jzk0;->g:Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;

    .line 202
    .line 203
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;->p(II)V

    .line 204
    .line 205
    .line 206
    :cond_9
    :goto_2
    const/4 p0, 0x1

    .line 207
    return p0
.end method

.method public onShowPress(Landroid/view/MotionEvent;)V
    .locals 3

    .line 1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getDownTime()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    iput-wide v0, p0, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards$a;->a:J

    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards$a;->b:Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;

    .line 8
    .line 9
    iget-object v1, v0, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->b:Ll/jzk0;

    .line 10
    .line 11
    const/4 v2, 0x1

    .line 12
    if-eqz v1, :cond_1

    .line 13
    .line 14
    iget-object v1, v1, Ll/jzk0;->g:Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;

    .line 15
    .line 16
    if-eqz v1, :cond_1

    .line 17
    .line 18
    iget-boolean v1, v1, Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;->b:Z

    .line 19
    .line 20
    if-nez v1, :cond_1

    .line 21
    .line 22
    iget-boolean v1, v0, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->l:Z

    .line 23
    .line 24
    if-nez v1, :cond_0

    .line 25
    .line 26
    iput-boolean v2, v0, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->m:Z

    .line 27
    .line 28
    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    invoke-interface {v0, v2}, Landroid/view/ViewParent;->requestDisallowInterceptTouchEvent(Z)V

    .line 33
    .line 34
    .line 35
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards$a;->b:Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;

    .line 36
    .line 37
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->b:Ll/jzk0;

    .line 38
    .line 39
    iget-object v0, v0, Ll/jzk0;->g:Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;

    .line 40
    .line 41
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;->A(Landroid/view/MotionEvent;)V

    .line 42
    .line 43
    .line 44
    :cond_1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards$a;->b:Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;

    .line 45
    .line 46
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->A:Lcom/p1/mobile/putong/core/ui/profile/VReorderCards$c;

    .line 47
    .line 48
    if-eqz p0, :cond_2

    .line 49
    .line 50
    invoke-interface {p0, v2}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards$c;->a(Z)V

    .line 51
    .line 52
    .line 53
    :cond_2
    return-void
.end method

.method public onSingleTapUp(Landroid/view/MotionEvent;)Z
    .locals 6

    .line 1
    iget-wide v0, p0, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards$a;->a:J

    .line 2
    .line 3
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getDownTime()J

    .line 4
    .line 5
    .line 6
    move-result-wide v2

    .line 7
    cmp-long v0, v0, v2

    .line 8
    .line 9
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards$a;->b:Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;

    .line 10
    .line 11
    if-eqz v0, :cond_2

    .line 12
    .line 13
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    float-to-int v0, v0

    .line 18
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 19
    .line 20
    .line 21
    move-result p1

    .line 22
    float-to-int p1, p1

    .line 23
    invoke-virtual {v1, v0, p1}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->k(II)Ll/jzk0;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    const/4 v0, 0x1

    .line 28
    if-eqz p1, :cond_1

    .line 29
    .line 30
    iget-object v1, p1, Ll/jzk0;->g:Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;

    .line 31
    .line 32
    invoke-virtual {v1, v0}, Landroid/view/View;->setPressed(Z)V

    .line 33
    .line 34
    .line 35
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards$a;->b:Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;

    .line 36
    .line 37
    new-instance v3, Ll/izk0;

    .line 38
    .line 39
    invoke-direct {v3, v1}, Ll/izk0;-><init>(Landroid/view/View;)V

    .line 40
    .line 41
    .line 42
    const-wide/16 v4, 0x32

    .line 43
    .line 44
    invoke-virtual {v2, v3, v4, v5}, Landroid/view/View;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 45
    .line 46
    .line 47
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards$a;->b:Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;

    .line 48
    .line 49
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->m()Z

    .line 50
    .line 51
    .line 52
    move-result v1

    .line 53
    if-nez v1, :cond_1

    .line 54
    .line 55
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards$a;->b:Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;

    .line 56
    .line 57
    iget-object v1, v1, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->j:Ljava/lang/Runnable;

    .line 58
    .line 59
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 60
    .line 61
    .line 62
    move-result v1

    .line 63
    if-eqz v1, :cond_0

    .line 64
    .line 65
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards$a;->b:Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;

    .line 66
    .line 67
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->j:Ljava/lang/Runnable;

    .line 68
    .line 69
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    .line 70
    .line 71
    .line 72
    :cond_0
    iget-object p0, p1, Ll/jzk0;->g:Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;

    .line 73
    .line 74
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;->u()V

    .line 75
    .line 76
    .line 77
    :cond_1
    return v0

    .line 78
    :cond_2
    iget-object p0, v1, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->A:Lcom/p1/mobile/putong/core/ui/profile/VReorderCards$c;

    .line 79
    .line 80
    const/4 p1, 0x0

    .line 81
    if-eqz p0, :cond_3

    .line 82
    .line 83
    invoke-interface {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards$c;->a(Z)V

    .line 84
    .line 85
    .line 86
    :cond_3
    return p1
.end method

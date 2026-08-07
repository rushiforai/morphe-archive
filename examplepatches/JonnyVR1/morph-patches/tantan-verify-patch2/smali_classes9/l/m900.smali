.class public abstract Ll/m900;
.super Ll/i3z;
.source "SourceFile"

# interfaces
.implements Landroid/view/Choreographer$FrameCallback;
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/i3z<",
        "Lcom/p1/mobile/putong/core/data/Message;",
        ">;",
        "Landroid/view/Choreographer$FrameCallback;",
        "Landroid/animation/ValueAnimator$AnimatorUpdateListener;"
    }
.end annotation


# static fields
.field public static i:J = 0x14dc9380L

.field public static j:Z = true


# instance fields
.field public c:Lcom/p1/mobile/putong/core/ui/messages/recycler/wrap/MessageRecyclerView;

.field public d:Landroid/animation/ValueAnimator;

.field public e:Z

.field public f:Landroid/util/LongSparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/LongSparseArray<",
            "Ll/prc0;",
            ">;"
        }
    .end annotation
.end field

.field public g:Landroid/util/LongSparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/LongSparseArray<",
            "Ll/lo0;",
            ">;"
        }
    .end annotation
.end field

.field public h:Ljava/lang/Runnable;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 1
    return-void
.end method

.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/messages/recycler/wrap/MessageRecyclerView;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ll/i3z;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    iput-boolean v0, p0, Ll/m900;->e:Z

    .line 6
    .line 7
    new-instance v1, Landroid/util/LongSparseArray;

    .line 8
    .line 9
    invoke-direct {v1}, Landroid/util/LongSparseArray;-><init>()V

    .line 10
    .line 11
    .line 12
    iput-object v1, p0, Ll/m900;->f:Landroid/util/LongSparseArray;

    .line 13
    .line 14
    new-instance v1, Landroid/util/LongSparseArray;

    .line 15
    .line 16
    invoke-direct {v1}, Landroid/util/LongSparseArray;-><init>()V

    .line 17
    .line 18
    .line 19
    iput-object v1, p0, Ll/m900;->g:Landroid/util/LongSparseArray;

    .line 20
    .line 21
    new-instance v1, Ll/m900$b;

    .line 22
    .line 23
    invoke-direct {v1, p0}, Ll/m900$b;-><init>(Ll/m900;)V

    .line 24
    .line 25
    .line 26
    iput-object v1, p0, Ll/m900;->h:Ljava/lang/Runnable;

    .line 27
    .line 28
    iput-object p1, p0, Ll/m900;->c:Lcom/p1/mobile/putong/core/ui/messages/recycler/wrap/MessageRecyclerView;

    .line 29
    .line 30
    invoke-virtual {p0, v0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->setHasStableIds(Z)V

    .line 31
    .line 32
    .line 33
    invoke-direct {p0}, Ll/m900;->W()V

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public static bridge synthetic G(Ll/m900;)Landroid/animation/ValueAnimator;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/m900;->d:Landroid/animation/ValueAnimator;

    return-object p0
.end method

.method public static bridge synthetic H(Ll/m900;Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/m900;->d:Landroid/animation/ValueAnimator;

    return-void
.end method

.method public static bridge synthetic I(Ll/m900;Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/m900;->e:Z

    return-void
.end method

.method public static bridge synthetic J(Ll/m900;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/m900;->N(Landroid/view/View;)V

    return-void
.end method

.method public static bridge synthetic K(Ll/m900;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/m900;->Q()V

    return-void
.end method

.method public static bridge synthetic L(Ll/m900;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/m900;->X()V

    return-void
.end method

.method private W()V
    .locals 1

    .line 1
    new-instance v0, Ll/m900$a;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/m900$a;-><init>(Ll/m900;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->registerAdapterDataObserver(Landroidx/recyclerview/widget/RecyclerView$i;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method


# virtual methods
.method public final M(FILandroid/view/View;)F
    .locals 0

    .line 1
    if-eqz p3, :cond_0

    .line 2
    .line 3
    invoke-virtual {p3}, Landroid/view/View;->getHeight()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    int-to-float p0, p0

    .line 8
    invoke-virtual {p3, p0}, Landroid/view/View;->setPivotY(F)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p3, p1}, Landroid/view/View;->setAlpha(F)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p3, p1}, Landroid/view/View;->setScaleY(F)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p3, p1}, Landroid/view/View;->setScaleX(F)V

    .line 18
    .line 19
    .line 20
    :cond_0
    int-to-float p0, p2

    .line 21
    mul-float/2addr p0, p1

    .line 22
    const/4 p1, 0x0

    .line 23
    cmpg-float p2, p0, p1

    .line 24
    .line 25
    if-gez p2, :cond_1

    .line 26
    .line 27
    return p1

    .line 28
    :cond_1
    return p0
.end method

.method public final N(Landroid/view/View;)V
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    const/high16 p0, 0x3f800000    # 1.0f

    .line 4
    .line 5
    invoke-virtual {p1, p0}, Landroid/view/View;->setScaleY(F)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p1, p0}, Landroid/view/View;->setScaleX(F)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p1, p0}, Landroid/view/View;->setAlpha(F)V

    .line 12
    .line 13
    .line 14
    const/4 p0, 0x0

    .line 15
    invoke-virtual {p1, p0}, Landroid/view/View;->setRotation(F)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p1, p0}, Landroid/view/View;->setRotationY(F)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p1, p0}, Landroid/view/View;->setTranslationY(F)V

    .line 22
    .line 23
    .line 24
    :cond_0
    return-void
.end method

.method public final O()V
    .locals 10

    .line 1
    iget-object v0, p0, Ll/m900;->c:Lcom/p1/mobile/putong/core/ui/messages/recycler/wrap/MessageRecyclerView;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    invoke-virtual {p0}, Ll/m900;->U()I

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    iget-object v2, p0, Ll/m900;->g:Landroid/util/LongSparseArray;

    .line 12
    .line 13
    invoke-virtual {v2}, Landroid/util/LongSparseArray;->size()I

    .line 14
    .line 15
    .line 16
    move-result v2

    .line 17
    const/4 v3, 0x1

    .line 18
    if-lez v2, :cond_2

    .line 19
    .line 20
    new-instance v2, Landroid/util/LongSparseArray;

    .line 21
    .line 22
    invoke-direct {v2}, Landroid/util/LongSparseArray;-><init>()V

    .line 23
    .line 24
    .line 25
    const/4 v4, 0x0

    .line 26
    move v5, v4

    .line 27
    :goto_0
    iget-object v6, p0, Ll/m900;->g:Landroid/util/LongSparseArray;

    .line 28
    .line 29
    invoke-virtual {v6}, Landroid/util/LongSparseArray;->size()I

    .line 30
    .line 31
    .line 32
    move-result v6

    .line 33
    if-ge v4, v6, :cond_1

    .line 34
    .line 35
    iget-object v6, p0, Ll/m900;->g:Landroid/util/LongSparseArray;

    .line 36
    .line 37
    invoke-virtual {v6, v4}, Landroid/util/LongSparseArray;->valueAt(I)Ljava/lang/Object;

    .line 38
    .line 39
    .line 40
    move-result-object v6

    .line 41
    check-cast v6, Ll/lo0;

    .line 42
    .line 43
    invoke-virtual {v6}, Ll/lo0;->a()Z

    .line 44
    .line 45
    .line 46
    move-result v7

    .line 47
    if-eqz v7, :cond_0

    .line 48
    .line 49
    iget-object v7, p0, Ll/m900;->g:Landroid/util/LongSparseArray;

    .line 50
    .line 51
    invoke-virtual {v7, v4}, Landroid/util/LongSparseArray;->keyAt(I)J

    .line 52
    .line 53
    .line 54
    move-result-wide v7

    .line 55
    invoke-virtual {v2, v7, v8, v6}, Landroid/util/LongSparseArray;->put(JLjava/lang/Object;)V

    .line 56
    .line 57
    .line 58
    goto :goto_1

    .line 59
    :cond_0
    invoke-virtual {v6}, Ll/lo0;->c()V

    .line 60
    .line 61
    .line 62
    move v5, v3

    .line 63
    :goto_1
    add-int/lit8 v4, v4, 0x1

    .line 64
    .line 65
    goto :goto_0

    .line 66
    :cond_1
    if-eqz v5, :cond_2

    .line 67
    .line 68
    iget-object v4, p0, Ll/m900;->g:Landroid/util/LongSparseArray;

    .line 69
    .line 70
    invoke-virtual {v4}, Landroid/util/LongSparseArray;->clear()V

    .line 71
    .line 72
    .line 73
    iput-object v2, p0, Ll/m900;->g:Landroid/util/LongSparseArray;

    .line 74
    .line 75
    :cond_2
    sub-int/2addr v0, v3

    .line 76
    :goto_2
    if-ltz v0, :cond_6

    .line 77
    .line 78
    iget-object v2, p0, Ll/m900;->c:Lcom/p1/mobile/putong/core/ui/messages/recycler/wrap/MessageRecyclerView;

    .line 79
    .line 80
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 81
    .line 82
    .line 83
    move-result-object v2

    .line 84
    if-eqz v2, :cond_5

    .line 85
    .line 86
    invoke-virtual {p0, v2}, Ll/m900;->T(Landroid/view/View;)I

    .line 87
    .line 88
    .line 89
    move-result v3

    .line 90
    invoke-virtual {p0, v3}, Ll/m900;->V(I)Lcom/p1/mobile/putong/core/data/Message;

    .line 91
    .line 92
    .line 93
    move-result-object v3

    .line 94
    if-nez v3, :cond_3

    .line 95
    .line 96
    goto :goto_3

    .line 97
    :cond_3
    iget-object v4, p0, Ll/m900;->f:Landroid/util/LongSparseArray;

    .line 98
    .line 99
    iget-wide v5, v3, Lcom/tantanapp/common/data/DbObject;->_id:J

    .line 100
    .line 101
    invoke-virtual {v4, v5, v6}, Landroid/util/LongSparseArray;->get(J)Ljava/lang/Object;

    .line 102
    .line 103
    .line 104
    move-result-object v4

    .line 105
    check-cast v4, Ll/prc0;

    .line 106
    .line 107
    if-eqz v4, :cond_5

    .line 108
    .line 109
    invoke-virtual {v2}, Landroid/view/View;->getTop()I

    .line 110
    .line 111
    .line 112
    move-result v2

    .line 113
    iget-object v5, p0, Ll/m900;->g:Landroid/util/LongSparseArray;

    .line 114
    .line 115
    iget-wide v6, v3, Lcom/tantanapp/common/data/DbObject;->_id:J

    .line 116
    .line 117
    invoke-virtual {v5, v6, v7}, Landroid/util/LongSparseArray;->get(J)Ljava/lang/Object;

    .line 118
    .line 119
    .line 120
    move-result-object v5

    .line 121
    check-cast v5, Ll/lo0;

    .line 122
    .line 123
    if-eqz v5, :cond_4

    .line 124
    .line 125
    iget v6, v4, Ll/prc0;->b:I

    .line 126
    .line 127
    sub-int/2addr v6, v2

    .line 128
    iget-wide v2, v3, Lcom/tantanapp/common/data/DbObject;->_id:J

    .line 129
    .line 130
    iput-wide v2, v5, Ll/lo0;->e:J

    .line 131
    .line 132
    iget v2, v5, Ll/lo0;->c:I

    .line 133
    .line 134
    add-int/2addr v2, v6

    .line 135
    iput v2, v5, Ll/lo0;->c:I

    .line 136
    .line 137
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    .line 138
    .line 139
    .line 140
    move-result-wide v2

    .line 141
    sget-wide v6, Ll/m900;->i:J

    .line 142
    .line 143
    add-long/2addr v2, v6

    .line 144
    iput-wide v2, v5, Ll/lo0;->b:J

    .line 145
    .line 146
    iget v2, v5, Ll/lo0;->d:I

    .line 147
    .line 148
    iget v3, v4, Ll/prc0;->d:I

    .line 149
    .line 150
    add-int/2addr v2, v3

    .line 151
    sub-int/2addr v2, v1

    .line 152
    iput v2, v5, Ll/lo0;->d:I

    .line 153
    .line 154
    goto :goto_3

    .line 155
    :cond_4
    invoke-static {}, Ll/lo0;->b()Ll/lo0;

    .line 156
    .line 157
    .line 158
    move-result-object v5

    .line 159
    iget-wide v6, v3, Lcom/tantanapp/common/data/DbObject;->_id:J

    .line 160
    .line 161
    iput-wide v6, v5, Ll/lo0;->e:J

    .line 162
    .line 163
    iget v6, v4, Ll/prc0;->b:I

    .line 164
    .line 165
    sub-int/2addr v6, v2

    .line 166
    iput v6, v5, Ll/lo0;->c:I

    .line 167
    .line 168
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    .line 169
    .line 170
    .line 171
    move-result-wide v6

    .line 172
    sget-wide v8, Ll/m900;->i:J

    .line 173
    .line 174
    add-long/2addr v6, v8

    .line 175
    iput-wide v6, v5, Ll/lo0;->b:J

    .line 176
    .line 177
    iget v2, v4, Ll/prc0;->d:I

    .line 178
    .line 179
    sub-int/2addr v2, v1

    .line 180
    iput v2, v5, Ll/lo0;->d:I

    .line 181
    .line 182
    iget-object v2, p0, Ll/m900;->g:Landroid/util/LongSparseArray;

    .line 183
    .line 184
    iget-wide v3, v3, Lcom/tantanapp/common/data/DbObject;->_id:J

    .line 185
    .line 186
    invoke-virtual {v2, v3, v4, v5}, Landroid/util/LongSparseArray;->put(JLjava/lang/Object;)V

    .line 187
    .line 188
    .line 189
    :cond_5
    :goto_3
    add-int/lit8 v0, v0, -0x1

    .line 190
    .line 191
    goto :goto_2

    .line 192
    :cond_6
    invoke-virtual {p0}, Ll/m900;->R()V

    .line 193
    .line 194
    .line 195
    return-void
.end method

.method public P(FI)F
    .locals 4

    .line 1
    invoke-virtual {p0, p2}, Ll/m900;->V(I)Lcom/p1/mobile/putong/core/data/Message;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    if-eqz p2, :cond_1

    .line 6
    .line 7
    iget-object p0, p0, Ll/m900;->g:Landroid/util/LongSparseArray;

    .line 8
    .line 9
    iget-wide v0, p2, Lcom/tantanapp/common/data/DbObject;->_id:J

    .line 10
    .line 11
    invoke-virtual {p0, v0, v1}, Landroid/util/LongSparseArray;->get(J)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    check-cast p0, Ll/lo0;

    .line 16
    .line 17
    if-eqz p0, :cond_1

    .line 18
    .line 19
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    .line 20
    .line 21
    .line 22
    move-result-wide v0

    .line 23
    iget-wide v2, p0, Ll/lo0;->b:J

    .line 24
    .line 25
    cmp-long p2, v0, v2

    .line 26
    .line 27
    if-ltz p2, :cond_0

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_0
    iget p2, p0, Ll/lo0;->c:I

    .line 31
    .line 32
    iget p0, p0, Ll/lo0;->d:I

    .line 33
    .line 34
    add-int v0, p2, p0

    .line 35
    .line 36
    int-to-float v0, v0

    .line 37
    cmpl-float v0, p1, v0

    .line 38
    .line 39
    if-lez v0, :cond_1

    .line 40
    .line 41
    add-int/2addr p2, p0

    .line 42
    int-to-float p0, p2

    .line 43
    return p0

    .line 44
    :cond_1
    :goto_0
    return p1
.end method

.method public final Q()V
    .locals 9

    .line 1
    iget-object v0, p0, Ll/m900;->c:Lcom/p1/mobile/putong/core/ui/messages/recycler/wrap/MessageRecyclerView;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/messages/recycler/wrap/MessageRecyclerView;->getFirstVisiblePosition()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget-object v1, p0, Ll/m900;->c:Lcom/p1/mobile/putong/core/ui/messages/recycler/wrap/MessageRecyclerView;

    .line 8
    .line 9
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/messages/recycler/wrap/MessageRecyclerView;->getLastVisiblePosition()I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    iget-object v2, p0, Ll/m900;->c:Lcom/p1/mobile/putong/core/ui/messages/recycler/wrap/MessageRecyclerView;

    .line 14
    .line 15
    invoke-virtual {v2}, Landroid/view/ViewGroup;->getChildCount()I

    .line 16
    .line 17
    .line 18
    move-result v2

    .line 19
    invoke-virtual {p0}, Ll/m900;->U()I

    .line 20
    .line 21
    .line 22
    move-result v3

    .line 23
    invoke-virtual {p0}, Ll/m900;->R()V

    .line 24
    .line 25
    .line 26
    add-int/lit8 v2, v2, -0x1

    .line 27
    .line 28
    :goto_0
    if-ltz v2, :cond_2

    .line 29
    .line 30
    iget-object v4, p0, Ll/m900;->c:Lcom/p1/mobile/putong/core/ui/messages/recycler/wrap/MessageRecyclerView;

    .line 31
    .line 32
    invoke-virtual {v4, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 33
    .line 34
    .line 35
    move-result-object v4

    .line 36
    if-eqz v4, :cond_1

    .line 37
    .line 38
    invoke-virtual {p0, v4}, Ll/m900;->T(Landroid/view/View;)I

    .line 39
    .line 40
    .line 41
    move-result v5

    .line 42
    if-lt v5, v0, :cond_1

    .line 43
    .line 44
    if-gt v5, v1, :cond_1

    .line 45
    .line 46
    invoke-virtual {p0}, Ll/i3z;->getItemCount()I

    .line 47
    .line 48
    .line 49
    move-result v6

    .line 50
    if-ge v5, v6, :cond_1

    .line 51
    .line 52
    if-ltz v5, :cond_1

    .line 53
    .line 54
    invoke-virtual {p0, v5}, Ll/m900;->V(I)Lcom/p1/mobile/putong/core/data/Message;

    .line 55
    .line 56
    .line 57
    move-result-object v5

    .line 58
    if-nez v5, :cond_0

    .line 59
    .line 60
    goto :goto_1

    .line 61
    :cond_0
    invoke-static {}, Ll/prc0;->c()Ll/prc0;

    .line 62
    .line 63
    .line 64
    move-result-object v6

    .line 65
    invoke-virtual {v4}, Landroid/view/View;->getTop()I

    .line 66
    .line 67
    .line 68
    move-result v4

    .line 69
    invoke-virtual {v6, v4}, Ll/prc0;->a(I)Ll/prc0;

    .line 70
    .line 71
    .line 72
    move-result-object v4

    .line 73
    iget-wide v7, v5, Lcom/tantanapp/common/data/DbObject;->_id:J

    .line 74
    .line 75
    invoke-virtual {v4, v7, v8}, Ll/prc0;->d(J)Ll/prc0;

    .line 76
    .line 77
    .line 78
    move-result-object v4

    .line 79
    invoke-virtual {v4, v3}, Ll/prc0;->f(I)Ll/prc0;

    .line 80
    .line 81
    .line 82
    iget-object v4, p0, Ll/m900;->f:Landroid/util/LongSparseArray;

    .line 83
    .line 84
    invoke-virtual {v6}, Ll/prc0;->b()J

    .line 85
    .line 86
    .line 87
    move-result-wide v7

    .line 88
    invoke-virtual {v4, v7, v8, v6}, Landroid/util/LongSparseArray;->put(JLjava/lang/Object;)V

    .line 89
    .line 90
    .line 91
    :cond_1
    :goto_1
    add-int/lit8 v2, v2, -0x1

    .line 92
    .line 93
    goto :goto_0

    .line 94
    :cond_2
    return-void
.end method

.method public final R()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/m900;->f:Landroid/util/LongSparseArray;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/util/LongSparseArray;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-lez v0, :cond_1

    .line 8
    .line 9
    iget-object v0, p0, Ll/m900;->f:Landroid/util/LongSparseArray;

    .line 10
    .line 11
    invoke-virtual {v0}, Landroid/util/LongSparseArray;->size()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    const/4 v1, 0x0

    .line 16
    :goto_0
    iget-object v2, p0, Ll/m900;->f:Landroid/util/LongSparseArray;

    .line 17
    .line 18
    if-ge v1, v0, :cond_0

    .line 19
    .line 20
    invoke-virtual {v2, v1}, Landroid/util/LongSparseArray;->valueAt(I)Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object v2

    .line 24
    check-cast v2, Ll/prc0;

    .line 25
    .line 26
    invoke-virtual {v2}, Ll/prc0;->e()V

    .line 27
    .line 28
    .line 29
    add-int/lit8 v1, v1, 0x1

    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_0
    invoke-virtual {v2}, Landroid/util/LongSparseArray;->clear()V

    .line 33
    .line 34
    .line 35
    :cond_1
    return-void
.end method

.method public final S()V
    .locals 20

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    .line 4
    .line 5
    .line 6
    move-result-wide v1

    .line 7
    iget-object v3, v0, Ll/m900;->c:Lcom/p1/mobile/putong/core/ui/messages/recycler/wrap/MessageRecyclerView;

    .line 8
    .line 9
    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/ui/messages/recycler/wrap/MessageRecyclerView;->getFirstVisiblePosition()I

    .line 10
    .line 11
    .line 12
    move-result v3

    .line 13
    iget-object v4, v0, Ll/m900;->c:Lcom/p1/mobile/putong/core/ui/messages/recycler/wrap/MessageRecyclerView;

    .line 14
    .line 15
    invoke-virtual {v4}, Lcom/p1/mobile/putong/core/ui/messages/recycler/wrap/MessageRecyclerView;->getLastVisiblePosition()I

    .line 16
    .line 17
    .line 18
    move-result v4

    .line 19
    invoke-virtual {v0}, Ll/i3z;->getItemCount()I

    .line 20
    .line 21
    .line 22
    move-result v5

    .line 23
    const/4 v6, 0x1

    .line 24
    sub-int/2addr v5, v6

    .line 25
    const/4 v7, 0x0

    .line 26
    const/4 v8, 0x0

    .line 27
    move v10, v7

    .line 28
    move v9, v8

    .line 29
    move v11, v9

    .line 30
    :goto_0
    invoke-virtual {v0}, Ll/i3z;->getItemCount()I

    .line 31
    .line 32
    .line 33
    move-result v12

    .line 34
    add-int/lit8 v12, v12, -0x14

    .line 35
    .line 36
    invoke-static {v12, v8}, Ljava/lang/Math;->max(II)I

    .line 37
    .line 38
    .line 39
    move-result v12

    .line 40
    const/4 v13, 0x0

    .line 41
    if-lt v5, v12, :cond_4

    .line 42
    .line 43
    invoke-virtual {v0, v5}, Ll/m900;->V(I)Lcom/p1/mobile/putong/core/data/Message;

    .line 44
    .line 45
    .line 46
    move-result-object v12

    .line 47
    if-lt v5, v3, :cond_0

    .line 48
    .line 49
    if-gt v5, v4, :cond_0

    .line 50
    .line 51
    iget-object v13, v0, Ll/m900;->c:Lcom/p1/mobile/putong/core/ui/messages/recycler/wrap/MessageRecyclerView;

    .line 52
    .line 53
    invoke-virtual {v13}, Landroid/view/ViewGroup;->getChildCount()I

    .line 54
    .line 55
    .line 56
    move-result v13

    .line 57
    sub-int/2addr v13, v4

    .line 58
    add-int/2addr v13, v5

    .line 59
    sub-int/2addr v13, v6

    .line 60
    iget-object v14, v0, Ll/m900;->c:Lcom/p1/mobile/putong/core/ui/messages/recycler/wrap/MessageRecyclerView;

    .line 61
    .line 62
    invoke-virtual {v14, v13}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 63
    .line 64
    .line 65
    move-result-object v13

    .line 66
    :cond_0
    if-eqz v13, :cond_1

    .line 67
    .line 68
    invoke-virtual {v0, v13}, Ll/m900;->N(Landroid/view/View;)V

    .line 69
    .line 70
    .line 71
    invoke-virtual {v0, v10, v5}, Ll/m900;->P(FI)F

    .line 72
    .line 73
    .line 74
    move-result v14

    .line 75
    invoke-static {v7, v14}, Ljava/lang/Math;->max(FF)F

    .line 76
    .line 77
    .line 78
    move-result v14

    .line 79
    invoke-static {v14}, Ljava/lang/Math;->round(F)I

    .line 80
    .line 81
    .line 82
    move-result v14

    .line 83
    int-to-float v14, v14

    .line 84
    invoke-virtual {v13, v14}, Landroid/view/View;->setTranslationY(F)V

    .line 85
    .line 86
    .line 87
    :cond_1
    if-eqz v12, :cond_3

    .line 88
    .line 89
    if-nez v11, :cond_3

    .line 90
    .line 91
    iget-wide v14, v12, Lcom/p1/mobile/putong/core/data/Message;->localCreatedTime:J

    .line 92
    .line 93
    const-wide/16 v16, 0x0

    .line 94
    .line 95
    cmp-long v16, v14, v16

    .line 96
    .line 97
    if-lez v16, :cond_3

    .line 98
    .line 99
    cmp-long v16, v1, v14

    .line 100
    .line 101
    if-ltz v16, :cond_3

    .line 102
    .line 103
    sget-wide v7, Ll/m900;->i:J

    .line 104
    .line 105
    add-long v18, v14, v7

    .line 106
    .line 107
    cmp-long v18, v18, v1

    .line 108
    .line 109
    if-ltz v18, :cond_3

    .line 110
    .line 111
    sub-long v14, v1, v14

    .line 112
    .line 113
    long-to-float v9, v14

    .line 114
    const/high16 v14, 0x3f800000    # 1.0f

    .line 115
    .line 116
    mul-float/2addr v9, v14

    .line 117
    long-to-float v7, v7

    .line 118
    div-float/2addr v9, v7

    .line 119
    iget v7, v12, Lcom/p1/mobile/putong/core/data/Message;->viewHeight:I

    .line 120
    .line 121
    invoke-virtual {v0, v9, v7, v13}, Ll/m900;->M(FILandroid/view/View;)F

    .line 122
    .line 123
    .line 124
    move-result v7

    .line 125
    iget v8, v12, Lcom/p1/mobile/putong/core/data/Message;->viewHeight:I

    .line 126
    .line 127
    int-to-float v8, v8

    .line 128
    sub-float/2addr v8, v7

    .line 129
    add-float/2addr v10, v8

    .line 130
    iget-boolean v7, v0, Ll/m900;->e:Z

    .line 131
    .line 132
    if-nez v7, :cond_2

    .line 133
    .line 134
    iput-boolean v6, v0, Ll/m900;->e:Z

    .line 135
    .line 136
    iget-object v7, v0, Ll/m900;->c:Lcom/p1/mobile/putong/core/ui/messages/recycler/wrap/MessageRecyclerView;

    .line 137
    .line 138
    invoke-virtual {v7}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 139
    .line 140
    .line 141
    move-result-object v7

    .line 142
    iget-object v8, v0, Ll/m900;->h:Ljava/lang/Runnable;

    .line 143
    .line 144
    sget-wide v12, Ll/m900;->i:J

    .line 145
    .line 146
    const-wide/32 v14, 0xf4240

    .line 147
    .line 148
    .line 149
    div-long/2addr v12, v14

    .line 150
    invoke-static {v7, v8, v12, v13}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 151
    .line 152
    .line 153
    :cond_2
    move v9, v6

    .line 154
    goto :goto_1

    .line 155
    :cond_3
    move v11, v6

    .line 156
    :goto_1
    add-int/lit8 v5, v5, -0x1

    .line 157
    .line 158
    const/4 v7, 0x0

    .line 159
    const/4 v8, 0x0

    .line 160
    goto/16 :goto_0

    .line 161
    .line 162
    :cond_4
    sget-boolean v1, Ll/m900;->j:Z

    .line 163
    .line 164
    if-eqz v1, :cond_6

    .line 165
    .line 166
    if-nez v9, :cond_5

    .line 167
    .line 168
    iget-object v1, v0, Ll/m900;->d:Landroid/animation/ValueAnimator;

    .line 169
    .line 170
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 171
    .line 172
    .line 173
    move-result v1

    .line 174
    if-eqz v1, :cond_5

    .line 175
    .line 176
    iget-object v1, v0, Ll/m900;->d:Landroid/animation/ValueAnimator;

    .line 177
    .line 178
    invoke-virtual {v1}, Landroid/animation/ValueAnimator;->cancel()V

    .line 179
    .line 180
    .line 181
    iput-object v13, v0, Ll/m900;->d:Landroid/animation/ValueAnimator;

    .line 182
    .line 183
    iget-boolean v1, v0, Ll/m900;->e:Z

    .line 184
    .line 185
    if-eqz v1, :cond_5

    .line 186
    .line 187
    iget-object v1, v0, Ll/m900;->h:Ljava/lang/Runnable;

    .line 188
    .line 189
    invoke-static {v1}, Ll/l51;->J(Ljava/lang/Runnable;)V

    .line 190
    .line 191
    .line 192
    const/4 v1, 0x0

    .line 193
    iput-boolean v1, v0, Ll/m900;->e:Z

    .line 194
    .line 195
    :cond_5
    return-void

    .line 196
    :cond_6
    if-nez v9, :cond_7

    .line 197
    .line 198
    invoke-static {}, Landroid/view/Choreographer;->getInstance()Landroid/view/Choreographer;

    .line 199
    .line 200
    .line 201
    move-result-object v1

    .line 202
    invoke-virtual {v1, v0}, Landroid/view/Choreographer;->removeFrameCallback(Landroid/view/Choreographer$FrameCallback;)V

    .line 203
    .line 204
    .line 205
    return-void

    .line 206
    :cond_7
    invoke-static {}, Landroid/view/Choreographer;->getInstance()Landroid/view/Choreographer;

    .line 207
    .line 208
    .line 209
    move-result-object v1

    .line 210
    invoke-virtual {v1, v0}, Landroid/view/Choreographer;->postFrameCallback(Landroid/view/Choreographer$FrameCallback;)V

    .line 211
    .line 212
    .line 213
    return-void
.end method

.method public final T(Landroid/view/View;)I
    .locals 1

    .line 1
    const/4 p0, -0x1

    .line 2
    if-nez p1, :cond_0

    .line 3
    .line 4
    return p0

    .line 5
    :cond_0
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    instance-of v0, v0, Landroidx/recyclerview/widget/RecyclerView$p;

    .line 10
    .line 11
    if-nez v0, :cond_1

    .line 12
    .line 13
    return p0

    .line 14
    :cond_1
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    check-cast p0, Landroidx/recyclerview/widget/RecyclerView$p;

    .line 19
    .line 20
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$p;->c()I

    .line 21
    .line 22
    .line 23
    move-result p0

    .line 24
    return p0
.end method

.method public final U()I
    .locals 1

    .line 1
    const/4 v0, 0x2

    .line 2
    new-array v0, v0, [I

    .line 3
    .line 4
    iget-object p0, p0, Ll/m900;->c:Lcom/p1/mobile/putong/core/ui/messages/recycler/wrap/MessageRecyclerView;

    .line 5
    .line 6
    invoke-virtual {p0, v0}, Landroid/view/View;->getLocationOnScreen([I)V

    .line 7
    .line 8
    .line 9
    const/4 p0, 0x1

    .line 10
    aget p0, v0, p0

    .line 11
    .line 12
    return p0
.end method

.method public abstract V(I)Lcom/p1/mobile/putong/core/data/Message;
.end method

.method public final X()V
    .locals 9

    .line 1
    iget-object v0, p0, Ll/m900;->c:Lcom/p1/mobile/putong/core/ui/messages/recycler/wrap/MessageRecyclerView;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    goto/16 :goto_1

    .line 10
    .line 11
    :cond_0
    iget-object v0, p0, Ll/m900;->c:Lcom/p1/mobile/putong/core/ui/messages/recycler/wrap/MessageRecyclerView;

    .line 12
    .line 13
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    const/4 v1, 0x1

    .line 18
    sub-int/2addr v0, v1

    .line 19
    const/4 v2, 0x0

    .line 20
    :goto_0
    if-ltz v0, :cond_3

    .line 21
    .line 22
    iget-object v3, p0, Ll/m900;->c:Lcom/p1/mobile/putong/core/ui/messages/recycler/wrap/MessageRecyclerView;

    .line 23
    .line 24
    invoke-virtual {v3, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 25
    .line 26
    .line 27
    move-result-object v3

    .line 28
    invoke-static {v3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 29
    .line 30
    .line 31
    move-result v4

    .line 32
    if-eqz v4, :cond_1

    .line 33
    .line 34
    invoke-virtual {p0, v3}, Ll/m900;->N(Landroid/view/View;)V

    .line 35
    .line 36
    .line 37
    :cond_1
    invoke-virtual {p0, v3}, Ll/m900;->T(Landroid/view/View;)I

    .line 38
    .line 39
    .line 40
    move-result v4

    .line 41
    if-ltz v4, :cond_2

    .line 42
    .line 43
    invoke-virtual {p0, v4}, Ll/m900;->V(I)Lcom/p1/mobile/putong/core/data/Message;

    .line 44
    .line 45
    .line 46
    move-result-object v4

    .line 47
    invoke-static {v4}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 48
    .line 49
    .line 50
    move-result v5

    .line 51
    if-eqz v5, :cond_2

    .line 52
    .line 53
    invoke-virtual {v3}, Landroid/view/View;->getHeight()I

    .line 54
    .line 55
    .line 56
    move-result v3

    .line 57
    iput v3, v4, Lcom/p1/mobile/putong/core/data/Message;->viewHeight:I

    .line 58
    .line 59
    iget-wide v5, v4, Lcom/p1/mobile/putong/core/data/Message;->localCreatedTime:J

    .line 60
    .line 61
    const-wide/16 v7, 0x0

    .line 62
    .line 63
    cmp-long v3, v5, v7

    .line 64
    .line 65
    if-lez v3, :cond_2

    .line 66
    .line 67
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    .line 68
    .line 69
    .line 70
    move-result-wide v5

    .line 71
    iget-wide v3, v4, Lcom/p1/mobile/putong/core/data/Message;->localCreatedTime:J

    .line 72
    .line 73
    sub-long/2addr v5, v3

    .line 74
    sget-wide v3, Ll/m900;->i:J

    .line 75
    .line 76
    cmp-long v3, v5, v3

    .line 77
    .line 78
    if-gez v3, :cond_2

    .line 79
    .line 80
    move v2, v1

    .line 81
    :cond_2
    add-int/lit8 v0, v0, -0x1

    .line 82
    .line 83
    goto :goto_0

    .line 84
    :cond_3
    invoke-virtual {p0}, Ll/m900;->O()V

    .line 85
    .line 86
    .line 87
    sget-boolean v0, Ll/m900;->j:Z

    .line 88
    .line 89
    if-eqz v0, :cond_5

    .line 90
    .line 91
    if-eqz v2, :cond_4

    .line 92
    .line 93
    invoke-virtual {p0}, Ll/m900;->S()V

    .line 94
    .line 95
    .line 96
    iget-object v0, p0, Ll/m900;->d:Landroid/animation/ValueAnimator;

    .line 97
    .line 98
    if-nez v0, :cond_4

    .line 99
    .line 100
    const/4 v0, 0x2

    .line 101
    new-array v0, v0, [F

    .line 102
    .line 103
    fill-array-data v0, :array_0

    .line 104
    .line 105
    .line 106
    invoke-static {v0}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    .line 107
    .line 108
    .line 109
    move-result-object v0

    .line 110
    iput-object v0, p0, Ll/m900;->d:Landroid/animation/ValueAnimator;

    .line 111
    .line 112
    const-wide/32 v1, 0x989680

    .line 113
    .line 114
    .line 115
    invoke-virtual {v0, v1, v2}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 116
    .line 117
    .line 118
    iget-object v0, p0, Ll/m900;->d:Landroid/animation/ValueAnimator;

    .line 119
    .line 120
    invoke-virtual {v0, p0}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 121
    .line 122
    .line 123
    iget-object p0, p0, Ll/m900;->d:Landroid/animation/ValueAnimator;

    .line 124
    .line 125
    invoke-virtual {p0}, Landroid/animation/ValueAnimator;->start()V

    .line 126
    .line 127
    .line 128
    :cond_4
    :goto_1
    return-void

    .line 129
    :cond_5
    if-eqz v2, :cond_6

    .line 130
    .line 131
    invoke-virtual {p0}, Ll/m900;->S()V

    .line 132
    .line 133
    .line 134
    invoke-static {}, Landroid/view/Choreographer;->getInstance()Landroid/view/Choreographer;

    .line 135
    .line 136
    .line 137
    move-result-object v0

    .line 138
    invoke-virtual {v0, p0}, Landroid/view/Choreographer;->postFrameCallback(Landroid/view/Choreographer$FrameCallback;)V

    .line 139
    .line 140
    .line 141
    return-void

    .line 142
    :cond_6
    invoke-static {}, Landroid/view/Choreographer;->getInstance()Landroid/view/Choreographer;

    .line 143
    .line 144
    .line 145
    move-result-object v0

    .line 146
    invoke-virtual {v0, p0}, Landroid/view/Choreographer;->removeFrameCallback(Landroid/view/Choreographer$FrameCallback;)V

    .line 147
    .line 148
    .line 149
    return-void

    .line 150
    nop

    .line 151
    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public doFrame(J)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/m900;->S()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/m900;->S()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.class Lcom/p1/mobile/android/ui/bubble/BubbleView;
.super Landroid/widget/FrameLayout;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/android/ui/bubble/BubbleView$a;
    }
.end annotation


# instance fields
.field public a:Landroid/graphics/Paint;

.field public b:Lcom/p1/mobile/android/ui/bubble/a;

.field public c:Landroid/graphics/Path;

.field public d:I

.field public e:I

.field public f:I

.field public g:I

.field public h:I

.field public i:I

.field public j:I

.field public k:I

.field public l:I

.field public m:Lcom/p1/mobile/android/ui/bubble/BubbleView$a;

.field public n:Ljava/lang/String;

.field public o:I

.field public p:I

.field public q:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    .line 33
    invoke-direct {p0, p1, v0}, Lcom/p1/mobile/android/ui/bubble/BubbleView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    .line 32
    invoke-direct {p0, p1, p2, v0}, Lcom/p1/mobile/android/ui/bubble/BubbleView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 2
    .line 3
    .line 4
    const/4 p2, 0x0

    .line 5
    iput p2, p0, Lcom/p1/mobile/android/ui/bubble/BubbleView;->d:I

    .line 6
    .line 7
    iput p2, p0, Lcom/p1/mobile/android/ui/bubble/BubbleView;->e:I

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/p1/mobile/android/ui/bubble/BubbleView;->n()V

    .line 10
    .line 11
    .line 12
    instance-of p2, p1, Lcom/p1/mobile/android/app/Act;

    .line 13
    .line 14
    if-eqz p2, :cond_0

    .line 15
    .line 16
    check-cast p1, Lcom/p1/mobile/android/app/Act;

    .line 17
    .line 18
    new-instance p2, Lcom/p1/mobile/android/ui/bubble/e;

    .line 19
    .line 20
    invoke-direct {p2}, Lcom/p1/mobile/android/ui/bubble/e;-><init>()V

    .line 21
    .line 22
    .line 23
    new-instance p3, Lcom/p1/mobile/android/ui/bubble/f;

    .line 24
    .line 25
    invoke-direct {p3, p0}, Lcom/p1/mobile/android/ui/bubble/f;-><init>(Lcom/p1/mobile/android/ui/bubble/BubbleView;)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {p1, p2, p3}, Lcom/p1/mobile/android/app/Act;->creates(Ll/y20;Ll/x20;)V

    .line 29
    .line 30
    .line 31
    :cond_0
    return-void
.end method

.method public static synthetic a(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public static synthetic b(Landroid/os/Bundle;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic c(Lcom/p1/mobile/android/ui/bubble/BubbleView;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/ui/bubble/BubbleView;->o()V

    return-void
.end method

.method public static synthetic d(Lcom/p1/mobile/android/ui/bubble/BubbleView;Ll/bge;FF)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/android/ui/bubble/BubbleView;->p(Ll/bge;FF)V

    return-void
.end method

.method public static bridge synthetic e(Lcom/p1/mobile/android/ui/bubble/BubbleView;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/android/ui/bubble/BubbleView;->n:Ljava/lang/String;

    return-object p0
.end method


# virtual methods
.method public final f(Landroid/graphics/Rect;IIII)V
    .locals 2

    .line 1
    iput p4, p0, Lcom/p1/mobile/android/ui/bubble/BubbleView;->o:I

    .line 2
    .line 3
    iput p5, p0, Lcom/p1/mobile/android/ui/bubble/BubbleView;->p:I

    .line 4
    .line 5
    invoke-virtual {p0, p2, p3, p4, p5}, Lcom/p1/mobile/android/ui/bubble/BubbleView;->g(IIII)V

    .line 6
    .line 7
    .line 8
    iget p3, p1, Landroid/graphics/Rect;->right:I

    .line 9
    .line 10
    iget p4, p1, Landroid/graphics/Rect;->left:I

    .line 11
    .line 12
    add-int/2addr p3, p4

    .line 13
    div-int/lit8 p3, p3, 0x2

    .line 14
    .line 15
    iget p4, p0, Lcom/p1/mobile/android/ui/bubble/BubbleView;->d:I

    .line 16
    .line 17
    div-int/lit8 p5, p4, 0x2

    .line 18
    .line 19
    sub-int p5, p3, p5

    .line 20
    .line 21
    iput p5, p0, Lcom/p1/mobile/android/ui/bubble/BubbleView;->k:I

    .line 22
    .line 23
    iget-object p5, p0, Lcom/p1/mobile/android/ui/bubble/BubbleView;->b:Lcom/p1/mobile/android/ui/bubble/a;

    .line 24
    .line 25
    iget v0, p5, Lcom/p1/mobile/android/ui/bubble/a;->b:I

    .line 26
    .line 27
    sget v1, Lcom/p1/mobile/android/ui/bubble/a;->N:I

    .line 28
    .line 29
    and-int/2addr v0, v1

    .line 30
    if-ne v0, v1, :cond_0

    .line 31
    .line 32
    iget p1, p1, Landroid/graphics/Rect;->bottom:I

    .line 33
    .line 34
    iput p1, p0, Lcom/p1/mobile/android/ui/bubble/BubbleView;->l:I

    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_0
    iget p1, p1, Landroid/graphics/Rect;->top:I

    .line 38
    .line 39
    iget v0, p0, Lcom/p1/mobile/android/ui/bubble/BubbleView;->e:I

    .line 40
    .line 41
    sub-int/2addr p1, v0

    .line 42
    iput p1, p0, Lcom/p1/mobile/android/ui/bubble/BubbleView;->l:I

    .line 43
    .line 44
    :goto_0
    div-int/lit8 p1, p2, 0x2

    .line 45
    .line 46
    if-le p3, p1, :cond_1

    .line 47
    .line 48
    div-int/lit8 p1, p4, 0x2

    .line 49
    .line 50
    add-int/2addr p1, p3

    .line 51
    if-le p1, p2, :cond_2

    .line 52
    .line 53
    sub-int p1, p2, p4

    .line 54
    .line 55
    sub-int/2addr p3, p1

    .line 56
    iget p1, p5, Lcom/p1/mobile/android/ui/bubble/a;->e:I

    .line 57
    .line 58
    sub-int/2addr p3, p1

    .line 59
    iget p4, p0, Lcom/p1/mobile/android/ui/bubble/BubbleView;->o:I

    .line 60
    .line 61
    sub-int/2addr p3, p4

    .line 62
    iput p3, p0, Lcom/p1/mobile/android/ui/bubble/BubbleView;->j:I

    .line 63
    .line 64
    sub-int p1, p2, p1

    .line 65
    .line 66
    iget p4, p5, Lcom/p1/mobile/android/ui/bubble/a;->i:I

    .line 67
    .line 68
    sub-int/2addr p1, p4

    .line 69
    invoke-static {p1, p3}, Ljava/lang/Math;->min(II)I

    .line 70
    .line 71
    .line 72
    move-result p1

    .line 73
    iput p1, p0, Lcom/p1/mobile/android/ui/bubble/BubbleView;->j:I

    .line 74
    .line 75
    iget p1, p0, Lcom/p1/mobile/android/ui/bubble/BubbleView;->d:I

    .line 76
    .line 77
    sub-int/2addr p2, p1

    .line 78
    iput p2, p0, Lcom/p1/mobile/android/ui/bubble/BubbleView;->k:I

    .line 79
    .line 80
    goto :goto_1

    .line 81
    :cond_1
    div-int/lit8 p4, p4, 0x2

    .line 82
    .line 83
    if-le p4, p3, :cond_2

    .line 84
    .line 85
    iget p1, p5, Lcom/p1/mobile/android/ui/bubble/a;->e:I

    .line 86
    .line 87
    sub-int/2addr p3, p1

    .line 88
    iget p2, p0, Lcom/p1/mobile/android/ui/bubble/BubbleView;->o:I

    .line 89
    .line 90
    sub-int/2addr p3, p2

    .line 91
    iput p3, p0, Lcom/p1/mobile/android/ui/bubble/BubbleView;->j:I

    .line 92
    .line 93
    iget p2, p5, Lcom/p1/mobile/android/ui/bubble/a;->i:I

    .line 94
    .line 95
    add-int/2addr p1, p2

    .line 96
    invoke-static {p1, p3}, Ljava/lang/Math;->max(II)I

    .line 97
    .line 98
    .line 99
    move-result p1

    .line 100
    iput p1, p0, Lcom/p1/mobile/android/ui/bubble/BubbleView;->j:I

    .line 101
    .line 102
    const/4 p1, 0x0

    .line 103
    iput p1, p0, Lcom/p1/mobile/android/ui/bubble/BubbleView;->k:I

    .line 104
    .line 105
    :cond_2
    :goto_1
    const/4 p1, 0x1

    .line 106
    iput-boolean p1, p0, Lcom/p1/mobile/android/ui/bubble/BubbleView;->q:Z

    .line 107
    .line 108
    return-void
.end method

.method public final g(IIII)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/android/ui/bubble/BubbleView;->b:Lcom/p1/mobile/android/ui/bubble/a;

    .line 2
    .line 3
    iget-object v1, v0, Lcom/p1/mobile/android/ui/bubble/a;->w:Landroid/view/View;

    .line 4
    .line 5
    iget v0, v0, Lcom/p1/mobile/android/ui/bubble/a;->e:I

    .line 6
    .line 7
    mul-int/lit8 v0, v0, 0x2

    .line 8
    .line 9
    sub-int/2addr p1, v0

    .line 10
    sub-int/2addr p1, p3

    .line 11
    sub-int/2addr p1, p4

    .line 12
    const/high16 v0, -0x80000000

    .line 13
    .line 14
    invoke-static {p1, v0}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 15
    .line 16
    .line 17
    move-result p1

    .line 18
    invoke-static {p2, v0}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 19
    .line 20
    .line 21
    move-result p2

    .line 22
    invoke-virtual {v1, p1, p2}, Landroid/view/View;->measure(II)V

    .line 23
    .line 24
    .line 25
    iget-object p1, p0, Lcom/p1/mobile/android/ui/bubble/BubbleView;->b:Lcom/p1/mobile/android/ui/bubble/a;

    .line 26
    .line 27
    iget-object p1, p1, Lcom/p1/mobile/android/ui/bubble/a;->w:Landroid/view/View;

    .line 28
    .line 29
    invoke-virtual {p1}, Landroid/view/View;->getMeasuredWidth()I

    .line 30
    .line 31
    .line 32
    move-result p1

    .line 33
    iput p1, p0, Lcom/p1/mobile/android/ui/bubble/BubbleView;->f:I

    .line 34
    .line 35
    iget-object p1, p0, Lcom/p1/mobile/android/ui/bubble/BubbleView;->b:Lcom/p1/mobile/android/ui/bubble/a;

    .line 36
    .line 37
    iget-object p1, p1, Lcom/p1/mobile/android/ui/bubble/a;->w:Landroid/view/View;

    .line 38
    .line 39
    invoke-virtual {p1}, Landroid/view/View;->getMeasuredHeight()I

    .line 40
    .line 41
    .line 42
    move-result p1

    .line 43
    iput p1, p0, Lcom/p1/mobile/android/ui/bubble/BubbleView;->g:I

    .line 44
    .line 45
    iget p2, p0, Lcom/p1/mobile/android/ui/bubble/BubbleView;->f:I

    .line 46
    .line 47
    invoke-virtual {p0, p2, p1}, Lcom/p1/mobile/android/ui/bubble/BubbleView;->r(II)V

    .line 48
    .line 49
    .line 50
    iget-object p1, p0, Lcom/p1/mobile/android/ui/bubble/BubbleView;->b:Lcom/p1/mobile/android/ui/bubble/a;

    .line 51
    .line 52
    iget p2, p1, Lcom/p1/mobile/android/ui/bubble/a;->e:I

    .line 53
    .line 54
    mul-int/lit8 v0, p2, 0x2

    .line 55
    .line 56
    iget v1, p0, Lcom/p1/mobile/android/ui/bubble/BubbleView;->g:I

    .line 57
    .line 58
    add-int/2addr v0, v1

    .line 59
    iget p1, p1, Lcom/p1/mobile/android/ui/bubble/a;->g:I

    .line 60
    .line 61
    add-int/2addr v0, p1

    .line 62
    iput v0, p0, Lcom/p1/mobile/android/ui/bubble/BubbleView;->e:I

    .line 63
    .line 64
    iget p1, p0, Lcom/p1/mobile/android/ui/bubble/BubbleView;->f:I

    .line 65
    .line 66
    mul-int/lit8 p2, p2, 0x2

    .line 67
    .line 68
    add-int/2addr p2, p1

    .line 69
    add-int/2addr p2, p3

    .line 70
    add-int/2addr p2, p4

    .line 71
    iput p2, p0, Lcom/p1/mobile/android/ui/bubble/BubbleView;->d:I

    .line 72
    .line 73
    iput p1, p0, Lcom/p1/mobile/android/ui/bubble/BubbleView;->h:I

    .line 74
    .line 75
    iput v1, p0, Lcom/p1/mobile/android/ui/bubble/BubbleView;->i:I

    .line 76
    .line 77
    div-int/lit8 p1, p1, 0x2

    .line 78
    .line 79
    iput p1, p0, Lcom/p1/mobile/android/ui/bubble/BubbleView;->j:I

    .line 80
    .line 81
    return-void
.end method

.method public h(Landroid/graphics/Rect;II)V
    .locals 12

    .line 1
    iget-object v3, p0, Lcom/p1/mobile/android/ui/bubble/BubbleView;->b:Lcom/p1/mobile/android/ui/bubble/a;

    .line 2
    .line 3
    iget v4, v3, Lcom/p1/mobile/android/ui/bubble/a;->H:I

    .line 4
    .line 5
    iput v4, p0, Lcom/p1/mobile/android/ui/bubble/BubbleView;->o:I

    .line 6
    .line 7
    iget v4, v3, Lcom/p1/mobile/android/ui/bubble/a;->I:I

    .line 8
    .line 9
    iput v4, p0, Lcom/p1/mobile/android/ui/bubble/BubbleView;->p:I

    .line 10
    .line 11
    iget v4, p1, Landroid/graphics/Rect;->right:I

    .line 12
    .line 13
    iget v5, p1, Landroid/graphics/Rect;->left:I

    .line 14
    .line 15
    add-int/2addr v4, v5

    .line 16
    div-int/lit8 v4, v4, 0x2

    .line 17
    .line 18
    iget v5, v3, Lcom/p1/mobile/android/ui/bubble/a;->b:I

    .line 19
    .line 20
    iget v3, v3, Lcom/p1/mobile/android/ui/bubble/a;->h:I

    .line 21
    .line 22
    int-to-double v6, v3

    .line 23
    const-wide v8, 0x4066800000000000L    # 180.0

    .line 24
    .line 25
    .line 26
    .line 27
    .line 28
    div-double/2addr v6, v8

    .line 29
    const-wide v8, 0x400921fb54442d18L    # Math.PI

    .line 30
    .line 31
    .line 32
    .line 33
    .line 34
    mul-double/2addr v6, v8

    .line 35
    const-wide/high16 v8, 0x4000000000000000L    # 2.0

    .line 36
    .line 37
    div-double/2addr v6, v8

    .line 38
    invoke-static {v6, v7}, Ljava/lang/Math;->tan(D)D

    .line 39
    .line 40
    .line 41
    move-result-wide v6

    .line 42
    iget-object v3, p0, Lcom/p1/mobile/android/ui/bubble/BubbleView;->b:Lcom/p1/mobile/android/ui/bubble/a;

    .line 43
    .line 44
    iget v8, v3, Lcom/p1/mobile/android/ui/bubble/a;->g:I

    .line 45
    .line 46
    int-to-double v8, v8

    .line 47
    mul-double/2addr v6, v8

    .line 48
    double-to-int v6, v6

    .line 49
    iget v7, p0, Lcom/p1/mobile/android/ui/bubble/BubbleView;->o:I

    .line 50
    .line 51
    iget v8, v3, Lcom/p1/mobile/android/ui/bubble/a;->e:I

    .line 52
    .line 53
    sub-int v9, v4, v8

    .line 54
    .line 55
    iget v10, v3, Lcom/p1/mobile/android/ui/bubble/a;->i:I

    .line 56
    .line 57
    sub-int/2addr v9, v10

    .line 58
    sub-int/2addr v9, v6

    .line 59
    const/4 v11, 0x0

    .line 60
    if-le v7, v9, :cond_0

    .line 61
    .line 62
    iput v11, p0, Lcom/p1/mobile/android/ui/bubble/BubbleView;->o:I

    .line 63
    .line 64
    :cond_0
    add-int v7, v4, v6

    .line 65
    .line 66
    add-int/2addr v7, v8

    .line 67
    add-int/2addr v7, v10

    .line 68
    if-le v7, p2, :cond_1

    .line 69
    .line 70
    iput v11, p0, Lcom/p1/mobile/android/ui/bubble/BubbleView;->p:I

    .line 71
    .line 72
    :cond_1
    sget v7, Lcom/p1/mobile/android/ui/bubble/a;->O:I

    .line 73
    .line 74
    and-int v9, v5, v7

    .line 75
    .line 76
    if-ne v9, v7, :cond_2

    .line 77
    .line 78
    iput v11, p0, Lcom/p1/mobile/android/ui/bubble/BubbleView;->o:I

    .line 79
    .line 80
    iget v3, v3, Lcom/p1/mobile/android/ui/bubble/a;->v:I

    .line 81
    .line 82
    add-int/2addr v3, v10

    .line 83
    add-int/2addr v3, v8

    .line 84
    add-int/2addr v3, v6

    .line 85
    iget v7, p1, Landroid/graphics/Rect;->right:I

    .line 86
    .line 87
    iget v8, p1, Landroid/graphics/Rect;->left:I

    .line 88
    .line 89
    add-int/2addr v7, v8

    .line 90
    div-int/lit8 v7, v7, 0x2

    .line 91
    .line 92
    if-ge v3, v7, :cond_3

    .line 93
    .line 94
    sub-int/2addr v7, v3

    .line 95
    sub-int v3, p2, v7

    .line 96
    .line 97
    goto :goto_0

    .line 98
    :cond_2
    sget v7, Lcom/p1/mobile/android/ui/bubble/a;->P:I

    .line 99
    .line 100
    and-int v9, v5, v7

    .line 101
    .line 102
    if-ne v9, v7, :cond_3

    .line 103
    .line 104
    iput v11, p0, Lcom/p1/mobile/android/ui/bubble/BubbleView;->p:I

    .line 105
    .line 106
    iget v3, v3, Lcom/p1/mobile/android/ui/bubble/a;->v:I

    .line 107
    .line 108
    add-int/2addr v3, v10

    .line 109
    add-int/2addr v3, v8

    .line 110
    add-int/2addr v3, v6

    .line 111
    iget v7, p1, Landroid/graphics/Rect;->right:I

    .line 112
    .line 113
    iget v8, p1, Landroid/graphics/Rect;->left:I

    .line 114
    .line 115
    add-int/2addr v7, v8

    .line 116
    div-int/lit8 v7, v7, 0x2

    .line 117
    .line 118
    add-int/2addr v3, v7

    .line 119
    if-ge v3, p2, :cond_3

    .line 120
    .line 121
    goto :goto_0

    .line 122
    :cond_3
    move v3, p2

    .line 123
    :goto_0
    iget v7, p0, Lcom/p1/mobile/android/ui/bubble/BubbleView;->o:I

    .line 124
    .line 125
    iget v8, p0, Lcom/p1/mobile/android/ui/bubble/BubbleView;->p:I

    .line 126
    .line 127
    invoke-virtual {p0, v3, p3, v7, v8}, Lcom/p1/mobile/android/ui/bubble/BubbleView;->g(IIII)V

    .line 128
    .line 129
    .line 130
    sget v7, Lcom/p1/mobile/android/ui/bubble/a;->O:I

    .line 131
    .line 132
    and-int v8, v5, v7

    .line 133
    .line 134
    if-ne v8, v7, :cond_5

    .line 135
    .line 136
    sub-int v3, v4, v6

    .line 137
    .line 138
    iget-object v5, p0, Lcom/p1/mobile/android/ui/bubble/BubbleView;->b:Lcom/p1/mobile/android/ui/bubble/a;

    .line 139
    .line 140
    iget v7, v5, Lcom/p1/mobile/android/ui/bubble/a;->v:I

    .line 141
    .line 142
    sub-int/2addr v3, v7

    .line 143
    iget v8, v5, Lcom/p1/mobile/android/ui/bubble/a;->i:I

    .line 144
    .line 145
    sub-int/2addr v3, v8

    .line 146
    iget v10, v5, Lcom/p1/mobile/android/ui/bubble/a;->e:I

    .line 147
    .line 148
    sub-int/2addr v3, v10

    .line 149
    iput v3, p0, Lcom/p1/mobile/android/ui/bubble/BubbleView;->k:I

    .line 150
    .line 151
    iget v5, v5, Lcom/p1/mobile/android/ui/bubble/a;->b:I

    .line 152
    .line 153
    sget v11, Lcom/p1/mobile/android/ui/bubble/a;->N:I

    .line 154
    .line 155
    and-int/2addr v5, v11

    .line 156
    if-ne v5, v11, :cond_4

    .line 157
    .line 158
    iget v5, p1, Landroid/graphics/Rect;->bottom:I

    .line 159
    .line 160
    iput v5, p0, Lcom/p1/mobile/android/ui/bubble/BubbleView;->l:I

    .line 161
    .line 162
    goto :goto_1

    .line 163
    :cond_4
    iget v5, p1, Landroid/graphics/Rect;->top:I

    .line 164
    .line 165
    iget v11, p0, Lcom/p1/mobile/android/ui/bubble/BubbleView;->e:I

    .line 166
    .line 167
    sub-int/2addr v5, v11

    .line 168
    iput v5, p0, Lcom/p1/mobile/android/ui/bubble/BubbleView;->l:I

    .line 169
    .line 170
    :goto_1
    add-int/2addr v7, v8

    .line 171
    add-int/2addr v7, v6

    .line 172
    iput v7, p0, Lcom/p1/mobile/android/ui/bubble/BubbleView;->j:I

    .line 173
    .line 174
    add-int/2addr v3, v10

    .line 175
    add-int/2addr v3, v7

    .line 176
    if-eq v3, v4, :cond_8

    .line 177
    .line 178
    const/4 v4, 0x0

    .line 179
    const/4 v5, 0x0

    .line 180
    move-object v0, p0

    .line 181
    move-object v1, p1

    .line 182
    move v2, p2

    .line 183
    move v3, p3

    .line 184
    invoke-virtual/range {v0 .. v5}, Lcom/p1/mobile/android/ui/bubble/BubbleView;->f(Landroid/graphics/Rect;IIII)V

    .line 185
    .line 186
    .line 187
    return-void

    .line 188
    :cond_5
    sget v2, Lcom/p1/mobile/android/ui/bubble/a;->P:I

    .line 189
    .line 190
    and-int/2addr v5, v2

    .line 191
    if-ne v5, v2, :cond_9

    .line 192
    .line 193
    sub-int v2, v4, v6

    .line 194
    .line 195
    iget-object v5, p0, Lcom/p1/mobile/android/ui/bubble/BubbleView;->b:Lcom/p1/mobile/android/ui/bubble/a;

    .line 196
    .line 197
    iget v7, v5, Lcom/p1/mobile/android/ui/bubble/a;->v:I

    .line 198
    .line 199
    sub-int/2addr v2, v7

    .line 200
    iget v8, v5, Lcom/p1/mobile/android/ui/bubble/a;->i:I

    .line 201
    .line 202
    sub-int/2addr v2, v8

    .line 203
    iget v5, v5, Lcom/p1/mobile/android/ui/bubble/a;->e:I

    .line 204
    .line 205
    sub-int/2addr v2, v5

    .line 206
    iget v9, p0, Lcom/p1/mobile/android/ui/bubble/BubbleView;->o:I

    .line 207
    .line 208
    sub-int/2addr v2, v9

    .line 209
    iput v2, p0, Lcom/p1/mobile/android/ui/bubble/BubbleView;->k:I

    .line 210
    .line 211
    add-int/2addr v7, v8

    .line 212
    add-int/2addr v7, v5

    .line 213
    add-int/2addr v7, v6

    .line 214
    iget v2, p1, Landroid/graphics/Rect;->right:I

    .line 215
    .line 216
    iget v5, p1, Landroid/graphics/Rect;->left:I

    .line 217
    .line 218
    add-int/2addr v2, v5

    .line 219
    div-int/lit8 v2, v2, 0x2

    .line 220
    .line 221
    add-int/2addr v7, v2

    .line 222
    if-le v7, v3, :cond_6

    .line 223
    .line 224
    const/4 v4, 0x0

    .line 225
    const/4 v5, 0x0

    .line 226
    move-object v0, p0

    .line 227
    move-object v1, p1

    .line 228
    move v2, v3

    .line 229
    move v3, p3

    .line 230
    invoke-virtual/range {v0 .. v5}, Lcom/p1/mobile/android/ui/bubble/BubbleView;->f(Landroid/graphics/Rect;IIII)V

    .line 231
    .line 232
    .line 233
    return-void

    .line 234
    :cond_6
    iget v2, p0, Lcom/p1/mobile/android/ui/bubble/BubbleView;->d:I

    .line 235
    .line 236
    sub-int/2addr v7, v2

    .line 237
    iput v7, p0, Lcom/p1/mobile/android/ui/bubble/BubbleView;->k:I

    .line 238
    .line 239
    invoke-static {v11, v7}, Ljava/lang/Math;->max(II)I

    .line 240
    .line 241
    .line 242
    move-result v2

    .line 243
    iput v2, p0, Lcom/p1/mobile/android/ui/bubble/BubbleView;->k:I

    .line 244
    .line 245
    iget-object v3, p0, Lcom/p1/mobile/android/ui/bubble/BubbleView;->b:Lcom/p1/mobile/android/ui/bubble/a;

    .line 246
    .line 247
    iget v5, v3, Lcom/p1/mobile/android/ui/bubble/a;->b:I

    .line 248
    .line 249
    sget v7, Lcom/p1/mobile/android/ui/bubble/a;->N:I

    .line 250
    .line 251
    and-int/2addr v5, v7

    .line 252
    if-ne v5, v7, :cond_7

    .line 253
    .line 254
    iget v5, p1, Landroid/graphics/Rect;->bottom:I

    .line 255
    .line 256
    iput v5, p0, Lcom/p1/mobile/android/ui/bubble/BubbleView;->l:I

    .line 257
    .line 258
    goto :goto_2

    .line 259
    :cond_7
    iget v5, p1, Landroid/graphics/Rect;->top:I

    .line 260
    .line 261
    iget v7, p0, Lcom/p1/mobile/android/ui/bubble/BubbleView;->e:I

    .line 262
    .line 263
    sub-int/2addr v5, v7

    .line 264
    iput v5, p0, Lcom/p1/mobile/android/ui/bubble/BubbleView;->l:I

    .line 265
    .line 266
    :goto_2
    iget v5, p0, Lcom/p1/mobile/android/ui/bubble/BubbleView;->h:I

    .line 267
    .line 268
    iget v7, v3, Lcom/p1/mobile/android/ui/bubble/a;->v:I

    .line 269
    .line 270
    sub-int/2addr v5, v7

    .line 271
    iget v7, v3, Lcom/p1/mobile/android/ui/bubble/a;->i:I

    .line 272
    .line 273
    sub-int/2addr v5, v7

    .line 274
    sub-int/2addr v5, v6

    .line 275
    iput v5, p0, Lcom/p1/mobile/android/ui/bubble/BubbleView;->j:I

    .line 276
    .line 277
    iget v3, v3, Lcom/p1/mobile/android/ui/bubble/a;->e:I

    .line 278
    .line 279
    add-int/2addr v2, v3

    .line 280
    add-int/2addr v2, v5

    .line 281
    iget v3, p0, Lcom/p1/mobile/android/ui/bubble/BubbleView;->o:I

    .line 282
    .line 283
    add-int/2addr v2, v3

    .line 284
    if-eq v2, v4, :cond_8

    .line 285
    .line 286
    const/4 v4, 0x0

    .line 287
    const/4 v5, 0x0

    .line 288
    move-object v0, p0

    .line 289
    move-object v1, p1

    .line 290
    move v2, p2

    .line 291
    move v3, p3

    .line 292
    invoke-virtual/range {v0 .. v5}, Lcom/p1/mobile/android/ui/bubble/BubbleView;->f(Landroid/graphics/Rect;IIII)V

    .line 293
    .line 294
    .line 295
    :cond_8
    return-void

    .line 296
    :cond_9
    move v2, v3

    .line 297
    iget v4, p0, Lcom/p1/mobile/android/ui/bubble/BubbleView;->o:I

    .line 298
    .line 299
    iget v5, p0, Lcom/p1/mobile/android/ui/bubble/BubbleView;->p:I

    .line 300
    .line 301
    move-object v0, p0

    .line 302
    move-object v1, p1

    .line 303
    move v3, p3

    .line 304
    invoke-virtual/range {v0 .. v5}, Lcom/p1/mobile/android/ui/bubble/BubbleView;->f(Landroid/graphics/Rect;IIII)V

    .line 305
    .line 306
    .line 307
    return-void
.end method

.method public i()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/android/ui/bubble/BubbleView;->m:Lcom/p1/mobile/android/ui/bubble/BubbleView$a;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/android/ui/bubble/BubbleView;->m:Lcom/p1/mobile/android/ui/bubble/BubbleView$a;

    .line 10
    .line 11
    invoke-virtual {p0, v0}, Landroid/view/View;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public final j(I)I
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    iget p0, p0, Landroid/util/DisplayMetrics;->density:F

    .line 10
    .line 11
    int-to-float p1, p1

    .line 12
    mul-float/2addr p0, p1

    .line 13
    float-to-int p0, p0

    .line 14
    return p0
.end method

.method public k()[F
    .locals 9

    .line 1
    const/4 v0, 0x2

    .line 2
    new-array v1, v0, [F

    .line 3
    .line 4
    iget-object v2, p0, Lcom/p1/mobile/android/ui/bubble/BubbleView;->b:Lcom/p1/mobile/android/ui/bubble/a;

    .line 5
    .line 6
    const/4 v3, 0x1

    .line 7
    const/4 v4, 0x0

    .line 8
    if-nez v2, :cond_1

    .line 9
    .line 10
    iget-boolean v2, p0, Lcom/p1/mobile/android/ui/bubble/BubbleView;->q:Z

    .line 11
    .line 12
    if-eqz v2, :cond_0

    .line 13
    .line 14
    iget v0, p0, Lcom/p1/mobile/android/ui/bubble/BubbleView;->j:I

    .line 15
    .line 16
    int-to-float v0, v0

    .line 17
    aput v0, v1, v4

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 21
    .line 22
    .line 23
    move-result v2

    .line 24
    div-int/2addr v2, v0

    .line 25
    int-to-float v0, v2

    .line 26
    aput v0, v1, v4

    .line 27
    .line 28
    :goto_0
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 29
    .line 30
    .line 31
    move-result p0

    .line 32
    int-to-float p0, p0

    .line 33
    aput p0, v1, v3

    .line 34
    .line 35
    return-object v1

    .line 36
    :cond_1
    iget v5, v2, Lcom/p1/mobile/android/ui/bubble/a;->h:I

    .line 37
    .line 38
    int-to-double v5, v5

    .line 39
    const-wide v7, 0x4066800000000000L    # 180.0

    .line 40
    .line 41
    .line 42
    .line 43
    .line 44
    div-double/2addr v5, v7

    .line 45
    const-wide v7, 0x400921fb54442d18L    # Math.PI

    .line 46
    .line 47
    .line 48
    .line 49
    .line 50
    mul-double/2addr v5, v7

    .line 51
    const-wide/high16 v7, 0x4000000000000000L    # 2.0

    .line 52
    .line 53
    div-double/2addr v5, v7

    .line 54
    double-to-float v5, v5

    .line 55
    iget v6, v2, Lcom/p1/mobile/android/ui/bubble/a;->b:I

    .line 56
    .line 57
    sget v7, Lcom/p1/mobile/android/ui/bubble/a;->N:I

    .line 58
    .line 59
    and-int v8, v6, v7

    .line 60
    .line 61
    if-ne v8, v7, :cond_5

    .line 62
    .line 63
    const/4 v7, 0x0

    .line 64
    aput v7, v1, v3

    .line 65
    .line 66
    sget v3, Lcom/p1/mobile/android/ui/bubble/a;->O:I

    .line 67
    .line 68
    and-int v7, v6, v3

    .line 69
    .line 70
    if-ne v7, v3, :cond_2

    .line 71
    .line 72
    iget v0, v2, Lcom/p1/mobile/android/ui/bubble/a;->e:I

    .line 73
    .line 74
    iget p0, p0, Lcom/p1/mobile/android/ui/bubble/BubbleView;->o:I

    .line 75
    .line 76
    add-int/2addr v0, p0

    .line 77
    iget p0, v2, Lcom/p1/mobile/android/ui/bubble/a;->i:I

    .line 78
    .line 79
    add-int/2addr v0, p0

    .line 80
    int-to-float p0, v0

    .line 81
    add-float/2addr p0, v5

    .line 82
    aput p0, v1, v4

    .line 83
    .line 84
    return-object v1

    .line 85
    :cond_2
    sget v2, Lcom/p1/mobile/android/ui/bubble/a;->P:I

    .line 86
    .line 87
    and-int v3, v6, v2

    .line 88
    .line 89
    if-ne v3, v2, :cond_3

    .line 90
    .line 91
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 92
    .line 93
    .line 94
    move-result v0

    .line 95
    int-to-float v0, v0

    .line 96
    iget-object v2, p0, Lcom/p1/mobile/android/ui/bubble/BubbleView;->b:Lcom/p1/mobile/android/ui/bubble/a;

    .line 97
    .line 98
    iget v3, v2, Lcom/p1/mobile/android/ui/bubble/a;->e:I

    .line 99
    .line 100
    iget p0, p0, Lcom/p1/mobile/android/ui/bubble/BubbleView;->p:I

    .line 101
    .line 102
    add-int/2addr v3, p0

    .line 103
    iget p0, v2, Lcom/p1/mobile/android/ui/bubble/a;->i:I

    .line 104
    .line 105
    add-int/2addr v3, p0

    .line 106
    int-to-float p0, v3

    .line 107
    add-float/2addr p0, v5

    .line 108
    sub-float/2addr v0, p0

    .line 109
    aput v0, v1, v4

    .line 110
    .line 111
    return-object v1

    .line 112
    :cond_3
    iget-boolean v2, p0, Lcom/p1/mobile/android/ui/bubble/BubbleView;->q:Z

    .line 113
    .line 114
    if-eqz v2, :cond_4

    .line 115
    .line 116
    iget p0, p0, Lcom/p1/mobile/android/ui/bubble/BubbleView;->j:I

    .line 117
    .line 118
    int-to-float p0, p0

    .line 119
    aput p0, v1, v4

    .line 120
    .line 121
    return-object v1

    .line 122
    :cond_4
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 123
    .line 124
    .line 125
    move-result p0

    .line 126
    div-int/2addr p0, v0

    .line 127
    int-to-float p0, p0

    .line 128
    aput p0, v1, v4

    .line 129
    .line 130
    return-object v1

    .line 131
    :cond_5
    sget v2, Lcom/p1/mobile/android/ui/bubble/a;->Q:I

    .line 132
    .line 133
    and-int/2addr v6, v2

    .line 134
    if-ne v6, v2, :cond_9

    .line 135
    .line 136
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 137
    .line 138
    .line 139
    move-result v2

    .line 140
    int-to-float v2, v2

    .line 141
    aput v2, v1, v3

    .line 142
    .line 143
    iget-object v2, p0, Lcom/p1/mobile/android/ui/bubble/BubbleView;->b:Lcom/p1/mobile/android/ui/bubble/a;

    .line 144
    .line 145
    iget v3, v2, Lcom/p1/mobile/android/ui/bubble/a;->b:I

    .line 146
    .line 147
    sget v6, Lcom/p1/mobile/android/ui/bubble/a;->O:I

    .line 148
    .line 149
    and-int v7, v3, v6

    .line 150
    .line 151
    if-ne v7, v6, :cond_6

    .line 152
    .line 153
    iget v0, v2, Lcom/p1/mobile/android/ui/bubble/a;->e:I

    .line 154
    .line 155
    iget p0, p0, Lcom/p1/mobile/android/ui/bubble/BubbleView;->o:I

    .line 156
    .line 157
    add-int/2addr v0, p0

    .line 158
    iget p0, v2, Lcom/p1/mobile/android/ui/bubble/a;->i:I

    .line 159
    .line 160
    add-int/2addr v0, p0

    .line 161
    int-to-float p0, v0

    .line 162
    add-float/2addr p0, v5

    .line 163
    aput p0, v1, v4

    .line 164
    .line 165
    return-object v1

    .line 166
    :cond_6
    sget v2, Lcom/p1/mobile/android/ui/bubble/a;->P:I

    .line 167
    .line 168
    and-int/2addr v3, v2

    .line 169
    if-ne v3, v2, :cond_7

    .line 170
    .line 171
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 172
    .line 173
    .line 174
    move-result v0

    .line 175
    int-to-float v0, v0

    .line 176
    iget-object v2, p0, Lcom/p1/mobile/android/ui/bubble/BubbleView;->b:Lcom/p1/mobile/android/ui/bubble/a;

    .line 177
    .line 178
    iget v3, v2, Lcom/p1/mobile/android/ui/bubble/a;->e:I

    .line 179
    .line 180
    iget p0, p0, Lcom/p1/mobile/android/ui/bubble/BubbleView;->p:I

    .line 181
    .line 182
    add-int/2addr v3, p0

    .line 183
    iget p0, v2, Lcom/p1/mobile/android/ui/bubble/a;->i:I

    .line 184
    .line 185
    add-int/2addr v3, p0

    .line 186
    int-to-float p0, v3

    .line 187
    add-float/2addr p0, v5

    .line 188
    sub-float/2addr v0, p0

    .line 189
    aput v0, v1, v4

    .line 190
    .line 191
    return-object v1

    .line 192
    :cond_7
    iget-boolean v2, p0, Lcom/p1/mobile/android/ui/bubble/BubbleView;->q:Z

    .line 193
    .line 194
    if-eqz v2, :cond_8

    .line 195
    .line 196
    iget p0, p0, Lcom/p1/mobile/android/ui/bubble/BubbleView;->j:I

    .line 197
    .line 198
    int-to-float p0, p0

    .line 199
    aput p0, v1, v4

    .line 200
    .line 201
    return-object v1

    .line 202
    :cond_8
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 203
    .line 204
    .line 205
    move-result p0

    .line 206
    div-int/2addr p0, v0

    .line 207
    int-to-float p0, p0

    .line 208
    aput p0, v1, v4

    .line 209
    .line 210
    :cond_9
    return-object v1
.end method

.method public l()[I
    .locals 1

    .line 1
    iget v0, p0, Lcom/p1/mobile/android/ui/bubble/BubbleView;->k:I

    .line 2
    .line 3
    iget p0, p0, Lcom/p1/mobile/android/ui/bubble/BubbleView;->l:I

    .line 4
    .line 5
    filled-new-array {v0, p0}, [I

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public final m()Landroid/graphics/Path;
    .locals 26

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    new-instance v1, Landroid/graphics/Path;

    .line 4
    .line 5
    invoke-direct {v1}, Landroid/graphics/Path;-><init>()V

    .line 6
    .line 7
    .line 8
    iget-object v2, v0, Lcom/p1/mobile/android/ui/bubble/BubbleView;->a:Landroid/graphics/Paint;

    .line 9
    .line 10
    sget-object v3, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    .line 11
    .line 12
    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 13
    .line 14
    .line 15
    iget-object v2, v0, Lcom/p1/mobile/android/ui/bubble/BubbleView;->b:Lcom/p1/mobile/android/ui/bubble/a;

    .line 16
    .line 17
    iget v3, v2, Lcom/p1/mobile/android/ui/bubble/a;->e:I

    .line 18
    .line 19
    iget v4, v2, Lcom/p1/mobile/android/ui/bubble/a;->g:I

    .line 20
    .line 21
    add-int/2addr v4, v3

    .line 22
    iget v5, v2, Lcom/p1/mobile/android/ui/bubble/a;->b:I

    .line 23
    .line 24
    sget v6, Lcom/p1/mobile/android/ui/bubble/a;->Q:I

    .line 25
    .line 26
    and-int/2addr v5, v6

    .line 27
    if-ne v5, v6, :cond_0

    .line 28
    .line 29
    move v4, v3

    .line 30
    :cond_0
    iget v5, v0, Lcom/p1/mobile/android/ui/bubble/BubbleView;->o:I

    .line 31
    .line 32
    add-int/2addr v3, v5

    .line 33
    iget v2, v2, Lcom/p1/mobile/android/ui/bubble/a;->i:I

    .line 34
    .line 35
    add-int/2addr v2, v3

    .line 36
    int-to-float v2, v2

    .line 37
    int-to-float v5, v4

    .line 38
    invoke-virtual {v1, v2, v5}, Landroid/graphics/Path;->moveTo(FF)V

    .line 39
    .line 40
    .line 41
    iget-object v2, v0, Lcom/p1/mobile/android/ui/bubble/BubbleView;->b:Lcom/p1/mobile/android/ui/bubble/a;

    .line 42
    .line 43
    iget v6, v2, Lcom/p1/mobile/android/ui/bubble/a;->h:I

    .line 44
    .line 45
    int-to-double v6, v6

    .line 46
    const-wide v8, 0x4066800000000000L    # 180.0

    .line 47
    .line 48
    .line 49
    .line 50
    .line 51
    div-double/2addr v6, v8

    .line 52
    const-wide v8, 0x400921fb54442d18L    # Math.PI

    .line 53
    .line 54
    .line 55
    .line 56
    .line 57
    mul-double/2addr v6, v8

    .line 58
    const-wide/high16 v8, 0x4000000000000000L    # 2.0

    .line 59
    .line 60
    div-double/2addr v6, v8

    .line 61
    iget v8, v2, Lcom/p1/mobile/android/ui/bubble/a;->b:I

    .line 62
    .line 63
    sget v9, Lcom/p1/mobile/android/ui/bubble/a;->N:I

    .line 64
    .line 65
    and-int/2addr v8, v9

    .line 66
    if-ne v8, v9, :cond_1

    .line 67
    .line 68
    invoke-static {v6, v7}, Ljava/lang/Math;->tan(D)D

    .line 69
    .line 70
    .line 71
    move-result-wide v8

    .line 72
    iget-object v2, v0, Lcom/p1/mobile/android/ui/bubble/BubbleView;->b:Lcom/p1/mobile/android/ui/bubble/a;

    .line 73
    .line 74
    iget v2, v2, Lcom/p1/mobile/android/ui/bubble/a;->g:I

    .line 75
    .line 76
    int-to-double v10, v2

    .line 77
    mul-double/2addr v8, v10

    .line 78
    double-to-int v2, v8

    .line 79
    iget v8, v0, Lcom/p1/mobile/android/ui/bubble/BubbleView;->j:I

    .line 80
    .line 81
    add-int/2addr v8, v3

    .line 82
    sub-int/2addr v8, v2

    .line 83
    int-to-float v8, v8

    .line 84
    invoke-virtual {v1, v8, v5}, Landroid/graphics/Path;->lineTo(FF)V

    .line 85
    .line 86
    .line 87
    div-int/lit8 v8, v2, 0x3

    .line 88
    .line 89
    int-to-double v9, v8

    .line 90
    invoke-static {v6, v7}, Ljava/lang/Math;->tan(D)D

    .line 91
    .line 92
    .line 93
    move-result-wide v11

    .line 94
    div-double/2addr v9, v11

    .line 95
    double-to-int v9, v9

    .line 96
    iget v10, v0, Lcom/p1/mobile/android/ui/bubble/BubbleView;->j:I

    .line 97
    .line 98
    add-int/2addr v10, v3

    .line 99
    sub-int/2addr v10, v8

    .line 100
    int-to-float v10, v10

    .line 101
    iget-object v11, v0, Lcom/p1/mobile/android/ui/bubble/BubbleView;->b:Lcom/p1/mobile/android/ui/bubble/a;

    .line 102
    .line 103
    iget v11, v11, Lcom/p1/mobile/android/ui/bubble/a;->g:I

    .line 104
    .line 105
    sub-int v11, v4, v11

    .line 106
    .line 107
    add-int/2addr v11, v9

    .line 108
    int-to-float v11, v11

    .line 109
    invoke-virtual {v1, v10, v11}, Landroid/graphics/Path;->lineTo(FF)V

    .line 110
    .line 111
    .line 112
    iget v10, v0, Lcom/p1/mobile/android/ui/bubble/BubbleView;->j:I

    .line 113
    .line 114
    add-int v11, v3, v10

    .line 115
    .line 116
    int-to-float v11, v11

    .line 117
    iget-object v12, v0, Lcom/p1/mobile/android/ui/bubble/BubbleView;->b:Lcom/p1/mobile/android/ui/bubble/a;

    .line 118
    .line 119
    iget v12, v12, Lcom/p1/mobile/android/ui/bubble/a;->g:I

    .line 120
    .line 121
    sub-int v13, v4, v12

    .line 122
    .line 123
    int-to-float v13, v13

    .line 124
    add-int/2addr v10, v3

    .line 125
    add-int/2addr v10, v8

    .line 126
    int-to-float v8, v10

    .line 127
    sub-int v10, v4, v12

    .line 128
    .line 129
    add-int/2addr v10, v9

    .line 130
    int-to-float v9, v10

    .line 131
    invoke-virtual {v1, v11, v13, v8, v9}, Landroid/graphics/Path;->quadTo(FFFF)V

    .line 132
    .line 133
    .line 134
    iget v8, v0, Lcom/p1/mobile/android/ui/bubble/BubbleView;->j:I

    .line 135
    .line 136
    add-int/2addr v8, v3

    .line 137
    add-int/2addr v8, v2

    .line 138
    int-to-float v2, v8

    .line 139
    invoke-virtual {v1, v2, v5}, Landroid/graphics/Path;->lineTo(FF)V

    .line 140
    .line 141
    .line 142
    iget v2, v0, Lcom/p1/mobile/android/ui/bubble/BubbleView;->h:I

    .line 143
    .line 144
    add-int/2addr v2, v3

    .line 145
    iget-object v8, v0, Lcom/p1/mobile/android/ui/bubble/BubbleView;->b:Lcom/p1/mobile/android/ui/bubble/a;

    .line 146
    .line 147
    iget v8, v8, Lcom/p1/mobile/android/ui/bubble/a;->i:I

    .line 148
    .line 149
    sub-int/2addr v2, v8

    .line 150
    int-to-float v2, v2

    .line 151
    invoke-virtual {v1, v2, v5}, Landroid/graphics/Path;->lineTo(FF)V

    .line 152
    .line 153
    .line 154
    goto :goto_0

    .line 155
    :cond_1
    iget v8, v0, Lcom/p1/mobile/android/ui/bubble/BubbleView;->h:I

    .line 156
    .line 157
    add-int/2addr v8, v3

    .line 158
    iget v2, v2, Lcom/p1/mobile/android/ui/bubble/a;->i:I

    .line 159
    .line 160
    sub-int/2addr v8, v2

    .line 161
    int-to-float v2, v8

    .line 162
    invoke-virtual {v1, v2, v5}, Landroid/graphics/Path;->lineTo(FF)V

    .line 163
    .line 164
    .line 165
    :goto_0
    new-instance v2, Landroid/graphics/RectF;

    .line 166
    .line 167
    invoke-direct {v2}, Landroid/graphics/RectF;-><init>()V

    .line 168
    .line 169
    .line 170
    iget v8, v0, Lcom/p1/mobile/android/ui/bubble/BubbleView;->h:I

    .line 171
    .line 172
    add-int v9, v3, v8

    .line 173
    .line 174
    iget-object v10, v0, Lcom/p1/mobile/android/ui/bubble/BubbleView;->b:Lcom/p1/mobile/android/ui/bubble/a;

    .line 175
    .line 176
    iget v10, v10, Lcom/p1/mobile/android/ui/bubble/a;->i:I

    .line 177
    .line 178
    mul-int/lit8 v11, v10, 0x2

    .line 179
    .line 180
    sub-int/2addr v9, v11

    .line 181
    int-to-float v9, v9

    .line 182
    add-int/2addr v8, v3

    .line 183
    int-to-float v8, v8

    .line 184
    const/4 v11, 0x2

    .line 185
    mul-int/2addr v10, v11

    .line 186
    add-int/2addr v10, v4

    .line 187
    int-to-float v10, v10

    .line 188
    invoke-virtual {v2, v9, v5, v8, v10}, Landroid/graphics/RectF;->set(FFFF)V

    .line 189
    .line 190
    .line 191
    const/high16 v8, -0x3d4c0000    # -90.0f

    .line 192
    .line 193
    const/high16 v9, 0x42b40000    # 90.0f

    .line 194
    .line 195
    invoke-virtual {v1, v2, v8, v9}, Landroid/graphics/Path;->addArc(Landroid/graphics/RectF;FF)V

    .line 196
    .line 197
    .line 198
    iget v8, v0, Lcom/p1/mobile/android/ui/bubble/BubbleView;->h:I

    .line 199
    .line 200
    add-int/2addr v8, v3

    .line 201
    int-to-float v8, v8

    .line 202
    iget v10, v0, Lcom/p1/mobile/android/ui/bubble/BubbleView;->i:I

    .line 203
    .line 204
    add-int/2addr v10, v4

    .line 205
    iget-object v12, v0, Lcom/p1/mobile/android/ui/bubble/BubbleView;->b:Lcom/p1/mobile/android/ui/bubble/a;

    .line 206
    .line 207
    iget v12, v12, Lcom/p1/mobile/android/ui/bubble/a;->i:I

    .line 208
    .line 209
    sub-int/2addr v10, v12

    .line 210
    int-to-float v10, v10

    .line 211
    invoke-virtual {v1, v8, v10}, Landroid/graphics/Path;->lineTo(FF)V

    .line 212
    .line 213
    .line 214
    iget v8, v0, Lcom/p1/mobile/android/ui/bubble/BubbleView;->h:I

    .line 215
    .line 216
    add-int v10, v3, v8

    .line 217
    .line 218
    iget-object v12, v0, Lcom/p1/mobile/android/ui/bubble/BubbleView;->b:Lcom/p1/mobile/android/ui/bubble/a;

    .line 219
    .line 220
    iget v12, v12, Lcom/p1/mobile/android/ui/bubble/a;->i:I

    .line 221
    .line 222
    mul-int/lit8 v13, v12, 0x2

    .line 223
    .line 224
    sub-int/2addr v10, v13

    .line 225
    int-to-float v10, v10

    .line 226
    iget v13, v0, Lcom/p1/mobile/android/ui/bubble/BubbleView;->i:I

    .line 227
    .line 228
    add-int v14, v4, v13

    .line 229
    .line 230
    mul-int/2addr v12, v11

    .line 231
    sub-int/2addr v14, v12

    .line 232
    int-to-float v12, v14

    .line 233
    add-int/2addr v8, v3

    .line 234
    int-to-float v8, v8

    .line 235
    add-int/2addr v13, v4

    .line 236
    int-to-float v13, v13

    .line 237
    invoke-virtual {v2, v10, v12, v8, v13}, Landroid/graphics/RectF;->set(FFFF)V

    .line 238
    .line 239
    .line 240
    const/4 v8, 0x0

    .line 241
    const/4 v10, 0x0

    .line 242
    invoke-virtual {v1, v2, v8, v9, v10}, Landroid/graphics/Path;->arcTo(Landroid/graphics/RectF;FFZ)V

    .line 243
    .line 244
    .line 245
    iget-object v12, v0, Lcom/p1/mobile/android/ui/bubble/BubbleView;->b:Lcom/p1/mobile/android/ui/bubble/a;

    .line 246
    .line 247
    iget v13, v12, Lcom/p1/mobile/android/ui/bubble/a;->b:I

    .line 248
    .line 249
    sget v14, Lcom/p1/mobile/android/ui/bubble/a;->Q:I

    .line 250
    .line 251
    and-int/2addr v13, v14

    .line 252
    if-ne v13, v14, :cond_2

    .line 253
    .line 254
    invoke-static {v6, v7}, Ljava/lang/Math;->tan(D)D

    .line 255
    .line 256
    .line 257
    move-result-wide v12

    .line 258
    iget-object v14, v0, Lcom/p1/mobile/android/ui/bubble/BubbleView;->b:Lcom/p1/mobile/android/ui/bubble/a;

    .line 259
    .line 260
    iget v14, v14, Lcom/p1/mobile/android/ui/bubble/a;->g:I

    .line 261
    .line 262
    int-to-double v14, v14

    .line 263
    mul-double/2addr v12, v14

    .line 264
    double-to-int v12, v12

    .line 265
    div-int/lit8 v13, v12, 0x3

    .line 266
    .line 267
    int-to-double v14, v13

    .line 268
    invoke-static {v6, v7}, Ljava/lang/Math;->tan(D)D

    .line 269
    .line 270
    .line 271
    move-result-wide v6

    .line 272
    div-double/2addr v14, v6

    .line 273
    double-to-int v6, v14

    .line 274
    iget v7, v0, Lcom/p1/mobile/android/ui/bubble/BubbleView;->j:I

    .line 275
    .line 276
    add-int/2addr v7, v3

    .line 277
    add-int/2addr v7, v12

    .line 278
    int-to-float v7, v7

    .line 279
    iget v14, v0, Lcom/p1/mobile/android/ui/bubble/BubbleView;->i:I

    .line 280
    .line 281
    add-int/2addr v14, v4

    .line 282
    int-to-float v14, v14

    .line 283
    invoke-virtual {v1, v7, v14}, Landroid/graphics/Path;->lineTo(FF)V

    .line 284
    .line 285
    .line 286
    iget v7, v0, Lcom/p1/mobile/android/ui/bubble/BubbleView;->j:I

    .line 287
    .line 288
    add-int/2addr v7, v3

    .line 289
    add-int/2addr v7, v13

    .line 290
    int-to-float v7, v7

    .line 291
    iget v14, v0, Lcom/p1/mobile/android/ui/bubble/BubbleView;->i:I

    .line 292
    .line 293
    add-int/2addr v14, v4

    .line 294
    iget-object v15, v0, Lcom/p1/mobile/android/ui/bubble/BubbleView;->b:Lcom/p1/mobile/android/ui/bubble/a;

    .line 295
    .line 296
    iget v15, v15, Lcom/p1/mobile/android/ui/bubble/a;->g:I

    .line 297
    .line 298
    add-int/2addr v14, v15

    .line 299
    sub-int/2addr v14, v6

    .line 300
    int-to-float v14, v14

    .line 301
    invoke-virtual {v1, v7, v14}, Landroid/graphics/Path;->lineTo(FF)V

    .line 302
    .line 303
    .line 304
    iget v7, v0, Lcom/p1/mobile/android/ui/bubble/BubbleView;->j:I

    .line 305
    .line 306
    add-int v14, v3, v7

    .line 307
    .line 308
    int-to-float v14, v14

    .line 309
    iget v15, v0, Lcom/p1/mobile/android/ui/bubble/BubbleView;->i:I

    .line 310
    .line 311
    add-int v16, v4, v15

    .line 312
    .line 313
    iget-object v8, v0, Lcom/p1/mobile/android/ui/bubble/BubbleView;->b:Lcom/p1/mobile/android/ui/bubble/a;

    .line 314
    .line 315
    iget v8, v8, Lcom/p1/mobile/android/ui/bubble/a;->g:I

    .line 316
    .line 317
    move/from16 v17, v11

    .line 318
    .line 319
    add-int v11, v16, v8

    .line 320
    .line 321
    int-to-float v11, v11

    .line 322
    add-int/2addr v7, v3

    .line 323
    sub-int/2addr v7, v13

    .line 324
    int-to-float v7, v7

    .line 325
    add-int/2addr v15, v4

    .line 326
    add-int/2addr v15, v8

    .line 327
    sub-int/2addr v15, v6

    .line 328
    int-to-float v6, v15

    .line 329
    invoke-virtual {v1, v14, v11, v7, v6}, Landroid/graphics/Path;->quadTo(FFFF)V

    .line 330
    .line 331
    .line 332
    iget v6, v0, Lcom/p1/mobile/android/ui/bubble/BubbleView;->j:I

    .line 333
    .line 334
    add-int/2addr v6, v3

    .line 335
    sub-int/2addr v6, v12

    .line 336
    int-to-float v6, v6

    .line 337
    iget v7, v0, Lcom/p1/mobile/android/ui/bubble/BubbleView;->i:I

    .line 338
    .line 339
    add-int/2addr v7, v4

    .line 340
    int-to-float v7, v7

    .line 341
    invoke-virtual {v1, v6, v7}, Landroid/graphics/Path;->lineTo(FF)V

    .line 342
    .line 343
    .line 344
    iget-object v6, v0, Lcom/p1/mobile/android/ui/bubble/BubbleView;->b:Lcom/p1/mobile/android/ui/bubble/a;

    .line 345
    .line 346
    iget v6, v6, Lcom/p1/mobile/android/ui/bubble/a;->i:I

    .line 347
    .line 348
    add-int/2addr v6, v3

    .line 349
    int-to-float v6, v6

    .line 350
    iget v7, v0, Lcom/p1/mobile/android/ui/bubble/BubbleView;->i:I

    .line 351
    .line 352
    add-int/2addr v7, v4

    .line 353
    int-to-float v7, v7

    .line 354
    invoke-virtual {v1, v6, v7}, Landroid/graphics/Path;->lineTo(FF)V

    .line 355
    .line 356
    .line 357
    goto :goto_1

    .line 358
    :cond_2
    move/from16 v17, v11

    .line 359
    .line 360
    iget v6, v12, Lcom/p1/mobile/android/ui/bubble/a;->i:I

    .line 361
    .line 362
    add-int/2addr v6, v3

    .line 363
    int-to-float v6, v6

    .line 364
    iget v7, v0, Lcom/p1/mobile/android/ui/bubble/BubbleView;->i:I

    .line 365
    .line 366
    add-int/2addr v7, v4

    .line 367
    int-to-float v7, v7

    .line 368
    invoke-virtual {v1, v6, v7}, Landroid/graphics/Path;->lineTo(FF)V

    .line 369
    .line 370
    .line 371
    :goto_1
    int-to-float v6, v3

    .line 372
    iget v7, v0, Lcom/p1/mobile/android/ui/bubble/BubbleView;->i:I

    .line 373
    .line 374
    add-int v8, v4, v7

    .line 375
    .line 376
    iget-object v11, v0, Lcom/p1/mobile/android/ui/bubble/BubbleView;->b:Lcom/p1/mobile/android/ui/bubble/a;

    .line 377
    .line 378
    iget v11, v11, Lcom/p1/mobile/android/ui/bubble/a;->i:I

    .line 379
    .line 380
    mul-int/lit8 v12, v11, 0x2

    .line 381
    .line 382
    sub-int/2addr v8, v12

    .line 383
    int-to-float v8, v8

    .line 384
    mul-int/lit8 v11, v11, 0x2

    .line 385
    .line 386
    add-int/2addr v11, v3

    .line 387
    int-to-float v11, v11

    .line 388
    add-int/2addr v7, v4

    .line 389
    int-to-float v7, v7

    .line 390
    invoke-virtual {v2, v6, v8, v11, v7}, Landroid/graphics/RectF;->set(FFFF)V

    .line 391
    .line 392
    .line 393
    invoke-virtual {v1, v2, v9, v9, v10}, Landroid/graphics/Path;->arcTo(Landroid/graphics/RectF;FFZ)V

    .line 394
    .line 395
    .line 396
    iget-object v7, v0, Lcom/p1/mobile/android/ui/bubble/BubbleView;->b:Lcom/p1/mobile/android/ui/bubble/a;

    .line 397
    .line 398
    iget v7, v7, Lcom/p1/mobile/android/ui/bubble/a;->i:I

    .line 399
    .line 400
    add-int/2addr v7, v4

    .line 401
    int-to-float v7, v7

    .line 402
    invoke-virtual {v1, v6, v7}, Landroid/graphics/Path;->lineTo(FF)V

    .line 403
    .line 404
    .line 405
    iget-object v7, v0, Lcom/p1/mobile/android/ui/bubble/BubbleView;->b:Lcom/p1/mobile/android/ui/bubble/a;

    .line 406
    .line 407
    iget v7, v7, Lcom/p1/mobile/android/ui/bubble/a;->i:I

    .line 408
    .line 409
    mul-int/lit8 v8, v7, 0x2

    .line 410
    .line 411
    add-int/2addr v8, v3

    .line 412
    int-to-float v8, v8

    .line 413
    mul-int/lit8 v7, v7, 0x2

    .line 414
    .line 415
    add-int/2addr v4, v7

    .line 416
    int-to-float v4, v4

    .line 417
    invoke-virtual {v2, v6, v5, v8, v4}, Landroid/graphics/RectF;->set(FFFF)V

    .line 418
    .line 419
    .line 420
    const/high16 v4, 0x43340000    # 180.0f

    .line 421
    .line 422
    invoke-virtual {v1, v2, v4, v9, v10}, Landroid/graphics/Path;->arcTo(Landroid/graphics/RectF;FFZ)V

    .line 423
    .line 424
    .line 425
    iget-object v2, v0, Lcom/p1/mobile/android/ui/bubble/BubbleView;->b:Lcom/p1/mobile/android/ui/bubble/a;

    .line 426
    .line 427
    iget v2, v2, Lcom/p1/mobile/android/ui/bubble/a;->i:I

    .line 428
    .line 429
    add-int/2addr v2, v3

    .line 430
    int-to-float v2, v2

    .line 431
    invoke-virtual {v1, v2, v5}, Landroid/graphics/Path;->lineTo(FF)V

    .line 432
    .line 433
    .line 434
    invoke-virtual {v1}, Landroid/graphics/Path;->close()V

    .line 435
    .line 436
    .line 437
    iget-object v2, v0, Lcom/p1/mobile/android/ui/bubble/BubbleView;->b:Lcom/p1/mobile/android/ui/bubble/a;

    .line 438
    .line 439
    iget-object v4, v2, Lcom/p1/mobile/android/ui/bubble/a;->a:[I

    .line 440
    .line 441
    array-length v5, v4

    .line 442
    move/from16 v7, v17

    .line 443
    .line 444
    if-lt v5, v7, :cond_5

    .line 445
    .line 446
    iget-boolean v4, v2, Lcom/p1/mobile/android/ui/bubble/a;->x:Z

    .line 447
    .line 448
    if-eqz v4, :cond_3

    .line 449
    .line 450
    new-instance v18, Landroid/graphics/LinearGradient;

    .line 451
    .line 452
    iget v2, v0, Lcom/p1/mobile/android/ui/bubble/BubbleView;->h:I

    .line 453
    .line 454
    add-int/2addr v3, v2

    .line 455
    int-to-float v2, v3

    .line 456
    iget-object v3, v0, Lcom/p1/mobile/android/ui/bubble/BubbleView;->b:Lcom/p1/mobile/android/ui/bubble/a;

    .line 457
    .line 458
    iget-object v3, v3, Lcom/p1/mobile/android/ui/bubble/a;->a:[I

    .line 459
    .line 460
    const/16 v24, 0x0

    .line 461
    .line 462
    sget-object v25, Landroid/graphics/Shader$TileMode;->MIRROR:Landroid/graphics/Shader$TileMode;

    .line 463
    .line 464
    const/16 v20, 0x0

    .line 465
    .line 466
    const/16 v22, 0x0

    .line 467
    .line 468
    move/from16 v21, v2

    .line 469
    .line 470
    move-object/from16 v23, v3

    .line 471
    .line 472
    move/from16 v19, v6

    .line 473
    .line 474
    invoke-direct/range {v18 .. v25}, Landroid/graphics/LinearGradient;-><init>(FFFF[I[FLandroid/graphics/Shader$TileMode;)V

    .line 475
    .line 476
    .line 477
    move-object/from16 v2, v18

    .line 478
    .line 479
    iget-object v3, v0, Lcom/p1/mobile/android/ui/bubble/BubbleView;->a:Landroid/graphics/Paint;

    .line 480
    .line 481
    invoke-virtual {v3, v2}, Landroid/graphics/Paint;->setShader(Landroid/graphics/Shader;)Landroid/graphics/Shader;

    .line 482
    .line 483
    .line 484
    goto/16 :goto_4

    .line 485
    .line 486
    :cond_3
    move/from16 v19, v6

    .line 487
    .line 488
    iget v2, v2, Lcom/p1/mobile/android/ui/bubble/a;->b:I

    .line 489
    .line 490
    sget v3, Lcom/p1/mobile/android/ui/bubble/a;->Q:I

    .line 491
    .line 492
    and-int/2addr v2, v3

    .line 493
    if-ne v2, v3, :cond_4

    .line 494
    .line 495
    new-instance v18, Landroid/graphics/LinearGradient;

    .line 496
    .line 497
    iget-object v2, v0, Lcom/p1/mobile/android/ui/bubble/BubbleView;->b:Lcom/p1/mobile/android/ui/bubble/a;

    .line 498
    .line 499
    iget v3, v2, Lcom/p1/mobile/android/ui/bubble/a;->e:I

    .line 500
    .line 501
    int-to-float v4, v3

    .line 502
    iget v5, v0, Lcom/p1/mobile/android/ui/bubble/BubbleView;->e:I

    .line 503
    .line 504
    sub-int/2addr v5, v3

    .line 505
    iget v3, v2, Lcom/p1/mobile/android/ui/bubble/a;->g:I

    .line 506
    .line 507
    sub-int/2addr v5, v3

    .line 508
    int-to-float v3, v5

    .line 509
    iget-object v2, v2, Lcom/p1/mobile/android/ui/bubble/a;->a:[I

    .line 510
    .line 511
    const/16 v24, 0x0

    .line 512
    .line 513
    sget-object v25, Landroid/graphics/Shader$TileMode;->MIRROR:Landroid/graphics/Shader$TileMode;

    .line 514
    .line 515
    move/from16 v21, v19

    .line 516
    .line 517
    move-object/from16 v23, v2

    .line 518
    .line 519
    move/from16 v22, v3

    .line 520
    .line 521
    move/from16 v20, v4

    .line 522
    .line 523
    invoke-direct/range {v18 .. v25}, Landroid/graphics/LinearGradient;-><init>(FFFF[I[FLandroid/graphics/Shader$TileMode;)V

    .line 524
    .line 525
    .line 526
    :goto_2
    move-object/from16 v2, v18

    .line 527
    .line 528
    goto :goto_3

    .line 529
    :cond_4
    new-instance v18, Landroid/graphics/LinearGradient;

    .line 530
    .line 531
    iget-object v2, v0, Lcom/p1/mobile/android/ui/bubble/BubbleView;->b:Lcom/p1/mobile/android/ui/bubble/a;

    .line 532
    .line 533
    iget v3, v2, Lcom/p1/mobile/android/ui/bubble/a;->e:I

    .line 534
    .line 535
    iget v4, v2, Lcom/p1/mobile/android/ui/bubble/a;->g:I

    .line 536
    .line 537
    add-int/2addr v4, v3

    .line 538
    int-to-float v4, v4

    .line 539
    iget v5, v0, Lcom/p1/mobile/android/ui/bubble/BubbleView;->e:I

    .line 540
    .line 541
    sub-int/2addr v5, v3

    .line 542
    int-to-float v3, v5

    .line 543
    iget-object v2, v2, Lcom/p1/mobile/android/ui/bubble/a;->a:[I

    .line 544
    .line 545
    const/16 v24, 0x0

    .line 546
    .line 547
    sget-object v25, Landroid/graphics/Shader$TileMode;->MIRROR:Landroid/graphics/Shader$TileMode;

    .line 548
    .line 549
    move/from16 v21, v19

    .line 550
    .line 551
    move-object/from16 v23, v2

    .line 552
    .line 553
    move/from16 v22, v3

    .line 554
    .line 555
    move/from16 v20, v4

    .line 556
    .line 557
    invoke-direct/range {v18 .. v25}, Landroid/graphics/LinearGradient;-><init>(FFFF[I[FLandroid/graphics/Shader$TileMode;)V

    .line 558
    .line 559
    .line 560
    goto :goto_2

    .line 561
    :goto_3
    iget-object v3, v0, Lcom/p1/mobile/android/ui/bubble/BubbleView;->a:Landroid/graphics/Paint;

    .line 562
    .line 563
    invoke-virtual {v3, v2}, Landroid/graphics/Paint;->setShader(Landroid/graphics/Shader;)Landroid/graphics/Shader;

    .line 564
    .line 565
    .line 566
    goto :goto_4

    .line 567
    :cond_5
    move/from16 v19, v6

    .line 568
    .line 569
    array-length v2, v4

    .line 570
    const/4 v5, 0x1

    .line 571
    if-ne v2, v5, :cond_6

    .line 572
    .line 573
    iget-object v2, v0, Lcom/p1/mobile/android/ui/bubble/BubbleView;->a:Landroid/graphics/Paint;

    .line 574
    .line 575
    aget v3, v4, v10

    .line 576
    .line 577
    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setColor(I)V

    .line 578
    .line 579
    .line 580
    goto :goto_4

    .line 581
    :cond_6
    new-instance v18, Landroid/graphics/LinearGradient;

    .line 582
    .line 583
    iget v2, v0, Lcom/p1/mobile/android/ui/bubble/BubbleView;->h:I

    .line 584
    .line 585
    add-int/2addr v3, v2

    .line 586
    int-to-float v2, v3

    .line 587
    const v3, -0x86acd

    .line 588
    .line 589
    .line 590
    const v4, -0x83ccd

    .line 591
    .line 592
    .line 593
    filled-new-array {v3, v4}, [I

    .line 594
    .line 595
    .line 596
    move-result-object v23

    .line 597
    const/16 v24, 0x0

    .line 598
    .line 599
    sget-object v25, Landroid/graphics/Shader$TileMode;->MIRROR:Landroid/graphics/Shader$TileMode;

    .line 600
    .line 601
    const/16 v20, 0x0

    .line 602
    .line 603
    const/16 v22, 0x0

    .line 604
    .line 605
    move/from16 v21, v2

    .line 606
    .line 607
    invoke-direct/range {v18 .. v25}, Landroid/graphics/LinearGradient;-><init>(FFFF[I[FLandroid/graphics/Shader$TileMode;)V

    .line 608
    .line 609
    .line 610
    move-object/from16 v2, v18

    .line 611
    .line 612
    iget-object v3, v0, Lcom/p1/mobile/android/ui/bubble/BubbleView;->a:Landroid/graphics/Paint;

    .line 613
    .line 614
    invoke-virtual {v3, v2}, Landroid/graphics/Paint;->setShader(Landroid/graphics/Shader;)Landroid/graphics/Shader;

    .line 615
    .line 616
    .line 617
    :goto_4
    iget-object v2, v0, Lcom/p1/mobile/android/ui/bubble/BubbleView;->b:Lcom/p1/mobile/android/ui/bubble/a;

    .line 618
    .line 619
    iget v2, v2, Lcom/p1/mobile/android/ui/bubble/a;->f:I

    .line 620
    .line 621
    if-lez v2, :cond_7

    .line 622
    .line 623
    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 624
    .line 625
    .line 626
    move-result-object v2

    .line 627
    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 628
    .line 629
    .line 630
    move-result-object v2

    .line 631
    iget-object v3, v0, Lcom/p1/mobile/android/ui/bubble/BubbleView;->b:Lcom/p1/mobile/android/ui/bubble/a;

    .line 632
    .line 633
    iget v3, v3, Lcom/p1/mobile/android/ui/bubble/a;->f:I

    .line 634
    .line 635
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getColor(I)I

    .line 636
    .line 637
    .line 638
    move-result v2

    .line 639
    goto :goto_5

    .line 640
    :cond_7
    const/high16 v2, 0x19000000

    .line 641
    .line 642
    :goto_5
    iget-object v3, v0, Lcom/p1/mobile/android/ui/bubble/BubbleView;->a:Landroid/graphics/Paint;

    .line 643
    .line 644
    iget-object v4, v0, Lcom/p1/mobile/android/ui/bubble/BubbleView;->b:Lcom/p1/mobile/android/ui/bubble/a;

    .line 645
    .line 646
    iget v4, v4, Lcom/p1/mobile/android/ui/bubble/a;->e:I

    .line 647
    .line 648
    int-to-float v4, v4

    .line 649
    const/4 v7, 0x2

    .line 650
    invoke-virtual {v0, v7}, Lcom/p1/mobile/android/ui/bubble/BubbleView;->j(I)I

    .line 651
    .line 652
    .line 653
    move-result v0

    .line 654
    int-to-float v0, v0

    .line 655
    const/4 v5, 0x0

    .line 656
    invoke-virtual {v3, v4, v5, v0, v2}, Landroid/graphics/Paint;->setShadowLayer(FFFI)V

    .line 657
    .line 658
    .line 659
    return-object v1
.end method

.method public final n()V
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0}, Landroid/view/View;->setWillNotDraw(Z)V

    .line 3
    .line 4
    .line 5
    new-instance v1, Landroid/graphics/Paint;

    .line 6
    .line 7
    invoke-direct {v1}, Landroid/graphics/Paint;-><init>()V

    .line 8
    .line 9
    .line 10
    iput-object v1, p0, Lcom/p1/mobile/android/ui/bubble/BubbleView;->a:Landroid/graphics/Paint;

    .line 11
    .line 12
    const/4 v2, 0x1

    .line 13
    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 14
    .line 15
    .line 16
    iget-object v1, p0, Lcom/p1/mobile/android/ui/bubble/BubbleView;->a:Landroid/graphics/Paint;

    .line 17
    .line 18
    const v2, -0xff0100

    .line 19
    .line 20
    .line 21
    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setColor(I)V

    .line 22
    .line 23
    .line 24
    iget-object v1, p0, Lcom/p1/mobile/android/ui/bubble/BubbleView;->a:Landroid/graphics/Paint;

    .line 25
    .line 26
    invoke-virtual {p0, v0, v1}, Landroid/view/View;->setLayerType(ILandroid/graphics/Paint;)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public final synthetic o()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/ui/bubble/BubbleView;->i()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Lcom/p1/mobile/android/ui/bubble/d;->l()Lcom/p1/mobile/android/ui/bubble/d;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iget-object p0, p0, Lcom/p1/mobile/android/ui/bubble/BubbleView;->n:Ljava/lang/String;

    .line 9
    .line 10
    invoke-virtual {v0, p0}, Lcom/p1/mobile/android/ui/bubble/d;->k(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/android/ui/bubble/d;->l()Lcom/p1/mobile/android/ui/bubble/d;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iget-object v0, p0, Lcom/p1/mobile/android/ui/bubble/BubbleView;->n:Ljava/lang/String;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/android/ui/bubble/BubbleView;->b:Lcom/p1/mobile/android/ui/bubble/a;

    .line 8
    .line 9
    iget-boolean p0, p0, Lcom/p1/mobile/android/ui/bubble/a;->n:Z

    .line 10
    .line 11
    invoke-virtual {p1, v0, p0}, Lcom/p1/mobile/android/ui/bubble/d;->i(Ljava/lang/String;Z)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public onDraw(Landroid/graphics/Canvas;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Landroid/view/View;->onDraw(Landroid/graphics/Canvas;)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/android/ui/bubble/BubbleView;->b:Lcom/p1/mobile/android/ui/bubble/a;

    .line 5
    .line 6
    if-eqz v0, :cond_1

    .line 7
    .line 8
    iget-object v0, p0, Lcom/p1/mobile/android/ui/bubble/BubbleView;->c:Landroid/graphics/Path;

    .line 9
    .line 10
    if-nez v0, :cond_0

    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/android/ui/bubble/BubbleView;->a:Landroid/graphics/Paint;

    .line 14
    .line 15
    invoke-virtual {p1, v0, p0}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 16
    .line 17
    .line 18
    :cond_1
    :goto_0
    return-void
.end method

.method public onLayout(ZIIII)V
    .locals 0

    .line 1
    invoke-super/range {p0 .. p5}, Landroid/widget/FrameLayout;->onLayout(ZIIII)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/android/ui/bubble/BubbleView;->k()[F

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    const/4 p2, 0x0

    .line 9
    aget p2, p1, p2

    .line 10
    .line 11
    invoke-virtual {p0, p2}, Landroid/view/View;->setPivotX(F)V

    .line 12
    .line 13
    .line 14
    const/4 p2, 0x1

    .line 15
    aget p1, p1, p2

    .line 16
    .line 17
    invoke-virtual {p0, p1}, Landroid/view/View;->setPivotY(F)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public onMeasure(II)V
    .locals 0

    .line 1
    iget p1, p0, Lcom/p1/mobile/android/ui/bubble/BubbleView;->d:I

    .line 2
    .line 3
    iget p2, p0, Lcom/p1/mobile/android/ui/bubble/BubbleView;->e:I

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2}, Landroid/view/View;->setMeasuredDimension(II)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic p(Ll/bge;FF)V
    .locals 0

    .line 1
    const/high16 p1, 0x447a0000    # 1000.0f

    .line 2
    .line 3
    div-float/2addr p2, p1

    .line 4
    invoke-virtual {p0, p2}, Landroid/view/View;->setScaleX(F)V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0, p2}, Landroid/view/View;->setScaleY(F)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final q()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/android/ui/bubble/BubbleView;->m:Lcom/p1/mobile/android/ui/bubble/BubbleView$a;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Lcom/p1/mobile/android/ui/bubble/BubbleView$a;

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    invoke-direct {v0, p0, v1}, Lcom/p1/mobile/android/ui/bubble/BubbleView$a;-><init>(Lcom/p1/mobile/android/ui/bubble/BubbleView;Ll/ng3;)V

    .line 9
    .line 10
    .line 11
    iput-object v0, p0, Lcom/p1/mobile/android/ui/bubble/BubbleView;->m:Lcom/p1/mobile/android/ui/bubble/BubbleView$a;

    .line 12
    .line 13
    iget-object v1, p0, Lcom/p1/mobile/android/ui/bubble/BubbleView;->b:Lcom/p1/mobile/android/ui/bubble/a;

    .line 14
    .line 15
    iget-wide v1, v1, Lcom/p1/mobile/android/ui/bubble/a;->j:J

    .line 16
    .line 17
    invoke-virtual {p0, v0, v1, v2}, Landroid/view/View;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 18
    .line 19
    .line 20
    :cond_0
    return-void
.end method

.method public final r(II)V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/android/ui/bubble/BubbleView;->b:Lcom/p1/mobile/android/ui/bubble/a;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/android/ui/bubble/a;->w:Landroid/view/View;

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    check-cast v0, Landroid/widget/FrameLayout$LayoutParams;

    .line 10
    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    new-instance v0, Landroid/widget/FrameLayout$LayoutParams;

    .line 14
    .line 15
    const/4 v1, -0x2

    .line 16
    invoke-direct {v0, v1, v1}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 17
    .line 18
    .line 19
    :cond_0
    iget-object v1, p0, Lcom/p1/mobile/android/ui/bubble/BubbleView;->b:Lcom/p1/mobile/android/ui/bubble/a;

    .line 20
    .line 21
    iget v2, v1, Lcom/p1/mobile/android/ui/bubble/a;->b:I

    .line 22
    .line 23
    sget v3, Lcom/p1/mobile/android/ui/bubble/a;->Q:I

    .line 24
    .line 25
    and-int/2addr v2, v3

    .line 26
    if-ne v2, v3, :cond_1

    .line 27
    .line 28
    iget v2, v1, Lcom/p1/mobile/android/ui/bubble/a;->e:I

    .line 29
    .line 30
    iput v2, v0, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 31
    .line 32
    iget p0, p0, Lcom/p1/mobile/android/ui/bubble/BubbleView;->o:I

    .line 33
    .line 34
    add-int/2addr v2, p0

    .line 35
    iput v2, v0, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I

    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_1
    iget v2, v1, Lcom/p1/mobile/android/ui/bubble/a;->e:I

    .line 39
    .line 40
    iget v3, v1, Lcom/p1/mobile/android/ui/bubble/a;->g:I

    .line 41
    .line 42
    add-int/2addr v3, v2

    .line 43
    iput v3, v0, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 44
    .line 45
    iget p0, p0, Lcom/p1/mobile/android/ui/bubble/BubbleView;->o:I

    .line 46
    .line 47
    add-int/2addr v2, p0

    .line 48
    iput v2, v0, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I

    .line 49
    .line 50
    :goto_0
    iput p1, v0, Landroid/widget/FrameLayout$LayoutParams;->width:I

    .line 51
    .line 52
    iput p2, v0, Landroid/widget/FrameLayout$LayoutParams;->height:I

    .line 53
    .line 54
    iget-object p0, v1, Lcom/p1/mobile/android/ui/bubble/a;->w:Landroid/view/View;

    .line 55
    .line 56
    invoke-virtual {p0, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 57
    .line 58
    .line 59
    return-void
.end method

.method public s(Lcom/p1/mobile/android/ui/bubble/a;Landroid/graphics/Rect;IILjava/lang/String;)V
    .locals 2

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/android/ui/bubble/BubbleView;->b:Lcom/p1/mobile/android/ui/bubble/a;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/android/ui/bubble/a;->w:Landroid/view/View;

    .line 4
    .line 5
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    if-eqz p1, :cond_1

    .line 10
    .line 11
    iget-object p1, p0, Lcom/p1/mobile/android/ui/bubble/BubbleView;->b:Lcom/p1/mobile/android/ui/bubble/a;

    .line 12
    .line 13
    iget-object p1, p1, Lcom/p1/mobile/android/ui/bubble/a;->w:Landroid/view/View;

    .line 14
    .line 15
    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-eqz v0, :cond_0

    .line 24
    .line 25
    instance-of v0, p1, Landroid/view/ViewGroup;

    .line 26
    .line 27
    if-eqz v0, :cond_0

    .line 28
    .line 29
    check-cast p1, Landroid/view/ViewGroup;

    .line 30
    .line 31
    iget-object v0, p0, Lcom/p1/mobile/android/ui/bubble/BubbleView;->b:Lcom/p1/mobile/android/ui/bubble/a;

    .line 32
    .line 33
    iget-object v0, v0, Lcom/p1/mobile/android/ui/bubble/a;->w:Landroid/view/View;

    .line 34
    .line 35
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 36
    .line 37
    .line 38
    new-instance p1, Ljava/lang/Exception;

    .line 39
    .line 40
    new-instance v0, Ljava/lang/StringBuilder;

    .line 41
    .line 42
    const-string v1, "bubble customView hasParent = "

    .line 43
    .line 44
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 45
    .line 46
    .line 47
    invoke-virtual {v0, p5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 48
    .line 49
    .line 50
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object p5

    .line 54
    invoke-direct {p1, p5}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    .line 55
    .line 56
    .line 57
    const/16 p5, 0xa

    .line 58
    .line 59
    invoke-static {p1, p5}, Lcom/tantanapp/common/utils/CrashHelper;->d(Ljava/lang/Throwable;I)V

    .line 60
    .line 61
    .line 62
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/android/ui/bubble/BubbleView;->b:Lcom/p1/mobile/android/ui/bubble/a;

    .line 63
    .line 64
    iget-object p1, p1, Lcom/p1/mobile/android/ui/bubble/a;->w:Landroid/view/View;

    .line 65
    .line 66
    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 67
    .line 68
    .line 69
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/android/ui/bubble/BubbleView;->b:Lcom/p1/mobile/android/ui/bubble/a;

    .line 70
    .line 71
    if-eqz p1, :cond_2

    .line 72
    .line 73
    iget-boolean p1, p1, Lcom/p1/mobile/android/ui/bubble/a;->E:Z

    .line 74
    .line 75
    if-eqz p1, :cond_2

    .line 76
    .line 77
    new-instance p1, Lcom/p1/mobile/android/ui/bubble/h;

    .line 78
    .line 79
    invoke-direct {p1}, Lcom/p1/mobile/android/ui/bubble/h;-><init>()V

    .line 80
    .line 81
    .line 82
    invoke-virtual {p0, p1}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 83
    .line 84
    .line 85
    goto :goto_0

    .line 86
    :cond_2
    invoke-virtual {p0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 87
    .line 88
    .line 89
    :goto_0
    invoke-virtual {p0, p2, p3, p4}, Lcom/p1/mobile/android/ui/bubble/BubbleView;->h(Landroid/graphics/Rect;II)V

    .line 90
    .line 91
    .line 92
    return-void
.end method

.method public t(Ljava/lang/String;)V
    .locals 4

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/android/ui/bubble/BubbleView;->n:Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/android/ui/bubble/BubbleView;->m()Landroid/graphics/Path;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    iput-object p1, p0, Lcom/p1/mobile/android/ui/bubble/BubbleView;->c:Landroid/graphics/Path;

    .line 8
    .line 9
    invoke-virtual {p0}, Landroid/view/View;->requestLayout()V

    .line 10
    .line 11
    .line 12
    new-instance p1, Ll/zsi;

    .line 13
    .line 14
    const/4 v0, 0x0

    .line 15
    invoke-direct {p1, v0}, Ll/zsi;-><init>(F)V

    .line 16
    .line 17
    .line 18
    new-instance v1, Ll/ezf0;

    .line 19
    .line 20
    invoke-direct {v1}, Ll/ezf0;-><init>()V

    .line 21
    .line 22
    .line 23
    const v2, 0x3f1c28f6    # 0.61f

    .line 24
    .line 25
    .line 26
    invoke-virtual {v1, v2}, Ll/ezf0;->d(F)Ll/ezf0;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    const/high16 v2, 0x44160000    # 600.0f

    .line 31
    .line 32
    invoke-virtual {v1, v2}, Ll/ezf0;->f(F)Ll/ezf0;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    new-instance v2, Ll/tyf0;

    .line 37
    .line 38
    invoke-direct {v2, p1}, Ll/tyf0;-><init>(Ll/zsi;)V

    .line 39
    .line 40
    .line 41
    invoke-virtual {v2, v1}, Ll/tyf0;->r(Ll/ezf0;)Ll/tyf0;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    invoke-virtual {p1, v0}, Ll/bge;->j(F)Ll/bge;

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    check-cast p1, Ll/tyf0;

    .line 50
    .line 51
    new-instance v1, Lcom/p1/mobile/android/ui/bubble/g;

    .line 52
    .line 53
    invoke-direct {v1, p0}, Lcom/p1/mobile/android/ui/bubble/g;-><init>(Lcom/p1/mobile/android/ui/bubble/BubbleView;)V

    .line 54
    .line 55
    .line 56
    invoke-virtual {p1, v1}, Ll/bge;->b(Ll/bge$r;)Ll/bge;

    .line 57
    .line 58
    .line 59
    invoke-virtual {p1, v0}, Ll/bge;->j(F)Ll/bge;

    .line 60
    .line 61
    .line 62
    move-result-object p1

    .line 63
    check-cast p1, Ll/tyf0;

    .line 64
    .line 65
    const/high16 v0, 0x447a0000    # 1000.0f

    .line 66
    .line 67
    invoke-virtual {p1, v0}, Ll/tyf0;->o(F)V

    .line 68
    .line 69
    .line 70
    iget-object p1, p0, Lcom/p1/mobile/android/ui/bubble/BubbleView;->b:Lcom/p1/mobile/android/ui/bubble/a;

    .line 71
    .line 72
    iget-wide v0, p1, Lcom/p1/mobile/android/ui/bubble/a;->j:J

    .line 73
    .line 74
    const-wide/16 v2, 0x0

    .line 75
    .line 76
    cmp-long p1, v0, v2

    .line 77
    .line 78
    if-lez p1, :cond_0

    .line 79
    .line 80
    invoke-virtual {p0}, Lcom/p1/mobile/android/ui/bubble/BubbleView;->q()V

    .line 81
    .line 82
    .line 83
    :cond_0
    return-void
.end method

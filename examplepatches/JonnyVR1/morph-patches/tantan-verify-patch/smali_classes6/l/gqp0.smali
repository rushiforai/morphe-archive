.class public Ll/gqp0;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final a:I

.field public static final b:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const/high16 v0, 0x41600000    # 14.0f

    .line 2
    .line 3
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    sput v0, Ll/gqp0;->a:I

    .line 8
    .line 9
    const/high16 v0, 0x41800000    # 16.0f

    .line 10
    .line 11
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    sput v0, Ll/gqp0;->b:I

    .line 16
    .line 17
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic a(Landroid/widget/PopupWindow;Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/widget/PopupWindow;->dismiss()V

    .line 2
    .line 3
    .line 4
    const/4 p0, 0x1

    .line 5
    return p0
.end method

.method public static b(Landroid/view/View;[ILjava/lang/String;)Landroid/util/Pair;
    .locals 12
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/view/View;",
            "[I",
            "Ljava/lang/String;",
            ")",
            "Landroid/util/Pair<",
            "Landroid/view/View;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    sget v1, Ll/tec0;->N3:I

    .line 10
    .line 11
    const/4 v2, 0x0

    .line 12
    invoke-virtual {v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    const/4 v1, 0x1

    .line 17
    aget v2, p1, v1

    .line 18
    .line 19
    invoke-static {}, Ll/bnl0;->w0()I

    .line 20
    .line 21
    .line 22
    move-result v3

    .line 23
    const/4 v4, 0x2

    .line 24
    div-int/2addr v3, v4

    .line 25
    const/4 v5, 0x0

    .line 26
    if-le v2, v3, :cond_0

    .line 27
    .line 28
    move v2, v1

    .line 29
    goto :goto_0

    .line 30
    :cond_0
    move v2, v5

    .line 31
    :goto_0
    sget v3, Ll/hdc0;->a2:I

    .line 32
    .line 33
    invoke-virtual {v0, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 34
    .line 35
    .line 36
    move-result-object v3

    .line 37
    check-cast v3, Landroid/widget/TextView;

    .line 38
    .line 39
    invoke-virtual {v3, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 40
    .line 41
    .line 42
    const/high16 p2, 0x41600000    # 14.0f

    .line 43
    .line 44
    invoke-static {p2}, Ll/qa00;->d(F)I

    .line 45
    .line 46
    .line 47
    move-result p2

    .line 48
    const/high16 v6, 0x41300000    # 11.0f

    .line 49
    .line 50
    invoke-static {v6}, Ll/qa00;->d(F)I

    .line 51
    .line 52
    .line 53
    move-result v6

    .line 54
    const/high16 v7, 0x41b80000    # 23.0f

    .line 55
    .line 56
    invoke-static {v7}, Ll/qa00;->d(F)I

    .line 57
    .line 58
    .line 59
    move-result v7

    .line 60
    const/high16 v8, 0x41a00000    # 20.0f

    .line 61
    .line 62
    invoke-static {v8}, Ll/qa00;->d(F)I

    .line 63
    .line 64
    .line 65
    move-result v8

    .line 66
    const/high16 v9, 0x41000000    # 8.0f

    .line 67
    .line 68
    invoke-static {v9}, Ll/qa00;->d(F)I

    .line 69
    .line 70
    .line 71
    move-result v9

    .line 72
    const/high16 v10, 0x432c0000    # 172.0f

    .line 73
    .line 74
    invoke-static {v10}, Ll/qa00;->d(F)I

    .line 75
    .line 76
    .line 77
    move-result v10

    .line 78
    div-int/2addr v10, v4

    .line 79
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 80
    .line 81
    .line 82
    move-result p0

    .line 83
    div-int/2addr p0, v4

    .line 84
    invoke-static {}, Ll/bnl0;->y0()I

    .line 85
    .line 86
    .line 87
    move-result v11

    .line 88
    if-eqz v2, :cond_3

    .line 89
    .line 90
    invoke-virtual {v3, p2, v6, p2, v7}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 91
    .line 92
    .line 93
    aget p1, p1, v5

    .line 94
    .line 95
    add-int p2, p1, p0

    .line 96
    .line 97
    sub-int/2addr p2, v9

    .line 98
    if-ge p2, v10, :cond_1

    .line 99
    .line 100
    sget p0, Ll/lbc0;->W5:I

    .line 101
    .line 102
    invoke-virtual {v3, p0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 103
    .line 104
    .line 105
    const/4 v1, 0x4

    .line 106
    goto :goto_1

    .line 107
    :cond_1
    sub-int/2addr v11, p1

    .line 108
    sub-int/2addr v11, p0

    .line 109
    sub-int/2addr v11, v9

    .line 110
    if-ge v11, v10, :cond_2

    .line 111
    .line 112
    sget p0, Ll/lbc0;->Y5:I

    .line 113
    .line 114
    invoke-virtual {v3, p0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 115
    .line 116
    .line 117
    const/4 v1, 0x5

    .line 118
    goto :goto_1

    .line 119
    :cond_2
    sget p0, Ll/lbc0;->U5:I

    .line 120
    .line 121
    invoke-virtual {v3, p0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 122
    .line 123
    .line 124
    goto :goto_1

    .line 125
    :cond_3
    invoke-virtual {v3, p2, v8, p2, p2}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 126
    .line 127
    .line 128
    aget p1, p1, v5

    .line 129
    .line 130
    add-int p2, p1, p0

    .line 131
    .line 132
    sub-int/2addr p2, v9

    .line 133
    if-ge p2, v10, :cond_4

    .line 134
    .line 135
    sget p0, Ll/lbc0;->X5:I

    .line 136
    .line 137
    invoke-virtual {v3, p0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 138
    .line 139
    .line 140
    move v1, v4

    .line 141
    goto :goto_1

    .line 142
    :cond_4
    sub-int/2addr v11, p1

    .line 143
    sub-int/2addr v11, p0

    .line 144
    sub-int/2addr v11, v9

    .line 145
    if-ge v11, v10, :cond_5

    .line 146
    .line 147
    sget p0, Ll/lbc0;->Z5:I

    .line 148
    .line 149
    invoke-virtual {v3, p0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 150
    .line 151
    .line 152
    const/4 v1, 0x3

    .line 153
    goto :goto_1

    .line 154
    :cond_5
    sget p0, Ll/lbc0;->V5:I

    .line 155
    .line 156
    invoke-virtual {v3, p0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 157
    .line 158
    .line 159
    move v1, v5

    .line 160
    :goto_1
    new-instance p0, Landroid/util/Pair;

    .line 161
    .line 162
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 163
    .line 164
    .line 165
    move-result-object p1

    .line 166
    invoke-direct {p0, v0, p1}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 167
    .line 168
    .line 169
    return-object p0
.end method

.method public static c(Ljava/lang/String;Lv/VDraweeView;I)V
    .locals 2

    .line 1
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 2
    .line 3
    new-instance v1, Ll/gqp0$a;

    .line 4
    .line 5
    invoke-direct {v1, p2, p1}, Ll/gqp0$a;-><init>(ILv/VDraweeView;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p1, p0, v1}, Ll/fsb0;->M0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;Ll/fn2;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public static d(Landroid/view/View;[ILandroid/widget/PopupWindow;I)V
    .locals 7

    .line 1
    invoke-virtual {p2}, Landroid/widget/PopupWindow;->getContentView()Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Landroid/view/View;->getMeasuredWidth()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    invoke-virtual {p2}, Landroid/widget/PopupWindow;->getContentView()Landroid/view/View;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-virtual {v1}, Landroid/view/View;->getMeasuredHeight()I

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    const/high16 v2, 0x40000000    # 2.0f

    .line 18
    .line 19
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 20
    .line 21
    .line 22
    move-result v2

    .line 23
    const/high16 v3, 0x40800000    # 4.0f

    .line 24
    .line 25
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 26
    .line 27
    .line 28
    move-result v3

    .line 29
    const/4 v4, 0x2

    .line 30
    const/4 v5, 0x1

    .line 31
    const/4 v6, 0x0

    .line 32
    if-eqz p3, :cond_5

    .line 33
    .line 34
    if-eq p3, v5, :cond_4

    .line 35
    .line 36
    if-eq p3, v4, :cond_3

    .line 37
    .line 38
    const/4 v4, 0x3

    .line 39
    if-eq p3, v4, :cond_2

    .line 40
    .line 41
    const/4 v4, 0x4

    .line 42
    if-eq p3, v4, :cond_1

    .line 43
    .line 44
    const/4 v4, 0x5

    .line 45
    if-eq p3, v4, :cond_0

    .line 46
    .line 47
    return-void

    .line 48
    :cond_0
    aget p3, p1, v6

    .line 49
    .line 50
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 51
    .line 52
    .line 53
    move-result v4

    .line 54
    add-int/2addr p3, v4

    .line 55
    sub-int/2addr p3, v0

    .line 56
    add-int/2addr p3, v3

    .line 57
    aget p1, p1, v5

    .line 58
    .line 59
    sub-int/2addr p1, v1

    .line 60
    sub-int/2addr p1, v2

    .line 61
    invoke-virtual {p2, p0, v6, p3, p1}, Landroid/widget/PopupWindow;->showAtLocation(Landroid/view/View;III)V

    .line 62
    .line 63
    .line 64
    return-void

    .line 65
    :cond_1
    aget p3, p1, v6

    .line 66
    .line 67
    sub-int/2addr p3, v3

    .line 68
    aget p1, p1, v5

    .line 69
    .line 70
    sub-int/2addr p1, v1

    .line 71
    sub-int/2addr p1, v2

    .line 72
    invoke-virtual {p2, p0, v6, p3, p1}, Landroid/widget/PopupWindow;->showAtLocation(Landroid/view/View;III)V

    .line 73
    .line 74
    .line 75
    return-void

    .line 76
    :cond_2
    aget p3, p1, v6

    .line 77
    .line 78
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 79
    .line 80
    .line 81
    move-result v1

    .line 82
    add-int/2addr p3, v1

    .line 83
    sub-int/2addr p3, v0

    .line 84
    add-int/2addr p3, v3

    .line 85
    aget p1, p1, v5

    .line 86
    .line 87
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 88
    .line 89
    .line 90
    move-result v0

    .line 91
    add-int/2addr p1, v0

    .line 92
    add-int/2addr p1, v2

    .line 93
    invoke-virtual {p2, p0, v6, p3, p1}, Landroid/widget/PopupWindow;->showAtLocation(Landroid/view/View;III)V

    .line 94
    .line 95
    .line 96
    return-void

    .line 97
    :cond_3
    aget p3, p1, v6

    .line 98
    .line 99
    sub-int/2addr p3, v3

    .line 100
    aget p1, p1, v5

    .line 101
    .line 102
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 103
    .line 104
    .line 105
    move-result v0

    .line 106
    add-int/2addr p1, v0

    .line 107
    add-int/2addr p1, v2

    .line 108
    invoke-virtual {p2, p0, v6, p3, p1}, Landroid/widget/PopupWindow;->showAtLocation(Landroid/view/View;III)V

    .line 109
    .line 110
    .line 111
    return-void

    .line 112
    :cond_4
    aget p3, p1, v6

    .line 113
    .line 114
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 115
    .line 116
    .line 117
    move-result v3

    .line 118
    div-int/2addr v3, v4

    .line 119
    add-int/2addr p3, v3

    .line 120
    div-int/2addr v0, v4

    .line 121
    sub-int/2addr p3, v0

    .line 122
    aget p1, p1, v5

    .line 123
    .line 124
    sub-int/2addr p1, v1

    .line 125
    sub-int/2addr p1, v2

    .line 126
    invoke-virtual {p2, p0, v6, p3, p1}, Landroid/widget/PopupWindow;->showAtLocation(Landroid/view/View;III)V

    .line 127
    .line 128
    .line 129
    return-void

    .line 130
    :cond_5
    aget p3, p1, v6

    .line 131
    .line 132
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 133
    .line 134
    .line 135
    move-result v1

    .line 136
    div-int/2addr v1, v4

    .line 137
    add-int/2addr p3, v1

    .line 138
    div-int/2addr v0, v4

    .line 139
    sub-int/2addr p3, v0

    .line 140
    aget p1, p1, v5

    .line 141
    .line 142
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 143
    .line 144
    .line 145
    move-result v0

    .line 146
    add-int/2addr p1, v0

    .line 147
    add-int/2addr p1, v2

    .line 148
    invoke-virtual {p2, p0, v6, p3, p1}, Landroid/widget/PopupWindow;->showAtLocation(Landroid/view/View;III)V

    .line 149
    .line 150
    .line 151
    return-void
.end method

.method public static e(Landroid/view/View;Ljava/lang/String;)V
    .locals 5
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "ClickableViewAccessibility"
        }
    .end annotation

    .line 1
    const/4 v0, 0x2

    .line 2
    new-array v0, v0, [I

    .line 3
    .line 4
    invoke-virtual {p0, v0}, Landroid/view/View;->getLocationOnScreen([I)V

    .line 5
    .line 6
    .line 7
    invoke-static {p0, v0, p1}, Ll/gqp0;->b(Landroid/view/View;[ILjava/lang/String;)Landroid/util/Pair;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    new-instance v1, Landroid/widget/PopupWindow;

    .line 12
    .line 13
    iget-object v2, p1, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 14
    .line 15
    check-cast v2, Landroid/view/View;

    .line 16
    .line 17
    const/4 v3, -0x2

    .line 18
    const/4 v4, 0x1

    .line 19
    invoke-direct {v1, v2, v3, v3, v4}, Landroid/widget/PopupWindow;-><init>(Landroid/view/View;IIZ)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {v1}, Landroid/widget/PopupWindow;->getContentView()Landroid/view/View;

    .line 23
    .line 24
    .line 25
    move-result-object v2

    .line 26
    const/4 v3, 0x0

    .line 27
    invoke-virtual {v2, v3, v3}, Landroid/view/View;->measure(II)V

    .line 28
    .line 29
    .line 30
    new-instance v2, Landroid/graphics/drawable/ColorDrawable;

    .line 31
    .line 32
    invoke-direct {v2, v3}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {v1, v2}, Landroid/widget/PopupWindow;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 36
    .line 37
    .line 38
    invoke-virtual {v1, v4}, Landroid/widget/PopupWindow;->setOutsideTouchable(Z)V

    .line 39
    .line 40
    .line 41
    new-instance v2, Ll/fqp0;

    .line 42
    .line 43
    invoke-direct {v2, v1}, Ll/fqp0;-><init>(Landroid/widget/PopupWindow;)V

    .line 44
    .line 45
    .line 46
    invoke-virtual {v1, v2}, Landroid/widget/PopupWindow;->setTouchInterceptor(Landroid/view/View$OnTouchListener;)V

    .line 47
    .line 48
    .line 49
    iget-object p1, p1, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 50
    .line 51
    check-cast p1, Ljava/lang/Integer;

    .line 52
    .line 53
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 54
    .line 55
    .line 56
    move-result p1

    .line 57
    invoke-static {p0, v0, v1, p1}, Ll/gqp0;->d(Landroid/view/View;[ILandroid/widget/PopupWindow;I)V

    .line 58
    .line 59
    .line 60
    return-void
.end method

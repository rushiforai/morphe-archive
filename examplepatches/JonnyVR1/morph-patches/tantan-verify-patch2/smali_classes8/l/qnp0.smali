.class public Ll/qnp0;
.super Ll/bnl0;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/bnl0;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic R0(Landroid/view/View;[ILl/gcg0;)V
    .locals 4

    .line 1
    new-instance v0, Landroid/graphics/Rect;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Landroid/view/View;->getWindowVisibleDisplayFrame(Landroid/graphics/Rect;)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {v0}, Landroid/graphics/Rect;->height()I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    const/4 v0, 0x0

    .line 14
    aget v1, p1, v0

    .line 15
    .line 16
    if-nez v1, :cond_0

    .line 17
    .line 18
    aput p0, p1, v0

    .line 19
    .line 20
    return-void

    .line 21
    :cond_0
    if-ne v1, p0, :cond_1

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_1
    sub-int v2, v1, p0

    .line 25
    .line 26
    const/16 v3, 0xc8

    .line 27
    .line 28
    if-le v2, v3, :cond_2

    .line 29
    .line 30
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    invoke-interface {p2, v1}, Ll/bb50;->onNext(Ljava/lang/Object;)V

    .line 35
    .line 36
    .line 37
    aput p0, p1, v0

    .line 38
    .line 39
    return-void

    .line 40
    :cond_2
    sub-int v1, p0, v1

    .line 41
    .line 42
    if-le v1, v3, :cond_3

    .line 43
    .line 44
    const/4 v1, -0x1

    .line 45
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 46
    .line 47
    .line 48
    move-result-object v1

    .line 49
    invoke-interface {p2, v1}, Ll/bb50;->onNext(Ljava/lang/Object;)V

    .line 50
    .line 51
    .line 52
    aput p0, p1, v0

    .line 53
    .line 54
    :cond_3
    :goto_0
    return-void
.end method

.method public static synthetic S0(ZLandroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 0

    .line 1
    return p0
.end method

.method public static synthetic T0(Lv/VConstraintTextView;Landroid/view/View;Landroid/view/ViewGroup;IIIZLandroid/view/ViewGroup$LayoutParams;Landroid/view/View;ILl/x20;)V
    .locals 11

    .line 1
    move-object/from16 v0, p8

    .line 2
    .line 3
    move/from16 v1, p9

    .line 4
    .line 5
    new-instance v2, Ll/onp0;

    .line 6
    .line 7
    move-object v5, p0

    .line 8
    move-object v3, p1

    .line 9
    move-object v4, p2

    .line 10
    move v6, p3

    .line 11
    move v7, p4

    .line 12
    move/from16 v8, p5

    .line 13
    .line 14
    move/from16 v9, p6

    .line 15
    .line 16
    move-object/from16 v10, p7

    .line 17
    .line 18
    invoke-direct/range {v2 .. v10}, Ll/onp0;-><init>(Landroid/view/View;Landroid/view/ViewGroup;Lv/VConstraintTextView;IIIZLandroid/view/ViewGroup$LayoutParams;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p0, p1, v2}, Lv/VConstraintTextView;->l(Landroid/view/View;Ll/y20;)V

    .line 22
    .line 23
    .line 24
    if-eqz v0, :cond_0

    .line 25
    .line 26
    invoke-virtual {p2, v0}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 27
    .line 28
    .line 29
    :cond_0
    const/4 p1, 0x0

    .line 30
    invoke-virtual {p0, p1}, Landroid/view/View;->setVisibility(I)V

    .line 31
    .line 32
    .line 33
    const/4 p1, -0x1

    .line 34
    if-eq v1, p1, :cond_1

    .line 35
    .line 36
    invoke-virtual {p2}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    new-instance p3, Ll/pnp0;

    .line 41
    .line 42
    move-object/from16 p4, p10

    .line 43
    .line 44
    invoke-direct {p3, p2, p0, p4}, Ll/pnp0;-><init>(Landroid/view/ViewGroup;Lv/VConstraintTextView;Ll/x20;)V

    .line 45
    .line 46
    .line 47
    int-to-long v0, v1

    .line 48
    invoke-static {p1, p3, v0, v1}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 49
    .line 50
    .line 51
    :cond_1
    return-void
.end method

.method public static synthetic U0([Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;Landroid/view/View;)V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    aget-object v1, p0, v0

    .line 3
    .line 4
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 5
    .line 6
    .line 7
    move-result v1

    .line 8
    if-eqz v1, :cond_0

    .line 9
    .line 10
    invoke-virtual {p1}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    aget-object p0, p0, v0

    .line 15
    .line 16
    invoke-virtual {p1, p0}, Landroid/view/ViewTreeObserver;->removeOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    .line 17
    .line 18
    .line 19
    :cond_0
    return-void
.end method

.method public static synthetic V0(Landroid/view/View;Landroid/view/ViewGroup;Lv/VConstraintTextView;IIIZLandroid/view/ViewGroup$LayoutParams;Ll/pf60;)V
    .locals 3

    .line 1
    invoke-static {p0, p1}, Ll/bnl0;->j0(Landroid/view/View;Landroid/view/View;)Ll/bnl0$g;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p2, p1}, Ll/bnl0;->j0(Landroid/view/View;Landroid/view/View;)Ll/bnl0$g;

    .line 6
    .line 7
    .line 8
    move-result-object p8

    .line 9
    invoke-static {p1}, Ll/kkl0;->x(Landroid/view/View;)I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    invoke-static {p3, v0}, Landroid/view/Gravity;->getAbsoluteGravity(II)I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    and-int/lit8 v0, v0, 0x7

    .line 18
    .line 19
    and-int/lit8 p3, p3, 0x70

    .line 20
    .line 21
    const/4 v1, 0x3

    .line 22
    if-eq v0, v1, :cond_1

    .line 23
    .line 24
    const/4 v1, 0x5

    .line 25
    if-eq v0, v1, :cond_0

    .line 26
    .line 27
    iget p4, p0, Ll/bnl0$g;->a:I

    .line 28
    .line 29
    iget v0, p8, Ll/bnl0$g;->a:I

    .line 30
    .line 31
    sub-int/2addr p4, v0

    .line 32
    iget v0, p0, Ll/bnl0$g;->c:I

    .line 33
    .line 34
    iget v1, p8, Ll/bnl0$g;->c:I

    .line 35
    .line 36
    sub-int/2addr v0, v1

    .line 37
    div-int/lit8 v0, v0, 0x2

    .line 38
    .line 39
    add-int/2addr p4, v0

    .line 40
    goto :goto_1

    .line 41
    :cond_0
    iget v0, p0, Ll/bnl0$g;->a:I

    .line 42
    .line 43
    iget v1, p8, Ll/bnl0$g;->a:I

    .line 44
    .line 45
    sub-int/2addr v0, v1

    .line 46
    iget v1, p0, Ll/bnl0$g;->c:I

    .line 47
    .line 48
    iget v2, p8, Ll/bnl0$g;->c:I

    .line 49
    .line 50
    sub-int/2addr v1, v2

    .line 51
    add-int/2addr v0, v1

    .line 52
    :goto_0
    add-int/2addr p4, v0

    .line 53
    goto :goto_1

    .line 54
    :cond_1
    iget v0, p0, Ll/bnl0$g;->a:I

    .line 55
    .line 56
    iget v1, p8, Ll/bnl0$g;->a:I

    .line 57
    .line 58
    sub-int/2addr v0, v1

    .line 59
    goto :goto_0

    .line 60
    :goto_1
    const/16 v0, 0x10

    .line 61
    .line 62
    if-eq p3, v0, :cond_3

    .line 63
    .line 64
    const/16 v0, 0x30

    .line 65
    .line 66
    if-eq p3, v0, :cond_3

    .line 67
    .line 68
    const/16 v0, 0x50

    .line 69
    .line 70
    if-eq p3, v0, :cond_2

    .line 71
    .line 72
    iget p0, p0, Ll/bnl0$g;->b:I

    .line 73
    .line 74
    iget p3, p8, Ll/bnl0$g;->b:I

    .line 75
    .line 76
    sub-int/2addr p0, p3

    .line 77
    iget p3, p8, Ll/bnl0$g;->d:I

    .line 78
    .line 79
    sub-int/2addr p0, p3

    .line 80
    goto :goto_2

    .line 81
    :cond_2
    iget p3, p0, Ll/bnl0$g;->b:I

    .line 82
    .line 83
    iget p8, p8, Ll/bnl0$g;->b:I

    .line 84
    .line 85
    sub-int/2addr p3, p8

    .line 86
    iget p0, p0, Ll/bnl0$g;->d:I

    .line 87
    .line 88
    add-int/2addr p3, p0

    .line 89
    add-int p0, p3, p5

    .line 90
    .line 91
    goto :goto_2

    .line 92
    :cond_3
    iget p0, p0, Ll/bnl0$g;->b:I

    .line 93
    .line 94
    iget p3, p8, Ll/bnl0$g;->b:I

    .line 95
    .line 96
    sub-int/2addr p0, p3

    .line 97
    iget p3, p8, Ll/bnl0$g;->d:I

    .line 98
    .line 99
    sub-int/2addr p0, p3

    .line 100
    add-int/2addr p0, p5

    .line 101
    :goto_2
    if-eqz p6, :cond_7

    .line 102
    .line 103
    instance-of p3, p1, Landroid/widget/LinearLayout;

    .line 104
    .line 105
    if-eqz p3, :cond_4

    .line 106
    .line 107
    move-object p1, p7

    .line 108
    check-cast p1, Landroid/widget/LinearLayout$LayoutParams;

    .line 109
    .line 110
    iget p3, p1, Landroid/widget/LinearLayout$LayoutParams;->leftMargin:I

    .line 111
    .line 112
    add-int/2addr p3, p4

    .line 113
    iput p3, p1, Landroid/widget/LinearLayout$LayoutParams;->leftMargin:I

    .line 114
    .line 115
    iget p3, p1, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 116
    .line 117
    add-int/2addr p3, p0

    .line 118
    iput p3, p1, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 119
    .line 120
    goto :goto_3

    .line 121
    :cond_4
    instance-of p3, p1, Landroid/widget/FrameLayout;

    .line 122
    .line 123
    if-eqz p3, :cond_5

    .line 124
    .line 125
    move-object p1, p7

    .line 126
    check-cast p1, Landroid/widget/FrameLayout$LayoutParams;

    .line 127
    .line 128
    iget p3, p1, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I

    .line 129
    .line 130
    add-int/2addr p3, p4

    .line 131
    iput p3, p1, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I

    .line 132
    .line 133
    iget p3, p1, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 134
    .line 135
    add-int/2addr p3, p0

    .line 136
    iput p3, p1, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 137
    .line 138
    goto :goto_3

    .line 139
    :cond_5
    instance-of p1, p1, Landroid/widget/RelativeLayout;

    .line 140
    .line 141
    if-eqz p1, :cond_6

    .line 142
    .line 143
    move-object p1, p7

    .line 144
    check-cast p1, Landroid/widget/RelativeLayout$LayoutParams;

    .line 145
    .line 146
    iget p3, p1, Landroid/widget/RelativeLayout$LayoutParams;->leftMargin:I

    .line 147
    .line 148
    add-int/2addr p3, p4

    .line 149
    iput p3, p1, Landroid/widget/RelativeLayout$LayoutParams;->leftMargin:I

    .line 150
    .line 151
    iget p3, p1, Landroid/widget/RelativeLayout$LayoutParams;->topMargin:I

    .line 152
    .line 153
    add-int/2addr p3, p0

    .line 154
    iput p3, p1, Landroid/widget/RelativeLayout$LayoutParams;->topMargin:I

    .line 155
    .line 156
    :cond_6
    :goto_3
    invoke-virtual {p2, p7}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 157
    .line 158
    .line 159
    invoke-static {p2, p4, p0}, Ll/bnl0;->m0(Landroid/view/View;II)V

    .line 160
    .line 161
    .line 162
    return-void

    .line 163
    :cond_7
    invoke-virtual {p2}, Landroid/view/View;->getTranslationX()F

    .line 164
    .line 165
    .line 166
    move-result p1

    .line 167
    int-to-float p3, p4

    .line 168
    add-float/2addr p1, p3

    .line 169
    invoke-virtual {p2, p1}, Landroid/view/View;->setTranslationX(F)V

    .line 170
    .line 171
    .line 172
    invoke-virtual {p2}, Landroid/view/View;->getTranslationY()F

    .line 173
    .line 174
    .line 175
    move-result p1

    .line 176
    int-to-float p0, p0

    .line 177
    add-float/2addr p1, p0

    .line 178
    invoke-virtual {p2, p1}, Landroid/view/View;->setTranslationY(F)V

    .line 179
    .line 180
    .line 181
    return-void
.end method

.method public static synthetic W0(Landroid/view/ViewGroup;Lv/VConstraintTextView;Ll/x20;)V
    .locals 0

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 6
    .line 7
    .line 8
    if-eqz p2, :cond_0

    .line 9
    .line 10
    invoke-interface {p2}, Ll/x20;->call()V

    .line 11
    .line 12
    .line 13
    :cond_0
    return-void
.end method

.method public static synthetic X0([Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;Landroid/view/View;[ILl/gcg0;)V
    .locals 1

    .line 1
    new-instance v0, Ll/nnp0;

    .line 2
    .line 3
    invoke-direct {v0, p1, p2, p3}, Ll/nnp0;-><init>(Landroid/view/View;[ILl/gcg0;)V

    .line 4
    .line 5
    .line 6
    const/4 p2, 0x0

    .line 7
    aput-object v0, p0, p2

    .line 8
    .line 9
    invoke-virtual {p1}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    aget-object p2, p0, p2

    .line 14
    .line 15
    invoke-virtual {v0, p2}, Landroid/view/ViewTreeObserver;->addOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    .line 16
    .line 17
    .line 18
    new-instance p2, Ll/qnp0$b;

    .line 19
    .line 20
    invoke-direct {p2, p0, p1, p3}, Ll/qnp0$b;-><init>([Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;Landroid/view/View;Ll/gcg0;)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p1, p2}, Landroid/view/View;->addOnAttachStateChangeListener(Landroid/view/View$OnAttachStateChangeListener;)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public static Y0(Landroid/app/Activity;Landroid/app/Activity;)V
    .locals 5
    .param p0    # Landroid/app/Activity;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p1    # Landroid/app/Activity;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    new-instance v0, Landroid/widget/ImageView;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    .line 4
    .line 5
    .line 6
    sget-object v1, Landroid/widget/ImageView$ScaleType;->FIT_XY:Landroid/widget/ImageView$ScaleType;

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    .line 9
    .line 10
    .line 11
    const/4 v1, 0x0

    .line 12
    const/4 v2, -0x1

    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-virtual {p0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    const/4 v3, 0x4

    .line 24
    invoke-static {p0, v3}, Ll/bnl0;->x(Landroid/view/View;I)Landroid/graphics/Bitmap;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    const/high16 v3, 0x40800000    # 4.0f

    .line 29
    .line 30
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 31
    .line 32
    .line 33
    move-result v3

    .line 34
    invoke-static {p0, v3, v1}, Ll/t43;->a(Landroid/graphics/Bitmap;IZ)Landroid/graphics/Bitmap;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    new-instance v3, Landroid/graphics/Canvas;

    .line 39
    .line 40
    invoke-direct {v3, p0}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    .line 41
    .line 42
    .line 43
    const/high16 v4, -0x58000000

    .line 44
    .line 45
    invoke-virtual {v3, v4}, Landroid/graphics/Canvas;->drawColor(I)V

    .line 46
    .line 47
    .line 48
    new-instance v3, Landroid/graphics/drawable/BitmapDrawable;

    .line 49
    .line 50
    invoke-direct {v3, p0}, Landroid/graphics/drawable/BitmapDrawable;-><init>(Landroid/graphics/Bitmap;)V

    .line 51
    .line 52
    .line 53
    invoke-virtual {v0, v3}, Landroid/view/View;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 54
    .line 55
    .line 56
    goto :goto_0

    .line 57
    :cond_0
    invoke-virtual {v0, v2}, Landroid/view/View;->setBackgroundColor(I)V

    .line 58
    .line 59
    .line 60
    :goto_0
    invoke-virtual {p1}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    invoke-virtual {p0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 65
    .line 66
    .line 67
    move-result-object p0

    .line 68
    check-cast p0, Landroid/view/ViewGroup;

    .line 69
    .line 70
    invoke-virtual {p0, v0, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;I)V

    .line 71
    .line 72
    .line 73
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 74
    .line 75
    .line 76
    move-result-object p0

    .line 77
    iput v2, p0, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 78
    .line 79
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 80
    .line 81
    .line 82
    move-result-object p0

    .line 83
    iput v2, p0, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 84
    .line 85
    return-void
.end method

.method public static Z0(Landroid/view/ViewGroup;Landroid/view/View;Landroid/graphics/drawable/Drawable;Ljava/lang/CharSequence;IIIIIIIIIIIIZLl/x20;Z)Landroid/widget/TextView;
    .locals 21

    .line 1
    invoke-virtual/range {p1 .. p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 2
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual/range {p1 .. p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, "child"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    :goto_0
    move-object/from16 v1, p0

    move-object/from16 v2, p1

    move-object/from16 v4, p2

    move-object/from16 v5, p3

    move/from16 v6, p4

    move/from16 v7, p5

    move/from16 v8, p6

    move/from16 v9, p7

    move/from16 v10, p8

    move/from16 v11, p9

    move/from16 v12, p10

    move/from16 v13, p11

    move/from16 v14, p12

    move/from16 v15, p13

    move/from16 v16, p14

    move/from16 v17, p15

    move/from16 v18, p16

    move-object/from16 v19, p17

    move/from16 v20, p18

    move-object v3, v0

    goto :goto_1

    .line 3
    :cond_0
    invoke-virtual/range {p2 .. p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 4
    :goto_1
    invoke-static/range {v1 .. v20}, Ll/qnp0;->a1(Landroid/view/ViewGroup;Landroid/view/View;Ljava/lang/String;Landroid/graphics/drawable/Drawable;Ljava/lang/CharSequence;IIIIIIIIIIIIZLl/x20;Z)Landroid/widget/TextView;

    move-result-object v0

    return-object v0
.end method

.method public static a1(Landroid/view/ViewGroup;Landroid/view/View;Ljava/lang/String;Landroid/graphics/drawable/Drawable;Ljava/lang/CharSequence;IIIIIIIIIIIIZLl/x20;Z)Landroid/widget/TextView;
    .locals 12

    move/from16 v0, p9

    move/from16 v1, p10

    move/from16 v2, p11

    move/from16 v3, p12

    move/from16 v4, p13

    move/from16 v7, p17

    .line 1
    invoke-virtual {p0, p2}, Landroid/view/View;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object v9

    .line 2
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v5

    .line 3
    new-instance v6, Lv/VConstraintTextView;

    invoke-direct {v6, v5}, Lv/VConstraintTextView;-><init>(Landroid/content/Context;)V

    move/from16 v5, p5

    .line 4
    invoke-virtual {v6, v5}, Landroid/widget/TextView;->setTextColor(I)V

    move/from16 v5, p6

    int-to-float v5, v5

    const/4 v8, 0x1

    .line 5
    invoke-virtual {v6, v8, v5}, Landroidx/appcompat/widget/AppCompatTextView;->setTextSize(IF)V

    move/from16 v5, p7

    .line 6
    invoke-virtual {v6, v5}, Landroid/widget/TextView;->setGravity(I)V

    move-object/from16 v5, p4

    .line 7
    invoke-virtual {v6, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 8
    invoke-virtual {v6, p3}, Landroidx/appcompat/widget/AppCompatTextView;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 9
    invoke-virtual {v6, p2}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    if-eqz p19, :cond_0

    .line 10
    invoke-virtual {v6}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    move-result-object p2

    invoke-virtual {p2, v8}, Landroid/graphics/Paint;->setFakeBoldText(Z)V

    :cond_0
    if-lez v4, :cond_1

    .line 11
    invoke-virtual {v6, v4}, Landroid/widget/TextView;->setMaxWidth(I)V

    :cond_1
    if-gtz v0, :cond_2

    if-gtz v1, :cond_2

    if-gtz v2, :cond_2

    if-lez v3, :cond_3

    .line 12
    :cond_2
    invoke-virtual {v6, v0, v1, v2, v3}, Landroid/view/View;->setPadding(IIII)V

    .line 13
    :cond_3
    instance-of p2, p0, Landroid/widget/LinearLayout;

    const/4 p3, -0x2

    if-eqz p2, :cond_4

    .line 14
    new-instance p2, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {p2, p3, p3}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    :goto_0
    move-object v8, p2

    goto :goto_1

    .line 15
    :cond_4
    instance-of p2, p0, Landroid/widget/FrameLayout;

    if-eqz p2, :cond_5

    .line 16
    new-instance p2, Landroid/widget/FrameLayout$LayoutParams;

    invoke-direct {p2, p3, p3}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    goto :goto_0

    .line 17
    :cond_5
    instance-of p2, p0, Landroid/widget/RelativeLayout;

    if-eqz p2, :cond_6

    .line 18
    new-instance p2, Landroid/widget/RelativeLayout$LayoutParams;

    invoke-direct {p2, p3, p3}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    goto :goto_0

    .line 19
    :cond_6
    new-instance p2, Landroid/view/ViewGroup$LayoutParams;

    invoke-direct {p2, p3, p3}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    goto :goto_0

    .line 20
    :goto_1
    invoke-virtual {p0, v6, v8}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    const/4 p2, 0x4

    .line 21
    invoke-virtual {v6, p2}, Landroid/view/View;->setVisibility(I)V

    if-eqz v7, :cond_7

    .line 22
    new-instance p2, Ll/jnp0;

    invoke-direct {p2, v7}, Ll/jnp0;-><init>(Z)V

    invoke-virtual {v6, p2}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 23
    :cond_7
    new-instance v0, Ll/knp0;

    move-object v3, p0

    move-object v2, p1

    move/from16 v10, p8

    move/from16 v4, p14

    move/from16 v5, p15

    move-object/from16 v11, p18

    move-object v1, v6

    move/from16 v6, p16

    invoke-direct/range {v0 .. v11}, Ll/knp0;-><init>(Lv/VConstraintTextView;Landroid/view/View;Landroid/view/ViewGroup;IIIZLandroid/view/ViewGroup$LayoutParams;Landroid/view/View;ILl/x20;)V

    invoke-static {v0}, Ll/l51;->G(Ljava/lang/Runnable;)V

    return-object v1
.end method

.method public static b1(Landroid/view/ViewGroup;Landroid/view/View;Landroid/graphics/drawable/Drawable;Ljava/lang/CharSequence;IIIIIIIIIIIZLl/x20;)Landroid/view/View;
    .locals 20

    const/16 v16, 0x0

    const/16 v19, 0x0

    move-object/from16 v1, p0

    move-object/from16 v2, p1

    move-object/from16 v3, p2

    move-object/from16 v4, p3

    move/from16 v5, p4

    move/from16 v6, p5

    move/from16 v7, p6

    move/from16 v8, p7

    move/from16 v9, p8

    move/from16 v10, p9

    move/from16 v11, p10

    move/from16 v12, p11

    move/from16 v13, p12

    move/from16 v14, p13

    move/from16 v15, p14

    move/from16 v17, p15

    move-object/from16 v18, p16

    .line 1
    invoke-static/range {v1 .. v19}, Ll/qnp0;->Z0(Landroid/view/ViewGroup;Landroid/view/View;Landroid/graphics/drawable/Drawable;Ljava/lang/CharSequence;IIIIIIIIIIIIZLl/x20;Z)Landroid/widget/TextView;

    move-result-object v0

    return-object v0
.end method

.method public static c1(Landroid/view/View;IIIII)V
    .locals 6
    .param p0    # Landroid/view/View;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    new-instance v0, Ll/qnp0$a;

    .line 2
    .line 3
    move v1, p1

    .line 4
    move v2, p2

    .line 5
    move v3, p3

    .line 6
    move v4, p4

    .line 7
    move v5, p5

    .line 8
    invoke-direct/range {v0 .. v5}, Ll/qnp0$a;-><init>(IIIII)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0, v0}, Landroid/view/View;->setOutlineProvider(Landroid/view/ViewOutlineProvider;)V

    .line 12
    .line 13
    .line 14
    const/4 p1, 0x1

    .line 15
    invoke-virtual {p0, p1}, Landroid/view/View;->setClipToOutline(Z)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public static d1(Landroid/view/View;I)V
    .locals 6
    .param p0    # Landroid/view/View;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    const/4 v3, 0x0

    .line 2
    const/4 v4, 0x0

    .line 3
    const/4 v1, 0x0

    .line 4
    const/4 v2, 0x0

    .line 5
    move-object v0, p0

    .line 6
    move v5, p1

    .line 7
    invoke-static/range {v0 .. v5}, Ll/qnp0;->c1(Landroid/view/View;IIIII)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public static e1(Landroid/widget/TextView;I)V
    .locals 2
    .param p1    # I
        .annotation build Landroidx/annotation/DrawableRes;
        .end annotation
    .end param

    .line 1
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 2
    .line 3
    const/16 v1, 0x1d

    .line 4
    .line 5
    if-ge v0, v1, :cond_0

    .line 6
    .line 7
    :try_start_0
    const-class v0, Landroid/widget/TextView;

    .line 8
    .line 9
    const-string v1, "mCursorDrawableRes"

    .line 10
    .line 11
    invoke-virtual {v0, v1}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const/4 v1, 0x1

    .line 16
    invoke-virtual {v0, v1}, Ljava/lang/reflect/AccessibleObject;->setAccessible(Z)V

    .line 17
    .line 18
    .line 19
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    invoke-virtual {v0, p0, p1}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/NoSuchFieldException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_0

    .line 24
    .line 25
    .line 26
    return-void

    .line 27
    :catch_0
    move-exception p0

    .line 28
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 29
    .line 30
    .line 31
    return-void

    .line 32
    :cond_0
    invoke-static {p0, p1}, Ll/inp0;->a(Landroid/widget/TextView;I)V

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public static f1(Landroid/view/View;)Lrx/c;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/view/View;",
            ")",
            "Lrx/c<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    filled-new-array {v0}, [I

    .line 3
    .line 4
    .line 5
    move-result-object v0

    .line 6
    const/4 v1, 0x1

    .line 7
    new-array v1, v1, [Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;

    .line 8
    .line 9
    new-instance v2, Ll/lnp0;

    .line 10
    .line 11
    invoke-direct {v2, v1, p0, v0}, Ll/lnp0;-><init>([Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;Landroid/view/View;[I)V

    .line 12
    .line 13
    .line 14
    invoke-static {v2}, Lrx/c;->create(Lrx/c$a;)Lrx/c;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 19
    .line 20
    .line 21
    move-result-object v2

    .line 22
    invoke-virtual {v0, v2}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    new-instance v2, Ll/mnp0;

    .line 27
    .line 28
    invoke-direct {v2, v1, p0}, Ll/mnp0;-><init>([Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;Landroid/view/View;)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {v0, v2}, Lrx/c;->doOnUnsubscribe(Ll/x20;)Lrx/c;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    return-object p0
.end method

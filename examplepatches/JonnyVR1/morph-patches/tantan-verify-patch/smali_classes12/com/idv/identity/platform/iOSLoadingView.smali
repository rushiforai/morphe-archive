.class public Lcom/idv/identity/platform/iOSLoadingView;
.super Landroid/view/View;
.source "SourceFile"


# instance fields
.field private a:I

.field private b:I

.field private c:I

.field private d:I

.field private e:Landroid/graphics/Paint;

.field private f:I

.field private g:Landroid/graphics/Rect;

.field private h:[Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    .line 30
    invoke-direct {p0, p1, v0}, Lcom/idv/identity/platform/iOSLoadingView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    .line 29
    invoke-direct {p0, p1, p2, v0}, Lcom/idv/identity/platform/iOSLoadingView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 6

    .line 1
    invoke-direct {p0, p1, p2, p3}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput p1, p0, Lcom/idv/identity/platform/iOSLoadingView;->f:I

    .line 6
    .line 7
    const-string v4, "#777777"

    .line 8
    .line 9
    const-string v5, "#666666"

    .line 10
    .line 11
    const-string v0, "#bbbbbb"

    .line 12
    .line 13
    const-string v1, "#aaaaaa"

    .line 14
    .line 15
    const-string v2, "#999999"

    .line 16
    .line 17
    const-string v3, "#888888"

    .line 18
    .line 19
    filled-new-array/range {v0 .. v5}, [Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    iput-object p1, p0, Lcom/idv/identity/platform/iOSLoadingView;->h:[Ljava/lang/String;

    .line 24
    .line 25
    invoke-direct {p0}, Lcom/idv/identity/platform/iOSLoadingView;->a()V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method private a()V
    .locals 2

    .line 1
    new-instance v0, Landroid/graphics/Paint;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    .line 5
    .line 6
    .line 7
    iput-object v0, p0, Lcom/idv/identity/platform/iOSLoadingView;->e:Landroid/graphics/Paint;

    .line 8
    .line 9
    return-void
.end method


# virtual methods
.method public onDraw(Landroid/graphics/Canvas;)V
    .locals 6

    .line 1
    invoke-super {p0, p1}, Landroid/view/View;->onDraw(Landroid/graphics/Canvas;)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/idv/identity/platform/iOSLoadingView;->g:Landroid/graphics/Rect;

    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    new-instance v0, Landroid/graphics/Rect;

    .line 10
    .line 11
    iget v2, p0, Lcom/idv/identity/platform/iOSLoadingView;->a:I

    .line 12
    .line 13
    iget v3, p0, Lcom/idv/identity/platform/iOSLoadingView;->c:I

    .line 14
    .line 15
    sub-int v4, v2, v3

    .line 16
    .line 17
    div-int/lit8 v4, v4, 0x2

    .line 18
    .line 19
    add-int/2addr v2, v3

    .line 20
    div-int/lit8 v2, v2, 0x2

    .line 21
    .line 22
    iget v3, p0, Lcom/idv/identity/platform/iOSLoadingView;->d:I

    .line 23
    .line 24
    invoke-direct {v0, v4, v1, v2, v3}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 25
    .line 26
    .line 27
    iput-object v0, p0, Lcom/idv/identity/platform/iOSLoadingView;->g:Landroid/graphics/Rect;

    .line 28
    .line 29
    :cond_0
    move v0, v1

    .line 30
    :goto_0
    iget v2, p0, Lcom/idv/identity/platform/iOSLoadingView;->f:I

    .line 31
    .line 32
    const/16 v3, 0xc

    .line 33
    .line 34
    if-ge v0, v3, :cond_5

    .line 35
    .line 36
    sub-int v3, v0, v2

    .line 37
    .line 38
    const/4 v4, 0x5

    .line 39
    if-lt v3, v4, :cond_1

    .line 40
    .line 41
    iget-object v2, p0, Lcom/idv/identity/platform/iOSLoadingView;->e:Landroid/graphics/Paint;

    .line 42
    .line 43
    iget-object v3, p0, Lcom/idv/identity/platform/iOSLoadingView;->h:[Ljava/lang/String;

    .line 44
    .line 45
    aget-object v3, v3, v4

    .line 46
    .line 47
    invoke-static {v3}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 48
    .line 49
    .line 50
    move-result v3

    .line 51
    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setColor(I)V

    .line 52
    .line 53
    .line 54
    goto :goto_1

    .line 55
    :cond_1
    sub-int v3, v0, v2

    .line 56
    .line 57
    if-ltz v3, :cond_2

    .line 58
    .line 59
    sub-int v3, v0, v2

    .line 60
    .line 61
    if-ge v3, v4, :cond_2

    .line 62
    .line 63
    iget-object v3, p0, Lcom/idv/identity/platform/iOSLoadingView;->e:Landroid/graphics/Paint;

    .line 64
    .line 65
    iget-object v4, p0, Lcom/idv/identity/platform/iOSLoadingView;->h:[Ljava/lang/String;

    .line 66
    .line 67
    sub-int v2, v0, v2

    .line 68
    .line 69
    aget-object v2, v4, v2

    .line 70
    .line 71
    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 72
    .line 73
    .line 74
    move-result v2

    .line 75
    invoke-virtual {v3, v2}, Landroid/graphics/Paint;->setColor(I)V

    .line 76
    .line 77
    .line 78
    goto :goto_1

    .line 79
    :cond_2
    sub-int v3, v0, v2

    .line 80
    .line 81
    const/4 v5, -0x7

    .line 82
    if-lt v3, v5, :cond_3

    .line 83
    .line 84
    sub-int v3, v0, v2

    .line 85
    .line 86
    if-gez v3, :cond_3

    .line 87
    .line 88
    iget-object v2, p0, Lcom/idv/identity/platform/iOSLoadingView;->e:Landroid/graphics/Paint;

    .line 89
    .line 90
    iget-object v3, p0, Lcom/idv/identity/platform/iOSLoadingView;->h:[Ljava/lang/String;

    .line 91
    .line 92
    aget-object v3, v3, v4

    .line 93
    .line 94
    invoke-static {v3}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 95
    .line 96
    .line 97
    move-result v3

    .line 98
    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setColor(I)V

    .line 99
    .line 100
    .line 101
    goto :goto_1

    .line 102
    :cond_3
    sub-int v3, v0, v2

    .line 103
    .line 104
    const/16 v4, -0xb

    .line 105
    .line 106
    if-lt v3, v4, :cond_4

    .line 107
    .line 108
    sub-int v3, v0, v2

    .line 109
    .line 110
    if-ge v3, v5, :cond_4

    .line 111
    .line 112
    iget-object v3, p0, Lcom/idv/identity/platform/iOSLoadingView;->e:Landroid/graphics/Paint;

    .line 113
    .line 114
    iget-object v4, p0, Lcom/idv/identity/platform/iOSLoadingView;->h:[Ljava/lang/String;

    .line 115
    .line 116
    add-int/lit8 v5, v0, 0xc

    .line 117
    .line 118
    sub-int/2addr v5, v2

    .line 119
    aget-object v2, v4, v5

    .line 120
    .line 121
    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 122
    .line 123
    .line 124
    move-result v2

    .line 125
    invoke-virtual {v3, v2}, Landroid/graphics/Paint;->setColor(I)V

    .line 126
    .line 127
    .line 128
    :cond_4
    :goto_1
    iget-object v2, p0, Lcom/idv/identity/platform/iOSLoadingView;->g:Landroid/graphics/Rect;

    .line 129
    .line 130
    iget-object v3, p0, Lcom/idv/identity/platform/iOSLoadingView;->e:Landroid/graphics/Paint;

    .line 131
    .line 132
    invoke-virtual {p1, v2, v3}, Landroid/graphics/Canvas;->drawRect(Landroid/graphics/Rect;Landroid/graphics/Paint;)V

    .line 133
    .line 134
    .line 135
    iget v2, p0, Lcom/idv/identity/platform/iOSLoadingView;->a:I

    .line 136
    .line 137
    div-int/lit8 v3, v2, 0x2

    .line 138
    .line 139
    int-to-float v3, v3

    .line 140
    div-int/lit8 v2, v2, 0x2

    .line 141
    .line 142
    int-to-float v2, v2

    .line 143
    const/high16 v4, 0x41f00000    # 30.0f

    .line 144
    .line 145
    invoke-virtual {p1, v4, v3, v2}, Landroid/graphics/Canvas;->rotate(FFF)V

    .line 146
    .line 147
    .line 148
    add-int/lit8 v0, v0, 0x1

    .line 149
    .line 150
    goto :goto_0

    .line 151
    :cond_5
    add-int/lit8 v2, v2, 0x1

    .line 152
    .line 153
    iput v2, p0, Lcom/idv/identity/platform/iOSLoadingView;->f:I

    .line 154
    .line 155
    const/16 p1, 0xb

    .line 156
    .line 157
    if-le v2, p1, :cond_6

    .line 158
    .line 159
    iput v1, p0, Lcom/idv/identity/platform/iOSLoadingView;->f:I

    .line 160
    .line 161
    :cond_6
    const-wide/16 v0, 0x64

    .line 162
    .line 163
    invoke-virtual {p0, v0, v1}, Landroid/view/View;->postInvalidateDelayed(J)V

    .line 164
    .line 165
    .line 166
    return-void
.end method

.method public onMeasure(II)V
    .locals 3

    .line 1
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getMode(I)I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getMode(I)I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    const/high16 v2, -0x80000000

    .line 10
    .line 11
    if-eq v0, v2, :cond_1

    .line 12
    .line 13
    if-ne v1, v2, :cond_0

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    .line 17
    .line 18
    .line 19
    move-result p1

    .line 20
    iput p1, p0, Lcom/idv/identity/platform/iOSLoadingView;->a:I

    .line 21
    .line 22
    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getSize(I)I

    .line 23
    .line 24
    .line 25
    move-result p1

    .line 26
    iput p1, p0, Lcom/idv/identity/platform/iOSLoadingView;->b:I

    .line 27
    .line 28
    iget p2, p0, Lcom/idv/identity/platform/iOSLoadingView;->a:I

    .line 29
    .line 30
    invoke-static {p2, p1}, Ljava/lang/Math;->min(II)I

    .line 31
    .line 32
    .line 33
    move-result p1

    .line 34
    iput p1, p0, Lcom/idv/identity/platform/iOSLoadingView;->a:I

    .line 35
    .line 36
    goto :goto_1

    .line 37
    :cond_1
    :goto_0
    const/16 p1, 0xc8

    .line 38
    .line 39
    iput p1, p0, Lcom/idv/identity/platform/iOSLoadingView;->a:I

    .line 40
    .line 41
    :goto_1
    iget p1, p0, Lcom/idv/identity/platform/iOSLoadingView;->a:I

    .line 42
    .line 43
    div-int/lit8 p2, p1, 0xc

    .line 44
    .line 45
    iput p2, p0, Lcom/idv/identity/platform/iOSLoadingView;->c:I

    .line 46
    .line 47
    mul-int/lit8 p2, p2, 0x4

    .line 48
    .line 49
    iput p2, p0, Lcom/idv/identity/platform/iOSLoadingView;->d:I

    .line 50
    .line 51
    invoke-virtual {p0, p1, p1}, Landroid/view/View;->setMeasuredDimension(II)V

    .line 52
    .line 53
    .line 54
    return-void
.end method

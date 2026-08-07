.class public Lcom/p1/mobile/android/ui/cropiwa/CropIwaKanKanOverlayView;
.super Lcom/p1/mobile/android/ui/cropiwa/CropIwaOverlayView;
.source "SourceFile"


# direct methods
.method public constructor <init>(Landroid/content/Context;Ll/bwb;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaOverlayView;-><init>(Landroid/content/Context;Ll/bwb;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public o()V
    .locals 12

    .line 1
    const/high16 v0, 0x41400000    # 12.0f

    .line 2
    .line 3
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    int-to-float v1, v1

    .line 8
    const/high16 v2, 0x41000000    # 8.0f

    .line 9
    .line 10
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 11
    .line 12
    .line 13
    move-result v3

    .line 14
    const/high16 v4, 0x42600000    # 56.0f

    .line 15
    .line 16
    invoke-static {v4}, Ll/qa00;->d(F)I

    .line 17
    .line 18
    .line 19
    move-result v5

    .line 20
    add-int/2addr v3, v5

    .line 21
    int-to-float v3, v3

    .line 22
    invoke-static {}, Ll/bnl0;->y0()I

    .line 23
    .line 24
    .line 25
    move-result v5

    .line 26
    int-to-float v5, v5

    .line 27
    const/high16 v6, 0x40000000    # 2.0f

    .line 28
    .line 29
    mul-float v7, v1, v6

    .line 30
    .line 31
    sub-float/2addr v5, v7

    .line 32
    const/high16 v7, 0x41800000    # 16.0f

    .line 33
    .line 34
    mul-float v8, v5, v7

    .line 35
    .line 36
    const/high16 v9, 0x41100000    # 9.0f

    .line 37
    .line 38
    div-float/2addr v8, v9

    .line 39
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredHeight()I

    .line 40
    .line 41
    .line 42
    move-result v10

    .line 43
    invoke-static {v4}, Ll/qa00;->d(F)I

    .line 44
    .line 45
    .line 46
    move-result v11

    .line 47
    sub-int/2addr v10, v11

    .line 48
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 49
    .line 50
    .line 51
    move-result v11

    .line 52
    mul-int/lit8 v11, v11, 0x2

    .line 53
    .line 54
    sub-int/2addr v10, v11

    .line 55
    int-to-float v10, v10

    .line 56
    cmpl-float v10, v8, v10

    .line 57
    .line 58
    if-ltz v10, :cond_0

    .line 59
    .line 60
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredHeight()I

    .line 61
    .line 62
    .line 63
    move-result v0

    .line 64
    invoke-static {v4}, Ll/qa00;->d(F)I

    .line 65
    .line 66
    .line 67
    move-result v1

    .line 68
    sub-int/2addr v0, v1

    .line 69
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 70
    .line 71
    .line 72
    move-result v1

    .line 73
    mul-int/lit8 v1, v1, 0x2

    .line 74
    .line 75
    sub-int/2addr v0, v1

    .line 76
    int-to-float v8, v0

    .line 77
    mul-float/2addr v9, v8

    .line 78
    div-float v5, v9, v7

    .line 79
    .line 80
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredWidth()I

    .line 81
    .line 82
    .line 83
    move-result v0

    .line 84
    int-to-float v0, v0

    .line 85
    sub-float/2addr v0, v5

    .line 86
    div-float v1, v0, v6

    .line 87
    .line 88
    goto :goto_0

    .line 89
    :cond_0
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredWidth()I

    .line 90
    .line 91
    .line 92
    move-result v2

    .line 93
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 94
    .line 95
    .line 96
    move-result v10

    .line 97
    mul-int/lit8 v10, v10, 0x2

    .line 98
    .line 99
    sub-int/2addr v2, v10

    .line 100
    int-to-float v2, v2

    .line 101
    cmpl-float v2, v5, v2

    .line 102
    .line 103
    if-ltz v2, :cond_1

    .line 104
    .line 105
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredWidth()I

    .line 106
    .line 107
    .line 108
    move-result v2

    .line 109
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 110
    .line 111
    .line 112
    move-result v0

    .line 113
    mul-int/lit8 v0, v0, 0x2

    .line 114
    .line 115
    sub-int/2addr v2, v0

    .line 116
    int-to-float v5, v2

    .line 117
    mul-float/2addr v7, v5

    .line 118
    div-float v8, v7, v9

    .line 119
    .line 120
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredHeight()I

    .line 121
    .line 122
    .line 123
    move-result v0

    .line 124
    invoke-static {v4}, Ll/qa00;->d(F)I

    .line 125
    .line 126
    .line 127
    move-result v2

    .line 128
    sub-int/2addr v0, v2

    .line 129
    int-to-float v0, v0

    .line 130
    sub-float/2addr v0, v8

    .line 131
    div-float/2addr v0, v6

    .line 132
    invoke-static {v4}, Ll/qa00;->d(F)I

    .line 133
    .line 134
    .line 135
    move-result v2

    .line 136
    int-to-float v2, v2

    .line 137
    add-float v3, v0, v2

    .line 138
    .line 139
    :cond_1
    :goto_0
    iget-object p0, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaOverlayView;->e:Landroid/graphics/RectF;

    .line 140
    .line 141
    add-float/2addr v5, v1

    .line 142
    add-float/2addr v8, v3

    .line 143
    invoke-virtual {p0, v1, v3, v5, v8}, Landroid/graphics/RectF;->set(FFFF)V

    .line 144
    .line 145
    .line 146
    return-void
.end method

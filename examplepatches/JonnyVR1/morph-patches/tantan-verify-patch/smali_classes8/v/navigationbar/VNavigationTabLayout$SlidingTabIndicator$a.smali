.class public Lv/navigationbar/VNavigationTabLayout$SlidingTabIndicator$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lv/navigationbar/VNavigationTabLayout$SlidingTabIndicator;->k(ZII)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:I

.field public final synthetic b:I

.field public final synthetic c:Lv/navigationbar/VNavigationTabLayout$SlidingTabIndicator;


# direct methods
.method public constructor <init>(Lv/navigationbar/VNavigationTabLayout$SlidingTabIndicator;II)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lv/navigationbar/VNavigationTabLayout$SlidingTabIndicator$a;->c:Lv/navigationbar/VNavigationTabLayout$SlidingTabIndicator;

    .line 2
    .line 3
    iput p2, p0, Lv/navigationbar/VNavigationTabLayout$SlidingTabIndicator$a;->a:I

    .line 4
    .line 5
    iput p3, p0, Lv/navigationbar/VNavigationTabLayout$SlidingTabIndicator$a;->b:I

    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .locals 4
    .param p1    # Landroid/animation/ValueAnimator;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "RestrictedApi"
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedFraction()F

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    iget v0, p0, Lv/navigationbar/VNavigationTabLayout$SlidingTabIndicator$a;->a:I

    .line 6
    .line 7
    iget-object v1, p0, Lv/navigationbar/VNavigationTabLayout$SlidingTabIndicator$a;->c:Lv/navigationbar/VNavigationTabLayout$SlidingTabIndicator;

    .line 8
    .line 9
    invoke-static {v1}, Lv/navigationbar/VNavigationTabLayout$SlidingTabIndicator;->a(Lv/navigationbar/VNavigationTabLayout$SlidingTabIndicator;)I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    sub-int/2addr v0, v1

    .line 14
    const/high16 v1, 0x40000000    # 2.0f

    .line 15
    .line 16
    const/high16 v2, 0x3f000000    # 0.5f

    .line 17
    .line 18
    if-lez v0, :cond_1

    .line 19
    .line 20
    cmpl-float v0, p1, v2

    .line 21
    .line 22
    iget-object v3, p0, Lv/navigationbar/VNavigationTabLayout$SlidingTabIndicator$a;->c:Lv/navigationbar/VNavigationTabLayout$SlidingTabIndicator;

    .line 23
    .line 24
    if-ltz v0, :cond_0

    .line 25
    .line 26
    sub-float/2addr p1, v2

    .line 27
    mul-float/2addr p1, v1

    .line 28
    invoke-static {v3}, Lv/navigationbar/VNavigationTabLayout$SlidingTabIndicator;->a(Lv/navigationbar/VNavigationTabLayout$SlidingTabIndicator;)I

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    iget v1, p0, Lv/navigationbar/VNavigationTabLayout$SlidingTabIndicator$a;->a:I

    .line 33
    .line 34
    iget-object v2, p0, Lv/navigationbar/VNavigationTabLayout$SlidingTabIndicator$a;->c:Lv/navigationbar/VNavigationTabLayout$SlidingTabIndicator;

    .line 35
    .line 36
    invoke-static {v2}, Lv/navigationbar/VNavigationTabLayout$SlidingTabIndicator;->a(Lv/navigationbar/VNavigationTabLayout$SlidingTabIndicator;)I

    .line 37
    .line 38
    .line 39
    move-result v2

    .line 40
    sub-int/2addr v1, v2

    .line 41
    int-to-float v1, v1

    .line 42
    mul-float/2addr p1, v1

    .line 43
    invoke-static {p1}, Ljava/lang/Math;->round(F)I

    .line 44
    .line 45
    .line 46
    move-result p1

    .line 47
    add-int/2addr v0, p1

    .line 48
    iget-object p1, p0, Lv/navigationbar/VNavigationTabLayout$SlidingTabIndicator$a;->c:Lv/navigationbar/VNavigationTabLayout$SlidingTabIndicator;

    .line 49
    .line 50
    invoke-static {p1}, Lv/navigationbar/VNavigationTabLayout$SlidingTabIndicator;->b(Lv/navigationbar/VNavigationTabLayout$SlidingTabIndicator;)I

    .line 51
    .line 52
    .line 53
    move-result p1

    .line 54
    iget v1, p0, Lv/navigationbar/VNavigationTabLayout$SlidingTabIndicator$a;->b:I

    .line 55
    .line 56
    iget-object v2, p0, Lv/navigationbar/VNavigationTabLayout$SlidingTabIndicator$a;->c:Lv/navigationbar/VNavigationTabLayout$SlidingTabIndicator;

    .line 57
    .line 58
    invoke-static {v2}, Lv/navigationbar/VNavigationTabLayout$SlidingTabIndicator;->b(Lv/navigationbar/VNavigationTabLayout$SlidingTabIndicator;)I

    .line 59
    .line 60
    .line 61
    move-result v2

    .line 62
    sub-int/2addr v1, v2

    .line 63
    int-to-float v1, v1

    .line 64
    invoke-static {v1}, Ljava/lang/Math;->round(F)I

    .line 65
    .line 66
    .line 67
    move-result v1

    .line 68
    add-int/2addr p1, v1

    .line 69
    iget-object p0, p0, Lv/navigationbar/VNavigationTabLayout$SlidingTabIndicator$a;->c:Lv/navigationbar/VNavigationTabLayout$SlidingTabIndicator;

    .line 70
    .line 71
    invoke-virtual {p0, v0, p1}, Lv/navigationbar/VNavigationTabLayout$SlidingTabIndicator;->f(II)V

    .line 72
    .line 73
    .line 74
    return-void

    .line 75
    :cond_0
    mul-float/2addr p1, v1

    .line 76
    invoke-static {v3}, Lv/navigationbar/VNavigationTabLayout$SlidingTabIndicator;->a(Lv/navigationbar/VNavigationTabLayout$SlidingTabIndicator;)I

    .line 77
    .line 78
    .line 79
    move-result v0

    .line 80
    iget-object v1, p0, Lv/navigationbar/VNavigationTabLayout$SlidingTabIndicator$a;->c:Lv/navigationbar/VNavigationTabLayout$SlidingTabIndicator;

    .line 81
    .line 82
    invoke-static {v1}, Lv/navigationbar/VNavigationTabLayout$SlidingTabIndicator;->b(Lv/navigationbar/VNavigationTabLayout$SlidingTabIndicator;)I

    .line 83
    .line 84
    .line 85
    move-result v1

    .line 86
    iget v2, p0, Lv/navigationbar/VNavigationTabLayout$SlidingTabIndicator$a;->b:I

    .line 87
    .line 88
    iget-object v3, p0, Lv/navigationbar/VNavigationTabLayout$SlidingTabIndicator$a;->c:Lv/navigationbar/VNavigationTabLayout$SlidingTabIndicator;

    .line 89
    .line 90
    invoke-static {v3}, Lv/navigationbar/VNavigationTabLayout$SlidingTabIndicator;->b(Lv/navigationbar/VNavigationTabLayout$SlidingTabIndicator;)I

    .line 91
    .line 92
    .line 93
    move-result v3

    .line 94
    sub-int/2addr v2, v3

    .line 95
    int-to-float v2, v2

    .line 96
    mul-float/2addr p1, v2

    .line 97
    invoke-static {p1}, Ljava/lang/Math;->round(F)I

    .line 98
    .line 99
    .line 100
    move-result p1

    .line 101
    add-int/2addr v1, p1

    .line 102
    iget-object p0, p0, Lv/navigationbar/VNavigationTabLayout$SlidingTabIndicator$a;->c:Lv/navigationbar/VNavigationTabLayout$SlidingTabIndicator;

    .line 103
    .line 104
    invoke-virtual {p0, v0, v1}, Lv/navigationbar/VNavigationTabLayout$SlidingTabIndicator;->f(II)V

    .line 105
    .line 106
    .line 107
    return-void

    .line 108
    :cond_1
    cmpl-float v0, p1, v2

    .line 109
    .line 110
    iget-object v3, p0, Lv/navigationbar/VNavigationTabLayout$SlidingTabIndicator$a;->c:Lv/navigationbar/VNavigationTabLayout$SlidingTabIndicator;

    .line 111
    .line 112
    if-ltz v0, :cond_2

    .line 113
    .line 114
    sub-float/2addr p1, v2

    .line 115
    mul-float/2addr p1, v1

    .line 116
    invoke-static {v3}, Lv/navigationbar/VNavigationTabLayout$SlidingTabIndicator;->a(Lv/navigationbar/VNavigationTabLayout$SlidingTabIndicator;)I

    .line 117
    .line 118
    .line 119
    move-result v0

    .line 120
    iget v1, p0, Lv/navigationbar/VNavigationTabLayout$SlidingTabIndicator$a;->a:I

    .line 121
    .line 122
    iget-object v2, p0, Lv/navigationbar/VNavigationTabLayout$SlidingTabIndicator$a;->c:Lv/navigationbar/VNavigationTabLayout$SlidingTabIndicator;

    .line 123
    .line 124
    invoke-static {v2}, Lv/navigationbar/VNavigationTabLayout$SlidingTabIndicator;->a(Lv/navigationbar/VNavigationTabLayout$SlidingTabIndicator;)I

    .line 125
    .line 126
    .line 127
    move-result v2

    .line 128
    sub-int/2addr v1, v2

    .line 129
    int-to-float v1, v1

    .line 130
    invoke-static {v1}, Ljava/lang/Math;->round(F)I

    .line 131
    .line 132
    .line 133
    move-result v1

    .line 134
    add-int/2addr v0, v1

    .line 135
    iget-object v1, p0, Lv/navigationbar/VNavigationTabLayout$SlidingTabIndicator$a;->c:Lv/navigationbar/VNavigationTabLayout$SlidingTabIndicator;

    .line 136
    .line 137
    invoke-static {v1}, Lv/navigationbar/VNavigationTabLayout$SlidingTabIndicator;->b(Lv/navigationbar/VNavigationTabLayout$SlidingTabIndicator;)I

    .line 138
    .line 139
    .line 140
    move-result v1

    .line 141
    iget v2, p0, Lv/navigationbar/VNavigationTabLayout$SlidingTabIndicator$a;->b:I

    .line 142
    .line 143
    iget-object v3, p0, Lv/navigationbar/VNavigationTabLayout$SlidingTabIndicator$a;->c:Lv/navigationbar/VNavigationTabLayout$SlidingTabIndicator;

    .line 144
    .line 145
    invoke-static {v3}, Lv/navigationbar/VNavigationTabLayout$SlidingTabIndicator;->b(Lv/navigationbar/VNavigationTabLayout$SlidingTabIndicator;)I

    .line 146
    .line 147
    .line 148
    move-result v3

    .line 149
    sub-int/2addr v2, v3

    .line 150
    int-to-float v2, v2

    .line 151
    mul-float/2addr p1, v2

    .line 152
    invoke-static {p1}, Ljava/lang/Math;->round(F)I

    .line 153
    .line 154
    .line 155
    move-result p1

    .line 156
    add-int/2addr v1, p1

    .line 157
    iget-object p0, p0, Lv/navigationbar/VNavigationTabLayout$SlidingTabIndicator$a;->c:Lv/navigationbar/VNavigationTabLayout$SlidingTabIndicator;

    .line 158
    .line 159
    invoke-virtual {p0, v0, v1}, Lv/navigationbar/VNavigationTabLayout$SlidingTabIndicator;->f(II)V

    .line 160
    .line 161
    .line 162
    return-void

    .line 163
    :cond_2
    mul-float/2addr p1, v1

    .line 164
    invoke-static {v3}, Lv/navigationbar/VNavigationTabLayout$SlidingTabIndicator;->a(Lv/navigationbar/VNavigationTabLayout$SlidingTabIndicator;)I

    .line 165
    .line 166
    .line 167
    move-result v0

    .line 168
    iget v1, p0, Lv/navigationbar/VNavigationTabLayout$SlidingTabIndicator$a;->a:I

    .line 169
    .line 170
    iget-object v2, p0, Lv/navigationbar/VNavigationTabLayout$SlidingTabIndicator$a;->c:Lv/navigationbar/VNavigationTabLayout$SlidingTabIndicator;

    .line 171
    .line 172
    invoke-static {v2}, Lv/navigationbar/VNavigationTabLayout$SlidingTabIndicator;->a(Lv/navigationbar/VNavigationTabLayout$SlidingTabIndicator;)I

    .line 173
    .line 174
    .line 175
    move-result v2

    .line 176
    sub-int/2addr v1, v2

    .line 177
    int-to-float v1, v1

    .line 178
    mul-float/2addr p1, v1

    .line 179
    invoke-static {p1}, Ljava/lang/Math;->round(F)I

    .line 180
    .line 181
    .line 182
    move-result p1

    .line 183
    add-int/2addr v0, p1

    .line 184
    iget-object p1, p0, Lv/navigationbar/VNavigationTabLayout$SlidingTabIndicator$a;->c:Lv/navigationbar/VNavigationTabLayout$SlidingTabIndicator;

    .line 185
    .line 186
    invoke-static {p1}, Lv/navigationbar/VNavigationTabLayout$SlidingTabIndicator;->b(Lv/navigationbar/VNavigationTabLayout$SlidingTabIndicator;)I

    .line 187
    .line 188
    .line 189
    move-result p1

    .line 190
    iget-object p0, p0, Lv/navigationbar/VNavigationTabLayout$SlidingTabIndicator$a;->c:Lv/navigationbar/VNavigationTabLayout$SlidingTabIndicator;

    .line 191
    .line 192
    invoke-virtual {p0, v0, p1}, Lv/navigationbar/VNavigationTabLayout$SlidingTabIndicator;->f(II)V

    .line 193
    .line 194
    .line 195
    return-void
.end method

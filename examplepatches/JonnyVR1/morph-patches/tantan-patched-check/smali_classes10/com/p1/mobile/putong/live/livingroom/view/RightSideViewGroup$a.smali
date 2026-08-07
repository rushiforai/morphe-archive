.class public Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup$a;
.super Ll/ykl0$c;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup;->init()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup$a;->a:Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/ykl0$c;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public clampViewPositionHorizontal(Landroid/view/View;II)I
    .locals 3
    .param p1    # Landroid/view/View;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup$a;->a:Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup;->v(Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup;)Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup$d;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup$d;->a(Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup$d;)I

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    const/4 v0, 0x1

    .line 12
    const/4 v1, 0x0

    .line 13
    const/4 v2, -0x1

    .line 14
    if-ne p1, v2, :cond_3

    .line 15
    .line 16
    if-lez p3, :cond_0

    .line 17
    .line 18
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup$a;->a:Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup;

    .line 19
    .line 20
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup;->v(Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup;)Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup$d;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup$d;->c(Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup$d;)Z

    .line 25
    .line 26
    .line 27
    move-result p1

    .line 28
    if-nez p1, :cond_0

    .line 29
    .line 30
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup$a;->a:Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup;

    .line 31
    .line 32
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup;->B(Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup;)Z

    .line 33
    .line 34
    .line 35
    move-result p1

    .line 36
    if-eqz p1, :cond_1

    .line 37
    .line 38
    :cond_0
    if-gez p3, :cond_2

    .line 39
    .line 40
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup$a;->a:Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup;

    .line 41
    .line 42
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup;->B(Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup;)Z

    .line 43
    .line 44
    .line 45
    move-result p1

    .line 46
    if-eqz p1, :cond_2

    .line 47
    .line 48
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup$a;->a:Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup;

    .line 49
    .line 50
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup;->v(Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup;)Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup$d;

    .line 51
    .line 52
    .line 53
    move-result-object p1

    .line 54
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup$d;->d(Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup$d;I)V

    .line 55
    .line 56
    .line 57
    goto :goto_0

    .line 58
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup$a;->a:Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup;

    .line 59
    .line 60
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup;->v(Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup;)Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup$d;

    .line 61
    .line 62
    .line 63
    move-result-object p1

    .line 64
    invoke-static {p1, v1}, Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup$d;->d(Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup$d;I)V

    .line 65
    .line 66
    .line 67
    :cond_3
    :goto_0
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup$a;->a:Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup;

    .line 68
    .line 69
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup;->w(Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup;)Z

    .line 70
    .line 71
    .line 72
    move-result p1

    .line 73
    if-nez p1, :cond_4

    .line 74
    .line 75
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup$a;->a:Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup;

    .line 76
    .line 77
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup;->v(Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup;)Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup$d;

    .line 78
    .line 79
    .line 80
    move-result-object p1

    .line 81
    invoke-static {p1, v1}, Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup$d;->d(Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup$d;I)V

    .line 82
    .line 83
    .line 84
    :cond_4
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup$a;->a:Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup;

    .line 85
    .line 86
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup;->v(Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup;)Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup$d;

    .line 87
    .line 88
    .line 89
    move-result-object p1

    .line 90
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup$d;->a(Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup$d;)I

    .line 91
    .line 92
    .line 93
    move-result p1

    .line 94
    iget-object p3, p0, Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup$a;->a:Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup;

    .line 95
    .line 96
    if-ne p1, v0, :cond_5

    .line 97
    .line 98
    invoke-static {p3, p2}, Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup;->C(Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup;I)V

    .line 99
    .line 100
    .line 101
    goto :goto_1

    .line 102
    :cond_5
    invoke-static {p3}, Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup;->v(Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup;)Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup$d;

    .line 103
    .line 104
    .line 105
    move-result-object p1

    .line 106
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup$d;->a(Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup$d;)I

    .line 107
    .line 108
    .line 109
    move-result p1

    .line 110
    if-nez p1, :cond_8

    .line 111
    .line 112
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup$a;->a:Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup;

    .line 113
    .line 114
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup;->v(Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup;)Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup$d;

    .line 115
    .line 116
    .line 117
    move-result-object p1

    .line 118
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup$d;->b(Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup$d;)Z

    .line 119
    .line 120
    .line 121
    move-result p1

    .line 122
    if-eqz p1, :cond_8

    .line 123
    .line 124
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup$a;->a:Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup;

    .line 125
    .line 126
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup;->s(Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup;)Landroid/view/View;

    .line 127
    .line 128
    .line 129
    move-result-object p1

    .line 130
    invoke-virtual {p1}, Landroid/view/View;->getTranslationX()F

    .line 131
    .line 132
    .line 133
    move-result p1

    .line 134
    int-to-float p2, p2

    .line 135
    add-float/2addr p1, p2

    .line 136
    const/4 p2, 0x0

    .line 137
    cmpl-float p3, p1, p2

    .line 138
    .line 139
    if-lez p3, :cond_6

    .line 140
    .line 141
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup$a;->a:Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup;

    .line 142
    .line 143
    invoke-static {p0}, Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup;->s(Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup;)Landroid/view/View;

    .line 144
    .line 145
    .line 146
    move-result-object p0

    .line 147
    invoke-virtual {p0, p2}, Landroid/view/View;->setTranslationX(F)V

    .line 148
    .line 149
    .line 150
    goto :goto_1

    .line 151
    :cond_6
    invoke-static {p1}, Ljava/lang/Math;->abs(F)F

    .line 152
    .line 153
    .line 154
    move-result p2

    .line 155
    iget-object p3, p0, Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup$a;->a:Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup;

    .line 156
    .line 157
    invoke-static {p3}, Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup;->u(Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup;)I

    .line 158
    .line 159
    .line 160
    move-result p3

    .line 161
    int-to-float p3, p3

    .line 162
    cmpg-float p2, p2, p3

    .line 163
    .line 164
    iget-object p3, p0, Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup$a;->a:Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup;

    .line 165
    .line 166
    if-gez p2, :cond_7

    .line 167
    .line 168
    invoke-static {p3}, Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup;->s(Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup;)Landroid/view/View;

    .line 169
    .line 170
    .line 171
    move-result-object p0

    .line 172
    invoke-virtual {p0, p1}, Landroid/view/View;->setTranslationX(F)V

    .line 173
    .line 174
    .line 175
    goto :goto_1

    .line 176
    :cond_7
    invoke-static {p3}, Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup;->s(Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup;)Landroid/view/View;

    .line 177
    .line 178
    .line 179
    move-result-object p1

    .line 180
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup$a;->a:Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup;

    .line 181
    .line 182
    invoke-static {p0}, Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup;->u(Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup;)I

    .line 183
    .line 184
    .line 185
    move-result p0

    .line 186
    mul-int/2addr p0, v2

    .line 187
    int-to-float p0, p0

    .line 188
    invoke-virtual {p1, p0}, Landroid/view/View;->setTranslationX(F)V

    .line 189
    .line 190
    .line 191
    :cond_8
    :goto_1
    return v1
.end method

.method public clampViewPositionVertical(Landroid/view/View;II)I
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public onViewReleased(Landroid/view/View;FF)V
    .locals 1
    .param p1    # Landroid/view/View;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup$a;->a:Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup;->v(Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup;)Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup$d;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup$d;->a(Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup$d;)I

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    iget-object p3, p0, Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup$a;->a:Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup;

    .line 12
    .line 13
    const/4 v0, 0x1

    .line 14
    if-ne p1, v0, :cond_0

    .line 15
    .line 16
    invoke-static {p3, p2}, Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup;->E(Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup;F)V

    .line 17
    .line 18
    .line 19
    goto :goto_1

    .line 20
    :cond_0
    invoke-static {p3}, Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup;->v(Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup;)Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup$d;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup$d;->b(Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup$d;)Z

    .line 25
    .line 26
    .line 27
    move-result p1

    .line 28
    if-eqz p1, :cond_6

    .line 29
    .line 30
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup$a;->a:Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup;

    .line 31
    .line 32
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup;->s(Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup;)Landroid/view/View;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    invoke-virtual {p1}, Landroid/view/View;->getTranslationX()F

    .line 37
    .line 38
    .line 39
    move-result p1

    .line 40
    invoke-static {p1}, Ljava/lang/Math;->abs(F)F

    .line 41
    .line 42
    .line 43
    move-result p1

    .line 44
    iget-object p3, p0, Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup$a;->a:Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup;

    .line 45
    .line 46
    invoke-static {p3}, Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup;->v(Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup;)Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup$d;

    .line 47
    .line 48
    .line 49
    move-result-object p3

    .line 50
    invoke-static {p3}, Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup$d;->c(Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup$d;)Z

    .line 51
    .line 52
    .line 53
    move-result p3

    .line 54
    if-eqz p3, :cond_3

    .line 55
    .line 56
    const/4 p3, 0x0

    .line 57
    cmpl-float p3, p2, p3

    .line 58
    .line 59
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup$a;->a:Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup;

    .line 60
    .line 61
    if-lez p3, :cond_1

    .line 62
    .line 63
    invoke-static {v0, p2}, Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup;->z(Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup;F)V

    .line 64
    .line 65
    .line 66
    goto :goto_1

    .line 67
    :cond_1
    invoke-static {v0}, Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup;->u(Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup;)I

    .line 68
    .line 69
    .line 70
    move-result p3

    .line 71
    div-int/lit8 p3, p3, 0x2

    .line 72
    .line 73
    int-to-float p3, p3

    .line 74
    cmpl-float p1, p1, p3

    .line 75
    .line 76
    iget-object p3, p0, Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup$a;->a:Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup;

    .line 77
    .line 78
    if-lez p1, :cond_2

    .line 79
    .line 80
    invoke-static {p3, p2}, Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup;->F(Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup;F)V

    .line 81
    .line 82
    .line 83
    goto :goto_1

    .line 84
    :cond_2
    invoke-static {p3, p2}, Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup;->z(Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup;F)V

    .line 85
    .line 86
    .line 87
    goto :goto_1

    .line 88
    :cond_3
    iget-object p3, p0, Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup$a;->a:Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup;

    .line 89
    .line 90
    invoke-static {p3}, Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup;->u(Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup;)I

    .line 91
    .line 92
    .line 93
    move-result p3

    .line 94
    div-int/lit8 p3, p3, 0x2

    .line 95
    .line 96
    int-to-float p3, p3

    .line 97
    cmpl-float p1, p1, p3

    .line 98
    .line 99
    if-gtz p1, :cond_5

    .line 100
    .line 101
    const/high16 p1, -0x3b060000    # -2000.0f

    .line 102
    .line 103
    cmpg-float p1, p2, p1

    .line 104
    .line 105
    if-gez p1, :cond_4

    .line 106
    .line 107
    goto :goto_0

    .line 108
    :cond_4
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup$a;->a:Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup;

    .line 109
    .line 110
    invoke-static {p1, p2}, Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup;->z(Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup;F)V

    .line 111
    .line 112
    .line 113
    goto :goto_1

    .line 114
    :cond_5
    :goto_0
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup$a;->a:Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup;

    .line 115
    .line 116
    invoke-static {p1, p2}, Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup;->F(Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup;F)V

    .line 117
    .line 118
    .line 119
    :cond_6
    :goto_1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup$a;->a:Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup;

    .line 120
    .line 121
    invoke-static {p0}, Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup;->v(Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup;)Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup$d;

    .line 122
    .line 123
    .line 124
    move-result-object p0

    .line 125
    const/4 p1, -0x1

    .line 126
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup$d;->d(Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup$d;I)V

    .line 127
    .line 128
    .line 129
    return-void
.end method

.method public tryCaptureView(Landroid/view/View;I)Z
    .locals 0
    .param p1    # Landroid/view/View;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup$a;->a:Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup;->p(Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup;)Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    if-ne p1, p0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x1

    .line 10
    return p0

    .line 11
    :cond_0
    const/4 p0, 0x0

    .line 12
    return p0
.end method

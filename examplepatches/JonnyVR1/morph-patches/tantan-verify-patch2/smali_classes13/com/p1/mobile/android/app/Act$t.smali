.class public Lcom/p1/mobile/android/app/Act$t;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/android/app/Act;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "t"
.end annotation


# instance fields
.field public a:Landroid/view/View;

.field public b:Landroid/view/View;

.field public c:Landroid/view/ViewGroup;

.field public d:Ll/b30;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/b30<",
            "Ljava/lang/Boolean;",
            "Ljava/lang/Integer;",
            "Ljava/lang/Boolean;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field public e:I

.field public f:Z

.field public g:I

.field public h:Z

.field public i:I

.field public j:Z

.field public k:I

.field public final synthetic l:Lcom/p1/mobile/android/app/Act;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;Landroid/view/View;Landroid/view/View;Ll/b30;Landroid/view/ViewGroup;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/view/View;",
            "Landroid/view/View;",
            "Ll/b30<",
            "Ljava/lang/Boolean;",
            "Ljava/lang/Integer;",
            "Ljava/lang/Boolean;",
            "Ljava/lang/Integer;",
            ">;",
            "Landroid/view/ViewGroup;",
            ")V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/android/app/Act$t;->l:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    iput-boolean v0, p0, Lcom/p1/mobile/android/app/Act$t;->h:Z

    .line 8
    .line 9
    iput v0, p0, Lcom/p1/mobile/android/app/Act$t;->i:I

    .line 10
    .line 11
    invoke-virtual {p1}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    const/16 v2, 0x9

    .line 16
    .line 17
    invoke-virtual {v1, v2}, Landroid/view/Window;->hasFeature(I)Z

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    iput-boolean v1, p0, Lcom/p1/mobile/android/app/Act$t;->j:Z

    .line 22
    .line 23
    invoke-virtual {p1}, Landroidx/appcompat/app/AppCompatActivity;->getSupportActionBar()Ll/c30;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    if-eqz p1, :cond_1

    .line 28
    .line 29
    iget-boolean p1, p0, Lcom/p1/mobile/android/app/Act$t;->j:Z

    .line 30
    .line 31
    if-eqz p1, :cond_0

    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_0
    const/high16 p1, 0x42600000    # 56.0f

    .line 35
    .line 36
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 37
    .line 38
    .line 39
    move-result v0

    .line 40
    :cond_1
    :goto_0
    iput v0, p0, Lcom/p1/mobile/android/app/Act$t;->k:I

    .line 41
    .line 42
    iput-object p2, p0, Lcom/p1/mobile/android/app/Act$t;->a:Landroid/view/View;

    .line 43
    .line 44
    iput-object p3, p0, Lcom/p1/mobile/android/app/Act$t;->b:Landroid/view/View;

    .line 45
    .line 46
    iput-object p4, p0, Lcom/p1/mobile/android/app/Act$t;->d:Ll/b30;

    .line 47
    .line 48
    iput-object p5, p0, Lcom/p1/mobile/android/app/Act$t;->c:Landroid/view/ViewGroup;

    .line 49
    .line 50
    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/android/app/Act$t;I)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/app/Act$t;->b(I)V

    return-void
.end method


# virtual methods
.method public final synthetic b(I)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/android/app/Act$t;->a:Landroid/view/View;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget v1, p0, Lcom/p1/mobile/android/app/Act$t;->e:I

    .line 10
    .line 11
    add-int/2addr v1, p1

    .line 12
    iput v1, v0, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 13
    .line 14
    iget-object v0, p0, Lcom/p1/mobile/android/app/Act$t;->a:Landroid/view/View;

    .line 15
    .line 16
    const/4 v1, 0x0

    .line 17
    invoke-virtual {v0, v1, p1, v1, v1}, Landroid/view/View;->setPadding(IIII)V

    .line 18
    .line 19
    .line 20
    iget-object p0, p0, Lcom/p1/mobile/android/app/Act$t;->a:Landroid/view/View;

    .line 21
    .line 22
    invoke-virtual {p0}, Landroid/view/View;->requestLayout()V

    .line 23
    .line 24
    .line 25
    :cond_0
    return-void
.end method

.method public c(Landroid/view/View;II)V
    .locals 8

    .line 1
    iget v0, p0, Lcom/p1/mobile/android/app/Act$t;->e:I

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/android/app/Act$t;->l:Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    iget v1, v1, Lcom/p1/mobile/android/app/Act;->screenHeight:I

    .line 6
    .line 7
    invoke-static {v0, v1}, Ljava/lang/Math;->min(II)I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    iput v0, p0, Lcom/p1/mobile/android/app/Act$t;->e:I

    .line 12
    .line 13
    new-instance v0, Landroid/graphics/Rect;

    .line 14
    .line 15
    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    .line 16
    .line 17
    .line 18
    iget-object v1, p0, Lcom/p1/mobile/android/app/Act$t;->b:Landroid/view/View;

    .line 19
    .line 20
    invoke-virtual {v1, v0}, Landroid/view/View;->getWindowVisibleDisplayFrame(Landroid/graphics/Rect;)V

    .line 21
    .line 22
    .line 23
    iget v1, v0, Landroid/graphics/Rect;->top:I

    .line 24
    .line 25
    iget v0, v0, Landroid/graphics/Rect;->bottom:I

    .line 26
    .line 27
    iget v2, p0, Lcom/p1/mobile/android/app/Act$t;->e:I

    .line 28
    .line 29
    sub-int/2addr v0, v1

    .line 30
    iget v1, p0, Lcom/p1/mobile/android/app/Act$t;->k:I

    .line 31
    .line 32
    sub-int v1, v0, v1

    .line 33
    .line 34
    sub-int/2addr v2, v1

    .line 35
    sget-boolean v1, Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;->D:Z

    .line 36
    .line 37
    const/4 v3, 0x1

    .line 38
    const/4 v4, 0x0

    .line 39
    if-eqz v1, :cond_0

    .line 40
    .line 41
    iget-object v1, p0, Lcom/p1/mobile/android/app/Act$t;->c:Landroid/view/ViewGroup;

    .line 42
    .line 43
    invoke-virtual {v1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 44
    .line 45
    .line 46
    move-result-object v1

    .line 47
    invoke-virtual {v1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 48
    .line 49
    .line 50
    move-result-object v5

    .line 51
    instance-of v5, v5, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 52
    .line 53
    if-eqz v5, :cond_0

    .line 54
    .line 55
    invoke-virtual {v1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 56
    .line 57
    .line 58
    move-result-object v1

    .line 59
    check-cast v1, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 60
    .line 61
    iget v1, v1, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    .line 62
    .line 63
    iget v5, p0, Lcom/p1/mobile/android/app/Act$t;->i:I

    .line 64
    .line 65
    if-eq v1, v5, :cond_0

    .line 66
    .line 67
    sub-int v6, v1, v5

    .line 68
    .line 69
    sub-int v5, v1, v5

    .line 70
    .line 71
    sub-int/2addr v2, v5

    .line 72
    iput v1, p0, Lcom/p1/mobile/android/app/Act$t;->i:I

    .line 73
    .line 74
    iget v1, p0, Lcom/p1/mobile/android/app/Act$t;->k:I

    .line 75
    .line 76
    sub-int v1, v0, v1

    .line 77
    .line 78
    add-int/2addr v1, v2

    .line 79
    iput v1, p0, Lcom/p1/mobile/android/app/Act$t;->e:I

    .line 80
    .line 81
    move v1, v3

    .line 82
    goto :goto_0

    .line 83
    :cond_0
    move v1, v4

    .line 84
    move v6, v1

    .line 85
    :goto_0
    const/high16 v5, 0x42c80000    # 100.0f

    .line 86
    .line 87
    invoke-static {v5}, Ll/qa00;->d(F)I

    .line 88
    .line 89
    .line 90
    move-result v5

    .line 91
    if-le v2, v5, :cond_1

    .line 92
    .line 93
    move v5, v3

    .line 94
    goto :goto_1

    .line 95
    :cond_1
    move v5, v4

    .line 96
    :goto_1
    if-nez v5, :cond_6

    .line 97
    .line 98
    iget v7, p0, Lcom/p1/mobile/android/app/Act$t;->k:I

    .line 99
    .line 100
    sub-int/2addr v0, v7

    .line 101
    iput v0, p0, Lcom/p1/mobile/android/app/Act$t;->e:I

    .line 102
    .line 103
    const-string v0, "MI 9"

    .line 104
    .line 105
    sget-object v7, Landroid/os/Build;->MODEL:Ljava/lang/String;

    .line 106
    .line 107
    invoke-virtual {v0, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 108
    .line 109
    .line 110
    move-result v0

    .line 111
    if-eqz v0, :cond_2

    .line 112
    .line 113
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 114
    .line 115
    const/16 v7, 0x22

    .line 116
    .line 117
    if-gt v0, v7, :cond_2

    .line 118
    .line 119
    sub-int/2addr p3, p2

    .line 120
    iput p3, p0, Lcom/p1/mobile/android/app/Act$t;->e:I

    .line 121
    .line 122
    :cond_2
    move p2, v4

    .line 123
    :goto_2
    instance-of p3, p1, Landroid/view/View;

    .line 124
    .line 125
    if-eqz p3, :cond_3

    .line 126
    .line 127
    iget-object p3, p0, Lcom/p1/mobile/android/app/Act$t;->l:Lcom/p1/mobile/android/app/Act;

    .line 128
    .line 129
    invoke-virtual {p3}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 130
    .line 131
    .line 132
    move-result-object p3

    .line 133
    invoke-virtual {p3}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 134
    .line 135
    .line 136
    move-result-object p3

    .line 137
    if-eq p1, p3, :cond_3

    .line 138
    .line 139
    check-cast p1, Landroid/view/View;

    .line 140
    .line 141
    invoke-virtual {p1}, Landroid/view/View;->getTop()I

    .line 142
    .line 143
    .line 144
    move-result p3

    .line 145
    add-int/2addr p2, p3

    .line 146
    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 147
    .line 148
    .line 149
    move-result-object p1

    .line 150
    goto :goto_2

    .line 151
    :cond_3
    iget-object p1, p0, Lcom/p1/mobile/android/app/Act$t;->a:Landroid/view/View;

    .line 152
    .line 153
    invoke-virtual {p1}, Landroid/view/View;->getMeasuredHeight()I

    .line 154
    .line 155
    .line 156
    move-result p1

    .line 157
    sub-int/2addr p1, p2

    .line 158
    iget p3, p0, Lcom/p1/mobile/android/app/Act$t;->e:I

    .line 159
    .line 160
    if-ne p1, p3, :cond_4

    .line 161
    .line 162
    iget-object p1, p0, Lcom/p1/mobile/android/app/Act$t;->a:Landroid/view/View;

    .line 163
    .line 164
    invoke-virtual {p1}, Landroid/view/View;->getPaddingTop()I

    .line 165
    .line 166
    .line 167
    move-result p1

    .line 168
    if-eq p2, p1, :cond_6

    .line 169
    .line 170
    :cond_4
    iget-boolean p1, p0, Lcom/p1/mobile/android/app/Act$t;->h:Z

    .line 171
    .line 172
    if-nez p1, :cond_5

    .line 173
    .line 174
    iput-boolean v3, p0, Lcom/p1/mobile/android/app/Act$t;->h:Z

    .line 175
    .line 176
    iget-object p1, p0, Lcom/p1/mobile/android/app/Act$t;->a:Landroid/view/View;

    .line 177
    .line 178
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 179
    .line 180
    .line 181
    move-result-object p1

    .line 182
    iget p3, p0, Lcom/p1/mobile/android/app/Act$t;->e:I

    .line 183
    .line 184
    add-int/2addr p3, p2

    .line 185
    iput p3, p1, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 186
    .line 187
    iget-object p1, p0, Lcom/p1/mobile/android/app/Act$t;->a:Landroid/view/View;

    .line 188
    .line 189
    invoke-virtual {p1, v4, p2, v4, v4}, Landroid/view/View;->setPadding(IIII)V

    .line 190
    .line 191
    .line 192
    iget-object p1, p0, Lcom/p1/mobile/android/app/Act$t;->a:Landroid/view/View;

    .line 193
    .line 194
    invoke-virtual {p1}, Landroid/view/View;->requestLayout()V

    .line 195
    .line 196
    .line 197
    goto :goto_3

    .line 198
    :cond_5
    new-instance p1, Ll/o20;

    .line 199
    .line 200
    invoke-direct {p1, p0, p2}, Ll/o20;-><init>(Lcom/p1/mobile/android/app/Act$t;I)V

    .line 201
    .line 202
    .line 203
    invoke-static {p1}, Ll/l51;->G(Ljava/lang/Runnable;)V

    .line 204
    .line 205
    .line 206
    :cond_6
    :goto_3
    iget-boolean p1, p0, Lcom/p1/mobile/android/app/Act$t;->f:Z

    .line 207
    .line 208
    if-ne v5, p1, :cond_7

    .line 209
    .line 210
    iget p1, p0, Lcom/p1/mobile/android/app/Act$t;->g:I

    .line 211
    .line 212
    if-ne v2, p1, :cond_7

    .line 213
    .line 214
    if-eqz v1, :cond_a

    .line 215
    .line 216
    :cond_7
    iput-boolean v5, p0, Lcom/p1/mobile/android/app/Act$t;->f:Z

    .line 217
    .line 218
    if-eqz v5, :cond_8

    .line 219
    .line 220
    iput v2, p0, Lcom/p1/mobile/android/app/Act$t;->g:I

    .line 221
    .line 222
    sget-object p1, Lcom/p1/mobile/android/app/Act;->savedKeyboardHeight:Ll/vxd0;

    .line 223
    .line 224
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 225
    .line 226
    .line 227
    move-result-object p2

    .line 228
    invoke-virtual {p1, p2}, Ll/vxd0;->put(Ljava/lang/Object;)Z

    .line 229
    .line 230
    .line 231
    :cond_8
    iget-object p1, p0, Lcom/p1/mobile/android/app/Act$t;->d:Ll/b30;

    .line 232
    .line 233
    if-eqz p1, :cond_a

    .line 234
    .line 235
    iget-boolean p2, p0, Lcom/p1/mobile/android/app/Act$t;->f:Z

    .line 236
    .line 237
    if-eqz p2, :cond_9

    .line 238
    .line 239
    iget-object p2, p0, Lcom/p1/mobile/android/app/Act$t;->l:Lcom/p1/mobile/android/app/Act;

    .line 240
    .line 241
    invoke-virtual {p2}, Lcom/p1/mobile/android/app/Act;->lifecycle_()Lcom/p1/mobile/android/app/c;

    .line 242
    .line 243
    .line 244
    move-result-object p2

    .line 245
    sget-object p3, Lcom/p1/mobile/android/app/c;->i:Lcom/p1/mobile/android/app/c;

    .line 246
    .line 247
    if-ne p2, p3, :cond_9

    .line 248
    .line 249
    goto :goto_4

    .line 250
    :cond_9
    move v3, v4

    .line 251
    :goto_4
    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 252
    .line 253
    .line 254
    move-result-object p2

    .line 255
    iget p0, p0, Lcom/p1/mobile/android/app/Act$t;->g:I

    .line 256
    .line 257
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 258
    .line 259
    .line 260
    move-result-object p0

    .line 261
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 262
    .line 263
    .line 264
    move-result-object p3

    .line 265
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 266
    .line 267
    .line 268
    move-result-object v0

    .line 269
    invoke-interface {p1, p2, p0, p3, v0}, Ll/b30;->b(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 270
    .line 271
    .line 272
    :cond_a
    return-void
.end method

.class public Ll/fql0;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final b:I


# instance fields
.field public final a:Ll/mql0;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    sget v0, Ll/qa00;->R:I

    .line 2
    .line 3
    sput v0, Ll/fql0;->b:I

    .line 4
    .line 5
    return-void
.end method

.method public constructor <init>(Ll/mql0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/fql0;->a:Ll/mql0;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final a(Z)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/fql0;->a:Ll/mql0;

    .line 2
    .line 3
    invoke-interface {v0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {v0}, Landroid/view/View;->getSystemUiVisibility()I

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz p1, :cond_0

    .line 20
    .line 21
    iget-object p0, p0, Ll/fql0;->a:Ll/mql0;

    .line 22
    .line 23
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    const/16 p1, 0x10

    .line 32
    .line 33
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/app/PutongAct;->setLightStatusBar(Landroid/view/Window;I)V

    .line 34
    .line 35
    .line 36
    return-void

    .line 37
    :cond_0
    and-int/lit16 p1, v0, 0x2000

    .line 38
    .line 39
    if-lez p1, :cond_1

    .line 40
    .line 41
    and-int/lit16 v0, v0, -0x2001

    .line 42
    .line 43
    :cond_1
    sget p1, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 44
    .line 45
    const/16 v1, 0x1a

    .line 46
    .line 47
    if-lt p1, v1, :cond_2

    .line 48
    .line 49
    and-int/lit8 p1, v0, 0x10

    .line 50
    .line 51
    if-lez p1, :cond_2

    .line 52
    .line 53
    and-int/lit8 v0, v0, -0x11

    .line 54
    .line 55
    :cond_2
    iget-object p0, p0, Ll/fql0;->a:Ll/mql0;

    .line 56
    .line 57
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 62
    .line 63
    .line 64
    move-result-object p0

    .line 65
    invoke-virtual {p0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 66
    .line 67
    .line 68
    move-result-object p0

    .line 69
    invoke-virtual {p0, v0}, Landroid/view/View;->setSystemUiVisibility(I)V

    .line 70
    .line 71
    .line 72
    return-void
.end method

.method public final b(Lcom/p1/mobile/putong/core/data/PurchaseType;)Landroid/graphics/drawable/Drawable;
    .locals 2

    .line 1
    invoke-static {p1}, Ll/wib0;->i(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-static {}, Ll/s7a;->o()Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    new-instance p0, Landroid/graphics/drawable/ShapeDrawable;

    .line 14
    .line 15
    new-instance p1, Landroid/graphics/drawable/shapes/RectShape;

    .line 16
    .line 17
    invoke-direct {p1}, Landroid/graphics/drawable/shapes/RectShape;-><init>()V

    .line 18
    .line 19
    .line 20
    invoke-direct {p0, p1}, Landroid/graphics/drawable/ShapeDrawable;-><init>(Landroid/graphics/drawable/shapes/Shape;)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p0}, Landroid/graphics/drawable/ShapeDrawable;->getPaint()Landroid/graphics/Paint;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    const-string v0, "#150701"

    .line 28
    .line 29
    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setColor(I)V

    .line 34
    .line 35
    .line 36
    return-object p0

    .line 37
    :cond_0
    const-string p0, "#0E3311"

    .line 38
    .line 39
    invoke-static {p0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 40
    .line 41
    .line 42
    move-result p0

    .line 43
    const-string p1, "#041B07"

    .line 44
    .line 45
    invoke-static {p1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 46
    .line 47
    .line 48
    move-result p1

    .line 49
    const-string v0, "#031708"

    .line 50
    .line 51
    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 52
    .line 53
    .line 54
    move-result v0

    .line 55
    const-string v1, "#011206"

    .line 56
    .line 57
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 58
    .line 59
    .line 60
    move-result v1

    .line 61
    filled-new-array {p0, p1, v0, v1}, [I

    .line 62
    .line 63
    .line 64
    move-result-object p0

    .line 65
    new-instance p1, Landroid/graphics/drawable/GradientDrawable;

    .line 66
    .line 67
    sget-object v0, Landroid/graphics/drawable/GradientDrawable$Orientation;->TOP_BOTTOM:Landroid/graphics/drawable/GradientDrawable$Orientation;

    .line 68
    .line 69
    invoke-direct {p1, v0, p0}, Landroid/graphics/drawable/GradientDrawable;-><init>(Landroid/graphics/drawable/GradientDrawable$Orientation;[I)V

    .line 70
    .line 71
    .line 72
    return-object p1
.end method

.method public c()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/fql0;->a:Ll/mql0;

    .line 2
    .line 3
    iget-object v0, v0, Ll/mql0;->i:Lv/VSegmentBar;

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    instance-of v0, v0, Landroidx/coordinatorlayout/widget/CoordinatorLayout$f;

    .line 10
    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    iget-object v0, p0, Ll/fql0;->a:Ll/mql0;

    .line 14
    .line 15
    iget-object v0, v0, Ll/mql0;->i:Lv/VSegmentBar;

    .line 16
    .line 17
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    check-cast v0, Landroidx/coordinatorlayout/widget/CoordinatorLayout$f;

    .line 22
    .line 23
    invoke-virtual {v0}, Landroidx/coordinatorlayout/widget/CoordinatorLayout$f;->f()Landroidx/coordinatorlayout/widget/CoordinatorLayout$c;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    instance-of v1, v1, Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/behavior/TabLayoutScrollBehavior;

    .line 28
    .line 29
    if-eqz v1, :cond_0

    .line 30
    .line 31
    invoke-virtual {v0}, Landroidx/coordinatorlayout/widget/CoordinatorLayout$f;->f()Landroidx/coordinatorlayout/widget/CoordinatorLayout$c;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    check-cast v0, Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/behavior/TabLayoutScrollBehavior;

    .line 36
    .line 37
    iget-object p0, p0, Ll/fql0;->a:Ll/mql0;

    .line 38
    .line 39
    iget-object p0, p0, Ll/mql0;->d:Lv/VDraweeView;

    .line 40
    .line 41
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/behavior/TabLayoutScrollBehavior;->b(Landroid/view/View;)V

    .line 42
    .line 43
    .line 44
    :cond_0
    return-void
.end method

.method public d(Lcom/p1/mobile/putong/core/data/PurchaseType;)V
    .locals 5

    .line 1
    invoke-static {p1}, Ll/wib0;->i(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x1

    .line 6
    const/4 v2, 0x0

    .line 7
    if-eqz v0, :cond_2

    .line 8
    .line 9
    invoke-static {}, Ll/s7a;->o()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_2

    .line 14
    .line 15
    iget-object v0, p0, Ll/fql0;->a:Ll/mql0;

    .line 16
    .line 17
    iget-object v0, v0, Ll/mql0;->c:Landroid/widget/FrameLayout;

    .line 18
    .line 19
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0, p1}, Ll/fql0;->g(Lcom/p1/mobile/putong/core/data/PurchaseType;)V

    .line 23
    .line 24
    .line 25
    iget-object p1, p0, Ll/fql0;->a:Ll/mql0;

    .line 26
    .line 27
    iget-object p1, p1, Ll/mql0;->b:Landroid/widget/FrameLayout;

    .line 28
    .line 29
    invoke-static {p1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 30
    .line 31
    .line 32
    iget-object p1, p0, Ll/fql0;->a:Ll/mql0;

    .line 33
    .line 34
    iget-object p1, p1, Ll/mql0;->i:Lv/VSegmentBar;

    .line 35
    .line 36
    sget v0, Ll/dbc0;->bj:I

    .line 37
    .line 38
    invoke-virtual {p1, v0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 39
    .line 40
    .line 41
    iget-object p1, p0, Ll/fql0;->a:Ll/mql0;

    .line 42
    .line 43
    iget-object v0, p1, Ll/mql0;->i:Lv/VSegmentBar;

    .line 44
    .line 45
    invoke-interface {p1}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    sget v1, Ll/c9c0;->i1:I

    .line 50
    .line 51
    invoke-virtual {p1, v1}, Lcom/p1/mobile/android/app/Act;->color(I)I

    .line 52
    .line 53
    .line 54
    move-result p1

    .line 55
    iget-object v1, p0, Ll/fql0;->a:Ll/mql0;

    .line 56
    .line 57
    invoke-interface {v1}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 58
    .line 59
    .line 60
    move-result-object v1

    .line 61
    sget v3, Ll/c9c0;->j1:I

    .line 62
    .line 63
    invoke-virtual {v1, v3}, Lcom/p1/mobile/android/app/Act;->color(I)I

    .line 64
    .line 65
    .line 66
    move-result v1

    .line 67
    invoke-virtual {v0, p1, v1}, Lcom/google/android/material/tabs/TabLayout;->setTabTextColors(II)V

    .line 68
    .line 69
    .line 70
    iget-object p1, p0, Ll/fql0;->a:Ll/mql0;

    .line 71
    .line 72
    iget-object p1, p1, Ll/mql0;->i:Lv/VSegmentBar;

    .line 73
    .line 74
    invoke-virtual {p1}, Lcom/google/android/material/tabs/TabLayout;->getTabCount()I

    .line 75
    .line 76
    .line 77
    move-result p1

    .line 78
    move v0, v2

    .line 79
    :goto_0
    iget-object v1, p0, Ll/fql0;->a:Ll/mql0;

    .line 80
    .line 81
    if-ge v0, p1, :cond_0

    .line 82
    .line 83
    iget-object v1, v1, Ll/mql0;->i:Lv/VSegmentBar;

    .line 84
    .line 85
    invoke-virtual {v1, v0}, Lcom/google/android/material/tabs/TabLayout;->getTabAt(I)Lcom/google/android/material/tabs/TabLayout$Tab;

    .line 86
    .line 87
    .line 88
    move-result-object v1

    .line 89
    iget-object v1, v1, Lcom/google/android/material/tabs/TabLayout$Tab;->view:Lcom/google/android/material/tabs/TabLayout$TabView;

    .line 90
    .line 91
    sget v3, Ll/dbc0;->aj:I

    .line 92
    .line 93
    invoke-virtual {v1, v3}, Landroid/view/View;->setBackgroundResource(I)V

    .line 94
    .line 95
    .line 96
    add-int/lit8 v0, v0, 0x1

    .line 97
    .line 98
    goto :goto_0

    .line 99
    :cond_0
    iget-object p1, v1, Ll/mql0;->t:Lv/VIcon;

    .line 100
    .line 101
    sget v0, Ll/dbc0;->Hi:I

    .line 102
    .line 103
    invoke-virtual {p1, v0}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 104
    .line 105
    .line 106
    iget-object p1, p0, Ll/fql0;->a:Ll/mql0;

    .line 107
    .line 108
    iget-object p1, p1, Ll/mql0;->e:Lv/navigationbar/VNavigationBar;

    .line 109
    .line 110
    sget v0, Ll/dbc0;->Ii:I

    .line 111
    .line 112
    invoke-virtual {p1, v0}, Lv/navigationbar/VNavigationBar;->setLeftIconResource(I)V

    .line 113
    .line 114
    .line 115
    iget-object p1, p0, Ll/fql0;->a:Ll/mql0;

    .line 116
    .line 117
    iget-object p1, p1, Ll/mql0;->e:Lv/navigationbar/VNavigationBar;

    .line 118
    .line 119
    invoke-virtual {p1}, Lv/navigationbar/VNavigationBar;->getTitleContainer()Lv/VFrame;

    .line 120
    .line 121
    .line 122
    move-result-object p1

    .line 123
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 124
    .line 125
    .line 126
    move-result-object p1

    .line 127
    instance-of p1, p1, Landroid/widget/TextView;

    .line 128
    .line 129
    if-eqz p1, :cond_1

    .line 130
    .line 131
    iget-object p1, p0, Ll/fql0;->a:Ll/mql0;

    .line 132
    .line 133
    iget-object p1, p1, Ll/mql0;->e:Lv/navigationbar/VNavigationBar;

    .line 134
    .line 135
    invoke-virtual {p1}, Lv/navigationbar/VNavigationBar;->getTitleContainer()Lv/VFrame;

    .line 136
    .line 137
    .line 138
    move-result-object p1

    .line 139
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 140
    .line 141
    .line 142
    move-result-object p1

    .line 143
    check-cast p1, Landroid/widget/TextView;

    .line 144
    .line 145
    iget-object v0, p0, Ll/fql0;->a:Ll/mql0;

    .line 146
    .line 147
    invoke-interface {v0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 148
    .line 149
    .line 150
    move-result-object v0

    .line 151
    sget v1, Ll/c9c0;->f1:I

    .line 152
    .line 153
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->color(I)I

    .line 154
    .line 155
    .line 156
    move-result v0

    .line 157
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 158
    .line 159
    .line 160
    :cond_1
    invoke-virtual {p0, v2}, Ll/fql0;->a(Z)V

    .line 161
    .line 162
    .line 163
    return-void

    .line 164
    :cond_2
    sget-object v0, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_SUPREME_PARTNER:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 165
    .line 166
    iget-object v3, p0, Ll/fql0;->a:Ll/mql0;

    .line 167
    .line 168
    if-ne p1, v0, :cond_5

    .line 169
    .line 170
    iget-object v0, v3, Ll/mql0;->c:Landroid/widget/FrameLayout;

    .line 171
    .line 172
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 173
    .line 174
    .line 175
    invoke-virtual {p0, p1}, Ll/fql0;->g(Lcom/p1/mobile/putong/core/data/PurchaseType;)V

    .line 176
    .line 177
    .line 178
    iget-object p1, p0, Ll/fql0;->a:Ll/mql0;

    .line 179
    .line 180
    iget-object p1, p1, Ll/mql0;->b:Landroid/widget/FrameLayout;

    .line 181
    .line 182
    invoke-static {p1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 183
    .line 184
    .line 185
    iget-object p1, p0, Ll/fql0;->a:Ll/mql0;

    .line 186
    .line 187
    iget-object p1, p1, Ll/mql0;->i:Lv/VSegmentBar;

    .line 188
    .line 189
    sget v0, Ll/dbc0;->Ql:I

    .line 190
    .line 191
    invoke-virtual {p1, v0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 192
    .line 193
    .line 194
    iget-object p1, p0, Ll/fql0;->a:Ll/mql0;

    .line 195
    .line 196
    iget-object v0, p1, Ll/mql0;->i:Lv/VSegmentBar;

    .line 197
    .line 198
    invoke-interface {p1}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 199
    .line 200
    .line 201
    move-result-object p1

    .line 202
    sget v1, Ll/c9c0;->b0:I

    .line 203
    .line 204
    invoke-virtual {p1, v1}, Lcom/p1/mobile/android/app/Act;->color(I)I

    .line 205
    .line 206
    .line 207
    move-result p1

    .line 208
    iget-object v1, p0, Ll/fql0;->a:Ll/mql0;

    .line 209
    .line 210
    invoke-interface {v1}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 211
    .line 212
    .line 213
    move-result-object v1

    .line 214
    sget v3, Ll/c9c0;->I0:I

    .line 215
    .line 216
    invoke-virtual {v1, v3}, Lcom/p1/mobile/android/app/Act;->color(I)I

    .line 217
    .line 218
    .line 219
    move-result v1

    .line 220
    invoke-virtual {v0, p1, v1}, Lcom/google/android/material/tabs/TabLayout;->setTabTextColors(II)V

    .line 221
    .line 222
    .line 223
    iget-object p1, p0, Ll/fql0;->a:Ll/mql0;

    .line 224
    .line 225
    iget-object p1, p1, Ll/mql0;->i:Lv/VSegmentBar;

    .line 226
    .line 227
    invoke-virtual {p1}, Lcom/google/android/material/tabs/TabLayout;->getTabCount()I

    .line 228
    .line 229
    .line 230
    move-result p1

    .line 231
    move v0, v2

    .line 232
    :goto_1
    iget-object v1, p0, Ll/fql0;->a:Ll/mql0;

    .line 233
    .line 234
    if-ge v0, p1, :cond_3

    .line 235
    .line 236
    iget-object v1, v1, Ll/mql0;->i:Lv/VSegmentBar;

    .line 237
    .line 238
    invoke-virtual {v1, v0}, Lcom/google/android/material/tabs/TabLayout;->getTabAt(I)Lcom/google/android/material/tabs/TabLayout$Tab;

    .line 239
    .line 240
    .line 241
    move-result-object v1

    .line 242
    iget-object v1, v1, Lcom/google/android/material/tabs/TabLayout$Tab;->view:Lcom/google/android/material/tabs/TabLayout$TabView;

    .line 243
    .line 244
    sget v3, Ll/dbc0;->Yl:I

    .line 245
    .line 246
    invoke-virtual {v1, v3}, Landroid/view/View;->setBackgroundResource(I)V

    .line 247
    .line 248
    .line 249
    add-int/lit8 v0, v0, 0x1

    .line 250
    .line 251
    goto :goto_1

    .line 252
    :cond_3
    iget-object p1, v1, Ll/mql0;->t:Lv/VIcon;

    .line 253
    .line 254
    sget v0, Ll/dbc0;->Nl:I

    .line 255
    .line 256
    invoke-virtual {p1, v0}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 257
    .line 258
    .line 259
    iget-object p1, p0, Ll/fql0;->a:Ll/mql0;

    .line 260
    .line 261
    iget-object p1, p1, Ll/mql0;->e:Lv/navigationbar/VNavigationBar;

    .line 262
    .line 263
    sget v0, Ll/dbc0;->Pl:I

    .line 264
    .line 265
    invoke-virtual {p1, v0}, Lv/navigationbar/VNavigationBar;->setLeftIconResource(I)V

    .line 266
    .line 267
    .line 268
    iget-object p1, p0, Ll/fql0;->a:Ll/mql0;

    .line 269
    .line 270
    iget-object p1, p1, Ll/mql0;->e:Lv/navigationbar/VNavigationBar;

    .line 271
    .line 272
    invoke-virtual {p1}, Lv/navigationbar/VNavigationBar;->getTitleContainer()Lv/VFrame;

    .line 273
    .line 274
    .line 275
    move-result-object p1

    .line 276
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 277
    .line 278
    .line 279
    move-result-object p1

    .line 280
    instance-of p1, p1, Landroid/widget/TextView;

    .line 281
    .line 282
    if-eqz p1, :cond_4

    .line 283
    .line 284
    iget-object p1, p0, Ll/fql0;->a:Ll/mql0;

    .line 285
    .line 286
    iget-object p1, p1, Ll/mql0;->e:Lv/navigationbar/VNavigationBar;

    .line 287
    .line 288
    invoke-virtual {p1}, Lv/navigationbar/VNavigationBar;->getTitleContainer()Lv/VFrame;

    .line 289
    .line 290
    .line 291
    move-result-object p1

    .line 292
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 293
    .line 294
    .line 295
    move-result-object p1

    .line 296
    check-cast p1, Landroid/widget/TextView;

    .line 297
    .line 298
    iget-object v0, p0, Ll/fql0;->a:Ll/mql0;

    .line 299
    .line 300
    invoke-interface {v0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 301
    .line 302
    .line 303
    move-result-object v0

    .line 304
    sget v1, Ll/c9c0;->c2:I

    .line 305
    .line 306
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->color(I)I

    .line 307
    .line 308
    .line 309
    move-result v0

    .line 310
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 311
    .line 312
    .line 313
    :cond_4
    iget-object p1, p0, Ll/fql0;->a:Ll/mql0;

    .line 314
    .line 315
    iget-object p1, p1, Ll/mql0;->s:Landroid/view/View;

    .line 316
    .line 317
    invoke-static {p1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 318
    .line 319
    .line 320
    invoke-virtual {p0, v2}, Ll/fql0;->a(Z)V

    .line 321
    .line 322
    .line 323
    return-void

    .line 324
    :cond_5
    iget-object p1, v3, Ll/mql0;->c:Landroid/widget/FrameLayout;

    .line 325
    .line 326
    invoke-static {p1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 327
    .line 328
    .line 329
    iget-object p1, p0, Ll/fql0;->a:Ll/mql0;

    .line 330
    .line 331
    iget-object p1, p1, Ll/mql0;->b:Landroid/widget/FrameLayout;

    .line 332
    .line 333
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 334
    .line 335
    .line 336
    iget-object p1, p0, Ll/fql0;->a:Ll/mql0;

    .line 337
    .line 338
    iget-object p1, p1, Ll/mql0;->i:Lv/VSegmentBar;

    .line 339
    .line 340
    sget v0, Ll/c9c0;->c2:I

    .line 341
    .line 342
    invoke-virtual {p1, v0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 343
    .line 344
    .line 345
    iget-object p1, p0, Ll/fql0;->a:Ll/mql0;

    .line 346
    .line 347
    iget-object v0, p1, Ll/mql0;->i:Lv/VSegmentBar;

    .line 348
    .line 349
    invoke-interface {p1}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 350
    .line 351
    .line 352
    move-result-object p1

    .line 353
    sget v3, Ll/c9c0;->o:I

    .line 354
    .line 355
    invoke-virtual {p1, v3}, Lcom/p1/mobile/android/app/Act;->color(I)I

    .line 356
    .line 357
    .line 358
    move-result p1

    .line 359
    iget-object v3, p0, Ll/fql0;->a:Ll/mql0;

    .line 360
    .line 361
    invoke-interface {v3}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 362
    .line 363
    .line 364
    move-result-object v3

    .line 365
    sget v4, Ll/c9c0;->I:I

    .line 366
    .line 367
    invoke-virtual {v3, v4}, Lcom/p1/mobile/android/app/Act;->color(I)I

    .line 368
    .line 369
    .line 370
    move-result v3

    .line 371
    invoke-virtual {v0, p1, v3}, Lcom/google/android/material/tabs/TabLayout;->setTabTextColors(II)V

    .line 372
    .line 373
    .line 374
    iget-object p1, p0, Ll/fql0;->a:Ll/mql0;

    .line 375
    .line 376
    iget-object p1, p1, Ll/mql0;->i:Lv/VSegmentBar;

    .line 377
    .line 378
    invoke-virtual {p1}, Lcom/google/android/material/tabs/TabLayout;->getTabCount()I

    .line 379
    .line 380
    .line 381
    move-result p1

    .line 382
    move v0, v2

    .line 383
    :goto_2
    iget-object v3, p0, Ll/fql0;->a:Ll/mql0;

    .line 384
    .line 385
    if-ge v0, p1, :cond_6

    .line 386
    .line 387
    iget-object v3, v3, Ll/mql0;->i:Lv/VSegmentBar;

    .line 388
    .line 389
    invoke-virtual {v3, v0}, Lcom/google/android/material/tabs/TabLayout;->getTabAt(I)Lcom/google/android/material/tabs/TabLayout$Tab;

    .line 390
    .line 391
    .line 392
    move-result-object v3

    .line 393
    iget-object v3, v3, Lcom/google/android/material/tabs/TabLayout$Tab;->view:Lcom/google/android/material/tabs/TabLayout$TabView;

    .line 394
    .line 395
    sget v4, Ll/dbc0;->Xl:I

    .line 396
    .line 397
    invoke-virtual {v3, v4}, Landroid/view/View;->setBackgroundResource(I)V

    .line 398
    .line 399
    .line 400
    add-int/lit8 v0, v0, 0x1

    .line 401
    .line 402
    goto :goto_2

    .line 403
    :cond_6
    iget-object p1, v3, Ll/mql0;->t:Lv/VIcon;

    .line 404
    .line 405
    sget v0, Ll/dbc0;->Kl:I

    .line 406
    .line 407
    invoke-virtual {p1, v0}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 408
    .line 409
    .line 410
    iget-object p1, p0, Ll/fql0;->a:Ll/mql0;

    .line 411
    .line 412
    iget-object p1, p1, Ll/mql0;->e:Lv/navigationbar/VNavigationBar;

    .line 413
    .line 414
    sget v0, Ll/dbc0;->P:I

    .line 415
    .line 416
    invoke-virtual {p1, v0}, Lv/navigationbar/VNavigationBar;->setLeftIconResource(I)V

    .line 417
    .line 418
    .line 419
    iget-object p1, p0, Ll/fql0;->a:Ll/mql0;

    .line 420
    .line 421
    iget-object p1, p1, Ll/mql0;->e:Lv/navigationbar/VNavigationBar;

    .line 422
    .line 423
    invoke-virtual {p1}, Lv/navigationbar/VNavigationBar;->getTitleContainer()Lv/VFrame;

    .line 424
    .line 425
    .line 426
    move-result-object p1

    .line 427
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 428
    .line 429
    .line 430
    move-result-object p1

    .line 431
    instance-of p1, p1, Landroid/widget/TextView;

    .line 432
    .line 433
    if-eqz p1, :cond_7

    .line 434
    .line 435
    iget-object p1, p0, Ll/fql0;->a:Ll/mql0;

    .line 436
    .line 437
    iget-object p1, p1, Ll/mql0;->e:Lv/navigationbar/VNavigationBar;

    .line 438
    .line 439
    invoke-virtual {p1}, Lv/navigationbar/VNavigationBar;->getTitleContainer()Lv/VFrame;

    .line 440
    .line 441
    .line 442
    move-result-object p1

    .line 443
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 444
    .line 445
    .line 446
    move-result-object p1

    .line 447
    check-cast p1, Landroid/widget/TextView;

    .line 448
    .line 449
    iget-object v0, p0, Ll/fql0;->a:Ll/mql0;

    .line 450
    .line 451
    invoke-interface {v0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 452
    .line 453
    .line 454
    move-result-object v0

    .line 455
    sget v2, Ll/c9c0;->p:I

    .line 456
    .line 457
    invoke-virtual {v0, v2}, Lcom/p1/mobile/android/app/Act;->color(I)I

    .line 458
    .line 459
    .line 460
    move-result v0

    .line 461
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 462
    .line 463
    .line 464
    :cond_7
    iget-object p1, p0, Ll/fql0;->a:Ll/mql0;

    .line 465
    .line 466
    iget-object p1, p1, Ll/mql0;->s:Landroid/view/View;

    .line 467
    .line 468
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 469
    .line 470
    .line 471
    invoke-virtual {p0, v1}, Ll/fql0;->a(Z)V

    .line 472
    .line 473
    .line 474
    return-void
.end method

.method public e(Lcom/p1/mobile/putong/core/data/PurchaseType;FI)V
    .locals 0

    .line 1
    sget-object p3, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_SUPREME_PARTNER:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 2
    .line 3
    if-eq p1, p3, :cond_1

    .line 4
    .line 5
    invoke-static {p1}, Ll/wib0;->i(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    invoke-static {}, Ll/s7a;->o()Z

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    if-eqz p1, :cond_0

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    iget-object p0, p0, Ll/fql0;->a:Ll/mql0;

    .line 19
    .line 20
    iget-object p0, p0, Ll/mql0;->c:Landroid/widget/FrameLayout;

    .line 21
    .line 22
    invoke-virtual {p0, p2}, Landroid/view/View;->setAlpha(F)V

    .line 23
    .line 24
    .line 25
    return-void

    .line 26
    :cond_1
    :goto_0
    iget-object p0, p0, Ll/fql0;->a:Ll/mql0;

    .line 27
    .line 28
    iget-object p0, p0, Ll/mql0;->c:Landroid/widget/FrameLayout;

    .line 29
    .line 30
    const/high16 p1, 0x3f800000    # 1.0f

    .line 31
    .line 32
    sub-float/2addr p1, p2

    .line 33
    invoke-virtual {p0, p1}, Landroid/view/View;->setAlpha(F)V

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public f(Lcom/p1/mobile/putong/core/data/PurchaseType;)V
    .locals 3

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_SUPREME_PARTNER:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-eq p1, v0, :cond_1

    .line 5
    .line 6
    invoke-static {p1}, Ll/wib0;->i(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    invoke-static {}, Ll/s7a;->o()Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-eqz v0, :cond_0

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_0
    iget-object p0, p0, Ll/fql0;->a:Ll/mql0;

    .line 20
    .line 21
    iget-object p0, p0, Ll/mql0;->b:Landroid/widget/FrameLayout;

    .line 22
    .line 23
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 24
    .line 25
    .line 26
    return-void

    .line 27
    :cond_1
    :goto_0
    iget-object v0, p0, Ll/fql0;->a:Ll/mql0;

    .line 28
    .line 29
    iget-object v0, v0, Ll/mql0;->c:Landroid/widget/FrameLayout;

    .line 30
    .line 31
    const/4 v2, 0x0

    .line 32
    invoke-virtual {v0, v2}, Landroid/view/View;->setAlpha(F)V

    .line 33
    .line 34
    .line 35
    iget-object v0, p0, Ll/fql0;->a:Ll/mql0;

    .line 36
    .line 37
    iget-object v0, v0, Ll/mql0;->c:Landroid/widget/FrameLayout;

    .line 38
    .line 39
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 40
    .line 41
    .line 42
    invoke-virtual {p0, p1}, Ll/fql0;->g(Lcom/p1/mobile/putong/core/data/PurchaseType;)V

    .line 43
    .line 44
    .line 45
    return-void
.end method

.method public g(Lcom/p1/mobile/putong/core/data/PurchaseType;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/fql0;->a:Ll/mql0;

    .line 2
    .line 3
    iget-object v0, v0, Ll/mql0;->c:Landroid/widget/FrameLayout;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/fql0;->b(Lcom/p1/mobile/putong/core/data/PurchaseType;)Landroid/graphics/drawable/Drawable;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0, p1}, Ll/fql0;->h(Lcom/p1/mobile/putong/core/data/PurchaseType;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public final h(Lcom/p1/mobile/putong/core/data/PurchaseType;)V
    .locals 3

    .line 1
    invoke-static {p1}, Ll/wib0;->i(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const v1, 0x43bb8000    # 375.0f

    .line 6
    .line 7
    .line 8
    if-eqz v0, :cond_1

    .line 9
    .line 10
    invoke-static {}, Ll/s7a;->o()Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-eqz v0, :cond_1

    .line 15
    .line 16
    iget-object p1, p0, Ll/fql0;->a:Ll/mql0;

    .line 17
    .line 18
    iget-object p1, p1, Ll/mql0;->d:Lv/VDraweeView;

    .line 19
    .line 20
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    invoke-static {}, Ll/bnl0;->y0()I

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    mul-int/lit16 v0, v0, 0xe4

    .line 29
    .line 30
    div-int/lit16 v0, v0, 0x177

    .line 31
    .line 32
    iget v2, p1, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 33
    .line 34
    if-eq v2, v0, :cond_0

    .line 35
    .line 36
    iput v0, p1, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 37
    .line 38
    iget-object v0, p0, Ll/fql0;->a:Ll/mql0;

    .line 39
    .line 40
    iget-object v0, v0, Ll/mql0;->d:Lv/VDraweeView;

    .line 41
    .line 42
    invoke-virtual {v0, p1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 43
    .line 44
    .line 45
    :cond_0
    sget-object p1, Ll/uqb0;->G:Ll/fsb0;

    .line 46
    .line 47
    iget-object p0, p0, Ll/fql0;->a:Ll/mql0;

    .line 48
    .line 49
    iget-object p0, p0, Ll/mql0;->d:Lv/VDraweeView;

    .line 50
    .line 51
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 52
    .line 53
    .line 54
    move-result v0

    .line 55
    const/high16 v1, 0x43640000    # 228.0f

    .line 56
    .line 57
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 58
    .line 59
    .line 60
    move-result v1

    .line 61
    const-string v2, "https://auto.tancdn.com/v1/images/eyJpZCI6IkhBM0NSVVlTWVNTNUg0WDNXQ0RHUVVXTEVYWjVZTzE0IiwidyI6MTEyNSwiaCI6Njg0LCJkIjowLCJtdCI6ImltYWdlL2pwZWciLCJkaCI6NjQ2NzcxNTQ1NzV9.png"

    .line 62
    .line 63
    invoke-virtual {p1, p0, v2, v0, v1}, Ll/fsb0;->I0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;II)Lcom/facebook/imagepipeline/request/ImageRequest;

    .line 64
    .line 65
    .line 66
    return-void

    .line 67
    :cond_1
    sget-object v0, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_SUPREME_PARTNER:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 68
    .line 69
    if-ne p1, v0, :cond_3

    .line 70
    .line 71
    iget-object p1, p0, Ll/fql0;->a:Ll/mql0;

    .line 72
    .line 73
    iget-object p1, p1, Ll/mql0;->d:Lv/VDraweeView;

    .line 74
    .line 75
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 76
    .line 77
    .line 78
    move-result-object p1

    .line 79
    invoke-static {}, Ll/bnl0;->y0()I

    .line 80
    .line 81
    .line 82
    move-result v0

    .line 83
    mul-int/lit16 v0, v0, 0x108

    .line 84
    .line 85
    div-int/lit16 v0, v0, 0x177

    .line 86
    .line 87
    iget v2, p1, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 88
    .line 89
    if-eq v2, v0, :cond_2

    .line 90
    .line 91
    iput v0, p1, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 92
    .line 93
    iget-object v0, p0, Ll/fql0;->a:Ll/mql0;

    .line 94
    .line 95
    iget-object v0, v0, Ll/mql0;->d:Lv/VDraweeView;

    .line 96
    .line 97
    invoke-virtual {v0, p1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 98
    .line 99
    .line 100
    :cond_2
    sget-object p1, Ll/uqb0;->G:Ll/fsb0;

    .line 101
    .line 102
    iget-object p0, p0, Ll/fql0;->a:Ll/mql0;

    .line 103
    .line 104
    iget-object p0, p0, Ll/mql0;->d:Lv/VDraweeView;

    .line 105
    .line 106
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 107
    .line 108
    .line 109
    move-result v0

    .line 110
    const/high16 v1, 0x43840000    # 264.0f

    .line 111
    .line 112
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 113
    .line 114
    .line 115
    move-result v1

    .line 116
    const-string v2, "https://fe-static.tancdn.com/v1/images/eyJpZCI6IlBWUDJWMzVPUlZCQ0tRNFNXUTdRUVQ2UlBLSkNMSzE0IiwidyI6MTEyNSwiaCI6NzkyLCJkIjowLCJtdCI6ImltYWdlL2pwZWciLCJkaCI6NDQ4MTAzNjExMX0.png"

    .line 117
    .line 118
    invoke-virtual {p1, p0, v2, v0, v1}, Ll/fsb0;->I0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;II)Lcom/facebook/imagepipeline/request/ImageRequest;

    .line 119
    .line 120
    .line 121
    :cond_3
    return-void
.end method

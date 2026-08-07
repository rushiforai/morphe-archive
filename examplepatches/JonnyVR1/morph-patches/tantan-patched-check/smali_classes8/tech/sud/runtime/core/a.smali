.class Ltech/sud/runtime/core/a;
.super Landroid/widget/FrameLayout;
.source "SourceFile"


# instance fields
.field private final a:Ltech/sud/runtime/core/i;

.field private final b:Ltech/sud/runtime/core/c;

.field private final c:Ltech/sud/runtime/component/e/d;

.field private final d:Ltech/sud/runtime/component/e/b;

.field private e:Z

.field private f:Z

.field private g:Z

.field private h:Z

.field private i:I

.field private j:I

.field private k:I

.field private final l:Ltech/sud/runtime/component/i/b;

.field private final m:Ltech/sud/runtime/core/g;

.field private n:Ltech/sud/runtime/component/c/h;

.field private o:Ltech/sud/runtime/component/a/a;


# direct methods
.method public constructor <init>(Landroid/content/Context;ILtech/sud/runtime/core/g;ZILjava/lang/String;Ltech/sud/runtime/component/d/a;Ljava/lang/Integer;)V
    .locals 8

    .line 1
    invoke-direct/range {p0 .. p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const/4 v2, 0x0

    .line 5
    iput-boolean v2, p0, Ltech/sud/runtime/core/a;->e:Z

    .line 6
    .line 7
    iput-boolean v2, p0, Ltech/sud/runtime/core/a;->f:Z

    .line 8
    .line 9
    const/4 v3, 0x1

    .line 10
    iput-boolean v3, p0, Ltech/sud/runtime/core/a;->g:Z

    .line 11
    .line 12
    iput-boolean v2, p0, Ltech/sud/runtime/core/a;->h:Z

    .line 13
    .line 14
    const/4 v6, -0x1

    .line 15
    iput v6, p0, Ltech/sud/runtime/core/a;->i:I

    .line 16
    .line 17
    iput v2, p0, Ltech/sud/runtime/core/a;->j:I

    .line 18
    .line 19
    iput v2, p0, Ltech/sud/runtime/core/a;->k:I

    .line 20
    .line 21
    new-instance v4, Ltech/sud/runtime/component/c/h;

    .line 22
    .line 23
    invoke-direct {v4}, Ltech/sud/runtime/component/c/h;-><init>()V

    .line 24
    .line 25
    .line 26
    iput-object v4, p0, Ltech/sud/runtime/core/a;->n:Ltech/sud/runtime/component/c/h;

    .line 27
    .line 28
    iput-object p3, p0, Ltech/sud/runtime/core/a;->m:Ltech/sud/runtime/core/g;

    .line 29
    .line 30
    and-int/lit8 v4, p2, 0x10

    .line 31
    .line 32
    if-eqz v4, :cond_0

    .line 33
    .line 34
    move v4, v3

    .line 35
    goto :goto_0

    .line 36
    :cond_0
    move v4, v2

    .line 37
    :goto_0
    iput-boolean v4, p0, Ltech/sud/runtime/core/a;->f:Z

    .line 38
    .line 39
    and-int/lit8 v4, p2, 0x2

    .line 40
    .line 41
    if-eqz v4, :cond_1

    .line 42
    .line 43
    move v5, v3

    .line 44
    goto :goto_1

    .line 45
    :cond_1
    move v5, v2

    .line 46
    :goto_1
    iput-boolean v5, p0, Ltech/sud/runtime/core/a;->g:Z

    .line 47
    .line 48
    and-int/lit8 v5, p2, 0x40

    .line 49
    .line 50
    if-eqz v5, :cond_2

    .line 51
    .line 52
    move v5, v3

    .line 53
    goto :goto_2

    .line 54
    :cond_2
    move v5, v2

    .line 55
    :goto_2
    iput-boolean v5, p0, Ltech/sud/runtime/core/a;->h:Z

    .line 56
    .line 57
    and-int/lit16 v5, p2, 0x80

    .line 58
    .line 59
    if-eqz v5, :cond_3

    .line 60
    .line 61
    move v5, v3

    .line 62
    goto :goto_3

    .line 63
    :cond_3
    move v5, v2

    .line 64
    :goto_3
    iput-boolean v5, p0, Ltech/sud/runtime/core/a;->e:Z

    .line 65
    .line 66
    move v5, v2

    .line 67
    new-instance v2, Ltech/sud/runtime/core/i;

    .line 68
    .line 69
    new-instance v7, Ltech/sud/runtime/core/a$1;

    .line 70
    .line 71
    invoke-direct {v7, p0}, Ltech/sud/runtime/core/a$1;-><init>(Ltech/sud/runtime/core/a;)V

    .line 72
    .line 73
    .line 74
    invoke-direct {v2, p3, p1, v7}, Ltech/sud/runtime/core/i;-><init>(Ltech/sud/runtime/core/g;Landroid/content/Context;Ltech/sud/runtime/core/i$a;)V

    .line 75
    .line 76
    .line 77
    iput-object v2, p0, Ltech/sud/runtime/core/a;->a:Ltech/sud/runtime/core/i;

    .line 78
    .line 79
    new-instance v7, Ltech/sud/runtime/component/i/b;

    .line 80
    .line 81
    invoke-direct {v7, v2, p3}, Ltech/sud/runtime/component/i/b;-><init>(Landroid/widget/FrameLayout;Ltech/sud/runtime/core/g;)V

    .line 82
    .line 83
    .line 84
    iput-object v7, p0, Ltech/sud/runtime/core/a;->l:Ltech/sud/runtime/component/i/b;

    .line 85
    .line 86
    if-eqz v4, :cond_5

    .line 87
    .line 88
    new-instance v4, Ltech/sud/runtime/core/f;

    .line 89
    .line 90
    invoke-direct {v4, p3, p1}, Ltech/sud/runtime/core/f;-><init>(Ltech/sud/runtime/core/g;Landroid/content/Context;)V

    .line 91
    .line 92
    .line 93
    and-int/lit8 v0, p2, 0x1

    .line 94
    .line 95
    if-nez v0, :cond_4

    .line 96
    .line 97
    goto :goto_4

    .line 98
    :cond_4
    move v3, v5

    .line 99
    :goto_4
    invoke-virtual {v4, v3}, Landroid/view/TextureView;->setOpaque(Z)V

    .line 100
    .line 101
    .line 102
    move-object v0, p7

    .line 103
    invoke-virtual {v4, p7}, Ltech/sud/runtime/component/c/d;->setExternalInterface(Ltech/sud/runtime/component/d/a;)V

    .line 104
    .line 105
    .line 106
    iput-object v4, p0, Ltech/sud/runtime/core/a;->b:Ltech/sud/runtime/core/c;

    .line 107
    .line 108
    goto :goto_6

    .line 109
    :cond_5
    new-instance v4, Ltech/sud/runtime/core/e;

    .line 110
    .line 111
    and-int/lit8 v0, p2, 0x1

    .line 112
    .line 113
    if-eqz v0, :cond_6

    .line 114
    .line 115
    goto :goto_5

    .line 116
    :cond_6
    move v3, v5

    .line 117
    :goto_5
    invoke-direct {v4, p3, p1, v3}, Ltech/sud/runtime/core/e;-><init>(Ltech/sud/runtime/core/g;Landroid/content/Context;Z)V

    .line 118
    .line 119
    .line 120
    iput-object v4, p0, Ltech/sud/runtime/core/a;->b:Ltech/sud/runtime/core/c;

    .line 121
    .line 122
    :goto_6
    invoke-virtual {v2, v4}, Ltech/sud/runtime/core/i;->a(Landroid/view/View;)V

    .line 123
    .line 124
    .line 125
    new-instance v0, Ltech/sud/runtime/component/e/d;

    .line 126
    .line 127
    invoke-direct {v0, p1, p3}, Ltech/sud/runtime/component/e/d;-><init>(Landroid/content/Context;Ltech/sud/runtime/core/g;)V

    .line 128
    .line 129
    .line 130
    iput-object v0, p0, Ltech/sud/runtime/core/a;->c:Ltech/sud/runtime/component/e/d;

    .line 131
    .line 132
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 133
    .line 134
    .line 135
    invoke-virtual {v2, v0}, Ltech/sud/runtime/core/i;->a(Ltech/sud/runtime/component/e/d;)V

    .line 136
    .line 137
    .line 138
    iget-object v3, p0, Ltech/sud/runtime/core/a;->b:Ltech/sud/runtime/core/c;

    .line 139
    .line 140
    invoke-interface {v3}, Ltech/sud/runtime/core/c;->a()Ltech/sud/runtime/core/d;

    .line 141
    .line 142
    .line 143
    move-result-object v3

    .line 144
    invoke-virtual {v3, v0}, Ltech/sud/runtime/core/d;->a(Ltech/sud/runtime/component/e/d;)V

    .line 145
    .line 146
    .line 147
    new-instance v0, Ltech/sud/runtime/component/a/a;

    .line 148
    .line 149
    move-object v1, p1

    .line 150
    move v5, p4

    .line 151
    move v3, p5

    .line 152
    move-object v4, p6

    .line 153
    invoke-direct/range {v0 .. v5}, Ltech/sud/runtime/component/a/a;-><init>(Landroid/content/Context;Landroid/widget/FrameLayout;ILjava/lang/String;Z)V

    .line 154
    .line 155
    .line 156
    iput-object v0, p0, Ltech/sud/runtime/core/a;->o:Ltech/sud/runtime/component/a/a;

    .line 157
    .line 158
    iget-object v0, p0, Ltech/sud/runtime/core/a;->n:Ltech/sud/runtime/component/c/h;

    .line 159
    .line 160
    invoke-virtual {v0, p1, p3}, Ltech/sud/runtime/component/c/h;->a(Landroid/content/Context;Ltech/sud/runtime/core/g;)V

    .line 161
    .line 162
    .line 163
    invoke-direct {p0}, Ltech/sud/runtime/core/a;->j()V

    .line 164
    .line 165
    .line 166
    new-instance v0, Landroid/widget/FrameLayout$LayoutParams;

    .line 167
    .line 168
    invoke-direct {v0, v6, v6}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 169
    .line 170
    .line 171
    invoke-virtual {v2, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 172
    .line 173
    .line 174
    invoke-virtual {p0, v2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 175
    .line 176
    .line 177
    new-instance v0, Ltech/sud/runtime/component/e/b;

    .line 178
    .line 179
    move-object/from16 v1, p8

    .line 180
    .line 181
    invoke-direct {v0, v2, p3, v1}, Ltech/sud/runtime/component/e/b;-><init>(Landroid/widget/FrameLayout;Ltech/sud/runtime/core/g;Ljava/lang/Integer;)V

    .line 182
    .line 183
    .line 184
    iput-object v0, p0, Ltech/sud/runtime/core/a;->d:Ltech/sud/runtime/component/e/b;

    .line 185
    .line 186
    return-void
.end method

.method private a(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    .line 51
    invoke-direct {p0, p1, v0}, Ltech/sud/runtime/core/a;->a(Landroid/content/Context;Z)V

    return-void
.end method

.method private a(Landroid/content/Context;Z)V
    .locals 2

    .line 1
    iget-boolean p2, p0, Ltech/sud/runtime/core/a;->e:Z

    .line 2
    .line 3
    if-eqz p2, :cond_0

    .line 4
    .line 5
    goto :goto_2

    .line 6
    :cond_0
    invoke-static {p1}, Ltech/sud/runtime/component/h/c;->a(Landroid/content/Context;)Landroid/app/Activity;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    invoke-virtual {p1}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    invoke-virtual {p1}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    invoke-virtual {p1}, Landroid/view/View;->getSystemUiVisibility()I

    .line 19
    .line 20
    .line 21
    move-result p2

    .line 22
    iget-boolean v0, p0, Ltech/sud/runtime/core/a;->g:Z

    .line 23
    .line 24
    if-eqz v0, :cond_1

    .line 25
    .line 26
    const/16 v1, 0x404

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_1
    const/4 v1, 0x0

    .line 30
    :goto_0
    iget-boolean p0, p0, Ltech/sud/runtime/core/a;->f:Z

    .line 31
    .line 32
    if-eqz p0, :cond_3

    .line 33
    .line 34
    or-int/lit16 p0, v1, 0x1002

    .line 35
    .line 36
    if-eqz v0, :cond_2

    .line 37
    .line 38
    or-int/lit16 v1, v1, 0x1302

    .line 39
    .line 40
    goto :goto_1

    .line 41
    :cond_2
    move v1, p0

    .line 42
    :cond_3
    :goto_1
    if-ne p2, v1, :cond_4

    .line 43
    .line 44
    :goto_2
    return-void

    .line 45
    :cond_4
    invoke-virtual {p1, v1}, Landroid/view/View;->setSystemUiVisibility(I)V

    .line 46
    .line 47
    .line 48
    return-void
.end method

.method public static synthetic a(Ltech/sud/runtime/core/a;)V
    .locals 0

    .line 52
    invoke-direct {p0}, Ltech/sud/runtime/core/a;->j()V

    return-void
.end method

.method public static synthetic a(Ltech/sud/runtime/core/a;Landroid/content/Context;)V
    .locals 0

    .line 49
    invoke-direct {p0, p1}, Ltech/sud/runtime/core/a;->a(Landroid/content/Context;)V

    return-void
.end method

.method private j()V
    .locals 10

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-direct {p0, v0}, Ltech/sud/runtime/core/a;->a(Landroid/content/Context;)V

    .line 6
    .line 7
    .line 8
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 9
    .line 10
    invoke-static {}, Ltech/sud/runtime/component/c/b;->a()Ltech/sud/runtime/component/c/b$a;

    .line 11
    .line 12
    .line 13
    move-result-object v2

    .line 14
    iget-boolean v3, p0, Ltech/sud/runtime/core/a;->h:Z

    .line 15
    .line 16
    const/16 v4, 0x1c

    .line 17
    .line 18
    const/4 v5, 0x0

    .line 19
    if-eqz v3, :cond_0

    .line 20
    .line 21
    if-lt v1, v4, :cond_0

    .line 22
    .line 23
    sget-object v6, Ltech/sud/runtime/component/c/b$a;->a:Ltech/sud/runtime/component/c/b$a;

    .line 24
    .line 25
    if-ne v2, v6, :cond_0

    .line 26
    .line 27
    invoke-static {v0}, Ltech/sud/runtime/component/c/g;->d(Landroid/content/Context;)Z

    .line 28
    .line 29
    .line 30
    move-result v6

    .line 31
    if-nez v6, :cond_0

    .line 32
    .line 33
    move v3, v5

    .line 34
    :cond_0
    const/16 v6, 0x1b

    .line 35
    .line 36
    const/16 v7, 0x1a

    .line 37
    .line 38
    if-nez v3, :cond_5

    .line 39
    .line 40
    iget v8, p0, Ltech/sud/runtime/core/a;->i:I

    .line 41
    .line 42
    if-gez v8, :cond_5

    .line 43
    .line 44
    if-eq v1, v7, :cond_2

    .line 45
    .line 46
    if-ne v1, v6, :cond_1

    .line 47
    .line 48
    goto :goto_0

    .line 49
    :cond_1
    if-lt v1, v4, :cond_5

    .line 50
    .line 51
    invoke-static {v0}, Ltech/sud/runtime/component/c/g;->b(Landroid/content/Context;)Z

    .line 52
    .line 53
    .line 54
    move-result v8

    .line 55
    if-eqz v8, :cond_5

    .line 56
    .line 57
    invoke-static {v0}, Ltech/sud/runtime/component/c/g;->n(Landroid/content/Context;)V

    .line 58
    .line 59
    .line 60
    goto :goto_1

    .line 61
    :cond_2
    :goto_0
    sget-object v8, Ltech/sud/runtime/component/c/b$a;->d:Ltech/sud/runtime/component/c/b$a;

    .line 62
    .line 63
    if-ne v2, v8, :cond_3

    .line 64
    .line 65
    invoke-static {v0}, Ltech/sud/runtime/component/c/g;->f(Landroid/content/Context;)Z

    .line 66
    .line 67
    .line 68
    move-result v8

    .line 69
    if-eqz v8, :cond_5

    .line 70
    .line 71
    invoke-static {v0}, Ltech/sud/runtime/component/c/g;->m(Landroid/content/Context;)I

    .line 72
    .line 73
    .line 74
    move-result v8

    .line 75
    iput v8, p0, Ltech/sud/runtime/core/a;->i:I

    .line 76
    .line 77
    goto :goto_1

    .line 78
    :cond_3
    sget-object v8, Ltech/sud/runtime/component/c/b$a;->c:Ltech/sud/runtime/component/c/b$a;

    .line 79
    .line 80
    if-ne v2, v8, :cond_4

    .line 81
    .line 82
    invoke-static {v0}, Ltech/sud/runtime/component/c/g;->g(Landroid/content/Context;)Z

    .line 83
    .line 84
    .line 85
    move-result v8

    .line 86
    if-eqz v8, :cond_5

    .line 87
    .line 88
    invoke-static {v0}, Ltech/sud/runtime/component/c/g;->m(Landroid/content/Context;)I

    .line 89
    .line 90
    .line 91
    move-result v8

    .line 92
    iput v8, p0, Ltech/sud/runtime/core/a;->i:I

    .line 93
    .line 94
    goto :goto_1

    .line 95
    :cond_4
    sget-object v8, Ltech/sud/runtime/component/c/b$a;->f:Ltech/sud/runtime/component/c/b$a;

    .line 96
    .line 97
    if-ne v2, v8, :cond_5

    .line 98
    .line 99
    invoke-static {v0}, Ltech/sud/runtime/component/c/g;->h(Landroid/content/Context;)Z

    .line 100
    .line 101
    .line 102
    move-result v8

    .line 103
    if-eqz v8, :cond_5

    .line 104
    .line 105
    invoke-static {}, Ltech/sud/runtime/component/c/g;->b()I

    .line 106
    .line 107
    .line 108
    move-result v8

    .line 109
    iput v8, p0, Ltech/sud/runtime/core/a;->i:I

    .line 110
    .line 111
    :cond_5
    :goto_1
    iget v8, p0, Ltech/sud/runtime/core/a;->i:I

    .line 112
    .line 113
    if-lez v8, :cond_8

    .line 114
    .line 115
    iget v8, p0, Ltech/sud/runtime/core/a;->k:I

    .line 116
    .line 117
    if-lez v8, :cond_8

    .line 118
    .line 119
    iget-object v8, p0, Ltech/sud/runtime/core/a;->n:Ltech/sud/runtime/component/c/h;

    .line 120
    .line 121
    iget-object v9, p0, Ltech/sud/runtime/core/a;->m:Ltech/sud/runtime/core/g;

    .line 122
    .line 123
    invoke-virtual {v8, v0, v9}, Ltech/sud/runtime/component/c/h;->a(Landroid/content/Context;Ltech/sud/runtime/core/g;)V

    .line 124
    .line 125
    .line 126
    invoke-static {v0}, Ltech/sud/runtime/component/c/h;->b(Landroid/content/Context;)Z

    .line 127
    .line 128
    .line 129
    move-result v9

    .line 130
    if-eqz v9, :cond_6

    .line 131
    .line 132
    iget v9, p0, Ltech/sud/runtime/core/a;->k:I

    .line 133
    .line 134
    iget v8, v8, Ltech/sud/runtime/component/c/h;->b:I

    .line 135
    .line 136
    if-ne v9, v8, :cond_7

    .line 137
    .line 138
    iget v8, p0, Ltech/sud/runtime/core/a;->i:I

    .line 139
    .line 140
    move v9, v8

    .line 141
    move v8, v5

    .line 142
    goto :goto_2

    .line 143
    :cond_6
    iget v9, p0, Ltech/sud/runtime/core/a;->j:I

    .line 144
    .line 145
    iget v8, v8, Ltech/sud/runtime/component/c/h;->b:I

    .line 146
    .line 147
    if-ne v9, v8, :cond_7

    .line 148
    .line 149
    invoke-static {}, Ltech/sud/runtime/component/c/b;->b()Z

    .line 150
    .line 151
    .line 152
    move-result v8

    .line 153
    if-nez v8, :cond_7

    .line 154
    .line 155
    iget v8, p0, Ltech/sud/runtime/core/a;->i:I

    .line 156
    .line 157
    move v9, v5

    .line 158
    goto :goto_2

    .line 159
    :cond_7
    move v8, v5

    .line 160
    move v9, v8

    .line 161
    :goto_2
    invoke-virtual {p0, v8, v9, v5, v5}, Landroid/view/View;->setPadding(IIII)V

    .line 162
    .line 163
    .line 164
    :cond_8
    if-eqz v3, :cond_f

    .line 165
    .line 166
    if-eq v1, v7, :cond_a

    .line 167
    .line 168
    if-ne v1, v6, :cond_9

    .line 169
    .line 170
    goto :goto_3

    .line 171
    :cond_9
    if-lt v1, v4, :cond_c

    .line 172
    .line 173
    invoke-static {v0}, Ltech/sud/runtime/component/c/g;->o(Landroid/content/Context;)V

    .line 174
    .line 175
    .line 176
    goto :goto_4

    .line 177
    :cond_a
    :goto_3
    sget-object v1, Ltech/sud/runtime/component/c/b$a;->b:Ltech/sud/runtime/component/c/b$a;

    .line 178
    .line 179
    if-ne v2, v1, :cond_b

    .line 180
    .line 181
    invoke-static {}, Ltech/sud/runtime/component/c/g;->a()Z

    .line 182
    .line 183
    .line 184
    move-result v1

    .line 185
    if-eqz v1, :cond_c

    .line 186
    .line 187
    invoke-static {v0}, Ltech/sud/runtime/component/c/g;->e(Landroid/content/Context;)Z

    .line 188
    .line 189
    .line 190
    move-result v1

    .line 191
    if-eqz v1, :cond_c

    .line 192
    .line 193
    invoke-static {v0}, Ltech/sud/runtime/component/c/g;->p(Landroid/content/Context;)V

    .line 194
    .line 195
    .line 196
    goto :goto_4

    .line 197
    :cond_b
    sget-object v1, Ltech/sud/runtime/component/c/b$a;->a:Ltech/sud/runtime/component/c/b$a;

    .line 198
    .line 199
    if-ne v2, v1, :cond_c

    .line 200
    .line 201
    invoke-static {v0}, Ltech/sud/runtime/component/c/g;->c(Landroid/content/Context;)Z

    .line 202
    .line 203
    .line 204
    move-result v1

    .line 205
    if-eqz v1, :cond_c

    .line 206
    .line 207
    invoke-static {v0}, Ltech/sud/runtime/component/c/g;->d(Landroid/content/Context;)Z

    .line 208
    .line 209
    .line 210
    move-result v1

    .line 211
    if-eqz v1, :cond_c

    .line 212
    .line 213
    invoke-static {v0}, Ltech/sud/runtime/component/c/g;->q(Landroid/content/Context;)V

    .line 214
    .line 215
    .line 216
    :cond_c
    :goto_4
    sget-object v1, Ltech/sud/runtime/component/c/b$a;->f:Ltech/sud/runtime/component/c/b$a;

    .line 217
    .line 218
    if-ne v2, v1, :cond_d

    .line 219
    .line 220
    invoke-static {v0}, Ltech/sud/runtime/component/c/h;->b(Landroid/content/Context;)Z

    .line 221
    .line 222
    .line 223
    move-result v1

    .line 224
    if-nez v1, :cond_d

    .line 225
    .line 226
    iget-object p0, p0, Ltech/sud/runtime/core/a;->m:Ltech/sud/runtime/core/g;

    .line 227
    .line 228
    invoke-virtual {p0, v5, v5, v5}, Ltech/sud/runtime/core/g;->a(ZII)V

    .line 229
    .line 230
    .line 231
    return-void

    .line 232
    :cond_d
    invoke-static {v0}, Ltech/sud/runtime/component/c/g;->a(Landroid/content/Context;)Z

    .line 233
    .line 234
    .line 235
    move-result v1

    .line 236
    if-eqz v1, :cond_e

    .line 237
    .line 238
    invoke-static {v0}, Ltech/sud/runtime/component/c/g;->i(Landroid/content/Context;)[I

    .line 239
    .line 240
    .line 241
    move-result-object v0

    .line 242
    iget-object p0, p0, Ltech/sud/runtime/core/a;->m:Ltech/sud/runtime/core/g;

    .line 243
    .line 244
    aget v1, v0, v5

    .line 245
    .line 246
    const/4 v2, 0x1

    .line 247
    aget v0, v0, v2

    .line 248
    .line 249
    invoke-virtual {p0, v2, v1, v0}, Ltech/sud/runtime/core/g;->a(ZII)V

    .line 250
    .line 251
    .line 252
    return-void

    .line 253
    :cond_e
    iget-object p0, p0, Ltech/sud/runtime/core/a;->m:Ltech/sud/runtime/core/g;

    .line 254
    .line 255
    invoke-virtual {p0, v5, v5, v5}, Ltech/sud/runtime/core/g;->a(ZII)V

    .line 256
    .line 257
    .line 258
    return-void

    .line 259
    :cond_f
    iget-object p0, p0, Ltech/sud/runtime/core/a;->m:Ltech/sud/runtime/core/g;

    .line 260
    .line 261
    invoke-virtual {p0, v5, v5, v5}, Ltech/sud/runtime/core/g;->a(ZII)V

    .line 262
    .line 263
    .line 264
    return-void
.end method


# virtual methods
.method public a()Ltech/sud/runtime/component/i/b;
    .locals 0

    .line 50
    iget-object p0, p0, Ltech/sud/runtime/core/a;->l:Ltech/sud/runtime/component/i/b;

    return-object p0
.end method

.method public b()Ltech/sud/runtime/component/e/d;
    .locals 0

    .line 1
    iget-object p0, p0, Ltech/sud/runtime/core/a;->c:Ltech/sud/runtime/component/e/d;

    .line 2
    .line 3
    return-object p0
.end method

.method public c()Ltech/sud/runtime/core/i;
    .locals 0

    .line 1
    iget-object p0, p0, Ltech/sud/runtime/core/a;->a:Ltech/sud/runtime/core/i;

    .line 2
    .line 3
    return-object p0
.end method

.method public d()Ltech/sud/runtime/component/e/b;
    .locals 0

    .line 1
    iget-object p0, p0, Ltech/sud/runtime/core/a;->d:Ltech/sud/runtime/component/e/b;

    .line 2
    .line 3
    return-object p0
.end method

.method public e()Ltech/sud/runtime/core/c;
    .locals 0

    .line 1
    iget-object p0, p0, Ltech/sud/runtime/core/a;->b:Ltech/sud/runtime/core/c;

    .line 2
    .line 3
    return-object p0
.end method

.method public f()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-direct {p0, v0}, Ltech/sud/runtime/core/a;->a(Landroid/content/Context;)V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Ltech/sud/runtime/core/a;->b:Ltech/sud/runtime/core/c;

    .line 9
    .line 10
    invoke-interface {p0}, Ltech/sud/runtime/core/c;->onResume()V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public g()V
    .locals 0

    .line 1
    iget-object p0, p0, Ltech/sud/runtime/core/a;->b:Ltech/sud/runtime/core/c;

    .line 2
    .line 3
    invoke-interface {p0}, Ltech/sud/runtime/core/c;->onPause()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public h()V
    .locals 1

    .line 1
    iget-object v0, p0, Ltech/sud/runtime/core/a;->b:Ltech/sud/runtime/core/c;

    .line 2
    .line 3
    invoke-interface {v0}, Ltech/sud/runtime/core/c;->a()Ltech/sud/runtime/core/d;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Ltech/sud/runtime/core/d;->a()V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Ltech/sud/runtime/core/a;->l:Ltech/sud/runtime/component/i/b;

    .line 11
    .line 12
    invoke-virtual {v0}, Ltech/sud/runtime/component/i/b;->a()V

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Ltech/sud/runtime/core/a;->a:Ltech/sud/runtime/core/i;

    .line 16
    .line 17
    invoke-virtual {v0}, Ltech/sud/runtime/core/i;->a()V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Ltech/sud/runtime/core/a;->o:Ltech/sud/runtime/component/a/a;

    .line 21
    .line 22
    if-eqz v0, :cond_0

    .line 23
    .line 24
    invoke-virtual {v0}, Ltech/sud/runtime/component/a/a;->a()V

    .line 25
    .line 26
    .line 27
    const/4 v0, 0x0

    .line 28
    iput-object v0, p0, Ltech/sud/runtime/core/a;->o:Ltech/sud/runtime/component/a/a;

    .line 29
    .line 30
    :cond_0
    iget-object v0, p0, Ltech/sud/runtime/core/a;->c:Ltech/sud/runtime/component/e/d;

    .line 31
    .line 32
    invoke-virtual {v0}, Ltech/sud/runtime/component/e/d;->a()V

    .line 33
    .line 34
    .line 35
    iget-object p0, p0, Ltech/sud/runtime/core/a;->d:Ltech/sud/runtime/component/e/b;

    .line 36
    .line 37
    invoke-virtual {p0}, Ltech/sud/runtime/component/e/b;->a()V

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method public i()Ltech/sud/runtime/component/a/a;
    .locals 0

    .line 1
    iget-object p0, p0, Ltech/sud/runtime/core/a;->o:Ltech/sud/runtime/component/a/a;

    .line 2
    .line 3
    return-object p0
.end method

.method public onSizeChanged(IIII)V
    .locals 1

    .line 1
    iget v0, p0, Ltech/sud/runtime/core/a;->j:I

    .line 2
    .line 3
    if-ne p1, v0, :cond_0

    .line 4
    .line 5
    iget v0, p0, Ltech/sud/runtime/core/a;->k:I

    .line 6
    .line 7
    if-ne p2, v0, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    iput p1, p0, Ltech/sud/runtime/core/a;->j:I

    .line 11
    .line 12
    iput p2, p0, Ltech/sud/runtime/core/a;->k:I

    .line 13
    .line 14
    new-instance v0, Ltech/sud/runtime/core/a$2;

    .line 15
    .line 16
    invoke-direct {v0, p0}, Ltech/sud/runtime/core/a$2;-><init>(Ltech/sud/runtime/core/a;)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p0, v0}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 20
    .line 21
    .line 22
    invoke-super {p0, p1, p2, p3, p4}, Landroid/view/View;->onSizeChanged(IIII)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public onWindowFocusChanged(Z)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Landroid/view/View;->onWindowFocusChanged(Z)V

    .line 2
    .line 3
    .line 4
    if-eqz p1, :cond_0

    .line 5
    .line 6
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    invoke-direct {p0, p1}, Ltech/sud/runtime/core/a;->a(Landroid/content/Context;)V

    .line 11
    .line 12
    .line 13
    :cond_0
    return-void
.end method

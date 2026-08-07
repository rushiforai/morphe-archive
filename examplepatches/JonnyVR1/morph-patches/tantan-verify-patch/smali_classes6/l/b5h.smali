.class public Ll/b5h;
.super Landroid/widget/PopupWindow;
.source "SourceFile"


# direct methods
.method public constructor <init>(Lv/VImage;Landroid/content/Context;Ljava/util/List;Ljava/lang/String;Ll/y20;)V
    .locals 16
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lv/VImage;",
            "Landroid/content/Context;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            "Ll/y20<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    move-object/from16 v2, p4

    .line 6
    .line 7
    const/4 v3, -0x2

    .line 8
    invoke-direct {v0, v3, v3}, Landroid/widget/PopupWindow;-><init>(II)V

    .line 9
    .line 10
    .line 11
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->H()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 12
    .line 13
    .line 14
    move-result-object v4

    .line 15
    const/4 v5, 0x1

    .line 16
    invoke-interface {v4, v1, v5}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->mm(Lv/VImage;Z)V

    .line 17
    .line 18
    .line 19
    invoke-static/range {p2 .. p2}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 20
    .line 21
    .line 22
    move-result-object v4

    .line 23
    sget v6, Ll/tec0;->g3:I

    .line 24
    .line 25
    const/4 v7, 0x0

    .line 26
    invoke-virtual {v4, v6, v7}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 27
    .line 28
    .line 29
    move-result-object v4

    .line 30
    invoke-virtual {v0, v4}, Landroid/widget/PopupWindow;->setContentView(Landroid/view/View;)V

    .line 31
    .line 32
    .line 33
    sget v6, Ll/hdc0;->V:I

    .line 34
    .line 35
    invoke-virtual {v4, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 36
    .line 37
    .line 38
    move-result-object v6

    .line 39
    check-cast v6, Landroid/widget/FrameLayout;

    .line 40
    .line 41
    sget v8, Ll/hdc0;->z:I

    .line 42
    .line 43
    invoke-virtual {v4, v8}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 44
    .line 45
    .line 46
    move-result-object v4

    .line 47
    check-cast v4, Landroid/widget/LinearLayout;

    .line 48
    .line 49
    new-instance v8, Ll/y4h;

    .line 50
    .line 51
    invoke-direct {v8, v0}, Ll/y4h;-><init>(Ll/b5h;)V

    .line 52
    .line 53
    .line 54
    invoke-static {v6, v8}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 55
    .line 56
    .line 57
    const/4 v6, 0x0

    .line 58
    :goto_0
    invoke-interface/range {p3 .. p3}, Ljava/util/List;->size()I

    .line 59
    .line 60
    .line 61
    move-result v8

    .line 62
    if-ge v6, v8, :cond_1

    .line 63
    .line 64
    move-object/from16 v8, p3

    .line 65
    .line 66
    invoke-interface {v8, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 67
    .line 68
    .line 69
    move-result-object v9

    .line 70
    check-cast v9, Ljava/lang/String;

    .line 71
    .line 72
    invoke-static/range {p2 .. p2}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 73
    .line 74
    .line 75
    move-result-object v10

    .line 76
    sget v11, Ll/tec0;->f3:I

    .line 77
    .line 78
    invoke-virtual {v10, v11, v7}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 79
    .line 80
    .line 81
    move-result-object v10

    .line 82
    sget v11, Ll/hdc0;->T0:I

    .line 83
    .line 84
    invoke-virtual {v10, v11}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 85
    .line 86
    .line 87
    move-result-object v11

    .line 88
    check-cast v11, Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 89
    .line 90
    sget v12, Ll/hdc0;->U0:I

    .line 91
    .line 92
    invoke-virtual {v10, v12}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 93
    .line 94
    .line 95
    move-result-object v12

    .line 96
    check-cast v12, Lv/VText;

    .line 97
    .line 98
    sget v13, Ll/hdc0;->S0:I

    .line 99
    .line 100
    invoke-virtual {v10, v13}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 101
    .line 102
    .line 103
    move-result-object v13

    .line 104
    check-cast v13, Lv/VImage;

    .line 105
    .line 106
    invoke-virtual {v12}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    .line 107
    .line 108
    .line 109
    move-result-object v14

    .line 110
    invoke-static {v2, v9}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 111
    .line 112
    .line 113
    move-result v15

    .line 114
    invoke-virtual {v14, v15}, Landroid/graphics/Paint;->setFakeBoldText(Z)V

    .line 115
    .line 116
    .line 117
    invoke-virtual {v12, v9}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 118
    .line 119
    .line 120
    invoke-static {v2, v9}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 121
    .line 122
    .line 123
    move-result v14

    .line 124
    if-eqz v14, :cond_0

    .line 125
    .line 126
    invoke-virtual/range {p2 .. p2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 127
    .line 128
    .line 129
    move-result-object v14

    .line 130
    sget v15, Ll/k9c0;->n:I

    .line 131
    .line 132
    invoke-virtual {v14, v15}, Landroid/content/res/Resources;->getColor(I)I

    .line 133
    .line 134
    .line 135
    move-result v14

    .line 136
    goto :goto_1

    .line 137
    :cond_0
    invoke-virtual/range {p2 .. p2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 138
    .line 139
    .line 140
    move-result-object v14

    .line 141
    sget v15, Ll/k9c0;->e:I

    .line 142
    .line 143
    invoke-virtual {v14, v15}, Landroid/content/res/Resources;->getColor(I)I

    .line 144
    .line 145
    .line 146
    move-result v14

    .line 147
    :goto_1
    invoke-virtual {v12, v14}, Landroid/widget/TextView;->setTextColor(I)V

    .line 148
    .line 149
    .line 150
    invoke-static {v2, v9}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 151
    .line 152
    .line 153
    move-result v12

    .line 154
    invoke-static {v13, v12}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 155
    .line 156
    .line 157
    new-instance v12, Ll/z4h;

    .line 158
    .line 159
    move-object/from16 v13, p5

    .line 160
    .line 161
    invoke-direct {v12, v0, v9, v2, v13}, Ll/z4h;-><init>(Ll/b5h;Ljava/lang/String;Ljava/lang/String;Ll/y20;)V

    .line 162
    .line 163
    .line 164
    invoke-static {v11, v12}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 165
    .line 166
    .line 167
    new-instance v9, Landroid/widget/LinearLayout$LayoutParams;

    .line 168
    .line 169
    invoke-direct {v9, v3, v3}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 170
    .line 171
    .line 172
    invoke-virtual {v10, v9}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 173
    .line 174
    .line 175
    invoke-virtual {v4, v10}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 176
    .line 177
    .line 178
    add-int/lit8 v6, v6, 0x1

    .line 179
    .line 180
    goto :goto_0

    .line 181
    :cond_1
    new-instance v2, Ll/a5h;

    .line 182
    .line 183
    invoke-direct {v2, v1}, Ll/a5h;-><init>(Lv/VImage;)V

    .line 184
    .line 185
    .line 186
    invoke-virtual {v0, v2}, Landroid/widget/PopupWindow;->setOnDismissListener(Landroid/widget/PopupWindow$OnDismissListener;)V

    .line 187
    .line 188
    .line 189
    invoke-virtual {v0, v5}, Landroid/widget/PopupWindow;->setOutsideTouchable(Z)V

    .line 190
    .line 191
    .line 192
    invoke-virtual {v0, v5}, Landroid/widget/PopupWindow;->setTouchable(Z)V

    .line 193
    .line 194
    .line 195
    invoke-virtual {v0, v5}, Landroid/widget/PopupWindow;->setFocusable(Z)V

    .line 196
    .line 197
    .line 198
    invoke-virtual/range {p2 .. p2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 199
    .line 200
    .line 201
    move-result-object v1

    .line 202
    sget v2, Ll/lbc0;->I6:I

    .line 203
    .line 204
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 205
    .line 206
    .line 207
    move-result-object v1

    .line 208
    invoke-virtual {v0, v1}, Landroid/widget/PopupWindow;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 209
    .line 210
    .line 211
    return-void
.end method

.method public static synthetic a(Ll/b5h;Ljava/lang/String;Ljava/lang/String;Ll/y20;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/b5h;->e(Ljava/lang/String;Ljava/lang/String;Ll/y20;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic b(Ll/b5h;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/b5h;->d(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic c(Lv/VImage;)V
    .locals 2

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->H()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/4 v1, 0x0

    .line 6
    invoke-interface {v0, p0, v1}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->mm(Lv/VImage;Z)V

    .line 7
    .line 8
    .line 9
    return-void
.end method


# virtual methods
.method public final synthetic d(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/widget/PopupWindow;->dismiss()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic e(Ljava/lang/String;Ljava/lang/String;Ll/y20;Landroid/view/View;)V
    .locals 2

    .line 1
    invoke-static {}, Ll/pu20;->i()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p4

    .line 5
    invoke-static {p1, p4}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result p4

    .line 9
    const-string v0, "sort_type"

    .line 10
    .line 11
    if-eqz p4, :cond_0

    .line 12
    .line 13
    const-string p4, "like"

    .line 14
    .line 15
    invoke-static {v0, p4}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 16
    .line 17
    .line 18
    move-result-object p4

    .line 19
    goto :goto_0

    .line 20
    :cond_0
    const-string p4, "follow"

    .line 21
    .line 22
    invoke-static {v0, p4}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 23
    .line 24
    .line 25
    move-result-object p4

    .line 26
    :goto_0
    filled-new-array {p4}, [Ll/pf60;

    .line 27
    .line 28
    .line 29
    move-result-object p4

    .line 30
    const-string v0, "e_type_popup"

    .line 31
    .line 32
    const-string v1, "p_like"

    .line 33
    .line 34
    invoke-static {v0, v1, p4}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 35
    .line 36
    .line 37
    invoke-static {p2, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 38
    .line 39
    .line 40
    move-result p2

    .line 41
    if-nez p2, :cond_1

    .line 42
    .line 43
    invoke-interface {p3, p1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 44
    .line 45
    .line 46
    :cond_1
    invoke-virtual {p0}, Landroid/widget/PopupWindow;->dismiss()V

    .line 47
    .line 48
    .line 49
    return-void
.end method

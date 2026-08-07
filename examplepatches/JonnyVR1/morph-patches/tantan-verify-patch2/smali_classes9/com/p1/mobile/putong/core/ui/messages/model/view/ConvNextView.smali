.class public Lcom/p1/mobile/putong/core/ui/messages/model/view/ConvNextView;
.super Lv/VLinear;
.source "SourceFile"


# instance fields
.field public c:Lv/VText;

.field public d:Lv/VFrame;

.field public final e:Ljava/lang/String;

.field public f:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    .line 27
    invoke-direct {p0, p1, v0}, Lcom/p1/mobile/putong/core/ui/messages/model/view/ConvNextView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    .line 26
    invoke-direct {p0, p1, p2, v0}, Lcom/p1/mobile/putong/core/ui/messages/model/view/ConvNextView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Lv/VLinear;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    invoke-virtual {p1}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    invoke-interface {p1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->lh()Z

    .line 13
    .line 14
    .line 15
    move-result p1

    .line 16
    if-eqz p1, :cond_0

    .line 17
    .line 18
    const-string p1, "e_nextchat_unread"

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_0
    const-string p1, "e_nextchat_noreply"

    .line 22
    .line 23
    :goto_0
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/model/view/ConvNextView;->e:Ljava/lang/String;

    .line 24
    .line 25
    return-void
.end method

.method public static bridge synthetic P(Lcom/p1/mobile/putong/core/ui/messages/model/view/ConvNextView;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/view/ConvNextView;->e:Ljava/lang/String;

    return-object p0
.end method

.method private init()V
    .locals 3

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    instance-of v0, v0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 6
    .line 7
    if-eqz v0, :cond_3

    .line 8
    .line 9
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    check-cast v0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 14
    .line 15
    iget-object v1, v0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->f:Ll/clz;

    .line 16
    .line 17
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    if-eqz v1, :cond_0

    .line 22
    .line 23
    iget-object v1, v0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->f:Ll/clz;

    .line 24
    .line 25
    invoke-virtual {v1}, Ll/clz;->o3()I

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    const/16 v2, 0x1d

    .line 30
    .line 31
    if-eq v1, v2, :cond_0

    .line 32
    .line 33
    invoke-static {}, Ll/i46;->c()Ll/i46;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    invoke-virtual {p0}, Ll/i46;->a()V

    .line 38
    .line 39
    .line 40
    return-void

    .line 41
    :cond_0
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/model/view/ConvNextView;->c:Lv/VText;

    .line 42
    .line 43
    sget-object v2, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    .line 44
    .line 45
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 46
    .line 47
    .line 48
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/model/view/ConvNextView;->c:Lv/VText;

    .line 49
    .line 50
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 51
    .line 52
    .line 53
    move-result-object v2

    .line 54
    invoke-virtual {v2}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 55
    .line 56
    .line 57
    move-result-object v2

    .line 58
    invoke-interface {v2}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->lh()Z

    .line 59
    .line 60
    .line 61
    move-result v2

    .line 62
    if-eqz v2, :cond_1

    .line 63
    .line 64
    const-string v2, "\u4e0b\u4e00\u6761\u672a\u8bfb"

    .line 65
    .line 66
    goto :goto_0

    .line 67
    :cond_1
    const-string v2, " \u4e0b\u4e00\u6761\u672a\u56de\u590d"

    .line 68
    .line 69
    :goto_0
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 70
    .line 71
    .line 72
    invoke-static {}, Ll/i46;->c()Ll/i46;

    .line 73
    .line 74
    .line 75
    move-result-object v1

    .line 76
    iget-object v2, v0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->f:Ll/clz;

    .line 77
    .line 78
    iget-object v2, v2, Ll/clz;->c:Ljava/lang/String;

    .line 79
    .line 80
    invoke-virtual {v1, v2}, Ll/i46;->d(Ljava/lang/String;)Z

    .line 81
    .line 82
    .line 83
    move-result v1

    .line 84
    if-eqz v1, :cond_2

    .line 85
    .line 86
    const/4 v1, 0x1

    .line 87
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/core/ui/messages/model/view/ConvNextView;->setVisible(Z)V

    .line 88
    .line 89
    .line 90
    :cond_2
    new-instance v1, Lcom/p1/mobile/putong/core/ui/messages/model/view/ConvNextView$a;

    .line 91
    .line 92
    invoke-direct {v1, p0, v0}, Lcom/p1/mobile/putong/core/ui/messages/model/view/ConvNextView$a;-><init>(Lcom/p1/mobile/putong/core/ui/messages/model/view/ConvNextView;Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;)V

    .line 93
    .line 94
    .line 95
    invoke-static {p0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 96
    .line 97
    .line 98
    :cond_3
    return-void
.end method


# virtual methods
.method public final Q(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/j46;->a(Lcom/p1/mobile/putong/core/ui/messages/model/view/ConvNextView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public R(Z)V
    .locals 23

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move/from16 v8, p1

    .line 4
    .line 5
    iget-boolean v1, v0, Lcom/p1/mobile/putong/core/ui/messages/model/view/ConvNextView;->f:Z

    .line 6
    .line 7
    if-ne v1, v8, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    iput-boolean v8, v0, Lcom/p1/mobile/putong/core/ui/messages/model/view/ConvNextView;->f:Z

    .line 11
    .line 12
    invoke-virtual {v0}, Landroid/view/View;->getWidth()I

    .line 13
    .line 14
    .line 15
    move-result v9

    .line 16
    new-instance v6, Landroid/view/animation/LinearInterpolator;

    .line 17
    .line 18
    invoke-direct {v6}, Landroid/view/animation/LinearInterpolator;-><init>()V

    .line 19
    .line 20
    .line 21
    const/high16 v10, 0x42100000    # 36.0f

    .line 22
    .line 23
    const/4 v11, 0x0

    .line 24
    if-eqz v8, :cond_1

    .line 25
    .line 26
    move v1, v11

    .line 27
    goto :goto_0

    .line 28
    :cond_1
    invoke-static {v10}, Ll/qa00;->d(F)I

    .line 29
    .line 30
    .line 31
    move-result v1

    .line 32
    sub-int v1, v9, v1

    .line 33
    .line 34
    int-to-float v1, v1

    .line 35
    :goto_0
    if-eqz v8, :cond_2

    .line 36
    .line 37
    invoke-static {v10}, Ll/qa00;->d(F)I

    .line 38
    .line 39
    .line 40
    move-result v2

    .line 41
    sub-int v2, v9, v2

    .line 42
    .line 43
    int-to-float v2, v2

    .line 44
    goto :goto_1

    .line 45
    :cond_2
    move v2, v11

    .line 46
    :goto_1
    const/4 v12, 0x2

    .line 47
    new-array v7, v12, [F

    .line 48
    .line 49
    const/4 v13, 0x0

    .line 50
    aput v1, v7, v13

    .line 51
    .line 52
    const/4 v14, 0x1

    .line 53
    aput v2, v7, v14

    .line 54
    .line 55
    sget-object v16, Landroid/view/View;->TRANSLATION_X:Landroid/util/Property;

    .line 56
    .line 57
    const-wide/16 v2, 0x0

    .line 58
    .line 59
    const-wide/16 v4, 0x12c

    .line 60
    .line 61
    move-object/from16 v1, v16

    .line 62
    .line 63
    invoke-static/range {v0 .. v7}, Ll/gt0;->l(Landroid/view/View;Landroid/util/Property;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 64
    .line 65
    .line 66
    move-result-object v2

    .line 67
    iget-object v15, v0, Lcom/p1/mobile/putong/core/ui/messages/model/view/ConvNextView;->d:Lv/VFrame;

    .line 68
    .line 69
    new-instance v21, Landroid/view/animation/LinearInterpolator;

    .line 70
    .line 71
    invoke-direct/range {v21 .. v21}, Landroid/view/animation/LinearInterpolator;-><init>()V

    .line 72
    .line 73
    .line 74
    if-eqz v8, :cond_3

    .line 75
    .line 76
    move v1, v11

    .line 77
    goto :goto_2

    .line 78
    :cond_3
    invoke-static {v10}, Ll/qa00;->d(F)I

    .line 79
    .line 80
    .line 81
    move-result v1

    .line 82
    sub-int/2addr v1, v9

    .line 83
    int-to-float v1, v1

    .line 84
    :goto_2
    if-eqz v8, :cond_4

    .line 85
    .line 86
    invoke-static {v10}, Ll/qa00;->d(F)I

    .line 87
    .line 88
    .line 89
    move-result v3

    .line 90
    sub-int/2addr v3, v9

    .line 91
    int-to-float v3, v3

    .line 92
    goto :goto_3

    .line 93
    :cond_4
    move v3, v11

    .line 94
    :goto_3
    new-array v4, v12, [F

    .line 95
    .line 96
    aput v1, v4, v13

    .line 97
    .line 98
    aput v3, v4, v14

    .line 99
    .line 100
    const-wide/16 v17, 0x0

    .line 101
    .line 102
    const-wide/16 v19, 0x12c

    .line 103
    .line 104
    move-object/from16 v22, v4

    .line 105
    .line 106
    invoke-static/range {v15 .. v22}, Ll/gt0;->l(Landroid/view/View;Landroid/util/Property;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 107
    .line 108
    .line 109
    move-result-object v1

    .line 110
    iget-object v15, v0, Lcom/p1/mobile/putong/core/ui/messages/model/view/ConvNextView;->c:Lv/VText;

    .line 111
    .line 112
    new-instance v21, Landroid/view/animation/LinearInterpolator;

    .line 113
    .line 114
    invoke-direct/range {v21 .. v21}, Landroid/view/animation/LinearInterpolator;-><init>()V

    .line 115
    .line 116
    .line 117
    if-eqz v8, :cond_5

    .line 118
    .line 119
    move v0, v11

    .line 120
    goto :goto_4

    .line 121
    :cond_5
    invoke-static {v10}, Ll/qa00;->d(F)I

    .line 122
    .line 123
    .line 124
    move-result v0

    .line 125
    sub-int v0, v9, v0

    .line 126
    .line 127
    int-to-float v0, v0

    .line 128
    :goto_4
    if-eqz v8, :cond_6

    .line 129
    .line 130
    invoke-static {v10}, Ll/qa00;->d(F)I

    .line 131
    .line 132
    .line 133
    move-result v3

    .line 134
    sub-int/2addr v9, v3

    .line 135
    int-to-float v11, v9

    .line 136
    :cond_6
    new-array v3, v12, [F

    .line 137
    .line 138
    aput v0, v3, v13

    .line 139
    .line 140
    aput v11, v3, v14

    .line 141
    .line 142
    const-wide/16 v17, 0x0

    .line 143
    .line 144
    const-wide/16 v19, 0x12c

    .line 145
    .line 146
    move-object/from16 v22, v3

    .line 147
    .line 148
    invoke-static/range {v15 .. v22}, Ll/gt0;->l(Landroid/view/View;Landroid/util/Property;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 149
    .line 150
    .line 151
    move-result-object v0

    .line 152
    filled-new-array {v2, v1, v0}, [Landroid/animation/Animator;

    .line 153
    .line 154
    .line 155
    move-result-object v0

    .line 156
    invoke-static {v0}, Ll/gt0;->z([Landroid/animation/Animator;)Landroid/animation/Animator;

    .line 157
    .line 158
    .line 159
    move-result-object v0

    .line 160
    invoke-virtual {v0}, Landroid/animation/Animator;->start()V

    .line 161
    .line 162
    .line 163
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/ui/messages/model/view/ConvNextView;->Q(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/messages/model/view/ConvNextView;->init()V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public setMarginBottom(I)V
    .locals 2

    .line 1
    invoke-static {p0}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    invoke-virtual {p0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    check-cast v0, Landroid/widget/FrameLayout$LayoutParams;

    .line 13
    .line 14
    int-to-float p1, p1

    .line 15
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 16
    .line 17
    .line 18
    move-result p1

    .line 19
    const/4 v1, 0x0

    .line 20
    invoke-virtual {v0, v1, v1, v1, p1}, Landroid/view/ViewGroup$MarginLayoutParams;->setMargins(IIII)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p0, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public setVisible(Z)V
    .locals 2

    .line 1
    invoke-static {p0}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-ne v0, p1, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    if-eqz p1, :cond_2

    .line 9
    .line 10
    invoke-static {}, Ll/i46;->c()Ll/i46;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {v0}, Ll/i46;->e()Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-eqz v0, :cond_1

    .line 19
    .line 20
    :goto_0
    return-void

    .line 21
    :cond_1
    invoke-static {}, Ll/i46;->c()Ll/i46;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-virtual {v0}, Ll/i46;->g()V

    .line 26
    .line 27
    .line 28
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/view/ConvNextView;->e:Ljava/lang/String;

    .line 29
    .line 30
    const-string v1, "p_chat_view"

    .line 31
    .line 32
    invoke-static {v0, v1}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    :cond_2
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 36
    .line 37
    .line 38
    return-void
.end method

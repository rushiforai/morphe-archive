.class public Ll/p55;
.super Ll/g1e;
.source "SourceFile"


# instance fields
.field public j:Lv/VText;

.field public k:Lcom/p1/mobile/putong/core/ui/dlg/views/CityCoverMiddleCardView;

.field public l:Lcom/tantan/library/svga/SVGAnimationView;

.field public final m:Ljava/lang/String;

.field public final n:Lcom/p1/mobile/android/app/Act;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    sget v1, Ll/agc0;->q:I

    .line 3
    .line 4
    invoke-direct {p0, p1, v0, v1}, Ll/g1e;-><init>(Landroid/content/Context;ZI)V

    .line 5
    .line 6
    .line 7
    iput-object p2, p0, Ll/p55;->m:Ljava/lang/String;

    .line 8
    .line 9
    iput-object p1, p0, Ll/p55;->n:Lcom/p1/mobile/android/app/Act;

    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public E(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/q55;->b(Ll/p55;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Landroidx/appcompat/app/a;->onCreate(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Ll/p55;->n:Lcom/p1/mobile/android/app/Act;

    .line 5
    .line 6
    invoke-virtual {p1}, Landroid/app/Activity;->getLayoutInflater()Landroid/view/LayoutInflater;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    const/4 v0, 0x0

    .line 11
    invoke-virtual {p0, p1, v0}, Ll/p55;->E(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    invoke-virtual {p0, p1}, Ll/nu0;->setContentView(Landroid/view/View;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public show()V
    .locals 13

    .line 1
    invoke-super {p0}, Ll/g1e;->show()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/p55;->j:Lv/VText;

    .line 5
    .line 6
    const/4 v1, 0x3

    .line 7
    invoke-static {v1}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    const/4 v2, 0x1

    .line 12
    invoke-virtual {v0, v1, v2}, Landroidx/appcompat/widget/AppCompatTextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 13
    .line 14
    .line 15
    const-string v0, "e_tag_confirmation"

    .line 16
    .line 17
    const-string v1, "p_love_signal_guide_tag"

    .line 18
    .line 19
    invoke-static {v0, v1}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    iget-object v3, p0, Ll/p55;->j:Lv/VText;

    .line 23
    .line 24
    sget-object v4, Landroid/view/View;->ALPHA:Landroid/util/Property;

    .line 25
    .line 26
    new-instance v9, Landroid/view/animation/LinearInterpolator;

    .line 27
    .line 28
    invoke-direct {v9}, Landroid/view/animation/LinearInterpolator;-><init>()V

    .line 29
    .line 30
    .line 31
    const/4 v0, 0x2

    .line 32
    new-array v10, v0, [F

    .line 33
    .line 34
    fill-array-data v10, :array_0

    .line 35
    .line 36
    .line 37
    const-wide/16 v5, 0x0

    .line 38
    .line 39
    const-wide/16 v7, 0x3e8

    .line 40
    .line 41
    invoke-static/range {v3 .. v10}, Ll/gt0;->l(Landroid/view/View;Landroid/util/Property;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    invoke-virtual {v1}, Landroid/animation/Animator;->start()V

    .line 46
    .line 47
    .line 48
    new-instance v1, Ll/fzf0;

    .line 49
    .line 50
    const v3, 0x3f4ccccd    # 0.8f

    .line 51
    .line 52
    .line 53
    invoke-direct {v1, v3}, Ll/fzf0;-><init>(F)V

    .line 54
    .line 55
    .line 56
    iget-object v3, p0, Ll/p55;->k:Lcom/p1/mobile/putong/core/ui/dlg/views/CityCoverMiddleCardView;

    .line 57
    .line 58
    iget-object v3, v3, Lcom/p1/mobile/putong/core/ui/dlg/views/CityCoverMiddleCardView;->b:Landroid/widget/FrameLayout;

    .line 59
    .line 60
    new-instance v10, Landroid/view/animation/LinearInterpolator;

    .line 61
    .line 62
    invoke-direct {v10}, Landroid/view/animation/LinearInterpolator;-><init>()V

    .line 63
    .line 64
    .line 65
    new-array v11, v0, [F

    .line 66
    .line 67
    fill-array-data v11, :array_1

    .line 68
    .line 69
    .line 70
    const-wide/16 v6, 0x0

    .line 71
    .line 72
    const-wide/16 v8, 0x3e8

    .line 73
    .line 74
    move-object v5, v4

    .line 75
    move-object v4, v3

    .line 76
    invoke-static/range {v4 .. v11}, Ll/gt0;->l(Landroid/view/View;Landroid/util/Property;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 77
    .line 78
    .line 79
    move-result-object v3

    .line 80
    iget-object v4, p0, Ll/p55;->k:Lcom/p1/mobile/putong/core/ui/dlg/views/CityCoverMiddleCardView;

    .line 81
    .line 82
    iget-object v5, v4, Lcom/p1/mobile/putong/core/ui/dlg/views/CityCoverMiddleCardView;->b:Landroid/widget/FrameLayout;

    .line 83
    .line 84
    sget-object v6, Landroid/view/View;->SCALE_X:Landroid/util/Property;

    .line 85
    .line 86
    new-array v12, v0, [F

    .line 87
    .line 88
    fill-array-data v12, :array_2

    .line 89
    .line 90
    .line 91
    const-wide/16 v7, 0x0

    .line 92
    .line 93
    const-wide/16 v9, 0x7d0

    .line 94
    .line 95
    move-object v11, v1

    .line 96
    invoke-static/range {v5 .. v12}, Ll/gt0;->l(Landroid/view/View;Landroid/util/Property;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 97
    .line 98
    .line 99
    move-result-object v1

    .line 100
    iget-object v4, p0, Ll/p55;->k:Lcom/p1/mobile/putong/core/ui/dlg/views/CityCoverMiddleCardView;

    .line 101
    .line 102
    iget-object v5, v4, Lcom/p1/mobile/putong/core/ui/dlg/views/CityCoverMiddleCardView;->b:Landroid/widget/FrameLayout;

    .line 103
    .line 104
    sget-object v6, Landroid/view/View;->SCALE_Y:Landroid/util/Property;

    .line 105
    .line 106
    new-array v12, v0, [F

    .line 107
    .line 108
    fill-array-data v12, :array_3

    .line 109
    .line 110
    .line 111
    invoke-static/range {v5 .. v12}, Ll/gt0;->l(Landroid/view/View;Landroid/util/Property;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 112
    .line 113
    .line 114
    move-result-object v0

    .line 115
    filled-new-array {v1, v0}, [Landroid/animation/Animator;

    .line 116
    .line 117
    .line 118
    move-result-object v0

    .line 119
    invoke-static {v0}, Ll/gt0;->z([Landroid/animation/Animator;)Landroid/animation/Animator;

    .line 120
    .line 121
    .line 122
    move-result-object v0

    .line 123
    new-instance v1, Ll/p55$a;

    .line 124
    .line 125
    invoke-direct {v1, p0}, Ll/p55$a;-><init>(Ll/p55;)V

    .line 126
    .line 127
    .line 128
    invoke-virtual {v0, v1}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 129
    .line 130
    .line 131
    invoke-virtual {v0}, Landroid/animation/Animator;->start()V

    .line 132
    .line 133
    .line 134
    invoke-virtual {v3}, Landroid/animation/Animator;->start()V

    .line 135
    .line 136
    .line 137
    invoke-virtual {p0}, Landroid/app/Dialog;->getContext()Landroid/content/Context;

    .line 138
    .line 139
    .line 140
    move-result-object v0

    .line 141
    invoke-static {v0}, Lcom/tantan/library/svga/SVGALoader;->with(Landroid/content/Context;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 142
    .line 143
    .line 144
    move-result-object v0

    .line 145
    const-string v1, "https://auto.tancdn.com/v1/raw/cec5be75-929f-4965-9aef-85b25bb9c82114.svga"

    .line 146
    .line 147
    invoke-virtual {v0, v1}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->from(Ljava/lang/String;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 148
    .line 149
    .line 150
    move-result-object v0

    .line 151
    invoke-virtual {v0, v2}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->autoPlay(Z)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 152
    .line 153
    .line 154
    move-result-object v0

    .line 155
    invoke-virtual {v0, v2}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->repeatCount(I)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 156
    .line 157
    .line 158
    move-result-object v0

    .line 159
    iget-object v1, p0, Ll/p55;->l:Lcom/tantan/library/svga/SVGAnimationView;

    .line 160
    .line 161
    invoke-virtual {v0, v1}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->into(Lcom/tantan/library/svga/SVGAnimationView;)V

    .line 162
    .line 163
    .line 164
    iget-object v0, p0, Ll/p55;->k:Lcom/p1/mobile/putong/core/ui/dlg/views/CityCoverMiddleCardView;

    .line 165
    .line 166
    new-instance v1, Ll/p55$b;

    .line 167
    .line 168
    invoke-direct {v1, p0}, Ll/p55$b;-><init>(Ll/p55;)V

    .line 169
    .line 170
    .line 171
    const-wide/16 v2, 0x1f4

    .line 172
    .line 173
    invoke-virtual {v0, v1, v2, v3}, Landroid/view/View;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 174
    .line 175
    .line 176
    iget-object v0, p0, Ll/p55;->k:Lcom/p1/mobile/putong/core/ui/dlg/views/CityCoverMiddleCardView;

    .line 177
    .line 178
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/dlg/views/CityCoverMiddleCardView;->f()V

    .line 179
    .line 180
    .line 181
    iget-object v0, p0, Ll/p55;->n:Lcom/p1/mobile/android/app/Act;

    .line 182
    .line 183
    new-instance v1, Ll/p55$c;

    .line 184
    .line 185
    invoke-direct {v1, p0}, Ll/p55$c;-><init>(Ll/p55;)V

    .line 186
    .line 187
    .line 188
    const-wide/16 v2, 0x1770

    .line 189
    .line 190
    invoke-static {v0, v1, v2, v3}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 191
    .line 192
    .line 193
    return-void

    .line 194
    nop

    .line 195
    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data

    .line 196
    .line 197
    .line 198
    .line 199
    .line 200
    .line 201
    .line 202
    .line 203
    :array_1
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data

    .line 204
    .line 205
    .line 206
    .line 207
    .line 208
    .line 209
    .line 210
    .line 211
    :array_2
    .array-data 4
        0x3e99999a    # 0.3f
        0x3f800000    # 1.0f
    .end array-data

    .line 212
    .line 213
    .line 214
    .line 215
    .line 216
    .line 217
    .line 218
    .line 219
    :array_3
    .array-data 4
        0x3e99999a    # 0.3f
        0x3f800000    # 1.0f
    .end array-data
.end method

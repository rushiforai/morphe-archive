.class public Lcom/p1/mobile/putong/core/newui/home/card/expanded/transform/a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/core/newui/home/card/expanded/transform/a$b;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/hh50;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Lcom/p1/mobile/putong/core/newui/home/card/expanded/transform/OldInfoTransOpLayout;

.field public b:Landroid/view/View;

.field public c:Landroid/widget/FrameLayout;

.field public d:Lv/VImage;

.field public e:Lcom/tantan/library/svga/SVGAnimationView;

.field public f:Lv/VDraweeView;

.field public g:Lcom/tantan/library/svga/SVGAnimationView;

.field public h:Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedLayout;

.field public i:Lv/VLinear;

.field public j:Lcom/p1/mobile/putong/core/ui/VText_Bold;

.field public k:Lcom/p1/mobile/putong/core/ui/VText_Bold;

.field public l:Lv/VFrame;

.field public m:Landroid/view/View;

.field public n:Lv/VImage;

.field public o:Lcom/p1/mobile/putong/core/ui/VText_Bold;

.field public p:Lcom/p1/mobile/android/app/Act;

.field public q:Ll/hh50;

.field public r:I


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/transform/a;->p:Lcom/p1/mobile/android/app/Act;

    .line 5
    .line 6
    return-void
.end method

.method private C()V
    .locals 18

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    new-instance v1, Landroid/view/animation/PathInterpolator;

    .line 4
    .line 5
    const v2, 0x3f333333    # 0.7f

    .line 6
    .line 7
    .line 8
    const/4 v3, 0x0

    .line 9
    const v4, 0x3e99999a    # 0.3f

    .line 10
    .line 11
    .line 12
    const/high16 v5, 0x3f800000    # 1.0f

    .line 13
    .line 14
    invoke-direct {v1, v2, v3, v4, v5}, Landroid/view/animation/PathInterpolator;-><init>(FFFF)V

    .line 15
    .line 16
    .line 17
    iget-object v2, v0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/transform/a;->h:Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedLayout;

    .line 18
    .line 19
    sget-object v4, Landroid/view/View;->ALPHA:Landroid/util/Property;

    .line 20
    .line 21
    invoke-virtual {v2}, Landroid/view/View;->getAlpha()F

    .line 22
    .line 23
    .line 24
    move-result v6

    .line 25
    const/4 v7, 0x2

    .line 26
    new-array v8, v7, [F

    .line 27
    .line 28
    const/4 v9, 0x0

    .line 29
    aput v6, v8, v9

    .line 30
    .line 31
    const/4 v6, 0x1

    .line 32
    aput v5, v8, v6

    .line 33
    .line 34
    invoke-static {v2, v4, v8}, Ll/gt0;->n(Landroid/view/View;Landroid/util/Property;[F)Landroid/animation/Animator;

    .line 35
    .line 36
    .line 37
    move-result-object v10

    .line 38
    iget-object v2, v0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/transform/a;->m:Landroid/view/View;

    .line 39
    .line 40
    invoke-virtual {v2}, Landroid/view/View;->getAlpha()F

    .line 41
    .line 42
    .line 43
    move-result v8

    .line 44
    new-array v11, v7, [F

    .line 45
    .line 46
    aput v8, v11, v9

    .line 47
    .line 48
    aput v5, v11, v6

    .line 49
    .line 50
    invoke-static {v2, v4, v11}, Ll/gt0;->n(Landroid/view/View;Landroid/util/Property;[F)Landroid/animation/Animator;

    .line 51
    .line 52
    .line 53
    move-result-object v11

    .line 54
    const-wide/16 v12, 0x12c

    .line 55
    .line 56
    invoke-virtual {v11, v12, v13}, Landroid/animation/Animator;->setStartDelay(J)V

    .line 57
    .line 58
    .line 59
    iget-object v2, v0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/transform/a;->o:Lcom/p1/mobile/putong/core/ui/VText_Bold;

    .line 60
    .line 61
    invoke-virtual {v2}, Landroid/view/View;->getAlpha()F

    .line 62
    .line 63
    .line 64
    move-result v8

    .line 65
    new-array v14, v7, [F

    .line 66
    .line 67
    aput v8, v14, v9

    .line 68
    .line 69
    aput v5, v14, v6

    .line 70
    .line 71
    invoke-static {v2, v4, v14}, Ll/gt0;->n(Landroid/view/View;Landroid/util/Property;[F)Landroid/animation/Animator;

    .line 72
    .line 73
    .line 74
    move-result-object v2

    .line 75
    invoke-virtual {v2, v12, v13}, Landroid/animation/Animator;->setStartDelay(J)V

    .line 76
    .line 77
    .line 78
    iget-object v5, v0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/transform/a;->i:Lv/VLinear;

    .line 79
    .line 80
    invoke-virtual {v5, v3}, Landroid/view/View;->setAlpha(F)V

    .line 81
    .line 82
    .line 83
    iget-object v5, v0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/transform/a;->i:Lv/VLinear;

    .line 84
    .line 85
    invoke-static {v5, v6}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 86
    .line 87
    .line 88
    iget-object v5, v0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/transform/a;->i:Lv/VLinear;

    .line 89
    .line 90
    new-array v8, v7, [F

    .line 91
    .line 92
    fill-array-data v8, :array_0

    .line 93
    .line 94
    .line 95
    invoke-static {v5, v4, v8}, Ll/gt0;->n(Landroid/view/View;Landroid/util/Property;[F)Landroid/animation/Animator;

    .line 96
    .line 97
    .line 98
    move-result-object v5

    .line 99
    invoke-virtual {v5, v12, v13}, Landroid/animation/Animator;->setStartDelay(J)V

    .line 100
    .line 101
    .line 102
    iget-object v8, v0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/transform/a;->h:Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedLayout;

    .line 103
    .line 104
    sget-object v12, Landroid/view/View;->TRANSLATION_Y:Landroid/util/Property;

    .line 105
    .line 106
    invoke-virtual {v8}, Landroid/view/View;->getTranslationY()F

    .line 107
    .line 108
    .line 109
    move-result v13

    .line 110
    new-array v14, v7, [F

    .line 111
    .line 112
    aput v13, v14, v9

    .line 113
    .line 114
    aput v3, v14, v6

    .line 115
    .line 116
    invoke-static {v8, v12, v14}, Ll/gt0;->n(Landroid/view/View;Landroid/util/Property;[F)Landroid/animation/Animator;

    .line 117
    .line 118
    .line 119
    move-result-object v14

    .line 120
    move v3, v9

    .line 121
    move-object v8, v10

    .line 122
    const-wide/16 v9, 0x3e8

    .line 123
    .line 124
    invoke-virtual {v14, v9, v10}, Landroid/animation/Animator;->setDuration(J)Landroid/animation/Animator;

    .line 125
    .line 126
    .line 127
    invoke-virtual {v14, v1}, Landroid/animation/Animator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 128
    .line 129
    .line 130
    iget-object v13, v0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/transform/a;->c:Landroid/widget/FrameLayout;

    .line 131
    .line 132
    invoke-virtual {v13}, Landroid/view/View;->getTranslationY()F

    .line 133
    .line 134
    .line 135
    move-result v15

    .line 136
    move/from16 v16, v3

    .line 137
    .line 138
    iget-object v3, v0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/transform/a;->c:Landroid/widget/FrameLayout;

    .line 139
    .line 140
    invoke-virtual {v3}, Landroid/view/View;->getHeight()I

    .line 141
    .line 142
    .line 143
    move-result v3

    .line 144
    neg-int v3, v3

    .line 145
    int-to-float v3, v3

    .line 146
    move/from16 v17, v6

    .line 147
    .line 148
    new-array v6, v7, [F

    .line 149
    .line 150
    aput v15, v6, v16

    .line 151
    .line 152
    aput v3, v6, v17

    .line 153
    .line 154
    invoke-static {v13, v12, v6}, Ll/gt0;->n(Landroid/view/View;Landroid/util/Property;[F)Landroid/animation/Animator;

    .line 155
    .line 156
    .line 157
    move-result-object v3

    .line 158
    invoke-virtual {v3, v9, v10}, Landroid/animation/Animator;->setDuration(J)Landroid/animation/Animator;

    .line 159
    .line 160
    .line 161
    invoke-virtual {v3, v1}, Landroid/animation/Animator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 162
    .line 163
    .line 164
    iget-object v0, v0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/transform/a;->c:Landroid/widget/FrameLayout;

    .line 165
    .line 166
    new-array v1, v7, [F

    .line 167
    .line 168
    fill-array-data v1, :array_1

    .line 169
    .line 170
    .line 171
    invoke-static {v0, v4, v1}, Ll/gt0;->n(Landroid/view/View;Landroid/util/Property;[F)Landroid/animation/Animator;

    .line 172
    .line 173
    .line 174
    move-result-object v15

    .line 175
    invoke-virtual {v15, v9, v10}, Landroid/animation/Animator;->setDuration(J)Landroid/animation/Animator;

    .line 176
    .line 177
    .line 178
    move-object v12, v2

    .line 179
    move-object/from16 v16, v3

    .line 180
    .line 181
    move-object v13, v5

    .line 182
    move-object v10, v8

    .line 183
    filled-new-array/range {v10 .. v16}, [Landroid/animation/Animator;

    .line 184
    .line 185
    .line 186
    move-result-object v0

    .line 187
    invoke-static {v0}, Ll/gt0;->z([Landroid/animation/Animator;)Landroid/animation/Animator;

    .line 188
    .line 189
    .line 190
    move-result-object v0

    .line 191
    const-wide/16 v1, 0x2bc

    .line 192
    .line 193
    invoke-virtual {v0, v1, v2}, Landroid/animation/Animator;->setDuration(J)Landroid/animation/Animator;

    .line 194
    .line 195
    .line 196
    move-result-object v0

    .line 197
    invoke-virtual {v0}, Landroid/animation/Animator;->start()V

    .line 198
    .line 199
    .line 200
    return-void

    .line 201
    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data

    .line 202
    .line 203
    .line 204
    .line 205
    .line 206
    .line 207
    .line 208
    .line 209
    :array_1
    .array-data 4
        0x3f800000    # 1.0f
        0x0
    .end array-data
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/core/newui/home/card/expanded/transform/a;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/transform/a;->F(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/core/newui/home/card/expanded/transform/a;[I)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/transform/a;->I([I)V

    return-void
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/core/newui/home/card/expanded/transform/a;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/transform/a;->G(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic d(Lcom/p1/mobile/putong/core/newui/home/card/expanded/transform/a;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/transform/a;->H(Landroid/view/View;)V

    return-void
.end method

.method public static bridge synthetic e(Lcom/p1/mobile/putong/core/newui/home/card/expanded/transform/a;Landroid/view/View;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/transform/a;->m:Landroid/view/View;

    return-void
.end method

.method public static bridge synthetic f(Lcom/p1/mobile/putong/core/newui/home/card/expanded/transform/a;Lv/VFrame;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/transform/a;->l:Lv/VFrame;

    return-void
.end method

.method public static bridge synthetic i(Lcom/p1/mobile/putong/core/newui/home/card/expanded/transform/a;Lv/VLinear;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/transform/a;->i:Lv/VLinear;

    return-void
.end method

.method public static bridge synthetic j(Lcom/p1/mobile/putong/core/newui/home/card/expanded/transform/a;Lcom/p1/mobile/putong/core/newui/home/card/expanded/transform/OldInfoTransOpLayout;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/transform/a;->a:Lcom/p1/mobile/putong/core/newui/home/card/expanded/transform/OldInfoTransOpLayout;

    return-void
.end method

.method public static bridge synthetic k(Lcom/p1/mobile/putong/core/newui/home/card/expanded/transform/a;Lcom/p1/mobile/putong/core/ui/VText_Bold;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/transform/a;->o:Lcom/p1/mobile/putong/core/ui/VText_Bold;

    return-void
.end method

.method public static bridge synthetic l(Lcom/p1/mobile/putong/core/newui/home/card/expanded/transform/a;Lv/VDraweeView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/transform/a;->f:Lv/VDraweeView;

    return-void
.end method

.method public static bridge synthetic m(Lcom/p1/mobile/putong/core/newui/home/card/expanded/transform/a;Lv/VImage;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/transform/a;->n:Lv/VImage;

    return-void
.end method

.method public static bridge synthetic n(Lcom/p1/mobile/putong/core/newui/home/card/expanded/transform/a;Lcom/p1/mobile/putong/core/ui/VText_Bold;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/transform/a;->j:Lcom/p1/mobile/putong/core/ui/VText_Bold;

    return-void
.end method

.method public static bridge synthetic p(Lcom/p1/mobile/putong/core/newui/home/card/expanded/transform/a;Landroid/view/View;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/transform/a;->b:Landroid/view/View;

    return-void
.end method

.method public static bridge synthetic q(Lcom/p1/mobile/putong/core/newui/home/card/expanded/transform/a;Lcom/p1/mobile/putong/core/ui/VText_Bold;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/transform/a;->k:Lcom/p1/mobile/putong/core/ui/VText_Bold;

    return-void
.end method

.method public static bridge synthetic s(Lcom/p1/mobile/putong/core/newui/home/card/expanded/transform/a;Lcom/tantan/library/svga/SVGAnimationView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/transform/a;->g:Lcom/tantan/library/svga/SVGAnimationView;

    return-void
.end method

.method public static bridge synthetic u(Lcom/p1/mobile/putong/core/newui/home/card/expanded/transform/a;Lcom/tantan/library/svga/SVGAnimationView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/transform/a;->e:Lcom/tantan/library/svga/SVGAnimationView;

    return-void
.end method

.method public static bridge synthetic v(Lcom/p1/mobile/putong/core/newui/home/card/expanded/transform/a;Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedLayout;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/transform/a;->h:Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedLayout;

    return-void
.end method

.method public static bridge synthetic w(Lcom/p1/mobile/putong/core/newui/home/card/expanded/transform/a;Lv/VImage;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/transform/a;->d:Lv/VImage;

    return-void
.end method

.method public static bridge synthetic x(Lcom/p1/mobile/putong/core/newui/home/card/expanded/transform/a;Landroid/widget/FrameLayout;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/transform/a;->c:Landroid/widget/FrameLayout;

    return-void
.end method

.method public static bridge synthetic y(Lcom/p1/mobile/putong/core/newui/home/card/expanded/transform/a;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/transform/a;->C()V

    return-void
.end method


# virtual methods
.method public A(Ll/hh50;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/transform/a;->q:Ll/hh50;

    .line 2
    .line 3
    return-void
.end method

.method public B()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/transform/a;->q:Ll/hh50;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/hh50;->s0()V

    .line 4
    .line 5
    .line 6
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 11
    .line 12
    .line 13
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    const/4 v0, 0x0

    .line 18
    sget v1, Ll/x7c0;->h:I

    .line 19
    .line 20
    invoke-virtual {p0, v0, v1}, Landroid/app/Activity;->overridePendingTransition(II)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/transform/a;->p:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    return-object p0
.end method

.method public final E()V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/transform/a;->k:Lcom/p1/mobile/putong/core/ui/VText_Bold;

    .line 2
    .line 3
    new-instance v1, Ll/ih50;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/ih50;-><init>(Lcom/p1/mobile/putong/core/newui/home/card/expanded/transform/a;)V

    .line 6
    .line 7
    .line 8
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/transform/a;->j:Lcom/p1/mobile/putong/core/ui/VText_Bold;

    .line 12
    .line 13
    new-instance v1, Ll/jh50;

    .line 14
    .line 15
    invoke-direct {v1, p0}, Ll/jh50;-><init>(Lcom/p1/mobile/putong/core/newui/home/card/expanded/transform/a;)V

    .line 16
    .line 17
    .line 18
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/transform/a;->n:Lv/VImage;

    .line 22
    .line 23
    new-instance v1, Ll/kh50;

    .line 24
    .line 25
    invoke-direct {v1, p0}, Ll/kh50;-><init>(Lcom/p1/mobile/putong/core/newui/home/card/expanded/transform/a;)V

    .line 26
    .line 27
    .line 28
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 29
    .line 30
    .line 31
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/transform/a;->h:Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedLayout;

    .line 32
    .line 33
    const/high16 v1, 0x41000000    # 8.0f

    .line 34
    .line 35
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 36
    .line 37
    .line 38
    move-result v2

    .line 39
    const/high16 v3, 0x41200000    # 10.0f

    .line 40
    .line 41
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 42
    .line 43
    .line 44
    move-result v3

    .line 45
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 46
    .line 47
    .line 48
    move-result v1

    .line 49
    const/high16 v4, 0x429c0000    # 78.0f

    .line 50
    .line 51
    invoke-static {v4}, Ll/qa00;->d(F)I

    .line 52
    .line 53
    .line 54
    move-result v4

    .line 55
    invoke-virtual {v0, v2, v3, v1, v4}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->b1(IIII)V

    .line 56
    .line 57
    .line 58
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/transform/a;->b:Landroid/view/View;

    .line 59
    .line 60
    const/high16 v1, 0x42300000    # 44.0f

    .line 61
    .line 62
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 63
    .line 64
    .line 65
    move-result v1

    .line 66
    invoke-static {}, Ll/bnl0;->F0()I

    .line 67
    .line 68
    .line 69
    move-result v2

    .line 70
    add-int/2addr v1, v2

    .line 71
    invoke-static {v0, v1}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 72
    .line 73
    .line 74
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/transform/a;->a:Lcom/p1/mobile/putong/core/newui/home/card/expanded/transform/OldInfoTransOpLayout;

    .line 75
    .line 76
    new-instance v1, Ll/lh50;

    .line 77
    .line 78
    invoke-direct {v1, p0}, Ll/lh50;-><init>(Lcom/p1/mobile/putong/core/newui/home/card/expanded/transform/a;)V

    .line 79
    .line 80
    .line 81
    invoke-static {v0, v1}, Ll/bnl0;->Q0(Landroid/view/View;Ll/y20;)V

    .line 82
    .line 83
    .line 84
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/transform/a;->a:Lcom/p1/mobile/putong/core/newui/home/card/expanded/transform/OldInfoTransOpLayout;

    .line 85
    .line 86
    new-instance v1, Lcom/p1/mobile/putong/core/newui/home/card/expanded/transform/a$a;

    .line 87
    .line 88
    invoke-direct {v1, p0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/transform/a$a;-><init>(Lcom/p1/mobile/putong/core/newui/home/card/expanded/transform/a;)V

    .line 89
    .line 90
    .line 91
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/transform/OldInfoTransOpLayout;->setTransListener(Lcom/p1/mobile/putong/core/newui/home/card/expanded/transform/OldInfoTransOpLayout$a;)V

    .line 92
    .line 93
    .line 94
    return-void
.end method

.method public final synthetic F(Landroid/view/View;)V
    .locals 1

    .line 1
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->pageId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    const-string v0, "e_confrim_new_profile"

    .line 10
    .line 11
    invoke-static {v0, p1}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/transform/a;->B()V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public final synthetic G(Landroid/view/View;)V
    .locals 4

    .line 1
    invoke-static {}, Ll/aw90;->V()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->pageId()Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    const-string v0, "e_edit_new_profile"

    .line 17
    .line 18
    invoke-static {v0, p1}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/transform/a;->C0()Landroid/content/Context;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    invoke-interface {v0}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    const/4 v1, 0x0

    .line 38
    const/4 v2, 0x1

    .line 39
    const-string v3, "old_info_trans_new"

    .line 40
    .line 41
    invoke-static {p0, v0, v3, v1, v2}, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->q2(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;ZZ)Landroid/content/Intent;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    invoke-virtual {p1, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 46
    .line 47
    .line 48
    return-void
.end method

.method public final synthetic H(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/transform/a;->B()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic I([I)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/transform/a;->h:Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedLayout;

    .line 2
    .line 3
    const/high16 v1, 0x3f800000    # 1.0f

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroid/view/View;->setAlpha(F)V

    .line 6
    .line 7
    .line 8
    const/4 v0, 0x1

    .line 9
    aget p1, p1, v0

    .line 10
    .line 11
    const/high16 v0, 0x42300000    # 44.0f

    .line 12
    .line 13
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    sub-int/2addr p1, v0

    .line 18
    invoke-static {}, Ll/bnl0;->F0()I

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    sub-int/2addr p1, v0

    .line 23
    const/high16 v0, 0x42200000    # 40.0f

    .line 24
    .line 25
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    sub-int/2addr p1, v0

    .line 30
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/transform/a;->r:I

    .line 31
    .line 32
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/transform/a;->h:Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedLayout;

    .line 33
    .line 34
    int-to-float p1, p1

    .line 35
    invoke-virtual {p0, p1}, Landroid/view/View;->setTranslationY(F)V

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method public J(Lcom/p1/mobile/putong/data/User;Ljava/util/List;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/data/User;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/CoreMomentInfo;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/transform/a;->a:Lcom/p1/mobile/putong/core/newui/home/card/expanded/transform/OldInfoTransOpLayout;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/transform/OldInfoTransOpLayout;->setInterceptMove(Z)V

    .line 5
    .line 6
    .line 7
    new-instance v0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 8
    .line 9
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;-><init>()V

    .line 10
    .line 11
    .line 12
    iget-object v2, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 13
    .line 14
    iput-object v2, v0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->id:Ljava/lang/String;

    .line 15
    .line 16
    iput-object p2, v0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->coreMomentInfoList:Ljava/util/List;

    .line 17
    .line 18
    sget-object p2, Lcom/p1/mobile/putong/core/data/CardInfoRenderFrom;->OLD_TRANS_PROFILE:Lcom/p1/mobile/putong/core/data/CardInfoRenderFrom;

    .line 19
    .line 20
    iput-object p2, v0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->renderFrom:Lcom/p1/mobile/putong/core/data/CardInfoRenderFrom;

    .line 21
    .line 22
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/transform/a;->h:Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedLayout;

    .line 23
    .line 24
    invoke-virtual {p2, p1, v0, v1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedLayout;->T(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;I)V

    .line 25
    .line 26
    .line 27
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/transform/a;->h:Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedLayout;

    .line 28
    .line 29
    const/4 p2, 0x0

    .line 30
    invoke-virtual {p1, p2}, Landroid/view/View;->setAlpha(F)V

    .line 31
    .line 32
    .line 33
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/transform/a;->h:Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedLayout;

    .line 34
    .line 35
    sget-object p1, Landroid/view/View;->ALPHA:Landroid/util/Property;

    .line 36
    .line 37
    const/4 p2, 0x2

    .line 38
    new-array p2, p2, [F

    .line 39
    .line 40
    fill-array-data p2, :array_0

    .line 41
    .line 42
    .line 43
    invoke-static {p0, p1, p2}, Ll/gt0;->n(Landroid/view/View;Landroid/util/Property;[F)Landroid/animation/Animator;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    const-wide/16 p1, 0x96

    .line 48
    .line 49
    invoke-virtual {p0, p1, p2}, Landroid/animation/Animator;->setDuration(J)Landroid/animation/Animator;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    invoke-virtual {p0}, Landroid/animation/Animator;->start()V

    .line 54
    .line 55
    .line 56
    return-void

    .line 57
    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public K(Lcom/p1/mobile/putong/data/User;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/transform/a;->a:Lcom/p1/mobile/putong/core/newui/home/card/expanded/transform/OldInfoTransOpLayout;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/transform/OldInfoTransOpLayout;->setInterceptMove(Z)V

    .line 5
    .line 6
    .line 7
    new-instance v0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 8
    .line 9
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;-><init>()V

    .line 10
    .line 11
    .line 12
    iget-object v2, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 13
    .line 14
    iput-object v2, v0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->id:Ljava/lang/String;

    .line 15
    .line 16
    sget-object v2, Lcom/p1/mobile/putong/core/data/CardInfoRenderFrom;->OLD_TRANS_PROFILE:Lcom/p1/mobile/putong/core/data/CardInfoRenderFrom;

    .line 17
    .line 18
    iput-object v2, v0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->renderFrom:Lcom/p1/mobile/putong/core/data/CardInfoRenderFrom;

    .line 19
    .line 20
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/transform/a;->h:Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedLayout;

    .line 21
    .line 22
    invoke-virtual {p0, p1, v0, v1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedLayout;->T(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;I)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public destroy()V
    .locals 0

    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/hh50;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/transform/a;->A(Ll/hh50;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/transform/a;->z(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/transform/a;->E()V

    .line 6
    .line 7
    .line 8
    return-object p1
.end method

.method public r()V
    .locals 4

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/dkb;->na()Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/transform/a;->l:Lv/VFrame;

    .line 10
    .line 11
    invoke-static {}, Ll/bnl0;->F0()I

    .line 12
    .line 13
    .line 14
    move-result v2

    .line 15
    invoke-static {v1, v2}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 16
    .line 17
    .line 18
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/transform/a;->h:Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedLayout;

    .line 19
    .line 20
    invoke-static {}, Ll/bnl0;->F0()I

    .line 21
    .line 22
    .line 23
    move-result v2

    .line 24
    const/high16 v3, 0x42300000    # 44.0f

    .line 25
    .line 26
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 27
    .line 28
    .line 29
    move-result v3

    .line 30
    add-int/2addr v2, v3

    .line 31
    invoke-static {v1, v2}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 32
    .line 33
    .line 34
    sget-object v1, Ll/uqb0;->G:Ll/fsb0;

    .line 35
    .line 36
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/transform/a;->f:Lv/VDraweeView;

    .line 37
    .line 38
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Picture$ImageUri;->formatted()Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    invoke-virtual {v1, v2, v0}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 51
    .line 52
    .line 53
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    invoke-static {v0}, Lcom/tantan/library/svga/SVGALoader;->with(Landroid/content/Context;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    const-string v1, "old_info_trans_anim.svga"

    .line 62
    .line 63
    invoke-virtual {v0, v1}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->from(Ljava/lang/String;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    const/4 v1, 0x1

    .line 68
    invoke-virtual {v0, v1}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->autoPlay(Z)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/transform/a;->e:Lcom/tantan/library/svga/SVGAnimationView;

    .line 73
    .line 74
    invoke-virtual {v0, v2}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->into(Lcom/tantan/library/svga/SVGAnimationView;)V

    .line 75
    .line 76
    .line 77
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 78
    .line 79
    .line 80
    move-result-object v0

    .line 81
    invoke-static {v0}, Lcom/tantan/library/svga/SVGALoader;->with(Landroid/content/Context;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 82
    .line 83
    .line 84
    move-result-object v0

    .line 85
    const-string v2, "https://auto.tancdn.com/v1/raw/e36623b2-bc84-4ac5-8f07-6237ffde6ac114.svga"

    .line 86
    .line 87
    invoke-virtual {v0, v2}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->from(Ljava/lang/String;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 88
    .line 89
    .line 90
    move-result-object v0

    .line 91
    invoke-virtual {v0, v1}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->autoPlay(Z)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 92
    .line 93
    .line 94
    move-result-object v0

    .line 95
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/transform/a;->g:Lcom/tantan/library/svga/SVGAnimationView;

    .line 96
    .line 97
    invoke-virtual {v0, p0}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->into(Lcom/tantan/library/svga/SVGAnimationView;)V

    .line 98
    .line 99
    .line 100
    return-void
.end method

.method public z(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/transform/a$b;->a(Lcom/p1/mobile/putong/core/newui/home/card/expanded/transform/a;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

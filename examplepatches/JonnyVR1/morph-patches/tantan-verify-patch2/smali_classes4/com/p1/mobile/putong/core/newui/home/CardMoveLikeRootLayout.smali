.class public Lcom/p1/mobile/putong/core/newui/home/CardMoveLikeRootLayout;
.super Lv/VFrame;
.source "SourceFile"


# instance fields
.field public a:Lcom/p1/mobile/putong/core/ui/GradientBgButton;

.field public b:Landroid/view/View;

.field public c:Lcom/p1/mobile/putong/core/newui/home/RightTipsView;

.field public d:Z

.field public e:Z

.field public f:I

.field public g:I

.field public h:I

.field public i:I

.field public j:I

.field public k:I

.field public l:I

.field public m:I

.field public n:Ll/x20;

.field public o:Ll/vxd0;

.field public p:Ll/vxd0;

.field public q:Ll/vxd0;

.field public r:Z

.field public s:Landroid/animation/ObjectAnimator;

.field public t:Z

.field public u:Z

.field public v:Ljava/lang/Runnable;

.field public w:I


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    .line 64
    invoke-direct {p0, p1, v0}, Lcom/p1/mobile/putong/core/newui/home/CardMoveLikeRootLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    .line 63
    invoke-direct {p0, p1, p2, v0}, Lcom/p1/mobile/putong/core/newui/home/CardMoveLikeRootLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 1

    .line 1
    invoke-direct {p0, p1, p2, p3}, Lv/VFrame;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/home/CardMoveLikeRootLayout;->d:Z

    .line 6
    .line 7
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/home/CardMoveLikeRootLayout;->e:Z

    .line 8
    .line 9
    const/high16 p2, 0x41200000    # 10.0f

    .line 10
    .line 11
    invoke-static {p2}, Ll/qa00;->d(F)I

    .line 12
    .line 13
    .line 14
    move-result p2

    .line 15
    iput p2, p0, Lcom/p1/mobile/putong/core/newui/home/CardMoveLikeRootLayout;->f:I

    .line 16
    .line 17
    const/high16 p2, 0x42980000    # 76.0f

    .line 18
    .line 19
    invoke-static {p2}, Ll/qa00;->d(F)I

    .line 20
    .line 21
    .line 22
    move-result p2

    .line 23
    iput p2, p0, Lcom/p1/mobile/putong/core/newui/home/CardMoveLikeRootLayout;->g:I

    .line 24
    .line 25
    new-instance p2, Ll/vxd0;

    .line 26
    .line 27
    const-string p3, "full_card_5_btn_tran_x"

    .line 28
    .line 29
    const/16 v0, -0x1f4

    .line 30
    .line 31
    invoke-direct {p2, p3, v0}, Ll/vxd0;-><init>(Ljava/lang/String;I)V

    .line 32
    .line 33
    .line 34
    iput-object p2, p0, Lcom/p1/mobile/putong/core/newui/home/CardMoveLikeRootLayout;->o:Ll/vxd0;

    .line 35
    .line 36
    new-instance p2, Ll/vxd0;

    .line 37
    .line 38
    const-string p3, "full_card_5_btn_tran_y"

    .line 39
    .line 40
    invoke-direct {p2, p3, p1}, Ll/vxd0;-><init>(Ljava/lang/String;I)V

    .line 41
    .line 42
    .line 43
    iput-object p2, p0, Lcom/p1/mobile/putong/core/newui/home/CardMoveLikeRootLayout;->p:Ll/vxd0;

    .line 44
    .line 45
    new-instance p2, Ll/vxd0;

    .line 46
    .line 47
    const-string p3, "full_card_btn_5_tran_count"

    .line 48
    .line 49
    invoke-direct {p2, p3, p1}, Ll/vxd0;-><init>(Ljava/lang/String;I)V

    .line 50
    .line 51
    .line 52
    iput-object p2, p0, Lcom/p1/mobile/putong/core/newui/home/CardMoveLikeRootLayout;->q:Ll/vxd0;

    .line 53
    .line 54
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/home/CardMoveLikeRootLayout;->r:Z

    .line 55
    .line 56
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/home/CardMoveLikeRootLayout;->t:Z

    .line 57
    .line 58
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/home/CardMoveLikeRootLayout;->u:Z

    .line 59
    .line 60
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/CardMoveLikeRootLayout;->w:I

    .line 61
    .line 62
    return-void
.end method


# virtual methods
.method public final B(II)Z
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/CardMoveLikeRootLayout;->a:Lcom/p1/mobile/putong/core/ui/GradientBgButton;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/View;->getX()F

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    float-to-int v0, v0

    .line 8
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/CardMoveLikeRootLayout;->a:Lcom/p1/mobile/putong/core/ui/GradientBgButton;

    .line 9
    .line 10
    invoke-virtual {v1}, Landroid/view/View;->getY()F

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    float-to-int v1, v1

    .line 15
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/home/CardMoveLikeRootLayout;->a:Lcom/p1/mobile/putong/core/ui/GradientBgButton;

    .line 16
    .line 17
    invoke-virtual {v2}, Landroid/view/View;->getWidth()I

    .line 18
    .line 19
    .line 20
    move-result v2

    .line 21
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/CardMoveLikeRootLayout;->a:Lcom/p1/mobile/putong/core/ui/GradientBgButton;

    .line 22
    .line 23
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 24
    .line 25
    .line 26
    move-result p0

    .line 27
    if-lt p1, v0, :cond_0

    .line 28
    .line 29
    add-int/2addr v0, v2

    .line 30
    if-gt p1, v0, :cond_0

    .line 31
    .line 32
    if-lt p2, v1, :cond_0

    .line 33
    .line 34
    add-int/2addr v1, p0

    .line 35
    if-gt p2, v1, :cond_0

    .line 36
    .line 37
    const/4 p0, 0x1

    .line 38
    return p0

    .line 39
    :cond_0
    const/4 p0, 0x0

    .line 40
    return p0
.end method

.method public final C()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/CardMoveLikeRootLayout;->n:Ll/x20;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/CardMoveLikeRootLayout;->a:Lcom/p1/mobile/putong/core/ui/GradientBgButton;

    .line 6
    .line 7
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/ShadowButton;->a()V

    .line 8
    .line 9
    .line 10
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/CardMoveLikeRootLayout;->n:Ll/x20;

    .line 11
    .line 12
    invoke-interface {p0}, Ll/x20;->call()V

    .line 13
    .line 14
    .line 15
    :cond_0
    return-void
.end method

.method public final E(I)Z
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iget v1, p0, Lcom/p1/mobile/putong/core/newui/home/CardMoveLikeRootLayout;->g:I

    .line 6
    .line 7
    sub-int/2addr v0, v1

    .line 8
    div-int/lit8 v1, v1, 0x5

    .line 9
    .line 10
    add-int/2addr v0, v1

    .line 11
    if-lt p1, v0, :cond_0

    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/CardMoveLikeRootLayout;->s()V

    .line 14
    .line 15
    .line 16
    const/4 p0, 0x1

    .line 17
    return p0

    .line 18
    :cond_0
    const/4 p0, 0x0

    .line 19
    return p0
.end method

.method public onInterceptTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 4

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/newui/home/CardMoveLikeRootLayout;->t:Z

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_3

    .line 5
    .line 6
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/CardMoveLikeRootLayout;->a:Lcom/p1/mobile/putong/core/ui/GradientBgButton;

    .line 7
    .line 8
    if-nez v0, :cond_0

    .line 9
    .line 10
    goto :goto_1

    .line 11
    :cond_0
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    float-to-int v0, v0

    .line 16
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 17
    .line 18
    .line 19
    move-result v2

    .line 20
    float-to-int v2, v2

    .line 21
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 22
    .line 23
    .line 24
    move-result v3

    .line 25
    if-eqz v3, :cond_1

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_1
    iput-boolean v1, p0, Lcom/p1/mobile/putong/core/newui/home/CardMoveLikeRootLayout;->d:Z

    .line 29
    .line 30
    iput-boolean v1, p0, Lcom/p1/mobile/putong/core/newui/home/CardMoveLikeRootLayout;->e:Z

    .line 31
    .line 32
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/CardMoveLikeRootLayout;->z()V

    .line 33
    .line 34
    .line 35
    invoke-virtual {p0, v0, v2}, Lcom/p1/mobile/putong/core/newui/home/CardMoveLikeRootLayout;->B(II)Z

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    if-eqz v0, :cond_2

    .line 40
    .line 41
    const/4 p1, 0x1

    .line 42
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/home/CardMoveLikeRootLayout;->e:Z

    .line 43
    .line 44
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/CardMoveLikeRootLayout;->p()V

    .line 45
    .line 46
    .line 47
    return p1

    .line 48
    :cond_2
    :goto_0
    invoke-super {p0, p1}, Lv/VFrame;->onInterceptTouchEvent(Landroid/view/MotionEvent;)Z

    .line 49
    .line 50
    .line 51
    move-result p0

    .line 52
    return p0

    .line 53
    :cond_3
    :goto_1
    return v1
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 10

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/newui/home/CardMoveLikeRootLayout;->t:Z

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_b

    .line 5
    .line 6
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/CardMoveLikeRootLayout;->a:Lcom/p1/mobile/putong/core/ui/GradientBgButton;

    .line 7
    .line 8
    if-nez v0, :cond_0

    .line 9
    .line 10
    goto/16 :goto_2

    .line 11
    .line 12
    :cond_0
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    float-to-int v0, v0

    .line 17
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 18
    .line 19
    .line 20
    move-result v2

    .line 21
    float-to-int v2, v2

    .line 22
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 23
    .line 24
    .line 25
    move-result v3

    .line 26
    if-eqz v3, :cond_a

    .line 27
    .line 28
    const-wide/16 v4, 0x64

    .line 29
    .line 30
    const/4 v6, 0x0

    .line 31
    const/4 v7, 0x3

    .line 32
    const/4 v8, 0x1

    .line 33
    if-eq v3, v8, :cond_4

    .line 34
    .line 35
    const/4 v9, 0x2

    .line 36
    if-eq v3, v9, :cond_1

    .line 37
    .line 38
    if-eq v3, v7, :cond_4

    .line 39
    .line 40
    goto/16 :goto_1

    .line 41
    .line 42
    :cond_1
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/newui/home/CardMoveLikeRootLayout;->e:Z

    .line 43
    .line 44
    if-eqz v1, :cond_9

    .line 45
    .line 46
    iget-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/home/CardMoveLikeRootLayout;->d:Z

    .line 47
    .line 48
    if-nez p1, :cond_2

    .line 49
    .line 50
    invoke-virtual {p0, v0, v2}, Lcom/p1/mobile/putong/core/newui/home/CardMoveLikeRootLayout;->u(II)Z

    .line 51
    .line 52
    .line 53
    move-result p1

    .line 54
    if-eqz p1, :cond_2

    .line 55
    .line 56
    iput-boolean v8, p0, Lcom/p1/mobile/putong/core/newui/home/CardMoveLikeRootLayout;->d:Z

    .line 57
    .line 58
    iput v0, p0, Lcom/p1/mobile/putong/core/newui/home/CardMoveLikeRootLayout;->j:I

    .line 59
    .line 60
    iput v2, p0, Lcom/p1/mobile/putong/core/newui/home/CardMoveLikeRootLayout;->k:I

    .line 61
    .line 62
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/CardMoveLikeRootLayout;->a:Lcom/p1/mobile/putong/core/ui/GradientBgButton;

    .line 63
    .line 64
    invoke-virtual {p1}, Landroid/view/View;->getTranslationX()F

    .line 65
    .line 66
    .line 67
    move-result p1

    .line 68
    float-to-int p1, p1

    .line 69
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/CardMoveLikeRootLayout;->l:I

    .line 70
    .line 71
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/CardMoveLikeRootLayout;->a:Lcom/p1/mobile/putong/core/ui/GradientBgButton;

    .line 72
    .line 73
    invoke-virtual {p1}, Landroid/view/View;->getTranslationY()F

    .line 74
    .line 75
    .line 76
    move-result p1

    .line 77
    float-to-int p1, p1

    .line 78
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/CardMoveLikeRootLayout;->m:I

    .line 79
    .line 80
    :cond_2
    iget-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/home/CardMoveLikeRootLayout;->d:Z

    .line 81
    .line 82
    if-eqz p1, :cond_3

    .line 83
    .line 84
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/newui/home/CardMoveLikeRootLayout;->v(I)I

    .line 85
    .line 86
    .line 87
    move-result p1

    .line 88
    invoke-virtual {p0, v2}, Lcom/p1/mobile/putong/core/newui/home/CardMoveLikeRootLayout;->w(I)I

    .line 89
    .line 90
    .line 91
    move-result v0

    .line 92
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/CardMoveLikeRootLayout;->a:Lcom/p1/mobile/putong/core/ui/GradientBgButton;

    .line 93
    .line 94
    int-to-float p1, p1

    .line 95
    invoke-virtual {v1, p1}, Landroid/view/View;->setTranslationX(F)V

    .line 96
    .line 97
    .line 98
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/CardMoveLikeRootLayout;->a:Lcom/p1/mobile/putong/core/ui/GradientBgButton;

    .line 99
    .line 100
    int-to-float v0, v0

    .line 101
    invoke-virtual {p1, v0}, Landroid/view/View;->setTranslationY(F)V

    .line 102
    .line 103
    .line 104
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/CardMoveLikeRootLayout;->b:Landroid/view/View;

    .line 105
    .line 106
    if-eqz p1, :cond_3

    .line 107
    .line 108
    invoke-virtual {p1}, Landroid/view/View;->getAlpha()F

    .line 109
    .line 110
    .line 111
    move-result p1

    .line 112
    cmpg-float p1, p1, v6

    .line 113
    .line 114
    if-gtz p1, :cond_3

    .line 115
    .line 116
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/CardMoveLikeRootLayout;->b:Landroid/view/View;

    .line 117
    .line 118
    const v0, 0x3c23d70a    # 0.01f

    .line 119
    .line 120
    .line 121
    invoke-virtual {p1, v0}, Landroid/view/View;->setAlpha(F)V

    .line 122
    .line 123
    .line 124
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/CardMoveLikeRootLayout;->b:Landroid/view/View;

    .line 125
    .line 126
    invoke-virtual {p0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    .line 127
    .line 128
    .line 129
    move-result-object p0

    .line 130
    const/high16 p1, 0x3f800000    # 1.0f

    .line 131
    .line 132
    invoke-virtual {p0, p1}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    .line 133
    .line 134
    .line 135
    move-result-object p0

    .line 136
    invoke-virtual {p0, v4, v5}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    .line 137
    .line 138
    .line 139
    move-result-object p0

    .line 140
    invoke-virtual {p0}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 141
    .line 142
    .line 143
    :cond_3
    return v8

    .line 144
    :cond_4
    iget-boolean v3, p0, Lcom/p1/mobile/putong/core/newui/home/CardMoveLikeRootLayout;->e:Z

    .line 145
    .line 146
    if-eqz v3, :cond_8

    .line 147
    .line 148
    iget-boolean v3, p0, Lcom/p1/mobile/putong/core/newui/home/CardMoveLikeRootLayout;->d:Z

    .line 149
    .line 150
    if-eqz v3, :cond_6

    .line 151
    .line 152
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/newui/home/CardMoveLikeRootLayout;->v(I)I

    .line 153
    .line 154
    .line 155
    move-result v0

    .line 156
    invoke-virtual {p0, v2}, Lcom/p1/mobile/putong/core/newui/home/CardMoveLikeRootLayout;->w(I)I

    .line 157
    .line 158
    .line 159
    move-result v2

    .line 160
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/newui/home/CardMoveLikeRootLayout;->E(I)Z

    .line 161
    .line 162
    .line 163
    move-result v3

    .line 164
    if-nez v3, :cond_5

    .line 165
    .line 166
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/home/CardMoveLikeRootLayout;->a:Lcom/p1/mobile/putong/core/ui/GradientBgButton;

    .line 167
    .line 168
    int-to-float v8, v0

    .line 169
    invoke-virtual {v3, v8}, Landroid/view/View;->setTranslationX(F)V

    .line 170
    .line 171
    .line 172
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/home/CardMoveLikeRootLayout;->a:Lcom/p1/mobile/putong/core/ui/GradientBgButton;

    .line 173
    .line 174
    int-to-float v8, v2

    .line 175
    invoke-virtual {v3, v8}, Landroid/view/View;->setTranslationY(F)V

    .line 176
    .line 177
    .line 178
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/home/CardMoveLikeRootLayout;->o:Ll/vxd0;

    .line 179
    .line 180
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 181
    .line 182
    .line 183
    move-result-object v0

    .line 184
    invoke-virtual {v3, v0}, Ll/vxd0;->put(Ljava/lang/Object;)Z

    .line 185
    .line 186
    .line 187
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/CardMoveLikeRootLayout;->p:Ll/vxd0;

    .line 188
    .line 189
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 190
    .line 191
    .line 192
    move-result-object v2

    .line 193
    invoke-virtual {v0, v2}, Ll/vxd0;->put(Ljava/lang/Object;)Z

    .line 194
    .line 195
    .line 196
    :cond_5
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/CardMoveLikeRootLayout;->q:Ll/vxd0;

    .line 197
    .line 198
    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 199
    .line 200
    .line 201
    move-result-object v2

    .line 202
    invoke-virtual {v0, v2}, Ll/vxd0;->put(Ljava/lang/Object;)Z

    .line 203
    .line 204
    .line 205
    goto :goto_0

    .line 206
    :cond_6
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 207
    .line 208
    .line 209
    move-result v0

    .line 210
    if-ne v0, v8, :cond_7

    .line 211
    .line 212
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/CardMoveLikeRootLayout;->C()V

    .line 213
    .line 214
    .line 215
    :cond_7
    :goto_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/CardMoveLikeRootLayout;->b:Landroid/view/View;

    .line 216
    .line 217
    if-eqz v0, :cond_8

    .line 218
    .line 219
    invoke-virtual {v0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    .line 220
    .line 221
    .line 222
    move-result-object v0

    .line 223
    invoke-virtual {v0, v6}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    .line 224
    .line 225
    .line 226
    move-result-object v0

    .line 227
    invoke-virtual {v0, v4, v5}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    .line 228
    .line 229
    .line 230
    move-result-object v0

    .line 231
    invoke-virtual {v0}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 232
    .line 233
    .line 234
    :cond_8
    iput-boolean v1, p0, Lcom/p1/mobile/putong/core/newui/home/CardMoveLikeRootLayout;->d:Z

    .line 235
    .line 236
    iput-boolean v1, p0, Lcom/p1/mobile/putong/core/newui/home/CardMoveLikeRootLayout;->e:Z

    .line 237
    .line 238
    :cond_9
    :goto_1
    invoke-super {p0, p1}, Landroid/view/View;->onTouchEvent(Landroid/view/MotionEvent;)Z

    .line 239
    .line 240
    .line 241
    move-result p0

    .line 242
    return p0

    .line 243
    :cond_a
    iput v0, p0, Lcom/p1/mobile/putong/core/newui/home/CardMoveLikeRootLayout;->h:I

    .line 244
    .line 245
    iput v2, p0, Lcom/p1/mobile/putong/core/newui/home/CardMoveLikeRootLayout;->i:I

    .line 246
    .line 247
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/newui/home/CardMoveLikeRootLayout;->e:Z

    .line 248
    .line 249
    return p0

    .line 250
    :cond_b
    :goto_2
    return v1
.end method

.method public final p()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/CardMoveLikeRootLayout;->s:Landroid/animation/ObjectAnimator;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/animation/Animator;->isRunning()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/CardMoveLikeRootLayout;->s:Landroid/animation/ObjectAnimator;

    .line 12
    .line 13
    invoke-virtual {v0}, Landroid/animation/Animator;->cancel()V

    .line 14
    .line 15
    .line 16
    const/4 v0, 0x0

    .line 17
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/CardMoveLikeRootLayout;->s:Landroid/animation/ObjectAnimator;

    .line 18
    .line 19
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/CardMoveLikeRootLayout;->v:Ljava/lang/Runnable;

    .line 20
    .line 21
    invoke-static {p0}, Ll/l51;->J(Ljava/lang/Runnable;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public final s()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/CardMoveLikeRootLayout;->o:Ll/vxd0;

    .line 2
    .line 3
    const/16 v1, -0x1f4

    .line 4
    .line 5
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-virtual {v0, v1}, Ll/vxd0;->put(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/CardMoveLikeRootLayout;->a:Lcom/p1/mobile/putong/core/ui/GradientBgButton;

    .line 13
    .line 14
    invoke-virtual {v0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    const/high16 v1, 0x42180000    # 38.0f

    .line 23
    .line 24
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 25
    .line 26
    .line 27
    move-result v1

    .line 28
    sub-int/2addr p0, v1

    .line 29
    int-to-float p0, p0

    .line 30
    invoke-virtual {v0, p0}, Landroid/view/ViewPropertyAnimator;->translationX(F)Landroid/view/ViewPropertyAnimator;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    const-wide/16 v0, 0xc8

    .line 35
    .line 36
    invoke-virtual {p0, v0, v1}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    invoke-virtual {p0}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 41
    .line 42
    .line 43
    return-void
.end method

.method public final u(II)Z
    .locals 2

    .line 1
    iget v0, p0, Lcom/p1/mobile/putong/core/newui/home/CardMoveLikeRootLayout;->h:I

    .line 2
    .line 3
    sub-int v1, p1, v0

    .line 4
    .line 5
    sub-int/2addr p1, v0

    .line 6
    mul-int/2addr v1, p1

    .line 7
    iget p1, p0, Lcom/p1/mobile/putong/core/newui/home/CardMoveLikeRootLayout;->i:I

    .line 8
    .line 9
    sub-int v0, p2, p1

    .line 10
    .line 11
    sub-int/2addr p2, p1

    .line 12
    mul-int/2addr v0, p2

    .line 13
    add-int/2addr v1, v0

    .line 14
    iget p0, p0, Lcom/p1/mobile/putong/core/newui/home/CardMoveLikeRootLayout;->f:I

    .line 15
    .line 16
    mul-int/2addr p0, p0

    .line 17
    if-lt v1, p0, :cond_0

    .line 18
    .line 19
    const/4 p0, 0x1

    .line 20
    return p0

    .line 21
    :cond_0
    const/4 p0, 0x0

    .line 22
    return p0
.end method

.method public final v(I)I
    .locals 3

    .line 1
    iget v0, p0, Lcom/p1/mobile/putong/core/newui/home/CardMoveLikeRootLayout;->l:I

    .line 2
    .line 3
    iget v1, p0, Lcom/p1/mobile/putong/core/newui/home/CardMoveLikeRootLayout;->j:I

    .line 4
    .line 5
    sub-int/2addr p1, v1

    .line 6
    add-int/2addr v0, p1

    .line 7
    iget p1, p0, Lcom/p1/mobile/putong/core/newui/home/CardMoveLikeRootLayout;->g:I

    .line 8
    .line 9
    neg-int v1, p1

    .line 10
    div-int/lit8 v1, v1, 0x2

    .line 11
    .line 12
    if-ge v0, v1, :cond_0

    .line 13
    .line 14
    neg-int p0, p1

    .line 15
    div-int/lit8 p0, p0, 0x2

    .line 16
    .line 17
    return p0

    .line 18
    :cond_0
    add-int/2addr p1, v0

    .line 19
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    iget v2, p0, Lcom/p1/mobile/putong/core/newui/home/CardMoveLikeRootLayout;->g:I

    .line 24
    .line 25
    div-int/lit8 v2, v2, 0x2

    .line 26
    .line 27
    add-int/2addr v1, v2

    .line 28
    if-le p1, v1, :cond_1

    .line 29
    .line 30
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 31
    .line 32
    .line 33
    move-result p1

    .line 34
    iget p0, p0, Lcom/p1/mobile/putong/core/newui/home/CardMoveLikeRootLayout;->g:I

    .line 35
    .line 36
    div-int/lit8 p0, p0, 0x2

    .line 37
    .line 38
    sub-int/2addr p1, p0

    .line 39
    return p1

    .line 40
    :cond_1
    return v0
.end method

.method public final w(I)I
    .locals 2

    .line 1
    iget v0, p0, Lcom/p1/mobile/putong/core/newui/home/CardMoveLikeRootLayout;->m:I

    .line 2
    .line 3
    iget v1, p0, Lcom/p1/mobile/putong/core/newui/home/CardMoveLikeRootLayout;->k:I

    .line 4
    .line 5
    sub-int/2addr p1, v1

    .line 6
    add-int/2addr v0, p1

    .line 7
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    div-int/lit8 p1, p1, 0x2

    .line 12
    .line 13
    if-le v0, p1, :cond_0

    .line 14
    .line 15
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    div-int/lit8 p0, p0, 0x2

    .line 20
    .line 21
    return p0

    .line 22
    :cond_0
    iget p1, p0, Lcom/p1/mobile/putong/core/newui/home/CardMoveLikeRootLayout;->g:I

    .line 23
    .line 24
    div-int/lit8 p1, p1, 0x2

    .line 25
    .line 26
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 27
    .line 28
    .line 29
    move-result v1

    .line 30
    div-int/lit8 v1, v1, 0x2

    .line 31
    .line 32
    sub-int/2addr p1, v1

    .line 33
    if-ge v0, p1, :cond_1

    .line 34
    .line 35
    iget p1, p0, Lcom/p1/mobile/putong/core/newui/home/CardMoveLikeRootLayout;->g:I

    .line 36
    .line 37
    div-int/lit8 p1, p1, 0x2

    .line 38
    .line 39
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 40
    .line 41
    .line 42
    move-result p0

    .line 43
    div-int/lit8 p0, p0, 0x2

    .line 44
    .line 45
    sub-int/2addr p1, p0

    .line 46
    return p1

    .line 47
    :cond_1
    return v0
.end method

.method public final z()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/CardMoveLikeRootLayout;->c:Lcom/p1/mobile/putong/core/newui/home/RightTipsView;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/CardMoveLikeRootLayout;->c:Lcom/p1/mobile/putong/core/newui/home/RightTipsView;

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 13
    .line 14
    .line 15
    :cond_0
    return-void
.end method

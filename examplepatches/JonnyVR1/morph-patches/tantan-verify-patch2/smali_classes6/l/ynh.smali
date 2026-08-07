.class public Ll/ynh;
.super Ll/yqg;
.source "SourceFile"


# instance fields
.field public E0:Lv/VText;

.field public F0:Landroid/widget/RelativeLayout;

.field public G0:Lv/VText;

.field public H0:Landroid/widget/LinearLayout;

.field public I0:Landroid/widget/TextView;

.field public J:Landroidx/constraintlayout/widget/ConstraintLayout;

.field public J0:Lcom/p1/mobile/putong/newui/view/InnerClickSpanTextView;

.field public K:Landroid/view/View;

.field public K0:Lcom/p1/mobile/putong/feed/newui/photoalbum/feedbottom/insert/FeedInteractiveView;

.field public L:Landroid/widget/LinearLayout;

.field public L0:Lv/VLinear;

.field public M:Lv/VImage;

.field public M0:Lv/VImage;

.field public N:Lv/VText;

.field public N0:Lv/VText;

.field public O:Lv/VImage;

.field public O0:Lv/VLinear;

.field public P:Lv/VImage;

.field public P0:Lv/VImage;

.field public Q:Landroid/view/View;

.field public Q0:Lv/VText;

.field public R:Landroidx/constraintlayout/widget/ConstraintLayout;

.field public R0:Lv/VLinear;

.field public S:Lv/VDraweeView;

.field public S0:Lv/VImage;

.field public T:Lv/VDraweeView;

.field public T0:Lv/VText;

.field public U:Lv/VText;

.field public U0:Landroid/view/View;

.field public V:Landroid/widget/LinearLayout;

.field public V0:Landroid/widget/LinearLayout;

.field public W:Lv/VImage;

.field public W0:Landroid/widget/LinearLayout;

.field public X:Lv/VLinear;

.field public X0:Landroid/view/View;

.field public Y:Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinminetab/FeedWriterLevelView;

.field public Y0:Landroid/widget/LinearLayout;

.field public Z:Landroid/widget/LinearLayout;

.field public Z0:Lv/VEditText;

.field public a1:Landroid/widget/TextView;

.field public b1:Lv/VLinear;

.field public c1:Z

.field public d1:F

.field public e1:F

.field public f1:F

.field public g1:Z

.field public h1:Z

.field public i1:Z

.field public k0:Landroid/widget/ImageView;

.field public p0:Lv/VText;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/feed/data/Moment;ZZLcom/p1/mobile/android/app/Act;)V
    .locals 0

    .line 1
    invoke-direct {p0, p4}, Ll/yqg;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 2
    .line 3
    .line 4
    const/4 p4, 0x1

    .line 5
    iput-boolean p4, p0, Ll/ynh;->c1:Z

    .line 6
    .line 7
    iput-object p1, p0, Ll/yqg;->A:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 8
    .line 9
    iput-boolean p2, p0, Ll/ynh;->h1:Z

    .line 10
    .line 11
    iput-boolean p3, p0, Ll/ynh;->i1:Z

    .line 12
    .line 13
    const-string p2, "photo"

    .line 14
    .line 15
    iput-object p2, p0, Ll/yqg;->x:Ljava/lang/String;

    .line 16
    .line 17
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result p2

    .line 21
    if-eqz p2, :cond_0

    .line 22
    .line 23
    sget-object p2, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 24
    .line 25
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/Moment;->owner:Ljava/lang/String;

    .line 26
    .line 27
    invoke-virtual {p2, p1}, Ll/jka;->e8(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    iput-object p1, p0, Ll/yqg;->B:Lcom/p1/mobile/putong/data/User;

    .line 32
    .line 33
    :cond_0
    invoke-virtual {p0}, Ll/ynh;->H0()V

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public static synthetic u0(Ll/ynh;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ynh;->M0(Ljava/lang/Boolean;)V

    return-void
.end method

.method public static synthetic v0(Ll/ynh;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ynh;->L0()V

    return-void
.end method

.method public static synthetic w0(Ll/ynh;Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ynh;->I0(Landroid/animation/ValueAnimator;)V

    return-void
.end method

.method public static synthetic x0(Ll/ynh;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ynh;->J0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic y0(Ll/ynh;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ynh;->K0(Landroid/view/View;)V

    return-void
.end method

.method public static bridge synthetic z0(Ll/ynh;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ynh;->N0()V

    return-void
.end method


# virtual methods
.method public A0(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/znh;->b(Ll/ynh;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public B0()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ynh;->S:Lv/VDraweeView;

    .line 2
    .line 3
    iput-object v0, p0, Ll/yqg;->b:Lv/VDraweeView;

    .line 4
    .line 5
    iget-object v0, p0, Ll/ynh;->T:Lv/VDraweeView;

    .line 6
    .line 7
    iput-object v0, p0, Ll/yqg;->c:Lv/VDraweeView;

    .line 8
    .line 9
    iget-object v0, p0, Ll/ynh;->U:Lv/VText;

    .line 10
    .line 11
    iput-object v0, p0, Ll/yqg;->e:Lv/VText;

    .line 12
    .line 13
    iget-object v0, p0, Ll/ynh;->G0:Lv/VText;

    .line 14
    .line 15
    iput-object v0, p0, Ll/yqg;->f:Lv/VText;

    .line 16
    .line 17
    iget-object v0, p0, Ll/ynh;->J0:Lcom/p1/mobile/putong/newui/view/InnerClickSpanTextView;

    .line 18
    .line 19
    iput-object v0, p0, Ll/yqg;->g:Lv/VText;

    .line 20
    .line 21
    iget-object v0, p0, Ll/ynh;->M0:Lv/VImage;

    .line 22
    .line 23
    iput-object v0, p0, Ll/yqg;->h:Lv/VImage;

    .line 24
    .line 25
    iget-object v0, p0, Ll/ynh;->N0:Lv/VText;

    .line 26
    .line 27
    iput-object v0, p0, Ll/yqg;->i:Lv/VText;

    .line 28
    .line 29
    iget-object v0, p0, Ll/ynh;->Q0:Lv/VText;

    .line 30
    .line 31
    iput-object v0, p0, Ll/yqg;->k:Lv/VText;

    .line 32
    .line 33
    iget-object v0, p0, Ll/ynh;->P0:Lv/VImage;

    .line 34
    .line 35
    iput-object v0, p0, Ll/yqg;->j:Lv/VImage;

    .line 36
    .line 37
    iget-object v0, p0, Ll/ynh;->V0:Landroid/widget/LinearLayout;

    .line 38
    .line 39
    iput-object v0, p0, Ll/yqg;->l:Landroid/widget/LinearLayout;

    .line 40
    .line 41
    iget-object v0, p0, Ll/ynh;->W0:Landroid/widget/LinearLayout;

    .line 42
    .line 43
    iput-object v0, p0, Ll/yqg;->m:Landroid/widget/LinearLayout;

    .line 44
    .line 45
    iget-object v0, p0, Ll/ynh;->Z0:Lv/VEditText;

    .line 46
    .line 47
    iput-object v0, p0, Ll/yqg;->n:Lv/VEditText;

    .line 48
    .line 49
    iget-object v0, p0, Ll/ynh;->a1:Landroid/widget/TextView;

    .line 50
    .line 51
    iput-object v0, p0, Ll/yqg;->o:Landroid/widget/TextView;

    .line 52
    .line 53
    iget-object v0, p0, Ll/ynh;->K:Landroid/view/View;

    .line 54
    .line 55
    iput-object v0, p0, Ll/yqg;->a:Landroid/view/View;

    .line 56
    .line 57
    iget-object v0, p0, Ll/ynh;->L:Landroid/widget/LinearLayout;

    .line 58
    .line 59
    iput-object v0, p0, Ll/yqg;->p:Landroid/widget/LinearLayout;

    .line 60
    .line 61
    iget-object v0, p0, Ll/ynh;->R:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 62
    .line 63
    iput-object v0, p0, Ll/yqg;->t:Landroid/view/View;

    .line 64
    .line 65
    iget-object v0, p0, Ll/ynh;->N:Lv/VText;

    .line 66
    .line 67
    iput-object v0, p0, Ll/yqg;->r:Landroid/widget/TextView;

    .line 68
    .line 69
    iget-object v0, p0, Ll/ynh;->M:Lv/VImage;

    .line 70
    .line 71
    iput-object v0, p0, Ll/yqg;->q:Lv/VImage;

    .line 72
    .line 73
    iget-object v0, p0, Ll/ynh;->P:Lv/VImage;

    .line 74
    .line 75
    iput-object v0, p0, Ll/yqg;->s:Lv/VImage;

    .line 76
    .line 77
    iget-object v0, p0, Ll/ynh;->Q:Landroid/view/View;

    .line 78
    .line 79
    iput-object v0, p0, Ll/yqg;->u:Landroid/view/View;

    .line 80
    .line 81
    iget-object v0, p0, Ll/ynh;->Y0:Landroid/widget/LinearLayout;

    .line 82
    .line 83
    iput-object v0, p0, Ll/yqg;->v:Landroid/widget/LinearLayout;

    .line 84
    .line 85
    iget-object v0, p0, Ll/ynh;->K0:Lcom/p1/mobile/putong/feed/newui/photoalbum/feedbottom/insert/FeedInteractiveView;

    .line 86
    .line 87
    iput-object v0, p0, Ll/yqg;->w:Lcom/p1/mobile/putong/feed/newui/photoalbum/feedbottom/insert/FeedInteractiveView;

    .line 88
    .line 89
    return-void
.end method

.method public C0()V
    .locals 3

    .line 1
    new-instance v0, Landroidx/constraintlayout/widget/ConstraintLayout$a;

    .line 2
    .line 3
    const/high16 v1, 0x42900000    # 72.0f

    .line 4
    .line 5
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    const/4 v2, -0x1

    .line 10
    invoke-direct {v0, v1, v2}, Landroidx/constraintlayout/widget/ConstraintLayout$a;-><init>(II)V

    .line 11
    .line 12
    .line 13
    iget-object v1, p0, Ll/ynh;->R:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 14
    .line 15
    invoke-virtual {v1}, Landroid/view/View;->getId()I

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    iput v1, v0, Landroidx/constraintlayout/widget/ConstraintLayout$a;->g:I

    .line 20
    .line 21
    iget-object v1, p0, Ll/ynh;->L0:Lv/VLinear;

    .line 22
    .line 23
    invoke-virtual {v1}, Landroid/view/View;->getId()I

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    iput v1, v0, Landroidx/constraintlayout/widget/ConstraintLayout$a;->h:I

    .line 28
    .line 29
    iget-object v1, p0, Ll/ynh;->O0:Lv/VLinear;

    .line 30
    .line 31
    invoke-virtual {v1, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 32
    .line 33
    .line 34
    iget-object v0, p0, Ll/ynh;->O0:Lv/VLinear;

    .line 35
    .line 36
    const/4 v1, 0x0

    .line 37
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 38
    .line 39
    .line 40
    iget-object v0, p0, Ll/ynh;->P0:Lv/VImage;

    .line 41
    .line 42
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    check-cast v0, Landroid/widget/LinearLayout$LayoutParams;

    .line 47
    .line 48
    const/high16 v1, 0x41c00000    # 24.0f

    .line 49
    .line 50
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 51
    .line 52
    .line 53
    move-result v2

    .line 54
    iput v2, v0, Landroid/widget/LinearLayout$LayoutParams;->width:I

    .line 55
    .line 56
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 57
    .line 58
    .line 59
    move-result v1

    .line 60
    iput v1, v0, Landroid/widget/LinearLayout$LayoutParams;->height:I

    .line 61
    .line 62
    const/4 v1, 0x0

    .line 63
    invoke-virtual {v0, v1, v1, v1, v1}, Landroid/view/ViewGroup$MarginLayoutParams;->setMargins(IIII)V

    .line 64
    .line 65
    .line 66
    iget-object v2, p0, Ll/ynh;->P0:Lv/VImage;

    .line 67
    .line 68
    invoke-virtual {v2, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 69
    .line 70
    .line 71
    iget-object v0, p0, Ll/ynh;->P0:Lv/VImage;

    .line 72
    .line 73
    invoke-static {}, Ll/j4h;->h()Z

    .line 74
    .line 75
    .line 76
    move-result v2

    .line 77
    if-eqz v2, :cond_0

    .line 78
    .line 79
    sget v2, Ll/lbc0;->v3:I

    .line 80
    .line 81
    goto :goto_0

    .line 82
    :cond_0
    sget v2, Ll/lbc0;->w3:I

    .line 83
    .line 84
    :goto_0
    invoke-virtual {v0, v2}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 85
    .line 86
    .line 87
    iget-object v0, p0, Ll/ynh;->Q0:Lv/VText;

    .line 88
    .line 89
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 90
    .line 91
    .line 92
    move-result-object v0

    .line 93
    check-cast v0, Landroid/widget/LinearLayout$LayoutParams;

    .line 94
    .line 95
    iget-object v2, p0, Ll/ynh;->Q0:Lv/VText;

    .line 96
    .line 97
    invoke-virtual {v2, v1, v1, v1, v1}, Landroid/view/View;->setPadding(IIII)V

    .line 98
    .line 99
    .line 100
    const/high16 v1, 0x40c00000    # 6.0f

    .line 101
    .line 102
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 103
    .line 104
    .line 105
    move-result v1

    .line 106
    iput v1, v0, Landroid/widget/LinearLayout$LayoutParams;->leftMargin:I

    .line 107
    .line 108
    iget-object v1, p0, Ll/ynh;->Q0:Lv/VText;

    .line 109
    .line 110
    invoke-virtual {v1, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 111
    .line 112
    .line 113
    iget-object p0, p0, Ll/ynh;->Q0:Lv/VText;

    .line 114
    .line 115
    const/high16 v0, 0x41500000    # 13.0f

    .line 116
    .line 117
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setTextSize(F)V

    .line 118
    .line 119
    .line 120
    return-void
.end method

.method public final D0()V
    .locals 4

    .line 1
    invoke-static {}, Ll/cmg;->o()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    iget-object v0, p0, Ll/ynh;->V0:Landroid/widget/LinearLayout;

    .line 9
    .line 10
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 11
    .line 12
    .line 13
    :cond_0
    iget-object v0, p0, Ll/ynh;->R0:Lv/VLinear;

    .line 14
    .line 15
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0}, Ll/ynh;->C0()V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p0}, Ll/ynh;->E0()V

    .line 22
    .line 23
    .line 24
    invoke-static {}, Ll/j4h;->h()Z

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    if-eqz v0, :cond_2

    .line 29
    .line 30
    iget-object v0, p0, Ll/ynh;->P0:Lv/VImage;

    .line 31
    .line 32
    sget v2, Ll/lbc0;->v3:I

    .line 33
    .line 34
    invoke-virtual {v0, v2}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 35
    .line 36
    .line 37
    iget-object v0, p0, Ll/ynh;->S0:Lv/VImage;

    .line 38
    .line 39
    invoke-virtual {p0}, Ll/yqg;->A()Lcom/p1/mobile/android/app/Act;

    .line 40
    .line 41
    .line 42
    move-result-object v2

    .line 43
    sget v3, Lcom/p1/mobile/putong/feed/R$string;->n5:I

    .line 44
    .line 45
    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object v2

    .line 49
    iget-object v3, p0, Ll/ynh;->T0:Lv/VText;

    .line 50
    .line 51
    invoke-virtual {v3}, Landroidx/appcompat/widget/AppCompatTextView;->getText()Ljava/lang/CharSequence;

    .line 52
    .line 53
    .line 54
    move-result-object v3

    .line 55
    invoke-static {v2, v3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 56
    .line 57
    .line 58
    move-result v2

    .line 59
    if-eqz v2, :cond_1

    .line 60
    .line 61
    sget v2, Ll/lbc0;->m4:I

    .line 62
    .line 63
    goto :goto_0

    .line 64
    :cond_1
    sget v2, Ll/lbc0;->j4:I

    .line 65
    .line 66
    :goto_0
    invoke-virtual {v0, v2}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 67
    .line 68
    .line 69
    :cond_2
    invoke-static {}, Ll/cmg;->o()Z

    .line 70
    .line 71
    .line 72
    move-result v0

    .line 73
    if-eqz v0, :cond_3

    .line 74
    .line 75
    iget-object v0, p0, Ll/ynh;->O0:Lv/VLinear;

    .line 76
    .line 77
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 78
    .line 79
    .line 80
    iget-object v0, p0, Ll/ynh;->R0:Lv/VLinear;

    .line 81
    .line 82
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 83
    .line 84
    .line 85
    iget-object v0, p0, Ll/ynh;->U0:Landroid/view/View;

    .line 86
    .line 87
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 88
    .line 89
    .line 90
    iget-object v0, p0, Ll/ynh;->R:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 91
    .line 92
    const/high16 v1, 0x41c00000    # 24.0f

    .line 93
    .line 94
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 95
    .line 96
    .line 97
    move-result v1

    .line 98
    invoke-static {v0, v1}, Ll/bnl0;->U(Landroid/view/View;I)V

    .line 99
    .line 100
    .line 101
    :cond_3
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->H()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 102
    .line 103
    .line 104
    move-result-object v0

    .line 105
    invoke-interface {v0}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->a()Ll/tq8;

    .line 106
    .line 107
    .line 108
    move-result-object v0

    .line 109
    invoke-interface {v0}, Ll/tq8;->I5()Z

    .line 110
    .line 111
    .line 112
    invoke-static {}, Ll/j4h;->h()Z

    .line 113
    .line 114
    .line 115
    move-result v0

    .line 116
    if-eqz v0, :cond_4

    .line 117
    .line 118
    new-instance v0, Landroidx/constraintlayout/widget/ConstraintLayout$a;

    .line 119
    .line 120
    const/high16 v1, -0x40000000    # -2.0f

    .line 121
    .line 122
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 123
    .line 124
    .line 125
    move-result v1

    .line 126
    const/4 v2, -0x1

    .line 127
    invoke-direct {v0, v1, v2}, Landroidx/constraintlayout/widget/ConstraintLayout$a;-><init>(II)V

    .line 128
    .line 129
    .line 130
    iget-object v1, p0, Ll/ynh;->R:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 131
    .line 132
    invoke-virtual {v1}, Landroid/view/View;->getId()I

    .line 133
    .line 134
    .line 135
    move-result v1

    .line 136
    iput v1, v0, Landroidx/constraintlayout/widget/ConstraintLayout$a;->g:I

    .line 137
    .line 138
    iget-object v1, p0, Ll/ynh;->L0:Lv/VLinear;

    .line 139
    .line 140
    invoke-virtual {v1}, Landroid/view/View;->getId()I

    .line 141
    .line 142
    .line 143
    move-result v1

    .line 144
    iput v1, v0, Landroidx/constraintlayout/widget/ConstraintLayout$a;->h:I

    .line 145
    .line 146
    const/high16 v1, 0x41400000    # 12.0f

    .line 147
    .line 148
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 149
    .line 150
    .line 151
    move-result v1

    .line 152
    iput v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    .line 153
    .line 154
    iget-object v1, p0, Ll/ynh;->R0:Lv/VLinear;

    .line 155
    .line 156
    invoke-virtual {v1, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 157
    .line 158
    .line 159
    iget-object p0, p0, Ll/ynh;->R0:Lv/VLinear;

    .line 160
    .line 161
    const/16 v0, 0x10

    .line 162
    .line 163
    invoke-virtual {p0, v0}, Landroid/widget/LinearLayout;->setGravity(I)V

    .line 164
    .line 165
    .line 166
    return-void

    .line 167
    :cond_4
    iget-object v0, p0, Ll/ynh;->R0:Lv/VLinear;

    .line 168
    .line 169
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 170
    .line 171
    .line 172
    move-result-object v0

    .line 173
    iget v1, v0, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 174
    .line 175
    sget v2, Ll/qa00;->J:I

    .line 176
    .line 177
    if-eq v1, v2, :cond_5

    .line 178
    .line 179
    iput v2, v0, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 180
    .line 181
    iget-object p0, p0, Ll/ynh;->R0:Lv/VLinear;

    .line 182
    .line 183
    invoke-virtual {p0, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 184
    .line 185
    .line 186
    :cond_5
    return-void
.end method

.method public E0()V
    .locals 3

    .line 1
    new-instance v0, Landroidx/constraintlayout/widget/ConstraintLayout$a;

    .line 2
    .line 3
    const/high16 v1, 0x42980000    # 76.0f

    .line 4
    .line 5
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    const/4 v2, -0x1

    .line 10
    invoke-direct {v0, v1, v2}, Landroidx/constraintlayout/widget/ConstraintLayout$a;-><init>(II)V

    .line 11
    .line 12
    .line 13
    invoke-static {}, Ll/cmg;->o()Z

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    if-eqz v1, :cond_0

    .line 18
    .line 19
    const/4 v1, -0x2

    .line 20
    iput v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->width:I

    .line 21
    .line 22
    :cond_0
    const/high16 v1, 0x41800000    # 16.0f

    .line 23
    .line 24
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 25
    .line 26
    .line 27
    move-result v1

    .line 28
    iput v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    .line 29
    .line 30
    iget-object v1, p0, Ll/ynh;->O0:Lv/VLinear;

    .line 31
    .line 32
    invoke-virtual {v1}, Landroid/view/View;->getId()I

    .line 33
    .line 34
    .line 35
    move-result v1

    .line 36
    iput v1, v0, Landroidx/constraintlayout/widget/ConstraintLayout$a;->f:I

    .line 37
    .line 38
    iget-object v1, p0, Ll/ynh;->U0:Landroid/view/View;

    .line 39
    .line 40
    invoke-virtual {v1}, Landroid/view/View;->getId()I

    .line 41
    .line 42
    .line 43
    move-result v1

    .line 44
    iput v1, v0, Landroidx/constraintlayout/widget/ConstraintLayout$a;->j:I

    .line 45
    .line 46
    iget-object v1, p0, Ll/ynh;->L0:Lv/VLinear;

    .line 47
    .line 48
    invoke-virtual {v1, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 49
    .line 50
    .line 51
    iget-object v0, p0, Ll/ynh;->L0:Lv/VLinear;

    .line 52
    .line 53
    const/4 v1, 0x0

    .line 54
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 55
    .line 56
    .line 57
    iget-object v0, p0, Ll/ynh;->M0:Lv/VImage;

    .line 58
    .line 59
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    check-cast v0, Landroid/widget/LinearLayout$LayoutParams;

    .line 64
    .line 65
    const/high16 v1, 0x41c00000    # 24.0f

    .line 66
    .line 67
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 68
    .line 69
    .line 70
    move-result v2

    .line 71
    iput v2, v0, Landroid/widget/LinearLayout$LayoutParams;->width:I

    .line 72
    .line 73
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 74
    .line 75
    .line 76
    move-result v1

    .line 77
    iput v1, v0, Landroid/widget/LinearLayout$LayoutParams;->height:I

    .line 78
    .line 79
    const/4 v1, 0x0

    .line 80
    invoke-virtual {v0, v1, v1, v1, v1}, Landroid/view/ViewGroup$MarginLayoutParams;->setMargins(IIII)V

    .line 81
    .line 82
    .line 83
    iget-object v2, p0, Ll/ynh;->M0:Lv/VImage;

    .line 84
    .line 85
    invoke-virtual {v2, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 86
    .line 87
    .line 88
    iget-object v0, p0, Ll/ynh;->N0:Lv/VText;

    .line 89
    .line 90
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 91
    .line 92
    .line 93
    move-result-object v0

    .line 94
    check-cast v0, Landroid/widget/LinearLayout$LayoutParams;

    .line 95
    .line 96
    iget-object v2, p0, Ll/ynh;->N0:Lv/VText;

    .line 97
    .line 98
    invoke-virtual {v2, v1, v1, v1, v1}, Landroid/view/View;->setPadding(IIII)V

    .line 99
    .line 100
    .line 101
    const/high16 v1, 0x40c00000    # 6.0f

    .line 102
    .line 103
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 104
    .line 105
    .line 106
    move-result v1

    .line 107
    iput v1, v0, Landroid/widget/LinearLayout$LayoutParams;->leftMargin:I

    .line 108
    .line 109
    invoke-static {}, Ll/cmg;->o()Z

    .line 110
    .line 111
    .line 112
    move-result v1

    .line 113
    if-eqz v1, :cond_1

    .line 114
    .line 115
    const/high16 v1, 0x40400000    # 3.0f

    .line 116
    .line 117
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 118
    .line 119
    .line 120
    move-result v1

    .line 121
    iput v1, v0, Landroid/widget/LinearLayout$LayoutParams;->leftMargin:I

    .line 122
    .line 123
    const/high16 v1, 0x41400000    # 12.0f

    .line 124
    .line 125
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 126
    .line 127
    .line 128
    move-result v1

    .line 129
    iput v1, v0, Landroid/widget/LinearLayout$LayoutParams;->rightMargin:I

    .line 130
    .line 131
    :cond_1
    iget-object v1, p0, Ll/ynh;->N0:Lv/VText;

    .line 132
    .line 133
    invoke-virtual {v1, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 134
    .line 135
    .line 136
    iget-object p0, p0, Ll/ynh;->N0:Lv/VText;

    .line 137
    .line 138
    const/high16 v0, 0x41500000    # 13.0f

    .line 139
    .line 140
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setTextSize(F)V

    .line 141
    .line 142
    .line 143
    return-void
.end method

.method public F0()V
    .locals 8

    .line 1
    iget-boolean v0, p0, Ll/ynh;->c1:Z

    .line 2
    .line 3
    iget-object v1, p0, Ll/ynh;->R:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 4
    .line 5
    const/4 v2, 0x1

    .line 6
    const/4 v3, 0x0

    .line 7
    const/4 v4, 0x2

    .line 8
    const/high16 v5, 0x40800000    # 4.0f

    .line 9
    .line 10
    const/high16 v6, 0x42500000    # 52.0f

    .line 11
    .line 12
    const/4 v7, 0x0

    .line 13
    if-eqz v0, :cond_1

    .line 14
    .line 15
    invoke-virtual {v1}, Landroid/view/View;->getHeight()I

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    iget-object v1, p0, Ll/ynh;->V0:Landroid/widget/LinearLayout;

    .line 20
    .line 21
    invoke-virtual {v1}, Landroid/view/View;->getHeight()I

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    add-int/2addr v0, v1

    .line 26
    invoke-static {}, Ll/cmg;->o()Z

    .line 27
    .line 28
    .line 29
    move-result v1

    .line 30
    if-eqz v1, :cond_0

    .line 31
    .line 32
    invoke-static {v6}, Ll/qa00;->d(F)I

    .line 33
    .line 34
    .line 35
    move-result v1

    .line 36
    goto :goto_0

    .line 37
    :cond_0
    invoke-static {v5}, Ll/qa00;->d(F)I

    .line 38
    .line 39
    .line 40
    move-result v1

    .line 41
    :goto_0
    add-int/2addr v0, v1

    .line 42
    int-to-float v0, v0

    .line 43
    new-array v1, v4, [F

    .line 44
    .line 45
    aput v7, v1, v3

    .line 46
    .line 47
    aput v0, v1, v2

    .line 48
    .line 49
    invoke-static {v1}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    goto :goto_2

    .line 54
    :cond_1
    invoke-virtual {v1}, Landroid/view/View;->getHeight()I

    .line 55
    .line 56
    .line 57
    move-result v0

    .line 58
    iget-object v1, p0, Ll/ynh;->V0:Landroid/widget/LinearLayout;

    .line 59
    .line 60
    invoke-virtual {v1}, Landroid/view/View;->getHeight()I

    .line 61
    .line 62
    .line 63
    move-result v1

    .line 64
    add-int/2addr v0, v1

    .line 65
    invoke-static {}, Ll/cmg;->o()Z

    .line 66
    .line 67
    .line 68
    move-result v1

    .line 69
    if-eqz v1, :cond_2

    .line 70
    .line 71
    invoke-static {v6}, Ll/qa00;->d(F)I

    .line 72
    .line 73
    .line 74
    move-result v1

    .line 75
    goto :goto_1

    .line 76
    :cond_2
    invoke-static {v5}, Ll/qa00;->d(F)I

    .line 77
    .line 78
    .line 79
    move-result v1

    .line 80
    :goto_1
    add-int/2addr v0, v1

    .line 81
    int-to-float v0, v0

    .line 82
    new-array v1, v4, [F

    .line 83
    .line 84
    aput v0, v1, v3

    .line 85
    .line 86
    aput v7, v1, v2

    .line 87
    .line 88
    invoke-static {v1}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    .line 89
    .line 90
    .line 91
    move-result-object v0

    .line 92
    :goto_2
    new-instance v1, Ll/ynh$a;

    .line 93
    .line 94
    invoke-direct {v1, p0}, Ll/ynh$a;-><init>(Ll/ynh;)V

    .line 95
    .line 96
    .line 97
    invoke-virtual {v0, v1}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 98
    .line 99
    .line 100
    new-instance v1, Ll/xnh;

    .line 101
    .line 102
    invoke-direct {v1, p0}, Ll/xnh;-><init>(Ll/ynh;)V

    .line 103
    .line 104
    .line 105
    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 106
    .line 107
    .line 108
    const-wide/16 v1, 0x12c

    .line 109
    .line 110
    invoke-virtual {v0, v1, v2}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 111
    .line 112
    .line 113
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->start()V

    .line 114
    .line 115
    .line 116
    return-void
.end method

.method public final G0()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/yqg;->A:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 2
    .line 3
    invoke-static {v0}, Ll/at0;->d(Lcom/p1/mobile/putong/feed/data/Moment;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/ynh;->G0:Lv/VText;

    .line 10
    .line 11
    const/16 v0, 0x8

    .line 12
    .line 13
    invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method public H()Landroid/view/View;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/yqg;->C:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const/4 v1, 0x0

    .line 8
    invoke-virtual {p0, v0, v1}, Ll/ynh;->A0(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {p0}, Ll/ynh;->D0()V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0}, Ll/ynh;->B0()V

    .line 16
    .line 17
    .line 18
    return-object v0
.end method

.method public final H0()V
    .locals 2

    .line 1
    invoke-static {}, Ll/j4h;->a()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    iget-object v0, p0, Ll/yqg;->B:Lcom/p1/mobile/putong/data/User;

    .line 9
    .line 10
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-eqz v0, :cond_1

    .line 15
    .line 16
    invoke-virtual {p0}, Ll/yqg;->A()Lcom/p1/mobile/android/app/Act;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    iget-object v1, p0, Ll/yqg;->B:Lcom/p1/mobile/putong/data/User;

    .line 21
    .line 22
    iget-object v1, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 23
    .line 24
    invoke-static {v1}, Ll/kyi;->b(Ljava/lang/String;)Lrx/c;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    new-instance v1, Ll/tnh;

    .line 33
    .line 34
    invoke-direct {v1, p0}, Ll/tnh;-><init>(Ll/ynh;)V

    .line 35
    .line 36
    .line 37
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 42
    .line 43
    .line 44
    :cond_1
    :goto_0
    return-void
.end method

.method public final synthetic I0(Landroid/animation/ValueAnimator;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    check-cast p1, Ljava/lang/Float;

    .line 6
    .line 7
    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    iget-object v0, p0, Ll/ynh;->L:Landroid/widget/LinearLayout;

    .line 12
    .line 13
    neg-float v1, p1

    .line 14
    invoke-virtual {v0, v1}, Landroid/view/View;->setTranslationY(F)V

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Ll/ynh;->K:Landroid/view/View;

    .line 18
    .line 19
    invoke-virtual {v0, v1}, Landroid/view/View;->setTranslationY(F)V

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Ll/ynh;->R:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 23
    .line 24
    invoke-virtual {v0, p1}, Landroid/view/View;->setTranslationY(F)V

    .line 25
    .line 26
    .line 27
    iget-object v0, p0, Ll/ynh;->Q:Landroid/view/View;

    .line 28
    .line 29
    invoke-virtual {v0, p1}, Landroid/view/View;->setTranslationY(F)V

    .line 30
    .line 31
    .line 32
    iget-object p0, p0, Ll/ynh;->V0:Landroid/widget/LinearLayout;

    .line 33
    .line 34
    invoke-virtual {p0, p1}, Landroid/view/View;->setTranslationY(F)V

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method public final synthetic J0(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/yqg;->r0()V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x1

    .line 5
    invoke-virtual {p0, p1}, Ll/yqg;->s0(Z)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic K0(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p1, p0, Ll/yqg;->H:Ll/ogh;

    .line 2
    .line 3
    iget-object p0, p0, Ll/yqg;->A:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 4
    .line 5
    invoke-virtual {p1, p0}, Ll/ogh;->A(Lcom/p1/mobile/putong/feed/data/Moment;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic L0()V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 2
    .line 3
    iget-object v1, p0, Ll/yqg;->B:Lcom/p1/mobile/putong/data/User;

    .line 4
    .line 5
    iget-object v1, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Ll/jka;->e8(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iput-object v0, p0, Ll/yqg;->B:Lcom/p1/mobile/putong/data/User;

    .line 12
    .line 13
    iget-object v0, p0, Ll/yqg;->A:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 14
    .line 15
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_1

    .line 20
    .line 21
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->H()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    iget-object v1, p0, Ll/yqg;->B:Lcom/p1/mobile/putong/data/User;

    .line 26
    .line 27
    iget-object v1, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 28
    .line 29
    invoke-interface {v0, v1}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->Zj(Ljava/lang/String;)Lcom/p1/mobile/putong/data/ConversationStatus;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    invoke-static {v0}, Ll/ksg;->U(Lcom/p1/mobile/putong/data/ConversationStatus;)Z

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    if-eqz v0, :cond_0

    .line 38
    .line 39
    iget-object v0, p0, Ll/yqg;->A:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 40
    .line 41
    invoke-static {v0}, Ll/at0;->d(Lcom/p1/mobile/putong/feed/data/Moment;)Z

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    if-nez v0, :cond_0

    .line 46
    .line 47
    const/4 v0, 0x1

    .line 48
    goto :goto_0

    .line 49
    :cond_0
    const/4 v0, 0x0

    .line 50
    :goto_0
    iput-boolean v0, p0, Ll/ynh;->g1:Z

    .line 51
    .line 52
    :cond_1
    invoke-virtual {p0}, Ll/ynh;->D0()V

    .line 53
    .line 54
    .line 55
    return-void
.end method

.method public final synthetic M0(Ljava/lang/Boolean;)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/yqg;->A()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    new-instance v0, Ll/unh;

    .line 6
    .line 7
    invoke-direct {v0, p0}, Ll/unh;-><init>(Ll/ynh;)V

    .line 8
    .line 9
    .line 10
    const-wide/16 v1, 0x3e8

    .line 11
    .line 12
    invoke-static {p1, v0, v1, v2}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public N()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ynh;->O0:Lv/VLinear;

    .line 2
    .line 3
    new-instance v1, Ll/vnh;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/vnh;-><init>(Ll/ynh;)V

    .line 6
    .line 7
    .line 8
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Ll/ynh;->L0:Lv/VLinear;

    .line 12
    .line 13
    new-instance v1, Ll/wnh;

    .line 14
    .line 15
    invoke-direct {v1, p0}, Ll/wnh;-><init>(Ll/ynh;)V

    .line 16
    .line 17
    .line 18
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public final N0()V
    .locals 1

    .line 1
    iget-boolean v0, p0, Ll/ynh;->c1:Z

    .line 2
    .line 3
    xor-int/lit8 v0, v0, 0x1

    .line 4
    .line 5
    iput-boolean v0, p0, Ll/ynh;->c1:Z

    .line 6
    .line 7
    iget-object v0, p0, Ll/ynh;->L:Landroid/widget/LinearLayout;

    .line 8
    .line 9
    invoke-virtual {v0}, Landroid/view/View;->getTranslationY()F

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    iput v0, p0, Ll/ynh;->d1:F

    .line 14
    .line 15
    iget-object v0, p0, Ll/ynh;->R:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 16
    .line 17
    invoke-virtual {v0}, Landroid/view/View;->getTranslationY()F

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    iput v0, p0, Ll/ynh;->e1:F

    .line 22
    .line 23
    iget-object v0, p0, Ll/ynh;->K:Landroid/view/View;

    .line 24
    .line 25
    invoke-virtual {v0}, Landroid/view/View;->getTranslationY()F

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    iput v0, p0, Ll/ynh;->f1:F

    .line 30
    .line 31
    return-void
.end method

.method public P(Lcom/p1/mobile/putong/feed/data/Moment;)V
    .locals 5

    .line 1
    invoke-super {p0, p1}, Ll/yqg;->P(Lcom/p1/mobile/putong/feed/data/Moment;)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/yqg;->H:Ll/ogh;

    .line 5
    .line 6
    iget v0, v0, Ll/ogh;->f:I

    .line 7
    .line 8
    invoke-virtual {p0, v0}, Ll/ynh;->f0(I)V

    .line 9
    .line 10
    .line 11
    iget-wide v0, p1, Lcom/p1/mobile/putong/feed/data/Moment;->createdTime:D

    .line 12
    .line 13
    invoke-static {v0, v1}, Ll/p6i;->q(D)Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-static {}, Ll/cmg;->C()Z

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    if-eqz v1, :cond_1

    .line 22
    .line 23
    iget-object v1, p0, Ll/yqg;->H:Ll/ogh;

    .line 24
    .line 25
    iget-object v1, v1, Ll/ogh;->l:Ljava/lang/String;

    .line 26
    .line 27
    invoke-static {v1}, Ll/ksg;->a0(Ljava/lang/String;)Z

    .line 28
    .line 29
    .line 30
    move-result v1

    .line 31
    if-eqz v1, :cond_1

    .line 32
    .line 33
    sget-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 34
    .line 35
    iget-object v1, p1, Lcom/p1/mobile/putong/feed/data/Moment;->owner:Ljava/lang/String;

    .line 36
    .line 37
    invoke-virtual {v0, v1}, Ll/jka;->e8(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    iget-wide v1, p1, Lcom/p1/mobile/putong/feed/data/Moment;->createdTime:D

    .line 42
    .line 43
    double-to-long v1, v1

    .line 44
    if-nez v0, :cond_0

    .line 45
    .line 46
    const-wide/16 v3, 0x0

    .line 47
    .line 48
    goto :goto_0

    .line 49
    :cond_0
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->getLastActiveTimeMillis()J

    .line 50
    .line 51
    .line 52
    move-result-wide v3

    .line 53
    :goto_0
    invoke-static {v1, v2, v3, v4}, Ll/ksg;->H(JJ)Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    :cond_1
    iget-object p1, p0, Ll/ynh;->E0:Lv/VText;

    .line 58
    .line 59
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 60
    .line 61
    .line 62
    iget-object p1, p0, Ll/ynh;->E0:Lv/VText;

    .line 63
    .line 64
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 65
    .line 66
    .line 67
    move-result v0

    .line 68
    xor-int/lit8 v0, v0, 0x1

    .line 69
    .line 70
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 71
    .line 72
    .line 73
    iget-object p1, p0, Ll/ynh;->p0:Lv/VText;

    .line 74
    .line 75
    const/16 v0, 0x8

    .line 76
    .line 77
    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 78
    .line 79
    .line 80
    iget-object p0, p0, Ll/ynh;->k0:Landroid/widget/ImageView;

    .line 81
    .line 82
    invoke-virtual {p0, v0}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 83
    .line 84
    .line 85
    return-void
.end method

.method public Q(Lcom/p1/mobile/putong/data/User;)V
    .locals 3

    .line 1
    invoke-super {p0, p1}, Ll/yqg;->Q(Lcom/p1/mobile/putong/data/User;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/yqg;->A()Lcom/p1/mobile/android/app/Act;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    sget v1, Ll/tec0;->i3:I

    .line 9
    .line 10
    const/4 v2, 0x0

    .line 11
    invoke-static {v0, v1, v2}, Landroid/view/View;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    check-cast v0, Lcom/p1/mobile/putong/feed/newui/view/FeedUserSexAndAgeView;

    .line 16
    .line 17
    const/4 v1, 0x4

    .line 18
    const/4 v2, 0x6

    .line 19
    invoke-virtual {v0, p1, v1, v2}, Lcom/p1/mobile/putong/feed/newui/view/FeedUserSexAndAgeView;->d(Lcom/p1/mobile/putong/data/User;II)V

    .line 20
    .line 21
    .line 22
    iget-object v1, p0, Ll/ynh;->X:Lv/VLinear;

    .line 23
    .line 24
    invoke-virtual {v1}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 25
    .line 26
    .line 27
    iget-object v1, p0, Ll/ynh;->X:Lv/VLinear;

    .line 28
    .line 29
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 30
    .line 31
    .line 32
    iget-object v0, p0, Ll/ynh;->X:Lv/VLinear;

    .line 33
    .line 34
    const/4 v1, 0x1

    .line 35
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 36
    .line 37
    .line 38
    invoke-static {}, Ll/nrb0;->b()Z

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    if-eqz v0, :cond_0

    .line 43
    .line 44
    sget-object v0, Ll/uqb0;->b0:Ll/sre0;

    .line 45
    .line 46
    iget-object v0, v0, Ll/sre0;->b:Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 47
    .line 48
    invoke-virtual {p0}, Ll/yqg;->A()Lcom/p1/mobile/android/app/Act;

    .line 49
    .line 50
    .line 51
    move-result-object v1

    .line 52
    iget-object p0, p0, Ll/ynh;->W:Lv/VImage;

    .line 53
    .line 54
    invoke-interface {v0, v1, p1, p0}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->showUserVerificationLogo(Landroid/content/Context;Lcom/p1/mobile/putong/data/User;Lv/VImage;)V

    .line 55
    .line 56
    .line 57
    :cond_0
    return-void
.end method

.method public f(Landroidx/viewpager/widget/ViewPager;II)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3}, Ll/yqg;->f(Landroidx/viewpager/widget/ViewPager;II)V

    .line 2
    .line 3
    .line 4
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    invoke-virtual {p1, p0}, Landroid/view/View;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    instance-of p1, p0, Lcom/p1/mobile/putong/feed/ui/FeedPhotoPreviewView;

    .line 13
    .line 14
    if-eqz p1, :cond_0

    .line 15
    .line 16
    check-cast p0, Lcom/p1/mobile/putong/feed/ui/FeedPhotoPreviewView;

    .line 17
    .line 18
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/ui/FeedPhotoPreviewView;->reset()V

    .line 19
    .line 20
    .line 21
    :cond_0
    return-void
.end method

.method public f0(I)V
    .locals 3

    .line 1
    invoke-super {p0, p1}, Ll/yqg;->f0(I)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/yqg;->H:Ll/ogh;

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    iput p1, v0, Ll/ogh;->f:I

    .line 9
    .line 10
    :cond_0
    iget-object v0, p0, Ll/ynh;->N:Lv/VText;

    .line 11
    .line 12
    add-int/lit8 v1, p1, 0x1

    .line 13
    .line 14
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    iget-object v2, p0, Ll/yqg;->D:Ljava/util/List;

    .line 19
    .line 20
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 21
    .line 22
    .line 23
    move-result v2

    .line 24
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 25
    .line 26
    .line 27
    move-result-object v2

    .line 28
    filled-new-array {v1, v2}, [Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    const-string v2, "%d/%d"

    .line 33
    .line 34
    invoke-static {v2, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 39
    .line 40
    .line 41
    iput p1, p0, Ll/yqg;->I:I

    .line 42
    .line 43
    return-void
.end method

.method public g()V
    .locals 1

    .line 1
    iget-boolean v0, p0, Ll/yqg;->y:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Ll/yqg;->C:Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->hideInput()V

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    invoke-virtual {p0}, Ll/ynh;->F0()V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public g0(Lcom/p1/mobile/putong/data/User;)V
    .locals 9

    .line 1
    iput-object p1, p0, Ll/yqg;->B:Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    iget-object v0, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 4
    .line 5
    sget-object v1, Ll/uqb0;->b0:Ll/sre0;

    .line 6
    .line 7
    iget-object v1, v1, Ll/sre0;->a:Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 8
    .line 9
    invoke-interface {v1}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    const/16 v1, 0x8

    .line 18
    .line 19
    const/high16 v2, 0x41600000    # 14.0f

    .line 20
    .line 21
    const/high16 v3, 0x42080000    # 34.0f

    .line 22
    .line 23
    const/4 v4, 0x3

    .line 24
    const-string v5, "matched"

    .line 25
    .line 26
    const/4 v6, 0x1

    .line 27
    const-string v7, "#ffffff"

    .line 28
    .line 29
    const/4 v8, 0x0

    .line 30
    if-nez v0, :cond_c

    .line 31
    .line 32
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->localRelationship:Lcom/p1/mobile/putong/data/Relationship;

    .line 33
    .line 34
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 35
    .line 36
    .line 37
    move-result v0

    .line 38
    if-eqz v0, :cond_0

    .line 39
    .line 40
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->localRelationship:Lcom/p1/mobile/putong/data/Relationship;

    .line 41
    .line 42
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Relationship;->state:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 43
    .line 44
    invoke-static {v0, v5}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 45
    .line 46
    .line 47
    move-result v0

    .line 48
    if-eqz v0, :cond_0

    .line 49
    .line 50
    goto/16 :goto_5

    .line 51
    .line 52
    :cond_0
    iget-object v0, p0, Ll/ynh;->G0:Lv/VText;

    .line 53
    .line 54
    invoke-virtual {v0, v8}, Landroid/view/View;->setSelected(Z)V

    .line 55
    .line 56
    .line 57
    invoke-static {}, Ll/cmg;->o()Z

    .line 58
    .line 59
    .line 60
    move-result v0

    .line 61
    if-eqz v0, :cond_2

    .line 62
    .line 63
    iget-object p1, p0, Ll/ynh;->G0:Lv/VText;

    .line 64
    .line 65
    invoke-virtual {p1, v8}, Landroid/view/View;->setVisibility(I)V

    .line 66
    .line 67
    .line 68
    iget-object p1, p0, Ll/ynh;->G0:Lv/VText;

    .line 69
    .line 70
    invoke-static {v7}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 71
    .line 72
    .line 73
    move-result v0

    .line 74
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 75
    .line 76
    .line 77
    iget-object p1, p0, Ll/ynh;->G0:Lv/VText;

    .line 78
    .line 79
    const-string v0, "\u6253\u62db\u547c"

    .line 80
    .line 81
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 82
    .line 83
    .line 84
    iget-object p1, p0, Ll/ynh;->G0:Lv/VText;

    .line 85
    .line 86
    invoke-static {v4}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 87
    .line 88
    .line 89
    move-result-object v0

    .line 90
    invoke-virtual {p1, v0, v6}, Landroidx/appcompat/widget/AppCompatTextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 91
    .line 92
    .line 93
    iget-object p1, p0, Ll/ynh;->G0:Lv/VText;

    .line 94
    .line 95
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 96
    .line 97
    .line 98
    move-result v0

    .line 99
    invoke-static {p1, v0}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 100
    .line 101
    .line 102
    iget-object p1, p0, Ll/ynh;->G0:Lv/VText;

    .line 103
    .line 104
    invoke-virtual {p1, v2}, Landroid/widget/TextView;->setTextSize(F)V

    .line 105
    .line 106
    .line 107
    iget-object p1, p0, Ll/ynh;->G0:Lv/VText;

    .line 108
    .line 109
    invoke-static {}, Ll/j4h;->h()Z

    .line 110
    .line 111
    .line 112
    move-result v0

    .line 113
    if-eqz v0, :cond_1

    .line 114
    .line 115
    sget v0, Ll/lbc0;->o4:I

    .line 116
    .line 117
    goto :goto_0

    .line 118
    :cond_1
    sget v0, Ll/lbc0;->n4:I

    .line 119
    .line 120
    :goto_0
    invoke-virtual {p1, v0}, Landroidx/appcompat/widget/AppCompatTextView;->setBackgroundResource(I)V

    .line 121
    .line 122
    .line 123
    invoke-static {}, Ll/er60;->w()Ll/er60;

    .line 124
    .line 125
    .line 126
    move-result-object p1

    .line 127
    iget-object v0, p0, Ll/yqg;->A:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 128
    .line 129
    const-string v1, "p_moment_preview"

    .line 130
    .line 131
    invoke-virtual {p1, v0, v1, v6, v8}, Ll/er60;->t(Lcom/p1/mobile/putong/feed/data/Moment;Ljava/lang/String;ZZ)V

    .line 132
    .line 133
    .line 134
    goto/16 :goto_7

    .line 135
    .line 136
    :cond_2
    invoke-static {}, Ll/cmg;->K()Z

    .line 137
    .line 138
    .line 139
    move-result v0

    .line 140
    if-eqz v0, :cond_6

    .line 141
    .line 142
    invoke-static {p1}, Ll/hyh;->i(Lcom/p1/mobile/putong/data/User;)Z

    .line 143
    .line 144
    .line 145
    move-result p1

    .line 146
    if-nez p1, :cond_5

    .line 147
    .line 148
    invoke-static {}, Ll/cmg;->q()Z

    .line 149
    .line 150
    .line 151
    move-result p1

    .line 152
    if-eqz p1, :cond_3

    .line 153
    .line 154
    goto :goto_2

    .line 155
    :cond_3
    iget-object p1, p0, Ll/ynh;->G0:Lv/VText;

    .line 156
    .line 157
    invoke-virtual {p1, v8}, Landroid/view/View;->setVisibility(I)V

    .line 158
    .line 159
    .line 160
    iget-object p1, p0, Ll/ynh;->G0:Lv/VText;

    .line 161
    .line 162
    invoke-static {v7}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 163
    .line 164
    .line 165
    move-result v0

    .line 166
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 167
    .line 168
    .line 169
    iget-object p1, p0, Ll/ynh;->G0:Lv/VText;

    .line 170
    .line 171
    const-string v0, "\u559c\u6b22"

    .line 172
    .line 173
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 174
    .line 175
    .line 176
    iget-object p1, p0, Ll/ynh;->G0:Lv/VText;

    .line 177
    .line 178
    invoke-static {v4}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 179
    .line 180
    .line 181
    move-result-object v0

    .line 182
    invoke-virtual {p1, v0, v6}, Landroidx/appcompat/widget/AppCompatTextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 183
    .line 184
    .line 185
    iget-object p1, p0, Ll/ynh;->G0:Lv/VText;

    .line 186
    .line 187
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 188
    .line 189
    .line 190
    move-result v0

    .line 191
    invoke-static {p1, v0}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 192
    .line 193
    .line 194
    iget-object p1, p0, Ll/ynh;->G0:Lv/VText;

    .line 195
    .line 196
    invoke-virtual {p1, v2}, Landroid/widget/TextView;->setTextSize(F)V

    .line 197
    .line 198
    .line 199
    iget-object p1, p0, Ll/ynh;->G0:Lv/VText;

    .line 200
    .line 201
    invoke-static {}, Ll/j4h;->h()Z

    .line 202
    .line 203
    .line 204
    move-result v0

    .line 205
    if-eqz v0, :cond_4

    .line 206
    .line 207
    sget v0, Ll/lbc0;->o4:I

    .line 208
    .line 209
    goto :goto_1

    .line 210
    :cond_4
    sget v0, Ll/lbc0;->n4:I

    .line 211
    .line 212
    :goto_1
    invoke-virtual {p1, v0}, Landroidx/appcompat/widget/AppCompatTextView;->setBackgroundResource(I)V

    .line 213
    .line 214
    .line 215
    iget-object p1, p0, Ll/yqg;->H:Ll/ogh;

    .line 216
    .line 217
    invoke-virtual {p1}, Ll/ogh;->X()V

    .line 218
    .line 219
    .line 220
    goto/16 :goto_7

    .line 221
    .line 222
    :cond_5
    :goto_2
    iget-object p1, p0, Ll/ynh;->G0:Lv/VText;

    .line 223
    .line 224
    invoke-virtual {p1, v1}, Landroid/view/View;->setVisibility(I)V

    .line 225
    .line 226
    .line 227
    goto/16 :goto_7

    .line 228
    .line 229
    :cond_6
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->localFollowship:Lcom/p1/mobile/putong/data/Followship;

    .line 230
    .line 231
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 232
    .line 233
    .line 234
    move-result v0

    .line 235
    if-eqz v0, :cond_a

    .line 236
    .line 237
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->localFollowship:Lcom/p1/mobile/putong/data/Followship;

    .line 238
    .line 239
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Followship;->state:Lcom/p1/mobile/putong/data/FollowshipStatus;

    .line 240
    .line 241
    const-string v0, "following"

    .line 242
    .line 243
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 244
    .line 245
    .line 246
    move-result v0

    .line 247
    if-eqz v0, :cond_7

    .line 248
    .line 249
    iget-object p1, p0, Ll/ynh;->G0:Lv/VText;

    .line 250
    .line 251
    invoke-virtual {p1, v8}, Landroid/view/View;->setVisibility(I)V

    .line 252
    .line 253
    .line 254
    iget-object p1, p0, Ll/ynh;->G0:Lv/VText;

    .line 255
    .line 256
    invoke-static {v7}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 257
    .line 258
    .line 259
    move-result v0

    .line 260
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 261
    .line 262
    .line 263
    iget-object p1, p0, Ll/ynh;->G0:Lv/VText;

    .line 264
    .line 265
    iget-object v0, p0, Ll/yqg;->C:Lcom/p1/mobile/android/app/Act;

    .line 266
    .line 267
    invoke-virtual {v0}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 268
    .line 269
    .line 270
    move-result-object v0

    .line 271
    sget v1, Ll/lbc0;->u3:I

    .line 272
    .line 273
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 274
    .line 275
    .line 276
    move-result-object v0

    .line 277
    invoke-virtual {p1, v0}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 278
    .line 279
    .line 280
    iget-object p1, p0, Ll/ynh;->G0:Lv/VText;

    .line 281
    .line 282
    sget v0, Lcom/p1/mobile/putong/feed/R$string;->P2:I

    .line 283
    .line 284
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(I)V

    .line 285
    .line 286
    .line 287
    iget-object p1, p0, Ll/ynh;->G0:Lv/VText;

    .line 288
    .line 289
    invoke-virtual {p1, v6}, Landroid/view/View;->setSelected(Z)V

    .line 290
    .line 291
    .line 292
    goto/16 :goto_7

    .line 293
    .line 294
    :cond_7
    invoke-static {p1, v5}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 295
    .line 296
    .line 297
    move-result p1

    .line 298
    iget-object v0, p0, Ll/ynh;->G0:Lv/VText;

    .line 299
    .line 300
    if-eqz p1, :cond_8

    .line 301
    .line 302
    invoke-virtual {v0, v8}, Landroid/view/View;->setVisibility(I)V

    .line 303
    .line 304
    .line 305
    iget-object p1, p0, Ll/ynh;->G0:Lv/VText;

    .line 306
    .line 307
    sget v0, Lcom/p1/mobile/putong/feed/R$string;->N2:I

    .line 308
    .line 309
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(I)V

    .line 310
    .line 311
    .line 312
    iget-object p1, p0, Ll/ynh;->G0:Lv/VText;

    .line 313
    .line 314
    invoke-static {v7}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 315
    .line 316
    .line 317
    move-result v0

    .line 318
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 319
    .line 320
    .line 321
    iget-object p1, p0, Ll/ynh;->G0:Lv/VText;

    .line 322
    .line 323
    iget-object v0, p0, Ll/yqg;->C:Lcom/p1/mobile/android/app/Act;

    .line 324
    .line 325
    invoke-virtual {v0}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 326
    .line 327
    .line 328
    move-result-object v0

    .line 329
    sget v1, Ll/lbc0;->u3:I

    .line 330
    .line 331
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 332
    .line 333
    .line 334
    move-result-object v0

    .line 335
    invoke-virtual {p1, v0}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 336
    .line 337
    .line 338
    iget-object p1, p0, Ll/ynh;->G0:Lv/VText;

    .line 339
    .line 340
    invoke-virtual {p1, v6}, Landroid/view/View;->setSelected(Z)V

    .line 341
    .line 342
    .line 343
    goto/16 :goto_7

    .line 344
    .line 345
    :cond_8
    invoke-virtual {v0, v8}, Landroid/view/View;->setVisibility(I)V

    .line 346
    .line 347
    .line 348
    iget-object p1, p0, Ll/ynh;->G0:Lv/VText;

    .line 349
    .line 350
    invoke-static {v7}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 351
    .line 352
    .line 353
    move-result v0

    .line 354
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 355
    .line 356
    .line 357
    iget-object p1, p0, Ll/ynh;->G0:Lv/VText;

    .line 358
    .line 359
    sget v0, Lcom/p1/mobile/putong/feed/R$string;->R2:I

    .line 360
    .line 361
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(I)V

    .line 362
    .line 363
    .line 364
    iget-object p1, p0, Ll/ynh;->G0:Lv/VText;

    .line 365
    .line 366
    invoke-static {}, Ll/j4h;->h()Z

    .line 367
    .line 368
    .line 369
    move-result v0

    .line 370
    if-eqz v0, :cond_9

    .line 371
    .line 372
    sget v0, Ll/lbc0;->o4:I

    .line 373
    .line 374
    goto :goto_3

    .line 375
    :cond_9
    sget v0, Ll/lbc0;->n4:I

    .line 376
    .line 377
    :goto_3
    invoke-virtual {p1, v0}, Landroidx/appcompat/widget/AppCompatTextView;->setBackgroundResource(I)V

    .line 378
    .line 379
    .line 380
    iget-object p1, p0, Ll/yqg;->H:Ll/ogh;

    .line 381
    .line 382
    invoke-virtual {p1}, Ll/ogh;->X()V

    .line 383
    .line 384
    .line 385
    goto/16 :goto_7

    .line 386
    .line 387
    :cond_a
    iget-object p1, p0, Ll/ynh;->G0:Lv/VText;

    .line 388
    .line 389
    invoke-virtual {p1, v8}, Landroid/view/View;->setVisibility(I)V

    .line 390
    .line 391
    .line 392
    iget-object p1, p0, Ll/ynh;->G0:Lv/VText;

    .line 393
    .line 394
    invoke-static {v7}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 395
    .line 396
    .line 397
    move-result v0

    .line 398
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 399
    .line 400
    .line 401
    iget-object p1, p0, Ll/ynh;->G0:Lv/VText;

    .line 402
    .line 403
    sget v0, Lcom/p1/mobile/putong/feed/R$string;->R2:I

    .line 404
    .line 405
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(I)V

    .line 406
    .line 407
    .line 408
    iget-object p1, p0, Ll/ynh;->G0:Lv/VText;

    .line 409
    .line 410
    invoke-static {}, Ll/j4h;->h()Z

    .line 411
    .line 412
    .line 413
    move-result v0

    .line 414
    if-eqz v0, :cond_b

    .line 415
    .line 416
    sget v0, Ll/lbc0;->o4:I

    .line 417
    .line 418
    goto :goto_4

    .line 419
    :cond_b
    sget v0, Ll/lbc0;->n4:I

    .line 420
    .line 421
    :goto_4
    invoke-virtual {p1, v0}, Landroidx/appcompat/widget/AppCompatTextView;->setBackgroundResource(I)V

    .line 422
    .line 423
    .line 424
    iget-object p1, p0, Ll/yqg;->H:Ll/ogh;

    .line 425
    .line 426
    invoke-virtual {p1}, Ll/ogh;->X()V

    .line 427
    .line 428
    .line 429
    goto :goto_7

    .line 430
    :cond_c
    :goto_5
    invoke-static {}, Ll/cmg;->o()Z

    .line 431
    .line 432
    .line 433
    move-result v0

    .line 434
    if-eqz v0, :cond_e

    .line 435
    .line 436
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->localRelationship:Lcom/p1/mobile/putong/data/Relationship;

    .line 437
    .line 438
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 439
    .line 440
    .line 441
    move-result v0

    .line 442
    if-eqz v0, :cond_e

    .line 443
    .line 444
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->localRelationship:Lcom/p1/mobile/putong/data/Relationship;

    .line 445
    .line 446
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Relationship;->state:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 447
    .line 448
    invoke-static {p1, v5}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 449
    .line 450
    .line 451
    move-result p1

    .line 452
    if-eqz p1, :cond_e

    .line 453
    .line 454
    iget-object p1, p0, Ll/ynh;->G0:Lv/VText;

    .line 455
    .line 456
    invoke-virtual {p1, v8}, Landroid/view/View;->setVisibility(I)V

    .line 457
    .line 458
    .line 459
    iget-object p1, p0, Ll/ynh;->G0:Lv/VText;

    .line 460
    .line 461
    invoke-static {v7}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 462
    .line 463
    .line 464
    move-result v0

    .line 465
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 466
    .line 467
    .line 468
    iget-object p1, p0, Ll/ynh;->G0:Lv/VText;

    .line 469
    .line 470
    invoke-static {v4}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 471
    .line 472
    .line 473
    move-result-object v0

    .line 474
    invoke-virtual {p1, v0, v6}, Landroidx/appcompat/widget/AppCompatTextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 475
    .line 476
    .line 477
    iget-object p1, p0, Ll/ynh;->G0:Lv/VText;

    .line 478
    .line 479
    const-string v0, "\u804a\u5929"

    .line 480
    .line 481
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 482
    .line 483
    .line 484
    iget-object p1, p0, Ll/ynh;->G0:Lv/VText;

    .line 485
    .line 486
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 487
    .line 488
    .line 489
    move-result v0

    .line 490
    invoke-static {p1, v0}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 491
    .line 492
    .line 493
    iget-object p1, p0, Ll/ynh;->G0:Lv/VText;

    .line 494
    .line 495
    invoke-virtual {p1, v2}, Landroid/widget/TextView;->setTextSize(F)V

    .line 496
    .line 497
    .line 498
    iget-object p1, p0, Ll/ynh;->G0:Lv/VText;

    .line 499
    .line 500
    invoke-static {}, Ll/j4h;->h()Z

    .line 501
    .line 502
    .line 503
    move-result v0

    .line 504
    if-eqz v0, :cond_d

    .line 505
    .line 506
    sget v0, Ll/lbc0;->o4:I

    .line 507
    .line 508
    goto :goto_6

    .line 509
    :cond_d
    sget v0, Ll/lbc0;->n4:I

    .line 510
    .line 511
    :goto_6
    invoke-virtual {p1, v0}, Landroidx/appcompat/widget/AppCompatTextView;->setBackgroundResource(I)V

    .line 512
    .line 513
    .line 514
    goto :goto_7

    .line 515
    :cond_e
    iget-object p1, p0, Ll/ynh;->G0:Lv/VText;

    .line 516
    .line 517
    invoke-virtual {p1, v1}, Landroid/view/View;->setVisibility(I)V

    .line 518
    .line 519
    .line 520
    :goto_7
    invoke-virtual {p0}, Ll/ynh;->G0()V

    .line 521
    .line 522
    .line 523
    return-void
.end method

.method public i0(Lcom/p1/mobile/putong/feed/data/Moment;)V
    .locals 3

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    goto/16 :goto_4

    .line 4
    .line 5
    :cond_0
    iput-object p1, p0, Ll/yqg;->A:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 6
    .line 7
    iget-boolean v0, p1, Lcom/p1/mobile/putong/feed/data/Moment;->haveLiked:Z

    .line 8
    .line 9
    iget-object v1, p0, Ll/yqg;->i:Lv/VText;

    .line 10
    .line 11
    if-nez v0, :cond_2

    .line 12
    .line 13
    invoke-virtual {p0}, Ll/yqg;->A()Lcom/p1/mobile/android/app/Act;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {v0}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    sget v2, Ll/k9c0;->p0:I

    .line 22
    .line 23
    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getColor(I)I

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 28
    .line 29
    .line 30
    iget-object v0, p0, Ll/yqg;->h:Lv/VImage;

    .line 31
    .line 32
    invoke-static {}, Ll/j4h;->h()Z

    .line 33
    .line 34
    .line 35
    move-result v1

    .line 36
    if-eqz v1, :cond_1

    .line 37
    .line 38
    sget v1, Ll/lbc0;->z3:I

    .line 39
    .line 40
    goto :goto_0

    .line 41
    :cond_1
    sget v1, Ll/lbc0;->A3:I

    .line 42
    .line 43
    :goto_0
    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 44
    .line 45
    .line 46
    goto :goto_3

    .line 47
    :cond_2
    invoke-virtual {p0}, Ll/yqg;->A()Lcom/p1/mobile/android/app/Act;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    invoke-virtual {v0}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    invoke-static {}, Ll/j4h;->h()Z

    .line 56
    .line 57
    .line 58
    move-result v2

    .line 59
    if-eqz v2, :cond_3

    .line 60
    .line 61
    sget v2, Ll/k9c0;->i:I

    .line 62
    .line 63
    goto :goto_1

    .line 64
    :cond_3
    sget v2, Ll/k9c0;->n:I

    .line 65
    .line 66
    :goto_1
    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getColor(I)I

    .line 67
    .line 68
    .line 69
    move-result v0

    .line 70
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 71
    .line 72
    .line 73
    iget-object v0, p0, Ll/yqg;->h:Lv/VImage;

    .line 74
    .line 75
    invoke-static {}, Ll/j4h;->h()Z

    .line 76
    .line 77
    .line 78
    move-result v1

    .line 79
    if-eqz v1, :cond_4

    .line 80
    .line 81
    sget v1, Ll/lbc0;->x3:I

    .line 82
    .line 83
    goto :goto_2

    .line 84
    :cond_4
    sget v1, Ll/lbc0;->y3:I

    .line 85
    .line 86
    :goto_2
    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 87
    .line 88
    .line 89
    :goto_3
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/Moment;->likes:Lcom/p1/mobile/putong/data/PartialIdList;

    .line 90
    .line 91
    iget v0, p1, Lcom/p1/mobile/putong/data/PartialIdList;->count:I

    .line 92
    .line 93
    iget-object p1, p1, Lcom/p1/mobile/putong/data/PartialIdList;->ids:Ljava/util/List;

    .line 94
    .line 95
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 96
    .line 97
    .line 98
    move-result p1

    .line 99
    invoke-static {v0, p1}, Ljava/lang/Math;->max(II)I

    .line 100
    .line 101
    .line 102
    move-result p1

    .line 103
    if-lez p1, :cond_5

    .line 104
    .line 105
    iget-object p0, p0, Ll/yqg;->i:Lv/VText;

    .line 106
    .line 107
    invoke-static {p1}, Ll/q8g0;->h0(I)Ljava/lang/String;

    .line 108
    .line 109
    .line 110
    move-result-object p1

    .line 111
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 112
    .line 113
    .line 114
    return-void

    .line 115
    :cond_5
    if-nez p1, :cond_6

    .line 116
    .line 117
    iget-object p0, p0, Ll/yqg;->i:Lv/VText;

    .line 118
    .line 119
    sget p1, Lcom/p1/mobile/putong/feed/R$string;->k:I

    .line 120
    .line 121
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(I)V

    .line 122
    .line 123
    .line 124
    :cond_6
    :goto_4
    return-void
.end method

.method public l0(Lcom/p1/mobile/putong/feed/data/RawFeed;)V
    .locals 1

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-boolean p1, p1, Lcom/p1/mobile/putong/feed/data/RawFeed;->canGreeting:Z

    .line 8
    .line 9
    iput-boolean p1, p0, Ll/ynh;->h1:Z

    .line 10
    .line 11
    :cond_0
    invoke-virtual {p0}, Ll/ynh;->D0()V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public m(Lcom/p1/mobile/putong/feed/data/Moment;Lcom/p1/mobile/putong/feed/data/RawFeed;Lcom/p1/mobile/putong/data/Music;)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3}, Ll/yqg;->m(Lcom/p1/mobile/putong/feed/data/Moment;Lcom/p1/mobile/putong/feed/data/RawFeed;Lcom/p1/mobile/putong/data/Music;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p1, p2}, Ll/ynh;->n0(Lcom/p1/mobile/putong/feed/data/Moment;Lcom/p1/mobile/putong/feed/data/RawFeed;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public m0()V
    .locals 7

    .line 1
    iget-object v0, p0, Ll/ynh;->K0:Lcom/p1/mobile/putong/feed/newui/photoalbum/feedbottom/insert/FeedInteractiveView;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/yqg;->A()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    iget-object v2, p0, Ll/yqg;->A:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 8
    .line 9
    const/4 v5, 0x1

    .line 10
    const/4 v6, 0x0

    .line 11
    const-string v3, ""

    .line 12
    .line 13
    const-string v4, "p_moment_preview"

    .line 14
    .line 15
    invoke-virtual/range {v0 .. v6}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedbottom/insert/FeedInteractiveView;->P(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/feed/data/Moment;Ljava/lang/String;Ljava/lang/String;ZI)Landroid/view/View;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    iget-object v1, p0, Ll/ynh;->J0:Lcom/p1/mobile/putong/newui/view/InnerClickSpanTextView;

    .line 20
    .line 21
    if-nez v0, :cond_0

    .line 22
    .line 23
    sget v0, Ll/qa00;->m:I

    .line 24
    .line 25
    invoke-static {v1, v0}, Ll/bnl0;->U(Landroid/view/View;I)V

    .line 26
    .line 27
    .line 28
    iget-object p0, p0, Ll/ynh;->K0:Lcom/p1/mobile/putong/feed/newui/photoalbum/feedbottom/insert/FeedInteractiveView;

    .line 29
    .line 30
    const/4 v0, 0x0

    .line 31
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 32
    .line 33
    .line 34
    return-void

    .line 35
    :cond_0
    const/high16 v0, 0x41100000    # 9.0f

    .line 36
    .line 37
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    invoke-static {v1, v0}, Ll/bnl0;->U(Landroid/view/View;I)V

    .line 42
    .line 43
    .line 44
    iget-object p0, p0, Ll/ynh;->K0:Lcom/p1/mobile/putong/feed/newui/photoalbum/feedbottom/insert/FeedInteractiveView;

    .line 45
    .line 46
    const/4 v0, 0x1

    .line 47
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 48
    .line 49
    .line 50
    return-void
.end method

.method public n0(Lcom/p1/mobile/putong/feed/data/Moment;Lcom/p1/mobile/putong/feed/data/RawFeed;)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2}, Ll/yqg;->n0(Lcom/p1/mobile/putong/feed/data/Moment;Lcom/p1/mobile/putong/feed/data/RawFeed;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

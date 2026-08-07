.class public Ll/dy80;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/wx80;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Lv/VLinear;

.field public b:Lv/navigationbar/VNavigationBar;

.field public c:Lv/VProgressBar;

.field public d:Lv/VScroll;

.field public e:Lcom/p1/mobile/putong/core/ui/VText_Medium;

.field public f:Lv/VListCell;

.field public g:Lcom/p1/mobile/putong/core/ui/settings/filter/newui/FilterSwitchCell;

.field public h:Landroid/widget/FrameLayout;

.field public i:Landroid/widget/TextView;

.field public j:Lv/VSlider;

.field public k:Lcom/p1/mobile/putong/core/ui/VText_Medium;

.field public l:Lv/VLinear;

.field public m:Lcom/p1/mobile/android/app/Act;

.field public n:Lcom/p1/mobile/putong/data/Settings;

.field public o:Landroid/animation/ValueAnimator;

.field public p:Landroid/animation/ValueAnimator;

.field public q:Ll/wx80;

.field public r:I

.field public s:Z

.field public t:Ljava/lang/Runnable;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Ll/dy80;->s:Z

    .line 6
    .line 7
    new-instance v0, Ll/ay80;

    .line 8
    .line 9
    invoke-direct {v0, p0}, Ll/ay80;-><init>(Ll/dy80;)V

    .line 10
    .line 11
    .line 12
    iput-object v0, p0, Ll/dy80;->t:Ljava/lang/Runnable;

    .line 13
    .line 14
    iput-object p1, p0, Ll/dy80;->m:Lcom/p1/mobile/android/app/Act;

    .line 15
    .line 16
    return-void
.end method

.method public static synthetic a(Ll/dy80;F)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/dy80;->w(F)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic b(Ll/dy80;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/dy80;->s(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic c(Ll/dy80;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/dy80;->v(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic d(Ll/dy80;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/dy80;->q(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic e(Ll/dy80;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/dy80;->u()V

    return-void
.end method

.method public static bridge synthetic f(Ll/dy80;I)V
    .locals 0

    .line 1
    iput p1, p0, Ll/dy80;->r:I

    return-void
.end method

.method private k()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/dy80;->o:Landroid/animation/ValueAnimator;

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
    iget-object v0, p0, Ll/dy80;->o:Landroid/animation/ValueAnimator;

    .line 10
    .line 11
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->isRunning()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    iget-object v0, p0, Ll/dy80;->o:Landroid/animation/ValueAnimator;

    .line 18
    .line 19
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->cancel()V

    .line 20
    .line 21
    .line 22
    :cond_0
    iget-object v0, p0, Ll/dy80;->p:Landroid/animation/ValueAnimator;

    .line 23
    .line 24
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    if-eqz v0, :cond_1

    .line 29
    .line 30
    iget-object v0, p0, Ll/dy80;->p:Landroid/animation/ValueAnimator;

    .line 31
    .line 32
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->isRunning()Z

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    if-eqz v0, :cond_1

    .line 37
    .line 38
    iget-object p0, p0, Ll/dy80;->p:Landroid/animation/ValueAnimator;

    .line 39
    .line 40
    invoke-virtual {p0}, Landroid/animation/ValueAnimator;->cancel()V

    .line 41
    .line 42
    .line 43
    :cond_1
    return-void
.end method

.method private synthetic q(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/dy80;->m:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroidx/activity/ComponentActivity;->onBackPressed()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private r()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/dy80;->b:Lv/navigationbar/VNavigationBar;

    .line 2
    .line 3
    const-string v1, "\u9690\u79c1\u7ba1\u7406"

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Lv/navigationbar/VNavigationBar;->setTitle(Ljava/lang/CharSequence;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ll/dy80;->b:Lv/navigationbar/VNavigationBar;

    .line 9
    .line 10
    new-instance v1, Ll/yx80;

    .line 11
    .line 12
    invoke-direct {v1, p0}, Ll/yx80;-><init>(Ll/dy80;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {v0, v1}, Lv/navigationbar/VNavigationBar;->setLeftIconOnClick(Landroid/view/View$OnClickListener;)V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Ll/dy80;->q:Ll/wx80;

    .line 19
    .line 20
    iget-object v0, v0, Ll/wx80;->e:Ll/mv80;

    .line 21
    .line 22
    iget-object v1, p0, Ll/dy80;->l:Lv/VLinear;

    .line 23
    .line 24
    invoke-virtual {v0, v1}, Ll/mv80;->v(Landroid/view/View;)V

    .line 25
    .line 26
    .line 27
    iget-object v0, p0, Ll/dy80;->q:Ll/wx80;

    .line 28
    .line 29
    iget-object v0, v0, Ll/wx80;->e:Ll/mv80;

    .line 30
    .line 31
    iget-object v1, p0, Ll/dy80;->m:Lcom/p1/mobile/android/app/Act;

    .line 32
    .line 33
    invoke-virtual {v1}, Lcom/p1/mobile/android/app/Act;->pageId()Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    invoke-virtual {v0, v1}, Ll/mf40;->E(Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    iget-object v0, p0, Ll/dy80;->m:Lcom/p1/mobile/android/app/Act;

    .line 41
    .line 42
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->o:Ll/gta;

    .line 43
    .line 44
    invoke-virtual {v1}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 45
    .line 46
    .line 47
    move-result-object v1

    .line 48
    invoke-interface {v1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->J9()I

    .line 49
    .line 50
    .line 51
    move-result v1

    .line 52
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->drawable(I)Landroid/graphics/drawable/Drawable;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    const/high16 v1, 0x421c0000    # 39.0f

    .line 57
    .line 58
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 59
    .line 60
    .line 61
    move-result v1

    .line 62
    const/high16 v2, 0x41600000    # 14.0f

    .line 63
    .line 64
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 65
    .line 66
    .line 67
    move-result v2

    .line 68
    const/4 v3, 0x0

    .line 69
    invoke-virtual {v0, v3, v3, v1, v2}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 70
    .line 71
    .line 72
    iget-object v1, p0, Ll/dy80;->k:Lcom/p1/mobile/putong/core/ui/VText_Medium;

    .line 73
    .line 74
    const/4 v2, 0x0

    .line 75
    invoke-virtual {v1, v2, v2, v0, v2}, Landroidx/appcompat/widget/AppCompatTextView;->setCompoundDrawables(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 76
    .line 77
    .line 78
    iget-object v0, p0, Ll/dy80;->k:Lcom/p1/mobile/putong/core/ui/VText_Medium;

    .line 79
    .line 80
    sget v1, Ll/qa00;->e:I

    .line 81
    .line 82
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setCompoundDrawablePadding(I)V

    .line 83
    .line 84
    .line 85
    iget-object v0, p0, Ll/dy80;->g:Lcom/p1/mobile/putong/core/ui/settings/filter/newui/FilterSwitchCell;

    .line 86
    .line 87
    new-instance v1, Ll/zx80;

    .line 88
    .line 89
    invoke-direct {v1, p0}, Ll/zx80;-><init>(Ll/dy80;)V

    .line 90
    .line 91
    .line 92
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 93
    .line 94
    .line 95
    return-void
.end method

.method private synthetic s(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/dy80;->g:Lcom/p1/mobile/putong/core/ui/settings/filter/newui/FilterSwitchCell;

    .line 2
    .line 3
    invoke-static {p0}, Ll/bsj0;->T(Landroid/view/ViewGroup;)Z

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private synthetic v(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p1, p0, Ll/dy80;->q:Ll/wx80;

    .line 2
    .line 3
    iget-object p0, p0, Ll/dy80;->f:Lv/VListCell;

    .line 4
    .line 5
    invoke-static {p0}, Ll/bsj0;->u(Landroid/view/ViewGroup;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    invoke-virtual {p1, p0}, Ll/wx80;->z0(Z)V

    .line 10
    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public A(Lcom/p1/mobile/putong/data/Settings;)V
    .locals 5

    .line 1
    iput-object p1, p0, Ll/dy80;->n:Lcom/p1/mobile/putong/data/Settings;

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/Settings;->getSearchInvisibleRadius()Ljava/lang/Integer;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    const/4 v1, 0x0

    .line 12
    const/4 v2, 0x1

    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    move v0, v2

    .line 16
    goto :goto_0

    .line 17
    :cond_0
    move v0, v1

    .line 18
    :goto_0
    iget-object v3, p0, Ll/dy80;->f:Lv/VListCell;

    .line 19
    .line 20
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/Settings;->hideContacts()Ljava/lang/Boolean;

    .line 21
    .line 22
    .line 23
    move-result-object v4

    .line 24
    invoke-virtual {v4}, Ljava/lang/Boolean;->booleanValue()Z

    .line 25
    .line 26
    .line 27
    move-result v4

    .line 28
    invoke-static {v3, v4}, Ll/bsj0;->t(Landroid/view/ViewGroup;Z)Z

    .line 29
    .line 30
    .line 31
    iget-object v3, p0, Ll/dy80;->f:Lv/VListCell;

    .line 32
    .line 33
    new-instance v4, Ll/by80;

    .line 34
    .line 35
    invoke-direct {v4, p0}, Ll/by80;-><init>(Ll/dy80;)V

    .line 36
    .line 37
    .line 38
    invoke-virtual {v3, v4}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 39
    .line 40
    .line 41
    invoke-static {}, Ll/s7a;->m()Z

    .line 42
    .line 43
    .line 44
    move-result v3

    .line 45
    iget-object v4, p0, Ll/dy80;->g:Lcom/p1/mobile/putong/core/ui/settings/filter/newui/FilterSwitchCell;

    .line 46
    .line 47
    if-eqz v3, :cond_1

    .line 48
    .line 49
    invoke-static {v4, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 50
    .line 51
    .line 52
    iget-object v0, p0, Ll/dy80;->j:Lv/VSlider;

    .line 53
    .line 54
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 55
    .line 56
    .line 57
    iget-object p0, p0, Ll/dy80;->q:Ll/wx80;

    .line 58
    .line 59
    iget-object p0, p0, Ll/wx80;->e:Ll/mv80;

    .line 60
    .line 61
    invoke-virtual {p0, p1}, Ll/mf40;->u(Lcom/p1/mobile/putong/data/Settings;)V

    .line 62
    .line 63
    .line 64
    return-void

    .line 65
    :cond_1
    invoke-static {v4, v2}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 66
    .line 67
    .line 68
    iget-object v1, p0, Ll/dy80;->j:Lv/VSlider;

    .line 69
    .line 70
    invoke-static {v1, v2}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 71
    .line 72
    .line 73
    iget-object v1, p0, Ll/dy80;->j:Lv/VSlider;

    .line 74
    .line 75
    const/high16 v2, 0x41700000    # 15.0f

    .line 76
    .line 77
    invoke-virtual {v1, v2}, Lv/VSlider;->setValueTo(F)V

    .line 78
    .line 79
    .line 80
    iget-object v1, p0, Ll/dy80;->j:Lv/VSlider;

    .line 81
    .line 82
    const/4 v2, 0x0

    .line 83
    invoke-virtual {v1, v2}, Lv/VSlider;->setValueFrom(F)V

    .line 84
    .line 85
    .line 86
    iget-object v1, p0, Ll/dy80;->j:Lv/VSlider;

    .line 87
    .line 88
    new-instance v2, Ll/cy80;

    .line 89
    .line 90
    invoke-direct {v2, p0}, Ll/cy80;-><init>(Ll/dy80;)V

    .line 91
    .line 92
    .line 93
    invoke-virtual {v1, v2}, Lv/VSlider;->setLabelFormatter(Ll/ozk0;)V

    .line 94
    .line 95
    .line 96
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/Settings;->getSearchInvisibleRadius()Ljava/lang/Integer;

    .line 97
    .line 98
    .line 99
    move-result-object p1

    .line 100
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 101
    .line 102
    .line 103
    move-result p1

    .line 104
    div-int/lit16 p1, p1, 0xc8

    .line 105
    .line 106
    iput p1, p0, Ll/dy80;->r:I

    .line 107
    .line 108
    iget-object v1, p0, Ll/dy80;->j:Lv/VSlider;

    .line 109
    .line 110
    int-to-float p1, p1

    .line 111
    invoke-virtual {v1, p1}, Lv/VSlider;->setValue(F)V

    .line 112
    .line 113
    .line 114
    iget-object p1, p0, Ll/dy80;->j:Lv/VSlider;

    .line 115
    .line 116
    new-instance v1, Ll/dy80$a;

    .line 117
    .line 118
    invoke-direct {v1, p0}, Ll/dy80$a;-><init>(Ll/dy80;)V

    .line 119
    .line 120
    .line 121
    invoke-virtual {p1, v1}, Lv/VSlider;->f(Ll/cp50;)V

    .line 122
    .line 123
    .line 124
    iget-object p1, p0, Ll/dy80;->h:Landroid/widget/FrameLayout;

    .line 125
    .line 126
    xor-int/lit8 v1, v0, 0x1

    .line 127
    .line 128
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 129
    .line 130
    .line 131
    iget-object p1, p0, Ll/dy80;->g:Lcom/p1/mobile/putong/core/ui/settings/filter/newui/FilterSwitchCell;

    .line 132
    .line 133
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/FilterSwitchCell;->getSwitchButton()Lv/VSwitchButton;

    .line 134
    .line 135
    .line 136
    move-result-object p1

    .line 137
    xor-int/lit8 v1, v0, 0x1

    .line 138
    .line 139
    invoke-virtual {p1, v1}, Lv/VSwitchButton;->setChecked(Z)V

    .line 140
    .line 141
    .line 142
    iget-object p1, p0, Ll/dy80;->g:Lcom/p1/mobile/putong/core/ui/settings/filter/newui/FilterSwitchCell;

    .line 143
    .line 144
    new-instance v1, Ll/dy80$b;

    .line 145
    .line 146
    invoke-direct {v1, p0}, Ll/dy80$b;-><init>(Ll/dy80;)V

    .line 147
    .line 148
    .line 149
    invoke-virtual {p1, v1}, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/FilterSwitchCell;->d(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 150
    .line 151
    .line 152
    if-nez v0, :cond_2

    .line 153
    .line 154
    iget-object p0, p0, Ll/dy80;->t:Ljava/lang/Runnable;

    .line 155
    .line 156
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    .line 157
    .line 158
    .line 159
    :cond_2
    return-void
.end method

.method public B()V
    .locals 4

    .line 1
    invoke-direct {p0}, Ll/dy80;->k()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x2

    .line 5
    new-array v0, v0, [F

    .line 6
    .line 7
    fill-array-data v0, :array_0

    .line 8
    .line 9
    .line 10
    invoke-static {v0}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    iput-object v0, p0, Ll/dy80;->o:Landroid/animation/ValueAnimator;

    .line 15
    .line 16
    const/high16 v0, 0x429a0000    # 77.0f

    .line 17
    .line 18
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    iget-object v1, p0, Ll/dy80;->o:Landroid/animation/ValueAnimator;

    .line 23
    .line 24
    const-wide/16 v2, 0x190

    .line 25
    .line 26
    invoke-virtual {v1, v2, v3}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 27
    .line 28
    .line 29
    iget-object v1, p0, Ll/dy80;->o:Landroid/animation/ValueAnimator;

    .line 30
    .line 31
    new-instance v2, Ll/dy80$c;

    .line 32
    .line 33
    invoke-direct {v2, p0, v0}, Ll/dy80$c;-><init>(Ll/dy80;I)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {v1, v2}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 37
    .line 38
    .line 39
    iget-object v1, p0, Ll/dy80;->h:Landroid/widget/FrameLayout;

    .line 40
    .line 41
    invoke-virtual {v1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    check-cast v1, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 46
    .line 47
    neg-int v0, v0

    .line 48
    iput v0, v1, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    .line 49
    .line 50
    iget-object v0, p0, Ll/dy80;->h:Landroid/widget/FrameLayout;

    .line 51
    .line 52
    invoke-virtual {v0, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 53
    .line 54
    .line 55
    iget-object v0, p0, Ll/dy80;->h:Landroid/widget/FrameLayout;

    .line 56
    .line 57
    const/4 v1, 0x1

    .line 58
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 59
    .line 60
    .line 61
    iget-object v0, p0, Ll/dy80;->o:Landroid/animation/ValueAnimator;

    .line 62
    .line 63
    new-instance v1, Ll/dy80$d;

    .line 64
    .line 65
    invoke-direct {v1, p0}, Ll/dy80$d;-><init>(Ll/dy80;)V

    .line 66
    .line 67
    .line 68
    invoke-virtual {v0, v1}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 69
    .line 70
    .line 71
    iget-object p0, p0, Ll/dy80;->o:Landroid/animation/ValueAnimator;

    .line 72
    .line 73
    invoke-virtual {p0}, Landroid/animation/ValueAnimator;->start()V

    .line 74
    .line 75
    .line 76
    return-void

    .line 77
    :array_0
    .array-data 4
        0x3f800000    # 1.0f
        0x0
    .end array-data
.end method

.method public C()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/dy80;->f:Lv/VListCell;

    .line 2
    .line 3
    invoke-static {p0}, Ll/bsj0;->T(Landroid/view/ViewGroup;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/dy80;->m:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    return-object p0
.end method

.method public act()Lcom/p1/mobile/android/app/Act;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/dy80;->m:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    return-object p0
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public i(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/fy80;->b(Ll/dy80;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/wx80;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/dy80;->j(Ll/wx80;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/dy80;->i(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-direct {p0}, Ll/dy80;->r()V

    .line 6
    .line 7
    .line 8
    return-object p1
.end method

.method public j(Ll/wx80;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/dy80;->q:Ll/wx80;

    .line 2
    .line 3
    return-void
.end method

.method public l(F)V
    .locals 3

    .line 1
    const/high16 v0, 0x43480000    # 200.0f

    .line 2
    .line 3
    mul-float/2addr p1, v0

    .line 4
    float-to-int p1, p1

    .line 5
    iget-object v0, p0, Ll/dy80;->n:Lcom/p1/mobile/putong/data/Settings;

    .line 6
    .line 7
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Settings;->getSettingGroup()Lcom/p1/mobile/putong/data/SettingGroups;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iget-object v0, v0, Lcom/p1/mobile/putong/data/SettingGroups;->search:Lcom/p1/mobile/putong/data/UserSearchSettings;

    .line 12
    .line 13
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    iput-object v1, v0, Lcom/p1/mobile/putong/data/UserSearchSettings;->invisibleRadius:Ljava/lang/Integer;

    .line 18
    .line 19
    iget-object v0, p0, Ll/dy80;->t:Ljava/lang/Runnable;

    .line 20
    .line 21
    invoke-interface {v0}, Ljava/lang/Runnable;->run()V

    .line 22
    .line 23
    .line 24
    iget-object v0, p0, Ll/dy80;->n:Lcom/p1/mobile/putong/data/Settings;

    .line 25
    .line 26
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Settings;->getSearchRadius()Ljava/lang/Integer;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    if-ge v0, p1, :cond_1

    .line 35
    .line 36
    rem-int/lit16 v0, p1, 0x3e8

    .line 37
    .line 38
    if-nez v0, :cond_0

    .line 39
    .line 40
    goto :goto_0

    .line 41
    :cond_0
    div-int/lit16 p1, p1, 0x3e8

    .line 42
    .line 43
    mul-int/lit16 p1, p1, 0x3e8

    .line 44
    .line 45
    :goto_0
    iget-object v0, p0, Ll/dy80;->n:Lcom/p1/mobile/putong/data/Settings;

    .line 46
    .line 47
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Settings;->getSettingGroup()Lcom/p1/mobile/putong/data/SettingGroups;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    iget-object v0, v0, Lcom/p1/mobile/putong/data/SettingGroups;->search:Lcom/p1/mobile/putong/data/UserSearchSettings;

    .line 52
    .line 53
    iget-object v1, p0, Ll/dy80;->n:Lcom/p1/mobile/putong/data/Settings;

    .line 54
    .line 55
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/Settings;->getRadiusAllowedMinimum()Ljava/lang/Integer;

    .line 56
    .line 57
    .line 58
    move-result-object v1

    .line 59
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 60
    .line 61
    .line 62
    move-result v1

    .line 63
    iget-object v2, p0, Ll/dy80;->n:Lcom/p1/mobile/putong/data/Settings;

    .line 64
    .line 65
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/Settings;->getRadiusAllowedMaximum()Ljava/lang/Integer;

    .line 66
    .line 67
    .line 68
    move-result-object v2

    .line 69
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    .line 70
    .line 71
    .line 72
    move-result v2

    .line 73
    iget-object p0, p0, Ll/dy80;->n:Lcom/p1/mobile/putong/data/Settings;

    .line 74
    .line 75
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/Settings;->getRadiusAllowedMinimum()Ljava/lang/Integer;

    .line 76
    .line 77
    .line 78
    move-result-object p0

    .line 79
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 80
    .line 81
    .line 82
    move-result p0

    .line 83
    sub-int/2addr v2, p0

    .line 84
    const/4 p0, 0x0

    .line 85
    invoke-static {p0, p1}, Ljava/lang/Math;->max(II)I

    .line 86
    .line 87
    .line 88
    move-result p0

    .line 89
    invoke-static {v2, p0}, Ljava/lang/Math;->min(II)I

    .line 90
    .line 91
    .line 92
    move-result p0

    .line 93
    add-int/2addr v1, p0

    .line 94
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 95
    .line 96
    .line 97
    move-result-object p0

    .line 98
    iput-object p0, v0, Lcom/p1/mobile/putong/data/UserSearchSettings;->radius:Ljava/lang/Integer;

    .line 99
    .line 100
    :cond_1
    return-void
.end method

.method public m(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/dy80;->f:Lv/VListCell;

    .line 2
    .line 3
    invoke-static {p0, p1}, Ll/bsj0;->t(Landroid/view/ViewGroup;Z)Z

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public n(I)V
    .locals 1

    .line 1
    new-instance v0, Ll/dy80$g;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Ll/dy80$g;-><init>(Ll/dy80;I)V

    .line 4
    .line 5
    .line 6
    iget-object p1, p0, Ll/dy80;->h:Landroid/widget/FrameLayout;

    .line 7
    .line 8
    invoke-virtual {p1, v0}, Landroid/view/View;->setOutlineProvider(Landroid/view/ViewOutlineProvider;)V

    .line 9
    .line 10
    .line 11
    iget-object p0, p0, Ll/dy80;->h:Landroid/widget/FrameLayout;

    .line 12
    .line 13
    const/4 p1, 0x1

    .line 14
    invoke-virtual {p0, p1}, Landroid/view/View;->setClipToOutline(Z)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public p()V
    .locals 4

    .line 1
    invoke-direct {p0}, Ll/dy80;->k()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x2

    .line 5
    new-array v0, v0, [F

    .line 6
    .line 7
    fill-array-data v0, :array_0

    .line 8
    .line 9
    .line 10
    invoke-static {v0}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    iput-object v0, p0, Ll/dy80;->p:Landroid/animation/ValueAnimator;

    .line 15
    .line 16
    const/high16 v0, 0x42920000    # 73.0f

    .line 17
    .line 18
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    iget-object v1, p0, Ll/dy80;->p:Landroid/animation/ValueAnimator;

    .line 23
    .line 24
    const-wide/16 v2, 0x190

    .line 25
    .line 26
    invoke-virtual {v1, v2, v3}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 27
    .line 28
    .line 29
    iget-object v1, p0, Ll/dy80;->p:Landroid/animation/ValueAnimator;

    .line 30
    .line 31
    new-instance v2, Ll/dy80$e;

    .line 32
    .line 33
    invoke-direct {v2, p0, v0}, Ll/dy80$e;-><init>(Ll/dy80;I)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {v1, v2}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 37
    .line 38
    .line 39
    iget-object v0, p0, Ll/dy80;->h:Landroid/widget/FrameLayout;

    .line 40
    .line 41
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    check-cast v0, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 46
    .line 47
    const/4 v1, 0x0

    .line 48
    iput v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    .line 49
    .line 50
    iget-object v1, p0, Ll/dy80;->h:Landroid/widget/FrameLayout;

    .line 51
    .line 52
    invoke-virtual {v1, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 53
    .line 54
    .line 55
    iget-object v0, p0, Ll/dy80;->p:Landroid/animation/ValueAnimator;

    .line 56
    .line 57
    new-instance v1, Ll/dy80$f;

    .line 58
    .line 59
    invoke-direct {v1, p0}, Ll/dy80$f;-><init>(Ll/dy80;)V

    .line 60
    .line 61
    .line 62
    invoke-virtual {v0, v1}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 63
    .line 64
    .line 65
    iget-object p0, p0, Ll/dy80;->p:Landroid/animation/ValueAnimator;

    .line 66
    .line 67
    invoke-virtual {p0}, Landroid/animation/ValueAnimator;->start()V

    .line 68
    .line 69
    .line 70
    return-void

    .line 71
    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public final synthetic u()V
    .locals 9

    .line 1
    iget-object v0, p0, Ll/dy80;->n:Lcom/p1/mobile/putong/data/Settings;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Settings;->getSearchInvisibleRadius()Ljava/lang/Integer;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    iget-object v1, p0, Ll/dy80;->m:Lcom/p1/mobile/android/app/Act;

    .line 12
    .line 13
    sget v2, Lcom/p1/mobile/putong/core/profile/R$string;->b2:I

    .line 14
    .line 15
    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    iget-object v2, p0, Ll/dy80;->m:Lcom/p1/mobile/android/app/Act;

    .line 20
    .line 21
    sget v3, Lcom/p1/mobile/putong/core/profile/R$string;->e2:I

    .line 22
    .line 23
    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v2

    .line 27
    if-nez v0, :cond_0

    .line 28
    .line 29
    const-string v0, ""

    .line 30
    .line 31
    move-object v1, v0

    .line 32
    goto :goto_1

    .line 33
    :cond_0
    const-string v3, "<"

    .line 34
    .line 35
    const/16 v4, 0x3e8

    .line 36
    .line 37
    if-ge v0, v4, :cond_1

    .line 38
    .line 39
    new-instance v1, Ljava/lang/StringBuilder;

    .line 40
    .line 41
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 42
    .line 43
    .line 44
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 45
    .line 46
    .line 47
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 48
    .line 49
    .line 50
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    invoke-virtual {v3, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object v1

    .line 58
    :goto_0
    move-object v8, v1

    .line 59
    move-object v1, v0

    .line 60
    move-object v0, v8

    .line 61
    goto :goto_1

    .line 62
    :cond_1
    rem-int/lit16 v2, v0, 0x3e8

    .line 63
    .line 64
    if-nez v2, :cond_2

    .line 65
    .line 66
    new-instance v2, Ljava/lang/StringBuilder;

    .line 67
    .line 68
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 69
    .line 70
    .line 71
    div-int/2addr v0, v4

    .line 72
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 73
    .line 74
    .line 75
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 76
    .line 77
    .line 78
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 79
    .line 80
    .line 81
    move-result-object v0

    .line 82
    invoke-virtual {v3, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 83
    .line 84
    .line 85
    move-result-object v1

    .line 86
    goto :goto_0

    .line 87
    :cond_2
    sget-object v2, Ljava/util/Locale;->CHINA:Ljava/util/Locale;

    .line 88
    .line 89
    int-to-double v4, v0

    .line 90
    const-wide v6, 0x408f400000000000L    # 1000.0

    .line 91
    .line 92
    .line 93
    .line 94
    .line 95
    div-double/2addr v4, v6

    .line 96
    invoke-static {v4, v5}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 97
    .line 98
    .line 99
    move-result-object v0

    .line 100
    filled-new-array {v0, v1}, [Ljava/lang/Object;

    .line 101
    .line 102
    .line 103
    move-result-object v0

    .line 104
    const-string v1, "%.1f%s"

    .line 105
    .line 106
    invoke-static {v2, v1, v0}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 107
    .line 108
    .line 109
    move-result-object v0

    .line 110
    invoke-virtual {v3, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 111
    .line 112
    .line 113
    move-result-object v1

    .line 114
    goto :goto_0

    .line 115
    :goto_1
    iget-object v2, p0, Ll/dy80;->i:Landroid/widget/TextView;

    .line 116
    .line 117
    invoke-virtual {v2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 118
    .line 119
    .line 120
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 121
    .line 122
    .line 123
    move-result v0

    .line 124
    iget-object p0, p0, Ll/dy80;->g:Lcom/p1/mobile/putong/core/ui/settings/filter/newui/FilterSwitchCell;

    .line 125
    .line 126
    if-eqz v0, :cond_3

    .line 127
    .line 128
    const-string v0, "\u5f00\u542f\u540e\uff0c\u6307\u5b9a\u8ddd\u79bb\u4ee5\u5185\u7684\u719f\u4eba\u548c\u964c\u751f\u4eba\u90fd\u6ed1\u4e0d\u5230\u4f60"

    .line 129
    .line 130
    invoke-virtual {p0, v0}, Lv/VListCell;->setSubTitle(Ljava/lang/CharSequence;)V

    .line 131
    .line 132
    .line 133
    return-void

    .line 134
    :cond_3
    sget-object v0, Ljava/util/Locale;->CHINA:Ljava/util/Locale;

    .line 135
    .line 136
    const-string v2, "\u5f00\u542f\u540e\uff0c\u79bb\u4f60%s\u4ee5\u5185\u7684\u719f\u4eba\u548c\u964c\u751f\u4eba\u90fd\u6ed1\u4e0d\u5230\u4f60"

    .line 137
    .line 138
    filled-new-array {v1}, [Ljava/lang/Object;

    .line 139
    .line 140
    .line 141
    move-result-object v1

    .line 142
    invoke-static {v0, v2, v1}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 143
    .line 144
    .line 145
    move-result-object v0

    .line 146
    invoke-virtual {p0, v0}, Lv/VListCell;->setSubTitle(Ljava/lang/CharSequence;)V

    .line 147
    .line 148
    .line 149
    return-void
.end method

.method public final synthetic w(F)Ljava/lang/String;
    .locals 5

    .line 1
    const/high16 v0, 0x43480000    # 200.0f

    .line 2
    .line 3
    mul-float/2addr p1, v0

    .line 4
    iget-object v0, p0, Ll/dy80;->m:Lcom/p1/mobile/android/app/Act;

    .line 5
    .line 6
    sget v1, Lcom/p1/mobile/putong/core/profile/R$string;->b2:I

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    iget-object p0, p0, Ll/dy80;->m:Lcom/p1/mobile/android/app/Act;

    .line 13
    .line 14
    sget v1, Lcom/p1/mobile/putong/core/profile/R$string;->e2:I

    .line 15
    .line 16
    invoke-virtual {p0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    const/4 v1, 0x0

    .line 21
    cmpl-float v2, p1, v1

    .line 22
    .line 23
    if-nez v2, :cond_0

    .line 24
    .line 25
    const-string p0, "0"

    .line 26
    .line 27
    return-object p0

    .line 28
    :cond_0
    const/high16 v2, 0x447a0000    # 1000.0f

    .line 29
    .line 30
    cmpg-float v3, p1, v2

    .line 31
    .line 32
    if-gez v3, :cond_1

    .line 33
    .line 34
    new-instance v0, Ljava/lang/StringBuilder;

    .line 35
    .line 36
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 37
    .line 38
    .line 39
    float-to-int p1, p1

    .line 40
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 44
    .line 45
    .line 46
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    return-object p0

    .line 51
    :cond_1
    rem-float p0, p1, v2

    .line 52
    .line 53
    cmpl-float p0, p0, v1

    .line 54
    .line 55
    if-nez p0, :cond_2

    .line 56
    .line 57
    new-instance p0, Ljava/lang/StringBuilder;

    .line 58
    .line 59
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 60
    .line 61
    .line 62
    div-float/2addr p1, v2

    .line 63
    float-to-int p1, p1

    .line 64
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 65
    .line 66
    .line 67
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 68
    .line 69
    .line 70
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 71
    .line 72
    .line 73
    move-result-object p0

    .line 74
    return-object p0

    .line 75
    :cond_2
    new-instance p0, Ljava/lang/StringBuilder;

    .line 76
    .line 77
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 78
    .line 79
    .line 80
    float-to-double v1, p1

    .line 81
    const-wide v3, 0x408f400000000000L    # 1000.0

    .line 82
    .line 83
    .line 84
    .line 85
    .line 86
    div-double/2addr v1, v3

    .line 87
    invoke-static {v1, v2}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 88
    .line 89
    .line 90
    move-result-object p1

    .line 91
    filled-new-array {p1}, [Ljava/lang/Object;

    .line 92
    .line 93
    .line 94
    move-result-object p1

    .line 95
    const-string v1, "%.1f"

    .line 96
    .line 97
    invoke-static {v1, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 98
    .line 99
    .line 100
    move-result-object p1

    .line 101
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 102
    .line 103
    .line 104
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 105
    .line 106
    .line 107
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 108
    .line 109
    .line 110
    move-result-object p0

    .line 111
    return-object p0
.end method

.method public x(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/dy80;->m:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 4
    .line 5
    .line 6
    invoke-static {p1}, Ll/bsj0;->D(Ljava/lang/Throwable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public y()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/dy80;->m:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/dy80;->n:Lcom/p1/mobile/putong/data/Settings;

    .line 7
    .line 8
    invoke-virtual {p0, v0}, Ll/dy80;->A(Lcom/p1/mobile/putong/data/Settings;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public z(Ljava/lang/String;Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/dy80;->m:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/android/app/Act;->progress(Ljava/lang/String;Z)Landroid/app/Dialog;

    .line 4
    .line 5
    .line 6
    return-void
.end method

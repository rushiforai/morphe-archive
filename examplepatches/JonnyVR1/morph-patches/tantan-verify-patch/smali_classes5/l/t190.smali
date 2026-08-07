.class public Ll/t190;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/l3m;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/t190$b;
    }
.end annotation


# instance fields
.field public a:Landroidx/legacy/widget/Space;

.field public b:Landroid/widget/LinearLayout;

.field public c:Landroid/widget/ImageView;

.field public d:Lv/VText;

.field public e:Lv/VText;

.field public f:Landroid/widget/LinearLayout;

.field public g:Lv/VPager;

.field public h:Lv/VPagerCircleIndicator;

.field public i:Lv/VText;

.field public final j:Lcom/p1/mobile/android/app/Act;

.field public final k:Lcom/p1/mobile/putong/core/data/PurchaseType;

.field public l:Z

.field public m:Ll/t190$b;

.field public n:Ll/kcg0;

.field public o:Ll/kcg0;

.field public p:Lcom/p1/mobile/putong/core/ui/purchase/d;

.field public q:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ll/a690;",
            ">;"
        }
    .end annotation
.end field

.field public final r:Z

.field public final s:Z


# direct methods
.method public static synthetic d(Ll/a690;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/a690;->l()Lcom/p1/mobile/putong/core/data/Privilege;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public static synthetic e(Ll/t190;Ljava/lang/Long;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/t190;->q(Ljava/lang/Long;)V

    return-void
.end method

.method public static synthetic f(Ll/t190;Ljava/util/List;Ljava/lang/Long;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/t190;->r(Ljava/util/List;Ljava/lang/Long;)V

    return-void
.end method

.method public static bridge synthetic g(Ll/t190;)Ll/kcg0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/t190;->n:Ll/kcg0;

    return-object p0
.end method

.method public static bridge synthetic h(Ll/t190;Ll/kcg0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/t190;->n:Ll/kcg0;

    return-void
.end method

.method private j(Z)V
    .locals 4

    .line 1
    const/high16 v0, 0x41000000    # 8.0f

    .line 2
    .line 3
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget-boolean v1, p0, Ll/t190;->l:Z

    .line 8
    .line 9
    if-nez v1, :cond_1

    .line 10
    .line 11
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-virtual {v1}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-interface {v1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->h5()Z

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    if-eqz v1, :cond_1

    .line 24
    .line 25
    iget-object v1, p0, Ll/t190;->k:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 26
    .line 27
    invoke-static {v1}, Ll/wib0;->w(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 28
    .line 29
    .line 30
    move-result v1

    .line 31
    if-nez v1, :cond_0

    .line 32
    .line 33
    iget-object v1, p0, Ll/t190;->k:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 34
    .line 35
    invoke-static {v1}, Ll/wib0;->q(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 36
    .line 37
    .line 38
    move-result v1

    .line 39
    if-eqz v1, :cond_1

    .line 40
    .line 41
    :cond_0
    iget-object v1, p0, Ll/t190;->a:Landroidx/legacy/widget/Space;

    .line 42
    .line 43
    const/4 v2, 0x0

    .line 44
    invoke-static {v1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 45
    .line 46
    .line 47
    iget-object v1, p0, Ll/t190;->g:Lv/VPager;

    .line 48
    .line 49
    invoke-virtual {v1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 50
    .line 51
    .line 52
    move-result-object v1

    .line 53
    check-cast v1, Landroid/widget/LinearLayout$LayoutParams;

    .line 54
    .line 55
    iget v2, v1, Landroid/widget/LinearLayout$LayoutParams;->height:I

    .line 56
    .line 57
    sget v3, Ll/qa00;->j:I

    .line 58
    .line 59
    add-int/2addr v2, v3

    .line 60
    iput v2, v1, Landroid/widget/LinearLayout$LayoutParams;->height:I

    .line 61
    .line 62
    iget-object v2, p0, Ll/t190;->g:Lv/VPager;

    .line 63
    .line 64
    invoke-virtual {v2, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 65
    .line 66
    .line 67
    :cond_1
    if-nez p1, :cond_3

    .line 68
    .line 69
    iget-boolean p1, p0, Ll/t190;->s:Z

    .line 70
    .line 71
    if-eqz p1, :cond_2

    .line 72
    .line 73
    goto :goto_0

    .line 74
    :cond_2
    return-void

    .line 75
    :cond_3
    :goto_0
    iget-boolean p1, p0, Ll/t190;->r:Z

    .line 76
    .line 77
    if-eqz p1, :cond_4

    .line 78
    .line 79
    const p1, 0x3f333333    # 0.7f

    .line 80
    .line 81
    .line 82
    goto :goto_1

    .line 83
    :cond_4
    const p1, 0x3f666666    # 0.9f

    .line 84
    .line 85
    .line 86
    :goto_1
    iget-object v1, p0, Ll/t190;->a:Landroidx/legacy/widget/Space;

    .line 87
    .line 88
    invoke-virtual {v1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 89
    .line 90
    .line 91
    move-result-object v1

    .line 92
    check-cast v1, Landroid/widget/LinearLayout$LayoutParams;

    .line 93
    .line 94
    iget v2, v1, Landroid/widget/LinearLayout$LayoutParams;->height:I

    .line 95
    .line 96
    int-to-float v2, v2

    .line 97
    mul-float/2addr v2, p1

    .line 98
    float-to-int v2, v2

    .line 99
    iput v2, v1, Landroid/widget/LinearLayout$LayoutParams;->height:I

    .line 100
    .line 101
    iget-object v2, p0, Ll/t190;->a:Landroidx/legacy/widget/Space;

    .line 102
    .line 103
    invoke-virtual {v2, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 104
    .line 105
    .line 106
    iget-object v1, p0, Ll/t190;->g:Lv/VPager;

    .line 107
    .line 108
    invoke-virtual {v1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 109
    .line 110
    .line 111
    move-result-object v1

    .line 112
    check-cast v1, Landroid/widget/LinearLayout$LayoutParams;

    .line 113
    .line 114
    iget-boolean v2, p0, Ll/t190;->r:Z

    .line 115
    .line 116
    if-eqz v2, :cond_5

    .line 117
    .line 118
    const/high16 v2, 0x41980000    # 19.0f

    .line 119
    .line 120
    goto :goto_2

    .line 121
    :cond_5
    const/high16 v2, 0x41b80000    # 23.0f

    .line 122
    .line 123
    :goto_2
    int-to-float v3, v0

    .line 124
    mul-float/2addr v2, v3

    .line 125
    float-to-int v2, v2

    .line 126
    iput v2, v1, Landroid/widget/LinearLayout$LayoutParams;->height:I

    .line 127
    .line 128
    iget-object v2, p0, Ll/t190;->g:Lv/VPager;

    .line 129
    .line 130
    invoke-virtual {v2, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 131
    .line 132
    .line 133
    iget-object v1, p0, Ll/t190;->g:Lv/VPager;

    .line 134
    .line 135
    invoke-static {v1, p1}, Ll/bnl0;->u0(Landroid/view/View;F)V

    .line 136
    .line 137
    .line 138
    div-int/lit8 v0, v0, 0x4

    .line 139
    .line 140
    iget-object p0, p0, Ll/t190;->h:Lv/VPagerCircleIndicator;

    .line 141
    .line 142
    int-to-float p1, v0

    .line 143
    invoke-virtual {p0, p1}, Lv/VPagerCircleIndicator;->setRadius(F)V

    .line 144
    .line 145
    .line 146
    return-void
.end method


# virtual methods
.method public a(Landroid/view/ViewGroup;Z)Landroid/view/View;
    .locals 3

    .line 1
    iget-object v0, p0, Ll/t190;->j:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sget v1, Ll/rec0;->V2:I

    .line 8
    .line 9
    const/4 v2, 0x0

    .line 10
    invoke-virtual {v0, v1, p1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    invoke-virtual {p0, p1}, Ll/t190;->i(Landroid/view/View;)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p0}, Ll/t190;->p()V

    .line 18
    .line 19
    .line 20
    invoke-direct {p0, p2}, Ll/t190;->j(Z)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p0}, Ll/t190;->l()V

    .line 24
    .line 25
    .line 26
    iget-object p2, p0, Ll/t190;->j:Lcom/p1/mobile/android/app/Act;

    .line 27
    .line 28
    iget-object v0, p0, Ll/t190;->k:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 29
    .line 30
    invoke-virtual {p0, p2, v0}, Ll/t190;->m(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/PurchaseType;)Ll/t190$b;

    .line 31
    .line 32
    .line 33
    move-result-object p2

    .line 34
    iput-object p2, p0, Ll/t190;->m:Ll/t190$b;

    .line 35
    .line 36
    iget-object v0, p0, Ll/t190;->g:Lv/VPager;

    .line 37
    .line 38
    invoke-virtual {v0, p2}, Landroidx/viewpager/widget/ViewPager;->setAdapter(Ll/cf60;)V

    .line 39
    .line 40
    .line 41
    iget-object p2, p0, Ll/t190;->h:Lv/VPagerCircleIndicator;

    .line 42
    .line 43
    iget-object v0, p0, Ll/t190;->g:Lv/VPager;

    .line 44
    .line 45
    invoke-virtual {v0}, Landroidx/viewpager/widget/ViewPager;->getCurrentItem()I

    .line 46
    .line 47
    .line 48
    move-result v1

    .line 49
    invoke-virtual {p2, v0, v1}, Lv/VPagerCircleIndicator;->c(Landroidx/viewpager/widget/ViewPager;I)V

    .line 50
    .line 51
    .line 52
    iget-object p0, p0, Ll/t190;->h:Lv/VPagerCircleIndicator;

    .line 53
    .line 54
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 55
    .line 56
    .line 57
    return-object p1
.end method

.method public b(Lcom/p1/mobile/putong/core/ui/purchase/d;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/t190;->p:Lcom/p1/mobile/putong/core/ui/purchase/d;

    .line 2
    .line 3
    return-void
.end method

.method public c(Ljava/util/List;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ll/a690;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/t190;->q:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget-object v1, p0, Ll/t190;->h:Lv/VPagerCircleIndicator;

    .line 8
    .line 9
    const/4 v2, 0x0

    .line 10
    const/4 v3, 0x1

    .line 11
    if-le v0, v3, :cond_0

    .line 12
    .line 13
    move v4, v3

    .line 14
    goto :goto_0

    .line 15
    :cond_0
    move v4, v2

    .line 16
    :goto_0
    invoke-static {v1, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 17
    .line 18
    .line 19
    if-le v0, v3, :cond_1

    .line 20
    .line 21
    invoke-virtual {p0}, Ll/t190;->s()Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-nez v0, :cond_1

    .line 26
    .line 27
    const-wide/16 v0, 0x1388

    .line 28
    .line 29
    sget-object v4, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    .line 30
    .line 31
    invoke-static {v0, v1, v4}, Lrx/c;->interval(JLjava/util/concurrent/TimeUnit;)Lrx/c;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    invoke-virtual {v0}, Lrx/c;->onBackpressureLatest()Lrx/c;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    invoke-virtual {v0, v1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    new-instance v1, Ll/p190;

    .line 48
    .line 49
    invoke-direct {v1, p0, p1}, Ll/p190;-><init>(Ll/t190;Ljava/util/List;)V

    .line 50
    .line 51
    .line 52
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 53
    .line 54
    .line 55
    move-result-object v1

    .line 56
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    iput-object v0, p0, Ll/t190;->n:Ll/kcg0;

    .line 61
    .line 62
    :cond_1
    iget-object v0, p0, Ll/t190;->g:Lv/VPager;

    .line 63
    .line 64
    new-instance v1, Ll/t190$a;

    .line 65
    .line 66
    invoke-direct {v1, p0}, Ll/t190$a;-><init>(Ll/t190;)V

    .line 67
    .line 68
    .line 69
    invoke-virtual {v0, v1}, Landroidx/viewpager/widget/ViewPager;->d(Landroidx/viewpager/widget/ViewPager$j;)V

    .line 70
    .line 71
    .line 72
    new-instance v0, Ll/q190;

    .line 73
    .line 74
    invoke-direct {v0}, Ll/q190;-><init>()V

    .line 75
    .line 76
    .line 77
    invoke-static {p1, v0}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 78
    .line 79
    .line 80
    move-result-object v0

    .line 81
    check-cast v0, Ll/a690;

    .line 82
    .line 83
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 84
    .line 85
    .line 86
    move-result v1

    .line 87
    iget-object v4, p0, Ll/t190;->e:Lv/VText;

    .line 88
    .line 89
    if-eqz v1, :cond_2

    .line 90
    .line 91
    invoke-static {v4, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 92
    .line 93
    .line 94
    iget-object v1, p0, Ll/t190;->d:Lv/VText;

    .line 95
    .line 96
    const/4 v2, 0x3

    .line 97
    invoke-static {v2}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 98
    .line 99
    .line 100
    move-result-object v2

    .line 101
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 102
    .line 103
    .line 104
    new-instance v1, Ll/r190;

    .line 105
    .line 106
    invoke-direct {v1}, Ll/r190;-><init>()V

    .line 107
    .line 108
    .line 109
    invoke-static {p1, v1}, Ll/jyb;->f(Ljava/util/List;Ll/qcj;)I

    .line 110
    .line 111
    .line 112
    move-result v1

    .line 113
    iget-object v2, p0, Ll/t190;->e:Lv/VText;

    .line 114
    .line 115
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    .line 116
    .line 117
    .line 118
    move-result-object v4

    .line 119
    sub-int/2addr v1, v3

    .line 120
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 121
    .line 122
    .line 123
    move-result-object v1

    .line 124
    filled-new-array {v1}, [Ljava/lang/Object;

    .line 125
    .line 126
    .line 127
    move-result-object v1

    .line 128
    const-string v5, "\uff08%d\u9879\u7279\u6743\uff09"

    .line 129
    .line 130
    invoke-static {v4, v5, v1}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 131
    .line 132
    .line 133
    move-result-object v1

    .line 134
    invoke-virtual {v2, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 135
    .line 136
    .line 137
    invoke-virtual {v0}, Ll/a690;->g()I

    .line 138
    .line 139
    .line 140
    move-result v1

    .line 141
    if-eqz v1, :cond_3

    .line 142
    .line 143
    iget-object v1, p0, Ll/t190;->c:Landroid/widget/ImageView;

    .line 144
    .line 145
    invoke-static {v1, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 146
    .line 147
    .line 148
    iget-object v1, p0, Ll/t190;->c:Landroid/widget/ImageView;

    .line 149
    .line 150
    invoke-virtual {v0}, Ll/a690;->g()I

    .line 151
    .line 152
    .line 153
    move-result v0

    .line 154
    invoke-virtual {v1, v0}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 155
    .line 156
    .line 157
    goto :goto_1

    .line 158
    :cond_2
    invoke-static {v4, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 159
    .line 160
    .line 161
    :cond_3
    :goto_1
    iget-object p0, p0, Ll/t190;->m:Ll/t190$b;

    .line 162
    .line 163
    invoke-virtual {p0, p1}, Ll/t190$b;->l(Ljava/util/List;)V

    .line 164
    .line 165
    .line 166
    return-void
.end method

.method public final i(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/u190;->a(Ll/t190;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public k()V
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/t190;->s()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    iget-object v0, p0, Ll/t190;->m:Ll/t190$b;

    .line 8
    .line 9
    const/4 v1, 0x1

    .line 10
    invoke-virtual {v0, v1}, Ll/t190$b;->m(Z)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Ll/t190;->g:Lv/VPager;

    .line 14
    .line 15
    const/4 v1, 0x0

    .line 16
    invoke-virtual {v0, v1}, Landroidx/viewpager/widget/ViewPager;->setCurrentItem(I)V

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Ll/t190;->g:Lv/VPager;

    .line 20
    .line 21
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    instance-of v0, v0, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPage3;

    .line 26
    .line 27
    if-eqz v0, :cond_0

    .line 28
    .line 29
    iget-object v0, p0, Ll/t190;->g:Lv/VPager;

    .line 30
    .line 31
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    check-cast v0, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPage3;

    .line 36
    .line 37
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPage3;->f()V

    .line 38
    .line 39
    .line 40
    :cond_0
    iget-object v0, p0, Ll/t190;->n:Ll/kcg0;

    .line 41
    .line 42
    if-nez v0, :cond_1

    .line 43
    .line 44
    const-wide/16 v0, 0x1388

    .line 45
    .line 46
    sget-object v2, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    .line 47
    .line 48
    invoke-static {v0, v1, v2}, Lrx/c;->interval(JLjava/util/concurrent/TimeUnit;)Lrx/c;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    invoke-virtual {v0}, Lrx/c;->onBackpressureLatest()Lrx/c;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 57
    .line 58
    .line 59
    move-result-object v1

    .line 60
    invoke-virtual {v0, v1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    new-instance v1, Ll/s190;

    .line 65
    .line 66
    invoke-direct {v1, p0}, Ll/s190;-><init>(Ll/t190;)V

    .line 67
    .line 68
    .line 69
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 70
    .line 71
    .line 72
    move-result-object v1

    .line 73
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 74
    .line 75
    .line 76
    move-result-object v0

    .line 77
    iput-object v0, p0, Ll/t190;->n:Ll/kcg0;

    .line 78
    .line 79
    :cond_1
    return-void
.end method

.method public final l()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/t190;->k:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 2
    .line 3
    invoke-static {v0}, Ll/wib0;->a(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Ll/t190;->j:Lcom/p1/mobile/android/app/Act;

    .line 10
    .line 11
    sget v1, Ll/h9c0;->n0:I

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->color(I)I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    iget-object p0, p0, Ll/t190;->h:Lv/VPagerCircleIndicator;

    .line 18
    .line 19
    invoke-virtual {p0, v0}, Lv/VPagerCircleIndicator;->setFillColor(I)V

    .line 20
    .line 21
    .line 22
    :cond_0
    return-void
.end method

.method public m(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/PurchaseType;)Ll/t190$b;
    .locals 1

    .line 1
    new-instance v0, Ll/t190$b;

    .line 2
    .line 3
    iget-boolean p0, p0, Ll/t190;->l:Z

    .line 4
    .line 5
    invoke-direct {v0, p1, p2, p0}, Ll/t190$b;-><init>(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/PurchaseType;Z)V

    .line 6
    .line 7
    .line 8
    return-object v0
.end method

.method public n()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/t190;->g:Lv/VPager;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Landroid/widget/LinearLayout$LayoutParams;

    .line 8
    .line 9
    const/high16 v1, 0x41700000    # 15.0f

    .line 10
    .line 11
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    neg-int v1, v1

    .line 16
    iput v1, v0, Landroid/widget/LinearLayout$LayoutParams;->bottomMargin:I

    .line 17
    .line 18
    iget-object p0, p0, Ll/t190;->g:Lv/VPager;

    .line 19
    .line 20
    invoke-virtual {p0, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public o()Ljava/lang/CharSequence;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public p()V
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/t190;->o()Ljava/lang/CharSequence;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    if-nez v1, :cond_5

    .line 10
    .line 11
    iget-object v1, p0, Ll/t190;->d:Lv/VText;

    .line 12
    .line 13
    iget-boolean v2, p0, Ll/t190;->r:Z

    .line 14
    .line 15
    if-eqz v2, :cond_0

    .line 16
    .line 17
    const/high16 v2, 0x41600000    # 14.0f

    .line 18
    .line 19
    goto :goto_1

    .line 20
    :cond_0
    iget-boolean v2, p0, Ll/t190;->s:Z

    .line 21
    .line 22
    if-eqz v2, :cond_1

    .line 23
    .line 24
    const/16 v2, 0x10

    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_1
    const/16 v2, 0x12

    .line 28
    .line 29
    :goto_0
    int-to-float v2, v2

    .line 30
    :goto_1
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTextSize(F)V

    .line 31
    .line 32
    .line 33
    iget-object v1, p0, Ll/t190;->d:Lv/VText;

    .line 34
    .line 35
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 36
    .line 37
    .line 38
    iget-object v0, p0, Ll/t190;->b:Landroid/widget/LinearLayout;

    .line 39
    .line 40
    const/4 v1, 0x0

    .line 41
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 42
    .line 43
    .line 44
    iget-boolean v0, p0, Ll/t190;->r:Z

    .line 45
    .line 46
    if-nez v0, :cond_3

    .line 47
    .line 48
    iget-boolean v0, p0, Ll/t190;->s:Z

    .line 49
    .line 50
    if-eqz v0, :cond_2

    .line 51
    .line 52
    goto :goto_2

    .line 53
    :cond_2
    return-void

    .line 54
    :cond_3
    :goto_2
    iget-object v0, p0, Ll/t190;->b:Landroid/widget/LinearLayout;

    .line 55
    .line 56
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    check-cast v0, Landroid/widget/LinearLayout$LayoutParams;

    .line 61
    .line 62
    iget v1, v0, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 63
    .line 64
    int-to-float v1, v1

    .line 65
    iget-boolean v2, p0, Ll/t190;->r:Z

    .line 66
    .line 67
    if-eqz v2, :cond_4

    .line 68
    .line 69
    const v2, 0x3f333333    # 0.7f

    .line 70
    .line 71
    .line 72
    goto :goto_3

    .line 73
    :cond_4
    const v2, 0x3f666666    # 0.9f

    .line 74
    .line 75
    .line 76
    :goto_3
    mul-float/2addr v1, v2

    .line 77
    float-to-int v1, v1

    .line 78
    iput v1, v0, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 79
    .line 80
    iget-object p0, p0, Ll/t190;->b:Landroid/widget/LinearLayout;

    .line 81
    .line 82
    invoke-virtual {p0, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 83
    .line 84
    .line 85
    return-void

    .line 86
    :cond_5
    iget-object p0, p0, Ll/t190;->b:Landroid/widget/LinearLayout;

    .line 87
    .line 88
    const/16 v0, 0x8

    .line 89
    .line 90
    invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V

    .line 91
    .line 92
    .line 93
    return-void
.end method

.method public final synthetic q(Ljava/lang/Long;)V
    .locals 2

    .line 1
    iget-object p1, p0, Ll/t190;->g:Lv/VPager;

    .line 2
    .line 3
    invoke-virtual {p1}, Landroidx/viewpager/widget/ViewPager;->getCurrentItem()I

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    iget-object v0, p0, Ll/t190;->q:Ljava/util/List;

    .line 8
    .line 9
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    const/4 v1, 0x1

    .line 14
    sub-int/2addr v0, v1

    .line 15
    iget-object p0, p0, Ll/t190;->g:Lv/VPager;

    .line 16
    .line 17
    if-ne p1, v0, :cond_0

    .line 18
    .line 19
    const/4 p1, 0x0

    .line 20
    invoke-virtual {p0, p1, v1}, Landroidx/viewpager/widget/ViewPager;->T(IZ)V

    .line 21
    .line 22
    .line 23
    return-void

    .line 24
    :cond_0
    invoke-virtual {p0}, Landroidx/viewpager/widget/ViewPager;->getCurrentItem()I

    .line 25
    .line 26
    .line 27
    move-result p1

    .line 28
    add-int/2addr p1, v1

    .line 29
    invoke-virtual {p0, p1, v1}, Landroidx/viewpager/widget/ViewPager;->T(IZ)V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public final synthetic r(Ljava/util/List;Ljava/lang/Long;)V
    .locals 1

    .line 1
    iget-object p2, p0, Ll/t190;->g:Lv/VPager;

    .line 2
    .line 3
    invoke-virtual {p2}, Landroidx/viewpager/widget/ViewPager;->getCurrentItem()I

    .line 4
    .line 5
    .line 6
    move-result p2

    .line 7
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    const/4 v0, 0x1

    .line 12
    sub-int/2addr p1, v0

    .line 13
    iget-object p0, p0, Ll/t190;->g:Lv/VPager;

    .line 14
    .line 15
    if-ne p2, p1, :cond_0

    .line 16
    .line 17
    const/4 p1, 0x0

    .line 18
    invoke-virtual {p0, p1, v0}, Landroidx/viewpager/widget/ViewPager;->T(IZ)V

    .line 19
    .line 20
    .line 21
    return-void

    .line 22
    :cond_0
    invoke-virtual {p0}, Landroidx/viewpager/widget/ViewPager;->getCurrentItem()I

    .line 23
    .line 24
    .line 25
    move-result p1

    .line 26
    add-int/2addr p1, v0

    .line 27
    invoke-virtual {p0, p1, v0}, Landroidx/viewpager/widget/ViewPager;->T(IZ)V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public release()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/t190;->n:Ll/kcg0;

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
    iget-object v0, p0, Ll/t190;->n:Ll/kcg0;

    .line 10
    .line 11
    invoke-interface {v0}, Ll/kcg0;->unsubscribe()V

    .line 12
    .line 13
    .line 14
    const/4 v0, 0x0

    .line 15
    iput-object v0, p0, Ll/t190;->n:Ll/kcg0;

    .line 16
    .line 17
    :cond_0
    iget-object v0, p0, Ll/t190;->m:Ll/t190$b;

    .line 18
    .line 19
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-eqz v0, :cond_1

    .line 24
    .line 25
    iget-object v0, p0, Ll/t190;->m:Ll/t190$b;

    .line 26
    .line 27
    invoke-virtual {v0}, Ll/t190$b;->n()V

    .line 28
    .line 29
    .line 30
    :cond_1
    iget-object p0, p0, Ll/t190;->o:Ll/kcg0;

    .line 31
    .line 32
    invoke-static {p0}, Ll/bsj0;->U(Ll/kcg0;)V

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public final s()Z
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->h5()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_1

    .line 14
    .line 15
    iget-object v0, p0, Ll/t190;->k:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 16
    .line 17
    invoke-static {v0}, Ll/wib0;->w(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-nez v0, :cond_0

    .line 22
    .line 23
    iget-object p0, p0, Ll/t190;->k:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 24
    .line 25
    invoke-static {p0}, Ll/wib0;->q(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 26
    .line 27
    .line 28
    move-result p0

    .line 29
    if-eqz p0, :cond_1

    .line 30
    .line 31
    :cond_0
    const/4 p0, 0x1

    .line 32
    return p0

    .line 33
    :cond_1
    const/4 p0, 0x0

    .line 34
    return p0
.end method

.method public t()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/t190;->m:Ll/t190$b;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {v0, v1}, Ll/t190$b;->m(Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Ll/t190;->n:Ll/kcg0;

    .line 8
    .line 9
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    iget-object v0, p0, Ll/t190;->n:Ll/kcg0;

    .line 16
    .line 17
    invoke-interface {v0}, Ll/kcg0;->unsubscribe()V

    .line 18
    .line 19
    .line 20
    const/4 v0, 0x0

    .line 21
    iput-object v0, p0, Ll/t190;->n:Ll/kcg0;

    .line 22
    .line 23
    :cond_0
    return-void
.end method

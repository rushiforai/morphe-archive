.class public Ll/uyf;
.super Ll/lyf;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/uyf$c;
    }
.end annotation


# instance fields
.field public c:Lv/VImage;

.field public d:Lv/VImage;

.field public e:Landroid/widget/TextView;

.field public f:Lv/VDraweeView;

.field public g:Landroid/widget/TextView;

.field public h:Landroidx/viewpager/widget/ViewPager;

.field public i:Lv/VPagerCircleIndicator;

.field public j:Lv/VText;

.field public k:Landroidx/core/widget/NestedScrollView;

.field public final l:I

.field public m:I

.field public n:Ljava/lang/Runnable;

.field public o:J

.field public p:Z

.field public q:Z

.field public r:Ll/jyf;

.field public s:Ljava/lang/String;

.field public final t:Landroidx/viewpager/widget/ViewPager$j;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;)V
    .locals 2
    .param p1    # Lcom/p1/mobile/android/app/Act;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1}, Ll/lyf;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 2
    .line 3
    .line 4
    const/16 p1, 0xbb8

    .line 5
    .line 6
    iput p1, p0, Ll/uyf;->l:I

    .line 7
    .line 8
    const/4 p1, 0x0

    .line 9
    iput p1, p0, Ll/uyf;->m:I

    .line 10
    .line 11
    const-wide/16 v0, 0x0

    .line 12
    .line 13
    iput-wide v0, p0, Ll/uyf;->o:J

    .line 14
    .line 15
    iput-boolean p1, p0, Ll/uyf;->p:Z

    .line 16
    .line 17
    iput-boolean p1, p0, Ll/uyf;->q:Z

    .line 18
    .line 19
    new-instance p1, Ll/uyf$b;

    .line 20
    .line 21
    invoke-direct {p1, p0}, Ll/uyf$b;-><init>(Ll/uyf;)V

    .line 22
    .line 23
    .line 24
    iput-object p1, p0, Ll/uyf;->t:Landroidx/viewpager/widget/ViewPager$j;

    .line 25
    .line 26
    return-void
.end method

.method public static synthetic k(Ll/uyf;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/uyf;->z(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic l(Ll/uyf;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/uyf;->A()V

    return-void
.end method

.method public static synthetic m(Ll/uyf;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/uyf;->y(Landroid/view/View;)V

    return-void
.end method

.method public static bridge synthetic n(Ll/uyf;I)V
    .locals 0

    .line 1
    iput p1, p0, Ll/uyf;->m:I

    return-void
.end method

.method public static bridge synthetic o(Ll/uyf;I)Lcom/p1/mobile/putong/core/data/FakeGoodLifeUserInfo;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/uyf;->u(I)Lcom/p1/mobile/putong/core/data/FakeGoodLifeUserInfo;

    move-result-object p0

    return-object p0
.end method

.method public static bridge synthetic p(Ll/uyf;Lcom/p1/mobile/putong/core/data/FakeGoodLifeUserInfo;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/uyf;->w(Lcom/p1/mobile/putong/core/data/FakeGoodLifeUserInfo;)V

    return-void
.end method

.method public static bridge synthetic q(Ll/uyf;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/uyf;->E()V

    return-void
.end method


# virtual methods
.method public final synthetic A()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/uyf;->h:Landroidx/viewpager/widget/ViewPager;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget v1, p0, Ll/uyf;->m:I

    .line 6
    .line 7
    const/4 v2, 0x1

    .line 8
    add-int/2addr v1, v2

    .line 9
    iput v1, p0, Ll/uyf;->m:I

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/uyf;->s()I

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    invoke-virtual {v0, v1, v2}, Landroidx/viewpager/widget/ViewPager;->T(IZ)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0}, Ll/uyf;->F()V

    .line 19
    .line 20
    .line 21
    :cond_0
    return-void
.end method

.method public final B()V
    .locals 2

    .line 1
    new-instance v0, Ll/jyf;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/jyf;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Ll/jyf;->c()Ll/jyf;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    iput-object v0, p0, Ll/uyf;->r:Ll/jyf;

    .line 11
    .line 12
    invoke-virtual {p0}, Ll/uyf;->r()V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0}, Ll/uyf;->v()V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0}, Ll/uyf;->x()V

    .line 19
    .line 20
    .line 21
    const/4 v0, 0x0

    .line 22
    invoke-virtual {p0, v0}, Ll/uyf;->u(I)Lcom/p1/mobile/putong/core/data/FakeGoodLifeUserInfo;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-virtual {p0, v0}, Ll/uyf;->w(Lcom/p1/mobile/putong/core/data/FakeGoodLifeUserInfo;)V

    .line 27
    .line 28
    .line 29
    iget-object v0, p0, Ll/uyf;->c:Lv/VImage;

    .line 30
    .line 31
    new-instance v1, Ll/ryf;

    .line 32
    .line 33
    invoke-direct {v1, p0}, Ll/ryf;-><init>(Ll/uyf;)V

    .line 34
    .line 35
    .line 36
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 37
    .line 38
    .line 39
    iget-object v0, p0, Ll/uyf;->j:Lv/VText;

    .line 40
    .line 41
    new-instance v1, Ll/syf;

    .line 42
    .line 43
    invoke-direct {v1, p0}, Ll/syf;-><init>(Ll/uyf;)V

    .line 44
    .line 45
    .line 46
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 47
    .line 48
    .line 49
    invoke-virtual {p0}, Ll/uyf;->F()V

    .line 50
    .line 51
    .line 52
    return-void
.end method

.method public C(ZZLjava/lang/String;)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/uyf;->p:Z

    .line 2
    .line 3
    iput-boolean p2, p0, Ll/uyf;->q:Z

    .line 4
    .line 5
    iput-object p3, p0, Ll/uyf;->s:Ljava/lang/String;

    .line 6
    .line 7
    return-void
.end method

.method public final D(Ljava/lang/String;I)V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/lyf;->a:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sget v1, Lcom/p1/mobile/putong/core/R$string;->A6:I

    .line 8
    .line 9
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    filled-new-array {p1, v2}, [Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    invoke-virtual {v0, v1, p1}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    new-instance v0, Landroid/text/SpannableStringBuilder;

    .line 22
    .line 23
    invoke-direct {v0, p1}, Landroid/text/SpannableStringBuilder;-><init>(Ljava/lang/CharSequence;)V

    .line 24
    .line 25
    .line 26
    new-instance v1, Landroid/text/style/ForegroundColorSpan;

    .line 27
    .line 28
    iget-object v2, p0, Ll/lyf;->a:Lcom/p1/mobile/android/app/Act;

    .line 29
    .line 30
    invoke-virtual {v2}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 31
    .line 32
    .line 33
    move-result-object v2

    .line 34
    sget v3, Ll/c9c0;->I:I

    .line 35
    .line 36
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getColor(I)I

    .line 37
    .line 38
    .line 39
    move-result v2

    .line 40
    invoke-direct {v1, v2}, Landroid/text/style/ForegroundColorSpan;-><init>(I)V

    .line 41
    .line 42
    .line 43
    invoke-static {p2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object p2

    .line 47
    invoke-virtual {p1, p2}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    .line 48
    .line 49
    .line 50
    move-result p1

    .line 51
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    .line 52
    .line 53
    .line 54
    move-result p2

    .line 55
    add-int/2addr p2, p1

    .line 56
    const/16 v2, 0x21

    .line 57
    .line 58
    invoke-virtual {v0, v1, p1, p2, v2}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 59
    .line 60
    .line 61
    iget-object p0, p0, Ll/uyf;->g:Landroid/widget/TextView;

    .line 62
    .line 63
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 64
    .line 65
    .line 66
    return-void
.end method

.method public final E()V
    .locals 4

    .line 1
    iget-wide v0, p0, Ll/uyf;->o:J

    .line 2
    .line 3
    const-wide/16 v2, 0x0

    .line 4
    .line 5
    cmp-long v0, v0, v2

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 10
    .line 11
    .line 12
    move-result-wide v0

    .line 13
    iget-wide v2, p0, Ll/uyf;->o:J

    .line 14
    .line 15
    sub-long/2addr v0, v2

    .line 16
    const-wide/16 v2, 0xbb8

    .line 17
    .line 18
    cmp-long v0, v0, v2

    .line 19
    .line 20
    if-gez v0, :cond_0

    .line 21
    .line 22
    iget-object v0, p0, Ll/uyf;->n:Ljava/lang/Runnable;

    .line 23
    .line 24
    if-eqz v0, :cond_0

    .line 25
    .line 26
    invoke-static {v0}, Ll/l51;->J(Ljava/lang/Runnable;)V

    .line 27
    .line 28
    .line 29
    const/4 v0, 0x0

    .line 30
    iput-object v0, p0, Ll/uyf;->n:Ljava/lang/Runnable;

    .line 31
    .line 32
    :cond_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 33
    .line 34
    .line 35
    move-result-wide v0

    .line 36
    iput-wide v0, p0, Ll/uyf;->o:J

    .line 37
    .line 38
    return-void
.end method

.method public final F()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/uyf;->n:Ljava/lang/Runnable;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ll/tyf;

    .line 6
    .line 7
    invoke-direct {v0, p0}, Ll/tyf;-><init>(Ll/uyf;)V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Ll/uyf;->n:Ljava/lang/Runnable;

    .line 11
    .line 12
    :cond_0
    invoke-virtual {p0}, Landroid/app/Dialog;->getContext()Landroid/content/Context;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    iget-object p0, p0, Ll/uyf;->n:Ljava/lang/Runnable;

    .line 17
    .line 18
    const-wide/16 v1, 0xbb8

    .line 19
    .line 20
    invoke-static {v0, p0, v1, v2}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public c()I
    .locals 0

    .line 1
    const/16 p0, 0x50

    .line 2
    .line 3
    return p0
.end method

.method public d()F
    .locals 1

    .line 1
    invoke-static {}, Ll/vnb;->s1()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const p0, 0x3f4ccccd    # 0.8f

    .line 8
    .line 9
    .line 10
    return p0

    .line 11
    :cond_0
    iget-boolean v0, p0, Ll/uyf;->q:Z

    .line 12
    .line 13
    if-nez v0, :cond_2

    .line 14
    .line 15
    invoke-static {}, Ll/cxv;->a()Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    if-eqz p0, :cond_1

    .line 20
    .line 21
    const p0, 0x3f75c28f    # 0.96f

    .line 22
    .line 23
    .line 24
    return p0

    .line 25
    :cond_1
    const p0, 0x3f7ae148    # 0.98f

    .line 26
    .line 27
    .line 28
    return p0

    .line 29
    :cond_2
    invoke-super {p0}, Ll/lyf;->d()F

    .line 30
    .line 31
    .line 32
    move-result p0

    .line 33
    return p0
.end method

.method public dismiss()V
    .locals 1

    .line 1
    invoke-super {p0}, Ll/lyf;->dismiss()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/uyf;->n:Ljava/lang/Runnable;

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    invoke-static {v0}, Ll/l51;->J(Ljava/lang/Runnable;)V

    .line 9
    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    iput-object v0, p0, Ll/uyf;->n:Ljava/lang/Runnable;

    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public f()V
    .locals 1

    .line 1
    sget v0, Ll/adc0;->A1:I

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Landroid/app/Dialog;->findViewById(I)Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lv/VImage;

    .line 8
    .line 9
    iput-object v0, p0, Ll/uyf;->c:Lv/VImage;

    .line 10
    .line 11
    sget v0, Ll/adc0;->fe:I

    .line 12
    .line 13
    invoke-virtual {p0, v0}, Landroid/app/Dialog;->findViewById(I)Landroid/view/View;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    check-cast v0, Lv/VImage;

    .line 18
    .line 19
    iput-object v0, p0, Ll/uyf;->d:Lv/VImage;

    .line 20
    .line 21
    sget v0, Ll/adc0;->je:I

    .line 22
    .line 23
    invoke-virtual {p0, v0}, Landroid/app/Dialog;->findViewById(I)Landroid/view/View;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    check-cast v0, Landroid/widget/TextView;

    .line 28
    .line 29
    iput-object v0, p0, Ll/uyf;->e:Landroid/widget/TextView;

    .line 30
    .line 31
    sget v0, Ll/adc0;->O:I

    .line 32
    .line 33
    invoke-virtual {p0, v0}, Landroid/app/Dialog;->findViewById(I)Landroid/view/View;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    check-cast v0, Lv/VDraweeView;

    .line 38
    .line 39
    iput-object v0, p0, Ll/uyf;->f:Lv/VDraweeView;

    .line 40
    .line 41
    sget v0, Ll/adc0;->nb:I

    .line 42
    .line 43
    invoke-virtual {p0, v0}, Landroid/app/Dialog;->findViewById(I)Landroid/view/View;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    check-cast v0, Landroid/widget/TextView;

    .line 48
    .line 49
    iput-object v0, p0, Ll/uyf;->g:Landroid/widget/TextView;

    .line 50
    .line 51
    sget v0, Ll/adc0;->qf:I

    .line 52
    .line 53
    invoke-virtual {p0, v0}, Landroid/app/Dialog;->findViewById(I)Landroid/view/View;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    check-cast v0, Landroidx/viewpager/widget/ViewPager;

    .line 58
    .line 59
    iput-object v0, p0, Ll/uyf;->h:Landroidx/viewpager/widget/ViewPager;

    .line 60
    .line 61
    sget v0, Ll/adc0;->rf:I

    .line 62
    .line 63
    invoke-virtual {p0, v0}, Landroid/app/Dialog;->findViewById(I)Landroid/view/View;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    check-cast v0, Lv/VPagerCircleIndicator;

    .line 68
    .line 69
    iput-object v0, p0, Ll/uyf;->i:Lv/VPagerCircleIndicator;

    .line 70
    .line 71
    sget v0, Ll/adc0;->Y0:I

    .line 72
    .line 73
    invoke-virtual {p0, v0}, Landroid/app/Dialog;->findViewById(I)Landroid/view/View;

    .line 74
    .line 75
    .line 76
    move-result-object v0

    .line 77
    check-cast v0, Lv/VText;

    .line 78
    .line 79
    iput-object v0, p0, Ll/uyf;->j:Lv/VText;

    .line 80
    .line 81
    sget v0, Ll/adc0;->Q8:I

    .line 82
    .line 83
    invoke-virtual {p0, v0}, Landroid/app/Dialog;->findViewById(I)Landroid/view/View;

    .line 84
    .line 85
    .line 86
    move-result-object v0

    .line 87
    check-cast v0, Landroidx/core/widget/NestedScrollView;

    .line 88
    .line 89
    iput-object v0, p0, Ll/uyf;->k:Landroidx/core/widget/NestedScrollView;

    .line 90
    .line 91
    invoke-virtual {p0}, Ll/lyf;->g()V

    .line 92
    .line 93
    .line 94
    invoke-virtual {p0}, Ll/uyf;->B()V

    .line 95
    .line 96
    .line 97
    return-void
.end method

.method public i()I
    .locals 0

    .line 1
    sget p0, Ll/kec0;->g3:I

    .line 2
    .line 3
    return p0
.end method

.method public final r()V
    .locals 9

    .line 1
    iget-object v0, p0, Ll/uyf;->h:Landroidx/viewpager/widget/ViewPager;

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
    iget-object v1, p0, Ll/uyf;->i:Lv/VPagerCircleIndicator;

    .line 10
    .line 11
    invoke-virtual {v1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    check-cast v1, Landroid/widget/LinearLayout$LayoutParams;

    .line 16
    .line 17
    iget-object v2, p0, Ll/uyf;->d:Lv/VImage;

    .line 18
    .line 19
    invoke-virtual {v2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 20
    .line 21
    .line 22
    move-result-object v2

    .line 23
    check-cast v2, Landroid/widget/RelativeLayout$LayoutParams;

    .line 24
    .line 25
    iget-object v3, p0, Ll/uyf;->k:Landroidx/core/widget/NestedScrollView;

    .line 26
    .line 27
    invoke-virtual {v3}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 28
    .line 29
    .line 30
    move-result-object v3

    .line 31
    check-cast v3, Landroid/widget/RelativeLayout$LayoutParams;

    .line 32
    .line 33
    iget-object v4, p0, Ll/uyf;->e:Landroid/widget/TextView;

    .line 34
    .line 35
    invoke-virtual {v4}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 36
    .line 37
    .line 38
    move-result-object v4

    .line 39
    check-cast v4, Landroid/widget/RelativeLayout$LayoutParams;

    .line 40
    .line 41
    iget-object v5, p0, Ll/uyf;->j:Lv/VText;

    .line 42
    .line 43
    invoke-virtual {v5}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 44
    .line 45
    .line 46
    move-result-object v5

    .line 47
    check-cast v5, Landroid/widget/RelativeLayout$LayoutParams;

    .line 48
    .line 49
    iget-boolean v6, p0, Ll/uyf;->q:Z

    .line 50
    .line 51
    if-eqz v6, :cond_0

    .line 52
    .line 53
    const/4 v6, 0x0

    .line 54
    iput v6, v3, Landroid/widget/RelativeLayout$LayoutParams;->bottomMargin:I

    .line 55
    .line 56
    :cond_0
    invoke-static {}, Ll/f5g;->f()Z

    .line 57
    .line 58
    .line 59
    move-result v6

    .line 60
    const/4 v7, 0x1

    .line 61
    if-eqz v6, :cond_1

    .line 62
    .line 63
    const/high16 v6, 0x43820000    # 260.0f

    .line 64
    .line 65
    invoke-static {v6}, Ll/qa00;->d(F)I

    .line 66
    .line 67
    .line 68
    move-result v6

    .line 69
    iput v6, v0, Landroid/widget/LinearLayout$LayoutParams;->height:I

    .line 70
    .line 71
    sget v6, Ll/qa00;->i:I

    .line 72
    .line 73
    iput v6, v0, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 74
    .line 75
    sget v6, Ll/qa00;->k:I

    .line 76
    .line 77
    iput v6, v1, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 78
    .line 79
    sget v6, Ll/qa00;->C:I

    .line 80
    .line 81
    iput v6, v2, Landroid/widget/RelativeLayout$LayoutParams;->topMargin:I

    .line 82
    .line 83
    sget v8, Ll/qa00;->o:I

    .line 84
    .line 85
    iput v8, v3, Landroid/widget/RelativeLayout$LayoutParams;->topMargin:I

    .line 86
    .line 87
    sget v8, Ll/qa00;->j:I

    .line 88
    .line 89
    iput v8, v4, Landroid/widget/RelativeLayout$LayoutParams;->topMargin:I

    .line 90
    .line 91
    iput v6, v5, Landroid/widget/RelativeLayout$LayoutParams;->height:I

    .line 92
    .line 93
    iget-object v5, p0, Ll/uyf;->e:Landroid/widget/TextView;

    .line 94
    .line 95
    const/high16 v6, 0x41b00000    # 22.0f

    .line 96
    .line 97
    invoke-virtual {v5, v7, v6}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 98
    .line 99
    .line 100
    goto/16 :goto_0

    .line 101
    .line 102
    :cond_1
    invoke-static {}, Ll/vnb;->p1()Z

    .line 103
    .line 104
    .line 105
    move-result v6

    .line 106
    if-eqz v6, :cond_2

    .line 107
    .line 108
    const/high16 v6, 0x437a0000    # 250.0f

    .line 109
    .line 110
    invoke-static {v6}, Ll/qa00;->d(F)I

    .line 111
    .line 112
    .line 113
    move-result v6

    .line 114
    iput v6, v0, Landroid/widget/LinearLayout$LayoutParams;->height:I

    .line 115
    .line 116
    sget v6, Ll/qa00;->h:I

    .line 117
    .line 118
    iput v6, v0, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 119
    .line 120
    sget v6, Ll/qa00;->j:I

    .line 121
    .line 122
    iput v6, v1, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 123
    .line 124
    sget v8, Ll/qa00;->B:I

    .line 125
    .line 126
    iput v8, v2, Landroid/widget/RelativeLayout$LayoutParams;->topMargin:I

    .line 127
    .line 128
    iput v6, v3, Landroid/widget/RelativeLayout$LayoutParams;->topMargin:I

    .line 129
    .line 130
    sget v6, Ll/qa00;->f:I

    .line 131
    .line 132
    iput v6, v4, Landroid/widget/RelativeLayout$LayoutParams;->topMargin:I

    .line 133
    .line 134
    iput v8, v5, Landroid/widget/RelativeLayout$LayoutParams;->height:I

    .line 135
    .line 136
    iget-object v5, p0, Ll/uyf;->e:Landroid/widget/TextView;

    .line 137
    .line 138
    const/high16 v6, 0x41a00000    # 20.0f

    .line 139
    .line 140
    invoke-virtual {v5, v7, v6}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 141
    .line 142
    .line 143
    goto :goto_0

    .line 144
    :cond_2
    invoke-static {}, Ll/vnb;->q1()Z

    .line 145
    .line 146
    .line 147
    move-result v6

    .line 148
    if-eqz v6, :cond_3

    .line 149
    .line 150
    const/high16 v6, 0x43700000    # 240.0f

    .line 151
    .line 152
    invoke-static {v6}, Ll/qa00;->d(F)I

    .line 153
    .line 154
    .line 155
    move-result v6

    .line 156
    iput v6, v0, Landroid/widget/LinearLayout$LayoutParams;->height:I

    .line 157
    .line 158
    sget v6, Ll/qa00;->g:I

    .line 159
    .line 160
    iput v6, v0, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 161
    .line 162
    sget v6, Ll/qa00;->i:I

    .line 163
    .line 164
    iput v6, v1, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 165
    .line 166
    sget v8, Ll/qa00;->A:I

    .line 167
    .line 168
    iput v8, v2, Landroid/widget/RelativeLayout$LayoutParams;->topMargin:I

    .line 169
    .line 170
    iput v6, v3, Landroid/widget/RelativeLayout$LayoutParams;->topMargin:I

    .line 171
    .line 172
    sget v6, Ll/qa00;->e:I

    .line 173
    .line 174
    iput v6, v4, Landroid/widget/RelativeLayout$LayoutParams;->topMargin:I

    .line 175
    .line 176
    iput v8, v5, Landroid/widget/RelativeLayout$LayoutParams;->height:I

    .line 177
    .line 178
    iget-object v5, p0, Ll/uyf;->e:Landroid/widget/TextView;

    .line 179
    .line 180
    const/high16 v6, 0x41900000    # 18.0f

    .line 181
    .line 182
    invoke-virtual {v5, v7, v6}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 183
    .line 184
    .line 185
    goto :goto_0

    .line 186
    :cond_3
    const/high16 v5, 0x439b0000    # 310.0f

    .line 187
    .line 188
    invoke-static {v5}, Ll/qa00;->d(F)I

    .line 189
    .line 190
    .line 191
    move-result v5

    .line 192
    iput v5, v0, Landroid/widget/LinearLayout$LayoutParams;->height:I

    .line 193
    .line 194
    sget v5, Ll/qa00;->j:I

    .line 195
    .line 196
    iput v5, v0, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 197
    .line 198
    sget v5, Ll/qa00;->o:I

    .line 199
    .line 200
    iput v5, v1, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 201
    .line 202
    sget v5, Ll/qa00;->E:I

    .line 203
    .line 204
    iput v5, v2, Landroid/widget/RelativeLayout$LayoutParams;->topMargin:I

    .line 205
    .line 206
    sget v5, Ll/qa00;->q:I

    .line 207
    .line 208
    iput v5, v3, Landroid/widget/RelativeLayout$LayoutParams;->topMargin:I

    .line 209
    .line 210
    sget v5, Ll/qa00;->h:I

    .line 211
    .line 212
    iput v5, v4, Landroid/widget/RelativeLayout$LayoutParams;->topMargin:I

    .line 213
    .line 214
    iget-object v5, p0, Ll/uyf;->e:Landroid/widget/TextView;

    .line 215
    .line 216
    const/high16 v6, 0x41c00000    # 24.0f

    .line 217
    .line 218
    invoke-virtual {v5, v7, v6}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 219
    .line 220
    .line 221
    :goto_0
    invoke-static {}, Ll/vnb;->s1()Z

    .line 222
    .line 223
    .line 224
    move-result v5

    .line 225
    if-eqz v5, :cond_4

    .line 226
    .line 227
    invoke-static {}, Ll/bnl0;->y0()I

    .line 228
    .line 229
    .line 230
    move-result v5

    .line 231
    invoke-static {v5}, Ll/rsf0;->i(I)F

    .line 232
    .line 233
    .line 234
    move-result v5

    .line 235
    const/high16 v6, 0x42a00000    # 80.0f

    .line 236
    .line 237
    sub-float/2addr v5, v6

    .line 238
    const v6, 0x440b8000    # 558.0f

    .line 239
    .line 240
    .line 241
    mul-float/2addr v5, v6

    .line 242
    const v6, 0x4494c000    # 1190.0f

    .line 243
    .line 244
    .line 245
    div-float/2addr v5, v6

    .line 246
    invoke-static {v5}, Ll/qa00;->d(F)I

    .line 247
    .line 248
    .line 249
    move-result v5

    .line 250
    iput v5, v0, Landroid/widget/LinearLayout$LayoutParams;->height:I

    .line 251
    .line 252
    :cond_4
    iget-object v5, p0, Ll/uyf;->h:Landroidx/viewpager/widget/ViewPager;

    .line 253
    .line 254
    invoke-virtual {v5, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 255
    .line 256
    .line 257
    iget-object v0, p0, Ll/uyf;->i:Lv/VPagerCircleIndicator;

    .line 258
    .line 259
    invoke-virtual {v0, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 260
    .line 261
    .line 262
    iget-object v0, p0, Ll/uyf;->d:Lv/VImage;

    .line 263
    .line 264
    invoke-virtual {v0, v2}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 265
    .line 266
    .line 267
    iget-object v0, p0, Ll/uyf;->k:Landroidx/core/widget/NestedScrollView;

    .line 268
    .line 269
    invoke-virtual {v0, v3}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 270
    .line 271
    .line 272
    iget-object p0, p0, Ll/uyf;->e:Landroid/widget/TextView;

    .line 273
    .line 274
    invoke-virtual {p0, v4}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 275
    .line 276
    .line 277
    return-void
.end method

.method public final s()I
    .locals 2

    .line 1
    iget v0, p0, Ll/uyf;->m:I

    .line 2
    .line 3
    const/4 v1, 0x3

    .line 4
    if-ge v0, v1, :cond_0

    .line 5
    .line 6
    if-gtz v0, :cond_1

    .line 7
    .line 8
    :cond_0
    const/4 v0, 0x0

    .line 9
    iput v0, p0, Ll/uyf;->m:I

    .line 10
    .line 11
    :cond_1
    iget p0, p0, Ll/uyf;->m:I

    .line 12
    .line 13
    return p0
.end method

.method public show()V
    .locals 4

    .line 1
    invoke-virtual {p0}, Ll/uyf;->t()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-class v1, Ll/uyf;

    .line 6
    .line 7
    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-static {v0, v1}, Ll/w1e;->c(Ljava/lang/String;Ljava/lang/String;)Ll/l4g0;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iput-object v0, p0, Ll/lyf;->b:Ll/l4g0;

    .line 16
    .line 17
    iget-boolean v1, p0, Ll/uyf;->q:Z

    .line 18
    .line 19
    const-string v2, "active"

    .line 20
    .line 21
    const-string v3, "tooltips_trigger_mode"

    .line 22
    .line 23
    if-eqz v1, :cond_0

    .line 24
    .line 25
    invoke-static {v3, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    const-string v2, "upload_photo_tip_show_from"

    .line 30
    .line 31
    iget-object v3, p0, Ll/uyf;->s:Ljava/lang/String;

    .line 32
    .line 33
    invoke-static {v2, v3}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 34
    .line 35
    .line 36
    move-result-object v2

    .line 37
    filled-new-array {v1, v2}, [Ll/pf60;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    invoke-virtual {v0, v1}, Ll/l4g0;->p([Ll/pf60;)V

    .line 42
    .line 43
    .line 44
    goto :goto_0

    .line 45
    :cond_0
    invoke-static {v3, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 46
    .line 47
    .line 48
    move-result-object v1

    .line 49
    filled-new-array {v1}, [Ll/pf60;

    .line 50
    .line 51
    .line 52
    move-result-object v1

    .line 53
    invoke-virtual {v0, v1}, Ll/l4g0;->p([Ll/pf60;)V

    .line 54
    .line 55
    .line 56
    :goto_0
    invoke-static {}, Ll/xra;->w()Z

    .line 57
    .line 58
    .line 59
    move-result v0

    .line 60
    if-eqz v0, :cond_1

    .line 61
    .line 62
    return-void

    .line 63
    :cond_1
    invoke-super {p0}, Ll/lyf;->show()V

    .line 64
    .line 65
    .line 66
    return-void
.end method

.method public t()Ljava/lang/String;
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/uyf;->q:Z

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const-string p0, "p_upload_photo_tips"

    .line 6
    .line 7
    return-object p0

    .line 8
    :cond_0
    const-string p0, "p_guide_upload_photo"

    .line 9
    .line 10
    return-object p0
.end method

.method public final u(I)Lcom/p1/mobile/putong/core/data/FakeGoodLifeUserInfo;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/dkb;->Z7()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_1

    .line 10
    .line 11
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 12
    .line 13
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 14
    .line 15
    invoke-virtual {v0}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    iget-object p0, p0, Ll/uyf;->r:Ll/jyf;

    .line 24
    .line 25
    if-eqz v0, :cond_0

    .line 26
    .line 27
    iget-object p0, p0, Ll/jyf;->a:Ljava/util/List;

    .line 28
    .line 29
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    check-cast p0, Lcom/p1/mobile/putong/core/data/FakeGoodLifeUserInfo;

    .line 34
    .line 35
    return-object p0

    .line 36
    :cond_0
    iget-object p0, p0, Ll/jyf;->c:Ljava/util/List;

    .line 37
    .line 38
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    check-cast p0, Lcom/p1/mobile/putong/core/data/FakeGoodLifeUserInfo;

    .line 43
    .line 44
    return-object p0

    .line 45
    :cond_1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 46
    .line 47
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 48
    .line 49
    invoke-virtual {v0}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 54
    .line 55
    .line 56
    move-result v0

    .line 57
    iget-object p0, p0, Ll/uyf;->r:Ll/jyf;

    .line 58
    .line 59
    if-eqz v0, :cond_2

    .line 60
    .line 61
    iget-object p0, p0, Ll/jyf;->b:Ljava/util/List;

    .line 62
    .line 63
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 64
    .line 65
    .line 66
    move-result-object p0

    .line 67
    check-cast p0, Lcom/p1/mobile/putong/core/data/FakeGoodLifeUserInfo;

    .line 68
    .line 69
    return-object p0

    .line 70
    :cond_2
    iget-object p0, p0, Ll/jyf;->d:Ljava/util/List;

    .line 71
    .line 72
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 73
    .line 74
    .line 75
    move-result-object p0

    .line 76
    check-cast p0, Lcom/p1/mobile/putong/core/data/FakeGoodLifeUserInfo;

    .line 77
    .line 78
    return-object p0
.end method

.method public final v()V
    .locals 2

    .line 1
    iget-boolean v0, p0, Ll/uyf;->q:Z

    .line 2
    .line 3
    iget-object v1, p0, Ll/uyf;->e:Landroid/widget/TextView;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    sget v0, Lcom/p1/mobile/putong/core/R$string;->lr:I

    .line 8
    .line 9
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(I)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Ll/uyf;->j:Lv/VText;

    .line 13
    .line 14
    const/4 v1, 0x0

    .line 15
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 16
    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_0
    sget v0, Lcom/p1/mobile/putong/core/R$string;->B6:I

    .line 20
    .line 21
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(I)V

    .line 22
    .line 23
    .line 24
    :goto_0
    iget-object p0, p0, Ll/uyf;->e:Landroid/widget/TextView;

    .line 25
    .line 26
    const/4 v0, 0x0

    .line 27
    const/4 v1, 0x1

    .line 28
    invoke-virtual {p0, v0, v1}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public final w(Lcom/p1/mobile/putong/core/data/FakeGoodLifeUserInfo;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/uyf;->f:Lv/VDraweeView;

    .line 2
    .line 3
    iget v1, p1, Lcom/p1/mobile/putong/core/data/FakeGoodLifeUserInfo;->avatar:I

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/FakeGoodLifeUserInfo;->name:Ljava/lang/String;

    .line 9
    .line 10
    iget p1, p1, Lcom/p1/mobile/putong/core/data/FakeGoodLifeUserInfo;->likeNum:I

    .line 11
    .line 12
    invoke-virtual {p0, v0, p1}, Ll/uyf;->D(Ljava/lang/String;I)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public final x()V
    .locals 3

    .line 1
    new-instance v0, Ll/uyf$c;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/uyf$c;-><init>(Ll/uyf;)V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Ll/uyf;->h:Landroidx/viewpager/widget/ViewPager;

    .line 7
    .line 8
    invoke-virtual {v1, v0}, Landroidx/viewpager/widget/ViewPager;->setAdapter(Ll/cf60;)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Ll/uyf;->i:Lv/VPagerCircleIndicator;

    .line 12
    .line 13
    iget-object v1, p0, Ll/uyf;->h:Landroidx/viewpager/widget/ViewPager;

    .line 14
    .line 15
    invoke-virtual {v1}, Landroidx/viewpager/widget/ViewPager;->getCurrentItem()I

    .line 16
    .line 17
    .line 18
    move-result v2

    .line 19
    invoke-virtual {v0, v1, v2}, Lv/VPagerCircleIndicator;->c(Landroidx/viewpager/widget/ViewPager;I)V

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Ll/uyf;->h:Landroidx/viewpager/widget/ViewPager;

    .line 23
    .line 24
    iget-object p0, p0, Ll/uyf;->t:Landroidx/viewpager/widget/ViewPager$j;

    .line 25
    .line 26
    invoke-virtual {v0, p0}, Landroidx/viewpager/widget/ViewPager;->d(Landroidx/viewpager/widget/ViewPager$j;)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public final synthetic y(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/uyf;->dismiss()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic z(Landroid/view/View;)V
    .locals 3

    .line 1
    const-string p1, "e_guide_upload_photo_button"

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/uyf;->t()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {p1, v0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-static {}, Lcom/p1/mobile/putong/core/newui/fake/b;->r()Lcom/p1/mobile/putong/core/newui/fake/b;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    iget-object v0, p0, Ll/lyf;->a:Lcom/p1/mobile/android/app/Act;

    .line 15
    .line 16
    invoke-static {v0}, Ll/a0g;->E(Lcom/p1/mobile/android/app/Act;)Landroid/content/Intent;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    new-instance v2, Ll/uyf$a;

    .line 21
    .line 22
    invoke-direct {v2, p0}, Ll/uyf$a;-><init>(Ll/uyf;)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {p1, v0, v1, v2}, Lcom/p1/mobile/putong/core/newui/fake/b;->F(Lcom/p1/mobile/android/app/Act;Landroid/content/Intent;Lcom/p1/mobile/putong/core/newui/fake/FakeHoldFragment$a;)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

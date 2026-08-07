.class public abstract Ll/pf2;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Ll/ft5;

.field public b:Ll/ki3;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/ft5;

    .line 5
    .line 6
    invoke-direct {v0}, Ll/ft5;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/pf2;->a:Ll/ft5;

    .line 10
    .line 11
    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/live/livingroom/increment/bullet/DefaultBulletView;Landroid/text/SpannableStringBuilder;Ll/uxj0;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/bullet/DefaultBulletView;->f:Lv/VText;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic b(Ll/pf2;Lcom/p1/mobile/putong/live/livingroom/increment/bullet/DefaultBulletView;Landroid/text/SpannableStringBuilder;Ll/jk20;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/pf2;->n(Lcom/p1/mobile/putong/live/livingroom/increment/bullet/DefaultBulletView;Landroid/text/SpannableStringBuilder;Ll/jk20;)V

    return-void
.end method

.method public static synthetic c(Ll/jk20;Landroid/graphics/Bitmap;)Ll/uxj0;
    .locals 2

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->isRecycled()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getConfig()Landroid/graphics/Bitmap$Config;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    const/4 v1, 0x0

    .line 14
    invoke-virtual {p1, v0, v1}, Landroid/graphics/Bitmap;->copy(Landroid/graphics/Bitmap$Config;Z)Landroid/graphics/Bitmap;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    invoke-virtual {p0, p1}, Ll/jk20;->e(Landroid/graphics/Bitmap;)V

    .line 19
    .line 20
    .line 21
    :cond_0
    sget-object p0, Ll/uxj0;->a:Ll/uxj0;

    .line 22
    .line 23
    return-object p0
.end method


# virtual methods
.method public d(Lcom/p1/mobile/putong/live/livingroom/increment/bullet/DefaultBulletView;)V
    .locals 1

    .line 1
    const/4 v0, 0x2

    .line 2
    invoke-static {v0}, Ll/wft;->b(I)Z

    .line 3
    .line 4
    .line 5
    move-result v0

    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    invoke-virtual {p0, p1}, Ll/pf2;->q(Lcom/p1/mobile/putong/live/livingroom/increment/bullet/DefaultBulletView;)V

    .line 9
    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    iget-object v0, p1, Lcom/p1/mobile/putong/live/livingroom/increment/bullet/DefaultBulletView;->f:Lv/VText;

    .line 13
    .line 14
    invoke-virtual {p0}, Ll/pf2;->i()Ljava/lang/CharSequence;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 19
    .line 20
    .line 21
    iget-object p0, p1, Lcom/p1/mobile/putong/live/livingroom/increment/bullet/DefaultBulletView;->f:Lv/VText;

    .line 22
    .line 23
    const/4 v0, 0x1

    .line 24
    invoke-static {p0, v0}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 25
    .line 26
    .line 27
    iget-object p0, p1, Lcom/p1/mobile/putong/live/livingroom/increment/bullet/DefaultBulletView;->g:Lv/VMarqueeText;

    .line 28
    .line 29
    const/4 p1, 0x0

    .line 30
    invoke-static {p0, p1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method public e(Lcom/p1/mobile/putong/live/livingroom/increment/bullet/SpecialSystemBulletView;)V
    .locals 1

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/live/livingroom/increment/bullet/SpecialSystemBulletView;->e:Lv/VText;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/pf2;->i()Ljava/lang/CharSequence;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 8
    .line 9
    .line 10
    iget-object p0, p1, Lcom/p1/mobile/putong/live/livingroom/increment/bullet/SpecialSystemBulletView;->e:Lv/VText;

    .line 11
    .line 12
    const/4 v0, 0x1

    .line 13
    invoke-static {p0, v0}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 14
    .line 15
    .line 16
    iget-object p0, p1, Lcom/p1/mobile/putong/live/livingroom/increment/bullet/SpecialSystemBulletView;->f:Lv/VMarqueeText;

    .line 17
    .line 18
    const/4 p1, 0x0

    .line 19
    invoke-static {p0, p1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public f(Ll/ki3;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/pf2;->b:Ll/ki3;

    .line 2
    .line 3
    return-void
.end method

.method public g()Ll/oo2;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/pf2;->b:Ll/ki3;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0

    .line 10
    :cond_0
    const-string p0, "presenter \u4e3a\u7a7a\uff0c\u5fc5\u987b\u5148\u7ed1\u5b9a bulletBasePresenter"

    .line 11
    .line 12
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    const/4 p0, 0x0

    .line 16
    return-object p0
.end method

.method public h()Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "bullet content = "

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Ll/pf2;->i()Ljava/lang/CharSequence;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    const-string v1, " userId = "

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    sget-object v1, Ll/uqb0;->b0:Ll/sre0;

    .line 21
    .line 22
    iget-object v1, v1, Ll/sre0;->a:Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 23
    .line 24
    invoke-interface {v1}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    invoke-virtual {p0}, Ll/pf2;->k()Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    return-object p0
.end method

.method public abstract i()Ljava/lang/CharSequence;
.end method

.method public j()Landroid/graphics/drawable/GradientDrawable;
    .locals 2

    .line 1
    const/16 p0, -0x7ad6

    .line 2
    .line 3
    const/16 v0, 0xb

    .line 4
    .line 5
    const v1, -0xc600

    .line 6
    .line 7
    .line 8
    invoke-static {v1, p0, v0}, Ll/fc2;->j(III)Landroid/graphics/drawable/GradientDrawable;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method

.method public final k()Ljava/lang/String;
    .locals 4

    .line 1
    invoke-virtual {p0}, Ll/pf2;->g()Ll/oo2;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    const-string p0, " data is null"

    .line 8
    .line 9
    return-object p0

    .line 10
    :cond_0
    invoke-virtual {v0}, Ll/oo2;->n0()Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    if-eqz v1, :cond_1

    .line 15
    .line 16
    invoke-virtual {v0}, Ll/oo2;->n0()Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->state:Lcom/p1/mobile/putong/live/base/data/BLiveState;

    .line 21
    .line 22
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    goto :goto_0

    .line 27
    :cond_1
    const-string v1, "current live is null"

    .line 28
    .line 29
    :goto_0
    invoke-virtual {v0}, Ll/oo2;->l0()Lcom/p1/mobile/putong/data/User;

    .line 30
    .line 31
    .line 32
    move-result-object v2

    .line 33
    if-eqz v2, :cond_2

    .line 34
    .line 35
    invoke-virtual {v0}, Ll/oo2;->l0()Lcom/p1/mobile/putong/data/User;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    iget-object v0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 40
    .line 41
    goto :goto_1

    .line 42
    :cond_2
    const-string v0, " null "

    .line 43
    .line 44
    :goto_1
    new-instance v2, Ljava/lang/StringBuilder;

    .line 45
    .line 46
    const-string v3, " state = "

    .line 47
    .line 48
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 49
    .line 50
    .line 51
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 52
    .line 53
    .line 54
    const-string v1, " anchorId = "

    .line 55
    .line 56
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 57
    .line 58
    .line 59
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 60
    .line 61
    .line 62
    const-string v0, " roomId = "

    .line 63
    .line 64
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 65
    .line 66
    .line 67
    invoke-virtual {p0}, Ll/pf2;->g()Ll/oo2;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    invoke-virtual {v0}, Ll/vp20;->o()Ljava/lang/String;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 76
    .line 77
    .line 78
    const-string v0, " liveId = "

    .line 79
    .line 80
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 81
    .line 82
    .line 83
    invoke-virtual {p0}, Ll/pf2;->g()Ll/oo2;

    .line 84
    .line 85
    .line 86
    move-result-object v0

    .line 87
    invoke-virtual {v0}, Ll/vp20;->k()Ljava/lang/String;

    .line 88
    .line 89
    .line 90
    move-result-object v0

    .line 91
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 92
    .line 93
    .line 94
    const-string v0, " liveType = "

    .line 95
    .line 96
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 97
    .line 98
    .line 99
    invoke-virtual {p0}, Ll/pf2;->g()Ll/oo2;

    .line 100
    .line 101
    .line 102
    move-result-object p0

    .line 103
    invoke-virtual {p0}, Ll/oo2;->A0()Ljava/lang/String;

    .line 104
    .line 105
    .line 106
    move-result-object p0

    .line 107
    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 108
    .line 109
    .line 110
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 111
    .line 112
    .line 113
    move-result-object p0

    .line 114
    return-object p0
.end method

.method public l()Landroid/text/SpannableStringBuilder;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public m()J
    .locals 2

    .line 1
    const-wide/16 v0, 0xbb8

    .line 2
    .line 3
    return-wide v0
.end method

.method public final synthetic n(Lcom/p1/mobile/putong/live/livingroom/increment/bullet/DefaultBulletView;Landroid/text/SpannableStringBuilder;Ll/jk20;)V
    .locals 3

    .line 1
    invoke-virtual {p3}, Ll/jk20;->d()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    iget-object v0, p0, Ll/pf2;->a:Ll/ft5;

    .line 9
    .line 10
    iget-object p0, p0, Ll/pf2;->b:Ll/ki3;

    .line 11
    .line 12
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-virtual {p3}, Ll/jk20;->c()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    const-string v2, "context_common"

    .line 25
    .line 26
    invoke-static {v2, v1}, Ll/izs;->e(Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    new-instance v2, Ll/nf2;

    .line 31
    .line 32
    invoke-direct {v2, p3}, Ll/nf2;-><init>(Ll/jk20;)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {v1, v2}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 36
    .line 37
    .line 38
    move-result-object p3

    .line 39
    invoke-static {}, Ll/psd0;->C()Lrx/c$d;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    invoke-virtual {p3, v1}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    .line 44
    .line 45
    .line 46
    move-result-object p3

    .line 47
    invoke-virtual {p0, p3}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    new-instance p3, Ll/of2;

    .line 52
    .line 53
    invoke-direct {p3, p1, p2}, Ll/of2;-><init>(Lcom/p1/mobile/putong/live/livingroom/increment/bullet/DefaultBulletView;Landroid/text/SpannableStringBuilder;)V

    .line 54
    .line 55
    .line 56
    invoke-static {p3}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 57
    .line 58
    .line 59
    move-result-object p1

    .line 60
    invoke-virtual {p0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    invoke-virtual {v0, p0}, Ll/ft5;->a(Ll/kcg0;)V

    .line 65
    .line 66
    .line 67
    return-void
.end method

.method public abstract o()V
.end method

.method public p()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/pf2;->a:Ll/ft5;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/ft5;->c()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public q(Lcom/p1/mobile/putong/live/livingroom/increment/bullet/DefaultBulletView;)V
    .locals 4

    .line 1
    invoke-virtual {p0}, Ll/pf2;->l()Landroid/text/SpannableStringBuilder;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    if-eqz v1, :cond_0

    .line 10
    .line 11
    invoke-virtual {v0}, Landroid/text/SpannableStringBuilder;->length()I

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    const-class v2, Ll/jk20;

    .line 16
    .line 17
    const/4 v3, 0x0

    .line 18
    invoke-virtual {v0, v3, v1, v2}, Landroid/text/SpannableStringBuilder;->getSpans(IILjava/lang/Class;)[Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    check-cast v1, [Ll/jk20;

    .line 23
    .line 24
    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    new-instance v2, Ll/mf2;

    .line 29
    .line 30
    invoke-direct {v2, p0, p1, v0}, Ll/mf2;-><init>(Ll/pf2;Lcom/p1/mobile/putong/live/livingroom/increment/bullet/DefaultBulletView;Landroid/text/SpannableStringBuilder;)V

    .line 31
    .line 32
    .line 33
    invoke-static {v1, v2}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 34
    .line 35
    .line 36
    iget-object p0, p1, Lcom/p1/mobile/putong/live/livingroom/increment/bullet/DefaultBulletView;->f:Lv/VText;

    .line 37
    .line 38
    const/4 v0, 0x1

    .line 39
    invoke-static {p0, v0}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 40
    .line 41
    .line 42
    iget-object p0, p1, Lcom/p1/mobile/putong/live/livingroom/increment/bullet/DefaultBulletView;->g:Lv/VMarqueeText;

    .line 43
    .line 44
    invoke-static {p0, v3}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 45
    .line 46
    .line 47
    :cond_0
    return-void
.end method

.method public abstract r(Landroid/view/ViewGroup;Ll/si3;)V
.end method

.method public s()V
    .locals 0

    .line 1
    return-void
.end method

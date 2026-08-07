.class public Ll/dy4;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static A(Landroid/text/SpannableStringBuilder;Ll/gt4;Landroid/widget/TextView;Lcom/p1/mobile/android/app/Act;I)Ljava/util/List;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/text/SpannableStringBuilder;",
            "Ll/gt4;",
            "Landroid/widget/TextView;",
            "Lcom/p1/mobile/android/app/Act;",
            "I)",
            "Ljava/util/List<",
            "Ll/kcg0;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Landroid/text/SpannableStringBuilder;->length()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const-class v1, Ll/rnd0;

    .line 6
    .line 7
    const/4 v2, 0x0

    .line 8
    invoke-virtual {p0, v2, v0, v1}, Landroid/text/SpannableStringBuilder;->getSpans(IILjava/lang/Class;)[Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    check-cast v0, [Ll/rnd0;

    .line 13
    .line 14
    new-instance v7, Ljava/util/ArrayList;

    .line 15
    .line 16
    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    .line 17
    .line 18
    .line 19
    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    new-instance v1, Ll/ux4;

    .line 24
    .line 25
    move-object v6, p0

    .line 26
    move-object v2, p1

    .line 27
    move-object v5, p2

    .line 28
    move-object v3, p3

    .line 29
    move v4, p4

    .line 30
    invoke-direct/range {v1 .. v7}, Ll/ux4;-><init>(Ll/gt4;Lcom/p1/mobile/android/app/Act;ILandroid/widget/TextView;Landroid/text/SpannableStringBuilder;Ljava/util/ArrayList;)V

    .line 31
    .line 32
    .line 33
    invoke-static {v0, v1}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 34
    .line 35
    .line 36
    return-object v7
.end method

.method public static B(Landroid/view/View;)V
    .locals 2

    .line 1
    sget v0, Ll/jdc0;->e0:I

    .line 2
    .line 3
    const-string v1, "loop"

    .line 4
    .line 5
    invoke-virtual {p0, v0, v1}, Landroid/view/View;->setTag(ILjava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    new-instance v0, Ll/qx4;

    .line 9
    .line 10
    invoke-direct {v0, p0}, Ll/qx4;-><init>(Landroid/view/View;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p0, v0}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public static C(Landroid/text/SpannableStringBuilder;Ll/gt4;Landroid/widget/TextView;Lcom/p1/mobile/android/app/Act;)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Landroid/text/SpannableStringBuilder;->length()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const-class v1, Ll/ben0;

    .line 6
    .line 7
    const/4 v2, 0x0

    .line 8
    invoke-virtual {p0, v2, v0, v1}, Landroid/text/SpannableStringBuilder;->getSpans(IILjava/lang/Class;)[Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    check-cast v0, [Ll/ben0;

    .line 13
    .line 14
    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    new-instance v1, Ll/yx4;

    .line 19
    .line 20
    invoke-direct {v1, p1, p3, p2, p0}, Ll/yx4;-><init>(Ll/gt4;Lcom/p1/mobile/android/app/Act;Landroid/widget/TextView;Landroid/text/SpannableStringBuilder;)V

    .line 21
    .line 22
    .line 23
    invoke-static {v0, v1}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public static D(Landroid/graphics/drawable/Drawable;Landroid/widget/TextView;)V
    .locals 1

    .line 1
    instance-of v0, p0, Lcom/p1/mobile/putong/live/base/span/LiveAnimatedWebpSpanDrawable;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    check-cast p0, Lcom/p1/mobile/putong/live/base/span/LiveAnimatedWebpSpanDrawable;

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/base/span/LiveAnimatedWebpSpanDrawable;->e(Landroid/widget/TextView;)V

    .line 8
    .line 9
    .line 10
    invoke-static {p1}, Ll/dy4;->B(Landroid/view/View;)V

    .line 11
    .line 12
    .line 13
    :cond_0
    return-void
.end method

.method public static E(Landroid/widget/TextView;Landroid/text/SpannableStringBuilder;Ll/sce;Ll/ruf0;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/TextView;",
            "Landroid/text/SpannableStringBuilder;",
            "Ll/sce<",
            "*>;",
            "Ll/ruf0;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-virtual {p2, p3}, Ll/sce;->f(Ll/ruf0;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 5
    .line 6
    .line 7
    invoke-static {p3, p0}, Ll/dy4;->D(Landroid/graphics/drawable/Drawable;Landroid/widget/TextView;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public static synthetic a(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 2
    .line 3
    .line 4
    invoke-static {p0}, Ll/dy4;->z(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public static synthetic b(Landroid/widget/TextView;Landroid/text/SpannableStringBuilder;Ll/rnd0;Ll/ruf0;)V
    .locals 0

    .line 1
    invoke-static {p0, p1, p2, p3}, Ll/dy4;->E(Landroid/widget/TextView;Landroid/text/SpannableStringBuilder;Ll/sce;Ll/ruf0;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic c(Landroid/widget/TextView;Landroid/text/SpannableStringBuilder;Ll/t5g;Ll/ruf0;)V
    .locals 0

    .line 1
    invoke-static {p0, p1, p2, p3}, Ll/dy4;->E(Landroid/widget/TextView;Landroid/text/SpannableStringBuilder;Ll/sce;Ll/ruf0;)V

    .line 2
    .line 3
    .line 4
    invoke-static {p3}, Ll/dy4;->u(Ll/ruf0;)Z

    .line 5
    .line 6
    .line 7
    move-result p1

    .line 8
    if-eqz p1, :cond_0

    .line 9
    .line 10
    invoke-static {p0}, Ll/dy4;->z(Landroid/view/View;)V

    .line 11
    .line 12
    .line 13
    :cond_0
    return-void
.end method

.method public static synthetic d(Ll/gt4;Lcom/p1/mobile/android/app/Act;ILandroid/widget/TextView;Landroid/text/SpannableStringBuilder;Ljava/util/ArrayList;Ll/rnd0;)V
    .locals 1

    .line 1
    iget-object v0, p6, Ll/sce;->d:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {v0, p2}, Ll/ivr;->a(Ljava/lang/String;I)Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object p2

    .line 9
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->c(Ll/ner;Lrx/c;)Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-static {}, Ll/psd0;->C()Lrx/c$d;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    invoke-virtual {p0, p1}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    new-instance p1, Ll/by4;

    .line 22
    .line 23
    invoke-direct {p1, p3, p4, p6}, Ll/by4;-><init>(Landroid/widget/TextView;Landroid/text/SpannableStringBuilder;Ll/rnd0;)V

    .line 24
    .line 25
    .line 26
    new-instance p2, Ll/cy4;

    .line 27
    .line 28
    invoke-direct {p2}, Ll/cy4;-><init>()V

    .line 29
    .line 30
    .line 31
    invoke-static {p1, p2}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    invoke-virtual {p0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    invoke-virtual {p5, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 40
    .line 41
    .line 42
    return-void
.end method

.method public static synthetic e(Landroid/widget/TextView;Landroid/text/SpannableStringBuilder;Ll/ben0;Ll/ruf0;)V
    .locals 0

    .line 1
    invoke-static {p0, p1, p2, p3}, Ll/dy4;->E(Landroid/widget/TextView;Landroid/text/SpannableStringBuilder;Ll/sce;Ll/ruf0;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic f(Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;Ll/yql;Landroid/view/View;)V
    .locals 2

    .line 1
    iget p2, p0, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;->actionType:I

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    if-eq p2, v0, :cond_3

    .line 5
    .line 6
    const/4 v0, 0x2

    .line 7
    if-eq p2, v0, :cond_2

    .line 8
    .line 9
    const/4 v0, 0x3

    .line 10
    if-eq p2, v0, :cond_1

    .line 11
    .line 12
    const/4 v0, 0x4

    .line 13
    if-eq p2, v0, :cond_0

    .line 14
    .line 15
    return-void

    .line 16
    :cond_0
    invoke-interface {p1, p0}, Ll/yql;->d(Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;)V

    .line 17
    .line 18
    .line 19
    return-void

    .line 20
    :cond_1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;->menu:Ljava/util/List;

    .line 21
    .line 22
    invoke-interface {p1, p0}, Ll/yql;->f(Ljava/util/List;)V

    .line 23
    .line 24
    .line 25
    return-void

    .line 26
    :cond_2
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;->h5Url:Ljava/lang/String;

    .line 27
    .line 28
    invoke-interface {p1, p0}, Ll/yql;->a(Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    return-void

    .line 32
    :cond_3
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;->liveUserInfo:Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveUserInfo;

    .line 33
    .line 34
    iget-wide v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;->seq:J

    .line 35
    .line 36
    invoke-interface {p1, p2, v0, v1}, Ll/yql;->e(Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveUserInfo;J)V

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public static synthetic g(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic h(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic i(Ll/rnd0;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/sce;->c()Landroid/graphics/drawable/Drawable;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    instance-of v1, v0, Lcom/p1/mobile/putong/live/base/span/LiveAnimatedWebpSpanDrawable;

    .line 6
    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    check-cast v0, Lcom/p1/mobile/putong/live/base/span/LiveAnimatedWebpSpanDrawable;

    .line 10
    .line 11
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/span/LiveAnimatedWebpSpanDrawable;->f()V

    .line 12
    .line 13
    .line 14
    :cond_0
    invoke-virtual {p0}, Ll/sce;->b()V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public static synthetic j(Landroid/view/View;)V
    .locals 1

    .line 1
    sget v0, Ll/jdc0;->e0:I

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Landroid/view/View;->getTag(I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0}, Landroid/view/View;->postInvalidateOnAnimation()V

    .line 13
    .line 14
    .line 15
    invoke-static {p0}, Ll/dy4;->B(Landroid/view/View;)V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public static synthetic k(Ll/gt4;Lcom/p1/mobile/android/app/Act;ILandroid/widget/TextView;Landroid/text/SpannableStringBuilder;Ll/hi20;)V
    .locals 1

    .line 1
    invoke-virtual {p5}, Ll/sce;->e()Z

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
    invoke-virtual {p5}, Ll/sce;->d()Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    check-cast v0, Ljava/lang/String;

    .line 13
    .line 14
    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-static {v0, p2}, Ll/ik20;->e(Ljava/lang/String;I)Lrx/c;

    .line 19
    .line 20
    .line 21
    move-result-object p2

    .line 22
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->c(Ll/ner;Lrx/c;)Lrx/c;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    new-instance p1, Ll/mx4;

    .line 27
    .line 28
    invoke-direct {p1, p3, p4, p5}, Ll/mx4;-><init>(Landroid/widget/TextView;Landroid/text/SpannableStringBuilder;Ll/hi20;)V

    .line 29
    .line 30
    .line 31
    new-instance p2, Ll/nx4;

    .line 32
    .line 33
    invoke-direct {p2}, Ll/nx4;-><init>()V

    .line 34
    .line 35
    .line 36
    invoke-static {p1, p2}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    invoke-virtual {p0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 41
    .line 42
    .line 43
    return-void
.end method

.method public static synthetic l(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic m(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic n(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic o(Ll/gt4;Lcom/p1/mobile/android/app/Act;Landroid/widget/TextView;Landroid/text/SpannableStringBuilder;Ll/ben0;)V
    .locals 1

    .line 1
    invoke-virtual {p4}, Ll/sce;->e()Z

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
    iget-object v0, p4, Ll/sce;->d:Ljava/lang/Object;

    .line 9
    .line 10
    check-cast v0, Ll/nxp;

    .line 11
    .line 12
    invoke-static {v0}, Ll/s5g;->e(Ll/nxp;)Lrx/c;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->c(Ll/ner;Lrx/c;)Lrx/c;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    new-instance p1, Ll/ox4;

    .line 21
    .line 22
    invoke-direct {p1, p2, p3, p4}, Ll/ox4;-><init>(Landroid/widget/TextView;Landroid/text/SpannableStringBuilder;Ll/ben0;)V

    .line 23
    .line 24
    .line 25
    new-instance p2, Ll/px4;

    .line 26
    .line 27
    invoke-direct {p2}, Ll/px4;-><init>()V

    .line 28
    .line 29
    .line 30
    invoke-static {p1, p2}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    invoke-virtual {p0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method public static synthetic p(Landroid/widget/TextView;Ll/gt4;Lcom/p1/mobile/android/app/Act;Landroid/text/SpannableStringBuilder;Ll/t5g;)V
    .locals 1

    .line 1
    invoke-virtual {p4}, Ll/sce;->e()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    invoke-virtual {p4}, Ll/sce;->c()Landroid/graphics/drawable/Drawable;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    instance-of p2, p1, Ll/n5g;

    .line 12
    .line 13
    if-eqz p2, :cond_0

    .line 14
    .line 15
    check-cast p1, Ll/n5g;

    .line 16
    .line 17
    invoke-static {p1}, Ll/dy4;->u(Ll/ruf0;)Z

    .line 18
    .line 19
    .line 20
    move-result p1

    .line 21
    if-eqz p1, :cond_0

    .line 22
    .line 23
    invoke-static {p0}, Ll/dy4;->z(Landroid/view/View;)V

    .line 24
    .line 25
    .line 26
    :cond_0
    return-void

    .line 27
    :cond_1
    iget-object v0, p4, Ll/sce;->d:Ljava/lang/Object;

    .line 28
    .line 29
    check-cast v0, Ll/nxp;

    .line 30
    .line 31
    invoke-static {v0}, Ll/s5g;->e(Ll/nxp;)Lrx/c;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    invoke-virtual {p1, p2, v0}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->c(Ll/ner;Lrx/c;)Lrx/c;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    new-instance p2, Ll/rx4;

    .line 40
    .line 41
    invoke-direct {p2, p0, p3, p4}, Ll/rx4;-><init>(Landroid/widget/TextView;Landroid/text/SpannableStringBuilder;Ll/t5g;)V

    .line 42
    .line 43
    .line 44
    new-instance p0, Ll/sx4;

    .line 45
    .line 46
    invoke-direct {p0}, Ll/sx4;-><init>()V

    .line 47
    .line 48
    .line 49
    invoke-static {p2, p0}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 54
    .line 55
    .line 56
    return-void
.end method

.method public static synthetic q(Landroid/widget/TextView;Landroid/text/SpannableStringBuilder;Ll/z5g;Ll/ruf0;)V
    .locals 0

    .line 1
    invoke-static {p0, p1, p2, p3}, Ll/dy4;->E(Landroid/widget/TextView;Landroid/text/SpannableStringBuilder;Ll/sce;Ll/ruf0;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic r(Landroid/widget/TextView;Landroid/text/SpannableStringBuilder;Ll/hi20;Ll/ruf0;)V
    .locals 0

    .line 1
    invoke-static {p0, p1, p2, p3}, Ll/dy4;->E(Landroid/widget/TextView;Landroid/text/SpannableStringBuilder;Ll/sce;Ll/ruf0;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic s(Ll/yql;Lcom/p1/mobile/android/app/Act;Landroid/widget/TextView;Landroid/text/SpannableStringBuilder;Ll/z5g;)V
    .locals 1

    .line 1
    invoke-virtual {p4}, Ll/sce;->e()Z

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
    invoke-interface {p0}, Ll/yql;->getAdapter()Ll/gt4;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    iget-object v0, p4, Ll/sce;->d:Ljava/lang/Object;

    .line 13
    .line 14
    check-cast v0, Ll/fbg;

    .line 15
    .line 16
    invoke-static {v0}, Ll/vag;->k(Ll/fbg;)Lrx/c;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->c(Ll/ner;Lrx/c;)Lrx/c;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    new-instance p1, Ll/zx4;

    .line 25
    .line 26
    invoke-direct {p1, p2, p3, p4}, Ll/zx4;-><init>(Landroid/widget/TextView;Landroid/text/SpannableStringBuilder;Ll/z5g;)V

    .line 27
    .line 28
    .line 29
    new-instance p2, Ll/ay4;

    .line 30
    .line 31
    invoke-direct {p2}, Ll/ay4;-><init>()V

    .line 32
    .line 33
    .line 34
    invoke-static {p1, p2}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    invoke-virtual {p0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method public static t(Landroid/text/SpannableStringBuilder;Lv/VText;)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Landroid/text/SpannableStringBuilder;->length()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const-class v1, Ll/rnd0;

    .line 6
    .line 7
    const/4 v2, 0x0

    .line 8
    invoke-virtual {p0, v2, v0, v1}, Landroid/text/SpannableStringBuilder;->getSpans(IILjava/lang/Class;)[Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    check-cast p0, [Ll/rnd0;

    .line 13
    .line 14
    invoke-static {p0}, Ll/jyb;->K([Ljava/lang/Object;)Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-eqz v0, :cond_0

    .line 19
    .line 20
    return-void

    .line 21
    :cond_0
    sget v0, Ll/jdc0;->e0:I

    .line 22
    .line 23
    const/4 v1, 0x0

    .line 24
    invoke-virtual {p1, v0, v1}, Landroid/view/View;->setTag(ILjava/lang/Object;)V

    .line 25
    .line 26
    .line 27
    invoke-static {p0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    new-instance p1, Ll/kx4;

    .line 32
    .line 33
    invoke-direct {p1}, Ll/kx4;-><init>()V

    .line 34
    .line 35
    .line 36
    invoke-static {p0, p1}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public static u(Ll/ruf0;)Z
    .locals 1

    .line 1
    instance-of v0, p0, Ll/n5g;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    check-cast p0, Ll/n5g;

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/n5g;->f()Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0

    .line 12
    :cond_0
    const/4 p0, 0x0

    .line 13
    return p0
.end method

.method public static v(Ll/yql;Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;Landroid/view/View;)V
    .locals 1

    .line 1
    new-instance v0, Ll/wx4;

    .line 2
    .line 3
    invoke-direct {v0, p1, p0}, Ll/wx4;-><init>(Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;Ll/yql;)V

    .line 4
    .line 5
    .line 6
    invoke-static {p2, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public static w(Landroid/text/SpannableStringBuilder;Ll/gt4;Landroid/widget/TextView;Lcom/p1/mobile/android/app/Act;)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Landroid/text/SpannableStringBuilder;->length()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const-class v1, Ll/t5g;

    .line 6
    .line 7
    const/4 v2, 0x0

    .line 8
    invoke-virtual {p0, v2, v0, v1}, Landroid/text/SpannableStringBuilder;->getSpans(IILjava/lang/Class;)[Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    check-cast v0, [Ll/t5g;

    .line 13
    .line 14
    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    new-instance v1, Ll/lx4;

    .line 19
    .line 20
    invoke-direct {v1, p2, p1, p3, p0}, Ll/lx4;-><init>(Landroid/widget/TextView;Ll/gt4;Lcom/p1/mobile/android/app/Act;Landroid/text/SpannableStringBuilder;)V

    .line 21
    .line 22
    .line 23
    invoke-static {v0, v1}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public static x(Landroid/text/SpannableStringBuilder;Landroid/widget/TextView;Ll/yql;Lcom/p1/mobile/android/app/Act;)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Landroid/text/SpannableStringBuilder;->length()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const-class v1, Ll/z5g;

    .line 6
    .line 7
    const/4 v2, 0x0

    .line 8
    invoke-virtual {p0, v2, v0, v1}, Landroid/text/SpannableStringBuilder;->getSpans(IILjava/lang/Class;)[Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    check-cast v0, [Ll/z5g;

    .line 13
    .line 14
    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    new-instance v1, Ll/xx4;

    .line 19
    .line 20
    invoke-direct {v1, p2, p3, p1, p0}, Ll/xx4;-><init>(Ll/yql;Lcom/p1/mobile/android/app/Act;Landroid/widget/TextView;Landroid/text/SpannableStringBuilder;)V

    .line 21
    .line 22
    .line 23
    invoke-static {v0, v1}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public static y(Landroid/text/SpannableStringBuilder;Landroid/widget/TextView;Ll/yql;I)V
    .locals 6

    .line 1
    invoke-interface {p2}, Ll/yql;->getAdapter()Ll/gt4;

    .line 2
    .line 3
    .line 4
    move-result-object v1

    .line 5
    invoke-virtual {v1}, Ll/gt4;->act()Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    .line 8
    move-result-object v2

    .line 9
    const/4 p2, 0x2

    .line 10
    invoke-static {p2}, Ll/wft;->b(I)Z

    .line 11
    .line 12
    .line 13
    move-result p2

    .line 14
    if-nez p2, :cond_0

    .line 15
    .line 16
    invoke-static {p0, v1, p1, v2}, Ll/dy4;->w(Landroid/text/SpannableStringBuilder;Ll/gt4;Landroid/widget/TextView;Lcom/p1/mobile/android/app/Act;)V

    .line 17
    .line 18
    .line 19
    invoke-static {p0, v1, p1, v2}, Ll/dy4;->C(Landroid/text/SpannableStringBuilder;Ll/gt4;Landroid/widget/TextView;Lcom/p1/mobile/android/app/Act;)V

    .line 20
    .line 21
    .line 22
    :cond_0
    invoke-virtual {p0}, Landroid/text/SpannableStringBuilder;->length()I

    .line 23
    .line 24
    .line 25
    move-result p2

    .line 26
    const-class v0, Ll/hi20;

    .line 27
    .line 28
    const/4 v3, 0x0

    .line 29
    invoke-virtual {p0, v3, p2, v0}, Landroid/text/SpannableStringBuilder;->getSpans(IILjava/lang/Class;)[Ljava/lang/Object;

    .line 30
    .line 31
    .line 32
    move-result-object p2

    .line 33
    check-cast p2, [Ll/hi20;

    .line 34
    .line 35
    invoke-static {p2}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 36
    .line 37
    .line 38
    move-result-object p2

    .line 39
    new-instance v0, Ll/vx4;

    .line 40
    .line 41
    move-object v5, p0

    .line 42
    move-object v4, p1

    .line 43
    move v3, p3

    .line 44
    invoke-direct/range {v0 .. v5}, Ll/vx4;-><init>(Ll/gt4;Lcom/p1/mobile/android/app/Act;ILandroid/widget/TextView;Landroid/text/SpannableStringBuilder;)V

    .line 45
    .line 46
    .line 47
    invoke-static {p2, v0}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 48
    .line 49
    .line 50
    return-void
.end method

.method public static z(Landroid/view/View;)V
    .locals 1

    .line 1
    new-instance v0, Ll/tx4;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/tx4;-><init>(Landroid/view/View;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 7
    .line 8
    .line 9
    return-void
.end method

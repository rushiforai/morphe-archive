.class public final Ll/jr0;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/jr0$a;,
        Ll/jr0$b;
    }
.end annotation


# direct methods
.method public static synthetic a([IILjava/lang/Runnable;)V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    aget v1, p0, v0

    .line 3
    .line 4
    add-int/lit8 v1, v1, 0x1

    .line 5
    .line 6
    aput v1, p0, v0

    .line 7
    .line 8
    if-lt v1, p1, :cond_0

    .line 9
    .line 10
    if-eqz p2, :cond_0

    .line 11
    .line 12
    invoke-interface {p2}, Ljava/lang/Runnable;->run()V

    .line 13
    .line 14
    .line 15
    :cond_0
    return-void
.end method

.method public static b(Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/item/IntlPrivilegeDescListItem;Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/item/IntlPrivilegeDescListItem;",
            "Ljava/util/List<",
            "Lv/VText;",
            ">;)V"
        }
    .end annotation

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/item/IntlPrivilegeDescListItem;->d:Lv/VText;

    .line 4
    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Landroid/view/View;->getVisibility()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    invoke-virtual {p0}, Landroidx/appcompat/widget/AppCompatTextView;->getText()Ljava/lang/CharSequence;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    invoke-virtual {p0}, Landroidx/appcompat/widget/AppCompatTextView;->getText()Ljava/lang/CharSequence;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-interface {v0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-nez v0, :cond_0

    .line 32
    .line 33
    invoke-interface {p1, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 34
    .line 35
    .line 36
    :cond_0
    return-void
.end method

.method public static c(Lcom/p1/mobile/putong/core/data/PurchaseType;Lcom/p1/mobile/putong/core/data/PurchaseType;Ll/jr0$a;Ljava/lang/Runnable;)V
    .locals 4

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_GET_PRIVILEGE_PACKAGE:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const/4 v2, 0x1

    .line 5
    if-ne p0, v0, :cond_0

    .line 6
    .line 7
    invoke-static {p1}, Ll/wib0;->v(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 8
    .line 9
    .line 10
    move-result v3

    .line 11
    if-eqz v3, :cond_0

    .line 12
    .line 13
    move v3, v2

    .line 14
    goto :goto_0

    .line 15
    :cond_0
    move v3, v1

    .line 16
    :goto_0
    if-ne p1, v0, :cond_2

    .line 17
    .line 18
    if-eqz p0, :cond_2

    .line 19
    .line 20
    sget-object p1, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_GET_VIP:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 21
    .line 22
    if-eq p0, p1, :cond_1

    .line 23
    .line 24
    sget-object p1, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_GET_LIKERS:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 25
    .line 26
    if-ne p0, p1, :cond_2

    .line 27
    .line 28
    :cond_1
    move v1, v2

    .line 29
    :cond_2
    if-nez v3, :cond_3

    .line 30
    .line 31
    if-nez v1, :cond_3

    .line 32
    .line 33
    if-eqz p3, :cond_4

    .line 34
    .line 35
    invoke-interface {p3}, Ljava/lang/Runnable;->run()V

    .line 36
    .line 37
    .line 38
    return-void

    .line 39
    :cond_3
    invoke-static {p2, v3}, Ll/jr0;->d(Ll/jr0$a;Z)Ljava/util/List;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    invoke-interface {p0}, Ljava/util/List;->isEmpty()Z

    .line 44
    .line 45
    .line 46
    move-result p1

    .line 47
    if-eqz p1, :cond_5

    .line 48
    .line 49
    if-eqz p3, :cond_4

    .line 50
    .line 51
    invoke-interface {p3}, Ljava/lang/Runnable;->run()V

    .line 52
    .line 53
    .line 54
    :cond_4
    return-void

    .line 55
    :cond_5
    invoke-static {p2, p0, p3}, Ll/jr0;->h(Ll/jr0$a;Ljava/util/List;Ljava/lang/Runnable;)V

    .line 56
    .line 57
    .line 58
    return-void
.end method

.method public static d(Ll/jr0$a;Z)Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/jr0$a;",
            "Z)",
            "Ljava/util/List<",
            "Lv/VText;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    if-eqz p1, :cond_0

    .line 7
    .line 8
    iget-object p1, p0, Ll/jr0$a;->a:Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/item/IntlPrivilegeDescListItem;

    .line 9
    .line 10
    invoke-static {p1, v0}, Ll/jr0;->b(Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/item/IntlPrivilegeDescListItem;Ljava/util/List;)V

    .line 11
    .line 12
    .line 13
    iget-object p1, p0, Ll/jr0$a;->b:Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/item/IntlPrivilegeDescListItem;

    .line 14
    .line 15
    invoke-static {p1, v0}, Ll/jr0;->b(Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/item/IntlPrivilegeDescListItem;Ljava/util/List;)V

    .line 16
    .line 17
    .line 18
    :cond_0
    iget-object p1, p0, Ll/jr0$a;->c:Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/item/IntlPrivilegeDescListItem;

    .line 19
    .line 20
    invoke-static {p1, v0}, Ll/jr0;->b(Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/item/IntlPrivilegeDescListItem;Ljava/util/List;)V

    .line 21
    .line 22
    .line 23
    iget-object p0, p0, Ll/jr0$a;->d:Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/item/IntlPrivilegeDescListItem;

    .line 24
    .line 25
    invoke-static {p0, v0}, Ll/jr0;->b(Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/item/IntlPrivilegeDescListItem;Ljava/util/List;)V

    .line 26
    .line 27
    .line 28
    return-object v0
.end method

.method public static e(Ll/jr0$b;Z)Landroid/view/animation/AnimationSet;
    .locals 4

    .line 1
    new-instance v0, Landroid/view/animation/AnimationSet;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-direct {v0, v1}, Landroid/view/animation/AnimationSet;-><init>(Z)V

    .line 5
    .line 6
    .line 7
    const/high16 v1, 0x3f800000    # 1.0f

    .line 8
    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    move p1, v1

    .line 12
    goto :goto_0

    .line 13
    :cond_0
    const/high16 p1, -0x40800000    # -1.0f

    .line 14
    .line 15
    :goto_0
    const/4 v2, 0x0

    .line 16
    invoke-static {p1, v2}, Ll/jr0;->g(FF)Landroid/view/animation/TranslateAnimation;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    new-instance v3, Landroid/view/animation/AlphaAnimation;

    .line 21
    .line 22
    invoke-direct {v3, v2, v1}, Landroid/view/animation/AlphaAnimation;-><init>(FF)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {v0, p1}, Landroid/view/animation/AnimationSet;->addAnimation(Landroid/view/animation/Animation;)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {v0, p0}, Landroid/view/animation/AnimationSet;->addAnimation(Landroid/view/animation/Animation;)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {v0, v3}, Landroid/view/animation/AnimationSet;->addAnimation(Landroid/view/animation/Animation;)V

    .line 32
    .line 33
    .line 34
    const-wide/16 p0, 0x28a

    .line 35
    .line 36
    invoke-virtual {v0, p0, p1}, Landroid/view/animation/AnimationSet;->setDuration(J)V

    .line 37
    .line 38
    .line 39
    new-instance p0, Landroid/view/animation/AccelerateDecelerateInterpolator;

    .line 40
    .line 41
    invoke-direct {p0}, Landroid/view/animation/AccelerateDecelerateInterpolator;-><init>()V

    .line 42
    .line 43
    .line 44
    invoke-virtual {v0, p0}, Landroid/view/animation/Animation;->setInterpolator(Landroid/view/animation/Interpolator;)V

    .line 45
    .line 46
    .line 47
    const/4 p0, 0x0

    .line 48
    invoke-virtual {v0, p0}, Landroid/view/animation/AnimationSet;->setFillAfter(Z)V

    .line 49
    .line 50
    .line 51
    return-object v0
.end method

.method public static f(ZZ)Landroid/view/animation/AnimationSet;
    .locals 7

    .line 1
    new-instance v0, Ll/jr0$b;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Ll/jr0$b;-><init>(ZZ)V

    .line 4
    .line 5
    .line 6
    const-wide/16 v1, 0x28a

    .line 7
    .line 8
    invoke-virtual {v0, v1, v2}, Landroid/view/animation/Animation;->setDuration(J)V

    .line 9
    .line 10
    .line 11
    new-instance p0, Landroid/view/animation/AccelerateDecelerateInterpolator;

    .line 12
    .line 13
    invoke-direct {p0}, Landroid/view/animation/AccelerateDecelerateInterpolator;-><init>()V

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, p0}, Landroid/view/animation/Animation;->setInterpolator(Landroid/view/animation/Interpolator;)V

    .line 17
    .line 18
    .line 19
    const/4 p0, 0x0

    .line 20
    invoke-virtual {v0, p0}, Landroid/view/animation/Animation;->setFillAfter(Z)V

    .line 21
    .line 22
    .line 23
    new-instance v3, Landroid/view/animation/AnimationSet;

    .line 24
    .line 25
    const/4 v4, 0x1

    .line 26
    invoke-direct {v3, v4}, Landroid/view/animation/AnimationSet;-><init>(Z)V

    .line 27
    .line 28
    .line 29
    const/high16 v4, 0x3f800000    # 1.0f

    .line 30
    .line 31
    if-eqz p1, :cond_0

    .line 32
    .line 33
    const/high16 p1, -0x40800000    # -1.0f

    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_0
    move p1, v4

    .line 37
    :goto_0
    const/4 v5, 0x0

    .line 38
    invoke-static {v5, p1}, Ll/jr0;->g(FF)Landroid/view/animation/TranslateAnimation;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    new-instance v6, Landroid/view/animation/AlphaAnimation;

    .line 43
    .line 44
    invoke-direct {v6, v4, v5}, Landroid/view/animation/AlphaAnimation;-><init>(FF)V

    .line 45
    .line 46
    .line 47
    invoke-virtual {v3, p1}, Landroid/view/animation/AnimationSet;->addAnimation(Landroid/view/animation/Animation;)V

    .line 48
    .line 49
    .line 50
    invoke-virtual {v3, v0}, Landroid/view/animation/AnimationSet;->addAnimation(Landroid/view/animation/Animation;)V

    .line 51
    .line 52
    .line 53
    invoke-virtual {v3, v6}, Landroid/view/animation/AnimationSet;->addAnimation(Landroid/view/animation/Animation;)V

    .line 54
    .line 55
    .line 56
    invoke-virtual {v3, v1, v2}, Landroid/view/animation/AnimationSet;->setDuration(J)V

    .line 57
    .line 58
    .line 59
    new-instance p1, Landroid/view/animation/AccelerateDecelerateInterpolator;

    .line 60
    .line 61
    invoke-direct {p1}, Landroid/view/animation/AccelerateDecelerateInterpolator;-><init>()V

    .line 62
    .line 63
    .line 64
    invoke-virtual {v3, p1}, Landroid/view/animation/Animation;->setInterpolator(Landroid/view/animation/Interpolator;)V

    .line 65
    .line 66
    .line 67
    invoke-virtual {v3, p0}, Landroid/view/animation/AnimationSet;->setFillAfter(Z)V

    .line 68
    .line 69
    .line 70
    return-object v3
.end method

.method public static g(FF)Landroid/view/animation/TranslateAnimation;
    .locals 9

    .line 1
    new-instance v0, Landroid/view/animation/TranslateAnimation;

    .line 2
    .line 3
    const/4 v5, 0x1

    .line 4
    const/4 v7, 0x1

    .line 5
    const/4 v1, 0x1

    .line 6
    const/4 v2, 0x0

    .line 7
    const/4 v3, 0x1

    .line 8
    const/4 v4, 0x0

    .line 9
    move v6, p0

    .line 10
    move v8, p1

    .line 11
    invoke-direct/range {v0 .. v8}, Landroid/view/animation/TranslateAnimation;-><init>(IFIFIFIF)V

    .line 12
    .line 13
    .line 14
    return-object v0
.end method

.method public static h(Ll/jr0$a;Ljava/util/List;Ljava/lang/Runnable;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/jr0$a;",
            "Ljava/util/List<",
            "Lv/VText;",
            ">;",
            "Ljava/lang/Runnable;",
            ")V"
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    filled-new-array {v0}, [I

    .line 3
    .line 4
    .line 5
    move-result-object v0

    .line 6
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    :cond_0
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 15
    .line 16
    .line 17
    move-result v2

    .line 18
    if-eqz v2, :cond_4

    .line 19
    .line 20
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object v2

    .line 24
    check-cast v2, Lv/VText;

    .line 25
    .line 26
    new-instance v3, Ll/ir0;

    .line 27
    .line 28
    invoke-direct {v3, v0, v1, p2}, Ll/ir0;-><init>([IILjava/lang/Runnable;)V

    .line 29
    .line 30
    .line 31
    iget-object v4, p0, Ll/jr0$a;->a:Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/item/IntlPrivilegeDescListItem;

    .line 32
    .line 33
    if-eqz v4, :cond_1

    .line 34
    .line 35
    iget-object v5, v4, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/item/IntlPrivilegeDescListItem;->d:Lv/VText;

    .line 36
    .line 37
    if-ne v2, v5, :cond_1

    .line 38
    .line 39
    invoke-virtual {v4, v2, v3}, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/item/IntlPrivilegeDescListItem;->f(Lv/VText;Ljava/lang/Runnable;)V

    .line 40
    .line 41
    .line 42
    goto :goto_0

    .line 43
    :cond_1
    iget-object v4, p0, Ll/jr0$a;->b:Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/item/IntlPrivilegeDescListItem;

    .line 44
    .line 45
    if-eqz v4, :cond_2

    .line 46
    .line 47
    iget-object v5, v4, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/item/IntlPrivilegeDescListItem;->d:Lv/VText;

    .line 48
    .line 49
    if-ne v2, v5, :cond_2

    .line 50
    .line 51
    invoke-virtual {v4, v2, v3}, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/item/IntlPrivilegeDescListItem;->f(Lv/VText;Ljava/lang/Runnable;)V

    .line 52
    .line 53
    .line 54
    goto :goto_0

    .line 55
    :cond_2
    iget-object v4, p0, Ll/jr0$a;->c:Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/item/IntlPrivilegeDescListItem;

    .line 56
    .line 57
    if-eqz v4, :cond_3

    .line 58
    .line 59
    iget-object v5, v4, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/item/IntlPrivilegeDescListItem;->d:Lv/VText;

    .line 60
    .line 61
    if-ne v2, v5, :cond_3

    .line 62
    .line 63
    invoke-virtual {v4, v2, v3}, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/item/IntlPrivilegeDescListItem;->f(Lv/VText;Ljava/lang/Runnable;)V

    .line 64
    .line 65
    .line 66
    goto :goto_0

    .line 67
    :cond_3
    iget-object v4, p0, Ll/jr0$a;->d:Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/item/IntlPrivilegeDescListItem;

    .line 68
    .line 69
    if-eqz v4, :cond_0

    .line 70
    .line 71
    iget-object v5, v4, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/item/IntlPrivilegeDescListItem;->d:Lv/VText;

    .line 72
    .line 73
    if-ne v2, v5, :cond_0

    .line 74
    .line 75
    invoke-virtual {v4, v2, v3}, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/item/IntlPrivilegeDescListItem;->f(Lv/VText;Ljava/lang/Runnable;)V

    .line 76
    .line 77
    .line 78
    goto :goto_0

    .line 79
    :cond_4
    return-void
.end method

.method public static i(Landroid/widget/TextSwitcher;)V
    .locals 5

    .line 1
    new-instance v0, Ll/jr0$b;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    const/4 v2, 0x0

    .line 5
    invoke-direct {v0, v1, v2}, Ll/jr0$b;-><init>(ZZ)V

    .line 6
    .line 7
    .line 8
    const-wide/16 v3, 0x28a

    .line 9
    .line 10
    invoke-virtual {v0, v3, v4}, Landroid/view/animation/Animation;->setDuration(J)V

    .line 11
    .line 12
    .line 13
    new-instance v1, Landroid/view/animation/AccelerateDecelerateInterpolator;

    .line 14
    .line 15
    invoke-direct {v1}, Landroid/view/animation/AccelerateDecelerateInterpolator;-><init>()V

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0, v1}, Landroid/view/animation/Animation;->setInterpolator(Landroid/view/animation/Interpolator;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {v0, v2}, Landroid/view/animation/Animation;->setFillAfter(Z)V

    .line 22
    .line 23
    .line 24
    invoke-static {v0, v2}, Ll/jr0;->e(Ll/jr0$b;Z)Landroid/view/animation/AnimationSet;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    invoke-static {v2, v2}, Ll/jr0;->f(ZZ)Landroid/view/animation/AnimationSet;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    invoke-virtual {p0, v0}, Landroid/widget/ViewAnimator;->setInAnimation(Landroid/view/animation/Animation;)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {p0, v1}, Landroid/widget/ViewAnimator;->setOutAnimation(Landroid/view/animation/Animation;)V

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method public static j(Landroid/widget/TextSwitcher;)V
    .locals 4

    .line 1
    new-instance v0, Ll/jr0$b;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-direct {v0, v1, v1}, Ll/jr0$b;-><init>(ZZ)V

    .line 5
    .line 6
    .line 7
    const-wide/16 v2, 0x12c

    .line 8
    .line 9
    invoke-virtual {v0, v2, v3}, Landroid/view/animation/Animation;->setDuration(J)V

    .line 10
    .line 11
    .line 12
    new-instance v2, Landroid/view/animation/AccelerateDecelerateInterpolator;

    .line 13
    .line 14
    invoke-direct {v2}, Landroid/view/animation/AccelerateDecelerateInterpolator;-><init>()V

    .line 15
    .line 16
    .line 17
    invoke-virtual {v0, v2}, Landroid/view/animation/Animation;->setInterpolator(Landroid/view/animation/Interpolator;)V

    .line 18
    .line 19
    .line 20
    const/4 v2, 0x0

    .line 21
    invoke-virtual {v0, v2}, Landroid/view/animation/Animation;->setFillAfter(Z)V

    .line 22
    .line 23
    .line 24
    invoke-static {v0, v1}, Ll/jr0;->e(Ll/jr0$b;Z)Landroid/view/animation/AnimationSet;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    invoke-static {v2, v1}, Ll/jr0;->f(ZZ)Landroid/view/animation/AnimationSet;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    invoke-virtual {p0, v0}, Landroid/widget/ViewAnimator;->setInAnimation(Landroid/view/animation/Animation;)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {p0, v1}, Landroid/widget/ViewAnimator;->setOutAnimation(Landroid/view/animation/Animation;)V

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method public static k(Landroid/widget/TextSwitcher;Z)V
    .locals 0

    .line 1
    if-nez p0, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    if-eqz p1, :cond_1

    .line 5
    .line 6
    invoke-static {p0}, Ll/jr0;->j(Landroid/widget/TextSwitcher;)V

    .line 7
    .line 8
    .line 9
    return-void

    .line 10
    :cond_1
    invoke-static {p0}, Ll/jr0;->i(Landroid/widget/TextSwitcher;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

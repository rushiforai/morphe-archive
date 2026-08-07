.class public Ll/j41;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/google/android/material/tabs/TabLayout$OnTabSelectedListener;


# instance fields
.field public a:Ll/f41;

.field public b:Lcom/p1/mobile/putong/feed/newui/photoalbum/attitude/participant/b;

.field public c:I


# direct methods
.method public constructor <init>(Ll/f41;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Ll/j41;->c:I

    .line 6
    .line 7
    iput-object p1, p0, Ll/j41;->a:Ll/f41;

    .line 8
    .line 9
    return-void
.end method

.method public static synthetic a(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic b(Ll/j41;Lcom/p1/mobile/putong/data/Envelope;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/j41;->e(Lcom/p1/mobile/putong/data/Envelope;)V

    return-void
.end method

.method public static synthetic c(Ll/j41;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/j41;->f(Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public final d(Ljava/util/List;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/AttitudeConfigs;",
            ">;)V"
        }
    .end annotation

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/attitude/participant/b;

    .line 2
    .line 3
    iget-object v1, p0, Ll/j41;->a:Ll/f41;

    .line 4
    .line 5
    iget-object v2, v1, Ll/f41;->f:Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    iget-object v3, v1, Ll/f41;->h:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 8
    .line 9
    invoke-direct {v0, v2, p1, v3, v1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/attitude/participant/b;-><init>(Lcom/p1/mobile/android/app/Act;Ljava/util/List;Lcom/p1/mobile/putong/feed/data/Moment;Ll/f41;)V

    .line 10
    .line 11
    .line 12
    iput-object v0, p0, Ll/j41;->b:Lcom/p1/mobile/putong/feed/newui/photoalbum/attitude/participant/b;

    .line 13
    .line 14
    iget-object v0, p0, Ll/j41;->a:Ll/f41;

    .line 15
    .line 16
    iget-object v0, v0, Ll/f41;->m:Lcom/google/android/material/tabs/TabLayout;

    .line 17
    .line 18
    invoke-virtual {v0, p0}, Lcom/google/android/material/tabs/TabLayout;->addOnTabSelectedListener(Lcom/google/android/material/tabs/TabLayout$OnTabSelectedListener;)V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Ll/j41;->a:Ll/f41;

    .line 22
    .line 23
    iget-object v0, v0, Ll/f41;->n:Lv/VPager;

    .line 24
    .line 25
    iget-object v1, p0, Ll/j41;->b:Lcom/p1/mobile/putong/feed/newui/photoalbum/attitude/participant/b;

    .line 26
    .line 27
    invoke-virtual {v0, v1}, Landroidx/viewpager/widget/ViewPager;->setAdapter(Ll/cf60;)V

    .line 28
    .line 29
    .line 30
    iget-object v0, p0, Ll/j41;->a:Ll/f41;

    .line 31
    .line 32
    iget-object v1, v0, Ll/f41;->m:Lcom/google/android/material/tabs/TabLayout;

    .line 33
    .line 34
    iget-object v0, v0, Ll/f41;->n:Lv/VPager;

    .line 35
    .line 36
    invoke-virtual {v1, v0}, Lcom/google/android/material/tabs/TabLayout;->setupWithViewPager(Landroidx/viewpager/widget/ViewPager;)V

    .line 37
    .line 38
    .line 39
    const/4 v0, 0x0

    .line 40
    move v1, v0

    .line 41
    :goto_0
    iget-object v2, p0, Ll/j41;->a:Ll/f41;

    .line 42
    .line 43
    iget-object v2, v2, Ll/f41;->m:Lcom/google/android/material/tabs/TabLayout;

    .line 44
    .line 45
    invoke-virtual {v2}, Lcom/google/android/material/tabs/TabLayout;->getTabCount()I

    .line 46
    .line 47
    .line 48
    move-result v2

    .line 49
    if-ge v1, v2, :cond_1

    .line 50
    .line 51
    iget-object v2, p0, Ll/j41;->a:Ll/f41;

    .line 52
    .line 53
    iget-object v2, v2, Ll/f41;->m:Lcom/google/android/material/tabs/TabLayout;

    .line 54
    .line 55
    invoke-virtual {v2, v1}, Lcom/google/android/material/tabs/TabLayout;->getTabAt(I)Lcom/google/android/material/tabs/TabLayout$Tab;

    .line 56
    .line 57
    .line 58
    move-result-object v2

    .line 59
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 60
    .line 61
    .line 62
    move-result v2

    .line 63
    if-eqz v2, :cond_0

    .line 64
    .line 65
    iget-object v2, p0, Ll/j41;->a:Ll/f41;

    .line 66
    .line 67
    iget-object v2, v2, Ll/f41;->m:Lcom/google/android/material/tabs/TabLayout;

    .line 68
    .line 69
    invoke-virtual {v2, v1}, Lcom/google/android/material/tabs/TabLayout;->getTabAt(I)Lcom/google/android/material/tabs/TabLayout$Tab;

    .line 70
    .line 71
    .line 72
    move-result-object v2

    .line 73
    iget-object v3, p0, Ll/j41;->b:Lcom/p1/mobile/putong/feed/newui/photoalbum/attitude/participant/b;

    .line 74
    .line 75
    invoke-virtual {v3, v1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/attitude/participant/b;->l(I)Landroid/view/View;

    .line 76
    .line 77
    .line 78
    move-result-object v3

    .line 79
    invoke-virtual {v2, v3}, Lcom/google/android/material/tabs/TabLayout$Tab;->setCustomView(Landroid/view/View;)Lcom/google/android/material/tabs/TabLayout$Tab;

    .line 80
    .line 81
    .line 82
    :cond_0
    add-int/lit8 v1, v1, 0x1

    .line 83
    .line 84
    goto :goto_0

    .line 85
    :cond_1
    move v1, v0

    .line 86
    :goto_1
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 87
    .line 88
    .line 89
    move-result v2

    .line 90
    if-ge v1, v2, :cond_3

    .line 91
    .line 92
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 93
    .line 94
    .line 95
    move-result-object v2

    .line 96
    check-cast v2, Lcom/p1/mobile/putong/feed/data/AttitudeConfigs;

    .line 97
    .line 98
    iget v2, v2, Lcom/p1/mobile/putong/feed/data/AttitudeConfigs;->id:I

    .line 99
    .line 100
    iget-object v3, p0, Ll/j41;->a:Ll/f41;

    .line 101
    .line 102
    iget-object v3, v3, Ll/f41;->h:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 103
    .line 104
    iget v3, v3, Lcom/p1/mobile/putong/feed/data/Moment;->attitudeId:I

    .line 105
    .line 106
    if-ne v2, v3, :cond_2

    .line 107
    .line 108
    goto :goto_2

    .line 109
    :cond_2
    add-int/lit8 v1, v1, 0x1

    .line 110
    .line 111
    goto :goto_1

    .line 112
    :cond_3
    move v1, v0

    .line 113
    :goto_2
    iget-object p1, p0, Ll/j41;->a:Ll/f41;

    .line 114
    .line 115
    iget-object p1, p1, Ll/f41;->n:Lv/VPager;

    .line 116
    .line 117
    new-instance v2, Ll/j41$a;

    .line 118
    .line 119
    invoke-direct {v2, p0}, Ll/j41$a;-><init>(Ll/j41;)V

    .line 120
    .line 121
    .line 122
    invoke-virtual {p1, v2}, Landroidx/viewpager/widget/ViewPager;->d(Landroidx/viewpager/widget/ViewPager$j;)V

    .line 123
    .line 124
    .line 125
    iget-object p0, p0, Ll/j41;->a:Ll/f41;

    .line 126
    .line 127
    iget-object p0, p0, Ll/f41;->n:Lv/VPager;

    .line 128
    .line 129
    invoke-virtual {p0, v1, v0}, Landroidx/viewpager/widget/ViewPager;->T(IZ)V

    .line 130
    .line 131
    .line 132
    return-void
.end method

.method public final synthetic e(Lcom/p1/mobile/putong/data/Envelope;)V
    .locals 0

    .line 1
    iget-object p1, p0, Ll/j41;->a:Ll/f41;

    .line 2
    .line 3
    if-eqz p1, :cond_1

    .line 4
    .line 5
    invoke-virtual {p1}, Landroid/app/Dialog;->isShowing()Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    if-nez p1, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    iget-object p0, p0, Ll/j41;->a:Ll/f41;

    .line 13
    .line 14
    invoke-virtual {p0}, Ll/f41;->dismiss()V

    .line 15
    .line 16
    .line 17
    :cond_1
    :goto_0
    return-void
.end method

.method public final synthetic f(Landroid/view/View;)V
    .locals 5

    .line 1
    const-string p1, "e_attitude_cancel"

    .line 2
    .line 3
    const-string v0, "p_position_user"

    .line 4
    .line 5
    invoke-static {p1, v0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object p1, p0, Ll/j41;->a:Ll/f41;

    .line 9
    .line 10
    iget-object v1, p1, Ll/f41;->f:Lcom/p1/mobile/android/app/Act;

    .line 11
    .line 12
    sget-object v2, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 13
    .line 14
    iget-object p1, p1, Ll/f41;->h:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 15
    .line 16
    iget-object v3, p1, Lcom/p1/mobile/putong/feed/data/Moment;->owner:Ljava/lang/String;

    .line 17
    .line 18
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 19
    .line 20
    const/4 v4, 0x0

    .line 21
    invoke-virtual {v2, v3, p1, v4, v0}, Ll/jka;->Fb(Ljava/lang/String;Ljava/lang/String;ZLjava/lang/String;)Lrx/c;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    invoke-virtual {v1, p1}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    new-instance v0, Ll/h41;

    .line 30
    .line 31
    invoke-direct {v0, p0}, Ll/h41;-><init>(Ll/j41;)V

    .line 32
    .line 33
    .line 34
    new-instance p0, Ll/i41;

    .line 35
    .line 36
    invoke-direct {p0}, Ll/i41;-><init>()V

    .line 37
    .line 38
    .line 39
    invoke-static {v0, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 44
    .line 45
    .line 46
    return-void
.end method

.method public g()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/j41;->a:Ll/f41;

    .line 2
    .line 3
    iget-object v0, v0, Ll/f41;->i:Ljava/util/List;

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Ll/j41;->d(Ljava/util/List;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ll/j41;->a:Ll/f41;

    .line 9
    .line 10
    iget-object v0, v0, Ll/f41;->o:Landroid/view/View;

    .line 11
    .line 12
    new-instance v1, Ll/g41;

    .line 13
    .line 14
    invoke-direct {v1, p0}, Ll/g41;-><init>(Ll/j41;)V

    .line 15
    .line 16
    .line 17
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public onTabReselected(Lcom/google/android/material/tabs/TabLayout$Tab;)V
    .locals 0

    .line 1
    return-void
.end method

.method public onTabSelected(Lcom/google/android/material/tabs/TabLayout$Tab;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Lcom/google/android/material/tabs/TabLayout$Tab;->getPosition()I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    iput p1, p0, Ll/j41;->c:I

    .line 6
    .line 7
    iget-object p1, p0, Ll/j41;->b:Lcom/p1/mobile/putong/feed/newui/photoalbum/attitude/participant/b;

    .line 8
    .line 9
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    if-eqz p1, :cond_0

    .line 14
    .line 15
    iget-object p1, p0, Ll/j41;->b:Lcom/p1/mobile/putong/feed/newui/photoalbum/attitude/participant/b;

    .line 16
    .line 17
    iget p0, p0, Ll/j41;->c:I

    .line 18
    .line 19
    const/4 v0, 0x1

    .line 20
    invoke-virtual {p1, p0, v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/attitude/participant/b;->m(IZ)V

    .line 21
    .line 22
    .line 23
    :cond_0
    return-void
.end method

.method public onTabUnselected(Lcom/google/android/material/tabs/TabLayout$Tab;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/j41;->b:Lcom/p1/mobile/putong/feed/newui/photoalbum/attitude/participant/b;

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
    iget-object p0, p0, Ll/j41;->b:Lcom/p1/mobile/putong/feed/newui/photoalbum/attitude/participant/b;

    .line 10
    .line 11
    invoke-virtual {p1}, Lcom/google/android/material/tabs/TabLayout$Tab;->getPosition()I

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    const/4 v0, 0x0

    .line 16
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/attitude/participant/b;->m(IZ)V

    .line 17
    .line 18
    .line 19
    :cond_0
    return-void
.end method

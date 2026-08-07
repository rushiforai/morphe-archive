.class public Ll/f41;
.super Ll/pej0;
.source "SourceFile"


# instance fields
.field public f:Lcom/p1/mobile/android/app/Act;

.field public g:Ljava/lang/String;

.field public h:Lcom/p1/mobile/putong/feed/data/Moment;

.field public i:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/AttitudeConfigs;",
            ">;"
        }
    .end annotation
.end field

.field public j:Lcom/p1/mobile/putong/data/User;

.field public k:Ll/l4g0;

.field public final l:I

.field public m:Lcom/google/android/material/tabs/TabLayout;

.field public n:Lv/VPager;

.field public o:Landroid/view/View;

.field public p:Lcom/p1/mobile/putong/feed/newui/photoalbum/attitude/participant/BottomSheetNestedProxyView;

.field public q:Ll/j41;

.field public r:Lcom/google/android/material/bottomsheet/BottomSheetBehavior;

.field public s:Lcom/google/android/material/bottomsheet/BottomSheetBehavior$BottomSheetCallback;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/feed/data/Moment;Ljava/util/List;)V
    .locals 1
    .param p1    # Lcom/p1/mobile/android/app/Act;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation

        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation

        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p3    # Lcom/p1/mobile/putong/feed/data/Moment;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation

        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p4    # Ljava/util/List;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation

        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Ljava/lang/String;",
            "Lcom/p1/mobile/putong/feed/data/Moment;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/AttitudeConfigs;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1}, Ll/pej0;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Ll/bnl0;->w0()I

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    mul-int/lit8 v0, v0, 0x7

    .line 9
    .line 10
    div-int/lit8 v0, v0, 0x8

    .line 11
    .line 12
    iput v0, p0, Ll/f41;->l:I

    .line 13
    .line 14
    new-instance v0, Ll/f41$a;

    .line 15
    .line 16
    invoke-direct {v0, p0}, Ll/f41$a;-><init>(Ll/f41;)V

    .line 17
    .line 18
    .line 19
    iput-object v0, p0, Ll/f41;->s:Lcom/google/android/material/bottomsheet/BottomSheetBehavior$BottomSheetCallback;

    .line 20
    .line 21
    invoke-direct {p0, p1}, Ll/f41;->A(Lcom/p1/mobile/android/app/Act;)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {p0, p2, p3, p4}, Ll/f41;->z(Ljava/lang/String;Lcom/p1/mobile/putong/feed/data/Moment;Ljava/util/List;)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method private A(Lcom/p1/mobile/android/app/Act;)V
    .locals 2

    .line 1
    iput-object p1, p0, Ll/f41;->f:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    const-class v0, Landroid/app/Dialog;

    .line 4
    .line 5
    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const-string v1, "p_position_user"

    .line 10
    .line 11
    invoke-static {v1, v0}, Ll/w1e;->c(Ljava/lang/String;Ljava/lang/String;)Ll/l4g0;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iput-object v0, p0, Ll/f41;->k:Ll/l4g0;

    .line 16
    .line 17
    sget v0, Ll/tec0;->E:I

    .line 18
    .line 19
    invoke-virtual {p0, v0}, Lcom/google/android/material/bottomsheet/BottomSheetDialog;->setContentView(I)V

    .line 20
    .line 21
    .line 22
    sget v0, Ll/hdc0;->P1:I

    .line 23
    .line 24
    invoke-virtual {p0, v0}, Ll/nu0;->findViewById(I)Landroid/view/View;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    check-cast v0, Lcom/google/android/material/tabs/TabLayout;

    .line 29
    .line 30
    iput-object v0, p0, Ll/f41;->m:Lcom/google/android/material/tabs/TabLayout;

    .line 31
    .line 32
    sget v0, Ll/hdc0;->k2:I

    .line 33
    .line 34
    invoke-virtual {p0, v0}, Ll/nu0;->findViewById(I)Landroid/view/View;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    check-cast v0, Lv/VPager;

    .line 39
    .line 40
    iput-object v0, p0, Ll/f41;->n:Lv/VPager;

    .line 41
    .line 42
    sget v0, Ll/hdc0;->u:I

    .line 43
    .line 44
    invoke-virtual {p0, v0}, Ll/nu0;->findViewById(I)Landroid/view/View;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    iput-object v0, p0, Ll/f41;->o:Landroid/view/View;

    .line 49
    .line 50
    sget v0, Ll/hdc0;->f1:I

    .line 51
    .line 52
    invoke-virtual {p0, v0}, Ll/nu0;->findViewById(I)Landroid/view/View;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    check-cast v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/attitude/participant/BottomSheetNestedProxyView;

    .line 57
    .line 58
    iput-object v0, p0, Ll/f41;->p:Lcom/p1/mobile/putong/feed/newui/photoalbum/attitude/participant/BottomSheetNestedProxyView;

    .line 59
    .line 60
    new-instance v0, Ll/j41;

    .line 61
    .line 62
    invoke-direct {v0, p0}, Ll/j41;-><init>(Ll/f41;)V

    .line 63
    .line 64
    .line 65
    iput-object v0, p0, Ll/f41;->q:Ll/j41;

    .line 66
    .line 67
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->lifecycle()Lrx/c;

    .line 68
    .line 69
    .line 70
    move-result-object p1

    .line 71
    invoke-virtual {p0, p1}, Ll/pej0;->duringCreated(Lrx/c;)Lrx/c;

    .line 72
    .line 73
    .line 74
    move-result-object p1

    .line 75
    new-instance v0, Ll/d41;

    .line 76
    .line 77
    invoke-direct {v0, p0}, Ll/d41;-><init>(Ll/f41;)V

    .line 78
    .line 79
    .line 80
    invoke-static {v0}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 81
    .line 82
    .line 83
    move-result-object v0

    .line 84
    invoke-virtual {p1, v0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 85
    .line 86
    .line 87
    invoke-static {}, Ll/cn40;->F()Lrx/c;

    .line 88
    .line 89
    .line 90
    move-result-object p1

    .line 91
    invoke-virtual {p0, p1}, Ll/pej0;->duringCreated(Lrx/c;)Lrx/c;

    .line 92
    .line 93
    .line 94
    move-result-object p1

    .line 95
    new-instance v0, Ll/e41;

    .line 96
    .line 97
    invoke-direct {v0, p0}, Ll/e41;-><init>(Ll/f41;)V

    .line 98
    .line 99
    .line 100
    invoke-static {v0}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 101
    .line 102
    .line 103
    move-result-object p0

    .line 104
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 105
    .line 106
    .line 107
    return-void
.end method

.method public static synthetic x(Ll/f41;Lcom/p1/mobile/putong/feed/data/Moment;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/f41;->F(Lcom/p1/mobile/putong/feed/data/Moment;)V

    return-void
.end method

.method public static synthetic y(Ll/f41;Lcom/p1/mobile/android/app/c;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/f41;->E(Lcom/p1/mobile/android/app/c;)V

    return-void
.end method


# virtual methods
.method public final C()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const/4 v1, -0x1

    .line 10
    iput v1, v0, Landroid/view/WindowManager$LayoutParams;->width:I

    .line 11
    .line 12
    iget v1, p0, Ll/f41;->l:I

    .line 13
    .line 14
    iput v1, v0, Landroid/view/WindowManager$LayoutParams;->height:I

    .line 15
    .line 16
    const/16 v1, 0x50

    .line 17
    .line 18
    iput v1, v0, Landroid/view/WindowManager$LayoutParams;->gravity:I

    .line 19
    .line 20
    invoke-virtual {p0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    invoke-virtual {p0, v0}, Landroid/view/Window;->setAttributes(Landroid/view/WindowManager$LayoutParams;)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public final D()Z
    .locals 1

    .line 1
    iget-object v0, p0, Ll/f41;->g:Ljava/lang/String;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    iget-object v0, p0, Ll/f41;->j:Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    iget-object v0, p0, Ll/f41;->h:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 10
    .line 11
    if-eqz v0, :cond_1

    .line 12
    .line 13
    iget-object p0, p0, Ll/f41;->i:Ljava/util/List;

    .line 14
    .line 15
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    if-eqz p0, :cond_0

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    const/4 p0, 0x1

    .line 23
    return p0

    .line 24
    :cond_1
    :goto_0
    const/4 p0, 0x0

    .line 25
    return p0
.end method

.method public final synthetic E(Lcom/p1/mobile/android/app/c;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/android/app/c;->m:Lcom/p1/mobile/android/app/c;

    .line 2
    .line 3
    if-ne p1, v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Landroid/app/Dialog;->isShowing()Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/f41;->dismiss()V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public final synthetic F(Lcom/p1/mobile/putong/feed/data/Moment;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/app/Dialog;->isShowing()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/f41;->dismiss()V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public dismiss()V
    .locals 1

    .line 1
    invoke-super {p0}, Ll/pej0;->dismiss()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/f41;->k:Ll/l4g0;

    .line 5
    .line 6
    invoke-virtual {v0}, Ll/l4g0;->k()V

    .line 7
    .line 8
    .line 9
    iget-object p0, p0, Ll/f41;->k:Ll/l4g0;

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/l4g0;->j()V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public show()V
    .locals 4

    .line 1
    invoke-virtual {p0}, Ll/f41;->D()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    const-string p0, "\u8868\u6001\u53c2\u6570\u5f02\u5e38"

    .line 8
    .line 9
    invoke-static {p0}, Ll/o1j0;->j(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    invoke-super {p0}, Landroid/app/Dialog;->show()V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0}, Ll/f41;->C()V

    .line 17
    .line 18
    .line 19
    sget v0, Ll/vcc0;->E:I

    .line 20
    .line 21
    invoke-virtual {p0, v0}, Ll/nu0;->findViewById(I)Landroid/view/View;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    check-cast v0, Landroid/widget/FrameLayout;

    .line 26
    .line 27
    invoke-static {v0}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->from(Landroid/view/View;)Lcom/google/android/material/bottomsheet/BottomSheetBehavior;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    iput-object v1, p0, Ll/f41;->r:Lcom/google/android/material/bottomsheet/BottomSheetBehavior;

    .line 32
    .line 33
    iget-object v1, p0, Ll/f41;->f:Lcom/p1/mobile/android/app/Act;

    .line 34
    .line 35
    invoke-virtual {v1}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    sget v2, Ll/lbc0;->K0:I

    .line 40
    .line 41
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 46
    .line 47
    .line 48
    iget-object v0, p0, Ll/f41;->r:Lcom/google/android/material/bottomsheet/BottomSheetBehavior;

    .line 49
    .line 50
    const/4 v1, 0x3

    .line 51
    invoke-virtual {v0, v1}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->setState(I)V

    .line 52
    .line 53
    .line 54
    iget-object v0, p0, Ll/f41;->r:Lcom/google/android/material/bottomsheet/BottomSheetBehavior;

    .line 55
    .line 56
    iget-object v1, p0, Ll/f41;->s:Lcom/google/android/material/bottomsheet/BottomSheetBehavior$BottomSheetCallback;

    .line 57
    .line 58
    invoke-virtual {v0, v1}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->setBottomSheetCallback(Lcom/google/android/material/bottomsheet/BottomSheetBehavior$BottomSheetCallback;)V

    .line 59
    .line 60
    .line 61
    iget-object v0, p0, Ll/f41;->r:Lcom/google/android/material/bottomsheet/BottomSheetBehavior;

    .line 62
    .line 63
    const/4 v1, 0x1

    .line 64
    invoke-virtual {v0, v1}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->setSkipCollapsed(Z)V

    .line 65
    .line 66
    .line 67
    iget-object v0, p0, Ll/f41;->r:Lcom/google/android/material/bottomsheet/BottomSheetBehavior;

    .line 68
    .line 69
    iget v1, p0, Ll/f41;->l:I

    .line 70
    .line 71
    invoke-virtual {v0, v1}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->setPeekHeight(I)V

    .line 72
    .line 73
    .line 74
    iget-object v0, p0, Ll/f41;->k:Ll/l4g0;

    .line 75
    .line 76
    const-string v1, "source_page"

    .line 77
    .line 78
    iget-object v2, p0, Ll/f41;->g:Ljava/lang/String;

    .line 79
    .line 80
    invoke-static {v1, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 81
    .line 82
    .line 83
    move-result-object v1

    .line 84
    iget-object v2, p0, Ll/f41;->h:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 85
    .line 86
    iget-object v2, v2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 87
    .line 88
    const-string v3, "moment_id"

    .line 89
    .line 90
    invoke-static {v3, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 91
    .line 92
    .line 93
    move-result-object v2

    .line 94
    filled-new-array {v1, v2}, [Ll/pf60;

    .line 95
    .line 96
    .line 97
    move-result-object v1

    .line 98
    invoke-virtual {v0, v1}, Ll/l4g0;->p([Ll/pf60;)V

    .line 99
    .line 100
    .line 101
    iget-object v0, p0, Ll/f41;->k:Ll/l4g0;

    .line 102
    .line 103
    invoke-virtual {v0}, Ll/l4g0;->i()V

    .line 104
    .line 105
    .line 106
    iget-object v0, p0, Ll/f41;->k:Ll/l4g0;

    .line 107
    .line 108
    invoke-virtual {v0}, Ll/l4g0;->l()V

    .line 109
    .line 110
    .line 111
    iget-object p0, p0, Ll/f41;->q:Ll/j41;

    .line 112
    .line 113
    invoke-virtual {p0}, Ll/j41;->g()V

    .line 114
    .line 115
    .line 116
    return-void
.end method

.method public z(Ljava/lang/String;Lcom/p1/mobile/putong/feed/data/Moment;Ljava/util/List;)V
    .locals 0
    .param p1    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation

        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Lcom/p1/mobile/putong/feed/data/Moment;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation

        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p3    # Ljava/util/List;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation

        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lcom/p1/mobile/putong/feed/data/Moment;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/AttitudeConfigs;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/f41;->g:Ljava/lang/String;

    .line 2
    .line 3
    iput-object p2, p0, Ll/f41;->h:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 4
    .line 5
    iput-object p3, p0, Ll/f41;->i:Ljava/util/List;

    .line 6
    .line 7
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    if-eqz p1, :cond_0

    .line 12
    .line 13
    sget-object p1, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 14
    .line 15
    iget-object p2, p2, Lcom/p1/mobile/putong/feed/data/Moment;->owner:Ljava/lang/String;

    .line 16
    .line 17
    invoke-virtual {p1, p2}, Ll/jka;->e8(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    iput-object p1, p0, Ll/f41;->j:Lcom/p1/mobile/putong/data/User;

    .line 22
    .line 23
    return-void

    .line 24
    :cond_0
    const/4 p1, 0x0

    .line 25
    iput-object p1, p0, Ll/f41;->j:Lcom/p1/mobile/putong/data/User;

    .line 26
    .line 27
    return-void
.end method

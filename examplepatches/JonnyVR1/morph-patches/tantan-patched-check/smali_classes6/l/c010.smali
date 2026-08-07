.class public Ll/c010;
.super Ll/ar2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/ar2<",
        "Ll/g010;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Ljava/lang/Boolean;

.field public b:Ljava/lang/String;

.field public c:Ljava/lang/String;

.field public d:Lcom/p1/mobile/putong/feed/data/Moment;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfileTextAct;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ar2;-><init>(Ll/ner;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic e0(Ll/c010;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/c010;->r0()V

    return-void
.end method

.method public static synthetic f0(Ll/c010;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/c010;->u0(Landroid/os/Bundle;)V

    return-void
.end method

.method public static synthetic g0(Ll/c010;)Lrx/c;
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/c010;->s0()Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic h0(Ll/c010;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/c010;->t0(Ll/uxj0;)V

    return-void
.end method

.method public static synthetic i0(Ll/c010;)Lrx/c;
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/c010;->x0()Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic j0(Lcom/p1/mobile/putong/feed/data/Moment;Ll/vg60;)Ll/pf60;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/data/Moment;->likes:Lcom/p1/mobile/putong/data/PartialIdList;

    .line 2
    .line 3
    iget v0, v0, Lcom/p1/mobile/putong/data/PartialIdList;->count:I

    .line 4
    .line 5
    invoke-virtual {p1}, Ll/vg60;->d()I

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    add-int/2addr v0, p1

    .line 10
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    invoke-static {p0, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    return-object p0
.end method

.method public static synthetic k0(Ll/c010;)Lcom/p1/mobile/putong/feed/data/Moment;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/c010;->q0()Lcom/p1/mobile/putong/feed/data/Moment;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic l0(Ll/c010;Ll/pf60;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/c010;->y0(Ll/pf60;)V

    return-void
.end method

.method private synthetic s0()Lrx/c;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/c010;->c:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {p0}, Ll/mrb0;->a(Ljava/lang/String;)Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method private synthetic t0(Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method private synthetic u0(Landroid/os/Bundle;)V
    .locals 1

    .line 1
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p1, Ll/g010;

    .line 4
    .line 5
    invoke-virtual {p1}, Ll/g010;->r()V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Ll/c010;->o0()Z

    .line 9
    .line 10
    .line 11
    move-result p1

    .line 12
    if-eqz p1, :cond_0

    .line 13
    .line 14
    new-instance p1, Ll/zz00;

    .line 15
    .line 16
    invoke-direct {p1, p0}, Ll/zz00;-><init>(Ll/c010;)V

    .line 17
    .line 18
    .line 19
    const/4 v0, 0x0

    .line 20
    invoke-virtual {p0, p1, v0}, Ll/ar2;->duringCreated(Ll/pcj;Z)Lrx/c;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    new-instance v0, Ll/a010;

    .line 25
    .line 26
    invoke-direct {v0, p0}, Ll/a010;-><init>(Ll/c010;)V

    .line 27
    .line 28
    .line 29
    invoke-static {v0}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 34
    .line 35
    .line 36
    :cond_0
    return-void
.end method

.method private synthetic x0()Lrx/c;
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->c:Lcom/p1/mobile/putong/feed/api/b;

    .line 2
    .line 3
    iget-object v1, p0, Ll/c010;->b:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/feed/api/b;->W3(Ljava/lang/String;)Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    sget-object v1, Lcom/p1/mobile/putong/feed/FeedModule;->c:Lcom/p1/mobile/putong/feed/api/b;

    .line 10
    .line 11
    iget-object p0, p0, Ll/c010;->b:Ljava/lang/String;

    .line 12
    .line 13
    invoke-virtual {v1, p0}, Lcom/p1/mobile/putong/feed/api/b;->c3(Ljava/lang/String;)Lrx/c;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    new-instance v1, Ll/b010;

    .line 18
    .line 19
    invoke-direct {v1}, Ll/b010;-><init>()V

    .line 20
    .line 21
    .line 22
    invoke-static {v0, p0, v1}, Ll/psd0;->r(Lrx/c;Lrx/c;Ll/rcj;)Lrx/c;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    return-object p0
.end method

.method private synthetic y0(Ll/pf60;)V
    .locals 1

    .line 1
    iget-object v0, p1, Ll/pf60;->a:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Lcom/p1/mobile/putong/feed/data/Moment;

    .line 4
    .line 5
    iput-object v0, p0, Ll/c010;->d:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 6
    .line 7
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 8
    .line 9
    check-cast p0, Ll/g010;

    .line 10
    .line 11
    iget-object p1, p1, Ll/pf60;->b:Ljava/lang/Object;

    .line 12
    .line 13
    check-cast p1, Ljava/lang/Integer;

    .line 14
    .line 15
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 16
    .line 17
    .line 18
    move-result p1

    .line 19
    invoke-virtual {p0, v0, p1}, Ll/g010;->f(Lcom/p1/mobile/putong/feed/data/Moment;I)V

    .line 20
    .line 21
    .line 22
    return-void
.end method


# virtual methods
.method public A0()Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/c010;->b:Ljava/lang/String;

    .line 2
    .line 3
    sget-object v0, Ll/og3;->c:Ll/og3;

    .line 4
    .line 5
    const-string v1, "moment id"

    .line 6
    .line 7
    filled-new-array {v1, p0, v0}, [Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-static {p0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public a0()V
    .locals 2

    .line 1
    new-instance v0, Ll/wz00;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/wz00;-><init>(Ll/c010;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Ll/ar2;->creates(Ll/y20;)V

    .line 7
    .line 8
    .line 9
    new-instance v0, Ll/xz00;

    .line 10
    .line 11
    invoke-direct {v0, p0}, Ll/xz00;-><init>(Ll/c010;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Ll/pcj;)Lrx/c;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    new-instance v1, Ll/yz00;

    .line 19
    .line 20
    invoke-direct {v1, p0}, Ll/yz00;-><init>(Ll/c010;)V

    .line 21
    .line 22
    .line 23
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public m0(Landroid/view/Menu;)V
    .locals 14

    .line 1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v2, p0, Ll/c010;->c:Ljava/lang/String;

    .line 6
    .line 7
    new-instance v3, Ll/uz00;

    .line 8
    .line 9
    invoke-direct {v3, p0}, Ll/uz00;-><init>(Ll/c010;)V

    .line 10
    .line 11
    .line 12
    new-instance v6, Ll/vz00;

    .line 13
    .line 14
    invoke-direct {v6, p0}, Ll/vz00;-><init>(Ll/c010;)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p0}, Ll/c010;->o0()Z

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    if-nez v1, :cond_1

    .line 22
    .line 23
    invoke-virtual {p0}, Ll/c010;->p0()Z

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    if-eqz v1, :cond_0

    .line 28
    .line 29
    goto :goto_1

    .line 30
    :cond_0
    const/4 v1, 0x0

    .line 31
    :goto_0
    move v11, v1

    .line 32
    goto :goto_2

    .line 33
    :cond_1
    :goto_1
    const/4 v1, 0x1

    .line 34
    goto :goto_0

    .line 35
    :goto_2
    invoke-virtual {p0}, Ll/c010;->o0()Z

    .line 36
    .line 37
    .line 38
    move-result v12

    .line 39
    const/4 v13, 0x0

    .line 40
    const/4 v4, 0x0

    .line 41
    const/4 v5, 0x0

    .line 42
    const/4 v7, 0x0

    .line 43
    const/4 v8, 0x0

    .line 44
    const/4 v9, 0x0

    .line 45
    const/4 v10, 0x0

    .line 46
    move-object v1, p1

    .line 47
    invoke-static/range {v0 .. v13}, Ll/k3h;->F0(Lcom/p1/mobile/android/app/Act;Landroid/view/Menu;Ljava/lang/String;Ll/pcj;Ll/pcj;Ll/x20;Ll/x20;Ll/y20;Ll/y20;Ll/y20;ZZZZ)Landroid/view/Menu;

    .line 48
    .line 49
    .line 50
    :try_start_0
    sget-object p1, Lcom/p1/mobile/android/app/Act;->TOOLBAR_MENU_VIEW_FILED:Ljava/lang/reflect/Field;

    .line 51
    .line 52
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->toolbar()Landroidx/appcompat/widget/Toolbar;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    invoke-virtual {p1, v0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 61
    .line 62
    .line 63
    move-result-object p1

    .line 64
    check-cast p1, Landroidx/appcompat/widget/ActionMenuView;

    .line 65
    .line 66
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 67
    .line 68
    .line 69
    move-result-object p0

    .line 70
    invoke-virtual {p0}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 71
    .line 72
    .line 73
    move-result-object p0

    .line 74
    sget v0, Ll/lbc0;->b2:I

    .line 75
    .line 76
    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 77
    .line 78
    .line 79
    move-result-object p0

    .line 80
    invoke-virtual {p1, p0}, Landroidx/appcompat/widget/ActionMenuView;->setOverflowIcon(Landroid/graphics/drawable/Drawable;)V
    :try_end_0
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_0

    .line 81
    .line 82
    .line 83
    return-void

    .line 84
    :catch_0
    move-exception v0

    .line 85
    move-object p0, v0

    .line 86
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 87
    .line 88
    .line 89
    return-void
.end method

.method public n0()Landroid/graphics/drawable/Drawable;
    .locals 8

    .line 1
    const/16 p0, 0x64

    .line 2
    .line 3
    new-array v0, p0, [I

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    :goto_0
    if-ge v1, p0, :cond_0

    .line 7
    .line 8
    rsub-int/lit8 v2, v1, 0x64

    .line 9
    .line 10
    int-to-double v2, v2

    .line 11
    const-wide/high16 v4, 0x4000000000000000L    # 2.0

    .line 12
    .line 13
    invoke-static {v2, v3, v4, v5}, Ljava/lang/Math;->pow(DD)D

    .line 14
    .line 15
    .line 16
    move-result-wide v2

    .line 17
    const-wide v6, 0x406fe00000000000L    # 255.0

    .line 18
    .line 19
    .line 20
    .line 21
    .line 22
    mul-double/2addr v2, v6

    .line 23
    const-wide/high16 v6, 0x4059000000000000L    # 100.0

    .line 24
    .line 25
    invoke-static {v6, v7, v4, v5}, Ljava/lang/Math;->pow(DD)D

    .line 26
    .line 27
    .line 28
    move-result-wide v4

    .line 29
    div-double/2addr v2, v4

    .line 30
    double-to-int v2, v2

    .line 31
    const/16 v3, 0xff

    .line 32
    .line 33
    invoke-static {v2, v3, v3, v3}, Landroid/graphics/Color;->argb(IIII)I

    .line 34
    .line 35
    .line 36
    move-result v2

    .line 37
    aput v2, v0, v1

    .line 38
    .line 39
    add-int/lit8 v1, v1, 0x1

    .line 40
    .line 41
    goto :goto_0

    .line 42
    :cond_0
    new-instance p0, Landroid/graphics/drawable/GradientDrawable;

    .line 43
    .line 44
    sget-object v1, Landroid/graphics/drawable/GradientDrawable$Orientation;->BOTTOM_TOP:Landroid/graphics/drawable/GradientDrawable$Orientation;

    .line 45
    .line 46
    invoke-direct {p0, v1, v0}, Landroid/graphics/drawable/GradientDrawable;-><init>(Landroid/graphics/drawable/GradientDrawable$Orientation;[I)V

    .line 47
    .line 48
    .line 49
    return-object p0
.end method

.method public o0()Z
    .locals 1

    .line 1
    iget-object v0, p0, Ll/c010;->a:Ljava/lang/Boolean;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Ll/c010;->c:Ljava/lang/String;

    .line 6
    .line 7
    invoke-static {v0}, Ll/mrb0;->z(Ljava/lang/String;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iput-object v0, p0, Ll/c010;->a:Ljava/lang/Boolean;

    .line 16
    .line 17
    :cond_0
    iget-object p0, p0, Ll/c010;->a:Ljava/lang/Boolean;

    .line 18
    .line 19
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    return p0
.end method

.method public p0()Z
    .locals 1

    .line 1
    iget-object p0, p0, Ll/c010;->c:Ljava/lang/String;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->F()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-interface {v0}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    if-eqz p0, :cond_0

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

.method public final synthetic q0()Lcom/p1/mobile/putong/feed/data/Moment;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/c010;->d:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 2
    .line 3
    return-object p0
.end method

.method public final synthetic r0()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public z0(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/c010;->b:Ljava/lang/String;

    .line 2
    .line 3
    iput-object p2, p0, Ll/c010;->c:Ljava/lang/String;

    .line 4
    .line 5
    return-void
.end method

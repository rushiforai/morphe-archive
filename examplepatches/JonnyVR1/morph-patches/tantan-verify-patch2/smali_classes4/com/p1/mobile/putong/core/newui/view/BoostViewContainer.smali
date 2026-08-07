.class public Lcom/p1/mobile/putong/core/newui/view/BoostViewContainer;
.super Landroid/widget/RelativeLayout;
.source "SourceFile"


# instance fields
.field public a:Ll/sa3;

.field public b:Ll/n63;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    .line 84
    invoke-direct {p0, p1, v0}, Lcom/p1/mobile/putong/core/newui/view/BoostViewContainer;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    .line 83
    invoke-direct {p0, p1, p2, v0}, Lcom/p1/mobile/putong/core/newui/view/BoostViewContainer;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 2

    .line 1
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 2
    .line 3
    .line 4
    sget-object v0, Ll/nhc0;->a:[I

    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    invoke-virtual {p1, p2, v0, p3, v1}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    .line 8
    .line 9
    .line 10
    move-result-object p2

    .line 11
    sget p3, Ll/nhc0;->b:I

    .line 12
    .line 13
    invoke-virtual {p2, p3, v1}, Landroid/content/res/TypedArray;->getInt(II)I

    .line 14
    .line 15
    .line 16
    move-result p3

    .line 17
    sget v0, Ll/nhc0;->c:I

    .line 18
    .line 19
    const/4 v1, 0x1

    .line 20
    invoke-virtual {p2, v0, v1}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    invoke-virtual {p2}, Landroid/content/res/TypedArray;->recycle()V

    .line 25
    .line 26
    .line 27
    invoke-static {p1}, Ll/bnl0;->D(Landroid/content/Context;)Landroid/app/Activity;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    instance-of p2, p1, Lcom/p1/mobile/android/app/Act;

    .line 32
    .line 33
    if-eqz p2, :cond_1

    .line 34
    .line 35
    new-instance p2, Ll/sa3;

    .line 36
    .line 37
    check-cast p1, Lcom/p1/mobile/android/app/Act;

    .line 38
    .line 39
    invoke-direct {p2, p1, p0, p3, v0}, Ll/sa3;-><init>(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/newui/view/BoostViewContainer;IZ)V

    .line 40
    .line 41
    .line 42
    iput-object p2, p0, Lcom/p1/mobile/putong/core/newui/view/BoostViewContainer;->a:Ll/sa3;

    .line 43
    .line 44
    invoke-static {}, Ll/ric0;->m()Z

    .line 45
    .line 46
    .line 47
    move-result p2

    .line 48
    if-eqz p2, :cond_0

    .line 49
    .line 50
    invoke-virtual {p0, p3}, Lcom/p1/mobile/putong/core/newui/view/BoostViewContainer;->c(I)Z

    .line 51
    .line 52
    .line 53
    move-result p2

    .line 54
    if-eqz p2, :cond_0

    .line 55
    .line 56
    new-instance p2, Ll/ea;

    .line 57
    .line 58
    iget-object p3, p0, Lcom/p1/mobile/putong/core/newui/view/BoostViewContainer;->a:Ll/sa3;

    .line 59
    .line 60
    invoke-direct {p2, p1, p3}, Ll/ea;-><init>(Lcom/p1/mobile/android/app/Act;Ll/sa3;)V

    .line 61
    .line 62
    .line 63
    iput-object p2, p0, Lcom/p1/mobile/putong/core/newui/view/BoostViewContainer;->b:Ll/n63;

    .line 64
    .line 65
    return-void

    .line 66
    :cond_0
    new-instance p2, Ll/u93;

    .line 67
    .line 68
    iget-object p3, p0, Lcom/p1/mobile/putong/core/newui/view/BoostViewContainer;->a:Ll/sa3;

    .line 69
    .line 70
    invoke-direct {p2, p1, p3}, Ll/u93;-><init>(Lcom/p1/mobile/android/app/Act;Ll/sa3;)V

    .line 71
    .line 72
    .line 73
    iput-object p2, p0, Lcom/p1/mobile/putong/core/newui/view/BoostViewContainer;->b:Ll/n63;

    .line 74
    .line 75
    return-void

    .line 76
    :cond_1
    const-string p0, "\u5f02\u5e38\u7684\u4e0a\u4e0b\u6587\u7c7b\u578b\uff0cBoostView\u4ec5\u652f\u6301\u5728Act\u53ca\u5176\u5b50\u7c7b\u4e2d\u4f7f\u7528\uff01"

    .line 77
    .line 78
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 79
    .line 80
    .line 81
    const/4 p0, 0x0

    .line 82
    throw p0
.end method


# virtual methods
.method public a(Ll/na3;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/view/BoostViewContainer;->b:Ll/n63;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/n63;->c(Ll/na3;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public b(Ll/y20;Ll/vcj;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/y20<",
            "Landroid/view/View;",
            ">;",
            "Ll/vcj<",
            "Landroid/graphics/drawable/Drawable;",
            "Ljava/lang/CharSequence;",
            "Ljava/lang/Integer;",
            "Ljava/lang/Integer;",
            "Ljava/lang/Integer;",
            "Ljava/lang/Boolean;",
            "Landroid/view/View;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/view/BoostViewContainer;->a:Ll/sa3;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ll/sa3;->d(Ll/y20;Ll/vcj;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final c(I)Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    if-ne p1, p0, :cond_0

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method public d(Landroid/widget/FrameLayout;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/view/BoostViewContainer;->b:Ll/n63;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/view/BoostViewContainer;->getBoostButton()Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {v0, p1, p0}, Ll/n63;->m(Landroid/widget/FrameLayout;Landroid/view/View;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public e(Lcom/p1/mobile/android/app/Act;Ll/x20;Ll/pcj;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Ll/x20;",
            "Ll/pcj<",
            "Ljava/lang/Boolean;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/view/BoostViewContainer;->b:Ll/n63;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3}, Ll/n63;->n(Lcom/p1/mobile/android/app/Act;Ll/x20;Ll/pcj;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public f()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/view/BoostViewContainer;->b:Ll/n63;

    .line 2
    .line 3
    invoke-virtual {v0, p0}, Ll/n63;->o(Lcom/p1/mobile/putong/core/newui/view/BoostViewContainer;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public g(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/view/BoostViewContainer;->b:Ll/n63;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/n63;->p(Z)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public getBoostButton()Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/view/BoostViewContainer;->a:Ll/sa3;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/sa3;->b()Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getBoostHeartScene()Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/view/BoostViewContainer;->a:Ll/sa3;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/sa3;->c()Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public setFromCallback(Ll/pcj;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/pcj<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/view/BoostViewContainer;->b:Ll/n63;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/n63;->k(Ll/pcj;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setIconWidth(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/view/BoostViewContainer;->a:Ll/sa3;

    .line 2
    .line 3
    invoke-virtual {v0, p0, p1}, Ll/sa3;->f(Landroid/view/View;I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setImageResource(I)V
    .locals 0
    .param p1    # I
        .annotation build Landroidx/annotation/DrawableRes;
        .end annotation
    .end param

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/view/BoostViewContainer;->a:Ll/sa3;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/sa3;->g(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setInterceptFunc(Ll/pcj;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/pcj<",
            "Ljava/lang/Boolean;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/view/BoostViewContainer;->b:Ll/n63;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/n63;->l(Ll/pcj;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setSceneView(Lcom/sunshine/engine/particle/SceneView;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/view/BoostViewContainer;->a:Ll/sa3;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/sa3;->h(Lcom/sunshine/engine/particle/SceneView;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

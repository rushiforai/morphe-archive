.class public Lv/VFrame_Anim;
.super Lv/VFrame;
.source "SourceFile"


# instance fields
.field public a:Landroid/view/View;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lv/VFrame;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 5
    invoke-direct {p0, p1, p2}, Lv/VFrame;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 6
    invoke-direct {p0, p1, p2, p3}, Lv/VFrame;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static synthetic p(Landroid/view/View;)V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-virtual {p0, v0}, Landroid/view/View;->setClickable(Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public static synthetic s(Landroid/view/View;)V
    .locals 1

    .line 1
    const/4 v0, 0x4

    .line 2
    invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public static synthetic u(Ll/qcj;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-interface {p0, p1}, Ll/qcj;->call(Ljava/lang/Object;)Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Landroid/view/ViewPropertyAnimator;

    .line 6
    .line 7
    invoke-virtual {p0}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public static synthetic v(Landroid/view/View;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public static synthetic w(Lv/VFrame_Anim;Ll/qcj;ZLandroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lv/VFrame_Anim;->z(Ll/qcj;ZLandroid/view/View;)V

    return-void
.end method


# virtual methods
.method public B(Landroid/view/View;Ll/y20;Ll/y20;Z)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/view/View;",
            "Ll/y20<",
            "Landroid/view/View;",
            ">;",
            "Ll/y20<",
            "Landroid/view/View;",
            ">;Z)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lv/VFrame_Anim;->a:Landroid/view/View;

    .line 2
    .line 3
    if-eq v0, p1, :cond_6

    .line 4
    .line 5
    iput-object p1, p0, Lv/VFrame_Anim;->a:Landroid/view/View;

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    move v1, v0

    .line 9
    :goto_0
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 10
    .line 11
    .line 12
    move-result v2

    .line 13
    if-ge v1, v2, :cond_6

    .line 14
    .line 15
    invoke-virtual {p0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    if-nez p4, :cond_1

    .line 20
    .line 21
    invoke-virtual {v2}, Landroid/view/View;->hasOnClickListeners()Z

    .line 22
    .line 23
    .line 24
    move-result v3

    .line 25
    if-eqz v3, :cond_0

    .line 26
    .line 27
    goto :goto_1

    .line 28
    :cond_0
    move v3, v0

    .line 29
    goto :goto_2

    .line 30
    :cond_1
    :goto_1
    const/4 v3, 0x1

    .line 31
    :goto_2
    if-ne p1, v2, :cond_3

    .line 32
    .line 33
    invoke-virtual {v2, v0}, Landroid/view/View;->setVisibility(I)V

    .line 34
    .line 35
    .line 36
    if-eqz v3, :cond_2

    .line 37
    .line 38
    new-instance v3, Ll/wxk0;

    .line 39
    .line 40
    invoke-direct {v3, v2}, Ll/wxk0;-><init>(Landroid/view/View;)V

    .line 41
    .line 42
    .line 43
    invoke-virtual {v2, v3}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 44
    .line 45
    .line 46
    :cond_2
    invoke-interface {p2, v2}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 47
    .line 48
    .line 49
    goto :goto_3

    .line 50
    :cond_3
    invoke-virtual {v2}, Landroid/view/View;->getVisibility()I

    .line 51
    .line 52
    .line 53
    move-result v4

    .line 54
    if-nez v4, :cond_5

    .line 55
    .line 56
    invoke-virtual {v2, v0}, Landroid/view/View;->setPressed(Z)V

    .line 57
    .line 58
    .line 59
    if-eqz v3, :cond_4

    .line 60
    .line 61
    invoke-virtual {v2, v0}, Landroid/view/View;->setClickable(Z)V

    .line 62
    .line 63
    .line 64
    :cond_4
    invoke-interface {p3, v2}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 65
    .line 66
    .line 67
    :cond_5
    :goto_3
    add-int/lit8 v1, v1, 0x1

    .line 68
    .line 69
    goto :goto_0

    .line 70
    :cond_6
    return-void
.end method

.method public C(Landroid/view/View;Ll/qcj;Ll/qcj;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/view/View;",
            "Ll/qcj<",
            "Landroid/view/View;",
            "Landroid/view/ViewPropertyAnimator;",
            ">;",
            "Ll/qcj<",
            "Landroid/view/View;",
            "Landroid/view/ViewPropertyAnimator;",
            ">;)V"
        }
    .end annotation

    .line 1
    const/4 v4, 0x0

    .line 2
    const/4 v5, 0x1

    .line 3
    move-object v0, p0

    .line 4
    move-object v1, p1

    .line 5
    move-object v2, p2

    .line 6
    move-object v3, p3

    .line 7
    invoke-virtual/range {v0 .. v5}, Lv/VFrame_Anim;->E(Landroid/view/View;Ll/qcj;Ll/qcj;ZZ)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public E(Landroid/view/View;Ll/qcj;Ll/qcj;ZZ)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/view/View;",
            "Ll/qcj<",
            "Landroid/view/View;",
            "Landroid/view/ViewPropertyAnimator;",
            ">;",
            "Ll/qcj<",
            "Landroid/view/View;",
            "Landroid/view/ViewPropertyAnimator;",
            ">;ZZ)V"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/uxk0;

    .line 2
    .line 3
    invoke-direct {v0, p2}, Ll/uxk0;-><init>(Ll/qcj;)V

    .line 4
    .line 5
    .line 6
    new-instance p2, Ll/vxk0;

    .line 7
    .line 8
    invoke-direct {p2, p0, p3, p4}, Ll/vxk0;-><init>(Lv/VFrame_Anim;Ll/qcj;Z)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0, p1, v0, p2, p5}, Lv/VFrame_Anim;->B(Landroid/view/View;Ll/y20;Ll/y20;Z)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public F(Landroid/view/View;Ll/qcj;Ll/qcj;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/view/View;",
            "Ll/qcj<",
            "Landroid/view/View;",
            "Landroid/view/ViewPropertyAnimator;",
            ">;",
            "Ll/qcj<",
            "Landroid/view/View;",
            "Landroid/view/ViewPropertyAnimator;",
            ">;)V"
        }
    .end annotation

    .line 1
    const/4 v4, 0x0

    .line 2
    const/4 v5, 0x0

    .line 3
    move-object v0, p0

    .line 4
    move-object v1, p1

    .line 5
    move-object v2, p2

    .line 6
    move-object v3, p3

    .line 7
    invoke-virtual/range {v0 .. v5}, Lv/VFrame_Anim;->E(Landroid/view/View;Ll/qcj;Ll/qcj;ZZ)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public G(Landroid/view/View;)V
    .locals 3

    .line 1
    new-instance v0, Ll/sxk0;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/sxk0;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance v1, Ll/txk0;

    .line 7
    .line 8
    invoke-direct {v1}, Ll/txk0;-><init>()V

    .line 9
    .line 10
    .line 11
    const/4 v2, 0x1

    .line 12
    invoke-virtual {p0, p1, v0, v1, v2}, Lv/VFrame_Anim;->B(Landroid/view/View;Ll/y20;Ll/y20;Z)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public final synthetic z(Ll/qcj;ZLandroid/view/View;)V
    .locals 1

    .line 1
    invoke-interface {p1, p3}, Ll/qcj;->call(Ljava/lang/Object;)Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    check-cast p1, Landroid/view/ViewPropertyAnimator;

    .line 6
    .line 7
    new-instance v0, Lv/VFrame_Anim$a;

    .line 8
    .line 9
    invoke-direct {v0, p0, p3, p2}, Lv/VFrame_Anim$a;-><init>(Lv/VFrame_Anim;Landroid/view/View;Z)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p1, v0}, Landroid/view/ViewPropertyAnimator;->setListener(Landroid/animation/Animator$AnimatorListener;)Landroid/view/ViewPropertyAnimator;

    .line 13
    .line 14
    .line 15
    invoke-virtual {p1}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 16
    .line 17
    .line 18
    return-void
.end method

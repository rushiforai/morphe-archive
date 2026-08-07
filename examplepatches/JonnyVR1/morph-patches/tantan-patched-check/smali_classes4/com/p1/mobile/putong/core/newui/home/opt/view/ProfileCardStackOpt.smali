.class public Lcom/p1/mobile/putong/core/newui/home/opt/view/ProfileCardStackOpt;
.super Lcom/p1/mobile/putong/core/newui/home/opt/BifrostLayout;
.source "SourceFile"

# interfaces
.implements Ll/f1g0;
.implements Ll/pn4;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/p1/mobile/putong/core/newui/home/opt/BifrostLayout;",
        "Ll/f1g0<",
        "Landroid/view/View;",
        "Lcom/p1/mobile/putong/core/newui/home/c;",
        ">;",
        "Ll/pn4;"
    }
.end annotation


# instance fields
.field public f:Ll/wp90;

.field public g:Ll/px2;

.field public h:Ll/pl50;

.field public i:Lcom/p1/mobile/putong/core/card/VSwipeStack$c;

.field public j:Ll/uxl0;

.field public k:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Ll/xql;",
            ">;"
        }
    .end annotation
.end field

.field public l:Ll/fqj0;

.field public m:Ll/hqj0;

.field public n:Lcom/p1/mobile/putong/core/newui/home/b;

.field public o:Landroid/graphics/Paint;

.field public p:I

.field public q:Landroid/graphics/PorterDuffXfermode;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 27
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/putong/core/newui/home/opt/BifrostLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 p1, 0x0

    .line 28
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/opt/view/ProfileCardStackOpt;->k:Ll/y20;

    const/4 p1, 0x0

    .line 29
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/opt/view/ProfileCardStackOpt;->p:I

    .line 30
    new-instance p1, Landroid/graphics/PorterDuffXfermode;

    sget-object p2, Landroid/graphics/PorterDuff$Mode;->CLEAR:Landroid/graphics/PorterDuff$Mode;

    invoke-direct {p1, p2}, Landroid/graphics/PorterDuffXfermode;-><init>(Landroid/graphics/PorterDuff$Mode;)V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/opt/view/ProfileCardStackOpt;->q:Landroid/graphics/PorterDuffXfermode;

    .line 31
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/home/opt/view/ProfileCardStackOpt;->C()V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 32
    invoke-direct {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/newui/home/opt/BifrostLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p1, 0x0

    .line 33
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/opt/view/ProfileCardStackOpt;->k:Ll/y20;

    const/4 p1, 0x0

    .line 34
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/opt/view/ProfileCardStackOpt;->p:I

    .line 35
    new-instance p1, Landroid/graphics/PorterDuffXfermode;

    sget-object p2, Landroid/graphics/PorterDuff$Mode;->CLEAR:Landroid/graphics/PorterDuff$Mode;

    invoke-direct {p1, p2}, Landroid/graphics/PorterDuffXfermode;-><init>(Landroid/graphics/PorterDuff$Mode;)V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/opt/view/ProfileCardStackOpt;->q:Landroid/graphics/PorterDuffXfermode;

    .line 36
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/home/opt/view/ProfileCardStackOpt;->C()V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Ll/uxl0;Lcom/p1/mobile/putong/core/newui/home/b;)V
    .locals 1

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/opt/BifrostLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/opt/view/ProfileCardStackOpt;->k:Ll/y20;

    .line 6
    .line 7
    const/4 p1, 0x0

    .line 8
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/opt/view/ProfileCardStackOpt;->p:I

    .line 9
    .line 10
    new-instance p1, Landroid/graphics/PorterDuffXfermode;

    .line 11
    .line 12
    sget-object v0, Landroid/graphics/PorterDuff$Mode;->CLEAR:Landroid/graphics/PorterDuff$Mode;

    .line 13
    .line 14
    invoke-direct {p1, v0}, Landroid/graphics/PorterDuffXfermode;-><init>(Landroid/graphics/PorterDuff$Mode;)V

    .line 15
    .line 16
    .line 17
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/opt/view/ProfileCardStackOpt;->q:Landroid/graphics/PorterDuffXfermode;

    .line 18
    .line 19
    iput-object p2, p0, Lcom/p1/mobile/putong/core/newui/home/opt/view/ProfileCardStackOpt;->j:Ll/uxl0;

    .line 20
    .line 21
    iput-object p3, p0, Lcom/p1/mobile/putong/core/newui/home/opt/view/ProfileCardStackOpt;->n:Lcom/p1/mobile/putong/core/newui/home/b;

    .line 22
    .line 23
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/home/opt/view/ProfileCardStackOpt;->C()V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method private C()V
    .locals 2

    .line 1
    new-instance v0, Landroid/graphics/Paint;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/opt/view/ProfileCardStackOpt;->o:Landroid/graphics/Paint;

    .line 7
    .line 8
    const/4 v1, 0x1

    .line 9
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 10
    .line 11
    .line 12
    invoke-static {}, Ll/gra;->N3()Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-eqz v0, :cond_0

    .line 17
    .line 18
    new-instance v0, Ll/lof;

    .line 19
    .line 20
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    invoke-direct {v0, v1}, Ll/lof;-><init>(Landroid/content/Context;)V

    .line 25
    .line 26
    .line 27
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/opt/view/ProfileCardStackOpt;->g:Ll/px2;

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_0
    new-instance v0, Ll/duw;

    .line 31
    .line 32
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    invoke-direct {v0, v1}, Ll/duw;-><init>(Landroid/content/Context;)V

    .line 37
    .line 38
    .line 39
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/opt/view/ProfileCardStackOpt;->g:Ll/px2;

    .line 40
    .line 41
    :goto_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/opt/view/ProfileCardStackOpt;->g:Ll/px2;

    .line 42
    .line 43
    invoke-virtual {v0, p0}, Ll/ox2;->l0(Ll/pn4;)V

    .line 44
    .line 45
    .line 46
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/opt/view/ProfileCardStackOpt;->g:Ll/px2;

    .line 47
    .line 48
    new-instance v1, Lcom/p1/mobile/putong/core/newui/home/opt/view/ProfileCardStackOpt$a;

    .line 49
    .line 50
    invoke-direct {v1, p0}, Lcom/p1/mobile/putong/core/newui/home/opt/view/ProfileCardStackOpt$a;-><init>(Lcom/p1/mobile/putong/core/newui/home/opt/view/ProfileCardStackOpt;)V

    .line 51
    .line 52
    .line 53
    invoke-virtual {v0, v1}, Ll/ox2;->k0(Ll/dn4;)V

    .line 54
    .line 55
    .line 56
    return-void
.end method

.method private F(Lcom/p1/mobile/putong/core/data/SwipeDirection;Z)V
    .locals 2

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/ab/IntlCountryCodeController;->v()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    invoke-static {}, Ll/gra;->N3()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/opt/view/ProfileCardStackOpt;->m:Ll/hqj0;

    .line 14
    .line 15
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_1

    .line 20
    .line 21
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/opt/view/ProfileCardStackOpt;->m:Ll/hqj0;

    .line 22
    .line 23
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/opt/view/ProfileCardStackOpt;->d()Landroid/view/View;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    invoke-virtual {v0, v1, p1}, Ll/hqj0;->e(Landroid/view/View;Lcom/p1/mobile/putong/core/data/SwipeDirection;)V

    .line 28
    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/opt/view/ProfileCardStackOpt;->l:Ll/fqj0;

    .line 32
    .line 33
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    if-eqz v0, :cond_1

    .line 38
    .line 39
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/home/opt/view/ProfileCardStackOpt;->l:Ll/fqj0;

    .line 40
    .line 41
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/opt/view/ProfileCardStackOpt;->d()Landroid/view/View;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    invoke-virtual {p2, p0, p1}, Ll/fqj0;->j(Landroid/view/View;Lcom/p1/mobile/putong/core/data/SwipeDirection;)V

    .line 46
    .line 47
    .line 48
    return-void

    .line 49
    :cond_1
    :goto_0
    sget-object v0, Lcom/p1/mobile/putong/core/newui/home/opt/CardOperation;->SWIPE_UP:Lcom/p1/mobile/putong/core/newui/home/opt/CardOperation;

    .line 50
    .line 51
    sget-object v1, Lcom/p1/mobile/putong/core/newui/home/opt/view/ProfileCardStackOpt$c;->c:[I

    .line 52
    .line 53
    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    .line 54
    .line 55
    .line 56
    move-result p1

    .line 57
    aget p1, v1, p1

    .line 58
    .line 59
    const/4 v1, 0x1

    .line 60
    if-eq p1, v1, :cond_4

    .line 61
    .line 62
    const/4 v1, 0x2

    .line 63
    if-eq p1, v1, :cond_3

    .line 64
    .line 65
    const/4 v1, 0x3

    .line 66
    if-eq p1, v1, :cond_2

    .line 67
    .line 68
    goto :goto_1

    .line 69
    :cond_2
    sget-object v0, Lcom/p1/mobile/putong/core/newui/home/opt/CardOperation;->SWIPE_LEFT:Lcom/p1/mobile/putong/core/newui/home/opt/CardOperation;

    .line 70
    .line 71
    goto :goto_1

    .line 72
    :cond_3
    sget-object v0, Lcom/p1/mobile/putong/core/newui/home/opt/CardOperation;->SWIPE_RIGHT:Lcom/p1/mobile/putong/core/newui/home/opt/CardOperation;

    .line 73
    .line 74
    :cond_4
    :goto_1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/opt/view/ProfileCardStackOpt;->g:Ll/px2;

    .line 75
    .line 76
    invoke-virtual {p0, v0, p2}, Ll/px2;->A0(Lcom/p1/mobile/putong/core/newui/home/opt/CardOperation;Z)Z

    .line 77
    .line 78
    .line 79
    return-void
.end method


# virtual methods
.method public A(Lcom/p1/mobile/putong/core/data/SwipeDirection;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, p1, v0}, Lcom/p1/mobile/putong/core/newui/home/opt/view/ProfileCardStackOpt;->F(Lcom/p1/mobile/putong/core/data/SwipeDirection;Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public B()V
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/opt/view/ProfileCardStackOpt;->n:Lcom/p1/mobile/putong/core/newui/home/b;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/b;->g:Landroid/widget/FrameLayout;

    .line 7
    .line 8
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/b;->f:Landroid/widget/FrameLayout;

    .line 9
    .line 10
    if-nez v0, :cond_1

    .line 11
    .line 12
    :goto_0
    return-void

    .line 13
    :cond_1
    if-eqz p0, :cond_2

    .line 14
    .line 15
    invoke-virtual {p0}, Landroid/view/View;->getVisibility()I

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    if-nez v1, :cond_2

    .line 20
    .line 21
    const/high16 v1, 0x40400000    # 3.0f

    .line 22
    .line 23
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    int-to-float v1, v1

    .line 28
    invoke-virtual {p0, v1}, Landroid/view/View;->setElevation(F)V

    .line 29
    .line 30
    .line 31
    :cond_2
    const/4 p0, 0x0

    .line 32
    invoke-virtual {v0, p0}, Landroid/view/View;->setClipToOutline(Z)V

    .line 33
    .line 34
    .line 35
    const/high16 p0, 0x40c00000    # 6.0f

    .line 36
    .line 37
    invoke-static {p0}, Ll/qa00;->d(F)I

    .line 38
    .line 39
    .line 40
    move-result p0

    .line 41
    int-to-float p0, p0

    .line 42
    invoke-virtual {v0, p0}, Landroid/view/View;->setElevation(F)V

    .line 43
    .line 44
    .line 45
    return-void
.end method

.method public D()Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/opt/view/ProfileCardStackOpt;->g:Ll/px2;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/mx2;->u0()Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public E()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/opt/view/ProfileCardStackOpt;->d()Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    instance-of v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-static {}, Ll/gra;->N3()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    check-cast p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;

    .line 16
    .line 17
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->x1()V

    .line 18
    .line 19
    .line 20
    :cond_0
    return-void
.end method

.method public G(Z)V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/opt/view/ProfileCardStackOpt;->n:Lcom/p1/mobile/putong/core/newui/home/b;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    goto :goto_1

    .line 6
    :cond_0
    iget-object v1, v0, Lcom/p1/mobile/putong/core/newui/home/b;->g:Landroid/widget/FrameLayout;

    .line 7
    .line 8
    iget-object v0, v0, Lcom/p1/mobile/putong/core/newui/home/b;->f:Landroid/widget/FrameLayout;

    .line 9
    .line 10
    if-nez v1, :cond_1

    .line 11
    .line 12
    goto :goto_1

    .line 13
    :cond_1
    if-eqz v0, :cond_2

    .line 14
    .line 15
    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    .line 16
    .line 17
    .line 18
    move-result v2

    .line 19
    if-nez v2, :cond_2

    .line 20
    .line 21
    const/4 v2, 0x1

    .line 22
    goto :goto_0

    .line 23
    :cond_2
    const/4 v2, 0x0

    .line 24
    :goto_0
    const/4 v3, 0x0

    .line 25
    if-eqz p1, :cond_4

    .line 26
    .line 27
    invoke-virtual {v1, v3}, Landroid/view/View;->setElevation(F)V

    .line 28
    .line 29
    .line 30
    if-eqz v2, :cond_3

    .line 31
    .line 32
    const/high16 p0, 0x41200000    # 10.0f

    .line 33
    .line 34
    invoke-static {p0}, Ll/qa00;->d(F)I

    .line 35
    .line 36
    .line 37
    move-result p0

    .line 38
    int-to-float p0, p0

    .line 39
    invoke-virtual {v0, p0}, Landroid/view/View;->setElevation(F)V

    .line 40
    .line 41
    .line 42
    :cond_3
    :goto_1
    return-void

    .line 43
    :cond_4
    if-eqz v2, :cond_5

    .line 44
    .line 45
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/opt/view/ProfileCardStackOpt;->B()V

    .line 46
    .line 47
    .line 48
    return-void

    .line 49
    :cond_5
    invoke-virtual {v1, v3}, Landroid/view/View;->setElevation(F)V

    .line 50
    .line 51
    .line 52
    return-void
.end method

.method public a()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/opt/view/ProfileCardStackOpt;->d()Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/opt/view/ProfileCardStackOpt;->d()Landroid/view/View;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    instance-of v0, v0, Ll/r7m;

    .line 16
    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/opt/view/ProfileCardStackOpt;->d()Landroid/view/View;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    check-cast p0, Ll/r7m;

    .line 24
    .line 25
    invoke-interface {p0}, Ll/r7m;->a()V

    .line 26
    .line 27
    .line 28
    :cond_0
    return-void
.end method

.method public b()Z
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/opt/view/ProfileCardStackOpt;->d()Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    instance-of v0, v0, Ll/t7m;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/opt/view/ProfileCardStackOpt;->d()Landroid/view/View;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Ll/t7m;

    .line 14
    .line 15
    invoke-interface {p0}, Ll/t7m;->b()Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    return p0

    .line 20
    :cond_0
    const/4 p0, 0x0

    .line 21
    return p0
.end method

.method public c(Z)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/newui/home/opt/BifrostLayout;->b:Z

    .line 2
    .line 3
    return p0
.end method

.method public d()Landroid/view/View;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/opt/view/ProfileCardStackOpt;->g:Ll/px2;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/ox2;->G()Ll/txl0;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    if-eqz v1, :cond_0

    .line 12
    .line 13
    iget-object p0, v0, Ll/txl0;->a:Landroid/view/View;

    .line 14
    .line 15
    return-object p0

    .line 16
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/opt/view/ProfileCardStackOpt;->g:Ll/px2;

    .line 17
    .line 18
    const-string v0, "get top "

    .line 19
    .line 20
    invoke-virtual {p0, v0}, Ll/ox2;->Y(Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    const/4 p0, 0x0

    .line 24
    return-object p0
.end method

.method public d0(FFFLcom/p1/mobile/putong/core/newui/home/opt/CardProgressAction;)V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    cmpl-float v1, p1, v0

    .line 3
    .line 4
    if-nez v1, :cond_0

    .line 5
    .line 6
    goto :goto_0

    .line 7
    :cond_0
    neg-float p2, p1

    .line 8
    :goto_0
    const/high16 p1, -0x40800000    # -1.0f

    .line 9
    .line 10
    invoke-static {p1, p2}, Ljava/lang/Math;->max(FF)F

    .line 11
    .line 12
    .line 13
    move-result p1

    .line 14
    const/high16 p2, 0x3f800000    # 1.0f

    .line 15
    .line 16
    invoke-static {p2, p1}, Ljava/lang/Math;->min(FF)F

    .line 17
    .line 18
    .line 19
    move-result p1

    .line 20
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/opt/view/ProfileCardStackOpt;->i:Lcom/p1/mobile/putong/core/card/VSwipeStack$c;

    .line 21
    .line 22
    if-eqz p0, :cond_3

    .line 23
    .line 24
    cmpl-float p2, p3, v0

    .line 25
    .line 26
    if-nez p2, :cond_1

    .line 27
    .line 28
    const/4 v0, 0x1

    .line 29
    goto :goto_1

    .line 30
    :cond_1
    const/4 v0, 0x0

    .line 31
    :goto_1
    if-nez p2, :cond_2

    .line 32
    .line 33
    move p3, p1

    .line 34
    :cond_2
    invoke-interface {p0, v0, p3, p4}, Lcom/p1/mobile/putong/core/card/VSwipeStack$c;->b(ZFLcom/p1/mobile/putong/core/newui/home/opt/CardProgressAction;)V

    .line 35
    .line 36
    .line 37
    :cond_3
    return-void
.end method

.method public dispatchDraw(Landroid/graphics/Canvas;)V
    .locals 9

    .line 1
    iget v0, p0, Lcom/p1/mobile/putong/core/newui/home/opt/view/ProfileCardStackOpt;->p:I

    .line 2
    .line 3
    if-lez v0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    goto :goto_0

    .line 7
    :cond_0
    const/4 v0, 0x0

    .line 8
    :goto_0
    if-eqz v0, :cond_1

    .line 9
    .line 10
    invoke-virtual {p1}, Landroid/graphics/Canvas;->getWidth()I

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    int-to-float v5, v1

    .line 15
    invoke-virtual {p1}, Landroid/graphics/Canvas;->getHeight()I

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    int-to-float v6, v1

    .line 20
    const/4 v7, 0x0

    .line 21
    const/16 v8, 0x1f

    .line 22
    .line 23
    const/4 v3, 0x0

    .line 24
    const/4 v4, 0x0

    .line 25
    move-object v2, p1

    .line 26
    invoke-virtual/range {v2 .. v8}, Landroid/graphics/Canvas;->saveLayer(FFFFLandroid/graphics/Paint;I)I

    .line 27
    .line 28
    .line 29
    move-result p1

    .line 30
    move-object v1, v2

    .line 31
    goto :goto_1

    .line 32
    :cond_1
    move-object v1, p1

    .line 33
    const/4 p1, -0x1

    .line 34
    :goto_1
    invoke-super {p0, v1}, Lcom/p1/mobile/putong/core/newui/home/opt/BifrostLayout;->dispatchDraw(Landroid/graphics/Canvas;)V

    .line 35
    .line 36
    .line 37
    if-eqz v0, :cond_2

    .line 38
    .line 39
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/opt/view/ProfileCardStackOpt;->o:Landroid/graphics/Paint;

    .line 40
    .line 41
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/home/opt/view/ProfileCardStackOpt;->q:Landroid/graphics/PorterDuffXfermode;

    .line 42
    .line 43
    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setXfermode(Landroid/graphics/Xfermode;)Landroid/graphics/Xfermode;

    .line 44
    .line 45
    .line 46
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredWidth()I

    .line 47
    .line 48
    .line 49
    move-result v0

    .line 50
    int-to-float v4, v0

    .line 51
    iget v0, p0, Lcom/p1/mobile/putong/core/newui/home/opt/view/ProfileCardStackOpt;->p:I

    .line 52
    .line 53
    int-to-float v5, v0

    .line 54
    iget-object v6, p0, Lcom/p1/mobile/putong/core/newui/home/opt/view/ProfileCardStackOpt;->o:Landroid/graphics/Paint;

    .line 55
    .line 56
    const/4 v2, 0x0

    .line 57
    const/4 v3, 0x0

    .line 58
    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 59
    .line 60
    .line 61
    invoke-virtual {v1, p1}, Landroid/graphics/Canvas;->restoreToCount(I)V

    .line 62
    .line 63
    .line 64
    :cond_2
    return-void
.end method

.method public e(F)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Landroid/view/View;->setAlpha(F)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public g(Ll/pl50;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/opt/view/ProfileCardStackOpt;->h:Ll/pl50;

    .line 2
    .line 3
    return-void
.end method

.method public getMeasuredHeightProxy()I
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredHeight()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public getMeasuredWidthProxy()I
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredWidth()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public getRenderView()Landroid/view/View;
    .locals 0

    return-object p0
.end method

.method public getUsHomeCardAnimHelper()Ll/fqj0;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public i(Ll/y20;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/y20<",
            "Ll/xql;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/opt/view/ProfileCardStackOpt;->k:Ll/y20;

    .line 2
    .line 3
    return-void
.end method

.method public j()Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;
    .locals 1
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/opt/view/ProfileCardStackOpt;->d()Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    instance-of v0, p0, Ll/lql;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    check-cast p0, Ll/lql;

    .line 10
    .line 11
    invoke-interface {p0}, Ll/lql;->getUserInfoProxy()Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0

    .line 16
    :cond_0
    const/4 p0, 0x0

    .line 17
    return-object p0
.end method

.method public k(Landroid/view/View;Lcom/p1/mobile/putong/core/data/SwipeDirection;FZ)V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/newui/home/opt/CardOperation;->SWIPE_UP:Lcom/p1/mobile/putong/core/newui/home/opt/CardOperation;

    .line 2
    .line 3
    sget-object v1, Lcom/p1/mobile/putong/core/newui/home/opt/view/ProfileCardStackOpt$c;->c:[I

    .line 4
    .line 5
    invoke-virtual {p2}, Ljava/lang/Enum;->ordinal()I

    .line 6
    .line 7
    .line 8
    move-result p2

    .line 9
    aget p2, v1, p2

    .line 10
    .line 11
    const/4 v1, 0x1

    .line 12
    if-eq p2, v1, :cond_2

    .line 13
    .line 14
    const/4 v1, 0x2

    .line 15
    if-eq p2, v1, :cond_1

    .line 16
    .line 17
    const/4 v1, 0x3

    .line 18
    if-eq p2, v1, :cond_0

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/core/newui/home/opt/CardOperation;->SWIPE_LEFT:Lcom/p1/mobile/putong/core/newui/home/opt/CardOperation;

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_1
    sget-object v0, Lcom/p1/mobile/putong/core/newui/home/opt/CardOperation;->SWIPE_RIGHT:Lcom/p1/mobile/putong/core/newui/home/opt/CardOperation;

    .line 25
    .line 26
    :cond_2
    :goto_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/opt/view/ProfileCardStackOpt;->g:Ll/px2;

    .line 27
    .line 28
    invoke-virtual {p0, p1, v0, p3, p4}, Ll/mx2;->B0(Landroid/view/View;Lcom/p1/mobile/putong/core/newui/home/opt/CardOperation;FZ)V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public l()Ll/ik4;
    .locals 2
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/opt/view/ProfileCardStackOpt;->g:Ll/px2;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/ox2;->w()Ll/txl0;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    const/4 v1, 0x0

    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    iget-object p0, p0, Ll/txl0;->a:Landroid/view/View;

    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_0
    move-object p0, v1

    .line 18
    :goto_0
    instance-of v0, p0, Ll/kql;

    .line 19
    .line 20
    if-eqz v0, :cond_1

    .line 21
    .line 22
    check-cast p0, Ll/kql;

    .line 23
    .line 24
    invoke-interface {p0}, Ll/kql;->getCardData()Ll/ik4;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    return-object p0

    .line 29
    :cond_1
    return-object v1
.end method

.method public m()Z
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/opt/view/ProfileCardStackOpt;->d()Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    instance-of p0, p0, Lcom/p1/mobile/putong/core/ui/home/VirtualCard;

    .line 6
    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x1

    .line 10
    return p0

    .line 11
    :cond_0
    const/4 p0, 0x0

    .line 12
    return p0
.end method

.method public n()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/opt/view/ProfileCardStackOpt;->m()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/opt/view/ProfileCardStackOpt;->d()Landroid/view/View;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    check-cast p0, Lcom/p1/mobile/putong/core/ui/home/VirtualCard;

    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/home/VirtualCard;->getContentView()Landroid/view/View;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/home/VirtualCard;->H0(Landroid/view/View;)V

    .line 18
    .line 19
    .line 20
    :cond_0
    return-void
.end method

.method public o()Ll/ik4;
    .locals 1
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/opt/view/ProfileCardStackOpt;->d()Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    instance-of v0, p0, Ll/kql;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    check-cast p0, Ll/kql;

    .line 10
    .line 11
    invoke-interface {p0}, Ll/kql;->getCardData()Ll/ik4;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0

    .line 16
    :cond_0
    const/4 p0, 0x0

    .line 17
    return-object p0
.end method

.method public p(Lcom/p1/mobile/putong/core/card/VSwipeStack$c;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/opt/view/ProfileCardStackOpt;->i:Lcom/p1/mobile/putong/core/card/VSwipeStack$c;

    .line 2
    .line 3
    return-void
.end method

.method public r(Lcom/p1/mobile/putong/core/data/SwipeDirection;Z)V
    .locals 0

    .line 1
    const/4 p2, 0x1

    .line 2
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/putong/core/newui/home/opt/view/ProfileCardStackOpt;->F(Lcom/p1/mobile/putong/core/data/SwipeDirection;Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public setAdapter(Lcom/p1/mobile/putong/core/newui/home/c;)V
    .locals 3

    .line 1
    new-instance v0, Ll/wp90;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/opt/view/ProfileCardStackOpt;->j:Ll/uxl0;

    .line 4
    .line 5
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/home/opt/view/ProfileCardStackOpt;->n:Lcom/p1/mobile/putong/core/newui/home/b;

    .line 6
    .line 7
    invoke-direct {v0, p0, p1, v1, v2}, Ll/wp90;-><init>(Lcom/p1/mobile/putong/core/newui/home/opt/BifrostLayout;Lcom/p1/mobile/putong/core/newui/home/c;Ll/uxl0;Lcom/p1/mobile/putong/core/newui/home/b;)V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/opt/view/ProfileCardStackOpt;->f:Ll/wp90;

    .line 11
    .line 12
    new-instance p1, Lcom/p1/mobile/putong/core/newui/home/opt/view/ProfileCardStackOpt$b;

    .line 13
    .line 14
    invoke-direct {p1, p0}, Lcom/p1/mobile/putong/core/newui/home/opt/view/ProfileCardStackOpt$b;-><init>(Lcom/p1/mobile/putong/core/newui/home/opt/view/ProfileCardStackOpt;)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {v0, p1}, Ll/wp90;->A(Landroid/view/View$OnClickListener;)V

    .line 18
    .line 19
    .line 20
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/opt/view/ProfileCardStackOpt;->g:Ll/px2;

    .line 21
    .line 22
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/opt/view/ProfileCardStackOpt;->f:Ll/wp90;

    .line 23
    .line 24
    invoke-virtual {p1, v0}, Ll/ox2;->i0(Ll/nx2;)V

    .line 25
    .line 26
    .line 27
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/opt/view/ProfileCardStackOpt;->g:Ll/px2;

    .line 28
    .line 29
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/opt/BifrostLayout;->setRenderManager(Ll/px2;)V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public bridge synthetic setAdapter(Ljava/lang/Object;)V
    .locals 0

    .line 33
    check-cast p1, Lcom/p1/mobile/putong/core/newui/home/c;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/opt/view/ProfileCardStackOpt;->setAdapter(Lcom/p1/mobile/putong/core/newui/home/c;)V

    return-void
.end method

.method public setAllowUpSwipe(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/home/opt/BifrostLayout;->b:Z

    .line 2
    .line 3
    return-void
.end method

.method public bridge synthetic setSuperLikeBtnVisible(Z)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Ll/r2j0;->setSuperLikeBtnVisible(Z)V

    return-void
.end method

.method public setUsHomeCardAnimHelper(Ll/fqj0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/opt/view/ProfileCardStackOpt;->l:Ll/fqj0;

    .line 2
    .line 3
    return-void
.end method

.method public setUsHomeExpandCardAnimHelper(Ll/hqj0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/opt/view/ProfileCardStackOpt;->m:Ll/hqj0;

    .line 2
    .line 3
    return-void
.end method

.method public v(Z)Z
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/opt/view/ProfileCardStackOpt;->c(Z)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public v0(FFLcom/p1/mobile/putong/core/newui/home/opt/CardProgressAction;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/opt/view/ProfileCardStackOpt;->i:Lcom/p1/mobile/putong/core/card/VSwipeStack$c;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/card/VSwipeStack$c;->a(FFLcom/p1/mobile/putong/core/newui/home/opt/CardProgressAction;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public y()V
    .locals 2

    .line 1
    invoke-static {}, Ll/gra;->N3()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_1

    .line 6
    .line 7
    invoke-static {}, Lcom/p1/mobile/putong/ab/IntlCountryCodeController;->v()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_1

    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/opt/view/ProfileCardStackOpt;->d()Landroid/view/View;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/opt/view/ProfileCardStackOpt;->l:Ll/fqj0;

    .line 18
    .line 19
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    if-eqz v1, :cond_0

    .line 24
    .line 25
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    if-eqz v1, :cond_0

    .line 30
    .line 31
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/opt/view/ProfileCardStackOpt;->l:Ll/fqj0;

    .line 32
    .line 33
    invoke-virtual {p0, v0}, Ll/fqj0;->k(Landroid/view/View;)V

    .line 34
    .line 35
    .line 36
    :cond_0
    return-void

    .line 37
    :cond_1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/opt/BifrostLayout;->w()V

    .line 38
    .line 39
    .line 40
    return-void
.end method

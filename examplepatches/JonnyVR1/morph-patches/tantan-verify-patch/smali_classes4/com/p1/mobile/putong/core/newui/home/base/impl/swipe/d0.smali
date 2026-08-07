.class public Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/d0;
.super Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/a;
.source "SourceFile"


# static fields
.field public static volatile j:Z


# instance fields
.field public g:Ll/ndp;

.field public volatile h:Z

.field public volatile i:Z


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/a;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/d0;->h:Z

    .line 6
    .line 7
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/d0;->i:Z

    .line 8
    .line 9
    return-void
.end method

.method public static synthetic p(Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/d0;Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/d0;->v(Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;)V

    return-void
.end method

.method public static synthetic q(Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/d0;Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/d0;->u(Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;)V

    return-void
.end method

.method public static bridge synthetic r(Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/d0;Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/d0;->x(Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;)V

    return-void
.end method

.method public static y(Z)V
    .locals 0

    .line 1
    sput-boolean p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/d0;->j:Z

    .line 2
    .line 3
    return-void
.end method


# virtual methods
.method public final A(Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;)Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;
    .locals 3

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->a:Ll/b240;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/b240;->q6()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/d0;->w(Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;)Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0

    .line 14
    :cond_0
    iget-object v0, p1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->a:Ll/b240;

    .line 15
    .line 16
    const/4 v1, 0x1

    .line 17
    invoke-virtual {v0, v1}, Ll/b240;->Y8(Z)V

    .line 18
    .line 19
    .line 20
    iget-object v0, p1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->c:Ll/ik4;

    .line 21
    .line 22
    invoke-virtual {v0}, Ll/ik4;->d()Lcom/p1/mobile/putong/data/User;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    iget-object v0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 27
    .line 28
    iget-object v1, p1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->b:Lcom/p1/mobile/putong/core/newui/home/b;

    .line 29
    .line 30
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/newui/home/b;->K1()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    new-instance v2, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/d0$a;

    .line 35
    .line 36
    invoke-direct {v2, p0, p1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/d0$a;-><init>(Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/d0;Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;)V

    .line 37
    .line 38
    .line 39
    invoke-static {v1, v0, v2}, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/o1;->e(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/o1$a;)V

    .line 40
    .line 41
    .line 42
    iget-object p0, p1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->a:Ll/b240;

    .line 43
    .line 44
    invoke-virtual {p0}, Ll/b240;->c5()V

    .line 45
    .line 46
    .line 47
    sget-object p0, Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;->stay:Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;

    .line 48
    .line 49
    return-object p0
.end method

.method public final B(Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;)V
    .locals 0

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->b:Lcom/p1/mobile/putong/core/newui/home/b;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    iget-object p0, p1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->b:Lcom/p1/mobile/putong/core/newui/home/b;

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/b;->A2()Ll/f1g0;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    if-eqz p0, :cond_0

    .line 20
    .line 21
    iget-object p0, p1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->b:Lcom/p1/mobile/putong/core/newui/home/b;

    .line 22
    .line 23
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/b;->A2()Ll/f1g0;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    sget-object p1, Lcom/p1/mobile/putong/core/data/SwipeDirection;->UP:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 28
    .line 29
    invoke-interface {p0, p1}, Ll/f1g0;->A(Lcom/p1/mobile/putong/core/data/SwipeDirection;)V

    .line 30
    .line 31
    .line 32
    :cond_0
    return-void
.end method

.method public bridge synthetic a(Ll/e2m;)Ljava/lang/Object;
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/d0;->t(Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;)Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public bridge synthetic b(Ll/e2m;)Z
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/d0;->z(Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public final s(Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;)Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->c:Ll/ik4;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    iget-object p0, p1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->c:Ll/ik4;

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/ik4;->a()Ll/q7m;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    if-eqz p0, :cond_0

    .line 20
    .line 21
    iget-object p0, p1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->c:Ll/ik4;

    .line 22
    .line 23
    invoke-virtual {p0}, Ll/ik4;->a()Ll/q7m;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-interface {p0}, Ll/q7m;->getCardView()Landroid/view/View;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    return-object p0

    .line 32
    :cond_0
    const/4 p0, 0x0

    .line 33
    return-object p0
.end method

.method public t(Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;)Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;
    .locals 1

    .line 1
    invoke-static {p1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/f1;->v(Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/d0;->A(Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;)Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0

    .line 12
    :cond_0
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/d0;->w(Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;)Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    return-object p0
.end method

.method public final synthetic u(Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/d0;->h:Z

    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/d0;->i:Z

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/d0;->B(Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final synthetic v(Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/d0;->h:Z

    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/d0;->i:Z

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/d0;->B(Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final w(Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;)Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;
    .locals 4

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/d0;->s(Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v1, p1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->b:Lcom/p1/mobile/putong/core/newui/home/b;

    .line 6
    .line 7
    iget-object v1, v1, Lcom/p1/mobile/putong/core/newui/home/b;->c:Lv/VFrame;

    .line 8
    .line 9
    if-eqz v0, :cond_1

    .line 10
    .line 11
    if-nez v1, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    const/4 v2, 0x1

    .line 15
    iput-boolean v2, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/d0;->h:Z

    .line 16
    .line 17
    new-instance v2, Ll/ndp;

    .line 18
    .line 19
    iget-object v3, p1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->b:Lcom/p1/mobile/putong/core/newui/home/b;

    .line 20
    .line 21
    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/newui/home/b;->K1()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 22
    .line 23
    .line 24
    move-result-object v3

    .line 25
    invoke-direct {v2, v3, v1}, Ll/ndp;-><init>(Landroid/content/Context;Lv/VFrame;)V

    .line 26
    .line 27
    .line 28
    iput-object v2, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/d0;->g:Ll/ndp;

    .line 29
    .line 30
    new-instance v1, Ll/mjh0;

    .line 31
    .line 32
    invoke-direct {v1, p0, p1}, Ll/mjh0;-><init>(Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/d0;Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {v2, v0, v1}, Ll/ndp;->i(Landroid/view/View;Ljava/lang/Runnable;)V

    .line 36
    .line 37
    .line 38
    sget-object p0, Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;->stay:Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;

    .line 39
    .line 40
    return-object p0

    .line 41
    :cond_1
    :goto_0
    sget-object p0, Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;->pass:Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;

    .line 42
    .line 43
    return-object p0
.end method

.method public final x(Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;)V
    .locals 4

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/d0;->s(Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v1, p1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->b:Lcom/p1/mobile/putong/core/newui/home/b;

    .line 6
    .line 7
    iget-object v1, v1, Lcom/p1/mobile/putong/core/newui/home/b;->c:Lv/VFrame;

    .line 8
    .line 9
    if-eqz v0, :cond_1

    .line 10
    .line 11
    if-nez v1, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    const/4 v2, 0x1

    .line 15
    iput-boolean v2, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/d0;->h:Z

    .line 16
    .line 17
    new-instance v2, Ll/ndp;

    .line 18
    .line 19
    iget-object v3, p1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->b:Lcom/p1/mobile/putong/core/newui/home/b;

    .line 20
    .line 21
    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/newui/home/b;->K1()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 22
    .line 23
    .line 24
    move-result-object v3

    .line 25
    invoke-direct {v2, v3, v1}, Ll/ndp;-><init>(Landroid/content/Context;Lv/VFrame;)V

    .line 26
    .line 27
    .line 28
    iput-object v2, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/d0;->g:Ll/ndp;

    .line 29
    .line 30
    new-instance v1, Ll/njh0;

    .line 31
    .line 32
    invoke-direct {v1, p0, p1}, Ll/njh0;-><init>(Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/d0;Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {v2, v0, v1}, Ll/ndp;->i(Landroid/view/View;Ljava/lang/Runnable;)V

    .line 36
    .line 37
    .line 38
    return-void

    .line 39
    :cond_1
    :goto_0
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/d0;->B(Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;)V

    .line 40
    .line 41
    .line 42
    return-void
.end method

.method public z(Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;)Z
    .locals 2

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/d0;->i:Z

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    iput-boolean v1, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/d0;->i:Z

    .line 7
    .line 8
    return v1

    .line 9
    :cond_0
    sget-boolean v0, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/d0;->j:Z

    .line 10
    .line 11
    if-eqz v0, :cond_1

    .line 12
    .line 13
    sput-boolean v1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/d0;->j:Z

    .line 14
    .line 15
    return v1

    .line 16
    :cond_1
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/d0;->h:Z

    .line 17
    .line 18
    if-eqz p0, :cond_2

    .line 19
    .line 20
    return v1

    .line 21
    :cond_2
    iget-object p0, p1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->d:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 22
    .line 23
    sget-object v0, Lcom/p1/mobile/putong/core/data/SwipeDirection;->UP:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 24
    .line 25
    if-ne p0, v0, :cond_7

    .line 26
    .line 27
    iget-boolean p0, p1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->e:Z

    .line 28
    .line 29
    if-nez p0, :cond_3

    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_3
    invoke-static {}, Lcom/p1/mobile/putong/ab/IntlCountryCodeController;->v()Z

    .line 33
    .line 34
    .line 35
    move-result p0

    .line 36
    if-eqz p0, :cond_4

    .line 37
    .line 38
    return v1

    .line 39
    :cond_4
    iget-object p0, p1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->c:Ll/ik4;

    .line 40
    .line 41
    invoke-virtual {p0}, Ll/ik4;->d()Lcom/p1/mobile/putong/data/User;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 46
    .line 47
    .line 48
    move-result p0

    .line 49
    if-nez p0, :cond_5

    .line 50
    .line 51
    return v1

    .line 52
    :cond_5
    invoke-static {}, Ll/sdp;->d()Z

    .line 53
    .line 54
    .line 55
    move-result p0

    .line 56
    if-nez p0, :cond_6

    .line 57
    .line 58
    return v1

    .line 59
    :cond_6
    const/4 p0, 0x1

    .line 60
    return p0

    .line 61
    :cond_7
    :goto_0
    return v1
.end method

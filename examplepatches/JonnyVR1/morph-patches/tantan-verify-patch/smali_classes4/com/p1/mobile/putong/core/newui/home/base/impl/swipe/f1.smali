.class public Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/f1;
.super Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/a;
.source "SourceFile"


# static fields
.field public static volatile g:Z

.field public static volatile h:Z


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/a;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static bridge synthetic p(Z)V
    .locals 0

    .line 1
    sput-boolean p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/f1;->h:Z

    return-void
.end method

.method public static bridge synthetic q(Z)V
    .locals 0

    .line 1
    sput-boolean p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/f1;->g:Z

    return-void
.end method

.method public static s()Z
    .locals 1

    .line 1
    sget-boolean v0, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/f1;->h:Z

    .line 2
    .line 3
    return v0
.end method

.method public static t()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    sput-boolean v0, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/f1;->h:Z

    .line 3
    .line 4
    return-void
.end method

.method public static v(Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;)Z
    .locals 5

    .line 1
    if-eqz p0, :cond_1

    .line 2
    .line 3
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->c:Ll/ik4;

    .line 4
    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    invoke-virtual {v0}, Ll/ik4;->d()Lcom/p1/mobile/putong/data/User;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->c:Ll/ik4;

    .line 15
    .line 16
    invoke-virtual {v0}, Ll/ik4;->d()Lcom/p1/mobile/putong/data/User;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    new-instance v1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/o1$b;

    .line 21
    .line 22
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->d:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 23
    .line 24
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->a:Ll/b240;

    .line 25
    .line 26
    invoke-virtual {v3}, Ll/b240;->p6()Z

    .line 27
    .line 28
    .line 29
    move-result v3

    .line 30
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->a:Ll/b240;

    .line 31
    .line 32
    iget-object v4, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 33
    .line 34
    invoke-virtual {p0, v4}, Ll/b240;->j6(Ljava/lang/String;)Z

    .line 35
    .line 36
    .line 37
    move-result p0

    .line 38
    invoke-direct {v1, v0, v2, v3, p0}, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/o1$b;-><init>(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/data/SwipeDirection;ZZ)V

    .line 39
    .line 40
    .line 41
    invoke-static {v1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/o1;->d(Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/o1$b;)Z

    .line 42
    .line 43
    .line 44
    move-result p0

    .line 45
    return p0

    .line 46
    :cond_1
    :goto_0
    const/4 p0, 0x0

    .line 47
    return p0
.end method


# virtual methods
.method public bridge synthetic a(Ll/e2m;)Ljava/lang/Object;
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/f1;->r(Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;)Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;

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
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/f1;->u(Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public r(Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;)Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;
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
    iget-object v1, p1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->a:Ll/b240;

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {v1}, Ll/b240;->c5()V

    .line 12
    .line 13
    .line 14
    sget-object p0, Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;->stay:Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;

    .line 15
    .line 16
    return-object p0

    .line 17
    :cond_0
    const/4 v0, 0x1

    .line 18
    invoke-virtual {v1, v0}, Ll/b240;->Y8(Z)V

    .line 19
    .line 20
    .line 21
    sput-boolean v0, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/f1;->g:Z

    .line 22
    .line 23
    iget-object v0, p1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->c:Ll/ik4;

    .line 24
    .line 25
    invoke-virtual {v0}, Ll/ik4;->d()Lcom/p1/mobile/putong/data/User;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    iget-object v0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 30
    .line 31
    iget-object v1, p1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->b:Lcom/p1/mobile/putong/core/newui/home/b;

    .line 32
    .line 33
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/newui/home/b;->K1()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    new-instance v2, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/f1$a;

    .line 38
    .line 39
    invoke-direct {v2, p0, p1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/f1$a;-><init>(Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/f1;Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;)V

    .line 40
    .line 41
    .line 42
    invoke-static {v1, v0, v2}, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/o1;->e(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/o1$a;)V

    .line 43
    .line 44
    .line 45
    iget-object p0, p1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->a:Ll/b240;

    .line 46
    .line 47
    invoke-virtual {p0}, Ll/b240;->c5()V

    .line 48
    .line 49
    .line 50
    sget-object p0, Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;->stay:Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;

    .line 51
    .line 52
    return-object p0
.end method

.method public u(Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;)Z
    .locals 0

    .line 1
    sget-boolean p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/f1;->h:Z

    .line 2
    .line 3
    if-nez p0, :cond_1

    .line 4
    .line 5
    sget-boolean p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/f1;->g:Z

    .line 6
    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    invoke-static {p1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/f1;->v(Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;)Z

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    return p0

    .line 15
    :cond_1
    :goto_0
    const/4 p0, 0x0

    .line 16
    return p0
.end method

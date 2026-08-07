.class public abstract Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/SwipeDialogOmsLimitStrategy;
.super Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/a;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/SwipeDialogOmsLimitStrategy$HandleState;
    }
.end annotation


# instance fields
.field public g:Ljava/lang/String;

.field public h:Z

.field public i:Z


# direct methods
.method public constructor <init>(Ljava/lang/String;Z)V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/a;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/SwipeDialogOmsLimitStrategy;->i:Z

    .line 6
    .line 7
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/SwipeDialogOmsLimitStrategy;->g:Ljava/lang/String;

    .line 8
    .line 9
    iput-boolean p2, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/SwipeDialogOmsLimitStrategy;->h:Z

    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public bridge synthetic a(Ll/e2m;)Ljava/lang/Object;
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/SwipeDialogOmsLimitStrategy;->p(Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;)Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;

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
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/SwipeDialogOmsLimitStrategy;->r(Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public p(Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;)Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;
    .locals 3

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/SwipeDialogOmsLimitStrategy;->q(Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;)Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-static {}, Ll/spl0;->F()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/SwipeDialogOmsLimitStrategy;->i:Z

    .line 12
    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    invoke-static {}, Ll/pk50;->j()Ll/pk50;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-virtual {v0}, Ll/pk50;->f()Ll/rj50;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/SwipeDialogOmsLimitStrategy;->g:Ljava/lang/String;

    .line 24
    .line 25
    const/4 v2, 0x0

    .line 26
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/SwipeDialogOmsLimitStrategy;->h:Z

    .line 27
    .line 28
    invoke-virtual {v0, v1, v2, p0}, Ll/rj50;->b0(Ljava/lang/String;IZ)Z

    .line 29
    .line 30
    .line 31
    :cond_0
    return-object p1
.end method

.method public abstract q(Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;)Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;
.end method

.method public r(Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;)Z
    .locals 4

    .line 1
    invoke-static {}, Ll/spl0;->F()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    invoke-static {}, Ll/pk50;->j()Ll/pk50;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {v0}, Ll/pk50;->f()Ll/rj50;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/SwipeDialogOmsLimitStrategy;->g:Ljava/lang/String;

    .line 17
    .line 18
    iget-boolean v3, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/SwipeDialogOmsLimitStrategy;->h:Z

    .line 19
    .line 20
    invoke-virtual {v0, v2, v3}, Ll/rj50;->M(Ljava/lang/String;Z)Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    if-nez v0, :cond_0

    .line 25
    .line 26
    return v1

    .line 27
    :cond_0
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/SwipeDialogOmsLimitStrategy;->s(Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;)Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/SwipeDialogOmsLimitStrategy$HandleState;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    sget-object v0, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/SwipeDialogOmsLimitStrategy$HandleState;->refuse:Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/SwipeDialogOmsLimitStrategy$HandleState;

    .line 32
    .line 33
    if-ne p1, v0, :cond_1

    .line 34
    .line 35
    return v1

    .line 36
    :cond_1
    invoke-static {}, Ll/spl0;->F()Z

    .line 37
    .line 38
    .line 39
    move-result v0

    .line 40
    if-eqz v0, :cond_2

    .line 41
    .line 42
    sget-object v0, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/SwipeDialogOmsLimitStrategy$HandleState;->direct:Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/SwipeDialogOmsLimitStrategy$HandleState;

    .line 43
    .line 44
    if-ne p1, v0, :cond_2

    .line 45
    .line 46
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/SwipeDialogOmsLimitStrategy;->i:Z

    .line 47
    .line 48
    if-eqz v0, :cond_2

    .line 49
    .line 50
    invoke-static {}, Ll/pk50;->j()Ll/pk50;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    invoke-virtual {v0}, Ll/pk50;->f()Ll/rj50;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/SwipeDialogOmsLimitStrategy;->g:Ljava/lang/String;

    .line 59
    .line 60
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/SwipeDialogOmsLimitStrategy;->h:Z

    .line 61
    .line 62
    invoke-virtual {v0, v2, v1, p0}, Ll/rj50;->b0(Ljava/lang/String;IZ)Z

    .line 63
    .line 64
    .line 65
    :cond_2
    sget-object p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/SwipeDialogOmsLimitStrategy$HandleState;->proxy:Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/SwipeDialogOmsLimitStrategy$HandleState;

    .line 66
    .line 67
    if-ne p1, p0, :cond_3

    .line 68
    .line 69
    const/4 p0, 0x1

    .line 70
    return p0

    .line 71
    :cond_3
    return v1
.end method

.method public abstract s(Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;)Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/SwipeDialogOmsLimitStrategy$HandleState;
.end method

.class public abstract Ll/rpf;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/g6m;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/g6m<",
        "Ll/spf$a;",
        "Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;",
        ">;"
    }
.end annotation


# instance fields
.field public final a:Ljava/lang/String;

.field public final b:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string v0, "LIKED"

    .line 5
    .line 6
    iput-object v0, p0, Ll/rpf;->a:Ljava/lang/String;

    .line 7
    .line 8
    const-string v0, "DISLIKED"

    .line 9
    .line 10
    iput-object v0, p0, Ll/rpf;->b:Ljava/lang/String;

    .line 11
    .line 12
    return-void
.end method

.method public static synthetic c(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-static {p0}, Ll/bsj0;->D(Ljava/lang/Throwable;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic d(Ll/spf$a;Lcom/p1/mobile/putong/core/data/Explore;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/spf$a;->k:Ll/btl;

    .line 2
    .line 3
    iget-boolean p1, p1, Lcom/p1/mobile/putong/core/data/Explore;->can_swiped:Z

    .line 4
    .line 5
    invoke-interface {p0, p1}, Ll/btl;->f3(Z)V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public e()Lcom/p1/mobile/putong/data/Counter;
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/c;->o3()Lcom/p1/mobile/putong/data/Counter;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public f(ZLjava/lang/String;Lcom/p1/mobile/putong/data/User;ZLl/spf$a;)V
    .locals 3

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->S1:Ll/d19;

    .line 4
    .line 5
    iget-object v0, p3, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 6
    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    const-string v1, "LIKED"

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    const-string v1, "DISLIKED"

    .line 13
    .line 14
    :goto_0
    invoke-static {}, Ll/gra;->L3()Z

    .line 15
    .line 16
    .line 17
    move-result v2

    .line 18
    invoke-virtual {p0, p2, v0, v1, v2}, Ll/d19;->C3(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)Lrx/c;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    new-instance v0, Ll/ppf;

    .line 23
    .line 24
    invoke-direct {v0, p5}, Ll/ppf;-><init>(Ll/spf$a;)V

    .line 25
    .line 26
    .line 27
    new-instance p5, Ll/qpf;

    .line 28
    .line 29
    invoke-direct {p5}, Ll/qpf;-><init>()V

    .line 30
    .line 31
    .line 32
    invoke-static {v0, p5}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 33
    .line 34
    .line 35
    move-result-object p5

    .line 36
    invoke-virtual {p0, p5}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 37
    .line 38
    .line 39
    const-string p0, "tantanx_receive_uid"

    .line 40
    .line 41
    const-string p5, "tantanx_scene_name"

    .line 42
    .line 43
    const-string v0, "p_tantanx_card"

    .line 44
    .line 45
    const-string v1, "e_tantanx_card_dislike"

    .line 46
    .line 47
    const-string v2, "e_tantanx_card_like"

    .line 48
    .line 49
    if-eqz p4, :cond_2

    .line 50
    .line 51
    if-eqz p1, :cond_1

    .line 52
    .line 53
    move-object v1, v2

    .line 54
    :cond_1
    invoke-static {p5, p2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 55
    .line 56
    .line 57
    move-result-object p1

    .line 58
    iget-object p2, p3, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 59
    .line 60
    invoke-static {p0, p2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    filled-new-array {p1, p0}, [Ll/pf60;

    .line 65
    .line 66
    .line 67
    move-result-object p0

    .line 68
    invoke-static {v1, v0, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 69
    .line 70
    .line 71
    return-void

    .line 72
    :cond_2
    if-eqz p1, :cond_3

    .line 73
    .line 74
    move-object v1, v2

    .line 75
    :cond_3
    invoke-static {p5, p2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 76
    .line 77
    .line 78
    move-result-object p1

    .line 79
    iget-object p2, p3, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 80
    .line 81
    invoke-static {p0, p2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 82
    .line 83
    .line 84
    move-result-object p0

    .line 85
    filled-new-array {p1, p0}, [Ll/pf60;

    .line 86
    .line 87
    .line 88
    move-result-object p0

    .line 89
    invoke-static {v1, v0, p0}, Ll/i4g0;->w(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 90
    .line 91
    .line 92
    return-void
.end method

.method public g(Ll/spf$a;)Z
    .locals 0

    .line 1
    iget-object p0, p1, Ll/spf$a;->i:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 2
    .line 3
    sget-object p1, Lcom/p1/mobile/putong/core/data/SwipeDirection;->RIGHT:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 4
    .line 5
    if-ne p0, p1, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x1

    .line 8
    return p0

    .line 9
    :cond_0
    const/4 p0, 0x0

    .line 10
    return p0
.end method

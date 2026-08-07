.class public Lcom/p1/mobile/putong/core/newui/explore/bifrost/ExploreCardStack;
.super Lcom/p1/mobile/putong/core/newui/home/opt/BifrostLayout;
.source "SourceFile"

# interfaces
.implements Ll/pn4;


# instance fields
.field public f:Ll/cpf;

.field public g:Ll/w9l;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 10
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/putong/core/newui/home/opt/BifrostLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 11
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/explore/bifrost/ExploreCardStack;->C()V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 12
    invoke-direct {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/newui/home/opt/BifrostLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 13
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/explore/bifrost/ExploreCardStack;->C()V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Ll/w9l;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/opt/BifrostLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    iput-object p2, p0, Lcom/p1/mobile/putong/core/newui/explore/bifrost/ExploreCardStack;->g:Ll/w9l;

    .line 5
    .line 6
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/explore/bifrost/ExploreCardStack;->C()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public static synthetic B(Lcom/p1/mobile/putong/core/newui/explore/bifrost/ExploreCardStack;Ll/txl0;Lcom/p1/mobile/putong/core/newui/home/opt/CardOperation;Z)Lcom/p1/mobile/putong/core/newui/home/opt/CardSwipeOutState;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/newui/explore/bifrost/ExploreCardStack;->D(Ll/txl0;Lcom/p1/mobile/putong/core/newui/home/opt/CardOperation;Z)Lcom/p1/mobile/putong/core/newui/home/opt/CardSwipeOutState;

    move-result-object p0

    return-object p0
.end method

.method private C()V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/newui/explore/bifrost/ExploreCardStack;->setAllowUpSwipe(Z)V

    .line 3
    .line 4
    .line 5
    new-instance v0, Ll/cpf;

    .line 6
    .line 7
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-direct {v0, v1}, Ll/cpf;-><init>(Landroid/content/Context;)V

    .line 12
    .line 13
    .line 14
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/explore/bifrost/ExploreCardStack;->f:Ll/cpf;

    .line 15
    .line 16
    invoke-virtual {v0, p0}, Ll/ox2;->l0(Ll/pn4;)V

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/explore/bifrost/ExploreCardStack;->f:Ll/cpf;

    .line 20
    .line 21
    new-instance v1, Ll/kpf;

    .line 22
    .line 23
    invoke-direct {v1, p0}, Ll/kpf;-><init>(Lcom/p1/mobile/putong/core/newui/explore/bifrost/ExploreCardStack;)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {v0, v1}, Ll/ox2;->k0(Ll/dn4;)V

    .line 27
    .line 28
    .line 29
    return-void
.end method


# virtual methods
.method public final synthetic D(Ll/txl0;Lcom/p1/mobile/putong/core/newui/home/opt/CardOperation;Z)Lcom/p1/mobile/putong/core/newui/home/opt/CardSwipeOutState;
    .locals 5

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/data/SwipeDirection;->LEFT:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 2
    .line 3
    sget-object v1, Lcom/p1/mobile/putong/core/newui/explore/bifrost/ExploreCardStack$a;->b:[I

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
    const/4 v1, 0x3

    .line 12
    const/4 v2, 0x2

    .line 13
    const/4 v3, 0x1

    .line 14
    if-eq p2, v3, :cond_1

    .line 15
    .line 16
    if-eq p2, v2, :cond_2

    .line 17
    .line 18
    if-eq p2, v1, :cond_0

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/core/data/SwipeDirection;->RIGHT:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_1
    sget-object v0, Lcom/p1/mobile/putong/core/data/SwipeDirection;->UP:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 25
    .line 26
    :cond_2
    :goto_0
    sget-object p2, Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;->pass:Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;

    .line 27
    .line 28
    :try_start_0
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/explore/bifrost/ExploreCardStack;->g:Ll/w9l;

    .line 29
    .line 30
    iget-object p1, p1, Ll/txl0;->a:Landroid/view/View;

    .line 31
    .line 32
    invoke-virtual {p2, p1, v0, p3}, Ll/w9l;->s(Landroid/view/View;Lcom/p1/mobile/putong/core/data/SwipeDirection;Z)Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;

    .line 33
    .line 34
    .line 35
    move-result-object p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 36
    goto :goto_1

    .line 37
    :catch_0
    move-exception p1

    .line 38
    sget-object p2, Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;->pass:Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;

    .line 39
    .line 40
    new-instance p3, Ljava/lang/RuntimeException;

    .line 41
    .line 42
    new-instance v0, Ljava/lang/StringBuilder;

    .line 43
    .line 44
    const-string v4, "\u5212\u5361\u5f02\u5e38\uff1a"

    .line 45
    .line 46
    invoke-direct {v0, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object v4

    .line 53
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 54
    .line 55
    .line 56
    const-string v4, ","

    .line 57
    .line 58
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 59
    .line 60
    .line 61
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/explore/bifrost/ExploreCardStack;->f:Ll/cpf;

    .line 62
    .line 63
    invoke-virtual {p0}, Ll/mx2;->b()Ljava/lang/String;

    .line 64
    .line 65
    .line 66
    move-result-object p0

    .line 67
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 68
    .line 69
    .line 70
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 71
    .line 72
    .line 73
    move-result-object p0

    .line 74
    invoke-direct {p3, p0, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 75
    .line 76
    .line 77
    invoke-static {p3}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 78
    .line 79
    .line 80
    move-object p0, p2

    .line 81
    :goto_1
    sget-object p1, Lcom/p1/mobile/putong/core/newui/explore/bifrost/ExploreCardStack$a;->c:[I

    .line 82
    .line 83
    invoke-virtual {p0}, Ljava/lang/Enum;->ordinal()I

    .line 84
    .line 85
    .line 86
    move-result p0

    .line 87
    aget p0, p1, p0

    .line 88
    .line 89
    if-eq p0, v3, :cond_5

    .line 90
    .line 91
    if-eq p0, v2, :cond_4

    .line 92
    .line 93
    if-eq p0, v1, :cond_3

    .line 94
    .line 95
    sget-object p0, Lcom/p1/mobile/putong/core/newui/home/opt/CardSwipeOutState;->BACK:Lcom/p1/mobile/putong/core/newui/home/opt/CardSwipeOutState;

    .line 96
    .line 97
    return-object p0

    .line 98
    :cond_3
    sget-object p0, Lcom/p1/mobile/putong/core/newui/home/opt/CardSwipeOutState;->STAY:Lcom/p1/mobile/putong/core/newui/home/opt/CardSwipeOutState;

    .line 99
    .line 100
    return-object p0

    .line 101
    :cond_4
    sget-object p0, Lcom/p1/mobile/putong/core/newui/home/opt/CardSwipeOutState;->PASS:Lcom/p1/mobile/putong/core/newui/home/opt/CardSwipeOutState;

    .line 102
    .line 103
    return-object p0

    .line 104
    :cond_5
    sget-object p0, Lcom/p1/mobile/putong/core/newui/home/opt/CardSwipeOutState;->BACK:Lcom/p1/mobile/putong/core/newui/home/opt/CardSwipeOutState;

    .line 105
    .line 106
    return-object p0
.end method

.method public final E(Lcom/p1/mobile/putong/core/data/SwipeDirection;Z)V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/newui/home/opt/CardOperation;->SWIPE_UP:Lcom/p1/mobile/putong/core/newui/home/opt/CardOperation;

    .line 2
    .line 3
    sget-object v1, Lcom/p1/mobile/putong/core/newui/explore/bifrost/ExploreCardStack$a;->a:[I

    .line 4
    .line 5
    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    aget p1, v1, p1

    .line 10
    .line 11
    const/4 v1, 0x1

    .line 12
    if-eq p1, v1, :cond_2

    .line 13
    .line 14
    const/4 v1, 0x2

    .line 15
    if-eq p1, v1, :cond_1

    .line 16
    .line 17
    const/4 v1, 0x3

    .line 18
    if-eq p1, v1, :cond_0

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
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/explore/bifrost/ExploreCardStack;->f:Ll/cpf;

    .line 27
    .line 28
    invoke-virtual {p0, v0, p2}, Ll/px2;->A0(Lcom/p1/mobile/putong/core/newui/home/opt/CardOperation;Z)Z

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public d0(FFFLcom/p1/mobile/putong/core/newui/home/opt/CardProgressAction;)V
    .locals 1

    .line 1
    const/4 p4, 0x0

    .line 2
    cmpl-float v0, p1, p4

    .line 3
    .line 4
    if-nez v0, :cond_0

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
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/explore/bifrost/ExploreCardStack;->g:Ll/w9l;

    .line 21
    .line 22
    cmpl-float p2, p3, p4

    .line 23
    .line 24
    if-nez p2, :cond_1

    .line 25
    .line 26
    const/4 p4, 0x1

    .line 27
    goto :goto_1

    .line 28
    :cond_1
    const/4 p4, 0x0

    .line 29
    :goto_1
    if-nez p2, :cond_2

    .line 30
    .line 31
    move p3, p1

    .line 32
    :cond_2
    invoke-virtual {p0, p4, p3}, Ll/w9l;->e(ZF)V

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public r(Lcom/p1/mobile/putong/core/data/SwipeDirection;Z)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/newui/explore/bifrost/ExploreCardStack;->E(Lcom/p1/mobile/putong/core/data/SwipeDirection;Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public setAdapter(Ll/nx2;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/explore/bifrost/ExploreCardStack;->f:Ll/cpf;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    invoke-virtual {v0, p1}, Ll/ox2;->i0(Ll/nx2;)V

    .line 7
    .line 8
    .line 9
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/explore/bifrost/ExploreCardStack;->f:Ll/cpf;

    .line 10
    .line 11
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/opt/BifrostLayout;->setRenderManager(Ll/px2;)V

    .line 12
    .line 13
    .line 14
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

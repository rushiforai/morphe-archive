.class public Ll/f4j;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/sxl0;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public b(Lcom/p1/mobile/putong/core/card/VSwipeCard;)V
    .locals 0

    .line 1
    return-void
.end method

.method public c(Landroid/view/View;)V
    .locals 0

    .line 1
    return-void
.end method

.method public d(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Lcom/p1/mobile/putong/core/data/VirtualCardType;)Landroid/view/View;
    .locals 0

    .line 1
    sget p0, Ll/nec0;->z:I

    .line 2
    .line 3
    const/4 p3, 0x0

    .line 4
    invoke-virtual {p1, p0, p2, p3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    return-object p0
.end method

.method public e(Landroid/view/View;ILcom/p1/mobile/putong/core/data/VirtualCardType;Landroid/view/View;)V
    .locals 0
    .param p4    # Landroid/view/View;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    instance-of p0, p1, Lcom/p1/mobile/putong/core/ui/home/view/FourSelectOneAdCard;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    check-cast p1, Lcom/p1/mobile/putong/core/ui/home/view/FourSelectOneAdCard;

    .line 6
    .line 7
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/core/ui/home/view/FourSelectOneAdCard;->f(I)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public f()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public g(Lcom/p1/mobile/putong/core/data/SwipeDirection;Ll/jam;)Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;
    .locals 2

    .line 1
    const/4 p0, 0x0

    .line 2
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 3
    .line 4
    .line 5
    move-result-object p0

    .line 6
    sget-object v0, Lcom/p1/mobile/putong/core/data/SwipeDirection;->RIGHT:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 7
    .line 8
    if-eq p1, v0, :cond_1

    .line 9
    .line 10
    sget-object v0, Lcom/p1/mobile/putong/core/data/SwipeDirection;->UP:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 11
    .line 12
    if-ne p1, v0, :cond_0

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_0
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 16
    .line 17
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 18
    .line 19
    iget-object p1, p1, Ll/dkb;->T4:Ll/vxd0;

    .line 20
    .line 21
    invoke-virtual {p1}, Ll/azd0;->get()Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object p2

    .line 25
    check-cast p2, Ljava/lang/Integer;

    .line 26
    .line 27
    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    .line 28
    .line 29
    .line 30
    move-result p2

    .line 31
    add-int/lit8 p2, p2, 0x1

    .line 32
    .line 33
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 34
    .line 35
    .line 36
    move-result-object p2

    .line 37
    invoke-virtual {p1, p2}, Ll/vxd0;->put(Ljava/lang/Object;)Z

    .line 38
    .line 39
    .line 40
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 41
    .line 42
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 43
    .line 44
    iget-object p1, p1, Ll/dkb;->T4:Ll/vxd0;

    .line 45
    .line 46
    invoke-virtual {p1}, Ll/azd0;->get()Ljava/lang/Object;

    .line 47
    .line 48
    .line 49
    move-result-object p1

    .line 50
    check-cast p1, Ljava/lang/Integer;

    .line 51
    .line 52
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 53
    .line 54
    .line 55
    move-result p1

    .line 56
    const/4 p2, 0x3

    .line 57
    if-lt p1, p2, :cond_2

    .line 58
    .line 59
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 60
    .line 61
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 62
    .line 63
    iget-object p1, p1, Ll/dkb;->S4:Ll/byd0;

    .line 64
    .line 65
    invoke-static {}, Ll/pzi0;->o()J

    .line 66
    .line 67
    .line 68
    move-result-wide v0

    .line 69
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 70
    .line 71
    .line 72
    move-result-object p2

    .line 73
    invoke-virtual {p1, p2}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 74
    .line 75
    .line 76
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 77
    .line 78
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 79
    .line 80
    iget-object p1, p1, Ll/dkb;->T4:Ll/vxd0;

    .line 81
    .line 82
    invoke-virtual {p1, p0}, Ll/vxd0;->put(Ljava/lang/Object;)Z

    .line 83
    .line 84
    .line 85
    goto :goto_1

    .line 86
    :cond_1
    :goto_0
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 87
    .line 88
    .line 89
    move-result-object p1

    .line 90
    invoke-virtual {p1}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 91
    .line 92
    .line 93
    move-result-object p1

    .line 94
    invoke-interface {p2}, Ll/jam;->getIVirtualCardContext()Landroid/content/Context;

    .line 95
    .line 96
    .line 97
    move-result-object v0

    .line 98
    invoke-interface {p2}, Ll/jam;->getIVirtualCardUserInfoProxy()Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 99
    .line 100
    .line 101
    move-result-object p2

    .line 102
    iget-object p2, p2, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->fourSelectOneAdCardData:Lcom/p1/mobile/putong/core/data/FourSelectOneAdCardData;

    .line 103
    .line 104
    iget-object p2, p2, Lcom/p1/mobile/putong/core/data/FourSelectOneAdCardData;->firstIds:Ljava/lang/String;

    .line 105
    .line 106
    invoke-interface {p1, v0, p2}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->jl(Landroid/content/Context;Ljava/lang/String;)V

    .line 107
    .line 108
    .line 109
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 110
    .line 111
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 112
    .line 113
    iget-object p1, p1, Ll/dkb;->T4:Ll/vxd0;

    .line 114
    .line 115
    invoke-virtual {p1, p0}, Ll/vxd0;->put(Ljava/lang/Object;)Z

    .line 116
    .line 117
    .line 118
    :cond_2
    :goto_1
    sget-object p0, Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;->pass:Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;

    .line 119
    .line 120
    return-object p0
.end method

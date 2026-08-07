.class public Ll/rmf;
.super Ll/omf;
.source "SourceFile"


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/newui/home/cache/CacheCardType;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/omf;-><init>(Lcom/p1/mobile/putong/core/newui/home/cache/CacheCardType;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic A(Landroid/os/Bundle;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic B(Ll/rmf;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/rmf;->C()V

    return-void
.end method


# virtual methods
.method public final synthetic C()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/omf;->a:Ljava/util/Deque;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/Collection;->clear()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Ll/omf;->s()Lcom/p1/mobile/putong/core/newui/home/cache/CacheCardType;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    invoke-static {p0}, Ll/uj4;->c(Lcom/p1/mobile/putong/core/newui/home/cache/CacheCardType;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public e(Landroid/content/Context;Ll/ner;)I
    .locals 7

    .line 1
    new-instance v0, Ll/pmf;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/pmf;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance v1, Ll/qmf;

    .line 7
    .line 8
    invoke-direct {v1, p0}, Ll/qmf;-><init>(Ll/rmf;)V

    .line 9
    .line 10
    .line 11
    invoke-interface {p2, v0, v1}, Ll/ner;->creates(Ll/y20;Ll/x20;)V

    .line 12
    .line 13
    .line 14
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->K()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 15
    .line 16
    .line 17
    move-result-object p2

    .line 18
    invoke-interface {p2}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->me_()Lcom/p1/mobile/putong/data/User;

    .line 19
    .line 20
    .line 21
    move-result-object p2

    .line 22
    new-instance v0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 23
    .line 24
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;-><init>()V

    .line 25
    .line 26
    .line 27
    iget-object v1, p2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 28
    .line 29
    iput-object v1, v0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->id:Ljava/lang/String;

    .line 30
    .line 31
    move-object v1, p1

    .line 32
    check-cast v1, Lcom/p1/mobile/android/app/Act;

    .line 33
    .line 34
    invoke-static {v1, p2, v0}, Ll/vmf;->d(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;)Ljava/util/List;

    .line 35
    .line 36
    .line 37
    move-result-object p2

    .line 38
    new-instance v1, Ll/e3i0;

    .line 39
    .line 40
    invoke-direct {v1, p1}, Ll/e3i0;-><init>(Landroid/content/Context;)V

    .line 41
    .line 42
    .line 43
    new-instance v3, Landroid/widget/FrameLayout;

    .line 44
    .line 45
    invoke-direct {v3, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 46
    .line 47
    .line 48
    invoke-static {p2}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 49
    .line 50
    .line 51
    move-result v0

    .line 52
    if-nez v0, :cond_0

    .line 53
    .line 54
    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 55
    .line 56
    .line 57
    move-result-object v6

    .line 58
    :goto_0
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    .line 59
    .line 60
    .line 61
    move-result v0

    .line 62
    if-eqz v0, :cond_0

    .line 63
    .line 64
    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    check-cast v0, Ll/pf60;

    .line 69
    .line 70
    iget-object v0, v0, Ll/pf60;->a:Ljava/lang/Object;

    .line 71
    .line 72
    move-object v4, v0

    .line 73
    check-cast v4, Lcom/p1/mobile/putong/core/newui/home/card/expanded/holder/HomeCardExpandedType;

    .line 74
    .line 75
    invoke-interface {p2}, Ljava/util/List;->size()I

    .line 76
    .line 77
    .line 78
    move-result v5

    .line 79
    move-object v0, p0

    .line 80
    move-object v2, p1

    .line 81
    invoke-virtual/range {v0 .. v5}, Ll/omf;->x(Ll/e3i0;Landroid/content/Context;Landroid/widget/FrameLayout;Lcom/p1/mobile/putong/core/newui/home/card/expanded/holder/HomeCardExpandedType;I)V

    .line 82
    .line 83
    .line 84
    goto :goto_0

    .line 85
    :cond_0
    invoke-interface {p2}, Ljava/util/List;->size()I

    .line 86
    .line 87
    .line 88
    move-result p0

    .line 89
    return p0
.end method

.method public r()I
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    return p0
.end method

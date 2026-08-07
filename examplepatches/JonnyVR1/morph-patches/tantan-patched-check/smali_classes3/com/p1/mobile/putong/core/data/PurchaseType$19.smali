.class final enum Lcom/p1/mobile/putong/core/data/PurchaseType$19;
.super Lcom/p1/mobile/putong/core/data/PurchaseType;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/data/PurchaseType;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4011
    name = null
.end annotation


# direct methods
.method private constructor <init>(Ljava/lang/String;I)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, p1, p2, v0}, Lcom/p1/mobile/putong/core/data/PurchaseType;-><init>(Ljava/lang/String;ILl/vib0;)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/String;ILl/vib0;)V
    .locals 0

    .line 6
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/putong/core/data/PurchaseType$19;-><init>(Ljava/lang/String;I)V

    return-void
.end method


# virtual methods
.method public getPrivilegeData(Lcom/p1/mobile/putong/data/Gender;)Ljava/util/ArrayList;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/data/Gender;",
            ")",
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/core/data/Privilege;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance p0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    sget-object v0, Lcom/p1/mobile/putong/core/data/Privilege;->immediately_match:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 7
    .line 8
    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    sget-object v0, Lcom/p1/mobile/putong/core/data/Privilege;->oDiamondSvipSkin:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 12
    .line 13
    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    sget-object v0, Lcom/p1/mobile/putong/core/data/Privilege;->oDiamondVisitor:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 17
    .line 18
    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 19
    .line 20
    .line 21
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-virtual {v0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->d4()Z

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    if-eqz v0, :cond_0

    .line 34
    .line 35
    sget-object v0, Lcom/p1/mobile/putong/core/data/Privilege;->visitor_hide_footprint:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 36
    .line 37
    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 38
    .line 39
    .line 40
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/core/data/Privilege;->customer_service:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 41
    .line 42
    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 43
    .line 44
    .line 45
    sget-object v0, Lcom/p1/mobile/putong/core/data/Privilege;->boost:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 46
    .line 47
    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 48
    .line 49
    .line 50
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    invoke-virtual {v0}, Ll/j49;->g()Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;->D9()Z

    .line 59
    .line 60
    .line 61
    move-result v0

    .line 62
    if-eqz v0, :cond_1

    .line 63
    .line 64
    sget-object v0, Lcom/p1/mobile/putong/core/data/Privilege;->nearby_people:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 65
    .line 66
    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 67
    .line 68
    .line 69
    :cond_1
    sget-object v0, Lcom/p1/mobile/putong/core/data/Privilege;->vip_super_like:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 70
    .line 71
    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 72
    .line 73
    .line 74
    sget-object v0, Lcom/p1/mobile/putong/core/data/Privilege;->online_match_tickets:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 75
    .line 76
    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 77
    .line 78
    .line 79
    sget-object v0, Lcom/p1/mobile/putong/core/data/Privilege;->voice_quick_chat:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 80
    .line 81
    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 82
    .line 83
    .line 84
    sget-object v0, Lcom/p1/mobile/putong/core/data/Privilege;->oDiamondGreetings:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 85
    .line 86
    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 87
    .line 88
    .line 89
    sget-object v0, Lcom/p1/mobile/putong/core/data/Privilege;->live_entry_animation:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 90
    .line 91
    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 92
    .line 93
    .line 94
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 95
    .line 96
    .line 97
    move-result-object v0

    .line 98
    invoke-interface {v0}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->Vo()Z

    .line 99
    .line 100
    .line 101
    move-result v0

    .line 102
    if-eqz v0, :cond_2

    .line 103
    .line 104
    sget-object v0, Lcom/p1/mobile/putong/core/data/Privilege;->moment_boost:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 105
    .line 106
    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 107
    .line 108
    .line 109
    :cond_2
    sget-object v0, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_PICKS_MEMBERSHIP:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 110
    .line 111
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/core/data/PurchaseType;->getPrivilegeData(Lcom/p1/mobile/putong/data/Gender;)Ljava/util/ArrayList;

    .line 112
    .line 113
    .line 114
    move-result-object p1

    .line 115
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 116
    .line 117
    .line 118
    sget-object p1, Lcom/p1/mobile/putong/core/data/Privilege;->oDiamondSvipExtra:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 119
    .line 120
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 121
    .line 122
    .line 123
    return-object p0
.end method

.method public productCategory()Lcom/p1/mobile/putong/core/data/ProductCategory;
    .locals 0

    .line 1
    const-string p0, "oDiamond"

    .line 2
    .line 3
    invoke-static {p0}, Lcom/p1/mobile/putong/core/data/ProductCategory;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

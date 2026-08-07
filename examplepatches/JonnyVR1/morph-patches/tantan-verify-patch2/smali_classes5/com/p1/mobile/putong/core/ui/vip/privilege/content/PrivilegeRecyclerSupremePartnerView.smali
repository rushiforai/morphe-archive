.class public Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegeRecyclerSupremePartnerView;
.super Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegeRecycleView;
.source "SourceFile"

# interfaces
.implements Ll/o290;


# instance fields
.field public e:Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/VipFrag;

.field public f:[Lcom/p1/mobile/putong/core/data/Privilege;

.field public g:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ll/h390;",
            ">;"
        }
    .end annotation
.end field

.field public h:Ll/u290;

.field public final i:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Lcom/p1/mobile/putong/core/ui/purchase/d;",
            ">;"
        }
    .end annotation
.end field

.field public j:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    .line 45
    invoke-direct {p0, p1, v0}, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegeRecyclerSupremePartnerView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    .line 44
    invoke-direct {p0, p1, p2, v0}, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegeRecyclerSupremePartnerView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 7

    .line 1
    invoke-direct {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegeRecycleView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 2
    .line 3
    .line 4
    sget-object v0, Lcom/p1/mobile/putong/core/data/Privilege;->city_topping:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 5
    .line 6
    sget-object v1, Lcom/p1/mobile/putong/core/data/Privilege;->personal_customization:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 7
    .line 8
    sget-object v2, Lcom/p1/mobile/putong/core/data/Privilege;->mysterious_mode:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 9
    .line 10
    sget-object v3, Lcom/p1/mobile/putong/core/data/Privilege;->immediately_match:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 11
    .line 12
    sget-object v4, Lcom/p1/mobile/putong/core/data/Privilege;->nearby_people:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 13
    .line 14
    sget-object v5, Lcom/p1/mobile/putong/core/data/Privilege;->exclusive_dressing_up:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 15
    .line 16
    sget-object v6, Lcom/p1/mobile/putong/core/data/Privilege;->customer_service:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 17
    .line 18
    filled-new-array/range {v0 .. v6}, [Lcom/p1/mobile/putong/core/data/Privilege;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegeRecyclerSupremePartnerView;->f:[Lcom/p1/mobile/putong/core/data/Privilege;

    .line 23
    .line 24
    new-instance p1, Ljava/util/ArrayList;

    .line 25
    .line 26
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 27
    .line 28
    .line 29
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegeRecyclerSupremePartnerView;->g:Ljava/util/ArrayList;

    .line 30
    .line 31
    invoke-static {}, Lrx/subjects/a;->b()Lrx/subjects/a;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegeRecyclerSupremePartnerView;->i:Lrx/subjects/a;

    .line 36
    .line 37
    const/4 p1, 0x0

    .line 38
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegeRecyclerSupremePartnerView;->j:Z

    .line 39
    .line 40
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegeRecyclerSupremePartnerView;->init()V

    .line 41
    .line 42
    .line 43
    return-void
.end method

.method public static synthetic E(Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegeRecyclerSupremePartnerView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegeRecyclerSupremePartnerView;->R(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic F(Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegeRecyclerSupremePartnerView;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegeRecyclerSupremePartnerView;->T(Ljava/lang/Boolean;)V

    return-void
.end method

.method public static synthetic G(Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegeRecyclerSupremePartnerView;Lcom/p1/mobile/putong/core/data/PurchaseType;Lcom/p1/mobile/putong/core/data/Privilege;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegeRecyclerSupremePartnerView;->X(Lcom/p1/mobile/putong/core/data/PurchaseType;Lcom/p1/mobile/putong/core/data/Privilege;)V

    return-void
.end method

.method public static synthetic H(Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegeRecyclerSupremePartnerView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegeRecyclerSupremePartnerView;->Q(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic I(Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegeRecyclerSupremePartnerView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegeRecyclerSupremePartnerView;->P(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic J(Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegeRecyclerSupremePartnerView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegeRecyclerSupremePartnerView;->U(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic K(Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegeRecyclerSupremePartnerView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegeRecyclerSupremePartnerView;->S(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic L(Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegeRecyclerSupremePartnerView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegeRecyclerSupremePartnerView;->W(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic M(Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegeRecyclerSupremePartnerView;Landroid/view/View;Lcom/p1/mobile/putong/core/data/Privilege;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegeRecyclerSupremePartnerView;->V(Landroid/view/View;Lcom/p1/mobile/putong/core/data/Privilege;)V

    return-void
.end method

.method public static synthetic N(Lcom/p1/mobile/putong/core/data/UserPrivilege;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-static {}, Ll/joa;->O3()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method private Y()V
    .locals 10

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegeRecyclerSupremePartnerView;->g:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegeRecyclerSupremePartnerView;->g:Ljava/util/ArrayList;

    .line 7
    .line 8
    new-instance v1, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListTitle$a;

    .line 9
    .line 10
    new-instance v2, Ll/zh90;

    .line 11
    .line 12
    invoke-direct {v2, p0}, Ll/zh90;-><init>(Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegeRecyclerSupremePartnerView;)V

    .line 13
    .line 14
    .line 15
    sget-object v3, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_SUPREME_PARTNER:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 16
    .line 17
    const-string v4, "\u81f3\u5c0a\u5408\u4f19\u4eba\u7279\u6743"

    .line 18
    .line 19
    const-string v5, "\u67e5\u770b\u5168\u90e8"

    .line 20
    .line 21
    invoke-direct {v1, v4, v5, v2, v3}, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListTitle$a;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListTitle$a$a;Lcom/p1/mobile/putong/core/data/PurchaseType;)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 25
    .line 26
    .line 27
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegeRecyclerSupremePartnerView;->f:[Lcom/p1/mobile/putong/core/data/Privilege;

    .line 28
    .line 29
    array-length v1, v0

    .line 30
    const/4 v2, 0x0

    .line 31
    :goto_0
    if-ge v2, v1, :cond_0

    .line 32
    .line 33
    aget-object v3, v0, v2

    .line 34
    .line 35
    sget-object v4, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_SUPREME_PARTNER:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 36
    .line 37
    invoke-static {v3, v4}, Ll/m190;->a(Lcom/p1/mobile/putong/core/data/Privilege;Lcom/p1/mobile/putong/core/data/PurchaseType;)Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListItem$a;

    .line 38
    .line 39
    .line 40
    move-result-object v3

    .line 41
    new-instance v4, Ll/ai90;

    .line 42
    .line 43
    invoke-direct {v4, p0}, Ll/ai90;-><init>(Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegeRecyclerSupremePartnerView;)V

    .line 44
    .line 45
    .line 46
    invoke-virtual {v3, v4}, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListItem$a;->g(Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListItem$a$a;)V

    .line 47
    .line 48
    .line 49
    iget-object v4, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegeRecyclerSupremePartnerView;->g:Ljava/util/ArrayList;

    .line 50
    .line 51
    invoke-virtual {v4, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 52
    .line 53
    .line 54
    add-int/lit8 v2, v2, 0x1

    .line 55
    .line 56
    goto :goto_0

    .line 57
    :cond_0
    invoke-static {}, Ll/joa;->O3()Z

    .line 58
    .line 59
    .line 60
    move-result v0

    .line 61
    const/4 v1, 0x0

    .line 62
    const-string v2, ""

    .line 63
    .line 64
    const-string v3, "\u81f3\u5c0a\u5408\u4f19\u4eba\u5c0a\u4eab"

    .line 65
    .line 66
    if-nez v0, :cond_1

    .line 67
    .line 68
    new-instance v8, Ljava/util/ArrayList;

    .line 69
    .line 70
    invoke-direct {v8}, Ljava/util/ArrayList;-><init>()V

    .line 71
    .line 72
    .line 73
    new-instance v5, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListTitle$a;

    .line 74
    .line 75
    sget-object v0, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_SUPREME_PARTNER:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 76
    .line 77
    invoke-direct {v5, v3, v2, v1, v0}, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListTitle$a;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListTitle$a$a;Lcom/p1/mobile/putong/core/data/PurchaseType;)V

    .line 78
    .line 79
    .line 80
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegeRecyclerSupremePartnerView;->getDressUpItem()Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListPartnerDressUpItem$a;

    .line 81
    .line 82
    .line 83
    move-result-object v0

    .line 84
    invoke-virtual {v8, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 85
    .line 86
    .line 87
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegeRecyclerSupremePartnerView;->getMysteriousModeItem()Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListPartnerDressUpItem$a;

    .line 88
    .line 89
    .line 90
    move-result-object v0

    .line 91
    invoke-virtual {v8, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 92
    .line 93
    .line 94
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegeRecyclerSupremePartnerView;->getServiceItem()Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListDiamondServiceItem$a;

    .line 95
    .line 96
    .line 97
    move-result-object v0

    .line 98
    invoke-virtual {v8, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 99
    .line 100
    .line 101
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegeRecyclerSupremePartnerView;->getNearbyItem()Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListNearbyItem$a;

    .line 102
    .line 103
    .line 104
    move-result-object v0

    .line 105
    invoke-virtual {v8, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 106
    .line 107
    .line 108
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegeRecyclerSupremePartnerView;->getSeeItem()Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListSeeItem$a;

    .line 109
    .line 110
    .line 111
    move-result-object v0

    .line 112
    invoke-virtual {v8, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 113
    .line 114
    .line 115
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegeRecyclerSupremePartnerView;->getPrivacyItem()Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/a;

    .line 116
    .line 117
    .line 118
    move-result-object v0

    .line 119
    invoke-virtual {v8, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 120
    .line 121
    .line 122
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegeRecyclerSupremePartnerView;->getAdvancedFiltertem()Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/a;

    .line 123
    .line 124
    .line 125
    move-result-object v0

    .line 126
    invoke-virtual {v8, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 127
    .line 128
    .line 129
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegeRecyclerSupremePartnerView;->g:Ljava/util/ArrayList;

    .line 130
    .line 131
    new-instance v4, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListNoSVipItem$a;

    .line 132
    .line 133
    new-instance v9, Ll/bi90;

    .line 134
    .line 135
    invoke-direct {v9, p0}, Ll/bi90;-><init>(Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegeRecyclerSupremePartnerView;)V

    .line 136
    .line 137
    .line 138
    const-string v6, "\u89e3\u9501\u66f4\u591a\u4f1a\u5458\u7279\u6743"

    .line 139
    .line 140
    const/4 v7, 0x0

    .line 141
    invoke-direct/range {v4 .. v9}, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListNoSVipItem$a;-><init>(Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListTitle$a;Ljava/lang/String;ZLjava/util/List;Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListNoSVipItem$a$a;)V

    .line 142
    .line 143
    .line 144
    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 145
    .line 146
    .line 147
    goto :goto_1

    .line 148
    :cond_1
    new-instance v0, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListTitle$a;

    .line 149
    .line 150
    sget-object v4, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_SUPREME_PARTNER:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 151
    .line 152
    invoke-direct {v0, v3, v2, v1, v4}, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListTitle$a;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListTitle$a$a;Lcom/p1/mobile/putong/core/data/PurchaseType;)V

    .line 153
    .line 154
    .line 155
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegeRecyclerSupremePartnerView;->g:Ljava/util/ArrayList;

    .line 156
    .line 157
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 158
    .line 159
    .line 160
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegeRecyclerSupremePartnerView;->g:Ljava/util/ArrayList;

    .line 161
    .line 162
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegeRecyclerSupremePartnerView;->getDressUpItem()Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListPartnerDressUpItem$a;

    .line 163
    .line 164
    .line 165
    move-result-object v1

    .line 166
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 167
    .line 168
    .line 169
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegeRecyclerSupremePartnerView;->g:Ljava/util/ArrayList;

    .line 170
    .line 171
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegeRecyclerSupremePartnerView;->getMysteriousModeItem()Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListPartnerDressUpItem$a;

    .line 172
    .line 173
    .line 174
    move-result-object v1

    .line 175
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 176
    .line 177
    .line 178
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegeRecyclerSupremePartnerView;->g:Ljava/util/ArrayList;

    .line 179
    .line 180
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegeRecyclerSupremePartnerView;->getServiceItem()Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListDiamondServiceItem$a;

    .line 181
    .line 182
    .line 183
    move-result-object v1

    .line 184
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 185
    .line 186
    .line 187
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegeRecyclerSupremePartnerView;->g:Ljava/util/ArrayList;

    .line 188
    .line 189
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegeRecyclerSupremePartnerView;->getNearbyItem()Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListNearbyItem$a;

    .line 190
    .line 191
    .line 192
    move-result-object v1

    .line 193
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 194
    .line 195
    .line 196
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegeRecyclerSupremePartnerView;->g:Ljava/util/ArrayList;

    .line 197
    .line 198
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegeRecyclerSupremePartnerView;->getSeeItem()Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListSeeItem$a;

    .line 199
    .line 200
    .line 201
    move-result-object v1

    .line 202
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 203
    .line 204
    .line 205
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegeRecyclerSupremePartnerView;->g:Ljava/util/ArrayList;

    .line 206
    .line 207
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegeRecyclerSupremePartnerView;->getPrivacyItem()Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/a;

    .line 208
    .line 209
    .line 210
    move-result-object v1

    .line 211
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 212
    .line 213
    .line 214
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegeRecyclerSupremePartnerView;->g:Ljava/util/ArrayList;

    .line 215
    .line 216
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegeRecyclerSupremePartnerView;->getAdvancedFiltertem()Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/a;

    .line 217
    .line 218
    .line 219
    move-result-object v1

    .line 220
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 221
    .line 222
    .line 223
    :goto_1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegeRecyclerSupremePartnerView;->h:Ll/u290;

    .line 224
    .line 225
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegeRecyclerSupremePartnerView;->g:Ljava/util/ArrayList;

    .line 226
    .line 227
    invoke-virtual {v0, p0}, Ll/u290;->J(Ljava/util/ArrayList;)V

    .line 228
    .line 229
    .line 230
    return-void
.end method

.method private init()V
    .locals 1

    .line 1
    const/4 v0, 0x2

    .line 2
    invoke-virtual {p0, v0}, Landroid/view/View;->setOverScrollMode(I)V

    .line 3
    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->setClipChildren(Z)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0, v0}, Landroidx/recyclerview/widget/RecyclerView;->setClipToPadding(Z)V

    .line 10
    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public O(Ll/ub3;Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/VipFrag;)V
    .locals 1

    .line 1
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->C0:Ll/joa;

    .line 4
    .line 5
    const-string v0, "supremePartner"

    .line 6
    .line 7
    invoke-static {v0}, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {p1, v0}, Ll/joa;->v3(Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;)Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    invoke-virtual {p2, p1}, Lcom/p1/mobile/android/app/Frag;->duringCreated(Lrx/c;)Lrx/c;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    new-instance p2, Ll/xh90;

    .line 20
    .line 21
    invoke-direct {p2}, Ll/xh90;-><init>()V

    .line 22
    .line 23
    .line 24
    invoke-virtual {p1, p2}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    invoke-virtual {p1}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    new-instance p2, Ll/yh90;

    .line 33
    .line 34
    invoke-direct {p2, p0}, Ll/yh90;-><init>(Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegeRecyclerSupremePartnerView;)V

    .line 35
    .line 36
    .line 37
    invoke-static {p2}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 42
    .line 43
    .line 44
    return-void
.end method

.method public final synthetic P(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {}, Ll/rj90;->b()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegeRecyclerSupremePartnerView;->e:Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/VipFrag;

    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    const/4 p1, 0x1

    .line 11
    invoke-static {p0, p1}, Ll/jz20;->c(Lcom/p1/mobile/android/app/Act;I)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public final synthetic Q(Landroid/view/View;)V
    .locals 2

    .line 1
    new-instance p1, Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v0, "navigation_to"

    .line 7
    .line 8
    const-string v1, "nearby_people"

    .line 9
    .line 10
    invoke-interface {p1, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegeRecyclerSupremePartnerView;->e:Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/VipFrag;

    .line 14
    .line 15
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegeRecyclerSupremePartnerView;->e:Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/VipFrag;

    .line 20
    .line 21
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    const-string v1, "supreme_sartner"

    .line 26
    .line 27
    invoke-static {v1}, Lcom/p1/mobile/putong/data/NavigationCardIntent;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/NavigationCardIntent;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    invoke-static {p0, v1, p1}, Ll/xwa;->g(Landroid/content/Context;Lcom/p1/mobile/putong/data/NavigationCardIntent;Ljava/util/Map;)Landroid/content/Intent;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    invoke-virtual {v0, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method public final synthetic R(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {}, Ll/rj90;->e()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegeRecyclerSupremePartnerView;->e:Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/VipFrag;

    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    const/4 p1, 0x2

    .line 11
    invoke-static {p0, p1}, Ll/jz20;->c(Lcom/p1/mobile/android/app/Act;I)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public final synthetic S(Landroid/view/View;)V
    .locals 2

    .line 1
    invoke-static {}, Ll/rbb0;->q()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-nez p1, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    new-instance v0, Landroid/content/Intent;

    .line 12
    .line 13
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    const-class v1, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersAct;

    .line 18
    .line 19
    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p1, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 23
    .line 24
    .line 25
    :cond_0
    return-void
.end method

.method public final synthetic T(Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegeRecyclerSupremePartnerView;->Y()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic U(Landroid/view/View;)V
    .locals 0

    .line 1
    const/4 p1, 0x0

    .line 2
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegeRecyclerSupremePartnerView;->a0(Lcom/p1/mobile/putong/core/data/Privilege;)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public final synthetic V(Landroid/view/View;Lcom/p1/mobile/putong/core/data/Privilege;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegeRecyclerSupremePartnerView;->a0(Lcom/p1/mobile/putong/core/data/Privilege;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic W(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegeRecyclerSupremePartnerView;->e:Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/VipFrag;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-static {p0}, Ll/oql0;->e(Landroid/app/Activity;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final synthetic X(Lcom/p1/mobile/putong/core/data/PurchaseType;Lcom/p1/mobile/putong/core/data/Privilege;)V
    .locals 0

    .line 1
    invoke-static {}, Ll/joa;->O3()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegeRecyclerSupremePartnerView;->e:Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/VipFrag;

    .line 9
    .line 10
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    invoke-static {p0}, Ll/oql0;->e(Landroid/app/Activity;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public Z(Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/VipFrag;)V
    .locals 3

    .line 1
    new-instance v0, Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-direct {v0, v1}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>(Landroid/content/Context;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0, v0}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$o;)V

    .line 11
    .line 12
    .line 13
    new-instance v0, Ll/u290;

    .line 14
    .line 15
    const/4 v1, 0x0

    .line 16
    sget-object v2, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_SUPREME_PARTNER:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 17
    .line 18
    invoke-direct {v0, p1, v1, p0, v2}, Ll/u290;-><init>(Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/VipFrag;Ll/t5m;Ll/o290;Lcom/p1/mobile/putong/core/data/PurchaseType;)V

    .line 19
    .line 20
    .line 21
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegeRecyclerSupremePartnerView;->h:Ll/u290;

    .line 22
    .line 23
    invoke-virtual {p0, v0}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 24
    .line 25
    .line 26
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegeRecyclerSupremePartnerView;->Y()V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public final a0(Lcom/p1/mobile/putong/core/data/Privilege;)V
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/ui/vip/privilege/dlg/a;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegeRecyclerSupremePartnerView;->e:Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/VipFrag;

    .line 4
    .line 5
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/ui/vip/privilege/dlg/a;-><init>(Lcom/p1/mobile/putong/app/PutongFrag;)V

    .line 6
    .line 7
    .line 8
    sget-object v1, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_SUPREME_PARTNER:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 9
    .line 10
    new-instance v2, Ll/ci90;

    .line 11
    .line 12
    invoke-direct {v2, p0}, Ll/ci90;-><init>(Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegeRecyclerSupremePartnerView;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/putong/core/ui/vip/privilege/dlg/a;->p(Lcom/p1/mobile/putong/core/data/PurchaseType;Lcom/p1/mobile/putong/core/ui/vip/privilege/dlg/a$f;)V

    .line 16
    .line 17
    .line 18
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    if-eqz p0, :cond_0

    .line 23
    .line 24
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/core/ui/vip/privilege/dlg/a;->o(Lcom/p1/mobile/putong/core/data/Privilege;)V

    .line 25
    .line 26
    .line 27
    :cond_0
    return-void
.end method

.method public c()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegeRecyclerSupremePartnerView;->j:Z

    .line 3
    .line 4
    return-void
.end method

.method public getAdvancedFiltertem()Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/a;
    .locals 5

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_SUPREME_PARTNER:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 2
    .line 3
    sget-object v1, Lcom/p1/mobile/putong/core/data/Privilege;->advanced_filter:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/j690;->m(Lcom/p1/mobile/putong/core/data/PurchaseType;Lcom/p1/mobile/putong/core/data/Privilege;)Ll/a690;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0}, Ll/a690;->t()Ljava/lang/CharSequence;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-interface {v1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-virtual {v0}, Ll/a690;->q()Ljava/lang/CharSequence;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-interface {v0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    sget v2, Ll/dbc0;->Jk:I

    .line 26
    .line 27
    new-instance v3, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/a;

    .line 28
    .line 29
    const-string v4, "advancing"

    .line 30
    .line 31
    invoke-direct {v3, v2, v1, v0, v4}, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/a;-><init>(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    new-instance v0, Ll/wh90;

    .line 35
    .line 36
    invoke-direct {v0, p0}, Ll/wh90;-><init>(Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegeRecyclerSupremePartnerView;)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {v3, v0}, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/a;->f(Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/a$a;)V

    .line 40
    .line 41
    .line 42
    return-object v3
.end method

.method public getDressUpItem()Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListPartnerDressUpItem$a;
    .locals 3

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_SUPREME_PARTNER:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 2
    .line 3
    sget-object v0, Lcom/p1/mobile/putong/core/data/Privilege;->exclusive_dressing_up:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 4
    .line 5
    invoke-static {p0, v0}, Ll/j690;->m(Lcom/p1/mobile/putong/core/data/PurchaseType;Lcom/p1/mobile/putong/core/data/Privilege;)Ll/a690;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p0}, Ll/a690;->t()Ljava/lang/CharSequence;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-interface {v1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-virtual {p0}, Ll/a690;->q()Ljava/lang/CharSequence;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-interface {p0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    new-instance v2, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListPartnerDressUpItem$a;

    .line 26
    .line 27
    invoke-direct {v2, v1, p0, v0}, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListPartnerDressUpItem$a;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Privilege;)V

    .line 28
    .line 29
    .line 30
    return-object v2
.end method

.method public getMysteriousModeItem()Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListPartnerDressUpItem$a;
    .locals 3

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_SUPREME_PARTNER:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 2
    .line 3
    sget-object v0, Lcom/p1/mobile/putong/core/data/Privilege;->mysterious_mode:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 4
    .line 5
    invoke-static {p0, v0}, Ll/j690;->m(Lcom/p1/mobile/putong/core/data/PurchaseType;Lcom/p1/mobile/putong/core/data/Privilege;)Ll/a690;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p0}, Ll/a690;->t()Ljava/lang/CharSequence;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-interface {v1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-virtual {p0}, Ll/a690;->q()Ljava/lang/CharSequence;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-interface {p0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    new-instance v2, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListPartnerDressUpItem$a;

    .line 26
    .line 27
    invoke-direct {v2, v1, p0, v0}, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListPartnerDressUpItem$a;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Privilege;)V

    .line 28
    .line 29
    .line 30
    return-object v2
.end method

.method public getNearbyItem()Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListNearbyItem$a;
    .locals 2

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListNearbyItem$a;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListNearbyItem$a;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance v1, Ll/uh90;

    .line 7
    .line 8
    invoke-direct {v1, p0}, Ll/uh90;-><init>(Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegeRecyclerSupremePartnerView;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListNearbyItem$a;->b(Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListNearbyItem$a$a;)V

    .line 12
    .line 13
    .line 14
    return-object v0
.end method

.method public getPrivacyItem()Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/a;
    .locals 5

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_SUPREME_PARTNER:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 2
    .line 3
    sget-object v1, Lcom/p1/mobile/putong/core/data/Privilege;->privacy_membership:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/j690;->m(Lcom/p1/mobile/putong/core/data/PurchaseType;Lcom/p1/mobile/putong/core/data/Privilege;)Ll/a690;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0}, Ll/a690;->t()Ljava/lang/CharSequence;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-interface {v1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-virtual {v0}, Ll/a690;->q()Ljava/lang/CharSequence;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-interface {v0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    sget v2, Ll/dbc0;->jl:I

    .line 26
    .line 27
    new-instance v3, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/a;

    .line 28
    .line 29
    const-string v4, "privacy"

    .line 30
    .line 31
    invoke-direct {v3, v2, v1, v0, v4}, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/a;-><init>(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    new-instance v0, Ll/th90;

    .line 35
    .line 36
    invoke-direct {v0, p0}, Ll/th90;-><init>(Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegeRecyclerSupremePartnerView;)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {v3, v0}, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/a;->f(Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/a$a;)V

    .line 40
    .line 41
    .line 42
    return-object v3
.end method

.method public getSeeItem()Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListSeeItem$a;
    .locals 2

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListSeeItem$a;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListSeeItem$a;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance v1, Ll/vh90;

    .line 7
    .line 8
    invoke-direct {v1, p0}, Ll/vh90;-><init>(Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegeRecyclerSupremePartnerView;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListSeeItem$a;->b(Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListSeeItem$a$a;)V

    .line 12
    .line 13
    .line 14
    return-object v0
.end method

.method public getServiceItem()Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListDiamondServiceItem$a;
    .locals 3

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_SUPREME_PARTNER:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 2
    .line 3
    sget-object v0, Lcom/p1/mobile/putong/core/data/Privilege;->customer_service:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 4
    .line 5
    invoke-static {p0, v0}, Ll/j690;->m(Lcom/p1/mobile/putong/core/data/PurchaseType;Lcom/p1/mobile/putong/core/data/Privilege;)Ll/a690;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0}, Ll/a690;->t()Ljava/lang/CharSequence;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-interface {v1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-virtual {v0}, Ll/a690;->q()Ljava/lang/CharSequence;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-interface {v0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    new-instance v2, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListDiamondServiceItem$a;

    .line 26
    .line 27
    invoke-direct {v2, v1, v0, p0}, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListDiamondServiceItem$a;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/PurchaseType;)V

    .line 28
    .line 29
    .line 30
    return-object v2
.end method

.method public k(Ll/ub3;Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/VipFrag;)V
    .locals 0

    .line 1
    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegeRecyclerSupremePartnerView;->e:Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/VipFrag;

    .line 2
    .line 3
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegeRecyclerSupremePartnerView;->Z(Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/VipFrag;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegeRecyclerSupremePartnerView;->O(Ll/ub3;Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/VipFrag;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public q()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegeRecyclerSupremePartnerView;->j:Z

    .line 3
    .line 4
    return-void
.end method

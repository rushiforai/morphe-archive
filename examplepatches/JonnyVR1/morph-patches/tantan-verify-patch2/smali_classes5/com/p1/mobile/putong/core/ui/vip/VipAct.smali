.class public Lcom/p1/mobile/putong/core/ui/vip/VipAct;
.super Lcom/p1/mobile/putong/app/PutongAct;
.source "SourceFile"

# interfaces
.implements Ll/w1j0;


# instance fields
.field public c:Lcom/p1/mobile/putong/core/data/PurchaseType;

.field public d:I

.field public e:Z

.field public f:Ljava/lang/String;

.field public g:Ljava/lang/String;

.field public h:Ljava/lang/String;

.field public i:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/app/PutongAct;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Lrx/subjects/a;->b()Lrx/subjects/a;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/VipAct;->i:Lrx/subjects/a;

    .line 9
    .line 10
    return-void
.end method

.method public static synthetic X1(Lcom/p1/mobile/putong/core/ui/vip/VipAct;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/vip/VipAct;->lambda$initSubscription$0(Landroid/os/Bundle;)V

    return-void
.end method

.method public static synthetic Y1(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/location/Location;Lcom/p1/mobile/putong/core/data/RoamedLocationData;)Ll/bkj0;
    .locals 1

    .line 1
    new-instance v0, Ll/bkj0;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1, p2}, Ll/bkj0;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public static synthetic Z1(Lcom/p1/mobile/putong/core/ui/vip/VipAct;Lcom/p1/mobile/putong/data/DoublePair;Ljava/lang/String;Ljava/lang/String;Ll/bkj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/p1/mobile/putong/core/ui/vip/VipAct;->l2(Lcom/p1/mobile/putong/data/DoublePair;Ljava/lang/String;Ljava/lang/String;Ll/bkj0;)V

    return-void
.end method

.method public static synthetic a2(Lcom/p1/mobile/putong/data/DoublePair;Lcom/p1/mobile/putong/data/MessageLocation;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/data/MessageLocation;->coordinates:Lcom/p1/mobile/putong/data/DoublePair;

    .line 2
    .line 3
    invoke-static {p1, p0}, Ll/gsl0;->E0(Lcom/p1/mobile/putong/data/DoublePair;Lcom/p1/mobile/putong/data/DoublePair;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public static b2(Landroid/content/Context;)Landroid/content/Intent;
    .locals 1

    .line 1
    const-string v0, "vip"

    .line 2
    .line 3
    invoke-static {v0}, Ll/oql0;->a(Ljava/lang/String;)I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/core/ui/vip/VipAct;->c2(Landroid/content/Context;I)Landroid/content/Intent;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public static c2(Landroid/content/Context;I)Landroid/content/Intent;
    .locals 2

    .line 1
    new-instance v0, Landroid/content/Intent;

    .line 2
    .line 3
    const-class v1, Lcom/p1/mobile/putong/core/ui/vip/VipAct;

    .line 4
    .line 5
    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 6
    .line 7
    .line 8
    const-string p0, "vip_selected_page"

    .line 9
    .line 10
    invoke-virtual {v0, p0, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 11
    .line 12
    .line 13
    const/high16 p0, 0x4000000

    .line 14
    .line 15
    invoke-virtual {v0, p0}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 16
    .line 17
    .line 18
    return-object v0
.end method

.method public static d2(Landroid/content/Context;Lcom/p1/mobile/putong/core/data/PurchaseType;)Landroid/content/Intent;
    .locals 2

    .line 1
    new-instance v0, Landroid/content/Intent;

    .line 2
    .line 3
    const-class v1, Lcom/p1/mobile/putong/core/ui/vip/VipAct;

    .line 4
    .line 5
    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 6
    .line 7
    .line 8
    if-eqz p1, :cond_0

    .line 9
    .line 10
    const-string p0, "vip_selected_purchase_type"

    .line 11
    .line 12
    invoke-virtual {p1}, Ljava/lang/Enum;->name()Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    invoke-virtual {v0, p0, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 17
    .line 18
    .line 19
    :cond_0
    const/high16 p0, 0x4000000

    .line 20
    .line 21
    invoke-virtual {v0, p0}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 22
    .line 23
    .line 24
    return-object v0
.end method

.method public static e2(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;
    .locals 1

    .line 1
    invoke-static {p0}, Lcom/p1/mobile/putong/core/ui/vip/VipAct;->b2(Landroid/content/Context;)Landroid/content/Intent;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const-string v0, "vip_selected_from"

    .line 6
    .line 7
    invoke-virtual {p0, v0, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 8
    .line 9
    .line 10
    invoke-static {p1}, Ll/abb0;->a(Ljava/lang/String;)Z

    .line 11
    .line 12
    .line 13
    return-object p0
.end method

.method public static g2(Landroid/content/Context;Ljava/lang/String;I)Landroid/content/Intent;
    .locals 0

    .line 1
    invoke-static {p0, p2}, Lcom/p1/mobile/putong/core/ui/vip/VipAct;->c2(Landroid/content/Context;I)Landroid/content/Intent;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const-string p2, "vip_selected_from"

    .line 6
    .line 7
    invoke-virtual {p0, p2, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 8
    .line 9
    .line 10
    invoke-static {p1}, Ll/abb0;->a(Ljava/lang/String;)Z

    .line 11
    .line 12
    .line 13
    return-object p0
.end method

.method public static h2(Landroid/content/Context;Ljava/lang/String;ILjava/lang/String;)Landroid/content/Intent;
    .locals 2

    .line 1
    new-instance v0, Landroid/content/Intent;

    .line 2
    .line 3
    const-class v1, Lcom/p1/mobile/putong/core/ui/vip/VipAct;

    .line 4
    .line 5
    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 6
    .line 7
    .line 8
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    if-nez p0, :cond_0

    .line 13
    .line 14
    const-string p0, "vip_selected_from"

    .line 15
    .line 16
    invoke-virtual {v0, p0, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 17
    .line 18
    .line 19
    :cond_0
    const-string p0, "vip_selected_page"

    .line 20
    .line 21
    invoke-virtual {v0, p0, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 22
    .line 23
    .line 24
    const-string p0, "vip_selected_page_link_uri"

    .line 25
    .line 26
    invoke-virtual {v0, p0, p3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 27
    .line 28
    .line 29
    const/high16 p0, 0x4000000

    .line 30
    .line 31
    invoke-virtual {v0, p0}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 32
    .line 33
    .line 34
    invoke-static {p1}, Ll/abb0;->a(Ljava/lang/String;)Z

    .line 35
    .line 36
    .line 37
    return-object v0
.end method

.method public static i2(Landroid/content/Context;Ljava/lang/String;IZLjava/lang/String;)Landroid/content/Intent;
    .locals 2

    .line 1
    new-instance v0, Landroid/content/Intent;

    .line 2
    .line 3
    const-class v1, Lcom/p1/mobile/putong/core/ui/vip/VipAct;

    .line 4
    .line 5
    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 6
    .line 7
    .line 8
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    if-nez p0, :cond_0

    .line 13
    .line 14
    const-string p0, "vip_selected_from"

    .line 15
    .line 16
    invoke-virtual {v0, p0, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 17
    .line 18
    .line 19
    :cond_0
    const-string p0, "vip_selected_page"

    .line 20
    .line 21
    invoke-virtual {v0, p0, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 22
    .line 23
    .line 24
    const-string p0, "frag_args_section_select"

    .line 25
    .line 26
    invoke-virtual {v0, p0, p3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 27
    .line 28
    .line 29
    const-string p0, "frag_args_section_promotion"

    .line 30
    .line 31
    invoke-virtual {v0, p0, p4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 32
    .line 33
    .line 34
    const/high16 p0, 0x4000000

    .line 35
    .line 36
    invoke-virtual {v0, p0}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 37
    .line 38
    .line 39
    invoke-static {p1}, Ll/abb0;->a(Ljava/lang/String;)Z

    .line 40
    .line 41
    .line 42
    return-object v0
.end method

.method public static k2(Landroid/content/Context;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/PurchaseType;)Landroid/content/Intent;
    .locals 0

    .line 1
    invoke-static {p0, p2}, Lcom/p1/mobile/putong/core/ui/vip/VipAct;->d2(Landroid/content/Context;Lcom/p1/mobile/putong/core/data/PurchaseType;)Landroid/content/Intent;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const-string p2, "vip_selected_from"

    .line 6
    .line 7
    invoke-virtual {p0, p2, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 8
    .line 9
    .line 10
    invoke-static {p1}, Ll/abb0;->a(Ljava/lang/String;)Z

    .line 11
    .line 12
    .line 13
    return-object p0
.end method

.method private synthetic lambda$initSubscription$0(Landroid/os/Bundle;)V
    .locals 4

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->fragmentManager()Landroidx/fragment/app/FragmentManager;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget v1, Ll/adc0;->Nb:I

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Landroidx/fragment/app/FragmentManager;->h0(I)Landroidx/fragment/app/Fragment;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    if-nez v0, :cond_3

    .line 12
    .line 13
    invoke-static {}, Ll/d79;->L()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/vip/VipAct;->c:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 18
    .line 19
    if-eqz v0, :cond_1

    .line 20
    .line 21
    if-eqz v1, :cond_0

    .line 22
    .line 23
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->fragmentManager()Landroidx/fragment/app/FragmentManager;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    invoke-virtual {v0}, Landroidx/fragment/app/FragmentManager;->m()Landroidx/fragment/app/k;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    sget v1, Ll/adc0;->Nb:I

    .line 32
    .line 33
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/vip/VipAct;->c:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 34
    .line 35
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/vip/VipAct;->h:Ljava/lang/String;

    .line 36
    .line 37
    invoke-static {v2, v3}, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/IntlVipNewUiFrag;->P4(Lcom/p1/mobile/putong/core/data/PurchaseType;Ljava/lang/String;)Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/IntlVipNewUiFrag;

    .line 38
    .line 39
    .line 40
    move-result-object v2

    .line 41
    invoke-virtual {v0, v1, v2}, Landroidx/fragment/app/k;->s(ILandroidx/fragment/app/Fragment;)Landroidx/fragment/app/k;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    invoke-virtual {v0}, Landroidx/fragment/app/k;->i()I

    .line 46
    .line 47
    .line 48
    goto :goto_0

    .line 49
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->fragmentManager()Landroidx/fragment/app/FragmentManager;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    invoke-virtual {v0}, Landroidx/fragment/app/FragmentManager;->m()Landroidx/fragment/app/k;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    sget v1, Ll/adc0;->Nb:I

    .line 58
    .line 59
    iget v2, p0, Lcom/p1/mobile/putong/core/ui/vip/VipAct;->d:I

    .line 60
    .line 61
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/vip/VipAct;->h:Ljava/lang/String;

    .line 62
    .line 63
    invoke-static {v2, v3}, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/IntlVipNewUiFrag;->O4(ILjava/lang/String;)Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/IntlVipNewUiFrag;

    .line 64
    .line 65
    .line 66
    move-result-object v2

    .line 67
    invoke-virtual {v0, v1, v2}, Landroidx/fragment/app/k;->s(ILandroidx/fragment/app/Fragment;)Landroidx/fragment/app/k;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    invoke-virtual {v0}, Landroidx/fragment/app/k;->i()I

    .line 72
    .line 73
    .line 74
    goto :goto_0

    .line 75
    :cond_1
    if-eqz v1, :cond_2

    .line 76
    .line 77
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->fragmentManager()Landroidx/fragment/app/FragmentManager;

    .line 78
    .line 79
    .line 80
    move-result-object v0

    .line 81
    invoke-virtual {v0}, Landroidx/fragment/app/FragmentManager;->m()Landroidx/fragment/app/k;

    .line 82
    .line 83
    .line 84
    move-result-object v0

    .line 85
    sget v1, Ll/adc0;->Nb:I

    .line 86
    .line 87
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/vip/VipAct;->c:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 88
    .line 89
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/vip/VipAct;->h:Ljava/lang/String;

    .line 90
    .line 91
    invoke-static {v2, v3}, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/VipNewUiFrag;->P4(Lcom/p1/mobile/putong/core/data/PurchaseType;Ljava/lang/String;)Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/VipNewUiFrag;

    .line 92
    .line 93
    .line 94
    move-result-object v2

    .line 95
    invoke-virtual {v0, v1, v2}, Landroidx/fragment/app/k;->s(ILandroidx/fragment/app/Fragment;)Landroidx/fragment/app/k;

    .line 96
    .line 97
    .line 98
    move-result-object v0

    .line 99
    invoke-virtual {v0}, Landroidx/fragment/app/k;->i()I

    .line 100
    .line 101
    .line 102
    goto :goto_0

    .line 103
    :cond_2
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->fragmentManager()Landroidx/fragment/app/FragmentManager;

    .line 104
    .line 105
    .line 106
    move-result-object v0

    .line 107
    invoke-virtual {v0}, Landroidx/fragment/app/FragmentManager;->m()Landroidx/fragment/app/k;

    .line 108
    .line 109
    .line 110
    move-result-object v0

    .line 111
    sget v1, Ll/adc0;->Nb:I

    .line 112
    .line 113
    iget v2, p0, Lcom/p1/mobile/putong/core/ui/vip/VipAct;->d:I

    .line 114
    .line 115
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/vip/VipAct;->h:Ljava/lang/String;

    .line 116
    .line 117
    invoke-static {v2, v3}, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/VipNewUiFrag;->O4(ILjava/lang/String;)Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/VipNewUiFrag;

    .line 118
    .line 119
    .line 120
    move-result-object v2

    .line 121
    invoke-virtual {v0, v1, v2}, Landroidx/fragment/app/k;->s(ILandroidx/fragment/app/Fragment;)Landroidx/fragment/app/k;

    .line 122
    .line 123
    .line 124
    move-result-object v0

    .line 125
    invoke-virtual {v0}, Landroidx/fragment/app/k;->i()I

    .line 126
    .line 127
    .line 128
    :goto_0
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->fragmentManager()Landroidx/fragment/app/FragmentManager;

    .line 129
    .line 130
    .line 131
    move-result-object v0

    .line 132
    invoke-virtual {v0}, Landroidx/fragment/app/FragmentManager;->e0()Z

    .line 133
    .line 134
    .line 135
    if-nez p1, :cond_3

    .line 136
    .line 137
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/VipAct;->g:Ljava/lang/String;

    .line 138
    .line 139
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 140
    .line 141
    .line 142
    move-result p1

    .line 143
    if-nez p1, :cond_3

    .line 144
    .line 145
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/VipAct;->i:Lrx/subjects/a;

    .line 146
    .line 147
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/VipAct;->g:Ljava/lang/String;

    .line 148
    .line 149
    invoke-virtual {p1, p0}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 150
    .line 151
    .line 152
    :cond_3
    return-void
.end method


# virtual methods
.method public G()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    return p0
.end method

.method public debugItems()Ljava/util/ArrayList;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Ll/pf60<",
            "Ljava/lang/String;",
            "Ll/x20;",
            ">;>;"
        }
    .end annotation

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongAct;->debugItems()Ljava/util/ArrayList;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public disableAutoPV()Z
    .locals 0

    const/4 p0, 0x1

    return p0
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    sget p0, Ll/kec0;->te:I

    .line 2
    .line 3
    const/4 p2, 0x0

    .line 4
    invoke-virtual {p1, p0, p2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    return-object p0
.end method

.method public initSubscription()V
    .locals 1

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongAct;->initSubscription()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/ynl0;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Ll/ynl0;-><init>(Lcom/p1/mobile/putong/core/ui/vip/VipAct;)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Act;->creates(Ll/y20;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final synthetic l2(Lcom/p1/mobile/putong/data/DoublePair;Ljava/lang/String;Ljava/lang/String;Ll/bkj0;)V
    .locals 4

    .line 1
    iget-object v0, p4, Ll/bkj0;->a:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Lcom/p1/mobile/putong/data/User;

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->getLatitudeAndLongitude()Lcom/p1/mobile/putong/data/DoublePair;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    new-instance v1, Lcom/p1/mobile/putong/data/DoublePair;

    .line 10
    .line 11
    invoke-direct {v1}, Lcom/p1/mobile/putong/data/DoublePair;-><init>()V

    .line 12
    .line 13
    .line 14
    iget-object v2, p4, Ll/bkj0;->b:Ljava/lang/Object;

    .line 15
    .line 16
    check-cast v2, Lcom/p1/mobile/putong/location/Location;

    .line 17
    .line 18
    invoke-virtual {v2}, Lcom/p1/mobile/putong/location/Location;->u()D

    .line 19
    .line 20
    .line 21
    move-result-wide v2

    .line 22
    iput-wide v2, v1, Lcom/p1/mobile/putong/data/DoublePair;->first:D

    .line 23
    .line 24
    iget-object v2, p4, Ll/bkj0;->b:Ljava/lang/Object;

    .line 25
    .line 26
    check-cast v2, Lcom/p1/mobile/putong/location/Location;

    .line 27
    .line 28
    invoke-virtual {v2}, Lcom/p1/mobile/putong/location/Location;->x()D

    .line 29
    .line 30
    .line 31
    move-result-wide v2

    .line 32
    iput-wide v2, v1, Lcom/p1/mobile/putong/data/DoublePair;->second:D

    .line 33
    .line 34
    iget-object p4, p4, Ll/bkj0;->c:Ljava/lang/Object;

    .line 35
    .line 36
    check-cast p4, Lcom/p1/mobile/putong/core/data/RoamedLocationData;

    .line 37
    .line 38
    invoke-static {p1, v1}, Ll/gsl0;->E0(Lcom/p1/mobile/putong/data/DoublePair;Lcom/p1/mobile/putong/data/DoublePair;)Z

    .line 39
    .line 40
    .line 41
    move-result v1

    .line 42
    iget-object v2, p4, Lcom/p1/mobile/putong/core/data/RoamedLocationData;->data:Ljava/util/List;

    .line 43
    .line 44
    new-instance v3, Ll/bol0;

    .line 45
    .line 46
    invoke-direct {v3, p1}, Ll/bol0;-><init>(Lcom/p1/mobile/putong/data/DoublePair;)V

    .line 47
    .line 48
    .line 49
    invoke-static {v2, v3}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 50
    .line 51
    .line 52
    move-result-object v2

    .line 53
    check-cast v2, Lcom/p1/mobile/putong/data/MessageLocation;

    .line 54
    .line 55
    if-eqz v1, :cond_1

    .line 56
    .line 57
    sget p1, Lcom/p1/mobile/putong/core/R$string;->Ps:I

    .line 58
    .line 59
    invoke-static {p1}, Ll/o1j0;->w(I)V

    .line 60
    .line 61
    .line 62
    invoke-static {}, Lcom/p1/mobile/putong/data/DoublePair;->new_()Lcom/p1/mobile/putong/data/DoublePair;

    .line 63
    .line 64
    .line 65
    move-result-object p1

    .line 66
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/data/DoublePair;->equals(Ljava/lang/Object;)Z

    .line 67
    .line 68
    .line 69
    move-result p1

    .line 70
    if-nez p1, :cond_0

    .line 71
    .line 72
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->act()Lcom/p1/mobile/android/app/Act;

    .line 73
    .line 74
    .line 75
    move-result-object p0

    .line 76
    invoke-static {p0}, Ll/gsl0;->D0(Lcom/p1/mobile/android/app/Act;)V

    .line 77
    .line 78
    .line 79
    :cond_0
    return-void

    .line 80
    :cond_1
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 81
    .line 82
    .line 83
    move-result v0

    .line 84
    const/4 v1, 0x0

    .line 85
    if-eqz v0, :cond_2

    .line 86
    .line 87
    sget p1, Lcom/p1/mobile/putong/core/R$string;->Os:I

    .line 88
    .line 89
    invoke-static {p1}, Ll/o1j0;->w(I)V

    .line 90
    .line 91
    .line 92
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->act()Lcom/p1/mobile/android/app/Act;

    .line 93
    .line 94
    .line 95
    move-result-object p0

    .line 96
    invoke-static {p0, v2, v1}, Ll/gsl0;->C0(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/MessageLocation;Ll/x20;)V

    .line 97
    .line 98
    .line 99
    return-void

    .line 100
    :cond_2
    sget v0, Lcom/p1/mobile/putong/core/R$string;->Os:I

    .line 101
    .line 102
    invoke-static {v0}, Ll/o1j0;->w(I)V

    .line 103
    .line 104
    .line 105
    new-instance v0, Lcom/p1/mobile/putong/data/MessageLocation;

    .line 106
    .line 107
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/MessageLocation;-><init>()V

    .line 108
    .line 109
    .line 110
    iput-object p1, v0, Lcom/p1/mobile/putong/data/MessageLocation;->coordinates:Lcom/p1/mobile/putong/data/DoublePair;

    .line 111
    .line 112
    iput-object p2, v0, Lcom/p1/mobile/putong/data/MessageLocation;->name:Ljava/lang/String;

    .line 113
    .line 114
    iput-object p3, v0, Lcom/p1/mobile/putong/data/MessageLocation;->address:Ljava/lang/String;

    .line 115
    .line 116
    iget-object p1, p4, Lcom/p1/mobile/putong/core/data/RoamedLocationData;->data:Ljava/util/List;

    .line 117
    .line 118
    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 119
    .line 120
    .line 121
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 122
    .line 123
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->k0:Lcom/p1/mobile/putong/core/api/q;

    .line 124
    .line 125
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/q;->R:Lcom/p1/mobile/putong/core/api/q$b;

    .line 126
    .line 127
    invoke-virtual {p1, p4}, Ll/mof0;->A(Ljava/lang/Object;)V

    .line 128
    .line 129
    .line 130
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->act()Lcom/p1/mobile/android/app/Act;

    .line 131
    .line 132
    .line 133
    move-result-object p0

    .line 134
    invoke-static {p0, v0, v1}, Ll/gsl0;->C0(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/MessageLocation;Ll/x20;)V

    .line 135
    .line 136
    .line 137
    return-void
.end method

.method public needBindBillingService()Z
    .locals 0

    const/4 p0, 0x1

    return p0
.end method

.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 9

    .line 1
    const/4 v0, -0x1

    .line 2
    if-ne p2, v0, :cond_6

    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    if-eq p1, v0, :cond_2

    .line 6
    .line 7
    const/4 v1, 0x2

    .line 8
    if-ne p1, v1, :cond_0

    .line 9
    .line 10
    goto :goto_0

    .line 11
    :cond_0
    const/4 v0, 0x3

    .line 12
    if-ne p1, v0, :cond_6

    .line 13
    .line 14
    const-string v0, "locationChanged"

    .line 15
    .line 16
    const/4 v1, 0x0

    .line 17
    invoke-virtual {p3, v0, v1}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-eqz v0, :cond_1

    .line 22
    .line 23
    sget v0, Lcom/p1/mobile/putong/core/R$string;->Ps:I

    .line 24
    .line 25
    invoke-static {v0}, Ll/o1j0;->w(I)V

    .line 26
    .line 27
    .line 28
    goto/16 :goto_1

    .line 29
    .line 30
    :cond_1
    sget v0, Lcom/p1/mobile/putong/core/R$string;->Os:I

    .line 31
    .line 32
    invoke-static {v0}, Ll/o1j0;->w(I)V

    .line 33
    .line 34
    .line 35
    goto/16 :goto_1

    .line 36
    .line 37
    :cond_2
    :goto_0
    const-string v1, "map_location"

    .line 38
    .line 39
    invoke-virtual {p3, v1}, Landroid/content/Intent;->getSerializableExtra(Ljava/lang/String;)Ljava/io/Serializable;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    check-cast v1, Lcom/p1/mobile/putong/data/DoublePair;

    .line 44
    .line 45
    iget-wide v2, v1, Lcom/p1/mobile/putong/data/DoublePair;->first:D

    .line 46
    .line 47
    const-wide/16 v4, 0x0

    .line 48
    .line 49
    cmpl-double v2, v2, v4

    .line 50
    .line 51
    if-nez v2, :cond_3

    .line 52
    .line 53
    iget-wide v2, v1, Lcom/p1/mobile/putong/data/DoublePair;->second:D

    .line 54
    .line 55
    cmpl-double v2, v2, v4

    .line 56
    .line 57
    if-nez v2, :cond_3

    .line 58
    .line 59
    const-wide v2, 0x3d719799812dea11L    # 1.0E-12

    .line 60
    .line 61
    .line 62
    .line 63
    .line 64
    iput-wide v2, v1, Lcom/p1/mobile/putong/data/DoublePair;->first:D

    .line 65
    .line 66
    :cond_3
    const-string v2, "map_address"

    .line 67
    .line 68
    invoke-virtual {p3, v2}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    move-result-object v2

    .line 72
    const-string v3, "map_city"

    .line 73
    .line 74
    invoke-virtual {p3, v3}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 75
    .line 76
    .line 77
    move-result-object v3

    .line 78
    const-string v4, "map_name"

    .line 79
    .line 80
    invoke-virtual {p3, v4}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 81
    .line 82
    .line 83
    move-result-object v4

    .line 84
    invoke-static {}, Ll/xxv;->f()Z

    .line 85
    .line 86
    .line 87
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 88
    .line 89
    .line 90
    move-result v5

    .line 91
    if-eqz v5, :cond_4

    .line 92
    .line 93
    move-object v3, v4

    .line 94
    :cond_4
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 95
    .line 96
    .line 97
    move-result v5

    .line 98
    if-eqz v5, :cond_5

    .line 99
    .line 100
    move-object v2, v4

    .line 101
    :cond_5
    iget-object v4, p0, Lcom/p1/mobile/android/app/Act;->act:Lcom/p1/mobile/android/app/Act;

    .line 102
    .line 103
    sget-object v5, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 104
    .line 105
    iget-object v5, v5, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 106
    .line 107
    invoke-virtual {v5}, Ll/dkb;->o9()Lrx/c;

    .line 108
    .line 109
    .line 110
    move-result-object v5

    .line 111
    sget-object v6, Ll/uqb0;->E:Lcom/p1/mobile/putong/location/a;

    .line 112
    .line 113
    invoke-virtual {v6}, Lcom/p1/mobile/putong/location/a;->p()Lrx/c;

    .line 114
    .line 115
    .line 116
    move-result-object v6

    .line 117
    sget-object v7, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 118
    .line 119
    iget-object v7, v7, Lcom/p1/mobile/putong/core/api/c;->k0:Lcom/p1/mobile/putong/core/api/q;

    .line 120
    .line 121
    iget-object v7, v7, Lcom/p1/mobile/putong/core/api/q;->R:Lcom/p1/mobile/putong/core/api/q$b;

    .line 122
    .line 123
    invoke-virtual {v7}, Ll/mof0;->k()Lrx/c;

    .line 124
    .line 125
    .line 126
    move-result-object v7

    .line 127
    new-instance v8, Ll/znl0;

    .line 128
    .line 129
    invoke-direct {v8}, Ll/znl0;-><init>()V

    .line 130
    .line 131
    .line 132
    invoke-static {v5, v6, v7, v8}, Ll/psd0;->s(Lrx/c;Lrx/c;Lrx/c;Ll/scj;)Lrx/c;

    .line 133
    .line 134
    .line 135
    move-result-object v5

    .line 136
    invoke-virtual {v4, v5}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 137
    .line 138
    .line 139
    move-result-object v4

    .line 140
    invoke-virtual {v4, v0}, Lrx/c;->take(I)Lrx/c;

    .line 141
    .line 142
    .line 143
    move-result-object v0

    .line 144
    new-instance v4, Ll/aol0;

    .line 145
    .line 146
    invoke-direct {v4, p0, v1, v3, v2}, Ll/aol0;-><init>(Lcom/p1/mobile/putong/core/ui/vip/VipAct;Lcom/p1/mobile/putong/data/DoublePair;Ljava/lang/String;Ljava/lang/String;)V

    .line 147
    .line 148
    .line 149
    invoke-static {v4}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 150
    .line 151
    .line 152
    move-result-object v1

    .line 153
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 154
    .line 155
    .line 156
    :cond_6
    :goto_1
    invoke-super {p0, p1, p2, p3}, Lcom/p1/mobile/putong/app/PutongAct;->onActivityResult(IILandroid/content/Intent;)V

    .line 157
    .line 158
    .line 159
    return-void
.end method

.method public onBackPressed()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->fragmentManager()Landroidx/fragment/app/FragmentManager;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Landroidx/fragment/app/FragmentManager;->t0()Ljava/util/List;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->fragmentManager()Landroidx/fragment/app/FragmentManager;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-virtual {v0}, Landroidx/fragment/app/FragmentManager;->t0()Ljava/util/List;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    const/4 v1, 0x0

    .line 24
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    instance-of v0, v0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/VipNewUiFrag;

    .line 29
    .line 30
    if-eqz v0, :cond_0

    .line 31
    .line 32
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->fragmentManager()Landroidx/fragment/app/FragmentManager;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    invoke-virtual {v0}, Landroidx/fragment/app/FragmentManager;->t0()Ljava/util/List;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    check-cast v0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/VipNewUiFrag;

    .line 45
    .line 46
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/VipNewUiFrag;->o()Z

    .line 47
    .line 48
    .line 49
    move-result v0

    .line 50
    if-eqz v0, :cond_0

    .line 51
    .line 52
    return-void

    .line 53
    :cond_0
    invoke-super {p0}, Landroidx/activity/ComponentActivity;->onBackPressed()V

    .line 54
    .line 55
    .line 56
    return-void
.end method

.method public pageId()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "p_privileges_view"

    .line 2
    .line 3
    return-object p0
.end method

.method public preCreateView(Landroid/os/Bundle;)V
    .locals 4

    .line 1
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    const-string v0, "vip_selected_purchase_type"

    .line 6
    .line 7
    invoke-virtual {p1, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    if-nez v1, :cond_0

    .line 16
    .line 17
    :try_start_0
    invoke-static {v0}, Lcom/p1/mobile/putong/core/data/PurchaseType;->valueOf(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/VipAct;->c:Lcom/p1/mobile/putong/core/data/PurchaseType;
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :catch_0
    const/4 v0, 0x0

    .line 25
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/VipAct;->c:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 26
    .line 27
    :cond_0
    :goto_0
    const-string v0, "vip_selected_page"

    .line 28
    .line 29
    const/4 v1, -0x1

    .line 30
    invoke-virtual {p1, v0, v1}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/vip/VipAct;->d:I

    .line 35
    .line 36
    const-string v0, "vip_selected_page_link_uri"

    .line 37
    .line 38
    invoke-virtual {p1, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/VipAct;->g:Ljava/lang/String;

    .line 43
    .line 44
    const-string v0, "vip_selected_from"

    .line 45
    .line 46
    invoke-virtual {p1, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/VipAct;->h:Ljava/lang/String;

    .line 51
    .line 52
    const-string v0, "frag_args_section_select"

    .line 53
    .line 54
    const/4 v1, 0x0

    .line 55
    invoke-virtual {p1, v0, v1}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    .line 56
    .line 57
    .line 58
    move-result v0

    .line 59
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/vip/VipAct;->e:Z

    .line 60
    .line 61
    const-string v0, "frag_args_section_promotion"

    .line 62
    .line 63
    invoke-virtual {p1, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 64
    .line 65
    .line 66
    move-result-object p1

    .line 67
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/VipAct;->f:Ljava/lang/String;

    .line 68
    .line 69
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/VipAct;->h:Ljava/lang/String;

    .line 70
    .line 71
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 72
    .line 73
    .line 74
    move-result p1

    .line 75
    if-eqz p1, :cond_1

    .line 76
    .line 77
    iget-object p1, p0, Lcom/p1/mobile/putong/app/PutongAct;->pageHelper:Ll/l4g0;

    .line 78
    .line 79
    const-string v0, "showfrom"

    .line 80
    .line 81
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/vip/VipAct;->h:Ljava/lang/String;

    .line 82
    .line 83
    invoke-static {v0, v2}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 84
    .line 85
    .line 86
    move-result-object v0

    .line 87
    const-string v2, "privilege_showfrom"

    .line 88
    .line 89
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/vip/VipAct;->h:Ljava/lang/String;

    .line 90
    .line 91
    invoke-static {v2, v3}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 92
    .line 93
    .line 94
    move-result-object v2

    .line 95
    filled-new-array {v0, v2}, [Ll/pf60;

    .line 96
    .line 97
    .line 98
    move-result-object v0

    .line 99
    invoke-virtual {p1, v0}, Ll/l4g0;->p([Ll/pf60;)V

    .line 100
    .line 101
    .line 102
    :cond_1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/app/PutongAct;->checkGradientColors()V

    .line 103
    .line 104
    .line 105
    invoke-virtual {p0, v1}, Lcom/p1/mobile/android/app/Act;->setSwipeBackEnable(Z)V

    .line 106
    .line 107
    .line 108
    return-void
.end method

.method public shouldSwitchToTransparentStatus()Z
    .locals 0

    const/4 p0, 0x1

    return p0
.end method

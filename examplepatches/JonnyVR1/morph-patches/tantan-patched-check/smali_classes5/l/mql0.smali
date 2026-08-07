.class public Ll/mql0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/eql0;",
        ">;"
    }
.end annotation


# instance fields
.field public A:Lcom/p1/mobile/putong/core/data/PurchaseType;

.field public B:Z

.field public C:Ll/fql0;

.field public D:Ll/vc0;

.field public E:Ll/lib0;

.field public F:Ll/pf60;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/pf60<",
            "Ljava/lang/String;",
            "Lcom/p1/mobile/putong/core/data/ProductCategory;",
            ">;"
        }
    .end annotation
.end field

.field public a:Landroid/widget/FrameLayout;

.field public b:Landroid/widget/FrameLayout;

.field public c:Landroid/widget/FrameLayout;

.field public d:Lv/VDraweeView;

.field public e:Lv/navigationbar/VNavigationBar;

.field public f:Landroidx/coordinatorlayout/widget/CoordinatorLayout;

.field public g:Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/view/TopCardLayout;

.field public h:Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/view/bottom/AlphaTransformerViewPager;

.field public i:Lv/VSegmentBar;

.field public j:Landroid/widget/FrameLayout;

.field public k:Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegePaymentView;

.field public l:Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegePaymentView;

.field public m:Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegePaymentView;

.field public n:Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegePaymentView;

.field public o:Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegePaymentView;

.field public p:Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegePaymentView;

.field public q:Landroid/widget/FrameLayout;

.field public r:Lv/VText;

.field public s:Landroid/view/View;

.field public t:Lv/VIcon;

.field public u:Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/VipFrag;

.field public v:Ll/eql0;

.field public w:Ll/ub3;

.field public x:Ljava/util/LinkedHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedHashMap<",
            "Lcom/p1/mobile/putong/core/data/PurchaseType;",
            "Landroid/view/ViewGroup;",
            ">;"
        }
    .end annotation
.end field

.field public y:Z

.field public z:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/VipFrag;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/LinkedHashMap;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/mql0;->x:Ljava/util/LinkedHashMap;

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    iput-boolean v0, p0, Ll/mql0;->y:Z

    .line 13
    .line 14
    const/4 v1, 0x0

    .line 15
    iput-object v1, p0, Ll/mql0;->z:Ljava/lang/String;

    .line 16
    .line 17
    iput-object v1, p0, Ll/mql0;->A:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 18
    .line 19
    iput-boolean v0, p0, Ll/mql0;->B:Z

    .line 20
    .line 21
    new-instance v0, Ll/vc0;

    .line 22
    .line 23
    invoke-direct {v0}, Ll/vc0;-><init>()V

    .line 24
    .line 25
    .line 26
    iput-object v0, p0, Ll/mql0;->D:Ll/vc0;

    .line 27
    .line 28
    iput-object v1, p0, Ll/mql0;->F:Ll/pf60;

    .line 29
    .line 30
    iput-object p1, p0, Ll/mql0;->u:Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/VipFrag;

    .line 31
    .line 32
    return-void
.end method

.method private I()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/mql0;->t:Lv/VIcon;

    .line 2
    .line 3
    const/4 v1, 0x4

    .line 4
    invoke-virtual {v0, v1}, Lv/VIcon;->setIconStyle(I)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Ll/mql0;->t:Lv/VIcon;

    .line 8
    .line 9
    sget v1, Ll/dbc0;->Kl:I

    .line 10
    .line 11
    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Ll/mql0;->e:Lv/navigationbar/VNavigationBar;

    .line 15
    .line 16
    iget-object v1, p0, Ll/mql0;->t:Lv/VIcon;

    .line 17
    .line 18
    const/4 v2, 0x1

    .line 19
    new-array v2, v2, [Landroid/view/View;

    .line 20
    .line 21
    const/4 v3, 0x0

    .line 22
    aput-object v1, v2, v3

    .line 23
    .line 24
    invoke-virtual {v0, v2}, Lv/navigationbar/VNavigationBar;->setRightIconViews([Landroid/view/View;)V

    .line 25
    .line 26
    .line 27
    iget-object v0, p0, Ll/mql0;->t:Lv/VIcon;

    .line 28
    .line 29
    new-instance v1, Ll/kql0;

    .line 30
    .line 31
    invoke-direct {v1, p0}, Ll/kql0;-><init>(Ll/mql0;)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 35
    .line 36
    .line 37
    iget-object v0, p0, Ll/mql0;->e:Lv/navigationbar/VNavigationBar;

    .line 38
    .line 39
    new-instance v1, Ll/lql0;

    .line 40
    .line 41
    invoke-direct {v1, p0}, Ll/lql0;-><init>(Ll/mql0;)V

    .line 42
    .line 43
    .line 44
    invoke-virtual {v0, v1}, Lv/navigationbar/VNavigationBar;->setLeftIconOnClick(Landroid/view/View$OnClickListener;)V

    .line 45
    .line 46
    .line 47
    return-void
.end method

.method public static synthetic a(Landroid/view/View;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic b(Ll/mql0;I)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/mql0;->A(I)V

    return-void
.end method

.method public static synthetic c(Ll/mql0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/mql0;->B()V

    return-void
.end method

.method public static synthetic d(Ll/mql0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/mql0;->E(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic e(Ll/mql0;I)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/mql0;->z(I)V

    return-void
.end method

.method public static synthetic f(Ll/mql0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/mql0;->C(Landroid/view/View;)V

    return-void
.end method

.method public static bridge synthetic i(Ll/mql0;)Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/VipFrag;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/mql0;->u:Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/VipFrag;

    return-object p0
.end method

.method public static bridge synthetic j(Ll/mql0;)Ll/fql0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/mql0;->C:Ll/fql0;

    return-object p0
.end method

.method public static bridge synthetic k(Ll/mql0;)Ll/lib0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/mql0;->E:Ll/lib0;

    return-object p0
.end method

.method public static bridge synthetic l(Ll/mql0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/mql0;->s()V

    return-void
.end method

.method public static bridge synthetic m(Ll/mql0;Lcom/p1/mobile/putong/core/data/PurchaseType;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/mql0;->M(Lcom/p1/mobile/putong/core/data/PurchaseType;)V

    return-void
.end method


# virtual methods
.method public final synthetic A(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/mql0;->i:Lv/VSegmentBar;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/google/android/material/tabs/TabLayout;->getTabAt(I)Lcom/google/android/material/tabs/TabLayout$Tab;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-virtual {p0, p1}, Lcom/google/android/material/tabs/TabLayout;->selectTab(Lcom/google/android/material/tabs/TabLayout$Tab;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final synthetic B()V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_YOUTH_VIP:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 2
    .line 3
    iget-object v1, p0, Ll/mql0;->h:Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/view/bottom/AlphaTransformerViewPager;

    .line 4
    .line 5
    invoke-virtual {v1}, Landroidx/viewpager/widget/ViewPager;->getCurrentItem()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    invoke-static {v0, v1}, Ll/eql0;->t0(Lcom/p1/mobile/putong/core/data/PurchaseType;I)Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    if-eqz v1, :cond_0

    .line 14
    .line 15
    iget-object v1, p0, Ll/mql0;->u:Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/VipFrag;

    .line 16
    .line 17
    iget-object v1, v1, Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/VipFrag;->C:Lrx/subjects/a;

    .line 18
    .line 19
    invoke-virtual {v1, v0}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0, v0}, Ll/mql0;->M(Lcom/p1/mobile/putong/core/data/PurchaseType;)V

    .line 23
    .line 24
    .line 25
    goto/16 :goto_0

    .line 26
    .line 27
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_FEMALE_VIP:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 28
    .line 29
    iget-object v1, p0, Ll/mql0;->h:Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/view/bottom/AlphaTransformerViewPager;

    .line 30
    .line 31
    invoke-virtual {v1}, Landroidx/viewpager/widget/ViewPager;->getCurrentItem()I

    .line 32
    .line 33
    .line 34
    move-result v1

    .line 35
    invoke-static {v0, v1}, Ll/eql0;->t0(Lcom/p1/mobile/putong/core/data/PurchaseType;I)Z

    .line 36
    .line 37
    .line 38
    move-result v1

    .line 39
    if-eqz v1, :cond_1

    .line 40
    .line 41
    iget-object v1, p0, Ll/mql0;->u:Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/VipFrag;

    .line 42
    .line 43
    iget-object v1, v1, Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/VipFrag;->C:Lrx/subjects/a;

    .line 44
    .line 45
    invoke-virtual {v1, v0}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 46
    .line 47
    .line 48
    invoke-virtual {p0, v0}, Ll/mql0;->M(Lcom/p1/mobile/putong/core/data/PurchaseType;)V

    .line 49
    .line 50
    .line 51
    goto/16 :goto_0

    .line 52
    .line 53
    :cond_1
    sget-object v0, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_GET_VIP:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 54
    .line 55
    iget-object v1, p0, Ll/mql0;->h:Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/view/bottom/AlphaTransformerViewPager;

    .line 56
    .line 57
    invoke-virtual {v1}, Landroidx/viewpager/widget/ViewPager;->getCurrentItem()I

    .line 58
    .line 59
    .line 60
    move-result v1

    .line 61
    invoke-static {v0, v1}, Ll/eql0;->t0(Lcom/p1/mobile/putong/core/data/PurchaseType;I)Z

    .line 62
    .line 63
    .line 64
    move-result v1

    .line 65
    if-eqz v1, :cond_2

    .line 66
    .line 67
    iget-object v1, p0, Ll/mql0;->u:Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/VipFrag;

    .line 68
    .line 69
    iget-object v1, v1, Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/VipFrag;->C:Lrx/subjects/a;

    .line 70
    .line 71
    invoke-virtual {v1, v0}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 72
    .line 73
    .line 74
    invoke-virtual {p0, v0}, Ll/mql0;->M(Lcom/p1/mobile/putong/core/data/PurchaseType;)V

    .line 75
    .line 76
    .line 77
    goto :goto_0

    .line 78
    :cond_2
    sget-object v0, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_O_PLATINUM:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 79
    .line 80
    iget-object v1, p0, Ll/mql0;->h:Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/view/bottom/AlphaTransformerViewPager;

    .line 81
    .line 82
    invoke-virtual {v1}, Landroidx/viewpager/widget/ViewPager;->getCurrentItem()I

    .line 83
    .line 84
    .line 85
    move-result v1

    .line 86
    invoke-static {v0, v1}, Ll/eql0;->t0(Lcom/p1/mobile/putong/core/data/PurchaseType;I)Z

    .line 87
    .line 88
    .line 89
    move-result v1

    .line 90
    if-eqz v1, :cond_3

    .line 91
    .line 92
    iget-object v1, p0, Ll/mql0;->u:Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/VipFrag;

    .line 93
    .line 94
    iget-object v1, v1, Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/VipFrag;->C:Lrx/subjects/a;

    .line 95
    .line 96
    invoke-virtual {v1, v0}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 97
    .line 98
    .line 99
    invoke-virtual {p0, v0}, Ll/mql0;->M(Lcom/p1/mobile/putong/core/data/PurchaseType;)V

    .line 100
    .line 101
    .line 102
    goto :goto_0

    .line 103
    :cond_3
    sget-object v0, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_GET_PRIVILEGE_PACKAGE:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 104
    .line 105
    iget-object v1, p0, Ll/mql0;->h:Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/view/bottom/AlphaTransformerViewPager;

    .line 106
    .line 107
    invoke-virtual {v1}, Landroidx/viewpager/widget/ViewPager;->getCurrentItem()I

    .line 108
    .line 109
    .line 110
    move-result v1

    .line 111
    invoke-static {v0, v1}, Ll/eql0;->t0(Lcom/p1/mobile/putong/core/data/PurchaseType;I)Z

    .line 112
    .line 113
    .line 114
    move-result v1

    .line 115
    if-eqz v1, :cond_4

    .line 116
    .line 117
    iget-object v1, p0, Ll/mql0;->u:Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/VipFrag;

    .line 118
    .line 119
    iget-object v1, v1, Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/VipFrag;->C:Lrx/subjects/a;

    .line 120
    .line 121
    invoke-virtual {v1, v0}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 122
    .line 123
    .line 124
    invoke-virtual {p0, v0}, Ll/mql0;->M(Lcom/p1/mobile/putong/core/data/PurchaseType;)V

    .line 125
    .line 126
    .line 127
    goto :goto_0

    .line 128
    :cond_4
    sget-object v0, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_O_DIAMOND:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 129
    .line 130
    iget-object v1, p0, Ll/mql0;->h:Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/view/bottom/AlphaTransformerViewPager;

    .line 131
    .line 132
    invoke-virtual {v1}, Landroidx/viewpager/widget/ViewPager;->getCurrentItem()I

    .line 133
    .line 134
    .line 135
    move-result v1

    .line 136
    invoke-static {v0, v1}, Ll/eql0;->t0(Lcom/p1/mobile/putong/core/data/PurchaseType;I)Z

    .line 137
    .line 138
    .line 139
    move-result v1

    .line 140
    if-eqz v1, :cond_5

    .line 141
    .line 142
    iget-object v1, p0, Ll/mql0;->u:Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/VipFrag;

    .line 143
    .line 144
    iget-object v1, v1, Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/VipFrag;->C:Lrx/subjects/a;

    .line 145
    .line 146
    invoke-virtual {v1, v0}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 147
    .line 148
    .line 149
    invoke-virtual {p0, v0}, Ll/mql0;->M(Lcom/p1/mobile/putong/core/data/PurchaseType;)V

    .line 150
    .line 151
    .line 152
    goto :goto_0

    .line 153
    :cond_5
    sget-object v0, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_SUPREME_PARTNER:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 154
    .line 155
    iget-object v1, p0, Ll/mql0;->h:Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/view/bottom/AlphaTransformerViewPager;

    .line 156
    .line 157
    invoke-virtual {v1}, Landroidx/viewpager/widget/ViewPager;->getCurrentItem()I

    .line 158
    .line 159
    .line 160
    move-result v1

    .line 161
    invoke-static {v0, v1}, Ll/eql0;->t0(Lcom/p1/mobile/putong/core/data/PurchaseType;I)Z

    .line 162
    .line 163
    .line 164
    move-result v1

    .line 165
    if-eqz v1, :cond_6

    .line 166
    .line 167
    iget-object v1, p0, Ll/mql0;->u:Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/VipFrag;

    .line 168
    .line 169
    iget-object v1, v1, Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/VipFrag;->C:Lrx/subjects/a;

    .line 170
    .line 171
    invoke-virtual {v1, v0}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 172
    .line 173
    .line 174
    invoke-virtual {p0, v0}, Ll/mql0;->M(Lcom/p1/mobile/putong/core/data/PurchaseType;)V

    .line 175
    .line 176
    .line 177
    :cond_6
    :goto_0
    iget-object v0, p0, Ll/mql0;->C:Ll/fql0;

    .line 178
    .line 179
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 180
    .line 181
    .line 182
    move-result v0

    .line 183
    if-eqz v0, :cond_7

    .line 184
    .line 185
    iget-object v0, p0, Ll/mql0;->C:Ll/fql0;

    .line 186
    .line 187
    iget-object p0, p0, Ll/mql0;->h:Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/view/bottom/AlphaTransformerViewPager;

    .line 188
    .line 189
    invoke-virtual {p0}, Landroidx/viewpager/widget/ViewPager;->getCurrentItem()I

    .line 190
    .line 191
    .line 192
    move-result p0

    .line 193
    invoke-static {p0}, Ll/eql0;->o0(I)Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 194
    .line 195
    .line 196
    move-result-object p0

    .line 197
    invoke-virtual {v0, p0}, Ll/fql0;->d(Lcom/p1/mobile/putong/core/data/PurchaseType;)V

    .line 198
    .line 199
    .line 200
    :cond_7
    return-void
.end method

.method public final synthetic C(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {}, Ll/rj90;->d()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/mql0;->v:Ll/eql0;

    .line 5
    .line 6
    invoke-virtual {p0}, Ll/eql0;->n0()Z

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/mql0;->u:Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/VipFrag;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public final synthetic E(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public F(Lcom/p1/mobile/putong/core/data/PurchaseType;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/mql0;->g:Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/view/TopCardLayout;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/view/TopCardLayout;->a:Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/view/BounceBackViewPager;

    .line 4
    .line 5
    new-instance v1, Ll/mql0$c;

    .line 6
    .line 7
    invoke-direct {v1, p0, p1}, Ll/mql0$c;-><init>(Ll/mql0;Lcom/p1/mobile/putong/core/data/PurchaseType;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, v1}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public G()V
    .locals 7

    .line 1
    invoke-direct {p0}, Ll/mql0;->I()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/mql0;->H()V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Ll/mql0;->u:Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/VipFrag;

    .line 8
    .line 9
    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->getArguments()Landroid/os/Bundle;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    if-eqz v1, :cond_2

    .line 18
    .line 19
    const-string v1, "vip_selected_page"

    .line 20
    .line 21
    const/4 v2, 0x0

    .line 22
    invoke-virtual {v0, v1, v2}, Landroid/os/BaseBundle;->getInt(Ljava/lang/String;I)I

    .line 23
    .line 24
    .line 25
    move-result v1

    .line 26
    const-string v3, "vip_selected_from"

    .line 27
    .line 28
    const-string v4, ""

    .line 29
    .line 30
    invoke-virtual {v0, v3, v4}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    invoke-static {}, Ll/eql0;->q0()Ljava/util/ArrayList;

    .line 35
    .line 36
    .line 37
    move-result-object v3

    .line 38
    new-instance v4, Ll/beb0;

    .line 39
    .line 40
    invoke-virtual {v3, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 41
    .line 42
    .line 43
    move-result-object v3

    .line 44
    check-cast v3, Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 45
    .line 46
    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/data/PurchaseType;->productCategory()Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 47
    .line 48
    .line 49
    move-result-object v3

    .line 50
    sget-object v5, Lcom/p1/mobile/putong/core/ui/purchase/mediator/track/PurchaseTrackPageType;->page_privilege:Lcom/p1/mobile/putong/core/ui/purchase/mediator/track/PurchaseTrackPageType;

    .line 51
    .line 52
    invoke-direct {v4, v3, v5, v0}, Ll/beb0;-><init>(Lcom/p1/mobile/putong/core/data/ProductCategory;Lcom/p1/mobile/putong/core/ui/purchase/mediator/track/PurchaseTrackPageType;Ljava/lang/String;)V

    .line 53
    .line 54
    .line 55
    iput-object v4, p0, Ll/mql0;->E:Ll/lib0;

    .line 56
    .line 57
    const-string v0, "p_privileges_view"

    .line 58
    .line 59
    invoke-virtual {v4, v0}, Ll/lib0;->p(Ljava/lang/String;)V

    .line 60
    .line 61
    .line 62
    iget-object v0, p0, Ll/mql0;->g:Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/view/TopCardLayout;

    .line 63
    .line 64
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/view/TopCardLayout;->a:Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/view/BounceBackViewPager;

    .line 65
    .line 66
    invoke-virtual {v0, v1}, Landroidx/viewpager/widget/ViewPager;->setCurrentItem(I)V

    .line 67
    .line 68
    .line 69
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 70
    .line 71
    .line 72
    move-result-object v0

    .line 73
    new-instance v3, Ll/iql0;

    .line 74
    .line 75
    invoke-direct {v3, p0, v1}, Ll/iql0;-><init>(Ll/mql0;I)V

    .line 76
    .line 77
    .line 78
    invoke-virtual {v0, v3}, Lcom/p1/mobile/android/app/Act;->post(Ljava/lang/Runnable;)V

    .line 79
    .line 80
    .line 81
    iget-object v0, p0, Ll/mql0;->k:Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegePaymentView;

    .line 82
    .line 83
    sget-object v3, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_YOUTH_VIP:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 84
    .line 85
    invoke-static {v3, v1}, Ll/eql0;->t0(Lcom/p1/mobile/putong/core/data/PurchaseType;I)Z

    .line 86
    .line 87
    .line 88
    move-result v3

    .line 89
    invoke-static {v0, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 90
    .line 91
    .line 92
    iget-object v0, p0, Ll/mql0;->l:Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegePaymentView;

    .line 93
    .line 94
    sget-object v3, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_FEMALE_VIP:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 95
    .line 96
    invoke-static {v3, v1}, Ll/eql0;->t0(Lcom/p1/mobile/putong/core/data/PurchaseType;I)Z

    .line 97
    .line 98
    .line 99
    move-result v3

    .line 100
    invoke-static {v0, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 101
    .line 102
    .line 103
    iget-object v0, p0, Ll/mql0;->m:Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegePaymentView;

    .line 104
    .line 105
    sget-object v3, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_GET_VIP:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 106
    .line 107
    invoke-static {v3, v1}, Ll/eql0;->t0(Lcom/p1/mobile/putong/core/data/PurchaseType;I)Z

    .line 108
    .line 109
    .line 110
    move-result v3

    .line 111
    invoke-static {v0, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 112
    .line 113
    .line 114
    iget-object v0, p0, Ll/mql0;->n:Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegePaymentView;

    .line 115
    .line 116
    sget-object v3, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_GET_PRIVILEGE_PACKAGE:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 117
    .line 118
    invoke-static {v3, v1}, Ll/eql0;->t0(Lcom/p1/mobile/putong/core/data/PurchaseType;I)Z

    .line 119
    .line 120
    .line 121
    move-result v3

    .line 122
    invoke-static {v0, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 123
    .line 124
    .line 125
    iget-object v0, p0, Ll/mql0;->p:Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegePaymentView;

    .line 126
    .line 127
    sget-object v3, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_O_DIAMOND:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 128
    .line 129
    invoke-static {v3, v1}, Ll/eql0;->t0(Lcom/p1/mobile/putong/core/data/PurchaseType;I)Z

    .line 130
    .line 131
    .line 132
    move-result v4

    .line 133
    invoke-static {v0, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 134
    .line 135
    .line 136
    iget-object v0, p0, Ll/mql0;->o:Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegePaymentView;

    .line 137
    .line 138
    sget-object v4, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_O_PLATINUM:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 139
    .line 140
    invoke-static {v4, v1}, Ll/eql0;->t0(Lcom/p1/mobile/putong/core/data/PurchaseType;I)Z

    .line 141
    .line 142
    .line 143
    move-result v4

    .line 144
    invoke-static {v0, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 145
    .line 146
    .line 147
    iget-object v0, p0, Ll/mql0;->q:Landroid/widget/FrameLayout;

    .line 148
    .line 149
    sget-object v4, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_SUPREME_PARTNER:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 150
    .line 151
    invoke-static {v4, v1}, Ll/eql0;->t0(Lcom/p1/mobile/putong/core/data/PurchaseType;I)Z

    .line 152
    .line 153
    .line 154
    move-result v5

    .line 155
    const/4 v6, 0x1

    .line 156
    if-eqz v5, :cond_0

    .line 157
    .line 158
    invoke-static {}, Ll/joa;->O3()Z

    .line 159
    .line 160
    .line 161
    move-result v5

    .line 162
    if-nez v5, :cond_0

    .line 163
    .line 164
    move v2, v6

    .line 165
    :cond_0
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 166
    .line 167
    .line 168
    invoke-static {v4, v1}, Ll/eql0;->t0(Lcom/p1/mobile/putong/core/data/PurchaseType;I)Z

    .line 169
    .line 170
    .line 171
    move-result v0

    .line 172
    if-eqz v0, :cond_1

    .line 173
    .line 174
    iget-object v0, p0, Ll/mql0;->c:Landroid/widget/FrameLayout;

    .line 175
    .line 176
    invoke-static {v0, v6}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 177
    .line 178
    .line 179
    iget-object v0, p0, Ll/mql0;->C:Ll/fql0;

    .line 180
    .line 181
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 182
    .line 183
    .line 184
    move-result v0

    .line 185
    if-eqz v0, :cond_2

    .line 186
    .line 187
    iget-object v0, p0, Ll/mql0;->C:Ll/fql0;

    .line 188
    .line 189
    invoke-virtual {v0, v4}, Ll/fql0;->g(Lcom/p1/mobile/putong/core/data/PurchaseType;)V

    .line 190
    .line 191
    .line 192
    goto :goto_0

    .line 193
    :cond_1
    invoke-static {v3, v1}, Ll/eql0;->t0(Lcom/p1/mobile/putong/core/data/PurchaseType;I)Z

    .line 194
    .line 195
    .line 196
    move-result v0

    .line 197
    if-eqz v0, :cond_2

    .line 198
    .line 199
    invoke-static {}, Ll/s7a;->o()Z

    .line 200
    .line 201
    .line 202
    move-result v0

    .line 203
    if-eqz v0, :cond_2

    .line 204
    .line 205
    iget-object v0, p0, Ll/mql0;->c:Landroid/widget/FrameLayout;

    .line 206
    .line 207
    invoke-static {v0, v6}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 208
    .line 209
    .line 210
    iget-object v0, p0, Ll/mql0;->C:Ll/fql0;

    .line 211
    .line 212
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 213
    .line 214
    .line 215
    move-result v0

    .line 216
    if-eqz v0, :cond_2

    .line 217
    .line 218
    iget-object v0, p0, Ll/mql0;->C:Ll/fql0;

    .line 219
    .line 220
    invoke-virtual {v0, v3}, Ll/fql0;->g(Lcom/p1/mobile/putong/core/data/PurchaseType;)V

    .line 221
    .line 222
    .line 223
    :cond_2
    :goto_0
    iget-object v0, p0, Ll/mql0;->a:Landroid/widget/FrameLayout;

    .line 224
    .line 225
    new-instance v1, Ll/jql0;

    .line 226
    .line 227
    invoke-direct {v1, p0}, Ll/jql0;-><init>(Ll/mql0;)V

    .line 228
    .line 229
    .line 230
    invoke-virtual {v0, v1}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 231
    .line 232
    .line 233
    invoke-virtual {p0}, Ll/mql0;->O()V

    .line 234
    .line 235
    .line 236
    return-void
.end method

.method public H()V
    .locals 4

    .line 1
    invoke-static {}, Ll/eql0;->q0()Ljava/util/ArrayList;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v1, p0, Ll/mql0;->g:Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/view/TopCardLayout;

    .line 6
    .line 7
    invoke-virtual {v1, v0}, Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/view/TopCardLayout;->f(Ljava/util/ArrayList;)V

    .line 8
    .line 9
    .line 10
    new-instance v1, Ljava/util/ArrayList;

    .line 11
    .line 12
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 13
    .line 14
    .line 15
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 20
    .line 21
    .line 22
    move-result v2

    .line 23
    if-eqz v2, :cond_0

    .line 24
    .line 25
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    check-cast v2, Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 30
    .line 31
    iget-object v3, p0, Ll/mql0;->x:Ljava/util/LinkedHashMap;

    .line 32
    .line 33
    invoke-virtual {v3, v2}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object v2

    .line 37
    check-cast v2, Landroid/view/ViewGroup;

    .line 38
    .line 39
    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 40
    .line 41
    .line 42
    goto :goto_0

    .line 43
    :cond_0
    invoke-static {v1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    if-nez v0, :cond_1

    .line 48
    .line 49
    iget-object p0, p0, Ll/mql0;->w:Ll/ub3;

    .line 50
    .line 51
    invoke-virtual {p0, v1}, Ll/ub3;->s(Ljava/util/ArrayList;)V

    .line 52
    .line 53
    .line 54
    :cond_1
    return-void
.end method

.method public J()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/mql0;->g:Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/view/TopCardLayout;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    iget-object v2, p0, Ll/mql0;->i:Lv/VSegmentBar;

    .line 8
    .line 9
    invoke-virtual {v2}, Landroid/view/View;->getHeight()I

    .line 10
    .line 11
    .line 12
    move-result v2

    .line 13
    invoke-static {v2}, Ljava/lang/Math;->abs(I)I

    .line 14
    .line 15
    .line 16
    move-result v2

    .line 17
    sub-int/2addr v1, v2

    .line 18
    neg-int v1, v1

    .line 19
    sget-object v2, Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/behavior/TabLayoutScrollBehavior;->Companion:Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/behavior/TabLayoutScrollBehavior$a;

    .line 20
    .line 21
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/behavior/TabLayoutScrollBehavior$a;->a()I

    .line 22
    .line 23
    .line 24
    move-result v2

    .line 25
    add-int/2addr v1, v2

    .line 26
    int-to-float v1, v1

    .line 27
    invoke-virtual {v0, v1}, Landroid/view/View;->setTranslationY(F)V

    .line 28
    .line 29
    .line 30
    iget-object p0, p0, Ll/mql0;->x:Ljava/util/LinkedHashMap;

    .line 31
    .line 32
    invoke-virtual {p0}, Ljava/util/LinkedHashMap;->entrySet()Ljava/util/Set;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    invoke-interface {p0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    :cond_0
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 41
    .line 42
    .line 43
    move-result v0

    .line 44
    if-eqz v0, :cond_1

    .line 45
    .line 46
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    check-cast v0, Ljava/util/Map$Entry;

    .line 51
    .line 52
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    check-cast v0, Landroid/view/ViewGroup;

    .line 57
    .line 58
    instance-of v1, v0, Landroidx/recyclerview/widget/RecyclerView;

    .line 59
    .line 60
    if-eqz v1, :cond_0

    .line 61
    .line 62
    check-cast v0, Landroidx/recyclerview/widget/RecyclerView;

    .line 63
    .line 64
    const/4 v1, 0x0

    .line 65
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->scrollToPosition(I)V

    .line 66
    .line 67
    .line 68
    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView;->stopScroll()V

    .line 69
    .line 70
    .line 71
    goto :goto_0

    .line 72
    :cond_1
    return-void
.end method

.method public K()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/mql0;->g:Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/view/TopCardLayout;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {v0, v1}, Landroid/view/View;->setTranslationY(F)V

    .line 5
    .line 6
    .line 7
    iget-object p0, p0, Ll/mql0;->x:Ljava/util/LinkedHashMap;

    .line 8
    .line 9
    invoke-virtual {p0}, Ljava/util/LinkedHashMap;->entrySet()Ljava/util/Set;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-interface {p0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    :cond_0
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-eqz v0, :cond_1

    .line 22
    .line 23
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    check-cast v0, Ljava/util/Map$Entry;

    .line 28
    .line 29
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    check-cast v0, Landroid/view/ViewGroup;

    .line 34
    .line 35
    instance-of v1, v0, Landroidx/recyclerview/widget/RecyclerView;

    .line 36
    .line 37
    if-eqz v1, :cond_0

    .line 38
    .line 39
    check-cast v0, Landroidx/recyclerview/widget/RecyclerView;

    .line 40
    .line 41
    const/4 v1, 0x0

    .line 42
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->scrollToPosition(I)V

    .line 43
    .line 44
    .line 45
    goto :goto_0

    .line 46
    :cond_1
    return-void
.end method

.method public L(Lcom/p1/mobile/putong/core/data/PurchaseType;Lcom/p1/mobile/putong/core/data/Privilege;Ljava/lang/String;)V
    .locals 4

    .line 1
    invoke-static {}, Ll/eql0;->q0()Ljava/util/ArrayList;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v1, p0, Ll/mql0;->g:Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/view/TopCardLayout;

    .line 6
    .line 7
    iget-object v1, v1, Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/view/TopCardLayout;->a:Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/view/BounceBackViewPager;

    .line 8
    .line 9
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    .line 10
    .line 11
    .line 12
    move-result v2

    .line 13
    const/4 v3, -0x1

    .line 14
    if-ne v2, v3, :cond_0

    .line 15
    .line 16
    const/4 v0, 0x0

    .line 17
    goto :goto_0

    .line 18
    :cond_0
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    :goto_0
    invoke-virtual {v1, v0}, Landroidx/viewpager/widget/ViewPager;->setCurrentItem(I)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {p0, p1, p2, p3}, Ll/mql0;->q(Lcom/p1/mobile/putong/core/data/PurchaseType;Lcom/p1/mobile/putong/core/data/Privilege;Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public final M(Lcom/p1/mobile/putong/core/data/PurchaseType;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/mql0;->k:Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegePaymentView;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegePaymentView;->setCurrentPurchaseType(Lcom/p1/mobile/putong/core/data/PurchaseType;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/mql0;->l:Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegePaymentView;

    .line 7
    .line 8
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegePaymentView;->setCurrentPurchaseType(Lcom/p1/mobile/putong/core/data/PurchaseType;)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Ll/mql0;->m:Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegePaymentView;

    .line 12
    .line 13
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegePaymentView;->setCurrentPurchaseType(Lcom/p1/mobile/putong/core/data/PurchaseType;)V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Ll/mql0;->n:Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegePaymentView;

    .line 17
    .line 18
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegePaymentView;->setCurrentPurchaseType(Lcom/p1/mobile/putong/core/data/PurchaseType;)V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Ll/mql0;->p:Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegePaymentView;

    .line 22
    .line 23
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegePaymentView;->setCurrentPurchaseType(Lcom/p1/mobile/putong/core/data/PurchaseType;)V

    .line 24
    .line 25
    .line 26
    iget-object p0, p0, Ll/mql0;->o:Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegePaymentView;

    .line 27
    .line 28
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegePaymentView;->setCurrentPurchaseType(Lcom/p1/mobile/putong/core/data/PurchaseType;)V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public final N(Lcom/p1/mobile/putong/core/data/PurchaseType;Lcom/p1/mobile/putong/core/data/Privilege;Ljava/lang/String;)V
    .locals 6

    .line 1
    sget-object v1, Ll/cok0;->a:Ljava/lang/String;

    .line 2
    .line 3
    sget-object v0, Ll/mql0$d;->a:[I

    .line 4
    .line 5
    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    aget p1, v0, p1

    .line 10
    .line 11
    packed-switch p1, :pswitch_data_0

    .line 12
    .line 13
    .line 14
    goto/16 :goto_0

    .line 15
    .line 16
    :pswitch_0
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    invoke-static {p0, v1}, Lcom/p1/mobile/putong/core/ui/purchase/c;->n0(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    return-void

    .line 24
    :pswitch_1
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    const/4 v4, 0x0

    .line 29
    sget-object v5, Lcom/p1/mobile/putong/core/data/Privilege;->immediately_match:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 30
    .line 31
    const/4 v2, 0x0

    .line 32
    const/4 v3, 0x0

    .line 33
    invoke-static/range {v0 .. v5}, Lcom/p1/mobile/putong/core/ui/purchase/c;->a0(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ll/y20;Ll/x20;Ll/x20;Lcom/p1/mobile/putong/core/data/Privilege;)V

    .line 34
    .line 35
    .line 36
    return-void

    .line 37
    :pswitch_2
    invoke-static {}, Ll/t450;->j()Z

    .line 38
    .line 39
    .line 40
    move-result p1

    .line 41
    if-eqz p1, :cond_0

    .line 42
    .line 43
    invoke-static {}, Ll/joa;->M3()Z

    .line 44
    .line 45
    .line 46
    move-result p1

    .line 47
    if-eqz p1, :cond_0

    .line 48
    .line 49
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 50
    .line 51
    .line 52
    move-result-object p1

    .line 53
    sget p2, Lcom/p1/mobile/putong/core/R$string;->o3:I

    .line 54
    .line 55
    invoke-virtual {p1, p2}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object p1

    .line 59
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 60
    .line 61
    .line 62
    move-result-object p0

    .line 63
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 64
    .line 65
    .line 66
    move-result-object p0

    .line 67
    invoke-virtual {p0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 68
    .line 69
    .line 70
    move-result-object p0

    .line 71
    invoke-static {p1, p0}, Ll/o1j0;->z(Ljava/lang/String;Landroid/view/View;)V

    .line 72
    .line 73
    .line 74
    return-void

    .line 75
    :cond_0
    sget-object p1, Lcom/p1/mobile/putong/core/data/Privilege;->intl_no_ad:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 76
    .line 77
    if-ne p2, p1, :cond_1

    .line 78
    .line 79
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 80
    .line 81
    .line 82
    move-result-object p1

    .line 83
    invoke-virtual {p1}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 84
    .line 85
    .line 86
    move-result-object p1

    .line 87
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 88
    .line 89
    .line 90
    move-result-object p0

    .line 91
    invoke-interface {p1, p0, p3, p2}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->i6(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Privilege;)V

    .line 92
    .line 93
    .line 94
    return-void

    .line 95
    :cond_1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 96
    .line 97
    .line 98
    move-result-object p1

    .line 99
    invoke-virtual {p1}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 100
    .line 101
    .line 102
    move-result-object p1

    .line 103
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 104
    .line 105
    .line 106
    move-result-object p0

    .line 107
    sget-object p2, Lcom/p1/mobile/putong/core/data/Privilege;->see_who_likes_me:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 108
    .line 109
    invoke-interface {p1, p0, v1, p2}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->pr(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Privilege;)V

    .line 110
    .line 111
    .line 112
    return-void

    .line 113
    :pswitch_3
    sget-object p1, Lcom/p1/mobile/putong/core/data/Privilege;->intl_no_ad:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 114
    .line 115
    if-ne p2, p1, :cond_2

    .line 116
    .line 117
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 118
    .line 119
    .line 120
    move-result-object p1

    .line 121
    invoke-virtual {p1}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 122
    .line 123
    .line 124
    move-result-object p1

    .line 125
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 126
    .line 127
    .line 128
    move-result-object p0

    .line 129
    invoke-interface {p1, p0, p3, p2}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->i6(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Privilege;)V

    .line 130
    .line 131
    .line 132
    return-void

    .line 133
    :cond_2
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 134
    .line 135
    .line 136
    move-result-object p0

    .line 137
    sget-object p1, Lcom/p1/mobile/putong/core/data/Privilege;->vip_unlimited_likes:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 138
    .line 139
    invoke-static {p0, p3, p1}, Lcom/p1/mobile/putong/core/ui/purchase/c;->J1(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Privilege;)V

    .line 140
    .line 141
    .line 142
    return-void

    .line 143
    :pswitch_4
    invoke-static {}, Ll/s7a;->k()Z

    .line 144
    .line 145
    .line 146
    move-result p1

    .line 147
    if-eqz p1, :cond_3

    .line 148
    .line 149
    invoke-static {}, Ll/joa;->C3()Z

    .line 150
    .line 151
    .line 152
    move-result p1

    .line 153
    if-eqz p1, :cond_3

    .line 154
    .line 155
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 156
    .line 157
    .line 158
    move-result-object p1

    .line 159
    sget p2, Lcom/p1/mobile/putong/core/R$string;->o3:I

    .line 160
    .line 161
    invoke-virtual {p1, p2}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 162
    .line 163
    .line 164
    move-result-object p1

    .line 165
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 166
    .line 167
    .line 168
    move-result-object p0

    .line 169
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 170
    .line 171
    .line 172
    move-result-object p0

    .line 173
    invoke-virtual {p0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 174
    .line 175
    .line 176
    move-result-object p0

    .line 177
    invoke-static {p1, p0}, Ll/o1j0;->z(Ljava/lang/String;Landroid/view/View;)V

    .line 178
    .line 179
    .line 180
    return-void

    .line 181
    :cond_3
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 182
    .line 183
    .line 184
    move-result-object p0

    .line 185
    invoke-static {p0, v1}, Lcom/p1/mobile/putong/core/ui/purchase/c;->U(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 186
    .line 187
    .line 188
    return-void

    .line 189
    :pswitch_5
    invoke-static {}, Ll/s7a;->z()Z

    .line 190
    .line 191
    .line 192
    move-result p1

    .line 193
    if-eqz p1, :cond_5

    .line 194
    .line 195
    invoke-static {}, Ll/joa;->P3()Z

    .line 196
    .line 197
    .line 198
    move-result p1

    .line 199
    if-eqz p1, :cond_4

    .line 200
    .line 201
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 202
    .line 203
    .line 204
    move-result-object p1

    .line 205
    sget p2, Lcom/p1/mobile/putong/core/R$string;->o3:I

    .line 206
    .line 207
    invoke-virtual {p1, p2}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 208
    .line 209
    .line 210
    move-result-object p1

    .line 211
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 212
    .line 213
    .line 214
    move-result-object p0

    .line 215
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 216
    .line 217
    .line 218
    move-result-object p0

    .line 219
    invoke-virtual {p0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 220
    .line 221
    .line 222
    move-result-object p0

    .line 223
    invoke-static {p1, p0}, Ll/o1j0;->z(Ljava/lang/String;Landroid/view/View;)V

    .line 224
    .line 225
    .line 226
    return-void

    .line 227
    :cond_4
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 228
    .line 229
    .line 230
    move-result-object p0

    .line 231
    invoke-static {p0, v1}, Lcom/p1/mobile/putong/core/ui/purchase/c;->P0(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 232
    .line 233
    .line 234
    :cond_5
    :goto_0
    return-void

    .line 235
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public O()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/mql0;->h:Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/view/bottom/AlphaTransformerViewPager;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroidx/viewpager/widget/ViewPager;->getCurrentItem()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    invoke-static {}, Ll/eql0;->q0()Ljava/util/ArrayList;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    .line 12
    .line 13
    .line 14
    move-result v2

    .line 15
    if-ge v0, v2, :cond_2

    .line 16
    .line 17
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    check-cast v0, Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 22
    .line 23
    iget-object p0, p0, Ll/mql0;->x:Ljava/util/LinkedHashMap;

    .line 24
    .line 25
    invoke-virtual {p0}, Ljava/util/LinkedHashMap;->entrySet()Ljava/util/Set;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    invoke-interface {p0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    :cond_0
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 34
    .line 35
    .line 36
    move-result v1

    .line 37
    if-eqz v1, :cond_2

    .line 38
    .line 39
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    check-cast v1, Ljava/util/Map$Entry;

    .line 44
    .line 45
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 46
    .line 47
    .line 48
    move-result-object v2

    .line 49
    instance-of v2, v2, Ll/o290;

    .line 50
    .line 51
    if-eqz v2, :cond_0

    .line 52
    .line 53
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 54
    .line 55
    .line 56
    move-result-object v2

    .line 57
    if-ne v2, v0, :cond_1

    .line 58
    .line 59
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 60
    .line 61
    .line 62
    move-result-object v1

    .line 63
    check-cast v1, Ll/o290;

    .line 64
    .line 65
    invoke-interface {v1}, Ll/o290;->q()V

    .line 66
    .line 67
    .line 68
    goto :goto_0

    .line 69
    :cond_1
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 70
    .line 71
    .line 72
    move-result-object v1

    .line 73
    check-cast v1, Ll/o290;

    .line 74
    .line 75
    invoke-interface {v1}, Ll/o290;->c()V

    .line 76
    .line 77
    .line 78
    goto :goto_0

    .line 79
    :cond_2
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/eql0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/mql0;->p(Ll/eql0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/mql0;->n(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public n(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/nql0;->b(Ll/mql0;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public p(Ll/eql0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/mql0;->v:Ll/eql0;

    .line 2
    .line 3
    return-void
.end method

.method public q(Lcom/p1/mobile/putong/core/data/PurchaseType;Lcom/p1/mobile/putong/core/data/Privilege;Ljava/lang/String;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_YOUTH_VIP:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 2
    .line 3
    if-ne p1, v0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Ll/joa;->P3()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/mql0;->J()V

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_FEMALE_VIP:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 16
    .line 17
    if-ne p1, v0, :cond_1

    .line 18
    .line 19
    invoke-static {}, Ll/joa;->C3()Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-nez v0, :cond_1

    .line 24
    .line 25
    invoke-virtual {p0}, Ll/mql0;->J()V

    .line 26
    .line 27
    .line 28
    return-void

    .line 29
    :cond_1
    sget-object v0, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_GET_VIP:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 30
    .line 31
    if-ne p1, v0, :cond_2

    .line 32
    .line 33
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 34
    .line 35
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 36
    .line 37
    invoke-virtual {v0}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isVIP()Z

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    if-nez v0, :cond_2

    .line 46
    .line 47
    invoke-virtual {p0}, Ll/mql0;->J()V

    .line 48
    .line 49
    .line 50
    return-void

    .line 51
    :cond_2
    sget-object v0, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_GET_PRIVILEGE_PACKAGE:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 52
    .line 53
    if-ne p1, v0, :cond_3

    .line 54
    .line 55
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 56
    .line 57
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 58
    .line 59
    invoke-virtual {v0}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isSVIP()Z

    .line 64
    .line 65
    .line 66
    move-result v0

    .line 67
    if-nez v0, :cond_3

    .line 68
    .line 69
    invoke-virtual {p0}, Ll/mql0;->J()V

    .line 70
    .line 71
    .line 72
    return-void

    .line 73
    :cond_3
    invoke-static {p1}, Ll/wib0;->i(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 74
    .line 75
    .line 76
    move-result v0

    .line 77
    if-eqz v0, :cond_4

    .line 78
    .line 79
    invoke-static {}, Ll/joa;->G3()Z

    .line 80
    .line 81
    .line 82
    move-result v0

    .line 83
    if-nez v0, :cond_4

    .line 84
    .line 85
    invoke-virtual {p0}, Ll/mql0;->J()V

    .line 86
    .line 87
    .line 88
    return-void

    .line 89
    :cond_4
    invoke-static {p1}, Ll/wib0;->o(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 90
    .line 91
    .line 92
    move-result v0

    .line 93
    if-eqz v0, :cond_5

    .line 94
    .line 95
    invoke-static {}, Ll/joa;->I3()Z

    .line 96
    .line 97
    .line 98
    move-result v0

    .line 99
    if-nez v0, :cond_5

    .line 100
    .line 101
    invoke-virtual {p0}, Ll/mql0;->J()V

    .line 102
    .line 103
    .line 104
    return-void

    .line 105
    :cond_5
    invoke-virtual {p0, p1, p2, p3}, Ll/mql0;->N(Lcom/p1/mobile/putong/core/data/PurchaseType;Lcom/p1/mobile/putong/core/data/Privilege;Ljava/lang/String;)V

    .line 106
    .line 107
    .line 108
    return-void
.end method

.method public final s()V
    .locals 2

    .line 1
    iget-object p0, p0, Ll/mql0;->h:Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/view/bottom/AlphaTransformerViewPager;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroidx/viewpager/widget/ViewPager;->getCurrentItem()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    invoke-static {}, Ll/eql0;->q0()Ljava/util/ArrayList;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    if-ge p0, v1, :cond_0

    .line 16
    .line 17
    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    check-cast p0, Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 22
    .line 23
    invoke-static {p0}, Ll/rj90;->a(Lcom/p1/mobile/putong/core/data/PurchaseType;)V

    .line 24
    .line 25
    .line 26
    :cond_0
    return-void
.end method

.method public u()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/mql0;->F:Ll/pf60;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    iget-object v0, v0, Ll/pf60;->a:Ljava/lang/Object;

    .line 7
    .line 8
    check-cast v0, Ljava/lang/CharSequence;

    .line 9
    .line 10
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-nez v0, :cond_1

    .line 15
    .line 16
    invoke-static {}, Lcom/p1/mobile/android/ui/bubble/d;->l()Lcom/p1/mobile/android/ui/bubble/d;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    iget-object v1, p0, Ll/mql0;->F:Ll/pf60;

    .line 21
    .line 22
    iget-object v1, v1, Ll/pf60;->a:Ljava/lang/Object;

    .line 23
    .line 24
    check-cast v1, Ljava/lang/String;

    .line 25
    .line 26
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/ui/bubble/d;->k(Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    const/4 v0, 0x0

    .line 30
    iput-object v0, p0, Ll/mql0;->F:Ll/pf60;

    .line 31
    .line 32
    :cond_1
    :goto_0
    return-void
.end method

.method public v()Ll/lib0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/mql0;->E:Ll/lib0;

    .line 2
    .line 3
    return-object p0
.end method

.method public w()V
    .locals 5

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Ll/mql0;->B:Z

    .line 3
    .line 4
    invoke-static {}, Ll/eql0;->q0()Ljava/util/ArrayList;

    .line 5
    .line 6
    .line 7
    move-result-object v1

    .line 8
    iget-object v2, p0, Ll/mql0;->u:Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/VipFrag;

    .line 9
    .line 10
    invoke-virtual {v2}, Landroidx/fragment/app/Fragment;->getArguments()Landroid/os/Bundle;

    .line 11
    .line 12
    .line 13
    move-result-object v2

    .line 14
    iget-boolean v3, p0, Ll/mql0;->B:Z

    .line 15
    .line 16
    if-eqz v3, :cond_0

    .line 17
    .line 18
    const-string v3, "vip_selected_page"

    .line 19
    .line 20
    invoke-virtual {v2, v3, v0}, Landroid/os/BaseBundle;->getInt(Ljava/lang/String;I)I

    .line 21
    .line 22
    .line 23
    move-result v3

    .line 24
    const-string v4, "frag_args_section_select"

    .line 25
    .line 26
    invoke-virtual {v2, v4, v0}, Landroid/os/BaseBundle;->getBoolean(Ljava/lang/String;Z)Z

    .line 27
    .line 28
    .line 29
    move-result v4

    .line 30
    iput-boolean v4, p0, Ll/mql0;->y:Z

    .line 31
    .line 32
    if-eqz v4, :cond_0

    .line 33
    .line 34
    const-string v4, "frag_args_section_promotion"

    .line 35
    .line 36
    invoke-virtual {v2, v4}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object v2

    .line 40
    iput-object v2, p0, Ll/mql0;->z:Ljava/lang/String;

    .line 41
    .line 42
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 43
    .line 44
    .line 45
    move-result v2

    .line 46
    if-nez v2, :cond_0

    .line 47
    .line 48
    invoke-static {}, Ll/eql0;->q0()Ljava/util/ArrayList;

    .line 49
    .line 50
    .line 51
    move-result-object v2

    .line 52
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    .line 53
    .line 54
    .line 55
    move-result v2

    .line 56
    if-le v2, v3, :cond_0

    .line 57
    .line 58
    invoke-static {}, Ll/eql0;->q0()Ljava/util/ArrayList;

    .line 59
    .line 60
    .line 61
    move-result-object v2

    .line 62
    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 63
    .line 64
    .line 65
    move-result-object v2

    .line 66
    check-cast v2, Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 67
    .line 68
    iput-object v2, p0, Ll/mql0;->A:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 69
    .line 70
    :cond_0
    new-instance v2, Lv/VIcon;

    .line 71
    .line 72
    invoke-virtual {p0}, Ll/mql0;->C0()Landroid/content/Context;

    .line 73
    .line 74
    .line 75
    move-result-object v3

    .line 76
    invoke-direct {v2, v3}, Lv/VIcon;-><init>(Landroid/content/Context;)V

    .line 77
    .line 78
    .line 79
    iput-object v2, p0, Ll/mql0;->t:Lv/VIcon;

    .line 80
    .line 81
    invoke-static {}, Ll/s7a;->o()Z

    .line 82
    .line 83
    .line 84
    move-result v2

    .line 85
    if-eqz v2, :cond_1

    .line 86
    .line 87
    iget-object v2, p0, Ll/mql0;->e:Lv/navigationbar/VNavigationBar;

    .line 88
    .line 89
    const/4 v3, 0x0

    .line 90
    invoke-virtual {v2, v3}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 91
    .line 92
    .line 93
    new-instance v2, Ll/fql0;

    .line 94
    .line 95
    invoke-direct {v2, p0}, Ll/fql0;-><init>(Ll/mql0;)V

    .line 96
    .line 97
    .line 98
    iput-object v2, p0, Ll/mql0;->C:Ll/fql0;

    .line 99
    .line 100
    iget-object v3, p0, Ll/mql0;->A:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 101
    .line 102
    invoke-virtual {v2, v3}, Ll/fql0;->g(Lcom/p1/mobile/putong/core/data/PurchaseType;)V

    .line 103
    .line 104
    .line 105
    iget-object v2, p0, Ll/mql0;->C:Ll/fql0;

    .line 106
    .line 107
    invoke-virtual {v2}, Ll/fql0;->c()V

    .line 108
    .line 109
    .line 110
    :cond_1
    invoke-static {}, Ll/s7a;->z()Z

    .line 111
    .line 112
    .line 113
    move-result v2

    .line 114
    if-eqz v2, :cond_2

    .line 115
    .line 116
    invoke-static {}, Ll/eql0;->q0()Ljava/util/ArrayList;

    .line 117
    .line 118
    .line 119
    move-result-object v2

    .line 120
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    .line 121
    .line 122
    .line 123
    move-result v2

    .line 124
    sget v3, Ll/fql0;->b:I

    .line 125
    .line 126
    mul-int/2addr v2, v3

    .line 127
    invoke-static {}, Ll/bnl0;->y0()I

    .line 128
    .line 129
    .line 130
    move-result v3

    .line 131
    if-le v2, v3, :cond_2

    .line 132
    .line 133
    iget-object v2, p0, Ll/mql0;->i:Lv/VSegmentBar;

    .line 134
    .line 135
    invoke-virtual {v2, v0}, Lcom/google/android/material/tabs/TabLayout;->setTabMode(I)V

    .line 136
    .line 137
    .line 138
    :cond_2
    invoke-virtual {p0, v1}, Ll/mql0;->x(Ljava/util/ArrayList;)V

    .line 139
    .line 140
    .line 141
    new-instance v2, Ll/ub3;

    .line 142
    .line 143
    iget-object v3, p0, Ll/mql0;->u:Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/VipFrag;

    .line 144
    .line 145
    invoke-direct {v2, v3}, Ll/ub3;-><init>(Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/VipFrag;)V

    .line 146
    .line 147
    .line 148
    iput-object v2, p0, Ll/mql0;->w:Ll/ub3;

    .line 149
    .line 150
    iget-object v3, p0, Ll/mql0;->h:Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/view/bottom/AlphaTransformerViewPager;

    .line 151
    .line 152
    invoke-virtual {v3, v2}, Landroidx/viewpager/widget/ViewPager;->setAdapter(Ll/cf60;)V

    .line 153
    .line 154
    .line 155
    iget-object v2, p0, Ll/mql0;->h:Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/view/bottom/AlphaTransformerViewPager;

    .line 156
    .line 157
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    .line 158
    .line 159
    .line 160
    move-result v1

    .line 161
    invoke-virtual {v2, v1}, Landroidx/viewpager/widget/ViewPager;->setOffscreenPageLimit(I)V

    .line 162
    .line 163
    .line 164
    iget-object v1, p0, Ll/mql0;->h:Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/view/bottom/AlphaTransformerViewPager;

    .line 165
    .line 166
    new-instance v2, Ll/ya3;

    .line 167
    .line 168
    invoke-direct {v2}, Ll/ya3;-><init>()V

    .line 169
    .line 170
    .line 171
    const/4 v3, 0x1

    .line 172
    invoke-virtual {v1, v3, v2}, Lv/VPagerWithTransformer;->X(ZLandroidx/viewpager/widget/ViewPager$k;)V

    .line 173
    .line 174
    .line 175
    iget-object v1, p0, Ll/mql0;->h:Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/view/bottom/AlphaTransformerViewPager;

    .line 176
    .line 177
    new-instance v2, Ll/mql0$a;

    .line 178
    .line 179
    invoke-direct {v2, p0}, Ll/mql0$a;-><init>(Ll/mql0;)V

    .line 180
    .line 181
    .line 182
    invoke-virtual {v1, v2}, Landroidx/viewpager/widget/ViewPager;->d(Landroidx/viewpager/widget/ViewPager$j;)V

    .line 183
    .line 184
    .line 185
    iget-object v1, p0, Ll/mql0;->g:Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/view/TopCardLayout;

    .line 186
    .line 187
    new-instance v2, Ll/gql0;

    .line 188
    .line 189
    invoke-direct {v2, p0}, Ll/gql0;-><init>(Ll/mql0;)V

    .line 190
    .line 191
    .line 192
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/view/TopCardLayout;->setBottomContentInterface(Ll/tb3;)V

    .line 193
    .line 194
    .line 195
    iget-object v1, p0, Ll/mql0;->g:Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/view/TopCardLayout;

    .line 196
    .line 197
    iget-object v2, p0, Ll/mql0;->u:Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/VipFrag;

    .line 198
    .line 199
    iget-object v3, p0, Ll/mql0;->i:Lv/VSegmentBar;

    .line 200
    .line 201
    invoke-virtual {v1, v2, v3}, Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/view/TopCardLayout;->g(Lcom/p1/mobile/putong/app/PutongFrag;Lv/VSegmentBar;)V

    .line 202
    .line 203
    .line 204
    iget-object v1, p0, Ll/mql0;->i:Lv/VSegmentBar;

    .line 205
    .line 206
    new-instance v2, Ll/mql0$b;

    .line 207
    .line 208
    invoke-direct {v2, p0}, Ll/mql0$b;-><init>(Ll/mql0;)V

    .line 209
    .line 210
    .line 211
    invoke-virtual {v1, v2}, Lcom/google/android/material/tabs/TabLayout;->addOnTabSelectedListener(Lcom/google/android/material/tabs/TabLayout$OnTabSelectedListener;)V

    .line 212
    .line 213
    .line 214
    iget-object v1, p0, Ll/mql0;->j:Landroid/widget/FrameLayout;

    .line 215
    .line 216
    new-instance v2, Ll/hql0;

    .line 217
    .line 218
    invoke-direct {v2}, Ll/hql0;-><init>()V

    .line 219
    .line 220
    .line 221
    invoke-virtual {v1, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 222
    .line 223
    .line 224
    invoke-static {v0}, Ll/pta;->A(Z)V

    .line 225
    .line 226
    .line 227
    new-instance v0, Ljava/lang/ref/WeakReference;

    .line 228
    .line 229
    iget-object v1, p0, Ll/mql0;->D:Ll/vc0;

    .line 230
    .line 231
    invoke-direct {v0, v1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    .line 232
    .line 233
    .line 234
    invoke-static {v0}, Ll/pta;->y(Ljava/lang/ref/WeakReference;)V

    .line 235
    .line 236
    .line 237
    invoke-static {}, Ll/s7a;->o()Z

    .line 238
    .line 239
    .line 240
    move-result v0

    .line 241
    if-eqz v0, :cond_3

    .line 242
    .line 243
    iget-object p0, p0, Ll/mql0;->p:Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegePaymentView;

    .line 244
    .line 245
    const-string v0, "#150701"

    .line 246
    .line 247
    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 248
    .line 249
    .line 250
    move-result v0

    .line 251
    invoke-virtual {p0, v0}, Landroid/view/View;->setBackgroundColor(I)V

    .line 252
    .line 253
    .line 254
    :cond_3
    return-void
.end method

.method public final x(Ljava/util/ArrayList;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/core/data/PurchaseType;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    goto/16 :goto_2

    .line 8
    .line 9
    :cond_0
    iget-object v0, p0, Ll/mql0;->x:Ljava/util/LinkedHashMap;

    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/util/LinkedHashMap;->clear()V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    :cond_1
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-eqz v0, :cond_3

    .line 23
    .line 24
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    check-cast v0, Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 29
    .line 30
    sget-object v1, Ll/mql0$d;->a:[I

    .line 31
    .line 32
    invoke-virtual {v0}, Ljava/lang/Enum;->ordinal()I

    .line 33
    .line 34
    .line 35
    move-result v2

    .line 36
    aget v1, v1, v2

    .line 37
    .line 38
    packed-switch v1, :pswitch_data_0

    .line 39
    .line 40
    .line 41
    const/4 v1, 0x0

    .line 42
    goto/16 :goto_1

    .line 43
    .line 44
    :pswitch_0
    new-instance v1, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegeRecyclerSupremePartnerView;

    .line 45
    .line 46
    invoke-virtual {p0}, Ll/mql0;->C0()Landroid/content/Context;

    .line 47
    .line 48
    .line 49
    move-result-object v2

    .line 50
    invoke-direct {v1, v2}, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegeRecyclerSupremePartnerView;-><init>(Landroid/content/Context;)V

    .line 51
    .line 52
    .line 53
    goto :goto_1

    .line 54
    :pswitch_1
    new-instance v1, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegeRecyclerPlatinumView;

    .line 55
    .line 56
    invoke-virtual {p0}, Ll/mql0;->C0()Landroid/content/Context;

    .line 57
    .line 58
    .line 59
    move-result-object v2

    .line 60
    invoke-direct {v1, v2}, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegeRecyclerPlatinumView;-><init>(Landroid/content/Context;)V

    .line 61
    .line 62
    .line 63
    goto :goto_1

    .line 64
    :pswitch_2
    new-instance v1, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegeRecyclerODiamondView;

    .line 65
    .line 66
    invoke-virtual {p0}, Ll/mql0;->C0()Landroid/content/Context;

    .line 67
    .line 68
    .line 69
    move-result-object v2

    .line 70
    invoke-direct {v1, v2}, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegeRecyclerODiamondView;-><init>(Landroid/content/Context;)V

    .line 71
    .line 72
    .line 73
    goto :goto_1

    .line 74
    :pswitch_3
    new-instance v1, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegeRecyclerSVIPView;

    .line 75
    .line 76
    invoke-virtual {p0}, Ll/mql0;->C0()Landroid/content/Context;

    .line 77
    .line 78
    .line 79
    move-result-object v2

    .line 80
    invoke-direct {v1, v2}, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegeRecyclerSVIPView;-><init>(Landroid/content/Context;)V

    .line 81
    .line 82
    .line 83
    iget-boolean v2, p0, Ll/mql0;->B:Z

    .line 84
    .line 85
    if-eqz v2, :cond_2

    .line 86
    .line 87
    iget-object v2, p0, Ll/mql0;->A:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 88
    .line 89
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 90
    .line 91
    .line 92
    move-result v2

    .line 93
    if-eqz v2, :cond_2

    .line 94
    .line 95
    iget-object v2, p0, Ll/mql0;->A:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 96
    .line 97
    sget-object v3, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_GET_PRIVILEGE_PACKAGE:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 98
    .line 99
    if-ne v2, v3, :cond_2

    .line 100
    .line 101
    iget-object v2, p0, Ll/mql0;->z:Ljava/lang/String;

    .line 102
    .line 103
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegeRecyclerSVIPView;->setSelectCouponId(Ljava/lang/String;)V

    .line 104
    .line 105
    .line 106
    goto :goto_1

    .line 107
    :pswitch_4
    new-instance v1, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegeRecyclerVIPView;

    .line 108
    .line 109
    invoke-virtual {p0}, Ll/mql0;->C0()Landroid/content/Context;

    .line 110
    .line 111
    .line 112
    move-result-object v2

    .line 113
    invoke-direct {v1, v2}, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegeRecyclerVIPView;-><init>(Landroid/content/Context;)V

    .line 114
    .line 115
    .line 116
    iget-boolean v2, p0, Ll/mql0;->B:Z

    .line 117
    .line 118
    if-eqz v2, :cond_2

    .line 119
    .line 120
    iget-object v2, p0, Ll/mql0;->A:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 121
    .line 122
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 123
    .line 124
    .line 125
    move-result v2

    .line 126
    if-eqz v2, :cond_2

    .line 127
    .line 128
    iget-object v2, p0, Ll/mql0;->A:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 129
    .line 130
    sget-object v3, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_GET_VIP:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 131
    .line 132
    if-ne v2, v3, :cond_2

    .line 133
    .line 134
    iget-object v2, p0, Ll/mql0;->z:Ljava/lang/String;

    .line 135
    .line 136
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegeRecyclerVIPView;->setSelectCouponId(Ljava/lang/String;)V

    .line 137
    .line 138
    .line 139
    goto :goto_1

    .line 140
    :pswitch_5
    new-instance v1, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegeRecyclerFemaleVIPView;

    .line 141
    .line 142
    invoke-virtual {p0}, Ll/mql0;->C0()Landroid/content/Context;

    .line 143
    .line 144
    .line 145
    move-result-object v2

    .line 146
    invoke-direct {v1, v2}, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegeRecyclerFemaleVIPView;-><init>(Landroid/content/Context;)V

    .line 147
    .line 148
    .line 149
    goto :goto_1

    .line 150
    :pswitch_6
    new-instance v1, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegeRecyclerYouthVipView;

    .line 151
    .line 152
    invoke-virtual {p0}, Ll/mql0;->C0()Landroid/content/Context;

    .line 153
    .line 154
    .line 155
    move-result-object v2

    .line 156
    invoke-direct {v1, v2}, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegeRecyclerYouthVipView;-><init>(Landroid/content/Context;)V

    .line 157
    .line 158
    .line 159
    :cond_2
    :goto_1
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 160
    .line 161
    .line 162
    move-result v2

    .line 163
    if-eqz v2, :cond_1

    .line 164
    .line 165
    iget-object v2, p0, Ll/mql0;->x:Ljava/util/LinkedHashMap;

    .line 166
    .line 167
    invoke-virtual {v2, v0, v1}, Ljava/util/AbstractMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 168
    .line 169
    .line 170
    goto/16 :goto_0

    .line 171
    .line 172
    :cond_3
    :goto_2
    return-void

    .line 173
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public y(Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-static {}, Ll/eql0;->r0()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/mql0;->w()V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0}, Ll/mql0;->G()V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final synthetic z(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/mql0;->h:Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/view/bottom/AlphaTransformerViewPager;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Landroidx/viewpager/widget/ViewPager;->setCurrentItem(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

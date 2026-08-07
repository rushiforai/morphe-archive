.class public Lcom/p1/mobile/putong/core/ui/marry/profile/loop/address/MarryAddressSelectAct;
.super Lcom/p1/mobile/putong/app/PutongAct;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/core/ui/marry/profile/loop/address/MarryAddressSelectAct$d;,
        Lcom/p1/mobile/putong/core/ui/marry/profile/loop/address/MarryAddressSelectAct$c;
    }
.end annotation


# instance fields
.field public c:Lcom/p1/mobile/putong/core/newui/photoalbum/MomentDetailPager;

.field public d:I

.field public e:I

.field public f:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/ui/marry/profile/loop/address/MarryAddressSelectFrag;",
            ">;"
        }
    .end annotation
.end field

.field public g:Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarryAddressSelectData;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/app/PutongAct;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, -0x1

    .line 5
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/address/MarryAddressSelectAct;->d:I

    .line 6
    .line 7
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/address/MarryAddressSelectAct;->e:I

    .line 8
    .line 9
    return-void
.end method

.method public static synthetic X1(Lcom/p1/mobile/putong/core/ui/marry/profile/loop/address/MarryAddressSelectAct;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/address/MarryAddressSelectAct;->l2(Landroid/os/Bundle;)V

    return-void
.end method

.method public static synthetic Y1(Lcom/p1/mobile/putong/core/ui/marry/profile/loop/address/MarryAddressSelectAct;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/address/MarryAddressSelectAct;->m2()V

    return-void
.end method

.method public static synthetic Z1(Lcom/p1/mobile/putong/core/ui/marry/profile/loop/address/MarryAddressSelectAct;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/address/MarryAddressSelectAct;->n2()V

    return-void
.end method

.method public static bridge synthetic a2(Lcom/p1/mobile/putong/core/ui/marry/profile/loop/address/MarryAddressSelectAct;)Lcom/p1/mobile/putong/core/newui/photoalbum/MomentDetailPager;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/address/MarryAddressSelectAct;->c:Lcom/p1/mobile/putong/core/newui/photoalbum/MomentDetailPager;

    return-object p0
.end method

.method public static bridge synthetic b2(Lcom/p1/mobile/putong/core/ui/marry/profile/loop/address/MarryAddressSelectAct;)Ljava/util/List;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/address/MarryAddressSelectAct;->f:Ljava/util/List;

    return-object p0
.end method

.method public static bridge synthetic c2(Lcom/p1/mobile/putong/core/ui/marry/profile/loop/address/MarryAddressSelectAct;Lcom/p1/mobile/putong/core/newui/photoalbum/MomentDetailPager;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/address/MarryAddressSelectAct;->c:Lcom/p1/mobile/putong/core/newui/photoalbum/MomentDetailPager;

    return-void
.end method

.method public static bridge synthetic d2(Lcom/p1/mobile/putong/core/ui/marry/profile/loop/address/MarryAddressSelectAct;I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/address/MarryAddressSelectAct;->d:I

    return-void
.end method

.method public static bridge synthetic e2(Lcom/p1/mobile/putong/core/ui/marry/profile/loop/address/MarryAddressSelectAct;I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/address/MarryAddressSelectAct;->e:I

    return-void
.end method

.method public static bridge synthetic g2(Lcom/p1/mobile/putong/core/ui/marry/profile/loop/address/MarryAddressSelectAct;Landroid/content/Intent;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/address/MarryAddressSelectAct;->k2(Landroid/content/Intent;)V

    return-void
.end method

.method public static i2(Landroid/content/Context;Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarryAddressSelectData;)Landroid/content/Intent;
    .locals 2

    .line 1
    new-instance v0, Landroid/content/Intent;

    .line 2
    .line 3
    const-class v1, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/address/MarryAddressSelectAct;

    .line 4
    .line 5
    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 6
    .line 7
    .line 8
    const-string p0, "address_list"

    .line 9
    .line 10
    invoke-virtual {v0, p0, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 11
    .line 12
    .line 13
    return-object v0
.end method

.method private synthetic l2(Landroid/os/Bundle;)V
    .locals 0

    .line 1
    const/4 p1, 0x0

    .line 2
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/app/Act;->setSwipeBackEnable(Z)V

    .line 3
    .line 4
    .line 5
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/address/MarryAddressSelectAct;->r()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method private synthetic m2()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->act()Lcom/p1/mobile/android/app/Act;

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

.method private synthetic n2()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/address/MarryAddressSelectAct;->c:Lcom/p1/mobile/putong/core/newui/photoalbum/MomentDetailPager;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-virtual {p0, v0}, Landroidx/viewpager/widget/ViewPager;->setCurrentItem(I)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method private r()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "address_list"

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Landroid/content/Intent;->getSerializableExtra(Ljava/lang/String;)Ljava/io/Serializable;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarryAddressSelectData;

    .line 12
    .line 13
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/address/MarryAddressSelectAct;->g:Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarryAddressSelectData;

    .line 14
    .line 15
    if-nez v0, :cond_0

    .line 16
    .line 17
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 18
    .line 19
    .line 20
    return-void

    .line 21
    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    .line 22
    .line 23
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 24
    .line 25
    .line 26
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/address/MarryAddressSelectAct;->f:Ljava/util/List;

    .line 27
    .line 28
    new-instance v0, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/address/MarryAddressSelectFrag;

    .line 29
    .line 30
    new-instance v1, Ll/jyw;

    .line 31
    .line 32
    invoke-direct {v1, p0}, Ll/jyw;-><init>(Lcom/p1/mobile/putong/core/ui/marry/profile/loop/address/MarryAddressSelectAct;)V

    .line 33
    .line 34
    .line 35
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/address/MarryAddressSelectFrag;-><init>(Ll/x20;)V

    .line 36
    .line 37
    .line 38
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/address/MarryAddressSelectAct;->f:Ljava/util/List;

    .line 39
    .line 40
    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 41
    .line 42
    .line 43
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/address/MarryAddressSelectAct;->g:Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarryAddressSelectData;

    .line 44
    .line 45
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/address/MarryAddressSelectFrag;->T4(Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarryAddressSelectData;)V

    .line 46
    .line 47
    .line 48
    new-instance v1, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/address/MarryAddressSelectAct$a;

    .line 49
    .line 50
    invoke-direct {v1, p0, v0}, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/address/MarryAddressSelectAct$a;-><init>(Lcom/p1/mobile/putong/core/ui/marry/profile/loop/address/MarryAddressSelectAct;Lcom/p1/mobile/putong/core/ui/marry/profile/loop/address/MarryAddressSelectFrag;)V

    .line 51
    .line 52
    .line 53
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/address/MarryAddressSelectFrag;->U4(Lcom/p1/mobile/putong/core/ui/marry/profile/loop/address/MarryAddressSelectFrag$b;)V

    .line 54
    .line 55
    .line 56
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/address/MarryAddressSelectAct;->g:Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarryAddressSelectData;

    .line 57
    .line 58
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarryAddressSelectData;->getNextList()Ljava/util/List;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    :cond_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 67
    .line 68
    .line 69
    move-result v1

    .line 70
    if-eqz v1, :cond_2

    .line 71
    .line 72
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 73
    .line 74
    .line 75
    move-result-object v1

    .line 76
    check-cast v1, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarryAddressSelectData;

    .line 77
    .line 78
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarryAddressSelectData;->hasNextData()Z

    .line 79
    .line 80
    .line 81
    move-result v1

    .line 82
    if-eqz v1, :cond_1

    .line 83
    .line 84
    new-instance v0, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/address/MarryAddressSelectFrag;

    .line 85
    .line 86
    new-instance v1, Ll/kyw;

    .line 87
    .line 88
    invoke-direct {v1, p0}, Ll/kyw;-><init>(Lcom/p1/mobile/putong/core/ui/marry/profile/loop/address/MarryAddressSelectAct;)V

    .line 89
    .line 90
    .line 91
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/address/MarryAddressSelectFrag;-><init>(Ll/x20;)V

    .line 92
    .line 93
    .line 94
    new-instance v1, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/address/MarryAddressSelectAct$b;

    .line 95
    .line 96
    invoke-direct {v1, p0}, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/address/MarryAddressSelectAct$b;-><init>(Lcom/p1/mobile/putong/core/ui/marry/profile/loop/address/MarryAddressSelectAct;)V

    .line 97
    .line 98
    .line 99
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/address/MarryAddressSelectFrag;->U4(Lcom/p1/mobile/putong/core/ui/marry/profile/loop/address/MarryAddressSelectFrag$b;)V

    .line 100
    .line 101
    .line 102
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/address/MarryAddressSelectAct;->f:Ljava/util/List;

    .line 103
    .line 104
    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 105
    .line 106
    .line 107
    :cond_2
    new-instance v0, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/address/MarryAddressSelectAct$c;

    .line 108
    .line 109
    invoke-virtual {p0}, Landroidx/fragment/app/FragmentActivity;->getSupportFragmentManager()Landroidx/fragment/app/FragmentManager;

    .line 110
    .line 111
    .line 112
    move-result-object v1

    .line 113
    invoke-direct {v0, p0, v1}, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/address/MarryAddressSelectAct$c;-><init>(Lcom/p1/mobile/putong/core/ui/marry/profile/loop/address/MarryAddressSelectAct;Landroidx/fragment/app/FragmentManager;)V

    .line 114
    .line 115
    .line 116
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/address/MarryAddressSelectAct;->c:Lcom/p1/mobile/putong/core/newui/photoalbum/MomentDetailPager;

    .line 117
    .line 118
    invoke-virtual {p0, v0}, Landroidx/viewpager/widget/ViewPager;->setAdapter(Ll/cf60;)V

    .line 119
    .line 120
    .line 121
    return-void
.end method


# virtual methods
.method public h2(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/address/MarryAddressSelectAct$d;->a(Lcom/p1/mobile/putong/core/ui/marry/profile/loop/address/MarryAddressSelectAct;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/address/MarryAddressSelectAct;->h2(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public initDataOnCreate()V
    .locals 1

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongAct;->initDataOnCreate()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/iyw;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Ll/iyw;-><init>(Lcom/p1/mobile/putong/core/ui/marry/profile/loop/address/MarryAddressSelectAct;)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Act;->creates(Ll/y20;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final k2(Landroid/content/Intent;)V
    .locals 2

    .line 1
    const-string v0, "address_back_first"

    .line 2
    .line 3
    iget v1, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/address/MarryAddressSelectAct;->d:I

    .line 4
    .line 5
    invoke-virtual {p1, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 6
    .line 7
    .line 8
    const-string v0, "address_back_second"

    .line 9
    .line 10
    iget p0, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/address/MarryAddressSelectAct;->e:I

    .line 11
    .line 12
    invoke-virtual {p1, v0, p0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public onBackPressed()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/address/MarryAddressSelectAct;->c:Lcom/p1/mobile/putong/core/newui/photoalbum/MomentDetailPager;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroidx/viewpager/widget/ViewPager;->getCurrentItem()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x1

    .line 8
    if-ne v0, v1, :cond_0

    .line 9
    .line 10
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/address/MarryAddressSelectAct;->c:Lcom/p1/mobile/putong/core/newui/photoalbum/MomentDetailPager;

    .line 11
    .line 12
    const/4 v0, 0x0

    .line 13
    invoke-virtual {p0, v0}, Landroidx/viewpager/widget/ViewPager;->setCurrentItem(I)V

    .line 14
    .line 15
    .line 16
    return-void

    .line 17
    :cond_0
    invoke-super {p0}, Landroidx/activity/ComponentActivity;->onBackPressed()V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public preCreateView(Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/p1/mobile/putong/app/PutongAct;->preCreateView(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Landroidx/appcompat/app/AppCompatActivity;->getSupportActionBar()Ll/c30;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    move-result p1

    .line 12
    if-nez p1, :cond_0

    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    invoke-virtual {p0}, Landroidx/appcompat/app/AppCompatActivity;->getSupportActionBar()Ll/c30;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-virtual {p0}, Ll/c30;->m()V

    .line 20
    .line 21
    .line 22
    return-void
.end method

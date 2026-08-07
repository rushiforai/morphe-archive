.class public Lcom/p1/mobile/putong/core/ui/purchase/f;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/core/ui/purchase/f$d;
    }
.end annotation


# static fields
.field public static D:Z

.field public static E:Z


# instance fields
.field public A:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Lcom/p1/mobile/putong/core/data/PurchaseType;",
            ">;"
        }
    .end annotation
.end field

.field public B:Z

.field public C:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field public a:Landroid/widget/FrameLayout;

.field public b:Landroid/widget/FrameLayout;

.field public c:Landroid/widget/FrameLayout;

.field public d:Lcom/p1/mobile/putong/core/ui/alifree/AliFreeAutoView;

.field public e:Lv/VLinear;

.field public f:Lcom/p1/mobile/putong/core/ui/purchase/PurchaseTabViewContainer;

.field public g:Lcom/p1/mobile/putong/core/ui/view/VPagerInPurchaseDialog;

.field public h:Landroid/widget/LinearLayout;

.field public i:Landroid/widget/FrameLayout;

.field public j:Lv/AutoVDraweeView;

.field public k:Lcom/p1/mobile/putong/core/ui/purchase/PurchaseTabViewContainer;

.field public l:Lcom/p1/mobile/putong/core/ui/view/VPagerInPurchaseDialog;

.field public m:Landroid/widget/FrameLayout;

.field public n:Landroid/widget/FrameLayout;

.field public o:Landroid/widget/FrameLayout;

.field public final p:Lcom/p1/mobile/android/app/Act;

.field public final q:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/PurchaseType;",
            ">;"
        }
    .end annotation
.end field

.field public r:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/Privilege;",
            ">;"
        }
    .end annotation
.end field

.field public s:Ljava/lang/String;

.field public t:Ll/x20;

.field public u:I

.field public v:Lcom/p1/mobile/android/app/Dialog;

.field public w:Ll/a30;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/a30<",
            "Lcom/p1/mobile/putong/core/data/PurchaseType;",
            "Lcom/p1/mobile/android/app/Act;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public x:Ll/ig40;

.field public y:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Lcom/p1/mobile/putong/core/data/PurchaseType;",
            ">;"
        }
    .end annotation
.end field

.field public z:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Lcom/p1/mobile/putong/core/data/PurchaseType;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    invoke-static {}, Ll/vnb;->q1()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    sput-boolean v0, Lcom/p1/mobile/putong/core/ui/purchase/f;->D:Z

    .line 6
    .line 7
    invoke-static {}, Ll/vnb;->p1()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    sput-boolean v0, Lcom/p1/mobile/putong/core/ui/purchase/f;->E:Z

    .line 12
    .line 13
    return-void
.end method

.method public constructor <init>(Lcom/p1/mobile/android/app/Act;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/f;->q:Ljava/util/List;

    .line 10
    .line 11
    new-instance v0, Ll/ig40;

    .line 12
    .line 13
    invoke-direct {v0}, Ll/ig40;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/f;->x:Ll/ig40;

    .line 17
    .line 18
    const/4 v0, 0x1

    .line 19
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/f;->B:Z

    .line 20
    .line 21
    new-instance v0, Ll/i0i0;

    .line 22
    .line 23
    invoke-direct {v0, p0}, Ll/i0i0;-><init>(Lcom/p1/mobile/putong/core/ui/purchase/f;)V

    .line 24
    .line 25
    .line 26
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/f;->C:Ll/y20;

    .line 27
    .line 28
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/f;->p:Lcom/p1/mobile/android/app/Act;

    .line 29
    .line 30
    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/core/ui/purchase/f;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/purchase/f;->C(Landroid/content/DialogInterface;)V

    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/core/ui/purchase/f;Landroid/content/DialogInterface;ILandroid/view/KeyEvent;)Z
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/ui/purchase/f;->D(Landroid/content/DialogInterface;ILandroid/view/KeyEvent;)Z

    move-result p0

    return p0
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/core/ui/purchase/f;Lcom/p1/mobile/android/app/Dialog;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/purchase/f;->E(Lcom/p1/mobile/android/app/Dialog;)V

    return-void
.end method

.method public static synthetic d(Lcom/p1/mobile/putong/core/ui/purchase/f;Lcom/p1/mobile/putong/core/data/PurchaseType;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/purchase/f;->F(Lcom/p1/mobile/putong/core/data/PurchaseType;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic e(Lcom/p1/mobile/putong/core/ui/purchase/f;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/purchase/f;->B()V

    return-void
.end method

.method public static synthetic f(Lcom/p1/mobile/putong/core/ui/purchase/f;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/purchase/f;->H(Ljava/util/List;)V

    return-void
.end method

.method public static synthetic g(Lcom/p1/mobile/putong/core/ui/purchase/f;Ljava/lang/Integer;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/purchase/f;->G(Ljava/lang/Integer;)V

    return-void
.end method

.method public static bridge synthetic h(Lcom/p1/mobile/putong/core/ui/purchase/f;)Ljava/util/List;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/f;->q:Ljava/util/List;

    return-object p0
.end method

.method public static bridge synthetic i(Lcom/p1/mobile/putong/core/ui/purchase/f;)Ll/ig40;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/f;->x:Ll/ig40;

    return-object p0
.end method

.method public static bridge synthetic j(Lcom/p1/mobile/putong/core/ui/purchase/f;Lcom/p1/mobile/putong/core/data/PurchaseType;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/purchase/f;->I(Lcom/p1/mobile/putong/core/data/PurchaseType;)V

    return-void
.end method

.method public static bridge synthetic k(Lcom/p1/mobile/putong/core/ui/purchase/f;I)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/purchase/f;->J(I)V

    return-void
.end method

.method public static bridge synthetic l(Lcom/p1/mobile/putong/core/ui/purchase/f;I)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/purchase/f;->K(I)V

    return-void
.end method

.method public static bridge synthetic m(Lcom/p1/mobile/putong/core/ui/purchase/f;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/purchase/f;->L(Ljava/util/List;)V

    return-void
.end method

.method public static bridge synthetic n(Lcom/p1/mobile/putong/core/ui/purchase/f;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/purchase/f;->M(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic o(Lcom/p1/mobile/putong/core/ui/purchase/f;Ll/y20;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/purchase/f;->O(Ll/y20;)V

    return-void
.end method

.method public static bridge synthetic p(Lcom/p1/mobile/putong/core/ui/purchase/f;Ll/x20;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/purchase/f;->P(Ll/x20;)V

    return-void
.end method

.method public static bridge synthetic q(Lcom/p1/mobile/putong/core/ui/purchase/f;Ll/y20;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/purchase/f;->Q(Ll/y20;)V

    return-void
.end method

.method public static bridge synthetic r(Lcom/p1/mobile/putong/core/ui/purchase/f;Ll/a30;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/purchase/f;->R(Ll/a30;)V

    return-void
.end method

.method public static bridge synthetic s(Lcom/p1/mobile/putong/core/ui/purchase/f;Ll/y20;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/purchase/f;->S(Ll/y20;)V

    return-void
.end method

.method public static bridge synthetic t(Lcom/p1/mobile/putong/core/ui/purchase/f;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/purchase/f;->T(Ljava/util/List;)V

    return-void
.end method

.method public static bridge synthetic u(Lcom/p1/mobile/putong/core/ui/purchase/f;I)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/purchase/f;->U(I)V

    return-void
.end method

.method public static bridge synthetic v(Lcom/p1/mobile/putong/core/ui/purchase/f;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/purchase/f;->V()V

    return-void
.end method


# virtual methods
.method public final A()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/f;->x:Ll/ig40;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/f;->q:Ljava/util/List;

    .line 4
    .line 5
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/purchase/f;->r:Ljava/util/List;

    .line 6
    .line 7
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/purchase/f;->C:Ll/y20;

    .line 8
    .line 9
    invoke-virtual {v0, v1, v2, v3}, Ll/ig40;->I(Ljava/util/List;Ljava/util/List;Ll/y20;)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/f;->x:Ll/ig40;

    .line 13
    .line 14
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/f;->s:Ljava/lang/String;

    .line 15
    .line 16
    invoke-virtual {v0, v1}, Ll/ig40;->F(Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/f;->x:Ll/ig40;

    .line 20
    .line 21
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/f;->w:Ll/a30;

    .line 22
    .line 23
    invoke-virtual {v0, v1}, Ll/ig40;->H(Ll/a30;)V

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/f;->x:Ll/ig40;

    .line 27
    .line 28
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/f;->y:Ll/y20;

    .line 29
    .line 30
    invoke-virtual {v0, v1}, Ll/ig40;->G(Ll/y20;)V

    .line 31
    .line 32
    .line 33
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/f;->x:Ll/ig40;

    .line 34
    .line 35
    iget v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/f;->u:I

    .line 36
    .line 37
    invoke-virtual {v0, v1}, Ll/ig40;->E(I)V

    .line 38
    .line 39
    .line 40
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/f;->x:Ll/ig40;

    .line 41
    .line 42
    iget v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/f;->u:I

    .line 43
    .line 44
    invoke-virtual {v0, v1}, Ll/ig40;->J(I)V

    .line 45
    .line 46
    .line 47
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/f;->a:Landroid/widget/FrameLayout;

    .line 48
    .line 49
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 50
    .line 51
    .line 52
    move-result v0

    .line 53
    if-eqz v0, :cond_0

    .line 54
    .line 55
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/f;->x:Ll/ig40;

    .line 56
    .line 57
    new-instance v1, Ll/n0i0;

    .line 58
    .line 59
    invoke-direct {v1, p0}, Ll/n0i0;-><init>(Lcom/p1/mobile/putong/core/ui/purchase/f;)V

    .line 60
    .line 61
    .line 62
    invoke-virtual {v0, v1}, Ll/ig40;->D(Ll/z20;)V

    .line 63
    .line 64
    .line 65
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/f;->l:Lcom/p1/mobile/putong/core/ui/view/VPagerInPurchaseDialog;

    .line 66
    .line 67
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/f;->x:Ll/ig40;

    .line 68
    .line 69
    invoke-virtual {v0, v1}, Landroidx/viewpager/widget/ViewPager;->setAdapter(Ll/cf60;)V

    .line 70
    .line 71
    .line 72
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/f;->l:Lcom/p1/mobile/putong/core/ui/view/VPagerInPurchaseDialog;

    .line 73
    .line 74
    const/4 v1, 0x2

    .line 75
    invoke-virtual {v0, v1}, Landroidx/viewpager/widget/ViewPager;->setOffscreenPageLimit(I)V

    .line 76
    .line 77
    .line 78
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/f;->l:Lcom/p1/mobile/putong/core/ui/view/VPagerInPurchaseDialog;

    .line 79
    .line 80
    new-instance v1, Lcom/p1/mobile/putong/core/ui/purchase/f$a;

    .line 81
    .line 82
    invoke-direct {v1, p0}, Lcom/p1/mobile/putong/core/ui/purchase/f$a;-><init>(Lcom/p1/mobile/putong/core/ui/purchase/f;)V

    .line 83
    .line 84
    .line 85
    invoke-virtual {v0, v1}, Landroidx/viewpager/widget/ViewPager;->d(Landroidx/viewpager/widget/ViewPager$j;)V

    .line 86
    .line 87
    .line 88
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/f;->l:Lcom/p1/mobile/putong/core/ui/view/VPagerInPurchaseDialog;

    .line 89
    .line 90
    new-instance v1, Lcom/p1/mobile/putong/core/ui/purchase/f$b;

    .line 91
    .line 92
    invoke-direct {v1, p0}, Lcom/p1/mobile/putong/core/ui/purchase/f$b;-><init>(Lcom/p1/mobile/putong/core/ui/purchase/f;)V

    .line 93
    .line 94
    .line 95
    invoke-virtual {v0, v1}, Landroidx/viewpager/widget/ViewPager;->d(Landroidx/viewpager/widget/ViewPager$j;)V

    .line 96
    .line 97
    .line 98
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/f;->k:Lcom/p1/mobile/putong/core/ui/purchase/PurchaseTabViewContainer;

    .line 99
    .line 100
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/f;->q:Ljava/util/List;

    .line 101
    .line 102
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseTabViewContainer;->c(Ljava/util/List;)V

    .line 103
    .line 104
    .line 105
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/f;->k:Lcom/p1/mobile/putong/core/ui/purchase/PurchaseTabViewContainer;

    .line 106
    .line 107
    new-instance v1, Lcom/p1/mobile/putong/core/ui/purchase/f$c;

    .line 108
    .line 109
    invoke-direct {v1, p0}, Lcom/p1/mobile/putong/core/ui/purchase/f$c;-><init>(Lcom/p1/mobile/putong/core/ui/purchase/f;)V

    .line 110
    .line 111
    .line 112
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseTabViewContainer;->b(Lcom/p1/mobile/putong/core/ui/purchase/PurchaseTabViewContainer$a;)V

    .line 113
    .line 114
    .line 115
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/f;->k:Lcom/p1/mobile/putong/core/ui/purchase/PurchaseTabViewContainer;

    .line 116
    .line 117
    iget v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/f;->u:I

    .line 118
    .line 119
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseTabViewContainer;->setSelectTabPosition(I)V

    .line 120
    .line 121
    .line 122
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 123
    .line 124
    .line 125
    move-result-object v0

    .line 126
    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 127
    .line 128
    .line 129
    move-result-object v0

    .line 130
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->Xi()Z

    .line 131
    .line 132
    .line 133
    move-result v0

    .line 134
    if-eqz v0, :cond_1

    .line 135
    .line 136
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/f;->j:Lv/AutoVDraweeView;

    .line 137
    .line 138
    const-string v1, "https://auto.tancdn.com/v1/images/eyJpZCI6IjVGUFFFU08yUzdYUFdNVVhITU5HR1paNjJHVVhTVzExIiwidyI6MTA3NywiaCI6ODY0LCJkIjowLCJtdCI6ImltYWdlL2pwZWciLCJkaCI6ODgxMzQ5MTQ1Nzc5OX0.png"

    .line 139
    .line 140
    invoke-virtual {v0, v1}, Lv/AutoVDraweeView;->setImageUrl(Ljava/lang/String;)V

    .line 141
    .line 142
    .line 143
    :cond_1
    iget v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/f;->u:I

    .line 144
    .line 145
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/purchase/f;->K(I)V

    .line 146
    .line 147
    .line 148
    return-void
.end method

.method public final synthetic B()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/f;->q:Ljava/util/List;

    .line 2
    .line 3
    iget v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/f;->u:I

    .line 4
    .line 5
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    check-cast v0, Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 10
    .line 11
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/purchase/f;->I(Lcom/p1/mobile/putong/core/data/PurchaseType;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public final synthetic C(Landroid/content/DialogInterface;)V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p1}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-interface {p1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->E9()V

    .line 10
    .line 11
    .line 12
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/f;->x:Ll/ig40;

    .line 13
    .line 14
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/f;->k:Lcom/p1/mobile/putong/core/ui/purchase/PurchaseTabViewContainer;

    .line 15
    .line 16
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseTabViewContainer;->getSelectedTabPosition()I

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    invoke-virtual {p1, v0}, Ll/ig40;->w(I)V

    .line 21
    .line 22
    .line 23
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/f;->t:Ll/x20;

    .line 24
    .line 25
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    move-result p1

    .line 29
    if-eqz p1, :cond_0

    .line 30
    .line 31
    iget-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/f;->B:Z

    .line 32
    .line 33
    if-eqz p1, :cond_0

    .line 34
    .line 35
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/f;->t:Ll/x20;

    .line 36
    .line 37
    invoke-interface {p1}, Ll/x20;->call()V

    .line 38
    .line 39
    .line 40
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/f;->v:Lcom/p1/mobile/android/app/Dialog;

    .line 41
    .line 42
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 43
    .line 44
    .line 45
    move-result p1

    .line 46
    if-eqz p1, :cond_1

    .line 47
    .line 48
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/f;->v:Lcom/p1/mobile/android/app/Dialog;

    .line 49
    .line 50
    invoke-virtual {p0}, Ll/g1e;->dismiss()V

    .line 51
    .line 52
    .line 53
    :cond_1
    return-void
.end method

.method public final synthetic D(Landroid/content/DialogInterface;ILandroid/view/KeyEvent;)Z
    .locals 0

    .line 1
    invoke-virtual {p3}, Landroid/view/KeyEvent;->getAction()I

    .line 2
    .line 3
    .line 4
    move-result p3

    .line 5
    if-nez p3, :cond_1

    .line 6
    .line 7
    const/4 p3, 0x4

    .line 8
    if-ne p2, p3, :cond_1

    .line 9
    .line 10
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/purchase/f;->X()V

    .line 11
    .line 12
    .line 13
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/purchase/f;->z:Ll/y20;

    .line 14
    .line 15
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result p2

    .line 19
    if-eqz p2, :cond_0

    .line 20
    .line 21
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/purchase/f;->z:Ll/y20;

    .line 22
    .line 23
    iget-object p3, p0, Lcom/p1/mobile/putong/core/ui/purchase/f;->q:Ljava/util/List;

    .line 24
    .line 25
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/f;->l:Lcom/p1/mobile/putong/core/ui/view/VPagerInPurchaseDialog;

    .line 26
    .line 27
    invoke-virtual {p0}, Landroidx/viewpager/widget/ViewPager;->getCurrentItem()I

    .line 28
    .line 29
    .line 30
    move-result p0

    .line 31
    invoke-interface {p3, p0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    check-cast p0, Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 36
    .line 37
    invoke-interface {p2, p0}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 38
    .line 39
    .line 40
    :cond_0
    invoke-interface {p1}, Landroid/content/DialogInterface;->dismiss()V

    .line 41
    .line 42
    .line 43
    :cond_1
    const/4 p0, 0x0

    .line 44
    return p0
.end method

.method public final synthetic E(Lcom/p1/mobile/android/app/Dialog;)V
    .locals 1

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/f;->v:Lcom/p1/mobile/android/app/Dialog;

    .line 2
    .line 3
    invoke-virtual {p1}, Ll/g1e;->dismiss()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/purchase/f;->X()V

    .line 7
    .line 8
    .line 9
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/f;->A:Ll/y20;

    .line 10
    .line 11
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    if-eqz p1, :cond_0

    .line 16
    .line 17
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/f;->A:Ll/y20;

    .line 18
    .line 19
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/f;->q:Ljava/util/List;

    .line 20
    .line 21
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/f;->l:Lcom/p1/mobile/putong/core/ui/view/VPagerInPurchaseDialog;

    .line 22
    .line 23
    invoke-virtual {p0}, Landroidx/viewpager/widget/ViewPager;->getCurrentItem()I

    .line 24
    .line 25
    .line 26
    move-result p0

    .line 27
    invoke-interface {v0, p0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    check-cast p0, Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 32
    .line 33
    invoke-interface {p1, p0}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 34
    .line 35
    .line 36
    :cond_0
    return-void
.end method

.method public final synthetic F(Lcom/p1/mobile/putong/core/data/PurchaseType;Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/f;->q:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0, p1}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-nez p1, :cond_0

    .line 8
    .line 9
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/f;->b:Landroid/widget/FrameLayout;

    .line 10
    .line 11
    invoke-virtual {p1, p2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 12
    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/f;->c:Landroid/widget/FrameLayout;

    .line 16
    .line 17
    invoke-virtual {p1, p2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 18
    .line 19
    .line 20
    :goto_0
    iget p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/f;->u:I

    .line 21
    .line 22
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/purchase/f;->J(I)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public final synthetic G(Ljava/lang/Integer;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/f;->v:Lcom/p1/mobile/android/app/Dialog;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_5

    .line 8
    .line 9
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    const/4 v1, -0x1

    .line 14
    if-ne v0, v1, :cond_0

    .line 15
    .line 16
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/f;->v:Lcom/p1/mobile/android/app/Dialog;

    .line 17
    .line 18
    invoke-virtual {p0}, Landroid/app/Dialog;->hide()V

    .line 19
    .line 20
    .line 21
    return-void

    .line 22
    :cond_0
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    const/4 v1, 0x4

    .line 27
    const/4 v2, 0x2

    .line 28
    if-eqz v0, :cond_2

    .line 29
    .line 30
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    if-eq v0, v2, :cond_2

    .line 35
    .line 36
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 37
    .line 38
    .line 39
    move-result v0

    .line 40
    if-ne v0, v1, :cond_1

    .line 41
    .line 42
    goto :goto_0

    .line 43
    :cond_1
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 44
    .line 45
    .line 46
    move-result p1

    .line 47
    const/4 v0, 0x1

    .line 48
    if-ne p1, v0, :cond_5

    .line 49
    .line 50
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/f;->v:Lcom/p1/mobile/android/app/Dialog;

    .line 51
    .line 52
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Dialog;->show()V

    .line 53
    .line 54
    .line 55
    return-void

    .line 56
    :cond_2
    :goto_0
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 57
    .line 58
    .line 59
    move-result v0

    .line 60
    if-ne v0, v2, :cond_3

    .line 61
    .line 62
    const/4 v0, 0x0

    .line 63
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/f;->B:Z

    .line 64
    .line 65
    :cond_3
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 66
    .line 67
    .line 68
    move-result p1

    .line 69
    if-ne p1, v1, :cond_4

    .line 70
    .line 71
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/purchase/f;->X()V

    .line 72
    .line 73
    .line 74
    :cond_4
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/f;->v:Lcom/p1/mobile/android/app/Dialog;

    .line 75
    .line 76
    invoke-virtual {p0}, Ll/g1e;->dismiss()V

    .line 77
    .line 78
    .line 79
    :cond_5
    return-void
.end method

.method public final synthetic H(Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/purchase/f;->W(Ljava/util/List;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final I(Lcom/p1/mobile/putong/core/data/PurchaseType;)V
    .locals 2

    .line 1
    invoke-static {p1}, Lcom/p1/mobile/putong/core/ui/alifree/AliFreeUtils;->d(Lcom/p1/mobile/putong/core/data/PurchaseType;)Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/f;->d:Lcom/p1/mobile/putong/core/ui/alifree/AliFreeAutoView;

    .line 6
    .line 7
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/alifree/AliFreeAutoView;->g()V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/f;->d:Lcom/p1/mobile/putong/core/ui/alifree/AliFreeAutoView;

    .line 11
    .line 12
    new-instance v1, Ll/o0i0;

    .line 13
    .line 14
    invoke-direct {v1, p0, p1}, Ll/o0i0;-><init>(Lcom/p1/mobile/putong/core/ui/purchase/f;Ljava/util/List;)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {v0, v1}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public final J(I)V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/f;->b:Landroid/widget/FrameLayout;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const/4 v2, 0x1

    .line 5
    if-nez p1, :cond_0

    .line 6
    .line 7
    move v3, v2

    .line 8
    goto :goto_0

    .line 9
    :cond_0
    move v3, v1

    .line 10
    :goto_0
    invoke-static {v0, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 11
    .line 12
    .line 13
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/f;->c:Landroid/widget/FrameLayout;

    .line 14
    .line 15
    if-eqz p1, :cond_1

    .line 16
    .line 17
    move v1, v2

    .line 18
    :cond_1
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public final K(I)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/purchase/f;->N(I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final L(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/Privilege;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/f;->r:Ljava/util/List;

    .line 2
    .line 3
    return-void
.end method

.method public final M(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/f;->s:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public final N(I)V
    .locals 2

    .line 1
    sget v0, Ll/jbc0;->P0:I

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/f;->q:Ljava/util/List;

    .line 4
    .line 5
    invoke-static {v1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    if-nez v1, :cond_1

    .line 10
    .line 11
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/f;->q:Ljava/util/List;

    .line 12
    .line 13
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    if-ge p1, v1, :cond_1

    .line 18
    .line 19
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/f;->q:Ljava/util/List;

    .line 20
    .line 21
    invoke-interface {v1, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    check-cast p1, Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 26
    .line 27
    invoke-static {p1}, Ll/wib0;->q(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 28
    .line 29
    .line 30
    move-result p1

    .line 31
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/f;->j:Lv/AutoVDraweeView;

    .line 32
    .line 33
    if-eqz p1, :cond_0

    .line 34
    .line 35
    sget v0, Ll/jbc0;->O0:I

    .line 36
    .line 37
    const/4 p1, 0x1

    .line 38
    invoke-static {v1, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 39
    .line 40
    .line 41
    goto :goto_0

    .line 42
    :cond_0
    const/4 p1, 0x0

    .line 43
    invoke-static {v1, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 44
    .line 45
    .line 46
    :cond_1
    :goto_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/f;->i:Landroid/widget/FrameLayout;

    .line 47
    .line 48
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 49
    .line 50
    .line 51
    move-result p1

    .line 52
    if-eqz p1, :cond_2

    .line 53
    .line 54
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/f;->i:Landroid/widget/FrameLayout;

    .line 55
    .line 56
    invoke-virtual {p0, v0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 57
    .line 58
    .line 59
    :cond_2
    return-void
.end method

.method public final O(Ll/y20;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/y20<",
            "Lcom/p1/mobile/putong/core/data/PurchaseType;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/f;->y:Ll/y20;

    .line 2
    .line 3
    return-void
.end method

.method public final P(Ll/x20;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/f;->t:Ll/x20;

    .line 2
    .line 3
    return-void
.end method

.method public final Q(Ll/y20;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/y20<",
            "Lcom/p1/mobile/putong/core/data/PurchaseType;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/f;->z:Ll/y20;

    .line 2
    .line 3
    return-void
.end method

.method public final R(Ll/a30;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/a30<",
            "Lcom/p1/mobile/putong/core/data/PurchaseType;",
            "Lcom/p1/mobile/android/app/Act;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/f;->w:Ll/a30;

    .line 2
    .line 3
    return-void
.end method

.method public final S(Ll/y20;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/y20<",
            "Lcom/p1/mobile/putong/core/data/PurchaseType;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/f;->A:Ll/y20;

    .line 2
    .line 3
    return-void
.end method

.method public final T(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/PurchaseType;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/f;->q:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/f;->q:Ljava/util/List;

    .line 7
    .line 8
    invoke-interface {p0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final U(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/f;->u:I

    .line 2
    .line 3
    return-void
.end method

.method public final V()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/purchase/f;->z()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/purchase/f;->A()V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/f;->v:Lcom/p1/mobile/android/app/Dialog;

    .line 8
    .line 9
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Dialog;->show()V

    .line 10
    .line 11
    .line 12
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->jh()Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    if-eqz v0, :cond_0

    .line 25
    .line 26
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/f;->v:Lcom/p1/mobile/android/app/Dialog;

    .line 27
    .line 28
    invoke-virtual {v0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    if-eqz v0, :cond_0

    .line 37
    .line 38
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/f;->v:Lcom/p1/mobile/android/app/Dialog;

    .line 39
    .line 40
    invoke-virtual {v0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    sget v1, Ll/jbc0;->O9:I

    .line 45
    .line 46
    invoke-virtual {v0, v1}, Landroid/view/Window;->setBackgroundDrawableResource(I)V

    .line 47
    .line 48
    .line 49
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/purchase/f;->y()V

    .line 50
    .line 51
    .line 52
    :cond_0
    return-void
.end method

.method public final W(Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/f;->d:Lcom/p1/mobile/putong/core/ui/alifree/AliFreeAutoView;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/core/ui/alifree/AliFreeAutoView;->setTextList(Ljava/util/List;)V

    .line 4
    .line 5
    .line 6
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/f;->d:Lcom/p1/mobile/putong/core/ui/alifree/AliFreeAutoView;

    .line 7
    .line 8
    const-wide/16 v0, 0x5dc

    .line 9
    .line 10
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/core/ui/alifree/AliFreeAutoView;->setTextStillTime(J)V

    .line 11
    .line 12
    .line 13
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/f;->d:Lcom/p1/mobile/putong/core/ui/alifree/AliFreeAutoView;

    .line 14
    .line 15
    const-wide/16 v0, 0x3e8

    .line 16
    .line 17
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/core/ui/alifree/AliFreeAutoView;->setAnimTime(J)V

    .line 18
    .line 19
    .line 20
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/f;->d:Lcom/p1/mobile/putong/core/ui/alifree/AliFreeAutoView;

    .line 21
    .line 22
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/alifree/AliFreeAutoView;->f()V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public final X()V
    .locals 4

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->j0:Lcom/p1/mobile/putong/core/api/CoreProduct;

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/CoreProduct;->B4()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_1

    .line 10
    .line 11
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 12
    .line 13
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->j0:Lcom/p1/mobile/putong/core/api/CoreProduct;

    .line 14
    .line 15
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/CoreProduct;->y4()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    return-void

    .line 23
    :cond_1
    :goto_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/f;->p:Lcom/p1/mobile/android/app/Act;

    .line 24
    .line 25
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 26
    .line 27
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->j0:Lcom/p1/mobile/putong/core/api/CoreProduct;

    .line 28
    .line 29
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/api/CoreProduct;->C4()Lcom/p1/mobile/putong/core/data/FreeTrialData;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/FreeTrialData;->titleText:Ljava/lang/String;

    .line 34
    .line 35
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 36
    .line 37
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->j0:Lcom/p1/mobile/putong/core/api/CoreProduct;

    .line 38
    .line 39
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/api/CoreProduct;->C4()Lcom/p1/mobile/putong/core/data/FreeTrialData;

    .line 40
    .line 41
    .line 42
    move-result-object v2

    .line 43
    iget-object v2, v2, Lcom/p1/mobile/putong/core/data/FreeTrialData;->promotionUrl:Ljava/lang/String;

    .line 44
    .line 45
    const/4 v3, 0x1

    .line 46
    invoke-static {v0, v1, v2, v3}, Lcom/p1/mobile/putong/ui/webview/WebViewAct;->b2(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Z)Landroid/content/Intent;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    const-string v1, "hideNavigationBar"

    .line 51
    .line 52
    invoke-virtual {v0, v1, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 53
    .line 54
    .line 55
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/f;->p:Lcom/p1/mobile/android/app/Act;

    .line 56
    .line 57
    invoke-virtual {p0, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 58
    .line 59
    .line 60
    return-void
.end method

.method public final w(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/p0i0;->a(Lcom/p1/mobile/putong/core/ui/purchase/f;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final x(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/q0i0;->a(Lcom/p1/mobile/putong/core/ui/purchase/f;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final y()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/f;->q:Ljava/util/List;

    .line 2
    .line 3
    iget v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/f;->u:I

    .line 4
    .line 5
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    check-cast v0, Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 10
    .line 11
    invoke-static {v0}, Lcom/p1/mobile/putong/core/ui/alifree/AliFreeUtils;->d(Lcom/p1/mobile/putong/core/data/PurchaseType;)Ljava/util/List;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/purchase/f;->W(Ljava/util/List;)V

    .line 16
    .line 17
    .line 18
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    const/4 v1, 0x1

    .line 23
    if-ne v0, v1, :cond_0

    .line 24
    .line 25
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/f;->d:Lcom/p1/mobile/putong/core/ui/alifree/AliFreeAutoView;

    .line 26
    .line 27
    new-instance v1, Ll/m0i0;

    .line 28
    .line 29
    invoke-direct {v1, p0}, Ll/m0i0;-><init>(Lcom/p1/mobile/putong/core/ui/purchase/f;)V

    .line 30
    .line 31
    .line 32
    const-wide/16 v2, 0x3e8

    .line 33
    .line 34
    invoke-virtual {v0, v1, v2, v3}, Landroid/view/View;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 35
    .line 36
    .line 37
    :cond_0
    return-void
.end method

.method public final z()V
    .locals 3

    .line 1
    sget v0, Ll/rec0;->a1:I

    .line 2
    .line 3
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-virtual {v1}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-interface {v1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->jh()Z

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    if-eqz v1, :cond_0

    .line 16
    .line 17
    sget v0, Ll/rec0;->b1:I

    .line 18
    .line 19
    :cond_0
    sget v1, Ll/dgc0;->h:I

    .line 20
    .line 21
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/purchase/f;->p:Lcom/p1/mobile/android/app/Act;

    .line 22
    .line 23
    invoke-virtual {v2}, Lcom/p1/mobile/android/app/Act;->dialog()Lcom/p1/mobile/android/app/Dialog$e;

    .line 24
    .line 25
    .line 26
    move-result-object v2

    .line 27
    invoke-virtual {v2, v0}, Lcom/p1/mobile/android/app/Dialog$e;->M(I)Lcom/p1/mobile/android/app/Dialog$e;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Dialog$e;->L(I)Lcom/p1/mobile/android/app/Dialog$e;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Dialog$e;->v()Lcom/p1/mobile/android/app/Dialog$e;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    sget-object v1, Ll/g6e;->b:Lcom/p1/mobile/android/app/Dialog$f;

    .line 40
    .line 41
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Dialog$e;->y0(Lcom/p1/mobile/android/app/Dialog$f;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    new-instance v1, Ll/j0i0;

    .line 46
    .line 47
    invoke-direct {v1, p0}, Ll/j0i0;-><init>(Lcom/p1/mobile/putong/core/ui/purchase/f;)V

    .line 48
    .line 49
    .line 50
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Dialog$e;->V(Landroid/content/DialogInterface$OnDismissListener;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    new-instance v1, Ll/k0i0;

    .line 55
    .line 56
    invoke-direct {v1, p0}, Ll/k0i0;-><init>(Lcom/p1/mobile/putong/core/ui/purchase/f;)V

    .line 57
    .line 58
    .line 59
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Dialog$e;->i0(Landroid/content/DialogInterface$OnKeyListener;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    new-instance v1, Ll/l0i0;

    .line 64
    .line 65
    invoke-direct {v1, p0}, Ll/l0i0;-><init>(Lcom/p1/mobile/putong/core/ui/purchase/f;)V

    .line 66
    .line 67
    .line 68
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Dialog$e;->K0(Lcom/p1/mobile/android/app/Dialog$i;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Dialog$e;->z()Lcom/p1/mobile/android/app/Dialog;

    .line 73
    .line 74
    .line 75
    move-result-object v0

    .line 76
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/f;->v:Lcom/p1/mobile/android/app/Dialog;

    .line 77
    .line 78
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Dialog;->P()Landroid/view/View;

    .line 79
    .line 80
    .line 81
    move-result-object v0

    .line 82
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 83
    .line 84
    .line 85
    move-result-object v1

    .line 86
    invoke-virtual {v1}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 87
    .line 88
    .line 89
    move-result-object v1

    .line 90
    invoke-interface {v1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->jh()Z

    .line 91
    .line 92
    .line 93
    move-result v1

    .line 94
    if-eqz v1, :cond_1

    .line 95
    .line 96
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/purchase/f;->x(Landroid/view/View;)V

    .line 97
    .line 98
    .line 99
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/f;->f:Lcom/p1/mobile/putong/core/ui/purchase/PurchaseTabViewContainer;

    .line 100
    .line 101
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/f;->k:Lcom/p1/mobile/putong/core/ui/purchase/PurchaseTabViewContainer;

    .line 102
    .line 103
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/f;->g:Lcom/p1/mobile/putong/core/ui/view/VPagerInPurchaseDialog;

    .line 104
    .line 105
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/f;->l:Lcom/p1/mobile/putong/core/ui/view/VPagerInPurchaseDialog;

    .line 106
    .line 107
    return-void

    .line 108
    :cond_1
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/purchase/f;->w(Landroid/view/View;)V

    .line 109
    .line 110
    .line 111
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/f;->m:Landroid/widget/FrameLayout;

    .line 112
    .line 113
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/f;->a:Landroid/widget/FrameLayout;

    .line 114
    .line 115
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/f;->n:Landroid/widget/FrameLayout;

    .line 116
    .line 117
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/f;->b:Landroid/widget/FrameLayout;

    .line 118
    .line 119
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/f;->o:Landroid/widget/FrameLayout;

    .line 120
    .line 121
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/f;->c:Landroid/widget/FrameLayout;

    .line 122
    .line 123
    return-void
.end method

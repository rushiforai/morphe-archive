.class public abstract Ll/il2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/xl2;",
        ">;"
    }
.end annotation


# instance fields
.field public A:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

.field public B:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/live/livingroom/increment/recharge/LiveFastRechargeItem;",
            ">;"
        }
    .end annotation
.end field

.field public C:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

.field public D:Ljava/lang/String;

.field public E:I

.field public F:D

.field public G:I

.field public H:I

.field public I:Lcom/p1/mobile/putong/data/PayMethod;

.field public J:Lcom/p1/mobile/putong/live/base/data/BLiveMerchandise;

.field public K:Ll/z20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/z20<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveMerchandise;",
            "Lcom/p1/mobile/putong/live/livingroom/increment/recharge/LiveFastRechargeItem;",
            ">;"
        }
    .end annotation
.end field

.field public a:Landroid/widget/LinearLayout;

.field public b:Landroid/view/View;

.field public c:Lv/VEditText;

.field public d:Lv/VText;

.field public e:Landroid/view/View;

.field public f:Lcom/p1/mobile/putong/live/livingroom/increment/recharge/CustomClickConstraintLayout;

.field public g:Lv/VFrame;

.field public h:Lv/VText;

.field public i:Lv/VText;

.field public j:Lv/VImage;

.field public k:Lv/VFrame;

.field public l:Lv/VText;

.field public m:Lv/VText;

.field public n:Lcom/p1/mobile/putong/live/livingroom/increment/recharge/LiveFastRechargeItem;

.field public o:Lcom/p1/mobile/putong/live/livingroom/increment/recharge/LiveFastRechargeItem;

.field public p:Lcom/p1/mobile/putong/live/livingroom/increment/recharge/LiveFastRechargeItem;

.field public q:Lcom/p1/mobile/putong/live/livingroom/increment/recharge/LiveFastRechargeItem;

.field public r:Lcom/p1/mobile/putong/live/livingroom/increment/recharge/LiveFastRechargeItem;

.field public s:Lcom/p1/mobile/putong/live/livingroom/increment/recharge/LiveFastRechargeItem;

.field public t:Lv/VFrame;

.field public u:Lv/VLinear;

.field public v:Lcom/p1/mobile/putong/live/livingroom/increment/recharge/LocalNewFirstRechargeSubGiftItemView;

.field public w:Lcom/p1/mobile/putong/live/livingroom/increment/recharge/LocalNewFirstRechargeSubGiftItemView;

.field public x:Lcom/p1/mobile/putong/live/livingroom/increment/recharge/LocalNewFirstRechargeSubGiftItemView;

.field public y:Lv/VDraweeView;

.field public z:Ll/xl2;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/dl2;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Ll/dl2;-><init>(Ll/il2;)V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/il2;->K:Ll/z20;

    .line 10
    .line 11
    return-void
.end method

.method private C()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/il2;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    iget-object v0, p0, Ll/il2;->A:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 9
    .line 10
    if-nez v0, :cond_1

    .line 11
    .line 12
    invoke-direct {p0}, Ll/il2;->E()V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0}, Ll/il2;->B()V

    .line 16
    .line 17
    .line 18
    :cond_1
    :goto_0
    return-void
.end method

.method private E()V
    .locals 4

    .line 1
    new-instance v0, Ll/c0s;

    .line 2
    .line 3
    iget-object v1, p0, Ll/il2;->z:Ll/xl2;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/il2;->act()Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    .line 8
    move-result-object v2

    .line 9
    invoke-virtual {v2}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    const/4 v3, 0x0

    .line 14
    invoke-virtual {p0, v2, v3}, Ll/il2;->q(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 15
    .line 16
    .line 17
    move-result-object v2

    .line 18
    invoke-direct {v0, v1, v2}, Ll/c0s;-><init>(Ll/xzs;Landroid/view/View;)V

    .line 19
    .line 20
    .line 21
    iput-object v0, p0, Ll/il2;->A:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 22
    .line 23
    sget-object v1, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/LiveDialogEnum;->FAST_RECHARGE:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/LiveDialogEnum;

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->j0(Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/LiveDialogEnum;)V

    .line 26
    .line 27
    .line 28
    new-instance v0, Ljava/util/ArrayList;

    .line 29
    .line 30
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 31
    .line 32
    .line 33
    iput-object v0, p0, Ll/il2;->B:Ljava/util/ArrayList;

    .line 34
    .line 35
    iget-object v1, p0, Ll/il2;->n:Lcom/p1/mobile/putong/live/livingroom/increment/recharge/LiveFastRechargeItem;

    .line 36
    .line 37
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 38
    .line 39
    .line 40
    iget-object v0, p0, Ll/il2;->B:Ljava/util/ArrayList;

    .line 41
    .line 42
    iget-object v1, p0, Ll/il2;->o:Lcom/p1/mobile/putong/live/livingroom/increment/recharge/LiveFastRechargeItem;

    .line 43
    .line 44
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 45
    .line 46
    .line 47
    iget-object v0, p0, Ll/il2;->B:Ljava/util/ArrayList;

    .line 48
    .line 49
    iget-object v1, p0, Ll/il2;->p:Lcom/p1/mobile/putong/live/livingroom/increment/recharge/LiveFastRechargeItem;

    .line 50
    .line 51
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 52
    .line 53
    .line 54
    iget-object v0, p0, Ll/il2;->B:Ljava/util/ArrayList;

    .line 55
    .line 56
    iget-object v1, p0, Ll/il2;->q:Lcom/p1/mobile/putong/live/livingroom/increment/recharge/LiveFastRechargeItem;

    .line 57
    .line 58
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 59
    .line 60
    .line 61
    iget-object v0, p0, Ll/il2;->B:Ljava/util/ArrayList;

    .line 62
    .line 63
    iget-object v1, p0, Ll/il2;->r:Lcom/p1/mobile/putong/live/livingroom/increment/recharge/LiveFastRechargeItem;

    .line 64
    .line 65
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 66
    .line 67
    .line 68
    iget-object v0, p0, Ll/il2;->B:Ljava/util/ArrayList;

    .line 69
    .line 70
    iget-object v1, p0, Ll/il2;->s:Lcom/p1/mobile/putong/live/livingroom/increment/recharge/LiveFastRechargeItem;

    .line 71
    .line 72
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 73
    .line 74
    .line 75
    iget-object v0, p0, Ll/il2;->e:Landroid/view/View;

    .line 76
    .line 77
    new-instance v1, Ll/wk2;

    .line 78
    .line 79
    invoke-direct {v1, p0}, Ll/wk2;-><init>(Ll/il2;)V

    .line 80
    .line 81
    .line 82
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 83
    .line 84
    .line 85
    invoke-virtual {p0}, Ll/il2;->F()V

    .line 86
    .line 87
    .line 88
    invoke-virtual {p0}, Ll/il2;->A()Lv/VText;

    .line 89
    .line 90
    .line 91
    move-result-object v0

    .line 92
    new-instance v1, Ll/zk2;

    .line 93
    .line 94
    invoke-direct {v1, p0}, Ll/zk2;-><init>(Ll/il2;)V

    .line 95
    .line 96
    .line 97
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 98
    .line 99
    .line 100
    return-void
.end method

.method public static synthetic a(Ll/il2;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/il2;->M(Landroid/content/DialogInterface;)V

    return-void
.end method

.method public static synthetic b(Ll/il2;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/il2;->P(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic c(Ll/il2;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/il2;->N(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic d(Ll/il2;Lcom/p1/mobile/putong/live/base/data/BLiveMerchandise;Lcom/p1/mobile/putong/live/livingroom/increment/recharge/LiveFastRechargeItem;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/il2;->R(Lcom/p1/mobile/putong/live/base/data/BLiveMerchandise;Lcom/p1/mobile/putong/live/livingroom/increment/recharge/LiveFastRechargeItem;)V

    return-void
.end method

.method public static synthetic e(IILcom/p1/mobile/putong/live/livingroom/increment/recharge/LiveFastRechargeItem;)V
    .locals 0

    .line 1
    invoke-virtual {p2, p0}, Lcom/p1/mobile/putong/live/livingroom/increment/recharge/LiveFastRechargeItem;->setTitleTextColor(I)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p2, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/recharge/LiveFastRechargeItem;->setSubTitleTextColor(I)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public static synthetic f(Ll/il2;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/il2;->O(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic i(Ll/il2;Ll/bkg;ILandroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/il2;->S(Ll/bkg;ILandroid/content/DialogInterface;)V

    return-void
.end method

.method public static synthetic j(Ll/il2;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/il2;->L(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic k(Ll/il2;DLcom/p1/mobile/putong/live/livingroom/increment/recharge/LiveFastRechargeItem;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/il2;->Q(DLcom/p1/mobile/putong/live/livingroom/increment/recharge/LiveFastRechargeItem;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic l(Lcom/p1/mobile/putong/live/livingroom/increment/recharge/LiveFastRechargeItem;Lcom/p1/mobile/putong/live/livingroom/increment/recharge/LiveFastRechargeItem;)V
    .locals 0

    .line 1
    if-eq p1, p0, :cond_0

    .line 2
    .line 3
    const/4 p0, 0x0

    .line 4
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/live/livingroom/increment/recharge/LiveFastRechargeItem;->m0(Z)V

    .line 5
    .line 6
    .line 7
    :cond_0
    return-void
.end method

.method public static synthetic m(Ll/il2;Lcom/p1/mobile/putong/live/livingroom/increment/recharge/LiveFastRechargeItem;)Z
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/il2;->H(Lcom/p1/mobile/putong/live/livingroom/increment/recharge/LiveFastRechargeItem;)Z

    move-result p0

    return p0
.end method

.method public static synthetic n(Lcom/p1/mobile/putong/live/livingroom/increment/recharge/LiveFastRechargeItem;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/recharge/LiveFastRechargeItem;->getCurrentRechargeModule()Lcom/p1/mobile/putong/live/base/data/BLiveMerchandise;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    iget-boolean p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveMerchandise;->isCustomRecharge:Z

    .line 8
    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x1

    .line 12
    goto :goto_0

    .line 13
    :cond_0
    const/4 p0, 0x0

    .line 14
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    return-object p0
.end method

.method private w()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/il2;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    iget-object v1, p0, Ll/il2;->c:Lv/VEditText;

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->hideInput(Landroid/view/View;)Z

    .line 11
    .line 12
    .line 13
    iget-object p0, p0, Ll/il2;->C:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 14
    .line 15
    if-eqz p0, :cond_1

    .line 16
    .line 17
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->dismiss()V

    .line 18
    .line 19
    .line 20
    :cond_1
    :goto_0
    return-void
.end method


# virtual methods
.method public abstract A()Lv/VText;
.end method

.method public final B()V
    .locals 5

    .line 1
    new-instance v0, Ll/c0s;

    .line 2
    .line 3
    iget-object v1, p0, Ll/il2;->z:Ll/xl2;

    .line 4
    .line 5
    sget v2, Ll/jgc0;->g:I

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/il2;->act()Lcom/p1/mobile/android/app/Act;

    .line 8
    .line 9
    .line 10
    move-result-object v3

    .line 11
    invoke-virtual {v3}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 12
    .line 13
    .line 14
    move-result-object v3

    .line 15
    const/4 v4, 0x0

    .line 16
    invoke-virtual {p0, v3, v4}, Ll/il2;->p(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 17
    .line 18
    .line 19
    move-result-object v3

    .line 20
    invoke-direct {v0, v1, v2, v3}, Ll/c0s;-><init>(Ll/xzs;ILandroid/view/View;)V

    .line 21
    .line 22
    .line 23
    iput-object v0, p0, Ll/il2;->C:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 24
    .line 25
    iget-object v0, p0, Ll/il2;->b:Landroid/view/View;

    .line 26
    .line 27
    new-instance v1, Ll/al2;

    .line 28
    .line 29
    invoke-direct {v1, p0}, Ll/al2;-><init>(Ll/il2;)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 33
    .line 34
    .line 35
    iget-object v0, p0, Ll/il2;->C:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 36
    .line 37
    new-instance v1, Ll/bl2;

    .line 38
    .line 39
    invoke-direct {v1, p0}, Ll/bl2;-><init>(Ll/il2;)V

    .line 40
    .line 41
    .line 42
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->setOnShowListener(Landroid/content/DialogInterface$OnShowListener;)V

    .line 43
    .line 44
    .line 45
    iget-object v0, p0, Ll/il2;->d:Lv/VText;

    .line 46
    .line 47
    new-instance v1, Ll/cl2;

    .line 48
    .line 49
    invoke-direct {v1, p0}, Ll/cl2;-><init>(Ll/il2;)V

    .line 50
    .line 51
    .line 52
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 53
    .line 54
    .line 55
    iget-object v0, p0, Ll/il2;->c:Lv/VEditText;

    .line 56
    .line 57
    invoke-virtual {p0}, Ll/il2;->b0()Ll/jri0;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    invoke-virtual {v0, p0}, Landroid/widget/TextView;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 62
    .line 63
    .line 64
    return-void
.end method

.method public C0()Landroid/content/Context;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/il2;->z:Ll/xl2;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public abstract F()V
.end method

.method public final G(D)V
    .locals 3

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    cmpl-double v0, p1, v0

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Ll/il2;->n:Lcom/p1/mobile/putong/live/livingroom/increment/recharge/LiveFastRechargeItem;

    .line 8
    .line 9
    invoke-virtual {p0}, Landroid/view/View;->performClick()Z

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    iget-object v0, p0, Ll/il2;->B:Ljava/util/ArrayList;

    .line 14
    .line 15
    new-instance v1, Ll/xk2;

    .line 16
    .line 17
    invoke-direct {v1, p0, p1, p2}, Ll/xk2;-><init>(Ll/il2;D)V

    .line 18
    .line 19
    .line 20
    invoke-static {v0, v1}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    check-cast p1, Lcom/p1/mobile/putong/live/livingroom/increment/recharge/LiveFastRechargeItem;

    .line 25
    .line 26
    if-eqz p1, :cond_1

    .line 27
    .line 28
    invoke-virtual {p1}, Landroid/view/View;->performClick()Z

    .line 29
    .line 30
    .line 31
    return-void

    .line 32
    :cond_1
    iget-object p1, p0, Ll/il2;->B:Ljava/util/ArrayList;

    .line 33
    .line 34
    const/4 p2, 0x0

    .line 35
    invoke-virtual {p1, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    check-cast p1, Lcom/p1/mobile/putong/live/livingroom/increment/recharge/LiveFastRechargeItem;

    .line 40
    .line 41
    iget-object p2, p0, Ll/il2;->B:Ljava/util/ArrayList;

    .line 42
    .line 43
    invoke-virtual {p2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 44
    .line 45
    .line 46
    move-result-object p2

    .line 47
    :cond_2
    :goto_0
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    .line 48
    .line 49
    .line 50
    move-result v0

    .line 51
    if-eqz v0, :cond_3

    .line 52
    .line 53
    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/increment/recharge/LiveFastRechargeItem;

    .line 58
    .line 59
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/increment/recharge/LiveFastRechargeItem;->getTTPrice()I

    .line 60
    .line 61
    .line 62
    move-result v1

    .line 63
    int-to-double v1, v1

    .line 64
    invoke-virtual {p0, v0, v1, v2}, Ll/il2;->K(Lcom/p1/mobile/putong/live/livingroom/increment/recharge/LiveFastRechargeItem;D)Z

    .line 65
    .line 66
    .line 67
    move-result v1

    .line 68
    if-eqz v1, :cond_2

    .line 69
    .line 70
    move-object p1, v0

    .line 71
    goto :goto_0

    .line 72
    :cond_3
    invoke-virtual {p1}, Landroid/view/View;->performClick()Z

    .line 73
    .line 74
    .line 75
    return-void
.end method

.method public final H(Lcom/p1/mobile/putong/live/livingroom/increment/recharge/LiveFastRechargeItem;)Z
    .locals 0

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/increment/recharge/LiveFastRechargeItem;->getCurrentRechargeModule()Lcom/p1/mobile/putong/live/base/data/BLiveMerchandise;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    iget-boolean p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveMerchandise;->isCustomRecharge:Z

    .line 8
    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x1

    .line 12
    return p0

    .line 13
    :cond_0
    const/4 p0, 0x0

    .line 14
    return p0
.end method

.method public final I(I)Z
    .locals 0

    .line 1
    const/4 p0, 0x2

    .line 2
    if-ne p1, p0, :cond_0

    .line 3
    .line 4
    const/4 p0, 0x1

    .line 5
    return p0

    .line 6
    :cond_0
    const/4 p0, 0x0

    .line 7
    return p0
.end method

.method public J()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/il2;->z:Ll/xl2;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    return p0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    return p0
.end method

.method public final K(Lcom/p1/mobile/putong/live/livingroom/increment/recharge/LiveFastRechargeItem;D)Z
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/il2;->H(Lcom/p1/mobile/putong/live/livingroom/increment/recharge/LiveFastRechargeItem;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-nez p0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/increment/recharge/LiveFastRechargeItem;->getTTPrice()I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    int-to-double p0, p0

    .line 12
    cmpl-double p0, p0, p2

    .line 13
    .line 14
    if-ltz p0, :cond_0

    .line 15
    .line 16
    const/4 p0, 0x1

    .line 17
    return p0

    .line 18
    :cond_0
    const/4 p0, 0x0

    .line 19
    return p0
.end method

.method public final synthetic L(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/il2;->w()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic M(Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/il2;->T()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic N(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/il2;->u()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic O(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/il2;->v()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic P(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/il2;->d0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic Q(DLcom/p1/mobile/putong/live/livingroom/increment/recharge/LiveFastRechargeItem;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p3, p1, p2}, Ll/il2;->K(Lcom/p1/mobile/putong/live/livingroom/increment/recharge/LiveFastRechargeItem;D)Z

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

.method public final synthetic R(Lcom/p1/mobile/putong/live/base/data/BLiveMerchandise;Lcom/p1/mobile/putong/live/livingroom/increment/recharge/LiveFastRechargeItem;)V
    .locals 3

    .line 1
    iget-boolean v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMerchandise;->isCustomRecharge:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Ll/il2;->C:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->show()V

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    iput-object p1, p0, Ll/il2;->J:Lcom/p1/mobile/putong/live/base/data/BLiveMerchandise;

    .line 12
    .line 13
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMerchandise;->defaultStockKeepUnit:Lcom/p1/mobile/putong/live/base/data/BLiveStockKeepUnit;

    .line 14
    .line 15
    iget-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveStockKeepUnit;->id:Ljava/lang/String;

    .line 16
    .line 17
    iput-object v1, p0, Ll/il2;->D:Ljava/lang/String;

    .line 18
    .line 19
    iget-boolean v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMerchandise;->isOneRMBRecharge:Z

    .line 20
    .line 21
    if-eqz v1, :cond_1

    .line 22
    .line 23
    iget v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMerchandise;->quantity:I

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_1
    const/4 v1, 0x0

    .line 27
    :goto_0
    iput v1, p0, Ll/il2;->H:I

    .line 28
    .line 29
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveStockKeepUnit;->prices:Lcom/p1/mobile/putong/live/base/data/BLivePrices;

    .line 30
    .line 31
    iget-wide v0, v0, Lcom/p1/mobile/putong/live/base/data/BLivePrices;->price:D

    .line 32
    .line 33
    double-to-int v2, v0

    .line 34
    iput v2, p0, Ll/il2;->E:I

    .line 35
    .line 36
    iput-wide v0, p0, Ll/il2;->F:D

    .line 37
    .line 38
    iget p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMerchandise;->quantity:I

    .line 39
    .line 40
    iput p1, p0, Ll/il2;->G:I

    .line 41
    .line 42
    invoke-virtual {p0, p2}, Ll/il2;->c0(Lcom/p1/mobile/putong/live/livingroom/increment/recharge/LiveFastRechargeItem;)V

    .line 43
    .line 44
    .line 45
    invoke-virtual {p0}, Ll/il2;->a0()V

    .line 46
    .line 47
    .line 48
    return-void
.end method

.method public final synthetic S(Ll/bkg;ILandroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/il2;->J()Z

    .line 2
    .line 3
    .line 4
    move-result p3

    .line 5
    if-eqz p3, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    iget-object p3, p1, Ll/bkg;->e:Ll/x20;

    .line 9
    .line 10
    if-eqz p3, :cond_1

    .line 11
    .line 12
    invoke-interface {p3}, Ll/x20;->call()V

    .line 13
    .line 14
    .line 15
    return-void

    .line 16
    :cond_1
    invoke-virtual {p0, p2}, Ll/il2;->I(I)Z

    .line 17
    .line 18
    .line 19
    move-result p2

    .line 20
    if-nez p2, :cond_2

    .line 21
    .line 22
    invoke-virtual {p1}, Ll/bkg;->a()Z

    .line 23
    .line 24
    .line 25
    move-result p1

    .line 26
    if-nez p1, :cond_2

    .line 27
    .line 28
    iget-object p1, p0, Ll/il2;->z:Ll/xl2;

    .line 29
    .line 30
    invoke-virtual {p1}, Ll/xl2;->z4()Z

    .line 31
    .line 32
    .line 33
    move-result p1

    .line 34
    if-eqz p1, :cond_2

    .line 35
    .line 36
    iget-object p1, p0, Ll/il2;->z:Ll/xl2;

    .line 37
    .line 38
    invoke-virtual {p1}, Ll/xl2;->y4()V

    .line 39
    .line 40
    .line 41
    :cond_2
    invoke-virtual {p0}, Ll/il2;->W()V

    .line 42
    .line 43
    .line 44
    return-void
.end method

.method public final T()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/il2;->c:Lv/VEditText;

    .line 2
    .line 3
    const-string v1, ""

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ll/il2;->c:Lv/VEditText;

    .line 9
    .line 10
    invoke-virtual {v0}, Landroid/view/View;->requestFocus()Z

    .line 11
    .line 12
    .line 13
    iget-object p0, p0, Ll/il2;->c:Lv/VEditText;

    .line 14
    .line 15
    const/4 v0, 0x3

    .line 16
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setInputType(I)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public U()V
    .locals 0

    .line 1
    return-void
.end method

.method public V(Ljava/util/List;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveMerchandise;",
            ">;)V"
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    :goto_0
    iget-object v1, p0, Ll/il2;->B:Ljava/util/ArrayList;

    .line 3
    .line 4
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    .line 5
    .line 6
    .line 7
    move-result v1

    .line 8
    if-ge v0, v1, :cond_1

    .line 9
    .line 10
    iget-object v1, p0, Ll/il2;->B:Ljava/util/ArrayList;

    .line 11
    .line 12
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    check-cast v1, Lcom/p1/mobile/putong/live/livingroom/increment/recharge/LiveFastRechargeItem;

    .line 17
    .line 18
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 19
    .line 20
    .line 21
    move-result v2

    .line 22
    if-ge v0, v2, :cond_0

    .line 23
    .line 24
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object v2

    .line 28
    check-cast v2, Lcom/p1/mobile/putong/live/base/data/BLiveMerchandise;

    .line 29
    .line 30
    iget-object v3, p0, Ll/il2;->K:Ll/z20;

    .line 31
    .line 32
    invoke-virtual {v1, v2, v3}, Lcom/p1/mobile/putong/live/livingroom/increment/recharge/LiveFastRechargeItem;->o0(Lcom/p1/mobile/putong/live/base/data/BLiveMerchandise;Ll/z20;)V

    .line 33
    .line 34
    .line 35
    :cond_0
    add-int/lit8 v0, v0, 0x1

    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_1
    return-void
.end method

.method public final W()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/il2;->B:Ljava/util/ArrayList;

    .line 2
    .line 3
    new-instance v1, Ll/yk2;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/yk2;-><init>(Ll/il2;)V

    .line 6
    .line 7
    .line 8
    invoke-static {v0, v1}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/increment/recharge/LiveFastRechargeItem;

    .line 13
    .line 14
    if-nez v0, :cond_0

    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_0
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/increment/recharge/LiveFastRechargeItem;->getCurrentRechargeModule()Lcom/p1/mobile/putong/live/base/data/BLiveMerchandise;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    if-eqz v1, :cond_1

    .line 22
    .line 23
    const/4 v2, 0x0

    .line 24
    iput-boolean v2, v1, Lcom/p1/mobile/putong/live/base/data/BLiveMerchandise;->isCustomRechargeInput:Z

    .line 25
    .line 26
    iget-object p0, p0, Ll/il2;->K:Ll/z20;

    .line 27
    .line 28
    invoke-virtual {v0, v1, p0}, Lcom/p1/mobile/putong/live/livingroom/increment/recharge/LiveFastRechargeItem;->o0(Lcom/p1/mobile/putong/live/base/data/BLiveMerchandise;Ll/z20;)V

    .line 29
    .line 30
    .line 31
    :cond_1
    :goto_0
    return-void
.end method

.method public X(Ljava/lang/Long;)V
    .locals 4
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "SetTextI18n"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/il2;->m:Lv/VText;

    .line 2
    .line 3
    sget-object v0, Ll/zrv;->e:Landroid/app/Application;

    .line 4
    .line 5
    invoke-static {}, Ll/u8n;->a()Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    if-eqz v1, :cond_0

    .line 10
    .line 11
    sget v1, Lcom/p1/mobile/putong/live/livingroom/R$string;->U6:I

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    sget v1, Lcom/p1/mobile/putong/live/livingroom/R$string;->T6:I

    .line 15
    .line 16
    :goto_0
    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    .line 17
    .line 18
    .line 19
    move-result-wide v2

    .line 20
    invoke-static {v2, v3}, Ll/aiv;->r0(J)Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    filled-new-array {p1}, [Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    invoke-virtual {v0, v1, p1}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public Y(II)V
    .locals 1
    .param p1    # I
        .annotation build Landroidx/annotation/ColorInt;
        .end annotation
    .end param
    .param p2    # I
        .annotation build Landroidx/annotation/ColorInt;
        .end annotation
    .end param

    .line 1
    iget-object p0, p0, Ll/il2;->B:Ljava/util/ArrayList;

    .line 2
    .line 3
    new-instance v0, Ll/gl2;

    .line 4
    .line 5
    invoke-direct {v0, p1, p2}, Ll/gl2;-><init>(II)V

    .line 6
    .line 7
    .line 8
    invoke-static {p0, v0}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public Z(DLl/bkg;)V
    .locals 4

    .line 1
    iget v0, p3, Ll/bkg;->a:I

    .line 2
    .line 3
    iget-object v1, p0, Ll/il2;->l:Lv/VText;

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Ll/il2;->I(I)Z

    .line 6
    .line 7
    .line 8
    move-result v2

    .line 9
    if-eqz v2, :cond_1

    .line 10
    .line 11
    sget-object v2, Ll/zrv;->e:Landroid/app/Application;

    .line 12
    .line 13
    invoke-static {}, Ll/u8n;->a()Z

    .line 14
    .line 15
    .line 16
    move-result v3

    .line 17
    if-eqz v3, :cond_0

    .line 18
    .line 19
    sget v3, Lcom/p1/mobile/putong/live/livingroom/R$string;->Nb:I

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    sget v3, Lcom/p1/mobile/putong/live/livingroom/R$string;->B0:I

    .line 23
    .line 24
    :goto_0
    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v2

    .line 28
    goto :goto_2

    .line 29
    :cond_1
    sget-object v2, Ll/zrv;->e:Landroid/app/Application;

    .line 30
    .line 31
    invoke-static {}, Ll/u8n;->a()Z

    .line 32
    .line 33
    .line 34
    move-result v3

    .line 35
    if-eqz v3, :cond_2

    .line 36
    .line 37
    sget v3, Lcom/p1/mobile/putong/live/livingroom/R$string;->M2:I

    .line 38
    .line 39
    goto :goto_1

    .line 40
    :cond_2
    sget v3, Lcom/p1/mobile/putong/live/livingroom/R$string;->L2:I

    .line 41
    .line 42
    :goto_1
    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object v2

    .line 46
    :goto_2
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 47
    .line 48
    .line 49
    iget-object v1, p0, Ll/il2;->A:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 50
    .line 51
    new-instance v2, Ll/hl2;

    .line 52
    .line 53
    invoke-direct {v2, p0, p3, v0}, Ll/hl2;-><init>(Ll/il2;Ll/bkg;I)V

    .line 54
    .line 55
    .line 56
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 57
    .line 58
    .line 59
    invoke-virtual {p0, p1, p2}, Ll/il2;->G(D)V

    .line 60
    .line 61
    .line 62
    iget-object p0, p0, Ll/il2;->A:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 63
    .line 64
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->show()V

    .line 65
    .line 66
    .line 67
    return-void
.end method

.method public abstract a0()V
.end method

.method public act()Lcom/p1/mobile/android/app/Act;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/il2;->z:Ll/xl2;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public final b0()Ll/jri0;
    .locals 1
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    new-instance v0, Ll/il2$a;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/il2$a;-><init>(Ll/il2;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public c0(Lcom/p1/mobile/putong/live/livingroom/increment/recharge/LiveFastRechargeItem;)V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/live/livingroom/increment/recharge/LiveFastRechargeItem;->m0(Z)V

    .line 3
    .line 4
    .line 5
    iget-object p0, p0, Ll/il2;->B:Ljava/util/ArrayList;

    .line 6
    .line 7
    new-instance v0, Ll/el2;

    .line 8
    .line 9
    invoke-direct {v0, p1}, Ll/el2;-><init>(Lcom/p1/mobile/putong/live/livingroom/increment/recharge/LiveFastRechargeItem;)V

    .line 10
    .line 11
    .line 12
    invoke-static {p0, v0}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public final d0()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/il2;->D:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_2

    .line 8
    .line 9
    sget-object v0, Ll/zrv;->a:Ll/wrv;

    .line 10
    .line 11
    invoke-virtual {v0}, Ll/wrv;->H()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-nez v0, :cond_0

    .line 16
    .line 17
    iget v0, p0, Ll/il2;->E:I

    .line 18
    .line 19
    if-eqz v0, :cond_2

    .line 20
    .line 21
    :cond_0
    sget-object v0, Ll/zrv;->a:Ll/wrv;

    .line 22
    .line 23
    invoke-virtual {v0}, Ll/wrv;->H()Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-eqz v0, :cond_1

    .line 28
    .line 29
    iget-wide v0, p0, Ll/il2;->F:D

    .line 30
    .line 31
    const-wide/16 v2, 0x0

    .line 32
    .line 33
    cmpl-double v0, v0, v2

    .line 34
    .line 35
    if-nez v0, :cond_1

    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_1
    new-instance v0, Ll/xl2$b;

    .line 39
    .line 40
    invoke-direct {v0}, Ll/xl2$b;-><init>()V

    .line 41
    .line 42
    .line 43
    iget-object v1, p0, Ll/il2;->D:Ljava/lang/String;

    .line 44
    .line 45
    iput-object v1, v0, Ll/xl2$b;->a:Ljava/lang/String;

    .line 46
    .line 47
    iget v1, p0, Ll/il2;->E:I

    .line 48
    .line 49
    iput v1, v0, Ll/xl2$b;->b:I

    .line 50
    .line 51
    iget v1, p0, Ll/il2;->H:I

    .line 52
    .line 53
    iput v1, v0, Ll/xl2$b;->c:I

    .line 54
    .line 55
    iget v1, p0, Ll/il2;->G:I

    .line 56
    .line 57
    iput v1, v0, Ll/xl2$b;->d:I

    .line 58
    .line 59
    iget-object v1, p0, Ll/il2;->J:Lcom/p1/mobile/putong/live/base/data/BLiveMerchandise;

    .line 60
    .line 61
    iput-object v1, v0, Ll/xl2$b;->e:Lcom/p1/mobile/putong/live/base/data/BLiveMerchandise;

    .line 62
    .line 63
    iget-object v1, p0, Ll/il2;->I:Lcom/p1/mobile/putong/data/PayMethod;

    .line 64
    .line 65
    iput-object v1, v0, Ll/xl2$b;->f:Lcom/p1/mobile/putong/data/PayMethod;

    .line 66
    .line 67
    iget-object p0, p0, Ll/il2;->z:Ll/xl2;

    .line 68
    .line 69
    invoke-virtual {p0, v0}, Ll/xl2;->l4(Ll/xl2$b;)V

    .line 70
    .line 71
    .line 72
    :cond_2
    :goto_0
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/il2;->x()V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Ll/il2;->w()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/xl2;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/il2;->s(Ll/xl2;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public p(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/jl2;->b(Ll/il2;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public q(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/kl2;->b(Ll/il2;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public s(Ll/xl2;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/il2;->z:Ll/xl2;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    invoke-direct {p0}, Ll/il2;->C()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public final u()V
    .locals 6

    .line 1
    invoke-virtual {p0}, Ll/il2;->z()Lcom/p1/mobile/putong/live/livingroom/increment/recharge/LiveFastRechargeItem;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    sget-object v0, Ll/zrv;->e:Landroid/app/Application;

    .line 8
    .line 9
    sget v1, Lcom/p1/mobile/putong/live/livingroom/R$string;->Ob:I

    .line 10
    .line 11
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-static {v0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    invoke-direct {p0}, Ll/il2;->w()V

    .line 19
    .line 20
    .line 21
    return-void

    .line 22
    :cond_0
    :try_start_0
    iget-object v1, p0, Ll/il2;->c:Lv/VEditText;

    .line 23
    .line 24
    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 33
    .line 34
    .line 35
    move-result v1
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    .line 36
    goto :goto_0

    .line 37
    :catch_0
    const/4 v1, 0x0

    .line 38
    :goto_0
    if-lez v1, :cond_1

    .line 39
    .line 40
    const v2, 0xc351

    .line 41
    .line 42
    .line 43
    if-ge v1, v2, :cond_1

    .line 44
    .line 45
    invoke-direct {p0}, Ll/il2;->w()V

    .line 46
    .line 47
    .line 48
    invoke-virtual {p0, v0}, Ll/il2;->c0(Lcom/p1/mobile/putong/live/livingroom/increment/recharge/LiveFastRechargeItem;)V

    .line 49
    .line 50
    .line 51
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/increment/recharge/LiveFastRechargeItem;->getCurrentRechargeModule()Lcom/p1/mobile/putong/live/base/data/BLiveMerchandise;

    .line 52
    .line 53
    .line 54
    move-result-object v2

    .line 55
    iget-object v3, v2, Lcom/p1/mobile/putong/live/base/data/BLiveMerchandise;->defaultStockKeepUnit:Lcom/p1/mobile/putong/live/base/data/BLiveStockKeepUnit;

    .line 56
    .line 57
    iget-object v4, v3, Lcom/p1/mobile/putong/live/base/data/BLiveStockKeepUnit;->id:Ljava/lang/String;

    .line 58
    .line 59
    iput-object v4, p0, Ll/il2;->D:Ljava/lang/String;

    .line 60
    .line 61
    mul-int/lit8 v4, v1, 0xa

    .line 62
    .line 63
    iput v4, p0, Ll/il2;->H:I

    .line 64
    .line 65
    iput v1, p0, Ll/il2;->E:I

    .line 66
    .line 67
    iput v4, p0, Ll/il2;->G:I

    .line 68
    .line 69
    iput v4, v2, Lcom/p1/mobile/putong/live/base/data/BLiveMerchandise;->quantity:I

    .line 70
    .line 71
    iget-object v3, v3, Lcom/p1/mobile/putong/live/base/data/BLiveStockKeepUnit;->prices:Lcom/p1/mobile/putong/live/base/data/BLivePrices;

    .line 72
    .line 73
    int-to-double v4, v1

    .line 74
    iput-wide v4, v3, Lcom/p1/mobile/putong/live/base/data/BLivePrices;->price:D

    .line 75
    .line 76
    const/4 v1, 0x1

    .line 77
    iput-boolean v1, v2, Lcom/p1/mobile/putong/live/base/data/BLiveMerchandise;->isCustomRechargeInput:Z

    .line 78
    .line 79
    iget-object v1, p0, Ll/il2;->K:Ll/z20;

    .line 80
    .line 81
    invoke-virtual {v0, v2, v1}, Lcom/p1/mobile/putong/live/livingroom/increment/recharge/LiveFastRechargeItem;->o0(Lcom/p1/mobile/putong/live/base/data/BLiveMerchandise;Ll/z20;)V

    .line 82
    .line 83
    .line 84
    invoke-virtual {p0}, Ll/il2;->a0()V

    .line 85
    .line 86
    .line 87
    goto :goto_1

    .line 88
    :cond_1
    sget-object p0, Ll/zrv;->e:Landroid/app/Application;

    .line 89
    .line 90
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->I6:I

    .line 91
    .line 92
    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 93
    .line 94
    .line 95
    move-result-object p0

    .line 96
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 97
    .line 98
    .line 99
    :goto_1
    return-void
.end method

.method public v()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/il2;->A:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/app/Dialog;->isShowing()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Ll/il2;->A:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->dismiss()V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method public x()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/il2;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v1, p0, Ll/il2;->c:Lv/VEditText;

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->hideInput(Landroid/view/View;)Z

    .line 10
    .line 11
    .line 12
    :cond_0
    iget-object p0, p0, Ll/il2;->C:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 13
    .line 14
    if-eqz p0, :cond_1

    .line 15
    .line 16
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->dismiss()V

    .line 17
    .line 18
    .line 19
    :cond_1
    return-void
.end method

.method public abstract y(Z)V
.end method

.method public final z()Lcom/p1/mobile/putong/live/livingroom/increment/recharge/LiveFastRechargeItem;
    .locals 1
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/il2;->B:Ljava/util/ArrayList;

    .line 2
    .line 3
    new-instance v0, Ll/fl2;

    .line 4
    .line 5
    invoke-direct {v0}, Ll/fl2;-><init>()V

    .line 6
    .line 7
    .line 8
    invoke-static {p0, v0}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/increment/recharge/LiveFastRechargeItem;

    .line 13
    .line 14
    return-object p0
.end method

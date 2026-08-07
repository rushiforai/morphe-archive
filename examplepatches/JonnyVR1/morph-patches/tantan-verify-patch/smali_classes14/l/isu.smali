.class public Ll/isu;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/isu$d;,
        Ll/isu$c;
    }
.end annotation


# instance fields
.field public A:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveMerchandise;",
            ">;"
        }
    .end annotation
.end field

.field public B:Lcom/p1/mobile/putong/live/base/data/BLiveMerchandise;

.field public C:Ll/x20;

.field public D:Ll/x20;

.field public E:Ll/x20;

.field public F:Ljava/lang/String;

.field public G:I

.field public H:D

.field public I:I

.field public J:I

.field public K:Lcom/p1/mobile/putong/data/PayMethod;

.field public L:Lcom/p1/mobile/putong/live/base/data/BLiveMerchandise;

.field public M:Z

.field public N:I

.field public final O:Ll/z20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/z20<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveMerchandise;",
            "Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatRechargeItemView;",
            ">;"
        }
    .end annotation
.end field

.field public a:Landroidx/constraintlayout/widget/ConstraintLayout;

.field public b:Landroid/view/View;

.field public c:Landroid/widget/LinearLayout;

.field public d:Lv/VEditText;

.field public e:Lv/VText;

.field public f:Landroid/view/View;

.field public g:Lcom/p1/mobile/putong/live/livingroom/increment/recharge/CustomClickConstraintLayout;

.field public h:Lv/VText;

.field public i:Lv/VText;

.field public j:Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatRechargeItemView;

.field public k:Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatRechargeItemView;

.field public l:Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatRechargeItemView;

.field public m:Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatRechargeItemView;

.field public n:Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatRechargeItemView;

.field public o:Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatRechargeItemView;

.field public p:Landroidx/constraintlayout/widget/ConstraintLayout;

.field public q:Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatPayItemView;

.field public r:Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatPayItemView;

.field public s:Lv/VText;

.field public t:Landroidx/constraintlayout/widget/Group;

.field public u:Lv/VText;

.field public v:Lcom/p1/mobile/android/app/Act;

.field public w:Lcom/google/android/material/bottomsheet/BottomSheetDialog;

.field public x:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatRechargeItemView;",
            ">;"
        }
    .end annotation
.end field

.field public y:Lcom/google/android/material/bottomsheet/BottomSheetDialog;

.field public z:Z


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    iput-boolean v0, p0, Ll/isu;->z:Z

    .line 6
    .line 7
    new-instance v0, Ll/nru;

    .line 8
    .line 9
    invoke-direct {v0, p0}, Ll/nru;-><init>(Ll/isu;)V

    .line 10
    .line 11
    .line 12
    iput-object v0, p0, Ll/isu;->O:Ll/z20;

    .line 13
    .line 14
    if-nez p1, :cond_0

    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_0
    iput-object p1, p0, Ll/isu;->v:Lcom/p1/mobile/android/app/Act;

    .line 18
    .line 19
    iget-object p1, p0, Ll/isu;->w:Lcom/google/android/material/bottomsheet/BottomSheetDialog;

    .line 20
    .line 21
    if-nez p1, :cond_1

    .line 22
    .line 23
    invoke-virtual {p0}, Ll/isu;->C()V

    .line 24
    .line 25
    .line 26
    :cond_1
    :goto_0
    return-void
.end method

.method public static synthetic a(Ll/isu;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/isu;->K(Landroid/content/DialogInterface;)V

    return-void
.end method

.method public static synthetic b(Ll/isu;Lcom/p1/mobile/putong/live/base/data/BLiveMerchandise;Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatRechargeItemView;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/isu;->N(Lcom/p1/mobile/putong/live/base/data/BLiveMerchandise;Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatRechargeItemView;)V

    return-void
.end method

.method public static synthetic c(Ll/isu;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/isu;->L(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic d(Ll/isu;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/isu;->R(Landroid/content/DialogInterface;)V

    return-void
.end method

.method public static synthetic e(Ll/isu;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/isu;->T(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic f(Ll/isu;Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatRechargeItemView;)Z
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/isu;->F(Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatRechargeItemView;)Z

    move-result p0

    return p0
.end method

.method public static synthetic g(Ll/isu;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/isu;->P()V

    return-void
.end method

.method public static synthetic h(Ll/isu;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/isu;->O()V

    return-void
.end method

.method public static synthetic i(Ll/isu;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/isu;->Q()V

    return-void
.end method

.method public static synthetic j(Ll/isu;Lcom/p1/mobile/putong/live/base/data/BLiveCoin;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/isu;->V(Lcom/p1/mobile/putong/live/base/data/BLiveCoin;)V

    return-void
.end method

.method public static synthetic k(Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatPayItemView;Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatPayItemView;)V
    .locals 0

    .line 1
    if-ne p1, p0, :cond_0

    .line 2
    .line 3
    const/4 p0, 0x1

    .line 4
    goto :goto_0

    .line 5
    :cond_0
    const/4 p0, 0x0

    .line 6
    :goto_0
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatPayItemView;->setSelected(Z)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public static synthetic l(Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    sget-object p0, Ll/zrv;->e:Landroid/app/Application;

    .line 2
    .line 3
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->Ob:I

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public static synthetic m(Ll/isu;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/isu;->I(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic n(Ll/isu;DLjava/util/List;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/isu;->U(DLjava/util/List;)V

    return-void
.end method

.method public static synthetic o(Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatRechargeItemView;Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatRechargeItemView;)V
    .locals 0

    .line 1
    if-eq p1, p0, :cond_0

    .line 2
    .line 3
    const/4 p0, 0x0

    .line 4
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatRechargeItemView;->m0(Z)V

    .line 5
    .line 6
    .line 7
    :cond_0
    return-void
.end method

.method public static synthetic p(Ll/isu;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/isu;->S(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic q(Ll/isu;DLcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatRechargeItemView;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/isu;->M(DLcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatRechargeItemView;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic r(Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatRechargeItemView;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatRechargeItemView;->getCurrentRechargeModule()Lcom/p1/mobile/putong/live/base/data/BLiveMerchandise;

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

.method public static synthetic s(Ll/isu;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/isu;->J(Landroid/view/View;)V

    return-void
.end method

.method public static bridge synthetic t(Ll/isu;)I
    .locals 0

    .line 1
    iget p0, p0, Ll/isu;->N:I

    return p0
.end method


# virtual methods
.method public final A()Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatRechargeItemView;
    .locals 1
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/isu;->x:Ljava/util/ArrayList;

    .line 2
    .line 3
    new-instance v0, Ll/tru;

    .line 4
    .line 5
    invoke-direct {v0}, Ll/tru;-><init>()V

    .line 6
    .line 7
    .line 8
    invoke-static {p0, v0}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    check-cast p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatRechargeItemView;

    .line 13
    .line 14
    return-object p0
.end method

.method public B(Ll/isu$d;)Lcom/p1/mobile/putong/data/PurchasePaymentParam;
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/data/PurchasePaymentParam;->new_()Lcom/p1/mobile/putong/data/PurchasePaymentParam;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object v0, p1, Ll/isu$d;->a:Ljava/lang/String;

    .line 6
    .line 7
    iput-object v0, p0, Lcom/p1/mobile/putong/data/PaymentParam;->itemId:Ljava/lang/String;

    .line 8
    .line 9
    iget p1, p1, Ll/isu$d;->c:I

    .line 10
    .line 11
    if-lez p1, :cond_0

    .line 12
    .line 13
    iput p1, p0, Lcom/p1/mobile/putong/data/PurchasePaymentParam;->quantity:I

    .line 14
    .line 15
    :cond_0
    return-object p0
.end method

.method public final C()V
    .locals 3

    .line 1
    new-instance v0, Lcom/google/android/material/bottomsheet/BottomSheetDialog;

    .line 2
    .line 3
    iget-object v1, p0, Ll/isu;->v:Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    sget v2, Ll/hgc0;->d:I

    .line 6
    .line 7
    invoke-direct {v0, v1, v2}, Lcom/google/android/material/bottomsheet/BottomSheetDialog;-><init>(Landroid/content/Context;I)V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Ll/isu;->w:Lcom/google/android/material/bottomsheet/BottomSheetDialog;

    .line 11
    .line 12
    iget-object v0, p0, Ll/isu;->v:Lcom/p1/mobile/android/app/Act;

    .line 13
    .line 14
    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    sget v1, Ll/xec0;->F1:I

    .line 19
    .line 20
    const/4 v2, 0x0

    .line 21
    invoke-virtual {v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-virtual {p0, v0}, Ll/isu;->u(Landroid/view/View;)V

    .line 26
    .line 27
    .line 28
    const-string v1, "videoChat"

    .line 29
    .line 30
    const-string v2, "show:fastRechargeDialog"

    .line 31
    .line 32
    invoke-static {v1, v2}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    iget-object v1, p0, Ll/isu;->w:Lcom/google/android/material/bottomsheet/BottomSheetDialog;

    .line 36
    .line 37
    invoke-virtual {v1, v0}, Lcom/google/android/material/bottomsheet/BottomSheetDialog;->setContentView(Landroid/view/View;)V

    .line 38
    .line 39
    .line 40
    new-instance v0, Ljava/util/ArrayList;

    .line 41
    .line 42
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 43
    .line 44
    .line 45
    iput-object v0, p0, Ll/isu;->x:Ljava/util/ArrayList;

    .line 46
    .line 47
    iget-object v1, p0, Ll/isu;->j:Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatRechargeItemView;

    .line 48
    .line 49
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 50
    .line 51
    .line 52
    iget-object v0, p0, Ll/isu;->x:Ljava/util/ArrayList;

    .line 53
    .line 54
    iget-object v1, p0, Ll/isu;->k:Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatRechargeItemView;

    .line 55
    .line 56
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 57
    .line 58
    .line 59
    iget-object v0, p0, Ll/isu;->x:Ljava/util/ArrayList;

    .line 60
    .line 61
    iget-object v1, p0, Ll/isu;->l:Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatRechargeItemView;

    .line 62
    .line 63
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 64
    .line 65
    .line 66
    iget-object v0, p0, Ll/isu;->x:Ljava/util/ArrayList;

    .line 67
    .line 68
    iget-object v1, p0, Ll/isu;->m:Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatRechargeItemView;

    .line 69
    .line 70
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 71
    .line 72
    .line 73
    iget-object v0, p0, Ll/isu;->x:Ljava/util/ArrayList;

    .line 74
    .line 75
    iget-object v1, p0, Ll/isu;->n:Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatRechargeItemView;

    .line 76
    .line 77
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 78
    .line 79
    .line 80
    iget-object v0, p0, Ll/isu;->x:Ljava/util/ArrayList;

    .line 81
    .line 82
    iget-object v1, p0, Ll/isu;->o:Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatRechargeItemView;

    .line 83
    .line 84
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 85
    .line 86
    .line 87
    iget-object v0, p0, Ll/isu;->f:Landroid/view/View;

    .line 88
    .line 89
    new-instance v1, Ll/fsu;

    .line 90
    .line 91
    invoke-direct {v1, p0}, Ll/fsu;-><init>(Ll/isu;)V

    .line 92
    .line 93
    .line 94
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 95
    .line 96
    .line 97
    invoke-virtual {p0}, Ll/isu;->D()V

    .line 98
    .line 99
    .line 100
    iget-object v0, p0, Ll/isu;->u:Lv/VText;

    .line 101
    .line 102
    new-instance v1, Ll/gsu;

    .line 103
    .line 104
    invoke-direct {v1, p0}, Ll/gsu;-><init>(Ll/isu;)V

    .line 105
    .line 106
    .line 107
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 108
    .line 109
    .line 110
    iget-object v0, p0, Ll/isu;->w:Lcom/google/android/material/bottomsheet/BottomSheetDialog;

    .line 111
    .line 112
    new-instance v1, Ll/hsu;

    .line 113
    .line 114
    invoke-direct {v1, p0}, Ll/hsu;-><init>(Ll/isu;)V

    .line 115
    .line 116
    .line 117
    invoke-virtual {v0, v1}, Landroid/app/Dialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 118
    .line 119
    .line 120
    iget-object p0, p0, Ll/isu;->w:Lcom/google/android/material/bottomsheet/BottomSheetDialog;

    .line 121
    .line 122
    invoke-virtual {p0}, Landroid/app/Dialog;->show()V

    .line 123
    .line 124
    .line 125
    return-void
.end method

.method public D()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/isu;->u:Lv/VText;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-virtual {v0, v1}, Landroid/view/View;->setEnabled(Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Ll/isu;->q:Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatPayItemView;

    .line 8
    .line 9
    sget-object v2, Ll/zrv;->a:Ll/wrv;

    .line 10
    .line 11
    invoke-virtual {v2}, Ll/wrv;->i()Lcom/p1/mobile/putong/data/PayMethod;

    .line 12
    .line 13
    .line 14
    move-result-object v2

    .line 15
    invoke-virtual {v0, v2}, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatPayItemView;->k0(Lcom/p1/mobile/putong/data/PayMethod;)V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Ll/isu;->q:Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatPayItemView;

    .line 19
    .line 20
    new-instance v2, Ll/wru;

    .line 21
    .line 22
    invoke-direct {v2, p0}, Ll/wru;-><init>(Ll/isu;)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {v0, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 26
    .line 27
    .line 28
    iget-object v0, p0, Ll/isu;->r:Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatPayItemView;

    .line 29
    .line 30
    sget-object v2, Ll/zrv;->a:Ll/wrv;

    .line 31
    .line 32
    invoke-virtual {v2}, Ll/wrv;->k()Lcom/p1/mobile/putong/data/PayMethod;

    .line 33
    .line 34
    .line 35
    move-result-object v2

    .line 36
    invoke-virtual {v0, v2}, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatPayItemView;->k0(Lcom/p1/mobile/putong/data/PayMethod;)V

    .line 37
    .line 38
    .line 39
    iget-object v0, p0, Ll/isu;->r:Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatPayItemView;

    .line 40
    .line 41
    new-instance v2, Ll/wru;

    .line 42
    .line 43
    invoke-direct {v2, p0}, Ll/wru;-><init>(Ll/isu;)V

    .line 44
    .line 45
    .line 46
    invoke-virtual {v0, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 47
    .line 48
    .line 49
    sget-object v0, Ll/zrv;->a:Ll/wrv;

    .line 50
    .line 51
    invoke-virtual {v0}, Ll/wrv;->l0()Z

    .line 52
    .line 53
    .line 54
    move-result v0

    .line 55
    if-eqz v0, :cond_0

    .line 56
    .line 57
    const/4 v0, 0x0

    .line 58
    invoke-virtual {p0, v0}, Ll/isu;->z(Z)V

    .line 59
    .line 60
    .line 61
    iget-object v0, p0, Ll/isu;->s:Lv/VText;

    .line 62
    .line 63
    new-instance v1, Ll/xru;

    .line 64
    .line 65
    invoke-direct {v1, p0}, Ll/xru;-><init>(Ll/isu;)V

    .line 66
    .line 67
    .line 68
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 69
    .line 70
    .line 71
    goto :goto_0

    .line 72
    :cond_0
    invoke-virtual {p0, v1}, Ll/isu;->z(Z)V

    .line 73
    .line 74
    .line 75
    :goto_0
    invoke-virtual {p0}, Ll/isu;->a0()V

    .line 76
    .line 77
    .line 78
    return-void
.end method

.method public final E(DZ)V
    .locals 2

    .line 1
    if-eqz p3, :cond_0

    .line 2
    .line 3
    iget-object p1, p0, Ll/isu;->n:Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatRechargeItemView;

    .line 4
    .line 5
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatRechargeItemView;->getCurrentRechargeModule()Lcom/p1/mobile/putong/live/base/data/BLiveMerchandise;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    iput-object p1, p0, Ll/isu;->L:Lcom/p1/mobile/putong/live/base/data/BLiveMerchandise;

    .line 10
    .line 11
    iget-object p2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMerchandise;->defaultStockKeepUnit:Lcom/p1/mobile/putong/live/base/data/BLiveStockKeepUnit;

    .line 12
    .line 13
    iget-object p3, p2, Lcom/p1/mobile/putong/live/base/data/BLiveStockKeepUnit;->id:Ljava/lang/String;

    .line 14
    .line 15
    iput-object p3, p0, Ll/isu;->F:Ljava/lang/String;

    .line 16
    .line 17
    iget p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMerchandise;->quantity:I

    .line 18
    .line 19
    iput p1, p0, Ll/isu;->J:I

    .line 20
    .line 21
    iget-object p2, p2, Lcom/p1/mobile/putong/live/base/data/BLiveStockKeepUnit;->prices:Lcom/p1/mobile/putong/live/base/data/BLivePrices;

    .line 22
    .line 23
    iget-wide p2, p2, Lcom/p1/mobile/putong/live/base/data/BLivePrices;->price:D

    .line 24
    .line 25
    double-to-int v0, p2

    .line 26
    iput v0, p0, Ll/isu;->G:I

    .line 27
    .line 28
    iput-wide p2, p0, Ll/isu;->H:D

    .line 29
    .line 30
    iput p1, p0, Ll/isu;->I:I

    .line 31
    .line 32
    iget-object p1, p0, Ll/isu;->n:Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatRechargeItemView;

    .line 33
    .line 34
    invoke-virtual {p0, p1}, Ll/isu;->k0(Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatRechargeItemView;)V

    .line 35
    .line 36
    .line 37
    return-void

    .line 38
    :cond_0
    const-wide/16 v0, 0x0

    .line 39
    .line 40
    cmpl-double p3, p1, v0

    .line 41
    .line 42
    if-nez p3, :cond_1

    .line 43
    .line 44
    iget-object p0, p0, Ll/isu;->j:Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatRechargeItemView;

    .line 45
    .line 46
    invoke-virtual {p0}, Landroid/view/View;->performClick()Z

    .line 47
    .line 48
    .line 49
    return-void

    .line 50
    :cond_1
    iget-object p3, p0, Ll/isu;->x:Ljava/util/ArrayList;

    .line 51
    .line 52
    new-instance v0, Ll/dsu;

    .line 53
    .line 54
    invoke-direct {v0, p0, p1, p2}, Ll/dsu;-><init>(Ll/isu;D)V

    .line 55
    .line 56
    .line 57
    invoke-static {p3, v0}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 58
    .line 59
    .line 60
    move-result-object p1

    .line 61
    check-cast p1, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatRechargeItemView;

    .line 62
    .line 63
    if-eqz p1, :cond_2

    .line 64
    .line 65
    invoke-virtual {p1}, Landroid/view/View;->performClick()Z

    .line 66
    .line 67
    .line 68
    return-void

    .line 69
    :cond_2
    iget-object p1, p0, Ll/isu;->x:Ljava/util/ArrayList;

    .line 70
    .line 71
    const/4 p2, 0x0

    .line 72
    invoke-virtual {p1, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 73
    .line 74
    .line 75
    move-result-object p1

    .line 76
    check-cast p1, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatRechargeItemView;

    .line 77
    .line 78
    iget-object p2, p0, Ll/isu;->x:Ljava/util/ArrayList;

    .line 79
    .line 80
    invoke-virtual {p2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 81
    .line 82
    .line 83
    move-result-object p2

    .line 84
    :cond_3
    :goto_0
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    .line 85
    .line 86
    .line 87
    move-result p3

    .line 88
    if-eqz p3, :cond_4

    .line 89
    .line 90
    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 91
    .line 92
    .line 93
    move-result-object p3

    .line 94
    check-cast p3, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatRechargeItemView;

    .line 95
    .line 96
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatRechargeItemView;->getTTPrice()I

    .line 97
    .line 98
    .line 99
    move-result v0

    .line 100
    int-to-double v0, v0

    .line 101
    invoke-virtual {p0, p3, v0, v1}, Ll/isu;->H(Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatRechargeItemView;D)Z

    .line 102
    .line 103
    .line 104
    move-result v0

    .line 105
    if-eqz v0, :cond_3

    .line 106
    .line 107
    move-object p1, p3

    .line 108
    goto :goto_0

    .line 109
    :cond_4
    invoke-virtual {p1}, Landroid/view/View;->performClick()Z

    .line 110
    .line 111
    .line 112
    return-void
.end method

.method public final F(Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatRechargeItemView;)Z
    .locals 0

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatRechargeItemView;->getCurrentRechargeModule()Lcom/p1/mobile/putong/live/base/data/BLiveMerchandise;

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

.method public G()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/isu;->v:Lcom/p1/mobile/android/app/Act;

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

.method public final H(Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatRechargeItemView;D)Z
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/isu;->F(Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatRechargeItemView;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-nez p0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatRechargeItemView;->getTTPrice()I

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

.method public final synthetic I(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/isu;->w:Lcom/google/android/material/bottomsheet/BottomSheetDialog;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/app/Dialog;->dismiss()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic J(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/isu;->l0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic K(Landroid/content/DialogInterface;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/isu;->G()Z

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
    iget-object p1, p0, Ll/isu;->C:Ll/x20;

    .line 9
    .line 10
    if-eqz p1, :cond_1

    .line 11
    .line 12
    invoke-interface {p1}, Ll/x20;->call()V

    .line 13
    .line 14
    .line 15
    const-string p1, "videoChat"

    .line 16
    .line 17
    const-string v0, "action:onCancel"

    .line 18
    .line 19
    invoke-static {p1, v0}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    :cond_1
    invoke-virtual {p0}, Ll/isu;->Z()V

    .line 23
    .line 24
    .line 25
    invoke-virtual {p0}, Ll/isu;->y()V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public final synthetic L(Landroid/view/View;)V
    .locals 0

    .line 1
    const/4 p1, 0x1

    .line 2
    invoke-virtual {p0, p1}, Ll/isu;->z(Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public final synthetic M(DLcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatRechargeItemView;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p3, p1, p2}, Ll/isu;->H(Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatRechargeItemView;D)Z

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

.method public final synthetic N(Lcom/p1/mobile/putong/live/base/data/BLiveMerchandise;Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatRechargeItemView;)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/isu;->G()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    iget-boolean v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMerchandise;->isCustomRecharge:Z

    .line 9
    .line 10
    if-eqz v0, :cond_1

    .line 11
    .line 12
    invoke-virtual {p0}, Ll/isu;->h0()V

    .line 13
    .line 14
    .line 15
    return-void

    .line 16
    :cond_1
    iput-object p1, p0, Ll/isu;->L:Lcom/p1/mobile/putong/live/base/data/BLiveMerchandise;

    .line 17
    .line 18
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMerchandise;->defaultStockKeepUnit:Lcom/p1/mobile/putong/live/base/data/BLiveStockKeepUnit;

    .line 19
    .line 20
    iget-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveStockKeepUnit;->id:Ljava/lang/String;

    .line 21
    .line 22
    iput-object v1, p0, Ll/isu;->F:Ljava/lang/String;

    .line 23
    .line 24
    iget-boolean v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMerchandise;->isIncomingPrice:Z

    .line 25
    .line 26
    if-eqz v1, :cond_2

    .line 27
    .line 28
    iget v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMerchandise;->quantity:I

    .line 29
    .line 30
    iput v1, p0, Ll/isu;->J:I

    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_2
    iget-boolean v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMerchandise;->isOneRMBRecharge:Z

    .line 34
    .line 35
    if-eqz v1, :cond_3

    .line 36
    .line 37
    iget v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMerchandise;->quantity:I

    .line 38
    .line 39
    iput v1, p0, Ll/isu;->J:I

    .line 40
    .line 41
    goto :goto_0

    .line 42
    :cond_3
    const/4 v1, 0x0

    .line 43
    iput v1, p0, Ll/isu;->J:I

    .line 44
    .line 45
    :goto_0
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveStockKeepUnit;->prices:Lcom/p1/mobile/putong/live/base/data/BLivePrices;

    .line 46
    .line 47
    iget-wide v0, v0, Lcom/p1/mobile/putong/live/base/data/BLivePrices;->price:D

    .line 48
    .line 49
    double-to-int v2, v0

    .line 50
    iput v2, p0, Ll/isu;->G:I

    .line 51
    .line 52
    iput-wide v0, p0, Ll/isu;->H:D

    .line 53
    .line 54
    iget p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMerchandise;->quantity:I

    .line 55
    .line 56
    iput p1, p0, Ll/isu;->I:I

    .line 57
    .line 58
    invoke-virtual {p0, p2}, Ll/isu;->k0(Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatRechargeItemView;)V

    .line 59
    .line 60
    .line 61
    return-void
.end method

.method public final synthetic O()V
    .locals 1

    .line 1
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->qe:I

    .line 2
    .line 3
    invoke-static {v0}, Ll/o1j0;->w(I)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/isu;->D:Ll/x20;

    .line 7
    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    invoke-interface {v0}, Ll/x20;->call()V

    .line 11
    .line 12
    .line 13
    :cond_0
    iget-object p0, p0, Ll/isu;->w:Lcom/google/android/material/bottomsheet/BottomSheetDialog;

    .line 14
    .line 15
    if-eqz p0, :cond_1

    .line 16
    .line 17
    invoke-virtual {p0}, Landroid/app/Dialog;->dismiss()V

    .line 18
    .line 19
    .line 20
    :cond_1
    const-string p0, "videoChat"

    .line 21
    .line 22
    const-string v0, "action:onPaySuccess"

    .line 23
    .line 24
    invoke-static {p0, v0}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public final synthetic P()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/isu;->E:Ll/x20;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-interface {v0}, Ll/x20;->call()V

    .line 6
    .line 7
    .line 8
    :cond_0
    invoke-virtual {p0}, Ll/isu;->a0()V

    .line 9
    .line 10
    .line 11
    iget-boolean v0, p0, Ll/isu;->z:Z

    .line 12
    .line 13
    if-eqz v0, :cond_1

    .line 14
    .line 15
    const/4 v0, 0x1

    .line 16
    invoke-virtual {p0, v0}, Ll/isu;->z(Z)V

    .line 17
    .line 18
    .line 19
    :cond_1
    sget p0, Lcom/p1/mobile/putong/live/livingroom/R$string;->oe:I

    .line 20
    .line 21
    invoke-static {p0}, Ll/o1j0;->h(I)V

    .line 22
    .line 23
    .line 24
    const-string p0, "videoChat"

    .line 25
    .line 26
    const-string v0, "action:onPayFail"

    .line 27
    .line 28
    invoke-static {p0, v0}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public final synthetic Q()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/isu;->d:Lv/VEditText;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/View;->requestFocus()Z

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/isu;->v:Lcom/p1/mobile/android/app/Act;

    .line 7
    .line 8
    iget-object p0, p0, Ll/isu;->d:Lv/VEditText;

    .line 9
    .line 10
    const/4 v1, 0x0

    .line 11
    invoke-virtual {v0, p0, v1}, Lcom/p1/mobile/android/app/Act;->showInput(Landroid/view/View;I)Z

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public final synthetic R(Landroid/content/DialogInterface;)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/isu;->G()Z

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
    iget-object p1, p0, Ll/isu;->d:Lv/VEditText;

    .line 9
    .line 10
    const-string v0, ""

    .line 11
    .line 12
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 13
    .line 14
    .line 15
    iget-object p1, p0, Ll/isu;->v:Lcom/p1/mobile/android/app/Act;

    .line 16
    .line 17
    new-instance v0, Ll/uru;

    .line 18
    .line 19
    invoke-direct {v0, p0}, Ll/uru;-><init>(Ll/isu;)V

    .line 20
    .line 21
    .line 22
    const-wide/16 v1, 0x64

    .line 23
    .line 24
    invoke-virtual {p1, v0, v1, v2}, Lcom/p1/mobile/android/app/Act;->postDelayed(Ljava/lang/Runnable;J)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public final synthetic S(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/isu;->y()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic T(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/isu;->x()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic U(DLjava/util/List;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/isu;->w:Lcom/google/android/material/bottomsheet/BottomSheetDialog;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/app/Dialog;->show()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, p3}, Ll/isu;->Y(Ljava/util/List;)V

    .line 7
    .line 8
    .line 9
    invoke-interface {p3}, Ljava/util/List;->size()I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    const/4 v1, 0x6

    .line 14
    if-ne v0, v1, :cond_0

    .line 15
    .line 16
    iget v0, p0, Ll/isu;->N:I

    .line 17
    .line 18
    if-lez v0, :cond_0

    .line 19
    .line 20
    const/4 v0, 0x1

    .line 21
    goto :goto_0

    .line 22
    :cond_0
    const/4 v0, 0x0

    .line 23
    :goto_0
    invoke-virtual {p0, p1, p2, v0}, Ll/isu;->E(DZ)V

    .line 24
    .line 25
    .line 26
    iget-boolean p0, p0, Ll/isu;->z:Z

    .line 27
    .line 28
    const-string p1, "-1"

    .line 29
    .line 30
    invoke-static {p3, p0, p1}, Ll/btu;->l(Ljava/util/List;ZLjava/lang/String;)V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method public final synthetic V(Lcom/p1/mobile/putong/live/base/data/BLiveCoin;)V
    .locals 4

    .line 1
    iget-object p0, p0, Ll/isu;->i:Lv/VText;

    .line 2
    .line 3
    sget-object v0, Ll/zrv;->e:Landroid/app/Application;

    .line 4
    .line 5
    sget v1, Lcom/p1/mobile/putong/live/livingroom/R$string;->T6:I

    .line 6
    .line 7
    iget-wide v2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveCoin;->available:J

    .line 8
    .line 9
    invoke-static {v2, v3}, Ll/aiv;->r0(J)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    filled-new-array {p1}, [Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    invoke-virtual {v0, v1, p1}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public W(Ll/isu$d;)V
    .locals 6

    .line 1
    invoke-virtual {p0, p1}, Ll/isu;->B(Ll/isu$d;)Lcom/p1/mobile/putong/data/PurchasePaymentParam;

    .line 2
    .line 3
    .line 4
    move-result-object v2

    .line 5
    sget-object v0, Ll/zrv;->a:Ll/wrv;

    .line 6
    .line 7
    iget-object v1, p0, Ll/isu;->v:Lcom/p1/mobile/android/app/Act;

    .line 8
    .line 9
    new-instance v3, Ll/rru;

    .line 10
    .line 11
    invoke-direct {v3, p0}, Ll/rru;-><init>(Ll/isu;)V

    .line 12
    .line 13
    .line 14
    new-instance v4, Ll/sru;

    .line 15
    .line 16
    invoke-direct {v4, p0}, Ll/sru;-><init>(Ll/isu;)V

    .line 17
    .line 18
    .line 19
    iget-object v5, p1, Ll/isu$d;->f:Lcom/p1/mobile/putong/data/PayMethod;

    .line 20
    .line 21
    invoke-virtual/range {v0 .. v5}, Ll/wrv;->Z(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/PurchasePaymentParam;Ll/x20;Ll/x20;Lcom/p1/mobile/putong/data/PayMethod;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public X(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/isu;->q:Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatPayItemView;

    .line 2
    .line 3
    if-ne p1, v0, :cond_0

    .line 4
    .line 5
    sget-object p1, Ll/zrv;->a:Ll/wrv;

    .line 6
    .line 7
    invoke-virtual {p1}, Ll/wrv;->i()Lcom/p1/mobile/putong/data/PayMethod;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    iput-object p1, p0, Ll/isu;->K:Lcom/p1/mobile/putong/data/PayMethod;

    .line 12
    .line 13
    iget-object p1, p0, Ll/isu;->q:Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatPayItemView;

    .line 14
    .line 15
    invoke-virtual {p0, p1}, Ll/isu;->b0(Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatPayItemView;)V

    .line 16
    .line 17
    .line 18
    return-void

    .line 19
    :cond_0
    iget-object v0, p0, Ll/isu;->r:Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatPayItemView;

    .line 20
    .line 21
    if-ne p1, v0, :cond_1

    .line 22
    .line 23
    sget-object p1, Ll/zrv;->a:Ll/wrv;

    .line 24
    .line 25
    invoke-virtual {p1}, Ll/wrv;->k()Lcom/p1/mobile/putong/data/PayMethod;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    iput-object p1, p0, Ll/isu;->K:Lcom/p1/mobile/putong/data/PayMethod;

    .line 30
    .line 31
    iget-object p1, p0, Ll/isu;->r:Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatPayItemView;

    .line 32
    .line 33
    invoke-virtual {p0, p1}, Ll/isu;->b0(Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatPayItemView;)V

    .line 34
    .line 35
    .line 36
    :cond_1
    return-void
.end method

.method public Y(Ljava/util/List;)V
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
    iget-object v1, p0, Ll/isu;->x:Ljava/util/ArrayList;

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
    iget-object v1, p0, Ll/isu;->x:Ljava/util/ArrayList;

    .line 11
    .line 12
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    check-cast v1, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatRechargeItemView;

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
    iget-object v3, p0, Ll/isu;->O:Ll/z20;

    .line 31
    .line 32
    invoke-virtual {v1, v2, v3}, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatRechargeItemView;->o0(Lcom/p1/mobile/putong/live/base/data/BLiveMerchandise;Ll/z20;)V

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

.method public final Z()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/isu;->x:Ljava/util/ArrayList;

    .line 2
    .line 3
    new-instance v1, Ll/vru;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/vru;-><init>(Ll/isu;)V

    .line 6
    .line 7
    .line 8
    invoke-static {v0, v1}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    check-cast v0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatRechargeItemView;

    .line 13
    .line 14
    if-nez v0, :cond_0

    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_0
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatRechargeItemView;->getCurrentRechargeModule()Lcom/p1/mobile/putong/live/base/data/BLiveMerchandise;

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
    iget-object p0, p0, Ll/isu;->O:Ll/z20;

    .line 27
    .line 28
    invoke-virtual {v0, v1, p0}, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatRechargeItemView;->o0(Lcom/p1/mobile/putong/live/base/data/BLiveMerchandise;Ll/z20;)V

    .line 29
    .line 30
    .line 31
    :cond_1
    :goto_0
    return-void
.end method

.method public a0()V
    .locals 1

    .line 1
    sget-object v0, Ll/zrv;->a:Ll/wrv;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/wrv;->J()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/isu;->q:Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatPayItemView;

    .line 10
    .line 11
    invoke-virtual {p0}, Landroid/view/View;->performClick()Z

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public final b0(Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatPayItemView;)V
    .locals 1
    .param p1    # Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatPayItemView;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    iget-object v0, p0, Ll/isu;->q:Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatPayItemView;

    .line 2
    .line 3
    iget-object p0, p0, Ll/isu;->r:Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatPayItemView;

    .line 4
    .line 5
    filled-new-array {v0, p0}, [Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatPayItemView;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-static {p0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    new-instance v0, Ll/zru;

    .line 14
    .line 15
    invoke-direct {v0, p1}, Ll/zru;-><init>(Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatPayItemView;)V

    .line 16
    .line 17
    .line 18
    invoke-static {p0, v0}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public c0(I)V
    .locals 0

    .line 1
    iput p1, p0, Ll/isu;->N:I

    .line 2
    .line 3
    return-void
.end method

.method public d0(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/isu;->M:Z

    .line 2
    .line 3
    return-void
.end method

.method public e0(Ll/x20;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/isu;->C:Ll/x20;

    .line 2
    .line 3
    return-void
.end method

.method public f0(Ll/x20;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/isu;->E:Ll/x20;

    .line 2
    .line 3
    return-void
.end method

.method public g0(Ll/x20;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/isu;->D:Ll/x20;

    .line 2
    .line 3
    return-void
.end method

.method public final h0()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/isu;->y:Lcom/google/android/material/bottomsheet/BottomSheetDialog;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Lcom/google/android/material/bottomsheet/BottomSheetDialog;

    .line 6
    .line 7
    iget-object v1, p0, Ll/isu;->v:Lcom/p1/mobile/android/app/Act;

    .line 8
    .line 9
    sget v2, Ll/hgc0;->d:I

    .line 10
    .line 11
    invoke-direct {v0, v1, v2}, Lcom/google/android/material/bottomsheet/BottomSheetDialog;-><init>(Landroid/content/Context;I)V

    .line 12
    .line 13
    .line 14
    iput-object v0, p0, Ll/isu;->y:Lcom/google/android/material/bottomsheet/BottomSheetDialog;

    .line 15
    .line 16
    iget-object v0, p0, Ll/isu;->v:Lcom/p1/mobile/android/app/Act;

    .line 17
    .line 18
    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    sget v1, Ll/xec0;->G1:I

    .line 23
    .line 24
    const/4 v2, 0x0

    .line 25
    invoke-virtual {v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-virtual {p0, v0}, Ll/isu;->v(Landroid/view/View;)V

    .line 30
    .line 31
    .line 32
    iget-object v1, p0, Ll/isu;->y:Lcom/google/android/material/bottomsheet/BottomSheetDialog;

    .line 33
    .line 34
    invoke-virtual {v1}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    invoke-virtual {v1}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    invoke-static {}, Ll/bnl0;->y0()I

    .line 43
    .line 44
    .line 45
    move-result v2

    .line 46
    invoke-virtual {v1, v2}, Landroid/view/View;->setMinimumWidth(I)V

    .line 47
    .line 48
    .line 49
    iget-object v1, p0, Ll/isu;->y:Lcom/google/android/material/bottomsheet/BottomSheetDialog;

    .line 50
    .line 51
    invoke-virtual {v1}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    .line 52
    .line 53
    .line 54
    move-result-object v1

    .line 55
    invoke-virtual {v1}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 56
    .line 57
    .line 58
    move-result-object v1

    .line 59
    invoke-static {}, Ll/bnl0;->w0()I

    .line 60
    .line 61
    .line 62
    move-result v2

    .line 63
    invoke-virtual {v1, v2}, Landroid/view/View;->setMinimumHeight(I)V

    .line 64
    .line 65
    .line 66
    iget-object v1, p0, Ll/isu;->y:Lcom/google/android/material/bottomsheet/BottomSheetDialog;

    .line 67
    .line 68
    invoke-virtual {v1, v0}, Lcom/google/android/material/bottomsheet/BottomSheetDialog;->setContentView(Landroid/view/View;)V

    .line 69
    .line 70
    .line 71
    iget-object v0, p0, Ll/isu;->y:Lcom/google/android/material/bottomsheet/BottomSheetDialog;

    .line 72
    .line 73
    new-instance v1, Ll/oru;

    .line 74
    .line 75
    invoke-direct {v1, p0}, Ll/oru;-><init>(Ll/isu;)V

    .line 76
    .line 77
    .line 78
    invoke-virtual {v0, v1}, Landroid/app/Dialog;->setOnShowListener(Landroid/content/DialogInterface$OnShowListener;)V

    .line 79
    .line 80
    .line 81
    iget-object v0, p0, Ll/isu;->b:Landroid/view/View;

    .line 82
    .line 83
    new-instance v1, Ll/pru;

    .line 84
    .line 85
    invoke-direct {v1, p0}, Ll/pru;-><init>(Ll/isu;)V

    .line 86
    .line 87
    .line 88
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 89
    .line 90
    .line 91
    iget-object v0, p0, Ll/isu;->d:Lv/VEditText;

    .line 92
    .line 93
    invoke-virtual {p0}, Ll/isu;->j0()Ll/jri0;

    .line 94
    .line 95
    .line 96
    move-result-object v1

    .line 97
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 98
    .line 99
    .line 100
    iget-object v0, p0, Ll/isu;->e:Lv/VText;

    .line 101
    .line 102
    new-instance v1, Ll/qru;

    .line 103
    .line 104
    invoke-direct {v1, p0}, Ll/qru;-><init>(Ll/isu;)V

    .line 105
    .line 106
    .line 107
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 108
    .line 109
    .line 110
    :cond_0
    iget-object p0, p0, Ll/isu;->y:Lcom/google/android/material/bottomsheet/BottomSheetDialog;

    .line 111
    .line 112
    invoke-virtual {p0}, Landroid/app/Dialog;->show()V

    .line 113
    .line 114
    .line 115
    const-string p0, "videoChat"

    .line 116
    .line 117
    const-string v0, "show:inputDialog"

    .line 118
    .line 119
    invoke-static {p0, v0}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 120
    .line 121
    .line 122
    return-void
.end method

.method public i0(D)V
    .locals 4

    .line 1
    invoke-virtual {p0}, Ll/isu;->G()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    iget-object v0, p0, Ll/isu;->h:Lv/VText;

    .line 9
    .line 10
    iget-boolean v1, p0, Ll/isu;->M:Z

    .line 11
    .line 12
    if-eqz v1, :cond_1

    .line 13
    .line 14
    sget v1, Lcom/p1/mobile/putong/live/external/R$string;->j:I

    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_1
    sget v1, Lcom/p1/mobile/putong/live/external/R$string;->p:I

    .line 18
    .line 19
    :goto_0
    invoke-static {v1}, Ll/xau;->t(I)Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, Ll/isu;->v:Lcom/p1/mobile/android/app/Act;

    .line 27
    .line 28
    invoke-static {}, Lcom/p1/mobile/putong/live/external/internal/vchat/a;->j()Lrx/c;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    invoke-static {}, Lcom/p1/mobile/putong/live/external/internal/vchat/a;->k()Lrx/c;

    .line 33
    .line 34
    .line 35
    move-result-object v2

    .line 36
    new-instance v3, Ll/yru;

    .line 37
    .line 38
    invoke-direct {v3, p0}, Ll/yru;-><init>(Ll/isu;)V

    .line 39
    .line 40
    .line 41
    invoke-static {v1, v2, v3}, Lrx/c;->zip(Lrx/c;Lrx/c;Ll/rcj;)Lrx/c;

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 46
    .line 47
    .line 48
    move-result-object v2

    .line 49
    invoke-virtual {v1, v2}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 50
    .line 51
    .line 52
    move-result-object v1

    .line 53
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    const/4 v1, 0x1

    .line 58
    invoke-virtual {v0, v1}, Lrx/c;->take(I)Lrx/c;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    new-instance v1, Ll/isu$a;

    .line 63
    .line 64
    invoke-direct {v1, p0}, Ll/isu$a;-><init>(Ll/isu;)V

    .line 65
    .line 66
    .line 67
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    new-instance v1, Ll/asu;

    .line 72
    .line 73
    invoke-direct {v1, p0, p1, p2}, Ll/asu;-><init>(Ll/isu;D)V

    .line 74
    .line 75
    .line 76
    new-instance p1, Ll/bsu;

    .line 77
    .line 78
    invoke-direct {p1}, Ll/bsu;-><init>()V

    .line 79
    .line 80
    .line 81
    invoke-static {v1, p1}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 82
    .line 83
    .line 84
    move-result-object p1

    .line 85
    invoke-virtual {v0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 86
    .line 87
    .line 88
    iget-object p1, p0, Ll/isu;->v:Lcom/p1/mobile/android/app/Act;

    .line 89
    .line 90
    invoke-static {}, Lcom/p1/mobile/putong/live/external/internal/vchat/a;->l()Lrx/c;

    .line 91
    .line 92
    .line 93
    move-result-object p2

    .line 94
    invoke-virtual {p1, p2}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 95
    .line 96
    .line 97
    move-result-object p1

    .line 98
    new-instance p2, Ll/csu;

    .line 99
    .line 100
    invoke-direct {p2, p0}, Ll/csu;-><init>(Ll/isu;)V

    .line 101
    .line 102
    .line 103
    invoke-static {p2}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 104
    .line 105
    .line 106
    move-result-object p0

    .line 107
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 108
    .line 109
    .line 110
    return-void
.end method

.method public final j0()Ll/jri0;
    .locals 1
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    new-instance v0, Ll/isu$b;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/isu$b;-><init>(Ll/isu;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public k0(Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatRechargeItemView;)V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatRechargeItemView;->m0(Z)V

    .line 3
    .line 4
    .line 5
    iget-object p0, p0, Ll/isu;->x:Ljava/util/ArrayList;

    .line 6
    .line 7
    new-instance v0, Ll/esu;

    .line 8
    .line 9
    invoke-direct {v0, p1}, Ll/esu;-><init>(Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatRechargeItemView;)V

    .line 10
    .line 11
    .line 12
    invoke-static {p0, v0}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public final l0()V
    .locals 4

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "action:tryToStartPay,selectedItemPrice:"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget v1, p0, Ll/isu;->G:I

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v1, ",payMethod:"

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    iget-object v1, p0, Ll/isu;->K:Lcom/p1/mobile/putong/data/PayMethod;

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    const-string v1, "videoChat"

    .line 28
    .line 29
    invoke-static {v1, v0}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    iget-object v0, p0, Ll/isu;->F:Ljava/lang/String;

    .line 33
    .line 34
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 35
    .line 36
    .line 37
    move-result v0

    .line 38
    if-nez v0, :cond_2

    .line 39
    .line 40
    sget-object v0, Ll/zrv;->a:Ll/wrv;

    .line 41
    .line 42
    invoke-virtual {v0}, Ll/wrv;->H()Z

    .line 43
    .line 44
    .line 45
    move-result v0

    .line 46
    if-nez v0, :cond_0

    .line 47
    .line 48
    iget v0, p0, Ll/isu;->G:I

    .line 49
    .line 50
    if-eqz v0, :cond_2

    .line 51
    .line 52
    :cond_0
    sget-object v0, Ll/zrv;->a:Ll/wrv;

    .line 53
    .line 54
    invoke-virtual {v0}, Ll/wrv;->H()Z

    .line 55
    .line 56
    .line 57
    move-result v0

    .line 58
    if-eqz v0, :cond_1

    .line 59
    .line 60
    iget-wide v0, p0, Ll/isu;->H:D

    .line 61
    .line 62
    const-wide/16 v2, 0x0

    .line 63
    .line 64
    cmpl-double v0, v0, v2

    .line 65
    .line 66
    if-nez v0, :cond_1

    .line 67
    .line 68
    goto :goto_0

    .line 69
    :cond_1
    new-instance v0, Ll/isu$d;

    .line 70
    .line 71
    invoke-direct {v0}, Ll/isu$d;-><init>()V

    .line 72
    .line 73
    .line 74
    iget-object v1, p0, Ll/isu;->F:Ljava/lang/String;

    .line 75
    .line 76
    iput-object v1, v0, Ll/isu$d;->a:Ljava/lang/String;

    .line 77
    .line 78
    iget v1, p0, Ll/isu;->G:I

    .line 79
    .line 80
    iput v1, v0, Ll/isu$d;->b:I

    .line 81
    .line 82
    iget v1, p0, Ll/isu;->J:I

    .line 83
    .line 84
    iput v1, v0, Ll/isu$d;->c:I

    .line 85
    .line 86
    iget v1, p0, Ll/isu;->I:I

    .line 87
    .line 88
    iput v1, v0, Ll/isu$d;->d:I

    .line 89
    .line 90
    iget-object v1, p0, Ll/isu;->L:Lcom/p1/mobile/putong/live/base/data/BLiveMerchandise;

    .line 91
    .line 92
    iput-object v1, v0, Ll/isu$d;->e:Lcom/p1/mobile/putong/live/base/data/BLiveMerchandise;

    .line 93
    .line 94
    iget-object v1, p0, Ll/isu;->K:Lcom/p1/mobile/putong/data/PayMethod;

    .line 95
    .line 96
    iput-object v1, v0, Ll/isu$d;->f:Lcom/p1/mobile/putong/data/PayMethod;

    .line 97
    .line 98
    invoke-virtual {p0, v0}, Ll/isu;->W(Ll/isu$d;)V

    .line 99
    .line 100
    .line 101
    :cond_2
    :goto_0
    return-void
.end method

.method public final u(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/jsu;->a(Ll/isu;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final v(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/ksu;->a(Ll/isu;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public w(Ljava/util/List;Lcom/p1/mobile/putong/live/base/data/BLiveMerchandise;)Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveMerchandise;",
            ">;",
            "Lcom/p1/mobile/putong/live/base/data/BLiveMerchandise;",
            ")",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveMerchandise;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iput-object p1, p0, Ll/isu;->A:Ljava/util/List;

    .line 2
    .line 3
    iput-object p2, p0, Ll/isu;->B:Lcom/p1/mobile/putong/live/base/data/BLiveMerchandise;

    .line 4
    .line 5
    new-instance p0, Ljava/util/ArrayList;

    .line 6
    .line 7
    invoke-direct {p0, p1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 8
    .line 9
    .line 10
    invoke-static {p0, p2}, Lcom/p1/mobile/putong/live/external/internal/vchat/a;->i(Ljava/util/List;Lcom/p1/mobile/putong/live/base/data/BLiveMerchandise;)Ljava/util/List;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    return-object p0
.end method

.method public final x()V
    .locals 6

    .line 1
    invoke-virtual {p0}, Ll/isu;->A()Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatRechargeItemView;

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
    invoke-virtual {p0}, Ll/isu;->y()V

    .line 19
    .line 20
    .line 21
    return-void

    .line 22
    :cond_0
    :try_start_0
    iget-object v1, p0, Ll/isu;->d:Lv/VEditText;

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
    invoke-virtual {p0}, Ll/isu;->y()V

    .line 46
    .line 47
    .line 48
    invoke-virtual {p0, v0}, Ll/isu;->k0(Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatRechargeItemView;)V

    .line 49
    .line 50
    .line 51
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatRechargeItemView;->getCurrentRechargeModule()Lcom/p1/mobile/putong/live/base/data/BLiveMerchandise;

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
    iput-object v4, p0, Ll/isu;->F:Ljava/lang/String;

    .line 60
    .line 61
    mul-int/lit8 v4, v1, 0xa

    .line 62
    .line 63
    iput v4, p0, Ll/isu;->J:I

    .line 64
    .line 65
    iput v1, p0, Ll/isu;->G:I

    .line 66
    .line 67
    iput v4, p0, Ll/isu;->I:I

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
    iget-object p0, p0, Ll/isu;->O:Ll/z20;

    .line 80
    .line 81
    invoke-virtual {v0, v2, p0}, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatRechargeItemView;->o0(Lcom/p1/mobile/putong/live/base/data/BLiveMerchandise;Ll/z20;)V

    .line 82
    .line 83
    .line 84
    goto :goto_1

    .line 85
    :cond_1
    sget-object p0, Ll/zrv;->e:Landroid/app/Application;

    .line 86
    .line 87
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->I6:I

    .line 88
    .line 89
    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 90
    .line 91
    .line 92
    move-result-object p0

    .line 93
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 94
    .line 95
    .line 96
    :goto_1
    return-void
.end method

.method public y()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/isu;->v:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v1, p0, Ll/isu;->d:Lv/VEditText;

    .line 6
    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->hideInput(Landroid/view/View;)Z

    .line 10
    .line 11
    .line 12
    :cond_0
    iget-object p0, p0, Ll/isu;->y:Lcom/google/android/material/bottomsheet/BottomSheetDialog;

    .line 13
    .line 14
    if-eqz p0, :cond_1

    .line 15
    .line 16
    invoke-virtual {p0}, Landroid/app/Dialog;->dismiss()V

    .line 17
    .line 18
    .line 19
    :cond_1
    return-void
.end method

.method public z(Z)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/isu;->G()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    const/16 v0, 0x8

    .line 9
    .line 10
    const/4 v1, 0x0

    .line 11
    if-eqz p1, :cond_1

    .line 12
    .line 13
    iput-boolean v1, p0, Ll/isu;->z:Z

    .line 14
    .line 15
    iget-object p1, p0, Ll/isu;->s:Lv/VText;

    .line 16
    .line 17
    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 18
    .line 19
    .line 20
    iget-object p0, p0, Ll/isu;->t:Landroidx/constraintlayout/widget/Group;

    .line 21
    .line 22
    invoke-virtual {p0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 23
    .line 24
    .line 25
    return-void

    .line 26
    :cond_1
    iget-object p1, p0, Ll/isu;->s:Lv/VText;

    .line 27
    .line 28
    invoke-virtual {p1, v1}, Landroid/view/View;->setVisibility(I)V

    .line 29
    .line 30
    .line 31
    iget-object p0, p0, Ll/isu;->t:Landroidx/constraintlayout/widget/Group;

    .line 32
    .line 33
    invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V

    .line 34
    .line 35
    .line 36
    return-void
.end method

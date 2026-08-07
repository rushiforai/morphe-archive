.class public Ll/ybh0;
.super Ll/g1e;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/ybh0$b;
    }
.end annotation


# instance fields
.field public A:Lv/VText;

.field public final B:Lcom/p1/mobile/android/app/Act;

.field public C:I

.field public D:Lcom/p1/mobile/putong/data/User;

.field public E:Ll/x20;

.field public j:Lv/VDraweeView;

.field public k:Landroid/widget/FrameLayout;

.field public l:Lv/VDraweeView;

.field public m:Lv/VDraweeView;

.field public n:Lv/VIcon;

.field public o:Lv/VIcon;

.field public p:Lv/VFrame;

.field public q:Lv/VDraweeView;

.field public r:Lv/VImage;

.field public s:Landroid/widget/TextView;

.field public t:Landroid/widget/TextView;

.field public u:Landroid/widget/TextView;

.field public v:Landroid/widget/TextView;

.field public w:Lv/VLinear;

.field public x:Lv/VText;

.field public y:Lv/VText;

.field public z:Lv/VText;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, p1, v0, v0}, Ll/g1e;-><init>(Landroid/content/Context;ZI)V

    .line 3
    .line 4
    .line 5
    invoke-virtual {p0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    invoke-virtual {p0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    sget v1, Ll/dbc0;->zr:I

    .line 20
    .line 21
    invoke-virtual {v0, v1}, Landroid/view/Window;->setBackgroundDrawableResource(I)V

    .line 22
    .line 23
    .line 24
    :cond_0
    check-cast p1, Lcom/p1/mobile/android/app/Act;

    .line 25
    .line 26
    iput-object p1, p0, Ll/ybh0;->B:Lcom/p1/mobile/android/app/Act;

    .line 27
    .line 28
    return-void
.end method

.method private D0(Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/ybh0;->D:Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    return-void
.end method

.method public static synthetic E(Ll/ybh0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ybh0;->r0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic F(Ll/ybh0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ybh0;->o0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic G(Ll/ybh0;Lcom/p1/mobile/putong/core/data/Message;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ybh0;->w0(Lcom/p1/mobile/putong/core/data/Message;)V

    return-void
.end method

.method public static synthetic H(Ll/ybh0;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ybh0;->z0(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic I(Ll/ybh0;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ybh0;->x0(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic J(Ll/ybh0;Lcom/p1/mobile/putong/core/data/Message;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ybh0;->y0(Lcom/p1/mobile/putong/core/data/Message;)V

    return-void
.end method

.method public static synthetic K(Ll/ybh0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ybh0;->t0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic L(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/Relationship;)V
    .locals 0

    .line 1
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/core/api/CoreSuggested;->E8(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public static synthetic M(Ll/ybh0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ybh0;->m0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic N(Ll/ybh0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ybh0;->p0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic O(Ll/ybh0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ybh0;->u0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic P(Ll/ybh0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ybh0;->s0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic Q(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/data/Relationship;)Lrx/c;
    .locals 1

    .line 1
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p2, p2, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    invoke-virtual {p2, p0, p1, v0}, Lcom/p1/mobile/putong/core/api/g;->Dn(Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/core/data/Sticker;)Lrx/c;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method

.method public static synthetic R(Ll/ybh0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ybh0;->n0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic S(Ll/ybh0;Lcom/p1/mobile/putong/data/Relationship;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ybh0;->j0(Lcom/p1/mobile/putong/data/Relationship;)V

    return-void
.end method

.method public static synthetic T(Ll/ybh0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ybh0;->v0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic U(Ll/ybh0;Lcom/p1/mobile/putong/data/Relationship;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ybh0;->k0(Lcom/p1/mobile/putong/data/Relationship;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic V(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    const-string p0, "\u53d1\u9001\u5931\u8d25"

    .line 2
    .line 3
    invoke-static {p0}, Ll/r1j0;->g(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic W(Ll/ybh0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ybh0;->l0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic X(Ll/ybh0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ybh0;->q0(Landroid/view/View;)V

    return-void
.end method

.method public static bridge synthetic Y(Ll/ybh0;)Lcom/p1/mobile/android/app/Act;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ybh0;->B:Lcom/p1/mobile/android/app/Act;

    return-object p0
.end method

.method public static bridge synthetic Z(Ll/ybh0;)Lcom/p1/mobile/putong/data/User;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ybh0;->D:Lcom/p1/mobile/putong/data/User;

    return-object p0
.end method

.method public static bridge synthetic a0(Ll/ybh0;Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ybh0;->D0(Lcom/p1/mobile/putong/data/User;)V

    return-void
.end method

.method private e0()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/ybh0;->r:Lv/VImage;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Ll/ybh0;->w:Lv/VLinear;

    .line 8
    .line 9
    const/4 v2, 0x0

    .line 10
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Ll/ybh0;->p:Lv/VFrame;

    .line 14
    .line 15
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Ll/ybh0;->k:Landroid/widget/FrameLayout;

    .line 19
    .line 20
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Ll/ybh0;->s:Landroid/widget/TextView;

    .line 24
    .line 25
    const-string v2, "\u606d\u559c\u83b7\u5f97\u4f18\u5148\u63a8\u8350\u7279\u6743"

    .line 26
    .line 27
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 28
    .line 29
    .line 30
    iget-object v0, p0, Ll/ybh0;->t:Landroid/widget/TextView;

    .line 31
    .line 32
    const-string v2, "\u606d\u559c\u83b7\u5f97\u914d\u5bf9\u5229\u5668\uff0c30\u5206\u949f\u5185\u4f60\u5c06\u66dd\u5149\u7ed9\u6bd4\u73b0\u5728\u591a10\u500d\u7684\u4eba"

    .line 33
    .line 34
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 35
    .line 36
    .line 37
    iget-object v0, p0, Ll/ybh0;->u:Landroid/widget/TextView;

    .line 38
    .line 39
    const-string v2, "\u786e\u8ba4\u4f7f\u7528"

    .line 40
    .line 41
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 42
    .line 43
    .line 44
    iget-object v0, p0, Ll/ybh0;->v:Landroid/widget/TextView;

    .line 45
    .line 46
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 47
    .line 48
    .line 49
    iget-object v0, p0, Ll/ybh0;->u:Landroid/widget/TextView;

    .line 50
    .line 51
    new-instance v1, Ll/tbh0;

    .line 52
    .line 53
    invoke-direct {v1, p0}, Ll/tbh0;-><init>(Ll/ybh0;)V

    .line 54
    .line 55
    .line 56
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 57
    .line 58
    .line 59
    iget-object v0, p0, Ll/ybh0;->v:Landroid/widget/TextView;

    .line 60
    .line 61
    new-instance v1, Ll/ubh0;

    .line 62
    .line 63
    invoke-direct {v1, p0}, Ll/ubh0;-><init>(Ll/ybh0;)V

    .line 64
    .line 65
    .line 66
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 67
    .line 68
    .line 69
    return-void
.end method

.method private i0()V
    .locals 3

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->K()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->me_()Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget v1, p0, Ll/ybh0;->C:I

    .line 10
    .line 11
    if-eqz v1, :cond_2

    .line 12
    .line 13
    const/4 v2, 0x1

    .line 14
    if-eq v1, v2, :cond_2

    .line 15
    .line 16
    const/4 v2, 0x2

    .line 17
    if-eq v1, v2, :cond_1

    .line 18
    .line 19
    const/4 v2, 0x3

    .line 20
    if-eq v1, v2, :cond_0

    .line 21
    .line 22
    return-void

    .line 23
    :cond_0
    invoke-virtual {p0, v0}, Ll/ybh0;->f0(Lcom/p1/mobile/putong/data/User;)V

    .line 24
    .line 25
    .line 26
    return-void

    .line 27
    :cond_1
    invoke-direct {p0}, Ll/ybh0;->e0()V

    .line 28
    .line 29
    .line 30
    return-void

    .line 31
    :cond_2
    invoke-virtual {p0, v0}, Ll/ybh0;->h0(Lcom/p1/mobile/putong/data/User;)V

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method private synthetic m0(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ybh0;->c0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public final A0(ILcom/p1/mobile/putong/data/User;Ljava/lang/String;)V
    .locals 9

    .line 1
    const-string v0, "other_user_id"

    .line 2
    .line 3
    iget-object v1, p2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const-string v1, "is_emoji"

    .line 10
    .line 11
    sget-object v2, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 12
    .line 13
    invoke-static {v1, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    const-string v2, "is_click_avatar"

    .line 18
    .line 19
    sget-object v3, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 20
    .line 21
    invoke-static {v2, v3}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    filled-new-array {v0, v1, v2}, [Ll/pf60;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    const-string v1, "e_surprisebox_user"

    .line 30
    .line 31
    const-string v2, "p_suggest_users_home_view"

    .line 32
    .line 33
    invoke-static {v1, v2, v0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 34
    .line 35
    .line 36
    invoke-static {}, Lcom/p1/mobile/putong/core/data/Message;->new_()Lcom/p1/mobile/putong/core/data/Message;

    .line 37
    .line 38
    .line 39
    move-result-object v6

    .line 40
    const-string v0, "text"

    .line 41
    .line 42
    invoke-static {v0}, Lcom/p1/mobile/putong/core/data/MessageType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/MessageType;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    iput-object v0, v6, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 47
    .line 48
    iput-object p3, v6, Lcom/p1/mobile/putong/core/data/Message;->value:Ljava/lang/String;

    .line 49
    .line 50
    if-nez p1, :cond_0

    .line 51
    .line 52
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 53
    .line 54
    iget-object v0, p1, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 55
    .line 56
    const/4 v3, 0x0

    .line 57
    const-string v5, ""

    .line 58
    .line 59
    const/4 v1, 0x1

    .line 60
    const/4 v2, 0x0

    .line 61
    move-object v4, p2

    .line 62
    invoke-virtual/range {v0 .. v5}, Lcom/p1/mobile/putong/core/api/CoreSuggested;->V7(ZZLjava/util/Map;Lcom/p1/mobile/putong/data/User;Ljava/lang/String;)Lrx/c;

    .line 63
    .line 64
    .line 65
    move-result-object p1

    .line 66
    new-instance p2, Ll/jbh0;

    .line 67
    .line 68
    invoke-direct {p2, v4}, Ll/jbh0;-><init>(Lcom/p1/mobile/putong/data/User;)V

    .line 69
    .line 70
    .line 71
    invoke-virtual {p1, p2}, Lrx/c;->doOnNext(Ll/y20;)Lrx/c;

    .line 72
    .line 73
    .line 74
    move-result-object p1

    .line 75
    new-instance p2, Ll/kbh0;

    .line 76
    .line 77
    invoke-direct {p2, v4, v6}, Ll/kbh0;-><init>(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/data/Message;)V

    .line 78
    .line 79
    .line 80
    invoke-virtual {p1, p2}, Lrx/c;->switchMap(Ll/qcj;)Lrx/c;

    .line 81
    .line 82
    .line 83
    move-result-object p1

    .line 84
    invoke-virtual {p0, p1}, Ll/g1e;->duringCreated(Lrx/c;)Lrx/c;

    .line 85
    .line 86
    .line 87
    move-result-object p1

    .line 88
    new-instance p2, Ll/lbh0;

    .line 89
    .line 90
    invoke-direct {p2, p0}, Ll/lbh0;-><init>(Ll/ybh0;)V

    .line 91
    .line 92
    .line 93
    new-instance p3, Ll/mbh0;

    .line 94
    .line 95
    invoke-direct {p3, p0}, Ll/mbh0;-><init>(Ll/ybh0;)V

    .line 96
    .line 97
    .line 98
    invoke-static {p2, p3}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 99
    .line 100
    .line 101
    move-result-object p0

    .line 102
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 103
    .line 104
    .line 105
    return-void

    .line 106
    :cond_0
    move-object v4, p2

    .line 107
    const/4 p2, 0x1

    .line 108
    if-ne p1, p2, :cond_1

    .line 109
    .line 110
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 111
    .line 112
    iget-object v3, p1, Lcom/p1/mobile/putong/core/api/c;->r0:Lcom/p1/mobile/putong/core/api/j;

    .line 113
    .line 114
    iget-object v4, v4, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 115
    .line 116
    const-string p1, "surprise_box"

    .line 117
    .line 118
    invoke-static {p1}, Lcom/p1/mobile/putong/data/Channel;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/Channel;

    .line 119
    .line 120
    .line 121
    move-result-object v5

    .line 122
    const/4 v7, 0x0

    .line 123
    const/4 v8, 0x0

    .line 124
    invoke-virtual/range {v3 .. v8}, Lcom/p1/mobile/putong/core/api/j;->u6(Ljava/lang/String;Lcom/p1/mobile/putong/data/Channel;Lcom/p1/mobile/putong/core/data/Message;Ljava/lang/String;Ll/x20;)Lrx/c;

    .line 125
    .line 126
    .line 127
    move-result-object p1

    .line 128
    invoke-virtual {p0, p1}, Ll/g1e;->duringCreated(Lrx/c;)Lrx/c;

    .line 129
    .line 130
    .line 131
    move-result-object p1

    .line 132
    new-instance p2, Ll/nbh0;

    .line 133
    .line 134
    invoke-direct {p2, p0}, Ll/nbh0;-><init>(Ll/ybh0;)V

    .line 135
    .line 136
    .line 137
    new-instance p3, Ll/obh0;

    .line 138
    .line 139
    invoke-direct {p3, p0}, Ll/obh0;-><init>(Ll/ybh0;)V

    .line 140
    .line 141
    .line 142
    invoke-static {p2, p3}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 143
    .line 144
    .line 145
    move-result-object p0

    .line 146
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 147
    .line 148
    .line 149
    :cond_1
    return-void
.end method

.method public B0(I)V
    .locals 0

    .line 1
    iput p1, p0, Ll/ybh0;->C:I

    .line 2
    .line 3
    return-void
.end method

.method public C0(Ll/x20;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/ybh0;->E:Ll/x20;

    .line 2
    .line 3
    return-void
.end method

.method public b0(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/zbh0;->b(Ll/ybh0;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final c0()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/g1e;->dismiss()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Ll/ji30;->h()Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    sget-object v1, Lcom/p1/mobile/putong/newui/main/base/TabName;->Card:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 9
    .line 10
    if-eq v0, v1, :cond_0

    .line 11
    .line 12
    iget-object v0, p0, Ll/ybh0;->B:Lcom/p1/mobile/android/app/Act;

    .line 13
    .line 14
    const-string v1, "cards"

    .line 15
    .line 16
    invoke-static {v1}, Lcom/p1/mobile/putong/data/NavigationIntent;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/NavigationIntent;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;->M5(Landroid/content/Context;Lcom/p1/mobile/putong/data/NavigationIntent;)Landroid/content/Intent;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    iget-object p0, p0, Ll/ybh0;->B:Lcom/p1/mobile/android/app/Act;

    .line 25
    .line 26
    invoke-virtual {p0, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 27
    .line 28
    .line 29
    :cond_0
    return-void
.end method

.method public final d0(Z)V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/ybh0;->D:Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    const-string v1, "other_user_id"

    .line 7
    .line 8
    iget-object v0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 9
    .line 10
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    const-string v1, "is_emoji"

    .line 15
    .line 16
    sget-object v2, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 17
    .line 18
    invoke-static {v1, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    const-string v2, "is_click_avatar"

    .line 23
    .line 24
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    invoke-static {v2, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    filled-new-array {v0, v1, p1}, [Ll/pf60;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    const-string v0, "e_surprisebox_user"

    .line 37
    .line 38
    const-string v1, "p_suggest_users_home_view"

    .line 39
    .line 40
    invoke-static {v0, v1, p1}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 41
    .line 42
    .line 43
    iget p1, p0, Ll/ybh0;->C:I

    .line 44
    .line 45
    if-nez p1, :cond_1

    .line 46
    .line 47
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 48
    .line 49
    iget-object v0, p1, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 50
    .line 51
    iget-object v4, p0, Ll/ybh0;->D:Lcom/p1/mobile/putong/data/User;

    .line 52
    .line 53
    const-string v5, ""

    .line 54
    .line 55
    const/4 v1, 0x1

    .line 56
    const/4 v2, 0x0

    .line 57
    const/4 v3, 0x0

    .line 58
    invoke-virtual/range {v0 .. v5}, Lcom/p1/mobile/putong/core/api/CoreSuggested;->V7(ZZLjava/util/Map;Lcom/p1/mobile/putong/data/User;Ljava/lang/String;)Lrx/c;

    .line 59
    .line 60
    .line 61
    move-result-object p1

    .line 62
    new-instance v0, Ll/vbh0;

    .line 63
    .line 64
    invoke-direct {v0, p0}, Ll/vbh0;-><init>(Ll/ybh0;)V

    .line 65
    .line 66
    .line 67
    invoke-virtual {p1, v0}, Lrx/c;->doOnNext(Ll/y20;)Lrx/c;

    .line 68
    .line 69
    .line 70
    move-result-object p1

    .line 71
    new-instance v0, Ll/wbh0;

    .line 72
    .line 73
    invoke-direct {v0, p0}, Ll/wbh0;-><init>(Ll/ybh0;)V

    .line 74
    .line 75
    .line 76
    invoke-virtual {p1, v0}, Lrx/c;->switchMap(Ll/qcj;)Lrx/c;

    .line 77
    .line 78
    .line 79
    move-result-object p1

    .line 80
    new-instance v0, Ll/ybh0$a;

    .line 81
    .line 82
    invoke-direct {v0, p0}, Ll/ybh0$a;-><init>(Ll/ybh0;)V

    .line 83
    .line 84
    .line 85
    new-instance v1, Ll/xbh0;

    .line 86
    .line 87
    invoke-direct {v1}, Ll/xbh0;-><init>()V

    .line 88
    .line 89
    .line 90
    invoke-static {v0, v1}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 91
    .line 92
    .line 93
    move-result-object v0

    .line 94
    invoke-virtual {p1, v0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 95
    .line 96
    .line 97
    invoke-virtual {p0}, Ll/g1e;->dismiss()V

    .line 98
    .line 99
    .line 100
    return-void

    .line 101
    :cond_1
    iget-object p1, p0, Ll/ybh0;->B:Lcom/p1/mobile/android/app/Act;

    .line 102
    .line 103
    iget-object v0, p0, Ll/ybh0;->D:Lcom/p1/mobile/putong/data/User;

    .line 104
    .line 105
    iget-object v0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 106
    .line 107
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/core/ui/greet/d;->f(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 108
    .line 109
    .line 110
    invoke-virtual {p0}, Ll/g1e;->dismiss()V

    .line 111
    .line 112
    .line 113
    return-void
.end method

.method public final f0(Lcom/p1/mobile/putong/data/User;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ybh0;->p:Lv/VFrame;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Ll/ybh0;->w:Lv/VLinear;

    .line 8
    .line 9
    const/4 v1, 0x0

    .line 10
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Ll/ybh0;->r:Lv/VImage;

    .line 14
    .line 15
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Ll/ybh0;->k:Landroid/widget/FrameLayout;

    .line 19
    .line 20
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 21
    .line 22
    .line 23
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-eqz v0, :cond_0

    .line 28
    .line 29
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 30
    .line 31
    iget-object v1, p0, Ll/ybh0;->q:Lv/VDraweeView;

    .line 32
    .line 33
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/Picture;->profile480()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/Picture$ImageUri;->formatted()Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    invoke-virtual {v0, v1, p1}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    :cond_0
    iget-object p1, p0, Ll/ybh0;->s:Landroid/widget/TextView;

    .line 49
    .line 50
    const-string v0, "\u606d\u559c\u83b7\u5f9750\u6b21\u66dd\u5149\u673a\u4f1a"

    .line 51
    .line 52
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 53
    .line 54
    .line 55
    iget-object p1, p0, Ll/ybh0;->t:Landroid/widget/TextView;

    .line 56
    .line 57
    const-string v0, "\u4f60\u5fc3\u4eea\u7684\u5973\u751f\u5c06\u4f1a\u66f4\u5bb9\u6613\u770b\u5230\u4f60\uff0c\u7acb\u5373\u5212\u5361\u4f53\u9a8c\uff01"

    .line 58
    .line 59
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 60
    .line 61
    .line 62
    iget-object p1, p0, Ll/ybh0;->u:Landroid/widget/TextView;

    .line 63
    .line 64
    const-string v0, "\u786e\u8ba4\u4f7f\u7528"

    .line 65
    .line 66
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 67
    .line 68
    .line 69
    iget-object p1, p0, Ll/ybh0;->u:Landroid/widget/TextView;

    .line 70
    .line 71
    new-instance v0, Ll/rbh0;

    .line 72
    .line 73
    invoke-direct {v0, p0}, Ll/rbh0;-><init>(Ll/ybh0;)V

    .line 74
    .line 75
    .line 76
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 77
    .line 78
    .line 79
    iget-object p1, p0, Ll/ybh0;->v:Landroid/widget/TextView;

    .line 80
    .line 81
    new-instance v0, Ll/sbh0;

    .line 82
    .line 83
    invoke-direct {v0, p0}, Ll/sbh0;-><init>(Ll/ybh0;)V

    .line 84
    .line 85
    .line 86
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 87
    .line 88
    .line 89
    return-void
.end method

.method public final g0()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ybh0;->x:Lv/VText;

    .line 2
    .line 3
    const-string v1, "[\u563f\u54c8]"

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ll/ybh0;->y:Lv/VText;

    .line 9
    .line 10
    const-string v1, "[\u6697\u4e2d\u89c2\u5bdf]"

    .line 11
    .line 12
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Ll/ybh0;->z:Lv/VText;

    .line 16
    .line 17
    const-string v1, "[\u5728\u5417]"

    .line 18
    .line 19
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Ll/ybh0;->A:Lv/VText;

    .line 23
    .line 24
    const-string v1, "[\u5fae\u7b11]"

    .line 25
    .line 26
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 27
    .line 28
    .line 29
    iget-object v0, p0, Ll/ybh0;->x:Lv/VText;

    .line 30
    .line 31
    new-instance v1, Ll/fbh0;

    .line 32
    .line 33
    invoke-direct {v1, p0}, Ll/fbh0;-><init>(Ll/ybh0;)V

    .line 34
    .line 35
    .line 36
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 37
    .line 38
    .line 39
    iget-object v0, p0, Ll/ybh0;->y:Lv/VText;

    .line 40
    .line 41
    new-instance v1, Ll/gbh0;

    .line 42
    .line 43
    invoke-direct {v1, p0}, Ll/gbh0;-><init>(Ll/ybh0;)V

    .line 44
    .line 45
    .line 46
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 47
    .line 48
    .line 49
    iget-object v0, p0, Ll/ybh0;->z:Lv/VText;

    .line 50
    .line 51
    new-instance v1, Ll/hbh0;

    .line 52
    .line 53
    invoke-direct {v1, p0}, Ll/hbh0;-><init>(Ll/ybh0;)V

    .line 54
    .line 55
    .line 56
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 57
    .line 58
    .line 59
    iget-object v0, p0, Ll/ybh0;->A:Lv/VText;

    .line 60
    .line 61
    new-instance v1, Ll/ibh0;

    .line 62
    .line 63
    invoke-direct {v1, p0}, Ll/ibh0;-><init>(Ll/ybh0;)V

    .line 64
    .line 65
    .line 66
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 67
    .line 68
    .line 69
    return-void
.end method

.method public final h0(Lcom/p1/mobile/putong/data/User;)V
    .locals 5

    .line 1
    iget-object v0, p0, Ll/ybh0;->n:Lv/VIcon;

    .line 2
    .line 3
    new-instance v1, Ll/ebh0;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/ebh0;-><init>(Ll/ybh0;)V

    .line 6
    .line 7
    .line 8
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 9
    .line 10
    .line 11
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    const/high16 v1, 0x42b40000    # 90.0f

    .line 16
    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 20
    .line 21
    iget-object v2, p0, Ll/ybh0;->l:Lv/VDraweeView;

    .line 22
    .line 23
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/Picture;->profileMiddle()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/Picture$ImageUri;->formatted()Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 36
    .line 37
    .line 38
    move-result v3

    .line 39
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 40
    .line 41
    .line 42
    move-result v4

    .line 43
    invoke-virtual {v0, v2, p1, v3, v4}, Ll/fsb0;->I0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;II)Lcom/facebook/imagepipeline/request/ImageRequest;

    .line 44
    .line 45
    .line 46
    :cond_0
    iget-object p1, p0, Ll/ybh0;->D:Lcom/p1/mobile/putong/data/User;

    .line 47
    .line 48
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 49
    .line 50
    .line 51
    move-result p1

    .line 52
    if-eqz p1, :cond_1

    .line 53
    .line 54
    sget-object p1, Ll/uqb0;->G:Ll/fsb0;

    .line 55
    .line 56
    iget-object v0, p0, Ll/ybh0;->m:Lv/VDraweeView;

    .line 57
    .line 58
    iget-object v2, p0, Ll/ybh0;->D:Lcom/p1/mobile/putong/data/User;

    .line 59
    .line 60
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 61
    .line 62
    .line 63
    move-result-object v2

    .line 64
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/Picture;->profileMiddle()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 65
    .line 66
    .line 67
    move-result-object v2

    .line 68
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/Picture$ImageUri;->formatted()Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    move-result-object v2

    .line 72
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 73
    .line 74
    .line 75
    move-result v3

    .line 76
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 77
    .line 78
    .line 79
    move-result v1

    .line 80
    invoke-virtual {p1, v0, v2, v3, v1}, Ll/fsb0;->I0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;II)Lcom/facebook/imagepipeline/request/ImageRequest;

    .line 81
    .line 82
    .line 83
    :cond_1
    iget-object p1, p0, Ll/ybh0;->o:Lv/VIcon;

    .line 84
    .line 85
    const/4 v0, 0x1

    .line 86
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 87
    .line 88
    .line 89
    iget-object p1, p0, Ll/ybh0;->s:Landroid/widget/TextView;

    .line 90
    .line 91
    const-string v1, "\u548c\u4f60\u6700\u5339\u914d\u7684\u4eba\u51fa\u73b0\u4e86"

    .line 92
    .line 93
    invoke-virtual {p1, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 94
    .line 95
    .line 96
    iget-object p1, p0, Ll/ybh0;->t:Landroid/widget/TextView;

    .line 97
    .line 98
    const-string v1, "\u6839\u636e\u4f60\u7684\u6d4f\u89c8\u8bb0\u5f55\uff0c\u63a2\u63a2\u541b\u4e3a\u4f60\u63a8\u8350\u4e86\u4e00\u4f4d\u6700\u5339\u914d\u7684\u4eba\uff0c\u9a6c\u4e0a\u53bb\u804a\u804a\u5427"

    .line 99
    .line 100
    invoke-virtual {p1, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 101
    .line 102
    .line 103
    iget-object p1, p0, Ll/ybh0;->u:Landroid/widget/TextView;

    .line 104
    .line 105
    const-string v1, "\u6253\u4e2a\u62db\u547c"

    .line 106
    .line 107
    invoke-virtual {p1, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 108
    .line 109
    .line 110
    iget-object p1, p0, Ll/ybh0;->k:Landroid/widget/FrameLayout;

    .line 111
    .line 112
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 113
    .line 114
    .line 115
    iget-object p1, p0, Ll/ybh0;->v:Landroid/widget/TextView;

    .line 116
    .line 117
    const/4 v1, 0x0

    .line 118
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 119
    .line 120
    .line 121
    iget-object p1, p0, Ll/ybh0;->w:Lv/VLinear;

    .line 122
    .line 123
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 124
    .line 125
    .line 126
    invoke-virtual {p0}, Ll/ybh0;->g0()V

    .line 127
    .line 128
    .line 129
    iget-object p1, p0, Ll/ybh0;->u:Landroid/widget/TextView;

    .line 130
    .line 131
    new-instance v0, Ll/pbh0;

    .line 132
    .line 133
    invoke-direct {v0, p0}, Ll/pbh0;-><init>(Ll/ybh0;)V

    .line 134
    .line 135
    .line 136
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 137
    .line 138
    .line 139
    iget-object p1, p0, Ll/ybh0;->m:Lv/VDraweeView;

    .line 140
    .line 141
    new-instance v0, Ll/qbh0;

    .line 142
    .line 143
    invoke-direct {v0, p0}, Ll/qbh0;-><init>(Ll/ybh0;)V

    .line 144
    .line 145
    .line 146
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 147
    .line 148
    .line 149
    return-void
.end method

.method public final synthetic j0(Lcom/p1/mobile/putong/data/Relationship;)V
    .locals 0

    .line 1
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 4
    .line 5
    iget-object p0, p0, Ll/ybh0;->D:Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 8
    .line 9
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/core/api/CoreSuggested;->E8(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final synthetic k0(Lcom/p1/mobile/putong/data/Relationship;)Lrx/c;
    .locals 0

    .line 1
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 4
    .line 5
    iget-object p0, p0, Ll/ybh0;->D:Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 8
    .line 9
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/core/api/g;->ap(Ljava/lang/String;)Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public final synthetic l0(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ybh0;->c0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic n0(Landroid/view/View;)V
    .locals 4

    .line 1
    invoke-static {}, Ll/gra;->M2()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 8
    .line 9
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->k2:Ll/j7b;

    .line 10
    .line 11
    iget-object p1, p1, Ll/j7b;->S:Ll/byd0;

    .line 12
    .line 13
    invoke-static {}, Ll/pzi0;->o()J

    .line 14
    .line 15
    .line 16
    move-result-wide v0

    .line 17
    const-wide/32 v2, 0x927c0

    .line 18
    .line 19
    .line 20
    add-long/2addr v0, v2

    .line 21
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-virtual {p1, v0}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    :cond_0
    invoke-virtual {p0}, Ll/ybh0;->c0()V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public final synthetic o0(Landroid/view/View;)V
    .locals 4

    .line 1
    invoke-static {}, Ll/gra;->M2()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 8
    .line 9
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->k2:Ll/j7b;

    .line 10
    .line 11
    iget-object p1, p1, Ll/j7b;->S:Ll/byd0;

    .line 12
    .line 13
    invoke-static {}, Ll/pzi0;->o()J

    .line 14
    .line 15
    .line 16
    move-result-wide v0

    .line 17
    const-wide/32 v2, 0x927c0

    .line 18
    .line 19
    .line 20
    add-long/2addr v0, v2

    .line 21
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-virtual {p1, v0}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    :cond_0
    invoke-virtual {p0}, Ll/ybh0;->c0()V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Landroidx/appcompat/app/a;->onCreate(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Ll/ybh0;->B:Lcom/p1/mobile/android/app/Act;

    .line 5
    .line 6
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    const/4 v0, 0x0

    .line 11
    invoke-virtual {p0, p1, v0}, Ll/ybh0;->b0(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    invoke-virtual {p0, p1}, Ll/nu0;->setContentView(Landroid/view/View;)V

    .line 16
    .line 17
    .line 18
    invoke-direct {p0}, Ll/ybh0;->i0()V

    .line 19
    .line 20
    .line 21
    const/4 p1, 0x0

    .line 22
    invoke-virtual {p0, p1}, Landroid/app/Dialog;->setCancelable(Z)V

    .line 23
    .line 24
    .line 25
    iget-object p1, p0, Ll/ybh0;->j:Lv/VDraweeView;

    .line 26
    .line 27
    const/4 v0, 0x1

    .line 28
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 29
    .line 30
    .line 31
    sget-object p1, Ll/uqb0;->G:Ll/fsb0;

    .line 32
    .line 33
    iget-object p0, p0, Ll/ybh0;->j:Lv/VDraweeView;

    .line 34
    .line 35
    sget v0, Ll/dbc0;->tq:I

    .line 36
    .line 37
    invoke-virtual {p1, p0, v0}, Ll/fsb0;->Y0(Lcom/facebook/drawee/view/SimpleDraweeView;I)V

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method public final synthetic p0(Landroid/view/View;)V
    .locals 2

    .line 1
    iget p1, p0, Ll/ybh0;->C:I

    .line 2
    .line 3
    iget-object v0, p0, Ll/ybh0;->D:Lcom/p1/mobile/putong/data/User;

    .line 4
    .line 5
    iget-object v1, p0, Ll/ybh0;->x:Lv/VText;

    .line 6
    .line 7
    invoke-virtual {v1}, Landroidx/appcompat/widget/AppCompatTextView;->getText()Ljava/lang/CharSequence;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-interface {v1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-virtual {p0, p1, v0, v1}, Ll/ybh0;->A0(ILcom/p1/mobile/putong/data/User;Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public final synthetic q0(Landroid/view/View;)V
    .locals 2

    .line 1
    iget p1, p0, Ll/ybh0;->C:I

    .line 2
    .line 3
    iget-object v0, p0, Ll/ybh0;->D:Lcom/p1/mobile/putong/data/User;

    .line 4
    .line 5
    iget-object v1, p0, Ll/ybh0;->y:Lv/VText;

    .line 6
    .line 7
    invoke-virtual {v1}, Landroidx/appcompat/widget/AppCompatTextView;->getText()Ljava/lang/CharSequence;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-interface {v1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-virtual {p0, p1, v0, v1}, Ll/ybh0;->A0(ILcom/p1/mobile/putong/data/User;Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public final synthetic r0(Landroid/view/View;)V
    .locals 2

    .line 1
    iget p1, p0, Ll/ybh0;->C:I

    .line 2
    .line 3
    iget-object v0, p0, Ll/ybh0;->D:Lcom/p1/mobile/putong/data/User;

    .line 4
    .line 5
    iget-object v1, p0, Ll/ybh0;->z:Lv/VText;

    .line 6
    .line 7
    invoke-virtual {v1}, Landroidx/appcompat/widget/AppCompatTextView;->getText()Ljava/lang/CharSequence;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-interface {v1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-virtual {p0, p1, v0, v1}, Ll/ybh0;->A0(ILcom/p1/mobile/putong/data/User;Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public final synthetic s0(Landroid/view/View;)V
    .locals 2

    .line 1
    iget p1, p0, Ll/ybh0;->C:I

    .line 2
    .line 3
    iget-object v0, p0, Ll/ybh0;->D:Lcom/p1/mobile/putong/data/User;

    .line 4
    .line 5
    iget-object v1, p0, Ll/ybh0;->A:Lv/VText;

    .line 6
    .line 7
    invoke-virtual {v1}, Landroidx/appcompat/widget/AppCompatTextView;->getText()Ljava/lang/CharSequence;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-interface {v1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-virtual {p0, p1, v0, v1}, Ll/ybh0;->A0(ILcom/p1/mobile/putong/data/User;Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public show()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/g1e;->show()V

    .line 2
    .line 3
    .line 4
    iget v0, p0, Ll/ybh0;->C:I

    .line 5
    .line 6
    if-eqz v0, :cond_1

    .line 7
    .line 8
    const/4 v1, 0x1

    .line 9
    if-ne v0, v1, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    return-void

    .line 13
    :cond_1
    :goto_0
    iget-object v0, p0, Ll/ybh0;->D:Lcom/p1/mobile/putong/data/User;

    .line 14
    .line 15
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_2

    .line 20
    .line 21
    iget-object p0, p0, Ll/ybh0;->D:Lcom/p1/mobile/putong/data/User;

    .line 22
    .line 23
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 24
    .line 25
    goto :goto_1

    .line 26
    :cond_2
    const-string p0, ""

    .line 27
    .line 28
    :goto_1
    const-string v0, "other_user_id"

    .line 29
    .line 30
    invoke-static {v0, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    filled-new-array {p0}, [Ll/pf60;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    const-string v0, "e_surprisebox_user"

    .line 39
    .line 40
    const-string v1, "p_suggest_users_home_view"

    .line 41
    .line 42
    invoke-static {v0, v1, p0}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 43
    .line 44
    .line 45
    return-void
.end method

.method public final synthetic t0(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p1, p0, Ll/ybh0;->E:Ll/x20;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    invoke-interface {p1}, Ll/x20;->call()V

    .line 6
    .line 7
    .line 8
    :cond_0
    invoke-virtual {p0}, Ll/g1e;->dismiss()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final synthetic u0(Landroid/view/View;)V
    .locals 0

    .line 1
    const/4 p1, 0x0

    .line 2
    invoke-virtual {p0, p1}, Ll/ybh0;->d0(Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public final synthetic v0(Landroid/view/View;)V
    .locals 0

    .line 1
    const/4 p1, 0x1

    .line 2
    invoke-virtual {p0, p1}, Ll/ybh0;->d0(Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public final synthetic w0(Lcom/p1/mobile/putong/core/data/Message;)V
    .locals 0

    .line 1
    invoke-static {}, Ll/och0;->d()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/g1e;->dismiss()V

    .line 5
    .line 6
    .line 7
    const-string p0, "\u6d88\u606f\u53d1\u9001\u6210\u529f"

    .line 8
    .line 9
    invoke-static {p0}, Ll/r1j0;->g(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final synthetic x0(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/g1e;->dismiss()V

    .line 2
    .line 3
    .line 4
    const-string p0, "\u6d88\u606f\u53d1\u9001\u5931\u8d25"

    .line 5
    .line 6
    invoke-static {p0}, Ll/r1j0;->g(Ljava/lang/String;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final synthetic y0(Lcom/p1/mobile/putong/core/data/Message;)V
    .locals 0

    .line 1
    invoke-static {}, Ll/och0;->d()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/g1e;->dismiss()V

    .line 5
    .line 6
    .line 7
    const-string p0, "\u6d88\u606f\u53d1\u9001\u6210\u529f"

    .line 8
    .line 9
    invoke-static {p0}, Ll/r1j0;->g(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final synthetic z0(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/g1e;->dismiss()V

    .line 2
    .line 3
    .line 4
    const-string p0, "\u6d88\u606f\u53d1\u9001\u5931\u8d25"

    .line 5
    .line 6
    invoke-static {p0}, Ll/r1j0;->g(Ljava/lang/String;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

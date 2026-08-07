.class public Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;
.super Ll/vck;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/vck<",
        "Lcom/p1/mobile/putong/core/ui/greet/a;",
        ">;"
    }
.end annotation


# static fields
.field public static Q:Ll/byd0;


# instance fields
.field public A:Ll/tul;

.field public B:Ll/adk;

.field public C:Ll/kdk;

.field public D:Z

.field public E:Z

.field public F:I

.field public G:I

.field public H:Ljava/lang/String;

.field public I:Z

.field public J:Z

.field public K:Z

.field public L:Landroid/view/animation/Interpolator;

.field public M:Ljava/lang/Runnable;

.field public N:Ljava/lang/Runnable;

.field public O:Z

.field public P:Landroid/widget/PopupWindow;

.field public a:Lv/VFrame;

.field public b:Landroid/view/View;

.field public c:Lv/VFrame;

.field public d:Lv/VFrame;

.field public e:Landroid/widget/RelativeLayout;

.field public f:Lv/VFrame;

.field public g:Lv/VList;

.field public h:Lv/VFrame;

.field public i:Landroid/widget/RelativeLayout;

.field public j:Lv/VRecyclerView;

.field public k:Lv/VLinear;

.field public l:Lv/VImage;

.field public m:Lv/VLinear;

.field public n:Lv/VEditText;

.field public o:Lv/VText;

.field public p:Lv/VImage;

.field public q:Lv/VFrame;

.field public r:Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;

.field public s:Lv/VImage;

.field public t:Lv/VText;

.field public u:Lv/VIcon;

.field public v:Lv/VIcon;

.field public w:Ll/jxd0;
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "SV_USE_DUP_ID"
        }
    .end annotation
.end field

.field public x:Lcom/p1/mobile/putong/core/ui/greet/GreetAct;

.field public y:Lcom/p1/mobile/putong/core/ui/gift/layer/CoreGiftLayer;

.field public z:Lcom/p1/mobile/putong/core/ui/greet/a;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 1
    new-instance v0, Ll/byd0;

    .line 2
    .line 3
    new-instance v1, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    const-string v2, "show_state_meet_time_"

    .line 6
    .line 7
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 11
    .line 12
    .line 13
    move-result-object v2

    .line 14
    invoke-interface {v2}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v2

    .line 18
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    const-wide/16 v2, 0x0

    .line 26
    .line 27
    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 28
    .line 29
    .line 30
    move-result-object v2

    .line 31
    invoke-direct {v0, v1, v2}, Ll/byd0;-><init>(Ljava/lang/String;Ljava/lang/Long;)V

    .line 32
    .line 33
    .line 34
    sput-object v0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->Q:Ll/byd0;

    .line 35
    .line 36
    return-void
.end method

.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/greet/GreetAct;)V
    .locals 3

    .line 1
    invoke-direct {p0}, Ll/vck;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/jxd0;

    .line 5
    .line 6
    new-instance v1, Ljava/lang/StringBuilder;

    .line 7
    .line 8
    const-string v2, "core_greet_say_hi_gift_guide_is_never_show_"

    .line 9
    .line 10
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    invoke-interface {v2}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    sget-object v2, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 29
    .line 30
    invoke-direct {v0, v1, v2}, Ll/jxd0;-><init>(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 31
    .line 32
    .line 33
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->w:Ll/jxd0;

    .line 34
    .line 35
    const/4 v0, 0x1

    .line 36
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->D:Z

    .line 37
    .line 38
    const/4 v0, 0x0

    .line 39
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->E:Z

    .line 40
    .line 41
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->F:I

    .line 42
    .line 43
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->G:I

    .line 44
    .line 45
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->I:Z

    .line 46
    .line 47
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->J:Z

    .line 48
    .line 49
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->K:Z

    .line 50
    .line 51
    new-instance v0, Ll/xjg;

    .line 52
    .line 53
    invoke-direct {v0}, Ll/xjg;-><init>()V

    .line 54
    .line 55
    .line 56
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->L:Landroid/view/animation/Interpolator;

    .line 57
    .line 58
    new-instance v0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel$a;

    .line 59
    .line 60
    invoke-direct {v0, p0}, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel$a;-><init>(Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;)V

    .line 61
    .line 62
    .line 63
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->M:Ljava/lang/Runnable;

    .line 64
    .line 65
    new-instance v0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel$b;

    .line 66
    .line 67
    invoke-direct {v0, p0}, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel$b;-><init>(Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;)V

    .line 68
    .line 69
    .line 70
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->N:Ljava/lang/Runnable;

    .line 71
    .line 72
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->x:Lcom/p1/mobile/putong/core/ui/greet/GreetAct;

    .line 73
    .line 74
    return-void
.end method

.method public static synthetic A(Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->t0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic B(Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;Ljava/lang/Boolean;Ljava/lang/Integer;Ljava/lang/Boolean;Ljava/lang/Integer;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->n0(Ljava/lang/Boolean;Ljava/lang/Integer;Ljava/lang/Boolean;Ljava/lang/Integer;)V

    return-void
.end method

.method public static synthetic C(Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->v0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic E(Landroid/view/View;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic F(Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->w0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic G(Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;Lcom/p1/mobile/putong/data/User;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->H0(Lcom/p1/mobile/putong/data/User;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic H(Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->K0(Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic I(Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->M0(Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic J(Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;Ljava/lang/String;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->Q0(Ljava/lang/String;Ll/uxj0;)V

    return-void
.end method

.method public static synthetic K(Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;Lcom/p1/mobile/putong/core/data/CoreGiftInfo;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->J0(Lcom/p1/mobile/putong/core/data/CoreGiftInfo;)V

    return-void
.end method

.method public static synthetic L(Landroid/view/View;)V
    .locals 1

    .line 1
    const-string p0, "e_stay_meet"

    .line 2
    .line 3
    const-string v0, "p_meet_back_pop"

    .line 4
    .line 5
    invoke-static {p0, v0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic M(Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;Lcom/p1/mobile/putong/core/data/CoreGiftInfo;ZLjava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->D0(Lcom/p1/mobile/putong/core/data/CoreGiftInfo;ZLjava/lang/String;)V

    return-void
.end method

.method public static synthetic N(Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;Lcom/p1/mobile/putong/core/data/Message;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->z0(Lcom/p1/mobile/putong/core/data/Message;)V

    return-void
.end method

.method public static bridge synthetic O(Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;)Ljava/lang/Runnable;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->N:Ljava/lang/Runnable;

    return-object p0
.end method

.method public static bridge synthetic P(Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;)Ljava/lang/Runnable;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->M:Ljava/lang/Runnable;

    return-object p0
.end method

.method public static bridge synthetic Q(Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->O:Z

    return-void
.end method

.method private T()V
    .locals 5

    .line 1
    new-instance v0, Landroid/widget/PopupWindow;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/widget/PopupWindow;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->P:Landroid/widget/PopupWindow;

    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->S()Lcom/p1/mobile/putong/core/ui/greet/GreetAct;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    invoke-virtual {v1}, Lcom/p1/mobile/putong/app/PutongAct;->inflater()Landroid/view/LayoutInflater;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    sget v2, Ll/qec0;->O5:I

    .line 17
    .line 18
    const/4 v3, 0x0

    .line 19
    const/4 v4, 0x0

    .line 20
    invoke-virtual {v1, v2, v3, v4}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    invoke-virtual {v0, v1}, Landroid/widget/PopupWindow;->setContentView(Landroid/view/View;)V

    .line 25
    .line 26
    .line 27
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->P:Landroid/widget/PopupWindow;

    .line 28
    .line 29
    const/4 v1, 0x1

    .line 30
    invoke-virtual {v0, v1}, Landroid/widget/PopupWindow;->setInputMethodMode(I)V

    .line 31
    .line 32
    .line 33
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->P:Landroid/widget/PopupWindow;

    .line 34
    .line 35
    invoke-virtual {v0, v4}, Landroid/widget/PopupWindow;->setWidth(I)V

    .line 36
    .line 37
    .line 38
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->P:Landroid/widget/PopupWindow;

    .line 39
    .line 40
    invoke-virtual {p0, v4}, Landroid/widget/PopupWindow;->setHeight(I)V

    .line 41
    .line 42
    .line 43
    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->E0()V

    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;Lcom/p1/mobile/putong/data/User;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->G0(Lcom/p1/mobile/putong/data/User;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->x0(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Boolean;)V

    return-void
.end method

.method public static synthetic d(Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;Lcom/p1/mobile/putong/core/data/CoreGiftInfo;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->N0(Lcom/p1/mobile/putong/core/data/CoreGiftInfo;)V

    return-void
.end method

.method public static synthetic e(Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->q0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic f(Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->A0(Landroid/animation/ValueAnimator;)V

    return-void
.end method

.method public static synthetic i(Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;Lcom/p1/mobile/putong/core/data/CoreGiftInfo;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->L0(Lcom/p1/mobile/putong/core/data/CoreGiftInfo;Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic j(Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->u0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic k(Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;Lcom/p1/mobile/putong/data/User;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->I0(Lcom/p1/mobile/putong/data/User;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic l(Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->s0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic m(Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->m0(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic n(Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->r0()V

    return-void
.end method

.method public static synthetic p(Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->O0()V

    return-void
.end method

.method public static synthetic q(Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;Lcom/p1/mobile/putong/core/data/CoreGiftInfo;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->P0(Lcom/p1/mobile/putong/core/data/CoreGiftInfo;Ll/uxj0;)V

    return-void
.end method

.method private synthetic r0()V
    .locals 5

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->E:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->g:Lv/VList;

    .line 6
    .line 7
    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->f:Lv/VFrame;

    .line 12
    .line 13
    invoke-virtual {v1}, Landroid/view/View;->getHeight()I

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    sub-int/2addr v0, v1

    .line 18
    iget v1, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->G:I

    .line 19
    .line 20
    add-int/2addr v0, v1

    .line 21
    iget v1, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->F:I

    .line 22
    .line 23
    sub-int v1, v0, v1

    .line 24
    .line 25
    if-lez v0, :cond_0

    .line 26
    .line 27
    if-lez v1, :cond_0

    .line 28
    .line 29
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->F:I

    .line 30
    .line 31
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->L:Landroid/view/animation/Interpolator;

    .line 32
    .line 33
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->g:Lv/VList;

    .line 34
    .line 35
    neg-int v0, v0

    .line 36
    int-to-float v0, v0

    .line 37
    const/4 v2, 0x1

    .line 38
    new-array v3, v2, [F

    .line 39
    .line 40
    const/4 v4, 0x0

    .line 41
    aput v0, v3, v4

    .line 42
    .line 43
    const-string v0, "translationY"

    .line 44
    .line 45
    invoke-static {p0, v0, v3}, Ll/gt0;->q(Landroid/view/View;Ljava/lang/String;[F)Landroid/animation/Animator;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    filled-new-array {p0}, [Landroid/animation/Animator;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    const-wide/16 v3, 0x0

    .line 54
    .line 55
    invoke-static {v2, v1, v3, v4, p0}, Ll/gt0;->u(ZLandroid/view/animation/Interpolator;J[Landroid/animation/Animator;)Landroid/animation/Animator;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    invoke-virtual {p0}, Landroid/animation/Animator;->start()V

    .line 60
    .line 61
    .line 62
    :cond_0
    return-void
.end method

.method public static synthetic s(Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;ILl/w6c0;Ljava/lang/Integer;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->o0(ILl/w6c0;Ljava/lang/Integer;)V

    return-void
.end method

.method private synthetic s0(Landroid/view/View;)V
    .locals 3

    .line 1
    new-instance p1, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel$4;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-direct {p1, p0, v0}, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel$4;-><init>(Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;Landroid/os/Handler;)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->x:Lcom/p1/mobile/putong/core/ui/greet/GreetAct;

    .line 8
    .line 9
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-virtual {v1}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->x:Lcom/p1/mobile/putong/core/ui/greet/GreetAct;

    .line 18
    .line 19
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->z:Lcom/p1/mobile/putong/core/ui/greet/a;

    .line 20
    .line 21
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/greet/c;->g0()Lcom/p1/mobile/putong/core/data/Greeting;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Greeting;->otherUser:Ljava/lang/String;

    .line 26
    .line 27
    invoke-interface {v1, v2, p0, p1}, Ll/r97;->j1(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Landroid/os/ResultReceiver;)Landroid/content/Intent;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-virtual {v0, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method private synthetic t0(Landroid/view/View;)V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-interface {p1}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->nq()Lrx/subjects/b;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 10
    .line 11
    invoke-virtual {p1, v0}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V

    .line 12
    .line 13
    .line 14
    const-string p1, "e_meet_back"

    .line 15
    .line 16
    const-string v0, "p_meet_back_pop"

    .line 17
    .line 18
    invoke-static {p1, v0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->x:Lcom/p1/mobile/putong/core/ui/greet/GreetAct;

    .line 22
    .line 23
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/greet/GreetAct;->finish()V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public static synthetic u(Landroid/view/View;)V
    .locals 1

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->r0:Lcom/p1/mobile/putong/core/api/j;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/j;->c0:Ll/jxd0;

    .line 6
    .line 7
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 8
    .line 9
    invoke-virtual {p0, v0}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method private synthetic u0(Landroid/view/View;)V
    .locals 4

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->X()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    invoke-interface {p1}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->M8()Z

    .line 9
    .line 10
    .line 11
    move-result p1

    .line 12
    if-eqz p1, :cond_1

    .line 13
    .line 14
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->x:Lcom/p1/mobile/putong/core/ui/greet/GreetAct;

    .line 19
    .line 20
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/greet/GreetAct;->c2()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-interface {p1, v0}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->Ui(Ljava/lang/String;)Z

    .line 25
    .line 26
    .line 27
    move-result p1

    .line 28
    if-eqz p1, :cond_1

    .line 29
    .line 30
    sget-object p1, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->Q:Ll/byd0;

    .line 31
    .line 32
    invoke-virtual {p1}, Ll/azd0;->get()Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    check-cast p1, Ljava/lang/Long;

    .line 37
    .line 38
    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    .line 39
    .line 40
    .line 41
    move-result-wide v0

    .line 42
    const-wide/16 v2, 0x0

    .line 43
    .line 44
    cmp-long p1, v0, v2

    .line 45
    .line 46
    if-eqz p1, :cond_0

    .line 47
    .line 48
    sget-object p1, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->Q:Ll/byd0;

    .line 49
    .line 50
    invoke-virtual {p1}, Ll/azd0;->get()Ljava/lang/Object;

    .line 51
    .line 52
    .line 53
    move-result-object p1

    .line 54
    check-cast p1, Ljava/lang/Long;

    .line 55
    .line 56
    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    .line 57
    .line 58
    .line 59
    move-result-wide v0

    .line 60
    invoke-static {}, Ll/pzi0;->o()J

    .line 61
    .line 62
    .line 63
    move-result-wide v2

    .line 64
    invoke-static {v0, v1, v2, v3}, Ll/i39;->b(JJ)Z

    .line 65
    .line 66
    .line 67
    move-result p1

    .line 68
    if-nez p1, :cond_1

    .line 69
    .line 70
    :cond_0
    sget-object p1, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->Q:Ll/byd0;

    .line 71
    .line 72
    invoke-static {}, Ll/pzi0;->o()J

    .line 73
    .line 74
    .line 75
    move-result-wide v0

    .line 76
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    invoke-virtual {p1, v0}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 81
    .line 82
    .line 83
    const-class p1, Landroid/app/Dialog;

    .line 84
    .line 85
    invoke-virtual {p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 86
    .line 87
    .line 88
    move-result-object p1

    .line 89
    const-string v0, "p_meet_back_pop"

    .line 90
    .line 91
    invoke-static {v0, p1}, Ll/w1e;->c(Ljava/lang/String;Ljava/lang/String;)Ll/l4g0;

    .line 92
    .line 93
    .line 94
    move-result-object p1

    .line 95
    new-instance v0, Ll/th0$a;

    .line 96
    .line 97
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->x:Lcom/p1/mobile/putong/core/ui/greet/GreetAct;

    .line 98
    .line 99
    invoke-direct {v0, v1}, Ll/th0$a;-><init>(Landroid/content/Context;)V

    .line 100
    .line 101
    .line 102
    const-string v1, "\u9000\u51fa\u540e\uff0c\u5c31\u9519\u8fc7\u8fd9\u6b21\u5076\u9047\u4e86\uff0c\u73cd\u60dc\u7f18\u5206\u6253\u4e2a\u62db\u547c\u5427"

    .line 103
    .line 104
    invoke-virtual {v0, v1}, Ll/th0$a;->j(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 105
    .line 106
    .line 107
    const/4 v1, 0x0

    .line 108
    invoke-virtual {v0, v1}, Ll/th0$a;->h(Z)Ll/th0$a;

    .line 109
    .line 110
    .line 111
    const-string v1, "\u518d\u770b\u770b"

    .line 112
    .line 113
    invoke-virtual {v0, v1}, Ll/th0$a;->r(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 114
    .line 115
    .line 116
    const-string v1, "\u786e\u5b9a\u9000\u51fa"

    .line 117
    .line 118
    invoke-virtual {v0, v1}, Ll/th0$a;->f(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 119
    .line 120
    .line 121
    new-instance v1, Ll/gbk;

    .line 122
    .line 123
    invoke-direct {v1, p1}, Ll/gbk;-><init>(Ll/l4g0;)V

    .line 124
    .line 125
    .line 126
    invoke-virtual {v0, v1}, Ll/th0$a;->m(Landroid/content/DialogInterface$OnDismissListener;)Ll/th0$a;

    .line 127
    .line 128
    .line 129
    new-instance v1, Ll/hbk;

    .line 130
    .line 131
    invoke-direct {v1, p0}, Ll/hbk;-><init>(Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;)V

    .line 132
    .line 133
    .line 134
    invoke-virtual {v0, v1}, Ll/th0$a;->c(Landroid/view/View$OnClickListener;)Ll/th0$a;

    .line 135
    .line 136
    .line 137
    new-instance p0, Ll/ibk;

    .line 138
    .line 139
    invoke-direct {p0}, Ll/ibk;-><init>()V

    .line 140
    .line 141
    .line 142
    invoke-virtual {v0, p0}, Ll/th0$a;->o(Landroid/view/View$OnClickListener;)Ll/th0$a;

    .line 143
    .line 144
    .line 145
    invoke-virtual {v0}, Ll/th0$a;->a()Ll/th0;

    .line 146
    .line 147
    .line 148
    move-result-object p0

    .line 149
    invoke-virtual {p0}, Ll/th0;->g()V

    .line 150
    .line 151
    .line 152
    invoke-static {p1}, Ll/w1e;->f(Ll/l4g0;)V

    .line 153
    .line 154
    .line 155
    return-void

    .line 156
    :cond_1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 157
    .line 158
    .line 159
    move-result-object p1

    .line 160
    invoke-interface {p1}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->M8()Z

    .line 161
    .line 162
    .line 163
    move-result p1

    .line 164
    if-eqz p1, :cond_2

    .line 165
    .line 166
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 167
    .line 168
    .line 169
    move-result-object p1

    .line 170
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->x:Lcom/p1/mobile/putong/core/ui/greet/GreetAct;

    .line 171
    .line 172
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/greet/GreetAct;->c2()Ljava/lang/String;

    .line 173
    .line 174
    .line 175
    move-result-object v0

    .line 176
    invoke-interface {p1, v0}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->Ui(Ljava/lang/String;)Z

    .line 177
    .line 178
    .line 179
    move-result p1

    .line 180
    if-eqz p1, :cond_2

    .line 181
    .line 182
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 183
    .line 184
    .line 185
    move-result-object p1

    .line 186
    invoke-interface {p1}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->nq()Lrx/subjects/b;

    .line 187
    .line 188
    .line 189
    move-result-object p1

    .line 190
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 191
    .line 192
    invoke-virtual {p1, v0}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V

    .line 193
    .line 194
    .line 195
    :cond_2
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->x:Lcom/p1/mobile/putong/core/ui/greet/GreetAct;

    .line 196
    .line 197
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/greet/GreetAct;->finish()V

    .line 198
    .line 199
    .line 200
    return-void
.end method

.method public static synthetic v(Ll/l4g0;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-static {p0}, Ll/w1e;->e(Ll/l4g0;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic w(Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;Lcom/p1/mobile/putong/core/data/Message;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->y0(Lcom/p1/mobile/putong/core/data/Message;)V

    return-void
.end method

.method private synthetic w0(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->n:Lv/VEditText;

    .line 2
    .line 3
    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->R0(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->n:Lv/VEditText;

    .line 19
    .line 20
    const-string p1, ""

    .line 21
    .line 22
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public static synthetic x(Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;Lcom/p1/mobile/putong/core/data/CoreGiftInfo;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->h1(Lcom/p1/mobile/putong/core/data/CoreGiftInfo;)V

    return-void
.end method

.method public static synthetic y(Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->B0()V

    return-void
.end method

.method public static synthetic z(Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->p0()V

    return-void
.end method


# virtual methods
.method public final synthetic A0(Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->M:Ljava/lang/Runnable;

    .line 2
    .line 3
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic B0()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->n1(Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->x:Lcom/p1/mobile/putong/core/ui/greet/GreetAct;

    .line 2
    .line 3
    return-object p0
.end method

.method public final synthetic D0(Lcom/p1/mobile/putong/core/data/CoreGiftInfo;ZLjava/lang/String;)V
    .locals 7

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->S()Lcom/p1/mobile/putong/core/ui/greet/GreetAct;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    check-cast v0, Landroid/view/ViewGroup;

    .line 14
    .line 15
    const-string v1, "gift_layer_view_tag"

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    check-cast v2, Lcom/p1/mobile/putong/core/ui/gift/layer/CoreGiftLayer;

    .line 22
    .line 23
    iput-object v2, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->y:Lcom/p1/mobile/putong/core/ui/gift/layer/CoreGiftLayer;

    .line 24
    .line 25
    const/4 v3, 0x0

    .line 26
    const/4 v4, 0x0

    .line 27
    if-nez v2, :cond_0

    .line 28
    .line 29
    new-instance v2, Landroid/widget/FrameLayout$LayoutParams;

    .line 30
    .line 31
    const/4 v5, -0x1

    .line 32
    invoke-direct {v2, v5, v5}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 33
    .line 34
    .line 35
    iget-object v5, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->x:Lcom/p1/mobile/putong/core/ui/greet/GreetAct;

    .line 36
    .line 37
    invoke-static {v5}, Ll/p9r;->a(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 38
    .line 39
    .line 40
    move-result-object v5

    .line 41
    sget v6, Ll/qec0;->K:I

    .line 42
    .line 43
    invoke-virtual {v5, v6, v4, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 44
    .line 45
    .line 46
    move-result-object v5

    .line 47
    check-cast v5, Lcom/p1/mobile/putong/core/ui/gift/layer/CoreGiftLayer;

    .line 48
    .line 49
    iput-object v5, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->y:Lcom/p1/mobile/putong/core/ui/gift/layer/CoreGiftLayer;

    .line 50
    .line 51
    invoke-virtual {v5, v1}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 52
    .line 53
    .line 54
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->y:Lcom/p1/mobile/putong/core/ui/gift/layer/CoreGiftLayer;

    .line 55
    .line 56
    invoke-virtual {v0, v1, v2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 57
    .line 58
    .line 59
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->y:Lcom/p1/mobile/putong/core/ui/gift/layer/CoreGiftLayer;

    .line 60
    .line 61
    invoke-virtual {v0, p1, v4}, Lcom/p1/mobile/putong/core/ui/gift/layer/CoreGiftLayer;->w(Lcom/p1/mobile/putong/core/data/CoreGiftInfo;Ll/x20;)V

    .line 62
    .line 63
    .line 64
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->y:Lcom/p1/mobile/putong/core/ui/gift/layer/CoreGiftLayer;

    .line 65
    .line 66
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/core/ui/gift/layer/CoreGiftLayer;->C(Z)V

    .line 67
    .line 68
    .line 69
    if-eqz p2, :cond_2

    .line 70
    .line 71
    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 72
    .line 73
    .line 74
    move-result p1

    .line 75
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->y:Lcom/p1/mobile/putong/core/ui/gift/layer/CoreGiftLayer;

    .line 76
    .line 77
    if-nez p1, :cond_1

    .line 78
    .line 79
    invoke-virtual {p2, p3}, Lcom/p1/mobile/putong/core/ui/gift/layer/CoreGiftLayer;->G(Ljava/lang/String;)V

    .line 80
    .line 81
    .line 82
    goto :goto_0

    .line 83
    :cond_1
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/ui/gift/layer/CoreGiftLayer;->n()V

    .line 84
    .line 85
    .line 86
    :goto_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->y:Lcom/p1/mobile/putong/core/ui/gift/layer/CoreGiftLayer;

    .line 87
    .line 88
    invoke-virtual {p0, v3}, Lcom/p1/mobile/putong/core/ui/gift/layer/CoreGiftLayer;->D(Z)V

    .line 89
    .line 90
    .line 91
    :cond_2
    return-void
.end method

.method public final synthetic E0()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->M:Ljava/lang/Runnable;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/lang/Runnable;->run()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->x:Lcom/p1/mobile/putong/core/ui/greet/GreetAct;

    .line 7
    .line 8
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/greet/GreetAct;->i2()Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->N:Ljava/lang/Runnable;

    .line 15
    .line 16
    invoke-interface {v0}, Ljava/lang/Runnable;->run()V

    .line 17
    .line 18
    .line 19
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->x:Lcom/p1/mobile/putong/core/ui/greet/GreetAct;

    .line 20
    .line 21
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/greet/GreetAct;->d2()Lcom/p1/mobile/putong/core/ui/greet/GreetingParam;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    iget v0, v0, Lcom/p1/mobile/putong/core/ui/greet/GreetingParam;->hotLevel:I

    .line 26
    .line 27
    const/4 v1, 0x1

    .line 28
    if-ge v0, v1, :cond_1

    .line 29
    .line 30
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->n:Lv/VEditText;

    .line 31
    .line 32
    invoke-virtual {v0}, Landroid/view/View;->requestFocus()Z

    .line 33
    .line 34
    .line 35
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->x:Lcom/p1/mobile/putong/core/ui/greet/GreetAct;

    .line 36
    .line 37
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->n:Lv/VEditText;

    .line 38
    .line 39
    const/4 v1, 0x0

    .line 40
    invoke-virtual {v0, p0, v1}, Lcom/p1/mobile/android/app/Act;->showInput(Landroid/view/View;I)Z

    .line 41
    .line 42
    .line 43
    return-void
.end method

.method public final synthetic G0(Lcom/p1/mobile/putong/data/User;Landroid/view/View;)V
    .locals 2

    .line 1
    const-string p2, "user_id"

    .line 2
    .line 3
    iget-object v0, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {p2, v0}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 6
    .line 7
    .line 8
    move-result-object p2

    .line 9
    filled-new-array {p2}, [Ll/sfj0$a;

    .line 10
    .line 11
    .line 12
    move-result-object p2

    .line 13
    const-string v0, "e_kankan_chat_head"

    .line 14
    .line 15
    const-string v1, "p_kankan_chat_popup"

    .line 16
    .line 17
    invoke-static {v0, v1, p2}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 18
    .line 19
    .line 20
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->z:Lcom/p1/mobile/putong/core/ui/greet/a;

    .line 21
    .line 22
    const-string p2, "from_greet_act"

    .line 23
    .line 24
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 25
    .line 26
    invoke-virtual {p0, p2, p1}, Lcom/p1/mobile/putong/core/ui/greet/a;->z1(Ljava/lang/String;Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public final synthetic H0(Lcom/p1/mobile/putong/data/User;Landroid/view/View;)V
    .locals 2

    .line 1
    const-string p2, "user_id"

    .line 2
    .line 3
    iget-object v0, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {p2, v0}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 6
    .line 7
    .line 8
    move-result-object p2

    .line 9
    filled-new-array {p2}, [Ll/sfj0$a;

    .line 10
    .line 11
    .line 12
    move-result-object p2

    .line 13
    const-string v0, "e_kankan_chat_head"

    .line 14
    .line 15
    const-string v1, "p_kankan_chat_popup"

    .line 16
    .line 17
    invoke-static {v0, v1, p2}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 18
    .line 19
    .line 20
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->z:Lcom/p1/mobile/putong/core/ui/greet/a;

    .line 21
    .line 22
    const-string p2, "from_greet_act"

    .line 23
    .line 24
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 25
    .line 26
    invoke-virtual {p0, p2, p1}, Lcom/p1/mobile/putong/core/ui/greet/a;->z1(Ljava/lang/String;Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public final synthetic I0(Lcom/p1/mobile/putong/data/User;Landroid/view/View;)V
    .locals 2

    .line 1
    const-string p2, "user_id"

    .line 2
    .line 3
    iget-object v0, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {p2, v0}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 6
    .line 7
    .line 8
    move-result-object p2

    .line 9
    filled-new-array {p2}, [Ll/sfj0$a;

    .line 10
    .line 11
    .line 12
    move-result-object p2

    .line 13
    const-string v0, "e_kankan_chat_head"

    .line 14
    .line 15
    const-string v1, "p_kankan_chat_popup"

    .line 16
    .line 17
    invoke-static {v0, v1, p2}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 18
    .line 19
    .line 20
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->z:Lcom/p1/mobile/putong/core/ui/greet/a;

    .line 21
    .line 22
    const-string p2, "from_greet_act"

    .line 23
    .line 24
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 25
    .line 26
    invoke-virtual {p0, p2, p1}, Lcom/p1/mobile/putong/core/ui/greet/a;->z1(Ljava/lang/String;Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public final synthetic J0(Lcom/p1/mobile/putong/core/data/CoreGiftInfo;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->z:Lcom/p1/mobile/putong/core/ui/greet/a;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/greet/a;->E1(Lcom/p1/mobile/putong/core/data/CoreGiftInfo;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic K0(Ljava/lang/String;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->n:Lv/VEditText;

    .line 2
    .line 3
    const-string v1, ""

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->j1(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-virtual {p0}, Ll/j49;->g()Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-interface {p0}, Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;->Xe()V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public final synthetic L0(Lcom/p1/mobile/putong/core/data/CoreGiftInfo;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->r1(Lcom/p1/mobile/putong/core/data/CoreGiftInfo;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic M0(Ljava/lang/String;)V
    .locals 1

    .line 1
    const-string v0, "bubble_say_hi_gift_first_guide"

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    const/4 p1, 0x0

    .line 10
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->K:Z

    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public final synthetic N0(Lcom/p1/mobile/putong/core/data/CoreGiftInfo;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->z:Lcom/p1/mobile/putong/core/ui/greet/a;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/greet/a;->E1(Lcom/p1/mobile/putong/core/data/CoreGiftInfo;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic O0()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->u:Lv/VIcon;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->performClick()Z

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic P0(Lcom/p1/mobile/putong/core/data/CoreGiftInfo;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    invoke-virtual {p2}, Ll/j49;->g()Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;

    .line 6
    .line 7
    .line 8
    move-result-object p2

    .line 9
    invoke-interface {p2}, Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;->Fh()I

    .line 10
    .line 11
    .line 12
    move-result p2

    .line 13
    if-lez p2, :cond_0

    .line 14
    .line 15
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->e1(Lcom/p1/mobile/putong/core/data/CoreGiftInfo;)V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public final synthetic Q0(Ljava/lang/String;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    invoke-virtual {p2}, Ll/j49;->g()Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;

    .line 6
    .line 7
    .line 8
    move-result-object p2

    .line 9
    invoke-interface {p2}, Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;->Fh()I

    .line 10
    .line 11
    .line 12
    move-result p2

    .line 13
    if-lez p2, :cond_0

    .line 14
    .line 15
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->g1(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public R(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/cck;->b(Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public R0(Ljava/lang/String;)V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->x:Lcom/p1/mobile/putong/core/ui/greet/GreetAct;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/greet/GreetAct;->h2()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const-string v1, ""

    .line 8
    .line 9
    if-nez v0, :cond_2

    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->x:Lcom/p1/mobile/putong/core/ui/greet/GreetAct;

    .line 12
    .line 13
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/greet/GreetAct;->k2()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->z:Lcom/p1/mobile/putong/core/ui/greet/a;

    .line 21
    .line 22
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/greet/a;->S0()Lcom/p1/mobile/putong/data/User;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    if-eqz v0, :cond_1

    .line 31
    .line 32
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->x:Lcom/p1/mobile/putong/core/ui/greet/GreetAct;

    .line 33
    .line 34
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 35
    .line 36
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 37
    .line 38
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->z:Lcom/p1/mobile/putong/core/ui/greet/a;

    .line 39
    .line 40
    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/ui/greet/a;->R0()Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object v3

    .line 44
    iget-object v4, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->z:Lcom/p1/mobile/putong/core/ui/greet/a;

    .line 45
    .line 46
    invoke-virtual {v4}, Lcom/p1/mobile/putong/core/ui/greet/a;->S0()Lcom/p1/mobile/putong/data/User;

    .line 47
    .line 48
    .line 49
    move-result-object v4

    .line 50
    iget-object v4, v4, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 51
    .line 52
    invoke-virtual {v2, v3, v4}, Lcom/p1/mobile/putong/core/api/g;->Cg(Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 53
    .line 54
    .line 55
    move-result-object v2

    .line 56
    invoke-virtual {v0, v2}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    const/4 v2, 0x1

    .line 61
    invoke-virtual {v0, v2}, Lrx/c;->take(I)Lrx/c;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    new-instance v2, Ll/dbk;

    .line 66
    .line 67
    invoke-direct {v2, p0, p1, v1, v1}, Ll/dbk;-><init>(Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 68
    .line 69
    .line 70
    invoke-static {v2}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 71
    .line 72
    .line 73
    move-result-object p0

    .line 74
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 75
    .line 76
    .line 77
    return-void

    .line 78
    :cond_1
    invoke-virtual {p0, p1, v1, v1}, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->S0(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 79
    .line 80
    .line 81
    return-void

    .line 82
    :cond_2
    :goto_0
    invoke-virtual {p0, p1, v1, v1}, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->S0(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 83
    .line 84
    .line 85
    return-void
.end method

.method public S()Lcom/p1/mobile/putong/core/ui/greet/GreetAct;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->x:Lcom/p1/mobile/putong/core/ui/greet/GreetAct;

    .line 2
    .line 3
    return-object p0
.end method

.method public S0(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->g:Lv/VList;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/core/data/Message;->new_()Lcom/p1/mobile/putong/core/data/Message;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    const-string v1, "text"

    .line 15
    .line 16
    invoke-static {v1}, Lcom/p1/mobile/putong/core/data/MessageType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/MessageType;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 21
    .line 22
    iput-object p1, v0, Lcom/p1/mobile/putong/core/data/Message;->value:Ljava/lang/String;

    .line 23
    .line 24
    iput-object p2, v0, Lcom/p1/mobile/putong/core/data/Message;->consumeType:Ljava/lang/String;

    .line 25
    .line 26
    iput-object p3, v0, Lcom/p1/mobile/putong/core/data/Message;->coinSign:Ljava/lang/String;

    .line 27
    .line 28
    new-instance p1, Ll/mbk;

    .line 29
    .line 30
    invoke-direct {p1, p0, v0}, Ll/mbk;-><init>(Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;Lcom/p1/mobile/putong/core/data/Message;)V

    .line 31
    .line 32
    .line 33
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->g:Lv/VList;

    .line 34
    .line 35
    invoke-virtual {p2}, Landroid/widget/AdapterView;->getLastVisiblePosition()I

    .line 36
    .line 37
    .line 38
    move-result p2

    .line 39
    iget-object p3, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->g:Lv/VList;

    .line 40
    .line 41
    invoke-virtual {p3}, Landroid/widget/AdapterView;->getCount()I

    .line 42
    .line 43
    .line 44
    move-result p3

    .line 45
    add-int/lit8 p3, p3, -0x1

    .line 46
    .line 47
    if-ne p2, p3, :cond_1

    .line 48
    .line 49
    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    .line 50
    .line 51
    .line 52
    return-void

    .line 53
    :cond_1
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->g:Lv/VList;

    .line 54
    .line 55
    invoke-virtual {p2}, Landroid/widget/AdapterView;->getCount()I

    .line 56
    .line 57
    .line 58
    move-result p3

    .line 59
    add-int/lit8 p3, p3, -0x1

    .line 60
    .line 61
    const/16 v0, -0x2710

    .line 62
    .line 63
    invoke-virtual {p2, p3, v0}, Landroid/widget/AbsListView;->smoothScrollToPositionFromTop(II)V

    .line 64
    .line 65
    .line 66
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->g:Lv/VList;

    .line 67
    .line 68
    const-wide/16 p2, 0xc8

    .line 69
    .line 70
    invoke-virtual {p0, p1, p2, p3}, Landroid/view/View;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 71
    .line 72
    .line 73
    return-void
.end method

.method public T0()V
    .locals 4

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->O:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    const/4 v0, 0x1

    .line 7
    filled-new-array {v0}, [I

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-static {v1}, Landroid/animation/ValueAnimator;->ofInt([I)Landroid/animation/ValueAnimator;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    const-wide/16 v2, 0x186

    .line 16
    .line 17
    invoke-virtual {v1, v2, v3}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    new-instance v2, Ll/zak;

    .line 22
    .line 23
    invoke-direct {v2, p0}, Ll/zak;-><init>(Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {v1, v2}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 27
    .line 28
    .line 29
    new-instance v2, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel$c;

    .line 30
    .line 31
    invoke-direct {v2, p0}, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel$c;-><init>(Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {v1, v2}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {v1}, Landroid/animation/ValueAnimator;->start()V

    .line 38
    .line 39
    .line 40
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->O:Z

    .line 41
    .line 42
    return-void
.end method

.method public U(I)V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->d:Lv/VFrame;

    .line 2
    .line 3
    sget v1, Ll/qa00;->t:I

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    const/4 v3, 0x1

    .line 7
    if-le p1, v1, :cond_0

    .line 8
    .line 9
    move v4, v3

    .line 10
    goto :goto_0

    .line 11
    :cond_0
    move v4, v2

    .line 12
    :goto_0
    invoke-virtual {v0, v4}, Landroid/view/ViewGroup;->setClipChildren(Z)V

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->d:Lv/VFrame;

    .line 16
    .line 17
    if-le p1, v1, :cond_1

    .line 18
    .line 19
    move v2, v3

    .line 20
    :cond_1
    invoke-virtual {v0, v2}, Landroid/view/ViewGroup;->setClipToPadding(Z)V

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->A:Ll/tul;

    .line 24
    .line 25
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->r:Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;

    .line 26
    .line 27
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->s:Lv/VImage;

    .line 28
    .line 29
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->t:Lv/VText;

    .line 30
    .line 31
    invoke-interface {v0, v1, v2, p0, p1}, Ll/tul;->b(Landroid/view/View;Lv/VImage;Lv/VText;I)V

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public U0(Landroid/view/View;)V
    .locals 0

    .line 1
    return-void
.end method

.method public V(Lcom/p1/mobile/putong/core/ui/greet/a;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->z:Lcom/p1/mobile/putong/core/ui/greet/a;

    .line 2
    .line 3
    return-void
.end method

.method public V0(I)V
    .locals 7

    .line 1
    const/4 v0, 0x0

    .line 2
    if-nez p1, :cond_0

    .line 3
    .line 4
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->E:Z

    .line 5
    .line 6
    if-eqz v1, :cond_0

    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->g0()V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->n1(Z)V

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    if-lez p1, :cond_3

    .line 16
    .line 17
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->G:I

    .line 18
    .line 19
    const/4 v1, 0x1

    .line 20
    iput-boolean v1, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->E:Z

    .line 21
    .line 22
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->g:Lv/VList;

    .line 23
    .line 24
    invoke-virtual {v2}, Landroid/view/View;->getHeight()I

    .line 25
    .line 26
    .line 27
    move-result v2

    .line 28
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->f:Lv/VFrame;

    .line 29
    .line 30
    invoke-virtual {v3}, Landroid/view/View;->getHeight()I

    .line 31
    .line 32
    .line 33
    move-result v3

    .line 34
    sub-int/2addr v2, v3

    .line 35
    add-int/2addr v2, p1

    .line 36
    iput v2, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->F:I

    .line 37
    .line 38
    if-gez v2, :cond_1

    .line 39
    .line 40
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->F:I

    .line 41
    .line 42
    :cond_1
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->L:Landroid/view/animation/Interpolator;

    .line 43
    .line 44
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->g:Lv/VList;

    .line 45
    .line 46
    iget v4, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->F:I

    .line 47
    .line 48
    neg-int v4, v4

    .line 49
    int-to-float v4, v4

    .line 50
    new-array v5, v1, [F

    .line 51
    .line 52
    aput v4, v5, v0

    .line 53
    .line 54
    const-string v4, "translationY"

    .line 55
    .line 56
    invoke-static {v3, v4, v5}, Ll/gt0;->q(Landroid/view/View;Ljava/lang/String;[F)Landroid/animation/Animator;

    .line 57
    .line 58
    .line 59
    move-result-object v3

    .line 60
    iget-object v5, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->i:Landroid/widget/RelativeLayout;

    .line 61
    .line 62
    neg-int p1, p1

    .line 63
    int-to-float p1, p1

    .line 64
    new-array v6, v1, [F

    .line 65
    .line 66
    aput p1, v6, v0

    .line 67
    .line 68
    invoke-static {v5, v4, v6}, Ll/gt0;->q(Landroid/view/View;Ljava/lang/String;[F)Landroid/animation/Animator;

    .line 69
    .line 70
    .line 71
    move-result-object p1

    .line 72
    filled-new-array {v3, p1}, [Landroid/animation/Animator;

    .line 73
    .line 74
    .line 75
    move-result-object p1

    .line 76
    const-wide/16 v3, 0x186

    .line 77
    .line 78
    invoke-static {v1, v2, v3, v4, p1}, Ll/gt0;->u(ZLandroid/view/animation/Interpolator;J[Landroid/animation/Animator;)Landroid/animation/Animator;

    .line 79
    .line 80
    .line 81
    move-result-object p1

    .line 82
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->x:Lcom/p1/mobile/putong/core/ui/greet/GreetAct;

    .line 83
    .line 84
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/greet/GreetAct;->i2()Z

    .line 85
    .line 86
    .line 87
    move-result v0

    .line 88
    if-eqz v0, :cond_2

    .line 89
    .line 90
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->N:Ljava/lang/Runnable;

    .line 91
    .line 92
    goto :goto_0

    .line 93
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->M:Ljava/lang/Runnable;

    .line 94
    .line 95
    :goto_0
    invoke-static {p1, v0}, Ll/gt0;->f(Landroid/animation/Animator;Ljava/lang/Runnable;)Landroid/animation/Animator;

    .line 96
    .line 97
    .line 98
    move-result-object p1

    .line 99
    invoke-virtual {p1}, Landroid/animation/Animator;->start()V

    .line 100
    .line 101
    .line 102
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->T0()V

    .line 103
    .line 104
    .line 105
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->k:Lv/VLinear;

    .line 106
    .line 107
    new-instance v0, Ll/ebk;

    .line 108
    .line 109
    invoke-direct {v0, p0}, Ll/ebk;-><init>(Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;)V

    .line 110
    .line 111
    .line 112
    const-wide/16 v1, 0x1f4

    .line 113
    .line 114
    invoke-virtual {p1, v0, v1, v2}, Landroid/view/View;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 115
    .line 116
    .line 117
    :cond_3
    return-void
.end method

.method public final W(Ljava/lang/String;)V
    .locals 3

    .line 1
    invoke-static {}, Ll/joa;->N3()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_2

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->k0()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->n:Lv/VEditText;

    .line 15
    .line 16
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->n:Lv/VEditText;

    .line 20
    .line 21
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setSelection(I)V

    .line 26
    .line 27
    .line 28
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    invoke-virtual {v0}, Ll/j49;->g()Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;->Fh()I

    .line 37
    .line 38
    .line 39
    move-result v0

    .line 40
    if-lez v0, :cond_1

    .line 41
    .line 42
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->g1(Ljava/lang/String;)V

    .line 43
    .line 44
    .line 45
    return-void

    .line 46
    :cond_1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    invoke-virtual {v0}, Ll/j49;->g()Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->x:Lcom/p1/mobile/putong/core/ui/greet/GreetAct;

    .line 55
    .line 56
    new-instance v2, Ll/nbk;

    .line 57
    .line 58
    invoke-direct {v2, p0, p1}, Ll/nbk;-><init>(Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;Ljava/lang/String;)V

    .line 59
    .line 60
    .line 61
    const-string p0, "p_chat_greet,greet"

    .line 62
    .line 63
    invoke-interface {v0, v1, p0, v2}, Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;->Pk(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ll/y20;)V

    .line 64
    .line 65
    .line 66
    return-void

    .line 67
    :cond_2
    :goto_0
    const-string v0, "privilege"

    .line 68
    .line 69
    const-string v1, ""

    .line 70
    .line 71
    invoke-virtual {p0, p1, v0, v1}, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->S0(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 72
    .line 73
    .line 74
    return-void
.end method

.method public W0(Z)V
    .locals 2

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->z:Lcom/p1/mobile/putong/core/ui/greet/a;

    .line 4
    .line 5
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/greet/a;->t1()Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->P:Landroid/widget/PopupWindow;

    .line 12
    .line 13
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    if-eqz p1, :cond_0

    .line 18
    .line 19
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->P:Landroid/widget/PopupWindow;

    .line 20
    .line 21
    invoke-virtual {p1}, Landroid/widget/PopupWindow;->isShowing()Z

    .line 22
    .line 23
    .line 24
    move-result p1

    .line 25
    if-nez p1, :cond_0

    .line 26
    .line 27
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->P:Landroid/widget/PopupWindow;

    .line 28
    .line 29
    new-instance v0, Landroid/graphics/drawable/ColorDrawable;

    .line 30
    .line 31
    const/4 v1, 0x0

    .line 32
    invoke-direct {v0, v1}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {p1, v0}, Landroid/widget/PopupWindow;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 36
    .line 37
    .line 38
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->P:Landroid/widget/PopupWindow;

    .line 39
    .line 40
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->x:Lcom/p1/mobile/putong/core/ui/greet/GreetAct;

    .line 41
    .line 42
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    invoke-virtual {p0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    invoke-virtual {p1, p0, v1, v1, v1}, Landroid/widget/PopupWindow;->showAtLocation(Landroid/view/View;III)V

    .line 51
    .line 52
    .line 53
    :cond_0
    return-void
.end method

.method public X()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->x:Lcom/p1/mobile/putong/core/ui/greet/GreetAct;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->n:Lv/VEditText;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->hideInput(Landroid/view/View;)Z

    .line 6
    .line 7
    .line 8
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->K:Z

    .line 9
    .line 10
    if-eqz p0, :cond_0

    .line 11
    .line 12
    invoke-static {}, Lcom/p1/mobile/android/ui/bubble/d;->l()Lcom/p1/mobile/android/ui/bubble/d;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    const-string v0, "bubble_say_hi_gift_first_guide"

    .line 17
    .line 18
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/ui/bubble/d;->k(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    :cond_0
    return-void
.end method

.method public X0(Lcom/p1/mobile/putong/core/data/CoreGiftInfo;ZLjava/lang/String;Z)V
    .locals 1

    .line 1
    iget-boolean p4, p1, Lcom/p1/mobile/putong/core/data/CoreGiftInfo;->dynamicGift:Z

    .line 2
    .line 3
    if-eqz p4, :cond_0

    .line 4
    .line 5
    iget-object p4, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->x:Lcom/p1/mobile/putong/core/ui/greet/GreetAct;

    .line 6
    .line 7
    new-instance v0, Ll/kbk;

    .line 8
    .line 9
    invoke-direct {v0, p0, p1, p2, p3}, Ll/kbk;-><init>(Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;Lcom/p1/mobile/putong/core/data/CoreGiftInfo;ZLjava/lang/String;)V

    .line 10
    .line 11
    .line 12
    invoke-static {p4, v0}, Ll/l51;->F(Landroid/content/Context;Ljava/lang/Runnable;)V

    .line 13
    .line 14
    .line 15
    :cond_0
    return-void
.end method

.method public final Y()Landroid/view/View;
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->x:Lcom/p1/mobile/putong/core/ui/greet/GreetAct;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/greet/GreetAct;->h2()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->x:Lcom/p1/mobile/putong/core/ui/greet/GreetAct;

    .line 10
    .line 11
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/greet/GreetAct;->e2()Lcom/p1/mobile/putong/core/ui/greet/a;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/greet/c;->g0()Lcom/p1/mobile/putong/core/data/Greeting;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/Greeting;->actorUserId:Ljava/lang/String;

    .line 20
    .line 21
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    invoke-interface {v1}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    if-eqz v0, :cond_0

    .line 34
    .line 35
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    invoke-virtual {v0}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    invoke-interface {v0}, Ll/r97;->e()Z

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    if-nez v0, :cond_0

    .line 48
    .line 49
    sget v0, Ll/qec0;->s:I

    .line 50
    .line 51
    goto :goto_0

    .line 52
    :cond_0
    sget v0, Ll/qec0;->w4:I

    .line 53
    .line 54
    :goto_0
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->x:Lcom/p1/mobile/putong/core/ui/greet/GreetAct;

    .line 55
    .line 56
    invoke-virtual {v1}, Lcom/p1/mobile/putong/app/PutongAct;->inflater()Landroid/view/LayoutInflater;

    .line 57
    .line 58
    .line 59
    move-result-object v1

    .line 60
    const/4 v2, 0x0

    .line 61
    invoke-virtual {v1, v0, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    check-cast v0, Ll/tul;

    .line 66
    .line 67
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->A:Ll/tul;

    .line 68
    .line 69
    new-instance v0, Ll/adk;

    .line 70
    .line 71
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->S()Lcom/p1/mobile/putong/core/ui/greet/GreetAct;

    .line 72
    .line 73
    .line 74
    move-result-object v1

    .line 75
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->z:Lcom/p1/mobile/putong/core/ui/greet/a;

    .line 76
    .line 77
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->A:Ll/tul;

    .line 78
    .line 79
    invoke-direct {v0, v1, v2, v3}, Ll/adk;-><init>(Lcom/p1/mobile/putong/core/ui/greet/GreetAct;Lcom/p1/mobile/putong/core/ui/greet/a;Ll/tul;)V

    .line 80
    .line 81
    .line 82
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->B:Ll/adk;

    .line 83
    .line 84
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->A:Ll/tul;

    .line 85
    .line 86
    check-cast p0, Landroid/view/View;

    .line 87
    .line 88
    return-object p0
.end method

.method public Y0(Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/Message;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->C:Ll/kdk;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->C:Ll/kdk;

    .line 11
    .line 12
    invoke-virtual {v0, p1}, Ll/kdk;->A(Ljava/util/List;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->j0()Z

    .line 16
    .line 17
    .line 18
    move-result p1

    .line 19
    if-eqz p1, :cond_1

    .line 20
    .line 21
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->g:Lv/VList;

    .line 22
    .line 23
    const v0, 0x7fffffff

    .line 24
    .line 25
    .line 26
    invoke-virtual {p1, v0}, Landroid/widget/AdapterView;->setSelection(I)V

    .line 27
    .line 28
    .line 29
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->g:Lv/VList;

    .line 30
    .line 31
    invoke-virtual {p1}, Landroid/widget/AdapterView;->getCount()I

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    add-int/lit8 v0, v0, -0x1

    .line 36
    .line 37
    const/16 v1, -0x2710

    .line 38
    .line 39
    invoke-virtual {p1, v0, v1}, Landroid/widget/AbsListView;->smoothScrollToPositionFromTop(II)V

    .line 40
    .line 41
    .line 42
    const/4 p1, 0x0

    .line 43
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->D:Z

    .line 44
    .line 45
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->g:Lv/VList;

    .line 46
    .line 47
    new-instance v0, Ll/fbk;

    .line 48
    .line 49
    invoke-direct {v0, p0}, Ll/fbk;-><init>(Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;)V

    .line 50
    .line 51
    .line 52
    invoke-virtual {p1, v0}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 53
    .line 54
    .line 55
    :cond_1
    :goto_0
    return-void
.end method

.method public Z()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->P:Landroid/widget/PopupWindow;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->P:Landroid/widget/PopupWindow;

    .line 10
    .line 11
    invoke-virtual {v0}, Landroid/widget/PopupWindow;->isShowing()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->P:Landroid/widget/PopupWindow;

    .line 18
    .line 19
    invoke-virtual {v0}, Landroid/widget/PopupWindow;->dismiss()V

    .line 20
    .line 21
    .line 22
    const/4 v0, 0x0

    .line 23
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->P:Landroid/widget/PopupWindow;

    .line 24
    .line 25
    :cond_0
    return-void
.end method

.method public Z0(Lcom/p1/mobile/putong/data/User;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->x:Lcom/p1/mobile/putong/core/ui/greet/GreetAct;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/greet/GreetAct;->h2()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 10
    .line 11
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 12
    .line 13
    invoke-virtual {v0}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->n:Lv/VEditText;

    .line 22
    .line 23
    if-eqz v0, :cond_0

    .line 24
    .line 25
    const-string v0, "\u771f\u8bda\u4ea4\u53cb\uff0c\u8ba4\u771f\u6253\u4e2a\u62db\u547c\u5427"

    .line 26
    .line 27
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setHint(Ljava/lang/CharSequence;)V

    .line 28
    .line 29
    .line 30
    goto/16 :goto_0

    .line 31
    .line 32
    :cond_0
    const-string v0, "\u56de\u590d\u5373\u53ef\u4e0e\u5979\u914d\u5bf9"

    .line 33
    .line 34
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setHint(Ljava/lang/CharSequence;)V

    .line 35
    .line 36
    .line 37
    goto/16 :goto_0

    .line 38
    .line 39
    :cond_1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->l0()Z

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    if-eqz v0, :cond_2

    .line 44
    .line 45
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->z:Lcom/p1/mobile/putong/core/ui/greet/a;

    .line 46
    .line 47
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/greet/c;->g0()Lcom/p1/mobile/putong/core/data/Greeting;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 52
    .line 53
    .line 54
    move-result v0

    .line 55
    if-eqz v0, :cond_2

    .line 56
    .line 57
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->n:Lv/VEditText;

    .line 58
    .line 59
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->d0(Lcom/p1/mobile/putong/data/User;)Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object v1

    .line 63
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setHint(Ljava/lang/CharSequence;)V

    .line 64
    .line 65
    .line 66
    goto/16 :goto_0

    .line 67
    .line 68
    :cond_2
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    invoke-virtual {v0}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 73
    .line 74
    .line 75
    move-result-object v0

    .line 76
    invoke-interface {v0}, Ll/r97;->F()Z

    .line 77
    .line 78
    .line 79
    move-result v0

    .line 80
    if-eqz v0, :cond_4

    .line 81
    .line 82
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->z:Lcom/p1/mobile/putong/core/ui/greet/a;

    .line 83
    .line 84
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/greet/c;->g0()Lcom/p1/mobile/putong/core/data/Greeting;

    .line 85
    .line 86
    .line 87
    move-result-object v0

    .line 88
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 89
    .line 90
    .line 91
    move-result v0

    .line 92
    if-eqz v0, :cond_4

    .line 93
    .line 94
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 95
    .line 96
    .line 97
    move-result-object v0

    .line 98
    invoke-interface {v0}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 99
    .line 100
    .line 101
    move-result-object v0

    .line 102
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->z:Lcom/p1/mobile/putong/core/ui/greet/a;

    .line 103
    .line 104
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/greet/c;->g0()Lcom/p1/mobile/putong/core/data/Greeting;

    .line 105
    .line 106
    .line 107
    move-result-object v1

    .line 108
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/Greeting;->actorUserId:Ljava/lang/String;

    .line 109
    .line 110
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 111
    .line 112
    .line 113
    move-result v0

    .line 114
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->n:Lv/VEditText;

    .line 115
    .line 116
    if-eqz v0, :cond_3

    .line 117
    .line 118
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 119
    .line 120
    .line 121
    move-result v0

    .line 122
    invoke-static {v0}, Ll/h39;->j(Z)Ljava/lang/String;

    .line 123
    .line 124
    .line 125
    move-result-object v0

    .line 126
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setHint(Ljava/lang/CharSequence;)V

    .line 127
    .line 128
    .line 129
    goto :goto_0

    .line 130
    :cond_3
    const-string v0, "\u8bf7\u8f93\u5165\u6d88\u606f..."

    .line 131
    .line 132
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setHint(Ljava/lang/CharSequence;)V

    .line 133
    .line 134
    .line 135
    goto :goto_0

    .line 136
    :cond_4
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->x:Lcom/p1/mobile/putong/core/ui/greet/GreetAct;

    .line 137
    .line 138
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/greet/GreetAct;->i2()Z

    .line 139
    .line 140
    .line 141
    move-result v0

    .line 142
    const-string v1, "\u8f93\u5165\u65b0\u6d88\u606f"

    .line 143
    .line 144
    if-eqz v0, :cond_5

    .line 145
    .line 146
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->n:Lv/VEditText;

    .line 147
    .line 148
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setHint(Ljava/lang/CharSequence;)V

    .line 149
    .line 150
    .line 151
    goto :goto_0

    .line 152
    :cond_5
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->z:Lcom/p1/mobile/putong/core/ui/greet/a;

    .line 153
    .line 154
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/greet/c;->g0()Lcom/p1/mobile/putong/core/data/Greeting;

    .line 155
    .line 156
    .line 157
    move-result-object v0

    .line 158
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 159
    .line 160
    .line 161
    move-result v0

    .line 162
    if-eqz v0, :cond_6

    .line 163
    .line 164
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->z:Lcom/p1/mobile/putong/core/ui/greet/a;

    .line 165
    .line 166
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/greet/c;->g0()Lcom/p1/mobile/putong/core/data/Greeting;

    .line 167
    .line 168
    .line 169
    move-result-object v0

    .line 170
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/Greeting;->moment:Lcom/p1/mobile/putong/data/IdBoxed;

    .line 171
    .line 172
    iget-object v0, v0, Lcom/p1/mobile/putong/data/IdBoxed;->id:Ljava/lang/String;

    .line 173
    .line 174
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 175
    .line 176
    .line 177
    move-result v0

    .line 178
    if-nez v0, :cond_6

    .line 179
    .line 180
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->n:Lv/VEditText;

    .line 181
    .line 182
    const-string v1, "\u901a\u8fc7\u52a8\u6001\u627e\u8bdd\u9898\uff0c\u66f4\u5bb9\u6613\u5f97\u5230\u56de\u590d"

    .line 183
    .line 184
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setHint(Ljava/lang/CharSequence;)V

    .line 185
    .line 186
    .line 187
    goto :goto_0

    .line 188
    :cond_6
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->n:Lv/VEditText;

    .line 189
    .line 190
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setHint(Ljava/lang/CharSequence;)V

    .line 191
    .line 192
    .line 193
    :goto_0
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 194
    .line 195
    .line 196
    move-result v0

    .line 197
    if-eqz v0, :cond_8

    .line 198
    .line 199
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 200
    .line 201
    .line 202
    move-result v0

    .line 203
    if-eqz v0, :cond_7

    .line 204
    .line 205
    const-string v0, "\u5979"

    .line 206
    .line 207
    goto :goto_1

    .line 208
    :cond_7
    const-string v0, "\u4ed6"

    .line 209
    .line 210
    :goto_1
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 211
    .line 212
    .line 213
    move-result-object v0

    .line 214
    const-string v1, "85%%\u7684\u7537\u6027\u53d1\u51fa\u201chi\u201d\u540e\uff0c\u4e0d\u4f1a\u6536\u5230\u56de\u590d\uff0c\u804a\u804a%s\u7684\u52a8\u6001\uff0c\u66f4\u5bb9\u6613\u5f97\u5230\u56de\u590d"

    .line 215
    .line 216
    invoke-static {v1, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 217
    .line 218
    .line 219
    move-result-object v0

    .line 220
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->H:Ljava/lang/String;

    .line 221
    .line 222
    :cond_8
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->r:Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;

    .line 223
    .line 224
    const/4 v1, 0x1

    .line 225
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 226
    .line 227
    .line 228
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->t:Lv/VText;

    .line 229
    .line 230
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 231
    .line 232
    .line 233
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->s:Lv/VImage;

    .line 234
    .line 235
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 236
    .line 237
    .line 238
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->z:Lcom/p1/mobile/putong/core/ui/greet/a;

    .line 239
    .line 240
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/greet/a;->N1()Z

    .line 241
    .line 242
    .line 243
    move-result v0

    .line 244
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->r:Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;

    .line 245
    .line 246
    if-eqz v0, :cond_9

    .line 247
    .line 248
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->getAnonymousUrl()Ljava/lang/String;

    .line 249
    .line 250
    .line 251
    move-result-object v0

    .line 252
    invoke-virtual {v1, v0}, Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;->B0(Ljava/lang/String;)V

    .line 253
    .line 254
    .line 255
    goto :goto_2

    .line 256
    :cond_9
    invoke-static {p1}, Ll/ux6;->b(Lcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/putong/data/Picture;

    .line 257
    .line 258
    .line 259
    move-result-object v0

    .line 260
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 261
    .line 262
    .line 263
    move-result-object v0

    .line 264
    invoke-virtual {v1, p1, v0}, Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;->v0(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/Picture$ImageUri;)V

    .line 265
    .line 266
    .line 267
    :goto_2
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->t:Lv/VText;

    .line 268
    .line 269
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 270
    .line 271
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 272
    .line 273
    .line 274
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->A:Ll/tul;

    .line 275
    .line 276
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->z:Lcom/p1/mobile/putong/core/ui/greet/a;

    .line 277
    .line 278
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/greet/a;->N1()Z

    .line 279
    .line 280
    .line 281
    move-result v1

    .line 282
    invoke-interface {v0, p1, v1}, Ll/tul;->c(Lcom/p1/mobile/putong/data/User;Z)V

    .line 283
    .line 284
    .line 285
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->r:Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;

    .line 286
    .line 287
    new-instance v1, Ll/xbk;

    .line 288
    .line 289
    invoke-direct {v1, p0, p1}, Ll/xbk;-><init>(Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;Lcom/p1/mobile/putong/data/User;)V

    .line 290
    .line 291
    .line 292
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 293
    .line 294
    .line 295
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->t:Lv/VText;

    .line 296
    .line 297
    new-instance v1, Ll/ybk;

    .line 298
    .line 299
    invoke-direct {v1, p0, p1}, Ll/ybk;-><init>(Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;Lcom/p1/mobile/putong/data/User;)V

    .line 300
    .line 301
    .line 302
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 303
    .line 304
    .line 305
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->A:Ll/tul;

    .line 306
    .line 307
    new-instance v1, Ll/zbk;

    .line 308
    .line 309
    invoke-direct {v1, p0, p1}, Ll/zbk;-><init>(Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;Lcom/p1/mobile/putong/data/User;)V

    .line 310
    .line 311
    .line 312
    invoke-interface {v0, v1}, Ll/tul;->setOnAvatarClickListener(Landroid/view/View$OnClickListener;)V

    .line 313
    .line 314
    .line 315
    return-void
.end method

.method public final a0()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->x:Lcom/p1/mobile/putong/core/ui/greet/GreetAct;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/greet/GreetAct;->h2()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 12
    .line 13
    invoke-virtual {p0}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    if-eqz p0, :cond_0

    .line 22
    .line 23
    invoke-static {}, Ll/h39;->i()Lcom/p1/mobile/putong/core/data/CityCentreConfig;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    move-result p0

    .line 31
    if-eqz p0, :cond_0

    .line 32
    .line 33
    invoke-static {}, Ll/h39;->i()Lcom/p1/mobile/putong/core/data/CityCentreConfig;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/CityCentreConfig;->quick_reply:Ljava/util/List;

    .line 38
    .line 39
    return-object p0

    .line 40
    :cond_0
    const/4 p0, 0x0

    .line 41
    return-object p0
.end method

.method public a1(Landroid/view/MotionEvent;)Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    return p0
.end method

.method public bridge synthetic act()Lcom/p1/mobile/android/app/Act;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->S()Lcom/p1/mobile/putong/core/ui/greet/GreetAct;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final b0()Ljava/lang/String;
    .locals 1

    .line 1
    :try_start_0
    invoke-static {}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->x()Lcom/p1/mobile/putong/remote_config/RemoteConfig;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const-string v0, "core_im_say_hi_gift_guide_text"

    .line 6
    .line 7
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->F(Ljava/lang/String;)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-nez v0, :cond_0

    .line 16
    .line 17
    new-instance v0, Lorg/json/JSONObject;

    .line 18
    .line 19
    invoke-direct {v0, p0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    const-string p0, "guide_text"

    .line 23
    .line 24
    invoke-virtual {v0, p0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 28
    return-object p0

    .line 29
    :catch_0
    :cond_0
    const-string p0, "\u9001\u4e2a\u793c\u7269\u66f4\u5bb9\u6613\u88ab\u56de\u590d\u54e6"

    .line 30
    .line 31
    return-object p0
.end method

.method public final c0()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->w:Ll/jxd0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ljava/lang/Boolean;

    .line 8
    .line 9
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0
.end method

.method public final d0(Lcom/p1/mobile/putong/data/User;)Ljava/lang/String;
    .locals 1

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const-string v0, "hint_input_female"

    .line 8
    .line 9
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->e0(Ljava/lang/String;)Ljava/util/List;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    goto :goto_0

    .line 14
    :cond_0
    const-string v0, "hint_input_male"

    .line 15
    .line 16
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->e0(Ljava/lang/String;)Ljava/util/List;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    :goto_0
    invoke-static {p0}, Ljava/util/Collections;->shuffle(Ljava/util/List;)V

    .line 21
    .line 22
    .line 23
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-nez v0, :cond_1

    .line 28
    .line 29
    const/4 p1, 0x0

    .line 30
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    check-cast p0, Ljava/lang/String;

    .line 35
    .line 36
    return-object p0

    .line 37
    :cond_1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 38
    .line 39
    .line 40
    move-result p0

    .line 41
    if-eqz p0, :cond_2

    .line 42
    .line 43
    const-string p0, "\u95ee\u95ee\u5979\u5e73\u65f6\u7684\u7231\u597d\u662f\u4ec0\u4e48"

    .line 44
    .line 45
    return-object p0

    .line 46
    :cond_2
    const-string p0, "\u95ee\u95ee\u4ed6\u5e73\u65f6\u7684\u7231\u597d\u662f\u4ec0\u4e48"

    .line 47
    .line 48
    return-object p0
.end method

.method public d1()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->g:Lv/VList;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/widget/AdapterView;->getLastVisiblePosition()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->g:Lv/VList;

    .line 8
    .line 9
    invoke-virtual {v1}, Landroid/widget/AdapterView;->getCount()I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    add-int/lit8 v1, v1, -0x1

    .line 14
    .line 15
    if-eq v0, v1, :cond_0

    .line 16
    .line 17
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->g:Lv/VList;

    .line 18
    .line 19
    invoke-virtual {p0}, Landroid/widget/AdapterView;->getCount()I

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    add-int/lit8 v0, v0, -0x1

    .line 24
    .line 25
    const/16 v1, -0x2710

    .line 26
    .line 27
    invoke-virtual {p0, v0, v1}, Landroid/widget/AbsListView;->smoothScrollToPositionFromTop(II)V

    .line 28
    .line 29
    .line 30
    :cond_0
    return-void
.end method

.method public destroy()V
    .locals 0

    return-void
.end method

.method public e0(Ljava/lang/String;)Ljava/util/List;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->x()Lcom/p1/mobile/putong/remote_config/RemoteConfig;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const-string v0, "dynamic_square_four_hello_greeting"

    .line 6
    .line 7
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->F(Ljava/lang/String;)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    new-instance v0, Ljava/util/ArrayList;

    .line 12
    .line 13
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 14
    .line 15
    .line 16
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    const/4 v2, 0x0

    .line 21
    if-nez v1, :cond_0

    .line 22
    .line 23
    :try_start_0
    new-instance v1, Lorg/json/JSONObject;

    .line 24
    .line 25
    invoke-direct {v1, p0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {v1, p1}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 33
    .line 34
    .line 35
    move-result v1

    .line 36
    if-eqz v1, :cond_0

    .line 37
    .line 38
    invoke-virtual {p0}, Lorg/json/JSONArray;->length()I

    .line 39
    .line 40
    .line 41
    move-result v1

    .line 42
    if-lez v1, :cond_0

    .line 43
    .line 44
    move v1, v2

    .line 45
    :goto_0
    invoke-virtual {p0}, Lorg/json/JSONArray;->length()I

    .line 46
    .line 47
    .line 48
    move-result v3

    .line 49
    if-ge v1, v3, :cond_5

    .line 50
    .line 51
    invoke-virtual {p0, v1}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object v3

    .line 55
    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 56
    .line 57
    .line 58
    add-int/lit8 v1, v1, 0x1

    .line 59
    .line 60
    goto :goto_0

    .line 61
    :catch_0
    :cond_0
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 62
    .line 63
    .line 64
    move-result p0

    .line 65
    if-eqz p0, :cond_5

    .line 66
    .line 67
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 68
    .line 69
    .line 70
    invoke-virtual {p1}, Ljava/lang/String;->hashCode()I

    .line 71
    .line 72
    .line 73
    move-result p0

    .line 74
    const/4 v1, -0x1

    .line 75
    sparse-switch p0, :sswitch_data_0

    .line 76
    .line 77
    .line 78
    :goto_1
    move v2, v1

    .line 79
    goto :goto_2

    .line 80
    :sswitch_0
    const-string p0, "quick_reply"

    .line 81
    .line 82
    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 83
    .line 84
    .line 85
    move-result p0

    .line 86
    if-nez p0, :cond_1

    .line 87
    .line 88
    goto :goto_1

    .line 89
    :cond_1
    const/4 v2, 0x3

    .line 90
    goto :goto_2

    .line 91
    :sswitch_1
    const-string p0, "hint_input_female"

    .line 92
    .line 93
    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 94
    .line 95
    .line 96
    move-result p0

    .line 97
    if-nez p0, :cond_2

    .line 98
    .line 99
    goto :goto_1

    .line 100
    :cond_2
    const/4 v2, 0x2

    .line 101
    goto :goto_2

    .line 102
    :sswitch_2
    const-string p0, "quick_reply_receiver"

    .line 103
    .line 104
    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 105
    .line 106
    .line 107
    move-result p0

    .line 108
    if-nez p0, :cond_3

    .line 109
    .line 110
    goto :goto_1

    .line 111
    :cond_3
    const/4 v2, 0x1

    .line 112
    goto :goto_2

    .line 113
    :sswitch_3
    const-string p0, "hint_input_male"

    .line 114
    .line 115
    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 116
    .line 117
    .line 118
    move-result p0

    .line 119
    if-nez p0, :cond_4

    .line 120
    .line 121
    goto :goto_1

    .line 122
    :cond_4
    :goto_2
    packed-switch v2, :pswitch_data_0

    .line 123
    .line 124
    .line 125
    goto :goto_3

    .line 126
    :pswitch_0
    const-string p0, "\u95ee\u95ee\u5979\u5e73\u65f6\u7684\u7231\u597d\u662f\u4ec0\u4e48"

    .line 127
    .line 128
    invoke-interface {v0, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 129
    .line 130
    .line 131
    const-string p0, "\u548c\u5979\u804a\u804a\u6700\u8fd1\u770b\u8fc7\u7684\u7535\u5f71\u5427"

    .line 132
    .line 133
    invoke-interface {v0, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 134
    .line 135
    .line 136
    const-string p0, "\u548c\u5979\u804a\u804a\u6700\u8fd1\u7684\u5f00\u5fc3\u4e8b"

    .line 137
    .line 138
    invoke-interface {v0, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 139
    .line 140
    .line 141
    const-string p0, "\u95ee\u95ee\u5979\u4e0b\u73ed\u540e\u6700\u559c\u6b22\u505a\u4e9b\u5565"

    .line 142
    .line 143
    invoke-interface {v0, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 144
    .line 145
    .line 146
    const-string p0, "\u548c\u5979\u804a\u804a\u6700\u559c\u6b22\u7684\u6b4c\u624b\u5427"

    .line 147
    .line 148
    invoke-interface {v0, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 149
    .line 150
    .line 151
    const-string p0, "\u95ee\u95ee\u5979\u4ea4\u670b\u53cb\u6700\u770b\u91cd\u4ec0\u4e48"

    .line 152
    .line 153
    invoke-interface {v0, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 154
    .line 155
    .line 156
    goto :goto_3

    .line 157
    :pswitch_1
    const-string p0, "\u54c8\u55bd\uff5e"

    .line 158
    .line 159
    invoke-interface {v0, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 160
    .line 161
    .line 162
    const-string p0, "[\u73ab\u7470]"

    .line 163
    .line 164
    invoke-interface {v0, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 165
    .line 166
    .line 167
    const-string p0, "\u5728\u5e72\u561b\uff1f"

    .line 168
    .line 169
    invoke-interface {v0, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 170
    .line 171
    .line 172
    const-string p0, "\u5f88\u5e0c\u671b\u53ef\u4ee5\u8ba4\u8bc6\u4f60"

    .line 173
    .line 174
    invoke-interface {v0, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 175
    .line 176
    .line 177
    const-string p0, "\u4eca\u5929\u5f00\u5fc3\u5417\uff1f"

    .line 178
    .line 179
    invoke-interface {v0, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 180
    .line 181
    .line 182
    goto :goto_3

    .line 183
    :pswitch_2
    const-string p0, "\u95ee\u95ee\u4ed6\u5e73\u65f6\u7684\u7231\u597d\u662f\u4ec0\u4e48"

    .line 184
    .line 185
    invoke-interface {v0, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 186
    .line 187
    .line 188
    const-string p0, "\u548c\u4ed6\u804a\u804a\u6700\u8fd1\u770b\u8fc7\u7684\u7535\u5f71\u5427"

    .line 189
    .line 190
    invoke-interface {v0, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 191
    .line 192
    .line 193
    const-string p0, "\u548c\u4ed6\u804a\u804a\u6700\u8fd1\u7684\u5f00\u5fc3\u4e8b"

    .line 194
    .line 195
    invoke-interface {v0, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 196
    .line 197
    .line 198
    const-string p0, "\u95ee\u95ee\u4ed6\u4e0b\u73ed\u540e\u6700\u559c\u6b22\u505a\u4e9b\u5565"

    .line 199
    .line 200
    invoke-interface {v0, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 201
    .line 202
    .line 203
    const-string p0, "\u548c\u4ed6\u804a\u804a\u6700\u559c\u6b22\u7684\u6b4c\u624b\u5427"

    .line 204
    .line 205
    invoke-interface {v0, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 206
    .line 207
    .line 208
    const-string p0, "\u95ee\u95ee\u4ed6\u4ea4\u670b\u53cb\u6700\u770b\u91cd\u4ec0\u4e48"

    .line 209
    .line 210
    invoke-interface {v0, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 211
    .line 212
    .line 213
    :cond_5
    :goto_3
    return-object v0

    .line 214
    nop

    .line 215
    :sswitch_data_0
    .sparse-switch
        -0x4e975de6 -> :sswitch_3
        -0x28363fca -> :sswitch_2
        -0x11f097e7 -> :sswitch_1
        0x1f76b618 -> :sswitch_0
    .end sparse-switch

    .line 216
    .line 217
    .line 218
    .line 219
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_1
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public final e1(Lcom/p1/mobile/putong/core/data/CoreGiftInfo;)V
    .locals 7

    .line 1
    const-string v0, "coin"

    .line 2
    .line 3
    iput-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreGiftInfo;->consumeType:Ljava/lang/String;

    .line 4
    .line 5
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 6
    .line 7
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->H0:Ll/lqb;

    .line 8
    .line 9
    const-string v1, "greetNumber"

    .line 10
    .line 11
    invoke-static {v1}, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-virtual {v0, v1}, Ll/lqb;->s4(Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;)Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    iput-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreGiftInfo;->coinSign:Ljava/lang/String;

    .line 20
    .line 21
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-virtual {v0}, Ll/j49;->g()Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;->Wi()Z

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    if-eqz v0, :cond_0

    .line 34
    .line 35
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->o:Ll/gta;

    .line 36
    .line 37
    invoke-virtual {v0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->x:Lcom/p1/mobile/putong/core/ui/greet/GreetAct;

    .line 42
    .line 43
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 44
    .line 45
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->H0:Ll/lqb;

    .line 46
    .line 47
    invoke-virtual {v0}, Ll/lqb;->t5()I

    .line 48
    .line 49
    .line 50
    move-result v3

    .line 51
    new-instance v6, Ll/tbk;

    .line 52
    .line 53
    invoke-direct {v6, p0, p1}, Ll/tbk;-><init>(Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;Lcom/p1/mobile/putong/core/data/CoreGiftInfo;)V

    .line 54
    .line 55
    .line 56
    const/4 v4, 0x0

    .line 57
    const/4 v5, 0x0

    .line 58
    invoke-interface/range {v1 .. v6}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->jf(Lcom/p1/mobile/android/app/Act;ILjava/lang/Runnable;Ljava/lang/Runnable;Ll/x20;)V

    .line 59
    .line 60
    .line 61
    return-void

    .line 62
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->z:Lcom/p1/mobile/putong/core/ui/greet/a;

    .line 63
    .line 64
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/greet/a;->E1(Lcom/p1/mobile/putong/core/data/CoreGiftInfo;)V

    .line 65
    .line 66
    .line 67
    return-void
.end method

.method public final f0()Z
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->K()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->ck()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_1

    .line 10
    .line 11
    invoke-static {}, Ll/joa;->N3()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-nez v0, :cond_1

    .line 16
    .line 17
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->k0()Z

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    if-nez p0, :cond_0

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_0
    const/4 p0, 0x0

    .line 25
    return p0

    .line 26
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 27
    return p0
.end method

.method public final f1(Lcom/p1/mobile/putong/core/data/CoreGiftInfo;)V
    .locals 1

    .line 1
    const-string v0, "privilege"

    .line 2
    .line 3
    iput-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreGiftInfo;->consumeType:Ljava/lang/String;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->z:Lcom/p1/mobile/putong/core/ui/greet/a;

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/greet/a;->E1(Lcom/p1/mobile/putong/core/data/CoreGiftInfo;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public g0()V
    .locals 8

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->E:Z

    .line 3
    .line 4
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->L:Landroid/view/animation/Interpolator;

    .line 5
    .line 6
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->i:Landroid/widget/RelativeLayout;

    .line 7
    .line 8
    const/4 v3, 0x1

    .line 9
    new-array v4, v3, [F

    .line 10
    .line 11
    const/4 v5, 0x0

    .line 12
    aput v5, v4, v0

    .line 13
    .line 14
    const-string v6, "translationY"

    .line 15
    .line 16
    invoke-static {v2, v6, v4}, Ll/gt0;->q(Landroid/view/View;Ljava/lang/String;[F)Landroid/animation/Animator;

    .line 17
    .line 18
    .line 19
    move-result-object v2

    .line 20
    iget-object v4, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->g:Lv/VList;

    .line 21
    .line 22
    new-array v7, v3, [F

    .line 23
    .line 24
    aput v5, v7, v0

    .line 25
    .line 26
    invoke-static {v4, v6, v7}, Ll/gt0;->q(Landroid/view/View;Ljava/lang/String;[F)Landroid/animation/Animator;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    filled-new-array {v2, v0}, [Landroid/animation/Animator;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    const-wide/16 v4, 0x186

    .line 35
    .line 36
    invoke-static {v3, v1, v4, v5, v0}, Ll/gt0;->u(ZLandroid/view/animation/Interpolator;J[Landroid/animation/Animator;)Landroid/animation/Animator;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->x:Lcom/p1/mobile/putong/core/ui/greet/GreetAct;

    .line 41
    .line 42
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/greet/GreetAct;->i2()Z

    .line 43
    .line 44
    .line 45
    move-result v1

    .line 46
    if-eqz v1, :cond_0

    .line 47
    .line 48
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->N:Ljava/lang/Runnable;

    .line 49
    .line 50
    goto :goto_0

    .line 51
    :cond_0
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->M:Ljava/lang/Runnable;

    .line 52
    .line 53
    :goto_0
    invoke-static {v0, v1}, Ll/gt0;->f(Landroid/animation/Animator;Ljava/lang/Runnable;)Landroid/animation/Animator;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    invoke-virtual {v0}, Landroid/animation/Animator;->start()V

    .line 58
    .line 59
    .line 60
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->T0()V

    .line 61
    .line 62
    .line 63
    return-void
.end method

.method public final g1(Ljava/lang/String;)V
    .locals 7

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/j49;->g()Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;->Wi()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->o:Ll/gta;

    .line 16
    .line 17
    invoke-virtual {v0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->x:Lcom/p1/mobile/putong/core/ui/greet/GreetAct;

    .line 22
    .line 23
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 24
    .line 25
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->H0:Ll/lqb;

    .line 26
    .line 27
    invoke-virtual {v0}, Ll/lqb;->t5()I

    .line 28
    .line 29
    .line 30
    move-result v3

    .line 31
    new-instance v6, Ll/sbk;

    .line 32
    .line 33
    invoke-direct {v6, p0, p1}, Ll/sbk;-><init>(Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    const/4 v4, 0x0

    .line 37
    const/4 v5, 0x0

    .line 38
    invoke-interface/range {v1 .. v6}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->jf(Lcom/p1/mobile/android/app/Act;ILjava/lang/Runnable;Ljava/lang/Runnable;Ll/x20;)V

    .line 39
    .line 40
    .line 41
    return-void

    .line 42
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->n:Lv/VEditText;

    .line 43
    .line 44
    const-string v1, ""

    .line 45
    .line 46
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 47
    .line 48
    .line 49
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->j1(Ljava/lang/String;)V

    .line 50
    .line 51
    .line 52
    return-void
.end method

.method public final h0(Ljava/util/List;I)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;I)V"
        }
    .end annotation

    .line 1
    new-instance v0, Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->x:Lcom/p1/mobile/putong/core/ui/greet/GreetAct;

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    invoke-direct {v0, v1, v2, v2}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>(Landroid/content/Context;IZ)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {v0}, Landroidx/recyclerview/widget/LinearLayoutManager;->canScrollVertically()Z

    .line 10
    .line 11
    .line 12
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->j:Lv/VRecyclerView;

    .line 13
    .line 14
    const/4 v3, 0x1

    .line 15
    invoke-static {v1, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 16
    .line 17
    .line 18
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->j:Lv/VRecyclerView;

    .line 19
    .line 20
    invoke-virtual {v1, v0}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$o;)V

    .line 21
    .line 22
    .line 23
    new-instance v0, Ll/w6c0;

    .line 24
    .line 25
    invoke-direct {v0}, Ll/w6c0;-><init>()V

    .line 26
    .line 27
    .line 28
    invoke-virtual {v0, p1}, Ll/w6c0;->I(Ljava/util/List;)V

    .line 29
    .line 30
    .line 31
    new-instance p1, Ll/pbk;

    .line 32
    .line 33
    invoke-direct {p1, p0, p2, v0}, Ll/pbk;-><init>(Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;ILl/w6c0;)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {v0, p1}, Ll/w6c0;->J(Ll/y20;)V

    .line 37
    .line 38
    .line 39
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->j:Lv/VRecyclerView;

    .line 40
    .line 41
    invoke-virtual {p1, v0}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 42
    .line 43
    .line 44
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->j:Lv/VRecyclerView;

    .line 45
    .line 46
    invoke-virtual {p1, v2}, Landroid/view/View;->setOverScrollMode(I)V

    .line 47
    .line 48
    .line 49
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 50
    .line 51
    .line 52
    move-result-object p1

    .line 53
    invoke-virtual {p1}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 54
    .line 55
    .line 56
    move-result-object p1

    .line 57
    invoke-interface {p1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->O8()Z

    .line 58
    .line 59
    .line 60
    move-result p1

    .line 61
    if-eqz p1, :cond_1

    .line 62
    .line 63
    const-string p1, "fast_message_role"

    .line 64
    .line 65
    invoke-static {p1, p2}, Ll/sfj0$a;->f(Ljava/lang/String;I)Ll/sfj0$a;

    .line 66
    .line 67
    .line 68
    move-result-object p1

    .line 69
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->z:Lcom/p1/mobile/putong/core/ui/greet/a;

    .line 70
    .line 71
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/ui/greet/a;->S0()Lcom/p1/mobile/putong/data/User;

    .line 72
    .line 73
    .line 74
    move-result-object p2

    .line 75
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 76
    .line 77
    .line 78
    move-result p2

    .line 79
    if-eqz p2, :cond_0

    .line 80
    .line 81
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->z:Lcom/p1/mobile/putong/core/ui/greet/a;

    .line 82
    .line 83
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/greet/a;->S0()Lcom/p1/mobile/putong/data/User;

    .line 84
    .line 85
    .line 86
    move-result-object p0

    .line 87
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 88
    .line 89
    goto :goto_0

    .line 90
    :cond_0
    const-string p0, ""

    .line 91
    .line 92
    :goto_0
    const-string p2, "moments_user_id"

    .line 93
    .line 94
    invoke-static {p2, p0}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 95
    .line 96
    .line 97
    move-result-object p0

    .line 98
    filled-new-array {p1, p0}, [Ll/sfj0$a;

    .line 99
    .line 100
    .line 101
    move-result-object p0

    .line 102
    const-string p1, "e_fast_message"

    .line 103
    .line 104
    const-string p2, "p_kankan_chat_popup"

    .line 105
    .line 106
    invoke-static {p1, p2, p0}, Ll/sfj0;->h(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 107
    .line 108
    .line 109
    :cond_1
    return-void
.end method

.method public final h1(Lcom/p1/mobile/putong/core/data/CoreGiftInfo;)V
    .locals 3

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->K()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->ck()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_2

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->k0()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_2

    .line 16
    .line 17
    invoke-static {}, Ll/joa;->N3()Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-eqz v0, :cond_0

    .line 22
    .line 23
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->f1(Lcom/p1/mobile/putong/core/data/CoreGiftInfo;)V

    .line 24
    .line 25
    .line 26
    return-void

    .line 27
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    invoke-virtual {v0}, Ll/j49;->g()Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;->Fh()I

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    if-lez v0, :cond_1

    .line 40
    .line 41
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->e1(Lcom/p1/mobile/putong/core/data/CoreGiftInfo;)V

    .line 42
    .line 43
    .line 44
    return-void

    .line 45
    :cond_1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    invoke-virtual {v0}, Ll/j49;->g()Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->x:Lcom/p1/mobile/putong/core/ui/greet/GreetAct;

    .line 54
    .line 55
    new-instance v2, Ll/obk;

    .line 56
    .line 57
    invoke-direct {v2, p0, p1}, Ll/obk;-><init>(Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;Lcom/p1/mobile/putong/core/data/CoreGiftInfo;)V

    .line 58
    .line 59
    .line 60
    const-string p0, "p_chat,gift_send"

    .line 61
    .line 62
    invoke-interface {v0, v1, p0, v2}, Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;->Pk(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ll/y20;)V

    .line 63
    .line 64
    .line 65
    return-void

    .line 66
    :cond_2
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->z:Lcom/p1/mobile/putong/core/ui/greet/a;

    .line 67
    .line 68
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/greet/a;->E1(Lcom/p1/mobile/putong/core/data/CoreGiftInfo;)V

    .line 69
    .line 70
    .line 71
    return-void
.end method

.method public final i0()V
    .locals 4

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->f0()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->x:Lcom/p1/mobile/putong/core/ui/greet/GreetAct;

    .line 8
    .line 9
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/greet/GreetAct;->h2()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    const/4 v0, 0x1

    .line 16
    goto :goto_0

    .line 17
    :cond_0
    const/4 v0, 0x0

    .line 18
    :goto_0
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->l:Lv/VImage;

    .line 19
    .line 20
    invoke-static {v1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 21
    .line 22
    .line 23
    if-eqz v0, :cond_3

    .line 24
    .line 25
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->J:Z

    .line 26
    .line 27
    if-nez v0, :cond_2

    .line 28
    .line 29
    invoke-static {}, Lcom/p1/mobile/android/ui/bubble/d;->l()Lcom/p1/mobile/android/ui/bubble/d;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    const-string v1, "_edit_greet_tip"

    .line 34
    .line 35
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/ui/bubble/d;->x(Ljava/lang/String;)Z

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    if-eqz v0, :cond_1

    .line 40
    .line 41
    goto :goto_1

    .line 42
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->l:Lv/VImage;

    .line 43
    .line 44
    new-instance v1, Ll/abk;

    .line 45
    .line 46
    invoke-direct {v1, p0}, Ll/abk;-><init>(Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;)V

    .line 47
    .line 48
    .line 49
    const-wide/16 v2, 0x1f4

    .line 50
    .line 51
    invoke-virtual {v0, v1, v2, v3}, Landroid/view/View;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 52
    .line 53
    .line 54
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->l:Lv/VImage;

    .line 55
    .line 56
    new-instance v1, Ll/bbk;

    .line 57
    .line 58
    invoke-direct {v1, p0}, Ll/bbk;-><init>(Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;)V

    .line 59
    .line 60
    .line 61
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 62
    .line 63
    .line 64
    :cond_3
    :goto_1
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/core/ui/greet/a;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->V(Lcom/p1/mobile/putong/core/ui/greet/a;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 3

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->R(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->Y()Landroid/view/View;

    .line 6
    .line 7
    .line 8
    move-result-object p2

    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->g:Lv/VList;

    .line 10
    .line 11
    invoke-virtual {v0, p2}, Landroid/widget/ListView;->addHeaderView(Landroid/view/View;)V

    .line 12
    .line 13
    .line 14
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->g:Lv/VList;

    .line 15
    .line 16
    const/4 v0, 0x0

    .line 17
    invoke-virtual {p2, v0}, Landroid/widget/ListView;->setHeaderDividersEnabled(Z)V

    .line 18
    .line 19
    .line 20
    new-instance p2, Ll/kdk;

    .line 21
    .line 22
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->x:Lcom/p1/mobile/putong/core/ui/greet/GreetAct;

    .line 23
    .line 24
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->g:Lv/VList;

    .line 25
    .line 26
    invoke-direct {p2, v1, v2}, Ll/kdk;-><init>(Lcom/p1/mobile/putong/core/ui/greet/GreetAct;Landroid/widget/ListView;)V

    .line 27
    .line 28
    .line 29
    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->C:Ll/kdk;

    .line 30
    .line 31
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->g:Lv/VList;

    .line 32
    .line 33
    invoke-virtual {v1, p2}, Lv/VList;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 34
    .line 35
    .line 36
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->C:Ll/kdk;

    .line 37
    .line 38
    invoke-virtual {p2}, Landroid/widget/BaseAdapter;->notifyDataSetChanged()V

    .line 39
    .line 40
    .line 41
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->x:Lcom/p1/mobile/putong/core/ui/greet/GreetAct;

    .line 42
    .line 43
    new-instance v1, Landroid/view/View;

    .line 44
    .line 45
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->x:Lcom/p1/mobile/putong/core/ui/greet/GreetAct;

    .line 46
    .line 47
    invoke-direct {v1, v2}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 48
    .line 49
    .line 50
    new-instance v2, Ll/tak;

    .line 51
    .line 52
    invoke-direct {v2, p0}, Ll/tak;-><init>(Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;)V

    .line 53
    .line 54
    .line 55
    invoke-virtual {p2, p1, v1, v2}, Lcom/p1/mobile/android/app/Act;->setUpKeyboardDetectorLayout(Landroid/view/View;Landroid/view/View;Ll/b30;)Landroid/view/View;

    .line 56
    .line 57
    .line 58
    move-result-object p1

    .line 59
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->z:Lcom/p1/mobile/putong/core/ui/greet/a;

    .line 60
    .line 61
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/ui/greet/a;->t1()Z

    .line 62
    .line 63
    .line 64
    move-result p2

    .line 65
    if-eqz p2, :cond_0

    .line 66
    .line 67
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->T()V

    .line 68
    .line 69
    .line 70
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->a0()Ljava/util/List;

    .line 71
    .line 72
    .line 73
    move-result-object p2

    .line 74
    invoke-static {p2}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 75
    .line 76
    .line 77
    move-result p2

    .line 78
    if-nez p2, :cond_1

    .line 79
    .line 80
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->a0()Ljava/util/List;

    .line 81
    .line 82
    .line 83
    move-result-object p2

    .line 84
    invoke-virtual {p0, p2, v0}, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->h0(Ljava/util/List;I)V

    .line 85
    .line 86
    .line 87
    return-object p1

    .line 88
    :cond_1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 89
    .line 90
    .line 91
    move-result-object p2

    .line 92
    invoke-virtual {p2}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 93
    .line 94
    .line 95
    move-result-object p2

    .line 96
    invoke-interface {p2}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->O8()Z

    .line 97
    .line 98
    .line 99
    move-result p2

    .line 100
    if-eqz p2, :cond_3

    .line 101
    .line 102
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->z:Lcom/p1/mobile/putong/core/ui/greet/a;

    .line 103
    .line 104
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/ui/greet/c;->g0()Lcom/p1/mobile/putong/core/data/Greeting;

    .line 105
    .line 106
    .line 107
    move-result-object p2

    .line 108
    iget-object p2, p2, Lcom/p1/mobile/putong/core/data/Greeting;->actorUserId:Ljava/lang/String;

    .line 109
    .line 110
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 111
    .line 112
    .line 113
    move-result-object v1

    .line 114
    invoke-interface {v1}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 115
    .line 116
    .line 117
    move-result-object v1

    .line 118
    invoke-static {p2, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 119
    .line 120
    .line 121
    move-result p2

    .line 122
    if-eqz p2, :cond_2

    .line 123
    .line 124
    const-string p2, "quick_reply"

    .line 125
    .line 126
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->e0(Ljava/lang/String;)Ljava/util/List;

    .line 127
    .line 128
    .line 129
    move-result-object p2

    .line 130
    invoke-virtual {p0, p2, v0}, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->h0(Ljava/util/List;I)V

    .line 131
    .line 132
    .line 133
    return-object p1

    .line 134
    :cond_2
    const-string p2, "quick_reply_receiver"

    .line 135
    .line 136
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->e0(Ljava/lang/String;)Ljava/util/List;

    .line 137
    .line 138
    .line 139
    move-result-object p2

    .line 140
    const/4 v0, 0x1

    .line 141
    invoke-virtual {p0, p2, v0}, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->h0(Ljava/util/List;I)V

    .line 142
    .line 143
    .line 144
    :cond_3
    return-object p1
.end method

.method public j0()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->D:Z

    .line 2
    .line 3
    return p0
.end method

.method public final j1(Ljava/lang/String;)V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->H0:Ll/lqb;

    .line 4
    .line 5
    const-string v1, "greetNumber"

    .line 6
    .line 7
    invoke-static {v1}, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-virtual {v0, v1}, Ll/lqb;->s4(Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;)Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const-string v1, "coin"

    .line 16
    .line 17
    invoke-virtual {p0, p1, v1, v0}, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->S0(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public k0()Z
    .locals 4

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->z:Lcom/p1/mobile/putong/core/ui/greet/a;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/greet/c;->h0()Lcom/p1/mobile/putong/core/ui/greet/GreetingParam;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetingParam;->greetInfo:Lcom/p1/mobile/putong/core/data/Greeting;

    .line 8
    .line 9
    iget-wide v0, p0, Lcom/p1/mobile/putong/core/data/Greeting;->createdTime:D

    .line 10
    .line 11
    const-wide/high16 v2, 0x3ff0000000000000L    # 1.0

    .line 12
    .line 13
    cmpg-double p0, v0, v2

    .line 14
    .line 15
    if-gez p0, :cond_0

    .line 16
    .line 17
    const/4 p0, 0x1

    .line 18
    return p0

    .line 19
    :cond_0
    const/4 p0, 0x0

    .line 20
    return p0
.end method

.method public final k1()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->w:Ll/jxd0;

    .line 2
    .line 3
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public l0()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->I:Z

    .line 2
    .line 3
    return p0
.end method

.method public l1(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->I:Z

    .line 2
    .line 3
    return-void
.end method

.method public final synthetic m0(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->s1(Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public m1()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->S()Lcom/p1/mobile/putong/core/ui/greet/GreetAct;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    const/16 v0, 0x15

    .line 10
    .line 11
    invoke-virtual {p0, v0}, Landroid/view/Window;->setSoftInputMode(I)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public final synthetic n0(Ljava/lang/Boolean;Ljava/lang/Integer;Ljava/lang/Boolean;Ljava/lang/Integer;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    goto :goto_0

    .line 12
    :cond_0
    const/4 p1, 0x0

    .line 13
    :goto_0
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->V0(I)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public final n1(Z)V
    .locals 6

    .line 1
    invoke-static {}, Lcom/p1/mobile/android/ui/bubble/d;->l()Lcom/p1/mobile/android/ui/bubble/d;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "_edit_greet_tip"

    .line 6
    .line 7
    if-nez p1, :cond_0

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/ui/bubble/d;->x(Ljava/lang/String;)Z

    .line 10
    .line 11
    .line 12
    move-result v2

    .line 13
    if-eqz v2, :cond_0

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/ui/bubble/d;->k(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    return-void

    .line 19
    :cond_0
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 20
    .line 21
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 22
    .line 23
    invoke-virtual {v2}, Ll/dkb;->na()Lcom/p1/mobile/putong/data/User;

    .line 24
    .line 25
    .line 26
    move-result-object v2

    .line 27
    if-eqz p1, :cond_1

    .line 28
    .line 29
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->H:Ljava/lang/String;

    .line 30
    .line 31
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 32
    .line 33
    .line 34
    move-result p1

    .line 35
    if-nez p1, :cond_1

    .line 36
    .line 37
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    invoke-virtual {p1}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    invoke-interface {p1}, Ll/r97;->y()Z

    .line 46
    .line 47
    .line 48
    move-result p1

    .line 49
    if-eqz p1, :cond_1

    .line 50
    .line 51
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->z:Lcom/p1/mobile/putong/core/ui/greet/a;

    .line 52
    .line 53
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/greet/c;->g0()Lcom/p1/mobile/putong/core/data/Greeting;

    .line 54
    .line 55
    .line 56
    move-result-object p1

    .line 57
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 58
    .line 59
    .line 60
    move-result p1

    .line 61
    if-eqz p1, :cond_1

    .line 62
    .line 63
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 64
    .line 65
    .line 66
    move-result-object p1

    .line 67
    invoke-interface {p1}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 68
    .line 69
    .line 70
    move-result-object p1

    .line 71
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->z:Lcom/p1/mobile/putong/core/ui/greet/a;

    .line 72
    .line 73
    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/ui/greet/c;->g0()Lcom/p1/mobile/putong/core/data/Greeting;

    .line 74
    .line 75
    .line 76
    move-result-object v3

    .line 77
    iget-object v3, v3, Lcom/p1/mobile/putong/core/data/Greeting;->actorUserId:Ljava/lang/String;

    .line 78
    .line 79
    invoke-static {p1, v3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 80
    .line 81
    .line 82
    move-result p1

    .line 83
    if-eqz p1, :cond_1

    .line 84
    .line 85
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 86
    .line 87
    .line 88
    move-result p1

    .line 89
    if-eqz p1, :cond_1

    .line 90
    .line 91
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 92
    .line 93
    .line 94
    move-result p1

    .line 95
    if-nez p1, :cond_1

    .line 96
    .line 97
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 98
    .line 99
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->r0:Lcom/p1/mobile/putong/core/api/j;

    .line 100
    .line 101
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/j;->c0:Ll/jxd0;

    .line 102
    .line 103
    invoke-virtual {p1}, Ll/azd0;->get()Ljava/lang/Object;

    .line 104
    .line 105
    .line 106
    move-result-object p1

    .line 107
    check-cast p1, Ljava/lang/Boolean;

    .line 108
    .line 109
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 110
    .line 111
    .line 112
    move-result p1

    .line 113
    if-nez p1, :cond_1

    .line 114
    .line 115
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->z:Lcom/p1/mobile/putong/core/ui/greet/a;

    .line 116
    .line 117
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/greet/a;->Y0()Z

    .line 118
    .line 119
    .line 120
    move-result p1

    .line 121
    if-nez p1, :cond_1

    .line 122
    .line 123
    new-instance p1, Lcom/p1/mobile/android/ui/bubble/a;

    .line 124
    .line 125
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->S()Lcom/p1/mobile/putong/core/ui/greet/GreetAct;

    .line 126
    .line 127
    .line 128
    move-result-object v2

    .line 129
    invoke-direct {p1, v2}, Lcom/p1/mobile/android/ui/bubble/a;-><init>(Landroid/content/Context;)V

    .line 130
    .line 131
    .line 132
    const/high16 v2, 0x41400000    # 12.0f

    .line 133
    .line 134
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 135
    .line 136
    .line 137
    move-result v2

    .line 138
    invoke-virtual {p1, v2}, Lcom/p1/mobile/android/ui/bubble/a;->p(I)Lcom/p1/mobile/android/ui/bubble/a;

    .line 139
    .line 140
    .line 141
    move-result-object p1

    .line 142
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->H:Ljava/lang/String;

    .line 143
    .line 144
    invoke-virtual {p1, v2}, Lcom/p1/mobile/android/ui/bubble/a;->D(Ljava/lang/CharSequence;)Lcom/p1/mobile/android/ui/bubble/a;

    .line 145
    .line 146
    .line 147
    move-result-object p1

    .line 148
    const/high16 v2, 0x41500000    # 13.0f

    .line 149
    .line 150
    invoke-virtual {p1, v2}, Lcom/p1/mobile/android/ui/bubble/a;->J(F)Lcom/p1/mobile/android/ui/bubble/a;

    .line 151
    .line 152
    .line 153
    move-result-object p1

    .line 154
    const/16 v2, 0x4b

    .line 155
    .line 156
    invoke-virtual {p1, v2}, Lcom/p1/mobile/android/ui/bubble/a;->p(I)Lcom/p1/mobile/android/ui/bubble/a;

    .line 157
    .line 158
    .line 159
    move-result-object p1

    .line 160
    const/4 v2, 0x1

    .line 161
    invoke-virtual {p1, v2}, Lcom/p1/mobile/android/ui/bubble/a;->F(Z)Lcom/p1/mobile/android/ui/bubble/a;

    .line 162
    .line 163
    .line 164
    move-result-object p1

    .line 165
    invoke-virtual {p1, v2}, Lcom/p1/mobile/android/ui/bubble/a;->E(Z)Lcom/p1/mobile/android/ui/bubble/a;

    .line 166
    .line 167
    .line 168
    move-result-object p1

    .line 169
    sget v2, Ll/qa00;->h:I

    .line 170
    .line 171
    neg-int v2, v2

    .line 172
    invoke-virtual {p1, v2}, Lcom/p1/mobile/android/ui/bubble/a;->x(I)Lcom/p1/mobile/android/ui/bubble/a;

    .line 173
    .line 174
    .line 175
    move-result-object p1

    .line 176
    new-instance v2, Ll/cbk;

    .line 177
    .line 178
    invoke-direct {v2}, Ll/cbk;-><init>()V

    .line 179
    .line 180
    .line 181
    invoke-virtual {p1, v2}, Lcom/p1/mobile/android/ui/bubble/a;->N(Lcom/p1/mobile/android/ui/bubble/a$d;)Lcom/p1/mobile/android/ui/bubble/a;

    .line 182
    .line 183
    .line 184
    move-result-object p1

    .line 185
    const/high16 v2, 0x41700000    # 15.0f

    .line 186
    .line 187
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 188
    .line 189
    .line 190
    move-result v3

    .line 191
    const/high16 v4, 0x41200000    # 10.0f

    .line 192
    .line 193
    invoke-static {v4}, Ll/qa00;->d(F)I

    .line 194
    .line 195
    .line 196
    move-result v5

    .line 197
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 198
    .line 199
    .line 200
    move-result v2

    .line 201
    invoke-static {v4}, Ll/qa00;->d(F)I

    .line 202
    .line 203
    .line 204
    move-result v4

    .line 205
    invoke-virtual {p1, v3, v5, v2, v4}, Lcom/p1/mobile/android/ui/bubble/a;->H(IIII)Lcom/p1/mobile/android/ui/bubble/a;

    .line 206
    .line 207
    .line 208
    move-result-object p1

    .line 209
    const-wide/16 v2, 0x1388

    .line 210
    .line 211
    invoke-virtual {p1, v2, v3}, Lcom/p1/mobile/android/ui/bubble/a;->b(J)Lcom/p1/mobile/android/ui/bubble/a;

    .line 212
    .line 213
    .line 214
    move-result-object p1

    .line 215
    sget v2, Lcom/p1/mobile/android/ui/bubble/a;->R:I

    .line 216
    .line 217
    sget v3, Lcom/p1/mobile/android/ui/bubble/a;->Q:I

    .line 218
    .line 219
    or-int/2addr v2, v3

    .line 220
    invoke-virtual {p1, v2}, Lcom/p1/mobile/android/ui/bubble/a;->q(I)Lcom/p1/mobile/android/ui/bubble/a;

    .line 221
    .line 222
    .line 223
    move-result-object p1

    .line 224
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->k:Lv/VLinear;

    .line 225
    .line 226
    invoke-virtual {v0, p1, p0, v1}, Lcom/p1/mobile/android/ui/bubble/d;->u(Lcom/p1/mobile/android/ui/bubble/a;Landroid/view/View;Ljava/lang/String;)V

    .line 227
    .line 228
    .line 229
    :cond_1
    return-void
.end method

.method public final synthetic o0(ILl/w6c0;Ljava/lang/Integer;)V
    .locals 5

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->O8()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    const-string v1, "p_kankan_chat_popup"

    .line 14
    .line 15
    const-string v2, "e_fast_message"

    .line 16
    .line 17
    if-eqz v0, :cond_1

    .line 18
    .line 19
    const-string v0, "fast_message_role"

    .line 20
    .line 21
    invoke-static {v0, p1}, Ll/sfj0$a;->f(Ljava/lang/String;I)Ll/sfj0$a;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    invoke-virtual {p3}, Ljava/lang/Integer;->intValue()I

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    invoke-virtual {p2, v0}, Ll/w6c0;->G(I)Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    const-string v3, "fast_message_text"

    .line 38
    .line 39
    invoke-static {v3, v0}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->z:Lcom/p1/mobile/putong/core/ui/greet/a;

    .line 44
    .line 45
    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/ui/greet/a;->S0()Lcom/p1/mobile/putong/data/User;

    .line 46
    .line 47
    .line 48
    move-result-object v3

    .line 49
    invoke-static {v3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 50
    .line 51
    .line 52
    move-result v3

    .line 53
    if-eqz v3, :cond_0

    .line 54
    .line 55
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->z:Lcom/p1/mobile/putong/core/ui/greet/a;

    .line 56
    .line 57
    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/ui/greet/a;->S0()Lcom/p1/mobile/putong/data/User;

    .line 58
    .line 59
    .line 60
    move-result-object v3

    .line 61
    iget-object v3, v3, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 62
    .line 63
    goto :goto_0

    .line 64
    :cond_0
    const-string v3, ""

    .line 65
    .line 66
    :goto_0
    const-string v4, "moments_user_id"

    .line 67
    .line 68
    invoke-static {v4, v3}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 69
    .line 70
    .line 71
    move-result-object v3

    .line 72
    filled-new-array {p1, v0, v3}, [Ll/sfj0$a;

    .line 73
    .line 74
    .line 75
    move-result-object p1

    .line 76
    invoke-static {v2, v1, p1}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 77
    .line 78
    .line 79
    goto :goto_1

    .line 80
    :cond_1
    const/4 p1, 0x0

    .line 81
    new-array p1, p1, [Ll/sfj0$a;

    .line 82
    .line 83
    invoke-static {v2, v1, p1}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 84
    .line 85
    .line 86
    :goto_1
    invoke-virtual {p3}, Ljava/lang/Integer;->intValue()I

    .line 87
    .line 88
    .line 89
    move-result p1

    .line 90
    invoke-virtual {p2, p1}, Ll/w6c0;->G(I)Ljava/lang/String;

    .line 91
    .line 92
    .line 93
    move-result-object p1

    .line 94
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 95
    .line 96
    .line 97
    move-result-object p1

    .line 98
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->R0(Ljava/lang/String;)V

    .line 99
    .line 100
    .line 101
    return-void
.end method

.method public final o1(Lcom/p1/mobile/putong/data/CoreGiftPanelName;)V
    .locals 9

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->z:Lcom/p1/mobile/putong/core/ui/greet/a;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/greet/a;->S0()Lcom/p1/mobile/putong/data/User;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->x:Lcom/p1/mobile/putong/core/ui/greet/GreetAct;

    .line 14
    .line 15
    new-instance v3, Ll/lbk;

    .line 16
    .line 17
    invoke-direct {v3, p0}, Ll/lbk;-><init>(Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;)V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->z:Lcom/p1/mobile/putong/core/ui/greet/a;

    .line 21
    .line 22
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/greet/a;->S0()Lcom/p1/mobile/putong/data/User;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    iget-object v4, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 27
    .line 28
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->z:Lcom/p1/mobile/putong/core/ui/greet/a;

    .line 29
    .line 30
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/greet/c;->getFrom()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v6

    .line 34
    const/4 v7, 0x0

    .line 35
    const/4 v8, 0x2

    .line 36
    const-string v5, "p_kankan_chat_popup"

    .line 37
    .line 38
    move-object v2, p1

    .line 39
    invoke-static/range {v1 .. v8}, Ll/vvj;->c(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/CoreGiftPanelName;Ll/y20;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ll/x20;I)V

    .line 40
    .line 41
    .line 42
    :cond_0
    return-void
.end method

.method public final synthetic p0()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->l:Lv/VImage;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->b0()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->p1(Landroid/view/View;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final p1(Landroid/view/View;Ljava/lang/String;)V
    .locals 7

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->x:Lcom/p1/mobile/putong/core/ui/greet/GreetAct;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    invoke-static {}, Lcom/p1/mobile/android/ui/bubble/d;->l()Lcom/p1/mobile/android/ui/bubble/d;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    const-string v1, "bubble_say_hi_gift_first_guide"

    .line 15
    .line 16
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/ui/bubble/d;->k(Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    new-instance v0, Lcom/p1/mobile/android/ui/bubble/a;

    .line 20
    .line 21
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->x:Lcom/p1/mobile/putong/core/ui/greet/GreetAct;

    .line 22
    .line 23
    invoke-direct {v0, v2}, Lcom/p1/mobile/android/ui/bubble/a;-><init>(Landroid/content/Context;)V

    .line 24
    .line 25
    .line 26
    const/high16 v2, 0x40e00000    # 7.0f

    .line 27
    .line 28
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 29
    .line 30
    .line 31
    move-result v2

    .line 32
    invoke-virtual {v0, v2}, Lcom/p1/mobile/android/ui/bubble/a;->l(I)Lcom/p1/mobile/android/ui/bubble/a;

    .line 33
    .line 34
    .line 35
    move-result-object v2

    .line 36
    const/high16 v3, 0x41800000    # 16.0f

    .line 37
    .line 38
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 39
    .line 40
    .line 41
    move-result v4

    .line 42
    const/high16 v5, 0x41200000    # 10.0f

    .line 43
    .line 44
    invoke-static {v5}, Ll/qa00;->d(F)I

    .line 45
    .line 46
    .line 47
    move-result v6

    .line 48
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 49
    .line 50
    .line 51
    move-result v3

    .line 52
    invoke-static {v5}, Ll/qa00;->d(F)I

    .line 53
    .line 54
    .line 55
    move-result v5

    .line 56
    invoke-virtual {v2, v4, v6, v3, v5}, Lcom/p1/mobile/android/ui/bubble/a;->H(IIII)Lcom/p1/mobile/android/ui/bubble/a;

    .line 57
    .line 58
    .line 59
    move-result-object v2

    .line 60
    sget v3, Ll/g9c0;->b:I

    .line 61
    .line 62
    invoke-virtual {v2, v3}, Lcom/p1/mobile/android/ui/bubble/a;->G(I)Lcom/p1/mobile/android/ui/bubble/a;

    .line 63
    .line 64
    .line 65
    move-result-object v2

    .line 66
    const v3, -0x181e3

    .line 67
    .line 68
    .line 69
    filled-new-array {v3}, [I

    .line 70
    .line 71
    .line 72
    move-result-object v3

    .line 73
    invoke-virtual {v2, v3}, Lcom/p1/mobile/android/ui/bubble/a;->k([I)Lcom/p1/mobile/android/ui/bubble/a;

    .line 74
    .line 75
    .line 76
    move-result-object v2

    .line 77
    const/16 v3, 0x4b

    .line 78
    .line 79
    invoke-virtual {v2, v3}, Lcom/p1/mobile/android/ui/bubble/a;->p(I)Lcom/p1/mobile/android/ui/bubble/a;

    .line 80
    .line 81
    .line 82
    move-result-object v2

    .line 83
    const/high16 v3, 0x41500000    # 13.0f

    .line 84
    .line 85
    invoke-virtual {v2, v3}, Lcom/p1/mobile/android/ui/bubble/a;->J(F)Lcom/p1/mobile/android/ui/bubble/a;

    .line 86
    .line 87
    .line 88
    move-result-object v2

    .line 89
    const-wide/16 v3, 0xbb8

    .line 90
    .line 91
    invoke-virtual {v2, v3, v4}, Lcom/p1/mobile/android/ui/bubble/a;->b(J)Lcom/p1/mobile/android/ui/bubble/a;

    .line 92
    .line 93
    .line 94
    move-result-object v2

    .line 95
    const/4 v3, 0x1

    .line 96
    invoke-virtual {v2, v3}, Lcom/p1/mobile/android/ui/bubble/a;->e(Z)Lcom/p1/mobile/android/ui/bubble/a;

    .line 97
    .line 98
    .line 99
    move-result-object v2

    .line 100
    new-instance v4, Ll/jbk;

    .line 101
    .line 102
    invoke-direct {v4, p0}, Ll/jbk;-><init>(Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;)V

    .line 103
    .line 104
    .line 105
    invoke-virtual {v2, v4}, Lcom/p1/mobile/android/ui/bubble/a;->j(Lcom/p1/mobile/android/ui/bubble/a$c;)Lcom/p1/mobile/android/ui/bubble/a;

    .line 106
    .line 107
    .line 108
    move-result-object v2

    .line 109
    invoke-virtual {v2, p2}, Lcom/p1/mobile/android/ui/bubble/a;->D(Ljava/lang/CharSequence;)Lcom/p1/mobile/android/ui/bubble/a;

    .line 110
    .line 111
    .line 112
    move-result-object p2

    .line 113
    sget v2, Lcom/p1/mobile/android/ui/bubble/a;->O:I

    .line 114
    .line 115
    sget v4, Lcom/p1/mobile/android/ui/bubble/a;->Q:I

    .line 116
    .line 117
    or-int/2addr v2, v4

    .line 118
    invoke-virtual {p2, v2}, Lcom/p1/mobile/android/ui/bubble/a;->q(I)Lcom/p1/mobile/android/ui/bubble/a;

    .line 119
    .line 120
    .line 121
    move-result-object p2

    .line 122
    const/high16 v2, 0x41000000    # 8.0f

    .line 123
    .line 124
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 125
    .line 126
    .line 127
    move-result v2

    .line 128
    neg-int v2, v2

    .line 129
    invoke-virtual {p2, v2}, Lcom/p1/mobile/android/ui/bubble/a;->x(I)Lcom/p1/mobile/android/ui/bubble/a;

    .line 130
    .line 131
    .line 132
    move-result-object p2

    .line 133
    const/4 v2, 0x0

    .line 134
    invoke-virtual {p2, v2}, Lcom/p1/mobile/android/ui/bubble/a;->K(I)Lcom/p1/mobile/android/ui/bubble/a;

    .line 135
    .line 136
    .line 137
    invoke-static {}, Lcom/p1/mobile/android/ui/bubble/d;->l()Lcom/p1/mobile/android/ui/bubble/d;

    .line 138
    .line 139
    .line 140
    move-result-object p2

    .line 141
    invoke-virtual {p2, v0, p1, v1}, Lcom/p1/mobile/android/ui/bubble/d;->u(Lcom/p1/mobile/android/ui/bubble/a;Landroid/view/View;Ljava/lang/String;)V

    .line 142
    .line 143
    .line 144
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->k1()V

    .line 145
    .line 146
    .line 147
    iput-boolean v3, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->J:Z

    .line 148
    .line 149
    iput-boolean v3, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->K:Z

    .line 150
    .line 151
    return-void
.end method

.method public final synthetic q0(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->K()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-interface {p1}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->ck()Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    const-string p1, "chat"

    .line 12
    .line 13
    invoke-static {p1}, Lcom/p1/mobile/putong/data/CoreGiftPanelName;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/CoreGiftPanelName;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->o1(Lcom/p1/mobile/putong/data/CoreGiftPanelName;)V

    .line 18
    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_0
    const-string p1, "greet"

    .line 22
    .line 23
    invoke-static {p1}, Lcom/p1/mobile/putong/data/CoreGiftPanelName;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/CoreGiftPanelName;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->o1(Lcom/p1/mobile/putong/data/CoreGiftPanelName;)V

    .line 28
    .line 29
    .line 30
    :goto_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->X()V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method public q1(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/CoreGiftPanelName;)V
    .locals 11

    .line 1
    invoke-static {}, Ll/joa;->G3()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->x:Lcom/p1/mobile/putong/core/ui/greet/GreetAct;

    .line 9
    .line 10
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/greet/GreetAct;->d2()Lcom/p1/mobile/putong/core/ui/greet/GreetingParam;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    iget v0, v0, Lcom/p1/mobile/putong/core/ui/greet/GreetingParam;->hotLevel:I

    .line 15
    .line 16
    if-lez v0, :cond_1

    .line 17
    .line 18
    const/4 v0, 0x0

    .line 19
    new-array v0, v0, [Ll/sfj0$a;

    .line 20
    .line 21
    const-string v1, "e_chat_gift_bar"

    .line 22
    .line 23
    const-string v2, "p_kankan_chat_popup"

    .line 24
    .line 25
    invoke-static {v1, v2, v0}, Ll/sfj0;->h(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 26
    .line 27
    .line 28
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->x:Lcom/p1/mobile/putong/core/ui/greet/GreetAct;

    .line 29
    .line 30
    new-instance v5, Ll/vbk;

    .line 31
    .line 32
    invoke-direct {v5, p0}, Ll/vbk;-><init>(Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;)V

    .line 33
    .line 34
    .line 35
    iget-object v6, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 36
    .line 37
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->z:Lcom/p1/mobile/putong/core/ui/greet/a;

    .line 38
    .line 39
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/greet/c;->getFrom()Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object v8

    .line 43
    new-instance v9, Ll/wbk;

    .line 44
    .line 45
    invoke-direct {v9, p0}, Ll/wbk;-><init>(Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;)V

    .line 46
    .line 47
    .line 48
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->x:Lcom/p1/mobile/putong/core/ui/greet/GreetAct;

    .line 49
    .line 50
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/greet/GreetAct;->d2()Lcom/p1/mobile/putong/core/ui/greet/GreetingParam;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    iget v10, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetingParam;->hotLevel:I

    .line 55
    .line 56
    const-string v7, "p_kankan_chat_popup"

    .line 57
    .line 58
    move-object v4, p2

    .line 59
    invoke-static/range {v3 .. v10}, Ll/vvj;->c(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/CoreGiftPanelName;Ll/y20;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ll/x20;I)V

    .line 60
    .line 61
    .line 62
    :cond_1
    :goto_0
    return-void
.end method

.method public r()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->m1()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->x:Lcom/p1/mobile/putong/core/ui/greet/GreetAct;

    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->setSwipeBackEnable(Z)V

    .line 8
    .line 9
    .line 10
    iput-boolean v1, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->E:Z

    .line 11
    .line 12
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->c0()Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->J:Z

    .line 17
    .line 18
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->s:Lv/VImage;

    .line 19
    .line 20
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    if-eqz v0, :cond_4

    .line 25
    .line 26
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->x:Lcom/p1/mobile/putong/core/ui/greet/GreetAct;

    .line 27
    .line 28
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/greet/GreetAct;->h2()Z

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    if-eqz v0, :cond_1

    .line 33
    .line 34
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->s:Lv/VImage;

    .line 35
    .line 36
    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/AppCompatImageView;->setBackgroundResource(I)V

    .line 37
    .line 38
    .line 39
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->s:Lv/VImage;

    .line 40
    .line 41
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    invoke-virtual {v1}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 46
    .line 47
    .line 48
    move-result-object v1

    .line 49
    invoke-interface {v1}, Ll/r97;->e()Z

    .line 50
    .line 51
    .line 52
    move-result v1

    .line 53
    if-eqz v1, :cond_0

    .line 54
    .line 55
    sget v1, Ll/ibc0;->G:I

    .line 56
    .line 57
    goto :goto_0

    .line 58
    :cond_0
    sget v1, Ll/ibc0;->H:I

    .line 59
    .line 60
    :goto_0
    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 61
    .line 62
    .line 63
    goto :goto_2

    .line 64
    :cond_1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->o:Ll/gta;

    .line 65
    .line 66
    invoke-virtual {v0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->I5()Z

    .line 71
    .line 72
    .line 73
    move-result v0

    .line 74
    if-nez v0, :cond_3

    .line 75
    .line 76
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 81
    .line 82
    .line 83
    move-result-object v0

    .line 84
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->jj()Z

    .line 85
    .line 86
    .line 87
    move-result v0

    .line 88
    if-eqz v0, :cond_2

    .line 89
    .line 90
    goto :goto_1

    .line 91
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->s:Lv/VImage;

    .line 92
    .line 93
    sget v1, Ll/ibc0;->o0:I

    .line 94
    .line 95
    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 96
    .line 97
    .line 98
    goto :goto_2

    .line 99
    :cond_3
    :goto_1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->s:Lv/VImage;

    .line 100
    .line 101
    sget v1, Ll/ibc0;->e6:I

    .line 102
    .line 103
    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 104
    .line 105
    .line 106
    :cond_4
    :goto_2
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->z:Lcom/p1/mobile/putong/core/ui/greet/a;

    .line 107
    .line 108
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/greet/a;->a1()Z

    .line 109
    .line 110
    .line 111
    move-result v0

    .line 112
    if-eqz v0, :cond_5

    .line 113
    .line 114
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->z:Lcom/p1/mobile/putong/core/ui/greet/a;

    .line 115
    .line 116
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/greet/c;->g0()Lcom/p1/mobile/putong/core/data/Greeting;

    .line 117
    .line 118
    .line 119
    move-result-object v0

    .line 120
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/Greeting;->moment:Lcom/p1/mobile/putong/data/IdBoxed;

    .line 121
    .line 122
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 123
    .line 124
    .line 125
    move-result v0

    .line 126
    if-eqz v0, :cond_5

    .line 127
    .line 128
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->z:Lcom/p1/mobile/putong/core/ui/greet/a;

    .line 129
    .line 130
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/greet/c;->g0()Lcom/p1/mobile/putong/core/data/Greeting;

    .line 131
    .line 132
    .line 133
    move-result-object v0

    .line 134
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/Greeting;->moment:Lcom/p1/mobile/putong/data/IdBoxed;

    .line 135
    .line 136
    iget-object v0, v0, Lcom/p1/mobile/putong/data/IdBoxed;->id:Ljava/lang/String;

    .line 137
    .line 138
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 139
    .line 140
    .line 141
    move-result v0

    .line 142
    if-eqz v0, :cond_5

    .line 143
    .line 144
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->A:Ll/tul;

    .line 145
    .line 146
    invoke-interface {v0}, Ll/tul;->O()V

    .line 147
    .line 148
    .line 149
    :cond_5
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->g:Lv/VList;

    .line 150
    .line 151
    invoke-virtual {v0}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    .line 152
    .line 153
    .line 154
    move-result-object v0

    .line 155
    new-instance v1, Ll/ack;

    .line 156
    .line 157
    invoke-direct {v1, p0}, Ll/ack;-><init>(Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;)V

    .line 158
    .line 159
    .line 160
    invoke-virtual {v0, v1}, Landroid/view/ViewTreeObserver;->addOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    .line 161
    .line 162
    .line 163
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->i0()V

    .line 164
    .line 165
    .line 166
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->v:Lv/VIcon;

    .line 167
    .line 168
    new-instance v1, Ll/bck;

    .line 169
    .line 170
    invoke-direct {v1, p0}, Ll/bck;-><init>(Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;)V

    .line 171
    .line 172
    .line 173
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 174
    .line 175
    .line 176
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->u:Lv/VIcon;

    .line 177
    .line 178
    new-instance v1, Ll/uak;

    .line 179
    .line 180
    invoke-direct {v1, p0}, Ll/uak;-><init>(Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;)V

    .line 181
    .line 182
    .line 183
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 184
    .line 185
    .line 186
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->n:Lv/VEditText;

    .line 187
    .line 188
    new-instance v1, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel$d;

    .line 189
    .line 190
    invoke-direct {v1, p0}, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel$d;-><init>(Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;)V

    .line 191
    .line 192
    .line 193
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 194
    .line 195
    .line 196
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->n:Lv/VEditText;

    .line 197
    .line 198
    const-string v1, ""

    .line 199
    .line 200
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 201
    .line 202
    .line 203
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->n:Lv/VEditText;

    .line 204
    .line 205
    new-instance v1, Ll/vak;

    .line 206
    .line 207
    invoke-direct {v1, p0}, Ll/vak;-><init>(Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;)V

    .line 208
    .line 209
    .line 210
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 211
    .line 212
    .line 213
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->o:Lv/VText;

    .line 214
    .line 215
    new-instance v1, Ll/wak;

    .line 216
    .line 217
    invoke-direct {v1, p0}, Ll/wak;-><init>(Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;)V

    .line 218
    .line 219
    .line 220
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 221
    .line 222
    .line 223
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->b:Landroid/view/View;

    .line 224
    .line 225
    new-instance v1, Ll/xak;

    .line 226
    .line 227
    invoke-direct {v1}, Ll/xak;-><init>()V

    .line 228
    .line 229
    .line 230
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 231
    .line 232
    .line 233
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->g:Lv/VList;

    .line 234
    .line 235
    new-instance v1, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel$e;

    .line 236
    .line 237
    invoke-direct {v1, p0}, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel$e;-><init>(Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;)V

    .line 238
    .line 239
    .line 240
    invoke-virtual {v0, v1}, Landroid/widget/AbsListView;->setOnScrollListener(Landroid/widget/AbsListView$OnScrollListener;)V

    .line 241
    .line 242
    .line 243
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->a:Lv/VFrame;

    .line 244
    .line 245
    new-instance v1, Ll/yak;

    .line 246
    .line 247
    invoke-direct {v1, p0}, Ll/yak;-><init>(Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;)V

    .line 248
    .line 249
    .line 250
    invoke-virtual {v0, v1}, Lv/VFrame;->setOnDispatchTouchEventListener(Ll/bm50;)V

    .line 251
    .line 252
    .line 253
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->x:Lcom/p1/mobile/putong/core/ui/greet/GreetAct;

    .line 254
    .line 255
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/greet/GreetAct;->d2()Lcom/p1/mobile/putong/core/ui/greet/GreetingParam;

    .line 256
    .line 257
    .line 258
    move-result-object v0

    .line 259
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/greet/GreetingParam;->preSendMsg:Ljava/lang/String;

    .line 260
    .line 261
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 262
    .line 263
    .line 264
    move-result v0

    .line 265
    if-nez v0, :cond_6

    .line 266
    .line 267
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->x:Lcom/p1/mobile/putong/core/ui/greet/GreetAct;

    .line 268
    .line 269
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/greet/GreetAct;->d2()Lcom/p1/mobile/putong/core/ui/greet/GreetingParam;

    .line 270
    .line 271
    .line 272
    move-result-object v0

    .line 273
    iget v0, v0, Lcom/p1/mobile/putong/core/ui/greet/GreetingParam;->hotLevel:I

    .line 274
    .line 275
    if-gtz v0, :cond_6

    .line 276
    .line 277
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->x:Lcom/p1/mobile/putong/core/ui/greet/GreetAct;

    .line 278
    .line 279
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/greet/GreetAct;->d2()Lcom/p1/mobile/putong/core/ui/greet/GreetingParam;

    .line 280
    .line 281
    .line 282
    move-result-object v0

    .line 283
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/greet/GreetingParam;->preSendMsg:Ljava/lang/String;

    .line 284
    .line 285
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->R0(Ljava/lang/String;)V

    .line 286
    .line 287
    .line 288
    :cond_6
    return-void
.end method

.method public final r1(Lcom/p1/mobile/putong/core/data/CoreGiftInfo;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->x:Lcom/p1/mobile/putong/core/ui/greet/GreetAct;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->x:Lcom/p1/mobile/putong/core/ui/greet/GreetAct;

    .line 10
    .line 11
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 12
    .line 13
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->H0:Ll/lqb;

    .line 14
    .line 15
    invoke-virtual {v1}, Ll/lqb;->k5()Lrx/c;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    const/4 v1, 0x1

    .line 24
    invoke-virtual {v0, v1}, Lrx/c;->take(I)Lrx/c;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    new-instance v1, Ll/ubk;

    .line 29
    .line 30
    invoke-direct {v1, p0, p1}, Ll/ubk;-><init>(Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;Lcom/p1/mobile/putong/core/data/CoreGiftInfo;)V

    .line 31
    .line 32
    .line 33
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 38
    .line 39
    .line 40
    :cond_0
    return-void
.end method

.method public final s1(Ljava/lang/String;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->x:Lcom/p1/mobile/putong/core/ui/greet/GreetAct;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->x:Lcom/p1/mobile/putong/core/ui/greet/GreetAct;

    .line 10
    .line 11
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 12
    .line 13
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->H0:Ll/lqb;

    .line 14
    .line 15
    invoke-virtual {v1}, Ll/lqb;->k5()Lrx/c;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    const/4 v1, 0x1

    .line 24
    invoke-virtual {v0, v1}, Lrx/c;->take(I)Lrx/c;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    new-instance v1, Ll/rbk;

    .line 29
    .line 30
    invoke-direct {v1, p0, p1}, Ll/rbk;-><init>(Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 38
    .line 39
    .line 40
    :cond_0
    return-void
.end method

.method public t1(Lcom/p1/mobile/putong/data/User;Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->A:Ll/tul;

    .line 2
    .line 3
    invoke-interface {p0, p1, p2}, Ll/tul;->k(Lcom/p1/mobile/putong/data/User;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public u1(Ljava/lang/String;Lcom/p1/mobile/putong/data/BubbleInfo;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->A:Ll/tul;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->z:Lcom/p1/mobile/putong/core/ui/greet/a;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/greet/c;->getFrom()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-interface {v0, p1, p2, p0}, Ll/tul;->n(Ljava/lang/String;Lcom/p1/mobile/putong/data/BubbleInfo;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final synthetic v0(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->U0(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public v1(Lcom/p1/mobile/putong/core/ui/greet/a;Lcom/p1/mobile/putong/data/User;Ljava/lang/String;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->a0()Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    const/4 v1, 0x0

    .line 10
    if-nez v0, :cond_0

    .line 11
    .line 12
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->a0()Ljava/util/List;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    invoke-virtual {p0, p1, v1}, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->h0(Ljava/util/List;I)V

    .line 17
    .line 18
    .line 19
    return-void

    .line 20
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-interface {v0}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->ld()Z

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    if-eqz v0, :cond_1

    .line 29
    .line 30
    const/4 v0, 0x1

    .line 31
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->l1(Z)V

    .line 32
    .line 33
    .line 34
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->A:Ll/tul;

    .line 35
    .line 36
    invoke-interface {v0, p1, p2, p3}, Ll/tul;->M(Lcom/p1/mobile/putong/core/ui/greet/a;Lcom/p1/mobile/putong/data/User;Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    const-string p3, "quick_reply"

    .line 40
    .line 41
    invoke-virtual {p0, p3}, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->e0(Ljava/lang/String;)Ljava/util/List;

    .line 42
    .line 43
    .line 44
    move-result-object p3

    .line 45
    invoke-virtual {p0, p3, v1}, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->h0(Ljava/util/List;I)V

    .line 46
    .line 47
    .line 48
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/greet/c;->g0()Lcom/p1/mobile/putong/core/data/Greeting;

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 53
    .line 54
    .line 55
    move-result p1

    .line 56
    if-eqz p1, :cond_1

    .line 57
    .line 58
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->n:Lv/VEditText;

    .line 59
    .line 60
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->d0(Lcom/p1/mobile/putong/data/User;)Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setHint(Ljava/lang/CharSequence;)V

    .line 65
    .line 66
    .line 67
    :cond_1
    return-void
.end method

.method public final synthetic x0(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Boolean;)V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->K()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->ck()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_1

    .line 10
    .line 11
    invoke-virtual {p4}, Ljava/lang/Boolean;->booleanValue()Z

    .line 12
    .line 13
    .line 14
    move-result p4

    .line 15
    if-nez p4, :cond_1

    .line 16
    .line 17
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->x:Lcom/p1/mobile/putong/core/ui/greet/GreetAct;

    .line 18
    .line 19
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/ui/greet/GreetAct;->l2()Z

    .line 20
    .line 21
    .line 22
    move-result p2

    .line 23
    if-eqz p2, :cond_0

    .line 24
    .line 25
    const-string p2, "privilege"

    .line 26
    .line 27
    const-string p3, ""

    .line 28
    .line 29
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->S0(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    return-void

    .line 33
    :cond_0
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->W(Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    return-void

    .line 37
    :cond_1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->S0(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method public final synthetic y0(Lcom/p1/mobile/putong/core/data/Message;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->z:Lcom/p1/mobile/putong/core/ui/greet/a;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/core/ui/greet/a;->J1(Lcom/p1/mobile/putong/core/data/Message;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->g:Lv/VList;

    .line 7
    .line 8
    invoke-virtual {p0}, Landroid/widget/AdapterView;->getCount()I

    .line 9
    .line 10
    .line 11
    move-result p1

    .line 12
    invoke-virtual {p0, p1}, Landroid/widget/AdapterView;->setSelection(I)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public final synthetic z0(Lcom/p1/mobile/putong/core/data/Message;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->g:Lv/VList;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/widget/AdapterView;->getLastVisiblePosition()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->g:Lv/VList;

    .line 8
    .line 9
    invoke-virtual {v1}, Landroid/widget/AdapterView;->getCount()I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    add-int/lit8 v1, v1, -0x1

    .line 14
    .line 15
    if-ne v0, v1, :cond_0

    .line 16
    .line 17
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->z:Lcom/p1/mobile/putong/core/ui/greet/a;

    .line 18
    .line 19
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/core/ui/greet/a;->J1(Lcom/p1/mobile/putong/core/data/Message;)V

    .line 20
    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->S()Lcom/p1/mobile/putong/core/ui/greet/GreetAct;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    new-instance v1, Ll/qbk;

    .line 28
    .line 29
    invoke-direct {v1, p0, p1}, Ll/qbk;-><init>(Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;Lcom/p1/mobile/putong/core/data/Message;)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->post(Ljava/lang/Runnable;)V

    .line 33
    .line 34
    .line 35
    :goto_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->g:Lv/VList;

    .line 36
    .line 37
    invoke-virtual {p0}, Landroid/widget/AdapterView;->getCount()I

    .line 38
    .line 39
    .line 40
    move-result p1

    .line 41
    invoke-virtual {p0, p1}, Landroid/widget/AdapterView;->setSelection(I)V

    .line 42
    .line 43
    .line 44
    return-void
.end method

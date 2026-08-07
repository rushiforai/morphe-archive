.class public Ll/zif0;
.super Ll/jbf0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/jbf0<",
        "Ll/gef0;",
        "Lcom/p1/mobile/putong/account/ui/accountai/SignUpAiAct;",
        ">;"
    }
.end annotation


# static fields
.field public static final T:Ll/wyd0;


# instance fields
.field public A:Lv/VLinear;

.field public B:Landroid/view/View;

.field public C:Landroid/animation/Animator;

.field public final D:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Landroid/animation/Animator;",
            ">;"
        }
    .end annotation
.end field

.field public E:Landroid/animation/Animator;

.field public F:Landroid/animation/Animator;

.field public G:Landroid/animation/Animator;

.field public H:Landroid/animation/Animator;

.field public I:Landroid/animation/Animator;

.field public J:Landroid/animation/Animator;

.field public K:Landroid/animation/Animator;

.field public L:Landroid/animation/Animator;

.field public final M:Ll/jxd0;

.field public final N:Ll/jxd0;
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "SV_USE_DUP_ID"
        }
    .end annotation
.end field

.field public final O:Ll/jxd0;
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "SV_USE_DUP_ID"
        }
    .end annotation
.end field

.field public P:I

.field public Q:Ljava/lang/String;

.field public R:Ljava/lang/Runnable;

.field public S:Lcom/p1/mobile/putong/data/SignUpData;

.field public c:Landroid/view/View;

.field public d:Lv/VDraweeView;

.field public e:Lv/VFrame;

.field public f:Lcom/tantan/library/svga/SVGAnimationView;

.field public g:Lv/VImage;

.field public h:Lv/VLinear;

.field public i:Lv/VRelative;

.field public j:Lv/VText;

.field public k:Lv/VImage;

.field public l:Lv/VText;

.field public m:Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/StepProgressView;

.field public n:Lv/VLinear;

.field public o:Lv/VImage;

.field public p:Lv/VText;

.field public q:Lv/VText;

.field public r:Lv/VText;

.field public s:Lv/VText;

.field public t:Lv/VRelative;

.field public u:Lv/VText;

.field public v:Lv/VImage;

.field public w:Lv/VImage;

.field public x:Lv/VImage;

.field public y:Lv/VText;

.field public z:Lv/VScroll;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 1
    new-instance v0, Ll/wyd0;

    .line 2
    .line 3
    const-string v1, "sign_up_gender_1"

    .line 4
    .line 5
    const-string v2, ""

    .line 6
    .line 7
    invoke-direct {v0, v1, v2}, Ll/wyd0;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    sput-object v0, Ll/zif0;->T:Ll/wyd0;

    .line 11
    .line 12
    return-void
.end method

.method public constructor <init>(Lcom/p1/mobile/putong/account/ui/accountai/SignUpAiAct;)V
    .locals 3
    .param p1    # Lcom/p1/mobile/putong/account/ui/accountai/SignUpAiAct;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1}, Ll/jbf0;-><init>(Lcom/p1/mobile/putong/app/PutongAct;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Ll/zif0;->D:Ljava/util/ArrayList;

    .line 10
    .line 11
    new-instance p1, Ll/jxd0;

    .line 12
    .line 13
    new-instance v0, Ljava/lang/StringBuilder;

    .line 14
    .line 15
    const-string v1, "show_welcome_1_"

    .line 16
    .line 17
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    invoke-static {}, Lcom/p1/mobile/putong/account/AccountModule;->F()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    invoke-interface {v1}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 36
    .line 37
    invoke-direct {p1, v0, v1}, Ll/jxd0;-><init>(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 38
    .line 39
    .line 40
    iput-object p1, p0, Ll/zif0;->M:Ll/jxd0;

    .line 41
    .line 42
    new-instance p1, Ll/jxd0;

    .line 43
    .line 44
    new-instance v0, Ljava/lang/StringBuilder;

    .line 45
    .line 46
    const-string v2, "has_jump_"

    .line 47
    .line 48
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 49
    .line 50
    .line 51
    invoke-static {}, Lcom/p1/mobile/putong/account/AccountModule;->F()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 52
    .line 53
    .line 54
    move-result-object v2

    .line 55
    invoke-interface {v2}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object v2

    .line 59
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 60
    .line 61
    .line 62
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    invoke-direct {p1, v0, v1}, Ll/jxd0;-><init>(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 67
    .line 68
    .line 69
    iput-object p1, p0, Ll/zif0;->N:Ll/jxd0;

    .line 70
    .line 71
    new-instance p1, Ll/jxd0;

    .line 72
    .line 73
    new-instance v0, Ljava/lang/StringBuilder;

    .line 74
    .line 75
    const-string v2, "has_submit_jump_"

    .line 76
    .line 77
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 78
    .line 79
    .line 80
    invoke-static {}, Lcom/p1/mobile/putong/account/AccountModule;->F()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 81
    .line 82
    .line 83
    move-result-object v2

    .line 84
    invoke-interface {v2}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 85
    .line 86
    .line 87
    move-result-object v2

    .line 88
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 89
    .line 90
    .line 91
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 92
    .line 93
    .line 94
    move-result-object v0

    .line 95
    invoke-direct {p1, v0, v1}, Ll/jxd0;-><init>(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 96
    .line 97
    .line 98
    iput-object p1, p0, Ll/zif0;->O:Ll/jxd0;

    .line 99
    .line 100
    const/4 p1, 0x0

    .line 101
    iput p1, p0, Ll/zif0;->P:I

    .line 102
    .line 103
    const-string p1, "\u80a5\u5189\u5c0f\u670b\u53cb"

    .line 104
    .line 105
    iput-object p1, p0, Ll/zif0;->Q:Ljava/lang/String;

    .line 106
    .line 107
    return-void
.end method

.method public static synthetic A(Ll/zif0;ILcom/p1/mobile/putong/account/ui/accountai/new2021/view/AgeView;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/zif0;->A1(ILcom/p1/mobile/putong/account/ui/accountai/new2021/view/AgeView;)V

    return-void
.end method

.method private A0()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/zif0;->O:Ll/jxd0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ljava/lang/Boolean;

    .line 8
    .line 9
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    iget-object v0, p0, Ll/jbf0;->a:Lcom/p1/mobile/putong/app/PutongAct;

    .line 16
    .line 17
    check-cast v0, Lcom/p1/mobile/putong/account/ui/accountai/SignUpAiAct;

    .line 18
    .line 19
    sget-object v1, Lcom/p1/mobile/putong/account/AccountModule;->c:Lcom/p1/mobile/putong/account/api/a;

    .line 20
    .line 21
    invoke-virtual {v1}, Lcom/p1/mobile/putong/account/api/a;->s2()Lrx/c;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    new-instance v1, Ll/chf0;

    .line 30
    .line 31
    invoke-direct {v1, p0}, Ll/chf0;-><init>(Ll/zif0;)V

    .line 32
    .line 33
    .line 34
    new-instance p0, Ll/dhf0;

    .line 35
    .line 36
    invoke-direct {p0}, Ll/dhf0;-><init>()V

    .line 37
    .line 38
    .line 39
    invoke-static {v1, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 44
    .line 45
    .line 46
    :cond_0
    return-void
.end method

.method public static synthetic B(Ll/zif0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/zif0;->u1()V

    return-void
.end method

.method public static synthetic C(Ll/zif0;Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/AgeView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/zif0;->M0(Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/AgeView;Landroid/view/View;)V

    return-void
.end method

.method private synthetic D0(Ljava/lang/Boolean;)V
    .locals 1

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
    iget-object p1, p0, Ll/jbf0;->a:Lcom/p1/mobile/putong/app/PutongAct;

    .line 8
    .line 9
    iget-object v0, p0, Ll/zif0;->z:Lv/VScroll;

    .line 10
    .line 11
    invoke-static {p1, v0}, Ll/bsj0;->s(Lcom/p1/mobile/android/app/Act;Lv/VScroll;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0}, Ll/zif0;->V1()V

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public static synthetic E(Ll/zif0;Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/GenderView;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/zif0;->X0(Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/GenderView;)V

    return-void
.end method

.method public static synthetic F(Ll/zif0;Ljava/lang/String;Ll/x20;Ll/kcg0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/zif0;->F1(Ljava/lang/String;Ll/x20;Ll/kcg0;)V

    return-void
.end method

.method public static synthetic G(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic H(Ll/zif0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/zif0;->V0()V

    return-void
.end method

.method public static synthetic I(Ll/zif0;Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/GenderView;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/zif0;->Q0(Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/GenderView;)V

    return-void
.end method

.method public static synthetic J(Ll/zif0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/zif0;->d1()V

    return-void
.end method

.method public static synthetic K(Ll/zif0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/zif0;->v1()V

    return-void
.end method

.method public static synthetic L(Ll/zif0;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/zif0;->B0(Ll/uxj0;)V

    return-void
.end method

.method public static synthetic M(Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/GenderView;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/GenderView;->S()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic N(Ll/zif0;Ll/x20;Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/GenderView;Lcom/p1/mobile/putong/data/Gender;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/zif0;->Z0(Ll/x20;Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/GenderView;Lcom/p1/mobile/putong/data/Gender;)V

    return-void
.end method

.method public static synthetic O(Ll/zif0;Ll/x20;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/zif0;->H1(Ll/x20;)V

    return-void
.end method

.method public static synthetic P(Ll/zif0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/zif0;->a1()V

    return-void
.end method

.method public static synthetic Q(Ll/zif0;Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/NameView;Ll/kcg0;Ll/x20;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/zif0;->t1(Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/NameView;Ll/kcg0;Ll/x20;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic R(Ll/zif0;Landroid/animation/Animator;Landroid/animation/Animator;Landroid/animation/Animator;Landroid/animation/Animator;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/zif0;->G1(Landroid/animation/Animator;Landroid/animation/Animator;Landroid/animation/Animator;Landroid/animation/Animator;)V

    return-void
.end method

.method public static synthetic S(Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/AgeView;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/AgeView;->V()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic T(Ll/zif0;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/zif0;->D0(Ljava/lang/Boolean;)V

    return-void
.end method

.method public static synthetic U()V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic V(Ll/zif0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/zif0;->e1()V

    return-void
.end method

.method public static synthetic W()V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic X(Ll/zif0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/zif0;->j1()V

    return-void
.end method

.method public static synthetic Y(Ll/zif0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/zif0;->E0()V

    return-void
.end method

.method public static synthetic Z(Ll/zif0;Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/NameView;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/zif0;->r1(Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/NameView;)V

    return-void
.end method

.method private Z1()V
    .locals 1

    .line 1
    invoke-static {}, Ll/bp;->h()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Ll/zif0;->N:Ll/jxd0;

    .line 8
    .line 9
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 10
    .line 11
    invoke-virtual {p0, v0}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public static synthetic a0(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method private a2()V
    .locals 1

    .line 1
    invoke-static {}, Ll/bp;->h()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Ll/zif0;->l:Lv/VText;

    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    invoke-static {p0, v0}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 11
    .line 12
    .line 13
    :cond_0
    return-void
.end method

.method public static synthetic b0(Ll/zif0;Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/AgeView;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/zif0;->J0(Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/AgeView;)V

    return-void
.end method

.method public static synthetic c0(Landroid/view/View;Ll/dgq0;)Ll/dgq0;
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p1}, Ll/dgq0;->i()I

    .line 3
    .line 4
    .line 5
    move-result v1

    .line 6
    invoke-virtual {p0, v0, v0, v0, v1}, Landroid/view/View;->setPadding(IIII)V

    .line 7
    .line 8
    .line 9
    return-object p1
.end method

.method public static synthetic d0(Ll/zif0;Lcom/p1/mobile/putong/data/Gender;Ll/x20;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/zif0;->B1(Lcom/p1/mobile/putong/data/Gender;Ll/x20;)V

    return-void
.end method

.method private d2(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ll/x20;Ll/x20;)V
    .locals 4

    .line 1
    const-string v0, "gender"

    .line 2
    .line 3
    invoke-virtual {v0, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    const-string v0, "p_ai_signup_gender_skip_pop"

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    const-string v0, "age"

    .line 13
    .line 14
    invoke-virtual {v0, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-eqz v0, :cond_1

    .line 19
    .line 20
    const-string v0, "p_ai_signup_age_skip_pop"

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_1
    const-string v0, "name"

    .line 24
    .line 25
    invoke-virtual {v0, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-eqz v0, :cond_2

    .line 30
    .line 31
    const-string v0, "p_ai_signup_name_skip_pop"

    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_2
    const-string v0, "photo"

    .line 35
    .line 36
    invoke-virtual {v0, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 37
    .line 38
    .line 39
    move-result v0

    .line 40
    if-eqz v0, :cond_3

    .line 41
    .line 42
    const-string v0, "p_ai_signup_photo_skip_pop"

    .line 43
    .line 44
    goto :goto_0

    .line 45
    :cond_3
    const-string v0, ""

    .line 46
    .line 47
    :goto_0
    const-class v1, Lcom/p1/mobile/android/app/Dialog;

    .line 48
    .line 49
    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object v1

    .line 53
    invoke-static {v0, v1}, Ll/w1e;->c(Ljava/lang/String;Ljava/lang/String;)Ll/l4g0;

    .line 54
    .line 55
    .line 56
    move-result-object v1

    .line 57
    new-instance v2, Ll/th0$a;

    .line 58
    .line 59
    iget-object v3, p0, Ll/jbf0;->a:Lcom/p1/mobile/putong/app/PutongAct;

    .line 60
    .line 61
    invoke-direct {v2, v3}, Ll/th0$a;-><init>(Landroid/content/Context;)V

    .line 62
    .line 63
    .line 64
    invoke-virtual {v2, p1}, Ll/th0$a;->j(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 65
    .line 66
    .line 67
    move-result-object p1

    .line 68
    invoke-virtual {p1, p2}, Ll/th0$a;->r(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 69
    .line 70
    .line 71
    move-result-object p1

    .line 72
    const-string p2, "\u4ecd\u8981\u8df3\u8fc7"

    .line 73
    .line 74
    invoke-virtual {p1, p2}, Ll/th0$a;->f(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 75
    .line 76
    .line 77
    move-result-object p1

    .line 78
    const/4 p2, 0x0

    .line 79
    invoke-virtual {p1, p2}, Ll/th0$a;->g(Z)Ll/th0$a;

    .line 80
    .line 81
    .line 82
    move-result-object p1

    .line 83
    new-instance v2, Ll/zif0$d;

    .line 84
    .line 85
    invoke-direct {v2, p0, v1}, Ll/zif0$d;-><init>(Ll/zif0;Ll/l4g0;)V

    .line 86
    .line 87
    .line 88
    invoke-virtual {p1, v2}, Ll/th0$a;->m(Landroid/content/DialogInterface$OnDismissListener;)Ll/th0$a;

    .line 89
    .line 90
    .line 91
    move-result-object p1

    .line 92
    invoke-virtual {p1, p2}, Ll/th0$a;->h(Z)Ll/th0$a;

    .line 93
    .line 94
    .line 95
    move-result-object p1

    .line 96
    new-instance p2, Ll/cif0;

    .line 97
    .line 98
    invoke-direct {p2, p0, v0, p3, p4}, Ll/cif0;-><init>(Ll/zif0;Ljava/lang/String;Ljava/lang/String;Ll/x20;)V

    .line 99
    .line 100
    .line 101
    invoke-virtual {p1, p2}, Ll/th0$a;->o(Landroid/view/View$OnClickListener;)Ll/th0$a;

    .line 102
    .line 103
    .line 104
    move-result-object p1

    .line 105
    new-instance p2, Ll/dif0;

    .line 106
    .line 107
    invoke-direct {p2, p0, v0, p3, p5}, Ll/dif0;-><init>(Ll/zif0;Ljava/lang/String;Ljava/lang/String;Ll/x20;)V

    .line 108
    .line 109
    .line 110
    invoke-virtual {p1, p2}, Ll/th0$a;->c(Landroid/view/View$OnClickListener;)Ll/th0$a;

    .line 111
    .line 112
    .line 113
    move-result-object p0

    .line 114
    invoke-static {v1}, Ll/w1e;->f(Ll/l4g0;)V

    .line 115
    .line 116
    .line 117
    invoke-virtual {p0}, Ll/th0$a;->a()Ll/th0;

    .line 118
    .line 119
    .line 120
    move-result-object p0

    .line 121
    invoke-virtual {p0}, Ll/th0;->g()V

    .line 122
    .line 123
    .line 124
    return-void
.end method

.method public static synthetic e0(Ll/zif0;Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/NameView;Lcom/p1/mobile/putong/account/data/RegisterNameEnvelope;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/zif0;->G0(Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/NameView;Lcom/p1/mobile/putong/account/data/RegisterNameEnvelope;)V

    return-void
.end method

.method private e2(Ljava/lang/String;Ljava/lang/String;Z)V
    .locals 2

    .line 1
    const-string p0, "gender"

    .line 2
    .line 3
    invoke-virtual {p0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    const-string v0, "skip"

    .line 8
    .line 9
    if-eqz p0, :cond_1

    .line 10
    .line 11
    if-eqz p3, :cond_0

    .line 12
    .line 13
    const-string v0, "choose_male"

    .line 14
    .line 15
    :cond_0
    const-string p0, "skip_gender"

    .line 16
    .line 17
    invoke-static {p0, v0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    filled-new-array {p0}, [Ll/pf60;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    const-string p2, "e_ai_signup_gender_skip_pop_again"

    .line 26
    .line 27
    invoke-static {p2, p1, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 28
    .line 29
    .line 30
    return-void

    .line 31
    :cond_1
    const-string p0, "age"

    .line 32
    .line 33
    invoke-virtual {p0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 34
    .line 35
    .line 36
    move-result p0

    .line 37
    const-string v1, "fill_out"

    .line 38
    .line 39
    if-eqz p0, :cond_3

    .line 40
    .line 41
    if-eqz p3, :cond_2

    .line 42
    .line 43
    move-object v0, v1

    .line 44
    :cond_2
    const-string p0, "skip_pop_age"

    .line 45
    .line 46
    invoke-static {p0, v0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    filled-new-array {p0}, [Ll/pf60;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    const-string p2, "e_ai_signup_age_skip_pop_again"

    .line 55
    .line 56
    invoke-static {p2, p1, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 57
    .line 58
    .line 59
    return-void

    .line 60
    :cond_3
    const-string p0, "name"

    .line 61
    .line 62
    invoke-virtual {p0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 63
    .line 64
    .line 65
    move-result p0

    .line 66
    if-eqz p0, :cond_5

    .line 67
    .line 68
    if-eqz p3, :cond_4

    .line 69
    .line 70
    move-object v0, v1

    .line 71
    :cond_4
    const-string p0, "skip_pop_name"

    .line 72
    .line 73
    invoke-static {p0, v0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 74
    .line 75
    .line 76
    move-result-object p0

    .line 77
    filled-new-array {p0}, [Ll/pf60;

    .line 78
    .line 79
    .line 80
    move-result-object p0

    .line 81
    const-string p2, "e_ai_signup_name_skip_pop_again"

    .line 82
    .line 83
    invoke-static {p2, p1, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 84
    .line 85
    .line 86
    return-void

    .line 87
    :cond_5
    const-string p0, "photo"

    .line 88
    .line 89
    invoke-virtual {p0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 90
    .line 91
    .line 92
    move-result p0

    .line 93
    if-eqz p0, :cond_7

    .line 94
    .line 95
    if-eqz p3, :cond_6

    .line 96
    .line 97
    move-object v0, v1

    .line 98
    :cond_6
    const-string p0, "skip_pop_photo"

    .line 99
    .line 100
    invoke-static {p0, v0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 101
    .line 102
    .line 103
    move-result-object p0

    .line 104
    filled-new-array {p0}, [Ll/pf60;

    .line 105
    .line 106
    .line 107
    move-result-object p0

    .line 108
    const-string p2, "e_ai_signup_photo_skip_pop_again"

    .line 109
    .line 110
    invoke-static {p2, p1, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 111
    .line 112
    .line 113
    :cond_7
    return-void
.end method

.method public static synthetic f0(Ll/zif0;Ll/x20;Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/GenderView;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/zif0;->S0(Ll/x20;Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/GenderView;)V

    return-void
.end method

.method public static synthetic g0(Ll/zif0;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/zif0;->n1(Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic h0(Ll/zif0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/zif0;->w1()V

    return-void
.end method

.method public static synthetic i0()V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic j(Ll/zif0;Ljava/lang/Integer;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/zif0;->H0(Ljava/lang/Integer;)V

    return-void
.end method

.method public static synthetic j0(Ll/zif0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/zif0;->N0()V

    return-void
.end method

.method public static synthetic k(Ll/zif0;Ljava/lang/String;Ljava/lang/String;Ll/x20;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/zif0;->C1(Ljava/lang/String;Ljava/lang/String;Ll/x20;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic k0(Ll/zif0;Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/AgeView;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/zif0;->L0(Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/AgeView;)V

    return-void
.end method

.method public static synthetic l(Ll/zif0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/zif0;->f1(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic l0(Ll/zif0;Ll/x20;Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/GenderView;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/zif0;->T0(Ll/x20;Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/GenderView;)V

    return-void
.end method

.method public static synthetic m(Ll/zif0;Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/GenderView;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/zif0;->Y0(Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/GenderView;)V

    return-void
.end method

.method public static synthetic m0(Ll/zif0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/zif0;->K0()V

    return-void
.end method

.method public static synthetic n(Ll/zif0;Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/NameView;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/zif0;->l1(Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/NameView;)V

    return-void
.end method

.method public static synthetic n0(Ll/zif0;Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/NameView;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/zif0;->g1(Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/NameView;Ljava/lang/Boolean;)V

    return-void
.end method

.method public static synthetic o0(Ll/zif0;Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/NameView;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/zif0;->m1(Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/NameView;)V

    return-void
.end method

.method public static synthetic p(Ll/zif0;Ljava/lang/String;Ljava/lang/String;Ll/x20;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/zif0;->E1(Ljava/lang/String;Ljava/lang/String;Ll/x20;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic p0(Ll/zif0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/zif0;->k1()V

    return-void
.end method

.method public static synthetic q(Ll/zif0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/zif0;->h1()V

    return-void
.end method

.method public static synthetic q0(Ll/zif0;Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/GenderView;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/zif0;->R0(Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/GenderView;)V

    return-void
.end method

.method private r()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/zif0;->j:Lv/VText;

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Ll/jbf0;->e(Landroid/view/View;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/zif0;->h:Lv/VLinear;

    .line 7
    .line 8
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    check-cast v0, Landroidx/constraintlayout/widget/ConstraintLayout$a;

    .line 13
    .line 14
    invoke-static {}, Ll/bnl0;->F0()I

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    iput v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    .line 19
    .line 20
    iget-object v1, p0, Ll/zif0;->h:Lv/VLinear;

    .line 21
    .line 22
    invoke-virtual {v1, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 23
    .line 24
    .line 25
    iget-object v0, p0, Ll/zif0;->z:Lv/VScroll;

    .line 26
    .line 27
    new-instance v1, Ll/ogf0;

    .line 28
    .line 29
    invoke-direct {v1}, Ll/ogf0;-><init>()V

    .line 30
    .line 31
    .line 32
    invoke-static {v0, v1}, Ll/kkl0;->y0(Landroid/view/View;Ll/il50;)V

    .line 33
    .line 34
    .line 35
    iget-object v0, p0, Ll/zif0;->m:Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/StepProgressView;

    .line 36
    .line 37
    const/4 v1, 0x4

    .line 38
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/StepProgressView;->setStepCount(I)V

    .line 39
    .line 40
    .line 41
    iget-object v0, p0, Ll/zif0;->m:Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/StepProgressView;

    .line 42
    .line 43
    sget v1, Ll/qa00;->e:I

    .line 44
    .line 45
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/StepProgressView;->setSpace(I)V

    .line 46
    .line 47
    .line 48
    iget-object v0, p0, Ll/zif0;->m:Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/StepProgressView;

    .line 49
    .line 50
    const/16 v1, 0x190

    .line 51
    .line 52
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/StepProgressView;->setStepAnimationDuration(I)V

    .line 53
    .line 54
    .line 55
    iget-object v0, p0, Ll/zif0;->m:Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/StepProgressView;

    .line 56
    .line 57
    const/4 v1, 0x0

    .line 58
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/StepProgressView;->setDefaultStep(I)V

    .line 59
    .line 60
    .line 61
    iget-object v0, p0, Ll/zif0;->p:Lv/VText;

    .line 62
    .line 63
    const/4 v2, 0x0

    .line 64
    invoke-virtual {v0, v2}, Landroid/view/View;->setAlpha(F)V

    .line 65
    .line 66
    .line 67
    iget-object v0, p0, Ll/zif0;->q:Lv/VText;

    .line 68
    .line 69
    invoke-virtual {v0, v2}, Landroid/view/View;->setAlpha(F)V

    .line 70
    .line 71
    .line 72
    iget-object v0, p0, Ll/zif0;->r:Lv/VText;

    .line 73
    .line 74
    invoke-virtual {v0, v2}, Landroid/view/View;->setAlpha(F)V

    .line 75
    .line 76
    .line 77
    iget-object v0, p0, Ll/zif0;->s:Lv/VText;

    .line 78
    .line 79
    invoke-virtual {v0, v2}, Landroid/view/View;->setAlpha(F)V

    .line 80
    .line 81
    .line 82
    iget-object v0, p0, Ll/zif0;->t:Lv/VRelative;

    .line 83
    .line 84
    invoke-virtual {v0, v2}, Landroid/view/View;->setAlpha(F)V

    .line 85
    .line 86
    .line 87
    iget-object v0, p0, Ll/zif0;->o:Lv/VImage;

    .line 88
    .line 89
    invoke-static {v0}, Ll/t;->d(Landroid/view/View;)Landroid/animation/Animator;

    .line 90
    .line 91
    .line 92
    move-result-object v0

    .line 93
    iput-object v0, p0, Ll/zif0;->C:Landroid/animation/Animator;

    .line 94
    .line 95
    iget-object v0, p0, Ll/jbf0;->b:Ll/ibf0;

    .line 96
    .line 97
    check-cast v0, Ll/gef0;

    .line 98
    .line 99
    iget-object v2, p0, Ll/zif0;->B:Landroid/view/View;

    .line 100
    .line 101
    invoke-static {v2}, Lcom/p1/mobile/android/app/Act;->keyboardListenerObservable(Landroid/view/View;)Lrx/c;

    .line 102
    .line 103
    .line 104
    move-result-object v2

    .line 105
    invoke-virtual {v0, v2}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 106
    .line 107
    .line 108
    move-result-object v0

    .line 109
    invoke-virtual {v0}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 110
    .line 111
    .line 112
    move-result-object v0

    .line 113
    new-instance v2, Ll/zgf0;

    .line 114
    .line 115
    invoke-direct {v2, p0}, Ll/zgf0;-><init>(Ll/zif0;)V

    .line 116
    .line 117
    .line 118
    invoke-static {v2}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 119
    .line 120
    .line 121
    move-result-object v2

    .line 122
    invoke-virtual {v0, v2}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 123
    .line 124
    .line 125
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 126
    .line 127
    iget-object v2, p0, Ll/zif0;->d:Lv/VDraweeView;

    .line 128
    .line 129
    const-string v3, "https://auto.tancdn.com/v1/raw/904432ed-ba77-4288-8865-1411b792009c10.webp"

    .line 130
    .line 131
    invoke-virtual {v0, v2, v3}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 132
    .line 133
    .line 134
    iget-object v0, p0, Ll/jbf0;->a:Lcom/p1/mobile/putong/app/PutongAct;

    .line 135
    .line 136
    invoke-static {v0}, Lcom/tantan/library/svga/SVGALoader;->with(Landroid/content/Context;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 137
    .line 138
    .line 139
    move-result-object v0

    .line 140
    const-string v2, "https://auto.tancdn.com/v1/raw/3c15132b-6c3e-487b-b09a-584b39754f2a11.pdf"

    .line 141
    .line 142
    invoke-virtual {v0, v2}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->from(Ljava/lang/String;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 143
    .line 144
    .line 145
    move-result-object v0

    .line 146
    invoke-virtual {v0, v1}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->autoPlay(Z)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 147
    .line 148
    .line 149
    move-result-object v0

    .line 150
    const/4 v2, 0x1

    .line 151
    invoke-virtual {v0, v2}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->repeatCount(I)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 152
    .line 153
    .line 154
    move-result-object v0

    .line 155
    iget-object v2, p0, Ll/zif0;->f:Lcom/tantan/library/svga/SVGAnimationView;

    .line 156
    .line 157
    invoke-virtual {v0, v2}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->into(Lcom/tantan/library/svga/SVGAnimationView;)V

    .line 158
    .line 159
    .line 160
    invoke-static {}, Ll/gsj0;->f()Z

    .line 161
    .line 162
    .line 163
    move-result v0

    .line 164
    if-eqz v0, :cond_0

    .line 165
    .line 166
    iget-object v0, p0, Ll/zif0;->i:Lv/VRelative;

    .line 167
    .line 168
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 169
    .line 170
    .line 171
    move-result-object v0

    .line 172
    check-cast v0, Landroid/widget/LinearLayout$LayoutParams;

    .line 173
    .line 174
    sget v2, Ll/qa00;->v:I

    .line 175
    .line 176
    iput v2, v0, Landroid/widget/LinearLayout$LayoutParams;->height:I

    .line 177
    .line 178
    iput v1, v0, Landroid/widget/LinearLayout$LayoutParams;->bottomMargin:I

    .line 179
    .line 180
    iget-object v2, p0, Ll/zif0;->i:Lv/VRelative;

    .line 181
    .line 182
    invoke-virtual {v2, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 183
    .line 184
    .line 185
    iget-object v0, p0, Ll/zif0;->j:Lv/VText;

    .line 186
    .line 187
    const/high16 v2, 0x41600000    # 14.0f

    .line 188
    .line 189
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setTextSize(F)V

    .line 190
    .line 191
    .line 192
    iget-object p0, p0, Ll/zif0;->n:Lv/VLinear;

    .line 193
    .line 194
    sget v0, Ll/qa00;->i:I

    .line 195
    .line 196
    invoke-virtual {p0, v1, v0, v1, v1}, Landroid/view/View;->setPadding(IIII)V

    .line 197
    .line 198
    .line 199
    :cond_0
    return-void
.end method

.method public static synthetic r0(Ll/zif0;Ll/x20;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/zif0;->I1(Ll/x20;)V

    return-void
.end method

.method public static synthetic s(Ll/zif0;Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/AgeView;Ljava/lang/Integer;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/zif0;->I0(Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/AgeView;Ljava/lang/Integer;)V

    return-void
.end method

.method public static synthetic s0(Ll/zif0;Ll/x20;Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/GenderView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/zif0;->U0(Ll/x20;Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/GenderView;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic t0(Ll/zif0;Ll/kcg0;Ll/x20;Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/NameView;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/zif0;->o1(Ll/kcg0;Ll/x20;Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/NameView;Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic u(Ll/zif0;Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/NameView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/zif0;->q1(Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/NameView;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic u0(Ll/zif0;Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/NameView;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/zif0;->p1(Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/NameView;)V

    return-void
.end method

.method public static synthetic v(Ll/zif0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/zif0;->y1()V

    return-void
.end method

.method public static synthetic v0(Ll/zif0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/zif0;->P0()V

    return-void
.end method

.method public static synthetic w(Ll/zif0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/zif0;->O0()V

    return-void
.end method

.method public static synthetic w0(Ll/zif0;Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/NameView;Ll/kcg0;Ll/x20;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/zif0;->s1(Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/NameView;Ll/kcg0;Ll/x20;)V

    return-void
.end method

.method public static synthetic x(Ll/zif0;Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/AgeView;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/zif0;->z1(Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/AgeView;)V

    return-void
.end method

.method public static synthetic x0(Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/NameView;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/NameView;->T()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic y(Ll/zif0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/zif0;->W0()V

    return-void
.end method

.method public static bridge synthetic y0(Ll/zif0;)Ll/jxd0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/zif0;->M:Ll/jxd0;

    return-object p0
.end method

.method public static synthetic z(Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/NameView;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/account/AccountModule;->c:Lcom/p1/mobile/putong/account/api/a;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/account/api/a;->I2()Ll/wyd0;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Ljava/lang/String;

    .line 12
    .line 13
    invoke-static {v0}, Ll/dy;->o0(Ljava/lang/String;)Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/NameView;->W(Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method


# virtual methods
.method public final synthetic A1(ILcom/p1/mobile/putong/account/ui/accountai/new2021/view/AgeView;)V
    .locals 3

    .line 1
    invoke-direct {p0}, Ll/zif0;->a2()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/lang/StringBuilder;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 7
    .line 8
    .line 9
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0}, Ll/jbf0;->a()Lcom/p1/mobile/putong/app/PutongAct;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    invoke-virtual {p1}, Lcom/p1/mobile/putong/app/PutongAct;->getResources()Landroid/content/res/Resources;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    sget v1, Lcom/p1/mobile/putong/account/R$string;->h:I

    .line 21
    .line 22
    invoke-virtual {p1, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    iget-object v0, p0, Ll/zif0;->s:Lv/VText;

    .line 34
    .line 35
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 36
    .line 37
    .line 38
    iget-object p1, p0, Ll/zif0;->s:Lv/VText;

    .line 39
    .line 40
    const/4 v0, 0x1

    .line 41
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 42
    .line 43
    .line 44
    iget-object p1, p0, Ll/zif0;->s:Lv/VText;

    .line 45
    .line 46
    const/4 v0, 0x0

    .line 47
    invoke-virtual {p1, v0}, Landroid/view/View;->setAlpha(F)V

    .line 48
    .line 49
    .line 50
    invoke-virtual {p0}, Ll/jbf0;->C0()Landroid/content/Context;

    .line 51
    .line 52
    .line 53
    move-result-object p1

    .line 54
    new-instance v0, Ll/eif0;

    .line 55
    .line 56
    invoke-direct {v0, p0, p2}, Ll/eif0;-><init>(Ll/zif0;Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/AgeView;)V

    .line 57
    .line 58
    .line 59
    const-wide/16 v1, 0xc8

    .line 60
    .line 61
    invoke-static {p1, v0, v1, v2}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 62
    .line 63
    .line 64
    const-string p0, "e_ai_signup_birthday_response"

    .line 65
    .line 66
    const-string p1, "p_ai_signup"

    .line 67
    .line 68
    invoke-static {p0, p1}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 69
    .line 70
    .line 71
    return-void
.end method

.method public final synthetic B0(Ll/uxj0;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/zif0;->O:Ll/jxd0;

    .line 2
    .line 3
    sget-object p1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic B1(Lcom/p1/mobile/putong/data/Gender;Ll/x20;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ll/zif0;->a2()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/zif0;->s:Lv/VText;

    .line 5
    .line 6
    const-string v1, "male"

    .line 7
    .line 8
    invoke-static {p1, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 9
    .line 10
    .line 11
    move-result p1

    .line 12
    iget-object v1, p0, Ll/jbf0;->a:Lcom/p1/mobile/putong/app/PutongAct;

    .line 13
    .line 14
    if-eqz p1, :cond_0

    .line 15
    .line 16
    check-cast v1, Lcom/p1/mobile/putong/account/ui/accountai/SignUpAiAct;

    .line 17
    .line 18
    sget p1, Lcom/p1/mobile/putong/account/R$string;->E2:I

    .line 19
    .line 20
    invoke-virtual {v1, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    goto :goto_0

    .line 25
    :cond_0
    check-cast v1, Lcom/p1/mobile/putong/account/ui/accountai/SignUpAiAct;

    .line 26
    .line 27
    sget p1, Lcom/p1/mobile/putong/account/R$string;->D2:I

    .line 28
    .line 29
    invoke-virtual {v1, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    :goto_0
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 34
    .line 35
    .line 36
    iget-object p1, p0, Ll/zif0;->s:Lv/VText;

    .line 37
    .line 38
    const/4 v0, 0x1

    .line 39
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 40
    .line 41
    .line 42
    iget-object p0, p0, Ll/zif0;->s:Lv/VText;

    .line 43
    .line 44
    const/4 p1, 0x0

    .line 45
    invoke-virtual {p0, p1}, Landroid/view/View;->setAlpha(F)V

    .line 46
    .line 47
    .line 48
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 49
    .line 50
    .line 51
    move-result p0

    .line 52
    if-eqz p0, :cond_1

    .line 53
    .line 54
    invoke-interface {p2}, Ll/x20;->call()V

    .line 55
    .line 56
    .line 57
    :cond_1
    const-string p0, "e_ai_signup_gender_response"

    .line 58
    .line 59
    const-string p1, "p_ai_signup"

    .line 60
    .line 61
    invoke-static {p0, p1}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 62
    .line 63
    .line 64
    return-void
.end method

.method public final synthetic C1(Ljava/lang/String;Ljava/lang/String;Ll/x20;Landroid/view/View;)V
    .locals 0

    .line 1
    const/4 p4, 0x1

    .line 2
    invoke-direct {p0, p1, p2, p4}, Ll/zif0;->e2(Ljava/lang/String;Ljava/lang/String;Z)V

    .line 3
    .line 4
    .line 5
    invoke-interface {p3}, Ll/x20;->call()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic E0()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jbf0;->b:Ll/ibf0;

    .line 2
    .line 3
    check-cast p0, Ll/gef0;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/gef0;->v1()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic E1(Ljava/lang/String;Ljava/lang/String;Ll/x20;Landroid/view/View;)V
    .locals 0

    .line 1
    const/4 p4, 0x0

    .line 2
    invoke-direct {p0, p1, p2, p4}, Ll/zif0;->e2(Ljava/lang/String;Ljava/lang/String;Z)V

    .line 3
    .line 4
    .line 5
    invoke-interface {p3}, Ll/x20;->call()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic F1(Ljava/lang/String;Ll/x20;Ll/kcg0;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ll/zif0;->a2()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/zif0;->s:Lv/VText;

    .line 5
    .line 6
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 7
    .line 8
    .line 9
    iget-object p1, p0, Ll/zif0;->s:Lv/VText;

    .line 10
    .line 11
    const/4 v0, 0x1

    .line 12
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 13
    .line 14
    .line 15
    iget-object p0, p0, Ll/zif0;->s:Lv/VText;

    .line 16
    .line 17
    const/4 p1, 0x0

    .line 18
    invoke-virtual {p0, p1}, Landroid/view/View;->setAlpha(F)V

    .line 19
    .line 20
    .line 21
    invoke-interface {p2}, Ll/x20;->call()V

    .line 22
    .line 23
    .line 24
    invoke-static {p3}, Ll/psd0;->z(Ll/kcg0;)V

    .line 25
    .line 26
    .line 27
    const-string p0, "e_ai_signup_name_response"

    .line 28
    .line 29
    const-string p1, "p_ai_signup"

    .line 30
    .line 31
    invoke-static {p0, p1}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public final synthetic G0(Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/NameView;Lcom/p1/mobile/putong/account/data/RegisterNameEnvelope;)V
    .locals 1

    .line 1
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p2, Lcom/p1/mobile/putong/account/data/RegisterNameEnvelope;->data:Lcom/p1/mobile/putong/account/data/RegisterName;

    .line 8
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
    iget-object v0, p2, Lcom/p1/mobile/putong/account/data/RegisterNameEnvelope;->data:Lcom/p1/mobile/putong/account/data/RegisterName;

    .line 16
    .line 17
    iget-object v0, v0, Lcom/p1/mobile/putong/account/data/RegisterName;->name:Ljava/lang/String;

    .line 18
    .line 19
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-nez v0, :cond_0

    .line 24
    .line 25
    iget-object p2, p2, Lcom/p1/mobile/putong/account/data/RegisterNameEnvelope;->data:Lcom/p1/mobile/putong/account/data/RegisterName;

    .line 26
    .line 27
    iget-object p2, p2, Lcom/p1/mobile/putong/account/data/RegisterName;->name:Ljava/lang/String;

    .line 28
    .line 29
    iput-object p2, p0, Ll/zif0;->Q:Ljava/lang/String;

    .line 30
    .line 31
    invoke-static {p2}, Ll/dy;->o0(Ljava/lang/String;)Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/NameView;->W(Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    :cond_0
    return-void
.end method

.method public final synthetic G1(Landroid/animation/Animator;Landroid/animation/Animator;Landroid/animation/Animator;Landroid/animation/Animator;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/zif0;->o:Lv/VImage;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/View;->getWidth()I

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    div-int/lit8 v1, v1, 0x2

    .line 8
    .line 9
    int-to-float v1, v1

    .line 10
    invoke-virtual {v0, v1}, Landroid/view/View;->setPivotX(F)V

    .line 11
    .line 12
    .line 13
    iget-object p0, p0, Ll/zif0;->o:Lv/VImage;

    .line 14
    .line 15
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    div-int/lit8 v0, v0, 0x2

    .line 20
    .line 21
    int-to-float v0, v0

    .line 22
    invoke-virtual {p0, v0}, Landroid/view/View;->setPivotY(F)V

    .line 23
    .line 24
    .line 25
    filled-new-array {p1, p2, p3, p4}, [Landroid/animation/Animator;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    invoke-static {p0}, Ll/gt0;->z([Landroid/animation/Animator;)Landroid/animation/Animator;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    invoke-virtual {p0}, Landroid/animation/Animator;->start()V

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public final synthetic H0(Ljava/lang/Integer;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    iget-object p1, p0, Ll/zif0;->r:Lv/VText;

    .line 8
    .line 9
    iget-object v0, p0, Ll/jbf0;->a:Lcom/p1/mobile/putong/app/PutongAct;

    .line 10
    .line 11
    check-cast v0, Lcom/p1/mobile/putong/account/ui/accountai/SignUpAiAct;

    .line 12
    .line 13
    sget v1, Lcom/p1/mobile/putong/account/R$string;->m:I

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 20
    .line 21
    .line 22
    iget-object p1, p0, Ll/zif0;->r:Lv/VText;

    .line 23
    .line 24
    sget v0, Ll/bbc0;->D1:I

    .line 25
    .line 26
    invoke-virtual {p1, v0}, Landroidx/appcompat/widget/AppCompatTextView;->setBackgroundResource(I)V

    .line 27
    .line 28
    .line 29
    iget-object p1, p0, Ll/zif0;->r:Lv/VText;

    .line 30
    .line 31
    invoke-virtual {p0}, Ll/jbf0;->a()Lcom/p1/mobile/putong/app/PutongAct;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    invoke-virtual {p0}, Lcom/p1/mobile/putong/app/PutongAct;->getResources()Landroid/content/res/Resources;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    sget v0, Ll/a9c0;->l:I

    .line 40
    .line 41
    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getColor(I)I

    .line 42
    .line 43
    .line 44
    move-result p0

    .line 45
    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 46
    .line 47
    .line 48
    const/4 p0, 0x0

    .line 49
    new-array p0, p0, [Ll/pf60;

    .line 50
    .line 51
    const-string p1, "e_ai_signup_age"

    .line 52
    .line 53
    const-string v0, "p_ai_signup"

    .line 54
    .line 55
    invoke-static {p1, v0, p0}, Ll/i4g0;->v(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 56
    .line 57
    .line 58
    return-void

    .line 59
    :cond_0
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 60
    .line 61
    .line 62
    move-result v0

    .line 63
    const/4 v1, 0x1

    .line 64
    if-ne v0, v1, :cond_1

    .line 65
    .line 66
    iget-object p1, p0, Ll/zif0;->r:Lv/VText;

    .line 67
    .line 68
    iget-object v0, p0, Ll/jbf0;->a:Lcom/p1/mobile/putong/app/PutongAct;

    .line 69
    .line 70
    check-cast v0, Lcom/p1/mobile/putong/account/ui/accountai/SignUpAiAct;

    .line 71
    .line 72
    sget v1, Lcom/p1/mobile/putong/account/R$string;->m:I

    .line 73
    .line 74
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 75
    .line 76
    .line 77
    move-result-object v0

    .line 78
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 79
    .line 80
    .line 81
    goto :goto_0

    .line 82
    :cond_1
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 83
    .line 84
    .line 85
    move-result v0

    .line 86
    const/4 v1, 0x4

    .line 87
    if-ne v0, v1, :cond_2

    .line 88
    .line 89
    iget-object p1, p0, Ll/zif0;->r:Lv/VText;

    .line 90
    .line 91
    iget-object v0, p0, Ll/jbf0;->a:Lcom/p1/mobile/putong/app/PutongAct;

    .line 92
    .line 93
    check-cast v0, Lcom/p1/mobile/putong/account/ui/accountai/SignUpAiAct;

    .line 94
    .line 95
    sget v1, Lcom/p1/mobile/putong/account/R$string;->n:I

    .line 96
    .line 97
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 98
    .line 99
    .line 100
    move-result-object v0

    .line 101
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 102
    .line 103
    .line 104
    goto :goto_0

    .line 105
    :cond_2
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 106
    .line 107
    .line 108
    move-result p1

    .line 109
    const/4 v0, 0x5

    .line 110
    if-ne p1, v0, :cond_3

    .line 111
    .line 112
    iget-object p1, p0, Ll/zif0;->r:Lv/VText;

    .line 113
    .line 114
    iget-object v0, p0, Ll/jbf0;->a:Lcom/p1/mobile/putong/app/PutongAct;

    .line 115
    .line 116
    check-cast v0, Lcom/p1/mobile/putong/account/ui/accountai/SignUpAiAct;

    .line 117
    .line 118
    sget v1, Lcom/p1/mobile/putong/account/R$string;->o:I

    .line 119
    .line 120
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 121
    .line 122
    .line 123
    move-result-object v0

    .line 124
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 125
    .line 126
    .line 127
    :cond_3
    :goto_0
    iget-object p1, p0, Ll/zif0;->r:Lv/VText;

    .line 128
    .line 129
    sget v0, Ll/bbc0;->E1:I

    .line 130
    .line 131
    invoke-virtual {p1, v0}, Landroidx/appcompat/widget/AppCompatTextView;->setBackgroundResource(I)V

    .line 132
    .line 133
    .line 134
    iget-object p1, p0, Ll/zif0;->r:Lv/VText;

    .line 135
    .line 136
    invoke-virtual {p0}, Ll/jbf0;->a()Lcom/p1/mobile/putong/app/PutongAct;

    .line 137
    .line 138
    .line 139
    move-result-object v0

    .line 140
    invoke-virtual {v0}, Lcom/p1/mobile/putong/app/PutongAct;->getResources()Landroid/content/res/Resources;

    .line 141
    .line 142
    .line 143
    move-result-object v0

    .line 144
    sget v1, Ll/a9c0;->k:I

    .line 145
    .line 146
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getColor(I)I

    .line 147
    .line 148
    .line 149
    move-result v0

    .line 150
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 151
    .line 152
    .line 153
    iget-object p1, p0, Ll/jbf0;->a:Lcom/p1/mobile/putong/app/PutongAct;

    .line 154
    .line 155
    iget-object v0, p0, Ll/zif0;->r:Lv/VText;

    .line 156
    .line 157
    invoke-static {p1, v0}, Ll/t;->c(Landroid/content/Context;Landroid/view/View;)V

    .line 158
    .line 159
    .line 160
    invoke-virtual {p0}, Ll/zif0;->V1()V

    .line 161
    .line 162
    .line 163
    return-void
.end method

.method public final synthetic H1(Ll/x20;)V
    .locals 22

    .line 1
    move-object/from16 v1, p0

    .line 2
    .line 3
    new-instance v0, Ll/tyf0;

    .line 4
    .line 5
    iget-object v2, v1, Ll/zif0;->g:Lv/VImage;

    .line 6
    .line 7
    sget-object v3, Ll/bge;->p:Ll/bge$s;

    .line 8
    .line 9
    invoke-direct {v0, v2, v3}, Ll/tyf0;-><init>(Ljava/lang/Object;Ll/ysi;)V

    .line 10
    .line 11
    .line 12
    new-instance v2, Ll/ezf0;

    .line 13
    .line 14
    invoke-direct {v2}, Ll/ezf0;-><init>()V

    .line 15
    .line 16
    .line 17
    const v3, 0x3e99999a    # 0.3f

    .line 18
    .line 19
    .line 20
    invoke-virtual {v2, v3}, Ll/ezf0;->d(F)Ll/ezf0;

    .line 21
    .line 22
    .line 23
    move-result-object v4

    .line 24
    const/high16 v5, 0x44160000    # 600.0f

    .line 25
    .line 26
    invoke-virtual {v4, v5}, Ll/ezf0;->f(F)Ll/ezf0;

    .line 27
    .line 28
    .line 29
    invoke-virtual {v0, v2}, Ll/tyf0;->r(Ll/ezf0;)Ll/tyf0;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    const/4 v2, 0x0

    .line 34
    invoke-virtual {v0, v2}, Ll/bge;->k(F)Ll/bge;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    check-cast v0, Ll/tyf0;

    .line 39
    .line 40
    const/high16 v4, 0x3f000000    # 0.5f

    .line 41
    .line 42
    invoke-virtual {v0, v4}, Ll/bge;->j(F)Ll/bge;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    check-cast v0, Ll/tyf0;

    .line 47
    .line 48
    const/high16 v6, 0x3f800000    # 1.0f

    .line 49
    .line 50
    invoke-virtual {v0, v6}, Ll/tyf0;->o(F)V

    .line 51
    .line 52
    .line 53
    new-instance v0, Ll/tyf0;

    .line 54
    .line 55
    iget-object v7, v1, Ll/zif0;->g:Lv/VImage;

    .line 56
    .line 57
    sget-object v8, Ll/bge;->q:Ll/bge$s;

    .line 58
    .line 59
    invoke-direct {v0, v7, v8}, Ll/tyf0;-><init>(Ljava/lang/Object;Ll/ysi;)V

    .line 60
    .line 61
    .line 62
    new-instance v7, Ll/ezf0;

    .line 63
    .line 64
    invoke-direct {v7}, Ll/ezf0;-><init>()V

    .line 65
    .line 66
    .line 67
    invoke-virtual {v7, v3}, Ll/ezf0;->d(F)Ll/ezf0;

    .line 68
    .line 69
    .line 70
    move-result-object v3

    .line 71
    invoke-virtual {v3, v5}, Ll/ezf0;->f(F)Ll/ezf0;

    .line 72
    .line 73
    .line 74
    invoke-virtual {v0, v7}, Ll/tyf0;->r(Ll/ezf0;)Ll/tyf0;

    .line 75
    .line 76
    .line 77
    move-result-object v0

    .line 78
    invoke-virtual {v0, v2}, Ll/bge;->k(F)Ll/bge;

    .line 79
    .line 80
    .line 81
    move-result-object v0

    .line 82
    check-cast v0, Ll/tyf0;

    .line 83
    .line 84
    invoke-virtual {v0, v4}, Ll/bge;->j(F)Ll/bge;

    .line 85
    .line 86
    .line 87
    move-result-object v0

    .line 88
    check-cast v0, Ll/tyf0;

    .line 89
    .line 90
    invoke-virtual {v0, v6}, Ll/tyf0;->o(F)V

    .line 91
    .line 92
    .line 93
    iget-object v7, v1, Ll/zif0;->g:Lv/VImage;

    .line 94
    .line 95
    sget-object v9, Landroid/view/View;->ALPHA:Landroid/util/Property;

    .line 96
    .line 97
    new-instance v13, Landroid/view/animation/PathInterpolator;

    .line 98
    .line 99
    const v0, 0x3f147ae1    # 0.58f

    .line 100
    .line 101
    .line 102
    const v3, 0x3ed70a3d    # 0.42f

    .line 103
    .line 104
    .line 105
    invoke-direct {v13, v3, v2, v0, v6}, Landroid/view/animation/PathInterpolator;-><init>(FFFF)V

    .line 106
    .line 107
    .line 108
    const/4 v0, 0x2

    .line 109
    new-array v14, v0, [F

    .line 110
    .line 111
    fill-array-data v14, :array_0

    .line 112
    .line 113
    .line 114
    move-object v8, v9

    .line 115
    const-wide/16 v9, 0x0

    .line 116
    .line 117
    const-wide/16 v11, 0x82

    .line 118
    .line 119
    invoke-static/range {v7 .. v14}, Ll/gt0;->l(Landroid/view/View;Landroid/util/Property;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 120
    .line 121
    .line 122
    move-result-object v4

    .line 123
    move-object v9, v8

    .line 124
    invoke-virtual {v4}, Landroid/animation/Animator;->start()V

    .line 125
    .line 126
    .line 127
    new-array v4, v0, [I

    .line 128
    .line 129
    iget-object v5, v1, Ll/zif0;->o:Lv/VImage;

    .line 130
    .line 131
    invoke-virtual {v5, v4}, Landroid/view/View;->getLocationInWindow([I)V

    .line 132
    .line 133
    .line 134
    const/4 v5, 0x0

    .line 135
    aget v7, v4, v5

    .line 136
    .line 137
    sget v8, Ll/qa00;->o:I

    .line 138
    .line 139
    add-int/2addr v7, v8

    .line 140
    const/4 v10, 0x1

    .line 141
    aget v11, v4, v10

    .line 142
    .line 143
    add-int/2addr v11, v8

    .line 144
    iget-object v8, v1, Ll/zif0;->g:Lv/VImage;

    .line 145
    .line 146
    invoke-virtual {v8, v4}, Landroid/view/View;->getLocationInWindow([I)V

    .line 147
    .line 148
    .line 149
    aget v8, v4, v5

    .line 150
    .line 151
    sget v12, Ll/qa00;->C:I

    .line 152
    .line 153
    add-int/2addr v8, v12

    .line 154
    aget v4, v4, v10

    .line 155
    .line 156
    add-int/2addr v4, v12

    .line 157
    iget-object v12, v1, Ll/zif0;->g:Lv/VImage;

    .line 158
    .line 159
    sget-object v13, Landroid/view/View;->TRANSLATION_X:Landroid/util/Property;

    .line 160
    .line 161
    new-instance v14, Landroid/view/animation/PathInterpolator;

    .line 162
    .line 163
    const v15, 0x3e4ccccd    # 0.2f

    .line 164
    .line 165
    .line 166
    invoke-direct {v14, v3, v2, v15, v6}, Landroid/view/animation/PathInterpolator;-><init>(FFFF)V

    .line 167
    .line 168
    .line 169
    sub-int/2addr v7, v8

    .line 170
    int-to-float v7, v7

    .line 171
    new-array v8, v10, [F

    .line 172
    .line 173
    aput v7, v8, v5

    .line 174
    .line 175
    move-object/from16 v18, v14

    .line 176
    .line 177
    move v7, v15

    .line 178
    const-wide/16 v14, 0x0

    .line 179
    .line 180
    const-wide/16 v16, 0x258

    .line 181
    .line 182
    move-object/from16 v19, v8

    .line 183
    .line 184
    invoke-static/range {v12 .. v19}, Ll/gt0;->l(Landroid/view/View;Landroid/util/Property;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 185
    .line 186
    .line 187
    move-result-object v8

    .line 188
    iget-object v12, v1, Ll/zif0;->g:Lv/VImage;

    .line 189
    .line 190
    sget-object v13, Landroid/view/View;->TRANSLATION_Y:Landroid/util/Property;

    .line 191
    .line 192
    new-instance v14, Landroid/view/animation/PathInterpolator;

    .line 193
    .line 194
    invoke-direct {v14, v3, v2, v7, v6}, Landroid/view/animation/PathInterpolator;-><init>(FFFF)V

    .line 195
    .line 196
    .line 197
    sub-int/2addr v11, v4

    .line 198
    int-to-float v4, v11

    .line 199
    new-array v10, v10, [F

    .line 200
    .line 201
    aput v4, v10, v5

    .line 202
    .line 203
    move-object/from16 v18, v14

    .line 204
    .line 205
    const-wide/16 v14, 0x0

    .line 206
    .line 207
    move-object/from16 v19, v10

    .line 208
    .line 209
    invoke-static/range {v12 .. v19}, Ll/gt0;->l(Landroid/view/View;Landroid/util/Property;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 210
    .line 211
    .line 212
    move-result-object v4

    .line 213
    iget-object v10, v1, Ll/zif0;->g:Lv/VImage;

    .line 214
    .line 215
    sget-object v11, Ll/gt0;->i:Landroid/util/Property;

    .line 216
    .line 217
    new-instance v5, Landroid/view/animation/PathInterpolator;

    .line 218
    .line 219
    invoke-direct {v5, v3, v2, v7, v6}, Landroid/view/animation/PathInterpolator;-><init>(FFFF)V

    .line 220
    .line 221
    .line 222
    new-array v12, v0, [F

    .line 223
    .line 224
    fill-array-data v12, :array_1

    .line 225
    .line 226
    .line 227
    move-object/from16 v17, v12

    .line 228
    .line 229
    const-wide/16 v12, 0x0

    .line 230
    .line 231
    const-wide/16 v14, 0x258

    .line 232
    .line 233
    move-object/from16 v16, v5

    .line 234
    .line 235
    invoke-static/range {v10 .. v17}, Ll/gt0;->l(Landroid/view/View;Landroid/util/Property;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 236
    .line 237
    .line 238
    move-result-object v5

    .line 239
    move-object v10, v8

    .line 240
    iget-object v8, v1, Ll/zif0;->i:Lv/VRelative;

    .line 241
    .line 242
    new-instance v14, Landroid/view/animation/PathInterpolator;

    .line 243
    .line 244
    invoke-direct {v14, v3, v2, v7, v6}, Landroid/view/animation/PathInterpolator;-><init>(FFFF)V

    .line 245
    .line 246
    .line 247
    new-array v15, v0, [F

    .line 248
    .line 249
    fill-array-data v15, :array_2

    .line 250
    .line 251
    .line 252
    move-object v12, v10

    .line 253
    const-wide/16 v10, 0x0

    .line 254
    .line 255
    move-object/from16 v16, v12

    .line 256
    .line 257
    const-wide/16 v12, 0x258

    .line 258
    .line 259
    move-object/from16 v20, v16

    .line 260
    .line 261
    invoke-static/range {v8 .. v15}, Ll/gt0;->l(Landroid/view/View;Landroid/util/Property;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 262
    .line 263
    .line 264
    move-result-object v8

    .line 265
    move-object v10, v8

    .line 266
    iget-object v8, v1, Ll/zif0;->m:Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/StepProgressView;

    .line 267
    .line 268
    new-instance v14, Landroid/view/animation/PathInterpolator;

    .line 269
    .line 270
    invoke-direct {v14, v3, v2, v7, v6}, Landroid/view/animation/PathInterpolator;-><init>(FFFF)V

    .line 271
    .line 272
    .line 273
    new-array v15, v0, [F

    .line 274
    .line 275
    fill-array-data v15, :array_3

    .line 276
    .line 277
    .line 278
    move-object v12, v10

    .line 279
    const-wide/16 v10, 0x0

    .line 280
    .line 281
    move-object/from16 v16, v12

    .line 282
    .line 283
    const-wide/16 v12, 0x258

    .line 284
    .line 285
    move-object/from16 v21, v16

    .line 286
    .line 287
    invoke-static/range {v8 .. v15}, Ll/gt0;->l(Landroid/view/View;Landroid/util/Property;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 288
    .line 289
    .line 290
    move-result-object v8

    .line 291
    move-object v10, v8

    .line 292
    iget-object v8, v1, Ll/zif0;->d:Lv/VDraweeView;

    .line 293
    .line 294
    new-instance v14, Landroid/view/animation/PathInterpolator;

    .line 295
    .line 296
    invoke-direct {v14, v3, v2, v7, v6}, Landroid/view/animation/PathInterpolator;-><init>(FFFF)V

    .line 297
    .line 298
    .line 299
    new-array v15, v0, [F

    .line 300
    .line 301
    fill-array-data v15, :array_4

    .line 302
    .line 303
    .line 304
    move-object v0, v10

    .line 305
    const-wide/16 v10, 0x0

    .line 306
    .line 307
    invoke-static/range {v8 .. v15}, Ll/gt0;->l(Landroid/view/View;Landroid/util/Property;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 308
    .line 309
    .line 310
    move-result-object v2

    .line 311
    new-instance v3, Ll/zif0$a;

    .line 312
    .line 313
    move-object/from16 v6, p1

    .line 314
    .line 315
    invoke-direct {v3, v1, v6}, Ll/zif0$a;-><init>(Ll/zif0;Ll/x20;)V

    .line 316
    .line 317
    .line 318
    invoke-virtual {v0, v3}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 319
    .line 320
    .line 321
    new-instance v3, Ll/zif0$b;

    .line 322
    .line 323
    move-object/from16 v10, v21

    .line 324
    .line 325
    invoke-direct {v3, v1, v10, v0}, Ll/zif0$b;-><init>(Ll/zif0;Landroid/animation/Animator;Landroid/animation/Animator;)V

    .line 326
    .line 327
    .line 328
    move-object/from16 v10, v20

    .line 329
    .line 330
    invoke-virtual {v10, v3}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 331
    .line 332
    .line 333
    iget-object v6, v1, Ll/jbf0;->a:Lcom/p1/mobile/putong/app/PutongAct;

    .line 334
    .line 335
    new-instance v0, Ll/fif0;

    .line 336
    .line 337
    move-object v3, v4

    .line 338
    move-object v4, v5

    .line 339
    move-object v5, v2

    .line 340
    move-object v2, v10

    .line 341
    invoke-direct/range {v0 .. v5}, Ll/fif0;-><init>(Ll/zif0;Landroid/animation/Animator;Landroid/animation/Animator;Landroid/animation/Animator;Landroid/animation/Animator;)V

    .line 342
    .line 343
    .line 344
    const-wide/16 v1, 0x9c4

    .line 345
    .line 346
    invoke-static {v6, v0, v1, v2}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 347
    .line 348
    .line 349
    return-void

    .line 350
    nop

    .line 351
    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data

    .line 352
    .line 353
    .line 354
    .line 355
    .line 356
    .line 357
    .line 358
    .line 359
    :array_1
    .array-data 4
        0x3f800000    # 1.0f
        0x3ebda123    # 0.37037f
    .end array-data

    .line 360
    .line 361
    .line 362
    .line 363
    .line 364
    .line 365
    .line 366
    .line 367
    :array_2
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data

    .line 368
    .line 369
    .line 370
    .line 371
    .line 372
    .line 373
    .line 374
    .line 375
    :array_3
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data

    .line 376
    .line 377
    .line 378
    .line 379
    .line 380
    .line 381
    .line 382
    .line 383
    :array_4
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public final synthetic I0(Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/AgeView;Ljava/lang/Integer;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ll/zif0;->Z1()V

    .line 2
    .line 3
    .line 4
    const-string v0, ""

    .line 5
    .line 6
    invoke-virtual {p0, v0}, Ll/zif0;->S1(Ljava/lang/String;)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    .line 10
    .line 11
    .line 12
    move-result p2

    .line 13
    invoke-virtual {p0, p2, p1}, Ll/zif0;->X1(ILcom/p1/mobile/putong/account/ui/accountai/new2021/view/AgeView;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public final synthetic I1(Ll/x20;)V
    .locals 2

    .line 1
    iget-object p0, p0, Ll/zif0;->f:Lcom/tantan/library/svga/SVGAnimationView;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    const/4 v1, 0x1

    .line 5
    invoke-virtual {p0, v0, v1}, Lcom/tantan/library/svga/SVGAnimationView;->stepToFrame(FZ)V

    .line 6
    .line 7
    .line 8
    invoke-interface {p1}, Ll/x20;->call()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final synthetic J0(Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/AgeView;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jbf0;->a:Lcom/p1/mobile/putong/app/PutongAct;

    .line 2
    .line 3
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/AgeView;->Z(Lcom/p1/mobile/android/app/Act;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final J1()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/zif0;->C:Landroid/animation/Animator;

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
    iget-object v0, p0, Ll/zif0;->C:Landroid/animation/Animator;

    .line 10
    .line 11
    invoke-virtual {v0}, Landroid/animation/Animator;->isRunning()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-nez v0, :cond_0

    .line 16
    .line 17
    iget-object p0, p0, Ll/zif0;->C:Landroid/animation/Animator;

    .line 18
    .line 19
    invoke-virtual {p0}, Landroid/animation/Animator;->start()V

    .line 20
    .line 21
    .line 22
    :cond_0
    return-void
.end method

.method public final synthetic K0()V
    .locals 1

    .line 1
    const-string v0, "age"

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Ll/zif0;->S1(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final K1(Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/NameView;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, p1, v0}, Ll/zif0;->L1(Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/NameView;Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public final synthetic L0(Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/AgeView;)V
    .locals 1

    .line 1
    const/16 v0, 0x14

    .line 2
    .line 3
    invoke-virtual {p0, v0, p1}, Ll/zif0;->X1(ILcom/p1/mobile/putong/account/ui/accountai/new2021/view/AgeView;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ll/zif0;->l:Lv/VText;

    .line 7
    .line 8
    const/4 p1, 0x0

    .line 9
    invoke-static {p0, p1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final L1(Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/NameView;Z)V
    .locals 2

    .line 1
    if-eqz p2, :cond_0

    .line 2
    .line 3
    iget-object p2, p0, Ll/zif0;->S:Lcom/p1/mobile/putong/data/SignUpData;

    .line 4
    .line 5
    invoke-static {p2}, Ll/mgf0;->p0(Lcom/p1/mobile/putong/data/SignUpData;)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p2

    .line 9
    iput-object p2, p0, Ll/zif0;->Q:Ljava/lang/String;

    .line 10
    .line 11
    invoke-static {p2}, Ll/dy;->o0(Ljava/lang/String;)Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/NameView;->W(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    new-instance v0, Ll/thf0;

    .line 19
    .line 20
    invoke-direct {v0, p0}, Ll/thf0;-><init>(Ll/zif0;)V

    .line 21
    .line 22
    .line 23
    const/4 v1, 0x0

    .line 24
    invoke-virtual {p0, p2, v1, v0, p1}, Ll/zif0;->b2(Ljava/lang/String;Ll/kcg0;Ll/x20;Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/NameView;)V

    .line 25
    .line 26
    .line 27
    return-void

    .line 28
    :cond_0
    iget-object p2, p0, Ll/jbf0;->a:Lcom/p1/mobile/putong/app/PutongAct;

    .line 29
    .line 30
    check-cast p2, Lcom/p1/mobile/putong/account/ui/accountai/SignUpAiAct;

    .line 31
    .line 32
    sget-object v0, Lcom/p1/mobile/putong/account/AccountModule;->c:Lcom/p1/mobile/putong/account/api/a;

    .line 33
    .line 34
    invoke-virtual {v0}, Lcom/p1/mobile/putong/account/api/a;->a1()Lrx/c;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    invoke-virtual {p2, v0}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 39
    .line 40
    .line 41
    move-result-object p2

    .line 42
    new-instance v0, Ll/uhf0;

    .line 43
    .line 44
    invoke-direct {v0, p0, p1}, Ll/uhf0;-><init>(Ll/zif0;Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/NameView;)V

    .line 45
    .line 46
    .line 47
    new-instance p0, Ll/whf0;

    .line 48
    .line 49
    invoke-direct {p0}, Ll/whf0;-><init>()V

    .line 50
    .line 51
    .line 52
    invoke-static {v0, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    invoke-virtual {p2, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 57
    .line 58
    .line 59
    return-void
.end method

.method public final synthetic M0(Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/AgeView;Landroid/view/View;)V
    .locals 8

    .line 1
    iget-object p2, p0, Ll/jbf0;->a:Lcom/p1/mobile/putong/app/PutongAct;

    .line 2
    .line 3
    check-cast p2, Lcom/p1/mobile/putong/account/ui/accountai/SignUpAiAct;

    .line 4
    .line 5
    invoke-virtual {p2}, Lcom/p1/mobile/putong/account/ui/accountai/SignUpAiAct;->pageId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p2

    .line 9
    const-string v0, "skip_from_which"

    .line 10
    .line 11
    const-string v1, "age"

    .line 12
    .line 13
    invoke-static {v0, v1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    filled-new-array {v0}, [Ll/pf60;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    const-string v1, "e_ai_signup_skip_button"

    .line 22
    .line 23
    invoke-static {v1, p2, v0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 24
    .line 25
    .line 26
    invoke-direct {p0}, Ll/zif0;->A0()V

    .line 27
    .line 28
    .line 29
    new-instance v6, Ll/qhf0;

    .line 30
    .line 31
    invoke-direct {v6}, Ll/qhf0;-><init>()V

    .line 32
    .line 33
    .line 34
    new-instance v7, Ll/rhf0;

    .line 35
    .line 36
    invoke-direct {v7, p0, p1}, Ll/rhf0;-><init>(Ll/zif0;Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/AgeView;)V

    .line 37
    .line 38
    .line 39
    const-string v3, "\u586b\u5199\u201c\u5e74\u9f84\u201d\u65b9\u4fbf\u4e3a\u60a8\u5339\u914d\u66f4\u5408\u9002\u7684\u5bf9\u8c61\uff0c\u82e5\u8df3\u8fc7\u5219\u9ed8\u8ba4\u4e3a\u201c20\u5c81\u201d"

    .line 40
    .line 41
    const-string v4, "\u7ee7\u7eed\u586b\u5199"

    .line 42
    .line 43
    const-string v5, "age"

    .line 44
    .line 45
    move-object v2, p0

    .line 46
    invoke-direct/range {v2 .. v7}, Ll/zif0;->d2(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ll/x20;Ll/x20;)V

    .line 47
    .line 48
    .line 49
    return-void
.end method

.method public M1(Lcom/p1/mobile/putong/data/SignUpData;)V
    .locals 9

    .line 1
    invoke-virtual {p0}, Ll/zif0;->P1()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/zif0;->p:Lv/VText;

    .line 5
    .line 6
    const/4 v1, 0x1

    .line 7
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Ll/zif0;->p:Lv/VText;

    .line 11
    .line 12
    iget-object v2, p1, Lcom/p1/mobile/putong/data/SignUpData;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 13
    .line 14
    const-string v3, "female"

    .line 15
    .line 16
    invoke-static {v2, v3}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 17
    .line 18
    .line 19
    move-result v2

    .line 20
    if-eqz v2, :cond_0

    .line 21
    .line 22
    sget v2, Lcom/p1/mobile/putong/account/R$string;->k:I

    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_0
    sget v2, Lcom/p1/mobile/putong/account/R$string;->l:I

    .line 26
    .line 27
    :goto_0
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(I)V

    .line 28
    .line 29
    .line 30
    iget-object v0, p0, Ll/zif0;->q:Lv/VText;

    .line 31
    .line 32
    const/4 v2, 0x0

    .line 33
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 34
    .line 35
    .line 36
    iget-object v0, p0, Ll/zif0;->r:Lv/VText;

    .line 37
    .line 38
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 39
    .line 40
    .line 41
    iget-object v0, p0, Ll/zif0;->r:Lv/VText;

    .line 42
    .line 43
    invoke-virtual {p0}, Ll/jbf0;->a()Lcom/p1/mobile/putong/app/PutongAct;

    .line 44
    .line 45
    .line 46
    move-result-object v1

    .line 47
    sget v4, Lcom/p1/mobile/putong/account/R$string;->m:I

    .line 48
    .line 49
    invoke-virtual {v1, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object v1

    .line 53
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 54
    .line 55
    .line 56
    iget-object v0, p0, Ll/zif0;->s:Lv/VText;

    .line 57
    .line 58
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 59
    .line 60
    .line 61
    iget-object v0, p0, Ll/zif0;->t:Lv/VRelative;

    .line 62
    .line 63
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 64
    .line 65
    .line 66
    iget-object v0, p0, Ll/zif0;->A:Lv/VLinear;

    .line 67
    .line 68
    invoke-virtual {v0}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 69
    .line 70
    .line 71
    iget-object v0, p0, Ll/zif0;->p:Lv/VText;

    .line 72
    .line 73
    iget-object p1, p1, Lcom/p1/mobile/putong/data/SignUpData;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 74
    .line 75
    invoke-static {p1, v3}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 76
    .line 77
    .line 78
    move-result p1

    .line 79
    if-eqz p1, :cond_1

    .line 80
    .line 81
    sget p1, Lcom/p1/mobile/putong/account/R$string;->i:I

    .line 82
    .line 83
    goto :goto_1

    .line 84
    :cond_1
    sget p1, Lcom/p1/mobile/putong/account/R$string;->j:I

    .line 85
    .line 86
    :goto_1
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(I)V

    .line 87
    .line 88
    .line 89
    new-instance v1, Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/AgeView;

    .line 90
    .line 91
    iget-object p1, p0, Ll/jbf0;->a:Lcom/p1/mobile/putong/app/PutongAct;

    .line 92
    .line 93
    invoke-direct {v1, p1}, Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/AgeView;-><init>(Landroid/content/Context;)V

    .line 94
    .line 95
    .line 96
    const/4 p1, 0x0

    .line 97
    invoke-virtual {v1, p1}, Landroid/view/View;->setAlpha(F)V

    .line 98
    .line 99
    .line 100
    new-instance p1, Landroidx/constraintlayout/widget/ConstraintLayout$a;

    .line 101
    .line 102
    const/4 v0, -0x1

    .line 103
    const/4 v2, -0x2

    .line 104
    invoke-direct {p1, v0, v2}, Landroidx/constraintlayout/widget/ConstraintLayout$a;-><init>(II)V

    .line 105
    .line 106
    .line 107
    iget-object v0, p0, Ll/zif0;->A:Lv/VLinear;

    .line 108
    .line 109
    invoke-virtual {v0, v1, p1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 110
    .line 111
    .line 112
    new-instance p1, Ll/vif0;

    .line 113
    .line 114
    invoke-direct {p1, p0}, Ll/vif0;-><init>(Ll/zif0;)V

    .line 115
    .line 116
    .line 117
    new-instance v0, Ll/wif0;

    .line 118
    .line 119
    invoke-direct {v0, p0, v1}, Ll/wif0;-><init>(Ll/zif0;Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/AgeView;)V

    .line 120
    .line 121
    .line 122
    invoke-virtual {v1, p1, v0}, Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/AgeView;->a0(Ll/y20;Ll/y20;)V

    .line 123
    .line 124
    .line 125
    sget-object v2, Landroid/view/View;->ALPHA:Landroid/util/Property;

    .line 126
    .line 127
    const/4 p1, 0x2

    .line 128
    new-array v8, p1, [F

    .line 129
    .line 130
    fill-array-data v8, :array_0

    .line 131
    .line 132
    .line 133
    const-wide/16 v3, 0x0

    .line 134
    .line 135
    const-wide/16 v5, 0x190

    .line 136
    .line 137
    const/4 v7, 0x0

    .line 138
    invoke-static/range {v1 .. v8}, Ll/gt0;->l(Landroid/view/View;Landroid/util/Property;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 139
    .line 140
    .line 141
    move-result-object p1

    .line 142
    new-instance v0, Ll/xif0;

    .line 143
    .line 144
    invoke-direct {v0, p0, v1}, Ll/xif0;-><init>(Ll/zif0;Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/AgeView;)V

    .line 145
    .line 146
    .line 147
    invoke-static {p1, v0}, Ll/gt0;->v(Landroid/animation/Animator;Ljava/lang/Runnable;)Landroid/animation/Animator;

    .line 148
    .line 149
    .line 150
    const-string v0, "e_ai_signup_age"

    .line 151
    .line 152
    const-string v2, "p_ai_signup"

    .line 153
    .line 154
    invoke-static {v0, v2}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 155
    .line 156
    .line 157
    iget-object v0, p0, Ll/zif0;->p:Lv/VText;

    .line 158
    .line 159
    const-wide/16 v2, 0x0

    .line 160
    .line 161
    invoke-static {v0, v2, v3}, Ll/t;->a(Landroid/view/View;J)Landroid/animation/Animator;

    .line 162
    .line 163
    .line 164
    move-result-object v0

    .line 165
    iget-object v2, p0, Ll/zif0;->r:Lv/VText;

    .line 166
    .line 167
    const-wide/16 v3, 0x258

    .line 168
    .line 169
    invoke-static {v2, v3, v4}, Ll/t;->a(Landroid/view/View;J)Landroid/animation/Animator;

    .line 170
    .line 171
    .line 172
    move-result-object v2

    .line 173
    filled-new-array {v0, v2, p1}, [Landroid/animation/Animator;

    .line 174
    .line 175
    .line 176
    move-result-object p1

    .line 177
    invoke-static {p1}, Ll/gt0;->s([Landroid/animation/Animator;)Landroid/animation/Animator;

    .line 178
    .line 179
    .line 180
    move-result-object p1

    .line 181
    iput-object p1, p0, Ll/zif0;->G:Landroid/animation/Animator;

    .line 182
    .line 183
    invoke-virtual {p1}, Landroid/animation/Animator;->start()V

    .line 184
    .line 185
    .line 186
    iget-object p1, p0, Ll/zif0;->D:Ljava/util/ArrayList;

    .line 187
    .line 188
    iget-object v0, p0, Ll/zif0;->G:Landroid/animation/Animator;

    .line 189
    .line 190
    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 191
    .line 192
    .line 193
    iget-object p1, p0, Ll/zif0;->G:Landroid/animation/Animator;

    .line 194
    .line 195
    new-instance v0, Ll/yif0;

    .line 196
    .line 197
    invoke-direct {v0, p0}, Ll/yif0;-><init>(Ll/zif0;)V

    .line 198
    .line 199
    .line 200
    invoke-static {p1, v0}, Ll/gt0;->f(Landroid/animation/Animator;Ljava/lang/Runnable;)Landroid/animation/Animator;

    .line 201
    .line 202
    .line 203
    invoke-virtual {p0}, Ll/zif0;->J1()V

    .line 204
    .line 205
    .line 206
    iget-object p1, p0, Ll/zif0;->l:Lv/VText;

    .line 207
    .line 208
    new-instance v0, Ll/pgf0;

    .line 209
    .line 210
    invoke-direct {v0, p0, v1}, Ll/pgf0;-><init>(Ll/zif0;Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/AgeView;)V

    .line 211
    .line 212
    .line 213
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 214
    .line 215
    .line 216
    return-void

    .line 217
    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public final synthetic N0()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/jbf0;->a:Lcom/p1/mobile/putong/app/PutongAct;

    .line 2
    .line 3
    check-cast v0, Lcom/p1/mobile/putong/account/ui/accountai/SignUpAiAct;

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/account/ui/accountai/SignUpAiAct;->pageId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const-string v1, "e_signup_complete"

    .line 10
    .line 11
    invoke-static {v1, v0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    iget-object p0, p0, Ll/jbf0;->b:Ll/ibf0;

    .line 15
    .line 16
    check-cast p0, Ll/gef0;

    .line 17
    .line 18
    invoke-virtual {p0}, Ll/gef0;->B1()V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public final synthetic O0()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/jbf0;->b:Ll/ibf0;

    .line 2
    .line 3
    check-cast v0, Ll/gef0;

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    const/4 v2, 0x1

    .line 7
    invoke-virtual {v0, v1, v2}, Ll/gef0;->g1(ZZ)V

    .line 8
    .line 9
    .line 10
    iget-object p0, p0, Ll/jbf0;->a:Lcom/p1/mobile/putong/app/PutongAct;

    .line 11
    .line 12
    check-cast p0, Lcom/p1/mobile/putong/account/ui/accountai/SignUpAiAct;

    .line 13
    .line 14
    invoke-virtual {p0}, Lcom/p1/mobile/putong/account/ui/accountai/SignUpAiAct;->pageId()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    const-string v0, "e_photo_again_upload"

    .line 19
    .line 20
    invoke-static {v0, p0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public O1(Lcom/p1/mobile/putong/data/SignUpData;)V
    .locals 3

    .line 1
    iput-object p1, p0, Ll/zif0;->S:Lcom/p1/mobile/putong/data/SignUpData;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/zif0;->U1()V

    .line 4
    .line 5
    .line 6
    iget-object p1, p0, Ll/zif0;->p:Lv/VText;

    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 10
    .line 11
    .line 12
    iget-object p1, p0, Ll/zif0;->y:Lv/VText;

    .line 13
    .line 14
    const/4 v0, 0x1

    .line 15
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 16
    .line 17
    .line 18
    invoke-direct {p0}, Ll/zif0;->a2()V

    .line 19
    .line 20
    .line 21
    invoke-static {}, Ll/bp;->g()Z

    .line 22
    .line 23
    .line 24
    move-result p1

    .line 25
    if-eqz p1, :cond_0

    .line 26
    .line 27
    iget-object p1, p0, Ll/zif0;->y:Lv/VText;

    .line 28
    .line 29
    const-string v0, "\u4f60\u8fd8\u6ca1\u6709\u4e0a\u4f20\u7167\u7247,\u4e3a\u4e86\u4e0d\u5f71\u54cd\u4ea4\u53cb\u4f53\u9a8c,\u8bb0\u5f97\u6ce8\u518c\u5b8c\u6210\u540e\u5c3d\u5feb\u4e0a\u4f20\u5934\u50cf\u7167\u7247\u54e6\uff5e"

    .line 30
    .line 31
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 32
    .line 33
    .line 34
    :cond_0
    iget-object p1, p0, Ll/zif0;->A:Lv/VLinear;

    .line 35
    .line 36
    invoke-virtual {p1}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 37
    .line 38
    .line 39
    invoke-static {}, Ll/bp;->g()Z

    .line 40
    .line 41
    .line 42
    move-result p1

    .line 43
    iget-object v0, p0, Ll/jbf0;->a:Lcom/p1/mobile/putong/app/PutongAct;

    .line 44
    .line 45
    const/4 v1, -0x2

    .line 46
    const/4 v2, -0x1

    .line 47
    if-eqz p1, :cond_1

    .line 48
    .line 49
    check-cast v0, Lcom/p1/mobile/putong/account/ui/accountai/SignUpAiAct;

    .line 50
    .line 51
    invoke-virtual {v0}, Lcom/p1/mobile/putong/account/ui/accountai/SignUpAiAct;->pageId()Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object p1

    .line 55
    const-string v0, "e_signup_complete"

    .line 56
    .line 57
    invoke-static {v0, p1}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 58
    .line 59
    .line 60
    new-instance p1, Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/MediaView;

    .line 61
    .line 62
    iget-object v0, p0, Ll/jbf0;->a:Lcom/p1/mobile/putong/app/PutongAct;

    .line 63
    .line 64
    invoke-direct {p1, v0}, Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/MediaView;-><init>(Landroid/content/Context;)V

    .line 65
    .line 66
    .line 67
    const-string v0, "\u6ce8\u518c\u5b8c\u6210"

    .line 68
    .line 69
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/MediaView;->setButtonText(Ljava/lang/String;)V

    .line 70
    .line 71
    .line 72
    new-instance v0, Ll/lif0;

    .line 73
    .line 74
    invoke-direct {v0, p0}, Ll/lif0;-><init>(Ll/zif0;)V

    .line 75
    .line 76
    .line 77
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/MediaView;->setClickListener(Ll/x20;)V

    .line 78
    .line 79
    .line 80
    new-instance v0, Landroidx/constraintlayout/widget/ConstraintLayout$a;

    .line 81
    .line 82
    invoke-direct {v0, v2, v1}, Landroidx/constraintlayout/widget/ConstraintLayout$a;-><init>(II)V

    .line 83
    .line 84
    .line 85
    iget-object v1, p0, Ll/zif0;->A:Lv/VLinear;

    .line 86
    .line 87
    invoke-virtual {v1, p1, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 88
    .line 89
    .line 90
    goto :goto_0

    .line 91
    :cond_1
    check-cast v0, Lcom/p1/mobile/putong/account/ui/accountai/SignUpAiAct;

    .line 92
    .line 93
    invoke-virtual {v0}, Lcom/p1/mobile/putong/account/ui/accountai/SignUpAiAct;->pageId()Ljava/lang/String;

    .line 94
    .line 95
    .line 96
    move-result-object p1

    .line 97
    const-string v0, "e_photo_again_refuse"

    .line 98
    .line 99
    invoke-static {v0, p1}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 100
    .line 101
    .line 102
    iget-object p1, p0, Ll/jbf0;->a:Lcom/p1/mobile/putong/app/PutongAct;

    .line 103
    .line 104
    check-cast p1, Lcom/p1/mobile/putong/account/ui/accountai/SignUpAiAct;

    .line 105
    .line 106
    invoke-virtual {p1}, Lcom/p1/mobile/putong/account/ui/accountai/SignUpAiAct;->pageId()Ljava/lang/String;

    .line 107
    .line 108
    .line 109
    move-result-object p1

    .line 110
    const-string v0, "e_photo_again_upload"

    .line 111
    .line 112
    invoke-static {v0, p1}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 113
    .line 114
    .line 115
    new-instance p1, Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/ChannelRegisterView;

    .line 116
    .line 117
    iget-object v0, p0, Ll/jbf0;->a:Lcom/p1/mobile/putong/app/PutongAct;

    .line 118
    .line 119
    invoke-direct {p1, v0}, Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/ChannelRegisterView;-><init>(Landroid/content/Context;)V

    .line 120
    .line 121
    .line 122
    new-instance v0, Ll/mif0;

    .line 123
    .line 124
    invoke-direct {v0, p0}, Ll/mif0;-><init>(Ll/zif0;)V

    .line 125
    .line 126
    .line 127
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/ChannelRegisterView;->setUploadClickListener(Ll/x20;)V

    .line 128
    .line 129
    .line 130
    new-instance v0, Ll/nif0;

    .line 131
    .line 132
    invoke-direct {v0, p0}, Ll/nif0;-><init>(Ll/zif0;)V

    .line 133
    .line 134
    .line 135
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/ChannelRegisterView;->setRegisterClickListener(Ll/x20;)V

    .line 136
    .line 137
    .line 138
    new-instance v0, Landroidx/constraintlayout/widget/ConstraintLayout$a;

    .line 139
    .line 140
    invoke-direct {v0, v2, v1}, Landroidx/constraintlayout/widget/ConstraintLayout$a;-><init>(II)V

    .line 141
    .line 142
    .line 143
    iget-object v1, p0, Ll/zif0;->A:Lv/VLinear;

    .line 144
    .line 145
    invoke-virtual {v1, p1, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 146
    .line 147
    .line 148
    :goto_0
    iget-object p1, p0, Ll/zif0;->y:Lv/VText;

    .line 149
    .line 150
    const-wide/16 v0, 0x0

    .line 151
    .line 152
    invoke-static {p1, v0, v1}, Ll/t;->a(Landroid/view/View;J)Landroid/animation/Animator;

    .line 153
    .line 154
    .line 155
    move-result-object p1

    .line 156
    filled-new-array {p1}, [Landroid/animation/Animator;

    .line 157
    .line 158
    .line 159
    move-result-object p1

    .line 160
    invoke-static {p1}, Ll/gt0;->s([Landroid/animation/Animator;)Landroid/animation/Animator;

    .line 161
    .line 162
    .line 163
    move-result-object p1

    .line 164
    iput-object p1, p0, Ll/zif0;->L:Landroid/animation/Animator;

    .line 165
    .line 166
    invoke-virtual {p1}, Landroid/animation/Animator;->start()V

    .line 167
    .line 168
    .line 169
    iget-object p1, p0, Ll/zif0;->D:Ljava/util/ArrayList;

    .line 170
    .line 171
    iget-object v0, p0, Ll/zif0;->L:Landroid/animation/Animator;

    .line 172
    .line 173
    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 174
    .line 175
    .line 176
    invoke-virtual {p0}, Ll/zif0;->J1()V

    .line 177
    .line 178
    .line 179
    return-void
.end method

.method public final synthetic P0()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/jbf0;->b:Ll/ibf0;

    .line 2
    .line 3
    check-cast v0, Ll/gef0;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/gef0;->B1()V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Ll/jbf0;->a:Lcom/p1/mobile/putong/app/PutongAct;

    .line 9
    .line 10
    check-cast p0, Lcom/p1/mobile/putong/account/ui/accountai/SignUpAiAct;

    .line 11
    .line 12
    invoke-virtual {p0}, Lcom/p1/mobile/putong/account/ui/accountai/SignUpAiAct;->pageId()Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    const-string v0, "e_photo_again_refuse"

    .line 17
    .line 18
    invoke-static {v0, p0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public P1()V
    .locals 1

    .line 1
    invoke-static {}, Ll/cp;->h()Lcom/p1/mobile/putong/data/StepSignupStage;

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/zif0;->k:Lv/VImage;

    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    invoke-static {p0, v0}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final synthetic Q0(Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/GenderView;)V
    .locals 1

    .line 1
    const-string v0, "gender"

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Ll/zif0;->S1(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1}, Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/GenderView;->S()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public Q1()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/jbf0;->b:Ll/ibf0;

    .line 2
    .line 3
    check-cast v0, Ll/gef0;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/ibf0;->O0()V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Ll/zif0;->P1()V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Ll/zif0;->p:Lv/VText;

    .line 12
    .line 13
    const/4 v1, 0x1

    .line 14
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Ll/zif0;->p:Lv/VText;

    .line 18
    .line 19
    const/4 v2, 0x0

    .line 20
    invoke-virtual {v0, v2}, Landroid/view/View;->setAlpha(F)V

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Ll/zif0;->p:Lv/VText;

    .line 24
    .line 25
    sget v3, Lcom/p1/mobile/putong/account/R$string;->p:I

    .line 26
    .line 27
    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setText(I)V

    .line 28
    .line 29
    .line 30
    iget-object v0, p0, Ll/zif0;->q:Lv/VText;

    .line 31
    .line 32
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 33
    .line 34
    .line 35
    iget-object v0, p0, Ll/zif0;->q:Lv/VText;

    .line 36
    .line 37
    invoke-virtual {v0, v2}, Landroid/view/View;->setAlpha(F)V

    .line 38
    .line 39
    .line 40
    iget-object v0, p0, Ll/zif0;->q:Lv/VText;

    .line 41
    .line 42
    sget v3, Lcom/p1/mobile/putong/account/R$string;->q:I

    .line 43
    .line 44
    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setText(I)V

    .line 45
    .line 46
    .line 47
    iget-object v0, p0, Ll/zif0;->r:Lv/VText;

    .line 48
    .line 49
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 50
    .line 51
    .line 52
    iget-object v0, p0, Ll/zif0;->r:Lv/VText;

    .line 53
    .line 54
    invoke-virtual {v0, v2}, Landroid/view/View;->setAlpha(F)V

    .line 55
    .line 56
    .line 57
    iget-object v0, p0, Ll/zif0;->r:Lv/VText;

    .line 58
    .line 59
    invoke-virtual {p0}, Ll/jbf0;->a()Lcom/p1/mobile/putong/app/PutongAct;

    .line 60
    .line 61
    .line 62
    move-result-object v1

    .line 63
    sget v3, Lcom/p1/mobile/putong/account/R$string;->r:I

    .line 64
    .line 65
    invoke-virtual {v1, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 66
    .line 67
    .line 68
    move-result-object v1

    .line 69
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 70
    .line 71
    .line 72
    iget-object v0, p0, Ll/zif0;->s:Lv/VText;

    .line 73
    .line 74
    const/4 v1, 0x0

    .line 75
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 76
    .line 77
    .line 78
    iget-object v0, p0, Ll/zif0;->t:Lv/VRelative;

    .line 79
    .line 80
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 81
    .line 82
    .line 83
    iget-object v0, p0, Ll/zif0;->A:Lv/VLinear;

    .line 84
    .line 85
    invoke-virtual {v0}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 86
    .line 87
    .line 88
    new-instance v0, Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/GenderView;

    .line 89
    .line 90
    iget-object v1, p0, Ll/jbf0;->a:Lcom/p1/mobile/putong/app/PutongAct;

    .line 91
    .line 92
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/GenderView;-><init>(Landroid/content/Context;)V

    .line 93
    .line 94
    .line 95
    invoke-virtual {v0, v2}, Landroid/view/View;->setAlpha(F)V

    .line 96
    .line 97
    .line 98
    new-instance v1, Landroidx/constraintlayout/widget/ConstraintLayout$a;

    .line 99
    .line 100
    const/4 v2, -0x1

    .line 101
    const/4 v3, -0x2

    .line 102
    invoke-direct {v1, v2, v3}, Landroidx/constraintlayout/widget/ConstraintLayout$a;-><init>(II)V

    .line 103
    .line 104
    .line 105
    new-instance v2, Ll/qgf0;

    .line 106
    .line 107
    invoke-direct {v2, p0, v0}, Ll/qgf0;-><init>(Ll/zif0;Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/GenderView;)V

    .line 108
    .line 109
    .line 110
    new-instance v3, Ll/rgf0;

    .line 111
    .line 112
    invoke-direct {v3, p0, v2, v0}, Ll/rgf0;-><init>(Ll/zif0;Ll/x20;Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/GenderView;)V

    .line 113
    .line 114
    .line 115
    invoke-virtual {v0, v3}, Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/GenderView;->setGenderSaveListener(Ll/y20;)V

    .line 116
    .line 117
    .line 118
    iget-object v3, p0, Ll/zif0;->A:Lv/VLinear;

    .line 119
    .line 120
    invoke-virtual {v3, v0, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 121
    .line 122
    .line 123
    new-instance v1, Ll/sgf0;

    .line 124
    .line 125
    invoke-direct {v1, p0, v0}, Ll/sgf0;-><init>(Ll/zif0;Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/GenderView;)V

    .line 126
    .line 127
    .line 128
    invoke-virtual {p0, v1}, Ll/zif0;->g2(Ll/x20;)V

    .line 129
    .line 130
    .line 131
    iget-object v1, p0, Ll/zif0;->l:Lv/VText;

    .line 132
    .line 133
    new-instance v3, Ll/tgf0;

    .line 134
    .line 135
    invoke-direct {v3, p0, v2, v0}, Ll/tgf0;-><init>(Ll/zif0;Ll/x20;Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/GenderView;)V

    .line 136
    .line 137
    .line 138
    invoke-static {v1, v3}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 139
    .line 140
    .line 141
    return-void
.end method

.method public final synthetic R0(Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/GenderView;)V
    .locals 12

    .line 1
    invoke-virtual {p0}, Ll/zif0;->J1()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/zif0;->p:Lv/VText;

    .line 5
    .line 6
    const-wide/16 v1, 0x0

    .line 7
    .line 8
    invoke-static {v0, v1, v2}, Ll/t;->a(Landroid/view/View;J)Landroid/animation/Animator;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    iget-object v1, p0, Ll/zif0;->q:Lv/VText;

    .line 13
    .line 14
    const-wide/16 v2, 0x7d0

    .line 15
    .line 16
    invoke-static {v1, v2, v3}, Ll/t;->a(Landroid/view/View;J)Landroid/animation/Animator;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    iget-object v2, p0, Ll/zif0;->r:Lv/VText;

    .line 21
    .line 22
    const-wide/16 v3, 0x258

    .line 23
    .line 24
    invoke-static {v2, v3, v4}, Ll/t;->a(Landroid/view/View;J)Landroid/animation/Animator;

    .line 25
    .line 26
    .line 27
    move-result-object v2

    .line 28
    sget-object v4, Landroid/view/View;->TRANSLATION_Y:Landroid/util/Property;

    .line 29
    .line 30
    const/4 v11, 0x2

    .line 31
    new-array v10, v11, [F

    .line 32
    .line 33
    fill-array-data v10, :array_0

    .line 34
    .line 35
    .line 36
    const-wide/16 v5, 0x0

    .line 37
    .line 38
    const-wide/16 v7, 0x190

    .line 39
    .line 40
    const/4 v9, 0x0

    .line 41
    move-object v3, p1

    .line 42
    invoke-static/range {v3 .. v10}, Ll/gt0;->l(Landroid/view/View;Landroid/util/Property;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    sget-object v4, Landroid/view/View;->ALPHA:Landroid/util/Property;

    .line 47
    .line 48
    new-array v10, v11, [F

    .line 49
    .line 50
    fill-array-data v10, :array_1

    .line 51
    .line 52
    .line 53
    invoke-static/range {v3 .. v10}, Ll/gt0;->l(Landroid/view/View;Landroid/util/Property;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 54
    .line 55
    .line 56
    move-result-object v4

    .line 57
    filled-new-array {p1, v4}, [Landroid/animation/Animator;

    .line 58
    .line 59
    .line 60
    move-result-object p1

    .line 61
    invoke-static {p1}, Ll/gt0;->z([Landroid/animation/Animator;)Landroid/animation/Animator;

    .line 62
    .line 63
    .line 64
    move-result-object p1

    .line 65
    filled-new-array {v0, v1, v2, p1}, [Landroid/animation/Animator;

    .line 66
    .line 67
    .line 68
    move-result-object p1

    .line 69
    invoke-static {p1}, Ll/gt0;->s([Landroid/animation/Animator;)Landroid/animation/Animator;

    .line 70
    .line 71
    .line 72
    move-result-object p1

    .line 73
    iput-object p1, p0, Ll/zif0;->E:Landroid/animation/Animator;

    .line 74
    .line 75
    new-instance v0, Ll/shf0;

    .line 76
    .line 77
    invoke-direct {v0, p0, v3}, Ll/shf0;-><init>(Ll/zif0;Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/GenderView;)V

    .line 78
    .line 79
    .line 80
    invoke-static {p1, v0}, Ll/gt0;->f(Landroid/animation/Animator;Ljava/lang/Runnable;)Landroid/animation/Animator;

    .line 81
    .line 82
    .line 83
    iget-object p1, p0, Ll/zif0;->E:Landroid/animation/Animator;

    .line 84
    .line 85
    invoke-virtual {p1}, Landroid/animation/Animator;->start()V

    .line 86
    .line 87
    .line 88
    iget-object p1, p0, Ll/zif0;->D:Ljava/util/ArrayList;

    .line 89
    .line 90
    iget-object p0, p0, Ll/zif0;->E:Landroid/animation/Animator;

    .line 91
    .line 92
    invoke-virtual {p1, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 93
    .line 94
    .line 95
    const-string p0, "e_ai_signup_gender"

    .line 96
    .line 97
    const-string p1, "p_ai_signup"

    .line 98
    .line 99
    invoke-static {p0, p1}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 100
    .line 101
    .line 102
    return-void

    .line 103
    :array_0
    .array-data 4
        0x42f00000    # 120.0f
        0x0
    .end array-data

    .line 104
    .line 105
    .line 106
    .line 107
    .line 108
    .line 109
    .line 110
    .line 111
    :array_1
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public R1(Lcom/p1/mobile/putong/data/SignUpData;)V
    .locals 10

    .line 1
    iput-object p1, p0, Ll/zif0;->S:Lcom/p1/mobile/putong/data/SignUpData;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/zif0;->P1()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Ll/zif0;->U1()V

    .line 7
    .line 8
    .line 9
    iget-object v0, p1, Lcom/p1/mobile/putong/data/SignUpData;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 10
    .line 11
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    sget-object v0, Ll/zif0;->T:Ll/wyd0;

    .line 18
    .line 19
    iget-object v1, p1, Lcom/p1/mobile/putong/data/SignUpData;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 20
    .line 21
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    invoke-virtual {v0, v1}, Ll/wyd0;->put(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_0
    sget-object v0, Ll/zif0;->T:Ll/wyd0;

    .line 30
    .line 31
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    check-cast v1, Ljava/lang/CharSequence;

    .line 36
    .line 37
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 38
    .line 39
    .line 40
    move-result v1

    .line 41
    if-nez v1, :cond_1

    .line 42
    .line 43
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    check-cast v0, Ljava/lang/String;

    .line 48
    .line 49
    invoke-static {v0}, Lcom/p1/mobile/putong/data/Gender;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/Gender;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    iput-object v0, p1, Lcom/p1/mobile/putong/data/SignUpData;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 54
    .line 55
    :cond_1
    :goto_0
    invoke-static {}, Ll/mgf0;->r0()Z

    .line 56
    .line 57
    .line 58
    move-result v0

    .line 59
    if-eqz v0, :cond_2

    .line 60
    .line 61
    invoke-direct {p0}, Ll/zif0;->A0()V

    .line 62
    .line 63
    .line 64
    iget-object p0, p0, Ll/jbf0;->b:Ll/ibf0;

    .line 65
    .line 66
    check-cast p0, Ll/gef0;

    .line 67
    .line 68
    invoke-virtual {p0}, Ll/gef0;->B1()V

    .line 69
    .line 70
    .line 71
    return-void

    .line 72
    :cond_2
    iget-object v0, p0, Ll/zif0;->p:Lv/VText;

    .line 73
    .line 74
    const/4 v1, 0x1

    .line 75
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 76
    .line 77
    .line 78
    iget-object v0, p0, Ll/zif0;->p:Lv/VText;

    .line 79
    .line 80
    sget v2, Lcom/p1/mobile/putong/account/R$string;->s:I

    .line 81
    .line 82
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(I)V

    .line 83
    .line 84
    .line 85
    iget-object v0, p0, Ll/zif0;->q:Lv/VText;

    .line 86
    .line 87
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 88
    .line 89
    .line 90
    iget-object v0, p0, Ll/zif0;->q:Lv/VText;

    .line 91
    .line 92
    sget v2, Lcom/p1/mobile/putong/account/R$string;->t:I

    .line 93
    .line 94
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(I)V

    .line 95
    .line 96
    .line 97
    iget-object v0, p0, Ll/zif0;->r:Lv/VText;

    .line 98
    .line 99
    const/4 v2, 0x0

    .line 100
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 101
    .line 102
    .line 103
    iget-object v0, p0, Ll/zif0;->s:Lv/VText;

    .line 104
    .line 105
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 106
    .line 107
    .line 108
    iget-object v0, p1, Lcom/p1/mobile/putong/data/SignUpData;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 109
    .line 110
    const-string v2, "male"

    .line 111
    .line 112
    invoke-static {v0, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 113
    .line 114
    .line 115
    move-result v0

    .line 116
    if-eqz v0, :cond_3

    .line 117
    .line 118
    iget-object p1, p0, Ll/zif0;->v:Lv/VImage;

    .line 119
    .line 120
    sget v0, Ll/bbc0;->z1:I

    .line 121
    .line 122
    invoke-virtual {p1, v0}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 123
    .line 124
    .line 125
    iget-object p1, p0, Ll/zif0;->w:Lv/VImage;

    .line 126
    .line 127
    sget v0, Ll/bbc0;->A1:I

    .line 128
    .line 129
    invoke-virtual {p1, v0}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 130
    .line 131
    .line 132
    iget-object p1, p0, Ll/zif0;->x:Lv/VImage;

    .line 133
    .line 134
    sget v0, Ll/bbc0;->B1:I

    .line 135
    .line 136
    invoke-virtual {p1, v0}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 137
    .line 138
    .line 139
    goto :goto_1

    .line 140
    :cond_3
    iget-object p1, p1, Lcom/p1/mobile/putong/data/SignUpData;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 141
    .line 142
    const-string v0, "female"

    .line 143
    .line 144
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 145
    .line 146
    .line 147
    move-result p1

    .line 148
    if-eqz p1, :cond_4

    .line 149
    .line 150
    iget-object p1, p0, Ll/zif0;->v:Lv/VImage;

    .line 151
    .line 152
    sget v0, Ll/bbc0;->w1:I

    .line 153
    .line 154
    invoke-virtual {p1, v0}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 155
    .line 156
    .line 157
    iget-object p1, p0, Ll/zif0;->w:Lv/VImage;

    .line 158
    .line 159
    sget v0, Ll/bbc0;->x1:I

    .line 160
    .line 161
    invoke-virtual {p1, v0}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 162
    .line 163
    .line 164
    iget-object p1, p0, Ll/zif0;->x:Lv/VImage;

    .line 165
    .line 166
    sget v0, Ll/bbc0;->y1:I

    .line 167
    .line 168
    invoke-virtual {p1, v0}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 169
    .line 170
    .line 171
    :cond_4
    :goto_1
    iget-object p1, p0, Ll/zif0;->t:Lv/VRelative;

    .line 172
    .line 173
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 174
    .line 175
    .line 176
    iget-object p1, p0, Ll/zif0;->A:Lv/VLinear;

    .line 177
    .line 178
    invoke-virtual {p1}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 179
    .line 180
    .line 181
    new-instance v0, Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/MediaView;

    .line 182
    .line 183
    iget-object p1, p0, Ll/jbf0;->a:Lcom/p1/mobile/putong/app/PutongAct;

    .line 184
    .line 185
    invoke-direct {v0, p1}, Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/MediaView;-><init>(Landroid/content/Context;)V

    .line 186
    .line 187
    .line 188
    const/4 p1, 0x0

    .line 189
    invoke-virtual {v0, p1}, Landroid/view/View;->setAlpha(F)V

    .line 190
    .line 191
    .line 192
    new-instance p1, Ll/vhf0;

    .line 193
    .line 194
    invoke-direct {p1, p0}, Ll/vhf0;-><init>(Ll/zif0;)V

    .line 195
    .line 196
    .line 197
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/MediaView;->setClickListener(Ll/x20;)V

    .line 198
    .line 199
    .line 200
    new-instance p1, Landroidx/constraintlayout/widget/ConstraintLayout$a;

    .line 201
    .line 202
    const/4 v1, -0x1

    .line 203
    const/4 v2, -0x2

    .line 204
    invoke-direct {p1, v1, v2}, Landroidx/constraintlayout/widget/ConstraintLayout$a;-><init>(II)V

    .line 205
    .line 206
    .line 207
    iget-object v1, p0, Ll/zif0;->A:Lv/VLinear;

    .line 208
    .line 209
    invoke-virtual {v1, v0, p1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 210
    .line 211
    .line 212
    iget-object p1, p0, Ll/zif0;->p:Lv/VText;

    .line 213
    .line 214
    const-wide/16 v1, 0x0

    .line 215
    .line 216
    invoke-static {p1, v1, v2}, Ll/t;->a(Landroid/view/View;J)Landroid/animation/Animator;

    .line 217
    .line 218
    .line 219
    move-result-object p1

    .line 220
    iget-object v1, p0, Ll/zif0;->q:Lv/VText;

    .line 221
    .line 222
    const-wide/16 v2, 0x4b0

    .line 223
    .line 224
    invoke-static {v1, v2, v3}, Ll/t;->a(Landroid/view/View;J)Landroid/animation/Animator;

    .line 225
    .line 226
    .line 227
    move-result-object v8

    .line 228
    iget-object v1, p0, Ll/zif0;->t:Lv/VRelative;

    .line 229
    .line 230
    const-wide/16 v2, 0x258

    .line 231
    .line 232
    invoke-static {v1, v2, v3}, Ll/t;->a(Landroid/view/View;J)Landroid/animation/Animator;

    .line 233
    .line 234
    .line 235
    move-result-object v9

    .line 236
    sget-object v1, Landroid/view/View;->ALPHA:Landroid/util/Property;

    .line 237
    .line 238
    const/4 v2, 0x2

    .line 239
    new-array v7, v2, [F

    .line 240
    .line 241
    fill-array-data v7, :array_0

    .line 242
    .line 243
    .line 244
    const-wide/16 v2, 0x0

    .line 245
    .line 246
    const-wide/16 v4, 0x190

    .line 247
    .line 248
    const/4 v6, 0x0

    .line 249
    invoke-static/range {v0 .. v7}, Ll/gt0;->l(Landroid/view/View;Landroid/util/Property;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 250
    .line 251
    .line 252
    move-result-object v0

    .line 253
    filled-new-array {v0}, [Landroid/animation/Animator;

    .line 254
    .line 255
    .line 256
    move-result-object v0

    .line 257
    invoke-static {v0}, Ll/gt0;->z([Landroid/animation/Animator;)Landroid/animation/Animator;

    .line 258
    .line 259
    .line 260
    move-result-object v0

    .line 261
    filled-new-array {p1, v8, v9, v0}, [Landroid/animation/Animator;

    .line 262
    .line 263
    .line 264
    move-result-object p1

    .line 265
    invoke-static {p1}, Ll/gt0;->s([Landroid/animation/Animator;)Landroid/animation/Animator;

    .line 266
    .line 267
    .line 268
    move-result-object p1

    .line 269
    iput-object p1, p0, Ll/zif0;->K:Landroid/animation/Animator;

    .line 270
    .line 271
    invoke-virtual {p1}, Landroid/animation/Animator;->start()V

    .line 272
    .line 273
    .line 274
    iget-object p1, p0, Ll/zif0;->K:Landroid/animation/Animator;

    .line 275
    .line 276
    new-instance v0, Ll/gif0;

    .line 277
    .line 278
    invoke-direct {v0, p0}, Ll/gif0;-><init>(Ll/zif0;)V

    .line 279
    .line 280
    .line 281
    invoke-static {p1, v0}, Ll/gt0;->f(Landroid/animation/Animator;Ljava/lang/Runnable;)Landroid/animation/Animator;

    .line 282
    .line 283
    .line 284
    iget-object p1, p0, Ll/zif0;->D:Ljava/util/ArrayList;

    .line 285
    .line 286
    iget-object v0, p0, Ll/zif0;->K:Landroid/animation/Animator;

    .line 287
    .line 288
    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 289
    .line 290
    .line 291
    invoke-virtual {p0}, Ll/zif0;->J1()V

    .line 292
    .line 293
    .line 294
    const-string p1, "e_ai_signup_photo"

    .line 295
    .line 296
    const-string v0, "p_ai_signup"

    .line 297
    .line 298
    invoke-static {p1, v0}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 299
    .line 300
    .line 301
    iget-object p1, p0, Ll/zif0;->l:Lv/VText;

    .line 302
    .line 303
    new-instance v0, Ll/rif0;

    .line 304
    .line 305
    invoke-direct {v0, p0}, Ll/rif0;-><init>(Ll/zif0;)V

    .line 306
    .line 307
    .line 308
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 309
    .line 310
    .line 311
    return-void

    .line 312
    nop

    .line 313
    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public final synthetic S0(Ll/x20;Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/GenderView;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ll/zif0;->Z1()V

    .line 2
    .line 3
    .line 4
    const-string v0, ""

    .line 5
    .line 6
    invoke-virtual {p0, v0}, Ll/zif0;->S1(Ljava/lang/String;)V

    .line 7
    .line 8
    .line 9
    const-string v0, "male"

    .line 10
    .line 11
    invoke-static {v0}, Lcom/p1/mobile/putong/data/Gender;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/Gender;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {p0, v0, p1, p2}, Ll/zif0;->Y1(Lcom/p1/mobile/putong/data/Gender;Ll/x20;Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/GenderView;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public S1(Ljava/lang/String;)V
    .locals 2

    .line 1
    invoke-static {}, Ll/bp;->h()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Ll/zif0;->N:Ll/jxd0;

    .line 8
    .line 9
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    check-cast v0, Ljava/lang/Boolean;

    .line 14
    .line 15
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-nez v0, :cond_0

    .line 20
    .line 21
    iget-object v0, p0, Ll/jbf0;->a:Lcom/p1/mobile/putong/app/PutongAct;

    .line 22
    .line 23
    check-cast v0, Lcom/p1/mobile/putong/account/ui/accountai/SignUpAiAct;

    .line 24
    .line 25
    invoke-virtual {v0}, Lcom/p1/mobile/putong/account/ui/accountai/SignUpAiAct;->pageId()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    const-string v1, "skip_from_which"

    .line 30
    .line 31
    invoke-static {v1, p1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    filled-new-array {p1}, [Ll/pf60;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    const-string v1, "e_ai_signup_skip_button"

    .line 40
    .line 41
    invoke-static {v1, v0, p1}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 42
    .line 43
    .line 44
    iget-object p0, p0, Ll/zif0;->l:Lv/VText;

    .line 45
    .line 46
    const/4 p1, 0x1

    .line 47
    invoke-static {p0, p1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 48
    .line 49
    .line 50
    return-void

    .line 51
    :cond_0
    iget-object p0, p0, Ll/zif0;->l:Lv/VText;

    .line 52
    .line 53
    const/4 p1, 0x0

    .line 54
    invoke-static {p0, p1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 55
    .line 56
    .line 57
    return-void
.end method

.method public final synthetic T0(Ll/x20;Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/GenderView;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/zif0;->l:Lv/VText;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    const-string v0, "female"

    .line 8
    .line 9
    invoke-static {v0}, Lcom/p1/mobile/putong/data/Gender;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/Gender;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {p0, v0, p1, p2}, Ll/zif0;->Y1(Lcom/p1/mobile/putong/data/Gender;Ll/x20;Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/GenderView;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public T1(Lcom/p1/mobile/putong/data/SignUpData;)V
    .locals 10

    .line 1
    iput-object p1, p0, Ll/zif0;->S:Lcom/p1/mobile/putong/data/SignUpData;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/zif0;->P1()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Ll/zif0;->U1()V

    .line 7
    .line 8
    .line 9
    invoke-static {}, Ll/mgf0;->r0()Z

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    const/4 v0, 0x1

    .line 14
    if-eqz p1, :cond_0

    .line 15
    .line 16
    new-instance p1, Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/NameView;

    .line 17
    .line 18
    iget-object v1, p0, Ll/jbf0;->a:Lcom/p1/mobile/putong/app/PutongAct;

    .line 19
    .line 20
    invoke-direct {p1, v1}, Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/NameView;-><init>(Landroid/content/Context;)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p0, p1, v0}, Ll/zif0;->L1(Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/NameView;Z)V

    .line 24
    .line 25
    .line 26
    return-void

    .line 27
    :cond_0
    iget-object p1, p0, Ll/zif0;->p:Lv/VText;

    .line 28
    .line 29
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 30
    .line 31
    .line 32
    iget-object p1, p0, Ll/zif0;->p:Lv/VText;

    .line 33
    .line 34
    sget v0, Lcom/p1/mobile/putong/account/R$string;->u:I

    .line 35
    .line 36
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(I)V

    .line 37
    .line 38
    .line 39
    iget-object p1, p0, Ll/zif0;->q:Lv/VText;

    .line 40
    .line 41
    const/4 v0, 0x0

    .line 42
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 43
    .line 44
    .line 45
    iget-object p1, p0, Ll/zif0;->r:Lv/VText;

    .line 46
    .line 47
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 48
    .line 49
    .line 50
    iget-object p1, p0, Ll/zif0;->s:Lv/VText;

    .line 51
    .line 52
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 53
    .line 54
    .line 55
    iget-object p1, p0, Ll/zif0;->t:Lv/VRelative;

    .line 56
    .line 57
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 58
    .line 59
    .line 60
    new-instance v1, Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/NameView;

    .line 61
    .line 62
    iget-object p1, p0, Ll/jbf0;->a:Lcom/p1/mobile/putong/app/PutongAct;

    .line 63
    .line 64
    invoke-direct {v1, p1}, Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/NameView;-><init>(Landroid/content/Context;)V

    .line 65
    .line 66
    .line 67
    const/4 p1, 0x0

    .line 68
    invoke-virtual {v1, p1}, Landroid/view/View;->setAlpha(F)V

    .line 69
    .line 70
    .line 71
    new-instance p1, Landroidx/constraintlayout/widget/ConstraintLayout$a;

    .line 72
    .line 73
    const/4 v0, -0x1

    .line 74
    const/4 v2, -0x2

    .line 75
    invoke-direct {p1, v0, v2}, Landroidx/constraintlayout/widget/ConstraintLayout$a;-><init>(II)V

    .line 76
    .line 77
    .line 78
    iget-object v0, p0, Ll/jbf0;->b:Ll/ibf0;

    .line 79
    .line 80
    check-cast v0, Ll/gef0;

    .line 81
    .line 82
    iget-object v2, p0, Ll/zif0;->B:Landroid/view/View;

    .line 83
    .line 84
    invoke-static {v2}, Lcom/p1/mobile/android/app/Act;->keyboardListenerObservable(Landroid/view/View;)Lrx/c;

    .line 85
    .line 86
    .line 87
    move-result-object v2

    .line 88
    invoke-virtual {v0, v2}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 89
    .line 90
    .line 91
    move-result-object v0

    .line 92
    invoke-virtual {v0}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 93
    .line 94
    .line 95
    move-result-object v0

    .line 96
    new-instance v2, Ll/ehf0;

    .line 97
    .line 98
    invoke-direct {v2, p0, v1}, Ll/ehf0;-><init>(Ll/zif0;Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/NameView;)V

    .line 99
    .line 100
    .line 101
    invoke-static {v2}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 102
    .line 103
    .line 104
    move-result-object v2

    .line 105
    invoke-virtual {v0, v2}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 106
    .line 107
    .line 108
    move-result-object v0

    .line 109
    new-instance v9, Ll/fhf0;

    .line 110
    .line 111
    invoke-direct {v9, p0, v1}, Ll/fhf0;-><init>(Ll/zif0;Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/NameView;)V

    .line 112
    .line 113
    .line 114
    new-instance v2, Ll/ghf0;

    .line 115
    .line 116
    invoke-direct {v2, p0}, Ll/ghf0;-><init>(Ll/zif0;)V

    .line 117
    .line 118
    .line 119
    new-instance v3, Ll/hhf0;

    .line 120
    .line 121
    invoke-direct {v3, p0, v0, v9, v1}, Ll/hhf0;-><init>(Ll/zif0;Ll/kcg0;Ll/x20;Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/NameView;)V

    .line 122
    .line 123
    .line 124
    invoke-virtual {v1, v2, v3}, Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/NameView;->b0(Ll/y20;Ll/y20;)V

    .line 125
    .line 126
    .line 127
    iget-object v2, p0, Ll/zif0;->A:Lv/VLinear;

    .line 128
    .line 129
    invoke-virtual {v2}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 130
    .line 131
    .line 132
    iget-object v2, p0, Ll/zif0;->A:Lv/VLinear;

    .line 133
    .line 134
    invoke-virtual {v2, v1, p1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 135
    .line 136
    .line 137
    sget-object v2, Landroid/view/View;->ALPHA:Landroid/util/Property;

    .line 138
    .line 139
    const/4 p1, 0x2

    .line 140
    new-array v8, p1, [F

    .line 141
    .line 142
    fill-array-data v8, :array_0

    .line 143
    .line 144
    .line 145
    const-wide/16 v3, 0x0

    .line 146
    .line 147
    const-wide/16 v5, 0x190

    .line 148
    .line 149
    const/4 v7, 0x0

    .line 150
    invoke-static/range {v1 .. v8}, Ll/gt0;->l(Landroid/view/View;Landroid/util/Property;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 151
    .line 152
    .line 153
    move-result-object p1

    .line 154
    new-instance v2, Ll/ihf0;

    .line 155
    .line 156
    invoke-direct {v2, p0, v1}, Ll/ihf0;-><init>(Ll/zif0;Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/NameView;)V

    .line 157
    .line 158
    .line 159
    invoke-static {p1, v2}, Ll/gt0;->v(Landroid/animation/Animator;Ljava/lang/Runnable;)Landroid/animation/Animator;

    .line 160
    .line 161
    .line 162
    iget-object v2, p0, Ll/zif0;->p:Lv/VText;

    .line 163
    .line 164
    invoke-static {v2, v3, v4}, Ll/t;->a(Landroid/view/View;J)Landroid/animation/Animator;

    .line 165
    .line 166
    .line 167
    move-result-object v2

    .line 168
    filled-new-array {v2, p1}, [Landroid/animation/Animator;

    .line 169
    .line 170
    .line 171
    move-result-object p1

    .line 172
    invoke-static {p1}, Ll/gt0;->s([Landroid/animation/Animator;)Landroid/animation/Animator;

    .line 173
    .line 174
    .line 175
    move-result-object p1

    .line 176
    iput-object p1, p0, Ll/zif0;->I:Landroid/animation/Animator;

    .line 177
    .line 178
    invoke-virtual {p1}, Landroid/animation/Animator;->start()V

    .line 179
    .line 180
    .line 181
    iget-object p1, p0, Ll/zif0;->I:Landroid/animation/Animator;

    .line 182
    .line 183
    new-instance v2, Ll/jhf0;

    .line 184
    .line 185
    invoke-direct {v2, p0, v1}, Ll/jhf0;-><init>(Ll/zif0;Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/NameView;)V

    .line 186
    .line 187
    .line 188
    invoke-static {p1, v2}, Ll/gt0;->f(Landroid/animation/Animator;Ljava/lang/Runnable;)Landroid/animation/Animator;

    .line 189
    .line 190
    .line 191
    iget-object p1, p0, Ll/zif0;->D:Ljava/util/ArrayList;

    .line 192
    .line 193
    iget-object v2, p0, Ll/zif0;->I:Landroid/animation/Animator;

    .line 194
    .line 195
    invoke-virtual {p1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 196
    .line 197
    .line 198
    invoke-virtual {p0}, Ll/zif0;->J1()V

    .line 199
    .line 200
    .line 201
    const-string p1, "e_ai_signup_name"

    .line 202
    .line 203
    const-string v2, "p_ai_signup"

    .line 204
    .line 205
    invoke-static {p1, v2}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 206
    .line 207
    .line 208
    iget-object p1, p0, Ll/zif0;->l:Lv/VText;

    .line 209
    .line 210
    new-instance v2, Ll/lhf0;

    .line 211
    .line 212
    invoke-direct {v2, p0, v1, v0, v9}, Ll/lhf0;-><init>(Ll/zif0;Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/NameView;Ll/kcg0;Ll/x20;)V

    .line 213
    .line 214
    .line 215
    invoke-static {p1, v2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 216
    .line 217
    .line 218
    return-void

    .line 219
    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public final synthetic U0(Ll/x20;Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/GenderView;Landroid/view/View;)V
    .locals 8

    .line 1
    iget-object p3, p0, Ll/jbf0;->a:Lcom/p1/mobile/putong/app/PutongAct;

    .line 2
    .line 3
    check-cast p3, Lcom/p1/mobile/putong/account/ui/accountai/SignUpAiAct;

    .line 4
    .line 5
    invoke-virtual {p3}, Lcom/p1/mobile/putong/account/ui/accountai/SignUpAiAct;->pageId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p3

    .line 9
    const-string v0, "skip_from_which"

    .line 10
    .line 11
    const-string v1, "gender"

    .line 12
    .line 13
    invoke-static {v0, v1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    filled-new-array {v0}, [Ll/pf60;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    const-string v1, "e_ai_signup_skip_button"

    .line 22
    .line 23
    invoke-static {v1, p3, v0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 24
    .line 25
    .line 26
    invoke-direct {p0}, Ll/zif0;->A0()V

    .line 27
    .line 28
    .line 29
    new-instance v6, Ll/ohf0;

    .line 30
    .line 31
    invoke-direct {v6, p0, p1, p2}, Ll/ohf0;-><init>(Ll/zif0;Ll/x20;Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/GenderView;)V

    .line 32
    .line 33
    .line 34
    new-instance v7, Ll/phf0;

    .line 35
    .line 36
    invoke-direct {v7, p0, p1, p2}, Ll/phf0;-><init>(Ll/zif0;Ll/x20;Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/GenderView;)V

    .line 37
    .line 38
    .line 39
    const-string v3, "\u7cfb\u7edf\u9ed8\u8ba4\u60a8\u4e3a\u201c\u5973\u6027\u201d\u65b9\u4fbf\u4e3a\u60a8\u7cbe\u51c6\u5339\u914d\u7528\u6237\uff0c\u6027\u522b\u66f4\u6539\u673a\u4f1a\u53ea\u6709\u4e00\u6b21"

    .line 40
    .line 41
    const-string v4, "\u6211\u662f\u7537\u751f"

    .line 42
    .line 43
    const-string v5, "gender"

    .line 44
    .line 45
    move-object v2, p0

    .line 46
    invoke-direct/range {v2 .. v7}, Ll/zif0;->d2(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ll/x20;Ll/x20;)V

    .line 47
    .line 48
    .line 49
    return-void
.end method

.method public final U1()V
    .locals 2

    .line 1
    iget v0, p0, Ll/zif0;->P:I

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Ll/zif0;->n:Lv/VLinear;

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    invoke-virtual {v0, v1, v1}, Landroid/view/View;->scrollTo(II)V

    .line 9
    .line 10
    .line 11
    iput v1, p0, Ll/zif0;->P:I

    .line 12
    .line 13
    :cond_0
    return-void
.end method

.method public final synthetic V0()V
    .locals 1

    .line 1
    const/4 v0, 0x2

    .line 2
    invoke-virtual {p0, v0}, Ll/zif0;->c2(I)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public final V1()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/zif0;->R:Ljava/lang/Runnable;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ll/khf0;

    .line 6
    .line 7
    invoke-direct {v0, p0}, Ll/khf0;-><init>(Ll/zif0;)V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Ll/zif0;->R:Ljava/lang/Runnable;

    .line 11
    .line 12
    :cond_0
    iget-object v0, p0, Ll/zif0;->R:Ljava/lang/Runnable;

    .line 13
    .line 14
    invoke-static {v0}, Ll/l51;->J(Ljava/lang/Runnable;)V

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Ll/jbf0;->a:Lcom/p1/mobile/putong/app/PutongAct;

    .line 18
    .line 19
    iget-object p0, p0, Ll/zif0;->R:Ljava/lang/Runnable;

    .line 20
    .line 21
    const-wide/16 v1, 0x12c

    .line 22
    .line 23
    invoke-static {v0, p0, v1, v2}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public final synthetic W0()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jbf0;->b:Ll/ibf0;

    .line 2
    .line 3
    check-cast p0, Ll/gef0;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/gef0;->v1()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic X0(Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/GenderView;)V
    .locals 13

    .line 1
    iget-object v0, p0, Ll/zif0;->s:Lv/VText;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/View;->getWidth()I

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    int-to-float v1, v1

    .line 8
    invoke-virtual {v0, v1}, Landroid/view/View;->setPivotX(F)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Ll/zif0;->s:Lv/VText;

    .line 12
    .line 13
    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    int-to-float v1, v1

    .line 18
    invoke-virtual {v0, v1}, Landroid/view/View;->setPivotY(F)V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Ll/zif0;->p:Lv/VText;

    .line 22
    .line 23
    iget-object v1, p0, Ll/zif0;->q:Lv/VText;

    .line 24
    .line 25
    iget-object v2, p0, Ll/zif0;->r:Lv/VText;

    .line 26
    .line 27
    iget-object v3, p0, Ll/zif0;->s:Lv/VText;

    .line 28
    .line 29
    iget-object v4, p0, Ll/zif0;->t:Lv/VRelative;

    .line 30
    .line 31
    const/4 v5, 0x5

    .line 32
    new-array v5, v5, [Landroid/view/View;

    .line 33
    .line 34
    const/4 v6, 0x0

    .line 35
    aput-object v0, v5, v6

    .line 36
    .line 37
    const/4 v0, 0x1

    .line 38
    aput-object v1, v5, v0

    .line 39
    .line 40
    const/4 v0, 0x2

    .line 41
    aput-object v2, v5, v0

    .line 42
    .line 43
    const/4 v1, 0x3

    .line 44
    aput-object v3, v5, v1

    .line 45
    .line 46
    const/4 v1, 0x4

    .line 47
    aput-object v4, v5, v1

    .line 48
    .line 49
    const-wide/16 v1, 0x190

    .line 50
    .line 51
    invoke-static {v1, v2, v5}, Ll/t;->e(J[Landroid/view/View;)Landroid/animation/Animator;

    .line 52
    .line 53
    .line 54
    move-result-object v3

    .line 55
    new-instance v4, Ll/yhf0;

    .line 56
    .line 57
    invoke-direct {v4, p0}, Ll/yhf0;-><init>(Ll/zif0;)V

    .line 58
    .line 59
    .line 60
    invoke-static {v3, v4}, Ll/gt0;->v(Landroid/animation/Animator;Ljava/lang/Runnable;)Landroid/animation/Animator;

    .line 61
    .line 62
    .line 63
    sget-object v6, Landroid/view/View;->ALPHA:Landroid/util/Property;

    .line 64
    .line 65
    new-array v12, v0, [F

    .line 66
    .line 67
    fill-array-data v12, :array_0

    .line 68
    .line 69
    .line 70
    const-wide/16 v7, 0xc8

    .line 71
    .line 72
    const-wide/16 v9, 0x190

    .line 73
    .line 74
    const/4 v11, 0x0

    .line 75
    move-object v5, p1

    .line 76
    invoke-static/range {v5 .. v12}, Ll/gt0;->l(Landroid/view/View;Landroid/util/Property;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 77
    .line 78
    .line 79
    move-result-object p1

    .line 80
    iget-object v0, p0, Ll/zif0;->s:Lv/VText;

    .line 81
    .line 82
    invoke-static {v0, v1, v2}, Ll/t;->b(Landroid/view/View;J)Landroid/animation/Animator;

    .line 83
    .line 84
    .line 85
    move-result-object v0

    .line 86
    filled-new-array {p1, v0}, [Landroid/animation/Animator;

    .line 87
    .line 88
    .line 89
    move-result-object p1

    .line 90
    invoke-static {p1}, Ll/gt0;->z([Landroid/animation/Animator;)Landroid/animation/Animator;

    .line 91
    .line 92
    .line 93
    move-result-object p1

    .line 94
    filled-new-array {p1, v3}, [Landroid/animation/Animator;

    .line 95
    .line 96
    .line 97
    move-result-object p1

    .line 98
    invoke-static {p1}, Ll/gt0;->s([Landroid/animation/Animator;)Landroid/animation/Animator;

    .line 99
    .line 100
    .line 101
    move-result-object p1

    .line 102
    iput-object p1, p0, Ll/zif0;->F:Landroid/animation/Animator;

    .line 103
    .line 104
    new-instance v0, Ll/zhf0;

    .line 105
    .line 106
    invoke-direct {v0, p0}, Ll/zhf0;-><init>(Ll/zif0;)V

    .line 107
    .line 108
    .line 109
    invoke-static {p1, v0}, Ll/gt0;->f(Landroid/animation/Animator;Ljava/lang/Runnable;)Landroid/animation/Animator;

    .line 110
    .line 111
    .line 112
    iget-object p1, p0, Ll/zif0;->F:Landroid/animation/Animator;

    .line 113
    .line 114
    invoke-virtual {p1}, Landroid/animation/Animator;->start()V

    .line 115
    .line 116
    .line 117
    iget-object p1, p0, Ll/zif0;->D:Ljava/util/ArrayList;

    .line 118
    .line 119
    iget-object p0, p0, Ll/zif0;->F:Landroid/animation/Animator;

    .line 120
    .line 121
    invoke-virtual {p1, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 122
    .line 123
    .line 124
    return-void

    .line 125
    :array_0
    .array-data 4
        0x3f800000    # 1.0f
        0x0
    .end array-data
.end method

.method public final X1(ILcom/p1/mobile/putong/account/ui/accountai/new2021/view/AgeView;)V
    .locals 4

    .line 1
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {}, Ll/pzi0;->o()J

    .line 6
    .line 7
    .line 8
    move-result-wide v1

    .line 9
    invoke-virtual {v0, v1, v2}, Ljava/util/Calendar;->setTimeInMillis(J)V

    .line 10
    .line 11
    .line 12
    const/4 v1, 0x1

    .line 13
    invoke-virtual {v0, v1}, Ljava/util/Calendar;->get(I)I

    .line 14
    .line 15
    .line 16
    move-result v2

    .line 17
    sub-int/2addr v2, p1

    .line 18
    invoke-virtual {v0, v1, v2}, Ljava/util/Calendar;->set(II)V

    .line 19
    .line 20
    .line 21
    const/16 v1, 0xb

    .line 22
    .line 23
    const/4 v2, 0x0

    .line 24
    invoke-virtual {v0, v1, v2}, Ljava/util/Calendar;->set(II)V

    .line 25
    .line 26
    .line 27
    const/16 v1, 0xc

    .line 28
    .line 29
    invoke-virtual {v0, v1, v2}, Ljava/util/Calendar;->set(II)V

    .line 30
    .line 31
    .line 32
    const/16 v1, 0xd

    .line 33
    .line 34
    invoke-virtual {v0, v1, v2}, Ljava/util/Calendar;->set(II)V

    .line 35
    .line 36
    .line 37
    const/16 v1, 0xe

    .line 38
    .line 39
    invoke-virtual {v0, v1, v2}, Ljava/util/Calendar;->set(II)V

    .line 40
    .line 41
    .line 42
    sget-object v1, Lcom/p1/mobile/putong/account/AccountModule;->c:Lcom/p1/mobile/putong/account/api/a;

    .line 43
    .line 44
    invoke-virtual {v0}, Ljava/util/Calendar;->getTimeInMillis()J

    .line 45
    .line 46
    .line 47
    move-result-wide v2

    .line 48
    long-to-double v2, v2

    .line 49
    invoke-virtual {v1, v2, v3}, Lcom/p1/mobile/putong/account/api/a;->e2(D)V

    .line 50
    .line 51
    .line 52
    sget-object v0, Lcom/p1/mobile/putong/account/AccountModule;->c:Lcom/p1/mobile/putong/account/api/a;

    .line 53
    .line 54
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/account/api/a;->c2(I)V

    .line 55
    .line 56
    .line 57
    iget-object v0, p0, Ll/jbf0;->b:Ll/ibf0;

    .line 58
    .line 59
    check-cast v0, Ll/gef0;

    .line 60
    .line 61
    sget-object v1, Lcom/p1/mobile/putong/api/api/AccountTempApi$SignUpType;->birthInfoSaved:Lcom/p1/mobile/putong/api/api/AccountTempApi$SignUpType;

    .line 62
    .line 63
    new-instance v2, Ll/ahf0;

    .line 64
    .line 65
    invoke-direct {v2, p0, p1, p2}, Ll/ahf0;-><init>(Ll/zif0;ILcom/p1/mobile/putong/account/ui/accountai/new2021/view/AgeView;)V

    .line 66
    .line 67
    .line 68
    new-instance p0, Ll/bhf0;

    .line 69
    .line 70
    invoke-direct {p0, p2}, Ll/bhf0;-><init>(Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/AgeView;)V

    .line 71
    .line 72
    .line 73
    invoke-virtual {v0, v1, v2, p0}, Ll/ibf0;->H0(Lcom/p1/mobile/putong/api/api/AccountTempApi$SignUpType;Ll/x20;Ll/y20;)V

    .line 74
    .line 75
    .line 76
    const-string p0, "user_age"

    .line 77
    .line 78
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 79
    .line 80
    .line 81
    move-result-object p1

    .line 82
    invoke-static {p0, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 83
    .line 84
    .line 85
    move-result-object p0

    .line 86
    filled-new-array {p0}, [Ll/pf60;

    .line 87
    .line 88
    .line 89
    move-result-object p0

    .line 90
    const-string p1, "e_ai_signup_age"

    .line 91
    .line 92
    const-string p2, "p_ai_signup"

    .line 93
    .line 94
    invoke-static {p1, p2, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 95
    .line 96
    .line 97
    return-void
.end method

.method public final synthetic Y0(Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/GenderView;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/jbf0;->C0()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ll/ugf0;

    .line 6
    .line 7
    invoke-direct {v1, p0, p1}, Ll/ugf0;-><init>(Ll/zif0;Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/GenderView;)V

    .line 8
    .line 9
    .line 10
    const-wide/16 p0, 0xc8

    .line 11
    .line 12
    invoke-static {v0, v1, p0, p1}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public final Y1(Lcom/p1/mobile/putong/data/Gender;Ll/x20;Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/GenderView;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/jbf0;->b:Ll/ibf0;

    .line 2
    .line 3
    check-cast v0, Ll/gef0;

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Ll/gef0;->E1(Lcom/p1/mobile/putong/data/Gender;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ll/jbf0;->b:Ll/ibf0;

    .line 9
    .line 10
    check-cast v0, Ll/gef0;

    .line 11
    .line 12
    sget-object v1, Lcom/p1/mobile/putong/api/api/AccountTempApi$SignUpType;->genderInfoSave:Lcom/p1/mobile/putong/api/api/AccountTempApi$SignUpType;

    .line 13
    .line 14
    new-instance v2, Ll/vgf0;

    .line 15
    .line 16
    invoke-direct {v2, p0, p1, p2}, Ll/vgf0;-><init>(Ll/zif0;Lcom/p1/mobile/putong/data/Gender;Ll/x20;)V

    .line 17
    .line 18
    .line 19
    new-instance p0, Ll/wgf0;

    .line 20
    .line 21
    invoke-direct {p0, p3}, Ll/wgf0;-><init>(Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/GenderView;)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {v0, v1, v2, p0}, Ll/ibf0;->H0(Lcom/p1/mobile/putong/api/api/AccountTempApi$SignUpType;Ll/x20;Ll/y20;)V

    .line 25
    .line 26
    .line 27
    const-string p0, "male"

    .line 28
    .line 29
    invoke-static {p1, p0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 30
    .line 31
    .line 32
    move-result p1

    .line 33
    if-eqz p1, :cond_0

    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_0
    const-string p0, "female"

    .line 37
    .line 38
    :goto_0
    const-string p1, "ai_signup_gender"

    .line 39
    .line 40
    invoke-static {p1, p0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    filled-new-array {p0}, [Ll/pf60;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    const-string p1, "e_ai_signup_gender"

    .line 49
    .line 50
    const-string p2, "p_ai_signup"

    .line 51
    .line 52
    invoke-static {p1, p2, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 53
    .line 54
    .line 55
    return-void
.end method

.method public final synthetic Z0(Ll/x20;Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/GenderView;Lcom/p1/mobile/putong/data/Gender;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ll/zif0;->Z1()V

    .line 2
    .line 3
    .line 4
    const-string v0, ""

    .line 5
    .line 6
    invoke-virtual {p0, v0}, Ll/zif0;->S1(Ljava/lang/String;)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0, p3, p1, p2}, Ll/zif0;->Y1(Lcom/p1/mobile/putong/data/Gender;Ll/x20;Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/GenderView;)V

    .line 10
    .line 11
    .line 12
    iget-object p0, p0, Ll/jbf0;->b:Ll/ibf0;

    .line 13
    .line 14
    check-cast p0, Ll/gef0;

    .line 15
    .line 16
    invoke-virtual {p0}, Ll/ibf0;->O0()V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public final synthetic a1()V
    .locals 2

    .line 1
    const-string v0, "DouyinTantan01"

    .line 2
    .line 3
    invoke-static {}, Ll/ls4;->b()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    iget-object p0, p0, Ll/jbf0;->b:Ll/ibf0;

    .line 12
    .line 13
    const/4 v1, 0x0

    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    check-cast p0, Ll/gef0;

    .line 17
    .line 18
    const/4 v0, 0x1

    .line 19
    invoke-virtual {p0, v1, v0}, Ll/gef0;->g1(ZZ)V

    .line 20
    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    check-cast p0, Ll/gef0;

    .line 24
    .line 25
    invoke-virtual {p0, v1, v1}, Ll/gef0;->g1(ZZ)V

    .line 26
    .line 27
    .line 28
    :goto_0
    const-string p0, "e_ai_signup_photo"

    .line 29
    .line 30
    const-string v0, "p_ai_signup"

    .line 31
    .line 32
    invoke-static {p0, v0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public final b2(Ljava/lang/String;Ll/kcg0;Ll/x20;Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/NameView;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/account/AccountModule;->c:Lcom/p1/mobile/putong/account/api/a;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/account/api/a;->j2(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, p4, p2, p3, p1}, Ll/zif0;->f2(Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/NameView;Ll/kcg0;Ll/x20;Ljava/lang/String;)V

    .line 7
    .line 8
    .line 9
    const-string p0, "e_ai_signup_name"

    .line 10
    .line 11
    const-string p1, "p_ai_signup"

    .line 12
    .line 13
    invoke-static {p0, p1}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public c2(I)V
    .locals 2

    .line 1
    invoke-static {}, Ll/mgf0;->r0()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const/4 v0, 0x2

    .line 8
    invoke-static {v0, p1}, Ljava/lang/Math;->min(II)I

    .line 9
    .line 10
    .line 11
    move-result p1

    .line 12
    :cond_0
    if-gez p1, :cond_1

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_1
    iget-object v0, p0, Ll/zif0;->m:Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/StepProgressView;

    .line 16
    .line 17
    add-int/lit8 v1, p1, -0x1

    .line 18
    .line 19
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/StepProgressView;->setDefaultStep(I)V

    .line 20
    .line 21
    .line 22
    const/4 v0, 0x1

    .line 23
    if-ge p1, v0, :cond_2

    .line 24
    .line 25
    :goto_0
    return-void

    .line 26
    :cond_2
    iget-object p0, p0, Ll/zif0;->m:Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/StepProgressView;

    .line 27
    .line 28
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/StepProgressView;->setTargetStep(I)V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public final synthetic d1()V
    .locals 2

    .line 1
    invoke-static {}, Ll/bp;->h()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Ll/zif0;->l:Lv/VText;

    .line 8
    .line 9
    const/4 v1, 0x1

    .line 10
    invoke-static {v0, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 11
    .line 12
    .line 13
    iget-object p0, p0, Ll/jbf0;->a:Lcom/p1/mobile/putong/app/PutongAct;

    .line 14
    .line 15
    check-cast p0, Lcom/p1/mobile/putong/account/ui/accountai/SignUpAiAct;

    .line 16
    .line 17
    invoke-virtual {p0}, Lcom/p1/mobile/putong/account/ui/accountai/SignUpAiAct;->pageId()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    const-string v0, "skip_from_which"

    .line 22
    .line 23
    const-string v1, "photo"

    .line 24
    .line 25
    invoke-static {v0, v1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    filled-new-array {v0}, [Ll/pf60;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    const-string v1, "e_ai_signup_skip_button"

    .line 34
    .line 35
    invoke-static {v1, p0, v0}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 36
    .line 37
    .line 38
    :cond_0
    return-void
.end method

.method public destroy()V
    .locals 3

    .line 1
    invoke-super {p0}, Ll/jbf0;->destroy()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/zif0;->C:Landroid/animation/Animator;

    .line 5
    .line 6
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    iget-object v0, p0, Ll/zif0;->C:Landroid/animation/Animator;

    .line 13
    .line 14
    invoke-virtual {v0}, Landroid/animation/Animator;->cancel()V

    .line 15
    .line 16
    .line 17
    :cond_0
    const/4 v0, 0x0

    .line 18
    :goto_0
    iget-object v1, p0, Ll/zif0;->D:Ljava/util/ArrayList;

    .line 19
    .line 20
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    iget-object v2, p0, Ll/zif0;->D:Ljava/util/ArrayList;

    .line 25
    .line 26
    if-ge v0, v1, :cond_2

    .line 27
    .line 28
    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 33
    .line 34
    .line 35
    move-result v1

    .line 36
    if-eqz v1, :cond_1

    .line 37
    .line 38
    iget-object v1, p0, Ll/zif0;->D:Ljava/util/ArrayList;

    .line 39
    .line 40
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    check-cast v1, Landroid/animation/Animator;

    .line 45
    .line 46
    invoke-virtual {v1}, Landroid/animation/Animator;->isRunning()Z

    .line 47
    .line 48
    .line 49
    move-result v1

    .line 50
    if-eqz v1, :cond_1

    .line 51
    .line 52
    iget-object v1, p0, Ll/zif0;->D:Ljava/util/ArrayList;

    .line 53
    .line 54
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 55
    .line 56
    .line 57
    move-result-object v1

    .line 58
    check-cast v1, Landroid/animation/Animator;

    .line 59
    .line 60
    invoke-virtual {v1}, Landroid/animation/Animator;->cancel()V

    .line 61
    .line 62
    .line 63
    :cond_1
    add-int/lit8 v0, v0, 0x1

    .line 64
    .line 65
    goto :goto_0

    .line 66
    :cond_2
    invoke-virtual {v2}, Ljava/util/ArrayList;->clear()V

    .line 67
    .line 68
    .line 69
    return-void
.end method

.method public final synthetic e1()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jbf0;->b:Ll/ibf0;

    .line 2
    .line 3
    check-cast p0, Ll/gef0;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/gef0;->B1()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic f1(Landroid/view/View;)V
    .locals 8

    .line 1
    iget-object p1, p0, Ll/jbf0;->a:Lcom/p1/mobile/putong/app/PutongAct;

    .line 2
    .line 3
    check-cast p1, Lcom/p1/mobile/putong/account/ui/accountai/SignUpAiAct;

    .line 4
    .line 5
    invoke-virtual {p1}, Lcom/p1/mobile/putong/account/ui/accountai/SignUpAiAct;->pageId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    const-string v0, "skip_from_which"

    .line 10
    .line 11
    const-string v1, "photo"

    .line 12
    .line 13
    invoke-static {v0, v1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    filled-new-array {v0}, [Ll/pf60;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    const-string v1, "e_ai_signup_skip_button"

    .line 22
    .line 23
    invoke-static {v1, p1, v0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 24
    .line 25
    .line 26
    invoke-direct {p0}, Ll/zif0;->A0()V

    .line 27
    .line 28
    .line 29
    new-instance v6, Ll/mhf0;

    .line 30
    .line 31
    invoke-direct {v6}, Ll/mhf0;-><init>()V

    .line 32
    .line 33
    .line 34
    new-instance v7, Ll/nhf0;

    .line 35
    .line 36
    invoke-direct {v7, p0}, Ll/nhf0;-><init>(Ll/zif0;)V

    .line 37
    .line 38
    .line 39
    const-string v3, "\u8df3\u8fc7\u5c06\u4f1a\u5f71\u54cd\u60a8\u8fdb\u5165\u540e\u5339\u914d\u7528\u6237\u7684\u4f53\u9a8c"

    .line 40
    .line 41
    const-string v4, "\u7ee7\u7eed\u4e0a\u4f20"

    .line 42
    .line 43
    const-string v5, "photo"

    .line 44
    .line 45
    move-object v2, p0

    .line 46
    invoke-direct/range {v2 .. v7}, Ll/zif0;->d2(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ll/x20;Ll/x20;)V

    .line 47
    .line 48
    .line 49
    return-void
.end method

.method public final f2(Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/NameView;Ll/kcg0;Ll/x20;Ljava/lang/String;)V
    .locals 6

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/data/DetectRequest;->new_()Lcom/p1/mobile/putong/data/DetectRequest;

    .line 2
    .line 3
    .line 4
    move-result-object v1

    .line 5
    const-string v0, "login"

    .line 6
    .line 7
    invoke-static {v0}, Lcom/p1/mobile/putong/data/DetectCategoryType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/DetectCategoryType;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iput-object v0, v1, Lcom/p1/mobile/putong/data/DetectRequest;->category:Lcom/p1/mobile/putong/data/DetectCategoryType;

    .line 12
    .line 13
    invoke-static {}, Lcom/p1/mobile/putong/data/DetectText;->new_()Lcom/p1/mobile/putong/data/DetectText;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    const-string v2, "nikeName"

    .line 18
    .line 19
    iput-object v2, v0, Lcom/p1/mobile/putong/data/DetectText;->key:Ljava/lang/String;

    .line 20
    .line 21
    iput-object p4, v0, Lcom/p1/mobile/putong/data/DetectText;->value:Ljava/lang/String;

    .line 22
    .line 23
    new-instance v2, Ljava/util/ArrayList;

    .line 24
    .line 25
    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 26
    .line 27
    .line 28
    invoke-interface {v2, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 29
    .line 30
    .line 31
    iput-object v2, v1, Lcom/p1/mobile/putong/data/DetectRequest;->text:Ljava/util/List;

    .line 32
    .line 33
    iget-object v0, p0, Ll/jbf0;->b:Ll/ibf0;

    .line 34
    .line 35
    check-cast v0, Ll/gef0;

    .line 36
    .line 37
    sget-object v3, Lcom/p1/mobile/putong/api/api/AccountTempApi$SignUpType;->nameInfoSaved:Lcom/p1/mobile/putong/api/api/AccountTempApi$SignUpType;

    .line 38
    .line 39
    new-instance v4, Ll/hif0;

    .line 40
    .line 41
    invoke-direct {v4, p0, p4, p3, p2}, Ll/hif0;-><init>(Ll/zif0;Ljava/lang/String;Ll/x20;Ll/kcg0;)V

    .line 42
    .line 43
    .line 44
    new-instance v5, Ll/iif0;

    .line 45
    .line 46
    invoke-direct {v5, p1}, Ll/iif0;-><init>(Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/NameView;)V

    .line 47
    .line 48
    .line 49
    move-object v2, p1

    .line 50
    invoke-virtual/range {v0 .. v5}, Ll/ibf0;->P0(Lcom/p1/mobile/putong/data/DetectRequest;Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/NameView;Lcom/p1/mobile/putong/api/api/AccountTempApi$SignUpType;Ll/x20;Ll/y20;)V

    .line 51
    .line 52
    .line 53
    return-void
.end method

.method public final synthetic g1(Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/NameView;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    .line 2
    .line 3
    .line 4
    move-result p2

    .line 5
    if-nez p2, :cond_0

    .line 6
    .line 7
    invoke-virtual {p1}, Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/NameView;->V()V

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    iget-object p0, p0, Ll/jbf0;->a:Lcom/p1/mobile/putong/app/PutongAct;

    .line 12
    .line 13
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/NameView;->a0(Lcom/p1/mobile/android/app/Act;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public final g2(Ll/x20;)V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/zif0;->M:Ll/jxd0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ljava/lang/Boolean;

    .line 8
    .line 9
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    const/4 v1, 0x1

    .line 14
    if-eqz v0, :cond_1

    .line 15
    .line 16
    invoke-virtual {p0, v1}, Ll/zif0;->c2(I)V

    .line 17
    .line 18
    .line 19
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    if-eqz p0, :cond_0

    .line 24
    .line 25
    invoke-interface {p1}, Ll/x20;->call()V

    .line 26
    .line 27
    .line 28
    :cond_0
    return-void

    .line 29
    :cond_1
    iget-object v0, p0, Ll/zif0;->e:Lv/VFrame;

    .line 30
    .line 31
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 32
    .line 33
    .line 34
    iget-object v0, p0, Ll/zif0;->g:Lv/VImage;

    .line 35
    .line 36
    const/4 v1, 0x0

    .line 37
    invoke-virtual {v0, v1}, Landroid/view/View;->setAlpha(F)V

    .line 38
    .line 39
    .line 40
    iget-object v0, p0, Ll/zif0;->d:Lv/VDraweeView;

    .line 41
    .line 42
    invoke-virtual {v0, v1}, Landroid/view/View;->setAlpha(F)V

    .line 43
    .line 44
    .line 45
    iget-object v0, p0, Ll/zif0;->c:Landroid/view/View;

    .line 46
    .line 47
    const/4 v2, 0x0

    .line 48
    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 49
    .line 50
    .line 51
    iget-object v0, p0, Ll/zif0;->o:Lv/VImage;

    .line 52
    .line 53
    invoke-static {v0, v2}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 54
    .line 55
    .line 56
    iget-object v0, p0, Ll/zif0;->i:Lv/VRelative;

    .line 57
    .line 58
    invoke-virtual {v0, v1}, Landroid/view/View;->setAlpha(F)V

    .line 59
    .line 60
    .line 61
    iget-object v0, p0, Ll/zif0;->m:Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/StepProgressView;

    .line 62
    .line 63
    invoke-virtual {v0, v1}, Landroid/view/View;->setAlpha(F)V

    .line 64
    .line 65
    .line 66
    new-instance v0, Ll/xgf0;

    .line 67
    .line 68
    invoke-direct {v0, p0, p1}, Ll/xgf0;-><init>(Ll/zif0;Ll/x20;)V

    .line 69
    .line 70
    .line 71
    iget-object p1, p0, Ll/jbf0;->a:Lcom/p1/mobile/putong/app/PutongAct;

    .line 72
    .line 73
    new-instance v1, Ll/ygf0;

    .line 74
    .line 75
    invoke-direct {v1, p0, v0}, Ll/ygf0;-><init>(Ll/zif0;Ll/x20;)V

    .line 76
    .line 77
    .line 78
    const-wide/16 v2, 0x1f4

    .line 79
    .line 80
    invoke-static {p1, v1, v2, v3}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 81
    .line 82
    .line 83
    const-string p0, "e_ai_appear"

    .line 84
    .line 85
    const-string p1, "p_ai_signup"

    .line 86
    .line 87
    invoke-static {p0, p1}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 88
    .line 89
    .line 90
    return-void
.end method

.method public final synthetic h1()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/jbf0;->a()Lcom/p1/mobile/putong/app/PutongAct;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object p0, p0, Ll/zif0;->B:Landroid/view/View;

    .line 6
    .line 7
    invoke-virtual {v0, p0}, Lcom/p1/mobile/android/app/Act;->hideInput(Landroid/view/View;)Z

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/zif0;->z0(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iput-object p1, p0, Ll/zif0;->B:Landroid/view/View;

    .line 6
    .line 7
    invoke-direct {p0}, Ll/zif0;->r()V

    .line 8
    .line 9
    .line 10
    iget-object p0, p0, Ll/zif0;->B:Landroid/view/View;

    .line 11
    .line 12
    return-object p0
.end method

.method public final synthetic j1()V
    .locals 1

    .line 1
    const/4 v0, 0x4

    .line 2
    invoke-virtual {p0, v0}, Ll/zif0;->c2(I)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public final synthetic k1()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jbf0;->b:Ll/ibf0;

    .line 2
    .line 3
    check-cast p0, Ll/gef0;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/gef0;->v1()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic l1(Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/NameView;)V
    .locals 9

    .line 1
    sget-object v1, Landroid/view/View;->ALPHA:Landroid/util/Property;

    .line 2
    .line 3
    const/4 v8, 0x2

    .line 4
    new-array v7, v8, [F

    .line 5
    .line 6
    fill-array-data v7, :array_0

    .line 7
    .line 8
    .line 9
    const-wide/16 v2, 0xc8

    .line 10
    .line 11
    const-wide/16 v4, 0x190

    .line 12
    .line 13
    const/4 v6, 0x0

    .line 14
    move-object v0, p1

    .line 15
    invoke-static/range {v0 .. v7}, Ll/gt0;->l(Landroid/view/View;Landroid/util/Property;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    new-instance v0, Ll/oif0;

    .line 20
    .line 21
    invoke-direct {v0, p0}, Ll/oif0;-><init>(Ll/zif0;)V

    .line 22
    .line 23
    .line 24
    invoke-static {p1, v0}, Ll/gt0;->f(Landroid/animation/Animator;Ljava/lang/Runnable;)Landroid/animation/Animator;

    .line 25
    .line 26
    .line 27
    iget-object v0, p0, Ll/zif0;->p:Lv/VText;

    .line 28
    .line 29
    iget-object v1, p0, Ll/zif0;->q:Lv/VText;

    .line 30
    .line 31
    iget-object v2, p0, Ll/zif0;->r:Lv/VText;

    .line 32
    .line 33
    iget-object v3, p0, Ll/zif0;->s:Lv/VText;

    .line 34
    .line 35
    iget-object v4, p0, Ll/zif0;->t:Lv/VRelative;

    .line 36
    .line 37
    const/4 v5, 0x5

    .line 38
    new-array v5, v5, [Landroid/view/View;

    .line 39
    .line 40
    const/4 v6, 0x0

    .line 41
    aput-object v0, v5, v6

    .line 42
    .line 43
    const/4 v0, 0x1

    .line 44
    aput-object v1, v5, v0

    .line 45
    .line 46
    aput-object v2, v5, v8

    .line 47
    .line 48
    const/4 v0, 0x3

    .line 49
    aput-object v3, v5, v0

    .line 50
    .line 51
    const/4 v0, 0x4

    .line 52
    aput-object v4, v5, v0

    .line 53
    .line 54
    const-wide/16 v0, 0x190

    .line 55
    .line 56
    invoke-static {v0, v1, v5}, Ll/t;->e(J[Landroid/view/View;)Landroid/animation/Animator;

    .line 57
    .line 58
    .line 59
    move-result-object v2

    .line 60
    new-instance v3, Ll/pif0;

    .line 61
    .line 62
    invoke-direct {v3, p0}, Ll/pif0;-><init>(Ll/zif0;)V

    .line 63
    .line 64
    .line 65
    invoke-static {v2, v3}, Ll/gt0;->v(Landroid/animation/Animator;Ljava/lang/Runnable;)Landroid/animation/Animator;

    .line 66
    .line 67
    .line 68
    iget-object v3, p0, Ll/zif0;->s:Lv/VText;

    .line 69
    .line 70
    invoke-static {v3, v0, v1}, Ll/t;->b(Landroid/view/View;J)Landroid/animation/Animator;

    .line 71
    .line 72
    .line 73
    move-result-object v0

    .line 74
    filled-new-array {p1, v0}, [Landroid/animation/Animator;

    .line 75
    .line 76
    .line 77
    move-result-object p1

    .line 78
    invoke-static {p1}, Ll/gt0;->z([Landroid/animation/Animator;)Landroid/animation/Animator;

    .line 79
    .line 80
    .line 81
    move-result-object p1

    .line 82
    filled-new-array {p1, v2}, [Landroid/animation/Animator;

    .line 83
    .line 84
    .line 85
    move-result-object p1

    .line 86
    invoke-static {p1}, Ll/gt0;->s([Landroid/animation/Animator;)Landroid/animation/Animator;

    .line 87
    .line 88
    .line 89
    move-result-object p1

    .line 90
    iput-object p1, p0, Ll/zif0;->J:Landroid/animation/Animator;

    .line 91
    .line 92
    new-instance v0, Ll/qif0;

    .line 93
    .line 94
    invoke-direct {v0, p0}, Ll/qif0;-><init>(Ll/zif0;)V

    .line 95
    .line 96
    .line 97
    invoke-static {p1, v0}, Ll/gt0;->f(Landroid/animation/Animator;Ljava/lang/Runnable;)Landroid/animation/Animator;

    .line 98
    .line 99
    .line 100
    iget-object p1, p0, Ll/zif0;->J:Landroid/animation/Animator;

    .line 101
    .line 102
    invoke-virtual {p1}, Landroid/animation/Animator;->start()V

    .line 103
    .line 104
    .line 105
    iget-object p1, p0, Ll/zif0;->D:Ljava/util/ArrayList;

    .line 106
    .line 107
    iget-object p0, p0, Ll/zif0;->J:Landroid/animation/Animator;

    .line 108
    .line 109
    invoke-virtual {p1, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 110
    .line 111
    .line 112
    return-void

    .line 113
    :array_0
    .array-data 4
        0x3f800000    # 1.0f
        0x0
    .end array-data
.end method

.method public final synthetic m1(Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/NameView;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/jbf0;->C0()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ll/xhf0;

    .line 6
    .line 7
    invoke-direct {v1, p0, p1}, Ll/xhf0;-><init>(Ll/zif0;Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/NameView;)V

    .line 8
    .line 9
    .line 10
    const-wide/16 p0, 0xc8

    .line 11
    .line 12
    invoke-static {v0, v1, p0, p1}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public final synthetic n1(Ljava/lang/String;)V
    .locals 2

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iget-object v1, p0, Ll/zif0;->r:Lv/VText;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x0

    .line 10
    invoke-static {v1, p0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 11
    .line 12
    .line 13
    const-string p1, "p_ai_signup"

    .line 14
    .line 15
    new-array p0, p0, [Ll/pf60;

    .line 16
    .line 17
    const-string v0, "e_ai_signup_name"

    .line 18
    .line 19
    invoke-static {v0, p1, p0}, Ll/i4g0;->v(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 20
    .line 21
    .line 22
    return-void

    .line 23
    :cond_0
    invoke-virtual {v1, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 24
    .line 25
    .line 26
    iget-object p1, p0, Ll/zif0;->r:Lv/VText;

    .line 27
    .line 28
    sget v0, Ll/bbc0;->E1:I

    .line 29
    .line 30
    invoke-virtual {p1, v0}, Landroidx/appcompat/widget/AppCompatTextView;->setBackgroundResource(I)V

    .line 31
    .line 32
    .line 33
    iget-object p1, p0, Ll/zif0;->r:Lv/VText;

    .line 34
    .line 35
    iget-object v0, p0, Ll/jbf0;->a:Lcom/p1/mobile/putong/app/PutongAct;

    .line 36
    .line 37
    check-cast v0, Lcom/p1/mobile/putong/account/ui/accountai/SignUpAiAct;

    .line 38
    .line 39
    invoke-virtual {v0}, Lcom/p1/mobile/putong/app/PutongAct;->getResources()Landroid/content/res/Resources;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    sget v1, Ll/a9c0;->k:I

    .line 44
    .line 45
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getColor(I)I

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 50
    .line 51
    .line 52
    iget-object p1, p0, Ll/zif0;->r:Lv/VText;

    .line 53
    .line 54
    const/4 v0, 0x1

    .line 55
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 56
    .line 57
    .line 58
    iget-object p1, p0, Ll/zif0;->r:Lv/VText;

    .line 59
    .line 60
    const/high16 v0, 0x3f800000    # 1.0f

    .line 61
    .line 62
    invoke-virtual {p1, v0}, Landroid/view/View;->setAlpha(F)V

    .line 63
    .line 64
    .line 65
    iget-object p1, p0, Ll/jbf0;->a:Lcom/p1/mobile/putong/app/PutongAct;

    .line 66
    .line 67
    iget-object v0, p0, Ll/zif0;->r:Lv/VText;

    .line 68
    .line 69
    invoke-static {p1, v0}, Ll/t;->c(Landroid/content/Context;Landroid/view/View;)V

    .line 70
    .line 71
    .line 72
    invoke-virtual {p0}, Ll/zif0;->V1()V

    .line 73
    .line 74
    .line 75
    return-void
.end method

.method public final synthetic o1(Ll/kcg0;Ll/x20;Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/NameView;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p4, p1, p2, p3}, Ll/zif0;->b2(Ljava/lang/String;Ll/kcg0;Ll/x20;Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/NameView;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic p1(Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/NameView;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jbf0;->a:Lcom/p1/mobile/putong/app/PutongAct;

    .line 2
    .line 3
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/NameView;->a0(Lcom/p1/mobile/android/app/Act;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic q1(Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/NameView;Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p2, p0, Ll/jbf0;->a:Lcom/p1/mobile/putong/app/PutongAct;

    .line 2
    .line 3
    check-cast p2, Lcom/p1/mobile/putong/account/ui/accountai/SignUpAiAct;

    .line 4
    .line 5
    invoke-virtual {p2}, Lcom/p1/mobile/putong/account/ui/accountai/SignUpAiAct;->pageId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p2

    .line 9
    const-string v0, "e_ai_signup_chage_name_button"

    .line 10
    .line 11
    invoke-static {v0, p2}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0, p1}, Ll/zif0;->K1(Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/NameView;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public final synthetic r1(Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/NameView;)V
    .locals 2

    .line 1
    invoke-static {}, Ll/bp;->h()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const-string v0, "name"

    .line 8
    .line 9
    invoke-virtual {p0, v0}, Ll/zif0;->S1(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    const/4 v0, 0x1

    .line 13
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/NameView;->setEditViewPadding(Z)V

    .line 14
    .line 15
    .line 16
    iget-object v1, p1, Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/NameView;->e:Lv/VImage;

    .line 17
    .line 18
    invoke-static {v1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 19
    .line 20
    .line 21
    iget-object v0, p1, Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/NameView;->e:Lv/VImage;

    .line 22
    .line 23
    new-instance v1, Ll/jif0;

    .line 24
    .line 25
    invoke-direct {v1, p0, p1}, Ll/jif0;-><init>(Ll/zif0;Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/NameView;)V

    .line 26
    .line 27
    .line 28
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 29
    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_0
    const/4 v0, 0x0

    .line 33
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/NameView;->setEditViewPadding(Z)V

    .line 34
    .line 35
    .line 36
    iget-object v1, p1, Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/NameView;->e:Lv/VImage;

    .line 37
    .line 38
    invoke-static {v1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 39
    .line 40
    .line 41
    :goto_0
    sget-object v0, Lcom/p1/mobile/putong/account/AccountModule;->c:Lcom/p1/mobile/putong/account/api/a;

    .line 42
    .line 43
    invoke-virtual {v0}, Lcom/p1/mobile/putong/account/api/a;->I2()Ll/wyd0;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    check-cast v0, Ljava/lang/CharSequence;

    .line 52
    .line 53
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 54
    .line 55
    .line 56
    move-result v0

    .line 57
    if-nez v0, :cond_1

    .line 58
    .line 59
    new-instance p0, Ll/kif0;

    .line 60
    .line 61
    invoke-direct {p0, p1}, Ll/kif0;-><init>(Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/NameView;)V

    .line 62
    .line 63
    .line 64
    invoke-virtual {p1, p0}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 65
    .line 66
    .line 67
    return-void

    .line 68
    :cond_1
    invoke-static {}, Ll/bp;->h()Z

    .line 69
    .line 70
    .line 71
    move-result v0

    .line 72
    if-eqz v0, :cond_2

    .line 73
    .line 74
    invoke-virtual {p0, p1}, Ll/zif0;->K1(Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/NameView;)V

    .line 75
    .line 76
    .line 77
    :cond_2
    return-void
.end method

.method public final synthetic s1(Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/NameView;Ll/kcg0;Ll/x20;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/zif0;->l:Lv/VText;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p1}, Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/NameView;->getLastName()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-nez v0, :cond_0

    .line 16
    .line 17
    invoke-virtual {p1}, Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/NameView;->getLastName()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    goto :goto_0

    .line 22
    :cond_0
    iget-object v0, p0, Ll/zif0;->Q:Ljava/lang/String;

    .line 23
    .line 24
    :goto_0
    invoke-virtual {p0, v0, p2, p3, p1}, Ll/zif0;->b2(Ljava/lang/String;Ll/kcg0;Ll/x20;Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/NameView;)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public final synthetic t1(Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/NameView;Ll/kcg0;Ll/x20;Landroid/view/View;)V
    .locals 8

    .line 1
    iget-object p4, p0, Ll/jbf0;->a:Lcom/p1/mobile/putong/app/PutongAct;

    .line 2
    .line 3
    check-cast p4, Lcom/p1/mobile/putong/account/ui/accountai/SignUpAiAct;

    .line 4
    .line 5
    invoke-virtual {p4}, Lcom/p1/mobile/putong/account/ui/accountai/SignUpAiAct;->pageId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p4

    .line 9
    const-string v0, "skip_from_which"

    .line 10
    .line 11
    const-string v1, "name"

    .line 12
    .line 13
    invoke-static {v0, v1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    filled-new-array {v0}, [Ll/pf60;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    const-string v1, "e_ai_signup_skip_button"

    .line 22
    .line 23
    invoke-static {v1, p4, v0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 24
    .line 25
    .line 26
    invoke-direct {p0}, Ll/zif0;->A0()V

    .line 27
    .line 28
    .line 29
    new-instance v6, Ll/aif0;

    .line 30
    .line 31
    invoke-direct {v6}, Ll/aif0;-><init>()V

    .line 32
    .line 33
    .line 34
    new-instance v7, Ll/bif0;

    .line 35
    .line 36
    invoke-direct {v7, p0, p1, p2, p3}, Ll/bif0;-><init>(Ll/zif0;Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/NameView;Ll/kcg0;Ll/x20;)V

    .line 37
    .line 38
    .line 39
    const-string v3, "\u586b\u5199\u201c\u6635\u79f0\u201d\u65b9\u4fbf\u522b\u4eba\u66f4\u5feb\u8bb0\u4f4f\u4f60\uff0c\u82e5\u4ecd\u8981\u8df3\u8fc7\uff0c\u7cfb\u7edf\u5c06\u968f\u673a\u5c55\u793a\u6635\u79f0\uff0c\u60a8\u53ef\u8fdb\u5165\u540e\u81ea\u884c\u66f4\u6539"

    .line 40
    .line 41
    const-string v4, "\u7ee7\u7eed\u586b\u5199"

    .line 42
    .line 43
    const-string v5, "name"

    .line 44
    .line 45
    move-object v2, p0

    .line 46
    invoke-direct/range {v2 .. v7}, Ll/zif0;->d2(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ll/x20;Ll/x20;)V

    .line 47
    .line 48
    .line 49
    return-void
.end method

.method public final synthetic u1()V
    .locals 9

    .line 1
    invoke-virtual {p0}, Ll/jbf0;->a()Lcom/p1/mobile/putong/app/PutongAct;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_2

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/jbf0;->a()Lcom/p1/mobile/putong/app/PutongAct;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->isFinishing()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-nez v0, :cond_2

    .line 20
    .line 21
    const/4 v0, 0x2

    .line 22
    new-array v1, v0, [I

    .line 23
    .line 24
    iget-object v2, p0, Ll/zif0;->z:Lv/VScroll;

    .line 25
    .line 26
    invoke-virtual {v2, v1}, Landroid/view/View;->getLocationInWindow([I)V

    .line 27
    .line 28
    .line 29
    const/4 v2, 0x1

    .line 30
    aget v1, v1, v2

    .line 31
    .line 32
    new-array v0, v0, [I

    .line 33
    .line 34
    iget-object v3, p0, Ll/zif0;->r:Lv/VText;

    .line 35
    .line 36
    invoke-static {v3}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 37
    .line 38
    .line 39
    move-result v3

    .line 40
    if-eqz v3, :cond_0

    .line 41
    .line 42
    iget-object v3, p0, Ll/zif0;->r:Lv/VText;

    .line 43
    .line 44
    invoke-virtual {v3, v0}, Landroid/view/View;->getLocationInWindow([I)V

    .line 45
    .line 46
    .line 47
    aget v0, v0, v2

    .line 48
    .line 49
    iget-object v2, p0, Ll/zif0;->r:Lv/VText;

    .line 50
    .line 51
    invoke-virtual {v2}, Landroid/view/View;->getHeight()I

    .line 52
    .line 53
    .line 54
    move-result v2

    .line 55
    :goto_0
    add-int/2addr v0, v2

    .line 56
    goto :goto_1

    .line 57
    :cond_0
    iget-object v3, p0, Ll/zif0;->q:Lv/VText;

    .line 58
    .line 59
    invoke-static {v3}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 60
    .line 61
    .line 62
    move-result v3

    .line 63
    if-eqz v3, :cond_1

    .line 64
    .line 65
    iget-object v3, p0, Ll/zif0;->q:Lv/VText;

    .line 66
    .line 67
    invoke-virtual {v3, v0}, Landroid/view/View;->getLocationInWindow([I)V

    .line 68
    .line 69
    .line 70
    aget v0, v0, v2

    .line 71
    .line 72
    iget-object v2, p0, Ll/zif0;->q:Lv/VText;

    .line 73
    .line 74
    invoke-virtual {v2}, Landroid/view/View;->getHeight()I

    .line 75
    .line 76
    .line 77
    move-result v2

    .line 78
    goto :goto_0

    .line 79
    :cond_1
    iget-object v3, p0, Ll/zif0;->p:Lv/VText;

    .line 80
    .line 81
    invoke-virtual {v3, v0}, Landroid/view/View;->getLocationInWindow([I)V

    .line 82
    .line 83
    .line 84
    aget v0, v0, v2

    .line 85
    .line 86
    iget-object v2, p0, Ll/zif0;->p:Lv/VText;

    .line 87
    .line 88
    invoke-virtual {v2}, Landroid/view/View;->getHeight()I

    .line 89
    .line 90
    .line 91
    move-result v2

    .line 92
    goto :goto_0

    .line 93
    :goto_1
    if-ge v1, v0, :cond_2

    .line 94
    .line 95
    sub-int/2addr v0, v1

    .line 96
    iget-object v1, p0, Ll/zif0;->n:Lv/VLinear;

    .line 97
    .line 98
    invoke-virtual {v1}, Landroid/view/View;->getScrollY()I

    .line 99
    .line 100
    .line 101
    move-result v1

    .line 102
    add-int/2addr v0, v1

    .line 103
    iput v0, p0, Ll/zif0;->P:I

    .line 104
    .line 105
    iget-object v1, p0, Ll/zif0;->n:Lv/VLinear;

    .line 106
    .line 107
    new-instance v2, Ll/zif0$c;

    .line 108
    .line 109
    sget-object v0, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    .line 110
    .line 111
    const-string v3, ""

    .line 112
    .line 113
    invoke-direct {v2, p0, v0, v3}, Ll/zif0$c;-><init>(Ll/zif0;Ljava/lang/Class;Ljava/lang/String;)V

    .line 114
    .line 115
    .line 116
    iget-object v0, p0, Ll/zif0;->n:Lv/VLinear;

    .line 117
    .line 118
    invoke-virtual {v0}, Landroid/view/View;->getScrollY()I

    .line 119
    .line 120
    .line 121
    move-result v0

    .line 122
    iget p0, p0, Ll/zif0;->P:I

    .line 123
    .line 124
    filled-new-array {v0, p0}, [I

    .line 125
    .line 126
    .line 127
    move-result-object v8

    .line 128
    const-wide/16 v3, 0x0

    .line 129
    .line 130
    const-wide/16 v5, 0xc8

    .line 131
    .line 132
    const/4 v7, 0x0

    .line 133
    invoke-static/range {v1 .. v8}, Ll/gt0;->m(Landroid/view/View;Landroid/util/Property;JJLandroid/view/animation/Interpolator;[I)Landroid/animation/Animator;

    .line 134
    .line 135
    .line 136
    move-result-object p0

    .line 137
    invoke-virtual {p0}, Landroid/animation/Animator;->start()V

    .line 138
    .line 139
    .line 140
    :cond_2
    return-void
.end method

.method public final synthetic v1()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/jbf0;->a()Lcom/p1/mobile/putong/app/PutongAct;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object p0, p0, Ll/zif0;->B:Landroid/view/View;

    .line 6
    .line 7
    invoke-virtual {v0, p0}, Lcom/p1/mobile/android/app/Act;->hideInput(Landroid/view/View;)Z

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final synthetic w1()V
    .locals 1

    .line 1
    const/4 v0, 0x3

    .line 2
    invoke-virtual {p0, v0}, Ll/zif0;->c2(I)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public final synthetic y1()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jbf0;->b:Ll/ibf0;

    .line 2
    .line 3
    check-cast p0, Ll/gef0;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/gef0;->v1()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public z0(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/ajf0;->b(Ll/zif0;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final synthetic z1(Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/AgeView;)V
    .locals 9

    .line 1
    sget-object v1, Landroid/view/View;->ALPHA:Landroid/util/Property;

    .line 2
    .line 3
    const/4 v8, 0x2

    .line 4
    new-array v7, v8, [F

    .line 5
    .line 6
    fill-array-data v7, :array_0

    .line 7
    .line 8
    .line 9
    const-wide/16 v2, 0xc8

    .line 10
    .line 11
    const-wide/16 v4, 0x190

    .line 12
    .line 13
    const/4 v6, 0x0

    .line 14
    move-object v0, p1

    .line 15
    invoke-static/range {v0 .. v7}, Ll/gt0;->l(Landroid/view/View;Landroid/util/Property;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    new-instance v0, Ll/sif0;

    .line 20
    .line 21
    invoke-direct {v0, p0}, Ll/sif0;-><init>(Ll/zif0;)V

    .line 22
    .line 23
    .line 24
    invoke-static {p1, v0}, Ll/gt0;->f(Landroid/animation/Animator;Ljava/lang/Runnable;)Landroid/animation/Animator;

    .line 25
    .line 26
    .line 27
    iget-object v0, p0, Ll/zif0;->p:Lv/VText;

    .line 28
    .line 29
    iget-object v1, p0, Ll/zif0;->q:Lv/VText;

    .line 30
    .line 31
    iget-object v2, p0, Ll/zif0;->r:Lv/VText;

    .line 32
    .line 33
    iget-object v3, p0, Ll/zif0;->s:Lv/VText;

    .line 34
    .line 35
    iget-object v4, p0, Ll/zif0;->t:Lv/VRelative;

    .line 36
    .line 37
    const/4 v5, 0x5

    .line 38
    new-array v5, v5, [Landroid/view/View;

    .line 39
    .line 40
    const/4 v6, 0x0

    .line 41
    aput-object v0, v5, v6

    .line 42
    .line 43
    const/4 v0, 0x1

    .line 44
    aput-object v1, v5, v0

    .line 45
    .line 46
    aput-object v2, v5, v8

    .line 47
    .line 48
    const/4 v0, 0x3

    .line 49
    aput-object v3, v5, v0

    .line 50
    .line 51
    const/4 v0, 0x4

    .line 52
    aput-object v4, v5, v0

    .line 53
    .line 54
    const-wide/16 v0, 0x190

    .line 55
    .line 56
    invoke-static {v0, v1, v5}, Ll/t;->e(J[Landroid/view/View;)Landroid/animation/Animator;

    .line 57
    .line 58
    .line 59
    move-result-object v2

    .line 60
    new-instance v3, Ll/tif0;

    .line 61
    .line 62
    invoke-direct {v3, p0}, Ll/tif0;-><init>(Ll/zif0;)V

    .line 63
    .line 64
    .line 65
    invoke-static {v2, v3}, Ll/gt0;->v(Landroid/animation/Animator;Ljava/lang/Runnable;)Landroid/animation/Animator;

    .line 66
    .line 67
    .line 68
    iget-object v3, p0, Ll/zif0;->s:Lv/VText;

    .line 69
    .line 70
    invoke-static {v3, v0, v1}, Ll/t;->b(Landroid/view/View;J)Landroid/animation/Animator;

    .line 71
    .line 72
    .line 73
    move-result-object v0

    .line 74
    filled-new-array {p1, v0}, [Landroid/animation/Animator;

    .line 75
    .line 76
    .line 77
    move-result-object p1

    .line 78
    invoke-static {p1}, Ll/gt0;->z([Landroid/animation/Animator;)Landroid/animation/Animator;

    .line 79
    .line 80
    .line 81
    move-result-object p1

    .line 82
    filled-new-array {p1, v2}, [Landroid/animation/Animator;

    .line 83
    .line 84
    .line 85
    move-result-object p1

    .line 86
    invoke-static {p1}, Ll/gt0;->s([Landroid/animation/Animator;)Landroid/animation/Animator;

    .line 87
    .line 88
    .line 89
    move-result-object p1

    .line 90
    iput-object p1, p0, Ll/zif0;->H:Landroid/animation/Animator;

    .line 91
    .line 92
    new-instance v0, Ll/uif0;

    .line 93
    .line 94
    invoke-direct {v0, p0}, Ll/uif0;-><init>(Ll/zif0;)V

    .line 95
    .line 96
    .line 97
    invoke-static {p1, v0}, Ll/gt0;->f(Landroid/animation/Animator;Ljava/lang/Runnable;)Landroid/animation/Animator;

    .line 98
    .line 99
    .line 100
    iget-object p1, p0, Ll/zif0;->H:Landroid/animation/Animator;

    .line 101
    .line 102
    invoke-virtual {p1}, Landroid/animation/Animator;->start()V

    .line 103
    .line 104
    .line 105
    iget-object p1, p0, Ll/zif0;->D:Ljava/util/ArrayList;

    .line 106
    .line 107
    iget-object p0, p0, Ll/zif0;->H:Landroid/animation/Animator;

    .line 108
    .line 109
    invoke-virtual {p1, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 110
    .line 111
    .line 112
    return-void

    .line 113
    :array_0
    .array-data 4
        0x3f800000    # 1.0f
        0x0
    .end array-data
.end method

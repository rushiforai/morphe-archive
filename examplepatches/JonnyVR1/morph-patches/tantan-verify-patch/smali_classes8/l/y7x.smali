.class public Ll/y7x;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qyl;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/y7x$d;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/qyl<",
        "Ll/h7x;",
        ">;"
    }
.end annotation


# instance fields
.field public A:Lv/VButton;

.field public B:Lv/VButton;

.field public C:Landroid/widget/LinearLayout;

.field public D:Lv/VButton;

.field public E:Lv/VButton;

.field public E0:Landroid/view/View$OnClickListener;

.field public F:Lv/VText;

.field public F0:Landroid/view/View$OnClickListener;

.field public G:Landroid/widget/RelativeLayout;

.field public G0:Landroid/view/View$OnClickListener;

.field public H:Lv/VEditText;

.field public H0:Landroid/view/View$OnClickListener;

.field public I:Lv/VText;

.field public I0:Z

.field public J:Lv/VScroll_Horizontal;

.field public J0:Ll/jxd0;

.field public K:Lv/VLinear;

.field public L:Lv/VButton_FakeShadow;

.field public M:Landroid/widget/FrameLayout;

.field public N:Lv/VText;

.field public O:Lcom/sunshine/engine/particle/SceneView;

.field public P:Lcom/p1/mobile/putong/core/ui/match/MatchAct;

.field public Q:Ll/h7x;

.field public R:Z

.field public final S:I

.field public final T:I

.field public final U:I

.field public final V:I

.field public W:Z

.field public X:Z

.field public Y:Z

.field public Z:Ljava/lang/String;

.field public a:Landroid/widget/RelativeLayout;

.field public b:Lv/VText;

.field public c:Landroid/view/View;

.field public d:Landroid/view/View;

.field public e:Lv/VButton;

.field public f:Lcom/sunshine/engine/particle/SceneView;

.field public g:Landroid/view/View;

.field public h:Lv/VDraweeView;

.field public i:Lv/VImage;

.field public j:Lv/VDraweeView;

.field public k:Lv/VImage;

.field public k0:I

.field public l:Lv/VImage;

.field public m:Lcom/p1/mobile/putong/core/ui/GradientBgButton;

.field public n:Lv/VLinear_FillerMeasure;

.field public o:Lv/VText;

.field public p:Lv/VText;

.field public p0:Ll/f0r;

.field public q:Landroid/widget/LinearLayout;

.field public r:Lv/VText;

.field public s:Lv/VText;

.field public t:Lv/VText_AutoFit;

.field public u:Landroid/widget/LinearLayout;

.field public v:Landroid/widget/LinearLayout;

.field public w:Lv/VButton_FakeShadow;

.field public x:Lv/VButton_FakeShadow;

.field public y:Lv/VButton;

.field public z:Landroid/widget/LinearLayout;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/match/MatchAct;)V
    .locals 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Ll/y7x;->R:Z

    .line 6
    .line 7
    const/high16 v0, 0x42d40000    # 106.0f

    .line 8
    .line 9
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    iput v0, p0, Ll/y7x;->S:I

    .line 14
    .line 15
    const v0, 0x43a38000    # 327.0f

    .line 16
    .line 17
    .line 18
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    iput v0, p0, Ll/y7x;->T:I

    .line 23
    .line 24
    invoke-static {}, Ll/bnl0;->y0()I

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    iput v0, p0, Ll/y7x;->U:I

    .line 29
    .line 30
    const/16 v0, 0xfa

    .line 31
    .line 32
    iput v0, p0, Ll/y7x;->V:I

    .line 33
    .line 34
    const/4 v0, 0x1

    .line 35
    iput-boolean v0, p0, Ll/y7x;->Y:Z

    .line 36
    .line 37
    const-string v0, "default"

    .line 38
    .line 39
    iput-object v0, p0, Ll/y7x;->Z:Ljava/lang/String;

    .line 40
    .line 41
    new-instance v0, Ll/i7x;

    .line 42
    .line 43
    invoke-direct {v0, p0}, Ll/i7x;-><init>(Ll/y7x;)V

    .line 44
    .line 45
    .line 46
    iput-object v0, p0, Ll/y7x;->E0:Landroid/view/View$OnClickListener;

    .line 47
    .line 48
    new-instance v0, Ll/p7x;

    .line 49
    .line 50
    invoke-direct {v0, p0}, Ll/p7x;-><init>(Ll/y7x;)V

    .line 51
    .line 52
    .line 53
    iput-object v0, p0, Ll/y7x;->F0:Landroid/view/View$OnClickListener;

    .line 54
    .line 55
    new-instance v0, Ll/q7x;

    .line 56
    .line 57
    invoke-direct {v0, p0}, Ll/q7x;-><init>(Ll/y7x;)V

    .line 58
    .line 59
    .line 60
    iput-object v0, p0, Ll/y7x;->G0:Landroid/view/View$OnClickListener;

    .line 61
    .line 62
    new-instance v0, Ll/r7x;

    .line 63
    .line 64
    invoke-direct {v0, p0}, Ll/r7x;-><init>(Ll/y7x;)V

    .line 65
    .line 66
    .line 67
    iput-object v0, p0, Ll/y7x;->H0:Landroid/view/View$OnClickListener;

    .line 68
    .line 69
    new-instance v0, Ll/jxd0;

    .line 70
    .line 71
    new-instance v1, Ljava/lang/StringBuilder;

    .line 72
    .line 73
    const-string v2, "has_show_match_tag_guide_view_"

    .line 74
    .line 75
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 76
    .line 77
    .line 78
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 79
    .line 80
    .line 81
    move-result-object v2

    .line 82
    invoke-interface {v2}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 83
    .line 84
    .line 85
    move-result-object v2

    .line 86
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 87
    .line 88
    .line 89
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 90
    .line 91
    .line 92
    move-result-object v1

    .line 93
    sget-object v2, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 94
    .line 95
    invoke-direct {v0, v1, v2}, Ll/jxd0;-><init>(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 96
    .line 97
    .line 98
    iput-object v0, p0, Ll/y7x;->J0:Ll/jxd0;

    .line 99
    .line 100
    iput-object p1, p0, Ll/y7x;->P:Lcom/p1/mobile/putong/core/ui/match/MatchAct;

    .line 101
    .line 102
    return-void
.end method

.method public static bridge synthetic A(Ll/y7x;Landroid/view/View;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/y7x;->g:Landroid/view/View;

    return-void
.end method

.method public static bridge synthetic B(Ll/y7x;Lv/VLinear;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/y7x;->K:Lv/VLinear;

    return-void
.end method

.method private synthetic B0(Landroid/view/View;)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/y7x;->r0()Lcom/p1/mobile/putong/core/ui/match/MatchAct;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/match/MatchAct;->pageId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    const/4 v0, 0x0

    .line 10
    new-array v1, v0, [Ll/sfj0$a;

    .line 11
    .line 12
    const-string v2, "e_intl_instantmatch_no_ultra_click"

    .line 13
    .line 14
    invoke-static {v2, p1, v1}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 15
    .line 16
    .line 17
    invoke-static {}, Ll/joa;->D3()Z

    .line 18
    .line 19
    .line 20
    move-result p1

    .line 21
    if-eqz p1, :cond_1

    .line 22
    .line 23
    invoke-static {}, Lcom/p1/mobile/putong/core/ui/match/a;->w()Lcom/p1/mobile/putong/core/ui/match/a;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/match/a;->A()Z

    .line 28
    .line 29
    .line 30
    move-result p1

    .line 31
    if-nez p1, :cond_0

    .line 32
    .line 33
    invoke-virtual {p0}, Ll/y7x;->r0()Lcom/p1/mobile/putong/core/ui/match/MatchAct;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    invoke-virtual {p0}, Ll/y7x;->r0()Lcom/p1/mobile/putong/core/ui/match/MatchAct;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    sget v1, Lcom/p1/mobile/putong/core/R$string;->u9:I

    .line 42
    .line 43
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    invoke-static {p1, v0}, Ll/o1j0;->F(Landroid/app/Activity;Ljava/lang/String;)V

    .line 48
    .line 49
    .line 50
    invoke-virtual {p0}, Ll/y7x;->r0()Lcom/p1/mobile/putong/core/ui/match/MatchAct;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 55
    .line 56
    .line 57
    return-void

    .line 58
    :cond_0
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 59
    .line 60
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 61
    .line 62
    iget-object v0, p0, Ll/y7x;->Q:Ll/h7x;

    .line 63
    .line 64
    iget-object v0, v0, Ll/k8x;->b:Ljava/lang/String;

    .line 65
    .line 66
    invoke-virtual {p1, v0}, Ll/dkb;->Pa(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 67
    .line 68
    .line 69
    move-result-object p1

    .line 70
    invoke-static {}, Lcom/p1/mobile/putong/core/ui/match/a;->w()Lcom/p1/mobile/putong/core/ui/match/a;

    .line 71
    .line 72
    .line 73
    move-result-object v0

    .line 74
    invoke-virtual {p0}, Ll/y7x;->r0()Lcom/p1/mobile/putong/core/ui/match/MatchAct;

    .line 75
    .line 76
    .line 77
    move-result-object v1

    .line 78
    new-instance v2, Ll/n7x;

    .line 79
    .line 80
    invoke-direct {v2, p0, p1}, Ll/n7x;-><init>(Ll/y7x;Lcom/p1/mobile/putong/data/User;)V

    .line 81
    .line 82
    .line 83
    invoke-virtual {v0, v1, p1, v2}, Lcom/p1/mobile/putong/core/ui/match/a;->J(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Ll/x20;)V

    .line 84
    .line 85
    .line 86
    return-void

    .line 87
    :cond_1
    iget-object p0, p0, Ll/y7x;->Q:Ll/h7x;

    .line 88
    .line 89
    invoke-virtual {p0, v0}, Ll/h7x;->l1(Z)V

    .line 90
    .line 91
    .line 92
    return-void
.end method

.method public static bridge synthetic C(Ll/y7x;Lv/VImage;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/y7x;->i:Lv/VImage;

    return-void
.end method

.method private synthetic D0(Landroid/view/View;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/y7x;->r0()Lcom/p1/mobile/putong/core/ui/match/MatchAct;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/match/MatchAct;->pageId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    const/4 v0, 0x0

    .line 10
    new-array v0, v0, [Ll/sfj0$a;

    .line 11
    .line 12
    const-string v1, "e_intl_instantmatch_no_ultra_giveup"

    .line 13
    .line 14
    invoke-static {v1, p1, v0}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 15
    .line 16
    .line 17
    iget-object p0, p0, Ll/y7x;->Q:Ll/h7x;

    .line 18
    .line 19
    invoke-virtual {p0}, Ll/h7x;->h1()V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public static bridge synthetic E(Ll/y7x;Lv/VImage;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/y7x;->k:Lv/VImage;

    return-void
.end method

.method private synthetic E0()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/y7x;->p0:Ll/f0r;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/f0r;->h()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static bridge synthetic F(Ll/y7x;Landroid/widget/RelativeLayout;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/y7x;->G:Landroid/widget/RelativeLayout;

    return-void
.end method

.method public static bridge synthetic G(Ll/y7x;Lv/VEditText;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/y7x;->H:Lv/VEditText;

    return-void
.end method

.method private synthetic G0(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p1, p0, Ll/y7x;->H:Lv/VEditText;

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
    iget-object v0, p0, Ll/y7x;->Q:Ll/h7x;

    .line 16
    .line 17
    iget-boolean p0, p0, Ll/y7x;->R:Z

    .line 18
    .line 19
    invoke-virtual {v0, p1, p0}, Ll/h7x;->i1(Ljava/lang/String;Z)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public static bridge synthetic H(Ll/y7x;Lcom/p1/mobile/putong/core/ui/GradientBgButton;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/y7x;->m:Lcom/p1/mobile/putong/core/ui/GradientBgButton;

    return-void
.end method

.method public static bridge synthetic I(Ll/y7x;Lv/VImage;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/y7x;->l:Lv/VImage;

    return-void
.end method

.method private synthetic I0(Landroid/view/View;)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/y7x;->r0()Lcom/p1/mobile/putong/core/ui/match/MatchAct;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/match/MatchAct;->pageId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    const/4 v0, 0x0

    .line 10
    new-array v1, v0, [Ll/sfj0$a;

    .line 11
    .line 12
    const-string v2, "e_intl_match_sayhi"

    .line 13
    .line 14
    invoke-static {v2, p1, v1}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 15
    .line 16
    .line 17
    iget-object p0, p0, Ll/y7x;->Q:Ll/h7x;

    .line 18
    .line 19
    invoke-virtual {p0, v0}, Ll/h7x;->k1(Z)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public static bridge synthetic J(Ll/y7x;Lcom/sunshine/engine/particle/SceneView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/y7x;->f:Lcom/sunshine/engine/particle/SceneView;

    return-void
.end method

.method public static bridge synthetic K(Ll/y7x;Landroid/widget/RelativeLayout;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/y7x;->a:Landroid/widget/RelativeLayout;

    return-void
.end method

.method private synthetic K0(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/y7x;->Q:Ll/h7x;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/h7x;->m1()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static bridge synthetic L(Ll/y7x;Lv/VText;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/y7x;->r:Lv/VText;

    return-void
.end method

.method private synthetic L0(Landroid/view/View;)V
    .locals 2

    .line 1
    invoke-static {}, Ll/gra;->S1()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/y7x;->r0()Lcom/p1/mobile/putong/core/ui/match/MatchAct;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/match/MatchAct;->pageId()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    iget-object v0, p0, Ll/y7x;->Q:Ll/h7x;

    .line 16
    .line 17
    invoke-virtual {p0}, Ll/y7x;->r0()Lcom/p1/mobile/putong/core/ui/match/MatchAct;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    iget-object v1, v1, Lcom/p1/mobile/putong/core/ui/match/MatchAct;->e:Ljava/lang/String;

    .line 22
    .line 23
    invoke-virtual {v0, v1}, Ll/k8x;->p0(Ljava/lang/String;)Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    const-string v1, "match_source"

    .line 28
    .line 29
    invoke-static {v1, v0}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    filled-new-array {v0}, [Ll/sfj0$a;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    const-string v1, "e_matched_later"

    .line 38
    .line 39
    invoke-static {v1, p1, v0}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 40
    .line 41
    .line 42
    :cond_0
    iget-object p0, p0, Ll/y7x;->Q:Ll/h7x;

    .line 43
    .line 44
    invoke-virtual {p0}, Ll/h7x;->h1()V

    .line 45
    .line 46
    .line 47
    return-void
.end method

.method public static bridge synthetic M(Ll/y7x;Landroid/widget/LinearLayout;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/y7x;->q:Landroid/widget/LinearLayout;

    return-void
.end method

.method public static bridge synthetic N(Ll/y7x;Lv/VText;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/y7x;->s:Lv/VText;

    return-void
.end method

.method public static bridge synthetic O(Ll/y7x;Landroid/widget/LinearLayout;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/y7x;->v:Landroid/widget/LinearLayout;

    return-void
.end method

.method public static bridge synthetic P(Ll/y7x;Landroid/widget/LinearLayout;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/y7x;->u:Landroid/widget/LinearLayout;

    return-void
.end method

.method public static bridge synthetic Q(Ll/y7x;Lv/VText;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/y7x;->b:Lv/VText;

    return-void
.end method

.method public static bridge synthetic R(Ll/y7x;Lv/VDraweeView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/y7x;->h:Lv/VDraweeView;

    return-void
.end method

.method public static bridge synthetic S(Ll/y7x;Lv/VDraweeView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/y7x;->j:Lv/VDraweeView;

    return-void
.end method

.method public static bridge synthetic T(Ll/y7x;Lv/VScroll_Horizontal;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/y7x;->J:Lv/VScroll_Horizontal;

    return-void
.end method

.method public static bridge synthetic U(Ll/y7x;Lv/VButton;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/y7x;->y:Lv/VButton;

    return-void
.end method

.method public static bridge synthetic V(Ll/y7x;Lv/VButton;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/y7x;->e:Lv/VButton;

    return-void
.end method

.method public static bridge synthetic W(Ll/y7x;Lcom/sunshine/engine/particle/SceneView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/y7x;->O:Lcom/sunshine/engine/particle/SceneView;

    return-void
.end method

.method public static bridge synthetic X(Ll/y7x;Lv/VButton_FakeShadow;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/y7x;->w:Lv/VButton_FakeShadow;

    return-void
.end method

.method public static bridge synthetic Y(Ll/y7x;Lv/VText_AutoFit;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/y7x;->t:Lv/VText_AutoFit;

    return-void
.end method

.method public static bridge synthetic Z(Ll/y7x;Lv/VLinear_FillerMeasure;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/y7x;->n:Lv/VLinear_FillerMeasure;

    return-void
.end method

.method public static synthetic a(Ll/y7x;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/y7x;->D0(Landroid/view/View;)V

    return-void
.end method

.method public static bridge synthetic a0(Ll/y7x;Lv/VText;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/y7x;->o:Lv/VText;

    return-void
.end method

.method public static synthetic b(Ll/y7x;Landroid/view/View$OnClickListener;Landroid/widget/TextView;ILandroid/view/KeyEvent;)Z
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/y7x;->H0(Landroid/view/View$OnClickListener;Landroid/widget/TextView;ILandroid/view/KeyEvent;)Z

    move-result p0

    return p0
.end method

.method public static bridge synthetic b0(Ll/y7x;Lv/VText;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/y7x;->p:Lv/VText;

    return-void
.end method

.method public static synthetic c(Ll/y7x;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/y7x;->L0(Landroid/view/View;)V

    return-void
.end method

.method public static bridge synthetic c0(Ll/y7x;Lv/VText;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/y7x;->I:Lv/VText;

    return-void
.end method

.method public static synthetic d(Ll/y7x;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/y7x;->B0(Landroid/view/View;)V

    return-void
.end method

.method public static bridge synthetic d0(Ll/y7x;Lv/VText;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/y7x;->F:Lv/VText;

    return-void
.end method

.method public static synthetic e(Ll/y7x;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/y7x;->M0(Landroid/view/View;)V

    return-void
.end method

.method public static bridge synthetic e0(Ll/y7x;Lv/VText;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/y7x;->N:Lv/VText;

    return-void
.end method

.method public static synthetic f(Ll/y7x;Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/y7x;->y0(Landroid/animation/ValueAnimator;)V

    return-void
.end method

.method public static bridge synthetic f0(Ll/y7x;Landroid/widget/FrameLayout;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/y7x;->M:Landroid/widget/FrameLayout;

    return-void
.end method

.method public static bridge synthetic g0(Ll/y7x;Lv/VButton_FakeShadow;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/y7x;->L:Lv/VButton_FakeShadow;

    return-void
.end method

.method public static bridge synthetic h0(Ll/y7x;Landroid/widget/LinearLayout;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/y7x;->z:Landroid/widget/LinearLayout;

    return-void
.end method

.method public static synthetic i(Ll/y7x;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/y7x;->N0(Landroid/view/View;)V

    return-void
.end method

.method public static bridge synthetic i0(Ll/y7x;Lv/VButton;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/y7x;->A:Lv/VButton;

    return-void
.end method

.method public static synthetic j(Ll/y7x;Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/y7x;->z0(Landroid/animation/ValueAnimator;)V

    return-void
.end method

.method public static bridge synthetic j0(Ll/y7x;Landroid/widget/LinearLayout;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/y7x;->C:Landroid/widget/LinearLayout;

    return-void
.end method

.method public static synthetic k(Ll/y7x;Ll/syf0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/y7x;->A0(Ll/syf0;)V

    return-void
.end method

.method public static bridge synthetic k0(Ll/y7x;Lv/VButton;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/y7x;->D:Lv/VButton;

    return-void
.end method

.method public static synthetic l(Ll/y7x;Lv/VText;I)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/y7x;->O0(Lv/VText;I)V

    return-void
.end method

.method public static bridge synthetic l0(Ll/y7x;Lv/VButton;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/y7x;->E:Lv/VButton;

    return-void
.end method

.method public static synthetic m(Ll/y7x;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/y7x;->K0(Landroid/view/View;)V

    return-void
.end method

.method public static bridge synthetic m0(Ll/y7x;Lv/VButton;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/y7x;->B:Lv/VButton;

    return-void
.end method

.method public static synthetic n(Landroid/view/View;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static bridge synthetic n0(Ll/y7x;Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/y7x;->X:Z

    return-void
.end method

.method public static bridge synthetic o0(Ll/y7x;Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/y7x;->W:Z

    return-void
.end method

.method public static synthetic p(Ll/y7x;Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/y7x;->J0(Lcom/p1/mobile/putong/data/User;)V

    return-void
.end method

.method public static bridge synthetic p0(Ll/y7x;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/y7x;->W0()V

    return-void
.end method

.method public static synthetic q(Ll/y7x;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/y7x;->I0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic s(Ll/y7x;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/y7x;->E0()V

    return-void
.end method

.method public static synthetic u(Ll/y7x;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/y7x;->G0(Landroid/view/View;)V

    return-void
.end method

.method public static bridge synthetic v(Ll/y7x;)Lv/VButton_FakeShadow;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/y7x;->x:Lv/VButton_FakeShadow;

    return-object p0
.end method

.method public static bridge synthetic w(Ll/y7x;)Lv/VButton_FakeShadow;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/y7x;->w:Lv/VButton_FakeShadow;

    return-object p0
.end method

.method public static bridge synthetic x(Ll/y7x;Landroid/view/View;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/y7x;->c:Landroid/view/View;

    return-void
.end method

.method public static bridge synthetic y(Ll/y7x;Landroid/view/View;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/y7x;->d:Landroid/view/View;

    return-void
.end method

.method public static bridge synthetic z(Ll/y7x;Lv/VButton_FakeShadow;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/y7x;->x:Lv/VButton_FakeShadow;

    return-void
.end method


# virtual methods
.method public final synthetic A0(Ll/syf0;)V
    .locals 2

    .line 1
    new-instance v0, Ll/y7x$c;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/y7x$c;-><init>(Ll/y7x;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1, v0}, Ll/syf0;->a(Ll/gzf0;)Ll/syf0;

    .line 7
    .line 8
    .line 9
    const-wide/high16 v0, 0x3ff0000000000000L    # 1.0

    .line 10
    .line 11
    invoke-virtual {p1, v0, v1}, Ll/syf0;->o(D)Ll/syf0;

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/y7x;->P:Lcom/p1/mobile/putong/core/ui/match/MatchAct;

    .line 2
    .line 3
    return-object p0
.end method

.method public final synthetic H0(Landroid/view/View$OnClickListener;Landroid/widget/TextView;ILandroid/view/KeyEvent;)Z
    .locals 1

    .line 1
    sget-object p2, Ll/qt4;->e:Ll/jxd0;

    .line 2
    .line 3
    invoke-virtual {p2}, Ll/azd0;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p2

    .line 7
    check-cast p2, Ljava/lang/Boolean;

    .line 8
    .line 9
    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    .line 10
    .line 11
    .line 12
    move-result p2

    .line 13
    if-eqz p2, :cond_3

    .line 14
    .line 15
    iget-object p2, p0, Ll/y7x;->H:Lv/VEditText;

    .line 16
    .line 17
    invoke-virtual {p2}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 18
    .line 19
    .line 20
    move-result-object p2

    .line 21
    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object p2

    .line 25
    invoke-virtual {p2}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object p2

    .line 29
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 30
    .line 31
    .line 32
    move-result p2

    .line 33
    const/4 v0, 0x1

    .line 34
    if-eqz p2, :cond_0

    .line 35
    .line 36
    return v0

    .line 37
    :cond_0
    const/4 p2, 0x4

    .line 38
    if-eq p3, p2, :cond_1

    .line 39
    .line 40
    const/4 p2, 0x6

    .line 41
    if-eq p3, p2, :cond_1

    .line 42
    .line 43
    invoke-static {p4}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 44
    .line 45
    .line 46
    move-result p2

    .line 47
    if-eqz p2, :cond_2

    .line 48
    .line 49
    const/16 p2, 0x42

    .line 50
    .line 51
    invoke-virtual {p4}, Landroid/view/KeyEvent;->getKeyCode()I

    .line 52
    .line 53
    .line 54
    move-result p3

    .line 55
    if-ne p2, p3, :cond_2

    .line 56
    .line 57
    invoke-virtual {p4}, Landroid/view/KeyEvent;->getAction()I

    .line 58
    .line 59
    .line 60
    move-result p2

    .line 61
    if-nez p2, :cond_2

    .line 62
    .line 63
    :cond_1
    iget-object p0, p0, Ll/y7x;->I:Lv/VText;

    .line 64
    .line 65
    invoke-interface {p1, p0}, Landroid/view/View$OnClickListener;->onClick(Landroid/view/View;)V

    .line 66
    .line 67
    .line 68
    :cond_2
    return v0

    .line 69
    :cond_3
    const/4 p0, 0x0

    .line 70
    return p0
.end method

.method public final synthetic J0(Lcom/p1/mobile/putong/data/User;)V
    .locals 2

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/ui/match/a;->w()Lcom/p1/mobile/putong/core/ui/match/a;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0}, Ll/y7x;->r0()Lcom/p1/mobile/putong/core/ui/match/MatchAct;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-virtual {v0, v1, p1}, Lcom/p1/mobile/putong/core/ui/match/a;->z(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;)V

    .line 10
    .line 11
    .line 12
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 13
    .line 14
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->P1:Ll/e59;

    .line 15
    .line 16
    iget-object p1, p1, Ll/e59;->R:Lrx/subjects/b;

    .line 17
    .line 18
    sget-object v0, Ll/uxj0;->a:Ll/uxj0;

    .line 19
    .line 20
    invoke-virtual {p1, v0}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p0}, Ll/y7x;->r0()Lcom/p1/mobile/putong/core/ui/match/MatchAct;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public final synthetic M0(Landroid/view/View;)V
    .locals 2

    .line 1
    invoke-static {}, Ll/gra;->S1()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/y7x;->r0()Lcom/p1/mobile/putong/core/ui/match/MatchAct;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/match/MatchAct;->pageId()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    iget-object v0, p0, Ll/y7x;->Q:Ll/h7x;

    .line 16
    .line 17
    invoke-virtual {p0}, Ll/y7x;->r0()Lcom/p1/mobile/putong/core/ui/match/MatchAct;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    iget-object v1, v1, Lcom/p1/mobile/putong/core/ui/match/MatchAct;->e:Ljava/lang/String;

    .line 22
    .line 23
    invoke-virtual {v0, v1}, Ll/k8x;->p0(Ljava/lang/String;)Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    const-string v1, "match_source"

    .line 28
    .line 29
    invoke-static {v1, v0}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    filled-new-array {v0}, [Ll/sfj0$a;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    const-string v1, "e_matched_later"

    .line 38
    .line 39
    invoke-static {v1, p1, v0}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 40
    .line 41
    .line 42
    :cond_0
    iget-object p0, p0, Ll/y7x;->Q:Ll/h7x;

    .line 43
    .line 44
    invoke-virtual {p0}, Ll/h7x;->h1()V

    .line 45
    .line 46
    .line 47
    return-void
.end method

.method public final synthetic N0(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/y7x;->Q:Ll/h7x;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/h7x;->j1()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic O0(Lv/VText;I)V
    .locals 4

    .line 1
    invoke-virtual {p1}, Landroid/widget/TextView;->getLineCount()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x4

    .line 6
    if-ge v0, v1, :cond_0

    .line 7
    .line 8
    goto :goto_0

    .line 9
    :cond_0
    invoke-virtual {p1}, Landroid/widget/TextView;->getLayout()Landroid/text/Layout;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    const/4 v1, 0x2

    .line 14
    invoke-virtual {v0, v1}, Landroid/text/Layout;->getLineEnd(I)I

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    invoke-virtual {p0}, Ll/y7x;->r0()Lcom/p1/mobile/putong/core/ui/match/MatchAct;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    invoke-virtual {p0, p2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    const-string p2, "%s"

    .line 27
    .line 28
    invoke-virtual {p0, p2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 29
    .line 30
    .line 31
    move-result v2

    .line 32
    if-nez v2, :cond_1

    .line 33
    .line 34
    :goto_0
    return-void

    .line 35
    :cond_1
    invoke-virtual {p0, p2}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    .line 36
    .line 37
    .line 38
    move-result p2

    .line 39
    add-int/2addr p2, v1

    .line 40
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    .line 41
    .line 42
    .line 43
    move-result v1

    .line 44
    invoke-virtual {p0, p2, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    add-int/lit8 p2, v0, -0x3

    .line 49
    .line 50
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    .line 51
    .line 52
    .line 53
    move-result v1

    .line 54
    sub-int/2addr p2, v1

    .line 55
    const-string v1, "..."

    .line 56
    .line 57
    const/4 v2, 0x0

    .line 58
    if-gez p2, :cond_2

    .line 59
    .line 60
    new-instance p2, Ljava/lang/StringBuilder;

    .line 61
    .line 62
    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    .line 63
    .line 64
    .line 65
    invoke-virtual {p1}, Landroidx/appcompat/widget/AppCompatTextView;->getText()Ljava/lang/CharSequence;

    .line 66
    .line 67
    .line 68
    move-result-object v3

    .line 69
    invoke-interface {v3}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 70
    .line 71
    .line 72
    move-result-object v3

    .line 73
    add-int/lit8 v0, v0, -0x1

    .line 74
    .line 75
    invoke-virtual {v3, v2, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 76
    .line 77
    .line 78
    move-result-object v0

    .line 79
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 80
    .line 81
    .line 82
    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 83
    .line 84
    .line 85
    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 86
    .line 87
    .line 88
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 89
    .line 90
    .line 91
    move-result-object p0

    .line 92
    goto :goto_1

    .line 93
    :cond_2
    new-instance v0, Ljava/lang/StringBuilder;

    .line 94
    .line 95
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 96
    .line 97
    .line 98
    invoke-virtual {p1}, Landroidx/appcompat/widget/AppCompatTextView;->getText()Ljava/lang/CharSequence;

    .line 99
    .line 100
    .line 101
    move-result-object v3

    .line 102
    invoke-interface {v3}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 103
    .line 104
    .line 105
    move-result-object v3

    .line 106
    invoke-virtual {v3, v2, p2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 107
    .line 108
    .line 109
    move-result-object p2

    .line 110
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 111
    .line 112
    .line 113
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 114
    .line 115
    .line 116
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 117
    .line 118
    .line 119
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 120
    .line 121
    .line 122
    move-result-object p0

    .line 123
    :goto_1
    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 124
    .line 125
    .line 126
    return-void
.end method

.method public P0()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/y7x;->H:Lv/VEditText;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setHorizontallyScrolling(Z)V

    .line 5
    .line 6
    .line 7
    iget-object p0, p0, Ll/y7x;->H:Lv/VEditText;

    .line 8
    .line 9
    const/4 v0, 0x4

    .line 10
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setImeOptions(I)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public Q0()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/y7x;->x:Lv/VButton_FakeShadow;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-virtual {p0, v0}, Landroid/view/View;->setClickable(Z)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public R0(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/User;ILjava/util/ArrayList;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/data/User;",
            "Lcom/p1/mobile/putong/data/User;",
            "I",
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    if-eqz p1, :cond_d

    .line 2
    .line 3
    if-nez p2, :cond_0

    .line 4
    .line 5
    goto/16 :goto_3

    .line 6
    .line 7
    :cond_0
    iget-boolean v0, p0, Ll/y7x;->Y:Z

    .line 8
    .line 9
    const/4 v1, 0x0

    .line 10
    if-eqz v0, :cond_2

    .line 11
    .line 12
    iget-object v0, p2, Lcom/p1/mobile/putong/data/User;->localRelationship:Lcom/p1/mobile/putong/data/Relationship;

    .line 13
    .line 14
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-eqz v0, :cond_2

    .line 19
    .line 20
    iput-boolean v1, p0, Ll/y7x;->Y:Z

    .line 21
    .line 22
    iget-object v0, p2, Lcom/p1/mobile/putong/data/User;->localRelationship:Lcom/p1/mobile/putong/data/Relationship;

    .line 23
    .line 24
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Relationship;->status:Ljava/util/List;

    .line 25
    .line 26
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    iget-object v2, p2, Lcom/p1/mobile/putong/data/User;->localRelationship:Lcom/p1/mobile/putong/data/Relationship;

    .line 31
    .line 32
    if-lez v0, :cond_1

    .line 33
    .line 34
    iget-object v0, v2, Lcom/p1/mobile/putong/data/Relationship;->status:Ljava/util/List;

    .line 35
    .line 36
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    check-cast v0, Lcom/p1/mobile/putong/data/MatchFrom;

    .line 41
    .line 42
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    iput-object v0, p0, Ll/y7x;->Z:Ljava/lang/String;

    .line 47
    .line 48
    goto :goto_0

    .line 49
    :cond_1
    iget-object v0, v2, Lcom/p1/mobile/putong/data/Relationship;->state:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 50
    .line 51
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    iput-object v0, p0, Ll/y7x;->Z:Ljava/lang/String;

    .line 56
    .line 57
    :cond_2
    :goto_0
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 58
    .line 59
    iget-object v2, p0, Ll/y7x;->h:Lv/VDraweeView;

    .line 60
    .line 61
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 62
    .line 63
    .line 64
    move-result-object p1

    .line 65
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/Picture;->profileMiddle()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 66
    .line 67
    .line 68
    move-result-object p1

    .line 69
    invoke-virtual {v0, v2, p1, v1}, Ll/fsb0;->J0(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;Z)V

    .line 70
    .line 71
    .line 72
    sget-object p1, Ll/uqb0;->G:Ll/fsb0;

    .line 73
    .line 74
    iget-object v0, p0, Ll/y7x;->j:Lv/VDraweeView;

    .line 75
    .line 76
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 77
    .line 78
    .line 79
    move-result-object v2

    .line 80
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/Picture;->profileMiddle()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 81
    .line 82
    .line 83
    move-result-object v2

    .line 84
    invoke-virtual {p1, v0, v2, v1}, Ll/fsb0;->J0(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;Z)V

    .line 85
    .line 86
    .line 87
    const/16 p1, 0xf

    .line 88
    .line 89
    if-ne p3, p1, :cond_3

    .line 90
    .line 91
    iget-object p0, p0, Ll/y7x;->t:Lv/VText_AutoFit;

    .line 92
    .line 93
    sget p1, Lcom/p1/mobile/putong/core/R$string;->R1:I

    .line 94
    .line 95
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(I)V

    .line 96
    .line 97
    .line 98
    return-void

    .line 99
    :cond_3
    if-eqz p3, :cond_c

    .line 100
    .line 101
    const/16 p1, 0xc

    .line 102
    .line 103
    if-eq p3, p1, :cond_c

    .line 104
    .line 105
    const/16 p1, 0xb

    .line 106
    .line 107
    if-eq p3, p1, :cond_c

    .line 108
    .line 109
    const/16 p1, 0xd

    .line 110
    .line 111
    if-eq p3, p1, :cond_c

    .line 112
    .line 113
    const/16 p1, 0x27

    .line 114
    .line 115
    if-eq p3, p1, :cond_c

    .line 116
    .line 117
    const/16 p1, 0x25

    .line 118
    .line 119
    if-eq p3, p1, :cond_c

    .line 120
    .line 121
    const/16 p1, 0x26

    .line 122
    .line 123
    if-eq p3, p1, :cond_c

    .line 124
    .line 125
    const/16 p1, 0xa

    .line 126
    .line 127
    if-eq p3, p1, :cond_c

    .line 128
    .line 129
    const/16 p1, 0x2d

    .line 130
    .line 131
    if-eq p3, p1, :cond_c

    .line 132
    .line 133
    const/16 p1, 0x2f

    .line 134
    .line 135
    if-eq p3, p1, :cond_c

    .line 136
    .line 137
    const/16 p1, 0x24

    .line 138
    .line 139
    if-ne p3, p1, :cond_4

    .line 140
    .line 141
    goto/16 :goto_2

    .line 142
    .line 143
    :cond_4
    const/4 p1, 0x1

    .line 144
    if-ne p3, p1, :cond_6

    .line 145
    .line 146
    iget-object p1, p0, Ll/y7x;->t:Lv/VText_AutoFit;

    .line 147
    .line 148
    invoke-virtual {p0}, Ll/y7x;->r0()Lcom/p1/mobile/putong/core/ui/match/MatchAct;

    .line 149
    .line 150
    .line 151
    move-result-object p3

    .line 152
    sget v0, Lcom/p1/mobile/putong/core/R$string;->Qm:I

    .line 153
    .line 154
    invoke-virtual {p4}, Ljava/util/ArrayList;->size()I

    .line 155
    .line 156
    .line 157
    move-result v2

    .line 158
    iget-object p2, p2, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 159
    .line 160
    if-lez v2, :cond_5

    .line 161
    .line 162
    new-instance v2, Ljava/lang/StringBuilder;

    .line 163
    .line 164
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 165
    .line 166
    .line 167
    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 168
    .line 169
    .line 170
    const-string p2, " ("

    .line 171
    .line 172
    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 173
    .line 174
    .line 175
    invoke-virtual {p4, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 176
    .line 177
    .line 178
    move-result-object p2

    .line 179
    check-cast p2, Ljava/lang/String;

    .line 180
    .line 181
    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 182
    .line 183
    .line 184
    const-string p2, ")"

    .line 185
    .line 186
    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 187
    .line 188
    .line 189
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 190
    .line 191
    .line 192
    move-result-object p2

    .line 193
    :cond_5
    filled-new-array {p2}, [Ljava/lang/Object;

    .line 194
    .line 195
    .line 196
    move-result-object p2

    .line 197
    invoke-virtual {p3, v0, p2}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 198
    .line 199
    .line 200
    move-result-object p2

    .line 201
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 202
    .line 203
    .line 204
    iget-object p1, p0, Ll/y7x;->t:Lv/VText_AutoFit;

    .line 205
    .line 206
    sget p2, Lcom/p1/mobile/putong/core/R$string;->Qm:I

    .line 207
    .line 208
    invoke-virtual {p0, p1, p2}, Ll/y7x;->U0(Lv/VText;I)V

    .line 209
    .line 210
    .line 211
    return-void

    .line 212
    :cond_6
    const/16 p1, 0x1a

    .line 213
    .line 214
    if-ne p3, p1, :cond_7

    .line 215
    .line 216
    iget-object p1, p0, Ll/y7x;->t:Lv/VText_AutoFit;

    .line 217
    .line 218
    invoke-virtual {p0}, Ll/y7x;->r0()Lcom/p1/mobile/putong/core/ui/match/MatchAct;

    .line 219
    .line 220
    .line 221
    move-result-object p3

    .line 222
    sget p4, Lcom/p1/mobile/putong/core/R$string;->ei:I

    .line 223
    .line 224
    iget-object p2, p2, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 225
    .line 226
    filled-new-array {p2}, [Ljava/lang/Object;

    .line 227
    .line 228
    .line 229
    move-result-object p2

    .line 230
    invoke-virtual {p3, p4, p2}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 231
    .line 232
    .line 233
    move-result-object p2

    .line 234
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 235
    .line 236
    .line 237
    iget-object p1, p0, Ll/y7x;->t:Lv/VText_AutoFit;

    .line 238
    .line 239
    sget p2, Lcom/p1/mobile/putong/core/R$string;->ei:I

    .line 240
    .line 241
    invoke-virtual {p0, p1, p2}, Ll/y7x;->U0(Lv/VText;I)V

    .line 242
    .line 243
    .line 244
    return-void

    .line 245
    :cond_7
    const/16 p1, 0x30

    .line 246
    .line 247
    if-eq p3, p1, :cond_b

    .line 248
    .line 249
    const/16 p1, 0x31

    .line 250
    .line 251
    if-ne p3, p1, :cond_8

    .line 252
    .line 253
    goto :goto_1

    .line 254
    :cond_8
    const/16 p1, 0x32

    .line 255
    .line 256
    if-ne p3, p1, :cond_9

    .line 257
    .line 258
    iget-object p1, p0, Ll/y7x;->t:Lv/VText_AutoFit;

    .line 259
    .line 260
    invoke-virtual {p0}, Ll/y7x;->r0()Lcom/p1/mobile/putong/core/ui/match/MatchAct;

    .line 261
    .line 262
    .line 263
    move-result-object p3

    .line 264
    sget p4, Lcom/p1/mobile/putong/core/R$string;->ug:I

    .line 265
    .line 266
    iget-object p2, p2, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 267
    .line 268
    filled-new-array {p2}, [Ljava/lang/Object;

    .line 269
    .line 270
    .line 271
    move-result-object p2

    .line 272
    invoke-virtual {p3, p4, p2}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 273
    .line 274
    .line 275
    move-result-object p2

    .line 276
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 277
    .line 278
    .line 279
    iget-object p1, p0, Ll/y7x;->t:Lv/VText_AutoFit;

    .line 280
    .line 281
    sget p2, Lcom/p1/mobile/putong/core/R$string;->ug:I

    .line 282
    .line 283
    invoke-virtual {p0, p1, p2}, Ll/y7x;->U0(Lv/VText;I)V

    .line 284
    .line 285
    .line 286
    return-void

    .line 287
    :cond_9
    const/16 p1, 0x33

    .line 288
    .line 289
    if-ne p3, p1, :cond_a

    .line 290
    .line 291
    iget-object p1, p0, Ll/y7x;->t:Lv/VText_AutoFit;

    .line 292
    .line 293
    invoke-virtual {p0}, Ll/y7x;->r0()Lcom/p1/mobile/putong/core/ui/match/MatchAct;

    .line 294
    .line 295
    .line 296
    move-result-object p3

    .line 297
    sget p4, Lcom/p1/mobile/putong/core/R$string;->wg:I

    .line 298
    .line 299
    iget-object p2, p2, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 300
    .line 301
    filled-new-array {p2}, [Ljava/lang/Object;

    .line 302
    .line 303
    .line 304
    move-result-object p2

    .line 305
    invoke-virtual {p3, p4, p2}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 306
    .line 307
    .line 308
    move-result-object p2

    .line 309
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 310
    .line 311
    .line 312
    iget-object p1, p0, Ll/y7x;->t:Lv/VText_AutoFit;

    .line 313
    .line 314
    sget p2, Lcom/p1/mobile/putong/core/R$string;->wg:I

    .line 315
    .line 316
    invoke-virtual {p0, p1, p2}, Ll/y7x;->U0(Lv/VText;I)V

    .line 317
    .line 318
    .line 319
    :cond_a
    return-void

    .line 320
    :cond_b
    :goto_1
    iget-object p1, p0, Ll/y7x;->t:Lv/VText_AutoFit;

    .line 321
    .line 322
    invoke-virtual {p0}, Ll/y7x;->r0()Lcom/p1/mobile/putong/core/ui/match/MatchAct;

    .line 323
    .line 324
    .line 325
    move-result-object p3

    .line 326
    sget p4, Lcom/p1/mobile/putong/core/R$string;->uc:I

    .line 327
    .line 328
    iget-object p2, p2, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 329
    .line 330
    filled-new-array {p2}, [Ljava/lang/Object;

    .line 331
    .line 332
    .line 333
    move-result-object p2

    .line 334
    invoke-virtual {p3, p4, p2}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 335
    .line 336
    .line 337
    move-result-object p2

    .line 338
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 339
    .line 340
    .line 341
    iget-object p1, p0, Ll/y7x;->t:Lv/VText_AutoFit;

    .line 342
    .line 343
    sget p2, Lcom/p1/mobile/putong/core/R$string;->uc:I

    .line 344
    .line 345
    invoke-virtual {p0, p1, p2}, Ll/y7x;->U0(Lv/VText;I)V

    .line 346
    .line 347
    .line 348
    return-void

    .line 349
    :cond_c
    :goto_2
    iget-object p1, p0, Ll/y7x;->t:Lv/VText_AutoFit;

    .line 350
    .line 351
    invoke-virtual {p0}, Ll/y7x;->r0()Lcom/p1/mobile/putong/core/ui/match/MatchAct;

    .line 352
    .line 353
    .line 354
    move-result-object p3

    .line 355
    sget p4, Lcom/p1/mobile/putong/core/R$string;->ei:I

    .line 356
    .line 357
    iget-object p2, p2, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 358
    .line 359
    filled-new-array {p2}, [Ljava/lang/Object;

    .line 360
    .line 361
    .line 362
    move-result-object p2

    .line 363
    invoke-virtual {p3, p4, p2}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 364
    .line 365
    .line 366
    move-result-object p2

    .line 367
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 368
    .line 369
    .line 370
    iget-object p1, p0, Ll/y7x;->t:Lv/VText_AutoFit;

    .line 371
    .line 372
    sget p2, Lcom/p1/mobile/putong/core/R$string;->ei:I

    .line 373
    .line 374
    invoke-virtual {p0, p1, p2}, Ll/y7x;->U0(Lv/VText;I)V

    .line 375
    .line 376
    .line 377
    return-void

    .line 378
    :cond_d
    :goto_3
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 379
    .line 380
    .line 381
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 382
    .line 383
    .line 384
    invoke-virtual {p0}, Ll/y7x;->r0()Lcom/p1/mobile/putong/core/ui/match/MatchAct;

    .line 385
    .line 386
    .line 387
    move-result-object p0

    .line 388
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 389
    .line 390
    .line 391
    return-void
.end method

.method public final S0()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/y7x;->r0()Lcom/p1/mobile/putong/core/ui/match/MatchAct;

    .line 2
    .line 3
    .line 4
    invoke-static {}, Lcom/p1/mobile/android/app/Act;->globalLifeCycle_()Ljava/util/HashMap;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-virtual {p0}, Ll/y7x;->r0()Lcom/p1/mobile/putong/core/ui/match/MatchAct;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    invoke-virtual {v1}, Landroid/app/Activity;->getTaskId()I

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    check-cast v0, Ljava/util/ArrayList;

    .line 25
    .line 26
    if-nez v0, :cond_0

    .line 27
    .line 28
    iget-object p0, p0, Ll/y7x;->Q:Ll/h7x;

    .line 29
    .line 30
    invoke-virtual {p0}, Ll/h7x;->U0()V

    .line 31
    .line 32
    .line 33
    return-void

    .line 34
    :cond_0
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 35
    .line 36
    .line 37
    move-result v1

    .line 38
    if-lez v1, :cond_1

    .line 39
    .line 40
    const/4 v1, 0x0

    .line 41
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    check-cast v0, Lcom/p1/mobile/android/app/Act$r;

    .line 46
    .line 47
    iget-object v0, v0, Lcom/p1/mobile/android/app/Act$r;->a:Ljava/lang/ref/WeakReference;

    .line 48
    .line 49
    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    check-cast v0, Landroid/app/Activity;

    .line 54
    .line 55
    goto :goto_0

    .line 56
    :cond_1
    const/4 v0, 0x0

    .line 57
    :goto_0
    if-eqz v0, :cond_3

    .line 58
    .line 59
    invoke-virtual {v0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 60
    .line 61
    .line 62
    move-result-object v1

    .line 63
    if-eqz v1, :cond_3

    .line 64
    .line 65
    invoke-virtual {v0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 66
    .line 67
    .line 68
    move-result-object v1

    .line 69
    invoke-virtual {v1}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 70
    .line 71
    .line 72
    move-result-object v1

    .line 73
    if-eqz v1, :cond_3

    .line 74
    .line 75
    invoke-virtual {v0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 76
    .line 77
    .line 78
    move-result-object v1

    .line 79
    invoke-virtual {v1}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 80
    .line 81
    .line 82
    move-result-object v1

    .line 83
    invoke-virtual {v1}, Landroid/view/View;->getWidth()I

    .line 84
    .line 85
    .line 86
    move-result v1

    .line 87
    if-lez v1, :cond_3

    .line 88
    .line 89
    invoke-virtual {v0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 90
    .line 91
    .line 92
    move-result-object v1

    .line 93
    invoke-virtual {v1}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 94
    .line 95
    .line 96
    move-result-object v1

    .line 97
    invoke-virtual {v1}, Landroid/view/View;->getHeight()I

    .line 98
    .line 99
    .line 100
    move-result v1

    .line 101
    if-gtz v1, :cond_2

    .line 102
    .line 103
    goto :goto_1

    .line 104
    :cond_2
    invoke-virtual {p0}, Ll/y7x;->r0()Lcom/p1/mobile/putong/core/ui/match/MatchAct;

    .line 105
    .line 106
    .line 107
    move-result-object p0

    .line 108
    invoke-static {v0, p0}, Ll/qnp0;->Y0(Landroid/app/Activity;Landroid/app/Activity;)V

    .line 109
    .line 110
    .line 111
    return-void

    .line 112
    :cond_3
    :goto_1
    iget-object p0, p0, Ll/y7x;->Q:Ll/h7x;

    .line 113
    .line 114
    invoke-virtual {p0}, Ll/h7x;->U0()V

    .line 115
    .line 116
    .line 117
    return-void
.end method

.method public final T0()V
    .locals 3

    .line 1
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 10
    .line 11
    .line 12
    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    const/4 v2, -0x1

    .line 17
    sparse-switch v1, :sswitch_data_0

    .line 18
    .line 19
    .line 20
    goto :goto_0

    .line 21
    :sswitch_0
    const-string v1, "zh"

    .line 22
    .line 23
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-nez v0, :cond_0

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_0
    const/4 v2, 0x5

    .line 31
    goto :goto_0

    .line 32
    :sswitch_1
    const-string v1, "vi"

    .line 33
    .line 34
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 35
    .line 36
    .line 37
    move-result v0

    .line 38
    if-nez v0, :cond_1

    .line 39
    .line 40
    goto :goto_0

    .line 41
    :cond_1
    const/4 v2, 0x4

    .line 42
    goto :goto_0

    .line 43
    :sswitch_2
    const-string v1, "th"

    .line 44
    .line 45
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    if-nez v0, :cond_2

    .line 50
    .line 51
    goto :goto_0

    .line 52
    :cond_2
    const/4 v2, 0x3

    .line 53
    goto :goto_0

    .line 54
    :sswitch_3
    const-string v1, "ko"

    .line 55
    .line 56
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 57
    .line 58
    .line 59
    move-result v0

    .line 60
    if-nez v0, :cond_3

    .line 61
    .line 62
    goto :goto_0

    .line 63
    :cond_3
    const/4 v2, 0x2

    .line 64
    goto :goto_0

    .line 65
    :sswitch_4
    const-string v1, "ja"

    .line 66
    .line 67
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 68
    .line 69
    .line 70
    move-result v0

    .line 71
    if-nez v0, :cond_4

    .line 72
    .line 73
    goto :goto_0

    .line 74
    :cond_4
    const/4 v2, 0x1

    .line 75
    goto :goto_0

    .line 76
    :sswitch_5
    const-string v1, "in"

    .line 77
    .line 78
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 79
    .line 80
    .line 81
    move-result v0

    .line 82
    if-nez v0, :cond_5

    .line 83
    .line 84
    goto :goto_0

    .line 85
    :cond_5
    const/4 v2, 0x0

    .line 86
    :goto_0
    packed-switch v2, :pswitch_data_0

    .line 87
    .line 88
    .line 89
    sget v0, Ll/dbc0;->T9:I

    .line 90
    .line 91
    goto :goto_2

    .line 92
    :pswitch_0
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    .line 93
    .line 94
    .line 95
    move-result-object v0

    .line 96
    invoke-virtual {v0}, Ljava/util/Locale;->getCountry()Ljava/lang/String;

    .line 97
    .line 98
    .line 99
    move-result-object v0

    .line 100
    const-string v1, "TW"

    .line 101
    .line 102
    if-eq v0, v1, :cond_7

    .line 103
    .line 104
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    .line 105
    .line 106
    .line 107
    move-result-object v0

    .line 108
    invoke-virtual {v0}, Ljava/util/Locale;->getCountry()Ljava/lang/String;

    .line 109
    .line 110
    .line 111
    move-result-object v0

    .line 112
    const-string v1, "HK"

    .line 113
    .line 114
    if-eq v0, v1, :cond_7

    .line 115
    .line 116
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    .line 117
    .line 118
    .line 119
    move-result-object v0

    .line 120
    invoke-virtual {v0}, Ljava/util/Locale;->getCountry()Ljava/lang/String;

    .line 121
    .line 122
    .line 123
    move-result-object v0

    .line 124
    const-string v1, "MO"

    .line 125
    .line 126
    if-ne v0, v1, :cond_6

    .line 127
    .line 128
    goto :goto_1

    .line 129
    :cond_6
    sget v0, Ll/dbc0;->Z9:I

    .line 130
    .line 131
    goto :goto_2

    .line 132
    :cond_7
    :goto_1
    sget v0, Ll/dbc0;->aa:I

    .line 133
    .line 134
    goto :goto_2

    .line 135
    :pswitch_1
    sget v0, Ll/dbc0;->Y9:I

    .line 136
    .line 137
    goto :goto_2

    .line 138
    :pswitch_2
    sget v0, Ll/dbc0;->X9:I

    .line 139
    .line 140
    goto :goto_2

    .line 141
    :pswitch_3
    sget v0, Ll/dbc0;->W9:I

    .line 142
    .line 143
    goto :goto_2

    .line 144
    :pswitch_4
    sget v0, Ll/dbc0;->V9:I

    .line 145
    .line 146
    goto :goto_2

    .line 147
    :pswitch_5
    sget v0, Ll/dbc0;->U9:I

    .line 148
    .line 149
    :goto_2
    iget-object p0, p0, Ll/y7x;->l:Lv/VImage;

    .line 150
    .line 151
    invoke-virtual {p0, v0}, Landroidx/appcompat/widget/AppCompatImageView;->setBackgroundResource(I)V

    .line 152
    .line 153
    .line 154
    return-void

    .line 155
    :sswitch_data_0
    .sparse-switch
        0xd25 -> :sswitch_5
        0xd37 -> :sswitch_4
        0xd64 -> :sswitch_3
        0xe74 -> :sswitch_2
        0xeb3 -> :sswitch_1
        0xf2e -> :sswitch_0
    .end sparse-switch

    .line 156
    .line 157
    .line 158
    .line 159
    .line 160
    .line 161
    .line 162
    .line 163
    .line 164
    .line 165
    .line 166
    .line 167
    .line 168
    .line 169
    .line 170
    .line 171
    .line 172
    .line 173
    .line 174
    .line 175
    .line 176
    .line 177
    .line 178
    .line 179
    .line 180
    .line 181
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public final U0(Lv/VText;I)V
    .locals 1

    .line 1
    new-instance v0, Ll/l7x;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1, p2}, Ll/l7x;-><init>(Ll/y7x;Lv/VText;I)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1, v0}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public V0()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/y7x;->G:Landroid/widget/RelativeLayout;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Landroid/widget/RelativeLayout$LayoutParams;

    .line 8
    .line 9
    iget v1, p0, Ll/y7x;->T:I

    .line 10
    .line 11
    iput v1, v0, Landroid/widget/RelativeLayout$LayoutParams;->width:I

    .line 12
    .line 13
    iget v1, p0, Ll/y7x;->S:I

    .line 14
    .line 15
    iput v1, v0, Landroid/widget/RelativeLayout$LayoutParams;->bottomMargin:I

    .line 16
    .line 17
    iget-object v1, p0, Ll/y7x;->G:Landroid/widget/RelativeLayout;

    .line 18
    .line 19
    invoke-virtual {v1, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 20
    .line 21
    .line 22
    iget-object p0, p0, Ll/y7x;->G:Landroid/widget/RelativeLayout;

    .line 23
    .line 24
    sget v0, Ll/dbc0;->gs:I

    .line 25
    .line 26
    invoke-virtual {p0, v0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public final W0()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/y7x;->G:Landroid/widget/RelativeLayout;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Landroid/widget/RelativeLayout$LayoutParams;

    .line 8
    .line 9
    iget v1, p0, Ll/y7x;->U:I

    .line 10
    .line 11
    iput v1, v0, Landroid/widget/RelativeLayout$LayoutParams;->width:I

    .line 12
    .line 13
    iget-object v1, p0, Ll/y7x;->G:Landroid/widget/RelativeLayout;

    .line 14
    .line 15
    invoke-virtual {v1, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 16
    .line 17
    .line 18
    iget-object p0, p0, Ll/y7x;->G:Landroid/widget/RelativeLayout;

    .line 19
    .line 20
    sget v0, Ll/c9c0;->c2:I

    .line 21
    .line 22
    invoke-virtual {p0, v0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public X0()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/y7x;->J:Lv/VScroll_Horizontal;

    .line 2
    .line 3
    invoke-static {v0}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    iget-boolean v0, p0, Ll/y7x;->I0:Z

    .line 10
    .line 11
    const-string v1, "is_label"

    .line 12
    .line 13
    const-string v2, "e_match_label"

    .line 14
    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    invoke-virtual {p0}, Ll/y7x;->r0()Lcom/p1/mobile/putong/core/ui/match/MatchAct;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/match/MatchAct;->pageId()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    const-string v0, "1"

    .line 26
    .line 27
    invoke-static {v1, v0}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    filled-new-array {v0}, [Ll/sfj0$a;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    invoke-static {v2, p0, v0}, Ll/sfj0;->h(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 36
    .line 37
    .line 38
    return-void

    .line 39
    :cond_0
    invoke-virtual {p0}, Ll/y7x;->r0()Lcom/p1/mobile/putong/core/ui/match/MatchAct;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/match/MatchAct;->pageId()Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    const-string v0, "0"

    .line 48
    .line 49
    invoke-static {v1, v0}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    filled-new-array {v0}, [Ll/sfj0$a;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    invoke-static {v2, p0, v0}, Ll/sfj0;->h(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 58
    .line 59
    .line 60
    :cond_1
    return-void
.end method

.method public bridge synthetic act()Lcom/p1/mobile/android/app/Act;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/y7x;->r0()Lcom/p1/mobile/putong/core/ui/match/MatchAct;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public enterAnimation()Landroid/animation/Animator;
    .locals 32

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    invoke-static {}, Ll/izf0;->h()Ll/izf0;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-virtual {v1}, Ll/sr2;->c()Ll/syf0;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    new-instance v2, Ll/uyf0;

    .line 12
    .line 13
    const-wide v3, 0x4072c00000000000L    # 300.0

    .line 14
    .line 15
    .line 16
    .line 17
    .line 18
    const-wide/high16 v5, 0x402a000000000000L    # 13.0

    .line 19
    .line 20
    invoke-direct {v2, v3, v4, v5, v6}, Ll/uyf0;-><init>(DD)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {v1, v2}, Ll/syf0;->p(Ll/uyf0;)Ll/syf0;

    .line 24
    .line 25
    .line 26
    invoke-virtual {v0}, Ll/y7x;->r0()Lcom/p1/mobile/putong/core/ui/match/MatchAct;

    .line 27
    .line 28
    .line 29
    move-result-object v2

    .line 30
    new-instance v3, Ll/s7x;

    .line 31
    .line 32
    invoke-direct {v3, v0, v1}, Ll/s7x;-><init>(Ll/y7x;Ll/syf0;)V

    .line 33
    .line 34
    .line 35
    const-wide/16 v8, 0x258

    .line 36
    .line 37
    invoke-virtual {v2, v3, v8, v9}, Lcom/p1/mobile/android/app/Act;->postDelayed(Ljava/lang/Runnable;J)V

    .line 38
    .line 39
    .line 40
    iget-object v4, v0, Ll/y7x;->N:Lv/VText;

    .line 41
    .line 42
    sget-object v11, Landroid/view/View;->ALPHA:Landroid/util/Property;

    .line 43
    .line 44
    const/4 v1, 0x1

    .line 45
    move-object v5, v11

    .line 46
    new-array v11, v1, [F

    .line 47
    .line 48
    const/4 v2, 0x0

    .line 49
    const/high16 v3, 0x3f800000    # 1.0f

    .line 50
    .line 51
    aput v3, v11, v2

    .line 52
    .line 53
    const-wide/16 v6, 0x0

    .line 54
    .line 55
    const/4 v10, 0x0

    .line 56
    invoke-static/range {v4 .. v11}, Ll/gt0;->l(Landroid/view/View;Landroid/util/Property;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 57
    .line 58
    .line 59
    move-result-object v18

    .line 60
    move-object v11, v5

    .line 61
    iget-object v4, v0, Ll/y7x;->m:Lcom/p1/mobile/putong/core/ui/GradientBgButton;

    .line 62
    .line 63
    new-array v11, v1, [F

    .line 64
    .line 65
    aput v3, v11, v2

    .line 66
    .line 67
    invoke-static/range {v4 .. v11}, Ll/gt0;->l(Landroid/view/View;Landroid/util/Property;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 68
    .line 69
    .line 70
    move-result-object v19

    .line 71
    move-object v11, v5

    .line 72
    iget-object v10, v0, Ll/y7x;->h:Lv/VDraweeView;

    .line 73
    .line 74
    new-array v4, v1, [F

    .line 75
    .line 76
    aput v3, v4, v2

    .line 77
    .line 78
    const-wide/16 v12, 0x0

    .line 79
    .line 80
    const-wide/16 v14, 0x1e0

    .line 81
    .line 82
    const/16 v16, 0x0

    .line 83
    .line 84
    move-object/from16 v17, v4

    .line 85
    .line 86
    invoke-static/range {v10 .. v17}, Ll/gt0;->l(Landroid/view/View;Landroid/util/Property;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 87
    .line 88
    .line 89
    move-result-object v20

    .line 90
    iget-object v10, v0, Ll/y7x;->j:Lv/VDraweeView;

    .line 91
    .line 92
    new-array v4, v1, [F

    .line 93
    .line 94
    aput v3, v4, v2

    .line 95
    .line 96
    move-object/from16 v17, v4

    .line 97
    .line 98
    invoke-static/range {v10 .. v17}, Ll/gt0;->l(Landroid/view/View;Landroid/util/Property;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 99
    .line 100
    .line 101
    move-result-object v21

    .line 102
    iget-object v4, v0, Ll/y7x;->h:Lv/VDraweeView;

    .line 103
    .line 104
    sget-object v23, Ll/gt0;->i:Landroid/util/Property;

    .line 105
    .line 106
    new-instance v5, Landroid/view/animation/OvershootInterpolator;

    .line 107
    .line 108
    const/high16 v6, 0x40000000    # 2.0f

    .line 109
    .line 110
    invoke-direct {v5, v6}, Landroid/view/animation/OvershootInterpolator;-><init>(F)V

    .line 111
    .line 112
    .line 113
    new-array v7, v1, [F

    .line 114
    .line 115
    aput v3, v7, v2

    .line 116
    .line 117
    const-wide/16 v24, 0x0

    .line 118
    .line 119
    const-wide/16 v26, 0x320

    .line 120
    .line 121
    move-object/from16 v22, v4

    .line 122
    .line 123
    move-object/from16 v28, v5

    .line 124
    .line 125
    move-object/from16 v29, v7

    .line 126
    .line 127
    invoke-static/range {v22 .. v29}, Ll/gt0;->l(Landroid/view/View;Landroid/util/Property;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 128
    .line 129
    .line 130
    move-result-object v22

    .line 131
    iget-object v4, v0, Ll/y7x;->j:Lv/VDraweeView;

    .line 132
    .line 133
    sget-object v24, Ll/gt0;->i:Landroid/util/Property;

    .line 134
    .line 135
    new-instance v5, Landroid/view/animation/OvershootInterpolator;

    .line 136
    .line 137
    invoke-direct {v5, v6}, Landroid/view/animation/OvershootInterpolator;-><init>(F)V

    .line 138
    .line 139
    .line 140
    new-array v7, v1, [F

    .line 141
    .line 142
    aput v3, v7, v2

    .line 143
    .line 144
    const-wide/16 v25, 0x0

    .line 145
    .line 146
    const-wide/16 v27, 0x320

    .line 147
    .line 148
    move-object/from16 v23, v4

    .line 149
    .line 150
    move-object/from16 v29, v5

    .line 151
    .line 152
    move-object/from16 v30, v7

    .line 153
    .line 154
    invoke-static/range {v23 .. v30}, Ll/gt0;->l(Landroid/view/View;Landroid/util/Property;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 155
    .line 156
    .line 157
    move-result-object v23

    .line 158
    iget-object v4, v0, Ll/y7x;->m:Lcom/p1/mobile/putong/core/ui/GradientBgButton;

    .line 159
    .line 160
    sget-object v25, Ll/gt0;->i:Landroid/util/Property;

    .line 161
    .line 162
    new-instance v5, Landroid/view/animation/OvershootInterpolator;

    .line 163
    .line 164
    invoke-direct {v5, v6}, Landroid/view/animation/OvershootInterpolator;-><init>(F)V

    .line 165
    .line 166
    .line 167
    new-array v6, v1, [F

    .line 168
    .line 169
    aput v3, v6, v2

    .line 170
    .line 171
    const-wide/16 v26, 0xc8

    .line 172
    .line 173
    const-wide/16 v28, 0x320

    .line 174
    .line 175
    move-object/from16 v24, v4

    .line 176
    .line 177
    move-object/from16 v30, v5

    .line 178
    .line 179
    move-object/from16 v31, v6

    .line 180
    .line 181
    invoke-static/range {v24 .. v31}, Ll/gt0;->l(Landroid/view/View;Landroid/util/Property;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 182
    .line 183
    .line 184
    move-result-object v24

    .line 185
    iget-object v10, v0, Ll/y7x;->t:Lv/VText_AutoFit;

    .line 186
    .line 187
    new-array v4, v1, [F

    .line 188
    .line 189
    aput v3, v4, v2

    .line 190
    .line 191
    move-wide v12, v14

    .line 192
    const-wide/16 v14, 0x78

    .line 193
    .line 194
    move-object/from16 v17, v4

    .line 195
    .line 196
    invoke-static/range {v10 .. v17}, Ll/gt0;->l(Landroid/view/View;Landroid/util/Property;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 197
    .line 198
    .line 199
    move-result-object v3

    .line 200
    move-object/from16 v25, v11

    .line 201
    .line 202
    iget-object v4, v0, Ll/y7x;->y:Lv/VButton;

    .line 203
    .line 204
    new-instance v10, Landroid/view/animation/OvershootInterpolator;

    .line 205
    .line 206
    const v5, 0x3f99999a    # 1.2f

    .line 207
    .line 208
    .line 209
    invoke-direct {v10, v5}, Landroid/view/animation/OvershootInterpolator;-><init>(F)V

    .line 210
    .line 211
    .line 212
    new-array v11, v1, [F

    .line 213
    .line 214
    const/4 v1, 0x0

    .line 215
    aput v1, v11, v2

    .line 216
    .line 217
    const-string v5, "translationY"

    .line 218
    .line 219
    move-wide v6, v8

    .line 220
    const-wide/16 v8, 0xc8

    .line 221
    .line 222
    invoke-static/range {v4 .. v11}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 223
    .line 224
    .line 225
    move-result-object v1

    .line 226
    move-object/from16 v12, v18

    .line 227
    .line 228
    move-object/from16 v13, v19

    .line 229
    .line 230
    move-object/from16 v14, v20

    .line 231
    .line 232
    move-object/from16 v15, v21

    .line 233
    .line 234
    move-object/from16 v16, v22

    .line 235
    .line 236
    move-object/from16 v17, v23

    .line 237
    .line 238
    move-object/from16 v18, v24

    .line 239
    .line 240
    move-object/from16 v20, v1

    .line 241
    .line 242
    move-object/from16 v19, v3

    .line 243
    .line 244
    filled-new-array/range {v12 .. v20}, [Landroid/animation/Animator;

    .line 245
    .line 246
    .line 247
    move-result-object v1

    .line 248
    invoke-static {v1}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 249
    .line 250
    .line 251
    move-result-object v1

    .line 252
    iget-object v3, v0, Ll/y7x;->Q:Ll/h7x;

    .line 253
    .line 254
    invoke-virtual {v3}, Ll/h7x;->S0()I

    .line 255
    .line 256
    .line 257
    move-result v3

    .line 258
    const/16 v4, 0xf

    .line 259
    .line 260
    if-ne v3, v4, :cond_0

    .line 261
    .line 262
    iget-object v3, v0, Ll/y7x;->i:Lv/VImage;

    .line 263
    .line 264
    invoke-virtual {v3, v2}, Landroid/view/View;->setVisibility(I)V

    .line 265
    .line 266
    .line 267
    iget-object v3, v0, Ll/y7x;->k:Lv/VImage;

    .line 268
    .line 269
    invoke-virtual {v3, v2}, Landroid/view/View;->setVisibility(I)V

    .line 270
    .line 271
    .line 272
    iget-object v4, v0, Ll/y7x;->i:Lv/VImage;

    .line 273
    .line 274
    sget-object v5, Ll/gt0;->i:Landroid/util/Property;

    .line 275
    .line 276
    const/4 v2, 0x2

    .line 277
    new-array v11, v2, [F

    .line 278
    .line 279
    fill-array-data v11, :array_0

    .line 280
    .line 281
    .line 282
    const-wide/16 v6, 0x0

    .line 283
    .line 284
    const-wide/16 v8, 0x320

    .line 285
    .line 286
    const/4 v10, 0x0

    .line 287
    invoke-static/range {v4 .. v11}, Ll/gt0;->l(Landroid/view/View;Landroid/util/Property;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 288
    .line 289
    .line 290
    move-result-object v3

    .line 291
    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 292
    .line 293
    .line 294
    iget-object v10, v0, Ll/y7x;->i:Lv/VImage;

    .line 295
    .line 296
    new-array v3, v2, [F

    .line 297
    .line 298
    fill-array-data v3, :array_1

    .line 299
    .line 300
    .line 301
    const-wide/16 v12, 0x0

    .line 302
    .line 303
    const-wide/16 v14, 0x320

    .line 304
    .line 305
    const/16 v16, 0x0

    .line 306
    .line 307
    move-object/from16 v17, v3

    .line 308
    .line 309
    move-object/from16 v11, v25

    .line 310
    .line 311
    invoke-static/range {v10 .. v17}, Ll/gt0;->l(Landroid/view/View;Landroid/util/Property;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 312
    .line 313
    .line 314
    move-result-object v3

    .line 315
    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 316
    .line 317
    .line 318
    iget-object v12, v0, Ll/y7x;->k:Lv/VImage;

    .line 319
    .line 320
    sget-object v13, Ll/gt0;->i:Landroid/util/Property;

    .line 321
    .line 322
    new-array v3, v2, [F

    .line 323
    .line 324
    fill-array-data v3, :array_2

    .line 325
    .line 326
    .line 327
    const-wide/16 v14, 0x0

    .line 328
    .line 329
    const-wide/16 v16, 0x320

    .line 330
    .line 331
    const/16 v18, 0x0

    .line 332
    .line 333
    move-object/from16 v19, v3

    .line 334
    .line 335
    invoke-static/range {v12 .. v19}, Ll/gt0;->l(Landroid/view/View;Landroid/util/Property;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 336
    .line 337
    .line 338
    move-result-object v3

    .line 339
    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 340
    .line 341
    .line 342
    iget-object v10, v0, Ll/y7x;->k:Lv/VImage;

    .line 343
    .line 344
    new-array v2, v2, [F

    .line 345
    .line 346
    fill-array-data v2, :array_3

    .line 347
    .line 348
    .line 349
    const-wide/16 v12, 0x0

    .line 350
    .line 351
    const-wide/16 v14, 0x320

    .line 352
    .line 353
    const/16 v16, 0x0

    .line 354
    .line 355
    move-object/from16 v17, v2

    .line 356
    .line 357
    invoke-static/range {v10 .. v17}, Ll/gt0;->l(Landroid/view/View;Landroid/util/Property;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 358
    .line 359
    .line 360
    move-result-object v2

    .line 361
    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 362
    .line 363
    .line 364
    :cond_0
    iget-object v0, v0, Ll/y7x;->h:Lv/VDraweeView;

    .line 365
    .line 366
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    .line 367
    .line 368
    .line 369
    move-result v2

    .line 370
    new-array v2, v2, [Landroid/animation/Animator;

    .line 371
    .line 372
    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 373
    .line 374
    .line 375
    move-result-object v1

    .line 376
    check-cast v1, [Landroid/animation/Animator;

    .line 377
    .line 378
    invoke-static {v1}, Ll/gt0;->z([Landroid/animation/Animator;)Landroid/animation/Animator;

    .line 379
    .line 380
    .line 381
    move-result-object v1

    .line 382
    invoke-static {v0, v1}, Ll/gt0;->b(Landroid/view/View;Landroid/animation/Animator;)Landroid/animation/Animator;

    .line 383
    .line 384
    .line 385
    move-result-object v0

    .line 386
    return-object v0

    .line 387
    :array_0
    .array-data 4
        0x3f000000    # 0.5f
        0x3f800000    # 1.0f
    .end array-data

    .line 388
    .line 389
    .line 390
    .line 391
    .line 392
    .line 393
    .line 394
    .line 395
    :array_1
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data

    .line 396
    .line 397
    .line 398
    .line 399
    .line 400
    .line 401
    .line 402
    .line 403
    :array_2
    .array-data 4
        0x3f000000    # 0.5f
        0x3f800000    # 1.0f
    .end array-data

    .line 404
    .line 405
    .line 406
    .line 407
    .line 408
    .line 409
    .line 410
    .line 411
    :array_3
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public exitAnimation()Landroid/animation/Animator;
    .locals 20

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    new-instance v7, Landroid/view/animation/AnticipateInterpolator;

    .line 4
    .line 5
    invoke-direct {v7}, Landroid/view/animation/AnticipateInterpolator;-><init>()V

    .line 6
    .line 7
    .line 8
    iget-object v1, v0, Ll/y7x;->h:Lv/VDraweeView;

    .line 9
    .line 10
    sget-object v2, Ll/gt0;->i:Landroid/util/Property;

    .line 11
    .line 12
    const/4 v9, 0x1

    .line 13
    new-array v8, v9, [F

    .line 14
    .line 15
    const/4 v10, 0x0

    .line 16
    const/4 v11, 0x0

    .line 17
    aput v11, v8, v10

    .line 18
    .line 19
    const-wide/16 v3, 0x0

    .line 20
    .line 21
    const-wide/16 v5, 0x1f4

    .line 22
    .line 23
    invoke-static/range {v1 .. v8}, Ll/gt0;->l(Landroid/view/View;Landroid/util/Property;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 24
    .line 25
    .line 26
    move-result-object v12

    .line 27
    iget-object v1, v0, Ll/y7x;->m:Lcom/p1/mobile/putong/core/ui/GradientBgButton;

    .line 28
    .line 29
    sget-object v2, Ll/gt0;->i:Landroid/util/Property;

    .line 30
    .line 31
    new-array v8, v9, [F

    .line 32
    .line 33
    aput v11, v8, v10

    .line 34
    .line 35
    invoke-static/range {v1 .. v8}, Ll/gt0;->l(Landroid/view/View;Landroid/util/Property;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 36
    .line 37
    .line 38
    move-result-object v13

    .line 39
    iget-object v1, v0, Ll/y7x;->h:Lv/VDraweeView;

    .line 40
    .line 41
    new-array v8, v9, [F

    .line 42
    .line 43
    aput v11, v8, v10

    .line 44
    .line 45
    const-string v2, "alpha"

    .line 46
    .line 47
    invoke-static/range {v1 .. v8}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 48
    .line 49
    .line 50
    move-result-object v14

    .line 51
    iget-object v1, v0, Ll/y7x;->j:Lv/VDraweeView;

    .line 52
    .line 53
    sget-object v2, Ll/gt0;->i:Landroid/util/Property;

    .line 54
    .line 55
    new-array v8, v9, [F

    .line 56
    .line 57
    aput v11, v8, v10

    .line 58
    .line 59
    invoke-static/range {v1 .. v8}, Ll/gt0;->l(Landroid/view/View;Landroid/util/Property;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 60
    .line 61
    .line 62
    move-result-object v15

    .line 63
    iget-object v1, v0, Ll/y7x;->j:Lv/VDraweeView;

    .line 64
    .line 65
    new-array v8, v9, [F

    .line 66
    .line 67
    aput v11, v8, v10

    .line 68
    .line 69
    const-string v2, "alpha"

    .line 70
    .line 71
    invoke-static/range {v1 .. v8}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 72
    .line 73
    .line 74
    move-result-object v1

    .line 75
    filled-new-array {v12, v13, v14, v15, v1}, [Landroid/animation/Animator;

    .line 76
    .line 77
    .line 78
    move-result-object v1

    .line 79
    invoke-static {v1}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 80
    .line 81
    .line 82
    move-result-object v1

    .line 83
    iget-object v2, v0, Ll/y7x;->Q:Ll/h7x;

    .line 84
    .line 85
    invoke-virtual {v2}, Ll/h7x;->S0()I

    .line 86
    .line 87
    .line 88
    move-result v2

    .line 89
    const/16 v3, 0xf

    .line 90
    .line 91
    if-ne v2, v3, :cond_0

    .line 92
    .line 93
    iget-object v12, v0, Ll/y7x;->i:Lv/VImage;

    .line 94
    .line 95
    sget-object v13, Ll/gt0;->i:Landroid/util/Property;

    .line 96
    .line 97
    new-array v2, v9, [F

    .line 98
    .line 99
    const/high16 v3, 0x3f000000    # 0.5f

    .line 100
    .line 101
    aput v3, v2, v10

    .line 102
    .line 103
    const-wide/16 v14, 0x0

    .line 104
    .line 105
    const/16 v18, 0x0

    .line 106
    .line 107
    move-object/from16 v19, v2

    .line 108
    .line 109
    move-wide/from16 v16, v5

    .line 110
    .line 111
    invoke-static/range {v12 .. v19}, Ll/gt0;->l(Landroid/view/View;Landroid/util/Property;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 112
    .line 113
    .line 114
    move-result-object v2

    .line 115
    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 116
    .line 117
    .line 118
    iget-object v12, v0, Ll/y7x;->i:Lv/VImage;

    .line 119
    .line 120
    sget-object v13, Landroid/view/View;->ALPHA:Landroid/util/Property;

    .line 121
    .line 122
    new-array v2, v9, [F

    .line 123
    .line 124
    aput v11, v2, v10

    .line 125
    .line 126
    move-object/from16 v19, v2

    .line 127
    .line 128
    invoke-static/range {v12 .. v19}, Ll/gt0;->l(Landroid/view/View;Landroid/util/Property;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 129
    .line 130
    .line 131
    move-result-object v2

    .line 132
    move-object v4, v13

    .line 133
    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 134
    .line 135
    .line 136
    iget-object v12, v0, Ll/y7x;->k:Lv/VImage;

    .line 137
    .line 138
    sget-object v13, Ll/gt0;->i:Landroid/util/Property;

    .line 139
    .line 140
    new-array v2, v9, [F

    .line 141
    .line 142
    aput v3, v2, v10

    .line 143
    .line 144
    move-object/from16 v19, v2

    .line 145
    .line 146
    invoke-static/range {v12 .. v19}, Ll/gt0;->l(Landroid/view/View;Landroid/util/Property;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 147
    .line 148
    .line 149
    move-result-object v2

    .line 150
    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 151
    .line 152
    .line 153
    iget-object v12, v0, Ll/y7x;->k:Lv/VImage;

    .line 154
    .line 155
    new-array v2, v9, [F

    .line 156
    .line 157
    aput v11, v2, v10

    .line 158
    .line 159
    move-object/from16 v19, v2

    .line 160
    .line 161
    move-object v13, v4

    .line 162
    invoke-static/range {v12 .. v19}, Ll/gt0;->l(Landroid/view/View;Landroid/util/Property;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 163
    .line 164
    .line 165
    move-result-object v2

    .line 166
    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 167
    .line 168
    .line 169
    :cond_0
    sget-object v2, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersItemView;->y:Lrx/subjects/b;

    .line 170
    .line 171
    sget-object v3, Ll/uxj0;->a:Ll/uxj0;

    .line 172
    .line 173
    invoke-virtual {v2, v3}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V

    .line 174
    .line 175
    .line 176
    iget-object v0, v0, Ll/y7x;->h:Lv/VDraweeView;

    .line 177
    .line 178
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    .line 179
    .line 180
    .line 181
    move-result v2

    .line 182
    new-array v2, v2, [Landroid/animation/Animator;

    .line 183
    .line 184
    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 185
    .line 186
    .line 187
    move-result-object v1

    .line 188
    check-cast v1, [Landroid/animation/Animator;

    .line 189
    .line 190
    invoke-static {v1}, Ll/gt0;->z([Landroid/animation/Animator;)Landroid/animation/Animator;

    .line 191
    .line 192
    .line 193
    move-result-object v1

    .line 194
    invoke-static {v0, v1}, Ll/gt0;->b(Landroid/view/View;Landroid/animation/Animator;)Landroid/animation/Animator;

    .line 195
    .line 196
    .line 197
    move-result-object v0

    .line 198
    return-object v0
.end method

.method public h(II)V
    .locals 1

    .line 1
    invoke-virtual {p0, p1}, Ll/y7x;->s0(I)V

    .line 2
    .line 3
    .line 4
    iget p2, p0, Ll/y7x;->k0:I

    .line 5
    .line 6
    sub-int v0, p1, p2

    .line 7
    .line 8
    if-gtz v0, :cond_2

    .line 9
    .line 10
    if-lez p1, :cond_0

    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_0
    sub-int p2, p1, p2

    .line 14
    .line 15
    if-gez p2, :cond_4

    .line 16
    .line 17
    iget-boolean p2, p0, Ll/y7x;->R:Z

    .line 18
    .line 19
    if-eqz p2, :cond_1

    .line 20
    .line 21
    invoke-virtual {p0}, Ll/y7x;->t0()V

    .line 22
    .line 23
    .line 24
    :cond_1
    const/4 p2, 0x0

    .line 25
    iput-boolean p2, p0, Ll/y7x;->R:Z

    .line 26
    .line 27
    goto :goto_1

    .line 28
    :cond_2
    :goto_0
    iget-boolean p2, p0, Ll/y7x;->R:Z

    .line 29
    .line 30
    if-nez p2, :cond_3

    .line 31
    .line 32
    invoke-virtual {p0}, Ll/y7x;->u0()V

    .line 33
    .line 34
    .line 35
    :cond_3
    const/4 p2, 0x1

    .line 36
    iput-boolean p2, p0, Ll/y7x;->R:Z

    .line 37
    .line 38
    :cond_4
    :goto_1
    iput p1, p0, Ll/y7x;->k0:I

    .line 39
    .line 40
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/h7x;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/y7x;->v0(Ll/h7x;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/y7x;->q0(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public initAnimationState()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/y7x;->N:Lv/VText;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {v0, v1}, Landroid/view/View;->setAlpha(F)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Ll/y7x;->t:Lv/VText_AutoFit;

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Landroid/view/View;->setAlpha(F)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Ll/y7x;->h:Lv/VDraweeView;

    .line 13
    .line 14
    invoke-virtual {v0, v1}, Landroid/view/View;->setAlpha(F)V

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Ll/y7x;->h:Lv/VDraweeView;

    .line 18
    .line 19
    const v2, 0x3dcccccd    # 0.1f

    .line 20
    .line 21
    .line 22
    invoke-static {v0, v2}, Ll/bnl0;->t0(Landroid/view/View;F)V

    .line 23
    .line 24
    .line 25
    iget-object v0, p0, Ll/y7x;->j:Lv/VDraweeView;

    .line 26
    .line 27
    invoke-virtual {v0, v1}, Landroid/view/View;->setAlpha(F)V

    .line 28
    .line 29
    .line 30
    iget-object v0, p0, Ll/y7x;->j:Lv/VDraweeView;

    .line 31
    .line 32
    invoke-static {v0, v2}, Ll/bnl0;->t0(Landroid/view/View;F)V

    .line 33
    .line 34
    .line 35
    iget-object v0, p0, Ll/y7x;->m:Lcom/p1/mobile/putong/core/ui/GradientBgButton;

    .line 36
    .line 37
    invoke-static {v0, v1}, Ll/bnl0;->t0(Landroid/view/View;F)V

    .line 38
    .line 39
    .line 40
    invoke-static {}, Ll/bnl0;->y0()I

    .line 41
    .line 42
    .line 43
    move-result v0

    .line 44
    iget-object v1, p0, Ll/y7x;->x:Lv/VButton_FakeShadow;

    .line 45
    .line 46
    int-to-float v2, v0

    .line 47
    invoke-virtual {v1, v2}, Landroid/view/View;->setTranslationX(F)V

    .line 48
    .line 49
    .line 50
    iget-object v1, p0, Ll/y7x;->w:Lv/VButton_FakeShadow;

    .line 51
    .line 52
    neg-int v0, v0

    .line 53
    int-to-float v0, v0

    .line 54
    invoke-virtual {v1, v0}, Landroid/view/View;->setTranslationX(F)V

    .line 55
    .line 56
    .line 57
    iget-object p0, p0, Ll/y7x;->y:Lv/VButton;

    .line 58
    .line 59
    const/high16 v0, 0x42a00000    # 80.0f

    .line 60
    .line 61
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 62
    .line 63
    .line 64
    move-result v0

    .line 65
    int-to-float v0, v0

    .line 66
    invoke-virtual {p0, v0}, Landroid/view/View;->setTranslationY(F)V

    .line 67
    .line 68
    .line 69
    return-void
.end method

.method public q0(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/y7x$d;->a(Ll/y7x;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public r0()Lcom/p1/mobile/putong/core/ui/match/MatchAct;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/y7x;->P:Lcom/p1/mobile/putong/core/ui/match/MatchAct;

    .line 2
    .line 3
    return-object p0
.end method

.method public final s0(I)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/y7x;->G:Landroid/widget/RelativeLayout;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Landroid/widget/RelativeLayout$LayoutParams;

    .line 8
    .line 9
    iput p1, v0, Landroid/widget/RelativeLayout$LayoutParams;->bottomMargin:I

    .line 10
    .line 11
    iget v1, p0, Ll/y7x;->S:I

    .line 12
    .line 13
    if-ge p1, v1, :cond_0

    .line 14
    .line 15
    iput v1, v0, Landroid/widget/RelativeLayout$LayoutParams;->bottomMargin:I

    .line 16
    .line 17
    :cond_0
    iget-object p0, p0, Ll/y7x;->G:Landroid/widget/RelativeLayout;

    .line 18
    .line 19
    invoke-virtual {p0, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public t0()V
    .locals 3

    .line 1
    iget-boolean v0, p0, Ll/y7x;->X:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iget v0, p0, Ll/y7x;->U:I

    .line 7
    .line 8
    iget v1, p0, Ll/y7x;->T:I

    .line 9
    .line 10
    filled-new-array {v0, v1}, [I

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-static {v0}, Landroid/animation/ValueAnimator;->ofInt([I)Landroid/animation/ValueAnimator;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    new-instance v1, Landroid/view/animation/AccelerateDecelerateInterpolator;

    .line 19
    .line 20
    invoke-direct {v1}, Landroid/view/animation/AccelerateDecelerateInterpolator;-><init>()V

    .line 21
    .line 22
    .line 23
    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 24
    .line 25
    .line 26
    const-wide/16 v1, 0xfa

    .line 27
    .line 28
    invoke-virtual {v0, v1, v2}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 29
    .line 30
    .line 31
    new-instance v1, Ll/y7x$b;

    .line 32
    .line 33
    invoke-direct {v1, p0}, Ll/y7x$b;-><init>(Ll/y7x;)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {v0, v1}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 37
    .line 38
    .line 39
    new-instance v1, Ll/m7x;

    .line 40
    .line 41
    invoke-direct {v1, p0}, Ll/m7x;-><init>(Ll/y7x;)V

    .line 42
    .line 43
    .line 44
    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 45
    .line 46
    .line 47
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->start()V

    .line 48
    .line 49
    .line 50
    return-void
.end method

.method public final u0()V
    .locals 3

    .line 1
    iget-boolean v0, p0, Ll/y7x;->W:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iget v0, p0, Ll/y7x;->T:I

    .line 7
    .line 8
    iget v1, p0, Ll/y7x;->U:I

    .line 9
    .line 10
    filled-new-array {v0, v1}, [I

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-static {v0}, Landroid/animation/ValueAnimator;->ofInt([I)Landroid/animation/ValueAnimator;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    new-instance v1, Landroid/view/animation/AccelerateDecelerateInterpolator;

    .line 19
    .line 20
    invoke-direct {v1}, Landroid/view/animation/AccelerateDecelerateInterpolator;-><init>()V

    .line 21
    .line 22
    .line 23
    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 24
    .line 25
    .line 26
    const-wide/16 v1, 0xfa

    .line 27
    .line 28
    invoke-virtual {v0, v1, v2}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 29
    .line 30
    .line 31
    new-instance v1, Ll/y7x$a;

    .line 32
    .line 33
    invoke-direct {v1, p0}, Ll/y7x$a;-><init>(Ll/y7x;)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {v0, v1}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 37
    .line 38
    .line 39
    new-instance v1, Ll/o7x;

    .line 40
    .line 41
    invoke-direct {v1, p0}, Ll/o7x;-><init>(Ll/y7x;)V

    .line 42
    .line 43
    .line 44
    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 45
    .line 46
    .line 47
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->start()V

    .line 48
    .line 49
    .line 50
    return-void
.end method

.method public v0(Ll/h7x;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/y7x;->Q:Ll/h7x;

    .line 2
    .line 3
    return-void
.end method

.method public final w0()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/y7x;->f:Lcom/sunshine/engine/particle/SceneView;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Ll/y7x;->f:Lcom/sunshine/engine/particle/SceneView;

    .line 8
    .line 9
    const-string v2, "animations/xmas_lanterns/config.xml"

    .line 10
    .line 11
    const-string v3, "animations/xmas_lanterns/pic"

    .line 12
    .line 13
    filled-new-array {v2, v3}, [Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    invoke-virtual {v0, v2}, Lcom/sunshine/engine/base/AnimView;->d([Ljava/lang/String;)Z

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Ll/y7x;->f:Lcom/sunshine/engine/particle/SceneView;

    .line 21
    .line 22
    const/4 v2, 0x1

    .line 23
    invoke-virtual {v0, v2}, Lcom/sunshine/engine/base/AnimView;->b(Z)Lcom/sunshine/engine/base/AnimView;

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, Ll/y7x;->O:Lcom/sunshine/engine/particle/SceneView;

    .line 27
    .line 28
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 29
    .line 30
    .line 31
    iget-object v0, p0, Ll/y7x;->O:Lcom/sunshine/engine/particle/SceneView;

    .line 32
    .line 33
    const-string v1, "animations/xmas_snowflakes/config.xml"

    .line 34
    .line 35
    const-string v3, "animations/xmas_snowflakes/pic"

    .line 36
    .line 37
    filled-new-array {v1, v3}, [Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    invoke-virtual {v0, v1}, Lcom/sunshine/engine/base/AnimView;->d([Ljava/lang/String;)Z

    .line 42
    .line 43
    .line 44
    iget-object p0, p0, Ll/y7x;->O:Lcom/sunshine/engine/particle/SceneView;

    .line 45
    .line 46
    invoke-virtual {p0, v2}, Lcom/sunshine/engine/base/AnimView;->b(Z)Lcom/sunshine/engine/base/AnimView;

    .line 47
    .line 48
    .line 49
    return-void
.end method

.method public x0(ZI)V
    .locals 9

    .line 1
    iget-object v0, p0, Ll/y7x;->p0:Ll/f0r;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ll/f0r;

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/y7x;->r0()Lcom/p1/mobile/putong/core/ui/match/MatchAct;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-direct {v0, v1}, Ll/f0r;-><init>(Landroid/app/Activity;)V

    .line 12
    .line 13
    .line 14
    iput-object v0, p0, Ll/y7x;->p0:Ll/f0r;

    .line 15
    .line 16
    :cond_0
    invoke-virtual {p0}, Ll/y7x;->r0()Lcom/p1/mobile/putong/core/ui/match/MatchAct;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-virtual {v0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    new-instance v1, Ll/t7x;

    .line 29
    .line 30
    invoke-direct {v1, p0}, Ll/t7x;-><init>(Ll/y7x;)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {v0, v1}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 34
    .line 35
    .line 36
    iget-object v0, p0, Ll/y7x;->w:Lv/VButton_FakeShadow;

    .line 37
    .line 38
    iget-object v1, p0, Ll/y7x;->E0:Landroid/view/View$OnClickListener;

    .line 39
    .line 40
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 41
    .line 42
    .line 43
    new-instance v0, Ll/u7x;

    .line 44
    .line 45
    invoke-direct {v0, p0}, Ll/u7x;-><init>(Ll/y7x;)V

    .line 46
    .line 47
    .line 48
    iget-object v1, p0, Ll/y7x;->I:Lv/VText;

    .line 49
    .line 50
    invoke-static {v1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 51
    .line 52
    .line 53
    iget-object v1, p0, Ll/y7x;->H:Lv/VEditText;

    .line 54
    .line 55
    new-instance v2, Ll/v7x;

    .line 56
    .line 57
    invoke-direct {v2, p0, v0}, Ll/v7x;-><init>(Ll/y7x;Landroid/view/View$OnClickListener;)V

    .line 58
    .line 59
    .line 60
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setOnEditorActionListener(Landroid/widget/TextView$OnEditorActionListener;)V

    .line 61
    .line 62
    .line 63
    iget-object v0, p0, Ll/y7x;->H:Lv/VEditText;

    .line 64
    .line 65
    new-instance v1, Ll/w7x;

    .line 66
    .line 67
    invoke-direct {v1}, Ll/w7x;-><init>()V

    .line 68
    .line 69
    .line 70
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 71
    .line 72
    .line 73
    iget-object v0, p0, Ll/y7x;->x:Lv/VButton_FakeShadow;

    .line 74
    .line 75
    iget-object v1, p0, Ll/y7x;->F0:Landroid/view/View$OnClickListener;

    .line 76
    .line 77
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 78
    .line 79
    .line 80
    iget-object v0, p0, Ll/y7x;->L:Lv/VButton_FakeShadow;

    .line 81
    .line 82
    iget-object v1, p0, Ll/y7x;->F0:Landroid/view/View$OnClickListener;

    .line 83
    .line 84
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 85
    .line 86
    .line 87
    iget-object v0, p0, Ll/y7x;->B:Lv/VButton;

    .line 88
    .line 89
    iget-object v1, p0, Ll/y7x;->E0:Landroid/view/View$OnClickListener;

    .line 90
    .line 91
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 92
    .line 93
    .line 94
    iget-object v0, p0, Ll/y7x;->A:Lv/VButton;

    .line 95
    .line 96
    iget-object v1, p0, Ll/y7x;->F0:Landroid/view/View$OnClickListener;

    .line 97
    .line 98
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 99
    .line 100
    .line 101
    iget-object v0, p0, Ll/y7x;->D:Lv/VButton;

    .line 102
    .line 103
    iget-object v1, p0, Ll/y7x;->F0:Landroid/view/View$OnClickListener;

    .line 104
    .line 105
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 106
    .line 107
    .line 108
    iget-object v0, p0, Ll/y7x;->y:Lv/VButton;

    .line 109
    .line 110
    iget-object v1, p0, Ll/y7x;->H0:Landroid/view/View$OnClickListener;

    .line 111
    .line 112
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 113
    .line 114
    .line 115
    iget-object v0, p0, Ll/y7x;->e:Lv/VButton;

    .line 116
    .line 117
    iget-object v1, p0, Ll/y7x;->H0:Landroid/view/View$OnClickListener;

    .line 118
    .line 119
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 120
    .line 121
    .line 122
    const/16 v0, 0xa

    .line 123
    .line 124
    const/4 v1, 0x4

    .line 125
    const/4 v2, 0x2

    .line 126
    const/4 v3, 0x1

    .line 127
    if-eq p2, v0, :cond_e

    .line 128
    .line 129
    const/16 v0, 0x1a

    .line 130
    .line 131
    if-ne p2, v0, :cond_1

    .line 132
    .line 133
    goto/16 :goto_3

    .line 134
    .line 135
    :cond_1
    if-ne p2, v3, :cond_2

    .line 136
    .line 137
    iget-object v0, p0, Ll/y7x;->m:Lcom/p1/mobile/putong/core/ui/GradientBgButton;

    .line 138
    .line 139
    invoke-virtual {v0, v3}, Lcom/p1/mobile/putong/core/ui/GradientBgButton;->setEmpty(Z)V

    .line 140
    .line 141
    .line 142
    iget-object v0, p0, Ll/y7x;->m:Lcom/p1/mobile/putong/core/ui/GradientBgButton;

    .line 143
    .line 144
    sget v1, Ll/dbc0;->us:I

    .line 145
    .line 146
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 147
    .line 148
    .line 149
    iget-object v0, p0, Ll/y7x;->m:Lcom/p1/mobile/putong/core/ui/GradientBgButton;

    .line 150
    .line 151
    invoke-virtual {v0}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    .line 152
    .line 153
    .line 154
    move-result-object v0

    .line 155
    check-cast v0, Landroid/graphics/drawable/AnimationDrawable;

    .line 156
    .line 157
    invoke-virtual {v0}, Landroid/graphics/drawable/AnimationDrawable;->start()V

    .line 158
    .line 159
    .line 160
    iget-object v0, p0, Ll/y7x;->N:Lv/VText;

    .line 161
    .line 162
    invoke-static {v2}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 163
    .line 164
    .line 165
    move-result-object v1

    .line 166
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 167
    .line 168
    .line 169
    iget-object v0, p0, Ll/y7x;->N:Lv/VText;

    .line 170
    .line 171
    sget v1, Lcom/p1/mobile/putong/core/R$string;->Rm:I

    .line 172
    .line 173
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    .line 174
    .line 175
    .line 176
    goto/16 :goto_4

    .line 177
    .line 178
    :cond_2
    const/16 v0, 0xd

    .line 179
    .line 180
    const/16 v4, 0xb

    .line 181
    .line 182
    const/16 v5, 0xc

    .line 183
    .line 184
    const/high16 v6, 0x40400000    # 3.0f

    .line 185
    .line 186
    if-eq p2, v5, :cond_a

    .line 187
    .line 188
    if-eq p2, v4, :cond_a

    .line 189
    .line 190
    if-ne p2, v0, :cond_3

    .line 191
    .line 192
    invoke-static {}, Ll/pgj;->c()Z

    .line 193
    .line 194
    .line 195
    move-result v7

    .line 196
    if-eqz v7, :cond_3

    .line 197
    .line 198
    goto/16 :goto_1

    .line 199
    .line 200
    :cond_3
    const/16 v0, 0x25

    .line 201
    .line 202
    const/16 v4, 0x27

    .line 203
    .line 204
    if-eq p2, v4, :cond_7

    .line 205
    .line 206
    if-eq p2, v0, :cond_7

    .line 207
    .line 208
    const/16 v5, 0x26

    .line 209
    .line 210
    if-ne p2, v5, :cond_4

    .line 211
    .line 212
    goto/16 :goto_0

    .line 213
    .line 214
    :cond_4
    const/16 v0, 0xe

    .line 215
    .line 216
    if-ne p2, v0, :cond_5

    .line 217
    .line 218
    iget-object v0, p0, Ll/y7x;->N:Lv/VText;

    .line 219
    .line 220
    invoke-static {v2}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 221
    .line 222
    .line 223
    move-result-object v1

    .line 224
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 225
    .line 226
    .line 227
    iget-object v0, p0, Ll/y7x;->N:Lv/VText;

    .line 228
    .line 229
    sget v1, Lcom/p1/mobile/putong/core/R$string;->Sh:I

    .line 230
    .line 231
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    .line 232
    .line 233
    .line 234
    iget-object v0, p0, Ll/y7x;->m:Lcom/p1/mobile/putong/core/ui/GradientBgButton;

    .line 235
    .line 236
    invoke-virtual {p0}, Ll/y7x;->r0()Lcom/p1/mobile/putong/core/ui/match/MatchAct;

    .line 237
    .line 238
    .line 239
    move-result-object v1

    .line 240
    sget v4, Ll/dbc0;->Ls:I

    .line 241
    .line 242
    invoke-virtual {v1, v4}, Lcom/p1/mobile/android/app/Act;->drawable(I)Landroid/graphics/drawable/Drawable;

    .line 243
    .line 244
    .line 245
    move-result-object v1

    .line 246
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/ShadowButton;->setIcon(Landroid/graphics/drawable/Drawable;)V

    .line 247
    .line 248
    .line 249
    iget-object v0, p0, Ll/y7x;->m:Lcom/p1/mobile/putong/core/ui/GradientBgButton;

    .line 250
    .line 251
    invoke-virtual {p0}, Ll/y7x;->r0()Lcom/p1/mobile/putong/core/ui/match/MatchAct;

    .line 252
    .line 253
    .line 254
    move-result-object v1

    .line 255
    sget v4, Ll/c9c0;->Y1:I

    .line 256
    .line 257
    invoke-virtual {v1, v4}, Lcom/p1/mobile/android/app/Act;->color(I)I

    .line 258
    .line 259
    .line 260
    move-result v1

    .line 261
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/GradientBgButton;->setButtonColorStart(I)V

    .line 262
    .line 263
    .line 264
    iget-object v0, p0, Ll/y7x;->m:Lcom/p1/mobile/putong/core/ui/GradientBgButton;

    .line 265
    .line 266
    invoke-virtual {p0}, Ll/y7x;->r0()Lcom/p1/mobile/putong/core/ui/match/MatchAct;

    .line 267
    .line 268
    .line 269
    move-result-object v1

    .line 270
    sget v4, Ll/c9c0;->X1:I

    .line 271
    .line 272
    invoke-virtual {v1, v4}, Lcom/p1/mobile/android/app/Act;->color(I)I

    .line 273
    .line 274
    .line 275
    move-result v1

    .line 276
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/GradientBgButton;->setButtonColorEnd(I)V

    .line 277
    .line 278
    .line 279
    new-instance v0, Lcom/facebook/drawee/generic/RoundingParams;

    .line 280
    .line 281
    invoke-direct {v0}, Lcom/facebook/drawee/generic/RoundingParams;-><init>()V

    .line 282
    .line 283
    .line 284
    invoke-virtual {p0}, Ll/y7x;->r0()Lcom/p1/mobile/putong/core/ui/match/MatchAct;

    .line 285
    .line 286
    .line 287
    move-result-object v1

    .line 288
    sget v4, Ll/c9c0;->G1:I

    .line 289
    .line 290
    invoke-virtual {v1, v4}, Lcom/p1/mobile/android/app/Act;->color(I)I

    .line 291
    .line 292
    .line 293
    move-result v1

    .line 294
    invoke-static {v6}, Ll/qa00;->d(F)I

    .line 295
    .line 296
    .line 297
    move-result v4

    .line 298
    int-to-float v4, v4

    .line 299
    invoke-virtual {v0, v1, v4}, Lcom/facebook/drawee/generic/RoundingParams;->o(IF)Lcom/facebook/drawee/generic/RoundingParams;

    .line 300
    .line 301
    .line 302
    invoke-virtual {v0, v3}, Lcom/facebook/drawee/generic/RoundingParams;->v(Z)Lcom/facebook/drawee/generic/RoundingParams;

    .line 303
    .line 304
    .line 305
    iget-object v1, p0, Ll/y7x;->j:Lv/VDraweeView;

    .line 306
    .line 307
    invoke-virtual {v1}, Lcom/facebook/drawee/view/DraweeView;->getHierarchy()Ll/mde;

    .line 308
    .line 309
    .line 310
    move-result-object v1

    .line 311
    check-cast v1, Ll/wlj;

    .line 312
    .line 313
    invoke-virtual {v1, v0}, Ll/wlj;->H(Lcom/facebook/drawee/generic/RoundingParams;)V

    .line 314
    .line 315
    .line 316
    goto/16 :goto_4

    .line 317
    .line 318
    :cond_5
    iget-object v0, p0, Ll/y7x;->N:Lv/VText;

    .line 319
    .line 320
    const/16 v4, 0xf

    .line 321
    .line 322
    if-ne p2, v4, :cond_6

    .line 323
    .line 324
    invoke-static {v2}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 325
    .line 326
    .line 327
    move-result-object v4

    .line 328
    invoke-virtual {v0, v4}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 329
    .line 330
    .line 331
    iget-object v0, p0, Ll/y7x;->N:Lv/VText;

    .line 332
    .line 333
    sget v4, Lcom/p1/mobile/putong/core/R$string;->Sh:I

    .line 334
    .line 335
    invoke-virtual {v0, v4}, Landroid/widget/TextView;->setText(I)V

    .line 336
    .line 337
    .line 338
    iget-object v0, p0, Ll/y7x;->m:Lcom/p1/mobile/putong/core/ui/GradientBgButton;

    .line 339
    .line 340
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 341
    .line 342
    .line 343
    invoke-virtual {p0}, Ll/y7x;->w0()V

    .line 344
    .line 345
    .line 346
    goto/16 :goto_4

    .line 347
    .line 348
    :cond_6
    invoke-static {v2}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 349
    .line 350
    .line 351
    move-result-object v4

    .line 352
    invoke-virtual {v0, v4}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 353
    .line 354
    .line 355
    iget-object v0, p0, Ll/y7x;->N:Lv/VText;

    .line 356
    .line 357
    sget v4, Lcom/p1/mobile/putong/core/R$string;->Sh:I

    .line 358
    .line 359
    invoke-virtual {v0, v4}, Landroid/widget/TextView;->setText(I)V

    .line 360
    .line 361
    .line 362
    iget-object v0, p0, Ll/y7x;->m:Lcom/p1/mobile/putong/core/ui/GradientBgButton;

    .line 363
    .line 364
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 365
    .line 366
    .line 367
    goto/16 :goto_4

    .line 368
    .line 369
    :cond_7
    :goto_0
    iget-object v1, p0, Ll/y7x;->N:Lv/VText;

    .line 370
    .line 371
    invoke-static {v2}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 372
    .line 373
    .line 374
    move-result-object v5

    .line 375
    invoke-virtual {v1, v5}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 376
    .line 377
    .line 378
    iget-object v1, p0, Ll/y7x;->N:Lv/VText;

    .line 379
    .line 380
    sget v5, Lcom/p1/mobile/putong/core/R$string;->Sh:I

    .line 381
    .line 382
    invoke-virtual {v1, v5}, Landroid/widget/TextView;->setText(I)V

    .line 383
    .line 384
    .line 385
    iget-object v1, p0, Ll/y7x;->m:Lcom/p1/mobile/putong/core/ui/GradientBgButton;

    .line 386
    .line 387
    invoke-virtual {p0}, Ll/y7x;->r0()Lcom/p1/mobile/putong/core/ui/match/MatchAct;

    .line 388
    .line 389
    .line 390
    move-result-object v5

    .line 391
    sget v7, Ll/dbc0;->zq:I

    .line 392
    .line 393
    invoke-virtual {v5, v7}, Lcom/p1/mobile/android/app/Act;->drawable(I)Landroid/graphics/drawable/Drawable;

    .line 394
    .line 395
    .line 396
    move-result-object v5

    .line 397
    invoke-virtual {v1, v5}, Lcom/p1/mobile/putong/core/ui/ShadowButton;->setIcon(Landroid/graphics/drawable/Drawable;)V

    .line 398
    .line 399
    .line 400
    iget-object v1, p0, Ll/y7x;->m:Lcom/p1/mobile/putong/core/ui/GradientBgButton;

    .line 401
    .line 402
    invoke-virtual {p0}, Ll/y7x;->r0()Lcom/p1/mobile/putong/core/ui/match/MatchAct;

    .line 403
    .line 404
    .line 405
    move-result-object v5

    .line 406
    sget v7, Ll/c9c0;->K1:I

    .line 407
    .line 408
    invoke-virtual {v5, v7}, Lcom/p1/mobile/android/app/Act;->color(I)I

    .line 409
    .line 410
    .line 411
    move-result v5

    .line 412
    invoke-virtual {v1, v5}, Lcom/p1/mobile/putong/core/ui/GradientBgButton;->setButtonColorStart(I)V

    .line 413
    .line 414
    .line 415
    iget-object v1, p0, Ll/y7x;->m:Lcom/p1/mobile/putong/core/ui/GradientBgButton;

    .line 416
    .line 417
    invoke-virtual {p0}, Ll/y7x;->r0()Lcom/p1/mobile/putong/core/ui/match/MatchAct;

    .line 418
    .line 419
    .line 420
    move-result-object v5

    .line 421
    sget v7, Ll/c9c0;->J1:I

    .line 422
    .line 423
    invoke-virtual {v5, v7}, Lcom/p1/mobile/android/app/Act;->color(I)I

    .line 424
    .line 425
    .line 426
    move-result v5

    .line 427
    invoke-virtual {v1, v5}, Lcom/p1/mobile/putong/core/ui/GradientBgButton;->setButtonColorEnd(I)V

    .line 428
    .line 429
    .line 430
    new-instance v1, Lcom/facebook/drawee/generic/RoundingParams;

    .line 431
    .line 432
    invoke-direct {v1}, Lcom/facebook/drawee/generic/RoundingParams;-><init>()V

    .line 433
    .line 434
    .line 435
    invoke-virtual {p0}, Ll/y7x;->r0()Lcom/p1/mobile/putong/core/ui/match/MatchAct;

    .line 436
    .line 437
    .line 438
    move-result-object v5

    .line 439
    sget v7, Ll/c9c0;->J1:I

    .line 440
    .line 441
    invoke-virtual {v5, v7}, Lcom/p1/mobile/android/app/Act;->color(I)I

    .line 442
    .line 443
    .line 444
    move-result v5

    .line 445
    invoke-static {v6}, Ll/qa00;->d(F)I

    .line 446
    .line 447
    .line 448
    move-result v6

    .line 449
    int-to-float v6, v6

    .line 450
    invoke-virtual {v1, v5, v6}, Lcom/facebook/drawee/generic/RoundingParams;->o(IF)Lcom/facebook/drawee/generic/RoundingParams;

    .line 451
    .line 452
    .line 453
    invoke-virtual {v1, v3}, Lcom/facebook/drawee/generic/RoundingParams;->v(Z)Lcom/facebook/drawee/generic/RoundingParams;

    .line 454
    .line 455
    .line 456
    if-ne p2, v4, :cond_8

    .line 457
    .line 458
    iget-object v0, p0, Ll/y7x;->h:Lv/VDraweeView;

    .line 459
    .line 460
    invoke-virtual {v0}, Lcom/facebook/drawee/view/DraweeView;->getHierarchy()Ll/mde;

    .line 461
    .line 462
    .line 463
    move-result-object v0

    .line 464
    check-cast v0, Ll/wlj;

    .line 465
    .line 466
    invoke-virtual {v0, v1}, Ll/wlj;->H(Lcom/facebook/drawee/generic/RoundingParams;)V

    .line 467
    .line 468
    .line 469
    iget-object v0, p0, Ll/y7x;->j:Lv/VDraweeView;

    .line 470
    .line 471
    invoke-virtual {v0}, Lcom/facebook/drawee/view/DraweeView;->getHierarchy()Ll/mde;

    .line 472
    .line 473
    .line 474
    move-result-object v0

    .line 475
    check-cast v0, Ll/wlj;

    .line 476
    .line 477
    invoke-virtual {v0, v1}, Ll/wlj;->H(Lcom/facebook/drawee/generic/RoundingParams;)V

    .line 478
    .line 479
    .line 480
    goto/16 :goto_4

    .line 481
    .line 482
    :cond_8
    if-ne p2, v0, :cond_9

    .line 483
    .line 484
    iget-object v0, p0, Ll/y7x;->j:Lv/VDraweeView;

    .line 485
    .line 486
    invoke-virtual {v0}, Lcom/facebook/drawee/view/DraweeView;->getHierarchy()Ll/mde;

    .line 487
    .line 488
    .line 489
    move-result-object v0

    .line 490
    check-cast v0, Ll/wlj;

    .line 491
    .line 492
    invoke-virtual {v0, v1}, Ll/wlj;->H(Lcom/facebook/drawee/generic/RoundingParams;)V

    .line 493
    .line 494
    .line 495
    goto/16 :goto_4

    .line 496
    .line 497
    :cond_9
    iget-object v0, p0, Ll/y7x;->h:Lv/VDraweeView;

    .line 498
    .line 499
    invoke-virtual {v0}, Lcom/facebook/drawee/view/DraweeView;->getHierarchy()Ll/mde;

    .line 500
    .line 501
    .line 502
    move-result-object v0

    .line 503
    check-cast v0, Ll/wlj;

    .line 504
    .line 505
    invoke-virtual {v0, v1}, Ll/wlj;->H(Lcom/facebook/drawee/generic/RoundingParams;)V

    .line 506
    .line 507
    .line 508
    goto/16 :goto_4

    .line 509
    .line 510
    :cond_a
    :goto_1
    iget-object v1, p0, Ll/y7x;->N:Lv/VText;

    .line 511
    .line 512
    invoke-static {v2}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 513
    .line 514
    .line 515
    move-result-object v7

    .line 516
    invoke-virtual {v1, v7}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 517
    .line 518
    .line 519
    iget-object v1, p0, Ll/y7x;->N:Lv/VText;

    .line 520
    .line 521
    sget v7, Lcom/p1/mobile/putong/core/R$string;->Sh:I

    .line 522
    .line 523
    invoke-virtual {v1, v7}, Landroid/widget/TextView;->setText(I)V

    .line 524
    .line 525
    .line 526
    invoke-static {}, Lcom/p1/mobile/putong/ab/IntlCountryCodeController;->v()Z

    .line 527
    .line 528
    .line 529
    move-result v1

    .line 530
    iget-object v7, p0, Ll/y7x;->m:Lcom/p1/mobile/putong/core/ui/GradientBgButton;

    .line 531
    .line 532
    if-eqz v1, :cond_b

    .line 533
    .line 534
    invoke-virtual {p0}, Ll/y7x;->r0()Lcom/p1/mobile/putong/core/ui/match/MatchAct;

    .line 535
    .line 536
    .line 537
    move-result-object v1

    .line 538
    sget v8, Ll/dbc0;->pq:I

    .line 539
    .line 540
    invoke-virtual {v1, v8}, Lcom/p1/mobile/android/app/Act;->drawable(I)Landroid/graphics/drawable/Drawable;

    .line 541
    .line 542
    .line 543
    move-result-object v1

    .line 544
    invoke-virtual {v7, v1}, Lcom/p1/mobile/putong/core/ui/ShadowButton;->setIcon(Landroid/graphics/drawable/Drawable;)V

    .line 545
    .line 546
    .line 547
    goto :goto_2

    .line 548
    :cond_b
    invoke-virtual {p0}, Ll/y7x;->r0()Lcom/p1/mobile/putong/core/ui/match/MatchAct;

    .line 549
    .line 550
    .line 551
    move-result-object v1

    .line 552
    sget v8, Ll/dbc0;->Ms:I

    .line 553
    .line 554
    invoke-virtual {v1, v8}, Lcom/p1/mobile/android/app/Act;->drawable(I)Landroid/graphics/drawable/Drawable;

    .line 555
    .line 556
    .line 557
    move-result-object v1

    .line 558
    invoke-virtual {v7, v1}, Lcom/p1/mobile/putong/core/ui/ShadowButton;->setIcon(Landroid/graphics/drawable/Drawable;)V

    .line 559
    .line 560
    .line 561
    :goto_2
    iget-object v1, p0, Ll/y7x;->m:Lcom/p1/mobile/putong/core/ui/GradientBgButton;

    .line 562
    .line 563
    invoke-virtual {p0}, Ll/y7x;->r0()Lcom/p1/mobile/putong/core/ui/match/MatchAct;

    .line 564
    .line 565
    .line 566
    move-result-object v7

    .line 567
    sget v8, Ll/c9c0;->K1:I

    .line 568
    .line 569
    invoke-virtual {v7, v8}, Lcom/p1/mobile/android/app/Act;->color(I)I

    .line 570
    .line 571
    .line 572
    move-result v7

    .line 573
    invoke-virtual {v1, v7}, Lcom/p1/mobile/putong/core/ui/GradientBgButton;->setButtonColorStart(I)V

    .line 574
    .line 575
    .line 576
    iget-object v1, p0, Ll/y7x;->m:Lcom/p1/mobile/putong/core/ui/GradientBgButton;

    .line 577
    .line 578
    invoke-virtual {p0}, Ll/y7x;->r0()Lcom/p1/mobile/putong/core/ui/match/MatchAct;

    .line 579
    .line 580
    .line 581
    move-result-object v7

    .line 582
    sget v8, Ll/c9c0;->J1:I

    .line 583
    .line 584
    invoke-virtual {v7, v8}, Lcom/p1/mobile/android/app/Act;->color(I)I

    .line 585
    .line 586
    .line 587
    move-result v7

    .line 588
    invoke-virtual {v1, v7}, Lcom/p1/mobile/putong/core/ui/GradientBgButton;->setButtonColorEnd(I)V

    .line 589
    .line 590
    .line 591
    new-instance v1, Lcom/facebook/drawee/generic/RoundingParams;

    .line 592
    .line 593
    invoke-direct {v1}, Lcom/facebook/drawee/generic/RoundingParams;-><init>()V

    .line 594
    .line 595
    .line 596
    invoke-virtual {p0}, Ll/y7x;->r0()Lcom/p1/mobile/putong/core/ui/match/MatchAct;

    .line 597
    .line 598
    .line 599
    move-result-object v7

    .line 600
    sget v8, Ll/c9c0;->J1:I

    .line 601
    .line 602
    invoke-virtual {v7, v8}, Lcom/p1/mobile/android/app/Act;->color(I)I

    .line 603
    .line 604
    .line 605
    move-result v7

    .line 606
    invoke-static {v6}, Ll/qa00;->d(F)I

    .line 607
    .line 608
    .line 609
    move-result v6

    .line 610
    int-to-float v6, v6

    .line 611
    invoke-virtual {v1, v7, v6}, Lcom/facebook/drawee/generic/RoundingParams;->o(IF)Lcom/facebook/drawee/generic/RoundingParams;

    .line 612
    .line 613
    .line 614
    invoke-virtual {v1, v3}, Lcom/facebook/drawee/generic/RoundingParams;->v(Z)Lcom/facebook/drawee/generic/RoundingParams;

    .line 615
    .line 616
    .line 617
    if-ne p2, v5, :cond_c

    .line 618
    .line 619
    iget-object v0, p0, Ll/y7x;->h:Lv/VDraweeView;

    .line 620
    .line 621
    invoke-virtual {v0}, Lcom/facebook/drawee/view/DraweeView;->getHierarchy()Ll/mde;

    .line 622
    .line 623
    .line 624
    move-result-object v0

    .line 625
    check-cast v0, Ll/wlj;

    .line 626
    .line 627
    invoke-virtual {v0, v1}, Ll/wlj;->H(Lcom/facebook/drawee/generic/RoundingParams;)V

    .line 628
    .line 629
    .line 630
    goto :goto_4

    .line 631
    :cond_c
    if-ne p2, v4, :cond_d

    .line 632
    .line 633
    iget-object v0, p0, Ll/y7x;->j:Lv/VDraweeView;

    .line 634
    .line 635
    invoke-virtual {v0}, Lcom/facebook/drawee/view/DraweeView;->getHierarchy()Ll/mde;

    .line 636
    .line 637
    .line 638
    move-result-object v0

    .line 639
    check-cast v0, Ll/wlj;

    .line 640
    .line 641
    invoke-virtual {v0, v1}, Ll/wlj;->H(Lcom/facebook/drawee/generic/RoundingParams;)V

    .line 642
    .line 643
    .line 644
    goto :goto_4

    .line 645
    :cond_d
    if-ne p2, v0, :cond_f

    .line 646
    .line 647
    iget-object v0, p0, Ll/y7x;->h:Lv/VDraweeView;

    .line 648
    .line 649
    invoke-virtual {v0}, Lcom/facebook/drawee/view/DraweeView;->getHierarchy()Ll/mde;

    .line 650
    .line 651
    .line 652
    move-result-object v0

    .line 653
    check-cast v0, Ll/wlj;

    .line 654
    .line 655
    invoke-virtual {v0, v1}, Ll/wlj;->H(Lcom/facebook/drawee/generic/RoundingParams;)V

    .line 656
    .line 657
    .line 658
    iget-object v0, p0, Ll/y7x;->j:Lv/VDraweeView;

    .line 659
    .line 660
    invoke-virtual {v0}, Lcom/facebook/drawee/view/DraweeView;->getHierarchy()Ll/mde;

    .line 661
    .line 662
    .line 663
    move-result-object v0

    .line 664
    check-cast v0, Ll/wlj;

    .line 665
    .line 666
    invoke-virtual {v0, v1}, Ll/wlj;->H(Lcom/facebook/drawee/generic/RoundingParams;)V

    .line 667
    .line 668
    .line 669
    goto :goto_4

    .line 670
    :cond_e
    :goto_3
    iget-object v0, p0, Ll/y7x;->N:Lv/VText;

    .line 671
    .line 672
    invoke-static {v2}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 673
    .line 674
    .line 675
    move-result-object v4

    .line 676
    invoke-virtual {v0, v4}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 677
    .line 678
    .line 679
    iget-object v0, p0, Ll/y7x;->N:Lv/VText;

    .line 680
    .line 681
    sget v4, Lcom/p1/mobile/putong/core/R$string;->Sh:I

    .line 682
    .line 683
    invoke-virtual {v0, v4}, Landroid/widget/TextView;->setText(I)V

    .line 684
    .line 685
    .line 686
    iget-object v0, p0, Ll/y7x;->m:Lcom/p1/mobile/putong/core/ui/GradientBgButton;

    .line 687
    .line 688
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 689
    .line 690
    .line 691
    :cond_f
    :goto_4
    invoke-static {}, Lcom/p1/mobile/putong/ab/IntlCountryCodeController;->v()Z

    .line 692
    .line 693
    .line 694
    move-result v0

    .line 695
    if-eqz v0, :cond_16

    .line 696
    .line 697
    iget-object p1, p0, Ll/y7x;->N:Lv/VText;

    .line 698
    .line 699
    invoke-static {v2}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 700
    .line 701
    .line 702
    move-result-object v0

    .line 703
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 704
    .line 705
    .line 706
    const/high16 p1, 0x41f00000    # 30.0f

    .line 707
    .line 708
    invoke-static {p1}, Lcom/facebook/drawee/generic/RoundingParams;->c(F)Lcom/facebook/drawee/generic/RoundingParams;

    .line 709
    .line 710
    .line 711
    move-result-object p1

    .line 712
    const/4 v0, 0x0

    .line 713
    invoke-virtual {p1, v0}, Lcom/facebook/drawee/generic/RoundingParams;->v(Z)Lcom/facebook/drawee/generic/RoundingParams;

    .line 714
    .line 715
    .line 716
    iget-object v1, p0, Ll/y7x;->h:Lv/VDraweeView;

    .line 717
    .line 718
    invoke-virtual {v1}, Lcom/facebook/drawee/view/DraweeView;->getHierarchy()Ll/mde;

    .line 719
    .line 720
    .line 721
    move-result-object v1

    .line 722
    check-cast v1, Ll/wlj;

    .line 723
    .line 724
    invoke-virtual {v1, p1}, Ll/wlj;->H(Lcom/facebook/drawee/generic/RoundingParams;)V

    .line 725
    .line 726
    .line 727
    iget-object v1, p0, Ll/y7x;->j:Lv/VDraweeView;

    .line 728
    .line 729
    invoke-virtual {v1}, Lcom/facebook/drawee/view/DraweeView;->getHierarchy()Ll/mde;

    .line 730
    .line 731
    .line 732
    move-result-object v1

    .line 733
    check-cast v1, Ll/wlj;

    .line 734
    .line 735
    invoke-virtual {v1, p1}, Ll/wlj;->H(Lcom/facebook/drawee/generic/RoundingParams;)V

    .line 736
    .line 737
    .line 738
    iget-object p1, p0, Ll/y7x;->h:Lv/VDraweeView;

    .line 739
    .line 740
    const/high16 v1, -0x3e900000    # -15.0f

    .line 741
    .line 742
    invoke-virtual {p1, v1}, Landroid/view/View;->setRotation(F)V

    .line 743
    .line 744
    .line 745
    iget-object p1, p0, Ll/y7x;->j:Lv/VDraweeView;

    .line 746
    .line 747
    const/high16 v1, 0x41700000    # 15.0f

    .line 748
    .line 749
    invoke-virtual {p1, v1}, Landroid/view/View;->setRotation(F)V

    .line 750
    .line 751
    .line 752
    iget-object p1, p0, Ll/y7x;->z:Landroid/widget/LinearLayout;

    .line 753
    .line 754
    invoke-static {p1, v3}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 755
    .line 756
    .line 757
    iget-object p1, p0, Ll/y7x;->u:Landroid/widget/LinearLayout;

    .line 758
    .line 759
    invoke-static {p1, v0}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 760
    .line 761
    .line 762
    const/16 p1, 0x32

    .line 763
    .line 764
    if-eq p2, p1, :cond_11

    .line 765
    .line 766
    const/16 v1, 0x33

    .line 767
    .line 768
    if-ne p2, v1, :cond_10

    .line 769
    .line 770
    goto :goto_5

    .line 771
    :cond_10
    invoke-virtual {p0}, Ll/y7x;->r0()Lcom/p1/mobile/putong/core/ui/match/MatchAct;

    .line 772
    .line 773
    .line 774
    move-result-object v1

    .line 775
    sget v2, Ll/dbc0;->pv:I

    .line 776
    .line 777
    invoke-static {v1, v2}, Ll/bnl0;->o(Landroid/app/Activity;I)V

    .line 778
    .line 779
    .line 780
    goto :goto_6

    .line 781
    :cond_11
    :goto_5
    iget-object v1, p0, Ll/y7x;->N:Lv/VText;

    .line 782
    .line 783
    const-string v2, "#2E2516"

    .line 784
    .line 785
    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 786
    .line 787
    .line 788
    move-result v4

    .line 789
    invoke-virtual {v1, v4}, Landroid/widget/TextView;->setTextColor(I)V

    .line 790
    .line 791
    .line 792
    iget-object v1, p0, Ll/y7x;->t:Lv/VText_AutoFit;

    .line 793
    .line 794
    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 795
    .line 796
    .line 797
    move-result v4

    .line 798
    invoke-virtual {v1, v4}, Landroid/widget/TextView;->setTextColor(I)V

    .line 799
    .line 800
    .line 801
    invoke-virtual {p0}, Ll/y7x;->r0()Lcom/p1/mobile/putong/core/ui/match/MatchAct;

    .line 802
    .line 803
    .line 804
    move-result-object v1

    .line 805
    sget v4, Ll/dbc0;->mv:I

    .line 806
    .line 807
    invoke-static {v1, v4}, Ll/bnl0;->o(Landroid/app/Activity;I)V

    .line 808
    .line 809
    .line 810
    iget-object v1, p0, Ll/y7x;->B:Lv/VButton;

    .line 811
    .line 812
    sget v4, Ll/dbc0;->nv:I

    .line 813
    .line 814
    invoke-virtual {v1, v4}, Landroid/view/View;->setBackgroundResource(I)V

    .line 815
    .line 816
    .line 817
    iget-object v1, p0, Ll/y7x;->B:Lv/VButton;

    .line 818
    .line 819
    const-string v4, "#F9E7FF"

    .line 820
    .line 821
    invoke-static {v4}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 822
    .line 823
    .line 824
    move-result v4

    .line 825
    invoke-virtual {v1, v4}, Landroid/widget/TextView;->setTextColor(I)V

    .line 826
    .line 827
    .line 828
    iget-object v1, p0, Ll/y7x;->A:Lv/VButton;

    .line 829
    .line 830
    sget v4, Ll/dbc0;->ov:I

    .line 831
    .line 832
    invoke-virtual {v1, v4}, Landroid/view/View;->setBackgroundResource(I)V

    .line 833
    .line 834
    .line 835
    iget-object v1, p0, Ll/y7x;->A:Lv/VButton;

    .line 836
    .line 837
    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 838
    .line 839
    .line 840
    move-result v2

    .line 841
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 842
    .line 843
    .line 844
    :goto_6
    const/16 v1, 0x2f

    .line 845
    .line 846
    const/16 v2, 0x31

    .line 847
    .line 848
    const/16 v4, 0x30

    .line 849
    .line 850
    if-eq p2, v1, :cond_12

    .line 851
    .line 852
    if-eq p2, v4, :cond_12

    .line 853
    .line 854
    if-ne p2, v2, :cond_13

    .line 855
    .line 856
    :cond_12
    iget-object v1, p0, Ll/y7x;->l:Lv/VImage;

    .line 857
    .line 858
    invoke-static {v1, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 859
    .line 860
    .line 861
    invoke-virtual {p0}, Ll/y7x;->T0()V

    .line 862
    .line 863
    .line 864
    :cond_13
    if-eq p2, v4, :cond_15

    .line 865
    .line 866
    if-ne p2, v2, :cond_14

    .line 867
    .line 868
    goto :goto_7

    .line 869
    :cond_14
    if-ne p2, p1, :cond_17

    .line 870
    .line 871
    iget-object p1, p0, Ll/y7x;->B:Lv/VButton;

    .line 872
    .line 873
    new-instance p2, Ll/j7x;

    .line 874
    .line 875
    invoke-direct {p2, p0}, Ll/j7x;-><init>(Ll/y7x;)V

    .line 876
    .line 877
    .line 878
    invoke-static {p1, p2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 879
    .line 880
    .line 881
    iget-object p1, p0, Ll/y7x;->A:Lv/VButton;

    .line 882
    .line 883
    new-instance p2, Ll/k7x;

    .line 884
    .line 885
    invoke-direct {p2, p0}, Ll/k7x;-><init>(Ll/y7x;)V

    .line 886
    .line 887
    .line 888
    invoke-static {p1, p2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 889
    .line 890
    .line 891
    return-void

    .line 892
    :cond_15
    :goto_7
    iget-object p1, p0, Ll/y7x;->z:Landroid/widget/LinearLayout;

    .line 893
    .line 894
    invoke-static {p1, v0}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 895
    .line 896
    .line 897
    iget-object p1, p0, Ll/y7x;->C:Landroid/widget/LinearLayout;

    .line 898
    .line 899
    invoke-static {p1, v3}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 900
    .line 901
    .line 902
    iget-object p1, p0, Ll/y7x;->E:Lv/VButton;

    .line 903
    .line 904
    const/4 p2, 0x3

    .line 905
    invoke-static {p2}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 906
    .line 907
    .line 908
    move-result-object v0

    .line 909
    invoke-virtual {p1, v0, v3}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 910
    .line 911
    .line 912
    iget-object p1, p0, Ll/y7x;->D:Lv/VButton;

    .line 913
    .line 914
    invoke-static {p2}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 915
    .line 916
    .line 917
    move-result-object p2

    .line 918
    invoke-virtual {p1, p2, v3}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 919
    .line 920
    .line 921
    iget-object p1, p0, Ll/y7x;->E:Lv/VButton;

    .line 922
    .line 923
    new-instance p2, Ll/x7x;

    .line 924
    .line 925
    invoke-direct {p2, p0}, Ll/x7x;-><init>(Ll/y7x;)V

    .line 926
    .line 927
    .line 928
    invoke-static {p1, p2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 929
    .line 930
    .line 931
    return-void

    .line 932
    :cond_16
    if-eqz p1, :cond_17

    .line 933
    .line 934
    invoke-virtual {p0}, Ll/y7x;->S0()V

    .line 935
    .line 936
    .line 937
    :cond_17
    return-void
.end method

.method public final synthetic y0(Landroid/animation/ValueAnimator;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    check-cast p1, Ljava/lang/Integer;

    .line 6
    .line 7
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    iget-object v0, p0, Ll/y7x;->G:Landroid/widget/RelativeLayout;

    .line 12
    .line 13
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    check-cast v0, Landroid/widget/RelativeLayout$LayoutParams;

    .line 18
    .line 19
    iput p1, v0, Landroid/widget/RelativeLayout$LayoutParams;->width:I

    .line 20
    .line 21
    iget-object p0, p0, Ll/y7x;->G:Landroid/widget/RelativeLayout;

    .line 22
    .line 23
    invoke-virtual {p0, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public final synthetic z0(Landroid/animation/ValueAnimator;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    check-cast p1, Ljava/lang/Integer;

    .line 6
    .line 7
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    iget-object v0, p0, Ll/y7x;->G:Landroid/widget/RelativeLayout;

    .line 12
    .line 13
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    check-cast v0, Landroid/widget/RelativeLayout$LayoutParams;

    .line 18
    .line 19
    iput p1, v0, Landroid/widget/RelativeLayout$LayoutParams;->width:I

    .line 20
    .line 21
    iget-object p0, p0, Ll/y7x;->G:Landroid/widget/RelativeLayout;

    .line 22
    .line 23
    invoke-virtual {p0, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

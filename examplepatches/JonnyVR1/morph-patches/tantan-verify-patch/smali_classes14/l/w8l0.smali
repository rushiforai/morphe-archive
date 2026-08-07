.class public Ll/w8l0;
.super Ll/jbf0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/jbf0<",
        "Ll/g8l0;",
        "Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/act/VerifyCodeAct;",
        ">;"
    }
.end annotation


# instance fields
.field public c:Lv/VScroll;

.field public d:Lv/VText;

.field public e:Lv/VText;

.field public f:Lv/VText;

.field public g:Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/VerifyCodeView;

.field public h:Lv/VText;

.field public i:Lcom/tantanapp/media/ttmediaeffect/anim/AnimEffectPlayer;

.field public j:Lv/VText;

.field public k:Lv/VText;

.field public l:Landroidx/constraintlayout/widget/ConstraintLayout;

.field public m:Lv/VImage;

.field public n:Lv/VImage;

.field public o:Lv/VText;

.field public p:Lv/VText;

.field public q:Landroid/view/View;

.field public r:Z

.field public s:I


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/act/VerifyCodeAct;)V
    .locals 0
    .param p1    # Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/act/VerifyCodeAct;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1}, Ll/jbf0;-><init>(Lcom/p1/mobile/putong/app/PutongAct;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput-boolean p1, p0, Ll/w8l0;->r:Z

    .line 6
    .line 7
    const/16 p1, 0x3c

    .line 8
    .line 9
    iput p1, p0, Ll/w8l0;->s:I

    .line 10
    .line 11
    return-void
.end method

.method private A()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/w8l0;->g:Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/VerifyCodeView;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/VerifyCodeView;->getText()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    iget-object v0, p0, Ll/w8l0;->g:Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/VerifyCodeView;

    .line 14
    .line 15
    invoke-virtual {v0}, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/VerifyCodeView;->getText()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    const/4 v1, 0x4

    .line 24
    if-lt v0, v1, :cond_0

    .line 25
    .line 26
    const/4 v0, 0x1

    .line 27
    goto :goto_0

    .line 28
    :cond_0
    const/4 v0, 0x0

    .line 29
    :goto_0
    iget-object v1, p0, Ll/w8l0;->k:Lv/VText;

    .line 30
    .line 31
    invoke-virtual {v1, v0}, Landroid/view/View;->setEnabled(Z)V

    .line 32
    .line 33
    .line 34
    iget-object p0, p0, Ll/w8l0;->k:Lv/VText;

    .line 35
    .line 36
    if-eqz v0, :cond_1

    .line 37
    .line 38
    sget v0, Ll/bbc0;->K1:I

    .line 39
    .line 40
    invoke-virtual {p0, v0}, Landroidx/appcompat/widget/AppCompatTextView;->setBackgroundResource(I)V

    .line 41
    .line 42
    .line 43
    return-void

    .line 44
    :cond_1
    sget v0, Ll/bbc0;->t1:I

    .line 45
    .line 46
    invoke-virtual {p0, v0}, Landroidx/appcompat/widget/AppCompatTextView;->setBackgroundResource(I)V

    .line 47
    .line 48
    .line 49
    return-void
.end method

.method private B()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/jbf0;->a:Lcom/p1/mobile/putong/app/PutongAct;

    .line 2
    .line 3
    check-cast v0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/act/VerifyCodeAct;

    .line 4
    .line 5
    new-instance v1, Ll/m8l0;

    .line 6
    .line 7
    invoke-direct {v1, p0}, Ll/m8l0;-><init>(Ll/w8l0;)V

    .line 8
    .line 9
    .line 10
    const-wide/16 v2, 0x96

    .line 11
    .line 12
    invoke-virtual {v0, v1, v2, v3}, Lcom/p1/mobile/android/app/Act;->postDelayed(Ljava/lang/Runnable;J)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method private synthetic K()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/w8l0;->g:Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/VerifyCodeView;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/View;->requestFocus()Z

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Ll/jbf0;->a()Lcom/p1/mobile/putong/app/PutongAct;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    iget-object p0, p0, Ll/w8l0;->g:Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/VerifyCodeView;

    .line 11
    .line 12
    const/4 v1, 0x0

    .line 13
    invoke-virtual {v0, p0, v1}, Lcom/p1/mobile/android/app/Act;->showInput(Landroid/view/View;I)Z

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method private synthetic L(Ljava/lang/Boolean;)V
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
    invoke-direct {p0}, Ll/w8l0;->B()V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method private synthetic M(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jbf0;->a:Lcom/p1/mobile/putong/app/PutongAct;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/act/VerifyCodeAct;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/act/VerifyCodeAct;->onBackPressed()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method private synthetic N(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p1, p0, Ll/jbf0;->a:Lcom/p1/mobile/putong/app/PutongAct;

    .line 2
    .line 3
    check-cast p1, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/act/VerifyCodeAct;

    .line 4
    .line 5
    invoke-virtual {p1}, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/act/VerifyCodeAct;->pageId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    const-string v0, "e_login_verification_code_resend"

    .line 10
    .line 11
    invoke-static {v0, p1}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    iget-object p1, p0, Ll/jbf0;->b:Ll/ibf0;

    .line 15
    .line 16
    check-cast p1, Ll/g8l0;

    .line 17
    .line 18
    const/4 v0, 0x0

    .line 19
    invoke-virtual {p1, v0}, Ll/g8l0;->N1(Lcom/p1/mobile/putong/data/Captcha;)V

    .line 20
    .line 21
    .line 22
    iget-object p0, p0, Ll/w8l0;->h:Lv/VText;

    .line 23
    .line 24
    const/4 p1, 0x0

    .line 25
    invoke-static {p0, p1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method private synthetic O(Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    const/4 v0, 0x0

    .line 6
    if-lez p1, :cond_0

    .line 7
    .line 8
    iget-object p1, p0, Ll/w8l0;->h:Lv/VText;

    .line 9
    .line 10
    invoke-static {p1, v0}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 11
    .line 12
    .line 13
    :cond_0
    invoke-direct {p0}, Ll/w8l0;->A()V

    .line 14
    .line 15
    .line 16
    iget-object p1, p0, Ll/w8l0;->k:Lv/VText;

    .line 17
    .line 18
    invoke-virtual {p1}, Landroid/view/View;->isEnabled()Z

    .line 19
    .line 20
    .line 21
    move-result p1

    .line 22
    if-eqz p1, :cond_1

    .line 23
    .line 24
    invoke-direct {p0}, Ll/w8l0;->V()V

    .line 25
    .line 26
    .line 27
    :cond_1
    iget-object p0, p0, Ll/jbf0;->a:Lcom/p1/mobile/putong/app/PutongAct;

    .line 28
    .line 29
    check-cast p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/act/VerifyCodeAct;

    .line 30
    .line 31
    invoke-virtual {p0}, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/act/VerifyCodeAct;->pageId()Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    new-array p1, v0, [Ll/pf60;

    .line 36
    .line 37
    const-string v0, "e_login_verification_code_input"

    .line 38
    .line 39
    invoke-static {v0, p0, p1}, Ll/i4g0;->v(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 40
    .line 41
    .line 42
    return-void
.end method

.method private synthetic P(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 0

    .line 1
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getAction()I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-nez p1, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Ll/jbf0;->a:Lcom/p1/mobile/putong/app/PutongAct;

    .line 8
    .line 9
    check-cast p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/act/VerifyCodeAct;

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/act/VerifyCodeAct;->pageId()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    const-string p1, "e_login_verification_code_input"

    .line 16
    .line 17
    invoke-static {p1, p0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    :cond_0
    const/4 p0, 0x0

    .line 21
    return p0
.end method

.method private synthetic Q(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p1, p0, Ll/jbf0;->a:Lcom/p1/mobile/putong/app/PutongAct;

    .line 2
    .line 3
    check-cast p1, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/act/VerifyCodeAct;

    .line 4
    .line 5
    invoke-virtual {p1}, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/act/VerifyCodeAct;->pageId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    const-string v0, "e_login_verification_code_change_number"

    .line 10
    .line 11
    invoke-static {v0, p1}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    iget-object p0, p0, Ll/jbf0;->b:Ll/ibf0;

    .line 15
    .line 16
    check-cast p0, Ll/g8l0;

    .line 17
    .line 18
    const-string p1, "change_number"

    .line 19
    .line 20
    invoke-virtual {p0, p1}, Ll/g8l0;->m1(Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method private U()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/w8l0;->j:Lv/VText;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {v0, v1}, Landroid/view/View;->setEnabled(Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Ll/w8l0;->j:Lv/VText;

    .line 8
    .line 9
    iget-object v1, p0, Ll/jbf0;->a:Lcom/p1/mobile/putong/app/PutongAct;

    .line 10
    .line 11
    check-cast v1, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/act/VerifyCodeAct;

    .line 12
    .line 13
    invoke-virtual {v1}, Lcom/p1/mobile/putong/app/PutongAct;->getResources()Landroid/content/res/Resources;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    sget v2, Ll/a9c0;->h:I

    .line 18
    .line 19
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, Ll/jbf0;->a:Lcom/p1/mobile/putong/app/PutongAct;

    .line 27
    .line 28
    check-cast v0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/act/VerifyCodeAct;

    .line 29
    .line 30
    invoke-virtual {p0}, Ll/w8l0;->F()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    iget v2, p0, Ll/w8l0;->s:I

    .line 35
    .line 36
    invoke-static {v1, v2}, Ll/l51;->N(Ljava/lang/String;I)Lrx/c;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    new-instance v1, Ll/v8l0;

    .line 45
    .line 46
    invoke-direct {v1, p0}, Ll/v8l0;-><init>(Ll/w8l0;)V

    .line 47
    .line 48
    .line 49
    new-instance v2, Ll/k8l0;

    .line 50
    .line 51
    invoke-direct {v2}, Ll/k8l0;-><init>()V

    .line 52
    .line 53
    .line 54
    new-instance v3, Ll/l8l0;

    .line 55
    .line 56
    invoke-direct {v3, p0}, Ll/l8l0;-><init>(Ll/w8l0;)V

    .line 57
    .line 58
    .line 59
    invoke-static {v1, v2, v3}, Ll/psd0;->I(Ll/y20;Ll/y20;Ll/x20;)Lcom/p1/mobile/android/rx/a;

    .line 60
    .line 61
    .line 62
    move-result-object p0

    .line 63
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 64
    .line 65
    .line 66
    return-void
.end method

.method private V()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/jbf0;->b:Ll/ibf0;

    .line 2
    .line 3
    check-cast v0, Ll/g8l0;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/g8l0;->n1()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_1

    .line 10
    .line 11
    iget-object v0, p0, Ll/jbf0;->b:Ll/ibf0;

    .line 12
    .line 13
    check-cast v0, Ll/g8l0;

    .line 14
    .line 15
    invoke-virtual {v0}, Ll/g8l0;->o1()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    iget-object v0, p0, Ll/jbf0;->a:Lcom/p1/mobile/putong/app/PutongAct;

    .line 22
    .line 23
    check-cast v0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/act/VerifyCodeAct;

    .line 24
    .line 25
    invoke-virtual {v0}, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/act/VerifyCodeAct;->pageId()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    const-string v1, "e_login_verification_code_continue"

    .line 30
    .line 31
    invoke-static {v1, v0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    iget-object p0, p0, Ll/jbf0;->b:Ll/ibf0;

    .line 35
    .line 36
    check-cast p0, Ll/g8l0;

    .line 37
    .line 38
    invoke-virtual {p0}, Ll/g8l0;->O1()V

    .line 39
    .line 40
    .line 41
    return-void

    .line 42
    :cond_0
    iget-object v0, p0, Ll/jbf0;->b:Ll/ibf0;

    .line 43
    .line 44
    check-cast v0, Ll/g8l0;

    .line 45
    .line 46
    invoke-virtual {v0}, Ll/g8l0;->p1()Z

    .line 47
    .line 48
    .line 49
    move-result v0

    .line 50
    if-eqz v0, :cond_1

    .line 51
    .line 52
    iget-object p0, p0, Ll/jbf0;->b:Ll/ibf0;

    .line 53
    .line 54
    check-cast p0, Ll/g8l0;

    .line 55
    .line 56
    invoke-virtual {p0}, Ll/g8l0;->P1()V

    .line 57
    .line 58
    .line 59
    :cond_1
    return-void
.end method

.method public static synthetic j(Ll/w8l0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/w8l0;->N(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic k(Ll/w8l0;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/w8l0;->L(Ljava/lang/Boolean;)V

    return-void
.end method

.method public static synthetic l(Ll/w8l0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/w8l0;->K()V

    return-void
.end method

.method public static synthetic m(Ll/w8l0;Ljava/lang/Long;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/w8l0;->T(Ljava/lang/Long;)V

    return-void
.end method

.method public static synthetic n(Ll/w8l0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/w8l0;->J(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic p(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic q(Ll/w8l0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/w8l0;->I()V

    return-void
.end method

.method public static synthetic s(Ll/w8l0;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/w8l0;->O(Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic u(Ll/w8l0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/w8l0;->R(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic v(Ll/w8l0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/w8l0;->S()V

    return-void
.end method

.method public static synthetic w(Ll/w8l0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/w8l0;->Q(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic x(Ll/w8l0;Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Ll/w8l0;->P(Landroid/view/View;Landroid/view/MotionEvent;)Z

    move-result p0

    return p0
.end method

.method public static synthetic y(Ll/w8l0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/w8l0;->M(Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public C()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/w8l0;->g:Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/VerifyCodeView;

    .line 2
    .line 3
    const-string v0, ""

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/VerifyCodeView;->setText(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public E()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/w8l0;->g:Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/VerifyCodeView;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/VerifyCodeView;->getText()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-static {p0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public F()Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "account_sign_"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v1, p0, Ll/jbf0;->b:Ll/ibf0;

    .line 9
    .line 10
    check-cast v1, Ll/g8l0;

    .line 11
    .line 12
    iget v1, v1, Ll/g8l0;->f:I

    .line 13
    .line 14
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    iget-object p0, p0, Ll/jbf0;->b:Ll/ibf0;

    .line 18
    .line 19
    check-cast p0, Ll/g8l0;

    .line 20
    .line 21
    iget-object p0, p0, Ll/g8l0;->g:Ljava/lang/String;

    .line 22
    .line 23
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    return-object p0
.end method

.method public G()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/w8l0;->k:Lv/VText;

    .line 2
    .line 3
    new-instance v1, Ll/u8l0;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/u8l0;-><init>(Ll/w8l0;)V

    .line 6
    .line 7
    .line 8
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 9
    .line 10
    .line 11
    invoke-direct {p0}, Ll/w8l0;->A()V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public H()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/w8l0;->r:Z

    .line 2
    .line 3
    return p0
.end method

.method public final synthetic I()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/jbf0;->a:Lcom/p1/mobile/putong/app/PutongAct;

    .line 2
    .line 3
    check-cast v0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/act/VerifyCodeAct;

    .line 4
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
    invoke-virtual {v0}, Landroid/view/View;->getMeasuredHeight()I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    iget-object v1, p0, Ll/w8l0;->l:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 18
    .line 19
    invoke-virtual {v1}, Landroid/view/View;->getMeasuredHeight()I

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    sub-int/2addr v0, v1

    .line 24
    iget-object v1, p0, Ll/w8l0;->c:Lv/VScroll;

    .line 25
    .line 26
    invoke-virtual {v1}, Landroid/view/View;->getHeight()I

    .line 27
    .line 28
    .line 29
    move-result v1

    .line 30
    sub-int/2addr v0, v1

    .line 31
    if-lez v0, :cond_0

    .line 32
    .line 33
    iget-object p0, p0, Ll/w8l0;->c:Lv/VScroll;

    .line 34
    .line 35
    const/4 v1, 0x0

    .line 36
    invoke-virtual {p0, v1, v0}, Landroid/widget/ScrollView;->smoothScrollTo(II)V

    .line 37
    .line 38
    .line 39
    :cond_0
    return-void
.end method

.method public final synthetic J(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/w8l0;->V()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic R(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jbf0;->b:Ll/ibf0;

    .line 2
    .line 3
    check-cast p0, Ll/g8l0;

    .line 4
    .line 5
    const-string p1, "password_login"

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Ll/g8l0;->m1(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final synthetic S()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/w8l0;->j:Lv/VText;

    .line 2
    .line 3
    iget-object v1, p0, Ll/jbf0;->a:Lcom/p1/mobile/putong/app/PutongAct;

    .line 4
    .line 5
    check-cast v1, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/act/VerifyCodeAct;

    .line 6
    .line 7
    invoke-virtual {v1}, Lcom/p1/mobile/putong/app/PutongAct;->getResources()Landroid/content/res/Resources;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    sget v2, Ll/a9c0;->j:I

    .line 12
    .line 13
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Ll/w8l0;->j:Lv/VText;

    .line 21
    .line 22
    const/4 v1, 0x1

    .line 23
    invoke-virtual {v0, v1}, Landroid/view/View;->setEnabled(Z)V

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, Ll/w8l0;->j:Lv/VText;

    .line 27
    .line 28
    invoke-virtual {p0}, Ll/jbf0;->a()Lcom/p1/mobile/putong/app/PutongAct;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    sget v1, Lcom/p1/mobile/putong/account/R$string;->U3:I

    .line 33
    .line 34
    invoke-virtual {p0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method public final synthetic T(Ljava/lang/Long;)V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/w8l0;->j:Lv/VText;

    .line 2
    .line 3
    new-instance v1, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Ll/jbf0;->a()Lcom/p1/mobile/putong/app/PutongAct;

    .line 9
    .line 10
    .line 11
    move-result-object v2

    .line 12
    sget v3, Lcom/p1/mobile/putong/account/R$string;->U3:I

    .line 13
    .line 14
    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v2

    .line 18
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    const-string v2, " "

    .line 22
    .line 23
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    iget p0, p0, Ll/w8l0;->s:I

    .line 27
    .line 28
    int-to-long v2, p0

    .line 29
    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    .line 30
    .line 31
    .line 32
    move-result-wide p0

    .line 33
    sub-long/2addr v2, p0

    .line 34
    const-wide/16 p0, 0x1

    .line 35
    .line 36
    sub-long/2addr v2, p0

    .line 37
    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 38
    .line 39
    .line 40
    const-string p0, "s"

    .line 41
    .line 42
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 43
    .line 44
    .line 45
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 50
    .line 51
    .line 52
    return-void
.end method

.method public W()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/w8l0;->Z()V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Ll/w8l0;->U()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public X(Ljava/lang/Throwable;)Z
    .locals 4

    .line 1
    instance-of v0, p1, Lcom/p1/mobile/putong/api/api/TantanException$Client$AccountService;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_2

    .line 5
    .line 6
    check-cast p1, Lcom/p1/mobile/putong/api/api/TantanException$Client$AccountService;

    .line 7
    .line 8
    iget-object v0, p0, Ll/w8l0;->h:Lv/VText;

    .line 9
    .line 10
    const/4 v2, 0x1

    .line 11
    invoke-static {v0, v2}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Ll/w8l0;->g:Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/VerifyCodeView;

    .line 15
    .line 16
    const-string v3, ""

    .line 17
    .line 18
    invoke-virtual {v0, v3}, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/VerifyCodeView;->setText(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    iget p1, p1, Lcom/p1/mobile/putong/api/api/TantanException$Client$AccountService;->code:I

    .line 22
    .line 23
    const v0, 0x9c4a

    .line 24
    .line 25
    .line 26
    if-eq p1, v0, :cond_1

    .line 27
    .line 28
    const v0, 0x61af2

    .line 29
    .line 30
    .line 31
    if-eq p1, v0, :cond_0

    .line 32
    .line 33
    packed-switch p1, :pswitch_data_0

    .line 34
    .line 35
    .line 36
    iget-object p0, p0, Ll/w8l0;->h:Lv/VText;

    .line 37
    .line 38
    invoke-static {p0, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 39
    .line 40
    .line 41
    goto :goto_0

    .line 42
    :pswitch_0
    iget-object p0, p0, Ll/w8l0;->h:Lv/VText;

    .line 43
    .line 44
    sget p1, Lcom/p1/mobile/putong/account/R$string;->X:I

    .line 45
    .line 46
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(I)V

    .line 47
    .line 48
    .line 49
    return v2

    .line 50
    :pswitch_1
    iget-object p0, p0, Ll/w8l0;->h:Lv/VText;

    .line 51
    .line 52
    sget p1, Lcom/p1/mobile/putong/account/R$string;->a0:I

    .line 53
    .line 54
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(I)V

    .line 55
    .line 56
    .line 57
    return v2

    .line 58
    :pswitch_2
    iget-object p0, p0, Ll/w8l0;->h:Lv/VText;

    .line 59
    .line 60
    sget p1, Lcom/p1/mobile/putong/account/R$string;->Y:I

    .line 61
    .line 62
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(I)V

    .line 63
    .line 64
    .line 65
    return v2

    .line 66
    :cond_0
    iget-object p0, p0, Ll/jbf0;->b:Ll/ibf0;

    .line 67
    .line 68
    check-cast p0, Ll/g8l0;

    .line 69
    .line 70
    const-string p1, "show_captcha"

    .line 71
    .line 72
    invoke-virtual {p0, p1}, Ll/g8l0;->m1(Ljava/lang/String;)V

    .line 73
    .line 74
    .line 75
    return v2

    .line 76
    :cond_1
    iget-object p0, p0, Ll/w8l0;->h:Lv/VText;

    .line 77
    .line 78
    sget p1, Lcom/p1/mobile/putong/account/R$string;->Z:I

    .line 79
    .line 80
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(I)V

    .line 81
    .line 82
    .line 83
    return v2

    .line 84
    :cond_2
    :goto_0
    return v1

    .line 85
    :pswitch_data_0
    .packed-switch 0x9c4d
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public Y()V
    .locals 3

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Ll/w8l0;->r:Z

    .line 3
    .line 4
    iget-object v0, p0, Ll/w8l0;->i:Lcom/tantanapp/media/ttmediaeffect/anim/AnimEffectPlayer;

    .line 5
    .line 6
    new-instance v1, Ll/w8l0$a;

    .line 7
    .line 8
    invoke-direct {v1, p0}, Ll/w8l0$a;-><init>(Ll/w8l0;)V

    .line 9
    .line 10
    .line 11
    const-string p0, "account_loading_progress.svga"

    .line 12
    .line 13
    const/4 v2, -0x1

    .line 14
    invoke-virtual {v0, p0, v2, v1}, Lcom/immomo/svgaplayer/view/MomoSVGAImageView;->startSVGAAnimWithListener(Ljava/lang/String;ILcom/immomo/svgaplayer/SVGAAnimListenerAdapter;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public Z()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Ll/w8l0;->r:Z

    .line 3
    .line 4
    iget-object p0, p0, Ll/w8l0;->i:Lcom/tantanapp/media/ttmediaeffect/anim/AnimEffectPlayer;

    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/immomo/svgaplayer/view/MomoSVGAImageView;->stopAnimCompletely()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/w8l0;->z(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iput-object p1, p0, Ll/w8l0;->q:Landroid/view/View;

    .line 6
    .line 7
    iget-object p1, p0, Ll/w8l0;->g:Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/VerifyCodeView;

    .line 8
    .line 9
    iget-object p2, p0, Ll/jbf0;->b:Ll/ibf0;

    .line 10
    .line 11
    check-cast p2, Ll/g8l0;

    .line 12
    .line 13
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/VerifyCodeView;->setPresenter(Ll/g8l0;)V

    .line 14
    .line 15
    .line 16
    iget-object p0, p0, Ll/w8l0;->q:Landroid/view/View;

    .line 17
    .line 18
    return-object p0
.end method

.method public r()V
    .locals 6
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "ClickableViewAccessibility"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/jbf0;->a:Lcom/p1/mobile/putong/app/PutongAct;

    .line 2
    .line 3
    check-cast v0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/act/VerifyCodeAct;

    .line 4
    .line 5
    const/16 v1, 0x7530

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->lmdStart(I)V

    .line 8
    .line 9
    .line 10
    sget-object v0, Lv/VLinear;->b:Lv/VLinear$a;

    .line 11
    .line 12
    invoke-virtual {v0}, Lv/VLinear$a;->c()V

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Ll/w8l0;->o:Lv/VText;

    .line 16
    .line 17
    sget-object v1, Lcom/p1/mobile/putong/account/AccountModule;->c:Lcom/p1/mobile/putong/account/api/a;

    .line 18
    .line 19
    iget-boolean v1, v1, Lcom/p1/mobile/putong/account/api/a;->n:Z

    .line 20
    .line 21
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 22
    .line 23
    .line 24
    iget-object v0, p0, Ll/w8l0;->p:Lv/VText;

    .line 25
    .line 26
    const/4 v1, 0x0

    .line 27
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 28
    .line 29
    .line 30
    iget-object v0, p0, Ll/w8l0;->f:Lv/VText;

    .line 31
    .line 32
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {p0}, Ll/jbf0;->a()Lcom/p1/mobile/putong/app/PutongAct;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    new-instance v2, Ll/j8l0;

    .line 40
    .line 41
    invoke-direct {v2, p0}, Ll/j8l0;-><init>(Ll/w8l0;)V

    .line 42
    .line 43
    .line 44
    const-wide/16 v3, 0x64

    .line 45
    .line 46
    invoke-static {v0, v2, v3, v4}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 47
    .line 48
    .line 49
    iget-object v0, p0, Ll/jbf0;->b:Ll/ibf0;

    .line 50
    .line 51
    check-cast v0, Ll/g8l0;

    .line 52
    .line 53
    iget-object v2, p0, Ll/w8l0;->q:Landroid/view/View;

    .line 54
    .line 55
    invoke-static {v2}, Lcom/p1/mobile/android/app/Act;->keyboardListenerObservable(Landroid/view/View;)Lrx/c;

    .line 56
    .line 57
    .line 58
    move-result-object v2

    .line 59
    invoke-virtual {v0, v2}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    invoke-virtual {v0}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    new-instance v2, Ll/n8l0;

    .line 68
    .line 69
    invoke-direct {v2, p0}, Ll/n8l0;-><init>(Ll/w8l0;)V

    .line 70
    .line 71
    .line 72
    invoke-static {v2}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 73
    .line 74
    .line 75
    move-result-object v2

    .line 76
    invoke-virtual {v0, v2}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 77
    .line 78
    .line 79
    invoke-virtual {p0}, Ll/w8l0;->G()V

    .line 80
    .line 81
    .line 82
    iget-object v0, p0, Ll/w8l0;->m:Lv/VImage;

    .line 83
    .line 84
    new-instance v2, Ll/o8l0;

    .line 85
    .line 86
    invoke-direct {v2, p0}, Ll/o8l0;-><init>(Ll/w8l0;)V

    .line 87
    .line 88
    .line 89
    invoke-static {v0, v2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 90
    .line 91
    .line 92
    invoke-virtual {p0}, Ll/w8l0;->F()Ljava/lang/String;

    .line 93
    .line 94
    .line 95
    move-result-object v0

    .line 96
    invoke-static {v0}, Ll/l51;->B(Ljava/lang/String;)Z

    .line 97
    .line 98
    .line 99
    move-result v0

    .line 100
    if-eqz v0, :cond_0

    .line 101
    .line 102
    invoke-direct {p0}, Ll/w8l0;->U()V

    .line 103
    .line 104
    .line 105
    goto :goto_0

    .line 106
    :cond_0
    iget-object v0, p0, Ll/w8l0;->j:Lv/VText;

    .line 107
    .line 108
    iget-object v2, p0, Ll/jbf0;->a:Lcom/p1/mobile/putong/app/PutongAct;

    .line 109
    .line 110
    check-cast v2, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/act/VerifyCodeAct;

    .line 111
    .line 112
    invoke-virtual {v2}, Lcom/p1/mobile/putong/app/PutongAct;->getResources()Landroid/content/res/Resources;

    .line 113
    .line 114
    .line 115
    move-result-object v2

    .line 116
    sget v3, Ll/a9c0;->j:I

    .line 117
    .line 118
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getColor(I)I

    .line 119
    .line 120
    .line 121
    move-result v2

    .line 122
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 123
    .line 124
    .line 125
    iget-object v0, p0, Ll/w8l0;->j:Lv/VText;

    .line 126
    .line 127
    const/4 v2, 0x1

    .line 128
    invoke-virtual {v0, v2}, Landroid/view/View;->setEnabled(Z)V

    .line 129
    .line 130
    .line 131
    iget-object v0, p0, Ll/w8l0;->j:Lv/VText;

    .line 132
    .line 133
    invoke-virtual {p0}, Ll/jbf0;->a()Lcom/p1/mobile/putong/app/PutongAct;

    .line 134
    .line 135
    .line 136
    move-result-object v2

    .line 137
    sget v3, Lcom/p1/mobile/putong/account/R$string;->U3:I

    .line 138
    .line 139
    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 140
    .line 141
    .line 142
    move-result-object v2

    .line 143
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 144
    .line 145
    .line 146
    :goto_0
    iget-object v0, p0, Ll/jbf0;->b:Ll/ibf0;

    .line 147
    .line 148
    check-cast v0, Ll/g8l0;

    .line 149
    .line 150
    invoke-virtual {v0}, Ll/g8l0;->p1()Z

    .line 151
    .line 152
    .line 153
    move-result v0

    .line 154
    if-eqz v0, :cond_1

    .line 155
    .line 156
    iget-object v0, p0, Ll/w8l0;->d:Lv/VText;

    .line 157
    .line 158
    sget v2, Lcom/p1/mobile/putong/account/R$string;->v3:I

    .line 159
    .line 160
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(I)V

    .line 161
    .line 162
    .line 163
    iget-object v0, p0, Ll/w8l0;->f:Lv/VText;

    .line 164
    .line 165
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 166
    .line 167
    .line 168
    :cond_1
    iget-object v0, p0, Ll/w8l0;->j:Lv/VText;

    .line 169
    .line 170
    new-instance v1, Ll/p8l0;

    .line 171
    .line 172
    invoke-direct {v1, p0}, Ll/p8l0;-><init>(Ll/w8l0;)V

    .line 173
    .line 174
    .line 175
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 176
    .line 177
    .line 178
    iget-object v0, p0, Ll/w8l0;->e:Lv/VText;

    .line 179
    .line 180
    new-instance v1, Ljava/lang/StringBuilder;

    .line 181
    .line 182
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 183
    .line 184
    .line 185
    iget-object v2, p0, Ll/jbf0;->a:Lcom/p1/mobile/putong/app/PutongAct;

    .line 186
    .line 187
    check-cast v2, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/act/VerifyCodeAct;

    .line 188
    .line 189
    sget v3, Lcom/p1/mobile/putong/account/R$string;->k2:I

    .line 190
    .line 191
    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 192
    .line 193
    .line 194
    move-result-object v2

    .line 195
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 196
    .line 197
    .line 198
    const-string v2, " "

    .line 199
    .line 200
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 201
    .line 202
    .line 203
    iget-object v3, p0, Ll/jbf0;->b:Ll/ibf0;

    .line 204
    .line 205
    check-cast v3, Ll/g8l0;

    .line 206
    .line 207
    iget-object v3, v3, Ll/g8l0;->g:Ljava/lang/String;

    .line 208
    .line 209
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 210
    .line 211
    .line 212
    const-string v3, ""

    .line 213
    .line 214
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 215
    .line 216
    .line 217
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 218
    .line 219
    .line 220
    move-result-object v1

    .line 221
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 222
    .line 223
    .line 224
    iget-object v0, p0, Ll/w8l0;->f:Lv/VText;

    .line 225
    .line 226
    new-instance v1, Ljava/lang/StringBuilder;

    .line 227
    .line 228
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 229
    .line 230
    .line 231
    iget-object v4, p0, Ll/jbf0;->a:Lcom/p1/mobile/putong/app/PutongAct;

    .line 232
    .line 233
    check-cast v4, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/act/VerifyCodeAct;

    .line 234
    .line 235
    sget v5, Lcom/p1/mobile/putong/account/R$string;->l2:I

    .line 236
    .line 237
    invoke-virtual {v4, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 238
    .line 239
    .line 240
    move-result-object v4

    .line 241
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 242
    .line 243
    .line 244
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 245
    .line 246
    .line 247
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 248
    .line 249
    .line 250
    move-result-object v1

    .line 251
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 252
    .line 253
    .line 254
    iget-object v0, p0, Ll/w8l0;->g:Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/VerifyCodeView;

    .line 255
    .line 256
    invoke-virtual {v0, v3}, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/VerifyCodeView;->setText(Ljava/lang/String;)V

    .line 257
    .line 258
    .line 259
    iget-object v0, p0, Ll/w8l0;->g:Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/VerifyCodeView;

    .line 260
    .line 261
    new-instance v1, Ll/q8l0;

    .line 262
    .line 263
    invoke-direct {v1, p0}, Ll/q8l0;-><init>(Ll/w8l0;)V

    .line 264
    .line 265
    .line 266
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/VerifyCodeView;->setTextChangeListener(Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/VerifyCodeView$a;)V

    .line 267
    .line 268
    .line 269
    iget-object v0, p0, Ll/w8l0;->g:Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/VerifyCodeView;

    .line 270
    .line 271
    new-instance v1, Ll/r8l0;

    .line 272
    .line 273
    invoke-direct {v1, p0}, Ll/r8l0;-><init>(Ll/w8l0;)V

    .line 274
    .line 275
    .line 276
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 277
    .line 278
    .line 279
    iget-object v0, p0, Ll/w8l0;->f:Lv/VText;

    .line 280
    .line 281
    new-instance v1, Ll/s8l0;

    .line 282
    .line 283
    invoke-direct {v1, p0}, Ll/s8l0;-><init>(Ll/w8l0;)V

    .line 284
    .line 285
    .line 286
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 287
    .line 288
    .line 289
    iget-object v0, p0, Ll/w8l0;->o:Lv/VText;

    .line 290
    .line 291
    new-instance v1, Ll/t8l0;

    .line 292
    .line 293
    invoke-direct {v1, p0}, Ll/t8l0;-><init>(Ll/w8l0;)V

    .line 294
    .line 295
    .line 296
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 297
    .line 298
    .line 299
    return-void
.end method

.method public z(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/x8l0;->b(Ll/w8l0;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

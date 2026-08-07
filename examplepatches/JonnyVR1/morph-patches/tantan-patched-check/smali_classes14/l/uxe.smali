.class public Ll/uxe;
.super Ll/jbf0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/jbf0<",
        "Ll/gxe;",
        "Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/act/EmailVerifyCodeAct;",
        ">;"
    }
.end annotation


# instance fields
.field public c:Lv/VScroll;

.field public d:Lv/VText;

.field public e:Lv/VText;

.field public f:Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/EmailVerifyCodeView;

.field public g:Lv/VText;

.field public h:Lcom/tantanapp/media/ttmediaeffect/anim/AnimEffectPlayer;

.field public i:Lv/VText;

.field public j:Landroidx/constraintlayout/widget/ConstraintLayout;

.field public k:Lv/VImage;

.field public l:Lv/VText;

.field public m:Landroid/view/View;

.field public n:Z

.field public o:I


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/act/EmailVerifyCodeAct;)V
    .locals 0
    .param p1    # Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/act/EmailVerifyCodeAct;
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
    iput-boolean p1, p0, Ll/uxe;->n:Z

    .line 6
    .line 7
    const/16 p1, 0x3c

    .line 8
    .line 9
    iput p1, p0, Ll/uxe;->o:I

    .line 10
    .line 11
    return-void
.end method

.method private synthetic G(Ljava/lang/Boolean;)V
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
    invoke-direct {p0}, Ll/uxe;->y()V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method private synthetic H(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jbf0;->a:Lcom/p1/mobile/putong/app/PutongAct;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/act/EmailVerifyCodeAct;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/act/EmailVerifyCodeAct;->onBackPressed()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method private synthetic I(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p1, p0, Ll/jbf0;->a:Lcom/p1/mobile/putong/app/PutongAct;

    .line 2
    .line 3
    check-cast p1, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/act/EmailVerifyCodeAct;

    .line 4
    .line 5
    invoke-virtual {p1}, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/act/EmailVerifyCodeAct;->pageId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    const-string v0, "e_intl_email_verification_code_resend_button"

    .line 10
    .line 11
    invoke-static {v0, p1}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0}, Ll/uxe;->z()V

    .line 15
    .line 16
    .line 17
    iget-object p1, p0, Ll/jbf0;->b:Ll/ibf0;

    .line 18
    .line 19
    check-cast p1, Ll/gxe;

    .line 20
    .line 21
    const/4 v0, 0x0

    .line 22
    invoke-virtual {p1, v0}, Ll/gxe;->x1(Lcom/p1/mobile/putong/data/Captcha;)V

    .line 23
    .line 24
    .line 25
    iget-object p0, p0, Ll/uxe;->g:Lv/VText;

    .line 26
    .line 27
    const/4 p1, 0x0

    .line 28
    invoke-static {p0, p1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method private P()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/jbf0;->b:Ll/ibf0;

    .line 2
    .line 3
    check-cast v0, Ll/gxe;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/gxe;->h1()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Ll/jbf0;->a:Lcom/p1/mobile/putong/app/PutongAct;

    .line 12
    .line 13
    check-cast v0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/act/EmailVerifyCodeAct;

    .line 14
    .line 15
    invoke-virtual {v0}, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/act/EmailVerifyCodeAct;->pageId()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    const-string v1, "e_intl_email_verification_code_resend_button"

    .line 20
    .line 21
    invoke-static {v1, v0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    iget-object p0, p0, Ll/jbf0;->b:Ll/ibf0;

    .line 25
    .line 26
    check-cast p0, Ll/gxe;

    .line 27
    .line 28
    invoke-virtual {p0}, Ll/gxe;->z1()V

    .line 29
    .line 30
    .line 31
    :cond_0
    return-void
.end method

.method public static synthetic j(Ll/uxe;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/uxe;->J(Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic k(Ll/uxe;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/uxe;->I(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic l(Ll/uxe;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/uxe;->F()V

    return-void
.end method

.method public static synthetic m(Ll/uxe;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/uxe;->M()V

    return-void
.end method

.method public static synthetic n(Ll/uxe;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/uxe;->H(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic p(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic q(Ll/uxe;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/uxe;->E()V

    return-void
.end method

.method public static synthetic s(Ll/uxe;Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/uxe;->K(Landroid/view/View;Landroid/view/MotionEvent;)Z

    move-result p0

    return p0
.end method

.method public static synthetic u(Ll/uxe;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/uxe;->L(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic v(Ll/uxe;Ljava/lang/Long;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/uxe;->N(Ljava/lang/Long;)V

    return-void
.end method

.method public static synthetic w(Ll/uxe;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/uxe;->G(Ljava/lang/Boolean;)V

    return-void
.end method

.method private y()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/jbf0;->a:Lcom/p1/mobile/putong/app/PutongAct;

    .line 2
    .line 3
    check-cast v0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/act/EmailVerifyCodeAct;

    .line 4
    .line 5
    new-instance v1, Ll/kxe;

    .line 6
    .line 7
    invoke-direct {v1, p0}, Ll/kxe;-><init>(Ll/uxe;)V

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


# virtual methods
.method public A()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/uxe;->f:Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/EmailVerifyCodeView;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/EmailVerifyCodeView;->getText()Ljava/lang/String;

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

.method public B()Ljava/lang/String;
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
    iget-object p0, p0, Ll/jbf0;->b:Ll/ibf0;

    .line 9
    .line 10
    check-cast p0, Ll/gxe;

    .line 11
    .line 12
    iget-object p0, p0, Ll/gxe;->f:Ljava/lang/String;

    .line 13
    .line 14
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    return-object p0
.end method

.method public C()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/uxe;->n:Z

    .line 2
    .line 3
    return p0
.end method

.method public final synthetic E()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/jbf0;->a:Lcom/p1/mobile/putong/app/PutongAct;

    .line 2
    .line 3
    check-cast v0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/act/EmailVerifyCodeAct;

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
    iget-object v1, p0, Ll/uxe;->j:Landroidx/constraintlayout/widget/ConstraintLayout;

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
    iget-object v1, p0, Ll/uxe;->c:Lv/VScroll;

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
    iget-object p0, p0, Ll/uxe;->c:Lv/VScroll;

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

.method public final synthetic F()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/uxe;->f:Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/EmailVerifyCodeView;

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
    iget-object p0, p0, Ll/uxe;->f:Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/EmailVerifyCodeView;

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

.method public final synthetic J(Ljava/lang/String;)V
    .locals 2

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
    iget-object p1, p0, Ll/uxe;->g:Lv/VText;

    .line 9
    .line 10
    invoke-static {p1, v0}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 11
    .line 12
    .line 13
    :cond_0
    iget-object p1, p0, Ll/uxe;->f:Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/EmailVerifyCodeView;

    .line 14
    .line 15
    invoke-virtual {p1}, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/EmailVerifyCodeView;->getText()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 20
    .line 21
    .line 22
    move-result p1

    .line 23
    if-nez p1, :cond_1

    .line 24
    .line 25
    iget-object p1, p0, Ll/uxe;->f:Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/EmailVerifyCodeView;

    .line 26
    .line 27
    invoke-virtual {p1}, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/EmailVerifyCodeView;->getText()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 32
    .line 33
    .line 34
    move-result p1

    .line 35
    const/4 v1, 0x4

    .line 36
    if-lt p1, v1, :cond_1

    .line 37
    .line 38
    invoke-direct {p0}, Ll/uxe;->P()V

    .line 39
    .line 40
    .line 41
    :cond_1
    iget-object p0, p0, Ll/jbf0;->a:Lcom/p1/mobile/putong/app/PutongAct;

    .line 42
    .line 43
    check-cast p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/act/EmailVerifyCodeAct;

    .line 44
    .line 45
    invoke-virtual {p0}, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/act/EmailVerifyCodeAct;->pageId()Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    new-array p1, v0, [Ll/pf60;

    .line 50
    .line 51
    const-string v0, "e_login_verification_code_input"

    .line 52
    .line 53
    invoke-static {v0, p0, p1}, Ll/i4g0;->v(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 54
    .line 55
    .line 56
    return-void
.end method

.method public final synthetic K(Landroid/view/View;Landroid/view/MotionEvent;)Z
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
    check-cast p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/act/EmailVerifyCodeAct;

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/act/EmailVerifyCodeAct;->pageId()Ljava/lang/String;

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

.method public final synthetic L(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p1, p0, Ll/jbf0;->a:Lcom/p1/mobile/putong/app/PutongAct;

    .line 2
    .line 3
    check-cast p1, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/act/EmailVerifyCodeAct;

    .line 4
    .line 5
    invoke-virtual {p1}, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/act/EmailVerifyCodeAct;->pageId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    const-string v0, "e_intl_email_log_in_with_password_button"

    .line 10
    .line 11
    invoke-static {v0, p1}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    iget-object p0, p0, Ll/jbf0;->b:Ll/ibf0;

    .line 15
    .line 16
    check-cast p0, Ll/gxe;

    .line 17
    .line 18
    const-string p1, "password_login"

    .line 19
    .line 20
    invoke-virtual {p0, p1}, Ll/gxe;->f1(Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public final synthetic M()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/uxe;->i:Lv/VText;

    .line 2
    .line 3
    iget-object v1, p0, Ll/jbf0;->a:Lcom/p1/mobile/putong/app/PutongAct;

    .line 4
    .line 5
    check-cast v1, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/act/EmailVerifyCodeAct;

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
    iget-object v0, p0, Ll/uxe;->i:Lv/VText;

    .line 21
    .line 22
    const/4 v1, 0x1

    .line 23
    invoke-virtual {v0, v1}, Landroid/view/View;->setEnabled(Z)V

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, Ll/uxe;->i:Lv/VText;

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

.method public final synthetic N(Ljava/lang/Long;)V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/uxe;->i:Lv/VText;

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
    iget p0, p0, Ll/uxe;->o:I

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

.method public final O()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/uxe;->i:Lv/VText;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {v0, v1}, Landroid/view/View;->setEnabled(Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Ll/uxe;->i:Lv/VText;

    .line 8
    .line 9
    iget-object v1, p0, Ll/jbf0;->a:Lcom/p1/mobile/putong/app/PutongAct;

    .line 10
    .line 11
    check-cast v1, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/act/EmailVerifyCodeAct;

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
    check-cast v0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/act/EmailVerifyCodeAct;

    .line 29
    .line 30
    invoke-virtual {p0}, Ll/uxe;->B()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    iget v2, p0, Ll/uxe;->o:I

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
    new-instance v1, Ll/jxe;

    .line 45
    .line 46
    invoke-direct {v1, p0}, Ll/jxe;-><init>(Ll/uxe;)V

    .line 47
    .line 48
    .line 49
    new-instance v2, Ll/lxe;

    .line 50
    .line 51
    invoke-direct {v2}, Ll/lxe;-><init>()V

    .line 52
    .line 53
    .line 54
    new-instance v3, Ll/mxe;

    .line 55
    .line 56
    invoke-direct {v3, p0}, Ll/mxe;-><init>(Ll/uxe;)V

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

.method public Q()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/uxe;->T()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/uxe;->O()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public R(Ljava/lang/Throwable;)Z
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
    iget-object v0, p0, Ll/uxe;->g:Lv/VText;

    .line 9
    .line 10
    const/4 v2, 0x1

    .line 11
    invoke-static {v0, v2}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Ll/uxe;->f:Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/EmailVerifyCodeView;

    .line 15
    .line 16
    const-string v3, ""

    .line 17
    .line 18
    invoke-virtual {v0, v3}, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/EmailVerifyCodeView;->setText(Ljava/lang/String;)V

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
    iget-object p0, p0, Ll/uxe;->g:Lv/VText;

    .line 37
    .line 38
    invoke-static {p0, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 39
    .line 40
    .line 41
    goto :goto_0

    .line 42
    :pswitch_0
    iget-object p0, p0, Ll/uxe;->g:Lv/VText;

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
    iget-object p0, p0, Ll/uxe;->g:Lv/VText;

    .line 51
    .line 52
    sget p1, Lcom/p1/mobile/putong/account/R$string;->Z1:I

    .line 53
    .line 54
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(I)V

    .line 55
    .line 56
    .line 57
    return v2

    .line 58
    :pswitch_2
    iget-object p0, p0, Ll/uxe;->g:Lv/VText;

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
    check-cast p0, Ll/gxe;

    .line 69
    .line 70
    const-string p1, "show_captcha"

    .line 71
    .line 72
    invoke-virtual {p0, p1}, Ll/gxe;->f1(Ljava/lang/String;)V

    .line 73
    .line 74
    .line 75
    return v2

    .line 76
    :cond_1
    iget-object p0, p0, Ll/uxe;->g:Lv/VText;

    .line 77
    .line 78
    sget p1, Lcom/p1/mobile/putong/account/R$string;->j2:I

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

.method public S()V
    .locals 3

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Ll/uxe;->n:Z

    .line 3
    .line 4
    iget-object v0, p0, Ll/uxe;->h:Lcom/tantanapp/media/ttmediaeffect/anim/AnimEffectPlayer;

    .line 5
    .line 6
    new-instance v1, Ll/uxe$a;

    .line 7
    .line 8
    invoke-direct {v1, p0}, Ll/uxe$a;-><init>(Ll/uxe;)V

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

.method public T()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Ll/uxe;->n:Z

    .line 3
    .line 4
    iget-object p0, p0, Ll/uxe;->h:Lcom/tantanapp/media/ttmediaeffect/anim/AnimEffectPlayer;

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
    invoke-virtual {p0, p1, p2}, Ll/uxe;->x(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iput-object p1, p0, Ll/uxe;->m:Landroid/view/View;

    .line 6
    .line 7
    iget-object p1, p0, Ll/uxe;->f:Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/EmailVerifyCodeView;

    .line 8
    .line 9
    iget-object p2, p0, Ll/jbf0;->b:Ll/ibf0;

    .line 10
    .line 11
    check-cast p2, Ll/gxe;

    .line 12
    .line 13
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/EmailVerifyCodeView;->setPresenter(Ll/gxe;)V

    .line 14
    .line 15
    .line 16
    iget-object p0, p0, Ll/uxe;->m:Landroid/view/View;

    .line 17
    .line 18
    return-object p0
.end method

.method public r()V
    .locals 4
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "ClickableViewAccessibility"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/jbf0;->a:Lcom/p1/mobile/putong/app/PutongAct;

    .line 2
    .line 3
    check-cast v0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/act/EmailVerifyCodeAct;

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
    invoke-virtual {p0}, Ll/jbf0;->a()Lcom/p1/mobile/putong/app/PutongAct;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    new-instance v1, Ll/nxe;

    .line 20
    .line 21
    invoke-direct {v1, p0}, Ll/nxe;-><init>(Ll/uxe;)V

    .line 22
    .line 23
    .line 24
    const-wide/16 v2, 0x64

    .line 25
    .line 26
    invoke-static {v0, v1, v2, v3}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 27
    .line 28
    .line 29
    iget-object v0, p0, Ll/jbf0;->b:Ll/ibf0;

    .line 30
    .line 31
    check-cast v0, Ll/gxe;

    .line 32
    .line 33
    iget-object v1, p0, Ll/uxe;->m:Landroid/view/View;

    .line 34
    .line 35
    invoke-static {v1}, Lcom/p1/mobile/android/app/Act;->keyboardListenerObservable(Landroid/view/View;)Lrx/c;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    invoke-virtual {v0, v1}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    invoke-virtual {v0}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    new-instance v1, Ll/oxe;

    .line 48
    .line 49
    invoke-direct {v1, p0}, Ll/oxe;-><init>(Ll/uxe;)V

    .line 50
    .line 51
    .line 52
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 53
    .line 54
    .line 55
    move-result-object v1

    .line 56
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 57
    .line 58
    .line 59
    iget-object v0, p0, Ll/uxe;->k:Lv/VImage;

    .line 60
    .line 61
    new-instance v1, Ll/pxe;

    .line 62
    .line 63
    invoke-direct {v1, p0}, Ll/pxe;-><init>(Ll/uxe;)V

    .line 64
    .line 65
    .line 66
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 67
    .line 68
    .line 69
    invoke-virtual {p0}, Ll/uxe;->B()Ljava/lang/String;

    .line 70
    .line 71
    .line 72
    move-result-object v0

    .line 73
    invoke-static {v0}, Ll/l51;->B(Ljava/lang/String;)Z

    .line 74
    .line 75
    .line 76
    move-result v0

    .line 77
    if-eqz v0, :cond_0

    .line 78
    .line 79
    iget-object v0, p0, Ll/jbf0;->b:Ll/ibf0;

    .line 80
    .line 81
    check-cast v0, Ll/gxe;

    .line 82
    .line 83
    invoke-virtual {v0}, Ll/gxe;->k1()Z

    .line 84
    .line 85
    .line 86
    move-result v0

    .line 87
    if-nez v0, :cond_0

    .line 88
    .line 89
    invoke-virtual {p0}, Ll/uxe;->O()V

    .line 90
    .line 91
    .line 92
    goto :goto_0

    .line 93
    :cond_0
    invoke-virtual {p0}, Ll/uxe;->B()Ljava/lang/String;

    .line 94
    .line 95
    .line 96
    move-result-object v0

    .line 97
    invoke-static {v0}, Ll/l51;->B(Ljava/lang/String;)Z

    .line 98
    .line 99
    .line 100
    move-result v0

    .line 101
    if-eqz v0, :cond_1

    .line 102
    .line 103
    invoke-virtual {p0}, Ll/uxe;->B()Ljava/lang/String;

    .line 104
    .line 105
    .line 106
    move-result-object v0

    .line 107
    invoke-static {v0}, Ll/l51;->K(Ljava/lang/String;)V

    .line 108
    .line 109
    .line 110
    :cond_1
    iget-object v0, p0, Ll/uxe;->i:Lv/VText;

    .line 111
    .line 112
    iget-object v1, p0, Ll/jbf0;->a:Lcom/p1/mobile/putong/app/PutongAct;

    .line 113
    .line 114
    check-cast v1, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/act/EmailVerifyCodeAct;

    .line 115
    .line 116
    invoke-virtual {v1}, Lcom/p1/mobile/putong/app/PutongAct;->getResources()Landroid/content/res/Resources;

    .line 117
    .line 118
    .line 119
    move-result-object v1

    .line 120
    sget v2, Ll/a9c0;->j:I

    .line 121
    .line 122
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    .line 123
    .line 124
    .line 125
    move-result v1

    .line 126
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 127
    .line 128
    .line 129
    iget-object v0, p0, Ll/uxe;->i:Lv/VText;

    .line 130
    .line 131
    const/4 v1, 0x1

    .line 132
    invoke-virtual {v0, v1}, Landroid/view/View;->setEnabled(Z)V

    .line 133
    .line 134
    .line 135
    iget-object v0, p0, Ll/uxe;->i:Lv/VText;

    .line 136
    .line 137
    invoke-virtual {p0}, Ll/jbf0;->a()Lcom/p1/mobile/putong/app/PutongAct;

    .line 138
    .line 139
    .line 140
    move-result-object v1

    .line 141
    sget v2, Lcom/p1/mobile/putong/account/R$string;->U3:I

    .line 142
    .line 143
    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 144
    .line 145
    .line 146
    move-result-object v1

    .line 147
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 148
    .line 149
    .line 150
    :goto_0
    iget-object v0, p0, Ll/jbf0;->b:Ll/ibf0;

    .line 151
    .line 152
    check-cast v0, Ll/gxe;

    .line 153
    .line 154
    invoke-virtual {v0}, Ll/gxe;->k1()Z

    .line 155
    .line 156
    .line 157
    move-result v0

    .line 158
    if-eqz v0, :cond_2

    .line 159
    .line 160
    iget-object v0, p0, Ll/uxe;->d:Lv/VText;

    .line 161
    .line 162
    sget v1, Lcom/p1/mobile/putong/account/R$string;->v3:I

    .line 163
    .line 164
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    .line 165
    .line 166
    .line 167
    :cond_2
    iget-object v0, p0, Ll/uxe;->i:Lv/VText;

    .line 168
    .line 169
    new-instance v1, Ll/qxe;

    .line 170
    .line 171
    invoke-direct {v1, p0}, Ll/qxe;-><init>(Ll/uxe;)V

    .line 172
    .line 173
    .line 174
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 175
    .line 176
    .line 177
    iget-object v0, p0, Ll/uxe;->e:Lv/VText;

    .line 178
    .line 179
    iget-object v1, p0, Ll/jbf0;->a:Lcom/p1/mobile/putong/app/PutongAct;

    .line 180
    .line 181
    check-cast v1, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/act/EmailVerifyCodeAct;

    .line 182
    .line 183
    sget v2, Lcom/p1/mobile/putong/account/R$string;->a2:I

    .line 184
    .line 185
    iget-object v3, p0, Ll/jbf0;->b:Ll/ibf0;

    .line 186
    .line 187
    check-cast v3, Ll/gxe;

    .line 188
    .line 189
    iget-object v3, v3, Ll/gxe;->f:Ljava/lang/String;

    .line 190
    .line 191
    filled-new-array {v3}, [Ljava/lang/Object;

    .line 192
    .line 193
    .line 194
    move-result-object v3

    .line 195
    invoke-virtual {v1, v2, v3}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 196
    .line 197
    .line 198
    move-result-object v1

    .line 199
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 200
    .line 201
    .line 202
    iget-object v0, p0, Ll/uxe;->f:Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/EmailVerifyCodeView;

    .line 203
    .line 204
    const-string v1, ""

    .line 205
    .line 206
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/EmailVerifyCodeView;->setText(Ljava/lang/String;)V

    .line 207
    .line 208
    .line 209
    iget-object v0, p0, Ll/uxe;->f:Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/EmailVerifyCodeView;

    .line 210
    .line 211
    new-instance v1, Ll/rxe;

    .line 212
    .line 213
    invoke-direct {v1, p0}, Ll/rxe;-><init>(Ll/uxe;)V

    .line 214
    .line 215
    .line 216
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/EmailVerifyCodeView;->setTextChangeListener(Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/EmailVerifyCodeView$a;)V

    .line 217
    .line 218
    .line 219
    iget-object v0, p0, Ll/uxe;->f:Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/EmailVerifyCodeView;

    .line 220
    .line 221
    new-instance v1, Ll/sxe;

    .line 222
    .line 223
    invoke-direct {v1, p0}, Ll/sxe;-><init>(Ll/uxe;)V

    .line 224
    .line 225
    .line 226
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 227
    .line 228
    .line 229
    iget-object v0, p0, Ll/uxe;->l:Lv/VText;

    .line 230
    .line 231
    iget-object v1, p0, Ll/jbf0;->b:Ll/ibf0;

    .line 232
    .line 233
    check-cast v1, Ll/gxe;

    .line 234
    .line 235
    invoke-virtual {v1}, Ll/gxe;->i1()Z

    .line 236
    .line 237
    .line 238
    move-result v1

    .line 239
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 240
    .line 241
    .line 242
    iget-object v0, p0, Ll/uxe;->l:Lv/VText;

    .line 243
    .line 244
    new-instance v1, Ll/txe;

    .line 245
    .line 246
    invoke-direct {v1, p0}, Ll/txe;-><init>(Ll/uxe;)V

    .line 247
    .line 248
    .line 249
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 250
    .line 251
    .line 252
    return-void
.end method

.method public x(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/vxe;->b(Ll/uxe;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public z()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/uxe;->f:Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/EmailVerifyCodeView;

    .line 2
    .line 3
    const-string v0, ""

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/EmailVerifyCodeView;->setText(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

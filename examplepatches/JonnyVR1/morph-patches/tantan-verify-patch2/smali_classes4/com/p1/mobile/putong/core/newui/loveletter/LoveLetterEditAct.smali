.class public Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterEditAct;
.super Lcom/p1/mobile/putong/app/PutongAct;
.source "SourceFile"


# instance fields
.field public c:Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterEditLayout;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/app/PutongAct;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic X1(Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterEditAct;Lcom/p1/mobile/putong/core/data/Message;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterEditAct;->p2(Lcom/p1/mobile/putong/core/data/Message;Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic Y1(Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterEditAct;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/data/Message;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterEditAct;->o2(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/data/Message;)V

    return-void
.end method

.method public static synthetic Z1(Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterEditAct;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterEditAct;->k2(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic a2(Landroid/view/View;)V
    .locals 1

    .line 1
    const-string p0, "e_back"

    .line 2
    .line 3
    const-string v0, "p_send_letter_pop"

    .line 4
    .line 5
    invoke-static {p0, v0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic b2(Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterEditAct;Landroid/view/View;Ll/dgq0;)Ll/dgq0;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterEditAct;->l2(Landroid/view/View;Ll/dgq0;)Ll/dgq0;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic c2(Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterEditAct;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterEditAct;->lambda$initSubscription$1(Landroid/os/Bundle;)V

    return-void
.end method

.method public static synthetic d2(Ll/l4g0;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-static {p0}, Ll/w1e;->e(Ll/l4g0;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic e2(Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterEditAct;Ljava/lang/Boolean;Ljava/lang/Integer;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterEditAct;->m2(Ljava/lang/Boolean;Ljava/lang/Integer;)V

    return-void
.end method

.method public static synthetic g2(Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterEditAct;Lcom/p1/mobile/putong/data/User;Ljava/lang/String;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterEditAct;->n2(Lcom/p1/mobile/putong/data/User;Ljava/lang/String;Landroid/view/View;)V

    return-void
.end method

.method public static h2(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)Landroid/content/Intent;
    .locals 2

    .line 1
    new-instance v0, Landroid/content/Intent;

    .line 2
    .line 3
    const-class v1, Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterEditAct;

    .line 4
    .line 5
    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 6
    .line 7
    .line 8
    const-string p0, "user_id"

    .line 9
    .line 10
    invoke-virtual {v0, p0, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 11
    .line 12
    .line 13
    return-object v0
.end method

.method private i2()V
    .locals 3

    .line 1
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 2
    .line 3
    const/16 v1, 0x1e

    .line 4
    .line 5
    if-lt v0, v1, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->act()Lcom/p1/mobile/android/app/Act;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    new-instance v1, Ll/kcw;

    .line 20
    .line 21
    invoke-direct {v1, p0}, Ll/kcw;-><init>(Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterEditAct;)V

    .line 22
    .line 23
    .line 24
    invoke-static {v0, v1}, Ll/kkl0;->y0(Landroid/view/View;Ll/il50;)V

    .line 25
    .line 26
    .line 27
    return-void

    .line 28
    :cond_0
    new-instance v0, Landroid/view/View;

    .line 29
    .line 30
    invoke-direct {v0, p0}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 31
    .line 32
    .line 33
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterEditAct;->c:Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterEditLayout;

    .line 34
    .line 35
    new-instance v2, Ll/lcw;

    .line 36
    .line 37
    invoke-direct {v2, p0}, Ll/lcw;-><init>(Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterEditAct;)V

    .line 38
    .line 39
    .line 40
    invoke-virtual {p0, v0, v1, v2}, Lcom/p1/mobile/android/app/Act;->setUpKeyboardDetectorLayout(Landroid/view/View;Landroid/view/View;Ll/z20;)Landroid/view/View;

    .line 41
    .line 42
    .line 43
    return-void
.end method

.method private synthetic k2(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/android/app/Act;->act:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private synthetic lambda$initSubscription$1(Landroid/os/Bundle;)V
    .locals 4

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/app/PutongAct;->setTransparentStatusBar()V

    .line 2
    .line 3
    .line 4
    const/16 p1, 0x10

    .line 5
    .line 6
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/app/PutongAct;->setLightStatusBar(I)V

    .line 7
    .line 8
    .line 9
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterEditAct;->i2()V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    const-string v0, "user_id"

    .line 17
    .line 18
    invoke-virtual {p1, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    if-eqz v0, :cond_0

    .line 27
    .line 28
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 29
    .line 30
    .line 31
    return-void

    .line 32
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 33
    .line 34
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 35
    .line 36
    iget-object v0, v0, Ll/dkb;->U1:Lrx/subjects/a;

    .line 37
    .line 38
    invoke-virtual {v0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    check-cast v0, Lcom/p1/mobile/putong/core/data/LoveLetterEntryInfo;

    .line 43
    .line 44
    if-nez v0, :cond_1

    .line 45
    .line 46
    const-string v1, "\u7eb8\u77ed\u60c5\u957f\uff0c\u4f20\u9012\u4f60\u7684\u5fc3\u610f"

    .line 47
    .line 48
    goto :goto_0

    .line 49
    :cond_1
    iget-object v1, v0, Lcom/p1/mobile/putong/core/data/LoveLetterEntryInfo;->shadingWord:Ljava/lang/String;

    .line 50
    .line 51
    :goto_0
    if-nez v0, :cond_2

    .line 52
    .line 53
    const/16 v0, 0xa

    .line 54
    .line 55
    goto :goto_1

    .line 56
    :cond_2
    iget v0, v0, Lcom/p1/mobile/putong/core/data/LoveLetterEntryInfo;->msgLimit:I

    .line 57
    .line 58
    :goto_1
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterEditAct;->c:Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterEditLayout;

    .line 59
    .line 60
    const/4 v3, 0x1

    .line 61
    invoke-static {v2, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 62
    .line 63
    .line 64
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterEditAct;->c:Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterEditLayout;

    .line 65
    .line 66
    invoke-virtual {v2, p0, p1, v0, v1}, Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterEditLayout;->n(Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterEditAct;Ljava/lang/String;ILjava/lang/String;)V

    .line 67
    .line 68
    .line 69
    return-void
.end method


# virtual methods
.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 2

    .line 1
    sget v0, Ll/kec0;->y6:I

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {p1, v0, p2, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    sget p2, Ll/adc0;->N8:I

    .line 9
    .line 10
    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 11
    .line 12
    .line 13
    move-result-object p2

    .line 14
    check-cast p2, Lv/navigationbar/VNavigationBar;

    .line 15
    .line 16
    sget v0, Ll/adc0;->m3:I

    .line 17
    .line 18
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    check-cast v0, Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterEditLayout;

    .line 23
    .line 24
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterEditAct;->c:Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterEditLayout;

    .line 25
    .line 26
    sget v0, Ll/c9c0;->V1:I

    .line 27
    .line 28
    invoke-virtual {p2, v0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 29
    .line 30
    .line 31
    new-instance v0, Ll/jcw;

    .line 32
    .line 33
    invoke-direct {v0, p0}, Ll/jcw;-><init>(Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterEditAct;)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {p2, v0}, Lv/navigationbar/VNavigationBar;->setLeftIconOnClick(Landroid/view/View$OnClickListener;)V

    .line 37
    .line 38
    .line 39
    invoke-static {}, Ll/bnl0;->F0()I

    .line 40
    .line 41
    .line 42
    move-result p0

    .line 43
    invoke-static {p2, p0}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 44
    .line 45
    .line 46
    return-object p1
.end method

.method public initSubscription()V
    .locals 1

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongAct;->initSubscription()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/icw;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Ll/icw;-><init>(Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterEditAct;)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Act;->creates(Ll/y20;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final synthetic l2(Landroid/view/View;Ll/dgq0;)Ll/dgq0;
    .locals 2

    .line 1
    invoke-virtual {p2}, Ll/dgq0;->v()Landroid/view/WindowInsets;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    invoke-static {}, Ll/stf0;->a()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    invoke-static {p1, v0}, Ll/tgq0;->a(Landroid/view/WindowInsets;I)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    invoke-static {}, Ll/stf0;->a()I

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    invoke-static {p1, v1}, Ll/rgq0;->a(Landroid/view/WindowInsets;I)Landroid/graphics/Insets;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    invoke-static {p1}, Ll/ede;->a(Landroid/graphics/Insets;)I

    .line 24
    .line 25
    .line 26
    move-result p1

    .line 27
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterEditAct;->c:Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterEditLayout;

    .line 28
    .line 29
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    invoke-virtual {p0, v0, p1}, Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterEditLayout;->m(Ljava/lang/Boolean;Ljava/lang/Integer;)V

    .line 38
    .line 39
    .line 40
    :cond_0
    return-object p2
.end method

.method public final synthetic m2(Ljava/lang/Boolean;Ljava/lang/Integer;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterEditAct;->c:Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterEditLayout;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterEditLayout;->m(Ljava/lang/Boolean;Ljava/lang/Integer;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic n2(Lcom/p1/mobile/putong/data/User;Ljava/lang/String;Landroid/view/View;)V
    .locals 1

    .line 1
    const-string p3, "e_confirm_send"

    .line 2
    .line 3
    const-string v0, "p_send_letter_pop"

    .line 4
    .line 5
    invoke-static {p3, v0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterEditAct;->r2(Lcom/p1/mobile/putong/data/User;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final synthetic o2(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/data/Message;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/android/app/Act;->act:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 4
    .line 5
    .line 6
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 7
    .line 8
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 9
    .line 10
    invoke-virtual {v0}, Ll/dkb;->da()Lrx/c;

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Lcom/p1/mobile/android/app/Act;->act:Lcom/p1/mobile/android/app/Act;

    .line 14
    .line 15
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 16
    .line 17
    iget-object p2, p2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 18
    .line 19
    invoke-static {v0, p1, p2}, Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterAct;->b2(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    const/high16 p2, 0x4000000

    .line 24
    .line 25
    invoke-virtual {p1, p2}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 26
    .line 27
    .line 28
    iget-object p2, p0, Lcom/p1/mobile/android/app/Act;->act:Lcom/p1/mobile/android/app/Act;

    .line 29
    .line 30
    invoke-virtual {p2, p1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 31
    .line 32
    .line 33
    iget-object p0, p0, Lcom/p1/mobile/android/app/Act;->act:Lcom/p1/mobile/android/app/Act;

    .line 34
    .line 35
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method public final synthetic p2(Lcom/p1/mobile/putong/core/data/Message;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/android/app/Act;->act:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 4
    .line 5
    .line 6
    iget-object p0, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 7
    .line 8
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    if-nez p0, :cond_0

    .line 13
    .line 14
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 15
    .line 16
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 17
    .line 18
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 19
    .line 20
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/api/g;->Of(Ljava/lang/String;)Lrx/c;

    .line 21
    .line 22
    .line 23
    :cond_0
    const-string p0, "\u53d1\u9001\u5931\u8d25\uff0c\u8bf7\u7a0d\u540e\u518d\u8bd5"

    .line 24
    .line 25
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public pageId()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "p_write_letter"

    .line 2
    .line 3
    return-object p0
.end method

.method public q2(Lcom/p1/mobile/putong/data/User;Ljava/lang/String;)V
    .locals 3

    .line 1
    const-class v0, Lcom/p1/mobile/android/app/Dialog;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-string v1, "p_send_letter_pop"

    .line 8
    .line 9
    invoke-static {v1, v0}, Ll/w1e;->c(Ljava/lang/String;Ljava/lang/String;)Ll/l4g0;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    new-instance v1, Ll/th0$a;

    .line 14
    .line 15
    iget-object v2, p0, Lcom/p1/mobile/android/app/Act;->act:Lcom/p1/mobile/android/app/Act;

    .line 16
    .line 17
    invoke-direct {v1, v2}, Ll/th0$a;-><init>(Landroid/content/Context;)V

    .line 18
    .line 19
    .line 20
    const-string v2, "\u4f60\u5c06\u4f7f\u75281\u6b21\u60c5\u4e66\u4f20\u9012\u673a\u4f1a"

    .line 21
    .line 22
    invoke-virtual {v1, v2}, Ll/th0$a;->s(Ljava/lang/String;)Ll/th0$a;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    const-string v2, "\u673a\u4f1a\u4ec5\u6709\u4e00\u6b21\uff0c\u7528\u5fc3\u4e66\u5199\u6bcf\u4e2a\u5b57\u8868\u8fbe\u4f60\u7684\u5fc3\u610f\uff0c\u5bf9\u65b9\u66f4\u80fd\u611f\u53d7\u5230\u4f60\u7684\u771f\u8bda\u548c\u7528\u5fc3"

    .line 27
    .line 28
    invoke-virtual {v1, v2}, Ll/th0$a;->j(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    const/4 v2, 0x1

    .line 33
    invoke-virtual {v1, v2}, Ll/th0$a;->g(Z)Ll/th0$a;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    const-string v2, "\u8fd4\u56de\u7f16\u8f91"

    .line 38
    .line 39
    invoke-virtual {v1, v2}, Ll/th0$a;->f(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    const-string v2, "\u786e\u8ba4\u53d1\u9001"

    .line 44
    .line 45
    invoke-virtual {v1, v2}, Ll/th0$a;->r(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 46
    .line 47
    .line 48
    move-result-object v1

    .line 49
    new-instance v2, Ll/mcw;

    .line 50
    .line 51
    invoke-direct {v2}, Ll/mcw;-><init>()V

    .line 52
    .line 53
    .line 54
    invoke-virtual {v1, v2}, Ll/th0$a;->c(Landroid/view/View$OnClickListener;)Ll/th0$a;

    .line 55
    .line 56
    .line 57
    move-result-object v1

    .line 58
    new-instance v2, Ll/ncw;

    .line 59
    .line 60
    invoke-direct {v2, v0}, Ll/ncw;-><init>(Ll/l4g0;)V

    .line 61
    .line 62
    .line 63
    invoke-virtual {v1, v2}, Ll/th0$a;->m(Landroid/content/DialogInterface$OnDismissListener;)Ll/th0$a;

    .line 64
    .line 65
    .line 66
    move-result-object v1

    .line 67
    new-instance v2, Ll/ocw;

    .line 68
    .line 69
    invoke-direct {v2, p0, p1, p2}, Ll/ocw;-><init>(Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterEditAct;Lcom/p1/mobile/putong/data/User;Ljava/lang/String;)V

    .line 70
    .line 71
    .line 72
    invoke-virtual {v1, v2}, Ll/th0$a;->o(Landroid/view/View$OnClickListener;)Ll/th0$a;

    .line 73
    .line 74
    .line 75
    move-result-object p0

    .line 76
    invoke-virtual {p0}, Ll/th0$a;->a()Ll/th0;

    .line 77
    .line 78
    .line 79
    move-result-object p0

    .line 80
    invoke-virtual {p0}, Ll/th0;->g()V

    .line 81
    .line 82
    .line 83
    invoke-static {v0}, Ll/w1e;->f(Ll/l4g0;)V

    .line 84
    .line 85
    .line 86
    return-void
.end method

.method public r2(Lcom/p1/mobile/putong/data/User;Ljava/lang/String;)V
    .locals 3

    .line 1
    invoke-virtual {p2}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget-object v1, Ll/uqb0;->Z:Ll/a4j;

    .line 6
    .line 7
    invoke-virtual {v1, v0}, Ll/a4j;->K(Ljava/lang/String;)Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    if-nez v1, :cond_1

    .line 12
    .line 13
    sget-object v1, Ll/uqb0;->Z:Ll/a4j;

    .line 14
    .line 15
    invoke-virtual {v1, v0}, Ll/a4j;->M(Ljava/lang/String;)Z

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
    iget-object v0, p0, Lcom/p1/mobile/android/app/Act;->act:Lcom/p1/mobile/android/app/Act;

    .line 23
    .line 24
    sget v1, Lcom/p1/mobile/putong/core/R$string;->L5:I

    .line 25
    .line 26
    const/4 v2, 0x1

    .line 27
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/android/app/Act;->progress(IZ)Landroid/app/Dialog;

    .line 28
    .line 29
    .line 30
    invoke-static {}, Lcom/p1/mobile/putong/core/data/Message;->new_()Lcom/p1/mobile/putong/core/data/Message;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    const-string v1, "love_letter"

    .line 35
    .line 36
    invoke-static {v1}, Lcom/p1/mobile/putong/core/data/MessageType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/MessageType;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 41
    .line 42
    iput-object p2, v0, Lcom/p1/mobile/putong/core/data/Message;->value:Ljava/lang/String;

    .line 43
    .line 44
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 45
    .line 46
    iget-object p2, p2, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 47
    .line 48
    iget-object v1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 49
    .line 50
    const/4 v2, 0x0

    .line 51
    invoke-virtual {p2, v1, v0, v2}, Lcom/p1/mobile/putong/core/api/g;->Dn(Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/core/data/Sticker;)Lrx/c;

    .line 52
    .line 53
    .line 54
    move-result-object p2

    .line 55
    invoke-virtual {p0, p2}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 56
    .line 57
    .line 58
    move-result-object p2

    .line 59
    new-instance v1, Ll/pcw;

    .line 60
    .line 61
    invoke-direct {v1, p0, p1}, Ll/pcw;-><init>(Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterEditAct;Lcom/p1/mobile/putong/data/User;)V

    .line 62
    .line 63
    .line 64
    new-instance p1, Ll/qcw;

    .line 65
    .line 66
    invoke-direct {p1, p0, v0}, Ll/qcw;-><init>(Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterEditAct;Lcom/p1/mobile/putong/core/data/Message;)V

    .line 67
    .line 68
    .line 69
    invoke-static {v1, p1}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 70
    .line 71
    .line 72
    move-result-object p0

    .line 73
    invoke-virtual {p2, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 74
    .line 75
    .line 76
    return-void

    .line 77
    :cond_1
    :goto_0
    const-string p0, "\u62b1\u6b49\uff0c\u60a8\u7684\u4fe1\u606f\u8fdd\u53cd\u4e86\u793e\u533a\u89c4\u8303\uff0c\u8bf7\u91cd\u65b0\u7f16\u8f91"

    .line 78
    .line 79
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 80
    .line 81
    .line 82
    return-void
.end method

.class public abstract Lcom/p1/mobile/putong/account/ui/account/SignInBaseActMVP;
.super Lcom/p1/mobile/putong/account/AccountBaseAct;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<Presenter:",
        "Ll/ibf0;",
        "ViewModel:",
        "Ll/jbf0;",
        ">",
        "Lcom/p1/mobile/putong/account/AccountBaseAct;"
    }
.end annotation


# static fields
.field public static final AFTER_SIGNIN:Ljava/lang/String; = "after_signin"

.field public static final AFTER_SIGNIN_NOTHING:I


# instance fields
.field private filterViews:[Landroid/view/View;

.field protected signInPresenter:Ll/ibf0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TPresenter;"
        }
    .end annotation
.end field

.field protected signInViewModel:Ll/jbf0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TViewModel;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/account/AccountBaseAct;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic X1(Lcom/p1/mobile/putong/account/ui/account/SignInBaseActMVP;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/account/ui/account/SignInBaseActMVP;->lambda$debugItems$1()V

    return-void
.end method

.method public static synthetic Y1(Lcom/p1/mobile/putong/account/ui/account/SignInBaseActMVP;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/account/ui/account/SignInBaseActMVP;->lambda$debugItems$0()V

    return-void
.end method

.method private synthetic lambda$debugItems$0()V
    .locals 3

    .line 1
    invoke-static {}, Ll/ike;->h()Ll/ike;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/ike;->m()V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->act()Lcom/p1/mobile/android/app/Act;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    iget-object v1, p0, Lcom/p1/mobile/android/app/Act;->act:Lcom/p1/mobile/android/app/Act;

    .line 13
    .line 14
    const/4 v2, 0x1

    .line 15
    invoke-static {v1, v2}, Lcom/p1/mobile/putong/account/ui/welcome/WelcomeAct;->E2(Landroid/content/Context;Z)Landroid/content/Intent;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-virtual {v0, v1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 20
    .line 21
    .line 22
    iget-object p0, p0, Lcom/p1/mobile/android/app/Act;->act:Lcom/p1/mobile/android/app/Act;

    .line 23
    .line 24
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method private synthetic lambda$debugItems$1()V
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/p1/mobile/putong/remote_config/b;->a(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public debugItems()Ljava/util/ArrayList;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Ll/pf60<",
            "Ljava/lang/String;",
            "Ll/x20;",
            ">;>;"
        }
    .end annotation

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongAct;->debugItems()Ljava/util/ArrayList;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ll/uaf0;

    .line 6
    .line 7
    invoke-direct {v1, p0}, Ll/uaf0;-><init>(Lcom/p1/mobile/putong/account/ui/account/SignInBaseActMVP;)V

    .line 8
    .line 9
    .line 10
    const-string v2, "back to welcomeAct"

    .line 11
    .line 12
    invoke-static {v2, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    new-instance v1, Ll/vaf0;

    .line 20
    .line 21
    invoke-direct {v1, p0}, Ll/vaf0;-><init>(Lcom/p1/mobile/putong/account/ui/account/SignInBaseActMVP;)V

    .line 22
    .line 23
    .line 24
    const-string p0, "show RemoteConfig"

    .line 25
    .line 26
    invoke-static {p0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 31
    .line 32
    .line 33
    return-object v0
.end method

.method public dispatchTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 1

    .line 1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/account/ui/account/SignInBaseActMVP;->shouldHideKeyBord(Landroid/view/MotionEvent;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    iget-object v0, p0, Lcom/p1/mobile/android/app/Act;->act:Lcom/p1/mobile/android/app/Act;

    .line 14
    .line 15
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->hideInput()V

    .line 16
    .line 17
    .line 18
    :cond_0
    invoke-super {p0, p1}, Lcom/p1/mobile/putong/app/PutongAct;->dispatchTouchEvent(Landroid/view/MotionEvent;)Z

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    return p0
.end method

.method public abstract generateSignInPresenter()Ll/ibf0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TPresenter;"
        }
    .end annotation
.end method

.method public abstract generateSignInViewModel()Ll/jbf0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TViewModel;"
        }
    .end annotation
.end method

.method public bridge synthetic getDefaultViewModelCreationExtras()Ll/cvb;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    invoke-super {p0}, Landroidx/lifecycle/e;->getDefaultViewModelCreationExtras()Ll/cvb;

    move-result-object p0

    return-object p0
.end method

.method public initDataOnCreate()V
    .locals 1

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/account/AccountBaseAct;->initDataOnCreate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/account/ui/account/SignInBaseActMVP;->generateSignInPresenter()Ll/ibf0;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iput-object v0, p0, Lcom/p1/mobile/putong/account/ui/account/SignInBaseActMVP;->signInPresenter:Ll/ibf0;

    .line 9
    .line 10
    invoke-virtual {p0}, Lcom/p1/mobile/putong/account/ui/account/SignInBaseActMVP;->generateSignInViewModel()Ll/jbf0;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    iput-object v0, p0, Lcom/p1/mobile/putong/account/ui/account/SignInBaseActMVP;->signInViewModel:Ll/jbf0;

    .line 15
    .line 16
    iget-object p0, p0, Lcom/p1/mobile/putong/account/ui/account/SignInBaseActMVP;->signInPresenter:Ll/ibf0;

    .line 17
    .line 18
    invoke-virtual {p0, v0}, Ll/ar2;->C(Ll/iam;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public initSubscription()V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongAct;->initSubscription()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public preCreateView(Landroid/os/Bundle;)V
    .locals 0
    .annotation build Landroidx/annotation/CallSuper;
    .end annotation

    .line 1
    invoke-super {p0, p1}, Lcom/p1/mobile/putong/app/PutongAct;->preCreateView(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Lcom/p1/mobile/putong/account/ui/account/SignInBaseActMVP;->signInPresenter:Ll/ibf0;

    .line 5
    .line 6
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    invoke-virtual {p1, p0}, Ll/ibf0;->t0(Landroid/content/Intent;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public varargs setFilterView([Landroid/view/View;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/account/ui/account/SignInBaseActMVP;->filterViews:[Landroid/view/View;

    .line 2
    .line 3
    return-void
.end method

.method public shouldHideKeyBord(Landroid/view/MotionEvent;)Z
    .locals 8

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/account/SignInBaseActMVP;->filterViews:[Landroid/view/View;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x0

    .line 8
    if-eqz v0, :cond_2

    .line 9
    .line 10
    iget-object p0, p0, Lcom/p1/mobile/putong/account/ui/account/SignInBaseActMVP;->filterViews:[Landroid/view/View;

    .line 11
    .line 12
    array-length v0, p0

    .line 13
    move v2, v1

    .line 14
    :goto_0
    const/4 v3, 0x1

    .line 15
    if-ge v2, v0, :cond_1

    .line 16
    .line 17
    aget-object v4, p0, v2

    .line 18
    .line 19
    filled-new-array {v1, v1}, [I

    .line 20
    .line 21
    .line 22
    move-result-object v5

    .line 23
    invoke-virtual {v4, v5}, Landroid/view/View;->getLocationOnScreen([I)V

    .line 24
    .line 25
    .line 26
    aget v6, v5, v1

    .line 27
    .line 28
    aget v3, v5, v3

    .line 29
    .line 30
    invoke-virtual {v4}, Landroid/view/View;->getHeight()I

    .line 31
    .line 32
    .line 33
    move-result v5

    .line 34
    add-int/2addr v5, v3

    .line 35
    invoke-static {}, Ll/bnl0;->F0()I

    .line 36
    .line 37
    .line 38
    move-result v7

    .line 39
    add-int/2addr v5, v7

    .line 40
    invoke-virtual {v4}, Landroid/view/View;->getWidth()I

    .line 41
    .line 42
    .line 43
    move-result v4

    .line 44
    add-int/2addr v4, v6

    .line 45
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    .line 46
    .line 47
    .line 48
    move-result v7

    .line 49
    int-to-float v6, v6

    .line 50
    cmpl-float v6, v7, v6

    .line 51
    .line 52
    if-lez v6, :cond_0

    .line 53
    .line 54
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    .line 55
    .line 56
    .line 57
    move-result v6

    .line 58
    int-to-float v4, v4

    .line 59
    cmpg-float v4, v6, v4

    .line 60
    .line 61
    if-gez v4, :cond_0

    .line 62
    .line 63
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 64
    .line 65
    .line 66
    move-result v4

    .line 67
    int-to-float v3, v3

    .line 68
    cmpl-float v3, v4, v3

    .line 69
    .line 70
    if-lez v3, :cond_0

    .line 71
    .line 72
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 73
    .line 74
    .line 75
    move-result v3

    .line 76
    int-to-float v4, v5

    .line 77
    cmpg-float v3, v3, v4

    .line 78
    .line 79
    if-gez v3, :cond_0

    .line 80
    .line 81
    return v1

    .line 82
    :cond_0
    add-int/lit8 v2, v2, 0x1

    .line 83
    .line 84
    goto :goto_0

    .line 85
    :cond_1
    return v3

    .line 86
    :cond_2
    return v1
.end method

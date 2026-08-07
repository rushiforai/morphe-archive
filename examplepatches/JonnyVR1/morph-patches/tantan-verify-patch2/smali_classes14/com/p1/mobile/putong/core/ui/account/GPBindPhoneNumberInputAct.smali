.class public Lcom/p1/mobile/putong/core/ui/account/GPBindPhoneNumberInputAct;
.super Lcom/p1/mobile/putong/app/PutongAct;
.source "SourceFile"


# static fields
.field public static m:Ljava/lang/String;

.field public static n:I

.field public static final o:Lrx/subjects/b;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/b<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public c:Lv/VLinear;

.field public d:Lv/VText;

.field public e:Landroid/widget/LinearLayout;

.field public f:Lv/VMaterialEdit_FakeSpinner;

.field public g:Lv/VMaterialEdit;

.field public h:Lv/VButton_FakeShadow;

.field public i:Ljava/lang/String;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public j:Ll/jxd0;

.field public k:Ljava/lang/String;

.field public l:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    invoke-static {}, Lrx/subjects/b;->b()Lrx/subjects/b;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sput-object v0, Lcom/p1/mobile/putong/core/ui/account/GPBindPhoneNumberInputAct;->o:Lrx/subjects/b;

    .line 6
    .line 7
    return-void
.end method

.method public constructor <init>()V
    .locals 3

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/app/PutongAct;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/account/GPBindPhoneNumberInputAct;->i:Ljava/lang/String;

    .line 6
    .line 7
    new-instance v0, Ll/jxd0;

    .line 8
    .line 9
    new-instance v1, Ljava/lang/StringBuilder;

    .line 10
    .line 11
    const-string v2, "back_intercept"

    .line 12
    .line 13
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 17
    .line 18
    .line 19
    move-result-object v2

    .line 20
    invoke-interface {v2}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v2

    .line 24
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    sget-object v2, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 32
    .line 33
    invoke-direct {v0, v1, v2}, Ll/jxd0;-><init>(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 34
    .line 35
    .line 36
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/account/GPBindPhoneNumberInputAct;->j:Ll/jxd0;

    .line 37
    .line 38
    return-void
.end method

.method public static synthetic X1(Lcom/p1/mobile/putong/core/ui/account/GPBindPhoneNumberInputAct;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/account/GPBindPhoneNumberInputAct;->r2(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic Y1(Lcom/p1/mobile/putong/core/ui/account/GPBindPhoneNumberInputAct;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/account/GPBindPhoneNumberInputAct;->m2(Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic Z1(Lcom/p1/mobile/putong/core/ui/account/GPBindPhoneNumberInputAct;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/account/GPBindPhoneNumberInputAct;->n2(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic a2(Lcom/p1/mobile/putong/core/ui/account/GPBindPhoneNumberInputAct;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/account/GPBindPhoneNumberInputAct;->p2(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic b2(Lcom/p1/mobile/putong/core/ui/account/GPBindPhoneNumberInputAct;ILl/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/account/GPBindPhoneNumberInputAct;->q2(ILl/uxj0;)V

    return-void
.end method

.method public static synthetic c2(Lcom/p1/mobile/putong/core/ui/account/GPBindPhoneNumberInputAct;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/account/GPBindPhoneNumberInputAct;->lambda$initSubscription$0(Landroid/os/Bundle;)V

    return-void
.end method

.method public static synthetic d2(Lcom/p1/mobile/putong/core/ui/account/GPBindPhoneNumberInputAct;Ljava/lang/CharSequence;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/account/GPBindPhoneNumberInputAct;->o2(Ljava/lang/CharSequence;)V

    return-void
.end method

.method public static g2(Lcom/p1/mobile/android/app/Act;)Landroid/content/Intent;
    .locals 2

    .line 1
    new-instance v0, Landroid/content/Intent;

    .line 2
    .line 3
    const-class v1, Lcom/p1/mobile/putong/core/ui/account/GPBindPhoneNumberInputAct;

    .line 4
    .line 5
    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 6
    .line 7
    .line 8
    return-object v0
.end method

.method public static h2(Lcom/p1/mobile/android/app/Act;ZLjava/lang/String;)Landroid/content/Intent;
    .locals 1

    .line 1
    invoke-static {p0}, Lcom/p1/mobile/putong/core/ui/account/GPBindPhoneNumberInputAct;->g2(Lcom/p1/mobile/android/app/Act;)Landroid/content/Intent;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const-string v0, "is_sign_up"

    .line 6
    .line 7
    invoke-virtual {p0, v0, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 8
    .line 9
    .line 10
    const-string p1, "custom_description"

    .line 11
    .line 12
    invoke-virtual {p0, p1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 13
    .line 14
    .line 15
    return-object p0
.end method

.method private i2(Ljava/lang/String;)Z
    .locals 3

    .line 1
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x3

    .line 6
    const/4 v2, 0x0

    .line 7
    if-ge v0, v1, :cond_0

    .line 8
    .line 9
    return v2

    .line 10
    :cond_0
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/account/GPBindPhoneNumberInputAct;->s2()Z

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    if-nez p0, :cond_1

    .line 15
    .line 16
    const-string p0, "^[0-9]*$"

    .line 17
    .line 18
    invoke-static {p0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    invoke-virtual {p0, p1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    invoke-virtual {p0}, Ljava/util/regex/Matcher;->matches()Z

    .line 27
    .line 28
    .line 29
    move-result p0

    .line 30
    return p0

    .line 31
    :cond_1
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 32
    .line 33
    .line 34
    move-result p0

    .line 35
    const/16 v0, 0xb

    .line 36
    .line 37
    if-eq p0, v0, :cond_2

    .line 38
    .line 39
    return v2

    .line 40
    :cond_2
    const-string p0, "^1[0-9]{10}$"

    .line 41
    .line 42
    invoke-static {p0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    invoke-virtual {p0, p1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    invoke-virtual {p0}, Ljava/util/regex/Matcher;->matches()Z

    .line 51
    .line 52
    .line 53
    move-result p0

    .line 54
    return p0
.end method

.method public static k2()Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/ui/account/GPBindPhoneNumberInputAct;->o:Lrx/subjects/b;

    .line 2
    .line 3
    invoke-virtual {v0}, Lrx/c;->asObservable()Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    return-object v0
.end method

.method private l2()I
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/account/GPBindPhoneNumberInputAct;->f:Lv/VMaterialEdit_FakeSpinner;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/account/GPBindPhoneNumberInputAct;->f:Lv/VMaterialEdit_FakeSpinner;

    .line 10
    .line 11
    invoke-virtual {p0}, Lv/VMaterialEdit_FakeSpinner;->getText()Landroid/text/Editable;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    const/4 v0, 0x1

    .line 20
    invoke-virtual {p0, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 29
    .line 30
    .line 31
    move-result p0

    .line 32
    return p0

    .line 33
    :cond_0
    sget-object p0, Ll/nsb;->d:Ljava/util/ArrayList;

    .line 34
    .line 35
    const/4 v0, 0x0

    .line 36
    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    check-cast p0, Ll/nsb;

    .line 41
    .line 42
    iget p0, p0, Ll/nsb;->b:I

    .line 43
    .line 44
    return p0
.end method

.method private synthetic lambda$initSubscription$0(Landroid/os/Bundle;)V
    .locals 2

    .line 1
    if-nez p1, :cond_1

    .line 2
    .line 3
    iget-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/account/GPBindPhoneNumberInputAct;->l:Z

    .line 4
    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    const-string p1, "afterSignup"

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    const-string p1, "accountSecurityPage"

    .line 11
    .line 12
    :goto_0
    new-instance v0, Lorg/json/JSONObject;

    .line 13
    .line 14
    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 15
    .line 16
    .line 17
    :try_start_0
    const-string v1, "bindType"

    .line 18
    .line 19
    invoke-virtual {v0, v1, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 20
    .line 21
    .line 22
    iget-object p0, p0, Lcom/p1/mobile/putong/app/PutongAct;->pageHelper:Ll/l4g0;

    .line 23
    .line 24
    invoke-virtual {p0, v0}, Ll/l4g0;->o(Lorg/json/JSONObject;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 25
    .line 26
    .line 27
    return-void

    .line 28
    :catch_0
    move-exception p0

    .line 29
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 30
    .line 31
    .line 32
    :cond_1
    return-void
.end method

.method private synthetic n2(Landroid/view/View;)V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    new-instance v0, Ll/qfj;

    .line 6
    .line 7
    invoke-direct {v0, p0}, Ll/qfj;-><init>(Lcom/p1/mobile/putong/core/ui/account/GPBindPhoneNumberInputAct;)V

    .line 8
    .line 9
    .line 10
    invoke-interface {p1, p0, v0}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->dialogCCode(Lcom/p1/mobile/android/app/Act;Ll/y20;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method private synthetic o2(Ljava/lang/CharSequence;)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/account/GPBindPhoneNumberInputAct;->g:Lv/VMaterialEdit;

    .line 2
    .line 3
    invoke-static {p1}, Ll/bsj0;->M(Landroid/widget/TextView;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/account/GPBindPhoneNumberInputAct;->k:Ljava/lang/String;

    .line 8
    .line 9
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/account/GPBindPhoneNumberInputAct;->v2()V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method private synthetic p2(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/account/GPBindPhoneNumberInputAct;->g:Lv/VMaterialEdit;

    .line 2
    .line 3
    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/account/GPBindPhoneNumberInputAct;->g:Lv/VMaterialEdit;

    .line 12
    .line 13
    if-eqz p1, :cond_0

    .line 14
    .line 15
    sget p1, Lcom/p1/mobile/putong/core/profile/R$string;->E3:I

    .line 16
    .line 17
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-virtual {v0, p0}, Lcom/rengwuxian/materialedittext/MaterialEditText;->setError(Ljava/lang/CharSequence;)V

    .line 22
    .line 23
    .line 24
    return-void

    .line 25
    :cond_0
    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/account/GPBindPhoneNumberInputAct;->i2(Ljava/lang/String;)Z

    .line 34
    .line 35
    .line 36
    move-result p1

    .line 37
    if-nez p1, :cond_1

    .line 38
    .line 39
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/account/GPBindPhoneNumberInputAct;->g:Lv/VMaterialEdit;

    .line 40
    .line 41
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->act()Lcom/p1/mobile/android/app/Act;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    sget v0, Lcom/p1/mobile/putong/core/profile/R$string;->L3:I

    .line 46
    .line 47
    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    invoke-virtual {p1, p0}, Lcom/rengwuxian/materialedittext/MaterialEditText;->setError(Ljava/lang/CharSequence;)V

    .line 52
    .line 53
    .line 54
    return-void

    .line 55
    :cond_1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/account/GPBindPhoneNumberInputAct;->u2()V

    .line 56
    .line 57
    .line 58
    return-void
.end method

.method private r()V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/account/GPBindPhoneNumberInputAct;->i:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/account/GPBindPhoneNumberInputAct;->d:Lv/VText;

    .line 10
    .line 11
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/account/GPBindPhoneNumberInputAct;->i:Ljava/lang/String;

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 14
    .line 15
    .line 16
    :cond_0
    sget-object v0, Ll/nsb;->d:Ljava/util/ArrayList;

    .line 17
    .line 18
    const/4 v1, 0x0

    .line 19
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    check-cast v0, Ll/nsb;

    .line 24
    .line 25
    iget v0, v0, Ll/nsb;->b:I

    .line 26
    .line 27
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/account/GPBindPhoneNumberInputAct;->f:Lv/VMaterialEdit_FakeSpinner;

    .line 28
    .line 29
    new-instance v3, Ljava/lang/StringBuilder;

    .line 30
    .line 31
    const-string v4, "+"

    .line 32
    .line 33
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 37
    .line 38
    .line 39
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    invoke-virtual {v2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 44
    .line 45
    .line 46
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/account/GPBindPhoneNumberInputAct;->f:Lv/VMaterialEdit_FakeSpinner;

    .line 47
    .line 48
    new-instance v2, Ll/lfj;

    .line 49
    .line 50
    invoke-direct {v2, p0}, Ll/lfj;-><init>(Lcom/p1/mobile/putong/core/ui/account/GPBindPhoneNumberInputAct;)V

    .line 51
    .line 52
    .line 53
    invoke-static {v0, v2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 54
    .line 55
    .line 56
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/account/GPBindPhoneNumberInputAct;->g:Lv/VMaterialEdit;

    .line 57
    .line 58
    invoke-virtual {v0, v1}, Lv/VMaterialEdit;->I(Z)Lrx/c;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    new-instance v1, Ll/mfj;

    .line 63
    .line 64
    invoke-direct {v1, p0}, Ll/mfj;-><init>(Lcom/p1/mobile/putong/core/ui/account/GPBindPhoneNumberInputAct;)V

    .line 65
    .line 66
    .line 67
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 68
    .line 69
    .line 70
    move-result-object v1

    .line 71
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 72
    .line 73
    .line 74
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/account/GPBindPhoneNumberInputAct;->h:Lv/VButton_FakeShadow;

    .line 75
    .line 76
    new-instance v1, Ll/nfj;

    .line 77
    .line 78
    invoke-direct {v1, p0}, Ll/nfj;-><init>(Lcom/p1/mobile/putong/core/ui/account/GPBindPhoneNumberInputAct;)V

    .line 79
    .line 80
    .line 81
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 82
    .line 83
    .line 84
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/account/GPBindPhoneNumberInputAct;->v2()V

    .line 85
    .line 86
    .line 87
    return-void
.end method

.method private s2()Z
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/account/GPBindPhoneNumberInputAct;->l2()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    const/16 v0, 0x56

    .line 6
    .line 7
    if-ne p0, v0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x1

    .line 10
    return p0

    .line 11
    :cond_0
    const/4 p0, 0x0

    .line 12
    return p0
.end method

.method private u2()V
    .locals 3

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/account/GPBindPhoneNumberInputAct;->l2()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/account/GPBindPhoneNumberInputAct;->k:Ljava/lang/String;

    .line 6
    .line 7
    sget-object v2, Lcom/p1/mobile/putong/core/ui/account/GPBindPhoneNumberInputAct;->m:Ljava/lang/String;

    .line 8
    .line 9
    invoke-static {v1, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    if-eqz v1, :cond_0

    .line 14
    .line 15
    sget v1, Lcom/p1/mobile/putong/core/ui/account/GPBindPhoneNumberInputAct;->n:I

    .line 16
    .line 17
    if-ne v0, v1, :cond_0

    .line 18
    .line 19
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/account/GPBindPhoneNumberInputAct;->l2()I

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/account/GPBindPhoneNumberInputAct;->k:Ljava/lang/String;

    .line 24
    .line 25
    iget-boolean v2, p0, Lcom/p1/mobile/putong/core/ui/account/GPBindPhoneNumberInputAct;->l:Z

    .line 26
    .line 27
    invoke-static {p0, v0, v1, v2}, Lcom/p1/mobile/putong/core/ui/account/GPBindVerifyCodeInputAct;->r2(Lcom/p1/mobile/android/app/Act;ILjava/lang/String;Z)Landroid/content/Intent;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    const/16 v1, 0x40

    .line 32
    .line 33
    invoke-virtual {p0, v0, v1}, Landroidx/activity/ComponentActivity;->startActivityForResult(Landroid/content/Intent;I)V

    .line 34
    .line 35
    .line 36
    return-void

    .line 37
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/data/VerifyData;->new_()Lcom/p1/mobile/putong/data/VerifyData;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    invoke-static {}, Ll/q8g0;->y()Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object v2

    .line 45
    iput-object v2, v1, Lcom/p1/mobile/putong/data/VerifyData;->language:Ljava/lang/String;

    .line 46
    .line 47
    iput v0, v1, Lcom/p1/mobile/putong/data/VerifyData;->countryCode:I

    .line 48
    .line 49
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/account/GPBindPhoneNumberInputAct;->k:Ljava/lang/String;

    .line 50
    .line 51
    iput-object v2, v1, Lcom/p1/mobile/putong/data/VerifyData;->mobileNumber:Ljava/lang/String;

    .line 52
    .line 53
    const-string v2, "bind_mobile"

    .line 54
    .line 55
    invoke-static {v2}, Lcom/p1/mobile/putong/data/VerifyReason;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/VerifyReason;

    .line 56
    .line 57
    .line 58
    move-result-object v2

    .line 59
    iput-object v2, v1, Lcom/p1/mobile/putong/data/VerifyData;->action:Lcom/p1/mobile/putong/data/VerifyReason;

    .line 60
    .line 61
    const/4 v2, 0x4

    .line 62
    iput v2, v1, Lcom/p1/mobile/putong/data/VerifyData;->codeLength:I

    .line 63
    .line 64
    sget v2, Lcom/p1/mobile/putong/core/profile/R$string;->R0:I

    .line 65
    .line 66
    invoke-virtual {p0, v2}, Lcom/p1/mobile/android/app/Act;->progress(I)Landroid/app/Dialog;

    .line 67
    .line 68
    .line 69
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 70
    .line 71
    .line 72
    move-result-object v2

    .line 73
    invoke-interface {v2, v1}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->send(Lcom/p1/mobile/putong/data/VerifyData;)Lrx/c;

    .line 74
    .line 75
    .line 76
    move-result-object v1

    .line 77
    invoke-virtual {p0, v1}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 78
    .line 79
    .line 80
    move-result-object v1

    .line 81
    new-instance v2, Ll/ofj;

    .line 82
    .line 83
    invoke-direct {v2, p0, v0}, Ll/ofj;-><init>(Lcom/p1/mobile/putong/core/ui/account/GPBindPhoneNumberInputAct;I)V

    .line 84
    .line 85
    .line 86
    new-instance v0, Ll/pfj;

    .line 87
    .line 88
    invoke-direct {v0, p0}, Ll/pfj;-><init>(Lcom/p1/mobile/putong/core/ui/account/GPBindPhoneNumberInputAct;)V

    .line 89
    .line 90
    .line 91
    const/4 p0, 0x0

    .line 92
    invoke-static {v2, v0, p0}, Ll/psd0;->K(Ll/y20;Ll/y20;Z)Lcom/p1/mobile/android/rx/a;

    .line 93
    .line 94
    .line 95
    move-result-object p0

    .line 96
    invoke-virtual {v1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 97
    .line 98
    .line 99
    return-void
.end method

.method private v2()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/account/GPBindPhoneNumberInputAct;->g:Lv/VMaterialEdit;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x1

    .line 8
    if-nez v0, :cond_1

    .line 9
    .line 10
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/account/GPBindPhoneNumberInputAct;->g:Lv/VMaterialEdit;

    .line 11
    .line 12
    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-nez v0, :cond_0

    .line 21
    .line 22
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/account/GPBindPhoneNumberInputAct;->g:Lv/VMaterialEdit;

    .line 23
    .line 24
    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    invoke-direct {p0, v0}, Lcom/p1/mobile/putong/core/ui/account/GPBindPhoneNumberInputAct;->i2(Ljava/lang/String;)Z

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    if-eqz v0, :cond_0

    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_0
    const/4 v0, 0x0

    .line 40
    goto :goto_1

    .line 41
    :cond_1
    :goto_0
    move v0, v1

    .line 42
    :goto_1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/account/GPBindPhoneNumberInputAct;->h:Lv/VButton_FakeShadow;

    .line 43
    .line 44
    xor-int/2addr v0, v1

    .line 45
    invoke-virtual {p0, v0}, Landroid/view/View;->setActivated(Z)V

    .line 46
    .line 47
    .line 48
    return-void
.end method


# virtual methods
.method public e2(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/rfj;->b(Lcom/p1/mobile/putong/core/ui/account/GPBindPhoneNumberInputAct;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/account/GPBindPhoneNumberInputAct;->e2(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/account/GPBindPhoneNumberInputAct;->r()V

    .line 6
    .line 7
    .line 8
    return-object p1
.end method

.method public initDataOnCreate()V
    .locals 3

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongAct;->initDataOnCreate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    const-string v1, "is_sign_up"

    .line 9
    .line 10
    const/4 v2, 0x0

    .line 11
    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/account/GPBindPhoneNumberInputAct;->l:Z

    .line 16
    .line 17
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    const-string v1, "custom_description"

    .line 22
    .line 23
    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/account/GPBindPhoneNumberInputAct;->i:Ljava/lang/String;

    .line 28
    .line 29
    return-void
.end method

.method public initSubscription()V
    .locals 1

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongAct;->initSubscription()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/kfj;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Ll/kfj;-><init>(Lcom/p1/mobile/putong/core/ui/account/GPBindPhoneNumberInputAct;)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Act;->creates(Ll/y20;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final synthetic m2(Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/account/GPBindPhoneNumberInputAct;->f:Lv/VMaterialEdit_FakeSpinner;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/account/GPBindPhoneNumberInputAct;->v2()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 4

    .line 1
    const/4 v0, -0x1

    .line 2
    const/16 v1, 0x40

    .line 3
    .line 4
    if-ne p1, v1, :cond_0

    .line 5
    .line 6
    if-ne p2, v0, :cond_0

    .line 7
    .line 8
    sget-object v2, Lcom/p1/mobile/putong/core/ui/account/GPBindPhoneNumberInputAct;->o:Lrx/subjects/b;

    .line 9
    .line 10
    sget-object v3, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 11
    .line 12
    invoke-virtual {v2, v3}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 16
    .line 17
    .line 18
    :cond_0
    if-ne p1, v1, :cond_1

    .line 19
    .line 20
    if-eq p2, v0, :cond_1

    .line 21
    .line 22
    sget-object v0, Lcom/p1/mobile/putong/core/ui/account/GPBindPhoneNumberInputAct;->o:Lrx/subjects/b;

    .line 23
    .line 24
    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 25
    .line 26
    invoke-virtual {v0, v1}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V

    .line 27
    .line 28
    .line 29
    :cond_1
    invoke-super {p0, p1, p2, p3}, Lcom/p1/mobile/putong/app/PutongAct;->onActivityResult(IILandroid/content/Intent;)V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public onBackPressed()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public onResumeLifecycle()V
    .locals 4

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongAct;->onResumeLifecycle()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/account/GPBindPhoneNumberInputAct;->g:Lv/VMaterialEdit;

    .line 5
    .line 6
    new-instance v1, Lcom/p1/mobile/putong/core/ui/account/GPBindPhoneNumberInputAct$a;

    .line 7
    .line 8
    invoke-direct {v1, p0}, Lcom/p1/mobile/putong/core/ui/account/GPBindPhoneNumberInputAct$a;-><init>(Lcom/p1/mobile/putong/core/ui/account/GPBindPhoneNumberInputAct;)V

    .line 9
    .line 10
    .line 11
    const-wide/16 v2, 0x64

    .line 12
    .line 13
    invoke-virtual {v0, v1, v2, v3}, Landroid/view/View;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public onWindowFocusChanged(Z)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Landroid/app/Activity;->onWindowFocusChanged(Z)V

    .line 2
    .line 3
    .line 4
    if-nez p1, :cond_0

    .line 5
    .line 6
    iget-object p1, p0, Lcom/p1/mobile/android/app/Act;->act:Lcom/p1/mobile/android/app/Act;

    .line 7
    .line 8
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/account/GPBindPhoneNumberInputAct;->g:Lv/VMaterialEdit;

    .line 9
    .line 10
    invoke-virtual {p1, p0}, Lcom/p1/mobile/android/app/Act;->hideInput(Landroid/view/View;)Z

    .line 11
    .line 12
    .line 13
    :cond_0
    return-void
.end method

.method public pageId()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "p_intl_bind_phone_view"

    .line 2
    .line 3
    return-object p0
.end method

.method public final synthetic q2(ILl/uxj0;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/account/GPBindPhoneNumberInputAct;->l2()I

    .line 5
    .line 6
    .line 7
    move-result p2

    .line 8
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/account/GPBindPhoneNumberInputAct;->k:Ljava/lang/String;

    .line 9
    .line 10
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/ui/account/GPBindPhoneNumberInputAct;->l:Z

    .line 11
    .line 12
    invoke-static {p0, p2, v0, v1}, Lcom/p1/mobile/putong/core/ui/account/GPBindVerifyCodeInputAct;->r2(Lcom/p1/mobile/android/app/Act;ILjava/lang/String;Z)Landroid/content/Intent;

    .line 13
    .line 14
    .line 15
    move-result-object p2

    .line 16
    const/16 v0, 0x40

    .line 17
    .line 18
    invoke-virtual {p0, p2, v0}, Landroidx/activity/ComponentActivity;->startActivityForResult(Landroid/content/Intent;I)V

    .line 19
    .line 20
    .line 21
    sput p1, Lcom/p1/mobile/putong/core/ui/account/GPBindPhoneNumberInputAct;->n:I

    .line 22
    .line 23
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/account/GPBindPhoneNumberInputAct;->k:Ljava/lang/String;

    .line 24
    .line 25
    sput-object p0, Lcom/p1/mobile/putong/core/ui/account/GPBindPhoneNumberInputAct;->m:Ljava/lang/String;

    .line 26
    .line 27
    return-void
.end method

.method public final synthetic r2(Ljava/lang/Throwable;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 2
    .line 3
    .line 4
    instance-of v0, p1, Lcom/p1/mobile/putong/api/api/TantanException$Client$AccountService;

    .line 5
    .line 6
    if-eqz v0, :cond_1

    .line 7
    .line 8
    move-object v0, p1

    .line 9
    check-cast v0, Lcom/p1/mobile/putong/api/api/TantanException$Client$AccountService;

    .line 10
    .line 11
    iget v0, v0, Lcom/p1/mobile/putong/api/api/TantanException$Client$AccountService;->code:I

    .line 12
    .line 13
    const v1, 0x9c7c

    .line 14
    .line 15
    .line 16
    if-ne v0, v1, :cond_0

    .line 17
    .line 18
    sget p1, Lcom/p1/mobile/putong/core/profile/R$string;->S0:I

    .line 19
    .line 20
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    invoke-static {p0}, Ll/o1j0;->j(Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    return-void

    .line 28
    :cond_0
    invoke-static {p1}, Ll/bsj0;->D(Ljava/lang/Throwable;)V

    .line 29
    .line 30
    .line 31
    return-void

    .line 32
    :cond_1
    invoke-static {p1}, Ll/bsj0;->D(Ljava/lang/Throwable;)V

    .line 33
    .line 34
    .line 35
    return-void
.end method

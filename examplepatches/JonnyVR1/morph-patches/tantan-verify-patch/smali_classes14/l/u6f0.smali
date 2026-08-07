.class public Ll/u6f0;
.super Ll/q6f0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/q6f0<",
        "Ll/z6f0;",
        ">;"
    }
.end annotation


# instance fields
.field public f:Ljava/lang/String;

.field public g:Ll/x20;


# direct methods
.method public constructor <init>(Ll/ner;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/q6f0;-><init>(Ll/ner;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Ll/s6f0;

    .line 5
    .line 6
    invoke-direct {p1, p0}, Ll/s6f0;-><init>(Ll/u6f0;)V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Ll/u6f0;->g:Ll/x20;

    .line 10
    .line 11
    return-void
.end method

.method public static synthetic s1(Ll/u6f0;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/u6f0;->v1(Landroid/os/Bundle;)V

    return-void
.end method

.method public static synthetic t1(Ll/u6f0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/u6f0;->x1()V

    return-void
.end method

.method private synthetic x1()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/z6f0;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/z6f0;->a()Lcom/p1/mobile/putong/app/PutongAct;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0}, Lcom/p1/mobile/putong/app/PutongAct;->pageId()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    const-string v1, "phone_num"

    .line 14
    .line 15
    iget-object v2, p0, Ll/u6f0;->f:Ljava/lang/String;

    .line 16
    .line 17
    invoke-static {v1, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    filled-new-array {v1}, [Ll/pf60;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    const-string v2, "e_quick_sign_confirm_button"

    .line 26
    .line 27
    invoke-static {v2, v0, v1}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 28
    .line 29
    .line 30
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 31
    .line 32
    check-cast v0, Ll/z6f0;

    .line 33
    .line 34
    const/4 v1, 0x0

    .line 35
    invoke-virtual {v0, v1}, Ll/z6f0;->s(Z)V

    .line 36
    .line 37
    .line 38
    new-instance v0, Lcom/p1/mobile/putong/data/SignInData;

    .line 39
    .line 40
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/SignInData;-><init>()V

    .line 41
    .line 42
    .line 43
    invoke-static {}, Ll/tl8;->M()Lcom/p1/mobile/putong/data/Device;

    .line 44
    .line 45
    .line 46
    move-result-object v1

    .line 47
    iput-object v1, v0, Lcom/p1/mobile/putong/data/SignInData;->device:Lcom/p1/mobile/putong/data/Device;

    .line 48
    .line 49
    new-instance v1, Ll/t6f0;

    .line 50
    .line 51
    invoke-direct {v1, p0}, Ll/t6f0;-><init>(Ll/u6f0;)V

    .line 52
    .line 53
    .line 54
    invoke-virtual {p0, v0, v1}, Ll/q6f0;->q1(Lcom/p1/mobile/putong/data/SignInData;Ljava/lang/Runnable;)V

    .line 55
    .line 56
    .line 57
    return-void
.end method


# virtual methods
.method public B1()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/u6f0;->g:Ll/x20;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/x20;->call()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public C1()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/z6f0;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/z6f0;->a()Lcom/p1/mobile/putong/app/PutongAct;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-object v1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 10
    .line 11
    check-cast v1, Ll/z6f0;

    .line 12
    .line 13
    invoke-virtual {v1}, Ll/z6f0;->a()Lcom/p1/mobile/putong/app/PutongAct;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-static {v1}, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/act/PhoneNumberLoginOptAct;->Z1(Lcom/p1/mobile/android/app/Act;)Landroid/content/Intent;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    invoke-virtual {v0, v1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 22
    .line 23
    .line 24
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 25
    .line 26
    check-cast v0, Ll/z6f0;

    .line 27
    .line 28
    invoke-virtual {v0}, Ll/z6f0;->a()Lcom/p1/mobile/putong/app/PutongAct;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    invoke-virtual {v0}, Lcom/p1/mobile/putong/app/PutongAct;->pageId()Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    const-string v1, "phone_num"

    .line 37
    .line 38
    iget-object p0, p0, Ll/u6f0;->f:Ljava/lang/String;

    .line 39
    .line 40
    invoke-static {v1, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

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
    const-string v1, "e_quick_sign_switch_button"

    .line 49
    .line 50
    invoke-static {v1, v0, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 51
    .line 52
    .line 53
    return-void
.end method

.method public a0()V
    .locals 1

    .line 1
    invoke-super {p0}, Ll/ibf0;->a0()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/r6f0;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Ll/r6f0;-><init>(Ll/u6f0;)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0, v0}, Ll/ar2;->creates(Ll/y20;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public g1(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/z6f0;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/z6f0;->s(Z)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public u1(Ljava/lang/String;)V
    .locals 1

    .line 1
    iput-object p1, p0, Ll/u6f0;->f:Ljava/lang/String;

    .line 2
    .line 3
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 4
    .line 5
    check-cast p0, Ll/z6f0;

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/z6f0;->a()Lcom/p1/mobile/putong/app/PutongAct;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/putong/app/PutongAct;->pageId()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    const-string v0, "phone_num"

    .line 16
    .line 17
    invoke-static {v0, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    filled-new-array {p1}, [Ll/pf60;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    const-string v0, "e_quick_sign_confirm_button"

    .line 26
    .line 27
    invoke-static {v0, p0, p1}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public final synthetic v1(Landroid/os/Bundle;)V
    .locals 1

    .line 1
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p1, Ll/z6f0;

    .line 4
    .line 5
    iget-object v0, p0, Ll/u6f0;->f:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {p1, v0}, Ll/z6f0;->A3(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 11
    .line 12
    check-cast p1, Ll/z6f0;

    .line 13
    .line 14
    iget-object p0, p0, Ll/u6f0;->f:Ljava/lang/String;

    .line 15
    .line 16
    invoke-virtual {p1, p0}, Ll/z6f0;->y(Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public z1(Ll/l4g0;)V
    .locals 2

    .line 1
    new-instance v0, Lorg/json/JSONObject;

    .line 2
    .line 3
    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 4
    .line 5
    .line 6
    :try_start_0
    const-string v1, "phone_num"

    .line 7
    .line 8
    iget-object p0, p0, Ll/u6f0;->f:Ljava/lang/String;

    .line 9
    .line 10
    invoke-virtual {v0, v1, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 11
    .line 12
    .line 13
    invoke-virtual {p1, v0}, Ll/l4g0;->o(Lorg/json/JSONObject;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 14
    .line 15
    .line 16
    :catch_0
    return-void
.end method

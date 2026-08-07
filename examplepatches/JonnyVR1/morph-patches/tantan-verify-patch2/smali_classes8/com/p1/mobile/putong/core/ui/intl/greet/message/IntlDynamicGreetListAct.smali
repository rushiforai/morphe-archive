.class public Lcom/p1/mobile/putong/core/ui/intl/greet/message/IntlDynamicGreetListAct;
.super Lcom/p1/mobile/putong/app/PutongAct;
.source "SourceFile"


# instance fields
.field public c:Ll/k4n;

.field public d:Ll/j4n;

.field public e:Lcom/p1/mobile/putong/core/data/Greeting;

.field public f:Ljava/lang/String;


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

.method public static X1(Landroid/content/Context;Lcom/p1/mobile/putong/core/data/Greeting;)Landroid/content/Intent;
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-static {p0, p1, v0}, Lcom/p1/mobile/putong/core/ui/intl/greet/message/IntlDynamicGreetListAct;->Y1(Landroid/content/Context;Lcom/p1/mobile/putong/core/data/Greeting;Ljava/lang/String;)Landroid/content/Intent;

    .line 3
    .line 4
    .line 5
    move-result-object p0

    .line 6
    return-object p0
.end method

.method public static Y1(Landroid/content/Context;Lcom/p1/mobile/putong/core/data/Greeting;Ljava/lang/String;)Landroid/content/Intent;
    .locals 2

    .line 1
    new-instance v0, Landroid/content/Intent;

    .line 2
    .line 3
    const-class v1, Lcom/p1/mobile/putong/core/ui/intl/greet/message/IntlDynamicGreetListAct;

    .line 4
    .line 5
    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 6
    .line 7
    .line 8
    const-string p0, "rp_gt"

    .line 9
    .line 10
    invoke-virtual {v0, p0, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 11
    .line 12
    .line 13
    const-string p0, "from"

    .line 14
    .line 15
    invoke-virtual {v0, p0, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 16
    .line 17
    .line 18
    return-object v0
.end method


# virtual methods
.method public Z1()Ll/j4n;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/intl/greet/message/IntlDynamicGreetListAct;->d:Ll/j4n;

    .line 2
    .line 3
    return-object p0
.end method

.method public a2()Ll/k4n;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/intl/greet/message/IntlDynamicGreetListAct;->c:Ll/k4n;

    .line 2
    .line 3
    return-object p0
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/intl/greet/message/IntlDynamicGreetListAct;->c:Ll/k4n;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ll/k4n;->inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public initDataOnCreate()V
    .locals 2

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
    const-string v1, "from"

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/intl/greet/message/IntlDynamicGreetListAct;->f:Ljava/lang/String;

    .line 15
    .line 16
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    const-string v1, "rp_gt"

    .line 21
    .line 22
    invoke-virtual {v0, v1}, Landroid/content/Intent;->getSerializableExtra(Ljava/lang/String;)Ljava/io/Serializable;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    check-cast v0, Lcom/p1/mobile/putong/core/data/Greeting;

    .line 27
    .line 28
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/intl/greet/message/IntlDynamicGreetListAct;->e:Lcom/p1/mobile/putong/core/data/Greeting;

    .line 29
    .line 30
    new-instance v0, Ll/cpo;

    .line 31
    .line 32
    invoke-direct {v0, p0}, Ll/cpo;-><init>(Lcom/p1/mobile/putong/core/ui/intl/greet/message/IntlDynamicGreetListAct;)V

    .line 33
    .line 34
    .line 35
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/intl/greet/message/IntlDynamicGreetListAct;->c:Ll/k4n;

    .line 36
    .line 37
    new-instance v0, Ll/apo;

    .line 38
    .line 39
    invoke-direct {v0, p0}, Ll/apo;-><init>(Ll/ner;)V

    .line 40
    .line 41
    .line 42
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/intl/greet/message/IntlDynamicGreetListAct;->d:Ll/j4n;

    .line 43
    .line 44
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/intl/greet/message/IntlDynamicGreetListAct;->c:Ll/k4n;

    .line 45
    .line 46
    invoke-virtual {v0, v1}, Ll/ar2;->C(Ll/iam;)V

    .line 47
    .line 48
    .line 49
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/intl/greet/message/IntlDynamicGreetListAct;->e:Lcom/p1/mobile/putong/core/data/Greeting;

    .line 50
    .line 51
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 52
    .line 53
    .line 54
    move-result v0

    .line 55
    if-eqz v0, :cond_0

    .line 56
    .line 57
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/intl/greet/message/IntlDynamicGreetListAct;->c:Ll/k4n;

    .line 58
    .line 59
    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 60
    .line 61
    iput-object v1, v0, Ll/k4n;->c:Ljava/lang/Boolean;

    .line 62
    .line 63
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/intl/greet/message/IntlDynamicGreetListAct;->e:Lcom/p1/mobile/putong/core/data/Greeting;

    .line 64
    .line 65
    const-string v1, "undefined"

    .line 66
    .line 67
    invoke-static {p0, v0, v1}, Ll/non;->l(Landroid/content/Context;Lcom/p1/mobile/putong/core/data/Greeting;Ljava/lang/String;)V

    .line 68
    .line 69
    .line 70
    const/4 v0, 0x0

    .line 71
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/intl/greet/message/IntlDynamicGreetListAct;->e:Lcom/p1/mobile/putong/core/data/Greeting;

    .line 72
    .line 73
    :cond_0
    return-void
.end method

.method public initPageHelper()V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongAct;->initPageHelper()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public initSubscription()V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongAct;->initSubscription()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/intl/greet/message/IntlDynamicGreetListAct;->d:Ll/j4n;

    .line 5
    .line 6
    invoke-virtual {p0}, Ll/j4n;->a0()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public onNewIntent(Landroid/content/Intent;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Lcom/p1/mobile/putong/app/PutongAct;->onNewIntent(Landroid/content/Intent;)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/intl/greet/message/IntlDynamicGreetListAct;->e:Lcom/p1/mobile/putong/core/data/Greeting;

    .line 5
    .line 6
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 7
    .line 8
    .line 9
    move-result p1

    .line 10
    if-eqz p1, :cond_0

    .line 11
    .line 12
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/intl/greet/message/IntlDynamicGreetListAct;->c:Ll/k4n;

    .line 13
    .line 14
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 15
    .line 16
    iput-object v0, p1, Ll/k4n;->c:Ljava/lang/Boolean;

    .line 17
    .line 18
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/intl/greet/message/IntlDynamicGreetListAct;->e:Lcom/p1/mobile/putong/core/data/Greeting;

    .line 19
    .line 20
    const-string v0, "undefined"

    .line 21
    .line 22
    invoke-static {p0, p1, v0}, Ll/non;->l(Landroid/content/Context;Lcom/p1/mobile/putong/core/data/Greeting;Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    const/4 p1, 0x0

    .line 26
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/intl/greet/message/IntlDynamicGreetListAct;->e:Lcom/p1/mobile/putong/core/data/Greeting;

    .line 27
    .line 28
    :cond_0
    return-void
.end method

.method public pageId()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "p_intl_message_hi_receive"

    .line 2
    .line 3
    return-object p0
.end method

.method public preCreateView(Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/p1/mobile/putong/app/PutongAct;->preCreateView(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Landroidx/appcompat/app/AppCompatActivity;->getSupportActionBar()Ll/c30;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    move-result p1

    .line 12
    if-eqz p1, :cond_0

    .line 13
    .line 14
    invoke-virtual {p0}, Landroidx/appcompat/app/AppCompatActivity;->getSupportActionBar()Ll/c30;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    invoke-virtual {p0}, Ll/c30;->m()V

    .line 19
    .line 20
    .line 21
    :cond_0
    return-void
.end method

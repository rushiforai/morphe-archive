.class public final Lcom/opera/ad/interstitial/AdActivity;
.super Landroid/app/Activity;
.source "SourceFile"


# static fields
.field public static b:Lox;

.field public static c:Lioo;


# instance fields
.field public a:Ln1;


# direct methods
.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    return-void
.end method

.method public static a(Lcom/opera/ad/interstitial/AdActivity;Landroid/content/Intent;)V
    .registers 5

    sget-object v0, Lcom/opera/ad/interstitial/AdActivity;->b:Lox;

    if-eqz v0, :cond_2d

    sget-object v0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    new-instance v0, Lhda;

    const/16 v1, 0x12

    const/4 v2, 0x0

    invoke-direct {v0, v2, p0, v1}, Lhda;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-static {p0, p1, v0}, Lrm5;->z(Landroid/content/ContextWrapper;Landroid/content/Intent;Lkotlin/jvm/functions/Function2;)Z

    move-result v0

    if-eqz v0, :cond_18

    invoke-virtual {p0}, Landroid/app/Activity;->finish()V

    return-void

    :cond_18
    const-string v0, "android.intent.action.VIEW"

    invoke-virtual {p1}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2d

    const-string v0, "com.android.browser.application_id"

    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p1, v0, p0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    :cond_2d
    return-void
.end method

.method public static b(Lioo;Lcom/opera/android/BrowserActivity;)V
    .registers 3

    sget-object v0, Lcom/opera/ad/interstitial/AdActivity;->c:Lioo;

    if-eqz v0, :cond_5

    return-void

    :cond_5
    sput-object p0, Lcom/opera/ad/interstitial/AdActivity;->c:Lioo;

    new-instance p0, Landroid/content/Intent;

    invoke-direct {p0}, Landroid/content/Intent;-><init>()V

    const-string v0, "android.intent.action.VIEW"

    invoke-virtual {p0, v0}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    const-class v0, Lcom/opera/ad/interstitial/AdActivity;

    invoke-virtual {p0, p1, v0}, Landroid/content/Intent;->setClass(Landroid/content/Context;Ljava/lang/Class;)Landroid/content/Intent;

    invoke-virtual {p1, p0}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V

    return-void
.end method


# virtual methods
.method public final onBackPressed()V
    .registers 2

    iget-object v0, p0, Lcom/opera/ad/interstitial/AdActivity;->a:Ln1;

    if-eqz v0, :cond_5

    return-void

    :cond_5
    invoke-super {p0}, Landroid/app/Activity;->onBackPressed()V

    return-void
.end method

.method public final onCreate(Landroid/os/Bundle;)V
    .registers 5

    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    sget-object p1, Lcom/opera/ad/interstitial/AdActivity;->c:Lioo;

    if-eqz p1, :cond_83

    instance-of v0, p1, Lkoo;

    const/4 v1, 0x1

    if-eqz v0, :cond_17

    new-instance v0, Lqjo;

    check-cast p1, Lkoo;

    const/4 v2, 0x2

    invoke-direct {v0, p0, p1, v2}, Lqjo;-><init>(Lcom/opera/ad/interstitial/AdActivity;Lk8;B)V

    :goto_14
    iput-object v0, p0, Lcom/opera/ad/interstitial/AdActivity;->a:Ln1;

    goto :goto_3b

    :cond_17
    instance-of v0, p1, Ljoo;

    if-eqz v0, :cond_24

    new-instance v0, Lqjo;

    check-cast p1, Ljoo;

    const/4 v2, 0x0

    invoke-direct {v0, p0, p1, v2}, Lqjo;-><init>(Lcom/opera/ad/interstitial/AdActivity;Lk8;B)V

    goto :goto_14

    :cond_24
    instance-of v0, p1, Llro;

    if-eqz v0, :cond_3b

    check-cast p1, Llro;

    iget-boolean v0, p1, Llro;->z:Z

    if-eqz v0, :cond_34

    new-instance v0, Lqjo;

    invoke-direct {v0, p0, p1, v1}, Lqjo;-><init>(Lcom/opera/ad/interstitial/AdActivity;Lk8;B)V

    goto :goto_39

    :cond_34
    new-instance v0, Lrjo;

    invoke-direct {v0, p0, p1}, Lrjo;-><init>(Lcom/opera/ad/interstitial/AdActivity;Llro;)V

    :goto_39
    iput-object v0, p0, Lcom/opera/ad/interstitial/AdActivity;->a:Ln1;

    :cond_3b
    :goto_3b
    invoke-virtual {p0, v1}, Landroid/app/Activity;->requestWindowFeature(I)Z

    invoke-virtual {p0}, Landroid/app/Activity;->getActionBar()Landroid/app/ActionBar;

    move-result-object p1

    if-eqz p1, :cond_47

    invoke-virtual {p1}, Landroid/app/ActionBar;->hide()V

    :cond_47
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object p1

    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v0

    new-instance v1, Loji;

    invoke-direct {v1, v0}, Loji;-><init>(Landroid/view/View;)V

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x23

    if-lt v0, v2, :cond_64

    new-instance v0, Lj3o;

    invoke-direct {v0, p1, v1}, Li3o;-><init>(Landroid/view/Window;Loji;)V

    goto :goto_73

    :cond_64
    const/16 v2, 0x1e

    if-lt v0, v2, :cond_6e

    new-instance v0, Li3o;

    invoke-direct {v0, p1, v1}, Li3o;-><init>(Landroid/view/Window;Loji;)V

    goto :goto_73

    :cond_6e
    new-instance v0, Lh3o;

    invoke-direct {v0, p1, v1}, Lh3o;-><init>(Landroid/view/Window;Loji;)V

    :goto_73
    const/16 p1, 0x207

    invoke-virtual {v0, p1}, Lw1h;->p(I)V

    invoke-virtual {v0}, Lw1h;->x()V

    iget-object p0, p0, Lcom/opera/ad/interstitial/AdActivity;->a:Ln1;

    if-eqz p0, :cond_82

    invoke-virtual {p0}, Ln1;->R()V

    :cond_82
    return-void

    :cond_83
    invoke-virtual {p0}, Landroid/app/Activity;->finish()V

    return-void
.end method

.method public final onDestroy()V
    .registers 2

    iget-object v0, p0, Lcom/opera/ad/interstitial/AdActivity;->a:Ln1;

    if-eqz v0, :cond_7

    invoke-virtual {v0}, Ln1;->X()V

    :cond_7
    sget-object v0, Lcom/opera/ad/interstitial/AdActivity;->c:Lioo;

    if-eqz v0, :cond_e

    const/4 v0, 0x0

    sput-object v0, Lcom/opera/ad/interstitial/AdActivity;->c:Lioo;

    :cond_e
    invoke-super {p0}, Landroid/app/Activity;->onDestroy()V

    return-void
.end method

.method public final onPause()V
    .registers 1

    invoke-super {p0}, Landroid/app/Activity;->onPause()V

    iget-object p0, p0, Lcom/opera/ad/interstitial/AdActivity;->a:Ln1;

    if-eqz p0, :cond_a

    invoke-virtual {p0}, Ln1;->c0()V

    :cond_a
    return-void
.end method

.method public final onResume()V
    .registers 1

    invoke-super {p0}, Landroid/app/Activity;->onResume()V

    iget-object p0, p0, Lcom/opera/ad/interstitial/AdActivity;->a:Ln1;

    if-eqz p0, :cond_a

    invoke-virtual {p0}, Ln1;->e0()V

    :cond_a
    return-void
.end method

.method public final startActivity(Landroid/content/Intent;)V
    .registers 3

    invoke-static {p0, p1}, Lcom/opera/ad/interstitial/AdActivity;->a(Lcom/opera/ad/interstitial/AdActivity;Landroid/content/Intent;)V

    :try_start_3
    invoke-virtual {p0}, Landroid/app/Activity;->isFinishing()Z

    move-result v0

    if-nez v0, :cond_c

    invoke-super {p0, p1}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V
    :try_end_c
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_c} :catch_c

    :catch_c
    :cond_c
    return-void
.end method

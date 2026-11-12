.class public abstract Lg9k;
.super Lhjf;
.source "SourceFile"


# instance fields
.field public final j:Ljava/util/ArrayList;

.field public k:Z

.field public l:Z


# direct methods
.method public constructor <init>()V
    .registers 2

    invoke-direct {p0}, Lhjf;-><init>()V

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lg9k;->j:Ljava/util/ArrayList;

    return-void
.end method


# virtual methods
.method public final F()V
    .registers 2

    iget-boolean v0, p0, Lg9k;->l:Z

    if-eqz v0, :cond_5

    return-void

    :cond_5
    const/4 v0, 0x1

    iput-boolean v0, p0, Lg9k;->l:Z

    const/4 v0, 0x5

    invoke-static {p0, v0}, Lkfo;->d0(Landroid/app/Activity;I)V

    return-void
.end method

.method public final G(Landroid/content/Intent;)V
    .registers 4

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    const-class v1, Lcom/opera/android/IntentDispatcherActivity;

    invoke-virtual {p1, v0, v1}, Landroid/content/Intent;->setClass(Landroid/content/Context;Ljava/lang/Class;)Landroid/content/Intent;

    const/high16 v0, 0x1000000

    invoke-virtual {p1, v0}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    invoke-virtual {p0, p1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    return-void
.end method

.method public final H()Z
    .registers 2

    invoke-virtual {p0}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object v0

    check-cast v0, Lcom/opera/android/OperaApplication;

    invoke-virtual {v0}, Lcom/opera/android/OperaApplication;->U()Z

    move-result v0

    if-nez v0, :cond_16

    iget-boolean v0, p0, Lg9k;->k:Z

    if-nez v0, :cond_16

    iget-boolean p0, p0, Lg9k;->l:Z

    if-nez p0, :cond_16

    const/4 p0, 0x0

    return p0

    :cond_16
    const/4 p0, 0x1

    return p0
.end method

.method public I(I)V
    .registers 2

    return-void
.end method

.method public J()V
    .registers 5

    invoke-virtual {p0}, Landroid/app/Activity;->isFinishing()Z

    move-result v0

    if-eqz v0, :cond_7

    return-void

    :cond_7
    iget-object v0, p0, Lg9k;->j:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_26

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v1

    const/4 v2, 0x0

    :goto_14
    if-ge v2, v1, :cond_22

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    add-int/lit8 v2, v2, 0x1

    check-cast v3, Landroid/content/Intent;

    invoke-virtual {p0, v3}, Lg9k;->G(Landroid/content/Intent;)V

    goto :goto_14

    :cond_22
    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    goto :goto_2e

    :cond_26
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    invoke-virtual {p0, v0}, Lg9k;->G(Landroid/content/Intent;)V

    :goto_2e
    invoke-virtual {p0}, Landroid/app/Activity;->finish()V

    return-void
.end method

.method public b(Z)V
    .registers 2

    invoke-virtual {p0}, Lg9k;->J()V

    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .registers 5

    invoke-super {p0, p1}, Lhjf;->onCreate(Landroid/os/Bundle;)V

    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object p1

    invoke-virtual {p0}, Landroid/app/Activity;->isFinishing()Z

    move-result v0

    if-nez v0, :cond_18

    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0, p1}, Landroid/content/Intent;-><init>(Landroid/content/Intent;)V

    iget-object p1, p0, Lg9k;->j:Ljava/util/ArrayList;

    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_1b

    :cond_18
    invoke-virtual {p0, p1}, Lg9k;->G(Landroid/content/Intent;)V

    :goto_1b
    invoke-static {p0}, Lf03;->f(Landroid/app/Activity;)V

    invoke-virtual {p0}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object p1

    check-cast p1, Lcom/opera/android/OperaApplication;

    invoke-virtual {p1}, Lcom/opera/android/OperaApplication;->U()Z

    move-result v0

    if-eqz v0, :cond_38

    iget-object p1, p1, Lcom/opera/android/OperaApplication;->h:Ljava/lang/Integer;

    if-nez p1, :cond_30

    const/4 p1, 0x0

    goto :goto_34

    :cond_30
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    :goto_34
    invoke-static {p0, p1}, Lkfo;->d0(Landroid/app/Activity;I)V

    return-void

    :cond_38
    iget-object p1, p1, Lcom/opera/android/OperaApplication;->n:Lorg/chromium/base/CommandLine;

    if-nez p1, :cond_3d

    const/4 p1, 0x0

    :cond_3d
    invoke-static {p0}, Lxi5;->a(Landroid/content/Context;)Lxi5;

    move-result-object v0

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1, p1}, Lfsp;->g(Landroid/content/Context;Lorg/chromium/base/CommandLine;)V

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    new-instance v2, Ldjf;

    invoke-direct {v2, p0, p1, v0}, Ldjf;-><init>(Lg9k;Lorg/chromium/base/CommandLine;Lxi5;)V

    invoke-static {v1, v2}, Le7d;->a(Landroid/content/Context;Lc7d;)V

    return-void
.end method

.method public onNewIntent(Landroid/content/Intent;)V
    .registers 3

    invoke-super {p0, p1}, Lhjf;->onNewIntent(Landroid/content/Intent;)V

    invoke-virtual {p0}, Landroid/app/Activity;->isFinishing()Z

    move-result v0

    if-nez v0, :cond_14

    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0, p1}, Landroid/content/Intent;-><init>(Landroid/content/Intent;)V

    iget-object p0, p0, Lg9k;->j:Ljava/util/ArrayList;

    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-void

    :cond_14
    invoke-virtual {p0, p1}, Lg9k;->G(Landroid/content/Intent;)V

    return-void
.end method

.method public final onPostCreate(Landroid/os/Bundle;)V
    .registers 2

    :try_start_0
    invoke-super {p0, p1}, Lfp1;->onPostCreate(Landroid/os/Bundle;)V
    :try_end_3
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_3} :catch_4

    return-void

    :catch_4
    invoke-virtual {p0}, Lg9k;->F()V

    return-void
.end method

.method public final onPostResume()V
    .registers 1

    :try_start_0
    invoke-super {p0}, Lfp1;->onPostResume()V
    :try_end_3
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_3} :catch_4

    return-void

    :catch_4
    invoke-virtual {p0}, Lg9k;->F()V

    return-void
.end method

.method public onStop()V
    .registers 1

    :try_start_0
    invoke-super {p0}, Lfp1;->onStop()V
    :try_end_3
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_3} :catch_4

    return-void

    :catch_4
    invoke-virtual {p0}, Lg9k;->F()V

    return-void
.end method

.method public final setContentView(I)V
    .registers 2

    :try_start_0
    invoke-super {p0, p1}, Lfp1;->setContentView(I)V
    :try_end_3
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_3} :catch_4

    return-void

    :catch_4
    invoke-virtual {p0}, Lg9k;->F()V

    return-void
.end method

.class public final Lcom/opera/android/browser/IntentSignalsFromNative;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public static reportInNormalMode(J)V
    .registers 5

    sget-object v0, Lt8;->a:Landroid/content/Context;

    sget-object v1, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {v0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Lcom/opera/android/OperaApplication;

    invoke-virtual {v0}, Lcom/opera/android/OperaApplication;->J()Lcom/opera/android/settings/SettingsManager;

    move-result-object v1

    const-string v2, "collect_website_categories"

    invoke-virtual {v1, v2}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_22

    invoke-virtual {v0}, Lcom/opera/android/OperaApplication;->R()Lydn;

    move-result-object v1

    iget-object v1, v1, Lydn;->d:Lvdn;

    invoke-virtual {v1}, Lvdn;->a()Z

    move-result v1

    if-eqz v1, :cond_23

    :cond_22
    return-void

    :cond_23
    invoke-virtual {v0}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object v0

    iget-object v0, v0, Ld6j;->f:Losf;

    new-instance v1, Lx41;

    const/16 v2, 0x12

    invoke-direct {v1, p0, p1, v2}, Lx41;-><init>(JB)V

    invoke-virtual {v0, v1}, Losf;->a(Lkotlin/jvm/functions/Function1;)V

    return-void
.end method

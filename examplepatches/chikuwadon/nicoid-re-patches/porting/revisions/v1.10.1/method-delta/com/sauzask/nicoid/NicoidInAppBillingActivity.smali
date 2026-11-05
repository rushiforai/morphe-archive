.class public Lcom/sauzask/nicoid/NicoidInAppBillingActivity;
.super Lcom/sauzask/nicoid/NicoidActivity;
.source ""


# instance fields
.field public A:Landroid/content/SharedPreferences$Editor;

.field public B:Lcom/android/vending/billing/IInAppBillingService;

.field public C:Landroid/content/ServiceConnection;

.field public y:I

.field public z:Landroid/content/SharedPreferences;


# virtual methods
.method public onActivityResult(IILandroid/content/Intent;)V
    .registers 6

    iget v0, p0, Lcom/sauzask/nicoid/NicoidInAppBillingActivity;->y:I

    if-ne p1, v0, :cond_59

    const/4 p1, 0x0

    const-string v0, "RESPONSE_CODE"

    invoke-virtual {p3, v0, p1}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v0

    const-string v1, "INAPP_PURCHASE_DATA"

    invoke-virtual {p3, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    const/4 p3, -0x1

    if-ne p2, p3, :cond_54

    if-nez v0, :cond_54

    iget-object p2, p0, Lcom/sauzask/nicoid/NicoidInAppBillingActivity;->A:Landroid/content/SharedPreferences$Editor;

    const/4 p3, 0x1

    const-string v0, "rma"

    invoke-interface {p2, v0, p3}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    iget-object p2, p0, Lcom/sauzask/nicoid/NicoidInAppBillingActivity;->A:Landroid/content/SharedPreferences$Editor;

    invoke-interface {p2}, Landroid/content/SharedPreferences$Editor;->commit()Z

    invoke-static {p3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p2

    .line 1
    sput-object p2, Le/e/a/v0;->h:Ljava/lang/Boolean;

    .line 2
    new-instance p2, Landroid/app/AlertDialog$Builder;

    invoke-direct {p2, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const-string p3, "\u3054\u8cfc\u5165\u3044\u305f\u3060\u304d\u3042\u308a\u304c\u3068\u3046\u3054\u3056\u3044\u307e\u3059\u3002\n\u4eca\u5f8c\u3068\u3082nicoid\u3092\u3088\u308d\u3057\u304f\u304a\u9858\u3044\u81f4\u3057\u307e\u3059\u3002"

    invoke-virtual {p2, p3}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    const p3, 0x7f0f0036

    invoke-virtual {p0, p3}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object p3

    new-instance v0, Lcom/sauzask/nicoid/NicoidInAppBillingActivity$d;

    invoke-direct {v0, p0}, Lcom/sauzask/nicoid/NicoidInAppBillingActivity$d;-><init>(Lcom/sauzask/nicoid/NicoidInAppBillingActivity;)V

    invoke-virtual {p2, p3, v0}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    invoke-virtual {p2}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object p2

    invoke-virtual {p2, p1}, Landroid/app/AlertDialog;->setCanceledOnTouchOutside(Z)V

    new-instance p1, Lcom/sauzask/nicoid/NicoidInAppBillingActivity$e;

    invoke-direct {p1, p0}, Lcom/sauzask/nicoid/NicoidInAppBillingActivity$e;-><init>(Lcom/sauzask/nicoid/NicoidInAppBillingActivity;)V

    invoke-virtual {p2, p1}, Landroid/app/AlertDialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    invoke-static {p2}, Le/e/a/PlaybackSession;->showDialog(Landroid/app/AlertDialog;)V

    goto :goto_59

    :cond_54
    const-string p2, "\u8cfc\u5165\u3092\u30ad\u30e3\u30f3\u30bb\u30eb\u3057\u307e\u3057\u305f"

    .line 3
    invoke-static {p2, p1, p0}, Le/e/a/v0;->a(Ljava/lang/String;ILandroid/content/Context;)V

    :cond_59
    :goto_59
    return-void
.end method

.class public final Lp1a;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lga6;

.field public final b:Landroid/app/Activity;

.field public c:Landroid/accounts/Account;


# direct methods
.method public constructor <init>(Landroid/app/Activity;Lga6;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lp1a;->b:Landroid/app/Activity;

    iput-object p2, p0, Lp1a;->a:Lga6;

    return-void
.end method


# virtual methods
.method public final a(IILandroid/content/Intent;)V
    .registers 9

    iget-object v0, p0, Lp1a;->a:Lga6;

    iget-object v0, v0, Lga6;->b:Ljava/lang/Object;

    check-cast v0, Lq0a;

    const/4 v1, 0x0

    const/4 v2, 0x0

    const/4 v3, -0x1

    const/16 v4, 0x3e8

    if-ne p1, v4, :cond_4b

    if-eq p2, v3, :cond_21

    if-eqz p2, :cond_19

    iget-object p0, v0, Ln1;->b:Ljava/lang/Object;

    check-cast p0, Lwjh;

    invoke-virtual {p0, v1}, Lwjh;->t(Ljava/lang/CharSequence;)V

    return-void

    :cond_19
    iget-object p0, v0, Ln1;->b:Ljava/lang/Object;

    check-cast p0, Lwjh;

    invoke-virtual {p0, v1}, Lwjh;->t(Ljava/lang/CharSequence;)V

    return-void

    :cond_21
    if-eqz p3, :cond_43

    new-instance p1, Landroid/accounts/Account;

    const-string p2, "authAccount"

    invoke-virtual {p3, p2}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    const-string v0, "accountType"

    invoke-virtual {p3, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p3

    invoke-direct {p1, p2, p3}, Landroid/accounts/Account;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    iput-object p1, p0, Lp1a;->c:Landroid/accounts/Account;

    new-instance p1, Ln1a;

    iget-object p2, p0, Lp1a;->c:Landroid/accounts/Account;

    invoke-direct {p1, p0, p2}, Ln1a;-><init>(Lp1a;Landroid/accounts/Account;)V

    new-array p0, v2, [Ljava/lang/Void;

    invoke-static {p1, p0}, Lhe2;->a(Landroid/os/AsyncTask;[Ljava/lang/Object;)Z

    return-void

    :cond_43
    iget-object p0, v0, Ln1;->b:Ljava/lang/Object;

    check-cast p0, Lwjh;

    invoke-virtual {p0, v1}, Lwjh;->t(Ljava/lang/CharSequence;)V

    return-void

    :cond_4b
    const/16 p3, 0x3e9

    if-ne p1, p3, :cond_b0

    if-eq p2, v3, :cond_63

    if-eqz p2, :cond_5b

    iget-object p0, v0, Ln1;->b:Ljava/lang/Object;

    check-cast p0, Lwjh;

    invoke-virtual {p0, v1}, Lwjh;->t(Ljava/lang/CharSequence;)V

    return-void

    :cond_5b
    iget-object p0, v0, Ln1;->b:Ljava/lang/Object;

    check-cast p0, Lwjh;

    invoke-virtual {p0, v1}, Lwjh;->t(Ljava/lang/CharSequence;)V

    return-void

    :cond_63
    iget-object p1, p0, Lp1a;->c:Landroid/accounts/Account;

    if-eqz p1, :cond_74

    new-instance p1, Ln1a;

    iget-object p2, p0, Lp1a;->c:Landroid/accounts/Account;

    invoke-direct {p1, p0, p2}, Ln1a;-><init>(Lp1a;Landroid/accounts/Account;)V

    new-array p0, v2, [Ljava/lang/Void;

    invoke-static {p1, p0}, Lhe2;->a(Landroid/os/AsyncTask;[Ljava/lang/Object;)Z

    return-void

    :cond_74
    new-instance p1, Lcom/google/android/gms/common/AccountPicker$AccountChooserOptions$Builder;

    invoke-direct {p1}, Lcom/google/android/gms/common/AccountPicker$AccountChooserOptions$Builder;-><init>()V

    const-string p2, "com.google"

    filled-new-array {p2}, [Ljava/lang/String;

    move-result-object p2

    invoke-static {p2}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object p2

    invoke-virtual {p1, p2}, Lcom/google/android/gms/common/AccountPicker$AccountChooserOptions$Builder;->setAllowableAccountsTypes(Ljava/util/List;)Lcom/google/android/gms/common/AccountPicker$AccountChooserOptions$Builder;

    move-result-object p1

    invoke-virtual {p1}, Lcom/google/android/gms/common/AccountPicker$AccountChooserOptions$Builder;->build()Lcom/google/android/gms/common/AccountPicker$AccountChooserOptions;

    move-result-object p1

    invoke-static {p1}, Lcom/google/android/gms/common/AccountPicker;->newChooseAccountIntent(Lcom/google/android/gms/common/AccountPicker$AccountChooserOptions;)Landroid/content/Intent;

    move-result-object p1

    iget-object p2, p0, Lp1a;->b:Landroid/app/Activity;

    instance-of p3, p2, Lhjf;

    if-eqz p3, :cond_aa

    move-object p3, p2

    check-cast p3, Lhjf;

    new-instance v0, Lm1a;

    invoke-direct {v0, p0, v4}, Lm1a;-><init>(Lp1a;I)V

    iget-object p0, p3, Lhjf;->c:Ljava/util/HashMap;

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p3

    invoke-virtual {p0, p3, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {p2, p1, v4}, Landroid/app/Activity;->startActivityForResult(Landroid/content/Intent;I)V

    return-void

    :cond_aa
    const/high16 p1, -0x80000000

    invoke-virtual {p0, v4, p1, v1}, Lp1a;->a(IILandroid/content/Intent;)V

    return-void

    :cond_b0
    iget-object p0, v0, Ln1;->b:Ljava/lang/Object;

    check-cast p0, Lwjh;

    invoke-virtual {p0, v1}, Lwjh;->t(Ljava/lang/CharSequence;)V

    return-void
.end method

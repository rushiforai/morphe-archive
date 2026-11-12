.class public Lcom/android/billingclient/api/ProxyBillingActivityV2;
.super Lxd5;
.source "SourceFile"


# annotations
.annotation build Lcom/google/android/apps/common/proguard/UsedByReflection;
    value = "PlatformActivityProxy"
.end annotation


# instance fields
.field public a:Lth;

.field public b:Lth;

.field public c:Lth;

.field public d:Lth;

.field public e:Lth;

.field public f:Lth;

.field public g:Landroid/os/ResultReceiver;

.field public h:Landroid/os/ResultReceiver;

.field public i:Landroid/os/ResultReceiver;

.field public j:Landroid/os/ResultReceiver;

.field public k:Landroid/os/ResultReceiver;

.field public l:Landroid/os/ResultReceiver;


# direct methods
.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Lxd5;-><init>()V

    return-void
.end method

.method public static final r()Lnh;
    .registers 2

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x24

    if-lt v0, v1, :cond_14

    new-instance v0, Lnh;

    invoke-static {}, Landroid/app/ActivityOptions;->makeBasic()Landroid/app/ActivityOptions;

    move-result-object v1

    invoke-direct {v0, v1}, Lnh;-><init>(Landroid/app/ActivityOptions;)V

    const/4 v1, 0x3

    invoke-virtual {v0, v1}, Lnh;->t0(I)Lnh;

    return-object v0

    :cond_14
    const/16 v1, 0x22

    if-lt v0, v1, :cond_26

    new-instance v0, Lnh;

    invoke-static {}, Landroid/app/ActivityOptions;->makeBasic()Landroid/app/ActivityOptions;

    move-result-object v1

    invoke-direct {v0, v1}, Lnh;-><init>(Landroid/app/ActivityOptions;)V

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lnh;->t0(I)Lnh;

    return-object v0

    :cond_26
    const/4 v0, 0x0

    return-object v0
.end method


# virtual methods
.method public final onCreate(Landroid/os/Bundle;)V
    .registers 11

    invoke-super {p0, p1}, Lxd5;->onCreate(Landroid/os/Bundle;)V

    new-instance v0, Lsh;

    const/4 v1, 0x2

    invoke-direct {v0, v1}, Lsh;-><init>(B)V

    new-instance v2, Ltvk;

    invoke-direct {v2, p0}, Ltvk;-><init>(Ljava/lang/Object;)V

    invoke-virtual {p0, v0, v2}, Lxd5;->registerForActivityResult(Lrh;Lph;)Lth;

    move-result-object v0

    iput-object v0, p0, Lcom/android/billingclient/api/ProxyBillingActivityV2;->a:Lth;

    new-instance v0, Lsh;

    invoke-direct {v0, v1}, Lsh;-><init>(B)V

    new-instance v2, Ldcl;

    invoke-direct {v2, p0}, Ldcl;-><init>(Ljava/lang/Object;)V

    invoke-virtual {p0, v0, v2}, Lxd5;->registerForActivityResult(Lrh;Lph;)Lth;

    move-result-object v0

    iput-object v0, p0, Lcom/android/billingclient/api/ProxyBillingActivityV2;->b:Lth;

    new-instance v0, Lsh;

    invoke-direct {v0, v1}, Lsh;-><init>(B)V

    new-instance v2, Lbxk;

    const/16 v3, 0x15

    invoke-direct {v2, p0, v3}, Lbxk;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p0, v0, v2}, Lxd5;->registerForActivityResult(Lrh;Lph;)Lth;

    move-result-object v0

    iput-object v0, p0, Lcom/android/billingclient/api/ProxyBillingActivityV2;->c:Lth;

    new-instance v0, Lsh;

    invoke-direct {v0, v1}, Lsh;-><init>(B)V

    new-instance v2, Lu7k;

    invoke-direct {v2, p0}, Lu7k;-><init>(Ljava/lang/Object;)V

    invoke-virtual {p0, v0, v2}, Lxd5;->registerForActivityResult(Lrh;Lph;)Lth;

    move-result-object v0

    iput-object v0, p0, Lcom/android/billingclient/api/ProxyBillingActivityV2;->d:Lth;

    new-instance v0, Lsh;

    invoke-direct {v0, v1}, Lsh;-><init>(B)V

    new-instance v2, Lppp;

    invoke-direct {v2, p0}, Lppp;-><init>(Ljava/lang/Object;)V

    invoke-virtual {p0, v0, v2}, Lxd5;->registerForActivityResult(Lrh;Lph;)Lth;

    move-result-object v0

    iput-object v0, p0, Lcom/android/billingclient/api/ProxyBillingActivityV2;->e:Lth;

    new-instance v0, Lsh;

    invoke-direct {v0, v1}, Lsh;-><init>(B)V

    new-instance v1, Luto;

    const/4 v2, 0x6

    invoke-direct {v1, p0, v2}, Luto;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p0, v0, v1}, Lxd5;->registerForActivityResult(Lrh;Lph;)Lth;

    move-result-object v0

    iput-object v0, p0, Lcom/android/billingclient/api/ProxyBillingActivityV2;->f:Lth;

    const-string v0, "subscription_management_action_result_receiver"

    const-string v1, "billing_program_information_dialog_result_receiver"

    const-string v2, "launch_external_link_result_receiver"

    const-string v3, "external_offer_flow_result_receiver"

    const-string v4, "external_payment_dialog_result_receiver"

    const-string v5, "alternative_billing_only_dialog_result_receiver"

    if-nez p1, :cond_1bc

    const-string p1, "ProxyBillingActivityV2"

    const-string v6, "Launching Play Store billing dialog"

    invoke-static {p1, v6}, Lcom/google/android/gms/internal/play_billing/zzc;->zzn(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object p1

    const-string v6, "ALTERNATIVE_BILLING_ONLY_DIALOG_INTENT"

    invoke-virtual {p1, v6}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    move-result p1

    const/4 v7, 0x0

    const/4 v8, 0x0

    if-eqz p1, :cond_b3

    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object p1

    invoke-virtual {p1, v6}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object p1

    check-cast p1, Landroid/app/PendingIntent;

    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    invoke-virtual {v0, v5}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Landroid/os/ResultReceiver;

    iput-object v0, p0, Lcom/android/billingclient/api/ProxyBillingActivityV2;->g:Landroid/os/ResultReceiver;

    iget-object p0, p0, Lcom/android/billingclient/api/ProxyBillingActivityV2;->a:Lth;

    invoke-virtual {p1}, Landroid/app/PendingIntent;->getIntentSender()Landroid/content/IntentSender;

    move-result-object p1

    new-instance v0, Lhdb;

    invoke-direct {v0, p1, v7, v8, v8}, Lhdb;-><init>(Landroid/content/IntentSender;Landroid/content/Intent;II)V

    invoke-static {}, Lcom/android/billingclient/api/ProxyBillingActivityV2;->r()Lnh;

    move-result-object p1

    invoke-virtual {p0, v0, p1}, Lth;->a(Ljava/lang/Object;Lnh;)V

    return-void

    :cond_b3
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object p1

    const-string v5, "external_payment_dialog_pending_intent"

    invoke-virtual {p1, v5}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_e8

    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object p1

    invoke-virtual {p1, v5}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object p1

    check-cast p1, Landroid/app/PendingIntent;

    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    invoke-virtual {v0, v4}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Landroid/os/ResultReceiver;

    iput-object v0, p0, Lcom/android/billingclient/api/ProxyBillingActivityV2;->h:Landroid/os/ResultReceiver;

    iget-object p0, p0, Lcom/android/billingclient/api/ProxyBillingActivityV2;->b:Lth;

    invoke-virtual {p1}, Landroid/app/PendingIntent;->getIntentSender()Landroid/content/IntentSender;

    move-result-object p1

    new-instance v0, Lhdb;

    invoke-direct {v0, p1, v7, v8, v8}, Lhdb;-><init>(Landroid/content/IntentSender;Landroid/content/Intent;II)V

    invoke-static {}, Lcom/android/billingclient/api/ProxyBillingActivityV2;->r()Lnh;

    move-result-object p1

    invoke-virtual {p0, v0, p1}, Lth;->a(Ljava/lang/Object;Lnh;)V

    return-void

    :cond_e8
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object p1

    const-string v4, "external_offer_flow_pending_intent"

    invoke-virtual {p1, v4}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_11d

    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object p1

    invoke-virtual {p1, v4}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object p1

    check-cast p1, Landroid/app/PendingIntent;

    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    invoke-virtual {v0, v3}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Landroid/os/ResultReceiver;

    iput-object v0, p0, Lcom/android/billingclient/api/ProxyBillingActivityV2;->i:Landroid/os/ResultReceiver;

    iget-object p0, p0, Lcom/android/billingclient/api/ProxyBillingActivityV2;->c:Lth;

    invoke-virtual {p1}, Landroid/app/PendingIntent;->getIntentSender()Landroid/content/IntentSender;

    move-result-object p1

    new-instance v0, Lhdb;

    invoke-direct {v0, p1, v7, v8, v8}, Lhdb;-><init>(Landroid/content/IntentSender;Landroid/content/Intent;II)V

    invoke-static {}, Lcom/android/billingclient/api/ProxyBillingActivityV2;->r()Lnh;

    move-result-object p1

    invoke-virtual {p0, v0, p1}, Lth;->a(Ljava/lang/Object;Lnh;)V

    return-void

    :cond_11d
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object p1

    const-string v3, "launch_external_link_flow_pending_intent"

    invoke-virtual {p1, v3}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_152

    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object p1

    invoke-virtual {p1, v3}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object p1

    check-cast p1, Landroid/app/PendingIntent;

    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    invoke-virtual {v0, v2}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Landroid/os/ResultReceiver;

    iput-object v0, p0, Lcom/android/billingclient/api/ProxyBillingActivityV2;->j:Landroid/os/ResultReceiver;

    iget-object p0, p0, Lcom/android/billingclient/api/ProxyBillingActivityV2;->d:Lth;

    invoke-virtual {p1}, Landroid/app/PendingIntent;->getIntentSender()Landroid/content/IntentSender;

    move-result-object p1

    new-instance v0, Lhdb;

    invoke-direct {v0, p1, v7, v8, v8}, Lhdb;-><init>(Landroid/content/IntentSender;Landroid/content/Intent;II)V

    invoke-static {}, Lcom/android/billingclient/api/ProxyBillingActivityV2;->r()Lnh;

    move-result-object p1

    invoke-virtual {p0, v0, p1}, Lth;->a(Ljava/lang/Object;Lnh;)V

    return-void

    :cond_152
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object p1

    const-string v2, "billing_program_information_dialog_pending_intent"

    invoke-virtual {p1, v2}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_187

    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object p1

    invoke-virtual {p1, v2}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object p1

    check-cast p1, Landroid/app/PendingIntent;

    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Landroid/os/ResultReceiver;

    iput-object v0, p0, Lcom/android/billingclient/api/ProxyBillingActivityV2;->k:Landroid/os/ResultReceiver;

    iget-object p0, p0, Lcom/android/billingclient/api/ProxyBillingActivityV2;->e:Lth;

    invoke-virtual {p1}, Landroid/app/PendingIntent;->getIntentSender()Landroid/content/IntentSender;

    move-result-object p1

    new-instance v0, Lhdb;

    invoke-direct {v0, p1, v7, v8, v8}, Lhdb;-><init>(Landroid/content/IntentSender;Landroid/content/Intent;II)V

    invoke-static {}, Lcom/android/billingclient/api/ProxyBillingActivityV2;->r()Lnh;

    move-result-object p1

    invoke-virtual {p0, v0, p1}, Lth;->a(Ljava/lang/Object;Lnh;)V

    return-void

    :cond_187
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object p1

    const-string v1, "SUBSCRIPTION_MANAGEMENT_INTENT"

    invoke-virtual {p1, v1}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_210

    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object p1

    invoke-virtual {p1, v1}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object p1

    check-cast p1, Landroid/app/PendingIntent;

    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Landroid/os/ResultReceiver;

    iput-object v0, p0, Lcom/android/billingclient/api/ProxyBillingActivityV2;->l:Landroid/os/ResultReceiver;

    iget-object p0, p0, Lcom/android/billingclient/api/ProxyBillingActivityV2;->f:Lth;

    invoke-virtual {p1}, Landroid/app/PendingIntent;->getIntentSender()Landroid/content/IntentSender;

    move-result-object p1

    new-instance v0, Lhdb;

    invoke-direct {v0, p1, v7, v8, v8}, Lhdb;-><init>(Landroid/content/IntentSender;Landroid/content/Intent;II)V

    invoke-static {}, Lcom/android/billingclient/api/ProxyBillingActivityV2;->r()Lnh;

    move-result-object p1

    invoke-virtual {p0, v0, p1}, Lth;->a(Ljava/lang/Object;Lnh;)V

    return-void

    :cond_1bc
    invoke-virtual {p1, v5}, Landroid/os/BaseBundle;->containsKey(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_1ca

    invoke-virtual {p1, v5}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v5

    check-cast v5, Landroid/os/ResultReceiver;

    iput-object v5, p0, Lcom/android/billingclient/api/ProxyBillingActivityV2;->g:Landroid/os/ResultReceiver;

    :cond_1ca
    invoke-virtual {p1, v4}, Landroid/os/BaseBundle;->containsKey(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_1d8

    invoke-virtual {p1, v4}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v4

    check-cast v4, Landroid/os/ResultReceiver;

    iput-object v4, p0, Lcom/android/billingclient/api/ProxyBillingActivityV2;->h:Landroid/os/ResultReceiver;

    :cond_1d8
    invoke-virtual {p1, v3}, Landroid/os/BaseBundle;->containsKey(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_1e6

    invoke-virtual {p1, v3}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v3

    check-cast v3, Landroid/os/ResultReceiver;

    iput-object v3, p0, Lcom/android/billingclient/api/ProxyBillingActivityV2;->i:Landroid/os/ResultReceiver;

    :cond_1e6
    invoke-virtual {p1, v2}, Landroid/os/BaseBundle;->containsKey(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_1f4

    invoke-virtual {p1, v2}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v2

    check-cast v2, Landroid/os/ResultReceiver;

    iput-object v2, p0, Lcom/android/billingclient/api/ProxyBillingActivityV2;->j:Landroid/os/ResultReceiver;

    :cond_1f4
    invoke-virtual {p1, v1}, Landroid/os/BaseBundle;->containsKey(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_202

    invoke-virtual {p1, v1}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v1

    check-cast v1, Landroid/os/ResultReceiver;

    iput-object v1, p0, Lcom/android/billingclient/api/ProxyBillingActivityV2;->k:Landroid/os/ResultReceiver;

    :cond_202
    invoke-virtual {p1, v0}, Landroid/os/BaseBundle;->containsKey(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_210

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object p1

    check-cast p1, Landroid/os/ResultReceiver;

    iput-object p1, p0, Lcom/android/billingclient/api/ProxyBillingActivityV2;->l:Landroid/os/ResultReceiver;

    :cond_210
    return-void
.end method

.method public final onSaveInstanceState(Landroid/os/Bundle;)V
    .registers 4

    invoke-super {p0, p1}, Lxd5;->onSaveInstanceState(Landroid/os/Bundle;)V

    iget-object v0, p0, Lcom/android/billingclient/api/ProxyBillingActivityV2;->g:Landroid/os/ResultReceiver;

    if-eqz v0, :cond_c

    const-string v1, "alternative_billing_only_dialog_result_receiver"

    invoke-virtual {p1, v1, v0}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    :cond_c
    iget-object v0, p0, Lcom/android/billingclient/api/ProxyBillingActivityV2;->h:Landroid/os/ResultReceiver;

    if-eqz v0, :cond_15

    const-string v1, "external_payment_dialog_result_receiver"

    invoke-virtual {p1, v1, v0}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    :cond_15
    iget-object v0, p0, Lcom/android/billingclient/api/ProxyBillingActivityV2;->i:Landroid/os/ResultReceiver;

    if-eqz v0, :cond_1e

    const-string v1, "external_offer_flow_result_receiver"

    invoke-virtual {p1, v1, v0}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    :cond_1e
    iget-object v0, p0, Lcom/android/billingclient/api/ProxyBillingActivityV2;->j:Landroid/os/ResultReceiver;

    if-eqz v0, :cond_27

    const-string v1, "launch_external_link_result_receiver"

    invoke-virtual {p1, v1, v0}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    :cond_27
    iget-object v0, p0, Lcom/android/billingclient/api/ProxyBillingActivityV2;->k:Landroid/os/ResultReceiver;

    if-eqz v0, :cond_30

    const-string v1, "billing_program_information_dialog_result_receiver"

    invoke-virtual {p1, v1, v0}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    :cond_30
    iget-object p0, p0, Lcom/android/billingclient/api/ProxyBillingActivityV2;->l:Landroid/os/ResultReceiver;

    if-eqz p0, :cond_39

    const-string v0, "subscription_management_action_result_receiver"

    invoke-virtual {p1, v0, p0}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    :cond_39
    return-void
.end method

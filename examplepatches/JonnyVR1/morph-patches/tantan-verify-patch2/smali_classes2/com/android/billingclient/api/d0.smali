.class final Lcom/android/billingclient/api/d0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/content/ServiceConnection;


# instance fields
.field final synthetic a:Lcom/android/billingclient/api/e0;


# direct methods
.method public synthetic constructor <init>(Lcom/android/billingclient/api/e0;Ll/g8t0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/billingclient/api/d0;->a:Lcom/android/billingclient/api/e0;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final onServiceConnected(Landroid/content/ComponentName;Landroid/os/IBinder;)V
    .locals 1

    .line 1
    const-string p1, "BillingClientTesting"

    .line 2
    .line 3
    const-string v0, "Billing Override Service connected."

    .line 4
    .line 5
    invoke-static {p1, v0}, Lcom/google/android/gms/internal/play_billing/p;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object p1, p0, Lcom/android/billingclient/api/d0;->a:Lcom/android/billingclient/api/e0;

    .line 9
    .line 10
    invoke-static {p2}, Ll/a1s0;->P2(Landroid/os/IBinder;)Ll/k2s0;

    .line 11
    .line 12
    .line 13
    move-result-object p2

    .line 14
    invoke-static {p1, p2}, Lcom/android/billingclient/api/e0;->i1(Lcom/android/billingclient/api/e0;Ll/k2s0;)V

    .line 15
    .line 16
    .line 17
    iget-object p1, p0, Lcom/android/billingclient/api/d0;->a:Lcom/android/billingclient/api/e0;

    .line 18
    .line 19
    const/4 p2, 0x2

    .line 20
    invoke-static {p1, p2}, Lcom/android/billingclient/api/e0;->j1(Lcom/android/billingclient/api/e0;I)V

    .line 21
    .line 22
    .line 23
    iget-object p0, p0, Lcom/android/billingclient/api/d0;->a:Lcom/android/billingclient/api/e0;

    .line 24
    .line 25
    const/16 p1, 0x1a

    .line 26
    .line 27
    invoke-static {p0, p1}, Lcom/android/billingclient/api/e0;->W0(Lcom/android/billingclient/api/e0;I)V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public final onServiceDisconnected(Landroid/content/ComponentName;)V
    .locals 1

    .line 1
    const-string p1, "BillingClientTesting"

    .line 2
    .line 3
    const-string v0, "Billing Override Service disconnected."

    .line 4
    .line 5
    invoke-static {p1, v0}, Lcom/google/android/gms/internal/play_billing/p;->k(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object p1, p0, Lcom/android/billingclient/api/d0;->a:Lcom/android/billingclient/api/e0;

    .line 9
    .line 10
    const/4 v0, 0x0

    .line 11
    invoke-static {p1, v0}, Lcom/android/billingclient/api/e0;->i1(Lcom/android/billingclient/api/e0;Ll/k2s0;)V

    .line 12
    .line 13
    .line 14
    iget-object p0, p0, Lcom/android/billingclient/api/d0;->a:Lcom/android/billingclient/api/e0;

    .line 15
    .line 16
    const/4 p1, 0x0

    .line 17
    invoke-static {p0, p1}, Lcom/android/billingclient/api/e0;->j1(Lcom/android/billingclient/api/e0;I)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

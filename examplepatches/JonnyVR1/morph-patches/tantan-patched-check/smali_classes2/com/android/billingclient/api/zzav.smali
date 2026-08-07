.class final Lcom/android/billingclient/api/zzav;
.super Landroid/os/ResultReceiver;
.source "SourceFile"


# instance fields
.field final synthetic zza:Ll/erm;


# direct methods
.method public constructor <init>(Lcom/android/billingclient/api/b;Landroid/os/Handler;Ll/erm;)V
    .locals 0

    .line 1
    iput-object p3, p0, Lcom/android/billingclient/api/zzav;->zza:Ll/erm;

    .line 2
    .line 3
    invoke-direct {p0, p2}, Landroid/os/ResultReceiver;-><init>(Landroid/os/Handler;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final onReceiveResult(ILandroid/os/Bundle;)V
    .locals 0
    .param p2    # Landroid/os/Bundle;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    iget-object p0, p0, Lcom/android/billingclient/api/zzav;->zza:Ll/erm;

    .line 2
    .line 3
    const-string p1, "BillingClient"

    .line 4
    .line 5
    invoke-static {p2, p1}, Lcom/google/android/gms/internal/play_billing/p;->f(Landroid/os/Bundle;Ljava/lang/String;)Ll/frm;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-interface {p0, p1}, Ll/erm;->a(Ll/frm;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

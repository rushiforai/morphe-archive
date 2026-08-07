.class final Lcom/android/billingclient/api/b0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/edv0;


# instance fields
.field final synthetic a:Ljava/util/function/Consumer;

.field final synthetic b:Ljava/lang/Runnable;

.field final synthetic c:Lcom/android/billingclient/api/e0;

.field final synthetic d:I


# direct methods
.method public constructor <init>(Lcom/android/billingclient/api/e0;ILjava/util/function/Consumer;Ljava/lang/Runnable;)V
    .locals 0

    iput p2, p0, Lcom/android/billingclient/api/b0;->d:I

    iput-object p3, p0, Lcom/android/billingclient/api/b0;->a:Ljava/util/function/Consumer;

    iput-object p4, p0, Lcom/android/billingclient/api/b0;->b:Ljava/lang/Runnable;

    iput-object p1, p0, Lcom/android/billingclient/api/b0;->c:Lcom/android/billingclient/api/e0;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final zza(Ljava/lang/Throwable;)V
    .locals 5

    .line 1
    instance-of v0, p1, Ljava/util/concurrent/TimeoutException;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/android/billingclient/api/b0;->c:Lcom/android/billingclient/api/e0;

    .line 4
    .line 5
    const-string v2, "BillingClientTesting"

    .line 6
    .line 7
    const/16 v3, 0x1c

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    const/16 v0, 0x72

    .line 12
    .line 13
    sget-object v4, Lcom/android/billingclient/api/h0;->G:Lcom/android/billingclient/api/d;

    .line 14
    .line 15
    invoke-static {v1, v0, v3, v4}, Lcom/android/billingclient/api/e0;->V0(Lcom/android/billingclient/api/e0;IILcom/android/billingclient/api/d;)V

    .line 16
    .line 17
    .line 18
    const-string v0, "Asynchronous call to Billing Override Service timed out."

    .line 19
    .line 20
    invoke-static {v2, v0, p1}, Lcom/google/android/gms/internal/play_billing/p;->l(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 21
    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_0
    const/16 v0, 0x6b

    .line 25
    .line 26
    sget-object v4, Lcom/android/billingclient/api/h0;->G:Lcom/android/billingclient/api/d;

    .line 27
    .line 28
    invoke-static {v1, v0, v3, v4}, Lcom/android/billingclient/api/e0;->V0(Lcom/android/billingclient/api/e0;IILcom/android/billingclient/api/d;)V

    .line 29
    .line 30
    .line 31
    const-string v0, "An error occurred while retrieving billing override."

    .line 32
    .line 33
    invoke-static {v2, v0, p1}, Lcom/google/android/gms/internal/play_billing/p;->l(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 34
    .line 35
    .line 36
    :goto_0
    iget-object p0, p0, Lcom/android/billingclient/api/b0;->b:Ljava/lang/Runnable;

    .line 37
    .line 38
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method public final bridge synthetic zzb(Ljava/lang/Object;)V
    .locals 2

    .line 1
    check-cast p1, Ljava/lang/Integer;

    .line 2
    .line 3
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget-object v1, p0, Lcom/android/billingclient/api/b0;->c:Lcom/android/billingclient/api/e0;

    .line 8
    .line 9
    invoke-static {v1, v0}, Lcom/android/billingclient/api/e0;->R0(Lcom/android/billingclient/api/e0;I)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    iget v0, p0, Lcom/android/billingclient/api/b0;->d:I

    .line 16
    .line 17
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 18
    .line 19
    .line 20
    move-result p1

    .line 21
    invoke-static {v1, v0, p1}, Lcom/android/billingclient/api/e0;->T0(Lcom/android/billingclient/api/e0;II)Lcom/android/billingclient/api/d;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    iget-object p0, p0, Lcom/android/billingclient/api/b0;->a:Ljava/util/function/Consumer;

    .line 26
    .line 27
    invoke-interface {p0, p1}, Ljava/util/function/Consumer;->accept(Ljava/lang/Object;)V

    .line 28
    .line 29
    .line 30
    return-void

    .line 31
    :cond_0
    iget-object p0, p0, Lcom/android/billingclient/api/b0;->b:Ljava/lang/Runnable;

    .line 32
    .line 33
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    .line 34
    .line 35
    .line 36
    return-void
.end method

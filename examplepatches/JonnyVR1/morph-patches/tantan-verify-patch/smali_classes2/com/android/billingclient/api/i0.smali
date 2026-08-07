.class final Lcom/android/billingclient/api/i0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/android/billingclient/api/g0;


# instance fields
.field private b:Lcom/google/android/gms/internal/play_billing/r0;

.field private final c:Lcom/android/billingclient/api/j0;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/google/android/gms/internal/play_billing/r0;)V
    .locals 1

    .line 1
    new-instance v0, Lcom/android/billingclient/api/j0;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Lcom/android/billingclient/api/j0;-><init>(Landroid/content/Context;)V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/android/billingclient/api/i0;->c:Lcom/android/billingclient/api/j0;

    .line 10
    .line 11
    iput-object p2, p0, Lcom/android/billingclient/api/i0;->b:Lcom/google/android/gms/internal/play_billing/r0;

    .line 12
    .line 13
    return-void
.end method


# virtual methods
.method public final a(Lcom/google/android/gms/internal/play_billing/p0;)V
    .locals 2

    .line 1
    :try_start_0
    invoke-static {}, Lcom/google/android/gms/internal/play_billing/w0;->F()Ll/may0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v1, p0, Lcom/android/billingclient/api/i0;->b:Lcom/google/android/gms/internal/play_billing/r0;

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Ll/may0;->s(Lcom/google/android/gms/internal/play_billing/r0;)Ll/may0;

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, p1}, Ll/may0;->r(Lcom/google/android/gms/internal/play_billing/p0;)Ll/may0;

    .line 11
    .line 12
    .line 13
    invoke-virtual {v0}, Ll/oox0;->k()Lcom/google/android/gms/internal/play_billing/d0;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    check-cast p1, Lcom/google/android/gms/internal/play_billing/w0;

    .line 18
    .line 19
    iget-object p0, p0, Lcom/android/billingclient/api/i0;->c:Lcom/android/billingclient/api/j0;

    .line 20
    .line 21
    invoke-virtual {p0, p1}, Lcom/android/billingclient/api/j0;->a(Lcom/google/android/gms/internal/play_billing/w0;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 22
    .line 23
    .line 24
    return-void

    .line 25
    :catchall_0
    move-exception p0

    .line 26
    const-string p1, "BillingLogger"

    .line 27
    .line 28
    const-string v0, "Unable to log."

    .line 29
    .line 30
    invoke-static {p1, v0, p0}, Lcom/google/android/gms/internal/play_billing/p;->l(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method public final b(Lcom/google/android/gms/internal/play_billing/y0;)V
    .locals 2

    .line 1
    :try_start_0
    iget-object v0, p0, Lcom/android/billingclient/api/i0;->c:Lcom/android/billingclient/api/j0;

    .line 2
    .line 3
    invoke-static {}, Lcom/google/android/gms/internal/play_billing/w0;->F()Ll/may0;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    iget-object p0, p0, Lcom/android/billingclient/api/i0;->b:Lcom/google/android/gms/internal/play_billing/r0;

    .line 8
    .line 9
    invoke-virtual {v1, p0}, Ll/may0;->s(Lcom/google/android/gms/internal/play_billing/r0;)Ll/may0;

    .line 10
    .line 11
    .line 12
    invoke-virtual {v1, p1}, Ll/may0;->t(Lcom/google/android/gms/internal/play_billing/y0;)Ll/may0;

    .line 13
    .line 14
    .line 15
    invoke-virtual {v1}, Ll/oox0;->k()Lcom/google/android/gms/internal/play_billing/d0;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    check-cast p0, Lcom/google/android/gms/internal/play_billing/w0;

    .line 20
    .line 21
    invoke-virtual {v0, p0}, Lcom/android/billingclient/api/j0;->a(Lcom/google/android/gms/internal/play_billing/w0;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 22
    .line 23
    .line 24
    return-void

    .line 25
    :catchall_0
    move-exception p0

    .line 26
    const-string p1, "BillingLogger"

    .line 27
    .line 28
    const-string v0, "Unable to log."

    .line 29
    .line 30
    invoke-static {p1, v0, p0}, Lcom/google/android/gms/internal/play_billing/p;->l(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method public final c(Lcom/google/android/gms/internal/play_billing/z0;)V
    .locals 2
    .param p1    # Lcom/google/android/gms/internal/play_billing/z0;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    :try_start_0
    invoke-static {}, Lcom/google/android/gms/internal/play_billing/w0;->F()Ll/may0;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iget-object v1, p0, Lcom/android/billingclient/api/i0;->b:Lcom/google/android/gms/internal/play_billing/r0;

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ll/may0;->s(Lcom/google/android/gms/internal/play_billing/r0;)Ll/may0;

    .line 11
    .line 12
    .line 13
    invoke-virtual {v0, p1}, Ll/may0;->u(Lcom/google/android/gms/internal/play_billing/z0;)Ll/may0;

    .line 14
    .line 15
    .line 16
    iget-object p0, p0, Lcom/android/billingclient/api/i0;->c:Lcom/android/billingclient/api/j0;

    .line 17
    .line 18
    invoke-virtual {v0}, Ll/oox0;->k()Lcom/google/android/gms/internal/play_billing/d0;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    check-cast p1, Lcom/google/android/gms/internal/play_billing/w0;

    .line 23
    .line 24
    invoke-virtual {p0, p1}, Lcom/android/billingclient/api/j0;->a(Lcom/google/android/gms/internal/play_billing/w0;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 25
    .line 26
    .line 27
    return-void

    .line 28
    :catchall_0
    move-exception p0

    .line 29
    const-string p1, "BillingLogger"

    .line 30
    .line 31
    const-string v0, "Unable to log."

    .line 32
    .line 33
    invoke-static {p1, v0, p0}, Lcom/google/android/gms/internal/play_billing/p;->l(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public final d(Lcom/google/android/gms/internal/play_billing/m0;)V
    .locals 2
    .param p1    # Lcom/google/android/gms/internal/play_billing/m0;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    :try_start_0
    invoke-static {}, Lcom/google/android/gms/internal/play_billing/w0;->F()Ll/may0;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iget-object v1, p0, Lcom/android/billingclient/api/i0;->b:Lcom/google/android/gms/internal/play_billing/r0;

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ll/may0;->s(Lcom/google/android/gms/internal/play_billing/r0;)Ll/may0;

    .line 11
    .line 12
    .line 13
    invoke-virtual {v0, p1}, Ll/may0;->o(Lcom/google/android/gms/internal/play_billing/m0;)Ll/may0;

    .line 14
    .line 15
    .line 16
    iget-object p0, p0, Lcom/android/billingclient/api/i0;->c:Lcom/android/billingclient/api/j0;

    .line 17
    .line 18
    invoke-virtual {v0}, Ll/oox0;->k()Lcom/google/android/gms/internal/play_billing/d0;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    check-cast p1, Lcom/google/android/gms/internal/play_billing/w0;

    .line 23
    .line 24
    invoke-virtual {p0, p1}, Lcom/android/billingclient/api/j0;->a(Lcom/google/android/gms/internal/play_billing/w0;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 25
    .line 26
    .line 27
    return-void

    .line 28
    :catchall_0
    move-exception p0

    .line 29
    const-string p1, "BillingLogger"

    .line 30
    .line 31
    const-string v0, "Unable to log."

    .line 32
    .line 33
    invoke-static {p1, v0, p0}, Lcom/google/android/gms/internal/play_billing/p;->l(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public final e(Lcom/google/android/gms/internal/play_billing/n0;I)V
    .locals 1
    .param p1    # Lcom/google/android/gms/internal/play_billing/n0;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    :try_start_0
    iget-object v0, p0, Lcom/android/billingclient/api/i0;->b:Lcom/google/android/gms/internal/play_billing/r0;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/google/android/gms/internal/play_billing/d0;->k()Ll/oox0;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ll/e7y0;

    .line 8
    .line 9
    invoke-virtual {v0, p2}, Ll/e7y0;->o(I)Ll/e7y0;

    .line 10
    .line 11
    .line 12
    invoke-virtual {v0}, Ll/oox0;->k()Lcom/google/android/gms/internal/play_billing/d0;

    .line 13
    .line 14
    .line 15
    move-result-object p2

    .line 16
    check-cast p2, Lcom/google/android/gms/internal/play_billing/r0;

    .line 17
    .line 18
    iput-object p2, p0, Lcom/android/billingclient/api/i0;->b:Lcom/google/android/gms/internal/play_billing/r0;

    .line 19
    .line 20
    invoke-virtual {p0, p1}, Lcom/android/billingclient/api/i0;->g(Lcom/google/android/gms/internal/play_billing/n0;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 21
    .line 22
    .line 23
    return-void

    .line 24
    :catchall_0
    move-exception p0

    .line 25
    const-string p1, "BillingLogger"

    .line 26
    .line 27
    const-string p2, "Unable to log."

    .line 28
    .line 29
    invoke-static {p1, p2, p0}, Lcom/google/android/gms/internal/play_billing/p;->l(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public final f(Lcom/google/android/gms/internal/play_billing/m0;I)V
    .locals 1
    .param p1    # Lcom/google/android/gms/internal/play_billing/m0;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    :try_start_0
    iget-object v0, p0, Lcom/android/billingclient/api/i0;->b:Lcom/google/android/gms/internal/play_billing/r0;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/google/android/gms/internal/play_billing/d0;->k()Ll/oox0;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ll/e7y0;

    .line 8
    .line 9
    invoke-virtual {v0, p2}, Ll/e7y0;->o(I)Ll/e7y0;

    .line 10
    .line 11
    .line 12
    invoke-virtual {v0}, Ll/oox0;->k()Lcom/google/android/gms/internal/play_billing/d0;

    .line 13
    .line 14
    .line 15
    move-result-object p2

    .line 16
    check-cast p2, Lcom/google/android/gms/internal/play_billing/r0;

    .line 17
    .line 18
    iput-object p2, p0, Lcom/android/billingclient/api/i0;->b:Lcom/google/android/gms/internal/play_billing/r0;

    .line 19
    .line 20
    invoke-virtual {p0, p1}, Lcom/android/billingclient/api/i0;->d(Lcom/google/android/gms/internal/play_billing/m0;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 21
    .line 22
    .line 23
    return-void

    .line 24
    :catchall_0
    move-exception p0

    .line 25
    const-string p1, "BillingLogger"

    .line 26
    .line 27
    const-string p2, "Unable to log."

    .line 28
    .line 29
    invoke-static {p1, p2, p0}, Lcom/google/android/gms/internal/play_billing/p;->l(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public final g(Lcom/google/android/gms/internal/play_billing/n0;)V
    .locals 2
    .param p1    # Lcom/google/android/gms/internal/play_billing/n0;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    :try_start_0
    invoke-static {}, Lcom/google/android/gms/internal/play_billing/w0;->F()Ll/may0;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iget-object v1, p0, Lcom/android/billingclient/api/i0;->b:Lcom/google/android/gms/internal/play_billing/r0;

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ll/may0;->s(Lcom/google/android/gms/internal/play_billing/r0;)Ll/may0;

    .line 11
    .line 12
    .line 13
    invoke-virtual {v0, p1}, Ll/may0;->q(Lcom/google/android/gms/internal/play_billing/n0;)Ll/may0;

    .line 14
    .line 15
    .line 16
    iget-object p0, p0, Lcom/android/billingclient/api/i0;->c:Lcom/android/billingclient/api/j0;

    .line 17
    .line 18
    invoke-virtual {v0}, Ll/oox0;->k()Lcom/google/android/gms/internal/play_billing/d0;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    check-cast p1, Lcom/google/android/gms/internal/play_billing/w0;

    .line 23
    .line 24
    invoke-virtual {p0, p1}, Lcom/android/billingclient/api/j0;->a(Lcom/google/android/gms/internal/play_billing/w0;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 25
    .line 26
    .line 27
    return-void

    .line 28
    :catchall_0
    move-exception p0

    .line 29
    const-string p1, "BillingLogger"

    .line 30
    .line 31
    const-string v0, "Unable to log."

    .line 32
    .line 33
    invoke-static {p1, v0, p0}, Lcom/google/android/gms/internal/play_billing/p;->l(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 34
    .line 35
    .line 36
    return-void
.end method

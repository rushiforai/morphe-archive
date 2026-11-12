.class public final Lnr2;
.super Liq2;
.source "SourceFile"


# instance fields
.field public final L:Lx5f;

.field public final M:Lyh2;

.field public N:Z


# direct methods
.method public constructor <init>(Lx5f;Lcom/opera/android/autofill/AutofillManager;Lgw;Lcom/opera/android/autofill/Address;Lyh2;)V
    .registers 12

    const v1, 0x7f1401fa

    const/4 v2, 0x0

    move-object v0, p0

    move-object v3, p2

    move-object v4, p3

    move-object v5, p4

    invoke-direct/range {v0 .. v5}, Liq2;-><init>(IILcom/opera/android/autofill/AutofillManager;Lgw;Lcom/opera/android/autofill/Address;)V

    iput-object p1, v0, Lnr2;->L:Lx5f;

    iput-object p5, v0, Lnr2;->M:Lyh2;

    return-void
.end method


# virtual methods
.method public final M0()Z
    .registers 4

    iget-boolean v0, p0, Lnr2;->N:Z

    if-eqz v0, :cond_6

    const/4 p0, 0x0

    return p0

    :cond_6
    const/4 v0, 0x1

    iput-boolean v0, p0, Lnr2;->N:Z

    iget-object v1, p0, Lnr2;->M:Lyh2;

    invoke-virtual {p0}, Liq2;->H0()Lcom/opera/android/autofill/Address;

    move-result-object v2

    invoke-virtual {v1, v2}, Lyh2;->run(Ljava/lang/Object;)V

    iget-object p0, p0, Lnr2;->L:Lx5f;

    sget-object v1, Lg80;->b:Lg80;

    invoke-virtual {p0, v1}, Lx5f;->y(Lg80;)V

    return v0
.end method

.method public final g0()V
    .registers 2

    invoke-super {p0}, Lryl;->g0()V

    iget-boolean v0, p0, Lnr2;->N:Z

    if-nez v0, :cond_d

    iget-object p0, p0, Lnr2;->M:Lyh2;

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lyh2;->run(Ljava/lang/Object;)V

    :cond_d
    return-void
.end method

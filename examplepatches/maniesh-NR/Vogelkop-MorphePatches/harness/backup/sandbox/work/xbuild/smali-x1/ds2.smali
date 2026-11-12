.class public final Lds2;
.super Liq2;
.source "SourceFile"


# direct methods
.method public constructor <init>(Lcom/opera/android/autofill/AutofillManager;Lgw;Lcom/opera/android/autofill/Address;)V
    .registers 10

    const v1, 0x7f14028c

    const v2, 0x7f100008

    move-object v0, p0

    move-object v3, p1

    move-object v4, p2

    move-object v5, p3

    invoke-direct/range {v0 .. v5}, Liq2;-><init>(IILcom/opera/android/autofill/AutofillManager;Lgw;Lcom/opera/android/autofill/Address;)V

    return-void
.end method


# virtual methods
.method public final M0()Z
    .registers 3

    invoke-virtual {p0}, Liq2;->H0()Lcom/opera/android/autofill/Address;

    move-result-object v0

    iget-object v1, p0, Liq2;->r:Lcom/opera/android/autofill/AutofillManager;

    invoke-virtual {v1, v0}, Lcom/opera/android/autofill/AutofillManager;->g(Lcom/opera/android/autofill/Address;)V

    iget-object p0, p0, Liq2;->F:Les2;

    if-eqz p0, :cond_12

    iget-object v0, v0, Lcom/opera/android/autofill/AutofillItem;->a:Ljava/lang/String;

    invoke-interface {p0, v0}, Les2;->b(Ljava/lang/String;)V

    :cond_12
    const/4 p0, 0x1

    return p0
.end method

.method public final onMenuItemClick(Landroid/view/MenuItem;)Z
    .registers 3

    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result p1

    const v0, 0x7f0a08cf

    if-ne p1, v0, :cond_19

    iget-object p1, p0, Liq2;->F:Les2;

    if-eqz p1, :cond_14

    iget-object v0, p0, Liq2;->s:Lcom/opera/android/autofill/Address;

    iget-object v0, v0, Lcom/opera/android/autofill/AutofillItem;->a:Ljava/lang/String;

    invoke-interface {p1, v0}, Les2;->a(Ljava/lang/String;)V

    :cond_14
    invoke-virtual {p0}, Lryl;->g0()V

    const/4 p0, 0x1

    return p0

    :cond_19
    const/4 p0, 0x0

    return p0
.end method

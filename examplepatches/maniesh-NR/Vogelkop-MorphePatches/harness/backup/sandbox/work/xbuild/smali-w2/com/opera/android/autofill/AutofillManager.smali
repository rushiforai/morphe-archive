.class public final Lcom/opera/android/autofill/AutofillManager;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/opera/android/autofill/AutofillManager$AutofillCallback;,
        Lcom/opera/android/autofill/AutofillManager$NormalizedAddressRequestDelegate;
    }
.end annotation


# instance fields
.field public final a:Lnrl;


# direct methods
.method public constructor <init>()V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lnrl;

    const/16 v1, 0x1a

    invoke-direct {v0, v1}, Lnrl;-><init>(B)V

    iput-object v0, p0, Lcom/opera/android/autofill/AutofillManager;->a:Lnrl;

    invoke-static {p0}, LJ/N;->MGQKLox_(Ljava/lang/Object;)V

    return-void
.end method

.method public static addAddress(Ljava/util/List;Lcom/opera/android/autofill/Address;)V
    .registers 2
    .param p0    # Ljava/util/List;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p1    # Lcom/opera/android/autofill/Address;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/opera/android/autofill/Address;",
            ">;",
            "Lcom/opera/android/autofill/Address;",
            ")V"
        }
    .end annotation

    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public static addCreditCard(Ljava/util/List;Lcom/opera/android/autofill/CreditCard;)V
    .registers 2
    .param p0    # Ljava/util/List;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p1    # Lcom/opera/android/autofill/CreditCard;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/opera/android/autofill/CreditCard;",
            ">;",
            "Lcom/opera/android/autofill/CreditCard;",
            ")V"
        }
    .end annotation

    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public static b(Ljava/lang/Runnable;)Lcom/opera/android/autofill/PersonalDataMonitor;
    .registers 4

    new-instance v0, Lcom/opera/android/autofill/PersonalDataMonitor;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object p0, v0, Lcom/opera/android/autofill/PersonalDataMonitor;->a:Ljava/lang/Runnable;

    invoke-static {v0}, LJ/N;->MdHnJVaE(Ljava/lang/Object;)J

    move-result-wide v1

    iput-wide v1, v0, Lcom/opera/android/autofill/PersonalDataMonitor;->b:J

    return-object v0
.end method

.method public static intArrayToFieldSet([ILjava/util/Set;)V
    .registers 11
    .param p0    # [I
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p1    # Ljava/util/Set;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([I",
            "Ljava/util/Set<",
            "Lew;",
            ">;)V"
        }
    .end annotation

    array-length v0, p0

    const/4 v1, 0x0

    move v2, v1

    :goto_3
    if-ge v2, v0, :cond_1f

    aget v3, p0, v2

    invoke-static {}, Lew;->values()[Lew;

    move-result-object v4

    array-length v5, v4

    move v6, v1

    :goto_d
    if-ge v6, v5, :cond_18

    aget-object v7, v4, v6

    iget-byte v8, v7, Lew;->a:B

    if-eq v8, v3, :cond_19

    add-int/lit8 v6, v6, 0x1

    goto :goto_d

    :cond_18
    const/4 v7, 0x0

    :cond_19
    invoke-interface {p1, v7}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    add-int/lit8 v2, v2, 0x1

    goto :goto_3

    :cond_1f
    return-void
.end method

.method public static loaded(Lcom/opera/android/autofill/AutofillManager;)V
    .registers 1
    .param p0    # Lcom/opera/android/autofill/AutofillManager;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    iget-object p0, p0, Lcom/opera/android/autofill/AutofillManager;->a:Lnrl;

    invoke-virtual {p0}, Lnrl;->K()V

    return-void
.end method


# virtual methods
.method public final a(Lcom/opera/android/autofill/Address;Lcom/opera/android/autofill/AutofillManager$AutofillCallback;)V
    .registers 6

    iget-object v0, p0, Lcom/opera/android/autofill/AutofillManager;->a:Lnrl;

    iget-boolean v1, v0, Lnrl;->a:Z

    if-eqz v1, :cond_a

    invoke-static {p1, p2}, LJ/N;->MhsaF0mG(Ljava/lang/Object;Ljava/lang/Object;)V

    return-void

    :cond_a
    new-instance v1, Lk3;

    const/16 v2, 0xf

    invoke-direct {v1, p0, p1, p2, v2}, Lk3;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v0, v1}, Lnrl;->d(Ljava/lang/Runnable;)Ljava/lang/Runnable;

    return-void
.end method

.method public final c(Lcom/opera/api/Callback;)V
    .registers 5

    iget-object v0, p0, Lcom/opera/android/autofill/AutofillManager;->a:Lnrl;

    iget-boolean v1, v0, Lnrl;->a:Z

    if-eqz v1, :cond_12

    new-instance p0, Ljava/util/ArrayList;

    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    invoke-static {p0}, LJ/N;->MHoflEN5(Ljava/lang/Object;)V

    invoke-interface {p1, p0}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    return-void

    :cond_12
    new-instance v1, Ldt2;

    const/4 v2, 0x1

    invoke-direct {v1, p0, p1, v2}, Ldt2;-><init>(Lcom/opera/android/autofill/AutofillManager;Lcom/opera/api/Callback;B)V

    invoke-virtual {v0, v1}, Lnrl;->d(Ljava/lang/Runnable;)Ljava/lang/Runnable;

    return-void
.end method

.method public final d(Lcom/opera/api/Callback;)V
    .registers 5

    iget-object v0, p0, Lcom/opera/android/autofill/AutofillManager;->a:Lnrl;

    iget-boolean v1, v0, Lnrl;->a:Z

    if-eqz v1, :cond_12

    new-instance p0, Ljava/util/ArrayList;

    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    invoke-static {p0}, LJ/N;->MJJRBN$k(Ljava/lang/Object;)V

    invoke-interface {p1, p0}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    return-void

    :cond_12
    new-instance v1, Ldt2;

    const/4 v2, 0x2

    invoke-direct {v1, p0, p1, v2}, Ldt2;-><init>(Lcom/opera/android/autofill/AutofillManager;Lcom/opera/api/Callback;B)V

    invoke-virtual {v0, v1}, Lnrl;->d(Ljava/lang/Runnable;)Ljava/lang/Runnable;

    return-void
.end method

.method public final e(Lcom/opera/api/Callback;)V
    .registers 5

    iget-object v0, p0, Lcom/opera/android/autofill/AutofillManager;->a:Lnrl;

    iget-boolean v1, v0, Lnrl;->a:Z

    if-eqz v1, :cond_12

    new-instance p0, Ljava/util/ArrayList;

    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    invoke-static {p0}, LJ/N;->MbezVmo7(Ljava/lang/Object;)V

    invoke-interface {p1, p0}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    return-void

    :cond_12
    new-instance v1, Ldt2;

    const/4 v2, 0x0

    invoke-direct {v1, p0, p1, v2}, Ldt2;-><init>(Lcom/opera/android/autofill/AutofillManager;Lcom/opera/api/Callback;B)V

    invoke-virtual {v0, v1}, Lnrl;->d(Ljava/lang/Runnable;)Ljava/lang/Runnable;

    return-void
.end method

.method public final f(Ljava/lang/String;)V
    .registers 4

    iget-object p0, p0, Lcom/opera/android/autofill/AutofillManager;->a:Lnrl;

    iget-boolean v0, p0, Lnrl;->a:Z

    if-eqz v0, :cond_a

    invoke-static {p1}, LJ/N;->MP0_t_nz(Ljava/lang/Object;)V

    return-void

    :cond_a
    new-instance v0, Let2;

    const/4 v1, 0x0

    invoke-direct {v0, p1, v1}, Let2;-><init>(Ljava/lang/String;B)V

    invoke-virtual {p0, v0}, Lnrl;->d(Ljava/lang/Runnable;)Ljava/lang/Runnable;

    return-void
.end method

.method public final g(Lcom/opera/android/autofill/Address;)V
    .registers 5

    iget-object v0, p0, Lcom/opera/android/autofill/AutofillManager;->a:Lnrl;

    iget-boolean v1, v0, Lnrl;->a:Z

    if-eqz v1, :cond_a

    invoke-static {p1}, LJ/N;->ME0$ESDd(Ljava/lang/Object;)V

    return-void

    :cond_a
    new-instance v1, Lbi2;

    const/4 v2, 0x6

    invoke-direct {v1, p0, p1, v2}, Lbi2;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v0, v1}, Lnrl;->d(Ljava/lang/Runnable;)Ljava/lang/Runnable;

    return-void
.end method

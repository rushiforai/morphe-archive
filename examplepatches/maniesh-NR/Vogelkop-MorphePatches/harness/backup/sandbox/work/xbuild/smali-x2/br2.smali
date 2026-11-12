.class public final Lbr2;
.super Ll7n;
.source "SourceFile"


# instance fields
.field public final b:Lwk4;

.field public final c:Lot2;

.field public final d:Lcom/opera/android/autofill/AutofillManager;

.field public final e:Lode;

.field public final f:Ljvg;

.field public g:Ljava/lang/String;

.field public h:Lcom/opera/android/autofill/CreditCard;


# direct methods
.method public constructor <init>(Lgjm;Lwk4;Lot2;Lcom/opera/android/autofill/AutofillManager;)V
    .registers 5

    invoke-direct {p0}, Ll7n;-><init>()V

    iput-object p2, p0, Lbr2;->b:Lwk4;

    iput-object p3, p0, Lbr2;->c:Lot2;

    iput-object p4, p0, Lbr2;->d:Lcom/opera/android/autofill/AutofillManager;

    new-instance p3, Lode;

    invoke-direct {p3}, Lekc;-><init>()V

    iput-object p3, p0, Lbr2;->e:Lode;

    new-instance p3, Ljvg;

    invoke-direct {p3, p0, p1}, Ljvg;-><init>(Ll7n;Lgjm;)V

    iput-object p3, p0, Lbr2;->f:Ljvg;

    new-instance p1, Ltvk;

    invoke-direct {p1, p0}, Ltvk;-><init>(Ll7n;)V

    iget-object p1, p1, Ltvk;->a:Ljava/lang/Object;

    check-cast p1, Lkze;

    new-instance p3, Lbx;

    const/4 p4, 0x1

    invoke-direct {p3, p0, p4}, Lbx;-><init>(Ll7n;B)V

    invoke-static {p2, p1, p3}, La26;->V(Lw6f;Likc;Ljava/lang/Object;)V

    return-void
.end method


# virtual methods
.method public final f(Lcom/opera/android/autofill/CreditCard;Lcom/opera/android/autofill/Address;)Lar2;
    .registers 14

    iget v0, p1, Lcom/opera/android/autofill/CreditCard;->f:I

    invoke-static {v0}, Ly9m;->W(I)I

    move-result v2

    iget-object v0, p1, Lcom/opera/android/autofill/CreditCard;->h:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    const/4 v3, 0x0

    if-gtz v1, :cond_10

    move-object v0, v3

    :cond_10
    iget-object v1, p1, Lcom/opera/android/autofill/CreditCard;->b:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v4

    if-lez v4, :cond_1a

    move-object v4, v1

    goto :goto_1b

    :cond_1a
    move-object v4, v3

    :goto_1b
    iget-object p0, p0, Lbr2;->d:Lcom/opera/android/autofill/AutofillManager;

    iget-object p0, p0, Lcom/opera/android/autofill/AutofillManager;->a:Lnrl;

    iget-boolean p0, p0, Lnrl;->a:Z

    if-nez p0, :cond_27

    const-string p0, ""

    :goto_25
    move-object v5, p0

    goto :goto_30

    :cond_27
    iget-object p0, p1, Lcom/opera/android/autofill/AutofillItem;->a:Ljava/lang/String;

    invoke-static {p0}, LJ/N;->M6qqsegZ(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    goto :goto_25

    :goto_30
    invoke-virtual {p1}, Lcom/opera/android/autofill/CreditCard;->a()Ljava/lang/String;

    move-result-object v6

    iget-object p0, p1, Lcom/opera/android/autofill/CreditCard;->e:Ljava/lang/String;

    iget-object v1, p1, Lcom/opera/android/autofill/CreditCard;->d:Ljava/lang/String;

    const/4 v7, 0x1

    :try_start_39
    invoke-static {p0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result p0

    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v1

    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v8

    invoke-virtual {v8, v7}, Ljava/util/Calendar;->get(I)I

    move-result v9

    const/4 v10, 0x2

    invoke-virtual {v8, v10}, Ljava/util/Calendar;->get(I)I

    move-result v8
    :try_end_4e
    .catch Ljava/lang/NumberFormatException; {:try_start_39 .. :try_end_4e} :catch_56

    add-int/2addr v8, v7

    if-lt p0, v9, :cond_56

    if-ne p0, v9, :cond_55

    if-lt v1, v8, :cond_56

    :cond_55
    const/4 v7, 0x0

    :catch_56
    :cond_56
    move v9, v7

    iget-object p0, p1, Lcom/opera/android/autofill/CreditCard;->i:Ljava/lang/String;

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result p1

    if-lez p1, :cond_61

    move-object v7, p0

    goto :goto_62

    :cond_61
    move-object v7, v3

    :goto_62
    if-eqz p2, :cond_66

    iget-object v3, p2, Lcom/opera/android/autofill/Address;->n:Ljava/lang/String;

    :cond_66
    move-object v8, v3

    new-instance v1, Lar2;

    move-object v3, v0

    invoke-direct/range {v1 .. v9}, Lar2;-><init>(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)V

    return-object v1
.end method

.method public final g()V
    .registers 8

    iget-object v0, p0, Lbr2;->b:Lwk4;

    invoke-virtual {v0}, Lgv2;->b()Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v1

    const/4 v2, 0x0

    :cond_b
    const/4 v3, 0x0

    if-ge v2, v1, :cond_25

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    add-int/lit8 v2, v2, 0x1

    move-object v5, v4

    check-cast v5, Lcom/opera/android/autofill/CreditCard;

    iget-object v5, v5, Lcom/opera/android/autofill/AutofillItem;->a:Ljava/lang/String;

    iget-object v6, p0, Lbr2;->g:Ljava/lang/String;

    if-nez v6, :cond_1e

    move-object v6, v3

    :cond_1e
    invoke-static {v5, v6}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_b

    goto :goto_26

    :cond_25
    move-object v4, v3

    :goto_26
    check-cast v4, Lcom/opera/android/autofill/CreditCard;

    if-nez v4, :cond_2b

    return-void

    :cond_2b
    iput-object v4, p0, Lbr2;->h:Lcom/opera/android/autofill/CreditCard;

    iget-object v0, v4, Lcom/opera/android/autofill/CreditCard;->g:Ljava/lang/String;

    if-eqz v0, :cond_44

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-eqz v0, :cond_44

    new-instance v0, Lwx;

    const/16 v1, 0xc

    invoke-direct {v0, p0, v4, v1}, Lwx;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    iget-object p0, p0, Lbr2;->d:Lcom/opera/android/autofill/AutofillManager;

    invoke-virtual {p0, v0}, Lcom/opera/android/autofill/AutofillManager;->c(Lcom/opera/api/Callback;)V

    return-void

    :cond_44
    iget-object v0, p0, Lbr2;->e:Lode;

    invoke-virtual {p0, v4, v3}, Lbr2;->f(Lcom/opera/android/autofill/CreditCard;Lcom/opera/android/autofill/Address;)Lar2;

    move-result-object p0

    invoke-virtual {v0, p0}, Lekc;->r(Ljava/lang/Object;)V

    return-void
.end method

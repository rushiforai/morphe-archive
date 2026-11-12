.class public final Lcom/opera/android/autofill/CreditCard;
.super Lcom/opera/android/autofill/AutofillItem;
.source "SourceFile"


# instance fields
.field public final b:Ljava/lang/String;

.field public final c:Ljava/lang/String;

.field public final d:Ljava/lang/String;

.field public final e:Ljava/lang/String;

.field public final f:I

.field public final g:Ljava/lang/String;

.field public final h:Ljava/lang/String;

.field public final i:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .registers 10

    invoke-direct {p0, p1}, Lcom/opera/android/autofill/AutofillItem;-><init>(Ljava/lang/String;)V

    iput-object p2, p0, Lcom/opera/android/autofill/CreditCard;->b:Ljava/lang/String;

    iput-object p4, p0, Lcom/opera/android/autofill/CreditCard;->c:Ljava/lang/String;

    iput-object p5, p0, Lcom/opera/android/autofill/CreditCard;->d:Ljava/lang/String;

    iput-object p6, p0, Lcom/opera/android/autofill/CreditCard;->e:Ljava/lang/String;

    iput p3, p0, Lcom/opera/android/autofill/CreditCard;->f:I

    iput-object p7, p0, Lcom/opera/android/autofill/CreditCard;->g:Ljava/lang/String;

    iput-object p8, p0, Lcom/opera/android/autofill/CreditCard;->h:Ljava/lang/String;

    iput-object p9, p0, Lcom/opera/android/autofill/CreditCard;->i:Ljava/lang/String;

    return-void
.end method

.method public static create(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/opera/android/autofill/CreditCard;
    .registers 10
    .param p0    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p1    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p3    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p4    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p5    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p7    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p8    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p9    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    move-object p5, p3

    move p3, p6

    move-object p6, p4

    move-object p4, p2

    move-object p2, p1

    move-object p1, p0

    new-instance p0, Lcom/opera/android/autofill/CreditCard;

    invoke-direct/range {p0 .. p9}, Lcom/opera/android/autofill/CreditCard;-><init>(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-object p0
.end method


# virtual methods
.method public final a()Ljava/lang/String;
    .registers 4

    iget-object v0, p0, Lcom/opera/android/autofill/CreditCard;->e:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_24

    const-string v1, "/"

    iget-object p0, p0, Lcom/opera/android/autofill/CreditCard;->d:Ljava/lang/String;

    invoke-static {p0, v1}, Lu35;->h(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    const/4 v2, 0x4

    if-ne v1, v2, :cond_1c

    const/4 v1, 0x2

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    :cond_1c
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_24
    const/4 p0, 0x0

    return-object p0
.end method

.method public final getBillingAddressId()Ljava/lang/String;
    .registers 1
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    iget-object p0, p0, Lcom/opera/android/autofill/CreditCard;->g:Ljava/lang/String;

    return-object p0
.end method

.method public final getCardNickname()Ljava/lang/String;
    .registers 1
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    iget-object p0, p0, Lcom/opera/android/autofill/CreditCard;->h:Ljava/lang/String;

    return-object p0
.end method

.method public final getCvc()Ljava/lang/String;
    .registers 1
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    iget-object p0, p0, Lcom/opera/android/autofill/CreditCard;->i:Ljava/lang/String;

    return-object p0
.end method

.method public final getMonth()Ljava/lang/String;
    .registers 1
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    iget-object p0, p0, Lcom/opera/android/autofill/CreditCard;->d:Ljava/lang/String;

    return-object p0
.end method

.method public final getName()Ljava/lang/String;
    .registers 1
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    iget-object p0, p0, Lcom/opera/android/autofill/CreditCard;->b:Ljava/lang/String;

    return-object p0
.end method

.method public final getYear()Ljava/lang/String;
    .registers 1
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    iget-object p0, p0, Lcom/opera/android/autofill/CreditCard;->e:Ljava/lang/String;

    return-object p0
.end method

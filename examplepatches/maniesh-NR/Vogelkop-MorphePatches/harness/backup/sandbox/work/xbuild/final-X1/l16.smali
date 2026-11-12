.class public final Ll16;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/text/TextWatcher;


# instance fields
.field public final a:Lcom/opera/android/autofill/AutofillManager;

.field public b:Z

.field public c:Z

.field public d:Z


# direct methods
.method public constructor <init>(Lcom/opera/android/autofill/AutofillManager;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll16;->a:Lcom/opera/android/autofill/AutofillManager;

    const/4 p1, 0x1

    iput-boolean p1, p0, Ll16;->b:Z

    return-void
.end method


# virtual methods
.method public final a(Landroid/text/Editable;)V
    .registers 6

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    iget-object p0, p0, Ll16;->a:Lcom/opera/android/autofill/AutofillManager;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v0}, LJ/N;->MyZkOeCB(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    const-string v0, "amex"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    const/4 v0, 0x4

    const/4 v1, 0x2

    const/4 v2, 0x1

    const/4 v3, 0x0

    if-eqz p0, :cond_24

    new-array p0, v1, [I

    aput v0, p0, v3

    const/16 v0, 0xb

    aput v0, p0, v2

    goto :goto_31

    :cond_24
    const/4 p0, 0x3

    new-array p0, p0, [I

    aput v0, p0, v3

    const/16 v0, 0x9

    aput v0, p0, v2

    const/16 v0, 0xe

    aput v0, p0, v1

    :goto_31
    array-length v0, p0

    :goto_32
    if-ge v3, v0, :cond_44

    aget v1, p0, v3

    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    move-result v2

    if-le v2, v1, :cond_41

    const-string v2, " "

    invoke-interface {p1, v1, v2}, Landroid/text/Editable;->insert(ILjava/lang/CharSequence;)Landroid/text/Editable;

    :cond_41
    add-int/lit8 v3, v3, 0x1

    goto :goto_32

    :cond_44
    return-void
.end method

.method public final afterTextChanged(Landroid/text/Editable;)V
    .registers 8

    iget-boolean v0, p0, Ll16;->c:Z

    if-eqz v0, :cond_5

    return-void

    :cond_5
    const/4 v0, 0x1

    iput-boolean v0, p0, Ll16;->c:Z

    iget-boolean v1, p0, Ll16;->b:Z

    const/16 v2, 0x10

    const/4 v3, 0x0

    if-eqz v1, :cond_30

    const-string v1, " "

    invoke-static {p1, v1}, Landroid/text/TextUtils;->indexOf(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)I

    move-result v4

    :goto_15
    if-ltz v4, :cond_21

    add-int/lit8 v5, v4, 0x1

    invoke-interface {p1, v4, v5}, Landroid/text/Editable;->delete(II)Landroid/text/Editable;

    invoke-static {p1, v1, v5}, Landroid/text/TextUtils;->indexOf(Ljava/lang/CharSequence;Ljava/lang/CharSequence;I)I

    move-result v4

    goto :goto_15

    :cond_21
    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    move-result v1

    if-le v1, v2, :cond_2c

    iput-boolean v0, p0, Ll16;->d:Z

    iput-boolean v3, p0, Ll16;->b:Z

    goto :goto_41

    :cond_2c
    invoke-virtual {p0, p1}, Ll16;->a(Landroid/text/Editable;)V

    goto :goto_41

    :cond_30
    iget-boolean v1, p0, Ll16;->d:Z

    if-eqz v1, :cond_41

    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    move-result v1

    if-gt v1, v2, :cond_41

    iput-boolean v3, p0, Ll16;->d:Z

    iput-boolean v0, p0, Ll16;->b:Z

    invoke-virtual {p0, p1}, Ll16;->a(Landroid/text/Editable;)V

    :cond_41
    :goto_41
    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    move-result p1

    if-nez p1, :cond_49

    iput-boolean v0, p0, Ll16;->b:Z

    :cond_49
    iput-boolean v3, p0, Ll16;->c:Z

    return-void
.end method

.method public final beforeTextChanged(Ljava/lang/CharSequence;III)V
    .registers 5

    return-void
.end method

.method public final onTextChanged(Ljava/lang/CharSequence;III)V
    .registers 6

    iget-boolean p3, p0, Ll16;->c:Z

    if-nez p3, :cond_1f

    iget-boolean p3, p0, Ll16;->b:Z

    if-eqz p3, :cond_1f

    if-lez p4, :cond_1f

    add-int/2addr p4, p2

    const-string p3, " "

    invoke-static {p1, p3, p2, p4}, Landroid/text/TextUtils;->indexOf(Ljava/lang/CharSequence;Ljava/lang/CharSequence;II)I

    move-result p3

    const/4 v0, -0x1

    if-ne p3, v0, :cond_1c

    const-string p3, "-"

    invoke-static {p1, p3, p2, p4}, Landroid/text/TextUtils;->indexOf(Ljava/lang/CharSequence;Ljava/lang/CharSequence;II)I

    move-result p1

    if-eq p1, v0, :cond_1f

    :cond_1c
    const/4 p1, 0x0

    iput-boolean p1, p0, Ll16;->b:Z

    :cond_1f
    return-void
.end method

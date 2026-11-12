.class public final synthetic Lft2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/opera/api/Callback;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lcom/opera/android/autofill/AutofillManager;


# direct methods
.method public synthetic constructor <init>(Lcom/opera/android/autofill/AutofillManager;B)V
    .registers 3

    iput-byte p2, p0, Lft2;->a:B

    iput-object p1, p0, Lft2;->b:Lcom/opera/android/autofill/AutofillManager;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run(Ljava/lang/Object;)V
    .registers 6

    iget-byte v0, p0, Lft2;->a:B

    iget-object p0, p0, Lft2;->b:Lcom/opera/android/autofill/AutofillManager;

    check-cast p1, Ljava/util/List;

    packed-switch v0, :pswitch_data_48

    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_d
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1f

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/opera/android/autofill/Address;

    iget-object v0, v0, Lcom/opera/android/autofill/AutofillItem;->a:Ljava/lang/String;

    invoke-virtual {p0, v0}, Lcom/opera/android/autofill/AutofillManager;->f(Ljava/lang/String;)V

    goto :goto_d

    :cond_1f
    return-void

    :pswitch_20
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_24
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_46

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/opera/android/autofill/CreditCard;

    iget-object v0, v0, Lcom/opera/android/autofill/AutofillItem;->a:Ljava/lang/String;

    iget-object v1, p0, Lcom/opera/android/autofill/AutofillManager;->a:Lnrl;

    iget-boolean v2, v1, Lnrl;->a:Z

    if-eqz v2, :cond_3c

    invoke-static {v0}, LJ/N;->Mk6fI$HM(Ljava/lang/Object;)V

    goto :goto_24

    :cond_3c
    new-instance v2, Let2;

    const/4 v3, 0x1

    invoke-direct {v2, v0, v3}, Let2;-><init>(Ljava/lang/String;B)V

    invoke-virtual {v1, v2}, Lnrl;->d(Ljava/lang/Runnable;)Ljava/lang/Runnable;

    goto :goto_24

    :cond_46
    return-void

    nop

    :pswitch_data_48
    .packed-switch 0x0
        :pswitch_20
    .end packed-switch
.end method

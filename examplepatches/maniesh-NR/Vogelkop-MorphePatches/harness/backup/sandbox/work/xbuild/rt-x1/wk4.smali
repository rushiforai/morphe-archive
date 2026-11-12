.class public final Lwk4;
.super Lgv2;
.source "SourceFile"


# virtual methods
.method public final a(Lcom/opera/android/autofill/AutofillManager;)Lkotlin/jvm/functions/Function1;
    .registers 10

    new-instance v0, Lr2;

    const/4 v6, 0x0

    const/16 v7, 0x11

    const/4 v1, 0x1

    const-class v3, Lcom/opera/android/autofill/AutofillManager;

    const-string v4, "getCreditCards"

    const-string v5, "getCreditCards(Lcom/opera/api/Callback;)V"

    move-object v2, p1

    invoke-direct/range {v0 .. v7}, Lr2;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;IB)V

    return-object v0
.end method

.method public final c(Lcom/opera/android/autofill/AutofillManager;)Lkotlin/jvm/functions/Function1;
    .registers 10

    new-instance v0, Lr2;

    const/4 v6, 0x0

    const/16 v7, 0x12

    const/4 v1, 0x1

    const-class v3, Lcom/opera/android/autofill/AutofillManager;

    const-string v4, "removeCreditCard"

    const-string v5, "removeCreditCard(Ljava/lang/String;)V"

    move-object v2, p1

    invoke-direct/range {v0 .. v7}, Lr2;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;IB)V

    return-object v0
.end method

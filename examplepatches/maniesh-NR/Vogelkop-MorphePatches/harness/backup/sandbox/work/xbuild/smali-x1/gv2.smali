.class public abstract Lgv2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lw6f;
.implements Lkkm;
.implements Llkm;


# instance fields
.field public final a:Lcom/opera/android/autofill/AutofillManager;

.field public b:Ljava/util/List;

.field public final c:Ljava/util/ArrayList;

.field public final d:Li7f;

.field public e:Lcom/opera/android/autofill/PersonalDataMonitor;


# direct methods
.method public constructor <init>(Lcom/opera/android/autofill/AutofillManager;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lgv2;->a:Lcom/opera/android/autofill/AutofillManager;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lgv2;->c:Ljava/util/ArrayList;

    new-instance v0, Li7f;

    invoke-direct {v0}, Li7f;-><init>()V

    iput-object v0, p0, Lgv2;->d:Li7f;

    iget-object v0, p0, Lgv2;->e:Lcom/opera/android/autofill/PersonalDataMonitor;

    if-nez v0, :cond_33

    new-instance v0, Lfv2;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lfv2;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v0}, Lcom/opera/android/autofill/AutofillManager;->b(Ljava/lang/Runnable;)Lcom/opera/android/autofill/PersonalDataMonitor;

    move-result-object v0

    iput-object v0, p0, Lgv2;->e:Lcom/opera/android/autofill/PersonalDataMonitor;

    invoke-virtual {p0, p1}, Lgv2;->a(Lcom/opera/android/autofill/AutofillManager;)Lkotlin/jvm/functions/Function1;

    move-result-object p1

    new-instance v0, Liu2;

    const/4 v1, 0x2

    invoke-direct {v0, p0, v1}, Liu2;-><init>(Ljava/lang/Object;B)V

    invoke-interface {p1, v0}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    :cond_33
    return-void
.end method


# virtual methods
.method public final F(Ljava/lang/Object;)V
    .registers 4

    check-cast p1, Lbx;

    iget-object v0, p0, Lgv2;->d:Li7f;

    invoke-virtual {v0, p1}, Li7f;->b(Ljava/lang/Object;)Z

    iget-object p1, p0, Lgv2;->e:Lcom/opera/android/autofill/PersonalDataMonitor;

    if-nez p1, :cond_29

    new-instance p1, Lfv2;

    const/4 v0, 0x0

    invoke-direct {p1, p0, v0}, Lfv2;-><init>(Ljava/lang/Object;B)V

    iget-object v0, p0, Lgv2;->a:Lcom/opera/android/autofill/AutofillManager;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {p1}, Lcom/opera/android/autofill/AutofillManager;->b(Ljava/lang/Runnable;)Lcom/opera/android/autofill/PersonalDataMonitor;

    move-result-object p1

    iput-object p1, p0, Lgv2;->e:Lcom/opera/android/autofill/PersonalDataMonitor;

    invoke-virtual {p0, v0}, Lgv2;->a(Lcom/opera/android/autofill/AutofillManager;)Lkotlin/jvm/functions/Function1;

    move-result-object p1

    new-instance v0, Liu2;

    const/4 v1, 0x2

    invoke-direct {v0, p0, v1}, Liu2;-><init>(Ljava/lang/Object;B)V

    invoke-interface {p1, v0}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    :cond_29
    return-void
.end method

.method public final bridge synthetic H(Ljava/lang/Object;)V
    .registers 2

    check-cast p1, Lbx;

    invoke-virtual {p0, p1}, Lgv2;->f(Lbx;)V

    return-void
.end method

.method public final N(Ljava/util/List;)Le5d;
    .registers 7

    if-nez p1, :cond_4

    sget-object p1, Ll08;->a:Ll08;

    :cond_4
    check-cast p1, Ljava/lang/Iterable;

    new-instance v0, Ljava/util/ArrayList;

    const/16 v1, 0xa

    invoke-static {p1, v1}, Lk95;->o(Ljava/lang/Iterable;I)I

    move-result v1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_15
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_52

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    iget-object v2, p0, Lgv2;->c:Ljava/util/ArrayList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    iget-object v2, p0, Lgv2;->b:Ljava/util/List;

    if-nez v2, :cond_2c

    sget-object v2, Ll08;->a:Ll08;

    :cond_2c
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    const/4 v3, 0x0

    :goto_31
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_48

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/opera/android/autofill/AutofillItem;

    iget-object v4, v4, Lcom/opera/android/autofill/AutofillItem;->a:Ljava/lang/String;

    invoke-static {v4, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_49

    add-int/lit8 v3, v3, 0x1

    goto :goto_31

    :cond_48
    const/4 v3, -0x1

    :cond_49
    new-instance v2, Lguh;

    invoke-direct {v2, v1, v3}, Lguh;-><init>(Ljava/lang/Object;I)V

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_15

    :cond_52
    invoke-virtual {p0}, Lgv2;->e()V

    new-instance p0, Le5d;

    sget-object p1, Ll08;->a:Ll08;

    const/4 v1, 0x2

    invoke-direct {p0, v0, p1, v1}, Le5d;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    return-object p0
.end method

.method public final O(Ll46;)V
    .registers 2

    return-void
.end method

.method public final R(Ljava/util/ArrayList;)V
    .registers 6

    iget-object p1, p0, Lgv2;->c:Ljava/util/ArrayList;

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v1, 0x0

    :goto_7
    if-ge v1, v0, :cond_1b

    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    add-int/lit8 v1, v1, 0x1

    check-cast v2, Ljava/lang/String;

    iget-object v3, p0, Lgv2;->a:Lcom/opera/android/autofill/AutofillManager;

    invoke-virtual {p0, v3}, Lgv2;->c(Lcom/opera/android/autofill/AutofillManager;)Lkotlin/jvm/functions/Function1;

    move-result-object v3

    invoke-interface {v3, v2}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_7

    :cond_1b
    invoke-virtual {p1}, Ljava/util/ArrayList;->clear()V

    return-void
.end method

.method public a(Lcom/opera/android/autofill/AutofillManager;)Lkotlin/jvm/functions/Function1;
    .registers 10

    new-instance v0, Lr2;

    const/4 v6, 0x0

    const/4 v7, 0x3

    const/4 v1, 0x1

    const-class v3, Lcom/opera/android/autofill/AutofillManager;

    const-string v4, "getAddresses"

    const-string v5, "getAddresses(Lcom/opera/api/Callback;)V"

    move-object v2, p1

    invoke-direct/range {v0 .. v7}, Lr2;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;IB)V

    return-object v0
.end method

.method public final b()Ljava/util/ArrayList;
    .registers 6

    iget-object v0, p0, Lgv2;->b:Ljava/util/List;

    if-nez v0, :cond_6

    sget-object v0, Ll08;->a:Ll08;

    :cond_6
    check-cast v0, Ljava/lang/Iterable;

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_11
    :goto_11
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2c

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    move-object v3, v2

    check-cast v3, Lcom/opera/android/autofill/AutofillItem;

    iget-object v4, p0, Lgv2;->c:Ljava/util/ArrayList;

    iget-object v3, v3, Lcom/opera/android/autofill/AutofillItem;->a:Ljava/lang/String;

    invoke-virtual {v4, v3}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_11

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_11

    :cond_2c
    return-object v1
.end method

.method public c(Lcom/opera/android/autofill/AutofillManager;)Lkotlin/jvm/functions/Function1;
    .registers 10

    new-instance v0, Lr2;

    const/4 v6, 0x0

    const/4 v7, 0x4

    const/4 v1, 0x1

    const-class v3, Lcom/opera/android/autofill/AutofillManager;

    const-string v4, "removeAddress"

    const-string v5, "removeAddress(Ljava/lang/String;)V"

    move-object v2, p1

    invoke-direct/range {v0 .. v7}, Lr2;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;IB)V

    return-object v0
.end method

.method public final e()V
    .registers 3

    iget-object p0, p0, Lgv2;->d:Li7f;

    invoke-static {p0, p0}, Lu35;->c(Li7f;Li7f;)Lg7f;

    move-result-object p0

    :goto_6
    invoke-virtual {p0}, Lg7f;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_2f

    invoke-virtual {p0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lbx;

    iget-byte v1, v0, Lbx;->a:B

    packed-switch v1, :pswitch_data_30

    iget-object v0, v0, Lbx;->b:Ll7n;

    check-cast v0, Ldl4;

    invoke-virtual {v0}, Ldl4;->g()V

    goto :goto_6

    :pswitch_1f
    iget-object v0, v0, Lbx;->b:Ll7n;

    check-cast v0, Lbr2;

    invoke-virtual {v0}, Lbr2;->g()V

    goto :goto_6

    :pswitch_27
    iget-object v0, v0, Lbx;->b:Ll7n;

    check-cast v0, Lcx;

    invoke-virtual {v0}, Lcx;->g()V

    goto :goto_6

    :cond_2f
    return-void

    :pswitch_data_30
    .packed-switch 0x0
        :pswitch_27
        :pswitch_1f
    .end packed-switch
.end method

.method public final f(Lbx;)V
    .registers 3

    iget-object v0, p0, Lgv2;->d:Li7f;

    invoke-virtual {v0, p1}, Li7f;->c(Ljava/lang/Object;)Z

    iget p1, v0, Li7f;->c:I

    if-nez p1, :cond_15

    iget-object p1, p0, Lgv2;->e:Lcom/opera/android/autofill/PersonalDataMonitor;

    if-eqz p1, :cond_10

    invoke-virtual {p1}, Lcom/opera/android/autofill/PersonalDataMonitor;->a()V

    :cond_10
    const/4 p1, 0x0

    iput-object p1, p0, Lgv2;->e:Lcom/opera/android/autofill/PersonalDataMonitor;

    iput-object p1, p0, Lgv2;->b:Ljava/util/List;

    :cond_15
    return-void
.end method

.method public final t(Le5d;)V
    .registers 4

    invoke-virtual {p1}, Le5d;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_4
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_18

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lguh;

    iget-object v1, p0, Lgv2;->c:Ljava/util/ArrayList;

    iget-object v0, v0, Lguh;->a:Ljava/lang/Object;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    goto :goto_4

    :cond_18
    invoke-virtual {p0}, Lgv2;->e()V

    return-void
.end method

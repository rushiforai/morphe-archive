.class public final synthetic Lvif;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lph;
.implements Lav2;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lcom/opera/android/autofill/OperaAutofillIntentDispatcherActivity;


# direct methods
.method public synthetic constructor <init>(Lcom/opera/android/autofill/OperaAutofillIntentDispatcherActivity;B)V
    .registers 3

    iput-byte p2, p0, Lvif;->a:B

    iput-object p1, p0, Lvif;->b:Lcom/opera/android/autofill/OperaAutofillIntentDispatcherActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final f(Ljava/lang/Integer;)V
    .registers 2

    sget p1, Lcom/opera/android/autofill/OperaAutofillIntentDispatcherActivity;->i:I

    iget-object p0, p0, Lvif;->b:Lcom/opera/android/autofill/OperaAutofillIntentDispatcherActivity;

    invoke-virtual {p0}, Landroid/app/Activity;->finish()V

    return-void
.end method

.method public final k(Ljava/lang/Object;)V
    .registers 5

    iget-byte v0, p0, Lvif;->a:B

    const/4 v1, -0x1

    iget-object p0, p0, Lvif;->b:Lcom/opera/android/autofill/OperaAutofillIntentDispatcherActivity;

    packed-switch v0, :pswitch_data_58

    iget-object v0, p0, Lcom/opera/android/autofill/OperaAutofillIntentDispatcherActivity;->h:Ljava/util/ArrayList;

    check-cast p1, Loh;

    sget v2, Lcom/opera/android/autofill/OperaAutofillIntentDispatcherActivity;->i:I

    iget p1, p1, Loh;->a:I

    if-ne p1, v1, :cond_29

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result p0

    const/4 p1, 0x0

    :goto_17
    if-ge p1, p0, :cond_25

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    add-int/lit8 p1, p1, 0x1

    check-cast v1, Ljava/lang/Runnable;

    invoke-interface {v1}, Ljava/lang/Runnable;->run()V

    goto :goto_17

    :cond_25
    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    goto :goto_2c

    :cond_29
    invoke-virtual {p0}, Landroid/app/Activity;->finish()V

    :goto_2c
    return-void

    :pswitch_2d
    check-cast p1, Loh;

    sget v0, Lcom/opera/android/autofill/OperaAutofillIntentDispatcherActivity;->i:I

    iget v0, p1, Loh;->a:I

    if-ne v0, v1, :cond_54

    invoke-virtual {p0}, Lcom/opera/android/autofill/OperaAutofillIntentDispatcherActivity;->u()Lxu2;

    move-result-object v0

    check-cast v0, Lcom/opera/android/OperaApplication;

    invoke-virtual {v0}, Lcom/opera/android/OperaApplication;->f()Lvu2;

    move-result-object v0

    iget-object v0, v0, Lvu2;->a:Lx5f;

    const/16 v1, 0x18

    invoke-virtual {v0, v1}, Lx5f;->S(I)V

    iget-object p1, p1, Loh;->b:Landroid/content/Intent;

    if-eqz p1, :cond_4f

    invoke-virtual {p1}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object p1

    goto :goto_50

    :cond_4f
    const/4 p1, 0x0

    :goto_50
    invoke-virtual {p0, p1}, Lcom/opera/android/autofill/OperaAutofillIntentDispatcherActivity;->t(Landroid/os/Bundle;)V

    goto :goto_57

    :cond_54
    invoke-virtual {p0}, Landroid/app/Activity;->finish()V

    :goto_57
    return-void

    :pswitch_data_58
    .packed-switch 0x0
        :pswitch_2d
    .end packed-switch
.end method

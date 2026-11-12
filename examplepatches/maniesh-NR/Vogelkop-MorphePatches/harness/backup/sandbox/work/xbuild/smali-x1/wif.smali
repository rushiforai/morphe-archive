.class public final synthetic Lwif;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lcom/opera/android/autofill/OperaAutofillIntentDispatcherActivity;


# direct methods
.method public synthetic constructor <init>(Lcom/opera/android/autofill/OperaAutofillIntentDispatcherActivity;B)V
    .registers 3

    iput-byte p2, p0, Lwif;->a:B

    iput-object p1, p0, Lwif;->b:Lcom/opera/android/autofill/OperaAutofillIntentDispatcherActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 4

    iget-byte v0, p0, Lwif;->a:B

    const/4 v1, 0x1

    iget-object p0, p0, Lwif;->b:Lcom/opera/android/autofill/OperaAutofillIntentDispatcherActivity;

    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    packed-switch v0, :pswitch_data_46

    sget v0, Lcom/opera/android/autofill/OperaAutofillIntentDispatcherActivity;->i:I

    if-eqz p1, :cond_16

    invoke-virtual {p0, v1}, Lcom/opera/android/autofill/OperaAutofillIntentDispatcherActivity;->y(Z)V

    goto :goto_19

    :cond_16
    invoke-virtual {p0}, Landroid/app/Activity;->finish()V

    :goto_19
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_1c
    sget v0, Lcom/opera/android/autofill/OperaAutofillIntentDispatcherActivity;->i:I

    if-eqz p1, :cond_24

    invoke-virtual {p0, v1}, Lcom/opera/android/autofill/OperaAutofillIntentDispatcherActivity;->A(Z)V

    goto :goto_27

    :cond_24
    invoke-virtual {p0}, Landroid/app/Activity;->finish()V

    :goto_27
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_2a
    sget v0, Lcom/opera/android/autofill/OperaAutofillIntentDispatcherActivity;->i:I

    if-eqz p1, :cond_32

    invoke-virtual {p0, v1}, Lcom/opera/android/autofill/OperaAutofillIntentDispatcherActivity;->z(Z)V

    goto :goto_35

    :cond_32
    invoke-virtual {p0}, Landroid/app/Activity;->finish()V

    :goto_35
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_38
    sget v0, Lcom/opera/android/autofill/OperaAutofillIntentDispatcherActivity;->i:I

    if-eqz p1, :cond_40

    invoke-virtual {p0, v1}, Lcom/opera/android/autofill/OperaAutofillIntentDispatcherActivity;->B(Z)V

    goto :goto_43

    :cond_40
    invoke-virtual {p0}, Landroid/app/Activity;->finish()V

    :goto_43
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_data_46
    .packed-switch 0x0
        :pswitch_38
        :pswitch_2a
        :pswitch_1c
    .end packed-switch
.end method

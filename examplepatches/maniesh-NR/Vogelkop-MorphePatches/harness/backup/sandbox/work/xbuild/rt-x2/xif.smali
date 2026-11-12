.class public final synthetic Lxif;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lcom/opera/android/autofill/OperaAutofillIntentDispatcherActivity;


# direct methods
.method public synthetic constructor <init>(Lcom/opera/android/autofill/OperaAutofillIntentDispatcherActivity;B)V
    .registers 3

    iput-byte p2, p0, Lxif;->a:B

    iput-object p1, p0, Lxif;->b:Lcom/opera/android/autofill/OperaAutofillIntentDispatcherActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke()Ljava/lang/Object;
    .registers 2

    iget-byte v0, p0, Lxif;->a:B

    iget-object p0, p0, Lxif;->b:Lcom/opera/android/autofill/OperaAutofillIntentDispatcherActivity;

    packed-switch v0, :pswitch_data_36

    sget v0, Lcom/opera/android/autofill/OperaAutofillIntentDispatcherActivity;->i:I

    const-string v0, "keyguard"

    invoke-virtual {p0, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/app/KeyguardManager;

    return-object p0

    :pswitch_12
    sget v0, Lcom/opera/android/autofill/OperaAutofillIntentDispatcherActivity;->i:I

    invoke-virtual {p0}, Lcom/opera/android/autofill/OperaAutofillIntentDispatcherActivity;->u()Lxu2;

    move-result-object p0

    check-cast p0, Lcom/opera/android/OperaApplication;

    iget-object p0, p0, Lcom/opera/android/OperaApplication;->r:Lxv1;

    iget-object p0, p0, Lxv1;->j:Lj4c;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lub2;

    return-object p0

    :pswitch_25
    sget v0, Lcom/opera/android/autofill/OperaAutofillIntentDispatcherActivity;->i:I

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    check-cast p0, Lxu2;

    return-object p0

    :pswitch_2e
    sget v0, Lcom/opera/android/autofill/OperaAutofillIntentDispatcherActivity;->i:I

    invoke-virtual {p0}, Lcom/opera/android/autofill/OperaAutofillIntentDispatcherActivity;->w()Lyif;

    move-result-object p0

    return-object p0

    nop

    :pswitch_data_36
    .packed-switch 0x0
        :pswitch_2e
        :pswitch_25
        :pswitch_12
    .end packed-switch
.end method

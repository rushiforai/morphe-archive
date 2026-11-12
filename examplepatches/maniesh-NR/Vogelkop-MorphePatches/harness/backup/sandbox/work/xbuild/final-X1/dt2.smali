.class public final synthetic Ldt2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lcom/opera/android/autofill/AutofillManager;

.field public final synthetic c:Lcom/opera/api/Callback;


# direct methods
.method public synthetic constructor <init>(Lcom/opera/android/autofill/AutofillManager;Lcom/opera/api/Callback;B)V
    .registers 4

    iput-byte p3, p0, Ldt2;->a:B

    iput-object p1, p0, Ldt2;->b:Lcom/opera/android/autofill/AutofillManager;

    iput-object p2, p0, Ldt2;->c:Lcom/opera/api/Callback;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 3

    iget-byte v0, p0, Ldt2;->a:B

    iget-object v1, p0, Ldt2;->c:Lcom/opera/api/Callback;

    iget-object p0, p0, Ldt2;->b:Lcom/opera/android/autofill/AutofillManager;

    packed-switch v0, :pswitch_data_16

    invoke-virtual {p0, v1}, Lcom/opera/android/autofill/AutofillManager;->d(Lcom/opera/api/Callback;)V

    return-void

    :pswitch_d
    invoke-virtual {p0, v1}, Lcom/opera/android/autofill/AutofillManager;->c(Lcom/opera/api/Callback;)V

    return-void

    :pswitch_11
    invoke-virtual {p0, v1}, Lcom/opera/android/autofill/AutofillManager;->e(Lcom/opera/api/Callback;)V

    return-void

    nop

    :pswitch_data_16
    .packed-switch 0x0
        :pswitch_11
        :pswitch_d
    .end packed-switch
.end method

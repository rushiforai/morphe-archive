.class public final synthetic Lut2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lcom/opera/android/autofill/passwords/picker/AutofillPasswordPickerActivity;


# direct methods
.method public synthetic constructor <init>(Lcom/opera/android/autofill/passwords/picker/AutofillPasswordPickerActivity;B)V
    .registers 3

    iput-byte p2, p0, Lut2;->a:B

    iput-object p1, p0, Lut2;->b:Lcom/opera/android/autofill/passwords/picker/AutofillPasswordPickerActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke()Ljava/lang/Object;
    .registers 3

    iget-byte v0, p0, Lut2;->a:B

    const/4 v1, 0x0

    iget-object p0, p0, Lut2;->b:Lcom/opera/android/autofill/passwords/picker/AutofillPasswordPickerActivity;

    packed-switch v0, :pswitch_data_2a

    sget v0, Lcom/opera/android/autofill/passwords/picker/AutofillPasswordPickerActivity;->o:I

    invoke-virtual {p0}, Lcom/opera/android/autofill/passwords/picker/AutofillPasswordPickerActivity;->F()Lgjm;

    move-result-object p0

    new-instance v0, Lbu2;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    invoke-virtual {p0, v0, v1}, Lgjm;->e(Ln37;Z)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_19
    sget v0, Lcom/opera/android/autofill/passwords/picker/AutofillPasswordPickerActivity;->o:I

    invoke-virtual {p0}, Lcom/opera/android/autofill/passwords/picker/AutofillPasswordPickerActivity;->F()Lgjm;

    move-result-object p0

    new-instance v0, Lbu2;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    invoke-virtual {p0, v0, v1}, Lgjm;->e(Ln37;Z)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_data_2a
    .packed-switch 0x0
        :pswitch_19
    .end packed-switch
.end method

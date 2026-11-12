.class public final synthetic Lrt2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/opera/api/Callback;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lw3g;

.field public final synthetic c:Lst2;


# direct methods
.method public synthetic constructor <init>(Lst2;Lw3g;)V
    .registers 4

    const/4 v0, 0x0

    iput-byte v0, p0, Lrt2;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lrt2;->c:Lst2;

    iput-object p2, p0, Lrt2;->b:Lw3g;

    return-void
.end method

.method public synthetic constructor <init>(Lw3g;Lst2;)V
    .registers 4

    .line 11
    const/4 v0, 0x1

    iput-byte v0, p0, Lrt2;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lrt2;->b:Lw3g;

    iput-object p2, p0, Lrt2;->c:Lst2;

    return-void
.end method


# virtual methods
.method public final run(Ljava/lang/Object;)V
    .registers 4

    iget-byte v0, p0, Lrt2;->a:B

    iget-object v1, p0, Lrt2;->c:Lst2;

    iget-object p0, p0, Lrt2;->b:Lw3g;

    packed-switch v0, :pswitch_data_2e

    check-cast p1, La4g;

    iget p0, p0, Lw3g;->a:I

    invoke-virtual {p1, p0}, La4g;->b(I)Lw3g;

    move-result-object p0

    if-eqz p0, :cond_1c

    iget-object v0, v1, Lst2;->b:Lcom/opera/android/autofill/passwords/picker/AutofillPasswordPickerActivity;

    invoke-virtual {p1, p0}, La4g;->c(Lw3g;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p0, p1}, Lcom/opera/android/autofill/passwords/picker/AutofillPasswordPickerActivity;->G(Lw3g;Ljava/lang/String;)V

    :cond_1c
    return-void

    :pswitch_1d
    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object p1, v1, Lst2;->c:Lx5g;

    new-instance v0, Lrt2;

    invoke-direct {v0, p0, v1}, Lrt2;-><init>(Lw3g;Lst2;)V

    invoke-virtual {p1, v0}, Lx5g;->a(Lcom/opera/api/Callback;)V

    return-void

    nop

    :pswitch_data_2e
    .packed-switch 0x0
        :pswitch_1d
    .end packed-switch
.end method

.class public final synthetic Lk93;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/content/DialogInterface$OnDismissListener;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;B)V
    .registers 3

    iput-byte p2, p0, Lk93;->a:B

    iput-object p1, p0, Lk93;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onDismiss(Landroid/content/DialogInterface;)V
    .registers 4

    iget-byte v0, p0, Lk93;->a:B

    iget-object p0, p0, Lk93;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_34

    check-cast p0, Lqvl;

    sget-object p1, Lhjm;->b:Lhjm;

    invoke-virtual {p0, p1}, Ld63;->finish(Lhjm;)V

    const/4 p1, 0x0

    iput-object p1, p0, Lqvl;->b:Lrzg;

    return-void

    :pswitch_12
    check-cast p0, Lkotlin/jvm/functions/Function0;

    invoke-static {p0, p1}, Lcom/usercentrics/sdk/PredefinedUIAlertDialogFactory;->b(Lkotlin/jvm/functions/Function0;Landroid/content/DialogInterface;)V

    return-void

    :pswitch_18
    check-cast p0, Lvq3;

    iget-object p1, p0, Lvq3;->b:Lh7f;

    invoke-static {p1, p1}, Lam2;->h(Lh7f;Lh7f;)Lg7f;

    move-result-object p1

    :goto_20
    invoke-virtual {p1}, Lg7f;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_32

    invoke-virtual {p1}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ly6f;

    iget-object v1, p0, Lvq3;->c:Lhjm;

    invoke-interface {v0, v1}, Ly6f;->a(Lhjm;)V

    goto :goto_20

    :cond_32
    return-void

    nop

    :pswitch_data_34
    .packed-switch 0x0
        :pswitch_18
        :pswitch_12
    .end packed-switch
.end method

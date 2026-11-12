.class public final synthetic Lur2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lvr2;

.field public final synthetic c:Lcom/opera/android/autofill/Address;


# direct methods
.method public synthetic constructor <init>(Lvr2;Lcom/opera/android/autofill/Address;B)V
    .registers 4

    iput-byte p3, p0, Lur2;->a:B

    iput-object p1, p0, Lur2;->b:Lvr2;

    iput-object p2, p0, Lur2;->c:Lcom/opera/android/autofill/Address;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .registers 5

    iget-byte v0, p0, Lur2;->a:B

    iget-object v1, p0, Lur2;->c:Lcom/opera/android/autofill/Address;

    iget-object p0, p0, Lur2;->b:Lvr2;

    packed-switch v0, :pswitch_data_1c

    new-instance v0, Lxw;

    iget-object p0, p0, Lvr2;->c:Lwr2;

    const/4 v2, 0x1

    invoke-direct {v0, p0, v1, v2}, Lxw;-><init>(Ljava/lang/Object;Lcom/opera/android/autofill/Address;B)V

    invoke-virtual {v0, p1}, Lo73;->p(Landroid/view/View;)V

    return-void

    :pswitch_15
    iget-object p0, p0, Lvr2;->c:Lwr2;

    invoke-virtual {p0, v1}, Lwr2;->I0(Lcom/opera/android/autofill/Address;)V

    return-void

    nop

    :pswitch_data_1c
    .packed-switch 0x0
        :pswitch_15
    .end packed-switch
.end method

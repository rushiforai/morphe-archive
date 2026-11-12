.class public final synthetic Lsc6;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ltc6;


# direct methods
.method public synthetic constructor <init>(Ltc6;B)V
    .registers 3

    iput-byte p2, p0, Lsc6;->a:B

    iput-object p1, p0, Lsc6;->b:Ltc6;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .registers 4

    iget-byte p1, p0, Lsc6;->a:B

    const/4 v0, 0x1

    iget-object p0, p0, Lsc6;->b:Ltc6;

    packed-switch p1, :pswitch_data_2c

    iget-boolean p1, p0, Ltc6;->A:Z

    xor-int/2addr p1, v0

    iput-boolean p1, p0, Ltc6;->A:Z

    invoke-virtual {p0}, Ltc6;->I0()V

    return-void

    :pswitch_11
    iget-object p1, p0, Ltc6;->z:Ly83;

    iget-object p1, p1, Ly83;->c:Ljava/lang/Object;

    check-cast p1, Lcom/opera/android/settings/BigSwitchButton;

    iget-byte p1, p1, Lcom/opera/android/settings/BigSwitchButton;->c:B

    const/4 v1, 0x3

    if-ne p1, v1, :cond_1d

    const/4 v0, 0x0

    :cond_1d
    iget-object p1, p0, Ltc6;->u:Lcom/opera/android/settings/SettingsManager;

    const-string v1, "compression"

    invoke-virtual {p1, v0, v1}, Lcom/opera/android/settings/SettingsManager;->V(ILjava/lang/String;)V

    invoke-virtual {p0}, Ltc6;->J0()V

    invoke-virtual {p0}, Ltc6;->H0()V

    return-void

    nop

    :pswitch_data_2c
    .packed-switch 0x0
        :pswitch_11
    .end packed-switch
.end method

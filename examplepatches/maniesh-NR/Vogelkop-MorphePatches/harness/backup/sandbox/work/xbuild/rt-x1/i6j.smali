.class public final synthetic Li6j;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lvlf;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lk6j;


# direct methods
.method public synthetic constructor <init>(Lk6j;B)V
    .registers 3

    iput-byte p2, p0, Li6j;->a:B

    iput-object p1, p0, Li6j;->b:Lk6j;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final u(Lcom/opera/android/ui/catalog/widget/OperaListItem;Z)V
    .registers 5

    iget-byte p1, p0, Li6j;->a:B

    const/4 v0, 0x0

    const/4 v1, 0x1

    iget-object p0, p0, Li6j;->b:Lk6j;

    packed-switch p1, :pswitch_data_a8

    sget-object p1, Lk6j;->x:[Lxtb;

    invoke-virtual {p0}, Lk6j;->I0()Ldaj;

    move-result-object p0

    iget-object p0, p0, Ldaj;->n:Ldxe;

    if-eqz p0, :cond_16

    invoke-virtual {p0, p2, v1}, Ldxe;->T(ZZ)V

    :cond_16
    return-void

    :pswitch_17
    sget-object p1, Lk6j;->x:[Lxtb;

    invoke-virtual {p0}, Lk6j;->I0()Ldaj;

    move-result-object p0

    iget-object p1, p0, Ldaj;->m:Lkw3;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object p1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    if-eqz p1, :cond_32

    iget-object p0, p0, Lj93;->b:Lcom/opera/android/settings/SettingsManager;

    const-string p1, "tracker_blocker"

    invoke-virtual {p0, p2, p1}, Lcom/opera/android/settings/SettingsManager;->V(ILjava/lang/String;)V

    goto :goto_4b

    :cond_32
    iget-object p1, p0, Ldaj;->g:Lsyl;

    new-instance p2, Lbaj;

    invoke-direct {p2, p0, v0}, Lbaj;-><init>(Ldaj;B)V

    iget-object p0, p1, Lsyl;->a:Lcom/opera/android/BrowserActivity;

    new-instance p1, Lqj;

    const/16 v0, 0x8

    invoke-direct {p1, p2, v0}, Lqj;-><init>(Ljava/lang/Runnable;B)V

    const p2, 0x7f1412d3

    const v0, 0x7f1412d2

    invoke-static {p0, p1, p2, v0}, Lxf8;->s0(Landroid/content/Context;Lekj;II)V

    :goto_4b
    return-void

    :pswitch_4c
    sget-object p1, Lk6j;->x:[Lxtb;

    invoke-virtual {p0}, Lk6j;->I0()Ldaj;

    move-result-object p0

    iget-object p1, p0, Ldaj;->l:Lkw3;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object p1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    if-eqz p1, :cond_67

    iget-object p0, p0, Lj93;->b:Lcom/opera/android/settings/SettingsManager;

    const-string p1, "ad_blocking"

    invoke-virtual {p0, p2, p1}, Lcom/opera/android/settings/SettingsManager;->V(ILjava/lang/String;)V

    goto :goto_7e

    :cond_67
    iget-object p1, p0, Ldaj;->f:Lrj;

    new-instance p2, Lbaj;

    invoke-direct {p2, p0, v1}, Lbaj;-><init>(Ldaj;B)V

    iget-object p0, p1, Lrj;->a:Lcom/opera/android/BrowserActivity;

    new-instance p1, Lqj;

    invoke-direct {p1, p2, v0}, Lqj;-><init>(Ljava/lang/Runnable;B)V

    const p2, 0x7f14008b

    const v0, 0x7f14008a

    invoke-static {p0, p1, p2, v0}, Lxf8;->s0(Landroid/content/Context;Lekj;II)V

    :goto_7e
    return-void

    :pswitch_7f
    sget-object p1, Lk6j;->x:[Lxtb;

    invoke-virtual {p0}, Lk6j;->I0()Ldaj;

    move-result-object p0

    iget-object p0, p0, Lj93;->b:Lcom/opera/android/settings/SettingsManager;

    const-string p1, "compression"

    invoke-virtual {p0, p2, p1}, Lcom/opera/android/settings/SettingsManager;->V(ILjava/lang/String;)V

    return-void

    :pswitch_8d
    sget-object p1, Lk6j;->x:[Lxtb;

    invoke-virtual {p0}, Lk6j;->I0()Ldaj;

    move-result-object p0

    iget-object p0, p0, Ldaj;->j:Lydn;

    invoke-virtual {p0, p2}, Lydn;->C(Z)V

    return-void

    :pswitch_99
    sget-object p1, Lk6j;->x:[Lxtb;

    invoke-virtual {p0}, Lk6j;->I0()Ldaj;

    move-result-object p0

    iget-object p0, p0, Lj93;->b:Lcom/opera/android/settings/SettingsManager;

    const-string p1, "ai_assistant_menu_shortcut"

    invoke-virtual {p0, p2, p1}, Lcom/opera/android/settings/SettingsManager;->V(ILjava/lang/String;)V

    return-void

    nop

    :pswitch_data_a8
    .packed-switch 0x0
        :pswitch_99
        :pswitch_8d
        :pswitch_7f
        :pswitch_4c
        :pswitch_17
    .end packed-switch
.end method

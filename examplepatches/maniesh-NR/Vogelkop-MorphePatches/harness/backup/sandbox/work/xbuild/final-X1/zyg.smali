.class public final synthetic Lzyg;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lvlf;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lazg;


# direct methods
.method public synthetic constructor <init>(Lazg;B)V
    .registers 3

    iput-byte p2, p0, Lzyg;->a:B

    iput-object p1, p0, Lzyg;->b:Lazg;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final u(Lcom/opera/android/ui/catalog/widget/OperaListItem;Z)V
    .registers 5

    iget-byte p1, p0, Lzyg;->a:B

    const/4 v0, 0x0

    iget-object p0, p0, Lzyg;->b:Lazg;

    packed-switch p1, :pswitch_data_90

    invoke-virtual {p0}, Lazg;->I0()Lhzg;

    move-result-object p0

    iget-object p1, p0, Lhzg;->j:Lkw3;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object p1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    if-eqz p1, :cond_21

    iget-object p0, p0, Lj93;->b:Lcom/opera/android/settings/SettingsManager;

    const-string p1, "ad_blocking"

    invoke-virtual {p0, p2, p1}, Lcom/opera/android/settings/SettingsManager;->V(ILjava/lang/String;)V

    goto :goto_39

    :cond_21
    iget-object p1, p0, Lhzg;->e:Lrj;

    new-instance p2, Lfzg;

    const/4 v1, 0x1

    invoke-direct {p2, p0, v1}, Lfzg;-><init>(Lhzg;B)V

    iget-object p0, p1, Lrj;->a:Lcom/opera/android/BrowserActivity;

    new-instance p1, Lqj;

    invoke-direct {p1, p2, v0}, Lqj;-><init>(Ljava/lang/Runnable;B)V

    const p2, 0x7f14008b

    const v0, 0x7f14008a

    invoke-static {p0, p1, p2, v0}, Lxf8;->s0(Landroid/content/Context;Lekj;II)V

    :goto_39
    return-void

    :pswitch_3a
    invoke-virtual {p0}, Lazg;->I0()Lhzg;

    move-result-object p0

    iget-object p0, p0, Lhzg;->h:Lydn;

    invoke-virtual {p0, p2}, Lydn;->C(Z)V

    return-void

    :pswitch_44
    invoke-virtual {p0}, Lazg;->I0()Lhzg;

    move-result-object p0

    iget-object p0, p0, Lj93;->b:Lcom/opera/android/settings/SettingsManager;

    const-string p1, "block_popups"

    invoke-virtual {p0, p2, p1}, Lcom/opera/android/settings/SettingsManager;->V(ILjava/lang/String;)V

    return-void

    :pswitch_50
    invoke-virtual {p0}, Lazg;->I0()Lhzg;

    move-result-object p0

    iget-object p0, p0, Lj93;->b:Lcom/opera/android/settings/SettingsManager;

    const-string p1, "safe_browsing_enabled"

    invoke-virtual {p0, p2, p1}, Lcom/opera/android/settings/SettingsManager;->V(ILjava/lang/String;)V

    return-void

    :pswitch_5c
    invoke-virtual {p0}, Lazg;->I0()Lhzg;

    move-result-object p0

    iget-object p1, p0, Lhzg;->k:Lkw3;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object p1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    if-eqz p1, :cond_75

    iget-object p0, p0, Lj93;->b:Lcom/opera/android/settings/SettingsManager;

    const-string p1, "tracker_blocker"

    invoke-virtual {p0, p2, p1}, Lcom/opera/android/settings/SettingsManager;->V(ILjava/lang/String;)V

    goto :goto_8e

    :cond_75
    iget-object p1, p0, Lhzg;->f:Lsyl;

    new-instance p2, Lfzg;

    invoke-direct {p2, p0, v0}, Lfzg;-><init>(Lhzg;B)V

    iget-object p0, p1, Lsyl;->a:Lcom/opera/android/BrowserActivity;

    new-instance p1, Lqj;

    const/16 v0, 0x8

    invoke-direct {p1, p2, v0}, Lqj;-><init>(Ljava/lang/Runnable;B)V

    const p2, 0x7f1412d3

    const v0, 0x7f1412d2

    invoke-static {p0, p1, p2, v0}, Lxf8;->s0(Landroid/content/Context;Lekj;II)V

    :goto_8e
    return-void

    nop

    :pswitch_data_90
    .packed-switch 0x0
        :pswitch_5c
        :pswitch_50
        :pswitch_44
        :pswitch_3a
    .end packed-switch
.end method

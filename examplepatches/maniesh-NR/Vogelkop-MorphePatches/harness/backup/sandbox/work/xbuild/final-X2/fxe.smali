.class public final synthetic Lfxe;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lvlf;
.implements Lh93;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lkxe;


# direct methods
.method public synthetic constructor <init>(Lkxe;B)V
    .registers 3

    iput-byte p2, p0, Lfxe;->a:B

    iput-object p1, p0, Lfxe;->b:Lkxe;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final s()V
    .registers 2

    iget-object p0, p0, Lfxe;->b:Lkxe;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->requireContext()Landroid/content/Context;

    move-result-object p0

    invoke-static {p0}, Lq9n;->o(Landroid/content/Context;)Lcom/opera/android/BrowserActivity;

    move-result-object p0

    if-eqz p0, :cond_17

    const-class v0, Ld8j;

    iget-object p0, p0, Lcom/opera/android/BrowserActivity;->g0:Lwub;

    invoke-virtual {p0, v0}, Lwub;->E(Ljava/lang/Class;)Ljnf;

    move-result-object p0

    check-cast p0, Ld8j;

    goto :goto_18

    :cond_17
    const/4 p0, 0x0

    :goto_18
    if-eqz p0, :cond_1f

    check-cast p0, Lg8j;

    invoke-virtual {p0}, Lg8j;->h()V

    :cond_1f
    return-void
.end method

.method public final u(Lcom/opera/android/ui/catalog/widget/OperaListItem;Z)V
    .registers 5

    iget-byte v0, p0, Lfxe;->a:B

    const/4 v1, 0x1

    iget-object p0, p0, Lfxe;->b:Lkxe;

    packed-switch v0, :pswitch_data_54

    if-eqz p2, :cond_2f

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Landroid/provider/Settings;->canDrawOverlays(Landroid/content/Context;)Z

    move-result v0

    if-nez v0, :cond_32

    invoke-virtual {p1}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->toggle()V

    iput-boolean v1, p0, Lkxe;->L:Z

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/r;

    move-result-object p1

    check-cast p1, Lcom/opera/android/BrowserActivity;

    iget-object p2, p0, Lkxe;->B:Lz77;

    new-instance v0, Lwpe;

    invoke-direct {v0, p0, p1}, Lwpe;-><init>(Lkxe;Lcom/opera/android/BrowserActivity;)V

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object p0, Lijm;->b:Lijm;

    invoke-virtual {p2, v0, p0}, Lr22;->b(Ljjm;Lijm;)V

    goto :goto_39

    :cond_2f
    const/4 p1, 0x0

    iput-boolean p1, p0, Lkxe;->L:Z

    :cond_32
    iget-object p0, p0, Lkxe;->y:Lcom/opera/android/settings/SettingsManager;

    const-string p1, "night_mode_overlay_keyboard"

    invoke-virtual {p0, p2, p1}, Lcom/opera/android/settings/SettingsManager;->V(ILjava/lang/String;)V

    :goto_39
    return-void

    :pswitch_3a
    iget-object p0, p0, Lkxe;->y:Lcom/opera/android/settings/SettingsManager;

    const-string p1, "darken_websites"

    invoke-virtual {p0, p2, p1}, Lcom/opera/android/settings/SettingsManager;->V(ILjava/lang/String;)V

    return-void

    :pswitch_42
    iget-object p0, p0, Lkxe;->y:Lcom/opera/android/settings/SettingsManager;

    const-string p1, "night_mode_switch_theme"

    invoke-virtual {p0, p2, p1}, Lcom/opera/android/settings/SettingsManager;->V(ILjava/lang/String;)V

    return-void

    :pswitch_4a
    iget-object p1, p0, Lkxe;->J:Ldxe;

    invoke-virtual {p1, p2, v1}, Ldxe;->T(ZZ)V

    invoke-virtual {p0}, Lkxe;->J0()V

    return-void

    nop

    :pswitch_data_54
    .packed-switch 0x0
        :pswitch_4a
        :pswitch_42
        :pswitch_3a
    .end packed-switch
.end method

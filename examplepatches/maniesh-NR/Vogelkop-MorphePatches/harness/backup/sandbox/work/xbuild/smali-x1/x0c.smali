.class public final synthetic Lx0c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lh93;
.implements Ls3m;
.implements Lvlf;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lf1c;


# direct methods
.method public synthetic constructor <init>(Lf1c;B)V
    .registers 3

    iput-byte p2, p0, Lx0c;->a:B

    iput-object p1, p0, Lx0c;->b:Lf1c;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a(Lszb;)V
    .registers 3

    iget-object p0, p0, Lx0c;->b:Lf1c;

    iget-object p0, p0, Lf1c;->z:Lv3m;

    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0, v0}, Lv3m;->j(Lszb;IZ)V

    return-void
.end method

.method public final s()V
    .registers 2

    iget-object p0, p0, Lx0c;->b:Lf1c;

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
    .registers 4

    iget-byte p1, p0, Lx0c;->a:B

    iget-object p0, p0, Lx0c;->b:Lf1c;

    packed-switch p1, :pswitch_data_30

    iget-object p1, p0, Lf1c;->x:Lcom/opera/android/settings/SettingsManager;

    iget-object p0, p0, Lf1c;->B:Lcr2;

    iget-object p0, p0, Lcr2;->f:Landroid/view/View;

    check-cast p0, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    invoke-virtual {p0}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->isChecked()Z

    move-result p0

    const-string p2, "translate_web_pages_backup_translation_method_enabled"

    invoke-virtual {p1, p0, p2}, Lcom/opera/android/settings/SettingsManager;->V(ILjava/lang/String;)V

    return-void

    :pswitch_19
    iget-object p0, p0, Lf1c;->z:Lv3m;

    invoke-virtual {p0}, Lv3m;->g()Z

    move-result p1

    if-eq p1, p2, :cond_2f

    iget-object p1, p0, Lv3m;->b:Lcom/opera/android/settings/SettingsManager;

    const-string v0, "translate_web_pages_enabled"

    invoke-virtual {p1, p2, v0}, Lcom/opera/android/settings/SettingsManager;->V(ILjava/lang/String;)V

    invoke-virtual {p0}, Lv3m;->d()Lszb;

    move-result-object p1

    invoke-virtual {p0, p1}, Lv3m;->i(Lszb;)V

    :cond_2f
    return-void

    :pswitch_data_30
    .packed-switch 0x2
        :pswitch_19
    .end packed-switch
.end method

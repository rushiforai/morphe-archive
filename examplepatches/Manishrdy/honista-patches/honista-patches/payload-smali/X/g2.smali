.class public LX/z丳ظر乂ЕΣΔ乓Ь业九ΛЦΥПεНβ丐ؤح么乆;
.super LX/i乆φ乂Ж丒я乏ωξی万δρТنκД丌б义乧зс;

.method private synthetic a0(Landroid/view/View;)V
    .locals 0
    invoke-virtual {p0}, LX/z丳ظر乂ЕΣΔ乓Ь业九ΛЦΥПεНβ丐ؤح么乆;->O()V
    return-void
.end method

.method private synthetic c0(Landroid/view/View;)V
    .locals 0
    invoke-virtual {p0}, LX/z丳ظر乂ЕΣΔ乓Ь业九ΛЦΥПεНβ丐ؤح么乆;->O()V
    return-void
.end method

.method public final O()V
    .locals 3
    invoke-virtual {p0}, Landroid/app/Fragment;->getActivity()Landroid/app/Activity;
    move-result-object v0
    if-eqz v0, :done
    new-instance v1, Landroid/app/AlertDialog$Builder;
    invoke-direct {v1, v0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V
    const-string v0, "Premium subscription"
    invoke-virtual {v1, v0}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;
    const-string v0, "Local premium features enabled through December 31, 2099. Honista ads are disabled."
    invoke-virtual {v1, v0}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;
    const-string v0, "OK"
    const/4 v2, 0x0
    invoke-virtual {v1, v0, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;
    invoke-virtual {v1}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;
    :done
    return-void
.end method

.method public final g0()V
    .locals 2
    const-wide v0, 0x3bb2cc3d7ffL
    invoke-virtual {p0, v0, v1}, LX/z丳ظر乂ЕΣΔ乓Ь业九ΛЦΥПεНβ丐ؤح么乆;->l0(J)V
    return-void
.end method

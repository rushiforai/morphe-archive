.class public Lcom/sauzask/nicoid/NicoidSetting$f;
.super Ljava/lang/Object;
.source ""

# interfaces
.implements Landroid/preference/Preference$OnPreferenceClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/sauzask/nicoid/NicoidSetting;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/sauzask/nicoid/NicoidSetting;


# virtual methods
.method public onPreferenceClick(Landroid/preference/Preference;)Z
    .registers 6

    new-instance p1, Landroid/app/AlertDialog$Builder;

    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidSetting$f;->a:Lcom/sauzask/nicoid/NicoidSetting;

    invoke-direct {p1, v0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidSetting$f;->a:Lcom/sauzask/nicoid/NicoidSetting;

    const v1, 0x7f0f0148

    invoke-virtual {v0, v1}, Landroid/preference/PreferenceActivity;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidSetting$f;->a:Lcom/sauzask/nicoid/NicoidSetting;

    const v1, 0x7f0f022d

    invoke-virtual {v0, v1}, Landroid/preference/PreferenceActivity;->getString(I)Ljava/lang/String;

    move-result-object v0

    new-instance v1, Lcom/sauzask/nicoid/NicoidSetting$f$a;

    invoke-direct {v1, p0}, Lcom/sauzask/nicoid/NicoidSetting$f$a;-><init>(Lcom/sauzask/nicoid/NicoidSetting$f;)V

    invoke-virtual {p1, v0, v1}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidSetting$f;->a:Lcom/sauzask/nicoid/NicoidSetting;

    const v1, 0x7f0f00b3

    invoke-virtual {v0, v1}, Landroid/preference/PreferenceActivity;->getString(I)Ljava/lang/String;

    move-result-object v0

    new-instance v1, Lcom/sauzask/nicoid/NicoidSetting$f$b;

    invoke-direct {v1, p0}, Lcom/sauzask/nicoid/NicoidSetting$f$b;-><init>(Lcom/sauzask/nicoid/NicoidSetting$f;)V

    invoke-virtual {p1, v0, v1}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    invoke-virtual {p1}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object p1

    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Landroid/app/AlertDialog;->setCanceledOnTouchOutside(Z)V

    invoke-virtual {p1}, Landroid/app/AlertDialog;->getWindow()Landroid/view/Window;

    move-result-object v1

    const/4 v2, 0x0

    const/4 v3, 0x2

    invoke-virtual {v1, v2, v3}, Landroid/view/Window;->setFlags(II)V

    invoke-static {p1}, Le/e/a/PlaybackSession;->showDialog(Landroid/app/AlertDialog;)V

    return v0
.end method

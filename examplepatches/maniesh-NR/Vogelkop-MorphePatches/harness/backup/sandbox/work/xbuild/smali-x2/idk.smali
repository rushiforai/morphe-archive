.class public final synthetic Lidk;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lcom/opera/android/settings/cleardata/StorageFragment;


# direct methods
.method public synthetic constructor <init>(Lcom/opera/android/settings/cleardata/StorageFragment;B)V
    .registers 3

    iput-byte p2, p0, Lidk;->a:B

    iput-object p1, p0, Lidk;->b:Lcom/opera/android/settings/cleardata/StorageFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .registers 4

    iget-byte p1, p0, Lidk;->a:B

    iget-object p0, p0, Lidk;->b:Lcom/opera/android/settings/cleardata/StorageFragment;

    packed-switch p1, :pswitch_data_46

    new-instance p1, Laz0;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-direct {p1, v0}, Laz0;-><init>(Landroid/content/Context;)V

    const v0, 0x7f140fd8

    invoke-virtual {p1, v0}, Laz0;->b(I)V

    const v0, 0x7f140fd7

    invoke-virtual {p1, v0}, Laz0;->a(I)V

    new-instance v0, Lsk;

    const/16 v1, 0xc

    invoke-direct {v0, p0, v1}, Lsk;-><init>(Ljava/lang/Object;B)V

    const p0, 0x7f140fd6

    invoke-virtual {p1, p0, v0}, Laz0;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Laz0;

    const p0, 0x7f1403bf

    const/4 v0, 0x0

    invoke-virtual {p1, p0, v0}, Laz0;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Laz0;

    invoke-virtual {p1}, Laz0;->c()Lbz0;

    return-void

    :pswitch_34
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/r;

    move-result-object p0

    invoke-static {p0}, Lmdb;->b(Landroid/content/Context;)Landroid/content/Intent;

    move-result-object p1

    const-string v0, "com.opera.android.action.SHOW_MANAGE_SPACE"

    invoke-virtual {p1, v0}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    invoke-virtual {p0, p1}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V

    return-void

    nop

    :pswitch_data_46
    .packed-switch 0x0
        :pswitch_34
    .end packed-switch
.end method

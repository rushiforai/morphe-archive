.class public final synthetic Lhxe;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lkxe;


# direct methods
.method public synthetic constructor <init>(Lkxe;B)V
    .registers 3

    iput-byte p2, p0, Lhxe;->a:B

    iput-object p1, p0, Lhxe;->b:Lkxe;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .registers 5

    iget-byte p1, p0, Lhxe;->a:B

    const/4 v0, 0x1

    iget-object p0, p0, Lhxe;->b:Lkxe;

    packed-switch p1, :pswitch_data_5a

    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Lkxe;->I0(Z)V

    return-void

    :pswitch_d
    invoke-virtual {p0, v0}, Lkxe;->I0(Z)V

    return-void

    :pswitch_11
    iget-object p1, p0, Lkxe;->y:Lcom/opera/android/settings/SettingsManager;

    invoke-virtual {p1}, Lcom/opera/android/settings/SettingsManager;->s()I

    move-result p1

    iget-object v1, p0, Lkxe;->G:Lcr2;

    iget-object v1, v1, Lcr2;->k:Landroid/view/View;

    check-cast v1, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    iget-object v1, v1, Lcom/opera/android/ui/catalog/widget/OperaListItem;->A:Lbpd;

    invoke-virtual {v1}, Lbpd;->D()Ljava/lang/String;

    move-result-object v1

    invoke-static {p1}, Lvep;->A(I)I

    move-result p1

    const/4 v2, 0x2

    if-eq p1, v2, :cond_2d

    const/4 v2, 0x3

    if-ne p1, v2, :cond_2e

    :cond_2d
    move v0, v2

    :cond_2e
    new-instance p1, Landroid/os/Bundle;

    invoke-direct {p1}, Landroid/os/Bundle;-><init>()V

    const-string v2, "option"

    invoke-static {v0}, Lvep;->A(I)I

    move-result v0

    invoke-virtual {p1, v2, v0}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    const-string v0, "title"

    invoke-virtual {p1, v0, v1}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    new-instance v0, Lbxe;

    invoke-direct {v0}, Lbxe;-><init>()V

    invoke-virtual {v0, p1}, Landroidx/fragment/app/Fragment;->setArguments(Landroid/os/Bundle;)V

    new-instance p1, Ltim;

    invoke-direct {p1, v0}, Ltim;-><init>(Luim;)V

    iget-object p0, p0, Lkxe;->B:Lz77;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v0, Lijm;->b:Lijm;

    invoke-virtual {p0, p1, v0}, Lr22;->b(Ljjm;Lijm;)V

    return-void

    nop

    :pswitch_data_5a
    .packed-switch 0x0
        :pswitch_11
        :pswitch_d
    .end packed-switch
.end method

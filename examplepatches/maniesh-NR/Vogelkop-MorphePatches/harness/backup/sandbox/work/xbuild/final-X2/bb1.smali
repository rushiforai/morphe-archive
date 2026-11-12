.class public final synthetic Lbb1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/MenuItem$OnMenuItemClickListener;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Object;

.field public final synthetic c:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;Ljava/lang/Object;B)V
    .registers 4

    iput-byte p3, p0, Lbb1;->a:B

    iput-object p1, p0, Lbb1;->b:Ljava/lang/Object;

    iput-object p2, p0, Lbb1;->c:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onMenuItemClick(Landroid/view/MenuItem;)Z
    .registers 6

    iget-byte v0, p0, Lbb1;->a:B

    const/4 v1, 0x1

    iget-object v2, p0, Lbb1;->c:Ljava/lang/Object;

    iget-object p0, p0, Lbb1;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_66

    check-cast p0, Landroid/content/Context;

    check-cast v2, Landroid/view/textclassifier/TextClassification;

    invoke-virtual {v2}, Landroid/view/textclassifier/TextClassification;->getText()Ljava/lang/String;

    move-result-object p1

    if-eqz p1, :cond_19

    invoke-virtual {p1}, Ljava/lang/Object;->hashCode()I

    move-result p1

    goto :goto_1a

    :cond_19
    const/4 p1, 0x0

    :goto_1a
    invoke-virtual {v2}, Landroid/view/textclassifier/TextClassification;->getIntent()Landroid/content/Intent;

    move-result-object v0

    const/high16 v2, 0xc000000

    invoke-static {p0, p1, v0, v2}, Landroid/app/PendingIntent;->getActivity(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object p0

    sget p1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v0, 0x22

    if-lt p1, v0, :cond_2e

    invoke-static {p0}, Lg8;->K(Landroid/app/PendingIntent;)V

    goto :goto_31

    :cond_2e
    invoke-virtual {p0}, Landroid/app/PendingIntent;->send()V

    :goto_31
    return v1

    :pswitch_32
    check-cast p0, Lnrf;

    check-cast v2, Ljava/util/List;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/r;

    move-result-object v0

    sget-object v3, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {v0}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object v0

    check-cast v0, Lcom/opera/android/OperaApplication;

    invoke-virtual {v0}, Lcom/opera/android/OperaApplication;->J()Lcom/opera/android/settings/SettingsManager;

    move-result-object v0

    iget-object p0, p0, Lnrf;->i:Ljava/lang/String;

    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result p1

    invoke-interface {v2, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Llrf;

    invoke-interface {p1}, Llrf;->getValue()I

    move-result p1

    invoke-virtual {v0, p1, p0}, Lcom/opera/android/settings/SettingsManager;->V(ILjava/lang/String;)V

    return v1

    :pswitch_5a
    check-cast p0, Lsfl;

    check-cast v2, Lcb1;

    iget-object p0, p0, Lsfl;->d:Lkotlin/jvm/functions/Function1;

    iget-object p1, v2, Lcb1;->a:Ldb1;

    invoke-interface {p0, p1}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    return v1

    :pswitch_data_66
    .packed-switch 0x0
        :pswitch_5a
        :pswitch_32
    .end packed-switch
.end method

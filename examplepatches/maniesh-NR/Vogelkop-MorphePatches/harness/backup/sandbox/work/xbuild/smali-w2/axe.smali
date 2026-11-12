.class public final synthetic Laxe;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/MenuItem$OnMenuItemClickListener;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;B)V
    .registers 3

    iput-byte p2, p0, Laxe;->a:B

    iput-object p1, p0, Laxe;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onMenuItemClick(Landroid/view/MenuItem;)Z
    .registers 5

    iget-byte v0, p0, Laxe;->a:B

    const/4 v1, 0x3

    const/4 v2, 0x1

    iget-object p0, p0, Laxe;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_9a

    check-cast p0, Lz3m;

    iget-object p0, p0, Lz3m;->n:Lk4m;

    invoke-virtual {p0}, Lk4m;->run()V

    return v2

    :pswitch_11
    check-cast p0, Landroid/app/RemoteAction;

    invoke-virtual {p0}, Landroid/app/RemoteAction;->getActionIntent()Landroid/app/PendingIntent;

    move-result-object p0

    sget p1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v0, 0x22

    if-lt p1, v0, :cond_21

    invoke-static {p0}, Lg8;->K(Landroid/app/PendingIntent;)V

    goto :goto_24

    :cond_21
    invoke-virtual {p0}, Landroid/app/PendingIntent;->send()V

    :goto_24
    return v2

    :pswitch_25
    check-cast p0, Lcom/opera/android/settings/SettingsManager;

    invoke-static {v1}, Lvep;->B(I)[I

    move-result-object v0

    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result p1

    aget p1, v0, p1

    const-string v0, "startup_mode"

    invoke-static {p1}, Lvep;->A(I)I

    move-result p1

    invoke-virtual {p0, p1, v0}, Lcom/opera/android/settings/SettingsManager;->V(ILjava/lang/String;)V

    return v2

    :pswitch_3b
    check-cast p0, Lblj;

    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result p1

    invoke-virtual {p0, p1}, Lblj;->m0(I)V

    return v2

    :pswitch_45
    check-cast p0, Lalj;

    iget-object p0, p0, Lalj;->i:Lzkj;

    invoke-interface {p0}, Lzkj;->c()Ljava/util/List;

    move-result-object v0

    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result p1

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Llrf;

    invoke-interface {p0, p1}, Lzkj;->o(Llrf;)V

    return v2

    :pswitch_5b
    check-cast p0, Lbxe;

    invoke-static {v1}, Lvep;->B(I)[I

    move-result-object v0

    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result p1

    aget p1, v0, p1

    iget v0, p0, Lbxe;->i:I

    if-eq p1, v0, :cond_98

    invoke-static {p1}, Lvep;->A(I)I

    move-result p1

    const/4 v0, 0x2

    if-eqz p1, :cond_78

    if-eq p1, v2, :cond_85

    if-ne p1, v0, :cond_84

    const/4 v1, 0x4

    goto :goto_85

    :cond_78
    sget-object p1, Lowe;->c:Lowe;

    iget-object p1, p1, Lowe;->a:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {p1}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result p1

    if-eqz p1, :cond_84

    move v1, v2

    goto :goto_85

    :cond_84
    move v1, v0

    :cond_85
    :goto_85
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/r;

    move-result-object p0

    sget-object p1, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {p0}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object p0

    check-cast p0, Lcom/opera/android/OperaApplication;

    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->J()Lcom/opera/android/settings/SettingsManager;

    move-result-object p0

    invoke-virtual {p0, v1}, Lcom/opera/android/settings/SettingsManager;->X(I)V

    :cond_98
    return v2

    nop

    :pswitch_data_9a
    .packed-switch 0x0
        :pswitch_5b
        :pswitch_45
        :pswitch_3b
        :pswitch_25
        :pswitch_11
    .end packed-switch
.end method

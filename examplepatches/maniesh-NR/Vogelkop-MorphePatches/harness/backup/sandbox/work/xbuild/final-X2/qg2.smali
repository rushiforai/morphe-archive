.class public final synthetic Lqg2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/function/Consumer;


# instance fields
.field public final synthetic a:B


# direct methods
.method public synthetic constructor <init>(B)V
    .registers 2

    iput-byte p1, p0, Lqg2;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final accept(Ljava/lang/Object;)V
    .registers 4

    iget-byte p0, p0, Lqg2;->a:B

    const/4 v0, 0x1

    const/4 v1, 0x0

    packed-switch p0, :pswitch_data_96

    check-cast p1, Ltjp;

    invoke-virtual {p1}, Ltjp;->onDestroy()V

    return-void

    :pswitch_d
    check-cast p1, Ltjp;

    invoke-virtual {p1}, Ltjp;->onStop()V

    return-void

    :pswitch_13
    check-cast p1, Ltjp;

    invoke-virtual {p1}, Ltjp;->onResume()V

    return-void

    :pswitch_19
    check-cast p1, Ltjp;

    invoke-virtual {p1}, Ltjp;->c()V

    return-void

    :pswitch_1f
    check-cast p1, Ltjp;

    invoke-virtual {p1}, Ltjp;->a$1()V

    return-void

    :pswitch_25
    check-cast p1, Ltjp;

    invoke-virtual {p1}, Ltjp;->d()V

    return-void

    :pswitch_2b
    check-cast p1, Ltjp;

    invoke-virtual {p1}, Ltjp;->onPause()V

    return-void

    :pswitch_31
    check-cast p1, Ltjp;

    invoke-virtual {p1}, Ltjp;->b()V

    return-void

    :pswitch_37
    check-cast p1, Ljava/lang/Integer;

    return-void

    :pswitch_3a
    check-cast p1, Ljava/util/List;

    invoke-static {p1}, Lorg/chromium/base/PowerMonitor;->c(Ljava/util/List;)V

    return-void

    :pswitch_40
    check-cast p1, Lq9g;

    invoke-interface {p1}, Lq9g;->A()V

    return-void

    :pswitch_46
    check-cast p1, Ljava/lang/Runnable;

    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    return-void

    :pswitch_4c
    check-cast p1, Ljava/lang/String;

    invoke-static {p1}, Lcom/leanplum/LeanplumPushService;->addExternallyManagedChannel(Ljava/lang/String;)V

    return-void

    :pswitch_52
    check-cast p1, Lcom/google/android/material/chip/Chip;

    const/16 p0, 0x8

    invoke-virtual {p1, p0}, Landroid/view/View;->setVisibility(I)V

    return-void

    :pswitch_5a
    check-cast p1, Lcom/google/android/material/chip/Chip;

    invoke-virtual {p1, v1}, Landroid/view/View;->setVisibility(I)V

    return-void

    :pswitch_60
    check-cast p1, Lo35;

    iget-object p0, p1, Lo35;->b:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    invoke-virtual {p0, v1}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->setChecked(Z)V

    return-void

    :pswitch_68
    check-cast p1, Lo35;

    iget-object p0, p1, Lo35;->b:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    invoke-virtual {p0, v0}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->setChecked(Z)V

    return-void

    :pswitch_70
    check-cast p1, Lc35;

    invoke-virtual {p1, v0}, Lc35;->a(Z)V

    return-void

    :pswitch_76
    check-cast p1, Lc35;

    invoke-virtual {p1, v1}, Lc35;->a(Z)V

    return-void

    :pswitch_7c
    check-cast p1, Lsz8;

    iget-object p0, p1, Lsz8;->d:Ltyn;

    if-eqz p0, :cond_88

    invoke-virtual {p0}, Ltyn;->M()V

    const/4 p0, 0x0

    iput-object p0, p1, Lsz8;->d:Ltyn;

    :cond_88
    return-void

    :pswitch_89
    check-cast p1, Ljava/lang/Boolean;

    sget-object p0, Lorg/chromium/media/AudioManagerAndroid;->o:Lhsh;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p0

    invoke-static {p0}, LJ/N;->MITBBOjF(Z)V

    return-void

    nop

    :pswitch_data_96
    .packed-switch 0x0
        :pswitch_89
        :pswitch_7c
        :pswitch_76
        :pswitch_70
        :pswitch_68
        :pswitch_60
        :pswitch_5a
        :pswitch_52
        :pswitch_4c
        :pswitch_46
        :pswitch_40
        :pswitch_3a
        :pswitch_37
        :pswitch_31
        :pswitch_2b
        :pswitch_25
        :pswitch_1f
        :pswitch_19
        :pswitch_13
        :pswitch_d
    .end packed-switch
.end method

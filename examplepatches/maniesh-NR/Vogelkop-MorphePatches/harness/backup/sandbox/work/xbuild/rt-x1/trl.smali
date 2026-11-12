.class public final Ltrl;
.super Lurl;
.source "SourceFile"

# interfaces
.implements Lnwe;
.implements Lcxe;


# instance fields
.field public final q:Ldxe;

.field public final r:Lxt8;


# direct methods
.method public constructor <init>(Lcom/opera/android/mainmenu/MainMenuSheetToggleLayout;Lcrk;Lcom/opera/android/settings/SettingsManager;Ldxe;Lxt8;)V
    .registers 9

    new-instance v0, Lnrl;

    iget-object v1, p1, Lcom/opera/android/mainmenu/MainMenuSheetToggleLayout;->a:Lvs;

    iget-object v1, v1, Lvs;->c:Ljava/lang/Object;

    check-cast v1, Lcom/opera/android/mainmenu/ToggleAnimationView;

    const v2, 0x7f13004b

    invoke-direct {v0, v1, v2}, Lnrl;-><init>(Lcom/opera/android/mainmenu/ToggleAnimationView;I)V

    invoke-direct {p0, p1, p2, p3, v0}, Lurl;-><init>(Lcom/opera/android/mainmenu/MainMenuSheetToggleLayout;Lcrk;Lcom/opera/android/settings/SettingsManager;Lnrl;)V

    iput-object p4, p0, Ltrl;->q:Ldxe;

    iput-object p5, p0, Ltrl;->r:Lxt8;

    return-void
.end method


# virtual methods
.method public final P()V
    .registers 3

    iget-object v0, p0, Lk8;->a:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/mainmenu/MainMenuSheetToggleLayout;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    sget-object v0, Lowe;->c:Lowe;

    invoke-virtual {v0, p0}, Lowe;->b(Lnwe;)V

    iget-object v0, p0, Ltrl;->q:Ldxe;

    iget-object v0, v0, Ldxe;->h:Lh7f;

    invoke-virtual {v0, p0}, Lh7f;->c(Ljava/lang/Object;)Z

    return-void
.end method

.method public final W()I
    .registers 1

    const/4 p0, 0x3

    return p0
.end method

.method public final k0(Z)V
    .registers 3

    iget-object p0, p0, Ltrl;->q:Ldxe;

    const/4 v0, 0x1

    invoke-virtual {p0, p1, v0}, Ldxe;->T(ZZ)V

    return-void
.end method

.method public final m0()Z
    .registers 2

    iget-object p0, p0, Ltrl;->r:Lxt8;

    const/4 v0, 0x1

    invoke-static {p0, v0}, Luup;->K(Lxt8;I)Z

    move-result p0

    return p0
.end method

.method public final q0()V
    .registers 6

    iget-object v0, p0, Lk8;->a:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/mainmenu/MainMenuSheetToggleLayout;

    const v1, 0x7f1409cc

    const v2, 0x7f1409cb

    iget-object p0, p0, Ltrl;->q:Ldxe;

    const v3, 0x7f1412eb

    const v4, 0x7f1412ea

    invoke-virtual {p0, v3, v4, v1, v2}, Ldxe;->R(IIII)Ljava/lang/String;

    move-result-object p0

    iput-object p0, v0, Lcom/opera/android/mainmenu/MainMenuSheetToggleLayout;->d:Ljava/lang/CharSequence;

    invoke-virtual {v0}, Lcom/opera/android/mainmenu/MainMenuSheetToggleLayout;->a()V

    return-void
.end method

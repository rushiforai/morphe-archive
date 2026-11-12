.class public final Lwen;
.super Lb23;
.source "SourceFile"


# instance fields
.field public final synthetic b:B

.field public final c:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>()V
    .registers 3

    const/4 v0, 0x6

    iput-byte v0, p0, Lwen;->b:B

    new-instance v0, Lkof;

    const/16 v1, 0x9

    invoke-direct {v0, v1}, Lkof;-><init>(B)V

    const/4 v1, 0x6

    invoke-direct {p0, v0, v1}, Lwen;-><init>(Ljava/lang/Object;B)V

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;B)V
    .registers 3

    .line 15
    iput-byte p2, p0, Lwen;->b:B

    const/4 p2, 0x1

    invoke-direct {p0, p2}, Lb23;-><init>(B)V

    iput-object p1, p0, Lwen;->c:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final g(Landroid/content/Context;)Ljava/lang/CharSequence;
    .registers 3

    iget-byte p0, p0, Lwen;->b:B

    packed-switch p0, :pswitch_data_48

    const p0, 0x7f140c5b

    invoke-virtual {p1, p0}, Landroid/content/Context;->getText(I)Ljava/lang/CharSequence;

    move-result-object p0

    return-object p0

    :pswitch_d
    const p0, 0x7f140f8b

    invoke-virtual {p1, p0}, Landroid/content/Context;->getText(I)Ljava/lang/CharSequence;

    move-result-object p0

    return-object p0

    :pswitch_15
    const p0, 0x7f14106c

    invoke-virtual {p1, p0}, Landroid/content/Context;->getText(I)Ljava/lang/CharSequence;

    move-result-object p0

    return-object p0

    :pswitch_1d
    const p0, 0x7f140f87

    invoke-virtual {p1, p0}, Landroid/content/Context;->getText(I)Ljava/lang/CharSequence;

    move-result-object p0

    return-object p0

    :pswitch_25
    const p0, 0x7f1401b7

    invoke-virtual {p1, p0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    filled-new-array {p0}, [Ljava/lang/Object;

    move-result-object p0

    const v0, 0x7f14095e

    invoke-virtual {p1, v0, p0}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :pswitch_38
    const p0, 0x7f14071b

    invoke-virtual {p1, p0}, Landroid/content/Context;->getText(I)Ljava/lang/CharSequence;

    move-result-object p0

    return-object p0

    :pswitch_40
    const p0, 0x7f1413bf

    invoke-virtual {p1, p0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :pswitch_data_48
    .packed-switch 0x0
        :pswitch_40
        :pswitch_38
        :pswitch_25
        :pswitch_1d
        :pswitch_15
        :pswitch_d
    .end packed-switch
.end method

.method public final getNegativeButtonText(Landroid/content/Context;)Ljava/lang/String;
    .registers 4

    iget-byte p0, p0, Lwen;->b:B

    const v0, 0x7f140b4b

    const v1, 0x7f1403bf

    packed-switch p0, :pswitch_data_2e

    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :pswitch_10
    invoke-virtual {p1, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :pswitch_15
    invoke-virtual {p1, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :pswitch_1a
    invoke-virtual {p1, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :pswitch_1f
    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :pswitch_24
    invoke-virtual {p1, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :pswitch_29
    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :pswitch_data_2e
    .packed-switch 0x0
        :pswitch_29
        :pswitch_24
        :pswitch_1f
        :pswitch_1a
        :pswitch_15
        :pswitch_10
    .end packed-switch
.end method

.method public final getPositiveButtonText(Landroid/content/Context;)Ljava/lang/String;
    .registers 3

    iget-byte p0, p0, Lwen;->b:B

    const v0, 0x7f14071e

    packed-switch p0, :pswitch_data_3a

    const p0, 0x7f140bea

    invoke-virtual {p1, p0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :pswitch_10
    const p0, 0x7f140870

    invoke-virtual {p1, p0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :pswitch_18
    const p0, 0x7f14106f

    invoke-virtual {p1, p0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :pswitch_20
    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :pswitch_25
    const p0, 0x7f1404ca

    invoke-virtual {p1, p0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :pswitch_2d
    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :pswitch_32
    const p0, 0x7f1411b3

    invoke-virtual {p1, p0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :pswitch_data_3a
    .packed-switch 0x0
        :pswitch_32
        :pswitch_2d
        :pswitch_25
        :pswitch_20
        :pswitch_18
        :pswitch_10
    .end packed-switch
.end method

.method public final getTheme()I
    .registers 2

    iget-byte v0, p0, Lwen;->b:B

    packed-switch v0, :pswitch_data_e

    invoke-super {p0}, Lnz0;->getTheme()I

    move-result p0

    return p0

    :pswitch_a
    const p0, 0x7f150293

    return p0

    :pswitch_data_e
    .packed-switch 0x0
        :pswitch_a
    .end packed-switch
.end method

.method public final h()Ljava/lang/Integer;
    .registers 2

    iget-byte v0, p0, Lwen;->b:B

    packed-switch v0, :pswitch_data_10

    invoke-super {p0}, Lb23;->h()Ljava/lang/Integer;

    move-result-object p0

    return-object p0

    :pswitch_a
    const/4 p0, 0x4

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    return-object p0

    :pswitch_data_10
    .packed-switch 0x0
        :pswitch_a
    .end packed-switch
.end method

.method public final i(Landroid/content/Context;)Ljava/lang/CharSequence;
    .registers 2

    iget-byte p0, p0, Lwen;->b:B

    packed-switch p0, :pswitch_data_3e

    const p0, 0x7f140c5c

    invoke-virtual {p1, p0}, Landroid/content/Context;->getText(I)Ljava/lang/CharSequence;

    move-result-object p0

    return-object p0

    :pswitch_d
    const p0, 0x7f140f8c

    invoke-virtual {p1, p0}, Landroid/content/Context;->getText(I)Ljava/lang/CharSequence;

    move-result-object p0

    return-object p0

    :pswitch_15
    const p0, 0x7f140f86

    invoke-virtual {p1, p0}, Landroid/content/Context;->getText(I)Ljava/lang/CharSequence;

    move-result-object p0

    return-object p0

    :pswitch_1d
    const p0, 0x7f140f88

    invoke-virtual {p1, p0}, Landroid/content/Context;->getText(I)Ljava/lang/CharSequence;

    move-result-object p0

    return-object p0

    :pswitch_25
    const p0, 0x7f14095f

    invoke-virtual {p1, p0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :pswitch_2d
    const p0, 0x7f14071d

    invoke-virtual {p1, p0}, Landroid/content/Context;->getText(I)Ljava/lang/CharSequence;

    move-result-object p0

    return-object p0

    :pswitch_35
    const p0, 0x7f1413c1

    invoke-virtual {p1, p0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0

    nop

    :pswitch_data_3e
    .packed-switch 0x0
        :pswitch_35
        :pswitch_2d
        :pswitch_25
        :pswitch_1d
        :pswitch_15
        :pswitch_d
    .end packed-switch
.end method

.method public final j(Landroid/content/Context;)Landroid/graphics/drawable/Drawable;
    .registers 2

    iget-byte p0, p0, Lwen;->b:B

    packed-switch p0, :pswitch_data_3e

    const p0, 0x7f080637

    invoke-static {p0, p1}, Lsgb;->F(ILandroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object p0

    return-object p0

    :pswitch_d
    const p0, 0x7f0805ac

    invoke-static {p0, p1}, Lsgb;->F(ILandroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object p0

    return-object p0

    :pswitch_15
    const p0, 0x7f0805ac

    invoke-static {p0, p1}, Lsgb;->F(ILandroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object p0

    return-object p0

    :pswitch_1d
    const p0, 0x7f0805ac

    invoke-static {p0, p1}, Lsgb;->F(ILandroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object p0

    return-object p0

    :pswitch_25
    const p0, 0x7f08057e

    invoke-static {p0, p1}, Lsgb;->F(ILandroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object p0

    return-object p0

    :pswitch_2d
    const p0, 0x7f080505

    invoke-static {p0, p1}, Lsgb;->F(ILandroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object p0

    return-object p0

    :pswitch_35
    const p0, 0x7f0804c3

    invoke-static {p0, p1}, Lsgb;->F(ILandroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object p0

    return-object p0

    nop

    :pswitch_data_3e
    .packed-switch 0x0
        :pswitch_35
        :pswitch_2d
        :pswitch_25
        :pswitch_1d
        :pswitch_15
        :pswitch_d
    .end packed-switch
.end method

.method public final k(Landroid/content/Context;)I
    .registers 3

    iget-byte p0, p0, Lwen;->b:B

    const/4 v0, 0x0

    packed-switch p0, :pswitch_data_10

    :pswitch_6
    return v0

    :pswitch_7
    const p0, 0x7f040484

    invoke-static {p0, p1, v0}, Lf03;->E(ILandroid/content/Context;I)I

    move-result p0

    return p0

    nop

    :pswitch_data_10
    .packed-switch 0x0
        :pswitch_7
        :pswitch_6
        :pswitch_6
        :pswitch_6
        :pswitch_6
        :pswitch_6
    .end packed-switch
.end method

.method public final l(Landroid/content/Context;)Landroid/content/res/ColorStateList;
    .registers 3

    iget-byte v0, p0, Lwen;->b:B

    packed-switch v0, :pswitch_data_c

    :pswitch_5
    invoke-super {p0, p1}, Lb23;->l(Landroid/content/Context;)Landroid/content/res/ColorStateList;

    move-result-object p0

    return-object p0

    :pswitch_a
    const/4 p0, 0x0

    return-object p0

    :pswitch_data_c
    .packed-switch 0x0
        :pswitch_a
        :pswitch_5
        :pswitch_a
    .end packed-switch
.end method

.method public final m(Landroid/content/Context;)Landroid/content/res/ColorStateList;
    .registers 4

    iget-byte p0, p0, Lwen;->b:B

    const v0, 0x7f0402c4

    const v1, 0x7f06063b

    packed-switch p0, :pswitch_data_34

    invoke-static {v0, p1, v1}, Lf03;->u(ILandroid/content/Context;I)Landroid/content/res/ColorStateList;

    move-result-object p0

    return-object p0

    :pswitch_10
    invoke-static {v0, p1, v1}, Lf03;->u(ILandroid/content/Context;I)Landroid/content/res/ColorStateList;

    move-result-object p0

    return-object p0

    :pswitch_15
    invoke-static {v0, p1, v1}, Lf03;->u(ILandroid/content/Context;I)Landroid/content/res/ColorStateList;

    move-result-object p0

    return-object p0

    :pswitch_1a
    invoke-static {v0, p1, v1}, Lf03;->u(ILandroid/content/Context;I)Landroid/content/res/ColorStateList;

    move-result-object p0

    return-object p0

    :pswitch_1f
    const p0, 0x7f0402c8

    invoke-static {p0, p1, v1}, Lf03;->u(ILandroid/content/Context;I)Landroid/content/res/ColorStateList;

    move-result-object p0

    return-object p0

    :pswitch_27
    invoke-static {v0, p1, v1}, Lf03;->u(ILandroid/content/Context;I)Landroid/content/res/ColorStateList;

    move-result-object p0

    return-object p0

    :pswitch_2c
    const p0, 0x7f0403ad

    invoke-static {p0, p1, v1}, Lf03;->u(ILandroid/content/Context;I)Landroid/content/res/ColorStateList;

    move-result-object p0

    return-object p0

    :pswitch_data_34
    .packed-switch 0x0
        :pswitch_2c
        :pswitch_27
        :pswitch_1f
        :pswitch_1a
        :pswitch_15
        :pswitch_10
    .end packed-switch
.end method

.method public final o()Ljava/lang/Integer;
    .registers 3

    iget-byte v0, p0, Lwen;->b:B

    const v1, 0x7f07006f

    packed-switch v0, :pswitch_data_26

    invoke-super {p0}, Lb23;->o()Ljava/lang/Integer;

    move-result-object p0

    return-object p0

    :pswitch_d
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    return-object p0

    :pswitch_12
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    return-object p0

    :pswitch_17
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    return-object p0

    :pswitch_1c
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    return-object p0

    :pswitch_21
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    return-object p0

    :pswitch_data_26
    .packed-switch 0x1
        :pswitch_21
        :pswitch_1c
        :pswitch_17
        :pswitch_12
        :pswitch_d
    .end packed-switch
.end method

.method public final onDismissDialog(Lbz0;Lhjm;)V
    .registers 5

    iget-byte v0, p0, Lwen;->b:B

    sget-object v1, Lhjm;->b:Lhjm;

    packed-switch v0, :pswitch_data_2c

    :pswitch_7
    return-void

    :pswitch_8
    if-ne p2, v1, :cond_e

    const/4 p0, 0x0

    invoke-static {p0}, LJ/N;->MLWmh7HR(Z)V

    :cond_e
    return-void

    :pswitch_f
    iget-object p0, p0, Ld63;->mDismissReason:Lhjm;

    if-ne p0, v1, :cond_2a

    invoke-virtual {p1}, Landroid/app/Dialog;->getContext()Landroid/content/Context;

    move-result-object p0

    sget-object p1, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    check-cast p0, Lcom/opera/android/OperaApplication;

    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object p0

    iget-object p0, p0, Ld6j;->c:Lx5f;

    sget-object p1, Lvb0;->d:Lvb0;

    invoke-virtual {p0, p1}, Lx5f;->P0(Lvb0;)V

    :cond_2a
    return-void

    nop

    :pswitch_data_2c
    .packed-switch 0x0
        :pswitch_f
        :pswitch_7
        :pswitch_8
    .end packed-switch
.end method

.method public final onNegativeButtonClicked(Lbz0;)V
    .registers 3

    iget-byte v0, p0, Lwen;->b:B

    packed-switch v0, :pswitch_data_26

    :pswitch_5
    invoke-super {p0, p1}, Lnz0;->onNegativeButtonClicked(Lbz0;)V

    return-void

    :pswitch_9
    const/4 p0, 0x0

    invoke-static {p0}, LJ/N;->MLWmh7HR(Z)V

    return-void

    :pswitch_e
    invoke-virtual {p1}, Landroid/app/Dialog;->getContext()Landroid/content/Context;

    move-result-object p0

    sget-object p1, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    check-cast p0, Lcom/opera/android/OperaApplication;

    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object p0

    iget-object p0, p0, Ld6j;->c:Lx5f;

    sget-object p1, Lvb0;->c:Lvb0;

    invoke-virtual {p0, p1}, Lx5f;->P0(Lvb0;)V

    return-void

    :pswitch_data_26
    .packed-switch 0x0
        :pswitch_e
        :pswitch_5
        :pswitch_9
    .end packed-switch
.end method

.method public final onPositiveButtonClicked(Lbz0;)V
    .registers 3

    iget-byte v0, p0, Lwen;->b:B

    iget-object p0, p0, Lwen;->c:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_70

    new-instance p0, Landroid/content/Intent;

    const-string v0, "android.settings.LOCK_SCREEN_SETTINGS"

    invoke-direct {p0, v0}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const/high16 v0, 0x10000

    invoke-static {v0, p0}, Lqvf;->b(ILandroid/content/Intent;)Landroid/content/pm/ResolveInfo;

    move-result-object v0

    if-nez v0, :cond_1d

    new-instance p0, Landroid/content/Intent;

    const-string v0, "android.settings.SETTINGS"

    invoke-direct {p0, v0}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    :cond_1d
    const/high16 v0, 0x10000000

    invoke-virtual {p0, v0}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    :try_start_22
    invoke-virtual {p1}, Landroid/app/Dialog;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-virtual {p1, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V
    :try_end_29
    .catch Landroid/content/ActivityNotFoundException; {:try_start_22 .. :try_end_29} :catch_29

    :catch_29
    return-void

    :pswitch_2a
    check-cast p0, Lx2;

    invoke-virtual {p0}, Lx2;->invoke()Ljava/lang/Object;

    return-void

    :pswitch_30
    check-cast p0, Le6g;

    invoke-virtual {p0}, Le6g;->invoke()Ljava/lang/Object;

    return-void

    :pswitch_36
    check-cast p0, Lb6g;

    invoke-virtual {p0}, Lb6g;->invoke()Ljava/lang/Object;

    return-void

    :pswitch_3c
    check-cast p0, Lcom/opera/android/browser/chromium/ChromiumContent;

    iget-object p0, p0, Lcom/opera/android/browser/WebContentsWrapper;->b:Lqi;

    new-instance p1, Lvk2;

    const/16 v0, 0xf

    invoke-direct {p1, v0}, Lvk2;-><init>(B)V

    invoke-static {p1, p0}, Lcom/opera/android/permissions/LocalNetworkPermissionController;->a(Lcom/opera/api/Callback;Lorg/chromium/ui/base/WindowAndroid;)V

    return-void

    :pswitch_4b
    check-cast p0, Lgb3;

    invoke-virtual {p0}, Lgb3;->invoke()Ljava/lang/Object;

    return-void

    :pswitch_51
    invoke-virtual {p1}, Landroid/app/Dialog;->getContext()Landroid/content/Context;

    move-result-object p1

    sget-object v0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    check-cast p1, Lcom/opera/android/OperaApplication;

    invoke-virtual {p1}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object p1

    iget-object p1, p1, Ld6j;->c:Lx5f;

    sget-object v0, Lvb0;->b:Lvb0;

    invoke-virtual {p1, v0}, Lx5f;->P0(Lvb0;)V

    check-cast p0, Lyug;

    const/4 p1, 0x7

    invoke-virtual {p0, p1}, Lyug;->a(I)V

    return-void

    nop

    :pswitch_data_70
    .packed-switch 0x0
        :pswitch_51
        :pswitch_4b
        :pswitch_3c
        :pswitch_36
        :pswitch_30
        :pswitch_2a
    .end packed-switch
.end method

.method public final onShowDialog(Lbz0;)V
    .registers 3

    iget-byte v0, p0, Lwen;->b:B

    packed-switch v0, :pswitch_data_14

    invoke-super {p0, p1}, Lb23;->onShowDialog(Lbz0;)V

    return-void

    :pswitch_9
    invoke-super {p0, p1}, Lb23;->onShowDialog(Lbz0;)V

    iget-object p0, p0, Lwen;->c:Ljava/lang/Object;

    check-cast p0, Lkotlin/jvm/functions/Function0;

    invoke-interface {p0}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    return-void

    :pswitch_data_14
    .packed-switch 0x6
        :pswitch_9
    .end packed-switch
.end method

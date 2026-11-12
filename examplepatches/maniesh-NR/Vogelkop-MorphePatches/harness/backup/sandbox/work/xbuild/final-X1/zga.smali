.class public final Lzga;
.super Lb23;
.source "SourceFile"


# instance fields
.field public final synthetic b:B

.field public final c:Ljava/lang/Object;

.field public final d:Ljava/lang/Object;

.field public final e:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Lrl;Lvdf;Lo8f;)V
    .registers 5

    const/4 v0, 0x1

    iput-byte v0, p0, Lzga;->b:B

    iput-object p1, p0, Lzga;->c:Ljava/lang/Object;

    iput-object p2, p0, Lzga;->d:Ljava/lang/Object;

    iput-object p3, p0, Lzga;->e:Ljava/lang/Object;

    .line 14
    invoke-direct {p0, v0}, Lb23;-><init>(B)V

    return-void
.end method

.method public constructor <init>(Lvdf;Lrl;Lo8f;)V
    .registers 5

    const/4 v0, 0x0

    iput-byte v0, p0, Lzga;->b:B

    iput-object p1, p0, Lzga;->d:Ljava/lang/Object;

    iput-object p2, p0, Lzga;->c:Ljava/lang/Object;

    iput-object p3, p0, Lzga;->e:Ljava/lang/Object;

    const/4 p1, 0x1

    .line 15
    invoke-direct {p0, p1}, Lb23;-><init>(B)V

    return-void
.end method

.method public constructor <init>(Lzv3;Ljava/lang/String;Lgk5;)V
    .registers 5

    const/4 v0, 0x2

    iput-byte v0, p0, Lzga;->b:B

    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lb23;-><init>(B)V

    iput-object p1, p0, Lzga;->d:Ljava/lang/Object;

    iput-object p2, p0, Lzga;->c:Ljava/lang/Object;

    iput-object p3, p0, Lzga;->e:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final g(Landroid/content/Context;)Ljava/lang/CharSequence;
    .registers 3

    iget-byte p0, p0, Lzga;->b:B

    packed-switch p0, :pswitch_data_28

    const p0, 0x7f140d2b

    invoke-virtual {p1, p0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :pswitch_d
    const p0, 0x7f1401b7

    invoke-virtual {p1, p0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    filled-new-array {p0}, [Ljava/lang/Object;

    move-result-object p0

    const v0, 0x7f140957

    invoke-virtual {p1, v0, p0}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :pswitch_20
    const p0, 0x7f14145f

    invoke-virtual {p1, p0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :pswitch_data_28
    .packed-switch 0x0
        :pswitch_20
        :pswitch_d
    .end packed-switch
.end method

.method public final getNegativeButtonText(Landroid/content/Context;)Ljava/lang/String;
    .registers 3

    iget-byte p0, p0, Lzga;->b:B

    const v0, 0x7f1403bf

    packed-switch p0, :pswitch_data_1a

    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :pswitch_d
    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :pswitch_12
    const p0, 0x7f140b4b

    invoke-virtual {p1, p0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :pswitch_data_1a
    .packed-switch 0x0
        :pswitch_12
        :pswitch_d
    .end packed-switch
.end method

.method public final getPositiveButtonText(Landroid/content/Context;)Ljava/lang/String;
    .registers 3

    iget-byte p0, p0, Lzga;->b:B

    const v0, 0x7f140bea

    packed-switch p0, :pswitch_data_1a

    const p0, 0x7f1412e1

    invoke-virtual {p1, p0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :pswitch_10
    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :pswitch_15
    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :pswitch_data_1a
    .packed-switch 0x0
        :pswitch_15
        :pswitch_10
    .end packed-switch
.end method

.method public final getTheme()I
    .registers 2

    iget-byte v0, p0, Lzga;->b:B

    packed-switch v0, :pswitch_data_e

    invoke-super {p0}, Lnz0;->getTheme()I

    move-result p0

    return p0

    :pswitch_a
    const p0, 0x7f150295

    return p0

    :pswitch_data_e
    .packed-switch 0x0
        :pswitch_a
    .end packed-switch
.end method

.method public final i(Landroid/content/Context;)Ljava/lang/CharSequence;
    .registers 2

    iget-byte p0, p0, Lzga;->b:B

    packed-switch p0, :pswitch_data_1e

    const p0, 0x7f14051a

    invoke-virtual {p1, p0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :pswitch_d
    const p0, 0x7f140692

    invoke-virtual {p1, p0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :pswitch_15
    const p0, 0x7f141460

    invoke-virtual {p1, p0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0

    nop

    :pswitch_data_1e
    .packed-switch 0x0
        :pswitch_15
        :pswitch_d
    .end packed-switch
.end method

.method public final j(Landroid/content/Context;)Landroid/graphics/drawable/Drawable;
    .registers 2

    iget-byte p0, p0, Lzga;->b:B

    packed-switch p0, :pswitch_data_1e

    const p0, 0x7f08063d

    invoke-static {p0, p1}, Lsgb;->F(ILandroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object p0

    return-object p0

    :pswitch_d
    const p0, 0x7f08057e

    invoke-static {p0, p1}, Lsgb;->F(ILandroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object p0

    return-object p0

    :pswitch_15
    const p0, 0x7f08057f

    invoke-static {p0, p1}, Lsgb;->F(ILandroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object p0

    return-object p0

    nop

    :pswitch_data_1e
    .packed-switch 0x0
        :pswitch_15
        :pswitch_d
    .end packed-switch
.end method

.method public final k(Landroid/content/Context;)I
    .registers 3

    iget-byte v0, p0, Lzga;->b:B

    packed-switch v0, :pswitch_data_c

    invoke-super {p0, p1}, Lb23;->k(Landroid/content/Context;)I

    move-result p0

    return p0

    :pswitch_a
    const/4 p0, 0x0

    return p0

    :pswitch_data_c
    .packed-switch 0x1
        :pswitch_a
    .end packed-switch
.end method

.method public final l(Landroid/content/Context;)Landroid/content/res/ColorStateList;
    .registers 3

    iget-byte v0, p0, Lzga;->b:B

    packed-switch v0, :pswitch_data_c

    invoke-super {p0, p1}, Lb23;->l(Landroid/content/Context;)Landroid/content/res/ColorStateList;

    move-result-object p0

    return-object p0

    :pswitch_a
    const/4 p0, 0x0

    return-object p0

    :pswitch_data_c
    .packed-switch 0x1
        :pswitch_a
    .end packed-switch
.end method

.method public final m(Landroid/content/Context;)Landroid/content/res/ColorStateList;
    .registers 4

    iget-byte v0, p0, Lzga;->b:B

    const v1, 0x7f06063b

    packed-switch v0, :pswitch_data_1e

    invoke-super {p0, p1}, Lb23;->m(Landroid/content/Context;)Landroid/content/res/ColorStateList;

    move-result-object p0

    return-object p0

    :pswitch_d
    const p0, 0x7f0402c8

    invoke-static {p0, p1, v1}, Lf03;->u(ILandroid/content/Context;I)Landroid/content/res/ColorStateList;

    move-result-object p0

    return-object p0

    :pswitch_15
    const p0, 0x7f0402b9

    invoke-static {p0, p1, v1}, Lf03;->u(ILandroid/content/Context;I)Landroid/content/res/ColorStateList;

    move-result-object p0

    return-object p0

    nop

    :pswitch_data_1e
    .packed-switch 0x0
        :pswitch_15
        :pswitch_d
    .end packed-switch
.end method

.method public final o()Ljava/lang/Integer;
    .registers 2

    iget-byte v0, p0, Lzga;->b:B

    packed-switch v0, :pswitch_data_1a

    invoke-super {p0}, Lb23;->o()Ljava/lang/Integer;

    move-result-object p0

    return-object p0

    :pswitch_a
    const p0, 0x7f07006f

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    return-object p0

    :pswitch_12
    const p0, 0x7f07006e

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    return-object p0

    :pswitch_data_1a
    .packed-switch 0x0
        :pswitch_12
        :pswitch_a
    .end packed-switch
.end method

.method public final onDismissDialog(Lbz0;Lhjm;)V
    .registers 3

    iget-byte p1, p0, Lzga;->b:B

    iget-object p0, p0, Lzga;->e:Ljava/lang/Object;

    packed-switch p1, :pswitch_data_14

    return-void

    :pswitch_8
    check-cast p0, Lo8f;

    invoke-virtual {p0, p2}, Lo8f;->run(Ljava/lang/Object;)V

    return-void

    :pswitch_e
    check-cast p0, Lo8f;

    invoke-virtual {p0, p2}, Lo8f;->run(Ljava/lang/Object;)V

    return-void

    :pswitch_data_14
    .packed-switch 0x0
        :pswitch_e
        :pswitch_8
    .end packed-switch
.end method

.method public final onNegativeButtonClicked(Lbz0;)V
    .registers 4

    iget-byte v0, p0, Lzga;->b:B

    iget-object v1, p0, Lzga;->c:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_18

    invoke-super {p0, p1}, Lnz0;->onNegativeButtonClicked(Lbz0;)V

    return-void

    :pswitch_b
    check-cast v1, Lrl;

    invoke-virtual {v1}, Lrl;->run()V

    return-void

    :pswitch_11
    check-cast v1, Lrl;

    invoke-virtual {v1}, Lrl;->run()V

    return-void

    nop

    :pswitch_data_18
    .packed-switch 0x0
        :pswitch_11
        :pswitch_b
    .end packed-switch
.end method

.method public final onPositiveButtonClicked(Lbz0;)V
    .registers 3

    iget-byte p1, p0, Lzga;->b:B

    iget-object v0, p0, Lzga;->d:Ljava/lang/Object;

    packed-switch p1, :pswitch_data_28

    check-cast v0, Lzv3;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lbk5;

    iget-object v0, p0, Lzga;->c:Ljava/lang/Object;

    check-cast v0, Ljava/lang/String;

    iget-object p0, p0, Lzga;->e:Ljava/lang/Object;

    check-cast p0, Lgk5;

    invoke-virtual {p1, v0, p0}, Lbk5;->e(Ljava/lang/String;Lgk5;)Z

    return-void

    :pswitch_1b
    check-cast v0, Lvdf;

    invoke-virtual {v0}, Lvdf;->run()V

    return-void

    :pswitch_21
    check-cast v0, Lvdf;

    invoke-virtual {v0}, Lvdf;->run()V

    return-void

    nop

    :pswitch_data_28
    .packed-switch 0x0
        :pswitch_21
        :pswitch_1b
    .end packed-switch
.end method

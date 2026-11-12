.class public final Luug;
.super Lb23;
.source "SourceFile"


# instance fields
.field public final synthetic b:B

.field public final c:Lx5f;

.field public d:Lwb0;

.field public final e:Lw6f;


# direct methods
.method public constructor <init>(Lgjm;Lx5f;)V
    .registers 4

    const/4 v0, 0x0

    iput-byte v0, p0, Luug;->b:B

    .line 16
    invoke-direct {p0, v0}, Lb23;-><init>(B)V

    .line 17
    iput-object p1, p0, Luug;->e:Lw6f;

    .line 18
    iput-object p2, p0, Luug;->c:Lx5f;

    .line 19
    sget-object p1, Lwb0;->d:Lwb0;

    iput-object p1, p0, Luug;->d:Lwb0;

    return-void
.end method

.method public constructor <init>(Lydn;Lx5f;)V
    .registers 4

    const/4 v0, 0x1

    iput-byte v0, p0, Luug;->b:B

    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lb23;-><init>(B)V

    sget-object v0, Lwb0;->d:Lwb0;

    iput-object v0, p0, Luug;->d:Lwb0;

    iput-object p1, p0, Luug;->e:Lw6f;

    iput-object p2, p0, Luug;->c:Lx5f;

    return-void
.end method


# virtual methods
.method public final b(Landroid/content/Context;)Ljava/lang/Integer;
    .registers 4

    iget-byte p0, p0, Luug;->b:B

    const/4 v0, 0x0

    const v1, 0x7f0407df

    packed-switch p0, :pswitch_data_1c

    invoke-static {v1, p1, v0}, Lf03;->E(ILandroid/content/Context;I)I

    move-result p0

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    return-object p0

    :pswitch_12
    invoke-static {v1, p1, v0}, Lf03;->E(ILandroid/content/Context;I)I

    move-result p0

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    return-object p0

    nop

    :pswitch_data_1c
    .packed-switch 0x0
        :pswitch_12
    .end packed-switch
.end method

.method public final d(Landroid/content/Context;)Ljava/lang/Integer;
    .registers 4

    iget-byte p0, p0, Luug;->b:B

    const/4 v0, 0x0

    const v1, 0x7f0407e0

    packed-switch p0, :pswitch_data_1c

    invoke-static {v1, p1, v0}, Lf03;->E(ILandroid/content/Context;I)I

    move-result p0

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    return-object p0

    :pswitch_12
    invoke-static {v1, p1, v0}, Lf03;->E(ILandroid/content/Context;I)I

    move-result p0

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    return-object p0

    nop

    :pswitch_data_1c
    .packed-switch 0x0
        :pswitch_12
    .end packed-switch
.end method

.method public final g(Landroid/content/Context;)Ljava/lang/CharSequence;
    .registers 2

    iget-byte p0, p0, Luug;->b:B

    packed-switch p0, :pswitch_data_16

    const p0, 0x7f1411c5

    invoke-virtual {p1, p0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :pswitch_d
    const p0, 0x7f1407d7

    invoke-virtual {p1, p0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0

    nop

    :pswitch_data_16
    .packed-switch 0x0
        :pswitch_d
    .end packed-switch
.end method

.method public final getNegativeButtonText(Landroid/content/Context;)Ljava/lang/String;
    .registers 2

    iget-byte p0, p0, Luug;->b:B

    packed-switch p0, :pswitch_data_16

    const p0, 0x7f140b4b

    invoke-virtual {p1, p0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :pswitch_d
    const p0, 0x7f14044d

    invoke-virtual {p1, p0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0

    nop

    :pswitch_data_16
    .packed-switch 0x0
        :pswitch_d
    .end packed-switch
.end method

.method public final getPositiveButtonText(Landroid/content/Context;)Ljava/lang/String;
    .registers 3

    iget-byte p0, p0, Luug;->b:B

    const v0, 0x7f141378

    packed-switch p0, :pswitch_data_12

    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :pswitch_d
    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :pswitch_data_12
    .packed-switch 0x0
        :pswitch_d
    .end packed-switch
.end method

.method public final getTheme()I
    .registers 1

    iget-byte p0, p0, Luug;->b:B

    const p0, 0x7f150292

    return p0
.end method

.method public final i(Landroid/content/Context;)Ljava/lang/CharSequence;
    .registers 3

    iget-byte p0, p0, Luug;->b:B

    const v0, 0x7f1411c6

    packed-switch p0, :pswitch_data_12

    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :pswitch_d
    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :pswitch_data_12
    .packed-switch 0x0
        :pswitch_d
    .end packed-switch
.end method

.method public final isRequestValid(Lb2l;)Z
    .registers 3

    iget-byte v0, p0, Luug;->b:B

    packed-switch v0, :pswitch_data_16

    invoke-super {p0, p1}, Lnz0;->isRequestValid(Lb2l;)Z

    move-result p0

    return p0

    :pswitch_a
    iget-object p0, p0, Luug;->e:Lw6f;

    check-cast p0, Lydn;

    iget-object p0, p0, Lydn;->d:Lvdn;

    iget-boolean p0, p0, Lvdn;->a:Z

    xor-int/lit8 p0, p0, 0x1

    return p0

    nop

    :pswitch_data_16
    .packed-switch 0x1
        :pswitch_a
    .end packed-switch
.end method

.method public final onDismissDialog(Lbz0;Lhjm;)V
    .registers 4

    iget-byte p1, p0, Luug;->b:B

    const/4 p2, 0x0

    iget-object v0, p0, Luug;->c:Lx5f;

    packed-switch p1, :pswitch_data_16

    const/4 p1, 0x2

    iget-object p0, p0, Luug;->d:Lwb0;

    invoke-virtual {v0, p1, p0, p2}, Lx5f;->L(ILwb0;Ljava/lang/Integer;)V

    return-void

    :pswitch_f
    const/4 p1, 0x1

    iget-object p0, p0, Luug;->d:Lwb0;

    invoke-virtual {v0, p1, p0, p2}, Lx5f;->L(ILwb0;Ljava/lang/Integer;)V

    return-void

    :pswitch_data_16
    .packed-switch 0x0
        :pswitch_f
    .end packed-switch
.end method

.method public final onNegativeButtonClicked(Lbz0;)V
    .registers 3

    iget-byte p1, p0, Luug;->b:B

    sget-object v0, Lwb0;->c:Lwb0;

    packed-switch p1, :pswitch_data_e

    iput-object v0, p0, Luug;->d:Lwb0;

    return-void

    :pswitch_a
    iput-object v0, p0, Luug;->d:Lwb0;

    return-void

    nop

    :pswitch_data_e
    .packed-switch 0x0
        :pswitch_a
    .end packed-switch
.end method

.method public final onPositiveButtonClicked(Lbz0;)V
    .registers 5

    iget-byte p1, p0, Luug;->b:B

    const/4 v0, 0x1

    iget-object v1, p0, Luug;->e:Lw6f;

    sget-object v2, Lwb0;->b:Lwb0;

    packed-switch p1, :pswitch_data_22

    iput-object v2, p0, Luug;->d:Lwb0;

    check-cast v1, Lydn;

    invoke-virtual {v1, v0}, Lydn;->C(Z)V

    return-void

    :pswitch_12
    iput-object v2, p0, Luug;->d:Lwb0;

    check-cast v1, Lgjm;

    new-instance p0, Lvfn;

    const/4 p1, 0x0

    const/4 v2, 0x2

    invoke-direct {p0, v0, p1, v2}, Lvfn;-><init>(ILoba;I)V

    const/4 p1, 0x0

    invoke-virtual {v1, p0, p1}, Lgjm;->e(Ln37;Z)V

    return-void

    :pswitch_data_22
    .packed-switch 0x0
        :pswitch_12
    .end packed-switch
.end method

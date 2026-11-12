.class public final La5g;
.super La38;
.source "SourceFile"


# instance fields
.field public final e:I

.field public f:Landroid/widget/EditText;

.field public final g:Lzvd;


# direct methods
.method public constructor <init>(Lz28;I)V
    .registers 4

    invoke-direct {p0, p1}, La38;-><init>(Lz28;)V

    const p1, 0x7f080287

    iput p1, p0, La5g;->e:I

    new-instance p1, Lzvd;

    const/16 v0, 0xc

    invoke-direct {p1, p0, v0}, Lzvd;-><init>(Ljava/lang/Object;B)V

    iput-object p1, p0, La5g;->g:Lzvd;

    if-eqz p2, :cond_15

    iput p2, p0, La5g;->e:I

    :cond_15
    return-void
.end method


# virtual methods
.method public final b()V
    .registers 1

    invoke-virtual {p0}, La38;->p()V

    return-void
.end method

.method public final c()I
    .registers 1

    const p0, 0x7f140c68

    return p0
.end method

.method public final d()I
    .registers 1

    iget p0, p0, La5g;->e:I

    return p0
.end method

.method public final f()Landroid/view/View$OnClickListener;
    .registers 1

    iget-object p0, p0, La5g;->g:Lzvd;

    return-object p0
.end method

.method public final j()Z
    .registers 1

    const/4 p0, 0x1

    return p0
.end method

.method public final k()Z
    .registers 2

    iget-object p0, p0, La5g;->f:Landroid/widget/EditText;

    const/4 v0, 0x1

    if-eqz p0, :cond_f

    invoke-virtual {p0}, Landroid/widget/TextView;->getTransformationMethod()Landroid/text/method/TransformationMethod;

    move-result-object p0

    instance-of p0, p0, Landroid/text/method/PasswordTransformationMethod;

    if-eqz p0, :cond_f

    move p0, v0

    goto :goto_10

    :cond_f
    const/4 p0, 0x0

    :goto_10
    xor-int/2addr p0, v0

    return p0
.end method

.method public final l(Landroid/widget/EditText;)V
    .registers 2

    iput-object p1, p0, La5g;->f:Landroid/widget/EditText;

    invoke-virtual {p0}, La38;->p()V

    return-void
.end method

.method public final q()V
    .registers 4

    iget-object v0, p0, La5g;->f:Landroid/widget/EditText;

    if-eqz v0, :cond_2d

    invoke-virtual {v0}, Landroid/widget/TextView;->getInputType()I

    move-result v1

    const/16 v2, 0x10

    if-eq v1, v2, :cond_24

    invoke-virtual {v0}, Landroid/widget/TextView;->getInputType()I

    move-result v1

    const/16 v2, 0x80

    if-eq v1, v2, :cond_24

    invoke-virtual {v0}, Landroid/widget/TextView;->getInputType()I

    move-result v1

    const/16 v2, 0x90

    if-eq v1, v2, :cond_24

    invoke-virtual {v0}, Landroid/widget/TextView;->getInputType()I

    move-result v0

    const/16 v1, 0xe0

    if-ne v0, v1, :cond_2d

    :cond_24
    iget-object p0, p0, La5g;->f:Landroid/widget/EditText;

    invoke-static {}, Landroid/text/method/PasswordTransformationMethod;->getInstance()Landroid/text/method/PasswordTransformationMethod;

    move-result-object v0

    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setTransformationMethod(Landroid/text/method/TransformationMethod;)V

    :cond_2d
    return-void
.end method

.method public final r()V
    .registers 2

    iget-object p0, p0, La5g;->f:Landroid/widget/EditText;

    if-eqz p0, :cond_b

    invoke-static {}, Landroid/text/method/PasswordTransformationMethod;->getInstance()Landroid/text/method/PasswordTransformationMethod;

    move-result-object v0

    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setTransformationMethod(Landroid/text/method/TransformationMethod;)V

    :cond_b
    return-void
.end method

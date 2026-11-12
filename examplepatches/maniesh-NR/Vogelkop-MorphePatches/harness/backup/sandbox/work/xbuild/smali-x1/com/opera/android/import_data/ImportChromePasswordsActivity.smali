.class public final Lcom/opera/android/import_data/ImportChromePasswordsActivity;
.super Ll2b;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u000c\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0005\u0008\u0007\u0018\u00002\u00020\u0001:\u0002\u0004\u0005B\u0007\u00a2\u0006\u0004\u0008\u0002\u0010\u0003\u00a8\u0006\u0006"
    }
    d2 = {
        "Lcom/opera/android/import_data/ImportChromePasswordsActivity;",
        "Ll2b;",
        "<init>",
        "()V",
        "nv6",
        "k1g",
        "app"
    }
    k = 0x1
    mv = {
        0x2,
        0x4,
        0x0
    }
    xi = 0x30
.end annotation


# static fields
.field public static final synthetic b0:I


# instance fields
.field public a0:Z


# direct methods
.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Ll2b;-><init>()V

    return-void
.end method


# virtual methods
.method public final C0(Ljava/io/File;)V
    .registers 4

    new-instance v0, Lcom/opera/android/autofill/PasswordImporter;

    new-instance v1, Lnv6;

    invoke-direct {v1, p0}, Lnv6;-><init>(Ljava/lang/Object;)V

    invoke-direct {v0, v1}, Lcom/opera/android/autofill/PasswordImporter;-><init>(Lm4g;)V

    invoke-virtual {p1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Lcom/opera/android/autofill/PasswordImporter;->a(Ljava/lang/String;)V

    return-void
.end method

.method public final D0()V
    .registers 3

    invoke-super {p0}, Ll2b;->D0()V

    iget-object p0, p0, Ll2b;->N:Lj3b;

    if-eqz p0, :cond_23

    iget-object v0, p0, Lj3b;->b:Lor2;

    const v1, 0x7f040555

    invoke-virtual {p0, v1}, Lj3b;->a(I)V

    iget-object p0, v0, Lor2;->b:Ljava/lang/Object;

    check-cast p0, Landroid/widget/TextView;

    const v1, 0x7f140876

    invoke-virtual {p0, v1}, Landroid/widget/TextView;->setText(I)V

    iget-object p0, v0, Lor2;->f:Ljava/lang/Object;

    check-cast p0, Landroid/widget/TextView;

    const v0, 0x7f140879

    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setText(I)V

    :cond_23
    return-void
.end method

.method public final E0(I)V
    .registers 2

    invoke-super {p0, p1}, Ll2b;->E0(I)V

    invoke-virtual {p0, p1}, Lcom/opera/android/import_data/ImportChromePasswordsActivity;->S0(I)V

    invoke-virtual {p0, p1}, Lcom/opera/android/import_data/ImportChromePasswordsActivity;->R0(I)V

    return-void
.end method

.method public final F0()V
    .registers 2

    const v0, 0x7f140c6a

    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Landroid/app/Activity;->setTitle(Ljava/lang/CharSequence;)V

    return-void
.end method

.method public final G0()V
    .registers 3

    const-string v0, "https://passwords.google.com/options"

    const/4 v1, 0x0

    invoke-virtual {p0, v1, v0}, Lcom/opera/android/FullscreenWebActivity;->r0(ILjava/lang/String;)V

    return-void
.end method

.method public final H0()V
    .registers 2

    const v0, 0x7f140f8c

    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Landroid/app/Activity;->setTitle(Ljava/lang/CharSequence;)V

    return-void
.end method

.method public final I0()V
    .registers 2

    sget-object v0, Lb3b;->a:[Lb3b;

    const/4 v0, -0x1

    invoke-virtual {p0, v0}, Lcom/opera/android/import_data/ImportChromePasswordsActivity;->E0(I)V

    return-void
.end method

.method public final K0()V
    .registers 2

    invoke-virtual {p0}, Ll2b;->M0()V

    iget-object v0, p0, Ll2b;->N:Lj3b;

    if-eqz v0, :cond_10

    iget-object v0, v0, Lj3b;->b:Lor2;

    iget-object v0, v0, Lor2;->d:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/widget/ThemeableLottieAnimationView;

    invoke-virtual {v0}, Lcom/opera/android/widget/LottieAnimationView;->q()V

    :cond_10
    sget-object v0, Ly2b;->d:Ly2b;

    iget v0, v0, Ly2b;->a:I

    invoke-virtual {p0, v0}, Lcom/opera/android/import_data/ImportChromePasswordsActivity;->S0(I)V

    invoke-virtual {p0, v0}, Lcom/opera/android/import_data/ImportChromePasswordsActivity;->R0(I)V

    return-void
.end method

.method public final P0()V
    .registers 2

    invoke-super {p0}, Ll2b;->P0()V

    iget-boolean v0, p0, Lcom/opera/android/import_data/ImportChromePasswordsActivity;->a0:Z

    if-nez v0, :cond_14

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/opera/android/import_data/ImportChromePasswordsActivity;->a0:Z

    iget-object p0, p0, Ll2b;->U:Lx5f;

    if-nez p0, :cond_f

    const/4 p0, 0x0

    :cond_f
    sget-object v0, Lgm0;->i:Lgm0;

    invoke-virtual {p0, v0}, Lx5f;->l0(Lgm0;)V

    :cond_14
    return-void
.end method

.method public final R0(I)V
    .registers 6

    iget-object v0, p0, Ll2b;->U:Lx5f;

    const/4 v1, 0x0

    if-nez v0, :cond_6

    move-object v0, v1

    :cond_6
    sget-object v2, Lgm0;->l:Lgm0;

    invoke-virtual {v0, v2}, Lx5f;->l0(Lgm0;)V

    iget-object v0, p0, Ll2b;->U:Lx5f;

    if-nez v0, :cond_10

    move-object v0, v1

    :cond_10
    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "reason: "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p1, " "

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p1, p0, Ll2b;->W:Ljava/lang/StringBuilder;

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0x9

    invoke-virtual {v0, v3, v2}, Lx5f;->R(ILjava/lang/String;)V

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->setLength(I)V

    iget-object p1, p0, Ll2b;->V:Lx5f;

    if-nez p1, :cond_36

    move-object p1, v1

    :cond_36
    invoke-virtual {p1, v0}, Lx5f;->m0(Z)V

    iget-object p1, p0, Ll2b;->U:Lx5f;

    if-eqz p1, :cond_3e

    move-object v1, p1

    :cond_3e
    sget-object p1, Lw2b;->b:Lhv5;

    iget-object p0, p0, Ll2b;->Y:Ljava/lang/String;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {p0}, Lhv5;->I(Ljava/lang/String;)Lw2b;

    move-result-object p0

    sget-object p1, Lc3b;->c:Lc3b;

    sget-object v0, Lv2b;->c:Lv2b;

    sget-object v2, Leb0;->c:Leb0;

    invoke-virtual {v1, p0, p1, v0, v2}, Lx5f;->I(Lw2b;Lc3b;Lv2b;Leb0;)V

    return-void
.end method

.method public final S0(I)V
    .registers 4

    sget-object v0, Ly2b;->b:Lix5;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {p1}, Lix5;->p(I)Ly2b;

    move-result-object p1

    invoke-static {p0}, Ljoh;->p(Landroid/app/Activity;)Z

    move-result v0

    if-eqz v0, :cond_33

    iget-object p0, p0, Ldx3;->o:Lqim;

    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object p0, p0, Lqim;->c:Lz77;

    sget-object v0, Ly2b;->c:Ly2b;

    const/4 v1, 0x0

    if-ne p1, v0, :cond_22

    new-instance p1, Lyz5;

    const/4 v0, 0x5

    invoke-direct {p1, v1, v1, v0}, Lyz5;-><init>(ZZB)V

    goto :goto_28

    :cond_22
    new-instance p1, Lyz5;

    const/4 v0, 0x4

    invoke-direct {p1, v1, v1, v0}, Lyz5;-><init>(ZZB)V

    :goto_28
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-interface {p1}, Ljjm;->getDefaultPriority()Lijm;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Lr22;->b(Ljjm;Lijm;)V

    return-void

    :cond_33
    new-instance p0, La3b;

    invoke-direct {p0, p1}, La3b;-><init>(Ly2b;)V

    invoke-static {p0}, Lac8;->b(Ljava/lang/Object;)V

    return-void
.end method

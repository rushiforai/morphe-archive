.class public Ll/vcf0;
.super Ll/ibf0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/ibf0<",
        "Ll/jdf0;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Ll/ner;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ibf0;-><init>(Ll/ner;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic Q0(Ll/vcf0;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/vcf0;->S0(Landroid/os/Bundle;)V

    return-void
.end method

.method public static synthetic R0(Ll/vcf0;Lcom/p1/mobile/android/app/c;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/vcf0;->A0(Lcom/p1/mobile/android/app/c;)V

    return-void
.end method

.method private synthetic S0(Landroid/os/Bundle;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/jdf0;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/jdf0;->r()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final synthetic A0(Lcom/p1/mobile/android/app/c;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/android/app/c;->j:Lcom/p1/mobile/android/app/c;

    .line 2
    .line 3
    if-ne p1, v0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 6
    .line 7
    check-cast p0, Ll/jdf0;

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/jdf0;->z()V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public a0()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/ibf0;->a0()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/ecf0;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Ll/ecf0;-><init>(Ll/vcf0;)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0, v0}, Ll/ar2;->creates(Ll/y20;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0}, Ll/ar2;->lifecycle()Lrx/c;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    new-instance v1, Ll/mcf0;

    .line 17
    .line 18
    invoke-direct {v1, p0}, Ll/mcf0;-><init>(Ll/vcf0;)V

    .line 19
    .line 20
    .line 21
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 26
    .line 27
    .line 28
    return-void
.end method

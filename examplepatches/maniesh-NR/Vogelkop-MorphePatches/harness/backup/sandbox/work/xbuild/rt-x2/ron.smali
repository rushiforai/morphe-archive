.class public final Lron;
.super Lb23;
.source "SourceFile"


# instance fields
.field public final b:Lm91;

.field public c:Z


# direct methods
.method public constructor <init>(Lm91;)V
    .registers 3

    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lb23;-><init>(B)V

    iput-object p1, p0, Lron;->b:Lm91;

    return-void
.end method


# virtual methods
.method public final g(Landroid/content/Context;)Ljava/lang/CharSequence;
    .registers 2

    const p0, 0x7f141461

    invoke-virtual {p1, p0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public final getNegativeButtonText(Landroid/content/Context;)Ljava/lang/String;
    .registers 2

    const p0, 0x7f140b4b

    invoke-virtual {p1, p0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public final getPositiveButtonText(Landroid/content/Context;)Ljava/lang/String;
    .registers 2

    const p0, 0x7f140693

    invoke-virtual {p1, p0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public final getTheme()I
    .registers 1

    const p0, 0x7f150295

    return p0
.end method

.method public final i(Landroid/content/Context;)Ljava/lang/CharSequence;
    .registers 2

    const p0, 0x7f141462

    invoke-virtual {p1, p0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public final j(Landroid/content/Context;)Landroid/graphics/drawable/Drawable;
    .registers 2

    const p0, 0x7f08059e

    invoke-static {p0, p1}, Lsgb;->F(ILandroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object p0

    return-object p0
.end method

.method public final onFinished(Lhjm;)V
    .registers 2

    invoke-super {p0, p1}, Ld63;->onFinished(Lhjm;)V

    iget-boolean p1, p0, Lron;->c:Z

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    iget-object p0, p0, Lron;->b:Lm91;

    invoke-virtual {p0, p1}, Lm91;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public final onPositiveButtonClicked(Lbz0;)V
    .registers 2

    const/4 p1, 0x1

    iput-boolean p1, p0, Lron;->c:Z

    return-void
.end method

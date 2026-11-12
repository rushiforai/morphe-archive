.class public final Lnx;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lwv8;
.implements Lfua;
.implements Lw7e;


# instance fields
.field public final a:Landroid/content/Context;


# direct methods
.method public synthetic constructor <init>(Landroid/content/Context;)V
    .registers 2

    iput-object p1, p0, Lnx;->a:Landroid/content/Context;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a(Lyz;)Ljava/lang/String;
    .registers 2

    check-cast p1, Lio;

    iget-object p0, p1, Lio;->w:Lads_mobile_sdk/bu1;

    iget-object p0, p0, Lads_mobile_sdk/bu1;->m:Lyqa;

    if-eqz p0, :cond_e

    iget-object p0, p0, Lyqa;->c:Ljava/lang/Object;

    check-cast p0, Landroid/net/Uri;

    if-nez p0, :cond_11

    :cond_e
    const-string p0, ""

    return-object p0

    :cond_11
    invoke-virtual {p0}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public final b(Lyz;)D
    .registers 8

    check-cast p1, Lio;

    iget-object p0, p1, Lio;->w:Lads_mobile_sdk/bu1;

    iget-object p0, p0, Lads_mobile_sdk/bu1;->j:Ljava/lang/Double;

    const-wide/16 v0, 0x0

    if-eqz p0, :cond_21

    invoke-virtual {p0}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v2

    cmpg-double p1, v2, v0

    if-ltz p1, :cond_21

    invoke-virtual {p0}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v2

    const-wide/high16 v4, 0x4014000000000000L    # 5.0

    cmpl-double p1, v2, v4

    if-gtz p1, :cond_21

    invoke-virtual {p0}, Ljava/lang/Double;->doubleValue()D

    move-result-wide p0

    return-wide p0

    :cond_21
    return-wide v0
.end method

.method public final c(Lyz;)Ljava/lang/String;
    .registers 4

    check-cast p1, Lio;

    iget-object p0, p1, Lio;->w:Lads_mobile_sdk/bu1;

    iget-object p1, p0, Lads_mobile_sdk/bu1;->j:Ljava/lang/Double;

    const-string v0, ""

    if-eqz p1, :cond_d

    iget-object p1, p0, Lads_mobile_sdk/bu1;->k:Ljava/lang/String;

    goto :goto_e

    :cond_d
    move-object p1, v0

    :goto_e
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_15

    return-object p1

    :cond_15
    iget-object p0, p0, Lads_mobile_sdk/bu1;->h:Ljava/lang/String;

    sget-object p1, Laik;->a:[Ljava/lang/String;

    if-nez p0, :cond_1c

    return-object v0

    :cond_1c
    return-object p0
.end method

.method public final e(Lyz;)Ljava/lang/CharSequence;
    .registers 2

    check-cast p1, Lio;

    iget-object p0, p1, Lio;->w:Lads_mobile_sdk/bu1;

    iget-object p0, p0, Lads_mobile_sdk/bu1;->g:Ljava/lang/String;

    sget-object p1, Laik;->a:[Ljava/lang/String;

    if-nez p0, :cond_c

    const-string p0, ""

    :cond_c
    return-object p0
.end method

.method public final f(Lyz;)Ljava/lang/CharSequence;
    .registers 2

    check-cast p1, Lio;

    iget-object p0, p1, Lio;->w:Lads_mobile_sdk/bu1;

    iget-object p0, p0, Lads_mobile_sdk/bu1;->f:Ljava/lang/String;

    sget-object p1, Laik;->a:[Ljava/lang/String;

    if-nez p0, :cond_c

    const-string p0, ""

    :cond_c
    return-object p0
.end method

.method public final g(Lyz;)Ljava/lang/CharSequence;
    .registers 2

    check-cast p1, Lio;

    iget-object p0, p1, Lio;->w:Lads_mobile_sdk/bu1;

    iget-object p0, p0, Lads_mobile_sdk/bu1;->d:Ljava/lang/String;

    return-object p0
.end method

.method public final i()Landroid/graphics/drawable/Drawable;
    .registers 6

    const v0, 0x7f0805e0

    iget-object p0, p0, Lnx;->a:Landroid/content/Context;

    invoke-static {v0, p0}, Lsgb;->F(ILandroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    if-eqz v0, :cond_35

    const v1, 0x7f0402b9

    const v2, 0x7f06063b

    invoke-static {v1, p0, v2}, Lf03;->t(ILandroid/content/Context;I)I

    move-result v1

    const/high16 v2, 0x42400000    # 48.0f

    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-static {v2, v3}, Lfan;->a(FLandroid/content/res/Resources;)I

    move-result v2

    const v3, 0x7f0600a7

    const v4, 0x7f0402d7

    invoke-static {v4, p0, v3}, Lf03;->t(ILandroid/content/Context;I)I

    move-result p0

    invoke-static {v2, p0}, Lj14;->D(II)Landroid/graphics/drawable/ShapeDrawable;

    move-result-object p0

    invoke-static {v0, v1}, Lj14;->n0(Landroid/graphics/drawable/Drawable;I)V

    invoke-static {p0, v0}, Lj14;->p(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)Landroid/graphics/drawable/LayerDrawable;

    move-result-object p0

    return-object p0

    :cond_35
    const-string p0, "Required value was null."

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    const/4 p0, 0x0

    return-object p0
.end method

.method public final j(Lyz;)Ljava/lang/String;
    .registers 2

    iget-object p0, p0, Lnx;->a:Landroid/content/Context;

    const p1, 0x7f1400ea

    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public final w(Ld5o;)Lv7e;
    .registers 3

    new-instance p1, Lbsd;

    iget-object p0, p0, Lnx;->a:Landroid/content/Context;

    const/4 v0, 0x0

    invoke-direct {p1, p0, v0}, Lbsd;-><init>(Landroid/content/Context;B)V

    return-object p1
.end method

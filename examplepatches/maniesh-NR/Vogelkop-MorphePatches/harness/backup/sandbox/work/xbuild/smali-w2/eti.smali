.class public abstract Leti;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static a:Lq6e;

.field public static final b:Ljava/util/HashMap;

.field public static final c:Ljava/util/regex/Pattern;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Leti;->b:Ljava/util/HashMap;

    const-string v0, "#\\{(.*?)\\}"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Leti;->c:Ljava/util/regex/Pattern;

    return-void
.end method

.method public static a(Ljava/lang/String;Lshf;I)Lorg/chromium/url/GURL;
    .registers 6

    sget-object v0, Lp6l;->a:Lp6l;

    new-instance v1, Lorg/chromium/url/GURL;

    invoke-direct {v1, p0}, Lorg/chromium/url/GURL;-><init>(Ljava/lang/String;)V

    iget-boolean v2, v1, Lorg/chromium/url/GURL;->b:Z

    if-eqz v2, :cond_c

    return-object v1

    :cond_c
    invoke-static {p0}, Lwqm;->x(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_25

    invoke-static {p0}, Laik;->t(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object v1

    invoke-interface {v1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "https://"

    invoke-static {v2, v1}, Lwqm;->b(Ljava/lang/String;Ljava/lang/String;)Lorg/chromium/url/GURL;

    move-result-object v1

    iget-boolean v2, v1, Lorg/chromium/url/GURL;->b:Z

    if-eqz v2, :cond_25

    return-object v1

    :cond_25
    const/4 v1, 0x0

    if-eqz p1, :cond_2d

    iget-object p1, p1, Lshf;->c:Ljava/lang/Object;

    check-cast p1, Leri;

    goto :goto_2e

    :cond_2d
    move-object p1, v1

    :goto_2e
    if-nez p1, :cond_38

    sget-object v2, Leti;->a:Lq6e;

    if-eqz v2, :cond_38

    invoke-virtual {v2}, Lq6e;->b()Leri;

    move-result-object p1

    :cond_38
    if-eqz p1, :cond_52

    if-nez p0, :cond_41

    invoke-static {v1}, La26;->B(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    goto :goto_42

    :cond_41
    move-object v1, p0

    :goto_42
    invoke-interface {p1, p2, v0, v1}, Leri;->a(ILp6l;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    if-eqz p1, :cond_52

    new-instance p2, Lorg/chromium/url/GURL;

    invoke-direct {p2, p1}, Lorg/chromium/url/GURL;-><init>(Ljava/lang/String;)V

    iget-boolean p1, p2, Lorg/chromium/url/GURL;->b:Z

    if-eqz p1, :cond_52

    return-object p2

    :cond_52
    invoke-static {p0}, La26;->C(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    new-instance p1, Lorg/chromium/url/GURL;

    const-string p2, "https://www.google.com/search/?q="

    invoke-static {p2, p0}, Lsko;->j(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-direct {p1, p0}, Lorg/chromium/url/GURL;-><init>(Ljava/lang/String;)V

    return-object p1
.end method

.method public static b(Landroid/content/Context;Landroid/graphics/Bitmap;I)Landroid/graphics/drawable/Drawable;
    .registers 3

    if-eqz p1, :cond_8

    new-instance p0, Lhq4;

    invoke-direct {p0, p1, p2}, Lhq4;-><init>(Landroid/graphics/Bitmap;I)V

    return-object p0

    :cond_8
    const p1, 0x7f080992

    invoke-static {p1, p0}, Lsgb;->F(ILandroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object p0

    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    return-object p0
.end method

.method public static c(Leri;Landroid/content/Context;I)Landroid/graphics/drawable/LayerDrawable;
    .registers 7

    new-instance v0, Landroid/graphics/drawable/LayerDrawable;

    new-instance v1, Landroid/graphics/drawable/ColorDrawable;

    const/4 v2, 0x0

    invoke-direct {v1, v2}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    const/4 v3, 0x1

    new-array v3, v3, [Landroid/graphics/drawable/Drawable;

    aput-object v1, v3, v2

    invoke-direct {v0, v3}, Landroid/graphics/drawable/LayerDrawable;-><init>([Landroid/graphics/drawable/Drawable;)V

    invoke-virtual {v0, v2, p2}, Landroid/graphics/drawable/LayerDrawable;->setLayerWidth(II)V

    invoke-virtual {v0, v2, p2}, Landroid/graphics/drawable/LayerDrawable;->setLayerHeight(II)V

    if-eqz p0, :cond_27

    new-instance v1, Leh7;

    invoke-direct {v1, p2}, Leh7;-><init>(I)V

    new-instance v2, Llt2;

    const/4 v3, 0x4

    invoke-direct {v2, p1, p2, v0, v3}, Llt2;-><init>(Ljava/lang/Object;ILjava/lang/Object;B)V

    invoke-interface {p0, v1, v2}, Leri;->h(Leh7;Lcom/opera/api/Callback;)Lhh4;

    return-object v0

    :cond_27
    const/4 p0, 0x0

    invoke-static {p1, p0, p2}, Leti;->b(Landroid/content/Context;Landroid/graphics/Bitmap;I)Landroid/graphics/drawable/Drawable;

    move-result-object p0

    invoke-virtual {v0, v2, p0}, Landroid/graphics/drawable/LayerDrawable;->setDrawable(ILandroid/graphics/drawable/Drawable;)V

    return-object v0
.end method

.method public static d(Leri;Landroid/content/Context;I)Landroid/graphics/drawable/LayerDrawable;
    .registers 7

    new-instance v0, Landroid/graphics/drawable/LayerDrawable;

    invoke-static {p0, p1, p2}, Leti;->c(Leri;Landroid/content/Context;I)Landroid/graphics/drawable/LayerDrawable;

    move-result-object p0

    new-instance v1, Lp05;

    invoke-static {p1}, Lf03;->s(Landroid/content/Context;)I

    move-result v2

    const/high16 v3, 0x3f800000    # 1.0f

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    invoke-static {v3, p1}, Lfan;->a(FLandroid/content/res/Resources;)I

    move-result p1

    int-to-float p1, p1

    invoke-direct {v1, p1, v2, p2}, Lp05;-><init>(FII)V

    const/4 p1, 0x2

    new-array p1, p1, [Landroid/graphics/drawable/Drawable;

    const/4 p2, 0x0

    aput-object p0, p1, p2

    const/4 p0, 0x1

    aput-object v1, p1, p0

    invoke-direct {v0, p1}, Landroid/graphics/drawable/LayerDrawable;-><init>([Landroid/graphics/drawable/Drawable;)V

    const/16 p1, 0x11

    invoke-virtual {v0, p2, p1}, Landroid/graphics/drawable/LayerDrawable;->setLayerGravity(II)V

    invoke-virtual {v0, p0, p1}, Landroid/graphics/drawable/LayerDrawable;->setLayerGravity(II)V

    return-object v0
.end method

.method public static e(I)Llqm;
    .registers 2

    invoke-static {p0}, Lvep;->A(I)I

    move-result p0

    if-eqz p0, :cond_1f

    const/4 v0, 0x6

    if-eq p0, v0, :cond_1f

    const/16 v0, 0x9

    if-eq p0, v0, :cond_1c

    const/4 v0, 0x2

    if-eq p0, v0, :cond_19

    const/4 v0, 0x3

    if-eq p0, v0, :cond_16

    sget-object p0, Llqm;->b:Llqm;

    return-object p0

    :cond_16
    sget-object p0, Llqm;->z:Llqm;

    return-object p0

    :cond_19
    sget-object p0, Llqm;->y:Llqm;

    return-object p0

    :cond_1c
    sget-object p0, Llqm;->s:Llqm;

    return-object p0

    :cond_1f
    sget-object p0, Llqm;->i:Llqm;

    return-object p0
.end method

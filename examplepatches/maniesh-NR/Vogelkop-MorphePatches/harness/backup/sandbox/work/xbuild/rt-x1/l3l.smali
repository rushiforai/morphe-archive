.class public final Ll3l;
.super Landroid/graphics/drawable/LayerDrawable;
.source "SourceFile"


# instance fields
.field public final a:Lkze;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lk6l;Lm3l;)V
    .registers 6

    const v0, 0x7f080612

    invoke-static {v0, p1}, Lj14;->i0(ILandroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object p1

    const/4 v0, 0x2

    new-array v0, v0, [Landroid/graphics/drawable/Drawable;

    const/4 v1, 0x0

    aput-object p1, v0, v1

    const/4 p1, 0x1

    aput-object p3, v0, p1

    invoke-direct {p0, v0}, Landroid/graphics/drawable/LayerDrawable;-><init>([Landroid/graphics/drawable/Drawable;)V

    new-instance p1, Lkze;

    sget-object v0, Log;->a:Log;

    invoke-direct {p1, v0}, Lekc;-><init>(Ljava/lang/Object;)V

    iput-object p1, p0, Ll3l;->a:Lkze;

    new-instance p0, Lshf;

    new-instance v0, Lbvk;

    const/4 v1, 0x4

    invoke-direct {v0, v1}, Lbvk;-><init>(B)V

    invoke-direct {p0, p1, p2, p3, v0}, Lshf;-><init>(Lkze;Lk6l;Lm3l;Lkotlin/jvm/functions/Function1;)V

    return-void
.end method


# virtual methods
.method public final setVisible(ZZ)Z
    .registers 5

    if-eqz p1, :cond_5

    sget-object v0, Lng;->a:Lng;

    goto :goto_7

    :cond_5
    sget-object v0, Log;->a:Log;

    :goto_7
    iget-object v1, p0, Ll3l;->a:Lkze;

    invoke-static {v1, v0}, Lxf8;->G0(Lkze;Ljava/lang/Object;)Z

    invoke-super {p0, p1, p2}, Landroid/graphics/drawable/LayerDrawable;->setVisible(ZZ)Z

    move-result p0

    return p0
.end method

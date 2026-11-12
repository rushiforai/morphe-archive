.class public final Lnxa;
.super Landroid/graphics/drawable/LayerDrawable;
.source "SourceFile"


# instance fields
.field public final a:Landroid/content/Context;


# direct methods
.method public constructor <init>(Landroid/content/Context;Ldll;Lkze;)V
    .registers 9

    invoke-static {p1}, Lui6;->o(Landroid/content/Context;)Landroid/graphics/drawable/ShapeDrawable;

    move-result-object v0

    new-instance v1, Lw3a;

    const v2, 0x7f0803ec

    invoke-static {v2, p1}, Lw8h;->u(ILandroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object v2

    const v3, 0x7f0402af

    invoke-static {v3, p1}, Lj7h;->k(ILandroid/content/Context;)I

    move-result v3

    invoke-static {v2, v3}, Lj14;->n0(Landroid/graphics/drawable/Drawable;I)V

    const/16 v3, 0x11

    const/4 v4, 0x0

    invoke-direct {v1, v2, v3, v4}, Lw3a;-><init>(Landroid/graphics/drawable/Drawable;IZ)V

    const/4 v2, 0x2

    new-array v2, v2, [Landroid/graphics/drawable/Drawable;

    aput-object v0, v2, v4

    const/4 v0, 0x1

    aput-object v1, v2, v0

    invoke-direct {p0, v2}, Landroid/graphics/drawable/LayerDrawable;-><init>([Landroid/graphics/drawable/Drawable;)V

    iput-object p1, p0, Lnxa;->a:Landroid/content/Context;

    new-instance p1, Lrw0;

    const/4 v0, 0x6

    invoke-direct {p1, p0, v0}, Lrw0;-><init>(Ljava/lang/Object;B)V

    new-instance v0, Lal7;

    const/16 v1, 0x19

    invoke-direct {v0, p0, v1}, Lal7;-><init>(Ljava/lang/Object;B)V

    invoke-static {p2, p3, p1, v0}, La26;->U(Lw6f;Likc;Ljava/lang/Object;Lkotlin/jvm/functions/Function0;)V

    return-void
.end method

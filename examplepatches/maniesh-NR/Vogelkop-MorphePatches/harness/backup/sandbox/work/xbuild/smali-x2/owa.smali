.class public final Lowa;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final j:J

.field public static final k:J

.field public static final synthetic l:I


# instance fields
.field public final a:Landroid/content/Context;

.field public final b:Landroid/graphics/drawable/ShapeDrawable;

.field public final c:Lfwk;

.field public final d:Lo92;

.field public final e:Lzyk;

.field public final f:Lld9;

.field public final g:Ljwa;

.field public final h:Lzyk;

.field public final i:Lnwa;


# direct methods
.method static constructor <clinit>()V
    .registers 3

    sget-object v0, Lpn7;->b:Lon7;

    sget-object v0, Lun7;->d:Lun7;

    const/16 v1, 0x3e8

    invoke-static {v1, v0}, Lcs5;->x0(ILun7;)J

    move-result-wide v1

    sput-wide v1, Lowa;->j:J

    const/16 v1, 0x1388

    invoke-static {v1, v0}, Lcs5;->x0(ILun7;)J

    move-result-wide v0

    sput-wide v0, Lowa;->k:J

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lkze;Lp12;Ldll;)V
    .registers 14

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lowa;->a:Landroid/content/Context;

    new-instance v0, Landroid/graphics/drawable/ShapeDrawable;

    new-instance v1, Landroid/graphics/drawable/shapes/OvalShape;

    invoke-direct {v1}, Landroid/graphics/drawable/shapes/OvalShape;-><init>()V

    invoke-direct {v0, v1}, Landroid/graphics/drawable/ShapeDrawable;-><init>(Landroid/graphics/drawable/shapes/Shape;)V

    iput-object v0, p0, Lowa;->b:Landroid/graphics/drawable/ShapeDrawable;

    new-instance v1, Lfwk;

    const/4 v2, 0x1

    invoke-direct {v1, v2}, Lfwk;-><init>(Z)V

    iput-object v1, p0, Lowa;->c:Lfwk;

    new-instance v3, Landroid/graphics/drawable/LayerDrawable;

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    const v5, 0x7f070091

    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v4

    sget-object v6, Lwz3;->a:Lixh;

    invoke-virtual {v6, p1}, Ly7h;->k(Landroid/content/Context;)I

    move-result v7

    shl-int/2addr v7, v2

    sub-int/2addr v4, v7

    invoke-static {v0, v4}, Lic4;->R(Landroid/graphics/drawable/Drawable;I)Lo92;

    move-result-object v4

    new-instance v7, Lw3a;

    const/16 v8, 0x11

    invoke-direct {v7, v4, v8, v2}, Lw3a;-><init>(Landroid/graphics/drawable/Drawable;IZ)V

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v4

    invoke-virtual {v6, p1}, Ly7h;->k(Landroid/content/Context;)I

    move-result v6

    shl-int/2addr v6, v2

    sub-int/2addr v4, v6

    const/high16 v6, 0x40000000    # 2.0f

    invoke-static {p1, v6}, Lz7h;->h(Landroid/content/Context;F)I

    move-result v6

    shl-int/2addr v6, v2

    sub-int/2addr v4, v6

    invoke-static {v1, v4}, Lic4;->R(Landroid/graphics/drawable/Drawable;I)Lo92;

    move-result-object v1

    new-instance v4, Lw3a;

    invoke-direct {v4, v1, v8, v2}, Lw3a;-><init>(Landroid/graphics/drawable/Drawable;IZ)V

    filled-new-array {v7, v4}, [Lw3a;

    move-result-object v1

    invoke-direct {v3, v1}, Landroid/graphics/drawable/LayerDrawable;-><init>([Landroid/graphics/drawable/Drawable;)V

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1, v5}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v1

    invoke-static {v3, v1}, Lic4;->R(Landroid/graphics/drawable/Drawable;I)Lo92;

    move-result-object v1

    iput-object v1, p0, Lowa;->d:Lo92;

    new-instance v1, Lhv;

    const/16 v3, 0x10

    invoke-direct {v1, p0, p4, p2, v3}, Lhv;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-static {v1}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object v1

    iput-object v1, p0, Lowa;->e:Lzyk;

    new-instance v1, Lld9;

    const/16 v3, 0x18

    invoke-direct {v1, p0, v3}, Lld9;-><init>(Ljava/lang/Object;B)V

    iput-object v1, p0, Lowa;->f:Lld9;

    new-instance v1, Ljwa;

    sget-wide v3, Lowa;->k:J

    invoke-direct {v1, p2, v3, v4}, Ljwa;-><init>(Lkze;J)V

    iput-object v1, p0, Lowa;->g:Ljwa;

    new-instance v3, Lbe8;

    const/16 v4, 0x16

    invoke-direct {v3, v4}, Lbe8;-><init>(B)V

    invoke-static {v3}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object v3

    iput-object v3, p0, Lowa;->h:Lzyk;

    new-instance v3, Lnwa;

    const/4 v4, 0x0

    invoke-direct {v3, p0, v4}, Lnwa;-><init>(Ljava/lang/Object;B)V

    iput-object v3, p0, Lowa;->i:Lnwa;

    new-instance v3, Lrw0;

    const/4 v5, 0x5

    invoke-direct {v3, p0, v5}, Lrw0;-><init>(Ljava/lang/Object;B)V

    invoke-static {p4, p2, v3}, La26;->V(Lw6f;Likc;Ljava/lang/Object;)V

    iget-object p3, p3, Lp12;->b:Ljava/lang/Object;

    check-cast p3, Lkze;

    new-instance p4, Lmwa;

    invoke-direct {p4, p0, v4}, Lmwa;-><init>(Lowa;B)V

    invoke-static {p3, p2, p4}, La26;->T(Lekc;Likc;Lf7f;)V

    new-instance p3, Lmwa;

    invoke-direct {p3, p0, v2}, Lmwa;-><init>(Lowa;B)V

    iget-object p0, v1, Ljwa;->b:Lpde;

    invoke-static {p0, p2, p3}, La26;->T(Lekc;Likc;Lf7f;)V

    invoke-virtual {v0}, Landroid/graphics/drawable/ShapeDrawable;->getPaint()Landroid/graphics/Paint;

    move-result-object p0

    const p2, 0x7f0402f4

    const p3, 0x7f06063b

    invoke-static {p2, p1, p3}, Lf03;->t(ILandroid/content/Context;I)I

    move-result p1

    invoke-virtual {p0, p1}, Landroid/graphics/Paint;->setColor(I)V

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->invalidateSelf()V

    return-void
.end method

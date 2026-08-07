.class public Ll/o1e0;
.super Ll/g1e0;
.source "SourceFile"


# static fields
.field public static final INSTANCE:Ll/h1e0;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ll/o1e0;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/o1e0;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/o1e0;->INSTANCE:Ll/h1e0;

    .line 7
    .line 8
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/g1e0;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public b(Landroid/graphics/Matrix;Landroid/graphics/Rect;IIFFFF)V
    .locals 0

    .line 1
    invoke-static {p7, p8}, Ljava/lang/Math;->min(FF)F

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    iget p3, p2, Landroid/graphics/Rect;->left:I

    .line 6
    .line 7
    int-to-float p3, p3

    .line 8
    iget p2, p2, Landroid/graphics/Rect;->top:I

    .line 9
    .line 10
    int-to-float p2, p2

    .line 11
    invoke-virtual {p1, p0, p0}, Landroid/graphics/Matrix;->setScale(FF)V

    .line 12
    .line 13
    .line 14
    const/high16 p0, 0x3f000000    # 0.5f

    .line 15
    .line 16
    add-float/2addr p3, p0

    .line 17
    float-to-int p3, p3

    .line 18
    int-to-float p3, p3

    .line 19
    add-float/2addr p2, p0

    .line 20
    float-to-int p0, p2

    .line 21
    int-to-float p0, p0

    .line 22
    invoke-virtual {p1, p3, p0}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "fit_start"

    .line 2
    .line 3
    return-object p0
.end method

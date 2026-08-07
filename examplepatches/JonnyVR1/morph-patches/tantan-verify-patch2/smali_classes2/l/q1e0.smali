.class public Ll/q1e0;
.super Ll/g1e0;
.source "SourceFile"


# static fields
.field public static final INSTANCE:Ll/h1e0;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ll/q1e0;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/q1e0;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/q1e0;->INSTANCE:Ll/h1e0;

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
    iget p0, p2, Landroid/graphics/Rect;->left:I

    .line 2
    .line 3
    int-to-float p0, p0

    .line 4
    iget p2, p2, Landroid/graphics/Rect;->top:I

    .line 5
    .line 6
    int-to-float p2, p2

    .line 7
    invoke-virtual {p1, p7, p8}, Landroid/graphics/Matrix;->setScale(FF)V

    .line 8
    .line 9
    .line 10
    const/high16 p3, 0x3f000000    # 0.5f

    .line 11
    .line 12
    add-float/2addr p0, p3

    .line 13
    float-to-int p0, p0

    .line 14
    int-to-float p0, p0

    .line 15
    add-float/2addr p2, p3

    .line 16
    float-to-int p2, p2

    .line 17
    int-to-float p2, p2

    .line 18
    invoke-virtual {p1, p0, p2}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "fit_xy"

    .line 2
    .line 3
    return-object p0
.end method

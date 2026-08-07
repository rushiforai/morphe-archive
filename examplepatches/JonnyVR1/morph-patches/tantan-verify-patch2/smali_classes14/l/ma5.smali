.class public Ll/ma5;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final e:Ll/ma5;


# instance fields
.field public final a:F

.field public final b:F

.field public final c:F

.field public final d:F


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 1
    new-instance v0, Ll/ma5;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const/high16 v2, 0x3f800000    # 1.0f

    .line 5
    .line 6
    invoke-direct {v0, v1, v1, v2, v2}, Ll/ma5;-><init>(FFFF)V

    .line 7
    .line 8
    .line 9
    sput-object v0, Ll/ma5;->e:Ll/ma5;

    .line 10
    .line 11
    return-void
.end method

.method public constructor <init>(FFFF)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput p2, p0, Ll/ma5;->b:F

    .line 5
    .line 6
    iput p1, p0, Ll/ma5;->a:F

    .line 7
    .line 8
    iput p3, p0, Ll/ma5;->c:F

    .line 9
    .line 10
    iput p4, p0, Ll/ma5;->d:F

    .line 11
    .line 12
    return-void
.end method

.method public static a(Landroid/view/View;Landroid/view/View;)Ll/ma5;
    .locals 3

    .line 1
    invoke-virtual {p1}, Landroid/view/View;->getWidth()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    int-to-float v0, v0

    .line 6
    const/high16 v1, 0x3f800000    # 1.0f

    .line 7
    .line 8
    mul-float/2addr v0, v1

    .line 9
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 10
    .line 11
    .line 12
    move-result v2

    .line 13
    int-to-float v2, v2

    .line 14
    div-float/2addr v0, v2

    .line 15
    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    .line 16
    .line 17
    .line 18
    move-result p1

    .line 19
    int-to-float p1, p1

    .line 20
    mul-float/2addr p1, v1

    .line 21
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 22
    .line 23
    .line 24
    move-result p0

    .line 25
    int-to-float p0, p0

    .line 26
    div-float/2addr p1, p0

    .line 27
    sub-float p0, v1, p1

    .line 28
    .line 29
    const/high16 v2, 0x3f000000    # 0.5f

    .line 30
    .line 31
    mul-float/2addr p0, v2

    .line 32
    add-float/2addr p1, p0

    .line 33
    sub-float/2addr v1, v0

    .line 34
    mul-float/2addr v1, v2

    .line 35
    add-float/2addr v0, v1

    .line 36
    new-instance v2, Ll/ma5;

    .line 37
    .line 38
    invoke-direct {v2, p0, v1, p1, v0}, Ll/ma5;-><init>(FFFF)V

    .line 39
    .line 40
    .line 41
    return-object v2
.end method


# virtual methods
.method public b()F
    .locals 1

    .line 1
    iget v0, p0, Ll/ma5;->c:F

    .line 2
    .line 3
    iget p0, p0, Ll/ma5;->a:F

    .line 4
    .line 5
    sub-float/2addr v0, p0

    .line 6
    return v0
.end method

.method public c()F
    .locals 1

    .line 1
    iget v0, p0, Ll/ma5;->d:F

    .line 2
    .line 3
    iget p0, p0, Ll/ma5;->b:F

    .line 4
    .line 5
    sub-float/2addr v0, p0

    .line 6
    return v0
.end method

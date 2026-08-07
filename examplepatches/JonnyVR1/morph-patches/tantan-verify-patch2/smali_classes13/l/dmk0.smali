.class public Ll/dmk0;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/dmk0$a;
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static a(ILl/y20;)Ll/y20;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(I",
            "Ll/y20<",
            "TT;>;)",
            "Ll/y20<",
            "TT;>;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/dmk0$a;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Ll/dmk0$a;-><init>(ILl/y20;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, v0, Ll/dmk0$a;->b:Ll/y20;

    .line 7
    .line 8
    return-object p0
.end method

.method public static b(ILandroid/graphics/Point;)Landroid/graphics/Point;
    .locals 2

    .line 1
    int-to-float p0, p0

    .line 2
    iget v0, p1, Landroid/graphics/Point;->x:I

    .line 3
    .line 4
    iget v1, p1, Landroid/graphics/Point;->y:I

    .line 5
    .line 6
    invoke-static {v0, v1}, Ljava/lang/Math;->max(II)I

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    int-to-float v0, v0

    .line 11
    div-float/2addr p0, v0

    .line 12
    iget v0, p1, Landroid/graphics/Point;->x:I

    .line 13
    .line 14
    int-to-float v0, v0

    .line 15
    mul-float/2addr v0, p0

    .line 16
    iget p1, p1, Landroid/graphics/Point;->y:I

    .line 17
    .line 18
    int-to-float p1, p1

    .line 19
    mul-float/2addr p1, p0

    .line 20
    const p0, 0x402ccccd    # 2.7f

    .line 21
    .line 22
    .line 23
    mul-float v1, v0, p0

    .line 24
    .line 25
    cmpg-float v1, v1, p1

    .line 26
    .line 27
    if-gez v1, :cond_0

    .line 28
    .line 29
    div-float v0, p1, p0

    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_0
    mul-float v1, p1, p0

    .line 33
    .line 34
    cmpg-float v1, v1, v0

    .line 35
    .line 36
    if-gez v1, :cond_1

    .line 37
    .line 38
    div-float p1, v0, p0

    .line 39
    .line 40
    :cond_1
    :goto_0
    new-instance p0, Landroid/graphics/Point;

    .line 41
    .line 42
    float-to-int v0, v0

    .line 43
    float-to-int p1, p1

    .line 44
    invoke-direct {p0, v0, p1}, Landroid/graphics/Point;-><init>(II)V

    .line 45
    .line 46
    .line 47
    return-object p0
.end method

.method public static c(Ljava/lang/Throwable;Ljava/lang/Class;)Z
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    move v1, v0

    .line 3
    :goto_0
    if-eqz p0, :cond_1

    .line 4
    .line 5
    const/16 v2, 0xa

    .line 6
    .line 7
    if-gt v1, v2, :cond_1

    .line 8
    .line 9
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    if-ne v2, p1, :cond_0

    .line 14
    .line 15
    const/4 p0, 0x1

    .line 16
    return p0

    .line 17
    :cond_0
    add-int/lit8 v1, v1, 0x1

    .line 18
    .line 19
    invoke-virtual {p0}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    goto :goto_0

    .line 24
    :cond_1
    return v0
.end method

.method public static d(II)I
    .locals 4

    .line 1
    const/4 v0, 0x0

    .line 2
    if-gtz p0, :cond_0

    .line 3
    .line 4
    return v0

    .line 5
    :cond_0
    const/4 v1, 0x2

    .line 6
    const/4 v2, 0x1

    .line 7
    if-gt p0, v1, :cond_1

    .line 8
    .line 9
    return v2

    .line 10
    :cond_1
    move v1, v0

    .line 11
    move v0, v2

    .line 12
    :goto_0
    if-ge v2, p0, :cond_3

    .line 13
    .line 14
    add-int/2addr v1, v0

    .line 15
    if-lt v1, p1, :cond_2

    .line 16
    .line 17
    return v1

    .line 18
    :cond_2
    add-int/lit8 v2, v2, 0x1

    .line 19
    .line 20
    move v3, v1

    .line 21
    move v1, v0

    .line 22
    move v0, v3

    .line 23
    goto :goto_0

    .line 24
    :cond_3
    return v0
.end method

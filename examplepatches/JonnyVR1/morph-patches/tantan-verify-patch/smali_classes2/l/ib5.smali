.class public interface abstract Ll/ib5;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/ab5;


# direct methods
.method public static A(Landroid/graphics/Bitmap;Ll/w4d0;Ll/qvb0;II)Ll/ib5;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/graphics/Bitmap;",
            "Ll/w4d0<",
            "Landroid/graphics/Bitmap;",
            ">;",
            "Ll/qvb0;",
            "II)",
            "Ll/ib5;"
        }
    .end annotation

    .line 1
    invoke-static {}, Ll/bi2;->Q()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    new-instance v1, Ll/bi2;

    .line 8
    .line 9
    move-object v2, p0

    .line 10
    move-object v3, p1

    .line 11
    move-object v4, p2

    .line 12
    move v5, p3

    .line 13
    move v6, p4

    .line 14
    invoke-direct/range {v1 .. v6}, Ll/bi2;-><init>(Landroid/graphics/Bitmap;Ll/w4d0;Ll/qvb0;II)V

    .line 15
    .line 16
    .line 17
    return-object v1

    .line 18
    :cond_0
    move-object v2, p0

    .line 19
    move-object v3, p1

    .line 20
    move-object v4, p2

    .line 21
    move v5, p3

    .line 22
    move v6, p4

    .line 23
    new-instance p0, Ll/rnd;

    .line 24
    .line 25
    move v7, v6

    .line 26
    move v6, v5

    .line 27
    move-object v5, v4

    .line 28
    move-object v4, v3

    .line 29
    move-object v3, v2

    .line 30
    move-object v2, p0

    .line 31
    invoke-direct/range {v2 .. v7}, Ll/rnd;-><init>(Landroid/graphics/Bitmap;Ll/w4d0;Ll/qvb0;II)V

    .line 32
    .line 33
    .line 34
    return-object v2
.end method

.method public static O(Ll/fb5;Ll/qvb0;II)Ll/ib5;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/fb5<",
            "Landroid/graphics/Bitmap;",
            ">;",
            "Ll/qvb0;",
            "II)",
            "Ll/ib5;"
        }
    .end annotation

    .line 1
    invoke-static {}, Ll/bi2;->Q()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    new-instance v0, Ll/bi2;

    .line 8
    .line 9
    invoke-direct {v0, p0, p1, p2, p3}, Ll/bi2;-><init>(Ll/fb5;Ll/qvb0;II)V

    .line 10
    .line 11
    .line 12
    return-object v0

    .line 13
    :cond_0
    new-instance v0, Ll/rnd;

    .line 14
    .line 15
    invoke-direct {v0, p0, p1, p2, p3}, Ll/rnd;-><init>(Ll/fb5;Ll/qvb0;II)V

    .line 16
    .line 17
    .line 18
    return-object v0
.end method

.method public static w(Landroid/graphics/Bitmap;Ll/w4d0;Ll/qvb0;I)Ll/ib5;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/graphics/Bitmap;",
            "Ll/w4d0<",
            "Landroid/graphics/Bitmap;",
            ">;",
            "Ll/qvb0;",
            "I)",
            "Ll/ib5;"
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-static {p0, p1, p2, p3, v0}, Ll/ib5;->A(Landroid/graphics/Bitmap;Ll/w4d0;Ll/qvb0;II)Ll/ib5;

    .line 3
    .line 4
    .line 5
    move-result-object p0

    .line 6
    return-object p0
.end method

.method public static z(Ll/fb5;Ll/qvb0;I)Ll/ib5;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/fb5<",
            "Landroid/graphics/Bitmap;",
            ">;",
            "Ll/qvb0;",
            "I)",
            "Ll/ib5;"
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-static {p0, p1, p2, v0}, Ll/ib5;->O(Ll/fb5;Ll/qvb0;II)Ll/ib5;

    .line 3
    .line 4
    .line 5
    move-result-object p0

    .line 6
    return-object p0
.end method


# virtual methods
.method public abstract V()I
.end method

.method public abstract s()Ll/fb5;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/fb5<",
            "Landroid/graphics/Bitmap;",
            ">;"
        }
    .end annotation
.end method

.method public abstract x()I
.end method

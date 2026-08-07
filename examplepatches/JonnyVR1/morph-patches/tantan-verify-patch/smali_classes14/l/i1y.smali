.class public Ll/i1y;
.super Lrx/c;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/i1y$a;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lrx/c<",
        "Ljava/util/List<",
        "Lcom/p1/mobile/putong/data/Media;",
        ">;>;"
    }
.end annotation


# static fields
.field public static a:I = 0x7e9000


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 1
    return-void
.end method

.method public constructor <init>(Ljava/util/List;IILandroid/graphics/Bitmap$CompressFormat;Z)V
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;II",
            "Landroid/graphics/Bitmap$CompressFormat;",
            "Z)V"
        }
    .end annotation

    .line 24
    new-instance v0, Ll/i1y$a;

    const/4 v2, 0x0

    const/4 v7, 0x0

    move-object v1, p1

    move v3, p2

    move v4, p3

    move-object v5, p4

    move v6, p5

    invoke-direct/range {v0 .. v7}, Ll/i1y$a;-><init>(Ljava/util/List;ZIILandroid/graphics/Bitmap$CompressFormat;ZLjava/lang/String;)V

    invoke-direct {p0, v0}, Lrx/c;-><init>(Lrx/c$a;)V

    return-void
.end method

.method public constructor <init>(Ljava/util/List;Z)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;Z)V"
        }
    .end annotation

    .line 22
    new-instance v0, Ll/i1y$a;

    const/4 v1, 0x0

    invoke-direct {v0, p1, p2, v1}, Ll/i1y$a;-><init>(Ljava/util/List;ZLjava/lang/String;)V

    invoke-direct {p0, v0}, Lrx/c;-><init>(Lrx/c$a;)V

    return-void
.end method

.method public constructor <init>(Ljava/util/List;ZLjava/lang/String;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;Z",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 21
    new-instance v0, Ll/i1y$a;

    invoke-direct {v0, p1, p2, p3}, Ll/i1y$a;-><init>(Ljava/util/List;ZLjava/lang/String;)V

    invoke-direct {p0, v0}, Lrx/c;-><init>(Lrx/c$a;)V

    return-void
.end method

.method public constructor <init>(Ljava/util/List;ZLjava/lang/String;Z)V
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;Z",
            "Ljava/lang/String;",
            "Z)V"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/i1y$a;

    .line 2
    .line 3
    sget v3, Ll/sim;->n:I

    .line 4
    .line 5
    sget-object v5, Landroid/graphics/Bitmap$CompressFormat;->JPEG:Landroid/graphics/Bitmap$CompressFormat;

    .line 6
    .line 7
    const/4 v6, 0x1

    .line 8
    const/4 v8, 0x0

    .line 9
    const/4 v4, 0x0

    .line 10
    move-object v1, p1

    .line 11
    move v2, p2

    .line 12
    move-object v7, p3

    .line 13
    move v9, p4

    .line 14
    invoke-direct/range {v0 .. v9}, Ll/i1y$a;-><init>(Ljava/util/List;ZIILandroid/graphics/Bitmap$CompressFormat;ZLjava/lang/String;ZZ)V

    .line 15
    .line 16
    .line 17
    invoke-direct {p0, v0}, Lrx/c;-><init>(Lrx/c$a;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public constructor <init>(Ljava/util/List;ZZ)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;ZZ)V"
        }
    .end annotation

    .line 23
    new-instance v0, Ll/i1y$a;

    const/4 v1, 0x0

    invoke-direct {v0, p1, p2, v1, p3}, Ll/i1y$a;-><init>(Ljava/util/List;ZLjava/lang/String;Z)V

    invoke-direct {p0, v0}, Lrx/c;-><init>(Lrx/c$a;)V

    return-void
.end method

.method public static bridge synthetic a()I
    .locals 1

    .line 1
    sget v0, Ll/i1y;->a:I

    return v0
.end method

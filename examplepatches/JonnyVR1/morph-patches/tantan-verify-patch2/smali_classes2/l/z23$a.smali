.class public Ll/z23$a;
.super Ll/pud;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/z23;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "a"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/pud<",
        "Ll/fb5<",
        "Ll/db5;",
        ">;",
        "Ll/fb5<",
        "Ll/db5;",
        ">;>;"
    }
.end annotation


# instance fields
.field public final c:I

.field public final d:I


# direct methods
.method public constructor <init>(Ll/z06;II)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/z06<",
            "Ll/fb5<",
            "Ll/db5;",
            ">;>;II)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1}, Ll/pud;-><init>(Ll/z06;)V

    .line 2
    .line 3
    .line 4
    iput p2, p0, Ll/z23$a;->c:I

    .line 5
    .line 6
    iput p3, p0, Ll/z23$a;->d:I

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public bridge synthetic h(Ljava/lang/Object;I)V
    .locals 0

    .line 1
    check-cast p1, Ll/fb5;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ll/z23$a;->q(Ll/fb5;I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final p(Ll/fb5;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/fb5<",
            "Ll/db5;",
            ">;)V"
        }
    .end annotation

    .line 1
    if-eqz p1, :cond_5

    .line 2
    .line 3
    invoke-virtual {p1}, Ll/fb5;->N()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    invoke-virtual {p1}, Ll/fb5;->B()Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    check-cast p1, Ll/db5;

    .line 15
    .line 16
    if-eqz p1, :cond_5

    .line 17
    .line 18
    invoke-interface {p1}, Ll/db5;->isClosed()Z

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-eqz v0, :cond_1

    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_1
    instance-of v0, p1, Ll/ib5;

    .line 26
    .line 27
    if-eqz v0, :cond_5

    .line 28
    .line 29
    check-cast p1, Ll/ib5;

    .line 30
    .line 31
    invoke-interface {p1}, Ll/ab5;->b0()Landroid/graphics/Bitmap;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    if-nez p1, :cond_2

    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_2
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getRowBytes()I

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    .line 43
    .line 44
    .line 45
    move-result v1

    .line 46
    mul-int/2addr v0, v1

    .line 47
    iget v1, p0, Ll/z23$a;->c:I

    .line 48
    .line 49
    if-ge v0, v1, :cond_3

    .line 50
    .line 51
    goto :goto_0

    .line 52
    :cond_3
    iget p0, p0, Ll/z23$a;->d:I

    .line 53
    .line 54
    if-le v0, p0, :cond_4

    .line 55
    .line 56
    goto :goto_0

    .line 57
    :cond_4
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->prepareToDraw()V

    .line 58
    .line 59
    .line 60
    :cond_5
    :goto_0
    return-void
.end method

.method public q(Ll/fb5;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/fb5<",
            "Ll/db5;",
            ">;I)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p0, p1}, Ll/z23$a;->p(Ll/fb5;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/pud;->o()Ll/z06;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    invoke-interface {p0, p1, p2}, Ll/z06;->b(Ljava/lang/Object;I)V

    .line 9
    .line 10
    .line 11
    return-void
.end method
